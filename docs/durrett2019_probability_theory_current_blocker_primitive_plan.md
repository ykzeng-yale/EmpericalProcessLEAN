# Durrett 2019 Current Blocker And Primitive Plan

This file is the active blocker register for the Durrett probability-theory
lane.  It should be checked at the start of each in-thread goal cycle before
choosing a proof target.

## Live In-Thread Goal Prompt V212

Use this prompt as the live Durrett `/goal` whenever the app-level goal text is
older than the verified route docs:

Continue Durrett 2019 Probability Theory formalization in Lean from latest
synced `main`.  Active lane: Durrett Chapter 4 martingales in
`StatInference/ProbabilityTheory/Martingale.lean`, specifically Section 4.5.3.
Chapter 2.1 independence/product/convolution support, Theorem 2.4.9
Glivenko-Cantelli, Theorem 2.2.12 layer-cake/source endpoint, Chapter 3 weak
convergence/characteristic-function/CLT wrappers, and Section 4.5.1 maximal
support are closed reusable support unless a later theorem exposes a precise
missing primitive.

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

Next aggressive step: lift V212 from deterministic paths to the random and
integrated variance-ratio summability required by V209, using finite sums of
integrals, Fubini/finite-sum integral exchange, and a uniform clock-integral
bound derived from the source hypothesis `∫_0^∞ f(t)^{-2} dt < ∞`.  Then
connect that summability package to the V209 normalized-process endpoint.
Keep the remaining reciprocal-transform `MemLp` and integrability side
conditions explicit until they can be discharged from source hypotheses.  Do
not route back to stopped running-maximum boundedness, stopped predictability,
exact Theorem 4.5.2 source packaging, deterministic Exercise 4.4.11
normalizers, reciprocal predictability/bounds, scaled-summability-to-transform
plumbing, conditional variance pull-out, scalar interval comparison, finite
clock comparison, deterministic summability packaging, Chapter 2.1, or Theorem
2.4.9 unless Theorem 4.5.3 exposes a strictly stronger missing primitive.

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
- `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource`
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

Use `Live In-Thread Goal Prompt V142` at the top of this file.  Historical route
notes below this point are inventory, not instructions for the next proof
packet.
