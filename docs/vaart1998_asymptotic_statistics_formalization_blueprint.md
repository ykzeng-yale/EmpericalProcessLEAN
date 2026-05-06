# van der Vaart 1998 Formalization Blueprint

This blueprint tracks the intended Lean route for A. W. van der Vaart,
*Asymptotic Statistics* (1998), under `StatInference/AsymptoticStatistics`.

## Design Principles

1. Reuse mathlib and local `StatInference` convergence/probability APIs first.
2. Keep Vaart files source-shaped: theorem names should carry chapter/item
   numbers when the source has them.
3. Use supplied-interface certificates for statistical theorems whose analytic
   or empirical-process hypotheses are large; then progressively discharge the
   certificate fields.
4. Keep textbook reports gated: no report until an exact source statement is
   fully proved in Lean and source evidence from Markdown/PDF is captured.
5. Coordinate with the VdV&W empirical-process lane; do not duplicate GC,
   Donsker, bracketing, covering, or outer-probability foundations.

## Chapter Map

### Chapters 1-3

Start with notation and core stochastic convergence:

- `P f`, empirical averages, empirical process notation;
- convergence in distribution, probability, and almost surely;
- Portmanteau, continuous mapping, Prohorov/tightness, Slutsky;
- stochastic `o_P` and `O_P`;
- CLT and WLLN wrappers;
- finite-dimensional delta method and uniform delta method.

### Chapters 4-5

Build estimator theory from the Chapter 2-3 spine:

- moment-estimator existence/consistency/asymptotic normality;
- M-estimator consistency via uniform convergence or Wald-style compactness;
- Z-estimator asymptotic normality via linearization;
- M-estimator rates and argmax theorem.

Use `EmpiricalProcess.GlivenkoCantelli`, `Theorem243`, and Donsker-facing local
interfaces whenever the book invokes Chapter 19.

### Chapters 6-10

Introduce statistical-experiment infrastructure:

- contiguity as a sequence-of-measures property;
- Le Cam first/third lemma wrappers;
- differentiability in quadratic mean and LAN structures;
- convolution/minimax efficiency via source-shaped experiment certificates;
- Bayes/Bernstein-von Mises after LAN and weak-convergence-on-experiments are
  stable.

### Chapters 11-17

Formalize classical statistics after the convergence spine is stable:

- Hilbert projection and conditional expectation wrappers;
- Hoeffding decompositions and U-statistics;
- rank/sign/permutation statistics;
- asymptotic power and relative efficiency of tests;
- likelihood-ratio and chi-square tests.

### Chapters 18-25

Treat these as the advanced empirical-process/functional-analysis layer:

- metric-space stochastic convergence and bounded stochastic processes;
- empirical distributions, random functions, maximal inequalities;
- functional delta method and Hadamard differentiability;
- quantiles/order statistics, L-statistics, bootstrap;
- density estimation and semiparametric tangent/information theory.

These chapters should aggressively reuse the VdV&W lane, especially
`EmpiricalProcess.WeakConvergence`, `GlivenkoCantelli`, `Theorem243`,
`Complexity`, and `HilbertGaussian`.

## First Source Anchors

- Section 1.5 expectation and empirical notation:
  `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_1-115.md`
  lines 388-400.
- Section 2.1 convergence definitions and first source theorems:
  lines 412-620.
- Theorem 2.3 continuous mapping:
  line 491.
- Lemma 2.8 Slutsky:
  line 593.
- Proposition 2.17 CLT:
  line 763.
- Theorem 3.1 delta method:
  line 1103.

## Current Module Plan

Initial modules:

- `Basic.lean`: Chapter 2 stochastic convergence wrappers and Chapter 3
  supplied-linearization delta bridge, the `HasFDerivAt` deterministic
  remainder display, the scaled-remainder delta handoff, and the
  tight-localization bridge for the stochastic delta remainder.  It also now
  contains the VdV&W tight-law-range to real-tail bridge, the Chapter 2
  theorem that convergence in distribution implies `O_P(1)`, and Chapter 3
  delta wrappers that derive scaled-statistic stochastic boundedness from
  distributional convergence.  The scaled-ball local-remainder certificate is
  now discharged from `HasFDerivAt` plus `r_n -> ∞`, yielding the compact
  sequence wrapper
  `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution`.  The
  technical scaled-remainder a.e.-measurability field is now also packaged
  from `T_n` and `phi ∘ T_n`, with a measurable-`phi` convenience wrapper.
- `DeltaMethod.lean`: full finite-dimensional delta method and uniform delta
  method, starting with source reports and uniform variants rather than the
  now-compiled scalar scaled-ball and measurability certificates.
- `MomentEstimators.lean`: Chapter 4 wrappers.
- `Estimators.lean`: Chapter 5 M/Z-estimator consistency and asymptotic
  normality certificates.
- `Contiguity.lean`: Chapter 6 definitions and Le Cam lemmas.
- `LAN.lean`: Chapter 7 DQM/LAN structures and MLE consequences.

Split later chapters only when proof volume justifies it.
