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

end StatInference
