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

The next aggressive theorem-sized packet is the stochastic
differentiability-to-delta remainder layer: combine the compiled
`HasFDerivAt` little-o display with tightness or convergence in distribution of
`r_n • (T_n - theta)` to prove the scaled remainder is `o_P(1)`, then feed it
into `vaart1998_theorem_3_1_delta_method_of_scaled_remainder` to close a fully
source-shaped finite-dimensional Theorem 3.1 wrapper.

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
