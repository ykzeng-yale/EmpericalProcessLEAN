import StatInference.Optimization.InteriorPoint

/-!
# Schur-complement symmetry bridges

This module contains small reusable symmetry consequences for the Chewi
inf-projection Schur-complement lane.  They are kept separate from
`InteriorPoint.lean` so future packets can extend the envelope proof without
forcing the whole interior-point file to re-elaborate for every tiny bridge.
-/

namespace StatInference
namespace Optimization

open scoped intervalIntegral

section InfProjectionSchurSymmetry

variable {E₁ E₂ : Type*}
  [NormedAddCommGroup E₁] [InnerProductSpace ℝ E₁]
  [NormedAddCommGroup E₂] [InnerProductSpace ℝ E₂]

/-- Inner product with a first-coordinate injection reads off the first block. -/
theorem withLpProdInlCLM_inner (v : E₁) (p : WithLp 2 (E₁ × E₂)) :
    inner ℝ (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v) p =
      inner ℝ v p.fst := by
  rw [WithLp.prod_inner_apply]
  change inner ℝ v p.fst + inner ℝ (0 : E₂) p.snd = inner ℝ v p.fst
  rw [inner_zero_left, add_zero]

/-- Inner product with a second-coordinate injection reads off the second block. -/
theorem withLpProdInrCLM_inner (v : E₂) (p : WithLp 2 (E₁ × E₂)) :
    inner ℝ (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) v) p =
      inner ℝ v p.snd := by
  rw [WithLp.prod_inner_apply]
  change inner ℝ (0 : E₁) p.fst + inner ℝ v p.snd = inner ℝ v p.snd
  rw [inner_zero_left, zero_add]

/-- Right inner product with a second-coordinate injection reads off the second block. -/
theorem inner_withLpProdInrCLM (p : WithLp 2 (E₁ × E₂)) (v : E₂) :
    inner ℝ p (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) v) =
      inner ℝ p.snd v := by
  rw [WithLp.prod_inner_apply]
  change inner ℝ p.fst (0 : E₁) + inner ℝ p.snd v = inner ℝ p.snd v
  rw [inner_zero_right, zero_add]

/--
Full Hessian symmetry plus the vertical block right inverse gives the
cross-block pairing needed in the Schur-Hessian derivative calculation.
-/
theorem barrierInfProjectionBlockXY_invHyy_pair_eq_of_hessian_symmetric
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂) (x : E₁)
    (hsymm : ((hess (barrierInfProjectionPoint selector x)) :
      WithLp 2 (E₁ × E₂) →ₗ[ℝ] WithLp 2 (E₁ × E₂)).IsSymmetric)
    (hyy_right : ∀ w : E₂,
      barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (v : E₁) (w : E₂) :
    inner ℝ v
        (barrierInfProjectionBlockXY selector hess x (invHyy x w)) =
      inner ℝ (invHyy x (barrierInfProjectionBlockYX selector hess x v)) w := by
  let H := hess (barrierInfProjectionPoint selector x)
  let a := invHyy x w
  let b := barrierInfProjectionBlockYX selector hess x v
  let c := invHyy x b
  have hxy :
      inner ℝ v (barrierInfProjectionBlockXY selector hess x a) =
        inner ℝ a b := by
    have hs :=
      hsymm
        (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)
        (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) a)
    calc
      inner ℝ v (barrierInfProjectionBlockXY selector hess x a)
          = inner ℝ (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)
              (H (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) a)) := by
            rw [withLpProdInlCLM_inner]
            rfl
      _ = inner ℝ (H (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v))
              (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) a) := hs.symm
      _ = inner ℝ b a := by
            rw [inner_withLpProdInrCLM]
            rfl
      _ = inner ℝ a b := by
            rw [real_inner_comm]
  have hyy :
      inner ℝ a b = inner ℝ c w := by
    have hs :=
      hsymm
        (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) a)
        (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) c)
    have hc :
        barrierInfProjectionBlockYY selector hess x c = b := by
      simpa [c, b] using hyy_right b
    have ha :
        barrierInfProjectionBlockYY selector hess x a = w := by
      simpa [a] using hyy_right w
    calc
      inner ℝ a b
          = inner ℝ a (barrierInfProjectionBlockYY selector hess x c) := by
            rw [hc]
      _ = inner ℝ (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) a)
              (H (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) c)) := by
            rw [withLpProdInrCLM_inner]
            rfl
      _ = inner ℝ (H (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) a))
              (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) c) := hs.symm
      _ = inner ℝ (barrierInfProjectionBlockYY selector hess x a) c := by
            rw [inner_withLpProdInrCLM]
            rfl
      _ = inner ℝ w c := by
            rw [ha]
      _ = inner ℝ c w := by
            rw [real_inner_comm]
  calc
    inner ℝ v (barrierInfProjectionBlockXY selector hess x (invHyy x w))
        = inner ℝ a b := hxy
    _ = inner ℝ c w := hyy
    _ = inner ℝ (invHyy x (barrierInfProjectionBlockYX selector hess x v)) w := rfl

/--
The inverse-derivative cancellation needed in the Schur-Hessian derivative
calculation.  It follows from the cross-block symmetry bridge, a left inverse
for the vertical block, and the differentiated identity
`Hyy * Hyy⁻¹ = I`.
-/
theorem barrierInfProjectionBlockXY_invHyyDeriv_pair_eq_neg_of_hessian_symmetric
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂) (x : E₁)
    (HyyDerivAt invHyyDerivAt : E₂ →L[ℝ] E₂)
    (hsymm : ((hess (barrierInfProjectionPoint selector x)) :
      WithLp 2 (E₁ × E₂) →ₗ[ℝ] WithLp 2 (E₁ × E₂)).IsSymmetric)
    (hyy_right : ∀ w : E₂,
      barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hyy_left : ∀ w : E₂,
      invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hderiv_cancel : ∀ w : E₂,
      barrierInfProjectionBlockYY selector hess x (invHyyDerivAt w) +
        HyyDerivAt (invHyy x w) = 0)
    (v : E₁) :
    inner ℝ v
        (barrierInfProjectionBlockXY selector hess x
          (invHyyDerivAt (barrierInfProjectionBlockYX selector hess x v))) =
      -inner ℝ (invHyy x (barrierInfProjectionBlockYX selector hess x v))
        (HyyDerivAt
          (invHyy x (barrierInfProjectionBlockYX selector hess x v))) := by
  let b := barrierInfProjectionBlockYX selector hess x v
  let a := invHyy x b
  let y := invHyyDerivAt b
  have hy_as_inv :
      y = invHyy x (barrierInfProjectionBlockYY selector hess x y) := by
    exact (hyy_left y).symm
  have hpair :
      inner ℝ v (barrierInfProjectionBlockXY selector hess x y) =
        inner ℝ a (barrierInfProjectionBlockYY selector hess x y) := by
    calc
      inner ℝ v (barrierInfProjectionBlockXY selector hess x y)
          = inner ℝ v
              (barrierInfProjectionBlockXY selector hess x
                (invHyy x (barrierInfProjectionBlockYY selector hess x y))) := by
            exact congrArg
              (fun z => inner ℝ v
                (barrierInfProjectionBlockXY selector hess x z))
              hy_as_inv
      _ = inner ℝ (invHyy x (barrierInfProjectionBlockYX selector hess x v))
              (barrierInfProjectionBlockYY selector hess x y) := by
            exact
              barrierInfProjectionBlockXY_invHyy_pair_eq_of_hessian_symmetric
                selector hess invHyy x hsymm hyy_right v
                (barrierInfProjectionBlockYY selector hess x y)
      _ = inner ℝ a (barrierInfProjectionBlockYY selector hess x y) := rfl
  have hcancel :
      barrierInfProjectionBlockYY selector hess x y = -HyyDerivAt a := by
    rw [eq_neg_iff_add_eq_zero]
    simpa [a, b, y] using hderiv_cancel b
  calc
    inner ℝ v
        (barrierInfProjectionBlockXY selector hess x
          (invHyyDerivAt (barrierInfProjectionBlockYX selector hess x v)))
        = inner ℝ v (barrierInfProjectionBlockXY selector hess x y) := rfl
    _ = inner ℝ a (barrierInfProjectionBlockYY selector hess x y) := hpair
    _ = inner ℝ a (-HyyDerivAt a) := by rw [hcancel]
    _ = -inner ℝ a (HyyDerivAt a) := by rw [inner_neg_right]
    _ = -inner ℝ (invHyy x (barrierInfProjectionBlockYX selector hess x v))
        (HyyDerivAt
          (invHyy x (barrierInfProjectionBlockYX selector hess x v))) := rfl

end InfProjectionSchurSymmetry

end Optimization
end StatInference
