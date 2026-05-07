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
- Throughput policy: default to single-thread theorem-sized proof packets with
  search-first reuse, start/final GitHub sync checks, and isolated worktrees for
  long Durrett builds or disjoint local lanes.  Use subagents only after
  explicit user authorization.
- Communication policy: chat updates may be bilingual, but all code, theorem
  comments, docs, and commit messages in this lane stay in English.

## Current Active Target

Current verified Durrett Lean frontier: `StatInference/ProbabilityTheory/Basic.lean`
compiles and root-imports the new namespace.  Compiled declarations:

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
- `durrett2019_theorem_3_4_1_centralLimitTheorem_varianceGaussian`.

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
19. next prove the Taylor/Lindeberg one-factor row-sum obligation
    `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero`
    plus the real Exercise 3.1.1 triangular-array product theorem; after that,
    prove the lower-level integral/truncation primitive behind the supplied
    variance-tail split or search Section 3.10 Cramer-Wold/multivariate CLT
    anchors.

The route should not duplicate raw measure theory from Chapter 1 unless an
exact source theorem needs a missing local theorem.  Chapter 1 is currently
mostly mathlib-foundation plus Billingsley reusable support.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 measure/probability foundations | source-wrapper/reused-local | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/GeneratedSigma.lean`; `Tail.lean`; `ProductMeasure.lean` | Durrett wrappers for Theorem 1.1.1 measure properties and Theorems 1.3.1/1.3.4 measurability facts now compile over mathlib/local generator APIs. |
| Chapter 2.1 independence/product laws | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/ProductMeasure.lean`; mathlib independence APIs | Generated pi-system independence, generated-rectangle and real lower-halfline distribution-function criteria, grouped sigma-field independence, finite disjoint-block functions, product-coordinate independence, pair and finite product-law, iid same-law finite product law, iid product-law criterion, canonical iid product-coordinate support, product/Fubini integral, and expectation-factorization wrappers now compile. Remaining work is optional exact polish only when a later theorem route demands it. |
| Chapter 2.3 Borel-Cantelli | source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/BorelCantelli.lean` | Durrett wrappers for Theorems 2.3.1 and 2.3.7 compile over existing local Borel-Cantelli wrappers. |
| Chapter 2.4 SLLN and empirical CDF | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Durrett Theorem 2.4.1 source wrappers compile over the local strong-law wrappers. Conditional Theorem 2.4.9 handoffs compile from supplied endpoint grids, supplied middle CDF partitions, supplied cutpoint chains, or supplied center-range monotone subdivisions. The one-cell, two-cell, right-append, finite cutpoint-chain, cutpoint-chain append, endpoint-grid-to-chain, closed-cover, punctured-cover, punctured-cover inserted-subcell CDF increment, punctured-cover cell splitting, open-cover/center-avoidance, endpoint-center, strict-subdivision-prefix, extracted-subdivision-adjacency, monotone-duplicate-skip, monotone endpoint-center, monotone center-range, arbitrary-law punctured local/finite compact-cover, arbitrary-law punctured monotone-subdivision, arbitrary-law punctured monotone-subdivision cutpoint-chain, arbitrary-law cutpoint-chain, arbitrary-law half-line GC, source-facing empirical-CDF predicate, EDF theorem wrapper, non-atomic local small-neighborhood, non-atomic finite compact-cover, non-atomic monotone-subdivision, non-atomic cutpoint-chain, cutpoint-chain-to-GC, center-range subdivision-to-GC, and non-atomic GC packages compile. Treat this lane as reusable support unless a later theorem reopens an exact source-shape gap. |
| Chapter 3 weak convergence, CLT, and characteristic functions | next-active/source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/WeakConvergence.lean`; `StatInference/EmpiricalProcess/WeakConvergence.lean`; `StatInference/AsymptoticStatistics/MomentEstimators.lean`; mathlib `ConvergenceInDistribution`, characteristic-function, Levy, Taylor, and CLT APIs | Section 3.2 weak convergence now has compiled wrappers for Theorem 3.2.9 bounded-continuous tests, Theorem 3.2.10 continuous mapping continuous case, and Theorem 3.2.11 Portmanteau. Section 3.3 now has compiled Theorem 3.3.1 basic characteristic-function wrappers, Theorem 3.3.2 independent-sum product law, Theorem 3.3.17 continuity theorem wrappers, and Theorem 3.3.20 centered Taylor support. Section 3.4 now has Theorem 3.4.1 i.i.d. CLT wrappers plus Theorem 3.4.10 triangular-array characteristic-function product, explicit Gaussian display, row Gaussian target, quadratic variance product, Exercise 3.1.1 row-sum/max/absolute-bound/product interfaces, variance-tail-to-max-smallness bridges, max-row-variance-to-factor-norm bridges, Lemma 3.4.3 product-difference control, and analytic-certificate bridges from supplied split product approximations. Next targets: prove the one-factor Taylor/Lindeberg row-sum estimate, the real Exercise 3.1.1 product theorem, and the lower-level variance-tail split primitive, then move to Section 3.10 Cramer-Wold/multivariate CLT. |
| Chapter 4 martingales | pending-local | none | Search mathlib martingale/conditional expectation APIs first. |
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

The next in-thread goal cycle should not just reread the source.  It should
continue from the compiled Chapter 3 theorem spine: Durrett Theorems 3.2.9,
3.2.10 continuous case, 3.2.11, 3.3.1, 3.3.2, 3.3.17, 3.3.20, 3.4.1, and the
3.4.10 triangular-array characteristic-function and analytic-certificate
bridges now compile as wrappers.
The previous EDF target is closed by
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`, and
the Chapter 2.1 iid/product notation target is closed by the common-law finite
product and canonical iid product-coordinate wrappers.

The highest-value next proof targets are the remaining Lindeberg-Feller
analytic estimates:
`durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero`
from Taylor expansion plus the Lindeberg-tail field,
the real Exercise 3.1.1 triangular-array product theorem that supplies
`durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp`, and the
lower-level integral/truncation proof of the supplied variance-tail split.  Search
mathlib/local APIs for truncated second moments, characteristic-function Taylor
bounds, finite-row products, max-smallness of row variances, and `Tendsto`
product/exponential estimates before adding new primitives.

Before choosing, apply the high-accuracy protocol from the current blocker
plan: sync remote once, check whether other-agent work changed the route,
reuse cached source/API anchors, and pick one theorem-sized packet rather than
a search-only cycle.

Process correction for the next cycle: treat the route docs and latest pushed
commit as the live target when the app-level `/goal` wording lags.  Do not
create an automation or spawn subagents unless the user explicitly asks for
parallel agent work.  The source-shaped variance-tail split bridge now proves
`durrett2019_lindebergFellerVarianceRowsEventuallySmall` from the Lindeberg
condition plus a supplied Durrett inequality
`variance <= cutoff ^ 2 + tail row sum`; the Exercise 3.1.1 source theorem now
feeds the quadratic-product convergence bridge.  Next return to the one-factor
Taylor/Lindeberg row-sum estimate, the real Exercise 3.1.1 product theorem, or
the lower-level proof of that supplied split.
