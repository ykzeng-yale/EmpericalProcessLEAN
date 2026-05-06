import StatInference.Optimization.MirrorDescent

/-!
# Chewi Chapter 11 alternating Bregman projections

This module starts the Chapter 11 alternating-projection lane.  The first
packet proves the finite, source-shaped content behind Lemma 11.2: a
Pythagorean Bregman projection certificate gives a one-cycle decrease, which
telescopes over alternating Bregman projections.
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Source-shaped Bregman projection certificate.

The `pythagorean` field is Exercise 10.1 in the orientation used in Chewi
Lemma 11.2:
`D_phi(z, base) >= D_phi(z, proj) + D_phi(proj, base)`.
-/
structure IsBregmanProjectionStep
    (C : Set E) (phi : E -> ℝ) (gradPhi : E -> E)
    (base proj : E) : Prop where
  mem : proj ∈ C
  divergence_nonneg : 0 ≤ bregmanDivergence phi gradPhi proj base
  pythagorean : ∀ ⦃z : E⦄, z ∈ C ->
    bregmanDivergence phi gradPhi z proj +
        bregmanDivergence phi gradPhi proj base ≤
      bregmanDivergence phi gradPhi z base

/--
ABP trajectory:
`x_{n+1}` is the Bregman projection of `y_n` onto `C₁`, and `y_{n+1}` is the
Bregman projection of `x_{n+1}` onto `C₂`.
-/
structure IsAlternatingBregmanProjectionTrajectory
    (C₁ C₂ : Set E) (phi : E -> ℝ) (gradPhi : E -> E)
    (x y : ℕ -> E) : Prop where
  x_step : ∀ n, IsBregmanProjectionStep C₁ phi gradPhi (y n) (x (n + 1))
  y_step : ∀ n, IsBregmanProjectionStep C₂ phi gradPhi (x (n + 1)) (y (n + 1))

theorem IsAlternatingBregmanProjectionTrajectory.x_mem_succ
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (n : ℕ) :
    x (n + 1) ∈ C₁ :=
  (htraj.x_step n).mem

theorem IsAlternatingBregmanProjectionTrajectory.y_mem_succ
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (n : ℕ) :
    y (n + 1) ∈ C₂ :=
  (htraj.y_step n).mem

/--
First half of the monotonicity chain in Lemma 11.2:
`D_phi(x_*, x_{n+1}) <= D_phi(x_*, y_n)`.
-/
theorem alternatingBregmanProjection_star_x_le_star_y
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) :
    bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
      bregmanDivergence phi gradPhi xStar (y n) := by
  have hpyth := (htraj.x_step n).pythagorean hxStar₁
  have hnonneg := (htraj.x_step n).divergence_nonneg
  nlinarith

/--
Second half of the monotonicity chain in Lemma 11.2:
`D_phi(x_*, y_{n+1}) <= D_phi(x_*, x_{n+1})`.
-/
theorem alternatingBregmanProjection_star_y_succ_le_star_x
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y (n + 1)) ≤
      bregmanDivergence phi gradPhi xStar (x (n + 1)) := by
  have hpyth := (htraj.y_step n).pythagorean hxStar₂
  have hnonneg := (htraj.y_step n).divergence_nonneg
  nlinarith

/-- The two monotonicity halves imply `D_phi(x_*, y_{n+1}) <= D_phi(x_*, y_n)`. -/
theorem alternatingBregmanProjection_star_y_succ_le_star_y
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y (n + 1)) ≤
      bregmanDivergence phi gradPhi xStar (y n) :=
  (alternatingBregmanProjection_star_y_succ_le_star_x n htraj hxStar₂).trans
    (alternatingBregmanProjection_star_x_le_star_y n htraj hxStar₁)

/--
One ABP cycle decrease.  This is the finite one-step inequality that
telescopes in Chewi Lemma 11.2.
-/
theorem alternatingBregmanProjection_cycle_decrease
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y (n + 1)) +
        (bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
          bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))) ≤
      bregmanDivergence phi gradPhi xStar (y n) := by
  have hx := (htraj.x_step n).pythagorean hxStar₁
  have hy := (htraj.y_step n).pythagorean hxStar₂
  nlinarith

/--
Finite Lemma 11.2 telescope with the terminal Bregman term retained.
-/
theorem chewi112_finite_sum_with_terminal_le
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (N : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y N) +
        (∑ n ∈ Finset.range N,
          (bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
            bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1)))) ≤
      bregmanDivergence phi gradPhi xStar (y 0) := by
  let D : ℕ -> ℝ := fun n => bregmanDivergence phi gradPhi xStar (y n)
  let gap : ℕ -> ℝ := fun n =>
    bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
      bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))
  have hstep : ∀ n, n < N -> gap n ≤ D n - D (n + 1) := by
    intro n _hn
    have hcycle :=
      alternatingBregmanProjection_cycle_decrease
        (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
        (x := x) (y := y) (xStar := xStar)
        n htraj hxStar₁ hxStar₂
    dsimp [D, gap] at hcycle ⊢
    nlinarith
  have hsum :
      (∑ n ∈ Finset.range N, gap n) ≤
        ∑ n ∈ Finset.range N, (D n - D (n + 1)) := by
    exact Finset.sum_le_sum fun n hn => hstep n (Finset.mem_range.mp hn)
  have hsum_bound :
      (∑ n ∈ Finset.range N, gap n) ≤ D 0 - D N := by
    calc
      (∑ n ∈ Finset.range N, gap n)
          ≤ ∑ n ∈ Finset.range N, (D n - D (n + 1)) := hsum
      _ = D 0 - D N := by
          simpa using sum_range_sub_succ D N
  dsimp [D, gap] at hsum_bound ⊢
  nlinarith

/--
Finite Lemma 11.2 in the displayed summability orientation, with the terminal
Bregman term discharged separately.
-/
theorem chewi112_finite_sum_le
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (N : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N)) :
    (∑ n ∈ Finset.range N,
      (bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
        bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1)))) ≤
      bregmanDivergence phi gradPhi xStar (y 0) := by
  have hmain :=
    chewi112_finite_sum_with_terminal_le
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) N htraj hxStar₁ hxStar₂
  nlinarith

/--
Chewi display `(11.1)` in existential finite-minimum form.
-/
theorem chewi113_exists_small_abp_cycle_gap
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} {N : ℕ}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N))
    (hN : N ≠ 0) :
    ∃ n, n < N ∧
      bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
          bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ) := by
  let gap : ℕ -> ℝ := fun n =>
    bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
      bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))
  have hsum :=
    chewi112_finite_sum_le
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) N
      htraj hxStar₁ hxStar₂ hterminal_nonneg
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  have hsum_avg :
      (∑ n ∈ Finset.range N, gap n) ≤
        (N : ℝ) * (bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ)) := by
    have hmul :
        (N : ℝ) *
            (bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ)) =
          bregmanDivergence phi gradPhi xStar (y 0) := by
      field_simp [hN_pos.ne']
    simpa [gap, hmul] using hsum
  simpa [gap] using
    exists_le_average_of_sum_le
      (a := gap) (N := N)
      (B := bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ))
      hN hsum_avg

end Optimization
end StatInference
