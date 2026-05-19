import StatInference.Optimization.Theorem131Taylor
import Mathlib.Analysis.Calculus.Gradient.Basic

/-!
# Chewi Theorem 13.1, Gradient-Facing Taylor Bridge

This module keeps the mathlib `gradient`/Frechet-derivative surface separate
from the heavier Taylor bridge.  The theorem-facing wrappers specialize the
V63 continuous matrix-Hessian interface to `gradient f`, with the Hessian
matrix family identified by `fderiv ℝ (gradient f)`.
-/

open Matrix
open scoped MatrixOrder Matrix.Norms.L2Operator
open scoped intervalIntegral BigOperators Topology

namespace StatInference
namespace Optimization

variable {n : Type*} [Fintype n] [DecidableEq n]

/--
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`.  The
second-derivative data is expressed as the equality between
`fderiv ℝ (gradient f)` and the matrix-induced Hessian CLM along the segment.
-/
theorem chewi131_taylor_norm_bound_of_continuous_matrix_gradient_fderiv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hhess_cont : ContinuousOn (fun z => chewi131MatrixCLM (Hfun z)) s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_diff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      DifferentiableAt ℝ (gradient f) (hessianSegmentPoint xStar x t))
    (hhess_eq : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      fderiv ℝ (gradient f) (hessianSegmentPoint xStar x t) =
        chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
    (hgrad_star : gradient f xStar = 0)
    (hnewton :
      xNext =
        x - chewi131MatrixCLM ((Hfun x)⁻¹) (gradient f x))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun x - Hfun (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / 2) * ‖(Hfun x)⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ) := by
  have hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t) := by
    intro t ht
    simpa [hhess_eq t ht] using (hgrad_diff t ht).hasFDerivAt
  exact
    chewi131_taylor_norm_bound_of_continuous_matrix_gradient_ftc
      (Hfun := Hfun) (s := s) (gamma := gamma) (grad := gradient f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet hhess_cont hseg hgrad hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, where the Hessian matrix family is identified with
`fderiv ℝ (gradient f)` along the `x_star -> x` segment.
-/
theorem chewi131_local_quadratic_step_of_continuous_matrix_gradient_fderiv_of_radius
    {Hstar : Matrix n n ℝ}
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    (hHstar : Hstar.IsHermitian) {alpha gamma : ℝ}
    (halpha : 0 < alpha) (hgamma : 0 < gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hH : (Hfun x).IsHermitian)
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ‖Hfun x - Hstar‖ ≤ gamma * ‖x - xStar‖)
    (hradius : ‖x - xStar‖ ≤ alpha / (2 * gamma))
    (hhess_cont : ContinuousOn (fun z => chewi131MatrixCLM (Hfun z)) s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_diff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      DifferentiableAt ℝ (gradient f) (hessianSegmentPoint xStar x t))
    (hhess_eq : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      fderiv ℝ (gradient f) (hessianSegmentPoint xStar x t) =
        chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
    (hgrad_star : gradient f xStar = 0)
    (hnewton :
      xNext =
        x - chewi131MatrixCLM ((Hfun x)⁻¹) (gradient f x))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun x - Hfun (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  have hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t) := by
    intro t ht
    simpa [hhess_eq t ht] using (hgrad_diff t ht).hasFDerivAt
  exact
    chewi131_local_quadratic_step_of_continuous_matrix_gradient_ftc_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (grad := gradient f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius hhess_cont hseg hgrad hgrad_star hnewton
      hlip_matrix

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`.  The
second-derivative hypothesis is stated as differentiability of `gradient f`
and equality of its Frechet derivative with the matrix-induced Hessian CLM
along every `x_star -> x_k` segment.
-/
theorem chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_fderiv_of_radius
    {Hstar : Matrix n n ℝ}
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    (hHstar : Hstar.IsHermitian)
    {alpha gamma : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x : ℕ -> EuclideanSpace ℝ n} {xStar : EuclideanSpace ℝ n}
    (hH : ∀ k, (Hfun (x k)).IsHermitian)
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ∀ k, ‖Hfun (x k) - Hstar‖ ≤ gamma * ‖x k - xStar‖)
    (hhess_cont : ContinuousOn (fun z => chewi131MatrixCLM (Hfun z)) s)
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hgrad_diff : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      DifferentiableAt ℝ (gradient f) (hessianSegmentPoint xStar (x k) t))
    (hhess_eq : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      fderiv ℝ (gradient f) (hessianSegmentPoint xStar (x k) t) =
        chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar (x k) t)))
    (hgrad_star : gradient f xStar = 0)
    (hnewton : ∀ k,
      x (k + 1) =
        x k - chewi131MatrixCLM ((Hfun (x k))⁻¹) (gradient f (x k)))
    (hlip_matrix : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun (x k) - Hfun (hessianSegmentPoint xStar (x k) t)‖ ≤
        gamma * (1 - t) * ‖x k - xStar‖)
    (hinit : ‖x 0 - xStar‖ ≤ alpha / (2 * gamma)) :
    ∀ k,
      ‖x (k + 1) - xStar‖ ≤
          (gamma / alpha) * ‖x k - xStar‖ ^ (2 : ℕ) ∧
        ‖x (k + 1) - xStar‖ ≤ (1 / 2) * ‖x k - xStar‖ := by
  have hgrad : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar (x k) t)))
        (hessianSegmentPoint xStar (x k) t) := by
    intro k t ht
    simpa [hhess_eq k t ht] using (hgrad_diff k t ht).hasFDerivAt
  exact
    chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_ftc_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (grad := gradient f) (x := x) (xStar := xStar)
      hH hlower hclose hhess_cont hseg hgrad hgrad_star hnewton
      hlip_matrix hinit

end Optimization
end StatInference
