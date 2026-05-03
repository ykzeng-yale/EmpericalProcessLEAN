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

/--
Chewi Theorem 3.4 one-step recurrence (3.3), supplied with the first-order
strong-convexity lower model from Proposition 1.6 and the descent lemma.
-/
theorem oneStepRecurrence_of_firstOrderStrongConvexOn
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x z : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hx : x ∈ C)
    (hz : z ∈ C)
    (hstep_mem : gradientDescentStep grad h x ∈ C)
    (hh_nonneg : 0 ≤ h)
    (hbeta_step : beta * h ≤ 1) :
    ‖gradientDescentStep grad h x - z‖ ^ (2 : ℕ) ≤
      (1 - alpha * h) * ‖x - z‖ ^ (2 : ℕ) -
        2 * h * (f (gradientDescentStep grad h x) - f z) := by
  let g := grad x
  let xplus := gradientDescentStep grad h x
  have hxplus_def : xplus = x - h • g := rfl
  have hdescent :
      f xplus - f x ≤ -(h / 2) * ‖g‖ ^ (2 : ℕ) := by
    simpa [xplus, g] using
      descentLemma_of_smoothWithGradientOn hsmooth hx hstep_mem
        hh_nonneg hbeta_step
  have hfirst_model :
      f x + inner ℝ g (z - x) +
        (alpha / 2) * ‖z - x‖ ^ (2 : ℕ) ≤ f z := by
    simpa [g] using hfirst.lower_model hx hz
  have hinner_lower :
      f x - f z + (alpha / 2) * ‖x - z‖ ^ (2 : ℕ) ≤
        inner ℝ (x - z) g := by
    have hmodel' :
        f x + inner ℝ g (z - x) +
            (alpha / 2) * ‖z - x‖ ^ (2 : ℕ) ≤ f z := by
      linarith
    have hflip : inner ℝ (x - z) g = -inner ℝ g (z - x) := by
      calc
        inner ℝ (x - z) g = inner ℝ g (x - z) := by
          rw [real_inner_comm]
        _ = inner ℝ g (-(z - x)) := by
          congr
          abel
        _ = -inner ℝ g (z - x) := by
          rw [inner_neg_right]
    have hnorm_eq : ‖z - x‖ ^ (2 : ℕ) = ‖x - z‖ ^ (2 : ℕ) := by
      rw [← norm_neg (x - z)]
      have hneg : -(x - z) = z - x := by
        abel
      rw [hneg]
    rw [hflip]
    rw [← hnorm_eq]
    nlinarith
  have hinner_bound :
      -2 * h * inner ℝ (x - z) g ≤
        -2 * h * (f x - f z) -
          alpha * h * ‖x - z‖ ^ (2 : ℕ) := by
    have hmul :=
      mul_le_mul_of_nonpos_left hinner_lower (by nlinarith : -2 * h ≤ 0)
    nlinarith
  have hquad_bound :
      h ^ (2 : ℕ) * ‖g‖ ^ (2 : ℕ) ≤ -2 * h * (f xplus - f x) := by
    have hmul :=
      mul_le_mul_of_nonpos_left hdescent (by nlinarith : -2 * h ≤ 0)
    nlinarith
  have hnorm_expand :
      ‖xplus - z‖ ^ (2 : ℕ) =
        ‖x - z‖ ^ (2 : ℕ) -
          2 * h * inner ℝ (x - z) g +
          h ^ (2 : ℕ) * ‖g‖ ^ (2 : ℕ) := by
    have hsub : xplus - z = (x - z) - h • g := by
      simp [xplus, g, gradientDescentStep]
      abel
    rw [hsub, norm_sub_sq_real, real_inner_smul_right, norm_smul,
      Real.norm_eq_abs, abs_of_nonneg hh_nonneg]
    ring
  rw [hnorm_expand]
  nlinarith

/--
Chewi Theorem 3.4 weighted finite-sum bound from the first-order
strong-convexity supplied interface and a gradient-descent trajectory.
-/
theorem chewi34_weighted_sum_bound_of_firstOrderStrongConvexOn
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x : ℕ -> E} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (htraj : IsGradientDescentTrajectory grad h x)
    (hmem : ∀ n, x n ∈ C)
    (hxStar : xStar ∈ C)
    (hh_nonneg : 0 ≤ h)
    (hbeta_step : beta * h ≤ 1)
    (hfactor : 0 ≤ 1 - alpha * h)
    (N : ℕ) :
    2 * h *
        (∑ n ∈ Finset.range N,
          (1 - alpha * h) ^ (N - 1 - n) *
            (f (x (n + 1)) - f xStar)) ≤
      (1 - alpha * h) ^ N * ‖x 0 - xStar‖ ^ (2 : ℕ) := by
  have hone_step : ∀ n,
      ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
        (1 - alpha * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * h * (f (x (n + 1)) - f xStar) := by
    intro n
    have hstep_eq : x (n + 1) = gradientDescentStep grad h (x n) :=
      htraj.succ n
    have hstep_mem : gradientDescentStep grad h (x n) ∈ C := by
      rw [← hstep_eq]
      exact hmem (n + 1)
    have hrec :=
      oneStepRecurrence_of_firstOrderStrongConvexOn
        (C := C) (f := f) (grad := grad) (alpha := alpha)
        (beta := beta) (h := h) (x := x n) (z := xStar)
        hfirst hsmooth (hmem n) hxStar hstep_mem hh_nonneg hbeta_step
    simpa [hstep_eq] using hrec
  exact chewi34_weighted_sum_bound_of_one_step hfactor hone_step N

/--
Source-indexed version of
`chewi34_weighted_sum_bound_of_firstOrderStrongConvexOn`.
-/
theorem chewi34_weighted_sum_bound_one_based_of_firstOrderStrongConvexOn
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x : ℕ -> E} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (htraj : IsGradientDescentTrajectory grad h x)
    (hmem : ∀ n, x n ∈ C)
    (hxStar : xStar ∈ C)
    (hh_nonneg : 0 ≤ h)
    (hbeta_step : beta * h ≤ 1)
    (hfactor : 0 ≤ 1 - alpha * h)
    (N : ℕ) :
    2 * h *
        (∑ n ∈ Finset.Ico 1 (N + 1),
          (1 - alpha * h) ^ (N - n) * (f (x n) - f xStar)) ≤
      (1 - alpha * h) ^ N * ‖x 0 - xStar‖ ^ (2 : ℕ) := by
  have hone_step : ∀ n,
      ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
        (1 - alpha * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * h * (f (x (n + 1)) - f xStar) := by
    intro n
    have hstep_eq : x (n + 1) = gradientDescentStep grad h (x n) :=
      htraj.succ n
    have hstep_mem : gradientDescentStep grad h (x n) ∈ C := by
      rw [← hstep_eq]
      exact hmem (n + 1)
    have hrec :=
      oneStepRecurrence_of_firstOrderStrongConvexOn
        (C := C) (f := f) (grad := grad) (alpha := alpha)
        (beta := beta) (h := h) (x := x n) (z := xStar)
        hfirst hsmooth (hmem n) hxStar hstep_mem hh_nonneg hbeta_step
    simpa [hstep_eq] using hrec
  exact chewi34_weighted_sum_bound_one_based_of_one_step hfactor hone_step N

end Optimization
end StatInference
