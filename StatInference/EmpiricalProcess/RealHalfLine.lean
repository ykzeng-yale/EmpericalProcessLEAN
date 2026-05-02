import StatInference.EmpiricalProcess.BracketingPrimitive
import Mathlib.Data.EReal.Basic
import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.Topology.Instances.EReal.Lemmas

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

namespace SuppliedERealHalfLineGrid

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

end StatInference
