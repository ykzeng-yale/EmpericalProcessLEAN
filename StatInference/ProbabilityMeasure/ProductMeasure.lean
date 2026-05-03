import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.MeasureTheory.Measure.FiniteMeasureProd
import Mathlib.Probability.Independence.Integration

/-!
# Product-measure and Fubini wrappers

This module records a content-based product-measure layer for textbook
probability/measure work.  The immediate downstream use is empirical-process
symmetrization and finite independent-copy arguments, so the wrappers stay close
to pinned mathlib APIs instead of developing a broader product-space theory.
-/

namespace StatInference
namespace ProbabilityMeasure

open MeasureTheory ProbabilityTheory

open scoped ENNReal MeasureTheory

universe u v w

/-- Product probability measures evaluated on a measurable set. -/
theorem probability_prod_apply
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    (μ : MeasureTheory.ProbabilityMeasure α)
    (ν : MeasureTheory.ProbabilityMeasure β)
    (s : Set (α × β)) (hs : MeasurableSet s) :
    μ.prod ν s =
      ENNReal.toNNReal (∫⁻ x, ν.toMeasure (Prod.mk x ⁻¹' s) ∂(μ : Measure α)) := by
  exact MeasureTheory.ProbabilityMeasure.prod_apply μ ν s hs

/-- Product probability measures on measurable rectangles. -/
theorem probability_prod_prod
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    (μ : MeasureTheory.ProbabilityMeasure α)
    (ν : MeasureTheory.ProbabilityMeasure β)
    (s : Set α) (t : Set β) :
    μ.prod ν (s ×ˢ t) = μ s * ν t := by
  exact MeasureTheory.ProbabilityMeasure.prod_prod μ ν s t

/-- Mapping both coordinates commutes with taking product probability measures. -/
theorem probability_map_prod_map
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {α' : Type w} [MeasurableSpace α'] {β' : Type*} [MeasurableSpace β']
    (μ : MeasureTheory.ProbabilityMeasure α)
    (ν : MeasureTheory.ProbabilityMeasure β)
    {f : α -> α'} {g : β -> β'}
    (hf : Measurable f) (hg : Measurable g) :
    (μ.map hf.aemeasurable).prod (ν.map hg.aemeasurable)
      = (μ.prod ν).map (hf.prodMap hg).aemeasurable := by
  exact MeasureTheory.ProbabilityMeasure.map_prod_map μ ν hf hg

/-- Tonelli's theorem for an `ℝ≥0∞`-valued function on a product space. -/
theorem lintegral_prod
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    {f : α × β -> ℝ≥0∞}
    (hf : AEMeasurable f (μ.prod ν)) :
    ∫⁻ z, f z ∂μ.prod ν = ∫⁻ x, ∫⁻ y, f (x, y) ∂ν ∂μ := by
  exact MeasureTheory.lintegral_prod f hf

/-- Reversed Tonelli theorem for a curried `ℝ≥0∞`-valued function. -/
theorem lintegral_lintegral
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite ν]
    {f : α -> β -> ℝ≥0∞}
    (hf : AEMeasurable (Function.uncurry f) (μ.prod ν)) :
    ∫⁻ x, ∫⁻ y, f x y ∂ν ∂μ = ∫⁻ z, f z.1 z.2 ∂μ.prod ν := by
  exact MeasureTheory.lintegral_lintegral hf

/-- Swap the order of Tonelli integration for a curried nonnegative function. -/
theorem lintegral_lintegral_swap
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    {f : α -> β -> ℝ≥0∞}
    (hf : AEMeasurable (Function.uncurry f) (μ.prod ν)) :
    ∫⁻ x, ∫⁻ y, f x y ∂ν ∂μ = ∫⁻ y, ∫⁻ x, f x y ∂μ ∂ν := by
  exact MeasureTheory.lintegral_lintegral_swap hf

/-- Fubini's theorem for an integrable Bochner-valued function on a product space. -/
theorem integral_prod
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {E : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    (f : α × β -> E) (hf : Integrable f (μ.prod ν)) :
    ∫ z, f z ∂μ.prod ν = ∫ x, ∫ y, f (x, y) ∂ν ∂μ := by
  exact MeasureTheory.integral_prod f hf

/-- Reversed Fubini theorem for an integrable curried function. -/
theorem integral_integral
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {E : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    {f : α -> β -> E}
    (hf : Integrable (Function.uncurry f) (μ.prod ν)) :
    ∫ x, ∫ y, f x y ∂ν ∂μ = ∫ z, f z.1 z.2 ∂μ.prod ν := by
  exact MeasureTheory.integral_integral hf

/-- Swap the order of Bochner integration for an integrable curried function. -/
theorem integral_integral_swap
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {E : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {μ : Measure α} {ν : Measure β} [SFinite μ] [SFinite ν]
    {f : α -> β -> E}
    (hf : Integrable (Function.uncurry f) (μ.prod ν)) :
    ∫ x, ∫ y, f x y ∂ν ∂μ = ∫ y, ∫ x, f x y ∂μ ∂ν := by
  exact MeasureTheory.integral_integral_swap hf

/--
In a product of probability spaces, a function of the second coordinate
integrates to its marginal expectation.

This is the finite-product/Fubini shape used when a later empirical-process
argument conditions on one coordinate and integrates out an independent copy.
-/
theorem probability_integral_prod_snd
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {E : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (μ : MeasureTheory.ProbabilityMeasure α)
    (ν : MeasureTheory.ProbabilityMeasure β)
    (f : β -> E) :
    ∫ z, f z.2 ∂((μ : Measure α).prod (ν : Measure β)) =
      ∫ y, f y ∂(ν : Measure β) := by
  simpa using
    (MeasureTheory.integral_fun_snd
      (μ := (μ : Measure α)) (ν := (ν : Measure β)) f)

/--
In a product of probability spaces, a function of the first coordinate
integrates to its marginal expectation.
-/
theorem probability_integral_prod_fst
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {E : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (μ : MeasureTheory.ProbabilityMeasure α)
    (ν : MeasureTheory.ProbabilityMeasure β)
    (f : α -> E) :
    ∫ z, f z.1 ∂((μ : Measure α).prod (ν : Measure β)) =
      ∫ x, f x ∂(μ : Measure α) := by
  simpa using
    (MeasureTheory.integral_fun_fst
      (μ := (μ : Measure α)) (ν := (ν : Measure β)) f)

/--
Product expectation for separated scalar functions under a product probability
measure.

This is the product-space version of the independent expectation factorization
used by symmetrization and independent-copy handoffs.
-/
theorem probability_integral_prod_mul
    {α : Type u} [MeasurableSpace α] {β : Type v} [MeasurableSpace β]
    {𝕜 : Type w} [RCLike 𝕜]
    (μ : MeasureTheory.ProbabilityMeasure α)
    (ν : MeasureTheory.ProbabilityMeasure β)
    (f : α -> 𝕜) (g : β -> 𝕜) :
    ∫ z, f z.1 * g z.2 ∂((μ : Measure α).prod (ν : Measure β)) =
      (∫ x, f x ∂(μ : Measure α)) *
        ∫ y, g y ∂(ν : Measure β) := by
  exact
    MeasureTheory.integral_prod_mul
      (μ := (μ : Measure α)) (ν := (ν : Measure β)) f g

/-- Product of expectations for two independent scalar random variables. -/
theorem indepFun_integral_mul_eq_mul_integral
    {Ω : Type u} {𝕜 : Type v} [RCLike 𝕜] {mΩ : MeasurableSpace Ω}
    {μ : Measure Ω} {X Y : Ω -> 𝕜}
    (hXY : X ⟂ᵢ[μ] Y)
    (hX : AEStronglyMeasurable X μ) (hY : AEStronglyMeasurable Y μ) :
    ∫ ω, X ω * Y ω ∂μ = (∫ ω, X ω ∂μ) * ∫ ω, Y ω ∂μ := by
  exact hXY.integral_fun_mul_eq_mul_integral hX hY

/-- Product of expectations for a finite independent family of scalar random variables. -/
theorem iIndepFun_integral_prod_eq_prod_integral
    {Ω : Type u} {𝕜 : Type v} {ι : Type w} [RCLike 𝕜] [Fintype ι]
    {mΩ : MeasurableSpace Ω} {μ : Measure Ω} {X : ι -> Ω -> 𝕜}
    (hX : iIndepFun X μ)
    (mX : ∀ i, AEStronglyMeasurable (X i) μ) :
    ∫ ω, ∏ i, X i ω ∂μ = ∏ i, ∫ ω, X i ω ∂μ := by
  exact hX.integral_fun_prod_eq_prod_integral mX

end ProbabilityMeasure
end StatInference
