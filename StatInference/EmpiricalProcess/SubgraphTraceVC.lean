import StatInference.EmpiricalProcess.BinaryTraceVC

/-!
# Threshold/subgraph empirical trace bridges

This file exposes the first subgraph-style entry point for VC entropy routes:
every fixed threshold of a real-valued class is a binary class, so its
empirical traces can be controlled by the binary Sauer bridge.
-/

namespace StatInference

/-- The `{0,1}` indicator of the strict threshold event `threshold < f_i x`. -/
noncomputable def thresholdIndicatorClassFun
    {Observation : Type u} {Index : Type v}
    (classFun : Index -> Observation -> ℝ) (threshold : ℝ) :
    Index -> Observation -> ℝ :=
  fun index observation =>
    if threshold < classFun index observation then 1 else 0

/-- Threshold indicators are samplewise binary-valued. -/
theorem thresholdIndicatorClassFun_sample_binary
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {classFun : Index -> Observation -> ℝ} {threshold : ℝ}
    (index : Index) :
    ∀ sampleIndex : Fin n,
      thresholdIndicatorClassFun classFun threshold index (sample sampleIndex) = 0 ∨
        thresholdIndicatorClassFun classFun threshold index (sample sampleIndex) = 1 := by
  intro sampleIndex
  unfold thresholdIndicatorClassFun
  by_cases h : threshold < classFun index (sample sampleIndex)
  · right
    simp [h]
  · left
    simp [h]

/--
The binary trace set of a thresholded class is exactly the sample coordinates
where the original real-valued function exceeds the threshold.
-/
theorem empiricalBinaryTraceSet_thresholdIndicatorClassFun_eq
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ) (threshold : ℝ)
    (index : Index) :
    empiricalBinaryTraceSet sample
        (thresholdIndicatorClassFun classFun threshold) index =
      Finset.univ.filter fun sampleIndex : Fin n =>
        threshold < classFun index (sample sampleIndex) := by
  classical
  ext sampleIndex
  by_cases h : threshold < classFun index (sample sampleIndex)
  · simp [empiricalBinaryTraceSet, thresholdIndicatorClassFun, h]
  · simp [empiricalBinaryTraceSet, thresholdIndicatorClassFun, h]

/--
For a fixed threshold, the empirical trace image of the threshold-indicator
class satisfies the Sauer polynomial bound whenever the realized threshold
trace family has VC dimension at most `d`.
-/
theorem thresholdIndicator_trace_card_add_one_real_le_vc_nat_poly
    {Observation : Type u} {Index : Type v} {n d : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {threshold : ℝ}
    (hvc :
      (empiricalBinaryTraceSetFamily sample indexClass
        (thresholdIndicatorClassFun classFun threshold)).vcDim ≤ d) :
    (((finite_empiricalTrace_image_of_sample_binary
      (sample := sample) (indexClass := indexClass)
      (classFun := thresholdIndicatorClassFun classFun threshold)
      (by
        intro index _hindex
        exact thresholdIndicatorClassFun_sample_binary index)).toFinset.card : ℝ) + 1) ≤
      ((d + 2 : ℕ) : ℝ) * (((n + 1 : ℕ) : ℝ) ^ d) := by
  exact
    empiricalTrace_image_card_add_one_real_le_vc_nat_poly_of_sample_binary
      (sample := sample) (indexClass := indexClass)
      (classFun := thresholdIndicatorClassFun classFun threshold)
      (by
        intro index _hindex
        exact thresholdIndicatorClassFun_sample_binary index)
      hvc

end StatInference
