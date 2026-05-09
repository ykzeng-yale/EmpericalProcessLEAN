# van der Vaart 1998 Current Blocker And Primitive Plan

This file is the active blocker register for the van der Vaart 1998
asymptotic-statistics lane.  It should be checked at the start of each
manual `/goal` continuation before selecting a proof target.

## Live `/goal` Prompt

Use this section as the authoritative continuation prompt for the active chat
goal; do not create or modify automations.

Objective: formalize and prove van der Vaart 1998, *Asymptotic Statistics*, in
Lean under `StatInference/AsymptoticStatistics`, reusing local `StatInference`,
mathlib, and VdV&W infrastructure before adding new foundations.

Active frontier: van der Vaart 1998, Theorem 5.41 Z-estimator asymptotic
normality in `StatInference/AsymptoticStatistics/MEstimators.lean`.

Current verified endpoint:
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_finiteDerivativeActionBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.

Continuation recipe:

1. Check `git status`, the Vaart diff, and the live hypotheses of the endpoint
   above.
2. If an unfinished local Vaart Lean diff exists, either finish and verify it
   immediately, or remove it from the packet before editing route docs.
3. Choose exactly one source hypothesis feeding the endpoint and discharge it
   with one theorem-sized Lean advance.

Priority order for the next packet:

1. Tightness source: discharge scaled-estimator law-tail or `O_P(1)`.
2. Derivative source: only add an exact model-specific coordinate/matrix
   representation if it is immediately available; do not rebuild the completed
   finite-entry norm/action wrapper stack.
3. Score source: only add another wrapper if it removes a live hypothesis not
   already handled by the canonical raw-score handoff.

Operating rules:

1. Do not replay completed Chapters 2-4 infrastructure, older Theorem 5.41
   wrappers, historical ledger entries, or stale prompt items.
2. Search local `StatInference` and pinned mathlib APIs before adding
   infrastructure.
3. Use helper agents or worktrees only for independent API search,
   verification, or disjoint Lean write scopes.
4. Keep theorem names source-shaped and keep all files, code, and docs in
   English.
5. Update only the Vaart route docs to state the new frontier.
6. Verify with focused Lean, the target module build, `git diff --check`,
   proof-hole scan, credential scan, and English-only typo scan on changed
   Vaart files.
7. Fetch/rebase over `origin/main`; rerun checks if Lean files changed under
   the rebase.
8. Stage only Vaart files, commit a theorem-specific message, push, and leave
   unrelated user or agent edits untouched.

The ledger below is historical evidence, not a queue to replay.

## Current Blocker

The Vaart source assets are present in:

- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_1-115.md`
- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_116-230.md`
- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_231-345.md`
- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_346-460.md`
- `Textbooks/VaartAsymStat1998/PDF/VanDerVaart_Asymptotic_Statistics.pdf`

The long ledger below is historical progress evidence, not a prompt to revisit
old work.  The immediate source-shaped Vaart namespace reuses the existing
probability, empirical-process, and deterministic asymptotics lanes instead of
duplicating foundations.  Earlier packets keep these theorem-facing wrappers
compiling:

1. Chapter 2 notation for convergence in probability/distribution and
   stochastic `o_P`/`O_P`;
2. Theorem 2.3 continuous mapping;
3. Lemma 2.8 Slutsky product/add/continuous forms;
4. Proposition 2.17 iid centered unit-variance CLT;
5. Theorem 3.1 delta-method supplied-linearization bridge.
6. Theorem 3.1 deterministic differentiability display:
   `vaart1998_hasFDerivAt_delta_remainder_isLittleO`.
7. Theorem 3.1 scaled-remainder handoff:
   `vaart1998_theorem_3_1_delta_method_of_scaled_remainder`.
8. Law-tail criterion for `O_P(1)`:
   `vaart1998_stochasticBounded_of_law_real_norm_tail`.
9. Localization criterion:
   `vaart1998_tendstoInMeasure_zero_of_eventually_subset_tight`.
10. Theorem 3.1 tight-localization wrapper:
   `vaart1998_theorem_3_1_delta_method_of_localization_tight`.
11. Theorem 3.1 ordinary-sequence `O_P(1)` wrapper:
   `vaart1998_theorem_3_1_delta_method_of_localization_stochasticBounded`.
12. Scaled-ball remainder-to-localization bridge:
   `vaart1998_delta_remainder_local_subset_of_eventually_small_on_scaled_ball`.
13. Theorem 3.1 scaled-ball plus `O_P(1)` wrapper:
   `vaart1998_theorem_3_1_delta_method_of_scaled_ball_stochasticBounded`.
14. VdV&W tight-law-range to real norm-tail bridge:
   `vaart1998_law_real_norm_tail_of_tight_range`.
15. Tight law range to `O_P(1)` bridge:
   `vaart1998_stochasticBounded_of_tight_law_range`.
16. Weak convergence of laws to real norm-tail bridge:
   `vaart1998_law_real_norm_tail_of_weak_convergence`.
17. Chapter 2 fact that convergence in distribution implies `O_P(1)`:
   `vaart1998_stochasticBounded_of_tendstoInDistribution`.
18. Theorem 3.1 scaled-ball wrapper that derives the `O_P(1)` scaled-statistic
   field from distributional convergence:
   `vaart1998_theorem_3_1_delta_method_of_scaled_ball_distribution`.
19. Theorem 3.1 localization wrapper that derives the `O_P(1)` scaled-statistic
   field from distributional convergence:
   `vaart1998_theorem_3_1_delta_method_of_localization_distribution`.
20. Analytic scaled-ball smallness from an `o(‖h‖)` deterministic remainder:
   `vaart1998_delta_remainder_small_on_scaled_ball_of_isLittleO`.
21. Scaled-ball smallness from `HasFDerivAt` and divergent rate norms:
   `vaart1998_delta_remainder_small_on_scaled_ball_of_hasFDerivAt_norm_atTop`.
22. Textbook-rate scaled-ball smallness from `HasFDerivAt` and `r_n -> ∞`:
   `vaart1998_delta_remainder_small_on_scaled_ball_of_hasFDerivAt`.
23. Theorem 3.1 compact sequence wrapper from differentiability,
   `r_n -> ∞`, and distributional convergence of the scaled statistic:
   `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution`.
24. A.e.-measurability of the scaled delta remainder from `T_n` and
   `phi ∘ T_n`:
   `vaart1998_delta_remainder_aemeasurable`.
25. Measurable-function version:
   `vaart1998_delta_remainder_aemeasurable_of_measurable`.
26. Theorem 3.1 compact sequence wrapper deriving the remainder measurability
   from `T_n` and `phi ∘ T_n`:
   `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution_aemeasurable`.
27. Theorem 3.1 compact sequence wrapper deriving the remainder measurability
   from global measurability of `phi`:
   `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution_measurable`.
28. Chapter 4 textbook-rate helper:
   `vaart1998_sqrt_nat_tendsto_atTop`.
29. Theorem 4.1 local inverse/delta certificate structure:
   `Vaart1998MomentLocalInverseCertificate`.
30. Theorem 4.1 supplied empirical-moment CLT to method-of-moments
   asymptotic-normality handoff:
   `vaart1998_theorem_4_1_moment_estimator_delta_method`.
31. Theorem 4.1 `sqrt n` specialization:
   `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method`.
32. Certificate versions:
   `vaart1998_theorem_4_1_moment_estimator_delta_method_of_certificate` and
   `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_of_certificate`.
33. Theorem 4.1 local range/moment-equation certificate:
   `Vaart1998MomentLocalRangeCertificate`.
34. Theorem 4.1 local range probability certificate:
   `Vaart1998MomentEstimatorLocalRangeProbabilityCertificate`.
35. Deterministic local-inverse solve and uniqueness wrappers:
   `vaart1998_theorem_4_1_moment_estimator_solves_on_local_range`,
   `vaart1998_theorem_4_1_moment_estimator_thetaHat_solves_on_local_range`,
   `vaart1998_theorem_4_1_moment_estimator_unique_on_parameterDomain`, and
   `vaart1998_theorem_4_1_moment_estimator_mem_parameterDomain_on_local_range`.
36. Supplied local-range probability wrapper:
   `vaart1998_theorem_4_1_local_range_probability_of_certificate`.
37. Inverse-function-theorem bridge to the local inverse certificate:
   `vaart1998_momentLocalInverseCertificate_of_hasStrictFDerivAt`.
38. Inverse-function-theorem bridge to a canonical local range certificate:
   `vaart1998_momentLocalRangeCertificate_of_hasStrictFDerivAt`.
39. Open inverse-function-theorem source and target facts:
   `vaart1998_hasStrictFDerivAt_open_local_parameterDomain` and
   `vaart1998_hasStrictFDerivAt_open_local_momentRange`.
40. True-parameter and true-moment membership facts for those neighborhoods:
   `vaart1998_hasStrictFDerivAt_theta0_mem_local_parameterDomain` and
   `vaart1998_hasStrictFDerivAt_eta0_mem_local_momentRange`.
41. Open-neighborhood local range certificate from
   `HasStrictFDerivAt.toOpenPartialHomeomorph`:
   `vaart1998_momentLocalRangeCertificate_of_hasStrictFDerivAt_openPartialHomeomorph`.
42. Open-neighborhood probability localization from convergence in probability:
   `vaart1998_local_range_probability_of_tendstoInMeasure_const`.
43. Local-range probability certificate constructor from convergence in
   probability:
   `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_tendstoInMeasure`.
44. Open inverse-function-theorem local-range probability:
   `vaart1998_theorem_4_1_open_local_range_probability_of_hasStrictFDerivAt`.
45. Local-range probability certificate constructor from strict differentiability
   and convergence in probability:
   `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_hasStrictFDerivAt_tendstoInMeasure`.
46. Moment-equation solved-with-probability wrapper:
   `vaart1998_theorem_4_1_moment_equation_solved_with_probability_tending_to_one`.
47. Certificate form of the solved-with-probability wrapper:
   `vaart1998_theorem_4_1_moment_equation_solved_with_probability_tending_to_one_of_certificate`.
48. Strict-derivative plus convergence-in-probability solved-with-probability
   wrapper:
   `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_hasStrictFDerivAt_tendstoInMeasure`.
49. Chapter 2 almost-sure to in-probability bridge:
   `vaart1998_tendstoInMeasure_of_tendsto_ae`.
50. Empirical-moment a.s.-to-probability handoff:
   `vaart1998_empiricalMoment_tendstoInMeasure_of_ae_tendsto_const`.
51. Local-range probability certificate from a.s. empirical-moment convergence:
   `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_ae_tendsto`.
52. Strict-derivative open local-range probability from a.s. empirical-moment
   convergence:
   `vaart1998_theorem_4_1_open_local_range_probability_of_hasStrictFDerivAt_ae_tendsto`.
53. Strict-derivative local-range probability certificate from a.s.
   empirical-moment convergence:
   `vaart1998_momentEstimatorLocalRangeProbabilityCertificate_of_hasStrictFDerivAt_ae_tendsto`.
54. Strict-derivative solved-with-probability wrapper from a.s.
   empirical-moment convergence:
   `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_hasStrictFDerivAt_ae_tendsto`.
55. Finite-coordinate real empirical-moment strong-law handoff:
   `vaart1998_finiteCoordinate_empiricalMoment_tendsto_ae_real`.
56. Finite-coordinate real empirical-moment convergence-in-probability handoff:
   `vaart1998_finiteCoordinate_empiricalMoment_tendstoInMeasure_real`.
57. Strict-derivative finite-coordinate strong-law solved-with-probability
   wrapper:
   `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_hasStrictFDerivAt_finiteCoordinateStrongLaw_real`.
58. Finite-coordinate real Theorem 4.1 existence-plus-delta assembler:
   `vaart1998_theorem_4_1_finiteCoordinateStrongLaw_sqrt_exists_and_delta_method_real`.
59. Finite-coordinate empirical-moment measurability helper:
   `vaart1998_finiteCoordinate_empiricalMoment_measurable_real`.
60. Finite-coordinate empirical-moment a.e.-strong measurability helper:
   `vaart1998_finiteCoordinate_empiricalMoment_aestronglyMeasurable_real`.
61. Measurable-coordinate Theorem 4.1 source wrapper:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_delta_method_real`.
62. Linear inverse-derivative Gaussian limit bridge:
   `vaart1998_theorem_4_1_gaussian_limit_of_linear_inverse_derivative`.
63. Measurable-coordinate Theorem 4.1 Gaussian-limit source wrapper:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_real`.
64. Limit covariance functional tested against continuous linear coordinates:
   `vaart1998_limitCovarianceFunctional`.
65. Inverse-derivative covariance pullback functional:
   `vaart1998_inverseDerivativeCovarianceFunctional`.
66. Inverse-derivative covariance pullback identity:
   `vaart1998_limitCovarianceFunctional_inverseDerivative_apply`.
67. Measurable-coordinate Theorem 4.1 Gaussian-limit wrapper with covariance
   display:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceDisplay_real`.
68. Square-integrable law bridge from the coordinate covariance functional to
   mathlib's covariance bilinear form:
   `vaart1998_limitCovarianceFunctional_eq_covarianceBilinDual_map`.
69. Inverse-derivative pushed-law covariance bilinear form as the pullback of
   the original covariance bilinear form:
   `vaart1998_covarianceBilinDual_inverseDerivative_map_apply`.
70. Inverse-derivative a.e. measurability propagation:
   `vaart1998_inverseDerivative_aemeasurable_of_aemeasurable`.
71. Inverse-derivative square-integrable law propagation:
   `vaart1998_inverseDerivative_map_memLp_of_memLp`.
72. CovarianceBilinDual inverse-derivative pullback using only the original
   square-integrable law hypothesis:
   `vaart1998_covarianceBilinDual_inverseDerivative_map_apply_of_memLp`.
73. Measurable-coordinate Theorem 4.1 Gaussian-limit wrapper with the canonical
   covarianceBilinDual display:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_real`.
74. Open-partial-homeomorphism inverse a.e.-measurability on its target:
   `vaart1998_openPartialHomeomorph_symm_aemeasurable_on_target`.
75. Inverse-function-theorem local inverse a.e.-measurability on the local
   moment range:
   `vaart1998_localInverse_aemeasurable_on_open_momentRange`.
76. Concentrated-measure local inverse a.e.-measurability:
   `vaart1998_localInverse_aemeasurable_of_ae_mem_open_momentRange`.
77. Empirical-moment composition bridge for the local inverse under a.e.
   target localization:
   `vaart1998_localInverse_comp_empiricalMoment_aemeasurable_of_ae_mem_open_momentRange`.
78. Theorem 4.1 delta-method handoff using a.e.-measurability of the composed
   local inverse:
   `vaart1998_theorem_4_1_moment_estimator_delta_method_aemeasurable`.
79. Theorem 4.1 textbook `sqrt n` delta-method handoff using
   a.e.-measurability of the composed local inverse:
   `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_aemeasurable`.
80. Finite-coordinate strong-law Theorem 4.1 assembler using only
   a.e.-measurability of the composed local inverse:
   `vaart1998_theorem_4_1_finiteCoordinateStrongLaw_sqrt_exists_and_delta_method_aemeasurable_real`.
81. Finite-coordinate strong-law Theorem 4.1 assembler deriving composed
   local-inverse a.e.-measurability from a.e. localization in the open moment
   range:
   `vaart1998_theorem_4_1_finiteCoordinateStrongLaw_sqrt_exists_and_delta_method_of_ae_mem_open_momentRange_real`.
82. Measurable-coordinate Theorem 4.1 source wrapper using only
   a.e.-measurability of the composed local inverse:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_delta_method_aemeasurable_real`.
83. Measurable-coordinate Theorem 4.1 source wrapper deriving composed
   local-inverse a.e.-measurability from a.e. localization in the open moment
   range:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_delta_method_of_ae_mem_open_momentRange_real`.
84. Measurable-coordinate Theorem 4.1 Gaussian-limit wrapper using only
   a.e.-measurability of the composed local inverse:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_aemeasurable_real`.
85. Measurable-coordinate Theorem 4.1 Gaussian-limit wrapper deriving composed
   local-inverse a.e.-measurability from a.e. localization in the open moment
   range:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_of_ae_mem_open_momentRange_real`.
86. Measurable-coordinate covariance-display Theorem 4.1 wrapper using only
   a.e.-measurability of the composed local inverse:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceDisplay_aemeasurable_real`.
87. Measurable-coordinate covariance-display Theorem 4.1 wrapper deriving
   composed local-inverse a.e.-measurability from a.e. localization in the open
   moment range:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceDisplay_of_ae_mem_open_momentRange_real`.
88. Measurable-coordinate covarianceBilinDual Theorem 4.1 wrapper using only
   a.e.-measurability of the composed local inverse:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_aemeasurable_real`.
89. Measurable-coordinate covarianceBilinDual Theorem 4.1 wrapper deriving
   composed local-inverse a.e.-measurability from a.e. localization in the open
   moment range:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_of_ae_mem_open_momentRange_real`.
90. Named finite-coordinate empirical moment vector:
   `vaart1998_finiteCoordinateEmpiricalMoment`.
91. Named finite-coordinate population moment vector:
   `vaart1998_finiteCoordinatePopulationMoment`.
92. Supplied multivariate empirical-moment CLT/Gaussian/MemLp interface:
   `Vaart1998FiniteCoordinateEmpiricalMomentCLTCertificate`.
93. Theorem 4.1 localized covarianceBilinDual source wrapper fed by that CLT
   certificate:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_of_cltCertificate_real`.
94. Projected vector CLT family for the Cramér-Wold route:
   `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT`.
95. Source-shaped Cramér-Wold bridge from projected scalar CLTs to the vector
   empirical-moment CLT:
   `Vaart1998FiniteCoordinateCramerWoldCLTBridge`.
96. Projection theorem from an existing vector CLT certificate:
   `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT_of_cltCertificate`.
97. CLT-certificate constructor from the Cramér-Wold bridge:
   `vaart1998_finiteCoordinateEmpiricalMomentCLTCertificate_of_cramerWoldBridge`.
98. Scalar projected empirical average and population moment definitions:
   `vaart1998_finiteCoordinateProjectedEmpiricalAverage` and
   `vaart1998_finiteCoordinateProjectedPopulationMoment`.
99. Continuous-linear algebra identity between projected centered vectors and
   centered scalar projected moments:
   `vaart1998_finiteCoordinateProjected_scaled_centered_empiricalMoment_eq`.
100. Real-valued centered-average scalar CLT family for the Cramér-Wold route:
   `vaart1998_finiteCoordinateProjectedScalarCLT`.
101. Conversion from real-valued projected scalar CLTs to the projected vector
   CLT family:
   `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT_of_projectedScalarCLT`.
102. Cramér-Wold bridge constructor from real-valued projected scalar CLTs plus
   the remaining finite-dimensional Cramér-Wold implication:
   `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT`.
103. Scaled centered finite-coordinate empirical moment vector:
   `vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment`.
104. Measurability, a.e.-measurability, and a.e.-strong measurability for that
   scaled centered vector under coordinate measurability:
   `vaart1998_finiteCoordinate_scaledCenteredEmpiricalMoment_measurable_real`,
   `vaart1998_finiteCoordinate_scaledCenteredEmpiricalMoment_aemeasurable_real`,
   and
   `vaart1998_finiteCoordinate_scaledCenteredEmpiricalMoment_aestronglyMeasurable_real`.
105. Law-level weak-convergence handoff into the finite-coordinate
   empirical-moment CLT:
   `vaart1998_finiteCoordinateEmpiricalMomentCLT_of_law_tendsto`.
106. Cramér-Wold bridge constructor from real-valued projected scalar CLTs once
   the remaining Cramér-Wold theorem has been proved as law convergence:
   `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_lawTendsto`.
107. Named probability laws for the scaled centered vector and vector limit:
   `vaart1998_finiteCoordinateScaledCenteredEmpiricalMomentLaw` and
   `vaart1998_finiteCoordinateVectorLimitLaw`.
108. Pure probability-law projected convergence for finite-coordinate vector
   laws:
   `vaart1998_finiteCoordinateProjectedLawConvergence`.
109. Conversion from projected random-variable CLTs to projected convergence of
   the corresponding vector laws:
   `vaart1998_finiteCoordinateProjectedLawConvergence_of_projectedCLT`.
110. Cramér-Wold bridge constructor from projected scalar CLTs and a pure
   law-level Cramér-Wold theorem:
   `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_projectedLaw`.
111. Finite-indexed covariance table for a chosen family of continuous linear
   coordinates:
   `vaart1998_covarianceTable`.
112. Inverse-derivative covariance table pullback:
   `vaart1998_inverseDerivativeCovarianceTable_apply`.
113. Finite-indexed covarianceBilinDual table version of the Vaart
   `Dinv * Sigma * Dinv^T` display:
   `vaart1998_covarianceBilinDual_inverseDerivative_table_apply_of_memLp`.
114. Coordinate evaluation continuous linear functional:
   `vaart1998_finiteCoordinateEvalCLM` and
   `vaart1998_finiteCoordinateEvalCLM_apply`.
115. Coordinate-indexed covariance table for finite real vector laws:
   `vaart1998_finiteCoordinateCovarianceTable`.
116. Theorem 4.1 finite-coordinate CLT-certificate endpoint returning a finite
   covariance table for chosen parameter coordinates:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cltCertificate_real`.
117. Theorem 4.1 finite-coordinate covariance-table endpoint fed directly by a
   Cramér-Wold bridge:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cramerWoldBridge_real`.
118. Projected-law convergence to pointwise convergence of Banach-space
   characteristic functions:
   `vaart1998_finiteCoordinateProjectedLawConvergence_charFunDual`.
119. Euclidean/`PiLp 2` law convergence from projected finite-coordinate laws:
   `vaart1998_finiteCoordinateProjectedLawConvergence_euclideanLaw`.
120. Pure law-level finite-dimensional Cramér-Wold theorem:
   `vaart1998_finiteCoordinateProjectedLawConvergence_lawTendsto`.
121. Projected-scalar-CLT Cramér-Wold bridge constructor using the compiled
   finite-dimensional theorem:
   `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional`.
122. Theorem 4.1 finite-coordinate covariance-table endpoint fed directly by
   projected scalar CLTs:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedScalarCLT_real`.
123. Projected scalar summand for a continuous linear projection:
   `vaart1998_finiteCoordinateProjectedSample`.
124. Projected empirical average as an ordinary scalar average of projected
   summands:
   `vaart1998_finiteCoordinateProjectedEmpiricalAverage_eq_inv_mul_sum_sample`.
125. Projected centered-average expression as the usual scalar CLT
   sum-centered normalization:
   `vaart1998_finiteCoordinateProjectedScalarCLT_expression_eq_sum`.
126. Source-shaped projected summand scalar CLT family:
   `vaart1998_finiteCoordinateProjectedSummandCLT`.
127. Projected summand scalar CLTs imply the projected scalar empirical-moment
   CLT family:
   `vaart1998_finiteCoordinateProjectedScalarCLT_of_projectedSummandCLT`.
128. Theorem 4.1 finite-coordinate covariance-table endpoint fed directly by
   projected summand scalar CLTs:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedSummandCLT_real`.
129. Mathlib one-dimensional CLT instantiates the source-shaped projected
   summand scalar CLT family:
   `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT`.
130. Projected first-summand mean equals the tested population moment under
   finite-coordinate integrability:
   `vaart1998_finiteCoordinateProjectedSample_integral_eq_populationMoment`.
131. Mathlib one-dimensional CLT instantiation with the projected mean field
   discharged from finite-coordinate integrability:
   `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_integrableMean`.
132. Finite-coordinate sample-vector alias:
   `vaart1998_finiteCoordinateSampleVector`.
133. Projected samples inherit `MemLp` from the finite-coordinate sample
   vector:
   `vaart1998_finiteCoordinateProjectedSample_memLp_of_vectorMemLp`.
134. Projected samples inherit indexed independence from the
   finite-coordinate sample-vector sequence:
   `vaart1998_finiteCoordinateProjectedSample_iIndepFun_of_vector_iIndepFun`.
135. Projected samples inherit identical distribution from the
   finite-coordinate sample vectors:
   `vaart1998_finiteCoordinateProjectedSample_identDistrib_of_vector_identDistrib`.
136. Vector-valued finite-coordinate source fields feed the projected summand
   CLT through continuous linear projections and mathlib's one-dimensional CLT:
   `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_vectorSource`.
137. Finite-coordinate Gaussian limit supplies projected scalar Gaussian laws
   from zero projected mean and variance identification:
   `vaart1998_finiteCoordinateProjectedGaussianLimitLaw_of_zeroMean_variance`.
138. Covariance-bilinear identification supplies the same projected scalar
   Gaussian laws:
   `vaart1998_finiteCoordinateProjectedGaussianLimitLaw_of_covarianceBilinDual`.
139. Vector-valued finite-coordinate source fields plus Gaussian/covariance
   source fields feed the projected summand CLT:
   `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_vectorGaussianSource`.
140. Theorem 4.1 finite-coordinate covariance-table endpoint consuming the
   vector-Gaussian source wrapper directly:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_vectorGaussianSource_real`.
141. Finite-coordinate sample-vector `MemLp` from coordinatewise `MemLp`:
   `vaart1998_finiteCoordinateSampleVector_memLp_of_coordinate_memLp`.
142. Projected summand CLT source wrapper using coordinatewise `MemLp 2` to
   discharge both finite-coordinate integrability and vector `MemLp`:
   `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_vectorGaussianSource`.
143. Theorem 4.1 covariance-table endpoint variant consuming coordinatewise
   `MemLp 2` instead of separate integrability and vector `MemLp` fields:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_coordinateMemLp_vectorGaussianSource_real`.
144. Finite-coordinate sample-vector independence from a strong joint
   infinite-product law:
   `vaart1998_finiteCoordinateSampleVector_iIndepFun_of_hasLaw_infinitePi`.
145. Finite-coordinate sample-vector identical distribution from a common
   vector law:
   `vaart1998_finiteCoordinateSampleVector_identDistrib_of_common_hasLaw`.
146. Projected summand CLT source wrapper using coordinatewise `MemLp 2`, a
   common vector law, and the infinite-product law of the sample-vector
   sequence:
   `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_commonVectorLawGaussianSource`.
147. Theorem 4.1 covariance-table endpoint variant using coordinatewise
   `MemLp 2`, a common vector law, and the infinite-product law of the
   sample-vector sequence:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_coordinateMemLp_commonVectorLawGaussianSource_real`.
148. Canonical iid finite-coordinate sample-vector common law on the
   infinite-product space:
   `vaart1998_finiteCoordinateCanonicalSampleVector_hasLaw`.
149. Canonical iid finite-coordinate sample-vector sequence infinite-product
   law:
   `vaart1998_finiteCoordinateCanonicalSampleVector_sequence_hasLaw`.
150. Canonical iid finite-coordinate sample-vector common-law source package:
   `vaart1998_finiteCoordinateCanonicalSampleVector_commonVectorLawSource`.
151. Coordinate-projected `iIndepFun` from vector `iIndepFun` and coordinate
   evaluation measurability:
   `vaart1998_finiteCoordinateCoordinate_iIndepFun_of_vector_iIndepFun`.
152. Coordinate-projected pairwise `IndepFun` from vector `iIndepFun`:
   `vaart1998_finiteCoordinateCoordinate_pairwise_indepFun_of_vector_iIndepFun`.
153. Coordinate-projected `IdentDistrib` from vector `IdentDistrib`:
   `vaart1998_finiteCoordinateCoordinate_identDistrib_of_vector_identDistrib`.
154. Coordinate LLN source package from a common vector law, infinite-product
   sequence law, and coordinate evaluation measurability:
   `vaart1998_finiteCoordinateCoordinateLLNSource_of_commonVectorLaw`.
155. Theorem 4.1 covariance-table endpoint variant using coordinatewise
   `MemLp 2`, a common vector law, the infinite-product law of the sample-vector
   sequence, and coordinate evaluation measurability to discharge both vector
   and coordinate LLN source fields:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_coordinateMemLp_commonVectorLawCoordinateSource_real`.
156. Canonical iid product-sample coordinate measurability from coordinate
   evaluation measurability:
   `vaart1998_finiteCoordinateCanonicalSample_coordinate_measurable`.
157. Canonical iid product-sample coordinate `MemLp` from coordinate-projection
   `MemLp` under the common vector law:
   `vaart1998_finiteCoordinateCanonicalSample_coordinate_memLp`.
158. Canonical iid product-sample coordinate source package for Theorem 4.1:
   `vaart1998_finiteCoordinateCanonicalSample_coordinateSource`.
159. Canonical iid product-space Theorem 4.1 covariance-table endpoint:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalProductSource_real`.
160. Canonical iid product-sample population-moment identity:
   `vaart1998_finiteCoordinateCanonicalSample_populationMoment_eq_integral`.
161. Canonical iid product-sample projected variance identity:
   `vaart1998_finiteCoordinateCanonicalProjectedSample_variance_eq`.
162. Canonical product true-moment source conversion from vector-law means:
   `vaart1998_finiteCoordinateCanonicalSample_trueMoment_eq_populationMoment`.
163. Canonical product covariance source conversion from vector-law projection
   variances:
   `vaart1998_finiteCoordinateCanonicalSample_covariance_eq_projectedVariance`.
164. Canonical iid product-space Theorem 4.1 covariance-table endpoint with
   true moment and covariance hypotheses stated under the common vector law:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalVectorLawSource_real`.
165. Vector-law mean-zero to projected mean-zero bridge:
   `vaart1998_finiteCoordinateProjectedMean_eq_zero_of_map_mean_zero`.
166. Canonical iid product-space Theorem 4.1 covariance-table endpoint with
   the Gaussian limit mean-zero hypothesis stated as `(Q.map Z)[id] = 0`:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawSource_real`.
167. Symmetric continuous bilinear forms are determined by their diagonal
   quadratic forms:
   `vaart1998_continuousBilinearMap_eq_of_diagonal`.
168. CovarianceBilinDual off-diagonal polarization bridge from projected
   variance identities:
   `vaart1998_covarianceBilinDual_eq_of_diagonal_variance`.
169. Canonical iid product-space Theorem 4.1 covariance-table endpoint whose
   final covariance display is stated under the common vector law `ν`:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSource_real`.
170. Finite-coordinate vector-law source certificate:
   `Vaart1998FiniteCoordinateVectorLawSource`.
171. Vector-law source certificate consumers:
   `Vaart1998FiniteCoordinateVectorLawSource.memLp_id` and
   `Vaart1998FiniteCoordinateVectorLawSource.canonicalCoordinateSource`.
172. Canonical iid product-space Theorem 4.1 covariance-table endpoint using
   the vector-law source certificate for coordinate measurability and
   square-integrability:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_real`.
173. CLT-certificate covarianceBilinDual endpoint with direct a.e.
   measurability of the composed empirical local inverse:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceBilinDual_of_cltCertificate_aemeasurable_real`.
174. CLT-certificate covariance-table endpoint with the same direct
   `AEMeasurable` local-inverse statistic interface:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cltCertificate_aemeasurable_real`.
175. Projected-summand CLT covariance-table endpoint that bypasses the
   per-`n` target-membership field and consumes direct a.e. measurability of
   `he.localInverse e De theta0 (vaart1998_finiteCoordinateEmpiricalMoment X n ω)`:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedSummandCLT_aemeasurable_real`.
176. Canonical iid product-space covariance-table endpoint using the vector-law
   source certificate and direct a.e. measurability of the empirical
   local-inverse statistic:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_aemeasurable_real`.
177. Generic local-inverse composition measurability constructor:
   `vaart1998_localInverse_comp_empiricalMoment_aemeasurable_of_measurable`.
178. Finite-coordinate empirical local-inverse measurability constructor from
   global local-inverse measurability and coordinatewise sample measurability:
   `vaart1998_finiteCoordinate_localInverse_comp_empiricalMoment_aemeasurable_of_measurable_real`.
179. Canonical iid product-space covariance-table endpoint using the vector-law
   source certificate and global measurability of
   `he.localInverse e De theta0`:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_measurableLocalInverse_real`.
180. Finite-coordinate empirical local-inverse measurability constructor from
   coordinatewise sample measurability plus a.e. localization in the
   inverse-function-theorem target:
   `vaart1998_finiteCoordinate_localInverse_comp_empiricalMoment_aemeasurable_of_ae_mem_open_momentRange_real`.
181. Named empirical local-inverse measurability certificate:
   `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate`.
182. Certificate constructors from global local-inverse measurability and from
   a.e. target localization:
   `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate.of_measurableLocalInverse_real`
   and
   `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate.of_ae_mem_open_momentRange_real`.
183. Canonical iid product-space covariance-table endpoint consuming the named
   empirical local-inverse measurability certificate:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_localInverseCertificate_real`.
184. Named empirical target-localization certificate:
   `Vaart1998FiniteCoordinateEmpiricalTargetLocalizationCertificate`.
185. Bridge from target localization to empirical local-inverse measurability:
   `Vaart1998FiniteCoordinateEmpiricalLocalInverseMeasurabilityCertificate.of_targetLocalization_real`.
186. Canonical iid product-space covariance-table endpoint consuming the named
   target-localization certificate:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_targetLocalization_real`.
187. Finite-coordinate target-probability localization certificate:
   `Vaart1998FiniteCoordinateEmpiricalTargetProbabilityLocalizationCertificate`.
188. Bridge from the finite-coordinate target-probability certificate to the
   generic local-range probability certificate:
   `Vaart1998FiniteCoordinateEmpiricalTargetProbabilityLocalizationCertificate.to_momentEstimatorLocalRangeProbabilityCertificate`.
189. Constructors for target-probability localization from convergence in
   probability and from the finite-coordinate strong law:
   `Vaart1998FiniteCoordinateEmpiricalTargetProbabilityLocalizationCertificate.of_tendstoInMeasure_real`
   and
   `Vaart1998FiniteCoordinateEmpiricalTargetProbabilityLocalizationCertificate.of_finiteCoordinateStrongLaw_real`.
190. Generic probability consumer for the local parameter domain:
   `vaart1998_theorem_4_1_moment_estimator_mem_parameterDomain_with_probability_tending_to_one`.
191. Finite-coordinate target-probability consumer proving that the local
   inverse candidate enters the inverse-function-theorem source neighborhood
   with probability tending to one:
   `vaart1998_theorem_4_1_local_inverse_mem_parameterDomain_of_targetProbabilityLocalization_real`.
192. Finite-coordinate target-probability consumer proving that the local
   inverse candidate solves the empirical moment equation with probability
   tending to one:
   `vaart1998_theorem_4_1_moment_equation_solved_with_probability_of_targetProbabilityLocalization_real`.
193. Chapter 2 asymptotic-equivalence convergence-in-probability bridge:
   `vaart1998_tendstoInMeasure_zero_of_eq_with_probability_tending_to_one`.
194. Chapter 2 asymptotic-equivalence distributional transfer:
   `vaart1998_tendstoInDistribution_of_eq_with_probability_tending_to_one`.
195. Chapter 4 measurable-estimator asymptotic-equivalence wrapper:
   `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_of_eq_with_probability_tending_to_one`.
196. Finite-coordinate measurable-estimator asymptotic-equivalence wrapper:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_estimator_delta_method_of_eq_with_probability_tending_to_one_real`.
197. Chapter 2 high-probability event monotonicity helper:
   `vaart1998_probability_tending_to_one_of_subset`.
198. Chapter 4 event-certificate measurable-estimator delta wrapper:
   `vaart1998_theorem_4_1_moment_estimator_sqrt_delta_method_of_eq_on_event_with_probability_tending_to_one`.
199. Finite-coordinate target-localization estimator endpoint:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_estimator_delta_method_of_targetProbabilityLocalization_eq_on_target_real`.
200. Canonical finite-coordinate selected estimator with fixed fallback:
   `vaart1998_finiteCoordinateLocalInverseSelectedEstimator`.
201. Measurability of the canonical selected estimator:
   `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_measurable_real`.
202. Equality on the inverse-function-theorem target event:
   `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_eq_on_target_real`.
203. Finite-coordinate selected-estimator Theorem 4.1 endpoint:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_and_selectedEstimator_delta_method_of_targetProbabilityLocalization_real`.
204. Moment-space fallback extension of the local inverse:
   `vaart1998_localInverseFallbackExtension`.
205. Measurability of the fallback extension from piecewise continuity:
   `vaart1998_localInverseFallbackExtension_measurable`.
206. Derivative of the fallback extension at the true moment:
   `vaart1998_localInverseFallbackExtension_hasFDerivAt`.
207. True-moment value of the fallback extension:
   `vaart1998_localInverseFallbackExtension_apply_true_moment`.
208. Gaussian-limit endpoint for the canonical selected estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_of_targetProbabilityLocalization_real`.
209. Covariance-functional display endpoint for the canonical selected
   estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceDisplay_of_targetProbabilityLocalization_real`.
210. CovarianceBilinDual display endpoint for the canonical selected estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceBilinDual_of_targetProbabilityLocalization_real`.
211. CLT-certificate covarianceBilinDual endpoint for the canonical selected
   estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceBilinDual_of_cltCertificate_targetProbabilityLocalization_real`.
212. Finite covariance-table display endpoint for the canonical selected
   estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceTable_of_targetProbabilityLocalization_real`.
213. CLT-certificate finite covariance-table endpoint for the canonical
   selected estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceTable_of_cltCertificate_targetProbabilityLocalization_real`.
214. Canonical vector-law/covariance source endpoint for the actual
   fallback-selected estimator:
   `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_selectedEstimator_delta_gaussianLimit_covarianceTable_of_canonicalMeanVectorLawCovarianceSourceCertificate_real`.
215. Source-neighborhood probability for the canonical selected estimator:
   `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_mem_source_of_targetProbabilityLocalization_real`.
216. Moment-equation solving probability for the canonical selected estimator:
   `vaart1998_finiteCoordinateLocalInverseSelectedEstimator_solves_momentEquation_with_probability_of_targetProbabilityLocalization_real`.
217. Bundled Chapter 4.1 selected-estimator conclusion package:
   `Vaart1998FiniteCoordinateSelectedEstimatorTheorem41Conclusion`.
218. Target-localization constructor for the bundled selected-estimator
   conclusion:
   `vaart1998_finiteCoordinateSelectedEstimatorTheorem41Conclusion_of_targetProbabilityLocalization_real`.
219. Canonical vector-law/covariance source constructor for the bundled
   selected-estimator conclusion:
   `vaart1998_finiteCoordinateSelectedEstimatorTheorem41Conclusion_of_canonicalMeanVectorLawCovarianceSourceCertificate_real`.
220. New Chapter 5 M-estimator consistency module:
   `StatInference/AsymptoticStatistics/MEstimators.lean`.
221. Theorem 5.7 deterministic criterion-gap and separated-maximum wrappers:
   `vaart1998_theorem_5_7_populationCriterion_gap_le_of_uniformDeviation_approxMax`
   and
   `vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax`.
222. High-probability Theorem 5.7 source certificate:
   `Vaart1998MEstimatorUniformConsistencyCertificate`.
223. Theorem 5.7 convergence-in-probability endpoint:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_uniformConsistencyCertificate`.
224. Theorem 5.9 norm-criterion reduction:
   `vaart1998_theorem_5_9_normCriterion_uniformDeviation_of_vectorUniformDeviation`.
225. Theorem 5.9 deterministic separated-zero wrapper:
   `vaart1998_theorem_5_9_dist_lt_of_uniformDeviation_nearZero`.
226. High-probability Theorem 5.9 source certificate:
   `Vaart1998ZEstimatorUniformConsistencyCertificate`.
227. Reduction from the Theorem 5.9 certificate to the Theorem 5.7 certificate:
   `Vaart1998ZEstimatorUniformConsistencyCertificate.toMEstimatorUniformConsistencyCertificate`.
228. Theorem 5.9 convergence-in-probability endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_uniformConsistencyCertificate`.
229. Theorem 5.7 all-good-event source constructor from deterministic uniform
   deviation:
   `Vaart1998MEstimatorUniformConsistencyCertificate.of_empiricalDeviationSequence_univ`.
230. Theorem 5.7 full-class GC and finite-class source constructors:
   `Vaart1998MEstimatorUniformConsistencyCertificate.of_glivenkoCantelliClass_univ`
   and
   `Vaart1998MEstimatorUniformConsistencyCertificate.of_finiteClassUniformConvergence_univ`.
231. Theorem 5.7 full-class GC and finite-class consistency endpoints:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_glivenkoCantelliClass_univ`
   and
   `vaart1998_theorem_5_7_mEstimator_consistent_of_finiteClassUniformConvergence_univ`.
232. Theorem 5.9 all-good-event deterministic uniform-deviation constructor and
   endpoint:
   `Vaart1998ZEstimatorUniformConsistencyCertificate.of_deterministicUniformDeviation_univ`
   and
   `vaart1998_theorem_5_9_zEstimator_consistent_of_deterministicUniformDeviation_univ`.
233. Theorem 5.7 random uniform-error source endpoint:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_randomUniformErrors`.
234. Theorem 5.9 random uniform-error source endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_randomUniformErrors`.
235. Theorem 5.7 VdV&W outer-probability random-error endpoint:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_outerProbabilityUniformErrors`.
236. Theorem 5.7 empirical-average criterion outer-probability endpoint:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_empiricalAverage_outerProbabilityUniformErrors`.
237. Theorem 5.9 VdV&W outer-probability random-error endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_outerProbabilityUniformErrors`.
238. Theorem 5.9 scalar empirical-average estimating-equation endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_empiricalAverage_real_outerProbabilityUniformErrors`.
239. Vector-valued empirical average notation:
   `empiricalAverageVector` and
   `empiricalAverageVector_eq_inv_smul_sum`.
240. Theorem 5.9 vector empirical-average estimating-equation endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_empiricalAverage_vector_outerProbabilityUniformErrors`.
241. Theorem 5.7 direct VdV&W `P`-Glivenko-Cantelli empirical-average endpoint:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage`.
242. Theorem 5.9 direct VdV&W `P`-Glivenko-Cantelli scalar empirical-average
   endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage_real`.
243. Theorem 5.7 book-style VdV&W `P`-Glivenko-Cantelli empirical-average
   endpoint:
   `vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWPGlivenkoCantelliClass_empiricalAverage`.
244. Theorem 5.9 book-style VdV&W `P`-Glivenko-Cantelli scalar
   empirical-average endpoint:
   `vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWPGlivenkoCantelliClass_empiricalAverage_real`.
245. Theorem 5.41 score-linearization weak-limit handoff:
   `vaart1998_theorem_5_41_zEstimator_scoreLinearization_handoff`.
246. Theorem 5.41 scaled-estimator weak-limit handoff:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff`.
247. Theorem 5.41 inverse-derivative preservation of negligible residuals:
   `vaart1998_theorem_5_41_inverseDerivative_remainder_tendstoInMeasure`.
248. Theorem 5.41 scaled-estimator handoff from a Score-valued Taylor
   residual:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreResidual`.
249. Theorem 5.41 scaled-estimator handoff from the Taylor score equation:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreEquation`.
250. Theorem 5.41 scaled-estimator handoff from the Taylor zero display:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero`.
251. Theorem 5.41 addition of negligible Score-space residuals:
   `vaart1998_theorem_5_41_scoreResidual_add_tendstoInMeasure`.
252. Theorem 5.41 Taylor-zero handoff with separated derivative and
   second-derivative residuals:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_twoResiduals`.
253. Theorem 5.41 probability product bridge:
   `vaart1998_tendstoInMeasure_zero_of_norm_le_mul_stochasticBounded`.
254. Theorem 5.41 derivative LLN residual from operator-norm convergence:
   `vaart1998_theorem_5_41_derivativeResidual_tendstoInMeasure_of_opNorm`.
255. Theorem 5.41 Taylor-zero handoff with the derivative LLN residual
   discharged:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_derivativeLLN`.
256. Theorem 5.41 product of stochastically bounded terms:
   `vaart1998_stochasticBounded_of_norm_le_mul_stochasticBounded`.
257. Theorem 5.41 second-derivative Taylor residual from consistency and
   bounded dominated curvature:
   `vaart1998_theorem_5_41_secondDerivativeResidual_tendstoInMeasure_of_bound`.
258. Theorem 5.41 Taylor-zero handoff with derivative and second-derivative
   residual negligibility discharged:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_derivativeLLN_secondDerivativeBound`.
259. Theorem 5.41 source Taylor-equation handoff, splitting
   `dotPsi_n(theta0)` into `P dot psi_theta0` plus derivative residual:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorEquation_derivativeLLN_secondDerivativeBound`.
260. Theorem 5.41 derivative-residual a.e. measurability from empirical
   derivative operator and scaled-estimator measurability:
   `vaart1998_theorem_5_41_derivativeResidual_aemeasurable_of_operator`.
261. Theorem 5.41 source Taylor-equation handoff with derivative-residual
   measurability discharged:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorEquation_measurableDerivativeLLN_secondDerivativeBound`.
262. Theorem 5.41 Taylor equation from root and Taylor expansion:
   `vaart1998_theorem_5_41_taylorEquation_of_root_taylorExpansion`.
263. Theorem 5.41 source root-and-Taylor-expansion handoff:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeBound`.
264. Theorem 5.41 absorption of the `1 / 2` Taylor residual factor:
   `vaart1998_theorem_5_41_secondDerivativeResidual_bound_of_half_bound`.
265. Theorem 5.41 second-derivative residual convergence from the source
   `1 / 2` bound:
   `vaart1998_theorem_5_41_secondDerivativeResidual_tendstoInMeasure_of_half_bound`.
266. Theorem 5.41 source root-and-Taylor-expansion handoff with the source
   `1 / 2` second-derivative residual factor:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeHalfBound`.
267. Theorem 5.41 source half-bound from a quadratic second-derivative form:
   `vaart1998_theorem_5_41_secondDerivativeResidual_half_bound_of_bilinear_opNorm_bound`.
268. Theorem 5.41 source root-and-Taylor-expansion handoff from a quadratic
   second-derivative residual:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeQuadraticBound`.
269. Theorem 5.41 a.e. measurability of the literal quadratic Taylor residual:
   `vaart1998_theorem_5_41_secondDerivativeResidual_aemeasurable_of_operator`.
270. Theorem 5.41 source handoff from the literal quadratic Taylor expansion:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_quadraticTaylorExpansion_measurableDerivativeLLN`.
271. Generic finite-sample dominated empirical vector-average bound:
   `vaart1998_empiricalAverageVector_norm_le_empiricalAverage_envelope`.
272. Theorem 5.41 finite-sample dominated Hessian average:
   `vaart1998_theorem_5_41_empiricalSecondDerivativeAction_opNorm_le_empiricalEnvelope`.
273. Theorem 5.41 empirical second-derivative action operator-norm bound:
   `vaart1998_theorem_5_41_curvatureOpBound_of_empiricalSecondDerivative_envelope`.
274. Empirical averages commute with applying continuous-linear-map-valued
   statistics:
   `vaart1998_empiricalAverageVector_clm_apply`.
275. Empirical averages commute with applying bilinear operator-valued
   statistics:
   `vaart1998_empiricalAverageVector_bilinear_apply`.
276. Theorem 5.41 empirical quadratic Taylor display from pointwise Taylor
   identities:
   `vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise`.
277. Theorem 5.41 a.e. empirical quadratic Taylor display from pointwise
   Taylor identities:
   `vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise_ae`.
278. Theorem 5.41 empirical-average source handoff from pointwise Taylor
   identities and an envelope bound:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_pointwiseTaylor_envelope`.
279. Theorem 5.41 scaled single-observation Taylor identity from the raw
   selected Taylor identity:
   `vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_of_unscaled_selectedTaylor`.
280. Theorem 5.41 a.e. sampled scaled Taylor identities from raw selected
   Taylor identities:
   `vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_ae_of_unscaled_selectedTaylor`.
281. Theorem 5.41 empirical-average source handoff from raw per-observation
   Taylor identities:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_unscaledPointwiseTaylor_envelope`.
282. Theorem 5.41 scalar selected second-order Taylor bridge from Cauchy's
   mean value theorem:
   `vaart1998_theorem_5_41_scalar_selectedSecondOrderTaylor_of_derivativeTaylor`.
283. Theorem 5.41 coordinatewise raw Taylor assembly:
   `vaart1998_theorem_5_41_pi_rawTaylor_of_coordinate_rawTaylor`.
284. Theorem 5.41 a.e. sampled coordinatewise raw Taylor assembly:
   `vaart1998_theorem_5_41_pi_rawTaylor_ae_of_coordinate_rawTaylor`.
285. Theorem 5.41 finite-coordinate empirical-average source handoff from
   coordinatewise raw Taylor identities:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinateRawTaylor_envelope`.
286. Theorem 5.41 coordinate path selected Taylor bridge:
   `vaart1998_theorem_5_41_coordinate_selectedSecondAction_exists_of_scalarPathDerivativeTaylor`.
287. Theorem 5.41 a.e. sampled coordinate path selected Taylor bridge:
   `vaart1998_theorem_5_41_coordinate_selectedSecondAction_exists_ae_of_scalarPathDerivativeTaylor`.
288. Theorem 5.41 coordinate raw Taylor bridge from scalar path Taylor and
   endpoint second-derivative actions:
   `vaart1998_theorem_5_41_coordinate_rawTaylor_of_scalarPathDerivativeTaylor_secondDerivativeAction`.
289. Theorem 5.41 a.e. sampled coordinate raw Taylor bridge from scalar path
   Taylor and endpoint second-derivative actions:
   `vaart1998_theorem_5_41_coordinate_rawTaylor_ae_of_scalarPathDerivativeTaylor_secondDerivativeAction`.
290. Theorem 5.41 finite-coordinate empirical-average source handoff from
   scalar path Taylor hypotheses:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinatePathTaylor_envelope`.
291. Theorem 5.41 finite-coordinate empirical-average source handoff from
   actual estimating-map coordinate paths:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapPathTaylor_envelope`.
292. Theorem 5.41 coordinate derivative of an actual estimating-map path from
   a Frechet derivative:
   `vaart1998_theorem_5_41_estimatingMap_coordinate_path_hasDerivAt_of_hasFDerivAt`.
293. Theorem 5.41 a.e. sampled coordinate path derivatives from Frechet
   derivatives:
   `vaart1998_theorem_5_41_estimatingMap_coordinate_path_hasDerivAt_ae_of_hasFDerivAt`.
294. Theorem 5.41 finite-coordinate empirical-average source handoff from
   Frechet derivatives along the actual estimating-map path:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivPathTaylor_envelope`.
295. Theorem 5.41 finite-coordinate empirical-average source handoff from
   vector Taylor hypotheses for the Frechet derivative:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivVectorTaylor_envelope`.
296. Theorem 5.41 finite-coordinate empirical-average source handoff from
   vector continuity and vector Taylor hypotheses:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivVectorContinuityTaylor_envelope`.
297. Theorem 5.41 finite-coordinate empirical-average source handoff with the
   empirical derivative specialized to `derivativeAt theta0`:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0FDerivVectorTaylor_envelope`.
298. Theorem 5.41 vector derivative Taylor bridge from a constant
   second-derivative action:
   `vaart1998_theorem_5_41_vector_derivativeTaylor_of_constant_secondDerivativeAction`.
299. Theorem 5.41 a.e. sampled vector derivative Taylor bridge from a constant
   second-derivative action:
   `vaart1998_theorem_5_41_vector_derivativeTaylor_ae_of_constant_secondDerivativeAction`.
300. Theorem 5.41 finite-coordinate empirical-average source handoff from a
   theta0 Frechet derivative and a constant second-derivative path:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativePath_envelope`.
301. Theorem 5.41 derivative-path continuity from source continuity on the
   segment image:
   `vaart1998_theorem_5_41_derivativeAt_path_continuousOn_of_continuousOn_segment`.
302. Theorem 5.41 derivative-path `HasDerivAt` from the Frechet derivative of
   `theta ↦ derivativeAt theta`:
   `vaart1998_theorem_5_41_derivativeAt_path_hasDerivAt_of_hasFDerivAt`.
303. Theorem 5.41 a.e. sampled derivative-path regularity from source
   second-derivative regularity:
   `vaart1998_theorem_5_41_derivativeAt_path_regular_ae_of_hasFDerivAt`.
304. Theorem 5.41 finite-coordinate empirical-average source handoff from
   theta0 Frechet derivative and source second-derivative regularity:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativeRegularity_envelope`.
305. Theorem 5.41 source second-derivative regularity from open-set `C^1`
   smoothness of the derivative map:
   `vaart1998_theorem_5_41_derivativeAt_source_regular_of_contDiffOn_open`.
306. Theorem 5.41 a.e. sampled source second-derivative regularity from
   open-set `C^1` smoothness of the derivative map:
   `vaart1998_theorem_5_41_derivativeAt_source_regular_ae_of_contDiffOn_open`.
307. Theorem 5.41 finite-coordinate empirical-average source handoff from
   theta0 Frechet derivative and open-set `C^1` derivative-map smoothness:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativeContDiff_envelope`.
308. Theorem 5.41 estimating-map source regularity from open-set `C^1`
   smoothness:
   `vaart1998_theorem_5_41_estimatingMap_source_regular_of_contDiffOn_open`.
309. Theorem 5.41 a.e. sampled estimating-map source regularity from open-set
   `C^1` smoothness:
   `vaart1998_theorem_5_41_estimatingMap_source_regular_ae_of_contDiffOn_open`.
310. Theorem 5.41 finite-coordinate empirical-average source handoff from
   open-set `C^1` smoothness of both the estimating map and derivative map:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_envelope`.
311. A.e.-measurability of vector-valued empirical averages from sampled
   summand a.e.-measurability:
   `vaart1998_empiricalAverageVector_aemeasurable_of_summands`.
312. Theorem 5.41 empirical derivative a.e.-measurability from sampled
   derivative-map a.e.-measurability:
   `vaart1998_theorem_5_41_empiricalDerivative_aemeasurable_of_summands`.
313. Theorem 5.41 empirical second-derivative action a.e.-measurability from
   sampled second-derivative a.e.-measurability:
   `vaart1998_theorem_5_41_empiricalSecondDerivativeAction_aemeasurable_of_summands`.
314. Theorem 5.41 finite-coordinate empirical-average source handoff from
   open-set smoothness and sampled derivative/Hessian summand
   a.e.-measurability:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_summandMeasurable_envelope`.
315. Convergence in probability to a fixed finite value implies stochastic
   boundedness, plus the Theorem 5.41 envelope-convergence source handoff:
   `vaart1998_stochasticBounded_of_tendstoInMeasure_const` and
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_envelopeTendsto_summandMeasurable_envelope`.
316. Convergence in probability to a fixed value implies convergence of the
   scalar norm residual to zero, plus the Theorem 5.41 operator-valued
   derivative-convergence source handoff:
   `vaart1998_tendstoInMeasure_norm_sub_const_zero_of_tendstoInMeasure_const`
   and
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeTendsto_envelopeTendsto_summandMeasurable_envelope`.
317. Theorem 5.41 derivative source handoff from an almost-sure empirical
   derivative law plus strong measurability:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeAE_envelopeTendsto_summandMeasurable_envelope`.
318. Theorem 5.41 score CLT handoff from a CLT for the raw scaled estimating-map
   empirical average plus the sampled score-scaling identity:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope`.
319. Theorem 5.41 root handoff from the raw empirical estimating equation at
   the estimator plus the sampled estimator-scaling identity:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope`.
320. Theorem 5.41 estimator-increment handoff from
   `delta = estimator - theta0`, estimator consistency, and the direct scaled
   estimator increment identity:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSub_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope`.
321. Theorem 5.41 estimator-increment measurability handoff from
   estimator/theta0/scale a.e.-measurability and the source-shaped increment
   identities:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope`.
322. Theorem 5.41 scaled-estimator stochastic-boundedness handoff from the
   Chapter 2 law-tail criterion for `P.map (scaledEstimator n)`:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope`.
323. Theorem 5.41 derivative strong-law handoff from a source-shaped
   a.s. operator-norm residual:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope`.
324. Theorem 5.41 raw score CLT handoff from the reusable finite-coordinate
   projected-summand CLT plus an a.e. representation of the raw score as a
   scaled centered empirical moment:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_projectedSummandCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
325. Theorem 5.41 score CLT source handoff from coordinate `L^2` score
   summands, Gaussian limit/covariance fields, and a common-vector-law
   infinite-product sample source:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
326. Theorem 5.41 raw-score representation identity as a scaled centered
   finite-coordinate empirical moment from zero score mean and the a.e.
   `sqrt n` score-summand equality:
   `vaart1998_theorem_5_41_rawScore_eq_finiteCoordinateScaledCentered_of_summand_eq`.
327. Theorem 5.41 current endpoint with the raw-score representation
   hypothesis discharged by the source-shaped score-summand representation:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scoreSummandRepresentation_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
328. Theorem 5.41 derivative operator-norm residual from an eventual a.s.
   error bound tending to zero:
   `vaart1998_theorem_5_41_derivativeAverage_norm_tendsto_ae_of_eventual_bound`.
329. Theorem 5.41 current endpoint with derivative-average strong
   measurability discharged from sampled derivative summand measurability and
   the derivative-norm residual discharged from the a.s. error-bound source:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
330. Theorem 5.41 finite-entry derivative error bound from coordinatewise
   real strong laws:
   `vaart1998_theorem_5_41_derivativeErrorBound_tendsto_ae_of_finiteCenteredStrongLaw`.
331. Theorem 5.41 current endpoint with the derivative error bound discharged
   by the finite-entry strong-law source; the remaining derivative source field
   is the operator-norm domination by that finite-entry bound:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_finiteDerivativeStrongLawBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
332. Theorem 5.41 operator-norm domination from a nonzero-direction action
   bound against the finite-entry derivative error:
   `vaart1998_theorem_5_41_derivativeAverage_norm_le_finiteEntryBound_of_action_bound`.
333. Theorem 5.41 current endpoint with the operator-norm domination
   discharged from the action bound; the remaining derivative source field is
   scalar finite-entry action algebra:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_finiteDerivativeActionBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
334. Theorem 5.41 derivative action bound from coordinate scalar bounds, using
   the finite-product sup norm on `Coord -> ℝ`:
   `vaart1998_theorem_5_41_derivativeAverage_action_le_finiteEntryBound_of_coordinate_bound`.
335. Theorem 5.41 coordinate scalar action bound from a weighted finite-entry
   representation and the scalar weight estimate `|weight| ≤ ‖x‖`:
   `vaart1998_theorem_5_41_derivativeAverage_coordinate_action_le_finiteEntryBound_of_weighted_entry_representation`.
336. Theorem 5.41 finite-parameter matrix-entry source lemma: a row-wise
   representation
   `∑ param, x param * entryError (coordinate, param)` is bounded by the full
   finite derivative-entry table using `|x param| ≤ ‖x‖`:
   `vaart1998_theorem_5_41_derivativeAverage_coordinate_action_le_finiteEntryBound_of_matrix_entry_representation`.
337. Theorem 5.41 finite-parameter matrix-entry action-bound handoff: the
   row-wise matrix-entry representation now gives the full vector action bound
   consumed by the finite-derivative endpoint:
   `vaart1998_theorem_5_41_derivativeAverage_action_le_finiteEntryBound_of_matrix_entry_representation`.
338. Theorem 5.41 canonical product score CLT source: canonical iid score
   samples on `ℕ -> Coord -> ℝ` now provide both the projected-summand CLT and
   the finite-vector scaled centered empirical-moment CLT from a Gaussian
   vector-law covariance source:
   `vaart1998_theorem_5_41_canonicalProductScore_projectedSummandCLT_of_vectorLawGaussianSource`;
   `vaart1998_theorem_5_41_canonicalProductScore_finiteVectorCLT_of_vectorLawGaussianSource`.
339. Theorem 5.41 canonical raw-score CLT source: a.e. equality between the
   raw scaled estimating-map average and the canonical finite-coordinate
   scaled centered empirical moment now transfers the canonical finite-vector
   score CLT into the raw score CLT required by the Z-estimator handoff:
   `vaart1998_theorem_5_41_rawScoreCLT_of_canonicalProductScore_finiteCoordinate_eq`.
340. Theorem 5.41 canonical score-source Z-estimator handoff: the canonical
   raw-score CLT now feeds the derivative-norm, law-tail, root, measurability,
   and envelope hypotheses directly into the compiled scaled-estimator
   conclusion:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_canonicalProductRawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
341. Chapter 2 stochastic boundedness law-tail converse: a.e.-measurable
   `O_P(1)` sequences now provide the law-tail field used by the Theorem 5.41
   law-tail wrappers:
   `vaart1998_law_real_norm_tail_of_stochasticBounded`.
342. Theorem 5.41 scaled-estimator law-tail source from `O_P(1)`: the usual
   display `scaledEstimator_n = scale_n • (estimator_n - theta0_n)` now gives
   a.e.-measurability, so a compiled `StochasticBounded` proof supplies the
   exact law-tail field consumed by the current 5.41 wrappers:
   `vaart1998_theorem_5_41_scaledEstimator_lawTail_of_stochasticBounded_estimatorSubMeas`.
343. Theorem 5.41 derivative-norm handoff with explicit `O_P(1)`: the
   operator-norm derivative residual source can now feed the compiled
   raw-score endpoint while consuming `StochasticBounded` for the scaled
   estimator directly:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope`.
344. Theorem 5.41 canonical raw-score handoff with explicit `O_P(1)`: the
   canonical product score law now feeds the raw-score CLT and the
   derivative-norm endpoint while keeping scaled-estimator tightness as the
   direct `StochasticBounded` hypothesis:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_canonicalProductRawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
345. Theorem 5.41 projected-summand score CLT handoff with explicit `O_P(1)`:
   a finite-coordinate projected-summand CLT now feeds the raw-score CLT and
   derivative-norm endpoint while keeping scaled-estimator tightness as
   `StochasticBounded`:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_projectedSummandCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
346. Theorem 5.41 common-vector-law score CLT handoff with explicit `O_P(1)`:
   the Chapter 4 finite-coordinate CLT source fields now produce the projected
   score CLT and feed the direct `StochasticBounded` Z-estimator endpoint:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.
347. Theorem 5.41 score-summand representation handoff with explicit
   `O_P(1)`: the zero-mean score summands and a.e. `sqrt n` representation now
   discharge the raw-score finite-coordinate field before feeding the direct
   `StochasticBounded` common-vector endpoint:
   `vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scoreSummandRepresentation_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope`.

Latest verified Vaart frontier before the next packet: this packet
(`Add Vaart theorem 5.41 score representation OP handoff`).

The latest theorem-sized packet strengthens the Chapter 5.41
asymptotic-normality route for Z-estimators by discharging the raw-score
finite-coordinate field from zero-mean score summands plus the a.e. `sqrt n`
representation, then feeding the common-vector-law derivative-norm handoff
that consumes `StochasticBounded` for the scaled estimator directly.  This
bypasses the intermediate law-tail field when an `O_P(1)` proof is already
available.

The next aggressive packet should prove exactly one live source field for the
current endpoint, following the priority order in the live `/goal` prompt.
Do not try to add the oversized finite-parameter statistical endpoint wrapper;
it is too costly to elaborate and the action-bound theorem is the reusable
source handoff.  Move next to a concrete source of `StochasticBounded` for the
scaled estimator, the derivative-bound `O_P(1)` wrapper above the
score-representation handoff, or a genuinely model-specific derivative
representation.  Do not repeat solved Chapter 2-4 infrastructure, canonical,
projected, common-vector, or score-representation wrappers, or earlier Theorem
5.41 wrapper layers unless a current proof directly depends on a small local
API there.

## Execution Notes

- Keep all repository-facing text in English.
- Preserve unrelated local-agent work and rebase over current `origin/main`
  before pushing.
- Use helper agents or extra worktrees only for independent API searches,
  verification, or disjoint Lean write scopes.

## Search-First Record

Local reuse anchors:

- `StatInference/Asymptotics/Basic.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityTheory/Basic.lean`
- `StatInference/EmpiricalProcess/Basic.lean`
- `StatInference/EmpiricalProcess/GlivenkoCantelli.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/Theorem243.lean`
- `StatInference/EmpiricalProcess/HilbertGaussian.lean`
- `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`

Pinned mathlib search scope:

- `Mathlib.MeasureTheory.Function.ConvergenceInMeasure`
- `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`
- `Mathlib.MeasureTheory.Measure.Portmanteau`
- `Mathlib.Probability.CentralLimitTheorem`
- `Mathlib.Probability.Distributions.Gaussian.Real`
- `Mathlib.Probability.Distributions.Gaussian.HasGaussianLaw.Basic`
- `Mathlib.MeasureTheory.Function.UniformIntegrable`
- `Mathlib.MeasureTheory.Measure.Decomposition.RadonNikodym`
- `Mathlib.MeasureTheory.Measure.LogLikelihoodRatio`
- `Mathlib.InformationTheory.KullbackLeibler.Basic`
- `Mathlib.Analysis.Calculus.FDeriv.Defs`
- `Mathlib.Analysis.Calculus.FDeriv.Linear`
- `Mathlib.Analysis.Calculus.FDeriv.Comp`

Search result: no existing local or pinned mathlib declarations named
`Contiguous`, `LAN`, or `DQM` were found.  These should be introduced later as
source-shaped structures only after Chapter 2-3 wrappers are stable.

Search result for the delta-method layer: mathlib already provides
`hasFDerivAt_iff_isLittleO_nhds_zero` in
`Mathlib.Analysis.Calculus.FDeriv.Basic`, which exactly packages Vaart's
deterministic differentiability display.  The local Vaart lane now wraps it
instead of reproving derivative foundations.

Search result for the tightness layer: local VdV&W weak-convergence files
already provide `VdVWProbabilityMeasuresAsymptoticallyTight`,
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_atTop`, and norm-tail
criteria such as `VdVWProbabilityMeasuresTight.tendsto_norm_tail`.  The Vaart
bridge is now compiled: `vaart1998_law_real_norm_tail_of_tight_range`,
`vaart1998_law_real_norm_tail_of_weak_convergence`, and
`vaart1998_stochasticBounded_of_tendstoInDistribution`.

Search result for the remaining delta-method layer: the scaled-ball smallness
theorem is now compiled.  The proof only needs the fixed scaled-ball event and
`‖r_n‖ -> ∞`; a separate probabilistic `T_n -> theta` assumption is not needed
for this certificate.  The Chapter 3 technical `AEMeasurable` side condition is
now also compiled from standard composition, subtraction, continuous-linear
composition, and constant-scaling APIs in mathlib.

Search result for Vaart Chapter 4.1: the source statement is in
`VanDerVaart_Asymptotic_Statistics_1-115.md` around lines 1387-1418.  Theorem
4.1 assumes `e(theta)=P_theta f` is one-to-one on open `Theta ⊆ R^k`,
continuously differentiable at `theta0`, has nonsingular derivative, and
`P_theta0 ‖f‖^2 < ∞`; it concludes existence with probability tending to one
and asymptotic normality.  The proof explicitly uses LLN for local existence,
CLT for `sqrt n (P_n f - P_theta0 f)`, and Theorem 3.1 delta method for the
display preceding the theorem.  The compiled Lean packet deliberately proves
only this CLT-to-delta handoff first.

Search result for Chapter 4 Lean reuse: pinned mathlib currently provides a
scalar CLT in `Mathlib.Probability.CentralLimitTheorem`; no ready multivariate
CLT was found.  Mathlib does provide inverse-function APIs in
`Mathlib.Analysis.Calculus.InverseFunctionTheorem.FDeriv` and differentiability
of continuous linear equivalences in `Mathlib.Analysis.Calculus.FDeriv.Equiv`;
these are now used to discharge the local inverse and open local range
certificates.  The open source/target API comes from
`OpenPartialHomeomorph.open_source`, `OpenPartialHomeomorph.open_target`,
`OpenPartialHomeomorph.map_target`, `OpenPartialHomeomorph.right_inv`, and
`OpenPartialHomeomorph.left_inv`.  The probability-localization bridge uses
`MeasureTheory.tendstoInMeasure_iff_measureReal_dist` plus real probability
complement algebra.

Search result for Vaart Example 2.18: the source multivariate CLT statement is
in `VanDerVaart_Asymptotic_Statistics_1-115.md` around lines 780-792.  The text
uses the Cramér-Wold device to reduce convergence of finite vectors to
convergence of all real linear projections, then applies the univariate CLT to
`t^T Y_i - t^T μ`.  The current Lean packet records the vector CLT as
`Vaart1998FiniteCoordinateEmpiricalMomentCLTCertificate`; the next proof layer
should either discharge this certificate from scalar projected CLTs or record
the exact missing Cramér-Wold/weak-convergence API.

Search result for the finite-coordinate LLN layer: local
`ProbabilityMeasure.StrongLaw` and `ProbabilityTheory.Basic` expose real-valued
iid strong-law wrappers such as `strongLaw_ae_real`,
`centeredStrongLaw_ae_real`, and `finite_centeredStrongLaw_ae_real`.  The Vaart
lane now wraps `finite_centeredStrongLaw_ae_real` with `tendsto_pi_nhds` to
obtain vector empirical-moment convergence for finite real coordinate types.
The measurability of the vector empirical moments is still an explicit
assumption for the convergence-in-probability and local-existence consumers.

Search result for the a.s.-to-probability handoff: pinned mathlib already
provides `MeasureTheory.tendstoInMeasure_of_tendsto_ae` in
`Mathlib.MeasureTheory.Function.ConvergenceInMeasure`.  The Vaart lane now
wraps this as `vaart1998_tendstoInMeasure_of_tendsto_ae` and routes it into
the Chapter 4 local-range probability constructors.

## Primitive Sequence

1. Keep `StatInference/AsymptoticStatistics/Basic.lean` compiling and
   root-imported from `StatInference.lean`.
2. Promote the Chapter 2 wrapper layer: continuous mapping, Slutsky, CLT, and
   stochastic little-o/Big-O helpers.
3. Prove the stochastic delta remainder from the compiled `HasFDerivAt`
   little-o display plus tightness/convergence in distribution, then package a
   source-facing Theorem 3.1 finite-dimensional delta method wrapper.
4. Add Chapter 4 moment-estimator wrappers from CLT plus delta method.
5. Add Chapter 5 consistency and asymptotic-normality certificate structures
   for M/Z-estimators, consuming local GC/Donsker interfaces rather than
   rebuilding empirical-process theory.
6. Only then open Chapter 6 contiguity and Chapter 7 LAN structures over
   likelihood-ratio/radon-nikodym APIs.
7. Keep Chapters 18-20 and 23-25 as dependency-aware later routes tied to the
   active VdV&W empirical-process lane.

## Manual Goal Prompt

Use the Live Continuation Prompt above as the active manual `/goal` prompt.
Do not maintain a second expanded prompt in this file.
