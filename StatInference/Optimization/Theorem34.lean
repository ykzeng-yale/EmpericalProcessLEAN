import StatInference.Optimization.GradientDescent

/-!
# Chewi Theorem 3.4 assembly lemmas

This module starts the supplied-interface assembly layer for Chewi Theorem 3.4,
the function-value convergence theorem for smooth gradient descent.  The first
result packages the finite weighted-sum inequality obtained by applying the
compiled discrete Gronwall lemma to the one-step recurrence (3.1).
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

/--
Generic weighted-sum consequence of a discrete Gronwall recurrence with a
negative forcing term.

This is the algebraic core of the post-Lemma 3.5 step in Chewi Theorem 3.4.
-/
theorem weightedSumBound_of_gronwall_negative_forcing
    {A h : ℝ} (hA : 0 ≤ A) (u gap : ℕ -> ℝ) (N : ℕ)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - 2 * h * gap (n + 1)) :
    2 * h *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      A ^ N * u 0 := by
  let B : ℕ -> ℝ := fun n => -2 * h * gap (n + 1)
  have hrec' : ∀ n, n < N -> u (n + 1) ≤ A * u n + B n := by
    intro n hn
    have h := hrec n hn
    simpa [B, sub_eq_add_neg, mul_assoc] using h
  have hgr :=
    discreteGronwall_sum_le hA u B N hrec'
  have hrhs_nonneg :
      0 ≤ A ^ N * u 0 +
        ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n :=
    huN_nonneg.trans hgr
  have hsum :
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n) =
        -(2 * h) *
          (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) := by
    calc
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n)
          =
            ∑ n ∈ Finset.range N,
              -(2 * h) * (A ^ (N - 1 - n) * gap (n + 1)) := by
              refine Finset.sum_congr rfl ?_
              intro n hn
              simp [B]
              ring
      _ =
            -(2 * h) *
              (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) := by
              rw [Finset.mul_sum]
  have hnonneg :
      0 ≤ A ^ N * u 0 -
        2 * h *
          (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) := by
    simpa [hsum] using hrhs_nonneg
  nlinarith

/--
If every indexed gap in the weighted sum dominates a final gap, then the
weighted sum dominates the final gap times the total weight.
-/
theorem weightedFinalGap_le_weightedGapSum
    {A h finalGap : ℝ} (hA : 0 ≤ A) (hh : 0 ≤ h)
    (gap : ℕ -> ℝ) (N : ℕ)
    (hmono : ∀ n, n < N -> finalGap ≤ gap (n + 1)) :
    2 * h *
        ((∑ n ∈ Finset.range N, A ^ (N - 1 - n)) * finalGap) ≤
      2 * h *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) := by
  have hsum_le :
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) * finalGap ≤
        ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1) := by
    rw [Finset.sum_mul]
    refine Finset.sum_le_sum ?_
    intro n hn
    exact mul_le_mul_of_nonneg_left
      (hmono n (Finset.mem_range.mp hn)) (pow_nonneg hA _)
  have htwoh : 0 ≤ 2 * h := by nlinarith
  exact mul_le_mul_of_nonneg_left hsum_le htwoh

/--
Chewi Theorem 3.4 weighted finite-sum bound, assuming the one-step recurrence
(3.1) as a supplied interface.
-/
theorem chewi34_weighted_sum_bound_of_one_step
    {E : Type*} [NormedAddCommGroup E]
    {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {alpha h : ℝ}
    (hfactor : 0 ≤ 1 - alpha * h)
    (hone_step : ∀ n,
      ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
        (1 - alpha * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * h * (f (x (n + 1)) - f xStar))
    (N : ℕ) :
    2 * h *
        (∑ n ∈ Finset.range N,
          (1 - alpha * h) ^ (N - 1 - n) *
            (f (x (n + 1)) - f xStar)) ≤
      (1 - alpha * h) ^ N * ‖x 0 - xStar‖ ^ (2 : ℕ) := by
  let u : ℕ -> ℝ := fun n => ‖x n - xStar‖ ^ (2 : ℕ)
  let gap : ℕ -> ℝ := fun n => f (x n) - f xStar
  have huN_nonneg : 0 ≤ u N := sq_nonneg ‖x N - xStar‖
  have hrec : ∀ n, n < N ->
      u (n + 1) ≤ (1 - alpha * h) * u n - 2 * h * gap (n + 1) := by
    intro n hn
    simpa [u, gap] using hone_step n
  simpa [u, gap] using
    weightedSumBound_of_gronwall_negative_forcing
      (A := 1 - alpha * h) (h := h) hfactor u gap N huN_nonneg hrec

/--
Source-indexed version of `chewi34_weighted_sum_bound_of_one_step`, matching
the display after Lemma 3.5 in Chewi's proof of Theorem 3.4.
-/
theorem chewi34_weighted_sum_bound_one_based_of_one_step
    {E : Type*} [NormedAddCommGroup E]
    {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {alpha h : ℝ}
    (hfactor : 0 ≤ 1 - alpha * h)
    (hone_step : ∀ n,
      ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
        (1 - alpha * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * h * (f (x (n + 1)) - f xStar))
    (N : ℕ) :
    2 * h *
        (∑ n ∈ Finset.Ico 1 (N + 1),
          (1 - alpha * h) ^ (N - n) * (f (x n) - f xStar)) ≤
      (1 - alpha * h) ^ N * ‖x 0 - xStar‖ ^ (2 : ℕ) := by
  have hzero :=
    chewi34_weighted_sum_bound_of_one_step hfactor hone_step N
  have hsum :
      (∑ n ∈ Finset.range N,
          (1 - alpha * h) ^ (N - 1 - n) *
            (f (x (n + 1)) - f xStar)) =
        ∑ n ∈ Finset.Ico 1 (N + 1),
          (1 - alpha * h) ^ (N - n) * (f (x n) - f xStar) := by
    rw [Finset.sum_Ico_eq_sum_range]
    refine Finset.sum_congr ?_ ?_
    · simp
    · intro n hn
      have hsub : N - (1 + n) = N - 1 - n := by
        omega
      rw [hsub]
      have hadd : n + 1 = 1 + n := by
        omega
      rw [hadd]
  simpa [hsum] using hzero

/--
Chewi Theorem 3.4 monotone-gap weighted lower bound, using a supplied
monotonicity estimate from Lemma 3.1.
-/
theorem chewi34_weighted_final_gap_le_weighted_gap_sum
    {E : Type*}
    {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {alpha h : ℝ}
    (hfactor : 0 ≤ 1 - alpha * h)
    (hh : 0 ≤ h)
    (N : ℕ)
    (hmono : ∀ n, n < N -> f (x N) - f xStar ≤ f (x (n + 1)) - f xStar) :
    2 * h *
        ((∑ n ∈ Finset.range N, (1 - alpha * h) ^ (N - 1 - n)) *
          (f (x N) - f xStar)) ≤
      2 * h *
        (∑ n ∈ Finset.range N,
          (1 - alpha * h) ^ (N - 1 - n) *
            (f (x (n + 1)) - f xStar)) := by
  let gap : ℕ -> ℝ := fun n => f (x n) - f xStar
  simpa [gap] using
    weightedFinalGap_le_weightedGapSum
      (A := 1 - alpha * h) (h := h) (finalGap := f (x N) - f xStar)
      hfactor hh gap N hmono

end Optimization
end StatInference
