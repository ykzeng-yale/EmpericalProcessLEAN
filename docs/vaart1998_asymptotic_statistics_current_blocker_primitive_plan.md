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

Latest pushed Vaart packet before this run: `14c3424`
(`Add Vaart delta remainder measurability wrappers`).

The current theorem-sized packet opens Chapter 4.  The first method-of-moments
module, `StatInference/AsymptoticStatistics/MomentEstimators.lean`, compiles and
is root-imported from `StatInference.lean`.  It packages the part of Vaart
Theorem 4.1 that the current Chapter 2-3 spine can honestly prove: a supplied
empirical-moment CLT plus a differentiable/measurable local inverse gives the
asymptotic distribution of the local-inverse moment estimator by the delta
method.

The next aggressive packet should continue Chapter 4 without overclaiming the
existence sentence:

1. add a deterministic solve-on-local-range lemma: if `empiricalMoment n ω`
   lies in the local range `V`, then `eInv (empiricalMoment n ω)` solves the
   moment equations, with uniqueness under a supplied one-to-one/local-inverse
   hypothesis;
2. add an existence-with-probability-tending-to-one certificate as a supplied
   probability field, leaving vector LLN/local-range proof obligations explicit;
3. if cheap, connect mathlib's inverse-function theorem APIs
   `HasStrictFDerivAt.localInverse` and
   `HasFDerivAt.of_local_left_inverse` to
   `Vaart1998MomentLocalInverseCertificate`;
4. keep the multivariate empirical-moment CLT/covariance display supplied for
   now, since the current pinned mathlib CLT is scalar.

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
these should be used to discharge the local inverse certificate later.

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
