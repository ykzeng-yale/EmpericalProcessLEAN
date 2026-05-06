import StatInference.Optimization.Bregman
import StatInference.Optimization.Proximal

/-!
# Chewi Chapter 10 mirror descent layer

This module starts the MPGD/OMD theorem lane.  The first packet proves Chewi
Theorem 10.9's one-step inequality in supplied-interface form: the MPGD update
is represented by the relative-growth certificate for the local mirror model,
and the proof reuses the relative lower/upper model wrappers from
`Bregman.lean`.
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The local mirror proximal-gradient model from Chewi `(MPGD)`. -/
noncomputable def mirrorProximalGradientModel
    (f g : E -> ℝ) (gradF : E -> E)
    (phi : E -> ℝ) (gradPhi : E -> E)
    (h : ℝ) (x z : E) : ℝ :=
  f x + inner ℝ (gradF x) (z - x) + g z +
    (1 / h) * bregmanDivergence phi gradPhi z x

/--
Source-shaped certificate that `xPlus` is one MPGD step from `x`.

The growth field is the line in Chewi's proof of Theorem 10.9:
`psi_x(y) >= psi_x(x+) + (alpha_g + 1/h) D_phi(y,x+)`.
-/
structure IsMirrorProximalGradientStep
    (C : Set E) (f g : E -> ℝ) (gradF : E -> E)
    (phi : E -> ℝ) (gradPhi : E -> E)
    (alphaG h : ℝ) (x xPlus : E) : Prop where
  mem_start : x ∈ C
  mem_next : xPlus ∈ C
  growth : ∀ ⦃y : E⦄, y ∈ C ->
    mirrorProximalGradientModel f g gradF phi gradPhi h x xPlus +
        (alphaG + 1 / h) * bregmanDivergence phi gradPhi y xPlus ≤
      mirrorProximalGradientModel f g gradF phi gradPhi h x y

theorem mirrorProximalGradientModel_le_composite_add_bregman
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E} {alphaF h : ℝ} {x y : E}
    (hrel : RelativelyStrongConvexOn C f gradF phi gradPhi alphaF)
    (hx : x ∈ C) (hy : y ∈ C) :
    mirrorProximalGradientModel f g gradF phi gradPhi h x y ≤
      compositeObjective f g y +
        (1 / h - alphaF) * bregmanDivergence phi gradPhi y x := by
  have hmodel := hrel.lower_model hy hx
  unfold mirrorProximalGradientModel compositeObjective
  nlinarith

theorem composite_le_mirrorProximalGradientModel
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E} {betaF h : ℝ} {x xPlus : E}
    (hsmooth : RelativelySmoothOn C f gradF phi gradPhi betaF)
    (hx : x ∈ C) (hxPlus : xPlus ∈ C)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1)
    (hD_nonneg : 0 ≤ bregmanDivergence phi gradPhi xPlus x) :
    compositeObjective f g xPlus ≤
      mirrorProximalGradientModel f g gradF phi gradPhi h x xPlus := by
  have hsmooth_model := hsmooth.upper_model hxPlus hx
  have hbeta_le_inv : betaF ≤ 1 / h :=
    (le_div_iff₀ hh).2 (by simpa using hbeta_step)
  have hcoeff_nonneg : 0 ≤ 1 / h - betaF := by
    nlinarith
  have hquad :
      0 ≤ (1 / h - betaF) * bregmanDivergence phi gradPhi xPlus x :=
    mul_nonneg hcoeff_nonneg hD_nonneg
  unfold mirrorProximalGradientModel compositeObjective at *
  nlinarith

/--
Chewi Theorem 10.9, one-step MPGD inequality, in supplied-interface form.
-/
theorem mirrorProximalGradient_oneStep_ineq
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {alphaF alphaG betaF h : ℝ} {x xPlus y : E}
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi alphaF)
    (hsmoothF : RelativelySmoothOn C f gradF phi gradPhi betaF)
    (hstep : IsMirrorProximalGradientStep C f g gradF phi gradPhi alphaG h x xPlus)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1)
    (hD_next_nonneg : 0 ≤ bregmanDivergence phi gradPhi xPlus x)
    (hy : y ∈ C) :
    (1 + alphaG * h) * bregmanDivergence phi gradPhi y xPlus ≤
      (1 - alphaF * h) * bregmanDivergence phi gradPhi y x -
        h * (compositeObjective f g xPlus - compositeObjective f g y) := by
  have hgrowth := hstep.growth hy
  have hmodel_y :
      mirrorProximalGradientModel f g gradF phi gradPhi h x y ≤
        compositeObjective f g y +
          (1 / h - alphaF) * bregmanDivergence phi gradPhi y x :=
    mirrorProximalGradientModel_le_composite_add_bregman
      hconvF hstep.mem_start hy
  have hmodel_next :
      compositeObjective f g xPlus ≤
        mirrorProximalGradientModel f g gradF phi gradPhi h x xPlus :=
    composite_le_mirrorProximalGradientModel
      hsmoothF hstep.mem_start hstep.mem_next hh hbeta_step hD_next_nonneg
  have hcore :
      (alphaG + 1 / h) * bregmanDivergence phi gradPhi y xPlus ≤
        compositeObjective f g y +
          (1 / h - alphaF) * bregmanDivergence phi gradPhi y x -
            compositeObjective f g xPlus := by
    nlinarith
  have hmul := mul_le_mul_of_nonneg_left hcore hh.le (a := h)
  have hleft :
      h * ((alphaG + 1 / h) * bregmanDivergence phi gradPhi y xPlus) =
        (1 + alphaG * h) * bregmanDivergence phi gradPhi y xPlus := by
    field_simp [hh.ne']
    ring
  have hright :
      h *
          (compositeObjective f g y +
            (1 / h - alphaF) * bregmanDivergence phi gradPhi y x -
              compositeObjective f g xPlus) =
        (1 - alphaF * h) * bregmanDivergence phi gradPhi y x -
          h * (compositeObjective f g xPlus - compositeObjective f g y) := by
    field_simp [hh.ne']
    ring
  rw [hleft, hright] at hmul
  exact hmul

/--
The descent corollary in Chewi's proof of Theorem 10.9, obtained by taking
`y = x` in the one-step inequality.
-/
theorem mirrorProximalGradient_descent
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {alphaF alphaG betaF h : ℝ} {x xPlus : E}
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi alphaF)
    (hsmoothF : RelativelySmoothOn C f gradF phi gradPhi betaF)
    (hstep : IsMirrorProximalGradientStep C f g gradF phi gradPhi alphaG h x xPlus)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1)
    (hD_next_nonneg : 0 ≤ bregmanDivergence phi gradPhi xPlus x) :
    h * (compositeObjective f g xPlus - compositeObjective f g x) ≤
      - (1 + alphaG * h) * bregmanDivergence phi gradPhi x xPlus := by
  have hone :=
    mirrorProximalGradient_oneStep_ineq
      (C := C) (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (alphaF := alphaF) (alphaG := alphaG) (betaF := betaF)
      (h := h) (x := x) (xPlus := xPlus) (y := x)
      hconvF hsmoothF hstep hh hbeta_step hD_next_nonneg hstep.mem_start
  have hstep' := hone
  simp [bregmanDivergence_self] at hstep'
  nlinarith

/-- Source-shaped MPGD trajectory interface. -/
def IsMirrorProximalGradientTrajectory
    (C : Set E) (f g : E -> ℝ) (gradF : E -> E)
    (phi : E -> ℝ) (gradPhi : E -> E)
    (alphaG h : ℝ) (x : ℕ -> E) : Prop :=
  ∀ n, IsMirrorProximalGradientStep C f g gradF phi gradPhi alphaG h
    (x n) (x (n + 1))

theorem IsMirrorProximalGradientTrajectory.step
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {alphaG h : ℝ} {x : ℕ -> E}
    (htraj : IsMirrorProximalGradientTrajectory C f g gradF phi gradPhi alphaG h x)
    (n : ℕ) :
    IsMirrorProximalGradientStep C f g gradF phi gradPhi alphaG h
      (x n) (x (n + 1)) :=
  htraj n

theorem IsMirrorProximalGradientTrajectory.mem
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {alphaG h : ℝ} {x : ℕ -> E}
    (htraj : IsMirrorProximalGradientTrajectory C f g gradF phi gradPhi alphaG h x)
    (n : ℕ) :
    x n ∈ C := by
  cases n with
  | zero => exact (htraj 0).mem_start
  | succ n => exact (htraj n).mem_next

theorem IsMirrorProximalGradientTrajectory.oneStep_ineq
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {alphaF alphaG betaF h : ℝ} {x : ℕ -> E} {y : E}
    (htraj : IsMirrorProximalGradientTrajectory C f g gradF phi gradPhi alphaG h x)
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi alphaF)
    (hsmoothF : RelativelySmoothOn C f gradF phi gradPhi betaF)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1)
    (hD_next_nonneg : ∀ n, 0 ≤ bregmanDivergence phi gradPhi (x (n + 1)) (x n))
    (hy : y ∈ C) (n : ℕ) :
    (1 + alphaG * h) * bregmanDivergence phi gradPhi y (x (n + 1)) ≤
      (1 - alphaF * h) * bregmanDivergence phi gradPhi y (x n) -
        h * (compositeObjective f g (x (n + 1)) - compositeObjective f g y) :=
  mirrorProximalGradient_oneStep_ineq
    hconvF hsmoothF (htraj.step n) hh hbeta_step (hD_next_nonneg n) hy

/--
Generic weighted-sum consequence for the MPGD-style recurrence
`u_{n+1} <= A u_n - rho * gap_{n+1}`.

This is the Chapter 10 variant of the scalar post-Gronwall step in Theorem
3.4, with a single `rho` rather than the Euclidean `2*h` coefficient.
-/
theorem weightedSumBound_of_gronwall_negative_forcing_one
    {A rho : ℝ} (hA : 0 ≤ A) (u gap : ℕ -> ℝ) (N : ℕ)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1)) :
    rho *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      A ^ N * u 0 := by
  have hmain :=
    weightedSumBound_of_gronwall_negative_forcing
      (A := A) (h := rho / 2) hA u gap N huN_nonneg
      (by
        intro n hn
        have h := hrec n hn
        calc
          u (n + 1) ≤ A * u n - rho * gap (n + 1) := h
          _ = A * u n - 2 * (rho / 2) * gap (n + 1) := by ring)
  have hleft :
      rho * (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) =
        2 * (rho / 2) *
          (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) := by
    ring
  rw [hleft]
  exact hmain

/--
Finite weighted-denominator final-gap bound for the MPGD scalar recurrence.
-/
theorem finalGap_le_weighted_denominator_of_one_step
    {A rho : ℝ} (hA : 0 ≤ A) (hrho : 0 < rho)
    (u gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1))
    (hmono : ∀ n, n < N -> gap N ≤ gap (n + 1)) :
    gap N ≤
      (A ^ N * u 0) /
        (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
  let weights : ℝ := ∑ n ∈ Finset.range N, A ^ (N - 1 - n)
  have hweights_pos : 0 < weights := by
    simpa [weights] using geometricWeights_sum_pos (A := A) hA hN
  have hden_pos : 0 < rho * weights := mul_pos hrho hweights_pos
  have hupper :=
    weightedSumBound_of_gronwall_negative_forcing_one
      (A := A) (rho := rho) hA u gap N huN_nonneg hrec
  have hsum_le :
      weights * gap N ≤
        ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1) := by
    rw [Finset.sum_mul]
    refine Finset.sum_le_sum ?_
    intro n hn
    exact mul_le_mul_of_nonneg_left
      (hmono n (Finset.mem_range.mp hn)) (pow_nonneg hA _)
  have hlower :
      rho * (weights * gap N) ≤
        rho *
          (∑ n ∈ Finset.range N,
            A ^ (N - 1 - n) * gap (n + 1)) :=
    mul_le_mul_of_nonneg_left hsum_le hrho.le
  have hmain : rho * (weights * gap N) ≤ A ^ N * u 0 :=
    hlower.trans (by simpa [weights] using hupper)
  have hmul : gap N * (rho * weights) ≤ A ^ N * u 0 := by
    calc
      gap N * (rho * weights) = rho * (weights * gap N) := by ring
      _ ≤ A ^ N * u 0 := hmain
  exact (le_div_iff₀ hden_pos).2 hmul

/--
Closed geometric-denominator form for the MPGD scalar recurrence.

If `A = 1 - total * rho`, this rewrites the finite geometric denominator as
`total / ((A^N)⁻¹ - 1)`, matching Chewi Theorem 10.9.
-/
theorem finalGap_le_geometric_denominator_of_one_step
    {A rho total : ℝ} (htotal : 0 < total) (hrho : 0 < rho)
    (hA_pos : 0 < A) (hA_eq : A = 1 - total * rho)
    (u gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1))
    (hmono : ∀ n, n < N -> gap N ≤ gap (n + 1)) :
    gap N ≤ total / ((A ^ N)⁻¹ - 1) * u 0 := by
  have hA_nonneg : 0 ≤ A := hA_pos.le
  have hA_lt_one : A < 1 := by
    rw [hA_eq]
    have hmul_pos : 0 < total * rho := mul_pos htotal hrho
    nlinarith
  have hA_ne_one : A ≠ 1 := ne_of_lt hA_lt_one
  have hA_pow_pos : 0 < A ^ N := pow_pos hA_pos N
  have hA_pow_ne : A ^ N ≠ 0 := hA_pow_pos.ne'
  have hA_pow_lt_one : A ^ N < 1 :=
    pow_lt_one₀ hA_nonneg hA_lt_one hN
  have hone_sub_pow_ne : 1 - A ^ N ≠ 0 := by
    nlinarith
  have hfinite :=
    finalGap_le_weighted_denominator_of_one_step
      (A := A) (rho := rho) hA_nonneg hrho u gap hN
      huN_nonneg hrec hmono
  have hsum :
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) =
        (1 - A ^ N) / (1 - A) :=
    geometricWeights_sum_eq_div hA_ne_one N
  have hone_sub_A : 1 - A = total * rho := by
    rw [hA_eq]
    ring
  have hrhs :
      (A ^ N * u 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) =
        total / ((A ^ N)⁻¹ - 1) * u 0 := by
    rw [hsum, hone_sub_A]
    field_simp [htotal.ne', hrho.ne', hA_pow_ne, hone_sub_pow_ne]
  exact hfinite.trans_eq hrhs

/-- Chewi's Chapter 10 contraction factor `λ_h`. -/
noncomputable def chewi109Lambda (alphaF alphaG h : ℝ) : ℝ :=
  (1 - alphaF * h) / (1 + alphaG * h)

/-- Chewi's effective recurrence coefficient after dividing by `1+alpha_g h`. -/
noncomputable def chewi109Rho (alphaG h : ℝ) : ℝ :=
  h / (1 + alphaG * h)

/--
Chewi Theorem 10.9 final MPGD rate, supplied with the one-step inequality and
monotone composite gaps.
-/
theorem chewi109_final_gap_le_geometric_denominator_of_oneStep
    {F phi : E -> ℝ} {gradPhi : E -> E} {x : ℕ -> E} {xStar : E}
    {alphaF alphaG h : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    {N : ℕ} (hN : N ≠ 0)
    (hD_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N))
    (hone_step : ∀ n,
      (1 + alphaG * h) * bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
        (1 - alphaF * h) * bregmanDivergence phi gradPhi xStar (x n) -
          h * (F (x (n + 1)) - F xStar))
    (hmono : ∀ n, n < N ->
      F (x N) - F xStar ≤ F (x (n + 1)) - F xStar) :
    F (x N) - F xStar ≤
      (alphaF + alphaG) /
        (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) *
          bregmanDivergence phi gradPhi xStar (x 0) := by
  let A : ℝ := chewi109Lambda alphaF alphaG h
  let rho : ℝ := chewi109Rho alphaG h
  let u : ℕ -> ℝ := fun n => bregmanDivergence phi gradPhi xStar (x n)
  let gap : ℕ -> ℝ := fun n => F (x n) - F xStar
  have hrho_pos : 0 < rho := by
    exact div_pos hh hden_pos
  have hA_eq : A = 1 - (alphaF + alphaG) * rho := by
    have hden_ne_comm : 1 + h * alphaG ≠ 0 := by
      nlinarith [hden_pos]
    dsimp [A, rho, chewi109Lambda, chewi109Rho]
    field_simp [hden_pos.ne', hden_ne_comm]
    ring
  have hrec : ∀ n, n < N -> u (n + 1) ≤ A * u n - rho * gap (n + 1) := by
    intro n hn
    have hstep := hone_step n
    have hdiv :
        u (n + 1) ≤
          ((1 - alphaF * h) * u n - h * gap (n + 1)) /
            (1 + alphaG * h) := by
      have hstep' :
          u (n + 1) * (1 + alphaG * h) ≤
            (1 - alphaF * h) * u n - h * gap (n + 1) := by
        simpa [u, gap, mul_comm, mul_left_comm, mul_assoc] using hstep
      exact (le_div_iff₀ hden_pos).2 hstep'
    calc
      u (n + 1) ≤
          ((1 - alphaF * h) * u n - h * gap (n + 1)) /
            (1 + alphaG * h) := hdiv
      _ = A * u n - rho * gap (n + 1) := by
          dsimp [A, rho, chewi109Lambda, chewi109Rho]
          field_simp [hden_pos.ne']
  have hbound :=
    finalGap_le_geometric_denominator_of_one_step
      (A := A) (rho := rho) (total := alphaF + alphaG)
      htotal_pos hrho_pos (by simpa [A] using hlambda_pos) hA_eq
      u gap hN (by simpa [u] using hD_nonneg) hrec
      (by
        intro n hn
        simpa [gap] using hmono n hn)
  simpa [A, rho, u, gap, chewi109Lambda, chewi109Rho, div_eq_mul_inv,
    mul_assoc] using hbound

/--
Chewi Theorem 10.9 final MPGD rate for a source-shaped trajectory, assembled
from the compiled one-step inequality.
-/
theorem chewi109_final_gap_le_geometric_denominator_of_trajectory
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E} {x : ℕ -> E} {xStar : E}
    {alphaF alphaG betaF h : ℝ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi alphaG h x)
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi alphaF)
    (hsmoothF : RelativelySmoothOn C f gradF phi gradPhi betaF)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1)
    (hD_next_nonneg :
      ∀ n, 0 ≤ bregmanDivergence phi gradPhi (x (n + 1)) (x n))
    (hxStar : xStar ∈ C)
    (htotal_pos : 0 < alphaF + alphaG)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    {N : ℕ} (hN : N ≠ 0)
    (hD_starN_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N))
    (hmono : ∀ n, n < N ->
      compositeObjective f g (x N) - compositeObjective f g xStar ≤
        compositeObjective f g (x (n + 1)) - compositeObjective f g xStar) :
    compositeObjective f g (x N) - compositeObjective f g xStar ≤
      (alphaF + alphaG) /
        (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) *
          bregmanDivergence phi gradPhi xStar (x 0) := by
  refine
    chewi109_final_gap_le_geometric_denominator_of_oneStep
      (F := compositeObjective f g) (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar)
      (alphaF := alphaF) (alphaG := alphaG) (h := h)
      htotal_pos hh hden_pos hlambda_pos hN hD_starN_nonneg ?_ hmono
  intro n
  exact
    htraj.oneStep_ineq hconvF hsmoothF hh hbeta_step
      hD_next_nonneg hxStar n

end Optimization
end StatInference
