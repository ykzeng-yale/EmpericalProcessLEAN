import StatInference.Optimization.Basic

/-!
# Chewi minimizer uniqueness layer

This module formalizes the main-text minimizer uniqueness spine around Chewi
Lemma 1.10 and Corollary 1.11.  It reuses mathlib's
`StrictConvexOn.eq_of_isMinOn` for the strict-convexity argument, bridges the
local Chewi strong-convexity interface to mathlib strict convexity when
`alpha > 0`, and packages the first-order supplied interface for the
gradient-zero characterization.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Positive Chewi strong convexity implies mathlib strict convexity.

This is the reusable bridge from Definition 1.5 to the strict-convexity
surface used by mathlib's minimizer uniqueness theorem.
-/
theorem StrongConvexOn.strictConvexOn {C : Set E} {f : E -> ℝ}
    {alpha : ℝ} (h : StrongConvexOn C f alpha) (halpha : 0 < alpha) :
    StrictConvexOn ℝ C f := by
  refine ⟨h.convex_set, ?_⟩
  intro x hx y hy hxy a b ha hb hab
  have hb_mem : b ∈ Icc (0 : ℝ) 1 := by
    constructor
    · exact hb.le
    · nlinarith
  have hseg := h.segment_ineq hx hy (t := b) hb_mem
  have hsub_ne : y - x ≠ 0 := sub_ne_zero.mpr (Ne.symm hxy)
  have hnormsq_pos : 0 < ‖y - x‖ ^ (2 : ℕ) := by
    exact sq_pos_of_pos (norm_pos_iff.mpr hsub_ne)
  have hone_sub_b_pos : 0 < 1 - b := by nlinarith
  have halpha_half_pos : 0 < alpha / 2 := by nlinarith
  have hcorr_pos :
      0 < (alpha / 2) * b * (1 - b) * ‖y - x‖ ^ (2 : ℕ) := by
    exact mul_pos
      (mul_pos (mul_pos halpha_half_pos hb) hone_sub_b_pos)
      hnormsq_pos
  have hlt_segment :
      f ((1 - b) • x + b • y) < (1 - b) * f x + b * f y := by
    exact lt_of_le_of_lt hseg (by nlinarith [hcorr_pos])
  have ha_eq : a = 1 - b := by nlinarith
  simpa [ha_eq, smul_eq_mul] using hlt_segment

/--
Chewi Lemma 1.10: a strictly convex function has at most one minimizer.
-/
theorem minimizer_unique_of_strictConvexOn {C : Set E} {f : E -> ℝ}
    {x y : E} (hstrict : StrictConvexOn ℝ C f)
    (hx : x ∈ C) (hy : y ∈ C)
    (hminx : IsMinOn f C x) (hminy : IsMinOn f C y) :
    x = y :=
  hstrict.eq_of_isMinOn hminx hminy hx hy

/--
Chewi Lemma 1.10 specialized to the local positive strong-convexity interface.
-/
theorem minimizer_unique_of_strongConvexOn {C : Set E} {f : E -> ℝ}
    {alpha : ℝ} {x y : E}
    (hstrong : StrongConvexOn C f alpha) (halpha : 0 < alpha)
    (hx : x ∈ C) (hy : y ∈ C)
    (hminx : IsMinOn f C x) (hminy : IsMinOn f C y) :
    x = y :=
  (hstrong.strictConvexOn halpha).eq_of_isMinOn hminx hminy hx hy

/--
Existence plus strict convexity gives a unique minimizer.
-/
theorem existsUnique_minimizer_of_strictConvexOn {C : Set E} {f : E -> ℝ}
    (hstrict : StrictConvexOn ℝ C f)
    (hexists : ∃ x, x ∈ C ∧ IsMinOn f C x) :
    ∃! x, x ∈ C ∧ IsMinOn f C x := by
  rcases hexists with ⟨x, hx, hminx⟩
  refine ⟨x, ⟨hx, hminx⟩, ?_⟩
  intro y hy
  exact (minimizer_unique_of_strictConvexOn (x := x) (y := y)
    hstrict hx hy.1 hminx hy.2).symm

/--
Existence plus positive Chewi strong convexity gives a unique minimizer.
-/
theorem existsUnique_minimizer_of_strongConvexOn {C : Set E} {f : E -> ℝ}
    {alpha : ℝ}
    (hstrong : StrongConvexOn C f alpha) (halpha : 0 < alpha)
    (hexists : ∃ x, x ∈ C ∧ IsMinOn f C x) :
    ∃! x, x ∈ C ∧ IsMinOn f C x :=
  existsUnique_minimizer_of_strictConvexOn
    (hstrong.strictConvexOn halpha) hexists

/--
Chewi Lemma 1.9 / Corollary 1.11 supplied interface: a zero supplied gradient
is globally optimal under the first-order strong-convexity lower model.
-/
theorem isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {x : E}
    (hfo : FirstOrderStrongConvexOn C f grad alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (hx : x ∈ C)
    (hgrad : grad x = 0) :
    IsMinOn f C x := by
  rw [isMinOn_iff]
  intro y hy
  have hmodel := hfo.lower_model hx hy
  have hmodel' :
      f x + (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) ≤ f y := by
    simpa [hgrad] using hmodel
  have hcorr_nonneg : 0 ≤ (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) := by
    have hsq : 0 ≤ ‖y - x‖ ^ (2 : ℕ) := sq_nonneg _
    nlinarith
  nlinarith

/--
Positive first-order strong convexity has at most one zero of the supplied
gradient oracle.
-/
theorem gradient_eq_zero_unique_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {x y : E}
    (hfo : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hx : x ∈ C) (hy : y ∈ C)
    (hgx : grad x = 0) (hgy : grad y = 0) :
    x = y := by
  by_contra hxy
  have hsub_ne : y - x ≠ 0 := sub_ne_zero.mpr (Ne.symm hxy)
  have hnormsq_pos : 0 < ‖y - x‖ ^ (2 : ℕ) := by
    exact sq_pos_of_pos (norm_pos_iff.mpr hsub_ne)
  have hxy_model :
      f x + (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) ≤ f y := by
    simpa [hgx] using hfo.lower_model hx hy
  have hyx_model :
      f y + (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) ≤ f x := by
    simpa [hgy, norm_sub_rev] using hfo.lower_model hy hx
  have hcorr_pos : 0 < (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) := by
    have halpha_half_pos : 0 < alpha / 2 := by nlinarith
    exact mul_pos halpha_half_pos hnormsq_pos
  nlinarith

/--
Corollary 1.11 characterization interface: on the domain, minimizers are
exactly zeros of the supplied gradient oracle.
-/
theorem isMinOn_iff_gradient_eq_zero_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {x : E}
    (hfo : FirstOrderStrongConvexOn C f grad alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (hx : x ∈ C)
    (hnecessary : ∀ ⦃z⦄, z ∈ C -> IsMinOn f C z -> grad z = 0) :
    IsMinOn f C x ↔ grad x = 0 := by
  constructor
  · intro hmin
    exact hnecessary hx hmin
  · intro hgrad
    exact isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero
      hfo halpha_nonneg hx hgrad

/--
Source-shaped Corollary 1.11 supplied interface: the unique minimizer exists
and is characterized by zero supplied gradient.
-/
theorem existsUnique_minimizer_gradient_zero_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    (hfo : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hnecessary : ∀ ⦃z⦄, z ∈ C -> IsMinOn f C z -> grad z = 0)
    (hexists_zero : ∃ x, x ∈ C ∧ grad x = 0) :
    ∃! x, x ∈ C ∧ IsMinOn f C x ∧ grad x = 0 := by
  rcases hexists_zero with ⟨x, hx, hgx⟩
  have hminx : IsMinOn f C x :=
    isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero
      hfo halpha.le hx hgx
  have hgx_from_min : grad x = 0 := hnecessary hx hminx
  refine ⟨x, ⟨hx, hminx, hgx_from_min⟩, ?_⟩
  intro y hy
  exact (gradient_eq_zero_unique_of_firstOrderStrongConvexOn (x := x) (y := y)
    hfo halpha hx hy.1 hgx hy.2.2).symm

/--
Corollary 1.11 minimizer-only uniqueness from a supplied stationary point and
a supplied first-order necessary condition.
-/
theorem existsUnique_minimizer_of_firstOrderStrongConvexOn
    {C : Set E} {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    (hfo : FirstOrderStrongConvexOn C f grad alpha)
    (halpha : 0 < alpha)
    (hnecessary : ∀ ⦃z⦄, z ∈ C -> IsMinOn f C z -> grad z = 0)
    (hexists_zero : ∃ x, x ∈ C ∧ grad x = 0) :
    ∃! x, x ∈ C ∧ IsMinOn f C x := by
  rcases hexists_zero with ⟨x, hx, hgx⟩
  have hminx : IsMinOn f C x :=
    isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero
      hfo halpha.le hx hgx
  refine ⟨x, ⟨hx, hminx⟩, ?_⟩
  intro y hy
  have hgy : grad y = 0 := hnecessary hy.1 hy.2
  exact (gradient_eq_zero_unique_of_firstOrderStrongConvexOn (x := x) (y := y)
    hfo halpha hx hy.1 hgx hgy).symm

section MathlibGradient

variable [CompleteSpace E]

/--
Unconstrained first-order necessary condition: a global minimizer with a
mathlib gradient has zero gradient.
-/
theorem gradient_eq_zero_of_isMinOn_univ_hasGradientAt
    {f : E -> ℝ} {grad x : E}
    (hmin : IsMinOn f Set.univ x)
    (hgrad : HasGradientAt f grad x) :
    grad = 0 := by
  have hlocal : IsLocalMin f x := hmin.isLocalMin (by simp)
  have hdual : (InnerProductSpace.toDual ℝ E) grad = 0 := by
    simpa using hlocal.hasFDerivAt_eq_zero hgrad.hasFDerivAt
  exact (InnerProductSpace.toDual ℝ E).injective (by simpa using hdual)

/--
Corollary 1.11 characterization on the whole space, using the supplied
first-order lower model for sufficiency and mathlib's gradient necessary
condition for necessity.
-/
theorem isMinOn_univ_iff_gradient_eq_zero_of_firstOrderStrongConvexOn
    {f : E -> ℝ} {grad : E -> E} {alpha : ℝ} {x : E}
    (hfo : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (halpha_nonneg : 0 ≤ alpha)
    (hgrad_at : ∀ z, HasGradientAt f (grad z) z) :
    IsMinOn f Set.univ x ↔ grad x = 0 :=
  isMinOn_iff_gradient_eq_zero_of_firstOrderStrongConvexOn
    hfo halpha_nonneg (by simp)
    (fun {z} _hz hmin =>
      gradient_eq_zero_of_isMinOn_univ_hasGradientAt hmin (hgrad_at z))

/--
Source-shaped Corollary 1.11 on the whole space: a positive first-order
strongly convex function with a stationary point has a unique minimizer, and
the minimizer is characterized by zero mathlib gradient.
-/
theorem existsUnique_minimizer_gradient_zero_univ_of_firstOrderStrongConvexOn
    {f : E -> ℝ} {grad : E -> E} {alpha : ℝ}
    (hfo : FirstOrderStrongConvexOn Set.univ f grad alpha)
    (halpha : 0 < alpha)
    (hgrad_at : ∀ z, HasGradientAt f (grad z) z)
    (hexists_zero : ∃ x, grad x = 0) :
    ∃! x, IsMinOn f Set.univ x ∧ grad x = 0 := by
  have hexists_zero' : ∃ x, x ∈ Set.univ ∧ grad x = 0 := by
    rcases hexists_zero with ⟨x, hx⟩
    exact ⟨x, by simp, hx⟩
  rcases existsUnique_minimizer_gradient_zero_of_firstOrderStrongConvexOn
      hfo halpha
      (fun {z} _hz hmin =>
        gradient_eq_zero_of_isMinOn_univ_hasGradientAt hmin (hgrad_at z))
      hexists_zero' with ⟨x, hx, huniq⟩
  refine ⟨x, ⟨hx.2.1, hx.2.2⟩, ?_⟩
  intro y hy
  exact huniq y ⟨by simp, hy.1, hy.2⟩

end MathlibGradient

end Optimization
end StatInference
