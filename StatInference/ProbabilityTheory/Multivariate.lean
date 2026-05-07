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

open Filter MeasureTheory

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

end ProbabilityTheory
end StatInference
