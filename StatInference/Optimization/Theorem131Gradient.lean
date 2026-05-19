import StatInference.Optimization.Theorem131Taylor
import Mathlib.Analysis.Calculus.Gradient.Basic
import Mathlib.Analysis.Calculus.MeanValue

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
The matrix-to-continuous-linear-map bridge used in Chewi Theorem 13.1 is an
isometry for the matrix L2 operator norm and the induced operator norm.
-/
theorem chewi131MatrixCLM_isometry :
    Isometry
      (chewi131MatrixCLM :
        Matrix n n ℝ -> EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n) := by
  refine Isometry.of_dist_eq ?_
  intro A B
  rw [dist_eq_norm, dist_eq_norm]
  exact chewi131_matrix_clm_sub_norm_eq A B

/-- The matrix-to-continuous-linear-map bridge is continuous. -/
theorem chewi131MatrixCLM_continuous :
    Continuous
      (chewi131MatrixCLM :
        Matrix n n ℝ -> EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n) :=
  chewi131MatrixCLM_isometry.continuous

/--
A source-facing matrix-continuity assumption gives the CLM-valued Hessian
continuity consumed by the Taylor bridge.
-/
theorem chewi131MatrixCLM_continuousOn_comp
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    (hHfun_cont : ContinuousOn Hfun s) :
    ContinuousOn (fun z => chewi131MatrixCLM (Hfun z)) s := by
  simpa [Function.comp_def] using
    chewi131MatrixCLM_continuous.comp_continuousOn hHfun_cont

/--
If the derivative of `gradient f` is locally the matrix-induced Hessian CLM
and the Hessian matrix family is continuous at `z`, then `gradient f` is
strictly Frechet differentiable there with that Hessian.
-/
theorem chewi131_gradient_hasStrictFDerivAt_of_eventually_hasFDerivAt_matrix
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {f : EuclideanSpace ℝ n -> ℝ}
    {z : EuclideanSpace ℝ n}
    (hgrad : ∀ᶠ y in 𝓝 z,
      HasFDerivAt (gradient f) (chewi131MatrixCLM (Hfun y)) y)
    (hHfun_cont : ContinuousAt Hfun z) :
    HasStrictFDerivAt (gradient f) (chewi131MatrixCLM (Hfun z)) z := by
  exact
    hasStrictFDerivAt_of_hasFDerivAt_of_continuousAt hgrad
      (chewi131MatrixCLM_continuous.continuousAt.comp hHfun_cont)

omit [DecidableEq n] in
/--
Twice continuous differentiability of the scalar objective gives `C^1`
regularity of mathlib's `gradient` by composing the derivative map with the
Riesz isometry.
-/
theorem chewi131_gradient_contDiffAt_one_of_contDiffAt_two
    {f : EuclideanSpace ℝ n -> ℝ}
    {z : EuclideanSpace ℝ n}
    (hf : ContDiffAt ℝ 2 f z) :
    ContDiffAt ℝ 1 (gradient f) z := by
  have hfderiv : ContDiffAt ℝ 1 (fderiv ℝ f) z := by
    simpa using (hf.fderiv_right_succ (n := 1))
  simpa [gradient, Function.comp_def] using
    (ContDiffAt.comp z
      (((InnerProductSpace.toDual ℝ (EuclideanSpace ℝ n)).symm.contDiff).contDiffAt)
      hfderiv)

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
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`, using a
source-facing continuity assumption on the Hessian matrix family `Hfun`.
-/
theorem chewi131_taylor_norm_bound_of_matrix_continuous_gradient_fderiv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : ContinuousOn Hfun s)
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
  exact
    chewi131_taylor_norm_bound_of_continuous_matrix_gradient_fderiv
      (Hfun := Hfun) (s := s) (gamma := gamma) (f := f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet (chewi131MatrixCLM_continuousOn_comp hHfun_cont) hseg
      hgrad_diff hhess_eq hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`, using
the source-shaped second-derivative fact directly as a Frechet derivative of
the gradient.
-/
theorem chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasFDeriv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t))
    (hgrad_star : gradient f xStar = 0)
    (hnewton :
      xNext =
        x - chewi131MatrixCLM ((Hfun x)⁻¹) (gradient f x))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun x - Hfun (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / 2) * ‖(Hfun x)⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ) := by
  exact
    chewi131_taylor_norm_bound_of_continuous_matrix_gradient_ftc
      (Hfun := Hfun) (s := s) (gamma := gamma) (grad := gradient f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet (chewi131MatrixCLM_continuousOn_comp hHfun_cont) hseg
      hgrad hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`,
consuming the source Hessian matrix family as a strict Frechet derivative of
the gradient along the segment.
-/
theorem chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasStrictFDeriv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_strict : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t))
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
    exact (hgrad_strict t ht).hasFDerivAt
  exact
    chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasFDeriv
      (Hfun := Hfun) (s := s) (gamma := gamma) (f := f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet hHfun_cont hseg hgrad hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`, deriving
strict differentiability of the gradient from `C^1` regularity of the gradient
and the Hessian matrix identification along the segment.
-/
theorem chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_fderiv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_contDiff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 1 (gradient f) (hessianSegmentPoint xStar x t))
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
  have hgrad_strict : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t) := by
    intro t ht
    simpa [hhess_eq t ht] using
      (hgrad_contDiff t ht).hasStrictFDerivAt one_ne_zero
  exact
    chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasStrictFDeriv
      (Hfun := Hfun) (s := s) (gamma := gamma) (f := f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet hHfun_cont hseg hgrad_strict hgrad_star hnewton
      hlip_matrix

/--
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`, deriving
the `C^1` gradient regularity from pointwise `C^2` regularity of `f`.
-/
theorem chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_two_fderiv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hf_contDiff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 2 f (hessianSegmentPoint xStar x t))
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
  have hgrad_contDiff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 1 (gradient f) (hessianSegmentPoint xStar x t) := by
    intro t ht
    exact chewi131_gradient_contDiffAt_one_of_contDiffAt_two (hf_contDiff t ht)
  exact
    chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_fderiv
      (Hfun := Hfun) (s := s) (gamma := gamma) (f := f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet hHfun_cont hseg hgrad_contDiff hhess_eq hgrad_star
      hnewton hlip_matrix

/--
Chewi Theorem 13.1 Taylor norm estimate with mathlib's `gradient f`, deriving
strict differentiability of the gradient from a local Frechet-derivative model
and global continuity of the Hessian matrix family.
-/
theorem chewi131_taylor_norm_bound_of_continuous_matrix_gradient_eventually_hasFDeriv
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : Continuous Hfun)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_eventually : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ∀ᶠ y in 𝓝 (hessianSegmentPoint xStar x t),
        HasFDerivAt (gradient f) (chewi131MatrixCLM (Hfun y)) y)
    (hgrad_star : gradient f xStar = 0)
    (hnewton :
      xNext =
        x - chewi131MatrixCLM ((Hfun x)⁻¹) (gradient f x))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun x - Hfun (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / 2) * ‖(Hfun x)⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ) := by
  have hgrad_strict : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t) := by
    intro t ht
    exact
      chewi131_gradient_hasStrictFDerivAt_of_eventually_hasFDerivAt_matrix
        (hgrad_eventually t ht) hHfun_cont.continuousAt
  exact
    chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasStrictFDeriv
      (Hfun := Hfun) (s := s) (gamma := gamma) (f := f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet hHfun_cont.continuousOn hseg hgrad_strict hgrad_star
      hnewton hlip_matrix

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
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, using continuity of the Hessian matrix family instead of a
precomposed CLM-valued continuity assumption.
-/
theorem chewi131_local_quadratic_step_of_matrix_continuous_gradient_fderiv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
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
  exact
    chewi131_local_quadratic_step_of_continuous_matrix_gradient_fderiv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius
      (chewi131MatrixCLM_continuousOn_comp hHfun_cont) hseg hgrad_diff
      hhess_eq hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, consuming the Hessian matrix family as the direct Frechet
derivative of the gradient.
-/
theorem chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasFDeriv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t))
    (hgrad_star : gradient f xStar = 0)
    (hnewton :
      xNext =
        x - chewi131MatrixCLM ((Hfun x)⁻¹) (gradient f x))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun x - Hfun (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  exact
    chewi131_local_quadratic_step_of_continuous_matrix_gradient_ftc_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (grad := gradient f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius
      (chewi131MatrixCLM_continuousOn_comp hHfun_cont) hseg hgrad
      hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, consuming the Hessian matrix family as a strict Frechet
derivative of the gradient.
-/
theorem chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_strict : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t))
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
    exact (hgrad_strict t ht).hasFDerivAt
  exact
    chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius hHfun_cont hseg hgrad hgrad_star hnewton
      hlip_matrix

/--
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, deriving strict differentiability of the gradient from `C^1`
regularity of the gradient and the Hessian matrix identification along the
segment.
-/
theorem chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_contDiff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 1 (gradient f) (hessianSegmentPoint xStar x t))
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
  have hgrad_strict : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t) := by
    intro t ht
    simpa [hhess_eq t ht] using
      (hgrad_contDiff t ht).hasStrictFDerivAt one_ne_zero
  exact
    chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius hHfun_cont hseg hgrad_strict hgrad_star
      hnewton hlip_matrix

/--
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, deriving the `C^1` gradient regularity from pointwise `C^2`
regularity of `f`.
-/
theorem chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_two_fderiv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hf_contDiff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 2 f (hessianSegmentPoint xStar x t))
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
  have hgrad_contDiff : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 1 (gradient f) (hessianSegmentPoint xStar x t) := by
    intro t ht
    exact chewi131_gradient_contDiffAt_one_of_contDiffAt_two (hf_contDiff t ht)
  exact
    chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius hHfun_cont hseg hgrad_contDiff hhess_eq
      hgrad_star hnewton hlip_matrix

/--
Chewi Theorem 13.1 one-step local quadratic convergence with mathlib's
`gradient f`, deriving the strict gradient derivative from a local
Frechet-derivative model and continuous Hessian matrix family.
-/
theorem chewi131_local_quadratic_step_of_continuous_matrix_gradient_eventually_hasFDeriv_of_radius
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
    (hHfun_cont : Continuous Hfun)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hgrad_eventually : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ∀ᶠ y in 𝓝 (hessianSegmentPoint xStar x t),
        HasFDerivAt (gradient f) (chewi131MatrixCLM (Hfun y)) y)
    (hgrad_star : gradient f xStar = 0)
    (hnewton :
      xNext =
        x - chewi131MatrixCLM ((Hfun x)⁻¹) (gradient f x))
    (hlip_matrix : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖Hfun x - Hfun (hessianSegmentPoint xStar x t)‖ ≤
        gamma * (1 - t) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  have hgrad_strict : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar x t)))
        (hessianSegmentPoint xStar x t) := by
    intro t ht
    exact
      chewi131_gradient_hasStrictFDerivAt_of_eventually_hasFDerivAt_matrix
        (hgrad_eventually t ht) hHfun_cont.continuousAt
  exact
    chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius hHfun_cont.continuousOn hseg hgrad_strict
      hgrad_star hnewton hlip_matrix

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

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, using a
source-facing continuity assumption on the Hessian matrix family.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_fderiv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
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
  exact
    chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_fderiv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xStar := xStar)
      hH hlower hclose (chewi131MatrixCLM_continuousOn_comp hHfun_cont) hseg
      hgrad_diff hhess_eq hgrad_star hnewton hlip_matrix hinit

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, consuming
the source Hessian matrix family as the direct Frechet derivative of the
gradient along every `x_star -> x_k` segment.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasFDeriv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hgrad : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar (x k) t)))
        (hessianSegmentPoint xStar (x k) t))
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
  exact
    chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_ftc_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (grad := gradient f) (x := x) (xStar := xStar)
      hH hlower hclose (chewi131MatrixCLM_continuousOn_comp hHfun_cont) hseg
      hgrad hgrad_star hnewton hlip_matrix hinit

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, consuming
the source Hessian matrix family as a strict Frechet derivative of the
gradient along every `x_star -> x_k` segment.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hgrad_strict : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar (x k) t)))
        (hessianSegmentPoint xStar (x k) t))
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
    exact (hgrad_strict k t ht).hasFDerivAt
  exact
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xStar := xStar)
      hH hlower hclose hHfun_cont hseg hgrad hgrad_star hnewton hlip_matrix
      hinit

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, deriving
strict differentiability of the gradient from `C^1` regularity of the gradient
and the Hessian matrix identification along every `x_star -> x_k` segment.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hgrad_contDiff : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 1 (gradient f) (hessianSegmentPoint xStar (x k) t))
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
  have hgrad_strict : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar (x k) t)))
        (hessianSegmentPoint xStar (x k) t) := by
    intro k t ht
    simpa [hhess_eq k t ht] using
      (hgrad_contDiff k t ht).hasStrictFDerivAt one_ne_zero
  exact
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xStar := xStar)
      hH hlower hclose hHfun_cont hseg hgrad_strict hgrad_star hnewton
      hlip_matrix hinit

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, deriving
the `C^1` gradient regularity from pointwise `C^2` regularity of `f`.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_fderiv_of_radius
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
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hf_contDiff : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 2 f (hessianSegmentPoint xStar (x k) t))
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
  have hgrad_contDiff : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ContDiffAt ℝ 1 (gradient f) (hessianSegmentPoint xStar (x k) t) := by
    intro k t ht
    exact chewi131_gradient_contDiffAt_one_of_contDiffAt_two (hf_contDiff k t ht)
  exact
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xStar := xStar)
      hH hlower hclose hHfun_cont hseg hgrad_contDiff hhess_eq hgrad_star
      hnewton hlip_matrix hinit

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, deriving
the strict gradient derivative from a local Frechet-derivative model and
continuous Hessian matrix family along every `x_star -> x_k` segment.
-/
theorem chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_eventually_hasFDeriv_of_radius
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
    (hHfun_cont : Continuous Hfun)
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hgrad_eventually : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      ∀ᶠ y in 𝓝 (hessianSegmentPoint xStar (x k) t),
        HasFDerivAt (gradient f) (chewi131MatrixCLM (Hfun y)) y)
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
  have hgrad_strict : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasStrictFDerivAt (gradient f)
        (chewi131MatrixCLM (Hfun (hessianSegmentPoint xStar (x k) t)))
        (hessianSegmentPoint xStar (x k) t) := by
    intro k t ht
    exact
      chewi131_gradient_hasStrictFDerivAt_of_eventually_hasFDerivAt_matrix
        (hgrad_eventually k t ht) hHfun_cont.continuousAt
  exact
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xStar := xStar)
      hH hlower hclose hHfun_cont.continuousOn hseg hgrad_strict hgrad_star
      hnewton hlip_matrix hinit

end Optimization
end StatInference
