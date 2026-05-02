import StatInference.EmpiricalProcess.GlivenkoCantelli
import StatInference.EmpiricalProcess.OuterExpectation

/-!
# Bridges between VdV&W outer probability and outer expectation

This module connects the empirical-process outer-probability vocabulary with
the Chapter 1.2 event-indicator outer-expectation layer.
-/

namespace StatInference

open MeasureTheory

open scoped ENNReal

universe u

/--
VdV&W outer probability is the nonnegative outer expectation of the event
indicator.

This is the local bridge between the empirical-process notation
`VdVWOuterProbability` and the Chapter 1.2 indicator identity
`E* 1_B = P* B`.
-/
theorem VdVWOuterProbability_eq_outerExpectation_eventIndicator
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω) (event : Set Ω) :
    VdVWOuterProbability μ event =
      VdVWOuterExpectation μ (VdVWEventIndicator event) := by
  rw [VdVWOuterProbability, VdVWOuterExpectation_eventIndicator_eq_measure]

/--
Outer-almost-sure truth can be read as zero outer expectation of the
exceptional event indicator.
-/
theorem VdVWOuterAlmostSure_iff_outerExpectation_exceptional_eq_zero
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {predicate : Ω -> Prop} :
    VdVWOuterAlmostSure μ predicate ↔
      VdVWOuterExpectation μ (VdVWEventIndicator {ω | ¬ predicate ω}) = 0 := by
  rw [VdVWOuterAlmostSure,
    VdVWOuterProbability_eq_outerExpectation_eventIndicator]

/--
Markov-style outer-probability bound using a supplied measurable cover.

This is a Chapter 1.2 bridge from the VdV&W outer-probability notation to the
nonnegative outer-expectation/measurable-cover layer.
-/
theorem VdVWOuterProbability_lt_le_outerExpectation_div_cover
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (U : VdVWMeasurableCover μ T)
    {epsilon : ℝ≥0∞} (hepsilon_ne_zero : epsilon ≠ 0)
    (hepsilon_ne_top : epsilon ≠ ∞) :
    VdVWOuterProbability μ {ω | epsilon < T ω} ≤
      VdVWOuterExpectation μ T / epsilon := by
  rw [VdVWOuterProbability, VdVWOuterExpectation_eq_lintegral_cover U]
  exact
    (measure_mono fun ω hω => (le_of_lt hω).trans (U.majorizes ω)).trans
      (meas_ge_le_lintegral_div U.measurable_toFun.aemeasurable
        hepsilon_ne_zero hepsilon_ne_top)

end StatInference
