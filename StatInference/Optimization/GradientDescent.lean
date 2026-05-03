import StatInference.Optimization.DiscreteGronwall

/-!
# Gradient descent lemmas

This module contains the first Chapter 3 gradient-descent proof layer for
Chewi's optimization notes.  It keeps the theorem assumptions close to the
compiled `SmoothWithGradientOn` upper-model interface while recording the
source descent estimate from Lemma 3.1.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Lemma 3.1, descent lemma, from the local smooth upper-model interface.

The source states the step-size condition as `h <= 1 / beta`; this theorem uses
the algebraically convenient equivalent input `beta * h <= 1`, together with
`0 <= h`.
-/
theorem descentLemma_of_smoothWithGradientOn {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {beta h : ℝ} {x : E}
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hx : x ∈ C)
    (hstep_mem : gradientDescentStep grad h x ∈ C)
    (hh_nonneg : 0 ≤ h)
    (hbeta_step : beta * h ≤ 1) :
    f (gradientDescentStep grad h x) - f x ≤
      -(h / 2) * ‖grad x‖ ^ (2 : ℕ) := by
  let y := gradientDescentStep grad h x
  let g := grad x
  have hupper :
      f y ≤ f x + inner ℝ g (y - x) +
        (beta / 2) * ‖y - x‖ ^ (2 : ℕ) :=
    hsmooth.upper_model hx hstep_mem
  have hy_sub : y - x = -h • g := by
    simp [y, g, gradientDescentStep, sub_eq_add_neg, add_assoc]
  have hinner : inner ℝ g (y - x) = -h * ‖g‖ ^ (2 : ℕ) := by
    rw [hy_sub]
    simp [real_inner_smul_right]
  have hnorm : ‖y - x‖ ^ (2 : ℕ) = h ^ (2 : ℕ) * ‖g‖ ^ (2 : ℕ) := by
    rw [hy_sub, norm_smul, Real.norm_eq_abs]
    rw [abs_neg, abs_of_nonneg hh_nonneg]
    ring_nf
  have hupper' :
      f y - f x ≤
        (-h + (beta / 2) * h ^ (2 : ℕ)) * ‖g‖ ^ (2 : ℕ) := by
    calc
      f y - f x
          ≤ (f x + inner ℝ g (y - x) +
              (beta / 2) * ‖y - x‖ ^ (2 : ℕ)) - f x := by
              exact sub_le_sub_right hupper (f x)
      _ = (-h + (beta / 2) * h ^ (2 : ℕ)) * ‖g‖ ^ (2 : ℕ) := by
              rw [hinner, hnorm]
              ring
  have hcoef : -h + (beta / 2) * h ^ (2 : ℕ) ≤ -(h / 2) := by
    have hmul : beta * h * h ≤ 1 * h :=
      mul_le_mul_of_nonneg_right hbeta_step hh_nonneg
    nlinarith
  have hnorm_nonneg : 0 ≤ ‖g‖ ^ (2 : ℕ) := sq_nonneg ‖g‖
  exact hupper'.trans (mul_le_mul_of_nonneg_right hcoef hnorm_nonneg)

/--
Source-shaped step-size corollary of `descentLemma_of_smoothWithGradientOn`.
-/
theorem descentLemma_of_smoothWithGradientOn_of_le_inv {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {beta h : ℝ} {x : E}
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hx : x ∈ C)
    (hstep_mem : gradientDescentStep grad h x ∈ C)
    (hbeta_pos : 0 < beta)
    (hh_nonneg : 0 ≤ h)
    (hstep_size : h ≤ 1 / beta) :
    f (gradientDescentStep grad h x) - f x ≤
      -(h / 2) * ‖grad x‖ ^ (2 : ℕ) := by
  have hbeta_step : beta * h ≤ 1 := by
    have hmul : beta * h ≤ beta * (1 / beta) :=
      mul_le_mul_of_nonneg_left hstep_size hbeta_pos.le
    have hcancel : beta * (1 / beta) = 1 := by
      field_simp [hbeta_pos.ne']
    linarith
  exact descentLemma_of_smoothWithGradientOn hsmooth hx hstep_mem hh_nonneg hbeta_step

end Optimization
end StatInference
