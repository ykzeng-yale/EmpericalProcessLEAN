# Crosswalk For Lemma 1.2.3 Event Probability Layer

| Textbook component | Lean realization | Status |
| --- | --- | --- |
| Arbitrary event indicator `1_B` | `VdVWEventIndicator` | proved definition |
| Outer probability as outer expectation of an event indicator | `VdVWOuterExpectation_eventIndicator_eq_measure` | proved for nonnegative indicators using mathlib outer-measure semantics for arbitrary sets |
| Measurable event cover `B*` with unchanged outer measure | `VdVWMeasurableSetCover`, `VdVWMeasurableSetCover.ofToMeasurable` | proved wrapper around mathlib `toMeasurable` |
| Indicator of a measurable cover is a measurable majorant | `VdVWMeasurableSetCover.indicatorMajorant` | proved definition |
| Measurable cover realizes outer expectation of an event indicator | `VdVWMeasurableCover.eventIndicatorOfToMeasurable`, `VdVWOuterExpectation_eq_lintegral_eventIndicatorCover` | proved under finite measure |
| Inner probability as complement of outer probability of the complement | `VdVWInnerProbability` | proved definition in `ℝ≥0∞` |
| Inner probability complement identity | `VdVWInnerProbability_add_outerMeasure_compl`, `VdVWInnerProbability_add_outerMeasure_compl_eq_one` | proved using mathlib `tsub_add_cancel_of_le` and probability total mass |
| Inner probability equals ordinary probability on measurable events | `VdVWInnerProbability_eq_measure_of_nullMeasurable`, `VdVWInnerProbability_eq_measure_of_measurable` | proved using mathlib complement-measure identities |
| Full lower measurable cover `(1_B)_*` and pointwise identity `(1_B)^* + (1_{Ω-B})_* = 1` | pending local layer | requires lower-cover/inner-expectation machinery for arbitrary maps |

## Anchors

| Source | Anchor |
| --- | --- |
| Markdown | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:438-445` |
| PDF screenshot | `Textbooks/Vaart1996/Screenshots/vdvw_lemma_1_2_1_pdf_page_6.png` |
| Lean file | `StatInference/EmpiricalProcess/OuterExpectation.lean` |

## Gap Note

This report promotes the event-probability layer of Lemma 1.2.3, not the
entire extended-real arbitrary-map lemma.  It is sufficient for the current
outer-probability and Glivenko-Cantelli wrappers, while the next Chapter 1.2
target remains lower measurable covers, inner expectation, and the full
cover/complement identity.
