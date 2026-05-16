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

Route from `Live In-Thread Goal Prompt V432` in
`docs/durrett2019_probability_theory_current_blocker_primitive_plan.md`.
The active immediate lane for this goal cycle is Durrett Chapter 2.5
random-series consequences in `StatInference/ProbabilityTheory/Basic.lean`.
V432 advances Durrett Theorem 2.5.12 Marcinkiewicz-Zygmund rate for
`1 < p < 2`.  In addition to the V421-V431 endpoint, Tonelli/Fubini,
scalar-kernel, scalar-summability, canonical threshold, and standard rpow
reducers, the tail-first rpow indicator `tsum` is now localized to a finite
`range (Nat.ceil (x^p))` prefix with a full-prefix bound consumer, and the
truncated-square rpow indicator has a full p-series majorant plus summability.
The endpoint wrappers only need the two quantitative p-series estimates on
these standard rpow finite-prefix/tail forms.  New compiled anchors through
V432:
`durrett2019_theorem_2_5_12_scaled_variance_summable_of_base_truncated_sq_summable`,
`durrett2019_theorem_2_5_12_ae_centered_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable`,
`durrett2019_theorem_2_5_12_truncated_normalized_sum_tendsto_zero_of_centered_and_mean`,
`durrett2019_theorem_2_5_12_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_12_centered_endpoint_and_eventuallyEq_of_base_truncated_sq_summable`,
and
`durrett2019_theorem_2_5_12_truncated_endpoint_and_eventuallyEq_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_12_normalized_sum_tendsto_zero_of_eventuallyEq`,
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_truncated_and_eventuallyEq`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_12_truncatedMean_normalized_sum_tendsto_zero_of_scaled_summable`,
`durrett2019_theorem_2_5_12_truncatedMean_scaled_summable_of_abs_scaled_summable`,
`durrett2019_theorem_2_5_12_truncatedMean_normalized_sum_tendsto_zero_of_abs_scaled_summable`,
`durrett2019_theorem_2_5_12_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_scaled_summable`,
`durrett2019_theorem_2_5_12_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_abs_scaled_summable`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_abs_scaled_summable`,
`durrett2019_theorem_2_5_12_abs_truncatedMean_le_tail_integral_of_mean_zero`,
`durrett2019_theorem_2_5_12_abs_truncatedMean_le_base_tail_integral_of_identDistrib_mean_zero`,
`durrett2019_theorem_2_5_12_truncatedMean_abs_scaled_summable_of_base_tail_scaled_summable`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_base_tail_scaled_summable`,
`durrett2019_theorem_2_5_12_summable_integral_of_lintegral_tsum_bound`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_kernel_bound`, and
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_kernel_bound`,
`durrett2019_theorem_2_5_12_tailFirstKernel`,
`durrett2019_theorem_2_5_12_scalarTruncated`,
`durrett2019_theorem_2_5_12_truncatedSqKernel`,
`durrett2019_theorem_2_5_12_tailFirstKernel_nonneg`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_nonneg`,
`durrett2019_theorem_2_5_12_tailFirstKernel_ennreal_tsum_le_of_real_tsum_le`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_ennreal_tsum_le_of_real_tsum_le`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_scalar_kernel_bound`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_real_scalar_kernel_bound`,
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_scalar_kernel_bound`,
and
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_real_scalar_kernel_bound`,
`durrett2019_theorem_2_5_12_tailFirstKernel_eventually_eq_zero`,
`durrett2019_theorem_2_5_12_tailFirstKernel_hasFiniteSupport`,
`durrett2019_theorem_2_5_12_tailFirstKernel_summable`,
`durrett2019_theorem_2_5_12_normalizer_sq_inv_summable`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_le_sq_majorant`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_summable`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_tailFirstKernel_tsum_bound`,
and
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_truncatedSqKernel_tsum_bound`,
`durrett2019_theorem_2_5_12_tailFirstKernel_threshold_iff`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_threshold_iff`,
`durrett2019_theorem_2_5_12_tailFirstKernel_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_nat_indicator`,
and
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_of_nat_indicator`,
`durrett2019_theorem_2_5_12_normalizer_inv_eq_rpow_neg`,
`durrett2019_theorem_2_5_12_normalizer_sq_inv_eq_rpow_neg`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_rpow_indicator`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_eq_rpow_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_rpow_indicator`,
and
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_of_rpow_indicator`,
`durrett2019_theorem_2_5_12_tailFirst_rpow_indicator_tsum_eq_range_indicator_sum`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_rpow_range_indicator_sum`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_rpow_range_sum`,
`durrett2019_theorem_2_5_12_truncatedSq_rpow_indicator_le_full`,
and
`durrett2019_theorem_2_5_12_truncatedSq_rpow_indicator_summable`.
The current blocker is now only ordinary real p-series/integral comparison for
the standard rpow finite-prefix and tail inequalities.

Verified route history below is provenance, not live prompt text.  V425 added
the truncated-mean Kronecker layer reducing normalized mean convergence to
absolute scaled truncated-mean summability.  V424 added
the finite-prefix original-sum transfer from truncated normalized sums under
eventual equality.  V423 added
the variance/mean assembly reducers and left the finite-prefix transfer plus
analytic estimates as the next frontier.  V422
advances Durrett Theorem 2.5.12 Marcinkiewicz-Zygmund rate for `1 < p < 2`.
In addition to the V421 normalizer/truncation/Kronecker spine, the
Borel-Cantelli eventual-equality transfer from `X_k` to
`Y_k = X_k 1_{|X_k| <= k^(1/p)}` now compiles under iid finite `p`-moment, and
the first variance landing pads reduce scaled centered variances to base
truncated second moments.  Compiled anchors through V422:
`durrett2019_theorem_2_5_12_variance_scaledCenteredTruncated_le_truncated_sq`,
`durrett2019_theorem_2_5_12_integral_truncated_sq_eq_base_truncated_sq_of_identDistrib`,
`durrett2019_theorem_2_5_12_truncation_mismatch_subset_power_tail`,
`durrett2019_theorem_2_5_12_measure_mismatch_le_power_tail`,
`durrett2019_theorem_2_5_12_tsum_power_tail_ne_top_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_12_tsum_mismatch_ne_top_of_tsum_power_tail_ne_top`,
and
`durrett2019_theorem_2_5_12_ae_eventuallyEq_truncated_of_integrable_power_identDistrib`.
V421 opens
Durrett Theorem 2.5.12 Marcinkiewicz-Zygmund rate for `1 < p < 2`.  The
normalizer `a_n = n^(1/p)`, moving truncation
`Y_k = X_k 1_{|X_k| <= k^(1/p)}`, centered and scaled centered truncations,
measurability, `L^2`, mean-zero, independence, and the Kronecker endpoint from
summable scaled variances all compile.  Compiled anchors through V421:
`durrett2019_theorem_2_5_12_normalizer`,
`durrett2019_theorem_2_5_12_normalizer_pos`,
`durrett2019_theorem_2_5_12_normalizer_ne_zero`,
`durrett2019_theorem_2_5_12_normalizer_increment_nonneg`,
`durrett2019_theorem_2_5_12_normalizer_atTop`,
`durrett2019_theorem_2_5_12_truncated`,
`durrett2019_theorem_2_5_12_centeredTruncated`,
`durrett2019_theorem_2_5_12_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_12_iIndepFun_centeredTruncated_of_iIndepFun`,
`durrett2019_theorem_2_5_12_iIndepFun_scaledCenteredTruncated_of_iIndepFun`,
and
`durrett2019_theorem_2_5_12_ae_centered_truncated_normalized_sum_tendsto_zero_of_scaled_variance_summable`.
V420 closes
the current source-shaped Durrett Theorem 2.5.11 route: the exact logarithmic
normalizer, inverse-square algebra, log-weight summability proof, uniform
finite-variance bridge, and iid finite-second-moment theorem all compile
without an external logarithmic-series summability hypothesis.  Compiled
anchors through V420:
`durrett2019_theorem_2_5_11_logNormalizer`,
`durrett2019_theorem_2_5_11_logNormalizer_pos`,
`durrett2019_theorem_2_5_11_logNormalizer_ne_zero`,
`durrett2019_theorem_2_5_11_logNormalizer_eq_of_two_le`,
`durrett2019_theorem_2_5_11_logNormalizer_le_of_two_le`,
`durrett2019_theorem_2_5_11_logNormalizer_increment_nonneg`,
`durrett2019_theorem_2_5_11_logNormalizer_atTop`,
`durrett2019_theorem_2_5_11_logNormalizer_inv_sq_eq`,
`durrett2019_theorem_2_5_11_logWeight`,
`durrett2019_theorem_2_5_11_logNormalizer_weight_summable`, and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_variance_bound`,
`durrett2019_theorem_2_5_11_memLp_of_identDistrib_zero`,
`durrett2019_theorem_2_5_11_variance_bound_of_identDistrib`, and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_iid_finite_variance`,
`durrett2019_theorem_2_5_11_logWeight_eq_inv_sq`,
`durrett2019_theorem_2_5_11_logWeight_pos`,
`durrett2019_theorem_2_5_11_logWeight_succ_le`,
`durrett2019_theorem_2_5_11_logWeight_summable_of_condensed`,
`durrett2019_theorem_2_5_11_logWeight_summable_of_condensed_pseries_bound`,
and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_iid_finite_variance_condensed`,
`durrett2019_theorem_2_5_11_logWeight_condensed_pseries_bound`,
`durrett2019_theorem_2_5_11_logWeight_summable`,
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_variance_bound_of_pos_epsilon`,
and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_iid_finite_variance_of_pos_epsilon`.
V419 packages the Cauchy-condensation and p-series reduction for Theorem 2.5.11's
logarithmic-series proof.  V418
packages the iid finite-second-moment source layer for Theorem 2.5.11.  V417
packages the exact Theorem 2.5.11 logarithmic normalizer, its nonzero,
monotone-increment, and `atTop` obligations, the inverse-square algebra
matching Durrett's log summand, and the source-shaped finite-variance bridge.
V416
packages the abstract Theorem 2.5.11 route from random-series convergence or
summable scaled variances to the normalized rate endpoint, plus the uniform
variance-bound reduction to summability of inverse-square normalizer weights.
Compiled anchors:
`durrett2019_theorem_2_5_11_normalized_sum_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_11_ae_normalized_sum_tendsto_zero_of_summable_scaled_variance`,
`durrett2019_theorem_2_5_11_variance_div_le_inv_sq_mul_of_variance_le`,
`durrett2019_theorem_2_5_11_scaled_variance_summable_of_variance_bound`,
and
`durrett2019_theorem_2_5_11_ae_normalized_sum_tendsto_zero_of_variance_bound`.
V415 packages the truncated-to-original transfer and full source-facing
one-based SLLN endpoint for Theorem 2.5.10.  New compiled anchors:
`durrett2019_theorem_2_5_10_truncation_mismatch_subset_tail`,
`durrett2019_theorem_2_5_10_measure_mismatch_le_tail`,
`durrett2019_theorem_2_5_10_tsum_tail_ne_top_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_10_tsum_mismatch_ne_top_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_10_ae_eventuallyEq_truncated_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_10_average_tendsto_of_eventuallyEq`,
and
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_integrable_identDistrib`.
This proves the source display `S_n/n -> mu` a.s. from iid, integrability, and
common mean hypotheses.  V414
packages the scaled-centered variance-summability layer and the source-facing
truncated-average endpoint.  Compiled anchors:
`durrett2019_theorem_2_5_10_variance_scaledCenteredTruncated_le_truncated_sq`,
`durrett2019_theorem_2_5_10_integral_truncated_sq_eq_base_truncated_sq_of_identDistrib`,
`durrett2019_theorem_2_5_10_integral_base_truncated_sq_eq_abs_truncation_sq`,
`durrett2019_theorem_2_5_10_scaled_variance_summable_of_integrable_identDistrib`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_integrable_identDistrib`.
This proves that iid integrable source hypotheses imply
`T_n/n -> mu` almost surely for `T_n = sum_{k <= n} X_k 1_{|X_k| <= k}`.  V413
packages the moving-truncation mean-convergence step.  Compiled anchors:
`durrett2019_theorem_2_5_10_tendsto_integral_fixed_truncation`,
`durrett2019_theorem_2_5_10_integral_truncated_eq_base_truncated_of_identDistrib`,
`durrett2019_theorem_2_5_10_truncatedMean_tendsto_of_integrable_identDistrib`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_scaled_variance_summable`.
This proves the closed-absolute dominated-convergence step
`E[X_k 1_{|X_k| <= k}] -> mu` under integrability plus identical distribution
and plugs it into the source-facing truncated-average endpoint.  V412
packages the moving-truncation setup.  Compiled anchors:
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
This proves that the source moving truncations
`Y_k = X_k 1_{|X_k| <= k}` supply the measurability, independence, `L^2`, and
mean-zero hypotheses needed by the V411 random-series assembly.  V411
packages the Kronecker/Cesaro/random-series assembly spine.  Compiled anchors:
`durrett2019_theorem_2_5_10_centered_average_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_10_centered_average_difference_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_10_mean_average_tendsto_of_tendsto`,
`durrett2019_theorem_2_5_10_average_tendsto_of_scaled_centered_series_and_mean_tendsto`,
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_scaled_centered_series_and_mean_tendsto`,
and
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_scaled_centered_summable_variance_and_mean_tendsto`.
These theorems say that pathwise convergence of
`sum (Y_k - m_k) / k`, plus `m_k -> mu`, gives convergence of the one-based
averages of `Y_k` to `mu`, and that Theorem 2.5.6 supplies the a.s. version
from summable variances of the scaled centered variables.  Next work should
discharge the actual source proof obligations for
`Y_k = X_k 1_{|X_k| <= k}`: moving truncation, variance summability,
dominated-convergence mean convergence, and transfer from `T_n/n` to `S_n/n`.

V410 packages the deterministic Chapter 2.5 Kronecker lemma route.  Compiled
anchors:
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
This proves the textbook one-based conclusion
`(sum_{m <= n} x_m) / a_n -> 0` from convergence of `sum x_n / a_n`, under the
monotone-divergent normalizer hypotheses.  The proof reuses mathlib's
`Finset.sum_range_sub` and `Asymptotics.IsLittleO.sum_range`, plus the local
Exercise 4.4.11 deterministic proof shape in `Martingale.lean`; no ready
mathlib one-line Kronecker theorem was found for the exact Durrett display.
Next work should use V410 Kronecker plus V406-V409 random-series convergence
to start Durrett Theorem 2.5.10 SLLN via the random-series route.

V409 packages the source-facing one-based sufficiency direction of Durrett
Theorem 2.5.8.  New compiled anchors:
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
the text.  V408 adds
Durrett Theorem 2.5.8 fixed-level truncation and large-jump mismatch support.
Compiled anchors: `durrett2019_theorem_2_5_8_truncated`,
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
deterministic centering convergence to convergence of `sum X_i`.  V407 starts
Durrett Theorem 2.5.8 Kolmogorov three-series sufficiency.  Compiled anchors:
`durrett2019_theorem_2_5_8_realPartialSum`,
`durrett2019_theorem_2_5_8_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_add_of_randomSeriesConverges_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_of_centered_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_ae_centered_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_of_eventuallyEq`,
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_ae_eventuallyEq_of_ae_randomSeriesConverges`,
`durrett2019_theorem_2_5_8_ae_eventuallyEq_of_tsum_measure_ne_top`, and
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_tsum_mismatch_ne_top_of_ae_randomSeriesConverges`.
This packages the centered-plus-mean and eventual-equality/Borel-Cantelli
assembly needed for the sufficiency direction.  V406 adds
the exact textbook series-convergence display wrapper for Durrett Theorem
2.5.6.  New compiled anchors:
`durrett2019_theorem_2_5_6_randomSeriesConverges` and
`durrett2019_theorem_2_5_6_random_series_converges_ae_of_summable_variance`.
This matches Durrett's definition that `sum_{n=1}^infty X_n(omega)` converges
iff the one-based partial sums have a finite limit, and restates V405 in that
wording.  V405
packages the a.s. convergence endpoint for Durrett Theorem 2.5.6.  Compiled
anchors:
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
with finite second moments and summable variances.  The proof uses a countable
inverse-natural threshold grid plus `ae_all_iff`; do not replace it with an
uncountable a.e. intersection over all real epsilons.  V404
packages Durrett's pathwise Cauchy endpoint from eventual absence of shifted
tail-pair oscillation events.  Compiled anchors:
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
This deterministic endpoint reuses mathlib's `Metric.cauchySeq_iff` and
`CauchySeq.tendsto_limUnder`.  V403
packages Durrett's oscillation step in shifted block form.  Compiled
anchors:
`durrett2019_theorem_2_5_6_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_measurableSet_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_subset_tailMaxCrossingEvent_two_mul`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_le_tailMaxCrossingEvent`,
and
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_tendsto_zero_of_summable_variance`.
This is the formal `P(w_M > 2 eps) <= P(sup_{m >= M} |S_m - S_M| > eps)
-> 0` bridge, represented by shifted tail-block partial sums.  V402 derives
the textbook variance-tail probability limit from one-based
summability of `fun i => Var(X_{i+1})`.  New compiled anchors:
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
is now represented for the shifted tail-maximal event.  V401 lifts
the finite Theorem 2.5.6 block estimate to the increasing-union tail event:
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent`,
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent_mono`,
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent_add_bound`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_tendsto_bounds`,
and
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_variance_tail_limit`.
The finite-to-infinite probability passage now reuses mathlib's
`tendsto_measure_iUnion_atTop`; do not rebuild countable-union measure
machinery.  V400 adds
the final source-style statement of Kolmogorov's maximal inequality and the
first Theorem 2.5.6 block estimate:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_inequality` and
`durrett2019_theorem_2_5_6_finite_block_kolmogorov_maximal_bound`.  V399 adds
`L^2` source-side reduction for Theorem 2.5.5:
`durrett2019_theorem_2_5_5_partialSum_memLp_two_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_partialSum_sq_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_rangeSum_memLp_two_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_rangeSum_sq_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_firstCrossing_mixed_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_memLp_two_mean_zero`,
and its one-based wrapper.  The front-facing textbook display now only needs
independence, coordinate measurability, finite-range `MemLp X_i 2`, and
finite-range mean zero; partial-square, terminal-square, future-integrability,
and mixed-term integrability obligations are generated internally.  V398 adds
source-facing increment mean-zero wrappers:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_mean_zero`
and
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_mean_zero_oneBased`.
These derive terminal partial-sum mean zero from finite-range increment
integrability and mean-zero assumptions before applying the V397 variance
display.  V397
packages the textbook division and variance display from the compiled V396
maximal integral inequality:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_div_bound`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_div_bound_oneBased`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound`, and
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_oneBased`.
The source-facing conclusion now has the textbook shape
`P(max_{1 <= k <= n} |S_k| >= x) <= (x^2)^{-1} * Var(S_n)` once the
terminal partial sum is mean-zero.  V396 adds
the terminal-square finite-union bound and core chained maximal integral
inequality:
`durrett2019_theorem_2_5_5_sum_firstCrossing_terminalSq_integrals_le_integral`
and `durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_bound`, plus
one-based wrappers.  V395 adds
the square-expansion upper-comparison layer:
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_add_mixed_le_terminalSq`,
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_integral_le_terminalSq_integral_of_mixed_zero`,
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_integral_le_terminalSq_integral`,
and
`durrett2019_theorem_2_5_5_sum_firstCrossing_stoppedSq_integrals_le_sum_terminalSq_integrals`,
plus one-based wrappers.  V394 adds
the maximal-crossing event decomposition and summed first-crossing lower bound:
`durrett2019_theorem_2_5_5_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_firstCrossing_biUnion_eq_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_measureReal_maxCrossingEvent_eq_sum`, and
`durrett2019_theorem_2_5_5_sq_mul_measureReal_maxCrossingEvent_le_sum_firstCrossing_integrals`,
plus one-based wrappers.  V393 adds
the finite first-crossing disjoint-union layer:
`durrett2019_theorem_2_5_5_measurableSet_firstCrossingEvent`,
`durrett2019_theorem_2_5_5_firstCrossing_events_disjoint`,
`durrett2019_theorem_2_5_5_firstCrossing_events_pairwiseDisjoint`,
`durrett2019_theorem_2_5_5_measureReal_firstCrossing_biUnion_eq_sum`, and
the one-based wrappers.  V392 adds
the single first-crossing square/mass lower bound for Durrett Theorem 2.5.5,
showing that each first-crossing event contributes at least `x^2 * P(A_m)` to
the squared partial-sum integral.  V391 starts the
Durrett Theorem 2.5.5 Kolmogorov maximal-inequality proof route by packaging
the first-crossing mixed-term calculation from Theorems 2.1.10 and 2.1.13.
Do not return to Theorem 2.4.9 source-entry plumbing unless search proves a
concrete missing display.  V390 adds the direct
countable supplied-partition and one-based outer-a.s. product-law/canonical
route for Theorem 2.4.9, consuming the compiled Chapter 2.1.11 product-law
and canonical iid packages.  Next work should not rebuild Theorem 2.4.9
source-entry plumbing; either close one remaining source-facing display only
if search proves it is missing, or move to Chapter 2.1.12/2.1.13
product-expectation/Kolmogorov-maximal support.

V389 lifts the
global middle-partition-with-tails uniform-error squeeze in Theorem 2.4.9 to
product-law and canonical source forms, consuming the compiled Chapter 2.1.11
product-law/canonical iid packages and the V388 finite-cutpoint burn-in layer.
Next work should not rebuild the middle/tail uniform-error product-law
consumers; move to the countable supplied-partition route or direct outer-a.s.
empirical-CDF source entries that still lack product-law/canonical wrappers.
V388 lifts the
finite-cutpoint burn-in step in Theorem 2.4.9 to product-law and canonical
source forms.  The new wrappers consume the compiled Chapter 2.1.11
product-law/canonical iid packages and the pointwise empirical-CDF endpoints.
Next work should not rebuild finite-cutpoint product-law consumers; move to
the next global Theorem 2.4.9 middle/tail or outer-a.s. empirical-CDF source
display that still lacks a direct product-law/canonical entry.  V387 adds
canonical iid product-space pointwise displays for both the empirical CDF and the left
empirical CDF, in zero-based and one-based sample notation, by consuming the
compiled Chapter 2.1.11 canonical coordinate iid package on `P^N`.  Next work
should not rebuild these canonical pointwise displays; move to a new
theorem-sized Chapter 2.1/2.4.9 source consumer, preferably one that packages
finite-cutpoint or global empirical-CDF steps from the already compiled
pointwise and product-law endpoints.  V386 adds zero-based
product-law consumers for the pointwise Theorem 2.4.9 empirical CDF and left
empirical CDF proof steps.  They consume
`HasLaw (fun omega => fun i => X i omega) (P^N) mu` through the compiled
Chapter 2.1.11 product-law extraction.  Next work should not rebuild these
pointwise product-law consumers; move to another genuine Chapter 2.1/2.4.9
source wrapper or a missing theorem-sized consumer.  V385 consumes the
shifted infinite-product law bridge in the pointwise Theorem 2.4.9 proof
steps for the one-based empirical CDF and left empirical CDF displays.  Next
work should not rebuild these pointwise shifted joint-law displays; move to
another genuine Chapter 2.1/2.4.9 source wrapper or a missing theorem-sized
consumer.  V384 consumes the V382
shifted infinite-product law bridge in the one-based Durrett 2.4.9 endpoints:
the new `*_of_shift_hasLaw_infinitePi_oneBased` wrappers take a joint law
directly for `fun i => X (i + 1)` and feed the compiled GC/outer
empirical-CDF route.  Next work should not rebuild these shifted-joint-law
endpoints; move to another genuine Chapter 2.1/2.4.9 source display or a
missing theorem-sized consumer.  V383 adds the
Theorem 2.1.10/2.1.13 mixed-term bridge used by the Kolmogorov maximal
inequality proof:
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockFunction_integral_eq_zero`,
`durrett2019_theorem_2_1_13_partialSumDiff_integral_eq_zero_of_integral_Ico_eq_zero`,
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockFunction_integral_eq_zero_of_integral_Ico_eq_zero`,
and
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockIndicatorSum_integral_eq_zero`.
Next work should consume this bridge only in a real later source theorem, or
return to the active 2.4.9/Chapter 2.1 source-facing frontier; do not reprove
this mixed-term factorization.  V382 adds the
one-based Theorem 2.1.11 infinite product-law bridge:
`durrett2019_theorem_2_1_11_iid_shift_sequence_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iid_shift_iff_hasLaw_infinitePi`, and
`durrett2019_theorem_2_1_11_iid_shift_hasLaw_infinitePi_of_identDistrib`.
The shifted Durrett process `X (i + 1)` now has direct product-law extraction,
criterion, and standard `X_0` identical-distribution source packaging.  Next
work should consume these wrappers in real source-display endpoints or move to
Chapter 2.1.12/2.1.13 product-expectation support; do not rebuild this
one-based product-law bridge.  V381 routes the
pairwise-identically-distributed empirical-CDF outer-a.s. source entrances
through the V379 textbook middle/tail proof.  The zero-based and one-based
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_*_of_pairwise_identDistrib`
wrappers, including range-sum and inverse-multiply display forms, now consume
the compiled middle/tail route after extracting the common law and pairwise
independence.  Next work should move to a new Durrett source-display wrapper
or Chapter 2.1 product-law support; do not reroute these pairwise
empirical-CDF endpoints again.  V380 rewires the main
source-facing iid and canonical empirical-CDF outer-a.s. endpoints to consume
the V379 textbook middle/tail route directly.  The affected endpoints include
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun`,
its range-sum and inverse-multiply displays, the corresponding one-based
`iIndepFun` displays, and the zero-/one-based canonical iid empirical-CDF
outer-a.s. endpoints.  Next work should move to a new source-entrance wrapper
in Chapter 2.1/2.4.9 or a genuinely missing Durrett display form, not rewire
the same endpoints again.  V379 closes the
countable supplied-partition gap for the V377/V378 textbook middle/tail route:
`durrett2019_theorem_2_4_9_exists_middlePartitionWithTails`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_outerAlmostSureUniformDeviation_of_iIndepFun`.
It uses finite tail cutpoints, arbitrary-law cutpoint chains, and the
canonical `1 / (scale + 1)` countable width sequence to produce the exact
outer-a.s. empirical-CDF uniform-deviation predicate through V378.  Next work
should either make the existing empirical-CDF source endpoints reuse this
textbook middle/tail route where useful, or move to the next missing Chapter
2.1/2.4.9 source-entrance wrapper.  V378 packages the V377
global middle-partition-with-tails squeeze into the countable-scale
uniform-deviation interface:
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_of_iIndepFun`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_almostSureUniformDeviation_of_tendsto_partitions`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation_of_tendsto_partitions`.
This is the correct a.e. route: fixed-tolerance V377 events are not
intersected over all real tolerances; V378 intersects a countable sequence of
supplied middle/tail partitions whose widths tend to zero.  V379 supplies
those partitions for arbitrary real laws and feeds them to V378.  V377 adds the global
middle-partition-with-tails squeeze:
`empiricalDistributionFunction_nonneg`,
`empiricalDistributionFunction_le_one`,
`empiricalLeftDistributionFunction_nonneg`,
`empiricalLeftDistributionFunction_le_one`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt_two_mul`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_two_mul_of_iIndepFun`.
This consumes V376 on `[a,b)`, uses `F_n(c) <= F_n(a-)` on the lower tail, and
uses `F_n(b) <= F_n(c)` plus `1 - F(b) = P((b, infinity))` on the upper tail.
V378 now consumes this fixed-tolerance result, so do not replay the tail
case split or endpoint convergence.  V376 adds the
middle-partition monotonicity squeeze that consumes V375's finite-cutpoint
burn-in:
`durrett2019_theorem_2_4_9_middlePartition_uniform_error_lt_of_cutpoint_errors`,
`durrett2019_theorem_2_4_9_middlePartition_eventually_uniform_error_lt_two_mul`,
and
`durrett2019_theorem_2_4_9_middlePartition_oneBased_inv_mul_uniform_error_lt_two_mul_of_iIndepFun`.
This compiles the displayed cell inequalities in Durrett's proof and gives the
eventual `2 * epsilon` uniform bound on every bounded middle partition.  The
next target should lift this bounded middle-partition squeeze through the
compiled tail/endpoint-grid wrappers, not revisit endpoint convergence or
bracket monotonicity.  V375 adds the
finite-cutpoint simultaneous closed and strict-left error bridge used in the
proof of Durrett Theorem 2.4.9:
`durrett2019_theorem_2_4_9_finite_cutpoints_eventually_closed_left_errors_lt`
and
`durrett2019_theorem_2_4_9_finite_cutpoints_oneBased_inv_mul_closed_left_errors_lt_of_iIndepFun`.
This is the compiled `N_k(omega)` step for finitely many cutpoints after
pointwise convergence of `F_n(x_j)` and `F_n(x_j-)`.  The next target should be
the uniform grid/telescoping squeeze that consumes this finite-cutpoint bridge,
not another pointwise SLLN wrapper.  V374 adds closed-endpoint
pointwise empirical-CDF proof-step wrappers:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_inv_mul_range_sum_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_canonical_iid`.
V373 adds exact-textbook
`n^{-1} * sum` strict-left empirical-CDF source entrances:
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_inv_mul_range_sum_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_canonical_iid`.
V372 adds the
strict-left empirical-CDF support used in Durrett's proof:
`realOpenHalfLineIndicator_integral_eq_cdf_leftLim`,
`empiricalLeftDistributionFunction`,
`realOpenHalfLine_empiricalAverage_sub_cdfLeftLim_tendsto_zero_ae_of_iid`,
and the Durrett wrappers
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_range_sum_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae_of_iIndepFun`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_range_sum_tendsto_leftLim_ae_of_iIndepFun`.
V371 adds one-based
Theorem 2.4.9 consumers for full infinite-product joint laws
(`*_of_hasLaw_infinitePi_oneBased`), identically distributed coordinates plus
`iIndepFun` (`*_of_iIndepFun_identDistrib_oneBased`), and pairwise-identically
distributed coordinates (`*_of_pairwise_identDistrib_oneBased`), including
`durrett2019_theorem_2_4_9_pairwise_identDistrib_oneBased_source`.  These
cover the six half-line GC / outer-a.s. GC / empirical-CDF / range-sum /
inverse-multiply range-sum endpoints for Durrett's one-based display.  V370
adds
`durrett2019_theorem_2_1_11_iid_shift_oneBased_of_iIndepFun`,
`durrett2019_theorem_2_1_11_iid_shift_hasLaw_infinitePi_of_iIndepFun`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun_oneBased`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun_oneBased`,
the arbitrary-source one-based iid and empirical-CDF wrappers matching
Durrett's `X_1, X_2, ...` and `n^{-1} sum_{m=1}^n` notation without forcing
canonical product-space specialization.  V369 adds
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_coordinates_oneBased`,
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_pairwise_indepFun_oneBased`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased_range_sum`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased_inv_mul_range_sum`,
the one-based canonical iid product-space and empirical-CDF wrappers matching
Durrett's `X_1, X_2, ...` notation.  V368 adds
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_pairwise_indepFun`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_canonical_iid`,
and
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_canonical_iid`,
the canonical iid product-space pairwise-independence and half-line
Glivenko-Cantelli wrappers.  The existing canonical empirical-CDF endpoints now
reuse these wrappers instead of rebuilding pairwise independence inline.  V367 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredProduct_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct_explicitMean_sum`,
the vector-source and common-vector-law centered-product normalized-sum
projected characteristic-function wrappers.  V366 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCenteredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct_sum`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCenteredProduct_sum`,
the vector-source and common-vector-law centered-product normalized-sum CLT
wrappers.  V365 adds
`durrett2019_theorem_3_10_7_finiteCoordinate_explicitMean_normalization_eq_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
the general finite-coordinate and common-vector-law literal normalized-sum CLT
wrappers.  V364 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
the zero-mean coordinate-covariance literal normalized-sum source wrappers.
V363 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct_sum`,
the literal centered normalized-sum arbitrary-frequency characteristic-function
display for the canonical product sample.  V362 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
the canonical coordinate-covariance, centered-product, and literal
normalized-sum arbitrary-frequency characteristic-function displays.  V361 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct`,
the canonical product-sample covariance-table and arbitrary-frequency
centered-product bridges.  V360 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct`,
the common-vector-law covariance-table and arbitrary-frequency centered-product
bridges.  V359 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct`,
the vector-Gaussian-source covariance-table and arbitrary-frequency
centered-product bridges.  V358 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedSummandCLT_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct`,
the projected-summand-CLT source bridges into the covariance-bilinear table and
centered-product Gaussian projected-characteristic routes.  V357 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct`,
the projected-scalar-CLT source bridges into the covariance-bilinear table and
centered-product Gaussian projected-characteristic routes.  V356 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct`,
the covariance-bilinear table and centered-product source consumers for the
projected-characteristic Durrett Theorem 3.10.7 vector CLT route.  V355 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_centeredProduct`,
the centered Gaussian covariance-table and arbitrary-frequency centered-product
ordinary characteristic-function source variants.  V354 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_centeredProductSubMean`,
the covariance-table and arbitrary-frequency centered-product variants of the
nonzero-mean Gaussian projected scalar ordinary characteristic-function route.
V353 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_coordinateCovariance`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_centeredProductSubMean`,
the nonzero-mean Gaussian projected scalar ordinary characteristic-function
displays with the linear mean phase and textbook `t^2` covariance exponent.
V352 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
the literal nonzero-mean normalized-sum characteristic-function displays for
Durrett Theorem 3.10.7.  V351 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_sum`,
the literal centered normalized-sum characteristic-function display for the
canonical product sample.  V350 adds
`durrett2019_theorem_3_10_7_centeredProduct_eq_of_coordinateCovariance`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct`,
the canonical product-sample coordinate-covariance/centered-product bridge into
the textbook `t^2` characteristic-function route.  V349 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct_tsq`,
the canonical product-sample source bridge into the textbook `t^2`
characteristic-function route using existing local product-law support.  V348 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct_tsq`,
the common-vector-law source bridge into the textbook `t^2`
characteristic-function route.  V347 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct_tsq`,
the vector-Gaussian-source bridge into the textbook `t^2`
characteristic-function route.  V346 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct_tsq`,
the projected-summand-CLT source bridge into the textbook `t^2`
characteristic-function route.  V345 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredProduct`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct_tsq`,
the bridge from projected scalar CLTs to the textbook `t^2`
characteristic-function route.  V344 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct_tsq`,
the centered-product source variant of the textbook `t^2` characteristic-function
endpoint for Durrett Theorem 3.10.7.  V343 adds
`durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul`,
`durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul_complex`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance_tsq`,
the textbook `t^2` Gaussian exponent layer for Durrett Theorem 3.10.7.  V342 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_coordinateCovariance`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance`,
Durrett Theorem 3.10.7 projected-characteristic CLT from the centered Gaussian
quadratic exponential and matching coordinate covariance table.  V341 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions`,
Durrett Theorem 3.10.7 multivariate CLT from projected
characteristic-function convergence.  V340 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution_of_projected_charFun`,
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_of_charFun`,
and
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure_of_charFun`,
Durrett Theorem 3.10.6 Cramér-Wold characteristic-function transport in
random-vector/source form.  V339 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto_of_projected_charFun`
and
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto_of_charFun`,
Durrett Theorem 3.10.6 Cramér-Wold characteristic-function transport wrappers
from all projected characteristic functions to vector-law convergence.  V338
adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto`,
Durrett Theorem 3.10.6 Cramér-Wold in the law-level textbook `theta · x`
form.  V337 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure`,
Durrett Theorem 3.10.6 Cramér-Wold in the textbook `theta · X_n` form for a
fixed source probability space.  V336 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution`,
Durrett Theorem 3.10.6 Cramér-Wold in the textbook `theta · X_n`
random-vector convergence-in-distribution form.  V335 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution`,
Durrett Theorem 3.10.6 Cramér-Wold in random-vector
convergence-in-distribution form.  V334 adds
`durrett2019_exercise_3_10_8_multivariateGaussian_of_centeredLinearCombination_law_eq_gaussianReal`,
the standalone centered reverse direction from real Gaussian laws of all finite
linear combinations to multivariate Gaussianity.  V333 adds
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`,
Exercise 3.10.8 centered linear-combination Gaussian-law wrappers from the
covariance table of the Gaussian law.  V332 adds
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`,
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`,
Exercise 3.10.8 centered linear-combination Gaussian-law source wrappers.
V331 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_sum`,
Durrett Theorem 3.10.7 literal centered normalized-sum canonical product
endpoint `S_n / sqrt n => chi`.  V330 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_centeredProduct`,
Durrett Theorem 3.10.7 centered literal expectation forms of the Gaussian
theta characteristic-function display.  V329 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_centeredProductSubMean`,
Durrett Theorem 3.10.7 literal expectation forms of the nonzero-mean Gaussian
theta characteristic-function display.  V328 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_centeredProductSubMean`,
Durrett Theorem 3.10.7 nonzero-mean Gaussian theta characteristic-function
displays from covariance-table, scalar coordinate covariance, and
centered-product covariance hypotheses.  V327 adds
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`,
Exercise 3.10.8 source-facing finite linear-combination characterization `iff`
wrappers from scalar coordinate covariance and centered-product covariance
hypotheses.  V326 adds
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_coordinateCovarianceTable`,
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_coordinateCovarianceTable`,
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_centeredProductSubMean`,
and
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_centeredProductSubMean`,
Section 3.10 Gaussian-coordinate independence source wrappers from scalar
covariance tables and centered-product covariance tables.  V325 adds
`durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
and
`durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`,
Exercise 3.10.8 forward real-Gaussian law wrappers from scalar coordinate
covariance and centered product source hypotheses.  V324 adds
`durrett2019_theorem_3_10_7_coordinateCovariance_eq_of_centeredProductSubMean`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
the nonzero-mean covariance-definition source bridge and literal normalized-sum
CLT endpoint for Durrett Theorem 3.10.7.  V323 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_coordinateCovariance`
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_centeredProduct`,
the Gaussian characteristic-function display from scalar coordinate covariance
and centered product source hypotheses.  V322 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
the literal normalized-sum canonical i.i.d. product endpoint for Durrett
Theorem 3.10.7.  V321 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean`,
the explicit mean-vector canonical i.i.d. product endpoint for Durrett
Theorem 3.10.7.  V320 adds
`durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`
and
`durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`, the
positive-variance and literal `S_n => sigma * chi` source endpoints for
Theorem 3.4.10.  V319 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_muSigmaSqrt`, the literal
Durrett `mu, sigma` display for Theorem 3.4.1.  V318 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_sigmaSqrt`, the exact Durrett
`sigma * sqrt n` denominator display.  V317 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_standardNormal`, the
textbook-normalized positive-variance i.i.d. CLT endpoint.  V316 adds
`durrett2019_theorem_3_4_10_lindebergFeller_unitVariance_of_integrableSq`, the
standard `N(0,1)` source endpoint for Theorem 3.4.10 from row-wise
independence, mean-zero square-integrable rows, variance-sum convergence to
`1`, and Lindeberg's condition.

Do not route future cycles back to the compiled Chapter 2.1 product/iid
wrappers, Theorem 2.4.9 empirical-CDF wrappers, Theorem 2.2 weak-law support,
Chapter 3.2 weak-convergence wrappers, Theorem 3.3.17 Lévy continuity wrappers,
Exercise 3.1.1, or the existing Theorem 3.4.10 analytic-certificate stack
unless a later Chapter 3 theorem exposes a precise missing primitive.

## Historical Section 4.7 Snapshot

V260-V262 close Theorem 4.6.1 and Theorem 4.6.2 support: conditional
expectation uniform integrability, dominated families, tail criteria,
deterministic tail envelopes, the scalar small-set modulus, and the clean
uniform-`L^p`, `p > 1`, endpoint
`durrett2019_theorem_4_6_2_uniformIntegrable_one_of_eLpNorm_bdd`.  V263 wraps
Mathlib's Vitali theorem in Durrett `L¹` form through
`durrett2019_theorem_4_6_3_tendstoInMeasure_and_unifIntegrable_iff_eLpNorm_one`,
the forward `UniformIntegrable` wrapper, and the `L¹`-to-probability/UI
consumers.  V264 adds the expectation-convergence `(iii)` layer:
`durrett2019_theorem_4_6_3_tendsto_integral_abs_of_eLpNorm_one_tendsto_zero`
and
`durrett2019_theorem_4_6_3_tendsto_integral_abs_of_tendstoInMeasure_uniformIntegrable`.
V265 starts Theorem 4.6.4 with the source forward implication
`durrett2019_theorem_4_6_4_submartingale_ae_tendsto_and_eLpNorm_one_tendsto_of_uniformIntegrable`
and the reverse `L¹`-to-`UnifIntegrable` bridge
`durrett2019_theorem_4_6_4_submartingale_unifIntegrable_of_eLpNorm_one_tendsto_zero`.
V266 upgrades the reverse implication to full probability `UniformIntegrable`
via `durrett2019_theorem_4_6_4_uniformIntegrable_of_eLpNorm_one_tendsto_zero`
and
`durrett2019_theorem_4_6_4_submartingale_uniformIntegrable_of_eLpNorm_one_tendsto_zero`.
V267 adds Lemma 4.6.5:
`durrett2019_lemma_4_6_5_tendsto_setIntegral_of_eLpNorm_one_tendsto_zero`.
V268 adds Lemma 4.6.6 and Theorem 4.6.7 route wrappers:
`durrett2019_lemma_4_6_6_martingale_ae_eq_condExp_of_eLpNorm_one_tendsto_zero`,
`durrett2019_theorem_4_6_7_martingale_ae_tendsto_and_eLpNorm_one_tendsto_of_uniformIntegrable`,
`durrett2019_theorem_4_6_7_exists_integrable_condExp_of_eLpNorm_one_tendsto_zero`,
and `durrett2019_theorem_4_6_7_uniformIntegrable_of_condExp_representation`.
V269 packages the compact Theorem 4.6.7 display forms
`durrett2019_theorem_4_6_7_uniformIntegrable_iff_exists_integrable_eLpNorm_one_tendsto_zero`
and
`durrett2019_theorem_4_6_7_uniformIntegrable_iff_exists_integrable_condExp`.
V270 packages Theorem 4.6.8 via Mathlib's Lévy upward theorem in a.s. and `L¹`
forms, both for an already `⨆ n, ℱ n`-measurable limit and for the target
conditional expectation onto `⨆ n, ℱ n`.  It also adds Theorem 4.6.9:
`durrett2019_theorem_4_6_9_levy_zero_one_condExp_indicator_ae_tendsto`.
V271 starts Theorem 4.6.10 with
`durrett2019_theorem_4_6_10_condExp_tendsto_of_abs_error_condExp_tendsto_zero`,
the final bridge from `E(|Y_n - Y| | ℱ_n) -> 0` a.s. to the desired varying
conditional-expectation convergence.  V272 adds
`durrett2019_theorem_4_6_10_abs_error_condExp_tendsto_zero_of_tail_condExp_bounds`,
the order-theoretic tail-envelope bridge that turns eventual fixed-tail
conditional bounds plus vanishing limiting tail conditionals into that source
estimate.  V273 discharges the fixed-tail upward convergence automatically via
Theorem 4.6.8 and adds
`durrett2019_theorem_4_6_10_abs_error_condExp_tendsto_zero_of_tail_bounds`
and `durrett2019_theorem_4_6_10_condExp_tendsto_of_tail_bounds`.  V274 adds
the pointwise-envelope lift
`durrett2019_theorem_4_6_10_error_condExp_le_tail_of_eventual_ae_bound`, the
source/final pointwise-tail consumers, and the dominated-integrability final
wrapper
`durrett2019_theorem_4_6_10_condExp_tendsto_of_eventual_ae_tail_bound_of_integrable_dominated`.
V275 adds
`durrett2019_theorem_4_6_10_tail_condExp_tendsto_zero_of_iSup_stronglyMeasurable`
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_iSup_tail_ae_tendsto_zero`,
which discharge limiting conditional tail-zero from limiting-sigma-field
measurability and a.s. convergence `W_N -> 0`.  V276 adds
`durrett2019_theorem_4_6_10_eventual_ae_tail_bound_of_pairwise_tail_bound`
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwise_iSup_tail_ae_tendsto_zero`,
which pass from pairwise tail bounds and `Y_n -> Y` a.s. to the eventual
pointwise limit-error bound.  V277 introduces the concrete `sSup` tail envelope
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope`, proves pairwise-bound
extraction from boundedness, adds a.e. boundedness and supplied-pairwise-bound
variants, and adds final consumers for the concrete envelope.  V278 discharges
the textbook `2Z` domination layer with
`durrett2019_theorem_4_6_10_pairwise_bound_two_mul_of_norm_le`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_norm_le_two_mul_of_norm_le`,
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_norm_dominated`.
V279 discharges `W_N -> 0` a.s. from `Y_n -> Y` a.s. through
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_tendsto_zero_of_tendsto`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_ae_tendsto_zero_of_ae_tendsto`,
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_pairwiseTailEnvelope_norm_dominated_of_ae_tendsto`.
V280 discharges limiting-sigma-field measurability of this `sSup` envelope and
adds the adapted final theorem endpoint:
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_stronglyMeasurable`,
`durrett2019_theorem_4_6_10_pairwiseTailEnvelope_stronglyMeasurable_of_stronglyAdapted`,
and
`durrett2019_theorem_4_6_10_condExp_tendsto_of_stronglyAdapted_dominated_ae_tendsto`.
V281 adds Exercise 4.6.7 `L¹` conditional-expectation convergence:
`durrett2019_exercise_4_6_7_condExp_diff_eLpNorm_one_le` and
`durrett2019_exercise_4_6_7_condExp_eLpNorm_one_tendsto_iSup_of_eLpNorm_one_tendsto`.
V282 starts Section 4.7 in `BackwardMartingale.lean`: it converts decreasing
natural sigma-fields into an `ℕᵒᵈ` filtration, packages textbook backwards
martingale data as a mathlib martingale, proves the terminal conditional
expectation representation, derives uniform integrability from that terminal
representation, exposes the shared order-dual a.s. convergence theorem as
Durrett Theorem 4.7.1, and adds the `L¹` convergence consumer for any
identified reverse-time limit.  V283 factors out the reverse-time read
uniform-integrability theorem, proves integrability of any identified a.s.
limit, and adds the Theorem 4.7.2 conditional-expectation identification from
`L¹` convergence and tail measurability:
`durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_L1_tendsto` and
`durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto`.
V284 closes the remaining Theorem 4.7.2 measurability step with the canonical
`limsup_n X_{-n}` modification and packages the source-shaped endpoint without
a separate tail-measurability assumption:
`durrett2019_theorem_4_7_2_limit_aestronglyMeasurable_tail_of_ae_tendsto` and
`durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto_backwards_martingale`.
V285 packages backwards Lévy Theorem 4.7.3: conditional expectations along a
decreasing filtration form a backwards martingale and converge a.s. and in
`L¹` to the conditional expectation on the reverse tail sigma-field.  The
compiled endpoints are
`durrett2019_theorem_4_7_3_condExp_ae_tendsto_tail_condExp`,
`durrett2019_theorem_4_7_3_condExp_eLpNorm_one_tendsto_tail_condExp`,
`durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_tail_condExp`, and
`durrett2019_theorem_4_7_3_condExp_nat_eLpNorm_one_tendsto_tail_condExp`.
V286 starts Example 4.7.4 with the tail-constant consumer
`durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_const_of_tail_condExp_ae_eq_const`,
the conditional-expectation process handoff
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_const`,
and the direct strong-law endpoint
`durrett2019_example_4_7_4_strongLaw_ae_real` reusing the local
`ProbabilityMeasure.strongLaw_ae_real` wrapper.  V287 adds
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_independent` and
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_independent`,
which discharge the V286 constant-tail hypothesis from independence of the
source sigma-field and the reverse tail.  V288 adds
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_tail_zero_or_one` and
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_zero_or_one`,
which discharge the same constant-tail side from a zero-one law for the
reverse tail sigma-field.  V289 adds
`durrett2019_example_4_7_4_tail_zero_or_one_of_iIndep_tailBlocks`,
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_iIndep_tailBlocks`,
and
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_iIndep_tailBlocks`,
which feed V288 from the compiled Durrett 4.3.8 Kolmogorov zero-one support
for independent tail blocks.  The next target is the exact Durrett source
layer.  V290 adds
`durrett2019_example_4_7_4_condExp_first_eq_invNat_prefixAverage` and
`durrett2019_example_4_7_4_condExp_first_eq_prefixAverage_div`, proving the
conditional-expectation algebra that turns prefix-sum measurability and the
symmetry input `E(ξ_i | 𝒢_n) = E(ξ_0 | 𝒢_n)`, `i < n`, into
`E(ξ_0 | 𝒢_n) = S_n / n`.  V291 defines the concrete zero-based
reverse-average sigma-field
`durrett2019_example_4_7_4_reverseAverageSigma ξ n =
σ(S_n, ξ_n, ξ_{n+1}, ...)` and proves prefix-sum measurability, strong
measurability, tail-coordinate measurability, and the ambient sub-sigma-field
fact.  V292 proves
`durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma_of_le`,
`durrett2019_example_4_7_4_reverseAverageSigma_antitone`, and
`durrett2019_example_4_7_4_condExp_first_eq_reverseAverageSigma_prefixAverage_div`,
so the concrete reverse-average family is decreasing and the conditional
average calculation is specialized to it.  V293 adds
`durrett2019_condExp_eq_of_invariant_measurableEquiv`,
`durrett2019_example_4_7_4_condExp_eq_zero_of_reverseAverage_invariant_equiv`,
and
`durrett2019_example_4_7_4_reverseAverageSigma_prefix_condExp_symmetry`,
converting reverse-average-event-preserving measure-preserving coordinate
transports into the finite-prefix conditional-expectation symmetry.  V294 adds
the reverse-average generator display and prefix/tail-invariance bridge:
`durrett2019_example_4_7_4_reverseAverageGeneratorSet`,
`durrett2019_example_4_7_4_reverseAverageSigma_eq_generateFrom`,
`durrett2019_example_4_7_4_preimage_reverseAverageSigma_eq_of_prefixSum_tail_invariant`,
and
`durrett2019_example_4_7_4_reverseAverageSigma_prefix_condExp_symmetry_of_prefixSum_tail_invariant`.
V295 specializes this to the iid infinite product coordinate-evaluation
process with finite coordinate swaps:
`durrett2019_example_4_7_4_eval_prefixSum_comp_natPermOfFin`,
`durrett2019_example_4_7_4_eval_tail_comp_natPermOfFin`,
`durrett2019_example_4_7_4_eval_coordinate_eq_zero_comp_prefixSwap`,
`durrett2019_example_4_7_4_eval_condExp_eq_zero_of_prefixSwap`,
`durrett2019_example_4_7_4_eval_prefix_condExp_symmetry_of_prefixSwaps`, and
`durrett2019_example_4_7_4_eval_condExp_first_eq_prefixAverage_div_product`.
V296 adds
`durrett2019_example_4_7_4_eval_integrable_of_integrable_id`,
`durrett2019_example_4_7_4_eval_condExp_first_eq_prefixAverage_div_product_of_integrable_id`,
and `durrett2019_example_4_7_4_eval_strongLaw_ae_real_of_integrable_id`.
V297 adds
`durrett2019_example_4_7_4_ae_tendsto_of_eventually_ae_eq_condExp_nat_and_tail_const`,
`durrett2019_example_4_7_4_ae_tendsto_of_eventually_ae_eq_condExp_nat_and_tail_zero_or_one`,
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_tail_zero_or_one`.
V298 adds
`durrett2019_example_4_7_4_eval_prefixSum_comp_tailFixingPerm`,
`durrett2019_example_4_7_4_eval_tail_comp_tailFixingPerm`,
`durrett2019_example_4_7_4_eval_reverseAverageSigma_le_permutationSymmetric`,
and
`durrett2019_example_4_7_4_eval_reverseAverageTail_le_permutationSymmetricTail`.
V299 adds
`durrett2019_example_4_7_4_eval_reverseAverage_tail_zero_or_one_of_permutationSymmetric_tail`
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_permutationSymmetric_tail_zero_or_one`.
V300 adds reusable VdVW/Hewitt-Savage finite-permutation support:
`preimage_vdVWPermuteNatSequence_eq_of_measurableSet_permutationSymmetricTail`,
`preimage_vdVWPermuteNatSequence_natPermOfFin_eq_of_measurableSet_permutationSymmetricTail`,
`setIntegral_vdVWInfiniteProductMeasure_comp_permuteNatSequence_of_measurableSet_permutationSymmetricTail`,
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_preimage_natPermOfFin_eq`,
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_setIntegral_natPermOfFin_eq`.
V301 adds the self-independence-to-zero-one consumer layer:
`vdVWPermutationSymmetricTail_measure_zero_or_one_of_indep_self`,
`vdVWPermutationSymmetricTail_measure_zero_or_one_all_of_indep_self`,
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_zero_or_one_of_indep_self`,
`durrett2019_example_4_7_4_eval_reverseAverage_tail_zero_or_one_of_permutationSymmetric_tail_indep_self`,
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_permutationSymmetric_tail_indep_self`.
V302 adds finite-prefix/future-coordinate-tail independence support:
`durrett2019_theorem_4_3_8_prefixFiltration_le_iSup_coordinateSigma_lt`,
`durrett2019_theorem_4_3_8_prefixCoordinateSigma_indep_tailCoordinateSigma_infinitePi`,
`durrett2019_theorem_4_3_8_prefixFiltration_indep_tailCoordinateSigma_infinitePi`,
and
`durrett2019_example_4_7_4_eval_prefixFiltration_indep_tailCoordinateSigma`.
V303 adds transported-prefix Hewitt-Savage support:
`vdVWPermutationSymmetricMeasurableSpace_le`,
`vdVWPermutationSymmetricTail_le`,
`durrett2019_example_4_7_4_permuteNatSequence_prefixFiltration_tailCoordinateSigma_measurable`,
`durrett2019_example_4_7_4_preimage_permuteNatSequence_prefixFiltration_tailCoordinateSigma`,
`durrett2019_example_4_7_4_eval_prefixFiltration_indep_permuted_prefix`,
`durrett2019_example_4_7_4_eval_prefix_inter_permuted_prefix_measure_eq_mul`,
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_inter_prefix_eq_inter_permuted_prefix`.
V304 adds the prefix-limit self-independence bridge:
`durrett2019_example_4_7_4_eval_tail_prefix_product_of_permuted_prefix_limit`
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product_limit`.
V305 adds the prefix symmetric-difference approximation-to-limit bridge:
`durrett2019_example_4_7_4_tendsto_measure_of_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_tendsto_measure_inter_of_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_eval_prefixLimit_of_symmDiff_prefix_approx`, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product_symmDiff_approx`.
V306 adds the finite-prefix approximation basis:
`durrett2019_example_4_7_4_finitePrefixEventSet`,
`durrett2019_example_4_7_4_finitePrefixEventSet_isSetRing`,
`durrett2019_example_4_7_4_finitePrefixEventSet_generateFrom`,
`durrett2019_example_4_7_4_exists_measure_symmDiff_lt_finitePrefixEventSet`,
`durrett2019_example_4_7_4_exists_prefix_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_eval_prefixApprox`, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product`.
The next target is the finite-prefix product formula for a
permutation-symmetric tail event and a finite-prefix event, then applying
V304, V305, V306, and V301.
V259
finishes the concrete Example 4.5.8 terminal-condition packet: the
unit-variance, Rademacher, and canonical Rademacher random-walk endpoints now
use the exact textbook finite square-root stopping-time assumption
`∫⁻ ω, ENNReal.ofReal (Real.sqrt ((N ω).untopA : ℝ)) ∂P ≠ ∞`, and the reusable
general bridge is
`durrett2019_example_4_5_8_stoppedLinearRandomWalk_terminal_integral_eq_zero_of_iIndepFun_zeroMean_secondMoments_sqrt_lintegral_ne_top`.
V258 closes the main Theorem 4.5.7/Example 4.5.8 source bridge by weakening
`Integrable Ainf` to `AEMeasurable Ainf P` plus finite square-root terminal
clock.  V257 adds the canonical
infinite iid Rademacher product-space endpoint:
`rademacherBoolSequenceLaw`, `rademacherSequenceCoordinate`,
`rademacherSequenceCoordinate_hasLaw`,
`rademacherSequenceCoordinate_iIndepFun`, and
`durrett2019_example_4_5_8_canonicalRademacherRandomWalk_terminal_integral_eq_zero`.
V256 adds the simple
symmetric random-walk specialization of Example 4.5.8: Rademacher law
mean/second-moment/`L^2` transfer in
`StatInference/ProbabilityMeasure/Rademacher.lean`, unit variance clock
`A_n = n`, stopped unit-clock display as `(N ω).untopA`, and the endpoint
`durrett2019_example_4_5_8_stoppedLinearRandomWalk_terminal_integral_eq_zero_of_iIndepFun_rademacher`.
V255 adds the
linear-random-walk source bridge:
`durrett2019_example_4_5_8_stoppedLinearRandomWalk_terminal_integral_eq_zero_of_iIndepFun_zeroMean_secondMoments`.
It reuses the compiled Exercise 4.4.6 square-minus-variance-clock martingale for
independent mean-zero increments, stops it at `N`, derives stopped clock
predictability/monotonicity and stopped-value limits, and concludes
`E[S_N] = 0` assuming a.s. finite `N` and integrability of the stopped variance
clock.  V254 adds the stopped-process
specialization:
`durrett2019_example_4_5_8_stoppedProcess_integral_limit_eq_zero_of_theorem_4_5_7_source`.
It derives the finite-horizon zero expectations for `S_{N ∧ n}` from bounded
optional stopping applied to `N ∧ n`, then feeds the V253 dominated/4.5.7 bridge.
V253 adds the first downstream consumer of the closed 4.5.7 endpoint:
`durrett2019_theorem_4_5_7_runningAbsSup_integrable_of_source_square_minus_martingale_monotone_terminal`,
`durrett2019_example_4_5_8_integral_limit_eq_zero_of_dominated`, and
`durrett2019_example_4_5_8_integral_limit_eq_zero_of_theorem_4_5_7_source`.
V252 removes the remaining
manual boundedness/finiteness side inputs from the canonical infinite-horizon
source endpoint.  It adds
`durrett2019_runningAbsMax_ae_bddAbove_of_iSup_lintegral_ne_top`,
`durrett2019_integrable_sqrt_of_integrable_nonneg`,
`durrett2019_lintegral_sqrt_ne_top_of_integrable_nonneg`,
`durrett2019_theorem_4_5_7_sqrt_lintegral_ne_top_of_source_monotone_terminal`,
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal_of_sqrt_lintegral_ne_top`,
and the clean source-facing
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`.
The next Durrett route should stop recursing on this endpoint and move through
the V255 Rademacher/simple-walk specialization.  V251 adds the
infinite-horizon monotone-convergence endpoint for Theorem 4.5.7:
`durrett2019_runningAbsMax_lintegral_iSup_le_of_lintegral_le`,
`durrett2019_theorem_4_5_7_lintegral_iSup_runningAbsMax_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`,
`durrett2019_iSup_ofReal_runningAbsMax_eq_ofReal_runningAbsSup_of_bddAbove`,
`durrett2019_lintegral_iSup_runningAbsMax_eq_lintegral_runningAbsSup_of_ae_bddAbove`,
and
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal_ae_bddAbove`.
V201 compiles the
source square-minus stopped certificate, finite-terminal threshold cover,
countable threshold event-cover assembly, and monotone-terminal source wrapper
for Theorem 4.5.2.  V202 removes the manual stopped running-maximum
boundedness input: stopped terminal square estimates now produce the required
a.s. boundedness and feed no-`hBdd` convergence wrappers through the monotone
terminal source endpoint.  V203 removes the manual stopped-predictability
input: stopped predictability of `A^N` is now derived from
`IsStronglyPredictable ℱ A`, and the threshold/source/cover/monotone-terminal
auto endpoints have no manual `hStoppedA_predictable` side condition.  V204
adds the exact event-facing finite-variance package: the threshold cover and
source monotone-terminal convergence endpoint now conclude on an arbitrary
event `FiniteVar`, matching the textbook's `{A∞ < ∞}` side.  V205 starts
Theorem 4.5.3 with a random-normalizer Kronecker bridge:
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_transform_tendsto`.
V205 also adds the reciprocal-transform predictability and reciprocal
nonnegative/upper-bound support from `f(A_n) >= 1`.  V206 adds
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_scaled_summable`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_scaled_summable`,
so scaled summability now feeds the reciprocal random-normalizer endpoint
directly.  V207 adds
`durrett2019_theorem_4_5_3_scaled_summable_of_integral_le_variance_ratio`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_variance_ratio_summable`,
so the variance-ratio series now feeds the reciprocal random-normalizer
endpoint once the source comparison and summability estimates are supplied.
V208 adds
`durrett2019_theorem_4_5_3_integral_mul_sq_le_of_condExp_square_le`, the
Mathlib-shaped conditional-variance pull-out core.  V209 instantiates it with
the textbook reciprocal normalizer and martingale increment through
`durrett2019_theorem_4_5_3_reciprocal_comp_integral_le_variance_increment_of_condExp_square_le`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_variance_ratio_summable`.
V210 adds
`durrett2019_theorem_4_5_3_interval_variance_ratio_le_integral_inv_sq`, the
scalar deterministic interval comparison behind Durrett's displayed
`ΔA/f(A_{n+1})^2 ≤ ∫_[A_n,A_{n+1}] f(t)^{-2} dt` estimate.  V211 adds
`durrett2019_theorem_4_5_3_finite_sum_variance_ratio_le_integral_clock`, the
finite pathwise clock-sum lift.  V212 adds
`durrett2019_theorem_4_5_3_variance_ratio_summable_of_integral_clock_bound`
and
`durrett2019_theorem_4_5_3_tsum_variance_ratio_le_of_integral_clock_bound`,
the deterministic summability and total-bound package from a uniform
finite-clock-integral bound.  V213 adds the random pathwise lift:
`durrett2019_theorem_4_5_3_ae_variance_ratio_summable_of_integral_clock_bound`
and
`durrett2019_theorem_4_5_3_ae_tsum_variance_ratio_le_of_integral_clock_bound`.
V214 adds
`durrett2019_theorem_4_5_3_finite_integral_variance_ratio_le_integral_clock`,
`durrett2019_theorem_4_5_3_integral_variance_ratio_summable_of_integral_clock_bound`,
and
`durrett2019_theorem_4_5_3_tsum_integral_variance_ratio_le_of_integral_clock_bound`,
closing the finite integrated/Fubini variance-ratio summability package for
`b_n = f(A_n)`.  V215 adds
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound`,
feeding V214 directly into the V209 source endpoint and deriving the endpoint
lower bound `1 <= f(A_n)` from the interval source lower bound.  V216 adds
`durrett2019_theorem_4_5_3_clock_interval_le_tail_integral_bound`,
`durrett2019_theorem_4_5_3_integrated_clock_bound_of_tail_integral_bound`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound`,
using the global tail integral over `[0, ∞)` to remove the manual uniform
integrated clock-bound input.  V217 adds the bounded-multiplier `MemLp`
support and process-`L^2` endpoint wrappers:
`durrett2019_theorem_4_5_3_reciprocal_comp_transform_memLp_two_of_process_memLp`,
`durrett2019_theorem_4_5_3_reciprocal_comp_scaled_sq_integrable_of_process_memLp`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp`.
V218 adds the bounded-multiplier `Integrable` support and clock-integrable
endpoint wrappers:
`durrett2019_theorem_4_5_3_variance_ratio_integrable_of_clock_integrable`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound_of_process_memLp_clock_integrable`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable`.
V219 adds finite random clock-integrability support and the auto-clock endpoint
wrapper:
`durrett2019_theorem_4_5_3_finite_clock_integral_integrable_of_tail_integral_bound`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock`.
V220 adds interval-integrability, reciprocal-square-continuity, and
normalizer-increment support:
`durrett2019_theorem_4_5_3_interval_integrable_of_reciprocal_sq_continuous`,
`durrett2019_theorem_4_5_3_reciprocal_sq_continuous_of_continuous_ne_zero`,
`durrett2019_theorem_4_5_3_reciprocal_comp_normalizer_increment_nonneg`, and
the two auto interval/monotonicity endpoint wrappers.  V221 adds global
normalizer source support:
`durrett2019_theorem_4_5_3_interval_one_le_of_global_one_le`,
`durrett2019_theorem_4_5_3_ne_zero_of_global_one_le`,
`durrett2019_theorem_4_5_3_interval_mono_of_monotone`,
`durrett2019_theorem_4_5_3_reciprocal_comp_atTop_of_clock_atTop`, and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono_atTop`.
V222 closes the deterministic normalizer divergence from the exact textbook
`f` hypotheses:
`durrett2019_theorem_4_5_3_normalizer_atTop_of_integrable_inv_sq` and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono`.
V223 packages the event-local infinite-clock conclusion:
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_transform_tendsto`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_scaled_summable`,
`durrett2019_theorem_4_5_3_reciprocal_comp_atTop_on_of_clock_atTop_on`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_integral_clock_bound`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono_atTop`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono`.
V224 starts Theorem 4.5.5, Second Borel-Cantelli III, with the ratio endpoint
and finite-limit denominator layer:
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_normalized`
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_exists_tendsto`
plus the supporting deterministic and Borel-Cantelli process display
declarations.  V225 adds the martingale-increment, denominator-increment, and
conditional-variance clock bridge:
`durrett2019_theorem_4_5_5_martingalePart_process_increment_eq`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_increment_eq`, and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_conditionalProbabilitySum_increment`.
V226 discharges the Bernoulli conditional-variance estimate and automatic
integrability side conditions:
`durrett2019_theorem_4_5_5_condExp_centered_indicator_sq_le_of_source`,
`durrett2019_theorem_4_5_5_condExp_centered_borelCantelli_indicator_sq_le`,
`durrett2019_theorem_4_5_5_condExp_centered_borelCantelli_indicator_sq_le_auto`,
and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_conditionalProbabilitySum_increment_auto`.
V227 adds the `max(A_n,1)` denominator handoff and finite/infinite ratio
assembly:
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_of_max_one_normalizer`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_on_of_max_one_normalizer`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_max_one_normalized`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_max_one_normalized`.
V228 adds the Theorem 4.5.3 infinite-clock specialization wrapper for
`f(t)=max t 1` and the finite/infinite ratio assembly that consumes it:
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_conditionalProbabilitySum_clock`
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_conditionalProbabilitySum_clock`.
V229 adds the adapted-event source wrapper for the infinite-clock side:
`durrett2019_theorem_4_5_5_measurableSet_of_adapted`,
`durrett2019_theorem_4_5_5_martingalePart_process_zero`,
`durrett2019_theorem_4_5_5_martingalePart_process_memLp_two`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_predictable`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_integrable`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_zero_nonneg`, and
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock`.
V230 adds the exact textbook tail-integral certificate and auto-tail endpoint
wrappers:
`durrett2019_theorem_4_5_5_max_one_inv_sq_integrableOn_Ici`,
`durrett2019_theorem_4_5_5_integral_max_one_inv_sq_Ici`,
`durrett2019_theorem_4_5_5_integral_max_one_inv_sq_Ici_le_two`,
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock_auto_tail`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_adapted_conditionalProbabilitySum_clock_auto_tail`.
V231 proves the source clock monotonicity in the form Mathlib can honestly
provide:
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_mono_step_ae`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_mono_step_ae_on`, and
`durrett2019_theorem_4_5_5_max_one_conditionalProbabilitySum_increment_nonneg_ae`.
V232 introduces the clipped canonical conditional-probability clock, proves its
predictability, integrability, pointwise monotonicity, finite/all-time a.e.
equality with the raw textbook clock, and its conditional-variance domination:
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_increment_eq`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_predictable`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_integrable`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_zero_nonneg`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_mono_step`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_ae_eq_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_ae_eq_conditionalProbabilitySum_all`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_atTop_on_of_conditionalProbabilitySum`,
and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_nonnegativeConditionalProbabilitySum_increment_auto`.
It also adds the canonical infinite-clock and ratio wrappers
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`,
removing raw pointwise monotonicity from the active source surface.  V233 adds
the finite square-clock route:
`durrett2019_martingale_square_sub_predictablePart_martingale`,
`durrett2019_theorem_4_5_5_predictablePart_martingalePart_square_le_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_exists_tendsto_on_of_conditionalProbabilitySum_tendsto`,
`durrett2019_theorem_4_5_5_martingalePart_exists_tendsto_on_of_predictablePart_square_tendsto`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_square_clock_finite_or_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`.
V234 adds the infinite-clock limsup endpoint:
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_atTop_on_limsup_of_adapted`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_adapted_conditionalProbabilitySum_atTop`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_limsup_of_adapted`.
The denominator divergence on `limsup B atTop` now comes from the existing
conditional Borel-Cantelli theorem, and the canonical Theorem 4.5.3 route
proves the ratio limit there.  The next target is final theorem packaging or
the precise finite/no-limsup complement statement; do not spend the next packet
on raw-clock monotonicity, denominator divergence on `limsup`, or another
max-normalizer handoff.
V235 adds the final textbook-facing Theorem 4.5.5 package:
`durrett2019_theorem_4_5_5_ratio_tendsto_one_of_adapted_conditionalProbabilitySum_atTop`
and
`durrett2019_theorem_4_5_5_conditional_borel_cantelli_ratio_package_of_adapted`.
The active target now moves to Durrett Theorem 4.5.7, beginning with the
stopped maximal-probability estimate and layer-cake/integral split for
`E(sup_n |X_n|) <= 3 E(A_infty^(1/2))`; do not route back to final 4.5.5
packaging.
V236 starts Theorem 4.5.7 with the finite-horizon maximal-probability layer:
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_sq`,
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_terminal_sq`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_of_terminal_sq_le`,
and
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_of_terminal_sq_le`.
V237 adds the stopped terminal-square min-bound layer:
`durrett2019_theorem_4_5_7_stoppedProcess_le_terminal_of_process_le`,
`durrett2019_theorem_4_5_7_min_terminal_integrable_of_terminal_integrable`,
`durrett2019_theorem_4_5_7_stopped_square_integral_le_min_terminal_of_stopped_bounds`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_terminal_integrable`.
V238 adds the source-facing stopped terminal-square wrappers:
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity_monotone_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V239 adds
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`,
the source-facing stopped maximal-probability bound.
V240 adds
`durrett2019_theorem_4_5_7_runningAbsMax_eq_stopped_of_firstPredictableAbove_eq_top`,
`durrett2019_theorem_4_5_7_runningAbsMax_event_subset_terminal_tail_union_stopped`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_stopped`,
and
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_min_terminal_of_source_square_minus_martingale_monotone_terminal`,
the raw/stopped survival split and source-facing raw finite-horizon
probability bound.
V241 adds
`durrett2019_theorem_4_5_7_lintegral_le_lintegral_tail_bound_lt` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_terminal_tail_add_min_terminal_lintegral_of_source_square_minus_martingale_monotone_terminal`,
the finite-horizon layer-cake handoff from V240 to extended expectations.  The
V242 adds
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral` and
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral_of_integrable`,
the first deterministic RHS bridge
`∫_0^∞ P(A_infty > a^2) da = E sqrt(A_infty)`.
V243 adds
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral`,
`durrett2019_theorem_4_5_7_terminal_nonneg_of_initial_zero_monotone_tendsto`,
and
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral_of_source_monotone_terminal`,
the truncation layer-cake bridge for
`E(A_infty ∧ a^2)`.  V244 adds
`durrett2019_theorem_4_5_7_set_lintegral_div_toNNReal_sq`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral_of_source_monotone_terminal`,
the weighted double-integral handoff for the second RHS term.  V245 adds
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable_of_aemeasurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_aemeasurable`,
and
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_integrable`,
the source-level Tonelli/measurability swap layer.  V246 adds
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_integrable`,
and
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_source_monotone_terminal`,
the `p = 1/2` square-root weighted-tail layer-cake endpoint.  V247 adds
`durrett2019_theorem_4_5_7_inv_sq_weight_of_toNNReal_sq`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_rpow_neg_two`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_rpow_neg_two`,
`durrett2019_theorem_4_5_7_ofReal_sqrt_inv_eq_rpow_half_sub_one`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_toNNReal_sq_inv_eq_tail_weight`,
and
`durrett2019_theorem_4_5_7_const_div_lintegral_Ioi_sqrt_toNNReal_sq`,
the inverse-square denominator/calculus layer for the fixed-`b` inner
integral.  V248 adds
`durrett2019_theorem_4_5_7_lintegral_Ioi_zero_indicator_Ioi_sqrt` and
`durrett2019_theorem_4_5_7_tail_cut_inner_lintegral_eq_tail_weight`,
the fixed-`b` event-split inner-integral layer.  V249 adds
`durrett2019_theorem_4_5_7_tail_cut_double_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral_of_source_monotone_terminal`,
the outer second-RHS assembly.  V250 adds
`durrett2019_theorem_4_5_7_terminal_tail_sq_measure_aemeasurable` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`,
the finite-horizon `3 * E sqrt(A_infty)` endpoint.  The next target is the
monotone finite-horizon-to-supremum limit; do not redo the Doob/Kolmogorov probability
conversion, stopped-source packaging, raw/stopped survival packaging, V241
layer-cake handoff, V242 first-RHS bridge, V243 truncation layer-cake bridge,
V244 weighted double-integral handoff, V245 Tonelli swap layer, or V246
square-root weighted-tail endpoint, or V247 inverse-square denominator
calculus, or V248 fixed-`b` inner integral, or V249 second-RHS assembly, or
V250 finite-horizon aggregation.

Closed Chapter 2 support remains available in
`StatInference/ProbabilityTheory/Basic.lean`, with empirical-CDF support in
`StatInference/EmpiricalProcess/RealHalfLine*.lean` and
`StatInference/EmpiricalProcess/GlivenkoCantelli.lean`.  Chapter 2.1 now has
independence/product-law wrappers through Theorem 2.1.13, including Theorem
2.1.10 partial-sum/block-independence source wrappers
`durrett2019_theorem_2_1_10_indepFun_lateIncrementSum_earlyBlockFunction`,
`durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockFunction`, and
`durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockIndicator`,
Theorem 2.1.12 source-facing nonnegative and integrable independent-pair
expectation formulas
`durrett2019_theorem_2_1_12_indepFun_lintegral_pair` and
`durrett2019_theorem_2_1_12_indepFun_integral_pair`, Theorem 2.1.13
finite-set/range/interval product-expectation and zero-mean-factor consumers
`durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_prod_integral`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_zero_of_integral_eq_zero`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_range_prod_eq_prod_integral`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_range_prod_eq_zero_of_integral_eq_zero`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_Ico_prod_eq_prod_integral`, and
`durrett2019_theorem_2_1_13_iIndepFun_integral_Ico_prod_eq_zero_of_integral_eq_zero`,
Theorem 2.2.1 covariance and finite/range variance-sum support
`durrett2019_theorem_2_2_1_uncorrelated_covariance_eq_zero`,
`durrett2019_theorem_2_2_1_variance_finsetSum_of_uncorrelated`,
`durrett2019_theorem_2_2_1_variance_rangeSum_of_uncorrelated`,
`durrett2019_theorem_2_2_1_iIndepFun_integral_mul_eq_mul_integral`,
`durrett2019_theorem_2_2_1_variance_finsetSum_of_iIndepFun`, and
`durrett2019_theorem_2_2_1_variance_rangeSum_of_iIndepFun`,
Theorem 2.1.15's CDF
convolution handoffs
`durrett2019_theorem_2_1_15_product_cdf_convolution` and
`durrett2019_theorem_2_1_15_indepFun_cdf_convolution`, and the first Theorem
2.1.16 convolution-law / density-existence support:
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_conv`,
`durrett2019_theorem_2_1_16_conv_absolutelyContinuous_of_left_density`,
`durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_density`,
`durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_real_density`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_of_supplied_density`,
`durrett2019_theorem_2_1_16_conv_withDensity_left_lintegral`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_lintegral_density`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_real_lintegral_density`,
`durrett2019_theorem_2_1_16_two_density_lintegral_kernel_eq`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_lintegral_density`,
and `durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_real_lintegral_density`.
Theorem 2.4.9 now has
the arbitrary-law cutpoint-chain route and both the book-style and exact
outer-a.s. empirical-CDF endpoints:
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure`.
V307 also packages the canonical infinite iid product-coordinate source shape
and canonical empirical-CDF conclusions:
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_coordinates`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_canonical_iid`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid`.
V308 adds the exact range-sum display wrappers:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum`
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_range_sum`.
V309 adds the exact `n^{-1} * sum` display wrappers:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum`
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_inv_mul_range_sum`.
V310 adds the direct `iIndepFun` source wrappers:
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun`.
V311 adds the infinite-product-law source criterion and product-law consumers:
`durrett2019_theorem_2_1_11_iid_sequence_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_hasLaw_infinitePi`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_hasLaw_infinitePi`.
V312 adds the identical-distribution source bridge and consumers:
`durrett2019_theorem_2_1_11_hasLaw_of_identDistrib_zero`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun_identDistrib`.
V313 adds the pairwise-iid source consumers:
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_pairwise_identDistrib`.
V314 adds the countable product-law wrappers:
`durrett2019_theorem_2_1_11_iIndepFun_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iid_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_infinitePi`, and
`durrett2019_theorem_2_1_11_iid_iff_hasLaw_infinitePi`.
V315 adds the standard iid source-shape product-law wrappers:
`durrett2019_theorem_2_1_11_iid_hasLaw_infinitePi_of_identDistrib` and
`durrett2019_theorem_2_1_11_iid_iff_hasLaw_infinitePi_of_identDistrib`.
Theorem 2.2.3 now has finite-block variance scaling, the `C / n` variance
bound, the source-facing `E (S_n / n - μ)^2 <= C / n` display for uncorrelated
and independent blocks, the `L^2 -> TendstoInMeasure` Lemma 2.2.2
specialization, and the average convergence-in-probability consumer from
supplied centered `eLpNorm` convergence.  V185 closes the remaining
finite-bound-to-`atTop` bridge: `E (S_n / n - μ)^2 <= C / n` now yields
centered `eLpNorm` convergence and then `TendstoInMeasure` for both
uncorrelated and independent source hypotheses.  V186 adds Theorem 2.2.6:
ordinary second moments tending to zero now imply `eLpNorm` convergence and
convergence in probability, the normalized centered square-moment identity is
packaged as `Var(S_n) / b_n^2`, and the source-facing normalized variance weak
law compiles.  V187 adds the first 2.2.11 truncation packet: source notation
for `bar X_{n,k}`, `S_n`, and `bar S_n`; the event inclusion
`{S_n != bar S_n} subset union_k {|X_{n,k}| > b_n}`; the finite union
probability bound; and the convergence-in-probability replacement bridge from
hypothesis (i).  V188 adds the truncated-row variance/centering half and the
combined centered triangular-row weak-law assembly:
`durrett2019_theorem_2_2_11_truncatedMeanRowSum`,
`durrett2019_theorem_2_2_11_integral_truncatedRowSum_eq_truncatedMeanRowSum`,
`durrett2019_theorem_2_2_11_truncatedRowSum_memLp_two`,
`durrett2019_theorem_2_2_11_variance_truncatedRowSum_le_secondMomentSum`,
`durrett2019_theorem_2_2_11_variance_div_sq_tendsto_zero_of_truncatedSecondMoment`,
`durrett2019_theorem_2_2_11_tendstoInMeasure_truncatedRowSum_sub_mean_of_truncatedSecondMoment`,
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncated`,
and
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncatedSecondMoment`.
V189 adds source-side truncation inheritance:
`durrett2019_theorem_2_2_11_measurable_truncationMap`,
`durrett2019_theorem_2_2_11_measurable_truncated`,
`durrett2019_theorem_2_2_11_norm_truncated_le_abs_bound`,
`durrett2019_theorem_2_2_11_truncated_memLp_two_of_measurable`, and
`durrett2019_theorem_2_2_11_iIndepFun_truncated_of_iIndepFun`, and the
source-facing original-row wrapper
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_iIndepFun`.
V190 adds the first Theorem 2.2.12 single-sequence specialization
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_sub_truncatedMean_of_iIndepFun`.
V191 adds the exact Theorem 2.2.12 centering/display bridge:
`durrett2019_theorem_2_2_12_truncatedMean`,
`durrett2019_theorem_2_2_12_truncatedMeanRowSum_eq_nat_mul_truncatedMean_of_integral_eq`,
`durrett2019_theorem_2_2_12_integral_truncated_eq_truncatedMean_of_identDistrib`,
`durrett2019_theorem_2_2_12_truncatedMeanRowSum_eq_nat_mul_truncatedMean_of_identDistrib`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun`.
The textbook display `S_n / n - mu_n -> 0` now compiles from the already
compiled Theorem 2.2.11 numeric hypotheses, independence, measurability, and
identical distribution.
V192 adds the row-to-single numeric reductions for Theorem 2.2.12:
`durrett2019_theorem_2_2_12_tailSum_eq_nat_mul_tailProb_of_identDistrib`,
`durrett2019_theorem_2_2_12_tailSum_tendsto_zero_of_identDistrib`,
`durrett2019_theorem_2_2_12_integral_truncated_sq_eq_single_of_identDistrib`,
`durrett2019_theorem_2_2_12_truncatedSecondMoment_tendsto_zero_of_single`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_single`.
V193 adds the real-to-natural large-jump bridge
`durrett2019_theorem_2_2_12_nat_tail_tendsto_zero_of_real_tail` and the
source-facing endpoint
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_single_second`.
V194 adds the first Lemma 2.2.13 / second-bound consumer layer:
`durrett2019_lemma_2_2_13_lintegral_rpow_tail_lt`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_eventual_bound`, and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_second_bound`.
V195 adds the tail-average/Cesaro bridge:
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_bounded_tendsto_zero`
and
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_real_tail`.
V196 adds the automatic local-integrability and exact tail-average endpoint
layer:
`durrett2019_theorem_2_2_12_tail_profile_integrableOn`,
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_real_tail_auto_integrable`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_tail_average_bound`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_tail_average_bound_auto_integrable`,
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_tail_average_bound`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_tail_average_bound_auto_integrable`.
V197 adds the truncated-tail event support:
`durrett2019_theorem_2_2_12_abs_truncated_le_abs`,
`durrett2019_theorem_2_2_12_abs_truncated_le_level`,
`durrett2019_theorem_2_2_12_truncated_tail_subset_original`,
`durrett2019_theorem_2_2_12_measureReal_truncated_tail_le_original`,
and
`durrett2019_theorem_2_2_12_measureReal_truncated_tail_eq_zero_of_level_le`.
V198 adds
`durrett2019_theorem_2_2_12_tail_average_bound_of_truncated_layercake`, so a
supplied ordinary layer-cake display for the truncated square moment now feeds
the exact tail-average bound.  V199 adds the ordinary square-tail layer-cake
support and finite-support radius bridge:
`durrett2019_theorem_2_2_12_truncated_sq_integrable`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_tail_sq`,
`durrett2019_theorem_2_2_12_sq_tail_event_eq_abs_tail`,
`durrett2019_theorem_2_2_12_measureReal_sq_tail_eq_abs_tail`,
`durrett2019_theorem_2_2_12_truncated_layercake_Ioc_of_Ioi`, and
`durrett2019_theorem_2_2_12_tail_average_bound_of_truncated_layercake_Ioi`.
V200 closes the layer-cake blocker and packages the source endpoint:
`durrett2019_lemma_2_2_13_lintegral_abs_sq_tail_lt`,
`durrett2019_lemma_2_2_13_integral_abs_sq_tail_lt`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius_lintegral`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius_eventually`,
`durrett2019_theorem_2_2_12_tail_average_bound_of_layercake`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_real_tail`, and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail`.
Do not redo the square-tail layer, the finite-support cutdown, the `p = 2`
ordinary radius-layer-cake conversion, or the 2.2.12 source endpoint.  The next
active frontier is the next unsaturated textbook spine, with Chapter 3 weak
convergence / characteristic functions / CLT wrappers as the dashboard-backed
default unless a later theorem exposes a missing Chapter 2 primitive.
Do not route future cycles back to solved 2.1.10 partial-sum,
2.1.13 product-consumer, 2.2.1 variance-sum, 2.2.3, 2.2.6, 2.4.9, 2.1.12,
2.1.15, or 2.1.16 plumbing unless the user explicitly pivots.
The V143-V176 packets added `durrett2019_exercise_4_4_6_varianceClock_succ`,
`durrett2019_exercise_4_4_6_squareMinusVarianceClock_condExp_succ_eq`,
`durrett2019_exercise_4_4_6_squareMinusVarianceClock_martingale_of_source`,
`durrett2019_exercise_4_4_6_smallBall_bound_of_source`,
`durrett2019_exercise_4_4_6_incrementSquare_condExp_natural_ae_eq_sigmaSq_of_iIndepFun`,
`durrett2019_exercise_4_4_6_linearRandomWalk_squareMinusVarianceClock_martingale_of_iIndepFun_zeroMean_secondMoments`,
and
`durrett2019_exercise_4_4_6_linearRandomWalk_smallBall_bound_of_iIndepFun_zeroMean_secondMoments`,
plus `durrett2019_exercise_4_4_9_two_martingales_product_integral_succ` and
`durrett2019_exercise_4_4_9_two_martingales_product_integral_sub_initial_eq_sum_increment_products`,
and `durrett2019_exercise_4_4_10_martingale_square_integral_succ` plus
`durrett2019_exercise_4_4_10_martingale_square_integral_sub_initial_eq_sum_increment_sq`,
`durrett2019_exercise_4_4_10_martingale_increment_sq_integral_eq_square_integral_sub`,
and
`durrett2019_exercise_4_4_10_martingale_increment_sq_integral_eq_sum_Ico_increment_sq`,
`durrett2019_exercise_4_4_10_martingale_eLpNorm_increment_le_of_Ico_sum_le`,
`durrett2019_exercise_4_4_10_Ico_sum_le_tsum_tail_of_summable`,
`durrett2019_exercise_4_4_10_Ico_sum_increment_sq_le_tsum_tail_of_summable`,
and
`durrett2019_exercise_4_4_10_martingale_eLpNorm_increment_le_tsum_tail_of_summable`,
`durrett2019_exercise_4_4_10_tsum_tail_tendsto_zero_of_summable`,
`durrett2019_exercise_4_4_10_increment_sq_tsum_tail_tendsto_zero_of_summable`,
and
`durrett2019_exercise_4_4_10_eventually_eLpNorm_increment_le_of_summable`,
`durrett2019_exercise_4_4_10_martingale_toLp_cauchySeq_of_summable`,
`durrett2019_exercise_4_4_10_martingale_exists_toLp_tendsto_of_summable`,
`durrett2019_exercise_4_4_10_martingale_eLpNorm_two_bdd_of_summable`,
`durrett2019_exercise_4_4_10_martingale_eLpNorm_one_bdd_of_summable`,
and
`durrett2019_exercise_4_4_10_martingale_exists_ae_tendsto_of_summable`,
plus `durrett2019_exercise_4_4_11_stochasticTransform_increment_eq`,
`durrett2019_exercise_4_4_11_stochasticTransform_increment_sq_summable`,
`durrett2019_exercise_4_4_11_stochasticTransform_exists_toLp_tendsto_of_scaled_summable`,
and
`durrett2019_exercise_4_4_11_stochasticTransform_exists_ae_tendsto_of_scaled_summable`,
plus `durrett2019_exercise_4_4_11_kronecker_summation_by_parts`,
`durrett2019_exercise_4_4_11_kronecker_ratio_eq`, and
`durrett2019_exercise_4_4_11_kronecker_ratio_tendsto_zero_of_weighted_tendsto`,
plus `durrett2019_exercise_4_4_11_weight_increment_sum_eq`,
`durrett2019_exercise_4_4_11_constant_weighted_tendsto`,
`durrett2019_exercise_4_4_11_weighted_average_eq_constant_add_centered`,
`durrett2019_exercise_4_4_11_weighted_average_tendsto_of_centered_tendsto_zero`,
`durrett2019_exercise_4_4_11_centered_toeplitz_remainder_tendsto_zero`,
`durrett2019_exercise_4_4_11_weighted_average_tendsto_of_nonnegative_increments`,
`durrett2019_exercise_4_4_11_kronecker_ratio_tendsto_zero_of_nonnegative_increments`,
`durrett2019_exercise_4_4_11_normalized_increment_sum_tendsto_zero`,
`durrett2019_exercise_4_4_11_normalized_increment_sum_ae_tendsto_zero`,
`durrett2019_exercise_4_4_11_normalized_increment_sum_ae_tendsto_zero_of_scaled_summable`,
`durrett2019_exercise_4_4_11_normalized_process_tendsto_zero_of_initial_zero`,
`durrett2019_exercise_4_4_11_normalized_process_ae_tendsto_zero_of_initial_zero`,
`durrett2019_exercise_4_4_11_normalized_process_ae_tendsto_zero_of_shifted`,
`durrett2019_exercise_4_4_11_normalized_process_ae_tendsto_zero_of_scaled_summable`,
`durrett2019_exercise_4_4_11_scaled_summable_of_variance_bound`, and
`durrett2019_exercise_4_4_11_normalized_process_ae_tendsto_zero_of_bounded_variance`,
plus `durrett2019_exercise_4_4_11_reciprocalTransform_memLp_two_of_process_memLp`
and
`durrett2019_exercise_4_4_11_normalized_process_ae_tendsto_zero_of_reciprocal_bounded_variance`,
plus
`durrett2019_theorem_4_5_1_runningAbsMax_eLpNorm_two_le_of_integral_sq_le`.
Treat compiled Chapter 2, Chapter 3, Chapter 4.1
through Theorem 4.1.15, Chapter 4.2, Chapter 4.3, Theorem 4.4.2, Example 4.4.3,
Theorems 4.4.4, 4.4.6, 4.4.7, and 4.4.8, Theorem 4.4.1 optional-stopping
wrappers, Exercises 4.4.5-4.4.6 handoffs, and Example 4.4.9 as closed support.
The
regular-conditional distribution route for Theorem 4.1.16 is deferred unless a
future targeted kernel search finds a direct source-shaped API.
`StatInference/ProbabilityTheory/Martingale.lean` now contains Chapter 4.2
definition-level wrappers and Example 4.2.1 linear random-walk
martingale/supermartingale/submartingale wrappers over the natural filtration of
independent increments, including the centered display `S_n - n * μ`.
The Example 4.2.2 quadratic martingale source bridge and natural-random-walk
quadratic martingale instantiation now compile.  Example 4.2.3 now has the
mean-one product martingale wrapper plus the normalized exponential factor,
finite-product display, and martingale wrapper from a nonzero common
exponential moment.  Theorems 4.2.4 and 4.2.5 now have source-facing
all-times and strict-index conditional-expectation wrappers, and the generic
Theorem 4.2.6 convex-image submartingale wrapper now compiles from conditional
Jensen, and its `|X_n|^p` consequence now compiles for `p ≥ 1`.  The next
Theorem 4.2.7 increasing-convex transform, positive-part, and minimum
truncation wrappers now compile.  Theorem 4.2.8 predictable-transform wrappers
now compile for submartingales, supermartingales, predictable-process
entrypoints, and nonnegative martingale transforms.  Theorem 4.2.9
stopped-process wrappers now compile for submartingales,
supermartingales, and martingales.  Theorem 4.2.10 upcrossing inequality now
compiles in both mathlib positive-part form and Durrett's textbook
initial-positive-part subtraction display.  Theorem 4.2.11 now has direct
mathlib L1/eLpNorm-bounded convergence wrappers: almost-sure existence,
convergence to `ℱ.limitProcess`, L1 membership, integrability of the limit,
martingale specializations, and the exact positive-part-boundedness source
bridge from Durrett's `sup_n E X_n^+ < ∞` hypothesis to the mathlib eLpNorm
consumer.  Theorem 4.2.12 now compiles through nonnegative-supermartingale
convergence, integrable-limit, Fatou expectation bridge, and the final
existential wrapper with `E Z ≤ E X_0`.  The Chapter 4.3 path is closed
support: Theorem 4.3.1's stopped-shifted convergence bridge and survival-transfer wrapper
now compile, and the first-below stopping-time instantiation plus
bounded-increment lower bound `0 ≤ X_{n ∧ N} + K + M` now feed that bridge.
The bounded-below path-event bridge now compiles using countable natural
thresholds.  The symmetric bounded-above bridge via `-X` and the
one-sided-bounded union bridge now compile.  The range-form event-classification
layer already compiles, and the threshold-form oscillation wrapper now states
that the nonconvergent path visits below and above every real threshold.  The
exact extended-real liminf/limsup display now compiles as an `EReal` endpoint:
finite convergence or `liminf = ⊥` and `limsup = ⊤`.  Theorem 4.3.2 now
compiles through the Doob-decomposition existence/formula wrapper and both
canonical and source-facing uniqueness wrappers over mathlib
`martingalePart_add_ae_eq` and `predictablePart_add_ae_eq`.  Example 4.3.3 and
Theorem 4.3.4 now compile via mathlib `Probability.Martingale.BorelCantelli`:
the counting-process martingale part, martingale/predictable finite-sum
formulas, bounded one-step difference, and conditional Borel-Cantelli
limsup/divergent-conditional-sum equivalence are packaged.  The first Theorem
4.3.5 / Lemma 4.3.6 RN derivative packet now compiles: trimmed RN derivatives
have the source set-integral identity on `ℱ n`-events, equal restricted
set-integrals imply the martingale property, the likelihood-ratio process
`d μ_n / d ν_n` is a martingale, and nonnegative convergence follows from
Theorem 4.2.12.  The regular/singular decomposition layer of Theorem 4.3.5
also now compiles: the measure identity through `rnDeriv_add_singularPart`, the
real-integral identity through `Measure.setIntegral_toReal_rnDeriv_eq_withDensity`,
and the source-shaped endpoint from a supplied a.e. density identification plus
a supplied singular-part restriction.  The density-ratio/top-set assembly also
now compiles: dominating-measure and `mu + nu` RN ratio bridges, a
source-facing `Y/Z` bridge, singular-set and `{X = infinity}` endpoints, and
the final source assembly from `Y = dmu/drho`, `Z = dnu/drho`, `X = Y/Z`, and
top-set separation.  The integral-representation identification layer also now
compiles: set-integral representations against `rho` imply the RN derivative
identifications for `Y` and `Z`, transfer them to `nu`-a.e., and feed the
ratio/top-set assembly.  The generator-extension layer also now compiles:
generator pi-system plus `univ` set-integral identities extend to all
measurable sets and feed the RN/ratio/top-set source endpoint.  The
bounded-convergence generator-production layer also now compiles: eventual
restricted-density set-integral identities for uniformly bounded nonnegative
sequence densities feed the generator/univ identities and then the source
endpoint.  The trimmed-RN source sequence layer also now compiles: generator
events visible in some `ℱ m` get the eventual restricted-density identities
automatically, and the source endpoint is specialized to the actual trimmed RN
derivative sequences.  The natural `mu + nu` boundedness layer also now
compiles: both trimmed RN derivative sequences are bounded by `1`, and the
final source endpoint is specialized to this bound automatically.  The
real-convergence handoff layer also now compiles: one-bounded finite `ENNReal`
sequences with convergent `toReal` values converge in `ENNReal`, and the
`mu + nu` source endpoint now consumes real-valued convergence hypotheses for
both trimmed RN derivative sequences.  The bounded real-martingale layer also
now compiles: any real martingale a.e. norm-bounded by `1` has the L1/eLpNorm
bound consumed by Theorem 4.2.11, and both natural `mu + nu` trimmed RN
`toReal` sequences converge to their filtration limit processes.  The
canonical limit-density endpoint also now compiles: the real limit processes
are packaged as finite nonnegative `ENNReal` density candidates and fed to the
existing `mu + nu` endpoint.  The canonical-ratio endpoint also now compiles,
and the denominator and singular-support top-set layers now prove both
`nu {canonicalRatio = infinity} = 0` and
`mu.singularPart nu {canonicalRatio = infinity}^c = 0` automatically from the
generated common-density representations.  The full canonical-ratio real
identity for Theorem 4.3.5 now compiles.  The first Example 4.3.7
finite-partition packet also now compiles: the elementary partition likelihood
approximation is measurable, equals the cell ratio on disjoint cells, and
integrates over each cell to the numerator cell mass under the finite-cell
absolute-continuity condition; its finite-union and generator-facing endpoint
now also compile, yielding `mu = nu.withDensity finitePartitionLikelihood` for
pi-system generators made of finite unions of cells.  The first Theorem 4.3.8
Kakutani finite-product packet also now compiles: the finite-coordinate
likelihood is the product of one-coordinate densities, is measurable, has the
correct set integral on measurable rectangles under `Measure.pi`, and gives the
finite product-law `withDensity` identity.  The
infinite-product cylinder/restriction handoff also now compiles: the pulled-back finite product
likelihood is measurable, finite-coordinate restrictions of `Measure.infinitePi`
have the finite product likelihood as a `withDensity` ratio, and the
pulled-back likelihood integrates over measurable cylinders to the numerator
infinite-product measure.  The Hellinger factorization layer also now compiles:
the finite product likelihood's square-root power factors coordinatewise, the
finite-coordinate Hellinger integral factors under `Measure.pi`, and the same
identity pulls back to finite-coordinate cylinders under `Measure.infinitePi`.
The zero-product Fatou layer also now compiles: a.e. likelihood convergence
plus Hellinger integrals tending to zero forces the limiting likelihood to be
zero a.e., and the finite-cylinder source handoff consumes finite Hellinger
products directly.  The zero-product singularity bridge also now compiles:
source real-identities with `X = 0` denominator-a.e. give mutual singularity,
with top-set, Hellinger, and cylinder-product handoffs.  The positive-product
absolute-continuity bridge also now compiles: source real-identities with no
mass on infinite-density top sets give one-sided or two-sided absolute
continuity.  The first final branch assemblers also now compile: zero
Hellinger-products plus the top-set identity give mutual singularity, and
paired top-set identities with no top-set numerator mass give absolute
continuity in both directions.  The positive-branch eliminator also now
compiles: a source dichotomy plus a nonzero likelihood input, or a null
zero-set input, collapses to `mu << nu`.  Positive-product mass support also
now compiles: nonzero `lintegral` of the limiting likelihood, or
`lintegral X = 1`, feeds the same absolute-continuity conclusion.  The finite-
cylinder mass handoff also now compiles: finite cylinder likelihoods
integrate to one, and convergence of these integrals to the limiting
likelihood mass supplies the positive-branch mass-one input.  The
positive-product L1-to-integral handoff also now compiles: real-valued L1
convergence of finite cylinder likelihoods to the limiting likelihood supplies
the finite-cylinder integral-convergence input and hence the
absolute-continuity branch.  The pairwise-liminf Cauchy-to-L1 handoff,
Hellinger-tail-bound positive consumer, square-root/Cauchy-Schwarz Hellinger L1
bridge, and normalized positive-prefix product-tail convergence bridge also
now compile: pairwise L1 tail control plus pointwise convergence supplies the
L1 input, eventual Hellinger tail bounds tending to zero feed the
pairwise-liminf hypothesis, square-root square-integral estimates feed those
tail bounds, and positive finite prefix products give tails tending to one.
The concrete pointwise/cylinder square-root factorization and concrete
cylinder Cauchy handoff with the textbook factors also now compile.  The
`sqrt X_n + sqrt X_m` square-integral estimate also now compiles, and the
concrete Cauchy wrapper now only needs the remaining `sqrt X_n - sqrt X_m`
Hellinger-tail square estimate.  The scalar/cylinder Pythagorean overlap
inequality, overlap-to-tail algebra bridge, concrete cylinder overlap handoff,
lower-bound-only overlap Cauchy handoff, finite-coordinate product integral,
exact nested square-root overlap factorization, and finite Hellinger
tail-product overlap handoff also now compile.  The HasProd/Multipliable
prefix-tail bridge and standard `Finset.range n` HasProd-to-pairwise-liminf
handoff also now compile.  The finite tail-product lower bound from positive
prefix/tail monotonicity and the standard positive-product range consumer also
now compile.  The source-density one-coordinate Hellinger affinity bound
`≤ 1`, normalized positive-product tail `≤ 1` bridge, and standard
source-density positive-product range consumer also now compile.  The
standard `Finset.range n` source-density `HasProd` positive-product
absolute-continuity handoff now also compiles.  The a.e.-finite no-top source
bridge and the standard source-density `HasProd` absolute-continuity consumer
using it also now compile.  Kolmogorov tail-event zero-one support and the
zero-set-not-full positive-branch eliminator also now compile.  The
lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0` to
zero-set-null and the positive-branch conclusion also now compiles.  The
every-tail-block measurability bridge into the `limsup` tail sigma-field also
now compiles, including zero-set-null and absolute-continuity consumers from
every-tail-block measurability plus `∫⁻ X ≠ 0`.  The tail-coordinate
sigma-field and finite tail cylinder likelihood measurability layer also now
compiles, including finite tail cylinder zero-set measurability and the
zero-set-equality handoff to every-tail-coordinate measurability.  The
finite-prefix zero-set algebra and prefix-cylinder zero-set handoff also now
compile.  The prefix/tail finite-block and tail-block-limit handoff layer also
now compiles, including finite tail-block measurability, pointwise
tail-block-limit measurability, limiting prefix/tail factorization, and the
zero-set handoff from tail-block limits.  The pointwise finite/nonzero
coordinate side-condition bridge also now compiles.  The range-limit tail
handoff also now compiles: full-prefix likelihood convergence supplies the
canonical tail-block limit `X / prefix_n` and tail-coordinate zero-set handoff
under pointwise finite and nonzero coordinate densities.  The range-limit
positive-branch consumers also now compile: coordinate sigma-fields are
independent under the denominator infinite product law, ENNReal full-prefix
convergence supplies the `toReal` convergence input for the L1/Cauchy branch,
pointwise finite coordinate densities supply the pairwise no-top side
condition, and pointwise full-prefix convergence plus finite/nonzero coordinate
densities and `∫⁻ X ≠ 0` feed the tail-zero-set positive-branch eliminator.
The canonical-ratio handoff into these range-limit consumers also now compiles,
so the canonical `mu + nu` ratio supplies `toReal = dmu/dnu` and
`nu {canonicalRatio = infinity} = 0` automatically.  Canonical-ratio real
integrability and the real-valued full-prefix convergence consumer also now
compile.  The quotient-limit bridge also now compiles: a.e. identification of
finite prefix likelihoods with quotients of two real-convergent trimmed density
sequences plus denominator-limit nonzeroness gives convergence to
`(canonicalRatio).toReal`.  The canonical prefix-filtration support now also
compiles: the filtration generated by coordinates `0, ..., n - 1`, coordinate
visibility, finite prefix cylinder-likelihood measurability, and
coordinate-sigma-field inclusion.  The trimmed-prefix RN-ratio identity now
also compiles: every finite prefix likelihood is identified with the quotient
of the numerator and denominator prefix-trimmed RN derivatives over the common
trimmed dominating measure.  The denominator-limit nonzero bridge, canonical
prefix convergence from the trimmed-prefix ratio, and positive Hellinger-product
wrapper with that convergence supplied now also compile.  The positive-product
finite-limit side condition is also discharged from the source Hellinger
affinity bounds, so the canonical positive-product wrapper no longer needs an
external `P ≠ ∞` input.  The canonical product-tail and `tprod` wrappers now
also compile: the positive branch no longer needs an auxiliary `tail` parameter
or explicit quotient equality, and the source handoff can be phrased with
`Multipliable` plus the actual infinite Hellinger product, including
strict-positive product variants.  The first canonical zero/positive product
criterion wrapper also now compiles: `HasProd h 0` feeds the singular branch,
while strict product positivity feeds the positive branch.  Canonical `mu + nu`
limit-density and likelihood-ratio measurability are now compiled support.  The
ENNReal full-prefix convergence input is also compiled support:
real-valued canonical trimmed-prefix convergence upgrades to ENNReal convergence,
and the closed zero/positive branch wrapper no longer asks for either canonical
measurability or full-prefix convergence.  The textbook `tprod` zero/positive
branch wrapper now also compiles, using `Multipliable` and the actual infinite
Hellinger product.  Coordinate finiteness is now discharged from the
finite-prefix likelihood integral-one identities, and the no-top `tprod` branch
wrapper no longer asks for pointwise coordinate finiteness.  The direct
source-identity likelihood-mass bridge now removes the ambient Kakutani
dichotomy input from that no-top `tprod` wrapper as well.  The next target is
to move forward from Theorem 4.3.8.  Lemma 4.3.9's normalized-process
conditional-expectation core now compiles; next try only the actual
Galton-Watson conditional-mean instantiation if it stays source-shaped,
otherwise use mathlib's Doob maximal inequality support for Section 4.4.
Theorem 4.4.2 now has compiled nonnegative-submartingale and positive-part
Doob maximal inequality wrappers, plus the total positive-part endpoint
`durrett2019_theorem_4_4_2_doob_maximal_inequality_positivePart_total`.  The
Example 4.4.3 squared-threshold Kolmogorov maximal wrapper
`durrett2019_example_4_4_3_kolmogorov_maximal_inequality_square` now also
compiles, together with
`durrett2019_example_4_4_3_kolmogorov_maximal_inequality_square_div` and
`durrett2019_example_4_4_3_kolmogorov_maximal_inequality_abs_varianceBound`.
Theorem 4.4.4 now has the martingale absolute-maximum consequence bridge
`durrett2019_theorem_4_4_4_martingale_absMax_eLpNorm_of_positivePart_bound`.
Its p-th-power source layer now also compiles through
`durrett2019_theorem_4_4_4_eLpNorm_le_of_lintegral_rpow_enorm_le`,
`durrett2019_theorem_4_4_4_positivePart_eLpNorm_bound_of_lintegral_rpow_enorm_le`,
and
`durrett2019_theorem_4_4_4_martingale_absMax_eLpNorm_of_positivePart_lintegral_bound`.
The layer-cake/Hölder proof body now also has compiled support:
`durrett2019_theorem_4_4_4_positivePart_layercake_lintegral_rpow_enorm`,
`durrett2019_theorem_4_4_4_positivePart_doob_layercake_integrand_bound`, and
`durrett2019_theorem_4_4_4_positivePart_holder_integral_bound`.
The set-integral to restricted-`lintegral` bridge and integrated Doob
layer-cake bound now also compile:
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
Coefficient extraction, the assembled Doob/Fubini/Hölder endpoint, and the
finite scalar-cancellation layer now also compile:
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
The supplied-domination `L^p` convergence endpoint now also compiles:
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
Example 4.4.9 now also has conditional and integrated second-moment recurrence
wrappers:
`durrett2019_example_4_4_9_conditional_second_moment_from_variance`,
`durrett2019_example_4_4_9_branchingProcess_conditional_second_moment`, and
`durrett2019_example_4_4_9_branchingProcess_second_moment_integral_recurrence`.
Its finite-sum display wrappers also now compile:
`durrett2019_example_4_4_9_second_moment_finite_sum_of_recurrence` and
`durrett2019_example_4_4_9_branchingProcess_second_moment_integral_finite_sum`.
The shifted geometric-sum and uniform second-moment bound wrappers now compile:
`durrett2019_example_4_4_9_shifted_geometric_sum_le` and
`durrett2019_example_4_4_9_branchingProcess_second_moment_integral_uniform_bound`.
The `eLpNorm 2` handoff and `L^2` convergence endpoint now compile:
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
wrapper plus exact-denominator wrapper now also compile.  The current target
has moved to Exercise 4.4.11's martingale-transform bounded-variance corollary.
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
quadratic martingale source and natural-random-walk wrappers, the Example
4.2.3 product and normalized exponential martingale wrappers, Theorems
4.2.4/4.2.5 all-times and strict-index wrappers, the generic Theorem 4.2.6
convex-image and `|X_n|^p` wrappers, Theorem 4.2.7 increasing-convex and
truncation wrappers, Theorem 4.2.8 predictable-transform wrappers, Theorem
4.2.9 stopped-process wrappers, Theorem 4.2.10 upcrossing wrappers, and the
direct L1/eLpNorm-bounded plus positive-part source Theorem 4.2.11 convergence
wrappers, Theorem 4.2.12 nonnegative-supermartingale convergence,
integrable-limit, Fatou expectation bridge, and final expectation-bounded
limit wrapper, plus Theorem 4.3.1 stopped-shifted convergence,
survival-transfer, first-below stopping-time, bounded-increment lower-bound,
first-below survival convergence, and bounded-below path-event convergence
wrappers, plus symmetric bounded-above and one-sided-bounded union convergence
wrappers, plus the range-form convergence-or-unbounded dichotomy, threshold
oscillation, exact `EReal` liminf/limsup wrappers, Theorem 4.3.2
Doob-decomposition existence/formula and uniqueness wrappers, Example 4.3.3
plus Theorem 4.3.4 conditional Borel-Cantelli wrappers, and the first Theorem
4.3.5 / Lemma 4.3.6 RN-derivative likelihood-ratio martingale and convergence
wrappers.
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
- `durrett2019_theorem_3_4_1_centralLimitTheorem_varianceGaussian`;
- `durrett2019_theorem_3_4_1_centralLimitTheorem_standardNormal`;
- `durrett2019_theorem_3_4_1_centralLimitTheorem_sigmaSqrt`;
- `durrett2019_theorem_3_4_1_centralLimitTheorem_muSigmaSqrt`;
- `durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`;
- `durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`.

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
28. Durrett Theorem 3.4.10 now has positive-variance source endpoints
    `durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`
    and
    `durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`,
    including the literal textbook display `S_n => sigma * chi` for a standard
    normal `chi`.
29. Durrett Theorem 3.10.6 now has the finite-coordinate law-level Cramér-Wold
    wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto` in
    `StatInference/ProbabilityTheory/Multivariate.lean`, reusing the local
    Vaart finite-coordinate Cramér-Wold theorem, plus the random-vector
    convergence-in-distribution wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution`,
    the random-vector projected characteristic-function wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution_of_projected_charFun`,
    the projected characteristic-function law wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto_of_projected_charFun`,
    the law-level textbook theta-projection wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto`,
    the textbook theta-projection characteristic-function wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto_of_charFun`,
    the random-vector textbook theta-projection wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution`,
    the random-vector textbook theta-projection characteristic-function wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_of_charFun`,
    and the fixed-source probability-space theta wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure`,
    plus its fixed-source characteristic-function wrapper
    `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure_of_charFun`.
29. Durrett Theorem 3.10.7 now has the finite covariance-table homogeneity
    wrappers
    `durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul` and
    `durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul_complex`, the
    textbook `t^2` centered Gaussian projected characteristic-function display
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
    and the corresponding projected-characteristic CLT consumer
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance_tsq`.
    The same `t^2` endpoint is also available from centered product identities
    for the Gaussian limit:
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_centeredProduct`
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct_tsq`.
    Projected scalar CLTs now discharge the characteristic-function hypothesis
    through
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT`,
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredProduct`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct_tsq`.
    Projected summand CLTs now feed the same textbook `t^2` route through
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredProduct`
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct_tsq`.
    Vector Gaussian source assumptions now feed this route through
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct`
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct_tsq`.
    Common-vector-law source assumptions now feed it through
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct`
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct_tsq`.
    Canonical product-sample source assumptions now feed it through
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredProduct`
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct_tsq`.
    Canonical coordinate-covariance and centered-product source assumptions now
    feed the projected characteristic-function endpoint through
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`
    and
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct`.
    The literal centered normalized-sum characteristic-function display now
    compiles as
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_sum`.
    The literal nonzero-mean normalized-sum characteristic-function displays now
    compile as
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`
    and
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`.
    The nonzero-mean Gaussian projected scalar ordinary characteristic-function
    displays now compile as
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_coordinateCovariance`,
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
    and
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_centeredProductSubMean`.
    The covariance-table and arbitrary-frequency centered-product variants now
    compile as
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
    and
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_centeredProductSubMean`.
    The centered Gaussian covariance-table and arbitrary-frequency
    centered-product ordinary characteristic-function variants now compile as
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
    and
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_centeredProduct`.
    The covariance-bilinear table and centered-product projected-characteristic
    CLT consumers now compile as
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable_tsq`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct`.
    The projected-scalar-CLT source bridges into those routes now compile as
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredProduct`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct`.
    It also has the arbitrary-frequency centered Gaussian
    projected characteristic-function display
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_coordinateCovariance`,
    a projected-characteristic CLT consumer from the centered Gaussian
    quadratic exponential
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance`,
    plus a compiled projected
    characteristic-function CLT consumer, plus projected scalar and projected
    summand CLT wrappers:
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT` and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT`.
30. Durrett Theorem 3.10.7 now has compiled covariance/Gaussian source wrappers:
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource` and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource`.
31. Durrett Theorem 3.10.7 now has the compiled theta-projection Gaussian
    characteristic-function display and covariance-table variance expansion,
    including scalar coordinate covariance and centered-product source
    displays:
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_covarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_coordinateCovariance`,
    and
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_centeredProduct`,
    plus nonzero-mean source displays
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_covarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_coordinateCovariance`,
    and
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_centeredProductSubMean`,
    plus literal expectation-form displays
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
    and
    `durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_centeredProductSubMean`,
    plus centered literal expectation-form displays
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
    and
    `durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_centeredProduct`,
    plus the literal centered normalized-sum canonical product endpoint
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_sum`.
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
    `durrett2019_theorem_3_10_7_coordinateCovariance_eq_of_centeredProductSubMean`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCoordinateMeanCoordinateCovariance`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCoordinateMeanCoordinateCovariance`.
35. Durrett Theorem 3.10.7 now has canonical i.i.d. product-sample endpoints
    from scalar coordinate covariance and from centered coordinate product
    identities:
    `durrett2019_theorem_3_10_7_canonicalSampleCoordinateCovariance_eq_vectorLaw`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean`,
    `durrett2019_theorem_3_10_7_canonicalProduct_explicitMean_normalization_eq_sum`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
    and
    `durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct`.
36. Durrett Section 3.10 now has Gaussian-coordinate independence wrappers:
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_coordinateCovariance_zero`,
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_coordinateCovariance_zero`,
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_covarianceBilinDualTable`,
    and
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_covarianceBilinDualTable`,
    plus the source-facing scalar covariance-table and centered-product-table
    wrappers
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_coordinateCovarianceTable`,
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_coordinateCovarianceTable`,
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_centeredProductSubMean`,
    and
    `durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_centeredProductSubMean`.
37. Durrett Exercise 3.10.8 now has finite linear-combination Gaussian
    characterization wrappers:
    `durrett2019_exercise_3_10_8_linearCombination_hasGaussianLaw_of_multivariateGaussian`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_of_linearCombination_hasGaussianLaw`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_hasGaussianLaw`,
    `durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_multivariateGaussian`,
    `durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
    `durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_of_linearCombination_law_eq_gaussianReal`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
    and
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`,
    plus the standalone centered reverse direction
    `durrett2019_exercise_3_10_8_multivariateGaussian_of_centeredLinearCombination_law_eq_gaussianReal`,
    plus centered covariance-table source-law wrappers
    `durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`
    and
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`,
    plus centered scalar covariance and centered-product source-law wrappers
    `durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
    `durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`,
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
    and
    `durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`.
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
| Chapter 2.1 independence/product laws | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/ProductMeasure.lean`; mathlib independence APIs | Generated pi-system independence, generated-rectangle and real lower-halfline distribution-function criteria, grouped sigma-field independence, finite disjoint-block functions, product-coordinate independence, pair and finite product-law, iid same-law finite product law, iid product-law criterion, canonical finite and infinite iid product-coordinate support, product/Fubini integral, and expectation-factorization wrappers now compile. Remaining work is optional exact polish only when a later theorem route demands it. |
| Chapter 2.3 Borel-Cantelli | source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/BorelCantelli.lean` | Durrett wrappers for Theorems 2.3.1 and 2.3.7 compile over existing local Borel-Cantelli wrappers. |
| Chapter 2.4 SLLN and empirical CDF | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Durrett Theorem 2.4.1 source wrappers compile over the local strong-law wrappers. Conditional Theorem 2.4.9 handoffs compile from supplied endpoint grids, supplied middle CDF partitions, supplied cutpoint chains, or supplied center-range monotone subdivisions. The one-cell, two-cell, right-append, finite cutpoint-chain, cutpoint-chain append, endpoint-grid-to-chain, closed-cover, punctured-cover, punctured-cover inserted-subcell CDF increment, punctured-cover cell splitting, open-cover/center-avoidance, endpoint-center, strict-subdivision-prefix, extracted-subdivision-adjacency, monotone-duplicate-skip, monotone endpoint-center, monotone center-range, arbitrary-law punctured local/finite compact-cover, arbitrary-law punctured monotone-subdivision, arbitrary-law punctured monotone-subdivision cutpoint-chain, arbitrary-law cutpoint-chain, arbitrary-law half-line GC, source-facing empirical-CDF predicate, EDF theorem wrapper, canonical iid product-space EDF wrappers, non-atomic local small-neighborhood, non-atomic finite compact-cover, non-atomic monotone-subdivision, non-atomic cutpoint-chain, cutpoint-chain-to-GC, center-range subdivision-to-GC, and non-atomic GC packages compile. Treat this lane as reusable support unless a later theorem reopens an exact source-shape gap. |
| Chapter 3 weak convergence, CLT, and characteristic functions | source-wrapper/closed-support | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityTheory/Multivariate.lean`; `StatInference/ProbabilityMeasure/WeakConvergence.lean`; `StatInference/EmpiricalProcess/WeakConvergence.lean`; `StatInference/AsymptoticStatistics/MomentEstimators.lean`; mathlib `ConvergenceInDistribution`, characteristic-function, Levy, Taylor, and CLT APIs | Section 3.2 weak convergence now has compiled wrappers for Theorem 3.2.9 bounded-continuous tests, Theorem 3.2.10 continuous mapping continuous case, and Theorem 3.2.11 Portmanteau. Section 3.3 now has compiled Theorem 3.3.1 basic characteristic-function wrappers, Theorem 3.3.2 independent-sum product law, Theorem 3.3.17 continuity theorem wrappers, Theorem 3.3.19 scalar Taylor remainder estimate, and Theorem 3.3.20 centered Taylor support. Section 3.4 now has Theorem 3.4.1 i.i.d. CLT wrappers plus Theorem 3.4.10 triangular-array characteristic-function product, explicit Gaussian display, row Gaussian target, quadratic variance product, Exercise 3.1.1 row-sum/max/absolute-bound/product interfaces, the proved Exercise 3.1.1 real triangular-array product theorem, variance-tail-to-max-smallness bridges, the variance-tail split proved from square-integrable rows, max-row-variance-to-factor-norm bridges, Lemma 3.4.3 product-difference control, analytic-certificate bridges from supplied split product approximations, a named characteristic/quadratic error row sum, compiled finite-row/one-factor/scalar-Taylor/expansion/remainder bridges, and a final square-integrable Lindeberg-Feller source wrapper. Section 3.10 has a finite-coordinate law-level Cramer-Wold wrapper, Theorem 3.10.7 projected scalar/summand and covariance/Gaussian source wrappers, theta-projection Gaussian characteristic-function covariance-table display, all-dual source handoffs, coordinate-mean handoff, scalar coordinate covariance and centered-product source endpoints, vector Gaussian coordinate-covariance CLT wrappers, common-vector-law coordinate-covariance wrapper, canonical i.i.d. product-sample endpoints, Gaussian-coordinate independence criterion wrappers, and Exercise 3.10.8 linear-combination characterization wrappers. |
| Chapter 4 martingales | active/source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityTheory/ConditionalExpectation.lean`; `StatInference/ProbabilityTheory/Martingale.lean`; mathlib `Probability/ConditionalExpectation.lean` and `Probability/Martingale/*` | Chapter 4.1 conditional expectation is compiled through Theorem 4.1.15. Chapter 4.2 and Chapter 4.3 are reusable support. Chapter 4.4 now includes the maximal-inequality route through Theorem 4.4.6, Theorem 4.4.7 orthogonality, Theorem 4.4.8 conditional variance, Example 4.4.9 nonzero-limit support, Exercise 4.4.10 `L^2` and almost-sure convergence from square-summable increments, and Exercise 4.4.11 predictable-transform and Kronecker wrappers. Section 4.5.1 has the finite Doob `L^2` route and source bridge. V201-V204 compile Theorem 4.5.2 source/event-local convergence infrastructure. V205-V223 compile the Theorem 4.5.3 random-normalizer/variance-ratio/tail-integral route. V224-V235 compile the final Theorem 4.5.5 conditional Borel-Cantelli ratio package. V236-V250 now compile the Theorem 4.5.7 finite maximal-probability layer through the finite-horizon `3 * E sqrt(A_infty)` endpoint. Next target: pass from finite horizons to `sup_n`. |
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
whenever the app-level wording lags.  Active frontier: Chapter 3 weak
convergence, characteristic functions, CLT, and Lindeberg-Feller support in
`StatInference/ProbabilityTheory/Basic.lean`.

Next proof packet: close a concrete Chapter 3 source-facing gap around
Lindeberg-Feller, scalar CLT normalization, characteristic-function estimates,
or Section 3.10 multivariate CLT wrappers.  Do not route back to the compiled
Chapter 2 product/iid or empirical-CDF wrappers unless a Chapter 3 theorem
requires a missing source primitive.

Cycle rule: sync GitHub, inspect only anchors needed for that theorem, implement
one compiled Lean packet, verify focused Lean plus targeted build/scans and root
build when imports changed, update route docs only if the frontier changes,
commit, and push.  Closed support is not live prompt content unless the active
source-shape gap requires it.
