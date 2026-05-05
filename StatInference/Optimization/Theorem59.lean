import StatInference.Optimization.Theorem58

/-!
# Chewi Theorem 5.9 strongly-convex accelerated gradient-flow layer

Chewi states the strongly-convex AGF convergence theorem and leaves the proof
to Exercise 5.3.  This module starts the reusable Lyapunov route.  The natural
energy is
`f x_t - f_* + 1 / 2 * ‖p_t + sqrt(alpha) • (x_t - x_*)‖^2`,
which is equivalent to the source-style shifted point
`x_t + (1 / sqrt(alpha)) • p_t` when `alpha > 0`.
-/

namespace StatInference
namespace Optimization

open Set Filter
open scoped Topology
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Chewi Theorem 5.9 constant friction `γ_t = 2 sqrt(alpha)`. -/
noncomputable def chewi59Friction (alpha : ℝ) (_t : ℝ) : ℝ :=
  2 * Real.sqrt alpha

/-- Source-shaped AGF interface for Chewi Theorem 5.9. -/
def IsChewi59AcceleratedGradientFlowTrajectory (alpha : ℝ)
    (grad : E -> E) (x p : ℝ -> E) : Prop :=
  IsAcceleratedGradientFlowTrajectory grad (chewi59Friction alpha) x p

/--
The strongly-convex AGF Lyapunov vector
`p_t + sqrt(alpha) • (x_t - x_*)`.
-/
noncomputable def chewi59EnergyVector (alpha : ℝ)
    (x p : ℝ -> E) (xStar : E) (t : ℝ) : E :=
  p t + Real.sqrt alpha • (x t - xStar)

/--
Chewi Theorem 5.9 Lyapunov energy:
`f x_t - f_* + 1/2 ‖p_t + sqrt(alpha) • (x_t - x_*)‖^2`.
-/
noncomputable def chewi59Lyapunov (alpha : ℝ) (f : E -> ℝ) (fstar : ℝ)
    (x p : ℝ -> E) (xStar : E) (t : ℝ) : ℝ :=
  f (x t) - fstar +
    ((1 : ℝ) / 2) * ‖chewi59EnergyVector alpha x p xStar t‖ ^ (2 : ℕ)

/-- Function-gap derivative along a generic AGF trajectory. -/
theorem agf_gap_hasDerivAt
    [CompleteSpace E] {f : E -> ℝ} {grad : E -> E} {gamma : ℝ -> ℝ}
    {x p : ℝ -> E} {fstar t : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsAcceleratedGradientFlowTrajectory grad gamma x p) :
    HasDerivAt (fun s => f (x s) - fstar)
      (inner ℝ (grad (x t)) (p t)) t := by
  have hcomp :=
    (hgrad (x t)).hasFDerivAt.comp_hasDerivAt (x := t) (hflow.1 t)
  simpa [InnerProductSpace.toDual_apply_apply] using hcomp.sub_const fstar

/--
Derivative of the Theorem 5.9 Lyapunov vector.  The constant friction
`2 sqrt(alpha)` leaves `q'_t = -∇f(x_t) - sqrt(alpha) p_t`.
-/
theorem chewi59EnergyVector_hasDerivAt
    {alpha : ℝ} {grad : E -> E} {x p : ℝ -> E} {xStar : E} {t : ℝ}
    (hflow : IsChewi59AcceleratedGradientFlowTrajectory alpha grad x p) :
    HasDerivAt (chewi59EnergyVector alpha x p xStar)
      (-(grad (x t)) - Real.sqrt alpha • p t) t := by
  have hpos :
      HasDerivAt (fun s => x s - xStar) (p t) t := by
    simpa using (hflow.1 t).sub_const xStar
  have hscaled :
      HasDerivAt
        (fun s => Real.sqrt alpha • (x s - xStar))
        (Real.sqrt alpha • p t) t := by
    simpa using hpos.const_smul (Real.sqrt alpha)
  have hraw :
      HasDerivAt
        (fun s => p s + Real.sqrt alpha • (x s - xStar))
        ((-(grad (x t)) - chewi59Friction alpha t • p t) +
          Real.sqrt alpha • p t) t :=
    (hflow.2 t).add hscaled
  have hderiv :
      (-(grad (x t)) - chewi59Friction alpha t • p t) +
          Real.sqrt alpha • p t =
        -(grad (x t)) - Real.sqrt alpha • p t := by
    rw [chewi59Friction]
    module
  have hraw' :
      HasDerivAt
        (fun s => p s + Real.sqrt alpha • (x s - xStar))
        (-(grad (x t)) - Real.sqrt alpha • p t) t := by
    convert hraw using 1
    exact hderiv.symm
  simpa [chewi59EnergyVector] using hraw'

/--
Raw derivative formula for the strongly-convex AGF Lyapunov energy.  The next
layer simplifies this expression with strong convexity to obtain
`L'_t <= -sqrt(alpha) * L_t`.
-/
theorem chewi59Lyapunov_hasDerivAt_raw
    [CompleteSpace E] {alpha : ℝ} {f : E -> ℝ} {grad : E -> E}
    {fstar : ℝ} {x p : ℝ -> E} {xStar : E} {t : ℝ}
    (hgrad : ∀ z, HasGradientAt f (grad z) z)
    (hflow : IsChewi59AcceleratedGradientFlowTrajectory alpha grad x p) :
    HasDerivAt (chewi59Lyapunov alpha f fstar x p xStar)
      (inner ℝ (grad (x t)) (p t) +
        inner ℝ (chewi59EnergyVector alpha x p xStar t)
          (-(grad (x t)) - Real.sqrt alpha • p t)) t := by
  have hgap :
      HasDerivAt (fun s => f (x s) - fstar)
        (inner ℝ (grad (x t)) (p t)) t :=
    agf_gap_hasDerivAt hgrad hflow
  have henergy :
      HasDerivAt (chewi59EnergyVector alpha x p xStar)
        (-(grad (x t)) - Real.sqrt alpha • p t) t :=
    chewi59EnergyVector_hasDerivAt hflow
  have hnorm := henergy.norm_sq
  have hscaled := hnorm.const_mul ((1 : ℝ) / 2)
  convert hgap.add hscaled using 1
  ring

/-- At zero momentum, the Theorem 5.9 Lyapunov vector starts at `sqrt(alpha) • (x_0 - x_*)`. -/
theorem chewi59EnergyVector_zero_of_momentum_zero
    (alpha : ℝ) (x p : ℝ -> E) (xStar : E)
    (hp0 : p 0 = 0) :
    chewi59EnergyVector alpha x p xStar 0 =
      Real.sqrt alpha • (x 0 - xStar) := by
  simp [chewi59EnergyVector, hp0]

end Optimization
end StatInference
