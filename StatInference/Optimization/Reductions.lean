import StatInference.Optimization.Basic

/-!
# Reductions between convex and strongly convex optimization

This module starts the proof-carrying layer for Chewi §4.1.  The first target
is Lemma 4.2: the quadratic regularization
`f_delta = f + delta / 2 * ‖· - x0‖^2` converts first-order convex/smooth
interfaces into first-order strongly-convex/smoother interfaces.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Chewi Lemma 4.2 regularized objective `f_delta`. -/
noncomputable def quadraticRegularizedAround (f : E -> ℝ) (delta : ℝ)
    (x0 : E) : E -> ℝ :=
  fun x => f x + (delta / 2) * ‖x - x0‖ ^ (2 : ℕ)

/-- Supplied gradient for `quadraticRegularizedAround`. -/
noncomputable def regularizedGradient (grad : E -> E) (delta : ℝ)
    (x0 : E) : E -> E :=
  fun x => grad x + delta • (x - x0)

omit [InnerProductSpace ℝ E] in
theorem quadraticRegularizedAround_apply (f : E -> ℝ) (delta : ℝ)
    (x0 x : E) :
    quadraticRegularizedAround f delta x0 x =
      f x + (delta / 2) * ‖x - x0‖ ^ (2 : ℕ) :=
  rfl

theorem regularizedGradient_apply (grad : E -> E) (delta : ℝ)
    (x0 x : E) :
    regularizedGradient grad delta x0 x = grad x + delta • (x - x0) :=
  rfl

private theorem regularization_norm_sq_expansion (delta : ℝ) (x0 x y : E) :
    (delta / 2) * ‖x - x0‖ ^ (2 : ℕ) +
        inner ℝ (delta • (x - x0)) (y - x) +
          (delta / 2) * ‖y - x‖ ^ (2 : ℕ) =
      (delta / 2) * ‖y - x0‖ ^ (2 : ℕ) := by
  have hdecomp : y - x0 = (x - x0) + (y - x) := by
    abel
  rw [hdecomp, norm_add_sq_real]
  simp [real_inner_smul_left]
  ring

/--
Quadratic regularization shifts the first-order strong-convexity parameter by
`delta`.  In particular, a `0`-convex lower model becomes `delta`-strongly
convex after adding `delta / 2 * ‖· - x0‖^2`.
-/
theorem quadraticRegularizedAround_firstOrderStrongConvexOn
    {f : E -> ℝ} {grad : E -> E} {alpha delta : ℝ} {x0 : E}
    (hfirst : FirstOrderStrongConvexOn Set.univ f grad alpha) :
    FirstOrderStrongConvexOn Set.univ
      (quadraticRegularizedAround f delta x0)
      (regularizedGradient grad delta x0) (alpha + delta) := by
  refine ⟨convex_univ, ?_⟩
  intro x hx y hy
  have hmodel := hfirst.lower_model hx hy
  have hquad := regularization_norm_sq_expansion delta x0 x y
  simp [quadraticRegularizedAround, regularizedGradient, inner_add_left]
  nlinarith

/--
Quadratic regularization shifts the smoothness upper-model parameter by
`delta`.
-/
theorem quadraticRegularizedAround_smoothWithGradientOn
    {f : E -> ℝ} {grad : E -> E} {beta delta : ℝ} {x0 : E}
    (hsmooth : SmoothWithGradientOn Set.univ f grad beta) :
    SmoothWithGradientOn Set.univ
      (quadraticRegularizedAround f delta x0)
      (regularizedGradient grad delta x0) (beta + delta) := by
  refine ⟨convex_univ, ?_, ?_⟩
  · have hquad_cont :
        ContinuousOn
          (fun x : E => (delta / 2) * ‖x - x0‖ ^ (2 : ℕ)) Set.univ := by
      exact
        (continuous_const.mul
          (((continuous_id.sub continuous_const).norm).pow (2 : ℕ))).continuousOn
    simpa [quadraticRegularizedAround] using hsmooth.continuousOn.add hquad_cont
  · intro x hx y hy
    have hupper := hsmooth.upper_model hx hy
    have hquad := regularization_norm_sq_expansion delta x0 x y
    simp [quadraticRegularizedAround, regularizedGradient, inner_add_left]
    nlinarith

omit [InnerProductSpace ℝ E] in
/-- The regularized objective dominates the base objective when `delta >= 0`. -/
theorem le_quadraticRegularizedAround
    {f : E -> ℝ} {delta : ℝ} {x0 x : E} (hdelta : 0 ≤ delta) :
    f x ≤ quadraticRegularizedAround f delta x0 x := by
  have hsq : 0 ≤ ‖x - x0‖ ^ (2 : ℕ) := sq_nonneg _
  simp [quadraticRegularizedAround]
  nlinarith

omit [InnerProductSpace ℝ E] in
/--
Source-shaped value chain from Lemma 4.2: an approximate minimizer of the
regularized problem is good for the original objective up to the regularization
penalty at any comparison point.
-/
theorem quadraticRegularizedAround_near_min_le_base_add_penalty
    {f : E -> ℝ} {delta eps : ℝ} {x0 x xDelta xStar : E}
    (hdelta : 0 ≤ delta)
    (hx_near :
      quadraticRegularizedAround f delta x0 x ≤
        quadraticRegularizedAround f delta x0 xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround f delta x0 xDelta ≤
        quadraticRegularizedAround f delta x0 xStar) :
    f x ≤ f xStar + (delta / 2) * ‖xStar - x0‖ ^ (2 : ℕ) + eps / 2 := by
  have hfx_le : f x ≤ quadraticRegularizedAround f delta x0 x :=
    le_quadraticRegularizedAround hdelta
  simp [quadraticRegularizedAround] at hx_near hDelta_le ⊢
  nlinarith

omit [InnerProductSpace ℝ E] in
/--
The previous source chain becomes an `eps`-gap once the regularization penalty
at the comparison minimizer is at most `eps`.
-/
theorem quadraticRegularizedAround_near_min_gap_le_eps
    {f : E -> ℝ} {delta eps : ℝ} {x0 x xDelta xStar : E}
    (hdelta : 0 ≤ delta)
    (hpenalty : delta * ‖xStar - x0‖ ^ (2 : ℕ) ≤ eps)
    (hx_near :
      quadraticRegularizedAround f delta x0 x ≤
        quadraticRegularizedAround f delta x0 xDelta + eps / 2)
    (hDelta_le :
      quadraticRegularizedAround f delta x0 xDelta ≤
        quadraticRegularizedAround f delta x0 xStar) :
    f x - f xStar ≤ eps := by
  have hvalue :=
    quadraticRegularizedAround_near_min_le_base_add_penalty
      (f := f) (delta := delta) (eps := eps) (x0 := x0)
      (x := x) (xDelta := xDelta) (xStar := xStar)
      hdelta hx_near hDelta_le
  nlinarith

omit [InnerProductSpace ℝ E] in
/--
Radius control implies the penalty estimate used after choosing
`delta = eps / R^2` in Lemma 4.2.
-/
theorem regularization_penalty_le_of_norm_le
    {delta eps R : ℝ} {x0 xStar : E}
    (hdelta : 0 ≤ delta) (hR_nonneg : 0 ≤ R)
    (hR : ‖xStar - x0‖ ≤ R)
    (hdeltaR : delta * R ^ (2 : ℕ) ≤ eps) :
    delta * ‖xStar - x0‖ ^ (2 : ℕ) ≤ eps := by
  have hsq :
      ‖xStar - x0‖ ^ (2 : ℕ) ≤ R ^ (2 : ℕ) :=
    (sq_le_sq₀ (norm_nonneg _) hR_nonneg).mpr hR
  have hmul := mul_le_mul_of_nonneg_left hsq hdelta
  exact hmul.trans hdeltaR

omit [InnerProductSpace ℝ E] in
/--
When the regularized minimizer is no worse than a base minimizer, its initial
distance is no larger.  This is the distance estimate used in the complexity
part of Chewi Lemma 4.2.
-/
theorem regularized_minimizer_dist_le_of_base_min
    {f : E -> ℝ} {delta : ℝ} {x0 xDelta xStar : E}
    (hdelta : 0 < delta)
    (hDelta_le :
      quadraticRegularizedAround f delta x0 xDelta ≤
        quadraticRegularizedAround f delta x0 xStar)
    (hbase_min : f xStar ≤ f xDelta) :
    ‖xDelta - x0‖ ≤ ‖xStar - x0‖ := by
  have hcoef_pos : 0 < delta / 2 := by
    nlinarith
  have hsq_le :
      ‖xDelta - x0‖ ^ (2 : ℕ) ≤ ‖xStar - x0‖ ^ (2 : ℕ) := by
    simp [quadraticRegularizedAround] at hDelta_le
    nlinarith
  exact (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mp hsq_le

/-- If `delta <= beta`, the regularized smoothness constant is bounded by `2 beta`. -/
theorem regularized_smoothness_le_two_beta
    {beta delta : ℝ} (hdelta_le_beta : delta ≤ beta) :
    beta + delta ≤ 2 * beta := by
  nlinarith

end Optimization
end StatInference
