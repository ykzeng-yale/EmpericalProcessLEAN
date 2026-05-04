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

end StatInference
