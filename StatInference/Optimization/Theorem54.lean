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

/--
Algebraic form of the first Theorem 5.4 descent-sum estimate.
-/
theorem chewi54_gradient_sq_sum_le_two_beta_gap
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
    (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) ≤
      2 * beta * (f (x 0) - fstar) := by
  have hsum :=
    chewi54_gradient_sq_sum_bound_of_competitive_step
      hsmooth hmem hgd_mem hcomp hstar_lower hbeta_pos N
  have hmul :=
    mul_le_mul_of_nonneg_left hsum (by positivity : 0 ≤ 2 * beta)
  have hcancel : (2 * beta) * (1 / (2 * beta)) = 1 := by
    field_simp [hbeta_pos.ne']
  have hleft_eq :
      2 * beta *
          (1 / (2 * beta) *
            (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ))) =
        ∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ) := by
    rw [← mul_assoc, hcancel, one_mul]
  nlinarith

/--
Second displayed estimate in Chewi Theorem 5.4, isolated before the
Cauchy-Schwarz step.  The hypotheses correspond to monotonicity of the
objective gaps and the first-order/orthogonality calculation
`f(x_n)-fstar <= <grad(x_n), x_0-xstar>`.
-/
theorem chewi54_gap_sum_le_inner_gradient_sum
    {f : E -> ℝ} {grad : E -> E} {fstar : ℝ} {x : ℕ -> E}
    {xStar : E} {N : ℕ}
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar)) :
    (N : ℝ) * (f (x N) - fstar) ≤
      inner ℝ (∑ n ∈ Finset.range N, grad (x n)) (x 0 - xStar) := by
  have hsum_gap :
      (∑ n ∈ Finset.range N, (f (x N) - fstar)) ≤
        ∑ n ∈ Finset.range N, (f (x n) - fstar) := by
    exact Finset.sum_le_sum fun n hn =>
      hgap_mono n (Finset.mem_range.mp hn)
  have hsum_inner :
      (∑ n ∈ Finset.range N, (f (x n) - fstar)) ≤
        ∑ n ∈ Finset.range N, inner ℝ (grad (x n)) (x 0 - xStar) := by
    exact Finset.sum_le_sum fun n hn =>
      hfirst_orth n (Finset.mem_range.mp hn)
  have hconst :
      (∑ n ∈ Finset.range N, (f (x N) - fstar)) =
        (N : ℝ) * (f (x N) - fstar) := by
    simp [mul_comm]
    ring
  have hinner :
      (∑ n ∈ Finset.range N, inner ℝ (grad (x n)) (x 0 - xStar)) =
        inner ℝ (∑ n ∈ Finset.range N, grad (x n)) (x 0 - xStar) := by
    rw [sum_inner]
  calc
    (N : ℝ) * (f (x N) - fstar)
        = ∑ n ∈ Finset.range N, (f (x N) - fstar) := hconst.symm
    _ ≤ ∑ n ∈ Finset.range N, (f (x n) - fstar) := hsum_gap
    _ ≤ ∑ n ∈ Finset.range N, inner ℝ (grad (x n)) (x 0 - xStar) := hsum_inner
    _ = inner ℝ (∑ n ∈ Finset.range N, grad (x n)) (x 0 - xStar) := hinner

/--
The Cauchy-Schwarz version of `chewi54_gap_sum_le_inner_gradient_sum`.
-/
theorem chewi54_gap_sum_le_norm_gradient_sum
    {f : E -> ℝ} {grad : E -> E} {fstar : ℝ} {x : ℕ -> E}
    {xStar : E} {N : ℕ}
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar)) :
    (N : ℝ) * (f (x N) - fstar) ≤
      ‖∑ n ∈ Finset.range N, grad (x n)‖ * ‖x 0 - xStar‖ := by
  exact (chewi54_gap_sum_le_inner_gradient_sum hgap_mono hfirst_orth).trans
    (real_inner_le_norm
      (∑ n ∈ Finset.range N, grad (x n)) (x 0 - xStar))

/--
Finite Pythagoras identity for pairwise orthogonal gradients over
`Finset.range N`.
-/
theorem norm_sq_sum_range_eq_sum_norm_sq_of_pairwise_orthogonal
    (g : ℕ -> E) (N : ℕ)
    (horth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (g i) (g j) = 0) :
    ‖∑ n ∈ Finset.range N, g n‖ ^ (2 : ℕ) =
      ∑ n ∈ Finset.range N, ‖g n‖ ^ (2 : ℕ) := by
  rw [← real_inner_self_eq_norm_sq]
  rw [sum_inner]
  simp_rw [inner_sum]
  refine Finset.sum_congr rfl ?_
  intro i hi
  have hi_lt : i < N := Finset.mem_range.mp hi
  calc
    (∑ x ∈ Finset.range N, inner ℝ (g i) (g x))
        = inner ℝ (g i) (g i) := by
            refine Finset.sum_eq_single i ?_ ?_
            · intro j hj hji
              exact horth i j hi_lt (Finset.mem_range.mp hj) hji.symm
            · intro hi_not
              exact (hi_not hi).elim
    _ = ‖g i‖ ^ (2 : ℕ) := by
            simp

/--
Norm form of the finite Pythagoras identity for pairwise orthogonal gradients.
-/
theorem norm_sum_range_le_sqrt_sum_norm_sq_of_pairwise_orthogonal
    (g : ℕ -> E) (N : ℕ)
    (horth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (g i) (g j) = 0) :
    ‖∑ n ∈ Finset.range N, g n‖ ≤
      Real.sqrt (∑ n ∈ Finset.range N, ‖g n‖ ^ (2 : ℕ)) := by
  have hsq :=
    norm_sq_sum_range_eq_sum_norm_sq_of_pairwise_orthogonal g N horth
  exact Real.le_sqrt_of_sq_le (by
    rw [hsq])

/--
The Cauchy-Schwarz plus gradient-orthogonality estimate in Chewi Theorem 5.4.
-/
theorem chewi54_gap_sum_le_sqrt_sum_norm_sq_mul_dist
    {f : E -> ℝ} {grad : E -> E} {fstar : ℝ} {x : ℕ -> E}
    {xStar : E} {N : ℕ}
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar))
    (hgrad_orth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (grad (x i)) (grad (x j)) = 0) :
    (N : ℝ) * (f (x N) - fstar) ≤
      Real.sqrt (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) *
        ‖x 0 - xStar‖ := by
  have hnorm :
      ‖∑ n ∈ Finset.range N, grad (x n)‖ ≤
        Real.sqrt (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) :=
    norm_sum_range_le_sqrt_sum_norm_sq_of_pairwise_orthogonal
      (fun n => grad (x n)) N hgrad_orth
  calc
    (N : ℝ) * (f (x N) - fstar)
        ≤ ‖∑ n ∈ Finset.range N, grad (x n)‖ * ‖x 0 - xStar‖ :=
          chewi54_gap_sum_le_norm_gradient_sum hgap_mono hfirst_orth
    _ ≤ Real.sqrt (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) *
          ‖x 0 - xStar‖ :=
          mul_le_mul_of_nonneg_right hnorm (norm_nonneg _)

/--
Pre-halving assembly for Chewi Theorem 5.4: combine the
orthogonality/Cauchy-Schwarz estimate with supplied sum and radius bounds.
-/
theorem chewi54_gap_sum_le_sqrt_product_bound
    {f : E -> ℝ} {grad : E -> E} {fstar alpha beta initialGap : ℝ}
    {x : ℕ -> E} {xStar : E} {N : ℕ}
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar))
    (hgrad_orth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (grad (x i)) (grad (x j)) = 0)
    (hsum_bound :
      (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) ≤
        2 * beta * initialGap)
    (hdist_bound : ‖x 0 - xStar‖ ≤ Real.sqrt (2 * initialGap / alpha)) :
    (N : ℝ) * (f (x N) - fstar) ≤
      Real.sqrt (2 * beta * initialGap) *
        Real.sqrt (2 * initialGap / alpha) := by
  have hmain :
      (N : ℝ) * (f (x N) - fstar) ≤
        Real.sqrt (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) *
          ‖x 0 - xStar‖ :=
    chewi54_gap_sum_le_sqrt_sum_norm_sq_mul_dist
      hgap_mono hfirst_orth hgrad_orth
  have hsqrt_sum :
      Real.sqrt (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) ≤
        Real.sqrt (2 * beta * initialGap) :=
    Real.sqrt_le_sqrt hsum_bound
  have hstep1 :
      Real.sqrt (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) *
          ‖x 0 - xStar‖ ≤
        Real.sqrt (2 * beta * initialGap) * ‖x 0 - xStar‖ :=
    mul_le_mul_of_nonneg_right hsqrt_sum (norm_nonneg _)
  have hstep2 :
      Real.sqrt (2 * beta * initialGap) * ‖x 0 - xStar‖ ≤
        Real.sqrt (2 * beta * initialGap) *
          Real.sqrt (2 * initialGap / alpha) :=
      mul_le_mul_of_nonneg_left hdist_bound (Real.sqrt_nonneg _)
  exact hmain.trans (hstep1.trans hstep2)

/--
Pre-halving Theorem 5.4 bound with the descent-sum estimate instantiated from
the competitive CG step.
-/
theorem chewi54_gap_sum_le_sqrt_product_bound_of_competitive_step
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {fstar alpha beta : ℝ}
    {x : ℕ -> E} {xStar : E} {N : ℕ}
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hmem : ∀ n, x n ∈ C)
    (hgd_mem : ∀ n, gradientDescentStep grad (1 / beta) (x n) ∈ C)
    (hcomp : ∀ n,
      f (x (n + 1)) ≤ f (gradientDescentStep grad (1 / beta) (x n)))
    (hstar_lower : ∀ n, fstar ≤ f (x n))
    (hbeta_pos : 0 < beta)
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar))
    (hgrad_orth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (grad (x i)) (grad (x j)) = 0)
    (hdist_bound :
      ‖x 0 - xStar‖ ≤ Real.sqrt (2 * (f (x 0) - fstar) / alpha)) :
    (N : ℝ) * (f (x N) - fstar) ≤
      Real.sqrt (2 * beta * (f (x 0) - fstar)) *
        Real.sqrt (2 * (f (x 0) - fstar) / alpha) := by
  have hsum_bound :
      (∑ n ∈ Finset.range N, ‖grad (x n)‖ ^ (2 : ℕ)) ≤
        2 * beta * (f (x 0) - fstar) :=
    chewi54_gradient_sq_sum_le_two_beta_gap
      hsmooth hmem hgd_mem hcomp hstar_lower hbeta_pos N
  exact chewi54_gap_sum_le_sqrt_product_bound
    hgap_mono hfirst_orth hgrad_orth hsum_bound hdist_bound

/--
Strong-convexity radius estimate used in Chewi Theorem 5.4:
`||x_0 - x_*|| <= sqrt (2 (f x_0 - f_*) / alpha)`.
-/
theorem chewi54_dist_initial_le_sqrt_gap_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {alpha fstar : ℝ} {x0 xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hx0 : x0 ∈ C)
    (hxStar : xStar ∈ C)
    (hgrad_zero : grad xStar = 0)
    (hfstar : fstar = f xStar)
    (halpha_pos : 0 < alpha) :
    ‖x0 - xStar‖ ≤ Real.sqrt (2 * (f x0 - fstar) / alpha) := by
  have hmodel := hfirst.lower_model hxStar hx0
  rw [hgrad_zero] at hmodel
  simp at hmodel
  have hsq :
      ‖x0 - xStar‖ ^ (2 : ℕ) ≤ 2 * (f x0 - f xStar) / alpha := by
    have hmul :
        alpha * ‖x0 - xStar‖ ^ (2 : ℕ) ≤ 2 * (f x0 - f xStar) := by
      nlinarith
    exact (le_div_iff₀ halpha_pos).mpr (by
      simpa [mul_comm] using hmul)
  simpa [hfstar] using Real.le_sqrt_of_sq_le hsq

/--
Pre-halving Theorem 5.4 bound with both the descent sum and the strong
convexity radius estimate instantiated.
-/
theorem chewi54_gap_sum_le_sqrt_product_bound_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {fstar alpha beta : ℝ} {x : ℕ -> E} {xStar : E} {N : ℕ}
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hmem : ∀ n, x n ∈ C)
    (hxStar : xStar ∈ C)
    (hgrad_zero : grad xStar = 0)
    (hfstar : fstar = f xStar)
    (hgd_mem : ∀ n, gradientDescentStep grad (1 / beta) (x n) ∈ C)
    (hcomp : ∀ n,
      f (x (n + 1)) ≤ f (gradientDescentStep grad (1 / beta) (x n)))
    (hstar_lower : ∀ n, fstar ≤ f (x n))
    (hbeta_pos : 0 < beta)
    (halpha_pos : 0 < alpha)
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar))
    (hgrad_orth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (grad (x i)) (grad (x j)) = 0) :
    (N : ℝ) * (f (x N) - fstar) ≤
      Real.sqrt (2 * beta * (f (x 0) - fstar)) *
        Real.sqrt (2 * (f (x 0) - fstar) / alpha) := by
  have hdist :
      ‖x 0 - xStar‖ ≤ Real.sqrt (2 * (f (x 0) - fstar) / alpha) :=
    chewi54_dist_initial_le_sqrt_gap_of_firstOrderStrongConvexOn
      hfirst (hmem 0) hxStar hgrad_zero hfstar halpha_pos
  exact chewi54_gap_sum_le_sqrt_product_bound_of_competitive_step
    hsmooth hmem hgd_mem hcomp hstar_lower hbeta_pos
    hgap_mono hfirst_orth hgrad_orth hdist

/--
Scalar simplification of the pre-halving Theorem 5.4 product bound.
-/
theorem chewi54_sqrt_product_bound_le_conditioned_gap
    {alpha beta initialGap : ℝ}
    (halpha_pos : 0 < alpha)
    (hbeta_nonneg : 0 ≤ beta)
    (hgap_nonneg : 0 ≤ initialGap) :
    Real.sqrt (2 * beta * initialGap) *
        Real.sqrt (2 * initialGap / alpha) ≤
      2 * Real.sqrt (beta / alpha) * initialGap := by
  have hA : 0 ≤ 2 * beta * initialGap := by nlinarith
  have hB : 0 ≤ 2 * initialGap / alpha := by
    exact div_nonneg (by nlinarith) halpha_pos.le
  have hkappa_nonneg : 0 ≤ beta / alpha :=
    div_nonneg hbeta_nonneg halpha_pos.le
  have hleft_nonneg :
      0 ≤ Real.sqrt (2 * beta * initialGap) *
        Real.sqrt (2 * initialGap / alpha) :=
    mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
  have hright_nonneg :
      0 ≤ 2 * Real.sqrt (beta / alpha) * initialGap := by
    positivity
  rw [← sq_le_sq₀ hleft_nonneg hright_nonneg]
  have hleft_sq :
      (Real.sqrt (2 * beta * initialGap) *
          Real.sqrt (2 * initialGap / alpha)) ^ (2 : ℕ) =
        (2 * beta * initialGap) * (2 * initialGap / alpha) := by
    rw [mul_pow, Real.sq_sqrt hA, Real.sq_sqrt hB]
  have hright_sq :
      (2 * Real.sqrt (beta / alpha) * initialGap) ^ (2 : ℕ) =
        4 * (beta / alpha) * initialGap ^ (2 : ℕ) := by
    rw [mul_pow, mul_pow, Real.sq_sqrt hkappa_nonneg]
    ring
  rw [hleft_sq, hright_sq]
  field_simp [halpha_pos.ne']
  ring_nf
  exact le_rfl

/--
Clean pre-halving Theorem 5.4 estimate:
`N (f x_N - f_*) <= 2 sqrt(beta / alpha) (f x_0 - f_*)`.
-/
theorem chewi54_gap_sum_le_two_sqrt_condition_mul_gap_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {fstar alpha beta : ℝ} {x : ℕ -> E} {xStar : E} {N : ℕ}
    (hsmooth : SmoothWithGradientOn C f grad beta)
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hmem : ∀ n, x n ∈ C)
    (hxStar : xStar ∈ C)
    (hgrad_zero : grad xStar = 0)
    (hfstar : fstar = f xStar)
    (hgd_mem : ∀ n, gradientDescentStep grad (1 / beta) (x n) ∈ C)
    (hcomp : ∀ n,
      f (x (n + 1)) ≤ f (gradientDescentStep grad (1 / beta) (x n)))
    (hstar_lower : ∀ n, fstar ≤ f (x n))
    (hbeta_pos : 0 < beta)
    (halpha_pos : 0 < alpha)
    (hgap_mono : ∀ n, n < N →
      f (x N) - fstar ≤ f (x n) - fstar)
    (hfirst_orth : ∀ n, n < N →
      f (x n) - fstar ≤ inner ℝ (grad (x n)) (x 0 - xStar))
    (hgrad_orth : ∀ i j, i < N → j < N → i ≠ j →
      inner ℝ (grad (x i)) (grad (x j)) = 0) :
    (N : ℝ) * (f (x N) - fstar) ≤
      2 * Real.sqrt (beta / alpha) * (f (x 0) - fstar) := by
  have hproduct :=
    chewi54_gap_sum_le_sqrt_product_bound_of_firstOrderStrongConvexOn
      hsmooth hfirst hmem hxStar hgrad_zero hfstar hgd_mem hcomp
      hstar_lower hbeta_pos halpha_pos hgap_mono hfirst_orth hgrad_orth
  have hgap_nonneg : 0 ≤ f (x 0) - fstar := sub_nonneg.mpr (hstar_lower 0)
  exact hproduct.trans
    (chewi54_sqrt_product_bound_le_conditioned_gap
      halpha_pos hbeta_pos.le hgap_nonneg)

/--
Halving contrapositive algebra in Chewi Theorem 5.4.  If the accelerated
bound holds and the final gap has not dropped below half the initial gap, then
the iteration count is at most `4 * sqrt (beta / alpha)`.
-/
theorem chewi54_iteration_le_four_sqrt_condition_of_not_halved
    {alpha beta gap0 gapN : ℝ} {N : ℕ}
    (hN_bound : (N : ℝ) * gapN ≤
      2 * Real.sqrt (beta / alpha) * gap0)
    (hnot_halved : gap0 / 2 ≤ gapN)
    (hgap0_pos : 0 < gap0)
    (halpha_pos : 0 < alpha)
    (hbeta_nonneg : 0 ≤ beta) :
    (N : ℝ) ≤ 4 * Real.sqrt (beta / alpha) := by
  have hkappa_nonneg : 0 ≤ beta / alpha :=
    div_nonneg hbeta_nonneg halpha_pos.le
  have hsqrt_nonneg : 0 ≤ Real.sqrt (beta / alpha) :=
    Real.sqrt_nonneg _
  have hgap_half_pos : 0 < gap0 / 2 := by nlinarith
  have hN_half : (N : ℝ) * (gap0 / 2) ≤ (N : ℝ) * gapN :=
    mul_le_mul_of_nonneg_left hnot_halved (Nat.cast_nonneg N)
  have hcombined :
      (N : ℝ) * (gap0 / 2) ≤
        2 * Real.sqrt (beta / alpha) * gap0 :=
    hN_half.trans hN_bound
  have hdiv :=
    (le_div_iff₀ hgap_half_pos).mpr hcombined
  have hratio :
      (2 * Real.sqrt (beta / alpha) * gap0) / (gap0 / 2) =
        4 * Real.sqrt (beta / alpha) := by
    field_simp [hgap0_pos.ne']
    ring
  simpa [hratio] using hdiv

end Optimization
end StatInference
