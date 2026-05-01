import StatInference.EmpiricalProcess.Average
import StatInference.EmpiricalProcess.Bracketing

/-!
# Primitive function brackets

This module starts the primitive VdV&W bracketing layer.  It defines brackets
as pairs of real-valued functions, their pointwise membership relation,
`L1(P)` width through mathlib's Bochner integral, and finite bracket covers.

The main theorem in this file connects a primitive finite `L1(P)` bracket
cover to the deterministic empirical-deviation inequality already proved in
`Bracketing.lean`.
-/

namespace StatInference

open MeasureTheory Filter
open scoped BigOperators Topology

universe u v w

/-- A function bracket `[l, u]` represented by its lower and upper endpoints. -/
structure FunctionBracket (Observation : Type u) where
  lower : Observation -> ℝ
  upper : Observation -> ℝ

namespace FunctionBracket

/-- Membership in a bracket: `f` lies pointwise between the lower and upper endpoints. -/
def Mem {Observation : Type u} (bracket : FunctionBracket Observation)
    (f : Observation -> ℝ) : Prop :=
  ∀ observation,
    bracket.lower observation ≤ f observation ∧
      f observation ≤ bracket.upper observation

/-- The lower endpoint population integral. -/
noncomputable def lowerIntegral {Observation : Type u}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (bracket : FunctionBracket Observation) : ℝ :=
  ∫ observation, bracket.lower observation ∂ μ

/-- The upper endpoint population integral. -/
noncomputable def upperIntegral {Observation : Type u}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (bracket : FunctionBracket Observation) : ℝ :=
  ∫ observation, bracket.upper observation ∂ μ

/-- The `L1(P)` bracket width, represented as `∫ |u - l| dP`. -/
noncomputable def l1Width {Observation : Type u}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (bracket : FunctionBracket Observation) : ℝ :=
  ∫ observation,
    |bracket.upper observation - bracket.lower observation| ∂ μ

/-- The lower endpoint is below every member of the bracket. -/
theorem lower_le_of_mem {Observation : Type u}
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f) (observation : Observation) :
    bracket.lower observation ≤ f observation :=
  (hmem observation).1

/-- Every bracket member is below the upper endpoint. -/
theorem le_upper_of_mem {Observation : Type u}
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f) (observation : Observation) :
    f observation ≤ bracket.upper observation :=
  (hmem observation).2

/-- A nonempty bracket is pointwise ordered at each observation. -/
theorem lower_le_upper_of_mem {Observation : Type u}
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f) (observation : Observation) :
    bracket.lower observation ≤ bracket.upper observation :=
  le_trans (hmem observation).1 (hmem observation).2

/-- Population integral of the lower endpoint is below that of a bracket member. -/
theorem lowerIntegral_le_integral_of_mem {Observation : Type u}
    [MeasurableSpace Observation] {μ : Measure Observation}
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f)
    (hlower : Integrable bracket.lower μ) (hf : Integrable f μ) :
    bracket.lowerIntegral μ ≤ ∫ observation, f observation ∂ μ :=
  integral_mono hlower hf (fun observation => (hmem observation).1)

/-- Population integral of a bracket member is below that of the upper endpoint. -/
theorem integral_le_upperIntegral_of_mem {Observation : Type u}
    [MeasurableSpace Observation] {μ : Measure Observation}
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f)
    (hf : Integrable f μ) (hupper : Integrable bracket.upper μ) :
    (∫ observation, f observation ∂ μ) ≤ bracket.upperIntegral μ :=
  integral_mono hf hupper (fun observation => (hmem observation).2)

/--
For a member of a bracket, the population endpoint gap is bounded by the
`L1(P)` bracket width.
-/
theorem population_gap_le_l1Width_of_mem {Observation : Type u}
    [MeasurableSpace Observation] {μ : Measure Observation}
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f)
    (hlower : Integrable bracket.lower μ)
    (hupper : Integrable bracket.upper μ) :
    bracket.upperIntegral μ - bracket.lowerIntegral μ ≤
      bracket.l1Width μ := by
  have hnonneg :
      ∀ observation,
        0 ≤ bracket.upper observation - bracket.lower observation := by
    intro observation
    exact sub_nonneg.mpr (bracket.lower_le_upper_of_mem hmem observation)
  calc
    bracket.upperIntegral μ - bracket.lowerIntegral μ
        = ∫ observation,
            bracket.upper observation - bracket.lower observation ∂ μ := by
          dsimp [upperIntegral, lowerIntegral]
          exact (integral_sub hupper hlower).symm
    _ = ∫ observation,
            |bracket.upper observation - bracket.lower observation| ∂ μ := by
          congr 1
          ext observation
          exact (abs_of_nonneg (hnonneg observation)).symm
    _ ≤ bracket.l1Width μ := le_rfl

/-- Empirical averages are monotone under pointwise order. -/
theorem empiricalAverage_mono {Observation : Type u} {n : ℕ}
    (sample : SampleAt Observation n) {f g : Observation -> ℝ}
    (hfg : ∀ observation, f observation ≤ g observation) :
    empiricalAverage sample f ≤ empiricalAverage sample g := by
  unfold empiricalAverage
  have hsum :
      (∑ i : Fin n, f (sample i)) ≤
        ∑ i : Fin n, g (sample i) := by
    exact Finset.sum_le_sum (fun i _hi => hfg (sample i))
  exact div_le_div_of_nonneg_right hsum (Nat.cast_nonneg n)

/-- Empirical average of the lower endpoint is below a bracket member. -/
theorem lowerEmpirical_le_empiricalAverage_of_mem {Observation : Type u}
    {n : ℕ} (sample : SampleAt Observation n)
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f) :
    empiricalAverage sample bracket.lower ≤ empiricalAverage sample f :=
  empiricalAverage_mono sample (fun observation => (hmem observation).1)

/-- Empirical average of a bracket member is below the upper endpoint. -/
theorem empiricalAverage_le_upperEmpirical_of_mem {Observation : Type u}
    {n : ℕ} (sample : SampleAt Observation n)
    {bracket : FunctionBracket Observation} {f : Observation -> ℝ}
    (hmem : bracket.Mem f) :
    empiricalAverage sample f ≤ empiricalAverage sample bracket.upper :=
  empiricalAverage_mono sample (fun observation => (hmem observation).2)

end FunctionBracket

/-- Top-level spelling for membership in a function bracket. -/
def MemFunctionBracket {Observation : Type u}
    (bracket : FunctionBracket Observation) (f : Observation -> ℝ) : Prop :=
  bracket.Mem f

/-- Top-level spelling for the `L1(P)` width of a function bracket. -/
noncomputable def l1BracketWidth {Observation : Type u}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (bracket : FunctionBracket Observation) : ℝ :=
  bracket.l1Width μ

/-- An `L1(P)` epsilon bracket has width strictly smaller than `epsilon`. -/
def IsL1EpsilonBracket {Observation : Type u}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (epsilon : ℝ) (bracket : FunctionBracket Observation) : Prop :=
  l1BracketWidth μ bracket < epsilon

/-- Population risk of a real-valued function, represented as a mathlib integral. -/
noncomputable def populationRiskOfFunction {Observation : Type u}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (f : Observation -> ℝ) : ℝ :=
  ∫ observation, f observation ∂ μ

/--
A finite bracket cover, represented with a chosen covering bracket for every
in-class function.
-/
structure FiniteBracketCover {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) where
  bracket : Bracket -> FunctionBracket Observation
  bracketOf : ∀ index, index ∈ indexClass -> Bracket
  mem_bracket :
    ∀ index hindex,
      (bracket (bracketOf index hindex)).Mem (classFun index)

namespace FiniteBracketCover

/-- A finite bracket cover gives an existential covering statement. -/
theorem exists_mem {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (cover :
      FiniteBracketCover (Bracket := Bracket) indexClass classFun)
    {index : Index} (hindex : index ∈ indexClass) :
    ∃ bracketIndex,
      (cover.bracket bracketIndex).Mem (classFun index) :=
  ⟨cover.bracketOf index hindex, cover.mem_bracket index hindex⟩

end FiniteBracketCover

/--
A finite `L1(P)` bracket cover at a fixed radius.  The endpoint and member
integrability fields are exactly what is needed to use mathlib's integral
monotonicity lemmas.
-/
structure FiniteL1BracketCover {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] [MeasurableSpace Observation]
    (μ : Measure Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (width : ℝ) where
  cover : FiniteBracketCover (Bracket := Bracket) indexClass classFun
  width_bound :
    ∀ bracketIndex,
      (cover.bracket bracketIndex).l1Width μ ≤ width
  lower_integrable :
    ∀ bracketIndex,
      Integrable (cover.bracket bracketIndex).lower μ
  upper_integrable :
    ∀ bracketIndex,
      Integrable (cover.bracket bracketIndex).upper μ
  function_integrable :
    ∀ index, index ∈ indexClass -> Integrable (classFun index) μ

/--
A finite `L1(P)` bracket cover with an explicit cardinality.  This is the
primitive witness form behind the textbook bracketing number `N_[]`.
-/
structure FiniteL1BracketCoverAtCard {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation]
    (μ : Measure Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (epsilon : ℝ)
    (cardinality : ℕ) where
  bracket : Fin cardinality -> FunctionBracket Observation
  bracketOf : ∀ index, index ∈ indexClass -> Fin cardinality
  mem_bracket :
    ∀ index hindex,
      (bracket (bracketOf index hindex)).Mem (classFun index)
  width_lt :
    ∀ bracketIndex,
      IsL1EpsilonBracket μ epsilon (bracket bracketIndex)
  lower_integrable :
    ∀ bracketIndex,
      Integrable (bracket bracketIndex).lower μ
  upper_integrable :
    ∀ bracketIndex,
      Integrable (bracket bracketIndex).upper μ
  function_integrable :
    ∀ index, index ∈ indexClass -> Integrable (classFun index) μ

namespace FiniteL1BracketCoverAtCard

/-- Forget the explicit cardinality and keep the finite indexed cover. -/
def toFiniteBracketCover {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation] {μ : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteL1BracketCoverAtCard μ indexClass classFun epsilon cardinality) :
    FiniteBracketCover (Bracket := Fin cardinality) indexClass classFun where
  bracket := cover.bracket
  bracketOf := cover.bracketOf
  mem_bracket := cover.mem_bracket

/-- Convert an explicit-cardinality epsilon cover into a `FiniteL1BracketCover`. -/
def toFiniteL1BracketCover {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation] {μ : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteL1BracketCoverAtCard μ indexClass classFun epsilon cardinality) :
    FiniteL1BracketCover (Bracket := Fin cardinality) μ indexClass classFun
      epsilon where
  cover := cover.toFiniteBracketCover
  width_bound := by
    intro bracketIndex
    exact le_of_lt (cover.width_lt bracketIndex)
  lower_integrable := cover.lower_integrable
  upper_integrable := cover.upper_integrable
  function_integrable := cover.function_integrable

end FiniteL1BracketCoverAtCard

/--
Finite `L1(P)` bracketing-number hypothesis in witness form: there exists a
natural number of epsilon brackets covering the class.

This is deliberately a Prop-level finite witness before choosing a minimal
numeric value for `N_[]`.
-/
def HasFiniteL1BracketingNumber {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation]
    (μ : Measure Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (epsilon : ℝ) : Prop :=
  ∃ cardinality : ℕ,
    Nonempty
      (FiniteL1BracketCoverAtCard μ indexClass classFun epsilon cardinality)

/-- The least finite cardinality witnessing finite `L1(P)` bracketing. -/
noncomputable def finiteL1BracketingNumberCard {Observation : Type u}
    {Index : Type v} [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteL1BracketingNumber μ indexClass classFun epsilon) : ℕ :=
  by
    classical
    exact Nat.find hfinite

/--
The primitive numeric `L1(P)` bracketing number.

If a finite epsilon-bracket cover exists, this is the least natural
cardinality of such a cover, coerced to `ℕ∞`.  Otherwise it is `⊤`.
-/
noncomputable def l1BracketingNumber {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation]
    (μ : Measure Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (epsilon : ℝ) : ℕ∞ :=
  by
    classical
    exact
      if hfinite :
          HasFiniteL1BracketingNumber μ indexClass classFun epsilon then
        (finiteL1BracketingNumberCard hfinite : ℕ∞)
      else
        ⊤

/-- In the finite case, the numeric bracketing number is the `Nat.find` cardinality. -/
theorem l1BracketingNumber_eq_find {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteL1BracketingNumber μ indexClass classFun epsilon) :
    l1BracketingNumber μ indexClass classFun epsilon =
      (finiteL1BracketingNumberCard hfinite : ℕ∞) := by
  classical
  simp [l1BracketingNumber, hfinite]

/-- The minimizing cardinality supplied by finite bracketing has an explicit cover. -/
theorem l1BracketingNumber_find_spec {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteL1BracketingNumber μ indexClass classFun epsilon) :
    Nonempty
      (FiniteL1BracketCoverAtCard μ indexClass classFun epsilon
        (finiteL1BracketingNumberCard hfinite)) :=
  by
    classical
    simpa [finiteL1BracketingNumberCard] using Nat.find_spec hfinite

/-- A finite bracketing witness makes the numeric bracketing number finite. -/
theorem l1BracketingNumber_lt_top_of_hasFinite {Observation : Type u}
    {Index : Type v} [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteL1BracketingNumber μ indexClass classFun epsilon) :
    l1BracketingNumber μ indexClass classFun epsilon < ⊤ := by
  rw [l1BracketingNumber_eq_find hfinite]
  exact WithTop.coe_lt_top (finiteL1BracketingNumberCard hfinite)

/-- If the numeric bracketing number is finite, a finite witness exists. -/
theorem hasFinite_of_l1BracketingNumber_lt_top {Observation : Type u}
    {Index : Type v} [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite_number :
      l1BracketingNumber μ indexClass classFun epsilon < ⊤) :
    HasFiniteL1BracketingNumber μ indexClass classFun epsilon := by
  by_contra hnot
  have htop :
      l1BracketingNumber μ indexClass classFun epsilon = ⊤ := by
    classical
    simp [l1BracketingNumber, hnot]
  rw [htop] at hfinite_number
  exact (lt_irrefl (⊤ : ℕ∞)) hfinite_number

/--
A finite bracketing-number witness gives an actual finite `L1(P)` bracket cover.
-/
theorem exists_finiteL1BracketCover_of_hasFiniteL1BracketingNumber
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteL1BracketingNumber μ indexClass classFun epsilon) :
    ∃ (Bracket : Type),
      ∃ (_finite : Fintype Bracket),
        Nonempty
          (@FiniteL1BracketCover Observation Index Bracket _ _
            μ indexClass classFun epsilon) := by
  rcases hfinite with ⟨cardinality, hcover⟩
  rcases hcover with ⟨cover⟩
  refine ⟨Fin cardinality, inferInstance, ?_⟩
  exact ⟨cover.toFiniteL1BracketCover⟩

/--
A finite numeric bracketing number gives an actual finite `L1(P)` bracket cover.
-/
theorem exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite_number :
      l1BracketingNumber μ indexClass classFun epsilon < ⊤) :
    ∃ (Bracket : Type),
      ∃ (_finite : Fintype Bracket),
        Nonempty
          (@FiniteL1BracketCover Observation Index Bracket _ _
            μ indexClass classFun epsilon) :=
  exists_finiteL1BracketCover_of_hasFiniteL1BracketingNumber
    (hasFinite_of_l1BracketingNumber_lt_top hfinite_number)

namespace FiniteL1BracketCover

/-- Endpoint lower population integrals for a primitive finite bracket cover. -/
noncomputable def lowerPopulation {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width) :
    Bracket -> ℝ :=
  fun bracketIndex =>
    (cover.cover.bracket bracketIndex).lowerIntegral μ

/-- Endpoint upper population integrals for a primitive finite bracket cover. -/
noncomputable def upperPopulation {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width) :
    Bracket -> ℝ :=
  fun bracketIndex =>
    (cover.cover.bracket bracketIndex).upperIntegral μ

/-- Endpoint lower empirical averages for a primitive finite bracket cover. -/
noncomputable def lowerEmpirical {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width)
    (samples : ∀ sampleSize, SampleAt Observation sampleSize) :
    ℕ -> Bracket -> ℝ :=
  fun sampleSize bracketIndex =>
    empiricalAverage (samples sampleSize)
      (cover.cover.bracket bracketIndex).lower

/-- Endpoint upper empirical averages for a primitive finite bracket cover. -/
noncomputable def upperEmpirical {Observation : Type u} {Index : Type v}
    {Bracket : Type w} [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width)
    (samples : ∀ sampleSize, SampleAt Observation sampleSize) :
    ℕ -> Bracket -> ℝ :=
  fun sampleSize bracketIndex =>
    empiricalAverage (samples sampleSize)
      (cover.cover.bracket bracketIndex).upper

/--
One-sample empirical-deviation bound produced by a primitive finite `L1(P)`
bracket cover plus endpoint deviation bounds.
-/
theorem empiricalDeviationBoundOn_of_endpoint_bounds
    {Observation : Type u} {Index : Type v} {Bracket : Type w}
    [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width)
    {n : ℕ} (sample : SampleAt Observation n)
    (endpointRadius widthRadius : ℝ)
    (h_width : width ≤ widthRadius)
    (h_upper_endpoint :
      ∀ bracketIndex,
        empiricalAverage sample (cover.cover.bracket bracketIndex).upper -
            (cover.cover.bracket bracketIndex).upperIntegral μ ≤
          endpointRadius)
    (h_lower_endpoint :
      ∀ bracketIndex,
        (cover.cover.bracket bracketIndex).lowerIntegral μ -
            empiricalAverage sample (cover.cover.bracket bracketIndex).lower ≤
          endpointRadius) :
    EmpiricalDeviationBoundOn indexClass
      (fun index => populationRiskOfFunction μ (classFun index))
      (fun index => empiricalAverage sample (classFun index))
      (endpointRadius + widthRadius) := by
  classical
  let lowerPopulation := cover.lowerPopulation
  let upperPopulation := cover.upperPopulation
  let lowerEmpirical : Bracket -> ℝ :=
    fun bracketIndex =>
      empiricalAverage sample (cover.cover.bracket bracketIndex).lower
  let upperEmpirical : Bracket -> ℝ :=
    fun bracketIndex =>
      empiricalAverage sample (cover.cover.bracket bracketIndex).upper
  refine
    empiricalDeviationBoundOn_of_bracket_endpoint_bounds
      (fun index => populationRiskOfFunction μ (classFun index))
      (fun index => empiricalAverage sample (classFun index))
      lowerPopulation upperPopulation lowerEmpirical upperEmpirical
      cover.cover.bracketOf endpointRadius widthRadius
      ?_ ?_ ?_ ?_ ?_ ?_ ?_
  · intro index hindex
    exact FunctionBracket.lowerEmpirical_le_empiricalAverage_of_mem sample
      (cover.cover.mem_bracket index hindex)
  · intro index hindex
    exact FunctionBracket.empiricalAverage_le_upperEmpirical_of_mem sample
      (cover.cover.mem_bracket index hindex)
  · intro index hindex
    dsimp [lowerPopulation, populationRiskOfFunction,
      FiniteL1BracketCover.lowerPopulation]
    exact FunctionBracket.lowerIntegral_le_integral_of_mem
      (cover.cover.mem_bracket index hindex)
      (cover.lower_integrable (cover.cover.bracketOf index hindex))
      (cover.function_integrable index hindex)
  · intro index hindex
    dsimp [upperPopulation, populationRiskOfFunction,
      FiniteL1BracketCover.upperPopulation]
    exact FunctionBracket.integral_le_upperIntegral_of_mem
      (cover.cover.mem_bracket index hindex)
      (cover.function_integrable index hindex)
      (cover.upper_integrable (cover.cover.bracketOf index hindex))
  · intro index hindex
    dsimp [lowerPopulation, upperPopulation,
      FiniteL1BracketCover.lowerPopulation,
      FiniteL1BracketCover.upperPopulation]
    have hgap :=
      FunctionBracket.population_gap_le_l1Width_of_mem
        (cover.cover.mem_bracket index hindex)
        (cover.lower_integrable (cover.cover.bracketOf index hindex))
        (cover.upper_integrable (cover.cover.bracketOf index hindex))
    have hcover :=
      cover.width_bound (cover.cover.bracketOf index hindex)
    exact le_trans (le_trans hgap hcover) h_width
  · intro index hindex
    dsimp [upperPopulation, upperEmpirical,
      FiniteL1BracketCover.upperPopulation]
    exact h_upper_endpoint (cover.cover.bracketOf index hindex)
  · intro index hindex
    dsimp [lowerPopulation, lowerEmpirical,
      FiniteL1BracketCover.lowerPopulation]
    exact h_lower_endpoint (cover.cover.bracketOf index hindex)

/--
Sequence-level empirical-deviation bound from one primitive finite `L1(P)`
bracket cover and endpoint bounds at every sample size.
-/
theorem empiricalDeviationSequenceOn_of_endpoint_bounds
    {Observation : Type u} {Index : Type v} {Bracket : Type w}
    [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width)
    (samples : ∀ sampleSize, SampleAt Observation sampleSize)
    (endpointRadius widthRadius : ℕ -> ℝ)
    (h_width : ∀ sampleSize, width ≤ widthRadius sampleSize)
    (h_upper_endpoint :
      ∀ sampleSize bracketIndex,
        empiricalAverage (samples sampleSize)
            (cover.cover.bracket bracketIndex).upper -
            (cover.cover.bracket bracketIndex).upperIntegral μ ≤
          endpointRadius sampleSize)
    (h_lower_endpoint :
      ∀ sampleSize bracketIndex,
        (cover.cover.bracket bracketIndex).lowerIntegral μ -
            empiricalAverage (samples sampleSize)
              (cover.cover.bracket bracketIndex).lower ≤
          endpointRadius sampleSize) :
    EmpiricalDeviationSequenceOn indexClass
      (fun index => populationRiskOfFunction μ (classFun index))
      (fun sampleSize index =>
        empiricalAverage (samples sampleSize) (classFun index))
      (fun sampleSize => endpointRadius sampleSize + widthRadius sampleSize) := by
  intro sampleSize
  exact cover.empiricalDeviationBoundOn_of_endpoint_bounds
    (samples sampleSize) (endpointRadius sampleSize) (widthRadius sampleSize)
    (h_width sampleSize) (h_upper_endpoint sampleSize)
    (h_lower_endpoint sampleSize)

/--
Construct the existing abstract `FiniteBracketingEndpointRoute` from a
primitive finite `L1(P)` bracket cover.
-/
noncomputable def toFiniteBracketingEndpointRoute
    {Observation : Type u} {Index : Type v} {Bracket : Type w}
    [Fintype Bracket] [MeasurableSpace Observation]
    {μ : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {width : ℝ}
    (cover :
      FiniteL1BracketCover (Bracket := Bracket) μ indexClass classFun width)
    (samples : ∀ sampleSize, SampleAt Observation sampleSize)
    (endpointRadius widthRadius : ℕ -> ℝ)
    (h_width : ∀ sampleSize, width ≤ widthRadius sampleSize)
    (h_upper_endpoint :
      ∀ sampleSize bracketIndex,
        empiricalAverage (samples sampleSize)
            (cover.cover.bracket bracketIndex).upper -
            (cover.cover.bracket bracketIndex).upperIntegral μ ≤
          endpointRadius sampleSize)
    (h_lower_endpoint :
      ∀ sampleSize bracketIndex,
        (cover.cover.bracket bracketIndex).lowerIntegral μ -
            empiricalAverage (samples sampleSize)
              (cover.cover.bracket bracketIndex).lower ≤
          endpointRadius sampleSize)
    (h_endpoint_tendsto :
      Tendsto endpointRadius atTop (𝓝 0))
    (h_width_tendsto :
      Tendsto widthRadius atTop (𝓝 0)) :
    FiniteBracketingEndpointRoute (Bracket := Bracket) indexClass
      (fun index => populationRiskOfFunction μ (classFun index))
      (fun sampleSize index =>
        empiricalAverage (samples sampleSize) (classFun index)) where
  lowerPopulation := cover.lowerPopulation
  upperPopulation := cover.upperPopulation
  lowerEmpirical := cover.lowerEmpirical samples
  upperEmpirical := cover.upperEmpirical samples
  bracketOf := fun _sampleSize index hindex =>
    cover.cover.bracketOf index hindex
  endpointRadius := endpointRadius
  widthRadius := widthRadius
  empirical_lower := by
    intro sampleSize index hindex
    exact FunctionBracket.lowerEmpirical_le_empiricalAverage_of_mem
      (samples sampleSize) (cover.cover.mem_bracket index hindex)
  empirical_upper := by
    intro sampleSize index hindex
    exact FunctionBracket.empiricalAverage_le_upperEmpirical_of_mem
      (samples sampleSize) (cover.cover.mem_bracket index hindex)
  population_lower := by
    intro _sampleSize index hindex
    dsimp [populationRiskOfFunction, FiniteL1BracketCover.lowerPopulation]
    exact FunctionBracket.lowerIntegral_le_integral_of_mem
      (cover.cover.mem_bracket index hindex)
      (cover.lower_integrable (cover.cover.bracketOf index hindex))
      (cover.function_integrable index hindex)
  population_upper := by
    intro _sampleSize index hindex
    dsimp [populationRiskOfFunction, FiniteL1BracketCover.upperPopulation]
    exact FunctionBracket.integral_le_upperIntegral_of_mem
      (cover.cover.mem_bracket index hindex)
      (cover.function_integrable index hindex)
      (cover.upper_integrable (cover.cover.bracketOf index hindex))
  width_bound := by
    intro sampleSize index hindex
    dsimp [FiniteL1BracketCover.lowerPopulation,
      FiniteL1BracketCover.upperPopulation]
    have hgap :=
      FunctionBracket.population_gap_le_l1Width_of_mem
        (cover.cover.mem_bracket index hindex)
        (cover.lower_integrable (cover.cover.bracketOf index hindex))
        (cover.upper_integrable (cover.cover.bracketOf index hindex))
    have hcover :=
      cover.width_bound (cover.cover.bracketOf index hindex)
    exact le_trans (le_trans hgap hcover) (h_width sampleSize)
  upper_endpoint_bound := by
    intro sampleSize index hindex
    dsimp [FiniteL1BracketCover.upperPopulation,
      FiniteL1BracketCover.upperEmpirical]
    exact h_upper_endpoint sampleSize (cover.cover.bracketOf index hindex)
  lower_endpoint_bound := by
    intro sampleSize index hindex
    dsimp [FiniteL1BracketCover.lowerPopulation,
      FiniteL1BracketCover.lowerEmpirical]
    exact h_lower_endpoint sampleSize (cover.cover.bracketOf index hindex)
  endpoint_tendsto_zero := h_endpoint_tendsto
  width_tendsto_zero := h_width_tendsto

end FiniteL1BracketCover

/--
Pathwise uniform convergence-to-zero interface.  Unlike the existing
`GlivenkoCantelliClass` radius-record, this matches the epsilon/eventual shape
of the textbook bracketing proof.
-/
def UniformDeviationTendstoZeroOn {Index : Type v} (indexClass : Set Index)
    (populationRisk : Index -> ℝ) (empiricalRisk : ℕ -> Index -> ℝ) : Prop :=
  ∀ tolerance > 0,
    ∀ᶠ sampleSize in atTop,
      EmpiricalDeviationBoundOn indexClass populationRisk
        (empiricalRisk sampleSize) tolerance

/--
Proof-carrying primitive finite-bracketing route for the epsilon/eventual form
of the VdV&W 2.4.1 argument.

For every positive `L1(P)` bracket width, it supplies a finite primitive bracket
cover, endpoint empirical-deviation bounds for that cover, and convergence of
the endpoint radius to zero.
-/
structure PrimitiveFiniteBracketingGCRoute
    {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation] (μ : Measure Observation)
    (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ)
    (samples : ∀ sampleSize, SampleAt Observation sampleSize) where
  Bracket : (width : ℝ) -> 0 < width -> Type w
  finiteBracket :
    ∀ width hwidth, Fintype (Bracket width hwidth)
  cover :
    ∀ width hwidth,
      @FiniteL1BracketCover Observation Index (Bracket width hwidth)
        (finiteBracket width hwidth) _ μ indexClass classFun width
  endpointRadius : ∀ _width _hwidth, ℕ -> ℝ
  endpoint_tendsto_zero :
    ∀ width hwidth,
      Tendsto (endpointRadius width hwidth) atTop (𝓝 0)
  upper_endpoint_bound :
    ∀ width hwidth sampleSize
      (bracketIndex : Bracket width hwidth),
        empiricalAverage (samples sampleSize)
            ((cover width hwidth).cover.bracket bracketIndex).upper -
            ((cover width hwidth).cover.bracket bracketIndex).upperIntegral μ ≤
          endpointRadius width hwidth sampleSize
  lower_endpoint_bound :
    ∀ width hwidth sampleSize
      (bracketIndex : Bracket width hwidth),
        ((cover width hwidth).cover.bracket bracketIndex).lowerIntegral μ -
            empiricalAverage (samples sampleSize)
              ((cover width hwidth).cover.bracket bracketIndex).lower ≤
          endpointRadius width hwidth sampleSize

namespace PrimitiveFiniteBracketingGCRoute

/--
Primitive finite bracketing route implies pathwise uniform deviation
convergence to zero.

This is the epsilon/eventual deterministic core of VdV&W Theorem 2.4.1 after
the finite bracket covers and endpoint convergence facts have been supplied.
-/
theorem uniformDeviationTendstoZeroOn
    {Observation : Type u} {Index : Type v}
    [MeasurableSpace Observation] {μ : Measure Observation}
    {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    {samples : ∀ sampleSize, SampleAt Observation sampleSize}
    (route :
      PrimitiveFiniteBracketingGCRoute μ indexClass classFun samples) :
    UniformDeviationTendstoZeroOn indexClass
      (fun index => populationRiskOfFunction μ (classFun index))
      (fun sampleSize index =>
        empiricalAverage (samples sampleSize) (classFun index)) := by
  intro tolerance htolerance
  let width := tolerance / 2
  have hwidth : 0 < width := by
    dsimp [width]
    linarith
  letI := route.finiteBracket width hwidth
  have h_endpoint_eventually :
      ∀ᶠ sampleSize in atTop,
        route.endpointRadius width hwidth sampleSize < tolerance / 2 :=
    (route.endpoint_tendsto_zero width hwidth).eventually_lt_const
      (by linarith)
  filter_upwards [h_endpoint_eventually] with sampleSize h_endpoint_lt
  have hbound :
      EmpiricalDeviationBoundOn indexClass
        (fun index => populationRiskOfFunction μ (classFun index))
        (fun index => empiricalAverage (samples sampleSize) (classFun index))
        (route.endpointRadius width hwidth sampleSize + width) :=
    (route.cover width hwidth).empiricalDeviationBoundOn_of_endpoint_bounds
      (samples sampleSize)
      (route.endpointRadius width hwidth sampleSize) width
      (le_rfl)
      (route.upper_endpoint_bound width hwidth sampleSize)
      (route.lower_endpoint_bound width hwidth sampleSize)
  intro index hindex
  have hdev := hbound index hindex
  have hradius :
      route.endpointRadius width hwidth sampleSize + width ≤ tolerance := by
    dsimp [width] at h_endpoint_lt ⊢
    linarith
  exact le_trans hdev hradius

end PrimitiveFiniteBracketingGCRoute

end StatInference
