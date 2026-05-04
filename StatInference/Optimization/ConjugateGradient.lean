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

/-- The `A`-inner product form used for conjugate-gradient orthogonality. -/
def aInner (A : E →L[ℝ] E) (x y : E) : ℝ :=
  inner ℝ x (A y)

/-- The squared `A`-norm form `‖x‖_A² = <x, A x>`. -/
def aNormSq (A : E →L[ℝ] E) (x : E) : ℝ :=
  aInner A x x

/-- Symmetry of the `A`-inner product under the supplied self-adjointness. -/
theorem aInner_comm {A : E →L[ℝ] E} (hA_sym : IsSelfAdjointOperator A)
    (x y : E) :
    aInner A x y = aInner A y x := by
  calc
    aInner A x y = inner ℝ (A x) y := by
      simpa [aInner] using (hA_sym x y).symm
    _ = inner ℝ y (A x) := by
      rw [real_inner_comm]
    _ = aInner A y x := by
      rfl

/-- A nonnegative lower quadratic-form bound makes `‖x‖_A²` nonnegative. -/
theorem aNormSq_nonneg_of_lowerBound {A : E →L[ℝ] E} {alpha : ℝ}
    (halpha_nonneg : 0 ≤ alpha)
    (hlower : QuadraticFormLowerBound A alpha) (x : E) :
    0 ≤ aNormSq A x := by
  have hquad := hlower x
  have hleft_nonneg : 0 ≤ alpha * ‖x‖ ^ (2 : ℕ) :=
    mul_nonneg halpha_nonneg (sq_nonneg ‖x‖)
  exact hleft_nonneg.trans hquad

/-- The vector `A^k p₀` appearing in Chewi's Krylov subspaces. -/
def krylovVector (A : E →L[ℝ] E) (p0 : E) (k : ℕ) : E :=
  (fun x : E => A x)^[k] p0

@[simp]
theorem krylovVector_zero (A : E →L[ℝ] E) (p0 : E) :
    krylovVector A p0 0 = p0 := by
  simp [krylovVector]

theorem krylovVector_succ (A : E →L[ℝ] E) (p0 : E) (k : ℕ) :
    krylovVector A p0 (k + 1) = A (krylovVector A p0 k) := by
  simp [krylovVector, Function.iterate_succ_apply']

theorem apply_krylovVector (A : E →L[ℝ] E) (p0 : E) (k : ℕ) :
    A (krylovVector A p0 k) = krylovVector A p0 (k + 1) := by
  rw [krylovVector_succ]

/-- Chewi Definition 5.2: `K_n = span {p₀, A p₀, ..., A^n p₀}`. -/
def krylovSubmodule (A : E →L[ℝ] E) (p0 : E) (n : ℕ) : Submodule ℝ E :=
  Submodule.span ℝ ((fun k : ℕ => krylovVector A p0 k) '' {k : ℕ | k ≤ n})

/-- The search-direction span `span {p₀, ..., p_n}` from the CG discussion. -/
def cgDirectionSubmodule (p : ℕ → E) (n : ℕ) : Submodule ℝ E :=
  Submodule.span ℝ (p '' {k : ℕ | k ≤ n})

/-- Each generated Krylov vector belongs to the corresponding Krylov subspace. -/
theorem krylovVector_mem_krylovSubmodule (A : E →L[ℝ] E) (p0 : E)
    {k n : ℕ} (hk : k ≤ n) :
    krylovVector A p0 k ∈ krylovSubmodule A p0 n := by
  exact Submodule.subset_span ⟨k, hk, rfl⟩

/-- Krylov subspaces are monotone in the iteration index. -/
theorem krylovSubmodule_mono (A : E →L[ℝ] E) (p0 : E)
    {m n : ℕ} (hmn : m ≤ n) :
    krylovSubmodule A p0 m ≤ krylovSubmodule A p0 n := by
  refine Submodule.span_mono ?_
  rintro v ⟨k, hk, rfl⟩
  exact ⟨k, hk.trans hmn, rfl⟩

/-- Applying `A` maps `K_n` into `K_{n+1}`. -/
theorem continuousLinearMap_apply_mem_krylovSubmodule_succ
    (A : E →L[ℝ] E) (p0 : E) {n : ℕ} {v : E}
    (hv : v ∈ krylovSubmodule A p0 n) :
    A v ∈ krylovSubmodule A p0 (n + 1) := by
  induction hv using Submodule.span_induction with
  | mem v hv =>
      rcases hv with ⟨k, hk, rfl⟩
      rw [apply_krylovVector]
      exact krylovVector_mem_krylovSubmodule A p0 (Nat.succ_le_succ hk)
  | zero =>
      simp
  | add x y _ _ hx hy =>
      simpa [map_add] using Submodule.add_mem _ hx hy
  | smul t x _ hx =>
      simpa [map_smul] using Submodule.smul_mem _ t hx

/-- Each CG search direction belongs to the direction span through its index. -/
theorem cgDirection_mem_cgDirectionSubmodule (p : ℕ → E) (n : ℕ) :
    p n ∈ cgDirectionSubmodule p n := by
  exact Submodule.subset_span ⟨n, by simp, rfl⟩

/-- Direction spans are monotone in the iteration index. -/
theorem cgDirectionSubmodule_mono (p : ℕ → E)
    {m n : ℕ} (hmn : m ≤ n) :
    cgDirectionSubmodule p m ≤ cgDirectionSubmodule p n := by
  refine Submodule.span_mono ?_
  rintro v ⟨k, hk, rfl⟩
  exact ⟨k, hk.trans hmn, rfl⟩

/--
If each `A p_k` is available in the next direction span, then applying `A` to
any vector in the span through time `n` lands in the span through time `n+1`.
-/
theorem continuousLinearMap_apply_mem_cgDirectionSubmodule_succ
    {A : E →L[ℝ] E} {p : ℕ → E}
    (hA_mem : ∀ k, A (p k) ∈ cgDirectionSubmodule p (k + 1))
    {n : ℕ} {v : E} (hv : v ∈ cgDirectionSubmodule p n) :
    A v ∈ cgDirectionSubmodule p (n + 1) := by
  induction hv using Submodule.span_induction with
  | mem v hv =>
      rcases hv with ⟨k, hk, rfl⟩
      exact cgDirectionSubmodule_mono p (Nat.succ_le_succ hk) (hA_mem k)
  | zero =>
      simp
  | add x y _ _ hx hy =>
      simpa [map_add] using Submodule.add_mem _ hx hy
  | smul t x _ hx =>
      simpa [map_smul] using Submodule.smul_mem _ t hx

/--
Supplied interface for the algebraic content of Chewi Lemma 5.1.

The concrete CG recurrence should later prove these fields from the displayed
line-search and Gram-Schmidt formulas.  Keeping this as an interface lets the
Krylov equality and later termination proof develop independently from the
implementation-level denominators.
-/
structure IsCGKrylovRecurrence (A : E →L[ℝ] E) (p0 : E)
    (p : ℕ → E) : Prop where
  base : p 0 = p0
  direction_mem_krylov : ∀ n, p n ∈ krylovSubmodule A p0 n
  apply_direction_mem_next : ∀ n, A (p n) ∈ cgDirectionSubmodule p (n + 1)

/-- Under the Lemma 5.1 recurrence interface, each `A^n p₀` is in `span {p₀,...,p_n}`. -/
theorem IsCGKrylovRecurrence.krylovVector_mem_cgDirectionSubmodule
    {A : E →L[ℝ] E} {p0 : E} {p : ℕ → E}
    (h : IsCGKrylovRecurrence A p0 p) (n : ℕ) :
    krylovVector A p0 n ∈ cgDirectionSubmodule p n := by
  induction n with
  | zero =>
      rw [krylovVector_zero, ← h.base]
      exact cgDirection_mem_cgDirectionSubmodule p 0
  | succ n ih =>
      rw [krylovVector_succ]
      exact continuousLinearMap_apply_mem_cgDirectionSubmodule_succ
        h.apply_direction_mem_next ih

/--
Chewi Lemma 5.1 as a reusable supplied-interface theorem:
`span {p₀,...,p_n} = span {p₀, A p₀, ..., A^n p₀}`.
-/
theorem IsCGKrylovRecurrence.cgDirectionSubmodule_eq_krylovSubmodule
    {A : E →L[ℝ] E} {p0 : E} {p : ℕ → E}
    (h : IsCGKrylovRecurrence A p0 p) (n : ℕ) :
    cgDirectionSubmodule p n = krylovSubmodule A p0 n := by
  apply le_antisymm
  · refine Submodule.span_le.mpr ?_
    rintro v ⟨k, hk, rfl⟩
    exact krylovSubmodule_mono A p0 hk (h.direction_mem_krylov k)
  · refine Submodule.span_le.mpr ?_
    rintro v ⟨k, hk, rfl⟩
    exact cgDirectionSubmodule_mono p hk
      (h.krylovVector_mem_cgDirectionSubmodule k)

/-- Usual inner-product orthogonality of a residual to a submodule. -/
def IsOrthogonalToSubmodule (r : E) (S : Submodule ℝ E) : Prop :=
  ∀ y ∈ S, inner ℝ r y = 0

/--
A vector in a submodule and orthogonal to that same submodule is zero.  This
is the short Hilbert-space step behind the termination discussion for CG.
-/
theorem eq_zero_of_mem_submodule_and_orthogonal
    {S : Submodule ℝ E} {r : E}
    (hrS : r ∈ S) (horth : IsOrthogonalToSubmodule r S) :
    r = 0 := by
  have hself : inner ℝ r r = 0 := horth r hrS
  have hnormsq : ‖r‖ ^ (2 : ℕ) = 0 := by
    simpa [real_inner_self_eq_norm_sq] using hself
  have hnorm : ‖r‖ = 0 := sq_eq_zero_iff.mp hnormsq
  exact norm_eq_zero.mp hnorm

/--
Exactness state for the source sentence: if the residual belongs to the
already-built CG direction space and is orthogonal to it, the residual vanishes.
-/
def IsCGResidualExactnessState (A : E →L[ℝ] E) (b : E)
    (x : E) (p : ℕ → E) (n : ℕ) : Prop :=
  quadraticGradient A b x ∈ cgDirectionSubmodule p n ∧
    IsOrthogonalToSubmodule (quadraticGradient A b x) (cgDirectionSubmodule p n)

/-- A residual exactness state forces the quadratic gradient to vanish. -/
theorem quadraticGradient_eq_zero_of_cgResidualExactnessState
    {A : E →L[ℝ] E} {b x : E} {p : ℕ → E} {n : ℕ}
    (h : IsCGResidualExactnessState A b x p n) :
    quadraticGradient A b x = 0 :=
  eq_zero_of_mem_submodule_and_orthogonal h.1 h.2

/--
Theorem 5.3-facing minimizer wrapper: once the CG residual is in its current
direction span and orthogonal to that span, the current point solves `A x = b`
and is a global minimizer of Chewi's quadratic objective.
-/
theorem quadraticObjective_isMinOn_of_cgResidualExactnessState
    {A : E →L[ℝ] E} {b x : E} {p : ℕ → E} {n : ℕ} {alpha : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hlower : QuadraticFormLowerBound A alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (h : IsCGResidualExactnessState A b x p n) :
    IsMinOn (quadraticObjective A b) Set.univ x := by
  have hgrad_zero : quadraticGradient A b x = 0 :=
    quadraticGradient_eq_zero_of_cgResidualExactnessState h
  exact quadraticObjective_isMinOn_of_apply_eq hA_sym hlower halpha_nonneg
    ((quadraticGradient_eq_zero_iff A b x).1 hgrad_zero)

end Optimization
end StatInference
