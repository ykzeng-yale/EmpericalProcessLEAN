import Mathlib.Topology.MetricSpace.CoveringNumbers

/-!
# Primitive covering numbers

This module records the VdV&W Definition 2.1.5 covering-number layer using the
pinned mathlib covering-number API.

Mathlib's `Metric.externalCoveringNumber` is the closest existing primitive to
the textbook convention: the cover centers live in the ambient space and need
not belong to the target class.  Mathlib uses closed extended-metric balls
(`edist x y ≤ ε`).  Textbook displays often use open norm balls
(`‖x - y‖ < ε`), so exact textbook statements can insert the usual slack in
the radius when that distinction matters.
-/

namespace StatInference

open EMetric Metric Set
open scoped ENNReal NNReal

universe u

/--
VdV&W-style external covering number.

For a target set `target` in a pseudo-emetric ambient space, this is the
minimal cardinality, in `ℕ∞`, of a cover by closed balls of radius `epsilon`.
The centers are arbitrary ambient points, matching the textbook convention that
centers need not belong to the class being covered.
-/
noncomputable def vdVWCoveringNumber {Space : Type u} [PseudoEMetricSpace Space]
    (epsilon : ℝ≥0) (target : Set Space) : ℕ∞ :=
  Metric.externalCoveringNumber epsilon target

/-- A finite closed-ball cover with an explicit cardinality. -/
structure FiniteMetricCoverAtCard {Space : Type u} [PseudoEMetricSpace Space]
    (target : Set Space) (epsilon : ℝ≥0) (cardinality : ℕ) where
  center : Fin cardinality -> Space
  centerOf : ∀ x, x ∈ target -> Fin cardinality
  edist_le :
    ∀ x hx,
      edist x (center (centerOf x hx)) ≤ epsilon

namespace FiniteMetricCoverAtCard

/-- The finite set of centers supplied by an explicit-cardinality cover. -/
def centerSet {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) : Set Space :=
  Set.range cover.center

/-- The supplied center set is finite. -/
theorem finite_centerSet {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) :
    cover.centerSet.Finite :=
  Set.finite_range cover.center

/-- The supplied center set is a mathlib closed-ball cover. -/
theorem isCover_centerSet {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) :
    Metric.IsCover epsilon target cover.centerSet := by
  intro x hx
  exact ⟨cover.center (cover.centerOf x hx), ⟨cover.centerOf x hx, rfl⟩,
    cover.edist_le x hx⟩

/--
An explicit finite VdV&W cover makes the mathlib external covering number
finite.
-/
theorem vdVWCoveringNumber_lt_top {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  unfold vdVWCoveringNumber
  exact lt_of_le_of_lt
    (Metric.IsCover.externalCoveringNumber_le_encard cover.isCover_centerSet)
    cover.finite_centerSet.encard_lt_top

end FiniteMetricCoverAtCard

/--
Finite covering-number hypothesis in witness form: there exists a finite
closed-ball cover at the given radius.
-/
def HasFiniteMetricCover {Space : Type u} [PseudoEMetricSpace Space]
    (target : Set Space) (epsilon : ℝ≥0) : Prop :=
  ∃ cardinality : ℕ,
    Nonempty (FiniteMetricCoverAtCard target epsilon cardinality)

/-- A finite-cover witness makes the VdV&W covering number finite. -/
theorem vdVWCoveringNumber_lt_top_of_hasFiniteMetricCover
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0}
    (hfinite : HasFiniteMetricCover target epsilon) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  rcases hfinite with ⟨cardinality, hcover⟩
  exact hcover.elim fun cover => cover.vdVWCoveringNumber_lt_top

/-- A finite target set has finite VdV&W covering number at every radius. -/
theorem vdVWCoveringNumber_lt_top_of_finite
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} (epsilon : ℝ≥0)
    (htarget : target.Finite) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  unfold vdVWCoveringNumber
  exact lt_of_le_of_lt
    (Metric.externalCoveringNumber_le_encard_self target)
    htarget.encard_lt_top

/-- A totally bounded target has finite VdV&W covering number at every positive radius. -/
theorem vdVWCoveringNumber_lt_top_of_totallyBounded
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0}
    (hepsilon : epsilon ≠ 0) (htarget : TotallyBounded target) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  rcases Metric.exists_finite_isCover_of_totallyBounded hepsilon htarget with
    ⟨centers, _hcenters_subset, hcenters_finite, hcover⟩
  unfold vdVWCoveringNumber
  exact lt_of_le_of_lt
    (Metric.IsCover.externalCoveringNumber_le_encard hcover)
    hcenters_finite.encard_lt_top

/-- Larger radii cannot increase the external covering number. -/
theorem vdVWCoveringNumber_anti
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon delta : ℝ≥0}
    (h : epsilon ≤ delta) :
    vdVWCoveringNumber delta target ≤ vdVWCoveringNumber epsilon target := by
  exact Metric.externalCoveringNumber_anti h

/-- Covering a subset is no harder than covering the larger set. -/
theorem vdVWCoveringNumber_mono_set
    {Space : Type u} [PseudoEMetricSpace Space]
    {target larger : Set Space} {epsilon : ℝ≥0}
    (hsubset : target ⊆ larger) :
    vdVWCoveringNumber epsilon target ≤ vdVWCoveringNumber epsilon larger := by
  exact Metric.externalCoveringNumber_mono_set hsubset

/-- The external covering number is bounded by the internal mathlib covering number. -/
theorem vdVWCoveringNumber_le_internalCoveringNumber
    {Space : Type u} [PseudoEMetricSpace Space]
    (epsilon : ℝ≥0) (target : Set Space) :
    vdVWCoveringNumber epsilon target ≤ Metric.coveringNumber epsilon target := by
  exact Metric.externalCoveringNumber_le_coveringNumber epsilon target

/--
The packing number at doubled radius is bounded by the VdV&W external covering
number.  This is the first local bridge toward VdV&W Definition 2.2.3.
-/
theorem packingNumber_two_mul_le_vdVWCoveringNumber
    {Space : Type u} [PseudoEMetricSpace Space]
    (epsilon : ℝ≥0) (target : Set Space) :
    Metric.packingNumber (2 * epsilon) target ≤
      vdVWCoveringNumber epsilon target := by
  exact Metric.packingNumber_two_mul_le_externalCoveringNumber epsilon target

/-!
## Semimetric-space covering and packing numbers

VdV&W Definition 2.2.3 applies the same covering-number idea to an arbitrary
semimetric index space `(T, d)`, using all of `T` as the target.  In Lean we
represent the semimetric by a `PseudoEMetricSpace` instance and cover
`Set.univ`.
-/

/-- VdV&W semimetric covering number `N(epsilon, d)` for the whole index space. -/
noncomputable def vdVWSemimetricCoveringNumber
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) : ℕ∞ :=
  vdVWCoveringNumber epsilon (Set.univ : Set Space)

/-- VdV&W semimetric packing number `D(epsilon, d)` for the whole index space. -/
noncomputable def vdVWSemimetricPackingNumber
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) : ℕ∞ :=
  Metric.packingNumber epsilon (Set.univ : Set Space)

/-- A finite cover of the whole semimetric space at a fixed radius. -/
abbrev HasFiniteSemimetricCover
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) : Prop :=
  HasFiniteMetricCover (Set.univ : Set Space) epsilon

/-- A finite whole-space cover makes `N(epsilon, d)` finite. -/
theorem vdVWSemimetricCoveringNumber_lt_top_of_hasFiniteCover
    {Space : Type u} [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hfinite : HasFiniteSemimetricCover Space epsilon) :
    vdVWSemimetricCoveringNumber Space epsilon < ⊤ :=
  vdVWCoveringNumber_lt_top_of_hasFiniteMetricCover hfinite

/-- A finite type has finite semimetric covering number at every radius. -/
theorem vdVWSemimetricCoveringNumber_lt_top_of_finite
    (Space : Type u) [PseudoEMetricSpace Space] [Finite Space]
    (epsilon : ℝ≥0) :
    vdVWSemimetricCoveringNumber Space epsilon < ⊤ :=
  vdVWCoveringNumber_lt_top_of_finite epsilon (Set.toFinite Set.univ)

/-- A totally bounded semimetric space has finite covering number at every positive radius. -/
theorem vdVWSemimetricCoveringNumber_lt_top_of_totallyBounded
    (Space : Type u) [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hepsilon : epsilon ≠ 0)
    (hspace : TotallyBounded (Set.univ : Set Space)) :
    vdVWSemimetricCoveringNumber Space epsilon < ⊤ :=
  vdVWCoveringNumber_lt_top_of_totallyBounded hepsilon hspace

/--
VdV&W's first covering-packing comparison, in mathlib's closed-ball
convention: `N(epsilon, d) <= D(epsilon, d)`.
-/
theorem vdVWSemimetricCoveringNumber_le_packingNumber
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) :
    vdVWSemimetricCoveringNumber Space epsilon ≤
      vdVWSemimetricPackingNumber Space epsilon := by
  unfold vdVWSemimetricCoveringNumber vdVWSemimetricPackingNumber
  exact
    (Metric.externalCoveringNumber_le_coveringNumber epsilon
      (Set.univ : Set Space)).trans
      (Metric.coveringNumber_le_packingNumber epsilon (Set.univ : Set Space))

/--
VdV&W's second covering-packing comparison, in mathlib's closed-ball
convention: `D(epsilon, d) <= N(epsilon / 2, d)`.
-/
theorem vdVWSemimetricPackingNumber_le_coveringNumber_half
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) :
    vdVWSemimetricPackingNumber Space epsilon ≤
      vdVWSemimetricCoveringNumber Space (epsilon / 2) := by
  simpa [vdVWSemimetricPackingNumber, vdVWSemimetricCoveringNumber,
    vdVWCoveringNumber, show (2 : ℝ≥0) * (epsilon / 2) = epsilon by ring] using
    Metric.packingNumber_two_mul_le_externalCoveringNumber (epsilon / 2)
      (Set.univ : Set Space)

/--
Finiteness of the semimetric covering number at half radius implies finiteness
of the packing number at the original radius.
-/
theorem vdVWSemimetricPackingNumber_lt_top_of_coveringNumber_half_lt_top
    (Space : Type u) [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hcover :
      vdVWSemimetricCoveringNumber Space (epsilon / 2) < ⊤) :
    vdVWSemimetricPackingNumber Space epsilon < ⊤ :=
  lt_of_le_of_lt
    (vdVWSemimetricPackingNumber_le_coveringNumber_half Space epsilon)
    hcover

/--
If all positive-radius semimetric covering numbers are finite, then all
positive-radius semimetric packing numbers are finite.
-/
theorem vdVWSemimetricPackingNumber_lt_top_forall_of_coveringNumber_lt_top_forall
    (Space : Type u) [PseudoEMetricSpace Space]
    (hcover :
      ∀ epsilon : ℝ≥0, epsilon ≠ 0 ->
        vdVWSemimetricCoveringNumber Space epsilon < ⊤) :
    ∀ epsilon : ℝ≥0, epsilon ≠ 0 ->
      vdVWSemimetricPackingNumber Space epsilon < ⊤ := by
  intro epsilon hepsilon
  exact
    vdVWSemimetricPackingNumber_lt_top_of_coveringNumber_half_lt_top Space
      (hcover (epsilon / 2) (by positivity))

/-- A totally bounded semimetric space has finite packing number at every positive radius. -/
theorem vdVWSemimetricPackingNumber_lt_top_of_totallyBounded
    (Space : Type u) [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hepsilon : epsilon ≠ 0)
    (hspace : TotallyBounded (Set.univ : Set Space)) :
    vdVWSemimetricPackingNumber Space epsilon < ⊤ :=
  vdVWSemimetricPackingNumber_lt_top_of_coveringNumber_half_lt_top Space
    (vdVWSemimetricCoveringNumber_lt_top_of_totallyBounded Space
      (by positivity) hspace)

end StatInference
