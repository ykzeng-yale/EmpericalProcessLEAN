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
   recurring automation.  The app-level objective can lag after verified
   packets; route from this file, the dashboard, the blueprint, and the latest
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
   parallel agent work.  Treat this Durrett lane as manual in-thread work, not
   as a background automation.  If authorized, the main thread owns the active
   proof and integration; scouts are read-only or have disjoint write scopes
   such as:

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
12. Stale-goal handling.  The app-level `/goal` objective may lag behind this
    file because the tool can only complete the goal, not rewrite it.  When the
    objective is stale, route from this file, the dashboard, the blueprint, and
    the latest pushed commit.  Do not create an automation as a workaround.

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

Existing reusable probability-measure modules cover much of the early-book
substrate:

- generated sigma-fields and pi-system/extensionality wrappers;
- product measure and independent-copy/Fubini wrappers;
- first and second Borel-Cantelli wrappers;
- real-valued strong-law wrappers;
- tail/layer-cake/Markov/dominated-convergence wrappers;
- weak convergence and finite-dimensional law wrappers;
- empirical-process fixed-endpoint empirical-CDF support.

The immediate blocker has shifted from Chapter 2 completion to the Chapter 3
weak-convergence and CLT spine.  The prior large targets are closed as source
wrappers:

- Durrett Theorem 2.4.9 now has the arbitrary-law half-line GC handoff and the
  source-facing empirical distribution-function wrapper
  `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`.
- Durrett Chapter 2.1 now has generated-independence, finite disjoint-block,
  finite product-law, iid common-law product, iid criterion, and canonical iid
  product-coordinate wrappers.

Do not spend the next cycle on center insertion, EDF notation, or Chapter 2.1
polish unless a later Chapter 3 statement exposes an exact missing dependency.

Current aggressive target: move from the Chapter 3.2 weak-convergence
foundations and basic Chapter 3.3 characteristic-function wrappers into the
Chapter 3.3 characteristic-function convergence spine.  The first Section 3.2
and 3.3 packets now compile:

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

The next likely packet should search convergence-theorem and CLT reuse before
adding new primitives:

- Definition/Section 3.2 weak convergence of random variables: reuse
  `MeasureTheory.TendstoInDistribution` and
  `StatInference/ProbabilityMeasure/WeakConvergence.lean`.
- Section 3.3 characteristic functions: basic law-level wrappers now compile;
  next search characteristic-function convergence, inversion/uniqueness support,
  and CLT-facing source wrappers.
- Section 3.10 characteristic-function convergence, Cramer-Wold, and
  multivariate CLT: search `StatInference/AsymptoticStatistics` and local
  weak-convergence files before adding new primitives.

High-value Chapter 3 source anchors are in
`Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`:

- Section 3.2 Weak Convergence starts near line 41.
- Theorem 3.2.9 appears near line 158.
- Theorem 3.2.10 appears near line 188.
- Theorem 3.2.11 appears near line 197.
- Section 3.3 Characteristic Functions starts near line 411.
- Theorem 3.3.1 appears near line 425.
- Theorem 3.3.2 appears near line 451.
- Section 3.10 multivariate weak convergence starts near line 3643.
- Theorems 3.10.1, 3.10.5, 3.10.6, and 3.10.7 appear near lines
  3647, 3778, 3784, and 3789.

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
- `Mathlib.Probability.Independence.CharacteristicFunction`

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
   3.3.2 independent-sum product law, now compile over mathlib
   characteristic-function APIs.  Next search the characteristic-function
   convergence theorem and CLT-facing wrappers before adding new primitives.

## Current In-Thread Goal Prompt Seed

Start every in-thread cycle by inspecting git status, fetching origin/main,
reviewing recent remote commits for other-agent Lean contributions, reading
this file plus the Durrett dashboard and blueprint, and scanning the current
`StatInference/ProbabilityTheory`, `StatInference/ProbabilityMeasure`, and
`StatInference/EmpiricalProcess/RealHalfLineGC.lean` modules.  Primary target:
do not return to the old center-insertion, EDF notation, or Chapter 2.1 iid
polish blockers.  Chapter 3.2 weak convergence now has compiled Durrett
Theorem 3.2.9 bounded-continuous test, 3.2.10 continuous-mapping continuous
case, and 3.2.11 Portmanteau wrappers.  Chapter 3.3 now has compiled
characteristic-function notation, Theorem 3.3.1 basic property wrappers, and
Theorem 3.3.2 independent-sum product law.  Next search the
characteristic-function convergence theorem, inversion/uniqueness support, and
Chapter 3.4 CLT wrappers while checking local asymptotic-statistics reuse first.
Verify, update docs, commit/push, and keep this in-thread `/goal` state current.
Report progress and blockers in Chinese/English mix.
