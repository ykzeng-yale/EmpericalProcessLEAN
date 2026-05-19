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

/-- The Euclidean continuous linear map induced by a real square matrix. -/
noncomputable abbrev chewi131MatrixCLM (A : Matrix n n ℝ) :
    EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n :=
  ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
    LinearMap.toContinuousLinearMap) A

/--
The matrix L2 operator norm is exactly the operator norm of the induced
Euclidean continuous linear map, so subtracting Hessian matrices commutes with
the corresponding continuous-linear-map subtraction.
-/
theorem chewi131_matrix_clm_sub_norm_eq (A B : Matrix n n ℝ) :
    ‖chewi131MatrixCLM A - chewi131MatrixCLM B‖ = ‖A - B‖ := by
  rw [Matrix.l2_opNorm_def]
  let L :=
    (Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
      LinearMap.toContinuousLinearMap
  change ‖L A - L B‖ = ‖L (A - B)‖
  exact congrArg norm (L.map_sub A B).symm

/--
Matrix/Hessian bridge for the inverse-action hypothesis in Chewi Theorem 13.1:
if the supplied Hessian oracle at `x` is the Euclidean linear map induced by
`H`, then the matrix inverse acts as a left inverse on the displacement.
-/
theorem chewi131_matrix_inverse_action_of_hessian_matrix
    {H : Matrix n n ℝ} (hdet : IsUnit H.det)
    {hess : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n}
    {x xStar : EuclideanSpace ℝ n}
    (hhess :
      hess x =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap H)) :
    ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
      LinearMap.toContinuousLinearMap H⁻¹) (hess x (x - xStar)) =
      x - xStar := by
  have hmul : H⁻¹ * H = 1 := Matrix.nonsing_inv_mul H hdet
  rw [hhess]
  simp [Matrix.toLpLin_apply, Matrix.mulVec_mulVec, hmul]

/--
Matrix-shaped Hessian Lipschitz control implies the continuous-linear-map
operator-norm Lipschitz control consumed by the gradient-FTC Taylor bridge.
-/
theorem chewi131_hessian_lipschitz_clm_of_matrix_lipschitz
    {H : Matrix n n ℝ} {Hseg : ℝ -> Matrix n n ℝ} {gamma : ℝ}
    {hess : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n}
    {x xStar : EuclideanSpace ℝ n}
    (hhess_x :
      hess x =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap H))
    (hhess_seg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hess (hessianSegmentPoint xStar x t) =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap (Hseg t)))
    (hlip : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖H - Hseg t‖ ≤ gamma * (1 - t) * ‖x - xStar‖) :
    ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess x - hess (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖ := by
  intro t ht
  calc
    ‖hess x - hess (hessianSegmentPoint xStar x t)‖ =
        ‖H - Hseg t‖ := by
      rw [hhess_x, hhess_seg t ht]
      simpa [chewi131MatrixCLM] using
        chewi131_matrix_clm_sub_norm_eq H (Hseg t)
    _ ≤ gamma * (1 - t) * ‖x - xStar‖ := hlip t ht

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
Chewi Theorem 13.1 Taylor norm estimate in matrix-shaped Hessian notation.
The Hessian oracle is related to matrices only at the current point and along
the `x_star -> x` segment.
-/
theorem chewi131_taylor_norm_bound_of_matrix_gradient_ftc
    {H : Matrix n n ℝ} {Hseg : ℝ -> Matrix n n ℝ}
    {gamma : ℝ} (hgamma : 0 ≤ gamma) (hdet : IsUnit H.det)
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
    (hhess_x :
      hess x =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap H))
    (hhess_seg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hess (hessianSegmentPoint xStar x t) =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap (Hseg t)))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖H - Hseg t‖ ≤ gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / 2) * ‖H⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ) := by
  have hleft :
      ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
        LinearMap.toContinuousLinearMap H⁻¹) (hess x (x - xStar)) =
        x - xStar :=
    chewi131_matrix_inverse_action_of_hessian_matrix
      (H := H) hdet (hess := hess) (x := x) (xStar := xStar) hhess_x
  have hlip :
      ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
        ‖hess x - hess (hessianSegmentPoint xStar x t)‖ ≤
          gamma * (1 - t) * ‖x - xStar‖ :=
    chewi131_hessian_lipschitz_clm_of_matrix_lipschitz
      (H := H) (Hseg := Hseg) (gamma := gamma)
      (hess := hess) (x := x) (xStar := xStar)
      hhess_x hhess_seg hlip_matrix
  exact
    chewi131_taylor_norm_bound_of_gradient_ftc
      (H := H) (gamma := gamma) (x := x) (xNext := xNext)
      (xStar := xStar) (grad := grad) (hess := hess)
      hgamma hgrad hint hgrad_star hnewton hleft hlip

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
Chewi Theorem 13.1 one-step local quadratic convergence in matrix-shaped
Hessian notation.
-/
theorem chewi131_local_quadratic_step_of_matrix_gradient_ftc
    {Hstar H : Matrix n n ℝ} {Hseg : ℝ -> Matrix n n ℝ}
    (hHstar : Hstar.IsHermitian) (hH : H.IsHermitian)
    {alpha gamma : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    (hdet : IsUnit H.det)
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
    (hhess_x :
      hess x =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap H))
    (hhess_seg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hess (hessianSegmentPoint xStar x t) =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap (Hseg t)))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖H - Hseg t‖ ≤ gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  exact
    chewi131_local_quadratic_step_of_taylor_bound hHstar hH halpha hgamma
      hlower hclose hradius
      (chewi131_taylor_norm_bound_of_matrix_gradient_ftc
        (H := H) (Hseg := Hseg) (gamma := gamma)
        (x := x) (xNext := xNext) (xStar := xStar)
        (grad := grad) (hess := hess) (le_of_lt hgamma) hdet
        hgrad hint hgrad_star hnewton hhess_x hhess_seg hlip_matrix)

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

/--
Chewi Theorem 13.1 sequence recurrence in matrix-shaped Hessian notation.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_gradient_ftc
    {Hstar : Matrix n n ℝ} {H : ℕ -> Matrix n n ℝ}
    {Hseg : ℕ -> ℝ -> Matrix n n ℝ}
    (hHstar : Hstar.IsHermitian) (hH : ∀ k, (H k).IsHermitian)
    {alpha gamma : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    (hdet : ∀ k, IsUnit (H k).det)
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
    (hhess_x : ∀ k,
      hess (x k) =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap (H k)))
    (hhess_seg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hess (hessianSegmentPoint xStar (x k) t) =
        ((Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
          LinearMap.toContinuousLinearMap (Hseg k t)))
    (hlip_matrix : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖H k - Hseg k t‖ ≤ gamma * (1 - t) * ‖x k - xStar‖)
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
    chewi131_taylor_norm_bound_of_matrix_gradient_ftc
      (H := H k) (Hseg := Hseg k) (gamma := gamma)
      (x := x k) (xNext := x (k + 1)) (xStar := xStar)
      (grad := grad) (hess := hess) (le_of_lt hgamma) (hdet k)
      (hgrad k) (hint k) hgrad_star (hnewton k) (hhess_x k)
      (hhess_seg k) (hlip_matrix k)

end Optimization
end StatInference
