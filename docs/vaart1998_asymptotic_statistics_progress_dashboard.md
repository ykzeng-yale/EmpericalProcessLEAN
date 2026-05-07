# van der Vaart 1998 Progress Dashboard

Status date: 2026-05-07.

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
- measurable-coordinate Theorem 4.1 Gaussian-limit source wrapper with the
  canonical covarianceBilinDual display:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_real`.
- local-inverse a.e.-measurability helpers:
  `vaart1998_openPartialHomeomorph_symm_aemeasurable_on_target`,
  `vaart1998_localInverse_aemeasurable_on_open_momentRange`, and
  `vaart1998_localInverse_aemeasurable_of_ae_mem_open_momentRange`.
- empirical-moment composition bridge for localized local inverses:
  `vaart1998_localInverse_comp_empiricalMoment_aemeasurable_of_ae_mem_open_momentRange`.
- Chapter 4.1 delta handoffs that require only a.e.-measurability of the
  composed local inverse:
  `vaart1998_theorem_4_1_moment_estimator_delta_method_aemeasurable` and
  `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_aemeasurable`.
- finite-coordinate Theorem 4.1 source assemblers that replace global
  local-inverse measurability by composed a.e.-measurability or by a.e.
  localization in the open moment range:
  `vaart1998_theorem_4_1_finiteCoordinateStrongLaw_sqrt_exists_and_delta_method_aemeasurable_real`,
  `vaart1998_theorem_4_1_finiteCoordinateStrongLaw_sqrt_exists_and_delta_method_of_ae_mem_open_momentRange_real`,
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_delta_method_aemeasurable_real`, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_delta_method_of_ae_mem_open_momentRange_real`.
- measurable-coordinate Gaussian-limit Theorem 4.1 source wrappers with the
  same a.e.-measurable/localized local-inverse interface:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_aemeasurable_real` and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_of_ae_mem_open_momentRange_real`.
- measurable-coordinate covariance-display and covarianceBilinDual Theorem
  4.1 source wrappers with the same a.e.-measurable/localized local-inverse
  interface:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceDisplay_aemeasurable_real`,
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceDisplay_of_ae_mem_open_momentRange_real`,
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_aemeasurable_real`, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_of_ae_mem_open_momentRange_real`.
- finite-coordinate empirical-moment CLT interface for Vaart Example 2.18:
  `vaart1998_finiteCoordinateEmpiricalMoment`,
  `vaart1998_finiteCoordinatePopulationMoment`, and
  `Vaart1998FiniteCoordinateEmpiricalMomentCLTCertificate`.
- certificate-fed localized covarianceBilinDual Theorem 4.1 source wrapper:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_of_cltCertificate_real`.
- Cramér-Wold-facing projected scalar CLT layer:
  `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT`,
  `Vaart1998FiniteCoordinateCramerWoldCLTBridge`,
  `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT_of_cltCertificate`, and
  `vaart1998_finiteCoordinateEmpiricalMomentCLTCertificate_of_cramerWoldBridge`.
- Real-valued projected centered-average CLT bridge layer:
  `vaart1998_finiteCoordinateProjectedEmpiricalAverage`,
  `vaart1998_finiteCoordinateProjectedPopulationMoment`,
  `vaart1998_finiteCoordinateProjected_scaled_centered_empiricalMoment_eq`,
  `vaart1998_finiteCoordinateProjectedScalarCLT`,
  `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT_of_projectedScalarCLT`,
  and
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT`.
- Law-level Cramér-Wold handoff layer:
  `vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment`,
  `vaart1998_finiteCoordinate_scaledCenteredEmpiricalMoment_measurable_real`,
  `vaart1998_finiteCoordinate_scaledCenteredEmpiricalMoment_aemeasurable_real`,
  `vaart1998_finiteCoordinate_scaledCenteredEmpiricalMoment_aestronglyMeasurable_real`,
  `vaart1998_finiteCoordinateEmpiricalMomentCLT_of_law_tendsto`, and
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_lawTendsto`.
- Projected probability-law Cramér-Wold layer:
  `vaart1998_finiteCoordinateScaledCenteredEmpiricalMomentLaw`,
  `vaart1998_finiteCoordinateVectorLimitLaw`,
  `vaart1998_finiteCoordinateProjectedLawConvergence`,
  `vaart1998_finiteCoordinateProjectedLawConvergence_of_projectedCLT`, and
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_projectedLaw`.
- Finite covariance-table display layer:
  `vaart1998_covarianceTable`,
  `vaart1998_inverseDerivativeCovarianceTable_apply`,
  `vaart1998_covarianceBilinDual_inverseDerivative_table_apply_of_memLp`,
  `vaart1998_finiteCoordinateEvalCLM`,
  `vaart1998_finiteCoordinateEvalCLM_apply`, and
  `vaart1998_finiteCoordinateCovarianceTable`.
- CLT-certificate covariance-table endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cltCertificate_real`.
- Cramér-Wold bridge covariance-table endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cramerWoldBridge_real`.
- Projected-law characteristic-function bridge:
  `vaart1998_finiteCoordinateProjectedLawConvergence_charFunDual`.
- Euclidean/`PiLp 2` law convergence from projected finite-coordinate laws:
  `vaart1998_finiteCoordinateProjectedLawConvergence_euclideanLaw`.
- Pure law-level finite-dimensional Cramér-Wold theorem:
  `vaart1998_finiteCoordinateProjectedLawConvergence_lawTendsto`.
- Projected-scalar-CLT Cramér-Wold bridge constructor:
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional`.
- Projected-scalar-CLT Theorem 4.1 covariance-table endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedScalarCLT_real`.
- Projected summand scalar CLT source layer:
  `vaart1998_finiteCoordinateProjectedSample`,
  `vaart1998_finiteCoordinateProjectedEmpiricalAverage_eq_inv_mul_sum_sample`,
  `vaart1998_finiteCoordinateProjectedScalarCLT_expression_eq_sum`,
  `vaart1998_finiteCoordinateProjectedSummandCLT`, and
  `vaart1998_finiteCoordinateProjectedScalarCLT_of_projectedSummandCLT`.
- Projected-summand-CLT Theorem 4.1 covariance-table endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedSummandCLT_real`.
- Mathlib one-dimensional CLT source theorem for projected summands:
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT`.
- Projected mean field from finite-coordinate integrability:
  `vaart1998_finiteCoordinateProjectedSample_integral_eq_populationMoment`.
- Mathlib one-dimensional CLT source theorem with the mean field discharged
  from finite-coordinate integrability:
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_integrableMean`.
- Vector-valued finite-coordinate source fields transported to projected
  summand source fields:
  `vaart1998_finiteCoordinateSampleVector`,
  `vaart1998_finiteCoordinateProjectedSample_memLp_of_vectorMemLp`,
  `vaart1998_finiteCoordinateProjectedSample_iIndepFun_of_vector_iIndepFun`,
  `vaart1998_finiteCoordinateProjectedSample_identDistrib_of_vector_identDistrib`,
  and
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_vectorSource`.
- Gaussian/covariance source fields transported to projected scalar Gaussian
  laws and then to the projected summand CLT:
  `vaart1998_finiteCoordinateProjectedGaussianLimitLaw_of_zeroMean_variance`,
  `vaart1998_finiteCoordinateProjectedGaussianLimitLaw_of_covarianceBilinDual`,
  and
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_vectorGaussianSource`.
- Theorem 4.1 covariance-table endpoint consuming vector-valued source fields
  plus Gaussian/covariance source fields directly:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_vectorGaussianSource_real`.
- Coordinatewise `MemLp 2` source constructor for the finite-coordinate sample
  vector and projected summand CLT:
  `vaart1998_finiteCoordinateSampleVector_memLp_of_coordinate_memLp` and
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_vectorGaussianSource`.
- Theorem 4.1 covariance-table endpoint variant consuming coordinatewise
  `MemLp 2` instead of separate integrability and vector `MemLp` fields:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_coordinateMemLp_vectorGaussianSource_real`.
- Strong vector-law source constructors for the finite-coordinate sample-vector
  sequence:
  `vaart1998_finiteCoordinateSampleVector_iIndepFun_of_hasLaw_infinitePi`,
  `vaart1998_finiteCoordinateSampleVector_identDistrib_of_common_hasLaw`, and
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_commonVectorLawGaussianSource`.
- Theorem 4.1 covariance-table endpoint variant using coordinatewise `MemLp 2`,
  a common vector law, and the infinite-product law of the sample-vector
  sequence:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_coordinateMemLp_commonVectorLawGaussianSource_real`.
- Canonical iid infinite-product sample-space source package:
  `vaart1998_finiteCoordinateCanonicalSampleVector_hasLaw`,
  `vaart1998_finiteCoordinateCanonicalSampleVector_sequence_hasLaw`, and
  `vaart1998_finiteCoordinateCanonicalSampleVector_commonVectorLawSource`.
- Coordinate LLN source constructors from vector source assumptions plus
  coordinate evaluation measurability:
  `vaart1998_finiteCoordinateCoordinate_iIndepFun_of_vector_iIndepFun`,
  `vaart1998_finiteCoordinateCoordinate_pairwise_indepFun_of_vector_iIndepFun`,
  `vaart1998_finiteCoordinateCoordinate_identDistrib_of_vector_identDistrib`,
  and `vaart1998_finiteCoordinateCoordinateLLNSource_of_commonVectorLaw`.
- Theorem 4.1 covariance-table endpoint variant using the common-vector-law and
  coordinate-evaluation-measurability source package:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_coordinateMemLp_commonVectorLawCoordinateSource_real`.
- Canonical iid product-sample coordinate source package:
  `vaart1998_finiteCoordinateCanonicalSample_coordinate_measurable`,
  `vaart1998_finiteCoordinateCanonicalSample_coordinate_memLp`, and
  `vaart1998_finiteCoordinateCanonicalSample_coordinateSource`.
- Canonical iid product-space Theorem 4.1 covariance-table endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalProductSource_real`.
- Canonical iid product-sample source identities:
  `vaart1998_finiteCoordinateCanonicalSample_populationMoment_eq_integral`
  identifies the product-sample population moment with the coordinatewise
  vector-law mean, and
  `vaart1998_finiteCoordinateCanonicalProjectedSample_variance_eq` identifies
  each projected product-sample summand variance with the corresponding
  vector-law projection variance.
- Canonical vector-law source endpoint:
  `vaart1998_finiteCoordinateCanonicalSample_trueMoment_eq_populationMoment`
  and
  `vaart1998_finiteCoordinateCanonicalSample_covariance_eq_projectedVariance`
  convert vector-law mean and variance identities into the product-space
  source fields, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalVectorLawSource_real`
  exposes those cleaner `ν`-side hypotheses at the Theorem 4.1 endpoint.
- Canonical vector-law mean-zero endpoint:
  `vaart1998_finiteCoordinateProjectedMean_eq_zero_of_map_mean_zero` derives
  all projected zero means from `(Q.map Z)[id] = 0`, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawSource_real`
  exposes that mean-zero vector-law source at the Theorem 4.1 endpoint.
- Canonical vector-law covariance-table endpoint:
  `vaart1998_continuousBilinearMap_eq_of_diagonal` and
  `vaart1998_covarianceBilinDual_eq_of_diagonal_variance` turn diagonal
  projected-variance identities into full off-diagonal covariance identities,
  and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSource_real`
  states the final covariance table under the common vector law `ν`.
- Vector-law source certificate:
  `Vaart1998FiniteCoordinateVectorLawSource` bundles coordinate evaluation
  measurability and coordinate `MemLp 2` under `ν`.
  `Vaart1998FiniteCoordinateVectorLawSource.memLp_id` and
  `Vaart1998FiniteCoordinateVectorLawSource.canonicalCoordinateSource` expose
  the reusable consequences, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_real`
  consumes that certificate at the canonical Theorem 4.1 endpoint.
- Direct a.e.-measurable local-inverse endpoints:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_of_cltCertificate_aemeasurable_real`
  and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cltCertificate_aemeasurable_real`
  expose the CLT-certificate route without requiring a separate target-event
  field for every empirical moment.
- Projected-summand a.e.-measurable endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedSummandCLT_aemeasurable_real`
  keeps the projected scalar-CLT/Cramér-Wold construction internal while
  consuming direct a.e. measurability of the empirical local inverse.
- Canonical source-certificate a.e.-measurable endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_aemeasurable_real`
  specializes the direct local-inverse measurability route to the canonical iid
  product sample space and vector-law source certificate, with the final
  covariance table displayed under the common vector law `ν`.
- Local-inverse measurability constructors:
  `vaart1998_localInverse_comp_empiricalMoment_aemeasurable_of_measurable` and
  `vaart1998_finiteCoordinate_localInverse_comp_empiricalMoment_aemeasurable_of_measurable_real`
  build the empirical local-inverse `AEMeasurable` field from ordinary
  measurability of `he.localInverse e De theta0`.
- Canonical measurable-local-inverse endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_measurableLocalInverse_real`
  feeds those constructors into the canonical vector-law source certificate.
- Named empirical local-inverse measurability certificate:
  `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate`
  packages the empirical local-inverse `AEMeasurable` family.
  `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate.of_measurableLocalInverse_real`
  and
  `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate.of_ae_mem_open_momentRange_real`
  build it from the two current source routes.
- Canonical local-inverse-certificate endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_localInverseCertificate_real`
  consumes the named certificate at the canonical source boundary.
- Named target-localization certificate:
  `Vaart1998FiniteCoordinateEmpiricalTargetLocalizationCertificate` packages
  the a.e. membership of empirical moments in the inverse-function-theorem
  target.
  `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate.of_targetLocalization_real`
  bridges it into the local-inverse measurability certificate, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_targetLocalization_real`
  consumes it at the canonical source boundary.
- Target-probability localization certificate:
  `Vaart1998FiniteCoordinateEmpiricalTargetProbabilityLocalizationCertificate`
  packages the Vaart existence/local-range probability conclusion that
  empirical moments enter the inverse-function-theorem target with probability
  tending to one.
  `Vaart1998FiniteCoordinateEmpiricalTargetProbabilityLocalizationCertificate.of_tendstoInMeasure_real`
  and
  `.of_finiteCoordinateStrongLaw_real`
  construct it from convergence in probability and from the coordinatewise
  strong law.
- Target-probability consumers:
  `vaart1998_theorem_4_1_moment_estimator_mem_parameterDomain_with_probability_tending_to_one`
  packages the generic local-parameter-domain probability handoff, while
  `vaart1998_theorem_4_1_local_inverse_mem_parameterDomain_of_targetProbabilityLocalization_real`
  and
  `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_targetProbabilityLocalization_real`
  consume the finite-coordinate target-probability certificate directly.
- Chapter 2 asymptotic equivalence:
  `vaart1998_probability_tending_to_one_of_subset` packages the monotone
  high-probability-event transfer used by source estimator-selection events.
  `vaart1998_tendstoInMeasure_zero_of_eq_with_probability_tending_to_one`
  proves that equality with probability tending to one gives a zero
  convergence-in-probability difference, and
  `vaart1998_tendstoInDistribution_of_eq_with_probability_tending_to_one`
  transfers convergence in distribution by Slutsky.
- Chapter 4 measurable-estimator asymptotic equivalence:
  `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_of_eq_with_probability_tending_to_one`
  proves that any a.e.-measurable estimator whose scaled version agrees with
  the local-inverse candidate with probability tending to one inherits the same
  `sqrt n` delta-method limit.
- Finite-coordinate measurable-estimator endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_estimator_delta_method_of_eq_with_probability_tending_to_one_real`
  specializes the previous wrapper to the finite-coordinate Theorem 4.1 source
  route and returns both local solving with probability tending to one and the
  actual estimator's `sqrt n` weak limit.
- Event-certificate measurable-estimator endpoint:
  `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_of_eq_on_event_with_probability_tending_to_one`
  derives the equality-probability and scaled equality measurability fields
  from a high-probability good event plus ordinary measurability of the
  estimator, empirical moment, and local inverse.
- Target-localization finite-coordinate endpoint:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_estimator_delta_method_of_targetProbabilityLocalization_eq_on_target_real`
  consumes the inverse-function-theorem target-probability certificate and an
  equality-on-target field for the selected estimator.
- Canonical selected-estimator endpoint:
  `vaart1998_localInverseFallbackExtension`,
  `vaart1998_localInverseFallbackExtension_measurable`,
  `vaart1998_localInverseFallbackExtension_hasFDerivAt`, and
  `vaart1998_localInverseFallbackExtension_apply_true_moment` remove the need
  for global measurability of the raw local inverse in the canonical selected
  estimator route.
  `vaart1998_finiteCoordinateLocalInverseSelectedEstimator`,
  `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_measurable_real`,
  and
  `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_eq_on_target_real`
  package the local-inverse-on-target/fallback-outside-target construction.
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_selectedEstimator_delta_method_of_targetProbabilityLocalization_real`
  now consumes that construction and the target-localization certificate without
  assuming `Measurable (he.localInverse e De theta0)`.
- Selected-estimator Gaussian and covariance endpoints:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_of_targetProbabilityLocalization_real`,
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceDisplay_of_targetProbabilityLocalization_real`,
  and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceBilinDual_of_targetProbabilityLocalization_real`
  push that canonical fallback-selected estimator through the Gaussian limit,
  coordinate-free covariance display, and covarianceBilinDual display without
  assuming global raw local-inverse measurability.
- Selected-estimator CLT-certificate and covariance-table endpoints:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceBilinDual_of_cltCertificate_targetProbabilityLocalization_real`,
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceTable_of_targetProbabilityLocalization_real`,
  and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceTable_of_cltCertificate_targetProbabilityLocalization_real`
  package the actual fallback-selected estimator through the CLT certificate
  and finite covariance-table displays.
- Canonical vector-law/covariance source endpoint for the actual
  fallback-selected estimator:
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_real`
  builds both the target-probability localization certificate and the
  empirical-moment CLT certificate internally, then displays the final
  covariance table under the common vector law `ν`.
- Selected-estimator source-neighborhood and solving-probability consumers:
  `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_mem_source_of_targetProbabilityLocalization_real`
  and
  `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_solves_momentEquation_with_probability_of_targetProbabilityLocalization_real`
  transfer the target-probability localization event to the actual
  fallback-selected estimator.
- Bundled selected-estimator Chapter 4.1 conclusion package:
  `Vaart1998FiniteCoordinateSelectedEstimatorTheorem41Conclusion`,
  `vaart1998_finiteCoordinateSelectedEstimatorTheorem41Conclusion_of_targetProbabilityLocalization_real`,
  and
  `vaart1998_finiteCoordinateSelectedEstimatorTheorem41Conclusion_of_canonicalMeanVectorLawCovarianceSourceCertificate_real`
  package source-neighborhood probability, moment-equation solving probability,
  the weak limit, Gaussianity, and the covariance-table display into one
  reusable theorem-facing object.
- Chapter 5.7 M-estimator consistency start:
  `StatInference/AsymptoticStatistics/MEstimators.lean`,
  `vaart1998_theorem_5_7_populationCriterion_gap_le_of_uniformDeviation_approxMax`,
  `vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax`,
  `Vaart1998MEstimatorUniformConsistencyCertificate`,
  `Vaart1998MEstimatorUniformConsistencyCertificate.oracleBound_tendsto_zero`,
  and
  `vaart1998_theorem_5_7_mEstimator_consistent_of_uniformConsistencyCertificate`
  package the deterministic proof and high-probability event handoff for
  convergence in probability of approximate M-estimators.
- Chapter 5.9 Z-estimator consistency reduction:
  `vaart1998_theorem_5_9_normCriterion_uniformDeviation_of_vectorUniformDeviation`,
  `vaart1998_theorem_5_9_dist_lt_of_uniformDeviation_nearZero`,
  `Vaart1998ZEstimatorUniformConsistencyCertificate`,
  `Vaart1998ZEstimatorUniformConsistencyCertificate.toMEstimatorUniformConsistencyCertificate`,
  and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_uniformConsistencyCertificate`
  reduce uniform estimating-function convergence and an approximate zero to
  Theorem 5.7 through the criterion `theta ↦ -‖Psi theta‖`.
- Chapter 5 deterministic/GC source wrappers:
  `Vaart1998MEstimatorUniformConsistencyCertificate.of_empiricalDeviationSequence_univ`,
  `Vaart1998MEstimatorUniformConsistencyCertificate.of_glivenkoCantelliClass_univ`,
  `Vaart1998MEstimatorUniformConsistencyCertificate.of_finiteClassUniformConvergence_univ`,
  `vaart1998_theorem_5_7_mEstimator_consistent_of_glivenkoCantelliClass_univ`,
  `vaart1998_theorem_5_7_mEstimator_consistent_of_finiteClassUniformConvergence_univ`,
  `Vaart1998ZEstimatorUniformConsistencyCertificate.of_deterministicUniformDeviation_univ`,
  and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_deterministicUniformDeviation_univ`
  turn full-class deterministic uniform-deviation, GC, finite-GC, and
  estimating-function bounds into the all-good-event certificates consumed by
  Theorems 5.7 and 5.9.
- Chapter 5 random uniform-error source endpoints:
  `vaart1998_theorem_5_7_mEstimator_consistent_of_randomUniformErrors` and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_randomUniformErrors` prove
  consistency directly from convergence in probability of random uniform
  criterion/estimating-function errors and random approximate-max/near-zero
  errors, using tail-union high-probability events.
- Chapter 5 VdV&W outer-probability and empirical-average endpoints:
  `vaart1998_theorem_5_7_mEstimator_consistent_of_outerProbabilityUniformErrors`,
  `vaart1998_theorem_5_7_mEstimator_consistent_of_empiricalAverage_outerProbabilityUniformErrors`,
  `vaart1998_theorem_5_9_zEstimator_consistent_of_outerProbabilityUniformErrors`,
  and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_empiricalAverage_real_outerProbabilityUniformErrors`
  bridge empirical-process outer-probability uniform-error controls into the
  Chapter 5.7 and 5.9 consistency endpoints, including `P_n m_theta` criteria
  and scalar `P_n psi_theta` estimating equations.
- Vector empirical-average estimating equations:
  `empiricalAverageVector`,
  `empiricalAverageVector_eq_inv_smul_sum`, and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_empiricalAverage_vector_outerProbabilityUniformErrors`
  extend the sample-average route to real-normed-vector equations
  `P_n psi_theta`.
- Direct VdV&W `P`-Glivenko-Cantelli empirical-average consumers:
  `vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage`
  and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage_real`
  consume event-level outer-probability `P`-GC class laws directly, so real
  criteria `P_n m_theta` and scalar equations `P_n psi_theta` do not need a
  manually supplied random uniform-error process.
- Book-style VdV&W `P`-Glivenko-Cantelli empirical-average consumers:
  `vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWPGlivenkoCantelliClass_empiricalAverage`
  and
  `vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWPGlivenkoCantelliClass_empiricalAverage_real`
  accept either the outer-probability GC branch directly or the outer-a.s.
  branch with countability and coordinate a.e.-measurability.
- Chapter 5.41 Z-estimator asymptotic-normality handoff:
  `vaart1998_theorem_5_41_zEstimator_scoreLinearization_handoff` packages the
  score CLT plus `o_P(1)` remainder into the inverse-derivative weak limit, and
  `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff` transfers that
  compiled linearized limit to any scaled estimator that is a.e. equal to the
  Taylor/LLN linearization.
- Chapter 5.41 Score-residual bridge:
  `vaart1998_theorem_5_41_inverseDerivative_remainder_tendstoInMeasure`
  proves that the inverse-derivative image of a Score-space `o_P(1)` residual
  is still `o_P(1)`, and
  `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreResidual`
  consumes the source-shaped Taylor equality
  `scaledEstimator = -(P dot psi_theta0)^{-1} (score + residual)`.

Latest verified repository base before this packet: `ba15236`
(`Add Vaart theorem 5.41 linearization handoff`).
Current packet verification passed for:

- manual `lake env lean StatInference/AsymptoticStatistics/MEstimators.lean -o .../MEstimators.olean -i .../MEstimators.ilean`
- manual direct root import check for `StatInference.lean`
- `git diff --check`
- proof-hole and secret scans on changed Vaart files

Root build note: this worktree uses a symlinked `.lake` directory; focused
checks must compile the Vaart-worktree artifacts directly.

Process note: this is a manual `/goal` lane, not a recurring automation.  The
continuation loop is to read the active goal and route docs, fetch and account
for other-agent changes, verify the exact Vaart source theorem, search local
reuse, prove one theorem-sized packet, compile it directly in the Vaart
worktree, update docs after the theorem/blocker is known, then rebase and
verify again before push.

## Next Aggressive Target

Discharge the source-shaped Taylor/LLN inputs for Vaart Theorem 5.41: prove
that derivative LLN plus the dominated second-derivative Taylor term produce a
Score-valued residual `residual_n = o_P(1)` and the a.e. identity consumed by
the compiled Score-residual bridge.  Keep Gaussian-law preservation as a
separate lightweight packet or in a module that already imports Gaussian APIs.

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
