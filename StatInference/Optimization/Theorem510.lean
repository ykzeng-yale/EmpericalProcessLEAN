import StatInference.Optimization.Theorem34

/-!
# Chewi Theorem 5.10 accelerated gradient descent layer

This module starts the discrete accelerated-gradient route for Chewi Theorem
5.10.  The first layer records the source recurrence parameters and reuses the
compiled Chapter 3 one-step inequality `(3.3)` rather than reproving smooth
gradient-descent algebra.
-/

namespace StatInference
namespace Optimization

open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Chewi Theorem 5.10 sequence `λ₀ = 0`,
`λₙ₊₁ = (1 + sqrt(1 + 4 λₙ²)) / 2`. -/
noncomputable def chewi510Lambda : ℕ -> ℝ
  | 0 => 0
  | n + 1 =>
      (1 + Real.sqrt (1 + 4 * chewi510Lambda n ^ (2 : ℕ))) / 2

@[simp] theorem chewi510Lambda_zero : chewi510Lambda 0 = 0 := rfl

theorem chewi510Lambda_succ (n : ℕ) :
    chewi510Lambda (n + 1) =
      (1 + Real.sqrt (1 + 4 * chewi510Lambda n ^ (2 : ℕ))) / 2 := rfl

/-- Chewi Theorem 5.10 momentum coefficient
`θₙ = (λₙ - 1) / λₙ₊₁`. -/
noncomputable def chewi510Theta (n : ℕ) : ℝ :=
  (chewi510Lambda n - 1) / chewi510Lambda (n + 1)

/-- Source-shaped trial point `y₀ = x₀`,
`yₙ₊₁ = xₙ₊₁ + θₙ₊₁ (xₙ₊₁ - xₙ)`. -/
noncomputable def chewi510TrialPoint (x : ℕ -> E) : ℕ -> E
  | 0 => x 0
  | n + 1 => x (n + 1) + chewi510Theta (n + 1) • (x (n + 1) - x n)

@[simp] theorem chewi510TrialPoint_zero (x : ℕ -> E) :
    chewi510TrialPoint x 0 = x 0 := rfl

theorem chewi510TrialPoint_succ (x : ℕ -> E) (n : ℕ) :
    chewi510TrialPoint x (n + 1) =
      x (n + 1) + chewi510Theta (n + 1) • (x (n + 1) - x n) := rfl

/--
Source-shaped AGD interface for Theorem 5.10.

The source writes `x_{-1} = x_0`; over natural-number indices this is encoded
as the separate condition `y 0 = x 0`.
-/
def IsChewi510AGDTrajectory (grad : E -> E) (beta : ℝ)
    (x y : ℕ -> E) : Prop :=
  y 0 = x 0 ∧
    (∀ n, y (n + 1) =
      x (n + 1) + chewi510Theta (n + 1) • (x (n + 1) - x n)) ∧
    ∀ n, x (n + 1) = gradientDescentStep grad (1 / beta) (y n)

theorem IsChewi510AGDTrajectory.y_zero
    {grad : E -> E} {beta : ℝ} {x y : ℕ -> E}
    (h : IsChewi510AGDTrajectory grad beta x y) :
    y 0 = x 0 :=
  h.1

theorem IsChewi510AGDTrajectory.y_succ
    {grad : E -> E} {beta : ℝ} {x y : ℕ -> E}
    (h : IsChewi510AGDTrajectory grad beta x y) (n : ℕ) :
    y (n + 1) =
      x (n + 1) + chewi510Theta (n + 1) • (x (n + 1) - x n) :=
  h.2.1 n

theorem IsChewi510AGDTrajectory.step
    {grad : E -> E} {beta : ℝ} {x y : ℕ -> E}
    (h : IsChewi510AGDTrajectory grad beta x y) (n : ℕ) :
    x (n + 1) = gradientDescentStep grad (1 / beta) (y n) :=
  h.2.2 n

/-- Nonnegativity of Chewi's `λₙ` sequence. -/
theorem chewi510Lambda_nonneg (n : ℕ) :
    0 ≤ chewi510Lambda n := by
  induction n with
  | zero =>
      simp [chewi510Lambda]
  | succ n ih =>
      rw [chewi510Lambda_succ]
      have hsqrt_nonneg :
          0 ≤ Real.sqrt (1 + 4 * chewi510Lambda n ^ (2 : ℕ)) :=
        Real.sqrt_nonneg _
      nlinarith

/-- Every successor `λₙ₊₁` is strictly positive. -/
theorem chewi510Lambda_pos_succ (n : ℕ) :
    0 < chewi510Lambda (n + 1) := by
  rw [chewi510Lambda_succ]
  have hsqrt_nonneg :
      0 ≤ Real.sqrt (1 + 4 * chewi510Lambda n ^ (2 : ℕ)) :=
    Real.sqrt_nonneg _
  nlinarith

theorem chewi510Lambda_ne_zero_succ (n : ℕ) :
    chewi510Lambda (n + 1) ≠ 0 :=
  (chewi510Lambda_pos_succ n).ne'

/-- Chewi's defining recurrence implies `λₙ₊₁(λₙ₊₁ - 1) = λₙ²`. -/
theorem chewi510Lambda_succ_mul_sub_one (n : ℕ) :
    chewi510Lambda (n + 1) * (chewi510Lambda (n + 1) - 1) =
      chewi510Lambda n ^ (2 : ℕ) := by
  let a : ℝ := chewi510Lambda n
  have hnonneg : 0 ≤ 1 + 4 * a ^ (2 : ℕ) := by
    nlinarith [sq_nonneg a]
  have hsqrt_sq :
      (Real.sqrt (1 + 4 * a ^ (2 : ℕ))) ^ (2 : ℕ) =
        1 + 4 * a ^ (2 : ℕ) :=
    Real.sq_sqrt hnonneg
  rw [chewi510Lambda_succ]
  change
    ((1 + Real.sqrt (1 + 4 * a ^ (2 : ℕ))) / 2) *
        (((1 + Real.sqrt (1 + 4 * a ^ (2 : ℕ))) / 2) - 1) =
      a ^ (2 : ℕ)
  nlinarith [hsqrt_sq]

/-- A useful growth step: `λₙ₊₁ ≥ λₙ + 1/2`. -/
theorem chewi510Lambda_add_half_le_succ (n : ℕ) :
    chewi510Lambda n + (1 : ℝ) / 2 ≤ chewi510Lambda (n + 1) := by
  let a : ℝ := chewi510Lambda n
  have hsqrt_ge :
      2 * a ≤ Real.sqrt (1 + 4 * a ^ (2 : ℕ)) := by
    apply Real.le_sqrt_of_sq_le
    nlinarith [sq_nonneg a]
  rw [chewi510Lambda_succ]
  change a + (1 : ℝ) / 2 ≤
    (1 + Real.sqrt (1 + 4 * a ^ (2 : ℕ))) / 2
  nlinarith

/-- Source final estimate ingredient: `λ_N ≥ N / 2`. -/
theorem chewi510Lambda_ge_nat_half (N : ℕ) :
    (N : ℝ) / 2 ≤ chewi510Lambda N := by
  induction N with
  | zero =>
      simp [chewi510Lambda]
  | succ N ih =>
      have hstep := chewi510Lambda_add_half_le_succ N
      have hcast : ((N + 1 : ℕ) : ℝ) = (N : ℝ) + 1 := by
        norm_num
      nlinarith

/-- The scalar identity behind the source choice of `θₙ₊₁`. -/
theorem chewi510Lambda_mul_theta_succ (n : ℕ) :
    chewi510Lambda (n + 2) * chewi510Theta (n + 1) =
      chewi510Lambda (n + 1) - 1 := by
  unfold chewi510Theta
  have hne : chewi510Lambda (n + 2) ≠ 0 :=
    chewi510Lambda_ne_zero_succ (n + 1)
  field_simp [hne]

/--
The source telescoping alignment forced by
`θₙ₊₁ = (λₙ₊₁ - 1) / λₙ₊₂`.
-/
theorem chewi510_telescopeAlignment_of_trial_succ
    (x y : ℕ -> E) (n : ℕ)
    (hy : y (n + 1) =
      x (n + 1) + chewi510Theta (n + 1) • (x (n + 1) - x n)) :
    chewi510Lambda (n + 1) • x (n + 1) -
        (chewi510Lambda (n + 1) - 1) • x n =
      chewi510Lambda (n + 2) • y (n + 1) -
        (chewi510Lambda (n + 2) - 1) • x (n + 1) := by
  rw [hy]
  have htheta := chewi510Lambda_mul_theta_succ n
  calc
    chewi510Lambda (n + 1) • x (n + 1) -
        (chewi510Lambda (n + 1) - 1) • x n
        =
          (chewi510Lambda (n + 1) - 1) • (x (n + 1) - x n) +
            x (n + 1) := by
          module
    _ =
      chewi510Lambda (n + 2) •
          (x (n + 1) + chewi510Theta (n + 1) • (x (n + 1) - x n)) -
        (chewi510Lambda (n + 2) - 1) • x (n + 1) := by
      rw [smul_add, smul_smul, htheta]
      module

/-- Telescoping alignment for a source-shaped AGD trajectory. -/
theorem IsChewi510AGDTrajectory.telescopeAlignment
    {grad : E -> E} {beta : ℝ} {x y : ℕ -> E}
    (h : IsChewi510AGDTrajectory grad beta x y) (n : ℕ) :
    chewi510Lambda (n + 1) • x (n + 1) -
        (chewi510Lambda (n + 1) - 1) • x n =
      chewi510Lambda (n + 2) • y (n + 1) -
        (chewi510Lambda (n + 2) - 1) • x (n + 1) :=
  chewi510_telescopeAlignment_of_trial_succ x y n (h.y_succ n)

/--
Chewi Theorem 5.10's reuse of `(3.3)`:
`x⁺ = y - β⁻¹ ∇f(y)` satisfies the source one-step inequality.
-/
theorem chewi510_oneStepInequality
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {beta : ℝ}
    {y z : E}
    (hfirst : FirstOrderStrongConvexOn C f grad 0)
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hy : y ∈ C)
    (hz : z ∈ C)
    (hstep_mem : gradientDescentStep grad (1 / beta) y ∈ C)
    (hbeta_pos : 0 < beta) :
    ‖gradientDescentStep grad (1 / beta) y - z‖ ^ (2 : ℕ) ≤
      ‖y - z‖ ^ (2 : ℕ) -
        (2 / beta) * (f (gradientDescentStep grad (1 / beta) y) - f z) := by
  have hh_nonneg : 0 ≤ (1 : ℝ) / beta := by
    positivity
  have hbeta_step : beta * ((1 : ℝ) / beta) ≤ 1 := by
    have hmul : beta * ((1 : ℝ) / beta) = 1 := by
      field_simp [hbeta_pos.ne']
    exact le_of_eq hmul
  have hrec :=
    oneStepRecurrence_of_firstOrderStrongConvexOn
      (C := C) (f := f) (grad := grad) (alpha := (0 : ℝ))
      (beta := beta) (h := (1 : ℝ) / beta) (x := y) (z := z)
      hfirst hsmooth hy hz hstep_mem hh_nonneg hbeta_step
  have hsimp :
      (1 - (0 : ℝ) * ((1 : ℝ) / beta)) * ‖y - z‖ ^ (2 : ℕ) -
          2 * ((1 : ℝ) / beta) *
            (f (gradientDescentStep grad (1 / beta) y) - f z) =
        ‖y - z‖ ^ (2 : ℕ) -
          (2 / beta) * (f (gradientDescentStep grad (1 / beta) y) - f z) := by
    ring
  exact hrec.trans_eq hsimp

/-- Whole-space version of the Theorem 5.10 `(3.3)` reuse. -/
theorem chewi510_oneStepInequality_univ
    {f : E -> ℝ} {grad : E -> E} {beta : ℝ} {y z : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta) :
    ‖gradientDescentStep grad (1 / beta) y - z‖ ^ (2 : ℕ) ≤
      ‖y - z‖ ^ (2 : ℕ) -
        (2 / beta) * (f (gradientDescentStep grad (1 / beta) y) - f z) := by
  exact
    chewi510_oneStepInequality
      (C := Set.univ) (f := f) (grad := grad) (beta := beta)
      (y := y) (z := z) hfirst hsmooth (by simp) (by simp) (by simp)
      hbeta_pos

/-- Scalar rearrangement of the source one-step inequality `(3.3)`. -/
theorem chewi510_gap_le_norm_sq_diff_of_oneStep
    {beta A B gap : ℝ}
    (hstep : B ≤ A - (2 / beta) * gap)
    (hbeta_pos : 0 < beta) :
    gap ≤ (beta / 2) * (A - B) := by
  have hcoef_nonneg : 0 ≤ beta / 2 := by
    positivity
  have hmain : (2 / beta) * gap ≤ A - B := by
    nlinarith
  have hmul := mul_le_mul_of_nonneg_left hmain hcoef_nonneg
  have hcoef :
      (beta / 2) * ((2 / beta) * gap) = gap := by
    field_simp [hbeta_pos.ne']
  nlinarith

/--
Rearranged Chewi Theorem 5.10 one-step estimate:
`f(x⁺)-f(z) ≤ β/2 (‖y-z‖² - ‖x⁺-z‖²)`.
-/
theorem chewi510_gap_le_norm_sq_diff
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {beta : ℝ}
    {y z : E}
    (hfirst : FirstOrderStrongConvexOn C f grad 0)
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hy : y ∈ C)
    (hz : z ∈ C)
    (hstep_mem : gradientDescentStep grad (1 / beta) y ∈ C)
    (hbeta_pos : 0 < beta) :
    f (gradientDescentStep grad (1 / beta) y) - f z ≤
      (beta / 2) *
        (‖y - z‖ ^ (2 : ℕ) -
          ‖gradientDescentStep grad (1 / beta) y - z‖ ^ (2 : ℕ)) := by
  have hone :=
    chewi510_oneStepInequality
      (C := C) (f := f) (grad := grad) (beta := beta) (y := y) (z := z)
      hfirst hsmooth hy hz hstep_mem hbeta_pos
  exact
    chewi510_gap_le_norm_sq_diff_of_oneStep
      (beta := beta)
      (A := ‖y - z‖ ^ (2 : ℕ))
      (B := ‖gradientDescentStep grad (1 / beta) y - z‖ ^ (2 : ℕ))
      (gap := f (gradientDescentStep grad (1 / beta) y) - f z)
      hone hbeta_pos

/-- Whole-space rearranged one-step estimate for Chewi Theorem 5.10. -/
theorem chewi510_gap_le_norm_sq_diff_univ
    {f : E -> ℝ} {grad : E -> E} {beta : ℝ} {y z : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta) :
    f (gradientDescentStep grad (1 / beta) y) - f z ≤
      (beta / 2) *
        (‖y - z‖ ^ (2 : ℕ) -
          ‖gradientDescentStep grad (1 / beta) y - z‖ ^ (2 : ℕ)) := by
  exact
    chewi510_gap_le_norm_sq_diff
      (C := Set.univ) (f := f) (grad := grad) (beta := beta)
      (y := y) (z := z) hfirst hsmooth (by simp) (by simp) (by simp)
      hbeta_pos

end Optimization
end StatInference
