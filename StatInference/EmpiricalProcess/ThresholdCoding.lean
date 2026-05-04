import Mathlib.Data.Fintype.BigOperators
import StatInference.EmpiricalProcess.TraceCoding
import StatInference.EmpiricalProcess.SubgraphTraceVC

/-!
# Finite threshold coding of empirical traces

This file packages the next structural step after fixed-threshold VC/Sauer
bounds.  A finite set of thresholds gives each real-valued empirical trace a
threshold signature.  If those signatures separate the realized traces, then
the real trace image is bounded by the finite set of realized threshold
signatures.
-/

namespace StatInference

open scoped BigOperators

/--
The finite-threshold signature of a fixed real empirical trace: for each
threshold, record the sample coordinates where the trace is above that
threshold.
-/
noncomputable def thresholdTraceCode {n : ℕ}
    (thresholds : Finset ℝ) (trace : Fin n -> ℝ) :
    {threshold // threshold ∈ thresholds} -> Finset (Fin n) :=
  fun threshold =>
    Finset.univ.filter fun sampleIndex : Fin n =>
      threshold.1 < trace sampleIndex

/--
The finite set of threshold signatures whose coordinates are realized by the
corresponding threshold-indicator classes.
-/
noncomputable def thresholdTraceCodeSet
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (thresholds : Finset ℝ) :
    Finset ({threshold // threshold ∈ thresholds} -> Finset (Fin n)) :=
  by
    classical
    exact
      Finset.univ.filter fun code =>
        ∀ threshold : {threshold // threshold ∈ thresholds},
          code threshold ∈
            empiricalBinaryTraceSetFamily sample indexClass
              (thresholdIndicatorClassFun classFun threshold.1)

/--
On an empirical trace, the finite-threshold signature agrees coordinatewise
with the binary trace set of the threshold-indicator class.
-/
theorem thresholdTraceCode_empiricalTrace_eq_binaryTraceSet
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ)
    (thresholds : Finset ℝ) (index : Index)
    (threshold : {threshold // threshold ∈ thresholds}) :
    thresholdTraceCode thresholds (empiricalTrace sample classFun index) threshold =
      empiricalBinaryTraceSet sample
        (thresholdIndicatorClassFun classFun threshold.1) index := by
  classical
  ext sampleIndex
  by_cases h : threshold.1 < classFun index (sample sampleIndex)
  · simp [thresholdTraceCode, empiricalTrace, empiricalBinaryTraceSet,
      thresholdIndicatorClassFun, h]
  · simp [thresholdTraceCode, empiricalTrace, empiricalBinaryTraceSet,
      thresholdIndicatorClassFun, h]

/--
Equality of finite-threshold signatures is exactly pointwise equality of all
threshold comparisons on the sample.
-/
theorem thresholdTraceCode_eq_iff_forall_threshold_sample
    {n : ℕ} {thresholds : Finset ℝ}
    {trace₁ trace₂ : Fin n -> ℝ} :
    thresholdTraceCode thresholds trace₁ = thresholdTraceCode thresholds trace₂ ↔
      ∀ threshold : {threshold // threshold ∈ thresholds},
        ∀ sampleIndex : Fin n,
          (threshold.1 < trace₁ sampleIndex ↔
            threshold.1 < trace₂ sampleIndex) := by
  classical
  constructor
  · intro hcode threshold sampleIndex
    have hset :
        thresholdTraceCode thresholds trace₁ threshold =
          thresholdTraceCode thresholds trace₂ threshold :=
      congrFun hcode threshold
    have hmem :
        sampleIndex ∈ thresholdTraceCode thresholds trace₁ threshold ↔
          sampleIndex ∈ thresholdTraceCode thresholds trace₂ threshold := by
      simpa using congrArg (fun s : Finset (Fin n) => sampleIndex ∈ s) hset
    simpa [thresholdTraceCode] using hmem
  · intro hpoint
    funext threshold
    ext sampleIndex
    simpa [thresholdTraceCode] using hpoint threshold sampleIndex

/--
Pointwise threshold-comparison separation is enough to supply the finite-code
separation hypothesis used by the threshold-cardinality handoffs.
-/
theorem thresholdTraceCode_separates_of_pointwise_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hpoint :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ sampleIndex : Fin n,
            ∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    ∀ index₁, index₁ ∈ indexClass ->
      ∀ index₂, index₂ ∈ indexClass ->
        (∀ threshold : {threshold // threshold ∈ thresholds},
          thresholdTraceCode thresholds
              (empiricalTrace sample classFun index₁) threshold =
            thresholdTraceCode thresholds
              (empiricalTrace sample classFun index₂) threshold) ->
        empiricalTrace sample classFun index₁ =
          empiricalTrace sample classFun index₂ := by
  intro index₁ hindex₁ index₂ hindex₂ hcode
  apply hpoint index₁ hindex₁ index₂ hindex₂
  intro sampleIndex threshold
  have hcodeFun :
      thresholdTraceCode thresholds (empiricalTrace sample classFun index₁) =
        thresholdTraceCode thresholds (empiricalTrace sample classFun index₂) := by
    funext threshold
    exact hcode threshold
  have hpointCode :=
    (thresholdTraceCode_eq_iff_forall_threshold_sample.mp hcodeFun)
      threshold sampleIndex
  simpa [empiricalTrace] using hpointCode

/--
A coordinatewise threshold-separation criterion supplies the pointwise
threshold-separation hypothesis.  This is the local shape expected from
geometric arguments: at every sample coordinate, matching all threshold
predicates forces equality of the two realized real values.
-/
theorem pointwise_thresholds_separate_of_coordinate_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hcoordinate :
      ∀ sampleIndex : Fin n,
        ∀ index₁, index₁ ∈ indexClass ->
          ∀ index₂, index₂ ∈ indexClass ->
            (∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
            classFun index₁ (sample sampleIndex) =
              classFun index₂ (sample sampleIndex)) :
    ∀ index₁, index₁ ∈ indexClass ->
      ∀ index₂, index₂ ∈ indexClass ->
        (∀ sampleIndex : Fin n,
          ∀ threshold : {threshold // threshold ∈ thresholds},
            (threshold.1 < classFun index₁ (sample sampleIndex) ↔
              threshold.1 < classFun index₂ (sample sampleIndex))) ->
        empiricalTrace sample classFun index₁ =
          empiricalTrace sample classFun index₂ := by
  intro index₁ hindex₁ index₂ hindex₂ hthresholds
  funext sampleIndex
  simpa [empiricalTrace] using
    hcoordinate sampleIndex index₁ hindex₁ index₂ hindex₂
      (hthresholds sampleIndex)

/--
Coordinatewise threshold separation supplies the finite-code separation
hypothesis used by the threshold-cardinality handoffs.
-/
theorem thresholdTraceCode_separates_of_coordinate_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hcoordinate :
      ∀ sampleIndex : Fin n,
        ∀ index₁, index₁ ∈ indexClass ->
          ∀ index₂, index₂ ∈ indexClass ->
            (∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
            classFun index₁ (sample sampleIndex) =
              classFun index₂ (sample sampleIndex)) :
    ∀ index₁, index₁ ∈ indexClass ->
      ∀ index₂, index₂ ∈ indexClass ->
        (∀ threshold : {threshold // threshold ∈ thresholds},
          thresholdTraceCode thresholds
              (empiricalTrace sample classFun index₁) threshold =
            thresholdTraceCode thresholds
              (empiricalTrace sample classFun index₂) threshold) ->
        empiricalTrace sample classFun index₁ =
          empiricalTrace sample classFun index₂ := by
  exact
    thresholdTraceCode_separates_of_pointwise_thresholds_separate
      (pointwise_thresholds_separate_of_coordinate_thresholds_separate hcoordinate)

/--
If the finite threshold set contains every realized value at every sample
coordinate, then it separates those coordinate values: taking the threshold to
be one of the two candidate values rules out strict inequality in either
direction.
-/
theorem coordinate_thresholds_separate_of_values_mem_thresholds
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hvalues :
      ∀ sampleIndex : Fin n,
        ∀ index, index ∈ indexClass ->
          classFun index (sample sampleIndex) ∈ thresholds) :
    ∀ sampleIndex : Fin n,
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            (threshold.1 < classFun index₁ (sample sampleIndex) ↔
              threshold.1 < classFun index₂ (sample sampleIndex))) ->
          classFun index₁ (sample sampleIndex) =
            classFun index₂ (sample sampleIndex) := by
  intro sampleIndex index₁ hindex₁ index₂ hindex₂ hthresholds
  let value₁ : ℝ := classFun index₁ (sample sampleIndex)
  let value₂ : ℝ := classFun index₂ (sample sampleIndex)
  have hvalue₁_mem : value₁ ∈ thresholds := hvalues sampleIndex index₁ hindex₁
  have hvalue₂_mem : value₂ ∈ thresholds := hvalues sampleIndex index₂ hindex₂
  have hnot_value₁_lt_value₂ : ¬ value₁ < value₂ := by
    intro hlt
    have hiff := hthresholds ⟨value₁, hvalue₁_mem⟩
    exact (lt_irrefl value₁) (hiff.mpr hlt)
  have hnot_value₂_lt_value₁ : ¬ value₂ < value₁ := by
    intro hlt
    have hiff := hthresholds ⟨value₂, hvalue₂_mem⟩
    exact (lt_irrefl value₂) (hiff.mp hlt)
  exact
    le_antisymm (le_of_not_gt hnot_value₂_lt_value₁)
      (le_of_not_gt hnot_value₁_lt_value₂)

/--
When all realized sample-coordinate values lie in the threshold set, finite
threshold signatures separate realized empirical traces.
-/
theorem thresholdTraceCode_separates_of_values_mem_thresholds
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hvalues :
      ∀ sampleIndex : Fin n,
        ∀ index, index ∈ indexClass ->
          classFun index (sample sampleIndex) ∈ thresholds) :
    ∀ index₁, index₁ ∈ indexClass ->
      ∀ index₂, index₂ ∈ indexClass ->
        (∀ threshold : {threshold // threshold ∈ thresholds},
          thresholdTraceCode thresholds
              (empiricalTrace sample classFun index₁) threshold =
            thresholdTraceCode thresholds
              (empiricalTrace sample classFun index₂) threshold) ->
        empiricalTrace sample classFun index₁ =
          empiricalTrace sample classFun index₂ := by
  exact
    thresholdTraceCode_separates_of_coordinate_thresholds_separate
      (coordinate_thresholds_separate_of_values_mem_thresholds hvalues)

/-- Every realized empirical trace has a threshold code in the realized-code set. -/
theorem thresholdTraceCode_mem_thresholdTraceCodeSet
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ} {index : Index} (hindex : index ∈ indexClass) :
    thresholdTraceCode thresholds (empiricalTrace sample classFun index) ∈
      thresholdTraceCodeSet sample indexClass classFun thresholds := by
  classical
  rw [thresholdTraceCodeSet]
  simp only [Finset.mem_filter, Finset.mem_univ, true_and]
  intro threshold
  rw [thresholdTraceCode_empiricalTrace_eq_binaryTraceSet
    (sample := sample) (classFun := classFun)
    (thresholds := thresholds) (index := index) threshold]
  exact empiricalBinaryTraceSet_mem_family hindex

/--
If finite threshold signatures separate the realized empirical traces, then the
threshold-code map is injective on the trace image.
-/
theorem thresholdTraceCode_injOn_empiricalTrace_image_of_separates
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    Set.InjOn (thresholdTraceCode thresholds)
      (empiricalTrace sample classFun '' indexClass) := by
  intro trace₁ htrace₁ trace₂ htrace₂ hcode
  rcases htrace₁ with ⟨index₁, hindex₁, rfl⟩
  rcases htrace₂ with ⟨index₂, hindex₂, rfl⟩
  exact hseparate index₁ hindex₁ index₂ hindex₂ fun threshold =>
    congrFun hcode threshold

/--
Finite threshold signatures give a finite empirical trace image whenever they
separate the realized traces.
-/
theorem finite_empiricalTrace_image_of_thresholdTraceCode_separates
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    (empiricalTrace sample classFun '' indexClass).Finite := by
  exact
    finite_empiricalTrace_image_of_finite_code
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (code := thresholdTraceCode thresholds)
      (codeSet := thresholdTraceCodeSet sample indexClass classFun thresholds)
      (by
        intro index hindex
        exact thresholdTraceCode_mem_thresholdTraceCodeSet hindex)
      (thresholdTraceCode_injOn_empiricalTrace_image_of_separates hseparate)

/--
Pointwise threshold-comparison separation gives a finite empirical trace image
through the finite threshold-code layer.
-/
theorem finite_empiricalTrace_image_of_pointwise_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hpoint :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ sampleIndex : Fin n,
            ∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    (empiricalTrace sample classFun '' indexClass).Finite := by
  exact
    finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_pointwise_thresholds_separate hpoint)

/--
Coordinatewise threshold separation gives a finite empirical trace image
through the finite threshold-code layer.
-/
theorem finite_empiricalTrace_image_of_coordinate_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hcoordinate :
      ∀ sampleIndex : Fin n,
        ∀ index₁, index₁ ∈ indexClass ->
          ∀ index₂, index₂ ∈ indexClass ->
            (∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
            classFun index₁ (sample sampleIndex) =
              classFun index₂ (sample sampleIndex)) :
    (empiricalTrace sample classFun '' indexClass).Finite := by
  exact
    finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_coordinate_thresholds_separate hcoordinate)

/--
If all realized sample-coordinate values lie in the finite threshold set, then
the empirical trace image is finite.
-/
theorem finite_empiricalTrace_image_of_values_mem_thresholds
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hvalues :
      ∀ sampleIndex : Fin n,
        ∀ index, index ∈ indexClass ->
          classFun index (sample sampleIndex) ∈ thresholds) :
    (empiricalTrace sample classFun '' indexClass).Finite := by
  exact
    finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_values_mem_thresholds hvalues)

/--
The cardinality of a trace image separated by finite threshold signatures is
bounded by the number of realized threshold signatures.
-/
theorem empiricalTrace_image_toFinset_card_le_thresholdTraceCodeSet_card
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    (finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card ≤
      (thresholdTraceCodeSet sample indexClass classFun thresholds).card := by
  exact
    empiricalTrace_image_toFinset_card_le_finite_code
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (code := thresholdTraceCode thresholds)
      (codeSet := thresholdTraceCodeSet sample indexClass classFun thresholds)
      (by
        intro index hindex
        exact thresholdTraceCode_mem_thresholdTraceCodeSet hindex)
      (thresholdTraceCode_injOn_empiricalTrace_image_of_separates hseparate)

/--
The realized threshold-signature set is bounded by the Cartesian product of the
realized binary trace families at the individual thresholds.
-/
theorem thresholdTraceCodeSet_card_le_pi_binaryTraceSetFamily_card
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (thresholds : Finset ℝ) :
    (thresholdTraceCodeSet sample indexClass classFun thresholds).card ≤
      ∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card := by
  classical
  let piSet :
      Finset (∀ threshold, threshold ∈ thresholds.attach -> Finset (Fin n)) :=
    thresholds.attach.pi fun threshold =>
      empiricalBinaryTraceSetFamily sample indexClass
        (thresholdIndicatorClassFun classFun threshold.1)
  let restrictCode :
      ({threshold // threshold ∈ thresholds} -> Finset (Fin n)) ->
        (∀ threshold, threshold ∈ thresholds.attach -> Finset (Fin n)) :=
    fun code threshold _hthreshold => code threshold
  have hmaps :
      Set.MapsTo restrictCode
        (thresholdTraceCodeSet sample indexClass classFun thresholds : Set
          ({threshold // threshold ∈ thresholds} -> Finset (Fin n)))
        (piSet : Set (∀ threshold, threshold ∈ thresholds.attach -> Finset (Fin n))) := by
    intro code hcode
    change restrictCode code ∈
      thresholds.attach.pi fun threshold =>
        empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)
    exact Finset.mem_pi.mpr fun threshold _hthreshold =>
      (Finset.mem_filter.mp hcode).2 threshold
  have hinj :
      Set.InjOn restrictCode
        (thresholdTraceCodeSet sample indexClass classFun thresholds : Set
          ({threshold // threshold ∈ thresholds} -> Finset (Fin n))) := by
    intro code₁ _hcode₁ code₂ _hcode₂ hrestrict
    funext threshold
    exact congrFun (congrFun hrestrict threshold) (Finset.mem_attach thresholds threshold)
  have hcard :
      (thresholdTraceCodeSet sample indexClass classFun thresholds).card ≤
        piSet.card :=
    Finset.card_le_card_of_injOn restrictCode hmaps hinj
  simpa [piSet] using hcard

/--
Composed threshold-coding cardinality bound for real empirical traces:
if finite threshold signatures separate the trace image, then the trace-image
cardinality is bounded by the product of the individual threshold binary trace
family cardinalities.
-/
theorem empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    (finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card ≤
      ∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card :=
  (empiricalTrace_image_toFinset_card_le_thresholdTraceCodeSet_card hseparate).trans
    (thresholdTraceCodeSet_card_le_pi_binaryTraceSetFamily_card
      sample indexClass classFun thresholds)

/--
Pointwise threshold-comparison separation bounds the empirical trace-image
cardinality by the product of the fixed-threshold binary trace-family
cardinalities.
-/
theorem empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card_of_pointwise_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hpoint :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ sampleIndex : Fin n,
            ∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂) :
    (finite_empiricalTrace_image_of_pointwise_thresholds_separate hpoint).toFinset.card ≤
      ∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card :=
  empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card
    (thresholdTraceCode_separates_of_pointwise_thresholds_separate hpoint)

/--
Coordinatewise threshold separation bounds the empirical trace-image
cardinality by the product of the fixed-threshold binary trace-family
cardinalities.
-/
theorem empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card_of_coordinate_thresholds_separate
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hcoordinate :
      ∀ sampleIndex : Fin n,
        ∀ index₁, index₁ ∈ indexClass ->
          ∀ index₂, index₂ ∈ indexClass ->
            (∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
            classFun index₁ (sample sampleIndex) =
              classFun index₂ (sample sampleIndex)) :
    (finite_empiricalTrace_image_of_coordinate_thresholds_separate hcoordinate).toFinset.card ≤
      ∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card :=
  empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card
    (thresholdTraceCode_separates_of_coordinate_thresholds_separate hcoordinate)

/--
Threshold-product cardinality estimates feed directly into the real
natural-polynomial trace-cardinality shape used by the Theorem 2.4.3 entropy
constructors.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_product_bound
    {Observation : Type u} {Index : Type v} {n d : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ} {C : ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hproduct_bound :
      (((∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card : ℕ) : ℝ) + 1) ≤
        C * (((n + 1 : ℕ) : ℝ) ^ d)) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
      C * (((n + 1 : ℕ) : ℝ) ^ d) := by
  have htrace_le :
      (finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card ≤
        ∏ threshold ∈ thresholds.attach,
          (empiricalBinaryTraceSetFamily sample indexClass
            (thresholdIndicatorClassFun classFun threshold.1)).card :=
    empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card hseparate
  have htrace_le_real :
      (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
        ((∏ threshold ∈ thresholds.attach,
          (empiricalBinaryTraceSetFamily sample indexClass
            (thresholdIndicatorClassFun classFun threshold.1)).card : ℕ) : ℝ) + 1 := by
    exact_mod_cast Nat.add_le_add_right htrace_le 1
  exact htrace_le_real.trans hproduct_bound

/--
Factorwise cardinality bounds for the fixed-threshold binary trace families
produce the corresponding product bound.
-/
theorem threshold_binaryTraceSetFamily_product_card_le_of_forall_card_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (thresholds : Finset ℝ)
    (bound : {threshold // threshold ∈ thresholds} -> ℕ)
    (hbound :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          bound threshold) :
    (∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
      ∏ threshold ∈ thresholds.attach, bound threshold :=
  Finset.prod_le_prod' fun threshold _hthreshold => hbound threshold

/--
Per-threshold cardinality bounds plus a polynomial estimate on their product
feed the threshold-coded empirical trace image into the Theorem 2.4.3
natural-polynomial entropy shape.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_factor_bound
    {Observation : Type u} {Index : Type v} {n d : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ} {C : ℝ}
    (bound : {threshold // threshold ∈ thresholds} -> ℕ)
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hfactor_bound :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          bound threshold)
    (hbound_product :
      (((∏ threshold ∈ thresholds.attach, bound threshold : ℕ) : ℝ) + 1) ≤
        C * (((n + 1 : ℕ) : ℝ) ^ d)) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
      C * (((n + 1 : ℕ) : ℝ) ^ d) := by
  have hproduct_nat :
      (∏ threshold ∈ thresholds.attach,
          (empiricalBinaryTraceSetFamily sample indexClass
            (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
        ∏ threshold ∈ thresholds.attach, bound threshold :=
    threshold_binaryTraceSetFamily_product_card_le_of_forall_card_le
      sample indexClass classFun thresholds bound hfactor_bound
  have hproduct_real :
      (((∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card : ℕ) : ℝ) + 1) ≤
        ((∏ threshold ∈ thresholds.attach, bound threshold : ℕ) : ℝ) + 1 := by
    exact_mod_cast Nat.add_le_add_right hproduct_nat 1
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_product_bound
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (C := C) hseparate
      (hproduct_real.trans hbound_product)

/--
A common cardinality bound for every fixed-threshold binary trace family gives
the simple product bound `base ^ #thresholds`.
-/
theorem threshold_binaryTraceSetFamily_product_card_le_const_pow
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (thresholds : Finset ℝ) (base : ℕ)
    (hbase :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          base) :
    (∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
      base ^ thresholds.card := by
  have hprod :
      (∏ threshold ∈ thresholds.attach,
          (empiricalBinaryTraceSetFamily sample indexClass
            (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
        ∏ threshold ∈ thresholds.attach, base :=
    threshold_binaryTraceSetFamily_product_card_le_of_forall_card_le
      sample indexClass classFun thresholds (fun _ => base) hbase
  simpa using hprod

/--
Common fixed-threshold cardinality bounds plus a polynomial estimate on
`base ^ #thresholds` feed the threshold-coded trace image into the
Theorem 2.4.3 natural-polynomial entropy shape.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_bound
    {Observation : Type u} {Index : Type v} {n d : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ} {C : ℝ} {base : ℕ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hbase :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          base)
    (hpow_bound :
      (((base ^ thresholds.card : ℕ) : ℝ) + 1) ≤
        C * (((n + 1 : ℕ) : ℝ) ^ d)) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
      C * (((n + 1 : ℕ) : ℝ) ^ d) := by
  have hproduct_nat :
      (∏ threshold ∈ thresholds.attach,
          (empiricalBinaryTraceSetFamily sample indexClass
            (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
        base ^ thresholds.card :=
    threshold_binaryTraceSetFamily_product_card_le_const_pow
      sample indexClass classFun thresholds base hbase
  have hproduct_real :
      (((∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card : ℕ) : ℝ) + 1) ≤
        ((base ^ thresholds.card : ℕ) : ℝ) + 1 := by
    exact_mod_cast Nat.add_le_add_right hproduct_nat 1
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_product_bound
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (C := C) hseparate
      (hproduct_real.trans hpow_bound)

/--
If the number of thresholds is bounded by `k`, a common fixed-threshold
cardinality bound gives the cleaner product bound `base ^ k`.
-/
theorem threshold_binaryTraceSetFamily_product_card_le_const_pow_of_card_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (thresholds : Finset ℝ) {base k : ℕ}
    (hbase_pos : 0 < base) (hthresholds_card : thresholds.card ≤ k)
    (hbase :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          base) :
    (∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
      base ^ k :=
  (threshold_binaryTraceSetFamily_product_card_le_const_pow
    sample indexClass classFun thresholds base hbase).trans
    (Nat.pow_le_pow_right hbase_pos hthresholds_card)

/--
Common fixed-threshold cardinality bounds and a threshold-count bound reduce
the theorem-facing entropy estimate to a bound on `base ^ k`.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_card_le
    {Observation : Type u} {Index : Type v} {n d : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ} {C : ℝ} {base k : ℕ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hbase_pos : 0 < base) (hthresholds_card : thresholds.card ≤ k)
    (hbase :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          base)
    (hpow_bound :
      (((base ^ k : ℕ) : ℝ) + 1) ≤
        C * (((n + 1 : ℕ) : ℝ) ^ d)) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
      C * (((n + 1 : ℕ) : ℝ) ^ d) := by
  have hproduct_nat :
      (∏ threshold ∈ thresholds.attach,
          (empiricalBinaryTraceSetFamily sample indexClass
            (thresholdIndicatorClassFun classFun threshold.1)).card) ≤
        base ^ k :=
    threshold_binaryTraceSetFamily_product_card_le_const_pow_of_card_le
      sample indexClass classFun thresholds hbase_pos hthresholds_card hbase
  have hproduct_real :
      (((∏ threshold ∈ thresholds.attach,
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card : ℕ) : ℝ) + 1) ≤
        ((base ^ k : ℕ) : ℝ) + 1 := by
    exact_mod_cast Nat.add_le_add_right hproduct_nat 1
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_product_bound
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (C := C) hseparate
      (hproduct_real.trans hpow_bound)

/--
Arithmetic bridge: a polynomial real bound on a natural base gives a
polynomial real bound on `base ^ k + 1`.
-/
theorem nat_pow_add_one_real_le_nat_poly_of_base_le
    {base n a k : ℕ} {B : ℝ}
    (hB_nonneg : 0 ≤ B)
    (hbase_le : (base : ℝ) ≤ B * (((n + 1 : ℕ) : ℝ) ^ a)) :
    (((base ^ k : ℕ) : ℝ) + 1) ≤
      (B ^ k + 1) * (((n + 1 : ℕ) : ℝ) ^ (a * k)) := by
  let sampleSize : ℝ := ((n + 1 : ℕ) : ℝ)
  have hbase_nonneg : 0 ≤ (base : ℝ) := Nat.cast_nonneg _
  have hsample_ge_one : 1 ≤ sampleSize := by
    dsimp [sampleSize]
    exact_mod_cast Nat.succ_le_succ (Nat.zero_le n)
  have hsample_pow_nonneg : 0 ≤ sampleSize ^ a :=
    pow_nonneg (by linarith : 0 ≤ sampleSize) a
  have htarget_pow_ge_one : 1 ≤ sampleSize ^ (a * k) :=
    one_le_pow₀ hsample_ge_one
  have hpow_le :
      ((base : ℝ) ^ k) ≤ (B * sampleSize ^ a) ^ k :=
    pow_le_pow_left₀ hbase_nonneg hbase_le k
  have hpow_rewrite :
      (B * sampleSize ^ a) ^ k =
        B ^ k * sampleSize ^ (a * k) := by
    rw [mul_pow, pow_mul]
  have hcast_pow :
      ((base ^ k : ℕ) : ℝ) = (base : ℝ) ^ k := by
    norm_num [Nat.cast_pow]
  have hbase_pow_le :
      ((base ^ k : ℕ) : ℝ) ≤ B ^ k * sampleSize ^ (a * k) := by
    calc
      ((base ^ k : ℕ) : ℝ) = (base : ℝ) ^ k := hcast_pow
      _ ≤ (B * sampleSize ^ a) ^ k := hpow_le
      _ = B ^ k * sampleSize ^ (a * k) := hpow_rewrite
  have hBpow_nonneg : 0 ≤ B ^ k := pow_nonneg hB_nonneg k
  have hmain :
      ((base ^ k : ℕ) : ℝ) + 1 ≤
        B ^ k * sampleSize ^ (a * k) + sampleSize ^ (a * k) := by
    nlinarith
  calc
    ((base ^ k : ℕ) : ℝ) + 1
        ≤ B ^ k * sampleSize ^ (a * k) + sampleSize ^ (a * k) := hmain
    _ = (B ^ k + 1) * sampleSize ^ (a * k) := by ring

/--
If the common fixed-threshold cardinality bound itself has polynomial growth,
then the threshold-count route supplies the Theorem 2.4.3 trace-cardinality
polynomial shape.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_base_le_nat_poly
    {Observation : Type u} {Index : Type v} {n a k : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ} {base : ℕ} {B : ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hbase_pos : 0 < base) (hthresholds_card : thresholds.card ≤ k)
    (hbase :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          base)
    (hB_nonneg : 0 ≤ B)
    (hbase_growth : (base : ℝ) ≤ B * (((n + 1 : ℕ) : ℝ) ^ a)) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
      (B ^ k + 1) * (((n + 1 : ℕ) : ℝ) ^ (a * k)) := by
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_card_le
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (C := B ^ k + 1) (base := base) (k := k)
      (d := a * k) hseparate hbase_pos hthresholds_card hbase
      (nat_pow_add_one_real_le_nat_poly_of_base_le
        (base := base) (n := n) (a := a) (k := k)
        hB_nonneg hbase_growth)

/--
Sauer-Shelah supplies a common natural-polynomial cardinality bound for every
fixed-threshold binary trace family under a uniform VC-dimension bound.
-/
theorem threshold_binaryTraceSetFamily_card_le_vc_nat_poly
    {Observation : Type u} {Index : Type v} {n d : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    {thresholds : Finset ℝ}
    (hvc :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).vcDim ≤ d)
    (threshold : {threshold // threshold ∈ thresholds}) :
    (empiricalBinaryTraceSetFamily sample indexClass
      (thresholdIndicatorClassFun classFun threshold.1)).card ≤
      (d + 2) * (n + 1) ^ d := by
  have hadd_one :
      (empiricalBinaryTraceSetFamily sample indexClass
        (thresholdIndicatorClassFun classFun threshold.1)).card + 1 ≤
        (d + 2) * (n + 1) ^ d :=
    vdVWSauerShelah_card_add_one_le_nat_poly_of_vcDim_le
      (empiricalBinaryTraceSetFamily sample indexClass
        (thresholdIndicatorClassFun classFun threshold.1))
      (N := n) (d := d) (by simp) (hvc threshold)
  exact (Nat.le_succ _).trans hadd_one

/--
Uniform fixed-threshold VC/Sauer bounds, finite threshold separation, and a
threshold-count bound give the natural-polynomial empirical trace-cardinality
shape needed by the Theorem 2.4.3 entropy route.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_uniform_vc
    {Observation : Type u} {Index : Type v} {n d k : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hseparate :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ threshold : {threshold // threshold ∈ thresholds},
            thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₁) threshold =
              thresholdTraceCode thresholds
                (empiricalTrace sample classFun index₂) threshold) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hthresholds_card : thresholds.card ≤ k)
    (hvc :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).vcDim ≤ d) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates hseparate).toFinset.card : ℝ) + 1) ≤
      ((((d + 2 : ℕ) : ℝ) ^ k) + 1) *
        (((n + 1 : ℕ) : ℝ) ^ (d * k)) := by
  let base : ℕ := (d + 2) * (n + 1) ^ d
  have hbase_pos : 0 < base := by
    dsimp [base]
    exact Nat.mul_pos (Nat.succ_pos (d + 1)) (pow_pos (Nat.succ_pos n) d)
  have hbase :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).card ≤
          base := by
    intro threshold
    exact threshold_binaryTraceSetFamily_card_le_vc_nat_poly
      sample indexClass classFun hvc threshold
  have hbase_growth :
      (base : ℝ) ≤ ((d + 2 : ℕ) : ℝ) * (((n + 1 : ℕ) : ℝ) ^ d) := by
    dsimp [base]
    norm_num [Nat.cast_mul, Nat.cast_pow]
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_base_le_nat_poly
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (base := base)
      (B := ((d + 2 : ℕ) : ℝ)) (a := d) (k := k)
      hseparate hbase_pos hthresholds_card hbase
      (Nat.cast_nonneg _) hbase_growth

/--
Pointwise threshold separation, threshold-count, and uniform fixed-threshold
VC/Sauer bounds give the same natural-polynomial empirical trace-cardinality
bound.  This is the form expected from later subgraph/truncated-class geometry:
the geometry only has to show that matching all threshold predicates on the
sample identifies the realized trace.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_pointwise_thresholds_separate_uniform_vc
    {Observation : Type u} {Index : Type v} {n d k : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hpoint :
      ∀ index₁, index₁ ∈ indexClass ->
        ∀ index₂, index₂ ∈ indexClass ->
          (∀ sampleIndex : Fin n,
            ∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
          empiricalTrace sample classFun index₁ =
            empiricalTrace sample classFun index₂)
    (hthresholds_card : thresholds.card ≤ k)
    (hvc :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).vcDim ≤ d) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_pointwise_thresholds_separate hpoint)).toFinset.card : ℝ) + 1) ≤
      ((((d + 2 : ℕ) : ℝ) ^ k) + 1) *
        (((n + 1 : ℕ) : ℝ) ^ (d * k)) := by
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_uniform_vc
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (d := d) (k := k)
      (thresholdTraceCode_separates_of_pointwise_thresholds_separate hpoint)
      hthresholds_card hvc

/--
Coordinatewise threshold separation, threshold-count, and uniform
fixed-threshold VC/Sauer bounds give the natural-polynomial empirical
trace-cardinality bound.  This is the most local finite-threshold interface:
later geometry can work one sample coordinate at a time.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_coordinate_thresholds_separate_uniform_vc
    {Observation : Type u} {Index : Type v} {n d k : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hcoordinate :
      ∀ sampleIndex : Fin n,
        ∀ index₁, index₁ ∈ indexClass ->
          ∀ index₂, index₂ ∈ indexClass ->
            (∀ threshold : {threshold // threshold ∈ thresholds},
              (threshold.1 < classFun index₁ (sample sampleIndex) ↔
                threshold.1 < classFun index₂ (sample sampleIndex))) ->
            classFun index₁ (sample sampleIndex) =
              classFun index₂ (sample sampleIndex))
    (hthresholds_card : thresholds.card ≤ k)
    (hvc :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).vcDim ≤ d) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_coordinate_thresholds_separate hcoordinate)).toFinset.card : ℝ) + 1) ≤
      ((((d + 2 : ℕ) : ℝ) ^ k) + 1) *
        (((n + 1 : ℕ) : ℝ) ^ (d * k)) := by
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_uniform_vc
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (d := d) (k := k)
      (thresholdTraceCode_separates_of_coordinate_thresholds_separate hcoordinate)
      hthresholds_card hvc

/--
If all realized sample-coordinate values lie in the finite threshold set, then
threshold-count and uniform fixed-threshold VC/Sauer bounds give the
natural-polynomial empirical trace-cardinality bound.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_values_mem_thresholds_uniform_vc
    {Observation : Type u} {Index : Type v} {n d k : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {thresholds : Finset ℝ}
    (hvalues :
      ∀ sampleIndex : Fin n,
        ∀ index, index ∈ indexClass ->
          classFun index (sample sampleIndex) ∈ thresholds)
    (hthresholds_card : thresholds.card ≤ k)
    (hvc :
      ∀ threshold : {threshold // threshold ∈ thresholds},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).vcDim ≤ d) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_values_mem_thresholds hvalues)).toFinset.card : ℝ) + 1) ≤
      ((((d + 2 : ℕ) : ℝ) ^ k) + 1) *
        (((n + 1 : ℕ) : ℝ) ^ (d * k)) := by
  exact
    empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_uniform_vc
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := thresholds) (d := d) (k := k)
      (thresholdTraceCode_separates_of_values_mem_thresholds hvalues)
      hthresholds_card hvc

/--
Finite realized sample-coordinate value sets supply the finite threshold set
used by the value-membership threshold route.

This is a structural bridge toward the Theorem 2.4.3 finite-threshold route:
instead of requiring an externally chosen threshold finset, it uses the finite
set of all values actually realized on the current empirical sample by the
class.
-/
theorem empiricalTrace_image_card_add_one_real_le_of_sample_valueSet_finite_uniform_vc
    {Observation : Type u} {Index : Type v} {n d k : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (hvalues_finite :
      ({value : ℝ |
        ∃ sampleIndex : Fin n, ∃ index, index ∈ indexClass ∧
          classFun index (sample sampleIndex) = value} : Set ℝ).Finite)
    (hvalues_card : hvalues_finite.toFinset.card ≤ k)
    (hvc :
      ∀ threshold : {threshold // threshold ∈ hvalues_finite.toFinset},
        (empiricalBinaryTraceSetFamily sample indexClass
          (thresholdIndicatorClassFun classFun threshold.1)).vcDim ≤ d) :
    (((finite_empiricalTrace_image_of_thresholdTraceCode_separates
      (thresholdTraceCode_separates_of_values_mem_thresholds
        (thresholds := hvalues_finite.toFinset)
        (by
          intro sampleIndex index hindex
          exact
            (hvalues_finite.mem_toFinset).2
              ⟨sampleIndex, index, hindex, rfl⟩))).toFinset.card : ℝ) + 1) ≤
      ((((d + 2 : ℕ) : ℝ) ^ k) + 1) *
        (((n + 1 : ℕ) : ℝ) ^ (d * k)) := by
  classical
  let hvalues :
      ∀ sampleIndex : Fin n,
        ∀ index, index ∈ indexClass ->
          classFun index (sample sampleIndex) ∈ hvalues_finite.toFinset := by
    intro sampleIndex index hindex
    exact
      (hvalues_finite.mem_toFinset).2
        ⟨sampleIndex, index, hindex, rfl⟩
  exact
    empiricalTrace_image_card_add_one_real_le_of_values_mem_thresholds_uniform_vc
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (thresholds := hvalues_finite.toFinset) (d := d) (k := k)
      hvalues hvalues_card hvc

end StatInference
