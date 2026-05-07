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
- `durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi`;
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
- `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`;
- `durrett2019_theorem_2_4_9_punctured_small_open_interval`;
- `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`;
- `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`;
- `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`;
- `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`;
- `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`;
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`.
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`.
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`.
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`.

The first aggressive full-theorem target is now Durrett Theorem 2.4.9,
Glivenko-Cantelli for empirical CDFs, cross-listed with the later empirical
distribution-function spine.  The source scout identified this as the best
large target because the repo already has fixed-endpoint empirical-CDF and
half-line GC support in `StatInference/EmpiricalProcess/RealHalfLineGC.lean`.

Immediate proof route:

1. inspect and reuse `realHalfLineIndicator_integral_eq_cdf`,
   `realHalfLine_empiricalAverage_sub_cdf_tendsto_zero_ae_of_iid`, and nearby
   grid/squeezing handoffs;
2. construct a strict finite endpoint grid with small adjacent CDF left-limit
   increments for every bounded interval and positive radius: the non-atomic
   route now skips repeated monotone-subdivision values and feeds the
   cutpoint-chain-to-GC handoff; the arbitrary-law route now has finite
   punctured compact covers, automatic center avoidance when selected centers
   are grid endpoints or monotone subdivision values, and needs the finite
   ordering/splitting theorem that proves all selected centers occur in the
   subdivision range while making adjacent cells refine finite cover intervals;
   the resulting subdivision feeds the GC handoff directly through
   `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`;
3. package the empirical CDF statement once the uniform squeezing proof closes;
4. keep Chapter 2.1 as optional iid/product notation polish while the main
   proof effort returns to the GC grid constructor;
5. promote exact source statements once the wrapper statements line up with the
   PDF/Markdown.

The route should not duplicate raw measure theory from Chapter 1 unless an
exact source theorem needs a missing local theorem.  Chapter 1 is currently
mostly mathlib-foundation plus Billingsley reusable support.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 measure/probability foundations | source-wrapper/reused-local | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/GeneratedSigma.lean`; `Tail.lean`; `ProductMeasure.lean` | Durrett wrappers for Theorem 1.1.1 measure properties and Theorems 1.3.1/1.3.4 measurability facts now compile over mathlib/local generator APIs. |
| Chapter 2.1 independence/product laws | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/ProductMeasure.lean`; mathlib independence APIs | Generated pi-system independence, generated-rectangle and real lower-halfline distribution-function criteria, grouped sigma-field independence, finite disjoint-block functions, product-coordinate independence, pair and finite product-law, product/Fubini integral, and expectation-factorization wrappers now compile. Remaining work is optional exact iid/product notation polish. |
| Chapter 2.3 Borel-Cantelli | source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/BorelCantelli.lean` | Durrett wrappers for Theorems 2.3.1 and 2.3.7 compile over existing local Borel-Cantelli wrappers. |
| Chapter 2.4 SLLN and empirical CDF | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Durrett Theorem 2.4.1 source wrappers compile over the local strong-law wrappers. Conditional Theorem 2.4.9 handoffs compile from supplied endpoint grids, supplied middle CDF partitions, supplied cutpoint chains, or supplied center-range monotone subdivisions. The one-cell, two-cell, right-append, finite cutpoint-chain, cutpoint-chain append, endpoint-grid-to-chain, closed-cover, punctured-cover, open-cover/center-avoidance, endpoint-center, strict-subdivision-prefix, extracted-subdivision-adjacency, monotone-duplicate-skip, monotone endpoint-center, monotone center-range, arbitrary-law punctured local/finite compact-cover, non-atomic local small-neighborhood, non-atomic finite compact-cover, non-atomic monotone-subdivision, non-atomic cutpoint-chain, cutpoint-chain-to-GC, center-range subdivision-to-GC, and non-atomic GC packages compile; remaining blocker: construct monotone subdivisions for arbitrary distributions by ordering/splitting the finite punctured cover and proving all selected centers are subdivision values. |
| Chapter 3 CLT/characteristic functions | pending-local | none | Needs mathlib API search for characteristic functions, normal laws, weak convergence, and scalar asymptotics. |
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
either:

- advance Durrett Theorem 2.4.9 by constructing
  strict finite endpoint grids with small adjacent CDF left-limit increments
  for arbitrary bounded intervals and positive radii by turning the finite
  punctured compact cover into an ordered strict grid whose open cells avoid
  their selected atom centers; or
- if that blocks, do only optional Chapter 2.1 iid/product notation polish and
  record the exact GC partition blocker.
