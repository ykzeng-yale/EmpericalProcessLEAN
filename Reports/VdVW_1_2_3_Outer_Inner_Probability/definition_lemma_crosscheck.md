# Definition And Lemma Cross-Check For Lemma 1.2.3

| Local declaration | Lean role | Textbook markdown anchor | PDF screenshot anchor | Consistency note |
| --- | --- | --- | --- | --- |
| `VdVWEventIndicator` | nonnegative `ℝ≥0∞` indicator for an arbitrary event | `..._1-100.md:438-445` | `Textbooks/Vaart1996/Screenshots/vdvw_lemma_1_2_1_pdf_page_6.png` | Represents the event indicator used in Lemma 1.2.3 in the nonnegative integration layer |
| `VdVWMeasurableSetCover` | proof-carrying measurable superset with unchanged outer measure | `..._1-100.md:438-445` | same screenshot | Represents the event-level measurable cover `B*` |
| `VdVWMeasurableSetCover.ofToMeasurable` | constructs the cover from mathlib's measurable hull | `..._1-100.md:438-445` | same screenshot | Uses mathlib `toMeasurable`; no local cover-existence axiom |
| `VdVWMeasurableSetCover.indicatorMajorant` | converts an event cover to a measurable majorant of `1_B` | `..._1-100.md:438-445` | same screenshot | Bridges the event cover to the outer-expectation definition |
| `VdVWOuterExpectation_eventIndicator_eq_measure` | proves outer probability equals outer expectation of the indicator | `..._1-100.md:438-445` | same screenshot | Proves the first outer-probability half of Lemma 1.2.3(i) for nonnegative indicators |
| `VdVWInnerProbability` | defines inner probability as total mass minus outer measure of the complement | `..._1-100.md:438-445` | same screenshot | Encodes the textbook inner-probability complement convention; uses `μ univ` for finite-measure generality |
| `VdVWInnerProbability_add_outerMeasure_compl` | proves the complement identity for arbitrary events | `..._1-100.md:438-445` | same screenshot | Formal counterpart of `P_*(B) + P^*(Ω \\ B) = P(Ω)` |
| `VdVWInnerProbability_add_outerMeasure_compl_eq_one` | probability-space specialization | `..._1-100.md:438-445` | same screenshot | Formal counterpart of the probability-space formula with total mass one |
| `VdVWInnerProbability_eq_measure_of_nullMeasurable` | proves inner probability equals ordinary measure on null-measurable events | `..._1-100.md:438-445` | same screenshot | Uses mathlib null-measurable complement measure identity |
| `VdVWInnerProbability_eq_measure_of_measurable` | measurable-event specialization | `..._1-100.md:438-445` | same screenshot | Immediate specialization for ordinary measurable events |
| `VdVWMeasurableCover.eventIndicatorOfToMeasurable` | finite-measure measurable-cover realization for event indicators | `..._1-100.md:438-445` | same screenshot | Proves the upper-cover direction currently needed for outer expectation |
| `VdVWOuterExpectation_eq_lintegral_eventIndicatorCover` | cover integral realizes the event-indicator outer expectation | `..._1-100.md:438-445` | same screenshot | Connects the event cover to the general `VdVWOuterExpectation_eq_lintegral_cover` theorem |

## Reused Mathlib Foundations

| Mathlib declaration | Use |
| --- | --- |
| `toMeasurable`, `measurableSet_toMeasurable`, `subset_toMeasurable`, `measure_toMeasurable` | construct the measurable event cover without adding an axiom |
| `lintegral_indicator_one` | compute the integral of a measurable event indicator |
| `meas_le_lintegral₀` | lower bound any measurable majorant integral by the outer measure of the event |
| `measure_add_measure_compl₀`, `measure_add_measure_compl` | relate event and complement measures |
| `measure_mono`, `measure_ne_top` | finite-measure support lemmas |
| `tsub_add_cancel_of_le`, `ENNReal.eq_sub_of_add_eq` | extended-nonnegative subtraction algebra |
| `IsProbabilityMeasure.measure_univ` | rewrite total mass to one in probability spaces |
