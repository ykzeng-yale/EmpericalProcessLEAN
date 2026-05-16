# Durrett 2019 Current Blocker And Primitive Plan

This file is the active blocker register for the Durrett probability-theory
lane.  It should be checked at the start of each in-thread goal cycle before
choosing a proof target.

## Live In-Thread Goal Prompt V416

Use only this compact prompt as the live Durrett `/goal` whenever the app-level
goal text is older than the verified route docs.  The detailed route notes
below are provenance, not prompt text.

Continue Durrett 2019 Probability Theory formalization in Lean from latest
synced `main`.  Immediate lane: Durrett Chapter 2.5 random-series consequences
in `StatInference/ProbabilityTheory/Basic.lean`.  Theorem 2.5.11 now has the
random-series/Kronecker bridge and variance-bound abstraction: a.s. convergence
of `sum X_k/a_k`, or summable variances of `X_k/a_k`, gives
`sum_{k <= n} X_k / a_n -> 0` for any nonzero monotone divergent normalizer;
a uniform variance bound reduces the variance hypothesis to summability of
`a_k^{-2}`.  Next aggressive target: instantiate Durrett's exact logarithmic
normalizer `a_n = n^(1/2) * (log n)^(1/2 + epsilon)` for `n >= 2`.  Prove the
nonzero, monotone, and `atTop` normalizer obligations; prove summability of
`1 / (n * (log n)^(1 + 2 epsilon))` by reusing mathlib p-series/log-series
APIs; then package the source-facing iid finite-second-moment statement
`S_n / (n^(1/2) * (log n)^(1/2 + epsilon)) -> 0` a.s.  Do not route back to
Theorem 2.4.9, 2.5.5, 2.5.8, 2.5.9, 2.5.10, or the abstract V416 bridge unless
search proves a concrete missing source display.

Latest verified target V416 packages Durrett Theorem 2.5.11's abstract
random-series/Kronecker and variance-bound bridge.  New compiled anchors:
`durrett2019_theorem_2_5_11_normalized_sum_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_11_ae_normalized_sum_tendsto_zero_of_summable_scaled_variance`,
`durrett2019_theorem_2_5_11_variance_div_le_inv_sq_mul_of_variance_le`,
`durrett2019_theorem_2_5_11_scaled_variance_summable_of_variance_bound`,
and
`durrett2019_theorem_2_5_11_ae_normalized_sum_tendsto_zero_of_variance_bound`.
The proof reuses V406 random-series convergence, V410 Kronecker
normalization, local independence-under-composition support, and mathlib
variance scaling.  The remaining 2.5.11 blocker is the exact logarithmic
normalizer and source-facing finite-variance packaging, not random-series
plumbing.

Latest verified target V415 packages Durrett Theorem 2.5.10 truncated-to-
original transfer and the full source-facing SLLN average endpoint.  New
compiled anchors:
`durrett2019_theorem_2_5_10_truncation_mismatch_subset_tail`,
`durrett2019_theorem_2_5_10_measure_mismatch_le_tail`,
`durrett2019_theorem_2_5_10_tsum_tail_ne_top_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_10_tsum_mismatch_ne_top_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_10_ae_eventuallyEq_truncated_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_10_average_tendsto_of_eventuallyEq`,
and
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_integrable_identDistrib`.
The proof reuses mathlib `Probability.StrongLaw.tsum_prob_mem_Ioi_lt_top`,
local Borel-Cantelli/eventual-equality infrastructure from V407-V409, and the
V414 truncated-average endpoint.  This closes the Chapter 2.5.10 SLLN route in
the current one-based source display.

V414 packages Durrett Theorem 2.5.10 scaled-centered
variance summability and the truncated-average source endpoint.  New compiled
anchors:
`durrett2019_theorem_2_5_10_variance_scaledCenteredTruncated_le_truncated_sq`,
`durrett2019_theorem_2_5_10_integral_truncated_sq_eq_base_truncated_sq_of_identDistrib`,
`durrett2019_theorem_2_5_10_integral_base_truncated_sq_eq_abs_truncation_sq`,
`durrett2019_theorem_2_5_10_scaled_variance_summable_of_integrable_identDistrib`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_integrable_identDistrib`.
The proof reuses mathlib `Probability.StrongLaw.sum_variance_truncation_le` on
`|X_0|`, `variance_le_expectation_sq`, local closed-truncation/identical-
distribution bridges, and the V413 dominated-convergence mean layer.  The
remaining blocker for the full SLLN statement is now the transfer from
truncated sums `T_n` to original sums `S_n`.

V413 packages Durrett Theorem 2.5.10 moving-truncation
mean convergence.  New compiled anchors:
`durrett2019_theorem_2_5_10_tendsto_integral_fixed_truncation`,
`durrett2019_theorem_2_5_10_integral_truncated_eq_base_truncated_of_identDistrib`,
`durrett2019_theorem_2_5_10_truncatedMean_tendsto_of_integrable_identDistrib`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_scaled_variance_summable`.
This discharges the textbook dominated-convergence step
`E[X_k 1_{|X_k| <= k}] -> mu` for identically distributed integrable random
variables and plugs it into the V412 truncated-average endpoint.

V412 packages Durrett Theorem 2.5.10 moving-truncation support.  Compiled
anchors:
`durrett2019_theorem_2_5_10_truncated`,
`durrett2019_theorem_2_5_10_truncatedMean`,
`durrett2019_theorem_2_5_10_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_10_measurable_truncated`,
`durrett2019_theorem_2_5_10_iIndepFun_truncated_of_iIndepFun`,
`durrett2019_theorem_2_5_10_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_10_measurable_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_10_scaledCenteredTruncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_10_integral_scaledCenteredTruncated_eq_zero`,
`durrett2019_theorem_2_5_10_iIndepFun_scaledCenteredTruncated_of_iIndepFun`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_scaled_variance_summable_and_mean_tendsto`.
This discharges the moving-truncation measurability/independence/L2/mean-zero
obligations and plugs them into the V411 random-series assembly.

V411 packages the first Durrett Theorem 2.5.10
random-series strong-law assembly layer.  New compiled anchors:
`durrett2019_theorem_2_5_10_centered_average_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_10_centered_average_difference_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_10_mean_average_tendsto_of_tendsto`,
`durrett2019_theorem_2_5_10_average_tendsto_of_scaled_centered_series_and_mean_tendsto`,
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_scaled_centered_series_and_mean_tendsto`,
and
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_scaled_centered_summable_variance_and_mean_tendsto`.
This moves the theorem frontier past pure Kronecker plumbing: the remaining
work is the genuine moving-truncation probability estimates from Durrett's
proof, not the deterministic normalization or Cesaro algebra.

V410 packages Durrett Theorem 2.5.9 deterministic
Kronecker support in `Basic.lean`.  New compiled anchors:
`durrett2019_theorem_2_5_9_kronecker_summation_by_parts`,
`durrett2019_theorem_2_5_9_kronecker_ratio_eq`,
`durrett2019_theorem_2_5_9_weight_increment_sum_eq`,
`durrett2019_theorem_2_5_9_constant_weighted_tendsto`,
`durrett2019_theorem_2_5_9_weighted_average_eq_constant_add_centered`,
`durrett2019_theorem_2_5_9_weighted_average_tendsto_of_centered_tendsto_zero`,
`durrett2019_theorem_2_5_9_centered_toeplitz_remainder_tendsto_zero`,
`durrett2019_theorem_2_5_9_weighted_average_tendsto_of_nonnegative_increments`,
`durrett2019_theorem_2_5_9_kronecker_ratio_tendsto_zero_of_weighted_tendsto`,
`durrett2019_theorem_2_5_9_kronecker_ratio_tendsto_zero_of_nonnegative_increments`,
and `durrett2019_theorem_2_5_9_normalized_sum_tendsto_zero`.
The proof reuses mathlib's finite-difference telescoping and
`Asymptotics.IsLittleO.sum_range`, and ports the already-tested local
Exercise 4.4.11 deterministic route into a Chapter 2.5 source-facing theorem.
Mathlib did not expose a ready one-line Kronecker lemma for this exact display.
Next target is Theorem 2.5.10 SLLN: instantiate `a_n = n`, build convergence
of `sum (X_i - mu) / i` from the random-series theorem, then apply V410
pathwise.

V409 packages the source-facing one-based sufficiency
direction of Durrett Theorem 2.5.8.  New compiled anchors:
`durrett2019_theorem_2_5_8_integral_centered_truncated_eq_zero`,
`durrett2019_theorem_2_5_8_variance_centered_truncated_eq_variance`,
`durrett2019_theorem_2_5_8_tsum_tail_ne_top_of_oneBased`, and
`durrett2019_theorem_2_5_8_random_series_converges_ae_of_three_series_sufficiency_oneBased`.
The front-facing sufficiency theorem now takes Durrett's three displayed
one-based assumptions: `sum P(|X_i| > A) < infinity`, convergence of
`sum E Y_i`, and summability of `Var(Y_i)` for
`Y_i = X_i 1_{|X_i| <= A}`, then proves a.s. convergence of `sum X_i`.
The proof applies V406 to the centered truncations `Y_i - E Y_i`, using V408
independence and `L^2` support, and uses `variance_sub_const` to translate
Durrett's condition (iii) from `Var(Y_i)` to the centered variables.  The
necessity direction is deliberately deferred to Durrett Example 3.4.12, as in
the text.

V408 adds Durrett Theorem 2.5.8 fixed-level truncation
and large-jump mismatch support.  New compiled anchors:
`durrett2019_theorem_2_5_8_truncated`,
`durrett2019_theorem_2_5_8_measurable_truncationMap`,
`durrett2019_theorem_2_5_8_measurable_truncated`,
`durrett2019_theorem_2_5_8_iIndepFun_truncated_of_iIndepFun`,
`durrett2019_theorem_2_5_8_iIndepFun_centered_truncated_of_iIndepFun`,
`durrett2019_theorem_2_5_8_truncated_eq_self_of_abs_le`,
`durrett2019_theorem_2_5_8_truncated_eq_zero_of_lt_abs`,
`durrett2019_theorem_2_5_8_abs_truncated_le_abs`,
`durrett2019_theorem_2_5_8_norm_truncated_le_abs_bound`,
`durrett2019_theorem_2_5_8_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_8_centered_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_8_truncation_mismatch_subset_tail`,
`durrett2019_theorem_2_5_8_measure_mismatch_le_tail`,
`durrett2019_theorem_2_5_8_tsum_mismatch_ne_top_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_8_ae_eventuallyEq_truncated_of_tsum_tail_ne_top`,
and
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_truncated_centered_of_realSeriesConverges_of_tsum_tail_ne_top`.
This proves the source scaffold
`Y_i = X_i 1_{|X_i| <= A}`, `{X_i != Y_i} subset {|X_i| > A}`, summable
large-jump probabilities imply eventual equality by Borel-Cantelli, and the
abstract sufficiency assembly from centered truncated convergence plus
deterministic centering convergence to convergence of `sum X_i`.

V407 starts Durrett Theorem 2.5.8 Kolmogorov
three-series sufficiency.  Compiled anchors:
`durrett2019_theorem_2_5_8_realPartialSum`,
`durrett2019_theorem_2_5_8_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_add_of_randomSeriesConverges_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_of_centered_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_ae_centered_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_of_eventuallyEq`,
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_ae_eventuallyEq_of_ae_randomSeriesConverges`,
`durrett2019_theorem_2_5_8_ae_eventuallyEq_of_tsum_measure_ne_top`,
and
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_tsum_mismatch_ne_top_of_ae_randomSeriesConverges`.
This packages the textbook assembly: centered a.s. convergence plus convergence
of `sum E Y_n` gives convergence of `sum Y_n`, and Borel-Cantelli-generated
eventual equality transfers convergence from `Y_n` to `X_n`.

V406 adds the exact textbook series-convergence display wrapper for Durrett
Theorem 2.5.6.  New compiled anchors:
`durrett2019_theorem_2_5_6_randomSeriesConverges` and
`durrett2019_theorem_2_5_6_random_series_converges_ae_of_summable_variance`.
This matches Durrett's definition that `sum_{n=1}^infty X_n(omega)` converges
iff the one-based partial sums have a finite limit, and restates V405 in that
wording.

V405 packages the a.s. convergence endpoint for Durrett Theorem 2.5.6.
Compiled anchors:
`durrett2019_theorem_2_5_6_tailBlockSum_add_eq_tailBlockSum_add_tailBlockSum`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_threshold_mono`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_base_mono`,
`durrett2019_theorem_2_5_6_eventually_not_tailPairOscillationEvent_of_not`,
`durrett2019_theorem_2_5_6_measure_iInter_tailPairOscillationEvent_eq_zero_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_ae_exists_not_tailPairOscillationEvent_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_ae_eventually_not_tailPairOscillationEvent_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_exists_tendsto_partialSum_of_grid_not_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_ae_forall_nat_exists_not_tailPairOscillationEvent_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_ae_exists_tendsto_partialSum_of_grid_tailPairOscillationEvent_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_tendsto_zero_of_summable_variance_threshold`,
and
`durrett2019_theorem_2_5_6_random_series_partialSum_converges_ae_of_summable_variance`.
This closes the main source-facing Theorem 2.5.6 random-series convergence
statement for one-based partial sums under independent mean-zero increments
with finite second moments and summable variances.  It deliberately uses a
countable inverse-natural threshold grid plus `ae_all_iff`; do not replace it
with an invalid uncountable a.e. intersection over all real epsilons.

V404 packages Durrett's pathwise Cauchy endpoint from eventual absence of
shifted tail-pair oscillation events.  Compiled
anchors:
`durrett2019_theorem_2_5_6_partialSum`,
`durrett2019_theorem_2_5_6_tailBlockSum`,
`durrett2019_theorem_2_5_6_partialSum_add_eq_partialSum_add_tailBlockSum`,
`durrett2019_theorem_2_5_6_partialSum_sub_eq_tailBlockSum_sub`,
`durrett2019_theorem_2_5_6_tailBlockCauchy`,
`durrett2019_theorem_2_5_6_tailBlock_bound_of_not_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_tailBlockCauchy_of_eventually_not_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_cauchySeq_partialSum_of_tailBlockCauchy`,
`durrett2019_theorem_2_5_6_cauchySeq_partialSum_of_eventually_not_tailPairOscillationEvent`,
and
`durrett2019_theorem_2_5_6_exists_tendsto_partialSum_of_eventually_not_tailPairOscillationEvent`.
The deterministic endpoint now reuses mathlib's `Metric.cauchySeq_iff` and
`CauchySeq.tendsto_limUnder`; do not rebuild Cauchy-completeness machinery.

V403 packages Durrett's oscillation step in shifted block form.  Compiled
anchors:
`durrett2019_theorem_2_5_6_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_measurableSet_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_subset_tailMaxCrossingEvent_two_mul`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_le_tailMaxCrossingEvent`,
and
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_tendsto_zero_of_summable_variance`.
This is the formal `P(w_M > 2 eps) <= P(sup_{m >= M} |S_m - S_M| > eps)
-> 0` bridge, represented by shifted tail-block partial sums.

V402 derives the textbook variance-tail probability
limit from one-based summability of `fun i => Var(X_{i+1})`.  New compiled
anchors:
`durrett2019_theorem_2_5_6_sum_range_shift_tendsto_tsum_of_summable`,
`durrett2019_theorem_2_5_6_tsum_tail_tendsto_zero_of_summable`,
`durrett2019_theorem_2_5_6_variance_tail_partial_tendsto_tsum_of_summable`,
`durrett2019_theorem_2_5_6_variance_tsum_tail_tendsto_zero_of_summable`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_summable_variance`,
and
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_tendsto_zero_of_summable_variance`.
The line
`P(sup_{m >= M} |S_m - S_M| > eps) <= eps^{-2} *
sum_{i=M+1}^\infty Var(X_i) -> 0`
is now represented for the shifted tail-maximal event.

V401 lifts the finite Theorem 2.5.6 block estimate to the increasing-union tail
event.  Compiled anchors:
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent`,
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent_mono`,
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent_add_bound`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_tendsto_bounds`,
and
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_variance_tail_limit`.
The finite-to-infinite probability passage now reuses mathlib's
`tendsto_measure_iUnion_atTop` through the local Durrett 1.1.1 continuity
pattern; do not rebuild countable-union measure machinery.

V400 adds the final source-style statement of Kolmogorov's maximal inequality
and the first Theorem 2.5.6 block estimate:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_inequality` and
`durrett2019_theorem_2_5_6_finite_block_kolmogorov_maximal_bound`.  This closes
the front-facing Theorem 2.5.5 package and starts Theorem 2.5.6.

V399 adds `L^2` source-side reduction for Theorem
2.5.5:
`durrett2019_theorem_2_5_5_partialSum_memLp_two_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_partialSum_sq_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_rangeSum_memLp_two_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_rangeSum_sq_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_firstCrossing_mixed_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_memLp_two_mean_zero`,
and its one-based wrapper.  The front-facing textbook display now only needs
independence, coordinate measurability, finite-range `MemLp X_i 2`, and
finite-range mean zero; partial-square, terminal-square, future-integrability,
and mixed-term integrability obligations are generated internally.

V398 adds source-facing increment mean-zero wrappers:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_mean_zero`
and
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_mean_zero_oneBased`.
These derive terminal partial-sum mean zero from finite-range increment
integrability and mean-zero assumptions before applying the V397 variance
display.

V397 packages the textbook division and variance display from the compiled
V396 maximal integral inequality:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_div_bound`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_div_bound_oneBased`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound`, and
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_oneBased`.
The source-facing conclusion now has the textbook shape
`P(max_{1 <= k <= n} |S_k| >= x) <= (x^2)^{-1} * Var(S_n)` once the
terminal partial sum is mean-zero.

V396 adds the terminal-square finite-union bound and core chained maximal
integral inequality:
`durrett2019_theorem_2_5_5_sum_firstCrossing_terminalSq_integrals_le_integral`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_bound`, and matching
one-based wrappers.  The compiled route now proves
`x^2 * P(max_{1 <= k <= n} |S_k| >= x) <= integral S_n^2` under the explicit
integrability and mixed-term side conditions consumed by the existing
first-crossing bridges.

## Recent Verified Route Notes

V397 through V400 close the theorem-facing probability display and the main
source-side packaging for Durrett Theorem 2.5.5.  V395 adds the
square-expansion upper-comparison layer:
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_add_mixed_le_terminalSq`,
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_integral_le_terminalSq_integral_of_mixed_zero`,
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_integral_le_terminalSq_integral`,
`durrett2019_theorem_2_5_5_sum_firstCrossing_stoppedSq_integrals_le_sum_terminalSq_integrals`,
and the matching one-based wrappers.  The source proof now has both
`x^2 * P(max crossing) <= sum_m integral_{A_m} S_m^2` and
`sum_m integral_{A_m} S_m^2 <= sum_m integral_{A_m} S_n^2`.
V396 now supplies the terminal-square finite-union bound and chains these
pieces into the core maximal integral inequality.

V394 adds the maximal-crossing decomposition and summed first-crossing lower
bound:
`durrett2019_theorem_2_5_5_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_firstCrossing_biUnion_eq_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_measurableSet_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_measureReal_maxCrossingEvent_eq_sum`,
`durrett2019_theorem_2_5_5_sq_mul_measureReal_maxCrossingEvent_le_sum_firstCrossing_integrals`,
and matching one-based wrappers.  The probability side of the textbook proof
now reaches
`x^2 * P(max_{1 <= k <= n} |S_k| >= x) <= sum_k integral_{A_k} S_k^2`.
V395 now supplies the complementary summed stopped-square upper comparison
against the sum of terminal-square integrals over the same first-crossing
events.

V393 adds the finite first-crossing disjoint-union layer:
`durrett2019_theorem_2_5_5_measurableSet_firstCrossingEvent`,
`durrett2019_theorem_2_5_5_firstCrossing_events_disjoint`,
`durrett2019_theorem_2_5_5_firstCrossing_events_pairwiseDisjoint`,
`durrett2019_theorem_2_5_5_measureReal_firstCrossing_biUnion_eq_sum`, and
the matching one-based wrappers.  Together with V392, this turns individual
first-crossing lower bounds into finite summed probability mass.

V392 adds the single first-crossing square/mass lower bound for Durrett
Theorem 2.5.5:
`durrett2019_theorem_2_5_5_firstCrossingBlockSet_sq_le`,
`durrett2019_theorem_2_5_5_firstCrossing_sq_mul_measureReal_le_integral`,
and
`durrett2019_theorem_2_5_5_firstCrossing_sq_mul_measureReal_le_integral_oneBased`.
These show that each first-crossing event contributes at least
`x^2 * P(A_m)` to the squared partial-sum integral.  V393 now supplies the
disjoint finite-union summation layer above it.

V391 starts the Durrett Theorem 2.5.5 Kolmogorov
maximal-inequality proof route by packaging the first-crossing mixed-term
calculation:
`durrett2019_theorem_2_5_5_firstCrossingBlockSet`,
`durrett2019_theorem_2_5_5_measurableSet_firstCrossingBlockSet`,
`durrett2019_theorem_2_5_5_firstCrossing_mixed_integral_eq_zero`, and
`durrett2019_theorem_2_5_5_firstCrossing_mixed_integral_eq_zero_oneBased`.
These consume the compiled Theorem 2.1.10 disjoint-block independence and
Theorem 2.1.13 expectation-factorization bridges.  Next aggressive target:
prove the square-integral lower-bound/mass inequality over the disjoint
first-crossing events, then assemble the full Theorem 2.5.5 display.  Do not
return to Theorem 2.4.9 source-entry plumbing unless search proves a concrete
missing display.

V390 adds the direct countable supplied-partition and
one-based outer-a.s. product-law/canonical route for Durrett Theorem 2.4.9:
`durrett2019_theorem_2_4_9_middlePartitionWithTails_almostSureUniformDeviation_of_tendsto_partitions_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation_of_tendsto_partitions_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_almostSureUniformDeviation_of_tendsto_partitions_canonical_iid`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation_of_tendsto_partitions_canonical_iid`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_outerAlmostSureUniformDeviation_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_outerAlmostSureUniformDeviation_of_shift_hasLaw_infinitePi`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_outerAlmostSureUniformDeviation_canonical_iid`.
These consume the compiled Chapter 2.1.11 product-law/canonical iid packages
and the V379/V389 middle-partition-with-tails route.  Next aggressive target:
stop rebuilding Theorem 2.4.9 source-entry plumbing; either close one
remaining source-facing display for 2.4.9 only if search proves it is missing,
or move to Chapter 2.1.12/2.1.13 product-expectation/Kolmogorov-maximal
support needed by the next Durrett theorem.

V389 lifts the global middle-partition-with-tails
uniform-error squeeze in Durrett Theorem 2.4.9 to product-law and canonical
source forms:
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt_two_mul_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_two_mul_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_two_mul_of_shift_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt_canonical_iid`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_canonical_iid`.
These consume the compiled Chapter 2.1.11 product-law/canonical iid packages
and the V388 finite-cutpoint burn-in layer.  Next work should not rebuild the
middle/tail uniform-error product-law consumers; move to the countable
supplied-partition route or direct outer-a.s. empirical-CDF source entries
that still lack product-law/canonical wrappers.

V388 lifts the finite-cutpoint burn-in step in
Durrett Theorem 2.4.9 to product-law and canonical source forms:
`durrett2019_theorem_2_4_9_finite_cutpoints_eventually_closed_left_errors_lt_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_finite_cutpoints_oneBased_inv_mul_closed_left_errors_lt_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_finite_cutpoints_oneBased_inv_mul_closed_left_errors_lt_of_shift_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_finite_cutpoints_eventually_closed_left_errors_lt_canonical_iid`,
and
`durrett2019_theorem_2_4_9_finite_cutpoints_oneBased_inv_mul_closed_left_errors_lt_canonical_iid`.
These consume the compiled Chapter 2.1.11 product-law/canonical iid packages
and the pointwise empirical-CDF endpoints.  Next work should not rebuild
finite-cutpoint product-law consumers; move to the next global Theorem 2.4.9
middle/tail or outer-a.s. empirical-CDF source display that still lacks a
direct product-law/canonical entry.

V387 adds canonical iid product-space pointwise
Theorem 2.4.9 displays for both the empirical CDF and the left empirical CDF:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_tendsto_cdf_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_range_sum_tendsto_cdf_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_inv_mul_range_sum_tendsto_cdf_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_tendsto_cdf_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_range_sum_tendsto_cdf_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_range_sum_tendsto_leftLim_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_inv_mul_range_sum_tendsto_leftLim_ae_canonical_iid`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_tendsto_leftLim_ae_canonical_iid`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_range_sum_tendsto_leftLim_ae_canonical_iid`.
These consume the compiled Chapter 2.1.11 canonical coordinate iid package on
`P^N`.  Next work should not rebuild canonical pointwise displays; move to a
new theorem-sized Chapter 2.1/2.4.9 source consumer, preferably one that
packages finite-cutpoint or global empirical-CDF steps from the already
compiled pointwise and product-law endpoints.

V386 adds zero-based product-law consumers for the
pointwise Theorem 2.4.9 proof steps:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_tendsto_cdf_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_range_sum_tendsto_cdf_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_inv_mul_range_sum_tendsto_cdf_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_range_sum_tendsto_leftLim_ae_of_hasLaw_infinitePi`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_inv_mul_range_sum_tendsto_leftLim_ae_of_hasLaw_infinitePi`.
These consume `HasLaw (fun omega => fun i => X i omega) (P^N) mu` via the
compiled Chapter 2.1.11 product-law extraction.  Next work should not rebuild
these pointwise product-law consumers; move to another genuine Chapter
2.1/2.4.9 source wrapper or a missing theorem-sized consumer.

V385 consumes the shifted infinite-product law bridge
in the pointwise Theorem 2.4.9 proof steps:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_shift_hasLaw_infinitePi`
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_shift_hasLaw_infinitePi`.
These give the almost-sure convergence of the one-based empirical CDF and
left empirical CDF displays directly from a joint law for
`fun i => X (i + 1)`.  Next work should not rebuild these pointwise shifted
joint-law displays; move to another genuine Chapter 2.1/2.4.9 source wrapper
or a missing theorem-sized consumer.

V384 consumes the V382 shifted infinite-product law
bridge in the one-based Durrett 2.4.9 endpoints.  The new wrappers
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_shift_hasLaw_infinitePi_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_shift_hasLaw_infinitePi_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_shift_hasLaw_infinitePi_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_shift_hasLaw_infinitePi_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_shift_hasLaw_infinitePi_oneBased`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_shift_hasLaw_infinitePi_oneBased`
take a joint law directly for `fun i => X (i + 1)` and feed the compiled
2.4.9 GC/outer empirical-CDF route.  Next work should not rebuild these
shifted-joint-law endpoints; move to another genuine Chapter 2.1/2.4.9
source display or a missing theorem-sized consumer.

V383 adds the Theorem 2.1.10/2.1.13 mixed-term bridge
used by the Kolmogorov maximal inequality proof:
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockFunction_integral_eq_zero`,
`durrett2019_theorem_2_1_13_partialSumDiff_integral_eq_zero_of_integral_Ico_eq_zero`,
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockFunction_integral_eq_zero_of_integral_Ico_eq_zero`,
and
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockIndicatorSum_integral_eq_zero`.
These package the textbook move that a centered future increment `S_n - S_m`
is orthogonal in expectation to measurable functions of the early block.
Next work should either consume this bridge in a real later source theorem
when entering the Kolmogorov maximal-inequality lane, or return to the active
2.4.9/Chapter 2.1 source-facing frontier; do not reprove this mixed-term
factorization.

V382 adds the one-based Durrett indexing bridge for
Theorem 2.1.11 infinite product laws:
`durrett2019_theorem_2_1_11_iid_shift_sequence_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iid_shift_iff_hasLaw_infinitePi`, and
`durrett2019_theorem_2_1_11_iid_shift_hasLaw_infinitePi_of_identDistrib`.
The shifted process `X (i + 1)` now has direct extraction, criterion, and
standard `X_0` identical-distribution source packaging for joint law `ν^ℕ`.
Next work should either consume these shifted product-law wrappers in genuine
source-display endpoints, or move forward to Chapter 2.1.12/2.1.13
product-expectation support; do not rebuild this one-based product-law bridge.

V381 routes the pairwise-identically-distributed
empirical-CDF outer-a.s. source entrances through the V379 textbook
middle/tail proof.  The zero-based and one-based
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_*_of_pairwise_identDistrib`
wrappers, including range-sum and inverse-multiply display forms, now consume
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation`
after extracting the common law and pairwise independence.  Next work should
move to a new Durrett source-display wrapper or Chapter 2.1 product-law
support; do not reroute these pairwise empirical-CDF endpoints again.

V380 rewires the main source-facing iid and canonical
empirical-CDF outer-a.s. endpoints to consume the V379 textbook middle/tail
route directly.  In particular,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun`,
its range-sum and inverse-multiply displays, the corresponding one-based
`iIndepFun` displays, and the zero-/one-based canonical iid empirical-CDF
outer-a.s. endpoints now route through
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation`
or the exact one-based V379 display theorem.  Next work should move to a
new source-entrance wrapper in Chapter 2.1/2.4.9 or a genuinely missing
Durrett display form, not rewire the same endpoints again.

V379 closes the countable supplied-partition gap for
the V377/V378 textbook middle/tail route:
`durrett2019_theorem_2_4_9_exists_middlePartitionWithTails`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_outerAlmostSureUniformDeviation_of_iIndepFun`.
It uses `exists_real_tails_lt_of_isFiniteMeasure` for finite lower/upper
tails, widens the tail cutpoints to a strict bounded middle interval, builds
the arbitrary-law middle partition from
`durrett2019_theorem_2_4_9_cutpointChain`, and feeds the canonical
`1 / (scale + 1)` countable sequence into V378.  Next work should either make
the existing empirical-CDF source endpoints reuse this textbook middle/tail
route where useful, or move to the next missing Chapter 2.1/2.4.9
source-entrance wrapper.  Do not rebuild tail tightness, cutpoint chains,
fixed-tolerance squeezing, or the countable-scale handoff.

V378 packages the V377 global middle-partition-with-tails
squeeze into the countable-scale uniform-deviation interface:
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_of_iIndepFun`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_almostSureUniformDeviation_of_tendsto_partitions`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation_of_tendsto_partitions`.
This avoids the false uncountable-intersection route: V377 gives a separate
a.e. event at each fixed tolerance, while V378 first normalizes the
`2 * (tolerance / 2)` bound and then intersects only a countable sequence of
supplied middle/tail partitions whose widths tend to zero.  Next work should
not reprove this countable-scale handoff; V379 supplies the arbitrary-law
partition data and attaches it to this outer-a.s. endpoint.

V377 adds the global middle-partition-with-tails squeeze that consumes V376
and the lower/upper tail cells:
`empiricalDistributionFunction_nonneg`,
`empiricalDistributionFunction_le_one`,
`empiricalLeftDistributionFunction_nonneg`,
`empiricalLeftDistributionFunction_le_one`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt_two_mul`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_two_mul_of_iIndepFun`.
This formalizes the final textbook tail lift around a bounded middle
partition: for `c < a`, use `F_n(c) <= F_n(a-)`; for `b <= c`, use
`F_n(b) <= F_n(c)` and `1 - F(b) = P((b, infinity))`; on `[a,b)` reuse V376.
V378 now packages this fixed-tolerance result into the countable-scale
outer-a.s. uniform-deviation route, so do not restate tail inequalities,
endpoint convergence, or the tolerance normalization.

V376 adds the middle-partition monotonicity squeeze that
consumes V375's finite-cutpoint burn-in:
`durrett2019_theorem_2_4_9_middlePartition_uniform_error_lt_of_cutpoint_errors`,
`durrett2019_theorem_2_4_9_middlePartition_eventually_uniform_error_lt_two_mul`,
and
`durrett2019_theorem_2_4_9_middlePartition_oneBased_inv_mul_uniform_error_lt_two_mul_of_iIndepFun`.
This formalizes Durrett's displayed inequalities on each cell: closed-endpoint
and strict-left endpoint errors plus a small CDF left-limit increment imply
`|F_n(c) - F(c)| < 2 * epsilon` uniformly over the bounded middle partition.
Next work should lift this bounded middle-partition squeeze through the
already compiled tail/endpoint-grid wrappers, not restate endpoint convergence
or the deterministic bracket monotonicity.

V375 adds the finite-cutpoint simultaneous closed and
strict-left error bridge used in Durrett Theorem 2.4.9's proof after pointwise
convergence has been established:
`durrett2019_theorem_2_4_9_finite_cutpoints_eventually_closed_left_errors_lt`
and
`durrett2019_theorem_2_4_9_finite_cutpoints_oneBased_inv_mul_closed_left_errors_lt_of_iIndepFun`.
This packages the textbook choice of a random burn-in `N_k(omega)` so that
both `F_n(x_j) - F(x_j)` and `F_n(x_j-) - F(x_j-)` are small for all finitely
many cutpoints at once.  Next work should use this bridge in the uniform
grid/telescoping squeeze, not restate the pointwise strong laws.

V374 adds the closed-endpoint pointwise empirical-CDF proof-step counterpart to
V373 in `StatInference/ProbabilityTheory/Basic.lean`:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_range_sum_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_inv_mul_range_sum_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_canonical_iid`.
These package the textbook line `Y_n = 1{X_n <= x}` and
`F_n(x) -> F(x)` under the same exact-textbook and source-entrance shapes as
the strict-left layer.  V373 adds exact-textbook `n^{-1} * sum` strict-left
empirical-CDF source entrances in `StatInference/ProbabilityTheory/Basic.lean`:
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_inv_mul_range_sum_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_canonical_iid`.
These let the `F_n(x-)` proof step consume the same full-joint-law,
identDistrib, pairwise-identDistrib, and canonical iid source shapes already
available for the full Theorem 2.4.9 statement.  V372 adds the strict-left
empirical-CDF support used in
Durrett's Theorem 2.4.9 proof: reusable open-half-line CDF-left-limit bridges
in `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
(`realOpenHalfLineIndicator_integral_eq_cdf_leftLim`,
`empiricalLeftDistributionFunction`,
`empiricalLeftDistributionFunction_samplePath_eq_range_sum`,
`realOpenHalfLine_empiricalAverage_sub_cdfLeftLim_tendsto_zero_ae_of_iid`,
`realOpenHalfLine_empiricalAverage_sub_cdfLeftLim_tendstoInMeasure_zero_of_iid`,
and
`realOpenHalfLine_empiricalAverage_sub_cdfLeftLim_convergesInOuterProbability_of_iid`)
plus Durrett wrappers in `StatInference/ProbabilityTheory/Basic.lean`
(`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_range_sum_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae_of_iIndepFun`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_range_sum_tendsto_leftLim_ae_of_iIndepFun`).
These package the textbook line `Z_n = 1{X_n < x}` and
`F_n(x-) -> F(x-)` before the uniform cutpoint argument.  V371 adds one-based
Theorem 2.4.9 consumers for the
other already-compiled source entrances: full infinite-product joint law
(`*_of_hasLaw_infinitePi_oneBased`), identically distributed coordinates plus
`iIndepFun` (`*_of_iIndepFun_identDistrib_oneBased`), and pairwise-identically
distributed coordinates (`*_of_pairwise_identDistrib_oneBased`), including the
shared source extractor
`durrett2019_theorem_2_4_9_pairwise_identDistrib_oneBased_source`.  These
wrappers cover the six half-line GC / outer-a.s. GC / empirical-CDF /
range-sum / inverse-multiply range-sum endpoints for Durrett's one-based
`X_1, X_2, ...` and `n^{-1} sum_{m=1}^n` displays without asking the next
cycle to restate source extraction.  V370 adds arbitrary-source one-based iid
support and
Theorem 2.4.9 Glivenko-Cantelli wrappers matching Durrett's
`X_1, X_2, ...` and `n^{-1} sum_{m=1}^n` notation without forcing the
canonical product-space specialization:
`durrett2019_theorem_2_1_11_iid_shift_oneBased_of_iIndepFun`,
`durrett2019_theorem_2_1_11_iid_shift_hasLaw_infinitePi_of_iIndepFun`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun_oneBased`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun_oneBased`.
V369 adds one-based canonical iid product-space wrappers
matching Durrett's `X_1, X_2, ...` and `sum_{m=1}^n` notation:
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_coordinates_oneBased`,
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_pairwise_indepFun_oneBased`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased_range_sum`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased_inv_mul_range_sum`.
V368 adds the canonical iid infinite-product
pairwise-independence consumer
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_pairwise_indepFun`
and the canonical iid half-line Glivenko-Cantelli wrappers
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_canonical_iid` and
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_canonical_iid`.
The existing canonical empirical-CDF endpoints now reuse those wrappers instead
of rebuilding pairwise independence inline.  V367 adds literal normalized-sum projected
characteristic-function wrappers for vector-source and common-vector-law
centered-product routes:
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredProduct_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct_explicitMean_sum`.
These let Theorem 3.10.7 characteristic-function routes consume
`(S_n - n * mu) / sqrt n` directly before canonical-product specialization.
V366 adds Durrett centered-product normalized-sum CLT
wrappers for vector-source and common-vector-law assumptions:
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCenteredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct_sum`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCenteredProduct_sum`.
These let source assumptions stated as
`E[(X_i - mu_i)(X_j - mu_j)] = Gamma_ij` consume the literal
`(S_n - n * mu) / sqrt n` vector CLT endpoint before specializing to canonical
product samples.  V365 lifts the textbook normalized-sum display from
canonical product samples to arbitrary finite-coordinate source spaces:
`durrett2019_theorem_3_10_7_finiteCoordinate_explicitMean_normalization_eq_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`.
These expose `(S_n - n * mu) / sqrt n` directly for vector-source and
common-vector-law Theorem 3.10.7 routes before specializing to the canonical
product sample.  V364 adds the zero-mean coordinate-covariance literal
normalized-sum source wrappers
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`.
These let canonical product samples stated with coordinate covariance and
centered source sums use either the vector CLT endpoint, arbitrary-frequency
projected characteristic functions, or the textbook `t^2` exponent directly.
V363 adds the literal centered normalized-sum
arbitrary-frequency characteristic-function display
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct_sum`.
This removes the forced `t^2` display from the centered source form
`S_n / sqrt n` at the characteristic-function level.  V362 adds canonical
product-sample coordinate-covariance
and centered-product arbitrary-frequency displays:
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`.
These remove the forced `t^2` display from the canonical coordinate-covariance,
centered-product, and literal normalized-sum characteristic-function source
forms.  V361 adds canonical product-sample covariance-table and
arbitrary-frequency centered-product bridges:
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct`.
These let canonical infinite-product sample source assumptions consume the
V360 common-vector-law routes directly.  V360 adds common-vector-law
covariance-table and
arbitrary-frequency centered-product bridges:
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct`.
These let common-law source assumptions consume the V359/V358
covariance-bilinear table and arbitrary-frequency centered-product routes
directly.  V359 adds vector-Gaussian-source covariance-table and
arbitrary-frequency centered-product bridges:
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct`.
These let the source-facing vector Gaussian assumptions consume either
covariance-bilinear coordinate tables or centered-product Gaussian identities
without manually routing through the projected-summand layer.  V358 adds the
projected-summand-CLT bridge variants
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedSummandCLT_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct`.
These let summand-level Cramér-Wold CLTs feed covariance-bilinear table and
centered-product Gaussian source variants before or after the textbook `t^2`
rewrite.  V357 adds the projected-scalar-CLT bridge variants
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct`.
These let scalar Cramér-Wold CLTs feed covariance-bilinear table and
centered-product Gaussian source variants before or after the textbook `t^2`
rewrite.  V356 adds the projected-characteristic-function CLT
consumers
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct`.
These let covariance-bilinear Gaussian source tables and centered-product
Gaussian source identities feed the Durrett Theorem 3.10.7 vector CLT
consumer directly.  V355 adds the centered covariance-table ordinary
characteristic-function wrappers
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
plus the arbitrary-frequency centered-product wrapper
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_centeredProduct`.
These close the centered Gaussian source variants parallel to the V354
nonzero-mean route.  V354 adds the covariance-table and arbitrary-frequency
centered-product variants of the nonzero-mean Gaussian projected scalar
ordinary characteristic-function route:
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_centeredProductSubMean`.
These let later source statements use either `covarianceBilinDual` coordinate
tables or the textbook centered-product covariance definition before choosing
the arbitrary-frequency or textbook `t^2` display.  V353 adds the nonzero-mean
Gaussian projected scalar
ordinary characteristic-function wrappers
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_coordinateCovariance`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_centeredProductSubMean`.
These package Durrett's arbitrary-frequency Gaussian projection display with
the linear mean phase and the textbook `t^2` covariance exponent, including the
source covariance definition
`Gamma_ij = E[(chi_i - mean_i)(chi_j - mean_j)]`.  V352 adds the literal
nonzero-mean normalized-sum
characteristic-function wrappers
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`.
These package Durrett's displayed `(S_n - n * mu) / sqrt n` at the
characteristic-function level, including the source covariance definition
`Gamma_ij = E[(X_i - mu_i)(X_j - mu_j)]`.  V351 adds the literal centered
normalized-sum
characteristic-function wrapper
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_sum`.
This rewrites the V350 projected characteristic-function endpoint into the
textbook centered display `S_n / sqrt n` using the compiled canonical-product
normalization algebra.  V350 adds the canonical product-sample coordinate
covariance and centered-product characteristic-function wrappers
`durrett2019_theorem_3_10_7_centeredProduct_eq_of_coordinateCovariance`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct`.
These close the scalar covariance-table source gap feeding the V349 all-dual
canonical product route, using the compiled finite-coordinate covariance-table
handoff and canonical sample covariance equality.  V349 adds the canonical
product-sample source wrappers
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct_tsq`.
These use the local canonical product-law support
`vaart1998_finiteCoordinateCanonicalSample_coordinateSource` and
`vaart1998_finiteCoordinateCanonicalSampleVector_commonVectorLawSource` to feed
the V348 common-vector-law route without rebuilding product/iid primitives.
V348 adds the common-vector-law source wrappers
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct_tsq`.
These use the common finite-coordinate vector law and infinite product law to
discharge the i.i.d. sample-vector hypotheses before feeding the V346 textbook
`t^2` characteristic-function route.  V347 adds the vector-Gaussian-source wrappers
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct_tsq`.
These package Vaart/mathlib one-dimensional CLT source hypotheses through the
V346 summand bridge, yielding the textbook `t^2` projected
characteristic-function convergence and vector CLT endpoint with centered
Gaussian product identities.  V346 adds the projected-summand-CLT wrappers
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct_tsq`.
These move one source layer lower than V345: summand-level scalar CLTs now
discharge the textbook `t^2` characteristic-function hypothesis and the vector
CLT endpoint with centered Gaussian product identities.  V345 adds the
projected-scalar-CLT to
characteristic-function bridge
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT`,
its textbook `t^2` centered-product Gaussian endpoint
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredProduct`,
and the direct vector CLT consumer
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct_tsq`.
This connects the scalar Cramér-Wold CLT route to the characteristic-function
route, so projected scalar CLTs now discharge the V344 projected empirical
characteristic-function hypothesis.  V344 adds the centered-product source
wrappers
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct_tsq`.
These let the Gaussian limit side be supplied by Durrett's literal centered
product identities `E[Z_i Z_j] = Gamma_ij`, while the projected empirical
characteristic-function hypothesis uses the textbook `t^2` exponent.  V343
adds the finite covariance-table homogeneity
wrappers
`durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul` and
`durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul_complex`, the
textbook `t^2` centered Gaussian projected characteristic-function display
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
and the Durrett Theorem 3.10.7 source endpoint
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance_tsq`.
This lets the projected empirical characteristic-function hypothesis be stated
as `exp(-(t^2 * theta Gamma theta^T) / 2)`, closer to the textbook display,
while reusing V342's covariance-table endpoint.  V342 adds the
arbitrary-frequency centered Gaussian projection display
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_coordinateCovariance`
and the Durrett Theorem 3.10.7 source endpoint
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance`.
This consumes convergence of every projected empirical characteristic function
to the textbook centered Gaussian quadratic exponential and returns the vector
CLT, reusing the V341 projected-characteristic consumer.  V341 adds the
Durrett Theorem 3.10.7 multivariate CLT
consumer
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions`.
This packages pointwise characteristic-function convergence of every textbook
projection of the scaled centered empirical vector into the vector CLT,
reusing the V340 fixed-source Cramér-Wold characteristic-function wrapper.
V340 lifts Durrett Theorem 3.10.6 Cramér-Wold
characteristic-function transport to random-vector/source form:
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution_of_projected_charFun`,
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_of_charFun`,
and
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure_of_charFun`.
These package pointwise characteristic-function convergence of all projected
random variables into vector convergence in distribution, including Durrett's
textbook `theta · X_n` notation and the fixed-source probability-space case.
V339 adds Durrett Theorem 3.10.6 Cramér-Wold
characteristic-function transport wrappers:
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto_of_projected_charFun`
and
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto_of_charFun`.
These package pointwise characteristic-function convergence of every
one-dimensional projection into vector-law weak convergence, both in
continuous-linear-functional form and Durrett's textbook `theta · x` notation.
V338 adds Durrett Theorem 3.10.6 Cramér-Wold in the
law-level textbook `theta · x` form:
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto`.
This packages the source-facing finite-coordinate weak-convergence condition
directly over all coefficient vectors `theta : Coordinate -> R`, reusing the
compiled continuous-linear-functional law-level wrapper.  V337 adds Durrett
Theorem 3.10.6 Cramér-Wold in the
textbook `theta · X_n` form for a fixed source probability space:
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure`.
This packages the common random-variable case where all `X_n` live on the same
probability space `P`.  V336 adds Durrett Theorem 3.10.6 Cramér-Wold in the
textbook `theta · X_n` random-vector convergence-in-distribution form:
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution`.
This packages projection convergence over `theta : Coordinate -> R` into vector
convergence, reusing V335's continuous-linear-functional version.  V335 adds
Durrett Theorem 3.10.6 Cramér-Wold in
random-vector convergence-in-distribution form:
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution`.
It upgrades the previous law-level wrapper to the source-facing statement that
projection convergence in distribution for every continuous linear functional
implies vector convergence in distribution.  V334 adds the standalone centered
reverse direction for
Durrett Exercise 3.10.8:
`durrett2019_exercise_3_10_8_multivariateGaussian_of_centeredLinearCombination_law_eq_gaussianReal`.
This packages the implication from centered real Gaussian laws of all finite
linear combinations to multivariate Gaussianity.  V333 adds Durrett Exercise
3.10.8 centered
linear-combination Gaussian-law wrappers from the covariance table of the
Gaussian law:
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`.
V332 adds Durrett Exercise 3.10.8 centered
linear-combination Gaussian-law source wrappers:
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`,
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`.
These package the source display where every linear combination has centered
real Gaussian law with variance `theta Gamma theta^t`.  V331 adds Durrett
Theorem 3.10.7 literal centered
normalized-sum canonical product endpoint:
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_sum`.
This packages the centered textbook display `S_n / sqrt n => chi` from the
compiled nonzero-mean normalized-sum endpoint.  V330 adds Durrett Theorem
3.10.7 centered literal
expectation forms of the Gaussian theta characteristic-function display:
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_centeredProduct`.
V329 adds Durrett Theorem 3.10.7 literal expectation
forms of the nonzero-mean Gaussian theta characteristic-function display:
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_centeredProductSubMean`.
V328 adds Durrett Theorem 3.10.7 nonzero-mean Gaussian
theta characteristic-function displays from covariance-table, scalar
coordinate covariance, and centered-product covariance hypotheses:
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_centeredProductSubMean`.
V327 adds Exercise 3.10.8 source-facing finite
linear-combination characterization `iff` wrappers from scalar coordinate
covariance and centered-product covariance hypotheses:
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`.
V326 adds Section 3.10 Gaussian-coordinate independence
source wrappers from scalar covariance tables and centered-product covariance
tables:
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_coordinateCovarianceTable`,
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_coordinateCovarianceTable`,
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_centeredProductSubMean`,
and
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_centeredProductSubMean`.
V325 adds Exercise 3.10.8 forward real-Gaussian law
source wrappers from scalar coordinate covariance and centered product around a
mean vector:
`durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
and
`durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`.
V324 adds the nonzero-mean covariance-definition
source bridge and literal normalized-sum CLT endpoint:
`durrett2019_theorem_3_10_7_coordinateCovariance_eq_of_centeredProductSubMean`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`.
This packages the textbook hypothesis
`Gamma_ij = E[(X_i - mu_i) (X_j - mu_j)]`.  V323 adds the Durrett Theorem
3.10.7 Gaussian
characteristic-function display from scalar coordinate covariance and centered
product source hypotheses:
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_coordinateCovariance`
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_centeredProduct`.
V322 adds the literal Durrett Theorem 3.10.7 normalized sum endpoint
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
plus the algebra bridge
`durrett2019_theorem_3_10_7_canonicalProduct_explicitMean_normalization_eq_sum`.
V321 adds the Durrett Theorem 3.10.7 explicit-mean canonical i.i.d. product
endpoint
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean`,
which rewrites the reusable population-moment centering into the textbook
mean vector `mu`.  V320 adds the positive-variance Lindeberg-Feller source
endpoints
`durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`
and
`durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`,
including the literal Durrett display `S_n => sigma * chi` for standard
normal `chi`.  V319 adds the literal Durrett `mu, sigma` i.i.d. CLT display
`durrett2019_theorem_3_4_1_centralLimitTheorem_muSigmaSqrt`, proving
`(S_n - n * mu) / (sigma * sqrt n) => N(0,1)` when
`E X_0 = mu`, `Var X_0 = sigma^2`, and `sigma > 0`.  V318 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_sigmaSqrt`, the `E X_0`
denominator display.  V317 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_standardNormal`, the
`sqrt(n Var X_0)` display.  V316 adds the standard-normal Lindeberg-Feller
endpoint
`durrett2019_theorem_3_4_10_lindebergFeller_unitVariance_of_integrableSq`.

Do not re-prove the compiled Chapter 2.1 product/iid wrappers, Theorem 2.4.9
empirical-CDF wrappers, Theorem 2.2 weak-law layer-cake support, Chapter 3.2
weak-convergence wrappers, Theorem 3.3.17 Lévy continuity wrappers, Exercise
3.1.1 product theorem, or the existing Theorem 3.4.10 Lindeberg-Feller
analytic certificate stack, or the V320 positive-variance `sigma * chi`
Lindeberg-Feller endpoint, or the V321 explicit-mean canonical multivariate CLT
endpoint, the V322 literal normalized-sum multivariate CLT endpoint, or the
V323 scalar-covariance/centered-product Gaussian characteristic-function
display, or the V324 nonzero-mean covariance-definition normalized-sum CLT
endpoint, or the V325 Exercise 3.10.8 scalar-covariance/centered-product real
Gaussian law wrappers, or the V326 Gaussian-coordinate independence
covariance-table/centered-product wrappers, or the V327 Exercise 3.10.8
source-facing `iff` wrappers, or the V328 nonzero-mean Gaussian theta
characteristic-function displays, or the V329 literal expectation-form
characteristic displays, or the V330 centered literal expectation-form
characteristic displays, or the V331 centered normalized-sum canonical product
endpoint, or the V332 centered Exercise 3.10.8 linear-combination law/`iff`
wrappers, or the V333 covariance-table centered Exercise 3.10.8
linear-combination law/`iff` wrappers, or the V334 standalone centered reverse
Exercise 3.10.8 implication, or the V335 random-vector Cramér-Wold wrapper, or
the V336 textbook theta-form Cramér-Wold wrapper, or the V337 fixed-source
probability theta-form Cramér-Wold wrapper, or the V338 law-level theta-form
Cramér-Wold wrapper, or the V339 Cramér-Wold projected characteristic-function
transport wrappers, or the V340 random-vector/source projected
characteristic-function transport wrappers, or the V341 projected
characteristic-function multivariate CLT consumer, or the V342 centered
Gaussian projected-characteristic CLT consumer, or the V343 textbook `t^2`
Gaussian exponent wrappers, or the V344 centered-product `t^2` source
wrappers, or the V345 projected-scalar-CLT to characteristic-function bridge,
or the V346 projected-summand-CLT to characteristic-function bridge, or the
V347 vector-Gaussian-source characteristic-function bridge, the V348
common-vector-law characteristic-function bridge, the V349 canonical-product
characteristic-function bridge, the V350 canonical coordinate-covariance and
centered-product characteristic-function bridge, or the V351 centered
normalized-sum characteristic-function bridge, or the V352 nonzero-mean
normalized-sum characteristic-function bridge, the V353 nonzero-mean
Gaussian ordinary characteristic-function bridge, the V354 covariance-table
Gaussian ordinary characteristic-function bridge, the V355 centered
Gaussian ordinary characteristic-function bridge, the V356 covariance-table
projected-characteristic CLT consumers, the V357 projected-scalar-CLT source
bridges, the V358 projected-summand-CLT source bridges, or the V359
vector-Gaussian-source covariance-table/centered-product bridges, or the V360
common-vector-law covariance-table/centered-product bridges, or the V361
canonical product-sample covariance-table/centered-product bridges, or the
V362 canonical coordinate-covariance/centered-product arbitrary-frequency
displays, or the V363 literal centered normalized-sum arbitrary-frequency
display, or the V364 zero-mean coordinate-covariance literal normalized-sum
wrappers, or the V365 vector/common-law explicit-mean normalized-sum CLT
wrappers, or the V366 vector/common-law centered-product normalized-sum CLT
wrappers, the V367 vector/common-law centered-product normalized-sum
projected-characteristic wrappers, or the V368 canonical iid product-space
half-line Glivenko-Cantelli wrappers, the V369 one-based canonical iid
product-space Glivenko-Cantelli wrappers, or the V370 arbitrary-source
one-based iid / empirical-CDF wrappers, the V371 one-based full-joint-law,
identDistrib+iIndepFun, and pairwise-identDistrib source wrappers, the V372
strict-left empirical-CDF pointwise SLLN wrappers, the V373 exact-textbook
strict-left source-entrance wrappers, or the V374 closed-endpoint pointwise
empirical-CDF source wrappers, or the V375 finite-cutpoint simultaneous
closed/strict-left error bridge, or the V376 middle-partition uniform squeeze
from cutpoint errors, or the V377 global middle-partition-with-tails squeeze.
Next
aggressive packet:
continue Chapter 2.1 / Theorem 2.4.9 only by packaging the V377 pathwise global
squeeze into the exact outer-a.s./uniform-deviation endpoint-grid statement, or
by adding an exact source-facing wrapper that directly feeds that packaging.
Do not rebuild the compiled pointwise, strict-left, product-law, cutpoint-chain,
finite-cutpoint, deterministic monotonicity, or tail-squeeze support.

## Historical V306 Prompt Notes

Use only this compact prompt as the live Durrett `/goal` whenever the app-level
goal text is older than the verified route docs.  The detailed route notes
below are provenance, not prompt text.

Continue Durrett 2019 Probability Theory formalization in Lean from latest
synced `main`.  Active lane: Durrett Section 4.7 backwards martingales in
`StatInference/ProbabilityTheory/BackwardMartingale.lean`, reusing
`StatInference.EmpiricalProcess.Theorem243`'s compiled `ℕᵒᵈ` order-dual
submartingale convergence primitive, the Chapter 4.1 conditional-expectation
wrappers, and the Section 4.6 uniform-integrability/Vitali endpoints.  Do not
re-prove the V282 order-dual a.s. convergence bridge, terminal
conditional-expectation representation, backwards-martingale UI bridge, the
V283 `L¹`/set-integral conditional-expectation identification bridge, the V284
`limsup` tail-measurability and source-shaped Theorem 4.7.2 endpoint, the V285
backwards Lévy Theorem 4.7.3 a.s./`L¹` dual-filtration and natural decreasing
filtration display endpoints, the V286 Example 4.7.4 tail-constant/source
handoff and direct strong-law wrapper, the V287 tail-independence-to-constant
handoff, the V288 reverse-tail zero-one-to-constant handoff, the V289
independent tail-block zero-one handoff, the V290 prefix-average
conditional-expectation algebra core, the V291 concrete reverse-average
sigma-field scaffold, the V292 decreasing-family and concrete conditional
average consumer, the V293 exchangeability-transport-to-conditional-symmetry
handoff, the V294 reverse-average generator/prefix-tail invariance bridge, or
the V295 iid-product coordinate-swap conditional-average layer, or the
V296 product integrability/source-moment strong-law endpoint, or the
V297 eventual-prefix backwards-route product endpoint, or the
V298 reverse-average-to-permutation-symmetric-tail bridge, or the
V299 permutation-symmetric tail zero-one transport endpoint, or the
V300 permutation-symmetric tail finite-permutation invariance support, the
V301 self-independence-to-zero-one consumer bridges, the V302 finite-prefix /
future-coordinate-tail independence support, the V303 transported-prefix
Hewitt-Savage support, the V304 prefix-limit self-independence bridge, the V305
prefix symmetric-difference approximation-to-limit bridge, the V306 finite
prefix event ring/generation/symmetric-difference approximation basis, or the
V281-V273 Section 4.6 tail-envelope /
conditional-expectation layers.

Latest verified target V306 advances Section 4.7.  V260 packages Durrett
Theorem 4.6.1 as `durrett2019_theorem_4_6_1_uniformIntegrable_condExp` and
`durrett2019_theorem_4_6_1_uniformIntegrable_condExp_filtration`, and adds the
dominated-family/tail-criterion constructors for Theorem 4.6.2.  V261-V262
close the deterministic tail-envelope, scalar modulus, and clean uniform-`Lᵖ`,
`p > 1`, endpoint
`durrett2019_theorem_4_6_2_uniformIntegrable_one_of_eLpNorm_bdd`.  V263 wraps
Mathlib's Vitali theorem in Durrett `L¹` form via
`durrett2019_theorem_4_6_3_tendstoInMeasure_and_unifIntegrable_iff_eLpNorm_one`,
the forward `UniformIntegrable` wrapper, and the `L¹` convergence to
convergence-in-probability / `UnifIntegrable` consumers.  V264 adds the
expectation-convergence component `(iii)`:
`durrett2019_theorem_4_6_3_tendsto_integral_abs_of_eLpNorm_one_tendsto_zero`
and
`durrett2019_theorem_4_6_3_tendsto_integral_abs_of_tendstoInMeasure_uniformIntegrable`.
V265 starts Theorem 4.6.4 with
`durrett2019_theorem_4_6_4_submartingale_ae_tendsto_and_eLpNorm_one_tendsto_of_uniformIntegrable`,
the source `(i) -> (ii)` implication for uniformly integrable submartingales,
plus
`durrett2019_theorem_4_6_4_submartingale_unifIntegrable_of_eLpNorm_one_tendsto_zero`,
the reverse `(iii) -> (i)` bridge in Mathlib's measure-theoretic
`UnifIntegrable` form.  V266 upgrades the reverse implication to full
probability-theory uniform integrability with
`durrett2019_theorem_4_6_4_uniformIntegrable_of_eLpNorm_one_tendsto_zero` and
`durrett2019_theorem_4_6_4_submartingale_uniformIntegrable_of_eLpNorm_one_tendsto_zero`.
V267 adds Lemma 4.6.5 as the thin Mathlib set-integral continuity wrapper
`durrett2019_lemma_4_6_5_tendsto_setIntegral_of_eLpNorm_one_tendsto_zero`.
V268 adds Lemma 4.6.6 and Theorem 4.6.7 route wrappers:
`durrett2019_lemma_4_6_6_martingale_ae_eq_condExp_of_eLpNorm_one_tendsto_zero`,
`durrett2019_theorem_4_6_7_martingale_ae_tendsto_and_eLpNorm_one_tendsto_of_uniformIntegrable`,
`durrett2019_theorem_4_6_7_exists_integrable_condExp_of_eLpNorm_one_tendsto_zero`,
and `durrett2019_theorem_4_6_7_uniformIntegrable_of_condExp_representation`.
V269 adds the compact Theorem 4.6.7 display wrappers
`durrett2019_theorem_4_6_7_uniformIntegrable_iff_exists_integrable_eLpNorm_one_tendsto_zero`
and
`durrett2019_theorem_4_6_7_uniformIntegrable_iff_exists_integrable_condExp`.
V270 packages Mathlib's Lévy upward theorem as Durrett Theorem 4.6.8:
`durrett2019_theorem_4_6_8_condExp_ae_tendsto_of_iSup_stronglyMeasurable`,
`durrett2019_theorem_4_6_8_condExp_eLpNorm_one_tendsto_of_iSup_stronglyMeasurable`,
`durrett2019_theorem_4_6_8_condExp_ae_tendsto_iSup_condExp`, and
`durrett2019_theorem_4_6_8_condExp_eLpNorm_one_tendsto_iSup_condExp`.
It also adds the immediate Theorem 4.6.9 consequence
`durrett2019_theorem_4_6_9_levy_zero_one_condExp_indicator_ae_tendsto`.
V271 starts Theorem 4.6.10 with the final Jensen/triangle bridge
`durrett2019_theorem_4_6_10_condExp_tendsto_of_abs_error_condExp_tendsto_zero`:
once the textbook source estimate
`E(|Y_n - Y| | ℱ_n) -> 0` a.s. is available, the varying conditional
expectations converge a.s. to `E(Y | ⨆ n, ℱ n)`.
V272 adds the tail-envelope source-estimate bridge
`durrett2019_theorem_4_6_10_abs_error_condExp_tendsto_zero_of_tail_condExp_bounds`:
if the conditional absolute errors are eventually bounded by each fixed tail
envelope, fixed tail envelopes converge along the filtration, and their
limiting conditional expectations tend to zero, then
`E(|Y_n - Y| | ℱ_n) -> 0` a.s.
V273 discharges the fixed-tail upward convergence automatically via Theorem
4.6.8 and adds
`durrett2019_theorem_4_6_10_abs_error_condExp_tendsto_zero_of_tail_bounds`
plus the theorem-shaped final bridge
`durrett2019_theorem_4_6_10_condExp_tendsto_of_tail_bounds`.
V274 lifts the textbook's eventual pointwise envelope estimate into the
conditional-bound interface and discharges envelope integrability from
domination by one integrable random variable:
`durrett2019_theorem_4_6_10_error_condExp_le_tail_of_eventual_ae_bound`,
`durrett2019_theorem_4_6_10_abs_error_condExp_tendsto_zero_of_eventual_ae_tail_bound`,
`durrett2019_theorem_4_6_10_condExp_tendsto_of_eventual_ae_tail_bound`, and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_eventual_ae_tail_bound_of_integrable_dominated`.
V275 discharges the limiting conditional tail-zero side when the envelopes are
measurable in the limiting sigma-field and tend to zero a.s.:
`durrett2019_theorem_4_6_10_tail_condExp_tendsto_zero_of_iSup_stronglyMeasurable`
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_iSup_tail_ae_tendsto_zero`.
V276 proves the limit-passage from pairwise tail envelopes to the pointwise
limit-error envelope:
`durrett2019_theorem_4_6_10_eventual_ae_tail_bound_of_pairwise_tail_bound`
and the final pairwise-tail consumer
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwise_iSup_tail_ae_tendsto_zero`.
V277 introduces the concrete `sSup` tail envelope
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope`, proves its pairwise-bound
property under boundedness, adds the a.e. boundedness version
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_pairwise_bound_ae`, derives
boundedness from a supplied pairwise upper bound via
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_bddAbove_of_pairwise_bound`,
and adds final consumers
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope`,
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_ae_bdd`,
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_pairwise_bound`.
V278 discharges the textbook `2Z` domination layer for the concrete `sSup`
envelope.  It adds
`durrett2019_theorem_4_6_10_pairwise_bound_two_mul_of_norm_le`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_le_two_mul_of_norm_le`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_nonneg`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_norm_le_two_mul_of_norm_le`,
and the final dominated wrapper
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_norm_dominated`.
V279 discharges the source tail-zero layer for the concrete envelope.  It adds
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_tendsto_zero_of_tendsto`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_ae_tendsto_zero_of_ae_tendsto`,
and the final dominated/a.s.-convergence wrapper
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_norm_dominated_of_ae_tendsto`.
V280 discharges limiting-sigma-field measurability of the concrete `sSup`
envelope and packages the adapted final Theorem 4.6.10 endpoint.  It adds
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_stronglyMeasurable`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_stronglyMeasurable_of_stronglyAdapted`,
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_norm_dominated_of_iSup_stronglyMeasurable_ae_tendsto`,
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_stronglyAdapted_dominated_ae_tendsto`.
V281 adds Exercise 4.6.7, the `L¹` conditional-expectation convergence
wrapper, via
`durrett2019_exercise_4_6_7_condExp_diff_eLpNorm_one_le` and
`durrett2019_exercise_4_6_7_condExp_eLpNorm_one_tendsto_iSup_of_eLpNorm_one_tendsto`.
V282 adds `StatInference/ProbabilityTheory/BackwardMartingale.lean` and starts
Section 4.7 by reusing the existing VdV&W order-dual convergence primitive.  It
adds `durrett2019_backwardsFiltration`,
`durrett2019_backwards_martingale_of_condExp_nat`,
`durrett2019_theorem_4_7_1_backwards_martingale_ae_eq_condExp_terminal`,
`durrett2019_theorem_4_7_1_uniformIntegrable_of_backwards_martingale`,
`durrett2019_theorem_4_7_1_ae_exists_limit_of_eLpNorm_one_bdd`,
`durrett2019_theorem_4_7_1_ae_exists_limit_of_backwards_martingale`,
`durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_uniformIntegrable`,
and
`durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_backwards_martingale`.
V283 factors the reverse-time read UI proof into
`durrett2019_theorem_4_7_1_read_uniformIntegrable_of_backwards_martingale`,
adds integrability of an identified limit via
`durrett2019_theorem_4_7_1_integrable_limit_of_ae_tendsto_backwards_martingale`,
and proves the main Theorem 4.7.2 set-integral/conditional-expectation
identification assuming tail measurability:
`durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_L1_tendsto` and
`durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto`.
V284 closes that missing tail-measurability layer by using the canonical
real-valued modification `limsup_n X_{-n}`.  It proves
`durrett2019_theorem_4_7_2_limit_aestronglyMeasurable_tail_of_ae_tendsto` and
then the fully source-shaped
`durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto_backwards_martingale`.
V285 packages Theorem 4.7.3 backwards Lévy.  It proves the conditional
expectation reverse-time martingale, the dual-filtration a.s. endpoint
`durrett2019_theorem_4_7_3_condExp_ae_tendsto_tail_condExp`, the `L¹` endpoint
`durrett2019_theorem_4_7_3_condExp_eLpNorm_one_tendsto_tail_condExp`, and the
natural decreasing-filtration display wrappers
`durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_tail_condExp` and
`durrett2019_theorem_4_7_3_condExp_nat_eLpNorm_one_tendsto_tail_condExp`.
V286 starts Example 4.7.4.  It adds the V285 tail-triviality consumer
`durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_const_of_tail_condExp_ae_eq_const`,
the process handoff
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_const`,
and the direct compiled strong-law endpoint
`durrett2019_example_4_7_4_strongLaw_ae_real` reusing
`StatInference.ProbabilityMeasure.strongLaw_ae_real`.
V287 adds the tail-independence bridge
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_independent` and the
direct V286 consumer
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_independent`.
V288 adds the reverse-tail zero-one bridge
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_tail_zero_or_one` and
its direct convergence consumer
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_zero_or_one`.
V289 discharges that zero-one side from the already compiled Durrett 4.3.8
Kolmogorov zero-one support for independent tail blocks:
`durrett2019_example_4_7_4_tail_zero_or_one_of_iIndep_tailBlocks`,
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_iIndep_tailBlocks`,
and
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_iIndep_tailBlocks`.
V290 proves the conditional-expectation algebra core for Durrett's
backwards-average calculation:
`durrett2019_example_4_7_4_condExp_first_eq_invNat_prefixAverage` and
`durrett2019_example_4_7_4_condExp_first_eq_prefixAverage_div`.  These turn
prefix-sum measurability and the symmetry fact
`E(ξ_i | 𝒢_n) = E(ξ_0 | 𝒢_n)` for all `i < n` into the textbook identity
`E(ξ_0 | 𝒢_n) = S_n / n`.
V291 defines the concrete zero-based reverse-average sigma-field
`durrett2019_example_4_7_4_reverseAverageSigma ξ n =
σ(S_n, ξ_n, ξ_{n+1}, ...)` and proves the scaffold facts:
`durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma`,
`durrett2019_example_4_7_4_prefixSum_stronglyMeasurable_reverseAverageSigma`,
`durrett2019_example_4_7_4_tailCoordinate_measurable_reverseAverageSigma`, and
`durrett2019_example_4_7_4_reverseAverageSigma_le`.
V292 proves the reverse-average sigma-fields decrease and specializes the
prefix-average conditional-expectation calculation to the concrete
reverse-average sigma-field:
`durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma_of_le`,
`durrett2019_example_4_7_4_reverseAverageSigma_antitone`, and
`durrett2019_example_4_7_4_condExp_first_eq_reverseAverageSigma_prefixAverage_div`.
V293 adds the exchangeability-transport handoff:
`durrett2019_condExp_eq_of_invariant_measurableEquiv`,
`durrett2019_example_4_7_4_condExp_eq_zero_of_reverseAverage_invariant_equiv`,
and
`durrett2019_example_4_7_4_reverseAverageSigma_prefix_condExp_symmetry`.
It converts reverse-average-event-preserving measure-preserving coordinate
transports into the exact finite-prefix conditional-expectation symmetry
consumed by the V292 prefix-average theorem.
V294 makes the reverse-average sigma-field preservation automatic from source
invariants.  It adds
`durrett2019_example_4_7_4_reverseAverageGeneratorSet`,
`durrett2019_example_4_7_4_reverseAverageSigma_eq_generateFrom`,
`durrett2019_example_4_7_4_preimage_reverseAverageSigma_eq_of_prefixSum_tail_invariant`,
and
`durrett2019_example_4_7_4_reverseAverageSigma_prefix_condExp_symmetry_of_prefixSum_tail_invariant`.
V295 specializes the V294 transport layer to the iid infinite product
coordinate-evaluation process using the VdVW finite/natural coordinate
permutation machinery.  It adds
`durrett2019_example_4_7_4_eval_prefixSum_comp_natPermOfFin`,
`durrett2019_example_4_7_4_eval_tail_comp_natPermOfFin`,
`durrett2019_example_4_7_4_eval_coordinate_eq_zero_comp_prefixSwap`,
`durrett2019_example_4_7_4_eval_condExp_eq_zero_of_prefixSwap`,
`durrett2019_example_4_7_4_eval_prefix_condExp_symmetry_of_prefixSwaps`, and
`durrett2019_example_4_7_4_eval_condExp_first_eq_prefixAverage_div_product`.
V296 discharges the remaining product-coordinate integrability assumption from
the one-dimensional source moment and adds
`durrett2019_example_4_7_4_eval_integrable_of_integrable_id`,
`durrett2019_example_4_7_4_eval_condExp_first_eq_prefixAverage_div_product_of_integrable_id`,
and `durrett2019_example_4_7_4_eval_strongLaw_ae_real_of_integrable_id`.
V297 assembles the genuine backwards-martingale product proof route up to the
reverse-tail zero-one side.  It adds
`durrett2019_example_4_7_4_ae_tendsto_of_eventually_ae_eq_condExp_nat_and_tail_const`,
`durrett2019_example_4_7_4_ae_tendsto_of_eventually_ae_eq_condExp_nat_and_tail_zero_or_one`,
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_tail_zero_or_one`.
V298 connects Durrett's reverse-average tail to the existing VdV&W
permutation-symmetric infrastructure.  It adds the tail-fixing permutation
source algebra
`durrett2019_example_4_7_4_eval_prefixSum_comp_tailFixingPerm`,
`durrett2019_example_4_7_4_eval_tail_comp_tailFixingPerm`, the corresponding
`VdVWPermutationSymmetricFrom` and measurable-space wrappers, and the final
bridges
`durrett2019_example_4_7_4_eval_reverseAverageSigma_le_permutationSymmetric`
and
`durrett2019_example_4_7_4_eval_reverseAverageTail_le_permutationSymmetricTail`.
V299 transports the remaining zero-one side across V298 and feeds it into the
V297 backwards-martingale endpoint.  It adds
`durrett2019_example_4_7_4_eval_reverseAverage_tail_zero_or_one_of_permutationSymmetric_tail`
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_permutationSymmetric_tail_zero_or_one`.
V300 adds reusable VdVW/Hewitt-Savage support in
`StatInference/EmpiricalProcess/PMeasurable.lean`:
`preimage_vdVWPermuteNatSequence_eq_of_measurableSet_permutationSymmetricTail`,
`preimage_vdVWPermuteNatSequence_natPermOfFin_eq_of_measurableSet_permutationSymmetricTail`,
and
`setIntegral_vdVWInfiniteProductMeasure_comp_permuteNatSequence_of_measurableSet_permutationSymmetricTail`.
It also adds Durrett-shaped real-product wrappers
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_preimage_natPermOfFin_eq`
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_setIntegral_natPermOfFin_eq`.
V301 adds the compiled zero-one consumer layer from self-independence of the
VdVW permutation-symmetric tail:
`vdVWPermutationSymmetricTail_measure_zero_or_one_of_indep_self`,
`vdVWPermutationSymmetricTail_measure_zero_or_one_all_of_indep_self`,
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_zero_or_one_of_indep_self`,
`durrett2019_example_4_7_4_eval_reverseAverage_tail_zero_or_one_of_permutationSymmetric_tail_indep_self`,
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_permutationSymmetric_tail_indep_self`.
V302 adds the compiled finite-prefix/future-tail independence support:
`durrett2019_theorem_4_3_8_prefixFiltration_le_iSup_coordinateSigma_lt`,
`durrett2019_theorem_4_3_8_prefixCoordinateSigma_indep_tailCoordinateSigma_infinitePi`,
`durrett2019_theorem_4_3_8_prefixFiltration_indep_tailCoordinateSigma_infinitePi`,
and the Example 4.7.4 iid real-product specialization
`durrett2019_example_4_7_4_eval_prefixFiltration_indep_tailCoordinateSigma`.
V303 adds the compiled transported-prefix Hewitt-Savage support:
`vdVWPermutationSymmetricMeasurableSpace_le`,
`vdVWPermutationSymmetricTail_le`,
`durrett2019_example_4_7_4_permuteNatSequence_prefixFiltration_tailCoordinateSigma_measurable`,
`durrett2019_example_4_7_4_preimage_permuteNatSequence_prefixFiltration_tailCoordinateSigma`,
`durrett2019_example_4_7_4_eval_prefixFiltration_indep_permuted_prefix`,
`durrett2019_example_4_7_4_eval_prefix_inter_permuted_prefix_measure_eq_mul`,
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_inter_prefix_eq_inter_permuted_prefix`.
V304 adds the compiled limit-algebra bridge:
`durrett2019_example_4_7_4_eval_tail_prefix_product_of_permuted_prefix_limit`
turns transported-prefix approximation into the product formula against one
prefix event, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product_limit`
turns prefix-product formulas plus prefix approximation of tail events into
`Indep tail tail`.
V305 adds the compiled prefix-approximation metric bridge using Mathlib's
`MeasureTheory.Measure.MeasuredSets` primitives:
`durrett2019_example_4_7_4_tendsto_measure_of_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_tendsto_measure_inter_of_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_eval_prefixLimit_of_symmDiff_prefix_approx`, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product_symmDiff_approx`.
Thus future work should not reprove the two measure-coordinate limits from
`μ (D_k ∆ B) -> 0`.
V306 adds the finite-prefix approximation basis:
`durrett2019_example_4_7_4_finitePrefixEventSet`,
`durrett2019_example_4_7_4_finitePrefixEventSet_isSetRing`,
`durrett2019_example_4_7_4_finitePrefixEventSet_generateFrom`,
`durrett2019_example_4_7_4_exists_measure_symmDiff_lt_finitePrefixEventSet`,
`durrett2019_example_4_7_4_exists_prefix_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_eval_prefixApprox`, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product`.
Thus future work should not rebuild the finite-prefix ring, cylinder
generation, or symmetric-difference approximation sequence.

Next aggressive theorem packet: prove self-independence of the VdVW
permutation-symmetric tail
`⨅ n, vdVWPermutationSymmetricMeasurableSpace ℝ n` under the iid product
measure.  Search mathlib/local first for Hewitt-Savage, exchangeable-tail, or
permutation-invariant self-independence support.  If no direct primitive
exists, use V300's finite-permutation invariance plus the V302/V303/V304/V305
hooks and V306's finite-prefix approximation sequence.  The next theorem
should prove the remaining product formula input:
for a permutation-symmetric tail event `A` and every finite-prefix event `D`,
`vdVWInfiniteProductMeasure P (A ∩ D) =
  vdVWInfiniteProductMeasure P A * vdVWInfiniteProductMeasure P D`.
Route through the V303 transported-prefix equality and V304 prefix-limit
consumer by choosing a block-moving finite permutation/cutoff that moves `D`
into future coordinates.  Then feed the V306 approximation wrapper into V301.
Do not
rewrap the already compiled direct strong law,
V286/V287/V288/V289/V290/V291/V292/V293/V294/V295/V296/V297/V298/V299/V300/V301/V302/V303/V304/V305/V306
handoffs, or V285 backwards Lévy endpoint.

## Deprecated V255 Prompt Notes

The long text below is retained only as provenance for previous proof packets;
do not use it as the next `/goal` prompt.

Continue Durrett 2019 Probability Theory formalization in Lean from latest
synced `main`.  Active lane: Durrett Chapter 4 martingales in
`StatInference/ProbabilityTheory/Martingale.lean`, specifically Example 4.5.8
as the first downstream consumer of the now-closed Durrett Theorem 4.5.7.
Already compiled and reusable: Chapter 2 support through the
SLLN/Glivenko-Cantelli/layer-cake endpoints, Chapter 3 weak-convergence and
CLT wrappers, Chapter 4.1-4.4 martingale infrastructure, Theorem 4.5.1
maximal support, Theorem 4.5.2 convergence/threshold source package, Theorem
4.5.3 random-normalizer route, and final Theorem 4.5.5 ratio package.

Deprecated packet V255 added the linear-random-walk source bridge for
Example 4.5.8:
`durrett2019_deterministic_clock_isStronglyPredictable`,
`durrett2019_stoppedProcess_monotone_of_monotone`,
`durrett2019_exercise_4_4_6_varianceClock_mono`,
`durrett2019_stoppedProcess_tendsto_stoppedValue_of_ne_top`,
`durrett2019_stopped_square_minus_stopped_clock_martingale`, and
`durrett2019_example_4_5_8_stoppedLinearRandomWalk_terminal_integral_eq_zero_of_iIndepFun_zeroMean_secondMoments`.
It stops the already-compiled Exercise 4.4.6 square-minus-variance-clock
martingale for an independent mean-zero linear random walk, derives the stopped
clock predictability/monotonicity and stopped-value limits, and concludes
`E[S_N] = 0` under a.s. finite `N` plus integrability of the stopped variance
clock.  V254 adds the stopped-process specialization for
Example 4.5.8:
`durrett2019_example_4_5_8_stoppedProcess_integral_limit_eq_zero_of_theorem_4_5_7_source`.
It derives the finite-horizon zero expectations for `S_{N ∧ n}` from bounded
optional stopping applied to `N ∧ n`, then feeds the already-compiled V253
dominated/4.5.7 bridge.  V253 starts Example 4.5.8 from the source anchor
immediately after Theorem 4.5.7 with:
`durrett2019_theorem_4_5_7_runningAbsSup_integrable_of_source_square_minus_martingale_monotone_terminal`,
`durrett2019_example_4_5_8_integral_limit_eq_zero_of_dominated`, and
`durrett2019_example_4_5_8_integral_limit_eq_zero_of_theorem_4_5_7_source`.
It packages the exact bridge used in the textbook example: finite-horizon zero
expectations pass to the stopped limit once Theorem 4.5.7 supplies an
integrable running supremum.  V252 removes the remaining manual boundedness and
square-root-finiteness side conditions from the canonical infinite-horizon
Durrett 4.5.7 endpoint.  New reusable support:
`durrett2019_runningAbsMax_ae_bddAbove_of_iSup_lintegral_ne_top`,
`durrett2019_integrable_sqrt_of_integrable_nonneg`,
`durrett2019_lintegral_sqrt_ne_top_of_integrable_nonneg`,
`durrett2019_theorem_4_5_7_sqrt_lintegral_ne_top_of_source_monotone_terminal`,
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal_of_sqrt_lintegral_ne_top`,
and the clean source-facing endpoint
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`.
The proof derives a.e. boundedness from the finite `ENNReal` `iSup`
expectation via Mathlib's `ae_lt_top`, and derives
`E sqrt(A_infty) < ∞` from `Integrable A_infty` plus the monotone-terminal
nonnegativity of `A_infty`.  V251 adds the infinite-horizon monotone endpoint:
`durrett2019_runningAbsMax_lintegral_iSup_le_of_lintegral_le`,
`durrett2019_theorem_4_5_7_lintegral_iSup_runningAbsMax_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`,
`durrett2019_iSup_ofReal_runningAbsMax_eq_ofReal_runningAbsSup_of_bddAbove`,
`durrett2019_lintegral_iSup_runningAbsMax_eq_lintegral_runningAbsSup_of_ae_bddAbove`,
and
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal_ae_bddAbove`.
It uses Mathlib's `lintegral_iSup` plus the compiled
`durrett2019_runningAbsMax_mono`/`durrett2019_runningAbsSup` support to pass
the V250 finite-horizon estimate to
`∫ iSup_n ofReal(max_{m <= n} |X_m|) <= 3 * E sqrt(A_infty)`, and then to the
canonical real `runningAbsSup` form under the explicit a.e. boundedness side
condition needed for real `ciSup`.  V250 adds the finite-horizon endpoint:
`durrett2019_theorem_4_5_7_terminal_tail_sq_measure_aemeasurable` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`.
It combines the V241 finite running-maximum layer-cake bound, the V242 first
RHS calculation, and the V249 second RHS calculation into
`E(max_{m <= n} |X_m|) <= 3 * E sqrt(A_infty)` for every finite horizon.
V249 adds the outer second-RHS assembly:
`durrett2019_theorem_4_5_7_tail_cut_double_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral_of_source_monotone_terminal`.
It combines V244/V245/V248 with the V246 square-root layer-cake endpoint and
proves the second deterministic RHS term is `2 * E sqrt(A_infty)`.  V248 adds
the fixed-`b` event-split inner-integral layer:
`durrett2019_theorem_4_5_7_lintegral_Ioi_zero_indicator_Ioi_sqrt` and
`durrett2019_theorem_4_5_7_tail_cut_inner_lintegral_eq_tail_weight`.
It rewrites the Tonelli inner integral
`∫_0^∞ P(b < A_infty, b < a^2) / ((Real.toNNReal a)^2) da` for `b > 0`
as `P(b < A_infty) * b^(1/2 - 1)`, using the event split
`b < a^2 ↔ sqrt b < a` on `a > 0`.  V247 adds the inverse-square calculus and
denominator normalization layer:
`durrett2019_theorem_4_5_7_inv_sq_weight_of_toNNReal_sq`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_rpow_neg_two`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_rpow_neg_two`,
`durrett2019_theorem_4_5_7_ofReal_sqrt_inv_eq_rpow_half_sub_one`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_toNNReal_sq_inv_eq_tail_weight`,
and
`durrett2019_theorem_4_5_7_const_div_lintegral_Ioi_sqrt_toNNReal_sq`.
It proves that the exact denominator from the maximal inequality integrates
over `a > sqrt b` to the `b^(1/2 - 1)` tail weight, including a finite
constant-coefficient form.  V246 adds the square-root weighted-tail layer-cake
endpoint:
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_integrable`,
and
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_source_monotone_terminal`.
It specializes Mathlib's `p = 1/2` layer-cake formula to prove
`E sqrt(A_infty) = (1/2) * ∫_0^∞ P(b < A_infty) b^{-1/2} db`, in the
extended nonnegative form consumed by the final deterministic RHS assembly.
V245 adds the source-level Tonelli swap layer:
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable_of_aemeasurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_aemeasurable`,
and
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_integrable`.
It proves the weighted tail-cut kernel is measurable even from the source
`Integrable A_infty` hypothesis and swaps the `a,b` integrals.  V244 adds the weighted second-RHS
double-integral handoff:
`durrett2019_theorem_4_5_7_set_lintegral_div_toNNReal_sq`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral_of_source_monotone_terminal`.
It rewrites
`∫_0^∞ a^{-2} E(A_infty ∧ a^2) da`
as the iterated nonnegative integral
`∫_0^∞ ∫_0^∞ a^{-2} P(b < A_infty, b < a^2) db da`.  V243 adds the
second-RHS truncation layer-cake
bridge:
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral`,
`durrett2019_theorem_4_5_7_terminal_nonneg_of_initial_zero_monotone_tendsto`,
and
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral_of_source_monotone_terminal`.
It proves
`E(A_infty ∧ a^2) = ∫_0^∞ P(b < A_infty, b < a^2) db` in the extended
nonnegative form, with `A_infty >= 0` supplied by the source monotone-terminal
clock hypotheses.  V242 supplied the first deterministic RHS
Fubini/layer-cake bridge:
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral` and
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral_of_integrable`.
It proves `∫_0^∞ P(A_infty > a^2) da = E sqrt(A_infty)` in the extended
nonnegative form used by the proof.  V241 supplied the finite-horizon
layer-cake handoff:
`durrett2019_theorem_4_5_7_lintegral_le_lintegral_tail_bound_lt` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_terminal_tail_add_min_terminal_lintegral_of_source_square_minus_martingale_monotone_terminal`.
It integrates the V240 probability inequality into an extended-expectation
bound for each finite running maximum.  V240 supplied the raw/stopped survival
probability split and source-facing raw finite-horizon bound:
`durrett2019_theorem_4_5_7_runningAbsMax_eq_stopped_of_firstPredictableAbove_eq_top`,
`durrett2019_theorem_4_5_7_runningAbsMax_event_subset_terminal_tail_union_stopped`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_stopped`,
and
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V239 supplied the Theorem 4.5.7 source-facing stopped maximal-probability
wrapper:
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V238 supplied the source-facing stopped terminal-square wrappers:
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity_monotone_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V237 supplied the lower-level min-bound layer:
`durrett2019_theorem_4_5_7_stoppedProcess_le_terminal_of_process_le`,
`durrett2019_theorem_4_5_7_min_terminal_integrable_of_terminal_integrable`,
`durrett2019_theorem_4_5_7_stopped_square_integral_le_min_terminal_of_stopped_bounds`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_terminal_integrable`.
V236 already supplied the raw/stopped
`P(max_{m <= n} |X_m| > a)` Kolmogorov/Doob probability conversion.

Next aggressive theorem-sized packet: specialize the V255 linear-random-walk
bridge to simple symmetric/Rademacher increments.  Search local/Mathlib support
first, especially `StatInference/ProbabilityMeasure/Rademacher.lean`, for
Rademacher moment facts (`E ξ = 0`, `E ξ^2 = 1`, `ξ ∈ L^2`) and iid sign
construction/reuse.  The clean target is an endpoint with
`sigmaSq = fun _ => 1`, stopped variance clock displayed as `N` or `N ∧ n`, and
only the genuine textbook side condition `E sqrt(N) < ∞`/terminal clock
integrability left.  Do not rebuild the V255 stopped square-minus-clock
martingale, stopped-value convergence, V254 optional-stopping zero expectations,
dominated convergence, or Theorem 4.5.7 integrability.  Do not revisit closed
Chapter 2/3/4.5.2/4.5.3/4.5.5 plumbing, the V236 probability conversion, the
V237/V238/V239 stopped source packaging, the V240 raw/stopped survival split,
the V241 layer-cake handoff, the V242 first-RHS bridge, the V243
truncated-terminal layer-cake bridge, the V244 weighted double-integral
handoff, the V245 Tonelli/measurability swap layer, the V246 square-root
weighted-tail endpoint, the V247 inverse-square denominator calculus, or the
V248 fixed-`b` inner integral, the V249 second-RHS assembly, the V250
finite-horizon aggregation, the V251 monotone `iSup` endpoint, the V252
no-manual-boundedness/finiteness cleanup, the V253 dominated optional-stopping
bridge, or the V254 stopped-process zero-expectation specialization unless a
compile error exposes a genuinely missing primitive.

## Recent Route Notes

V257 adds the canonical infinite iid Rademacher product space.  In
`StatInference/ProbabilityMeasure/Rademacher.lean`, `rademacherBoolSequenceLaw`
is the infinite product of fair Bool laws, `rademacherSequenceCoordinate`
pushes each coordinate through `boolToRademacherSign`, and compiled wrappers
provide measurability, strong measurability, Rademacher law, independence, and
sub-Gaussianity.  In `StatInference/ProbabilityTheory/Martingale.lean`, the
canonical simple-random-walk endpoint feeds these product coordinates into the
V256 Rademacher bridge for Durrett Example 4.5.8.

V256 adds the simple symmetric random-walk bridge for Durrett Example 4.5.8.
Reusable Rademacher support in `StatInference/ProbabilityMeasure/Rademacher.lean`
now packages the fair sign second moment, real Rademacher law mean/second
moment, and law-to-`L^2`/moment transfer.  In
`StatInference/ProbabilityTheory/Martingale.lean`, the unit variance clock is
displayed as `A_n = n`, the stopped unit clock is displayed as
`fun ω => ((N ω).untopA : ℝ)`, and the Rademacher-law endpoint feeds those facts
into the V255 independent-increment bridge to conclude `E[S_N] = 0`.

V201 compiled the Theorem 4.5.2 countable-threshold source assembly:
`durrett2019_theorem_4_5_2_stopped_square_minus_increasing_martingale_of_source`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_square_minus_increasing_martingale_of_source`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_source_square_minus_martingale`,
`durrett2019_theorem_4_5_2_threshold_cover_of_ae_le_terminal`,
`durrett2019_theorem_4_5_2_exists_ae_tendsto_of_source_square_minus_martingale_cover`,
and
`durrett2019_theorem_4_5_2_exists_ae_tendsto_of_source_square_minus_martingale_monotone_terminal`.

V202 removes the former manual stopped running-maximum boundedness side
condition.  The finite stopped terminal square estimates now automatically
give the a.s. boundedness needed by the canonical running-supremum bridge, via
`durrett2019_theorem_4_5_2_stopped_runningAbsMax_ae_bddAbove_of_terminal_integral_sq_le`
and the no-`hBdd` wrappers:
`durrett2019_theorem_4_5_2_stopped_exists_ae_tendsto_of_terminal_integral_sq_le_auto_bdd`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_terminal_integral_sq_le_auto_bdd`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_stopped_increasing_le_auto_bdd`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_initial_le_and_square_identity_auto_bdd`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_initial_le_and_predictablePart_identity_auto_bdd`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_square_minus_increasing_martingale_auto_bdd`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_source_square_minus_martingale_auto_bdd`,
`durrett2019_theorem_4_5_2_exists_ae_tendsto_of_source_square_minus_martingale_cover_auto_bdd`,
and
`durrett2019_theorem_4_5_2_exists_ae_tendsto_of_source_square_minus_martingale_monotone_terminal_auto_bdd`.

V203 removes the former manual stopped-predictability side condition.  Stopping
now preserves discrete predictability through
`durrett2019_isStronglyPredictable_stoppedProcess_of_predictable`, and the
threshold-stopped increasing process is automatically predictable via
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_predictable_of_predictable`.
The source-facing no-manual-predictability wrappers now compile:
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_predictablePart_eq_of_square_minus_increasing_martingale_of_predictable`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_square_minus_increasing_martingale_auto_bdd_of_predictable`,
`durrett2019_theorem_4_5_2_firstPredictableAbove_stopped_exists_ae_tendsto_of_source_square_minus_martingale_auto_bdd_of_predictable`,
`durrett2019_theorem_4_5_2_exists_ae_tendsto_of_source_square_minus_martingale_cover_auto_bdd_of_predictable`,
and
`durrett2019_theorem_4_5_2_exists_ae_tendsto_of_source_square_minus_martingale_monotone_terminal_auto_bdd_of_predictable`.

V204 packages the exact event-facing finite-variance side of Theorem 4.5.2.
The threshold cover and source convergence wrappers now work on an arbitrary
event `FiniteVar`, so the theorem-facing conclusion is
`∀ᵐ ω, ω ∈ FiniteVar -> ∃ z, Tendsto (fun n => X n ω) atTop (𝓝 z)`.
New compiled endpoints:
`durrett2019_theorem_4_5_2_threshold_cover_on_of_ae_le_terminal`,
`durrett2019_theorem_4_5_2_exists_ae_tendsto_on_of_source_square_minus_martingale_cover_auto_bdd_of_predictable`,
and
`durrett2019_theorem_4_5_2_exists_ae_tendsto_on_of_source_square_minus_martingale_monotone_terminal_auto_bdd_of_predictable`.

V205 starts the exact Theorem 4.5.3 route.  The random-normalizer Kronecker
bridge
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_transform_tendsto`
now turns a.e. convergence of the predictable transform plus pathwise
nonzero/monotone/divergent random normalizer hypotheses into
`X_n / b_n -> 0` a.s.  It reuses Exercise 4.4.11 pathwise Kronecker support
with `b_n = b_n(ω)`, so the remaining 4.5.3 work is no longer the final
Kronecker handoff.  The same V205 layer also discharges the predictable and
boundedness side conditions for the textbook reciprocal transform from source
hypotheses:
`durrett2019_theorem_4_5_3_reciprocal_comp_predictable`,
`durrett2019_theorem_4_5_3_reciprocal_comp_shift_stronglyAdapted`,
`durrett2019_theorem_4_5_3_reciprocal_comp_nonneg_of_one_le`, and
`durrett2019_theorem_4_5_3_reciprocal_comp_le_one_of_one_le`.

V206 connects the random-normalizer bridge to the already compiled
scaled-square-summability transform convergence theorem.  New compiled
endpoints:
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_scaled_summable`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_scaled_summable`.
Thus the remaining 4.5.3 source work is not another transform-convergence or
reciprocal-predictability wrapper: it is the concrete textbook variance /
integral estimate that proves the displayed scaled summability for
`H_m = f(A_m)^{-1}`, plus any needed `MemLp` side condition for that transform.

V207 moves one step closer to the textbook variance estimate.  The
variance-ratio bridge
`durrett2019_theorem_4_5_3_scaled_summable_of_integral_le_variance_ratio`
proves that a pointwise integral comparison from reciprocal-scaled martingale
increments to the variance-ratio terms, plus summability of the variance-ratio
series, supplies the scaled summability consumed by V206.  The endpoint
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_variance_ratio_summable`
feeds this directly into `X_n / f(A_n) -> 0`.

V208 starts the first real source estimate feeding V207.  The pull-out lemma
`durrett2019_theorem_4_5_3_integral_mul_sq_le_of_condExp_square_le` proves the
Mathlib-shaped conditional-variance core: if `H` is `ℱ_k`-measurable and
`E[Y^2 | ℱ_k] ≤ V`, then `∫ H^2 * Y^2 ≤ ∫ H^2 * V`.

V209 instantiates V208 with the textbook reciprocal normalizer and martingale
increment.  The per-step comparison
`durrett2019_theorem_4_5_3_reciprocal_comp_integral_le_variance_increment_of_condExp_square_le`
proves the V207 `hscaled_le` input from
`E[(X_{k+1}-X_k)^2 | ℱ_k] ≤ A_{k+1}-A_k`, and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_variance_ratio_summable`
feeds those comparisons directly into the normalized-process endpoint.

V210 starts the deterministic/integral comparison.  The scalar interval lemma
`durrett2019_theorem_4_5_3_interval_variance_ratio_le_integral_inv_sq` proves
that for increasing `f >= 1` on `[a,b]`,
`(b-a) / f(b)^2 ≤ ∫_a^b f(t)^{-2} dt`.

V211 lifts V210 to finite pathwise clock sums.  The theorem
`durrett2019_theorem_4_5_3_finite_sum_variance_ratio_le_integral_clock` proves
`∑_{k<N} (A_{k+1}-A_k) / f(A_{k+1})^2 ≤ ∫_{A_0}^{A_N} f(t)^{-2} dt`
from per-interval monotonicity, positivity, and interval-integrability.

V212 packages the deterministic infinite-series consequence.  The theorem
`durrett2019_theorem_4_5_3_variance_ratio_summable_of_integral_clock_bound`
proves summability of the deterministic variance-ratio series from a uniform
finite-clock-integral bound, and
`durrett2019_theorem_4_5_3_tsum_variance_ratio_le_of_integral_clock_bound`
records the corresponding total-series bound.

V213 lifts V212 through almost-sure random clock certificates.  The theorems
`durrett2019_theorem_4_5_3_ae_variance_ratio_summable_of_integral_clock_bound`
and
`durrett2019_theorem_4_5_3_ae_tsum_variance_ratio_le_of_integral_clock_bound`
turn a.e. monotonicity, interval, and finite-clock-bound hypotheses into
a.e. summability and a.e. total variance-ratio bounds.

V214 closes the finite integrated/Fubini summability bridge required by V209.
New compiled declarations:
`durrett2019_theorem_4_5_3_finite_integral_variance_ratio_le_integral_clock`,
`durrett2019_theorem_4_5_3_integral_variance_ratio_summable_of_integral_clock_bound`,
and
`durrett2019_theorem_4_5_3_tsum_integral_variance_ratio_le_of_integral_clock_bound`.
These exchange finite sums with Bochner integrals, integrate the V211 pathwise
clock comparison, and prove the expectation-level variance-ratio summability
consumed by the V209 normalized-process endpoint.

V215 connects the V214 integrated summability package directly to
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_variance_ratio_summable`,
through the new source-facing endpoint
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound`.
This also derives the pointwise endpoint condition `1 <= f(A_n)` from the
per-interval source lower bound and clock monotonicity.

V216 removes the manual uniform integrated clock-bound input from the main
Theorem 4.5.3 route.  New compiled declarations:
`durrett2019_theorem_4_5_3_clock_interval_le_tail_integral_bound`,
`durrett2019_theorem_4_5_3_integrated_clock_bound_of_tail_integral_bound`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound`.
These prove that finite clock intervals inside `[0, ∞)` are controlled by the
global tail integral `∫_0^∞ f(t)^{-2} dt`, integrate that bound over the
probability space, and feed it into the V215 endpoint.

V217 removes the transform `MemLp`, scaled-square integrability, and
increment-square integrability side conditions from the main Theorem 4.5.3
source route.  New compiled declarations:
`durrett2019_memLp_mul_of_abs_le_one`,
`durrett2019_theorem_4_5_3_reciprocal_comp_transform_memLp_two_of_process_memLp`,
`durrett2019_theorem_4_5_3_increment_sq_integrable_of_process_memLp`,
`durrett2019_theorem_4_5_3_reciprocal_comp_scaled_sq_integrable_of_process_memLp`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound_of_process_memLp`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp`.
The theorem-facing endpoint now takes the single source assumption
`∀ n, MemLp (X n) 2 P` instead of three separate transform/increment `L^2`
obligations.

V218 removes the variance-ratio integrability side condition from the main
Theorem 4.5.3 source route.  New compiled declarations:
`durrett2019_integrable_mul_of_abs_le_one`,
`durrett2019_theorem_4_5_3_variance_ratio_integrable_of_clock_integrable`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound_of_process_memLp_clock_integrable`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable`.
The source-facing endpoint now derives variance-ratio integrability from
`∀ n, Integrable (A n) P`, predictability of `A`, continuity of `f`, and
`1 <= f(A_n)`.  Do not try to derive this from
`E[(X_{k+1}-X_k)^2 | ℱ_k] <= A_{k+1}-A_k` alone: that inequality gives only a
lower bound on the clock increment and does not imply integrability of the
increment.

V219 removes the finite random clock-integrability side condition from the
main Theorem 4.5.3 source route.  New compiled declarations:
`durrett2019_theorem_4_5_3_finite_clock_integral_integrable_of_tail_integral_bound`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock`.
The proof uses the continuous primitive
`F(x) = ∫_0^x (f t)⁻¹ ^ 2 dt` to make
`ω ↦ ∫_{A_0(ω)}^{A_N(ω)} (f t)⁻¹ ^ 2 dt` measurable, then bounds it by the
global tail integral.  This correctly needs continuity of the reciprocal-square
clock integrand `fun t => (f t)⁻¹ ^ 2`; plain `Continuous f` is not enough
unless a no-zero/positivity hypothesis for `f` is also supplied.

V220 removes more non-integrability side conditions from the main Theorem
4.5.3 source route.  New compiled declarations:
`durrett2019_theorem_4_5_3_interval_integrable_of_reciprocal_sq_continuous`,
`durrett2019_theorem_4_5_3_reciprocal_sq_continuous_of_continuous_ne_zero`,
`durrett2019_theorem_4_5_3_reciprocal_comp_normalizer_increment_nonneg`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_interval_mono`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_interval_mono_ne_zero`.
The current source-shaped endpoint no longer asks for `hf_int`,
`hb_increment_nonneg`, explicit reciprocal-square continuity, finite random
clock-integrability, variance-ratio integrability, transform `MemLp`,
scaled-square integrability, or increment-square integrability.

V221 packages those remaining normalizer source assumptions.  New compiled
declarations:
`durrett2019_theorem_4_5_3_interval_one_le_of_global_one_le`,
`durrett2019_theorem_4_5_3_ne_zero_of_global_one_le`,
`durrett2019_theorem_4_5_3_interval_mono_of_monotone`,
`durrett2019_theorem_4_5_3_reciprocal_comp_atTop_of_clock_atTop`, and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono_atTop`.
The main endpoint now takes global textbook-style assumptions
`Continuous f`, `Monotone f`, `∀ t, 1 <= f t`, `Tendsto f atTop atTop`, and
`A_n -> ∞` a.s. instead of per-interval lower bounds, explicit no-zero facts,
per-interval monotonicity, and the shifted random normalizer divergence.

V222 closes the deterministic normalizer-divergence source gap from the exact
Durrett assumptions on `f`.  New compiled declarations:
`durrett2019_theorem_4_5_3_normalizer_atTop_of_integrable_inv_sq` and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono`.
The source endpoint now derives `Tendsto f atTop atTop` from `Monotone f`,
`∀ t, 1 <= f t`, and `IntegrableOn (fun t => (f t)⁻¹ ^ 2) (Set.Ici 0)`.

V223 packages the infinite-clock event side of Theorem 4.5.3.  New compiled
declarations:
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_transform_tendsto`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_scaled_summable`,
`durrett2019_theorem_4_5_3_reciprocal_comp_atTop_on_of_clock_atTop_on`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_integral_clock_bound`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono_atTop`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono`.
The final endpoint now proves
`∀ᵐ ω, ω ∈ InfiniteVar -> Tendsto (fun n => X n ω / f (A n ω)) atTop (𝓝 0)`
from the exact Durrett `f` assumptions and an event-local clock-divergence
hypothesis
`∀ᵐ ω, ω ∈ InfiniteVar -> Tendsto (fun n => A n ω) atTop atTop`.

V224 starts Theorem 4.5.5, Second Borel-Cantelli III.  New compiled
declarations:
`durrett2019_theorem_4_5_5_ratio_tendsto_one_of_centered_ratio_tendsto_zero`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_centered_ratio_tendsto_zero`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_process_eq_count_sub_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_normalized`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_of_exists_tendsto`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_on_of_exists_tendsto`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_exists_tendsto`.
The ratio algebra and finite-variance denominator bridge are now compiled:
once the Borel-Cantelli martingale part is `o(∑ p_m)`, or has a finite path
limit while `∑ p_m -> ∞`, the event-count ratio converges to one.

V225 adds the Theorem 4.5.5 conditional-variance clock bridge.  New compiled
declarations:
`durrett2019_theorem_4_5_5_martingalePart_process_increment_eq`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_increment_eq`, and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_conditionalProbabilitySum_increment`.
The Borel-Cantelli martingale increment and denominator-clock increment are
now explicitly identified, and the remaining variance-clock source obligation
is the Bernoulli conditional-variance estimate
`E((1_B - E(1_B | F))^2 | F) <= E(1_B | F)`.

V226 discharges that Bernoulli conditional-variance estimate and feeds it into
the clock bridge.  New compiled declarations:
`durrett2019_theorem_4_5_5_condExp_centered_indicator_sq_le_of_source`,
`durrett2019_theorem_4_5_5_condExp_centered_borelCantelli_indicator_sq_le`,
`durrett2019_theorem_4_5_5_condExp_centered_borelCantelli_indicator_sq_le_auto`,
and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_conditionalProbabilitySum_increment_auto`.
The Borel-Cantelli martingale conditional square increment is now automatically
dominated by the cumulative conditional-probability clock increment for
measurable events.

V227 adds the infinite-clock max-normalizer handoff and the finite/infinite
event-cover ratio assembly.  New compiled declarations:
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_of_max_one_normalizer`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_on_of_max_one_normalizer`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_max_one_normalized`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_max_one_normalized`.
The split logic is now compiled: finite clock needs a finite martingale path
limit, infinite clock needs the `max(A_n, 1)` normalized martingale estimate,
and the two event-local conclusions combine to the full ratio conclusion on
the covered event.

V228 specializes the infinite-clock side of Theorem 4.5.5 to the textbook
normalizer `f(t)=max t 1` and feeds in the V226 Borel-Cantelli dominated
variance-clock endpoint.  New compiled declarations:
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_conditionalProbabilitySum_clock`
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_conditionalProbabilitySum_clock`.
The proof now derives the `max t 1` continuity, monotonicity, and lower-bound
facts inside the wrapper.  The remaining explicit source obligations are the
conditional-probability clock regularity and the tail-integral certificate.

V229 discharges the cheap source side conditions for the infinite-clock
Theorem 4.5.5 endpoint from adapted events.  New compiled declarations:
`durrett2019_theorem_4_5_5_measurableSet_of_adapted`,
`durrett2019_theorem_4_5_5_martingalePart_process_zero`,
`durrett2019_theorem_4_5_5_martingalePart_process_memLp_two`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_predictable`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_integrable`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_zero_nonneg`, and
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock`.
The adapted-event wrapper now supplies ordinary measurability, the
Borel-Cantelli martingale, `X_0=0`, finite-time `L^2`, clock predictability,
clock integrability, and `A_0>=0` to the V228 infinite-clock endpoint.

V230 discharges the textbook tail-integral certificate.  New compiled
declarations:
`durrett2019_theorem_4_5_5_max_one_inv_sq_integrableOn_Ici`,
`durrett2019_theorem_4_5_5_integral_max_one_inv_sq_Ici`,
`durrett2019_theorem_4_5_5_integral_max_one_inv_sq_Ici_le_two`,
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock_auto_tail`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_adapted_conditionalProbabilitySum_clock_auto_tail`.
The infinite-clock and ratio wrappers now use the exact value
`∫_0^∞ (max t 1)^{-2} dt = 2`, so the tail certificate is no longer a live
source obligation.

V231 proves the conditional-probability clock monotonicity in its honest
Mathlib form.  New compiled declarations:
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_mono_step_ae`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_mono_step_ae_on`, and
`durrett2019_theorem_4_5_5_max_one_conditionalProbabilitySum_increment_nonneg_ae`.
The source monotonicity is now available a.e.; what remains is consuming this
a.e. certificate in the infinite-clock route or replacing the clock by a
canonical pointwise-monotone representative.

V232 introduces and consumes the canonical nonnegative representative of the
conditional-probability clock.  New compiled declarations:
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_increment_eq`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_predictable`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_integrable`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_zero_nonneg`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_mono_step`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_ae_eq_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_ae_eq_conditionalProbabilitySum_all`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_atTop_on_of_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_nonnegativeConditionalProbabilitySum_increment_auto`,
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`.
The infinite-clock side no longer requires pointwise monotonicity of the raw
Mathlib conditional-expectation representative; Theorem 4.5.3 is applied to the
clipped pointwise-monotone clock and transferred back to the textbook raw
denominator by all-time finite a.e. equality.

V233 packages the finite square-clock side and feeds it into the V232 canonical
ratio route.  New compiled declarations:
`durrett2019_martingale_square_sub_predictablePart_martingale`,
`durrett2019_theorem_4_5_5_predictablePart_martingalePart_square_le_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_exists_tendsto_on_of_conditionalProbabilitySum_tendsto`,
`durrett2019_theorem_4_5_5_martingalePart_exists_tendsto_on_of_predictablePart_square_tendsto`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_square_clock_finite_or_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`.
The active ratio wrapper no longer needs a direct
`hmartingale_exists_on_finite` assumption: convergence of the canonical
predictable part of the Borel-Cantelli martingale square now supplies the
finite branch through Theorem 4.5.2.

V234 closes the infinite-clock limsup endpoint from the textbook's conditional
Borel-Cantelli support.  New compiled declarations:
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_atTop_on_limsup_of_adapted`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_adapted_conditionalProbabilitySum_atTop`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_limsup_of_adapted`.
On `limsup B atTop`, the raw conditional-probability denominator now diverges
by Theorem 4.3.4, and the canonical Theorem 4.5.3 route proves the textbook
ratio limit directly.  The infinite branch no longer needs another denominator
divergence, max-normalizer, or raw-clock monotonicity wrapper.

V235 closes the final textbook-facing Theorem 4.5.5 package.  New compiled
declarations:
`durrett2019_theorem_4_5_5_ratio_tendsto_one_of_adapted_conditionalProbabilitySum_atTop`
and
`durrett2019_theorem_4_5_5_conditional_borel_cantelli_ratio_package_of_adapted`.
The displayed conclusion now has the exact source shape: almost surely, if the
raw cumulative conditional-probability clock diverges, then the
Borel-Cantelli event-count ratio tends to one.  The package also records the
Theorem 4.3.4 identification of that divergence event with `limsup B atTop`.

V236 starts Durrett Theorem 4.5.7.  New compiled declarations:
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_sq`,
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_terminal_sq`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_of_terminal_sq_le`,
and
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_of_terminal_sq_le`.
These convert the existing Kolmogorov/Doob square maximal inequality into the
finite-horizon `P(max_{m <= n} |X_m| > a)` form used in Durrett's proof, with
raw and stopped-process variants plus a supplied terminal second-moment bound
consumer.

V237 adds the stopped terminal-square min-bound layer for Durrett Theorem
4.5.7.  New compiled declarations:
`durrett2019_theorem_4_5_7_stoppedProcess_le_terminal_of_process_le`,
`durrett2019_theorem_4_5_7_min_terminal_integrable_of_terminal_integrable`,
`durrett2019_theorem_4_5_7_stopped_square_integral_le_min_terminal_of_stopped_bounds`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_terminal_integrable`.
These prove the theorem-facing estimate
`E X_{N(a) ∧ n}^2 <= E(A_infty ∧ a^2)` once the source clock is dominated by
`A_infty`, `A_infty` is integrable, the initial threshold bound holds, and the
stopped square/increasing clock identity is supplied.

V238 adds the source-facing stopped terminal-square wrappers for Durrett
Theorem 4.5.7.  New compiled declarations:
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity_monotone_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
These derive the stopped square/increasing-clock identity from the canonical
predictable-part identification, derive terminal domination from monotone
convergence `A_n -> A_infty`, and derive both from the source
square-minus-increasing martingale plus predictability of `A`.

V239 adds the source-facing stopped maximal-probability wrapper:
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
This combines the V236 stopped Kolmogorov/Doob probability conversion with the
V238 stopped terminal-square source estimate, so the stopped probability
bound now has textbook source assumptions.

V240 adds the raw/stopped survival probability split and source-facing raw
finite-horizon bound:
`durrett2019_theorem_4_5_7_runningAbsMax_eq_stopped_of_firstPredictableAbove_eq_top`,
`durrett2019_theorem_4_5_7_runningAbsMax_event_subset_terminal_tail_union_stopped`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_stopped`,
and
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
The theorem-facing probability inequality now has the textbook split
`P(max_{m <= n}|X_m| > a) <= P(A_infty > a^2) +
  a^{-2} E(A_infty ∧ a^2)` under the source hypotheses.

V241 adds the finite-horizon layer-cake handoff:
`durrett2019_theorem_4_5_7_lintegral_le_lintegral_tail_bound_lt` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_terminal_tail_add_min_terminal_lintegral_of_source_square_minus_martingale_monotone_terminal`.
This converts the V240 probability inequality into a finite-horizon
extended-expectation inequality.  The stochastic side is now connected to the
textbook's Fubini/calculus side.

V242 adds the first deterministic RHS bridge:
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral` and
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral_of_integrable`.
This formalizes Durrett's line
`P(A_infty > a^2) = P(sqrt A_infty > a)`, integrated over `a > 0`.

V243 adds the second-RHS truncation layer-cake bridge:
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral`,
`durrett2019_theorem_4_5_7_terminal_nonneg_of_initial_zero_monotone_tendsto`,
and
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral_of_source_monotone_terminal`.
This formalizes the line
`E(A_infty ∧ a^2) = ∫_0^∞ P(b < A_infty, b < a^2) db`.

V244 adds the weighted second-RHS double-integral handoff:
`durrett2019_theorem_4_5_7_set_lintegral_div_toNNReal_sq`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral_of_source_monotone_terminal`.
This moves the `a^{-2}` factor inside the layer-cake integral and leaves the
remaining second-RHS work as Tonelli plus the calculus identity
`∫_{sqrt b}^∞ a^{-2} da = 1 / sqrt b`.

V245 adds the source-level Tonelli swap layer:
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable_of_aemeasurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_aemeasurable`,
and
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_integrable`.
This discharges the product-measurability and Tonelli-order swap from the
source `Integrable A_infty` hypothesis.

V246 adds the square-root weighted-tail layer-cake endpoint:
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_integrable`,
and
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_source_monotone_terminal`.
This gives the exact `p = 1/2` layer-cake target that the second-RHS calculus
step must match.

V247 adds the inverse-square calculus and denominator normalization layer:
`durrett2019_theorem_4_5_7_inv_sq_weight_of_toNNReal_sq`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_rpow_neg_two`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_rpow_neg_two`,
`durrett2019_theorem_4_5_7_ofReal_sqrt_inv_eq_rpow_half_sub_one`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_toNNReal_sq_inv_eq_tail_weight`,
and
`durrett2019_theorem_4_5_7_const_div_lintegral_Ioi_sqrt_toNNReal_sq`.
This discharges the exact denominator/calculus part of the fixed-`b` inner
integral once the event split has restricted the `a` integral to
`a > sqrt b`.

V248 adds the fixed-`b` event-split inner-integral layer:
`durrett2019_theorem_4_5_7_lintegral_Ioi_zero_indicator_Ioi_sqrt` and
`durrett2019_theorem_4_5_7_tail_cut_inner_lintegral_eq_tail_weight`.
This proves that the Tonelli inner integral equals the terminal tail
probability times the `p = 1/2` layer-cake weight.

V249 adds the outer second-RHS assembly:
`durrett2019_theorem_4_5_7_tail_cut_double_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral_of_source_monotone_terminal`.
This proves the full second deterministic RHS term is `2 * E sqrt(A_infty)`.

V250 adds the finite-horizon endpoint:
`durrett2019_theorem_4_5_7_terminal_tail_sq_measure_aemeasurable` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`.
This proves the textbook constant `3` bound for every finite running maximum.

Next aggressive step: continue Durrett Theorem 4.5.7 by proving the monotone
finite-horizon-to-`sup_n` endpoint from V250 and `durrett2019_runningAbsMax`
monotonicity.  Do not start by formalizing the full
Friedman urn state process unless it directly reuses the compiled 4.5.5 ratio
package.  Do not revisit raw clock pointwise monotonicity, direct martingale
finite-limit assumptions, denominator divergence on `limsup`, final 4.5.5
ratio packaging, or the V236 Doob/Kolmogorov probability conversion.  Do not
route back to the V240 raw/stopped split, the V241 layer-cake handoff, the V242
first-RHS layer-cake bridge, the V243 truncated-terminal layer-cake bridge,
the V244 weighted double-integral handoff,
the V245 Tonelli/measurability swap layer,
the V246 square-root weighted-tail endpoint,
the V247 inverse-square denominator calculus,
the V248 fixed-`b` inner integral,
the V249 second-RHS assembly,
the V250 finite-horizon aggregation,
stopped running-maximum boundedness,
stopped predictability, exact Theorem 4.5.2 source packaging, deterministic
Exercise 4.4.11 normalizers, reciprocal predictability/bounds,
scaled-summability-to-transform plumbing, conditional variance pull-out, scalar
interval comparison, finite clock comparison, deterministic summability
packaging, random pathwise summability packaging, integrated finite-sum/Fubini
summability plumbing, V214-to-V209 endpoint wiring, tail-integral-to-clock-bound
packaging, transform `MemLp` packaging, scaled-square integrability packaging,
increment-square integrability packaging, variance-ratio integrability
packaging, finite random clock-integrability packaging,
interval-integrability packaging, normalizer-increment packaging,
reciprocal-square continuity packaging, lower-bound/no-zero packaging,
normalizer-divergence-from-clock packaging, deterministic normalizer-divergence
packaging, event-local random-normalizer packaging, Theorem 4.5.5 ratio
algebra, finite-limit denominator bridges, Chapter 2.1, or
Theorem 2.4.9 unless
Theorem 4.5.5 exposes a strictly stronger missing primitive.

Treat Chapter 2.1 independence/product/convolution support, Theorem 2.2.1
variance-sum support, Borel-Cantelli, Theorem 2.4.1 strong-law wrappers, and
the full Theorem 2.4.9 empirical-CDF route as compiled support.  Do not redo or
route back to them unless a later theorem explicitly needs a missing primitive.

Closed Chapter 2 support through V200 includes:
`durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_eq_of_uncorrelated`,
`durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_le_of_uncorrelated`,
`durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_eq_of_iIndepFun`,
`durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_le_of_iIndepFun`,
`durrett2019_theorem_2_2_3_integral_invNatMul_rangeSum_eq`,
`durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_uncorrelated`,
`durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_iIndepFun`,
`durrett2019_lemma_2_2_2_tendstoInMeasure_of_tendsto_eLpNorm_two`, and
`durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_tendsto_eLpNorm_centered`,
plus the final finite-bound-to-limit and source wrappers:
`durrett2019_theorem_2_2_3_lpNorm_two_le_sqrt_of_integral_sq_le`,
`durrett2019_theorem_2_2_3_eLpNorm_two_le_sqrt_of_integral_sq_le`,
`durrett2019_theorem_2_2_3_tendsto_eLpNorm_two_zero_of_integral_sq_le_const_div`,
`durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_integral_sq_bound`,
`durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_uncorrelated`,
`durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_iIndepFun`,
`durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_uncorrelated`, and
`durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_iIndepFun`, plus
Theorem 2.2.6 support:
`durrett2019_lemma_2_2_2_tendsto_eLpNorm_two_zero_of_integral_sq_tendsto_zero`,
`durrett2019_lemma_2_2_2_tendstoInMeasure_of_integral_sq_tendsto_zero`,
`durrett2019_theorem_2_2_6_integral_sq_centered_div_eq_variance_div_sq`, and
`durrett2019_theorem_2_2_6_tendstoInMeasure_centered_div_of_variance_div_sq`,
plus Theorem 2.2.11 truncation support:
`durrett2019_theorem_2_2_11_truncated`,
`durrett2019_theorem_2_2_11_measurable_truncationMap`,
`durrett2019_theorem_2_2_11_measurable_truncated`,
`durrett2019_theorem_2_2_11_norm_truncated_le_abs_bound`,
`durrett2019_theorem_2_2_11_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_2_11_iIndepFun_truncated_of_iIndepFun`,
`durrett2019_theorem_2_2_11_rowSum`,
`durrett2019_theorem_2_2_11_truncatedRowSum`,
`durrett2019_theorem_2_2_11_rowSum_eq_truncatedRowSum_of_all_small`,
`durrett2019_theorem_2_2_11_rowSum_ne_truncatedRowSum_subset_tailUnion`,
`durrett2019_theorem_2_2_11_probReal_rowSum_ne_truncatedRowSum_le_tailSum`, and
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_truncatedRowSum_of_tailSum`,
plus the truncated-row variance and centering layer:
`durrett2019_theorem_2_2_11_truncatedMeanRowSum`,
`durrett2019_theorem_2_2_11_integral_truncatedRowSum_eq_truncatedMeanRowSum`,
`durrett2019_theorem_2_2_11_truncatedRowSum_memLp_two`,
`durrett2019_theorem_2_2_11_variance_truncatedRowSum_le_secondMomentSum`,
`durrett2019_theorem_2_2_11_variance_div_sq_tendsto_zero_of_truncatedSecondMoment`,
`durrett2019_theorem_2_2_11_tendstoInMeasure_truncatedRowSum_sub_mean_of_truncatedSecondMoment`,
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncated`,
and
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncatedSecondMoment`,
plus the original-row source-facing wrapper
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_iIndepFun`,
and the Theorem 2.2.12 specialization/display layer:
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_sub_truncatedMean_of_iIndepFun`,
`durrett2019_theorem_2_2_12_truncatedMean`,
`durrett2019_theorem_2_2_12_truncatedMeanRowSum_eq_nat_mul_truncatedMean_of_integral_eq`,
`durrett2019_theorem_2_2_12_integral_truncated_eq_truncatedMean_of_identDistrib`,
`durrett2019_theorem_2_2_12_truncatedMeanRowSum_eq_nat_mul_truncatedMean_of_identDistrib`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun`,
plus the row-to-single numeric reductions:
`durrett2019_theorem_2_2_12_tailSum_eq_nat_mul_tailProb_of_identDistrib`,
`durrett2019_theorem_2_2_12_tailSum_tendsto_zero_of_identDistrib`,
`durrett2019_theorem_2_2_12_nat_tail_tendsto_zero_of_real_tail`,
`durrett2019_theorem_2_2_12_integral_truncated_sq_eq_single_of_identDistrib`,
`durrett2019_theorem_2_2_12_truncatedSecondMoment_tendsto_zero_of_single`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_single`,
plus the real-tail source bridge
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_single_second`,
plus the first Lemma 2.2.13 and second-bound bridge layer:
`durrett2019_lemma_2_2_13_lintegral_rpow_tail_lt`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_eventual_bound`, and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_second_bound`,
plus the tail-average/Cesaro layer:
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_bounded_tendsto_zero`
and
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_real_tail`,
plus the automatic local-integrability and exact tail-average endpoint layer:
`durrett2019_theorem_2_2_12_tail_profile_integrableOn`,
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_real_tail_auto_integrable`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_tail_average_bound`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_tail_average_bound_auto_integrable`,
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_tail_average_bound`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_tail_average_bound_auto_integrable`,
plus truncated-tail event support:
`durrett2019_theorem_2_2_12_abs_truncated_le_abs`,
`durrett2019_theorem_2_2_12_abs_truncated_le_level`,
`durrett2019_theorem_2_2_12_truncated_tail_subset_original`,
`durrett2019_theorem_2_2_12_measureReal_truncated_tail_le_original`,
and
`durrett2019_theorem_2_2_12_measureReal_truncated_tail_eq_zero_of_level_le`,
plus the supplied-layer-cake comparison bridge
`durrett2019_theorem_2_2_12_tail_average_bound_of_truncated_layercake`,
plus the square-tail and radius-layer-cake support:
`durrett2019_theorem_2_2_12_truncated_sq_integrable`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_tail_sq`,
`durrett2019_theorem_2_2_12_sq_tail_event_eq_abs_tail`,
`durrett2019_theorem_2_2_12_measureReal_sq_tail_eq_abs_tail`,
`durrett2019_theorem_2_2_12_truncated_layercake_Ioc_of_Ioi`, and
`durrett2019_theorem_2_2_12_tail_average_bound_of_truncated_layercake_Ioi`,
plus the completed radius-layer-cake and source endpoint:
`durrett2019_lemma_2_2_13_lintegral_abs_sq_tail_lt`,
`durrett2019_lemma_2_2_13_integral_abs_sq_tail_lt`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius_lintegral`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius_eventually`,
`durrett2019_theorem_2_2_12_tail_average_bound_of_layercake`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_real_tail`, and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail`.

Do not route back to Chapter 2.1, Theorem 2.2.1, Theorem 2.2.3 scalar
plumbing, Theorem 2.2.6, Theorem 2.2.12 layer-cake, Chapter 3 wrappers, or
Theorem 2.4.9.  The active theorem-facing frontier is now exact
Theorem 4.5.2 source packaging in `Martingale.lean`, then the next Section 4.5
theorem.  Search
mathlib and local `StatInference` first; use
`origin/codex/vdvw-selected-cover-source` only as selective reference via
`git grep`/`git show` or an isolated worktree; do not merge it wholesale into
this lane.

Current compiled Chapter 4.2 support: Durrett-facing martingale,
submartingale, and supermartingale wrappers; Examples 4.2.1-4.2.3, including
quadratic, product, and normalized exponential martingales; Theorems
4.2.4/4.2.5 conditional-expectation wrappers; Theorem 4.2.6 convex-image and
`|X_n|^p` consequences; and Theorem 4.2.7 increasing-convex, positive-part,
and minimum-truncation consequences; and Theorem 4.2.8 predictable-transform
wrappers for submartingales, supermartingales, and nonnegative martingale
transforms; and Theorem 4.2.9 stopped-process wrappers for submartingales,
supermartingales, and martingales; and Theorem 4.2.10 upcrossing inequality
wrappers, including the textbook initial-positive-part subtraction display;
and Theorem 4.2.11 direct L1/eLpNorm convergence wrappers:
almost-sure existence, convergence to `ℱ.limitProcess`, L1 membership,
integrability of the limit, martingale specializations, and source-facing
positive-part-boundedness wrappers matching Durrett's `sup_n E X_n^+ < ∞`
hypothesis through a compiled `eLpNorm` bridge; and Theorem 4.2.12
nonnegative-supermartingale convergence, integrable-limit, Fatou expectation
bridge, and final existential source wrapper.  The first Theorem 4.3.1 support
packet now compiles: a shifted nonnegative stopped martingale converges almost
surely, and that stopped convergence transfers back to the original martingale
on the survival event `{N = ⊤}`.  The first-below instantiation also now
compiles: `N = inf {n : X_n ≤ -K}` is packaged as a stopping time, bounded
increments prove `0 ≤ X_{n ∧ N} + K + M`, and this feeds the stopped-shifted
bridge to get convergence on `{N = ⊤}`.  The bounded-below path bridge now
compiles by intersecting the first-below survival statements over countably
many natural thresholds.  The symmetric bounded-above bridge also now compiles
by applying the bounded-below bridge to the negated martingale, and the
one-sided-bounded union bridge is packaged.  The range-form event
classification now compiles: almost surely, either the martingale converges to
a finite real limit or its range is unbounded both below and above.  The
threshold-form oscillation wrapper also now compiles: on the nonconvergent
side, the path visits below and above every real threshold.  The exact
extended-real display for Theorem 4.3.1 also now compiles: almost surely, the
martingale either converges to a finite real limit or has `EReal` `liminf = ⊥`
and `EReal` `limsup = ⊤`, matching Durrett's `-∞/+∞` statement.  The
existence and formula part of Theorem 4.3.2 also now compiles by reusing
mathlib's `Mathlib.Probability.Martingale.Centering` API:
`X = martingalePart X + predictablePart X`, the martingale part is a
martingale, and the predictable part is predictable, increasing, starts at
zero, and has Durrett's finite-sum formula.
The uniqueness side of Theorem 4.3.2 also now compiles: any martingale plus
predictable zero-start decomposition of a process agrees with the canonical
`martingalePart`/`predictablePart` pair almost surely at each fixed time, and
two such decompositions of the same process agree almost surely at each fixed
time.
Example 4.3.3 and Theorem 4.3.4 also now compile via mathlib's generalized
Borel-Cantelli API: the counting-process martingale part is a martingale, the
martingale and predictable finite-sum formulas are packaged, the one-step
counting-process difference bound is exposed, and the conditional
Borel-Cantelli limsup/divergent-conditional-sum equivalence is source-facing.
The first Theorem 4.3.5 / Lemma 4.3.6 Radon-Nikodym packet also now compiles:
trimmed RN derivatives integrate over `ℱ n`-events to the original measure,
equal restricted set integrals imply the martingale property, the
likelihood-ratio process `d μ_n / d ν_n` is a martingale under the restricted
absolute-continuity hypotheses, and its nonnegative convergence follows from
Theorem 4.2.12.  The regular/singular decomposition layer of Theorem 4.3.5
also now compiles: the measure identity
`mu = nu.withDensity (mu.rnDeriv nu) + mu.singularPart nu`, the real-integral
identity with `(mu.rnDeriv nu).toReal`, and the source-shaped endpoint from a
supplied a.e. density identification plus a supplied singular-part restriction
are packaged.  The density-ratio/top-set source assembly also now compiles:
RN derivatives through any dominating measure `rho`, the special `mu + nu`
ratio, the source-shaped `Y/Z` ratio from a.e. identifications of `Y` and `Z`,
the singular-set endpoint, the `{X = infinity}` endpoint, and the final
source assembly from `Y = dmu/drho`, `Z = dnu/drho`, `X = Y/Z`, and top-set
separation.  The integral-representation identification layer also now
compiles: if a candidate `Y` represents `mu` by set integrals against `rho`,
then `Y = dmu/drho` a.e.; paired `Y`/`Z` integral representations transfer
these identities to `nu`-a.e.; and those representations feed the existing
ratio/top-set source assembly.  The generator-extension layer also now
compiles: finite-measure equality on a generating pi-system plus `univ`
extends to a `withDensity` identity, then to all measurable set-integral
identities, RN-derivative identification, paired `Y`/`Z` handoff, and the
ratio/top-set source endpoint.  The bounded-convergence generator-production
layer also now compiles: a uniformly bounded nonnegative density sequence with
an a.e. limit sends eventual restricted-density set-integral identities to
generator/univ identities, and the source endpoint consumes those identities
directly for `Y` and `Z`.  The trimmed-RN source sequence layer also now
compiles: if `s` is visible in some `ℱ m`, then all later trimmed RN
derivatives integrate over `s` to the original measure, and the source endpoint
is specialized to the actual trimmed RN derivative sequences.  The natural
dominating-measure boundedness layer also now compiles: for `rho = mu + nu`,
both trimmed RN derivative sequences are bounded by `1`, and the final source
endpoint is specialized to this bound automatically.  The real-convergence
handoff layer also now compiles: a one-bounded finite `ENNReal` sequence whose
`toReal` values converge to a finite target converges in `ENNReal`, and the
`mu + nu` source endpoint now accepts real-valued convergence hypotheses for
the two trimmed RN derivative sequences.  The bounded real-martingale layer
also now compiles: a real martingale with entries norm-bounded by `1` has the
L1/eLpNorm bound required by Theorem 4.2.11, and both natural
`mu + nu` trimmed RN `toReal` sequences converge to their filtration limit
processes.  The canonical limit-density endpoint also now compiles: those real
limit processes are packaged as finite nonnegative `ENNReal` density
candidates, shown a.e. measurable and finite, and fed to the existing
`mu + nu` `toReal` source endpoint.  The canonical-ratio endpoint also now
compiles: choosing `X` as the ratio of the two canonical limit densities
discharges the `X = Y / Z` source obligation automatically.  The denominator
and singular-support top-set layers also now compile: common-density
representations prove `nu {Y/Z = infinity} = 0`, absolute continuity of
`mu.restrict {Y/Z = infinity}^c` with respect to `nu`, and hence
`mu.singularPart nu {Y/Z = infinity}^c = 0`; the generator-level and canonical
`mu + nu` endpoints now discharge both top-set obligations automatically.  The
full canonical-ratio real identity for Theorem 4.3.5 now compiles.  The first
Example 4.3.7 finite-partition packet also now compiles: the elementary
partition likelihood approximation is defined, proved measurable, proved equal
to the cell ratio on each disjoint cell, and shown to integrate over each cell
to the numerator cell mass under the textbook finite-cell absolute-continuity
condition; its finite-union and generator-facing endpoint now also compile,
so finite unions of cells have the correct set integral and a pi-system
generator made of such finite unions yields
`mu = nu.withDensity finitePartitionLikelihood`.  The first Theorem 4.3.8
Kakutani finite-product packet also now compiles: the finite-coordinate
likelihood is defined as the product of one-coordinate densities, proved
measurable, proved to have the correct set integral on measurable rectangles
under `Measure.pi`, and packaged as a finite product-law `withDensity`
identity.  The infinite-product cylinder/restriction handoff for Theorem 4.3.8
also now compiles: the finite product likelihood pulled back to an infinite
product space is measurable, finite-coordinate restrictions of
`Measure.infinitePi` have the finite product likelihood as a `withDensity`
ratio, and the pulled-back likelihood integrates over measurable cylinders to
the numerator infinite-product measure of the cylinder.  The Hellinger
factorization layer also now compiles: the square-root power of the finite
product likelihood is the product of the one-coordinate square-root powers, the
finite-coordinate Hellinger integral factors under `Measure.pi`, and the same
factorization is pulled back to finite-coordinate cylinders under
`Measure.infinitePi`.  The zero-product Fatou layer also now compiles: if the
finite likelihoods converge a.e. and their Hellinger integrals tend to zero,
then the limiting likelihood is zero a.e.; the source-facing cylinder
likelihood handoff consumes finite Hellinger products directly.  The
zero-product singularity bridge also now compiles: a Theorem 4.3.5 source
real-identity plus `X = 0` denominator-a.e. gives mutual singularity, with
top-set and Hellinger/cylinder-product handoffs.  The positive-product
absolute-continuity bridge also now compiles: a source real-identity with no
numerator mass on the infinite-density top set gives `mu << nu`, and paired
source real-identities give absolute continuity in both directions.  The first
final branch assemblers also now compile: zero Hellinger-products plus the
top-set identity give mutual singularity, and paired top-set identities with no
top-set numerator mass give absolute continuity in both directions.  The
positive-branch eliminator now also compiles: mutual singularity forces the
limiting likelihood to vanish a.e.; hence a source dichotomy plus a nonzero
likelihood input, or a null zero-set input, collapses to `mu << nu`.  The
positive mass consumers also now compile: nonzero `lintegral` of the limiting
likelihood, or the mass-one input `lintegral X = 1`, feeds the same
absolute-continuity conclusion.  The finite cylinder-likelihood mass handoff
also now compiles: every pulled-back finite likelihood integrates to one, and
convergence of these integrals to the limiting likelihood mass gives the
mass-one input consumed by the positive branch.  The positive-product L1
handoff now also compiles: real-valued L1 convergence of finite cylinder
likelihoods to the limiting likelihood gives the finite-cylinder integral
convergence input, and hence collapses the source dichotomy to the
absolute-continuity branch.  The positive-product Cauchy support now also
compiles: pairwise L1 tail `liminf` control plus pointwise convergence of the
cylinder likelihoods to the limiting likelihood gives the L1 convergence input
and hence the same absolute-continuity conclusion.  The Hellinger-tail bound
consumer layer also now compiles: the textbook bound
`sqrt (8 * (1 - tail n))` tends to zero when the tail Hellinger affinities tend
to one, eventual L1 bounds by this expression imply the compiled
pairwise-`liminf` hypothesis, and the final cylinder positive branch consumes
this Hellinger-tail bound directly.  The scalar finite square-root
Pythagorean identity, concrete cylinder `diffSq + 2 * overlap <= 2`
estimate, and lower-bound-only overlap Cauchy handoff now also compile.  The
finite-coordinate product integral, exact nested square-root overlap
factorization, and finite Hellinger tail-product to concrete overlap lower
bound handoff now also compile.  The HasProd/Multipliable prefix-tail
instantiation now also compiles, including the standard `Finset.range n`
exhaustion handoff that feeds the finite tail-product Cauchy consumer.  The
finite tail-product lower bound from positive prefix/tail monotonicity now
also compiles, including the final standard `Finset.range n` positive-product
pairwise-liminf consumer from `HasProd`, `P ≠ 0`, `P ≠ ∞`, and
one-coordinate Hellinger affinities bounded by one.  The source-density
one-coordinate Hellinger affinity bound `≤ 1` now also compiles, along with
the normalized positive-product tail bound `tail n ≤ 1` and a standard
positive-product range pairwise-liminf consumer that derives both facts
directly from `μ i = (ν i).withDensity (q i)`.  The standard
`Finset.range n` positive-product absolute-continuity handoff now also
compiles from the source-density `HasProd` hypotheses, finite-cylinder
convergence data, and the supplied dichotomy/top-set inputs.  The a.e.-finite
no-top source bridge now also compiles, including a standard
`Finset.range n` source-density `HasProd` absolute-continuity handoff that
takes `X ≠ ∞` a.e. instead of a prepackaged top-set-null hypothesis.
Kolmogorov tail-event zero-one support for independent sigma-fields now also
compiles, including zero-set-not-full to zero-set-null and the corresponding
positive-branch dichotomy eliminator.
The lower-integral source bridge now also compiles: a tail zero set plus
`∫⁻ X ≠ 0` automatically gives zero-set-not-full, zero-set-null, not-a.e.-zero,
and the positive-branch dichotomy conclusion.  The every-tail-block
measurability bridge now also compiles: if an event, and in particular the
limiting-likelihood zero set, is measurable from every tail block
`⨆ i ≥ n, s i`, then it is measurable in the `limsup` tail sigma-field; this
feeds the lower-integral zero-set-null and absolute-continuity consumers.
The tail-coordinate support layer now also compiles: coordinate sigma-fields
and tail-coordinate sigma-fields on sequence space are packaged, every
tail-coordinate map is measurable from its tail sigma-field, finite cylinder
likelihoods using only coordinates from `n` onward have tail-coordinate
measurability, their zero sets are tail-coordinate measurable, and a
zero-set equality with tail-coordinate measurable candidates gives
every-tail-coordinate measurability for a limiting likelihood.  The
finite-prefix zero-set algebra layer now also compiles: if
`X = C * Y` pointwise and the finite-prefix factor `C` is nonzero, then
`{X = 0} = {Y = 0}`; finite cylinder likelihoods are nonzero under the
source coordinate-density nonzero hypotheses; and the prefix-cylinder
factorization handoff turns a tail-coordinate measurable `Y` into
every-tail-coordinate measurability of `{X = 0}`.  The prefix/tail finite-block
limit layer now also compiles: `range m` cylinder likelihoods factor into
`range n` prefixes times `Ico n m` tail blocks; finite tail-block likelihoods
and their pointwise limits are tail-coordinate measurable; convergence of full
prefixes and tail blocks gives the limiting prefix/tail factorization under
the finite-prefix no-top side condition; and the resulting tail-block-limit
zero-set handoff feeds the compiled every-tail-coordinate measurability
consumer.  The side-condition source layer now also compiles: pointwise finite
coordinate densities give finite prefix likelihoods, and pointwise finite plus
nonzero coordinate densities feed the tail-block zero-set handoff directly.

Next theorem-sized packet: treat the Example 4.3.7 finite partition generator
layer, the Theorem 4.3.8 finite-product likelihood/`withDensity` layer, and the
infinite-product cylinder/restriction and Hellinger factorization handoffs as
closed support, and treat the zero-product Fatou endpoint, singularity bridge,
positive-product absolute-continuity bridge, and final branch assemblers as
compiled support, together with the positive-branch eliminator.
Also treat the lintegral-nonzero and mass-one positive-branch consumers as
compiled support, along with the finite-cylinder mass-one and
integral-convergence handoffs, the positive-product L1-to-integral handoff,
the pairwise-liminf Cauchy-to-L1 handoff, the Hellinger-tail-bound consumer
into the positive branch, the square-root/Cauchy-Schwarz Hellinger L1 bridge
into that consumer, and the normalized positive-prefix product-tail convergence
bridge.  Also treat the concrete pointwise and cylinder likelihood square-root
factorization layer, together with the concrete cylinder Cauchy handoff using
the textbook factors `sqrt X_n + sqrt X_m` and `sqrt X_n - sqrt X_m`, as
compiled support.  Also treat the square-integral estimate for
`sqrt X_n + sqrt X_m`, and the resulting concrete Cauchy wrapper that only
requires the `sqrt X_n - sqrt X_m` square estimate, as compiled support.
Also treat the scalar/cylinder Pythagorean overlap layer proving
`diffSq + 2 * overlap <= 2`, the overlap-to-tail algebra bridge converting
that inequality and `tail <= overlap` into `diffSq <= 2 * (1 - tail)`,
together with the concrete cylinder overlap handoff and lower-bound-only
cylinder Cauchy handoff, as compiled support.  Also treat the
finite-coordinate product integral, exact nested square-root overlap
factorization, and finite Hellinger tail-product overlap handoff as compiled
support.  Also treat the HasProd/Multipliable prefix-tail bridge and the
standard `Finset.range n` HasProd-to-pairwise-liminf handoff as compiled
support.  Also treat the finite tail-product lower bound from positive
prefix/tail monotonicity and the standard positive-product range consumer as
compiled support.  Also treat the source-density one-coordinate Hellinger
affinity bound, the normalized positive-product tail `≤ 1` bridge, and the
standard source-density positive-product range consumer as compiled support.
Also treat the standard `Finset.range n` source-density `HasProd`
positive-product absolute-continuity handoff as compiled support.
Also treat the a.e.-finite no-top source bridge and its standard
`Finset.range n` source-density `HasProd` absolute-continuity consumer as
compiled support.
Also treat the Kolmogorov tail-event zero-one support, the zero-set-not-full
to zero-set-null bridge, and the corresponding positive-branch dichotomy
eliminator as compiled support.
Also treat the lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0`
to zero-set-not-full, zero-set-null, not-a.e.-zero, and absolute continuity as
compiled support.
Also treat the every-tail-block measurability bridge into `limsup` tail
measurability, plus its zero-set-null and absolute-continuity consumers, as
compiled support.
Also treat the tail-coordinate sigma-field layer, finite tail cylinder
likelihood measurability, finite tail cylinder zero-set measurability, and the
zero-set-equality handoff to every-tail-coordinate measurability as compiled
support.
Also treat the finite-prefix zero-set algebra layer, finite cylinder
likelihood nonzero bridge, and prefix-cylinder factorization handoff to
every-tail-coordinate measurability as compiled support.
Also treat the finite prefix/tail cylinder-likelihood factorization, finite
tail-block likelihood measurability, pointwise tail-block-limit measurability,
limiting prefix/tail factorization, and tail-block-limit zero-set handoff as
compiled support.
Also treat the pointwise coordinate finite/nonzero side-condition bridge into
the tail-block zero-set handoff as compiled support.
Also treat the range-limit tail handoff as compiled support: pointwise
convergence of the standard full-prefix likelihoods, together with pointwise
finite and nonzero coordinate densities, supplies the canonical tail-block
limit candidate `X / prefix_n` and hence the tail-coordinate zero-set
measurability handoff.
Also treat the range-limit positive-branch consumers as compiled support:
under the denominator infinite product law, coordinate sigma-fields are
independent; ENNReal full-prefix convergence to an a.e. finite limit supplies
the real-valued convergence input for the L1/Cauchy branch; pointwise finite
coordinate densities discharge the pairwise no-top side condition; and
pointwise full-prefix convergence plus finite/nonzero coordinate densities and
`∫⁻ X ≠ 0` feed the tail-zero-set positive-branch eliminator.
Also treat the canonical-ratio handoff into the range-limit positive branch as
compiled support: the canonical `mu + nu` ratio now supplies
`toReal = dmu/dnu` and the denominator top-set null input automatically for
both the Hellinger-product/L1 consumer and the lower-integral/nonzero consumer.
Also treat canonical-ratio real integrability and the real-valued full-prefix
convergence consumer as compiled support: for the Hellinger/product route, the
remaining convergence input is now the real-valued convergence of finite-prefix
likelihoods to `(canonicalRatio).toReal`, not an ENNReal convergence or a
separate integrability proof.
Also treat the quotient-limit bridge as compiled support: if finite prefix
likelihoods are identified a.e. with quotients of two real-convergent trimmed
density sequences, and the denominator limit is nonzero a.e., then their
real-valued limits are `(canonicalRatio).toReal`.
Also treat canonical prefix-filtration support as compiled support:
`durrett2019_theorem_4_3_8_prefixFiltration` is the filtration generated by
coordinates `0, ..., n - 1`; coordinates before `n` and the standard finite
prefix cylinder likelihood are measurable from it; and
`durrett2019_theorem_4_3_8_coordinateSigma_le_prefixFiltration` turns that
visibility into a sigma-field inclusion.
Also treat the canonical trimmed-prefix RN-ratio identity as compiled support:
`durrett2019_theorem_4_3_8_infiniteProduct_trim_prefix_withDensity_eq` gives the
finite prefix likelihood as the density of prefix-trimmed product laws, and
`durrett2019_theorem_4_3_8_cylinderLikelihood_trimmedPrefix_ratio_ae_all`
identifies every finite prefix likelihood with the quotient of the numerator
and denominator prefix-trimmed RN derivatives with respect to the common
trimmed dominating measure.
Also treat the denominator-limit nonzero bridge and canonical prefix convergence
handoff as compiled support:
`durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity_toReal_ne_zero`
proves the canonical denominator limit is nonzero in real form under the
denominator measure, and
`durrett2019_theorem_4_3_8_cylinderLikelihood_toReal_tendsto_canonicalRatio_of_trimmedPrefix_ratio`
turns the trimmed-prefix quotient identity into real-valued convergence of
finite-prefix likelihoods to the canonical ratio.  The positive Hellinger-product
wrapper
`durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_canonicalRatio_range_hasProd_density_trimmedPrefix`
now consumes this convergence directly.
Also treat the positive-product finite-limit side condition as compiled support:
`durrett2019_theorem_4_3_8_hasProd_limit_ne_top_of_le_one` derives `P ≠ ∞`
from the `HasProd` limit and one-coordinate Hellinger affinity bounds `≤ 1`,
and
`durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_canonicalRatio_range_hasProd_density_trimmedPrefix_positive`
uses it to remove the external `hPtop` input from the canonical positive-product
handoff.
Also treat the canonical product-tail and `tprod` positive-product handoff as
compiled support:
`durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_canonicalRatio_range_hasProd_density_trimmedPrefix_positive_canonicalTail`
removes the auxiliary `tail` parameter and tail-quotient equality, and
`durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_canonicalRatio_range_tprod_density_trimmedPrefix_positive_canonicalTail`
phrases the source handoff with `Multipliable` and the actual infinite product
`∏' i, ∫⁻ y, (q i y)^((1 : ℝ) / 2) ∂ν i`; the matching `_pos_`
wrappers accept the textbook-style hypothesis that this infinite Hellinger
product is strictly positive.
Also treat the first zero/positive Kakutani product criterion wrapper as
compiled support:
`durrett2019_theorem_4_3_8_range_hellinger_products_tendsto_zero_of_hasProd_zero`
turns `HasProd h 0` into finite-prefix Hellinger product convergence to zero,
`durrett2019_theorem_4_3_8_mutuallySingular_of_cylinderLikelihood_range_hasProd_zero`
feeds that into the singular branch, and
`durrett2019_theorem_4_3_8_canonicalRatio_range_hasProd_density_trimmedPrefix_zero_or_pos`
packages the canonical consequences: product zero gives mutual singularity,
while strictly positive product gives absolute continuity.
Also treat canonical ratio measurability as compiled support:
`durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit_measurable`,
`durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit_measurable`,
the two corresponding limit-density measurability endpoints, and
`durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_measurable` prove that
the canonical `mu + nu` likelihood ratio is measurable.  The branch criterion
wrapper
`durrett2019_theorem_4_3_8_canonicalRatio_range_hasProd_density_trimmedPrefix_zero_or_pos_measurable`
therefore no longer asks for a separate canonical-ratio measurability input.
Also treat the ENNReal full-prefix convergence input as compiled support:
`durrett2019_theorem_4_3_8_cylinderLikelihood_range_tendsto_of_toReal_tendsto`
and its pointwise-finite-density source wrapper upgrade real-valued prefix
convergence to ENNReal convergence, and
`durrett2019_theorem_4_3_8_cylinderLikelihood_tendsto_canonicalRatio_of_trimmedPrefix_ratio`
discharges that convergence for the canonical trimmed-prefix RN-ratio
construction.  The closed branch wrapper
`durrett2019_theorem_4_3_8_canonicalRatio_range_hasProd_density_trimmedPrefix_zero_or_pos_closed`
now packages the zero/positive Kakutani consequences without separate
canonical-ratio measurability or full-prefix convergence inputs.
Also treat the textbook `tprod` branch packaging as compiled support:
`durrett2019_theorem_4_3_8_canonicalRatio_range_tprod_density_trimmedPrefix_zero_or_pos_closed`
phrases the closed zero/positive criterion using `Multipliable` and the actual
infinite Hellinger product `∏' i, ∫⁻ y, (q i y)^((1 : ℝ) / 2) ∂ν i`.
Also treat coordinate-finiteness discharge as compiled support:
`durrett2019_theorem_4_3_8_cylinderLikelihood_ae_ne_top_of_density`,
`durrett2019_theorem_4_3_8_cylinderLikelihood_range_ae_ne_top_of_density`, and
`durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_ne_top_of_density`
derive the finite-prefix no-top obligations from the likelihood integral-one
identities.  The theorem
`durrett2019_theorem_4_3_8_canonicalRatio_range_tprod_density_trimmedPrefix_zero_or_pos_no_top`
therefore packages the textbook `tprod` zero/positive branch without a separate
pointwise coordinate-finiteness hypothesis or ambient Kakutani dichotomy
input.  The direct source-identity likelihood-mass bridge
`durrett2019_theorem_4_3_8_absolutelyContinuous_of_source_real_identity_lintegral_eq_one`
and its cylinder/L1/pairwise/range `HasProd` wrappers are compiled support.
Move forward from Theorem 4.3.8.  Do not add another repackaging of the
already closed `HasProd`, `tprod`, no-top, or no-dichotomy branch criterion.
Next aggressive target: continue the next textbook block.  Lemma 4.3.9 and
the branching-process martingale `Z_n / μ^n` have their conditional-expectation core
`durrett2019_lemma_4_3_9_normalized_branchingProcess_martingale_of_condExp_succ`
as compiled support.  Section 4.4 Theorem 4.4.2 Doob maximal inequality now
also has nonnegative-submartingale, positive-part, and total positive-part
source wrappers:
`durrett2019_theorem_4_4_2_doob_maximal_inequality_nonnegative` and
`durrett2019_theorem_4_4_2_doob_maximal_inequality_positivePart`, and
`durrett2019_theorem_4_4_2_doob_maximal_inequality_positivePart_total`.
Example 4.4.3 now has the squared-threshold Kolmogorov maximal wrapper
`durrett2019_example_4_4_3_kolmogorov_maximal_inequality_square`, its
probability-display division form
`durrett2019_example_4_4_3_kolmogorov_maximal_inequality_square_div`, and the
absolute-maximum variance-bound display
`durrett2019_example_4_4_3_kolmogorov_maximal_inequality_abs_varianceBound`.
Theorem 4.4.4 now has the martingale absolute-maximum consequence bridge
`durrett2019_theorem_4_4_4_martingale_absMax_eLpNorm_of_positivePart_bound`,
and its p-th-power source layer now compiles via
`durrett2019_theorem_4_4_4_eLpNorm_le_of_lintegral_rpow_enorm_le`,
`durrett2019_theorem_4_4_4_positivePart_eLpNorm_bound_of_lintegral_rpow_enorm_le`,
and
`durrett2019_theorem_4_4_4_martingale_absMax_eLpNorm_of_positivePart_lintegral_bound`.
The layer-cake and Hölder proof body now also has compiled support:
`durrett2019_theorem_4_4_4_positivePart_layercake_lintegral_rpow_enorm`,
`durrett2019_theorem_4_4_4_positivePart_doob_layercake_integrand_bound`, and
`durrett2019_theorem_4_4_4_positivePart_holder_integral_bound`.
The set-integral to restricted-`lintegral` and integrated Doob layer-cake
bridge now also compile:
`durrett2019_theorem_4_4_4_positivePart_event_setIntegral_eq_lintegral`,
`durrett2019_theorem_4_4_4_positivePart_doob_layercake_lintegral_integrand_bound`,
and
`durrett2019_theorem_4_4_4_positivePart_layercake_doob_lintegral_bound`.
The weighted/Fubini identification now also compiles through the withDensity
layer-cake route:
`durrett2019_theorem_4_4_4_weighted_layercake_withDensity`,
`durrett2019_theorem_4_4_4_weighted_layercake_withDensity_rpow`,
`durrett2019_theorem_4_4_4_weighted_layercake_lintegral_rpow`,
`durrett2019_theorem_4_4_4_positivePart_weighted_threshold_lintegral_eq`, and
`durrett2019_theorem_4_4_4_positivePart_weighted_threshold_lintegral_base_eq`.
The coefficient extraction, assembled Doob/Fubini/Hölder endpoint, and finite
scalar-cancellation layer now also compile:
`durrett2019_theorem_4_4_4_weighted_layercake_kernel_eq_inv_mul`,
`durrett2019_theorem_4_4_4_weighted_layercake_lintegral_coeff`,
`durrett2019_theorem_4_4_4_positivePart_weighted_threshold_lintegral_coeff_eq`,
`durrett2019_theorem_4_4_4_positivePart_layercake_doob_holder_bound`,
`durrett2019_theorem_4_4_4_scalar_cancel_holder_bound`,
`durrett2019_theorem_4_4_4_positivePart_lintegral_rpow_bound_of_finite`, and
`durrett2019_theorem_4_4_4_positivePart_eLpNorm_bound_of_finite`.
The bounded-truncation layer now also compiles:
`durrett2019_theorem_4_4_4_nonnegative_layercake_lintegral_rpow_enorm`,
`durrett2019_theorem_4_4_4_positivePart_holder_integral_bound_of_measurable`,
`durrett2019_theorem_4_4_4_positivePart_truncated_doob_layercake_lintegral_integrand_bound`,
`durrett2019_theorem_4_4_4_positivePart_truncated_layercake_doob_lintegral_bound`,
`durrett2019_theorem_4_4_4_positivePart_truncated_layercake_doob_holder_bound`,
`durrett2019_theorem_4_4_4_positivePart_truncated_lintegral_rpow_ne_top`, and
`durrett2019_theorem_4_4_4_positivePart_truncated_lintegral_rpow_bound`.
The monotone handoff and final source-facing Theorem 4.4.4 wrappers now compile:
`durrett2019_theorem_4_4_4_lintegral_rpow_enorm_le_of_nat_truncations`,
`durrett2019_theorem_4_4_4_positivePart_lintegral_rpow_bound`,
`durrett2019_theorem_4_4_4_positivePart_eLpNorm_bound`, and
`durrett2019_theorem_4_4_4_martingale_absMax_eLpNorm_bound`.
The first Theorem 4.4.6 bridge now also compiles:
`durrett2019_theorem_4_4_6_martingale_eLpNorm_one_bdd_of_eLpNorm_p_bdd`,
`durrett2019_theorem_4_4_6_martingale_ae_tendsto_limitProcess_of_eLpNorm_p_bdd`,
`durrett2019_theorem_4_4_6_martingale_limitProcess_memLp_of_eLpNorm_p_bdd`,
and
`durrett2019_theorem_4_4_6_martingale_ae_tendsto_and_limitProcess_memLp_of_eLpNorm_p_bdd`.
The supplied-domination endpoint now also compiles:
`durrett2019_theorem_4_4_6_unifIntegrable_of_memLp_dominated` and
`durrett2019_theorem_4_4_6_martingale_tendsto_eLpNorm_of_memLp_dominated`.
The finite running-maximum assembly now also compiles:
`durrett2019_runningAbsMax`,
`durrett2019_theorem_4_4_6_runningAbsMax_eLpNorm_bound_of_eLpNorm_bdd`,
`durrett2019_theorem_4_4_6_runningAbsMax_limit_memLp_and_domination`, and
`durrett2019_theorem_4_4_6_martingale_tendsto_eLpNorm_of_runningAbsMax_limit`.
The Section 4.5.1 finite second-moment layer now also compiles:
`durrett2019_integral_sq_le_of_eLpNorm_two_le_ofReal`,
`durrett2019_theorem_4_5_1_runningAbsMax_eLpNorm_two_le_of_integral_sq_le`,
`durrett2019_theorem_4_5_1_runningAbsMax_memLp_two_of_integral_sq_le`,
`durrett2019_theorem_4_5_1_runningAbsMax_integral_sq_le_of_integral_sq_le`, and
`durrett2019_theorem_4_5_1_runningAbsMax_integral_sq_le_of_terminal_integral_sq_le`.
The Section 4.5.1 monotone iSup handoff now also compiles:
`durrett2019_runningAbsMax_nonneg`,
`durrett2019_runningAbsMax_measurable`,
`durrett2019_runningAbsMax_lintegral_iSup_sq_le_of_integral_sq_le`, and
`durrett2019_theorem_4_5_1_lintegral_iSup_runningAbsMax_sq_le_of_terminal_integral_sq_le`.
The Section 4.5.1 running-supremum square handoff now also compiles:
`durrett2019_iSup_ofReal_runningAbsMax_sq_eq_ofReal_runningAbsSup_sq_of_bddAbove`,
`durrett2019_lintegral_iSup_runningAbsMax_sq_eq_lintegral_runningAbsSup_sq_of_ae_bddAbove`,
and
`durrett2019_theorem_4_5_1_lintegral_runningAbsSup_sq_le_of_terminal_integral_sq_le`.
The Section 4.5.1 supplied increasing-process source handoff now also compiles:
`durrett2019_theorem_4_5_1_lintegral_runningAbsSup_sq_le_of_increasing_process_integral_bound`
and
`durrett2019_theorem_4_5_1_lintegral_runningAbsSup_sq_le_of_increasing_process_integral_identity`.
The Section 4.5.1 canonical square-process predictable-part handoff now also
compiles:
`durrett2019_martingale_integral_eq_initial`,
`durrett2019_theorem_4_5_1_square_integral_eq_predictablePart_square_of_initial_zero`,
and
`durrett2019_theorem_4_5_1_lintegral_runningAbsSup_sq_le_of_predictablePart_square_integral_bound`.
The Section 4.5.1 terminal monotone-limit handoff now also compiles:
`durrett2019_ae_le_of_ae_monotone_tendsto_atTop`,
`durrett2019_theorem_4_5_1_predictablePart_square_integral_le_of_ae_le`, and
`durrett2019_theorem_4_5_1_lintegral_runningAbsSup_sq_le_of_predictablePart_square_tendsto`.
The Section 4.5.1 conditional-variance finite-sum display now also compiles:
`durrett2019_theorem_4_5_1_predictablePart_square_ae_eq_sum_conditional_variance`
and
`durrett2019_theorem_4_5_1_lintegral_runningAbsSup_sq_le_of_conditionalVariance_tendsto`.
The canonical running-maximum layer now also compiles:
`durrett2019_runningAbsSup`,
`durrett2019_runningAbsMax_mono`,
`durrett2019_runningAbsSup_aestronglyMeasurable`,
`durrett2019_runningAbsMax_tendsto_runningAbsSup_of_bddAbove`,
`durrett2019_runningAbsMax_ae_tendsto_runningAbsSup_of_ae_bddAbove`, and
`durrett2019_theorem_4_4_6_martingale_tendsto_eLpNorm_of_runningAbsSup_bddAbove`.
The final Theorem 4.4.6 endpoint now also compiles:
`durrett2019_bddAbove_range_of_mono_nonneg_liminf_enorm_lt_top`,
`durrett2019_runningAbsMax_ae_bddAbove_of_eLpNorm_bound`,
`durrett2019_theorem_4_4_6_runningAbsMax_ae_bddAbove_of_eLpNorm_bdd`, and
`durrett2019_theorem_4_4_6_martingale_tendsto_eLpNorm_of_eLpNorm_bdd`.
Theorem 4.4.7 now also compiles:
`durrett2019_theorem_4_4_7_martingale_increment_mul_integral_eq_zero` and
`durrett2019_theorem_4_4_7_martingale_increment_increment_integral_eq_zero`.
Theorem 4.4.8 now also compiles:
`durrett2019_integrable_sq_of_memLp_two` and
`durrett2019_theorem_4_4_8_martingale_conditional_variance_formula`.
Example 4.4.9 now also compiles through its conditional and integrated
second-moment recurrence layer:
`durrett2019_example_4_4_9_conditional_second_moment_from_variance`,
`durrett2019_example_4_4_9_branchingProcess_conditional_second_moment`, and
`durrett2019_example_4_4_9_branchingProcess_second_moment_integral_recurrence`,
and now its finite-sum display layer:
`durrett2019_example_4_4_9_second_moment_finite_sum_of_recurrence` and
`durrett2019_example_4_4_9_branchingProcess_second_moment_integral_finite_sum`.
The shifted geometric-sum and uniform second-moment bound now also compile:
`durrett2019_example_4_4_9_shifted_geometric_sum_le` and
`durrett2019_example_4_4_9_branchingProcess_second_moment_integral_uniform_bound`.
The `eLpNorm 2` handoff and `L^2` convergence endpoint now also compile:
`durrett2019_eLpNorm_two_le_of_integral_sq_le`,
`durrett2019_example_4_4_9_branchingProcess_eLpNorm_two_uniform_bound`, and
`durrett2019_example_4_4_9_branchingProcess_tendsto_eLpNorm_two`.
The expectation-convergence handoff, `E X = 1`, and nonzero-limit endpoint now
also compile:
`durrett2019_tendsto_integral_of_tendsto_eLpNorm_two`,
`durrett2019_example_4_4_9_branchingProcess_integral_tendsto_limitProcess`,
`durrett2019_example_4_4_9_branchingProcess_limitProcess_integral_eq_one`, and
`durrett2019_example_4_4_9_branchingProcess_limitProcess_not_ae_eq_zero`.
Exercise 4.4.5's conditional-variance variant now also compiles:
`durrett2019_exercise_4_4_5_condExp_square_difference_integral`.
Theorem 4.4.1 optional-stopping wrappers, Exercise 4.4.6's stopped-variance
small-ball handoff, the finite first-exit/small-ball assembly, the
bounded-increment overshoot/source wrapper, and the square-martingale wrapper
with automatic stopped integrability, and the deterministic variance-clock
wrapper plus exact-denominator wrapper now also compile.  Historical target
closed; current target is Exercise 4.4.11's martingale-transform
bounded-variance corollary.  Do not detour back into full
Galton-Watson random-sum/extinction infrastructure unless a local API makes it
cheap.
Do not redo the already compiled ENNReal prefix convergence, canonical
measurability, RN martingale/convergence
bridge, regular/singular decomposition identity, density-ratio bridge, top-set
endpoint assembly, integral-representation to RN-derivative bridge,
generator-extension bridge, bounded-convergence generator-production bridge,
trimmed-RN eventual restricted-density bridge, `mu + nu` boundedness bridge,
real-to-`ENNReal` convergence-transfer bridge, bounded real-martingale
limitProcess convergence bridge, canonical limit-density endpoint, canonical
ratio endpoint, denominator-side top-set null endpoint, singular-support
top-set endpoint, full canonical-ratio real identity, canonical
`toReal = dmu/dnu` endpoint, canonical `toReal` integrability endpoint,
canonical quotient-limit convergence bridge, canonical prefix-filtration
measurability/inclusion support, canonical trimmed-prefix RN-ratio identity,
canonical denominator-limit nonzero bridge, canonical prefix convergence handoff,
positive-product finite-limit side-condition bridge,
canonical 4.3.8 positive-branch consumers, any Example 4.3.7
finite-partition likelihood, finite-union, or generator endpoint, the
finite-product likelihood/rectangle/`withDensity` layer, infinite-product
cylinder/restriction handoff, Hellinger factorization layer, zero-product Fatou
endpoint, zero-product singularity bridge, positive-product
absolute-continuity bridge, final branch assembler, or positive-branch
eliminator, lintegral-nonzero consumer, mass-one consumer, or finite-cylinder
mass handoff, or positive-product L1-to-integral handoff for Theorem 4.3.8.
Do not redo the pairwise-liminf Cauchy-to-L1 handoff.
Do not redo the Hellinger-tail-bound consumer layer.
Do not redo the square-root/Cauchy-Schwarz Hellinger L1 bridge.
Do not redo the normalized positive-prefix product-tail convergence bridge.
Do not redo the concrete pointwise or cylinder square-root factorization layer,
or the concrete cylinder Cauchy handoff.
Do not redo the `sqrt X_n + sqrt X_m` square-integral estimate.
Do not redo the overlap-to-tail `2 * (1 - tail)` algebra bridge.
Do not redo the concrete Pythagorean overlap inequality or lower-bound-only
overlap Cauchy handoff.
Do not redo the finite-coordinate product integral, exact nested overlap
factorization, or finite Hellinger tail-product overlap handoff.
Do not redo the HasProd/Multipliable prefix-tail bridge or the standard
`Finset.range n` HasProd-to-pairwise-liminf handoff.
Do not redo the canonical product-tail wrapper or the `Multipliable`/`∏'`
positive-product handoff, including the strict-positive product variants.
Do not redo the `HasProd h 0` finite-prefix Hellinger convergence bridge or the
first canonical zero/positive branch criterion wrapper.
Do not redo canonical `mu + nu` limit-density or canonical-ratio measurability.
Do not redo the every-tail-block measurability bridge into the `limsup` tail
sigma-field.
Do not redo the tail-coordinate sigma-field layer or finite tail cylinder
likelihood measurability layer.
Do not redo the finite-prefix zero-set algebra or prefix-cylinder zero-set
handoff layer.
Do not redo the finite prefix/tail cylinder-likelihood factorization,
tail-block-limit measurability, or tail-block-limit zero-set handoff layer.
Do not redo the pointwise finite/nonzero coordinate side-condition bridge.
Do not redo the range-limit tail handoff or the range-limit positive-branch
consumer wrappers.
Do not redo the finite tail-product lower bound from positive prefix/tail
monotonicity or the standard positive-product range consumer.
Do not redo the source-density one-coordinate Hellinger affinity `≤ 1` bound,
the normalized positive-product tail `≤ 1` bridge, or the standard
source-density positive-product range consumer.
Do not redo the standard `Finset.range n` source-density `HasProd`
positive-product absolute-continuity handoff.
Do not redo the a.e.-finite no-top bridge or the standard source-density
`HasProd` absolute-continuity consumer that uses it.
Do not redo the Kolmogorov tail-event zero-one support or the zero-set-not-full
positive-branch eliminator.
Do not redo the lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0`
to the positive-branch conclusion.
Defer Polya urn as a
model-specific construction unless a direct existing primitive is found.

Loop: fetch/rebase, read only the needed Durrett/source/API anchors, implement
one theorem-sized wrapper or bridge, run focused Lean, targeted build, diff
check, proof-hole scan, secret scan, and root build only when imports changed;
update route docs only if the frontier changes; commit and push.  Do not
route back to Chapter 2, Chapter 3, or solved Chapter 4.1 starter wrappers
unless the current theorem exposes a real dependency.  No automations or
subagents unless the user asks in the current turn.  Use a worktree only for
dirty, long, or disjoint local work.  Chat with the user bilingually; keep all
files, code, comments, docs, and commit messages in English.

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
- `durrett2019_theorem_2_1_11_canonical_iid_infinite_product_coordinates`
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
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_canonical_iid`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_range_sum`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_inv_mul_range_sum`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun`
- `durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun`
- `durrett2019_theorem_2_1_11_iid_sequence_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_hasLaw_infinitePi`
- `durrett2019_theorem_2_1_11_hasLaw_of_identDistrib_zero`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun_identDistrib`
- `durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun_identDistrib`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_pairwise_identDistrib`
- `durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_pairwise_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_pairwise_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_pairwise_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_pairwise_identDistrib`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_pairwise_identDistrib`
- `durrett2019_theorem_2_1_11_iIndepFun_hasLaw_infinitePi`
- `durrett2019_theorem_2_1_11_iid_hasLaw_infinitePi`
- `durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_infinitePi`
- `durrett2019_theorem_2_1_11_iid_iff_hasLaw_infinitePi`
- `durrett2019_theorem_2_1_11_iid_hasLaw_infinitePi_of_identDistrib`
- `durrett2019_theorem_2_1_11_iid_iff_hasLaw_infinitePi_of_identDistrib`
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
- `durrett2019_theorem_3_4_1_centralLimitTheorem_standardNormal`
- `durrett2019_theorem_3_4_1_centralLimitTheorem_sigmaSqrt`
- `durrett2019_theorem_3_4_1_centralLimitTheorem_muSigmaSqrt`
- `durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`
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
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder`
- `durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_cubic_of_abs_le_two`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_quadratic_of_two_le_abs`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_scalar`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le`
- `durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound_of_scalar`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_pointwiseTaylorRemainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_integrableSq`
- `durrett2019_lindebergFeller_min_taylor_remainder_le_split`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_oneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_remainderBound`
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
- `Durrett2019LindebergFellerAnalyticCertificate.of_remainderBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_integrableSq`
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
- `durrett2019_theorem_3_4_10_lindebergFeller_of_remainderBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_unitVariance_of_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`
- `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean`
- `durrett2019_theorem_3_10_7_canonicalProduct_explicitMean_normalization_eq_sum`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`
- `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_coordinateCovariance`
- `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_centeredProduct`
- `durrett2019_theorem_3_10_7_coordinateCovariance_eq_of_centeredProductSubMean`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`
- `durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
- `durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`
- `durrett2019_section_4_1_IsConditionalExpectationVersion`
- `durrett2019_section_4_1_condExp_isConditionalExpectationVersion`
- `durrett2019_example_4_1_3_self_isConditionalExpectationVersion`
- `durrett2019_example_4_1_3_condExp_eq_of_stronglyMeasurable`
- `durrett2019_example_4_1_3_condExp_const`
- `durrett2019_example_4_1_4_condExp_eq_integral_of_independent`
- `durrett2019_theorem_4_1_9_condExp_linear`
- `durrett2019_theorem_4_1_9_condExp_mono_real`
- `durrett2019_theorem_4_1_12_condExp_eq_of_larger_condExp_stronglyMeasurable`
- `durrett2019_theorem_4_1_13_condExp_tower_larger_of_smaller`
- `durrett2019_theorem_4_1_13_condExp_tower_smaller_of_larger`
- `durrett2019_theorem_4_1_14_condExp_mul_of_stronglyMeasurable_left`
- `durrett2019_theorem_4_1_10_conditional_jensen_real`
- `durrett2019_theorem_4_1_11_condExp_L1_contraction_real`
- `durrett2019_theorem_4_1_11_condExp_L2_contraction`
- `durrett2019_theorem_4_1_11_condExp_memLp_two`
- `durrett2019_theorem_4_1_15_condExpL2_residual_inner_eq_zero`
- `durrett2019_theorem_4_1_15_condExpL2_minimal_norm_le`
- `durrett2019_theorem_4_1_15_condExpL2_ae_eq_condExp`

Existing reusable probability-measure modules cover much of the early-book
substrate:

- generated sigma-fields and pi-system/extensionality wrappers;
- product measure and independent-copy/Fubini wrappers;
- first and second Borel-Cantelli wrappers;
- real-valued strong-law wrappers;
- tail/layer-cake/Markov/dominated-convergence wrappers;
- weak convergence and finite-dimensional law wrappers;
- empirical-process fixed-endpoint empirical-CDF support.

The immediate blocker is now Chapter 4.2 martingales.  The prior large Chapter
2, Chapter 3, and Chapter 4.1 targets are closed as source wrappers:

- Durrett Theorem 2.4.9 now has the arbitrary-law half-line GC handoff and the
  source-facing empirical distribution-function wrapper
  `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`.
- Durrett Chapter 2.1 now has generated-independence, finite disjoint-block,
  finite product-law, iid common-law product, iid criterion, and canonical iid
  product-coordinate wrappers.

Do not spend the next cycle on center insertion, EDF notation, Chapter 2.1
polish, Lindeberg-Feller estimates, Section 3.10 vector-limit polish, or
Chapter 4.1 conditional-expectation repackaging unless the active Chapter 4.2
theorem exposes an exact missing dependency.

Current aggressive target: continue the Chapter 4.2 martingale spine beyond the
compiled Example 4.2.1 linear random-walk martingale/supermartingale/
submartingale and centered-display wrappers and the compiled Example 4.2.2
quadratic source/natural-random-walk bridges and Example 4.2.3 product
martingale and normalized-exponential bridges.  The following Chapter 3,
Chapter 4.1, and Chapter 4.2 packets now compile:

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
- Durrett Section 3.10 now has compiled Cramér-Wold, multivariate CLT,
  Gaussian-coordinate independence, and Exercise 3.10.8 linear-combination
  Gaussian-characterization wrappers in
  `StatInference/ProbabilityTheory/Multivariate.lean`.
- Durrett Chapter 4.1 now has the conditional-expectation starter module in
  `StatInference/ProbabilityTheory/ConditionalExpectation.lean`, including
  the source version predicate, the mathlib `condExp` version wrapper, Example
  4.1.3 self/constant wrappers, and Example 4.1.4 independence wrapper
  `durrett2019_example_4_1_4_condExp_eq_integral_of_independent`, plus
  Theorem 4.1.9 linearity/monotonicity, Theorem 4.1.12 measurability collapse,
  Theorem 4.1.13 tower, Theorem 4.1.14 pull-out, Theorem 4.1.10 conditional
  Jensen, and Theorem 4.1.11 `L¹`/`L²` contraction wrappers.
  Durrett Theorem 4.1.15 now has `condExpL2` residual orthogonality,
  minimization, and ordinary-`condExp` agreement wrappers.

The next likely packet should treat Theorem 4.3.5 / Lemma 4.3.6 as closed
support after the compiled likelihood-ratio martingale/convergence bridge,
regular/singular decomposition identity, density-ratio/top-set assembly,
integral-representation to RN-derivative bridge, generator-extension bridge,
bounded-convergence generator-production bridge, trimmed-RN eventual
restricted-density bridge, `mu + nu` boundedness bridge, canonical ratio,
denominator-side top-set null endpoint, singular-support top-set endpoint, and
full canonical-ratio real identity, plus the Example 4.3.7 finite-partition
likelihood, finite-union, and generator-facing endpoint, plus the Theorem 4.3.8
finite-product likelihood measurability, rectangle set-integral, and
finite-product `withDensity` endpoint, plus the infinite-product
cylinder-likelihood measurability, finite-coordinate restriction `withDensity`,
cylinder set-integral endpoint, and finite/cylinder Hellinger factorization
endpoints, plus the zero-product Fatou endpoint, cylinder Hellinger-product
handoff, zero-product singularity bridge, positive-product
absolute-continuity bridge, final zero/positive branch assemblers, and
positive-branch eliminator plus lintegral-nonzero/mass-one consumers.  Move
The finite-cylinder mass-one/integral-convergence handoffs, positive-product
L1-to-integral handoff, pairwise-liminf Cauchy-to-L1 handoff,
Hellinger-tail-bound positive consumer, square-root/Cauchy-Schwarz Hellinger
L1 bridge, and normalized positive-prefix product-tail convergence bridge also
now compile.  The concrete pointwise/cylinder square-root factorization,
concrete cylinder Cauchy handoff with the textbook factors, the
`sqrt X_n + sqrt X_m` square-integral estimate, and the overlap-to-tail
`2 * (1 - tail)` algebra bridge also now compile.  The concrete Pythagorean
overlap inequality and lower-bound-only overlap Cauchy handoff now also
compile.  The finite-coordinate product integral, exact nested square-root
overlap factorization, and finite Hellinger tail-product overlap handoff now
also compile.  The HasProd/Multipliable prefix-tail bridge and the standard
`Finset.range n` HasProd-to-pairwise-liminf handoff now also compile.  The
finite tail-product lower bound from positive prefix/tail monotonicity and the
standard positive-product range consumer now also compile.  The source-density
one-coordinate Hellinger affinity bound `≤ 1`, normalized positive-product
tail `≤ 1` bridge, and standard source-density positive-product range consumer
now also compile.  The standard `Finset.range n` source-density `HasProd`
positive-product absolute-continuity handoff now also compiles.  The
a.e.-finite no-top source bridge and the standard source-density `HasProd`
absolute-continuity consumer using it now also compile.  Kolmogorov tail-event
zero-one support and the zero-set-not-full positive-branch eliminator now also
compile.  The lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0`
to zero-set-null and the positive-branch conclusion now also compiles.  The
every-tail-block measurability bridge into the `limsup` tail sigma-field now
also compiles, including zero-set-null and absolute-continuity consumers from
every-tail-block measurability plus `∫⁻ X ≠ 0`.  The tail-coordinate
sigma-field and finite tail cylinder likelihood measurability layer now also
compiles, including finite tail cylinder zero-set measurability and the
zero-set-equality handoff to every-tail-coordinate measurability.  The
finite-prefix zero-set algebra and prefix-cylinder zero-set handoff now also
compile.  The prefix/tail finite-block and tail-block-limit handoff layer now
also compiles.  The pointwise finite/nonzero coordinate side-condition bridge
now also compiles.  The range-limit tail handoff now also compiles: convergence
of the full finite-prefix likelihoods supplies the canonical tail-block limit
`X / prefix_n` and the tail-coordinate zero-set handoff under pointwise finite
and nonzero coordinate densities.  The range-limit positive-branch consumers
now also compile: coordinate sigma-fields are independent under the denominator
infinite product law; ENNReal full-prefix convergence supplies the `toReal`
convergence input for the L1/Cauchy branch; pointwise finite coordinate
densities supply the pairwise no-top side condition; and pointwise full-prefix
convergence plus finite/nonzero coordinate densities and `∫⁻ X ≠ 0` feed the
tail-zero-set positive-branch eliminator.  The canonical-ratio handoff into
these range-limit consumers now also compiles, so `toReal = dmu/dnu` and
`nu {canonicalRatio = infinity} = 0` no longer need to be supplied as open
inputs.  Canonical-ratio real integrability, the real-valued full-prefix
convergence consumer, the quotient-limit bridge, and the canonical
prefix-filtration measurability/inclusion support now also compile.  The
trimmed-prefix RN-ratio identity now also compiles, identifying every finite
prefix likelihood with the quotient of the two prefix-trimmed RN derivative
sequences over the common trimmed dominating measure.  The denominator-limit
nonzero bridge, canonical prefix convergence from the trimmed-prefix ratio,
positive Hellinger-product wrapper with that convergence supplied,
positive-product finite-limit side-condition bridge, canonical
product-tail/`tprod` positive-product wrappers, the first canonical
zero/positive product criterion wrapper, and canonical ratio measurability now
also compile, including strict-positive product variants and the zero-product
`HasProd h 0` singular handoff.  The ENNReal full-prefix convergence upgrade and
closed zero/positive branch wrapper now also compile.  The textbook `tprod`
zero/positive branch wrapper and the no-coordinate-finiteness `tprod` branch
wrapper now also compile without the ambient dichotomy input.  Move forward
from Theorem 4.3.8.  The source-shaped Lemma 4.3.9 normalized-process
martingale packet now compiles, and Section 4.4 Theorem 4.4.2 now has
nonnegative-submartingale, positive-part, and total positive-part Doob maximal
inequality wrappers.  Example 4.4.3 now has the squared-threshold Kolmogorov
maximal wrapper, the probability-display division wrapper, and the
absolute-maximum variance-bound display.  Theorem 4.4.4 now has the martingale
absolute-maximum consequence bridge from a supplied positive-part Lp maximal
bound, plus the p-th-power `lintegral` to `eLpNorm` bridge and martingale
source wrapper from a supplied positive-part p-th-power estimate.  The
positive-part layer-cake equality, pointwise Doob layer-cake integrand bound,
Hölder integral bound, set-integral to restricted-`lintegral` bridge, pure
`lintegral` Doob integrand bound, and integrated Doob layer-cake bound now also
compile.  The weighted/Fubini identification, coefficient extraction,
assembled Doob/Fubini/Hölder endpoint, scalar cancellation lemma, finite
`lintegral` estimate, finite `eLpNorm` wrapper, nonnegative layer-cake helper,
measurable-comparison Hölder helper, bounded-truncation Doob/Fubini/Hölder
assembly, finite truncation `lintegral` proof, and per-cutoff truncated
`lintegral` estimate, monotone-convergence/iSup handoff, final positive-part
`eLpNorm` wrapper, and final martingale absolute-maximum `eLpNorm` wrapper now
also compile.  The Theorem 4.4.6 bridge from a uniform `L^p` martingale bound
to the 4.2.11 almost-sure limit and limit-process `MemLp` now also compiles, as
does the final `L^p` convergence endpoint when a single `MemLp` dominating
variable `S` is supplied.  The finite running absolute-maximum notation,
finite-maximal-bound handoff, and supplied running-maximum-limit assembly now
also compile.  The canonical infinite running maximum `S`, its measurability,
its convergence from a.s. bounded finite maxima, and the final running-`S`
assembly now also compile.  The a.s. boundedness hypothesis from compiled finite
maximal `eLpNorm` bounds and the final Theorem 4.4.6 `L^p` convergence endpoint
now compile.  The Theorem 4.4.7 orthogonality and increment-increment wrappers
now compile.  The Theorem 4.4.8 conditional variance formula now also compiles.
The Example 4.4.9 conditional, integrated second-moment recurrence, finite-sum
display, shifted geometric-sum, uniform second-moment bound, `eLpNorm 2`
handoff, `L^2` convergence endpoint, expectation handoff, `E X = 1`, and
nonzero-limit endpoint now also compile.  Exercise 4.4.5's
conditional-variance variant now also compiles.  Theorem 4.4.1
optional-stopping wrappers, Exercise 4.4.6's stopped-variance small-ball
handoff, the finite first-exit/small-ball assembly, the bounded-increment
overshoot/source wrapper, and the square-martingale wrapper with automatic
stopped integrability, and the deterministic variance-clock wrapper now also
compile, along with the exact-denominator wrapper.  Historical target closed;
current target is Exercise 4.4.11's martingale-transform bounded-variance
corollary.
Keep Theorem 4.1.16 deferred unless a targeted kernel search finds a direct
source-shaped API.

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
- Section 4.1 conditional expectation starts near line 3894 in the same
  Markdown chunk.  Example 4.1.4 appears near line 3969, Example 4.1.5 near
  line 3982, Theorem 4.1.9 near line 4081, Theorem 4.1.13 near line 4183, and
  Theorem 4.1.14 near line 4196.

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

Use `Live In-Thread Goal Prompt V400` at the top of this file.  Historical route
notes below this point are inventory, not instructions for the next proof
packet.
