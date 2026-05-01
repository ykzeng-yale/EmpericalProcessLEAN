import StatInference.EmpiricalProcess.BracketingCountable
import StatInference.EmpiricalProcess.EndpointStrongLaw

/-!
# Endpoint strong laws for sample paths

This module connects mathlib's real-valued strong law to the deterministic
sample-path notation used by the bracketing layer.  An observation process
`X : ℕ -> Ω -> Observation` induces deterministic samples
`Fin n -> Observation` after fixing `ω : Ω`.  For a measurable integrable
endpoint function on the observation space, the empirical average along those
samples converges almost surely to its population integral under the common
law `P`.
-/

namespace StatInference

open MeasureTheory ProbabilityTheory Filter
open scoped BigOperators Topology Function

universe u v w

/-- The deterministic sample of size `n` obtained from an observation process at `ω`. -/
noncomputable def samplePath {Ω : Type u} {Observation : Type v}
    (X : ℕ -> Ω -> Observation) (ω : Ω) (n : ℕ) :
    SampleAt Observation n :=
  fun index => X index.val ω

/-- Empirical averages over `samplePath` are the same as range-indexed averages. -/
theorem empiricalAverage_samplePath_eq_range_sum
    {Ω : Type u} {Observation : Type v}
    (X : ℕ -> Ω -> Observation) (ω : Ω) (n : ℕ)
    (statistic : Observation -> ℝ) :
    empiricalAverage (samplePath X ω n) statistic =
      (∑ i ∈ Finset.range n, statistic (X i ω)) / (n : ℝ) := by
  dsimp [empiricalAverage, samplePath]
  rw [Fin.sum_univ_eq_sum_range (fun i => statistic (X i ω)) n]

/--
Almost-sure endpoint convergence for empirical averages along an iid
observation process.
-/
theorem endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid
    {Ω : Type u} {Observation : Type v}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    (X : ℕ -> Ω -> Observation) (statistic : Observation -> ℝ)
    (hstat_measurable : Measurable statistic)
    (hstat_integrable : Integrable statistic P)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X)) :
    ∀ᵐ ω ∂μ,
      Tendsto
        (fun n : ℕ =>
          empiricalAverage (samplePath X ω n) statistic -
            ∫ observation, statistic observation ∂ P)
        atTop (𝓝 0) := by
  let Y : ℕ -> Ω -> ℝ := fun i => statistic ∘ X i
  have hint : Integrable (Y 0) μ := by
    have hmap : Integrable statistic (Measure.map (X 0) μ) := by
      simpa [(hLaw 0).map_eq] using hstat_integrable
    exact hmap.comp_aemeasurable (hLaw 0).aemeasurable
  have hindepY : Pairwise ((· ⟂ᵢ[μ] ·) on Y) := by
    intro i j hij
    exact (hindep hij).comp hstat_measurable hstat_measurable
  have hidentY : ∀ i, IdentDistrib (Y i) (Y 0) μ μ := by
    intro i
    exact (HasLaw.identDistrib (hLaw i) (hLaw 0)).comp hstat_measurable
  filter_upwards
    [endpoint_strong_law_ae_real Y hint hindepY hidentY]
    with ω hω
  have hintegral :
      μ[Y 0] = ∫ observation, statistic observation ∂ P := by
    simpa [Y, Function.comp_def] using
      (hLaw 0).integral_comp hstat_integrable.aestronglyMeasurable
  convert hω using 1
  funext n
  rw [empiricalAverage_samplePath_eq_range_sum]
  rw [← hintegral]
  dsimp [Y, Function.comp_def]

/--
The lower-endpoint orientation used in the bracketing inequality also follows
from the endpoint strong law.
-/
theorem endpoint_population_sub_empiricalAverage_tendsto_zero_ae_of_iid
    {Ω : Type u} {Observation : Type v}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    (X : ℕ -> Ω -> Observation) (statistic : Observation -> ℝ)
    (hstat_measurable : Measurable statistic)
    (hstat_integrable : Integrable statistic P)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X)) :
    ∀ᵐ ω ∂μ,
      Tendsto
        (fun n : ℕ =>
          (∫ observation, statistic observation ∂ P) -
            empiricalAverage (samplePath X ω n) statistic)
        atTop (𝓝 0) := by
  filter_upwards
    [endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid
      X statistic hstat_measurable hstat_integrable hLaw hindep]
    with ω hω
  simpa using hω.neg

namespace FiniteL1BracketCover

/--
For a fixed finite primitive bracket cover, iid observations give almost-sure
endpoint convergence for every lower and upper bracket endpoint.
-/
theorem endpoint_tendsto_ae_of_iid
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    {Bracket : Type*} [Fintype Bracket]
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) P indexClass classFun width)
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_lower_measurable :
      ∀ bracketIndex,
        Measurable (cover.cover.bracket bracketIndex).lower)
    (h_upper_measurable :
      ∀ bracketIndex,
        Measurable (cover.cover.bracket bracketIndex).upper) :
    ∀ᵐ ω ∂μ, ∀ bracketIndex,
      Tendsto
        (fun n : ℕ =>
          empiricalAverage (samplePath X ω n)
              (cover.cover.bracket bracketIndex).upper -
            (cover.cover.bracket bracketIndex).upperIntegral P)
        atTop (𝓝 0) ∧
      Tendsto
        (fun n : ℕ =>
          (cover.cover.bracket bracketIndex).lowerIntegral P -
            empiricalAverage (samplePath X ω n)
              (cover.cover.bracket bracketIndex).lower)
        atTop (𝓝 0) := by
  classical
  refine ae_all_iff.2 ?_
  intro bracketIndex
  filter_upwards
    [endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid
      X (cover.cover.bracket bracketIndex).upper
      (h_upper_measurable bracketIndex)
      (cover.upper_integrable bracketIndex) hLaw hindep,
    endpoint_population_sub_empiricalAverage_tendsto_zero_ae_of_iid
      X (cover.cover.bracket bracketIndex).lower
      (h_lower_measurable bracketIndex)
      (cover.lower_integrable bracketIndex) hLaw hindep]
    with ω hupper hlower
  exact ⟨hupper, hlower⟩

/--
For a fixed finite primitive bracket cover, iid observations make the canonical
finite endpoint radius vanish almost surely.
-/
theorem endpointRadius_tendsto_zero_ae_of_iid
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    {Bracket : Type*} [Fintype Bracket]
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) P indexClass classFun width)
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_lower_measurable :
      ∀ bracketIndex,
        Measurable (cover.cover.bracket bracketIndex).lower)
    (h_upper_measurable :
      ∀ bracketIndex,
        Measurable (cover.cover.bracket bracketIndex).upper) :
    ∀ᵐ ω ∂μ,
      Tendsto
        (cover.endpointRadius (fun n => samplePath X ω n))
        atTop (𝓝 0) := by
  filter_upwards
    [cover.endpoint_tendsto_ae_of_iid
      X hLaw hindep h_lower_measurable h_upper_measurable]
    with ω hω
  exact
    cover.endpointRadius_tendsto_zero_of_endpoint_tendsto
      (fun n => samplePath X ω n)
      (fun bracketIndex => (hω bracketIndex).1)
      (fun bracketIndex => (hω bracketIndex).2)

/--
For a fixed finite primitive bracket cover, iid observations almost surely
supply the endpoint-radius existence statement required by the deterministic
bracketing route.
-/
theorem exists_endpointRadius_ae_of_iid
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    {Bracket : Type*} [Fintype Bracket]
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) P indexClass classFun width)
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_lower_measurable :
      ∀ bracketIndex,
        Measurable (cover.cover.bracket bracketIndex).lower)
    (h_upper_measurable :
      ∀ bracketIndex,
        Measurable (cover.cover.bracket bracketIndex).upper) :
    ∀ᵐ ω ∂μ,
      ∃ endpointRadius : ℕ -> ℝ,
        Tendsto endpointRadius atTop (𝓝 0) ∧
          (∀ sampleSize bracketIndex,
            empiricalAverage (samplePath X ω sampleSize)
                (cover.cover.bracket bracketIndex).upper -
                (cover.cover.bracket bracketIndex).upperIntegral P ≤
              endpointRadius sampleSize) ∧
          (∀ sampleSize bracketIndex,
            (cover.cover.bracket bracketIndex).lowerIntegral P -
                empiricalAverage (samplePath X ω sampleSize)
                  (cover.cover.bracket bracketIndex).lower ≤
              endpointRadius sampleSize) := by
  filter_upwards
    [cover.endpoint_tendsto_ae_of_iid
      X hLaw hindep h_lower_measurable h_upper_measurable]
    with ω hω
  exact
    cover.exists_endpointRadius_of_endpoint_tendsto
      (fun n => samplePath X ω n)
      (fun bracketIndex => (hω bracketIndex).1)
      (fun bracketIndex => (hω bracketIndex).2)

end FiniteL1BracketCover

/--
Countably many finite primitive covers with widths tending to zero imply
almost-sure pathwise uniform deviation convergence for iid observations.

This is the probabilistic countable-scale handoff needed before deriving a
final theorem directly from finite bracketing numbers.
-/
theorem uniformDeviationTendstoZeroOn_ae_of_iid_countable_covers
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (Bracket : ℕ -> Type*)
    (finiteBracket : ∀ scale, Fintype (Bracket scale))
    (width : ℕ -> ℝ)
    (h_width_tendsto : Tendsto width atTop (𝓝 0))
    (cover :
      ∀ scale,
        @FiniteL1BracketCover Observation Index (Bracket scale)
          (finiteBracket scale) _ P indexClass classFun (width scale))
    (h_lower_measurable :
      ∀ scale (bracketIndex : Bracket scale),
        Measurable ((cover scale).cover.bracket bracketIndex).lower)
    (h_upper_measurable :
      ∀ scale (bracketIndex : Bracket scale),
        Measurable ((cover scale).cover.bracket bracketIndex).upper) :
    ∀ᵐ ω ∂μ,
      UniformDeviationTendstoZeroOn indexClass
        (fun index => populationRiskOfFunction P (classFun index))
        (fun sampleSize index =>
          empiricalAverage (samplePath X ω sampleSize) (classFun index)) := by
  have h_all_endpoints :
      ∀ᵐ ω ∂μ, ∀ scale, ∀ bracketIndex,
        Tendsto
          (fun n : ℕ =>
            empiricalAverage (samplePath X ω n)
                ((cover scale).cover.bracket bracketIndex).upper -
              ((cover scale).cover.bracket bracketIndex).upperIntegral P)
          atTop (𝓝 0) ∧
        Tendsto
          (fun n : ℕ =>
            ((cover scale).cover.bracket bracketIndex).lowerIntegral P -
              empiricalAverage (samplePath X ω n)
                ((cover scale).cover.bracket bracketIndex).lower)
          atTop (𝓝 0) := by
    refine ae_all_iff.2 ?_
    intro scale
    letI := finiteBracket scale
    exact
      (cover scale).endpoint_tendsto_ae_of_iid
        X hLaw hindep
        (h_lower_measurable scale)
        (h_upper_measurable scale)
  filter_upwards [h_all_endpoints] with ω hω
  exact
    (CountablePrimitiveFiniteBracketingGCRoute.ofFiniteCoverSequenceAndEndpointTendsto
      (μ := P) (indexClass := indexClass) (classFun := classFun)
      (samples := fun n => samplePath X ω n)
      Bracket finiteBracket width h_width_tendsto cover
      (fun scale bracketIndex => (hω scale bracketIndex).1)
      (fun scale bracketIndex => (hω scale bracketIndex).2)).uniformDeviationTendstoZeroOn

end StatInference
