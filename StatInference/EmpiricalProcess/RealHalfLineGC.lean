import StatInference.EmpiricalProcess.GlivenkoCantelli
import StatInference.EmpiricalProcess.RealHalfLine

/-!
# Half-line Glivenko-Cantelli handoffs

This module connects the supplied-grid layer for VdV&W Example 2.4.2 to the
already proved bracketing Glivenko-Cantelli theorem.  The grid construction
from an arbitrary distribution is still a separate task.
-/

namespace StatInference

open MeasureTheory ProbabilityTheory Set

open scoped Function

universe u

/--
Conditional outer-a.s. Glivenko-Cantelli corollary for the real half-line
indicator class.

If finite extended-real half-line grids are supplied at every positive
`L1(P)` radius, then VdV&W Theorem 2.4.1 applies to the class
`{1{(-infty, c]} : c : R}`.
-/
theorem vdVW_realHalfLine_outerAlmostSureGlivenkoCantelli_of_suppliedERealHalfLineGrids
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsFiniteMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (gridExists :
      ∀ epsilon, 0 < epsilon ->
        ∃ cardinality, Nonempty (SuppliedERealHalfLineGrid P epsilon cardinality)) :
    VdVWOuterAlmostSurePGlivenkoCantelliClass μ P Set.univ
      realHalfLineIndicator X :=
  vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli
    X hLaw hindep
    (SuppliedERealHalfLineGrid.l1BracketingNumber_lt_top_forall gridExists)

/--
Conditional book-style Glivenko-Cantelli corollary for the real half-line
indicator class.

This is the current compiled Example 2.4.2 handoff: once the textbook finite
grid is constructed for every positive radius, the half-line class immediately
inherits the local book-style Glivenko-Cantelli predicate.
-/
theorem vdVW_realHalfLine_glivenkoCantelli_of_suppliedERealHalfLineGrids
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsFiniteMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, HasLaw (X i) P μ)
    (hindep : Pairwise ((· ⟂ᵢ[μ] ·) on X))
    (gridExists :
      ∀ epsilon, 0 < epsilon ->
        ∃ cardinality, Nonempty (SuppliedERealHalfLineGrid P epsilon cardinality)) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X :=
  vdVW_theorem_2_4_1_glivenkoCantelli
    X hLaw hindep
    (SuppliedERealHalfLineGrid.l1BracketingNumber_lt_top_forall gridExists)

end StatInference
