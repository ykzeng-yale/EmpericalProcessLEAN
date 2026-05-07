import Mathlib.Probability.ConditionalExpectation
import Mathlib.MeasureTheory.Function.ConditionalExpectation.PullOut
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

/--
Durrett 2019, Example 4.1.4.

If a random variable is measurable with respect to a sigma-field independent of
the conditioning sigma-field, then its conditional expectation is its ordinary
expectation.
-/
theorem durrett2019_example_4_1_4_condExp_eq_integral_of_independent
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {mX m : MeasurableSpace Ω} {X : Ω -> E}
    (hmX : mX ≤ mΩ) (hm : m ≤ mΩ) [SigmaFinite (μ.trim hm)]
    (hX_meas : StronglyMeasurable[mX] X)
    (hX_int : Integrable X μ)
    (hindep : _root_.ProbabilityTheory.Indep mX m μ) :
    μ[X | m] =ᵐ[μ] fun _ => ∫ ω, X ω ∂μ := by
  have _ : Integrable X μ := hX_int
  simpa using
    (_root_.MeasureTheory.condExp_indep_eq (μ := μ) (m₁ := mX) (m₂ := m)
      (f := X) hmX hm hX_meas hindep)

/-! ## Durrett, Section 4.1.2 properties -/

/--
Durrett 2019, Theorem 4.1.9(a), linearity.

Conditional expectation is linear on integrable random variables.
-/
theorem durrett2019_theorem_4_1_9_condExp_linear
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} (m : MeasurableSpace Ω) {X Y : Ω -> E} (a : ℝ)
    (hX_int : Integrable X μ) (hY_int : Integrable Y μ) :
    μ[(a • X + Y) | m] =ᵐ[μ] a • μ[X | m] + μ[Y | m] :=
  (condExp_add (hX_int.smul a) hY_int m).trans
    ((condExp_smul (μ := μ) (m := m) a X).add Filter.EventuallyEq.rfl)

/--
Durrett 2019, Theorem 4.1.9(b), monotonicity.

If `X <= Y` almost surely, then the same ordering holds for their conditional
expectations.
-/
theorem durrett2019_theorem_4_1_9_condExp_mono_real
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} (m : MeasurableSpace Ω) {X Y : Ω -> ℝ}
    (hX_int : Integrable X μ) (hY_int : Integrable Y μ)
    (hXY : X ≤ᵐ[μ] Y) :
    μ[X | m] ≤ᵐ[μ] μ[Y | m] :=
  condExp_mono hX_int hY_int hXY

/--
Durrett 2019, Theorem 4.1.12.

If `m₁ <= m₂` and the `m₂`-conditional expectation is already `m₁`-measurable,
then conditioning on `m₁` gives the same version.
-/
theorem durrett2019_theorem_4_1_12_condExp_eq_of_larger_condExp_stronglyMeasurable
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {m₁ m₂ : MeasurableSpace Ω} {X : Ω -> E}
    (hm₁₂ : m₁ ≤ m₂) (hm₂ : m₂ ≤ mΩ)
    [SigmaFinite (μ.trim (hm₁₂.trans hm₂))]
    [SigmaFinite (μ.trim hm₂)]
    (hX_int : Integrable X μ)
    (h_cond_meas : StronglyMeasurable[m₁] (μ[X | m₂])) :
    μ[X | m₁] =ᵐ[μ] μ[X | m₂] := by
  have _ : Integrable X μ := hX_int
  have hleft :
      μ[μ[X | m₂] | m₁] =ᵐ[μ] μ[X | m₂] :=
    (condExp_of_stronglyMeasurable (μ := μ) (hm₁₂.trans hm₂)
      h_cond_meas integrable_condExp).eventuallyEq
  exact (condExp_condExp_of_le hm₁₂ hm₂).symm.trans hleft

/--
Durrett 2019, Theorem 4.1.13(i), first tower identity.

If `m₁ <= m₂`, conditioning an `m₁`-conditional expectation again on `m₂`
leaves it unchanged.
-/
theorem durrett2019_theorem_4_1_13_condExp_tower_larger_of_smaller
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {m₁ m₂ : MeasurableSpace Ω} {X : Ω -> E}
    (hm₁₂ : m₁ ≤ m₂) (hm₂ : m₂ ≤ mΩ) [SigmaFinite (μ.trim hm₂)]
    (hX_int : Integrable X μ) :
    μ[μ[X | m₁] | m₂] =ᵐ[μ] μ[X | m₁] := by
  have _ : Integrable X μ := hX_int
  exact (condExp_of_stronglyMeasurable (μ := μ) hm₂
    (stronglyMeasurable_condExp.mono hm₁₂) integrable_condExp).eventuallyEq

/--
Durrett 2019, Theorem 4.1.13(ii), second tower identity.

If `m₁ <= m₂`, conditioning first on the larger sigma-field and then on the
smaller one is the same as conditioning on the smaller sigma-field.
-/
theorem durrett2019_theorem_4_1_13_condExp_tower_smaller_of_larger
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {m₁ m₂ : MeasurableSpace Ω} {X : Ω -> E}
    (hm₁₂ : m₁ ≤ m₂) (hm₂ : m₂ ≤ mΩ) [SigmaFinite (μ.trim hm₂)]
    (hX_int : Integrable X μ) :
    μ[μ[X | m₂] | m₁] =ᵐ[μ] μ[X | m₁] := by
  have _ : Integrable X μ := hX_int
  exact condExp_condExp_of_le hm₁₂ hm₂

/--
Durrett 2019, Theorem 4.1.14, pull-out property for real-valued variables.

An `m`-measurable factor can be brought outside the conditional expectation.
-/
theorem durrett2019_theorem_4_1_14_condExp_mul_of_stronglyMeasurable_left
    {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {m : MeasurableSpace Ω} {X Y : Ω -> ℝ}
    (hX_meas : StronglyMeasurable[m] X)
    (hXY_int : Integrable (X * Y) μ)
    (hY_int : Integrable Y μ) :
    μ[X * Y | m] =ᵐ[μ] X * μ[Y | m] :=
  condExp_mul_of_stronglyMeasurable_left hX_meas hXY_int hY_int

end ProbabilityTheory
end StatInference
