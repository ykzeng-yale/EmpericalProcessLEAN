import StatInference.Optimization.MirrorDescent

/-!
# Chewi Chapter 11 alternating Bregman projections

This module starts the Chapter 11 alternating-projection lane.  The first
packet proves the finite, source-shaped content behind Lemma 11.2: a
Pythagorean Bregman projection certificate gives a one-cycle decrease, which
telescopes over alternating Bregman projections.
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Finite real-valued KL display used for the Sinkhorn marginal identities. -/
noncomputable def finiteKL {ι : Type*} [Fintype ι] (p q : ι -> ℝ) : ℝ :=
  ∑ i, p i * Real.log (p i / q i)

/-- Finite coupling KL display for arrays indexed by `X × Y`. -/
noncomputable def finiteCouplingKL {X Y : Type*} [Fintype X] [Fintype Y]
    (γ η : X -> Y -> ℝ) : ℝ :=
  ∑ x, ∑ y, γ x y * Real.log (γ x y / η x y)

/-- Total mass of a finite coupling array. -/
noncomputable def finiteCouplingMass {X Y : Type*} [Fintype X] [Fintype Y]
    (γ : X -> Y -> ℝ) : ℝ :=
  ∑ x, ∑ y, γ x y

/--
Entropic mirror map on finite couplings, written in the Chewi/Sinkhorn
normalization `sum gamma * log gamma - gamma`.
-/
noncomputable def finiteCouplingEntropy {X Y : Type*} [Fintype X] [Fintype Y]
    (γ : X -> Y -> ℝ) : ℝ :=
  ∑ x, ∑ y, (γ x y * Real.log (γ x y) - γ x y)

/-- The formal gradient of `finiteCouplingEntropy` on the positive orthant. -/
noncomputable def finiteCouplingLogGradient {X Y : Type*}
    (γ : X -> Y -> ℝ) : X -> Y -> ℝ :=
  fun x y => Real.log (γ x y)

/--
Scalar Bregman display for the finite entropic mirror map, written directly on
curried arrays.  A later EuclideanSpace wrapper can transport this to the
generic `bregmanDivergence` interface when needed.
-/
noncomputable def finiteCouplingEntropyBregman {X Y : Type*}
    [Fintype X] [Fintype Y] (γ η : X -> Y -> ℝ) : ℝ :=
  finiteCouplingEntropy γ - finiteCouplingEntropy η -
    ∑ x, ∑ y, Real.log (η x y) * (γ x y - η x y)

/-- Row marginal of a finite coupling array. -/
noncomputable def rowMarginal {X Y : Type*} [Fintype Y]
    (γ : X -> Y -> ℝ) (x : X) : ℝ :=
  ∑ y, γ x y

/-- Column marginal of a finite coupling array. -/
noncomputable def columnMarginal {X Y : Type*} [Fintype X]
    (γ : X -> Y -> ℝ) (y : Y) : ℝ :=
  ∑ x, γ x y

/-- Row normalization of a finite coupling array toward a target row law `μ`. -/
noncomputable def rowNormalizedCoupling {X Y : Type*} [Fintype Y]
    (μ : X -> ℝ) (γ : X -> Y -> ℝ) : X -> Y -> ℝ :=
  fun x y => μ x * γ x y / rowMarginal γ x

/-- Column normalization of a finite coupling array toward a target column law `ν`. -/
noncomputable def columnNormalizedCoupling {X Y : Type*} [Fintype X]
    (ν : Y -> ℝ) (γ : X -> Y -> ℝ) : X -> Y -> ℝ :=
  fun x y => γ x y * ν y / columnMarginal γ y

theorem rowMarginal_rowNormalizedCoupling
    {X Y : Type*} [Fintype Y]
    (μ : X -> ℝ) (γ : X -> Y -> ℝ)
    (hrow_ne : ∀ x, rowMarginal γ x ≠ 0) (x : X) :
    rowMarginal (rowNormalizedCoupling μ γ) x = μ x := by
  classical
  unfold rowMarginal rowNormalizedCoupling
  calc
    (∑ y, μ x * γ x y / ∑ y, γ x y)
        = ∑ y, (μ x / (∑ y, γ x y)) * γ x y := by
          refine Finset.sum_congr rfl ?_
          intro y _hy
          ring
    _ = (μ x / (∑ y, γ x y)) * ∑ y, γ x y := by
          exact (Finset.mul_sum (s := Finset.univ)
            (a := μ x / (∑ y, γ x y)) (f := fun y => γ x y)).symm
    _ = μ x := by
          have hsum_ne : (∑ y, γ x y) ≠ 0 := by
            simpa [rowMarginal] using hrow_ne x
          field_simp [hsum_ne]

theorem columnMarginal_columnNormalizedCoupling
    {X Y : Type*} [Fintype X]
    (ν : Y -> ℝ) (γ : X -> Y -> ℝ)
    (hcol_ne : ∀ y, columnMarginal γ y ≠ 0) (y : Y) :
    columnMarginal (columnNormalizedCoupling ν γ) y = ν y := by
  classical
  unfold columnMarginal columnNormalizedCoupling
  calc
    (∑ x, γ x y * ν y / ∑ x, γ x y)
        = ∑ x, (ν y / (∑ x, γ x y)) * γ x y := by
          refine Finset.sum_congr rfl ?_
          intro x _hx
          ring
    _ = (ν y / (∑ x, γ x y)) * ∑ x, γ x y := by
          exact (Finset.mul_sum (s := Finset.univ)
            (a := ν y / (∑ x, γ x y)) (f := fun x => γ x y)).symm
    _ = ν y := by
          have hsum_ne : (∑ x, γ x y) ≠ 0 := by
            simpa [columnMarginal] using hcol_ne y
          field_simp [hsum_ne]

theorem finiteCouplingMass_rowNormalizedCoupling
    {X Y : Type*} [Fintype X] [Fintype Y]
    (μ : X -> ℝ) (γ : X -> Y -> ℝ)
    (hrow_ne : ∀ x, rowMarginal γ x ≠ 0) :
    finiteCouplingMass (rowNormalizedCoupling μ γ) = ∑ x, μ x := by
  classical
  unfold finiteCouplingMass
  refine Finset.sum_congr rfl ?_
  intro x _hx
  simpa [rowMarginal] using rowMarginal_rowNormalizedCoupling μ γ hrow_ne x

theorem finiteCouplingMass_columnNormalizedCoupling
    {X Y : Type*} [Fintype X] [Fintype Y]
    (ν : Y -> ℝ) (γ : X -> Y -> ℝ)
    (hcol_ne : ∀ y, columnMarginal γ y ≠ 0) :
    finiteCouplingMass (columnNormalizedCoupling ν γ) = ∑ y, ν y := by
  classical
  unfold finiteCouplingMass
  rw [Finset.sum_comm]
  refine Finset.sum_congr rfl ?_
  intro y _hy
  simpa [columnMarginal] using columnMarginal_columnNormalizedCoupling ν γ hcol_ne y

theorem rowNormalizedCoupling_ne_of_ne
    {X Y : Type*} [Fintype Y]
    (μ : X -> ℝ) (γ : X -> Y -> ℝ)
    (hμ_ne : ∀ x, μ x ≠ 0)
    (hγ_ne : ∀ x y, γ x y ≠ 0)
    (hrow_ne : ∀ x, rowMarginal γ x ≠ 0) :
    ∀ x y, rowNormalizedCoupling μ γ x y ≠ 0 := by
  intro x y
  unfold rowNormalizedCoupling
  exact div_ne_zero (mul_ne_zero (hμ_ne x) (hγ_ne x y)) (hrow_ne x)

theorem columnNormalizedCoupling_ne_of_ne
    {X Y : Type*} [Fintype X]
    (ν : Y -> ℝ) (γ : X -> Y -> ℝ)
    (hν_ne : ∀ y, ν y ≠ 0)
    (hγ_ne : ∀ x y, γ x y ≠ 0)
    (hcol_ne : ∀ y, columnMarginal γ y ≠ 0) :
    ∀ x y, columnNormalizedCoupling ν γ x y ≠ 0 := by
  intro x y
  unfold columnNormalizedCoupling
  exact div_ne_zero (mul_ne_zero (hγ_ne x y) (hν_ne y)) (hcol_ne y)

/--
Finite Sinkhorn row-normalization KL identity, in the algebraic form needed by
Theorem 11.7: if a half-step has row marginal `μ` and pointwise likelihood
ratio `μ x / row x`, then its coupling KL against the previous coupling is
exactly the marginal KL `KL(μ || row)`.
-/
theorem finiteCouplingKL_eq_finiteKL_of_row_ratio
    {X Y : Type*} [Fintype X] [Fintype Y]
    (γ η : X -> Y -> ℝ) (μ row : X -> ℝ)
    (hrow : ∀ x, ∑ y, γ x y = μ x)
    (hratio : ∀ x y, γ x y / η x y = μ x / row x) :
    finiteCouplingKL γ η = finiteKL μ row := by
  classical
  unfold finiteCouplingKL finiteKL
  calc
    (∑ x, ∑ y, γ x y * Real.log (γ x y / η x y))
        = ∑ x, ∑ y, γ x y * Real.log (μ x / row x) := by
          refine Finset.sum_congr rfl ?_
          intro x _hx
          refine Finset.sum_congr rfl ?_
          intro y _hy
          rw [hratio x y]
    _ = ∑ x, (∑ y, γ x y) * Real.log (μ x / row x) := by
          refine Finset.sum_congr rfl ?_
          intro x _hx
          exact (Finset.sum_mul (s := Finset.univ)
            (f := fun y => γ x y) (a := Real.log (μ x / row x))).symm
    _ = ∑ x, μ x * Real.log (μ x / row x) := by
          refine Finset.sum_congr rfl ?_
          intro x _hx
          rw [hrow x]

/--
Finite Sinkhorn column-normalization KL identity, in the algebraic form needed
by Theorem 11.7: if a half-step has column marginal `ν` and pointwise
likelihood ratio `ν y / col y`, then its coupling KL against the previous
coupling is exactly the marginal KL `KL(ν || col)`.
-/
theorem finiteCouplingKL_eq_finiteKL_of_column_ratio
    {X Y : Type*} [Fintype X] [Fintype Y]
    (γ η : X -> Y -> ℝ) (ν col : Y -> ℝ)
    (hcol : ∀ y, ∑ x, γ x y = ν y)
    (hratio : ∀ x y, γ x y / η x y = ν y / col y) :
    finiteCouplingKL γ η = finiteKL ν col := by
  classical
  unfold finiteCouplingKL finiteKL
  calc
    (∑ x, ∑ y, γ x y * Real.log (γ x y / η x y))
        = ∑ x, ∑ y, γ x y * Real.log (ν y / col y) := by
          refine Finset.sum_congr rfl ?_
          intro x _hx
          refine Finset.sum_congr rfl ?_
          intro y _hy
          rw [hratio x y]
    _ = ∑ y, ∑ x, γ x y * Real.log (ν y / col y) := by
          rw [Finset.sum_comm]
    _ = ∑ y, (∑ x, γ x y) * Real.log (ν y / col y) := by
          refine Finset.sum_congr rfl ?_
          intro y _hy
          exact (Finset.sum_mul (s := Finset.univ)
            (f := fun x => γ x y) (a := Real.log (ν y / col y))).symm
    _ = ∑ y, ν y * Real.log (ν y / col y) := by
          refine Finset.sum_congr rfl ?_
          intro y _hy
          rw [hcol y]

/--
For finite couplings with equal total mass, the scalar Bregman display of the
entropic mirror map is the finite coupling KL display.  This is the algebraic
bridge used to identify Sinkhorn's row/column Bregman movements with marginal
KL terms.
-/
theorem finiteCouplingEntropyBregman_eq_finiteCouplingKL
    {X Y : Type*} [Fintype X] [Fintype Y]
    (γ η : X -> Y -> ℝ)
    (hγ_ne : ∀ x y, γ x y ≠ 0)
    (hη_ne : ∀ x y, η x y ≠ 0)
    (hmass : finiteCouplingMass γ = finiteCouplingMass η) :
    finiteCouplingEntropyBregman γ η = finiteCouplingKL γ η := by
  classical
  have hmass' : (∑ x, ∑ y, γ x y) = ∑ x, ∑ y, η x y := by
    simpa [finiteCouplingMass] using hmass
  unfold finiteCouplingEntropyBregman finiteCouplingEntropy finiteCouplingKL
  simp_rw [Real.log_div (hγ_ne _ _) (hη_ne _ _)]
  simp [Finset.sum_sub_distrib, sub_mul, mul_sub, hmass', mul_comm]

/--
Concrete finite Sinkhorn row-normalization KL identity.  Under nonzero support
and row denominators, normalizing rows toward `μ` makes the coupling KL against
the previous array exactly the row-marginal KL.
-/
theorem finiteCouplingKL_rowNormalizedCoupling_eq_finiteKL
    {X Y : Type*} [Fintype X] [Fintype Y]
    (μ : X -> ℝ) (γ : X -> Y -> ℝ)
    (hrow_ne : ∀ x, rowMarginal γ x ≠ 0)
    (hγ_ne : ∀ x y, γ x y ≠ 0) :
    finiteCouplingKL (rowNormalizedCoupling μ γ) γ =
      finiteKL μ (rowMarginal γ) := by
  classical
  refine finiteCouplingKL_eq_finiteKL_of_row_ratio
    (γ := rowNormalizedCoupling μ γ) (η := γ)
    (μ := μ) (row := rowMarginal γ) ?_ ?_
  · intro x
    exact rowMarginal_rowNormalizedCoupling μ γ hrow_ne x
  · intro x y
    unfold rowNormalizedCoupling
    field_simp [hrow_ne x, hγ_ne x y]

/--
Concrete finite Sinkhorn column-normalization KL identity.  Under nonzero
support and column denominators, normalizing columns toward `ν` makes the
coupling KL against the previous array exactly the column-marginal KL.
-/
theorem finiteCouplingKL_columnNormalizedCoupling_eq_finiteKL
    {X Y : Type*} [Fintype X] [Fintype Y]
    (ν : Y -> ℝ) (γ : X -> Y -> ℝ)
    (hcol_ne : ∀ y, columnMarginal γ y ≠ 0)
    (hγ_ne : ∀ x y, γ x y ≠ 0) :
    finiteCouplingKL (columnNormalizedCoupling ν γ) γ =
      finiteKL ν (columnMarginal γ) := by
  classical
  refine finiteCouplingKL_eq_finiteKL_of_column_ratio
    (γ := columnNormalizedCoupling ν γ) (η := γ)
    (ν := ν) (col := columnMarginal γ) ?_ ?_
  · intro y
    exact columnMarginal_columnNormalizedCoupling ν γ hcol_ne y
  · intro x y
    unfold columnNormalizedCoupling
    field_simp [hcol_ne y, hγ_ne x y]

/--
Row-normalization version of the entropic Bregman/KL identity.  If the target
row law has the same total mass as the current coupling, then the entropic
Bregman movement from the previous coupling to its row normalization is exactly
the row marginal KL.
-/
theorem finiteCouplingEntropyBregman_rowNormalizedCoupling_eq_finiteKL
    {X Y : Type*} [Fintype X] [Fintype Y]
    (μ : X -> ℝ) (γ : X -> Y -> ℝ)
    (hμ_ne : ∀ x, μ x ≠ 0)
    (hγ_ne : ∀ x y, γ x y ≠ 0)
    (hrow_ne : ∀ x, rowMarginal γ x ≠ 0)
    (hmass : (∑ x, μ x) = finiteCouplingMass γ) :
    finiteCouplingEntropyBregman (rowNormalizedCoupling μ γ) γ =
      finiteKL μ (rowMarginal γ) := by
  calc
    finiteCouplingEntropyBregman (rowNormalizedCoupling μ γ) γ =
        finiteCouplingKL (rowNormalizedCoupling μ γ) γ := by
          exact finiteCouplingEntropyBregman_eq_finiteCouplingKL
            (rowNormalizedCoupling μ γ) γ
            (rowNormalizedCoupling_ne_of_ne μ γ hμ_ne hγ_ne hrow_ne)
            hγ_ne
            (by
              rw [finiteCouplingMass_rowNormalizedCoupling μ γ hrow_ne, hmass])
    _ = finiteKL μ (rowMarginal γ) :=
          finiteCouplingKL_rowNormalizedCoupling_eq_finiteKL μ γ hrow_ne hγ_ne

/--
Column-normalization version of the entropic Bregman/KL identity.  If the
target column law has the same total mass as the current coupling, then the
entropic Bregman movement from the previous coupling to its column
normalization is exactly the column marginal KL.
-/
theorem finiteCouplingEntropyBregman_columnNormalizedCoupling_eq_finiteKL
    {X Y : Type*} [Fintype X] [Fintype Y]
    (ν : Y -> ℝ) (γ : X -> Y -> ℝ)
    (hν_ne : ∀ y, ν y ≠ 0)
    (hγ_ne : ∀ x y, γ x y ≠ 0)
    (hcol_ne : ∀ y, columnMarginal γ y ≠ 0)
    (hmass : (∑ y, ν y) = finiteCouplingMass γ) :
    finiteCouplingEntropyBregman (columnNormalizedCoupling ν γ) γ =
      finiteKL ν (columnMarginal γ) := by
  calc
    finiteCouplingEntropyBregman (columnNormalizedCoupling ν γ) γ =
        finiteCouplingKL (columnNormalizedCoupling ν γ) γ := by
          exact finiteCouplingEntropyBregman_eq_finiteCouplingKL
            (columnNormalizedCoupling ν γ) γ
            (columnNormalizedCoupling_ne_of_ne ν γ hν_ne hγ_ne hcol_ne)
            hγ_ne
            (by
              rw [finiteCouplingMass_columnNormalizedCoupling ν γ hcol_ne, hmass])
    _ = finiteKL ν (columnMarginal γ) :=
          finiteCouplingKL_columnNormalizedCoupling_eq_finiteKL ν γ hcol_ne hγ_ne

/--
Source-shaped Bregman projection certificate.

The `pythagorean` field is Exercise 10.1 in the orientation used in Chewi
Lemma 11.2:
`D_phi(z, base) >= D_phi(z, proj) + D_phi(proj, base)`.
-/
structure IsBregmanProjectionStep
    (C : Set E) (phi : E -> ℝ) (gradPhi : E -> E)
    (base proj : E) : Prop where
  mem : proj ∈ C
  divergence_nonneg : 0 ≤ bregmanDivergence phi gradPhi proj base
  pythagorean : ∀ ⦃z : E⦄, z ∈ C ->
    bregmanDivergence phi gradPhi z proj +
        bregmanDivergence phi gradPhi proj base ≤
      bregmanDivergence phi gradPhi z base

/--
ABP trajectory:
`x_{n+1}` is the Bregman projection of `y_n` onto `C₁`, and `y_{n+1}` is the
Bregman projection of `x_{n+1}` onto `C₂`.
-/
structure IsAlternatingBregmanProjectionTrajectory
    (C₁ C₂ : Set E) (phi : E -> ℝ) (gradPhi : E -> E)
    (x y : ℕ -> E) : Prop where
  x_step : ∀ n, IsBregmanProjectionStep C₁ phi gradPhi (y n) (x (n + 1))
  y_step : ∀ n, IsBregmanProjectionStep C₂ phi gradPhi (x (n + 1)) (y (n + 1))

theorem IsAlternatingBregmanProjectionTrajectory.x_mem_succ
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (n : ℕ) :
    x (n + 1) ∈ C₁ :=
  (htraj.x_step n).mem

theorem IsAlternatingBregmanProjectionTrajectory.y_mem_succ
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (n : ℕ) :
    y (n + 1) ∈ C₂ :=
  (htraj.y_step n).mem

/--
First half of the monotonicity chain in Lemma 11.2:
`D_phi(x_*, x_{n+1}) <= D_phi(x_*, y_n)`.
-/
theorem alternatingBregmanProjection_star_x_le_star_y
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) :
    bregmanDivergence phi gradPhi xStar (x (n + 1)) ≤
      bregmanDivergence phi gradPhi xStar (y n) := by
  have hpyth := (htraj.x_step n).pythagorean hxStar₁
  have hnonneg := (htraj.x_step n).divergence_nonneg
  nlinarith

/--
Second half of the monotonicity chain in Lemma 11.2:
`D_phi(x_*, y_{n+1}) <= D_phi(x_*, x_{n+1})`.
-/
theorem alternatingBregmanProjection_star_y_succ_le_star_x
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y (n + 1)) ≤
      bregmanDivergence phi gradPhi xStar (x (n + 1)) := by
  have hpyth := (htraj.y_step n).pythagorean hxStar₂
  have hnonneg := (htraj.y_step n).divergence_nonneg
  nlinarith

/-- The two monotonicity halves imply `D_phi(x_*, y_{n+1}) <= D_phi(x_*, y_n)`. -/
theorem alternatingBregmanProjection_star_y_succ_le_star_y
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y (n + 1)) ≤
      bregmanDivergence phi gradPhi xStar (y n) :=
  (alternatingBregmanProjection_star_y_succ_le_star_x n htraj hxStar₂).trans
    (alternatingBregmanProjection_star_x_le_star_y n htraj hxStar₁)

/--
One ABP cycle decrease.  This is the finite one-step inequality that
telescopes in Chewi Lemma 11.2.
-/
theorem alternatingBregmanProjection_cycle_decrease
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (n : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y (n + 1)) +
        (bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
          bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))) ≤
      bregmanDivergence phi gradPhi xStar (y n) := by
  have hx := (htraj.x_step n).pythagorean hxStar₁
  have hy := (htraj.y_step n).pythagorean hxStar₂
  nlinarith

/--
Finite Lemma 11.2 telescope with the terminal Bregman term retained.
-/
theorem chewi112_finite_sum_with_terminal_le
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (N : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂) :
    bregmanDivergence phi gradPhi xStar (y N) +
        (∑ n ∈ Finset.range N,
          (bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
            bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1)))) ≤
      bregmanDivergence phi gradPhi xStar (y 0) := by
  let D : ℕ -> ℝ := fun n => bregmanDivergence phi gradPhi xStar (y n)
  let gap : ℕ -> ℝ := fun n =>
    bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
      bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))
  have hstep : ∀ n, n < N -> gap n ≤ D n - D (n + 1) := by
    intro n _hn
    have hcycle :=
      alternatingBregmanProjection_cycle_decrease
        (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
        (x := x) (y := y) (xStar := xStar)
        n htraj hxStar₁ hxStar₂
    dsimp [D, gap] at hcycle ⊢
    nlinarith
  have hsum :
      (∑ n ∈ Finset.range N, gap n) ≤
        ∑ n ∈ Finset.range N, (D n - D (n + 1)) := by
    exact Finset.sum_le_sum fun n hn => hstep n (Finset.mem_range.mp hn)
  have hsum_bound :
      (∑ n ∈ Finset.range N, gap n) ≤ D 0 - D N := by
    calc
      (∑ n ∈ Finset.range N, gap n)
          ≤ ∑ n ∈ Finset.range N, (D n - D (n + 1)) := hsum
      _ = D 0 - D N := by
          simpa using sum_range_sub_succ D N
  dsimp [D, gap] at hsum_bound ⊢
  nlinarith

/--
Finite Lemma 11.2 in the displayed summability orientation, with the terminal
Bregman term discharged separately.
-/
theorem chewi112_finite_sum_le
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} (N : ℕ)
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N)) :
    (∑ n ∈ Finset.range N,
      (bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
        bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1)))) ≤
      bregmanDivergence phi gradPhi xStar (y 0) := by
  have hmain :=
    chewi112_finite_sum_with_terminal_le
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) N htraj hxStar₁ hxStar₂
  nlinarith

/--
Chewi display `(11.1)` in existential finite-minimum form.
-/
theorem chewi113_exists_small_abp_cycle_gap
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} {N : ℕ}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N))
    (hN : N ≠ 0) :
    ∃ n, n < N ∧
      bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
          bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1)) ≤
        bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ) := by
  let gap : ℕ -> ℝ := fun n =>
    bregmanDivergence phi gradPhi (x (n + 1)) (y n) +
      bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))
  have hsum :=
    chewi112_finite_sum_le
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) N
      htraj hxStar₁ hxStar₂ hterminal_nonneg
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  have hsum_avg :
      (∑ n ∈ Finset.range N, gap n) ≤
        (N : ℝ) * (bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ)) := by
    have hmul :
        (N : ℝ) *
            (bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ)) =
          bregmanDivergence phi gradPhi xStar (y 0) := by
      field_simp [hN_pos.ne']
    simpa [gap, hmul] using hsum
  simpa [gap] using
    exists_le_average_of_sum_le
      (a := gap) (N := N)
      (B := bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ))
      hN hsum_avg

/--
Chewi Theorem 11.7, supplied-interface Sinkhorn selector.  Lemma 11.2 gives a
cycle with small total KL movement; Pinsker lower bounds for the two Sinkhorn
half-steps then give one row-normalized and one column-normalized iterate with
small marginal error.
-/
theorem chewi117_exists_sinkhorn_marginal_errors_le_of_abp
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} {N : ℕ}
    {rowErr colErr : ℕ -> ℝ} {eps : ℝ}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N))
    (hN : N ≠ 0) (heps_nonneg : 0 ≤ eps)
    (hbudget :
      bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ) ≤
        eps ^ (2 : ℕ) / 2)
    (hrow_nonneg : ∀ n, 0 ≤ rowErr n)
    (hcol_nonneg : ∀ n, 0 ≤ colErr n)
    (hrow_pinsker : ∀ n,
      rowErr n ^ (2 : ℕ) / 2 ≤
        bregmanDivergence phi gradPhi (x (n + 1)) (y n))
    (hcol_pinsker : ∀ n,
      colErr n ^ (2 : ℕ) / 2 ≤
        bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))) :
    ∃ n, n < N ∧ rowErr n ≤ eps ∧ colErr n ≤ eps := by
  obtain ⟨n, hn, hcycle⟩ :=
    chewi113_exists_small_abp_cycle_gap
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) (N := N)
      htraj hxStar₁ hxStar₂ hterminal_nonneg hN
  have hx_nonneg := (htraj.x_step n).divergence_nonneg
  have hy_nonneg := (htraj.y_step n).divergence_nonneg
  have hrow_sq_le : rowErr n ^ (2 : ℕ) ≤ eps ^ (2 : ℕ) := by
    nlinarith [hrow_pinsker n, hy_nonneg, hcycle, hbudget]
  have hcol_sq_le : colErr n ^ (2 : ℕ) ≤ eps ^ (2 : ℕ) := by
    nlinarith [hcol_pinsker n, hx_nonneg, hcycle, hbudget]
  have hrow_le : rowErr n ≤ eps :=
    (sq_le_sq₀ (hrow_nonneg n) heps_nonneg).mp hrow_sq_le
  have hcol_le : colErr n ≤ eps :=
    (sq_le_sq₀ (hcol_nonneg n) heps_nonneg).mp hcol_sq_le
  exact ⟨n, hn, hrow_le, hcol_le⟩

/--
Chewi Theorem 11.7 selector in the source orientation that chooses the
column-correct full Sinkhorn iterate `γⁿ`.  The supplied `hcol_zero` is the
finite marginal identity saying this iterate already has the correct
`Y`-marginal; the row Pinsker lower bound controls the remaining marginal
error.
-/
theorem chewi117_exists_sinkhorn_full_iterate_error_sum_le_of_abp
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} {N : ℕ}
    {rowErr colErr : ℕ -> ℝ} {eps : ℝ}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N))
    (hN : N ≠ 0) (heps_nonneg : 0 ≤ eps)
    (hbudget :
      bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ) ≤
        eps ^ (2 : ℕ) / 2)
    (hrow_nonneg : ∀ n, 0 ≤ rowErr n)
    (hcol_zero : ∀ n, colErr n = 0)
    (hrow_pinsker : ∀ n,
      rowErr n ^ (2 : ℕ) / 2 ≤
        bregmanDivergence phi gradPhi (x (n + 1)) (y n)) :
    ∃ n, n < N ∧ rowErr n + colErr n ≤ eps := by
  obtain ⟨n, hn, hcycle⟩ :=
    chewi113_exists_small_abp_cycle_gap
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) (N := N)
      htraj hxStar₁ hxStar₂ hterminal_nonneg hN
  have hy_nonneg := (htraj.y_step n).divergence_nonneg
  have hrow_sq_le : rowErr n ^ (2 : ℕ) ≤ eps ^ (2 : ℕ) := by
    nlinarith [hrow_pinsker n, hy_nonneg, hcycle, hbudget]
  have hrow_le : rowErr n ≤ eps :=
    (sq_le_sq₀ (hrow_nonneg n) heps_nonneg).mp hrow_sq_le
  refine ⟨n, hn, ?_⟩
  rw [hcol_zero n]
  nlinarith

/--
Chewi Theorem 11.7 selector in the source orientation that chooses the
row-correct half Sinkhorn iterate `γⁿ⁺¹ᐟ²`.  The supplied `hrow_zero` is the
finite marginal identity saying this half-step already has the correct
`X`-marginal; the column Pinsker lower bound controls the remaining marginal
error.
-/
theorem chewi117_exists_sinkhorn_half_iterate_error_sum_le_of_abp
    {C₁ C₂ : Set E} {phi : E -> ℝ} {gradPhi : E -> E}
    {x y : ℕ -> E} {xStar : E} {N : ℕ}
    {rowErr colErr : ℕ -> ℝ} {eps : ℝ}
    (htraj : IsAlternatingBregmanProjectionTrajectory C₁ C₂ phi gradPhi x y)
    (hxStar₁ : xStar ∈ C₁) (hxStar₂ : xStar ∈ C₂)
    (hterminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi xStar (y N))
    (hN : N ≠ 0) (heps_nonneg : 0 ≤ eps)
    (hbudget :
      bregmanDivergence phi gradPhi xStar (y 0) / (N : ℝ) ≤
        eps ^ (2 : ℕ) / 2)
    (hrow_zero : ∀ n, rowErr n = 0)
    (hcol_nonneg : ∀ n, 0 ≤ colErr n)
    (hcol_pinsker : ∀ n,
      colErr n ^ (2 : ℕ) / 2 ≤
        bregmanDivergence phi gradPhi (y (n + 1)) (x (n + 1))) :
    ∃ n, n < N ∧ rowErr n + colErr n ≤ eps := by
  obtain ⟨n, hn, hcycle⟩ :=
    chewi113_exists_small_abp_cycle_gap
      (C₁ := C₁) (C₂ := C₂) (phi := phi) (gradPhi := gradPhi)
      (x := x) (y := y) (xStar := xStar) (N := N)
      htraj hxStar₁ hxStar₂ hterminal_nonneg hN
  have hx_nonneg := (htraj.x_step n).divergence_nonneg
  have hcol_sq_le : colErr n ^ (2 : ℕ) ≤ eps ^ (2 : ℕ) := by
    nlinarith [hcol_pinsker n, hx_nonneg, hcycle, hbudget]
  have hcol_le : colErr n ≤ eps :=
    (sq_le_sq₀ (hcol_nonneg n) heps_nonneg).mp hcol_sq_le
  refine ⟨n, hn, ?_⟩
  rw [hrow_zero n]
  nlinarith

/--
Source-shaped certificate for Chewi Theorem 11.8 after interpreting Sinkhorn
as mirror descent.  The concrete finite Sinkhorn/KL work is isolated in these
fields: the zero-error Bregman recurrence, monotonicity of the marginal KL
gaps, nonnegativity of the terminal divergence, and identification of the
initial Bregman divergence with `KL(gammaStar || gamma^0)`.
-/
structure IsChewi118SinkhornMirrorDescentCertificate
    (phi : E -> ℝ) (gradPhi : E -> E) (gamma : ℕ -> E) (gammaStar : E)
    (rowMarginalKL : ℕ -> ℝ) (initialCouplingKL : ℝ) (N : ℕ) : Prop where
  terminal_nonneg : 0 ≤ bregmanDivergence phi gradPhi gammaStar (gamma N)
  one_step : ∀ n, n < N ->
    bregmanDivergence phi gradPhi gammaStar (gamma (n + 1)) ≤
      bregmanDivergence phi gradPhi gammaStar (gamma n) -
        rowMarginalKL (n + 1)
  monotone_to_last : ∀ n, n < N ->
    rowMarginalKL N ≤ rowMarginalKL (n + 1)
  initial_eq : bregmanDivergence phi gradPhi gammaStar (gamma 0) =
    initialCouplingKL

/--
Chewi Theorem 11.8, supplied-interface Sinkhorn/mirror-descent form:
once the finite row-normalization identities supply the certificate, the last
`X`-marginal KL obeys the displayed `KL(gammaStar || gamma^0) / N` rate.
-/
theorem IsChewi118SinkhornMirrorDescentCertificate.last_rowMarginalKL_le
    {phi : E -> ℝ} {gradPhi : E -> E} {gamma : ℕ -> E} {gammaStar : E}
    {rowMarginalKL : ℕ -> ℝ} {initialCouplingKL : ℝ} {N : ℕ}
    (hcert : IsChewi118SinkhornMirrorDescentCertificate
      phi gradPhi gamma gammaStar rowMarginalKL initialCouplingKL N)
    (hN : N ≠ 0) :
    rowMarginalKL N ≤ initialCouplingKL / (N : ℝ) := by
  have hmain :=
    chewi118_last_gap_le_of_recurrence
      (D := fun n => bregmanDivergence phi gradPhi gammaStar (gamma n))
      (gap := rowMarginalKL) hN
      hcert.terminal_nonneg hcert.one_step hcert.monotone_to_last
  simpa [hcert.initial_eq] using hmain

/--
Chewi Theorem 11.8, theorem-facing wrapper.  This is the source-shaped endpoint
to instantiate for Sinkhorn after the finite KL row/column normalization
identities are proved.
-/
theorem chewi118_sinkhorn_last_rowMarginalKL_le_of_mirrorDescent
    {phi : E -> ℝ} {gradPhi : E -> E} {gamma : ℕ -> E} {gammaStar : E}
    {rowMarginalKL : ℕ -> ℝ} {initialCouplingKL : ℝ} {N : ℕ}
    (hcert : IsChewi118SinkhornMirrorDescentCertificate
      phi gradPhi gamma gammaStar rowMarginalKL initialCouplingKL N)
    (hN : N ≠ 0) :
    rowMarginalKL N ≤ initialCouplingKL / (N : ℝ) :=
  hcert.last_rowMarginalKL_le hN

end Optimization
end StatInference
