import StatInference.Optimization.GradientFlow
import Mathlib.Analysis.Calculus.Deriv.MeanValue

/-!
# Chewi Theorem 5.8 accelerated gradient-flow Lyapunov layer

This module starts the continuous-time acceleration lane in Chapter 5.  The
first packet packages the source Lyapunov quantity for AGF and proves the
algebraic close-out: once the Lyapunov function is nonincreasing, Chewi's
`O(1 / t^2)` function-gap bound follows.
-/

namespace StatInference
namespace Optimization

open Set Filter
open scoped Topology
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Chewi's accelerated gradient-flow system with a supplied gradient oracle. -/
def IsAcceleratedGradientFlowTrajectory (grad : E -> E) (gamma : ℝ -> ℝ)
    (x p : ℝ -> E) : Prop :=
  (∀ t, HasDerivAt x (p t) t) ∧
    ∀ t, HasDerivAt p (-(grad (x t)) - gamma t • p t) t

/-- The convex-case friction coefficient `γ_t = 3 / t` in Theorem 5.8. -/
noncomputable def chewi58Friction (t : ℝ) : ℝ :=
  3 / t

/-- Source-shaped AGF interface for Chewi Theorem 5.8. -/
def IsChewi58AcceleratedGradientFlowTrajectory (grad : E -> E)
    (x p : ℝ -> E) : Prop :=
  IsAcceleratedGradientFlowTrajectory grad chewi58Friction x p

/-- Chewi's auxiliary point `z_t = x_t + t / 2 • p_t`. -/
noncomputable def agfAuxPoint (x p : ℝ -> E) (t : ℝ) : E :=
  x t + (t / 2) • p t

/--
Chewi's Lyapunov function for Theorem 5.8:
`L_t = t^2 / 2 * (f x_t - f*) + ‖z_t - x*‖^2`.
-/
noncomputable def chewi58Lyapunov (f : E -> ℝ) (fstar : ℝ)
    (x p : ℝ -> E) (xStar : E) (t : ℝ) : ℝ :=
  (t ^ (2 : ℕ) / 2) * (f (x t) - fstar) +
    ‖agfAuxPoint x p t - xStar‖ ^ (2 : ℕ)

/-- At time zero, Chewi's Theorem 5.8 Lyapunov equals the initial squared distance. -/
theorem chewi58Lyapunov_zero (f : E -> ℝ) (fstar : ℝ)
    (x p : ℝ -> E) (xStar : E) :
    chewi58Lyapunov f fstar x p xStar 0 =
      ‖x 0 - xStar‖ ^ (2 : ℕ) := by
  simp [chewi58Lyapunov, agfAuxPoint]

/--
Algebraic close-out for Chewi Theorem 5.8.  If the AGF Lyapunov quantity has
not increased between `0` and a positive time `t`, then the displayed
`2 ‖x_0 - x_*‖² / t²` rate follows.
-/
theorem chewi58_gap_le_of_lyapunov_le_initial
    {f : E -> ℝ} {fstar : ℝ} {x p : ℝ -> E} {xStar : E} {t : ℝ}
    (ht : 0 < t)
    (hL : chewi58Lyapunov f fstar x p xStar t ≤
      chewi58Lyapunov f fstar x p xStar 0) :
    f (x t) - fstar ≤
      2 * ‖x 0 - xStar‖ ^ (2 : ℕ) / t ^ (2 : ℕ) := by
  have ht_sq_pos : 0 < t ^ (2 : ℕ) := sq_pos_of_pos ht
  have hcoef_pos : 0 < t ^ (2 : ℕ) / 2 := by positivity
  have hnorm_nonneg :
      0 ≤ ‖agfAuxPoint x p t - xStar‖ ^ (2 : ℕ) := sq_nonneg _
  have hterm_le :
      (t ^ (2 : ℕ) / 2) * (f (x t) - fstar) ≤
        chewi58Lyapunov f fstar x p xStar t := by
    dsimp [chewi58Lyapunov]
    nlinarith
  have hmain :
      (t ^ (2 : ℕ) / 2) * (f (x t) - fstar) ≤
        ‖x 0 - xStar‖ ^ (2 : ℕ) := by
    exact hterm_le.trans (hL.trans_eq (chewi58Lyapunov_zero f fstar x p xStar))
  have hdiv :
      f (x t) - fstar ≤
        ‖x 0 - xStar‖ ^ (2 : ℕ) / (t ^ (2 : ℕ) / 2) := by
    exact (le_div_iff₀ hcoef_pos).2 (by simpa [mul_comm] using hmain)
  have hratio :
      ‖x 0 - xStar‖ ^ (2 : ℕ) / (t ^ (2 : ℕ) / 2) =
        2 * ‖x 0 - xStar‖ ^ (2 : ℕ) / t ^ (2 : ℕ) := by
    field_simp [ne_of_gt ht_sq_pos]
  simpa [hratio]
    using hdiv

/--
Antitone Lyapunov close-out for Chewi Theorem 5.8 on nonnegative time.  This
is the direct consumer of the derivative calculation in the notes.
-/
theorem chewi58_gap_le_of_lyapunov_antitoneOn
    {f : E -> ℝ} {fstar : ℝ} {x p : ℝ -> E} {xStar : E} {t : ℝ}
    (hanti :
      AntitoneOn (chewi58Lyapunov f fstar x p xStar) (Set.Ici (0 : ℝ)))
    (ht : 0 < t) :
    f (x t) - fstar ≤
      2 * ‖x 0 - xStar‖ ^ (2 : ℕ) / t ^ (2 : ℕ) := by
  have h0mem : (0 : ℝ) ∈ Set.Ici (0 : ℝ) := by simp
  have htmem : t ∈ Set.Ici (0 : ℝ) := by exact le_of_lt ht
  have hL :
      chewi58Lyapunov f fstar x p xStar t ≤
        chewi58Lyapunov f fstar x p xStar 0 :=
    hanti h0mem htmem (le_of_lt ht)
  exact chewi58_gap_le_of_lyapunov_le_initial ht hL

/--
Convexity side of Chewi's Theorem 5.8 derivative calculation.  Once the
Lyapunov derivative has been simplified to
`t * (f x_t - f*) - t * <grad f x_t, x_t - x*>`, the first-order convex lower
model makes it nonpositive for `t >= 0`.
-/
theorem chewi58LyapunovDerivative_nonpos_of_firstOrderConvex
    {f : E -> ℝ} {grad : E -> E} {fstar L' t : ℝ}
    {x : ℝ -> E} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hfxStar : f xStar = fstar)
    (ht_nonneg : 0 ≤ t)
    (hL' : L' =
      t * (f (x t) - fstar) -
        t * inner ℝ (grad (x t)) (x t - xStar)) :
    L' ≤ 0 := by
  have hmodel :=
    hfirst.lower_model (x := x t) (by simp) (y := xStar) (by simp)
  have hinner :
      inner ℝ (grad (x t)) (xStar - x t) =
        -inner ℝ (grad (x t)) (x t - xStar) := by
    have hsub : xStar - x t = -(x t - xStar) := by abel
    rw [hsub, inner_neg_right]
  have hgap_le :
      f (x t) - fstar ≤ inner ℝ (grad (x t)) (x t - xStar) := by
    rw [← hfxStar]
    nlinarith [hmodel, hinner]
  have hmul :
      t * (f (x t) - fstar) ≤
        t * inner ℝ (grad (x t)) (x t - xStar) :=
    mul_le_mul_of_nonneg_left hgap_le ht_nonneg
  rw [hL']
  nlinarith

/--
Derivative-to-rate wrapper for Theorem 5.8.  The source proof computes
`d L_t / dt <= 0`; mathlib's monotonicity theorem turns that into the
antitone hypothesis consumed above.
-/
theorem chewi58_gap_le_of_lyapunov_derivative_nonpos
    {f : E -> ℝ} {fstar : ℝ} {x p : ℝ -> E} {xStar : E} {t : ℝ}
    {L' : ℝ -> ℝ}
    (hcont :
      ContinuousOn (chewi58Lyapunov f fstar x p xStar) (Set.Ici (0 : ℝ)))
    (hderiv : ∀ s, s ∈ interior (Set.Ici (0 : ℝ)) ->
      HasDerivWithinAt (chewi58Lyapunov f fstar x p xStar)
        (L' s) (interior (Set.Ici (0 : ℝ))) s)
    (hderiv_nonpos : ∀ s, s ∈ interior (Set.Ici (0 : ℝ)) -> L' s ≤ 0)
    (ht : 0 < t) :
    f (x t) - fstar ≤
      2 * ‖x 0 - xStar‖ ^ (2 : ℕ) / t ^ (2 : ℕ) := by
  have hanti :
      AntitoneOn (chewi58Lyapunov f fstar x p xStar) (Set.Ici (0 : ℝ)) :=
    antitoneOn_of_hasDerivWithinAt_nonpos
      (convex_Ici (0 : ℝ)) hcont hderiv hderiv_nonpos
  exact chewi58_gap_le_of_lyapunov_antitoneOn hanti ht

/--
Source-shaped derivative-formula wrapper for Chewi Theorem 5.8.  It separates
the hard calculus identity for `d L_t / dt` from the already-formalized
convexity and monotonicity close-out.
-/
theorem chewi58_gap_le_of_lyapunov_derivative_formula_firstOrderConvex
    {f : E -> ℝ} {grad : E -> E} {fstar : ℝ}
    {x p : ℝ -> E} {xStar : E} {t : ℝ} {L' : ℝ -> ℝ}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad 0)
    (hfxStar : f xStar = fstar)
    (hcont :
      ContinuousOn (chewi58Lyapunov f fstar x p xStar) (Set.Ici (0 : ℝ)))
    (hderiv : ∀ s, s ∈ interior (Set.Ici (0 : ℝ)) ->
      HasDerivWithinAt (chewi58Lyapunov f fstar x p xStar)
        (L' s) (interior (Set.Ici (0 : ℝ))) s)
    (hderiv_formula : ∀ s, s ∈ interior (Set.Ici (0 : ℝ)) ->
      L' s =
        s * (f (x s) - fstar) -
          s * inner ℝ (grad (x s)) (x s - xStar))
    (ht : 0 < t) :
    f (x t) - fstar ≤
      2 * ‖x 0 - xStar‖ ^ (2 : ℕ) / t ^ (2 : ℕ) := by
  refine chewi58_gap_le_of_lyapunov_derivative_nonpos
    (f := f) (fstar := fstar) (x := x) (p := p) (xStar := xStar)
    (L' := L') hcont hderiv ?_ ht
  intro s hs
  have hs_nonneg : 0 ≤ s := by
    exact le_of_lt (by simpa using hs)
  exact chewi58LyapunovDerivative_nonpos_of_firstOrderConvex
    (x := x) (xStar := xStar) hfirst hfxStar hs_nonneg
    (hderiv_formula s hs)

end Optimization
end StatInference
