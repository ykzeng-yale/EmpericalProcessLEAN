import StatInference.EmpiricalProcess.EndpointSamples

/-!
# Glivenko-Cantelli wrappers

This module names the Glivenko-Cantelli conclusion used by the
dependency-minimal formalization of van der Vaart and Wellner, Theorem 2.4.1.

The textbook states the conclusion in outer-probability / outer-almost-sure
language.  In mathlib, `μ s` for a `Measure` is already the value of the
underlying outer measure on an arbitrary set `s`, so the exceptional event in
the GC statement can be represented without a measurability proof for that
event.
-/

namespace StatInference

open MeasureTheory ProbabilityTheory Filter

open scoped ENNReal Topology Function

universe u v w

/--
VdV&W outer probability of an event.

Mathlib measures evaluate arbitrary sets through their underlying outer
measure; see `MeasureTheory.Measure` in mathlib's measure-space foundation.
-/
def VdVWOuterProbability {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (event : Set Ω) : ℝ≥0∞ :=
  μ event

/--
VdV&W outer-almost-sure truth of a predicate.

This is the outer-probability form of "the exceptional set has probability
zero", and it does not require the exceptional set to be measurable.
-/
def VdVWOuterAlmostSure {Ω : Type u} [MeasurableSpace Ω]
    (μ : Measure Ω) (predicate : Ω -> Prop) : Prop :=
  VdVWOuterProbability μ {ω | ¬ predicate ω} = 0

/-- Ordinary mathlib a.e. truth implies the explicit VdV&W outer-a.s. form. -/
theorem vdVWOuterAlmostSure_of_ae {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {predicate : Ω -> Prop}
    (h : ∀ᵐ ω ∂μ, predicate ω) :
    VdVWOuterAlmostSure μ predicate := by
  simpa [VdVWOuterAlmostSure, VdVWOuterProbability] using (ae_iff.mp h)

/--
Almost-sure pathwise uniform empirical-deviation convergence.

For each sample point outside a null set, the empirical deviations over
`indexClass` tend to zero uniformly in the epsilon/eventual sense formalized by
`UniformDeviationTendstoZeroOn`.
-/
def AlmostSureUniformDeviationTendstoZeroOn {Ω : Type u} {Index : Type v}
    [MeasurableSpace Ω] (μ : Measure Ω) (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ) : Prop :=
  ∀ᵐ ω ∂μ,
    UniformDeviationTendstoZeroOn indexClass populationRisk (empiricalRisk ω)

/--
Outer-almost-sure version of VdV&W's uniform law of large numbers over a class.

The predicate inside the exceptional event is the local epsilon/eventual
version of `||P_n - P||_F -> 0`.
-/
def VdVWOuterAlmostSureUniformDeviationTendstoZeroOn
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    (μ : Measure Ω) (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ) : Prop :=
  VdVWOuterAlmostSure μ
    (fun ω =>
      UniformDeviationTendstoZeroOn indexClass populationRisk (empiricalRisk ω))

/--
VdV&W convergence in outer probability for the uniform law of large numbers
over a class.

For every positive tolerance, the outer probability of the event that the
uniform empirical-deviation bound fails tends to zero.
-/
def VdVWOuterProbabilityUniformDeviationTendstoZeroOn
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    (μ : Measure Ω) (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ) : Prop :=
  ∀ tolerance > 0,
    Tendsto
      (fun sampleSize : ℕ =>
        VdVWOuterProbability μ
          {ω |
            ¬ EmpiricalDeviationBoundOn indexClass populationRisk
              (empiricalRisk ω sampleSize) tolerance})
      atTop (𝓝 0)

/--
Tail-event form of outer-probability control for the uniform law.

For each positive tolerance, the outer probability that some future sample size
violates the uniform empirical-deviation bound after `start` tends to zero as
`start -> ∞`.
-/
def VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    (μ : Measure Ω) (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ) : Prop :=
  ∀ tolerance > 0,
    Tendsto
      (fun start : ℕ =>
        VdVWOuterProbability μ
          {ω |
            ∃ sampleSize ≥ start,
              ¬ EmpiricalDeviationBoundOn indexClass populationRisk
                (empiricalRisk ω sampleSize) tolerance})
      atTop (𝓝 0)

/--
Tail-event outer-probability control implies one-time outer-probability
convergence.

This is the deterministic bridge needed before proving the direct
outer-probability branch from stronger tail or measurability hypotheses.
-/
theorem vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_tail
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    {μ : Measure Ω} {indexClass : Set Index}
    {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    (h_tail :
      VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn μ indexClass
        populationRisk empiricalRisk) :
    VdVWOuterProbabilityUniformDeviationTendstoZeroOn μ indexClass
      populationRisk empiricalRisk := by
  intro tolerance htolerance
  refine
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
      (h_tail tolerance htolerance) (fun sampleSize => (zero_le :
        (0 : ℝ≥0∞) ≤
          VdVWOuterProbability μ
            {ω |
              ¬ EmpiricalDeviationBoundOn indexClass populationRisk
                (empiricalRisk ω sampleSize) tolerance})) ?_
  intro sampleSize
  dsimp [VdVWOuterProbability]
  exact measure_mono (fun ω hω => ⟨sampleSize, le_rfl, hω⟩)

/--
The local a.s. pathwise convergence predicate implies the explicit
outer-almost-sure VdV&W predicate.
-/
theorem vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_almostSure
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    {μ : Measure Ω} {indexClass : Set Index}
    {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    (h :
      AlmostSureUniformDeviationTendstoZeroOn μ indexClass
        populationRisk empiricalRisk) :
    VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ indexClass
      populationRisk empiricalRisk :=
  vdVWOuterAlmostSure_of_ae h

/--
VdV&W-style almost-sure Glivenko-Cantelli class for an iid observation process,
expressed in the local pathwise uniform-deviation interface.

This record packages the sample-process law assumptions together with the
ordinary almost-sure uniform convergence conclusion.  The outer-a.s. textbook
wrapper is `VdVWOuterAlmostSurePGlivenkoCantelliClass` below.
-/
structure VdVWAlmostSureGlivenkoCantelliClass
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    (μ : Measure Ω) (P : Measure Observation)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (X : ℕ -> Ω -> Observation) : Prop where
  law : ∀ i, HasLaw (X i) P μ
  independent : Pairwise ((· ⟂ᵢ[μ] ·) on X)
  uniform_deviation_ae :
    AlmostSureUniformDeviationTendstoZeroOn μ indexClass
      (fun index => populationRiskOfFunction P (classFun index))
      (fun ω sampleSize index =>
        empiricalAverage (samplePath X ω sampleSize) (classFun index))

/--
VdV&W outer-a.s. `P`-Glivenko-Cantelli class for a chosen iid observation
process, expressed through the local uniform-deviation predicate.
-/
def VdVWOuterAlmostSurePGlivenkoCantelliClass
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    (μ : Measure Ω) (P : Measure Observation)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (X : ℕ -> Ω -> Observation) : Prop :=
  VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ indexClass
    (fun index => populationRiskOfFunction P (classFun index))
    (fun ω sampleSize index =>
      empiricalAverage (samplePath X ω sampleSize) (classFun index))

/--
VdV&W outer-probability `P`-Glivenko-Cantelli predicate for a chosen iid
observation process.
-/
def VdVWOuterProbabilityPGlivenkoCantelliClass
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    (μ : Measure Ω) (P : Measure Observation)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (X : ℕ -> Ω -> Observation) : Prop :=
  VdVWOuterProbabilityUniformDeviationTendstoZeroOn μ indexClass
    (fun index => populationRiskOfFunction P (classFun index))
    (fun ω sampleSize index =>
      empiricalAverage (samplePath X ω sampleSize) (classFun index))

/--
Book-style `P`-Glivenko-Cantelli predicate: the uniform law holds either in
outer probability or outer almost surely, matching the phrasing in the
empirical-process introduction.
-/
def VdVWPGlivenkoCantelliClass
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    (μ : Measure Ω) (P : Measure Observation)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (X : ℕ -> Ω -> Observation) : Prop :=
  VdVWOuterProbabilityPGlivenkoCantelliClass μ P indexClass classFun X ∨
    VdVWOuterAlmostSurePGlivenkoCantelliClass μ P indexClass classFun X

/--
Primitive finite `L1(P)` bracketing numbers at every positive radius imply the
named almost-sure pathwise uniform-deviation conclusion for iid observations.
-/
theorem almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_bracketing :
      ∀ epsilon, 0 < epsilon ->
        l1BracketingNumber P indexClass classFun epsilon < ⊤) :
    AlmostSureUniformDeviationTendstoZeroOn μ indexClass
      (fun index => populationRiskOfFunction P (classFun index))
      (fun ω sampleSize index =>
        empiricalAverage (samplePath X ω sampleSize) (classFun index)) :=
  uniformDeviationTendstoZeroOn_ae_of_iid_l1BracketingNumber_lt_top
    X hLaw hindep h_bracketing

/--
Primitive finite `L1(P)` bracketing numbers at every positive radius imply the
outer-almost-sure VdV&W uniform-deviation conclusion for iid observations.
-/
theorem vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_bracketing :
      ∀ epsilon, 0 < epsilon ->
        l1BracketingNumber P indexClass classFun epsilon < ⊤) :
    VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ indexClass
      (fun index => populationRiskOfFunction P (classFun index))
      (fun ω sampleSize index =>
        empiricalAverage (samplePath X ω sampleSize) (classFun index)) :=
  vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_almostSure
    (almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top
      X hLaw hindep h_bracketing)

/--
Dependency-minimal VdV&W Theorem 2.4.1 wrapper.

Under iid observations and finite primitive `L1(P)` bracketing numbers at every
positive radius, the indexed function class is Glivenko-Cantelli in the local
almost-sure pathwise sense.
-/
theorem vdVWAlmostSureGlivenkoCantelliClass_of_iid_l1BracketingNumber_lt_top
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_bracketing :
      ∀ epsilon, 0 < epsilon ->
        l1BracketingNumber P indexClass classFun epsilon < ⊤) :
    VdVWAlmostSureGlivenkoCantelliClass μ P indexClass classFun X where
  law := hLaw
  independent := hindep
  uniform_deviation_ae :=
    almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top
      X hLaw hindep h_bracketing

/--
VdV&W Theorem 2.4.1 in the outer-almost-sure convergence mode.

If the primitive `L1(P)` bracketing number of the function class is finite at
every positive radius, then the class is `P`-Glivenko-Cantelli for iid
observations in the explicit VdV&W outer-a.s. sense.
-/
theorem vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_bracketing :
      ∀ epsilon, 0 < epsilon ->
        l1BracketingNumber P indexClass classFun epsilon < ⊤) :
    VdVWOuterAlmostSurePGlivenkoCantelliClass μ P indexClass classFun X :=
  vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top
    X hLaw hindep h_bracketing

/--
VdV&W Theorem 2.4.1 in the book-style `P`-Glivenko-Cantelli predicate.

The proof enters the predicate through the outer-a.s. branch, exactly as the
textbook proof establishes.
-/
theorem vdVW_theorem_2_4_1_glivenkoCantelli
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_bracketing :
      ∀ epsilon, 0 < epsilon ->
        l1BracketingNumber P indexClass classFun epsilon < ⊤) :
    VdVWPGlivenkoCantelliClass μ P indexClass classFun X :=
  Or.inr
    (vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli
      X hLaw hindep h_bracketing)

end StatInference
