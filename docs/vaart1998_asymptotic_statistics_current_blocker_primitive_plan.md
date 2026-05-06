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

Latest pushed Vaart packet before this run: `e18d286`
(`Add Vaart covariance bilinear law bridge`).

The current theorem-sized packet discharges the inverse-derivative
measurability and square-integrability side conditions for the covariance
bridge.  A continuous linear inverse derivative sends an a.e.-measurable,
square-integrable limit law to an a.e.-measurable, square-integrable estimator
limit law, and the covarianceBilinDual pullback theorem now needs only the
original `MemLp id 2 (Q.map Z)` hypothesis.  Local-inverse measurability, the
multivariate empirical-moment CLT, and finite-matrix specialization remain
explicit next source layers.

The next aggressive packet should continue Chapter 4 by discharging the
remaining source hypotheses without overclaiming unavailable infrastructure:

1. package the covarianceBilinDual pullback directly into the measurable
   finite-coordinate Theorem 4.1 wrapper under a single original-law `MemLp`
   hypothesis;
2. add a local-inverse measurability convenience if a clean continuity/open
   partial homeomorphism API can discharge it without broad topological
   refactoring;
3. keep a true multivariate empirical-moment CLT supplied until a local vector
   CLT is formalized from the scalar mathlib CLT.

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
