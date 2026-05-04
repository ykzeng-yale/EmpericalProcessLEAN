import StatInference.Optimization.Theorem27
import StatInference.Optimization.Theorem28
import StatInference.Optimization.Theorem33
import StatInference.Optimization.Theorem34
import StatInference.Optimization.Theorem36
import StatInference.Optimization.Theorem37

/-!
# Chewi Optimization Exercises

This module is the single home for exercise formalizations from Sinho Chewi's
Optimization 2026 notes.

The main-text theorem spine stays in the chapter theorem modules.  Exercise
statements and full exercise proofs should be added here as the dedicated
exercise pass grows, or earlier when an exercise statement is needed as a
reusable interface for a main-text theorem.  Main-text formalization remains
the priority; exercises are tracked here so the later complete exercise sweep
does not scatter across the theorem modules.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Auxiliary half of Chewi Exercise 3.1.  For the shifted objective
`z ↦ f z - inner (grad x) z`, the first-order convex lower model says `x` is
a minimizer, while smoothness gives a one-step decrease from `y`.  This yields
one half of the co-coercivity estimate.
-/
theorem exercise31_shifted_gap_lower_half_grad_diff_sq
    {f : E -> ℝ} {grad : E -> E} {beta : ℝ}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta) (x y : E) :
    (1 / (2 * beta)) * ‖grad y - grad x‖ ^ (2 : ℕ) ≤
      f y - f x - inner ℝ (grad x) (y - x) := by
  let g : E := grad y - grad x
  let z : E := y - (1 / beta) • g
  have hlower :
      f x + inner ℝ (grad x) (z - x) ≤ f z := by
    have hmodel := hfirst.lower_model (x := x) (y := z) (by simp) (by simp)
    simpa using hmodel
  have hupper :
      f z ≤ f y + inner ℝ (grad y) (z - y) +
        (beta / 2) * ‖z - y‖ ^ (2 : ℕ) :=
    hsmooth.upper_model (x := y) (y := z) (by simp) (by simp)
  have hz_sub_y : z - y = -(1 / beta) • g := by
    simp [z]
  have hz_sub_x : z - x = y - x - (1 / beta) • g := by
    simp [z]
    abel
  have hnorm :
      ‖z - y‖ ^ (2 : ℕ) =
        (1 / beta) ^ (2 : ℕ) * ‖g‖ ^ (2 : ℕ) := by
    rw [hz_sub_y, norm_smul, Real.norm_eq_abs,
      abs_neg,
      abs_of_nonneg (by positivity : 0 ≤ (1 / beta : ℝ))]
    ring
  have hinner_cancel :
      inner ℝ (grad y) (z - y) +
        (beta / 2) * ‖z - y‖ ^ (2 : ℕ) +
          (1 / beta) * inner ℝ (grad x) g =
        -(1 / (2 * beta)) * ‖g‖ ^ (2 : ℕ) := by
    rw [hnorm, hz_sub_y]
    have hinner :
        inner ℝ (grad y) (-(1 / beta) • g) =
          -(1 / beta) * inner ℝ (grad y) g := by
      simp [real_inner_smul_right]
    rw [hinner]
    have hg_inner :
        inner ℝ g g =
          inner ℝ (grad y) g - inner ℝ (grad x) g := by
      calc
        inner ℝ g g = inner ℝ (grad y - grad x) g := by rfl
        _ = inner ℝ (grad y) g - inner ℝ (grad x) g := by
          rw [inner_sub_left]
    rw [← real_inner_self_eq_norm_sq g, hg_inner]
    field_simp [hbeta_pos.ne']
    ring
  have hmain :
      f x + inner ℝ (grad x) (z - x) ≤
        f y + inner ℝ (grad y) (z - y) +
          (beta / 2) * ‖z - y‖ ^ (2 : ℕ) :=
    hlower.trans hupper
  have hrewrite :
      f x + inner ℝ (grad x) (z - x) =
        f x + inner ℝ (grad x) (y - x) -
          (1 / beta) * inner ℝ (grad x) g := by
    rw [hz_sub_x, inner_sub_right, real_inner_smul_right]
    ring
  rw [hrewrite] at hmain
  have hmain' :
      f x + inner ℝ (grad x) (y - x) ≤
        f y + inner ℝ (grad y) (z - y) +
          (beta / 2) * ‖z - y‖ ^ (2 : ℕ) +
            (1 / beta) * inner ℝ (grad x) g := by
    nlinarith
  nlinarith [hinner_cancel]

/--
Chewi Exercise 3.1 / equation (3.5), whole-space form: convexity plus
`beta`-smoothness implies gradient co-coercivity.
-/
theorem exercise31_gradientCocoerciveOn_univ_of_firstOrderStrongConvexOn_smooth
    {f : E -> ℝ} {grad : E -> E} {beta : ℝ}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta) :
    GradientCocoerciveOn Set.univ grad beta := by
  intro x _hx y _hy
  let g : E := grad y - grad x
  have hxy :=
    exercise31_shifted_gap_lower_half_grad_diff_sq
      hfirst hsmooth hbeta_pos x y
  have hyx :=
    exercise31_shifted_gap_lower_half_grad_diff_sq
      hfirst hsmooth hbeta_pos y x
  have hsum :
      (1 / beta) * ‖g‖ ^ (2 : ℕ) ≤
        inner ℝ g (y - x) := by
    have hleft :
        (1 / (2 * beta)) * ‖grad y - grad x‖ ^ (2 : ℕ) +
          (1 / (2 * beta)) * ‖grad x - grad y‖ ^ (2 : ℕ) =
            (1 / beta) * ‖g‖ ^ (2 : ℕ) := by
      rw [norm_sub_rev]
      simp
      field_simp [hbeta_pos.ne']
      ring
    have hright :
        (f y - f x - inner ℝ (grad x) (y - x)) +
          (f x - f y - inner ℝ (grad y) (x - y)) =
            inner ℝ g (y - x) := by
      have hx_sub_y : x - y = -(y - x) := by
        abel
      rw [hx_sub_y, inner_neg_right]
      simp [g, inner_sub_left]
      ring
    nlinarith [hxy, hyx, hleft, hright]
  have hmul := mul_le_mul_of_nonneg_left hsum hbeta_pos.le
  have hcancel : beta * ((1 / beta) * ‖g‖ ^ (2 : ℕ)) =
      ‖g‖ ^ (2 : ℕ) := by
    field_simp [hbeta_pos.ne']
  have hcomm :
      beta * inner ℝ g (y - x) =
        beta * inner ℝ (grad y - grad x) (y - x) := by
    simp [g]
  rw [hcancel, hcomm] at hmul
  exact hmul

/--
Theorem 3.3 squared-distance contraction with Exercise 3.1 co-coercivity
discharged from whole-space convexity and smoothness.
-/
theorem exercise31_gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_smooth_univ
    {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x y : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (hconvex : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta)
    (hh_nonneg : 0 ≤ h)
    (hstep_size : h ≤ 1 / beta) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ^ (2 : ℕ) ≤
      (1 - alpha * h) * ‖y - x‖ ^ (2 : ℕ) :=
  gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_gradientCocoerciveOn
    hfirst
    (exercise31_gradientCocoerciveOn_univ_of_firstOrderStrongConvexOn_smooth
      hconvex hsmooth hbeta_pos)
    hbeta_pos hh_nonneg hstep_size (by simp) (by simp)

/--
Theorem 3.3 norm contraction with Exercise 3.1 co-coercivity discharged from
whole-space convexity and smoothness.
-/
theorem exercise31_gradientStep_dist_contract_of_firstOrderStrongConvexOn_smooth_univ
    {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x y : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (hconvex : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta)
    (hh_nonneg : 0 ≤ h)
    (hstep_size : h ≤ 1 / beta)
    (hfactor_nonneg : 0 ≤ 1 - alpha * h) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ≤
      Real.sqrt (1 - alpha * h) * ‖y - x‖ :=
  gradientStep_dist_contract_of_firstOrderStrongConvexOn_gradientCocoerciveOn
    hfirst
    (exercise31_gradientCocoerciveOn_univ_of_firstOrderStrongConvexOn_smooth
      hconvex hsmooth hbeta_pos)
    hbeta_pos hh_nonneg hstep_size hfactor_nonneg (by simp) (by simp)

/--
Whole-space Definition 1.5 version of Theorem 3.3 squared-distance
contraction, using Exercise 3.1 to remove the supplied co-coercivity input.
-/
theorem exercise31_gradientStep_sqdist_contract_of_strongConvexOn_univ_hasGradientAt_smooth
    [CompleteSpace E]
    {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x y : E}
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hconvex : StrongConvexOn Set.univ f 0)
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta)
    (hh_nonneg : 0 ≤ h)
    (hstep_size : h ≤ 1 / beta) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ^ (2 : ℕ) ≤
      (1 - alpha * h) * ‖y - x‖ ^ (2 : ℕ) :=
  exercise31_gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_smooth_univ
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hconvex hgrad)
    hsmooth hbeta_pos hh_nonneg hstep_size

/--
Whole-space Definition 1.5 version of Theorem 3.3 norm contraction, using
Exercise 3.1 to remove the supplied co-coercivity input.
-/
theorem exercise31_gradientStep_dist_contract_of_strongConvexOn_univ_hasGradientAt_smooth
    [CompleteSpace E]
    {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x y : E}
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hconvex : StrongConvexOn Set.univ f 0)
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta)
    (hh_nonneg : 0 ≤ h)
    (hstep_size : h ≤ 1 / beta)
    (hfactor_nonneg : 0 ≤ 1 - alpha * h) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ≤
      Real.sqrt (1 - alpha * h) * ‖y - x‖ :=
  exercise31_gradientStep_dist_contract_of_firstOrderStrongConvexOn_smooth_univ
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hconvex hgrad)
    hsmooth hbeta_pos hh_nonneg hstep_size hfactor_nonneg

end Optimization
end StatInference
