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

end ProbabilityTheory
end StatInference
