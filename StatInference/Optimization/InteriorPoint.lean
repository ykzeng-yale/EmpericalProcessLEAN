import StatInference.Optimization.Basic
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
# Chewi Chapter 13 interior-point methods

This module starts the finite-dimensional interior-point/self-concordance
lane.  The first packet records a one-dimensional source-shaped
self-concordance interface and verifies Chewi Example 13.4 for the logarithmic
barrier `x ↦ -log x` on `ℝ_{>0}`.
-/

namespace StatInference
namespace Optimization

section VectorSelfConcordance

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Definition 13.2, supplied-Hessian local norm:
`||v||_x = sqrt(<v, Hess f(x) v>)`.
-/
noncomputable def localNorm (hess : E -> E →L[ℝ] E) (x v : E) : ℝ :=
  Real.sqrt (inner ℝ v (hess x v))

/--
Chewi Definition 13.2, supplied-inverse-Hessian dual local norm:
`||v*||_x^* = sqrt(<v*, Hess f(x)^{-1} v*>)`.
-/
noncomputable def dualLocalNorm (invHess : E -> E →L[ℝ] E) (x vStar : E) : ℝ :=
  Real.sqrt (inner ℝ vStar (invHess x vStar))

/-- Chewi Definition 13.5, supplied-Hessian Dikin ellipsoid. -/
def dikinEllipsoid (hess : E -> E →L[ℝ] E) (x : E) (r : ℝ) : Set E :=
  {y | localNorm hess x (y - x) < r}

/-- Newton's method update with a supplied inverse-Hessian oracle. -/
noncomputable def newtonStep
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) : E :=
  x - invHess x (grad x)

/-- Chewi Definition 13.7, Newton decrement via the supplied dual local norm. -/
noncomputable def newtonDecrement
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) : ℝ :=
  dualLocalNorm invHess x (grad x)

theorem localNorm_nonneg (hess : E -> E →L[ℝ] E) (x v : E) :
    0 ≤ localNorm hess x v :=
  Real.sqrt_nonneg _

theorem dualLocalNorm_nonneg (invHess : E -> E →L[ℝ] E) (x vStar : E) :
    0 ≤ dualLocalNorm invHess x vStar :=
  Real.sqrt_nonneg _

theorem localNorm_sq_eq_inner
    {hess : E -> E →L[ℝ] E} {x v : E}
    (hquad : 0 ≤ inner ℝ v (hess x v)) :
    (localNorm hess x v) ^ (2 : ℕ) = inner ℝ v (hess x v) := by
  simpa [localNorm] using Real.sq_sqrt hquad

theorem dualLocalNorm_sq_eq_inner
    {invHess : E -> E →L[ℝ] E} {x vStar : E}
    (hquad : 0 ≤ inner ℝ vStar (invHess x vStar)) :
    (dualLocalNorm invHess x vStar) ^ (2 : ℕ) =
      inner ℝ vStar (invHess x vStar) := by
  simpa [dualLocalNorm] using Real.sq_sqrt hquad

theorem localNorm_zero (hess : E -> E →L[ℝ] E) (x : E) :
    localNorm hess x 0 = 0 := by
  simp [localNorm]

theorem dualLocalNorm_zero (invHess : E -> E →L[ℝ] E) (x : E) :
    dualLocalNorm invHess x 0 = 0 := by
  simp [dualLocalNorm]

theorem newtonStep_sub
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) :
    newtonStep grad invHess x - x = -invHess x (grad x) := by
  simp [newtonStep]

theorem sub_newtonStep
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) :
    x - newtonStep grad invHess x = invHess x (grad x) := by
  simp [newtonStep]

/--
Chewi Definition 13.3, source-shaped self-concordance interface using only the
directional cubic `∇³ f(x)[v,v,v]` and a supplied Hessian oracle.
-/
structure SelfConcordantOn
    (s : Set E) (hess : E -> E →L[ℝ] E) (third : E -> E -> ℝ)
    (M : ℝ) : Prop where
  parameter_pos : 0 < M
  hess_nonneg : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
    0 ≤ inner ℝ v (hess x v)
  third_bound : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
    |third x v| ≤ 2 * M * (localNorm hess x v) ^ (3 : ℕ)

theorem SelfConcordantOn.of_zero_third
    {s : Set E} {hess : E -> E →L[ℝ] E} {M : ℝ}
    (hM : 0 < M)
    (hess_nonneg : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
      0 ≤ inner ℝ v (hess x v)) :
    SelfConcordantOn s hess (fun _ _ => 0) M where
  parameter_pos := hM
  hess_nonneg := hess_nonneg
  third_bound := by
    intro x hx v
    have hnorm_nonneg : 0 ≤ localNorm hess x v :=
      localNorm_nonneg hess x v
    have hrhs_nonneg :
        0 ≤ 2 * M * (localNorm hess x v) ^ (3 : ℕ) := by
      positivity
    simpa using hrhs_nonneg

/--
Source-shaped certificate for the textbook observation after Definition 13.3:
a quadratic model has zero third derivative, hence is self-concordant for any
positive parameter as soon as its supplied Hessian is positive semidefinite on
the working set.
-/
theorem constantHessian_zeroThird_selfConcordantOn
    {s : Set E} {H : E →L[ℝ] E} {M : ℝ}
    (hM : 0 < M)
    (hH_nonneg : ∀ v : E, 0 ≤ inner ℝ v (H v)) :
    SelfConcordantOn s (fun _ => H) (fun _ _ => 0) M :=
  SelfConcordantOn.of_zero_third
    (s := s) (hess := fun _ => H) hM
    (by
      intro x hx v
      exact hH_nonneg v)

end VectorSelfConcordance

/-- Chewi Example 13.4's logarithmic barrier on the positive half-line. -/
noncomputable def negLogBarrier (x : ℝ) : ℝ :=
  - Real.log x

/-- The displayed second derivative of `negLogBarrier`: `x^{-2}`. -/
noncomputable def negLogBarrierSecond (x : ℝ) : ℝ :=
  x ^ (-2 : ℤ)

/-- The displayed third derivative of `negLogBarrier`: `-2 x^{-3}`. -/
noncomputable def negLogBarrierThird (x : ℝ) : ℝ :=
  -2 * x ^ (-3 : ℤ)

/--
One-dimensional local norm generated by a supplied second-derivative oracle.
For `f(x) = -log x`, this is `sqrt(f''(x) v^2) = |v| / x`.
-/
noncomputable def oneDimLocalNorm (second : ℝ -> ℝ) (x v : ℝ) : ℝ :=
  Real.sqrt (second x * v ^ (2 : ℕ))

/--
One-dimensional self-concordance inequality in the source form
`|f'''(x) v^3| <= 2 M ||v||_x^3`.
-/
structure OneDimSelfConcordantOn
    (s : Set ℝ) (second third : ℝ -> ℝ) (M : ℝ) : Prop where
  parameter_pos : 0 < M
  second_nonneg : ∀ ⦃x : ℝ⦄, x ∈ s -> 0 ≤ second x
  inequality : ∀ ⦃x : ℝ⦄, x ∈ s -> ∀ v : ℝ,
    |third x * v ^ (3 : ℕ)| ≤
      2 * M * (oneDimLocalNorm second x v) ^ (3 : ℕ)

theorem negLogBarrier_deriv (x : ℝ) :
    deriv negLogBarrier x = -x⁻¹ := by
  unfold negLogBarrier
  rw [deriv.fun_neg, Real.deriv_log]

theorem inv_sq_eq_zpow_neg_two (x : ℝ) :
    x⁻¹ ^ (2 : ℕ) = x ^ (-2 : ℤ) := by
  change x⁻¹ ^ (2 : ℕ) = (x ^ (2 : ℕ))⁻¹
  exact inv_pow x 2

theorem negLogBarrier_second_deriv (x : ℝ) :
    deriv^[2] negLogBarrier x = negLogBarrierSecond x := by
  change deriv (deriv negLogBarrier) x = negLogBarrierSecond x
  have hderiv_fun : deriv negLogBarrier = fun x : ℝ => -x⁻¹ := by
    funext y
    exact negLogBarrier_deriv y
  rw [hderiv_fun]
  rw [deriv.fun_neg, deriv_inv]
  simpa [negLogBarrierSecond] using inv_sq_eq_zpow_neg_two x

theorem negLogBarrier_third_deriv (x : ℝ) :
    deriv^[3] negLogBarrier x = negLogBarrierThird x := by
  change deriv (deriv (deriv negLogBarrier)) x = negLogBarrierThird x
  have hsecond_fun :
      deriv (deriv negLogBarrier) = fun x : ℝ => negLogBarrierSecond x := by
    funext y
    exact negLogBarrier_second_deriv y
  rw [hsecond_fun]
  simp only [negLogBarrierSecond]
  rw [deriv_zpow]
  simp [negLogBarrierThird]

theorem negLogBarrier_localNorm_eq_abs_div
    {x v : ℝ} (hx : 0 < x) :
    oneDimLocalNorm negLogBarrierSecond x v = |v| / x := by
  have hx_ne : x ≠ 0 := hx.ne'
  have hrad_nonneg :
      0 ≤ negLogBarrierSecond x * v ^ (2 : ℕ) := by
    simp [negLogBarrierSecond]
    positivity
  have hright_nonneg : 0 ≤ |v| / x :=
    div_nonneg (abs_nonneg v) hx.le
  refine (sq_eq_sq₀ (Real.sqrt_nonneg _) hright_nonneg).mp ?_
  change (Real.sqrt (negLogBarrierSecond x * v ^ (2 : ℕ))) ^ (2 : ℕ) =
    (|v| / x) ^ (2 : ℕ)
  rw [Real.sq_sqrt hrad_nonneg]
  dsimp [negLogBarrierSecond]
  rw [← sq_abs v]
  field_simp [hx_ne]

/--
Chewi Example 13.4, scalar inequality form:
`|-2 x^{-3} v^3| <= 2 (sqrt(x^{-2} v^2))^3`.
-/
theorem negLogBarrier_selfConcordance_ineq
    {x v : ℝ} (hx : 0 < x) :
    |negLogBarrierThird x * v ^ (3 : ℕ)| ≤
      2 * (oneDimLocalNorm negLogBarrierSecond x v) ^ (3 : ℕ) := by
  have hsqrt :
      oneDimLocalNorm negLogBarrierSecond x v = |v| / x :=
    negLogBarrier_localNorm_eq_abs_div hx
  rw [hsqrt]
  dsimp [negLogBarrierThird]
  have hx_ne : x ≠ 0 := hx.ne'
  have hxzpos : 0 < x ^ (-3 : ℤ) := zpow_pos hx _
  have hcoeff : |-2 * x ^ (-3 : ℤ)| = 2 * x ^ (-3 : ℤ) := by
    rw [abs_of_neg]
    · ring
    · nlinarith
  rw [abs_mul, hcoeff, abs_pow]
  field_simp [hx_ne]
  exact le_rfl

/--
Chewi Example 13.4: the logarithmic barrier `x ↦ -log x` is
self-concordant with parameter `1` on the positive half-line.
-/
theorem negLogBarrier_oneDimSelfConcordantOn_Ioi :
    OneDimSelfConcordantOn (Set.Ioi 0)
      negLogBarrierSecond negLogBarrierThird 1 where
  parameter_pos := by norm_num
  second_nonneg := by
    intro x hx
    simp [negLogBarrierSecond]
    positivity
  inequality := by
    intro x hx v
    have hineq :=
      negLogBarrier_selfConcordance_ineq (x := x) (v := v) hx
    simpa [oneDimLocalNorm] using hineq

end Optimization
end StatInference
