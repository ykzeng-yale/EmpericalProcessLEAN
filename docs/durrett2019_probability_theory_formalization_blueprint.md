# Durrett 2019 Probability Theory Formalization Blueprint

This document starts the Durrett 2019 probability-theory lane for the Lean
formalization in `StatInference/`.  The source crosswalk is Richard Durrett,
*Probability: Theory and Examples*, fifth edition, 2019.  The Lean code for
Durrett-specific theorem packaging should live in the content-based folder
`StatInference/ProbabilityTheory/`; reusable lower-level probability-measure
infrastructure should continue to live in `StatInference/ProbabilityMeasure/`.

The lane follows the existing Billingsley and Optimization proof-orchestration
style inside this chat: search first, reuse mathlib and local wrappers
aggressively, prove theorem-sized Lean packets, verify locally, update the
route docs, then sync GitHub.  The goal is full-book coverage over time, but
each in-thread cycle should choose the next largest theorem step that can
actually compile.

## Local Sources

- Markdown chunks:
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_245-366.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_367-490.md`
- PDF anchors:
  - `Textbooks/Durrett2019ProbabilityTheory/PDF/Durrett2019 - Probability Theory and Examples.pdf`
  - matching split PDFs in the same directory.

## In-Thread Goal Maintenance

The Durrett lane is an active `/goal` in this chat, not a recurring automation.
At the end of every cycle that proves, blocks, merges, commits, pushes, or
materially changes the route, refresh the route state from:

1. `docs/durrett2019_probability_theory_current_blocker_primitive_plan.md`;
2. `docs/durrett2019_probability_theory_progress_dashboard.md`;
3. this blueprint;
4. the latest pushed commit and current remote contributions.

Each refreshed in-thread target should name the latest verified declarations,
one primary theorem target, parallel support targets, search-first scope,
verification gate, and report gate.  Do not replay a solved target.

## Status Vocabulary

- `exact-local`: exact textbook item statement is formalized and proved with no
  `sorry`, `admit`, unreviewed `axiom`, or `unsafe`, and a report may be
  prepared.
- `source-wrapper`: compiled Durrett-named theorem wrapper around mathlib or
  existing local code; useful for source crosswalks, but not yet a full theorem
  report unless the statement is exact.
- `local-layer`: compiled supporting primitive that moves toward a source item.
- `mathlib-foundation`: mathlib already has the mathematical theorem/API, but
  no Durrett-exact wrapper/report exists yet.
- `reused-local`: existing `StatInference/ProbabilityMeasure`,
  `EmpiricalProcess`, or `Asymptotics` declaration is the proof authority.
- `pending-local`: not started.
- `deferred-application`: example or optional starred topic temporarily skipped
  because it needs substantial external-domain formalization.

## Book Spine

- Chapter 1: measure theory, probability spaces, distributions, measurable
  maps, integration, expected value, product measures, Fubini.
- Chapter 2: independence, weak laws, Borel-Cantelli, strong laws, random
  series, renewal theory, large deviations.
- Chapter 3: central limit theorems, characteristic functions, CLT variants,
  infinitely divisible laws, limit theorems in `R^d`.
- Chapter 4: conditional expectation and martingales, convergence,
  inequalities, optional stopping, random walk applications.
- Chapter 5: Markov chains, construction, Markov properties, recurrence,
  transience, stationary distributions, convergence theorem.
- Chapter 6: ergodic theorems.
- Chapter 7: Brownian motion and stochastic calculus foundations.
- Chapter 8: Donsker theorem, Brownian-motion limit theory, CLT for dependent
  sequences, law of the iterated logarithm.
- Appendix: extension, uniqueness, Radon-Nikodym, conditional probability,
  Kolmogorov extension, analytic support.

## Priority Lanes

### Lane A: Chapter 2 independence and product laws

Durrett Sections 2.1.1-2.1.3 are the first high-leverage lane.  They connect
generated sigma-field wrappers, mathlib independence APIs, local product
measure wrappers, and later LLN/CLT/martingale proofs.

Source anchors:

- Theorem 2.1.6, pi-lambda theorem:
  `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`
  around the Section 2.1.1 independence proof.
- Theorem 2.1.7, independent pi-systems generate independent sigma-fields.
- Theorem 2.1.8, distribution-function criterion for independence.
- Theorem 2.1.9, independent grouped sigma-fields.
- Theorem 2.1.10, functions of disjoint independent random-variable blocks are
  independent.
- Theorem 2.1.11, independent random variables have product joint law.
- Theorem 2.1.12, expectation/Fubini formula for independent pairs.
- Theorem 2.1.13, expectation of a product of independent variables.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- mathlib `Probability.Independence.Basic`
- mathlib `Probability.Independence.Integration`
- mathlib `Probability.HasLaw`
- mathlib `Probability.Process.FiniteDimensionalLaws`

The first theorem-sized Durrett packet should package theorem statements whose
proof authority is already mathlib/local.  Avoid rebuilding Dynkin-system
foundations unless mathlib lacks the exact generated-independence bridge needed
for Theorems 2.1.7-2.1.10.

### Lane B: Borel-Cantelli and convergence upgrades

Durrett Section 2.3 is immediately reusable and already partly covered by
`StatInference/ProbabilityMeasure/BorelCantelli.lean`.

Source anchors:

- Theorem 2.3.1, first Borel-Cantelli lemma.
- Theorem 2.3.2, convergence in probability iff every subsequence has an a.s.
  convergent further subsequence.
- Theorem 2.3.4, continuous mapping for convergence in probability and bounded
  expectation convergence.
- Theorem 2.3.7, second Borel-Cantelli lemma.
- Theorem 2.3.9, pairwise-independent record-count strong ratio.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- mathlib `Probability.BorelCantelli`
- mathlib convergence-in-measure/probability APIs

Compiled first source wrappers:

- Durrett Theorem 2.3.1 around `measure_limsup_atTop_eq_zero`.
- Durrett Theorem 2.3.7 around `measure_limsup_eq_one`.
- Durrett Theorem 2.4.1 around `strongLaw_ae_real` and
  `centeredStrongLaw_ae_real`.
- Early pi-system uniqueness bridge around
  `probabilityMeasure_ext_of_generate_finite`.
- Durrett Theorem 1.1.1 measure-property wrappers and Theorems 1.3.1/1.3.4
  measurability wrappers.
- Durrett Theorem 2.1.7 generated-pi-system independence, Theorem 2.1.8
  generated-rectangle/distribution-function criterion support, Theorem 2.1.9
  grouped sigma-field independence, Theorem 2.1.10 measurable-function
  preservation/finite disjoint-block/product-coordinate independence, 2.1.11
  pair and finite-family product laws, 2.1.12 product/Fubini expectation, and
  2.1.13 expectation-factorization wrappers.
- Durrett Theorem 2.4.9 conditional Glivenko-Cantelli handoffs from supplied
  endpoint grids and supplied middle CDF partitions.

The subsequence and continuous-mapping theorems are higher value but may require
more topological convergence API packaging.

### Lane C: Strong laws and empirical distribution functions

Durrett Section 2.4 is a major downstream target and overlaps with existing
Billingsley/VdV&W infrastructure.

Source anchors:

- Theorem 2.4.1, Etemadi strong law for pairwise independent identically
  distributed integrable variables.
- Lemma 2.4.2, truncation reduction.
- Lemma 2.4.3, variance summability for truncations.
- Lemma 2.4.4, scalar tail-sum bound.
- Theorem 2.4.5, infinite positive mean strong divergence.
- Theorem 2.4.7, renewal-count asymptotic.
- Theorem 2.4.9, Glivenko-Cantelli theorem.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- mathlib `Probability.StrongLaw`
- mathlib Borel-Cantelli and layer-cake/tail integrals

Mathlib currently supplies a real-valued strong law under pairwise independence
and identical distribution through the local wrapper
`strongLaw_ae_real`.  Durrett Theorem 2.4.1 should therefore start as a
source-wrapper over that theorem; this wrapper is now compiled in
`StatInference/ProbabilityTheory/Basic.lean`.  The next aggressive target is
Durrett Theorem 2.4.9, Glivenko-Cantelli for empirical CDFs, by reusing the
existing `RealHalfLineGC.lean` fixed-endpoint and half-line infrastructure and
filling the arbitrary-CDF finite quantile grid/squeezing layer.  The supplied
endpoint-grid and supplied middle-CDF-partition handoffs now compile, so the
remaining theorem-core primitive is the arbitrary-distribution middle partition
constructor.

### Lane D: CLT and characteristic functions

Chapter 3 is the next large probability-theory spine after laws of large
numbers.  Search mathlib for characteristic functions, weak convergence, normal
distribution APIs, and finite-dimensional weak convergence before formalizing.

Likely initial source items:

- Lemma 3.1.1, scalar exponential limit.
- Theorem 3.1.2, de Moivre-Laplace local limit.
- Section 3.3 characteristic functions and inversion formula.
- Section 3.4 central limit theorems.
- Section 3.10 limit theorems in `R^d`.

### Lane E: martingales, Markov chains, Brownian motion

These later chapters should be prepared by read-only search first.  They are
valuable, but should not block the early Chapter 2 coverage unless a remote
agent has already landed reusable support.

Likely anchors:

- Chapter 4: conditional expectation, martingale convergence, optional
  stopping.
- Chapter 5: Markov chain construction, Markov property, recurrence,
  stationary distributions.
- Chapter 7/8: Brownian motion and Donsker theorem.

## Initial Reuse Audit

High-value local files:

- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`

High-value mathlib search roots:

- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/PiSystem.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/MeasurableSpace/Pi.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Prod.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Integration.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLaw.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLawExists.lean`
- `.lake/packages/mathlib/Mathlib/Probability/IdentDistrib.lean`
- `.lake/packages/mathlib/Mathlib/Probability/BorelCantelli.lean`
- `.lake/packages/mathlib/Mathlib/Probability/StrongLaw.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`

## Report Gate

No Durrett theorem report should be produced until an exact source statement is
fully proved in Lean, the corresponding source anchor is cross-checked against
the PDF/Markdown, screenshots or source excerpts are captured under the report
policy, and the local report artifact compiles.
