# van der Vaart 1998 Current Blocker And Primitive Plan

This file is the active blocker register for the van der Vaart 1998
asymptotic-statistics lane.  It should be checked at the start of each
manual `/goal` continuation before selecting a proof target.

## Adaptive Goal Prompt Rule

The active Vaart `/goal` in this chat is part of the proof state.  Every manual
goal run should finish by checking whether the live continuation prompt is
stale relative to this file, the dashboard, the blueprint, and the latest
verified commit.

Refresh the manual continuation prompt whenever a run:

- proves a Lean declaration;
- narrows or discovers a blocker;
- merges other-agent work;
- changes the next atomic target;
- records a material mathlib/local-code search result.

The refreshed prompt should name:

- the latest pushed commit and the exact new declarations or blocker
  refinement;
- one primary theorem/proof target plus independent support targets;
- the search-first scope: pinned mathlib, local `StatInference`, existing
  `ProbabilityMeasure`, `ProbabilityTheory`, `Asymptotics`, `EmpiricalProcess`,
  and recent remote contributions;
- the verification gate: focused `lake env lean`, targeted `lake build`, root
  build if imports changed, `git diff --check`, proof-hole scan, and secret
  scan;
- the report gate: no Vaart theorem report until an exact source theorem
  compiles and source evidence is captured from Markdown/PDF.

Do not update the prompt for wording-only churn.  Do update it when an old
prompt would point at a solved target, omit a newly discovered reusable API, or
hide the current blocker.

## Throughput Policy

Each run should make concrete verified Lean progress or document a precise
blocker with attempted APIs.  Prefer theorem-sized source wrappers and
certificate bridges that unlock multiple later chapters.  A tiny primitive is
acceptable only when it is the fastest verified dependency for the current
theorem route.

This lane is a manual `/goal` continuation, not a recurring automation.  Do not
create or update Codex automations for the Vaart textbook route.  Keep the live
goal state in this chat and mirror the exact frontier in this file, the
dashboard, and the blueprint.

Use worktrees when they improve coordination with other local textbook agents,
but keep every packet small and rebase-aware:

- start by checking `git status`, `origin/main`, this blocker file, the
  dashboard, and the blueprint;
- search pinned mathlib and local `StatInference` before introducing a new
  primitive;
- prove one theorem-sized packet at a time, with names and comments in English;
- run the focused Lean file before editing docs;
- update route docs only after a real Lean declaration or precise blocker is
  known;
- fetch and rebase immediately before commit/push, then rerun at least the
  focused Lean gate on the rebased tree;
- push only clean verified packets and preserve unrelated user or agent
  changes.

Spawn a useful independent agent team in this chat when slots permit:

- source scout for Vaart anchors and theorem ordering;
- Lean reuse scout for mathlib/local APIs;
- bounded worker for a disjoint Lean or docs write scope;
- verifier/reviewer when a packet is ready.

Keep write scopes disjoint and never revert unrelated local changes.

## Current Blocker

The Vaart source assets are present in:

- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_1-115.md`
- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_116-230.md`
- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_231-345.md`
- `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_346-460.md`
- `Textbooks/VaartAsymStat1998/PDF/VanDerVaart_Asymptotic_Statistics.pdf`

The immediate source-shaped Vaart namespace is now started and reuses the
existing probability, empirical-process, and deterministic asymptotics lanes
instead of duplicating foundations.  The first Lean packet keeps Chapter 2 and
Chapter 3 theorem-facing wrappers compiling:

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

Latest remote base before this packet: `9075e07`.
Latest pushed Vaart packet before this packet: `8bc662b`
(`Add Vaart canonical covariance law endpoint`).

The current theorem-sized packet packages the observation-law side conditions.
The vector-law source certificate bundles coordinate evaluation measurability
and coordinate `MemLp 2` under `ν`; it also exposes `MemLp id 2 ν` and the
canonical product coordinate source fields.  The newest canonical endpoint now
uses that certificate instead of taking coordinate measurability and
coordinate-projection `MemLp` as separate arguments.  The remaining
non-sample-space source hypotheses are now Gaussian limit law and the
inverse-function target event.

The next aggressive packet should continue Chapter 4 by discharging the
remaining source hypotheses without overclaiming unavailable infrastructure:

1. attack the remaining inverse-function target event only through a real
   local-inverse/measurability theorem or keep it as a named source certificate;
2. keep endpoint variants narrow and add them only when they remove a real
   caller-side field.

Do not start with LAN, contiguity, semiparametric Hilbert-space tangent
geometry, or bootstrap conditional weak convergence before the Chapter 2-3
spine is stable.  Those later chapters should be scouted in parallel only.

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

## Current Manual Goal Prompt Seed

Start every run by inspecting git status, fetching origin/main, reviewing
recent remote commits for other-agent Lean contributions, reading this file
plus the Vaart dashboard and blueprint, and scanning
`StatInference/AsymptoticStatistics`, `StatInference/Asymptotics`,
`StatInference/ProbabilityMeasure`, `StatInference/ProbabilityTheory`, and
`StatInference/EmpiricalProcess`.  Then choose the next largest source-shaped
proof step that can compile.  Verify, update docs, commit/push when safe, and
refresh the manual `/goal` continuation state when the frontier changes.  Do
not create a recurring automation unless the user explicitly asks for one.
Report progress/blockers in Chinese/English mix.
