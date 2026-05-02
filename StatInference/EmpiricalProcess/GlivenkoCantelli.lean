import StatInference.EmpiricalProcess.EndpointSamples
import Mathlib.MeasureTheory.Function.ConvergenceInMeasure

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

/--
VdV&W Definition 1.10.1, specialized to convergence in outer probability to a
constant while allowing the sample spaces to vary with the directed index.

The textbook writes the event as `d (X_i, c) > epsilon`; the Lean predicate
uses the equivalent strict comparison `epsilon < dist (X_i omega) c`.
-/
def VdVWConvergesInOuterProbabilityConst
    {ι : Type w} {D : Type v} [PseudoMetricSpace D]
    (Ω : ι -> Type u) (mΩ : (i : ι) -> MeasurableSpace (Ω i))
    (μ : (i : ι) -> @Measure (Ω i) (mΩ i))
    (X : (i : ι) -> Ω i -> D) (l : Filter ι) (c : D) : Prop :=
  ∀ ε > 0,
    Tendsto
      (fun i =>
        @VdVWOuterProbability (Ω i) (mΩ i) (μ i)
          {ω | ε < dist (X i ω) c})
      l (𝓝 0)

/--
Common-domain convergence in outer probability.

This is the Definition 1.9/1.10 shape used when all maps live on one sample
space and converge to a possibly nonconstant limit map.
-/
def VdVWConvergesInOuterProbability
    {Ω : Type u} {ι : Type w} {D : Type v}
    [MeasurableSpace Ω] [PseudoMetricSpace D]
    (μ : Measure Ω) (X : ι -> Ω -> D) (l : Filter ι)
    (limit : Ω -> D) : Prop :=
  ∀ ε > 0,
    Tendsto
      (fun i =>
        VdVWOuterProbability μ {ω | ε < dist (X i ω) (limit ω)})
      l (𝓝 0)

/--
Mathlib convergence in measure implies the corresponding VdV&W outer
probability convergence for a common sample space.

This bridge reuses mathlib's `TendstoInMeasure` API and only changes the event
from `epsilon <= dist` to the textbook's strict `epsilon < dist`.
-/
theorem vdVWConvergesInOuterProbability_of_tendstoInMeasure
    {Ω : Type u} {ι : Type w} {D : Type v}
    [MeasurableSpace Ω] [PseudoMetricSpace D]
    {μ : Measure Ω} {X : ι -> Ω -> D} {l : Filter ι}
    {limit : Ω -> D}
    (h : MeasureTheory.TendstoInMeasure μ X l limit) :
    VdVWConvergesInOuterProbability μ X l limit := by
  intro ε hε
  have hle :
      Tendsto (fun i => μ {ω | ε ≤ dist (X i ω) (limit ω)})
        l (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_dist).mp h ε hε
  refine
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hle
      (fun i => (zero_le : (0 : ℝ≥0∞) ≤ VdVWOuterProbability μ
        {ω | ε < dist (X i ω) (limit ω)})) ?_
  intro i
  dsimp [VdVWOuterProbability]
  exact measure_mono (fun ω hω => by simpa using (le_of_lt hω))

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

/-- Bad event for a fixed sample size and tolerance. -/
def VdVWUniformDeviationBadEvent
    {Ω : Type u} {Index : Type v} (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ)
    (tolerance : ℝ) (sampleSize : ℕ) : Set Ω :=
  {ω |
    ¬ EmpiricalDeviationBoundOn indexClass populationRisk
      (empiricalRisk ω sampleSize) tolerance}

/-- Event that some bad uniform-deviation sample size occurs after `start`. -/
def VdVWUniformDeviationBadTailEvent
    {Ω : Type u} {Index : Type v} (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ)
    (tolerance : ℝ) (start : ℕ) : Set Ω :=
  {ω |
    ∃ sampleSize ≥ start,
      ω ∈
        VdVWUniformDeviationBadEvent indexClass populationRisk
          empiricalRisk tolerance sampleSize}

/-- Event that bad uniform-deviation sample sizes occur infinitely often. -/
def VdVWUniformDeviationBadInfinitelyOftenEvent
    {Ω : Type u} {Index : Type v} (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ)
    (tolerance : ℝ) : Set Ω :=
  {ω |
    ∀ start,
      ∃ sampleSize ≥ start,
        ω ∈
          VdVWUniformDeviationBadEvent indexClass populationRisk
            empiricalRisk tolerance sampleSize}

/--
If bad uniform-deviation events occur infinitely often at one positive
tolerance, then pathwise uniform convergence to zero fails.
-/
theorem vdVWUniformDeviationBadInfinitelyOften_subset_not_tendsto
    {Ω : Type u} {Index : Type v}
    {indexClass : Set Index} {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    {tolerance : ℝ} (htolerance : 0 < tolerance) :
    VdVWUniformDeviationBadInfinitelyOftenEvent indexClass populationRisk
        empiricalRisk tolerance ⊆
      {ω |
        ¬ UniformDeviationTendstoZeroOn indexClass populationRisk
          (empiricalRisk ω)} := by
  intro ω hbad hconverges
  rcases eventually_atTop.1 (hconverges tolerance htolerance) with
    ⟨start, hstart⟩
  rcases hbad start with ⟨sampleSize, hsampleSize, hbad_sample⟩
  exact hbad_sample (hstart sampleSize hsampleSize)

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
          (VdVWUniformDeviationBadTailEvent indexClass populationRisk
            empiricalRisk tolerance start))
      atTop (𝓝 0)

/--
Tail-event outer probabilities converge to the outer probability of the
bad-infinitely-often event.

This is the continuity-from-above style hypothesis needed to turn outer-a.s.
control into direct outer-probability control.
-/
def VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    (μ : Measure Ω) (indexClass : Set Index)
    (populationRisk : Index -> ℝ)
    (empiricalRisk : Ω -> ℕ -> Index -> ℝ) : Prop :=
  ∀ tolerance > 0,
    Tendsto
      (fun start : ℕ =>
        VdVWOuterProbability μ
          (VdVWUniformDeviationBadTailEvent indexClass populationRisk
            empiricalRisk tolerance start))
      atTop
      (𝓝
        (VdVWOuterProbability μ
          (VdVWUniformDeviationBadInfinitelyOftenEvent indexClass
            populationRisk empiricalRisk tolerance)))

/--
Fixed-sample null measurability gives tail-event continuity from above.

This is the standard measurable-events bridge missing from the purely outer
formulation: the future bad-event tails are decreasing countable unions of
null-measurable fixed-sample bad events, so finite-measure continuity from
above applies.
-/
theorem vdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn_of_isFiniteMeasure_of_nullMeasurable_badEvent
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {indexClass : Set Index}
    {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    (h_bad_null :
      ∀ tolerance, 0 < tolerance ->
        ∀ sampleSize,
          NullMeasurableSet
            (VdVWUniformDeviationBadEvent indexClass populationRisk
              empiricalRisk tolerance sampleSize) μ) :
    VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn μ indexClass
      populationRisk empiricalRisk := by
  intro tolerance htolerance
  let tail : ℕ -> Set Ω := fun start =>
    VdVWUniformDeviationBadTailEvent indexClass populationRisk
      empiricalRisk tolerance start
  have htail_null : ∀ start, NullMeasurableSet (tail start) μ := by
    intro start
    have htail_eq :
        tail start =
          ⋃ sampleSize ∈ Set.Ici start,
            VdVWUniformDeviationBadEvent indexClass populationRisk
              empiricalRisk tolerance sampleSize := by
      ext ω
      simp [tail, VdVWUniformDeviationBadTailEvent, Set.mem_Ici]
    rw [htail_eq]
    exact
      NullMeasurableSet.biUnion (Set.to_countable (Set.Ici start))
        (fun sampleSize _ => h_bad_null tolerance htolerance sampleSize)
  have htail_antitone : Antitone tail := by
    intro start finish hle ω hω
    rcases hω with ⟨sampleSize, hsampleSize, hbad⟩
    exact ⟨sampleSize, le_trans hle hsampleSize, hbad⟩
  have hfinite : ∃ start, μ (tail start) ≠ ∞ :=
    ⟨0, measure_ne_top μ (tail 0)⟩
  have htail_inter :
      (⋂ start : ℕ, tail start) =
        VdVWUniformDeviationBadInfinitelyOftenEvent indexClass
          populationRisk empiricalRisk tolerance := by
    ext ω
    simp [tail, VdVWUniformDeviationBadTailEvent,
      VdVWUniformDeviationBadInfinitelyOftenEvent]
  have htendsto :
      Tendsto (μ ∘ tail) atTop (𝓝 (μ (⋂ start : ℕ, tail start))) :=
    tendsto_measure_iInter_atTop htail_null htail_antitone hfinite
  simpa [Function.comp_def, tail, VdVWOuterProbability, htail_inter] using
    htendsto

/--
Outer-a.s. pathwise convergence plus continuity of bad-tail outer
probabilities at the limsup event gives tail-event outer-probability control.
-/
theorem vdVWOuterProbabilityUniformDeviationTailTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    {μ : Measure Ω} {indexClass : Set Index}
    {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    (h_outer_as :
      VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ indexClass
        populationRisk empiricalRisk)
    (h_tail_limsup :
      VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn μ indexClass
        populationRisk empiricalRisk) :
    VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn μ indexClass
      populationRisk empiricalRisk := by
  intro tolerance htolerance
  have hbad_null :
      VdVWOuterProbability μ
        (VdVWUniformDeviationBadInfinitelyOftenEvent indexClass
          populationRisk empiricalRisk tolerance) = 0 := by
    exact
      measure_mono_null
        (vdVWUniformDeviationBadInfinitelyOften_subset_not_tendsto
          (indexClass := indexClass) (populationRisk := populationRisk)
          (empiricalRisk := empiricalRisk) htolerance)
        h_outer_as
  have hbad_null' :
      μ (VdVWUniformDeviationBadInfinitelyOftenEvent indexClass
          populationRisk empiricalRisk tolerance) = 0 := by
    simpa [VdVWOuterProbability] using hbad_null
  simpa [VdVWOuterProbability, hbad_null'] using
    h_tail_limsup tolerance htolerance

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
Outer-a.s. convergence plus bad-tail continuity gives the direct
outer-probability convergence branch.
-/
theorem vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    {μ : Measure Ω} {indexClass : Set Index}
    {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    (h_outer_as :
      VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ indexClass
        populationRisk empiricalRisk)
    (h_tail_limsup :
      VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn μ indexClass
        populationRisk empiricalRisk) :
    VdVWOuterProbabilityUniformDeviationTendstoZeroOn μ indexClass
      populationRisk empiricalRisk :=
  vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_tail
    (vdVWOuterProbabilityUniformDeviationTailTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup
      h_outer_as h_tail_limsup)

/--
Outer-a.s. convergence implies the direct outer-probability branch when the
sample-space measure is finite and every fixed bad event is null-measurable.
-/
theorem vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_isFiniteMeasure_of_nullMeasurable_badEvent
    {Ω : Type u} {Index : Type v} [MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {indexClass : Set Index}
    {populationRisk : Index -> ℝ}
    {empiricalRisk : Ω -> ℕ -> Index -> ℝ}
    (h_outer_as :
      VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ indexClass
        populationRisk empiricalRisk)
    (h_bad_null :
      ∀ tolerance, 0 < tolerance ->
        ∀ sampleSize,
          NullMeasurableSet
            (VdVWUniformDeviationBadEvent indexClass populationRisk
              empiricalRisk tolerance sampleSize) μ) :
    VdVWOuterProbabilityUniformDeviationTendstoZeroOn μ indexClass
      populationRisk empiricalRisk :=
  vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup
    h_outer_as
    (vdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn_of_isFiniteMeasure_of_nullMeasurable_badEvent
      h_bad_null)

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
VdV&W Theorem 2.4.1 in the direct outer-probability convergence mode, under
the standard finite-measure and fixed bad-event null-measurability bridge.

The bracketing proof supplies the outer-a.s. zero-limsup conclusion.  The
additional null-measurability hypothesis lets mathlib's continuity from above
turn that conclusion into the one-time outer-probability convergence branch.
-/
theorem vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_nullMeasurable_badEvent
    {Ω : Type u} {Observation : Type v} {Index : Type w}
    [MeasurableSpace Ω] [MeasurableSpace Observation]
    {μ : Measure Ω} [IsFiniteMeasure μ] {P : Measure Observation}
    {indexClass : Set Index} {classFun : Index -> Observation -> ℝ}
    (X : ℕ -> Ω -> Observation)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (h_bracketing :
      ∀ epsilon, 0 < epsilon ->
        l1BracketingNumber P indexClass classFun epsilon < ⊤)
    (h_bad_null :
      ∀ tolerance, 0 < tolerance ->
        ∀ sampleSize,
          NullMeasurableSet
            (VdVWUniformDeviationBadEvent indexClass
              (fun index => populationRiskOfFunction P (classFun index))
              (fun ω sampleSize index =>
                empiricalAverage (samplePath X ω sampleSize)
                  (classFun index))
              tolerance sampleSize) μ) :
    VdVWOuterProbabilityPGlivenkoCantelliClass μ P indexClass classFun X :=
  vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_isFiniteMeasure_of_nullMeasurable_badEvent
    (vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top
      X hLaw hindep h_bracketing)
    h_bad_null

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
