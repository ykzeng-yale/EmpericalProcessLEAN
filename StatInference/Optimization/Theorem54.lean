import StatInference.Optimization.ConjugateGradient
import StatInference.Optimization.Theorem37

/-!
# Chewi Theorem 5.4 conjugate-gradient rate layer

This module starts the accelerated-convergence proof for Chapter 5.  The first
layer isolates the source descent comparison: a CG step that is no worse than
the `1 / beta` gradient step inherits the descent-lemma squared-gradient sum
bound.
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
First displayed bound in Chewi Theorem 5.4.  If each CG step is competitive
with the gradient-descent trial step `x_n - beta^{-1} ∇f(x_n)`, then the
descent lemma telescopes to the finite squared-gradient sum bound.
-/
theorem chewi54_gradient_sq_sum_bound_of_competitive_step
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {beta fstar : ℝ} {x : ℕ -> E}
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hmem : ∀ n, x n ∈ C)
    (hgd_mem : ∀ n, gradientDescentStep grad (1 / beta) (x n) ∈ C)
    (hcomp : ∀ n,
      f (x (n + 1)) ≤ f (gradientDescentStep grad (1 / beta) (x n)))
    (hstar_lower : ∀ n, fstar ≤ f (x n))
    (hbeta_pos : 0 < beta)
    (N : ℕ) :
    (1 / (2 * beta)) *
        (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) ≤
      f (x 0) - fstar := by
  have hbeta_ne : beta ≠ 0 := hbeta_pos.ne'
  have hcoef_eq : 1 / beta / 2 = 1 / (2 * beta) := by
    field_simp [hbeta_ne]
  have hstep : ∀ n,
      (1 / beta / 2) * ‖grad (x n)‖ ^ (2 : ℕ) ≤
        f (x n) - f (x (n + 1)) := by
    intro n
    have hgd_drop :
        (1 / beta / 2) * ‖grad (x n)‖ ^ (2 : ℕ) ≤
          f (x n) - f (gradientDescentStep grad (1 / beta) (x n)) := by
      have hbeta_step : beta * (1 / beta) ≤ 1 := by
        field_simp [hbeta_ne]
        rfl
      exact gradient_sq_step_le_drop_of_smoothWithGradientOn
        hsmooth (hmem n) (hgd_mem n) (by positivity) hbeta_step
    have htrial_to_cg :
        f (x n) - f (gradientDescentStep grad (1 / beta) (x n)) ≤
          f (x n) - f (x (n + 1)) := by
      nlinarith [hcomp n]
    exact hgd_drop.trans htrial_to_cg
  have hsum :
      (∑ n ∈ Finset.range N,
          (1 / beta / 2) * ‖grad (x n)‖ ^ (2 : ℕ)) ≤
        ∑ n ∈ Finset.range N, (f (x n) - f (x (n + 1))) :=
    Finset.sum_le_sum fun n _hn => hstep n
  have hleft :
      (1 / beta / 2) *
          (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) ≤
        ∑ n ∈ Finset.range N, (f (x n) - f (x (n + 1))) := by
    simpa [Finset.mul_sum] using hsum
  have htelescope :
      (∑ n ∈ Finset.range N, (f (x n) - f (x (n + 1)))) =
        f (x 0) - f (x N) := by
    simpa using sum_range_sub_succ (fun n => f (x n)) N
  calc
    (1 / (2 * beta)) *
        (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ))
        = (1 / beta / 2) *
            (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) := by
            rw [hcoef_eq]
    _ ≤ ∑ n ∈ Finset.range N, (f (x n) - f (x (n + 1))) := hleft
    _ = f (x 0) - f (x N) := htelescope
    _ ≤ f (x 0) - fstar := by
        nlinarith [hstar_lower N]

end Optimization
end StatInference
