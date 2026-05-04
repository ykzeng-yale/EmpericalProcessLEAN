import StatInference.Optimization.Minimizer

/-!
# Chewi gradient-flow calculus layer

This module starts the main-text Chapter 2 gradient-flow spine for Chewi's
optimization notes.  It deliberately assumes a differentiable trajectory
solving the gradient-flow ODE; the notes also assume well-posedness rather
than proving it.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Chapter 2 gradient flow with a supplied gradient oracle:
`x' t = -grad (x t)`.
-/
def IsGradientFlowTrajectory (grad : E -> E) (x : ℝ -> E) : Prop :=
  ∀ t, HasDerivAt x (-(grad (x t))) t

theorem IsGradientFlowTrajectory.hasDerivAt {grad : E -> E}
    {x : ℝ -> E} (hx : IsGradientFlowTrajectory grad x) (t : ℝ) :
    HasDerivAt x (-(grad (x t))) t :=
  hx t

/--
Chewi Lemma 2.1, derivative identity: along gradient flow,
`d/dt f(x_t) = -‖grad f(x_t)‖²`.
-/
theorem gradientFlow_value_hasDerivAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E}
    {x : ℝ -> E} {t : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsGradientFlowTrajectory grad x) :
    HasDerivAt (fun s => f (x s))
      (-(‖grad (x t)‖ ^ (2 : ℕ))) t := by
  have hcomp :=
    (hgrad (x t)).hasFDerivAt.comp_hasDerivAt (x := t) (hflow t)
  simpa [InnerProductSpace.toDual_apply_apply, real_inner_self_eq_norm_sq]
    using hcomp

/--
Gap version of Chewi Lemma 2.1, useful for PL and function-value convergence
statements.
-/
theorem gradientFlow_gap_hasDerivAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E}
    {x : ℝ -> E} {fstar t : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsGradientFlowTrajectory grad x) :
    HasDerivAt (fun s => f (x s) - fstar)
      (-(‖grad (x t)‖ ^ (2 : ℕ))) t := by
  simpa using
    (gradientFlow_value_hasDerivAt (t := t) hgrad hflow).sub_const fstar

omit [InnerProductSpace ℝ E] in
/-- Chewi Lemma 2.1, pointwise nonpositivity of the value derivative. -/
theorem gradientFlow_value_deriv_nonpos {grad : E -> E}
    {x : ℝ -> E} {t : ℝ} :
    -(‖grad (x t)‖ ^ (2 : ℕ)) ≤ 0 := by
  have hsq : 0 ≤ ‖grad (x t)‖ ^ (2 : ℕ) := sq_nonneg _
  nlinarith

/--
Chewi Lemma 2.1, monotonicity consequence: function values along gradient
flow are antitone.
-/
theorem gradientFlow_value_antitone
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E} {x : ℝ -> E}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsGradientFlowTrajectory grad x) :
    Antitone (fun t : ℝ => f (x t)) := by
  refine antitone_of_deriv_nonpos ?_ ?_
  · intro t
    exact (gradientFlow_value_hasDerivAt (t := t) hgrad hflow).differentiableAt
  · intro t
    have hderiv := (gradientFlow_value_hasDerivAt (t := t) hgrad hflow).deriv
    rw [hderiv]
    exact gradientFlow_value_deriv_nonpos

/--
Derivative of the squared distance between two gradient-flow trajectories.
This is the calculus identity in the proof of Chewi Theorem 2.2.
-/
theorem gradientFlow_sqdist_hasDerivAt
    {grad : E -> E} {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y) :
    HasDerivAt (fun s => ‖y s - x s‖ ^ (2 : ℕ))
      (-2 * inner ℝ (y t - x t) (grad (y t) - grad (x t))) t := by
  have hdiff : HasDerivAt (fun s => y s - x s)
      (-(grad (y t)) - -(grad (x t))) t := by
    simpa [Pi.sub_apply] using (hyflow t).sub (hxflow t)
  have hnorm := hdiff.norm_sq
  convert hnorm using 1
  simp only [inner_sub_right, inner_sub_left, inner_neg_right,
    real_inner_comm]
  ring

/--
Chewi Theorem 2.2 differential inequality from the gradient monotonicity form
of strong convexity, before applying Gronwall.
-/
theorem gradientFlow_sqdist_deriv_le_of_stronglyMonotoneGradientOn
    {C : Set E} {grad : E -> E} {alpha : ℝ} {x y : ℝ -> E} {t : ℝ}
    (hmono : StronglyMonotoneGradientOn C grad alpha)
    (hxmem : x t ∈ C) (hymem : y t ∈ C) :
    -2 * inner ℝ (y t - x t) (grad (y t) - grad (x t)) ≤
      -2 * alpha * ‖y t - x t‖ ^ (2 : ℕ) := by
  have h := hmono.inner_lower hxmem hymem
  have hcomm : inner ℝ (grad (y t) - grad (x t)) (y t - x t) =
      inner ℝ (y t - x t) (grad (y t) - grad (x t)) := by
    rw [real_inner_comm]
  rw [hcomm] at h
  nlinarith

/--
Chewi Theorem 2.2 differential inequality using the first-order
strong-convexity interface.
-/
theorem gradientFlow_sqdist_deriv_le_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x y : ℝ -> E} {t : ℝ}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hxmem : x t ∈ C) (hymem : y t ∈ C) :
    -2 * inner ℝ (y t - x t) (grad (y t) - grad (x t)) ≤
      -2 * alpha * ‖y t - x t‖ ^ (2 : ℕ) :=
  gradientFlow_sqdist_deriv_le_of_stronglyMonotoneGradientOn
    hfirst.stronglyMonotoneGradientOn hxmem hymem

/--
Chewi Theorem 2.2 differential inequality from whole-space segment strong
convexity plus mathlib gradients.
-/
theorem gradientFlow_sqdist_deriv_le_of_strongConvexOn_univ_hasGradientAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x y : ℝ -> E} {t : ℝ}
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hgrad : ∀ z, HasGradientAt f (grad z) z) :
    -2 * inner ℝ (y t - x t) (grad (y t) - grad (x t)) ≤
      -2 * alpha * ‖y t - x t‖ ^ (2 : ℕ) :=
  gradientFlow_sqdist_deriv_le_of_firstOrderStrongConvexOn
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    (by simp) (by simp)

/--
A Gronwall special case used in Chewi Chapter 2: if `u' <= -c u` everywhere,
then `exp(c t) u(t)` is antitone.
-/
theorem scalarExpWeighted_antitone_of_hasDerivAt_le
    {u u' : ℝ -> ℝ} {c : ℝ}
    (hu : ∀ t, HasDerivAt u (u' t) t)
    (hineq : ∀ t, u' t ≤ -c * u t) :
    Antitone (fun t : ℝ => Real.exp (c * t) * u t) := by
  let z : ℝ -> ℝ := fun t => Real.exp (c * t) * u t
  have hz : ∀ t, HasDerivAt z
      (Real.exp (c * t) * c * u t + Real.exp (c * t) * u' t) t := by
    intro t
    have hexp : HasDerivAt (fun s : ℝ => Real.exp (c * s))
        (Real.exp (c * t) * c) t := by
      simpa [mul_comm, mul_left_comm, mul_assoc] using
        ((hasDerivAt_id t).const_mul c).exp
    simpa [z, mul_assoc] using hexp.mul (hu t)
  refine antitone_of_deriv_nonpos ?_ ?_
  · intro t
    exact (hz t).differentiableAt
  · intro t
    have hderiv := (hz t).deriv
    rw [hderiv]
    have hexp_nonneg : 0 ≤ Real.exp (c * t) := Real.exp_nonneg _
    have hi := hineq t
    nlinarith

/--
Endpoint form of the exponential-decay Gronwall special case.
-/
theorem scalarExpWeighted_le_initial_of_hasDerivAt_le
    {u u' : ℝ -> ℝ} {c t : ℝ}
    (hu : ∀ t, HasDerivAt u (u' t) t)
    (hineq : ∀ t, u' t ≤ -c * u t)
    (ht : 0 ≤ t) :
    Real.exp (c * t) * u t ≤ u 0 := by
  have hanti :=
    scalarExpWeighted_antitone_of_hasDerivAt_le
      (u := u) (u' := u') (c := c) hu hineq
  simpa using hanti ht

/--
Source-shaped endpoint form: `u(t) <= u(0) exp(-ct)`.
-/
theorem scalarExpDecay_le_of_hasDerivAt_le
    {u u' : ℝ -> ℝ} {c t : ℝ}
    (hu : ∀ t, HasDerivAt u (u' t) t)
    (hineq : ∀ t, u' t ≤ -c * u t)
    (ht : 0 ≤ t) :
    u t ≤ u 0 * Real.exp (-(c * t)) := by
  have hweighted :=
    scalarExpWeighted_le_initial_of_hasDerivAt_le
      (u := u) (u' := u') (c := c) hu hineq ht
  have hmul :=
    mul_le_mul_of_nonneg_left hweighted (Real.exp_nonneg (-(c * t)))
  have hexp_mul :
      Real.exp (-(c * t)) * (Real.exp (c * t) * u t) = u t := by
    rw [← mul_assoc, ← Real.exp_add]
    have hzero : -(c * t) + c * t = 0 := by ring
    rw [hzero]
    simp
  rw [hexp_mul] at hmul
  nlinarith [hmul]

/--
Chewi Theorem 2.2, squared-distance exponential contraction, from the
gradient monotonicity form of strong convexity.
-/
theorem chewi22_sqdist_weighted_le_of_stronglyMonotoneGradientOn
    {C : Set E} {grad : E -> E} {alpha : ℝ} {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y)
    (hmono : StronglyMonotoneGradientOn C grad alpha)
    (hxmem : ∀ s, x s ∈ C) (hymem : ∀ s, y s ∈ C)
    (ht : 0 ≤ t) :
    Real.exp ((2 * alpha) * t) * ‖y t - x t‖ ^ (2 : ℕ) ≤
      ‖y 0 - x 0‖ ^ (2 : ℕ) := by
  let u : ℝ -> ℝ := fun s => ‖y s - x s‖ ^ (2 : ℕ)
  let u' : ℝ -> ℝ :=
    fun s => -2 * inner ℝ (y s - x s) (grad (y s) - grad (x s))
  have hu : ∀ s, HasDerivAt u (u' s) s := by
    intro s
    simpa [u, u'] using gradientFlow_sqdist_hasDerivAt hxflow hyflow (t := s)
  have hineq : ∀ s, u' s ≤ -(2 * alpha) * u s := by
    intro s
    have h :=
      gradientFlow_sqdist_deriv_le_of_stronglyMonotoneGradientOn
        hmono (hxmem s) (hymem s)
    dsimp [u, u'] at h ⊢
    nlinarith
  simpa [u] using
    scalarExpWeighted_le_initial_of_hasDerivAt_le
      (u := u) (u' := u') (c := 2 * alpha) hu hineq ht

/--
Chewi Theorem 2.2, squared-distance exponential contraction, from the
first-order strong-convexity interface.
-/
theorem chewi22_sqdist_weighted_le_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y)
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hxmem : ∀ s, x s ∈ C) (hymem : ∀ s, y s ∈ C)
    (ht : 0 ≤ t) :
    Real.exp ((2 * alpha) * t) * ‖y t - x t‖ ^ (2 : ℕ) ≤
      ‖y 0 - x 0‖ ^ (2 : ℕ) :=
  chewi22_sqdist_weighted_le_of_stronglyMonotoneGradientOn
    hxflow hyflow hfirst.stronglyMonotoneGradientOn hxmem hymem ht

/--
Chewi Theorem 2.2 squared-distance contraction from whole-space segment strong
convexity plus mathlib gradients.
-/
theorem chewi22_sqdist_weighted_le_of_strongConvexOn_univ_hasGradientAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y)
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (ht : 0 ≤ t) :
    Real.exp ((2 * alpha) * t) * ‖y t - x t‖ ^ (2 : ℕ) ≤
      ‖y 0 - x 0‖ ^ (2 : ℕ) :=
  chewi22_sqdist_weighted_le_of_firstOrderStrongConvexOn
    hxflow hyflow
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    (by intro s; simp) (by intro s; simp) ht

/--
Chewi Theorem 2.2, norm-form contraction, from the gradient monotonicity form
of strong convexity.
-/
theorem chewi22_dist_le_exp_of_stronglyMonotoneGradientOn
    {C : Set E} {grad : E -> E} {alpha : ℝ} {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y)
    (hmono : StronglyMonotoneGradientOn C grad alpha)
    (hxmem : ∀ s, x s ∈ C) (hymem : ∀ s, y s ∈ C)
    (ht : 0 ≤ t) :
    ‖y t - x t‖ ≤ Real.exp (-(alpha * t)) * ‖y 0 - x 0‖ := by
  have hsq :=
    chewi22_sqdist_weighted_le_of_stronglyMonotoneGradientOn
      hxflow hyflow hmono hxmem hymem ht
  let a : ℝ := ‖y t - x t‖
  let b : ℝ := ‖y 0 - x 0‖
  have hweighted :
      Real.exp ((2 * alpha) * t) * a ^ (2 : ℕ) ≤ b ^ (2 : ℕ) := by
    simpa [a, b] using hsq
  have hsq_le :
      a ^ (2 : ℕ) ≤ (Real.exp (-(alpha * t)) * b) ^ (2 : ℕ) := by
    have hmul := mul_le_mul_of_nonneg_left hweighted
      (Real.exp_nonneg (-((2 * alpha) * t)))
    have hleft : Real.exp (-((2 * alpha) * t)) *
        (Real.exp ((2 * alpha) * t) * a ^ (2 : ℕ)) =
          a ^ (2 : ℕ) := by
      rw [← mul_assoc, ← Real.exp_add]
      have hzero : -((2 * alpha) * t) + (2 * alpha) * t = 0 := by ring
      rw [hzero]
      simp
    rw [hleft] at hmul
    have hrhs :
        Real.exp (-((2 * alpha) * t)) * b ^ (2 : ℕ) =
          (Real.exp (-(alpha * t)) * b) ^ (2 : ℕ) := by
      rw [mul_pow]
      have hexp : Real.exp (-(alpha * t)) ^ (2 : ℕ) =
          Real.exp (-((2 * alpha) * t)) := by
        rw [← Real.exp_nat_mul]
        congr 1
        ring
      rw [hexp]
    simpa [hrhs] using hmul
  have ha : 0 ≤ a := norm_nonneg _
  have hb : 0 ≤ Real.exp (-(alpha * t)) * b :=
    mul_nonneg (Real.exp_nonneg _) (norm_nonneg _)
  have hle := (sq_le_sq₀ ha hb).mp hsq_le
  simpa [a, b] using hle

/--
Chewi Theorem 2.2, norm-form contraction, from the first-order
strong-convexity interface.
-/
theorem chewi22_dist_le_exp_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y)
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hxmem : ∀ s, x s ∈ C) (hymem : ∀ s, y s ∈ C)
    (ht : 0 ≤ t) :
    ‖y t - x t‖ ≤ Real.exp (-(alpha * t)) * ‖y 0 - x 0‖ :=
  chewi22_dist_le_exp_of_stronglyMonotoneGradientOn
    hxflow hyflow hfirst.stronglyMonotoneGradientOn hxmem hymem ht

/--
Chewi Theorem 2.2, norm-form contraction, from whole-space segment strong
convexity plus mathlib gradients.
-/
theorem chewi22_dist_le_exp_of_strongConvexOn_univ_hasGradientAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x y : ℝ -> E} {t : ℝ}
    (hxflow : IsGradientFlowTrajectory grad x)
    (hyflow : IsGradientFlowTrajectory grad y)
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (ht : 0 ≤ t) :
    ‖y t - x t‖ ≤ Real.exp (-(alpha * t)) * ‖y 0 - x 0‖ :=
  chewi22_dist_le_exp_of_firstOrderStrongConvexOn
    hxflow hyflow
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    (by intro s; simp) (by intro s; simp) ht

/--
Derivative of the squared distance from a gradient-flow trajectory to a fixed
candidate minimizer.
-/
theorem gradientFlow_sqdist_to_point_hasDerivAt
    {grad : E -> E} {x : ℝ -> E} {xStar : E} {t : ℝ}
    (hflow : IsGradientFlowTrajectory grad x) :
    HasDerivAt (fun s => ‖x s - xStar‖ ^ (2 : ℕ))
      (-2 * inner ℝ (x t - xStar) (grad (x t))) t := by
  have hdiff : HasDerivAt (fun s => x s - xStar) (-(grad (x t))) t := by
    simpa using (hflow t).sub_const xStar
  have hnorm := hdiff.norm_sq
  convert hnorm using 1
  simp

/--
Chewi Theorem 2.4 differential inequality: the derivative of the squared
distance to a minimizer is bounded by the strong-convexity contraction term
and the function-value gap.
-/
theorem gradientFlow_sqdist_to_minimizer_deriv_le_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x : ℝ -> E} {xStar : E} {t : ℝ}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (hxmem : x t ∈ C) (hxStar : xStar ∈ C) :
    -2 * inner ℝ (x t - xStar) (grad (x t)) ≤
      -alpha * ‖x t - xStar‖ ^ (2 : ℕ) -
        2 * (f (x t) - f xStar) := by
  have hmodel := hfirst.lower_model hxmem hxStar
  have hinner : inner ℝ (grad (x t)) (xStar - x t) =
      -inner ℝ (x t - xStar) (grad (x t)) := by
    calc
      inner ℝ (grad (x t)) (xStar - x t)
          = inner ℝ (xStar - x t) (grad (x t)) := by rw [real_inner_comm]
      _ = inner ℝ (-(x t - xStar)) (grad (x t)) := by
          simp
      _ = -inner ℝ (x t - xStar) (grad (x t)) := by
          rw [inner_neg_left]
  have hnorm : ‖xStar - x t‖ ^ (2 : ℕ) =
      ‖x t - xStar‖ ^ (2 : ℕ) := by
    rw [norm_sub_rev]
  rw [hinner, hnorm] at hmodel
  nlinarith

/--
Chewi Theorem 2.4 differential inequality from whole-space segment strong
convexity plus mathlib gradients.
-/
theorem gradientFlow_sqdist_to_minimizer_deriv_le_of_strongConvexOn_univ_hasGradientAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    {x : ℝ -> E} {xStar : E} {t : ℝ}
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hgrad : ∀ z, HasGradientAt f (grad z) z) :
    -2 * inner ℝ (x t - xStar) (grad (x t)) ≤
      -alpha * ‖x t - xStar‖ ^ (2 : ℕ) -
        2 * (f (x t) - f xStar) :=
  gradientFlow_sqdist_to_minimizer_deriv_le_of_firstOrderStrongConvexOn
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    (by simp) (by simp)

/--
Chewi Theorem 2.4 positive-`alpha` denominator algebra after the weighted
Gronwall inequality and monotone-gap integral lower bound have been supplied.

Here `R` is the initial squared distance, `I` is the weighted forcing integral,
and `finalGap` is `f(x_t)-f_*`.
-/
theorem chewi24_gap_le_geometric_denominator_of_weighted_bound
    {alpha t R finalGap I : ℝ}
    (halpha : 0 < alpha) (ht : 0 < t)
    (hweighted : 0 ≤ Real.exp (-(alpha * t)) * R - 2 * I)
    (hlower : ((1 - Real.exp (-(alpha * t))) / alpha) * finalGap ≤ I) :
    finalGap ≤ alpha / (2 * (Real.exp (alpha * t) - 1)) * R := by
  have hexplt : 1 < Real.exp (alpha * t) := by
    rw [← Real.exp_zero]
    exact Real.exp_lt_exp.mpr (by nlinarith)
  have hdenpos : 0 < Real.exp (alpha * t) - 1 := by nlinarith
  have hsmall : Real.exp (-(alpha * t)) < 1 := by
    rw [← Real.exp_zero]
    exact Real.exp_lt_exp.mpr (by nlinarith)
  have hDpos : 0 < (1 - Real.exp (-(alpha * t))) / alpha := by
    exact div_pos (by nlinarith) halpha
  have htwoDpos : 0 < 2 * ((1 - Real.exp (-(alpha * t))) / alpha) := by
    nlinarith
  have hI : 2 * I ≤ Real.exp (-(alpha * t)) * R := by nlinarith
  have hgapI :
      2 * (((1 - Real.exp (-(alpha * t))) / alpha) * finalGap) ≤
        2 * I := by
    nlinarith
  have hgap :
      2 * (((1 - Real.exp (-(alpha * t))) / alpha) * finalGap) ≤
        Real.exp (-(alpha * t)) * R :=
    hgapI.trans hI
  have hgap' :
      (2 * ((1 - Real.exp (-(alpha * t))) / alpha)) * finalGap ≤
        Real.exp (-(alpha * t)) * R := by
    nlinarith
  have hdiv : finalGap ≤
      (Real.exp (-(alpha * t)) * R) /
        (2 * ((1 - Real.exp (-(alpha * t))) / alpha)) := by
    rw [le_div_iff₀ htwoDpos]
    simpa [mul_comm, mul_left_comm, mul_assoc] using hgap'
  have halg : (Real.exp (-(alpha * t)) * R) /
      (2 * ((1 - Real.exp (-(alpha * t))) / alpha)) =
        alpha / (2 * (Real.exp (alpha * t) - 1)) * R := by
    have hexp_ne : Real.exp (alpha * t) ≠ 0 := (Real.exp_pos _).ne'
    field_simp [halpha.ne', hdenpos.ne', hexp_ne]
    rw [Real.exp_neg]
    field_simp [hexp_ne]
  exact hdiv.trans_eq halg

/--
Chewi Theorem 2.4 `alpha = 0` limiting denominator algebra after the weighted
Gronwall inequality and monotone-gap lower bound have been supplied.
-/
theorem chewi24_gap_le_alpha_zero_denominator_of_weighted_bound
    {t R finalGap : ℝ}
    (ht : 0 < t)
    (hweighted : 0 ≤ R - 2 * t * finalGap) :
    finalGap ≤ R / (2 * t) := by
  have hden : 0 < 2 * t := by nlinarith
  rw [le_div_iff₀ hden]
  nlinarith

omit [InnerProductSpace ℝ E] in
/--
Chewi Theorem 2.4 positive-`alpha` source-shaped denominator assembly.  The
remaining analytic input is the weighted Gronwall/integral lower-bound pair
encoded by `hweighted` and `hlower`.
-/
theorem chewi24_gap_le_geometric_denominator_of_weighted_gap_bound
    {f : E -> ℝ} {x : ℝ -> E} {xStar : E}
    {alpha t I : ℝ}
    (halpha : 0 < alpha) (ht : 0 < t)
    (hweighted :
      0 ≤ Real.exp (-(alpha * t)) * ‖x 0 - xStar‖ ^ (2 : ℕ) - 2 * I)
    (hlower :
      ((1 - Real.exp (-(alpha * t))) / alpha) *
          (f (x t) - f xStar) ≤ I) :
    f (x t) - f xStar ≤
      alpha / (2 * (Real.exp (alpha * t) - 1)) *
        ‖x 0 - xStar‖ ^ (2 : ℕ) :=
  chewi24_gap_le_geometric_denominator_of_weighted_bound
    (R := ‖x 0 - xStar‖ ^ (2 : ℕ))
    (finalGap := f (x t) - f xStar) (I := I)
    halpha ht hweighted hlower

omit [InnerProductSpace ℝ E] in
/--
Chewi Theorem 2.4 `alpha = 0` source-shaped denominator assembly.
-/
theorem chewi24_gap_le_alpha_zero_denominator_of_weighted_gap_bound
    {f : E -> ℝ} {x : ℝ -> E} {xStar : E} {t : ℝ}
    (ht : 0 < t)
    (hweighted :
      0 ≤ ‖x 0 - xStar‖ ^ (2 : ℕ) -
        2 * t * (f (x t) - f xStar)) :
    f (x t) - f xStar ≤ ‖x 0 - xStar‖ ^ (2 : ℕ) / (2 * t) :=
  chewi24_gap_le_alpha_zero_denominator_of_weighted_bound
    (R := ‖x 0 - xStar‖ ^ (2 : ℕ))
    (finalGap := f (x t) - f xStar) ht hweighted

omit [InnerProductSpace ℝ E] in
/--
Chewi Corollary 2.6 differential inequality under the Polyak-Lojasiewicz
condition, before applying Gronwall.
-/
theorem gradientFlow_gap_deriv_le_of_polyakLojasiewiczOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha fstar : ℝ}
    {x : ℝ -> E} {t : ℝ}
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hxmem : x t ∈ C) :
    -(‖grad (x t)‖ ^ (2 : ℕ)) ≤
      -2 * alpha * (f (x t) - fstar) := by
  have h := hpl.gradient_sq_lower hxmem
  nlinarith

/--
Chewi Corollary 2.6, exponential convergence under PL, in weighted form.
-/
theorem chewi26_gap_weighted_le_of_polyakLojasiewiczOn
    [CompleteSpace E] {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {alpha fstar : ℝ} {x : ℝ -> E} {t : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsGradientFlowTrajectory grad x)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hxmem : ∀ s, x s ∈ C)
    (ht : 0 ≤ t) :
    Real.exp ((2 * alpha) * t) * (f (x t) - fstar) ≤
      f (x 0) - fstar := by
  let u : ℝ -> ℝ := fun s => f (x s) - fstar
  let u' : ℝ -> ℝ := fun s => -(‖grad (x s)‖ ^ (2 : ℕ))
  have hu : ∀ s, HasDerivAt u (u' s) s := by
    intro s
    simpa [u, u'] using
      gradientFlow_gap_hasDerivAt (fstar := fstar) hgrad hflow (t := s)
  have hineq : ∀ s, u' s ≤ -(2 * alpha) * u s := by
    intro s
    have h := gradientFlow_gap_deriv_le_of_polyakLojasiewiczOn hpl (hxmem s)
    dsimp [u, u'] at h ⊢
    nlinarith
  simpa [u] using
    scalarExpWeighted_le_initial_of_hasDerivAt_le
      (u := u) (u' := u') (c := 2 * alpha) hu hineq ht

/--
Chewi Corollary 2.6, source-shaped exponential convergence under PL.
-/
theorem chewi26_gap_le_exp_of_polyakLojasiewiczOn
    [CompleteSpace E] {C : Set E} {f : E -> ℝ} {grad : E -> E}
    {alpha fstar : ℝ} {x : ℝ -> E} {t : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsGradientFlowTrajectory grad x)
    (hpl : PolyakLojasiewiczOn C f grad alpha fstar)
    (hxmem : ∀ s, x s ∈ C)
    (ht : 0 ≤ t) :
    f (x t) - fstar ≤
      (f (x 0) - fstar) * Real.exp (-(2 * alpha * t)) := by
  let u : ℝ -> ℝ := fun s => f (x s) - fstar
  let u' : ℝ -> ℝ := fun s => -(‖grad (x s)‖ ^ (2 : ℕ))
  have hu : ∀ s, HasDerivAt u (u' s) s := by
    intro s
    simpa [u, u'] using
      gradientFlow_gap_hasDerivAt (fstar := fstar) hgrad hflow (t := s)
  have hineq : ∀ s, u' s ≤ -(2 * alpha) * u s := by
    intro s
    have h := gradientFlow_gap_deriv_le_of_polyakLojasiewiczOn hpl (hxmem s)
    dsimp [u, u'] at h ⊢
    nlinarith
  simpa [u, mul_assoc] using
    scalarExpDecay_le_of_hasDerivAt_le
      (u := u) (u' := u') (c := 2 * alpha) hu hineq ht

end Optimization
end StatInference
