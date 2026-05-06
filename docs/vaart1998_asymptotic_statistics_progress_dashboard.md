# van der Vaart 1998 Progress Dashboard

Status date: 2026-05-06.

## Current Lane

Active namespace: `StatInference.AsymptoticStatistics`

Active Lean folder: `StatInference/AsymptoticStatistics/`

Source folder: `Textbooks/VaartAsymStat1998/`

## Verified Frontier

Initial scaffold and the next Chapter 3 delta-method localization layer compile:

- `StatInference/AsymptoticStatistics/Basic.lean`
- root import from `StatInference.lean`
- route docs under `docs/vaart1998_asymptotic_statistics_*`

The initial Lean target is Chapter 2 plus Chapter 3 substrate:

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

Verification passed for the latest pushed Vaart packet before this run,
`06ca46f`:

- `lake env lean StatInference/AsymptoticStatistics/Basic.lean`
- `lake build StatInference.AsymptoticStatistics.Basic`

Current Vaart packet verification passed for:

- `lake env lean StatInference/AsymptoticStatistics/Basic.lean`
- `lake build StatInference.AsymptoticStatistics.Basic`

## Next Aggressive Target

Move beyond the now-compiled Chapter 3.1 probability, analytic, and
measurability plumbing:

1. start Chapter 4 method-of-moments wrappers using the CLT wrapper
   plus `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution`;
2. add only those moment-estimator certificates whose SLLN/CLT/delta fields
   are already available locally;
3. only write an exact Theorem 3.1 source report after capturing the theorem
   statement and assumptions from the Markdown/PDF.

If this blocks, record the exact missing SLLN/CLT/delta theorem shape and
continue with the widest Chapter 4 wrapper that compiles.

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
