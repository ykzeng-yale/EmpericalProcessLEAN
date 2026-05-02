import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Group.Arithmetic
import Mathlib.MeasureTheory.Measure.NullMeasurable

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

open MeasureTheory
open scoped BigOperators

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

end StatInference
