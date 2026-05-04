import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
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

/--
Source-shaped three-term CG recurrence interface.

Here `r` is the residual sequence, `p` is the search-direction sequence,
`eta` is the line-search coefficient in `r_{n+1} = r_n + eta_n A p_n`, and
`gamma` is the direction-update coefficient in
`p_{n+1} = r_{n+1} + gamma_n p_n`.
-/
structure IsCGThreeTermRecurrence (A : E →L[ℝ] E) (p0 : E)
    (r p : ℕ → E) (eta gamma : ℕ → ℝ) : Prop where
  residual_zero : r 0 = p0
  direction_zero : p 0 = p0
  residual_succ : ∀ n, r (n + 1) = r n + eta n • A (p n)
  direction_succ : ∀ n, p (n + 1) = r (n + 1) + gamma n • p n
  eta_ne_zero : ∀ n, eta n ≠ 0

/-- The source three-term recurrence keeps residuals and directions in `K_n`. -/
theorem IsCGThreeTermRecurrence.residual_and_direction_mem_krylovSubmodule
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E} {eta gamma : ℕ → ℝ}
    (h : IsCGThreeTermRecurrence A p0 r p eta gamma) :
    ∀ n, r n ∈ krylovSubmodule A p0 n ∧
      p n ∈ krylovSubmodule A p0 n := by
  intro n
  induction n with
  | zero =>
      have hp0 : p0 ∈ krylovSubmodule A p0 0 :=
        krylovVector_mem_krylovSubmodule A p0 (le_refl 0)
      constructor
      · simpa [h.residual_zero] using hp0
      · simpa [h.direction_zero] using hp0
  | succ n ih =>
      rcases ih with ⟨hr, hp⟩
      have hr_mono : r n ∈ krylovSubmodule A p0 (n + 1) :=
        krylovSubmodule_mono A p0 (Nat.le_succ n) hr
      have hp_mono : p n ∈ krylovSubmodule A p0 (n + 1) :=
        krylovSubmodule_mono A p0 (Nat.le_succ n) hp
      have hAp : A (p n) ∈ krylovSubmodule A p0 (n + 1) :=
        continuousLinearMap_apply_mem_krylovSubmodule_succ A p0 hp
      have hr_succ : r (n + 1) ∈ krylovSubmodule A p0 (n + 1) := by
        rw [h.residual_succ n]
        exact Submodule.add_mem _ hr_mono (Submodule.smul_mem _ (eta n) hAp)
      have hp_succ : p (n + 1) ∈ krylovSubmodule A p0 (n + 1) := by
        rw [h.direction_succ n]
        exact Submodule.add_mem _ hr_succ (Submodule.smul_mem _ (gamma n) hp_mono)
      exact ⟨hr_succ, hp_succ⟩

/-- Residuals produced by the three-term recurrence lie in the direction span. -/
theorem IsCGThreeTermRecurrence.residual_mem_cgDirectionSubmodule
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E} {eta gamma : ℕ → ℝ}
    (h : IsCGThreeTermRecurrence A p0 r p eta gamma) (n : ℕ) :
    r n ∈ cgDirectionSubmodule p n := by
  induction n with
  | zero =>
      have hrp : r 0 = p 0 := h.residual_zero.trans h.direction_zero.symm
      rw [hrp]
      exact cgDirection_mem_cgDirectionSubmodule p 0
  | succ n ih =>
      have hp_succ : p (n + 1) ∈ cgDirectionSubmodule p (n + 1) :=
        cgDirection_mem_cgDirectionSubmodule p (n + 1)
      have hp_n : p n ∈ cgDirectionSubmodule p (n + 1) :=
        cgDirectionSubmodule_mono p (Nat.le_succ n)
          (cgDirection_mem_cgDirectionSubmodule p n)
      have hres_eq : r (n + 1) = p (n + 1) - gamma n • p n := by
        rw [h.direction_succ n]
        abel
      rw [hres_eq]
      exact Submodule.sub_mem _ hp_succ (Submodule.smul_mem _ (gamma n) hp_n)

/-- The source recurrence proves the source step `A p_n ∈ span {p₀,...,p_{n+1}}`. -/
theorem IsCGThreeTermRecurrence.apply_direction_mem_next
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E} {eta gamma : ℕ → ℝ}
    (h : IsCGThreeTermRecurrence A p0 r p eta gamma) (n : ℕ) :
    A (p n) ∈ cgDirectionSubmodule p (n + 1) := by
  have hr_succ : r (n + 1) ∈ cgDirectionSubmodule p (n + 1) :=
    h.residual_mem_cgDirectionSubmodule (n + 1)
  have hr_n : r n ∈ cgDirectionSubmodule p (n + 1) :=
    cgDirectionSubmodule_mono p (Nat.le_succ n)
      (h.residual_mem_cgDirectionSubmodule n)
  have hdiff_mem : r (n + 1) - r n ∈ cgDirectionSubmodule p (n + 1) :=
    Submodule.sub_mem _ hr_succ hr_n
  have hdiff_eq : r (n + 1) - r n = eta n • A (p n) := by
    rw [h.residual_succ n]
    abel
  have hscale : (eta n)⁻¹ • (eta n • A (p n)) = A (p n) := by
    rw [smul_smul, inv_mul_cancel₀ (h.eta_ne_zero n), one_smul]
  rw [← hscale, ← hdiff_eq]
  exact Submodule.smul_mem _ (eta n)⁻¹ hdiff_mem

/--
The source three-term recurrence supplies the abstract Krylov recurrence
interface used by Lemma 5.1.
-/
theorem IsCGThreeTermRecurrence.to_isCGKrylovRecurrence
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E} {eta gamma : ℕ → ℝ}
    (h : IsCGThreeTermRecurrence A p0 r p eta gamma) :
    IsCGKrylovRecurrence A p0 p where
  base := h.direction_zero
  direction_mem_krylov := fun n =>
    (h.residual_and_direction_mem_krylovSubmodule n).2
  apply_direction_mem_next := h.apply_direction_mem_next

/--
Chewi Lemma 5.1 from the source-shaped three-term recurrence:
`span {p₀,...,p_n} = span {p₀, A p₀, ..., A^n p₀}`.
-/
theorem IsCGThreeTermRecurrence.cgDirectionSubmodule_eq_krylovSubmodule
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E} {eta gamma : ℕ → ℝ}
    (h : IsCGThreeTermRecurrence A p0 r p eta gamma) (n : ℕ) :
    cgDirectionSubmodule p n = krylovSubmodule A p0 n :=
  h.to_isCGKrylovRecurrence.cgDirectionSubmodule_eq_krylovSubmodule n

/--
Textbook CG residual line-search coefficient for the update
`r_{n+1}=r_n+eta_n A p_n`.  This is the displayed coefficient
`- ‖r_n‖² / <p_n, A p_n>`.
-/
noncomputable def cgLineSearchCoeff (A : E →L[ℝ] E)
    (r p : ℕ → E) (n : ℕ) : ℝ :=
  - (‖r n‖ ^ (2 : ℕ) / aNormSq A (p n))

/--
Textbook CG direction-update coefficient
`‖r_{n+1}‖² / ‖r_n‖²`.
-/
noncomputable def cgDirectionUpdateCoeff (r : ℕ → E) (n : ℕ) : ℝ :=
  ‖r (n + 1)‖ ^ (2 : ℕ) / ‖r n‖ ^ (2 : ℕ)

omit [InnerProductSpace ℝ E] in
/-- The denominator in `cgDirectionUpdateCoeff` is nonzero when the residual is nonzero. -/
theorem cgDirectionUpdateCoeff_denom_ne_zero
    (r : ℕ → E) (n : ℕ) (hr_ne : r n ≠ 0) :
    ‖r n‖ ^ (2 : ℕ) ≠ 0 :=
  pow_ne_zero (2 : ℕ) (norm_ne_zero_iff.mpr hr_ne)

/-- Nonzero textbook line-search coefficient from nonzero residual and A-norm denominator. -/
theorem cgLineSearchCoeff_ne_zero
    (A : E →L[ℝ] E) (r p : ℕ → E) (n : ℕ)
    (hr_ne : r n ≠ 0)
    (hden_ne : aNormSq A (p n) ≠ 0) :
    cgLineSearchCoeff A r p n ≠ 0 := by
  unfold cgLineSearchCoeff
  exact neg_ne_zero.mpr
    (div_ne_zero (cgDirectionUpdateCoeff_denom_ne_zero r n hr_ne) hden_ne)

omit [InnerProductSpace ℝ E] in
/-- Nonzero direction-update coefficient when both adjacent residuals are nonzero. -/
theorem cgDirectionUpdateCoeff_ne_zero
    (r : ℕ → E) (n : ℕ)
    (hr_succ_ne : r (n + 1) ≠ 0) (hr_ne : r n ≠ 0) :
    cgDirectionUpdateCoeff r n ≠ 0 := by
  unfold cgDirectionUpdateCoeff
  exact div_ne_zero (cgDirectionUpdateCoeff_denom_ne_zero r (n + 1) hr_succ_ne)
    (cgDirectionUpdateCoeff_denom_ne_zero r n hr_ne)

/--
Displayed CG residual/direction iteration from the textbook, with the currently
exposed nonzero side conditions needed to invert the line-search coefficient.
-/
structure IsCGDisplayedIteration (A : E →L[ℝ] E) (p0 : E)
    (r p : ℕ → E) : Prop where
  residual_zero : r 0 = p0
  direction_zero : p 0 = p0
  residual_succ : ∀ n,
    r (n + 1) = r n + cgLineSearchCoeff A r p n • A (p n)
  direction_succ : ∀ n,
    p (n + 1) = r (n + 1) + cgDirectionUpdateCoeff r n • p n
  residual_ne_zero : ∀ n, r n ≠ 0
  aNormSq_direction_ne_zero : ∀ n, aNormSq A (p n) ≠ 0

/-- The displayed CG iteration supplies the source-shaped three-term recurrence. -/
theorem IsCGDisplayedIteration.to_isCGThreeTermRecurrence
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E}
    (h : IsCGDisplayedIteration A p0 r p) :
    IsCGThreeTermRecurrence A p0 r p
      (cgLineSearchCoeff A r p) (cgDirectionUpdateCoeff r) where
  residual_zero := h.residual_zero
  direction_zero := h.direction_zero
  residual_succ := h.residual_succ
  direction_succ := h.direction_succ
  eta_ne_zero := fun n =>
    cgLineSearchCoeff_ne_zero A r p n (h.residual_ne_zero n)
      (h.aNormSq_direction_ne_zero n)

/-- The displayed CG iteration supplies the abstract Krylov recurrence interface. -/
theorem IsCGDisplayedIteration.to_isCGKrylovRecurrence
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E}
    (h : IsCGDisplayedIteration A p0 r p) :
    IsCGKrylovRecurrence A p0 p :=
  h.to_isCGThreeTermRecurrence.to_isCGKrylovRecurrence

/--
Chewi Lemma 5.1 from the literal displayed residual and Gram-Schmidt
coefficient formulas.
-/
theorem IsCGDisplayedIteration.cgDirectionSubmodule_eq_krylovSubmodule
    {A : E →L[ℝ] E} {p0 : E} {r p : ℕ → E}
    (h : IsCGDisplayedIteration A p0 r p) (n : ℕ) :
    cgDirectionSubmodule p n = krylovSubmodule A p0 n :=
  h.to_isCGThreeTermRecurrence.cgDirectionSubmodule_eq_krylovSubmodule n

/--
If the displayed direction update has `p_{n+1}=0`, then the next residual
already belongs to the previous direction span `span {p₀,...,p_n}`.
-/
theorem residual_succ_mem_cgDirectionSubmodule_of_direction_succ_eq_zero
    {r p : ℕ → E} {gamma : ℕ → ℝ} {n : ℕ}
    (hdir : p (n + 1) = r (n + 1) + gamma n • p n)
    (hpzero : p (n + 1) = 0) :
    r (n + 1) ∈ cgDirectionSubmodule p n := by
  have hp_mem : p n ∈ cgDirectionSubmodule p n :=
    cgDirection_mem_cgDirectionSubmodule p n
  have hsum : r (n + 1) + gamma n • p n = 0 := by
    rw [← hdir, hpzero]
  have hres_eq : r (n + 1) = -(gamma n • p n) :=
    eq_neg_of_add_eq_zero_left hsum
  rw [hres_eq]
  exact Submodule.neg_mem _ (Submodule.smul_mem _ (gamma n) hp_mem)

/--
The termination branch in the proof of Chewi Theorem 5.3: if `p_{n+1}=0`
and the next residual is orthogonal to the previous direction span, then the
next residual vanishes.
-/
theorem residual_succ_eq_zero_of_direction_succ_eq_zero_and_orthogonal
    {r p : ℕ → E} {gamma : ℕ → ℝ} {n : ℕ}
    (hdir : p (n + 1) = r (n + 1) + gamma n • p n)
    (hpzero : p (n + 1) = 0)
    (horth : IsOrthogonalToSubmodule (r (n + 1)) (cgDirectionSubmodule p n)) :
    r (n + 1) = 0 :=
  eq_zero_of_mem_submodule_and_orthogonal
    (residual_succ_mem_cgDirectionSubmodule_of_direction_succ_eq_zero hdir hpzero)
    horth

/--
The same termination branch as a quadratic-minimizer wrapper: once the
vanishing residual is identified with the quadratic gradient at the current
point, that point globally minimizes the quadratic objective.
-/
theorem quadraticObjective_isMinOn_of_direction_succ_eq_zero_and_orthogonal
    {A : E →L[ℝ] E} {b x : E} {r p : ℕ → E} {gamma : ℕ → ℝ}
    {n : ℕ} {alpha : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hlower : QuadraticFormLowerBound A alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (hres_grad : r (n + 1) = quadraticGradient A b x)
    (hdir : p (n + 1) = r (n + 1) + gamma n • p n)
    (hpzero : p (n + 1) = 0)
    (horth : IsOrthogonalToSubmodule (r (n + 1)) (cgDirectionSubmodule p n)) :
    IsMinOn (quadraticObjective A b) Set.univ x := by
  have hr_zero : r (n + 1) = 0 :=
    residual_succ_eq_zero_of_direction_succ_eq_zero_and_orthogonal hdir hpzero horth
  have hgrad_zero : quadraticGradient A b x = 0 := by
    rw [← hres_grad]
    exact hr_zero
  exact quadraticObjective_isMinOn_of_apply_eq hA_sym hlower halpha_nonneg
    ((quadraticGradient_eq_zero_iff A b x).1 hgrad_zero)

/--
Finite-dimensional counting core for Chewi Theorem 5.3: among the first
`finrank ℝ E + 1` mutually orthogonal residuals, one must vanish.
-/
theorem exists_residual_eq_zero_of_pairwise_orthogonal
    [FiniteDimensional ℝ E] (r : ℕ → E)
    (horth : ∀ i j : ℕ, i ≠ j → inner ℝ (r i) (r j) = 0) :
    ∃ n ≤ Module.finrank ℝ E, r n = 0 := by
  let d := Module.finrank ℝ E
  by_contra hnone
  have hne : ∀ n, n ≤ d → r n ≠ 0 := by
    intro n hn hzero
    exact hnone ⟨n, hn, hzero⟩
  let v : Fin (d + 1) → E := fun i => r i.val
  have hiortho : LinearMap.BilinForm.iIsOrtho (innerₗ E) v := by
    intro i j hij
    dsimp [v]
    exact horth i.val j.val (fun hval => hij (Fin.ext hval))
  have hself : ∀ i, ¬LinearMap.BilinForm.IsOrtho (innerₗ E) (v i) (v i) := by
    intro i hi
    have hinner' : (innerₗ E) (v i) (v i) = 0 := hi
    have hinner : inner ℝ (r i.val) (r i.val) = 0 := by
      simpa [v] using hinner'
    have hnormsq : ‖r i.val‖ ^ (2 : ℕ) = 0 := by
      simpa [real_inner_self_eq_norm_sq] using hinner
    have hzero : r i.val = 0 :=
      norm_eq_zero.mp (sq_eq_zero_iff.mp hnormsq)
    exact hne i.val (Nat.le_of_lt_succ i.isLt) hzero
  have hli : LinearIndependent ℝ v :=
    LinearMap.BilinForm.linearIndependent_of_iIsOrtho hiortho hself
  have hcard : Fintype.card (Fin (d + 1)) ≤ Module.finrank ℝ E :=
    hli.fintype_card_le_finrank
  simp [d] at hcard

/--
Finite-dimensional Theorem 5.3-facing wrapper: if the residuals are mutually
orthogonal and identify with the quadratic gradients, one of the first
`finrank ℝ E + 1` iterates is already a global minimizer.
-/
theorem exists_quadraticObjective_isMinOn_of_pairwise_orthogonal_residuals
    [FiniteDimensional ℝ E] {A : E →L[ℝ] E} {b : E}
    {x r : ℕ → E} {alpha : ℝ}
    (hA_sym : IsSelfAdjointOperator A)
    (hlower : QuadraticFormLowerBound A alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (horth : ∀ i j : ℕ, i ≠ j → inner ℝ (r i) (r j) = 0)
    (hres_grad : ∀ n, r n = quadraticGradient A b (x n)) :
    ∃ n ≤ Module.finrank ℝ E, IsMinOn (quadraticObjective A b) Set.univ (x n) := by
  rcases exists_residual_eq_zero_of_pairwise_orthogonal r horth with ⟨n, hn, hr_zero⟩
  refine ⟨n, hn, ?_⟩
  have hgrad_zero : quadraticGradient A b (x n) = 0 := by
    rw [← hres_grad n]
    exact hr_zero
  exact quadraticObjective_isMinOn_of_apply_eq hA_sym hlower halpha_nonneg
    ((quadraticGradient_eq_zero_iff A b (x n)).1 hgrad_zero)

end Optimization
end StatInference
