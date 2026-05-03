import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.MeasureTheory.Integral.Lebesgue.Markov

/-!
# Tail and layer-cake wrappers

Content-based probability/measure tail-control wrappers for Billingsley
Sections 15-16 and the VdV&W empirical-process envelope-tail route.

These declarations package existing mathlib measure-theory APIs under the
`StatInference.ProbabilityMeasure` namespace.  They are support lemmas, not
source-exact Billingsley theorem reports.
-/

namespace StatInference
namespace ProbabilityMeasure

open MeasureTheory
open scoped ENNReal

universe u

/-- Layer-cake / tail-probability formula with strict real tail events. -/
theorem integral_eq_integral_tail_lt
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω -> ℝ}
    (hX_integrable : Integrable X μ) (hX_nonneg : 0 ≤ᵐ[μ] X) :
    ∫ ω, X ω ∂μ =
      ∫ t in Set.Ioi (0 : ℝ), μ.real {ω : Ω | t < X ω} := by
  exact hX_integrable.integral_eq_integral_meas_lt hX_nonneg

/-- Layer-cake / tail-probability formula with non-strict real tail events. -/
theorem integral_eq_integral_tail_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω -> ℝ}
    (hX_integrable : Integrable X μ) (hX_nonneg : 0 ≤ᵐ[μ] X) :
    ∫ ω, X ω ∂μ =
      ∫ t in Set.Ioi (0 : ℝ), μ.real {ω : Ω | t ≤ X ω} := by
  exact hX_integrable.integral_eq_integral_meas_le hX_nonneg

/-- Lebesgue-integral layer-cake formula with strict real tail events. -/
theorem lintegral_eq_lintegral_tail_lt
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω -> ℝ}
    (hX_nonneg : 0 ≤ᵐ[μ] X) (hX_measurable : AEMeasurable X μ) :
    (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
      ∫⁻ t in Set.Ioi (0 : ℝ), μ {ω : Ω | t < X ω} := by
  exact MeasureTheory.lintegral_eq_lintegral_meas_lt μ hX_nonneg hX_measurable

/-- Lebesgue-integral layer-cake formula with non-strict real tail events. -/
theorem lintegral_eq_lintegral_tail_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {X : Ω -> ℝ}
    (hX_nonneg : 0 ≤ᵐ[μ] X) (hX_measurable : AEMeasurable X μ) :
    (∫⁻ ω, ENNReal.ofReal (X ω) ∂μ) =
      ∫⁻ t in Set.Ioi (0 : ℝ), μ {ω : Ω | t ≤ X ω} := by
  exact MeasureTheory.lintegral_eq_lintegral_meas_le μ hX_nonneg hX_measurable

/--
Tail-integral monotonicity: a pointwise tail majorant over `t > 0` bounds the
expectation of a nonnegative integrable random variable.
-/
theorem integral_le_integral_tail_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : Ω -> ℝ} {tailBound : ℝ -> ℝ}
    (hX_integrable : Integrable X μ)
    (hX_nonneg : 0 ≤ᵐ[μ] X)
    (hbound_integrable : IntegrableOn tailBound (Set.Ioi (0 : ℝ)) volume)
    (hbound : ∀ t ∈ Set.Ioi (0 : ℝ),
      μ.real {ω : Ω | t ≤ X ω} ≤ tailBound t) :
    ∫ ω, X ω ∂μ ≤ ∫ t in Set.Ioi (0 : ℝ), tailBound t := by
  rw [integral_eq_integral_tail_le hX_integrable hX_nonneg]
  refine integral_mono_of_nonneg
    (μ := volume.restrict (Set.Ioi (0 : ℝ)))
    (f := fun t => μ.real {ω : Ω | t ≤ X ω})
    (g := tailBound) ?_ hbound_integrable ?_
  · exact ae_of_all _ fun _ => measureReal_nonneg
  · exact (ae_restrict_mem measurableSet_Ioi).mono fun t ht => hbound t ht

/--
Split-at-radius tail-integral bound for a probability measure.

For `0 <= r`, the interval `(0, r]` contributes at most `r`, and the tail over
`(r, ∞)` is controlled by the supplied tail majorant.
-/
theorem probability_integral_le_radius_add_integral_tail_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω -> ℝ} {tailBound : ℝ -> ℝ} {r : ℝ}
    (hr : 0 ≤ r)
    (hX_integrable : Integrable X μ)
    (hX_nonneg : 0 ≤ᵐ[μ] X)
    (hbound_integrable : IntegrableOn tailBound (Set.Ioi r) volume)
    (hbound : ∀ t ∈ Set.Ioi r,
      μ.real {ω : Ω | t ≤ X ω} ≤ tailBound t) :
    ∫ ω, X ω ∂μ ≤ r + ∫ t in Set.Ioi r, tailBound t := by
  let tail : ℝ -> ℝ := fun t => μ.real {ω : Ω | t ≤ X ω}
  have htailMeasurable : Measurable tail := by
    refine Antitone.measurable ?_
    intro s t hst
    exact measureReal_mono (fun ω hω => le_trans hst hω)
  have htailAEStrongly : AEStronglyMeasurable tail volume :=
    htailMeasurable.aestronglyMeasurable
  have htailLeftIntegrable : IntegrableOn tail (Set.Ioc (0 : ℝ) r) volume := by
    refine Measure.integrableOn_of_bounded
      (μ := volume) (s := Set.Ioc (0 : ℝ) r) (M := 1)
      measure_Ioc_lt_top.ne htailAEStrongly ?_
    exact ae_of_all _ fun _ => by
      rw [Real.norm_of_nonneg measureReal_nonneg]
      exact measureReal_le_one
  have htailRightIntegrable : IntegrableOn tail (Set.Ioi r) volume := by
    refine Integrable.mono' hbound_integrable htailAEStrongly.restrict ?_
    exact (ae_restrict_mem measurableSet_Ioi).mono fun t ht => by
      rw [Real.norm_of_nonneg measureReal_nonneg]
      exact hbound t ht
  have hsplit :
      (∫ t in Set.Ioi (0 : ℝ), tail t) =
        (∫ t in Set.Ioc (0 : ℝ) r, tail t) +
          (∫ t in Set.Ioi r, tail t) := by
    have hU : Set.Ioc (0 : ℝ) r ∪ Set.Ioi r = Set.Ioi (0 : ℝ) :=
      Set.Ioc_union_Ioi_eq_Ioi hr
    have h := setIntegral_union (μ := volume) (f := tail)
      (s := Set.Ioc (0 : ℝ) r) (t := Set.Ioi r)
      (Set.Ioc_disjoint_Ioi le_rfl) measurableSet_Ioi
      htailLeftIntegrable htailRightIntegrable
    rwa [hU] at h
  have hleft : (∫ t in Set.Ioc (0 : ℝ) r, tail t) ≤ r := by
    calc
      (∫ t in Set.Ioc (0 : ℝ) r, tail t)
          ≤ ∫ _t in Set.Ioc (0 : ℝ) r, (1 : ℝ) := by
              refine setIntegral_mono_on htailLeftIntegrable
                (integrableOn_const measure_Ioc_lt_top.ne) measurableSet_Ioc ?_
              intro _ _
              exact measureReal_le_one
      _ = volume.real (Set.Ioc (0 : ℝ) r) := by
              rw [setIntegral_one_eq_measureReal]
      _ = r := by
              rw [Real.volume_real_Ioc_of_le hr]
              ring
  have hright :
      (∫ t in Set.Ioi r, tail t) ≤ ∫ t in Set.Ioi r, tailBound t := by
    refine setIntegral_mono_on htailRightIntegrable hbound_integrable
      measurableSet_Ioi ?_
    intro t ht
    exact hbound t ht
  calc
    ∫ ω, X ω ∂μ = ∫ t in Set.Ioi (0 : ℝ), tail t := by
        rw [integral_eq_integral_tail_le hX_integrable hX_nonneg]
    _ = (∫ t in Set.Ioc (0 : ℝ) r, tail t) +
          (∫ t in Set.Ioi r, tail t) := hsplit
    _ ≤ r + ∫ t in Set.Ioi r, tailBound t := add_le_add hleft hright

/-- Markov tail bound for extended nonnegative random variables. -/
theorem measure_tail_le_lintegral_div
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hX_measurable : AEMeasurable X μ)
    {epsilon : ℝ≥0∞} (h_epsilon_ne_zero : epsilon ≠ 0)
    (h_epsilon_ne_top : epsilon ≠ ∞) :
    μ {ω : Ω | epsilon ≤ X ω} ≤ (∫⁻ ω, X ω ∂μ) / epsilon := by
  exact
    MeasureTheory.meas_ge_le_lintegral_div hX_measurable
      h_epsilon_ne_zero h_epsilon_ne_top

end ProbabilityMeasure
end StatInference
