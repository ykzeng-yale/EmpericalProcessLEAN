import StatInference.Optimization.GradientDescent

/-!
# Chewi Theorem 3.3 contraction layer

This module proves the algebraic contraction estimate in Chewi Theorem 3.3
from two source-shaped supplied interfaces: strong monotonicity of the gradient
and the Exercise 3.1 co-coercive step inequality.
-/

namespace StatInference
namespace Optimization

open Set
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Theorem 3.3, squared-distance form, from supplied gradient monotonicity
and the Exercise 3.1 co-coercivity inequality.
-/
theorem gradientStep_sqdist_contract_of_strongMonotone_cocoercive
    {C : Set E} {grad : E -> E} {alpha h : ℝ} {x y : E}
    (hmono : StronglyMonotoneGradientOn C grad alpha)
    (hcoco : GradientStepCocoerciveOn C grad h)
    (hh_nonneg : 0 ≤ h)
    (hx : x ∈ C) (hy : y ∈ C) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ^ (2 : ℕ) ≤
      (1 - alpha * h) * ‖y - x‖ ^ (2 : ℕ) := by
  let d : E := y - x
  let dg : E := grad y - grad x
  have hstep_sub :
      gradientDescentStep grad h y - gradientDescentStep grad h x =
        d - h • dg := by
    simp [d, dg, gradientDescentStep, smul_sub]
    abel
  have hmono' :
      alpha * ‖d‖ ^ (2 : ℕ) ≤ inner ℝ dg d := by
    simpa [d, dg] using hmono.inner_lower hx hy
  have hcoco' :
      h * ‖dg‖ ^ (2 : ℕ) ≤ inner ℝ d dg := by
    simpa [d, dg] using hcoco.inner_lower hx hy
  have hcoco_mul :
      h ^ (2 : ℕ) * ‖dg‖ ^ (2 : ℕ) ≤ h * inner ℝ d dg := by
    have hmul := mul_le_mul_of_nonneg_left hcoco' hh_nonneg
    simpa [pow_two, mul_assoc, mul_left_comm, mul_comm] using hmul
  have hmono_mul :
      alpha * h * ‖d‖ ^ (2 : ℕ) ≤ h * inner ℝ d dg := by
    have hmul := mul_le_mul_of_nonneg_left hmono' hh_nonneg
    simpa [real_inner_comm, mul_assoc, mul_left_comm, mul_comm] using hmul
  rw [hstep_sub, norm_sub_sq_real, real_inner_smul_right, norm_smul,
    Real.norm_eq_abs, abs_of_nonneg hh_nonneg]
  nlinarith

/--
Chewi Theorem 3.3, norm form, obtained from the squared-distance contraction
when the contraction factor is nonnegative.
-/
theorem gradientStep_dist_contract_of_strongMonotone_cocoercive
    {C : Set E} {grad : E -> E} {alpha h : ℝ} {x y : E}
    (hmono : StronglyMonotoneGradientOn C grad alpha)
    (hcoco : GradientStepCocoerciveOn C grad h)
    (hh_nonneg : 0 ≤ h)
    (hfactor_nonneg : 0 ≤ 1 - alpha * h)
    (hx : x ∈ C) (hy : y ∈ C) :
    ‖gradientDescentStep grad h y - gradientDescentStep grad h x‖ ≤
      Real.sqrt (1 - alpha * h) * ‖y - x‖ := by
  have hsquare :=
    gradientStep_sqdist_contract_of_strongMonotone_cocoercive
      hmono hcoco hh_nonneg hx hy
  have hrhs_nonneg :
      0 ≤ Real.sqrt (1 - alpha * h) * ‖y - x‖ :=
    mul_nonneg (Real.sqrt_nonneg _) (norm_nonneg _)
  exact (sq_le_sq₀ (norm_nonneg _) hrhs_nonneg).mp (by
    rw [mul_pow, Real.sq_sqrt hfactor_nonneg]
    exact hsquare)

end Optimization
end StatInference
