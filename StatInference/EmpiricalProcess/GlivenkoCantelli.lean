import StatInference.EmpiricalProcess.EndpointSamples

/-!
# Almost-sure Glivenko-Cantelli wrappers

This module names the almost-sure, pathwise Glivenko-Cantelli conclusion used
by the dependency-minimal formalization of van der Vaart and Wellner,
Theorem 2.4.1.

The textbook states the conclusion in outer-probability / outer-almost-sure
language.  The proved primitive bracketing theorem in this repository currently
delivers a stronger-looking ordinary almost-sure statement in the local
`UniformDeviationTendstoZeroOn` interface, under explicit iid sample-process
assumptions.  This file records that conclusion as a theorem-level
Glivenko-Cantelli wrapper without pretending that the full outer-probability
machinery has already been formalized.
-/

namespace StatInference

open MeasureTheory ProbabilityTheory

open scoped Topology Function

universe u v w

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
VdV&W-style almost-sure Glivenko-Cantelli class for an iid observation process,
expressed in the local pathwise uniform-deviation interface.

This record packages the sample-process law assumptions together with the
almost-sure uniform convergence conclusion.  It is intentionally not named as
an outer-probability theorem; that literal textbook layer requires additional
outer-probability infrastructure.
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

end StatInference
