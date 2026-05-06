import StatInference.AsymptoticStatistics.Basic

/-!
# van der Vaart 1998 Chapter 4 moment-estimator interfaces

This module starts the source-shaped Chapter 4 lane for A. W. van der Vaart,
*Asymptotic Statistics* (1998), Section 4.1.  The first layer packages the
method-of-moments asymptotic-normality proof as the handoff used in the text:
an empirical-moment CLT followed by the Chapter 3 delta method applied to the
local inverse of the theoretical moment map.
-/

noncomputable section

namespace StatInference
namespace AsymptoticStatistics

open Filter MeasureTheory ProbabilityTheory
open scoped BigOperators Real Topology

universe u v w x

/-- The textbook rate `sqrt n` tends to infinity. -/
theorem vaart1998_sqrt_nat_tendsto_atTop :
    Tendsto (fun n : ℕ => √(n : ℝ)) atTop atTop :=
  Real.tendsto_sqrt_atTop.comp tendsto_natCast_atTop_atTop

/--
Local inverse data for van der Vaart Theorem 4.1.

The textbook obtains these fields from the inverse function theorem.  Keeping
them as a certificate lets the Chapter 4 asymptotic-normality proof compile
while later work fills in the inverse-function and existence-with-probability
layers separately.
-/
structure Vaart1998MomentLocalInverseCertificate (M Θ : Type*)
    [NormedAddCommGroup M] [NormedSpace ℝ M] [MeasurableSpace M]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ] [MeasurableSpace Θ] where
  /-- The theoretical moment map `e(theta) = P_theta f`. -/
  e : Θ -> M
  /-- A local inverse of the theoretical moment map near `eta0`. -/
  eInv : M -> Θ
  /-- The true theoretical moment, `e theta0`. -/
  eta0 : M
  /-- The true parameter. -/
  theta0 : Θ
  /-- The derivative of the local inverse at `eta0`. -/
  Dinv : M →L[ℝ] Θ
  /-- The source identity `eta0 = e theta0`, oriented for rewriting moments. -/
  eta0_eq : e theta0 = eta0
  /-- The local inverse sends the true moment back to the true parameter. -/
  inverse_at_eta0 : eInv eta0 = theta0
  /-- Differentiability of the local inverse, supplied by the inverse function theorem. -/
  inverse_deriv : HasFDerivAt eInv Dinv eta0
  /-- Measurability needed to discharge the Chapter 3 delta-method remainder. -/
  inverse_measurable : Measurable eInv

/--
van der Vaart 1998, Theorem 4.1, method-of-moments delta handoff.

This theorem is the compiled Chapter 4 proof spine: once the empirical moments
have a scaled distributional limit and the local inverse of the theoretical
moment map is differentiable and measurable, the moment estimator inherits the
linear image limit by Theorem 3.1.
-/
theorem vaart1998_theorem_4_1_moment_estimator_delta_method
    {Ω : Type u} {Ω' : Type v} {M : Type w} {Θ : Type x}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup M] [NormedSpace ℝ M]
    [MeasurableSpace M] [SecondCountableTopology M] [BorelSpace M]
    [OpensMeasurableSpace M] [CompleteSpace M]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    {empiricalMoment : ℕ -> Ω -> M} {Z : Ω' -> M}
    {eInv : M -> Θ} {eta0 : M} {theta0 : Θ} {r : ℕ -> ℝ}
    (Dinv : M →L[ℝ] Θ)
    (hInv_deriv : HasFDerivAt eInv Dinv eta0)
    (hInv_meas : Measurable eInv)
    (heta0 : eInv eta0 = theta0)
    (hr : Tendsto r atTop atTop)
    (hCLT : TendstoInDistribution
      (fun n ω => r n • (empiricalMoment n ω - eta0)) atTop Z (fun _ => P) Q)
    (hEmpiricalMoment : ∀ n, AEMeasurable (empiricalMoment n) P) :
    TendstoInDistribution
      (fun n ω => r n • (eInv (empiricalMoment n ω) - theta0)) atTop
      (fun ω => Dinv (Z ω)) (fun _ => P) Q := by
  simpa [heta0] using
    vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution_measurable
      (Tn := empiricalMoment) (T := Z) (phi := eInv) (theta := eta0)
      (r := r) (L := Dinv) hInv_deriv hInv_meas hr hCLT
      hEmpiricalMoment

/--
van der Vaart 1998, Theorem 4.1, method-of-moments `sqrt n` form.

This is the same Chapter 4 handoff with the textbook rate fixed to `sqrt n`.
-/
theorem vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method
    {Ω : Type u} {Ω' : Type v} {M : Type w} {Θ : Type x}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup M] [NormedSpace ℝ M]
    [MeasurableSpace M] [SecondCountableTopology M] [BorelSpace M]
    [OpensMeasurableSpace M] [CompleteSpace M]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    {empiricalMoment : ℕ -> Ω -> M} {Z : Ω' -> M}
    {eInv : M -> Θ} {eta0 : M} {theta0 : Θ}
    (Dinv : M →L[ℝ] Θ)
    (hInv_deriv : HasFDerivAt eInv Dinv eta0)
    (hInv_meas : Measurable eInv)
    (heta0 : eInv eta0 = theta0)
    (hCLT : TendstoInDistribution
      (fun (n : ℕ) ω => √(n : ℝ) • (empiricalMoment n ω - eta0)) atTop Z
        (fun _ => P) Q)
    (hEmpiricalMoment : ∀ n, AEMeasurable (empiricalMoment n) P) :
    TendstoInDistribution
      (fun (n : ℕ) ω => √(n : ℝ) • (eInv (empiricalMoment n ω) - theta0)) atTop
      (fun ω => Dinv (Z ω)) (fun _ => P) Q :=
  vaart1998_theorem_4_1_moment_estimator_delta_method
    (empiricalMoment := empiricalMoment) (Z := Z) (eInv := eInv)
    (eta0 := eta0) (theta0 := theta0)
    (r := fun n : ℕ => √(n : ℝ)) (Dinv := Dinv)
    hInv_deriv hInv_meas heta0 vaart1998_sqrt_nat_tendsto_atTop
    hCLT hEmpiricalMoment

/--
Certificate form of van der Vaart Theorem 4.1's delta-method step.
-/
theorem vaart1998_theorem_4_1_moment_estimator_delta_method_of_certificate
    {Ω : Type u} {Ω' : Type v} {M : Type w} {Θ : Type x}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup M] [NormedSpace ℝ M]
    [MeasurableSpace M] [SecondCountableTopology M] [BorelSpace M]
    [OpensMeasurableSpace M] [CompleteSpace M]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (C : Vaart1998MomentLocalInverseCertificate M Θ)
    {empiricalMoment : ℕ -> Ω -> M} {Z : Ω' -> M} {r : ℕ -> ℝ}
    (hr : Tendsto r atTop atTop)
    (hCLT : TendstoInDistribution
      (fun n ω => r n • (empiricalMoment n ω - C.eta0)) atTop Z
        (fun _ => P) Q)
    (hEmpiricalMoment : ∀ n, AEMeasurable (empiricalMoment n) P) :
    TendstoInDistribution
      (fun n ω => r n • (C.eInv (empiricalMoment n ω) - C.theta0)) atTop
      (fun ω => C.Dinv (Z ω)) (fun _ => P) Q :=
  vaart1998_theorem_4_1_moment_estimator_delta_method
    (empiricalMoment := empiricalMoment) (Z := Z) (eInv := C.eInv)
    (eta0 := C.eta0) (theta0 := C.theta0) (r := r) (Dinv := C.Dinv)
    C.inverse_deriv C.inverse_measurable C.inverse_at_eta0 hr hCLT
    hEmpiricalMoment

/--
Textbook `sqrt n` certificate form of Theorem 4.1's delta-method step.
-/
theorem vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_of_certificate
    {Ω : Type u} {Ω' : Type v} {M : Type w} {Θ : Type x}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup M] [NormedSpace ℝ M]
    [MeasurableSpace M] [SecondCountableTopology M] [BorelSpace M]
    [OpensMeasurableSpace M] [CompleteSpace M]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (C : Vaart1998MomentLocalInverseCertificate M Θ)
    {empiricalMoment : ℕ -> Ω -> M} {Z : Ω' -> M}
    (hCLT : TendstoInDistribution
      (fun (n : ℕ) ω => √(n : ℝ) • (empiricalMoment n ω - C.eta0))
        atTop Z (fun _ => P) Q)
    (hEmpiricalMoment : ∀ n, AEMeasurable (empiricalMoment n) P) :
    TendstoInDistribution
      (fun (n : ℕ) ω => √(n : ℝ) • (C.eInv (empiricalMoment n ω) - C.theta0))
        atTop (fun ω => C.Dinv (Z ω)) (fun _ => P) Q :=
  vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method
    (empiricalMoment := empiricalMoment) (Z := Z) (eInv := C.eInv)
    (eta0 := C.eta0) (theta0 := C.theta0) (Dinv := C.Dinv)
    C.inverse_deriv C.inverse_measurable C.inverse_at_eta0 hCLT
    hEmpiricalMoment

end AsymptoticStatistics
end StatInference
