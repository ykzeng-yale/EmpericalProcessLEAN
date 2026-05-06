import StatInference.ProbabilityMeasure.FiniteDimensional
import StatInference.EmpiricalProcess.WeakConvergence
import StatInference.EmpiricalProcess.EllInfty
import Mathlib.MeasureTheory.Measure.HasOuterApproxClosedProd

/-!
# Finite-dimensional empirical-process law wrappers

This module records the uniqueness-only finite-dimensional-distribution layer
behind VdV&W Theorem 1.4.8.  It does not state the full weak-convergence
criterion for arbitrary nets; it gives law-extensionality wrappers for
measurable process laws and the forward weak-convergence-to-FDD restriction
direction.
-/

namespace StatInference

open MeasureTheory ProbabilityTheory
open scoped BoundedContinuousFunction

variable {T Ω : Type*} {𝓧 : T -> Type*} {mΩ : MeasurableSpace Ω}
  {m𝓧 : ∀ t, MeasurableSpace (𝓧 t)}
  {X Y : (t : T) -> Ω -> 𝓧 t} {P : Measure Ω}

/--
VdV&W Lemma 1.4.1: for separable metric-type Borel spaces, the product of the
Borel sigma-fields equals the Borel sigma-field of the product topology.

This is the local empirical-process wrapper around mathlib's
`Prod.borelSpace` instance, with separability providing second countability
for pseudometric spaces.
-/
theorem vdVW141_prod_borel_eq_product_borel
    {D E : Type*} [PseudoMetricSpace D] [TopologicalSpace.SeparableSpace D]
    [MeasurableSpace D] [BorelSpace D]
    [PseudoMetricSpace E] [TopologicalSpace.SeparableSpace E]
    [MeasurableSpace E] [BorelSpace E] :
    (inferInstance : MeasurableSpace (D × E)) = borel (D × E) :=
  BorelSpace.measurable_eq

/--
VdV&W 1.4.2 product-test uniqueness layer: a finite measure on `D × E` is
determined by integrals of products `f(x) g(y)` over bounded continuous real
test functions.

This is the ordinary measure-level product-space foundation.  It reuses
mathlib's `HasOuterApproxClosed` product-measure extensionality theorem.
-/
theorem vdVW142_prod_measure_ext_of_forall_boundedContinuous_integral_mul
    {D E : Type*}
    [MeasurableSpace D] [TopologicalSpace D] [BorelSpace D] [HasOuterApproxClosed D]
    [MeasurableSpace E] [TopologicalSpace E] [BorelSpace E] [HasOuterApproxClosed E]
    {μ ν : Measure (D × E)} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (h : ∀ (f : D →ᵇ ℝ) (g : E →ᵇ ℝ),
      ∫ p, f p.1 * g p.2 ∂μ = ∫ p, f p.1 * g p.2 ∂ν) :
    μ = ν := by
  exact Measure.ext_of_integral_mul_boundedContinuousFunction h

/--
VdV&W 1.4.2 product-law uniqueness layer: a finite measure on `D × E` is the
product `μ.prod ν` if all bounded-continuous product tests factor into the
product of their marginal integrals.
-/
theorem vdVW142_prod_measure_eq_prod_of_forall_boundedContinuous_integral_mul
    {D E : Type*}
    [MeasurableSpace D] [TopologicalSpace D] [BorelSpace D] [HasOuterApproxClosed D]
    [MeasurableSpace E] [TopologicalSpace E] [BorelSpace E] [HasOuterApproxClosed E]
    {μ : Measure D} {ν : Measure E} {ξ : Measure (D × E)}
    [IsFiniteMeasure μ] [IsFiniteMeasure ν] [IsFiniteMeasure ξ]
    (h : ∀ (f : D →ᵇ ℝ) (g : E →ᵇ ℝ),
      ∫ p, f p.1 * g p.2 ∂ξ = (∫ x, f x ∂μ) * (∫ y, g y ∂ν)) :
    ξ = μ.prod ν := by
  exact Measure.eq_prod_of_integral_mul_boundedContinuousFunction h

/--
VdV&W 1.4.8 uniqueness-only layer: a process law is determined by all of its
finite-dimensional distributions.

This is only the law-extensionality component used in the proof of the
textbook weak-convergence criterion.  It is not the full theorem 1.4.8, which
also involves arbitrary nets, separability, asymptotic measurability, tightness,
and weak convergence.
-/
theorem vdVW148_processLaw_ext_of_forall_finiteDimensional_eq
    [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) P)
    (hFDD : ∀ I : Finset T,
      P.map (fun ω => I.restrict (fun t => X t ω)) =
        P.map (fun ω => I.restrict (fun t => Y t ω))) :
    P.map (fun ω => fun t => X t ω) =
      P.map (fun ω => fun t => Y t ω) := by
  exact
    (StatInference.ProbabilityMeasure.processLaw_eq_iff_forall_finiteDimensional_eq
      hX hY).2 hFDD

/--
VdV&W 1.4.8 uniqueness-only layer in `IdentDistrib` form: process-level
identical distribution follows from identical distribution of every
finite-dimensional restriction.

This is still only a law-extensionality foundation.  It does not assert the
full weak-convergence/FDD-converse theorem.
-/
theorem vdVW148_identDistrib_of_forall_finiteDimensional_identDistrib
    [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) P)
    (hFDD : ∀ I : Finset T,
      IdentDistrib
        (fun ω => I.restrict (fun t => X t ω))
        (fun ω => I.restrict (fun t => Y t ω)) P P) :
    IdentDistrib (fun ω => fun t => X t ω) (fun ω => fun t => Y t ω) P P := by
  exact
    (StatInference.ProbabilityMeasure.identDistrib_iff_forall_finiteDimensional_identDistrib
      hX hY).2 hFDD

/--
VdV&W 1.4.8 forward finite-dimensional weak-convergence layer: weak
convergence of process laws implies weak convergence of every
finite-dimensional restriction.

This is the easy direction of the textbook finite-dimensional-distribution
criterion.  The converse still needs the exact VdV&W tightness/separability
and asymptotic-measurability hypotheses before it can be stated honestly.
-/
theorem vdVW148_finiteDimensional_weakConvergence_of_processLaw_weakConvergence
    {ι : Type*} {l : Filter ι}
    [∀ t, TopologicalSpace (𝓧 t)] [∀ t, OpensMeasurableSpace (𝓧 t)]
    [MeasurableSpace ((t : T) -> 𝓧 t)] [OpensMeasurableSpace ((t : T) -> 𝓧 t)]
    {μs : ι -> ProbabilityMeasure ((t : T) -> 𝓧 t)}
    {μ : ProbabilityMeasure ((t : T) -> 𝓧 t)}
    (hμ : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    (I : Finset T)
    [MeasurableSpace ((t : I) -> 𝓧 t)] [BorelSpace ((t : I) -> 𝓧 t)] :
    VdVWWeakConvergenceProbabilityMeasures
      (fun n => (μs n).map ((Finset.continuous_restrict I).measurable.aemeasurable))
      l
      (μ.map ((Finset.continuous_restrict I).measurable.aemeasurable)) := by
  exact VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict hμ I

/--
Forward finite-dimensional weak-convergence layer for laws on
`ell_infty(T)`.  This is the process-space version of the easy direction of
VdV&W 1.4.8: weak convergence of `ell_infty(T)` laws implies weak convergence
of every finite coordinate restriction.
-/
theorem vdVW148_ellInfty_finiteDimensional_weakConvergence_of_processLaw_weakConvergence
    {ι : Type*} {l : Filter ι}
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    {μs : ι -> ProbabilityMeasure (VdVWEllInfty T)}
    {μ : ProbabilityMeasure (VdVWEllInfty T)}
    (hμ : VdVWWeakConvergenceProbabilityMeasures μs l μ)
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    VdVWWeakConvergenceProbabilityMeasures
      (fun n => (μs n).map
        ((VdVWEllInfty.continuous_finiteRestrict (T := T) I).measurable.aemeasurable))
      l
      (μ.map
        ((VdVWEllInfty.continuous_finiteRestrict (T := T) I).measurable.aemeasurable)) := by
  exact hμ.map_continuous (VdVWEllInfty.continuous_finiteRestrict (T := T) I)

/--
Forward finite-dimensional asymptotic-tightness layer for laws on
`ell_infty(T)`.  Ordinary asymptotic tightness of `ell_infty(T)` laws implies
ordinary asymptotic tightness of every finite-coordinate restriction.

This is only the measure-level forward FDD tightness direction; the
arbitrary-index VdV&W converse still needs separability, process
asymptotic-tightness, and nonmeasurable arbitrary-map primitives.
-/
theorem vdVW148_ellInfty_finiteDimensional_asymptoticallyTight_of_processLaw_asymptoticallyTight
    {ι : Type*} {l : Filter ι}
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    {μs : ι -> ProbabilityMeasure (VdVWEllInfty T)}
    (hμ : VdVWProbabilityMeasuresAsymptoticallyTight μs l)
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    VdVWProbabilityMeasuresAsymptoticallyTight
      (fun n => (μs n).map
        ((VdVWEllInfty.continuous_finiteRestrict (T := T) I).measurable.aemeasurable))
      l := by
  exact hμ.map_continuous (VdVWEllInfty.continuous_finiteRestrict (T := T) I)

/--
For finite index sets, mapping an `ell_infty(T)` law to the ordinary finite
product and back by the finite product equivalence recovers the original law.
-/
@[simp]
theorem vdVW148_ellInfty_map_finiteContinuousLinearEquiv_symm_map
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    (ν : ProbabilityMeasure (VdVWEllInfty T)) :
    ((ν.map
          ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).continuous.measurable.aemeasurable)).map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm.continuous.measurable.aemeasurable)) =
      ν := by
  let e := VdVWEllInfty.finiteContinuousLinearEquiv (T := T)
  ext s hs
  change (Measure.map e.symm (Measure.map e (ν : Measure (VdVWEllInfty T)))) s =
    (ν : Measure (VdVWEllInfty T)) s
  rw [Measure.map_map e.symm.continuous.measurable e.continuous.measurable]
  simp

/--
Finite-index converse for the `ell_infty(T)` finite-dimensional criterion.
When `T` is finite, weak convergence after identifying `ell_infty(T)` with the
ordinary finite product `T -> ℝ` implies weak convergence of the original
`ell_infty(T)` laws.

This is only the finite-index converse.  The arbitrary-index VdV&W 1.4.8
converse still needs the textbook separability, tightness, asymptotic
measurability, and process primitives.
-/
theorem vdVW148_ellInfty_weakConvergence_of_finiteProduct_weakConvergence_finite
    {ι : Type*} {l : Filter ι}
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {μs : ι -> ProbabilityMeasure (VdVWEllInfty T)}
    {μ : ProbabilityMeasure (VdVWEllInfty T)}
    (hμ : VdVWWeakConvergenceProbabilityMeasures
      (fun n => (μs n).map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).continuous.measurable.aemeasurable))
      l
      (μ.map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).continuous.measurable.aemeasurable))) :
    VdVWWeakConvergenceProbabilityMeasures μs l μ := by
  let e := VdVWEllInfty.finiteContinuousLinearEquiv (T := T)
  have hback := hμ.map_continuous e.symm.continuous
  simpa [e] using hback

/--
Direct finite-index measure-level converse: weak convergence of probability
measures on the ordinary finite product `T -> ℝ` pushes back to weak
convergence of their corresponding `ell_infty(T)` laws.

This is a convenient entry point for finite-dimensional process-law arguments.
It is still finite-index only, not the arbitrary-index VdV&W 1.4.8 converse.
-/
theorem vdVW148_ellInfty_map_symm_weakConvergence_of_finiteProduct_weakConvergence_finite
    {ι : Type*} {l : Filter ι}
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {νs : ι -> ProbabilityMeasure (T -> ℝ)}
    {ν : ProbabilityMeasure (T -> ℝ)}
    (hν : VdVWWeakConvergenceProbabilityMeasures νs l ν) :
    VdVWWeakConvergenceProbabilityMeasures
      (fun n => (νs n).map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm.continuous.measurable.aemeasurable))
      l
      (ν.map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm.continuous.measurable.aemeasurable)) :=
  hν.map_continuous (VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm.continuous

/--
Finite-index converse for ordinary measure-level asymptotic tightness on
`ell_infty(T)`: if the finite-product image laws are asymptotically tight,
then the original `ell_infty(T)` laws are asymptotically tight.

This is finite-index only.  The arbitrary-index process asymptotic-tightness
criterion remains a separate VdV&W primitive.
-/
theorem vdVW148_ellInfty_asymptoticallyTight_of_finiteProduct_asymptoticallyTight_finite
    {ι : Type*} {l : Filter ι}
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {μs : ι -> ProbabilityMeasure (VdVWEllInfty T)}
    (hμ : VdVWProbabilityMeasuresAsymptoticallyTight
      (fun n => (μs n).map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).continuous.measurable.aemeasurable))
      l) :
    VdVWProbabilityMeasuresAsymptoticallyTight μs l := by
  let e := VdVWEllInfty.finiteContinuousLinearEquiv (T := T)
  have hback := hμ.map_continuous e.symm.continuous
  simpa [e] using hback

/--
Direct finite-index measure-level asymptotic-tightness pushback: ordinary
asymptotic tightness of probability measures on the finite product `T -> ℝ`
pushes back to their corresponding `ell_infty(T)` laws.
-/
theorem vdVW148_ellInfty_map_symm_asymptoticallyTight_of_finiteProduct_asymptoticallyTight_finite
    {ι : Type*} {l : Filter ι}
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {νs : ι -> ProbabilityMeasure (T -> ℝ)}
    (hν : VdVWProbabilityMeasuresAsymptoticallyTight νs l) :
    VdVWProbabilityMeasuresAsymptoticallyTight
      (fun n => (νs n).map
        ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm.continuous.measurable.aemeasurable))
      l :=
  hν.map_continuous (VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm.continuous

/-- Finite-dimensional law of an `ell_infty(T)`-valued random element. -/
theorem vdVW148_ellInfty_finiteDimensional_hasLaw
    [MeasurableSpace Ω] [MeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    {X : Ω -> VdVWEllInfty T} {P : Measure Ω}
    {μ : Measure (VdVWEllInfty T)}
    (hX : HasLaw X μ P)
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    HasLaw
      (VdVWEllInfty.finiteRestrict I ∘ X)
      (μ.map (VdVWEllInfty.finiteRestrict I))
      P := by
  refine HasLaw.comp ?_ hX
  exact
    { aemeasurable :=
        ((VdVWEllInfty.continuous_finiteRestrict (T := T) I).measurable.aemeasurable)
      map_eq := rfl }

/-- Coordinate law of an `ell_infty(T)`-valued random element. -/
theorem vdVW148_ellInfty_coordinate_hasLaw
    [MeasurableSpace Ω] [MeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    {X : Ω -> VdVWEllInfty T} {P : Measure Ω}
    {μ : Measure (VdVWEllInfty T)}
    (hX : HasLaw X μ P) (t : T) :
    HasLaw
      (fun ω => X ω t)
      (μ.map (VdVWEllInfty.evalCLM t))
      P := by
  simpa [Function.comp_def] using
    (HasLaw.comp
      (Y := VdVWEllInfty.evalCLM (T := T) t)
      (ν := μ.map (VdVWEllInfty.evalCLM t))
      { aemeasurable :=
          ((VdVWEllInfty.evalCLM (T := T) t).continuous.measurable.aemeasurable)
        map_eq := rfl }
      hX)

/-- Identical distribution of `ell_infty(T)` processes implies identical FDDs. -/
theorem vdVW148_ellInfty_finiteDimensional_identDistrib
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    {X : Ω -> VdVWEllInfty T} {Y : Ω' -> VdVWEllInfty T}
    {P : Measure Ω} {Q : Measure Ω'}
    (hXY : IdentDistrib X Y P Q)
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    IdentDistrib
      (VdVWEllInfty.finiteRestrict I ∘ X)
      (VdVWEllInfty.finiteRestrict I ∘ Y)
      P Q :=
  hXY.comp (VdVWEllInfty.measurable_finiteRestrict (T := T) I)

/--
Random-variable form of the forward FDD implication for `ell_infty(T)`:
convergence in distribution of `ell_infty(T)`-valued random elements implies
convergence in distribution of every finite coordinate restriction.

This is still the easy direction of VdV&W 1.4.8.  The FDD converse requires
the separate tightness/separability/asymptotic-measurability hypotheses.
-/
theorem vdVW148_ellInfty_finiteDimensional_tendstoInDistribution
    {ι : Type*} {Ω : ι -> Type*} {Ω' : Type*}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    {X : (i : ι) -> Ω i -> VdVWEllInfty T}
    {Z : Ω' -> VdVWEllInfty T} {l : Filter ι}
    (hX : TendstoInDistribution X l Z μ μ')
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    TendstoInDistribution
      (fun i => VdVWEllInfty.finiteRestrict I ∘ X i)
      l
      (VdVWEllInfty.finiteRestrict I ∘ Z)
      μ μ' :=
  hX.continuous_comp (VdVWEllInfty.continuous_finiteRestrict (T := T) I)

/--
Finite-dimensional law of a bounded raw process, routed through its
`ell_infty(T)` process law.  This is the raw-process version of the forward
FDD handoff used in VdV&W 1.4.8.
-/
theorem vdVW148_boundedProcess_finiteDimensional_hasLaw
    [MeasurableSpace Ω] [MeasurableSpace (VdVWEllInfty T)]
    [BorelSpace (VdVWEllInfty T)]
    {X : Ω -> T -> ℝ} (hbounded : VdVWEllInfty.IsBoundedSamplePath X)
    {P : Measure Ω} {μ : Measure (VdVWEllInfty T)}
    (hX : HasLaw (VdVWEllInfty.processMap X hbounded) μ P)
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    HasLaw
      (fun ω => I.restrict (X ω))
      (μ.map (VdVWEllInfty.finiteRestrict I))
      P := by
  simpa [Function.comp_def, VdVWEllInfty.finiteRestrict, VdVWEllInfty.processMap]
    using
      (vdVW148_ellInfty_finiteDimensional_hasLaw
        (T := T) (Ω := Ω) (X := VdVWEllInfty.processMap X hbounded)
        (P := P) (μ := μ) hX I)

/--
Identical `ell_infty(T)` laws of bounded raw processes imply identical
finite-dimensional distributions of the original coordinate processes.
-/
theorem vdVW148_boundedProcess_finiteDimensional_identDistrib
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    {X : Ω -> T -> ℝ} {Y : Ω' -> T -> ℝ}
    (hXbounded : VdVWEllInfty.IsBoundedSamplePath X)
    (hYbounded : VdVWEllInfty.IsBoundedSamplePath Y)
    {P : Measure Ω} {Q : Measure Ω'}
    (hXY : IdentDistrib
      (VdVWEllInfty.processMap X hXbounded)
      (VdVWEllInfty.processMap Y hYbounded) P Q)
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    IdentDistrib
      (fun ω => I.restrict (X ω))
      (fun ω => I.restrict (Y ω))
      P Q := by
  simpa [Function.comp_def, VdVWEllInfty.finiteRestrict, VdVWEllInfty.processMap]
    using
      (vdVW148_ellInfty_finiteDimensional_identDistrib
        (T := T) (Ω := Ω) (Ω' := Ω')
        (X := VdVWEllInfty.processMap X hXbounded)
        (Y := VdVWEllInfty.processMap Y hYbounded)
        (P := P) (Q := Q) hXY I)

/--
Raw-process form of the forward FDD implication: convergence in distribution
of the associated bounded `ell_infty(T)` processes implies convergence in
distribution of every finite coordinate restriction.
-/
theorem vdVW148_boundedProcess_finiteDimensional_tendstoInDistribution
    {ι : Type*} {Ω : ι -> Type*} {Ω' : Type*}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [MeasurableSpace (VdVWEllInfty T)] [OpensMeasurableSpace (VdVWEllInfty T)]
    {X : (i : ι) -> Ω i -> T -> ℝ} {Z : Ω' -> T -> ℝ}
    (hXbounded : ∀ i, VdVWEllInfty.IsBoundedSamplePath (X i))
    (hZbounded : VdVWEllInfty.IsBoundedSamplePath Z)
    {l : Filter ι}
    (hX : TendstoInDistribution
      (fun i => VdVWEllInfty.processMap (X i) (hXbounded i))
      l
      (VdVWEllInfty.processMap Z hZbounded)
      μ μ')
    (I : Finset T)
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    TendstoInDistribution
      (fun i ω => I.restrict (X i ω))
      l
      (fun ω => I.restrict (Z ω))
      μ μ' := by
  simpa [Function.comp_def, VdVWEllInfty.finiteRestrict, VdVWEllInfty.processMap]
    using
      (vdVW148_ellInfty_finiteDimensional_tendstoInDistribution
        (T := T) (Ω := Ω) (Ω' := Ω') (μ := μ) (μ' := μ')
        (X := fun i => VdVWEllInfty.processMap (X i) (hXbounded i))
        (Z := VdVWEllInfty.processMap Z hZbounded) (l := l) hX I)

/--
Finite-index law converse for bounded raw processes: a law for the ordinary
finite product process induces the corresponding `ell_infty(T)` process law.

This is finite-index only, using the local equivalence
`VdVWEllInfty.finiteContinuousLinearEquiv`.
-/
theorem vdVW148_boundedProcess_hasLaw_of_finiteProduct_hasLaw_finite
    [MeasurableSpace Ω]
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {X : Ω -> T -> ℝ} (hbounded : VdVWEllInfty.IsBoundedSamplePath X)
    {P : Measure Ω} {ν : Measure (T -> ℝ)}
    (hX : HasLaw X ν P) :
    HasLaw
      (VdVWEllInfty.processMap X hbounded)
      (ν.map (VdVWEllInfty.finiteContinuousLinearEquiv (T := T)).symm)
      P := by
  let e := VdVWEllInfty.finiteContinuousLinearEquiv (T := T)
  have hmap : HasLaw (e.symm ∘ X) (ν.map e.symm) P := by
    refine HasLaw.comp ?_ hX
    exact
      { aemeasurable := e.symm.continuous.measurable.aemeasurable
        map_eq := rfl }
  simpa [e, Function.comp_def, VdVWEllInfty.processMap] using hmap

/--
Finite-index identical-distribution converse for bounded raw processes:
identical finite-product distributions induce identical `ell_infty(T)` process
distributions.
-/
theorem vdVW148_boundedProcess_identDistrib_of_finiteProduct_identDistrib_finite
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {X : Ω -> T -> ℝ} {Y : Ω' -> T -> ℝ}
    (hXbounded : VdVWEllInfty.IsBoundedSamplePath X)
    (hYbounded : VdVWEllInfty.IsBoundedSamplePath Y)
    {P : Measure Ω} {Q : Measure Ω'}
    (hXY : IdentDistrib X Y P Q) :
    IdentDistrib
      (VdVWEllInfty.processMap X hXbounded)
      (VdVWEllInfty.processMap Y hYbounded)
      P Q := by
  let e := VdVWEllInfty.finiteContinuousLinearEquiv (T := T)
  have hmap : IdentDistrib (e.symm ∘ X) (e.symm ∘ Y) P Q :=
    hXY.comp e.symm.continuous.measurable
  simpa [e, Function.comp_def, VdVWEllInfty.processMap] using hmap

/--
Random-variable finite-index converse for `ell_infty(T)`: if `T` is finite,
convergence in distribution after the finite product identification implies
convergence in distribution of the original `ell_infty(T)`-valued variables.

This is the random-variable analogue of
`vdVW148_ellInfty_weakConvergence_of_finiteProduct_weakConvergence_finite`.
-/
theorem vdVW148_ellInfty_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite
    {ι : Type*} {Ω : ι -> Type*} {Ω' : Type*}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {X : (i : ι) -> Ω i -> VdVWEllInfty T}
    {Z : Ω' -> VdVWEllInfty T} {l : Filter ι}
    (hX : TendstoInDistribution
      (fun i => (VdVWEllInfty.finiteContinuousLinearEquiv (T := T)) ∘ X i)
      l
      ((VdVWEllInfty.finiteContinuousLinearEquiv (T := T)) ∘ Z)
      μ μ') :
    TendstoInDistribution X l Z μ μ' := by
  haveI : Nonempty (VdVWEllInfty T) := ⟨0⟩
  let e := VdVWEllInfty.finiteContinuousLinearEquiv (T := T)
  have hback := hX.continuous_comp e.symm.continuous
  simpa [e, Function.comp_def] using hback

/--
Raw-process finite-index converse: for finite `T`, convergence in distribution
of the ordinary finite-coordinate processes implies convergence in
distribution of their bounded `ell_infty(T)` process maps.

This is the raw-process analogue of
`vdVW148_ellInfty_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`.
It remains finite-index only; the arbitrary-index VdV&W 1.4.8 converse still
requires separability, tightness, and asymptotic-measurability primitives.
-/
theorem vdVW148_boundedProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite
    {ι : Type*} {Ω : ι -> Type*} {Ω' : Type*}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [Fintype T]
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (T -> ℝ)] [BorelSpace (T -> ℝ)]
    {X : (i : ι) -> Ω i -> T -> ℝ} {Z : Ω' -> T -> ℝ}
    (hXbounded : ∀ i, VdVWEllInfty.IsBoundedSamplePath (X i))
    (hZbounded : VdVWEllInfty.IsBoundedSamplePath Z)
    {l : Filter ι}
    (hX : TendstoInDistribution X l Z μ μ') :
    TendstoInDistribution
      (fun i => VdVWEllInfty.processMap (X i) (hXbounded i))
      l
      (VdVWEllInfty.processMap Z hZbounded)
      μ μ' := by
  refine
    vdVW148_ellInfty_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite
      (T := T) (Ω := Ω) (Ω' := Ω') (μ := μ) (μ' := μ')
      (X := fun i => VdVWEllInfty.processMap (X i) (hXbounded i))
      (Z := VdVWEllInfty.processMap Z hZbounded) (l := l) ?_
  simpa [Function.comp_def, VdVWEllInfty.processMap] using hX

end StatInference
