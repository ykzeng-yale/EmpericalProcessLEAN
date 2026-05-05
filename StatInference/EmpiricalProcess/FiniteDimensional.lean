import StatInference.ProbabilityMeasure.FiniteDimensional
import StatInference.EmpiricalProcess.WeakConvergence

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

end StatInference
