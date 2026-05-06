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

end Optimization
end StatInference
