import StatInference.Matching.WDSM.PositiveVarianceWaldCoverageComponentPositivity
import StatInference.Matching.WDSM.VarianceLimitComponentPositivity

/-!
# Wald coverage from componentwise limiting-variance positivity

This module composes the positive-variance Wald coverage bridges with
componentwise positivity facts for both the limiting variance and the
finite-sample variance estimates.  The first slice handles oracle variance,
including both heterogeneity-positive and residual-positive routes.
-/

namespace StatInference
namespace Matching
namespace WDSM

open MeasureTheory
open Filter
open scoped Topology

variable {Index Sample LimitSample : Type*}
variable [MeasurableSpace Sample] [MeasurableSpace LimitSample]
variable {sampleLaw : MeasureTheory.Measure Sample}
variable {limitLaw : MeasureTheory.Measure LimitSample}
variable [MeasureTheory.IsProbabilityMeasure sampleLaw]
variable [MeasureTheory.IsProbabilityMeasure limitLaw]
variable {l : Filter Index}
variable [l.IsCountablyGenerated]

/-! ## Oracle variance -/

/--
Absolute oracle-variance Wald coverage where the positive limiting variance is
derived from positive heterogeneity and nonnegative residual limits.
-/
theorem absolutePositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components_heterogeneity_pos_limit
    (sampleLawSeq : Index -> Measure Sample)
    (estimator scaledStatistic : Index -> Sample -> Real)
    (heterogeneity residual : Index -> Sample -> Real)
    (target criticalValue scale : Index -> Real)
    (limit : LimitSample -> Real)
    (heterogeneityLimit residualLimit coverageLimit : Real)
    (hscaled :
      TendstoInDistribution scaledStatistic l limit
        (fun _index => sampleLaw) limitLaw)
    (hheterogeneity :
      TendstoInMeasure sampleLaw heterogeneity l
        (fun _sample => heterogeneityLimit))
    (hresidual :
      TendstoInMeasure sampleLaw residual l
        (fun _sample => residualLimit))
    (hheterogeneityLimit_pos : 0 < heterogeneityLimit)
    (hresidualLimit_nonneg : 0 ≤ residualLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
          sampleLaw)
    (hheterogeneity_pos :
      ∀ᶠ index in l, ∀ sample, 0 < heterogeneity index sample)
    (hresidual_nonneg :
      ∀ᶠ index in l, ∀ sample, 0 ≤ residual index sample)
    (hscale_positive : ∀ᶠ index in l, 0 < scale index)
    (habsolute :
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              |waldStudentized (estimator index sample) (target index)
                (standardError
                  (oracleVariance (heterogeneity index sample)
                    (residual index sample)))
                (scale index)| ≤ criticalValue index)) l
        (nhds coverageLimit)) :
    TendstoInDistribution
        (fun index sample =>
          scaledStatistic index sample *
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
        l
        (fun limitSample =>
          limit limitSample *
            (standardError
              (oracleVariance heterogeneityLimit residualLimit))⁻¹)
        (fun _index => sampleLaw) limitLaw ∧
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              waldCovers (estimator index sample) (target index)
                (criticalValue index)
                (standardError
                  (oracleVariance (heterogeneity index sample)
                    (residual index sample)))
                (scale index)))
        l (nhds coverageLimit) := by
  exact
    absolutePositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components_heterogeneity_pos
      (sampleLaw := sampleLaw) (limitLaw := limitLaw) (l := l)
      sampleLawSeq estimator scaledStatistic heterogeneity residual target
      criticalValue scale limit heterogeneityLimit residualLimit coverageLimit
      hscaled hheterogeneity hresidual
      (oracleVarianceLimit_pos_of_heterogeneity_pos heterogeneityLimit
        residualLimit hheterogeneityLimit_pos hresidualLimit_nonneg)
      hinverse_meas hheterogeneity_pos hresidual_nonneg hscale_positive
      habsolute

/--
Two-sided oracle-variance Wald coverage where the positive limiting variance
is derived from positive heterogeneity and nonnegative residual limits.
-/
theorem twoSidedPositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components_heterogeneity_pos_limit
    (sampleLawSeq : Index -> Measure Sample)
    (estimator scaledStatistic : Index -> Sample -> Real)
    (heterogeneity residual : Index -> Sample -> Real)
    (target criticalValue scale : Index -> Real)
    (limit : LimitSample -> Real)
    (heterogeneityLimit residualLimit coverageLimit : Real)
    (hscaled :
      TendstoInDistribution scaledStatistic l limit
        (fun _index => sampleLaw) limitLaw)
    (hheterogeneity :
      TendstoInMeasure sampleLaw heterogeneity l
        (fun _sample => heterogeneityLimit))
    (hresidual :
      TendstoInMeasure sampleLaw residual l
        (fun _sample => residualLimit))
    (hheterogeneityLimit_pos : 0 < heterogeneityLimit)
    (hresidualLimit_nonneg : 0 ≤ residualLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
          sampleLaw)
    (hheterogeneity_pos :
      ∀ᶠ index in l, ∀ sample, 0 < heterogeneity index sample)
    (hresidual_nonneg :
      ∀ᶠ index in l, ∀ sample, 0 ≤ residual index sample)
    (hscale_positive : ∀ᶠ index in l, 0 < scale index)
    (htwoSided :
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              -criticalValue index ≤
                  waldStudentized (estimator index sample) (target index)
                    (standardError
                      (oracleVariance (heterogeneity index sample)
                        (residual index sample)))
                    (scale index) ∧
                waldStudentized (estimator index sample) (target index)
                  (standardError
                    (oracleVariance (heterogeneity index sample)
                      (residual index sample)))
                  (scale index) ≤ criticalValue index)) l
        (nhds coverageLimit)) :
    TendstoInDistribution
        (fun index sample =>
          scaledStatistic index sample *
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
        l
        (fun limitSample =>
          limit limitSample *
            (standardError
              (oracleVariance heterogeneityLimit residualLimit))⁻¹)
        (fun _index => sampleLaw) limitLaw ∧
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              waldCovers (estimator index sample) (target index)
                (criticalValue index)
                (standardError
                  (oracleVariance (heterogeneity index sample)
                    (residual index sample)))
                (scale index)))
        l (nhds coverageLimit) := by
  exact
    twoSidedPositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components_heterogeneity_pos
      (sampleLaw := sampleLaw) (limitLaw := limitLaw) (l := l)
      sampleLawSeq estimator scaledStatistic heterogeneity residual target
      criticalValue scale limit heterogeneityLimit residualLimit coverageLimit
      hscaled hheterogeneity hresidual
      (oracleVarianceLimit_pos_of_heterogeneity_pos heterogeneityLimit
        residualLimit hheterogeneityLimit_pos hresidualLimit_nonneg)
      hinverse_meas hheterogeneity_pos hresidual_nonneg hscale_positive
      htwoSided

/--
Absolute oracle-variance Wald coverage where the positive limiting variance is
derived from positive residual and nonnegative heterogeneity limits.
-/
theorem absolutePositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components_residual_pos_limit
    (sampleLawSeq : Index -> Measure Sample)
    (estimator scaledStatistic : Index -> Sample -> Real)
    (heterogeneity residual : Index -> Sample -> Real)
    (target criticalValue scale : Index -> Real)
    (limit : LimitSample -> Real)
    (heterogeneityLimit residualLimit coverageLimit : Real)
    (hscaled :
      TendstoInDistribution scaledStatistic l limit
        (fun _index => sampleLaw) limitLaw)
    (hheterogeneity :
      TendstoInMeasure sampleLaw heterogeneity l
        (fun _sample => heterogeneityLimit))
    (hresidual :
      TendstoInMeasure sampleLaw residual l
        (fun _sample => residualLimit))
    (hheterogeneityLimit_nonneg : 0 ≤ heterogeneityLimit)
    (hresidualLimit_pos : 0 < residualLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
          sampleLaw)
    (hheterogeneity_nonneg :
      ∀ᶠ index in l, ∀ sample, 0 ≤ heterogeneity index sample)
    (hresidual_pos :
      ∀ᶠ index in l, ∀ sample, 0 < residual index sample)
    (hscale_positive : ∀ᶠ index in l, 0 < scale index)
    (habsolute :
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              |waldStudentized (estimator index sample) (target index)
                (standardError
                  (oracleVariance (heterogeneity index sample)
                    (residual index sample)))
                (scale index)| ≤ criticalValue index)) l
        (nhds coverageLimit)) :
    TendstoInDistribution
        (fun index sample =>
          scaledStatistic index sample *
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
        l
        (fun limitSample =>
          limit limitSample *
            (standardError
              (oracleVariance heterogeneityLimit residualLimit))⁻¹)
        (fun _index => sampleLaw) limitLaw ∧
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              waldCovers (estimator index sample) (target index)
                (criticalValue index)
                (standardError
                  (oracleVariance (heterogeneity index sample)
                    (residual index sample)))
                (scale index)))
        l (nhds coverageLimit) := by
  exact absolutePositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components
    (sampleLaw := sampleLaw) (limitLaw := limitLaw) (l := l)
    sampleLawSeq estimator scaledStatistic heterogeneity residual target
    criticalValue scale limit heterogeneityLimit residualLimit coverageLimit
    hscaled hheterogeneity hresidual
    (oracleVarianceLimit_pos_of_residual_pos heterogeneityLimit residualLimit
      hheterogeneityLimit_nonneg hresidualLimit_pos)
    hinverse_meas
    (eventually_oracleVariance_positive_of_eventually_residual_pos
      (l := l) heterogeneity residual hheterogeneity_nonneg hresidual_pos)
    hscale_positive habsolute

/--
Two-sided oracle-variance Wald coverage where the positive limiting variance is
derived from positive residual and nonnegative heterogeneity limits.
-/
theorem twoSidedPositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components_residual_pos_limit
    (sampleLawSeq : Index -> Measure Sample)
    (estimator scaledStatistic : Index -> Sample -> Real)
    (heterogeneity residual : Index -> Sample -> Real)
    (target criticalValue scale : Index -> Real)
    (limit : LimitSample -> Real)
    (heterogeneityLimit residualLimit coverageLimit : Real)
    (hscaled :
      TendstoInDistribution scaledStatistic l limit
        (fun _index => sampleLaw) limitLaw)
    (hheterogeneity :
      TendstoInMeasure sampleLaw heterogeneity l
        (fun _sample => heterogeneityLimit))
    (hresidual :
      TendstoInMeasure sampleLaw residual l
        (fun _sample => residualLimit))
    (hheterogeneityLimit_nonneg : 0 ≤ heterogeneityLimit)
    (hresidualLimit_pos : 0 < residualLimit)
    (hinverse_meas :
      ∀ index,
        AEMeasurable
          (fun sample =>
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
          sampleLaw)
    (hheterogeneity_nonneg :
      ∀ᶠ index in l, ∀ sample, 0 ≤ heterogeneity index sample)
    (hresidual_pos :
      ∀ᶠ index in l, ∀ sample, 0 < residual index sample)
    (hscale_positive : ∀ᶠ index in l, 0 < scale index)
    (htwoSided :
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              -criticalValue index ≤
                  waldStudentized (estimator index sample) (target index)
                    (standardError
                      (oracleVariance (heterogeneity index sample)
                        (residual index sample)))
                    (scale index) ∧
                waldStudentized (estimator index sample) (target index)
                  (standardError
                    (oracleVariance (heterogeneity index sample)
                      (residual index sample)))
                  (scale index) ≤ criticalValue index)) l
        (nhds coverageLimit)) :
    TendstoInDistribution
        (fun index sample =>
          scaledStatistic index sample *
            (standardError
              (oracleVariance (heterogeneity index sample)
                (residual index sample)))⁻¹)
        l
        (fun limitSample =>
          limit limitSample *
            (standardError
              (oracleVariance heterogeneityLimit residualLimit))⁻¹)
        (fun _index => sampleLaw) limitLaw ∧
      Tendsto
        (fun index =>
          eventProbabilityReal (sampleLawSeq index)
            (fun sample =>
              waldCovers (estimator index sample) (target index)
                (criticalValue index)
                (standardError
                  (oracleVariance (heterogeneity index sample)
                    (residual index sample)))
                (scale index)))
        l (nhds coverageLimit) := by
  exact twoSidedPositiveVarianceWaldCoverage_tendsto_of_oracleVariance_components
    (sampleLaw := sampleLaw) (limitLaw := limitLaw) (l := l)
    sampleLawSeq estimator scaledStatistic heterogeneity residual target
    criticalValue scale limit heterogeneityLimit residualLimit coverageLimit
    hscaled hheterogeneity hresidual
    (oracleVarianceLimit_pos_of_residual_pos heterogeneityLimit residualLimit
      hheterogeneityLimit_nonneg hresidualLimit_pos)
    hinverse_meas
    (eventually_oracleVariance_positive_of_eventually_residual_pos
      (l := l) heterogeneity residual hheterogeneity_nonneg hresidual_pos)
    hscale_positive htwoSided

end WDSM
end Matching
end StatInference
