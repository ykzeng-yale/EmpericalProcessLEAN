import Mathlib.Analysis.Complex.Basic
import Mathlib.Tactic

/-!
# Finite product bounds

This module contains lightweight deterministic finite-product estimates shared
by characteristic-function arguments.
-/

namespace StatInference

open scoped BigOperators

/--
If two finite families of complex numbers are bounded by one in norm, then the
norm of the difference of their products is bounded by the sum of the
one-factor differences.
-/
theorem norm_prod_sub_prod_le_sum_norm_sub
    {ι : Type v} [DecidableEq ι] (s : Finset ι) (z w : ι -> ℂ)
    (hz : ∀ i ∈ s, ‖z i‖ ≤ 1) (hw : ∀ i ∈ s, ‖w i‖ ≤ 1) :
        ‖(∏ i ∈ s, z i) - ∏ i ∈ s, w i‖ ≤
          ∑ i ∈ s, ‖z i - w i‖ := by
  classical
  revert hz hw
  refine Finset.induction_on s ?base ?step
  · intro _hz _hw
    simp
  · intro a s ha ih hz hw
    have hz_s : ∀ i ∈ s, ‖z i‖ ≤ 1 := by
      intro i hi
      exact hz i (Finset.mem_insert_of_mem hi)
    have hw_s : ∀ i ∈ s, ‖w i‖ ≤ 1 := by
      intro i hi
      exact hw i (Finset.mem_insert_of_mem hi)
    have hw_a : ‖w a‖ ≤ 1 := hw a (Finset.mem_insert_self a s)
    have hprod_z_s : ‖∏ i ∈ s, z i‖ ≤ 1 := by
      exact (Finset.norm_prod_le s z).trans
        (Finset.prod_le_one (fun i _hi => norm_nonneg (z i)) hz_s)
    have hfirst :
        ‖(z a - w a) * (∏ i ∈ s, z i)‖ ≤ ‖z a - w a‖ := by
      rw [norm_mul]
      nlinarith [hprod_z_s, norm_nonneg (z a - w a)]
    have hsecond :
        ‖w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)‖ ≤
          ∑ i ∈ s, ‖z i - w i‖ := by
      rw [norm_mul]
      have hmul :
          ‖w a‖ * ‖(∏ i ∈ s, z i) - ∏ i ∈ s, w i‖ ≤
            ‖(∏ i ∈ s, z i) - ∏ i ∈ s, w i‖ := by
        nlinarith [hw_a, norm_nonneg ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)]
      exact hmul.trans (ih hz_s hw_s)
    have hrewrite :
        z a * (∏ i ∈ s, z i) - w a * (∏ i ∈ s, w i) =
          (z a - w a) * (∏ i ∈ s, z i) +
            w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i) := by
      ring
    calc
      ‖(∏ i ∈ insert a s, z i) - ∏ i ∈ insert a s, w i‖
          = ‖z a * (∏ i ∈ s, z i) - w a * (∏ i ∈ s, w i)‖ := by
            simp [Finset.prod_insert ha]
      _ = ‖(z a - w a) * (∏ i ∈ s, z i) +
            w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)‖ := by
            rw [hrewrite]
      _ ≤ ‖(z a - w a) * (∏ i ∈ s, z i)‖ +
            ‖w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)‖ :=
            norm_add_le _ _
      _ ≤ ‖z a - w a‖ + ∑ i ∈ s, ‖z i - w i‖ :=
            add_le_add hfirst hsecond
      _ = ∑ i ∈ insert a s, ‖z i - w i‖ := by
            simp [Finset.sum_insert ha]

end StatInference
