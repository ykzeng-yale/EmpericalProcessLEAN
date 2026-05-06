# Durrett 2019 Current Blocker And Primitive Plan

This file is the active blocker register for the Durrett probability-theory
lane.  It should be checked at the start of each automation run before choosing
a proof target.

## Adaptive Automation Prompt Rule

The recurring Durrett automation is part of the proof state.  Every run should
finish by checking whether its live prompt is stale relative to this file, the
dashboard, the blueprint, and the latest verified commit.

Refresh the prompt whenever a run:

- proves a Lean declaration;
- narrows or discovers a blocker;
- merges other-agent work;
- changes the next atomic target;
- records a material mathlib/local-code search result.

The refreshed prompt should name:

- the latest pushed commit and new declarations or blocker refinement;
- one primary theorem/proof target plus independent support targets;
- the search-first scope: pinned mathlib, local `StatInference`, existing
  `ProbabilityMeasure`, and remote contributions;
- the verification gate: focused `lake env lean`, targeted `lake build`, root
  build if imports changed, proof-hole scan, secret scan, and `git diff --check`;
- the report gate: no Durrett report until an exact source theorem compiles and
  source evidence is captured.

## Throughput Policy

Each run should make concrete verified Lean progress or document a precise
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
- `durrett2019_theorem_2_1_10_product_coordinate_functions_independent`
- `durrett2019_theorem_2_1_11_indepFun_hasLaw_prod`
- `durrett2019_theorem_2_1_12_product_integral`
- `durrett2019_theorem_2_1_12_product_integral_mul`
- `durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral`
- `durrett2019_theorem_2_1_13_iIndepFun_integral_prod_eq_prod_integral`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_supplied_endpoint_grids`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`

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

The current missing piece is now narrower: prove the arbitrary-distribution
middle CDF partition existence consumed by
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`.
The supplied-grid and middle-partition-to-GC handoffs already compile.

Parallel target: Theorems 2.1.7-2.1.13 independence/product-law wrappers, after
a search-first audit of mathlib independence APIs.

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
   Product-coordinate and expectation-factorization wrappers now compile;
   remaining work is generated sigma-field grouped independence.
7. After Chapter 2 has a stable theorem spine, start Chapter 3 by searching
   characteristic-function, normal-law, and weak-convergence APIs.

## Current In-Thread Goal Prompt Seed

Start every run by inspecting git status, fetching origin/main, reviewing recent
remote commits for other-agent Lean contributions, reading this file plus the
Durrett dashboard and blueprint, and scanning the current
`StatInference/ProbabilityTheory`, `StatInference/ProbabilityMeasure`, and
`StatInference/EmpiricalProcess/RealHalfLineGC.lean` modules.  Primary target:
Durrett Theorem 2.4.9 arbitrary-distribution middle CDF partition constructor.
Parallel target: generated-sigma grouped-independence wrappers for Theorems
2.1.7-2.1.10 if the GC grid blocks.  Verify, update docs, commit/push, and keep
this in-thread `/goal` state current.  Report progress and blockers in
Chinese/English mix.
