import StatInference.Optimization.AppendixA

/-!
# Chewi Theorem 13.1, Local Quadratic Newton Recurrence

This module assembles the source recurrence step in Chewi Theorem 13.1 from
the Appendix A matrix perturbation and inverse-Hessian bounds.  The remaining
input is the Taylor/integral Newton remainder estimate from the theorem proof.
-/

open Matrix
open scoped MatrixOrder Matrix.Norms.L2Operator

namespace StatInference
namespace Optimization

variable {n : Type*} [Fintype n] [DecidableEq n]

/--
Chewi Theorem 13.1, one-step local quadratic recurrence from the Taylor
remainder estimate.  The hypotheses encode the source assumptions
`nabla^2 f(x_star) >= alpha I`, Lipschitz Hessian with constant `gamma`, and
the current radius condition.  The Taylor/integral estimate is supplied in the
exact norm shape immediately preceding the Hessian inverse bound in the
textbook proof.
-/
theorem chewi131_local_quadratic_step_of_taylor_bound
    {Hstar H : Matrix n n ℝ} (hHstar : Hstar.IsHermitian)
    (hH : H.IsHermitian) {alpha gamma : ℝ} (halpha : 0 < alpha)
    (hgamma : 0 < gamma)
    {x xNext xStar : EuclideanSpace ℝ n}
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ‖H - Hstar‖ ≤ gamma * ‖x - xStar‖)
    (hradius : ‖x - xStar‖ ≤ alpha / (2 * gamma))
    (htaylor :
      ‖xNext - xStar‖ ≤
        (gamma / 2) * ‖H⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ)) :
    ‖xNext - xStar‖ ≤
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
  have hgr_nonneg : 0 ≤ gamma * ‖x - xStar‖ :=
    mul_nonneg (le_of_lt hgamma) (norm_nonneg _)
  have hmul_radius :
      gamma * ‖x - xStar‖ ≤ gamma * (alpha / (2 * gamma)) :=
    mul_le_mul_of_nonneg_left hradius (le_of_lt hgamma)
  have hhalf : gamma * ‖x - xStar‖ ≤ alpha / 2 := by
    have hscalar : gamma * (alpha / (2 * gamma)) = alpha / 2 := by
      field_simp [hgamma.ne']
    simpa [hscalar] using hmul_radius
  have hlower_half :
      (alpha / 2) • (1 : Matrix n n ℝ) ≤ H :=
    chewi131_hessian_lower_half_of_lipschitz_opNorm hHstar hH hgr_nonneg
      hlower hclose hhalf
  have hinv :
      ‖H⁻¹‖ ≤ 2 / alpha :=
    chewi131_inverse_l2_opNorm_le_two_div_alpha_of_hessian_lower_half hH
      halpha hlower_half
  have hcoef : (gamma / 2) * ‖H⁻¹‖ ≤ gamma / alpha := by
    calc
      (gamma / 2) * ‖H⁻¹‖ ≤ (gamma / 2) * (2 / alpha) := by
        exact mul_le_mul_of_nonneg_left hinv (by positivity)
      _ = gamma / alpha := by
        field_simp [halpha.ne']
  calc
    ‖xNext - xStar‖
        ≤ (gamma / 2) * ‖H⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ) := htaylor
    _ ≤ (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) := by
      exact mul_le_mul_of_nonneg_right hcoef (sq_nonneg _)

/--
Chewi Theorem 13.1, the one-step recurrence also gives the displayed
half-contraction while the current iterate remains in the local radius.
-/
theorem chewi131_local_quadratic_step_and_half_of_taylor_bound
    {Hstar H : Matrix n n ℝ} (hHstar : Hstar.IsHermitian)
    (hH : H.IsHermitian) {alpha gamma : ℝ} (halpha : 0 < alpha)
    (hgamma : 0 < gamma)
    {x xNext xStar : EuclideanSpace ℝ n}
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ‖H - Hstar‖ ≤ gamma * ‖x - xStar‖)
    (hradius : ‖x - xStar‖ ≤ alpha / (2 * gamma))
    (htaylor :
      ‖xNext - xStar‖ ≤
        (gamma / 2) * ‖H⁻¹‖ * ‖x - xStar‖ ^ (2 : ℕ)) :
    ‖xNext - xStar‖ ≤
        (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) ∧
      ‖xNext - xStar‖ ≤ (1 / 2) * ‖x - xStar‖ := by
  have hquad :
      ‖xNext - xStar‖ ≤
        (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) :=
    chewi131_local_quadratic_step_of_taylor_bound hHstar hH halpha hgamma
      hlower hclose hradius htaylor
  have hmul_radius :
      gamma * ‖x - xStar‖ ≤ gamma * (alpha / (2 * gamma)) :=
    mul_le_mul_of_nonneg_left hradius (le_of_lt hgamma)
  have hhalf_radius : gamma * ‖x - xStar‖ ≤ alpha / 2 := by
    have hscalar : gamma * (alpha / (2 * gamma)) = alpha / 2 := by
      field_simp [hgamma.ne']
    simpa [hscalar] using hmul_radius
  have hcoeff : (gamma / alpha) * ‖x - xStar‖ ≤ 1 / 2 := by
    have hdiv :
        (gamma * ‖x - xStar‖) / alpha ≤ (alpha / 2) / alpha :=
      div_le_div_of_nonneg_right hhalf_radius (le_of_lt halpha)
    calc
      (gamma / alpha) * ‖x - xStar‖ = (gamma * ‖x - xStar‖) / alpha := by
        ring
      _ ≤ (alpha / 2) / alpha := hdiv
      _ = 1 / 2 := by
        field_simp [halpha.ne']
  have hhalf_quad :
      (gamma / alpha) * ‖x - xStar‖ ^ (2 : ℕ) ≤
        (1 / 2) * ‖x - xStar‖ := by
    have hmul :=
      mul_le_mul_of_nonneg_right hcoeff (norm_nonneg (x - xStar))
    simpa [pow_two, mul_assoc, mul_comm, mul_left_comm] using hmul
  exact ⟨hquad, hquad.trans hhalf_quad⟩

/--
Chewi Theorem 13.1, sequence form of the local quadratic and half-contraction
display.  The induction keeps every iterate inside the local radius
`alpha / (2 * gamma)`, so the one-step theorem can be reused at each time.
-/
theorem chewi131_local_quadratic_recurrence_of_taylor_bound
    {Hstar : Matrix n n ℝ} {H : ℕ -> Matrix n n ℝ}
    (hHstar : Hstar.IsHermitian) (hH : ∀ k, (H k).IsHermitian)
    {alpha gamma : ℝ} (halpha : 0 < alpha) (hgamma : 0 < gamma)
    {x : ℕ -> EuclideanSpace ℝ n} {xStar : EuclideanSpace ℝ n}
    (hlower : alpha • (1 : Matrix n n ℝ) ≤ Hstar)
    (hclose : ∀ k, ‖H k - Hstar‖ ≤ gamma * ‖x k - xStar‖)
    (htaylor : ∀ k,
      ‖x (k + 1) - xStar‖ ≤
        (gamma / 2) * ‖(H k)⁻¹‖ * ‖x k - xStar‖ ^ (2 : ℕ))
    (hinit : ‖x 0 - xStar‖ ≤ alpha / (2 * gamma)) :
    ∀ k,
      ‖x (k + 1) - xStar‖ ≤
          (gamma / alpha) * ‖x k - xStar‖ ^ (2 : ℕ) ∧
        ‖x (k + 1) - xStar‖ ≤ (1 / 2) * ‖x k - xStar‖ := by
  have hradius : ∀ k, ‖x k - xStar‖ ≤ alpha / (2 * gamma) := by
    intro k
    induction k with
    | zero => exact hinit
    | succ k ih =>
        have hstep :=
          chewi131_local_quadratic_step_and_half_of_taylor_bound hHstar
            (hH k) halpha hgamma hlower (hclose k) ih (htaylor k)
        have hshrink :
            (1 / 2) * ‖x k - xStar‖ ≤ ‖x k - xStar‖ := by
          nlinarith [norm_nonneg (x k - xStar)]
        exact hstep.2.trans (hshrink.trans ih)
  intro k
  exact
    chewi131_local_quadratic_step_and_half_of_taylor_bound hHstar (hH k)
      halpha hgamma hlower (hclose k) (hradius k) (htaylor k)

end Optimization
end StatInference
