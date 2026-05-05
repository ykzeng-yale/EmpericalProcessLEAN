import StatInference.EmpiricalProcess.OuterExpectation
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
