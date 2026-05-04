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
