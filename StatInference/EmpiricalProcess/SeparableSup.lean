import Mathlib.Topology.Bases
import Mathlib.Order.ConditionallyCompleteLattice.Indexed
import Mathlib.Topology.Order.Lattice
import Mathlib.Data.Real.Basic
import Mathlib.Topology.Algebra.Ring.Real

/-!
# Separable supremum wrappers

This module records a small Chapter 1 separability foundation: a continuous
real-valued functional on a separable space has the same supremum over the full
space as over the canonical dense sequence.  The pattern was identified in the
external statistical-learning-theory formalization and is kept here with
VdV&W-facing names.
-/

namespace StatInference

open TopologicalSpace

universe u v

/-- A closure point of an order-bounded set is still bounded by its supremum. -/
theorem vdVW_closure_mem_le_sSup
    {E : Type v} [ConditionallyCompleteLattice E] [TopologicalSpace E]
    [OrderClosedTopology E] {s : Set E} (hs : BddAbove s)
    {b : E} (hb : b ∈ closure s) :
    b ≤ sSup s := by
  have hsubset : s ⊆ Set.Iic (sSup s) := by
    intro x hx
    exact le_csSup hs hx
  have hclosure : closure s ⊆ Set.Iic (sSup s) := by
    exact closure_minimal hsubset isClosed_Iic
  exact hclosure hb

/-- Taking closure does not change the supremum of a nonempty bounded set. -/
theorem vdVW_sSup_eq_closure_sSup
    {E : Type v} [ConditionallyCompleteLattice E] [TopologicalSpace E]
    [OrderClosedTopology E] {s : Set E} (hs_nonempty : s.Nonempty)
    (hs_bdd : BddAbove s) :
    sSup s = sSup (closure s) := by
  have hclosure_bdd : BddAbove (closure s) := by
    refine ⟨sSup s, ?_⟩
    intro b hb
    exact vdVW_closure_mem_le_sSup hs_bdd hb
  have hclosure_nonempty : (closure s).Nonempty :=
    hs_nonempty.mono subset_closure
  apply le_antisymm
  · exact csSup_le_csSup hclosure_bdd hs_nonempty subset_closure
  · exact csSup_le hclosure_nonempty fun b hb =>
      vdVW_closure_mem_le_sSup hs_bdd hb

/--
The closure of the range of a continuous map from a separable space is already
the closure of the map along the canonical dense sequence.
-/
theorem vdVW_closure_range_eq_closure_denseSeq
    {X : Type u} [TopologicalSpace X] [SeparableSpace X] [Nonempty X]
    {E : Type v} [ConditionallyCompleteLattice E] [TopologicalSpace E]
    [OrderClosedTopology E] {f : X -> E} (hf : Continuous f) :
    closure (Set.range f) = closure (Set.range (f ∘ denseSeq X)) := by
  rw [Set.range_comp f (denseSeq X)]
  apply Set.Subset.antisymm
  · have hdense : Dense (Set.range (denseSeq X)) := denseRange_denseSeq X
    have hsubset := hf.range_subset_closure_image_dense hdense
    exact closure_minimal hsubset isClosed_closure
  · apply closure_mono
    exact Set.image_subset_range f (Set.range (denseSeq X))

/--
A bounded continuous order-valued function on a separable space has the same
supremum over the space as over the canonical dense sequence.
-/
theorem vdVW_separableSpace_iSup_eq_denseSeq
    {X : Type u} [TopologicalSpace X] [SeparableSpace X] [Nonempty X]
    {E : Type v} [ConditionallyCompleteLattice E] [TopologicalSpace E]
    [OrderClosedTopology E] {f : X -> E} (hf : Continuous f)
    (hf_bdd : BddAbove (Set.range f)) :
    ⨆ x : X, f x = ⨆ i : ℕ, f (denseSeq X i) := by
  calc
    _ = sSup (closure (Set.range f)) := by
      exact vdVW_sSup_eq_closure_sSup (Set.range_nonempty f) hf_bdd
    _ = sSup (closure (Set.range (f ∘ denseSeq X))) := by
      rw [vdVW_closure_range_eq_closure_denseSeq hf]
    _ = sSup (Set.range (f ∘ denseSeq X)) := by
      have hf_bdd_dense : BddAbove (Set.range (f ∘ denseSeq X)) := by
        rw [Set.range_comp f (denseSeq X)]
        exact BddAbove.mono (Set.image_subset_range f (Set.range (denseSeq X))) hf_bdd
      exact (vdVW_sSup_eq_closure_sSup
        (Set.range_nonempty (f ∘ denseSeq X)) hf_bdd_dense).symm

/--
Real-valued continuous functions on separable spaces can take suprema over the
canonical dense sequence, with no boundedness hypothesis.
-/
theorem vdVW_separableSpace_iSup_eq_denseSeq_real
    {X : Type u} [TopologicalSpace X] [SeparableSpace X] [Nonempty X]
    {f : X -> ℝ} (hf : Continuous f) :
    ⨆ x : X, f x = ⨆ i : ℕ, f (denseSeq X i) := by
  if hf_bdd : BddAbove (Set.range f) then
    exact vdVW_separableSpace_iSup_eq_denseSeq hf hf_bdd
  else
    have hf_dense_unbdd : ¬ BddAbove (Set.range (f ∘ denseSeq X)) := by
      intro h_dense
      have hclosure_dense : BddAbove (closure (Set.range (f ∘ denseSeq X))) :=
        bddAbove_closure.mpr h_dense
      rw [← vdVW_closure_range_eq_closure_denseSeq hf] at hclosure_dense
      exact hf_bdd (bddAbove_closure.mp hclosure_dense)
    calc
      _ = 0 := Real.iSup_of_not_bddAbove hf_bdd
      _ = _ := (Real.iSup_of_not_bddAbove hf_dense_unbdd).symm

end StatInference
