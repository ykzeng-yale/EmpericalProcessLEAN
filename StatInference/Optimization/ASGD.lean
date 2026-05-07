import StatInference.Optimization.StochasticGradient
import Mathlib.Probability.Distributions.Gaussian.HasGaussianLaw.Basic

/-!
# Chewi Chapter 12 averaged SGD algebra

This module starts the ASGD layer after the SMPGD Theorem 12.1 wrappers.  The
first packet formalizes the algebraic decomposition displayed in the proof of
Chewi Theorem 12.3: after unrolling the quadratic recursion, the averaged
iterate separates into the martingale sum with coefficient `A^{-1}` and a
remainder involving `M_k^n - A^{-1}`.

The second packet is the probabilistic handoff used immediately after that
display: if the scaled martingale sum has a Gaussian weak limit and the initial
condition and coefficient-remainder terms vanish in probability, then the
scaled averaged iterate has the pushed-forward Gaussian weak limit.
-/

noncomputable section

namespace StatInference
namespace Optimization

open Filter MeasureTheory ProbabilityTheory
open Finset
open scoped BigOperators

/--
Finite-sum algebra behind the ASGD display `(12.5)`: any coefficient family
`M k` splits into a reference linear map `Ainv` plus the residual
`M k - Ainv`.
-/
theorem chewi123_asgd_noise_sum_split
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Ainv : E →L[ℝ] E) (M : ℕ -> E →L[ℝ] E) (xi : ℕ -> E)
    (s : Finset ℕ) :
    (∑ k ∈ s, M k (xi k)) =
      (∑ k ∈ s, Ainv (xi k)) +
        ∑ k ∈ s, (M k - Ainv) (xi k) := by
  rw [← sum_add_distrib]
  refine sum_congr rfl ?_
  intro k hk
  simp

/--
Scaled ASGD averaged-error decomposition.  This is the source algebra after
the unrolled quadratic recursion has supplied

`avgDelta = invN • M0 delta0 - invN • sum_k M_k xi_k`.

With `sqrtN * invN = invSqrtN`, it rewrites the scaled averaged error as the
initial-condition term, the martingale term with coefficient `Ainv`, and the
coefficient-remainder term.
-/
theorem chewi123_asgd_scaled_average_decomposition
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (sqrtN invN invSqrtN : ℝ)
    (hscale : sqrtN * invN = invSqrtN)
    (Ainv M0 : E →L[ℝ] E) (M : ℕ -> E →L[ℝ] E)
    (delta0 : E) (xi : ℕ -> E) (N : ℕ) (avgDelta : E)
    (havg :
      avgDelta =
        invN • M0 delta0 -
          invN • ∑ k ∈ Finset.range N, M k (xi k)) :
    sqrtN • avgDelta =
      invSqrtN • M0 delta0 -
        invSqrtN • ∑ k ∈ Finset.range N, Ainv (xi k) -
          invSqrtN • ∑ k ∈ Finset.range N, (M k - Ainv) (xi k) := by
  rw [havg, smul_sub, smul_smul, smul_smul, hscale]
  rw [chewi123_asgd_noise_sum_split (Ainv := Ainv) (M := M) (xi := xi)
    (s := Finset.range N)]
  rw [smul_add]
  module

/--
Source-shaped specialization of `chewi123_asgd_scaled_average_decomposition`
with the displayed `sqrt N` and `1 / N` scaling.  This is the finite algebraic
form used just before the martingale CLT term is isolated in Chewi Theorem
12.3.
-/
theorem chewi123_asgd_sqrt_average_decomposition
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Ainv M0 : E →L[ℝ] E) (M : ℕ -> E →L[ℝ] E)
    (delta0 : E) (xi : ℕ -> E) (N : ℕ) (avgDelta : E)
    (hN : 0 < (N : ℝ))
    (havg :
      avgDelta =
        ((N : ℝ)⁻¹) • M0 delta0 -
          ((N : ℝ)⁻¹) • ∑ k ∈ Finset.range N, M k (xi k)) :
    Real.sqrt (N : ℝ) • avgDelta =
      (Real.sqrt (N : ℝ))⁻¹ • M0 delta0 -
        (Real.sqrt (N : ℝ))⁻¹ • ∑ k ∈ Finset.range N, Ainv (xi k) -
          (Real.sqrt (N : ℝ))⁻¹ •
            ∑ k ∈ Finset.range N, (M k - Ainv) (xi k) := by
  refine
    chewi123_asgd_scaled_average_decomposition
      (sqrtN := Real.sqrt (N : ℝ)) (invN := (N : ℝ)⁻¹)
      (invSqrtN := (Real.sqrt (N : ℝ))⁻¹)
      ?_ Ainv M0 M delta0 xi N avgDelta havg
  have hsqrt_pos : 0 < Real.sqrt (N : ℝ) := Real.sqrt_pos.2 hN
  have hsq : (Real.sqrt (N : ℝ)) ^ (2 : ℕ) = (N : ℝ) :=
    Real.sq_sqrt hN.le
  field_simp [hN.ne', hsqrt_pos.ne']
  nlinarith [hsq]

/--
The martingale CLT term in Chewi Theorem 12.3 is preserved by the continuous
linear map `-A^{-1}`.  This is the continuous-mapping step turning

`n^{-1/2} sum_k xi_k => Z`

into

`-n^{-1/2} sum_k A^{-1} xi_k => -A^{-1} Z`.
-/
theorem chewi123_asgd_neg_linear_noise_clt
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [BorelSpace E] [OpensMeasurableSpace E]
    (Ainv : E →L[ℝ] E) {noiseScaled : ℕ -> Ω -> E} {Z : Ω' -> E}
    (hCLT :
      TendstoInDistribution noiseScaled atTop Z (fun _ => P) Q) :
    TendstoInDistribution
      (fun n ω => -Ainv (noiseScaled n ω)) atTop
      (fun ω => -Ainv (Z ω)) (fun _ => P) Q := by
  simpa [Function.comp_def] using
    TendstoInDistribution.continuous_comp
      (g := fun x : E => -Ainv x) Ainv.continuous.neg hCLT

/--
Gaussian laws are preserved by the same `-A^{-1}` map.  This records the
source covariance-pushforward step before later finite-dimensional matrix
work identifies the covariance as `A^{-1} S_infty A^{-1}`.
-/
theorem chewi123_asgd_neg_linear_gaussian_limit
    {Ω' E : Type*} [MeasurableSpace Ω'] {Q : Measure Ω'}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [BorelSpace E]
    (Ainv : E →L[ℝ] E) {Z : Ω' -> E}
    (hZ : HasGaussianLaw Z Q) :
    HasGaussianLaw (fun ω => -Ainv (Z ω)) Q := by
  simpa using hZ.map_fun (-Ainv)

/--
Slutsky handoff for the source display after `(12.5)`.

Once the martingale CLT supplies the weak limit of the scaled noise sum, the
initial-condition term and the coefficient-remainder term may be discharged
separately as convergence in probability to zero.  This theorem then proves
the distributional limit for the scaled averaged ASGD error.
-/
theorem chewi123_asgd_distribution_limit_of_noise_and_remainders
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [SecondCountableTopology E] [BorelSpace E] [OpensMeasurableSpace E]
    (Ainv : E →L[ℝ] E)
    {noiseScaled scaledAverage initial remainder : ℕ -> Ω -> E}
    {Z : Ω' -> E}
    (hNoise :
      TendstoInDistribution noiseScaled atTop Z (fun _ => P) Q)
    (hInitial : TendstoInMeasure P initial atTop (fun _ => 0))
    (hRemainder : TendstoInMeasure P remainder atTop (fun _ => 0))
    (hInitial_meas : ∀ n, AEMeasurable (initial n) P)
    (hRemainder_meas : ∀ n, AEMeasurable (remainder n) P)
    (hDecomp : ∀ n,
      (fun ω => (-Ainv (noiseScaled n ω) + initial n ω) + remainder n ω)
        =ᵐ[P] scaledAverage n) :
    TendstoInDistribution scaledAverage atTop
      (fun ω => -Ainv (Z ω)) (fun _ => P) Q := by
  have hMain :
      TendstoInDistribution
        (fun n ω => -Ainv (noiseScaled n ω)) atTop
        (fun ω => -Ainv (Z ω)) (fun _ => P) Q :=
    chewi123_asgd_neg_linear_noise_clt (Ainv := Ainv) hNoise
  have hWithInitial :
      TendstoInDistribution
        (fun n => (fun ω => -Ainv (noiseScaled n ω)) + initial n) atTop
        (fun ω => -Ainv (Z ω) + (0 : E)) (fun _ => P) Q :=
    hMain.add_of_tendstoInMeasure_const hInitial hInitial_meas
  have hWithRemainder :
      TendstoInDistribution
        (fun n =>
          ((fun ω => -Ainv (noiseScaled n ω)) + initial n) + remainder n)
        atTop
        (fun ω => (-Ainv (Z ω) + (0 : E)) + (0 : E)) (fun _ => P) Q :=
    hWithInitial.add_of_tendstoInMeasure_const hRemainder hRemainder_meas
  refine hWithRemainder.congr (fun n => ?_) ?_
  · filter_upwards [hDecomp n] with ω hω
    simpa [Pi.add_apply] using hω
  · exact ae_of_all _ fun ω => by simp

end Optimization
end StatInference
