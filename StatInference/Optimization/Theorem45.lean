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

/--
Prefix-subspace version of the convex lower-bound gap.  This removes the
base-chain gradient-span hypothesis when another oracle, such as a regularized
oracle, has already proved `x ∈ V_N`.
-/
theorem lowerBoundChainTextbookObjective_gap_ge_of_mem_coordinatePrefixSubmodule
    {beta : ℝ} (hbeta : 0 ≤ beta) {N d : ℕ} (hNd : N ≤ d)
    {x : EuclideanSpace ℝ (Fin d)}
    (hx : x ∈ coordinatePrefixSubmodule d N) :
    beta / (8 * ((N : ℝ) + 1)) - beta / (8 * ((d : ℝ) + 1)) ≤
      lowerBoundChainTextbookObjective beta d x -
        lowerBoundChainTextbookObjective beta d (lowerBoundChainMinimizer d) := by
  have hprefix :
      -(beta / 8) * (1 - 1 / ((N : ℝ) + 1)) ≤
        lowerBoundChainTextbookObjective beta d x :=
    lowerBoundChainTextbookObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule
      hbeta hNd hx
  have hNden : ((N : ℝ) + 1) ≠ 0 := by positivity
  have hdden : ((d : ℝ) + 1) ≠ 0 := by positivity
  calc
    beta / (8 * ((N : ℝ) + 1)) - beta / (8 * ((d : ℝ) + 1))
        =
          -(beta / 8) * (1 - 1 / ((N : ℝ) + 1)) -
            (-(beta / 8) * (1 - 1 / ((d : ℝ) + 1))) := by
            field_simp [hNden, hdden]
            ring
    _ ≤ lowerBoundChainTextbookObjective beta d x -
          (-(beta / 8) * (1 - 1 / ((d : ℝ) + 1))) := by
          exact sub_le_sub_right hprefix _
    _ = lowerBoundChainTextbookObjective beta d x -
          lowerBoundChainTextbookObjective beta d (lowerBoundChainMinimizer d) := by
          rw [lowerBoundChainTextbookObjective_lowerBoundChainMinimizer]

/--
The regularized lower-bound chain oracle has the same one-coordinate support
growth as the base chain: `x ∈ V_k -> grad_delta(x) ∈ V_{k+1}`.
-/
theorem regularizedLowerBoundChainGradient_mem_coordinatePrefixSubmodule
    {d k : ℕ} {beta delta : ℝ} {x : EuclideanSpace ℝ (Fin d)}
    (hx : x ∈ coordinatePrefixSubmodule d k) :
    regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d)) x ∈
      coordinatePrefixSubmodule d (k + 1) := by
  rw [regularizedGradient_apply]
  refine Submodule.add_mem _ ?_ ?_
  · exact lowerBoundChainGradient_mem_coordinatePrefixSubmodule hx
  · have hx_sub :
        x - (0 : EuclideanSpace ℝ (Fin d)) ∈ coordinatePrefixSubmodule d k := by
      simpa using hx
    have hx_smul :
        delta • (x - (0 : EuclideanSpace ℝ (Fin d))) ∈
          coordinatePrefixSubmodule d k :=
      Submodule.smul_mem _ delta hx_sub
    exact coordinatePrefixSubmodule_mono d (Nat.le_succ k) hx_smul

/--
Regularized-chain gradient-span trajectories from zero still satisfy the
source support invariant `x_n ∈ V_n`.
-/
theorem gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_regularizedLowerBoundChainGradient
    {d : ℕ} {beta delta : ℝ}
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient (lowerBoundChainGradient beta d) delta
        (0 : EuclideanSpace ℝ (Fin d))) x) :
    ∀ n, x n ∈ coordinatePrefixSubmodule d n :=
  gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next
    hx0 hspan (fun _ hxk =>
      regularizedLowerBoundChainGradient_mem_coordinatePrefixSubmodule hxk)

/--
Concrete Theorem 4.5 reduction obstruction: a regularized gradient-span run
which is `eps / 2`-near the regularized minimum by time `N` forces the convex
Theorem 4.4 lower-bound quantity to be at most `eps`.
-/
theorem chewi45_convex_lower_bound_le_eps_of_regularizedGradientSpan_near_min
    {beta eps R : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps)
    (hR : 0 < R) (heps_le : eps ≤ beta * R ^ (2 : ℕ))
    {N d : ℕ} (hNd : N ≤ d)
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    {xDelta : EuclideanSpace ℝ (Fin d)}
    (hR_bound : ‖lowerBoundChainMinimizer d‖ ≤ R)
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient (lowerBoundChainGradient beta d)
        (eps / R ^ (2 : ℕ)) (0 : EuclideanSpace ℝ (Fin d))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta d)
        (eps / R ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin d)) (x N) ≤
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
    beta / (8 * ((N : ℝ) + 1)) - beta / (8 * ((d : ℝ) + 1)) ≤ eps := by
  have hx_prefix :
      x N ∈ coordinatePrefixSubmodule d N :=
    gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_regularizedLowerBoundChainGradient
      (x := x) hx0 hspan N
  have hgap_lower :
      beta / (8 * ((N : ℝ) + 1)) - beta / (8 * ((d : ℝ) + 1)) ≤
        lowerBoundChainTextbookObjective beta d (x N) -
          lowerBoundChainTextbookObjective beta d (lowerBoundChainMinimizer d) :=
    lowerBoundChainTextbookObjective_gap_ge_of_mem_coordinatePrefixSubmodule
      hbeta hNd hx_prefix
  have hreduce :=
    chewi45_lowerBoundChain_regularization_reduction_package
      (beta := beta) (eps := eps) (R := R) (d := d)
      (x := x N) (xDelta := xDelta)
      hbeta heps hR heps_le hR_bound hx_near hDelta_le
  exact hgap_lower.trans hreduce.1

/--
`d = 2N + 1` source specialization of the regularized-chain obstruction,
using the canonical radius bound `R = sqrt d`.
-/
theorem chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min
    {beta eps : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    beta / (16 * ((N : ℝ) + 1)) ≤ eps := by
  have hdpos : 0 < 2 * N + 1 := by omega
  have hdpos_real : 0 < ((2 * N + 1 : ℕ) : ℝ) := by exact_mod_cast hdpos
  have hR : 0 < Real.sqrt ((2 * N + 1 : ℕ) : ℝ) :=
    Real.sqrt_pos.2 hdpos_real
  have hraw :=
    chewi45_convex_lower_bound_le_eps_of_regularizedGradientSpan_near_min
      (beta := beta) (eps := eps)
      (R := Real.sqrt ((2 * N + 1 : ℕ) : ℝ))
      (N := N) (d := 2 * N + 1) (x := x) (xDelta := xDelta)
      hbeta heps hR heps_le (by omega)
      (lowerBoundChainMinimizer_norm_le_sqrt_dim (2 * N + 1))
      hx0 hspan hx_near hDelta_le
  have hleft :
      beta / (8 * ((N : ℝ) + 1)) -
          beta / (8 * (((2 * N + 1 : ℕ) : ℝ) + 1)) =
        beta / (16 * ((N : ℝ) + 1)) := by
    have hden : ((N : ℝ) + 1) ≠ 0 := by positivity
    have hden2 : (((2 * N + 1 : ℕ) : ℝ) + 1) ≠ 0 := by positivity
    field_simp [hden, hden2]
    norm_num [Nat.cast_add, Nat.cast_mul]
    ring
  rwa [hleft] at hraw

/--
Contradiction form of the preceding theorem: under the regularization
reduction hypotheses, accuracy `eps < beta / (16 (N+1))` cannot be reached by
time `N` on the `d = 2N + 1` lower-bound chain.
-/
theorem chewi45_not_regularizedGradientSpan_near_min_of_eps_lt_two_mul_add_one_bound
    {beta eps : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    (heps_lt : eps < beta / (16 * ((N : ℝ) + 1)))
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    False := by
  have hle :=
    chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min
      (beta := beta) (eps := eps) hbeta heps N heps_le
      hx0 hspan hx_near hDelta_le
  linarith

/--
Iteration-count form of the `d = 2N + 1` obstruction: the lower-bound
inequality `beta / (16 (N + 1)) <= eps` implies
`beta / (16 eps) - 1 <= N`.
-/
theorem chewi45_iteration_count_ge_of_two_mul_add_one_lower_bound
    {beta eps : ℝ} (heps : 0 < eps) (N : ℕ)
    (hle : beta / (16 * ((N : ℝ) + 1)) ≤ eps) :
    beta / (16 * eps) - 1 ≤ (N : ℝ) := by
  have hdenN : 0 < 16 * ((N : ℝ) + 1) := by positivity
  have hmul :
      beta ≤ eps * (16 * ((N : ℝ) + 1)) :=
    (div_le_iff₀ hdenN).mp hle
  have hden_eps : 0 < 16 * eps := by positivity
  have hdiv :
      beta / (16 * eps) ≤ (N : ℝ) + 1 := by
    rw [div_le_iff₀ hden_eps]
    nlinarith
  linarith

/--
Full regularized-chain near-minimizer obstruction in iteration-count form.
If the regularized lower-bound chain is optimized to `eps / 2` accuracy by a
gradient-span trajectory by time `N`, then `N` must satisfy the corresponding
finite lower bound.
-/
theorem chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min
    {beta eps : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    beta / (16 * eps) - 1 ≤ (N : ℝ) := by
  have hle :=
    chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min
      (beta := beta) (eps := eps) hbeta heps N heps_le
      hx0 hspan hx_near hDelta_le
  exact chewi45_iteration_count_ge_of_two_mul_add_one_lower_bound
    heps N hle

/--
Contradiction form of the iteration-count lower bound: a regularized
gradient-span trajectory cannot reach the stated near-minimum condition by
time `N` when `N < beta / (16 eps) - 1`.
-/
theorem chewi45_not_regularizedGradientSpan_near_min_of_iteration_count_lt
    {beta eps : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    (hN_lt : (N : ℝ) < beta / (16 * eps) - 1)
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    False := by
  have hge :=
    chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min
      (beta := beta) (eps := eps) hbeta heps N heps_le
      hx0 hspan hx_near hDelta_le
  linarith

/--
Generic rate wrapper for the finite Theorem 4.5 obstruction.  Any rate known
to be below the finite lower bound `beta / (16 eps) - 1` is also below the
number of iterations `N`.
-/
theorem chewi45_iteration_count_ge_rate_of_regularizedGradientSpan_near_min
    {beta eps rate : ℝ} (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    (hrate_le : rate ≤ beta / (16 * eps) - 1)
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    rate ≤ (N : ℝ) := by
  have hfinite :=
    chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min
      (beta := beta) (eps := eps) hbeta heps N heps_le
      hx0 hspan hx_near hDelta_le
  exact hrate_le.trans hfinite

/--
Logarithmic-condition-number-shaped wrapper for Chewi Theorem 4.5.  The
remaining analytic/asymptotic comparison is isolated in `hrate_le`; once that
comparison shows `c * sqrt(kappa) * log(ratio) <= beta / (16 eps) - 1`, the
compiled regularized-chain obstruction gives the source-shaped lower bound on
`N`.
-/
theorem chewi45_iteration_count_ge_sqrtKappa_log_rate_of_regularizedGradientSpan_near_min
    {beta eps c kappa ratio : ℝ}
    (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    (hrate_le :
      c * Real.sqrt kappa * Real.log ratio ≤ beta / (16 * eps) - 1)
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    c * Real.sqrt kappa * Real.log ratio ≤ (N : ℝ) := by
  exact chewi45_iteration_count_ge_rate_of_regularizedGradientSpan_near_min
    (beta := beta) (eps := eps)
    (rate := c * Real.sqrt kappa * Real.log ratio)
    hbeta heps N heps_le hrate_le hx0 hspan hx_near hDelta_le

/--
Contradiction form of the logarithmic-condition-number-shaped wrapper: a run
cannot satisfy the near-minimum hypotheses by time `N` if `N` is below a
logarithmic rate which has already been compared to the finite obstruction.
-/
theorem chewi45_not_regularizedGradientSpan_near_min_of_sqrtKappa_log_rate_lt
    {beta eps c kappa ratio : ℝ}
    (hbeta : 0 ≤ beta) (heps : 0 < eps) (N : ℕ)
    (heps_le :
      eps ≤ beta * (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
    (hrate_le :
      c * Real.sqrt kappa * Real.log ratio ≤ beta / (16 * eps) - 1)
    (hN_lt : (N : ℝ) < c * Real.sqrt kappa * Real.log ratio)
    {x : ℕ -> EuclideanSpace ℝ (Fin (2 * N + 1))}
    {xDelta : EuclideanSpace ℝ (Fin (2 * N + 1))}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (regularizedGradient
        (lowerBoundChainGradient beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))) x)
    (hx_near :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) (x N) ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1))) xDelta ≤
      quadraticRegularizedAround
        (lowerBoundChainTextbookObjective beta (2 * N + 1))
        (eps / (Real.sqrt ((2 * N + 1 : ℕ) : ℝ)) ^ (2 : ℕ))
        (0 : EuclideanSpace ℝ (Fin (2 * N + 1)))
        (lowerBoundChainMinimizer (2 * N + 1))) :
    False := by
  have hge :=
    chewi45_iteration_count_ge_sqrtKappa_log_rate_of_regularizedGradientSpan_near_min
      (beta := beta) (eps := eps) (c := c) (kappa := kappa)
      (ratio := ratio)
      hbeta heps N heps_le hrate_le hx0 hspan hx_near hDelta_le
  linarith

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
