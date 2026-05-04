import StatInference.Optimization.GradientFlow

/-!
# Chewi Proposition 2.7

This module starts the main-text implications around the Polyak-Lojasiewicz
inequality.  The first compiled block proves the source implication
`strong convexity => PL` from the already compiled first-order lower model.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Proposition 2.7, first implication, in first-order lower-model form:
positive strong convexity implies the Polyak-Lojasiewicz inequality with
reference value `f xStar`.

The proof is the textbook argument: set `y = xStar` in the first-order lower
model, use Cauchy-Schwarz, then apply Young's inequality.
-/
theorem polyakLojasiewiczOn_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hxStar : xStar ∈ C) :
    PolyakLojasiewiczOn C f grad alpha (f xStar) := by
  intro x hx
  let dvec : E := x - xStar
  let r : ℝ := ‖grad x‖
  let d : ℝ := ‖dvec‖
  have hmodel := hfirst.lower_model hx hxStar
  have hmodel' :
      f x - f xStar ≤
        inner ℝ (grad x) dvec - (alpha / 2) * d ^ (2 : ℕ) := by
    dsimp [dvec, d]
    have hinner : inner ℝ (grad x) (xStar - x) =
        -inner ℝ (grad x) (x - xStar) := by
      have hsub : xStar - x = -(x - xStar) := by
        simp
      rw [hsub, inner_neg_right]
    have hnorm : ‖xStar - x‖ ^ (2 : ℕ) = ‖x - xStar‖ ^ (2 : ℕ) := by
      rw [norm_sub_rev]
    rw [hinner, hnorm] at hmodel
    nlinarith
  have hinner_le : inner ℝ (grad x) dvec ≤ r * d := by
    simpa [r, d] using real_inner_le_norm (grad x) dvec
  have hgap_le :
      f x - f xStar ≤ r * d - (alpha / 2) * d ^ (2 : ℕ) := by
    nlinarith
  have hyoung :
      r * d - (alpha / 2) * d ^ (2 : ℕ) ≤
        r ^ (2 : ℕ) / (2 * alpha) := by
    have h2a : 0 < 2 * alpha := by
      nlinarith
    rw [le_div_iff₀ h2a]
    have hsquare : 0 ≤ (r - alpha * d) ^ (2 : ℕ) := sq_nonneg _
    nlinarith
  have hgap_le2 : f x - f xStar ≤ r ^ (2 : ℕ) / (2 * alpha) :=
    hgap_le.trans hyoung
  have hmul :
      2 * alpha * (f x - f xStar) ≤
        2 * alpha * (r ^ (2 : ℕ) / (2 * alpha)) :=
    mul_le_mul_of_nonneg_left hgap_le2 (by nlinarith)
  have hcancel : 2 * alpha * (r ^ (2 : ℕ) / (2 * alpha)) =
      r ^ (2 : ℕ) := by
    field_simp [halpha.ne']
  rw [hcancel] at hmul
  simpa [r] using hmul

/--
Chewi Proposition 2.7, first implication, from whole-space segment strong
convexity plus mathlib gradients.
-/
theorem polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E}
    {alpha : ℝ} {xStar : E}
    (hstrong : StrongConvexOn Set.univ f alpha)
    (hgrad : ∀ x, HasGradientAt f (grad x) x)
    (halpha : 0 < alpha) :
    PolyakLojasiewiczOn Set.univ f grad alpha (f xStar) :=
  polyakLojasiewiczOn_of_firstOrderStrongConvexOn
    (FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt
      hstrong hgrad)
    halpha (by simp)

/--
Chewi Proposition 2.7, first implication, in source minimizer notation.  The
minimizer hypothesis records the textbook role of `xStar`; the proof itself
uses only the first-order lower model at `xStar`.
-/
theorem polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {xStar : E}
    (hfirst : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hxStar : xStar ∈ C)
    (_hmin : IsMinOn f C xStar) :
    PolyakLojasiewiczOn C f grad alpha (f xStar) :=
  polyakLojasiewiczOn_of_firstOrderStrongConvexOn
    hfirst halpha hxStar

end Optimization
end StatInference
