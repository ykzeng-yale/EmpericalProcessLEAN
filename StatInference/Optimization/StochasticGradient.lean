import StatInference.Optimization.MirrorDescent

/-!
# Chewi Chapter 12 stochastic gradient methods

This module opens the Chapter 12 lane.  The first packet proves the scalar
weighted-average consequence used at the end of Chewi Theorem 12.1 for SMPGD:
a Gronwall recurrence with a negative gap forcing and an additive stochastic
error gives the displayed weighted average bound.
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

/--
Weighted-sum consequence of a discrete Gronwall recurrence with an additive
stochastic error term.

This is the scalar spine behind the final averaging step in Chewi Theorem 12.1.
-/
theorem weightedSumBound_of_gronwall_negative_forcing_with_error
    {A rho err : ℝ} (hA : 0 ≤ A) (u gap : ℕ -> ℝ) (N : ℕ)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1) + err) :
    rho *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      A ^ N * u 0 +
        err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
  let B : ℕ -> ℝ := fun n => -rho * gap (n + 1) + err
  have hrec' : ∀ n, n < N -> u (n + 1) ≤ A * u n + B n := by
    intro n hn
    simpa [B, sub_eq_add_neg, add_assoc] using hrec n hn
  have hgr :=
    discreteGronwall_sum_le hA u B N hrec'
  have hrhs_nonneg :
      0 ≤ A ^ N * u 0 +
        ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n :=
    huN_nonneg.trans hgr
  have hsum :
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n) =
        -rho *
          (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) +
            err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
    calc
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n)
          =
            ∑ n ∈ Finset.range N,
              ((-rho) * (A ^ (N - 1 - n) * gap (n + 1)) +
                err * A ^ (N - 1 - n)) := by
              refine Finset.sum_congr rfl ?_
              intro n hn
              simp [B]
              ring
      _ =
            (-rho) *
              (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) +
                err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
              rw [Finset.sum_add_distrib, Finset.mul_sum, Finset.mul_sum]
  have hnonneg :
      0 ≤ A ^ N * u 0 -
          rho *
            (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) +
          err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
    simpa [hsum, sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hrhs_nonneg
  nlinarith

/--
Weighted-average version of
`weightedSumBound_of_gronwall_negative_forcing_with_error`.
-/
theorem weightedAverageGap_le_of_gronwall_negative_forcing_with_error
    {A rho err : ℝ} (hA : 0 ≤ A) (hrho : 0 < rho)
    (u gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1) + err) :
    (1 / (∑ n ∈ Finset.range N, A ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      (A ^ N * u 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) +
        err / rho := by
  let weights : ℝ := ∑ n ∈ Finset.range N, A ^ (N - 1 - n)
  let weightedGap : ℝ :=
    ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)
  have hweights_pos : 0 < weights := by
    simpa [weights] using geometricWeights_sum_pos (A := A) hA hN
  have hden_pos : 0 < rho * weights := mul_pos hrho hweights_pos
  have hsum :=
    weightedSumBound_of_gronwall_negative_forcing_with_error
      (A := A) (rho := rho) (err := err) hA u gap N huN_nonneg hrec
  have hsum' : rho * weightedGap ≤ A ^ N * u 0 + err * weights := by
    simpa [weights, weightedGap] using hsum
  calc
    (1 / weights) * weightedGap
        = (rho * weightedGap) / (rho * weights) := by
            field_simp [hrho.ne', hweights_pos.ne']
    _ ≤ (A ^ N * u 0 + err * weights) / (rho * weights) := by
            exact div_le_div_of_nonneg_right hsum' hden_pos.le
    _ = (A ^ N * u 0) / (rho * weights) + err / rho := by
            field_simp [hrho.ne', hweights_pos.ne']

/--
Chewi Theorem 12.1 scalar SMPGD averaging step.  Once the stochastic one-step
estimate has been proved in the normalized form
`u_{n+1} <= A u_n - rho * gap_{n+1} + err`, the suitably weighted average of
the expected gaps is bounded by the initial Bregman term plus the stochastic
error floor.
-/
theorem chewi121_weightedAverageGap_le_of_oneStep
    {A rho err : ℝ} (hA : 0 ≤ A) (hrho : 0 < rho)
    (D gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hone_step : ∀ n, n < N ->
      D (n + 1) ≤ A * D n - rho * gap (n + 1) + err) :
    (1 / (∑ n ∈ Finset.range N, A ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      (A ^ N * D 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) +
        err / rho :=
  weightedAverageGap_le_of_gronwall_negative_forcing_with_error
    (A := A) (rho := rho) (err := err) hA hrho D gap hN hD_N_nonneg hone_step

end Optimization
end StatInference
