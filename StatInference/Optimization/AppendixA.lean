import Mathlib.Analysis.Matrix.Order
import StatInference.Optimization.Basic

/-!
# Chewi Optimization 2026, Appendix A Matrix Order

This module records source-facing wrappers for the matrix background in
Appendix A of Chewi's optimization notes.  The first layer packages Definition
A.4's Loewner/PSD order display using mathlib's `MatrixOrder` instance.
-/

open Matrix
open scoped MatrixOrder

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

end Optimization
end StatInference
