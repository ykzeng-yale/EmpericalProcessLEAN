import Mathlib.Probability.ConditionalExpectation
import StatInference.ProbabilityTheory.Basic

/-!
# Durrett 2019 conditional-expectation wrappers

This module starts the Durrett Chapter 4.1 conditional-expectation layer.  The
wrappers keep Durrett's "guess and verify" source formulation close to
mathlib's `condExp` API.
-/

namespace StatInference
namespace ProbabilityTheory

open MeasureTheory

open scoped MeasureTheory ProbabilityTheory

/-! ## Durrett, Section 4.1 -/

/--
Durrett 2019, Section 4.1, source predicate for a version of conditional
expectation.

Durrett defines a version of `E(X | F)` as a random variable `Y` that is
`F`-measurable and has the same integral as `X` on every set in `F`.  We include
integrability of `Y`, the content of Lemma 4.1.1 for such versions.
-/
def durrett2019_section_4_1_IsConditionalExpectationVersion
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    (μ : Measure Ω) (m : MeasurableSpace Ω) (X Y : Ω -> E) : Prop :=
  StronglyMeasurable[m] Y ∧
    Integrable Y μ ∧
    ∀ A : Set Ω, MeasurableSet[m] A ->
      (∫ ω in A, Y ω ∂μ) = ∫ ω in A, X ω ∂μ

/--
Durrett 2019, Section 4.1, the mathlib conditional expectation is a Durrett
version.

This packages the defining verification: measurability with respect to the
conditioning sigma-field, integrability, and equality of set integrals over all
conditioning events.
-/
theorem durrett2019_section_4_1_condExp_isConditionalExpectationVersion
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} (m : MeasurableSpace Ω) {X : Ω -> E}
    (hm : m ≤ mΩ) [SigmaFinite (μ.trim hm)]
    (hX_int : Integrable X μ) :
    durrett2019_section_4_1_IsConditionalExpectationVersion
      (Ω := Ω) (E := E) (mΩ := mΩ) μ m X (μ[X | m]) := by
  exact ⟨stronglyMeasurable_condExp, integrable_condExp,
    fun A hA => setIntegral_condExp (μ := μ) hm hX_int hA⟩

/--
Durrett 2019, Example 4.1.3, verification form.

If `X` is already measurable with respect to the conditioning sigma-field, then
`X` itself satisfies Durrett's two defining properties for `E(X | F)`.
-/
theorem durrett2019_example_4_1_3_self_isConditionalExpectationVersion
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    {μ : Measure Ω} (m : MeasurableSpace Ω) {X : Ω -> E}
    (hX_meas : StronglyMeasurable[m] X)
    (hX_int : Integrable X μ) :
    durrett2019_section_4_1_IsConditionalExpectationVersion
      (Ω := Ω) (E := E) (mΩ := mΩ) μ m X X := by
  exact ⟨hX_meas, hX_int, fun _A _hA => rfl⟩

/--
Durrett 2019, Example 4.1.3.

If `X` is already measurable with respect to the conditioning sigma-field, then
`E(X | F) = X`.
-/
theorem durrett2019_example_4_1_3_condExp_eq_of_stronglyMeasurable
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} (m : MeasurableSpace Ω) {X : Ω -> E}
    (hm : m ≤ mΩ) [SigmaFinite (μ.trim hm)]
    (hX_meas : StronglyMeasurable[m] X)
    (hX_int : Integrable X μ) :
    μ[X | m] = X :=
  condExp_of_stronglyMeasurable (μ := μ) hm hX_meas hX_int

/--
Durrett 2019, Example 4.1.3, constant special case.

Constants are measurable with respect to every sigma-field, so their conditional
expectation is the same constant.
-/
theorem durrett2019_example_4_1_3_condExp_const
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} (m : MeasurableSpace Ω)
    [IsFiniteMeasure μ] (hm : m ≤ mΩ) (c : E) :
    μ[(fun _ : Ω => c) | m] = fun _ => c :=
  condExp_const (μ := μ) hm c

end ProbabilityTheory
end StatInference
