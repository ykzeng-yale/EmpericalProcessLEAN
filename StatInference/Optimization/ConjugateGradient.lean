import StatInference.Optimization.Minimizer

/-!
# Chewi Chapter 5 conjugate-gradient substrate

This module starts the Chapter 5 quadratic/CG lane.  It first isolates the
quadratic objective from Section 5.1 and proves the supplied-gradient oracle
interfaces needed by the later conjugate-gradient and Krylov-subspace
formalization.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace Topology

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Chewi Chapter 5 quadratic objective `x ↦ 1/2 <x, A x> - <b, x>`. -/
noncomputable def quadraticObjective (A : E →L[ℝ] E) (b : E) (x : E) : ℝ :=
  (1 / 2 : ℝ) * inner ℝ x (A x) - inner ℝ b x

/-- Supplied gradient oracle for `quadraticObjective`. -/
def quadraticGradient (A : E →L[ℝ] E) (b : E) (x : E) : E :=
  A x - b

/-- Symmetry of the linear operator in the real inner product. -/
def IsSelfAdjointOperator (A : E →L[ℝ] E) : Prop :=
  ∀ x y : E, inner ℝ (A x) y = inner ℝ x (A y)

/-- Lower spectral/quadratic-form bound `alpha I <= A`. -/
def QuadraticFormLowerBound (A : E →L[ℝ] E) (alpha : ℝ) : Prop :=
  ∀ v : E, alpha * ‖v‖ ^ (2 : ℕ) ≤ inner ℝ v (A v)

/-- Upper spectral/quadratic-form bound `A <= beta I`. -/
def QuadraticFormUpperBound (A : E →L[ℝ] E) (beta : ℝ) : Prop :=
  ∀ v : E, inner ℝ v (A v) ≤ beta * ‖v‖ ^ (2 : ℕ)

/-- The supplied quadratic gradient vanishes exactly at solutions of `A x = b`. -/
theorem quadraticGradient_eq_zero_iff (A : E →L[ℝ] E) (b x : E) :
    quadraticGradient A b x = 0 ↔ A x = b := by
  simp [quadraticGradient, sub_eq_zero]

/-- Continuity of Chewi's quadratic objective for a continuous linear operator. -/
theorem continuous_quadraticObjective (A : E →L[ℝ] E) (b : E) :
    Continuous (quadraticObjective A b) := by
  have hquad : Continuous fun x : E => inner ℝ x (A x) :=
    continuous_id.inner (A.continuous.comp continuous_id)
  have hlin : Continuous fun x : E => inner ℝ b x :=
    continuous_const.inner continuous_id
  simpa [quadraticObjective] using
    (continuous_const.mul hquad).sub hlin

/--
Exact quadratic expansion around `x`.  This is the algebraic identity behind
the Chapter 5 claim that the supplied gradient is `A x - b`.
-/
theorem quadraticObjective_eq_model_add_quadratic
    {A : E →L[ℝ] E} {b : E}
    (hA_sym : IsSelfAdjointOperator A) (x y : E) :
    quadraticObjective A b y =
      quadraticObjective A b x +
        inner ℝ (quadraticGradient A b x) (y - x) +
          (1 / 2 : ℝ) * inner ℝ (y - x) (A (y - x)) := by
  let d : E := y - x
  have hy : y = x + d := by
    simp [d]
  rw [hy]
  have hsub : x + d - x = d := by
    abel
  rw [hsub]
  have hsym : inner ℝ x (A d) = inner ℝ (A x) d := by
    simpa using (hA_sym x d).symm
  simp [quadraticObjective, quadraticGradient, hsym, map_add, inner_add_left,
    inner_add_right, inner_sub_left]
  rw [real_inner_comm (A x) d]
  ring_nf

/--
Quadratic objectives satisfy the first-order strong-convexity lower model
whenever the operator has the corresponding quadratic-form lower bound.
-/
theorem quadraticObjective_firstOrderStrongConvexOn
    {A : E →L[ℝ] E} {b : E} {alpha : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hlower : QuadraticFormLowerBound A alpha) :
    FirstOrderStrongConvexOn Set.univ
      (quadraticObjective A b) (quadraticGradient A b) alpha := by
  refine ⟨convex_univ, ?_⟩
  intro x _hx y _hy
  rw [quadraticObjective_eq_model_add_quadratic hA_sym x y]
  have hquad := hlower (y - x)
  nlinarith

/--
Quadratic objectives satisfy the smooth upper model whenever the operator has
the corresponding quadratic-form upper bound.
-/
theorem quadraticObjective_smoothWithGradientOn
    {A : E →L[ℝ] E} {b : E} {beta : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hupper : QuadraticFormUpperBound A beta) :
    SmoothWithGradientOn Set.univ
      (quadraticObjective A b) (quadraticGradient A b) beta := by
  refine ⟨convex_univ, (continuous_quadraticObjective A b).continuousOn, ?_⟩
  intro x _hx y _hy
  rw [quadraticObjective_eq_model_add_quadratic hA_sym x y]
  have hquad := hupper (y - x)
  nlinarith

/--
Bundled Chapter 5 quadratic oracle interface under the source hypotheses
`alpha I <= A <= beta I`.
-/
theorem quadraticObjective_oracle_package
    {A : E →L[ℝ] E} {b : E} {alpha beta : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hlower : QuadraticFormLowerBound A alpha)
    (hupper : QuadraticFormUpperBound A beta) :
    FirstOrderStrongConvexOn Set.univ
      (quadraticObjective A b) (quadraticGradient A b) alpha ∧
    SmoothWithGradientOn Set.univ
      (quadraticObjective A b) (quadraticGradient A b) beta :=
  ⟨quadraticObjective_firstOrderStrongConvexOn hA_sym hlower,
    quadraticObjective_smoothWithGradientOn hA_sym hupper⟩

/--
Source claim after the Chapter 5 quadratic display: solving `A x = b` gives a
global minimizer of the quadratic objective, under a nonnegative lower
quadratic-form bound.
-/
theorem quadraticObjective_isMinOn_of_apply_eq
    {A : E →L[ℝ] E} {b x : E} {alpha : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hlower : QuadraticFormLowerBound A alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (hx : A x = b) :
    IsMinOn (quadraticObjective A b) Set.univ x := by
  refine
    isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero
      (quadraticObjective_firstOrderStrongConvexOn
        (A := A) (b := b) hA_sym hlower)
      halpha_nonneg trivial ?_
  rwa [quadraticGradient_eq_zero_iff]

end Optimization
end StatInference
