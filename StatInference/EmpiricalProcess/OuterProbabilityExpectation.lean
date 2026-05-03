import StatInference.EmpiricalProcess.GlivenkoCantelli
import StatInference.EmpiricalProcess.OuterExpectation

/-!
# Bridges between VdV&W outer probability and outer expectation

This module connects the empirical-process outer-probability vocabulary with
the Chapter 1.2 event-indicator outer-expectation layer.
-/

namespace StatInference

open MeasureTheory Filter

open scoped ENNReal Topology

universe u v

/--
VdV&W outer probability is the nonnegative outer expectation of the event
indicator.

This is the local bridge between the empirical-process notation
`VdVWOuterProbability` and the Chapter 1.2 indicator identity
`E* 1_B = P* B`.
-/
theorem VdVWOuterProbability_eq_outerExpectation_eventIndicator
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω) (event : Set Ω) :
    VdVWOuterProbability μ event =
      VdVWOuterExpectation μ (VdVWEventIndicator event) := by
  rw [VdVWOuterProbability, VdVWOuterExpectation_eventIndicator_eq_measure]

/--
Outer-almost-sure truth can be read as zero outer expectation of the
exceptional event indicator.
-/
theorem VdVWOuterAlmostSure_iff_outerExpectation_exceptional_eq_zero
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {predicate : Ω -> Prop} :
    VdVWOuterAlmostSure μ predicate ↔
      VdVWOuterExpectation μ (VdVWEventIndicator {ω | ¬ predicate ω}) = 0 := by
  rw [VdVWOuterAlmostSure,
    VdVWOuterProbability_eq_outerExpectation_eventIndicator]

/--
Markov-style outer-probability bound using a supplied measurable cover.

This is a Chapter 1.2 bridge from the VdV&W outer-probability notation to the
nonnegative outer-expectation/measurable-cover layer.
-/
theorem VdVWOuterProbability_lt_le_outerExpectation_div_cover
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (U : VdVWMeasurableCover μ T)
    {epsilon : ℝ≥0∞} (hepsilon_ne_zero : epsilon ≠ 0)
    (hepsilon_ne_top : epsilon ≠ ∞) :
    VdVWOuterProbability μ {ω | epsilon < T ω} ≤
      VdVWOuterExpectation μ T / epsilon := by
  rw [VdVWOuterProbability, VdVWOuterExpectation_eq_lintegral_cover U]
  exact
    (measure_mono fun ω hω => (le_of_lt hω).trans (U.majorizes ω)).trans
      (meas_ge_le_lintegral_div U.measurable_toFun.aemeasurable
        hepsilon_ne_zero hepsilon_ne_top)

/--
Markov-style convergence bridge from vanishing nonnegative outer expectation
to convergence in outer probability.

The theorem is stated for nonnegative real-valued processes so that the
measurable covers needed by the outer-expectation side are exactly the
`ENNReal.ofReal` covers used in the Theorem 2.4.3 finite-net assembly.
-/
theorem
    VdVWConvergesInOuterProbability_zero_of_outerExpectation_tendsto_zero_ofReal
    {Ω : Type u} {ι : Type v} [MeasurableSpace Ω] {μ : Measure Ω}
    {l : Filter ι} {Y : ι -> Ω -> ℝ}
    (hY_nonneg : ∀ i ω, 0 ≤ Y i ω)
    (U :
      ∀ i, VdVWMeasurableCover μ (fun ω => ENNReal.ofReal (Y i ω)))
    (hE :
      Tendsto
        (fun i =>
          VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y i ω)))
        l (𝓝 0)) :
    VdVWConvergesInOuterProbability μ Y l (fun _ => 0) := by
  intro epsilon hepsilon
  have hupper :
      Tendsto
        (fun i =>
          VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y i ω)) /
            ENNReal.ofReal epsilon)
        l (𝓝 0) := by
    have hdiv :
        Tendsto
          (fun i =>
            VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y i ω)) /
              ENNReal.ofReal epsilon)
          l (𝓝 (0 / ENNReal.ofReal epsilon)) :=
      ENNReal.Tendsto.div_const hE
        (Or.inr (ENNReal.ofReal_ne_zero_iff.mpr hepsilon))
    simpa using hdiv
  refine
    tendsto_of_tendsto_of_tendsto_of_le_of_le'
      (show Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0) from
        tendsto_const_nhds)
      hupper
      (Eventually.of_forall fun _ => bot_le)
      ?_
  exact Eventually.of_forall fun i => by
    calc
      VdVWOuterProbability μ {ω | epsilon < dist (Y i ω) 0}
          =
        VdVWOuterProbability μ
          {ω | ENNReal.ofReal epsilon < ENNReal.ofReal (Y i ω)} := by
            congr 1
            ext ω
            simp only [Set.mem_setOf_eq]
            rw [Real.dist_eq, sub_zero, abs_of_nonneg (hY_nonneg i ω),
              ENNReal.ofReal_lt_ofReal_iff_of_nonneg hepsilon.le]
      _ ≤
        VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y i ω)) /
          ENNReal.ofReal epsilon :=
            VdVWOuterProbability_lt_le_outerExpectation_div_cover (U i)
              (ENNReal.ofReal_ne_zero_iff.mpr hepsilon)
              ENNReal.ofReal_ne_top

/--
Markov-style convergence bridge with a supplied vanishing upper bound for the
nonnegative outer expectations.
-/
theorem
    VdVWConvergesInOuterProbability_zero_of_outerExpectation_le_tendsto_zero_ofReal
    {Ω : Type u} {ι : Type v} [MeasurableSpace Ω] {μ : Measure Ω}
    {l : Filter ι} {Y : ι -> Ω -> ℝ} {bound : ι -> ℝ≥0∞}
    (hY_nonneg : ∀ i ω, 0 ≤ Y i ω)
    (U :
      ∀ i, VdVWMeasurableCover μ (fun ω => ENNReal.ofReal (Y i ω)))
    (hE_le :
      ∀ᶠ i in l,
        VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y i ω)) ≤
          bound i)
    (hbound : Tendsto bound l (𝓝 0)) :
    VdVWConvergesInOuterProbability μ Y l (fun _ => 0) := by
  have hE :
      Tendsto
        (fun i =>
          VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y i ω)))
        l (𝓝 0) := by
    exact
      tendsto_of_tendsto_of_tendsto_of_le_of_le'
        (show Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0) from
          tendsto_const_nhds)
        hbound
        (Eventually.of_forall fun _ => bot_le)
        hE_le
  exact
    VdVWConvergesInOuterProbability_zero_of_outerExpectation_tendsto_zero_ofReal
      hY_nonneg U hE

/--
Varying-sample-space version of the Markov-style convergence bridge from
vanishing nonnegative outer expectation to convergence in outer probability.
-/
theorem
    VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_tendsto_zero_ofReal
    {ι : Type v} {Ω : ι -> Type u}
    (mΩ : (i : ι) -> MeasurableSpace (Ω i))
    (μ : (i : ι) -> @Measure (Ω i) (mΩ i))
    {l : Filter ι} {Y : (i : ι) -> Ω i -> ℝ}
    (hY_nonneg : ∀ i (ω : Ω i), 0 ≤ Y i ω)
    (U :
      ∀ i,
        @VdVWMeasurableCover (Ω i) (mΩ i) (μ i)
          (fun ω => ENNReal.ofReal (Y i ω)))
    (hE :
      Tendsto
        (fun i =>
          @VdVWOuterExpectation (Ω i) (mΩ i) (μ i)
            (fun ω => ENNReal.ofReal (Y i ω)))
        l (𝓝 0)) :
    VdVWConvergesInOuterProbabilityConst Ω mΩ μ Y l (0 : ℝ) := by
  intro epsilon hepsilon
  have hupper :
      Tendsto
        (fun i =>
          @VdVWOuterExpectation (Ω i) (mΩ i) (μ i)
              (fun ω => ENNReal.ofReal (Y i ω)) /
            ENNReal.ofReal epsilon)
        l (𝓝 0) := by
    have hdiv :
        Tendsto
          (fun i =>
            @VdVWOuterExpectation (Ω i) (mΩ i) (μ i)
                (fun ω => ENNReal.ofReal (Y i ω)) /
              ENNReal.ofReal epsilon)
          l (𝓝 (0 / ENNReal.ofReal epsilon)) :=
      ENNReal.Tendsto.div_const hE
        (Or.inr (ENNReal.ofReal_ne_zero_iff.mpr hepsilon))
    simpa using hdiv
  refine
    tendsto_of_tendsto_of_tendsto_of_le_of_le'
      (show Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0) from
        tendsto_const_nhds)
      hupper
      (Eventually.of_forall fun _ => bot_le)
      ?_
  exact Eventually.of_forall fun i => by
    calc
      @VdVWOuterProbability (Ω i) (mΩ i) (μ i)
          {ω | epsilon < dist (Y i ω) 0}
          =
        @VdVWOuterProbability (Ω i) (mΩ i) (μ i)
          {ω | ENNReal.ofReal epsilon < ENNReal.ofReal (Y i ω)} := by
            congr 1
            ext ω
            simp only [Set.mem_setOf_eq]
            rw [Real.dist_eq, sub_zero, abs_of_nonneg (hY_nonneg i ω),
              ENNReal.ofReal_lt_ofReal_iff_of_nonneg hepsilon.le]
      _ ≤
        @VdVWOuterExpectation (Ω i) (mΩ i) (μ i)
            (fun ω => ENNReal.ofReal (Y i ω)) /
          ENNReal.ofReal epsilon :=
            @VdVWOuterProbability_lt_le_outerExpectation_div_cover
              (Ω i) (mΩ i) (μ i)
              (fun ω => ENNReal.ofReal (Y i ω)) (U i)
              (ENNReal.ofReal epsilon)
              (ENNReal.ofReal_ne_zero_iff.mpr hepsilon)
              ENNReal.ofReal_ne_top

/--
Varying-sample-space Markov bridge with a supplied vanishing upper bound for
the nonnegative outer expectations.
-/
theorem
    VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_le_tendsto_zero_ofReal
    {ι : Type v} {Ω : ι -> Type u}
    (mΩ : (i : ι) -> MeasurableSpace (Ω i))
    (μ : (i : ι) -> @Measure (Ω i) (mΩ i))
    {l : Filter ι} {Y : (i : ι) -> Ω i -> ℝ} {bound : ι -> ℝ≥0∞}
    (hY_nonneg : ∀ i (ω : Ω i), 0 ≤ Y i ω)
    (U :
      ∀ i,
        @VdVWMeasurableCover (Ω i) (mΩ i) (μ i)
          (fun ω => ENNReal.ofReal (Y i ω)))
    (hE_le :
      ∀ᶠ i in l,
        @VdVWOuterExpectation (Ω i) (mΩ i) (μ i)
            (fun ω => ENNReal.ofReal (Y i ω)) ≤
          bound i)
    (hbound : Tendsto bound l (𝓝 0)) :
    VdVWConvergesInOuterProbabilityConst Ω mΩ μ Y l (0 : ℝ) := by
  have hE :
      Tendsto
        (fun i =>
          @VdVWOuterExpectation (Ω i) (mΩ i) (μ i)
            (fun ω => ENNReal.ofReal (Y i ω)))
        l (𝓝 0) := by
    exact
      tendsto_of_tendsto_of_tendsto_of_le_of_le'
        (show Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0) from
          tendsto_const_nhds)
        hbound
        (Eventually.of_forall fun _ => bot_le)
        hE_le
  exact
    VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_tendsto_zero_ofReal
      mΩ μ hY_nonneg U hE

end StatInference
