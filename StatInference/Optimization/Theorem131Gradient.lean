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

omit [DecidableEq n] in
/--
If the dual-valued derivative `fderiv ℝ f` has Frechet derivative `B`, then
mathlib's `gradient f` has Frechet derivative given by Riesz-dualizing `B`.
-/
theorem chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin
    {f : EuclideanSpace ℝ n -> ℝ} {z : EuclideanSpace ℝ n}
    (B : EuclideanSpace ℝ n →L⋆[ℝ] StrongDual ℝ (EuclideanSpace ℝ n))
    (h : HasFDerivAt (fun y => fderiv ℝ f y) B.toContinuousLinearMap z) :
    HasFDerivAt (gradient f) (InnerProductSpace.continuousLinearMapOfBilin B) z := by
  have hiso := ((InnerProductSpace.toDual ℝ (EuclideanSpace ℝ n)).symm.hasFDerivAt
    (x := fderiv ℝ f z))
  have hcomp := hiso.comp z h
  simpa [gradient, InnerProductSpace.continuousLinearMapOfBilin, Function.comp_def] using hcomp

omit [DecidableEq n] in
/--
The corresponding Hessian identification for `fderiv ℝ (gradient f)`.
-/
theorem chewi131_fderiv_gradient_eq_of_hasFDerivAt_fderiv_bilin
    {f : EuclideanSpace ℝ n -> ℝ} {z : EuclideanSpace ℝ n}
    (B : EuclideanSpace ℝ n →L⋆[ℝ] StrongDual ℝ (EuclideanSpace ℝ n))
    (h : HasFDerivAt (fun y => fderiv ℝ f y) B.toContinuousLinearMap z) :
    fderiv ℝ (gradient f) z = InnerProductSpace.continuousLinearMapOfBilin B := by
  exact (chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin B h).fderiv

omit [DecidableEq n] in
/--
The source bilinear Hessian interface obtained by currying mathlib's second
iterated Frechet derivative.
-/
noncomputable def chewi131SecondFDerivBilin
    (f : EuclideanSpace ℝ n -> ℝ) (z : EuclideanSpace ℝ n) :
    EuclideanSpace ℝ n →L⋆[ℝ] StrongDual ℝ (EuclideanSpace ℝ n) :=
  ((continuousMultilinearCurryFin1 ℝ (EuclideanSpace ℝ n) ℝ).toContinuousLinearEquiv.toContinuousLinearMap).comp
    (iteratedFDeriv ℝ 2 f z).curryLeft

omit [DecidableEq n] in
/--
The curried second iterated derivative is exactly the Frechet derivative of
the dual-valued derivative map.
-/
theorem chewi131SecondFDerivBilin_toContinuousLinearMap_eq_fderiv_fderiv
    {f : EuclideanSpace ℝ n -> ℝ} {z : EuclideanSpace ℝ n} :
    (chewi131SecondFDerivBilin f z).toContinuousLinearMap =
      fderiv ℝ (fun y => fderiv ℝ f y) z := by
  ext u v
  change
    (continuousMultilinearCurryFin1 ℝ (EuclideanSpace ℝ n) ℝ
        ((iteratedFDeriv ℝ 2 f z).curryLeft u)) v =
      ((fderiv ℝ (fun y => fderiv ℝ f y) z) u) v
  simp [continuousMultilinearCurryFin1_apply,
    ContinuousMultilinearMap.curryLeft_apply, iteratedFDeriv_two_apply]

omit [DecidableEq n] in
/--
Pointwise `C^2` regularity of the scalar objective supplies the V70 bilinear
second-derivative hypothesis.
-/
theorem chewi131SecondFDerivBilin_hasFDerivAt_of_contDiffAt_two
    {f : EuclideanSpace ℝ n -> ℝ} {z : EuclideanSpace ℝ n}
    (hf : ContDiffAt ℝ 2 f z) :
    HasFDerivAt (fun y => fderiv ℝ f y)
      (chewi131SecondFDerivBilin f z).toContinuousLinearMap z := by
  have hfderiv : ContDiffAt ℝ 1 (fun y => fderiv ℝ f y) z := by
    simpa using (hf.fderiv_right_succ (n := 1))
  have hdiff : DifferentiableAt ℝ (fun y => fderiv ℝ f y) z :=
    hfderiv.differentiableAt_one
  rw [chewi131SecondFDerivBilin_toContinuousLinearMap_eq_fderiv_fderiv]
  exact hdiff.hasFDerivAt

/--
The matrix Hessian of the positive-orthant logarithmic barrier.  This is the
diagonal matrix whose `i`th diagonal entry is `x_i^{-2}`.
-/
noncomputable def positiveOrthantNegLogHessMatrix {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) : Matrix (Fin d) (Fin d) ℝ :=
  Matrix.diagonal fun i : Fin d => (x i) ^ (-2 : ℤ)

/-- The positive-orthant logarithmic-barrier Hessian matrix is Hermitian. -/
theorem positiveOrthantNegLogHessMatrix_isHermitian {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    (positiveOrthantNegLogHessMatrix x).IsHermitian := by
  simp [positiveOrthantNegLogHessMatrix]

/--
The matrix Hessian of the positive-orthant logarithmic barrier induces exactly
the coordinatewise diagonal Hessian continuous-linear map.
-/
theorem positiveOrthantNegLogHessMatrix_clm_eq {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    chewi131MatrixCLM (positiveOrthantNegLogHessMatrix x) =
      positiveOrthantNegLogHessCLM x := by
  apply ContinuousLinearMap.ext
  intro v
  ext i
  simp [chewi131MatrixCLM, positiveOrthantNegLogHessMatrix,
    positiveOrthantNegLogHessCLM, Matrix.toEuclideanLin, Matrix.toLpLin_apply,
    Matrix.mulVec_diagonal]

/-- The positive-orthant logarithmic-barrier CLM Hessian is continuous on the orthant. -/
theorem positiveOrthantNegLogHessCLM_continuousOn {d : ℕ} :
    ContinuousOn positiveOrthantNegLogHessCLM (positiveOrthant (d := d)) := by
  intro x hx
  exact (positiveOrthantNegLogHessCLM_hasFDerivAt hx).continuousAt.continuousWithinAt

/-- The positive-orthant logarithmic-barrier matrix Hessian is continuous on the orthant. -/
theorem positiveOrthantNegLogHessMatrix_continuousOn {d : ℕ} :
    ContinuousOn positiveOrthantNegLogHessMatrix (positiveOrthant (d := d)) := by
  have hcomp : ContinuousOn
      (fun x : EuclideanSpace ℝ (Fin d) =>
        chewi131MatrixCLM (positiveOrthantNegLogHessMatrix x))
      (positiveOrthant (d := d)) :=
    (positiveOrthantNegLogHessCLM_continuousOn (d := d)).congr
      (fun x _hx => positiveOrthantNegLogHessMatrix_clm_eq x)
  exact (chewi131MatrixCLM_isometry (n := Fin d)).comp_continuousOn_iff.mp hcomp

/--
On the positive orthant, mathlib's `gradient` of the logarithmic barrier has
the matrix-induced diagonal Hessian as its Frechet derivative.
-/
theorem positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    HasFDerivAt (gradient positiveOrthantNegLogBarrier)
      (chewi131MatrixCLM (positiveOrthantNegLogHessMatrix x)) x := by
  rw [positiveOrthantNegLogHessMatrix_clm_eq]
  exact positiveOrthantNegLogBarrier_gradient_hasFDerivAt hx

/--
The Frechet derivative of mathlib's `gradient` for the positive-orthant
logarithmic barrier is the matrix-induced diagonal Hessian.
-/
theorem positiveOrthantNegLogBarrier_fderiv_gradient_matrix_eq {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    fderiv ℝ (gradient positiveOrthantNegLogBarrier) x =
      chewi131MatrixCLM (positiveOrthantNegLogHessMatrix x) :=
  (positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix hx).fderiv

/--
The matrix-induced diagonal Hessian derivative model for mathlib's `gradient`
holds eventually near every positive-orthant point.
-/
theorem positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt_matrix {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    ∀ᶠ y in 𝓝 x,
      HasFDerivAt (gradient positiveOrthantNegLogBarrier)
        (chewi131MatrixCLM (positiveOrthantNegLogHessMatrix y)) y := by
  filter_upwards [isOpen_positiveOrthant.mem_nhds hx] with y hy
  exact positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix hy

/--
On a translated affine range, mathlib's `gradient` of the positive-orthant
logarithmic barrier agrees with the range-restricted coordinate gradient.
-/
theorem barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eq
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    (A : F →L[ℝ] (EuclideanSpace ℝ (Fin m)))
    (b : EuclideanSpace ℝ (Fin m)) [FiniteDimensional ℝ A.range]
    {y : A.range}
    (hy : y ∈ barrierAffineRangeSet A b (positiveOrthant (d := m))) :
    gradient (barrierAffineRangeValue A b positiveOrthantNegLogBarrier) y =
      barrierAffineRangeGrad A b positiveOrthantNegLogGrad y :=
  (barrierAffineRangeValue_positiveOrthantNegLogBarrier_hasGradientAt
    (A := A) (b := b) (y := y) hy).gradient

/--
On a translated affine range, the Frechet derivative of the mathlib gradient
of the positive-orthant logarithmic barrier is the range Hessian CLM.
-/
theorem barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_hasFDerivAt
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    (A : F →L[ℝ] (EuclideanSpace ℝ (Fin m)))
    (b : EuclideanSpace ℝ (Fin m)) [FiniteDimensional ℝ A.range]
    {y : A.range}
    (hy : y ∈ barrierAffineRangeSet A b (positiveOrthant (d := m))) :
    HasFDerivAt
      (gradient (barrierAffineRangeValue A b positiveOrthantNegLogBarrier))
      (barrierAffineRangeHess A b positiveOrthantNegLogHessCLM y) y := by
  have hbarrier :
      HasFDerivAt (barrierAffineRangeGrad A b positiveOrthantNegLogGrad)
        (barrierAffineRangeHess A b positiveOrthantNegLogHessCLM y) y :=
    barrierAffineRangeGrad_hasFDerivAt A b
      (grad := positiveOrthantNegLogGrad)
      (hess := positiveOrthantNegLogHessCLM)
      (y := y) (positiveOrthantNegLogGrad_hasFDerivAt hy)
  refine hbarrier.congr_of_eventuallyEq ?_
  filter_upwards [barrierAffineRangeSet_positiveOrthant_mem_nhds A b hy] with z hz
  exact barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eq
    (A := A) (b := b) hz

/--
The Frechet derivative of the mathlib gradient for the affine-range
positive-orthant logarithmic barrier is the range Hessian CLM.
-/
theorem barrierAffineRangeValue_positiveOrthantNegLogBarrier_fderiv_gradient_eq
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    (A : F →L[ℝ] (EuclideanSpace ℝ (Fin m)))
    (b : EuclideanSpace ℝ (Fin m)) [FiniteDimensional ℝ A.range]
    {y : A.range}
    (hy : y ∈ barrierAffineRangeSet A b (positiveOrthant (d := m))) :
    fderiv ℝ (gradient (barrierAffineRangeValue A b positiveOrthantNegLogBarrier)) y =
      barrierAffineRangeHess A b positiveOrthantNegLogHessCLM y :=
  (barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_hasFDerivAt
    A b hy).fderiv

/--
The affine-range positive-orthant barrier has the range Hessian as the
eventual derivative model for mathlib's `gradient` near every feasible point.
-/
theorem barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    (A : F →L[ℝ] (EuclideanSpace ℝ (Fin m)))
    (b : EuclideanSpace ℝ (Fin m)) [FiniteDimensional ℝ A.range]
    {y : A.range}
    (hy : y ∈ barrierAffineRangeSet A b (positiveOrthant (d := m))) :
    ∀ᶠ z in 𝓝 y,
      HasFDerivAt
        (gradient (barrierAffineRangeValue A b positiveOrthantNegLogBarrier))
        (barrierAffineRangeHess A b positiveOrthantNegLogHessCLM z) z := by
  filter_upwards [barrierAffineRangeSet_positiveOrthant_mem_nhds A b hy] with z hz
  exact barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_hasFDerivAt
    A b hz

/--
For the finite-row central-path value, mathlib's `gradient` is exactly the
centrality vector `t a + ∇φ`.
-/
theorem chewi1316RangeCentralPathValue_gradient_eq
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m))) :
    gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj) center =
      centralPathGrad t aObj
        (barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogGrad) center := by
  simpa [centralPathGrad] using
    (chewi1316RangeCentralPathValue_hasGradientAt
      aRow bSlack t aObj hcenter_mem).gradient

/--
For the finite-row central-path value, the Frechet derivative of mathlib's
gradient is the translated slack-range logarithmic-barrier Hessian.
-/
theorem chewi1316RangeCentralPathValue_gradient_hasFDerivAt
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m))) :
    HasFDerivAt
      (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
      (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
        positiveOrthantNegLogHessCLM center) center := by
  have hphi : HasFDerivAt
      (barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
        positiveOrthantNegLogGrad)
      (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
        positiveOrthantNegLogHessCLM center) center :=
    barrierAffineRangeGrad_hasFDerivAt (polytopeSlackCLM aRow) bSlack
      (grad := positiveOrthantNegLogGrad)
      (hess := positiveOrthantNegLogHessCLM)
      (y := center) (positiveOrthantNegLogGrad_hasFDerivAt hcenter_mem)
  have hcentral : HasFDerivAt
      (centralPathGrad t aObj
        (barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogGrad))
      (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
        positiveOrthantNegLogHessCLM center) center :=
    centralPathGrad_hasFDerivAt (hphi := hphi)
  refine hcentral.congr_of_eventuallyEq ?_
  filter_upwards
    [barrierAffineRangeSet_positiveOrthant_mem_nhds
      (polytopeSlackCLM aRow) bSlack hcenter_mem] with z hz
  exact chewi1316RangeCentralPathValue_gradient_eq aRow bSlack t aObj hz

/--
For the finite-row central-path value, `fderiv` of mathlib's gradient is the
translated slack-range logarithmic-barrier Hessian.
-/
theorem chewi1316RangeCentralPathValue_fderiv_gradient_eq
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m))) :
    fderiv ℝ (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        center =
      barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
        positiveOrthantNegLogHessCLM center :=
  (chewi1316RangeCentralPathValue_gradient_hasFDerivAt
    aRow bSlack t aObj hcenter_mem).fderiv

/--
The finite-row central-path value has the slack-range logarithmic-barrier
Hessian as the eventual derivative model for mathlib's `gradient`.
-/
theorem chewi1316RangeCentralPathValue_gradient_eventually_hasFDerivAt
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m))) :
    ∀ᶠ z in 𝓝 center,
      HasFDerivAt
        (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM z) z := by
  filter_upwards
    [barrierAffineRangeSet_positiveOrthant_mem_nhds
      (polytopeSlackCLM aRow) bSlack hcenter_mem] with z hz
  exact chewi1316RangeCentralPathValue_gradient_hasFDerivAt
    aRow bSlack t aObj hz

/--
The finite-row central-path value is stationary in mathlib's `gradient`
exactly when the Chewi centrality vector `t a + ∇φ` vanishes.
-/
theorem chewi1316RangeCentralPathValue_gradient_eq_zero_iff
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m))) :
    gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj) center = 0 ↔
      t • aObj +
          barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogGrad center = 0 := by
  rw [chewi1316RangeCentralPathValue_gradient_eq aRow bSlack t aObj hcenter_mem]
  rfl

/--
Chewi centrality gives the mathlib stationary-point hypothesis for the
finite-row central-path value.
-/
theorem chewi1316RangeCentralPathValue_gradient_eq_zero_of_centrality
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hcentral :
      t • aObj +
          barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogGrad center = 0) :
    gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj) center = 0 :=
  (chewi1316RangeCentralPathValue_gradient_eq_zero_iff
    aRow bSlack t aObj hcenter_mem).2 hcentral

/--
The mathlib stationary-point equation recovers Chewi's finite-row centrality
vector equation.
-/
theorem chewi1316RangeCentralPathValue_centrality_of_gradient_eq_zero
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {center : (polytopeSlackCLM aRow).range}
    (hcenter_mem :
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hgrad :
      gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj) center = 0) :
    t • aObj +
        barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogGrad center = 0 :=
  (chewi1316RangeCentralPathValue_gradient_eq_zero_iff
    aRow bSlack t aObj hcenter_mem).1 hgrad

/--
A Chewi central-path selector supplies a feasible point satisfying the mathlib
stationarity condition for the concrete finite-row central-path value.
-/
theorem chewi1316RangeCentralPathSelector_exists_gradient_eq_zero
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (aObj : (polytopeSlackCLM aRow).range)
    (hselector : Chewi1316RangeCentralPathSelector aRow bSlack aObj)
    {t : ℝ} (ht : 0 < t) :
    ∃ center : (polytopeSlackCLM aRow).range,
      center ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)) ∧
      gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj) center = 0 := by
  rcases hselector ht with ⟨center, hcenter_mem, hcentral⟩
  refine ⟨center, hcenter_mem, ?_⟩
  exact chewi1316RangeCentralPathValue_gradient_eq_zero_of_centrality
    aRow bSlack t aObj hcenter_mem hcentral

/--
Along any feasible Chewi segment, the central-path value gradient has the
translated slack-range logarithmic-barrier Hessian as its Frechet derivative.
-/
theorem chewi1316RangeCentralPathValue_gradient_segment_hasFDerivAt
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    (t : ℝ) (aObj : (polytopeSlackCLM aRow).range)
    {xStar x : (polytopeSlackCLM aRow).range}
    (hseg : ∀ τ, τ ∈ Set.uIcc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x τ ∈
        barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
          (positiveOrthant (d := m))) :
    ∀ τ, τ ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt
        (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM (hessianSegmentPoint xStar x τ))
        (hessianSegmentPoint xStar x τ) := by
  intro τ hτ
  exact chewi1316RangeCentralPathValue_gradient_hasFDerivAt
    aRow bSlack t aObj (hseg τ hτ)

/--
Continuity of the finite-row slack-range Hessian gives interval integrability
of the Hessian action along any feasible Chewi segment.
-/
theorem chewi1316RangeCentralPathValue_hessian_segment_intervalIntegrable
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [CompleteSpace F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    {xStar x : (polytopeSlackCLM aRow).range}
    (hseg : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x τ ∈
        barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
          (positiveOrthant (d := m))) :
    IntervalIntegrable
      (fun τ : ℝ =>
        barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM (hessianSegmentPoint xStar x τ)
          (x - xStar))
      MeasureTheory.volume (0 : ℝ) 1 := by
  exact hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn
    (hess := barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
      positiveOrthantNegLogHessCLM)
    (s := barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
      (positiveOrthant (d := m)))
    (x := xStar) (y := x) (v := x - xStar)
    (chewi1314_polytopeSlackNegLog_rangeHess_continuousOn aRow bSlack)
    hseg

/--
Chewi Theorem 13.1 Taylor norm estimate specialized to the finite-row
central-path value on the translated slack range.  The calculus, stationarity,
integrability, and inverse-Hessian left-inverse hypotheses are discharged from
the local range-barrier APIs; the remaining assumptions are the feasible
segment, Newton update, and Hessian Lipschitz bound.
-/
theorem chewi1316RangeCentralPathValue_taylor_norm_bound_of_gradient_ftc
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [CompleteSpace F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    {t gamma : ℝ} (aObj : (polytopeSlackCLM aRow).range)
    {x xNext xStar : (polytopeSlackCLM aRow).range}
    (hx_mem :
      x ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hxStar_mem :
      xStar ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hseg : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x τ ∈
        barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
          (positiveOrthant (d := m)))
    (hcentral :
      t • aObj +
          barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogGrad xStar = 0)
    (hnewton :
      xNext = newtonStep
        (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        (chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack) x)
    (hlip : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      ‖barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM x -
        barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM (hessianSegmentPoint xStar x τ)‖ ≤
        gamma * (1 - τ) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / 2) *
        ‖chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack x‖ *
        ‖x - xStar‖ ^ (2 : ℕ) := by
  let f : (polytopeSlackCLM aRow).range -> ℝ :=
    chewi1316RangeCentralPathValue aRow bSlack t aObj
  let grad : (polytopeSlackCLM aRow).range -> (polytopeSlackCLM aRow).range :=
    gradient f
  let hess : (polytopeSlackCLM aRow).range ->
      (polytopeSlackCLM aRow).range →L[ℝ] (polytopeSlackCLM aRow).range :=
    barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
      positiveOrthantNegLogHessCLM
  let invHess : (polytopeSlackCLM aRow).range ->
      (polytopeSlackCLM aRow).range →L[ℝ] (polytopeSlackCLM aRow).range :=
    chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack
  have hgrad : ∀ τ, τ ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad (hess (hessianSegmentPoint xStar x τ))
        (hessianSegmentPoint xStar x τ) := by
    intro τ hτ
    have hτIcc : τ ∈ Set.Icc (0 : ℝ) 1 := by
      simpa [Set.uIcc_of_le zero_le_one] using hτ
    simpa [grad, hess, f] using
      chewi1316RangeCentralPathValue_gradient_hasFDerivAt
        aRow bSlack t aObj (hseg τ hτIcc)
  have hint : IntervalIntegrable
      (fun τ : ℝ => hess (hessianSegmentPoint xStar x τ) (x - xStar))
      MeasureTheory.volume (0 : ℝ) 1 := by
    simpa [hess] using
      chewi1316RangeCentralPathValue_hessian_segment_intervalIntegrable
        aRow bSlack hseg
  have hgrad_star : grad xStar = 0 := by
    simpa [grad, f] using
      chewi1316RangeCentralPathValue_gradient_eq_zero_of_centrality
        aRow bSlack t aObj hxStar_mem hcentral
  have hleft : invHess x (hess x (x - xStar)) = x - xStar := by
    exact continuousLinearMap_left_inverse_of_right_inverse_finiteDim
      (hess x) (invHess x)
      (by
        intro v
        simpa [hess, invHess] using
          chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse
            aRow bSlack hx_mem v)
      (x - xStar)
  have hnewton' : xNext = x - invHess x (grad x) := by
    simpa [newtonStep, grad, invHess, f] using hnewton
  have hlip' : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      ‖hess x - hess (hessianSegmentPoint xStar x τ)‖ ≤
        gamma * (1 - τ) * ‖x - xStar‖ := by
    intro τ hτ
    simpa [hess] using hlip τ hτ
  simpa [grad, hess, invHess, f] using
    chewi131_taylor_norm_bound_of_gradient_ftc_clm
      (grad := grad) (hess := hess) (Hinv := invHess x)
      (gamma := gamma) (x := x) (xNext := xNext) (xStar := xStar)
      hgrad hint hgrad_star hnewton' hleft hlip'

/--
Chewi Theorem 13.1 local quadratic Newton step specialized to the finite-row
central-path value.  This removes the explicit inverse-Hessian norm from the
Taylor estimate by reusing the range inverse-Hessian right inverse and a
source-shaped Hessian lower bound at the current point.
-/
theorem chewi1316RangeCentralPathValue_local_quadratic_step_of_gradient_ftc
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [CompleteSpace F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    {alpha gamma t : ℝ} (halpha : 0 < alpha) (hgamma : 0 ≤ gamma)
    (aObj : (polytopeSlackCLM aRow).range)
    {x xNext xStar : (polytopeSlackCLM aRow).range}
    (hx_mem :
      x ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hxStar_mem :
      xStar ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hseg : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x τ ∈
        barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
          (positiveOrthant (d := m)))
    (hcentral :
      t • aObj +
          barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogGrad xStar = 0)
    (hnewton :
      xNext = newtonStep
        (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        (chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack) x)
    (hlower : ∀ v : (polytopeSlackCLM aRow).range,
      (alpha / 2) * ‖v‖ ^ (2 : ℕ) ≤
        inner ℝ
          (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogHessCLM x v) v)
    (hlip : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      ‖barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM x -
        barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM (hessianSegmentPoint xStar x τ)‖ ≤
        gamma * (1 - τ) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  let H : (polytopeSlackCLM aRow).range →L[ℝ]
      (polytopeSlackCLM aRow).range :=
    barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
      positiveOrthantNegLogHessCLM x
  let Hinv : (polytopeSlackCLM aRow).range →L[ℝ]
      (polytopeSlackCLM aRow).range :=
    chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack x
  have hright : ∀ v : (polytopeSlackCLM aRow).range, H (Hinv v) = v := by
    intro v
    simpa [H, Hinv] using
      chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse
        aRow bSlack hx_mem v
  have htaylor :=
    chewi1316RangeCentralPathValue_taylor_norm_bound_of_gradient_ftc
      (aRow := aRow) (bSlack := bSlack) (t := t) (gamma := gamma)
      (aObj := aObj) (x := x) (xNext := xNext) (xStar := xStar)
      hx_mem hxStar_mem hseg hcentral hnewton hlip
  exact chewi131_local_quadratic_step_of_taylor_bound_clm_of_hessian_lower_half
    (H := H) (Hinv := Hinv) (alpha := alpha) (gamma := gamma)
    (x := x) (xNext := xNext) (xStar := xStar)
    halpha hgamma (by simpa [H] using hlower) hright
    (by simpa [Hinv] using htaylor)

/--
Chewi Theorem 13.1 local quadratic Newton step plus the half-contraction
consequence for the finite-row central-path value.
-/
theorem chewi1316RangeCentralPathValue_local_quadratic_step_and_half_of_gradient_ftc
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [CompleteSpace F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    {alpha gamma t : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    (aObj : (polytopeSlackCLM aRow).range)
    {x xNext xStar : (polytopeSlackCLM aRow).range}
    (hx_mem :
      x ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hxStar_mem :
      xStar ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hseg : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x τ ∈
        barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
          (positiveOrthant (d := m)))
    (hcentral :
      t • aObj +
          barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogGrad xStar = 0)
    (hnewton :
      xNext = newtonStep
        (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        (chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack) x)
    (hradius : ‖x - xStar‖ ≤ alpha / (2 * gamma))
    (hlower : ∀ v : (polytopeSlackCLM aRow).range,
      (alpha / 2) * ‖v‖ ^ (2 : ℕ) ≤
        inner ℝ
          (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogHessCLM x v) v)
    (hlip : ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
      ‖barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM x -
        barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
          positiveOrthantNegLogHessCLM (hessianSegmentPoint xStar x τ)‖ ≤
        gamma * (1 - τ) * ‖x - xStar‖) :
    ‖xNext - xStar‖ ≤
        (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) ∧
      ‖xNext - xStar‖ ≤ (1 / 2) * ‖x - xStar‖ := by
  let H : (polytopeSlackCLM aRow).range →L[ℝ]
      (polytopeSlackCLM aRow).range :=
    barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
      positiveOrthantNegLogHessCLM x
  let Hinv : (polytopeSlackCLM aRow).range →L[ℝ]
      (polytopeSlackCLM aRow).range :=
    chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack x
  have hright : ∀ v : (polytopeSlackCLM aRow).range, H (Hinv v) = v := by
    intro v
    simpa [H, Hinv] using
      chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse
        aRow bSlack hx_mem v
  have htaylor :=
    chewi1316RangeCentralPathValue_taylor_norm_bound_of_gradient_ftc
      (aRow := aRow) (bSlack := bSlack) (t := t) (gamma := gamma)
      (aObj := aObj) (x := x) (xNext := xNext) (xStar := xStar)
      hx_mem hxStar_mem hseg hcentral hnewton hlip
  exact chewi131_local_quadratic_step_and_half_of_taylor_bound_clm_of_hessian_lower_half
    (H := H) (Hinv := Hinv) (alpha := alpha) (gamma := gamma)
    (x := x) (xNext := xNext) (xStar := xStar)
    halpha hgamma hradius (by simpa [H] using hlower) hright
    (by simpa [Hinv] using htaylor)

/--
Chewi Theorem 13.1 sequence recurrence specialized to the finite-row
central-path value.  The feasibility, segment, Newton-update, Hessian lower,
and Hessian Lipschitz hypotheses are only required while the current iterate is
inside the local radius, matching the local induction in the source proof.
-/
theorem chewi1316RangeCentralPathValue_local_quadratic_recurrence_of_gradient_ftc
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [CompleteSpace F]
    {m : ℕ}
    (aRow : Fin m -> F) (bSlack : EuclideanSpace ℝ (Fin m))
    {alpha gamma t : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    (aObj : (polytopeSlackCLM aRow).range)
    {x : ℕ -> (polytopeSlackCLM aRow).range}
    {xStar : (polytopeSlackCLM aRow).range}
    (hx_mem : ∀ k, ‖x k - xStar‖ ≤ alpha / (2 * gamma) ->
      x k ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hxStar_mem :
      xStar ∈ barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
        (positiveOrthant (d := m)))
    (hseg : ∀ k, ‖x k - xStar‖ ≤ alpha / (2 * gamma) ->
      ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
        hessianSegmentPoint xStar (x k) τ ∈
          barrierAffineRangeSet (polytopeSlackCLM aRow) bSlack
            (positiveOrthant (d := m)))
    (hcentral :
      t • aObj +
          barrierAffineRangeGrad (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogGrad xStar = 0)
    (hnewton : ∀ k, ‖x k - xStar‖ ≤ alpha / (2 * gamma) ->
      x (k + 1) = newtonStep
        (gradient (chewi1316RangeCentralPathValue aRow bSlack t aObj))
        (chewi1314_polytopeSlackNegLog_rangeInvHess aRow bSlack) (x k))
    (hlower : ∀ k, ‖x k - xStar‖ ≤ alpha / (2 * gamma) ->
      ∀ v : (polytopeSlackCLM aRow).range,
        (alpha / 2) * ‖v‖ ^ (2 : ℕ) ≤
          inner ℝ
            (barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
              positiveOrthantNegLogHessCLM (x k) v) v)
    (hlip : ∀ k, ‖x k - xStar‖ ≤ alpha / (2 * gamma) ->
      ∀ τ, τ ∈ Set.Icc (0 : ℝ) 1 ->
        ‖barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogHessCLM (x k) -
          barrierAffineRangeHess (polytopeSlackCLM aRow) bSlack
            positiveOrthantNegLogHessCLM (hessianSegmentPoint xStar (x k) τ)‖ ≤
          gamma * (1 - τ) * ‖x k - xStar‖)
    (hinit : ‖x 0 - xStar‖ ≤ alpha / (2 * gamma)) :
    ∀ k,
      ‖x (k + 1) - xStar‖ ≤
          (gamma / alpha) * ‖x k - xStar‖ ^ (2 : ℕ) ∧
        ‖x (k + 1) - xStar‖ ≤ (1 / 2) * ‖x k - xStar‖ := by
  refine chewi131_local_quadratic_recurrence_of_conditional_step ?_ hinit
  intro k hradius
  exact chewi1316RangeCentralPathValue_local_quadratic_step_and_half_of_gradient_ftc
    (aRow := aRow) (bSlack := bSlack) (alpha := alpha) (gamma := gamma)
    (t := t) halpha hgamma aObj
    (x := x k) (xNext := x (k + 1)) (xStar := xStar)
    (hx_mem k hradius) hxStar_mem (hseg k hradius) hcentral
    (hnewton k hradius) hradius (hlower k hradius) (hlip k hradius)

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
the Hessian matrix identification from a source second derivative of the
dual-valued derivative `fderiv ℝ f`.
-/
theorem chewi131_taylor_norm_bound_of_matrix_continuous_gradient_secondFDerivBilin
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {Bfun : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L⋆[ℝ] StrongDual ℝ (EuclideanSpace ℝ n)}
    {s : Set (EuclideanSpace ℝ n)}
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    {f : EuclideanSpace ℝ n -> ℝ}
    {x xNext xStar : EuclideanSpace ℝ n}
    (hdet : IsUnit (Hfun x).det)
    (hHfun_cont : ContinuousOn Hfun s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar x t ∈ s)
    (hsecond : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (fun y => fderiv ℝ f y)
        (Bfun (hessianSegmentPoint xStar x t)).toContinuousLinearMap
        (hessianSegmentPoint xStar x t))
    (hB_eq : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      InnerProductSpace.continuousLinearMapOfBilin
          (Bfun (hessianSegmentPoint xStar x t)) =
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
    simpa [hB_eq t ht] using
      chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin
        (Bfun (hessianSegmentPoint xStar x t)) (hsecond t ht)
  exact
    chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasFDeriv
      (Hfun := Hfun) (s := s) (gamma := gamma) (f := f)
      (x := x) (xNext := xNext) (xStar := xStar)
      hgamma hdet hHfun_cont hseg hgrad hgrad_star hnewton hlip_matrix

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
`gradient f`, deriving the Hessian matrix identification from a source second
derivative of the dual-valued derivative `fderiv ℝ f`.
-/
theorem chewi131_local_quadratic_step_of_matrix_continuous_gradient_secondFDerivBilin_of_radius
    {Hstar : Matrix n n ℝ}
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {Bfun : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L⋆[ℝ] StrongDual ℝ (EuclideanSpace ℝ n)}
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
    (hsecond : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (fun y => fderiv ℝ f y)
        (Bfun (hessianSegmentPoint xStar x t)).toContinuousLinearMap
        (hessianSegmentPoint xStar x t))
    (hB_eq : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      InnerProductSpace.continuousLinearMapOfBilin
          (Bfun (hessianSegmentPoint xStar x t)) =
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
    simpa [hB_eq t ht] using
      chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin
        (Bfun (hessianSegmentPoint xStar x t)) (hsecond t ht)
  exact
    chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xNext := xNext) (xStar := xStar)
      hH hlower hclose hradius hHfun_cont hseg hgrad hgrad_star hnewton
      hlip_matrix

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
the Hessian matrix identification from a source second derivative of the
dual-valued derivative `fderiv ℝ f` along every `x_star -> x_k` segment.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_secondFDerivBilin_of_radius
    {Hstar : Matrix n n ℝ}
    {Hfun : EuclideanSpace ℝ n -> Matrix n n ℝ}
    {Bfun : EuclideanSpace ℝ n ->
      EuclideanSpace ℝ n →L⋆[ℝ] StrongDual ℝ (EuclideanSpace ℝ n)}
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
    (hsecond : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt (fun y => fderiv ℝ f y)
        (Bfun (hessianSegmentPoint xStar (x k) t)).toContinuousLinearMap
        (hessianSegmentPoint xStar (x k) t))
    (hB_eq : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      InnerProductSpace.continuousLinearMapOfBilin
          (Bfun (hessianSegmentPoint xStar (x k) t)) =
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
    simpa [hB_eq k t ht] using
      chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin
        (Bfun (hessianSegmentPoint xStar (x k) t)) (hsecond k t ht)
  exact
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasFDeriv_of_radius
      (Hstar := Hstar) (Hfun := Hfun) (s := s) hHstar halpha hgamma
      (f := f) (x := x) (xStar := xStar)
      hH hlower hclose hHfun_cont hseg hgrad hgrad_star hnewton hlip_matrix
      hinit

/--
Chewi Theorem 13.1 sequence recurrence with mathlib's `gradient f`, deriving
the V70 bilinear second-derivative hypothesis from pointwise `C^2`
regularity via mathlib's `iteratedFDeriv`.
-/
theorem chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_secondFDerivBilin_of_radius
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
    (hB_eq : ∀ k t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      InnerProductSpace.continuousLinearMapOfBilin
          (chewi131SecondFDerivBilin f
            (hessianSegmentPoint xStar (x k) t)) =
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
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_secondFDerivBilin_of_radius
      (Hstar := Hstar) (Hfun := Hfun)
      (Bfun := fun z => chewi131SecondFDerivBilin f z) (s := s)
      hHstar halpha hgamma (f := f) (x := x) (xStar := xStar)
      hH hlower hclose hHfun_cont hseg
      (fun k t ht =>
        chewi131SecondFDerivBilin_hasFDerivAt_of_contDiffAt_two
          (hf_contDiff k t ht))
      hB_eq hgrad_star hnewton hlip_matrix hinit

/--
Chewi Theorem 13.1 sequence recurrence specialized to the positive-orthant
logarithmic barrier.  The gradient/Hessian derivative hypotheses are
discharged by the concrete diagonal Hessian matrix bridge.
-/
theorem chewi131_local_quadratic_recurrence_positiveOrthantNegLogBarrier_of_radius
    {d : ℕ}
    {Hstar : Matrix (Fin d) (Fin d) ℝ}
    {s : Set (EuclideanSpace ℝ (Fin d))}
    (hHstar : Hstar.IsHermitian)
    {alpha gamma : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    {x : ℕ -> EuclideanSpace ℝ (Fin d)} {xStar : EuclideanSpace ℝ (Fin d)}
    (hlower : alpha • (1 : Matrix (Fin d) (Fin d) ℝ) ≤ Hstar)
    (hclose : ∀ k,
      ‖positiveOrthantNegLogHessMatrix (x k) - Hstar‖ ≤
        gamma * ‖x k - xStar‖)
    (hs_subset : s ⊆ positiveOrthant (d := d))
    (hseg : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint xStar (x k) t ∈ s)
    (hgrad_star : gradient positiveOrthantNegLogBarrier xStar = 0)
    (hnewton : ∀ k,
      x (k + 1) =
        x k -
          chewi131MatrixCLM ((positiveOrthantNegLogHessMatrix (x k))⁻¹)
            (gradient positiveOrthantNegLogBarrier (x k)))
    (hlip_matrix : ∀ k t, t ∈ Set.Icc (0 : ℝ) 1 ->
      ‖positiveOrthantNegLogHessMatrix (x k) -
          positiveOrthantNegLogHessMatrix (hessianSegmentPoint xStar (x k) t)‖ ≤
        gamma * (1 - t) * ‖x k - xStar‖)
    (hinit : ‖x 0 - xStar‖ ≤ alpha / (2 * gamma)) :
    ∀ k,
      ‖x (k + 1) - xStar‖ ≤
          (gamma / alpha) * ‖x k - xStar‖ ^ (2 : ℕ) ∧
        ‖x (k + 1) - xStar‖ ≤ (1 / 2) * ‖x k - xStar‖ := by
  refine
    chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasFDeriv_of_radius
      (Hstar := Hstar) (Hfun := positiveOrthantNegLogHessMatrix) (s := s)
      hHstar halpha hgamma (f := positiveOrthantNegLogBarrier) (x := x)
      (xStar := xStar) ?hH hlower hclose ?hcont hseg ?hgrad hgrad_star
      hnewton hlip_matrix hinit
  · intro k
    exact positiveOrthantNegLogHessMatrix_isHermitian (x k)
  · exact positiveOrthantNegLogHessMatrix_continuousOn.mono hs_subset
  · intro k t ht
    have htIcc : t ∈ Set.Icc (0 : ℝ) 1 := by
      simpa [Set.uIcc_of_le zero_le_one] using ht
    exact positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix
      (hs_subset (hseg k t htIcc))

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
