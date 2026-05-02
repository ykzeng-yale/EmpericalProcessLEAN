import Mathlib.Analysis.SpecialFunctions.Log.Basic
import StatInference.EmpiricalProcess.CoveringPrimitive
import StatInference.EmpiricalProcess.GlivenkoCantelli

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

end StatInference
