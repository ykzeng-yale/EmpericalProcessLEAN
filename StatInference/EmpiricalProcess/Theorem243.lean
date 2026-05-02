import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Probability.Moments.SubGaussian
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

/--
A deterministic sign vector with the support of Rademacher signs.

The later probability layer will realize this predicate from an iid
Rademacher law.  This local layer records only the fixed-sign algebra needed
to connect the textbook display to the empirical-net handoff.
-/
def VdVWRademacherSignVector {n : ℕ} (sign : Fin n -> ℝ) : Prop :=
  ∀ i, sign i = -1 ∨ sign i = 1

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
