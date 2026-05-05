import StatInference.EmpiricalProcess.GlivenkoCantelli
import StatInference.EmpiricalProcess.OuterExpectation
import StatInference.EmpiricalProcess.OuterProbabilityExpectation
import Mathlib.MeasureTheory.Function.ConvergenceInDistribution
import Mathlib.MeasureTheory.Measure.FiniteMeasurePi
import Mathlib.MeasureTheory.Measure.FiniteMeasureProd
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.MeasureTheory.Measure.Prokhorov

/-!
# Weak-convergence foundation wrappers

This module records Chapter 1 weak-convergence primitives from van der Vaart
and Wellner in names local to this project, while reusing pinned mathlib
theorems as the proof authority whenever the statement is the classical
measure-level or measurable-random-variable version.
-/

namespace StatInference

open Filter MeasureTheory ProbabilityTheory TopologicalSpace

open scoped BoundedContinuousFunction ENNReal Topology

universe u v w x

/--
Nonnegative outer/inner expectation gap for a possibly nonmeasurable test
composition.

This is a scoped Chapter 1 primitive on the way to VdV&W asymptotic
measurability.  It intentionally uses the already formalized nonnegative
outer/inner expectations; the full signed extended-real textbook layer remains
separate.
-/
noncomputable def VdVWNonnegativeOuterInnerExpectationGap
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    (T : Ω -> ℝ≥0∞) : ℝ≥0∞ :=
  VdVWOuterExpectation μ T - VdVWInnerExpectation μ T

/--
Measurable nonnegative maps have zero VdV&W nonnegative outer/inner
expectation gap.
-/
theorem VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_measurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (hT : Measurable T) :
    VdVWNonnegativeOuterInnerExpectationGap μ T = 0 := by
  unfold VdVWNonnegativeOuterInnerExpectationGap
  rw [VdVWOuterExpectation_eq_innerExpectation_of_measurable hT]
  simp

/--
A.e.-measurable nonnegative maps have zero VdV&W nonnegative outer/inner
expectation gap.
-/
theorem VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_aemeasurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {T : Ω -> ℝ≥0∞} (hT : AEMeasurable T μ) :
    VdVWNonnegativeOuterInnerExpectationGap μ T = 0 := by
  unfold VdVWNonnegativeOuterInnerExpectationGap
  rw [VdVWOuterExpectation_eq_innerExpectation_of_aemeasurable hT]
  simp

/--
Signed positive/negative VdV&W outer expectation of a real-valued map.

This is the signed Chapter 1 bridge available from the current nonnegative
outer-expectation primitive.  It is deliberately named as a positive/negative
outer construction: the full arbitrary-map signed outer/inner expectation
textbook API still has to track finiteness and nonmeasurable cover clauses
separately.
-/
noncomputable def VdVWSignedOuterExpectationPosNeg
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    (Y : Ω -> ℝ) : ℝ :=
  ENNReal.toReal (VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (Y ω))) -
    ENNReal.toReal (VdVWOuterExpectation μ (fun ω => ENNReal.ofReal (-Y ω)))

/--
For a measurable integrable real map, the signed positive/negative VdV&W
outer expectation agrees with the ordinary Bochner integral.
-/
theorem VdVWSignedOuterExpectationPosNeg_eq_integral_of_measurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Y : Ω -> ℝ} (hY_meas : Measurable Y) (hY_int : Integrable Y μ) :
    VdVWSignedOuterExpectationPosNeg μ Y = ∫ ω, Y ω ∂μ := by
  simpa [VdVWSignedOuterExpectationPosNeg] using
    VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_measurable
      hY_meas hY_int

/--
For a null-measurable integrable real map, the signed positive/negative VdV&W
outer expectation agrees with the ordinary Bochner integral.
-/
theorem VdVWSignedOuterExpectationPosNeg_eq_integral_of_nullMeasurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Y : Ω -> ℝ} (hY_null : NullMeasurable Y μ) (hY_int : Integrable Y μ) :
    VdVWSignedOuterExpectationPosNeg μ Y = ∫ ω, Y ω ∂μ := by
  simpa [VdVWSignedOuterExpectationPosNeg] using
    VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_aemeasurable
      hY_null.aemeasurable hY_int

/--
Composable form of the measurable signed positive/negative outer-expectation
bridge.
-/
theorem VdVWSignedOuterExpectationPosNeg_eq_integral_of_measurable_comp
    {Ω : Type u} {S : Type v} [MeasurableSpace Ω] [MeasurableSpace S]
    {μ : Measure Ω} {X : Ω -> S} {f : S -> ℝ}
    (hX : Measurable X) (hf : Measurable f)
    (hint : Integrable (fun ω => f (X ω)) μ) :
    VdVWSignedOuterExpectationPosNeg μ (fun ω => f (X ω)) =
      ∫ ω, f (X ω) ∂μ :=
  VdVWSignedOuterExpectationPosNeg_eq_integral_of_measurable
    (hf.comp hX) hint

/--
Bounded-continuous tests composed with measurable maps have the expected
signed positive/negative VdV&W outer expectation on finite measure spaces.

This is the measurable-map specialization needed by the Chapter 1 weak-
convergence lane before replacing the current lower-shifted proxy by a full
signed arbitrary-map outer/inner expectation API.
-/
theorem VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp
    {Ω : Type u} {S : Type v} [MeasurableSpace Ω] [MeasurableSpace S]
    [TopologicalSpace S] [OpensMeasurableSpace S]
    {μ : Measure Ω} [IsFiniteMeasure μ] {X : Ω -> S}
    (hX : Measurable X) (f : S →ᵇ ℝ) :
    VdVWSignedOuterExpectationPosNeg μ (fun ω => f (X ω)) =
      ∫ ω, f (X ω) ∂μ :=
  VdVWSignedOuterExpectationPosNeg_eq_integral_of_measurable_comp hX
    f.continuous.measurable
    (Integrable.of_bound
      ((f.continuous.measurable.comp hX).aestronglyMeasurable) ‖f‖
      (Eventually.of_forall fun ω => f.norm_coe_le_norm (X ω)))

/--
Bounded-continuous tests composed with null-measurable maps have the expected
signed positive/negative VdV&W outer expectation on finite measure spaces.
-/
theorem VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp_nullMeasurable
    {Ω : Type u} {S : Type v} [MeasurableSpace Ω] [MeasurableSpace S]
    [TopologicalSpace S] [OpensMeasurableSpace S]
    {μ : Measure Ω} [IsFiniteMeasure μ] {X : Ω -> S}
    (hX : NullMeasurable X μ) (f : S →ᵇ ℝ) :
    VdVWSignedOuterExpectationPosNeg μ (fun ω => f (X ω)) =
      ∫ ω, f (X ω) ∂μ := by
  have hY_null : NullMeasurable (fun ω => f (X ω)) μ :=
    f.continuous.measurable.comp_nullMeasurable hX
  exact
    VdVWSignedOuterExpectationPosNeg_eq_integral_of_nullMeasurable hY_null
      (Integrable.of_bound hY_null.aemeasurable.aestronglyMeasurable ‖f‖
        (Eventually.of_forall fun ω => f.norm_coe_le_norm (X ω)))

/--
Signed-outer bounded-continuous weak convergence for possibly arbitrary maps.

This is the current honest Chapter 1 bridge toward VdV&W Definition 1.3.3 for
arbitrary maps: bounded continuous tests are evaluated through the local
positive/negative outer-expectation construction.  It is intentionally a
separate predicate from the already proved probability-measure weak
convergence wrapper, because exact nonmeasurable-map clauses still need
additional outer-cover support.
-/
def VdVWWeakConvergenceSignedOuterBoundedContinuous
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    (μs : ι -> Measure Ω) (X : ι -> Ω -> S) (l : Filter ι)
    (μ : ProbabilityMeasure S) : Prop :=
  ∀ f : S →ᵇ ℝ,
    Tendsto
      (fun i => VdVWSignedOuterExpectationPosNeg (μs i)
        (fun ω => f (X i ω)))
      l (𝓝 (∫ s, f s ∂(μ : Measure S)))

/--
Continuous maps preserve signed-outer bounded-continuous weak convergence.

This is the direct VdV&W arbitrary-map analogue of the continuous-mapping
theorem for the current signed-outer bounded-continuous weak-convergence
predicate.
-/
theorem VdVWWeakConvergenceSignedOuterBoundedContinuous.comp_continuous
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    [MeasurableSpace T] [TopologicalSpace T] [BorelSpace T]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l μ)
    {g : S -> T} (hg : Continuous g) :
    VdVWWeakConvergenceSignedOuterBoundedContinuous μs
      (fun i ω => g (X i ω)) l (μ.map hg.measurable.aemeasurable) := by
  intro f
  let gC : C(S, T) := ⟨g, hg⟩
  have hbase := h (f.compContinuous gC)
  have htarget :
      (∫ t, f t ∂((μ.map hg.measurable.aemeasurable : ProbabilityMeasure T) :
        Measure T)) =
        ∫ s, f (g s) ∂(μ : Measure S) := by
    simpa [gC] using
      (integral_map hg.measurable.aemeasurable
        f.continuous.measurable.aestronglyMeasurable :
        ∫ t, f t ∂Measure.map g (μ : Measure S) =
          ∫ s, f (g s) ∂(μ : Measure S))
  rw [htarget]
  simpa [VdVWWeakConvergenceSignedOuterBoundedContinuous, gC] using hbase

/--
Signed-outer bounded-continuous weak convergence is stable under passing to a
finer index filter.
-/
theorem VdVWWeakConvergenceSignedOuterBoundedContinuous.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι} {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l μ)
    (hl : l' ≤ l) :
    VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l' μ := by
  intro f
  exact (h f).mono_left hl

/--
Signed bounded-continuous outer/inner expectation gap for an arbitrary real
map.

The current Chapter 1.2 layer is nonnegative, so the signed gap is represented
by the two nonnegative gaps of the positive and negative parts.  This is the
honest bridge needed before stating VdV&W arbitrary-map asymptotic
measurability for bounded-continuous real tests.
-/
noncomputable def VdVWSignedBoundedContinuousOuterInnerExpectationGap
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    (Y : Ω -> ℝ) : ℝ≥0∞ :=
  VdVWNonnegativeOuterInnerExpectationGap μ (fun ω => ENNReal.ofReal (Y ω)) +
    VdVWNonnegativeOuterInnerExpectationGap μ (fun ω => ENNReal.ofReal (-Y ω))

/--
Measurable real maps have zero signed positive/negative outer/inner
expectation gap.
-/
theorem VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_measurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Y : Ω -> ℝ} (hY : Measurable Y) :
    VdVWSignedBoundedContinuousOuterInnerExpectationGap μ Y = 0 := by
  simp [VdVWSignedBoundedContinuousOuterInnerExpectationGap,
    VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_measurable hY.ennreal_ofReal,
    VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_measurable hY.neg.ennreal_ofReal]

/--
Null-measurable real maps have zero signed positive/negative outer/inner
expectation gap.
-/
theorem VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_nullMeasurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Y : Ω -> ℝ} (hY : NullMeasurable Y μ) :
    VdVWSignedBoundedContinuousOuterInnerExpectationGap μ Y = 0 := by
  simp [VdVWSignedBoundedContinuousOuterInnerExpectationGap,
    VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_aemeasurable
      (hY.aemeasurable.ennreal_ofReal),
    VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_aemeasurable
      (hY.aemeasurable.neg.ennreal_ofReal)]

/--
Signed bounded-continuous asymptotic measurability for arbitrary maps.

This is the closest local predicate to the signed part of VdV&W Definition
1.3.7: every bounded continuous real test has vanishing positive/negative
outer/inner expectation gap along the process.
-/
def VdVWAsymptoticallyMeasurableSignedBoundedContinuous
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S]
    (μs : ι -> Measure Ω) (X : ι -> Ω -> S) (l : Filter ι) : Prop :=
  ∀ f : S →ᵇ ℝ,
    Tendsto
      (fun i =>
        VdVWSignedBoundedContinuousOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω)))
      l (𝓝 0)

/--
Measurable maps into a topological measurable state space are signed
bounded-continuous asymptotically measurable.
-/
theorem VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_measurable
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (hX : ∀ i, Measurable (X i)) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuous μs X l := by
  intro f
  have hzero :
      (fun i =>
        VdVWSignedBoundedContinuousOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω))) = fun _ => 0 := by
    funext i
    exact
      VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_measurable
        (f.continuous.measurable.comp (hX i))
  simpa [hzero] using
    (tendsto_const_nhds :
      Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Null-measurable maps into a topological measurable state space are signed
bounded-continuous asymptotically measurable.
-/
theorem VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_nullMeasurable
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (hX : ∀ i, NullMeasurable (X i) (μs i)) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuous μs X l := by
  intro f
  have hzero :
      (fun i =>
        VdVWSignedBoundedContinuousOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω))) = fun _ => 0 := by
    funext i
    exact
      VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_nullMeasurable
        (f.continuous.measurable.comp_nullMeasurable (hX i))
  simpa [hzero] using
    (tendsto_const_nhds :
      Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Continuous maps preserve signed bounded-continuous asymptotic measurability.
-/
theorem VdVWAsymptoticallyMeasurableSignedBoundedContinuous.comp_continuous
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω] [TopologicalSpace S] [TopologicalSpace T]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (h : VdVWAsymptoticallyMeasurableSignedBoundedContinuous μs X l)
    {g : S -> T} (hg : Continuous g) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuous
      μs (fun i ω => g (X i ω)) l := by
  intro f
  let gC : C(S, T) := ⟨g, hg⟩
  simpa [gC] using h (f.compContinuous gC)

/--
Signed bounded-continuous asymptotic measurability is stable under passing to
a finer index filter.
-/
theorem VdVWAsymptoticallyMeasurableSignedBoundedContinuous.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι}
    (h : VdVWAsymptoticallyMeasurableSignedBoundedContinuous μs X l)
    (hl : l' ≤ l) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuous μs X l' := by
  intro f
  exact (h f).mono_left hl

/--
Proof-carrying signed bounded-continuous arbitrary-map weak convergence.

The structure packages the signed-outer bounded-continuous convergence
predicate together with the signed outer/inner asymptotic-measurability
predicate above.  It is still a local Chapter 1 bridge: exact VdV&W
nonmeasurable cover and asymptotic-tightness clauses remain separate.
-/
structure VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    (μs : ι -> Measure Ω) (X : ι -> Ω -> S) (l : Filter ι)
    (μ : ProbabilityMeasure S) : Prop where
  weakConvergence :
    VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l μ
  asymptoticMeasurability :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuous μs X l

/--
Continuous maps preserve the proof-carrying signed bounded-continuous
arbitrary-map weak-convergence layer.
-/
theorem VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.comp_continuous
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    [MeasurableSpace T] [TopologicalSpace T] [BorelSpace T]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (h :
      VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs X l μ)
    {g : S -> T} (hg : Continuous g) :
    VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs
      (fun i ω => g (X i ω)) l (μ.map hg.measurable.aemeasurable) :=
  { weakConvergence := h.weakConvergence.comp_continuous hg
    asymptoticMeasurability := h.asymptoticMeasurability.comp_continuous hg }

/--
The proof-carrying signed bounded-continuous arbitrary-map weak-convergence
package is stable under passing to a finer index filter.
-/
theorem VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι} {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs X l μ)
    (hl : l' ≤ l) :
    VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs X l' μ :=
  { weakConvergence := h.weakConvergence.mono_filter hl
    asymptoticMeasurability := h.asymptoticMeasurability.mono_filter hl }

/--
Varying-domain signed-outer bounded-continuous weak convergence.

This is the same signed-outer bounded-continuous test formulation as
`VdVWWeakConvergenceSignedOuterBoundedContinuous`, but with sample spaces
`Ω i` depending on the index.  It is the natural target for Theorem 2.4.3
finite-product endpoints such as `SampleAt Observation n`.
-/
def VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains
    {ι : Type w} (Ω : ι -> Type u) {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    (μs : (i : ι) -> Measure (Ω i)) (X : (i : ι) -> Ω i -> S)
    (l : Filter ι) (μ : ProbabilityMeasure S) : Prop :=
  ∀ f : S →ᵇ ℝ,
    Tendsto
      (fun i => VdVWSignedOuterExpectationPosNeg (μs i)
        (fun ω => f (X i ω)))
      l (𝓝 (∫ s, f s ∂(μ : Measure S)))

/--
Continuous maps preserve varying-domain signed-outer bounded-continuous weak
convergence.

This is the sample-size-varying analogue of
`VdVWWeakConvergenceSignedOuterBoundedContinuous.comp_continuous`, needed when
Theorem 2.4.3 endpoints are pushed forward by a continuous map.
-/
theorem
    VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.comp_continuous
    {ι : Type w} {Ω : ι -> Type u} {S : Type v} {T : Type x}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    [MeasurableSpace T] [TopologicalSpace T] [BorelSpace T]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l : Filter ι} {μ : ProbabilityMeasure S}
    (h :
      VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains
        Ω μs X l μ)
    {g : S -> T} (hg : Continuous g) :
    VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains Ω μs
      (fun i ω => g (X i ω)) l
      (μ.map hg.measurable.aemeasurable) := by
  intro f
  let gC : C(S, T) := ⟨g, hg⟩
  have hbase := h (f.compContinuous gC)
  have htarget :
      (∫ t, f t ∂((μ.map hg.measurable.aemeasurable : ProbabilityMeasure T) :
        Measure T)) =
        ∫ s, f (g s) ∂(μ : Measure S) := by
    simpa [gC] using
      (integral_map hg.measurable.aemeasurable
        f.continuous.measurable.aestronglyMeasurable :
        ∫ t, f t ∂Measure.map g (μ : Measure S) =
          ∫ s, f (g s) ∂(μ : Measure S))
  rw [htarget]
  simpa [VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains, gC]
    using hbase

/--
Varying-domain signed-outer bounded-continuous weak convergence is stable
under passing to a finer index filter.
-/
theorem
    VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.mono_filter
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l l' : Filter ι} {μ : ProbabilityMeasure S}
    (h :
      VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains
        Ω μs X l μ)
    (hl : l' ≤ l) :
    VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains
      Ω μs X l' μ := by
  intro f
  exact (h f).mono_left hl

/--
Varying-domain signed bounded-continuous asymptotic measurability.
-/
def VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains
    {ι : Type w} (Ω : ι -> Type u) {S : Type v}
    [∀ i, MeasurableSpace (Ω i)] [TopologicalSpace S]
    (μs : (i : ι) -> Measure (Ω i)) (X : (i : ι) -> Ω i -> S)
    (l : Filter ι) : Prop :=
  ∀ f : S →ᵇ ℝ,
    Tendsto
      (fun i =>
        VdVWSignedBoundedContinuousOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω)))
      l (𝓝 0)

/--
Measurable varying-domain maps are signed bounded-continuous asymptotically
measurable.
-/
theorem
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_measurable
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l : Filter ι}
    (hX : ∀ i, Measurable (X i)) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains
      Ω μs X l := by
  intro f
  have hzero :
      (fun i =>
        VdVWSignedBoundedContinuousOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω))) = fun _ => 0 := by
    funext i
    exact
      VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_measurable
        (f.continuous.measurable.comp (hX i))
  simpa [hzero] using
    (tendsto_const_nhds :
      Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Varying-domain null-measurable maps are signed bounded-continuous
asymptotically measurable.
-/
theorem
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_nullMeasurable
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [MeasurableSpace.CountablyGenerated S]
    [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l : Filter ι}
    (hX : ∀ i, NullMeasurable (X i) (μs i)) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains
      Ω μs X l := by
  intro f
  have hzero :
      (fun i =>
        VdVWSignedBoundedContinuousOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω))) = fun _ => 0 := by
    funext i
    exact
      VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_nullMeasurable
        (f.continuous.measurable.comp_nullMeasurable (hX i))
  simpa [hzero] using
    (tendsto_const_nhds :
      Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Continuous maps preserve varying-domain signed bounded-continuous asymptotic
measurability.
-/
theorem
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.comp_continuous
    {ι : Type w} {Ω : ι -> Type u} {S : Type v} {T : Type x}
    [∀ i, MeasurableSpace (Ω i)]
    [TopologicalSpace S] [TopologicalSpace T]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l : Filter ι}
    (h :
      VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains
        Ω μs X l)
    {g : S -> T} (hg : Continuous g) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains Ω μs
      (fun i ω => g (X i ω)) l := by
  intro f
  let gC : C(S, T) := ⟨g, hg⟩
  simpa [gC] using h (f.compContinuous gC)

/--
Varying-domain signed bounded-continuous asymptotic measurability is stable
under passing to a finer index filter.
-/
theorem
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.mono_filter
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)] [TopologicalSpace S]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l l' : Filter ι}
    (h :
      VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains
        Ω μs X l)
    (hl : l' ≤ l) :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains
      Ω μs X l' := by
  intro f
  exact (h f).mono_left hl

/--
Proof-carrying varying-domain signed bounded-continuous weak convergence.

This packages the varying-domain weak-convergence and asymptotic-measurability
fields needed to consume sample-size-varying Theorem 2.4.3 endpoints.
-/
structure VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains
    {ι : Type w} (Ω : ι -> Type u) {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    (μs : (i : ι) -> Measure (Ω i)) (X : (i : ι) -> Ω i -> S)
    (l : Filter ι) (μ : ProbabilityMeasure S) : Prop where
  weakConvergence :
    VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains Ω μs X l μ
  asymptoticMeasurability :
    VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains Ω μs X l

/--
Continuous maps preserve the proof-carrying varying-domain signed
bounded-continuous weak-convergence package.
-/
theorem
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.comp_continuous
    {ι : Type w} {Ω : ι -> Type u} {S : Type v} {T : Type x}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    [MeasurableSpace T] [TopologicalSpace T] [BorelSpace T]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l : Filter ι} {μ : ProbabilityMeasure S}
    (h :
      VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l μ)
    {g : S -> T} (hg : Continuous g) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs
      (fun i ω => g (X i ω)) l
      (μ.map hg.measurable.aemeasurable) :=
  { weakConvergence := h.weakConvergence.comp_continuous hg
    asymptoticMeasurability :=
      h.asymptoticMeasurability.comp_continuous hg }

/--
The proof-carrying varying-domain signed bounded-continuous weak-convergence
package is stable under passing to a finer index filter.
-/
theorem
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.mono_filter
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} {X : (i : ι) -> Ω i -> S}
    {l l' : Filter ι} {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l μ)
    (hl : l' ≤ l) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l' μ :=
  { weakConvergence := h.weakConvergence.mono_filter hl
    asymptoticMeasurability :=
      h.asymptoticMeasurability.mono_filter hl }

/--
Nonnegative version of VdV&W asymptotic measurability for a family of
possibly arbitrary maps and a chosen class of nonnegative test functions.

For exact textbook weak convergence this must later be upgraded to the signed
bounded-continuous test-function formulation.  This primitive isolates the
outer/inner expectation-gap mechanism without adding a proof hole.
-/
def VdVWAsymptoticallyMeasurableNonnegative
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    (μs : ι -> Measure Ω) (X : ι -> Ω -> S) (l : Filter ι)
    (tests : (S -> ℝ≥0∞) -> Prop) : Prop :=
  ∀ T, tests T ->
    Tendsto
      (fun i => VdVWNonnegativeOuterInnerExpectationGap (μs i)
        (fun ω => T (X i ω)))
      l (𝓝 0)

/--
If every selected nonnegative test composition is measurable, then the
nonnegative VdV&W asymptotic-measurability gap is identically zero.
-/
theorem VdVWAsymptoticallyMeasurableNonnegative.of_forall_measurable_comp
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {tests : (S -> ℝ≥0∞) -> Prop}
    (hmeas : ∀ i T, tests T -> Measurable (fun ω => T (X i ω))) :
    VdVWAsymptoticallyMeasurableNonnegative μs X l tests := by
  intro T hT
  have hzero :
      (fun i => VdVWNonnegativeOuterInnerExpectationGap (μs i)
        (fun ω => T (X i ω))) = fun _ => 0 := by
    funext i
    exact VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_measurable
      (hmeas i T hT)
  simpa [hzero] using (tendsto_const_nhds : Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Measurable maps into a measurable state space are nonnegatively
asymptotically measurable for every selected measurable nonnegative test.
-/
theorem VdVWAsymptoticallyMeasurableNonnegative.of_forall_measurable
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {tests : (S -> ℝ≥0∞) -> Prop}
    (hX : ∀ i, Measurable (X i))
    (hT : ∀ T, tests T -> Measurable T) :
    VdVWAsymptoticallyMeasurableNonnegative μs X l tests :=
  VdVWAsymptoticallyMeasurableNonnegative.of_forall_measurable_comp
    (fun i T htest => (hT T htest).comp (hX i))

/--
The nonnegative asymptotic-measurability predicate is monotone in the selected
test class.
-/
theorem VdVWAsymptoticallyMeasurableNonnegative.mono_tests
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {tests tests' : (S -> ℝ≥0∞) -> Prop}
    (h : VdVWAsymptoticallyMeasurableNonnegative μs X l tests)
    (hsub : ∀ T, tests' T -> tests T) :
    VdVWAsymptoticallyMeasurableNonnegative μs X l tests' := by
  intro T hT
  exact h T (hsub T hT)

/--
Arbitrary-map pullback for the nonnegative asymptotic-measurability predicate.

If every selected target test pulls back to a selected source test, then
asymptotic measurability transfers to the composed maps.
-/
theorem VdVWAsymptoticallyMeasurableNonnegative.comp_map
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {testsS : (S -> ℝ≥0∞) -> Prop} {testsT : (T -> ℝ≥0∞) -> Prop}
    (h : VdVWAsymptoticallyMeasurableNonnegative μs X l testsS)
    {g : S -> T}
    (hpull : ∀ φ, testsT φ -> testsS (fun s => φ (g s))) :
    VdVWAsymptoticallyMeasurableNonnegative
      μs (fun i ω => g (X i ω)) l testsT := by
  intro φ hφ
  exact h (fun s => φ (g s)) (hpull φ hφ)

/--
The nonnegative asymptotic-measurability predicate is stable under passing to
a finer index filter, e.g. a subsequence filter.
-/
theorem VdVWAsymptoticallyMeasurableNonnegative.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι} {tests : (S -> ℝ≥0∞) -> Prop}
    (h : VdVWAsymptoticallyMeasurableNonnegative μs X l tests)
    (hl : l' ≤ l) :
    VdVWAsymptoticallyMeasurableNonnegative μs X l' tests := by
  intro T hT
  exact (h T hT).mono_left hl

/--
Lower-shifted real outer/inner expectation gap.

For a real-valued test `Y` with lower bound `c`, `ENNReal.ofReal (Y - c)` is
the nonnegative proxy used by the local outer/inner expectation layer.  The
lower-bound hypothesis is carried by the higher-level predicates; the gap
itself is defined for every shift.
-/
noncomputable def VdVWLowerShiftedRealOuterInnerExpectationGap
    {Ω : Type u} [MeasurableSpace Ω] (μ : Measure Ω)
    (Y : Ω -> ℝ) (c : ℝ) : ℝ≥0∞ :=
  VdVWNonnegativeOuterInnerExpectationGap μ
    (fun ω => ENNReal.ofReal (Y ω - c))

/--
Measurable real-valued maps have zero lower-shifted VdV&W nonnegative
outer/inner expectation gap.
-/
theorem VdVWLowerShiftedRealOuterInnerExpectationGap_eq_zero_of_measurable
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Y : Ω -> ℝ} {c : ℝ} (hY : Measurable Y) :
    VdVWLowerShiftedRealOuterInnerExpectationGap μ Y c = 0 := by
  unfold VdVWLowerShiftedRealOuterInnerExpectationGap
  exact
    VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_measurable
      ((hY.sub measurable_const).ennreal_ofReal)

/--
Lower-shifted real-test version of VdV&W asymptotic measurability.

The predicate quantifies over selected real tests and every supplied lower
shift along the process.  This is still a local bridge, not the full signed
outer-expectation definition from the textbook.
-/
def VdVWAsymptoticallyMeasurableLowerShiftedReal
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    (μs : ι -> Measure Ω) (X : ι -> Ω -> S) (l : Filter ι)
    (tests : (S -> ℝ) -> Prop) : Prop :=
  ∀ f c, tests f -> (∀ i ω, c ≤ f (X i ω)) ->
    Tendsto
      (fun i => VdVWLowerShiftedRealOuterInnerExpectationGap (μs i)
        (fun ω => f (X i ω)) c)
      l (𝓝 0)

/--
If every selected real test composition is measurable, then the lower-shifted
real VdV&W asymptotic-measurability gap is identically zero.
-/
theorem VdVWAsymptoticallyMeasurableLowerShiftedReal.of_forall_measurable_comp
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {tests : (S -> ℝ) -> Prop}
    (hmeas : ∀ i f, tests f -> Measurable (fun ω => f (X i ω))) :
    VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l tests := by
  intro f c hf _hlower
  have hzero :
      (fun i => VdVWLowerShiftedRealOuterInnerExpectationGap (μs i)
        (fun ω => f (X i ω)) c) = fun _ => 0 := by
    funext i
    exact VdVWLowerShiftedRealOuterInnerExpectationGap_eq_zero_of_measurable
      (hmeas i f hf)
  simpa [hzero] using (tendsto_const_nhds : Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Measurable maps into a measurable state space are lower-shifted real
asymptotically measurable for every selected measurable real test.
-/
theorem VdVWAsymptoticallyMeasurableLowerShiftedReal.of_forall_measurable
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {tests : (S -> ℝ) -> Prop}
    (hX : ∀ i, Measurable (X i))
    (hT : ∀ T, tests T -> Measurable T) :
    VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l tests :=
  VdVWAsymptoticallyMeasurableLowerShiftedReal.of_forall_measurable_comp
    (fun i T htest => (hT T htest).comp (hX i))

/--
The lower-shifted real asymptotic-measurability predicate is monotone in the
selected real test class.
-/
theorem VdVWAsymptoticallyMeasurableLowerShiftedReal.mono_tests
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {tests tests' : (S -> ℝ) -> Prop}
    (h : VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l tests)
    (hsub : ∀ f, tests' f -> tests f) :
    VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l tests' := by
  intro f c hf hlower
  exact h f c (hsub f hf) hlower

/--
Arbitrary-map pullback for the lower-shifted real
asymptotic-measurability predicate.
-/
theorem VdVWAsymptoticallyMeasurableLowerShiftedReal.comp_map
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    {testsS : (S -> ℝ) -> Prop} {testsT : (T -> ℝ) -> Prop}
    (h : VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l testsS)
    {g : S -> T}
    (hpull : ∀ φ, testsT φ -> testsS (fun s => φ (g s))) :
    VdVWAsymptoticallyMeasurableLowerShiftedReal
      μs (fun i ω => g (X i ω)) l testsT := by
  intro φ c hφ hlower
  exact h (fun s => φ (g s)) c (hpull φ hφ) hlower

/--
The lower-shifted real asymptotic-measurability predicate is stable under
passing to a finer index filter, e.g. a subsequence filter.
-/
theorem VdVWAsymptoticallyMeasurableLowerShiftedReal.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w} [MeasurableSpace Ω]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι} {tests : (S -> ℝ) -> Prop}
    (h : VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l tests)
    (hl : l' ≤ l) :
    VdVWAsymptoticallyMeasurableLowerShiftedReal μs X l' tests := by
  intro f c hf hlower
  exact (h f c hf hlower).mono_left hl

/--
Bounded-continuous lower-shifted asymptotic measurability.

This is the closest current local bridge to VdV&W Definition 1.3.7: it ranges
over bounded continuous real tests, but uses the nonnegative shifted
outer/inner expectation gap until the full signed outer expectation is
formalized.
-/
def VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S] (μs : ι -> Measure Ω)
    (X : ι -> Ω -> S) (l : Filter ι) : Prop :=
  ∀ f : S →ᵇ ℝ, ∀ c,
    (∀ i ω, c ≤ f (X i ω)) ->
      Tendsto
        (fun i => VdVWLowerShiftedRealOuterInnerExpectationGap (μs i)
          (fun ω => f (X i ω)) c)
        l (𝓝 0)

/--
Measurable maps into a topological measurable state space are lower-shifted
asymptotically measurable for all bounded continuous real tests.
-/
theorem VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.of_forall_measurable
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (hX : ∀ i, Measurable (X i)) :
    VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted μs X l := by
  intro f c _hlower
  have hzero :
      (fun i => VdVWLowerShiftedRealOuterInnerExpectationGap (μs i)
        (fun ω => f (X i ω)) c) = fun _ => 0 := by
    funext i
    exact VdVWLowerShiftedRealOuterInnerExpectationGap_eq_zero_of_measurable
      (f.continuous.measurable.comp (hX i))
  simpa [hzero] using (tendsto_const_nhds : Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0))

/--
Continuous maps preserve the lower-shifted bounded-continuous
asymptotic-measurability layer.

This is the local arbitrary-map analogue of the continuous-mapping theorem for
the current shifted outer/inner expectation primitive: every bounded
continuous test on the target pulls back to a bounded continuous test on the
source.
-/
theorem VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.comp_continuous
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω] [TopologicalSpace S] [TopologicalSpace T]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (h : VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted μs X l)
    {g : S -> T} (hg : Continuous g) :
    VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted
      μs (fun i ω => g (X i ω)) l := by
  intro f c hlower
  let gC : C(S, T) := ⟨g, hg⟩
  simpa [gC] using h (f.compContinuous gC) c hlower

/--
The bounded-continuous lower-shifted asymptotic-measurability predicate is
stable under passing to a finer index filter.
-/
theorem VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι}
    (h : VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted μs X l)
    (hl : l' ≤ l) :
    VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted μs X l' := by
  intro f c hlower
  exact (h f c hlower).mono_left hl

/--
Bounded-continuous asymptotic measurability with the canonical lower shift
`-‖f‖`.

This removes the explicit lower-bound argument from the local
bounded-continuous layer.  The shift is valid for every bounded continuous
real-valued test by `BoundedContinuousFunction.neg_norm_le_apply`.
-/
def VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S] (μs : ι -> Measure Ω)
    (X : ι -> Ω -> S) (l : Filter ι) : Prop :=
  ∀ f : S →ᵇ ℝ,
    Tendsto
      (fun i => VdVWLowerShiftedRealOuterInnerExpectationGap (μs i)
        (fun ω => f (X i ω)) (-‖f‖))
      l (𝓝 0)

/--
The explicit lower-shifted bounded-continuous layer implies the canonical
`-‖f‖` version.
-/
theorem VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_lowerShifted
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (h :
      VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted μs X l) :
    VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted μs X l := by
  intro f
  exact h f (-‖f‖) fun i ω =>
    BoundedContinuousFunction.neg_norm_le_apply f (X i ω)

/--
Measurable maps into a topological measurable state space are canonically
lower-shifted asymptotically measurable for all bounded continuous real tests.
-/
theorem VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_forall_measurable
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (hX : ∀ i, Measurable (X i)) :
    VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted μs X l :=
  VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_lowerShifted
    (VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.of_forall_measurable
      hX)

/--
Continuous maps preserve the canonical bounded-continuous shifted
asymptotic-measurability predicate whenever the source has the stronger
all-lower-shifts version.
-/
theorem
    VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.comp_continuous_of_lowerShifted
    {Ω : Type u} {S : Type v} {T : Type w} {ι : Type x}
    [MeasurableSpace Ω] [TopologicalSpace S] [TopologicalSpace T]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S} {l : Filter ι}
    (h : VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted μs X l)
    {g : S -> T} (hg : Continuous g) :
    VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted
      μs (fun i ω => g (X i ω)) l :=
  VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_lowerShifted
    (h.comp_continuous hg)

/--
The canonical bounded-continuous shifted asymptotic-measurability predicate is
stable under passing to a finer index filter.
-/
theorem VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.mono_filter
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [TopologicalSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    {l l' : Filter ι}
    (h : VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted μs X l)
    (hl : l' ≤ l) :
    VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted μs X l' := by
  intro f
  exact (h f).mono_left hl

/--
Measure-level weak convergence of probability measures.

This is the mathlib-backed part of VdV&W Definition 1.3.3, specialized to
ordinary Borel probability measures rather than arbitrary nonmeasurable maps.
-/
def VdVWWeakConvergenceProbabilityMeasures
    {S : Type u} {ι : Type v} [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    (μs : ι -> ProbabilityMeasure S) (l : Filter ι)
    (μ : ProbabilityMeasure S) : Prop :=
  Tendsto μs l (𝓝 μ)

/--
VdV&W weak convergence of probability measures is characterized by convergence
of integrals of all bounded continuous real-valued test functions.

This is the direct pinned-mathlib foundation for the measure-level part of
Chapter 1.3.
-/
theorem vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto
    {S : Type u} {ι : Type v} [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S} :
    VdVWWeakConvergenceProbabilityMeasures μs l μ ↔
      ∀ f : S →ᵇ ℝ,
        Tendsto (fun i => ∫ s, f s ∂(μs i : Measure S)) l
          (𝓝 (∫ s, f s ∂(μ : Measure S))) := by
  exact ProbabilityMeasure.tendsto_iff_forall_integral_tendsto

/--
Measure-level weak convergence implies the signed-outer bounded-continuous
formulation for the identity maps.

This connects the new signed positive/negative outer-expectation bridge back
to the pinned mathlib weak-convergence theorem: on measurable probability
spaces, the signed outer test integral is the ordinary bounded-continuous
test integral.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_id
    {S : Type u} {ι : Type v} [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceProbabilityMeasures μs l μ) :
    VdVWWeakConvergenceSignedOuterBoundedContinuous
      (fun i => (μs i : Measure S)) (fun _ s => s) l μ := by
  intro f
  have houter :
      (fun i =>
        VdVWSignedOuterExpectationPosNeg (μs i : Measure S)
          (fun s => f ((fun s => s) s))) =
        fun i => ∫ s, f s ∂(μs i : Measure S) := by
    funext i
    simpa using
      (VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp
        (μ := (μs i : Measure S)) (X := fun s : S => s) measurable_id f)
  simpa [VdVWWeakConvergenceSignedOuterBoundedContinuous, houter] using
    (vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto.mp h f)

/--
Map-law form of the signed-outer bounded-continuous weak-convergence bridge.

If measurable maps have laws `νs i` under the source measures `μs i`, and
those laws converge weakly, then the original maps converge in the local
signed-outer bounded-continuous sense.  This is the measurable arbitrary-map
analogue of the identity-map bridge.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} [∀ i, IsFiniteMeasure (μs i)]
    {X : ι -> Ω -> S} (hX : ∀ i, Measurable (X i))
    {νs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (hν : VdVWWeakConvergenceProbabilityMeasures νs l μ)
    (hmap : ∀ i, (νs i : Measure S) = Measure.map (X i) (μs i)) :
    VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l μ := by
  intro f
  have houter :
      (fun i =>
        VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))) =
        fun i => ∫ s, f s ∂(νs i : Measure S) := by
    funext i
    calc
      VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))
          = ∫ ω, f (X i ω) ∂μs i := by
            exact VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp
              (μ := μs i) (X := X i) (hX i) f
      _ = ∫ s, f s ∂Measure.map (X i) (μs i) := by
            exact (integral_map (hX i).aemeasurable
              f.continuous.measurable.aestronglyMeasurable).symm
      _ = ∫ s, f s ∂(νs i : Measure S) := by
            rw [← hmap i]
  simpa [VdVWWeakConvergenceSignedOuterBoundedContinuous, houter] using
    (vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto.mp hν f)

/--
Measurable law-level weak convergence gives the proof-carrying signed
bounded-continuous arbitrary-map layer.
-/
theorem
    VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_map_eq
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} [∀ i, IsFiniteMeasure (μs i)]
    {X : ι -> Ω -> S} (hX : ∀ i, Measurable (X i))
    {νs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (hweak : VdVWWeakConvergenceProbabilityMeasures νs l μ)
    (hmap : ∀ i, (νs i : Measure S) = Measure.map (X i) (μs i)) :
    VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs X l μ :=
  { weakConvergence :=
      hweak.to_signedOuterBoundedContinuous_of_map_eq hX hmap
    asymptoticMeasurability :=
      VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_measurable hX }

/--
Varying-domain map-law form of the signed bounded-continuous
weak-convergence bridge.

This is the law-convergence feeder for sample-size-varying spaces such as
`SampleAt Observation n`: once the pushforward laws on the common state space
converge weakly, the varying-domain maps satisfy the proof-carrying signed
bounded-continuous weak-convergence package.
-/
theorem
    VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsFiniteMeasure (μs i)]
    {X : (i : ι) -> Ω i -> S} (hX : ∀ i, Measurable (X i))
    {νs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (hweak : VdVWWeakConvergenceProbabilityMeasures νs l μ)
    (hmap : ∀ i, (νs i : Measure S) = Measure.map (X i) (μs i)) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l μ := by
  refine ⟨?_, ?_⟩
  · intro f
    have houter :
        (fun i =>
          VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))) =
          fun i => ∫ s, f s ∂(νs i : Measure S) := by
      funext i
      calc
        VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))
            = ∫ ω, f (X i ω) ∂μs i := by
              exact
                VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp
                  (μ := μs i) (X := X i) (hX i) f
        _ = ∫ s, f s ∂Measure.map (X i) (μs i) := by
              exact (integral_map (hX i).aemeasurable
                f.continuous.measurable.aestronglyMeasurable).symm
        _ = ∫ s, f s ∂(νs i : Measure S) := by
              rw [← hmap i]
    simpa [VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains,
      houter] using
      (vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto.mp
        hweak f)
  · exact
      VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_measurable
        hX

/--
Varying-domain null-measurable map-law form of the signed bounded-continuous
weak-convergence bridge.

This is the arbitrary-map version used when the source statistics are only
measurable on the completion, as in VdV&W Definition 2.3.3.
-/
theorem
    VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq_nullMeasurable
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [MeasurableSpace.CountablyGenerated S]
    [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsFiniteMeasure (μs i)]
    {X : (i : ι) -> Ω i -> S} (hX : ∀ i, NullMeasurable (X i) (μs i))
    {νs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (hweak : VdVWWeakConvergenceProbabilityMeasures νs l μ)
    (hmap : ∀ i, (νs i : Measure S) = Measure.map (X i) (μs i)) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l μ := by
  refine ⟨?_, ?_⟩
  · intro f
    have houter :
        (fun i =>
          VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))) =
          fun i => ∫ s, f s ∂(νs i : Measure S) := by
      funext i
      calc
        VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))
            = ∫ ω, f (X i ω) ∂μs i := by
              exact
                VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp_nullMeasurable
                  (μ := μs i) (X := X i) (hX i) f
        _ = ∫ s, f s ∂Measure.map (X i) (μs i) := by
              exact (integral_map (hX i).aemeasurable
                f.continuous.measurable.aestronglyMeasurable).symm
        _ = ∫ s, f s ∂(νs i : Measure S) := by
              rw [← hmap i]
    simpa [VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains,
      houter] using
      (vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto.mp
        hweak f)
  · exact
      VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_nullMeasurable
        hX

/--
Automatic-pushforward version of the varying-domain signed
bounded-continuous weak-convergence bridge.
-/
theorem
    VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsProbabilityMeasure (μs i)]
    {X : (i : ι) -> Ω i -> S} (hX : ∀ i, Measurable (X i))
    {l : Filter ι} {μ : ProbabilityMeasure S}
    (hweak :
      VdVWWeakConvergenceProbabilityMeasures
        (fun i =>
          ⟨Measure.map (X i) (μs i),
            Measure.isProbabilityMeasure_map (hX i).aemeasurable⟩)
        l μ) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l μ :=
  VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq
    (μs := μs) (X := X) hX hweak (fun _ => rfl)

/--
Automatic-pushforward version of the varying-domain signed bounded-continuous
weak-convergence bridge for null-measurable maps.
-/
theorem
    VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps_nullMeasurable
    {ι : Type w} {Ω : ι -> Type u} {S : Type v}
    [∀ i, MeasurableSpace (Ω i)]
    [MeasurableSpace S] [MeasurableSpace.CountablyGenerated S]
    [TopologicalSpace S] [OpensMeasurableSpace S]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsProbabilityMeasure (μs i)]
    {X : (i : ι) -> Ω i -> S} (hX : ∀ i, NullMeasurable (X i) (μs i))
    {l : Filter ι} {μ : ProbabilityMeasure S}
    (hweak :
      VdVWWeakConvergenceProbabilityMeasures
        (fun i =>
          ⟨Measure.map (X i) (μs i),
            Measure.isProbabilityMeasure_map ((hX i).aemeasurable)⟩)
        l μ) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l μ :=
  VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq_nullMeasurable
    (μs := μs) (X := X) hX hweak (fun _ => rfl)

/--
Varying-domain convergence in VdV&W outer probability is invariant under
sample-wise almost-everywhere equality.

This is the basic bridge needed when a textbook `P`-measurable object is only
available as a null-measurable statistic on the completed product space: it may
be replaced by an a.e.-equal measurable representative without changing the
outer-probability convergence assertion.
-/
theorem VdVWConvergesInOuterProbabilityConst.congr_ae
    {ι : Type w} {Ω : ι -> Type u} {D : Type v}
    [PseudoMetricSpace D] [∀ i, MeasurableSpace (Ω i)]
    {μs : (i : ι) -> Measure (Ω i)}
    {X Y : (i : ι) -> Ω i -> D} {l : Filter ι} {c : D}
    (hXY : ∀ i, X i =ᵐ[μs i] Y i)
    (hX_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs X l c) :
    VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs Y l c := by
  intro ε hε
  have hprob :
      (fun i =>
        @VdVWOuterProbability (Ω i) inferInstance (μs i)
          {ω | ε < dist (Y i ω) c}) =
      (fun i =>
        @VdVWOuterProbability (Ω i) inferInstance (μs i)
          {ω | ε < dist (X i ω) c}) := by
    funext i
    unfold VdVWOuterProbability
    exact measure_congr ((hXY i).mono fun ω hω => by
      apply propext
      change (ε < dist (Y i ω) c) ↔ (ε < dist (X i ω) c)
      rw [← hω])
  simpa [hprob] using hX_outer ε hε

/--
Real-valued varying-domain convergence in VdV&W outer probability to a
constant implies weak convergence of the pushforward laws to the Dirac law.

This is the law-convergence bridge needed for sample-size-varying endpoints
such as the finite-product centered suprema in Theorem 2.4.3.  The proof uses
bounded-continuous test functions: continuity turns outer-probability
convergence of `X_i` into outer-probability convergence of
`|f(X_i)-f(c)|`, and the existing bounded nonnegative expectation bridge
upgrades that to convergence of test integrals.
-/
theorem
    VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real
    {ι : Type w} {Ω : ι -> Type u}
    [∀ i, MeasurableSpace (Ω i)]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsProbabilityMeasure (μs i)]
    {X : (i : ι) -> Ω i -> ℝ} {l : Filter ι} {c : ℝ}
    (hX_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs X l c)
    (hX_meas : ∀ i, Measurable (X i)) :
    VdVWWeakConvergenceProbabilityMeasures
      (fun i =>
        ⟨Measure.map (X i) (μs i),
          Measure.isProbabilityMeasure_map (hX_meas i).aemeasurable⟩)
      l
      ⟨Measure.dirac c, Measure.dirac.isProbabilityMeasure⟩ := by
  classical
  rw [vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto]
  intro f
  let Y : (i : ι) -> Ω i -> ℝ :=
    fun i ω => |f (X i ω) - f c|
  have hY_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs
        Y l (0 : ℝ) := by
    intro ε hε
    rcases Metric.continuousAt_iff.mp f.continuous.continuousAt ε hε with
      ⟨δ, hδ_pos, hδ⟩
    have hδ_half_pos : 0 < δ / 2 := half_pos hδ_pos
    have htail := hX_outer (δ / 2) hδ_half_pos
    refine
      tendsto_of_tendsto_of_tendsto_of_le_of_le'
        (show Tendsto (fun _ : ι => (0 : ℝ≥0∞)) l (𝓝 0) from
          tendsto_const_nhds)
        htail
        (Eventually.of_forall fun _ => bot_le)
        ?_
    exact Eventually.of_forall fun i => by
      dsimp [VdVWOuterProbability]
      refine measure_mono ?_
      intro ω hω
      have hY_bad : ε < |f (X i ω) - f c| := by
        simpa [Y, Real.dist_eq, sub_zero, abs_of_nonneg (abs_nonneg _)] using hω
      have hnot_small : ¬ dist (X i ω) c < δ := by
        intro hsmall
        have hf_small : dist (f (X i ω)) (f c) < ε := hδ hsmall
        have habs_small : |f (X i ω) - f c| < ε := by
          simpa [Real.dist_eq] using hf_small
        exact (not_lt_of_ge hY_bad.le) habs_small
      have hδ_le : δ ≤ dist (X i ω) c := le_of_not_gt hnot_small
      have hδ_half_lt_delta : δ / 2 < δ := by linarith
      have hδ_half_lt : δ / 2 < dist (X i ω) c :=
        lt_of_lt_of_le hδ_half_lt_delta hδ_le
      simpa [Real.dist_eq] using hδ_half_lt
  have hY_meas : ∀ i, Measurable (Y i) := by
    intro i
    exact ((f.continuous.measurable.comp (hX_meas i)).sub measurable_const).abs
  have hY_nonneg : ∀ i (ω : Ω i), 0 ≤ Y i ω := by
    intro i ω
    exact abs_nonneg _
  have hY_le : ∀ i (ω : Ω i), Y i ω ≤ 2 * ‖f‖ := by
    intro i ω
    simpa [Y, Real.dist_eq] using f.dist_le_two_norm (X i ω) c
  have hY_integrable : ∀ i, Integrable (Y i) (μs i) := by
    intro i
    exact Integrable.of_bound (hY_meas i).aestronglyMeasurable (2 * ‖f‖)
      (Eventually.of_forall fun ω => by
        simpa [Real.norm_eq_abs, abs_of_nonneg (hY_nonneg i ω)] using
          hY_le i ω)
  have hY_int_tendsto :
      Tendsto (fun i => ∫ ω, Y i ω ∂(μs i)) l (𝓝 0) :=
    tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg
      μs (fun i => inferInstance) hY_outer hY_meas hY_integrable hY_nonneg hY_le
  have hdiff_tendsto :
      Tendsto
        (fun i => ∫ ω, (f (X i ω) - f c) ∂(μs i))
        l (𝓝 0) := by
    rw [tendsto_zero_iff_norm_tendsto_zero]
    refine squeeze_zero (fun i => norm_nonneg _) ?_ hY_int_tendsto
    intro i
    calc
      ‖∫ ω, (f (X i ω) - f c) ∂(μs i)‖
          ≤ ∫ ω, ‖f (X i ω) - f c‖ ∂(μs i) :=
            norm_integral_le_integral_norm _
      _ = ∫ ω, Y i ω ∂(μs i) := by
            simp [Y, Real.norm_eq_abs]
  have hsource_tendsto :
      Tendsto (fun i => ∫ ω, f (X i ω) ∂(μs i)) l (𝓝 (f c)) := by
    have hdiff_eq :
        (fun i => ∫ ω, (f (X i ω) - f c) ∂(μs i)) =
          fun i => (∫ ω, f (X i ω) ∂(μs i)) - f c := by
      funext i
      have hfX_int : Integrable (fun ω => f (X i ω)) (μs i) :=
        Integrable.of_bound
          ((f.continuous.measurable.comp (hX_meas i)).aestronglyMeasurable)
          ‖f‖
          (Eventually.of_forall fun ω => f.norm_coe_le_norm (X i ω))
      have hconst_int : Integrable (fun _ : Ω i => f c) (μs i) :=
        integrable_const (f c)
      haveI : IsProbabilityMeasure (μs i) := inferInstance
      rw [integral_sub hfX_int hconst_int]
      simp
    have hdiff' :
        Tendsto (fun i => (∫ ω, f (X i ω) ∂(μs i)) - f c) l (𝓝 0) := by
      simpa [hdiff_eq] using hdiff_tendsto
    have hadd :=
      hdiff'.add
        (show Tendsto (fun _ : ι => f c) l (𝓝 (f c)) from
          tendsto_const_nhds)
    simpa [sub_add_cancel] using hadd
  have hsource_map :
      (fun i => ∫ s, f s ∂(Measure.map (X i) (μs i))) =
        fun i => ∫ ω, f (X i ω) ∂(μs i) := by
    funext i
    exact integral_map (hX_meas i).aemeasurable
      f.continuous.measurable.aestronglyMeasurable
  have htarget_dirac :
      (∫ s, f s ∂(Measure.dirac c : Measure ℝ)) = f c := by
    exact
      (integral_dirac' (fun s : ℝ => f s) c
        f.continuous.stronglyMeasurable)
  change
    Tendsto (fun i => ∫ s, f s ∂(Measure.map (X i) (μs i))) l
      (𝓝 (∫ s, f s ∂(Measure.dirac c : Measure ℝ)))
  simpa [hsource_map, htarget_dirac] using hsource_tendsto

/--
Null-measurable real-valued varying-domain convergence in VdV&W outer
probability to a constant implies weak convergence of the pushforward laws to
the Dirac law.

The proof replaces each statistic by its mathlib `AEMeasurable.mk`
representative, uses `VdVWConvergesInOuterProbabilityConst.congr_ae`, and then
transports the pushforward laws back by `Measure.map_congr`.
-/
theorem
    VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_nullMeasurable
    {ι : Type w} {Ω : ι -> Type u}
    [∀ i, MeasurableSpace (Ω i)]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsProbabilityMeasure (μs i)]
    {X : (i : ι) -> Ω i -> ℝ} {l : Filter ι} {c : ℝ}
    (hX_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs X l c)
    (hX_null : ∀ i, NullMeasurable (X i) (μs i)) :
    VdVWWeakConvergenceProbabilityMeasures
      (fun i =>
        ⟨Measure.map (X i) (μs i),
          Measure.isProbabilityMeasure_map ((hX_null i).aemeasurable)⟩)
      l
      ⟨Measure.dirac c, Measure.dirac.isProbabilityMeasure⟩ := by
  classical
  let Xmk : (i : ι) -> Ω i -> ℝ :=
    fun i => ((hX_null i).aemeasurable).mk (X i)
  have hXmk_meas : ∀ i, Measurable (Xmk i) := by
    intro i
    exact ((hX_null i).aemeasurable).measurable_mk
  have hX_to_mk : ∀ i, X i =ᵐ[μs i] Xmk i := by
    intro i
    exact ((hX_null i).aemeasurable).ae_eq_mk
  have hXmk_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs
        Xmk l c :=
    VdVWConvergesInOuterProbabilityConst.congr_ae hX_to_mk hX_outer
  have hweak_mk :
      VdVWWeakConvergenceProbabilityMeasures
        (fun i =>
          ⟨Measure.map (Xmk i) (μs i),
            Measure.isProbabilityMeasure_map (hXmk_meas i).aemeasurable⟩)
        l
        ⟨Measure.dirac c, Measure.dirac.isProbabilityMeasure⟩ :=
    VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real
      hXmk_outer hXmk_meas
  have hprob_eq :
      (fun i =>
        (⟨Measure.map (Xmk i) (μs i),
          Measure.isProbabilityMeasure_map (hXmk_meas i).aemeasurable⟩ :
            ProbabilityMeasure ℝ)) =
      (fun i =>
        (⟨Measure.map (X i) (μs i),
          Measure.isProbabilityMeasure_map ((hX_null i).aemeasurable)⟩ :
            ProbabilityMeasure ℝ)) := by
    funext i
    ext s hs
    change Measure.map (Xmk i) (μs i) s = Measure.map (X i) (μs i) s
    rw [Measure.map_congr (hX_to_mk i)]
  simpa [hprob_eq] using hweak_mk

/--
Real-valued varying-domain convergence in outer probability to a constant
feeds the proof-carrying signed bounded-continuous varying-domain
weak-convergence package.
-/
theorem
    VdVWConvergesInOuterProbabilityConst.to_signedBoundedContinuousVaryingDomains_real
    {ι : Type w} {Ω : ι -> Type u}
    [∀ i, MeasurableSpace (Ω i)]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsProbabilityMeasure (μs i)]
    {X : (i : ι) -> Ω i -> ℝ} {l : Filter ι} {c : ℝ}
    (hX_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs X l c)
    (hX_meas : ∀ i, Measurable (X i)) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l
      ⟨Measure.dirac c, Measure.dirac.isProbabilityMeasure⟩ :=
  VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps
    hX_meas
    (VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real
      hX_outer hX_meas)

/--
Null-measurable real-valued varying-domain convergence in outer probability to
a constant feeds the proof-carrying signed bounded-continuous varying-domain
weak-convergence package.
-/
theorem
    VdVWConvergesInOuterProbabilityConst.to_signedBoundedContinuousVaryingDomains_real_of_nullMeasurable
    {ι : Type w} {Ω : ι -> Type u}
    [∀ i, MeasurableSpace (Ω i)]
    {μs : (i : ι) -> Measure (Ω i)} [∀ i, IsProbabilityMeasure (μs i)]
    {X : (i : ι) -> Ω i -> ℝ} {l : Filter ι} {c : ℝ}
    (hX_outer :
      VdVWConvergesInOuterProbabilityConst Ω (fun _ => inferInstance) μs X l c)
    (hX_null : ∀ i, NullMeasurable (X i) (μs i)) :
    VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains Ω μs X l
      ⟨Measure.dirac c, Measure.dirac.isProbabilityMeasure⟩ :=
  VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps_nullMeasurable
    hX_null
    (VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_nullMeasurable
      hX_outer hX_null)

/--
Has-law form of the signed-outer bounded-continuous weak-convergence bridge.

This is the most convenient form for probability-theory arguments: the law
assumption supplies the measure-map identity, while measurability supplies the
ordinary integral collapse of the signed outer expectation.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_hasLaw
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    (hX : ∀ i, Measurable (X i))
    {νs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (hν : VdVWWeakConvergenceProbabilityMeasures νs l μ)
    (hlaw : ∀ i, HasLaw (X i) (νs i : Measure S) (μs i)) :
    VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l μ := by
  intro f
  have houter :
      (fun i =>
        VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))) =
        fun i => ∫ s, f s ∂(νs i : Measure S) := by
    funext i
    haveI : IsFiniteMeasure (μs i) := (hlaw i).isFiniteMeasure
    calc
      VdVWSignedOuterExpectationPosNeg (μs i) (fun ω => f (X i ω))
          = ∫ ω, f (X i ω) ∂μs i := by
            exact VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp
              (μ := μs i) (X := X i) (hX i) f
      _ = ∫ s, f s ∂Measure.map (X i) (μs i) := by
            exact (integral_map (hX i).aemeasurable
              f.continuous.measurable.aestronglyMeasurable).symm
      _ = ∫ s, f s ∂(νs i : Measure S) := by
            rw [(hlaw i).map_eq]
  simpa [VdVWWeakConvergenceSignedOuterBoundedContinuous, houter] using
    (vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto.mp hν f)

/--
Has-law weak convergence gives the proof-carrying signed bounded-continuous
arbitrary-map layer.
-/
theorem
    VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_hasLaw
    {Ω : Type u} {S : Type v} {ι : Type w}
    [MeasurableSpace Ω] [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> Measure Ω} {X : ι -> Ω -> S}
    (hX : ∀ i, Measurable (X i))
    {νs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (hweak : VdVWWeakConvergenceProbabilityMeasures νs l μ)
    (hlaw : ∀ i, HasLaw (X i) (νs i : Measure S) (μs i)) :
    VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs X l μ :=
  { weakConvergence :=
      hweak.to_signedOuterBoundedContinuous_of_hasLaw hX hlaw
    asymptoticMeasurability :=
      VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_measurable hX }

/--
VdV&W bounded-Lipschitz test-function criterion for measure-level weak
convergence.

The boundedness hypothesis is the mathlib one: the real-valued test function
has bounded range diameter.  This is a proof-hole-free wrapper around the
pinned portmanteau API.
-/
theorem vdVWWeakConvergenceProbabilityMeasures_iff_forall_bounded_lipschitz_integral_tendsto
    {S : Type u} {ι : Type v} [MeasurableSpace S] [PseudoEMetricSpace S]
    [OpensMeasurableSpace S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι} [l.IsCountablyGenerated]
    {μ : ProbabilityMeasure S} :
    VdVWWeakConvergenceProbabilityMeasures μs l μ ↔
      ∀ f : S → ℝ, (∃ C : ℝ, ∀ x y, dist (f x) (f y) ≤ C) →
        (∃ L, LipschitzWith L f) →
          Tendsto (fun i => ∫ s, f s ∂(μs i : Measure S)) l
            (𝓝 (∫ s, f s ∂(μ : Measure S))) := by
  exact MeasureTheory.tendsto_iff_forall_lipschitz_integral_tendsto

/--
VdV&W Lemma 1.3.1, closed-set step: if every bounded-continuous real test is
measurable for a sigma-field `m`, then every closed set is `m`-measurable.

The proof follows the textbook distance-to-a-closed-set argument using
`x ↦ min (Metric.infDist x F) 1`.
-/
theorem vdVW131_measurableSet_isClosed_of_forall_boundedContinuous_measurable
    {S : Type u} [PseudoMetricSpace S] {m : MeasurableSpace S}
    (h : ∀ f : S →ᵇ ℝ, @Measurable S ℝ m (borel ℝ) f)
    {F : Set S} (hF : IsClosed F) :
    MeasurableSet[m] F := by
  by_cases hFne : F.Nonempty
  · let g : S →ᵇ ℝ :=
      BoundedContinuousFunction.ofNormedAddCommGroup
        (fun x => min (Metric.infDist x F) 1)
        ((Metric.continuous_infDist_pt F).min continuous_const)
        1
        (by
          intro x
          rw [Real.norm_eq_abs]
          have hnonneg : 0 ≤ min (Metric.infDist x F) 1 :=
            le_min Metric.infDist_nonneg zero_le_one
          exact abs_le.mpr
            ⟨le_trans (by norm_num : (-1 : ℝ) ≤ 0) hnonneg,
              min_le_right _ _⟩)
    have hg_meas : @Measurable S ℝ m (borel ℝ) g := h g
    have hpre : MeasurableSet[m] (g ⁻¹' ({0} : Set ℝ)) :=
      hg_meas (measurableSet_singleton (0 : ℝ))
    have hEq : F = g ⁻¹' ({0} : Set ℝ) := by
      ext x
      simp only [Set.mem_preimage, Set.mem_singleton_iff]
      constructor
      · intro hx
        have hzero : Metric.infDist x F = 0 := Metric.infDist_zero_of_mem hx
        simp [g, hzero]
      · intro hx
        have hmin : min (Metric.infDist x F) 1 = 0 := by simpa [g] using hx
        have hdistzero : Metric.infDist x F = 0 := by
          by_contra hne
          have hpos : 0 < Metric.infDist x F :=
            lt_of_le_of_ne Metric.infDist_nonneg (Ne.symm hne)
          have hminpos : 0 < min (Metric.infDist x F) 1 :=
            lt_min hpos zero_lt_one
          linarith
        exact (hF.mem_iff_infDist_zero hFne).2 hdistzero
    simpa [hEq] using hpre
  · have hEmpty : F = ∅ := by
      ext x
      constructor
      · intro hx
        exact (hFne ⟨x, hx⟩).elim
      · intro hx
        cases hx
    simp [hEmpty]

/--
VdV&W Lemma 1.3.1: on a metric space, the Borel sigma-field is contained in
any sigma-field that makes every bounded-continuous real function measurable.
-/
theorem vdVW131_borel_le_of_forall_boundedContinuous_measurable
    {S : Type u} [PseudoMetricSpace S] {m : MeasurableSpace S}
    (h : ∀ f : S →ᵇ ℝ, @Measurable S ℝ m (borel ℝ) f) :
    borel S ≤ m := by
  rw [borel_eq_generateFrom_isClosed]
  exact MeasurableSpace.generateFrom_le fun F hF =>
    vdVW131_measurableSet_isClosed_of_forall_boundedContinuous_measurable h hF

/--
VdV&W Lemma 1.3.1, least-sigma-field formulation: the Borel sigma-field on a
metric space is the least sigma-field making all bounded-continuous real
functions measurable.
-/
theorem vdVW131_borel_le_iff_forall_boundedContinuous_measurable
    {S : Type u} [PseudoMetricSpace S] {m : MeasurableSpace S} :
    borel S ≤ m ↔
      ∀ f : S →ᵇ ℝ, @Measurable S ℝ m (borel ℝ) f := by
  constructor
  · intro hm f
    have hf : @Measurable S ℝ (borel S) (borel ℝ) f :=
      f.continuous.borel_measurable
    exact hf.mono hm le_rfl
  · exact vdVW131_borel_le_of_forall_boundedContinuous_measurable

/--
VdV&W Lemma 1.3.12(i): finite Borel measures are determined by their
bounded-continuous real integrals.

This is the exact finite-measure uniqueness direction available in pinned
mathlib under the `HasOuterApproxClosed` regularity assumption.
-/
theorem vdVW1312_measure_ext_of_forall_boundedContinuous_integral_eq
    {S : Type u} [MeasurableSpace S] [TopologicalSpace S]
    [HasOuterApproxClosed S] [BorelSpace S]
    {μ ν : Measure S} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (h : ∀ f : S →ᵇ ℝ, ∫ s, f s ∂μ = ∫ s, f s ∂ν) :
    μ = ν := by
  exact MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure h

/--
Portmanteau closed-set implication for the measure-level VdV&W weak convergence
wrapper.

This is the pinned-mathlib implication `(T) -> (C)` for probability measures.
The exact arbitrary-map/outer-probability Portmanteau theorem remains a
separate VdV&W-specific layer.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.limsup_measure_closed_le
    {S : Type u} {ι : Type v} [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S] [HasOuterApproxClosed S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    {F : Set S} (hF : IsClosed F) :
    (l.limsup fun i => (μs i : Measure S) F) ≤ (μ : Measure S) F := by
  exact ProbabilityMeasure.limsup_measure_closed_le_of_tendsto h hF

/--
Portmanteau open-set implication for the measure-level VdV&W weak convergence
wrapper.

This is the pinned-mathlib implication `(T) -> (O)` for probability measures.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.le_liminf_measure_open
    {S : Type u} {ι : Type v} [MeasurableSpace S] [TopologicalSpace S]
    [OpensMeasurableSpace S] [HasOuterApproxClosed S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S}
    (h : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    {G : Set S} (hG : IsOpen G) :
    (μ : Measure S) G ≤ l.liminf fun i => (μs i : Measure S) G := by
  exact ProbabilityMeasure.le_liminf_measure_open_of_tendsto h hG

/--
Tightness of a family of probability measures, expressed through mathlib's
`IsTightMeasureSet` on the underlying measures.

This names the measure-level foundation used by VdV&W Prokhorov/tightness
statements.  Stochastic-process asymptotic tightness of arbitrary maps is a
separate local primitive.
-/
def VdVWProbabilityMeasuresTight
    {S : Type u} [MeasurableSpace S] [TopologicalSpace S]
    (A : Set (ProbabilityMeasure S)) : Prop :=
  IsTightMeasureSet {((μ : ProbabilityMeasure S) : Measure S) | μ ∈ A}

/--
A singleton family of probability measures is tight on complete separable
metric-type spaces.

This is the local VdV&W tightness wrapper around mathlib's singleton tightness
theorem for finite measures.
-/
theorem vdVWProbabilityMeasuresTight_singleton
    {S : Type u} [MeasurableSpace S] [TopologicalSpace S]
    [IsCompletelyPseudoMetrizableSpace S] [SecondCountableTopology S] [BorelSpace S]
    (μ : ProbabilityMeasure S) :
    VdVWProbabilityMeasuresTight ({μ} : Set (ProbabilityMeasure S)) := by
  simpa [VdVWProbabilityMeasuresTight] using
    (isTightMeasureSet_singleton (μ := (μ : Measure S)))

/--
VdV&W Lemma 1.3.2 tightness component: on complete separable metric-type
Borel spaces, every Borel probability measure is tight.

The full VdV&W pre-tight/separable/Polish-measure equivalence still needs
local definitions for those measure-level notions; this theorem records the
compiled mathlib-backed tightness direction already available for probability
measures.
-/
theorem vdVW132_complete_separable_probabilityMeasure_tight
    {S : Type u} [MeasurableSpace S] [TopologicalSpace S]
    [IsCompletelyPseudoMetrizableSpace S] [SecondCountableTopology S] [BorelSpace S]
    (μ : ProbabilityMeasure S) :
    VdVWProbabilityMeasuresTight ({μ} : Set (ProbabilityMeasure S)) :=
  vdVWProbabilityMeasuresTight_singleton μ

/--
Compact-set characterization of the VdV&W-local probability-measure tightness
wrapper.
-/
theorem vdVWProbabilityMeasuresTight_iff_exists_compact_measure_compl_le
    {S : Type u} [MeasurableSpace S] [TopologicalSpace S]
    {A : Set (ProbabilityMeasure S)} :
    VdVWProbabilityMeasuresTight A ↔
      ∀ ε, 0 < ε ->
        ∃ K : Set S, IsCompact K ∧
          ∀ μ : ProbabilityMeasure S, μ ∈ A -> (μ : Measure S) (Kᶜ) ≤ ε := by
  constructor
  · intro h ε hε
    rcases
        (isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mp h) ε hε with
      ⟨K, hK, hKμ⟩
    exact ⟨K, hK, fun μ hμA => hKμ (μ : Measure S) ⟨μ, hμA, rfl⟩⟩
  · intro h
    refine isTightMeasureSet_iff_exists_isCompact_measure_compl_le.mpr ?_
    intro ε hε
    rcases h ε hε with ⟨K, hK, hKμ⟩
    refine ⟨K, hK, ?_⟩
    rintro ν ⟨μ, hμA, rfl⟩
    exact hKμ μ hμA

/--
Measure-level Prokhorov compactness wrapper: the closure of a tight family of
probability measures is compact.
-/
theorem VdVWProbabilityMeasuresTight.isCompact_closure
    {S : Type u} [MeasurableSpace S] [TopologicalSpace S] [T2Space S]
    [BorelSpace S] {A : Set (ProbabilityMeasure S)}
    (hA : VdVWProbabilityMeasuresTight A) :
    IsCompact (closure A) := by
  exact isCompact_closure_of_isTightMeasureSet hA

/--
Levy-Prokhorov characterization of the measure-level weak-convergence wrapper
on separable pseudometric spaces.

This packages mathlib's homeomorphism between probability measures with their
weak-convergence topology and the Levy-Prokhorov metric topology.
-/
theorem vdVWWeakConvergenceProbabilityMeasures_iff_levyProkhorov_tendsto
    {S : Type u} {ι : Type v} [MeasurableSpace S] [PseudoMetricSpace S]
    [OpensMeasurableSpace S] [SeparableSpace S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S} :
    VdVWWeakConvergenceProbabilityMeasures μs l μ ↔
      Tendsto (fun i => LevyProkhorov.ofMeasure (μs i)) l
        (𝓝 (LevyProkhorov.ofMeasure μ)) := by
  exact (LevyProkhorov.probabilityMeasureHomeomorph (Ω := S)).isEmbedding.tendsto_nhds_iff

/--
Levy-Prokhorov distance-to-zero form of measure-level weak convergence on
separable pseudometric spaces.
-/
theorem vdVWWeakConvergenceProbabilityMeasures_iff_levyProkhorovDist_tendsto_zero
    {S : Type u} {ι : Type v} [MeasurableSpace S] [PseudoMetricSpace S]
    [OpensMeasurableSpace S] [SeparableSpace S]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S} :
    VdVWWeakConvergenceProbabilityMeasures μs l μ ↔
      Tendsto (fun i => levyProkhorovDist (μs i : Measure S) (μ : Measure S)) l (𝓝 0) := by
  change Tendsto μs l (𝓝 μ) ↔ _
  rw [(LevyProkhorov.probabilityMeasureHomeomorph (Ω := S)).isEmbedding.tendsto_nhds_iff]
  simpa [LevyProkhorov.dist_probabilityMeasure_def] using
    (tendsto_iff_dist_tendsto_zero :
      Tendsto (fun i => LevyProkhorov.ofMeasure (μs i)) l
        (𝓝 (LevyProkhorov.ofMeasure μ)) ↔
      Tendsto (fun i => dist (LevyProkhorov.ofMeasure (μs i))
        (LevyProkhorov.ofMeasure μ)) l (𝓝 0))

/--
Measure-level continuous mapping theorem.

This is the mathlib-backed probability-measure version of the Chapter 1
continuous mapping theorem.  The full VdV&W arbitrary-map statement still needs
the local outer-expectation/asymptotic-measurability layer.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.map_continuous
    {S : Type u} {T : Type v} {ι : Type w}
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    [MeasurableSpace T] [TopologicalSpace T] [BorelSpace T]
    {μs : ι -> ProbabilityMeasure S} {l : Filter ι}
    {μ : ProbabilityMeasure S} {g : S -> T}
    (h : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    (hg : Continuous g) :
    VdVWWeakConvergenceProbabilityMeasures
      (fun i => (μs i).map hg.measurable.aemeasurable) l
      (μ.map hg.measurable.aemeasurable) := by
  exact ProbabilityMeasure.tendsto_map_of_tendsto_of_continuous μs μ h hg

/--
Binary product-law weak convergence.

This is the measure-level product-space foundation for VdV&W Section 1.4,
proved by mathlib's continuity of the product-probability-measure map.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.prod
    {S : Type u} {T : Type v} {ι : Type w}
    [MeasurableSpace S] [TopologicalSpace S] [SecondCountableTopology S]
    [PseudoMetrizableSpace S] [OpensMeasurableSpace S]
    [MeasurableSpace T] [TopologicalSpace T] [SecondCountableTopology T]
    [PseudoMetrizableSpace T] [OpensMeasurableSpace T]
    {μs : ι -> ProbabilityMeasure S} {νs : ι -> ProbabilityMeasure T}
    {l : Filter ι} {μ : ProbabilityMeasure S} {ν : ProbabilityMeasure T}
    (hμ : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    (hν : VdVWWeakConvergenceProbabilityMeasures νs l ν) :
    VdVWWeakConvergenceProbabilityMeasures
      (fun i => (μs i).prod (νs i)) l (μ.prod ν) := by
  have hp : Tendsto (fun i => (μs i, νs i)) l (𝓝 (μ, ν)) :=
    hμ.prodMk_nhds hν
  exact ProbabilityMeasure.continuous_prod.tendsto (μ, ν) |>.comp hp

/--
Finite product-law weak convergence.

This wraps mathlib's continuity of the finite product probability-measure map.
It is the finite-coordinate product-law foundation used before the full
finite-dimensional-distribution criterion is developed.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.pi
    {J : Type u} [Fintype J] {S : J -> Type v} {ι : Type w}
    [∀ j, MeasurableSpace (S j)] [∀ j, TopologicalSpace (S j)]
    [∀ j, SecondCountableTopology (S j)] [∀ j, PseudoMetrizableSpace (S j)]
    [∀ j, OpensMeasurableSpace (S j)]
    {μs : ι -> (j : J) -> ProbabilityMeasure (S j)}
    {l : Filter ι} {μ : (j : J) -> ProbabilityMeasure (S j)}
    (hμ : ∀ j, VdVWWeakConvergenceProbabilityMeasures (fun n => μs n j) l (μ j)) :
    VdVWWeakConvergenceProbabilityMeasures
      (fun n => ProbabilityMeasure.pi (μs n)) l (ProbabilityMeasure.pi μ) := by
  have hp : Tendsto μs l (𝓝 μ) := tendsto_pi_nhds.mpr hμ
  exact ProbabilityMeasure.continuous_pi.tendsto μ |>.comp hp

/--
Finite-dimensional restriction of a weakly convergent process law.

This is the forward FDD direction: weak convergence of laws on a product space
implies weak convergence of every finite-coordinate restriction.
-/
theorem VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict
    {I : Type u} {S : I -> Type v} {ι : Type w}
    [∀ i, MeasurableSpace (S i)] [∀ i, TopologicalSpace (S i)]
    [∀ i, OpensMeasurableSpace (S i)]
    [MeasurableSpace ((i : I) -> S i)] [OpensMeasurableSpace ((i : I) -> S i)]
    {μs : ι -> ProbabilityMeasure ((i : I) -> S i)}
    {l : Filter ι} {μ : ProbabilityMeasure ((i : I) -> S i)}
    (hμ : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    (s : Finset I)
    [MeasurableSpace ((i : s) -> S i)] [BorelSpace ((i : s) -> S i)] :
    VdVWWeakConvergenceProbabilityMeasures
      (fun n => (μs n).map ((Finset.continuous_restrict s).measurable.aemeasurable)) l
      (μ.map ((Finset.continuous_restrict s).measurable.aemeasurable)) := by
  exact hμ.map_continuous (Finset.continuous_restrict s)

/--
Measurable-random-variable continuous mapping theorem for convergence in
distribution.

This wraps mathlib's `TendstoInDistribution.continuous_comp` with a VdV&W local
name for the Chapter 1.11 foundation lane.  It proves the fixed continuous-map
case; varying maps and nonmeasurable outer-probability formulations remain
separate local primitives.
-/
theorem vdVWTendstoInDistribution_continuous_comp
    {ι : Type u} {E : Type v} {F : Type w} {Ω : ι -> Type x}
    {Ω' : Type x} {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [TopologicalSpace F] [MeasurableSpace F] [BorelSpace F]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    {g : E -> F}
    (h : TendstoInDistribution X l Z μ μ')
    (hg : Continuous g) :
    TendstoInDistribution (fun i => g ∘ X i) l (g ∘ Z) μ μ' :=
  h.continuous_comp hg

/--
Measurable common-domain convergence in distribution implies the local
signed-outer bounded-continuous weak-convergence formulation for the original
maps.

Mathlib's `TendstoInDistribution` is convergence of the pushed-forward laws.
This theorem transports that law convergence through the signed
positive/negative VdV&W outer-expectation bridge.  The explicit measurability
hypothesis upgrades the a.e.-measurable law statement to the pointwise
measurable-map collapse used by the current signed outer expectation layer.
-/
theorem vdVWTendstoInDistribution_to_signedOuterBoundedContinuous
    {ι : Type u} {Ω : Type v} {Ω' : Type w} {S : Type x}
    [MeasurableSpace Ω] {μs : ι -> Measure Ω} [∀ i, IsProbabilityMeasure (μs i)]
    [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {X : ι -> Ω -> S} {Z : Ω' -> S} {l : Filter ι}
    (h : TendstoInDistribution X l Z μs μ')
    (hX : ∀ i, Measurable (X i)) :
    VdVWWeakConvergenceSignedOuterBoundedContinuous μs X l
      ⟨μ'.map Z, Measure.isProbabilityMeasure_map h.aemeasurable_limit⟩ := by
  exact
    VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq
      hX h.tendsto (fun _ => rfl)

/--
Measurable common-domain convergence in distribution gives the proof-carrying
signed bounded-continuous arbitrary-map layer.
-/
theorem vdVWTendstoInDistribution_to_signedBoundedContinuousArbitraryMap
    {ι : Type u} {Ω : Type v} {Ω' : Type w} {S : Type x}
    [MeasurableSpace Ω] {μs : ι -> Measure Ω} [∀ i, IsProbabilityMeasure (μs i)]
    [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    [MeasurableSpace S] [TopologicalSpace S] [OpensMeasurableSpace S]
    {X : ι -> Ω -> S} {Z : Ω' -> S} {l : Filter ι}
    (h : TendstoInDistribution X l Z μs μ')
    (hX : ∀ i, Measurable (X i)) :
    VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap μs X l
      ⟨μ'.map Z, Measure.isProbabilityMeasure_map h.aemeasurable_limit⟩ :=
  { weakConvergence :=
      vdVWTendstoInDistribution_to_signedOuterBoundedContinuous h hX
    asymptoticMeasurability :=
      VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_measurable hX }

/--
Common-domain outer-probability convergence implies the proof-carrying signed
bounded-continuous arbitrary-map weak-convergence layer.

This composes the existing VdV&W Lemma 1.10.2 measurable common-domain bridge
from outer probability to mathlib `TendstoInDistribution` with the signed
bounded-continuous arbitrary-map package above.
-/
theorem
    VdVWConvergesInOuterProbability.to_signedBoundedContinuousArbitraryMap
    {ι : Type u} {Ω : Type v} {D : Type w}
    [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    [MeasurableSpace D] [SeminormedAddCommGroup D]
    [SecondCountableTopology D] [BorelSpace D] [OpensMeasurableSpace D]
    {X : ι -> Ω -> D} {limit : Ω -> D} {l : Filter ι}
    [l.NeBot] [l.IsCountablyGenerated]
    (h : VdVWConvergesInOuterProbability μ X l limit)
    (hX : ∀ i, Measurable (X i)) :
    VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap
      (fun _ : ι => μ) X l
      ⟨μ.map limit,
        Measure.isProbabilityMeasure_map
          (tendstoInDistribution_of_vdVWConvergesInOuterProbability h
            (fun i => (hX i).aemeasurable)).aemeasurable_limit⟩ := by
  have hdist :
      TendstoInDistribution X l limit (fun _ : ι => μ) μ :=
    tendstoInDistribution_of_vdVWConvergesInOuterProbability h
      (fun i => (hX i).aemeasurable)
  exact vdVWTendstoInDistribution_to_signedBoundedContinuousArbitraryMap hdist hX

/--
Measurable common-domain Slutsky/product theorem.

This is the mathlib-backed product-convergence foundation for VdV&W Section
1.4 in the ordinary measurable random-variable setting.  The exact
nonmeasurable/asymptotic-independence VdV&W formulations still need separate
local primitives.
-/
theorem vdVWTendstoInDistribution_prodMk_of_tendstoInMeasure_const
    {ι : Type u} {E : Type v} {E' : Type w}
    {Ω : Type x} {Ω' : Type x}
    [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    [MeasurableSpace E] [SeminormedAddCommGroup E]
    [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    [MeasurableSpace E'] [SeminormedAddCommGroup E']
    [SecondCountableTopology E'] [BorelSpace E']
    {X : ι -> Ω -> E} {Y : ι -> Ω -> E'} {Z : Ω' -> E}
    {l : Filter ι} [l.IsCountablyGenerated] {c : E'}
    (hXZ : TendstoInDistribution X l Z (fun _ => μ) μ')
    (hY : TendstoInMeasure μ Y l (fun _ => c))
    (hY_meas : ∀ i, AEMeasurable (Y i) μ) :
    TendstoInDistribution (fun i ω => (X i ω, Y i ω)) l
      (fun ω => (Z ω, c)) (fun _ => μ) μ' :=
  hXZ.prodMk_of_tendstoInMeasure_const X Y Z hY hY_meas

end StatInference
