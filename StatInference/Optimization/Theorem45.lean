import StatInference.Optimization.LowerBounds
import StatInference.Optimization.Reductions

/-!
# Chewi Theorem 4.5 setup

This module starts the strongly-convex lower-bound construction used around
Chewi Theorem 4.5.  The source derives Theorem 4.5 from Lemma 4.2 and the
convex lower bound, but the same regularization layer is also useful as a
concrete strongly-convex chain objective.  We package the regularized chain
objective, its supplied gradient, its strong-convexity/smoothness interfaces,
and the gradient-span support calculation.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

/--
Regularized lower-bound chain objective centered at the origin.  The base
chain uses smoothness budget `beta - alpha`; the quadratic regularizer supplies
the `alpha`-strongly-convex part.
-/
noncomputable def strongLowerBoundChainObjective (alpha beta : ℝ) (d : ℕ) :
    EuclideanSpace ℝ (Fin d) -> ℝ :=
  quadraticRegularizedAround
    (lowerBoundChainTextbookObjective (beta - alpha) d) alpha 0

/-- Supplied gradient for `strongLowerBoundChainObjective`. -/
noncomputable def strongLowerBoundChainGradient (alpha beta : ℝ) (d : ℕ) :
    EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d) :=
  regularizedGradient (lowerBoundChainGradient (beta - alpha) d) alpha 0

theorem strongLowerBoundChainObjective_apply
    (alpha beta : ℝ) (d : ℕ) (x : EuclideanSpace ℝ (Fin d)) :
    strongLowerBoundChainObjective alpha beta d x =
      lowerBoundChainTextbookObjective (beta - alpha) d x +
        (alpha / 2) * ‖x‖ ^ (2 : ℕ) := by
  simp [strongLowerBoundChainObjective, quadraticRegularizedAround]

theorem strongLowerBoundChainGradient_apply
    (alpha beta : ℝ) (d : ℕ) (x : EuclideanSpace ℝ (Fin d)) :
    strongLowerBoundChainGradient alpha beta d x =
      lowerBoundChainGradient (beta - alpha) d x + alpha • x := by
  simp [strongLowerBoundChainGradient, regularizedGradient]

/--
The regularized chain is `alpha`-strongly convex in the supplied first-order
lower-model sense whenever `alpha <= beta`.
-/
theorem strongLowerBoundChainObjective_firstOrderStrongConvexOn
    {alpha beta : ℝ} (halpha_le_beta : alpha ≤ beta) (d : ℕ) :
    FirstOrderStrongConvexOn Set.univ
      (strongLowerBoundChainObjective alpha beta d)
      (strongLowerBoundChainGradient alpha beta d) alpha := by
  have hdiff : 0 ≤ beta - alpha := by
    nlinarith
  simpa [strongLowerBoundChainObjective, strongLowerBoundChainGradient] using
    (quadraticRegularizedAround_firstOrderStrongConvexOn_convex
      (f := lowerBoundChainTextbookObjective (beta - alpha) d)
      (grad := lowerBoundChainGradient (beta - alpha) d)
      (delta := alpha) (x0 := (0 : EuclideanSpace ℝ (Fin d)))
      (lowerBoundChainTextbookObjective_firstOrderConvex hdiff d))

/--
The regularized chain is `beta`-smooth: the base chain is `(beta - alpha)`-
smooth and the regularizer contributes `alpha`.
-/
theorem strongLowerBoundChainObjective_smoothWithGradientOn
    {alpha beta : ℝ} (halpha_le_beta : alpha ≤ beta) (d : ℕ) :
    SmoothWithGradientOn Set.univ
      (strongLowerBoundChainObjective alpha beta d)
      (strongLowerBoundChainGradient alpha beta d) beta := by
  have hdiff : 0 ≤ beta - alpha := by
    nlinarith
  have hreg :
      SmoothWithGradientOn Set.univ
        (strongLowerBoundChainObjective alpha beta d)
        (strongLowerBoundChainGradient alpha beta d) ((beta - alpha) + alpha) := by
    simpa [strongLowerBoundChainObjective, strongLowerBoundChainGradient] using
      (quadraticRegularizedAround_smoothWithGradientOn
        (f := lowerBoundChainTextbookObjective (beta - alpha) d)
        (grad := lowerBoundChainGradient (beta - alpha) d)
        (beta := beta - alpha) (delta := alpha)
        (x0 := (0 : EuclideanSpace ℝ (Fin d)))
        (lowerBoundChainTextbookObjective_smoothWithGradientOn hdiff d))
  convert hreg using 1
  ring

/--
The strongly-convex chain oracle preserves the source support growth:
`x ∈ V_k -> grad f(x) ∈ V_{k+1}`.  The new regularizer term is `alpha • x`,
which already lies in `V_k`.
-/
theorem strongLowerBoundChainGradient_mem_coordinatePrefixSubmodule
    {d k : ℕ} {alpha beta : ℝ} {x : EuclideanSpace ℝ (Fin d)}
    (hx : x ∈ coordinatePrefixSubmodule d k) :
    strongLowerBoundChainGradient alpha beta d x ∈
      coordinatePrefixSubmodule d (k + 1) := by
  rw [strongLowerBoundChainGradient_apply]
  refine Submodule.add_mem _ ?_ ?_
  · exact lowerBoundChainGradient_mem_coordinatePrefixSubmodule hx
  · have hx_smul :
        alpha • x ∈ coordinatePrefixSubmodule d k :=
      Submodule.smul_mem _ alpha hx
    exact coordinatePrefixSubmodule_mono d (Nat.le_succ k) hx_smul

/--
Consequently every gradient-span trajectory for the strongly-convex chain
starting from zero satisfies Chewi's `V_n` containment invariant.
-/
theorem gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_strongLowerBoundChainGradient
    {d : ℕ} {alpha beta : ℝ}
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (strongLowerBoundChainGradient alpha beta d) x) :
    ∀ n, x n ∈ coordinatePrefixSubmodule d n :=
  gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next
    hx0 hspan (fun _ hxk =>
      strongLowerBoundChainGradient_mem_coordinatePrefixSubmodule hxk)

/--
Source-shaped interface package for the regularized chain used toward Chewi
Theorem 4.5: under `0 < alpha < beta`, it is `alpha`-strongly convex,
`beta`-smooth, and its gradient-span trajectories from the origin stay in
the prefix subspaces.
-/
theorem chewi45_regularized_chain_interface_package
    {alpha beta : ℝ} (_halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (d : ℕ) :
    FirstOrderStrongConvexOn Set.univ
      (strongLowerBoundChainObjective alpha beta d)
      (strongLowerBoundChainGradient alpha beta d) alpha ∧
    SmoothWithGradientOn Set.univ
      (strongLowerBoundChainObjective alpha beta d)
      (strongLowerBoundChainGradient alpha beta d) beta ∧
    ∀ {x : ℕ -> EuclideanSpace ℝ (Fin d)},
      x 0 = 0 ->
      IsGradientSpanTrajectory (strongLowerBoundChainGradient alpha beta d) x ->
      ∀ n, x n ∈ coordinatePrefixSubmodule d n := by
  exact ⟨
    strongLowerBoundChainObjective_firstOrderStrongConvexOn halpha_lt_beta.le d,
    strongLowerBoundChainObjective_smoothWithGradientOn halpha_lt_beta.le d,
    fun {x} hx0 hspan =>
      gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_strongLowerBoundChainGradient
        (x := x)
        hx0 hspan⟩

/--
The displayed minimizer from the convex lower-bound chain has radius at most
`sqrt d`.  This is the concrete radius estimate fed into the Lemma 4.2
regularization reduction en route to Chewi Theorem 4.5.
-/
theorem lowerBoundChainMinimizer_norm_le_sqrt_dim (d : ℕ) :
    ‖lowerBoundChainMinimizer d‖ ≤ Real.sqrt (d : ℝ) := by
  have hsq := lowerBoundChainMinimizer_norm_sq_le_dim d
  have hdim_nonneg : 0 ≤ (d : ℝ) := by positivity
  have hsqrt_sq : (Real.sqrt (d : ℝ)) ^ (2 : ℕ) = (d : ℝ) :=
    Real.sq_sqrt hdim_nonneg
  have hsq' :
      ‖lowerBoundChainMinimizer d‖ ^ (2 : ℕ) ≤
        (Real.sqrt (d : ℝ)) ^ (2 : ℕ) := by
    simpa [hsqrt_sq] using hsq
  exact (sq_le_sq₀ (norm_nonneg _) (Real.sqrt_nonneg _)).mp hsq'

/--
Lemma 4.2's complexity package instantiated on the concrete convex
lower-bound chain from Chewi Theorem 4.4.
-/
theorem chewi45_lowerBoundChain_regularization_complexity_package
    {beta eps R : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps)
    (hR : 0 < R) (heps_le : eps ≤ beta * R ^ (2 : ℕ))
    (d : ℕ) :
    let delta := eps / R ^ (2 : ℕ)
    FirstOrderStrongConvexOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) delta ∧
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) (beta + delta) ∧
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) (2 * beta) ∧
    (beta + delta) / delta ≤ 2 * beta * R ^ (2 : ℕ) / eps := by
  exact lemma42_regularization_complexity_package
    (f := lowerBoundChainTextbookObjective beta d)
    (grad := lowerBoundChainGradient beta d)
    (beta := beta) (eps := eps) (R := R)
    (x0 := (0 : EuclideanSpace ℝ (Fin d)))
    (lowerBoundChainTextbookObjective_firstOrderConvex hbeta d)
    (lowerBoundChainTextbookObjective_smoothWithGradientOn hbeta d)
    heps hR heps_le

/--
Concrete Lemma 4.2 reduction package for Chewi's lower-bound chain: an
`eps / 2`-near minimizer of the regularized chain is an `eps`-near minimizer
of the base convex chain, and the regularized problem carries the expected
strong-convexity, smoothness, and condition-number bounds.
-/
theorem chewi45_lowerBoundChain_regularization_reduction_package
    {beta eps R : ℝ} {d : ℕ}
    {x xDelta : EuclideanSpace ℝ (Fin d)}
    (hbeta : 0 ≤ beta) (heps : 0 < eps) (hR : 0 < R)
    (heps_le : eps ≤ beta * R ^ (2 : ℕ))
    (hR_bound : ‖lowerBoundChainMinimizer d‖ ≤ R)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / R ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) x ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / R ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / R ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / R ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) (lowerBoundChainMinimizer d)) :
    let delta := eps / R ^ (2 : ℕ)
    lowerBoundChainTextbookObjective beta d x -
        lowerBoundChainTextbookObjective beta d (lowerBoundChainMinimizer d) ≤ eps ∧
    ‖xDelta - (0 : EuclideanSpace ℝ (Fin d))‖ ≤ R ∧
    FirstOrderStrongConvexOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) delta ∧
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) (beta + delta) ∧
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) (2 * beta) ∧
    (beta + delta) / delta ≤ 2 * beta * R ^ (2 : ℕ) / eps := by
  exact lemma42_regularization_reduction_package_of_isMinOn
    (f := lowerBoundChainTextbookObjective beta d)
    (grad := lowerBoundChainGradient beta d)
    (beta := beta) (eps := eps) (R := R)
    (x0 := (0 : EuclideanSpace ℝ (Fin d)))
    (x := x) (xDelta := xDelta)
    (xStar := lowerBoundChainMinimizer d)
    (lowerBoundChainTextbookObjective_firstOrderConvex hbeta d)
    (lowerBoundChainTextbookObjective_smoothWithGradientOn hbeta d)
    heps hR heps_le (by simpa using hR_bound) hx_near hDelta_le
    (lowerBoundChainTextbookObjective_isMinOn_lowerBoundChainMinimizer hbeta d)

/--
Source-radius specialization of the concrete Lemma 4.2 reduction package,
using the compiled estimate `‖x_*‖ <= sqrt d` for Chewi's lower-bound chain.
-/
theorem chewi45_lowerBoundChain_regularization_reduction_package_sqrt_dim
    {beta eps : ℝ} {d : ℕ}
    {x xDelta : EuclideanSpace ℝ (Fin d)}
    (hbeta : 0 ≤ beta) (heps : 0 < eps) (hdpos : 0 < d)
    (heps_le :
      eps ≤ beta * (Real.sqrt (d : ℝ)) ^ (2 : ℕ))
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / (Real.sqrt (d : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) x ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / (Real.sqrt (d : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / (Real.sqrt (d : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / (Real.sqrt (d : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) (lowerBoundChainMinimizer d)) :
    let delta := eps / (Real.sqrt (d : ℝ)) ^ (2 : ℕ)
    lowerBoundChainTextbookObjective beta d x -
        lowerBoundChainTextbookObjective beta d (lowerBoundChainMinimizer d) ≤ eps ∧
    ‖xDelta - (0 : EuclideanSpace ℝ (Fin d))‖ ≤ Real.sqrt (d : ℝ) ∧
    FirstOrderStrongConvexOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) delta ∧
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) (beta + delta) ∧
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)))
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) (2 * beta) ∧
    (beta + delta) / delta ≤
      2 * beta * (Real.sqrt (d : ℝ)) ^ (2 : ℕ) / eps := by
  have hdpos_real : 0 < (d : ℝ) := by exact_mod_cast hdpos
  have hR : 0 < Real.sqrt (d : ℝ) := Real.sqrt_pos.2 hdpos_real
  exact chewi45_lowerBoundChain_regularization_reduction_package
    (beta := beta) (eps := eps) (R := Real.sqrt (d : ℝ))
    (d := d) (x := x) (xDelta := xDelta)
    hbeta heps hR heps_le (lowerBoundChainMinimizer_norm_le_sqrt_dim d)
    hx_near hDelta_le

/-- Squared coordinate tail beyond the source prefix subspace `V_N`. -/
noncomputable def coordinateTailSq (d N : ℕ)
    (z : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Finset.sum (Finset.univ.filter (fun i : Fin d => N ≤ i.1))
    (fun i : Fin d => (z i) ^ (2 : ℕ))

/-- Coordinate-tail energy is nonnegative. -/
theorem coordinateTailSq_nonneg (d N : ℕ)
    (z : EuclideanSpace ℝ (Fin d)) :
    0 ≤ coordinateTailSq d N z := by
  unfold coordinateTailSq
  exact Finset.sum_nonneg fun _ _ => sq_nonneg _

/--
If `x ∈ V_N`, then the squared distance from `x` to any `z` controls the
tail energy of `z` outside `V_N`.
-/
theorem coordinateTailSq_le_sqdist_of_mem_coordinatePrefixSubmodule
    {d N : ℕ} {x z : EuclideanSpace ℝ (Fin d)}
    (hx : x ∈ coordinatePrefixSubmodule d N) :
    coordinateTailSq d N z ≤ ‖x - z‖ ^ (2 : ℕ) := by
  rw [EuclideanSpace.real_norm_sq_eq]
  have htail_eq :
      coordinateTailSq d N z =
        Finset.sum (Finset.univ.filter (fun i : Fin d => N ≤ i.1))
          (fun i : Fin d => ((x - z) i) ^ (2 : ℕ)) := by
    unfold coordinateTailSq
    refine Finset.sum_congr rfl ?_
    intro i hi
    have hNi : N ≤ i.1 := (Finset.mem_filter.mp hi).2
    have hxi : x i = 0 := hx i hNi
    simp [hxi]
  rw [htail_eq]
  exact Finset.sum_le_sum_of_subset_of_nonneg
    (by exact Finset.filter_subset _ _)
    (fun _ _ _ => sq_nonneg _)

/--
Tail-energy gap lower bound for the strongly-convex chain from a supplied
zero-gradient minimizer candidate.
-/
theorem strongLowerBoundChainObjective_gap_ge_tailSq_of_gradient_eq_zero
    {alpha beta : ℝ} (halpha_nonneg : 0 ≤ alpha)
    (halpha_le_beta : alpha ≤ beta) {d N : ℕ}
    {x xStar : EuclideanSpace ℝ (Fin d)}
    (hx_prefix : x ∈ coordinatePrefixSubmodule d N)
    (hgrad_zero : strongLowerBoundChainGradient alpha beta d xStar = 0) :
    (alpha / 2) * coordinateTailSq d N xStar ≤
      strongLowerBoundChainObjective alpha beta d x -
        strongLowerBoundChainObjective alpha beta d xStar := by
  have hfirst :=
    strongLowerBoundChainObjective_firstOrderStrongConvexOn
      (alpha := alpha) (beta := beta) halpha_le_beta d
  have hmodel := hfirst.lower_model
    (by simp : xStar ∈ Set.univ) (by simp : x ∈ Set.univ)
  have htail_le :
      coordinateTailSq d N xStar ≤ ‖x - xStar‖ ^ (2 : ℕ) :=
    coordinateTailSq_le_sqdist_of_mem_coordinatePrefixSubmodule hx_prefix
  have hmul :
      (alpha / 2) * coordinateTailSq d N xStar ≤
        (alpha / 2) * ‖x - xStar‖ ^ (2 : ℕ) := by
    exact mul_le_mul_of_nonneg_left htail_le (by nlinarith)
  simp [hgrad_zero] at hmodel
  nlinarith

/--
Gradient-span version of the tail-energy gap bound.  The prefix membership is
discharged by the compiled support induction for the strongly-convex chain.
-/
theorem strongLowerBoundChainObjective_gap_ge_tailSq_of_gradientSpanTrajectory
    {alpha beta : ℝ} (halpha_nonneg : 0 ≤ alpha)
    (halpha_le_beta : alpha ≤ beta) {d N : ℕ}
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    {xStar : EuclideanSpace ℝ (Fin d)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (strongLowerBoundChainGradient alpha beta d) x)
    (hgrad_zero : strongLowerBoundChainGradient alpha beta d xStar = 0) :
    (alpha / 2) * coordinateTailSq d N xStar ≤
      strongLowerBoundChainObjective alpha beta d (x N) -
        strongLowerBoundChainObjective alpha beta d xStar := by
  have hx_prefix :
      x N ∈ coordinatePrefixSubmodule d N :=
    gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_strongLowerBoundChainGradient
      (x := x) hx0 hspan N
  exact strongLowerBoundChainObjective_gap_ge_tailSq_of_gradient_eq_zero
    halpha_nonneg halpha_le_beta hx_prefix hgrad_zero

end Optimization
end StatInference
