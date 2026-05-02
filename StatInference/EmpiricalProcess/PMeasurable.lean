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
