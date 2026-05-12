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

/--
Finite-dimensional vertical-block version of the stationary-neighborhood Schur
derivative certificate.  A right inverse for `Hyy` is enough, because on a
finite-dimensional vertical space it also gives the left inverse needed for the
implicit-selector equation.
-/
theorem BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy
    [FiniteDimensional ℝ E₂]
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
    hmem_nhds hgrad hhess hselector hinvDeriv hsymm hyy_right
    (fun {x} hx =>
      barrierInfProjectionBlockYY_left_inverse_of_right_inverse_finiteDim
        selector hess invHyy x (hyy_right (x := x) hx))
    hmixed_full

/--
Open-projected-domain, finite-dimensional vertical-block version of the
stationary-selector Schur-Hessian derivative certificate.
-/
theorem BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy
    [FiniteDimensional ℝ E₂]
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
  hsel.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy
    (hmem_nhds := fun {_} hx => hopen.mem_nhds hx)
    hgrad hhess hselector hinvDeriv hsymm hyy_right hmixed_full

/--
Third-order selected-envelope certificate for Chewi Proposition 13.11(4).
It packages the first/second-order envelope identities for the selected value
function together with the Schur-Hessian derivative identity whose scalar
pairing is the canonical lifted product-space third derivative.
-/
structure BarrierInfProjectionThirdOrderEnvelopeOn
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    (s : Set (WithLp 2 (E₁ × E₂)))
    (f : WithLp 2 (E₁ × E₂) -> ℝ)
    (selector : E₁ -> E₂)
    (grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂))
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂)
    (third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ)
    (schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)) : Prop where
  second_order : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
    BarrierInfProjectionSecondOrderEnvelopeAt s f selector grad hess invHyy x
  schur_deriv :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      schurDeriv

theorem BarrierInfProjectionThirdOrderEnvelopeOn.value_hasGradientAt
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasGradientAt (barrierInfProjectionValue f selector)
      (barrierInfProjectionGrad selector grad x) x :=
  (henv.second_order hx).value_hasGradientAt

/--
Third-order envelope gradient theorem for Chewi's literal inf-projection value
`x ↦ inf_y f(x, y)`, obtained by transporting the selected-envelope gradient
through a selector that realizes every vertical infimum.
-/
theorem BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    (hmin : BarrierInfProjectionSelectorMinimizes f selector)
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasGradientAt (barrierInfProjectionInfValue (E₂ := E₂) f)
      (barrierInfProjectionGrad selector grad x) x :=
  (henv.value_hasGradientAt hx).congr_of_eventuallyEq
    (Filter.Eventually.of_forall fun y =>
      congrFun hmin.infValue_eq_value y)

/--
Local projected-domain version of the third-order envelope gradient theorem
for Chewi's literal inf-projection value.  The selector only needs to minimize
vertical fibers on a neighborhood inside the projected domain.
-/
theorem BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt_of_minimizesOn_mem_nhds
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    (hmin : BarrierInfProjectionSelectorMinimizesOn s f selector)
    {x : E₁} (hmem_nhds : ∀ᶠ y in nhds x, y ∈ barrierInfProjectionSet s)
    (hx : x ∈ barrierInfProjectionSet s) :
    HasGradientAt (barrierInfProjectionInfValue (E₂ := E₂) f)
      (barrierInfProjectionGrad selector grad x) x :=
  (henv.value_hasGradientAt hx).congr_of_eventuallyEq
    (hmem_nhds.mono fun _ hy =>
      hmin.infValue_eq_value_of_mem hy)

/--
Open-projected-domain version of the third-order envelope gradient theorem for
Chewi's literal inf-projection value.
-/
theorem BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt_of_minimizesOn_isOpen
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    (hmin : BarrierInfProjectionSelectorMinimizesOn s f selector)
    (hopen : IsOpen (barrierInfProjectionSet s))
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasGradientAt (barrierInfProjectionInfValue (E₂ := E₂) f)
      (barrierInfProjectionGrad selector grad x) x :=
  henv.infValue_hasGradientAt_of_minimizesOn_mem_nhds hmin
    (hopen.mem_nhds hx) hx

theorem BarrierInfProjectionThirdOrderEnvelopeOn.grad_hasFDerivAt
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasFDerivAt (barrierInfProjectionGrad selector grad)
      (barrierInfProjectionSchurHessFrom selector hess invHyy x) x :=
  (henv.second_order hx).grad_hasFDerivAt

theorem BarrierInfProjectionThirdOrderEnvelopeOn.schurHess_hasFDerivAt
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasFDerivAt (barrierInfProjectionSchurHessFrom selector hess invHyy)
      (schurDeriv x) x :=
  henv.schur_deriv.hess_hasFDerivAt hx

theorem BarrierInfProjectionThirdOrderEnvelopeOn.hessianSegmentPsi_hasDerivWithinAt_liftedThird
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    {x y v : E₁} {t : ℝ} {u : Set ℝ}
    (hz : hessianSegmentPoint x y t ∈ barrierInfProjectionSet s) :
    HasDerivWithinAt
      (hessianSegmentPsi (barrierInfProjectionSchurHessFrom selector hess invHyy)
        x y v)
      (hessianSegmentMixedThirdPsiDeriv
        (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
        x y v t) u t :=
  henv.schur_deriv.hessianSegmentPsi_hasDerivWithinAt_liftedThird hz

/--
Finite-dimensional stationary-selector constructor for the third-order
selected-envelope certificate.  The vertical Hessian left-inverse side and the
local differentiated inverse identity are both derived from the projected
domain neighborhood and the pointwise `Hyy` right-inverse identity.
-/
theorem BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy
    [FiniteDimensional ℝ E₂]
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
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
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
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
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) where
  second_order := by
    intro x hx
    exact hsel.secondOrderEnvelopeAt_of_mem_nhds_finiteDimHyy
      hx (hmem_nhds (x := x) hx) (hfgrad (x := x) hx)
      (hgrad (x := x) hx) (hselector (x := x) hx)
      (hyy_right (x := x) hx)
  schur_deriv :=
    hsel.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy
      hmem_nhds hgrad hhess hselector hinvDeriv hsymm hyy_right hmixed_full

/--
Stationary-selector constructor for a third-order selected-envelope
certificate from an already-built Schur-Hessian derivative certificate and a
supplied left inverse for the vertical Hessian block.
-/
theorem BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (hsel : BarrierInfProjectionSelectorStationary s selector grad)
    (hmem_nhds : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ᶠ y in nhds x, y ∈ barrierInfProjectionSet s)
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hyy_left : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      schurDeriv where
  second_order := by
    intro x hx
    exact hsel.secondOrderEnvelopeAt_of_mem_nhds
      hx (hmem_nhds (x := x) hx) (hfgrad (x := x) hx)
      (hgrad (x := x) hx) (hselector (x := x) hx)
      (hyy_left (x := x) hx)
  schur_deriv := hschur

/--
Open-domain version of
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds`.
-/
theorem BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (hsel : BarrierInfProjectionSelectorStationary s selector grad)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hyy_left : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, invHyy x (barrierInfProjectionBlockYY selector hess x w) = w)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      schurDeriv :=
  hsel.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds
    (fun {_} hx => hopen.mem_nhds hx) hfgrad hgrad hselector hyy_left hschur

/--
Finite-dimensional stationary-selector constructor for a third-order
selected-envelope certificate from an already-built Schur-Hessian derivative
certificate.  This factors the selected-value first/second-order envelope
part away from the Schur derivative construction.
-/
theorem BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds_finiteDimHyy
    [FiniteDimensional ℝ E₂]
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (hsel : BarrierInfProjectionSelectorStationary s selector grad)
    (hmem_nhds : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ᶠ y in nhds x, y ∈ barrierInfProjectionSet s)
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      schurDeriv :=
  hsel.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds
    hmem_nhds hfgrad hgrad hselector
    (by
      intro x hx
      exact barrierInfProjectionBlockYY_left_inverse_of_right_inverse_finiteDim
        selector hess invHyy x (hyy_right (x := x) hx))
    hschur

/--
Open-projected-domain version of the third-order selected-envelope constructor
from an already-built Schur-Hessian derivative certificate.
-/
theorem BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_finiteDimHyy
    [FiniteDimensional ℝ E₂]
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (hsel : BarrierInfProjectionSelectorStationary s selector grad)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      schurDeriv :=
  hsel.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds_finiteDimHyy
    (fun {_} hx => hopen.mem_nhds hx) hfgrad hgrad hselector hyy_right hschur

/--
Open-projected-domain version of the finite-dimensional third-order
selected-envelope constructor.
-/
theorem BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy
    [FiniteDimensional ℝ E₂]
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
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
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
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
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  hsel.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy
    (hmem_nhds := fun {_} hx => hopen.mem_nhds hx)
    hfgrad hgrad hhess hselector hinvDeriv hsymm hyy_right hmixed_full

/--
Schur-Hessian derivative certificate from the finite-dimensional adjoint-square
envelope model.  The model already carries selector stationarity and the
square-root formulas that imply Hessian symmetry and the `Hyy` right-inverse.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivative_mem_nhds
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
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
  hmodel.selector_stationary
    |>.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy
      hmem_nhds hgrad hhess hselector hinvDeriv
      (by
        intro x hx
        exact hessianSymmetric_of_adjointSqrt (hmodel.full_hess_eq (x := x) hx))
      (by
        intro x hx w
        exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
          (H := barrierInfProjectionBlockYY selector hess x)
          (invH := invHyy x) (sqrtCoord := sqrtHyy x)
          (hmodel.hyy_hess_eq (x := x) hx)
          (hmodel.hyy_inv_eq (x := x) hx) w)
      hmixed_full

/--
Open-projected-domain version of the Schur-Hessian derivative certificate from
the finite-dimensional adjoint-square envelope model.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
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
  hmodel.schurHessDerivativeOn_of_fullHessianDerivative_mem_nhds
    (hmem_nhds := fun {_} hx => hopen.mem_nhds hx)
    hgrad hhess hselector hinvDeriv hmixed_full

/--
Third-order selected-envelope certificate from the packaged adjoint-square
Schur-envelope model and source derivatives of the original value/gradient/
Hessian oracles.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) :=
  hmodel.selector_stationary
    |>.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy
      hopen hfgrad hgrad hhess hselector hinvDeriv
      (by
        intro x hx
        exact hessianSymmetric_of_adjointSqrt (hmodel.full_hess_eq (x := x) hx))
      (by
        intro x hx w
        exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
          (H := barrierInfProjectionBlockYY selector hess x)
          (invH := invHyy x) (sqrtCoord := sqrtHyy x)
          (hmodel.hyy_hess_eq (x := x) hx)
          (hmodel.hyy_inv_eq (x := x) hx) w)
      hmixed_full

/--
Literal inf-projection gradient theorem from the packaged adjoint-square
Schur-envelope model.  This is the open-domain version of Chewi Proposition
13.11(4)'s first-order conclusion for `x ↦ inf_y f(x, y)`, assuming a local
vertical-fiber minimizer certificate.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.infValue_hasGradientAt_of_fullHessianDerivative_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hmin : BarrierInfProjectionSelectorMinimizesOn s f selector)
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v)
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasGradientAt (barrierInfProjectionInfValue (E₂ := E₂) f)
      (barrierInfProjectionGrad selector grad x) x := by
  have henv :=
    hmodel.thirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen
      hopen hfgrad hgrad hhess hselector hinvDeriv hmixed_full
  exact henv.infValue_hasGradientAt_of_minimizesOn_isOpen hmin hopen hx

/--
Source-shaped literal inf-projection gradient theorem from the packaged
adjoint-square model.  The local vertical minimizer hypothesis is derived from
the vertical first-order lower-model condition plus selector stationarity.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.infValue_hasGradientAt_of_fullHessianDerivative_isOpen_of_verticalFirstOrder
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfirst : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      FirstOrderStrongConvexOn Set.univ
        (fun y : E₂ => f (WithLp.toLp 2 (x, y)))
        (fun y : E₂ => (grad (WithLp.toLp 2 (x, y))).snd) 0)
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v)
    {x : E₁} (hx : x ∈ barrierInfProjectionSet s) :
    HasGradientAt (barrierInfProjectionInfValue (E₂ := E₂) f)
      (barrierInfProjectionGrad selector grad x) x := by
  exact
    hmodel.infValue_hasGradientAt_of_fullHessianDerivative_isOpen
      hopen
      (hmodel.selector_stationary.minimizesOn_of_vertical_firstOrder hfirst)
      hfgrad hgrad hhess hselector hinvDeriv hmixed_full hx

/--
Source-facing certificate for Chewi Proposition 13.11(4)'s literal infimum
value.  It packages the projected self-concordant barrier oracle together with
the calculus facts connecting that oracle to `x ↦ inf_y f(x, y)`.
-/
structure BarrierInfProjectionLiteralThirdOrderEnvelopeOn
    [CompleteSpace E₁] [CompleteSpace (WithLp 2 (E₁ × E₂))]
    (s : Set (WithLp 2 (E₁ × E₂)))
    (f : WithLp 2 (E₁ × E₂) -> ℝ)
    (selector : E₁ -> E₂)
    (grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂))
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ)
    (invHyy : E₁ -> E₂ →L[ℝ] E₂)
    (schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁))
    (M nu : ℝ) : Prop where
  barrier :
    SelfConcordantBarrierOn (barrierInfProjectionSet s)
      (barrierInfProjectionSchurHessFrom selector hess invHyy)
      (barrierInfProjectionGrad selector grad)
      (barrierInfProjectionProjInvHessFromFullInv selector invHess)
      (barrierInfProjectionSchurLiftedThird selector hess invHyy third) M nu
  infValue_hasGradientAt : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
    HasGradientAt (barrierInfProjectionInfValue (E₂ := E₂) f)
      (barrierInfProjectionGrad selector grad x) x
  grad_hasFDerivAt : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
    HasFDerivAt (barrierInfProjectionGrad selector grad)
      (barrierInfProjectionSchurHessFrom selector hess invHyy x) x
  schur_deriv :
    BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
      schurDeriv

/--
The packaged adjoint-square Schur model, vertical first-order lower model, and
source Hessian derivative data produce the full literal-infimum envelope
certificate for Chewi Proposition 13.11(4).
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen_of_verticalFirstOrder
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfirst : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      FirstOrderStrongConvexOn Set.univ
        (fun y : E₂ => f (WithLp.toLp 2 (x, y)))
        (fun y : E₂ => (grad (WithLp.toLp 2 (x, y))).snd) 0)
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hhess : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv x) (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hinvDeriv : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv x) x)
    (hmixed_full : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv x a) v) =
          third (barrierInfProjectionPoint selector x) a v) :
    BarrierInfProjectionLiteralThirdOrderEnvelopeOn s f selector grad hess
      invHess third invHyy
      (fun x =>
        barrierInfProjectionSchurHessDeriv
          (barrierInfProjectionBlockXY selector hess)
          (barrierInfProjectionBlockYX selector hess)
          invHyy
          (fun x => barrierInfProjectionBlockXXDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockXYDeriv (hessDeriv x) (dselector x))
          (fun x => barrierInfProjectionBlockYXDeriv (hessDeriv x) (dselector x))
          invHyyDeriv x) M nu := by
  let henv :=
    hmodel.thirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen
      hopen hfgrad hgrad hhess hselector hinvDeriv hmixed_full
  let hmin : BarrierInfProjectionSelectorMinimizesOn s f selector :=
    hmodel.selector_stationary.minimizesOn_of_vertical_firstOrder hfirst
  exact
    { barrier := hmodel.selfConcordantBarrierOn
      infValue_hasGradientAt := by
        intro x hx
        exact henv.infValue_hasGradientAt_of_minimizesOn_isOpen hmin hopen hx
      grad_hasFDerivAt := by
        intro x hx
        exact henv.grad_hasFDerivAt hx
      schur_deriv := henv.schur_deriv }

/--
Third-order selected-envelope certificate from a supplied Schur-Hessian
derivative certificate.  This separates the easy selected-value
first/second-order envelope part from the harder Schur derivative construction:
future exact inf-projection packets can build `BarrierInfProjectionSchurHessDerivativeOn`
once and then reuse this adapter without re-threading the raw Hessian inverse
derivative data.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv) :
    BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy third
      schurDeriv := by
  have hyy_right : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess x (invHyy x w) = w := by
    intro x hx w
    exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
      (H := barrierInfProjectionBlockYY selector hess x)
      (invH := invHyy x) (sqrtCoord := sqrtHyy x)
      (hmodel.hyy_hess_eq (x := x) hx)
      (hmodel.hyy_inv_eq (x := x) hx) w
  exact
    hmodel.selector_stationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_finiteDimHyy
      hopen hfgrad hgrad hselector hyy_right hschur

/--
Projected mixed-third segment certificate from the packaged adjoint-square
envelope model and the source derivative data for the original Hessian.  This
feeds the Schur-envelope route directly into the reusable Lemma 13.6 segment
machinery.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projectedHessianSegmentMixedThirdLocalNormCertificate_of_fullHessianDerivative_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y : E₁} {r : ℝ}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hsegment_coeff : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M *
            localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
              (hessianSegmentPoint x y t) (y - x) ≤
          2 * M * r / (1 - M * r * t)) :
    HessianSegmentMixedThirdLocalNormCertificate
      (barrierInfProjectionSchurHessFrom selector hess invHyy)
      (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
      x y M r := by
  let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
    intro z hz w
    exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
      (H := barrierInfProjectionBlockYY selector hess z)
      (invH := invHyy z) (sqrtCoord := sqrtHyy z)
      (hmodel.hyy_hess_eq (x := z) hz)
      (hmodel.hyy_inv_eq (x := z) hz) w
  let hderiv :=
    hmodel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen
      hopen hgrad hhess hselector hinvDeriv hmixed_full
  exact
    hmodel.selector_stationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_deriv
      (hbar := hmodel.barrier) hyy_right hderiv hs hx hy hsegment_coeff

/--
Projected source-radius local-norm sandwich from the packaged adjoint-square
envelope model and source derivative data.  This is the Lemma 13.6 consequence
needed by the inf-projection part of Chewi Proposition 13.11.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hsegment_coeff : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M *
            localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
              (hessianSegmentPoint x y t) (y - x) ≤
          2 * M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x) /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x) * t)) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
    intro z hz w
    exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
      (H := barrierInfProjectionBlockYY selector hess z)
      (invH := invHyy z) (sqrtCoord := sqrtHyy z)
      (hmodel.hyy_hess_eq (x := z) hz)
      (hmodel.hyy_inv_eq (x := z) hz) w
  let hderiv :=
    hmodel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen
      hopen hgrad hhess hselector hinvDeriv hmixed_full
  exact
    hmodel.selector_stationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply
      (hbar := hmodel.barrier) hyy_right hderiv hMr_lt hs hx hy
      hsegment_coeff v

/--
Source-radius projected local-norm sandwich from the packaged adjoint-square
envelope model, without a supplied segment-coefficient bound.  The Riccati
source-radius machinery derives the segment coefficient from the Schur-Hessian
derivative certificate, assuming strict positivity of the projected Hessian on
the segment domain.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_hessianPositive
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hess_pos : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ v : E₁, v ≠ 0 ->
        0 < inner ℝ v (barrierInfProjectionSchurHessFrom selector hess invHyy z v))
    (hdiff_ne : y - x ≠ 0) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
    intro z hz w
    exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
      (H := barrierInfProjectionBlockYY selector hess z)
      (invH := invHyy z) (sqrtCoord := sqrtHyy z)
      (hmodel.hyy_hess_eq (x := z) hz)
      (hmodel.hyy_inv_eq (x := z) hz) w
  let hderiv :=
    hmodel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen
      hopen hgrad hhess hselector hinvDeriv hmixed_full
  exact
    hmodel.selector_stationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv
      (hbar := hmodel.barrier) hyy_right hderiv hMr_lt hs hx hy
      hess_pos hdiff_ne v

/--
The Schur lift is nonzero whenever its horizontal component is nonzero.  This
is the small injectivity fact needed to transfer strict positivity from the
full Hessian to the projected Schur Hessian.
-/
theorem barrierInfProjectionSchurLift_ne_zero_of_ne
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂) (x : E₁) {v : E₁}
    (hv : v ≠ 0) :
    barrierInfProjectionSchurLift selector hess invHyy x v ≠ 0 := by
  intro hlift
  apply hv
  have hfst := congrArg (fun w : WithLp 2 (E₁ × E₂) => w.fst) hlift
  simpa using hfst

/--
Strict positivity of the full Hessian transfers to strict positivity of the
Schur-complement projected Hessian through the standard Schur lift.
-/
theorem barrierInfProjectionSchurHessFrom_quadratic_pos_of_fullHessian_pos
    (selector : E₁ -> E₂)
    (hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂))
    (invHyy : E₁ -> E₂ →L[ℝ] E₂) (x : E₁)
    (hyy_right : ∀ w : E₂,
      barrierInfProjectionBlockYY selector hess x (invHyy x w) = w)
    (hfull_pos : ∀ w : WithLp 2 (E₁ × E₂), w ≠ 0 ->
      0 < inner ℝ w (hess (barrierInfProjectionPoint selector x) w)) :
    ∀ v : E₁, v ≠ 0 ->
      0 < inner ℝ v
        (barrierInfProjectionSchurHessFrom selector hess invHyy x v) := by
  intro v hv
  rw [barrierInfProjectionSchurHessFrom_quadratic_eq_lift_of_Hyy_right_inverse
    selector hess invHyy x v hyy_right]
  exact hfull_pos _ (barrierInfProjectionSchurLift_ne_zero_of_ne
    selector hess invHyy x hv)

/--
The packaged adjoint-square Schur-envelope model supplies strict positivity
of the projected Schur Hessian.  The proof combines the full Hessian
factorization `H = S^* S` with the completed-square Schur lift identity.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projectedSchurHess_quadratic_pos
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu) :
    ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ v : E₁, v ≠ 0 ->
        0 < inner ℝ v
          (barrierInfProjectionSchurHessFrom selector hess invHyy z v) := by
  intro z hz
  have hyy_right : ∀ w : E₂,
      barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
    intro w
    exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
      (H := barrierInfProjectionBlockYY selector hess z)
      (invH := invHyy z) (sqrtCoord := sqrtHyy z)
      (hmodel.hyy_hess_eq (x := z) hz)
      (hmodel.hyy_inv_eq (x := z) hz) w
  refine barrierInfProjectionSchurHessFrom_quadratic_pos_of_fullHessian_pos
    selector hess invHyy z hyy_right ?_
  intro w hw
  exact hessianQuadratic_pos_of_adjointSqrtCoord
    (H := hess (barrierInfProjectionPoint selector z))
    (sqrtCoord := sqrtFull (barrierInfProjectionPoint selector z))
    (hmodel.full_hess_eq (x := z) hz) hw

/--
Source-radius projected local-norm sandwich from the packaged adjoint-square
envelope model and source derivative data, with projected Hessian strict
positivity derived internally from the square-root model.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_ne
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hdiff_ne : y - x ≠ 0) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  exact
    hmodel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_hessianPositive
      hopen hgrad hhess hselector hinvDeriv hmixed_full hMr_lt hs hx hy
      hmodel.projectedSchurHess_quadratic_pos hdiff_ne

/--
Source-radius projected local-norm sandwich from the packaged adjoint-square
envelope model, with both projected Hessian positivity and the zero-displacement
case handled internally.  This is the source-facing local-norm transport gate
for the Schur-envelope route: the only remaining analytic inputs are the
concrete derivative data and the source-radius condition `M * ||y - x||_x < 1`.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_sourceRadius
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  by_cases hdiff : y - x = 0
  · have hyx : y = x := sub_eq_zero.mp hdiff
    subst y
    simp [localNorm_zero]
  · exact
      hmodel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_ne
        hopen hgrad hhess hselector hinvDeriv hmixed_full hMr_lt hs hx hy hdiff

/--
Source-radius projected local-norm sandwich from an already-built
Schur-Hessian derivative certificate.  This is the direct local-norm consumer
for the exact inf-projection route: it does not need selected-value
first/second-order envelope data, only the Schur derivative certificate and
the adjoint-square model's positivity/inverse identities.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  by_cases hdiff : y - x = 0
  · have hyx : y = x := sub_eq_zero.mp hdiff
    subst y
    simp [localNorm_zero]
  · let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
        ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
      intro z hz w
      exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
        (H := barrierInfProjectionBlockYY selector hess z)
        (invH := invHyy z) (sqrtCoord := sqrtHyy z)
        (hmodel.hyy_hess_eq (x := z) hz)
        (hmodel.hyy_inv_eq (x := z) hz) w
    exact
      BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply_sourceRadius
        hmodel.selector_stationary
        (hbar := hmodel.barrier) hyy_right hschur hMr_lt hs hx hy
        hmodel.projectedSchurHess_quadratic_pos hdiff v

/--
Source-radius projected local-norm sandwich from the packaged adjoint-square
envelope model and source full-Hessian derivative data, routed through the
direct Schur-derivative consumer.  This is the short full-Hessian source gate:
the source data first builds the Schur derivative certificate, and the direct
consumer supplies the zero-displacement split and projected positivity.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_direct
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  let hschur :=
    hmodel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen
      hopen hgrad hhess hselector hinvDeriv hmixed_full
  exact
    hmodel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn
      hschur hMr_lt hs hx hy

/--
Source-radius projected local-norm sandwich from an already-built third-order
selected-envelope certificate.  This is the direct consumer for the exact
inf-projection route: once the selected value has its Schur Hessian derivative
and canonical lifted-third pairing, the adjoint-square envelope model supplies
the positivity and inverse identities needed for the Lemma 13.6 transport.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_thirdOrderEnvelope
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (henv :
      BarrierInfProjectionThirdOrderEnvelopeOn s f selector grad hess invHyy
        third schurDeriv)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  exact
    hmodel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn
      henv.schur_deriv hMr_lt hs hx hy

/--
Source-radius projected local-norm sandwich from the scalar applied-Hessian
path derivative route.  This is useful when the exact source proof naturally
derives the one-dimensional identity
`d/dt <v, H_schur(z_t) v> = liftedThird(z_t, y - x, v)` before constructing a
full operator-valued Schur derivative certificate.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurApplyDeriv : E₁ -> ℝ -> E₁}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hschur_cont :
      ContinuousOn (barrierInfProjectionSchurHessFrom selector hess invHyy)
        (barrierInfProjectionSet s))
    (happly_deriv : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun τ : ℝ =>
            barrierInfProjectionSchurHessFrom selector hess invHyy
              (hessianSegmentPoint x y τ) w)
          (schurApplyDeriv w t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hmixed : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ w (schurApplyDeriv w t) =
          hessianSegmentMixedThirdPsiDeriv
            (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
            x y w t)
    (hsegment_coeff : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M *
            localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
              (hessianSegmentPoint x y t) (y - x) ≤
          2 * M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x) /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x) * t)) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
    intro z hz w
    exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
      (H := barrierInfProjectionBlockYY selector hess z)
      (invH := invHyy z) (sqrtCoord := sqrtHyy z)
      (hmodel.hyy_hess_eq (x := z) hz)
      (hmodel.hyy_inv_eq (x := z) hz) w
  exact
    hmodel.selector_stationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv
      (hbar := hmodel.barrier) hyy_right hMr_lt hs hx hy hschur_cont
      happly_deriv hmixed hsegment_coeff v

/--
Source-radius projected local-norm sandwich from the scalar applied-Hessian
path derivative route, with the Riccati segment coefficient derived internally.
The only analytic scalar inputs are continuity of the projected Schur Hessian
on the projected domain and the applied-vector derivative/pairing identity.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurApplyDeriv : E₁ -> ℝ -> E₁}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hschur_cont :
      ContinuousOn (barrierInfProjectionSchurHessFrom selector hess invHyy)
        (barrierInfProjectionSet s))
    (happly_deriv : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun τ : ℝ =>
            barrierInfProjectionSchurHessFrom selector hess invHyy
              (hessianSegmentPoint x y τ) w)
          (schurApplyDeriv w t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hmixed : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ w (schurApplyDeriv w t) =
          hessianSegmentMixedThirdPsiDeriv
            (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
            x y w t) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  by_cases hdiff : y - x = 0
  · have hyx : y = x := sub_eq_zero.mp hdiff
    subst y
    simp [localNorm_zero]
  · let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
        ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
      intro z hz w
      exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
        (H := barrierInfProjectionBlockYY selector hess z)
        (invH := invHyy z) (sqrtCoord := sqrtHyy z)
        (hmodel.hyy_hess_eq (x := z) hz)
        (hmodel.hyy_inv_eq (x := z) hz) w
    exact
      hmodel.selector_stationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius
        (hbar := hmodel.barrier) hyy_right hMr_lt hs hx hy
        hmodel.projectedSchurHess_quadratic_pos hdiff hschur_cont
        happly_deriv hmixed v

/--
Scalar source-radius projected local-norm sandwich with scalar continuity
supplied directly.  This is the weakest current adjoint-square route: it avoids
both an operator-valued Schur derivative certificate and an operator-valued
Schur-Hessian continuity hypothesis.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurApplyDeriv : E₁ -> ℝ -> E₁}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hpsi_cont : ∀ w : E₁,
      ContinuousOn
        (hessianSegmentPsi
          (barrierInfProjectionSchurHessFrom selector hess invHyy) x y w)
        (Set.Icc (0 : ℝ) 1))
    (hlocal_cont :
      ContinuousOn
        (fun t : ℝ =>
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            (hessianSegmentPoint x y t) (y - x))
        (Set.Icc (0 : ℝ) 1))
    (happly_deriv : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun τ : ℝ =>
            barrierInfProjectionSchurHessFrom selector hess invHyy
              (hessianSegmentPoint x y τ) w)
          (schurApplyDeriv w t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hmixed : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ w (schurApplyDeriv w t) =
          hessianSegmentMixedThirdPsiDeriv
            (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
            x y w t) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  by_cases hdiff : y - x = 0
  · have hyx : y = x := sub_eq_zero.mp hdiff
    subst y
    simp [localNorm_zero]
  · let hyy_right : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
        ∀ w : E₂, barrierInfProjectionBlockYY selector hess z (invHyy z w) = w := by
      intro z hz w
      exact continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv
        (H := barrierInfProjectionBlockYY selector hess z)
        (invH := invHyy z) (sqrtCoord := sqrtHyy z)
        (hmodel.hyy_hess_eq (x := z) hz)
        (hmodel.hyy_inv_eq (x := z) hz) w
    exact
      BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity
        (hsel := hmodel.selector_stationary) (hbar := hmodel.barrier)
        hyy_right hMr_lt hs hx hy hmodel.projectedSchurHess_quadratic_pos
        hdiff hpsi_cont hlocal_cont happly_deriv hmixed v

/--
Scalar source-radius projected local-norm sandwich with local-norm continuity
derived from the supplied quadratic-form continuity.  This is the current
weakest adjoint-square route for the segment local-norm transport step.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_psi_continuity
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurApplyDeriv : E₁ -> ℝ -> E₁}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (hpsi_cont : ∀ w : E₁,
      ContinuousOn
        (hessianSegmentPsi
          (barrierInfProjectionSchurHessFrom selector hess invHyy) x y w)
        (Set.Icc (0 : ℝ) 1))
    (happly_deriv : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun τ : ℝ =>
            barrierInfProjectionSchurHessFrom selector hess invHyy
              (hessianSegmentPoint x y τ) w)
          (schurApplyDeriv w t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hmixed : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ w (schurApplyDeriv w t) =
          hessianSegmentMixedThirdPsiDeriv
            (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
            x y w t) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  exact
    BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity
      (hmodel := hmodel) hMr_lt hs hx hy hpsi_cont
      (hessianSegmentLocalNorm_continuousOn_of_psi
        (hess := barrierInfProjectionSchurHessFrom selector hess invHyy)
        (x := x) (y := y) (hpsi_cont (y - x)))
      happly_deriv hmixed

/--
Scalar source-radius projected local-norm sandwich from continuity and
differentiability of the applied Schur-Hessian vector path.  This is the
source-facing adjoint-square route that avoids both operator-valued continuity
and separate quadratic-form continuity.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_apply_continuity
    [FiniteDimensional ℝ E₂] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {schurApplyDeriv : E₁ -> ℝ -> E₁}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s)
    (happly_cont : ∀ w : E₁,
      ContinuousOn
        (fun t : ℝ =>
          barrierInfProjectionSchurHessFrom selector hess invHyy
            (hessianSegmentPoint x y t) w)
        (Set.Icc (0 : ℝ) 1))
    (happly_deriv : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun τ : ℝ =>
            barrierInfProjectionSchurHessFrom selector hess invHyy
              (hessianSegmentPoint x y τ) w)
          (schurApplyDeriv w t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hmixed : ∀ w : E₁, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ w (schurApplyDeriv w t) =
          hessianSegmentMixedThirdPsiDeriv
            (barrierInfProjectionSchurLiftedThird selector hess invHyy third)
            x y w t) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  exact
    BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_psi_continuity
      (hmodel := hmodel) hMr_lt hs hx hy
      (by
        intro w
        exact hessianSegmentPsi_continuousOn_of_apply_continuousOn
          (hess := barrierInfProjectionSchurHessFrom selector hess invHyy)
          (x := x) (y := y) (v := w) (happly_cont w))
      happly_deriv hmixed

/--
Source-radius projected local-norm sandwich from a supplied Schur-Hessian
derivative certificate.  This is the theorem-facing adapter for the exact
inf-projection route after the Schur derivative has been built.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn_isOpen
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {schurDeriv : E₁ -> E₁ →L[ℝ] (E₁ →L[ℝ] E₁)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (_hopen : IsOpen (barrierInfProjectionSet s))
    (_hfgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (_hgrad : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector x))
        (barrierInfProjectionPoint selector x))
    (_hselector : ∀ ⦃x : E₁⦄, x ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector x) x)
    (hschur :
      BarrierInfProjectionSchurHessDerivativeOn s selector hess invHyy third
        schurDeriv)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) :=
  hmodel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn
    hschur hMr_lt hs hx hy

/--
Source-radius projected local-norm sandwich from the theorem-facing
full-Hessian derivative package.  This is the highest-level source consumer
for the current inf-projection Schur route: the selected-value first and
second derivative data plus the full-Hessian derivative/third-derivative
pairing first build the third-order envelope, and the envelope then supplies
the direct local-norm transport.
-/
theorem BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_envelope
    [FiniteDimensional ℝ E₂] [CompleteSpace E₁] [CompleteSpace E₂]
    [CompleteSpace (WithLp 2 (E₁ × E₂))]
    {s : Set (WithLp 2 (E₁ × E₂))}
    {f : WithLp 2 (E₁ × E₂) -> ℝ}
    {selector : E₁ -> E₂}
    {hess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {grad : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂)}
    {invHess : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) →L[ℝ]
      WithLp 2 (E₁ × E₂)}
    {third : WithLp 2 (E₁ × E₂) -> WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) -> ℝ}
    {invHyy : E₁ -> E₂ →L[ℝ] E₂}
    {sqrtFull : WithLp 2 (E₁ × E₂) ->
      WithLp 2 (E₁ × E₂) ≃L[ℝ] WithLp 2 (E₁ × E₂)}
    {sqrtHyy : E₁ -> E₂ ≃L[ℝ] E₂} {M nu : ℝ}
    {hessDeriv : E₁ -> WithLp 2 (E₁ × E₂) →L[ℝ]
      ((WithLp 2 (E₁ × E₂)) →L[ℝ] WithLp 2 (E₁ × E₂))}
    {dselector : E₁ -> E₁ →L[ℝ] E₂}
    {invHyyDeriv : E₁ -> E₁ →L[ℝ] (E₂ →L[ℝ] E₂)}
    {x y v : E₁}
    (hmodel :
      BarrierInfProjectionAdjointSqrtEnvelopeModel s selector hess grad invHess
        third invHyy sqrtFull sqrtHyy M nu)
    (hopen : IsOpen (barrierInfProjectionSet s))
    (hfgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasGradientAt f (grad (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hgrad : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt grad (hess (barrierInfProjectionPoint selector z))
        (barrierInfProjectionPoint selector z))
    (hhess : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt hess (hessDeriv z) (barrierInfProjectionPoint selector z))
    (hselector : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt selector (dselector z) z)
    (hinvDeriv : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      HasFDerivAt invHyy (invHyyDeriv z) z)
    (hmixed_full : ∀ ⦃z : E₁⦄, z ∈ barrierInfProjectionSet s ->
      ∀ a v : WithLp 2 (E₁ × E₂),
        inner ℝ v ((hessDeriv z a) v) =
          third (barrierInfProjectionPoint selector z) a v)
    (hMr_lt :
      M *
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
            x (y - x) < 1)
    (hs : Convex ℝ (barrierInfProjectionSet s))
    (hx : x ∈ barrierInfProjectionSet s)
    (hy : y ∈ barrierInfProjectionSet s) :
    (1 - M *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
          x (y - x)) *
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v ≤
      localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ∧
        localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) y v ≤
          localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy) x v /
            (1 - M *
              localNorm (barrierInfProjectionSchurHessFrom selector hess invHyy)
                x (y - x)) := by
  let henv :=
    hmodel.thirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen
      hopen hfgrad hgrad hhess hselector hinvDeriv hmixed_full
  exact
    hmodel.projected_localNorm_sandwich_sourceRadius_of_thirdOrderEnvelope
      henv hMr_lt hs hx hy

end InfProjectionSchurSymmetry

end Optimization
end StatInference
