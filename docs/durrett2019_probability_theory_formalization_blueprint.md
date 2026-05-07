# Durrett 2019 Probability Theory Formalization Blueprint

This document starts the Durrett 2019 probability-theory lane for the Lean
formalization in `StatInference/`.  The source crosswalk is Richard Durrett,
*Probability: Theory and Examples*, fifth edition, 2019.  The Lean code for
Durrett-specific theorem packaging should live in the content-based folder
`StatInference/ProbabilityTheory/`; reusable lower-level probability-measure
infrastructure should continue to live in `StatInference/ProbabilityMeasure/`.

The lane follows the existing Billingsley and Optimization proof-orchestration
style inside this chat: search first, reuse mathlib and local wrappers
aggressively, prove theorem-sized Lean packets, verify locally, update the
route docs, then sync GitHub.  The goal is full-book coverage over time, but
each in-thread cycle should choose the next largest theorem step that can
actually compile.

## Local Sources

- Markdown chunks:
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_245-366.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_367-490.md`
- PDF anchors:
  - `Textbooks/Durrett2019ProbabilityTheory/PDF/Durrett2019 - Probability Theory and Examples.pdf`
  - matching split PDFs in the same directory.

## In-Thread Goal Maintenance

The Durrett lane is an active `/goal` in this chat, not a recurring automation.
At the end of every cycle that proves, blocks, merges, commits, pushes, or
materially changes the route, refresh the route state from:

1. `docs/durrett2019_probability_theory_current_blocker_primitive_plan.md`;
2. `docs/durrett2019_probability_theory_progress_dashboard.md`;
3. this blueprint;
4. the latest pushed commit and current remote contributions.

Each refreshed in-thread target should name the latest verified declarations,
one primary theorem target, independent support targets, search-first scope,
verification gate, and report gate.  Do not replay a solved target.

If the app-level `/goal` objective lags behind the latest pushed proof packets,
do not create an automation or a duplicate goal.  Treat the route docs and the
latest commit as the live target, then update the docs so the next compaction
or agent handoff starts from the same frontier.

Use subagents only when the user explicitly authorizes parallel agent work.
Otherwise, keep the active proof in this thread and improve throughput with
search caching, isolated worktrees for long builds or disjoint local lanes, and
one fetch/rebase pass at the start plus one immediately before push.

## Status Vocabulary

- `exact-local`: exact textbook item statement is formalized and proved with no
  `sorry`, `admit`, unreviewed `axiom`, or `unsafe`, and a report may be
  prepared.
- `source-wrapper`: compiled Durrett-named theorem wrapper around mathlib or
  existing local code; useful for source crosswalks, but not yet a full theorem
  report unless the statement is exact.
- `local-layer`: compiled supporting primitive that moves toward a source item.
- `mathlib-foundation`: mathlib already has the mathematical theorem/API, but
  no Durrett-exact wrapper/report exists yet.
- `reused-local`: existing `StatInference/ProbabilityMeasure`,
  `EmpiricalProcess`, or `Asymptotics` declaration is the proof authority.
- `pending-local`: not started.
- `deferred-application`: example or optional starred topic temporarily skipped
  because it needs substantial external-domain formalization.

## Book Spine

- Chapter 1: measure theory, probability spaces, distributions, measurable
  maps, integration, expected value, product measures, Fubini.
- Chapter 2: independence, weak laws, Borel-Cantelli, strong laws, random
  series, renewal theory, large deviations.
- Chapter 3: central limit theorems, characteristic functions, CLT variants,
  infinitely divisible laws, limit theorems in `R^d`.
- Chapter 4: conditional expectation and martingales, convergence,
  inequalities, optional stopping, random walk applications.
- Chapter 5: Markov chains, construction, Markov properties, recurrence,
  transience, stationary distributions, convergence theorem.
- Chapter 6: ergodic theorems.
- Chapter 7: Brownian motion and stochastic calculus foundations.
- Chapter 8: Donsker theorem, Brownian-motion limit theory, CLT for dependent
  sequences, law of the iterated logarithm.
- Appendix: extension, uniqueness, Radon-Nikodym, conditional probability,
  Kolmogorov extension, analytic support.

## Priority Lanes

### Lane A: Chapter 2 independence and product laws

Durrett Sections 2.1.1-2.1.3 are the first high-leverage lane.  They connect
generated sigma-field wrappers, mathlib independence APIs, local product
measure wrappers, and later LLN/CLT/martingale proofs.

Source anchors:

- Theorem 2.1.6, pi-lambda theorem:
  `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`
  around the Section 2.1.1 independence proof.
- Theorem 2.1.7, independent pi-systems generate independent sigma-fields.
- Theorem 2.1.8, distribution-function criterion for independence.
- Theorem 2.1.9, independent grouped sigma-fields.
- Theorem 2.1.10, functions of disjoint independent random-variable blocks are
  independent.
- Theorem 2.1.11, independent random variables have product joint law.
- Theorem 2.1.12, expectation/Fubini formula for independent pairs.
- Theorem 2.1.13, expectation of a product of independent variables.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- mathlib `Probability.Independence.Basic`
- mathlib `Probability.Independence.Integration`
- mathlib `Probability.HasLaw`
- mathlib `Probability.Process.FiniteDimensionalLaws`

The first theorem-sized Durrett packet should package theorem statements whose
proof authority is already mathlib/local.  Avoid rebuilding Dynkin-system
foundations unless mathlib lacks the exact generated-independence bridge needed
for Theorems 2.1.7-2.1.10.

### Lane B: Borel-Cantelli and convergence upgrades

Durrett Section 2.3 is immediately reusable and already partly covered by
`StatInference/ProbabilityMeasure/BorelCantelli.lean`.

Source anchors:

- Theorem 2.3.1, first Borel-Cantelli lemma.
- Theorem 2.3.2, convergence in probability iff every subsequence has an a.s.
  convergent further subsequence.
- Theorem 2.3.4, continuous mapping for convergence in probability and bounded
  expectation convergence.
- Theorem 2.3.7, second Borel-Cantelli lemma.
- Theorem 2.3.9, pairwise-independent record-count strong ratio.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- mathlib `Probability.BorelCantelli`
- mathlib convergence-in-measure/probability APIs

Compiled first source wrappers:

- Durrett Theorem 2.3.1 around `measure_limsup_atTop_eq_zero`.
- Durrett Theorem 2.3.7 around `measure_limsup_eq_one`.
- Durrett Theorem 2.4.1 around `strongLaw_ae_real` and
  `centeredStrongLaw_ae_real`.
- Early pi-system uniqueness bridge around
  `probabilityMeasure_ext_of_generate_finite`.
- Durrett Theorem 1.1.1 measure-property wrappers and Theorems 1.3.1/1.3.4
  measurability wrappers.
- Durrett Theorem 2.1.7 generated-pi-system independence, Theorem 2.1.8
  generated-rectangle and real lower-halfline distribution-function criteria,
  Theorem 2.1.9 grouped sigma-field independence, Theorem 2.1.10
  measurable-function preservation/finite disjoint-block/product-coordinate
  independence, 2.1.11 pair and finite-family product laws, 2.1.12
  product/Fubini expectation, and 2.1.13 expectation-factorization wrappers.
- Durrett Theorem 2.1.11 iid notation polish:
  `probability_pi_iid_coordinates_with_joint_law`,
  `durrett2019_theorem_2_1_11_iid_hasLaw_pi`,
  `durrett2019_theorem_2_1_11_iid_iff_hasLaw_pi`, and
  `durrett2019_theorem_2_1_11_canonical_iid_product_coordinates` package the
  common-law finite product and canonical iid product-space source shapes.
- Durrett Theorem 2.4.9 conditional Glivenko-Cantelli handoffs from supplied
  endpoint grids and supplied middle CDF partitions.
- Durrett Theorem 2.4.9 one-cell middle CDF partition base case:
  `SuppliedRealMiddleCDFPartition.oneCell`,
  `exists_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`.
- Durrett Theorem 2.4.9 two-cell split constructor:
  `SuppliedRealMiddleCDFPartition.twoCell`,
  `exists_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`.
- Durrett Theorem 2.4.9 right-append constructor:
  `SuppliedRealMiddleCDFPartition.snocCell`,
  `exists_realMiddleCDFPartition_snocCell_of_exists`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists`.
- Durrett Theorem 2.4.9 finite cutpoint-chain consumer:
  `SuppliedRealMiddleCDFPartitionChain`,
  `exists_realMiddleCDFPartition_of_cutpoint_chain`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain`.
- Durrett Theorem 2.4.9 endpoint-grid-to-cutpoint-chain handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid` and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid`; plus
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_closed_cover_refinement`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement`.
- Durrett Theorem 2.4.9 source-facing empirical distribution-function layer:
  `empiricalDistributionFunction`,
  `RealEmpiricalCDFGlivenkoCantelliClass`, and
  `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`
  package the local `sup_x |F_n(x) - F(x)| -> 0` predicate.
- Durrett Theorem 2.4.9 atom-aware endpoint-grid handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_punctured_cover_refinement`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement`.
- Durrett Theorem 2.4.9 atom-aware open-cover/avoidance handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_avoids_center_refinement`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement`.
- Durrett Theorem 2.4.9 endpoint-center handoff:
  `endpoint_not_mem_adjacent_Ioo_of_strictMono`,
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_endpoint_center_refinement`,
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement`.
- Durrett Theorem 2.4.9 cutpoint-chain splitting handoff:
  `SuppliedRealMiddleCDFPartitionChain.append` and
  `durrett2019_theorem_2_4_9_cutpointChain_append`.
- Durrett Theorem 2.4.9 inserted-subcell punctured-cover handoff:
  `cdf_leftLim_sub_lt_of_Ioo_subset_punctured_cover`,
  `cdf_leftLim_sub_lt_of_subdivision_punctured_cover_subinterval`, and
  `durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`.
- Durrett Theorem 2.4.9 punctured-cover cell-splitting handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_subdivision_punctured_cover_cell`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_subdivision_punctured_cover_cell`.
- Durrett Theorem 2.4.9 strict-subdivision-prefix handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_strict_subdivision_prefix_closed_cover`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`.
- Durrett Theorem 2.4.9 extracted-subdivision-adjacency handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_extracted_subdivision_adjacencies_closed_cover`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`.
- Durrett Theorem 2.4.9 monotone-subdivision duplicate-skip handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_closed_cover_to_index`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_closed_cover`,
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`.
- Durrett Theorem 2.4.9 monotone-subdivision endpoint-center handoff:
  `subdivision_value_not_mem_adjacent_Ioo_of_monotone`,
  `cdf_leftLim_sub_lt_of_subdivision_endpoint_center_cover_cell`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_endpoint_center_cover_to_index`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_endpoint_center_cover`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_center_mem_cover`,
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`;
  the Durrett center-range wrapper is
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`.
- Durrett Theorem 2.4.9 arbitrary-law atom-aware local ingredients:
  `exists_realOpenInterval_diff_singleton_measureReal_lt`,
  `exists_finset_realOpenInterval_punctured_cover_Icc_measureReal_lt`,
  `exists_monotone_subdivision_of_finset_realOpenInterval_punctured_cover_Icc`,
  `exists_monotone_subdivision_Icc_punctured_measureReal_lt`,
  `durrett2019_theorem_2_4_9_punctured_small_open_interval`,
  `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`, and
  `durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover`.
- Durrett Theorem 2.4.9 arbitrary-law punctured-subdivision chain and GC
  packages:
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_punctured_cover_to_index`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_punctured_cover`,
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_punctured_cover`,
  `durrett2019_theorem_2_4_9_cutpointChain`, and
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine`.
- Durrett Theorem 2.4.9 non-atomic local grid ingredient:
  `exists_realOpenInterval_measureReal_lt_of_noAtoms` and
  `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`.
- Durrett Theorem 2.4.9 non-atomic finite compact-cover ingredient:
  `exists_finset_realOpenInterval_cover_Icc_measureReal_lt_of_noAtoms` and
  `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`.
- Durrett Theorem 2.4.9 non-atomic monotone-subdivision ingredient:
  `exists_monotone_subdivision_Icc_measureReal_lt_of_noAtoms` and
  `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`.
- Durrett Theorem 2.4.9 non-atomic cutpoint-chain and GC packages:
  `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms` and
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`.
- Durrett Theorem 2.4.9 cutpoint-chain-to-GC handoff:
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`.
- Durrett Theorem 2.4.9 center-range subdivision-to-GC handoff:
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`.

The subsequence and continuous-mapping theorems are higher value but may require
more topological convergence API packaging.

### Lane C: Strong laws and empirical distribution functions

Durrett Section 2.4 is a major downstream target and overlaps with existing
Billingsley/VdV&W infrastructure.

Source anchors:

- Theorem 2.4.1, Etemadi strong law for pairwise independent identically
  distributed integrable variables.
- Lemma 2.4.2, truncation reduction.
- Lemma 2.4.3, variance summability for truncations.
- Lemma 2.4.4, scalar tail-sum bound.
- Theorem 2.4.5, infinite positive mean strong divergence.
- Theorem 2.4.7, renewal-count asymptotic.
- Theorem 2.4.9, Glivenko-Cantelli theorem.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- mathlib `Probability.StrongLaw`
- mathlib Borel-Cantelli and layer-cake/tail integrals

Mathlib currently supplies a real-valued strong law under pairwise independence
and identical distribution through the local wrapper
`strongLaw_ae_real`.  Durrett Theorem 2.4.1 should therefore start as a
source-wrapper over that theorem; this wrapper is now compiled in
`StatInference/ProbabilityTheory/Basic.lean`.  The next aggressive target is
Durrett Theorem 2.4.9, Glivenko-Cantelli for empirical CDFs, by reusing the
existing `RealHalfLineGC.lean` fixed-endpoint and half-line infrastructure and
filling the arbitrary-CDF finite quantile grid/squeezing layer.  The supplied
endpoint-grid and supplied middle-CDF-partition handoffs now compile, and the
one-cell, two-cell, right-append, and finite cutpoint-chain middle-partition
consumers now compile.  A strict endpoint-grid-to-cutpoint-chain handoff, a
closed-cover endpoint-grid refinement handoff, a
non-atomic local small-neighborhood lemma, a non-atomic finite compact-cover
lemma, a non-atomic monotone-subdivision lemma, strict-prefix and extracted-gap
closed-cover handoffs, a monotone-prefix duplicate-skip induction, a non-atomic
cutpoint-chain package, a Durrett-named cutpoint-chain-to-GC handoff, and the
non-atomic half-line Glivenko-Cantelli package also compile.  For arbitrary
laws, punctured local neighborhoods and finite compact punctured covers now
compile, together with the endpoint-grid consumer for open cells that avoid
the selected atom center.  The open-cover/avoidance bridge now reduces the
punctured-cover consumer to ordinary open-cover refinement plus the fact that
the selected center is not inside the open cell.  The arbitrary-distribution
core now avoids a separate global endpoint-insertion construction: each strict
monotone-subdivision cell is split at its selected atom center only when that
center lies inside the cell, finite prefixes are assembled by chain append, and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine` compiles for arbitrary
probability laws on the real line.

### Lane D: Weak convergence, CLT, and characteristic functions

Chapter 3 is the next large probability-theory spine after laws of large
numbers.  Search mathlib and local files for weak convergence, characteristic
functions, normal distribution APIs, and finite-dimensional weak convergence
before formalizing.

Compiled first packet:

- Durrett Theorem 3.2.10, continuous mapping theorem, continuous case.  Reuse
  `MeasureTheory.TendstoInDistribution.continuous_comp` through the local
  `tendstoInDistribution_continuous_comp` wrapper.  The varying-domain and
  common-probability-space forms now compile in
  `StatInference/ProbabilityTheory/Basic.lean`.

Next packet candidates:

- Durrett Theorem 3.2.9, bounded-continuous test functions, by bridging
  random-variable laws to local probability-measure weak-convergence
  characterizations.
- Durrett Theorem 3.2.11, Portmanteau alternatives, by reusing local
  Portmanteau wrappers if the statement gap is smaller than the integral
  bridge.
- Section 3.3 characteristic-function wrappers if the Section 3.2 bridges
  require too much new measure-level infrastructure.

Likely initial source items:

- Section 3.2 weak convergence of random variables.
- Theorem 3.2.9, bounded-continuous test functions.
- Theorem 3.2.10, continuous mapping theorem.
- Theorem 3.2.11, Portmanteau alternatives.
- Lemma 3.1.1, scalar exponential limit.
- Theorem 3.1.2, de Moivre-Laplace local limit.
- Section 3.3 characteristic functions and inversion formula.
- Section 3.4 central limit theorems.
- Section 3.10 limit theorems in `R^d`.

Source anchors:

- `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`
  contains Section 3.2 near line 41, Theorem 3.2.9 near line 158, Theorem
  3.2.10 near line 188, Theorem 3.2.11 near line 197, Section 3.3 near line
  411, and Section 3.10 near line 3643.

Initial Lean reuse anchors:

- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/AsymptoticStatistics/MomentEstimators.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`

### Lane E: martingales, Markov chains, Brownian motion

These later chapters should be prepared by read-only search first.  They are
valuable, but should not block the early Chapter 2 coverage unless a remote
agent has already landed reusable support.

Likely anchors:

- Chapter 4: conditional expectation, martingale convergence, optional
  stopping.
- Chapter 5: Markov chain construction, Markov property, recurrence,
  stationary distributions.
- Chapter 7/8: Brownian motion and Donsker theorem.

## Initial Reuse Audit

High-value local files:

- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`

High-value mathlib search roots:

- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/PiSystem.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/MeasurableSpace/Pi.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Prod.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Integration.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLaw.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLawExists.lean`
- `.lake/packages/mathlib/Mathlib/Probability/IdentDistrib.lean`
- `.lake/packages/mathlib/Mathlib/Probability/BorelCantelli.lean`
- `.lake/packages/mathlib/Mathlib/Probability/StrongLaw.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`

## Report Gate

No Durrett theorem report should be produced until an exact source statement is
fully proved in Lean, the corresponding source anchor is cross-checked against
the PDF/Markdown, screenshots or source excerpts are captured under the report
policy, and the local report artifact compiles.
