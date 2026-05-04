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
- `StatInference.Optimization.FirstOrderStrongConvexOn`
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
- `StatInference.Optimization.plGradientFlowLyapunov_inequality_of_sideConditionData`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovRoute`
- `StatInference.Optimization.plGradientFlowLimitNonMinimizerRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionRoute`
- `StatInference.Optimization.QuadraticGrowthWitnessOn.quadraticGrowthOn`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovSideConditionRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovContinuousDataRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionRoute`

Near-term exact candidates:

1. Definition 1.4/1.5 wrappers against mathlib `Convex`/`ConvexOn` and
   root-level mathlib `StrongConvexOn`.
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

1. Discharge `PLGradientFlowLyapunovSideConditionRouteToQGOn` by
   formalizing or cleanly supplying the gradient-flow convergence/minimizer
   interface, positive-gap, and nonzero-displacement side conditions.  The
   derivative-to-antitone bridge, PL scalar sign calculation, objective-gap
   derivative, nonzero norm-derivative calculation, trajectory/gap continuity,
   and Lyapunov-continuity wrapper already compile for Proposition 2.7(2).
2. Remove or discharge the interval-integrability assumptions in Theorem 2.4
   from the notes' `C²`/regular trajectory hypotheses if a clean mathlib
   continuity route is available.
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
3. Theorem 3.3 contraction of gradient descent as a main-text theorem with
   one exercise interface.  `StatInference/Optimization/Theorem33.lean`
   now compiles the squared-distance and norm contraction forms from the
   source-shaped `StronglyMonotoneGradientOn` and `GradientStepCocoerciveOn`
   interfaces, plus wrappers deriving gradient monotonicity from
   `FirstOrderStrongConvexOn` and from actual whole-space segment
   `StrongConvexOn` plus `HasGradientAt`.  Exercise 3.1 display `(3.5)` still
   supplies co-coercivity under `h <= 1 / beta`; proving (3.5) itself belongs
   in `StatInference/Optimization/Exercises.lean` and may be handled
   opportunistically when it advances theorem reuse.
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
