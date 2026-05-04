import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
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
open Filter
open scoped InnerProductSpace ENNReal Topology

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
The source infinite chain edge-energy series in Exercise 4.2 is summable for
every `ell^2` point.  This is the analytic substrate needed to state the
displayed objective as a genuine infinite quadratic.
-/
theorem exercise42InfiniteChainEdgeSq_summable
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Summable fun n : ℕ => (x n - x (n + 1)) ^ (2 : ℕ) := by
  have hp : 0 < (2 : ℝ≥0∞).toReal := by norm_num
  have hxnorm :
      Summable fun n : ℕ => ‖x n‖ ^ (2 : ℕ) := by
    have hx := (lp.memℓp x).summable hp
    simpa using hx
  have hxshift :
      Summable fun n : ℕ => ‖x (n + 1)‖ ^ (2 : ℕ) := by
    have hx :=
      (summable_nat_add_iff
        (f := fun n : ℕ => ‖x n‖ ^ (2 : ℕ)) 1).2 hxnorm
    simpa [Nat.add_comm, Nat.succ_eq_add_one] using hx
  refine Summable.of_nonneg_of_le
    (fun n => sq_nonneg (x n - x (n + 1))) ?_
    ((hxnorm.mul_left 2).add (hxshift.mul_left 2))
  intro n
  have h :=
    sq_sub_le_two_mul_sq_add_two_mul_sq (x n) (x (n + 1))
  simpa [Real.norm_eq_abs, sq_abs, mul_add] using h

/--
Concrete infinite strongly-convex hard-chain objective from Chewi Exercise 4.2,
in zero-based coordinates:

`((beta-alpha)/8) * (x₀² + ∑ (xₙ-xₙ₊₁)² - 2*x₀) + (alpha/2) * ‖x‖²`.
-/
noncomputable def exercise42InfiniteChainObjective (alpha beta : ℝ)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) : ℝ :=
  ((beta - alpha) / 8) *
      (x 0 ^ (2 : ℕ) +
        (∑' n : ℕ, (x n - x (n + 1)) ^ (2 : ℕ)) -
          2 * x 0) +
    (alpha / 2) * ‖x‖ ^ (2 : ℕ)

/-- Unfolding form of the concrete infinite Exercise 4.2 hard-chain objective. -/
theorem exercise42InfiniteChainObjective_apply
    (alpha beta : ℝ) (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    exercise42InfiniteChainObjective alpha beta x =
      ((beta - alpha) / 8) *
          (x 0 ^ (2 : ℕ) +
            (∑' n : ℕ, (x n - x (n + 1)) ^ (2 : ℕ)) -
              2 * x 0) +
        (alpha / 2) * ‖x‖ ^ (2 : ℕ) :=
  rfl

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

/-- Forward-shifting an `ell^2` sequence stays in `ell^2`. -/
theorem exercise42Infinite_shiftForward_memℓp_two
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Memℓp (fun i : ℕ => x (i + 1)) (2 : ℝ≥0∞) := by
  apply memℓp_gen
  have hp : 0 < (2 : ℝ≥0∞).toReal := by norm_num
  have hxnorm :
      Summable fun n : ℕ => ‖x n‖ ^ (2 : ℝ≥0∞).toReal :=
    (lp.memℓp x).summable hp
  have hxshift :=
    (summable_nat_add_iff
      (f := fun n : ℕ => ‖x n‖ ^ (2 : ℝ≥0∞).toReal) 1).2 hxnorm
  simpa [Nat.add_comm, Nat.succ_eq_add_one] using hxshift

/-- Backward-shifting an `ell^2` sequence and inserting zero stays in `ell^2`. -/
theorem exercise42Infinite_shiftBackwardZero_memℓp_two
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Memℓp (fun i : ℕ => if i = 0 then (0 : ℝ) else x (i - 1))
      (2 : ℝ≥0∞) := by
  apply memℓp_gen
  have hp : 0 < (2 : ℝ≥0∞).toReal := by norm_num
  have hxnorm :
      Summable fun n : ℕ => ‖x n‖ ^ (2 : ℝ≥0∞).toReal :=
    (lp.memℓp x).summable hp
  have htail :
      Summable fun n : ℕ =>
        ‖(if n + 1 = 0 then (0 : ℝ) else x (n + 1 - 1))‖ ^
          (2 : ℝ≥0∞).toReal := by
    simpa using hxnorm
  exact
    (summable_nat_add_iff
      (f := fun i : ℕ =>
        ‖(if i = 0 then (0 : ℝ) else x (i - 1))‖ ^
          (2 : ℝ≥0∞).toReal) 1).1 htail

/-- The hard-chain predecessor sequence `1, x₀, x₁, ...` is in `ell^2`. -/
theorem exercise42Infinite_predecessor_memℓp_two
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Memℓp (fun i : ℕ => if i = 0 then (1 : ℝ) else x (i - 1))
      (2 : ℝ≥0∞) := by
  have hsingle :
      Memℓp (Function.update (fun _ : ℕ => (0 : ℝ)) 0 1)
        (2 : ℝ≥0∞) := by
    simpa [lp.coeFn_single] using
      (lp.memℓp
        (lp.single (E := fun _ : ℕ => ℝ) (2 : ℝ≥0∞) 0 (1 : ℝ)))
  have hback := exercise42Infinite_shiftBackwardZero_memℓp_two x
  have hsum := hsingle.add hback
  convert hsum using 1
  ext i
  by_cases hi : i = 0 <;> simp [hi]

/-- The displayed coordinate gradient of the infinite hard chain is an `ell^2` sequence. -/
theorem exercise42InfiniteChainGradient_memℓp_two
    (alpha beta : ℝ) (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Memℓp (fun i : ℕ => exercise42InfiniteChainGradient alpha beta x i)
      (2 : ℝ≥0∞) := by
  have hx : Memℓp (fun i : ℕ => x i) (2 : ℝ≥0∞) := lp.memℓp x
  have htwox : Memℓp (fun i : ℕ => (2 : ℝ) * x i) (2 : ℝ≥0∞) := by
    simpa using hx.const_smul (2 : ℝ)
  have hpred := exercise42Infinite_predecessor_memℓp_two x
  have hfwd := exercise42Infinite_shiftForward_memℓp_two x
  have hcore :
      Memℓp
        (fun i : ℕ =>
          2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) -
            x (i + 1)) (2 : ℝ≥0∞) := by
    simpa [sub_eq_add_neg, mul_comm, mul_left_comm, mul_assoc] using
      (htwox.sub hpred).sub hfwd
  have hscaled :
      Memℓp
        (fun i : ℕ =>
          ((beta - alpha) / 4) *
            (2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) -
              x (i + 1))) (2 : ℝ≥0∞) := by
    simpa using hcore.const_smul ((beta - alpha) / 4)
  have halphax : Memℓp (fun i : ℕ => alpha * x i) (2 : ℝ≥0∞) := by
    simpa using hx.const_smul alpha
  simpa [exercise42InfiniteChainGradient] using hscaled.add halphax

/-- Concrete `ell^2` gradient oracle for Chewi Exercise 4.2's infinite hard chain. -/
noncomputable def exercise42InfiniteChainGradientLp (alpha beta : ℝ)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) :=
  ⟨fun i => exercise42InfiniteChainGradient alpha beta x i,
    exercise42InfiniteChainGradient_memℓp_two alpha beta x⟩

@[simp]
theorem exercise42InfiniteChainGradientLp_apply
    (alpha beta : ℝ) (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (i : ℕ) :
    exercise42InfiniteChainGradientLp alpha beta x i =
      exercise42InfiniteChainGradient alpha beta x i :=
  rfl

/-- Convex base part of the infinite hard-chain objective, before regularization. -/
noncomputable def exercise42InfiniteBaseChainObjective (gamma : ℝ)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) : ℝ :=
  (gamma / 8) *
    (x 0 ^ (2 : ℕ) +
      (∑' n : ℕ, (x n - x (n + 1)) ^ (2 : ℕ)) -
        2 * x 0)

/-- Coordinate formula for the convex base hard-chain gradient. -/
noncomputable def exercise42InfiniteBaseChainGradient (gamma : ℝ)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (i : ℕ) : ℝ :=
  (gamma / 4) *
    (2 * x i - (if i = 0 then 1 else x (i - 1)) - x (i + 1))

/--
Infinite hard-chain edge residuals with boundary node `z₀ = 1` and interior
nodes `zₙ₊₁ = xₙ`.
-/
noncomputable def exercise42InfiniteBaseChainEdge
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) : ℕ -> ℝ
  | 0 => x 0 - 1
  | n + 1 => x n - x (n + 1)

/--
Homogeneous edge residuals for a direction vector.  These are the increments
of `exercise42InfiniteBaseChainEdge` under `x ↦ x + v`.
-/
noncomputable def exercise42InfiniteBaseChainDirectionEdge
    (v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) : ℕ -> ℝ
  | 0 => v 0
  | n + 1 => v n - v (n + 1)

/-- The infinite hard-chain edge residuals are square-summable. -/
theorem exercise42InfiniteBaseChainEdgeSq_summable
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Summable fun n : ℕ =>
      (exercise42InfiniteBaseChainEdge x n) ^ (2 : ℕ) := by
  have htail :
      Summable fun n : ℕ =>
        (exercise42InfiniteBaseChainEdge x (n + 1)) ^ (2 : ℕ) := by
    simpa [exercise42InfiniteBaseChainEdge] using
      exercise42InfiniteChainEdgeSq_summable x
  exact
    (summable_nat_add_iff
      (f := fun n : ℕ =>
        (exercise42InfiniteBaseChainEdge x n) ^ (2 : ℕ)) 1).1 htail

/-- The homogeneous direction edge residuals are square-summable. -/
theorem exercise42InfiniteBaseChainDirectionEdgeSq_summable
    (v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Summable fun n : ℕ =>
      (exercise42InfiniteBaseChainDirectionEdge v n) ^ (2 : ℕ) := by
  have htail :
      Summable fun n : ℕ =>
        (exercise42InfiniteBaseChainDirectionEdge v (n + 1)) ^ (2 : ℕ) := by
    simpa [exercise42InfiniteBaseChainDirectionEdge] using
      exercise42InfiniteChainEdgeSq_summable v
  exact
    (summable_nat_add_iff
      (f := fun n : ℕ =>
        (exercise42InfiniteBaseChainDirectionEdge v n) ^ (2 : ℕ)) 1).1 htail

/-- Edge residuals bundled as an `ell^2` element. -/
noncomputable def exercise42InfiniteBaseChainEdgeLp
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) :=
  ⟨exercise42InfiniteBaseChainEdge x, by
    apply memℓp_gen
    simpa [Real.norm_eq_abs, sq_abs, Real.rpow_natCast] using
      exercise42InfiniteBaseChainEdgeSq_summable x⟩

@[simp]
theorem exercise42InfiniteBaseChainEdgeLp_apply
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (n : ℕ) :
    exercise42InfiniteBaseChainEdgeLp x n =
      exercise42InfiniteBaseChainEdge x n :=
  rfl

/-- Direction edge residuals bundled as an `ell^2` element. -/
noncomputable def exercise42InfiniteBaseChainDirectionEdgeLp
    (v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) :=
  ⟨exercise42InfiniteBaseChainDirectionEdge v, by
    apply memℓp_gen
    simpa [Real.norm_eq_abs, sq_abs, Real.rpow_natCast] using
      exercise42InfiniteBaseChainDirectionEdgeSq_summable v⟩

@[simp]
theorem exercise42InfiniteBaseChainDirectionEdgeLp_apply
    (v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (n : ℕ) :
    exercise42InfiniteBaseChainDirectionEdgeLp v n =
      exercise42InfiniteBaseChainDirectionEdge v n :=
  rfl

/--
The edge-direction product series is summable by mathlib's `ell^2`
Cauchy-Schwarz summability.
-/
theorem exercise42InfiniteBaseChainEdge_mul_direction_summable
    (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    Summable fun n : ℕ =>
      exercise42InfiniteBaseChainEdge x n *
        exercise42InfiniteBaseChainDirectionEdge v n := by
  have h :
      Summable fun n : ℕ =>
        inner ℝ (exercise42InfiniteBaseChainEdgeLp x n)
          (exercise42InfiniteBaseChainDirectionEdgeLp v n) :=
    lp.summable_inner
      (𝕜 := ℝ)
      (exercise42InfiniteBaseChainEdgeLp x)
      (exercise42InfiniteBaseChainDirectionEdgeLp v)
  simpa [RCLike.inner_apply, mul_comm] using h

/-- Edge residuals add the homogeneous direction residual under `x ↦ x + v`. -/
theorem exercise42InfiniteBaseChainEdge_add_direction
    (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (n : ℕ) :
    exercise42InfiniteBaseChainEdge (x + v) n =
      exercise42InfiniteBaseChainEdge x n +
        exercise42InfiniteBaseChainDirectionEdge v n := by
  cases n with
  | zero =>
      simp only [exercise42InfiniteBaseChainEdge,
        exercise42InfiniteBaseChainDirectionEdge]
      rw [lp.coeFn_add]
      change (x 0 + v 0) - 1 = (x 0 - 1) + v 0
      ring
  | succ n =>
      simp only [exercise42InfiniteBaseChainEdge,
        exercise42InfiniteBaseChainDirectionEdge]
      rw [lp.coeFn_add]
      change (x n + v n) - (x (n + 1) + v (n + 1)) =
        (x n - x (n + 1)) + (v n - v (n + 1))
      ring

/-- The convex base hard-chain objective is the edge energy minus the boundary constant. -/
theorem exercise42InfiniteBaseChainObjective_eq_edge_tsum
    (gamma : ℝ) (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    exercise42InfiniteBaseChainObjective gamma x =
      (gamma / 8) *
        ((∑' n : ℕ, (exercise42InfiniteBaseChainEdge x n) ^ (2 : ℕ)) - 1) := by
  have hsumm := exercise42InfiniteBaseChainEdgeSq_summable x
  have hsplit := hsumm.sum_add_tsum_nat_add 1
  have hsum_eq :
      (∑' n : ℕ, (exercise42InfiniteBaseChainEdge x n) ^ (2 : ℕ)) =
        (x 0 - 1) ^ (2 : ℕ) +
          ∑' n : ℕ, (x n - x (n + 1)) ^ (2 : ℕ) := by
    rw [← hsplit]
    simp [exercise42InfiniteBaseChainEdge]
  rw [exercise42InfiniteBaseChainObjective, hsum_eq]
  ring

/--
Exact infinite edge-energy expansion for the convex base hard-chain objective
under a direction update.
-/
theorem exercise42InfiniteBaseChainObjective_add_direction
    (gamma : ℝ) (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    exercise42InfiniteBaseChainObjective gamma (x + v) =
      exercise42InfiniteBaseChainObjective gamma x +
        (gamma / 4) *
          (∑' n : ℕ,
            exercise42InfiniteBaseChainEdge x n *
              exercise42InfiniteBaseChainDirectionEdge v n) +
        (gamma / 8) *
          (∑' n : ℕ,
            (exercise42InfiniteBaseChainDirectionEdge v n) ^ (2 : ℕ)) := by
  let e : ℕ -> ℝ := exercise42InfiniteBaseChainEdge x
  let d : ℕ -> ℝ := exercise42InfiniteBaseChainDirectionEdge v
  have he : Summable fun n : ℕ => e n ^ (2 : ℕ) :=
    exercise42InfiniteBaseChainEdgeSq_summable x
  have hd : Summable fun n : ℕ => d n ^ (2 : ℕ) :=
    exercise42InfiniteBaseChainDirectionEdgeSq_summable v
  have hed : Summable fun n : ℕ => e n * d n :=
    exercise42InfiniteBaseChainEdge_mul_direction_summable x v
  have htwoed : Summable fun n : ℕ => 2 * (e n * d n) :=
    hed.mul_left 2
  have hsum_expand :
      (∑' n : ℕ, (exercise42InfiniteBaseChainEdge (x + v) n) ^ (2 : ℕ)) =
        (∑' n : ℕ, e n ^ (2 : ℕ)) +
          2 * (∑' n : ℕ, e n * d n) +
            (∑' n : ℕ, d n ^ (2 : ℕ)) := by
    calc
      (∑' n : ℕ, (exercise42InfiniteBaseChainEdge (x + v) n) ^ (2 : ℕ)) =
          ∑' n : ℕ, (e n ^ (2 : ℕ) + (2 * (e n * d n) + d n ^ (2 : ℕ))) := by
        apply tsum_congr
        intro n
        rw [exercise42InfiniteBaseChainEdge_add_direction]
        dsimp [e, d]
        ring
      _ = (∑' n : ℕ, e n ^ (2 : ℕ)) +
            ∑' n : ℕ, (2 * (e n * d n) + d n ^ (2 : ℕ)) := by
        rw [Summable.tsum_add he (htwoed.add hd)]
      _ = (∑' n : ℕ, e n ^ (2 : ℕ)) +
            ((∑' n : ℕ, 2 * (e n * d n)) +
              ∑' n : ℕ, d n ^ (2 : ℕ)) := by
        rw [Summable.tsum_add htwoed hd]
      _ = (∑' n : ℕ, e n ^ (2 : ℕ)) +
            2 * (∑' n : ℕ, e n * d n) +
              (∑' n : ℕ, d n ^ (2 : ℕ)) := by
        rw [tsum_mul_left]
        ring
  rw [exercise42InfiniteBaseChainObjective_eq_edge_tsum,
    exercise42InfiniteBaseChainObjective_eq_edge_tsum, hsum_expand]
  ring

/--
Infinite base-chain lower model in edge-linear form: the quadratic remainder
in the direction expansion is nonnegative.
-/
theorem exercise42InfiniteBaseChainObjective_add_direction_ge_edge_linear
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    exercise42InfiniteBaseChainObjective gamma x +
        (gamma / 4) *
          (∑' n : ℕ,
            exercise42InfiniteBaseChainEdge x n *
              exercise42InfiniteBaseChainDirectionEdge v n) ≤
      exercise42InfiniteBaseChainObjective gamma (x + v) := by
  have hdir_nonneg :
      0 ≤
        (∑' n : ℕ,
          (exercise42InfiniteBaseChainDirectionEdge v n) ^ (2 : ℕ)) :=
    tsum_nonneg fun _ => sq_nonneg _
  rw [exercise42InfiniteBaseChainObjective_add_direction]
  have hcoef : 0 ≤ gamma / 8 := by positivity
  nlinarith

/-- Two-point edge-linear lower model for the infinite convex base hard chain. -/
theorem exercise42InfiniteBaseChainObjective_ge_edge_linear
    {gamma : ℝ} (hgamma : 0 ≤ gamma)
    (x y : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    exercise42InfiniteBaseChainObjective gamma x +
        (gamma / 4) *
          (∑' n : ℕ,
            exercise42InfiniteBaseChainEdge x n *
              exercise42InfiniteBaseChainDirectionEdge (y - x) n) ≤
      exercise42InfiniteBaseChainObjective gamma y := by
  have h :=
    exercise42InfiniteBaseChainObjective_add_direction_ge_edge_linear
      hgamma x (y - x)
  have hxy : x + (y - x) = y := by
    ext i
    simp
  simpa [hxy] using h

/-- Concrete `ell^2` gradient oracle for the convex base hard-chain objective. -/
noncomputable def exercise42InfiniteBaseChainGradientLp (gamma : ℝ)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) :=
  exercise42InfiniteChainGradientLp 0 gamma x

@[simp]
theorem exercise42InfiniteBaseChainGradientLp_apply
    (gamma : ℝ) (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (i : ℕ) :
    exercise42InfiniteBaseChainGradientLp gamma x i =
      exercise42InfiniteBaseChainGradient gamma x i := by
  simp [exercise42InfiniteBaseChainGradientLp,
    exercise42InfiniteBaseChainGradient, exercise42InfiniteChainGradient]

/--
Finite summation by parts for the infinite base chain, with the explicit
boundary term that vanishes in the `ell^2` limit.
-/
theorem exercise42InfiniteBaseChain_edge_direction_sum_range_eq_core_sum_sub_boundary
    (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) (N : ℕ) :
    (∑ n ∈ Finset.range (N + 2),
        exercise42InfiniteBaseChainEdge x n *
          exercise42InfiniteBaseChainDirectionEdge v n) =
      (∑ i ∈ Finset.range (N + 1),
        (2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) - x (i + 1)) *
          v i) -
        exercise42InfiniteBaseChainEdge x (N + 1) * v (N + 1) := by
  let e : ℕ -> ℝ := exercise42InfiniteBaseChainEdge x
  let d : ℕ -> ℝ := exercise42InfiniteBaseChainDirectionEdge v
  let c : ℕ -> ℝ :=
    fun i =>
      (2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) - x (i + 1)) *
        v i
  change
    (∑ n ∈ Finset.range (N + 2), e n * d n) =
      (∑ i ∈ Finset.range (N + 1), c i) -
        e (N + 1) * v (N + 1)
  induction N with
  | zero =>
      have hleft :
          (∑ n ∈ Finset.range (0 + 2), e n * d n) =
            e 0 * d 0 + e 1 * d 1 := by
        norm_num [Finset.sum_range_succ]
      have hright :
          (∑ i ∈ Finset.range (0 + 1), c i) - e (0 + 1) * v (0 + 1) =
            c 0 - e 1 * v 1 := by
        norm_num [Finset.sum_range_succ]
      rw [hleft, hright]
      simp [e, d, c, exercise42InfiniteBaseChainEdge,
        exercise42InfiniteBaseChainDirectionEdge]
      ring_nf
  | succ N ih =>
      rw [show N.succ + 2 = (N + 2).succ by omega,
        Finset.sum_range_succ, ih]
      have hsum_c :
          (∑ i ∈ Finset.range (N.succ + 1), c i) =
            (∑ i ∈ Finset.range (N + 1), c i) + c (N + 1) := by
        rw [show N.succ + 1 = (N + 1).succ by omega,
          Finset.sum_range_succ]
      rw [hsum_c]
      have hdir : d (N + 2) =
            v (N + 1) - v (N + 2) := by
        simp [d, exercise42InfiniteBaseChainDirectionEdge]
      have hcore : c (N + 1) = (e (N + 2) - e (N + 1)) * v (N + 1) := by
        have he_next : e (N + 2) = x (N + 1) - x (N + 2) := by
          rw [show N + 2 = Nat.succ (N + 1) by omega]
          simp [e, exercise42InfiniteBaseChainEdge]
        have he_prev : e (N + 1) = x N - x (N + 1) := by
          rw [show N + 1 = Nat.succ N by omega]
          simp [e, exercise42InfiniteBaseChainEdge]
        dsimp [c]
        rw [show N + 1 + 1 = N + 2 by omega, he_next, he_prev]
        ring
      rw [hdir, hcore]
      ring

/--
Infinite summation by parts for the convex base hard chain: edge-linear work
equals the coordinate work against Chewi's unscaled tridiagonal core.
-/
theorem exercise42InfiniteBaseChain_edge_direction_tsum_eq_core_tsum
    (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    (∑' n : ℕ,
        exercise42InfiniteBaseChainEdge x n *
          exercise42InfiniteBaseChainDirectionEdge v n) =
      ∑' i : ℕ,
        (2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) - x (i + 1)) *
          v i := by
  let e : ℕ -> ℝ := exercise42InfiniteBaseChainEdge x
  let d : ℕ -> ℝ := exercise42InfiniteBaseChainDirectionEdge v
  let c : ℕ -> ℝ :=
    fun i =>
      (2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) - x (i + 1)) *
        v i
  have hed : Summable fun n : ℕ => e n * d n := by
    simpa [e, d] using exercise42InfiniteBaseChainEdge_mul_direction_summable x v
  have hc : Summable c := by
    have h :=
      lp.summable_inner
        (𝕜 := ℝ)
        (exercise42InfiniteBaseChainGradientLp 4 x)
        v
    simpa [c, RCLike.inner_apply, exercise42InfiniteBaseChainGradientLp_apply,
      exercise42InfiniteBaseChainGradient, mul_comm, mul_left_comm, mul_assoc] using h
  have hev : Summable fun n : ℕ => e n * v n := by
    have h :=
      lp.summable_inner
        (𝕜 := ℝ)
        (exercise42InfiniteBaseChainEdgeLp x)
        v
    simpa [e, RCLike.inner_apply, exercise42InfiniteBaseChainEdgeLp_apply,
      mul_comm] using h
  have hleft :
      Tendsto
        (fun N : ℕ => ∑ n ∈ Finset.range (N + 2), e n * d n)
        atTop
        (𝓝 (∑' n : ℕ, e n * d n)) :=
    hed.hasSum.tendsto_sum_nat.comp (tendsto_add_atTop_nat 2)
  have hcore :
      Tendsto
        (fun N : ℕ => ∑ i ∈ Finset.range (N + 1), c i)
        atTop
        (𝓝 (∑' i : ℕ, c i)) :=
    hc.hasSum.tendsto_sum_nat.comp (tendsto_add_atTop_nat 1)
  have hboundary :
      Tendsto (fun N : ℕ => e (N + 1) * v (N + 1)) atTop (𝓝 0) :=
    hev.tendsto_atTop_zero.comp (tendsto_add_atTop_nat 1)
  have hright :
      Tendsto
        (fun N : ℕ =>
          (∑ i ∈ Finset.range (N + 1), c i) - e (N + 1) * v (N + 1))
        atTop
        (𝓝 ((∑' i : ℕ, c i) - 0)) :=
    hcore.sub hboundary
  have hfinite_eventually :
      (fun N : ℕ =>
        (∑ i ∈ Finset.range (N + 1), c i) - e (N + 1) * v (N + 1)) =ᶠ[atTop]
        (fun N : ℕ => ∑ n ∈ Finset.range (N + 2), e n * d n) :=
    Eventually.of_forall fun N =>
      (exercise42InfiniteBaseChain_edge_direction_sum_range_eq_core_sum_sub_boundary
        x v N).symm
  have hright_as_left :
      Tendsto
        (fun N : ℕ => ∑ n ∈ Finset.range (N + 2), e n * d n)
        atTop
        (𝓝 ((∑' i : ℕ, c i) - 0)) :=
    hright.congr' hfinite_eventually
  have hlim :=
    tendsto_nhds_unique hleft hright_as_left
  simpa [e, d, c] using hlim

/--
The edge-linear work in the infinite base-chain expansion is the actual
`ell^2` inner product with Chewi's base gradient oracle.
-/
theorem inner_exercise42InfiniteBaseChainGradientLp_eq_edgeDirection_tsum
    (gamma : ℝ)
    (x v : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    inner ℝ (exercise42InfiniteBaseChainGradientLp gamma x) v =
      (gamma / 4) *
        (∑' n : ℕ,
          exercise42InfiniteBaseChainEdge x n *
            exercise42InfiniteBaseChainDirectionEdge v n) := by
  let c : ℕ -> ℝ :=
    fun i =>
      (2 * x i - (if i = 0 then (1 : ℝ) else x (i - 1)) - x (i + 1)) *
        v i
  have hc : Summable c := by
    have h :=
      lp.summable_inner
        (𝕜 := ℝ)
        (exercise42InfiniteBaseChainGradientLp 4 x)
        v
    simpa [c, RCLike.inner_apply, exercise42InfiniteBaseChainGradientLp_apply,
      exercise42InfiniteBaseChainGradient, mul_comm, mul_left_comm, mul_assoc] using h
  calc
    inner ℝ (exercise42InfiniteBaseChainGradientLp gamma x) v =
        ∑' i : ℕ,
          inner ℝ (exercise42InfiniteBaseChainGradientLp gamma x i) (v i) := by
      rw [lp.inner_eq_tsum]
    _ = ∑' i : ℕ, (gamma / 4) * c i := by
      apply tsum_congr
      intro i
      simp [c, RCLike.inner_apply, exercise42InfiniteBaseChainGradientLp_apply,
        exercise42InfiniteBaseChainGradient]
      ring
    _ = (gamma / 4) * (∑' i : ℕ, c i) := by
      rw [tsum_mul_left]
    _ =
        (gamma / 4) *
          (∑' n : ℕ,
            exercise42InfiniteBaseChainEdge x n *
              exercise42InfiniteBaseChainDirectionEdge v n) := by
      rw [exercise42InfiniteBaseChain_edge_direction_tsum_eq_core_tsum]

/-- Supplied-gradient convex lower model for the infinite convex base chain. -/
theorem exercise42InfiniteBaseChainObjective_firstOrderConvex
    {gamma : ℝ} (hgamma : 0 ≤ gamma) :
    FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteBaseChainObjective gamma)
      (exercise42InfiniteBaseChainGradientLp gamma) 0 := by
  refine ⟨convex_univ, ?_⟩
  intro x _hx y _hy
  have h :=
    exercise42InfiniteBaseChainObjective_ge_edge_linear
      hgamma x y
  have hinner :=
    inner_exercise42InfiniteBaseChainGradientLp_eq_edgeDirection_tsum
      gamma x (y - x)
  rw [← hinner] at h
  simpa using h

/--
The strongly-convex infinite Exercise 4.2 objective is the convex base chain
regularized by `(alpha / 2) * ‖x‖²`.
-/
theorem exercise42InfiniteChainObjective_eq_quadraticRegularizedAround
    (alpha beta : ℝ) :
    exercise42InfiniteChainObjective alpha beta =
      quadraticRegularizedAround
        (exercise42InfiniteBaseChainObjective (beta - alpha)) alpha
        (0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) := by
  ext x
  simp [exercise42InfiniteChainObjective, exercise42InfiniteBaseChainObjective,
    quadraticRegularizedAround]

/--
The concrete hard-chain gradient oracle is the regularized gradient of the
convex base hard-chain oracle.
-/
theorem exercise42InfiniteChainGradientLp_eq_regularizedGradient
    (alpha beta : ℝ) :
    exercise42InfiniteChainGradientLp alpha beta =
      regularizedGradient
        (exercise42InfiniteBaseChainGradientLp (beta - alpha)) alpha
        (0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) := by
  ext x i
  simp only [regularizedGradient, exercise42InfiniteBaseChainGradientLp,
    lp.coeFn_add, lp.coeFn_smul, lp.coeFn_sub, lp.coeFn_zero, Pi.add_apply,
    Pi.smul_apply, Pi.sub_apply, Pi.zero_apply,
    exercise42InfiniteChainGradientLp_apply]
  simp [exercise42InfiniteChainGradient, sub_eq_add_neg]

/--
Reduction of the remaining concrete first-order package to the convex base
chain lower model.
-/
theorem exercise42InfiniteChainObjective_firstOrderStrongConvexOn_of_base
    {alpha beta : ℝ}
    (hbase : FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteBaseChainObjective (beta - alpha))
      (exercise42InfiniteBaseChainGradientLp (beta - alpha)) 0) :
    FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteChainObjective alpha beta)
      (exercise42InfiniteChainGradientLp alpha beta) alpha := by
  have hreg :=
    quadraticRegularizedAround_firstOrderStrongConvexOn_convex
      (delta := alpha)
      (x0 := (0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)))
      hbase
  simpa [exercise42InfiniteChainObjective_eq_quadraticRegularizedAround,
    exercise42InfiniteChainGradientLp_eq_regularizedGradient] using hreg

/--
Concrete first-order strong-convexity certificate for Chewi Exercise 4.2's
infinite hard-chain objective.
-/
theorem exercise42InfiniteChainObjective_firstOrderStrongConvexOn
    {alpha beta : ℝ} (hgamma : 0 ≤ beta - alpha) :
    FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteChainObjective alpha beta)
      (exercise42InfiniteChainGradientLp alpha beta) alpha :=
  exercise42InfiniteChainObjective_firstOrderStrongConvexOn_of_base
    (alpha := alpha) (beta := beta)
    (exercise42InfiniteBaseChainObjective_firstOrderConvex hgamma)

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
The concrete `ell^2` hard-chain gradient oracle expands prefix support by one
coordinate.
-/
theorem exercise42InfiniteChainGradientLp_mem_prefixSubmodule
    {alpha beta : ℝ}
    {x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ}
    (hx : x ∈ exercise42InfinitePrefixSubmodule N) :
    exercise42InfiniteChainGradientLp alpha beta x ∈
      exercise42InfinitePrefixSubmodule (N + 1) :=
  exercise42InfiniteChainGradient_mem_prefixSubmodule_of_apply
    (grad := exercise42InfiniteChainGradientLp alpha beta)
    (fun _ _ => rfl) hx

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

/--
Vector form of the infinite hard-chain zero-gradient calculation, for any
supplied `ell^2` gradient oracle with the Chewi coordinate formula.
-/
theorem exercise42InfiniteGeometricMinimizer_grad_eq_zero_of_apply
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hq_nonneg : 0 ≤ chewi45GeometricRatio kappa)
    (hq_lt_one : chewi45GeometricRatio kappa < 1)
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i) :
    grad (exercise42InfiniteGeometricMinimizer
      (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one) = 0 := by
  ext i
  rw [hgrad_apply]
  exact exercise42InfiniteChainGradient_geometricMinimizer_eq_zero
    halpha_pos halpha_lt_beta hkappa hq_nonneg hq_lt_one i

/--
The displayed infinite geometric profile is the concrete global minimizer of
Chewi's Exercise 4.2 hard-chain objective.
-/
theorem exercise42InfiniteGeometricMinimizer_isMinOn_concreteGradient
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha) :
    IsMinOn (exercise42InfiniteChainObjective alpha beta) Set.univ
      (exercise42InfiniteGeometricMinimizer
        (chewi45GeometricRatio kappa)
        (chewi45GeometricRatio_nonneg (kappa := kappa)
          ((by
            rw [hkappa]
            exact (one_lt_div halpha_pos).2 halpha_lt_beta :
              1 < kappa).le))
        (chewi45GeometricRatio_lt_one kappa)) := by
  have hgamma : 0 ≤ beta - alpha := by linarith
  refine
    isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero
      (exercise42InfiniteChainObjective_firstOrderStrongConvexOn
        (alpha := alpha) (beta := beta) hgamma)
      halpha_pos.le trivial ?_
  exact
    exercise42InfiniteGeometricMinimizer_grad_eq_zero_of_apply
      halpha_pos halpha_lt_beta hkappa
      (chewi45GeometricRatio_nonneg (kappa := kappa)
        ((by
          rw [hkappa]
          exact (one_lt_div halpha_pos).2 halpha_lt_beta :
            1 < kappa).le))
      (chewi45GeometricRatio_lt_one kappa)
      (grad := exercise42InfiniteChainGradientLp alpha beta)
      (by intro y i; rfl)

/--
Canonical optimum value for the concrete infinite Exercise 4.2 hard-chain
objective.  The proof arguments record the source condition-number relation
used to certify that Chewi's geometric profile is admissible.
-/
noncomputable def exercise42InfiniteChainObjectiveMinValue
    (alpha beta kappa : ℝ) (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha) : ℝ :=
  exercise42InfiniteChainObjective alpha beta
    (exercise42InfiniteGeometricMinimizer
      (chewi45GeometricRatio kappa)
      (chewi45GeometricRatio_nonneg (kappa := kappa)
        ((by
          rw [hkappa]
          exact (one_lt_div halpha_pos).2 halpha_lt_beta :
            1 < kappa).le))
      (chewi45GeometricRatio_lt_one kappa))

/--
The named Exercise 4.2 optimum value is below every concrete hard-chain value.
-/
theorem exercise42InfiniteChainObjectiveMinValue_le_concreteGradient
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (y : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    exercise42InfiniteChainObjectiveMinValue
        alpha beta kappa halpha_pos halpha_lt_beta hkappa ≤
      exercise42InfiniteChainObjective alpha beta y := by
  have hmin :=
    exercise42InfiniteGeometricMinimizer_isMinOn_concreteGradient
      halpha_pos halpha_lt_beta hkappa
  rw [isMinOn_univ_iff] at hmin
  simpa [exercise42InfiniteChainObjectiveMinValue] using hmin y

/--
First-order lower model at the infinite hard-chain minimizer.  This discharges
the formerly supplied lower-model input from `FirstOrderStrongConvexOn` and the
compiled zero-gradient coordinate formula.
-/
theorem exercise42InfiniteGeometricMinimizer_lowerModel_of_firstOrder
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hq_nonneg : 0 ≤ chewi45GeometricRatio kappa)
    (hq_lt_one : chewi45GeometricRatio kappa < 1)
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    (x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) :
    f (exercise42InfiniteGeometricMinimizer
        (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one) +
        (alpha / 2) *
          ‖x - exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one‖ ^ (2 : ℕ) ≤
      f x := by
  let z :=
    exercise42InfiniteGeometricMinimizer
      (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one
  have hgrad_zero : grad z = 0 :=
    exercise42InfiniteGeometricMinimizer_grad_eq_zero_of_apply
      halpha_pos halpha_lt_beta hkappa hq_nonneg hq_lt_one hgrad_apply
  have hmodel := hfirst.lower_model
    (x := z) (y := x) (by simp) (by simp)
  simpa [z, hgrad_zero] using hmodel

/--
Prefix-supported infinite Exercise 4.2 obstruction with the lower model
obtained from the first-order strong-convexity interface.
-/
theorem exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_firstOrder
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hq_nonneg : 0 ≤ chewi45GeometricRatio kappa)
    (hq_lt_one : chewi45GeometricRatio kappa < 1)
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)} {N : ℕ}
    (hx : exercise42InfinitePrefixSupported x N) :
    (alpha / 2) *
        (((chewi45GeometricRatio kappa) ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one‖ ^
              (2 : ℕ)) ≤
      f x - f (exercise42InfiniteGeometricMinimizer
        (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one) := by
  have hlower :=
    exercise42InfiniteGeometricMinimizer_lowerModel_of_firstOrder
      (f := f) (grad := grad)
      halpha_pos halpha_lt_beta hkappa hq_nonneg hq_lt_one
      hfirst hgrad_apply x
  exact
    exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_lowerModel
      (f := f) (alpha := alpha)
      halpha_pos.le hq_nonneg hq_lt_one hx hlower

/--
Gradient-span infinite Exercise 4.2 obstruction with the lower model discharged
from `FirstOrderStrongConvexOn`, the hard-chain gradient formula, and the
compiled prefix-support induction.
-/
theorem exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_firstOrder
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hq_nonneg : 0 ≤ chewi45GeometricRatio kappa)
    (hq_lt_one : chewi45GeometricRatio kappa < 1)
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) (N : ℕ) :
    (alpha / 2) *
        (((chewi45GeometricRatio kappa) ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one‖ ^
              (2 : ℕ)) ≤
      f (x N) - f (exercise42InfiniteGeometricMinimizer
        (chewi45GeometricRatio kappa) hq_nonneg hq_lt_one) := by
  have hx_prefix :
      exercise42InfinitePrefixSupported (x N) N :=
    exercise42InfiniteGradientSpanTrajectory_prefixSupported_of_apply
      hgrad_apply hx0 hspan N
  exact
    exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_firstOrder
      (f := f) (grad := grad)
      halpha_pos halpha_lt_beta hkappa hq_nonneg hq_lt_one
      hfirst hgrad_apply hx_prefix

/--
Source-shaped infinite Exercise 4.2 obstruction using Chewi's standard
condition-number ratio, with the ratio positivity side conditions filled in.
-/
theorem exercise42InfiniteGradientSpanTrajectory_gap_ge_geometricRatio_tail_of_firstOrder
    {f : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) -> ℝ}
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) (N : ℕ) :
    (alpha / 2) *
        (((chewi45GeometricRatio kappa) ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      f (x N) - f (exercise42InfiniteGeometricMinimizer
        (chewi45GeometricRatio kappa)
        (chewi45GeometricRatio_nonneg (kappa := kappa)
          ((by
            rw [hkappa]
            exact (one_lt_div halpha_pos).2 halpha_lt_beta :
              1 < kappa).le))
        (chewi45GeometricRatio_lt_one kappa)) := by
  exact
    exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_firstOrder
      (f := f) (grad := grad)
      halpha_pos halpha_lt_beta hkappa
      (chewi45GeometricRatio_nonneg (kappa := kappa)
        ((by
          rw [hkappa]
          exact (one_lt_div halpha_pos).2 halpha_lt_beta :
            1 < kappa).le))
      (chewi45GeometricRatio_lt_one kappa)
      hfirst hgrad_apply hx0 hspan N

/--
Concrete-objective wrapper for the infinite Exercise 4.2 obstruction.  Once
the displayed objective is supplied/proved to satisfy the first-order
strong-convexity interface with the compiled coordinate gradient, the exact
geometric lower bound follows immediately for every gradient-span trajectory.
-/
theorem exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hfirst : FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteChainObjective alpha beta) grad alpha)
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) (N : ℕ) :
    (alpha / 2) *
        (((chewi45GeometricRatio kappa) ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      exercise42InfiniteChainObjective alpha beta (x N) -
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) := by
  exact
    exercise42InfiniteGradientSpanTrajectory_gap_ge_geometricRatio_tail_of_firstOrder
      (f := exercise42InfiniteChainObjective alpha beta) (grad := grad)
      halpha_pos halpha_lt_beta hkappa hfirst hgrad_apply hx0 hspan N

/--
Infinite Exercise 4.2 geometric lower-bound to iteration-count bridge.  This
is the exact infinite analogue of the finite `alpha/8` log bridge, but keeps
the source constant `C = (alpha/2)‖x_0-x_*‖^2` abstract.
-/
theorem exercise42_iteration_count_ge_logQuotientRate_of_sq_geometric_eps_lower_bound
    {C eps q : ℝ} {N : ℕ}
    (hC_pos : 0 < C) (heps_pos : 0 < eps)
    (hq_pos : 0 < q) (hq_lt_one : q < 1)
    (hgeo : C * (q ^ (2 : ℕ)) ^ N ≤ eps) :
    Real.log (eps / C) / (2 * Real.log q) ≤ (N : ℝ) := by
  have hq_sq_pos : 0 < q ^ (2 : ℕ) := pow_pos hq_pos _
  have hpow_pos : 0 < (q ^ (2 : ℕ)) ^ N := pow_pos hq_sq_pos _
  have heps_div_pos : 0 < eps / C := div_pos heps_pos hC_pos
  have hpow_le : (q ^ (2 : ℕ)) ^ N ≤ eps / C := by
    rw [le_div_iff₀ hC_pos]
    simpa [mul_comm, mul_left_comm, mul_assoc] using hgeo
  have hlog_le :
      Real.log ((q ^ (2 : ℕ)) ^ N) ≤ Real.log (eps / C) :=
    (Real.log_le_log_iff hpow_pos heps_div_pos).2 hpow_le
  have hleft :
      (N : ℝ) * (2 * Real.log q) ≤ Real.log (eps / C) := by
    rw [Real.log_pow, Real.log_pow] at hlog_le
    simpa [Nat.cast_ofNat, mul_comm, mul_left_comm, mul_assoc] using hlog_le
  have htwo_log_neg : 2 * Real.log q < 0 := by
    have hlog_neg : Real.log q < 0 := Real.log_neg hq_pos hq_lt_one
    nlinarith
  exact (div_le_iff_of_neg htwo_log_neg).2 hleft

/--
Concrete infinite Exercise 4.2 log-quotient lower bound.  Near-minimality for
the concrete hard-chain objective, together with the first-order/gradient
package, forces the source logarithmic iteration lower bound with the exact
zero-start distance to the infinite geometric minimizer.
-/
theorem exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min
    {grad : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞) ->
        lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha)
    (hfirst : FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteChainObjective alpha beta) grad alpha)
    (hgrad_apply : ∀ y i,
      grad y i = exercise42InfiniteChainGradient alpha beta y i)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) + eps) :
    Real.log
        (eps /
          ((alpha / 2) *
            ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
              exercise42InfiniteGeometricMinimizer
                (chewi45GeometricRatio kappa)
                (chewi45GeometricRatio_nonneg (kappa := kappa)
                  ((by
                    rw [hkappa]
                    exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                      1 < kappa).le))
                (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ))) /
          (2 * Real.log (chewi45GeometricRatio kappa)) ≤
      (N : ℝ) := by
  let q := chewi45GeometricRatio kappa
  have hkappa_gt : 1 < kappa := by
    rw [hkappa]
    exact (one_lt_div halpha_pos).2 halpha_lt_beta
  let hq_nonneg : 0 ≤ q :=
    chewi45GeometricRatio_nonneg (kappa := kappa) hkappa_gt.le
  let hq_lt_one : q < 1 := chewi45GeometricRatio_lt_one kappa
  let z := exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one
  let C : ℝ :=
    (alpha / 2) *
      ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) - z‖ ^ (2 : ℕ)
  have hq_pos : 0 < q := chewi45GeometricRatio_pos hkappa_gt
  have hq_sq_lt_one : q ^ (2 : ℕ) < 1 := by
    nlinarith [sq_nonneg q, hq_pos, hq_lt_one]
  have hdist_sq_pos :
      0 <
        ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) - z‖ ^ (2 : ℕ) := by
    have hnorm_eq :
        ‖z‖ ^ (2 : ℕ) = q ^ (2 : ℕ) * (1 - q ^ (2 : ℕ))⁻¹ := by
      simpa [z, q, hq_nonneg, hq_lt_one] using
        exercise42InfiniteGeometricMinimizer_norm_sq hq_nonneg hq_lt_one
    have hden_pos : 0 < 1 - q ^ (2 : ℕ) := by
      nlinarith
    have hnorm_pos :
        0 < q ^ (2 : ℕ) * (1 - q ^ (2 : ℕ))⁻¹ :=
      mul_pos (pow_pos hq_pos _) (inv_pos.mpr hden_pos)
    rw [zero_sub, norm_neg, hnorm_eq]
    exact hnorm_pos
  have hC_pos : 0 < C := by
    dsimp [C]
    exact mul_pos (by positivity) hdist_sq_pos
  have hgap :=
    exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder
      (grad := grad) halpha_pos halpha_lt_beta hkappa
      hfirst hgrad_apply (x := x) hx0 hspan N
  have hgap_le :
      exercise42InfiniteChainObjective alpha beta (x N) -
          exercise42InfiniteChainObjective alpha beta z ≤ eps := by
    have hnear' :
        exercise42InfiniteChainObjective alpha beta (x N) ≤
          eps + exercise42InfiniteChainObjective alpha beta z := by
      simpa [z, q, hq_nonneg, hq_lt_one, add_comm] using hnear
    exact sub_le_iff_le_add.mpr hnear'
  have hgeo : C * (q ^ (2 : ℕ)) ^ N ≤ eps := by
    calc
      C * (q ^ (2 : ℕ)) ^ N =
          (alpha / 2) *
            ((q ^ (2 : ℕ)) ^ N *
              ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) - z‖ ^ (2 : ℕ)) := by
            simp [C]
            ring
      _ ≤ exercise42InfiniteChainObjective alpha beta (x N) -
          exercise42InfiniteChainObjective alpha beta z := by
            simpa [z, q, hq_nonneg, hq_lt_one] using hgap
      _ ≤ eps := hgap_le
  simpa [C, z, q, hq_nonneg, hq_lt_one] using
    exercise42_iteration_count_ge_logQuotientRate_of_sq_geometric_eps_lower_bound
      (C := C) (eps := eps) (q := q) (N := N)
      hC_pos heps_pos hq_pos hq_lt_one hgeo

/--
Concrete-gradient version of the infinite Exercise 4.2 geometric obstruction.
The only remaining supplied package is now the first-order strong-convexity
lower model for the concrete infinite quadratic objective.
-/
theorem exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder_concreteGradient
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hfirst : FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteChainObjective alpha beta)
      (exercise42InfiniteChainGradientLp alpha beta) alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ) :
    (alpha / 2) *
        (((chewi45GeometricRatio kappa) ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      exercise42InfiniteChainObjective alpha beta (x N) -
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) :=
  exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder
    (grad := exercise42InfiniteChainGradientLp alpha beta)
    halpha_pos halpha_lt_beta hkappa hfirst
    (fun _ _ => rfl) hx0 hspan N

/--
Concrete-gradient infinite Exercise 4.2 log-quotient lower bound.  This is the
current direct route to the source lower bound once the concrete objective's
first-order strong-convexity package is proved.
-/
theorem exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min_concreteGradient
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha)
    (hfirst : FirstOrderStrongConvexOn Set.univ
      (exercise42InfiniteChainObjective alpha beta)
      (exercise42InfiniteChainGradientLp alpha beta) alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) + eps) :
    Real.log
        (eps /
          ((alpha / 2) *
            ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
              exercise42InfiniteGeometricMinimizer
                (chewi45GeometricRatio kappa)
                (chewi45GeometricRatio_nonneg (kappa := kappa)
                  ((by
                    rw [hkappa]
                    exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                      1 < kappa).le))
                (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ))) /
          (2 * Real.log (chewi45GeometricRatio kappa)) ≤
      (N : ℝ) :=
  exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min
    (grad := exercise42InfiniteChainGradientLp alpha beta)
    halpha_pos heps_pos halpha_lt_beta hkappa hfirst
    (fun _ _ => rfl) hx0 hspan N hnear

/--
Fully concrete infinite Exercise 4.2 geometric obstruction for the displayed
hard-chain objective and its concrete `ell^2` gradient oracle.
-/
theorem exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_concreteGradient
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ) :
    (alpha / 2) *
        (((chewi45GeometricRatio kappa) ^ (2 : ℕ)) ^ N *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      exercise42InfiniteChainObjective alpha beta (x N) -
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) := by
  have hgamma : 0 ≤ beta - alpha := by linarith
  exact
    exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder_concreteGradient
      halpha_pos halpha_lt_beta hkappa
      (exercise42InfiniteChainObjective_firstOrderStrongConvexOn
        (alpha := alpha) (beta := beta) hgamma)
      hx0 hspan N

/--
Literal source-display form of the infinite Exercise 4.2 geometric gap:
`(q^2)^N` is rewritten as `q^(2N)`, matching the textbook statement.
-/
theorem exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_concreteGradient
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ) :
    (alpha / 2) *
        ((chewi45GeometricRatio kappa) ^ (2 * N) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      exercise42InfiniteChainObjective alpha beta (x N) -
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) := by
  let q := chewi45GeometricRatio kappa
  have hpow : (q ^ (2 : ℕ)) ^ N = (q ^ N) ^ (2 : ℕ) := by
    rw [← pow_mul, ← pow_mul]
    congr 1
    omega
  simpa [q, pow_mul, hpow, mul_comm, mul_left_comm, mul_assoc] using
    exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_concreteGradient
      halpha_pos halpha_lt_beta hkappa hx0 hspan N

/--
Same source-display lower bound, with the optimum value named as `fstar`.
This is the local formal stand-in for the textbook notation `f_*`.
-/
theorem exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_minValue_concreteGradient
    {alpha beta kappa fstar : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    (hfstar :
      fstar =
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)))
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ) :
    (alpha / 2) *
        ((chewi45GeometricRatio kappa) ^ (2 * N) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      exercise42InfiniteChainObjective alpha beta (x N) - fstar := by
  subst fstar
  exact
    exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_concreteGradient
      halpha_pos halpha_lt_beta hkappa hx0 hspan N

/--
Same source-display lower bound using the canonical Exercise 4.2 optimum-value
abbreviation, avoiding a separate `hfstar` bookkeeping hypothesis.
-/
theorem exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_optValue_concreteGradient
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ) :
    (alpha / 2) *
        ((chewi45GeometricRatio kappa) ^ (2 * N) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^
              (2 : ℕ)) ≤
      exercise42InfiniteChainObjective alpha beta (x N) -
        exercise42InfiniteChainObjectiveMinValue
          alpha beta kappa halpha_pos halpha_lt_beta hkappa := by
  exact
    exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_minValue_concreteGradient
      halpha_pos halpha_lt_beta hkappa
      (fstar :=
        exercise42InfiniteChainObjectiveMinValue
          alpha beta kappa halpha_pos halpha_lt_beta hkappa)
      (by simp [exercise42InfiniteChainObjectiveMinValue])
      hx0 hspan N

/--
Fully concrete infinite Exercise 4.2 log-quotient lower bound.  Near-minimality
for the displayed hard-chain objective forces the source logarithmic iteration
lower bound, with no remaining supplied first-order or gradient hypotheses.
-/
theorem exercise42InfiniteChainObjective_logQuotientRate_le_near_min_concreteGradient
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) + eps) :
    Real.log
        (eps /
          ((alpha / 2) *
            ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
              exercise42InfiniteGeometricMinimizer
                (chewi45GeometricRatio kappa)
                (chewi45GeometricRatio_nonneg (kappa := kappa)
                  ((by
                    rw [hkappa]
                    exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                      1 < kappa).le))
                (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ))) /
          (2 * Real.log (chewi45GeometricRatio kappa)) ≤
      (N : ℝ) := by
  have hgamma : 0 ≤ beta - alpha := by linarith
  exact
    exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min_concreteGradient
      halpha_pos heps_pos halpha_lt_beta hkappa
      (exercise42InfiniteChainObjective_firstOrderStrongConvexOn
        (alpha := alpha) (beta := beta) hgamma)
      hx0 hspan N hnear

/--
Source-shaped infinite Exercise 4.2 rate wrapper: the exact log-quotient lower
bound implies a `(sqrt(kappa)-1)` logarithmic iteration lower bound whenever
the logarithmic accuracy ratio is nonpositive.
-/
theorem exercise42InfiniteChainObjective_sqrtSubOneLogRate_le_near_min_concreteGradient
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) + eps)
    (hlog_nonpos :
      Real.log
        (eps /
          ((alpha / 2) *
            ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
              exercise42InfiniteGeometricMinimizer
                (chewi45GeometricRatio kappa)
                (chewi45GeometricRatio_nonneg (kappa := kappa)
                  ((by
                    rw [hkappa]
                    exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                      1 < kappa).le))
                (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ))) ≤ 0) :
    -((Real.sqrt kappa - 1) *
        Real.log
          (eps /
            ((alpha / 2) *
              ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
                exercise42InfiniteGeometricMinimizer
                  (chewi45GeometricRatio kappa)
                  (chewi45GeometricRatio_nonneg (kappa := kappa)
                    ((by
                      rw [hkappa]
                      exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                        1 < kappa).le))
                  (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))) / 4 ≤
      (N : ℝ) := by
  let A : ℝ :=
    Real.log
      (eps /
        ((alpha / 2) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))
  let q := chewi45GeometricRatio kappa
  have hkappa_gt : 1 < kappa := by
    rw [hkappa]
    exact (one_lt_div halpha_pos).2 halpha_lt_beta
  have hquot :
      A / (2 * Real.log q) ≤ (N : ℝ) := by
    simpa [A, q] using
      exercise42InfiniteChainObjective_logQuotientRate_le_near_min_concreteGradient
        halpha_pos heps_pos halpha_lt_beta hkappa hx0 hspan N hnear
  have hcmp :
      -((Real.sqrt kappa - 1) * A) / 4 - 1 ≤
        A / (2 * Real.log q) - 1 := by
    simpa [A, q] using
      chewi45_sqrt_sub_one_bound_le_logQuotientRate
        (kappa := kappa) (A := A) hkappa_gt (by simpa [A] using hlog_nonpos)
  nlinarith

/--
Cleaner large-condition-number Exercise 4.2 rate wrapper: for `kappa >= 4`,
the concrete infinite construction forces a `sqrt(kappa)` logarithmic lower
bound, up to the explicit harmless `-1` burn-in.
-/
theorem exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha) (hkappa_four : 4 ≤ kappa)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) + eps)
    (hlog_nonpos :
      Real.log
        (eps /
          ((alpha / 2) *
            ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
              exercise42InfiniteGeometricMinimizer
                (chewi45GeometricRatio kappa)
                (chewi45GeometricRatio_nonneg (kappa := kappa)
                  ((by
                    rw [hkappa]
                    exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                      1 < kappa).le))
                (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ))) ≤ 0) :
    -((Real.sqrt kappa / 2) *
        Real.log
          (eps /
            ((alpha / 2) *
              ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
                exercise42InfiniteGeometricMinimizer
                  (chewi45GeometricRatio kappa)
                  (chewi45GeometricRatio_nonneg (kappa := kappa)
                    ((by
                      rw [hkappa]
                      exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                        1 < kappa).le))
                  (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))) / 4 - 1 ≤
      (N : ℝ) := by
  let A : ℝ :=
    Real.log
      (eps /
        ((alpha / 2) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))
  have hsub :
      -((Real.sqrt kappa - 1) * A) / 4 ≤ (N : ℝ) := by
    simpa [A] using
      exercise42InfiniteChainObjective_sqrtSubOneLogRate_le_near_min_concreteGradient
        halpha_pos heps_pos halpha_lt_beta hkappa hx0 hspan N hnear
        (by simpa [A] using hlog_nonpos)
  have hhalf :
      -((Real.sqrt kappa / 2) * A) / 4 - 1 ≤
        -((Real.sqrt kappa - 1) * A) / 4 - 1 := by
    simpa [A] using
      chewi45_half_sqrt_rate_le_sqrt_sub_one_rate
        (kappa := kappa) (A := A) hkappa_four
        (by simpa [A] using hlog_nonpos)
  nlinarith

/-- The source initial geometric scale in the infinite Exercise 4.2 lower bound is positive. -/
theorem exercise42InfiniteGeometricInitialScale_pos
    {alpha beta kappa : ℝ} (halpha_pos : 0 < alpha)
    (halpha_lt_beta : alpha < beta) (hkappa : kappa = beta / alpha) :
    0 <
      (alpha / 2) *
        ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
          exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ) := by
  let q := chewi45GeometricRatio kappa
  have hkappa_gt : 1 < kappa := by
    rw [hkappa]
    exact (one_lt_div halpha_pos).2 halpha_lt_beta
  let hq_nonneg : 0 ≤ q :=
    chewi45GeometricRatio_nonneg (kappa := kappa) hkappa_gt.le
  let hq_lt_one : q < 1 := chewi45GeometricRatio_lt_one kappa
  let z := exercise42InfiniteGeometricMinimizer q hq_nonneg hq_lt_one
  have hq_pos : 0 < q := chewi45GeometricRatio_pos hkappa_gt
  have hq_sq_lt_one : q ^ (2 : ℕ) < 1 := by
    nlinarith [sq_nonneg q, hq_pos, hq_lt_one]
  have hdist_sq_pos :
      0 <
        ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) - z‖ ^ (2 : ℕ) := by
    have hnorm_eq :
        ‖z‖ ^ (2 : ℕ) = q ^ (2 : ℕ) * (1 - q ^ (2 : ℕ))⁻¹ := by
      simpa [z, q, hq_nonneg, hq_lt_one] using
        exercise42InfiniteGeometricMinimizer_norm_sq hq_nonneg hq_lt_one
    have hden_pos : 0 < 1 - q ^ (2 : ℕ) := by
      nlinarith
    have hnorm_pos :
        0 < q ^ (2 : ℕ) * (1 - q ^ (2 : ℕ))⁻¹ :=
      mul_pos (pow_pos hq_pos _) (inv_pos.mpr hden_pos)
    rw [zero_sub, norm_neg, hnorm_eq]
    exact hnorm_pos
  simpa [z, q, hq_nonneg, hq_lt_one] using
    mul_pos (by positivity : 0 < alpha / 2) hdist_sq_pos

/--
Small-accuracy wrapper for the infinite Exercise 4.2 `sqrt(kappa)` rate:
`eps <= (alpha/2)‖x_0-x_*‖²` discharges the logarithmic nonpositivity side
condition in the source-rate theorem.
-/
theorem exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient_of_eps_le_initialScale
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha) (hkappa_four : 4 ≤ kappa)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)) + eps)
    (heps_le_initial :
      eps ≤
        (alpha / 2) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)) :
    -((Real.sqrt kappa / 2) *
        Real.log
          (eps /
            ((alpha / 2) *
              ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
                exercise42InfiniteGeometricMinimizer
                  (chewi45GeometricRatio kappa)
                  (chewi45GeometricRatio_nonneg (kappa := kappa)
                    ((by
                      rw [hkappa]
                      exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                        1 < kappa).le))
                  (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))) / 4 - 1 ≤
      (N : ℝ) := by
  let C : ℝ :=
    (alpha / 2) *
      ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
        exercise42InfiniteGeometricMinimizer
          (chewi45GeometricRatio kappa)
          (chewi45GeometricRatio_nonneg (kappa := kappa)
            ((by
              rw [hkappa]
              exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                1 < kappa).le))
          (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)
  have hC_pos : 0 < C := by
    simpa [C] using
      exercise42InfiniteGeometricInitialScale_pos
        (alpha := alpha) (beta := beta) (kappa := kappa)
        halpha_pos halpha_lt_beta hkappa
  have hlog_nonpos : Real.log (eps / C) ≤ 0 := by
    have hratio_nonneg : 0 ≤ eps / C := by positivity
    have hratio_le_one : eps / C ≤ 1 := by
      exact (div_le_iff₀ hC_pos).2 (by simpa [C] using heps_le_initial)
    exact Real.log_nonpos hratio_nonneg hratio_le_one
  simpa [C] using
    exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient
      halpha_pos heps_pos halpha_lt_beta hkappa hkappa_four
      hx0 hspan N hnear hlog_nonpos

/--
Source-shaped Exercise 4.2 rate wrapper with the optimum value named `fstar`.
This exposes the near-minimality hypothesis in the textbook form
`f(x_N) <= f_* + eps`.
-/
theorem exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_fstar_concreteGradient
    {alpha beta kappa eps fstar : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha) (hkappa_four : 4 ≤ kappa)
    (hfstar :
      fstar =
        exercise42InfiniteChainObjective alpha beta
          (exercise42InfiniteGeometricMinimizer
            (chewi45GeometricRatio kappa)
            (chewi45GeometricRatio_nonneg (kappa := kappa)
              ((by
                rw [hkappa]
                exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                  1 < kappa).le))
            (chewi45GeometricRatio_lt_one kappa)))
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤ fstar + eps)
    (heps_le_initial :
      eps ≤
        (alpha / 2) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)) :
    -((Real.sqrt kappa / 2) *
        Real.log
          (eps /
            ((alpha / 2) *
              ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
                exercise42InfiniteGeometricMinimizer
                  (chewi45GeometricRatio kappa)
                  (chewi45GeometricRatio_nonneg (kappa := kappa)
                    ((by
                      rw [hkappa]
                      exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                        1 < kappa).le))
                  (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))) / 4 - 1 ≤
      (N : ℝ) := by
  subst fstar
  exact
    exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient_of_eps_le_initialScale
      halpha_pos heps_pos halpha_lt_beta hkappa hkappa_four
      hx0 hspan N hnear heps_le_initial

/--
Public Exercise 4.2 rate wrapper using the canonical optimum-value
abbreviation, so the near-minimality hypothesis is directly
`f(x_N) <= f_* + eps`.
-/
theorem exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_optValue_concreteGradient
    {alpha beta kappa eps : ℝ} (halpha_pos : 0 < alpha)
    (heps_pos : 0 < eps) (halpha_lt_beta : alpha < beta)
    (hkappa : kappa = beta / alpha) (hkappa_four : 4 ≤ kappa)
    {x : ℕ -> lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory
      (exercise42InfiniteChainGradientLp alpha beta) x) (N : ℕ)
    (hnear :
      exercise42InfiniteChainObjective alpha beta (x N) ≤
        exercise42InfiniteChainObjectiveMinValue
          alpha beta kappa halpha_pos halpha_lt_beta hkappa + eps)
    (heps_le_initial :
      eps ≤
        (alpha / 2) *
          ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
            exercise42InfiniteGeometricMinimizer
              (chewi45GeometricRatio kappa)
              (chewi45GeometricRatio_nonneg (kappa := kappa)
                ((by
                  rw [hkappa]
                  exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                    1 < kappa).le))
              (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)) :
    -((Real.sqrt kappa / 2) *
        Real.log
          (eps /
            ((alpha / 2) *
              ‖(0 : lp (fun _ : ℕ => ℝ) (2 : ℝ≥0∞)) -
                exercise42InfiniteGeometricMinimizer
                  (chewi45GeometricRatio kappa)
                  (chewi45GeometricRatio_nonneg (kappa := kappa)
                    ((by
                      rw [hkappa]
                      exact (one_lt_div halpha_pos).2 halpha_lt_beta :
                        1 < kappa).le))
                  (chewi45GeometricRatio_lt_one kappa)‖ ^ (2 : ℕ)))) / 4 - 1 ≤
      (N : ℝ) := by
  exact
    exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_fstar_concreteGradient
      halpha_pos heps_pos halpha_lt_beta hkappa hkappa_four
      (fstar :=
        exercise42InfiniteChainObjectiveMinValue
          alpha beta kappa halpha_pos halpha_lt_beta hkappa)
      (by simp [exercise42InfiniteChainObjectiveMinValue])
      hx0 hspan N hnear heps_le_initial

end Optimization
end StatInference
