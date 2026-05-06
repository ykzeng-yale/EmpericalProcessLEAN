import StatInference.Matching.WDSM.ScoreRelations
import StatInference.Matching.WDSM.HajekWeights

/-!
# Prospective/common-weight specializations for WDSM

Prospective sampling is the common-inclusion-weight specialization of the
retrospective framework.  This module proves finite real-algebra reductions
used when treatment-specific weights collapse to a single common weight.
-/

namespace StatInference
namespace Matching
namespace WDSM

open scoped BigOperators

variable {Unit : Type*}

theorem populationPropensityFromSelected_common_weight_eq
    (commonWeight selected : Real) (hweight : commonWeight ≠ 0) :
    populationPropensityFromSelected commonWeight commonWeight selected =
      selected := by
  unfold populationPropensityFromSelected
  field_simp [hweight]
  ring

theorem weight_ratio_eq_one_of_common_weight
    (commonWeight : Real) (hweight : commonWeight ≠ 0) :
    commonWeight / commonWeight = 1 := by
  exact div_self hweight

/-- A constant survey weight factors out of a finite weighted sum. -/
theorem weightedSum_constant_weight_eq
    (sample : Finset Unit) (value : Unit -> Real) (commonWeight : Real) :
    weightedSum sample (fun _unit => commonWeight) value =
      commonWeight * (∑ unit ∈ sample, value unit) := by
  unfold weightedSum
  rw [← Finset.mul_sum]

/-- A constant survey weight factors out of a finite Hájek denominator. -/
theorem weightedDenominator_constant_weight_eq
    (sample : Finset Unit) (commonWeight : Real) :
    weightedDenominator sample (fun _unit => commonWeight) =
      commonWeight * (∑ _unit ∈ sample, (1 : Real)) := by
  unfold weightedDenominator
  calc
    (∑ unit ∈ sample, commonWeight) =
        (∑ unit ∈ sample, commonWeight * (1 : Real)) := by
          exact Finset.sum_congr rfl
            (fun _unit _hunit => by ring)
    _ = commonWeight * (∑ _unit ∈ sample, (1 : Real)) := by
          rw [← Finset.mul_sum]

/-- The finite unit mass is the sample cardinality, coerced to `Real`. -/
theorem finiteUnitMass_eq_card (sample : Finset Unit) :
    (∑ _unit ∈ sample, (1 : Real)) = (sample.card : Real) := by
  simp

/-- A constant-weight Hájek denominator is the common weight times sample size. -/
theorem weightedDenominator_constant_weight_eq_card
    (sample : Finset Unit) (commonWeight : Real) :
    weightedDenominator sample (fun _unit => commonWeight) =
      commonWeight * (sample.card : Real) := by
  rw [weightedDenominator_constant_weight_eq, finiteUnitMass_eq_card]

/--
With a nonzero common survey weight and nonzero finite sample mass, every
normalized survey weight reduces to the inverse of the finite unit mass.
-/
theorem normalizedSurveyWeight_constant_weight_eq_inv_mass
    (sample : Finset Unit) (commonWeight : Real)
    (hweight : commonWeight ≠ 0)
    (hmass : (∑ _unit ∈ sample, (1 : Real)) ≠ 0)
    (unit : Unit) :
    normalizedSurveyWeight sample (fun _unit => commonWeight) unit =
      (1 : Real) / (∑ _unit ∈ sample, (1 : Real)) := by
  unfold normalizedSurveyWeight
  rw [weightedDenominator_constant_weight_eq]
  field_simp [hweight, hmass]

/--
With a nonzero common survey weight and nonzero sample cardinality, every
normalized survey weight reduces to the inverse sample size.
-/
theorem normalizedSurveyWeight_constant_weight_eq_inv_card
    (sample : Finset Unit) (commonWeight : Real)
    (hweight : commonWeight ≠ 0)
    (hcard : (sample.card : Real) ≠ 0)
    (unit : Unit) :
    normalizedSurveyWeight sample (fun _unit => commonWeight) unit =
      (1 : Real) / (sample.card : Real) := by
  rw [normalizedSurveyWeight_constant_weight_eq_inv_mass
    sample commonWeight hweight _ unit]
  · rw [finiteUnitMass_eq_card]
  · simpa [finiteUnitMass_eq_card] using hcard

/--
With a nonzero common survey weight, the Hajek mean equals the ratio formed by
the unweighted finite sum and the finite unit mass `sum 1`.
-/
theorem hajekMean_constant_weight_eq_unweighted_ratio
    (sample : Finset Unit) (value : Unit -> Real) (commonWeight : Real)
    (hweight : commonWeight ≠ 0)
    (hmass : (∑ _unit ∈ sample, (1 : Real)) ≠ 0) :
    hajekMean sample (fun _unit => commonWeight) value =
      (∑ unit ∈ sample, value unit) /
        (∑ _unit ∈ sample, (1 : Real)) := by
  unfold hajekMean
  rw [weightedSum_constant_weight_eq,
    weightedDenominator_constant_weight_eq]
  field_simp [hweight, hmass]

/--
With a nonzero common survey weight, the Hájek mean is the ordinary finite
sample average with denominator `sample.card`.
-/
theorem hajekMean_constant_weight_eq_card_average
    (sample : Finset Unit) (value : Unit -> Real) (commonWeight : Real)
    (hweight : commonWeight ≠ 0)
    (hcard : (sample.card : Real) ≠ 0) :
    hajekMean sample (fun _unit => commonWeight) value =
      (∑ unit ∈ sample, value unit) / (sample.card : Real) := by
  rw [hajekMean_constant_weight_eq_unweighted_ratio
    sample value commonWeight hweight _]
  · rw [finiteUnitMass_eq_card]
  · simpa [finiteUnitMass_eq_card] using hcard

end WDSM
end Matching
end StatInference
