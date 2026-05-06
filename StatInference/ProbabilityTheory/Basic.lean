import StatInference.ProbabilityMeasure.BorelCantelli
import StatInference.ProbabilityMeasure.GeneratedSigma
import StatInference.ProbabilityMeasure.StrongLaw

/-!
# Durrett 2019 probability-theory wrappers

This module starts the Durrett 2019 probability-theory lane.  It packages
source-shaped theorem wrappers over the reusable probability-measure layer, so
later files can track Durrett item numbers without duplicating foundations.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory

open scoped BigOperators ENNReal Topology Function

universe u v

/-! ## Durrett, Theorem 1.1.1 -/

/-- Durrett 2019, Theorem 1.1.1(i), monotonicity of a measure. -/
theorem durrett2019_theorem_1_1_1_monotonicity
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {A B : Set Ω}
    (hAB : A ⊆ B) :
    μ A ≤ μ B := by
  exact measure_mono hAB

/-- Durrett 2019, Theorem 1.1.1(ii), countable subadditivity. -/
theorem durrett2019_theorem_1_1_1_subadditivity
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {A : Set Ω} {Aseq : ℕ -> Set Ω}
    (hA : A ⊆ ⋃ n, Aseq n) :
    μ A ≤ ∑' n, μ (Aseq n) := by
  exact (measure_mono hA).trans (measure_iUnion_le Aseq)

/-- Durrett 2019, Theorem 1.1.1(iii), continuity from below. -/
theorem durrett2019_theorem_1_1_1_continuity_from_below
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : Monotone A) :
    μ (⋃ n, A n) = ⨆ n, μ (A n) := by
  exact hA.measure_iUnion

/--
Durrett 2019, Theorem 1.1.1(iii), limit form for an increasing sequence whose
union is `A`.
-/
theorem durrett2019_theorem_1_1_1_tendsto_measure_from_below
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Aseq : ℕ -> Set Ω} {A : Set Ω}
    (hAseq : Monotone Aseq) (hA : (⋃ n, Aseq n) = A) :
    Tendsto (fun n => μ (Aseq n)) atTop (𝓝 (μ A)) := by
  simpa [Function.comp_def, hA] using
    (tendsto_measure_iUnion_atTop (μ := μ) hAseq)

/-- Durrett 2019, Theorem 1.1.1(iv), continuity from above. -/
theorem durrett2019_theorem_1_1_1_continuity_from_above
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : Antitone A) (hA_meas : ∀ n, MeasurableSet (A n))
    (hA0_finite : μ (A 0) ≠ ∞) :
    μ (⋂ n, A n) = ⨅ n, μ (A n) := by
  exact hA.measure_iInter (fun n => (hA_meas n).nullMeasurableSet) ⟨0, hA0_finite⟩

/--
Durrett 2019, Theorem 1.1.1(iv), limit form for a decreasing sequence whose
intersection is `A`.
-/
theorem durrett2019_theorem_1_1_1_tendsto_measure_from_above
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Aseq : ℕ -> Set Ω} {A : Set Ω}
    (hAseq : Antitone Aseq) (hAseq_meas : ∀ n, MeasurableSet (Aseq n))
    (hA0_finite : μ (Aseq 0) ≠ ∞) (hA : (⋂ n, Aseq n) = A) :
    Tendsto (fun n => μ (Aseq n)) atTop (𝓝 (μ A)) := by
  simpa [Function.comp_def, hA] using
    (tendsto_measure_iInter_atTop (μ := μ)
      (fun n => (hAseq_meas n).nullMeasurableSet) hAseq ⟨0, hA0_finite⟩)

/-! ## Durrett, Section 1.3 -/

/--
Durrett 2019, Theorem 1.3.1: measurability into a generated sigma-field is
checked on the generators.
-/
theorem durrett2019_theorem_1_3_1_measurable_of_generator_preimages
    {Ω : Type u} [MeasurableSpace Ω] {S : Type v} {C : Set (Set S)}
    {X : Ω -> S}
    (hX : ∀ A ∈ C, MeasurableSet (X ⁻¹' A)) :
    @Measurable Ω S _ (StatInference.ProbabilityMeasure.GeneratedSigma S C) X := by
  exact StatInference.ProbabilityMeasure.measurable_generatedSigma hX

/-- Durrett 2019, Theorem 1.3.4: composition of measurable maps is measurable. -/
theorem durrett2019_theorem_1_3_4_measurable_comp
    {Ω : Type u} [MeasurableSpace Ω]
    {S : Type v} [MeasurableSpace S]
    {T : Type*} [MeasurableSpace T]
    {X : Ω -> S} {f : S -> T}
    (hf : Measurable f) (hX : Measurable X) :
    Measurable (fun ω => f (X ω)) := by
  exact hf.comp hX

/-! ## Durrett, Section 2.3 -/

/--
Durrett 2019, Theorem 2.3.1, first Borel-Cantelli lemma.

If the sum of the probabilities of events is finite, then the limsup event has
probability zero.
-/
theorem durrett2019_theorem_2_3_1_borelCantelli_first
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : (∑' n, P (A n)) ≠ ∞) :
    P (limsup A atTop) = 0 := by
  exact StatInference.ProbabilityMeasure.measure_limsup_atTop_eq_zero hA

/--
Durrett 2019, Theorem 2.3.1, eventual-membership form.

Under the first Borel-Cantelli summability hypothesis, almost every point lies
in only finitely many of the events.
-/
theorem durrett2019_theorem_2_3_1_eventually_notMem
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : (∑' n, P (A n)) ≠ ∞) :
    ∀ᵐ ω ∂P, ∀ᶠ n in atTop, ω ∉ A n := by
  exact StatInference.ProbabilityMeasure.ae_eventually_notMem hA

/--
Durrett 2019, Theorem 2.3.7, second Borel-Cantelli lemma.

For independent measurable events, divergent total probability forces the
limsup event to have probability one.
-/
theorem durrett2019_theorem_2_3_7_borelCantelli_second
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA_meas : ∀ n, MeasurableSet (A n))
    (hA_indep : _root_.ProbabilityTheory.iIndepSet A P)
    (hA_sum : (∑' n, P (A n)) = ∞) :
    P (limsup A atTop) = 1 := by
  exact StatInference.ProbabilityMeasure.measure_limsup_eq_one
    hA_meas hA_indep hA_sum

/--
Durrett 2019, Theorem 2.4.1, strong law of large numbers, mathlib-backed
real-valued source wrapper.

This wrapper records the currently compiled local route to the strong law:
integrable identically distributed real-valued variables with pairwise
independence have empirical averages converging almost surely to the common
mean.  Durrett's Etemadi proof gives a source proof for pairwise independent
identically distributed variables; this declaration uses the existing local
`ProbabilityMeasure.strongLaw_ae_real` proof authority.
-/
theorem durrett2019_theorem_2_4_1_strongLaw_ae_real
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    (X : ℕ -> Ω -> ℝ)
    (hX_integrable : Integrable (X 0) P)
    (hX_indep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := P)) on X))
    (hX_ident : ∀ i, _root_.ProbabilityTheory.IdentDistrib (X i) (X 0) P P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => (∑ i ∈ Finset.range n, X i ω) / n)
        atTop (𝓝 (∫ ω, X 0 ω ∂P)) := by
  exact StatInference.ProbabilityMeasure.strongLaw_ae_real
    X hX_integrable hX_indep hX_ident

/--
Durrett 2019, Theorem 2.4.1, centered empirical-average form.

This is the zero-limit version that later empirical-distribution and
Glivenko-Cantelli wrappers consume.
-/
theorem durrett2019_theorem_2_4_1_centeredStrongLaw_ae_real
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    (X : ℕ -> Ω -> ℝ)
    (hX_integrable : Integrable (X 0) P)
    (hX_indep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := P)) on X))
    (hX_ident : ∀ i, _root_.ProbabilityTheory.IdentDistrib (X i) (X 0) P P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ =>
          (∑ i ∈ Finset.range n, X i ω) / n - ∫ ω, X 0 ω ∂P)
        atTop (𝓝 0) := by
  exact StatInference.ProbabilityMeasure.centeredStrongLaw_ae_real
    X hX_integrable hX_indep hX_ident

/--
Durrett early-chapter pi-system uniqueness shape.

Probability laws agreeing on a pi-system that generates the measurable space
agree everywhere.  This is a Chapter 1/2 source-crosswalk bridge used before
the product-law and independence wrappers.
-/
theorem durrett2019_piSystem_probability_ext
    {Ω : Type u} [mΩ : MeasurableSpace Ω]
    (μ ν : MeasureTheory.ProbabilityMeasure Ω)
    (C : Set (Set Ω)) (hΩ : mΩ = StatInference.ProbabilityMeasure.GeneratedSigma Ω C)
    (hC : IsPiSystem C)
    (hμν : ∀ s ∈ C, μ s = ν s) :
    μ = ν := by
  exact StatInference.ProbabilityMeasure.probabilityMeasure_ext_of_generate_finite
    μ ν C hΩ hC hμν

end ProbabilityTheory
end StatInference
