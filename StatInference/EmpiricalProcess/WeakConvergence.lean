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

open scoped BoundedContinuousFunction Topology

universe u v w x

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
