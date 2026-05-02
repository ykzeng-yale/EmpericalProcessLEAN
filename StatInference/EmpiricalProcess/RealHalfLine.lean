import StatInference.EmpiricalProcess.BracketingPrimitive
import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.MeasureTheory.Integral.Bochner.Set

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

end StatInference
