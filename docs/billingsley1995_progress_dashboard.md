# Billingsley 1995 Progress Dashboard

This dashboard tracks the Billingsley support lane for `StatInference/`.  It is
separate from the VdV&W Chapter 1-2 dashboard, but the two lanes should share
mathlib searches and local primitives whenever possible.

## Snapshot

- Source assets: local PDF and five Markdown chunks available under
  `Textbooks/Billingsley1995/`.
- Lean namespace started: `StatInference.ProbabilityMeasure`.
- Lean code location: content-based folder `StatInference/ProbabilityMeasure/`
  rather than an author-named folder.
- First modules: `StatInference/ProbabilityMeasure/WeakConvergence.lean`,
  `StatInference/ProbabilityMeasure/FiniteDimensional.lean`,
  `StatInference/ProbabilityMeasure/ProductMeasure.lean`,
  `StatInference/ProbabilityMeasure/GeneratedSigma.lean`, and
  `StatInference/ProbabilityMeasure/BorelCantelli.lean`,
  `StatInference/ProbabilityMeasure/StrongLaw.lean`, and
  `StatInference/ProbabilityMeasure/Tail.lean`, re-exported by
  `StatInference/ProbabilityMeasure/Basic.lean`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Billingsley report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Section 25 weak convergence and tightness | local-wrapper | `StatInference/ProbabilityMeasure/WeakConvergence.lean` | Reuses mathlib and local VdV&W wrappers for probability-measure weak convergence, tightness, Portmanteau, Levy-Prokhorov, continuous mapping, products, FDD restriction, and Slutsky. |
| Sections 15-16 integration/tails/UI | local-wrapper | `StatInference/ProbabilityMeasure/Tail.lean`; `StatInference/EmpiricalProcess/OuterExpectation.lean`; `StatInference/EmpiricalProcess/Theorem243.lean` | Mathlib-backed layer-cake, tail-integral monotonicity, split-at-radius, and Markov wrappers are available for VdV&W Theorem 2.4.3 envelope-tail and truncation handoffs. These are content-based support wrappers, not exact Billingsley Sections 15-16 theorem reports. |
| Section 18 product/Fubini | local-wrapper | `StatInference/ProbabilityMeasure/ProductMeasure.lean` | Product probability measures, Tonelli/Fubini, finite independent-product expectation wrappers, product-coordinate marginal projection, and separated product-expectation wrappers are available. These are content-based local wrappers over mathlib/local APIs for empirical-process independent-copy work, not exact Billingsley Section 18 theorem reports. |
| Sections 4/6/20/22 independence, Borel-Cantelli, strong laws, empirical distribution | local-wrapper/mathlib-foundation | `StatInference/ProbabilityMeasure/BorelCantelli.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Mathlib-backed first/second Borel-Cantelli and strong-law wrappers are available for tail-event and endpoint empirical-average arguments. `RealHalfLineGC.lean` also contains local pointwise empirical-CDF support wrappers for fixed half-line endpoints, including fixed-endpoint convergence-in-probability/`TendstoInMeasure` and outer-probability handoffs. These are content-based support wrappers, not exact Billingsley theorem reports; Theorem 6.1 and the uniform empirical distribution function statement of Theorem 20.6 remain pending until source-matched statements are selected, proved, and reported. |
| Sections 3/10-14 sigma-fields and measurable maps | local-layer/mathlib-foundation | `StatInference/ProbabilityMeasure/GeneratedSigma.lean`; `BallSigma.lean`, `RealHalfLine.lean` nearby | GeneratedSigma wrappers now pin Billingsley generated-sigma-field anchors over mathlib's generated measurable-space API; pi-lambda, uniqueness/extension, measurable-map, and pushforward machinery remain mathlib-backed support wrappers, with no exact Billingsley theorem report yet. |
| Sections 36-38 process laws/cylinders/separability | local-wrapper | `StatInference/ProbabilityMeasure/FiniteDimensional.lean` | Started finite-dimensional law wrappers over mathlib; defer broad path-space theory until needed. |
| Examples/applications | deferred-example | none | Defer domain-heavy applications unless a nearby theorem route requires them. |

## Initial Reuse Audit

High-value mathlib files already searched:

- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Portmanteau.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Tight.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Prokhorov.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/PiSystem.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/Layercake.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Typeclasses/Finite.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/MeasurableSpace/Pi.lean`
- `.lake/packages/mathlib/Mathlib/Probability/StrongLaw.lean`
- `.lake/packages/mathlib/Mathlib/Probability/BorelCantelli.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Process/FiniteDimensionalLaws.lean`

High-value local files:

- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/OuterExpectation.lean`
- `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`
- `StatInference/EmpiricalProcess/Theorem243.lean`
- `StatInference/EmpiricalProcess/BallSigma.lean`
- `StatInference/EmpiricalProcess/RealHalfLine.lean`

## Current Active Target

Near-term target: use Billingsley Section 16 and Section 18 as a probability
support lane for VdV&W Theorem 2.4.3.

Concrete next edits:

1. Keep the probability-measure integration-tail wrapper module
   `StatInference/ProbabilityMeasure/Tail.lean` compiling, and add only
   VdV&W-specific handoffs directly to the empirical-process files.
2. Prove the envelope-tail handoff for outer expectation using existing
   measurable cover and nonnegative outer-expectation APIs.
3. Add a source-crosswalk note in this dashboard before any exact theorem
   report is created.

## Report Gate

Before any `Reports/Billingsley1995_.../` folder is created:

1. Exact textbook statement must be selected and recorded in the inventory.
2. Lean statement must match the selected textbook item, modulo explicitly
   documented mathlib-compatible assumptions.
3. The proof must compile with no proof holes.
4. Local PDF screenshots must be embedded in `source_screenshots.md`.
5. The report must compile locally to `report.pdf`.
