import StatInference.Matching.WDSM.FiniteCellIndicatorEstimatedScoreComponentPositiveVarianceStudentizedBridge
import StatInference.Matching.WDSM.FiniteCellIndicatorEstimatedScorePositiveVarianceWaldBridge

/-!
# Estimated-score Wald bridge constructors from component positivity

This module packages the component-positive estimated-score studentization
constructors into the finite score-cell PATE/PATT Wald bridge objects.  It
removes another manual assembly step from the final estimated-score inference
layer.
-/

namespace StatInference
namespace Matching
namespace WDSM

open MeasureTheory
open scoped Topology

variable {Cell Index Sample LimitSample : Type*}
variable [DecidableEq Cell]
variable [MeasurableSpace Sample] [MeasurableSpace LimitSample]
variable {sampleLaw : MeasureTheory.Measure Sample}
variable {limitLaw : MeasureTheory.Measure LimitSample}
variable [MeasureTheory.IsProbabilityMeasure sampleLaw]
variable [MeasureTheory.IsProbabilityMeasure limitLaw]
variable {l : Filter Index}
variable [l.IsCountablyGenerated]

/-! ## PATE absolute Wald bridge constructors -/

/-- PATE absolute Wald bridge from strict projection slack and nonnegative drift. -/
def pateFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge_of_projection_lt_limit
    (finite_estimated_bridge :
      PATEFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : AbsoluteWaldCoverageVarianceInput Index Sample l) :
    PATEFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pateFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_lt_oracle hdriftLimit_nonneg
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATE absolute Wald bridge from weak projection slack and positive drift. -/
def pateFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge_of_projection_le_drift_pos_limit
    (finite_estimated_bridge :
      PATEFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : AbsoluteWaldCoverageVarianceInput Index Sample l) :
    PATEFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pateFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_le_drift_pos_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_le_oracle hdriftLimit_pos
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATE absolute Wald bridge from fixed-law strict projection slack. -/
def pateFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge_of_fixedLaw_projection_lt_limit
    (finite_estimated_bridge :
      PATEFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : AbsoluteWaldCoverageVarianceInput Index Sample l) :
    PATEFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pateFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_fixedLaw_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction limit
      oracleLimit projectionLimit horacle hprojection
      hprojectionLimit_lt_oracle hinverse_meas
      estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-! ## PATT two-sided Wald bridge constructors -/

/-- PATT two-sided Wald bridge from weak projection slack and positive drift. -/
def pattFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge_of_projection_le_drift_pos_limit
    (finite_estimated_bridge :
      PATTFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : TwoSidedWaldCoverageVarianceInput Index Sample l) :
    PATTFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pattFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_le_drift_pos_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_le_oracle hdriftLimit_pos
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATT two-sided Wald bridge from fixed-law strict projection slack. -/
def pattFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge_of_fixedLaw_projection_lt_limit
    (finite_estimated_bridge :
      PATTFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : TwoSidedWaldCoverageVarianceInput Index Sample l) :
    PATTFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pattFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_fixedLaw_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction limit
      oracleLimit projectionLimit horacle hprojection
      hprojectionLimit_lt_oracle hinverse_meas
      estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATE two-sided Wald bridge from strict projection slack and nonnegative drift. -/
def pateFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge_of_projection_lt_limit
    (finite_estimated_bridge :
      PATEFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : TwoSidedWaldCoverageVarianceInput Index Sample l) :
    PATEFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pateFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_lt_oracle hdriftLimit_nonneg
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATE two-sided Wald bridge from weak projection slack and positive drift. -/
def pateFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge_of_projection_le_drift_pos_limit
    (finite_estimated_bridge :
      PATEFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : TwoSidedWaldCoverageVarianceInput Index Sample l) :
    PATEFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pateFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_le_drift_pos_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_le_oracle hdriftLimit_pos
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATE two-sided Wald bridge from fixed-law strict projection slack. -/
def pateFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge_of_fixedLaw_projection_lt_limit
    (finite_estimated_bridge :
      PATEFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : TwoSidedWaldCoverageVarianceInput Index Sample l) :
    PATEFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pateFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_fixedLaw_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction limit
      oracleLimit projectionLimit horacle hprojection
      hprojectionLimit_lt_oracle hinverse_meas
      estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-! ## PATT absolute Wald bridge constructors -/

/-- PATT absolute Wald bridge from strict projection slack and nonnegative drift. -/
def pattFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge_of_projection_lt_limit
    (finite_estimated_bridge :
      PATTFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : AbsoluteWaldCoverageVarianceInput Index Sample l) :
    PATTFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pattFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_lt_oracle hdriftLimit_nonneg
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATT absolute Wald bridge from weak projection slack and positive drift. -/
def pattFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge_of_projection_le_drift_pos_limit
    (finite_estimated_bridge :
      PATTFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : AbsoluteWaldCoverageVarianceInput Index Sample l) :
    PATTFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pattFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_le_drift_pos_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_le_oracle hdriftLimit_pos
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-- PATT absolute Wald bridge from fixed-law strict projection slack. -/
def pattFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge_of_fixedLaw_projection_lt_limit
    (finite_estimated_bridge :
      PATTFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : AbsoluteWaldCoverageVarianceInput Index Sample l) :
    PATTFiniteScoreCellEstimatedScoreAbsolutePositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pattFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_fixedLaw_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction limit
      oracleLimit projectionLimit horacle hprojection
      hprojectionLimit_lt_oracle hinverse_meas
      estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

/-! ## PATT two-sided Wald bridge constructors -/

/-- PATT two-sided Wald bridge from strict projection slack and nonnegative drift. -/
def pattFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge_of_projection_lt_limit
    (finite_estimated_bridge :
      PATTFiniteScoreCellEstimatedScoreAsymptoticBridge Cell)
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
          sampleLaw)
    (estimated_score_to_scaled_tendsto :
      finite_estimated_bridge.estimated_score_bridge.estimated_score_asymptotic_normality ->
        TendstoInDistribution scaledStatistic l limit
          (fun _index => sampleLaw) limitLaw)
    (coverage_input : TwoSidedWaldCoverageVarianceInput Index Sample l) :
    PATTFiniteScoreCellEstimatedScoreTwoSidedPositiveVarianceWaldBridge Cell
      Index Sample LimitSample sampleLaw limitLaw l where
  studentized_bridge :=
    pattFiniteScoreCellEstimatedScorePositiveVarianceStudentizedBridge_of_projection_lt_limit
      finite_estimated_bridge scaledStatistic oracle projectionReduction
      targetDrift limit oracleLimit projectionLimit targetDriftLimit horacle
      hprojection hdrift hprojectionLimit_lt_oracle hdriftLimit_nonneg
      hinverse_meas estimated_score_to_scaled_tendsto
  coverage_input := coverage_input

end WDSM
end Matching
end StatInference
