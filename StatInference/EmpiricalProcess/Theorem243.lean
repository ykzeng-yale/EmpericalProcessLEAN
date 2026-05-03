import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Probability.HasLawExists
import Mathlib.Probability.IdentDistrib
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import StatInference.EmpiricalProcess.CoveringPrimitive
import StatInference.EmpiricalProcess.GlivenkoCantelli
import StatInference.EmpiricalProcess.OuterProbabilityExpectation
import StatInference.EmpiricalProcess.PMeasurable
import StatInference.ProbabilityMeasure.ProductMeasure
import StatInference.ProbabilityMeasure.Tail

/-!
# VdV&W Theorem 2.4.3 primitives

This module starts the theorem-line interface for van der Vaart and Wellner,
Theorem 2.4.3.  The result uses the random empirical covering number
`N(epsilon, F_M, L1(P_n))` and the stochastic entropy condition
`log N(epsilon, F_M, L1(P_n)) = o_P^*(n)`.

The definitions below deliberately sit after the fixed-sample empirical
covering-number primitive and the outer-probability wrappers, so they can reuse
both without making the lower-level covering file depend on sample paths.
-/

namespace StatInference

open MeasureTheory Filter ProbabilityTheory
open scoped BigOperators ENNReal NNReal Topology

universe u v w

/-!
## Envelope and truncation interface
-/

/--
A real-valued envelope for a class: the envelope is nonnegative and bounds the
absolute value of every class member pointwise.
-/
structure VdVWClassEnvelope {Observation : Type u} {Index : Type v}
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (envelope : Observation -> ℝ) : Prop where
  nonneg : ∀ observation, 0 ≤ envelope observation
  bound :
    ∀ index, index ∈ indexClass -> ∀ observation,
      |classFun index observation| ≤ envelope observation

/--
The truncated class member `f 1{F <= M}` from VdV&W Theorem 2.4.3.

The index set is unchanged; the class function is modified by zeroing a member
outside the envelope sublevel set.
-/
noncomputable def vdVWTruncatedClassFun {Observation : Type u} {Index : Type v}
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (M : ℝ) (index : Index) : Observation -> ℝ :=
  {observation | envelope observation ≤ M}.indicator (classFun index)

/-- On the envelope sublevel set, the truncated class agrees with the original class. -/
theorem vdVWTruncatedClassFun_eq_of_envelope_le
    {Observation : Type u} {Index : Type v}
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (M : ℝ) (index : Index) {observation : Observation}
    (hle : envelope observation ≤ M) :
    vdVWTruncatedClassFun classFun envelope M index observation =
      classFun index observation := by
  simp [vdVWTruncatedClassFun, hle]

/-- Outside the envelope sublevel set, the truncated class is zero. -/
theorem vdVWTruncatedClassFun_eq_zero_of_lt_envelope
    {Observation : Type u} {Index : Type v}
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (M : ℝ) (index : Index) {observation : Observation}
    (hlt : M < envelope observation) :
    vdVWTruncatedClassFun classFun envelope M index observation = 0 := by
  simp [vdVWTruncatedClassFun, not_le.mpr hlt]

/-- Truncation cannot increase pointwise absolute values. -/
theorem abs_vdVWTruncatedClassFun_le_abs
    {Observation : Type u} {Index : Type v}
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (M : ℝ) (index : Index) (observation : Observation) :
    |vdVWTruncatedClassFun classFun envelope M index observation| ≤
      |classFun index observation| := by
  by_cases hle : envelope observation ≤ M
  · simp [vdVWTruncatedClassFun, hle]
  · simp [vdVWTruncatedClassFun, hle]

/-- The original envelope still bounds every truncated class member. -/
theorem abs_vdVWTruncatedClassFun_le_envelope
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    {index : Index} (hindex : index ∈ indexClass)
    (observation : Observation) :
    |vdVWTruncatedClassFun classFun envelope M index observation| ≤
      envelope observation := by
  by_cases hle : envelope observation ≤ M
  · simpa [vdVWTruncatedClassFun, hle] using
      henvelope.bound index hindex observation
  · simpa [vdVWTruncatedClassFun, hle] using henvelope.nonneg observation

/-- If `0 <= M`, every member of the truncated class is bounded by `M`. -/
theorem abs_vdVWTruncatedClassFun_le_M
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM : 0 ≤ M) {index : Index} (hindex : index ∈ indexClass)
    (observation : Observation) :
    |vdVWTruncatedClassFun classFun envelope M index observation| ≤ M := by
  by_cases hle : envelope observation ≤ M
  · exact
      (abs_vdVWTruncatedClassFun_le_envelope
        henvelope hindex observation).trans hle
  · simpa [vdVWTruncatedClassFun, hle] using hM

/--
The truncation error is supported on the envelope tail `{F > M}` and is
bounded there by the envelope.

This is the deterministic pointwise handoff behind the later
`P^* F {F > M}` term in the proof of VdV&W Theorem 2.4.3.
-/
theorem abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    {index : Index} (hindex : index ∈ indexClass)
    (observation : Observation) :
    |classFun index observation -
        vdVWTruncatedClassFun classFun envelope M index observation| ≤
      Set.indicator {x | M < envelope x} envelope observation := by
  by_cases htail : M < envelope observation
  · have hzero :
        vdVWTruncatedClassFun classFun envelope M index observation = 0 :=
      vdVWTruncatedClassFun_eq_zero_of_lt_envelope
        classFun envelope M index htail
    simpa [Set.indicator, htail, hzero] using
      henvelope.bound index hindex observation
  · have hle : envelope observation ≤ M := le_of_not_gt htail
    have heq :
        vdVWTruncatedClassFun classFun envelope M index observation =
          classFun index observation :=
      vdVWTruncatedClassFun_eq_of_envelope_le classFun envelope M index hle
    simp [Set.indicator, htail, heq]

/-- The same truncation-tail bound with the subtraction order reversed. -/
theorem abs_vdVWTruncatedClassFun_sub_classFun_le_envelope_tail
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    {index : Index} (hindex : index ∈ indexClass)
    (observation : Observation) :
    |vdVWTruncatedClassFun classFun envelope M index observation -
        classFun index observation| ≤
      Set.indicator {x | M < envelope x} envelope observation := by
  simpa [abs_sub_comm] using
    (abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail
      henvelope hindex observation)

/-- The real-valued envelope-tail indicator is nonnegative. -/
theorem envelope_tail_indicator_nonneg
    {Observation : Type u} {Index : Type v}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (observation : Observation) :
    0 ≤ Set.indicator {x | M < envelope x} envelope observation := by
  by_cases htail : M < envelope observation
  · simpa [Set.indicator, htail] using henvelope.nonneg observation
  · simp [Set.indicator, htail]

/--
Real envelope tails embedded in `ℝ≥0∞` agree with the nonnegative
tail-product form used by the Chapter 1.2 outer-expectation cover algebra.
-/
theorem envelope_tail_ofReal_eq_tailProduct
    {Observation : Type u} [MeasurableSpace Observation]
    {envelope : Observation -> ℝ} {M : ℝ} (hM : 0 ≤ M) :
    (fun x =>
      ENNReal.ofReal (Set.indicator {y | M < envelope y} envelope x)) =
      fun x =>
        ENNReal.ofReal (envelope x) *
          VdVWEventIndicator
            {y | ENNReal.ofReal M < ENNReal.ofReal (envelope y)} x := by
  funext x
  by_cases htail : M < envelope x
  · have htailENN :
        ENNReal.ofReal M < ENNReal.ofReal (envelope x) :=
      (ENNReal.ofReal_lt_ofReal_iff_of_nonneg hM).mpr htail
    simp [Set.indicator, htail, htailENN, VdVWEventIndicator]
  · have htailENN :
        ¬ ENNReal.ofReal M < ENNReal.ofReal (envelope x) := by
      intro h
      exact htail ((ENNReal.ofReal_lt_ofReal_iff_of_nonneg hM).mp h)
    simp [Set.indicator, htail, htailENN, VdVWEventIndicator]

/--
Outer-expectation envelope-tail handoff through a supplied measurable cover of
the envelope.

This is the local `P^* F {F > M}` bridge used by the Theorem 2.4.3
truncation argument.
-/
theorem VdVWOuterExpectation_envelope_tail_le_lintegral_tail_cover
    {Observation : Type u} [MeasurableSpace Observation]
    {μ : Measure Observation}
    {envelope : Observation -> ℝ} {M : ℝ} (hM : 0 ≤ M)
    (U : VdVWMeasurableCover μ (fun x => ENNReal.ofReal (envelope x))) :
    VdVWOuterExpectation μ
        (fun x =>
          ENNReal.ofReal
            (Set.indicator {y | M < envelope y} envelope x)) ≤
      ∫⁻ x, U x *
        (VdVWMeasurableCover.thresholdIndicatorCover U (ENNReal.ofReal M) :
          Observation -> ℝ≥0∞) x ∂μ := by
  rw [envelope_tail_ofReal_eq_tailProduct (envelope := envelope) hM]
  exact VdVWOuterExpectation_tailProduct_le_lintegral_tail_cover
    U (ENNReal.ofReal M)

/--
Outer-probability Markov handoff for the real-valued envelope-tail term.
-/
theorem VdVWOuterProbability_envelope_tail_gt_le_outerExpectation_div
    {Observation : Type u} [MeasurableSpace Observation]
    {μ : Measure Observation}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} (hepsilon : 0 < epsilon)
    (U : VdVWMeasurableCover μ
      (fun x =>
        ENNReal.ofReal
          (Set.indicator {y | M < envelope y} envelope x))) :
    VdVWOuterProbability μ
        {x | ENNReal.ofReal epsilon <
          ENNReal.ofReal
            (Set.indicator {y | M < envelope y} envelope x)} ≤
      VdVWOuterExpectation μ
        (fun x =>
          ENNReal.ofReal
            (Set.indicator {y | M < envelope y} envelope x)) /
          ENNReal.ofReal epsilon := by
  exact VdVWOuterProbability_lt_le_outerExpectation_div_cover U
    (ENNReal.ofReal_ne_zero_iff.mpr hepsilon) ENNReal.ofReal_ne_top

/--
If the envelope is measurable, the outer expectation of the envelope-tail term
is the ordinary Lebesgue integral over the tail set.
-/
theorem VdVWOuterExpectation_envelope_tail_eq_lintegral_tail_of_measurable
    {Observation : Type u} [MeasurableSpace Observation]
    {μ : Measure Observation}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henv_meas : Measurable envelope) :
    VdVWOuterExpectation μ
        (fun x =>
          ENNReal.ofReal
            (Set.indicator {y | M < envelope y} envelope x)) =
      ∫⁻ x in {y | M < envelope y},
        ENNReal.ofReal (envelope x) ∂μ := by
  let tailSet : Set Observation := {y | M < envelope y}
  have htailSet : MeasurableSet tailSet :=
    measurableSet_lt measurable_const henv_meas
  have hfun :
      (fun x =>
        ENNReal.ofReal (Set.indicator tailSet envelope x)) =
        tailSet.indicator (fun x => ENNReal.ofReal (envelope x)) := by
    funext x
    by_cases hx : x ∈ tailSet <;> simp [Set.indicator, hx]
  rw [hfun]
  rw [VdVWOuterExpectation_eq_lintegral_of_measurable
    ((henv_meas.ennreal_ofReal).indicator htailSet)]
  rw [lintegral_indicator htailSet]

/--
For a measurable integrable nonnegative envelope, the ordinary `ℝ≥0∞`
lintegral of the upper envelope tail tends to zero.

This is the VdV&W-facing conversion of the reusable Billingsley DCT tail
cutoff into the lintegral form used by the outer-expectation handoff.
-/
theorem lintegral_envelope_tail_lt_tendsto_zero_of_integrable
    {Observation : Type u} [MeasurableSpace Observation]
    {μ : Measure Observation} {envelope : Observation -> ℝ}
    (henv_meas : Measurable envelope)
    (henv_integrable : Integrable envelope μ)
    (henv_nonneg : ∀ x, 0 ≤ envelope x) :
    Tendsto
      (fun M : ℝ =>
        ∫⁻ x in {y | M < envelope y}, ENNReal.ofReal (envelope x) ∂μ)
      atTop (nhds 0) := by
  have htailReal :
      Tendsto
        (fun M : ℝ =>
          ∫ x, Set.indicator {y : Observation | M < envelope y} envelope x ∂μ)
        atTop (nhds 0) :=
    StatInference.ProbabilityMeasure.integral_indicator_tail_lt_tendsto_zero_of_integrable
      (μ := μ) (X := envelope) henv_integrable
  have htailENN := ENNReal.tendsto_ofReal htailReal
  have hrewrite :
      (fun M : ℝ =>
          ENNReal.ofReal
            (∫ x, Set.indicator {y : Observation | M < envelope y} envelope x ∂μ)) =
        fun M : ℝ =>
          ∫⁻ x in {y | M < envelope y}, ENNReal.ofReal (envelope x) ∂μ := by
    funext M
    let tailSet : Set Observation := {y | M < envelope y}
    have htailSet : MeasurableSet tailSet :=
      measurableSet_lt measurable_const henv_meas
    have htailIntegrable :
        Integrable (Set.indicator tailSet envelope) μ :=
      henv_integrable.indicator htailSet
    have htailNonneg :
        0 ≤ᵐ[μ] (Set.indicator tailSet envelope) := by
      exact ae_of_all μ fun x => by
        by_cases hx : x ∈ tailSet <;> simp [Set.indicator, hx, henv_nonneg x]
    calc
      ENNReal.ofReal
          (∫ x, Set.indicator {y : Observation | M < envelope y} envelope x ∂μ)
          = ∫⁻ x, ENNReal.ofReal (Set.indicator tailSet envelope x) ∂μ := by
              exact
                MeasureTheory.ofReal_integral_eq_lintegral_ofReal
                  htailIntegrable htailNonneg
      _ = ∫⁻ x, tailSet.indicator (fun x => ENNReal.ofReal (envelope x)) x ∂μ := by
              congr 1
              funext x
              by_cases hx : x ∈ tailSet <;> simp [Set.indicator, hx]
      _ = ∫⁻ x in tailSet, ENNReal.ofReal (envelope x) ∂μ := by
              rw [lintegral_indicator htailSet]
  simpa [ENNReal.ofReal_zero, hrewrite] using htailENN

/--
For a measurable integrable nonnegative envelope, the VdV&W outer expectation
of the envelope-tail term tends to zero as the truncation level goes to
infinity.

This closes the measurable-envelope tail-convergence handoff needed after the
generic Billingsley DCT tail cutoff.
-/
theorem VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable
    {Observation : Type u} [MeasurableSpace Observation]
    {μ : Measure Observation} {envelope : Observation -> ℝ}
    (henv_meas : Measurable envelope)
    (henv_integrable : Integrable envelope μ)
    (henv_nonneg : ∀ x, 0 ≤ envelope x) :
    Tendsto
      (fun M : ℝ =>
        VdVWOuterExpectation μ
          (fun x => ENNReal.ofReal
            (Set.indicator {y | M < envelope y} envelope x)))
      atTop (nhds 0) := by
  have hlin :=
    lintegral_envelope_tail_lt_tendsto_zero_of_integrable
      (μ := μ) (envelope := envelope) henv_meas henv_integrable henv_nonneg
  have hrewrite :
      (fun M : ℝ =>
        VdVWOuterExpectation μ
          (fun x => ENNReal.ofReal
            (Set.indicator {y | M < envelope y} envelope x))) =
      fun M : ℝ =>
        ∫⁻ x in {y | M < envelope y}, ENNReal.ofReal (envelope x) ∂μ := by
    funext M
    exact
      VdVWOuterExpectation_envelope_tail_eq_lintegral_tail_of_measurable
        (μ := μ) (envelope := envelope) (M := M) henv_meas
  simpa [hrewrite] using hlin

/-- Measurability of the truncated class member follows from measurability of `f` and `F`. -/
theorem measurable_vdVWTruncatedClassFun
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {classFun : Index -> Observation -> ℝ} {envelope : Observation -> ℝ}
    {M : ℝ} {index : Index}
    (hclass : Measurable (classFun index))
    (henvelope : Measurable envelope) :
    Measurable (vdVWTruncatedClassFun classFun envelope M index) := by
  unfold vdVWTruncatedClassFun
  exact hclass.indicator (measurableSet_le henvelope measurable_const)

/--
Ordinary measurable integral form of the truncation-tail bound.

This is the real-valued measurable bridge behind the later outer-expectation
term `P^* F {F > M}` in the proof of VdV&W Theorem 2.4.3.
-/
theorem integral_abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {μ : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    {index : Index} (hindex : index ∈ indexClass)
    (hclass : Measurable (classFun index))
    (henv : Measurable envelope)
    (htailIntegrable :
      Integrable (Set.indicator {x | M < envelope x} envelope) μ) :
    ∫ x, |classFun index x -
        vdVWTruncatedClassFun classFun envelope M index x| ∂μ ≤
      ∫ x, Set.indicator {x | M < envelope x} envelope x ∂μ := by
  let trunc : Observation -> ℝ :=
    vdVWTruncatedClassFun classFun envelope M index
  have hleftMeas :
      Measurable (fun x => |classFun index x - trunc x|) := by
    exact (hclass.sub (measurable_vdVWTruncatedClassFun hclass henv)).abs
  have hleftIntegrable :
      Integrable (fun x => |classFun index x - trunc x|) μ := by
    refine Integrable.mono' htailIntegrable hleftMeas.aestronglyMeasurable ?_
    exact ae_of_all μ fun x => by
      rw [Real.norm_eq_abs]
      rw [abs_of_nonneg (abs_nonneg _)]
      exact
        abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail
          henvelope hindex x
  exact integral_mono hleftIntegrable htailIntegrable fun x =>
    abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail
      henvelope hindex x

/-- Coordinate measurability is preserved by the `F_M` truncation. -/
theorem VdVWClassCoordinateMeasurable.truncate
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (hclass : VdVWClassCoordinateMeasurable indexClass classFun)
    (henvelope : Measurable envelope) :
    VdVWClassCoordinateMeasurable indexClass
      (vdVWTruncatedClassFun classFun envelope M) := by
  intro index hindex
  exact measurable_vdVWTruncatedClassFun (hclass index hindex) henvelope

/--
Countable coordinate-measurable classes remain `P`-measurable after the
`F_M` truncation.

This is the Definition 2.3.3 measurability gate needed before applying
symmetrization to the truncated class in Theorem 2.4.3.
-/
theorem VdVWPMeasurableClass.truncate_of_countable_of_coordinate
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {envelope : Observation -> ℝ}
    {M : ℝ}
    (hcount : indexClass.Countable)
    (hclass : VdVWClassCoordinateMeasurable indexClass classFun)
    (henvelope : Measurable envelope) :
    VdVWPMeasurableClass P indexClass
      (vdVWTruncatedClassFun classFun envelope M) := by
  exact
    VdVWPMeasurableClass.of_countable_of_measurable hcount
      (hclass.truncate henvelope)

/--
The product-copy pair difference for a fixed truncated class member is
measurable.

This is the local measurable-integrand bridge needed before applying Fubini in
the Theorem 2.4.3 symmetrization route.
-/
theorem measurable_vdVWTruncatedClassFun_pairDifference
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (hclass : VdVWClassCoordinateMeasurable indexClass classFun)
    (henvelope : Measurable envelope)
    {index : Index} (hindex : index ∈ indexClass) :
    Measurable fun z : Observation × Observation =>
      vdVWTruncatedClassFun classFun envelope M index z.1 -
        vdVWTruncatedClassFun classFun envelope M index z.2 := by
  exact
    ((measurable_vdVWTruncatedClassFun (hclass index hindex) henvelope).comp
        measurable_fst).sub
      ((measurable_vdVWTruncatedClassFun (hclass index hindex) henvelope).comp
        measurable_snd)

/--
The first coordinate on the product sample space is an independent copy with
law `P`.
-/
theorem vdVWTheorem243_productCopy_fst_hasLaw
    {Observation : Type u} [MeasurableSpace Observation]
    (P : Measure Observation) [IsProbabilityMeasure P] :
    HasLaw (fun z : Observation × Observation => z.1) P (P.prod P) := by
  have hcopies :=
    StatInference.ProbabilityMeasure.probability_prod_independent_self_copies
      (P := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
  simpa using hcopies.1

/--
The second coordinate on the product sample space is an independent copy with
law `P`.
-/
theorem vdVWTheorem243_productCopy_snd_hasLaw
    {Observation : Type u} [MeasurableSpace Observation]
    (P : Measure Observation) [IsProbabilityMeasure P] :
    HasLaw (fun z : Observation × Observation => z.2) P (P.prod P) := by
  have hcopies :=
    StatInference.ProbabilityMeasure.probability_prod_independent_self_copies
      (P := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
  simpa using hcopies.2.1

/--
The two coordinate copies on `P × P` are independent.
-/
theorem vdVWTheorem243_productCopy_fst_snd_indep
    {Observation : Type u} [MeasurableSpace Observation]
    (P : Measure Observation) [IsProbabilityMeasure P] :
    (fun z : Observation × Observation => z.1) ⟂ᵢ[P.prod P]
      (fun z : Observation × Observation => z.2) := by
  have hcopies :=
    StatInference.ProbabilityMeasure.probability_prod_independent_self_copies
      (P := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
  simpa using hcopies.2.2

/--
The two coordinate copies on `P × P` are identically distributed.
-/
theorem vdVWTheorem243_productCopy_fst_snd_identDistrib
    {Observation : Type u} [MeasurableSpace Observation]
    (P : Measure Observation) [IsProbabilityMeasure P] :
    IdentDistrib (fun z : Observation × Observation => z.1)
      (fun z : Observation × Observation => z.2) (P.prod P) (P.prod P) := by
  exact (vdVWTheorem243_productCopy_fst_hasLaw P).identDistrib
    (vdVWTheorem243_productCopy_snd_hasLaw P)

/--
Mapped truncated class values on the two product coordinates have the expected
marginal laws, joint product law, and independence.

This is the product-copy law package needed before the symmetrization proof
can move from raw sample copies to fixed truncated class statistics.
-/
theorem vdVWTheorem243_productCopy_truncatedClassFun_laws_indep
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (hclass : VdVWClassCoordinateMeasurable indexClass classFun)
    (henvelope : Measurable envelope)
    {index : Index} (hindex : index ∈ indexClass) :
    HasLaw
        (fun z : Observation × Observation =>
          vdVWTruncatedClassFun classFun envelope M index z.1)
        (P.map (vdVWTruncatedClassFun classFun envelope M index)) (P.prod P) ∧
      HasLaw
        (fun z : Observation × Observation =>
          vdVWTruncatedClassFun classFun envelope M index z.2)
        (P.map (vdVWTruncatedClassFun classFun envelope M index)) (P.prod P) ∧
      HasLaw
        (fun z : Observation × Observation =>
          (vdVWTruncatedClassFun classFun envelope M index z.1,
            vdVWTruncatedClassFun classFun envelope M index z.2))
        ((P.map (vdVWTruncatedClassFun classFun envelope M index)).prod
          (P.map (vdVWTruncatedClassFun classFun envelope M index)))
        (P.prod P) ∧
      (fun z : Observation × Observation =>
          vdVWTruncatedClassFun classFun envelope M index z.1) ⟂ᵢ[P.prod P]
        (fun z : Observation × Observation =>
          vdVWTruncatedClassFun classFun envelope M index z.2) := by
  have htruncMeas :
      Measurable (vdVWTruncatedClassFun classFun envelope M index) :=
    measurable_vdVWTruncatedClassFun (hclass index hindex) henvelope
  simpa using
    (StatInference.ProbabilityMeasure.probability_prod_independent_mapped_copies_with_joint_law
      (P := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (Q := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (X := vdVWTruncatedClassFun classFun envelope M index)
      (Y := vdVWTruncatedClassFun classFun envelope M index)
      htruncMeas htruncMeas)

/--
On the finite sample product space `P^n`, a fixed truncated class member
evaluated at each sample coordinate has the expected coordinate laws, joint
product law, and coordinate independence.

This is the finite-`Pi` product-law specialization needed when the
symmetrization route works directly with `SampleAt Observation n`.
-/
theorem vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (hclass : VdVWClassCoordinateMeasurable indexClass classFun)
    (henvelope : Measurable envelope)
    {index : Index} (hindex : index ∈ indexClass) (n : ℕ) :
    (∀ i : Fin n,
      HasLaw
        (fun sample : SampleAt Observation n =>
          vdVWTruncatedClassFun classFun envelope M index (sample i))
        (P.map (vdVWTruncatedClassFun classFun envelope M index))
        (vdVWProductMeasure P n)) ∧
      iIndepFun
        (fun i : Fin n => fun sample : SampleAt Observation n =>
          vdVWTruncatedClassFun classFun envelope M index (sample i))
        (vdVWProductMeasure P n) ∧
      HasLaw
        (fun sample : SampleAt Observation n => fun i : Fin n =>
          vdVWTruncatedClassFun classFun envelope M index (sample i))
        (Measure.pi fun _ : Fin n =>
          P.map (vdVWTruncatedClassFun classFun envelope M index))
        (vdVWProductMeasure P n) := by
  have htruncMeas :
      Measurable (vdVWTruncatedClassFun classFun envelope M index) :=
    measurable_vdVWTruncatedClassFun (hclass index hindex) henvelope
  simpa [vdVWProductMeasure, SampleAt] using
    (StatInference.ProbabilityMeasure.probability_pi_independent_mapped_coordinates_with_joint_law
      (P := fun _ : Fin n =>
        (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (X := fun _ : Fin n => vdVWTruncatedClassFun classFun envelope M index)
      (fun _ => htruncMeas))

/--
If a fixed truncated class member is integrable under `P`, then its
product-copy pair difference is integrable under `P × P`.

This is the fixed-index integrability gate before applying Fubini in the
Theorem 2.4.3 symmetrization route.
-/
theorem integrable_vdVWTruncatedClassFun_pairDifference
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {classFun : Index -> Observation -> ℝ} {envelope : Observation -> ℝ}
    {M : ℝ} {index : Index}
    (htruncIntegrable :
      Integrable (vdVWTruncatedClassFun classFun envelope M index) P) :
    Integrable
      (fun z : Observation × Observation =>
        vdVWTruncatedClassFun classFun envelope M index z.1 -
          vdVWTruncatedClassFun classFun envelope M index z.2)
      (P.prod P) := by
  let f : Observation -> ℝ := vdVWTruncatedClassFun classFun envelope M index
  have hfst : Integrable (fun z : Observation × Observation => f z.1) (P.prod P) := by
    simpa [Function.comp_def, f] using
      (MeasureTheory.measurePreserving_fst (μ := P) (ν := P)).integrable_comp_of_integrable
        htruncIntegrable
  have hsnd : Integrable (fun z : Observation × Observation => f z.2) (P.prod P) := by
    simpa [Function.comp_def, f] using
      (MeasureTheory.measurePreserving_snd (μ := P) (ν := P)).integrable_comp_of_integrable
        htruncIntegrable
  exact hfst.sub hsnd

/--
The product-copy pair difference of a fixed integrable truncated class member
has mean zero under `P × P`.

This is the centered ghost-copy/Fubini bridge used in the
`Phi(x)=x` symmetrization route for Theorem 2.4.3.
-/
theorem integral_vdVWTruncatedClassFun_productCopy_pairDifference_eq_zero
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {classFun : Index -> Observation -> ℝ} {envelope : Observation -> ℝ}
    {M : ℝ} {index : Index}
    (htruncIntegrable :
      Integrable (vdVWTruncatedClassFun classFun envelope M index) P) :
    ∫ z : Observation × Observation,
        vdVWTruncatedClassFun classFun envelope M index z.1 -
          vdVWTruncatedClassFun classFun envelope M index z.2 ∂(P.prod P) =
      0 := by
  exact
    StatInference.ProbabilityMeasure.probability_integral_prod_fst_sub_snd_eq_zero
      (μ := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (f := vdVWTruncatedClassFun classFun envelope M index)
      htruncIntegrable

/--
Finite product-sample weighted sums of a centered product-copy pair difference
have mean zero.

This is the sample-level Fubini bridge needed before the final
`Phi(x)=x` symmetrization inequality: each coordinate contributes an
independent centered copy-difference, and a finite weighted sum preserves the
zero expectation.
-/
theorem integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {classFun : Index -> Observation -> ℝ} {envelope : Observation -> ℝ}
    {M : ℝ} {index : Index} {n : ℕ}
    (weights : Fin n -> ℝ)
    (htruncIntegrable :
      Integrable (vdVWTruncatedClassFun classFun envelope M index) P) :
    ∫ sample : SampleAt (Observation × Observation) n,
        vdVWWeightedSampleSum
          (fun index : Index => fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.1 -
              vdVWTruncatedClassFun classFun envelope M index z.2)
          weights index sample ∂(vdVWProductMeasure (P.prod P) n) =
      0 := by
  simpa [SampleAt, vdVWProductMeasure, vdVWWeightedSampleSum] using
    (StatInference.ProbabilityMeasure.probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero
      (P := (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (f := vdVWTruncatedClassFun classFun envelope M index)
      weights htruncIntegrable)

/--
The coordinate-splitting map sends the product sample measure `(P × P)^n` to
the product of the original-sample and ghost-sample measures `P^n × P^n`.

This is the VdV&W specialization of the reusable finite-product projection
wrapper and is the projection/Fubini handoff needed by the remaining
symmetrization assembly.
-/
theorem measurePreserving_vdVWProductMeasure_prod_to_original_ghost
    {Observation : Type u} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P] {n : ℕ} :
    MeasurePreserving
      (fun sample : SampleAt (Observation × Observation) n =>
        (fun i : Fin n => (sample i).1, fun i : Fin n => (sample i).2))
      (vdVWProductMeasure (P.prod P) n)
      ((vdVWProductMeasure P n).prod (vdVWProductMeasure P n)) := by
  simpa [SampleAt, vdVWProductMeasure] using
    (StatInference.ProbabilityMeasure.probability_pi_prod_coordinates_measurePreserving
      (P := fun _ : Fin n =>
        (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (Q := fun _ : Fin n =>
        (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation)))

/--
Conditional finite-product ghost-copy identity for one fixed truncated class
member and one fixed original sample.

This is the VdV&W specialization of the reusable finite-`Pi` Fubini wrapper:
integrating over only the ghost sample turns the ghost coordinates into their
`P`-means while keeping the original sample fixed.
-/
theorem integral_vdVWTruncatedClassFun_productSample_const_sub_eq
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {classFun : Index -> Observation -> ℝ} {envelope : Observation -> ℝ}
    {M : ℝ} {index : Index} {n : ℕ}
    (weights : Fin n -> ℝ) (sample : SampleAt Observation n)
    (htruncIntegrable :
      Integrable (vdVWTruncatedClassFun classFun envelope M index) P) :
    ∫ ghostSample : SampleAt Observation n,
        (∑ i : Fin n,
          weights i *
            (vdVWTruncatedClassFun classFun envelope M index (sample i) -
              vdVWTruncatedClassFun classFun envelope M index (ghostSample i)))
          ∂(vdVWProductMeasure P n) =
      vdVWWeightedSampleSum
        (fun index : Index => fun observation : Observation =>
          vdVWTruncatedClassFun classFun envelope M index observation -
            ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P)
        weights index sample := by
  simpa [SampleAt, vdVWProductMeasure, vdVWWeightedSampleSum] using
    (StatInference.ProbabilityMeasure.probability_pi_integral_weighted_sum_const_sub
      (P := fun _ : Fin n =>
        (⟨P, inferInstance⟩ : MeasureTheory.ProbabilityMeasure Observation))
      (f := fun _ : Fin n => vdVWTruncatedClassFun classFun envelope M index)
      (weights := weights) sample
      (fun _ => htruncIntegrable))

/--
Fixed-sample `Phi(x)=x` ghost-copy comparison for the centered truncated
weighted supremum.

For a supplied integrable product-copy supremum, the centered empirical
supremum is bounded by the ghost-sample expectation of the pair-difference
supremum.  This is the theorem-local Jensen/Fubini handoff needed before
feeding the random-sign finite-net bound.
-/
theorem
    vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ} {n : ℕ}
    (weights : Fin n -> ℝ) (sample : SampleAt Observation n)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M)
    (htruncIntegrable :
      ∀ index, index ∈ indexClass ->
        Integrable (vdVWTruncatedClassFun classFun envelope M index) P)
    (hpairSupIntegrable :
      Integrable
        (fun ghostSample : SampleAt Observation n =>
          vdVWWeightedClassSupremum indexClass
            (fun index : Index => fun z : Observation × Observation =>
              vdVWTruncatedClassFun classFun envelope M index z.1 -
                vdVWTruncatedClassFun classFun envelope M index z.2)
            weights (fun i : Fin n => (sample i, ghostSample i)))
        (vdVWProductMeasure P n)) :
    vdVWWeightedClassSupremum indexClass
        (fun index : Index => fun observation : Observation =>
          vdVWTruncatedClassFun classFun envelope M index observation -
            ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P)
        weights sample ≤
      ∫ ghostSample : SampleAt Observation n,
        vdVWWeightedClassSupremum indexClass
          (fun index : Index => fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.1 -
              vdVWTruncatedClassFun classFun envelope M index z.2)
          weights (fun i : Fin n => (sample i, ghostSample i))
          ∂(vdVWProductMeasure P n) := by
  let centeredClassFun : Index -> Observation -> ℝ :=
    fun index observation =>
      vdVWTruncatedClassFun classFun envelope M index observation -
        ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P
  let pairDifferenceClassFun : Index -> Observation × Observation -> ℝ :=
    fun index z =>
      vdVWTruncatedClassFun classFun envelope M index z.1 -
        vdVWTruncatedClassFun classFun envelope M index z.2
  let pairSup : SampleAt Observation n -> ℝ :=
    fun ghostSample =>
      vdVWWeightedClassSupremum indexClass pairDifferenceClassFun weights
        (fun i : Fin n => (sample i, ghostSample i))
  have hpairBound :
      ∀ index, index ∈ indexClass -> ∀ z : Observation × Observation,
        |pairDifferenceClassFun index z| ≤ 2 * M := by
    intro index hindex z
    calc
      |pairDifferenceClassFun index z|
          =
            |vdVWTruncatedClassFun classFun envelope M index z.1 -
              vdVWTruncatedClassFun classFun envelope M index z.2| := by
            rfl
      _ ≤
          |vdVWTruncatedClassFun classFun envelope M index z.1| +
            |vdVWTruncatedClassFun classFun envelope M index z.2| :=
          abs_sub _ _
      _ ≤ M + M := by
          exact add_le_add
            (abs_vdVWTruncatedClassFun_le_M henvelope hM_nonneg hindex z.1)
            (abs_vdVWTruncatedClassFun_le_M henvelope hM_nonneg hindex z.2)
      _ = 2 * M := by ring
  have hrhs_nonneg :
      0 ≤ ∫ ghostSample : SampleAt Observation n,
        pairSup ghostSample ∂(vdVWProductMeasure P n) := by
    apply integral_nonneg
    intro ghostSample
    exact
      vdVWWeightedClassSupremum_nonneg indexClass pairDifferenceClassFun
        weights (fun i : Fin n => (sample i, ghostSample i))
  change
    (⨆ index : Index, ⨆ (_ : index ∈ indexClass),
      |vdVWWeightedSampleSum centeredClassFun weights index sample|) ≤
      ∫ ghostSample : SampleAt Observation n,
        pairSup ghostSample ∂(vdVWProductMeasure P n)
  apply Real.iSup_le
  · intro index
    apply Real.iSup_le
    · intro hindex
      let ghostSum : SampleAt Observation n -> ℝ :=
        fun ghostSample =>
          ∑ i : Fin n,
            weights i *
              (vdVWTruncatedClassFun classFun envelope M index (sample i) -
                vdVWTruncatedClassFun classFun envelope M index (ghostSample i))
      have hidentity :
          ∫ ghostSample : SampleAt Observation n,
              ghostSum ghostSample ∂(vdVWProductMeasure P n) =
            vdVWWeightedSampleSum centeredClassFun weights index sample := by
        simpa [centeredClassFun, ghostSum] using
          (integral_vdVWTruncatedClassFun_productSample_const_sub_eq
            (P := P) (classFun := classFun) (envelope := envelope)
            (M := M) (index := index) weights sample
            (htruncIntegrable index hindex))
      calc
        |vdVWWeightedSampleSum centeredClassFun weights index sample|
            =
              |∫ ghostSample : SampleAt Observation n,
                ghostSum ghostSample ∂(vdVWProductMeasure P n)| := by
              rw [hidentity]
        _ ≤
            ∫ ghostSample : SampleAt Observation n,
              |ghostSum ghostSample| ∂(vdVWProductMeasure P n) :=
              abs_integral_le_integral_abs
        _ ≤
            ∫ ghostSample : SampleAt Observation n,
              pairSup ghostSample ∂(vdVWProductMeasure P n) := by
              refine integral_mono_of_nonneg
                (ae_of_all _ fun ghostSample => abs_nonneg (ghostSum ghostSample))
                hpairSupIntegrable
                (ae_of_all _ fun ghostSample => ?_)
              have hbdd :
                  BddAbove
                    (vdVWWeightedClassValueSet indexClass pairDifferenceClassFun
                      weights (fun i : Fin n => (sample i, ghostSample i))) :=
                bddAbove_vdVWWeightedClassValueSet_of_uniform_bound
                  weights (fun i : Fin n => (sample i, ghostSample i))
                  (bound := 2 * M) hpairBound
              have hterm :
                  |vdVWWeightedSampleSum pairDifferenceClassFun weights index
                      (fun i : Fin n => (sample i, ghostSample i))| ≤
                    pairSup ghostSample :=
                abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove
                  (classFun := pairDifferenceClassFun) (weights := weights)
                  (sample := fun i : Fin n => (sample i, ghostSample i))
                  hbdd hindex
              simpa [pairSup, pairDifferenceClassFun, ghostSum] using hterm
    · exact hrhs_nonneg
  · exact hrhs_nonneg

/--
Product-sample integral lift of the fixed-sample `Phi(x)=x` ghost-copy
comparison.

This is the next Fubini-compatible handoff: once the fixed original sample
comparison is available for every sample, ordinary integral monotonicity lifts
it to an expectation over `P^n`.
-/
theorem
    integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation} [IsProbabilityMeasure P]
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ} {n : ℕ}
    (weights : Fin n -> ℝ)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M)
    (htruncIntegrable :
      ∀ index, index ∈ indexClass ->
        Integrable (vdVWTruncatedClassFun classFun envelope M index) P)
    (hpairSupIntegrable :
      ∀ sample : SampleAt Observation n,
        Integrable
          (fun ghostSample : SampleAt Observation n =>
            vdVWWeightedClassSupremum indexClass
              (fun index : Index => fun z : Observation × Observation =>
                vdVWTruncatedClassFun classFun envelope M index z.1 -
                  vdVWTruncatedClassFun classFun envelope M index z.2)
              weights (fun i : Fin n => (sample i, ghostSample i)))
          (vdVWProductMeasure P n))
    (hcenteredSupIntegrable :
      Integrable
        (fun sample : SampleAt Observation n =>
          vdVWWeightedClassSupremum indexClass
            (fun index : Index => fun observation : Observation =>
              vdVWTruncatedClassFun classFun envelope M index observation -
                ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P)
            weights sample)
        (vdVWProductMeasure P n))
    (hghostExpectationIntegrable :
      Integrable
        (fun sample : SampleAt Observation n =>
          ∫ ghostSample : SampleAt Observation n,
            vdVWWeightedClassSupremum indexClass
              (fun index : Index => fun z : Observation × Observation =>
                vdVWTruncatedClassFun classFun envelope M index z.1 -
                  vdVWTruncatedClassFun classFun envelope M index z.2)
              weights (fun i : Fin n => (sample i, ghostSample i))
              ∂(vdVWProductMeasure P n))
        (vdVWProductMeasure P n)) :
    ∫ sample : SampleAt Observation n,
        vdVWWeightedClassSupremum indexClass
          (fun index : Index => fun observation : Observation =>
            vdVWTruncatedClassFun classFun envelope M index observation -
              ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P)
          weights sample ∂(vdVWProductMeasure P n) ≤
      ∫ sample : SampleAt Observation n,
        ∫ ghostSample : SampleAt Observation n,
          vdVWWeightedClassSupremum indexClass
            (fun index : Index => fun z : Observation × Observation =>
              vdVWTruncatedClassFun classFun envelope M index z.1 -
                vdVWTruncatedClassFun classFun envelope M index z.2)
            weights (fun i : Fin n => (sample i, ghostSample i))
            ∂(vdVWProductMeasure P n) ∂(vdVWProductMeasure P n) := by
  exact
    integral_mono_ae hcenteredSupIntegrable hghostExpectationIntegrable
      (ae_of_all _ fun sample =>
        vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum
          weights sample henvelope hM_nonneg htruncIntegrable
          (hpairSupIntegrable sample))

/--
The weighted supremum of product-copy pair differences is bounded by the sum
of the two coordinate suprema.

This is the deterministic triangle-inequality split used in the
`Phi(x)=x` symmetrization route after the centered product-copy/Fubini step.
-/
theorem vdVWWeightedClassSupremum_pairDifference_le_add
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {weights : Fin n -> ℝ}
    (sample : SampleAt (Observation × Observation) n)
    (hbdd_fst :
      BddAbove
        (vdVWWeightedClassValueSet indexClass classFun weights
          (fun i : Fin n => (sample i).1)))
    (hbdd_snd :
      BddAbove
        (vdVWWeightedClassValueSet indexClass classFun (fun i : Fin n => -weights i)
          (fun i : Fin n => (sample i).2))) :
    vdVWWeightedClassSupremum indexClass
        (fun index : Index => fun z : Observation × Observation =>
          classFun index z.1 - classFun index z.2)
        weights sample ≤
      vdVWWeightedClassSupremum indexClass classFun weights
        (fun i : Fin n => (sample i).1) +
      vdVWWeightedClassSupremum indexClass classFun (fun i : Fin n => -weights i)
        (fun i : Fin n => (sample i).2) := by
  have hrhs_nonneg :
      0 ≤
        vdVWWeightedClassSupremum indexClass classFun weights
            (fun i : Fin n => (sample i).1) +
          vdVWWeightedClassSupremum indexClass classFun
            (fun i : Fin n => -weights i) (fun i : Fin n => (sample i).2) :=
    add_nonneg
      (vdVWWeightedClassSupremum_nonneg indexClass classFun weights
        (fun i : Fin n => (sample i).1))
      (vdVWWeightedClassSupremum_nonneg indexClass classFun
        (fun i : Fin n => -weights i) (fun i : Fin n => (sample i).2))
  change
    (⨆ index : Index, ⨆ (_ : index ∈ indexClass),
      |vdVWWeightedSampleSum
        (fun index : Index => fun z : Observation × Observation =>
          classFun index z.1 - classFun index z.2)
        weights index sample|) ≤
      vdVWWeightedClassSupremum indexClass classFun weights
        (fun i : Fin n => (sample i).1) +
      vdVWWeightedClassSupremum indexClass classFun (fun i : Fin n => -weights i)
        (fun i : Fin n => (sample i).2)
  apply Real.iSup_le
  · intro index
    apply Real.iSup_le
    · intro hindex
      let leftSum :=
        vdVWWeightedSampleSum
          (fun index : Index => fun z : Observation × Observation =>
            classFun index z.1 - classFun index z.2)
          weights index sample
      let fstSum :=
        vdVWWeightedSampleSum classFun weights index
          (fun i : Fin n => (sample i).1)
      let sndSum :=
        vdVWWeightedSampleSum classFun (fun i : Fin n => -weights i) index
          (fun i : Fin n => (sample i).2)
      have hsplit : leftSum = fstSum + sndSum := by
        unfold leftSum fstSum sndSum vdVWWeightedSampleSum
        rw [← Finset.sum_add_distrib]
        exact Finset.sum_congr rfl fun i _hi => by ring
      calc
        |leftSum| = |fstSum + sndSum| := by rw [hsplit]
        _ ≤ |fstSum| + |sndSum| := abs_add_le fstSum sndSum
        _ ≤
            vdVWWeightedClassSupremum indexClass classFun weights
                (fun i : Fin n => (sample i).1) +
              vdVWWeightedClassSupremum indexClass classFun
                (fun i : Fin n => -weights i) (fun i : Fin n => (sample i).2) := by
              exact add_le_add
                (abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove
                  (classFun := classFun) (weights := weights)
                  (sample := fun i : Fin n => (sample i).1) hbdd_fst hindex)
                (abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove
                  (classFun := classFun) (weights := fun i : Fin n => -weights i)
                  (sample := fun i : Fin n => (sample i).2) hbdd_snd hindex)
    · exact hrhs_nonneg
  · exact hrhs_nonneg

/--
Truncated-class specialization of the pair-difference split.

The envelope bound supplies the bounded-value-set side conditions required by
the real-valued supremum API.
-/
theorem vdVWWeightedClassSupremum_truncated_pairDifference_le_add
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ} {weights : Fin n -> ℝ}
    (sample : SampleAt (Observation × Observation) n)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M) :
    vdVWWeightedClassSupremum indexClass
        (fun index : Index => fun z : Observation × Observation =>
          vdVWTruncatedClassFun classFun envelope M index z.1 -
            vdVWTruncatedClassFun classFun envelope M index z.2)
        weights sample ≤
      vdVWWeightedClassSupremum indexClass
        (vdVWTruncatedClassFun classFun envelope M) weights
        (fun i : Fin n => (sample i).1) +
      vdVWWeightedClassSupremum indexClass
        (vdVWTruncatedClassFun classFun envelope M) (fun i : Fin n => -weights i)
        (fun i : Fin n => (sample i).2) := by
  refine
    vdVWWeightedClassSupremum_pairDifference_le_add
      (indexClass := indexClass)
      (classFun := vdVWTruncatedClassFun classFun envelope M)
      (weights := weights) sample ?_ ?_
  · exact
      bddAbove_vdVWWeightedClassValueSet_of_uniform_bound
        weights (fun i : Fin n => (sample i).1) (bound := M)
        (fun index hindex observation =>
          abs_vdVWTruncatedClassFun_le_M henvelope hM_nonneg hindex observation)
  · exact
      bddAbove_vdVWWeightedClassValueSet_of_uniform_bound
        (fun i : Fin n => -weights i) (fun i : Fin n => (sample i).2)
        (bound := M)
        (fun index hindex observation =>
          abs_vdVWTruncatedClassFun_le_M henvelope hM_nonneg hindex observation)

/--
Integrated product-sample version of the envelope-bounded pair-difference
split.

This packages the integral-monotonicity step that converts the deterministic
pair split into the expectation-level comparison needed for the remaining
symmetrization assembly.
-/
theorem
    integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ} {n : ℕ}
    (weights : Fin n -> ℝ)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M)
    (hpairSupIntegrable :
      Integrable
        (fun sample : SampleAt (Observation × Observation) n =>
          vdVWWeightedClassSupremum indexClass
            (fun index : Index => fun z : Observation × Observation =>
              vdVWTruncatedClassFun classFun envelope M index z.1 -
                vdVWTruncatedClassFun classFun envelope M index z.2)
            weights sample)
        (vdVWProductMeasure (P.prod P) n))
    (hfstSupIntegrable :
      Integrable
        (fun sample : SampleAt (Observation × Observation) n =>
          vdVWWeightedClassSupremum indexClass
            (vdVWTruncatedClassFun classFun envelope M) weights
            (fun i : Fin n => (sample i).1))
        (vdVWProductMeasure (P.prod P) n))
    (hsndSupIntegrable :
      Integrable
        (fun sample : SampleAt (Observation × Observation) n =>
          vdVWWeightedClassSupremum indexClass
            (vdVWTruncatedClassFun classFun envelope M) (fun i : Fin n => -weights i)
            (fun i : Fin n => (sample i).2))
        (vdVWProductMeasure (P.prod P) n)) :
    ∫ sample : SampleAt (Observation × Observation) n,
        vdVWWeightedClassSupremum indexClass
          (fun index : Index => fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.1 -
              vdVWTruncatedClassFun classFun envelope M index z.2)
          weights sample ∂(vdVWProductMeasure (P.prod P) n) ≤
      (∫ sample : SampleAt (Observation × Observation) n,
        vdVWWeightedClassSupremum indexClass
          (vdVWTruncatedClassFun classFun envelope M) weights
          (fun i : Fin n => (sample i).1) ∂(vdVWProductMeasure (P.prod P) n)) +
        ∫ sample : SampleAt (Observation × Observation) n,
          vdVWWeightedClassSupremum indexClass
            (vdVWTruncatedClassFun classFun envelope M) (fun i : Fin n => -weights i)
            (fun i : Fin n => (sample i).2) ∂(vdVWProductMeasure (P.prod P) n) := by
  calc
    ∫ sample : SampleAt (Observation × Observation) n,
        vdVWWeightedClassSupremum indexClass
          (fun index : Index => fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.1 -
              vdVWTruncatedClassFun classFun envelope M index z.2)
          weights sample ∂(vdVWProductMeasure (P.prod P) n)
        ≤
          ∫ sample : SampleAt (Observation × Observation) n,
            (vdVWWeightedClassSupremum indexClass
                (vdVWTruncatedClassFun classFun envelope M) weights
                (fun i : Fin n => (sample i).1) +
              vdVWWeightedClassSupremum indexClass
                (vdVWTruncatedClassFun classFun envelope M) (fun i : Fin n => -weights i)
                (fun i : Fin n => (sample i).2)) ∂(vdVWProductMeasure (P.prod P) n) := by
          exact
            integral_mono_ae hpairSupIntegrable
              (hfstSupIntegrable.add hsndSupIntegrable)
              (ae_of_all _ fun sample =>
                vdVWWeightedClassSupremum_truncated_pairDifference_le_add
                  sample henvelope hM_nonneg)
    _ =
          (∫ sample : SampleAt (Observation × Observation) n,
            vdVWWeightedClassSupremum indexClass
              (vdVWTruncatedClassFun classFun envelope M) weights
              (fun i : Fin n => (sample i).1) ∂(vdVWProductMeasure (P.prod P) n)) +
            ∫ sample : SampleAt (Observation × Observation) n,
              vdVWWeightedClassSupremum indexClass
                (vdVWTruncatedClassFun classFun envelope M) (fun i : Fin n => -weights i)
                (fun i : Fin n => (sample i).2) ∂(vdVWProductMeasure (P.prod P) n) := by
          rw [integral_add hfstSupIntegrable hsndSupIntegrable]

/-!
## Fixed-sample empirical net handoff
-/

/--
If all sample weights have absolute value at most `1 / n`, then the difference
between two weighted sample sums is controlled by their empirical `L1(P_n)`
distance.

This is the deterministic algebraic core behind the finite-net display
`(2.4.4)` in the proof of VdV&W Theorem 2.4.3.
-/
theorem abs_vdVWWeightedSampleSum_sub_le_empiricalL1Distance_of_abs_weight_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {classFun : Index -> Observation -> ℝ}
    {weights : Fin n -> ℝ}
    (hweights : ∀ i, |weights i| ≤ (n : ℝ)⁻¹)
    (index center : Index) :
    |vdVWWeightedSampleSum classFun weights index sample -
        vdVWWeightedSampleSum classFun weights center sample| ≤
      empiricalL1Distance sample (classFun index) (classFun center) := by
  unfold vdVWWeightedSampleSum empiricalL1Distance empiricalAverage
  have hsub :
      (∑ i : Fin n, weights i * classFun index (sample i)) -
          (∑ i : Fin n, weights i * classFun center (sample i)) =
        ∑ i : Fin n,
          weights i *
            (classFun index (sample i) - classFun center (sample i)) := by
    rw [← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl fun i _hi => by ring
  rw [hsub]
  calc
    |∑ i : Fin n,
        weights i * (classFun index (sample i) - classFun center (sample i))|
        ≤
      ∑ i : Fin n,
        |weights i * (classFun index (sample i) - classFun center (sample i))| := by
        simpa using
          (Finset.abs_sum_le_sum_abs
            (fun i : Fin n =>
              weights i *
                (classFun index (sample i) - classFun center (sample i)))
            (Finset.univ : Finset (Fin n)))
    _ =
      ∑ i : Fin n,
        |weights i| * |classFun index (sample i) - classFun center (sample i)| := by
        simp [abs_mul]
    _ ≤
      ∑ i : Fin n,
        (n : ℝ)⁻¹ * |classFun index (sample i) - classFun center (sample i)| := by
        exact Finset.sum_le_sum fun i _hi =>
          mul_le_mul_of_nonneg_right (hweights i) (abs_nonneg _)
    _ =
      (∑ i : Fin n, |classFun index (sample i) - classFun center (sample i)|) /
        (n : ℝ) := by
        rw [← Finset.mul_sum, inv_mul_eq_div]

/--
Finite empirical `L1(P_n)` nets control the VdV&W weighted class supremum once
the finitely many net-center sums are controlled.

This specializes the earlier finite-metric-cover supremum handoff to the
random empirical metric used in VdV&W Theorem 2.4.3, display `(2.4.4)`.
-/
theorem vdVWWeightedClassSupremum_le_upper_add_of_finiteEmpiricalL1CoverAtCard
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon upper : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    {weights : Fin n -> ℝ}
    (hweights : ∀ i, |weights i| ≤ (n : ℝ)⁻¹)
    (hepsilon_nonneg : 0 ≤ epsilon)
    (hupper_nonneg : 0 ≤ upper)
    (hupper :
      ∀ centerIndex : Fin cardinality,
        |vdVWWeightedSampleSum classFun weights (cover.center centerIndex) sample| ≤
          upper) :
    vdVWWeightedClassSupremum indexClass classFun weights sample ≤
      upper + epsilon := by
  have htarget_nonneg : 0 ≤ upper + epsilon :=
    add_nonneg hupper_nonneg hepsilon_nonneg
  unfold vdVWWeightedClassSupremum
  apply Real.iSup_le
  · intro index
    apply Real.iSup_le
    · intro hindex
      let centerIndex := cover.centerOf index hindex
      let targetSum := vdVWWeightedSampleSum classFun weights index sample
      let centerSum :=
        vdVWWeightedSampleSum classFun weights (cover.center centerIndex) sample
      have hdecomp : centerSum + (targetSum - centerSum) = targetSum := by ring
      have hcontrol : |targetSum - centerSum| ≤ epsilon := by
        exact
          (abs_vdVWWeightedSampleSum_sub_le_empiricalL1Distance_of_abs_weight_le
            (sample := sample) (classFun := classFun) hweights index
            (cover.center centerIndex)).trans
            (cover.dist_le index hindex)
      calc
        |targetSum| = |centerSum + (targetSum - centerSum)| :=
          (congrArg abs hdecomp).symm
        _ ≤ |centerSum| + |targetSum - centerSum| :=
          abs_add_le centerSum (targetSum - centerSum)
        _ ≤ upper + epsilon := add_le_add (hupper centerIndex) hcontrol
    · exact htarget_nonneg
  · exact htarget_nonneg

/-!
## Finite-center maximal-inequality handoff
-/

/--
The finite weighted supremum over the empirical-net centers, the formal
counterpart of the finite class `G` in display `(2.4.4)`.
-/
noncomputable def vdVWFiniteCenterWeightedSupremum
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ) {cardinality : ℕ}
    (center : Fin cardinality -> Index)
    (weights : Fin n -> ℝ) : ℝ :=
  ⨆ centerIndex : Fin cardinality,
    |vdVWWeightedSampleSum classFun weights (center centerIndex) sample|

/-- The finite-center weighted supremum is nonnegative. -/
theorem vdVWFiniteCenterWeightedSupremum_nonneg
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ) {cardinality : ℕ}
    (center : Fin cardinality -> Index)
    (weights : Fin n -> ℝ) :
    0 ≤ vdVWFiniteCenterWeightedSupremum sample classFun center weights := by
  unfold vdVWFiniteCenterWeightedSupremum
  exact Real.iSup_nonneg fun centerIndex =>
    abs_nonneg (vdVWWeightedSampleSum classFun weights (center centerIndex) sample)

/-- Each center sum is bounded by the finite-center weighted supremum. -/
theorem abs_vdVWWeightedSampleSum_center_le_finiteCenterWeightedSupremum
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {classFun : Index -> Observation -> ℝ} {cardinality : ℕ}
    (center : Fin cardinality -> Index)
    (weights : Fin n -> ℝ) (centerIndex : Fin cardinality) :
    |vdVWWeightedSampleSum classFun weights (center centerIndex) sample| ≤
      vdVWFiniteCenterWeightedSupremum sample classFun center weights := by
  unfold vdVWFiniteCenterWeightedSupremum
  have hbdd :
      BddAbove
        (Set.range fun centerIndex : Fin cardinality =>
          |vdVWWeightedSampleSum classFun weights (center centerIndex) sample|) :=
    Finite.bddAbove_range _
  exact le_ciSup hbdd centerIndex

/--
Empirical `L1(P_n)` nets reduce the full weighted class supremum to the
finite-center weighted supremum plus the net radius.

This is the deterministic fixed-sample version of the finite-class `G`
handoff in VdV&W display `(2.4.4)`.
-/
theorem
    vdVWWeightedClassSupremum_le_finiteCenterWeightedSupremum_add_of_finiteEmpiricalL1CoverAtCard
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    {weights : Fin n -> ℝ}
    (hweights : ∀ i, |weights i| ≤ (n : ℝ)⁻¹)
    (hepsilon_nonneg : 0 ≤ epsilon) :
    vdVWWeightedClassSupremum indexClass classFun weights sample ≤
      vdVWFiniteCenterWeightedSupremum sample classFun cover.center weights +
        epsilon := by
  exact
    vdVWWeightedClassSupremum_le_upper_add_of_finiteEmpiricalL1CoverAtCard
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (epsilon := epsilon)
      (upper := vdVWFiniteCenterWeightedSupremum sample classFun cover.center weights)
      cover hweights hepsilon_nonneg
      (vdVWFiniteCenterWeightedSupremum_nonneg sample classFun cover.center weights)
      (abs_vdVWWeightedSampleSum_center_le_finiteCenterWeightedSupremum cover.center weights)

/--
The book-shaped maximal-inequality upper bound for a finite empirical net:
`sqrt(1 + log #G)` times a supplied center scale.

The later Orlicz/Hoeffding layer is responsible for proving the supplied center
scale, for example the conditional `psi_2`/Hoeffding scale in the proof of
VdV&W Theorem 2.4.3.
-/
noncomputable def vdVWTheorem243FiniteNetMaximalUpper
    (cardinality : ℕ) (centerScale : ℝ) : ℝ :=
  Real.sqrt (1 + Real.log ((cardinality : ℝ) + 1)) * centerScale

/-- The finite-net maximal upper bound is nonnegative when the center scale is. -/
theorem vdVWTheorem243FiniteNetMaximalUpper_nonneg
    (cardinality : ℕ) {centerScale : ℝ}
    (hcenterScale_nonneg : 0 ≤ centerScale) :
    0 ≤ vdVWTheorem243FiniteNetMaximalUpper cardinality centerScale := by
  unfold vdVWTheorem243FiniteNetMaximalUpper
  exact mul_nonneg (Real.sqrt_nonneg _) hcenterScale_nonneg

/--
Proof-carrying output of the finite-center maximal-inequality step.

This records that every supplied net center is bounded by the
`sqrt(1 + log #G)` maximal-inequality expression.  The exact Orlicz and
Hoeffding proof of this predicate is the next theorem-line layer.
-/
def VdVWTheorem243FiniteCenterMaximalBound
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ) {cardinality : ℕ}
    (center : Fin cardinality -> Index)
    (weights : Fin n -> ℝ) (centerScale : ℝ) : Prop :=
  ∀ centerIndex : Fin cardinality,
    |vdVWWeightedSampleSum classFun weights (center centerIndex) sample| ≤
      vdVWTheorem243FiniteNetMaximalUpper cardinality centerScale

/--
The finite-center maximal-inequality output plugs into the empirical-net
display `(2.4.4)`.

This is still a local theorem layer, not the exact Theorem 2.4.3: it assumes
the maximal-inequality center bound and only performs the deterministic
finite-net handoff.
-/
theorem
    vdVWWeightedClassSupremum_le_finiteNetMaximalUpper_add_of_finiteEmpiricalL1CoverAtCard
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon centerScale : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    {weights : Fin n -> ℝ}
    (hweights : ∀ i, |weights i| ≤ (n : ℝ)⁻¹)
    (hepsilon_nonneg : 0 ≤ epsilon)
    (hcenterScale_nonneg : 0 ≤ centerScale)
    (hmaximal :
      VdVWTheorem243FiniteCenterMaximalBound sample classFun cover.center weights
        centerScale) :
    vdVWWeightedClassSupremum indexClass classFun weights sample ≤
      vdVWTheorem243FiniteNetMaximalUpper cardinality centerScale + epsilon := by
  exact
    vdVWWeightedClassSupremum_le_upper_add_of_finiteEmpiricalL1CoverAtCard
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (epsilon := epsilon)
      (upper := vdVWTheorem243FiniteNetMaximalUpper cardinality centerScale)
      cover hweights hepsilon_nonneg
      (vdVWTheorem243FiniteNetMaximalUpper_nonneg cardinality hcenterScale_nonneg)
      hmaximal

/-- The Hoeffding center scale appearing after the `psi_2` step in Theorem 2.4.3. -/
noncomputable def vdVWTheorem243HoeffdingCenterScale (n : ℕ) (M : ℝ) : ℝ :=
  Real.sqrt (6 / (n : ℝ)) * M

/-- The Hoeffding center scale is nonnegative for nonnegative envelopes. -/
theorem vdVWTheorem243HoeffdingCenterScale_nonneg
    (n : ℕ) {M : ℝ} (hM_nonneg : 0 ≤ M) :
    0 ≤ vdVWTheorem243HoeffdingCenterScale n M := by
  unfold vdVWTheorem243HoeffdingCenterScale
  exact mul_nonneg (Real.sqrt_nonneg _) hM_nonneg

/-- The combined finite-net upper bound after the Hoeffding scale is supplied. -/
noncomputable def vdVWTheorem243FiniteNetHoeffdingUpper
    (cardinality n : ℕ) (M : ℝ) : ℝ :=
  vdVWTheorem243FiniteNetMaximalUpper cardinality
    (vdVWTheorem243HoeffdingCenterScale n M)

/--
Hoeffding-scale specialization of the finite-center maximal handoff for
Theorem 2.4.3.

The remaining probabilistic work is to prove the `hmaximal` hypothesis from
Rademacher signs, Orlicz/`psi_2`, and mathlib's sub-Gaussian/Hoeffding APIs.
-/
theorem
    vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_finiteEmpiricalL1CoverAtCard
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon M : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    {weights : Fin n -> ℝ}
    (hweights : ∀ i, |weights i| ≤ (n : ℝ)⁻¹)
    (hepsilon_nonneg : 0 ≤ epsilon)
    (hM_nonneg : 0 ≤ M)
    (hmaximal :
      VdVWTheorem243FiniteCenterMaximalBound sample classFun cover.center weights
        (vdVWTheorem243HoeffdingCenterScale n M)) :
    vdVWWeightedClassSupremum indexClass classFun weights sample ≤
      vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M + epsilon := by
  exact
    vdVWWeightedClassSupremum_le_finiteNetMaximalUpper_add_of_finiteEmpiricalL1CoverAtCard
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (epsilon := epsilon)
      (centerScale := vdVWTheorem243HoeffdingCenterScale n M)
      cover hweights hepsilon_nonneg
      (vdVWTheorem243HoeffdingCenterScale_nonneg n hM_nonneg) hmaximal

/-!
## Rademacher-sign specialization
-/

/-- The fair Bernoulli PMF used to generate textbook Rademacher signs. -/
noncomputable def vdVWRademacherBoolPMF : PMF Bool :=
  PMF.bernoulli (1 / 2 : ℝ≥0) (by norm_num)

/-- The Bool-to-real sign map sending the Bernoulli outcome to `±1`. -/
def vdVWBoolToRademacherSign (b : Bool) : ℝ :=
  cond b (1 : ℝ) (-1)

/-- The probability law of the fair Bernoulli source for Rademacher signs. -/
noncomputable def vdVWRademacherBoolLaw : Measure Bool :=
  vdVWRademacherBoolPMF.toMeasure

instance : IsProbabilityMeasure vdVWRademacherBoolLaw := by
  unfold vdVWRademacherBoolLaw vdVWRademacherBoolPMF
  infer_instance

/-- The Bool-to-real Rademacher sign map is measurable. -/
theorem measurable_vdVWBoolToRademacherSign :
    Measurable vdVWBoolToRademacherSign := by
  fun_prop

/-- The Bool-to-real Rademacher sign has support contained in `{−1, 1}`. -/
theorem vdVWBoolToRademacherSign_eq_neg_one_or_one (b : Bool) :
    vdVWBoolToRademacherSign b = -1 ∨ vdVWBoolToRademacherSign b = 1 := by
  cases b <;> simp [vdVWBoolToRademacherSign]

/-- The Bool-to-real Rademacher sign is bounded by one in absolute value. -/
theorem abs_vdVWBoolToRademacherSign_le_one (b : Bool) :
    |vdVWBoolToRademacherSign b| ≤ 1 := by
  rcases vdVWBoolToRademacherSign_eq_neg_one_or_one b with hneg | hpos
  · simp [hneg]
  · simp [hpos]

/-- The fair Bool-to-real Rademacher sign has mean zero. -/
theorem integral_vdVWBoolToRademacherSign_eq_zero :
    ∫ b, vdVWBoolToRademacherSign b ∂vdVWRademacherBoolLaw = 0 := by
  unfold vdVWRademacherBoolLaw
  rw [PMF.integral_eq_sum]
  norm_num [vdVWRademacherBoolPMF, vdVWBoolToRademacherSign,
    PMF.bernoulli_apply]

/-- The pushed-forward real-valued Rademacher PMF on `{−1, 1}`. -/
noncomputable def vdVWRademacherPMF : PMF ℝ :=
  PMF.map vdVWBoolToRademacherSign vdVWRademacherBoolPMF

/-- The real-valued Rademacher probability law on `{−1, 1}`. -/
noncomputable def vdVWRademacherLaw : Measure ℝ :=
  vdVWRademacherPMF.toMeasure

instance : IsProbabilityMeasure vdVWRademacherLaw := by
  unfold vdVWRademacherLaw vdVWRademacherPMF
  infer_instance

/-- The Bool-to-real sign map has the real-valued Rademacher law. -/
theorem vdVWBoolToRademacherSign_hasLaw :
    HasLaw vdVWBoolToRademacherSign vdVWRademacherLaw
      vdVWRademacherBoolLaw := by
  refine ⟨measurable_vdVWBoolToRademacherSign.aemeasurable, ?_⟩
  exact PMF.toMeasure_map (p := vdVWRademacherBoolPMF)
    (f := vdVWBoolToRademacherSign) measurable_vdVWBoolToRademacherSign

/--
The canonical fair Bool-to-real Rademacher sign is sub-Gaussian with variance
proxy `1`.

This closes the one-dimensional law needed before the finite iid construction
for the Rademacher signs in VdV&W Theorem 2.4.3.
-/
theorem vdVWBoolToRademacherSign_hasSubgaussianMGF :
    HasSubgaussianMGF vdVWBoolToRademacherSign 1 vdVWRademacherBoolLaw := by
  have hmeas : AEMeasurable vdVWBoolToRademacherSign vdVWRademacherBoolLaw :=
    measurable_vdVWBoolToRademacherSign.aemeasurable
  have hbound : ∀ᵐ b ∂vdVWRademacherBoolLaw,
      vdVWBoolToRademacherSign b ∈ Set.Icc (-1 : ℝ) 1 := by
    exact ae_of_all _ (fun b => by
      cases b <;> simp [vdVWBoolToRademacherSign])
  have hzero : ∫ b, vdVWBoolToRademacherSign b ∂vdVWRademacherBoolLaw = 0 :=
    integral_vdVWBoolToRademacherSign_eq_zero
  have h := hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
    (X := vdVWBoolToRademacherSign) (μ := vdVWRademacherBoolLaw)
    (a := (-1 : ℝ)) (b := 1) hmeas hbound hzero
  convert h using 1
  norm_num

/-- The identity map under the real-valued Rademacher law is sub-Gaussian. -/
theorem id_vdVWRademacherLaw_hasSubgaussianMGF :
    HasSubgaussianMGF id 1 vdVWRademacherLaw := by
  exact vdVWBoolToRademacherSign_hasSubgaussianMGF.congr_identDistrib
    (vdVWBoolToRademacherSign_hasLaw.identDistrib HasLaw.id)

/--
A deterministic sign vector with the support of Rademacher signs.

The later probability layer will realize this predicate from an iid
Rademacher law.  This local layer records only the fixed-sign algebra needed
to connect the textbook display to the empirical-net handoff.
-/
def VdVWRademacherSignVector {n : ℕ} (sign : Fin n -> ℝ) : Prop :=
  ∀ i, sign i = -1 ∨ sign i = 1

/--
Existence of finitely many iid real-valued Rademacher signs.

This is the probability-space construction needed before the random-sign
Hoeffding/maximal layer in VdV&W Theorem 2.4.3.  It is built from mathlib's
`exists_iid` theorem for the fair Bool law, pushed through the Bool-to-real
sign map with `HasLaw.comp` and `iIndepFun.comp`.
-/
theorem exists_iid_vdVWRademacherSigns (n : ℕ) :
    ∃ Ω : Type, ∃ _ : MeasurableSpace Ω, ∃ P : Measure Ω,
      ∃ sign : Fin n -> Ω -> ℝ,
        (∀ i, Measurable (sign i)) ∧
        (∀ i, HasLaw (sign i) vdVWRademacherLaw P) ∧
        iIndepFun sign P ∧ IsProbabilityMeasure P ∧
        (∀ i, HasSubgaussianMGF (sign i) 1 P) ∧
        (∀ᵐ ω ∂P, VdVWRademacherSignVector (fun i => sign i ω)) := by
  obtain ⟨Ω, mΩ, P, boolSign, hmeas, hlaw, hindep, hprob⟩ :=
    ProbabilityTheory.exists_iid (Fin n) vdVWRademacherBoolLaw
  letI : MeasurableSpace Ω := mΩ
  let sign : Fin n -> Ω -> ℝ :=
    fun i => vdVWBoolToRademacherSign ∘ boolSign i
  refine ⟨Ω, mΩ, P, sign, ?_, ?_, ?_, hprob, ?_, ?_⟩
  · intro i
    exact measurable_vdVWBoolToRademacherSign.comp (hmeas i)
  · intro i
    exact vdVWBoolToRademacherSign_hasLaw.comp (hlaw i)
  · exact hindep.comp (fun _ => vdVWBoolToRademacherSign)
      (fun _ => measurable_vdVWBoolToRademacherSign)
  · intro i
    have hident :
        IdentDistrib vdVWBoolToRademacherSign (sign i)
          vdVWRademacherBoolLaw P :=
      vdVWBoolToRademacherSign_hasLaw.identDistrib
        (vdVWBoolToRademacherSign_hasLaw.comp (hlaw i))
    exact vdVWBoolToRademacherSign_hasSubgaussianMGF.congr_identDistrib hident
  · exact ae_of_all _ (fun ω i =>
      vdVWBoolToRademacherSign_eq_neg_one_or_one (boolSign i ω))

/-- Rademacher sign vectors are uniformly bounded by one in absolute value. -/
theorem VdVWRademacherSignVector.abs_le_one
    {n : ℕ} {sign : Fin n -> ℝ}
    (hsign : VdVWRademacherSignVector sign) :
    ∀ i, |sign i| ≤ 1 := by
  intro i
  rcases hsign i with hneg | hpos
  · simp [hneg]
  · simp [hpos]

/--
The deterministic weights `epsilon_i / n` appearing in the Rademacher average
in the proof of Theorem 2.4.3.
-/
noncomputable def vdVWRademacherWeights {n : ℕ} (sign : Fin n -> ℝ) : Fin n -> ℝ :=
  fun i => (n : ℝ)⁻¹ * sign i

/--
If the supplied signs are bounded by one, the Rademacher weights satisfy the
`1 / n` absolute-weight condition required by the deterministic net inequality.
-/
theorem abs_vdVWRademacherWeights_le_inv_card
    {n : ℕ} {sign : Fin n -> ℝ}
    (hsign : ∀ i, |sign i| ≤ 1) :
    ∀ i, |vdVWRademacherWeights sign i| ≤ (n : ℝ)⁻¹ := by
  intro i
  unfold vdVWRademacherWeights
  have hinv_nonneg : 0 ≤ (n : ℝ)⁻¹ :=
    inv_nonneg.mpr (Nat.cast_nonneg n)
  rw [abs_mul, abs_of_nonneg hinv_nonneg]
  simpa using mul_le_mul_of_nonneg_left (hsign i) hinv_nonneg

/-- Rademacher sign vectors yield admissible deterministic weights. -/
theorem abs_vdVWRademacherWeights_le_inv_card_of_signVector
    {n : ℕ} {sign : Fin n -> ℝ}
    (hsign : VdVWRademacherSignVector sign) :
    ∀ i, |vdVWRademacherWeights sign i| ≤ (n : ℝ)⁻¹ :=
  abs_vdVWRademacherWeights_le_inv_card
    (VdVWRademacherSignVector.abs_le_one hsign)

/--
One-center sub-Gaussian bridge for the random Rademacher-weighted sum.

This is the probabilistic replacement layer needed before the finite-center
Hoeffding/Orlicz maximal bound in Theorem 2.4.3.  It uses mathlib's
sub-Gaussian MGF API rather than the deterministic fixed-sign predicate below.
-/
theorem vdVWTheorem243_oneCenter_rademacher_subGaussian_bridge
    {Ω : Type u} [MeasurableSpace Ω]
    {Observation : Type v} {Index : Type w} {n : ℕ}
    (μ : Measure Ω)
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ)
    (center : Index)
    (sign : Fin n -> Ω -> ℝ)
    (hindep : iIndepFun sign μ)
    (hsubG : ∀ i : Fin n, HasSubgaussianMGF (sign i) 1 μ) :
    HasSubgaussianMGF
      (fun ω =>
        vdVWWeightedSampleSum classFun
          (vdVWRademacherWeights (fun i : Fin n => sign i ω)) center sample)
      (∑ i : Fin n,
        (NNReal.mk (((n : ℝ)⁻¹ * classFun center (sample i)) ^ 2)
            (sq_nonneg ((n : ℝ)⁻¹ * classFun center (sample i))) *
          (1 : ℝ≥0))) μ := by
  let coeff : Fin n -> ℝ := fun i => (n : ℝ)⁻¹ * classFun center (sample i)
  have hindep_scaled :
      iIndepFun (fun i : Fin n => (fun x : ℝ => coeff i * x) ∘ sign i) μ := by
    exact hindep.comp
      (fun i x => coeff i * x)
      (fun i => measurable_const_mul (coeff i))
  have hsubG_scaled :
      ∀ i ∈ (Finset.univ : Finset (Fin n)),
        HasSubgaussianMGF (((fun x : ℝ => coeff i * x) ∘ sign i))
          (NNReal.mk ((coeff i) ^ 2) (sq_nonneg (coeff i)) * (1 : ℝ≥0)) μ := by
    intro i _hi
    simpa [coeff, Function.comp_apply] using (hsubG i).const_mul (coeff i)
  have hsum :
      HasSubgaussianMGF
        (fun ω => ∑ i ∈ (Finset.univ : Finset (Fin n)),
          (((fun x : ℝ => coeff i * x) ∘ sign i) ω))
        (∑ i ∈ (Finset.univ : Finset (Fin n)),
          (NNReal.mk ((coeff i) ^ 2) (sq_nonneg (coeff i)) * (1 : ℝ≥0))) μ := by
    exact HasSubgaussianMGF.sum_of_iIndepFun hindep_scaled hsubG_scaled
  simpa [coeff, vdVWWeightedSampleSum, vdVWRademacherWeights,
    mul_assoc, mul_left_comm, mul_comm] using hsum

/--
The variance proxy of one weighted center is bounded by `M^2 / n` whenever
all sampled center values are bounded by `M` in absolute value.

This is the deterministic arithmetic layer needed after the one-center
Rademacher sub-Gaussian bridge.
-/
theorem vdVWTheorem243_varianceProxy_real_le_of_abs_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {classFun : Index -> Observation -> ℝ}
    {center : Index} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hbound : ∀ i : Fin n, |classFun center (sample i)| ≤ M) :
    (∑ i : Fin n, (((n : ℝ)⁻¹ * classFun center (sample i)) ^ 2)) ≤
      M ^ 2 / (n : ℝ) := by
  by_cases hn : n = 0
  · subst n
    simp
  · have hn_cast : (n : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr hn
    calc
      (∑ i : Fin n, (((n : ℝ)⁻¹ * classFun center (sample i)) ^ 2))
          ≤ ∑ _i : Fin n, ((n : ℝ)⁻¹ ^ 2 * M ^ 2) := by
            apply Finset.sum_le_sum
            intro i _hi
            have hf_sq_le : (classFun center (sample i)) ^ 2 ≤ M ^ 2 := by
              have hsq_abs : |classFun center (sample i)| ^ 2 ≤ M ^ 2 :=
                (sq_le_sq₀ (abs_nonneg _) hM_nonneg).2 (hbound i)
              simpa [sq_abs] using hsq_abs
            rw [mul_pow]
            exact mul_le_mul_of_nonneg_left hf_sq_le (sq_nonneg ((n : ℝ)⁻¹))
      _ = (n : ℝ) * ((n : ℝ)⁻¹ ^ 2 * M ^ 2) := by
            simp [Finset.sum_const, Finset.card_univ, Fintype.card_fin,
              nsmul_eq_mul]
      _ = M ^ 2 / (n : ℝ) := by
            field_simp [hn_cast]

/--
For a truncated class `F_M`, the one-center Rademacher sub-Gaussian variance
proxy is bounded by the book-scale `M^2 / n`.
-/
theorem vdVWTheorem243_truncated_varianceProxy_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M)
    {center : Index} (hcenter : center ∈ indexClass) :
    (∑ i : Fin n,
        (NNReal.mk
            (((n : ℝ)⁻¹ *
              vdVWTruncatedClassFun classFun envelope M center (sample i)) ^ 2)
            (sq_nonneg
              ((n : ℝ)⁻¹ *
                vdVWTruncatedClassFun classFun envelope M center (sample i))) *
          (1 : ℝ≥0))) ≤
      NNReal.mk (M ^ 2 / (n : ℝ))
        (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)) := by
  rw [← NNReal.coe_le_coe]
  simpa [NNReal.coe_sum] using
    (vdVWTheorem243_varianceProxy_real_le_of_abs_le
      (sample := sample)
      (classFun := vdVWTruncatedClassFun classFun envelope M)
      (center := center) hM_nonneg
      (fun i =>
        abs_vdVWTruncatedClassFun_le_M henvelope hM_nonneg hcenter (sample i)))

/--
Monotonicity of the sub-Gaussian variance proxy.

Mathlib supplies the `HasSubgaussianMGF` API used below, but not this local
proxy-monotonicity wrapper in the pinned version.  It lets the Theorem 2.4.3
route promote center-specific truncated proxies to a common finite-net proxy.
-/
theorem vdVWTheorem243_hasSubgaussianMGF_mono
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : Ω -> ℝ} {c d : ℝ≥0}
    (hX : HasSubgaussianMGF X c μ) (hcd : c ≤ d) :
    HasSubgaussianMGF X d μ := by
  refine ⟨hX.integrable_exp_mul, ?_⟩
  intro t
  have hcd_real : (c : ℝ) ≤ (d : ℝ) := by
    exact_mod_cast hcd
  have hquad_nonneg : 0 ≤ t ^ 2 / 2 := by positivity
  have hproxy : (c : ℝ) * t ^ 2 / 2 ≤ (d : ℝ) * t ^ 2 / 2 := by
    nlinarith [mul_le_mul_of_nonneg_right hcd_real hquad_nonneg]
  exact (hX.mgf_le t).trans (Real.exp_le_exp.mpr hproxy)

/--
Two-sided tail bound for a sub-Gaussian real random variable.

This is the local absolute-value tail bridge needed before the finite-center
Hoeffding/Orlicz maximal layer in Theorem 2.4.3.  Mathlib supplies the
one-sided Chernoff bound as `HasSubgaussianMGF.measure_ge_le`; the absolute
tail is a union bound over `X` and `-X`.
-/
theorem vdVWTheorem243_abs_tail_le_of_hasSubgaussianMGF
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : Ω -> ℝ} {c : ℝ≥0} {epsilon : ℝ}
    (hX : HasSubgaussianMGF X c μ) (hepsilon : 0 ≤ epsilon) :
    μ.real {ω | epsilon ≤ |X ω|} ≤
      2 * Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ))) := by
  have hsubset :
      {ω | epsilon ≤ |X ω|} ⊆
        ({ω | epsilon ≤ X ω} ∪ {ω | epsilon ≤ -X ω}) := by
    intro ω hω
    have hω_abs : epsilon ≤ |X ω| := by
      simpa using hω
    rcases (le_abs.mp hω_abs) with hpos | hneg
    · exact Or.inl hpos
    · exact Or.inr hneg
  calc
    μ.real {ω | epsilon ≤ |X ω|}
        ≤ μ.real ({ω | epsilon ≤ X ω} ∪ {ω | epsilon ≤ -X ω}) := by
          exact measureReal_mono hsubset
    _ ≤ μ.real {ω | epsilon ≤ X ω} + μ.real {ω | epsilon ≤ -X ω} := by
          exact measureReal_union_le _ _
    _ ≤ Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ))) +
        Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ))) := by
          exact
            add_le_add (hX.measure_ge_le hepsilon)
              ((hX.neg).measure_ge_le hepsilon)
    _ = 2 * Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ))) := by
          ring

/--
Finite-center union-bound tail layer for Theorem 2.4.3.

If each center process is sub-Gaussian with the same variance proxy, then the
tail probability of the finite supremum of absolute center sums is bounded by
the number of centers times the one-center two-sided tail bound.
-/
theorem vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {epsilon : ℝ}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hepsilon : 0 ≤ epsilon) :
    μ.real {ω | epsilon ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} ≤
      (cardinality : ℝ) *
        (2 * Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ)))) := by
  have hsubset :
      {ω | epsilon ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} ⊆
        (⋃ centerIndex : Fin cardinality, {ω | epsilon ≤ |X centerIndex ω|}) := by
    intro ω hω
    have hω_sup :
        epsilon ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|) := by
      simpa using hω
    obtain ⟨centerIndex, hcenterIndex⟩ :
        ∃ centerIndex : Fin cardinality,
          |X centerIndex ω| =
            ⨆ centerIndex : Fin cardinality, |X centerIndex ω| :=
      exists_eq_ciSup_of_finite
    exact Set.mem_iUnion.mpr
      ⟨centerIndex, by simpa [← hcenterIndex] using hω_sup⟩
  calc
    μ.real {ω | epsilon ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)}
        ≤ μ.real
          (⋃ centerIndex : Fin cardinality,
            {ω | epsilon ≤ |X centerIndex ω|}) := by
          exact measureReal_mono hsubset
    _ ≤ ∑ centerIndex : Fin cardinality,
        μ.real {ω | epsilon ≤ |X centerIndex ω|} := by
          exact measureReal_iUnion_fintype_le _
    _ ≤ ∑ _centerIndex : Fin cardinality,
        2 * Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ))) := by
          apply Finset.sum_le_sum
          intro centerIndex _hcenterIndex
          exact
            vdVWTheorem243_abs_tail_le_of_hasSubgaussianMGF
              (hX centerIndex) hepsilon
    _ = (cardinality : ℝ) *
        (2 * Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ)))) := by
          simp [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]

/--
Finite-center sub-Gaussian tail bound from an explicit positivity proof for
the net cardinality.

Empirical-cover witnesses usually expose `0 < cardinality`, not a typeclass
instance.  This wrapper makes that handoff explicit and leaves the genuinely
empty-net case to a separate branch.
-/
theorem vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF_of_pos
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {epsilon : ℝ}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hepsilon : 0 ≤ epsilon) :
    μ.real {ω | epsilon ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} ≤
      (cardinality : ℝ) *
        (2 * Real.exp (-(epsilon ^ 2) / (2 * (c : ℝ)))) := by
  haveI : Nonempty (Fin cardinality) := ⟨⟨0, hcardinality⟩⟩
  exact
    vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF
      X hX hepsilon

/--
The finite supremum of absolute sub-Gaussian center variables is integrable.

This is a preparatory maximal-inequality layer for the expectation/Orlicz step:
it makes the random finite-center supremum an honest integrable random
variable before the sharper `sqrt(log #G)` bound is proved.
-/
theorem vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    Integrable (fun ω =>
      ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ := by
  have hcenter_integrable :
      ∀ centerIndex : Fin cardinality,
        Integrable (fun ω => |X centerIndex ω|) μ := by
    intro centerIndex
    exact (hX centerIndex).integrable.abs
  have hsum_integrable :
      Integrable (fun ω =>
        ∑ centerIndex : Fin cardinality, |X centerIndex ω|) μ := by
    exact integrable_finsetSum Finset.univ
      (fun centerIndex _hcenterIndex => hcenter_integrable centerIndex)
  have hsup_aestronglyMeasurable :
      AEStronglyMeasurable
        (fun ω => ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ := by
    exact
      (AEMeasurable.iSup fun centerIndex =>
        (hcenter_integrable centerIndex).aemeasurable).aestronglyMeasurable
  refine Integrable.mono' hsum_integrable hsup_aestronglyMeasurable ?_
  refine ae_of_all μ ?_
  intro ω
  have hsup_nonneg :
      0 ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|) := by
    exact
      (abs_nonneg (X (Classical.arbitrary (Fin cardinality)) ω)).trans
        (Finite.le_ciSup
          (fun centerIndex : Fin cardinality => |X centerIndex ω|)
          (Classical.arbitrary (Fin cardinality)))
  rw [Real.norm_eq_abs, abs_of_nonneg hsup_nonneg]
  exact ciSup_le fun centerIndex =>
    Finset.single_le_sum (f := fun i : Fin cardinality => |X i ω|)
      (fun i _hi => abs_nonneg (X i ω)) (Finset.mem_univ centerIndex)

/--
The finite-center supremum integrability handoff from an explicit positive
cardinality proof.
-/
theorem vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF_of_pos
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    Integrable (fun ω =>
      ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ := by
  haveI : Nonempty (Fin cardinality) := ⟨⟨0, hcardinality⟩⟩
  exact
    vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
      X hX

/--
Expected finite-center supremum appearing in the maximal-inequality step of
VdV&W Theorem 2.4.3.
-/
noncomputable def vdVWTheorem243FiniteCenterExpectedSupremum
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    {cardinality : ℕ} (X : Fin cardinality -> Ω -> ℝ) : ℝ :=
  ∫ ω, ⨆ centerIndex : Fin cardinality, |X centerIndex ω| ∂μ

/--
Layer-cake representation of the expected finite-center supremum.

This is the exact tail-probability bridge needed before substituting the
compiled finite-center sub-Gaussian tail bound.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ)
    (hintegrable :
      Integrable (fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X =
      ∫ t in Set.Ioi (0 : ℝ),
        μ.real {ω | t ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} := by
  unfold vdVWTheorem243FiniteCenterExpectedSupremum
  have hnonneg :
      0 ≤ᵐ[μ] fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω| := by
    exact ae_of_all μ fun ω =>
      (abs_nonneg (X (Classical.arbitrary (Fin cardinality)) ω)).trans
        (Finite.le_ciSup
          (fun centerIndex : Fin cardinality => |X centerIndex ω|)
          (Classical.arbitrary (Fin cardinality)))
  exact ProbabilityMeasure.integral_eq_integral_tail_le hintegrable hnonneg

/--
Sub-Gaussian-center specialization of the layer-cake representation.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X =
      ∫ t in Set.Ioi (0 : ℝ),
        μ.real {ω | t ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} := by
  exact
    vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail X
      (vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
        X hX)

/--
Positive-cardinality version of the sub-Gaussian layer-cake representation.
-/
theorem
    vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF_of_pos
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X =
      ∫ t in Set.Ioi (0 : ℝ),
        μ.real {ω | t ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} := by
  haveI : Nonempty (Fin cardinality) := ⟨⟨0, hcardinality⟩⟩
  exact
    vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF
      X hX

/--
Tail-integral monotonicity handoff for the finite-center expected supremum.

This packages the layer-cake representation with a supplied pointwise upper
bound on the tail probabilities over `t > 0`.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_tail_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) {tailBound : ℝ -> ℝ}
    (hintegrable :
      Integrable (fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ)
    (hboundIntegrable : IntegrableOn tailBound (Set.Ioi (0 : ℝ)) volume)
    (hbound : ∀ t ∈ Set.Ioi (0 : ℝ),
      μ.real {ω | t ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} ≤
        tailBound t) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      ∫ t in Set.Ioi (0 : ℝ), tailBound t := by
  unfold vdVWTheorem243FiniteCenterExpectedSupremum
  have hnonneg :
      0 ≤ᵐ[μ] fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω| := by
    exact ae_of_all μ fun ω =>
      (abs_nonneg (X (Classical.arbitrary (Fin cardinality)) ω)).trans
        (Finite.le_ciSup
          (fun centerIndex : Fin cardinality => |X centerIndex ω|)
          (Classical.arbitrary (Fin cardinality)))
  exact
    ProbabilityMeasure.integral_le_integral_tail_bound
      hintegrable hnonneg hboundIntegrable hbound

/--
Split-at-radius tail-integral handoff for the finite-center expected supremum.

For `0 <= r`, the interval `(0, r]` contributes at most `r` because every
tail probability is at most one.  The remaining contribution can then be
controlled by any supplied tail majorant over `(r, ∞)`.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_tail_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) {tailBound : ℝ -> ℝ} {r : ℝ}
    (hr : 0 ≤ r)
    (hintegrable :
      Integrable (fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ)
    (hboundIntegrable : IntegrableOn tailBound (Set.Ioi r) volume)
    (hbound : ∀ t ∈ Set.Ioi r,
      μ.real {ω | t ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)} ≤
        tailBound t) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      r + ∫ t in Set.Ioi r, tailBound t := by
  unfold vdVWTheorem243FiniteCenterExpectedSupremum
  have hnonneg :
      0 ≤ᵐ[μ] fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω| := by
    exact ae_of_all μ fun ω =>
      (abs_nonneg (X (Classical.arbitrary (Fin cardinality)) ω)).trans
        (Finite.le_ciSup
          (fun centerIndex : Fin cardinality => |X centerIndex ω|)
          (Classical.arbitrary (Fin cardinality)))
  exact
    ProbabilityMeasure.probability_integral_le_radius_add_integral_tail_bound
      hr hintegrable hnonneg hboundIntegrable hbound

/--
Finite-center sub-Gaussian specialization of the tail-integral upper bound.

The remaining maximal-inequality work is to discharge the Gaussian-tail
integrability/evaluation and sharpen this display into the textbook
Orlicz/Hoeffding bound.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_subGaussian_tail_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hboundIntegrable :
      IntegrableOn
        (fun t : ℝ =>
          (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))))
        (Set.Ioi (0 : ℝ)) volume) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      ∫ t in Set.Ioi (0 : ℝ),
        (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))) := by
  haveI : Nonempty (Fin cardinality) := ⟨⟨0, hcardinality⟩⟩
  exact
    vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_tail_bound X
      (vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
        X hX)
      hboundIntegrable
      (fun t ht =>
        vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF_of_pos
          hcardinality X hX (le_of_lt ht))

/--
Integrability of the finite-center sub-Gaussian tail majorant.

The assumption `0 < c` is necessary for this Gaussian majorant route; when
`c = 0`, the displayed expression degenerates under Lean's total division.
-/
theorem vdVWTheorem243_subGaussian_tail_bound_integrable
    {cardinality : ℕ} {c : ℝ≥0} (hc : 0 < (c : ℝ)) :
    IntegrableOn
      (fun t : ℝ =>
        (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))))
      (Set.Ioi (0 : ℝ)) volume := by
  have hb : 0 < (2 * (c : ℝ))⁻¹ :=
    inv_pos.mpr (mul_pos zero_lt_two hc)
  have hbase :
      Integrable (fun t : ℝ =>
        Real.exp (-((2 * (c : ℝ))⁻¹) * t ^ 2)) :=
    integrable_exp_neg_mul_sq hb
  have hbaseRestrict :
      Integrable (fun t : ℝ =>
        Real.exp (-((2 * (c : ℝ))⁻¹) * t ^ 2))
        (volume.restrict (Set.Ioi (0 : ℝ))) :=
    hbase.restrict
  change
    Integrable
      (fun t : ℝ =>
        (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))))
      (volume.restrict (Set.Ioi (0 : ℝ)))
  convert hbaseRestrict.const_mul ((cardinality : ℝ) * 2) using 1
  ext t
  ring_nf

/--
Split-at-radius finite-center sub-Gaussian expectation bound.

This is the next theorem-line bridge toward the VdV&W logarithmic
Hoeffding/Orlicz maximal bound: after choosing a logarithmic radius, only the
Gaussian tail integral over `(r, ∞)` remains.
-/
theorem
    vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_subGaussian_tail_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {r : ℝ}
    (hc : 0 < (c : ℝ)) (hr : 0 ≤ r)
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      r + ∫ t in Set.Ioi r,
        (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))) := by
  haveI : Nonempty (Fin cardinality) := ⟨⟨0, hcardinality⟩⟩
  refine
    vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_tail_bound
      X hr
      (vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
        X hX)
      ?_ ?_
  · exact
      (vdVWTheorem243_subGaussian_tail_bound_integrable
        (cardinality := cardinality) (c := c) hc).mono_set
        (by
          intro t ht
          exact lt_of_le_of_lt hr ht)
  · intro t ht
    exact
      vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF_of_pos
        hcardinality X hX (le_of_lt (lt_of_le_of_lt hr ht))

/--
Weighted Gaussian-tail integral over `(r, ∞)`.

This is the calculus primitive behind the Mills-type tail bound used in the
finite-center maximal step.  The proof uses mathlib's improper-integral FTC
`integral_Ioi_of_hasDerivAt_of_tendsto'`.
-/
theorem vdVWTheorem243_integral_mul_exp_neg_mul_sq_Ioi_eq
    {b r : ℝ} (hb : 0 < b) :
    (∫ t in Set.Ioi r, t * Real.exp (-b * t ^ 2)) =
      Real.exp (-b * r ^ 2) / (2 * b) := by
  have hb_ne : b ≠ 0 := ne_of_gt hb
  have hderiv :
      ∀ x ∈ Set.Ici r,
        HasDerivAt
          (fun y : ℝ => -((2 * b)⁻¹) * Real.exp (-b * y ^ 2))
          (x * Real.exp (-b * x ^ 2)) x := by
    intro x _hx
    convert
      (((hasDerivAt_pow 2 x).const_mul (-b)).exp.const_mul (-((2 * b)⁻¹)))
      using 1
    field_simp [hb_ne]
    ring
  have htendsto :
      Tendsto (fun y : ℝ => -((2 * b)⁻¹) * Real.exp (-b * y ^ 2))
        atTop (𝓝 (-((2 * b)⁻¹) * 0)) := by
    refine Tendsto.const_mul _ ?_
    exact
      (Real.tendsto_exp_atBot).comp
        ((tendsto_pow_atTop two_ne_zero).const_mul_atTop_of_neg
          (neg_lt_zero.mpr hb))
  have h :=
    integral_Ioi_of_hasDerivAt_of_tendsto'
      (a := r)
      (f := fun y : ℝ => -((2 * b)⁻¹) * Real.exp (-b * y ^ 2))
      (f' := fun y : ℝ => y * Real.exp (-b * y ^ 2))
      (m := -((2 * b)⁻¹) * 0) hderiv
      (integrable_mul_exp_neg_mul_sq hb).integrableOn htendsto
  rw [h]
  field_simp [hb_ne]
  ring

/--
Mills-type deterministic Gaussian-tail bound in the normalized
`exp (-b t^2)` form.
-/
theorem vdVWTheorem243_integral_exp_neg_mul_sq_Ioi_le_mills
    {b r : ℝ} (hb : 0 < b) (hr : 0 < r) :
    (∫ t in Set.Ioi r, Real.exp (-b * t ^ 2)) ≤
      (1 / (2 * b * r)) * Real.exp (-b * r ^ 2) := by
  have hb_ne : b ≠ 0 := ne_of_gt hb
  have hr_ne : r ≠ 0 := ne_of_gt hr
  have hbaseInt :
      IntegrableOn (fun t : ℝ => Real.exp (-b * t ^ 2)) (Set.Ioi r) volume := by
    exact (integrable_exp_neg_mul_sq hb).integrableOn
  have hmulRestrict :
      Integrable (fun t : ℝ => t * Real.exp (-b * t ^ 2))
        (volume.restrict (Set.Ioi r)) :=
    (integrable_mul_exp_neg_mul_sq hb).integrableOn
  have hweightedInt :
      IntegrableOn (fun t : ℝ => (t / r) * Real.exp (-b * t ^ 2))
        (Set.Ioi r) volume := by
    change
      Integrable (fun t : ℝ => (t / r) * Real.exp (-b * t ^ 2))
        (volume.restrict (Set.Ioi r))
    convert hmulRestrict.const_mul r⁻¹ using 1
    ext t
    field_simp [hr_ne]
  calc
    (∫ t in Set.Ioi r, Real.exp (-b * t ^ 2))
        ≤ ∫ t in Set.Ioi r, (t / r) * Real.exp (-b * t ^ 2) := by
          refine setIntegral_mono_on hbaseInt hweightedInt measurableSet_Ioi ?_
          intro t ht
          have hle : 1 ≤ t / r := by
            calc
              1 = r / r := by field_simp [hr_ne]
              _ ≤ t / r := div_le_div_of_nonneg_right (le_of_lt ht) hr.le
          exact le_mul_of_one_le_left (Real.exp_pos _).le hle
    _ = r⁻¹ * (∫ t in Set.Ioi r, t * Real.exp (-b * t ^ 2)) := by
          have hcongr :
              (∫ t in Set.Ioi r, (t / r) * Real.exp (-b * t ^ 2)) =
                ∫ t in Set.Ioi r,
                  r⁻¹ * (t * Real.exp (-b * t ^ 2)) := by
            refine setIntegral_congr_fun measurableSet_Ioi ?_
            intro t _ht
            field_simp [hr_ne]
          rw [hcongr]
          rw [integral_const_mul]
    _ = (1 / (2 * b * r)) * Real.exp (-b * r ^ 2) := by
          rw [vdVWTheorem243_integral_mul_exp_neg_mul_sq_Ioi_eq hb]
          field_simp [hb_ne, hr_ne]

/--
Mills-type deterministic Gaussian-tail bound in the VdV&W sub-Gaussian
normalization `exp (-(t^2)/(2c))`.
-/
theorem vdVWTheorem243_integral_subGaussian_exp_tail_le_mills
    {c r : ℝ} (hc : 0 < c) (hr : 0 < r) :
    (∫ t in Set.Ioi r, Real.exp (-(t ^ 2) / (2 * c))) ≤
      (c / r) * Real.exp (-(r ^ 2) / (2 * c)) := by
  have hb : 0 < (2 * c)⁻¹ := inv_pos.mpr (mul_pos zero_lt_two hc)
  have hc_ne : c ≠ 0 := ne_of_gt hc
  have h :=
    vdVWTheorem243_integral_exp_neg_mul_sq_Ioi_le_mills
      (b := (2 * c)⁻¹) (r := r) hb hr
  convert h using 1 <;> field_simp [hc_ne]

/--
Mills-type bound for the finite-center sub-Gaussian tail majorant.
-/
theorem vdVWTheorem243_integral_finiteCenter_subGaussian_tail_le_mills
    {cardinality : ℕ} {c : ℝ≥0} {r : ℝ}
    (hc : 0 < (c : ℝ)) (hr : 0 < r) :
    (∫ t in Set.Ioi r,
        (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ))))) ≤
      (cardinality : ℝ) *
        (2 * ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ))))) := by
  have hmills :=
    vdVWTheorem243_integral_subGaussian_exp_tail_le_mills
      (c := (c : ℝ)) (r := r) hc hr
  have hcoef_nonneg : 0 ≤ (cardinality : ℝ) * 2 := by positivity
  calc
    (∫ t in Set.Ioi r,
        (cardinality : ℝ) * (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))))
        = ((cardinality : ℝ) * 2) *
            (∫ t in Set.Ioi r, Real.exp (-(t ^ 2) / (2 * (c : ℝ)))) := by
          have hcongr :
              (∫ t in Set.Ioi r,
                (cardinality : ℝ) *
                  (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ))))) =
                ∫ t in Set.Ioi r,
                  ((cardinality : ℝ) * 2) *
                    Real.exp (-(t ^ 2) / (2 * (c : ℝ))) := by
            refine setIntegral_congr_fun measurableSet_Ioi ?_
            intro t _ht
            ring
          rw [hcongr]
          rw [integral_const_mul]
    _ ≤ ((cardinality : ℝ) * 2) *
          ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ)))) := by
          exact mul_le_mul_of_nonneg_left hmills hcoef_nonneg
    _ = (cardinality : ℝ) *
          (2 * ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ))))) := by
          ring

/--
Finite-center expected-supremum bound after the split radius and the
Mills-type tail estimate.

The next layer chooses a logarithmic radius and simplifies the right hand side
to the textbook `sqrt(log #G)` finite-maximal scale.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {r : ℝ}
    (hc : 0 < (c : ℝ)) (hr : 0 < r)
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      r + (cardinality : ℝ) *
        (2 * ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ))))) := by
  exact
    (vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_subGaussian_tail_bound
      hcardinality X hc hr.le hX).trans
      (add_le_add le_rfl
        (vdVWTheorem243_integral_finiteCenter_subGaussian_tail_le_mills
          (cardinality := cardinality) (c := c) hc hr))

/--
Finite-center expected-supremum bound after a supplied logarithmic-radius
small-tail condition.

The condition
`(cardinality : ℝ) * exp (-(r^2)/(2c)) <= 1` is the exact deterministic
algebraic obligation discharged by the later logarithmic choice of `r`.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_simplified
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {r : ℝ}
    (hc : 0 < (c : ℝ)) (hr : 0 < r)
    (hsmall :
      (cardinality : ℝ) *
        Real.exp (-(r ^ 2) / (2 * (c : ℝ))) ≤ 1)
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      r + 2 * (c : ℝ) / r := by
  have hcoef_nonneg : 0 ≤ 2 * (c : ℝ) / r := by
    exact div_nonneg (mul_nonneg zero_le_two hc.le) hr.le
  have htail :
      (cardinality : ℝ) *
        (2 * ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ))))) ≤
        2 * (c : ℝ) / r := by
    calc
      (cardinality : ℝ) *
          (2 * ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ)))))
          = (2 * (c : ℝ) / r) *
              ((cardinality : ℝ) *
                Real.exp (-(r ^ 2) / (2 * (c : ℝ)))) := by
              ring
      _ ≤ (2 * (c : ℝ) / r) * 1 := by
              exact mul_le_mul_of_nonneg_left hsmall hcoef_nonneg
      _ = 2 * (c : ℝ) / r := by ring
  have htail' :
      r +
          (cardinality : ℝ) *
            (2 * ((c : ℝ) / r * Real.exp (-(r ^ 2) / (2 * (c : ℝ))))) ≤
        r + 2 * (c : ℝ) / r := by
    simpa [add_comm, add_left_comm, add_assoc] using add_le_add_left htail r
  exact
    (vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_bound
      hcardinality X hc hr hX).trans
      htail'

/--
The logarithmic split radius used after the finite-center Mills bound is
strictly positive.

The harmless `1 + log cardinality` offset avoids a zero radius when the finite
net has one center, so the Mills factor `c / r` remains meaningful.
-/
theorem vdVWTheorem243_logRadius_pos
    {cardinality : ℕ} (hcardinality : 0 < cardinality) {c : ℝ≥0}
    (hc : 0 < (c : ℝ)) :
    0 <
      Real.sqrt
        (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ))) := by
  have hcardinality_one : (1 : ℝ) ≤ (cardinality : ℝ) := by
    exact_mod_cast Nat.succ_le_of_lt hcardinality
  have hlog_nonneg : 0 ≤ Real.log (cardinality : ℝ) :=
    Real.log_nonneg hcardinality_one
  have hlog_pos : 0 < 1 + Real.log (cardinality : ℝ) := by
    nlinarith
  have harg_pos :
      0 < 2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)) := by
    positivity
  exact Real.sqrt_pos.mpr harg_pos

/--
Square identity for the logarithmic split radius.
-/
theorem vdVWTheorem243_logRadius_sq_div
    {cardinality : ℕ} (hcardinality : 0 < cardinality) {c : ℝ≥0}
    (hc : 0 < (c : ℝ)) :
    let r : ℝ :=
      Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)))
    r ^ 2 / (2 * (c : ℝ)) = 1 + Real.log (cardinality : ℝ) := by
  dsimp
  have hcardinality_one : (1 : ℝ) ≤ (cardinality : ℝ) := by
    exact_mod_cast Nat.succ_le_of_lt hcardinality
  have hlog_nonneg : 0 ≤ Real.log (cardinality : ℝ) :=
    Real.log_nonneg hcardinality_one
  have harg_nonneg :
      0 ≤ 2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)) := by
    positivity
  rw [Real.sq_sqrt harg_nonneg]
  field_simp [ne_of_gt hc]

/--
Exponential factor after choosing the logarithmic split radius.
-/
theorem vdVWTheorem243_logRadius_exp_factor_eq
    {cardinality : ℕ} (hcardinality : 0 < cardinality) {c : ℝ≥0}
    (hc : 0 < (c : ℝ)) :
    let r : ℝ :=
      Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)))
    Real.exp (-(r ^ 2) / (2 * (c : ℝ))) =
      Real.exp (-1) / (cardinality : ℝ) := by
  dsimp
  have hsq :=
    vdVWTheorem243_logRadius_sq_div
      (cardinality := cardinality) (c := c) hcardinality hc
  have hcardinality_pos : 0 < (cardinality : ℝ) := by
    exact_mod_cast hcardinality
  have hcardinality_ne : (cardinality : ℝ) ≠ 0 := ne_of_gt hcardinality_pos
  have hneg :
      -(Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ))) ^ 2) /
          (2 * (c : ℝ)) =
        -(1 + Real.log (cardinality : ℝ)) := by
    rw [neg_div, hsq]
  calc
    Real.exp
        (-(Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ))) ^ 2) /
          (2 * (c : ℝ)))
        = Real.exp (-(1 + Real.log (cardinality : ℝ))) := by rw [hneg]
    _ = Real.exp (-1 + -Real.log (cardinality : ℝ)) := by ring_nf
    _ = Real.exp (-1) * Real.exp (-Real.log (cardinality : ℝ)) := by
          rw [Real.exp_add]
    _ = Real.exp (-1) * (Real.exp (Real.log (cardinality : ℝ)))⁻¹ := by
          have hlogNeg :
              Real.exp (-Real.log (cardinality : ℝ)) =
                (Real.exp (Real.log (cardinality : ℝ)))⁻¹ := by
            rw [Real.exp_neg]
          rw [hlogNeg]
    _ = Real.exp (-1) / (cardinality : ℝ) := by
          rw [Real.exp_log hcardinality_pos]
          rw [div_eq_mul_inv]

/--
The finite-center Mills factor at the logarithmic split radius.
-/
theorem vdVWTheorem243_logRadius_mills_factor_eq
    {cardinality : ℕ} (hcardinality : 0 < cardinality) {c : ℝ≥0}
    (hc : 0 < (c : ℝ)) :
    let r : ℝ :=
      Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)))
    (cardinality : ℝ) *
        (2 * ((c : ℝ) / r *
          Real.exp (-(r ^ 2) / (2 * (c : ℝ))))) =
      2 * Real.exp (-1) * ((c : ℝ) / r) := by
  dsimp
  have hcardinality_pos : 0 < (cardinality : ℝ) := by
    exact_mod_cast hcardinality
  have hcardinality_ne : (cardinality : ℝ) ≠ 0 := ne_of_gt hcardinality_pos
  have hr_ne :
      Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ))) ≠ 0 :=
    ne_of_gt
      (vdVWTheorem243_logRadius_pos
        (cardinality := cardinality) (c := c) hcardinality hc)
  rw [vdVWTheorem243_logRadius_exp_factor_eq
      (cardinality := cardinality) (c := c) hcardinality hc]
  field_simp [hcardinality_ne, hr_ne]

/--
Finite-center expected-supremum bound after choosing the logarithmic split
radius.

This is the arithmetic bridge from the Mills tail estimate to the textbook
finite-maximal `sqrt(log #G)` scale.  A later layer can relax the harmless
`1 + log #G` offset into the chosen VdV&W display constant.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_logRadius_mills_bound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hc : 0 < (c : ℝ))
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    let r : ℝ :=
      Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)))
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      r + 2 * Real.exp (-1) * ((c : ℝ) / r) := by
  dsimp
  have hraw :=
    vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_bound
      (cardinality := cardinality) hcardinality X
      (c := c)
      (r := Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ))))
      hc
      (vdVWTheorem243_logRadius_pos
        (cardinality := cardinality) (c := c) hcardinality hc)
      hX
  have hfactor :=
    vdVWTheorem243_logRadius_mills_factor_eq
      (cardinality := cardinality) (c := c) hcardinality hc
  exact hraw.trans_eq (by rw [hfactor])

/--
The explicit finite-center maximal expectation scale produced by the
logarithmic split-radius plus Mills estimate.

This packages the analytic tail calculation as a reusable book-facing upper
bound before it is converted into the later `psi_2`/Hoeffding notation.
-/
noncomputable def vdVWTheorem243LogRadiusMillsUpper
    (cardinality : ℕ) (c : ℝ≥0) : ℝ :=
  let r : ℝ :=
    Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)))
  r + 2 * Real.exp (-1) * ((c : ℝ) / r)

/-- The logarithmic-radius Mills upper is nonnegative. -/
theorem vdVWTheorem243LogRadiusMillsUpper_nonneg
    (cardinality : ℕ) (c : ℝ≥0) :
    0 ≤ vdVWTheorem243LogRadiusMillsUpper cardinality c := by
  unfold vdVWTheorem243LogRadiusMillsUpper
  exact add_nonneg (Real.sqrt_nonneg _)
    (mul_nonneg
      (mul_nonneg zero_le_two (Real.exp_pos _).le)
      (div_nonneg c.property (Real.sqrt_nonneg _)))

/--
Proof-carrying expected finite-center maximal bound.

Unlike `VdVWTheorem243FiniteCenterMaximalBound`, this is an expectation-level
probabilistic maximal layer.  It is the correct target for the tail-integral
and sub-Gaussian route before later deterministic finite-net handoffs are
applied to sample-path displays.
-/
def VdVWTheorem243FiniteCenterExpectedMaximalBound
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    {cardinality : ℕ} (X : Fin cardinality -> Ω -> ℝ)
    (upper : ℝ) : Prop :=
  vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤ upper

/--
The log-radius Mills upper proves the expected finite-center maximal bound
for a finite family of sub-Gaussian centers.
-/
theorem VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hc : 0 < (c : ℝ))
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ X
      (vdVWTheorem243LogRadiusMillsUpper cardinality c) := by
  unfold VdVWTheorem243FiniteCenterExpectedMaximalBound
  simpa [vdVWTheorem243LogRadiusMillsUpper] using
    vdVWTheorem243FiniteCenterExpectedSupremum_le_logRadius_mills_bound
      (cardinality := cardinality) hcardinality X hc hX

/--
If the logarithmic Mills upper is dominated by a chosen book-scale finite-net
upper, the expected finite-center maximal bound holds at that book scale.

The next layer supplies this domination for the VdV&W `psi_2`/Hoeffding scale
and then specializes the sub-Gaussian proxy using the truncated envelope bound.
-/
theorem VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {upper : ℝ}
    (hc : 0 < (c : ℝ))
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hupper : vdVWTheorem243LogRadiusMillsUpper cardinality c ≤ upper) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ X upper := by
  exact
    (VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills
      (cardinality := cardinality) hcardinality X hc hX).trans hupper

/--
Hoeffding-upper specialization of the expected finite-center maximal handoff.

This leaves the analytic scale comparison as an explicit hypothesis while
placing the result in the VdV&W finite-net display notation.
-/
theorem
    VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le_finiteNetHoeffdingUpper
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality n : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {M : ℝ}
    (hc : 0 < (c : ℝ))
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hscale :
      vdVWTheorem243LogRadiusMillsUpper cardinality c ≤
        vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ X
      (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M) := by
  exact
    VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le
      (cardinality := cardinality) hcardinality X hc hX hscale

/--
Truncated-center specialization of the expected finite-center maximal layer
for random Rademacher signs.

This is the first theorem-level bridge from the abstract finite-center
sub-Gaussian maximal bound back to the VdV&W truncated class `F_M`.
-/
theorem vdVWTheorem243_truncated_rademacher_expectedMaximalBound
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} {Index : Type w} {n : ℕ}
    (sample : SampleAt Observation n)
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M : ℝ}
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M)
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (center : Fin cardinality -> Index)
    (hcenter : ∀ centerIndex, center centerIndex ∈ indexClass)
    (sign : Fin n -> Ω -> ℝ)
    (hindep : iIndepFun sign μ)
    (hsubG : ∀ i : Fin n, HasSubgaussianMGF (sign i) 1 μ)
    (hproxy_pos :
      0 <
        (NNReal.mk (M ^ 2 / (n : ℝ))
          (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)) : ℝ)) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ
      (fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (center centerIndex) sample)
      (vdVWTheorem243LogRadiusMillsUpper cardinality
        (NNReal.mk (M ^ 2 / (n : ℝ))
          (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)))) := by
  refine
    VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills
      (cardinality := cardinality) hcardinality
      (X := fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (center centerIndex) sample)
      (c := NNReal.mk (M ^ 2 / (n : ℝ))
        (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)))
      hproxy_pos ?_
  intro centerIndex
  exact
    vdVWTheorem243_hasSubgaussianMGF_mono
      (vdVWTheorem243_oneCenter_rademacher_subGaussian_bridge
        μ sample (vdVWTruncatedClassFun classFun envelope M)
        (center centerIndex) sign hindep hsubG)
      (vdVWTheorem243_truncated_varianceProxy_le
        (sample := sample) henvelope hM_nonneg (hcenter centerIndex))

/--
Finite-empirical-cover version of the truncated Rademacher expected maximal
bound.

This packages the previous centerwise result with the positive-cardinality and
center-membership data carried by `FiniteEmpiricalL1CoverAtCard`.
-/
theorem
    vdVWTheorem243_truncated_rademacher_expectedMaximalBound_of_finiteEmpiricalL1CoverAtCard
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} {Index : Type w} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality)
    (hindexClass_nonempty : ∃ index, index ∈ indexClass)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hM_nonneg : 0 ≤ M)
    (sign : Fin n -> Ω -> ℝ)
    (hindep : iIndepFun sign μ)
    (hsubG : ∀ i : Fin n, HasSubgaussianMGF (sign i) 1 μ)
    (hproxy_pos :
      0 <
        (NNReal.mk (M ^ 2 / (n : ℝ))
          (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)) : ℝ)) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ
      (fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (cover.center centerIndex) sample)
      (vdVWTheorem243LogRadiusMillsUpper cardinality
        (NNReal.mk (M ^ 2 / (n : ℝ))
          (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)))) := by
  exact
    vdVWTheorem243_truncated_rademacher_expectedMaximalBound
      (sample := sample) henvelope hM_nonneg
      (cover.cardinality_pos_of_nonempty hindexClass_nonempty)
      cover.center
      cover.center_mem
      sign hindep hsubG hproxy_pos

/--
The common sub-Gaussian proxy for truncated Rademacher centers is positive
under the explicit book-side assumptions `0 < n` and `0 < M`.
-/
theorem vdVWTheorem243_truncated_commonProxy_pos
    {n : ℕ} {M : ℝ} (hn : 0 < n) (hM_pos : 0 < M) :
    0 <
      (NNReal.mk (M ^ 2 / (n : ℝ))
        (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)) : ℝ) := by
  rw [NNReal.coe_mk]
  exact div_pos (sq_pos_of_pos hM_pos) (by exact_mod_cast hn)

/--
Proof-carrying arithmetic handoff from the compiled log-radius Mills upper to
the VdV&W finite-net Hoeffding display scale.

The exact remaining arithmetic target is to prove this predicate from the
explicit assumptions on `cardinality`, `n`, and `M`; until then this isolates
the only scale comparison still needed by the Theorem 2.4.3 maximal layer.
-/
def VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale
    (cardinality n : ℕ) (M : ℝ) : Prop :=
  vdVWTheorem243LogRadiusMillsUpper cardinality
      (NNReal.mk (M ^ 2 / (n : ℝ))
        (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n))) ≤
    vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M

/-- Elementary bound used in the finite-net scale comparison. -/
theorem vdVWTheorem243_exp_neg_one_le_half :
    Real.exp (-1) ≤ (1 / 2 : ℝ) := by
  have h2raw := Real.add_one_le_exp (1 : ℝ)
  have h2 : (2 : ℝ) ≤ Real.exp 1 := by
    norm_num at h2raw ⊢
    exact h2raw
  rw [Real.exp_neg]
  simpa [one_div] using one_div_le_one_div_of_le (by norm_num : (0 : ℝ) < 2) h2

/--
The logarithmic radius based on `cardinality` is bounded by the finite-net
display radius based on `cardinality + 1`.
-/
theorem vdVWTheorem243_logRadius_log_le_succ
    {cardinality : ℕ} (hcardinality : 0 < cardinality) :
    1 + Real.log (cardinality : ℝ) ≤
      1 + Real.log ((cardinality : ℝ) + 1) := by
  have hcpos : 0 < (cardinality : ℝ) := by exact_mod_cast hcardinality
  have hcle : (cardinality : ℝ) ≤ (cardinality : ℝ) + 1 := by linarith
  linarith [Real.log_le_log hcpos hcle]

/--
The compiled log-radius Mills upper is dominated by the VdV&W finite-net
Hoeffding display scale under the explicit positive assumptions on the net
cardinality, sample size, and truncation level.
-/
theorem VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale.of_pos
    {cardinality n : ℕ} {M : ℝ}
    (hcardinality : 0 < cardinality) (hn : 0 < n) (hM_pos : 0 < M) :
    VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale cardinality n M := by
  unfold VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale
  let c : ℝ≥0 :=
    NNReal.mk (M ^ 2 / (n : ℝ))
      (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n))
  let a : ℝ := 1 + Real.log (cardinality : ℝ)
  let b : ℝ := 1 + Real.log ((cardinality : ℝ) + 1)
  let r : ℝ := Real.sqrt (2 * (c : ℝ) * a)
  have hc : 0 < (c : ℝ) := by
    dsimp [c]
    exact vdVWTheorem243_truncated_commonProxy_pos hn hM_pos
  have hc_nonneg : 0 ≤ (c : ℝ) := le_of_lt hc
  have hcardinality_one : (1 : ℝ) ≤ (cardinality : ℝ) := by
    exact_mod_cast Nat.succ_le_of_lt hcardinality
  have ha_nonneg : 0 ≤ a := by
    dsimp [a]
    have hlog : 0 ≤ Real.log (cardinality : ℝ) :=
      Real.log_nonneg hcardinality_one
    linarith
  have ha_one : 1 ≤ a := by
    dsimp [a]
    have hlog : 0 ≤ Real.log (cardinality : ℝ) :=
      Real.log_nonneg hcardinality_one
    linarith
  have hb_nonneg : 0 ≤ b := by
    dsimp [b]
    have hge : (1 : ℝ) ≤ (cardinality : ℝ) + 1 := by
      have hc0 : 0 ≤ (cardinality : ℝ) := by exact_mod_cast Nat.zero_le cardinality
      linarith
    have hlog : 0 ≤ Real.log ((cardinality : ℝ) + 1) :=
      Real.log_nonneg hge
    linarith
  have hab : a ≤ b := by
    dsimp [a, b]
    exact vdVWTheorem243_logRadius_log_le_succ hcardinality
  have hr_pos : 0 < r := by
    dsimp [r, a, c]
    exact vdVWTheorem243_logRadius_pos
      (cardinality := cardinality)
      (c := NNReal.mk (M ^ 2 / (n : ℝ))
        (div_nonneg (sq_nonneg M) (Nat.cast_nonneg n)))
      hcardinality hc
  have hr_nonneg : 0 ≤ r := le_of_lt hr_pos
  have hr_sq : r ^ 2 = 2 * (c : ℝ) * a := by
    dsimp [r]
    rw [Real.sq_sqrt]
    positivity
  have hc_div_r_le : (c : ℝ) / r ≤ r / 2 := by
    rw [div_le_iff₀ hr_pos]
    calc
      (c : ℝ) ≤ (c : ℝ) * a := by nlinarith
      _ = r / 2 * r := by
        calc
          (c : ℝ) * a = r ^ 2 / 2 := by
            rw [hr_sq]
            ring
          _ = r / 2 * r := by ring
  have hmills_le : 2 * Real.exp (-1) * ((c : ℝ) / r) ≤ r / 2 := by
    have he : 2 * Real.exp (-1) ≤ (1 : ℝ) := by
      nlinarith [vdVWTheorem243_exp_neg_one_le_half]
    have hdiv_nonneg : 0 ≤ (c : ℝ) / r := div_nonneg hc_nonneg hr_nonneg
    calc
      2 * Real.exp (-1) * ((c : ℝ) / r) ≤ 1 * ((c : ℝ) / r) := by
        exact mul_le_mul_of_nonneg_right he hdiv_nonneg
      _ = (c : ℝ) / r := by ring
      _ ≤ r / 2 := hc_div_r_le
  have hlog_le :
      vdVWTheorem243LogRadiusMillsUpper cardinality c ≤ (3 / 2) * r := by
    unfold vdVWTheorem243LogRadiusMillsUpper
    dsimp [r, a]
    calc
      Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ))) +
          2 * Real.exp (-1) *
            ((c : ℝ) /
              Real.sqrt (2 * (c : ℝ) * (1 + Real.log (cardinality : ℝ)))) ≤
          r + r / 2 := by
        dsimp [r, a] at hmills_le ⊢
        nlinarith
      _ = (3 / 2) * r := by ring
  have hthree_le :
      (3 / 2 : ℝ) * r ≤ vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M := by
    have hleft_nonneg : 0 ≤ (3 / 2 : ℝ) * r := by positivity
    have hright_nonneg :
        0 ≤ vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M :=
      vdVWTheorem243FiniteNetMaximalUpper_nonneg cardinality
        (vdVWTheorem243HoeffdingCenterScale_nonneg n hM_pos.le)
    rw [← sq_le_sq₀ hleft_nonneg hright_nonneg]
    have hnreal_pos : 0 < (n : ℝ) := by exact_mod_cast hn
    have h6div_nonneg : 0 ≤ 6 / (n : ℝ) := div_nonneg (by norm_num) hnreal_pos.le
    calc
      ((3 / 2 : ℝ) * r) ^ 2 = (9 / 2) * (c : ℝ) * a := by
        rw [mul_pow, hr_sq]
        ring
      _ ≤ 6 * (c : ℝ) * b := by
        nlinarith
      _ = (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M) ^ 2 := by
        unfold vdVWTheorem243FiniteNetHoeffdingUpper
        unfold vdVWTheorem243FiniteNetMaximalUpper
        unfold vdVWTheorem243HoeffdingCenterScale
        dsimp [b, c]
        rw [mul_pow, mul_pow, Real.sq_sqrt hb_nonneg, Real.sq_sqrt h6div_nonneg]
        dsimp [c, b]
        field_simp [ne_of_gt hnreal_pos]
  exact hlog_le.trans hthree_le

/--
Finite-empirical-cover expected maximal bound at the VdV&W finite-net
Hoeffding display scale, assuming only the isolated scale-comparison handoff.

This packages all probabilistic and empirical-cover work proved so far; the
remaining blocker is the real-arithmetic proof of
`VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale`.
-/
theorem
    vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} {Index : Type w} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality)
    (hindexClass_nonempty : ∃ index, index ∈ indexClass)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hn : 0 < n)
    (hM_pos : 0 < M)
    (sign : Fin n -> Ω -> ℝ)
    (hindep : iIndepFun sign μ)
    (hsubG : ∀ i : Fin n, HasSubgaussianMGF (sign i) 1 μ)
    (hscale :
      VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale cardinality n M) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ
      (fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (cover.center centerIndex) sample)
      (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M) := by
  exact
    (vdVWTheorem243_truncated_rademacher_expectedMaximalBound_of_finiteEmpiricalL1CoverAtCard
      cover hindexClass_nonempty henvelope hM_pos.le sign hindep hsubG
      (vdVWTheorem243_truncated_commonProxy_pos hn hM_pos)).trans hscale

/--
Finite-empirical-cover expected maximal bound at the VdV&W finite-net
Hoeffding display scale under explicit positive sample-size and truncation
assumptions.

This closes the scale-comparison hypothesis in the preceding handoff.
-/
theorem
    vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard_of_pos
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} {Index : Type w} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality)
    (hindexClass_nonempty : ∃ index, index ∈ indexClass)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hn : 0 < n)
    (hM_pos : 0 < M)
    (sign : Fin n -> Ω -> ℝ)
    (hindep : iIndepFun sign μ)
    (hsubG : ∀ i : Fin n, HasSubgaussianMGF (sign i) 1 μ) :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ
      (fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (cover.center centerIndex) sample)
      (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M) := by
  exact
    vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard
      cover hindexClass_nonempty henvelope hn hM_pos sign hindep hsubG
      (VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale.of_pos
        (cover.cardinality_pos_of_nonempty hindexClass_nonempty) hn hM_pos)

/--
Closed-form value of the finite-center sub-Gaussian tail majorant over
`(0, ∞)`.
-/
theorem vdVWTheorem243_integral_subGaussian_tail_bound_eq
    {cardinality : ℕ} {c : ℝ≥0} (hc : 0 < (c : ℝ)) :
    (∫ t in Set.Ioi (0 : ℝ),
        (cardinality : ℝ) *
          (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ))))) =
      (cardinality : ℝ) * Real.sqrt (2 * Real.pi * (c : ℝ)) := by
  have _hc : 0 < (c : ℝ) := hc
  have hprev :
      (∫ t in Set.Ioi (0 : ℝ),
          (cardinality : ℝ) *
            (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ))))) =
        (cardinality : ℝ) *
          (2 * (Real.sqrt (Real.pi / ((2 * (c : ℝ))⁻¹)) / 2)) := by
    calc
      (∫ t in Set.Ioi (0 : ℝ),
          (cardinality : ℝ) *
            (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))))
          = ∫ t in Set.Ioi (0 : ℝ),
              ((cardinality : ℝ) * 2) *
                Real.exp (-((2 * (c : ℝ))⁻¹) * t ^ 2) := by
              refine setIntegral_congr_fun measurableSet_Ioi ?_
              intro t _ht
              ring_nf
      _ = ((cardinality : ℝ) * 2) *
            (∫ t in Set.Ioi (0 : ℝ),
              Real.exp (-((2 * (c : ℝ))⁻¹) * t ^ 2)) := by
              rw [integral_const_mul]
      _ = (cardinality : ℝ) *
            (2 * (Real.sqrt (Real.pi / ((2 * (c : ℝ))⁻¹)) / 2)) := by
              rw [integral_gaussian_Ioi]
              ring
  rw [hprev]
  congr 1
  rw [div_inv_eq_mul]
  ring_nf

/--
Closed-form finite-center expectation bound obtained from the compiled
sub-Gaussian union tail and Gaussian integral.

This is still a coarse `N * sqrt c` bound; the later textbook maximal
inequality sharpens it by splitting the tail integral at a logarithmic radius.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_subGaussian_tail_closedForm
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0}
    (hc : 0 < (c : ℝ))
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤
      (cardinality : ℝ) * Real.sqrt (2 * Real.pi * (c : ℝ)) := by
  calc
    vdVWTheorem243FiniteCenterExpectedSupremum μ X
        ≤ ∫ t in Set.Ioi (0 : ℝ),
            (cardinality : ℝ) *
              (2 * Real.exp (-(t ^ 2) / (2 * (c : ℝ)))) :=
          vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_subGaussian_tail_bound
            hcardinality X hX
            (vdVWTheorem243_subGaussian_tail_bound_integrable
              (cardinality := cardinality) (c := c) hc)
    _ = (cardinality : ℝ) * Real.sqrt (2 * Real.pi * (c : ℝ)) :=
          vdVWTheorem243_integral_subGaussian_tail_bound_eq
            (cardinality := cardinality) (c := c) hc

/-- The finite-center expected supremum is nonnegative for a nonempty net. -/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_nonneg
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) :
    0 ≤ vdVWTheorem243FiniteCenterExpectedSupremum μ X := by
  unfold vdVWTheorem243FiniteCenterExpectedSupremum
  apply integral_nonneg
  intro ω
  exact
    (abs_nonneg (X (Classical.arbitrary (Fin cardinality)) ω)).trans
      (Finite.le_ciSup (fun centerIndex : Fin cardinality => |X centerIndex ω|)
        (Classical.arbitrary (Fin cardinality)))

/--
An almost-sure upper bound on the finite-center supremum implies the same
upper bound on its expectation.

This is the deterministic expectation handoff used after the later
tail-to-expectation/Orlicz maximal inequality supplies the a.e. bound.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_of_ae_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (X : Fin cardinality -> Ω -> ℝ) {upper : ℝ}
    (hintegrable :
      Integrable (fun ω =>
        ⨆ centerIndex : Fin cardinality, |X centerIndex ω|) μ)
    (hupper : ∀ᵐ ω ∂μ,
      (⨆ centerIndex : Fin cardinality, |X centerIndex ω|) ≤ upper) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤ upper := by
  unfold vdVWTheorem243FiniteCenterExpectedSupremum
  have hconst : Integrable (fun _ : Ω => upper) μ := integrable_const upper
  have hmono := integral_mono_ae hintegrable hconst hupper
  simpa using hmono

/--
Sub-Gaussian-center specialization of the finite-center expected-supremum
handoff.
-/
theorem vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_ae_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} [Nonempty (Fin cardinality)]
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {upper : ℝ}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hupper : ∀ᵐ ω ∂μ,
      (⨆ centerIndex : Fin cardinality, |X centerIndex ω|) ≤ upper) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤ upper := by
  exact
    vdVWTheorem243FiniteCenterExpectedSupremum_le_of_ae_le X
      (vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
        X hX)
      hupper

/--
Positive-cardinality version of the sub-Gaussian expected-supremum handoff.
-/
theorem
    vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_pos_of_ae_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {cardinality : ℕ} (hcardinality : 0 < cardinality)
    (X : Fin cardinality -> Ω -> ℝ) {c : ℝ≥0} {upper : ℝ}
    (hX : ∀ centerIndex : Fin cardinality, HasSubgaussianMGF (X centerIndex) c μ)
    (hupper : ∀ᵐ ω ∂μ,
      (⨆ centerIndex : Fin cardinality, |X centerIndex ω|) ≤ upper) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ X ≤ upper := by
  haveI : Nonempty (Fin cardinality) := ⟨⟨0, hcardinality⟩⟩
  exact
    vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_ae_le
      X hX hupper

/--
Book-facing predicate for the finite-center Hoeffding/Orlicz step after
specializing the weighted sums to fixed Rademacher signs.

The next probabilistic primitive must prove this predicate from a genuine iid
Rademacher construction plus mathlib's sub-Gaussian/Hoeffding APIs.
-/
def VdVWTheorem243RademacherFiniteCenterHoeffdingBound
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (classFun : Index -> Observation -> ℝ) {cardinality : ℕ}
    (center : Fin cardinality -> Index)
    (sign : Fin n -> ℝ) (M : ℝ) : Prop :=
  VdVWTheorem243FiniteCenterMaximalBound sample classFun center
    (vdVWRademacherWeights sign) (vdVWTheorem243HoeffdingCenterScale n M)

/--
Rademacher-sign specialization of the finite empirical-net Hoeffding handoff.

This closes the deterministic passage from fixed signs to the current
`VdVWTheorem243FiniteCenterMaximalBound` blocker; it still assumes the
finite-center Hoeffding/Orlicz predicate and does not claim the probabilistic
construction of iid signs.
-/
theorem
    vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSignVector
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon M : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    (sign : Fin n -> ℝ)
    (hsign : VdVWRademacherSignVector sign)
    (hepsilon_nonneg : 0 ≤ epsilon)
    (hM_nonneg : 0 ≤ M)
    (hmaximal :
      VdVWTheorem243RademacherFiniteCenterHoeffdingBound sample classFun
        cover.center sign M) :
    vdVWWeightedClassSupremum indexClass classFun (vdVWRademacherWeights sign)
        sample ≤
      vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M + epsilon := by
  exact
    vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_finiteEmpiricalL1CoverAtCard
      (sample := sample) (indexClass := indexClass) (classFun := classFun)
      (epsilon := epsilon) (M := M) cover
      (abs_vdVWRademacherWeights_le_inv_card_of_signVector hsign)
      hepsilon_nonneg hM_nonneg
      (by
        simpa [VdVWTheorem243RademacherFiniteCenterHoeffdingBound] using hmaximal)

/--
Random Rademacher signs give the finite-net Hoeffding handoff almost surely
whenever the sign-vector support and finite-center Hoeffding predicate hold
almost surely.

This is the probability-facing wrapper around the deterministic sign-vector
handoff above; the remaining theorem-line work is to prove the `hmaximal`
event from iid Rademacher signs and sub-Gaussian/Hoeffding bounds.
-/
theorem
    ae_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSigns
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Observation : Type v} {Index : Type w} {n : ℕ}
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {epsilon M : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    (sign : Fin n -> Ω -> ℝ)
    (hsign : ∀ᵐ ω ∂μ, VdVWRademacherSignVector (fun i : Fin n => sign i ω))
    (hepsilon_nonneg : 0 ≤ epsilon)
    (hM_nonneg : 0 ≤ M)
    (hmaximal : ∀ᵐ ω ∂μ,
      VdVWTheorem243RademacherFiniteCenterHoeffdingBound sample classFun
        cover.center (fun i : Fin n => sign i ω) M) :
    ∀ᵐ ω ∂μ,
      vdVWWeightedClassSupremum indexClass classFun
          (vdVWRademacherWeights (fun i : Fin n => sign i ω)) sample ≤
        vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M + epsilon := by
  filter_upwards [hsign, hmaximal] with ω hsignω hmaxω
  exact
    vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSignVector
      cover (fun i : Fin n => sign i ω) hsignω hepsilon_nonneg hM_nonneg hmaxω

/--
Proof-carrying finite-sample symmetrization precursor for Theorem 2.4.3.

This packages the product-copy laws, finite-product sample-coordinate laws,
centered pair-difference facts, random-sign finite-net handoff, and the
finite-cover expected-maximal bound that have already been proved locally.
The remaining theorem-specific work is to turn this package into the final
product/Fubini symmetrization inequality and then feed the entropy condition.
-/
structure VdVWTheorem243SymmetrizationPrecursor
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {Observation : Type v} [MeasurableSpace Observation]
    {Index : Type w} {n : ℕ}
    (P : Measure Observation) [IsProbabilityMeasure P]
    (sample : SampleAt Observation n)
    {indexClass : Set Index}
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (M epsilon : ℝ) {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality)
    (sign : Fin n -> Ω -> ℝ) : Prop where
  productCopy_laws_indep :
    ∀ index, index ∈ indexClass ->
      HasLaw
          (fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.1)
          (P.map (vdVWTruncatedClassFun classFun envelope M index)) (P.prod P) ∧
        HasLaw
          (fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.2)
          (P.map (vdVWTruncatedClassFun classFun envelope M index)) (P.prod P) ∧
        HasLaw
          (fun z : Observation × Observation =>
            (vdVWTruncatedClassFun classFun envelope M index z.1,
              vdVWTruncatedClassFun classFun envelope M index z.2))
          ((P.map (vdVWTruncatedClassFun classFun envelope M index)).prod
            (P.map (vdVWTruncatedClassFun classFun envelope M index)))
          (P.prod P) ∧
        (fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.1) ⟂ᵢ[P.prod P]
          (fun z : Observation × Observation =>
            vdVWTruncatedClassFun classFun envelope M index z.2)
  productSample_coordinates_laws_indep :
    ∀ index, index ∈ indexClass ->
      (∀ i : Fin n,
        HasLaw
          (fun samplePath : SampleAt Observation n =>
            vdVWTruncatedClassFun classFun envelope M index (samplePath i))
          (P.map (vdVWTruncatedClassFun classFun envelope M index))
          (vdVWProductMeasure P n)) ∧
        iIndepFun
          (fun i : Fin n => fun samplePath : SampleAt Observation n =>
            vdVWTruncatedClassFun classFun envelope M index (samplePath i))
          (vdVWProductMeasure P n) ∧
        HasLaw
          (fun samplePath : SampleAt Observation n => fun i : Fin n =>
            vdVWTruncatedClassFun classFun envelope M index (samplePath i))
          (Measure.pi fun _ : Fin n =>
            P.map (vdVWTruncatedClassFun classFun envelope M index))
          (vdVWProductMeasure P n)
  pairDifference_integrable :
    ∀ index, index ∈ indexClass ->
      Integrable
        (fun z : Observation × Observation =>
          vdVWTruncatedClassFun classFun envelope M index z.1 -
            vdVWTruncatedClassFun classFun envelope M index z.2)
        (P.prod P)
  pairDifference_mean_zero :
    ∀ index, index ∈ indexClass ->
      ∫ z : Observation × Observation,
          vdVWTruncatedClassFun classFun envelope M index z.1 -
            vdVWTruncatedClassFun classFun envelope M index z.2 ∂(P.prod P) =
        0
  productSample_pairDifference_weightedSum_mean_zero :
    ∀ index, index ∈ indexClass -> ∀ weights : Fin n -> ℝ,
      ∫ productSample : SampleAt (Observation × Observation) n,
          vdVWWeightedSampleSum
            (fun index : Index => fun z : Observation × Observation =>
              vdVWTruncatedClassFun classFun envelope M index z.1 -
                vdVWTruncatedClassFun classFun envelope M index z.2)
            weights index productSample ∂(vdVWProductMeasure (P.prod P) n) =
        0
  randomSign_finiteNet_ae :
    ∀ᵐ ω ∂μ,
      vdVWWeightedClassSupremum indexClass
          (vdVWTruncatedClassFun classFun envelope M)
          (vdVWRademacherWeights (fun i : Fin n => sign i ω)) sample ≤
        vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M + epsilon
  randomSign_expectedMaximal :
    VdVWTheorem243FiniteCenterExpectedMaximalBound μ
      (fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (cover.center centerIndex) sample)
      (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M)

/--
Projection of the precursor's random-sign finite-center expected-maximal
field into the concrete expected-supremum inequality.
-/
theorem VdVWTheorem243SymmetrizationPrecursor.randomSign_expectedMaximal_le
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} [MeasurableSpace Observation]
    {Index : Type w} {n : ℕ}
    {P : Measure Observation} [IsProbabilityMeasure P]
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    {cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality}
    {sign : Fin n -> Ω -> ℝ}
    (precursor :
      VdVWTheorem243SymmetrizationPrecursor
        (μ := μ) (P := P) (sample := sample) (indexClass := indexClass)
        (classFun := classFun) (envelope := envelope) (M := M)
        (epsilon := epsilon) (cover := cover) (sign := sign)) :
    vdVWTheorem243FiniteCenterExpectedSupremum μ
      (fun centerIndex : Fin cardinality =>
        fun ω =>
          vdVWWeightedSampleSum
            (vdVWTruncatedClassFun classFun envelope M)
            (vdVWRademacherWeights (fun i : Fin n => sign i ω))
            (cover.center centerIndex) sample)
      ≤ vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M := by
  simpa [VdVWTheorem243FiniteCenterExpectedMaximalBound] using
    precursor.randomSign_expectedMaximal

/--
The precursor's a.e. finite-net random-sign bound gives the corresponding
nonnegative VdV&W outer-expectation bound for any supplied measurable cover of
the random-sign weighted supremum.
-/
theorem
    VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} [MeasurableSpace Observation]
    {Index : Type w} {n : ℕ}
    {P : Measure Observation} [IsProbabilityMeasure P]
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    {cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality}
    {sign : Fin n -> Ω -> ℝ}
    (precursor :
      VdVWTheorem243SymmetrizationPrecursor
        (μ := μ) (P := P) (sample := sample) (indexClass := indexClass)
        (classFun := classFun) (envelope := envelope) (M := M)
        (epsilon := epsilon) (cover := cover) (sign := sign))
    (U : VdVWMeasurableCover μ
      (fun ω => ENNReal.ofReal
        (vdVWWeightedClassSupremum indexClass
          (vdVWTruncatedClassFun classFun envelope M)
          (vdVWRademacherWeights (fun i : Fin n => sign i ω)) sample))) :
    VdVWOuterExpectation μ
      (fun ω => ENNReal.ofReal
        (vdVWWeightedClassSupremum indexClass
          (vdVWTruncatedClassFun classFun envelope M)
          (vdVWRademacherWeights (fun i : Fin n => sign i ω)) sample)) ≤
      ENNReal.ofReal
        (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M + epsilon) := by
  exact
    VdVWOuterExpectation_le_of_cover_ae_le_const_ofReal U
      precursor.randomSign_finiteNet_ae

/--
Once the theorem-specific `Phi(x)=x` symmetrization comparison has bounded the
centered truncated empirical supremum by twice the random-sign outer
expectation, the precursor's finite-net projection gives the corresponding
Hoeffding-scale bound.
-/
theorem
    VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} [MeasurableSpace Observation]
    {Index : Type w} {n : ℕ}
    {P : Measure Observation} [IsProbabilityMeasure P]
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    {cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality}
    {sign : Fin n -> Ω -> ℝ}
    (precursor :
      VdVWTheorem243SymmetrizationPrecursor
        (μ := μ) (P := P) (sample := sample) (indexClass := indexClass)
        (classFun := classFun) (envelope := envelope) (M := M)
        (epsilon := epsilon) (cover := cover) (sign := sign))
    (U : VdVWMeasurableCover μ
      (fun ω => ENNReal.ofReal
        (vdVWWeightedClassSupremum indexClass
          (vdVWTruncatedClassFun classFun envelope M)
          (vdVWRademacherWeights (fun i : Fin n => sign i ω)) sample)))
    (hphi_id :
      ENNReal.ofReal
          (vdVWWeightedClassSupremum indexClass
            (fun index : Index => fun observation : Observation =>
              vdVWTruncatedClassFun classFun envelope M index observation -
                ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P)
            (fun _ : Fin n => (n : ℝ)⁻¹) sample) ≤
        (2 : ℝ≥0∞) *
          VdVWOuterExpectation μ
            (fun ω => ENNReal.ofReal
              (vdVWWeightedClassSupremum indexClass
                (vdVWTruncatedClassFun classFun envelope M)
                (vdVWRademacherWeights (fun i : Fin n => sign i ω)) sample))) :
    ENNReal.ofReal
        (vdVWWeightedClassSupremum indexClass
          (fun index : Index => fun observation : Observation =>
            vdVWTruncatedClassFun classFun envelope M index observation -
              ∫ x, vdVWTruncatedClassFun classFun envelope M index x ∂P)
          (fun _ : Fin n => (n : ℝ)⁻¹) sample) ≤
      (2 : ℝ≥0∞) *
        ENNReal.ofReal
          (vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M + epsilon) := by
  exact
    hphi_id.trans
      (mul_le_mul_right
        (VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add
          precursor U)
        (2 : ℝ≥0∞))

/--
Construct the finite-sample symmetrization precursor from the existing
product-copy, random-sign, and finite-cover maximal layers.
-/
theorem VdVWTheorem243SymmetrizationPrecursor.of_finiteEmpiricalCover
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Observation : Type v} [MeasurableSpace Observation]
    {Index : Type w} {n : ℕ}
    {P : Measure Observation} [IsProbabilityMeasure P]
    {sample : SampleAt Observation n}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    {envelope : Observation -> ℝ} {M epsilon : ℝ} {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass
        (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality)
    (hclass : VdVWClassCoordinateMeasurable indexClass classFun)
    (henvelope_meas : Measurable envelope)
    (htruncIntegrable :
      ∀ index, index ∈ indexClass ->
        Integrable (vdVWTruncatedClassFun classFun envelope M index) P)
    (hindexClass_nonempty : ∃ index, index ∈ indexClass)
    (henvelope : VdVWClassEnvelope indexClass classFun envelope)
    (hn : 0 < n)
    (hM_pos : 0 < M)
    (sign : Fin n -> Ω -> ℝ)
    (hsign : ∀ᵐ ω ∂μ, VdVWRademacherSignVector (fun i : Fin n => sign i ω))
    (hindep : iIndepFun sign μ)
    (hsubG : ∀ i : Fin n, HasSubgaussianMGF (sign i) 1 μ)
    (hepsilon_nonneg : 0 ≤ epsilon)
    (hmaximal : ∀ᵐ ω ∂μ,
      VdVWTheorem243RademacherFiniteCenterHoeffdingBound sample
        (vdVWTruncatedClassFun classFun envelope M) cover.center
        (fun i : Fin n => sign i ω) M) :
    VdVWTheorem243SymmetrizationPrecursor
      (μ := μ) (P := P) (sample := sample) (indexClass := indexClass)
      (classFun := classFun) (envelope := envelope) (M := M)
      (epsilon := epsilon) (cover := cover) (sign := sign) := by
  refine
    { productCopy_laws_indep := ?_
      productSample_coordinates_laws_indep := ?_
      pairDifference_integrable := ?_
      pairDifference_mean_zero := ?_
      productSample_pairDifference_weightedSum_mean_zero := ?_
      randomSign_finiteNet_ae := ?_
      randomSign_expectedMaximal := ?_ }
  · intro index hindex
    exact
      vdVWTheorem243_productCopy_truncatedClassFun_laws_indep
        (P := P) hclass henvelope_meas hindex
  · intro index hindex
    exact
      vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep
        (P := P) hclass henvelope_meas hindex n
  · intro index hindex
    exact
      integrable_vdVWTruncatedClassFun_pairDifference
        (P := P) (htruncIntegrable index hindex)
  · intro index hindex
    exact
      integral_vdVWTruncatedClassFun_productCopy_pairDifference_eq_zero
        (P := P) (htruncIntegrable index hindex)
  · intro index hindex weights
    exact
      integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero
        (P := P) (index := index) weights (htruncIntegrable index hindex)
  · exact
      ae_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSigns
        (cover := cover) (sign := sign) hsign hepsilon_nonneg hM_pos.le hmaximal
  · exact
      vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard_of_pos
        cover hindexClass_nonempty henvelope hn hM_pos sign hindep hsubG

/--
Common-domain VdV&W stochastic little-o in outer probability.

`VdVWOuterProbabilityLittleOAtTop μ process scale` means
`process_n / scale_n -> 0` in the already formalized VdV&W outer-probability
sense.  This is the book-facing wrapper behind notation such as
`process_n = o_P^*(scale_n)`.
-/
def VdVWOuterProbabilityLittleOAtTop {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (process : Ω -> ℕ -> ℝ) (scale : ℕ -> ℝ) : Prop :=
  VdVWConvergesInOuterProbability μ
    (fun n ω => process ω n / scale n) atTop (fun _ => 0)

/-- The special case `process_n = o_P^*(n)`. -/
def VdVWOuterProbabilityLittleO_n {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (process : Ω -> ℕ -> ℝ) : Prop :=
  VdVWOuterProbabilityLittleOAtTop μ process fun n => (n : ℝ)

/--
The random fixed-sample empirical `L1(P_n)` covering number induced by an
observation process.
-/
noncomputable def vdVWRandomEmpiricalL1CoveringNumber
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    (X : ℕ -> Ω -> Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (epsilon : ℝ) :
    Ω -> ℕ -> ℕ∞ :=
  fun ω n =>
    empiricalL1CoveringNumber (samplePath X ω n) indexClass classFun epsilon

/--
A finite-valued upper envelope for the random empirical covering number.

This avoids pretending that `log` of the value `⊤ : ℕ∞` is a finite real while
still giving the exact finite-cardinality witness shape used in the proof of
Theorem 2.4.3.
-/
def VdVWRandomEmpiricalL1CoveringNumberLeCardinality
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    (X : ℕ -> Ω -> Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (epsilon : ℝ)
    (cardinality : Ω -> ℕ -> ℕ) : Prop :=
  ∀ ω n,
    vdVWRandomEmpiricalL1CoveringNumber X indexClass classFun epsilon ω n ≤
      (cardinality ω n : ℕ∞)

/-- The finite real logarithm used for a supplied empirical-cover cardinality. -/
noncomputable def vdVWLogEmpiricalL1CoveringCardinality
    {Ω : Type u} (cardinality : Ω -> ℕ -> ℕ) : Ω -> ℕ -> ℝ :=
  fun ω n => Real.log ((cardinality ω n : ℝ) + 1)

/-- The supplied log-cardinality process is nonnegative. -/
theorem vdVWLogEmpiricalL1CoveringCardinality_nonneg
    {Ω : Type u} (cardinality : Ω -> ℕ -> ℕ) (ω : Ω) (n : ℕ) :
    0 ≤ vdVWLogEmpiricalL1CoveringCardinality cardinality ω n := by
  unfold vdVWLogEmpiricalL1CoveringCardinality
  apply Real.log_nonneg
  have hnonneg : (0 : ℝ) ≤ (cardinality ω n : ℝ) := Nat.cast_nonneg _
  linarith

/--
Fixed-`epsilon` random empirical entropy condition for Theorem 2.4.3.

The field `coveringNumber_le` records a finite-cardinality domination of
`N(epsilon, F_M, L1(P_n))`; the field `log_cardinality_littleO_n` records the
book's `log N = o_P^*(n)` condition in outer probability for that finite
cardinality process.
-/
structure VdVWTheorem243EmpiricalEntropyCondition
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] (μ : Measure Ω)
    (X : ℕ -> Ω -> Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (epsilon : ℝ)
    (cardinality : Ω -> ℕ -> ℕ) : Prop where
  coveringNumber_le :
    VdVWRandomEmpiricalL1CoveringNumberLeCardinality X indexClass classFun
      epsilon cardinality
  log_cardinality_littleO_n :
    VdVWOuterProbabilityLittleO_n μ
      (vdVWLogEmpiricalL1CoveringCardinality cardinality)

/--
The all-positive-radius version of the empirical entropy condition.

Later Theorem 2.4.3 layers can instantiate `indexClass` and `classFun` with
the truncated class `F_M`.
-/
def VdVWTheorem243EmpiricalEntropyConditionForAllEpsilon
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] (μ : Measure Ω)
    (X : ℕ -> Ω -> Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ)
    (cardinality : ℝ -> Ω -> ℕ -> ℕ) : Prop :=
  ∀ epsilon > 0,
    VdVWTheorem243EmpiricalEntropyCondition μ X indexClass classFun epsilon
      (cardinality epsilon)

/--
The fixed-`epsilon` empirical entropy condition specialized to the truncated
class `F_M`.
-/
def VdVWTheorem243TruncatedEntropyCondition
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] (μ : Measure Ω)
    (X : ℕ -> Ω -> Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (M epsilon : ℝ) (cardinality : Ω -> ℕ -> ℕ) : Prop :=
  VdVWTheorem243EmpiricalEntropyCondition μ X indexClass
    (vdVWTruncatedClassFun classFun envelope M) epsilon cardinality

/--
The book-facing random entropy hypothesis for every positive truncation level
and every positive covering radius.
-/
def VdVWTheorem243TruncatedEntropyConditionForAllEpsilonM
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] (μ : Measure Ω)
    (X : ℕ -> Ω -> Observation) (indexClass : Set Index)
    (classFun : Index -> Observation -> ℝ) (envelope : Observation -> ℝ)
    (cardinality : ℝ -> ℝ -> Ω -> ℕ -> ℕ) : Prop :=
  ∀ M > 0, ∀ epsilon > 0,
    VdVWTheorem243TruncatedEntropyCondition μ X indexClass classFun envelope
      M epsilon (cardinality M epsilon)

end StatInference
