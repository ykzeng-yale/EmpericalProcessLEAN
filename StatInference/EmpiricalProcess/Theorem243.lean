import Mathlib.Analysis.SpecialFunctions.Log.Basic
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

open MeasureTheory Filter
open scoped ENNReal Topology

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
