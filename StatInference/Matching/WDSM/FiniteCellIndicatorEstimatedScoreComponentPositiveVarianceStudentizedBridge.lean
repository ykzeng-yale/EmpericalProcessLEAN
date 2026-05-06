import StatInference.Matching.WDSM.FiniteCellIndicatorEstimatedScorePositiveVarianceStudentizedBridge
import StatInference.Matching.WDSM.VarianceLimitComponentPositivity

/-!
# Estimated-score studentization inputs from component positivity

This module builds the positive-variance studentization input used by the
finite score-cell estimated-score bridge directly from the estimated-score
variance components.  It removes another raw assembled-variance premise from
the final finite-cell inference layer.
-/

namespace StatInference
namespace Matching
namespace WDSM

open MeasureTheory
open scoped Topology

variable {Index Sample LimitSample : Type*}
variable [MeasurableSpace Sample] [MeasurableSpace LimitSample]
variable {sampleLaw : MeasureTheory.Measure Sample}
variable {limitLaw : MeasureTheory.Measure LimitSample}
variable [MeasureTheory.IsProbabilityMeasure sampleLaw]
variable [MeasureTheory.IsProbabilityMeasure limitLaw]
variable {l : Filter Index}
variable [l.IsCountablyGenerated]

/--
Changing-law estimated-score studentization input where positive limiting
variance is derived from strict projection slack and nonnegative target drift.
-/
def estimatedScorePositiveVarianceStudentizationInput_of_projection_lt_limit
    (scaledStatistic : Index -> Sample -> Real)
    (oracle projectionReduction targetDrift : Index -> Sample -> Real)
    (limit : LimitSample -> Real)
    (oracleLimit projectionLimit targetDriftLimit : Real)
    (horacle :
      TendstoInMeasure sampleLaw oracle l (fun _sample => oracleLimit))
    (hprojection :
      TendstoInMeasure sampleLaw projectionReduction l
        (fun _sample => projectionLimit))
    (hdrift :
      TendstoInMeasure sampleLaw targetDrift l
        (fun _sample => targetDriftLimit))
    (hprojectionLimit_lt_oracle : projectionLimit < oracleLimit)
    (hdriftLimit_nonneg : 0 ≤ targetDriftLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (estimatedScoreVariance (oracle index sample)
                (projectionReduction index sample)
                (targetDrift index sample)))⁻¹)
          sampleLaw) :
    EstimatedScorePositiveVarianceStudentizationInput Index Sample
      LimitSample sampleLaw limitLaw l where
  scaledStatistic := scaledStatistic
  varianceEstimate := fun index sample =>
    estimatedScoreVariance (oracle index sample)
      (projectionReduction index sample) (targetDrift index sample)
  limit := limit
  varianceLimit :=
    estimatedScoreVariance oracleLimit projectionLimit targetDriftLimit
  varianceLimit_pos :=
    estimatedScoreVarianceLimit_pos_of_projection_lt_oracle_of_drift_nonneg
      oracleLimit projectionLimit targetDriftLimit
      hprojectionLimit_lt_oracle hdriftLimit_nonneg
  variance_tendsto :=
    tendstoInMeasure_estimatedScoreVariance_of_tendstoInMeasure_components
      (sampleLaw := sampleLaw) (l := l)
      oracle projectionReduction targetDrift oracleLimit projectionLimit
      targetDriftLimit horacle hprojection hdrift
  inverseStandardError_measurable := hinverse_meas

/--
Changing-law estimated-score studentization input where weak projection slack
is rescued by a positive target-drift limit.
-/
def estimatedScorePositiveVarianceStudentizationInput_of_projection_le_drift_pos_limit
    (scaledStatistic : Index -> Sample -> Real)
    (oracle projectionReduction targetDrift : Index -> Sample -> Real)
    (limit : LimitSample -> Real)
    (oracleLimit projectionLimit targetDriftLimit : Real)
    (horacle :
      TendstoInMeasure sampleLaw oracle l (fun _sample => oracleLimit))
    (hprojection :
      TendstoInMeasure sampleLaw projectionReduction l
        (fun _sample => projectionLimit))
    (hdrift :
      TendstoInMeasure sampleLaw targetDrift l
        (fun _sample => targetDriftLimit))
    (hprojectionLimit_le_oracle : projectionLimit ≤ oracleLimit)
    (hdriftLimit_pos : 0 < targetDriftLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (estimatedScoreVariance (oracle index sample)
                (projectionReduction index sample)
                (targetDrift index sample)))⁻¹)
          sampleLaw) :
    EstimatedScorePositiveVarianceStudentizationInput Index Sample
      LimitSample sampleLaw limitLaw l where
  scaledStatistic := scaledStatistic
  varianceEstimate := fun index sample =>
    estimatedScoreVariance (oracle index sample)
      (projectionReduction index sample) (targetDrift index sample)
  limit := limit
  varianceLimit :=
    estimatedScoreVariance oracleLimit projectionLimit targetDriftLimit
  varianceLimit_pos :=
    estimatedScoreVarianceLimit_pos_of_projection_le_oracle_of_drift_pos
      oracleLimit projectionLimit targetDriftLimit
      hprojectionLimit_le_oracle hdriftLimit_pos
  variance_tendsto :=
    tendstoInMeasure_estimatedScoreVariance_of_tendstoInMeasure_components
      (sampleLaw := sampleLaw) (l := l)
      oracle projectionReduction targetDrift oracleLimit projectionLimit
      targetDriftLimit horacle hprojection hdrift
  inverseStandardError_measurable := hinverse_meas

/--
Fixed-law estimated-score studentization input where positive limiting variance
is derived from strict projection slack.
-/
def fixedLawEstimatedScorePositiveVarianceStudentizationInput_of_projection_lt_limit
    (scaledStatistic : Index -> Sample -> Real)
    (oracle projectionReduction : Index -> Sample -> Real)
    (limit : LimitSample -> Real)
    (oracleLimit projectionLimit : Real)
    (horacle :
      TendstoInMeasure sampleLaw oracle l (fun _sample => oracleLimit))
    (hprojection :
      TendstoInMeasure sampleLaw projectionReduction l
        (fun _sample => projectionLimit))
    (hprojectionLimit_lt_oracle : projectionLimit < oracleLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (estimatedScoreVariance (oracle index sample)
                (projectionReduction index sample) 0))⁻¹)
          sampleLaw) :
    EstimatedScorePositiveVarianceStudentizationInput Index Sample
      LimitSample sampleLaw limitLaw l where
  scaledStatistic := scaledStatistic
  varianceEstimate := fun index sample =>
    estimatedScoreVariance (oracle index sample)
      (projectionReduction index sample) 0
  limit := limit
  varianceLimit := estimatedScoreVariance oracleLimit projectionLimit 0
  varianceLimit_pos :=
    fixedLawEstimatedScoreVarianceLimit_pos_of_projection_lt_oracle
      oracleLimit projectionLimit hprojectionLimit_lt_oracle
  variance_tendsto :=
    tendstoInMeasure_fixedLawEstimatedScoreVariance_of_tendstoInMeasure_components
      (sampleLaw := sampleLaw) (l := l)
      oracle projectionReduction oracleLimit projectionLimit
      horacle hprojection
  inverseStandardError_measurable := hinverse_meas

end WDSM
end Matching
end StatInference
