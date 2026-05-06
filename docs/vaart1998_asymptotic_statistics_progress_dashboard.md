# van der Vaart 1998 Progress Dashboard

Status date: 2026-05-06.

## Current Lane

Active namespace: `StatInference.AsymptoticStatistics`

Active Lean folder: `StatInference/AsymptoticStatistics/`

Source folder: `Textbooks/VaartAsymStat1998/`

## Verified Frontier

Initial scaffold through the first Chapter 4 method-of-moments layer compiles:

- `StatInference/AsymptoticStatistics/Basic.lean`
- `StatInference/AsymptoticStatistics/MomentEstimators.lean`
- root import from `StatInference.lean`
- route docs under `docs/vaart1998_asymptotic_statistics_*`

The compiled Lean target is Chapter 2, Chapter 3 substrate, and the first
Chapter 4 handoff:

- convergence in probability/distribution notation;
- stochastic `o_P(1)` and `O_P(1)` notation;
- Theorem 2.3 continuous mapping wrapper;
- Lemma 2.8 Slutsky product/add/continuous wrappers;
- Proposition 2.17 iid centered unit-variance CLT wrapper;
- Theorem 3.1 supplied-linearization delta-method bridge.
- Theorem 3.1 deterministic differentiability display
  `vaart1998_hasFDerivAt_delta_remainder_isLittleO`.
- Theorem 3.1 source-shaped scaled-remainder handoff
  `vaart1998_theorem_3_1_delta_method_of_scaled_remainder`.
- law-tail criterion for `O_P(1)`
  `vaart1998_stochasticBounded_of_law_real_norm_tail`.
- localization criterion
  `vaart1998_tendstoInMeasure_zero_of_eventually_subset_tight`.
- Theorem 3.1 tight-localization wrapper
  `vaart1998_theorem_3_1_delta_method_of_localization_tight`.
- Theorem 3.1 ordinary-sequence `O_P(1)` wrapper
  `vaart1998_theorem_3_1_delta_method_of_localization_stochasticBounded`.
- scaled-ball remainder-to-localization bridge
  `vaart1998_delta_remainder_local_subset_of_eventually_small_on_scaled_ball`.
- Theorem 3.1 scaled-ball plus `O_P(1)` wrapper
  `vaart1998_theorem_3_1_delta_method_of_scaled_ball_stochasticBounded`.
- VdV&W tight-law-range to real norm-tail bridge
  `vaart1998_law_real_norm_tail_of_tight_range`.
- tight law range to `O_P(1)` bridge
  `vaart1998_stochasticBounded_of_tight_law_range`.
- weak convergence of laws to real norm-tail bridge
  `vaart1998_law_real_norm_tail_of_weak_convergence`.
- convergence in distribution implies `O_P(1)`
  `vaart1998_stochasticBounded_of_tendstoInDistribution`.
- Theorem 3.1 scaled-ball and localization wrappers that derive the
  scaled-statistic `O_P(1)` field from distributional convergence:
  `vaart1998_theorem_3_1_delta_method_of_scaled_ball_distribution` and
  `vaart1998_theorem_3_1_delta_method_of_localization_distribution`.
- analytic scaled-ball smallness from an `o(‖h‖)` deterministic remainder:
  `vaart1998_delta_remainder_small_on_scaled_ball_of_isLittleO`.
- scaled-ball smallness from `HasFDerivAt` and divergent rates:
  `vaart1998_delta_remainder_small_on_scaled_ball_of_hasFDerivAt_norm_atTop`
  and `vaart1998_delta_remainder_small_on_scaled_ball_of_hasFDerivAt`.
- Theorem 3.1 compact sequence wrapper from differentiability, `r_n -> ∞`,
  and distributional convergence of the scaled statistic:
  `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution`.
- scaled delta-remainder a.e.-measurability helpers:
  `vaart1998_delta_remainder_aemeasurable` and
  `vaart1998_delta_remainder_aemeasurable_of_measurable`.
- Theorem 3.1 compact sequence wrappers that derive the technical
  `hR_meas` side condition from either `T_n` plus `phi ∘ T_n`, or from
  global measurability of `phi`:
  `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution_aemeasurable`
  and
  `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution_measurable`.
- Chapter 4 method-of-moments module:
  `StatInference/AsymptoticStatistics/MomentEstimators.lean`.
- textbook-rate helper:
  `vaart1998_sqrt_nat_tendsto_atTop`.
- local inverse/delta certificate:
  `Vaart1998MomentLocalInverseCertificate`.
- Theorem 4.1 supplied empirical-moment CLT to moment-estimator asymptotic
  normality:
  `vaart1998_theorem_4_1_moment_estimator_delta_method`,
  `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method`, and their
  certificate variants.
- local range/moment-equation certificate:
  `Vaart1998MomentLocalRangeCertificate`.
- local-range probability certificate:
  `Vaart1998MomentEstimatorLocalRangeProbabilityCertificate`.
- deterministic solve, uniqueness, parameter-domain membership, and supplied
  local-range probability wrappers:
  `vaart1998_theorem_4_1_moment_estimator_solves_on_local_range`,
  `vaart1998_theorem_4_1_moment_estimator_thetaHat_solves_on_local_range`,
  `vaart1998_theorem_4_1_moment_estimator_unique_on_parameterDomain`,
  `vaart1998_theorem_4_1_moment_estimator_mem_parameterDomain_on_local_range`,
  and `vaart1998_theorem_4_1_local_range_probability_of_certificate`.
- inverse-function-theorem constructors:
  `vaart1998_momentLocalInverseCertificate_of_hasStrictFDerivAt` and
  `vaart1998_momentLocalRangeCertificate_of_hasStrictFDerivAt`.
- open inverse-function-theorem neighborhood facts:
  `vaart1998_hasStrictFDerivAt_open_local_parameterDomain`,
  `vaart1998_hasStrictFDerivAt_open_local_momentRange`,
  `vaart1998_hasStrictFDerivAt_theta0_mem_local_parameterDomain`, and
  `vaart1998_hasStrictFDerivAt_eta0_mem_local_momentRange`.
- open-neighborhood local range certificate:
  `vaart1998_momentLocalRangeCertificate_of_hasStrictFDerivAt_openPartialHomeomorph`.
- convergence-in-probability to local-range probability bridge:
  `vaart1998_local_range_probability_of_tendstoInMeasure_const`.
- local-range probability certificate constructor from convergence in
  probability:
  `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_tendstoInMeasure`.
- Chapter 2 almost-sure to in-probability bridge:
  `vaart1998_tendstoInMeasure_of_tendsto_ae`.
- empirical-moment a.s.-to-probability handoff:
  `vaart1998_empiricalMoment_tendstoInMeasure_of_ae_tendsto_const`.
- local-range probability certificate from a.s. empirical-moment convergence:
  `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_ae_tendsto`.
- open inverse-function-theorem local-range probability:
  `vaart1998_theorem_4_1_open_local_range_probability_of_hasStrictFDerivAt`.
- strict-differentiability plus convergence-in-probability local-range
  probability certificate constructor:
  `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_hasStrictFDerivAt_tendstoInMeasure`.
- strict-differentiability plus a.s. empirical-moment convergence local-range
  probability constructor:
  `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_hasStrictFDerivAt_ae_tendsto`.
- moment-equation solved-with-probability wrappers:
  `vaart1998_theorem_4_1_moment_equation_solved_with_probability_tending_to_one`,
  `vaart1998_theorem_4_1_moment_equation_solved_with_probability_tending_to_one_of_certificate`,
  and
  `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_hasStrictFDerivAt_tendstoInMeasure`.
- strict-differentiability plus a.s. empirical-moment convergence solved-with
  probability wrapper:
  `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_hasStrictFDerivAt_ae_tendsto`.
- finite-coordinate real empirical-moment strong-law and convergence-in
  probability handoffs:
  `vaart1998_finiteCoordinate_empiricalMoment_tendsto_ae_real` and
  `vaart1998_finiteCoordinate_empiricalMoment_tendstoInMeasure_real`.
- strict-differentiability plus finite-coordinate strong-law local-existence
  wrapper:
  `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_hasStrictFDerivAt_finiteCoordinateStrongLaw_real`.
- finite-coordinate real Theorem 4.1 existence-plus-delta assembler:
  `vaart1998_theorem_4_1_finiteCoordinateStrongLaw_sqrt_exists_and_delta_method_real`.
- finite-coordinate empirical-moment measurability helpers:
  `vaart1998_finiteCoordinate_empiricalMoment_measurable_real` and
  `vaart1998_finiteCoordinate_empiricalMoment_aestronglyMeasurable_real`.
- measurable-coordinate Theorem 4.1 source wrapper:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_delta_method_real`.
- linear inverse-derivative Gaussian limit bridge:
  `vaart1998_theorem_4_1_gaussian_limit_of_linear_inverse_derivative`.
- measurable-coordinate Theorem 4.1 Gaussian-limit source wrapper:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_real`.
- coordinate-free covariance display helpers:
  `vaart1998_limitCovarianceFunctional`,
  `vaart1998_inverseDerivativeCovarianceFunctional`, and
  `vaart1998_limitCovarianceFunctional_inverseDerivative_apply`.
- measurable-coordinate Theorem 4.1 Gaussian-limit source wrapper with
  covariance display:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceDisplay_real`.
- covarianceBilinDual bridges for square-integrable laws:
  `vaart1998_limitCovarianceFunctional_eq_covarianceBilinDual_map` and
  `vaart1998_covarianceBilinDual_inverseDerivative_map_apply`.
- inverse-derivative measurability and square-integrability propagation:
  `vaart1998_inverseDerivative_aemeasurable_of_aemeasurable`,
  `vaart1998_inverseDerivative_map_memLp_of_memLp`, and
  `vaart1998_covarianceBilinDual_inverseDerivative_map_apply_of_memLp`.

Verification passed for the latest pushed Vaart packet before this run,
`e18d286`:

- `lake env lean StatInference/AsymptoticStatistics/MomentEstimators.lean`
- `lake build StatInference.AsymptoticStatistics.MomentEstimators`

Current Vaart packet verification passed for:

- `lake env lean StatInference/AsymptoticStatistics/Basic.lean`
- `lake build StatInference.AsymptoticStatistics.Basic`
- `lake env lean StatInference/AsymptoticStatistics/MomentEstimators.lean`
- `lake build StatInference.AsymptoticStatistics.MomentEstimators`
- `git diff --check`
- proof-hole and secret scans on changed Vaart files

Root build note: `lake build StatInference` was attempted in the clean sibling
worktree using a symlinked Lake cache.  It rebuilt the Vaart module and several
root dependencies, then failed at the final root import because the symlinked
cache was missing `StatInference/EmpiricalProcess/RealHalfLine.olean`.  No
Vaart declaration failed; the reliable gate for this packet is the focused and
targeted Vaart module build.

## Next Aggressive Target

Continue Vaart Chapter 4.1 from the compiled Gaussian, covarianceBilinDual, and
MemLp-propagation handoff:

1. package the covarianceBilinDual pullback directly into the source Theorem
   4.1 wrapper under a single original-law `MemLp` hypothesis;
2. add a local-inverse measurability convenience from the open partial
   homeomorphism/local continuity API if it can be done without widening the
   topology assumptions too much;
3. keep the actual multivariate CLT supplied until a local vector CLT is
   formalized from the scalar mathlib CLT or another local dependency.

If this blocks, record the exact missing theorem shape for the supplied
empirical-moment CLT, covariance-display, or local-inverse measurability field
and continue with the widest Chapter 4 wrapper that compiles.

## Reuse Dependencies

High-value local dependencies:

- `ProbabilityMeasure.WeakConvergence` for CMT/Slutsky and probability-measure
  weak convergence;
- `ProbabilityMeasure.StrongLaw` for LLN support;
- `ProbabilityMeasure.ProductMeasure` for iid/product-law support;
- `EmpiricalProcess.GlivenkoCantelli` and `EmpiricalProcess.Theorem243` for
  later M/Z-estimator and empirical-process chapters;
- `EmpiricalProcess.HilbertGaussian` for later Gaussian process and
  semiparametric chapters;
- `Asymptotics.Basic` for deterministic oracle/remainder scaffolding.

## Later Route

- Chapters 2-4: stochastic convergence, delta method, moment estimators.
- Chapter 5: M/Z-estimator consistency, asymptotic normality, rates, argmax.
- Chapters 6-8: contiguity, LAN, efficiency.
- Chapters 9-10: limits of experiments and Bayes/BvM.
- Chapters 11-17: projection, U-statistics, rank/sign/permutation, testing,
  likelihood-ratio and chi-square tests.
- Chapters 18-20: metric-space weak convergence, empirical processes,
  functional delta method.
- Chapters 21-25: quantiles, L-statistics, bootstrap, density estimation,
  semiparametric models.
