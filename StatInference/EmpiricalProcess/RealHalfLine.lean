import StatInference.EmpiricalProcess.BracketingPrimitive
import Mathlib.Data.EReal.Basic
import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Measure.Real
import Mathlib.MeasureTheory.Measure.TightNormed
import Mathlib.Topology.Instances.EReal.Lemmas
import Mathlib.Topology.Order.Bornology

/-!
# Real half-line brackets

This module starts the local formalization layer for VdV&W Example 2.4.2.
It proves the pointwise and `L1(P)` facts for brackets of indicators of real
half-lines.  The finite grid existence theorem is kept separate.
-/

namespace StatInference

open MeasureTheory Set

universe u

/-- Indicator of the closed lower half-line `(-∞, c]`, as a real-valued function. -/
noncomputable def realHalfLineIndicator (c : ℝ) : ℝ -> ℝ :=
  Set.indicator (Set.Iic c) (fun _ => (1 : ℝ))

/-- Indicator of the open lower half-line `(-∞, c)`, as a real-valued function. -/
noncomputable def realOpenHalfLineIndicator (c : ℝ) : ℝ -> ℝ :=
  Set.indicator (Set.Iio c) (fun _ => (1 : ℝ))

/--
The VdV&W Example 2.4.2 bracket
`[1{(-∞, a]}, 1{(-∞, b)}]`.
-/
noncomputable def realHalfLineBracket (a b : ℝ) : FunctionBracket ℝ where
  lower := realHalfLineIndicator a
  upper := realOpenHalfLineIndicator b

/--
If `a ≤ c < b`, then `1{(-∞, c]}` lies in the bracket
`[1{(-∞, a]}, 1{(-∞, b)}]`.
-/
theorem realHalfLineBracket_mem_indicator_of_le_lt
    {a b c : ℝ} (hac : a ≤ c) (hcb : c < b) :
    (realHalfLineBracket a b).Mem (realHalfLineIndicator c) := by
  intro x
  constructor
  · by_cases hxa : x ≤ a
    · have hxc : x ≤ c := hxa.trans hac
      simp [realHalfLineBracket, realHalfLineIndicator, hxa, hxc]
    · by_cases hxc : x ≤ c
      · simp [realHalfLineBracket, realHalfLineIndicator, hxa, hxc]
      · simp [realHalfLineBracket, realHalfLineIndicator, hxa, hxc]
  · by_cases hxc : x ≤ c
    · have hxb : x < b := lt_of_le_of_lt hxc hcb
      simp [realHalfLineBracket, realHalfLineIndicator,
        realOpenHalfLineIndicator, hxc, hxb]
    · by_cases hxb : x < b
      · simp [realHalfLineBracket, realHalfLineIndicator,
          realOpenHalfLineIndicator, hxc, hxb]
      · simp [realHalfLineBracket, realHalfLineIndicator,
          realOpenHalfLineIndicator, hxc, hxb]

/-- Closed half-line indicators are integrable under any finite measure. -/
theorem integrable_realHalfLineIndicator
    (μ : Measure ℝ) [IsFiniteMeasure μ] (c : ℝ) :
    Integrable (realHalfLineIndicator c) μ := by
  simpa [realHalfLineIndicator] using
    (integrable_const (1 : ℝ)).indicator measurableSet_Iic

/-- Open half-line indicators are integrable under any finite measure. -/
theorem integrable_realOpenHalfLineIndicator
    (μ : Measure ℝ) [IsFiniteMeasure μ] (c : ℝ) :
    Integrable (realOpenHalfLineIndicator c) μ := by
  simpa [realOpenHalfLineIndicator] using
    (integrable_const (1 : ℝ)).indicator measurableSet_Iio

/--
For `a < b`, the absolute endpoint gap of the Example 2.4.2 bracket is the
indicator of the open cell `(a, b)`.
-/
theorem abs_realHalfLineBracket_endpoint_gap_eq_indicator_Ioo
    {a b : ℝ} (hab : a < b) :
    (fun x =>
      |(realHalfLineBracket a b).upper x -
        (realHalfLineBracket a b).lower x|) =
      Set.indicator (Set.Ioo a b) (fun _ => (1 : ℝ)) := by
  funext x
  by_cases hax : a < x
  · by_cases hxb : x < b
    · simp [realHalfLineBracket, realHalfLineIndicator,
        realOpenHalfLineIndicator, hax, hxb]
    · have hnot_upper : ¬ x < b := hxb
      have hnot_cell : x ∉ Set.Ioo a b := fun hx => hnot_upper hx.2
      simp [realHalfLineBracket, realHalfLineIndicator,
        realOpenHalfLineIndicator, hax, hnot_upper, hnot_cell]
  · have hxa : x ≤ a := le_of_not_gt hax
    have hxb : x < b := lt_of_le_of_lt hxa hab
    have hnot_cell : x ∉ Set.Ioo a b := fun hx => hax hx.1
    simp [realHalfLineBracket, realHalfLineIndicator,
      realOpenHalfLineIndicator, hxa, hxb, hnot_cell]

/--
For `a < b`, the `L1(P)` width of the half-line bracket is the real measure
of the open cell `(a, b)`.
-/
theorem realHalfLineBracket_l1Width_eq_measureReal_Ioo
    (μ : Measure ℝ) {a b : ℝ} (hab : a < b) :
    (realHalfLineBracket a b).l1Width μ = μ.real (Set.Ioo a b) := by
  dsimp [FunctionBracket.l1Width]
  rw [abs_realHalfLineBracket_endpoint_gap_eq_indicator_Ioo hab]
  exact integral_indicator_one measurableSet_Ioo

/--
A supplied finite real grid for half-line brackets.

This is a proof-carrying finite-grid layer for VdV&W Example 2.4.2.  It does
not yet construct the textbook grid from an arbitrary distribution; it records
exactly the data needed to turn such a grid into the primitive local
bracketing-number witness.
-/
structure SuppliedRealHalfLineGrid
    (μ : Measure ℝ) (epsilon : ℝ) (cardinality : ℕ) where
  left : Fin cardinality -> ℝ
  right : Fin cardinality -> ℝ
  bracketOf : ℝ -> Fin cardinality
  left_lt_right : ∀ bracketIndex, left bracketIndex < right bracketIndex
  left_le_index : ∀ c, left (bracketOf c) ≤ c
  index_lt_right : ∀ c, c < right (bracketOf c)
  cell_width_lt :
    ∀ bracketIndex, μ.real (Set.Ioo (left bracketIndex) (right bracketIndex)) < epsilon

namespace SuppliedRealHalfLineGrid

/--
A supplied real half-line grid at a smaller radius is also a supplied grid at
any larger radius.
-/
def of_le_epsilon
    {μ : Measure ℝ} {epsilon smallerEpsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedRealHalfLineGrid μ smallerEpsilon cardinality)
    (hsmall : smallerEpsilon ≤ epsilon) :
    SuppliedRealHalfLineGrid μ epsilon cardinality where
  left := grid.left
  right := grid.right
  bracketOf := grid.bracketOf
  left_lt_right := grid.left_lt_right
  left_le_index := grid.left_le_index
  index_lt_right := grid.index_lt_right
  cell_width_lt := fun bracketIndex =>
    lt_of_lt_of_le (grid.cell_width_lt bracketIndex) hsmall

/--
Finite real-grid existence is monotone in the requested radius.
-/
theorem exists_of_le_epsilon
    {μ : Measure ℝ} {epsilon smallerEpsilon : ℝ}
    (hsmall : smallerEpsilon ≤ epsilon)
    (gridExists :
      ∃ cardinality, Nonempty
        (SuppliedRealHalfLineGrid μ smallerEpsilon cardinality)) :
    ∃ cardinality, Nonempty (SuppliedRealHalfLineGrid μ epsilon cardinality) := by
  rcases gridExists with ⟨cardinality, gridNonempty⟩
  exact ⟨cardinality, gridNonempty.map fun grid => grid.of_le_epsilon hsmall⟩

/--
A supplied finite real grid yields an explicit-cardinality finite `L1(P)`
bracket cover for the half-line indicator class.
-/
noncomputable def toFiniteL1BracketCoverAtCard
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedRealHalfLineGrid μ epsilon cardinality) :
    FiniteL1BracketCoverAtCard μ Set.univ realHalfLineIndicator
      epsilon cardinality where
  bracket := fun bracketIndex =>
    realHalfLineBracket (grid.left bracketIndex) (grid.right bracketIndex)
  bracketOf := fun c _ => grid.bracketOf c
  mem_bracket := by
    intro c _hc
    exact
      realHalfLineBracket_mem_indicator_of_le_lt
        (grid.left_le_index c) (grid.index_lt_right c)
  width_lt := by
    intro bracketIndex
    dsimp [IsL1EpsilonBracket, l1BracketWidth]
    rw [realHalfLineBracket_l1Width_eq_measureReal_Ioo μ
      (grid.left_lt_right bracketIndex)]
    exact grid.cell_width_lt bracketIndex
  lower_integrable := by
    intro bracketIndex
    exact integrable_realHalfLineIndicator μ (grid.left bracketIndex)
  upper_integrable := by
    intro bracketIndex
    exact integrable_realOpenHalfLineIndicator μ (grid.right bracketIndex)
  function_integrable := by
    intro c _hc
    exact integrable_realHalfLineIndicator μ c

/--
A supplied finite real grid proves finiteness of the primitive local
`L1(P)` bracketing-number witness.
-/
theorem hasFiniteL1BracketingNumber
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedRealHalfLineGrid μ epsilon cardinality) :
    HasFiniteL1BracketingNumber μ Set.univ realHalfLineIndicator epsilon := by
  exact ⟨cardinality, ⟨grid.toFiniteL1BracketCoverAtCard⟩⟩

/--
A supplied finite real grid makes the numeric primitive bracketing number
finite.
-/
theorem l1BracketingNumber_lt_top
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedRealHalfLineGrid μ epsilon cardinality) :
    l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ :=
  l1BracketingNumber_lt_top_of_hasFinite grid.hasFiniteL1BracketingNumber

end SuppliedRealHalfLineGrid

/--
Indicator of the extended-endpoint closed lower half-line
`{x : ℝ | (x : EReal) ≤ c}`.
-/
noncomputable def eRealClosedHalfLineIndicator (c : EReal) : ℝ -> ℝ :=
  Set.indicator {x : ℝ | (x : EReal) ≤ c} (fun _ => (1 : ℝ))

/--
Indicator of the extended-endpoint open lower half-line
`{x : ℝ | (x : EReal) < c}`.
-/
noncomputable def eRealOpenHalfLineIndicator (c : EReal) : ℝ -> ℝ :=
  Set.indicator {x : ℝ | (x : EReal) < c} (fun _ => (1 : ℝ))

/--
The extended-endpoint version of the VdV&W Example 2.4.2 bracket
`[1{(-∞, a]}, 1{(-∞, b)}]`.
-/
noncomputable def eRealHalfLineBracket (a b : EReal) : FunctionBracket ℝ where
  lower := eRealClosedHalfLineIndicator a
  upper := eRealOpenHalfLineIndicator b

/-- The open real cell selected by two extended-real endpoints. -/
def eRealOpenCell (a b : EReal) : Set ℝ :=
  {x : ℝ | (x : EReal) ∈ Set.Ioo a b}

/-- Extended-real endpoint open cells are Borel measurable on `ℝ`. -/
theorem measurableSet_eRealOpenCell (a b : EReal) :
    MeasurableSet (eRealOpenCell a b) := by
  change MeasurableSet (((fun x : ℝ => (x : EReal)) ⁻¹' Set.Ioo a b))
  exact continuous_coe_real_ereal.measurable measurableSet_Ioo

/-- Finite extended endpoints recover the ordinary real open interval cell. -/
theorem eRealOpenCell_coe_coe (a b : ℝ) :
    eRealOpenCell (a : EReal) (b : EReal) = Set.Ioo a b := by
  ext x
  simp [eRealOpenCell]

/-- A left endpoint `-∞` and finite right endpoint recover an open lower half-line. -/
theorem eRealOpenCell_bot_coe (b : ℝ) :
    eRealOpenCell ⊥ (b : EReal) = Set.Iio b := by
  ext x
  simp [eRealOpenCell]

/-- A finite left endpoint and right endpoint `∞` recover an open upper half-line. -/
theorem eRealOpenCell_coe_top (a : ℝ) :
    eRealOpenCell (a : EReal) ⊤ = Set.Ioi a := by
  ext x
  simp [eRealOpenCell]

/-- The extended-open cell `(-∞, ∞)` is all of `ℝ`. -/
theorem eRealOpenCell_bot_top :
    eRealOpenCell ⊥ ⊤ = Set.univ := by
  ext x
  simp [eRealOpenCell]

/-- Finite extended endpoints recover the ordinary real open interval measure. -/
theorem measureReal_eRealOpenCell_coe_coe
    (μ : Measure ℝ) (a b : ℝ) :
    μ.real (eRealOpenCell (a : EReal) (b : EReal)) = μ.real (Set.Ioo a b) := by
  rw [eRealOpenCell_coe_coe]

/-- A left endpoint `-∞` and finite right endpoint recover the open lower half-line measure. -/
theorem measureReal_eRealOpenCell_bot_coe
    (μ : Measure ℝ) (b : ℝ) :
    μ.real (eRealOpenCell ⊥ (b : EReal)) = μ.real (Set.Iio b) := by
  rw [eRealOpenCell_bot_coe]

/-- A finite left endpoint and right endpoint `∞` recover the open upper half-line measure. -/
theorem measureReal_eRealOpenCell_coe_top
    (μ : Measure ℝ) (a : ℝ) :
    μ.real (eRealOpenCell (a : EReal) ⊤) = μ.real (Set.Ioi a) := by
  rw [eRealOpenCell_coe_top]

/-- The extended-open cell `(-∞, ∞)` has the measure of the whole line. -/
theorem measureReal_eRealOpenCell_bot_top
    (μ : Measure ℝ) :
    μ.real (eRealOpenCell ⊥ ⊤) = μ.real Set.univ := by
  rw [eRealOpenCell_bot_top]

/--
Finite Borel measures on the real line have finite real cutpoints with
arbitrarily small lower and upper tails.

This is the first distribution-dependent ingredient for the endpoint-grid
construction in VdV&W Example 2.4.2.
-/
theorem exists_real_tails_lt_of_isFiniteMeasure
    (μ : Measure ℝ) [IsFiniteMeasure μ] {epsilon : ℝ} (hepsilon : 0 < epsilon) :
    ∃ a b : ℝ, μ.real (Set.Iio a) < epsilon ∧ μ.real (Set.Ioi b) < epsilon := by
  have hdelta_pos : 0 < ENNReal.ofReal (epsilon / 2) :=
    ENNReal.ofReal_pos.mpr (half_pos hepsilon)
  have hTight : IsTightMeasureSet ({μ} : Set (Measure ℝ)) :=
    isTightMeasureSet_singleton (μ := μ)
  rcases
      (isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mp hTight)
        (ENNReal.ofReal (epsilon / 2)) hdelta_pos with
    ⟨K, hKcompact, hKmeasure⟩
  let a : ℝ := sInf K
  let b : ℝ := sSup K
  refine ⟨a, b, ?_, ?_⟩
  · have hsubset : Set.Iio a ⊆ Kᶜ := by
      intro x hx hxK
      have hxIcc : x ∈ Set.Icc (sInf K) (sSup K) :=
        hKcompact.isBounded.subset_Icc_sInf_sSup hxK
      exact (not_le_of_gt hx) hxIcc.1
    have hle : μ.real (Set.Iio a) ≤ (ENNReal.ofReal (epsilon / 2)).toReal := by
      calc
        μ.real (Set.Iio a) ≤ μ.real Kᶜ := measureReal_mono hsubset
        _ ≤ (ENNReal.ofReal (epsilon / 2)).toReal :=
          ENNReal.toReal_mono ENNReal.ofReal_ne_top (hKmeasure μ rfl)
    rw [ENNReal.toReal_ofReal (by linarith : 0 ≤ epsilon / 2)] at hle
    linarith
  · have hsubset : Set.Ioi b ⊆ Kᶜ := by
      intro x hx hxK
      have hxIcc : x ∈ Set.Icc (sInf K) (sSup K) :=
        hKcompact.isBounded.subset_Icc_sInf_sSup hxK
      exact (not_le_of_gt hx) hxIcc.2
    have hle : μ.real (Set.Ioi b) ≤ (ENNReal.ofReal (epsilon / 2)).toReal := by
      calc
        μ.real (Set.Ioi b) ≤ μ.real Kᶜ := measureReal_mono hsubset
        _ ≤ (ENNReal.ofReal (epsilon / 2)).toReal :=
          ENNReal.toReal_mono ENNReal.ofReal_ne_top (hKmeasure μ rfl)
    rw [ENNReal.toReal_ofReal (by linarith : 0 ≤ epsilon / 2)] at hle
    linarith

/-- Finite extended endpoints recover the ordinary closed half-line indicator. -/
theorem eRealClosedHalfLineIndicator_coe (c : ℝ) :
    eRealClosedHalfLineIndicator (c : EReal) = realHalfLineIndicator c := by
  funext x
  by_cases hx : x ≤ c
  · simp [eRealClosedHalfLineIndicator, realHalfLineIndicator, hx]
  · simp [eRealClosedHalfLineIndicator, realHalfLineIndicator, hx]

/-- Finite extended endpoints recover the ordinary open half-line indicator. -/
theorem eRealOpenHalfLineIndicator_coe (c : ℝ) :
    eRealOpenHalfLineIndicator (c : EReal) = realOpenHalfLineIndicator c := by
  funext x
  by_cases hx : x < c
  · simp [eRealOpenHalfLineIndicator, realOpenHalfLineIndicator, hx]
  · simp [eRealOpenHalfLineIndicator, realOpenHalfLineIndicator, hx]

/-- The closed lower half-line at `-∞` is empty on real observations. -/
theorem eRealClosedHalfLineIndicator_bot :
    eRealClosedHalfLineIndicator ⊥ = fun _ => (0 : ℝ) := by
  funext x
  simp [eRealClosedHalfLineIndicator]

/-- The open lower half-line at `-∞` is empty on real observations. -/
theorem eRealOpenHalfLineIndicator_bot :
    eRealOpenHalfLineIndicator ⊥ = fun _ => (0 : ℝ) := by
  funext x
  simp [eRealOpenHalfLineIndicator]

/-- The closed lower half-line at `∞` is all real observations. -/
theorem eRealClosedHalfLineIndicator_top :
    eRealClosedHalfLineIndicator ⊤ = fun _ => (1 : ℝ) := by
  funext x
  simp [eRealClosedHalfLineIndicator]

/-- The open lower half-line at `∞` is all real observations. -/
theorem eRealOpenHalfLineIndicator_top :
    eRealOpenHalfLineIndicator ⊤ = fun _ => (1 : ℝ) := by
  funext x
  simp [eRealOpenHalfLineIndicator]

/--
For `a < b`, the absolute endpoint gap of the extended-endpoint bracket is
the indicator of the extended-open cell `{x | a < (x : EReal) ∧ (x : EReal) < b}`.
-/
theorem abs_eRealHalfLineBracket_endpoint_gap_eq_indicator_openCell
    {a b : EReal} (hab : a < b) :
    (fun x =>
      |(eRealHalfLineBracket a b).upper x -
        (eRealHalfLineBracket a b).lower x|) =
      Set.indicator (eRealOpenCell a b) (fun _ => (1 : ℝ)) := by
  funext x
  by_cases hax : a < (x : EReal)
  · have hnot_lower : ¬ (x : EReal) ≤ a := not_le.mpr hax
    by_cases hxb : (x : EReal) < b
    · simp [eRealHalfLineBracket, eRealClosedHalfLineIndicator,
        eRealOpenHalfLineIndicator, eRealOpenCell, hnot_lower, hax, hxb]
    · simp [eRealHalfLineBracket, eRealClosedHalfLineIndicator,
        eRealOpenHalfLineIndicator, eRealOpenCell, hnot_lower, hax, hxb]
  · have hxa : (x : EReal) ≤ a := le_of_not_gt hax
    have hxb : (x : EReal) < b := lt_of_le_of_lt hxa hab
    simp [eRealHalfLineBracket, eRealClosedHalfLineIndicator,
      eRealOpenHalfLineIndicator, eRealOpenCell, hxa, hax, hxb]

/--
For `a < b`, the `L1(P)` width of the extended-endpoint half-line bracket is
the real measure of the extended-open cell between the endpoints.
-/
theorem eRealHalfLineBracket_l1Width_eq_measureReal_openCell
    (μ : Measure ℝ) {a b : EReal} (hab : a < b) :
    (eRealHalfLineBracket a b).l1Width μ = μ.real (eRealOpenCell a b) := by
  dsimp [FunctionBracket.l1Width]
  rw [abs_eRealHalfLineBracket_endpoint_gap_eq_indicator_openCell hab]
  exact integral_indicator_one (measurableSet_eRealOpenCell a b)

/-- Extended-endpoint closed half-line indicators are integrable under finite measures. -/
theorem integrable_eRealClosedHalfLineIndicator
    (μ : Measure ℝ) [IsFiniteMeasure μ] (c : EReal) :
    Integrable (eRealClosedHalfLineIndicator c) μ := by
  induction c using EReal.rec with
  | bot =>
      rw [eRealClosedHalfLineIndicator_bot]
      exact integrable_const (0 : ℝ)
  | coe c =>
      rw [eRealClosedHalfLineIndicator_coe]
      exact integrable_realHalfLineIndicator μ c
  | top =>
      rw [eRealClosedHalfLineIndicator_top]
      exact integrable_const (1 : ℝ)

/-- Extended-endpoint open half-line indicators are integrable under finite measures. -/
theorem integrable_eRealOpenHalfLineIndicator
    (μ : Measure ℝ) [IsFiniteMeasure μ] (c : EReal) :
    Integrable (eRealOpenHalfLineIndicator c) μ := by
  induction c using EReal.rec with
  | bot =>
      rw [eRealOpenHalfLineIndicator_bot]
      exact integrable_const (0 : ℝ)
  | coe c =>
      rw [eRealOpenHalfLineIndicator_coe]
      exact integrable_realOpenHalfLineIndicator μ c
  | top =>
      rw [eRealOpenHalfLineIndicator_top]
      exact integrable_const (1 : ℝ)

/--
If `a ≤ c < b` in the extended real line, then the finite real half-line
indicator `1{(-∞, c]}` lies in the extended-endpoint bracket.
-/
theorem eRealHalfLineBracket_mem_realIndicator_of_le_lt
    {a b : EReal} {c : ℝ} (hac : a ≤ (c : EReal)) (hcb : (c : EReal) < b) :
    (eRealHalfLineBracket a b).Mem (realHalfLineIndicator c) := by
  intro x
  constructor
  · by_cases hxa : (x : EReal) ≤ a
    · have hxc : x ≤ c := EReal.coe_le_coe_iff.mp (hxa.trans hac)
      simp [eRealHalfLineBracket, eRealClosedHalfLineIndicator,
        realHalfLineIndicator, hxa, hxc]
    · by_cases hxc : x ≤ c
      · simp [eRealHalfLineBracket, eRealClosedHalfLineIndicator,
          realHalfLineIndicator, hxa, hxc]
      · simp [eRealHalfLineBracket, eRealClosedHalfLineIndicator,
          realHalfLineIndicator, hxa, hxc]
  · by_cases hxc : x ≤ c
    · have hxcE : (x : EReal) ≤ (c : EReal) := EReal.coe_le_coe hxc
      have hxb : (x : EReal) < b := lt_of_le_of_lt hxcE hcb
      simp [eRealHalfLineBracket, eRealOpenHalfLineIndicator,
        realHalfLineIndicator, hxc, hxb]
    · by_cases hxb : (x : EReal) < b
      · simp [eRealHalfLineBracket, eRealOpenHalfLineIndicator,
          realHalfLineIndicator, hxc, hxb]
      · simp [eRealHalfLineBracket, eRealOpenHalfLineIndicator,
          realHalfLineIndicator, hxc, hxb]

/--
A supplied finite extended-real grid for half-line brackets.

The textbook grid in Example 2.4.2 has endpoints `-∞ = t₀` and `tₘ = ∞`.
This proof-carrying structure separates that endpoint issue from the later
problem of constructing such a grid from an arbitrary distribution.
-/
structure SuppliedERealHalfLineGrid
    (μ : Measure ℝ) (epsilon : ℝ) (cardinality : ℕ) where
  left : Fin cardinality -> EReal
  right : Fin cardinality -> EReal
  bracketOf : ℝ -> Fin cardinality
  left_lt_right : ∀ bracketIndex, left bracketIndex < right bracketIndex
  left_le_index : ∀ c : ℝ, left (bracketOf c) ≤ (c : EReal)
  index_lt_right : ∀ c : ℝ, (c : EReal) < right (bracketOf c)
  cell_width_lt :
    ∀ bracketIndex, μ.real (eRealOpenCell (left bracketIndex)
      (right bracketIndex)) < epsilon

/--
A supplied finite extended-real endpoint grid for half-line brackets.

This records the textbook-style adjacent endpoints
`t₀, ..., t_m` and a proof that every real cutoff lies in one adjacent cell.
Constructing such endpoint data from an arbitrary distribution is the next
substantive step for Example 2.4.2.
-/
structure SuppliedERealHalfLineEndpointGrid
    (μ : Measure ℝ) (epsilon : ℝ) (cellCount : ℕ) where
  endpoint : Fin (cellCount + 1) -> EReal
  bracketOf : ℝ -> Fin cellCount
  left_lt_right :
    ∀ cell : Fin cellCount, endpoint (Fin.castSucc cell) < endpoint (Fin.succ cell)
  left_le_index :
    ∀ c : ℝ, endpoint (Fin.castSucc (bracketOf c)) ≤ (c : EReal)
  index_lt_right :
    ∀ c : ℝ, (c : EReal) < endpoint (Fin.succ (bracketOf c))
  cell_width_lt :
    ∀ cell : Fin cellCount, μ.real (eRealOpenCell (endpoint (Fin.castSucc cell))
      (endpoint (Fin.succ cell))) < epsilon

namespace SuppliedERealHalfLineEndpointGrid

/--
A supplied adjacent-endpoint grid yields the more primitive supplied-grid
structure used by the bracketing-number layer.
-/
def toSuppliedERealHalfLineGrid
    {μ : Measure ℝ} {epsilon : ℝ} {cellCount : ℕ}
    (grid : SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) :
    SuppliedERealHalfLineGrid μ epsilon cellCount where
  left := fun cell => grid.endpoint (Fin.castSucc cell)
  right := fun cell => grid.endpoint (Fin.succ cell)
  bracketOf := grid.bracketOf
  left_lt_right := grid.left_lt_right
  left_le_index := grid.left_le_index
  index_lt_right := grid.index_lt_right
  cell_width_lt := grid.cell_width_lt

/--
A supplied adjacent-endpoint grid at a smaller radius is also a supplied
adjacent-endpoint grid at any larger radius.
-/
def of_le_epsilon
    {μ : Measure ℝ} {epsilon smallerEpsilon : ℝ} {cellCount : ℕ}
    (grid : SuppliedERealHalfLineEndpointGrid μ smallerEpsilon cellCount)
    (hsmall : smallerEpsilon ≤ epsilon) :
    SuppliedERealHalfLineEndpointGrid μ epsilon cellCount where
  endpoint := grid.endpoint
  bracketOf := grid.bracketOf
  left_lt_right := grid.left_lt_right
  left_le_index := grid.left_le_index
  index_lt_right := grid.index_lt_right
  cell_width_lt := fun cell =>
    lt_of_lt_of_le (grid.cell_width_lt cell) hsmall

/--
Finite adjacent-endpoint grid existence is monotone in the requested radius.
-/
theorem exists_of_le_epsilon
    {μ : Measure ℝ} {epsilon smallerEpsilon : ℝ}
    (hsmall : smallerEpsilon ≤ epsilon)
    (gridExists :
      ∃ cellCount, Nonempty
        (SuppliedERealHalfLineEndpointGrid μ smallerEpsilon cellCount)) :
    ∃ cellCount, Nonempty
      (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) := by
  rcases gridExists with ⟨cellCount, gridNonempty⟩
  exact ⟨cellCount, gridNonempty.map fun grid => grid.of_le_epsilon hsmall⟩

/--
Lift a strictly increasing finite real endpoint sequence to an extended-real
adjacent-endpoint grid.

This is the compact-core assembly layer for Example 2.4.2; the infinite tails
are handled by adjoining `⊥` and `⊤` in separate constructors.
-/
def ofFiniteRealEndpoints
    {μ : Measure ℝ} {epsilon : ℝ} {cellCount : ℕ}
    (endpoint : Fin (cellCount + 1) -> ℝ)
    (hendpoint_strictMono : StrictMono endpoint)
    (bracketOf : ℝ -> Fin cellCount)
    (left_le_index :
      ∀ c : ℝ, endpoint (Fin.castSucc (bracketOf c)) ≤ c)
    (index_lt_right :
      ∀ c : ℝ, c < endpoint (Fin.succ (bracketOf c)))
    (cell_width_lt :
      ∀ cell : Fin cellCount,
        μ.real (Set.Ioo (endpoint (Fin.castSucc cell))
          (endpoint (Fin.succ cell))) < epsilon) :
    SuppliedERealHalfLineEndpointGrid μ epsilon cellCount where
  endpoint := fun endpointIndex => (endpoint endpointIndex : EReal)
  bracketOf := bracketOf
  left_lt_right := by
    intro cell
    exact EReal.coe_lt_coe_iff.mpr
      (hendpoint_strictMono
        (show Fin.castSucc cell < Fin.succ cell from Fin.castSucc_lt_succ))
  left_le_index := by
    intro c
    exact EReal.coe_le_coe (left_le_index c)
  index_lt_right := by
    intro c
    exact EReal.coe_lt_coe_iff.mpr (index_lt_right c)
  cell_width_lt := by
    intro cell
    simpa [measureReal_eRealOpenCell_coe_coe] using cell_width_lt cell

/--
The one-cell textbook-style extended endpoint grid `-∞ < ∞`.

This is the endpoint-grid analogue of `SuppliedERealHalfLineGrid.singleCell`;
it is the base case for Example 2.4.2 when the requested radius is larger
than the total mass.
-/
noncomputable def singleCell
    (μ : Measure ℝ) {epsilon : ℝ} (hwidth : μ.real Set.univ < epsilon) :
    SuppliedERealHalfLineEndpointGrid μ epsilon 1 where
  endpoint := fun endpointIndex =>
    if endpointIndex = 0 then (⊥ : EReal) else ⊤
  bracketOf := fun _ => 0
  left_lt_right := by
    intro cell
    fin_cases cell
    simp
  left_le_index := by
    intro _c
    simp
  index_lt_right := by
    intro _c
    simp
  cell_width_lt := by
    intro cell
    fin_cases cell
    simp [eRealOpenCell_bot_top, hwidth]

/--
If the requested radius exceeds the total mass, the one-cell endpoint grid is
a supplied finite adjacent-endpoint grid.
-/
theorem exists_singleCell_of_measureReal_univ_lt
    (μ : Measure ℝ) {epsilon : ℝ} (hwidth : μ.real Set.univ < epsilon) :
    ∃ cellCount, Nonempty (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) :=
  ⟨1, ⟨singleCell μ hwidth⟩⟩

/--
The three-cell textbook-style endpoint grid
`-∞ < a < b < ∞`.

This packages the simplest nontrivial finite endpoint grid: a lower tail, a
bounded middle cell, and an upper tail.
-/
noncomputable def threeCell
    (μ : Measure ℝ) {epsilon a b : ℝ}
    (hab : a < b)
    (hleft : μ.real (Set.Iio a) < epsilon)
    (hmiddle : μ.real (Set.Ioo a b) < epsilon)
    (hright : μ.real (Set.Ioi b) < epsilon) :
    SuppliedERealHalfLineEndpointGrid μ epsilon 3 where
  endpoint := fun endpointIndex =>
    if endpointIndex = 0 then (⊥ : EReal)
    else if endpointIndex = 1 then (a : EReal)
    else if endpointIndex = 2 then (b : EReal)
    else ⊤
  bracketOf := fun c =>
    if _hca : c < a then 0 else if _hcb : c < b then 1 else 2
  left_lt_right := by
    intro cell
    fin_cases cell <;> simp [hab]
  left_le_index := by
    intro c
    by_cases hca : c < a
    · simp [hca]
    · by_cases hcb : c < b
      · have hac : a ≤ c := le_of_not_gt hca
        simp [hca, hcb, hac]
      · have hbc : b ≤ c := le_of_not_gt hcb
        simp [hca, hcb, hbc]
  index_lt_right := by
    intro c
    by_cases hca : c < a
    · simp [hca]
    · by_cases hcb : c < b
      · simp [hca, hcb]
      · simp [hca, hcb]
  cell_width_lt := by
    intro cell
    fin_cases cell
    · simpa [measureReal_eRealOpenCell_bot_coe] using hleft
    · simpa [measureReal_eRealOpenCell_coe_coe] using hmiddle
    · simpa [measureReal_eRealOpenCell_coe_top] using hright

/--
Three real cutpoints satisfying the lower-tail, middle-cell, and upper-tail
width bounds give a supplied adjacent-endpoint grid.
-/
theorem exists_threeCell
    (μ : Measure ℝ) {epsilon a b : ℝ}
    (hab : a < b)
    (hleft : μ.real (Set.Iio a) < epsilon)
    (hmiddle : μ.real (Set.Ioo a b) < epsilon)
    (hright : μ.real (Set.Ioi b) < epsilon) :
    ∃ cellCount, Nonempty (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) :=
  ⟨3, ⟨threeCell μ hab hleft hmiddle hright⟩⟩

/--
To prove endpoint-grid existence for every positive radius, it is enough to
construct grids in the nontrivial range below the total mass.  Larger radii
are handled by the one-cell endpoint grid.
-/
theorem exists_forall_of_exists_le_measureReal_univ
    {μ : Measure ℝ}
    (endpointGridExists_le_total :
      ∀ epsilon, 0 < epsilon -> epsilon ≤ μ.real Set.univ ->
        ∃ cellCount, Nonempty
          (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)) :
    ∀ epsilon, 0 < epsilon ->
      ∃ cellCount, Nonempty
        (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) := by
  intro epsilon hepsilon
  by_cases hwidth : μ.real Set.univ < epsilon
  · exact exists_singleCell_of_measureReal_univ_lt μ hwidth
  · exact endpointGridExists_le_total epsilon hepsilon (le_of_not_gt hwidth)

end SuppliedERealHalfLineEndpointGrid

namespace SuppliedERealHalfLineGrid

/--
A supplied extended-real grid at a smaller radius is also a supplied grid at
any larger radius.
-/
def of_le_epsilon
    {μ : Measure ℝ} {epsilon smallerEpsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedERealHalfLineGrid μ smallerEpsilon cardinality)
    (hsmall : smallerEpsilon ≤ epsilon) :
    SuppliedERealHalfLineGrid μ epsilon cardinality where
  left := grid.left
  right := grid.right
  bracketOf := grid.bracketOf
  left_lt_right := grid.left_lt_right
  left_le_index := grid.left_le_index
  index_lt_right := grid.index_lt_right
  cell_width_lt := fun bracketIndex =>
    lt_of_lt_of_le (grid.cell_width_lt bracketIndex) hsmall

/--
Finite extended-real grid existence is monotone in the requested radius.
-/
theorem exists_of_le_epsilon
    {μ : Measure ℝ} {epsilon smallerEpsilon : ℝ}
    (hsmall : smallerEpsilon ≤ epsilon)
    (gridExists :
      ∃ cardinality, Nonempty
        (SuppliedERealHalfLineGrid μ smallerEpsilon cardinality)) :
    ∃ cardinality, Nonempty (SuppliedERealHalfLineGrid μ epsilon cardinality) := by
  rcases gridExists with ⟨cardinality, gridNonempty⟩
  exact ⟨cardinality, gridNonempty.map fun grid => grid.of_le_epsilon hsmall⟩

/--
The one-cell extended grid `(-∞, ∞)`.

This is the base case for the distribution-dependent grid construction in
Example 2.4.2: if the total mass is already below the requested radius, one
bracket covers the whole half-line class.
-/
noncomputable def singleCell
    (μ : Measure ℝ) {epsilon : ℝ} (hwidth : μ.real Set.univ < epsilon) :
    SuppliedERealHalfLineGrid μ epsilon 1 where
  left := fun _ => ⊥
  right := fun _ => ⊤
  bracketOf := fun _ => 0
  left_lt_right := by
    intro _bracketIndex
    simp
  left_le_index := by
    intro _c
    simp
  index_lt_right := by
    intro _c
    simp
  cell_width_lt := by
    intro _bracketIndex
    rwa [eRealOpenCell_bot_top]

/--
If the requested radius exceeds the total mass, the one-cell extended grid is
a supplied finite grid.
-/
theorem exists_singleCell_of_measureReal_univ_lt
    (μ : Measure ℝ) {epsilon : ℝ} (hwidth : μ.real Set.univ < epsilon) :
    ∃ cardinality, Nonempty (SuppliedERealHalfLineGrid μ epsilon cardinality) :=
  ⟨1, ⟨singleCell μ hwidth⟩⟩

/--
A supplied extended-real grid yields an explicit-cardinality finite `L1(P)`
bracket cover for the real half-line indicator class.
-/
noncomputable def toFiniteL1BracketCoverAtCard
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedERealHalfLineGrid μ epsilon cardinality) :
    FiniteL1BracketCoverAtCard μ Set.univ realHalfLineIndicator
      epsilon cardinality where
  bracket := fun bracketIndex =>
    eRealHalfLineBracket (grid.left bracketIndex) (grid.right bracketIndex)
  bracketOf := fun c _ => grid.bracketOf c
  mem_bracket := by
    intro c _hc
    exact
      eRealHalfLineBracket_mem_realIndicator_of_le_lt
        (grid.left_le_index c) (grid.index_lt_right c)
  width_lt := by
    intro bracketIndex
    dsimp [IsL1EpsilonBracket, l1BracketWidth]
    rw [eRealHalfLineBracket_l1Width_eq_measureReal_openCell μ
      (grid.left_lt_right bracketIndex)]
    exact grid.cell_width_lt bracketIndex
  lower_integrable := by
    intro bracketIndex
    exact integrable_eRealClosedHalfLineIndicator μ (grid.left bracketIndex)
  upper_integrable := by
    intro bracketIndex
    exact integrable_eRealOpenHalfLineIndicator μ (grid.right bracketIndex)
  function_integrable := by
    intro c _hc
    exact integrable_realHalfLineIndicator μ c

/--
A supplied extended-real grid proves finiteness of the primitive local
`L1(P)` bracketing-number witness.
-/
theorem hasFiniteL1BracketingNumber
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedERealHalfLineGrid μ epsilon cardinality) :
    HasFiniteL1BracketingNumber μ Set.univ realHalfLineIndicator epsilon := by
  exact ⟨cardinality, ⟨grid.toFiniteL1BracketCoverAtCard⟩⟩

/--
A supplied extended-real grid makes the numeric primitive bracketing number
finite.
-/
theorem l1BracketingNumber_lt_top
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cardinality : ℕ}
    (grid : SuppliedERealHalfLineGrid μ epsilon cardinality) :
    l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ :=
  l1BracketingNumber_lt_top_of_hasFinite grid.hasFiniteL1BracketingNumber

end SuppliedERealHalfLineGrid

namespace SuppliedERealHalfLineEndpointGrid

/--
A supplied adjacent-endpoint grid proves finiteness of the primitive local
`L1(P)` bracketing-number witness.
-/
theorem hasFiniteL1BracketingNumber
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cellCount : ℕ}
    (grid : SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) :
    HasFiniteL1BracketingNumber μ Set.univ realHalfLineIndicator epsilon :=
  grid.toSuppliedERealHalfLineGrid.hasFiniteL1BracketingNumber

/--
A supplied adjacent-endpoint grid makes the numeric primitive bracketing number
finite.
-/
theorem l1BracketingNumber_lt_top
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} {cellCount : ℕ}
    (grid : SuppliedERealHalfLineEndpointGrid μ epsilon cellCount) :
    l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ :=
  grid.toSuppliedERealHalfLineGrid.l1BracketingNumber_lt_top

/--
If the requested radius exceeds the total mass, the half-line class has finite
primitive `L1(P)` bracketing number via the one-cell endpoint grid.
-/
theorem l1BracketingNumber_lt_top_of_measureReal_univ_lt
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} (hwidth : μ.real Set.univ < epsilon) :
    l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ :=
  (singleCell μ hwidth).l1BracketingNumber_lt_top

/--
Three real cutpoints satisfying the lower-tail, middle-cell, and upper-tail
width bounds give finite primitive `L1(P)` bracketing number.
-/
theorem l1BracketingNumber_lt_top_of_threeCell
    {μ : Measure ℝ} [IsFiniteMeasure μ] {epsilon a b : ℝ}
    (hab : a < b)
    (hleft : μ.real (Set.Iio a) < epsilon)
    (hmiddle : μ.real (Set.Ioo a b) < epsilon)
    (hright : μ.real (Set.Ioi b) < epsilon) :
    l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ :=
  (threeCell μ hab hleft hmiddle hright).l1BracketingNumber_lt_top

/--
Uniform supplied adjacent-endpoint grids yield the primitive bracketing-number
hypothesis needed by VdV&W Theorem 2.4.1.
-/
theorem l1BracketingNumber_lt_top_forall
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    (endpointGridExists :
      ∀ epsilon, 0 < epsilon ->
        ∃ cellCount, Nonempty (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)) :
    ∀ epsilon, 0 < epsilon ->
      l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ := by
  intro epsilon hepsilon
  rcases endpointGridExists epsilon hepsilon with ⟨cellCount, gridNonempty⟩
  exact gridNonempty.elim fun grid => grid.l1BracketingNumber_lt_top

/--
Uniform supplied adjacent-endpoint grids yield uniform supplied primitive grids.
-/
theorem exists_suppliedERealHalfLineGrid_of_forall
    {μ : Measure ℝ}
    (endpointGridExists :
      ∀ epsilon, 0 < epsilon ->
        ∃ cellCount, Nonempty (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)) :
    ∀ epsilon, 0 < epsilon ->
      ∃ cardinality, Nonempty (SuppliedERealHalfLineGrid μ epsilon cardinality) := by
  intro epsilon hepsilon
  rcases endpointGridExists epsilon hepsilon with ⟨cellCount, gridNonempty⟩
  exact ⟨cellCount, gridNonempty.map fun grid => grid.toSuppliedERealHalfLineGrid⟩

end SuppliedERealHalfLineEndpointGrid

namespace SuppliedERealHalfLineGrid

/--
If the requested radius exceeds the total mass, the half-line class has finite
primitive `L1(P)` bracketing number at that radius.
-/
theorem l1BracketingNumber_lt_top_of_measureReal_univ_lt
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    {epsilon : ℝ} (hwidth : μ.real Set.univ < epsilon) :
    l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ :=
  (singleCell μ hwidth).l1BracketingNumber_lt_top

/--
Uniform finite-grid existence at every positive radius yields the primitive
bracketing-number hypothesis needed by VdV&W Theorem 2.4.1.
-/
theorem l1BracketingNumber_lt_top_forall
    {μ : Measure ℝ} [IsFiniteMeasure μ]
    (gridExists :
      ∀ epsilon, 0 < epsilon ->
        ∃ cardinality, Nonempty (SuppliedERealHalfLineGrid μ epsilon cardinality)) :
    ∀ epsilon, 0 < epsilon ->
      l1BracketingNumber μ Set.univ realHalfLineIndicator epsilon < ⊤ := by
  intro epsilon hepsilon
  rcases gridExists epsilon hepsilon with ⟨cardinality, gridNonempty⟩
  exact gridNonempty.elim fun grid => grid.l1BracketingNumber_lt_top

end SuppliedERealHalfLineGrid

end StatInference
