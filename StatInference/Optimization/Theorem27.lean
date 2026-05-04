import StatInference.Optimization.GradientFlow
import Mathlib.Analysis.Calculus.Deriv.MeanValue

/-!
# Chewi Proposition 2.7

This module starts the main-text implications around the Polyak-Lojasiewicz
inequality.  The first compiled block proves the source implication
`strong convexity => PL` from the already compiled first-order lower model.
-/

namespace StatInference
namespace Optimization

open Set Filter
open scoped Topology
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Proposition 2.7 / `(QG)`, in exact infimum form over minimizers with
reference value `fstar`.
-/
def QuadraticGrowthOn (C : Set E) (f : E -> ℝ) (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    (alpha / 2) *
        sInf ((fun xStar => ‖x - xStar‖ ^ (2 : ℕ)) ''
          {xStar | xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar}) ≤
      f x - fstar

/--
A witness form of `(QG)`: for each `x`, exhibit a minimizer whose squared
distance already satisfies the quadratic-growth bound.  This immediately
implies the source infimum form.
-/
def QuadraticGrowthWitnessOn (C : Set E) (f : E -> ℝ)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
      (alpha / 2) * ‖x - xStar‖ ^ (2 : ℕ) ≤ f x - fstar

/--
The analytic gradient-flow route used in Chewi's proof that `PŁ => QG`.

The notes assume convergence of the gradient flow and monotonicity of the
Lyapunov quantity
`sqrt(alpha / 2) * ||x_t - x_0|| + sqrt(f(x_t) - fstar)`.  This interface
records exactly the limit inequality left after that analytic argument; the
algebra from this interface to `(QG)` is proved below.
-/
def PLGradientFlowLimitRouteToQGOn (C : Set E) (f : E -> ℝ)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
      Real.sqrt (alpha / 2) * ‖x - xStar‖ ≤
        Real.sqrt (f x - fstar)

/--
The more explicit Lyapunov-and-convergence route appearing in Chewi's proof
of `PŁ => QG`.  For each starting point `x`, it supplies a convergent
gradient-flow trajectory and the Lyapunov inequality
`sqrt(alpha / 2) * ||x_t - x|| + sqrt(f(x_t) - fstar) <= sqrt(f(x)-fstar)`.
-/
def PLGradientFlowLyapunovRouteToQGOn (C : Set E) (f : E -> ℝ)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          (∀ t, 0 ≤ t ->
            Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar) ≤
              Real.sqrt (f x - fstar))

/--
An even more explicit route for Chewi Proposition 2.7(2): the Lyapunov
quantity is antitone on nonnegative times.  This is the exact monotonicity
conclusion obtained after the derivative calculation in the notes.
-/
def PLGradientFlowLyapunovAntitoneRouteToQGOn (C : Set E) (f : E -> ℝ)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          AntitoneOn
            (fun t =>
              Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar))
            (Set.Ici (0 : ℝ))

/--
Derivative-level route for Chewi Proposition 2.7(2).  This is the analytic
calculus statement immediately before the monotonicity conclusion in the
notes: the Lyapunov expression is continuous on nonnegative time and has
nonpositive derivative on positive time.
-/
def PLGradientFlowLyapunovDerivativeRouteToQGOn (C : Set E) (f : E -> ℝ)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E, ∃ L' : ℝ -> ℝ,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          ContinuousOn
            (fun t =>
              Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar))
            (Set.Ici (0 : ℝ)) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            HasDerivWithinAt
              (fun s =>
                Real.sqrt (alpha / 2) * ‖y s - x‖ +
                  Real.sqrt (f (y s) - fstar))
              (L' t) (interior (Set.Ici (0 : ℝ))) t) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> L' t ≤ 0)

/--
Differential-estimate route for the displayed calculation in Chewi's proof of
`PŁ => QG`.  It exposes the part still coming from gradient-flow calculus:
the derivative of the Lyapunov quantity is bounded by the expression that the
PL inequality makes nonpositive.
-/
def PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn
    (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E, ∃ L' : ℝ -> ℝ,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          ContinuousOn
            (fun t =>
              Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar))
            (Set.Ici (0 : ℝ)) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t ∈ C) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            0 < f (y t) - fstar) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            HasDerivWithinAt
              (fun s =>
                Real.sqrt (alpha / 2) * ‖y s - x‖ +
                  Real.sqrt (f (y s) - fstar))
              (L' t) (interior (Set.Ici (0 : ℝ))) t) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            L' t ≤
              Real.sqrt (alpha / 2) * ‖grad (y t)‖ -
                ‖grad (y t)‖ ^ (2 : ℕ) /
                  (2 * Real.sqrt (f (y t) - fstar)))

/--
Component-derivative route for Chewi's Lyapunov calculation.  It separates
the two analytic facts used in the proof: the derivative of the norm term is
bounded by the gradient norm, and the objective-gap derivative is the Lemma
2.1 gradient-flow derivative.
-/
def PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn
    (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E, ∃ normSlope : ℝ -> ℝ,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          ContinuousOn
            (fun t =>
              Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar))
            (Set.Ici (0 : ℝ)) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t ∈ C) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            0 < f (y t) - fstar) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            HasDerivWithinAt (fun s => ‖y s - x‖) (normSlope t)
              (interior (Set.Ici (0 : ℝ))) t) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            normSlope t ≤ ‖grad (y t)‖) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            HasDerivWithinAt (fun s => f (y s) - fstar)
              (-(‖grad (y t)‖ ^ (2 : ℕ)))
              (interior (Set.Ici (0 : ℝ))) t)

/--
Norm-derivative route for Chewi Proposition 2.7(2).  Compared with the
component route, the objective-gap derivative is no longer supplied: it is
recovered from the existing gradient-flow trajectory and gradient oracle.
-/
def PLGradientFlowLyapunovNormDerivativeRouteToQGOn
    (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E, ∃ normSlope : ℝ -> ℝ,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          IsGradientFlowTrajectory grad y ∧
          ContinuousOn
            (fun t =>
              Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar))
            (Set.Ici (0 : ℝ)) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t ∈ C) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            0 < f (y t) - fstar) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            HasDerivWithinAt (fun s => ‖y s - x‖) (normSlope t)
              (interior (Set.Ici (0 : ℝ))) t) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            normSlope t ≤ ‖grad (y t)‖)

/--
Nonzero-displacement route for Chewi Proposition 2.7(2).  This is close to
the displayed proof: the trajectory solves gradient flow, has positive
objective gap on positive time, and the distance from the start is nonzero
where the classical derivative of the norm is taken.
-/
def PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn
    (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          IsGradientFlowTrajectory grad y ∧
          ContinuousOn
            (fun t =>
              Real.sqrt (alpha / 2) * ‖y t - x‖ +
                Real.sqrt (f (y t) - fstar))
            (Set.Ici (0 : ℝ)) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t ∈ C) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            0 < f (y t) - fstar) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t - x ≠ 0)

/--
Continuous-data route for Chewi Proposition 2.7(2).  It replaces the supplied
continuity of the Lyapunov expression by continuity of the trajectory and of
the objective gap along that trajectory.
-/
def PLGradientFlowLyapunovContinuousDataRouteToQGOn
    (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (_alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          IsGradientFlowTrajectory grad y ∧
          ContinuousOn y (Set.Ici (0 : ℝ)) ∧
          ContinuousOn (fun t => f (y t) - fstar) (Set.Ici (0 : ℝ)) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t ∈ C) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            0 < f (y t) - fstar) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t - x ≠ 0)

/--
Side-condition route for Chewi Proposition 2.7(2).  Continuity of the
trajectory and objective gap are not part of the data here; they are derived
from the gradient-flow differentiability assumptions.
-/
def PLGradientFlowLyapunovSideConditionRouteToQGOn
    (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (_alpha fstar : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C ->
    ∃ xStar, ∃ y : ℝ -> E,
      xStar ∈ C ∧ IsMinOn f C xStar ∧ f xStar = fstar ∧
        y 0 = x ∧ Tendsto y atTop (𝓝 xStar) ∧
          IsGradientFlowTrajectory grad y ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t ∈ C) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) ->
            0 < f (y t) - fstar) ∧
          (∀ t, t ∈ interior (Set.Ici (0 : ℝ)) -> y t - x ≠ 0)

omit [NormedAddCommGroup E] [InnerProductSpace ℝ E] in
/--
Scalar algebra in Chewi Proposition 2.7(2): under the PL lower bound,
the displayed upper bound for the Lyapunov derivative is nonpositive.
-/
theorem plLyapunovDerivativeBound_nonpos
    {alpha gap g : ℝ}
    (halpha : 0 ≤ alpha) (hgap : 0 < gap) (hg : 0 ≤ g)
    (hpl : 2 * alpha * gap ≤ g ^ (2 : ℕ)) :
    Real.sqrt (alpha / 2) * g -
        g ^ (2 : ℕ) / (2 * Real.sqrt gap) ≤ 0 := by
  have hs_pos : 0 < Real.sqrt gap := Real.sqrt_pos.2 hgap
  have hcoef_nonneg :
      0 ≤ 2 * Real.sqrt gap * Real.sqrt (alpha / 2) := by
    positivity
  have hs_sq : (Real.sqrt gap) ^ (2 : ℕ) = gap :=
    Real.sq_sqrt hgap.le
  have hc_sq : (Real.sqrt (alpha / 2)) ^ (2 : ℕ) = alpha / 2 := by
    exact Real.sq_sqrt (by nlinarith)
  have hsq :
      (2 * Real.sqrt gap * Real.sqrt (alpha / 2)) ^ (2 : ℕ) ≤
        g ^ (2 : ℕ) := by
    rw [mul_pow, mul_pow, hs_sq, hc_sq]
    nlinarith
  have hcoef_le_g :
      2 * Real.sqrt gap * Real.sqrt (alpha / 2) ≤ g :=
    (sq_le_sq₀ hcoef_nonneg hg).mp hsq
  have hmul :
      (2 * Real.sqrt gap * Real.sqrt (alpha / 2)) * g ≤
        g ^ (2 : ℕ) := by
    have := mul_le_mul_of_nonneg_right hcoef_le_g hg
    nlinarith
  have hden_pos : 0 < 2 * Real.sqrt gap := by
    positivity
  have hle :
      Real.sqrt (alpha / 2) * g ≤
        g ^ (2 : ℕ) / (2 * Real.sqrt gap) := by
    rw [le_div_iff₀ hden_pos]
    nlinarith
  nlinarith

/--
Chewi Proposition 2.7, first implication, in first-order lower-model form:
positive strong convexity implies the Polyak-Lojasiewicz inequality with
reference value `f xStar`.

The proof is the textbook argument: set `y = xStar` in the first-order lower
model, use Cauchy-Schwarz, then apply Young's inequality.
-/
theorem polyakLojasiewiczOn_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hxStar : xStar ∈ C) :
    PolyakLojasiewiczOn C f grad alpha (f xStar) := by
  intro x hx
  let dvec : E := x - xStar
  let r : ℝ := ‖grad x‖
  let d : ℝ := ‖dvec‖
  have hmodel := hfirst.lower_model hx hxStar
  have hmodel' :
      f x - f xStar ≤
        inner ℝ (grad x) dvec - (alpha / 2) * d ^ (2 : ℕ) := by
    dsimp [dvec, d]
    have hinner : inner ℝ (grad x) (xStar - x) =
        -inner ℝ (grad x) (x - xStar) := by
      have hsub : xStar - x = -(x - xStar) := by
        simp
      rw [hsub, inner_neg_right]
    have hnorm : ‖xStar - x‖ ^ (2 : ℕ) = ‖x - xStar‖ ^ (2 : ℕ) := by
      rw [norm_sub_rev]
    rw [hinner, hnorm] at hmodel
    nlinarith
  have hinner_le : inner ℝ (grad x) dvec ≤ r * d := by
    simpa [r, d] using real_inner_le_norm (grad x) dvec
  have hgap_le :
      f x - f xStar ≤ r * d - (alpha / 2) * d ^ (2 : ℕ) := by
    nlinarith
  have hyoung :
      r * d - (alpha / 2) * d ^ (2 : ℕ) ≤
        r ^ (2 : ℕ) / (2 * alpha) := by
    have h2a : 0 < 2 * alpha := by
      nlinarith
    rw [le_div_iff₀ h2a]
    have hsquare : 0 ≤ (r - alpha * d) ^ (2 : ℕ) := sq_nonneg _
    nlinarith
  have hgap_le2 : f x - f xStar ≤ r ^ (2 : ℕ) / (2 * alpha) :=
    hgap_le.trans hyoung
  have hmul :
      2 * alpha * (f x - f xStar) ≤
        2 * alpha * (r ^ (2 : ℕ) / (2 * alpha)) :=
    mul_le_mul_of_nonneg_left hgap_le2 (by nlinarith)
  have hcancel : 2 * alpha * (r ^ (2 : ℕ) / (2 * alpha)) =
      r ^ (2 : ℕ) := by
    field_simp [halpha.ne']
  rw [hcancel] at hmul
  simpa [r] using hmul

/--
Chewi Proposition 2.7, first implication, from whole-space segment strong
convexity plus mathlib gradients.
-/
theorem polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E}
    {alpha : ℝ} {xStar : E}
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hgrad : ∀ x, HasGradientAt f (grad x) x)
    (halpha : 0 < alpha) :
    PolyakLojasiewiczOn Set.univ f grad alpha (f xStar) :=
  polyakLojasiewiczOn_of_firstOrderStrongConvexOn
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    halpha (by simp)

/--
Chewi Proposition 2.7, first implication, in source minimizer notation.  The
minimizer hypothesis records the textbook role of `xStar`; the proof itself
uses only the first-order lower model at `xStar`.
-/
theorem polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hxStar : xStar ∈ C)
    (_hmin : IsMinOn f C xStar) :
    PolyakLojasiewiczOn C f grad alpha (f xStar) :=
  polyakLojasiewiczOn_of_firstOrderStrongConvexOn
    hfirst halpha hxStar

omit [InnerProductSpace ℝ E] in
/--
The antitone Lyapunov route gives the pointwise Lyapunov inequality used by
the convergence route.
-/
theorem plGradientFlowLyapunovRouteToQGOn_of_antitoneRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (hroute : PLGradientFlowLyapunovAntitoneRouteToQGOn C f alpha fstar) :
    PLGradientFlowLyapunovRouteToQGOn C f alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv, hanti⟩
  refine ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv, ?_⟩
  intro t ht
  have h0mem : (0 : ℝ) ∈ Set.Ici (0 : ℝ) := by simp
  have htmem : t ∈ Set.Ici (0 : ℝ) := ht
  have hle := hanti h0mem htmem ht
  simpa [hy0] using hle

omit [InnerProductSpace ℝ E] in
/--
The derivative calculation in Chewi's proof gives the antitone Lyapunov
route, via mathlib's one-dimensional mean-value monotonicity theorem on
`[0, ∞)`.
-/
theorem plGradientFlowLyapunovAntitoneRouteToQGOn_of_derivativeRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (hroute : PLGradientFlowLyapunovDerivativeRouteToQGOn C f alpha fstar) :
    PLGradientFlowLyapunovAntitoneRouteToQGOn C f alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, L', hxStar, hmin, hfxStar, hy0, hyconv,
      hcont, hderiv, hderiv_nonpos⟩
  refine ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv, ?_⟩
  exact antitoneOn_of_hasDerivWithinAt_nonpos
    (convex_Ici (0 : ℝ)) hcont hderiv hderiv_nonpos

omit [InnerProductSpace ℝ E] in
/--
The derivative-level Lyapunov route implies the pointwise Lyapunov inequality
used by the convergence-to-limit algebra.
-/
theorem plGradientFlowLyapunovRouteToQGOn_of_derivativeRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (hroute : PLGradientFlowLyapunovDerivativeRouteToQGOn C f alpha fstar) :
    PLGradientFlowLyapunovRouteToQGOn C f alpha fstar :=
  plGradientFlowLyapunovRouteToQGOn_of_antitoneRoute
    (plGradientFlowLyapunovAntitoneRouteToQGOn_of_derivativeRoute hroute)

omit [InnerProductSpace ℝ E] in
/--
The separated norm/gap derivative estimates imply Chewi's displayed
Lyapunov derivative upper bound.
-/
theorem plGradientFlowLyapunovDifferentialEstimateRouteToQGOn_of_derivativeComponentsRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hroute :
      PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn
      C f grad alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, normSlope, hxStar, hmin, hfxStar, hy0, hyconv,
      hcont, hy_mem, hgap_pos, hnorm_deriv, hnorm_le, hgap_deriv⟩
  refine ⟨xStar, y,
    (fun t =>
      Real.sqrt (alpha / 2) * normSlope t +
        (-(‖grad (y t)‖ ^ (2 : ℕ))) /
          (2 * Real.sqrt (f (y t) - fstar))),
    hxStar, hmin, hfxStar, hy0, hyconv, hcont, hy_mem, hgap_pos, ?_, ?_⟩
  · intro t ht
    have hsqrt := (hgap_deriv t ht).sqrt (by nlinarith [hgap_pos t ht])
    have hnorm' := (hnorm_deriv t ht).const_mul (Real.sqrt (alpha / 2))
    simpa using hnorm'.add hsqrt
  · intro t ht
    have hcoef_nonneg : 0 ≤ Real.sqrt (alpha / 2) :=
      Real.sqrt_nonneg _
    have hmul :=
      mul_le_mul_of_nonneg_left (hnorm_le t ht) hcoef_nonneg
    ring_nf at hmul ⊢
    linarith

/--
The gradient-flow trajectory supplies the objective-gap derivative component
via the already compiled Lemma 2.1 calculus layer.
-/
theorem plGradientFlowLyapunovDerivativeComponentsRouteToQGOn_of_normDerivativeRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hroute :
      PLGradientFlowLyapunovNormDerivativeRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn
      C f grad alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, normSlope, hxStar, hmin, hfxStar, hy0, hyconv,
      hflow, hcont, hy_mem, hgap_pos, hnorm_deriv, hnorm_le⟩
  refine ⟨xStar, y, normSlope, hxStar, hmin, hfxStar, hy0, hyconv,
    hcont, hy_mem, hgap_pos, hnorm_deriv, hnorm_le, ?_⟩
  intro t _ht
  exact
    (gradientFlow_gap_hasDerivAt (t := t) (fstar := fstar)
      hgrad hflow).hasDerivWithinAt

/--
For a genuine gradient-flow trajectory, the classical derivative of
`t ↦ ||y t - x||` away from zero is bounded by `||grad (y t)||`.  This proves
the norm-derivative route from the nonzero-displacement route.
-/
theorem plGradientFlowLyapunovNormDerivativeRouteToQGOn_of_nonzeroDisplacementRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hroute :
      PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovNormDerivativeRouteToQGOn
      C f grad alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv,
      hflow, hcont, hy_mem, hgap_pos, hnonzero⟩
  refine ⟨xStar, y,
    (fun t =>
      (2 * inner ℝ (y t - x) (-(grad (y t)))) /
        (2 * Real.sqrt (‖y t - x‖ ^ (2 : ℕ)))),
    hxStar, hmin, hfxStar, hy0, hyconv, hflow,
    hcont, hy_mem, hgap_pos, ?_, ?_⟩
  · intro t ht
    have hdiff : HasDerivAt (fun s => y s - x) (-(grad (y t))) t := by
      simpa using (hflow t).sub_const x
    let D : Set ℝ := interior (Set.Ici (0 : ℝ))
    have hsq := (hdiff.hasDerivWithinAt (s := D)).norm_sq
    have hsq_ne : ‖y t - x‖ ^ (2 : ℕ) ≠ 0 :=
      pow_ne_zero _ (norm_ne_zero_iff.mpr (hnonzero t ht))
    have hsqrt := hsq.sqrt hsq_ne
    convert hsqrt using 1
    · ext s
      exact (Real.sqrt_sq (norm_nonneg _)).symm
  · intro t ht
    have hnorm_pos : 0 < ‖y t - x‖ :=
      norm_pos_iff.mpr (hnonzero t ht)
    have hsqrt :
        Real.sqrt (‖y t - x‖ ^ (2 : ℕ)) = ‖y t - x‖ :=
      Real.sqrt_sq (norm_nonneg _)
    change
      (2 * inner ℝ (y t - x) (-(grad (y t)))) /
          (2 * Real.sqrt (‖y t - x‖ ^ (2 : ℕ))) ≤
        ‖grad (y t)‖
    rw [hsqrt]
    rw [div_le_iff₀ (by positivity : 0 < 2 * ‖y t - x‖)]
    have hinner_le :
        inner ℝ (y t - x) (-(grad (y t))) ≤
          ‖y t - x‖ * ‖grad (y t)‖ := by
      calc
        inner ℝ (y t - x) (-(grad (y t))) ≤
            ‖y t - x‖ * ‖-(grad (y t))‖ :=
          real_inner_le_norm _ _
        _ = ‖y t - x‖ * ‖grad (y t)‖ := by simp
    nlinarith

/--
Continuity of the trajectory and of the objective gap along it gives
continuity of Chewi's Lyapunov expression.
-/
theorem plGradientFlowLyapunovNonzeroDisplacementRouteToQGOn_of_continuousDataRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hroute :
      PLGradientFlowLyapunovContinuousDataRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn
      C f grad alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv,
      hflow, hy_cont, hgap_cont, hy_mem, hgap_pos, hnonzero⟩
  have hnorm_cont : ContinuousOn (fun t => ‖y t - x‖) (Set.Ici (0 : ℝ)) := by
    exact (hy_cont.sub continuousOn_const).norm
  have hlyap_cont :
      ContinuousOn
        (fun t =>
          Real.sqrt (alpha / 2) * ‖y t - x‖ +
            Real.sqrt (f (y t) - fstar))
        (Set.Ici (0 : ℝ)) :=
    (hnorm_cont.const_mul (Real.sqrt (alpha / 2))).add hgap_cont.sqrt
  exact ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv, hflow,
    hlyap_cont, hy_mem, hgap_pos, hnonzero⟩

/--
The gradient-flow differentiability assumptions give the trajectory and
objective-gap continuity required by the continuous-data route.
-/
theorem plGradientFlowLyapunovContinuousDataRouteToQGOn_of_sideConditionRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hroute :
      PLGradientFlowLyapunovSideConditionRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovContinuousDataRouteToQGOn
      C f grad alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv,
      hflow, hy_mem, hgap_pos, hnonzero⟩
  have hy_cont : ContinuousOn y (Set.Ici (0 : ℝ)) := by
    exact HasDerivAt.continuousOn (s := Set.Ici (0 : ℝ))
      (fun t _ht => hflow t)
  have hgap_cont :
      ContinuousOn (fun t => f (y t) - fstar) (Set.Ici (0 : ℝ)) := by
    exact HasDerivAt.continuousOn (s := Set.Ici (0 : ℝ))
      (fun t _ht =>
        gradientFlow_gap_hasDerivAt (t := t) (fstar := fstar)
          hgrad hflow)
  exact ⟨xStar, y, hxStar, hmin, hfxStar, hy0, hyconv, hflow,
    hy_cont, hgap_cont, hy_mem, hgap_pos, hnonzero⟩

omit [InnerProductSpace ℝ E] in
/--
The differential estimate in Chewi's display, together with the PL
inequality, supplies the nonpositive-derivative route.
-/
theorem plGradientFlowLyapunovDerivativeRouteToQGOn_of_differentialEstimateRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (halpha : 0 ≤ alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovDerivativeRouteToQGOn C f alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, L', hxStar, hmin, hfxStar, hy0, hyconv,
      hcont, hy_mem, hgap_pos, hderiv, hderiv_bound⟩
  refine ⟨xStar, y, L', hxStar, hmin, hfxStar, hy0, hyconv,
    hcont, hderiv, ?_⟩
  intro t ht
  have hpl_t :
      2 * alpha * (f (y t) - fstar) ≤
        ‖grad (y t)‖ ^ (2 : ℕ) :=
    hpl (hy_mem t ht)
  have hscalar :
      Real.sqrt (alpha / 2) * ‖grad (y t)‖ -
          ‖grad (y t)‖ ^ (2 : ℕ) /
            (2 * Real.sqrt (f (y t) - fstar)) ≤ 0 :=
    plLyapunovDerivativeBound_nonpos
      halpha (hgap_pos t ht) (norm_nonneg _) hpl_t
  exact (hderiv_bound t ht).trans hscalar

omit [InnerProductSpace ℝ E] in
/--
The differential estimate plus PL gives the pointwise Lyapunov inequality
used by the convergence route.
-/
theorem plGradientFlowLyapunovRouteToQGOn_of_differentialEstimateRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (halpha : 0 ≤ alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovRouteToQGOn C f alpha fstar :=
  plGradientFlowLyapunovRouteToQGOn_of_derivativeRoute
    (plGradientFlowLyapunovDerivativeRouteToQGOn_of_differentialEstimateRoute
      halpha hpl hroute)

omit [InnerProductSpace ℝ E] in
/--
The component-derivative route plus PL gives the pointwise Lyapunov
inequality used by the convergence route.
-/
theorem plGradientFlowLyapunovRouteToQGOn_of_derivativeComponentsRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (halpha : 0 ≤ alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovRouteToQGOn C f alpha fstar :=
  plGradientFlowLyapunovRouteToQGOn_of_differentialEstimateRoute
    halpha hpl
    (plGradientFlowLyapunovDifferentialEstimateRouteToQGOn_of_derivativeComponentsRoute
      hroute)

/--
The norm-derivative route plus the gradient-flow calculus layer gives the
pointwise Lyapunov inequality used by the convergence route.
-/
theorem plGradientFlowLyapunovRouteToQGOn_of_normDerivativeRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (halpha : 0 ≤ alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovNormDerivativeRouteToQGOn
        C f grad alpha fstar) :
    PLGradientFlowLyapunovRouteToQGOn C f alpha fstar :=
  plGradientFlowLyapunovRouteToQGOn_of_derivativeComponentsRoute
    halpha hpl
    (plGradientFlowLyapunovDerivativeComponentsRouteToQGOn_of_normDerivativeRoute
      hgrad hroute)

omit [InnerProductSpace ℝ E] in
/--
The explicit Lyapunov-plus-convergence route implies the limit inequality
interface used by the algebraic `(QG)` theorem.
-/
theorem plGradientFlowLimitRouteToQGOn_of_lyapunovRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (hroute : PLGradientFlowLyapunovRouteToQGOn C f alpha fstar) :
    PLGradientFlowLimitRouteToQGOn C f alpha fstar := by
  intro x hx
  rcases hroute hx with
    ⟨xStar, y, hxStar, hmin, hfxStar, _hy0, hyconv, hlyap⟩
  let c : ℝ := Real.sqrt (alpha / 2)
  let L : ℝ -> ℝ := fun t => c * ‖y t - x‖
  have hnorm_tend : Tendsto (fun t => ‖y t - x‖) atTop
      (𝓝 ‖xStar - x‖) := by
    simpa using (hyconv.sub tendsto_const_nhds).norm
  have hL_tend : Tendsto L atTop (𝓝 (c * ‖xStar - x‖)) := by
    simpa [L] using tendsto_const_nhds.mul hnorm_tend
  have hev : ∀ᶠ t : ℝ in atTop, L t ≤ Real.sqrt (f x - fstar) := by
    filter_upwards [eventually_ge_atTop (0 : ℝ)] with t ht
    have h := hlyap t ht
    have hsqrt_nonneg : 0 ≤ Real.sqrt (f (y t) - fstar) :=
      Real.sqrt_nonneg _
    dsimp [L, c]
    nlinarith
  have hlimit : c * ‖xStar - x‖ ≤ Real.sqrt (f x - fstar) :=
    le_of_tendsto hL_tend hev
  refine ⟨xStar, hxStar, hmin, hfxStar, ?_⟩
  simpa [c, norm_sub_rev] using hlimit

omit [InnerProductSpace ℝ E] in
/--
The source infimum form of `(QG)` follows from the witness form.
-/
theorem QuadraticGrowthWitnessOn.quadraticGrowthOn
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (halpha_nonneg : 0 ≤ alpha)
    (hqg : QuadraticGrowthWitnessOn C f alpha fstar) :
    QuadraticGrowthOn C f alpha fstar := by
  intro x hx
  rcases hqg hx with ⟨xStar, hxStar, hmin, hfxStar, hqg_xStar⟩
  let S : Set ℝ :=
    (fun y => ‖x - y‖ ^ (2 : ℕ)) ''
      {y | y ∈ C ∧ IsMinOn f C y ∧ f y = fstar}
  have hmem : ‖x - xStar‖ ^ (2 : ℕ) ∈ S := by
    exact ⟨xStar, ⟨hxStar, hmin, hfxStar⟩, rfl⟩
  have hbdd : BddBelow S := by
    refine ⟨0, ?_⟩
    intro r hr
    rcases hr with ⟨y, _hy, rfl⟩
    exact sq_nonneg _
  have hsInf_le : sInf S ≤ ‖x - xStar‖ ^ (2 : ℕ) :=
    csInf_le hbdd hmem
  have hcoef_nonneg : 0 ≤ alpha / 2 := by nlinarith
  have hmul :
      (alpha / 2) * sInf S ≤
        (alpha / 2) * ‖x - xStar‖ ^ (2 : ℕ) :=
    mul_le_mul_of_nonneg_left hsInf_le hcoef_nonneg
  exact hmul.trans hqg_xStar

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, algebraic core: the gradient-flow
limit inequality used in the notes implies the witness form of quadratic
growth.
-/
theorem quadraticGrowthWitnessOn_of_plGradientFlowLimitRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hroute : PLGradientFlowLimitRouteToQGOn C f alpha fstar) :
    QuadraticGrowthWitnessOn C f alpha fstar := by
  intro x hx
  rcases hroute hx with ⟨xStar, hxStar, hmin, hfxStar, hsqrt⟩
  have hgap_nonneg : 0 ≤ f x - fstar := by
    have hmin_le : f xStar ≤ f x := (isMinOn_iff.mp hmin) x hx
    nlinarith
  have hcoef_nonneg : 0 ≤ alpha / 2 := by nlinarith
  have hleft_nonneg :
      0 ≤ Real.sqrt (alpha / 2) * ‖x - xStar‖ :=
    mul_nonneg (Real.sqrt_nonneg _) (norm_nonneg _)
  have hright_nonneg : 0 ≤ Real.sqrt (f x - fstar) :=
    Real.sqrt_nonneg _
  have hsq :
      (Real.sqrt (alpha / 2) * ‖x - xStar‖) ^ (2 : ℕ) ≤
        (Real.sqrt (f x - fstar)) ^ (2 : ℕ) :=
    (sq_le_sq₀ hleft_nonneg hright_nonneg).mpr hsqrt
  have hleft :
      (Real.sqrt (alpha / 2) * ‖x - xStar‖) ^ (2 : ℕ) =
        (alpha / 2) * ‖x - xStar‖ ^ (2 : ℕ) := by
    rw [mul_pow, Real.sq_sqrt hcoef_nonneg]
  have hright :
      (Real.sqrt (f x - fstar)) ^ (2 : ℕ) = f x - fstar :=
    Real.sq_sqrt hgap_nonneg
  refine ⟨xStar, hxStar, hmin, hfxStar, ?_⟩
  nlinarith

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, in source infimum form, from the
gradient-flow limit inequality used in the notes.
-/
theorem quadraticGrowthOn_of_plGradientFlowLimitRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hroute : PLGradientFlowLimitRouteToQGOn C f alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  (quadraticGrowthWitnessOn_of_plGradientFlowLimitRoute
    (C := C) (f := f) (alpha := alpha) (fstar := fstar)
    halpha hroute).quadraticGrowthOn halpha.le

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, from the explicit
Lyapunov-plus-convergence route in the notes.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hroute : PLGradientFlowLyapunovRouteToQGOn C f alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLimitRoute
    halpha (plGradientFlowLimitRouteToQGOn_of_lyapunovRoute hroute)

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, from a nonincreasing Lyapunov
quantity along a convergent gradient flow.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovAntitoneRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hroute : PLGradientFlowLyapunovAntitoneRouteToQGOn C f alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovRoute
    halpha (plGradientFlowLyapunovRouteToQGOn_of_antitoneRoute hroute)

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, from the derivative-level
Lyapunov calculation plus convergence of the gradient flow.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovDerivativeRoute
    {C : Set E} {f : E -> ℝ} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hroute : PLGradientFlowLyapunovDerivativeRouteToQGOn C f alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovAntitoneRoute
    halpha (plGradientFlowLyapunovAntitoneRouteToQGOn_of_derivativeRoute hroute)

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, from the displayed differential
estimate for the Lyapunov function and the PL inequality.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovDifferentialEstimateRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn
        C f grad alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovDerivativeRoute halpha
    (plGradientFlowLyapunovDerivativeRouteToQGOn_of_differentialEstimateRoute
      halpha.le hpl hroute)

omit [InnerProductSpace ℝ E] in
/--
Chewi Proposition 2.7, second implication, from separated norm/gap derivative
components for the Lyapunov calculation.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovDerivativeComponentsRoute
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (halpha : 0 < alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn
        C f grad alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovDifferentialEstimateRoute
    halpha hpl
    (plGradientFlowLyapunovDifferentialEstimateRouteToQGOn_of_derivativeComponentsRoute
      hroute)

/--
Chewi Proposition 2.7, second implication, from a gradient-flow trajectory,
the norm-derivative bound in the proof, and convergence to a minimizer.  The
objective-gap derivative is discharged by Lemma 2.1.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovNormDerivativeRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (halpha : 0 < alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovNormDerivativeRouteToQGOn
        C f grad alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovDerivativeComponentsRoute
    halpha hpl
    (plGradientFlowLyapunovDerivativeComponentsRouteToQGOn_of_normDerivativeRoute
      hgrad hroute)

/--
Chewi Proposition 2.7, second implication, from the gradient-flow trajectory,
positive-gap/nonzero-displacement side conditions, and convergence to a
minimizer.  Both derivative components in the displayed Lyapunov calculation
are discharged from the trajectory.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (halpha : 0 < alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn
        C f grad alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovNormDerivativeRoute
    hgrad halpha hpl
    (plGradientFlowLyapunovNormDerivativeRouteToQGOn_of_nonzeroDisplacementRoute
      hroute)

/--
Chewi Proposition 2.7, second implication, from continuous trajectory/gap
data plus the remaining convergence and side conditions.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovContinuousDataRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (halpha : 0 < alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovContinuousDataRouteToQGOn
        C f grad alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute
    hgrad halpha hpl
    (plGradientFlowLyapunovNonzeroDisplacementRouteToQGOn_of_continuousDataRoute
      hroute)

/--
Chewi Proposition 2.7, second implication, from the remaining side-condition
route: convergence to a minimizer, positive gap, and nonzero displacement on
positive time.  Continuity and both derivative components are discharged by
the preceding theorem layers.
-/
theorem quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionRoute
    [CompleteSpace E]
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (halpha : 0 < alpha)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hroute :
      PLGradientFlowLyapunovSideConditionRouteToQGOn
        C f grad alpha fstar) :
    QuadraticGrowthOn C f alpha fstar :=
  quadraticGrowthOn_of_plGradientFlowLyapunovContinuousDataRoute
    hgrad halpha hpl
    (plGradientFlowLyapunovContinuousDataRouteToQGOn_of_sideConditionRoute
      hgrad hroute)

end Optimization
end StatInference
