# Durrett 2019 Current Blocker And Primitive Plan

This file is the active blocker register for the Durrett probability-theory
lane.  It should be checked at the start of each in-thread goal cycle before
choosing a proof target.

## Live In-Thread Goal Prompt

Use this prompt as the live Durrett `/goal` whenever the app-level goal text is
older than the verified route docs:

Continue the Durrett 2019 probability-theory Lean formalization from the latest
pushed commit and these route docs.  Current frontier: Chapter 3.4.10
Lindeberg-Feller in `StatInference/ProbabilityTheory/Basic.lean`.  Do not
return to the solved Chapter 2 Glivenko-Cantelli or Chapter 2.1 product-law
work unless a new compiler or source dependency reopens it.  Next proof packet:
derive
`durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound`
from Durrett's characteristic-function Taylor estimate (3.3.3) and the compiled
pointwise split
`durrett2019_lindebergFeller_min_taylor_remainder_le_split`; then route to
Section 3.10 Cramer-Wold and multivariate CLT.  Each cycle should sync GitHub,
inspect only relevant route/source/API anchors, name the exact source item,
Lean declaration, and consumed primitive, implement one theorem-sized Lean
packet, run focused Lean plus targeted build and scans, update the route docs,
commit, and push.  Keep all code, comments, docs, and commit messages in
English.

## Minimal Operating Contract

- Treat other agents' commits as reusable context: fetch once at the start and
  once before push, then rebase or fast-forward if needed.
- Use the local Durrett Markdown/PDF anchors only for the theorem currently
  being packaged.
- Prefer a compiled theorem-sized bridge or wrapper over broad exploration.
- Use an isolated worktree only for dirty checkouts, long builds, or explicitly
  authorized disjoint lanes.
- Do not create recurring automations or spawn subagents unless the user asks
  for them in the current turn.

## Current Blocker

The Durrett source assets are present locally, and the Durrett-specific Lean
namespace now has a compiled starter module:

- `StatInference/ProbabilityTheory/Basic.lean`
- root import from `StatInference.lean`
- `durrett2019_theorem_2_3_1_borelCantelli_first`
- `durrett2019_theorem_2_3_1_eventually_notMem`
- `durrett2019_theorem_2_3_7_borelCantelli_second`
- `durrett2019_theorem_2_4_1_strongLaw_ae_real`
- `durrett2019_theorem_2_4_1_centeredStrongLaw_ae_real`
- `durrett2019_piSystem_probability_ext`
- `durrett2019_theorem_1_1_1_monotonicity`
- `durrett2019_theorem_1_1_1_subadditivity`
- `durrett2019_theorem_1_1_1_continuity_from_below`
- `durrett2019_theorem_1_1_1_tendsto_measure_from_below`
- `durrett2019_theorem_1_1_1_continuity_from_above`
- `durrett2019_theorem_1_1_1_tendsto_measure_from_above`
- `durrett2019_theorem_1_3_1_measurable_of_generator_preimages`
- `durrett2019_theorem_1_3_4_measurable_comp`
- `durrett2019_theorem_2_1_7_iIndep_generatedSigma_of_iIndepSets`
- `durrett2019_theorem_2_1_7_indep_generatedSigma_of_indepSets`
- `durrett2019_theorem_2_1_8_iIndepFun_of_generator_rectangles`
- `durrett2019_theorem_2_1_8_iIndepFun_real_of_Iic_rectangles`
- `durrett2019_theorem_2_1_9_indep_iSup_of_disjoint`
- `durrett2019_theorem_2_1_10_iIndepFun_comp`
- `durrett2019_theorem_2_1_10_indepFun_finset_blocks`
- `durrett2019_theorem_2_1_10_indepFun_finset_block_functions`
- `durrett2019_theorem_2_1_10_indepFun_comp`
- `durrett2019_theorem_2_1_10_product_coordinate_functions_independent`
- `durrett2019_theorem_2_1_11_indepFun_hasLaw_prod`
- `durrett2019_theorem_2_1_11_iIndepFun_hasLaw_pi`
- `durrett2019_theorem_2_1_11_iid_hasLaw_pi`
- `durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi`
- `durrett2019_theorem_2_1_11_iid_iff_hasLaw_pi`
- `durrett2019_theorem_2_1_11_canonical_iid_product_coordinates`
- `durrett2019_theorem_2_1_12_product_integral`
- `durrett2019_theorem_2_1_12_product_integral_mul`
- `durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral`
- `durrett2019_theorem_2_1_13_iIndepFun_integral_prod_eq_prod_integral`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_supplied_endpoint_grids`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_append`
- `durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`
- `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`
- `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`
- `durrett2019_theorem_2_4_9_punctured_small_open_interval`
- `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`
- `durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover`
- `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`
- `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`
- `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`
- `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`
- `empiricalDistributionFunction`
- `empiricalDistributionFunction_eq_sum_div`
- `empiricalDistributionFunction_samplePath_eq_range_sum`
- `populationRisk_realHalfLineIndicator_eq_cdf`
- `RealEmpiricalCDFGlivenkoCantelliClass`
- `realEmpiricalCDFGlivenkoCantelliClass_of_realHalfLine`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`
- `durrett2019_theorem_3_2_9_tendstoInDistribution_iff_forall_boundedContinuous_integral`
- `durrett2019_theorem_3_2_10_continuous_mapping`
- `durrett2019_theorem_3_2_10_continuous_mapping_common_probability_space`
- `durrett2019_theorem_3_2_11_portmanteau_open_of_tendstoInDistribution`
- `durrett2019_theorem_3_2_11_portmanteau_closed_of_tendstoInDistribution`
- `durrett2019_theorem_3_2_11_portmanteau_continuity_set_of_tendstoInDistribution`
- `durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_closed_limsup_le`
- `durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_open_le_liminf`
- `durrett2019_characteristicFunction`
- `durrett2019_theorem_3_3_1_characteristicFunction_zero`
- `durrett2019_theorem_3_3_1_characteristicFunction_neg`
- `durrett2019_theorem_3_3_1_characteristicFunction_norm_le_one`
- `durrett2019_theorem_3_3_1_characteristicFunction_continuous`
- `durrett2019_theorem_3_3_1_characteristicFunction_affine_map`
- `durrett2019_theorem_3_3_2_characteristicFunction_independent_sum`
- `durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_weakConvergence`
- `durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_17_weakConvergence_iff_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_17_tight_of_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_17_tight_and_weakConvergence_of_characteristicFunction_limit`
- `durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_tendstoInDistribution`
- `durrett2019_theorem_3_3_17_tendstoInDistribution_of_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_20_characteristicFunction_secondOrder_centered_unitVariance`
- `durrett2019_theorem_3_4_1_centralLimitTheorem_centered_unitVariance`
- `durrett2019_theorem_3_4_1_centralLimitTheorem_varianceGaussian`
- `durrett2019_lindebergFellerRowSum`
- `durrett2019_lindebergFellerRowIndependent`
- `durrett2019_lindebergFellerMeanZero`
- `durrett2019_lindebergFellerVarianceRowSum`
- `durrett2019_lindebergFellerVarianceSumConvergence`
- `durrett2019_lindebergFellerTailSecondMomentRowSum`
- `durrett2019_lindebergFellerCondition`
- `durrett2019_lindebergFellerVarianceSplitByTailRowSum`
- `durrett2019_lindebergFeller_oneFactorVariance_le_cutoff_sq_add_tailSecondMoment`
- `durrett2019_lindebergFellerVarianceSplitByTailRowSum_of_integrableSq`
- `durrett2019_lindebergFellerCharacteristicProduct`
- `durrett2019_lindebergFellerRowGaussianExpTarget`
- `durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto`
- `durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero`
- `durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded`
- `durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem`
- `durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive_of_maxAbsTendstoZero`
- `durrett2019_real_abs_log_one_add_sub_self_le`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs_of_maxAbsTendstoZero`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero_of_relativeToAbs_and_absRowSumBounded`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp_of_logRemainder`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_of_logRemainder`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate`
- `durrett2019_lindebergFellerQuadraticVarianceCoefficient`
- `durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_rowSum_tendsto`
- `durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_absRowSumBounded_of_varianceSum`
- `durrett2019_lindebergFellerQuadraticVarianceFactor`
- `durrett2019_lindebergFellerQuadraticVarianceFactor_eq_one_add_coefficient`
- `durrett2019_lindebergFellerQuadraticVarianceProduct`
- `durrett2019_lindebergFellerQuadraticVarianceProduct_eq_exercise311Product`
- `durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall_and_exercise311`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit_and_exercise311`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit`
- `durrett2019_theorem_3_4_10_quadraticVarianceProduct_tendsto_exp_of_exercise311`
- `durrett2019_norm_prod_sub_prod_le_sum_norm_sub`
- `durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound`
- `durrett2019_lindebergFeller_min_taylor_remainder_le_split`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_oneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_expansionBound`
- `durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne`
- `durrett2019_lindebergFellerVarianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_varianceRowsEventuallySmall_of_lindeberg_and_varianceSplitByTailRowSum`
- `durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_maxAbsTendstoZero_of_varianceRowsEventuallySmall`
- `durrett2019_lindebergFellerQuadraticVarianceScaledEventuallyLeTwo`
- `durrett2019_theorem_3_4_10_scaledVarianceEventuallyLeTwo_of_varianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_scaledVarianceEventuallyLeTwo`
- `durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_varianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_characteristicProductApproximationToQuadraticVarianceProduct_of_errorRowSum`
- `durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp`
- `durrett2019_lindebergFellerProductApproximationToRowGaussianExp`
- `durrett2019_lindebergFellerGaussianProductConvergence`
- `durrett2019_lindebergFellerGaussianProductConvergenceExp`
- `Durrett2019LindebergFellerAnalyticCertificate`
- `durrett2019_theorem_3_4_10_gaussian_characteristicFunction_eq_exp`
- `durrett2019_theorem_3_4_10_gaussianProductConvergence_of_exp_tendsto`
- `Durrett2019LindebergFellerAnalyticCertificate.gaussianProductConvergence`
- `durrett2019_theorem_3_4_10_rowGaussianExpTarget_tendsto_of_varianceSum`
- `durrett2019_theorem_3_4_10_product_tendsto_exp_of_varianceSum_and_rowGaussianApprox`
- `durrett2019_theorem_3_4_10_productApproximationToRowGaussianExp_of_quadraticVarianceProductApproximations`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductApproximationToRowGaussianExp_of_varianceSum_and_exercise311`
- `Durrett2019LindebergFellerAnalyticCertificate.of_productApproximationToRowGaussianExp`
- `Durrett2019LindebergFellerAnalyticCertificate.of_quadraticVarianceProductApproximations`
- `Durrett2019LindebergFellerAnalyticCertificate.of_characteristicQuadraticApproximation_and_exercise311`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit_and_exercise311`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_oneFactorBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_taylorBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_expansionBound_integrableSq`
- `durrett2019_theorem_3_4_10_characteristicFunction_rowSum_eq_product`
- `durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_of_product_tendsto`
- `durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_exp_of_product_tendsto_exp`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_characteristicFunction_product_tendsto`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_analyticCertificate`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit_and_exercise311`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_oneFactorBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_taylorBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_expansionBound_integrableSq`

Existing reusable probability-measure modules cover much of the early-book
substrate:

- generated sigma-fields and pi-system/extensionality wrappers;
- product measure and independent-copy/Fubini wrappers;
- first and second Borel-Cantelli wrappers;
- real-valued strong-law wrappers;
- tail/layer-cake/Markov/dominated-convergence wrappers;
- weak convergence and finite-dimensional law wrappers;
- empirical-process fixed-endpoint empirical-CDF support.

The immediate blocker has shifted from Chapter 2 completion to the Chapter 3
weak-convergence and CLT spine.  The prior large targets are closed as source
wrappers:

- Durrett Theorem 2.4.9 now has the arbitrary-law half-line GC handoff and the
  source-facing empirical distribution-function wrapper
  `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`.
- Durrett Chapter 2.1 now has generated-independence, finite disjoint-block,
  finite product-law, iid common-law product, iid criterion, and canonical iid
  product-coordinate wrappers.

Do not spend the next cycle on center insertion, EDF notation, or Chapter 2.1
polish unless a later Chapter 3 statement exposes an exact missing dependency.

Current aggressive target: move from the Chapter 3.2 weak-convergence
foundations and Chapter 3.3 characteristic-function spine into Chapter 3.4
central-limit support.  The first Section 3.2, 3.3, and 3.4 packets now
compile:

- Durrett Theorem 3.2.9 bounded-continuous test characterization, including
  the `integral_map` bridge from map-law integrals to textbook expectations
  `E g(X_i)`.
- Durrett Theorem 3.2.10 continuous mapping theorem, continuous case, over the
  local `tendstoInDistribution_continuous_comp` wrapper.
- Durrett Theorem 3.2.11 Portmanteau open-set, closed-set, continuity-set, and
  open/closed converse wrappers for `TendstoInDistribution`.
- Durrett Theorem 3.3.1 characteristic-function zero, conjugation, norm bound,
  continuity consequence, and affine-map wrappers.
- Durrett Theorem 3.3.2 independent-sum product law for characteristic
  functions.
- Durrett Theorem 3.3.17 characteristic-function continuity theorem in
  law-level and random-variable forms, plus the tightness statement from
  pointwise convergence to a limit continuous at zero.
- Durrett Theorem 3.3.20 centered unit-variance second-order characteristic
  function expansion at zero.
- Durrett Theorem 3.4.1 i.i.d. central limit theorem wrappers, both centered
  unit-variance and variance-Gaussian display forms.
- Durrett Theorem 3.4.10 now has triangular-array row-sum notation, row-wise
  independence, textbook mean-zero/variance-sum/Lindeberg-tail predicates, the
  explicit `exp(-sigma^2 t^2 / 2)` product-convergence interface, the Gaussian
  characteristic-function display, the row characteristic-function product
  formula, Exercise 3.1.1 triangular-array row-sum, max-absolute, absolute
  row-sum boundedness, source theorem, and product interfaces, quadratic
  variance coefficients/factors/products, the specialized Exercise 3.1.1
  row-sum, max-coefficient, absolute-row-sum, and product-convergence bridges,
  max-row-variance smallness, the variance-tail split bridge from Lindeberg to
  max-smallness, scaled variance bridges into quadratic-factor unit-norm
  control, Durrett Lemma 3.4.3
  product-difference control, row Gaussian exponential targets, the
  variance-sum-to-row-target convergence bridge, source-facing bridges from
  one-factor Taylor error row sums and Exercise 3.1.1 quadratic-product
  conclusions to convergence in distribution, source-facing bridges that
  replace the supplied variance-tail split with square-integrable row
  assumptions, a named characteristic/quadratic error row sum, a source-shaped
  finite-row Taylor/Lindeberg bound predicate, a source-shaped one-factor
  Taylor/Lindeberg bound predicate, a scalar Taylor-bound predicate written
  with second moments, a scalar expansion-bound predicate that retains the
  linear `i t E X` term, the pointwise truncation split
  `durrett2019_lindebergFeller_min_taylor_remainder_le_split`, and compiled
  bridges from the expansion bound through mean-zero cancellation and variance
  rewriting to the scalar Taylor bound, one-factor bound, finite-row bound,
  row-sum error convergence, analytic certificate, and final
  convergence-in-distribution constructor.

The next likely packet should attack the analytic Lindeberg-Feller estimate
layer before moving to multivariate CLT reuse:

- Definition/Section 3.2 weak convergence of random variables: reuse
  `MeasureTheory.TendstoInDistribution` and
  `StatInference/ProbabilityMeasure/WeakConvergence.lean`.
- Section 3.3 characteristic functions: the basic, continuity-theorem, and
  centered second-order Taylor wrappers now compile; only add inversion or
  uniqueness support when a later source theorem needs it directly.
- Section 3.4 central limit theorems: prove the remaining analytic obligations.
  The scalar expansion-bound predicate
  `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound`
  now feeds the scalar Taylor-bound predicate
  `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound`,
  the variance-based one-factor bound
  `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound`, then the
  finite-row bound
  `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound`, which
  then feeds
  `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero`
  through compiled bridges.  The pointwise truncation split of the minimum term
  also compiles, so the next proof target is the integrated
  characteristic-function Taylor expansion bound from Durrett (3.3.3).  The
  quadratic-product obligation
  `durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp` now has
  a compiled bridge from variance-sum convergence and max-row-variance
  smallness using the proved Exercise 3.1.1 real triangular-array product
  theorem; with the variance-tail split, it also has a compiled bridge
  directly from Lindeberg.  A final source-facing constructor now assembles the
  analytic certificate and the convergence-in-distribution theorem from
  square-integrable rows plus the finite-row Taylor/Lindeberg bound predicate.
  Exercise 3.1.1 itself now compiles: max-smallness gives
  eventual positivity and the relative logarithmic remainder estimate, uniform
  absolute row-sum boundedness turns that into row-sum log-remainder
  convergence, and the logarithmic product bridge proves the source theorem.
  The variance-tail split bridge now proves Durrett's source inequality
  `variance <= cutoff ^ 2 + tail row sum` from row `AEMeasurable` plus
  square-integrability assumptions, then packages it into the existing
  `durrett2019_lindebergFellerVarianceSplitByTailRowSum` predicate.  The next
  max-row-variance work should therefore not re-prove this split, but consume
  `durrett2019_lindebergFellerVarianceSplitByTailRowSum_of_integrableSq`.
- Section 3.10 characteristic-function convergence, Cramer-Wold, and
  multivariate CLT: search `StatInference/AsymptoticStatistics` and local
  weak-convergence files before adding new primitives.

High-value Chapter 3 source anchors are in
`Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`:

- Section 3.2 Weak Convergence starts near line 41.
- Theorem 3.2.9 appears near line 158.
- Theorem 3.2.10 appears near line 188.
- Theorem 3.2.11 appears near line 197.
- Section 3.3 Characteristic Functions starts near line 411.
- Theorem 3.3.1 appears near line 425.
- Theorem 3.3.2 appears near line 451.
- Theorem 3.3.17 appears near line 748.
- Theorem 3.3.20 appears near line 898.
- Section 3.4 Central Limit Theorems starts near line 1228.
- Theorem 3.4.1 appears near line 1234.
- Theorem 3.4.10 Lindeberg-Feller for triangular arrays appears near
  lines 1413-1465.
- Section 3.10 multivariate weak convergence starts near line 3643.
- Theorems 3.10.1, 3.10.5, 3.10.6, and 3.10.7 appear near lines
  3647, 3778, 3784, and 3789.

Do not start with raw Chapter 1 extension theorem formalization, Stieltjes
measure construction, or appendix foundations unless an exact Durrett theorem
route forces it.  Those are low-throughput because mathlib already contains
the foundational measure theory and local Billingsley wrappers provide source
crosswalk support.

## Search-First Record

Local reuse anchors:

- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`

Pinned mathlib search scope:

- `Mathlib.Probability.BorelCantelli`
- `Mathlib.Probability.StrongLaw`
- `Mathlib.Probability.Independence.Basic`
- `Mathlib.Probability.Independence.Integration`
- `Mathlib.Probability.HasLaw`
- `Mathlib.Probability.HasLawExists`
- `Mathlib.Probability.IdentDistrib`
- `Mathlib.MeasureTheory.PiSystem`
- `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- `Mathlib.MeasureTheory.Measure.Prod`
- `Mathlib.MeasureTheory.MeasurableSpace.Pi`
- `Mathlib.MeasureTheory.Function.ConvergenceInMeasure`
- `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`
- `Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic`
- `Mathlib.MeasureTheory.Measure.CharacteristicFunction.TaylorExpansion`
- `Mathlib.MeasureTheory.Measure.LevyConvergence`
- `Mathlib.Probability.Independence.CharacteristicFunction`
- `Mathlib.Probability.CentralLimitTheorem`

## Primitive Sequence

1. Create `StatInference/ProbabilityTheory/Basic.lean` and root-import it from
   `StatInference.lean`.  Done in the first Durrett packet.
2. Add a Durrett namespace wrapper module for Chapter 2 if the lane grows:
   `StatInference/ProbabilityTheory/Chapter2.lean`, or keep `Basic.lean` as a
   compact starter until there are enough declarations to split.
3. Prove Durrett Theorem 2.3.1 and Theorem 2.3.7 wrappers by delegating to
   local `ProbabilityMeasure` wrappers.  Done in the first Durrett packet.
4. Prove a Durrett Theorem 2.4.1 wrapper by delegating to
   `ProbabilityMeasure.strongLaw_ae_real`; record clearly that this is a
   mathlib-backed stronger-hypothesis/source-wrapper route, not the full
   Etemadi proof package.  Done in the first Durrett packet.
5. Attack Durrett Theorem 2.4.9 Glivenko-Cantelli:
   inspect `RealHalfLineGC.lean`, prove the arbitrary-distribution middle CDF
   partition constructor, then feed
   `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`.
   Done through the arbitrary-law half-line theorem and the source-facing
   empirical distribution-function wrapper.
6. Search and package independence/product-law wrappers for Theorems 2.1.7,
   2.1.10, 2.1.11, 2.1.12, and 2.1.13.  Reuse finite-`Pi` and product measure
   wrappers from `ProbabilityMeasure/ProductMeasure.lean` wherever possible.
   Generated pi-system independence, generated-rectangle independence
   criterion, real lower-halfline distribution-function criterion, grouped
   sigma-field independence, measurable-function preservation, finite
   disjoint-block functions, product-coordinate independence, pair and finite
   product-law, iid same-law product law, canonical iid product-coordinate
   source wrapper, and expectation-factorization wrappers now compile;
   remaining Chapter 2.1 work is optional only when a later theorem requires a
   sharper source shape.
7. After Chapter 2 has a stable theorem spine, start Chapter 3 by searching
   weak-convergence, characteristic-function, normal-law, convolution, and
   finite-dimensional limit APIs.  Durrett Theorems 3.2.9, 3.2.10
   continuous case, and 3.2.11 now compile as source-facing weak-convergence
   wrappers.  Durrett Theorem 3.3.1 characteristic-function zero, conjugation,
   norm bound, continuity consequence, and affine-map wrappers, plus Theorem
   3.3.2 independent-sum product law, Theorem 3.3.17 characteristic-function
   continuity theorem, Theorem 3.3.20 centered second-order expansion, and
   Theorem 3.4.1 i.i.d. CLT wrappers now compile over mathlib
   characteristic-function, Lévy-convergence, Taylor, and CLT APIs.  Next search
   Lindeberg-Feller, triangular-array, and multivariate CLT routes before adding
   new primitives.

## Current In-Thread Goal Prompt Seed

Start every in-thread cycle by inspecting git status, fetching origin/main,
reviewing recent remote commits for other-agent Lean contributions, reading
this file plus the Durrett dashboard and blueprint, and scanning the current
`StatInference/ProbabilityTheory`, `StatInference/ProbabilityMeasure`, and
`StatInference/EmpiricalProcess/RealHalfLineGC.lean` modules.  Primary target:
do not return to the old center-insertion, EDF notation, or Chapter 2.1 iid
polish blockers.  Chapter 3.2 weak convergence now has compiled Durrett
Theorem 3.2.9 bounded-continuous test, 3.2.10 continuous-mapping continuous
case, and 3.2.11 Portmanteau wrappers.  Chapter 3.3 now has compiled
characteristic-function notation, Theorem 3.3.1 basic property wrappers, and
Theorem 3.3.2 independent-sum product law, Theorem 3.3.17 continuity theorem,
and Theorem 3.3.20 centered second-order Taylor wrapper.  Chapter 3.4 now has
Theorem 3.4.1 i.i.d. CLT wrappers and Theorem 3.4.10
triangular-array characteristic-function/product/certificate plumbing,
including a final source-facing constructor from square-integrable rows plus
the finite-row Taylor/Lindeberg bound predicate.  Exercise 3.1.1 is now proved
locally and feeds the quadratic product route without a supplied theorem
assumption.  The variance-tail split is now proved from square-integrable rows,
and the expansion-bound-to-final-source-wrapper bridge now compiles, so the
next aggressive target is
`durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound`
from Durrett's characteristic-function Taylor estimate (3.3.3) plus the
compiled pointwise truncation split before moving to Section
3.10 Cramer-Wold/multivariate CLT wrappers while checking local
asymptotic-statistics reuse first.
Verify, update docs, commit/push, and keep this in-thread `/goal` state current.
Report progress and blockers in Chinese/English mix.
