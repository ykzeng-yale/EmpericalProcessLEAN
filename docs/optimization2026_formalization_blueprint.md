# Optimization 2026 Formalization Blueprint

This document starts the Chewi optimization lane for `StatInference/`.  The
Lean code lives in the content-based folder `StatInference/Optimization/`,
while the source crosswalk is Sinho Chewi, *Lectures on Optimization*,
March 22, 2026.

The lane has two goals:

1. Formalize the theorem-proof optimization textbook from the local
   markdown/PDF source.
2. Build reusable deterministic optimization foundations for statistical
   learning, empirical-risk minimization, stochastic approximation, and later
   theorem routes in `StatInference/`.

The lane should stay search-first: before adding a local primitive, search
pinned mathlib under `.lake/packages/mathlib`, then search nearby
`StatInference` modules for an existing proof-carrying wrapper.

## Automation Prompt Maintenance

The recurring Chewi optimization automation is an active proof-state
orchestrator.  At the end of every run that proves, blocks, merges, commits, or
pushes a theorem-line or reusable optimization layer, refresh the live
automation prompt so the next heartbeat starts from the verified current
frontier.

The prompt update should be driven by:

1. `docs/optimization2026_current_blocker_primitive_plan.md`;
2. `docs/optimization2026_progress_dashboard.md`;
3. the latest pushed commit and verified Lean declarations;
4. recent GitHub contributions from other agents that can be reused or merged.

Each refreshed prompt should name one next aggressive proof target, the
dependency order after it, the required mathlib/local searches, and the
verification/report gate.  This avoids replaying stale broad instructions after
another agent has already moved the frontier.

The recurring automation is currently paused while this thread runs under a
manual `/goal`.  The current app-level goal objective text cannot be edited
directly in this tool surface unless the goal is complete, so
`docs/optimization2026_current_blocker_primitive_plan.md` carries the live
replacement prompt for manual runs.

## Local Sources

- Markdown source:
  - `Textbooks/Optimization2026/Optimization_SinhoChewi_sp26.md`
- PDF anchor:
  - `Textbooks/Optimization2026/Optimization_SinhoChewi_sp26.pdf`

## Status Vocabulary

- `exact-local`: exact textbook item statement is formalized and proved with no
  `sorry`, `admit`, unreviewed `axiom`, or `unsafe`, and a report may be
  prepared.
- `local-wrapper`: compiled Lean wrapper around mathlib or existing local code,
  useful for Chewi naming and source crosswalks but not yet an exact
  source-audited textbook theorem report.
- `local-layer`: compiled supporting primitive or lemma that moves toward an
  exact item.
- `mathlib-foundation`: mathlib has the mathematical theorem/API, but no
  Chewi-exact wrapper/report exists yet.
- `priority-local`: missing local theorem or primitive that directly helps the
  Optimization route.
- `pending-local`: not started.
- `deferred-example`: example/application temporarily skipped because it would
  require substantial external-domain formalization not needed for the current
  optimization main line.

## Priority Lanes

### Lane A: Convexity and smoothness foundations

Source anchors:

- Definition 1.4 convex sets: markdown line 147.
- Definition 1.5 alpha-convex/strongly convex functions: markdown line 149.
- Proposition 1.6 convexity equivalences: markdown line 161.
- Lemma 1.7 existence of minimizer: markdown line 219.
- Lemma 1.8 necessary optimality conditions: markdown line 223.
- Lemma 1.9 sufficient optimality condition: markdown line 234.
- Lemma 1.10 uniqueness of minimizer: markdown line 241.
- Corollary 1.11 strongly convex unique minimizer: markdown line 247.
- Definition 1.12 beta-smooth functions: markdown line 251.
- Proposition 1.13 smoothness equivalences: markdown line 261.

Initial Lean module:

- `StatInference/Optimization/Basic.lean`

Current compiled surface:

- `StatInference.Optimization.StrongConvexOn`
- `StatInference.Optimization.ChewiConvexOn`
- `StatInference.Optimization.StrongConvexOn.to_mathlibStrongConvexOn`
- `StatInference.Optimization.StrongConvexOn.of_mathlibStrongConvexOn`
- `StatInference.Optimization.strongConvexOn_iff_mathlibStrongConvexOn`
- `StatInference.Optimization.StrongConvexOn.mono`
- `StatInference.Optimization.StrongConvexOn.chewiConvexOn`
- `StatInference.Optimization.StrongConvexOn.convexOn`
- `StatInference.Optimization.ChewiConvexOn.convexOn`
- `StatInference.Optimization.FirstOrderStrongConvexOn`
- `StatInference.Optimization.FirstOrderStrongConvexOn.mono`
- `StatInference.Optimization.FirstOrderStrongConvexOn.convex`
- `StatInference.Optimization.SmoothWithGradientOn`
- `StatInference.Optimization.gradientDescentStep`
- `StatInference.Optimization.IsGradientDescentTrajectory`
- `StatInference.Optimization.HasLipschitzGradientOn`
- `StatInference.Optimization.gradientStep`
- `StatInference.Optimization.FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.FirstOrderStrongConvexOn.stronglyMonotoneGradientOn`
- `StatInference.Optimization.StrongConvexOn.strictConvexOn`
- `StatInference.Optimization.minimizer_unique_of_strictConvexOn`
- `StatInference.Optimization.minimizer_unique_of_strongConvexOn`
- `StatInference.Optimization.gradient_eq_zero_of_isMinOn_univ_hasGradientAt`
- `StatInference.Optimization.QuadraticGrowthOn`
- `StatInference.Optimization.QuadraticGrowthWitnessOn`
- `StatInference.Optimization.PLGradientFlowLimitRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLimitNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovContinuousDataRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovSideConditionRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn`
- `StatInference.Optimization.positive_gap_of_not_isMinOn`
- `StatInference.Optimization.minimizer_value_eq_of_reference_minimizer`
- `StatInference.Optimization.plGradientFlowLyapunov_inequality_of_sideConditionData`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovRoute`
- `StatInference.Optimization.plGradientFlowLimitNonMinimizerRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_noMinimizerHitRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionRoute`
- `StatInference.Optimization.QuadraticGrowthWitnessOn.quadraticGrowthOn`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovNoMinimizerHitRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovSideConditionRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNoMinimizerHitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNoMinimizerHitRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovContinuousDataRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionRoute`

Near-term exact candidates:

1. Use the compiled Definition 1.4/1.5 bridges
   `StrongConvexOn.to_mathlibStrongConvexOn`,
   `StrongConvexOn.of_mathlibStrongConvexOn`, and
   `strongConvexOn_iff_mathlibStrongConvexOn` when later theorem routes want
   mathlib's root `StrongConvexOn`/`ConvexOn` API; do not reprove this
   equivalence.  Reuse `StrongConvexOn.mono`,
   `StrongConvexOn.chewiConvexOn`, `FirstOrderStrongConvexOn.mono`, and
   `FirstOrderStrongConvexOn.convex` when a theorem route needs to downshift
   from nonnegative strong convexity to the alpha-zero convex lower model.
2. Source-audited packaging for Lemma 1.10 uniqueness of minimizer under
   strict convexity, now compiled via mathlib `StrictConvexOn.eq_of_isMinOn`.
3. Corollary 1.11 existence/coercivity layer; uniqueness and gradient-zero
   characterization wrappers compile, while existence from strong convexity
   still needs a coercivity/compactness argument.
4. Proposition 1.6 remaining directions beyond the compiled
   `(1.3) => (1.4)` whole-space bridge and `(1.4) => (1.5)` swap-and-add
   bridge.

### Lane B: Continuous-time gradient flow

Source anchors:

- Lemma 2.1 descent property of gradient flow: markdown line 316.
- Theorem 2.2 contraction of gradient flow: markdown line 325.
- Lemma 2.3 Gronwall: markdown line 341.
- Theorem 2.4 function-value convergence of gradient flow: markdown line 372.
- Definition 2.5 Polyak-Lojasiewicz inequality: markdown line 406.
- Corollary 2.6 convergence under PL: markdown line 416.
- Proposition 2.7 strong convexity implies PL implies quadratic growth:
  markdown line 423.
- Corollary 2.8 convergence in gradient norm: markdown line 479.

Search anchors:

- `.lake/packages/mathlib/Mathlib/Analysis/ODE/DiscreteGronwall.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/ODE/Gronwall.lean`
- mathlib differentiability and ODE APIs
- local `StatInference/Asymptotics/Basic.lean`

Current compiled surface:

- `StatInference.Optimization.IsGradientFlowTrajectory`
- `StatInference.Optimization.gradientFlow_value_hasDerivAt`
- `StatInference.Optimization.gradientFlow_gap_hasDerivAt`
- `StatInference.Optimization.gradientFlow_value_deriv_nonpos`
- `StatInference.Optimization.gradientFlow_value_antitone`
- `StatInference.Optimization.gradientFlow_sqdist_hasDerivAt`
- `StatInference.Optimization.gradientFlow_sqdist_deriv_le_of_stronglyMonotoneGradientOn`
- `StatInference.Optimization.gradientFlow_sqdist_deriv_le_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.gradientFlow_sqdist_deriv_le_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.scalarExpWeighted_antitone_of_hasDerivAt_le`
- `StatInference.Optimization.scalarExpWeighted_le_initial_of_hasDerivAt_le`
- `StatInference.Optimization.scalarExpDecay_le_of_hasDerivAt_le`
- `StatInference.Optimization.chewi22_sqdist_weighted_le_of_stronglyMonotoneGradientOn`
- `StatInference.Optimization.chewi22_sqdist_weighted_le_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi22_sqdist_weighted_le_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.chewi22_dist_le_exp_of_stronglyMonotoneGradientOn`
- `StatInference.Optimization.chewi22_dist_le_exp_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi22_dist_le_exp_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.gradientFlow_sqdist_to_point_hasDerivAt`
- `StatInference.Optimization.gradientFlow_sqdist_to_minimizer_deriv_le_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.gradientFlow_sqdist_to_minimizer_deriv_le_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.scalarWeightedGrowthIntegral_nonneg_of_hasDerivAt_le`
- `StatInference.Optimization.weightedGrowthIntegral_lower_bound`
- `StatInference.Optimization.scalarIntegral_nonneg_of_hasDerivAt_le`
- `StatInference.Optimization.integral_lower_bound_of_monotone_gap`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_growth_bound`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_firstOrderStrongConvexOn_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_strongConvexOn_univ_hasGradientAt_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_strongConvexOn_univ_hasGradientAt_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_weighted_bound`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_weighted_bound`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_weighted_gap_bound`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_weighted_gap_bound`
- `StatInference.Optimization.gradientFlow_gap_deriv_le_of_polyakLojasiewiczOn`
- `StatInference.Optimization.chewi26_gap_weighted_le_of_polyakLojasiewiczOn`
- `StatInference.Optimization.chewi26_gap_le_exp_of_polyakLojasiewiczOn`
- `StatInference.Optimization.gradientFlow_grad_sq_integral_eq_value_drop`
- `StatInference.Optimization.chewi28_gradient_sq_integral_bound`
- `StatInference.Optimization.chewi28_gradient_sq_average_bound`
- `StatInference.Optimization.chewi28_interval_sq_lower_bound_le_average`
- `StatInference.Optimization.chewi28_min_grad_norm_le_of_isMinOn`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn_norm`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn_grad`

Near-term exact candidates:

1. Discharge `PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn` by
   formalizing or cleanly supplying the gradient-flow convergence/minimizer
   interface, feasible positive-time membership, no minimizer hit, and
   nonzero-displacement side conditions.  The derivative-to-antitone bridge,
   PL scalar sign calculation, positive-gap derivation from no minimizer hit,
   objective-gap derivative, nonzero norm-derivative calculation,
   trajectory/gap continuity, Lyapunov-continuity wrapper, and
   reference-minimizer replacement for the global minimizer-value invariant
   already compile for Proposition 2.7(2).
2. Theorem 2.4 now has wrappers discharging the interval-integrability
   assumptions from continuity of `s ↦ grad (x s)` on `[0,t]`, together with
   gradient-flow differentiability and `HasGradientAt`.  A later exact report
   can decide whether to present this regularity input directly or package it
   behind a `C¹`/`C²` trajectory surface matching the notes.
3. Strengthen the regularity bridge behind Corollary 2.8 only if needed for
   the Proposition 2.7(2) analytic route; the compact-minimum and
   continuity-to-integrability pieces already compile.

### Lane C: Discrete gradient descent and algorithmic rates

Source anchors:

- Lemma 3.1 descent lemma: markdown line 555.
- Definition 3.2 condition number: markdown line 569.
- Theorem 3.3 contraction of gradient descent: markdown line 573.
- Theorem 3.4 function-value convergence of gradient descent: markdown line 601.
- Lemma 3.5 discrete Gronwall: markdown line 641.
- Theorem 3.6 convergence of gradient descent under PL: markdown line 685.
- Theorem 3.7 gradient-norm convergence: markdown line 701.

Near-term exact candidates:

1. Lemma 3.5 discrete Gronwall as a standalone deterministic sequence lemma.
   The zero-based power/range display specialization is compiled in
   `StatInference/Optimization/DiscreteGronwall.lean`, and the source-shaped
   one-based display wrapper is also compiled; mathlib's product/Ico forms
   remain the reusable foundation.
2. Lemma 3.1 descent lemma from the smooth upper-model interface.  The local
   supplied-gradient version is compiled in
   `StatInference/Optimization/GradientDescent.lean`, including the source
   step-size corollary `h <= 1 / beta` under `0 < beta`, and the
   function-value antitonicity lemma for GD trajectories.
3. Theorem 3.3 contraction of gradient descent as a main-text theorem.
   `StatInference/Optimization/Theorem33.lean` compiles the squared-distance
   and norm contraction forms from the source-shaped
   `StronglyMonotoneGradientOn` and `GradientStepCocoerciveOn` interfaces,
   plus wrappers deriving gradient monotonicity from `FirstOrderStrongConvexOn`
   and from actual whole-space segment `StrongConvexOn` plus `HasGradientAt`.
   `StatInference/Optimization/Exercises.lean` now proves the whole-space
   Exercise 3.1 co-coercivity display `(3.5)` from convexity plus
   `SmoothWithGradientOn`, and provides Theorem 3.3 squared/norm wrappers with
   the co-coercivity input discharged for the whole-space smooth-convex route.
   Those wrappers now use the local parameter-downshift lemmas, so callers
   provide `0 <= alpha` rather than a separate alpha-zero convexity hypothesis.
4. Theorem 3.4 as a convergence theorem from actual whole-space
   `StrongConvexOn` plus `HasGradientAt`.  `Theorem34.lean` assumes the
   one-step recurrence (3.1), uses the compiled Gronwall theorem for the
   weighted finite-sum bound, provides the source-indexed one-based display,
   adds the monotone-gap weighted lower-bound helper, proves the finite and
   positive-`alpha` closed geometric denominator corollaries, proves the
   `alpha = 0` limiting display, proves the one-step recurrence from the
   first-order lower model plus Lemma 3.1, and now derives the first-order
   lower model from segment strong convexity plus `HasGradientAt` on
   `Set.univ`.
5. Theorem 3.6 convergence under PL.  `StatInference/Optimization/Theorem36.lean`
   now compiles a source-shaped PL interface, the one-step PL gap recurrence
   from Lemma 3.1, a scalar nonnegative-factor recurrence unrolling, and the
   source step-size wrapper for `h <= 1 / beta`.
6. Theorem 3.7 gradient-norm/stationary point convergence.
   `StatInference/Optimization/Theorem37.lean` now compiles the existential
   source-faithful form over `n < N` and the literal finite-min display using
   `(Finset.range N).inf'`.  It reuses the compiled descent lemma, proves the
   telescope/finite-average layer over `Finset.range N`, converts the squared
   bound with `Real.le_sqrt_of_sq_le`, and avoids Chapter 3 exercise proof
   derivations.

Exercise formalization policy: all exercises from the Optimization notes
should be formalized in `StatInference/Optimization/Exercises.lean`.  Main
textbook theorem modules may keep exercise statements as supplied interfaces
when needed for theorem reuse, but new exercise statements/proofs should be
centralized in that single exercise module.  The main theorem lane remains the
aggressive priority, while exercise statements and proofs may be added
opportunistically when they are cheap, reusable, or unblock a textbook theorem.

### Lane D: Later textbook expansion

Chapter 4 lower-bound expansion has now started in
`StatInference/Optimization/LowerBounds.lean`.  The compiled surface is:

- `StatInference.Optimization.gradientSpanSubmodule`
- `StatInference.Optimization.affineGradientSpan`
- `StatInference.Optimization.IsGradientSpanTrajectory`
- `StatInference.Optimization.mem_affineGradientSpan_iff`
- `StatInference.Optimization.gradient_mem_gradientSpanSubmodule`
- `StatInference.Optimization.gradientSpanSubmodule_mono`
- `StatInference.Optimization.gradientDescentStep_sub_initial_mem_gradientSpanSubmodule`
- `StatInference.Optimization.IsGradientDescentTrajectory.isGradientSpanTrajectory`
- `StatInference.Optimization.gradientDescentTrajectory_mem_gradientSpanSubmodule`
- `StatInference.Optimization.gradientDescentTrajectory_mem_affineGradientSpan`
- `StatInference.Optimization.coordinatePrefixSubmodule`
- `StatInference.Optimization.mem_coordinatePrefixSubmodule_iff`
- `StatInference.Optimization.coordinatePrefixSubmodule_mono`
- `StatInference.Optimization.coordinatePrefixSubmodule_eq_top_of_le`
- `StatInference.Optimization.gradientSpanSubmodule_le_coordinatePrefixSubmodule`
- `StatInference.Optimization.gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next`
- `StatInference.Optimization.lowerBoundChainGradient`
- `StatInference.Optimization.lowerBoundChainNode`
- `StatInference.Optimization.lowerBoundChainEdge`
- `StatInference.Optimization.lowerBoundChainDirectionNode`
- `StatInference.Optimization.lowerBoundChainDirectionEdge`
- `StatInference.Optimization.lowerBoundChainEdge_sub`
- `StatInference.Optimization.lowerBoundChainEdge_add_direction`
- `StatInference.Optimization.finSum_forwardDifference`
- `StatInference.Optimization.lowerBoundChainEdge_sum`
- `StatInference.Optimization.lowerBoundChainObjective`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction`
- `StatInference.Optimization.lowerBoundChainDirectionEnergy_nonneg`
- `StatInference.Optimization.sq_sub_le_two_mul_sq_add_two_mul_sq`
- `StatInference.Optimization.lowerBoundChain_directionNode_succ_sq_sum`
- `StatInference.Optimization.lowerBoundChain_directionNode_sq_sum`
- `StatInference.Optimization.lowerBoundChainDirectionEnergy_le_four_norm_sq`
- `StatInference.Optimization.lowerBoundChain_sum_mul_directionNode_succ`
- `StatInference.Optimization.lowerBoundChain_sum_mul_directionNode`
- `StatInference.Optimization.lowerBoundChain_edge_direction_sum_eq_edgeDifference_sum`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_ge_linear`
- `StatInference.Optimization.lowerBoundChainObjective_ge_linear`
- `StatInference.Optimization.lowerBoundChainTextbookObjective`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_add_direction`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_linear`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_eq_objective_gap`
- `StatInference.Optimization.lowerBoundChainGradient_eq_edgeDifference`
- `StatInference.Optimization.inner_lowerBoundChainGradient_eq_edgeDifference_sum`
- `StatInference.Optimization.inner_lowerBoundChainGradient_eq_edgeDirection_sum`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_inner`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_ge_inner`
- `StatInference.Optimization.lowerBoundChainObjective_ge_inner`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_add_direction_inner`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_inner`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_le_smooth`
- `StatInference.Optimization.lowerBoundChainObjective_le_smooth`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_add_direction_le_smooth`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_le_smooth`
- `StatInference.Optimization.continuous_lowerBoundChainNode`
- `StatInference.Optimization.continuous_lowerBoundChainEdge`
- `StatInference.Optimization.continuous_lowerBoundChainObjective`
- `StatInference.Optimization.continuous_lowerBoundChainTextbookObjective`
- `StatInference.Optimization.lowerBoundChainObjective_firstOrderConvex`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_firstOrderConvex`
- `StatInference.Optimization.lowerBoundChainObjective_smoothWithGradientOn`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_smoothWithGradientOn`
- `StatInference.Optimization.lowerBoundChainGradient_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_lowerBoundChainGradient`
- `StatInference.Optimization.lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainGradient_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainMinimizer_coord_nonneg`
- `StatInference.Optimization.lowerBoundChainMinimizer_coord_le_one`
- `StatInference.Optimization.lowerBoundChainMinimizer_coord_sq_le_one`
- `StatInference.Optimization.lowerBoundChainMinimizer_norm_sq_le_dim`
- `StatInference.Optimization.lowerBoundChainNode_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainEdge_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainObjective_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChain_edgeSquareSum_ge`
- `StatInference.Optimization.lowerBoundChainObjective_ge_minValue`
- `StatInference.Optimization.lowerBoundChainObjective_isMinOn_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_minValue`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_isMinOn_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChain_prefixEdge_sum_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChain_prefixEdgeSquareSum_ge_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChain_prefixEdgeSquareSum_le_full`
- `StatInference.Optimization.lowerBoundChainObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChainObjective_gap_ge_of_gradientSpanTrajectory`
- `StatInference.Optimization.lowerBoundChainObjective_gap_ge_two_mul_add_one`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_ge_of_gradientSpanTrajectory`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_ge_norm_scaled_of_gradientSpanTrajectory`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_ge_two_mul_add_one`

Search-first result for this lane: there was no local Chewi gradient-span
formalization; mathlib's `Submodule.span`, `Submodule.subset_span`, and
`Submodule.span_mono` provide the reusable algebraic foundation, while
mathlib's `EuclideanSpace ℝ (Fin d)`/`PiLp` coordinate API is the right model
for the source's `ℝ^d`.  The norm estimate reuses
`EuclideanSpace.real_norm_sq_eq` and `Finset.sum_le_sum` instead of opening a
new coordinate norm primitive.  The actual lower-bound quadratic is now
modeled as `lowerBoundChainObjective` using extended boundary nodes
`1, x_0, ..., x_{d-1}, 0`; the exact displayed minimizer value
`β / (8 * (d + 1))` compiles by reducing every edge difference to
`-1 / (d + 1)`.  The tridiagonal chain-gradient support calculation,
displayed minimizer candidate, vanishing-gradient theorem, edge-difference
gradient bridge, `‖x_*‖² ≤ d` estimate, minimizer-value theorem, finite
telescoping identity, Cauchy edge-energy bound, global objective lower bound,
and `IsMinOn` minimizer theorem for Theorem 4.4 now compile on top of this
interface.  Search found and reused mathlib's `sq_sum_le_card_mul_sum_sq` for
the Cauchy step, mathlib's `isMinOn_univ_iff` for the global minimizer
wrapper, and `Finset.sum_map` plus
`Finset.sum_le_sum_of_subset_of_nonneg` to compare prefix edge energy with the
full chain energy.  The objective-gradient/smoothness package now compiles:
`lowerBoundChainDirectionNode` and `lowerBoundChainDirectionEdge` model
homogeneous zero-boundary direction chains; `lowerBoundChainEdge_sub` and
`lowerBoundChainEdge_add_direction` prove exact edge residual updates;
`lowerBoundChainObjective_add_direction` gives the exact quadratic expansion;
the nonnegative remainder gives edge-coordinate first-order lower models for
both shifted and unshifted objectives; and
`inner_lowerBoundChainGradient_eq_edgeDifference_sum` connects the compiled
tridiagonal gradient to its coordinate inner-product sum.  The new
summation-by-parts theorem
`lowerBoundChain_edge_direction_sum_eq_edgeDifference_sum` proves the exact
edge-work/gradient-work identity, and
`lowerBoundChainDirectionEnergy_le_four_norm_sq` proves the finite-dimensional
energy bound behind Chewi's displayed Hessian estimate.  Consequently both the
shifted and unshifted objectives now have first-order convex lower-model
wrappers and `SmoothWithGradientOn Set.univ` wrappers supplied by
`lowerBoundChainGradient`.  The next missing step is source-report packaging
or, if continuing theorem expansion before reporting, the nearby Chapter 4
strongly-convex lower-bound Theorem 4.5 route.  The Lemma 4.2 regularization
spine now compiles separately in `StatInference/Optimization/Reductions.lean`:
`quadraticRegularizedAround`, `regularizedGradient`, first-order
strong-convexity/smoothness parameter shifts, the source value-chain and
epsilon-gap corollaries, the radius-to-penalty hook, the
regularized-minimizer distance estimate, `beta + delta <= 2 beta`, the
textbook-choice arithmetic `delta = eps / R^2`, the condition-number bound,
and the bundled source-shaped packages
`lemma42_regularization_complexity_package`,
`lemma42_regularization_reduction_package`, and
`lemma42_regularization_reduction_package_of_isMinOn`.  Next source-shaped
work should connect Theorem 4.4 to Theorem 4.5 using this compiled reduction.
The concrete Theorem 4.5 setup in `StatInference/Optimization/Theorem45.lean`
now also compiles: it defines `strongLowerBoundChainObjective` and
`strongLowerBoundChainGradient`, proves the `alpha`-strong-convex and
`beta`-smooth supplied interfaces for `0 < alpha < beta`, and proves that
gradient-span trajectories from zero remain in `V_n`.  The newest witness
layer defines `coordinateTailSq` and proves that a supplied zero-gradient
minimizer candidate with tail beyond `V_N` forces a function gap for every
gradient-span trajectory iterate `x_N`.  The concrete Lemma 4.2 reduction
instantiation also now compiles here: `lowerBoundChainMinimizer_norm_le_sqrt_dim`
upgrades the existing `‖x_*‖² <= d` estimate to the source radius
`‖x_*‖ <= sqrt d`, and
`chewi45_lowerBoundChain_regularization_complexity_package`,
`chewi45_lowerBoundChain_regularization_reduction_package`, and
`chewi45_lowerBoundChain_regularization_reduction_package_sqrt_dim` plug the
compiled Theorem 4.4 lower-bound chain into the regularization/condition-number
packages from `Reductions.lean`.  The remaining Theorem 4.5 work is no longer
the Lemma 4.2 bookkeeping; it is the geometric/logarithmic rate statement,
either by the direct Exercise 4.2 tail route or by source-shaped packaging of
the Lemma 4.2 + Theorem 4.4 reduction.  The reduction obstruction itself now
also compiles: `lowerBoundChainTextbookObjective_gap_ge_of_mem_coordinatePrefixSubmodule`
turns prefix-subspace membership into the convex lower-bound gap,
`regularizedLowerBoundChainGradient_mem_coordinatePrefixSubmodule` and
`gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_regularizedLowerBoundChainGradient`
prove the regularized oracle support invariant, and
`chewi45_convex_lower_bound_le_eps_of_regularizedGradientSpan_near_min`,
`chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min`,
and `chewi45_not_regularizedGradientSpan_near_min_of_eps_lt_two_mul_add_one_bound`
give the concrete `d = 2N + 1` obstruction `beta / (16 * (N + 1)) <= eps`
and its contradiction form.  The finite rate wrapper now also compiles:
`chewi45_iteration_count_ge_of_two_mul_add_one_lower_bound` converts the
obstruction to `beta / (16 * eps) - 1 <= N`, and
`chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min` plus
`chewi45_not_regularizedGradientSpan_near_min_of_iteration_count_lt` package
that conclusion for the regularized gradient-span run.  The source-shaped rate
wrappers `chewi45_iteration_count_ge_rate_of_regularizedGradientSpan_near_min`,
`chewi45_iteration_count_ge_sqrtKappa_log_rate_of_regularizedGradientSpan_near_min`,
and `chewi45_not_regularizedGradientSpan_near_min_of_sqrtKappa_log_rate_lt`
now specialize this finite lower bound to an arbitrary rate and to the
Chewi-shaped expression `c * sqrt(kappa) * log(ratio)`, with the remaining
analytic comparison isolated as a separate hypothesis.
The source step
`f_d = f_N` on `V_N` is now packaged as
`lowerBoundChainObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`, and
`lowerBoundChainObjective_gap_ge_of_gradientSpanTrajectory` proves the main
finite-dimensional gap estimate before choosing `d` as a multiple of `N`.
The source-shaped `d = 2N + 1` specialization now compiles as
`lowerBoundChainObjective_gap_ge_two_mul_add_one`, giving the clean
`β / (16 * (N + 1))` lower bound.  The shifted-chain objective is now connected to the exact unshifted
textbook display by `lowerBoundChainTextbookObjective`; its minimizer value is
`-(β / 8) * (1 - 1 / (d + 1))`, and the finite-dimensional plus `d = 2N + 1`
gap estimates have source-objective wrappers.  The textbook `(f_n)_*` step is
also available directly as
`lowerBoundChainTextbookObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`.
Chewi's norm-scaled final line before dimension choice now compiles as
`lowerBoundChainTextbookObjective_gap_ge_norm_scaled_of_gradientSpanTrajectory`,
reusing `lowerBoundChainMinimizer_norm_sq_le_dim` and mathlib reciprocal
monotonicity.

After the basic convex/smooth/GD surface compiles, broaden in this order:

1. Lower bounds and oracle/gradient-span interfaces, Chapter 4.
2. Acceleration and conjugate gradient, Chapter 5.
3. Non-smooth convex optimization, subgradients, projections, and cutting
   planes, Chapter 6.
4. Frank-Wolfe and proximal methods, Chapters 7-8.
5. Fenchel duality and mirror methods, Chapters 9-10.
6. Alternating minimization and optimal transport case study, Chapter 11.
7. Stochastic optimization and Polyak-Ruppert averaging, Chapter 12.
8. Interior point methods, self-concordance, and matrix background,
   Chapter 13 and Appendix A.

## Source-Audit Gate

Every exact textbook theorem or lemma that is fully proved in Lean must get a
report under `Reports/Optimization_<item-number>_<short_slug>/` with:

1. Lean declaration name, file path, and proof status.
2. Every new definition, lemma, structure, or theorem introduced for that
   proof.
3. Markdown source path and line range.
4. PDF source path and local screenshot path for the corresponding passage.
5. `source_screenshots.md` with the real local screenshot images embedded.
6. A locally compiled `report.pdf`.
7. A gap note saying what broader textbook-order compatibility work remains.

Intermediate proof layers should update this blueprint, the dashboard, or the
current blocker plan, not `Reports/`.
