# Durrett 2019 Current Blocker And Primitive Plan

This file is the active blocker register for the Durrett probability-theory
lane.  It should be checked at the start of each in-thread goal cycle before
choosing a proof target.

## Adaptive In-Thread Goal Rule

The Durrett work is an active `/goal` in this chat, not a recurring
automation.  Every substantial cycle should finish by checking whether the
live in-thread goal prompt is stale relative to this file, the dashboard, the
blueprint, and the latest verified commit.

Refresh the route docs and in-thread target whenever a cycle:

- proves a Lean declaration;
- narrows or discovers a blocker;
- merges other-agent work;
- changes the next atomic target;
- records a material mathlib/local-code search result.

The refreshed in-thread target should name:

- the latest pushed commit and new declarations or blocker refinement;
- one primary theorem/proof target plus independent support targets;
- the search-first scope: pinned mathlib, local `StatInference`, existing
  `ProbabilityMeasure`, and remote contributions;
- the verification gate: focused `lake env lean`, targeted `lake build`, root
  build if imports changed, proof-hole scan, secret scan, and `git diff --check`;
- the report gate: no Durrett report until an exact source theorem compiles and
  source evidence is captured.

## Throughput Policy

Each cycle should make concrete verified Lean progress or document a precise
blocker with attempted APIs.  Prefer theorem-sized source wrappers and
certificate bridges that unlock multiple later chapters.  A tiny primitive is
acceptable only when it is the fastest verified dependency for the current
theorem route.

Spawn a useful independent agent team when slots permit:

- source scout for Durrett anchors and theorem ordering;
- Lean reuse scout for mathlib/local APIs;
- bounded worker for a disjoint Lean or docs write scope;
- verifier/reviewer when a packet is ready.

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
- `durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi`
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
- `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`
- `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`
- `durrett2019_theorem_2_4_9_punctured_small_open_interval`
- `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`
- `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`
- `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`
- `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`
- `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`

Existing reusable probability-measure modules cover much of the early-book
substrate:

- generated sigma-fields and pi-system/extensionality wrappers;
- product measure and independent-copy/Fubini wrappers;
- first and second Borel-Cantelli wrappers;
- real-valued strong-law wrappers;
- tail/layer-cake/Markov/dominated-convergence wrappers;
- weak convergence and finite-dimensional law wrappers;
- empirical-process fixed-endpoint empirical-CDF support.

The immediate blocker has shifted from namespace setup to the first large
source theorem.  Best aggressive target: Durrett Theorem 2.4.9,
Glivenko-Cantelli for empirical CDFs.  The source scout selected this target
because the repo already has half-line empirical-CDF support and fixed-endpoint
strong-law wrappers:

- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`

The current missing piece is now narrower: the one-cell, two-cell,
right-append, and finite cutpoint-chain consumers for middle CDF partitions
compile, via
`SuppliedRealMiddleCDFPartition.oneCell`,
`SuppliedRealMiddleCDFPartition.twoCell`,
`SuppliedRealMiddleCDFPartition.snocCell`,
`SuppliedRealMiddleCDFPartitionChain`,
`exists_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`,
`exists_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`,
`exists_realMiddleCDFPartition_snocCell_of_exists`,
`exists_realMiddleCDFPartition_of_cutpoint_chain`, and the Durrett wrappers
`durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`
`durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`,
`durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists`,
`durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain`,
`durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid`,
`durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement`,
`durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement`,
`durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement`,
`durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement`,
`durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`,
`durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`,
`durrett2019_theorem_2_4_9_punctured_small_open_interval`,
`durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`,
`durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`,
`durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`,
`durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`,
`durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`, and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`,
and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`.
The remaining full-theorem-core step is the arbitrary finite middle CDF
partition existence consumed by
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`.
Equivalently, the next proof obligation can be phrased as constructing a
strict finite endpoint grid with small adjacent CDF left-limit increments for
every bounded interval and positive radius.  The compiled endpoint-grid,
cutpoint-chain, and cutpoint-chain-to-GC handoffs then give the Durrett 2.4.9
half-line GC wrapper directly.
The new non-atomic local ingredient
`exists_realOpenInterval_measureReal_lt_of_noAtoms` supplies small open
neighborhoods from `tendsto_measure_Icc_nhdsWithin_right'`, and
`exists_finset_realOpenInterval_cover_Icc_measureReal_lt_of_noAtoms` packages
those neighborhoods into a finite compact cover of `[a, b]`.
`exists_monotone_subdivision_Icc_measureReal_lt_of_noAtoms` then refines that
cover into a monotone closed-subinterval subdivision using mathlib's
`exists_monotone_Icc_subset_open_cover_Icc`.  The refinement consumers
`SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_measureReal_refinement`
and
`SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_closed_cover_refinement`
now turn any extracted strict endpoint tuple with small-cover cell assignments
directly into the cutpoint chain.  The stricter consumer
`SuppliedRealMiddleCDFPartitionChain.of_strict_subdivision_prefix_closed_cover`
now accepts the most convenient post-dedup no-skip output shape: a strict finite
prefix of the monotone subdivision ending at the right endpoint.  The more
flexible consumer
`SuppliedRealMiddleCDFPartitionChain.of_extracted_subdivision_adjacencies_closed_cover`
now accepts the true duplicate-erasure output shape: strict endpoints plus, for
each strict adjacent gap, the original adjacent subdivision cell that realizes
that gap.  The stronger consumer
`SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_closed_cover_to_index`
skips repeated adjacent values by induction, and
`SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_closed_cover`
now turns the non-atomic monotone subdivision directly into a cutpoint chain.
Consequently the non-atomic half-line GC wrapper
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms` now compiles.
For arbitrary laws, the atom-aware local primitives
`exists_realOpenInterval_diff_singleton_measureReal_lt` and
`exists_finset_realOpenInterval_punctured_cover_Icc_measureReal_lt` now provide
finite punctured neighborhoods with small mass, and
`SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_punctured_cover_refinement`
is the compiled consumer once strict endpoints are ordered so each open cell
avoids its selected atom center.  The convenience bridge
`SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_avoids_center_refinement`
now reduces that consumer to ordinary open-cover refinement plus the center
avoidance fact.  The endpoint-grid fact
`endpoint_not_mem_adjacent_Ioo_of_strictMono` and the bridge
`SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_endpoint_center_refinement`
now make center avoidance automatic whenever the selected center is inserted as
one of the strict grid endpoints.  The monotone-subdivision analogues
`subdivision_value_not_mem_adjacent_Ioo_of_monotone`,
`cdf_leftLim_sub_lt_of_subdivision_endpoint_center_cover_cell`, and
`SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_endpoint_center_cover`
now consume mathlib-shaped monotone subdivisions directly, provided each
selected center occurs somewhere among the subdivision values.  The convenience
bridge
`SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_center_mem_cover`
reduces the per-cell witness to the global statement that every finite cover
center occurs in the subdivision range.  The GC handoff
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`
now consumes those center-range subdivisions directly.  The fully arbitrary
distribution route still needs the finite ordering/splitting theorem that
inserts all selected centers into the monotone subdivision and makes each
closed adjacent cell refine a selected finite cover interval.
The supplied-grid and middle-partition-to-GC handoffs already compile.

Parallel target: Chapter 2.1 exact iid/product notation refinements only if
the GC grid blocks.  Theorem 2.1.7 generated-pi-system bridges, Theorem 2.1.8
generated-rectangle and real lower-halfline criteria, Theorem 2.1.9 grouped
sigma-field bridge, Theorem 2.1.10 finite disjoint-block function bridges, and
Theorem 2.1.11 finite product-law wrappers now compile.

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
6. Search and package independence/product-law wrappers for Theorems 2.1.7,
   2.1.10, 2.1.11, 2.1.12, and 2.1.13.  Reuse finite-`Pi` and product measure
   wrappers from `ProbabilityMeasure/ProductMeasure.lean` wherever possible.
   Generated pi-system independence, generated-rectangle independence
   criterion, real lower-halfline distribution-function criterion, grouped
   sigma-field independence, measurable-function preservation, finite
   disjoint-block functions, product-coordinate independence, pair and finite
   product-law, and expectation-factorization wrappers now compile; remaining
   Chapter 2.1 work is optional source-shape polish around exact iid/product
   notation.
7. After Chapter 2 has a stable theorem spine, start Chapter 3 by searching
   characteristic-function, normal-law, and weak-convergence APIs.

## Current In-Thread Goal Prompt Seed

Start every in-thread cycle by inspecting git status, fetching origin/main,
reviewing recent remote commits for other-agent Lean contributions, reading
this file plus the Durrett dashboard and blueprint, and scanning the current
`StatInference/ProbabilityTheory`, `StatInference/ProbabilityMeasure`, and
`StatInference/EmpiricalProcess/RealHalfLineGC.lean` modules.  Primary target:
Durrett Theorem 2.4.9 arbitrary-distribution finite middle CDF partition
constructor beyond the compiled one-cell/two-cell/right-append/cutpoint-chain,
endpoint-grid-to-chain, non-atomic local small-neighborhood,
non-atomic finite compact-cover, non-atomic monotone-subdivision, and
closed-cover endpoint-grid-refinement consumers.  The likely next primitive is
now the monotone-subdivision-to-strict-prefix construction: erase repeated
points from the eventually constant monotone sequence, preserve the assigned
small cover interval for each nondegenerate adjacent cell, prove the strict
finite prefix starts at `a` and ends at `b`, and feed
`SuppliedRealMiddleCDFPartitionChain.of_strict_subdivision_prefix_closed_cover`.
After that, handle arbitrary distributions with atom-aware endpoint selection
if naive splitting at a real cutpoint blocks.  Parallel target:
optional Chapter 2.1 iid/product notation polish only if the GC grid blocks.
Verify, update docs, commit/push, and keep this in-thread `/goal` state
current.  Report progress and blockers in Chinese/English mix.
