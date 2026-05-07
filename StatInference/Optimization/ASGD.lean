import StatInference.AsymptoticStatistics.MomentEstimators
import StatInference.Optimization.StochasticGradient
import Mathlib.Probability.Distributions.Gaussian.HasGaussianLaw.Basic
import Mathlib.Probability.Process.Adapted

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

The third packet packages the supplied martingale-CLT interface from Chewi
Theorem 12.7 and connects it to the covariance-pushforward display used in
Theorem 12.3.

The next packet adds the concrete source definitions for the scaled martingale
sum and averaged conditional covariance, plus deterministic conditional-
expectation consequences that later discharge the bounded martingale CLT
constructor.
-/

noncomputable section

namespace StatInference
namespace Optimization

open Filter MeasureTheory ProbabilityTheory
open StatInference.AsymptoticStatistics
open Finset
open scoped BigOperators

/--
Process-level martingale-difference interface for Chewi Theorem 12.7.

The fields are intentionally source-shaped: `xi` is adapted to a filtration
and its next increment has conditional expectation zero given the previous
filtration level.  Later theorem packets can derive the supplied CLT
certificate from this structure plus the conditional-covariance assumptions.
-/
structure Chewi127MartingaleDifferenceProcess
    (Ω E : Type*) [mΩ : MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] where
  /-- The noise increments `xi_n`. -/
  xi : ℕ -> Ω -> E
  /-- The information available up to each iteration. -/
  filtration : Filtration ℕ mΩ
  /-- The noise process is adapted to the filtration. -/
  adapted : StronglyAdapted filtration xi
  /-- Integrability required for conditional expectations. -/
  integrable : ∀ n, Integrable (xi n) P
  /-- Martingale-difference condition `E[xi_{n+1} | F_n] = 0`. -/
  condExp_zero : ∀ n, P[xi (n + 1) | filtration n] =ᵐ[P] fun _ => 0

/--
Conditional-covariance interface for the martingale CLT route.

For continuous linear coordinates `L` and `K`, the supplied field records the
conditional second moment of the next noise increment.  Under the
mean-zero field in `Chewi127MartingaleDifferenceProcess`, this is the
coordinate form of Chewi's `Xi_{n+1}`.
-/
structure Chewi127ConditionalCovarianceProcess
    (Ω E : Type*) [mΩ : MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] where
  /-- The noise increments `xi_n`. -/
  xi : ℕ -> Ω -> E
  /-- The information available up to each iteration. -/
  filtration : Filtration ℕ mΩ
  /-- Conditional covariance kernel, tested against continuous linear maps. -/
  Xi : ℕ -> Ω -> StrongDual ℝ E -> StrongDual ℝ E -> ℝ
  /-- Conditional second-moment identity defining `Xi_{n+1}` coordinatewise. -/
  conditional_second_moment : ∀ n L K,
    P[fun ω => L (xi (n + 1) ω) * K (xi (n + 1) ω) | filtration n]
      =ᵐ[P] fun ω => Xi (n + 1) ω L K

/--
Chewi Theorem 12.7, represented as a reusable supplied certificate.

The actual martingale CLT proof can later populate these fields from
`Chewi127MartingaleDifferenceProcess`,
`Chewi127ConditionalCovarianceProcess`, boundedness/Lindeberg assumptions, and
the convergence in probability of averaged conditional covariances.
-/
structure Chewi127MartingaleCLTCertificate
    (Ω Ω' E : Type*) [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] (Q : Measure Ω')
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [OpensMeasurableSpace E] [BorelSpace E] where
  /-- The scaled martingale sum, e.g. `n^{-1/2} sum_{k=1}^n xi_k`. -/
  noiseScaled : ℕ -> Ω -> E
  /-- The Gaussian limit random vector. -/
  Z : Ω' -> E
  /-- The source martingale CLT conclusion. -/
  clt : TendstoInDistribution noiseScaled atTop Z (fun _ => P) Q
  /-- The limit law is Gaussian. -/
  gaussian_limit : HasGaussianLaw Z Q
  /-- The covarianceBilinDual display is available for the limit law. -/
  limit_memLp : MemLp id 2 (Q.map Z)

/--
The scaled martingale sum in Chewi Theorem 12.7:
`n^{-1/2} sum_{k=1}^n xi_k`, indexed in Lean as `xi (k+1)` over
`Finset.range n`.
-/
noncomputable def chewi127ScaledNoiseSum
    {Ω E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (xi : ℕ -> Ω -> E) (n : ℕ) (ω : Ω) : E :=
  (Real.sqrt (n : ℝ))⁻¹ • ∑ k ∈ Finset.range n, xi (k + 1) ω

/--
The averaged conditional covariance process appearing in Chewi Theorem 12.7,
tested against two continuous linear coordinates.
-/
noncomputable def chewi127AverageConditionalCovariance
    {Ω E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Xi : ℕ -> Ω -> StrongDual ℝ E -> StrongDual ℝ E -> ℝ)
    (N : ℕ) (ω : Ω) (L K : StrongDual ℝ E) : ℝ :=
  (N : ℝ)⁻¹ * ∑ k ∈ Finset.range N, Xi (k + 1) ω L K

/--
Source-shaped convergence-in-probability assumption for the averaged
conditional covariances in Chewi Theorem 12.7.
-/
structure Chewi127AveragedConditionalCovarianceLimit
    (Ω E : Type*) [MeasurableSpace Ω] (P : Measure Ω)
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Xi : ℕ -> Ω -> StrongDual ℝ E -> StrongDual ℝ E -> ℝ) where
  /-- The limiting covariance functional `S_infty`. -/
  S_infty : StrongDual ℝ E -> StrongDual ℝ E -> ℝ
  /-- Coordinatewise convergence in probability of averaged conditional covariances. -/
  tendstoInMeasure : ∀ L K : StrongDual ℝ E,
    TendstoInMeasure P
      (fun N ω => chewi127AverageConditionalCovariance Xi N ω L K)
      atTop (fun _ => S_infty L K)

/--
Constructor for the supplied Chewi Theorem 12.7 martingale CLT certificate
when the source CLT has already been proved for the exact scaled martingale
sum `n^{-1/2} sum_{k=1}^n xi_k`.
-/
def chewi127_martingaleCLTCertificate_of_scaledNoiseSum
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [OpensMeasurableSpace E] [BorelSpace E]
    (xi : ℕ -> Ω -> E) (Z : Ω' -> E)
    (hCLT :
      TendstoInDistribution (chewi127ScaledNoiseSum xi) atTop Z
        (fun _ => P) Q)
    (hGaussian : HasGaussianLaw Z Q)
    (hMemLp : MemLp id 2 (Q.map Z)) :
    Chewi127MartingaleCLTCertificate Ω Ω' E P Q where
  noiseScaled := chewi127ScaledNoiseSum xi
  Z := Z
  clt := hCLT
  gaussian_limit := hGaussian
  limit_memLp := hMemLp

/--
A martingale-difference increment has unconditional mean zero.

This is the same conditional-to-unconditional expectation handoff used in the
SMPGD wrappers, specialized to Chewi's ASGD noise process.
-/
theorem Chewi127MartingaleDifferenceProcess.integral_next_eq_zero
    {Ω E : Type*} [mΩ : MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (M : Chewi127MartingaleDifferenceProcess Ω E P) (n : ℕ) :
    (∫ ω, M.xi (n + 1) ω ∂P) = 0 :=
  integral_eq_const_of_filtration_condExp_ae_eq_const
    (μ := P) M.filtration n (M.xi (n + 1)) 0 (M.condExp_zero n)

/--
Continuous linear coordinates of a martingale-difference increment also have
unconditional mean zero.
-/
theorem Chewi127MartingaleDifferenceProcess.integral_linear_next_eq_zero
    {Ω E : Type*} [mΩ : MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (M : Chewi127MartingaleDifferenceProcess Ω E P)
    (L : StrongDual ℝ E) (n : ℕ) :
    (∫ ω, L (M.xi (n + 1) ω) ∂P) = 0 := by
  calc
    (∫ ω, L (M.xi (n + 1) ω) ∂P)
        = L (∫ ω, M.xi (n + 1) ω ∂P) := by
          rw [ContinuousLinearMap.integral_comp_comm L (M.integrable (n + 1))]
    _ = 0 := by rw [M.integral_next_eq_zero n, map_zero]

/--
Integrating the conditional covariance identity recovers the unconditional
coordinate second moment.  This is the deterministic bridge from Chewi's
`Xi_{n+1}` field to ordinary covariance/moment expressions.
-/
theorem Chewi127ConditionalCovarianceProcess.integral_Xi_next_eq_integral_second_moment
    {Ω E : Type*} [mΩ : MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    (C : Chewi127ConditionalCovarianceProcess Ω E P)
    (L K : StrongDual ℝ E) (n : ℕ) :
    (∫ ω, C.Xi (n + 1) ω L K ∂P) =
      ∫ ω, L (C.xi (n + 1) ω) * K (C.xi (n + 1) ω) ∂P := by
  rw [← integral_condExp
    (m := C.filtration n) (m₀ := mΩ) (μ := P)
    (f := fun ω => L (C.xi (n + 1) ω) * K (C.xi (n + 1) ω))
    (C.filtration.le n)]
  exact integral_congr_ae (C.conditional_second_moment n L K).symm

/--
Source-facing CLT conclusion accessor for a Chewi Theorem 12.7 certificate.
-/
theorem Chewi127MartingaleCLTCertificate.clt_limit
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [OpensMeasurableSpace E] [BorelSpace E]
    (C : Chewi127MartingaleCLTCertificate Ω Ω' E P Q) :
    TendstoInDistribution C.noiseScaled atTop C.Z (fun _ => P) Q :=
  C.clt

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

/--
Chewi Theorem 12.3 handoff from a supplied martingale CLT certificate.

This wraps the proof step after `(12.5)`: the source martingale CLT supplies
the limit for the scaled noise sum, while the initial and coefficient-remainder
terms vanish in probability.
-/
theorem Chewi127MartingaleCLTCertificate.asgd_distribution_limit
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [SecondCountableTopology E] [BorelSpace E] [OpensMeasurableSpace E]
    (C : Chewi127MartingaleCLTCertificate Ω Ω' E P Q)
    (Ainv : E →L[ℝ] E)
    {scaledAverage initial remainder : ℕ -> Ω -> E}
    (hInitial : TendstoInMeasure P initial atTop (fun _ => 0))
    (hRemainder : TendstoInMeasure P remainder atTop (fun _ => 0))
    (hInitial_meas : ∀ n, AEMeasurable (initial n) P)
    (hRemainder_meas : ∀ n, AEMeasurable (remainder n) P)
    (hDecomp : ∀ n,
      (fun ω => (-Ainv (C.noiseScaled n ω) + initial n ω) + remainder n ω)
        =ᵐ[P] scaledAverage n) :
    TendstoInDistribution scaledAverage atTop
      (fun ω => -Ainv (C.Z ω)) (fun _ => P) Q :=
  chewi123_asgd_distribution_limit_of_noise_and_remainders
    (Ainv := Ainv) (noiseScaled := C.noiseScaled) (Z := C.Z)
    C.clt hInitial hRemainder hInitial_meas hRemainder_meas hDecomp

/--
CovarianceBilinDual pullback for the `-A^{-1}` Gaussian limit in Chewi
Theorem 12.3.

This reuses the existing van der Vaart covariance-pullback primitive rather
than duplicating covariance foundations in the optimization lane.
-/
theorem Chewi127MartingaleCLTCertificate.neg_linear_covarianceBilinDual
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [CompleteSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    (C : Chewi127MartingaleCLTCertificate Ω Ω' E P Q)
    (Ainv : E →L[ℝ] E) (L K : StrongDual ℝ E) :
    ProbabilityTheory.covarianceBilinDual
        (Q.map fun ω => -Ainv (C.Z ω)) L K =
      vaart1998_inverseDerivativeCovarianceFunctional (-Ainv)
        (fun L0 K0 =>
          ProbabilityTheory.covarianceBilinDual (Q.map C.Z) L0 K0) L K := by
  simpa using
    vaart1998_covarianceBilinDual_inverseDerivative_map_apply_of_memLp
      (Z := C.Z) (Q := Q) (Dinv := -Ainv)
      C.clt.aemeasurable_limit C.limit_memLp L K

/--
Finite-coordinate covariance table for the `-A^{-1}` Gaussian limit in Chewi
Theorem 12.3.
-/
theorem Chewi127MartingaleCLTCertificate.neg_linear_covarianceTable
    {I Ω Ω' E : Type*} [Fintype I] [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [CompleteSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    (C : Chewi127MartingaleCLTCertificate Ω Ω' E P Q)
    (Ainv : E →L[ℝ] E) (coordinates : I -> StrongDual ℝ E) (i j : I) :
    vaart1998_covarianceTable coordinates
        (fun L K =>
          ProbabilityTheory.covarianceBilinDual
            (Q.map fun ω => -Ainv (C.Z ω)) L K) i j =
      vaart1998_covarianceTable
        (fun k => (coordinates k).comp (-Ainv))
        (fun L K => ProbabilityTheory.covarianceBilinDual (Q.map C.Z) L K)
        i j := by
  simpa using
    vaart1998_covarianceBilinDual_inverseDerivative_table_apply_of_memLp
      (Z := C.Z) (Q := Q) (Dinv := -Ainv)
      (coordinates := coordinates) C.clt.aemeasurable_limit C.limit_memLp i j

/--
Source-shaped Chewi Theorem 12.3 probability/covariance package from a supplied
Theorem 12.7 martingale CLT certificate and the two `o_P(1)` remainder
discharges.
-/
theorem chewi123_asgd_limit_package_of_martingale_certificate
    {Ω Ω' E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] [MeasurableSpace Ω'] {Q : Measure Ω'}
    [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [CompleteSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    (C : Chewi127MartingaleCLTCertificate Ω Ω' E P Q)
    (Ainv : E →L[ℝ] E)
    {scaledAverage initial remainder : ℕ -> Ω -> E}
    (hInitial : TendstoInMeasure P initial atTop (fun _ => 0))
    (hRemainder : TendstoInMeasure P remainder atTop (fun _ => 0))
    (hInitial_meas : ∀ n, AEMeasurable (initial n) P)
    (hRemainder_meas : ∀ n, AEMeasurable (remainder n) P)
    (hDecomp : ∀ n,
      (fun ω => (-Ainv (C.noiseScaled n ω) + initial n ω) + remainder n ω)
        =ᵐ[P] scaledAverage n) :
    TendstoInDistribution scaledAverage atTop
        (fun ω => -Ainv (C.Z ω)) (fun _ => P) Q ∧
      HasGaussianLaw (fun ω => -Ainv (C.Z ω)) Q ∧
      ∀ L K : StrongDual ℝ E,
        ProbabilityTheory.covarianceBilinDual
            (Q.map fun ω => -Ainv (C.Z ω)) L K =
          vaart1998_inverseDerivativeCovarianceFunctional (-Ainv)
            (fun L0 K0 =>
              ProbabilityTheory.covarianceBilinDual (Q.map C.Z) L0 K0) L K :=
  ⟨C.asgd_distribution_limit Ainv hInitial hRemainder
      hInitial_meas hRemainder_meas hDecomp,
    chewi123_asgd_neg_linear_gaussian_limit (Ainv := Ainv) C.gaussian_limit,
    fun L K => C.neg_linear_covarianceBilinDual Ainv L K⟩

end Optimization
end StatInference
