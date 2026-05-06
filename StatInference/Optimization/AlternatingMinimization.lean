import StatInference.Optimization.Theorem37

/-!
# Chewi Chapter 11 alternating minimization

This module starts the deterministic alternating-minimization rate layer.  The
first packet proves the scalar inverse-gap algebra used at the end of Chewi
Theorem 11.4, after the block-coordinate descent estimate has reduced the
algorithm to a quadratic gap recurrence.
-/

namespace StatInference
namespace Optimization

open Finset

/-- Forward telescoping form dual to `sum_range_sub_succ`. -/
theorem sum_range_succ_sub (a : ℕ -> ℝ) (N : ℕ) :
    (∑ n ∈ Finset.range N, (a (n + 1) - a n)) = a N - a 0 := by
  calc
    (∑ n ∈ Finset.range N, (a (n + 1) - a n))
        = ∑ n ∈ Finset.range N, ((-a n) - (-a (n + 1))) := by
            refine Finset.sum_congr rfl ?_
            intro n _hn
            ring
    _ = (-a 0) - (-a N) := by
            simpa using sum_range_sub_succ (fun n => -a n) N
    _ = a N - a 0 := by ring

/--
One-step inverse-gap growth from the quadratic-descent recurrence appearing in
Chewi Theorem 11.4.
-/
theorem chewi114_inverse_gap_step_growth {K g g' : ℝ}
    (hK : 0 < K) (hg : 0 < g) (hg' : 0 < g')
    (hrec : g' ≤ g - g ^ (2 : ℕ) / K) :
    1 / K ≤ 1 / g' - 1 / g := by
  have hquad_pos : 0 < g ^ (2 : ℕ) / K :=
    div_pos (sq_pos_of_pos hg) hK
  have hg'_le_g : g' ≤ g := by nlinarith
  have hmul_le_sq : g * g' ≤ g ^ (2 : ℕ) := by
    simpa [pow_two] using mul_le_mul_of_nonneg_left hg'_le_g hg.le
  have hmain : g * g' ≤ K * (g - g') := by
    have hdrop : g ^ (2 : ℕ) ≤ K * (g - g') := by
      have h := mul_le_mul_of_nonneg_left hrec hK.le
      field_simp [hK.ne'] at h
      nlinarith
    nlinarith
  have hidentity :
      1 / g' - 1 / g = (g - g') / (g * g') := by
    field_simp [hg.ne', hg'.ne']
  rw [hidentity]
  rw [le_div_iff₀ (mul_pos hg hg')]
  rw [div_mul_eq_mul_div]
  rw [div_le_iff₀ hK]
  nlinarith

/--
Chewi Theorem 11.4 inverse-gap telescope after the quadratic-descent phase.

Here `M` is the number of post-threshold iterations and `K` is the source
constant `8 * beta * D^2 * R^2`.
-/
theorem chewi114_inverse_gap_growth_of_quadratic_descent
    {gap : ℕ -> ℝ} {K : ℝ} {n0 M : ℕ}
    (hK : 0 < K)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hrec : ∀ m, m < M ->
      gap (n0 + (m + 1)) ≤
        gap (n0 + m) - gap (n0 + m) ^ (2 : ℕ) / K) :
    (M : ℝ) / K ≤ 1 / gap (n0 + M) - 1 / gap n0 := by
  let invGap : ℕ -> ℝ := fun m => 1 / gap (n0 + m)
  have hstep : ∀ m, m < M -> 1 / K ≤ invGap (m + 1) - invGap m := by
    intro m hm
    exact chewi114_inverse_gap_step_growth
      (K := K) (g := gap (n0 + m)) (g' := gap (n0 + (m + 1)))
      hK (hpos m (Nat.le_of_lt hm)) (hpos (m + 1) (Nat.succ_le_of_lt hm))
      (hrec m hm)
  have hsum :
      (∑ m ∈ Finset.range M, (1 / K : ℝ)) ≤
        ∑ m ∈ Finset.range M, (invGap (m + 1) - invGap m) := by
    exact Finset.sum_le_sum fun m hm => hstep m (Finset.mem_range.mp hm)
  have hconst :
      (∑ m ∈ Finset.range M, (1 / K : ℝ)) = (M : ℝ) / K := by
    simp [Finset.sum_const, Finset.card_range, nsmul_eq_mul, div_eq_mul_inv]
  have htelescope :
      (∑ m ∈ Finset.range M, (invGap (m + 1) - invGap m)) =
        invGap M - invGap 0 :=
    sum_range_succ_sub invGap M
  calc
    (M : ℝ) / K = ∑ m ∈ Finset.range M, (1 / K : ℝ) := hconst.symm
    _ ≤ ∑ m ∈ Finset.range M, (invGap (m + 1) - invGap m) := hsum
    _ = invGap M - invGap 0 := htelescope
    _ = 1 / gap (n0 + M) - 1 / gap n0 := by simp [invGap]

/--
Closed source-facing post-threshold rate from the inverse-gap telescope:
`gap_{n0+M} <= K / M`.
-/
theorem chewi114_gap_le_K_div_iterations_of_quadratic_descent
    {gap : ℕ -> ℝ} {K : ℝ} {n0 M : ℕ}
    (hK : 0 < K) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hrec : ∀ m, m < M ->
      gap (n0 + (m + 1)) ≤
        gap (n0 + m) - gap (n0 + m) ^ (2 : ℕ) / K) :
    gap (n0 + M) ≤ K / (M : ℝ) := by
  have hgrowth :=
    chewi114_inverse_gap_growth_of_quadratic_descent
      (gap := gap) (K := K) (n0 := n0) (M := M) hK hpos hrec
  have hM_pos_nat : 0 < M := Nat.pos_of_ne_zero hM
  have hM_pos : 0 < (M : ℝ) := by exact_mod_cast hM_pos_nat
  have hgapN_pos : 0 < gap (n0 + M) := hpos M le_rfl
  have hgap0_pos : 0 < gap n0 := by
    simpa using hpos 0 (Nat.zero_le M)
  have hdiff_le_inv :
      1 / gap (n0 + M) - 1 / gap n0 ≤ 1 / gap (n0 + M) := by
    have hnonneg : 0 ≤ 1 / gap n0 := by positivity
    nlinarith
  have hMK_le_inv : (M : ℝ) / K ≤ 1 / gap (n0 + M) :=
    hgrowth.trans hdiff_le_inv
  have hMK_le_inv' := hMK_le_inv
  field_simp [hK.ne', hgapN_pos.ne'] at hMK_le_inv'
  rw [le_div_iff₀ hM_pos]
  nlinarith

/--
Accuracy wrapper for the post-threshold phase of Chewi Theorem 11.4.
-/
theorem chewi114_gap_le_eps_of_quadratic_descent
    {gap : ℕ -> ℝ} {K eps : ℝ} {n0 M : ℕ}
    (hK : 0 < K) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hrec : ∀ m, m < M ->
      gap (n0 + (m + 1)) ≤
        gap (n0 + m) - gap (n0 + m) ^ (2 : ℕ) / K)
    (hK_div_le : K / (M : ℝ) ≤ eps) :
    gap (n0 + M) ≤ eps :=
  (chewi114_gap_le_K_div_iterations_of_quadratic_descent
    (gap := gap) (K := K) (n0 := n0) (M := M)
    hK hM hpos hrec).trans hK_div_le

/--
Chewi Theorem 11.4 scalar bridge from the source recurrence involving
`g' ^ 2` to the post-threshold recurrence involving `g ^ 2`.

Here `A = 2 * beta * D^2 * R^2` and `K = 4 * A`.
-/
theorem chewi114_quadratic_descent_of_next_gap_sq {A K g g' : ℝ}
    (hA : 0 < A) (hK_eq : K = 4 * A)
    (hg_nonneg : 0 ≤ g) (hhalf : g / 2 ≤ g')
    (hsource : g' - g ≤ -g' ^ (2 : ℕ) / A) :
    g' ≤ g - g ^ (2 : ℕ) / K := by
  have hg'_nonneg : 0 ≤ g' := by nlinarith
  have hsq_le : g ^ (2 : ℕ) ≤ (2 * g') ^ (2 : ℕ) :=
    (sq_le_sq₀ hg_nonneg (by nlinarith)).mpr (by nlinarith)
  have hsq4 : g ^ (2 : ℕ) ≤ 4 * g' ^ (2 : ℕ) := by
    nlinarith
  have hdiv : g ^ (2 : ℕ) / (4 * A) ≤ g' ^ (2 : ℕ) / A := by
    have h4A : 0 < 4 * A := by nlinarith
    rw [div_le_iff₀ h4A]
    field_simp [hA.ne']
    nlinarith
  have hsource' : g' ≤ g - g' ^ (2 : ℕ) / A := by
    calc
      g' = (g' - g) + g := by ring
      _ ≤ -g' ^ (2 : ℕ) / A + g := by
        simpa [add_comm, add_left_comm, add_assoc] using add_le_add_right hsource g
      _ = g - g' ^ (2 : ℕ) / A := by ring
  rw [hK_eq]
  exact hsource'.trans (sub_le_sub_left hdiv g)

/--
Sequence form of the threshold implication in Chewi Theorem 11.4.
-/
theorem chewi114_quadratic_descent_recurrence_of_source
    {gap : ℕ -> ℝ} {A K : ℝ} {n0 M : ℕ}
    (hA : 0 < A) (hK_eq : K = 4 * A)
    (hgap_nonneg : ∀ m, m ≤ M -> 0 ≤ gap (n0 + m))
    (hhalf : ∀ m, m < M -> gap (n0 + m) / 2 ≤ gap (n0 + (m + 1)))
    (hsource : ∀ m, m < M ->
      gap (n0 + (m + 1)) - gap (n0 + m) ≤
        -gap (n0 + (m + 1)) ^ (2 : ℕ) / A) :
    ∀ m, m < M ->
      gap (n0 + (m + 1)) ≤
        gap (n0 + m) - gap (n0 + m) ^ (2 : ℕ) / K := by
  intro m hm
  exact chewi114_quadratic_descent_of_next_gap_sq
    (A := A) (K := K) (g := gap (n0 + m))
    (g' := gap (n0 + (m + 1))) hA hK_eq
    (hgap_nonneg m (Nat.le_of_lt hm)) (hhalf m hm) (hsource m hm)

/--
Theorem 11.4 post-threshold rate directly from the source one-step recurrence
and the half-gap condition.
-/
theorem chewi114_gap_le_K_div_iterations_of_source_recurrence
    {gap : ℕ -> ℝ} {A K : ℝ} {n0 M : ℕ}
    (hA : 0 < A) (hK_eq : K = 4 * A) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hhalf : ∀ m, m < M -> gap (n0 + m) / 2 ≤ gap (n0 + (m + 1)))
    (hsource : ∀ m, m < M ->
      gap (n0 + (m + 1)) - gap (n0 + m) ≤
        -gap (n0 + (m + 1)) ^ (2 : ℕ) / A) :
    gap (n0 + M) ≤ K / (M : ℝ) := by
  have hK_pos : 0 < K := by
    rw [hK_eq]
    nlinarith
  have hrec :=
    chewi114_quadratic_descent_recurrence_of_source
      (gap := gap) (A := A) (K := K) (n0 := n0) (M := M)
      hA hK_eq (fun m hm => (hpos m hm).le) hhalf hsource
  exact chewi114_gap_le_K_div_iterations_of_quadratic_descent
    (gap := gap) (K := K) (n0 := n0) (M := M)
    hK_pos hM hpos hrec

/-- Source denominator `2 * beta * D^2 * R^2` in Chewi Theorem 11.4. -/
def chewi114A (beta : ℝ) (D : ℕ) (R : ℝ) : ℝ :=
  2 * beta * (D : ℝ) ^ (2 : ℕ) * R ^ (2 : ℕ)

/-- Source constant in the post-threshold recurrence of Chewi Theorem 11.4. -/
def chewi114K (beta : ℝ) (D : ℕ) (R : ℝ) : ℝ :=
  8 * beta * (D : ℝ) ^ (2 : ℕ) * R ^ (2 : ℕ)

/-- The source constants satisfy `K = 4 * A`. -/
theorem chewi114K_eq_four_chewi114A (beta : ℝ) (D : ℕ) (R : ℝ) :
    chewi114K beta D R = 4 * chewi114A beta D R := by
  simp [chewi114K, chewi114A]
  ring

/--
The source-shaped Theorem 11.4 post-threshold rate, using
`K = 8 * beta * D^2 * R^2`.
-/
theorem chewi114_gap_le_source_K_div_iterations
    {gap : ℕ -> ℝ} {beta R : ℝ} {D n0 M : ℕ}
    (hK : 0 < chewi114K beta D R) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hrec : ∀ m, m < M ->
      gap (n0 + (m + 1)) ≤
        gap (n0 + m) - gap (n0 + m) ^ (2 : ℕ) / chewi114K beta D R) :
    gap (n0 + M) ≤ chewi114K beta D R / (M : ℝ) :=
  chewi114_gap_le_K_div_iterations_of_quadratic_descent
    (gap := gap) (K := chewi114K beta D R) (n0 := n0) (M := M)
    hK hM hpos hrec

/--
Source-shaped post-threshold Theorem 11.4 rate from the displayed recurrence
with denominator `2 * beta * D^2 * R^2` plus the half-gap condition.
-/
theorem chewi114_gap_le_source_K_div_iterations_of_source_recurrence
    {gap : ℕ -> ℝ} {beta R : ℝ} {D n0 M : ℕ}
    (hA : 0 < chewi114A beta D R) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hhalf : ∀ m, m < M -> gap (n0 + m) / 2 ≤ gap (n0 + (m + 1)))
    (hsource : ∀ m, m < M ->
      gap (n0 + (m + 1)) - gap (n0 + m) ≤
        -gap (n0 + (m + 1)) ^ (2 : ℕ) / chewi114A beta D R) :
    gap (n0 + M) ≤ chewi114K beta D R / (M : ℝ) :=
  chewi114_gap_le_K_div_iterations_of_source_recurrence
    (gap := gap) (A := chewi114A beta D R) (K := chewi114K beta D R)
    (n0 := n0) (M := M) hA
    (chewi114K_eq_four_chewi114A beta D R) hM hpos hhalf hsource

/--
Epsilon form of the source-shaped post-threshold Theorem 11.4 rate.
-/
theorem chewi114_gap_le_eps_of_source_recurrence
    {gap : ℕ -> ℝ} {beta R eps : ℝ} {D n0 M : ℕ}
    (hA : 0 < chewi114A beta D R) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < gap (n0 + m))
    (hhalf : ∀ m, m < M -> gap (n0 + m) / 2 ≤ gap (n0 + (m + 1)))
    (hsource : ∀ m, m < M ->
      gap (n0 + (m + 1)) - gap (n0 + m) ≤
        -gap (n0 + (m + 1)) ^ (2 : ℕ) / chewi114A beta D R)
    (hK_div_le : chewi114K beta D R / (M : ℝ) ≤ eps) :
    gap (n0 + M) ≤ eps :=
  (chewi114_gap_le_source_K_div_iterations_of_source_recurrence
    (gap := gap) (beta := beta) (R := R) (D := D)
    (n0 := n0) (M := M) hA hM hpos hhalf hsource).trans hK_div_le

end Optimization
end StatInference
