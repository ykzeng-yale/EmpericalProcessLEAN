import Mathlib.MeasureTheory.Integral.Lebesgue.Basic

/-!
# VdV&W outer expectation and measurable-cover primitives

This module starts the Chapter 1.2 layer needed for the full textbook-order
empirical-process development.  It formalizes a nonnegative `ℝ≥0∞` version of
outer expectation and the proof-carrying minimal measurable cover interface.

The textbook states these notions for extended-real maps.  The nonnegative
version below is the part directly reusable for probabilities and nonnegative
empirical-process error functionals, while still using mathlib's Lebesgue
integral API as the verification authority.
-/

namespace StatInference

open MeasureTheory

open scoped ENNReal

universe u

/--
A measurable majorant of an arbitrary nonnegative map.

This is the family over which the VdV&W nonnegative outer expectation takes
the infimum: measurable `U` with `T <= U`.
-/
structure VdVWMeasurableMajorant {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (T : Ω -> ℝ≥0∞) where
  toFun : Ω -> ℝ≥0∞
  measurable_toFun : Measurable toFun
  majorizes : ∀ ω, T ω ≤ toFun ω

namespace VdVWMeasurableMajorant

instance {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} :
    CoeFun (VdVWMeasurableMajorant μ T) (fun _ => Ω -> ℝ≥0∞) where
  coe U := U.toFun

end VdVWMeasurableMajorant

/--
VdV&W nonnegative outer expectation.

For nonnegative maps, the ordinary expectation is mathlib's `lintegral`.
The outer expectation is the infimum of the integrals of measurable majorants.
-/
noncomputable def VdVWOuterExpectation {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (T : Ω -> ℝ≥0∞) : ℝ≥0∞ :=
  ⨅ U : VdVWMeasurableMajorant μ T, ∫⁻ ω, U ω ∂μ

/-- The outer expectation is bounded above by every measurable majorant. -/
theorem VdVWOuterExpectation_le_lintegral_majorant
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (U : VdVWMeasurableMajorant μ T) :
    VdVWOuterExpectation μ T ≤ ∫⁻ ω, U ω ∂μ :=
  iInf_le (fun U : VdVWMeasurableMajorant μ T => ∫⁻ ω, U ω ∂μ) U

/--
For a measurable nonnegative map, VdV&W outer expectation reduces to the
ordinary mathlib Lebesgue integral.
-/
theorem VdVWOuterExpectation_eq_lintegral_of_measurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (hT : Measurable T) :
    VdVWOuterExpectation μ T = ∫⁻ ω, T ω ∂μ := by
  refine le_antisymm ?upper ?lower
  · exact
      VdVWOuterExpectation_le_lintegral_majorant
        ({ toFun := T
           measurable_toFun := hT
           majorizes := fun _ => le_rfl } :
          VdVWMeasurableMajorant μ T)
  · dsimp [VdVWOuterExpectation]
    refine le_iInf ?_
    intro U
    exact lintegral_mono U.majorizes

/--
A proof-carrying nonnegative measurable cover, or minimal measurable majorant.

The cover is pointwise above `T` and is almost surely below every measurable
majorant that is above `T` almost surely.  This matches the minimality clause
in VdV&W Lemma 1.2.1 while keeping the existence theorem separate.
-/
structure VdVWMeasurableCover {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (T : Ω -> ℝ≥0∞) where
  toFun : Ω -> ℝ≥0∞
  measurable_toFun : Measurable toFun
  majorizes : ∀ ω, T ω ≤ toFun ω
  minimal_ae :
    ∀ U : Ω -> ℝ≥0∞,
      Measurable U ->
      (∀ᵐ ω ∂μ, T ω ≤ U ω) ->
      ∀ᵐ ω ∂μ, toFun ω ≤ U ω

namespace VdVWMeasurableCover

instance {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} :
    CoeFun (VdVWMeasurableCover μ T) (fun _ => Ω -> ℝ≥0∞) where
  coe U := U.toFun

/-- A measurable cover is in particular a measurable majorant. -/
def toMajorant {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (U : VdVWMeasurableCover μ T) :
    VdVWMeasurableMajorant μ T where
  toFun := U
  measurable_toFun := U.measurable_toFun
  majorizes := U.majorizes

/-- A measurable map is its own measurable cover. -/
def ofMeasurable {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    {T : Ω -> ℝ≥0∞} (hT : Measurable T) :
    VdVWMeasurableCover μ T where
  toFun := T
  measurable_toFun := hT
  majorizes := fun _ => le_rfl
  minimal_ae := fun _ _ h_majorizes => h_majorizes

end VdVWMeasurableCover

/--
If a nonnegative measurable cover is supplied, its integral realizes the
VdV&W outer expectation.

This is the nonnegative counterpart of the equality after Lemma 1.2.1:
`E* T = E T*` for a minimal measurable majorant `T*`.
-/
theorem VdVWOuterExpectation_eq_lintegral_cover
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (U : VdVWMeasurableCover μ T) :
    VdVWOuterExpectation μ T = ∫⁻ ω, U ω ∂μ := by
  refine le_antisymm ?upper ?lower
  · exact
      VdVWOuterExpectation_le_lintegral_majorant
        (VdVWMeasurableCover.toMajorant U)
  · dsimp [VdVWOuterExpectation]
    refine le_iInf ?_
    intro V
    exact
      lintegral_mono_ae
        (U.minimal_ae V V.measurable_toFun (ae_of_all μ V.majorizes))

/-- The cover theorem specializes to the measurable-map theorem. -/
theorem VdVWOuterExpectation_eq_lintegral_of_cover_ofMeasurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (hT : Measurable T) :
    VdVWOuterExpectation μ T =
      ∫⁻ ω, (VdVWMeasurableCover.ofMeasurable μ hT : Ω -> ℝ≥0∞) ω ∂μ :=
  VdVWOuterExpectation_eq_lintegral_cover
    (VdVWMeasurableCover.ofMeasurable μ hT)

end StatInference
