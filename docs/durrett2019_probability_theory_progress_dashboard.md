# Durrett 2019 Probability Theory Progress Dashboard

This dashboard tracks the Durrett probability-theory lane for `StatInference/`.
It is separate from the Billingsley probability-measure support lane, but it
must reuse Billingsley/local probability primitives whenever possible.

## Snapshot

- Source assets: local PDF and four Markdown chunks are available under
  `Textbooks/Durrett2019ProbabilityTheory/`.
- Lean namespace started: `StatInference.ProbabilityTheory`.
- Lean code location: content-based folder `StatInference/ProbabilityTheory/`.
- First module: `StatInference/ProbabilityTheory/Basic.lean`, imported by
  `StatInference.lean`.
- Reusable foundation location: `StatInference/ProbabilityMeasure/`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Durrett report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
- Goal policy: Durrett is tracked by the active in-thread `/goal`, not a
  recurring automation.  Refresh the route docs and next target after each
  verified proof step, blocker refinement, merge, or route change.
- Stale-goal policy: if the app-level `/goal` text names an older theorem,
  route from this dashboard, the current blocker plan, the blueprint, and the
  latest pushed commit.  Do not create an automation or duplicate goal to work
  around stale wording.
- Throughput policy: default to single-thread theorem-sized proof packets with
  search-first reuse, start/final GitHub sync checks, and isolated worktrees for
  long Durrett builds or disjoint local lanes.  Use subagents only after
  explicit user authorization.
- Communication policy: chat updates may be bilingual, but all code, theorem
  comments, docs, and commit messages in this lane stay in English.

## Current Active Target

Route from `Live In-Thread Goal Prompt V24` in
`docs/durrett2019_probability_theory_current_blocker_primitive_plan.md`.
The active theorem lane is now Chapter 4.2 martingales.  Treat compiled Chapter
2 / Chapter 3 support, including the Section 3.10 multivariate CLT,
Gaussian-coordinate independence criterion, and Exercise 3.10.8
linear-combination characterization, as closed dependencies.  Treat Chapter
4.1 through Theorem 4.1.15 as closed conditional-expectation support.  The
regular-conditional distribution route for Theorem 4.1.16 is deferred unless a
future targeted kernel search finds a direct source-shaped API.
`StatInference/ProbabilityTheory/Martingale.lean` now contains Chapter 4.2
definition-level wrappers and Example 4.2.1 linear random-walk
martingale/supermartingale/submartingale wrappers over the natural filtration of
independent increments, including the centered display `S_n - n * μ`.
The Example 4.2.2 quadratic martingale source bridge and natural-random-walk
quadratic martingale instantiation now compile.  Example 4.2.3 now has the
mean-one product martingale wrapper.  The next frontier is the normalized
exponential-martingale display.
The compiled declaration inventory below is dependency context only; it is not
a prompt to revisit solved work.

Current verified Durrett Lean frontier:
`StatInference/ProbabilityTheory/Multivariate.lean` compiles with the Section
3.10 Cramer-Wold, multivariate CLT, Gaussian display, all-dual source-handoff,
coordinate-mean, coordinate-covariance, centered-product, and common-vector-law
CLT wrappers, including canonical i.i.d. product-sample endpoints;
Gaussian-coordinate independence wrappers; and Exercise 3.10.8 finite linear
combination Gaussian-characterization wrappers.
`StatInference/ProbabilityTheory/ConditionalExpectation.lean` compiles with
the Chapter 4.1 Durrett conditional-expectation version predicate,
mathlib-condExp version wrapper, Example 4.1.3 self/constant wrappers, and
Example 4.1.4 independence wrapper, plus Theorem 4.1.9, 4.1.12, 4.1.13, and
4.1.14 property wrappers, Theorem 4.1.10 conditional Jensen, and Theorem
4.1.11 contraction wrappers, plus Theorem 4.1.15 projection wrappers.
`StatInference/ProbabilityTheory/Martingale.lean` compiles with the first
Chapter 4.2 adaptedness, integrability, conditional expectation
identity/inequality, one-step, and real-valued constructor wrappers, plus
Example 4.2.1 linear random-walk and centered-display wrappers, Example 4.2.2
quadratic martingale source and natural-random-walk wrappers, and the Example
4.2.3 product martingale wrapper.
`StatInference/ProbabilityTheory/Basic.lean` remains compiled root-imported
support.  Compiled declarations:

- `durrett2019_theorem_2_3_1_borelCantelli_first`;
- `durrett2019_theorem_2_3_1_eventually_notMem`;
- `durrett2019_theorem_2_3_7_borelCantelli_second`;
- `durrett2019_theorem_2_4_1_strongLaw_ae_real`;
- `durrett2019_theorem_2_4_1_centeredStrongLaw_ae_real`;
- `durrett2019_piSystem_probability_ext`.
- `durrett2019_theorem_1_1_1_monotonicity`;
- `durrett2019_theorem_1_1_1_subadditivity`;
- `durrett2019_theorem_1_1_1_continuity_from_below`;
- `durrett2019_theorem_1_1_1_tendsto_measure_from_below`;
- `durrett2019_theorem_1_1_1_continuity_from_above`;
- `durrett2019_theorem_1_1_1_tendsto_measure_from_above`;
- `durrett2019_theorem_1_3_1_measurable_of_generator_preimages`;
- `durrett2019_theorem_1_3_4_measurable_comp`.
- `durrett2019_theorem_2_1_7_iIndep_generatedSigma_of_iIndepSets`;
- `durrett2019_theorem_2_1_7_indep_generatedSigma_of_indepSets`;
- `durrett2019_theorem_2_1_8_iIndepFun_of_generator_rectangles`;
- `durrett2019_theorem_2_1_8_iIndepFun_real_of_Iic_rectangles`;
- `durrett2019_theorem_2_1_9_indep_iSup_of_disjoint`;
- `durrett2019_theorem_2_1_10_iIndepFun_comp`;
- `durrett2019_theorem_2_1_10_indepFun_finset_blocks`;
- `durrett2019_theorem_2_1_10_indepFun_finset_block_functions`;
- `durrett2019_theorem_2_1_10_indepFun_comp`;
- `durrett2019_theorem_2_1_10_product_coordinate_functions_independent`;
- `durrett2019_theorem_2_1_11_indepFun_hasLaw_prod`;
- `durrett2019_theorem_2_1_11_iIndepFun_hasLaw_pi`;
- `durrett2019_theorem_2_1_11_iid_hasLaw_pi`;
- `durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi`;
- `durrett2019_theorem_2_1_11_iid_iff_hasLaw_pi`;
- `durrett2019_theorem_2_1_11_canonical_iid_product_coordinates`;
- `durrett2019_theorem_2_1_12_product_integral`;
- `durrett2019_theorem_2_1_12_product_integral_mul`;
- `durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral`;
- `durrett2019_theorem_2_1_13_iIndepFun_integral_prod_eq_prod_integral`;
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_supplied_endpoint_grids`;
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`;
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`;
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists`;
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement`;
- `durrett2019_theorem_2_4_9_cutpointChain_append`;
- `durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`;
- `durrett2019_theorem_2_4_9_punctured_small_open_interval`;
- `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`;
- `durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover`;
- `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`;
- `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`;
- `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`;
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`.
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`.
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`.
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`.
- `empiricalDistributionFunction`;
- `empiricalDistributionFunction_eq_sum_div`;
- `empiricalDistributionFunction_samplePath_eq_range_sum`;
- `populationRisk_realHalfLineIndicator_eq_cdf`;
- `RealEmpiricalCDFGlivenkoCantelliClass`;
- `realEmpiricalCDFGlivenkoCantelliClass_of_realHalfLine`;
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`.
- `durrett2019_theorem_3_2_9_tendstoInDistribution_iff_forall_boundedContinuous_integral`;
- `durrett2019_theorem_3_2_10_continuous_mapping`;
- `durrett2019_theorem_3_2_10_continuous_mapping_common_probability_space`.
- `durrett2019_theorem_3_2_11_portmanteau_open_of_tendstoInDistribution`;
- `durrett2019_theorem_3_2_11_portmanteau_closed_of_tendstoInDistribution`;
- `durrett2019_theorem_3_2_11_portmanteau_continuity_set_of_tendstoInDistribution`;
- `durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_closed_limsup_le`;
- `durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_open_le_liminf`.
- `durrett2019_characteristicFunction`;
- `durrett2019_theorem_3_3_1_characteristicFunction_zero`;
- `durrett2019_theorem_3_3_1_characteristicFunction_neg`;
- `durrett2019_theorem_3_3_1_characteristicFunction_norm_le_one`;
- `durrett2019_theorem_3_3_1_characteristicFunction_continuous`;
- `durrett2019_theorem_3_3_1_characteristicFunction_affine_map`;
- `durrett2019_theorem_3_3_2_characteristicFunction_independent_sum`.
- `durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_weakConvergence`;
- `durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto`;
- `durrett2019_theorem_3_3_17_weakConvergence_iff_characteristicFunction_tendsto`;
- `durrett2019_theorem_3_3_17_tight_of_characteristicFunction_tendsto`;
- `durrett2019_theorem_3_3_17_tight_and_weakConvergence_of_characteristicFunction_limit`;
- `durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_tendstoInDistribution`;
- `durrett2019_theorem_3_3_17_tendstoInDistribution_of_characteristicFunction_tendsto`;
- `durrett2019_theorem_3_3_20_characteristicFunction_secondOrder_centered_unitVariance`;
- `durrett2019_theorem_3_4_1_centralLimitTheorem_centered_unitVariance`;
- `durrett2019_theorem_3_4_1_centralLimitTheorem_varianceGaussian`.

The current aggressive theorem frontier is Chapter 3.  The old large Chapter
2 targets are closed as reusable source wrappers:

Current proof route:

1. Durrett Theorem 2.4.9 now has arbitrary-law half-line Glivenko-Cantelli
   wrappers and the source-facing empirical distribution-function statement;
2. Durrett Chapter 2.1 now has generated-independence, finite disjoint-block,
   finite product-law, iid common-law product, iid criterion, and canonical iid
   product-coordinate wrappers;
3. Section 3.2 weak convergence has started by reusing mathlib
   `TendstoInDistribution` and
   `StatInference/ProbabilityMeasure/WeakConvergence.lean`;
4. Durrett Theorem 3.2.10, continuous mapping theorem, continuous case, now
   compiles in both varying-domain and common-probability-space forms;
5. Durrett Theorem 3.2.9 now compiles as a bounded-continuous test-function
   iff, with the map-law-to-expectation integral bridge;
6. Durrett Theorem 3.2.11 now compiles in open-set, closed-set,
   continuity-set, closed-converse, and open-converse forms;
7. Durrett Section 3.3 characteristic functions now have compiled law-level
   notation, Theorem 3.3.1 zero/conjugation/norm/continuity/affine wrappers, and
   Theorem 3.3.2 independent-sum product law over mathlib
   characteristic-function APIs;
8. Durrett Theorem 3.3.17 now compiles as law-level and random-variable
   characteristic-function continuity theorem wrappers, including the tightness
   branch from pointwise convergence to a continuous-at-zero limit;
9. Durrett Theorem 3.3.20 centered unit-variance second-order characteristic
   function expansion now compiles over mathlib Taylor support;
10. Durrett Theorem 3.4.1 now compiles as centered unit-variance and
    variance-Gaussian i.i.d. CLT wrappers over mathlib's one-dimensional CLT;
11. Durrett Theorem 3.4.10 now has compiled triangular-array row-sum notation,
    row-wise independence, finite-row characteristic-function product,
    product-to-row characteristic-function convergence, and the Levy-continuity
    bridge from supplied Gaussian product convergence to row-sum convergence in
    distribution;
12. Durrett Theorem 3.4.10 now also has textbook mean-zero, variance-sum, and
    Lindeberg-tail predicates, an explicit
    `exp(-sigma^2 t^2 / 2)` product-convergence interface, Gaussian
    characteristic-function display, and analytic-certificate bridge to row-sum
    convergence in distribution;
13. Durrett Theorem 3.4.10 now has the row Gaussian exponential target and the
    bridge from row-product approximation plus variance-sum convergence to the
    analytic certificate's `product_tendsto_exp` field;
14. Durrett Theorem 3.4.10 now has quadratic variance factors/products and
    compiled assembly from two split approximation obligations to the analytic
    certificate;
15. Durrett Theorem 3.4.10 now has the Exercise 3.1.1 triangular-array
    row-sum/product interface, the specialized coefficient
    `c_{n,m} = -t^2 sigma_{n,m}^2 / 2`, its row-sum convergence from the
    variance-sum hypothesis, and the bridge from the Exercise 3.1.1 product
    conclusion to the quadratic-product approximation and analytic
    certificate;
16. Durrett Theorem 3.4.10 now has Lemma 3.4.3 product-difference control
    `durrett2019_norm_prod_sub_prod_le_sum_norm_sub`, plus a bridge from
    one-factor error row-sum convergence and eventual unit-norm control of the
    quadratic factors to the characteristic-product-to-quadratic-product
    approximation;
17. Durrett Theorem 3.4.10 now has max-row-variance smallness, a
    variance-tail split interface, scaled variance interfaces, a compiled
    bridge from Lindeberg plus the supplied variance-tail split to
    max-smallness, and compiled bridges from max-smallness to eventual
    unit-norm control of the quadratic variance factors;
18. Durrett Theorem 3.4.10 now has the full Exercise 3.1.1 source hypothesis
    interface, coefficient max-smallness from variance max-smallness,
    coefficient absolute-row-sum boundedness from variance-sum convergence, and
    bridges from the supplied Exercise 3.1.1 theorem to the quadratic-product
    convergence obligation, including the Lindeberg plus variance-tail-split
    route;
19. Durrett Exercise 3.1.1 now compiles as a proved real triangular-array
    product theorem: max-smallness gives eventual positivity and the relative
    logarithmic remainder estimate, uniform absolute row-sum boundedness gives
    log-remainder row convergence, and the logarithmic product bridge gives the
    source theorem;
20. Durrett Theorem 3.4.10 now has a source-facing assembly constructor:
    a supplied one-factor error row-sum convergence hypothesis and
    variance-tail split, together with the proved Exercise 3.1.1 theorem,
    directly produce the analytic certificate and the
    convergence-in-distribution theorem;
21. Durrett Theorem 3.4.10 now proves the textbook variance-tail split
    inequality from row `AEMeasurable` plus square-integrability assumptions:
    `durrett2019_lindebergFeller_oneFactorVariance_le_cutoff_sq_add_tailSecondMoment`
    feeds
    `durrett2019_lindebergFellerVarianceSplitByTailRowSum_of_integrableSq`,
    which then feeds
    `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_integrableSq`
    and
    `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_integrableSq`;
22. Durrett Theorem 3.4.10 now has a named
    `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum`, a
    source-shaped finite-row Taylor/Lindeberg bound predicate
    `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound`, and
    a compiled bridge
    `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound`
    that derives the row-sum error convergence from variance-sum convergence,
    the Lindeberg condition, and that finite-row bound.  The final
    square-integrable source bridge now consumes the finite-row bound directly;
23. Durrett Theorem 3.4.10 now also has the one-factor predicate
    `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound` and
    compiled bridges from that one-factor bound to the finite-row bound,
    row-sum convergence, analytic certificate, and final
    convergence-in-distribution source wrapper;
24. Durrett Theorem 3.4.10 now has the scalar second-moment predicate
    `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound`
    plus compiled bridges from that predicate through mean-zero variance
    rewriting to the one-factor bound, finite-row bound, row-sum convergence,
    analytic certificate, and final convergence-in-distribution source wrapper.
25. Durrett Theorem 3.4.10 now has the scalar expansion-bound predicate
    `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound`,
    compiled bridges from that predicate through mean-zero cancellation to the
    final convergence-in-distribution source wrapper, and the pointwise
    truncation split
    `durrett2019_lindebergFeller_min_taylor_remainder_le_split`.
26. Durrett Theorem 3.4.10 now has the (3.3.3) remainder predicate
    `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound`,
    the integrated split bridge to the scalar expansion-bound predicate, and
    compiled consumers through the analytic certificate and final
    convergence-in-distribution source wrapper.
27. Durrett Lemma 3.3.19 now has the pointwise remainder term
    `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder`, the
    source-facing pointwise predicate
    `durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound`,
    and the compiled expectation-level bridge
    `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_pointwiseTaylorRemainderBound`.
    The pure scalar minimum-form inequality, pointwise predicate constructor,
    one-factor remainder bound from square-integrable rows, analytic certificate
    from square-integrable rows, and final Lindeberg-Feller wrapper from
    square-integrable rows also compile.
28. Durrett Theorem 3.10.6 now has the finite-coordinate law-level Cramér-Wold
    wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto` in
    `StatInference/ProbabilityTheory/Multivariate.lean`, reusing the local
    Vaart finite-coordinate Cramér-Wold theorem.
29. Durrett Theorem 3.10.7 now has compiled projected scalar and projected
    summand CLT wrappers:
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT` and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT`.
30. Durrett Theorem 3.10.7 now has compiled covariance/Gaussian source wrappers:
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource` and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource`.
31. Durrett Theorem 3.10.7 now has the compiled theta-projection Gaussian
    characteristic-function display and covariance-table variance expansion:
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_covarianceBilinDualTable`.
32. Durrett Theorem 3.10.7 now has finite-coordinate dual-coordinate
    representation, all-dual centered-mean and covariance-table handoffs, and
    the vector Gaussian CLT wrapper from centered theta means plus coordinate
    covariance tables:
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianThetaMeanCoordinateCovarianceTable`.
33. Durrett Theorem 3.10.7 now has the coordinatewise-zero-mean handoff and
    CLT wrappers from literal coordinate centering plus covariance tables,
    including the common-vector-law coordinate-table wrapper:
    `durrett2019_theorem_3_10_7_thetaProjectionMean_zero_of_coordinateMean_zero`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCoordinateMeanCovarianceTable`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCoordinateMeanCovarianceTable`.
34. Durrett Theorem 3.10.7 now has scalar coordinate covariance to
    `covarianceBilinDual` table handoffs, centered-product covariance support,
    vector CLT wrappers from literal coordinate covariance/product assumptions,
    and the common-vector-law scalar-covariance wrapper:
    `durrett2019_theorem_3_10_7_covarianceBilinDual_eval_eq_coordinateCovariance`,
    `durrett2019_theorem_3_10_7_covarianceBilinDualTable_of_coordinateCovariance`,
    `durrett2019_theorem_3_10_7_coordinateCovariance_eq_of_centeredProduct`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCoordinateMeanCoordinateCovariance`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCoordinateMeanCoordinateCovariance`.
35. Durrett Theorem 3.10.7 now has canonical i.i.d. product-sample endpoints
    from scalar coordinate covariance and from centered coordinate product
    identities:
    `durrett2019_theorem_3_10_7_canonicalSampleCoordinateCovariance_eq_vectorLaw`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct`.
36. Durrett Section 3.10 now has Gaussian-coordinate independence wrappers:
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_coordinateCovariance_zero`,
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_coordinateCovariance_zero`,
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_covarianceBilinDualTable`,
    and
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_covarianceBilinDualTable`.
37. Durrett Exercise 3.10.8 now has finite linear-combination Gaussian
    characterization wrappers:
    `durrett2019_exercise_3_10_8_linearCombination_hasGaussianLaw_of_multivariateGaussian`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_of_linearCombination_hasGaussianLaw`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_hasGaussianLaw`,
    `durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_multivariateGaussian`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_of_linearCombination_law_eq_gaussianReal`,
    and
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal`.
38. Durrett Chapter 4.1 now has conditional-expectation starter wrappers:
    `durrett2019_section_4_1_IsConditionalExpectationVersion`,
    `durrett2019_section_4_1_condExp_isConditionalExpectationVersion`,
    `durrett2019_example_4_1_3_self_isConditionalExpectationVersion`,
    `durrett2019_example_4_1_3_condExp_eq_of_stronglyMeasurable`,
    and `durrett2019_example_4_1_3_condExp_const`.
39. Durrett Example 4.1.4 now has the compiled independence wrapper
    `durrett2019_example_4_1_4_condExp_eq_integral_of_independent`, using
    mathlib `MeasureTheory.condExp_indep_eq` and the root
    `ProbabilityTheory.Indep` sigma-field independence predicate.
40. Durrett Chapter 4.1 now has the compiled conditional-expectation property
    layer:
    `durrett2019_theorem_4_1_9_condExp_linear`,
    `durrett2019_theorem_4_1_9_condExp_mono_real`,
    `durrett2019_theorem_4_1_12_condExp_eq_of_larger_condExp_stronglyMeasurable`,
    `durrett2019_theorem_4_1_13_condExp_tower_larger_of_smaller`,
    `durrett2019_theorem_4_1_13_condExp_tower_smaller_of_larger`, and
    `durrett2019_theorem_4_1_14_condExp_mul_of_stronglyMeasurable_left`.
41. Durrett Theorem 4.1.10 and the direct Theorem 4.1.11 contraction forms now
    compile:
    `durrett2019_theorem_4_1_10_conditional_jensen_real`,
    `durrett2019_theorem_4_1_11_condExp_L1_contraction_real`,
    `durrett2019_theorem_4_1_11_condExp_L2_contraction`, and
    `durrett2019_theorem_4_1_11_condExp_memLp_two`.
42. Durrett Theorem 4.1.15 now has compiled Hilbert-projection wrappers:
    `durrett2019_theorem_4_1_15_condExpL2_residual_inner_eq_zero`,
    `durrett2019_theorem_4_1_15_condExpL2_minimal_norm_le`, and
    `durrett2019_theorem_4_1_15_condExpL2_ae_eq_condExp`.
    Theorem 4.1.16 is deferred unless a direct kernel API appears; Chapter 4.2
    martingales are now active.

The route should not duplicate raw measure theory from Chapter 1 unless an
exact source theorem needs a missing local theorem.  Chapter 1 is currently
mostly mathlib-foundation plus Billingsley reusable support.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 measure/probability foundations | source-wrapper/reused-local | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/GeneratedSigma.lean`; `Tail.lean`; `ProductMeasure.lean` | Durrett wrappers for Theorem 1.1.1 measure properties and Theorems 1.3.1/1.3.4 measurability facts now compile over mathlib/local generator APIs. |
| Chapter 2.1 independence/product laws | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/ProductMeasure.lean`; mathlib independence APIs | Generated pi-system independence, generated-rectangle and real lower-halfline distribution-function criteria, grouped sigma-field independence, finite disjoint-block functions, product-coordinate independence, pair and finite product-law, iid same-law finite product law, iid product-law criterion, canonical iid product-coordinate support, product/Fubini integral, and expectation-factorization wrappers now compile. Remaining work is optional exact polish only when a later theorem route demands it. |
| Chapter 2.3 Borel-Cantelli | source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/BorelCantelli.lean` | Durrett wrappers for Theorems 2.3.1 and 2.3.7 compile over existing local Borel-Cantelli wrappers. |
| Chapter 2.4 SLLN and empirical CDF | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Durrett Theorem 2.4.1 source wrappers compile over the local strong-law wrappers. Conditional Theorem 2.4.9 handoffs compile from supplied endpoint grids, supplied middle CDF partitions, supplied cutpoint chains, or supplied center-range monotone subdivisions. The one-cell, two-cell, right-append, finite cutpoint-chain, cutpoint-chain append, endpoint-grid-to-chain, closed-cover, punctured-cover, punctured-cover inserted-subcell CDF increment, punctured-cover cell splitting, open-cover/center-avoidance, endpoint-center, strict-subdivision-prefix, extracted-subdivision-adjacency, monotone-duplicate-skip, monotone endpoint-center, monotone center-range, arbitrary-law punctured local/finite compact-cover, arbitrary-law punctured monotone-subdivision, arbitrary-law punctured monotone-subdivision cutpoint-chain, arbitrary-law cutpoint-chain, arbitrary-law half-line GC, source-facing empirical-CDF predicate, EDF theorem wrapper, non-atomic local small-neighborhood, non-atomic finite compact-cover, non-atomic monotone-subdivision, non-atomic cutpoint-chain, cutpoint-chain-to-GC, center-range subdivision-to-GC, and non-atomic GC packages compile. Treat this lane as reusable support unless a later theorem reopens an exact source-shape gap. |
| Chapter 3 weak convergence, CLT, and characteristic functions | source-wrapper/closed-support | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityTheory/Multivariate.lean`; `StatInference/ProbabilityMeasure/WeakConvergence.lean`; `StatInference/EmpiricalProcess/WeakConvergence.lean`; `StatInference/AsymptoticStatistics/MomentEstimators.lean`; mathlib `ConvergenceInDistribution`, characteristic-function, Levy, Taylor, and CLT APIs | Section 3.2 weak convergence now has compiled wrappers for Theorem 3.2.9 bounded-continuous tests, Theorem 3.2.10 continuous mapping continuous case, and Theorem 3.2.11 Portmanteau. Section 3.3 now has compiled Theorem 3.3.1 basic characteristic-function wrappers, Theorem 3.3.2 independent-sum product law, Theorem 3.3.17 continuity theorem wrappers, Theorem 3.3.19 scalar Taylor remainder estimate, and Theorem 3.3.20 centered Taylor support. Section 3.4 now has Theorem 3.4.1 i.i.d. CLT wrappers plus Theorem 3.4.10 triangular-array characteristic-function product, explicit Gaussian display, row Gaussian target, quadratic variance product, Exercise 3.1.1 row-sum/max/absolute-bound/product interfaces, the proved Exercise 3.1.1 real triangular-array product theorem, variance-tail-to-max-smallness bridges, the variance-tail split proved from square-integrable rows, max-row-variance-to-factor-norm bridges, Lemma 3.4.3 product-difference control, analytic-certificate bridges from supplied split product approximations, a named characteristic/quadratic error row sum, compiled finite-row/one-factor/scalar-Taylor/expansion/remainder bridges, and a final square-integrable Lindeberg-Feller source wrapper. Section 3.10 has a finite-coordinate law-level Cramer-Wold wrapper, Theorem 3.10.7 projected scalar/summand and covariance/Gaussian source wrappers, theta-projection Gaussian characteristic-function covariance-table display, all-dual source handoffs, coordinate-mean handoff, scalar coordinate covariance and centered-product source endpoints, vector Gaussian coordinate-covariance CLT wrappers, common-vector-law coordinate-covariance wrapper, canonical i.i.d. product-sample endpoints, Gaussian-coordinate independence criterion wrappers, and Exercise 3.10.8 linear-combination characterization wrappers. |
| Chapter 4 martingales | active/source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityTheory/ConditionalExpectation.lean`; `StatInference/ProbabilityTheory/Martingale.lean`; mathlib `Probability/ConditionalExpectation.lean` and `Probability/Martingale/*` | Chapter 4.1 conditional expectation is compiled through Theorem 4.1.15. Chapter 4.2 now has martingale/submartingale/supermartingale adaptedness, integrability, conditional expectation identity/inequality, one-step, real constructor wrappers, Example 4.2.1 linear random-walk martingale/supermartingale/submartingale plus centered-display wrappers, Example 4.2.2 quadratic source and natural-random-walk wrappers, and Example 4.2.3 product martingale wrappers. Next target: normalized exponential-martingale display. |
| Chapter 5 Markov chains | pending-local | none | Likely requires new local abstractions for transition kernels and hitting times. |
| Chapters 6-8 ergodic/Brownian/Donsker | pending-local | none | Defer until early probability spine is stable or remote agents land reusable support. |

## Initial Source Inventory

Source anchors already identified in
`Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`:

- Chapter 1 starts at the "Chapter 1 / Measure Theory" heading.
- Theorem 1.1.1: monotonicity, subadditivity, continuity from below, and
  continuity from above for measures.
- Theorem 1.2.1: distribution-function properties.
- Theorem 1.3.1: measurability from generator preimages.
- Theorem 1.6.4: Chebyshev inequality.
- Theorem 2.1.6: pi-lambda theorem.
- Theorem 2.1.7: independent pi-systems generate independent sigma-fields.
- Theorem 2.1.10: functions of disjoint independent blocks are independent.
- Theorem 2.1.11: independent variables have product joint law.
- Theorem 2.1.12: independent-pair expectation/Fubini formula.
- Theorem 2.1.13: expectation of product of independent variables.
- Theorem 2.3.1: first Borel-Cantelli.
- Theorem 2.3.7: second Borel-Cantelli.
- Theorem 2.4.1: Etemadi strong law.
- Theorem 2.4.9: Glivenko-Cantelli theorem.

## Verification Gate

Every Lean packet should pass:

- focused `lake env lean StatInference/ProbabilityTheory/<module>.lean`;
- targeted `lake build StatInference.ProbabilityTheory.<module>` when promoted;
- root `lake build StatInference` before push if root imports changed;
- proof-hole scan over the touched Lean lane;
- changed-file secret scan;
- `git diff --check`.

## Current Next Goal Cycle Contract

Use the current blocker plan's live prompt as the active `/goal` replacement
whenever the app-level wording lags.  Active frontier only: Section 3.10
finite-dimensional limit theory and Chapter 4.1 conditional expectation are
now closed support; the active frontier is Chapter 4.2 martingales.

Next proof packet: add the Example 4.2.3 normalized exponential display
`∏_{i=1}^n exp(θ ξ_i) / φ(θ) = exp(θ S_n) / φ(θ)^n`, then connect it to the
compiled mean-one product martingale wrapper from supplied integrability and
mean-one hypotheses.

Cycle rule: sync GitHub, inspect only anchors needed for that theorem, implement
one compiled Lean packet, verify focused Lean plus targeted build/scans and root
build when imports changed, update route docs only if the frontier changes,
commit, and push.  Closed Chapter 2 through Theorem 4.1.15 material is support,
not live prompt content, unless the active Chapter 4.1 theorem requires it.
