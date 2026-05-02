# VdVW Lemma 1.2.3 Outer And Inner Probability Report

Source item: van der Vaart and Wellner, *Weak Convergence and Empirical
Processes*, Lemma 1.2.3.

Current Lean status: theorem-layer complete for the nonnegative event version
needed by the empirical-process development.  The local library proves that
outer probability is nonnegative outer expectation of an event indicator, adds
the complementary inner-probability primitive, and proves that inner
probability agrees with ordinary measure on null-measurable events.

This is not yet the full extended-real arbitrary-map statement of Lemma 1.2.3.
The pending textbook-compatible layer is the lower measurable cover
`(1_B)_*`, inner expectation for arbitrary maps, and the exact pointwise
cover identity in part (iii).

## Proved Lean Declarations

| Lean declaration | File | Status |
| --- | --- | --- |
| `VdVWEventIndicator` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | definition |
| `VdVWMeasurableSetCover` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | structure |
| `VdVWMeasurableSetCover.ofToMeasurable` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | definition from mathlib measurable hull |
| `VdVWMeasurableSetCover.indicatorMajorant` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | definition |
| `VdVWOuterExpectation_eventIndicator_eq_measure` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proved |
| `VdVWInnerProbability` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | definition |
| `VdVWInnerProbability_add_outerMeasure_compl` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proved |
| `VdVWInnerProbability_add_outerMeasure_compl_eq_one` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proved |
| `VdVWInnerProbability_eq_measure_of_nullMeasurable` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proved |
| `VdVWInnerProbability_eq_measure_of_measurable` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proved |
| `VdVWMeasurableCover.eventIndicatorOfToMeasurable` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proof-carrying cover |
| `VdVWOuterExpectation_eq_lintegral_eventIndicatorCover` | `StatInference/EmpiricalProcess/OuterExpectation.lean` | proved |

## Textbook Source Anchors

- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md`, lines 438-445.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_lemma_1_2_1_pdf_page_6.png`.

The markdown passage states Lemma 1.2.3 for arbitrary subsets of the sample
space: outer probability is outer expectation of the event indicator, inner
probability is the corresponding lower expectation of the event indicator, a
measurable cover exists, and the upper/lower indicator covers satisfy a
complement identity.

## Mathlib Reuse

The proof reuses mathlib's measure-theory foundations rather than restating
them locally:

- `toMeasurable`, `measurableSet_toMeasurable`, `subset_toMeasurable`,
  `measure_toMeasurable`;
- `lintegral_indicator_one`, `meas_le_lintegral₀`;
- `measure_add_measure_compl₀`, `measure_add_measure_compl`;
- `measure_mono`, `measure_ne_top`;
- `ENNReal.eq_sub_of_add_eq`, `tsub_add_cancel_of_le`;
- `IsProbabilityMeasure.measure_univ`.

## Verification

Promotion requires:

```bash
lake env lean StatInference/EmpiricalProcess/OuterExpectation.lean
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

At promotion time these checks were run locally with Lean/Lake as the
authority.
