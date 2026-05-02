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
  `StatInference/ProbabilityMeasure/FiniteDimensional.lean`, and
  `StatInference/ProbabilityMeasure/ProductMeasure.lean`, re-exported by
  `StatInference/ProbabilityMeasure/Basic.lean`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Billingsley report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Section 25 weak convergence and tightness | local-wrapper | `StatInference/ProbabilityMeasure/WeakConvergence.lean` | Reuses mathlib and local VdV&W wrappers for probability-measure weak convergence, tightness, Portmanteau, Levy-Prokhorov, continuous mapping, products, FDD restriction, and Slutsky. |
| Sections 15-16 integration/tails/UI | priority-local | pending | Highest near-term value for VdV&W Theorem 2.4.3 envelope-tail and truncation handoffs. |
| Section 18 product/Fubini | local-wrapper | `StatInference/ProbabilityMeasure/ProductMeasure.lean` | Product probability measures, Tonelli/Fubini, and finite independent-product expectation wrappers started. |
| Sections 4/6/20/22 independence, Borel-Cantelli, SLLN | mathlib-foundation | `EndpointStrongLaw.lean` nearby | Mathlib has strong laws, independence, and Borel-Cantelli APIs; add Billingsley wrappers only when they unblock exact items. |
| Sections 3/10-14 sigma-fields and measurable maps | mathlib-foundation | `BallSigma.lean`, `RealHalfLine.lean` nearby | Generated sigma-field, pi-lambda, Borel, and ball/half-line APIs are mostly mathlib-covered. |
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

1. Add a probability-measure integration-tail wrapper module or add directly to the
   relevant empirical-process file if the theorem is VdV&W-specific.
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
