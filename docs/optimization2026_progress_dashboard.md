# Optimization 2026 Progress Dashboard

This dashboard tracks the Chewi optimization formalization lane for
`StatInference/`.

## Snapshot

- Source assets: local PDF and Markdown are available under
  `Textbooks/Optimization2026/`.
- Lean namespace started: `StatInference.Optimization`.
- Lean code location: content-based folder `StatInference/Optimization/`.
- First module: `StatInference/Optimization/Basic.lean`, imported by
  `StatInference.lean`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Optimization report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
- Exercise policy: all Optimization textbook exercise statements and exercise
  proofs live in the single module `StatInference/Optimization/Exercises.lean`.
  The main-text theorem lane remains priority; exercise statements can be
  formalized there when useful for reuse, and full exercise proofs can be added
  opportunistically when they are cheap or unlock theorem progress.
- Automation policy: the Optimization heartbeat is currently paused while this
  thread runs under an explicit manual goal.  If reactivated, refresh the live
  prompt from the blocker plan and dashboard before ending any proof run.
- Manual goal policy: the app-level `/goal` objective text cannot be edited
  directly in this tool surface unless the goal is complete.  Until the full
  textbook formalization is complete, use
  `docs/optimization2026_current_blocker_primitive_plan.md` as the live
  replacement goal prompt and avoid replaying completed Theorem 3.4/3.6 setup
  work.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 convexity/smoothness foundations | local-layer/mathlib-foundation | `StatInference/Optimization/Basic.lean`, `StatInference/Optimization/Minimizer.lean`; mathlib `StrongConvexOn`, `ConvexOn`, `StrictConvexOn`, `HasGradientAt` | Initial interfaces for strong convexity, Chewi convexity, smooth upper models, gradient-descent steps, first-order lower models, strong gradient monotonicity, Exercise 3.1 co-coercivity, PL, h-scaled step co-coercivity, mathlib-gradient Lipschitzness, and GD trajectories compile as the intended surface for Definition 1.5, Definition 1.12, Definition 2.5, Proposition 1.6, Exercise 3.1, and Chapter 3. Chewi's segment `StrongConvexOn C f alpha` now bridges both ways with mathlib's root `_root_.StrongConvexOn C alpha f`; parameter downshift compiles for local `StrongConvexOn` via mathlib's root `StrongConvexOn.mono`, and for `FirstOrderStrongConvexOn` by direct lower-model algebra. Nonnegative Chewi strong convexity exposes both Chewi convexity and mathlib `ConvexOn`. Proposition 1.6 now has `(1.3) => (1.4)` on `Set.univ` from segment `StrongConvexOn` plus `HasGradientAt`, and `(1.4) => (1.5)` from `FirstOrderStrongConvexOn` to `StronglyMonotoneGradientOn`. Lemma 1.10 minimizer uniqueness and Corollary 1.11-style gradient-zero characterization wrappers compile in `Minimizer.lean`. Prefer mathlib's `StrongConvexOn`, `ConvexOn`, `StrictConvexOn`, and `gradient` APIs for exact derivative-heavy theorem routes. |
| Chapter 2 gradient flow and PL/QG | local-layer | `StatInference/Optimization/GradientFlow.lean`, `StatInference/Optimization/Theorem27.lean`, `StatInference/Optimization/Theorem28.lean` | Gradient-flow trajectory interface now compiles. Lemma 2.1 derivative identity, gap derivative, and value antitonicity compile from mathlib `HasGradientAt` plus chain rule. Theorem 2.2 has the squared-distance derivative identity, the strong-monotonicity differential inequality, weighted exponential squared-distance contraction, and the literal norm-form contraction from supplied monotonicity, first-order strong convexity, and actual whole-space `StrongConvexOn` plus `HasGradientAt`. Theorem 2.4 now has the interval-integral weighted-forcing step, monotone-gap weighted lower bound, positive-`alpha` denominator convergence, and `alpha = 0` limiting convergence from first-order strong convexity and whole-space `StrongConvexOn` plus `HasGradientAt`; the newest wrappers discharge the exposed interval-integrability assumptions from continuity of the gradient-oracle trajectory on `[0,t]`. Corollary 2.6 has the PL differential inequality and source-shaped exponential function-gap convergence. Proposition 2.7 now has the compiled strong-convexity-to-PL implication plus exact `QuadraticGrowthOn`/witness forms, the algebra from Chewi's gradient-flow limit route to `(QG)`, and bridges from explicit Lyapunov routes down to `(QG)`. The newest bridge compiles component, norm-derivative, nonzero-displacement, continuous-data, and side-condition routes: it uses mathlib `antitoneOn_of_hasDerivWithinAt_nonpos`, `HasDerivWithinAt.norm_sq`/`sqrt`, `ContinuousOn.sqrt`/`norm`, `HasDerivAt.continuousOn`, local `gradientFlow_gap_hasDerivAt`, and the scalar PL sign calculation `plLyapunovDerivativeBound_nonpos`. The latest branch split adds nontrivial-start limit/Lyapunov routes, a nontrivial-start side-condition route to `(QG)`, and now a no-minimizer-hit route which derives positive gap instead of assuming it. Reference-minimizer wrappers now derive the minimizer-value invariant from one attained minimizer, so the nontrivial-start and no-minimizer-hit QG routes no longer need a global `fstar`-value assumption. Corollary 2.8 now compiles through the integrated Lemma 2.1 identity, squared-gradient average bound, interval-minimum square-root form from an `IsMinOn` representative, and a compactness/continuity wrapper that discharges the minimizing-time and integrability hypotheses. Next Chapter 2 target is discharging or sharply packaging the remaining nontrivial-start convergence-to-minimizer, feasible trajectory membership, no-minimizer-hit, and nonzero-displacement side conditions behind Proposition 2.7(2). |
| Chapter 3 smooth gradient descent | local-layer | `gradientDescentStep`, `IsGradientDescentTrajectory`, `DiscreteGronwall.lean`, `GradientDescent.lean`, `Theorem33.lean`, `Theorem34.lean`, `Theorem36.lean`, `Theorem37.lean`, `Exercises.lean` | First deterministic GD trajectory interface is available. Chewi Lemma 3.5 now has zero-based and source-shaped one-based compiled wrappers, Chewi Lemma 3.1 is compiled from the smooth upper-model interface, GD function values are antitone under the descent step-size condition, Theorem 3.3 contraction compiles in squared and norm forms from supplied gradient monotonicity, supplied first-order lower model, and actual whole-space segment `StrongConvexOn` plus `HasGradientAt`; Exercise 3.1 co-coercivity now compiles in whole-space smooth-convex form and supplies Theorem 3.3 wrappers without a separate co-coercivity assumption. The newest Exercise 3.1 wrappers also remove the separate alpha-zero convexity hypothesis: `0 <= alpha` now downshifts `FirstOrderStrongConvexOn` or `StrongConvexOn` to the convex lower model internally. Theorem 3.4 positive-`alpha` plus `alpha = 0` denominator bounds compile from the first-order model and from actual whole-space `StrongConvexOn` plus `HasGradientAt`. Theorem 3.6 PL convergence compiles from the descent lemma plus scalar recurrence, and Theorem 3.7 compiles in existential and finite-minimum gradient-norm forms from the descent lemma plus finite telescoping/average APIs. Next target should be source-audited report packaging for a strongest compiled main-text declaration or Chapter 2 gradient-flow expansion; exercises may be formalized opportunistically in the single exercise module. |
| Chapter 4 convex/strongly-convex reductions | local-layer | `StatInference/Optimization/Reductions.lean` | Chewi Lemma 4.2's regularization spine and condition-number wrapper now compile. `quadraticRegularizedAround` and `regularizedGradient` model `f_delta = f + delta / 2 * ‖· - x0‖^2`; regularization shifts first-order lower-model parameter `alpha` to `alpha + delta`, shifts smoothness `beta` to `beta + delta`, and `SmoothWithGradientOn.mono` promotes bounded smoothness constants. Source-shaped value, radius, and complexity hooks compile through `quadraticRegularizedAround_near_min_gap_le_eps_of_radius`, `regularized_minimizer_dist_le_radius_of_base_min_delta`, `regularized_conditionNumber_le`, `lemma42_regularization_complexity_package`, `lemma42_regularization_reduction_package`, and `lemma42_regularization_reduction_package_of_isMinOn`. Search-first result: no local condition-number/regularization layer existed; reused `FirstOrderStrongConvexOn`, `SmoothWithGradientOn`, `norm_add_sq_real`, `real_inner_smul_left`, `sq_le_sq₀`, `div_le_iff₀`, `div_le_div_of_nonneg_right`, `field_simp`, and `mul_le_mul_of_nonneg_left`. Next target is to connect this Lemma 4.2 reduction package with the compiled Theorem 4.4 lower-bound lane to get Theorem 4.5. |
| Chapter 4 lower bounds | local-layer | `StatInference/Optimization/LowerBounds.lean` | Definition 4.3 gradient-span algorithms now compile through `gradientSpanSubmodule`, `affineGradientSpan`, and `IsGradientSpanTrajectory`; the source example "GD is a gradient span algorithm" compiles as `IsGradientDescentTrajectory.isGradientSpanTrajectory` plus source-shaped membership wrappers. The source subspaces `V_n` in Theorem 4.4 now compile as `coordinatePrefixSubmodule` over `EuclideanSpace ℝ (Fin d)`, with monotonicity, eventual top, span-containment, and the abstract induction `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next`. The tridiagonal chain-gradient oracle now compiles as `lowerBoundChainGradient`; `lowerBoundChainGradient_mem_coordinatePrefixSubmodule` proves the displayed support calculation `x ∈ V_k -> grad x ∈ V_{k+1}`, and `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_lowerBoundChainGradient` assembles the zero-start trajectory induction. The displayed minimizer candidate now compiles as `lowerBoundChainMinimizer`, `lowerBoundChainGradient_lowerBoundChainMinimizer` proves the chain-gradient vanishes there, and `lowerBoundChainMinimizer_norm_sq_le_dim` proves the source estimate `‖x_*‖² ≤ d` from coordinate square bounds. The shifted lower-bound quadratic compiles as `lowerBoundChainObjective`, and the exact unshifted source display now compiles as `lowerBoundChainTextbookObjective`; minimizer values, global `IsMinOn` theorems, the direct textbook `(f_N)_*` lower bound, finite-dimensional gap wrappers, the norm-scaled final lower-bound line, and the `d = 2N + 1` source-objective corollary all compile. The objective-gradient algebra now includes zero-boundary direction nodes/edges, exact edge residual subtraction/addition, exact shifted and source-objective quadratic expansions, summation-by-parts from edge work to `inner ℝ (lowerBoundChainGradient beta d x) v`, the uniform direction-energy bound for `β`-smoothness, first-order convex lower-model wrappers, continuity, and `SmoothWithGradientOn Set.univ` wrappers for both shifted and unshifted objectives. This captures `f_d = f_N` on `V_N` as a direct lower bound, proves the finite-dimensional Theorem 4.4 gap, and specializes to the clean `β / (16 * (N + 1))` lower bound. Search-first result: no local Chewi gradient-span/objective layer existed; mathlib `Submodule.span`, `Submodule.subset_span`, `Submodule.span_mono`, `EuclideanSpace.real_norm_sq_eq`, `Finset.sum_le_sum`, `sq_sum_le_card_mul_sum_sq`, `isMinOn_univ_iff`, `Finset.sum_map`, `Finset.sum_le_sum_of_subset_of_nonneg`, `one_div_le_one_div`, finite-type sum constants, `Fin.sum_univ_castSucc`, `Fin.sum_univ_succ`, and `EuclideanSpace`/`PiLp` coordinate-continuity APIs are the reusable foundation. Next Chapter 4 step is exact source-report packaging around Theorem 4.4 or continuing to the strongly-convex lower bound Theorem 4.5 if report packaging is deferred. |
| Chapter 4 strongly-convex lower bound | local-layer | `StatInference/Optimization/Theorem45.lean` | The concrete strongly-convex chain setup for Theorem 4.5 now compiles. `strongLowerBoundChainObjective alpha beta d` regularizes the source lower-bound chain with base smoothness `beta - alpha` around the origin, and `strongLowerBoundChainGradient` is its supplied gradient. Compiled declarations include apply lemmas, `strongLowerBoundChainObjective_firstOrderStrongConvexOn`, `strongLowerBoundChainObjective_smoothWithGradientOn`, `strongLowerBoundChainGradient_mem_coordinatePrefixSubmodule`, `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_strongLowerBoundChainGradient`, and `chewi45_regularized_chain_interface_package`. The gap witness layer adds `coordinateTailSq`, `coordinateTailSq_le_sqdist_of_mem_coordinatePrefixSubmodule`, `strongLowerBoundChainObjective_gap_ge_tailSq_of_gradient_eq_zero`, and `strongLowerBoundChainObjective_gap_ge_tailSq_of_gradientSpanTrajectory`: any zero-gradient minimizer candidate with tail outside `V_N` forces a function-value gap for every gradient-span iterate in `V_N`. The newest reduction layer instantiates Lemma 4.2 on the concrete Theorem 4.4 lower-bound chain: `lowerBoundChainMinimizer_norm_le_sqrt_dim`, `chewi45_lowerBoundChain_regularization_complexity_package`, `chewi45_lowerBoundChain_regularization_reduction_package`, and `chewi45_lowerBoundChain_regularization_reduction_package_sqrt_dim` compile. Search-first result: reused `LowerBounds.lean`'s first-order/smooth chain wrappers, global minimizer, radius estimate, and prefix-subspace induction; reused `Reductions.lean`'s regularization packages; reused mathlib `Real.sq_sqrt`, `Real.sqrt_pos`, `sq_le_sq₀`, `EuclideanSpace.real_norm_sq_eq`, `Finset.filter`, and `Finset.sum_le_sum_of_subset_of_nonneg`. Next target is the geometric/logarithmic rate assembly: either close the direct Exercise 4.2 tail lower bound for the regularized chain or package the Lemma 4.2 + Theorem 4.4 lower-bound implication into a source-shaped Theorem 4.5 statement. |
| Chapters 5-11 deterministic algorithms | pending-local | none | Acceleration, nonsmooth optimization, Frank-Wolfe, proximal methods, Fenchel duality, mirror methods, and alternating minimization should wait until the basic convex/smooth/GD layer is stable. |
| Chapter 12 stochastic optimization | pending-local | none | Should reuse `StatInference/ProbabilityMeasure` and empirical-process probability wrappers where possible. |
| Chapter 13 and Appendix A | pending-local/mathlib-foundation | none | Matrix, PSD, eigenvalue, operator norm, Newton, self-concordance, and barrier material should reuse mathlib linear algebra and matrix APIs before local definitions. |

## Initial Reuse Audit

High-value mathlib files to search first:

- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Function.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Strong.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Deriv.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/Gradient/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Normed.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Topology.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/FDeriv/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/FDeriv/MeanValue.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/ContDiff/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/ODE/DiscreteGronwall.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/ODE/Gronwall.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/InnerProductSpace/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Matrix/Order.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Matrix/PosDef.lean`
- `.lake/packages/mathlib/Mathlib/LinearAlgebra/Matrix/Symmetric.lean`
- `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/Lipschitz.lean`

High-value local files:

- `StatInference/Asymptotics/Basic.lean`
- `StatInference/EmpiricalProcess/Basic.lean`
- `StatInference/ProbabilityMeasure/Basic.lean`

## Current Active Target

Latest proof target: Chapter 4 Theorem 4.5 strongly-convex lower-bound assembly.  The
`StatInference/Optimization/Reductions.lean` module compiles the quadratic
regularization spine: regularized objective/gradient definitions, first-order
strong-convexity and smoothness parameter shifts, the source value chain
`f(x) <= f_delta(x) <= min f_delta + eps / 2`, the epsilon-gap corollary once
the regularization penalty is bounded, the radius-to-penalty bound, the
regularized-minimizer distance estimate, `beta + delta <= 2 beta`, the
condition-number bound `(beta + delta) / delta <= 2 * beta * R^2 / eps`, and
source-shaped reduction packages using either `f xStar <= f xDelta` or
`IsMinOn f Set.univ xStar`.  Do not redo this or the Theorem 3.4/Chapter 4
lower-bound foundation work.  `StatInference/Optimization/Theorem45.lean` now
also compiles the concrete regularized lower-bound chain objective, its
`alpha`-strong-convexity and `beta`-smoothness interfaces, and the prefix
support invariant for gradient-span trajectories.  It also compiles the
tail-energy witness theorem: a zero-gradient minimizer candidate with a
nontrivial tail outside `V_N` gives a certified gap for any gradient-span
iterate.  The latest reduction layer also instantiates Lemma 4.2 on the
concrete lower-bound chain, including the source radius `‖x_*‖ <= sqrt d`,
the condition-number package, and the value-reduction package with
`R = sqrt d`.  The next aggressive step is now the geometric/logarithmic rate
assembly: either close the direct Exercise 4.2 tail lower bound for the
regularized chain or package the Lemma 4.2 + Theorem 4.4 reduction into a
source-shaped Theorem 4.5 statement.

Exercise statement/proof formalizations belong in
`StatInference/Optimization/Exercises.lean`.  The main theorem lane remains
the priority, but cheap or reusable exercise derivations may be added there
opportunistically when they help theorem progress.

Current compiled Chapter 3 spine:

1. Lemma 3.5 discrete Gronwall: zero-based and source-shaped one-based forms.
2. Lemma 3.1 descent lemma from `SmoothWithGradientOn`, including
   source-shaped `h <= 1 / beta` wrapper.
3. Theorem 3.3 contraction layer, including first-order lower-model,
   source-step co-coercivity wrappers, and whole-space Exercise 3.1
   co-coercivity discharge in `Exercises.lean`.
4. Theorem 3.4 function-value convergence supplied-interface assembly,
   recurrence bridge, finite denominator bounds, positive-`alpha` closed
   denominator, and `alpha = 0` limiting wrapper.
5. Theorem 3.6 PL convergence layer.
6. Theorem 3.7 gradient-norm convergence layer in existential and finite-min
   display forms.

Next high-value task: build the strongly-convex lower-bound rate statement
past the solved regularization plumbing.  Search mathlib/local APIs for finite
geometric sums, recurrence solutions, logarithm/order wrappers, and
asymptotic iteration-count wrappers before adding any local complexity
primitive.  The two viable routes are: direct Exercise 4.2 geometric
minimizer/tail lower bound for `strongLowerBoundChainObjective`, or the
source-shaped Lemma 4.2 reduction from the compiled Theorem 4.4 lower bound.
Keep any exercise work opportunistic and centralized in
`StatInference/Optimization/Exercises.lean`; the main theorem lane remains the
priority.
