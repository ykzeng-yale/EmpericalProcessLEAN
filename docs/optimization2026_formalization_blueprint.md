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
- `StatInference.Optimization.SmoothWithGradientOn`
- `StatInference.Optimization.gradientDescentStep`
- `StatInference.Optimization.IsGradientDescentTrajectory`
- `StatInference.Optimization.HasLipschitzGradientOn`
- `StatInference.Optimization.gradientStep`

Near-term exact candidates:

1. Definition 1.4/1.5 wrappers against mathlib `Convex`/`ConvexOn` and
   root-level mathlib `StrongConvexOn`.
2. Lemma 1.10 uniqueness of minimizer under strict convexity.
3. Corollary 1.11 unique minimizer under a strong-convexity plus existence
   interface.
4. Proposition 1.6 first-order convexity equivalence, after choosing the
   Frechet-derivative/gradient representation.

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
   `StatInference/Optimization/DiscreteGronwall.lean`; mathlib's product/Ico
   forms remain the reusable foundation.
2. Lemma 3.1 descent lemma from the smooth upper-model interface.
3. Theorem 3.4 as a supplied-interface convergence theorem.

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
