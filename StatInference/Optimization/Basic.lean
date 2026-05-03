import Mathlib

/-!
# Optimization interfaces

This file starts the Chewi optimization lane with proof-carrying interfaces for
the first textbook primitives: convex sets, strong convexity, smooth upper
models, and gradient-descent trajectories.  The definitions are intentionally
content-based rather than author-named theorem reports; exact source-audited
reports should be added only after an exact textbook theorem or lemma compiles.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace
open scoped Gradient
open scoped NNReal

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Definition 1.5, specialized to real inner-product spaces.

The domain carries the convex-set hypothesis, and the inequality keeps the
strong-convexity correction term explicit for later gradient-flow and
gradient-descent estimates.
-/
def StrongConvexOn (C : Set E) (f : E -> ℝ) (alpha : ℝ) : Prop :=
  Convex ℝ C ∧
    ∀ ⦃x⦄, x ∈ C -> ∀ ⦃y⦄, y ∈ C -> ∀ ⦃t : ℝ⦄, t ∈ Icc (0 : ℝ) 1 ->
      f ((1 - t) • x + t • y) ≤
        (1 - t) * f x + t * f y -
          (alpha / 2) * t * (1 - t) * ‖y - x‖ ^ (2 : ℕ)

/-- Chewi Definition 1.5 with `alpha = 0`. -/
def ChewiConvexOn (C : Set E) (f : E -> ℝ) : Prop :=
  StrongConvexOn C f 0

/--
First-order strong-convexity lower model, Chewi Proposition 1.6 / equation
(1.4), represented with an explicit gradient oracle.

This is intentionally a supplied interface for now: mathlib and the local
segment definition do not currently provide a ready general Hilbert-space
bridge from segment strong convexity plus differentiability to this
first-order form.
-/
def FirstOrderStrongConvexOn (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (alpha : ℝ) : Prop :=
  Convex ℝ C ∧
    ∀ ⦃x⦄, x ∈ C -> ∀ ⦃y⦄, y ∈ C ->
      f x + inner ℝ (grad x) (y - x) +
        (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) ≤ f y

/--
Chewi Proposition 1.6 / equation (1.5), represented directly as monotonicity
of the supplied gradient oracle.

This supplied interface is separated from `FirstOrderStrongConvexOn` because
Theorem 3.3 uses the gradient monotonicity form directly.
-/
def StronglyMonotoneGradientOn (C : Set E) (grad : E -> E)
    (alpha : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C -> ∀ ⦃y⦄, y ∈ C ->
    alpha * ‖y - x‖ ^ (2 : ℕ) ≤ inner ℝ (grad y - grad x) (y - x)

/--
Chewi Exercise 3.1 / equation (3.5), specialized to the scaled inequality
needed in the proof of Theorem 3.3.
-/
def GradientStepCocoerciveOn (C : Set E) (grad : E -> E) (h : ℝ) : Prop :=
  ∀ ⦃x⦄, x ∈ C -> ∀ ⦃y⦄, y ∈ C ->
    h * ‖grad y - grad x‖ ^ (2 : ℕ) ≤ inner ℝ (y - x) (grad y - grad x)

/--
Chewi Definition 1.12, represented by the usual quadratic upper model with an
explicit gradient oracle.  Later exact smoothness equivalences can connect this
to Frechet derivatives and gradient Lipschitzness.
-/
def SmoothWithGradientOn (C : Set E) (f : E -> ℝ) (grad : E -> E)
    (beta : ℝ) : Prop :=
  Convex ℝ C ∧
    ContinuousOn f C ∧
      ∀ ⦃x⦄, x ∈ C -> ∀ ⦃y⦄, y ∈ C ->
        f y ≤ f x + inner ℝ (grad x) (y - x) +
          (beta / 2) * ‖y - x‖ ^ (2 : ℕ)

/-- Gradient descent one-step map with an explicit gradient oracle. -/
def gradientDescentStep (grad : E -> E) (h : ℝ) (x : E) : E :=
  x - h • grad x

/-- A sequence follows gradient descent for a supplied gradient oracle. -/
def IsGradientDescentTrajectory (grad : E -> E) (h : ℝ)
    (x : ℕ -> E) : Prop :=
  ∀ n, x (n + 1) = gradientDescentStep grad h (x n)

theorem StrongConvexOn.convex_set {C : Set E} {f : E -> ℝ}
    {alpha : ℝ} (h : StrongConvexOn C f alpha) :
    Convex ℝ C :=
  h.1

theorem StrongConvexOn.segment_ineq {C : Set E} {f : E -> ℝ}
    {alpha : ℝ} (h : StrongConvexOn C f alpha)
    {x y : E} (hx : x ∈ C) (hy : y ∈ C)
    {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    f ((1 - t) • x + t • y) ≤
      (1 - t) * f x + t * f y -
        (alpha / 2) * t * (1 - t) * ‖y - x‖ ^ (2 : ℕ) :=
  h.2 hx hy ht

theorem FirstOrderStrongConvexOn.convex_set {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {alpha : ℝ}
    (h : FirstOrderStrongConvexOn C f grad alpha) :
    Convex ℝ C :=
  h.1

theorem FirstOrderStrongConvexOn.lower_model {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {alpha : ℝ}
    (h : FirstOrderStrongConvexOn C f grad alpha)
    {x y : E} (hx : x ∈ C) (hy : y ∈ C) :
    f x + inner ℝ (grad x) (y - x) +
      (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) ≤ f y :=
  h.2 hx hy

theorem StronglyMonotoneGradientOn.inner_lower {C : Set E}
    {grad : E -> E} {alpha : ℝ}
    (h : StronglyMonotoneGradientOn C grad alpha)
    {x y : E} (hx : x ∈ C) (hy : y ∈ C) :
    alpha * ‖y - x‖ ^ (2 : ℕ) ≤ inner ℝ (grad y - grad x) (y - x) :=
  h hx hy

theorem GradientStepCocoerciveOn.inner_lower {C : Set E}
    {grad : E -> E} {hstep : ℝ}
    (h : GradientStepCocoerciveOn C grad hstep)
    {x y : E} (hx : x ∈ C) (hy : y ∈ C) :
    hstep * ‖grad y - grad x‖ ^ (2 : ℕ) ≤
      inner ℝ (y - x) (grad y - grad x) :=
  h hx hy

theorem SmoothWithGradientOn.convex_set {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {beta : ℝ}
    (h : SmoothWithGradientOn C f grad beta) :
    Convex ℝ C :=
  h.1

theorem SmoothWithGradientOn.continuousOn {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {beta : ℝ}
    (h : SmoothWithGradientOn C f grad beta) :
    ContinuousOn f C :=
  h.2.1

theorem SmoothWithGradientOn.upper_model {C : Set E} {f : E -> ℝ}
    {grad : E -> E} {beta : ℝ}
    (h : SmoothWithGradientOn C f grad beta)
    {x y : E} (hx : x ∈ C) (hy : y ∈ C) :
    f y ≤ f x + inner ℝ (grad x) (y - x) +
      (beta / 2) * ‖y - x‖ ^ (2 : ℕ) :=
  h.2.2 hx hy

theorem IsGradientDescentTrajectory.succ {grad : E -> E} {h : ℝ}
    {x : ℕ -> E} (hx : IsGradientDescentTrajectory grad h x)
    (n : ℕ) :
    x (n + 1) = gradientDescentStep grad h (x n) :=
  hx n

section MathlibGradient

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H]

/--
Mathlib-gradient smoothness surface: differentiability on the domain plus a
Lipschitz gradient.  This is the preferred bridge when an exact theorem should
use mathlib's `gradient`/Frechet derivative API directly.
-/
def HasLipschitzGradientOn (L : ℝ≥0) (C : Set H) (f : H -> ℝ) : Prop :=
  DifferentiableOn ℝ f C ∧ LipschitzOnWith L (gradient f) C

/-- Gradient descent one-step map using mathlib's `gradient`. -/
noncomputable def gradientStep (eta : ℝ) (f : H -> ℝ) (x : H) : H :=
  x - eta • gradient f x

theorem HasLipschitzGradientOn.differentiableOn {L : ℝ≥0}
    {C : Set H} {f : H -> ℝ}
    (h : HasLipschitzGradientOn L C f) :
    DifferentiableOn ℝ f C :=
  h.1

theorem HasLipschitzGradientOn.lipschitzOnWith {L : ℝ≥0}
    {C : Set H} {f : H -> ℝ}
    (h : HasLipschitzGradientOn L C f) :
    LipschitzOnWith L (gradient f) C :=
  h.2

end MathlibGradient

end Optimization
end StatInference
