import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.Probability.HasLawExists
import Mathlib.Probability.IdentDistrib
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Probability.ProbabilityMassFunction.Integrals
import StatInference.EmpiricalProcess.CoveringPrimitive
import StatInference.EmpiricalProcess.GlivenkoCantelli
import StatInference.EmpiricalProcess.PMeasurable

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
  exact hintegrable.integral_eq_integral_meas_le hnonneg

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
  rw [vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail X hintegrable]
  refine integral_mono_of_nonneg
    (μ := volume.restrict (Set.Ioi (0 : ℝ)))
    (f := fun t => μ.real
      {ω | t ≤ (⨆ centerIndex : Fin cardinality, |X centerIndex ω|)})
    (g := tailBound) ?_ hboundIntegrable ?_
  · exact Eventually.of_forall fun _ => measureReal_nonneg
  · exact (ae_restrict_mem measurableSet_Ioi).mono fun t ht => hbound t ht

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
