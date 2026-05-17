import Mathlib.Analysis.Matrix.Order
import Mathlib.Analysis.CStarAlgebra.Matrix
import StatInference.Optimization.Basic

/-!
# Chewi Optimization 2026, Appendix A Matrix Order

This module records source-facing wrappers for the matrix background in
Appendix A of Chewi's optimization notes.  The first layer packages Definition
A.4's Loewner/PSD order display using mathlib's `MatrixOrder` instance.
-/

open Matrix
open scoped MatrixOrder Matrix.Norms.L2Operator

namespace StatInference
namespace Optimization

variable {n : Type*} [Fintype n]

/--
Chewi Definition A.4, Loewner order as a quadratic-form inequality.  Mathlib's
`MatrixOrder` uses `B <= A` to mean `(A - B).PosSemidef`; under the source
hypothesis that `A` and `B` are symmetric/Hermitian, this is equivalent to
`vᵀ B v <= vᵀ A v` for every vector `v`.
-/
theorem chewiA4_loewnerOrder_iff_quadraticForm_le
    {A B : Matrix n n ℝ} (hA : A.IsHermitian) (hB : B.IsHermitian) :
    B ≤ A ↔
      ∀ v : n -> ℝ, dotProduct v (B *ᵥ v) ≤ dotProduct v (A *ᵥ v) := by
  constructor
  · intro hle v
    have hpsd : (A - B).PosSemidef := Matrix.le_iff.mp hle
    have hnonneg :
        0 ≤ star v ⬝ᵥ ((A - B) *ᵥ v) :=
      hpsd.dotProduct_mulVec_nonneg v
    have hdiff :
        star v ⬝ᵥ ((A - B) *ᵥ v) =
          dotProduct v (A *ᵥ v) - dotProduct v (B *ᵥ v) := by
      simp [Matrix.sub_mulVec, dotProduct_sub]
    have hsub_nonneg :
        0 ≤ dotProduct v (A *ᵥ v) - dotProduct v (B *ᵥ v) := by
      rwa [hdiff] at hnonneg
    linarith
  · intro hquad
    rw [Matrix.le_iff]
    refine Matrix.PosSemidef.of_dotProduct_mulVec_nonneg (hA.sub hB) ?_
    intro v
    have hsub_nonneg :
        0 ≤ dotProduct v (A *ᵥ v) - dotProduct v (B *ᵥ v) := by
      exact sub_nonneg.mpr (hquad v)
    have hdiff :
        star v ⬝ᵥ ((A - B) *ᵥ v) =
          dotProduct v (A *ᵥ v) - dotProduct v (B *ᵥ v) := by
      simp [Matrix.sub_mulVec, dotProduct_sub]
    rwa [hdiff]

/--
Chewi Definition A.4, strict Loewner-order quadratic-form direction.  If
`A - B` is positive definite, every nonzero vector has strictly larger
quadratic form under `A` than under `B`.
-/
theorem chewiA4_quadraticForm_lt_of_posDef_sub
    {A B : Matrix n n ℝ} (hAB : (A - B).PosDef) :
    ∀ v : n -> ℝ, v ≠ 0 ->
      dotProduct v (B *ᵥ v) < dotProduct v (A *ᵥ v) := by
  intro v hv
  have hpos :
      0 < star v ⬝ᵥ ((A - B) *ᵥ v) :=
    hAB.dotProduct_mulVec_pos hv
  have hdiff :
      star v ⬝ᵥ ((A - B) *ᵥ v) =
        dotProduct v (A *ᵥ v) - dotProduct v (B *ᵥ v) := by
    simp [Matrix.sub_mulVec, dotProduct_sub]
  have hsub_pos :
      0 < dotProduct v (A *ᵥ v) - dotProduct v (B *ᵥ v) := by
    rwa [hdiff] at hpos
  linarith

variable {m : Type*} [Fintype m]

/--
Chewi Definition A.5 setup: the symmetric matrix `Aᵀ A` associated to a
rectangular real matrix is positive semidefinite.  This is the PSD half of the
operator-norm discussion following Definition A.5.
-/
theorem chewiA5_transpose_mul_self_posSemidef
    (A : Matrix m n ℝ) :
    (Aᵀ * A).PosSemidef := by
  simpa using Matrix.posSemidef_conjTranspose_mul_self A

/--
Chewi Definition A.5 setup: the squared norm of `A v` is the quadratic form of
`Aᵀ A` at `v`.
-/
theorem chewiA5_dotProduct_mulVec_self_eq_transpose_mul_self_quadratic
    (A : Matrix m n ℝ) (v : n -> ℝ) :
    dotProduct (A *ᵥ v) (A *ᵥ v) =
      dotProduct v ((Aᵀ * A) *ᵥ v) := by
  symm
  rw [Matrix.dotProduct_mulVec]
  rw [← Matrix.vecMul_mulVec]
  rw [← Matrix.dotProduct_mulVec]

/--
Chewi Definition A.5, Loewner form of the squared operator-norm bound.  The
matrix inequality `Aᵀ A <= C^2 I` is exactly the coordinate-vector estimate
`||A v||^2 <= C^2 ||v||^2`, written here with mathlib's finite-vector
`dotProduct`.
-/
theorem chewiA5_transpose_mul_self_le_scalar_one_iff_dotProduct_bound
    [DecidableEq n] (A : Matrix m n ℝ) (C : ℝ) :
    (Aᵀ * A) ≤ (C ^ (2 : ℕ)) • (1 : Matrix n n ℝ) ↔
      ∀ v : n -> ℝ,
        dotProduct (A *ᵥ v) (A *ᵥ v) ≤
          C ^ (2 : ℕ) * dotProduct v v := by
  have hright :
      ((C ^ (2 : ℕ)) • (1 : Matrix n n ℝ)).IsHermitian := by
    exact Matrix.isHermitian_one.smul
      (show IsSelfAdjoint (C ^ (2 : ℕ) : ℝ) by
        simp [isSelfAdjoint_iff])
  have hleft : (Aᵀ * A).IsHermitian :=
    (chewiA5_transpose_mul_self_posSemidef A).isHermitian
  rw [chewiA4_loewnerOrder_iff_quadraticForm_le hright hleft]
  constructor
  · intro h v
    have hv := h v
    have hquad :
        dotProduct v ((Aᵀ * A) *ᵥ v) =
          dotProduct (A *ᵥ v) (A *ᵥ v) :=
      (chewiA5_dotProduct_mulVec_self_eq_transpose_mul_self_quadratic A v).symm
    have hscalar :
        dotProduct v (((C ^ (2 : ℕ)) • (1 : Matrix n n ℝ)) *ᵥ v) =
          C ^ (2 : ℕ) * dotProduct v v := by
      simp [Matrix.smul_mulVec]
    simpa [hquad, hscalar] using hv
  · intro h v
    have hv := h v
    have hquad :
        dotProduct (A *ᵥ v) (A *ᵥ v) =
          dotProduct v ((Aᵀ * A) *ᵥ v) :=
      chewiA5_dotProduct_mulVec_self_eq_transpose_mul_self_quadratic A v
    have hscalar :
        C ^ (2 : ℕ) * dotProduct v v =
          dotProduct v (((C ^ (2 : ℕ)) • (1 : Matrix n n ℝ)) *ᵥ v) := by
      simp [Matrix.smul_mulVec]
    simpa [hquad, hscalar] using hv

/--
Chewi Definition A.5, unit-vector form.  From `Aᵀ A <= C^2 I`, every unit
coordinate vector satisfies `||A v||^2 <= C^2`, written in dot-product form.
-/
theorem chewiA5_unit_dotProduct_mulVec_self_le_of_transpose_mul_self_le_scalar_one
    [DecidableEq n] {A : Matrix m n ℝ} {C : ℝ}
    (hA : (Aᵀ * A) ≤ (C ^ (2 : ℕ)) • (1 : Matrix n n ℝ)) :
    ∀ v : n -> ℝ, dotProduct v v = 1 ->
      dotProduct (A *ᵥ v) (A *ᵥ v) ≤ C ^ (2 : ℕ) := by
  intro v hv
  have hbound :=
    (chewiA5_transpose_mul_self_le_scalar_one_iff_dotProduct_bound A C).mp hA v
  simpa [hv] using hbound

/--
Chewi Definition A.5, operator-norm upper bound from the Loewner bound on
`Aᵀ A`.  Mathlib's `Matrix.Norms.L2Operator` norm is the Euclidean operator
norm, so this is the source implication `Aᵀ A <= C^2 I -> ||A||_op <= C`.
-/
theorem chewiA5_l2_opNorm_le_of_transpose_mul_self_le_scalar_one
    [DecidableEq n] {A : Matrix m n ℝ} {C : ℝ}
    (hC : 0 ≤ C)
    (hA : (Aᵀ * A) ≤ (C ^ (2 : ℕ)) • (1 : Matrix n n ℝ)) :
    ‖A‖ ≤ C := by
  rw [Matrix.l2_opNorm_def]
  let T : EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ m :=
    (Matrix.toEuclideanLin (𝕜 := ℝ) (m := m) (n := n)).trans
      LinearMap.toContinuousLinearMap A
  change ‖T‖ ≤ C
  refine T.opNorm_le_bound hC ?_
  intro x
  have hbound :=
    (chewiA5_transpose_mul_self_le_scalar_one_iff_dotProduct_bound A C).mp hA x.ofLp
  have hTx_sq :
      ‖T x‖ ^ (2 : ℕ) = dotProduct (A *ᵥ x.ofLp) (A *ᵥ x.ofLp) := by
    rw [EuclideanSpace.real_norm_sq_eq]
    simp [T, Matrix.toLpLin_apply, dotProduct, pow_two]
  have hx_sq : ‖x‖ ^ (2 : ℕ) = dotProduct x.ofLp x.ofLp := by
    rw [EuclideanSpace.real_norm_sq_eq]
    simp [dotProduct, pow_two]
  have hsq :
      ‖T x‖ ^ (2 : ℕ) ≤ (C * ‖x‖) ^ (2 : ℕ) := by
    calc
      ‖T x‖ ^ (2 : ℕ)
          = dotProduct (A *ᵥ x.ofLp) (A *ᵥ x.ofLp) := hTx_sq
      _ ≤ C ^ (2 : ℕ) * dotProduct x.ofLp x.ofLp := hbound
      _ = (C * ‖x‖) ^ (2 : ℕ) := by
          rw [← hx_sq]
          ring
  exact (sq_le_sq₀ (norm_nonneg _) (mul_nonneg hC (norm_nonneg _))).mp hsq

/--
Chewi Definition A.5, full Loewner/operator-norm bridge for rectangular
matrices.  For `C >= 0`, the Euclidean operator-norm bound `||A||_op <= C` is
equivalent to the Loewner bound `Aᵀ A <= C^2 I`.
-/
theorem chewiA5_transpose_mul_self_le_scalar_one_iff_l2_opNorm_le
    [DecidableEq n] {A : Matrix m n ℝ} {C : ℝ} (hC : 0 ≤ C) :
    (Aᵀ * A) ≤ (C ^ (2 : ℕ)) • (1 : Matrix n n ℝ) ↔ ‖A‖ ≤ C := by
  constructor
  · intro hA
    exact chewiA5_l2_opNorm_le_of_transpose_mul_self_le_scalar_one hC hA
  · intro hnorm
    rw [chewiA5_transpose_mul_self_le_scalar_one_iff_dotProduct_bound A C]
    intro v
    let T : EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ m :=
      (Matrix.toEuclideanLin (𝕜 := ℝ) (m := m) (n := n)).trans
        LinearMap.toContinuousLinearMap A
    let x : EuclideanSpace ℝ n := WithLp.toLp 2 v
    have hnorm_T : ‖T‖ ≤ C := by
      simpa [Matrix.l2_opNorm_def, T] using hnorm
    have hpoint : ‖T x‖ ≤ C * ‖x‖ := by
      calc
        ‖T x‖ ≤ ‖T‖ * ‖x‖ := T.le_opNorm x
        _ ≤ C * ‖x‖ := mul_le_mul_of_nonneg_right hnorm_T (norm_nonneg x)
    have hsq :
        ‖T x‖ ^ (2 : ℕ) ≤ (C * ‖x‖) ^ (2 : ℕ) :=
      sq_le_sq₀ (norm_nonneg _) (mul_nonneg hC (norm_nonneg _)) |>.mpr hpoint
    have hTx_sq :
        ‖T x‖ ^ (2 : ℕ) = dotProduct (A *ᵥ v) (A *ᵥ v) := by
      rw [EuclideanSpace.real_norm_sq_eq]
      simp [T, x, Matrix.toLpLin_apply, dotProduct, pow_two]
    have hx_sq : ‖x‖ ^ (2 : ℕ) = dotProduct v v := by
      rw [EuclideanSpace.real_norm_sq_eq]
      simp [x, dotProduct, pow_two]
    calc
      dotProduct (A *ᵥ v) (A *ᵥ v)
          = ‖T x‖ ^ (2 : ℕ) := hTx_sq.symm
      _ ≤ (C * ‖x‖) ^ (2 : ℕ) := hsq
      _ = C ^ (2 : ℕ) * dotProduct v v := by
          rw [← hx_sq]
          ring

/--
For symmetric real matrices, an absolute quadratic-form bound controls the
Euclidean operator norm.  This is the Rayleigh-quotient bridge used in the
symmetric specialization of Chewi Definition A.5.
-/
theorem chewiA5_l2_opNorm_le_of_abs_quadraticForm_bound
    [DecidableEq n] {A : Matrix n n ℝ} (hA : A.IsHermitian) {C : ℝ}
    (hC : 0 ≤ C)
    (hbound : ∀ v : n -> ℝ,
      |dotProduct v (A *ᵥ v)| ≤ C * dotProduct v v) :
    ‖A‖ ≤ C := by
  rw [Matrix.l2_opNorm_def]
  let T : EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n :=
    (Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
      LinearMap.toContinuousLinearMap A
  change ‖T‖ ≤ C
  have hsymm : (T : EuclideanSpace ℝ n →ₗ[ℝ] EuclideanSpace ℝ n).IsSymmetric := by
    have hsymm_lin : (Matrix.toEuclideanLin A).IsSymmetric :=
      Matrix.isSymmetric_toEuclideanLin_iff.mpr hA
    simpa [T] using hsymm_lin
  rw [ContinuousLinearMap.norm_eq_iSup_rayleighQuotient T hsymm]
  refine ciSup_le ?_
  intro x
  by_cases hx_zero : ‖x‖ = 0
  · have hx0 : x = 0 := norm_eq_zero.mp hx_zero
    simpa [ContinuousLinearMap.rayleighQuotient, hx0] using hC
  · have hden_pos : 0 < ‖x‖ ^ (2 : ℕ) := by positivity
    have hinner :
        inner ℝ (T x) x = dotProduct x.ofLp (A *ᵥ x.ofLp) := by
      simp [T, Matrix.toLpLin_apply, EuclideanSpace.inner_eq_star_dotProduct]
    have hx_sq : ‖x‖ ^ (2 : ℕ) = dotProduct x.ofLp x.ofLp := by
      rw [EuclideanSpace.real_norm_sq_eq]
      simp [dotProduct, pow_two]
    have hquad :
        |inner ℝ (T x) x| ≤ C * ‖x‖ ^ (2 : ℕ) := by
      simpa [hinner, hx_sq] using hbound x.ofLp
    have hdiv : |inner ℝ (T x) x| / ‖x‖ ^ (2 : ℕ) ≤ C := by
      rw [div_le_iff₀ hden_pos]
      exact hquad
    simpa [ContinuousLinearMap.rayleighQuotient,
      ContinuousLinearMap.reApplyInnerSelf_apply, abs_div] using hdiv

/--
Chewi Definition A.5, symmetric-matrix form.  For a symmetric real matrix and
`C >= 0`, the Euclidean operator-norm bound is equivalent to the Loewner
sandwich `-C I <= A <= C I`.
-/
theorem chewiA5_symmetric_l2_opNorm_le_iff_neg_scalar_one_le_and_le_scalar_one
    [DecidableEq n] {A : Matrix n n ℝ} (hA : A.IsHermitian) {C : ℝ}
    (hC : 0 ≤ C) :
    ‖A‖ ≤ C ↔
      ((-C) • (1 : Matrix n n ℝ) ≤ A ∧
        A ≤ C • (1 : Matrix n n ℝ)) := by
  have hCmat : (C • (1 : Matrix n n ℝ)).IsHermitian := by
    exact Matrix.isHermitian_one.smul
      (show IsSelfAdjoint (C : ℝ) by
        simp [isSelfAdjoint_iff])
  have hnegCmat : ((-C) • (1 : Matrix n n ℝ)).IsHermitian := by
    exact Matrix.isHermitian_one.smul
      (show IsSelfAdjoint (-C : ℝ) by
        simp [isSelfAdjoint_iff])
  constructor
  · intro hnorm
    let T : EuclideanSpace ℝ n →L[ℝ] EuclideanSpace ℝ n :=
      (Matrix.toEuclideanLin (𝕜 := ℝ) (m := n) (n := n)).trans
        LinearMap.toContinuousLinearMap A
    have hnorm_T : ‖T‖ ≤ C := by
      simpa [Matrix.l2_opNorm_def, T] using hnorm
    have hquad_abs :
        ∀ v : n -> ℝ, |dotProduct v (A *ᵥ v)| ≤ C * dotProduct v v := by
      intro v
      let x : EuclideanSpace ℝ n := WithLp.toLp 2 v
      have hpoint : ‖T x‖ ≤ C * ‖x‖ := by
        calc
          ‖T x‖ ≤ ‖T‖ * ‖x‖ := T.le_opNorm x
          _ ≤ C * ‖x‖ := mul_le_mul_of_nonneg_right hnorm_T (norm_nonneg x)
      have hinner_bound :
          |inner ℝ (T x) x| ≤ C * ‖x‖ ^ (2 : ℕ) := by
        calc
          |inner ℝ (T x) x| ≤ ‖T x‖ * ‖x‖ := abs_real_inner_le_norm (T x) x
          _ ≤ (C * ‖x‖) * ‖x‖ :=
              mul_le_mul_of_nonneg_right hpoint (norm_nonneg x)
          _ = C * ‖x‖ ^ (2 : ℕ) := by ring
      have hinner :
          inner ℝ (T x) x = dotProduct v (A *ᵥ v) := by
        simp [T, x, Matrix.toLpLin_apply, EuclideanSpace.inner_eq_star_dotProduct]
      have hx_sq : ‖x‖ ^ (2 : ℕ) = dotProduct v v := by
        rw [EuclideanSpace.real_norm_sq_eq]
        simp [x, dotProduct, pow_two]
      simpa [hinner, hx_sq] using hinner_bound
    constructor
    · rw [chewiA4_loewnerOrder_iff_quadraticForm_le hA hnegCmat]
      intro v
      have hscalar :
          dotProduct v (((-C) • (1 : Matrix n n ℝ)) *ᵥ v) =
            -(C * dotProduct v v) := by
        calc
          dotProduct v (((-C) • (1 : Matrix n n ℝ)) *ᵥ v)
              = (-C) * dotProduct v v := by
                simp only [Matrix.smul_mulVec, Matrix.one_mulVec, dotProduct_smul,
                  smul_eq_mul]
          _ = -(C * dotProduct v v) := by ring
      have hlow := (abs_le.mp (hquad_abs v)).1
      have hlow' :
          dotProduct v (((-C) • (1 : Matrix n n ℝ)) *ᵥ v) ≤
            dotProduct v (A *ᵥ v) := by
        rw [hscalar]
        exact hlow
      simpa only [neg_smul] using hlow'
    · rw [chewiA4_loewnerOrder_iff_quadraticForm_le hCmat hA]
      intro v
      have hscalar :
          dotProduct v ((C • (1 : Matrix n n ℝ)) *ᵥ v) =
            C * dotProduct v v := by
        simp only [Matrix.smul_mulVec, Matrix.one_mulVec, dotProduct_smul,
          smul_eq_mul]
      have hupper := (abs_le.mp (hquad_abs v)).2
      simpa [hscalar] using hupper
  · intro hsandwich
    refine chewiA5_l2_opNorm_le_of_abs_quadraticForm_bound hA hC ?_
    intro v
    have hupper_raw :=
      (chewiA4_loewnerOrder_iff_quadraticForm_le hCmat hA).mp
        hsandwich.2 v
    have hupper :
        dotProduct v (A *ᵥ v) ≤ C * dotProduct v v := by
      have hscalar :
          dotProduct v ((C • (1 : Matrix n n ℝ)) *ᵥ v) =
            C * dotProduct v v := by
        simp only [Matrix.smul_mulVec, Matrix.one_mulVec, dotProduct_smul,
          smul_eq_mul]
      simpa [hscalar] using hupper_raw
    have hlower_raw :=
      (chewiA4_loewnerOrder_iff_quadraticForm_le hA hnegCmat).mp
        hsandwich.1 v
    have hlower :
        -(C * dotProduct v v) ≤ dotProduct v (A *ᵥ v) := by
      have hscalar :
          dotProduct v (((-C) • (1 : Matrix n n ℝ)) *ᵥ v) =
            -(C * dotProduct v v) := by
        calc
          dotProduct v (((-C) • (1 : Matrix n n ℝ)) *ᵥ v)
              = (-C) * dotProduct v v := by
                simp only [Matrix.smul_mulVec, Matrix.one_mulVec, dotProduct_smul,
                  smul_eq_mul]
          _ = -(C * dotProduct v v) := by ring
      have hlower' :
          dotProduct v (((-C) • (1 : Matrix n n ℝ)) *ᵥ v) ≤
            dotProduct v (A *ᵥ v) := by
        simpa only [neg_smul] using hlower_raw
      rw [← hscalar]
      exact hlower'
    exact abs_le.mpr ⟨hlower, hupper⟩

end Optimization
end StatInference
