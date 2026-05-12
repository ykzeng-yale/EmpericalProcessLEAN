import Mathlib.Topology.Bases
import Mathlib.Order.ConditionallyCompleteLattice.Indexed
import Mathlib.Topology.Order.Lattice
import Mathlib.Topology.MetricSpace.Basic
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

/-!
## Totally bounded subtype reductions

The preceding dense-sequence theorem is most often used in empirical-process
arguments on a totally bounded index set.  These wrappers supply the canonical
dense sequence in the subtype and the common `⨆ t ∈ s` real-valued form.
-/

/--
A canonical dense sequence in the subtype of a nonempty totally bounded set.
-/
noncomputable def vdVWDenseSeqInTotallyBounded
    {A : Type u} [PseudoMetricSpace A] {s : Set A}
    (hs : TotallyBounded s) (hs_nonempty : s.Nonempty) (n : ℕ) : ↥s :=
  letI : Nonempty ↥s := hs_nonempty.to_subtype
  letI : SeparableSpace ↥s := hs.isSeparable.separableSpace
  denseSeq ↥s n

/--
For a continuous real-valued function on a nonempty totally bounded set, the
subtype supremum equals the supremum over the canonical dense sequence.
-/
theorem vdVW_iSup_subtype_eq_denseSeqInTotallyBounded
    {A : Type u} [PseudoMetricSpace A] {s : Set A}
    (hs : TotallyBounded s) (hs_nonempty : s.Nonempty)
    {f : A -> ℝ} (hf : Continuous fun t : ↥s => f t.1) :
    ⨆ t : ↥s, f t.1 =
      ⨆ n : ℕ, f (vdVWDenseSeqInTotallyBounded hs hs_nonempty n).1 := by
  letI : Nonempty ↥s := hs_nonempty.to_subtype
  letI : SeparableSpace ↥s := hs.isSeparable.separableSpace
  unfold vdVWDenseSeqInTotallyBounded
  exact vdVW_separableSpace_iSup_eq_denseSeq_real hf

/--
Pathwise dense-sequence reduction for a continuous empirical-process sample
path over a nonempty totally bounded index set.
-/
theorem vdVW_iSup_subtype_process_eq_denseSeqInTotallyBounded
    {Ω : Type v} {A : Type u} [PseudoMetricSpace A] {s : Set A}
    (hs : TotallyBounded s) (hs_nonempty : s.Nonempty)
    {X : A -> Ω -> ℝ}
    (hcont : ∀ ω, Continuous fun t : ↥s => X t.1 ω) :
    ∀ ω,
      (⨆ t : ↥s, X t.1 ω) =
        ⨆ n : ℕ, X (vdVWDenseSeqInTotallyBounded hs hs_nonempty n).1 ω := by
  intro ω
  exact
    vdVW_iSup_subtype_eq_denseSeqInTotallyBounded
      hs hs_nonempty (f := fun a => X a ω) (hcont ω)

/--
For real-valued functions with a zero on `s`, the external `⨆ t ∈ s` notation
equals the subtype supremum.  The zero hypothesis handles the convention for
empty proposition-indexed suprema in the unbounded case.
-/
theorem vdVW_biSup_eq_iSup_subtype_real
    {A : Type u} {s : Set A} {f : A -> ℝ}
    (hs_nonempty : s.Nonempty) (hzero : ∃ t ∈ s, f t = 0) :
    ⨆ t ∈ s, f t = ⨆ t : ↥s, f t.1 := by
  haveI : Nonempty ↥s := hs_nonempty.to_subtype
  haveI : Nonempty A := ⟨hs_nonempty.some⟩
  obtain ⟨t₀, ht₀, hft₀⟩ := hzero
  by_cases hbdd : BddAbove (f '' s)
  · have hbdd_subtype : BddAbove (Set.range fun u : ↥s => f u.1) := by
      obtain ⟨M, hM⟩ := hbdd
      exact ⟨M, by
        rintro _ ⟨⟨u, hu⟩, rfl⟩
        exact hM ⟨u, hu, rfl⟩⟩
    have hbdd_biSup : BddAbove (Set.range fun t => ⨆ _ : t ∈ s, f t) := by
      obtain ⟨M, hM⟩ := hbdd
      refine ⟨max M 0, ?_⟩
      rintro _ ⟨t, rfl⟩
      by_cases ht : t ∈ s
      · simp only [ciSup_pos ht]
        exact le_max_of_le_left (hM ⟨t, ht, rfl⟩)
      · simp only
        rw [ciSup_neg ht, Real.sSup_empty]
        exact le_max_right M 0
    apply le_antisymm
    · apply ciSup_le
      intro t
      by_cases ht : t ∈ s
      · simp only [ciSup_pos ht]
        exact le_ciSup hbdd_subtype ⟨t, ht⟩
      · rw [ciSup_neg ht, Real.sSup_empty]
        calc
          (0 : ℝ) = f t₀ := hft₀.symm
          _ ≤ ⨆ t : ↥s, f t.1 := le_ciSup hbdd_subtype ⟨t₀, ht₀⟩
    · apply ciSup_le
      intro t
      have h : f t.1 = ⨆ _ : t.1 ∈ s, f t.1 := by simp [t.2]
      rw [h]
      exact le_ciSup hbdd_biSup t.1
  · have hbdd_subtype : ¬ BddAbove (Set.range fun u : ↥s => f u.1) := by
      intro hsub
      apply hbdd
      obtain ⟨M, hM⟩ := hsub
      exact ⟨M, by
        rintro _ ⟨t, ht, rfl⟩
        exact hM ⟨⟨t, ht⟩, rfl⟩⟩
    have hbdd_biSup : ¬ BddAbove (Set.range fun t => ⨆ _ : t ∈ s, f t) := by
      intro hbi
      apply hbdd
      obtain ⟨M, hM⟩ := hbi
      exact ⟨M, by
        rintro _ ⟨t, ht, rfl⟩
        have hbound := hM ⟨t, rfl⟩
        simp only [ciSup_pos ht] at hbound
        exact hbound⟩
    rw [Real.iSup_of_not_bddAbove hbdd_biSup]
    rw [Real.iSup_of_not_bddAbove hbdd_subtype]

/--
For a continuous real-valued function on a nonempty totally bounded set, the
external `⨆ t ∈ s` supremum equals the supremum over the canonical dense
sequence, provided the function has a zero on `s`.
-/
theorem vdVW_biSup_eq_denseSeqInTotallyBounded_real
    {A : Type u} [PseudoMetricSpace A] {s : Set A}
    (hs : TotallyBounded s) (hs_nonempty : s.Nonempty)
    {f : A -> ℝ} (hzero : ∃ t ∈ s, f t = 0)
    (hf : Continuous fun t : ↥s => f t.1) :
    ⨆ t ∈ s, f t =
      ⨆ n : ℕ, f (vdVWDenseSeqInTotallyBounded hs hs_nonempty n).1 := by
  rw [vdVW_biSup_eq_iSup_subtype_real hs_nonempty hzero]
  exact vdVW_iSup_subtype_eq_denseSeqInTotallyBounded
    hs hs_nonempty (f := f) hf

/--
Pathwise `⨆ t ∈ s` dense-sequence reduction for continuous sample paths over a
nonempty totally bounded index set.
-/
theorem vdVW_biSup_process_eq_denseSeqInTotallyBounded
    {Ω : Type v} {A : Type u} [PseudoMetricSpace A] {s : Set A}
    (hs : TotallyBounded s) (hs_nonempty : s.Nonempty)
    {X : A -> Ω -> ℝ}
    (hzero : ∀ ω, ∃ t ∈ s, X t ω = 0)
    (hcont : ∀ ω, Continuous fun t : ↥s => X t.1 ω) :
    ∀ ω,
      (⨆ t ∈ s, X t ω) =
        ⨆ n : ℕ, X (vdVWDenseSeqInTotallyBounded hs hs_nonempty n).1 ω := by
  intro ω
  exact
    vdVW_biSup_eq_denseSeqInTotallyBounded_real
      hs hs_nonempty (f := fun a => X a ω) (hzero ω) (hcont ω)

end StatInference
