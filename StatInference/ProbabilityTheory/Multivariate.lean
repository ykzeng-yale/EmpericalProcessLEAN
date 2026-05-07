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
