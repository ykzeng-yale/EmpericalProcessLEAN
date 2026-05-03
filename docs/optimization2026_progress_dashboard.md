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
- Automation policy: each heartbeat that changes the verified proof frontier
  must refresh the live automation prompt from the blocker plan and dashboard
  before ending the run.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 convexity/smoothness foundations | local-layer/mathlib-foundation | `StatInference/Optimization/Basic.lean`; mathlib `StrongConvexOn`, `ConvexOn`, `gradient` | Initial interfaces for strong convexity, Chewi convexity, smooth upper models, gradient-descent steps, mathlib-gradient Lipschitzness, and GD trajectories compile as the intended surface for Definition 1.5, Definition 1.12, and Chapter 3. Prefer mathlib's `StrongConvexOn`, `ConvexOn`, and `gradient` APIs for exact derivative-heavy theorem routes. |
| Chapter 2 gradient flow | pending-local | none | Reuse mathlib `Analysis/ODE/Gronwall.lean`; exact gradient-flow modeling still needs a choice of differentiability/ODE interface. |
| Chapter 3 smooth gradient descent | local-layer | `gradientDescentStep`, `IsGradientDescentTrajectory`, `DiscreteGronwall.lean`, `GradientDescent.lean` | First deterministic GD trajectory interface is available. Chewi Lemma 3.5 now has zero-based and source-shaped one-based compiled wrappers, and Chewi Lemma 3.1 is compiled from the smooth upper-model interface. Next target is a supplied-interface Theorem 3.4 assembly layer. |
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

Aggressive target: Chewi Theorem 3.4, the smooth gradient-descent
function-value convergence theorem.  The first atomic dependency is Lemma 3.5
discrete Gronwall, followed by Lemma 3.1 descent lemma.

Near-term target: stabilize a Chapter 1-3 spine that can support exact theorem
reports quickly:

1. Extend `StatInference/Optimization/Basic.lean` only when the next theorem
   needs a primitive.
2. Keep the compiled source-shaped one-based display wrapper for Lemma 3.5
   available for source-audited use, while using the zero-based theorem when it
   is algebraically easier.
3. Keep the compiled Lemma 3.1 descent layer available from
   `SmoothWithGradientOn`.
4. Add a supplied-interface Theorem 3.4 assembly module: weighted finite-sum
   bound first, then monotone-gap and geometric-denominator corollaries.
5. Package the first source-exact report only after an exact Chewi lemma or
   theorem statement compiles and screenshots are captured.

The first atomic proof targets are closed as local layers: Lemma 3.5 and Lemma
3.1 both have compiled theorem declarations.  The remaining Chapter 3 blocker
is Theorem 3.4 assembly from the one-step recurrence, monotonic descent, and
finite/geometric sums.
