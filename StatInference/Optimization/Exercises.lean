import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Analysis.SpecificLimits.Basic
import StatInference.Optimization.Theorem27
import StatInference.Optimization.Theorem28
import StatInference.Optimization.Theorem33
import StatInference.Optimization.Theorem34
import StatInference.Optimization.Theorem36
import StatInference.Optimization.Theorem37
import StatInference.Optimization.Theorem45

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
open scoped InnerProductSpace ENNReal

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
    (halpha_nonneg : 0 ≤ alpha)
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta)
    (hbeta_pos : 0 < beta)
    (hh_nonneg : 0 ≤ h)
    (hstep_size : h ≤ 1 / beta) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ^ (2 : ℕ) ≤
      (1 - alpha * h) * ‖y - x‖ ^ (2 : ℕ) :=
  gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_gradientCocoerciveOn
    hfirst
    (exercise31_gradientCocoerciveOn_univ_of_firstOrderStrongConvexOn_smooth
      (FirstOrderStrongConvexOn.convex hfirst halpha_nonneg) hsmooth hbeta_pos)
    hbeta_pos hh_nonneg hstep_size (by simp) (by simp)

/--
Theorem 3.3 norm contraction with Exercise 3.1 co-coercivity discharged from
whole-space convexity and smoothness.
-/
theorem exercise31_gradientStep_dist_contract_of_firstOrderStrongConvexOn_smooth_univ
    {f : E -> ℝ} {grad : E -> E}
    {alpha beta h : ℝ} {x y : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (halpha_nonneg : 0 ≤ alpha)
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
      (FirstOrderStrongConvexOn.convex hfirst halpha_nonneg) hsmooth hbeta_pos)
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
    (halpha_nonneg : 0 ≤ alpha)
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
    halpha_nonneg
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
    (halpha_nonneg : 0 ≤ alpha)
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
    halpha_nonneg
    hsmooth hbeta_pos hh_nonneg hstep_size hfactor_nonneg

/--
Chewi Exercise 4.2 infinite-chain substrate: the squared `L^2` term of a
nonnegative geometric profile is the geometric series with ratio `q^2`.
-/
theorem exercise42_geometric_l2_term_eq {q : ℝ} (hq_nonneg : 0 ≤ q) (n : ℕ) :
    ‖q ^ n‖ ^ (2 : ℝ≥0∞).toReal = (q ^ (2 : ℕ)) ^ n := by
  have hpow_nonneg : 0 ≤ q ^ n := pow_nonneg hq_nonneg n
  rw [Real.norm_of_nonneg hpow_nonneg]
  norm_num [Real.rpow_natCast]
  rw [← pow_mul, ← pow_mul]
  ring

/--
Chewi Exercise 4.2 infinite-chain substrate: the pure geometric profile
`n ↦ q^n` belongs to `ell^2` whenever `0 <= q < 1`.
-/
theorem exercise42_geometric_memℓp_two {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) :
    Memℓp (fun n : ℕ => q ^ n) (2 : ℝ≥0∞) := by
  apply memℓp_gen
  have hq_sq_nonneg : 0 ≤ q ^ (2 : ℕ) := sq_nonneg q
  have hq_sq_lt_one : q ^ (2 : ℕ) < 1 := by
    have hq_sq_le_q : q ^ (2 : ℕ) ≤ q := by
      rw [pow_two]
      exact mul_le_of_le_one_right hq_nonneg hq_lt_one.le
    exact lt_of_le_of_lt hq_sq_le_q hq_lt_one
  have hsum : Summable fun n : ℕ => (q ^ (2 : ℕ)) ^ n :=
    summable_geometric_of_lt_one hq_sq_nonneg hq_sq_lt_one
  convert hsum using 1
  ext n
  exact exercise42_geometric_l2_term_eq hq_nonneg n

/-- The pure geometric profile as an element of `ell^2`. -/
noncomputable def exercise42InfiniteGeometric (q : ℝ)
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) :
    lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) :=
  ⟨fun n => q ^ n, exercise42_geometric_memℓp_two hq_nonneg hq_lt_one⟩

@[simp]
theorem exercise42InfiniteGeometric_apply {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (n : ℕ) :
    exercise42InfiniteGeometric q hq_nonneg hq_lt_one n = q ^ n :=
  rfl

/--
Exact infinite geometric identity from Chewi Exercise 4.2: the squared
`ell^2` norm of the pure geometric profile is `(1 - q^2)^{-1}`.
-/
theorem exercise42InfiniteGeometric_norm_sq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) :
    ‖exercise42InfiniteGeometric q hq_nonneg hq_lt_one‖ ^ (2 : ℕ) =
      (1 - q ^ (2 : ℕ))⁻¹ := by
  let z := exercise42InfiniteGeometric q hq_nonneg hq_lt_one
  have hp : 0 < (2 : ℝ≥0∞).toReal := by norm_num
  have hnorm :
      ‖z‖ ^ (2 : ℝ≥0∞).toReal =
        ∑' n : ℕ, ‖z n‖ ^ (2 : ℝ≥0∞).toReal :=
    lp.norm_rpow_eq_tsum (E := fun _ : ℕ => ℝ)
      (p := (2 : ℝ≥0∞)) hp z
  have hq_sq_nonneg : 0 ≤ q ^ (2 : ℕ) := sq_nonneg q
  have hq_sq_lt_one : q ^ (2 : ℕ) < 1 := by
    have hq_sq_le_q : q ^ (2 : ℕ) ≤ q := by
      rw [pow_two]
      exact mul_le_of_le_one_right hq_nonneg hq_lt_one.le
    exact lt_of_le_of_lt hq_sq_le_q hq_lt_one
  have htsum :
      (∑' n : ℕ, ‖z n‖ ^ (2 : ℝ≥0∞).toReal) =
        (1 - q ^ (2 : ℕ))⁻¹ := by
    have hgeom :
        (∑' n : ℕ, (q ^ (2 : ℕ)) ^ n) =
          (1 - q ^ (2 : ℕ))⁻¹ :=
      tsum_geometric_of_lt_one hq_sq_nonneg hq_sq_lt_one
    rw [← hgeom]
    apply tsum_congr
    intro n
    simpa [z] using exercise42_geometric_l2_term_eq hq_nonneg n
  have hleft :
      ‖z‖ ^ (2 : ℕ) = ‖z‖ ^ (2 : ℝ≥0∞).toReal := by
    norm_num [Real.rpow_natCast]
  rw [hleft, hnorm, htsum]

/-- Infinite coordinate-tail energy for the `ell^2` Exercise 4.2 model. -/
noncomputable def exercise42InfiniteTailSq
    (z : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (N : ℕ) : ℝ :=
  ∑' n : ℕ, ‖z (N + n)‖ ^ (2 : ℝ≥0∞).toReal

/-- Infinite prefix-support condition: all coordinates from `N` onward vanish. -/
def exercise42InfinitePrefixSupported
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (N : ℕ) : Prop :=
  ∀ i : ℕ, N ≤ i -> x i = 0

/-- Infinite prefix-support subspace used for Exercise 4.2 gradient-span runs. -/
def exercise42InfinitePrefixSubmodule (N : ℕ) :
    Submodule ℝ (lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) where
  carrier := {x | exercise42InfinitePrefixSupported x N}
  zero_mem' := by
    intro i hi
    rfl
  add_mem' := by
    intro x y hx hy i hi
    change (x + y) i = 0
    rw [show (x + y) i = x i + y i by rfl, hx i hi, hy i hi]
    ring
  smul_mem' := by
    intro a x hx i hi
    change (a • x) i = 0
    rw [show (a • x) i = a * x i by rfl, hx i hi]
    ring

/-- Membership in the infinite prefix subspace is coordinate vanishing. -/
theorem mem_exercise42InfinitePrefixSubmodule_iff
    {x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ} :
    x ∈ exercise42InfinitePrefixSubmodule N ↔
      exercise42InfinitePrefixSupported x N :=
  Iff.rfl

/-- The infinite prefix subspaces are monotone in the prefix length. -/
theorem exercise42InfinitePrefixSubmodule_mono {M N : ℕ} (hMN : M ≤ N) :
    exercise42InfinitePrefixSubmodule M ≤
      exercise42InfinitePrefixSubmodule N := by
  intro x hx i hi
  exact hx i (hMN.trans hi)

/--
If all queried gradients through time `n` lie in the next infinite prefix
subspace, then their gradient span also lies there.
-/
theorem gradientSpanSubmodule_le_exercise42InfinitePrefixSubmodule
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {n : ℕ}
    (hgrad : ∀ ⦃k : ℕ⦄, k ≤ n ->
      grad (x k) ∈ exercise42InfinitePrefixSubmodule (n + 1)) :
    gradientSpanSubmodule grad x n ≤
      exercise42InfinitePrefixSubmodule (n + 1) := by
  refine Submodule.span_le.mpr ?_
  rintro v ⟨k, hk, rfl⟩
  exact hgrad hk

/--
Infinite Exercise 4.2 gradient-span support induction: if the oracle gradient
of a point in the `k`-prefix subspace lies in the `(k+1)`-prefix subspace, then
every gradient-span iterate from `0` lies in its matching prefix subspace.
-/
theorem gradientSpanTrajectory_mem_exercise42InfinitePrefixSubmodule_of_grad_mem_next
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x)
    (hgrad : ∀ k, x k ∈ exercise42InfinitePrefixSubmodule k ->
      grad (x k) ∈ exercise42InfinitePrefixSubmodule (k + 1)) :
    ∀ n, x n ∈ exercise42InfinitePrefixSubmodule n := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
      cases n with
      | zero =>
          simp [hx0, exercise42InfinitePrefixSubmodule,
            exercise42InfinitePrefixSupported]
      | succ n =>
          have hspan_n :
              x (n + 1) - x 0 ∈ gradientSpanSubmodule grad x n :=
            mem_affineGradientSpan_iff.mp (hspan n)
          have hle :
              gradientSpanSubmodule grad x n ≤
                exercise42InfinitePrefixSubmodule (n + 1) := by
            refine gradientSpanSubmodule_le_exercise42InfinitePrefixSubmodule ?_
            intro k hk
            have hxk : x k ∈ exercise42InfinitePrefixSubmodule k :=
              ih k (Nat.lt_succ_of_le hk)
            exact exercise42InfinitePrefixSubmodule_mono
              (Nat.succ_le_succ hk) (hgrad k hxk)
          have hx_sub :
              x (n + 1) - x 0 ∈
                exercise42InfinitePrefixSubmodule (n + 1) :=
            hle hspan_n
          simpa [hx0] using hx_sub

/--
The infinite tail energy of `z` is bounded by the squared distance from any
point whose coordinates vanish from `N` onward.
-/
theorem exercise42InfiniteTailSq_le_sqdist_of_prefixSupported
    {x z : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ}
    (hx : exercise42InfinitePrefixSupported x N) :
    exercise42InfiniteTailSq z N ≤ ‖x - z‖ ^ (2 : ℕ) := by
  let w := x - z
  have hp : 0 < (2 : ℝ≥0∞).toReal := by norm_num
  have hsumm :
      Summable fun n : ℕ => ‖w n‖ ^ (2 : ℝ≥0∞).toReal :=
    (lp.memℓp w).summable hp
  have htail_eq :
      exercise42InfiniteTailSq z N =
        ∑' n : ℕ, ‖w (N + n)‖ ^ (2 : ℝ≥0∞).toReal := by
    unfold exercise42InfiniteTailSq
    apply tsum_congr
    intro n
    have hxN : x (N + n) = 0 := hx (N + n) (by omega)
    have hw : w (N + n) = -z (N + n) := by
      change (x - z) (N + n) = -z (N + n)
      change x (N + n) - z (N + n) = -z (N + n)
      rw [hxN]
      ring
    rw [hw, norm_neg]
  have htail_comm :
      (∑' n : ℕ, ‖w (N + n)‖ ^ (2 : ℝ≥0∞).toReal) =
        ∑' n : ℕ, ‖w (n + N)‖ ^ (2 : ℝ≥0∞).toReal := by
    apply tsum_congr
    intro n
    rw [Nat.add_comm]
  have htail_le :
      (∑' n : ℕ, ‖w (n + N)‖ ^ (2 : ℝ≥0∞).toReal) ≤
        ∑' n : ℕ, ‖w n‖ ^ (2 : ℝ≥0∞).toReal := by
    have hsplit := hsumm.sum_add_tsum_nat_add N
    have hsum_nonneg :
        0 ≤
          ∑ n ∈ Finset.range N, ‖w n‖ ^ (2 : ℝ≥0∞).toReal :=
      Finset.sum_nonneg fun _ _ => by positivity
    nlinarith
  have hnorm :
      ‖x - z‖ ^ (2 : ℕ) =
        ∑' n : ℕ, ‖w n‖ ^ (2 : ℝ≥0∞).toReal := by
    have hleft :
        ‖x - z‖ ^ (2 : ℕ) = ‖w‖ ^ (2 : ℝ≥0∞).toReal := by
      norm_num [w, Real.rpow_natCast]
    rw [hleft, lp.norm_rpow_eq_tsum (E := fun _ : ℕ => ℝ)
      (p := (2 : ℝ≥0∞)) hp w]
  rw [htail_eq, htail_comm, hnorm]
  exact htail_le

/--
Supplied lower-model tail obstruction for the infinite Exercise 4.2 hard
instance.  Once a point is prefix-supported, a strong lower model at `z` turns
tail energy into a function-value gap.
-/
theorem exercise42Infinite_gap_ge_tailSq_of_lowerModel
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {alpha : ℝ} (halpha_nonneg : 0 ≤ alpha)
    {x z : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ}
    (hx : exercise42InfinitePrefixSupported x N)
    (hlower : f z + (alpha / 2) * ‖x - z‖ ^ (2 : ℕ) ≤ f x) :
    (alpha / 2) * exercise42InfiniteTailSq z N ≤ f x - f z := by
  have htail :
      exercise42InfiniteTailSq z N ≤ ‖x - z‖ ^ (2 : ℕ) :=
    exercise42InfiniteTailSq_le_sqdist_of_prefixSupported hx
  have hmul :
      (alpha / 2) * exercise42InfiniteTailSq z N ≤
        (alpha / 2) * ‖x - z‖ ^ (2 : ℕ) :=
    mul_le_mul_of_nonneg_left htail (by nlinarith)
  nlinarith

/--
Chewi Exercise 4.2 infinite-chain substrate: the shifted squared `L^2` terms
of a nonnegative geometric profile form the shifted geometric series.
-/
theorem exercise42_geometric_l2_tail_term_eq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (N n : ℕ) :
    ‖q ^ (N + n)‖ ^ (2 : ℝ≥0∞).toReal =
      (q ^ (2 : ℕ)) ^ N * (q ^ (2 : ℕ)) ^ n := by
  calc
    ‖q ^ (N + n)‖ ^ (2 : ℝ≥0∞).toReal =
        (q ^ (2 : ℕ)) ^ (N + n) :=
      exercise42_geometric_l2_term_eq hq_nonneg (N + n)
    _ = (q ^ (2 : ℕ)) ^ N * (q ^ (2 : ℕ)) ^ n := by
      rw [pow_add]

/--
Exact infinite tail identity from Chewi Exercise 4.2: the `ell^2` tail of the
pure geometric profile after `N` coordinates is
`(q^2)^N * (1 - q^2)^{-1}`.
-/
theorem exercise42InfiniteGeometric_tailSq_eq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (N : ℕ) :
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometric q hq_nonneg hq_lt_one) N =
      (q ^ (2 : ℕ)) ^ N * (1 - q ^ (2 : ℕ))⁻¹ := by
  have hq_sq_nonneg : 0 ≤ q ^ (2 : ℕ) := sq_nonneg q
  have hq_sq_lt_one : q ^ (2 : ℕ) < 1 := by
    have hq_sq_le_q : q ^ (2 : ℕ) ≤ q := by
      rw [pow_two]
      exact mul_le_of_le_one_right hq_nonneg hq_lt_one.le
    exact lt_of_le_of_lt hq_sq_le_q hq_lt_one
  have hgeom :
      (∑' n : ℕ, (q ^ (2 : ℕ)) ^ n) =
        (1 - q ^ (2 : ℕ))⁻¹ :=
    tsum_geometric_of_lt_one hq_sq_nonneg hq_sq_lt_one
  calc
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometric q hq_nonneg hq_lt_one) N =
        ∑' n : ℕ, (q ^ (2 : ℕ)) ^ N * (q ^ (2 : ℕ)) ^ n := by
      unfold exercise42InfiniteTailSq
      apply tsum_congr
      intro n
      simpa using exercise42_geometric_l2_tail_term_eq hq_nonneg N n
    _ = (q ^ (2 : ℕ)) ^ N *
        (∑' n : ℕ, (q ^ (2 : ℕ)) ^ n) := by
      rw [tsum_mul_left]
    _ = (q ^ (2 : ℕ)) ^ N * (1 - q ^ (2 : ℕ))⁻¹ := by
      rw [hgeom]

/--
Source-shaped tail identity: for the pure geometric profile, the tail energy
after `N` coordinates is `(q^2)^N` times the full squared norm.
-/
theorem exercise42InfiniteGeometric_tailSq_eq_pow_mul_norm_sq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (N : ℕ) :
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometric q hq_nonneg hq_lt_one) N =
      (q ^ (2 : ℕ)) ^ N *
        ‖exercise42InfiniteGeometric q hq_nonneg hq_lt_one‖ ^ (2 : ℕ) := by
  rw [exercise42InfiniteGeometric_tailSq_eq hq_nonneg hq_lt_one N,
    exercise42InfiniteGeometric_norm_sq hq_nonneg hq_lt_one]

/--
Zero-start source form of Exercise 4.2's tail identity: the geometric tail is
`(q^2)^N` times the squared distance from the initial point `0` to the
geometric profile.
-/
theorem exercise42InfiniteGeometric_tailSq_eq_pow_mul_zero_dist_sq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (N : ℕ) :
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometric q hq_nonneg hq_lt_one) N =
      (q ^ (2 : ℕ)) ^ N *
        ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
          exercise42InfiniteGeometric q hq_nonneg hq_lt_one‖ ^ (2 : ℕ) := by
  rw [zero_sub, norm_neg,
    exercise42InfiniteGeometric_tailSq_eq_pow_mul_norm_sq hq_nonneg hq_lt_one N]

/--
Inequality-shaped version for plugging the infinite Exercise 4.2 tail identity
into the lower-bound obstruction.
-/
theorem exercise42InfiniteGeometric_pow_mul_zero_dist_sq_le_tailSq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (N : ℕ) :
      (q ^ (2 : ℕ)) ^ N *
        ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
          exercise42InfiniteGeometric q hq_nonneg hq_lt_one‖ ^ (2 : ℕ) ≤
        exercise42InfiniteTailSq
          (exercise42InfiniteGeometric q hq_nonneg hq_lt_one) N := by
  rw [exercise42InfiniteGeometric_tailSq_eq_pow_mul_zero_dist_sq
    hq_nonneg hq_lt_one N]

/--
The actual infinite hard-chain minimizer profile for Exercise 4.2 has
coordinates `q^(n+1)`, matching the source boundary value `1` in the first
gradient coordinate.
-/
noncomputable def exercise42InfiniteGeometricMinimizer (q : ℝ)
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) :
    lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) :=
  q • exercise42InfiniteGeometric q hq_nonneg hq_lt_one

@[simp]
theorem exercise42InfiniteGeometricMinimizer_apply {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (n : ℕ) :
    exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one n =
      q ^ (n + 1) := by
  rw [exercise42InfiniteGeometricMinimizer, lp.coeFn_smul]
  simp [exercise42InfiniteGeometric_apply, pow_succ, mul_comm]

/-- Squared norm of the shifted geometric hard-chain minimizer profile. -/
theorem exercise42InfiniteGeometricMinimizer_norm_sq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) :
    ‖exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^ (2 : ℕ) =
      q ^ (2 : ℕ) * (1 - q ^ (2 : ℕ))⁻¹ := by
  let z := exercise42InfiniteGeometric q hq_nonneg hq_lt_one
  have hp : (2 : ℝ≥0∞) ≠ 0 := by norm_num
  calc
    ‖exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^ (2 : ℕ) =
        (‖q‖ * ‖z‖) ^ (2 : ℕ) := by
      rw [exercise42InfiniteGeometricMinimizer, lp.norm_const_smul hp]
    _ = q ^ (2 : ℕ) * ‖z‖ ^ (2 : ℕ) := by
      rw [Real.norm_of_nonneg hq_nonneg]
      ring
    _ = q ^ (2 : ℕ) * (1 - q ^ (2 : ℕ))⁻¹ := by
      rw [exercise42InfiniteGeometric_norm_sq hq_nonneg hq_lt_one]

/--
Exact infinite tail identity for the shifted hard-chain minimizer profile:
the tail after `N` coordinates is the pure geometric tail starting at `N+1`.
-/
theorem exercise42InfiniteGeometricMinimizer_tailSq_eq {q : ℝ}
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (N : ℕ) :
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) N =
      (q ^ (2 : ℕ)) ^ (N + 1) * (1 - q ^ (2 : ℕ))⁻¹ := by
  calc
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) N =
        exercise42InfiniteTailSq
          (exercise42InfiniteGeometric q hq_nonneg hq_lt_one) (N + 1) := by
      unfold exercise42InfiniteTailSq
      apply tsum_congr
      intro n
      have hidx : N + n + 1 = N + 1 + n := by omega
      simp [exercise42InfiniteGeometricMinimizer_apply, hidx]
    _ = (q ^ (2 : ℕ)) ^ (N + 1) * (1 - q ^ (2 : ℕ))⁻¹ := by
      rw [exercise42InfiniteGeometric_tailSq_eq hq_nonneg hq_lt_one (N + 1)]

/--
Source-shaped shifted-profile tail identity: the tail after `N` coordinates is
`(q^2)^N` times the squared zero-start distance to the exact infinite
hard-chain minimizer.
-/
theorem exercise42InfiniteGeometricMinimizer_tailSq_eq_pow_mul_zero_dist_sq
    {q : ℝ} (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1) (N : ℕ) :
    exercise42InfiniteTailSq
        (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) N =
      (q ^ (2 : ℕ)) ^ N *
        ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
          exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^
            (2 : ℕ) := by
  rw [zero_sub, norm_neg,
    exercise42InfiniteGeometricMinimizer_tailSq_eq hq_nonneg hq_lt_one N,
    exercise42InfiniteGeometricMinimizer_norm_sq hq_nonneg hq_lt_one]
  rw [pow_succ]
  ring

/--
Source-shaped infinite Exercise 4.2 obstruction for the shifted hard-chain
minimizer: a prefix-supported point cannot beat the geometric tail lower
bound under any supplied strong lower model at the minimizer.
-/
theorem exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_lowerModel
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {alpha q : ℝ} (halpha_nonneg : 0 ≤ alpha)
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1)
    {x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ}
    (hx : exercise42InfinitePrefixSupported x N)
    (hlower :
      f (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) +
          (alpha / 2) *
            ‖x - exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^
              (2 : ℕ) ≤
        f x) :
    (alpha / 2) *
        ((q ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^
              (2 : ℕ)) ≤
      f x - f (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) := by
  have hgap :=
    exercise42Infinite_gap_ge_tailSq_of_lowerModel
      (f := f) (alpha := alpha) halpha_nonneg hx hlower
  rw [exercise42InfiniteGeometricMinimizer_tailSq_eq_pow_mul_zero_dist_sq
    hq_nonneg hq_lt_one N] at hgap
  exact hgap

/--
Coordinate formula for the infinite strongly-convex hard-chain gradient in
Chewi Exercise 4.2.  This is the infinite analogue of
`strongLowerBoundChainGradient`, with no terminal boundary residual.
-/
noncomputable def exercise42InfiniteChainGradient (alpha beta : ℝ)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (i : ℕ) : ℝ :=
  ((beta - alpha) / 4) *
      (2 * x i - (if i = 0 then 1 else x (i - 1)) - x (i + 1)) +
    alpha * x i

/--
The infinite hard-chain gradient expands prefix support by one coordinate.
This is the infinite analogue of the finite support calculation behind
Theorem 4.4/4.5.
-/
theorem exercise42InfiniteChainGradient_mem_prefixSubmodule_of_apply
    {alpha beta : ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ}
    (hx : x ∈ exercise42InfinitePrefixSubmodule N) :
    grad x ∈ exercise42InfinitePrefixSubmodule (N + 1) := by
  intro i hi
  rw [hgrad_apply]
  unfold exercise42InfiniteChainGradient
  have hnot_first : ¬i = 0 := by omega
  have hxi : x i = 0 := hx i (by omega)
  have hxprev : x (i - 1) = 0 := hx (i - 1) (by omega)
  have hxnext : x (i + 1) = 0 := hx (i + 1) (by omega)
  simp [hnot_first, hxi, hxprev, hxnext]

/--
Prefix-support induction for Exercise 4.2 infinite hard-chain gradient-span
trajectories, stated with a supplied `ell^2` oracle and coordinate formula.
-/
theorem exercise42InfiniteGradientSpanTrajectory_mem_prefixSubmodule_of_apply
    {alpha beta : ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) :
    ∀ n, x n ∈ exercise42InfinitePrefixSubmodule n :=
  gradientSpanTrajectory_mem_exercise42InfinitePrefixSubmodule_of_grad_mem_next
    hx0 hspan
    (fun _ hx =>
      exercise42InfiniteChainGradient_mem_prefixSubmodule_of_apply
        hgrad_apply hx)

/-- Prop-valued form of the infinite hard-chain prefix-support induction. -/
theorem exercise42InfiniteGradientSpanTrajectory_prefixSupported_of_apply
    {alpha beta : ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) (n : ℕ) :
    exercise42InfinitePrefixSupported (x n) n :=
  exercise42InfiniteGradientSpanTrajectory_mem_prefixSubmodule_of_apply
    hgrad_apply hx0 hspan n

/--
Gradient-span version of the infinite Exercise 4.2 geometric obstruction.
After the support induction has been discharged from the coordinate formula,
only the supplied lower model at the geometric minimizer remains.
-/
theorem exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_lowerModel
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {alpha beta q : ℝ} (halpha_nonneg : 0 ≤ alpha)
    (hq_nonneg : 0 ≤ q) (hq_lt_one : q < 1)
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) (N : ℕ)
    (hlower :
      f (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) +
          (alpha / 2) *
            ‖x N - exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^
              (2 : ℕ) ≤
        f (x N)) :
    (alpha / 2) *
        ((q ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one‖ ^
              (2 : ℕ)) ≤
      f (x N) -
        f (exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one) := by
  have hx_prefix :
      exercise42InfinitePrefixSupported (x N) N :=
    exercise42InfiniteGradientSpanTrajectory_prefixSupported_of_apply
      hgrad_apply hx0 hspan N
  exact
    exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_lowerModel
      (f := f) (alpha := alpha) halpha_nonneg hq_nonneg hq_lt_one
      hx_prefix hlower

/--
The geometric profile with Chewi's ratio is the exact zero-gradient point of
the infinite hard chain.  This is the no-terminal-residual version of the
finite corrected-chain algebra.
-/
theorem exercise42InfiniteChainGradient_geometricMinimizer_eq_zero
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hq_nonneg : 0 ≤ chewi45GeometricRatio kappa)
    (hq_lt_one : chewi45GeometricRatio kappa < 1) (i : ℕ) :
    exercise42InfiniteChainGradient alpha beta
        (exercise42InfiniteGeometricMinimizer
          (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one) i = 0 := by
  let q := chewi45GeometricRatio kappa
  have hkappa_gt : 1 < kappa := by
    rw [hkappa]
    exact (one_lt_div halpha_pos).2 halpha_lt_beta
  have hgamma_ne : beta - alpha ≠ 0 := by linarith
  have hcoef :
      4 / (kappa - 1) = 4 * alpha / (beta - alpha) := by
    rw [hkappa]
    field_simp [halpha_pos.ne', hgamma_ne]
  have hrec :
      q ^ (i + 2) -
          (2 + 4 * alpha / (beta - alpha)) * q ^ (i + 1) +
        q ^ i = 0 := by
    have h :=
      chewi45GeometricRatio_pow_recurrence (kappa := kappa) hkappa_gt i
    simpa [q, hcoef] using h
  have hrec_mul :
      (beta - alpha) *
          (2 * q ^ (i + 1) - q ^ i - q ^ (i + 2)) +
        4 * alpha * q ^ (i + 1) = 0 := by
    have hrec' :
        2 * q ^ (i + 1) - q ^ i - q ^ (i + 2) +
            (4 * alpha / (beta - alpha)) * q ^ (i + 1) = 0 := by
      linarith [hrec]
    field_simp [hgamma_ne] at hrec'
    ring_nf at hrec' ⊢
    exact hrec'
  have hmain :
      (beta - alpha) / 4 *
            (2 * q ^ (i + 1) - q ^ i - q ^ (i + 2)) +
          alpha * q ^ (i + 1) =
        0 := by
    field_simp
    linarith [hrec_mul]
  by_cases hfirst : i = 0
  · simp [exercise42InfiniteChainGradient,
      exercise42InfiniteGeometricMinimizer_apply, q, hfirst] at hmain ⊢
    simpa [mul_assoc, mul_left_comm, mul_comm] using hmain
  · have hprev_exp : i - 1 + 1 = i := by omega
    have hnext_exp : i + 1 + 1 = i + 2 := by omega
    simp [exercise42InfiniteChainGradient,
      exercise42InfiniteGeometricMinimizer_apply, hfirst, hprev_exp,
      hnext_exp]
    simpa [mul_assoc, mul_left_comm, mul_comm] using hmain

/-- Source-shaped wrapper using the standard positivity facts for Chewi's ratio. -/
theorem exercise42InfiniteChainGradient_geometricMinimizer_eq_zero_of_kappa
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha) (i : ℕ) :
    exercise42InfiniteChainGradient alpha beta
        (exercise42InfiniteGeometricMinimizer
          (chewi45GeometricRatio kappa)
          (chewi45GeometricRatio_nonneg (kappa := kappa)
            ((by
              rw [hkappa]
              exact (one_lt_div halpha_pos).2 halpha_lt_beta : 1 < kappa).le))
          (chewi45GeometricRatio_lt_one kappa)) i = 0 :=
  exercise42InfiniteChainGradient_geometricMinimizer_eq_zero
    halpha_pos halpha_lt_beta hkappa
    (chewi45GeometricRatio_nonneg (kappa := kappa)
      ((by
        rw [hkappa]
        exact (one_lt_div halpha_pos).2 halpha_lt_beta : 1 < kappa).le))
    (chewi45GeometricRatio_lt_one kappa) i

end Optimization
end StatInference
