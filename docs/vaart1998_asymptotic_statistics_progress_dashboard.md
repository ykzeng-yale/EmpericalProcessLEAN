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

Latest remote base before this packet: `ff791d1`.  Latest pushed Vaart packet
before this packet: `232407b`
(`Add Vaart empirical local inverse certificate`).
Current packet verification passed for:

- `lake env lean StatInference/AsymptoticStatistics/MomentEstimators.lean`
- `lake build StatInference.AsymptoticStatistics.MomentEstimators`
- `git diff --check`
- proof-hole and secret scans on changed Vaart files

Root build note: root imports did not change in this packet.  The reliable gate
for this packet is the focused Lean check and targeted Vaart module build.

## Next Aggressive Target

Continue Vaart Chapter 4.1 from the compiled target-probability localization
certificate route.  The next useful proof step is to connect probability
localization to a localized measurable estimator/asymptotic-equivalence route,
or prove a measurable extension of the local inverse if mathlib supports it.

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
