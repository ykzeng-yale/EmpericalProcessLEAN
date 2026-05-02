import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Group.Arithmetic
import Mathlib.MeasureTheory.Measure.NullMeasurable
import Mathlib.Topology.Order.OrderClosed

/-!
# `P`-measurable classes

This module records the VdV&W Definition 2.3.3 measurability primitive.

The textbook definition asks that, for every finite sample size `n` and every
weight vector `e : Fin n -> ℝ`, the sample map

`x ↦ ⨆ f ∈ F |∑ i, e i * f (x i)|`

is measurable on the completion of the finite product probability space.  In
mathlib this completion-measurability condition is expressed as
`NullMeasurable` with respect to the product measure.
-/

namespace StatInference

open MeasureTheory Filter
open scoped BigOperators Topology

universe u v

/-- Finite product measure `P^n` on `n` sample coordinates. -/
noncomputable def vdVWProductMeasure {Observation : Type u}
    [MeasurableSpace Observation] (P : Measure Observation) (n : ℕ) :
    Measure (Fin n -> Observation) :=
  Measure.pi fun _ : Fin n => P

/-- The weighted finite sample sum appearing in VdV&W display `(2.3.2)`. -/
noncomputable def vdVWWeightedSampleSum {Observation : Type u} {Index : Type v}
    (classFun : Index -> Observation -> ℝ) {n : ℕ}
    (weights : Fin n -> ℝ) (index : Index)
    (sample : Fin n -> Observation) : ℝ :=
  ∑ i : Fin n, weights i * classFun index (sample i)

/--
The supremum over a class in VdV&W display `(2.3.2)`.

For an empty class this follows mathlib's complete-lattice convention for
`⨆ i ∈ ∅, ...`; theorem statements using nonempty classes can add that
hypothesis separately.
-/
noncomputable def vdVWWeightedClassSupremum
    {Observation : Type u} {Index : Type v}
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation) : ℝ :=
  ⨆ index, ⨆ (_ : index ∈ indexClass),
    |vdVWWeightedSampleSum classFun weights index sample|

/--
The value set whose supremum is represented by
`vdVWWeightedClassSupremum`.  This set-level form makes boundedness and
subset arguments explicit, avoiding hidden `ℝ` supremum fallback conventions.
-/
def vdVWWeightedClassValueSet
    {Observation : Type u} {Index : Type v}
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation) : Set ℝ :=
  {value | ∃ index, index ∈ indexClass ∧
    value = |vdVWWeightedSampleSum classFun weights index sample|}

/-- A class member contributes its absolute weighted sum to the value set. -/
theorem abs_vdVWWeightedSampleSum_mem_valueSet
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation) {index : Index}
    (hindex : index ∈ indexClass) :
    |vdVWWeightedSampleSum classFun weights index sample| ∈
      vdVWWeightedClassValueSet indexClass classFun weights sample :=
  ⟨index, hindex, rfl⟩

/-- Value sets are monotone under subclass inclusion. -/
theorem vdVWWeightedClassValueSet_mono
    {Observation : Type u} {Index : Type v}
    {smaller larger : Set Index} {classFun : Index -> Observation -> ℝ}
    (hsubset : smaller ⊆ larger)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation) :
    vdVWWeightedClassValueSet smaller classFun weights sample ⊆
      vdVWWeightedClassValueSet larger classFun weights sample := by
  intro value hvalue
  rcases hvalue with ⟨index, hindex, rfl⟩
  exact abs_vdVWWeightedSampleSum_mem_valueSet weights sample (hsubset hindex)

/-- Weighted class suprema are nonnegative, including mathlib's empty-class case. -/
theorem vdVWWeightedClassSupremum_nonneg
    {Observation : Type u} {Index : Type v}
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation) :
    0 ≤ vdVWWeightedClassSupremum indexClass classFun weights sample := by
  unfold vdVWWeightedClassSupremum
  exact Real.iSup_nonneg fun index =>
    Real.iSup_nonneg fun _ : index ∈ indexClass =>
      abs_nonneg (vdVWWeightedSampleSum classFun weights index sample)

/--
A bounded weighted value set bounds the corresponding inner supremum range
used by `vdVWWeightedClassSupremum`.
-/
theorem bddAbove_vdVWWeightedClassSupremum_range_of_valueSet
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation)
    (hbdd :
      BddAbove (vdVWWeightedClassValueSet indexClass classFun weights sample)) :
    BddAbove
      (Set.range fun candidate : Index =>
        ⨆ (_ : candidate ∈ indexClass),
          |vdVWWeightedSampleSum classFun weights candidate sample|) := by
  rcases hbdd with ⟨upper, hupper⟩
  refine ⟨max upper 0, ?_⟩
  intro value hvalue
  rcases hvalue with ⟨index, rfl⟩
  apply Real.iSup_le
  · intro hindex
    exact le_trans
      (hupper
        (abs_vdVWWeightedSampleSum_mem_valueSet weights sample hindex))
      (le_max_left upper 0)
  · exact le_max_right upper 0

/-- Coordinate measurability of all functions in a class. -/
def VdVWClassCoordinateMeasurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ) : Prop :=
  ∀ index, index ∈ indexClass -> Measurable (classFun index)

/--
VdV&W Definition 2.3.3: a class is `P`-measurable if every weighted finite
supremum display `(2.3.2)` is measurable on the completion of `P^n`.
-/
def VdVWPMeasurableClass
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    (P : Measure Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) : Prop :=
  ∀ (n : ℕ) (weights : Fin n -> ℝ),
    NullMeasurable
      (fun sample : Fin n -> Observation =>
        vdVWWeightedClassSupremum indexClass classFun weights sample)
      (vdVWProductMeasure P n)

/-- Fixed-index weighted sample sums are measurable under coordinate measurability. -/
theorem measurable_vdVWWeightedSampleSum
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {classFun : Index -> Observation -> ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) {index : Index}
    (hmeas : Measurable (classFun index)) :
    Measurable
      (fun sample : Fin n -> Observation =>
        vdVWWeightedSampleSum classFun weights index sample) := by
  unfold vdVWWeightedSampleSum
  exact Finset.measurable_fun_sum Finset.univ fun i _hi =>
    ((hmeas.comp (measurable_pi_apply i)).const_mul (weights i))

/-- Fixed-index absolute weighted sample sums are measurable. -/
theorem measurable_abs_vdVWWeightedSampleSum
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {classFun : Index -> Observation -> ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) {index : Index}
    (hmeas : Measurable (classFun index)) :
    Measurable
      (fun sample : Fin n -> Observation =>
        |vdVWWeightedSampleSum classFun weights index sample|) := by
  exact continuous_abs.measurable.comp
    (measurable_vdVWWeightedSampleSum weights hmeas)

/--
Pointwise convergence of class functions implies convergence of every finite
weighted sample sum.
-/
theorem tendsto_vdVWWeightedSampleSum_of_pointwise
    {Observation : Type u} {Index : Type v}
    {classFun : Index -> Observation -> ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) (sample : Fin n -> Observation)
    {approx : ℕ -> Index} {index : Index}
    (hlim :
      ∀ x : Observation,
        Tendsto (fun m => classFun (approx m) x) atTop
          (𝓝 (classFun index x))) :
    Tendsto
      (fun m => vdVWWeightedSampleSum classFun weights (approx m) sample)
      atTop
      (𝓝 (vdVWWeightedSampleSum classFun weights index sample)) := by
  simpa [vdVWWeightedSampleSum] using
    tendsto_finsetSum Finset.univ fun i _hi =>
      (hlim (sample i)).const_mul (weights i)

/-- Absolute-value version of `tendsto_vdVWWeightedSampleSum_of_pointwise`. -/
theorem tendsto_abs_vdVWWeightedSampleSum_of_pointwise
    {Observation : Type u} {Index : Type v}
    {classFun : Index -> Observation -> ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) (sample : Fin n -> Observation)
    {approx : ℕ -> Index} {index : Index}
    (hlim :
      ∀ x : Observation,
        Tendsto (fun m => classFun (approx m) x) atTop
          (𝓝 (classFun index x))) :
    Tendsto
      (fun m => |vdVWWeightedSampleSum classFun weights (approx m) sample|)
      atTop
      (𝓝 |vdVWWeightedSampleSum classFun weights index sample|) :=
  continuous_abs.tendsto _ |>.comp
    (tendsto_vdVWWeightedSampleSum_of_pointwise weights sample hlim)

/--
The finite weighted term for a pointwise limit lies below the weighted
supremum over the approximating subclass.
-/
theorem abs_vdVWWeightedSampleSum_le_classSupremum_of_pointwise
    {Observation : Type u} {Index : Type v}
    {classFun : Index -> Observation -> ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) (sample : Fin n -> Observation)
    {subclass : Set Index} {approx : ℕ -> Index} {index : Index}
    (hbounded :
      BddAbove
        (Set.range fun candidate : Index =>
          ⨆ (_ : candidate ∈ subclass),
            |vdVWWeightedSampleSum classFun weights candidate sample|))
    (hmem : ∀ m, approx m ∈ subclass)
    (hlim :
      ∀ x : Observation,
        Tendsto (fun m => classFun (approx m) x) atTop
          (𝓝 (classFun index x))) :
    |vdVWWeightedSampleSum classFun weights index sample| ≤
      vdVWWeightedClassSupremum subclass classFun weights sample := by
  apply le_of_tendsto'
    (tendsto_abs_vdVWWeightedSampleSum_of_pointwise weights sample hlim)
  intro m
  unfold vdVWWeightedClassSupremum
  refine le_ciSup_of_le hbounded (approx m) ?_
  simp [ciSup_pos (hmem m)]

/--
Weighted class suprema are monotone under class inclusion once the larger
class has a bounded inner-supremum range.
-/
theorem vdVWWeightedClassSupremum_le_of_subset_of_bddAbove
    {Observation : Type u} {Index : Type v}
    {smaller larger : Set Index} {classFun : Index -> Observation -> ℝ}
    (hsubset : smaller ⊆ larger)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation)
    (hbounded :
      BddAbove
        (Set.range fun candidate : Index =>
          ⨆ (_ : candidate ∈ larger),
            |vdVWWeightedSampleSum classFun weights candidate sample|)) :
    vdVWWeightedClassSupremum smaller classFun weights sample ≤
      vdVWWeightedClassSupremum larger classFun weights sample := by
  have hnonneg :
      0 ≤ vdVWWeightedClassSupremum larger classFun weights sample :=
    vdVWWeightedClassSupremum_nonneg larger classFun weights sample
  unfold vdVWWeightedClassSupremum
  apply Real.iSup_le
  · intro index
    apply Real.iSup_le
    · intro hsmall
      refine le_ciSup_of_le hbounded index ?_
      have hbddInner :
          BddAbove
            (Set.range fun _ : index ∈ larger =>
              |vdVWWeightedSampleSum classFun weights index sample|) := by
        exact ⟨|vdVWWeightedSampleSum classFun weights index sample|, by
          intro value hvalue
          rcases hvalue with ⟨_, rfl⟩
          rfl⟩
      exact le_ciSup_of_le hbddInner (hsubset hsmall) le_rfl
    · exact hnonneg
  · exact hnonneg

/--
A pointwise limit term is below every upper bound for the approximating
subclass value set.
-/
theorem abs_vdVWWeightedSampleSum_le_of_pointwise_of_valueSet_upperBound
    {Observation : Type u} {Index : Type v}
    {classFun : Index -> Observation -> ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) (sample : Fin n -> Observation)
    {subclass : Set Index} {approx : ℕ -> Index} {index : Index}
    {upper : ℝ}
    (hupper :
      ∀ value ∈ vdVWWeightedClassValueSet subclass classFun weights sample,
        value ≤ upper)
    (hmem : ∀ m, approx m ∈ subclass)
    (hlim :
      ∀ x : Observation,
        Tendsto (fun m => classFun (approx m) x) atTop
          (𝓝 (classFun index x))) :
    |vdVWWeightedSampleSum classFun weights index sample| ≤ upper := by
  apply le_of_tendsto'
    (tendsto_abs_vdVWWeightedSampleSum_of_pointwise weights sample hlim)
  intro m
  exact hupper _
    (abs_vdVWWeightedSampleSum_mem_valueSet weights sample (hmem m))

/--
A countable coordinate-measurable class is `P`-measurable.

This is the Lean counterpart of the standard pointwise-measurable/countable
route used to discharge Definition 2.3.3 in concrete empirical-process
applications.
-/
theorem VdVWPMeasurableClass.of_countable_of_measurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (hcount : indexClass.Countable)
    (hmeas : VdVWClassCoordinateMeasurable indexClass classFun) :
    VdVWPMeasurableClass P indexClass classFun := by
  intro n weights
  exact
    (Measurable.biSup indexClass hcount fun index hindex =>
      measurable_abs_vdVWWeightedSampleSum weights (hmeas index hindex)
    ).nullMeasurable

/--
Proof-carrying form of the separability handoff used after VdV&W
Example 2.3.4.

The subclass is countable and gives the same weighted suprema `(2.3.2)` as
the original class.  The separate pointwise-dense hypothesis of the textbook
can be promoted to this equality in a later exact Example 2.3.4 theorem.
-/
structure VdVWPointwiseSupremumSeparable
    {Observation : Type u} {Index : Type v}
    (indexClass subclass : Set Index)
    (classFun : Index -> Observation -> ℝ) : Prop where
  subset : subclass ⊆ indexClass
  countable : subclass.Countable
  supremum_eq :
    ∀ (n : ℕ) (weights : Fin n -> ℝ)
      (sample : Fin n -> Observation),
      vdVWWeightedClassSupremum indexClass classFun weights sample =
        vdVWWeightedClassSupremum subclass classFun weights sample

/--
Literal pointwise-dense countable-subclass hypothesis from VdV&W
Example 2.3.4.

This is intentionally kept separate from `VdVWPointwiseSupremumSeparable`.
The hard analytic bridge still to promote is that this pointwise convergence
hypothesis preserves every finite weighted supremum `(2.3.2)`.
-/
structure VdVWPointwiseApproximableByCountableSubclass
    {Observation : Type u} {Index : Type v}
    (indexClass subclass : Set Index)
    (classFun : Index -> Observation -> ℝ) : Prop where
  subset : subclass ⊆ indexClass
  countable : subclass.Countable
  approximates :
    ∀ index, index ∈ indexClass ->
      ∃ approx : ℕ -> Index,
        (∀ m, approx m ∈ subclass) ∧
          ∀ x : Observation,
            Tendsto (fun m => classFun (approx m) x) atTop
              (𝓝 (classFun index x))

/--
Pointwise approximability transfers boundedness of the weighted value set from
the countable subclass to the original class.
-/
theorem bddAbove_vdVWWeightedClassValueSet_of_pointwiseApproximable
    {Observation : Type u} {Index : Type v}
    {indexClass subclass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (happrox :
      VdVWPointwiseApproximableByCountableSubclass
        indexClass subclass classFun)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation)
    (hbdd :
      BddAbove (vdVWWeightedClassValueSet subclass classFun weights sample)) :
    BddAbove (vdVWWeightedClassValueSet indexClass classFun weights sample) := by
  rcases hbdd with ⟨upper, hupper⟩
  refine ⟨upper, ?_⟩
  intro value hvalue
  rcases hvalue with ⟨index, hindex, rfl⟩
  rcases happrox.approximates index hindex with ⟨approx, hmem, hlim⟩
  exact
    abs_vdVWWeightedSampleSum_le_of_pointwise_of_valueSet_upperBound
      weights sample hupper hmem hlim

/--
Pointwise approximability gives the reverse supremum inequality whenever the
approximating subclass has a bounded inner-supremum range.
-/
theorem vdVWWeightedClassSupremum_le_of_pointwiseApproximable_of_bddAbove
    {Observation : Type u} {Index : Type v}
    {indexClass subclass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (happrox :
      VdVWPointwiseApproximableByCountableSubclass
        indexClass subclass classFun)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation)
    (hbounded :
      BddAbove
        (Set.range fun candidate : Index =>
          ⨆ (_ : candidate ∈ subclass),
            |vdVWWeightedSampleSum classFun weights candidate sample|)) :
    vdVWWeightedClassSupremum indexClass classFun weights sample ≤
      vdVWWeightedClassSupremum subclass classFun weights sample := by
  have hnonneg :
      0 ≤ vdVWWeightedClassSupremum subclass classFun weights sample :=
    vdVWWeightedClassSupremum_nonneg subclass classFun weights sample
  unfold vdVWWeightedClassSupremum
  apply Real.iSup_le
  · intro index
    apply Real.iSup_le
    · intro hindex
      rcases happrox.approximates index hindex with ⟨approx, hmem, hlim⟩
      exact
        abs_vdVWWeightedSampleSum_le_classSupremum_of_pointwise
          weights sample hbounded hmem hlim
    · exact hnonneg
  · exact hnonneg

/--
Bounded pointwise approximability identifies one finite weighted supremum over
the original class with the supremum over the countable subclass.
-/
theorem vdVWWeightedClassSupremum_eq_of_pointwiseApproximable_of_bddAbove
    {Observation : Type u} {Index : Type v}
    {indexClass subclass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (happrox :
      VdVWPointwiseApproximableByCountableSubclass
        indexClass subclass classFun)
    {n : ℕ} (weights : Fin n -> ℝ)
    (sample : Fin n -> Observation)
    (hbdd :
      BddAbove (vdVWWeightedClassValueSet subclass classFun weights sample)) :
    vdVWWeightedClassSupremum indexClass classFun weights sample =
      vdVWWeightedClassSupremum subclass classFun weights sample := by
  apply le_antisymm
  · have hboundedSubclass :
        BddAbove
          (Set.range fun candidate : Index =>
            ⨆ (_ : candidate ∈ subclass),
              |vdVWWeightedSampleSum classFun weights candidate sample|) :=
      bddAbove_vdVWWeightedClassSupremum_range_of_valueSet
        weights sample hbdd
    exact
      vdVWWeightedClassSupremum_le_of_pointwiseApproximable_of_bddAbove
        happrox weights sample hboundedSubclass
  · have hbddIndex :
        BddAbove
          (vdVWWeightedClassValueSet indexClass classFun weights sample) :=
      bddAbove_vdVWWeightedClassValueSet_of_pointwiseApproximable
        happrox weights sample hbdd
    have hboundedIndex :
        BddAbove
          (Set.range fun candidate : Index =>
            ⨆ (_ : candidate ∈ indexClass),
              |vdVWWeightedSampleSum classFun weights candidate sample|) :=
      bddAbove_vdVWWeightedClassSupremum_range_of_valueSet
        weights sample hbddIndex
    exact
      vdVWWeightedClassSupremum_le_of_subset_of_bddAbove
        happrox.subset weights sample hboundedIndex

/--
Bounded pointwise approximability is a proof-carrying route from the literal
Example 2.3.4 pointwise approximation hypothesis to equality of all finite
weighted suprema `(2.3.2)`.

The extra boundedness hypothesis is explicit because the current Lean
realization uses real-valued conditional suprema.
-/
theorem VdVWPointwiseApproximableByCountableSubclass.to_pointwiseSupremumSeparable_of_bddAbove
    {Observation : Type u} {Index : Type v}
    {indexClass subclass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (happrox :
      VdVWPointwiseApproximableByCountableSubclass
        indexClass subclass classFun)
    (hbdd :
      ∀ (n : ℕ) (weights : Fin n -> ℝ)
        (sample : Fin n -> Observation),
        BddAbove (vdVWWeightedClassValueSet subclass classFun weights sample)) :
    VdVWPointwiseSupremumSeparable indexClass subclass classFun where
  subset := happrox.subset
  countable := happrox.countable
  supremum_eq := by
    intro n weights sample
    exact
      vdVWWeightedClassSupremum_eq_of_pointwiseApproximable_of_bddAbove
        happrox weights sample (hbdd n weights sample)

/--
If the weighted supremum over a class is realized by a countable measurable
subclass, then the original class is `P`-measurable.

This is the formal handoff behind the sentence after Example 2.3.4: once the
supremum over `F` equals the supremum over `G`, measurability follows from the
countable subclass.
-/
theorem VdVWPMeasurableClass.of_pointwiseSupremumSeparable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} {indexClass subclass : Set Index}
    {classFun : Index -> Observation -> ℝ}
    (hsep : VdVWPointwiseSupremumSeparable indexClass subclass classFun)
    (hmeas : VdVWClassCoordinateMeasurable subclass classFun) :
    VdVWPMeasurableClass P indexClass classFun := by
  intro n weights
  have hsub :
      NullMeasurable
        (fun sample : Fin n -> Observation =>
          vdVWWeightedClassSupremum subclass classFun weights sample)
        (vdVWProductMeasure P n) :=
    VdVWPMeasurableClass.of_countable_of_measurable
      hsep.countable hmeas n weights
  have hfun :
      (fun sample : Fin n -> Observation =>
        vdVWWeightedClassSupremum indexClass classFun weights sample) =
      (fun sample : Fin n -> Observation =>
        vdVWWeightedClassSupremum subclass classFun weights sample) :=
    funext fun sample => hsep.supremum_eq n weights sample
  simpa [hfun] using hsub

end StatInference
