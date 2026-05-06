import StatInference.Optimization.Theorem34

/-!
# Chewi Chapter 8 proximal-gradient layer

This module starts the Chapter 8 proximal-method lane.  It keeps the first
packet source-shaped and finite-valued: the nonsmooth part is represented by a
real-valued function `g`, and one proximal-gradient step is supplied by the
quadratic-growth certificate for the local model minimized in the PGD update.
-/

namespace StatInference
namespace Optimization

open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The composite finite-valued objective `F = f + g` from Chewi Chapter 8. -/
def compositeObjective (f g : E -> ℝ) (x : E) : ℝ :=
  f x + g x

/--
The proximal-gradient local model at `x`, with the smooth part linearized and
the nonsmooth part left implicit.
-/
noncomputable def proximalGradientModel (f g : E -> ℝ) (grad : E -> E)
    (h : ℝ) (x z : E) : ℝ :=
  f x + inner ℝ (grad x) (z - x) + g z +
    (1 / (2 * h)) * ‖z - x‖ ^ (2 : ℕ)

/--
Source-shaped certificate that `xPlus` is one proximal-gradient step from `x`.

The growth field is the exact inequality used in Chewi's proof of Theorem 8.5:
the local model is `(alphaG + 1 / h)`-strongly convex and minimized at `xPlus`.
-/
structure IsProximalGradientStep
    (C : Set E) (f g : E -> ℝ) (grad : E -> E)
    (alphaG h : ℝ) (x xPlus : E) : Prop where
  mem_start : x ∈ C
  mem_next : xPlus ∈ C
  growth : ∀ ⦃y : E⦄, y ∈ C ->
    proximalGradientModel f g grad h x xPlus +
        ((alphaG + 1 / h) / 2) * ‖y - xPlus‖ ^ (2 : ℕ) ≤
      proximalGradientModel f g grad h x y

theorem proximalGradientModel_le_composite_add_sqdist
    {C : Set E} {f g : E -> ℝ} {grad : E -> E}
    {alphaF h : ℝ} {x y : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alphaF)
    (hx : x ∈ C) (hy : y ∈ C) :
    proximalGradientModel f g grad h x y ≤
      compositeObjective f g y +
        (1 / (2 * h) - alphaF / 2) * ‖y - x‖ ^ (2 : ℕ) := by
  have hmodel := hfirst.lower_model hx hy
  unfold proximalGradientModel compositeObjective
  nlinarith

theorem composite_le_proximalGradientModel
    {C : Set E} {f g : E -> ℝ} {grad : E -> E}
    {betaF h : ℝ} {x xPlus : E}
    (hsmooth : SmoothWithGradientOn C f grad betaF)
    (hx : x ∈ C) (hxPlus : xPlus ∈ C)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1) :
    compositeObjective f g xPlus ≤
      proximalGradientModel f g grad h x xPlus := by
  have hsmooth_model := hsmooth.upper_model hx hxPlus
  have hbeta_le_inv : betaF ≤ 1 / h := by
    exact (le_div_iff₀ hh).2 (by simpa using hbeta_step)
  have hcoeff :
      betaF / 2 ≤ 1 / (2 * h) := by
    have hhalf : betaF / 2 ≤ (1 / h) / 2 :=
      div_le_div_of_nonneg_right hbeta_le_inv (by norm_num)
    have hrewrite : (1 / h) / 2 = 1 / (2 * h) := by
      field_simp [hh.ne']
    simpa [hrewrite] using hhalf
  have hquad :
      (betaF / 2) * ‖xPlus - x‖ ^ (2 : ℕ) ≤
        (1 / (2 * h)) * ‖xPlus - x‖ ^ (2 : ℕ) :=
    mul_le_mul_of_nonneg_right hcoeff (sq_nonneg ‖xPlus - x‖)
  unfold compositeObjective proximalGradientModel
  nlinarith

/--
Chewi Theorem 8.5, one-step inequality (8.1), in supplied-interface form.

The only proximal-oracle assumption is the quadratic-growth/minimizer
certificate in `IsProximalGradientStep`; the rest is exactly the source proof:
first-order convexity of `f`, smoothness of `f`, and algebra.
-/
theorem proximalGradient_oneStep_ineq
    {C : Set E} {f g : E -> ℝ} {grad : E -> E}
    {alphaF alphaG betaF h : ℝ} {x xPlus y : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alphaF)
    (hsmooth : SmoothWithGradientOn C f grad betaF)
    (hstep : IsProximalGradientStep C f g grad alphaG h x xPlus)
    (hh : 0 < h) (hbeta_step : betaF * h ≤ 1)
    (hy : y ∈ C) :
    (1 + alphaG * h) * ‖y - xPlus‖ ^ (2 : ℕ) ≤
      (1 - alphaF * h) * ‖y - x‖ ^ (2 : ℕ) -
        2 * h *
          (compositeObjective f g xPlus - compositeObjective f g y) := by
  have hgrowth := hstep.growth hy
  have hmodel_y :
      proximalGradientModel f g grad h x y ≤
        compositeObjective f g y +
          (1 / (2 * h) - alphaF / 2) * ‖y - x‖ ^ (2 : ℕ) :=
    proximalGradientModel_le_composite_add_sqdist
      hfirst hstep.mem_start hy
  have hmodel_next :
      compositeObjective f g xPlus ≤
        proximalGradientModel f g grad h x xPlus :=
    composite_le_proximalGradientModel
      hsmooth hstep.mem_start hstep.mem_next hh hbeta_step
  have hcore :
      ((alphaG + 1 / h) / 2) * ‖y - xPlus‖ ^ (2 : ℕ) ≤
        compositeObjective f g y +
          (1 / (2 * h) - alphaF / 2) * ‖y - x‖ ^ (2 : ℕ) -
            compositeObjective f g xPlus := by
    nlinarith
  have hmul := mul_le_mul_of_nonneg_left hcore (by nlinarith [hh.le])
      (a := 2 * h)
  have hleft :
      2 * h *
          (((alphaG + 1 / h) / 2) * ‖y - xPlus‖ ^ (2 : ℕ)) =
        (1 + alphaG * h) * ‖y - xPlus‖ ^ (2 : ℕ) := by
    field_simp [hh.ne']
    ring
  have hright :
      2 * h *
          (compositeObjective f g y +
            (1 / (2 * h) - alphaF / 2) * ‖y - x‖ ^ (2 : ℕ) -
              compositeObjective f g xPlus) =
        (1 - alphaF * h) * ‖y - x‖ ^ (2 : ℕ) -
          2 * h *
            (compositeObjective f g xPlus - compositeObjective f g y) := by
    field_simp [hh.ne']
    ring
  calc
    (1 + alphaG * h) * ‖y - xPlus‖ ^ (2 : ℕ)
        =
          2 * h *
            (((alphaG + 1 / h) / 2) * ‖y - xPlus‖ ^ (2 : ℕ)) := hleft.symm
    _ ≤
          2 * h *
            (compositeObjective f g y +
              (1 / (2 * h) - alphaF / 2) * ‖y - x‖ ^ (2 : ℕ) -
                compositeObjective f g xPlus) := hmul
    _ =
        (1 - alphaF * h) * ‖y - x‖ ^ (2 : ℕ) -
          2 * h *
            (compositeObjective f g xPlus - compositeObjective f g y) := hright

omit [InnerProductSpace ℝ E] in
/--
Chewi Theorem 8.5 final geometric denominator bound, supplied with the PGD
one-step inequality `(8.1)` and monotonicity of the composite objective gaps.

This reuses the already-compiled Theorem 3.4 weighted-recurrence machinery with
effective step size `h / (1 + alphaG * h)` and total convexity
`alphaF + alphaG`.
-/
theorem chewi85_final_gap_le_geometric_denominator_of_oneStep
    {F : E -> ℝ} {x : ℕ -> E} {xStar : E}
    {alphaF alphaG h : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h)
    (hden_pos : 0 < 1 + alphaG * h)
    (hfactor_pos : 0 < (1 - alphaF * h) / (1 + alphaG * h))
    {N : ℕ} (hN : N ≠ 0)
    (hone_step : ∀ n,
      (1 + alphaG * h) * ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
        (1 - alphaF * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * h * (F (x (n + 1)) - F xStar))
    (hmono : ∀ n, n < N ->
      F (x N) - F xStar ≤ F (x (n + 1)) - F xStar) :
    F (x N) - F xStar ≤
      (alphaF + alphaG) * ‖x 0 - xStar‖ ^ (2 : ℕ) /
        (2 * ((((1 - alphaF * h) / (1 + alphaG * h)) ^ N)⁻¹ - 1)) := by
  let hEff : ℝ := h / (1 + alphaG * h)
  have hhEff : 0 < hEff := by
    exact div_pos hh hden_pos
  have hfactor_eq :
      1 - (alphaF + alphaG) * hEff =
        (1 - alphaF * h) / (1 + alphaG * h) := by
    dsimp [hEff]
    field_simp [hden_pos.ne']
    ring
  have hfactor_eff_pos :
      0 < 1 - (alphaF + alphaG) * hEff := by
    rw [hfactor_eq]
    exact hfactor_pos
  have hone_eff : ∀ n,
      ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
        (1 - (alphaF + alphaG) * hEff) *
            ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * hEff * (F (x (n + 1)) - F xStar) := by
    intro n
    have hstep := hone_step n
    have hdiv :
        ‖x (n + 1) - xStar‖ ^ (2 : ℕ) ≤
          ((1 - alphaF * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
            2 * h * (F (x (n + 1)) - F xStar)) /
              (1 + alphaG * h) := by
      have hstep' :
          ‖x (n + 1) - xStar‖ ^ (2 : ℕ) * (1 + alphaG * h) ≤
            (1 - alphaF * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
              2 * h * (F (x (n + 1)) - F xStar) := by
        simpa [mul_comm, mul_left_comm, mul_assoc] using hstep
      exact (le_div_iff₀ hden_pos).2 hstep'
    calc
      ‖x (n + 1) - xStar‖ ^ (2 : ℕ)
          ≤ ((1 - alphaF * h) * ‖x n - xStar‖ ^ (2 : ℕ) -
            2 * h * (F (x (n + 1)) - F xStar)) /
              (1 + alphaG * h) := hdiv
      _ =
        ((1 - alphaF * h) / (1 + alphaG * h)) *
            ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * (h / (1 + alphaG * h)) *
            (F (x (n + 1)) - F xStar) := by
            field_simp [hden_pos.ne']
      _ =
        (1 - (alphaF + alphaG) * hEff) *
            ‖x n - xStar‖ ^ (2 : ℕ) -
          2 * hEff * (F (x (n + 1)) - F xStar) := by
            simp [hEff, hfactor_eq]
  have hbound :=
    chewi34_final_gap_le_geometric_denominator_of_one_step
      (f := F) (x := x) (xStar := xStar)
      (alpha := alphaF + alphaG) (h := hEff)
      htotal_pos hhEff hfactor_eff_pos hN hone_eff hmono
  simpa [hfactor_eq] using hbound

end Optimization
end StatInference
