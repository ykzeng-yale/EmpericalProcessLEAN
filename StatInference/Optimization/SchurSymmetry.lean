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
Expanding a product-space quadratic form on a direction
`(v, 0) - (0, w)` gives the four block-coordinate scalar terms.
-/
theorem withLpProdInlSubInr_inner_map_sub_self
    (P : WithLp 2 (E₁ × E₂) →L[ℝ] WithLp 2 (E₁ × E₂))
    (v : E₁) (w : E₂) :
    inner ℝ v
        (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).fst -
      inner ℝ v
        (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).fst -
      inner ℝ w
        (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).snd +
      inner ℝ w
        (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).snd =
      inner ℝ
        (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
          withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
        (P
          (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
            withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)) := by
  have h :
      inner ℝ
          (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
            withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
          (P
            (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
              withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)) =
        inner ℝ v
            (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).fst -
          inner ℝ v
            (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).fst -
          inner ℝ w
            (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).snd +
          inner ℝ w
            (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).snd := by
    calc
      inner ℝ
          (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
            withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
          (P
            (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
              withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w))
          = inner ℝ
              (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v -
                withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v) -
                P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)) := by
            rw [map_sub]
      _ = inner ℝ (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v) -
                P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)) -
            inner ℝ (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v) -
                P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)) := by
            rw [inner_sub_left]
      _ =
          (inner ℝ (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)) -
            inner ℝ (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)
              (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w))) -
          (inner ℝ (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)) -
            inner ℝ (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)
              (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w))) := by
            rw [inner_sub_right, inner_sub_right]
      _ =
          inner ℝ v
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).fst -
            inner ℝ v
              (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).fst -
            inner ℝ w
              (P (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).snd +
            inner ℝ w
              (P (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).snd := by
            rw [withLpProdInlCLM_inner, withLpProdInlCLM_inner,
              withLpProdInrCLM_inner, withLpProdInrCLM_inner]
            ring
  exact h.symm

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

/-- Application form of the `XX` block derivative extractor. -/
@[simp] theorem barrierInfProjectionBlockXXDeriv_apply
    (hessDeriv : WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂)))
    (dselector : E₁ →L[ℝ] E₂) (u v : E₁) :
    (barrierInfProjectionBlockXXDeriv hessDeriv dselector u) v =
      (hessDeriv (barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
          dselector u)
        (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).fst := by
  rfl

/-- Application form of the `XY` block derivative extractor. -/
@[simp] theorem barrierInfProjectionBlockXYDeriv_apply
    (hessDeriv : WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂)))
    (dselector : E₁ →L[ℝ] E₂) (u : E₁) (w : E₂) :
    (barrierInfProjectionBlockXYDeriv hessDeriv dselector u) w =
      (hessDeriv (barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
          dselector u)
        (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).fst := by
  rfl

/-- Application form of the `YX` block derivative extractor. -/
@[simp] theorem barrierInfProjectionBlockYXDeriv_apply
    (hessDeriv : WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂)))
    (dselector : E₁ →L[ℝ] E₂) (u v : E₁) :
    (barrierInfProjectionBlockYXDeriv hessDeriv dselector u) v =
      (hessDeriv (barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
          dselector u)
        (withLpProdInlCLM (E₁ := E₁) (E₂ := E₂) v)).snd := by
  rfl

/-- Application form of the `YY` block derivative extractor. -/
@[simp] theorem barrierInfProjectionBlockYYDeriv_apply
    (hessDeriv : WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂)))
    (dselector : E₁ →L[ℝ] E₂) (u : E₁) (w : E₂) :
    (barrierInfProjectionBlockYYDeriv hessDeriv dselector u) w =
      (hessDeriv (barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
          dselector u)
        (withLpProdInrCLM (E₁ := E₁) (E₂ := E₂) w)).snd := by
  rfl

/--
If the selector derivative solves the implicit Schur equation, the selected
graph derivative is exactly the Schur lift.
-/
theorem barrierInfProjectionPointFDeriv_eq_schurLift_of_selector_deriv_eq
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂)
    (dselectorAt : E₁ →L[ℝ] E₂) (x v : E₁)
    (hdselector :
      dselectorAt v =
        -invHyy x (barrierInfProjectionBlockYX selector hess x v)) :
    barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
        dselectorAt v =
      barrierInfProjectionSchurLift selector hess invHyy x v := by
  apply WithLp.ofLp_injective 2
  exact Prod.ext
    (by simp [barrierInfProjectionSchurLift])
    (by
      simp [barrierInfProjectionSchurLift, barrierInfProjectionSchurCorrection,
        hdselector])

/--
If the selected graph derivative is the Schur lift, then the four scalar block
terms in the Schur-Hessian derivative are exactly the product-space Hessian
derivative paired against the Schur lift.
-/
theorem barrierInfProjectionSchurLiftedThird_eq_component_expansion_of_pairing
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂)
    (third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ)
    (hessDerivAt : WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂)))
    (dselectorAt : E₁ →L[ℝ] E₂) (x u v : E₁)
    (hpoint :
      barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
          dselectorAt u =
        barrierInfProjectionSchurLift selector hess invHyy x u)
    (hthird_pair :
      inner ℝ (barrierInfProjectionSchurLift selector hess invHyy x v)
          (hessDerivAt
            (barrierInfProjectionSchurLift selector hess invHyy x u)
            (barrierInfProjectionSchurLift selector hess invHyy x v)) =
        barrierInfProjectionSchurLiftedThird selector hess invHyy third
          x u v) :
    inner ℝ v
        ((barrierInfProjectionBlockXXDeriv hessDerivAt dselectorAt u) v) -
      inner ℝ v
        ((barrierInfProjectionBlockXYDeriv hessDerivAt dselectorAt u)
          (invHyy x (barrierInfProjectionBlockYX selector hess x v))) -
      inner ℝ
        (invHyy x (barrierInfProjectionBlockYX selector hess x v))
        ((barrierInfProjectionBlockYXDeriv hessDerivAt dselectorAt u) v) +
      inner ℝ
        (invHyy x (barrierInfProjectionBlockYX selector hess x v))
        ((barrierInfProjectionBlockYYDeriv hessDerivAt dselectorAt u)
          (invHyy x (barrierInfProjectionBlockYX selector hess x v))) =
        barrierInfProjectionSchurLiftedThird selector hess invHyy third
          x u v := by
  let a := invHyy x (barrierInfProjectionBlockYX selector hess x v)
  let P := hessDerivAt
    (barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
      dselectorAt u)
  rw [← hthird_pair]
  rw [← hpoint]
  simpa only [a, P, barrierInfProjectionSchurLift,
    barrierInfProjectionSchurCorrection,
    barrierInfProjectionBlockXXDeriv_apply,
    barrierInfProjectionBlockXYDeriv_apply,
    barrierInfProjectionBlockYXDeriv_apply,
    barrierInfProjectionBlockYYDeriv_apply] using
    (withLpProdInlSubInr_inner_map_sub_self
      (P := P) (v := v) (w := a))

/--
Differentiate the local right-inverse identity `Hyy(y) (Hyy⁻¹(y) w) = w`.
This is the source-shaped equation used to cancel the derivative of the
vertical inverse block in the Schur-Hessian derivative.
-/
theorem barrierInfProjectionBlockYY_invHyy_deriv_cancel_of_eventually_right_inverse
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂)
    {hessDerivAt : WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselectorAt : E₁ →L[ℝ] E₂}
    {invHyyDerivAt : E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x : E₁}
    (hhess : HasFDerivAt hess hessDerivAt
      (barrierInfProjectionPoint selector x))
    (hselector : HasFDerivAt selector dselectorAt x)
    (hinv : HasFDerivAt invHyy invHyyDerivAt x)
    (hright_eventually : ∀ w : E₂,
      (fun y : E₁ => barrierInfProjectionBlockYY selector hess y (invHyy y w))
        =ᶠ[nhds x] fun _ : E₁ => w)
    (u : E₁) (w : E₂) :
    barrierInfProjectionBlockYY selector hess x (invHyyDerivAt u w) +
      (barrierInfProjectionBlockYYDeriv hessDerivAt dselectorAt u)
        (invHyy x w) = 0 := by
  have hHyy :
      HasFDerivAt (barrierInfProjectionBlockYY selector hess)
        (barrierInfProjectionBlockYYDeriv hessDerivAt dselectorAt) x :=
    barrierInfProjectionBlockYY_hasFDerivAt
      (E₁ := E₁) (E₂ := E₂) hhess hselector
  have hinv_apply :
      HasFDerivAt (fun y : E₁ => invHyy y w)
        ((invHyy x).comp (0 : E₁ →L[ℝ] E₂) +
          invHyyDerivAt.flip w) x :=
    hinv.clm_apply (hasFDerivAt_const w x)
  have hactual :=
    hHyy.clm_apply hinv_apply
  have hconst :
      HasFDerivAt (fun _ : E₁ => w) (0 : E₁ →L[ℝ] E₂) x :=
    hasFDerivAt_const w x
  have hzero :
      HasFDerivAt
        (fun y : E₁ =>
          barrierInfProjectionBlockYY selector hess y (invHyy y w))
        (0 : E₁ →L[ℝ] E₂) x :=
    hconst.congr_of_eventuallyEq (hright_eventually w)
  have hclm := hactual.unique hzero
  have happly := congrArg (fun L : E₁ →L[ℝ] E₂ => L u) hclm
  simpa [ContinuousLinearMap.add_apply, ContinuousLinearMap.comp_apply] using happly

/--
Full-Hessian derivative certificate for the Schur Hessian from the
source-shaped lifted-third pairing.  This removes the raw four-term component
expansion assumption from the next layer of the envelope proof.
-/
theorem BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_liftPairing
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hcross : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ v : E₁, ∀ w : E₂,
        inner ℝ v
            (barrierInfProjectionBlockXY selector hess x (invHyy x w)) =
          inner ℝ
            (invHyy x (barrierInfProjectionBlockYX selector hess x v)) w)
    (hinvPair : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ u v : E₁,
        inner ℝ v
            (barrierInfProjectionBlockXY selector hess x
              (invHyyDeriv x u
                (barrierInfProjectionBlockYX selector hess x v))) =
          -inner ℝ
            (invHyy x (barrierInfProjectionBlockYX selector hess x v))
            ((barrierInfProjectionBlockYYDeriv (hessDeriv x) (dselector x) u)
              (invHyy x (barrierInfProjectionBlockYX selector hess x v))))
    (hpoint : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ u : E₁,
        barrierInfProjectionPointFDeriv (E₁ := E₁) (E₂ := E₂)
            (dselector x) u =
          barrierInfProjectionSchurLift selector hess invHyy x u)
    (hthird_pair : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ u v : E₁,
        inner ℝ (barrierInfProjectionSchurLift selector hess invHyy x v)
            ((hessDeriv x
              (barrierInfProjectionSchurLift selector hess invHyy x u))
              (barrierInfProjectionSchurLift selector hess invHyy x v)) =
          barrierInfProjectionSchurLiftedThird selector hess invHyy third
            x u v) :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_componentPairing
    (s := s) (selector := selector) (hess := hess) (invHyy := invHyy)
    (third := third) (hessDeriv := hessDeriv) (dselector := dselector)
    (invHyyDeriv := invHyyDeriv) hhess hselector hinvDeriv hcross hinvPair
    (by
      intro x hx u v
      exact
        barrierInfProjectionSchurLiftedThird_eq_component_expansion_of_pairing
          selector hess invHyy third (hessDeriv x) (dselector x) x u v
          (hpoint (x := x) hx u) (hthird_pair (x := x) hx u v))

/--
Source-facing Schur-Hessian derivative certificate from full product-space
Hessian data.  This wrapper discharges the cross-block pairing, inverse-
derivative cancellation, and four-term component expansion internally, leaving
only the standard full mixed-third identity for the original barrier.
-/
theorem BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hsymm : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ((hess (barrierInfProjectionPoint selector x)) :
        WithLp 2 (E₁ × E₂) →ₗ[ℝ] WithLp 2 (E₁ × E₂)).IsSymmetric)
    (hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hyy_left : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hdselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ u : E₁,
        dselector x u =
          -invHyy x (barrierInfProjectionBlockYX selector hess x u))
    (hderiv_cancel : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ u : E₁, ∀ w : E₂,
        barrierInfProjectionBlockYY selector hess x (invHyyDeriv x u w) +
          (barrierInfProjectionBlockYYDeriv (hessDeriv x) (dselector x) u)
            (invHyy x w) = 0)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_liftPairing
    (s := s) (selector := selector) (hess := hess) (invHyy := invHyy)
    (third := third) (hessDeriv := hessDeriv) (dselector := dselector)
    (invHyyDeriv := invHyyDeriv) hhess hselector hinvDeriv
    (by
      intro x hx v w
      exact
        barrierInfProjectionBlockXY_invHyy_pair_eq_of_hessian_symmetric
          selector hess invHyy x (hsymm (x := x) hx)
          (hyy_right (x := x) hx) v w)
    (by
      intro x hx u v
      exact
        barrierInfProjectionBlockXY_invHyyDeriv_pair_eq_neg_of_hessian_symmetric
          selector hess invHyy x
          (barrierInfProjectionBlockYYDeriv (hessDeriv x) (dselector x) u)
          (invHyyDeriv x u) (hsymm (x := x) hx)
          (hyy_right (x := x) hx) (hyy_left (x := x) hx)
          (hderiv_cancel (x := x) hx u) v)
    (by
      intro x hx u
      exact
        barrierInfProjectionPointFDeriv_eq_schurLift_of_selector_deriv_eq
          selector hess invHyy (dselector x) x u
          (hdselector (x := x) hx u))
    (by
      intro x hx u v
      simpa [barrierInfProjectionSchurLiftedThird] using
        hmixed_full (x := x) hx
          (barrierInfProjectionSchurLift selector hess invHyy x u)
          (barrierInfProjectionSchurLift selector hess invHyy x v))

/--
Variant of the source-facing constructor that derives the differentiated
inverse equation from the local right-inverse identity
`Hyy(y) (Hyy⁻¹(y) w) = w`.
-/
theorem BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse_eventually
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hsymm : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ((hess (barrierInfProjectionPoint selector x)) :
        WithLp 2 (E₁ × E₂) →ₗ[ℝ] WithLp 2 (E₁ × E₂)).IsSymmetric)
    (hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hyy_right_eventually : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂,
        (fun y : E₁ => barrierInfProjectionBlockYY selector hess y (invHyy y w))
          =ᶠ[nhds x] fun _ : E₁ => w)
    (hyy_left : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hdselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ u : E₁,
        dselector x u =
          -invHyy x (barrierInfProjectionBlockYX selector hess x u))
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse
    (s := s) (selector := selector) (hess := hess) (invHyy := invHyy)
    (third := third) (hessDeriv := hessDeriv) (dselector := dselector)
    (invHyyDeriv := invHyyDeriv) hhess hselector hinvDeriv hsymm hyy_right
    hyy_left hdselector
    (by
      intro x hx u w
      exact
        barrierInfProjectionBlockYY_invHyy_deriv_cancel_of_eventually_right_inverse
          selector hess invHyy (hhess (x := x) hx) (hselector (x := x) hx)
          (hinvDeriv (x := x) hx) (hyy_right_eventually (x := x) hx) u w)
    hmixed_full

/--
Pointwise right-inverse identities on a projected-domain neighborhood give the
eventual right-inverse identity needed to differentiate `Hyy * Hyy⁻¹ = I`.
-/
theorem barrierInfProjectionBlockYY_invHyy_eventually_right_inverse_of_mem_nhds
    {s : Set (WithLp 2 (E₁ × E₂))}
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂)
    {x : E₁}
    (hmem_nhds : ∀ᶠ y in nhds x, y ∈ barrierInfProjectionSet s)
    (hyy_right : ∀ ⦃y : E₁⦄, y ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess y (invHyy y w) = w)
    (w : E₂) :
    (fun y : E₁ => barrierInfProjectionBlockYY selector hess y (invHyy y w))
      =ᶠ[nhds x] fun _ : E₁ => w :=
  hmem_nhds.mono fun y hy => hyy_right (y := y) hy w

/--
Stationary-selector version of the source-facing Schur-Hessian derivative
certificate.  Neighborhood membership supplies both local vertical stationarity
and the eventual `Hyy * Hyy⁻¹ = I` identity, so callers no longer provide the
selector derivative equation or the inverse-identity derivative equation by
hand.
-/
theorem BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hsel : BarrierInfProjectionSelectorStationary s selector grad)
    (hmem_nhds : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ᶠ y in nhds x, y ∈ barrierInfProjectionSet s)
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hsymm : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ((hess (barrierInfProjectionPoint selector x)) :
        WithLp 2 (E₁ × E₂) →ₗ[ℝ] WithLp 2 (E₁ × E₂)).IsSymmetric)
    (hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hyy_left : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse_eventually
    (s := s) (selector := selector) (hess := hess) (invHyy := invHyy)
    (third := third) (hessDeriv := hessDeriv) (dselector := dselector)
    (invHyyDeriv := invHyyDeriv) hhess hselector hinvDeriv hsymm hyy_right
    (by
      intro x hx w
      exact
        barrierInfProjectionBlockYY_invHyy_eventually_right_inverse_of_mem_nhds
          (s := s) selector hess invHyy (hmem_nhds (x := x) hx)
          hyy_right w)
    hyy_left
    (by
      intro x hx u
      exact hsel.selector_deriv_eq_neg_invHyy_of_mem_nhds
        (hmem_nhds (x := x) hx) (hgrad (x := x) hx)
        (hselector (x := x) hx) (hyy_left (x := x) hx) u)
    hmixed_full

/--
Open-projected-domain version of the stationary-selector Schur-Hessian
derivative certificate.
-/
theorem BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_isOpen
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hsel : BarrierInfProjectionSelectorStationary s selector grad)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hsymm : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ((hess (barrierInfProjectionPoint selector x)) :
        WithLp 2 (E₁ × E₂) →ₗ[ℝ] WithLp 2 (E₁ × E₂)).IsSymmetric)
    (hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hyy_left : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  hsel.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds
    (hmem_nhds := fun {_} hx => hopen.mem_nhds hx)
    hgrad hhess hselector hinvDeriv hsymm hyy_right hyy_left hmixed_full

end InfProjectionSchurSymmetry

end Optimization
end StatInference
