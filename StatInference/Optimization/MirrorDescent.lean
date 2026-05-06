import StatInference.Optimization.Bregman
import StatInference.Optimization.ProjectedSubgradient
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

/--
Scalar Young/completing-square inequality used in Chewi Theorem 10.11:
`-2 L r + alpha/(2h) r^2` is bounded below by `-2 L^2 h / alpha`.
-/
theorem chewi1011_young_lower_bound
    {L alphaPhi h r : ℝ} (hh : 0 < h) (halphaPhi : 0 < alphaPhi) :
    -(2 * L ^ (2 : ℕ) * h / alphaPhi) ≤
      -2 * L * r + (alphaPhi / (2 * h)) * r ^ (2 : ℕ) := by
  have hden : 0 < 2 * h * alphaPhi := by positivity
  have hsquare : 0 ≤ (alphaPhi * r - 2 * L * h) ^ (2 : ℕ) := sq_nonneg _
  have hnonneg :
      0 ≤
        (alphaPhi * r - 2 * L * h) ^ (2 : ℕ) /
          (2 * h * alphaPhi) :=
    div_nonneg hsquare hden.le
  have hidentity :
      (alphaPhi * r - 2 * L * h) ^ (2 : ℕ) /
          (2 * h * alphaPhi) =
        -2 * L * r + (alphaPhi / (2 * h)) * r ^ (2 : ℕ) +
          2 * L ^ (2 : ℕ) * h / alphaPhi := by
    field_simp [hh.ne', halphaPhi.ne']
    ring
  rw [hidentity] at hnonneg
  nlinarith

/--
Chewi Theorem 10.11 analytic lower bound for the local mirror model from the
two displayed source estimates
`D_f(x⁺,x) <= 2 L r` and `D_phi(x⁺,x) >= alphaPhi/2 * r^2`.

The norm/dual-norm proof of these two estimates remains outside this small
interface, but the model lower bound no longer needs to be supplied as an
opaque assumption.
-/
theorem mirrorProximalGradientModel_lower_of_bregman_bounds
    {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {L alphaPhi h r : ℝ} {x xPlus : E}
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hDf_upper :
      bregmanDivergence f gradF xPlus x ≤ 2 * L * r)
    (hDphi_lower :
      (alphaPhi / 2) * r ^ (2 : ℕ) ≤
        bregmanDivergence phi gradPhi xPlus x) :
    compositeObjective f g xPlus - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤
      mirrorProximalGradientModel f g gradF phi gradPhi h x xPlus := by
  have hDf_linear :
      f xPlus ≤ f x + inner ℝ (gradF x) (xPlus - x) + 2 * L * r := by
    unfold bregmanDivergence at hDf_upper
    nlinarith
  have hDphi_scaled :
      (alphaPhi / (2 * h)) * r ^ (2 : ℕ) ≤
        (1 / h) * bregmanDivergence phi gradPhi xPlus x := by
    have hinv_nonneg : 0 ≤ (1 / h) := by positivity
    have hmul :=
      mul_le_mul_of_nonneg_left hDphi_lower hinv_nonneg
    calc
      (alphaPhi / (2 * h)) * r ^ (2 : ℕ) =
          (1 / h) * ((alphaPhi / 2) * r ^ (2 : ℕ)) := by
            field_simp [hh.ne']
      _ ≤ (1 / h) * bregmanDivergence phi gradPhi xPlus x := hmul
  have hyoung :=
    chewi1011_young_lower_bound
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := r)
      hh halphaPhi
  unfold mirrorProximalGradientModel compositeObjective
  nlinarith

/--
Chewi Theorem 10.11 nonsmooth MPGD one-step recurrence from the source proof,
with the Cauchy-Schwarz/Lipschitz lower bound on the local mirror model
supplied as an interface.

The supplied lower bound corresponds to
`ψ_x(x⁺) >= F(x⁺) - 2 L^2 h / alphaPhi`.
-/
theorem mirrorProximalGradient_nonsmooth_oneStep_ineq
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {L alphaPhi h : ℝ} {x xPlus xStar : E}
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hstep : IsMirrorProximalGradientStep C f g gradF phi gradPhi 0 h x xPlus)
    (hh : 0 < h)
    (hxStar : xStar ∈ C)
    (hmodel_lower :
      compositeObjective f g xPlus - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤
        mirrorProximalGradientModel f g gradF phi gradPhi h x xPlus) :
    bregmanDivergence phi gradPhi xStar xPlus ≤
      bregmanDivergence phi gradPhi xStar x -
        h * (compositeObjective f g xPlus - compositeObjective f g xStar) +
          2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi := by
  have hgrowth := hstep.growth hxStar
  have hmodel_star :
      mirrorProximalGradientModel f g gradF phi gradPhi h x xStar ≤
        compositeObjective f g xStar +
          (1 / h) * bregmanDivergence phi gradPhi xStar x := by
    have hraw :=
      mirrorProximalGradientModel_le_composite_add_bregman
        (C := C) (f := f) (g := g) (gradF := gradF)
        (phi := phi) (gradPhi := gradPhi) (alphaF := 0) (h := h)
        hconvF hstep.mem_start hxStar
    simpa using hraw
  have hcore :
      compositeObjective f g xPlus - 2 * L ^ (2 : ℕ) * h / alphaPhi +
          (1 / h) * bregmanDivergence phi gradPhi xStar xPlus ≤
        compositeObjective f g xStar +
          (1 / h) * bregmanDivergence phi gradPhi xStar x := by
    nlinarith
  have hmul := mul_le_mul_of_nonneg_left hcore hh.le (a := h)
  have hleft :
      h *
        (compositeObjective f g xPlus - 2 * L ^ (2 : ℕ) * h / alphaPhi +
          (1 / h) * bregmanDivergence phi gradPhi xStar xPlus) =
        h * (compositeObjective f g xPlus) -
          2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi +
            bregmanDivergence phi gradPhi xStar xPlus := by
    field_simp [hh.ne']
  have hright :
      h *
        (compositeObjective f g xStar +
          (1 / h) * bregmanDivergence phi gradPhi xStar x) =
        h * (compositeObjective f g xStar) +
          bregmanDivergence phi gradPhi xStar x := by
    field_simp [hh.ne']
  rw [hleft, hright] at hmul
  nlinarith

/--
Chewi Theorem 10.11 nonsmooth MPGD one-step recurrence from the two analytic
Bregman estimates displayed in the proof.
-/
theorem mirrorProximalGradient_nonsmooth_oneStep_ineq_of_bregman_bounds
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {L alphaPhi h r : ℝ} {x xPlus xStar : E}
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hstep : IsMirrorProximalGradientStep C f g gradF phi gradPhi 0 h x xPlus)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hDf_upper :
      bregmanDivergence f gradF xPlus x ≤ 2 * L * r)
    (hDphi_lower :
      (alphaPhi / 2) * r ^ (2 : ℕ) ≤
        bregmanDivergence phi gradPhi xPlus x) :
    bregmanDivergence phi gradPhi xStar xPlus ≤
      bregmanDivergence phi gradPhi xStar x -
        h * (compositeObjective f g xPlus - compositeObjective f g xStar) +
          2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi :=
  mirrorProximalGradient_nonsmooth_oneStep_ineq
    (C := C) (f := f) (g := g) (gradF := gradF)
    (phi := phi) (gradPhi := gradPhi)
    (L := L) (alphaPhi := alphaPhi) (h := h)
    (x := x) (xPlus := xPlus) (xStar := xStar)
    hconvF hstep hh hxStar
    (mirrorProximalGradientModel_lower_of_bregman_bounds
      (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := r)
      (x := x) (xPlus := xPlus)
      hh halphaPhi hDf_upper hDphi_lower)

/--
Telescoping average-gap consequence of the nonsmooth MPGD recurrence in
Chewi Theorem 10.11.
-/
theorem chewi1011_average_gap_le_of_recurrence
    {D gap : ℕ -> ℝ} {h err : ℝ}
    (hh : 0 < h) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hrec : ∀ n, n < N ->
      D (n + 1) ≤ D n - h * gap (n + 1) + err) :
    (1 / (N : ℝ)) *
        (∑ n ∈ Finset.range N, gap (n + 1)) ≤
      D 0 / ((N : ℝ) * h) + err / h := by
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  let S : ℝ := ∑ n ∈ Finset.range N, gap (n + 1)
  have hstep : ∀ n, n < N ->
      h * gap (n + 1) ≤ D n - D (n + 1) + err := by
    intro n hn
    have h := hrec n hn
    nlinarith
  have hsum :
      ∑ n ∈ Finset.range N, h * gap (n + 1) ≤
        ∑ n ∈ Finset.range N, (D n - D (n + 1) + err) := by
    exact Finset.sum_le_sum fun n hn => hstep n (Finset.mem_range.mp hn)
  have hleft :
      ∑ n ∈ Finset.range N, h * gap (n + 1) = h * S := by
    simp [S, Finset.mul_sum]
  have hright :
      (∑ n ∈ Finset.range N, (D n - D (n + 1) + err)) =
        D 0 - D N + (N : ℝ) * err := by
    rw [Finset.sum_add_distrib, sum_range_sub_succ]
    simp [Finset.sum_const, Finset.card_range, nsmul_eq_mul]
  have hsum_bound : h * S ≤ D 0 + (N : ℝ) * err := by
    rw [hleft, hright] at hsum
    nlinarith
  have hS_bound : S ≤ (D 0 + (N : ℝ) * err) / h :=
    (le_div_iff₀ hh).2 (by simpa [mul_comm] using hsum_bound)
  have havg_bound :
      (1 / (N : ℝ)) * S ≤
        (1 / (N : ℝ)) * ((D 0 + (N : ℝ) * err) / h) := by
    exact mul_le_mul_of_nonneg_left hS_bound (by positivity)
  have hrhs :
      (1 / (N : ℝ)) * ((D 0 + (N : ℝ) * err) / h) =
        D 0 / ((N : ℝ) * h) + err / h := by
    field_simp [hN_pos.ne', hh.ne']
  rw [hrhs] at havg_bound
  simpa [S] using havg_bound

/--
Chewi Theorem 10.11 average-gap bound from the displayed nonsmooth MPGD
one-step recurrence.
-/
theorem chewi1011_average_gap_le_of_oneStep
    {F phi : E -> ℝ} {gradPhi : E -> E} {x : ℕ -> E} {xStar : E}
    {L alphaPhi h : ℝ}
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N))
    (hone_step : ∀ n, n < N ->
      bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (x n) -
          h * (F (x (n + 1)) - F xStar) +
            2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi) :
    (1 / (N : ℝ)) *
        (∑ n ∈ Finset.range N, (F (x (n + 1)) - F xStar)) ≤
      bregmanDivergence phi gradPhi xStar (x 0) / ((N : ℝ) * h) +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  let D : ℕ -> ℝ := fun n => bregmanDivergence phi gradPhi xStar (x n)
  let gap : ℕ -> ℝ := fun n => F (x n) - F xStar
  let err : ℝ := 2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi
  have hmain :=
    chewi1011_average_gap_le_of_recurrence
      (D := D) (gap := gap) (h := h) (err := err)
      hh hN (by simpa [D] using hD_N_nonneg)
      (by
        intro n hn
        simpa [D, gap, err] using hone_step n hn)
  have herr :
      err / h = 2 * L ^ (2 : ℕ) * h / alphaPhi := by
    dsimp [err]
    field_simp [hh.ne', halphaPhi.ne']
  simpa [D, gap, err, herr] using hmain

/--
Chewi Theorem 10.11 source-facing averaged-iterate bound.  The Jensen step is
reused from the Chapter 6 projected-subgradient layer by applying it to the
shifted sequence `n ↦ x_{n+1}`.
-/
theorem chewi1011_iterateAverage_gap_le_of_oneStep
    {C : Set E} {F phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E}
    {L alphaPhi h : ℝ} {N : ℕ}
    (hconvF : ConvexOn ℝ C F)
    (hmem : ∀ n, n < N -> x (n + 1) ∈ C)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N))
    (hone_step : ∀ n, n < N ->
      bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (x n) -
          h * (F (x (n + 1)) - F xStar) +
            2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi) :
    F (iterateAverage (fun n => x (n + 1)) N) - F xStar ≤
      bregmanDivergence phi gradPhi xStar (x 0) / ((N : ℝ) * h) +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  have hjensen :=
    convex_value_iterateAverage_sub_le_average_gap
      (C := C) (f := F) (x := fun n => x (n + 1))
      (xStar := xStar) (N := N) hconvF hmem hN
  have havg :=
    chewi1011_average_gap_le_of_oneStep
      (F := F) (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L)
      (alphaPhi := alphaPhi) (h := h)
      hh halphaPhi hN hD_N_nonneg hone_step
  exact hjensen.trans havg

/--
Scalar closing step for Chewi Theorem 10.11.  With the displayed positive
step-size choice `h^2 = alphaPhi * Rphi^2 / (2 * L^2 * N)`, the average-bound
right-hand side is at most `L Rphi sqrt(8/(alphaPhi N))`.
-/
theorem chewi1011_stepsize_rhs_bound
    {D0 L Rphi alphaPhi h : ℝ} {N : ℕ}
    (hL : 0 < L) (hRphi : 0 < Rphi)
    (halphaPhi : 0 < alphaPhi) (hh : 0 < h)
    (hN : N ≠ 0)
    (hD0_le : D0 ≤ Rphi ^ (2 : ℕ))
    (hh_sq :
      h ^ (2 : ℕ) =
        alphaPhi * Rphi ^ (2 : ℕ) /
          (2 * L ^ (2 : ℕ) * (N : ℝ))) :
    D0 / ((N : ℝ) * h) + 2 * L ^ (2 : ℕ) * h / alphaPhi ≤
      L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) := by
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  have hden_pos : 0 < (N : ℝ) * h := mul_pos hN_pos hh
  have hD_scaled :
      D0 / ((N : ℝ) * h) ≤
        Rphi ^ (2 : ℕ) / ((N : ℝ) * h) :=
    div_le_div_of_nonneg_right hD0_le hden_pos.le
  have hterm :
      Rphi ^ (2 : ℕ) / ((N : ℝ) * h) =
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
    field_simp [hN_pos.ne', hh.ne', hL.ne', halphaPhi.ne'] at hh_sq ⊢
    nlinarith
  have hclosed_core :
      Rphi ^ (2 : ℕ) / ((N : ℝ) * h) +
          2 * L ^ (2 : ℕ) * h / alphaPhi =
        4 * L ^ (2 : ℕ) * h / alphaPhi := by
    rw [hterm]
    ring
  have hsqrt_arg_nonneg :
      0 ≤ 8 / (alphaPhi * (N : ℝ)) := by positivity
  have hleft_nonneg :
      0 ≤ 4 * L ^ (2 : ℕ) * h / alphaPhi := by positivity
  have hright_nonneg :
      0 ≤ L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) := by
    positivity
  have hclosed_squares :
      (4 * L ^ (2 : ℕ) * h / alphaPhi) ^ (2 : ℕ) =
        (L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ)))) ^ (2 : ℕ) := by
    rw [mul_pow, mul_pow, Real.sq_sqrt hsqrt_arg_nonneg]
    have hh_sq' := hh_sq
    field_simp [hN_pos.ne', hL.ne', halphaPhi.ne'] at hh_sq' ⊢
    nlinarith
  have hclosed :
      4 * L ^ (2 : ℕ) * h / alphaPhi =
        L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) :=
    (sq_eq_sq₀ hleft_nonneg hright_nonneg).mp hclosed_squares
  nlinarith

/--
Chewi Theorem 10.11 one-step supplied-interface bound with the displayed
positive step-size choice.
-/
theorem chewi1011_average_gap_le_of_oneStep_stepsize
    {F phi : E -> ℝ} {gradPhi : E -> E} {x : ℕ -> E} {xStar : E}
    {L Rphi alphaPhi h : ℝ} {N : ℕ}
    (hL : 0 < L) (hRphi : 0 < Rphi)
    (halphaPhi : 0 < alphaPhi) (hh : 0 < h)
    (hN : N ≠ 0)
    (hD0_le :
      bregmanDivergence phi gradPhi xStar (x 0) ≤ Rphi ^ (2 : ℕ))
    (hh_sq :
      h ^ (2 : ℕ) =
        alphaPhi * Rphi ^ (2 : ℕ) /
          (2 * L ^ (2 : ℕ) * (N : ℝ)))
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N))
    (hone_step : ∀ n, n < N ->
      bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (x n) -
          h * (F (x (n + 1)) - F xStar) +
            2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi) :
    (1 / (N : ℝ)) *
        (∑ n ∈ Finset.range N, (F (x (n + 1)) - F xStar)) ≤
      L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) := by
  have hbase :=
    chewi1011_average_gap_le_of_oneStep
      (F := F) (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L)
      (alphaPhi := alphaPhi) (h := h)
      hh halphaPhi hN hD_N_nonneg hone_step
  have hclosed :=
    chewi1011_stepsize_rhs_bound
      (D0 := bregmanDivergence phi gradPhi xStar (x 0))
      (L := L) (Rphi := Rphi) (alphaPhi := alphaPhi)
      (h := h) (N := N)
      hL hRphi halphaPhi hh hN hD0_le hh_sq
  exact hbase.trans hclosed

/--
Chewi Theorem 10.11 averaged-iterate supplied-interface bound with the
displayed positive step-size choice.
-/
theorem chewi1011_iterateAverage_gap_le_of_oneStep_stepsize
    {C : Set E} {F phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E}
    {L Rphi alphaPhi h : ℝ} {N : ℕ}
    (hconvF : ConvexOn ℝ C F)
    (hmem : ∀ n, n < N -> x (n + 1) ∈ C)
    (hL : 0 < L) (hRphi : 0 < Rphi)
    (halphaPhi : 0 < alphaPhi) (hh : 0 < h)
    (hN : N ≠ 0)
    (hD0_le :
      bregmanDivergence phi gradPhi xStar (x 0) ≤ Rphi ^ (2 : ℕ))
    (hh_sq :
      h ^ (2 : ℕ) =
        alphaPhi * Rphi ^ (2 : ℕ) /
          (2 * L ^ (2 : ℕ) * (N : ℝ)))
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N))
    (hone_step : ∀ n, n < N ->
      bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (x n) -
          h * (F (x (n + 1)) - F xStar) +
            2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi) :
    F (iterateAverage (fun n => x (n + 1)) N) - F xStar ≤
      L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) := by
  have hbase :=
    chewi1011_iterateAverage_gap_le_of_oneStep
      (C := C) (F := F) (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L)
      (alphaPhi := alphaPhi) (h := h) (N := N)
      hconvF hmem hh halphaPhi hN hD_N_nonneg hone_step
  have hclosed :=
    chewi1011_stepsize_rhs_bound
      (D0 := bregmanDivergence phi gradPhi xStar (x 0))
      (L := L) (Rphi := Rphi) (alphaPhi := alphaPhi)
      (h := h) (N := N)
      hL hRphi halphaPhi hh hN hD0_le hh_sq
  exact hbase.trans hclosed

/--
Chewi Theorem 10.11 average-gap bound for a source-shaped MPGD trajectory,
assuming the nonsmooth model lower bound from the Cauchy-Schwarz/Lipschitz
part of the proof at each step.
-/
theorem chewi1011_average_gap_le_of_trajectory
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E} {L alphaPhi h : ℝ} {N : ℕ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi 0 h x)
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hmodel_lower : ∀ n, n < N ->
      compositeObjective f g (x (n + 1)) -
          2 * L ^ (2 : ℕ) * h / alphaPhi ≤
        mirrorProximalGradientModel f g gradF phi gradPhi h (x n) (x (n + 1)))
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N)) :
    (1 / (N : ℝ)) *
        (∑ n ∈ Finset.range N,
          (compositeObjective f g (x (n + 1)) -
            compositeObjective f g xStar)) ≤
      bregmanDivergence phi gradPhi xStar (x 0) / ((N : ℝ) * h) +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  refine
    chewi1011_average_gap_le_of_oneStep
      (F := compositeObjective f g) (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L)
      (alphaPhi := alphaPhi) (h := h)
      hh halphaPhi hN hD_N_nonneg ?_
  intro n hn
  exact
    mirrorProximalGradient_nonsmooth_oneStep_ineq
      (C := C) (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (L := L) (alphaPhi := alphaPhi) (h := h)
      (x := x n) (xPlus := x (n + 1)) (xStar := xStar)
      hconvF (htraj.step n) hh hxStar (hmodel_lower n hn)

/--
Chewi Theorem 10.11 averaged-iterate bound for a source-shaped MPGD
trajectory.
-/
theorem chewi1011_iterateAverage_gap_le_of_trajectory
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E} {L alphaPhi h : ℝ} {N : ℕ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi 0 h x)
    (hconvFmodel : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hconvComposite : ConvexOn ℝ C (compositeObjective f g))
    (hmem : ∀ n, n < N -> x (n + 1) ∈ C)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hmodel_lower : ∀ n, n < N ->
      compositeObjective f g (x (n + 1)) -
          2 * L ^ (2 : ℕ) * h / alphaPhi ≤
        mirrorProximalGradientModel f g gradF phi gradPhi h (x n) (x (n + 1)))
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N)) :
    compositeObjective f g (iterateAverage (fun n => x (n + 1)) N) -
        compositeObjective f g xStar ≤
      bregmanDivergence phi gradPhi xStar (x 0) / ((N : ℝ) * h) +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  have hone : ∀ n, n < N ->
      bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (x n) -
          h * (compositeObjective f g (x (n + 1)) -
            compositeObjective f g xStar) +
            2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi := by
    intro n hn
    exact
      mirrorProximalGradient_nonsmooth_oneStep_ineq
        (C := C) (f := f) (g := g) (gradF := gradF)
        (phi := phi) (gradPhi := gradPhi)
        (L := L) (alphaPhi := alphaPhi) (h := h)
        (x := x n) (xPlus := x (n + 1)) (xStar := xStar)
        hconvFmodel (htraj.step n) hh hxStar (hmodel_lower n hn)
  exact
    chewi1011_iterateAverage_gap_le_of_oneStep
      (C := C) (F := compositeObjective f g) (phi := phi)
      (gradPhi := gradPhi) (x := x) (xStar := xStar)
      (L := L) (alphaPhi := alphaPhi) (h := h)
      (N := N) hconvComposite hmem hh halphaPhi hN hD_N_nonneg hone

/--
Chewi Theorem 10.11 average-gap bound for a trajectory, using the two
displayed analytic Bregman estimates at each step instead of an opaque model
lower-bound assumption.
-/
theorem chewi1011_average_gap_le_of_trajectory_bregman_bounds
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E} {L alphaPhi h : ℝ}
    {r : ℕ -> ℝ} {N : ℕ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi 0 h x)
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hDf_upper : ∀ n, n < N ->
      bregmanDivergence f gradF (x (n + 1)) (x n) ≤
        2 * L * r n)
    (hDphi_lower : ∀ n, n < N ->
      (alphaPhi / 2) * (r n) ^ (2 : ℕ) ≤
        bregmanDivergence phi gradPhi (x (n + 1)) (x n))
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N)) :
    (1 / (N : ℝ)) *
        (∑ n ∈ Finset.range N,
          (compositeObjective f g (x (n + 1)) -
            compositeObjective f g xStar)) ≤
      bregmanDivergence phi gradPhi xStar (x 0) / ((N : ℝ) * h) +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  refine
    chewi1011_average_gap_le_of_trajectory
      (C := C) (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L)
      (alphaPhi := alphaPhi) (h := h) (N := N)
      htraj hconvF hh halphaPhi hxStar ?_ hN hD_N_nonneg
  intro n hn
  exact
    mirrorProximalGradientModel_lower_of_bregman_bounds
      (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := r n)
      (x := x n) (xPlus := x (n + 1))
      hh halphaPhi (hDf_upper n hn) (hDphi_lower n hn)

/--
Chewi Theorem 10.11 averaged-iterate bound for a trajectory, using the two
displayed analytic Bregman estimates at each step.
-/
theorem chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E} {L alphaPhi h : ℝ}
    {r : ℕ -> ℝ} {N : ℕ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi 0 h x)
    (hconvFmodel : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hconvComposite : ConvexOn ℝ C (compositeObjective f g))
    (hmem : ∀ n, n < N -> x (n + 1) ∈ C)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hDf_upper : ∀ n, n < N ->
      bregmanDivergence f gradF (x (n + 1)) (x n) ≤
        2 * L * r n)
    (hDphi_lower : ∀ n, n < N ->
      (alphaPhi / 2) * (r n) ^ (2 : ℕ) ≤
        bregmanDivergence phi gradPhi (x (n + 1)) (x n))
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N)) :
    compositeObjective f g (iterateAverage (fun n => x (n + 1)) N) -
        compositeObjective f g xStar ≤
      bregmanDivergence phi gradPhi xStar (x 0) / ((N : ℝ) * h) +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  refine
    chewi1011_iterateAverage_gap_le_of_trajectory
      (C := C) (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L)
      (alphaPhi := alphaPhi) (h := h) (N := N)
      htraj hconvFmodel hconvComposite hmem hh halphaPhi hxStar ?_
      hN hD_N_nonneg
  intro n hn
  exact
    mirrorProximalGradientModel_lower_of_bregman_bounds
      (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := r n)
      (x := x n) (xPlus := x (n + 1))
      hh halphaPhi (hDf_upper n hn) (hDphi_lower n hn)

/--
Chewi Theorem 10.11 trajectory average-gap bound with the displayed positive
step-size choice and the two source analytic Bregman estimates.
-/
theorem chewi1011_average_gap_le_of_trajectory_bregman_bounds_stepsize
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E} {L Rphi alphaPhi h : ℝ}
    {r : ℕ -> ℝ} {N : ℕ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi 0 h x)
    (hconvF : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hL : 0 < L) (hRphi : 0 < Rphi)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hD0_le :
      bregmanDivergence phi gradPhi xStar (x 0) ≤ Rphi ^ (2 : ℕ))
    (hh_sq :
      h ^ (2 : ℕ) =
        alphaPhi * Rphi ^ (2 : ℕ) /
          (2 * L ^ (2 : ℕ) * (N : ℝ)))
    (hDf_upper : ∀ n, n < N ->
      bregmanDivergence f gradF (x (n + 1)) (x n) ≤
        2 * L * r n)
    (hDphi_lower : ∀ n, n < N ->
      (alphaPhi / 2) * (r n) ^ (2 : ℕ) ≤
        bregmanDivergence phi gradPhi (x (n + 1)) (x n))
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N)) :
    (1 / (N : ℝ)) *
        (∑ n ∈ Finset.range N,
          (compositeObjective f g (x (n + 1)) -
            compositeObjective f g xStar)) ≤
      L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) := by
  refine
    chewi1011_average_gap_le_of_oneStep_stepsize
      (F := compositeObjective f g) (phi := phi) (gradPhi := gradPhi)
      (x := x) (xStar := xStar) (L := L) (Rphi := Rphi)
      (alphaPhi := alphaPhi) (h := h) (N := N)
      hL hRphi halphaPhi hh hN hD0_le hh_sq hD_N_nonneg ?_
  intro n hn
  exact
    mirrorProximalGradient_nonsmooth_oneStep_ineq_of_bregman_bounds
      (C := C) (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := r n)
      (x := x n) (xPlus := x (n + 1)) (xStar := xStar)
      hconvF (htraj.step n) hh halphaPhi hxStar
      (hDf_upper n hn) (hDphi_lower n hn)

/--
Chewi Theorem 10.11 trajectory averaged-iterate bound with the displayed
positive step-size choice and the two source analytic Bregman estimates.
-/
theorem chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds_stepsize
    {C : Set E} {f g : E -> ℝ} {gradF : E -> E}
    {phi : E -> ℝ} {gradPhi : E -> E}
    {x : ℕ -> E} {xStar : E} {L Rphi alphaPhi h : ℝ}
    {r : ℕ -> ℝ} {N : ℕ}
    (htraj : IsMirrorProximalGradientTrajectory
      C f g gradF phi gradPhi 0 h x)
    (hconvFmodel : RelativelyStrongConvexOn C f gradF phi gradPhi 0)
    (hconvComposite : ConvexOn ℝ C (compositeObjective f g))
    (hmem : ∀ n, n < N -> x (n + 1) ∈ C)
    (hL : 0 < L) (hRphi : 0 < Rphi)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hxStar : xStar ∈ C)
    (hD0_le :
      bregmanDivergence phi gradPhi xStar (x 0) ≤ Rphi ^ (2 : ℕ))
    (hh_sq :
      h ^ (2 : ℕ) =
        alphaPhi * Rphi ^ (2 : ℕ) /
          (2 * L ^ (2 : ℕ) * (N : ℝ)))
    (hDf_upper : ∀ n, n < N ->
      bregmanDivergence f gradF (x (n + 1)) (x n) ≤
        2 * L * r n)
    (hDphi_lower : ∀ n, n < N ->
      (alphaPhi / 2) * (r n) ^ (2 : ℕ) ≤
        bregmanDivergence phi gradPhi (x (n + 1)) (x n))
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (x N)) :
    compositeObjective f g (iterateAverage (fun n => x (n + 1)) N) -
        compositeObjective f g xStar ≤
      L * Rphi * Real.sqrt (8 / (alphaPhi * (N : ℝ))) := by
  refine
    chewi1011_iterateAverage_gap_le_of_oneStep_stepsize
      (C := C) (F := compositeObjective f g) (phi := phi)
      (gradPhi := gradPhi) (x := x) (xStar := xStar)
      (L := L) (Rphi := Rphi) (alphaPhi := alphaPhi)
      (h := h) (N := N)
      hconvComposite hmem hL hRphi halphaPhi hh hN hD0_le
      hh_sq hD_N_nonneg ?_
  intro n hn
  exact
    mirrorProximalGradient_nonsmooth_oneStep_ineq_of_bregman_bounds
      (C := C) (f := f) (g := g) (gradF := gradF)
      (phi := phi) (gradPhi := gradPhi)
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := r n)
      (x := x n) (xPlus := x (n + 1)) (xStar := xStar)
      hconvFmodel (htraj.step n) hh halphaPhi hxStar
      (hDf_upper n hn) (hDphi_lower n hn)

end Optimization
end StatInference
