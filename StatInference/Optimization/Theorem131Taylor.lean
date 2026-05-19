import StatInference.Optimization.Theorem131
import StatInference.Optimization.InteriorPoint

/-!
# Chewi Theorem 13.1, Taylor Remainder Bridge

This module discharges another layer of the Chewi Theorem 13.1 Taylor/Newton
remainder gate.  It reuses the segment-gradient FTC infrastructure from the
interior-point lane, then feeds the resulting integral representation and
pointwise Hessian-Lipschitz bound into the recurrence layer in `Theorem131`.
-/

open Matrix
open scoped MatrixOrder Matrix.Norms.L2Operator
open scoped intervalIntegral BigOperators Topology

namespace StatInference
namespace Optimization

section Hilbert

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Theorem 13.1 Taylor identity layer in a Hilbert-space supplied-Hessian
form.  The gradient FTC along the segment from `x_star` to `x` turns the
Newton update into
`x_+ - x_star = H_x^{-1} ∫_0^1 (H_x - Hess(z_t))(x - x_star) dt`.
-/
theorem chewi131_integral_remainder_identity_of_gradient_ftc
    [CompleteSpace E]
    {grad : E -> E} {hess : E -> E →L[ℝ] E}
    {Hinv : E →L[ℝ] E} {x xNext xStar : E}
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint xStar x t))
        (hessianSegmentPoint xStar x t))
    (hint : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint xStar x t) (x - xStar))
      MeasureTheory.volume (0 : ℝ) 1)
    (hgrad_star : grad xStar = 0)
    (hnewton : xNext = x - Hinv (grad x))
    (hleft : Hinv (hess x (x - xStar)) = x - xStar) :
    xNext - xStar =
      Hinv (∫ t in (0 : ℝ)..1,
        hess x (x - xStar) -
          hess (hessianSegmentPoint xStar x t) (x - xStar)) := by
  let d : E := x - xStar
  have hFTC :
      (∫ t in (0 : ℝ)..1,
          hess (hessianSegmentPoint xStar x t) d) =
        grad x - grad xStar := by
    simpa [d] using
      hessianSegmentGradient_integral_eq_sub_of_hasFDerivAt
        (grad := grad) (hess := hess) (x := xStar) (y := x)
        hgrad (by simpa [d] using hint)
  have hconst_int : IntervalIntegrable (fun _ : ℝ => hess x d)
      MeasureTheory.volume (0 : ℝ) 1 :=
    intervalIntegrable_const
  have hintegral :
      (∫ t in (0 : ℝ)..1,
          hess x d - hess (hessianSegmentPoint xStar x t) d) =
        hess x d - (grad x - grad xStar) := by
    rw [intervalIntegral.integral_sub hconst_int (by simpa [d] using hint)]
    rw [hFTC]
    simp
  have hleft' : x - xStar = Hinv (hess x d) := by
    simpa [d] using hleft.symm
  calc
    xNext - xStar = (x - xStar) - Hinv (grad x) := by
      rw [hnewton]
      abel
    _ = Hinv (hess x d) - Hinv (grad x) := by
      rw [hleft']
    _ = Hinv (hess x d - grad x) := by
      simp
    _ = Hinv (hess x d - (grad x - grad xStar)) := by
      simp [hgrad_star]
    _ = Hinv (∫ t in (0 : ℝ)..1,
          hess x d - hess (hessianSegmentPoint xStar x t) d) := by
      rw [hintegral]
    _ = Hinv (∫ t in (0 : ℝ)..1,
          hess x (x - xStar) -
            hess (hessianSegmentPoint xStar x t) (x - xStar)) := by
      simp [d]

/--
Chewi Theorem 13.1 pointwise Taylor remainder bound from a Hessian-Lipschitz
operator-norm estimate along the segment from `x_star` to `x`.
-/
theorem chewi131_integral_remainder_pointwise_bound_of_hessian_lipschitz
    {hess : E -> E →L[ℝ] E} {gamma : ℝ} {x xStar : E}
    (hlip : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess x - hess (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess x (x - xStar) -
          hess (hessianSegmentPoint xStar x t) (x - xStar)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖ ^ (2 : ℕ) := by
  intro t ht
  let d : E := x - xStar
  calc
    ‖hess x (x - xStar) -
        hess (hessianSegmentPoint xStar x t) (x - xStar)‖ =
        ‖(hess x - hess (hessianSegmentPoint xStar x t)) d‖ := by
      simp [d]
    _ ≤ ‖hess x - hess (hessianSegmentPoint xStar x t)‖ * ‖d‖ :=
        (hess x - hess (hessianSegmentPoint xStar x t)).le_opNorm d
    _ ≤ (gamma * (1 - t) * ‖x - xStar‖) * ‖d‖ :=
        mul_le_mul_of_nonneg_right (hlip t ht) (norm_nonneg d)
    _ = gamma * (1 - t) * ‖x - xStar‖ ^ (2 : ℕ) := by
        simp [d]
        ring

end Hilbert

variable {n : Type*} [Fintype n] [DecidableEq n]

/--
Chewi Theorem 13.1 Taylor norm estimate from gradient FTC plus a
Hessian-Lipschitz operator-norm bound.  This removes the V60 supplied
integral-remainder data by constructing it from the segment gradient theorem.
-/
theorem chewi131_taylor_norm_bound_of_gradient_ftc
    {H : Matrix n n ℝ} {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {grad : EuclideanSpace ℝ n -> EuclideanSpace ℝ n}
    {hess : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint xStar x t))
        (hessianSegmentPoint xStar x t))
    (hint : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint xStar x t) (x - xStar))
      MeasureTheory.volume (0 : ℝ) 1)
    (hgrad_star : grad xStar = 0)
    (hnewton :
      xNext =
        x -
          ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
            LinearMap.toContinuousLinearMap H⁻¹) (grad x))
    (hleft :
      ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
        LinearMap.toContinuousLinearMap H⁻¹) (hess x (x - xStar)) =
        x - xStar)
    (hlip : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess x - hess (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / 2) * ‖H⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ) := by
  let Hinv : EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n :=
    (Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
      LinearMap.toContinuousLinearMap H⁻¹
  let remainder : ℝ -> EuclideanSpace ℝ n := fun t =>
    hess x (x - xStar) -
      hess (hessianSegmentPoint xStar x t) (x - xStar)
  have hrem_int : IntervalIntegrable remainder MeasureTheory.volume (0 : ℝ) 1 := by
    have hconst_int : IntervalIntegrable
        (fun _ : ℝ => hess x (x - xStar))
        MeasureTheory.volume (0 : ℝ) 1 :=
      intervalIntegrable_const
    exact hconst_int.sub hint
  have hidentity :
      xNext - xStar =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap H⁻¹)
          (∫ t in (0 : ℝ)..1, remainder t) := by
    simpa [Hinv, remainder] using
      chewi131_integral_remainder_identity_of_gradient_ftc
        (grad := grad) (hess := hess) (Hinv := Hinv)
        (x := x) (xNext := xNext) (xStar := xStar)
        hgrad hint hgrad_star (by simpa [Hinv] using hnewton)
        (by simpa [Hinv] using hleft)
  have hbound : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖remainder t‖ ≤ gamma * (1 - t) * ‖x - xStar‖ ^ (2 : ℕ) := by
    simpa [remainder] using
      chewi131_integral_remainder_pointwise_bound_of_hessian_lipschitz
        (hess := hess) (gamma := gamma) (x := x) (xStar := xStar)
        hlip
  exact
    chewi131_taylor_norm_bound_of_integral_remainder
      (H := H) (gamma := gamma) (x := x) (xNext := xNext)
      (xStar := xStar) (remainder := remainder) hgamma
      hrem_int hidentity hbound

/--
Chewi Theorem 13.1 one-step local quadratic convergence from gradient FTC and
Hessian-Lipschitz data.
-/
theorem chewi131_local_quadratic_step_of_gradient_ftc
    {Hstar H : Matrix n n ℝ} (hHstar : Hstar.IsHermitian)
    (hH : H.IsHermitian) {alpha gamma : ℝ} (halpha : 0 < alpha)
    (hgamma : 0 < gamma)
    {grad : EuclideanSpace ℝ n -> EuclideanSpace ℝ n}
    {hess : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ‖H - Hstar‖ ≤ gamma * ‖x - xStar‖)
    (hradius : ‖x - xStar‖ ≤ alpha / (2 * gamma))
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint xStar x t))
        (hessianSegmentPoint xStar x t))
    (hint : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint xStar x t) (x - xStar))
      MeasureTheory.volume (0 : ℝ) 1)
    (hgrad_star : grad xStar = 0)
    (hnewton :
      xNext =
        x -
          ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
            LinearMap.toContinuousLinearMap H⁻¹) (grad x))
    (hleft :
      ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
        LinearMap.toContinuousLinearMap H⁻¹) (hess x (x - xStar)) =
        x - xStar)
    (hlip : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess x - hess (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  exact
    chewi131_local_quadratic_step_of_taylor_bound hHstar hH halpha hgamma
      hlower hclose hradius
      (chewi131_taylor_norm_bound_of_gradient_ftc
        (H := H) (gamma := gamma) (x := x) (xNext := xNext)
        (xStar := xStar) (grad := grad) (hess := hess)
        (le_of_lt hgamma) hgrad hint hgrad_star hnewton hleft hlip)

/--
Chewi Theorem 13.1 sequence recurrence from gradient FTC and Hessian-Lipschitz
data at each Newton iterate.
-/
theorem chewi131_local_quadratic_recurrence_of_gradient_ftc
    {Hstar : Matrix n n ℝ} {H : ℕ -> Matrix n n ℝ}
    (hHstar : Hstar.IsHermitian) (hH : ∀ k, (H k).IsHermitian)
    {alpha gamma : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    {grad : EuclideanSpace ℝ n -> EuclideanSpace ℝ n}
    {hess : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n}
    {x : ℕ -> EuclideanSpace ℝ n} {xStar : EuclideanSpace ℝ n}
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ∀ k, ‖H k - Hstar‖ ≤ gamma * ‖x k - xStar‖)
    (hgrad : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint xStar (x k) t))
        (hessianSegmentPoint xStar (x k) t))
    (hint : ∀ k, IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint xStar (x k) t) (x k - xStar))
      MeasureTheory.volume (0 : ℝ) 1)
    (hgrad_star : grad xStar = 0)
    (hnewton : ∀ k,
      x (k + 1) =
        x k -
          ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
            LinearMap.toContinuousLinearMap (H k)⁻¹) (grad (x k)))
    (hleft : ∀ k,
      ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
        LinearMap.toContinuousLinearMap (H k)⁻¹) (hess (x k) (x k - xStar)) =
        x k - xStar)
    (hlip : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess (x k) - hess (hessianSegmentPoint xStar (x k) t)‖ ≤
        gamma * (1 - t) * ‖x k - xStar‖)
    (hinit : ‖x 0 - xStar‖ ≤ alpha / (2 * gamma)) :
    ∀ k,
      ‖x (k + 1) - xStar‖ ≤
          (gamma / alpha) * ‖x k - xStar‖ ^ (2 : ℕ) ∧
        ‖x (k + 1) - xStar‖ ≤ (1 / 2) * ‖x k - xStar‖ := by
  refine
    chewi131_local_quadratic_recurrence_of_taylor_bound hHstar hH
      halpha hgamma hlower hclose ?_ hinit
  intro k
  exact
    chewi131_taylor_norm_bound_of_gradient_ftc
      (H := H k) (gamma := gamma) (x := x k) (xNext := x (k + 1))
      (xStar := xStar) (grad := grad) (hess := hess)
      (le_of_lt hgamma) (hgrad k) (hint k) hgrad_star
      (hnewton k) (hleft k) (hlip k)

end Optimization
end StatInference
