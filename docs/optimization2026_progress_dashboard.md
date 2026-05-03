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
| Chapter 1 convexity/smoothness foundations | local-layer/mathlib-foundation | `StatInference/Optimization/Basic.lean`; mathlib `StrongConvexOn`, `ConvexOn`, `gradient` | Initial interfaces for strong convexity, Chewi convexity, smooth upper models, gradient-descent steps, first-order lower models, strong gradient monotonicity, Exercise 3.1 co-coercivity, PL, h-scaled step co-coercivity, mathlib-gradient Lipschitzness, and GD trajectories compile as the intended surface for Definition 1.5, Definition 1.12, Definition 2.5, Proposition 1.6, Exercise 3.1, and Chapter 3. The Proposition 1.6 `(1.4) => (1.5)` bridge from `FirstOrderStrongConvexOn` to `StronglyMonotoneGradientOn` now compiles, and `GradientCocoerciveOn` supplies `GradientStepCocoerciveOn` under `h <= 1 / beta`. Prefer mathlib's `StrongConvexOn`, `ConvexOn`, and `gradient` APIs for exact derivative-heavy theorem routes. |
| Chapter 2 gradient flow | pending-local | none | Reuse mathlib `Analysis/ODE/Gronwall.lean`; exact gradient-flow modeling still needs a choice of differentiability/ODE interface. |
| Chapter 3 smooth gradient descent | local-layer | `gradientDescentStep`, `IsGradientDescentTrajectory`, `DiscreteGronwall.lean`, `GradientDescent.lean`, `Theorem33.lean`, `Theorem34.lean`, `Theorem36.lean`, `Theorem37.lean` | First deterministic GD trajectory interface is available. Chewi Lemma 3.5 now has zero-based and source-shaped one-based compiled wrappers, Chewi Lemma 3.1 is compiled from the smooth upper-model interface, GD function values are antitone under the descent step-size condition, Theorem 3.3 contraction compiles in squared and norm forms from either supplied gradient monotonicity or the supplied first-order lower model plus Exercise 3.1 display (3.5), Theorem 3.4 positive-`alpha` plus `alpha = 0` denominator bounds compile from the first-order strong-convexity supplied interface, Theorem 3.6 PL convergence compiles from the descent lemma plus scalar recurrence, and Theorem 3.7 compiles in existential gradient-norm form from the descent lemma plus finite telescoping/average APIs. Next target should be finite-min source packaging or source-audited report packaging; exercise proofs are deferred. |
| Chapter 4 lower bounds | pending-local | none | Requires oracle/gradient-span interfaces and finite-dimensional Euclidean/matrix support. |
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

Latest verified proof target: Chewi Theorem 3.7, the main-text
gradient-norm/stationary point theorem, now compiles in
`StatInference/Optimization/Theorem37.lean` in the source-faithful existence
form over `n < N`.  It reuses Lemma 3.1 from `GradientDescent.lean`,
telescopes `∑ n in Finset.range N, (f (x n) - f (x (n + 1)))`, applies a
finite average/existence argument over `n < N`, and converts the squared bound
to the square-root norm bound.

Do not spend proof runs on Chapter 3 exercise derivations for now.  Exercise
statements may remain supplied interfaces when they unblock main-text
Theorem 3.3/3.4 style results; their derivations are deferred until after the
main theorem lane is covered.

Current compiled Chapter 3 spine:

1. Lemma 3.5 discrete Gronwall: zero-based and source-shaped one-based forms.
2. Lemma 3.1 descent lemma from `SmoothWithGradientOn`, including
   source-shaped `h <= 1 / beta` wrapper.
3. Theorem 3.3 contraction supplied-interface layer, including first-order
   lower-model and source-step co-coercivity wrappers.
4. Theorem 3.4 function-value convergence supplied-interface assembly,
   recurrence bridge, finite denominator bounds, positive-`alpha` closed
   denominator, and `alpha = 0` limiting wrapper.
5. Theorem 3.6 PL convergence layer.
6. Theorem 3.7 gradient-norm convergence layer in existential form.

Next high-value tasks: package the literal finite-min display for Theorem 3.7
if the required `Finset.inf'`/finite-min API layer is lightweight; otherwise
prepare source-audited report packaging for an exact compiled Chapter 3
main-text item, with local source screenshots and report PDF, after the exact
declaration chosen for reporting is verified.
