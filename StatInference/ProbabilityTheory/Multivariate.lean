import StatInference.ProbabilityTheory.Basic
import StatInference.AsymptoticStatistics.MomentEstimators

/-!
# Durrett 2019 multivariate probability-theory wrappers

This module contains Durrett Section 3.10 source-facing wrappers for limit
theorems in finite-dimensional real vector spaces.  Reusable Cramér-Wold
machinery is shared with the existing asymptotic-statistics lane.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory ProbabilityTheory

open scoped BigOperators BoundedContinuousFunction ENNReal Topology Function ProbabilityTheory

/-! ## Durrett, Section 3.10 -/

/--
Durrett 2019, Theorem 3.10.7, the finite covariance-table quadratic form
appearing in the multivariate normal characteristic function.
-/
noncomputable def durrett2019_theorem_3_10_7_covarianceTableQuadratic
    {Coordinate : Type*} [Fintype Coordinate]
    (theta : Coordinate -> ℝ) (Gamma : Coordinate -> Coordinate -> ℝ) : ℝ :=
  ∑ i, ∑ j, theta i * theta j * Gamma i j

/--
Durrett's projection `x ↦ theta · x` as a continuous linear functional on a
finite real coordinate space.
-/
noncomputable def durrett2019_theorem_3_10_7_thetaProjection
    {Coordinate : Type*} [Fintype Coordinate]
    (theta : Coordinate -> ℝ) :
    StrongDual ℝ (Coordinate -> ℝ) :=
  ∑ i,
    theta i •
      StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
        (Coordinate := Coordinate) i

@[simp]
theorem durrett2019_theorem_3_10_7_thetaProjection_apply
    {Coordinate : Type*} [Fintype Coordinate]
    (theta : Coordinate -> ℝ) (x : Coordinate -> ℝ) :
    durrett2019_theorem_3_10_7_thetaProjection theta x =
      ∑ i, theta i * x i := by
  classical
  simp [durrett2019_theorem_3_10_7_thetaProjection]

/--
The covariance bilinear form of Durrett's projection is the double sum of the
coordinate covariance table.
-/
theorem durrett2019_theorem_3_10_7_covarianceBilinDual_thetaProjection
    {Coordinate : Type*} [Fintype Coordinate]
    [MeasurableSpace (Coordinate -> ℝ)]
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    (μ : Measure (Coordinate -> ℝ)) (theta : Coordinate -> ℝ) :
    _root_.ProbabilityTheory.covarianceBilinDual μ
        (durrett2019_theorem_3_10_7_thetaProjection theta)
        (durrett2019_theorem_3_10_7_thetaProjection theta) =
      ∑ i, ∑ j, theta i * theta j *
        _root_.ProbabilityTheory.covarianceBilinDual μ
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
            (Coordinate := Coordinate) i)
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
            (Coordinate := Coordinate) j) := by
  classical
  simp [durrett2019_theorem_3_10_7_thetaProjection,
    _root_.ProbabilityTheory.covarianceBilinDual_comm, Finset.mul_sum, mul_assoc]

/--
Durrett's projected variance is the covariance-table quadratic form when the
coordinate covariance table is supplied by `covarianceBilinDual`.
-/
theorem durrett2019_theorem_3_10_7_thetaProjection_variance_eq_covarianceTableQuadratic
    {Coordinate : Type*} [Fintype Coordinate]
    [MeasurableSpace (Coordinate -> ℝ)]
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [CompleteSpace (Coordinate -> ℝ)]
    {μ : Measure (Coordinate -> ℝ)} [IsFiniteMeasure μ]
    (hμ_memLp : MemLp id 2 μ)
    (Gamma : Coordinate -> Coordinate -> ℝ) (theta : Coordinate -> ℝ)
    (hGamma : ∀ i j,
      Gamma i j =
        _root_.ProbabilityTheory.covarianceBilinDual μ
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
            (Coordinate := Coordinate) i)
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
            (Coordinate := Coordinate) j)) :
    _root_.ProbabilityTheory.variance
        (durrett2019_theorem_3_10_7_thetaProjection theta) μ =
      durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma := by
  rw [← _root_.ProbabilityTheory.covarianceBilinDual_self_eq_variance
    hμ_memLp (durrett2019_theorem_3_10_7_thetaProjection theta)]
  rw [durrett2019_theorem_3_10_7_covarianceBilinDual_thetaProjection]
  simp [durrett2019_theorem_3_10_7_covarianceTableQuadratic, hGamma]

/--
Durrett 2019, Theorem 3.10.7, Gaussian projected characteristic-function
display.

For a Gaussian finite-coordinate vector, every continuous linear projection has
the textbook one-dimensional Gaussian characteristic function with its
projected mean and variance.
-/
theorem durrett2019_theorem_3_10_7_gaussianProjectedCharacteristic_display
    {Coordinate Ω' : Type*} [Fintype Coordinate] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {Z : Ω' -> Coordinate -> ℝ}
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (L : StrongDual ℝ (Coordinate -> ℝ)) :
    MeasureTheory.charFunDual (Q.map Z) L =
      Complex.exp
        (((∫ ω, L (Z ω) ∂Q : ℝ) : ℂ) * Complex.I -
          ((_root_.ProbabilityTheory.variance (fun ω => L (Z ω)) Q : ℝ) : ℂ) / 2) := by
  simpa [_root_.ProbabilityTheory.variance] using
    (_root_.ProbabilityTheory.HasGaussianLaw.charFunDual_map_eq_fun
      (X := Z) (P := Q) L hZ_gaussian)

/--
Durrett 2019, Theorem 3.10.7, centered Gaussian projected
characteristic-function display from a supplied projected-variance
identification.

This is the exact exponential shape used in the proof before expanding the
projected variance into the coordinate covariance table.
-/
theorem durrett2019_theorem_3_10_7_centeredGaussianProjectedCharacteristic_display_of_variance
    {Coordinate Ω' : Type*} [Fintype Coordinate] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {Z : Ω' -> Coordinate -> ℝ}
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (projectedVariance : StrongDual ℝ (Coordinate -> ℝ) -> ℝ)
    (hZ_mean : ∀ L : StrongDual ℝ (Coordinate -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_variance : ∀ L : StrongDual ℝ (Coordinate -> ℝ),
      _root_.ProbabilityTheory.variance (fun ω => L (Z ω)) Q =
        projectedVariance L)
    (L : StrongDual ℝ (Coordinate -> ℝ)) :
    MeasureTheory.charFunDual (Q.map Z) L =
      Complex.exp (-((projectedVariance L : ℂ) / 2)) := by
  rw [durrett2019_theorem_3_10_7_gaussianProjectedCharacteristic_display
    (Q := Q) (Z := Z) hZ_gaussian L]
  rw [hZ_mean L, hZ_variance L]
  congr 1
  simp

/--
Durrett 2019, Theorem 3.10.7, centered Gaussian characteristic-function display
after identifying the projected variance with Durrett's finite covariance-table
quadratic form.
-/
theorem durrett2019_theorem_3_10_7_centeredGaussianProjectedCharacteristic_display_of_covarianceTable
    {Coordinate Ω' : Type*} [Fintype Coordinate] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {Z : Ω' -> Coordinate -> ℝ}
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (Gamma : Coordinate -> Coordinate -> ℝ)
    (theta : Coordinate -> ℝ)
    (L : StrongDual ℝ (Coordinate -> ℝ))
    (hZ_mean : (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_variance :
      _root_.ProbabilityTheory.variance (fun ω => L (Z ω)) Q =
        durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma) :
    MeasureTheory.charFunDual (Q.map Z) L =
      Complex.exp
        (-((durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma : ℂ) / 2)) := by
  rw [durrett2019_theorem_3_10_7_gaussianProjectedCharacteristic_display
    (Q := Q) (Z := Z) hZ_gaussian L]
  rw [hZ_mean, hZ_variance]
  congr 1
  simp

/--
Durrett 2019, Theorem 3.10.7, centered Gaussian characteristic-function display
for the textbook projection `theta · chi`.
-/
theorem durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_covarianceTable
    {Coordinate Ω' : Type*} [Fintype Coordinate] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {Z : Ω' -> Coordinate -> ℝ}
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (Gamma : Coordinate -> Coordinate -> ℝ)
    (theta : Coordinate -> ℝ)
    (hZ_mean :
      (∫ ω, (∑ i, theta i * Z ω i) ∂Q) = 0)
    (hZ_variance :
      _root_.ProbabilityTheory.variance
          (fun ω => ∑ i, theta i * Z ω i) Q =
        durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma) :
    MeasureTheory.charFunDual (Q.map Z)
        (durrett2019_theorem_3_10_7_thetaProjection theta) =
      Complex.exp
        (-((durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma : ℂ) / 2)) := by
  exact
    durrett2019_theorem_3_10_7_centeredGaussianProjectedCharacteristic_display_of_covarianceTable
      (Q := Q) (Z := Z) (hZ_gaussian := hZ_gaussian)
      (Gamma := Gamma) (theta := theta)
      (L := durrett2019_theorem_3_10_7_thetaProjection theta)
      (hZ_mean := by
        simpa using hZ_mean)
      (hZ_variance := by
        simpa using hZ_variance)

/--
Durrett 2019, Theorem 3.10.7, centered Gaussian characteristic-function display
from the covariance table of the Gaussian limit law.

This closes the textbook step
`Var(theta · chi) = sum_i sum_j theta_i theta_j Gamma_ij` when `Gamma` is the
coordinate covariance table of the law of `chi`.
-/
theorem durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_covarianceBilinDualTable
    {Coordinate Ω' : Type*} [Fintype Coordinate] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    [CompleteSpace (Coordinate -> ℝ)]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {Z : Ω' -> Coordinate -> ℝ}
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (Gamma : Coordinate -> Coordinate -> ℝ)
    (theta : Coordinate -> ℝ)
    (hZ_mean :
      (∫ ω, (∑ i, theta i * Z ω i) ∂Q) = 0)
    (hGamma : ∀ i j,
      Gamma i j =
        _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z)
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
            (Coordinate := Coordinate) i)
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEvalCLM
            (Coordinate := Coordinate) j)) :
    MeasureTheory.charFunDual (Q.map Z)
        (durrett2019_theorem_3_10_7_thetaProjection theta) =
      Complex.exp
        (-((durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma : ℂ) / 2)) := by
  have hvar_projection :
      _root_.ProbabilityTheory.variance
          (durrett2019_theorem_3_10_7_thetaProjection theta) (Q.map Z) =
        durrett2019_theorem_3_10_7_covarianceTableQuadratic theta Gamma :=
    durrett2019_theorem_3_10_7_thetaProjection_variance_eq_covarianceTableQuadratic
      (μ := Q.map Z) hZ_memLp Gamma theta hGamma
  have hvar_map :
      _root_.ProbabilityTheory.variance
          (durrett2019_theorem_3_10_7_thetaProjection theta) (Q.map Z) =
        _root_.ProbabilityTheory.variance
          (fun ω => durrett2019_theorem_3_10_7_thetaProjection theta (Z ω)) Q := by
    simpa [Function.comp_def] using
      (_root_.ProbabilityTheory.variance_map
        (X := durrett2019_theorem_3_10_7_thetaProjection theta)
        (Y := Z) (μ := Q) (by fun_prop) hZ_gaussian.aemeasurable)
  exact
    durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_covarianceTable
      (Q := Q) (Z := Z) (hZ_gaussian := hZ_gaussian)
      (Gamma := Gamma) (theta := theta)
      (hZ_mean := hZ_mean)
      (hZ_variance := by
        simpa using hvar_map.symm.trans hvar_projection)

/--
Durrett 2019, Theorem 3.10.6, Cramér-Wold device, finite-coordinate law form.

For finite real coordinate spaces, weak convergence of every continuous linear
projection implies weak convergence of the vector laws.
-/
theorem durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto
    {Coordinate : Type*} [Fintype Coordinate]
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    {μs : ℕ -> ProbabilityMeasure (Coordinate -> ℝ)}
    {μ : ProbabilityMeasure (Coordinate -> ℝ)}
    (hproj :
      StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedLawConvergence
        μs μ) :
    Tendsto μs atTop (𝓝 μ) :=
  StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedLawConvergence_lawTendsto
    hproj

/--
Durrett 2019, Theorem 3.10.7, finite-coordinate multivariate CLT from projected
scalar CLTs.

This is the Cramér-Wold assembly step in Durrett's proof: once every continuous
linear projection of the scaled centered vector has the scalar CLT, the vector
itself converges in distribution.
-/
theorem durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT
    {Coordinate Ω Ω' : Type*} [Fintype Coordinate]
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    [CompleteSpace (Coordinate -> ℝ)]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {X : Coordinate -> ℕ -> Ω -> ℝ} {Z : Ω' -> Coordinate -> ℝ}
    (hX_meas : ∀ coordinate i, Measurable (X coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hscalar :
      StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedScalarCLT
        (P := P) (Q := Q) X Z) :
    TendstoInDistribution
      (fun (n : ℕ) ω =>
        √(n : ℝ) •
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEmpiricalMoment X n ω -
            StatInference.AsymptoticStatistics.vaart1998_finiteCoordinatePopulationMoment P X))
      atTop Z (fun _ => P) Q := by
  let B :=
    StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional
      (P := P) (Q := Q) X Z hX_meas hZ_aemeas hscalar
  exact B.cramerWold_vector_clt B.projected_clt

/--
Durrett 2019, Theorem 3.10.7, finite-coordinate multivariate CLT from projected
summand CLTs.

This packages the preceding wrapper with the finite-average algebra that
rewrites the projected empirical vector into the one-dimensional CLT summand
form.
-/
theorem durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT
    {Coordinate Ω Ω' : Type*} [Fintype Coordinate]
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    [CompleteSpace (Coordinate -> ℝ)]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {X : Coordinate -> ℕ -> Ω -> ℝ} {Z : Ω' -> Coordinate -> ℝ}
    (hX_meas : ∀ coordinate i, Measurable (X coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hsummand :
      StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedSummandCLT
        (P := P) (Q := Q) X Z) :
    TendstoInDistribution
      (fun (n : ℕ) ω =>
        √(n : ℝ) •
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEmpiricalMoment X n ω -
            StatInference.AsymptoticStatistics.vaart1998_finiteCoordinatePopulationMoment P X))
      atTop Z (fun _ => P) Q :=
  durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT
    (P := P) (Q := Q) hX_meas hZ_aemeas
    (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedScalarCLT_of_projectedSummandCLT
      (P := P) (Q := Q) hsummand)

/--
Durrett 2019, Theorem 3.10.7, finite-coordinate multivariate CLT from vector
source fields and a Gaussian covariance identification.

The hypotheses are the formal Cramér-Wold source shape: finite second moments
for each coordinate, i.i.d. finite-coordinate sample vectors, a centered
Gaussian vector limit, and equality of every projected limit variance with the
corresponding projected summand variance.
-/
theorem durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource
    {Coordinate Ω Ω' : Type*} [Fintype Coordinate]
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    [CompleteSpace (Coordinate -> ℝ)]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {X : Coordinate -> ℕ -> Ω -> ℝ} {Z : Ω' -> Coordinate -> ℝ}
    (hX_meas : ∀ coordinate i, Measurable (X coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hX_coordinate_memLp : ∀ coordinate, MemLp (X coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coordinate -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coordinate -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedSample L X 0) P)
    (hX_indep :
      _root_.ProbabilityTheory.iIndepFun
        (fun i => StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateSampleVector X i)
        P)
    (hX_ident : ∀ i : ℕ,
      _root_.ProbabilityTheory.IdentDistrib
        (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateSampleVector X i)
        (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateSampleVector X 0)
        P P) :
    TendstoInDistribution
      (fun (n : ℕ) ω =>
        √(n : ℝ) •
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEmpiricalMoment X n ω -
            StatInference.AsymptoticStatistics.vaart1998_finiteCoordinatePopulationMoment P X))
      atTop Z (fun _ => P) Q :=
  durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT
    (P := P) (Q := Q) hX_meas hZ_aemeas
    (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_vectorGaussianSource
      (P := P) (Q := Q) (X := X) (Z := Z)
      (hX_coordinate_memLp := hX_coordinate_memLp)
      (hZ_gaussian := hZ_gaussian) (hZ_memLp := hZ_memLp)
      (hZ_mean := hZ_mean) (hZ_covariance := hZ_covariance)
      (hX_indep := hX_indep) (hX_ident := hX_ident))

/--
Durrett 2019, Theorem 3.10.7, finite-coordinate multivariate CLT from an i.i.d.
common vector law.

This version packages the independence and identical-distribution assumptions
through the common finite-coordinate vector law and the infinite product law of
the sample-vector sequence.
-/
theorem durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource
    {Coordinate Ω Ω' : Type*} [Fintype Coordinate]
    [MeasurableSpace Ω] [MeasurableSpace Ω']
    [PseudoMetricSpace (Coordinate -> ℝ)]
    [SecondCountableTopology (Coordinate -> ℝ)]
    [BorelSpace (Coordinate -> ℝ)]
    [OpensMeasurableSpace (Coordinate -> ℝ)]
    [CompleteSpace (Coordinate -> ℝ)]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    {X : Coordinate -> ℕ -> Ω -> ℝ} {Z : Ω' -> Coordinate -> ℝ}
    {ν : Measure (Coordinate -> ℝ)}
    (hX_meas : ∀ coordinate i, Measurable (X coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hX_coordinate_memLp : ∀ coordinate, MemLp (X coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coordinate -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coordinate -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedSample L X 0) P)
    (hX_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateSampleVector X i)
        ν P)
    (hX_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i =>
          StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateSampleVector X i ω)
        (Measure.infinitePi (fun _ : ℕ => ν)) P) :
    TendstoInDistribution
      (fun (n : ℕ) ω =>
        √(n : ℝ) •
          (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateEmpiricalMoment X n ω -
            StatInference.AsymptoticStatistics.vaart1998_finiteCoordinatePopulationMoment P X))
      atTop Z (fun _ => P) Q :=
  durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT
    (P := P) (Q := Q) hX_meas hZ_aemeas
    (StatInference.AsymptoticStatistics.vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_commonVectorLawGaussianSource
      (P := P) (Q := Q) (X := X) (Z := Z) (ν := ν)
      (hX_coordinate_memLp := hX_coordinate_memLp)
      (hZ_gaussian := hZ_gaussian) (hZ_memLp := hZ_memLp)
      (hZ_mean := hZ_mean) (hZ_covariance := hZ_covariance)
      (hX_vector_law := hX_vector_law)
      (hX_sequence_law := hX_sequence_law))

end ProbabilityTheory
end StatInference
