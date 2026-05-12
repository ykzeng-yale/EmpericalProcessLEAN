import Mathlib.Probability.Process.FiniteDimensionalLaws

/-!
# Finite-dimensional process-law wrappers

This module records a content-based finite-dimensional distribution foundation
for stochastic processes.  The proof authority is mathlib's
`Probability.Process.FiniteDimensionalLaws` API, with source-crosswalk value for
textbook process-law statements.
-/

namespace StatInference
namespace ProbabilityMeasure

open MeasureTheory ProbabilityTheory

variable {T Ω : Type*} {𝓧 : T -> Type*} {mΩ : MeasurableSpace Ω}
  {m𝓧 : ∀ t, MeasurableSpace (𝓧 t)}
  {X Y : (t : T) -> Ω -> 𝓧 t} {P : Measure Ω}

/--
The finite-dimensional distributions of a stochastic process form a projective
measure family.
-/
theorem finiteDimensionalDistributions_projective
    (hX : ∀ t, AEMeasurable (X t) P) :
    IsProjectiveMeasureFamily
      (fun I => P.map (fun ω => I.restrict (fun t => X t ω))) := by
  exact ProbabilityTheory.isProjectiveMeasureFamily_map_restrict hX

/--
The full process law is the projective limit of its finite-dimensional
distributions.
-/
theorem processLaw_isProjectiveLimit
    (hX : AEMeasurable (fun ω => fun t => X t ω) P) :
    IsProjectiveLimit
      (P.map (fun ω => fun t => X t ω))
      (fun I => P.map (fun ω => I.restrict (fun t => X t ω))) := by
  exact ProbabilityTheory.isProjectiveLimit_map hX

/--
Two process laws are equal iff all finite-dimensional distributions are equal.

This is the probability-measure wrapper for the finite-dimensional-distribution
uniqueness principle used before broader process-space weak convergence.
-/
theorem processLaw_eq_iff_forall_finiteDimensional_eq [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) P) :
    P.map (fun ω => fun t => X t ω) = P.map (fun ω => fun t => Y t ω) ↔
      ∀ I : Finset T,
        P.map (fun ω => I.restrict (fun t => X t ω)) =
          P.map (fun ω => I.restrict (fun t => Y t ω)) := by
  exact ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq hX hY

/--
Two processes are identically distributed iff all finite-dimensional
restrictions are identically distributed.
-/
theorem identDistrib_iff_forall_finiteDimensional_identDistrib [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) P) :
    IdentDistrib (fun ω => fun t => X t ω) (fun ω => fun t => Y t ω) P P ↔
      ∀ I : Finset T,
        IdentDistrib
          (fun ω => I.restrict (fun t => X t ω))
          (fun ω => I.restrict (fun t => Y t ω)) P P := by
  exact ProbabilityTheory.identDistrib_iff_forall_finset_identDistrib hX hY

/--
Cross-space process laws are equal iff all finite-dimensional distributions
are equal.

This is the arbitrary-source-space version needed for VdV&W process nets: the
two processes may live on different probability spaces.  Finiteness of the
source law for `X` makes its finite-dimensional projective family finite, so
the projective-limit uniqueness theorem identifies the full process laws.
-/
theorem processLaw_eq_iff_forall_finiteDimensional_eq_twoMeasure
    {ΩX ΩY : Type*} [MeasurableSpace ΩX] [MeasurableSpace ΩY]
    {X : (t : T) -> ΩX -> 𝓧 t} {Y : (t : T) -> ΩY -> 𝓧 t}
    {P : Measure ΩX} {Q : Measure ΩY} [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) Q) :
    P.map (fun ω => fun t => X t ω) =
        Q.map (fun ω => fun t => Y t ω) ↔
      ∀ I : Finset T,
        P.map (fun ω => I.restrict (fun t => X t ω)) =
          Q.map (fun ω => I.restrict (fun t => Y t ω)) := by
  constructor
  · intro h I
    have hX' :
        P.map (fun ω => I.restrict (fun t => X t ω)) =
          (P.map (fun ω => fun t => X t ω)).map I.restrict := by
      rw [AEMeasurable.map_map_of_aemeasurable
        (Finset.measurable_restrict _).aemeasurable hX, Function.comp_def]
    have hY' :
        Q.map (fun ω => I.restrict (fun t => Y t ω)) =
          (Q.map (fun ω => fun t => Y t ω)).map I.restrict := by
      rw [AEMeasurable.map_map_of_aemeasurable
        (Finset.measurable_restrict _).aemeasurable hY, Function.comp_def]
    rw [hX', hY', h]
  · intro hFDD
    have hXlim :
        IsProjectiveLimit (P.map (fun ω => fun t => X t ω))
          (fun I : Finset T =>
            P.map (fun ω => I.restrict (fun t => X t ω))) :=
      ProbabilityTheory.isProjectiveLimit_map hX
    have hYlim :
        IsProjectiveLimit (Q.map (fun ω => fun t => Y t ω))
          (fun I : Finset T =>
            Q.map (fun ω => I.restrict (fun t => Y t ω))) :=
      ProbabilityTheory.isProjectiveLimit_map hY
    have hYlim' :
        IsProjectiveLimit (Q.map (fun ω => fun t => Y t ω))
          (fun I : Finset T =>
            P.map (fun ω => I.restrict (fun t => X t ω))) := by
      intro I
      calc
        (Q.map (fun ω => fun t => Y t ω)).map I.restrict =
            Q.map (fun ω => I.restrict (fun t => Y t ω)) := hYlim I
        _ = P.map (fun ω => I.restrict (fun t => X t ω)) :=
            (hFDD I).symm
    haveI :
        ∀ I : Finset T,
          IsFiniteMeasure
            (P.map (fun ω => I.restrict (fun t => X t ω))) := by
      intro I
      infer_instance
    exact hXlim.unique hYlim'

/--
Cross-space process identical distribution is equivalent to identical
distribution of every finite-dimensional restriction.

This repackages the cross-measure projective-limit law extensionality above in
the `IdentDistrib` form used by many probability interfaces.
-/
theorem identDistrib_iff_forall_finiteDimensional_identDistrib_twoMeasure
    {ΩX ΩY : Type*} [MeasurableSpace ΩX] [MeasurableSpace ΩY]
    {X : (t : T) -> ΩX -> 𝓧 t} {Y : (t : T) -> ΩY -> 𝓧 t}
    {P : Measure ΩX} {Q : Measure ΩY} [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) Q) :
    IdentDistrib (fun ω => fun t => X t ω) (fun ω => fun t => Y t ω) P Q ↔
      ∀ I : Finset T,
        IdentDistrib
          (fun ω => I.restrict (fun t => X t ω))
          (fun ω => I.restrict (fun t => Y t ω)) P Q := by
  constructor
  · intro h I
    simpa [Function.comp_def] using h.comp (Finset.measurable_restrict I)
  · intro hFDD
    exact
      ⟨hX, hY,
        (processLaw_eq_iff_forall_finiteDimensional_eq_twoMeasure hX hY).2
          (fun I => (hFDD I).map_eq)⟩

/--
Pointwise almost-sure equality of process coordinates gives equality of every
finite-dimensional distribution.
-/
theorem finiteDimensional_eq_of_forall_ae_eq
    (h : ∀ t, X t =ᵐ[P] Y t) (I : Finset T) :
    P.map (fun ω => I.restrict (fun t => X t ω)) =
      P.map (fun ω => I.restrict (fun t => Y t ω)) := by
  exact ProbabilityTheory.map_restrict_eq_of_forall_ae_eq h I

/--
Pointwise almost-sure equality of process coordinates gives equality of full
process laws.
-/
theorem processLaw_eq_of_forall_ae_eq [IsFiniteMeasure P]
    (hX : AEMeasurable (fun ω => fun t => X t ω) P)
    (hY : AEMeasurable (fun ω => fun t => Y t ω) P)
    (h : ∀ t, X t =ᵐ[P] Y t) :
    P.map (fun ω => fun t => X t ω) = P.map (fun ω => fun t => Y t ω) := by
  exact ProbabilityTheory.map_eq_of_forall_ae_eq hX hY h

end ProbabilityMeasure
end StatInference
