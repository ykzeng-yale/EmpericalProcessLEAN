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

## High-Accuracy High-Throughput Protocol

This section is the operating discipline for manual Durrett `/goal` runs.  It
is meant to prevent the observed failure modes in this lane: accidentally
treating the goal as an automation, replaying solved blockers after context
compaction, repeating broad source searches, and spending a full cycle on
micro-packets that do not move a source theorem.

1. Goal interpretation.  The Durrett lane is an active in-thread `/goal`, not a
   recurring automation.  The current app-level objective is aligned with this
   file; route from this file, the dashboard, the blueprint, and the latest
   pushed commit.
2. Start-state sync.  Begin every substantial cycle with `git status`, `git
   fetch origin`, and a short `HEAD..origin/main` review.  Fast-forward before
   planning when the worktree is clean, then inspect whether the remote commit
   touched Durrett, reusable probability, empirical-process, or only unrelated
   lanes.
3. Source anchoring.  Use the local Durrett Markdown/PDF anchors only for the
   theorem currently being packaged.  Record the exact source crosswalk when it
   changes the Lean target; do not reread whole chapters merely to restart
   route planning.
4. Packet size.  A normal run should target one theorem-sized Lean packet:
   either a source-facing Durrett wrapper, a reusable certificate bridge, or a
   narrow primitive that unlocks the current theorem.  Search-only or docs-only
   commits are reserved for genuine blocker discoveries or protocol fixes.
5. Search cache.  Search mathlib, local `StatInference`, and recent remote
   contributions before adding a primitive.  Reuse the cached anchors in this
   file and the dashboard before launching broad `rg` passes.
6. Target choice.  Prefer the largest source theorem layer that can plausibly
   compile today.  Do not return to solved center-insertion or cutpoint-chain
   blockers unless a new compiler error shows that one reopened.
7. Worktree discipline.  If multiple local agents are active or a proof packet
   needs long-running builds, consider an isolated worktree for the Durrett lane
   and keep this main checkout clean for sync and route docs.  Rebase/fetch at
   the start and immediately before push, not after every small search.
8. Agent authorization.  Do not spawn subagents merely because this document
   mentions scouts.  Use subagents only when the user explicitly asks for
   parallel agent work.  If authorized, the main thread owns the active proof
   and integration; scouts are read-only or have disjoint write scopes such as:

- source scout for Durrett anchors and theorem ordering;
- Lean reuse scout for mathlib/local APIs;
- bounded worker for a disjoint Lean or docs write scope;
- verifier/reviewer when a packet is ready.

9. Verification tiers.  During development, use focused `lake env lean` checks
   for touched modules.  Promote with targeted `lake build
   StatInference.ProbabilityTheory.<Module>` after a public theorem layer
   compiles.  Run root `lake build StatInference` before push when imports or
   reusable modules changed; for docs-only protocol changes, `git diff --check`
   and status/fetch are enough.
10. Git cadence.  Batch code, docs, proof-hole scan, secret scan, final
    fast-forward/rebase check, commit, and push.  If the push is rejected,
    rebase once, rerun the focused module build and scans relevant to the
    touched files, then push.
11. Communication.  Chat with the user in Chinese/English mix, but keep all
    code, file names, documentation, theorem comments, and commit messages in
    English.

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
`durrett2019_theorem_2_4_9_cutpointChain_append`,
`durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`,
`durrett2019_theorem_2_4_9_cutpointChain_of_subdivision_punctured_cover_cell`,
`durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`,
`durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_punctured_cover`,
`durrett2019_theorem_2_4_9_punctured_small_open_interval`,
`durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`,
`durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover`,
`durrett2019_theorem_2_4_9_cutpointChain`,
`durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`,
`durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`,
`durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`,
`durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`, and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`,
and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`, and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine`.
The arbitrary-law full-theorem core now compiles: finite punctured compact
covers are refined into monotone subdivisions, each strict subdivision cell is
split at its selected atom center only when needed, and the resulting finite
cutpoint chains feed the existing half-line GC handoff.
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
finite punctured neighborhoods with small mass.  The subdivision constructor
`exists_monotone_subdivision_Icc_punctured_measureReal_lt` and its Durrett
wrapper `durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover` now
refine that finite punctured cover into a mathlib-shaped monotone subdivision
with punctured small-mass assignments, but without yet proving the selected
centers occur as subdivision values.  Additionally,
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
now consumes those center-range subdivisions directly.  The arbitrary-law route
no longer needs a separate global center-insertion theorem:
`SuppliedRealMiddleCDFPartitionChain.of_subdivision_punctured_cover_cell`
splits one strict cell at its selected center when necessary,
`SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_punctured_cover_to_index`
assembles finite prefixes, and
`SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_punctured_cover`
turns the punctured monotone subdivision into a cutpoint chain.
The supplied-grid and middle-partition-to-GC handoffs already compile.
The splitting primitive
`SuppliedRealMiddleCDFPartitionChain.append` and its Durrett wrapper
`durrett2019_theorem_2_4_9_cutpointChain_append` now concatenate adjacent
chains, so the cell-splitting route is assembled without materializing a new
global endpoint list.
The subinterval bridge
`cdf_leftLim_sub_lt_of_subdivision_punctured_cover_subinterval`, with Durrett
wrapper
`durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`,
now proves that any strict inserted subcell of a punctured-cover subdivision
cell has small CDF increment once it avoids the selected center.
The Durrett wrappers `durrett2019_theorem_2_4_9_cutpointChain`,
`durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_punctured_cover`,
and `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine` now compile.
The source-facing empirical distribution-function statement also compiles:
`empiricalDistributionFunction` is the finite-sample `F_n(x)` notation,
`RealEmpiricalCDFGlivenkoCantelliClass` spells out the local uniform
`sup_x |F_n(x) - F(x)| -> 0` predicate, and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`
bridges the arbitrary-law half-line GC theorem to Durrett's Theorem 2.4.9
source notation.

Parallel target: Chapter 2.1 exact iid/product notation refinements only if a
later route reopens an exact source-shape gap.  Theorem 2.1.7
generated-pi-system bridges, Theorem 2.1.8 generated-rectangle and real
lower-halfline criteria, Theorem 2.1.9 grouped sigma-field bridge, Theorem
2.1.10 finite disjoint-block function bridges, and Theorem 2.1.11 finite
product-law, iid same-law product-law, iid criterion, and canonical iid
product-coordinate wrappers now compile.

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
   characteristic-function, normal-law, and weak-convergence APIs.

## Current In-Thread Goal Prompt Seed

Start every in-thread cycle by inspecting git status, fetching origin/main,
reviewing recent remote commits for other-agent Lean contributions, reading
this file plus the Durrett dashboard and blueprint, and scanning the current
`StatInference/ProbabilityTheory`, `StatInference/ProbabilityMeasure`, and
`StatInference/EmpiricalProcess/RealHalfLineGC.lean` modules.  Primary target:
do not return to the old center-insertion blocker.  Durrett Theorem 2.4.9
arbitrary-law half-line GC now compiles through the punctured-cell splitting
route, the source-facing empirical-distribution-function statement around
Durrett's `F_n` notation now compiles, and the Chapter 2.1 iid/product-law
notation wrappers now cover common-law finite products and canonical iid
product coordinates.  The next aggressive primitive should start the next
high-value Durrett chapter spine by searching mathlib/local weak-convergence,
characteristic-function, and normal-law APIs for Chapter 3, while treating
Chapter 2.1 as reusable support unless an exact later theorem needs a sharper
wrapper.  Verify, update docs, commit/push, and keep this in-thread `/goal`
state current.  Report progress and blockers in Chinese/English mix.
