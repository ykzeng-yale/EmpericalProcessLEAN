import Mathlib.Analysis.Complex.Basic
import Mathlib.Topology.Basic
import Mathlib.Tactic

/-!
# Finite product bounds

This module contains lightweight deterministic finite-product estimates shared
by characteristic-function arguments.
-/

namespace StatInference

open Filter
open scoped BigOperators Topology

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

/--
If a row of bounded complex product factors is perturbed by additive errors
whose row-sum of norms tends to zero, then the product perturbation tends to
zero.
-/
theorem product_add_error_sub_product_tendsto_zero_of_sum_norm
    (z r : ℕ -> ℕ -> ℂ)
    (hz : ∀ᶠ N : ℕ in atTop, ∀ k ∈ Finset.range N, ‖z N k‖ ≤ 1)
    (hzr : ∀ᶠ N : ℕ in atTop,
      ∀ k ∈ Finset.range N, ‖z N k + r N k‖ ≤ 1)
    (hr :
      Tendsto
        (fun N : ℕ => ∑ k ∈ Finset.range N, ‖r N k‖)
        atTop (𝓝 0)) :
    Tendsto
      (fun N : ℕ =>
        (∏ k ∈ Finset.range N, (z N k + r N k)) -
          ∏ k ∈ Finset.range N, z N k)
      atTop (𝓝 0) := by
  rw [tendsto_zero_iff_norm_tendsto_zero]
  refine squeeze_zero' (Eventually.of_forall fun _ => norm_nonneg _) ?_ hr
  filter_upwards [hz, hzr] with N hzN hzrN
  calc
    ‖(∏ k ∈ Finset.range N, (z N k + r N k)) -
        ∏ k ∈ Finset.range N, z N k‖
        ≤ ∑ k ∈ Finset.range N, ‖(z N k + r N k) - z N k‖ :=
          norm_prod_sub_prod_le_sum_norm_sub
            (Finset.range N)
            (fun k : ℕ => z N k + r N k)
            (fun k : ℕ => z N k) hzrN hzN
    _ = ∑ k ∈ Finset.range N, ‖r N k‖ := by
          refine Finset.sum_congr rfl ?_
          intro k _hk
          have hterm : (z N k + r N k) - z N k = r N k := by
            abel
          rw [hterm]

/--
The previous product perturbation estimate as a convergence theorem: if the
unperturbed products tend to a target and the additive-error row sum vanishes,
then the perturbed products have the same limit.
-/
theorem product_add_error_tendsto_of_product_tendsto
    (z r : ℕ -> ℕ -> ℂ) {target : ℂ}
    (hz : ∀ᶠ N : ℕ in atTop, ∀ k ∈ Finset.range N, ‖z N k‖ ≤ 1)
    (hzr : ∀ᶠ N : ℕ in atTop,
      ∀ k ∈ Finset.range N, ‖z N k + r N k‖ ≤ 1)
    (hr :
      Tendsto
        (fun N : ℕ => ∑ k ∈ Finset.range N, ‖r N k‖)
        atTop (𝓝 0))
    (hzprod :
      Tendsto
        (fun N : ℕ => ∏ k ∈ Finset.range N, z N k)
        atTop (𝓝 target)) :
    Tendsto
      (fun N : ℕ => ∏ k ∈ Finset.range N, (z N k + r N k))
      atTop (𝓝 target) := by
  have hdiff :
      Tendsto
        (fun N : ℕ =>
          (∏ k ∈ Finset.range N, (z N k + r N k)) -
            ∏ k ∈ Finset.range N, z N k)
        atTop (𝓝 0) :=
    product_add_error_sub_product_tendsto_zero_of_sum_norm z r hz hzr hr
  have hcombined := hdiff.add hzprod
  simpa only [zero_add] using
    hcombined.congr' (Eventually.of_forall fun N => by
      ring)

end StatInference
