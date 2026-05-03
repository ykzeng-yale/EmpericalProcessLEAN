# Optimization 2026 Current Blocker And Primitive Plan

This file is the active blocker register for the Chewi optimization lane.  It
should be checked at the start of each automation run before selecting a proof
target.

## Adaptive Automation Prompt Rule

The recurring Optimization heartbeat is part of the proof state.  Every
automation run should finish by checking whether its live prompt is stale
relative to this file, the dashboard, and the latest verified commit.  If the
run proves a Lean declaration, narrows a blocker, merges another agent's work,
changes the next atomic target, or records a material mathlib/local-code search
result, update the automation prompt before ending the run.

The refreshed prompt should name:

- the latest pushed commit and the exact new declarations or blocker
  refinement;
- a primary theorem/proof target plus the highest-value parallel support
  targets, with dependency order after them;
- the search-first scope: pinned mathlib, local `StatInference`, and existing
  optimization/probability/empirical-process wrappers;
- the verification gate: focused `lake env lean`, targeted `lake build` for
  promoted theorem layers, proof-hole scan, and secret scan;
- the report gate: no Optimization report without an exact source-matched
  theorem/lemma, screenshots, and local report compilation.

Do not update the prompt for wording-only churn.  Do update it whenever the old
prompt would send the next heartbeat toward a solved target, omit a newly
proved dependency, or hide the current blocker.

## Throughput Policy

The Optimization heartbeat should be aggressive proof work, not a one-wrapper
drip feed.  Each run should try to close a primary theorem/proof target and, in
parallel, prepare adjacent support that can be checked independently: mathlib
API discovery, local dependency reuse, source anchors, verification/report
policy, and one bounded Lean/doc worker when safe.  A small primitive is
acceptable only when it is the fastest verified dependency for the active proof
route or when the exact theorem target is blocked and the blocker is recorded
precisely.

## Current Blocker

The Chewi lane now has source materials and an initial compiled content-based
Lean module under `StatInference/Optimization/`, but it does not yet have an
exact source-audited Optimization theorem report.

The blocker is selecting and proving the first theorem whose statement can be
both:

- faithful to the textbook source; and
- low-risk enough to compile quickly without overcommitting to a fragile
  differentiability or finite-dimensional matrix design.

The best aggressive target is Theorem 3.4 function-value convergence of
gradient descent.  Its first atomic target is Lemma 3.5 discrete Gronwall,
followed by Lemma 3.1 descent lemma.  Lemma 3.5 is preferred first because it
is a deterministic recursion theorem over real sequences and does not depend
on Frechet derivatives, ODE modeling, or matrix APIs.

## Search-First Record

Pinned mathlib searches should prioritize:

- `Convex`, `ConvexOn`, `StrictConvexOn`, `ConcaveOn`
- mathlib `StrongConvexOn`, `UniformConvexOn`, `strongConvexOn_zero`,
  `strongConvexOn_iff_convex`, and `StrongConvexOn.strictConvexOn`
- `DifferentiableAt`, `DifferentiableOn`, `fderiv`, `HasFDerivAt`
- `HasGradientAt`, `HasGradientWithinAt`, `gradient`, and
  `hasGradientAt_iff_hasFDerivAt`
- `inner ℝ`, norm-square identities, Cauchy-Schwarz
- `LipschitzWith`, mean-value theorem, Frechet derivative bounds
- `Analysis/ODE/Gronwall.lean`
- finite sums/products and geometric-series lemmas
- matrix PSD/Loewner order/eigenvalue/operator-norm APIs

Local searches should prioritize:

- `StatInference/Optimization/Basic.lean`
- `StatInference/Asymptotics/Basic.lean`
- `StatInference/EmpiricalProcess/Basic.lean`
- `StatInference/ProbabilityMeasure/Basic.lean`

## Primitive Sequence

1. Keep `StatInference/Optimization/Basic.lean` compiling and imported by
   `StatInference.lean`.
2. Add `StatInference/Optimization/DiscreteGronwall.lean` for Chewi Lemma 3.5.
   Keep the theorem statement close to the source: if `u_{n+1} <= A u_n + B_n`
   with `A > 0`, prove the finite unrolled bound used by Theorem 3.4.
3. Add the smallest sequence/geometric-sum helper needed for Lemma 3.5, after
   searching mathlib for existing geometric-sum and finite-sum APIs.
4. Add `StatInference/Optimization/GradientDescent.lean` only after Lemma 3.5
   compiles, and prove Lemma 3.1 from `SmoothWithGradientOn`.
5. Prove the first source-exact report candidate only after the exact theorem
   declaration compiles and source screenshots are captured.

## Verification Gate

Each run that changes Lean must run:

1. focused `lake env lean` on edited Lean files;
2. targeted `lake build StatInference` after root import or theorem-layer
   changes;
3. `rg -n "sorry|admit|axiom|unsafe" StatInference/Optimization docs/optimization2026_*`;
4. a changed-file secret scan before committing or pushing.

## Current Automation Seed

Latest verified local frontier after lane creation:

- `StatInference.Optimization.StrongConvexOn`
- `StatInference.Optimization.ChewiConvexOn`
- `StatInference.Optimization.SmoothWithGradientOn`
- `StatInference.Optimization.gradientDescentStep`
- `StatInference.Optimization.IsGradientDescentTrajectory`
- `StatInference.Optimization.HasLipschitzGradientOn`
- `StatInference.Optimization.gradientStep`
- projection lemmas for convex-set, segment inequality, smooth upper model,
  continuity, mathlib-gradient Lipschitzness, and trajectory successor steps.

Next automation target: pursue Chewi Theorem 3.4 aggressively by first proving
Chewi Lemma 3.5 discrete Gronwall in a new
`StatInference/Optimization/DiscreteGronwall.lean` module, then proving Lemma
3.1 descent lemma from `SmoothWithGradientOn`, and only then assembling the
Theorem 3.4 supplied-interface convergence wrapper.
