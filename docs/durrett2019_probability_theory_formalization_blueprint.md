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

The current blocker plan contains `Live In-Thread Goal Prompt V151`, the live
`/goal` replacement prompt.  Use it when the app-level objective is older than
the verified route docs; do not create a duplicate goal or recurring
automation.

Current active frontier: Exercise 4.4.6 now has the deterministic
variance-clock recurrence, the variable-variance square-martingale source
bridge, the exact-denominator source-facing small-ball wrapper, and the
natural-filtration independent-increment small-ball endpoint; Exercise 4.4.9
now has the two-martingale product-covariance recurrence and finite-sum source
display; Exercise 4.4.10 now has the finite square-increment second-moment
identities, finite tail identity, `L^2` Cauchy-bound consumer, and
square-summability shifted-tail bound, shifted-tail tendsto-zero wrapper, and
explicit eventual `L^2` Cauchy estimate, `Lp` Cauchy sequence endpoint, and
existential `Lp` limit.  Continue with Exercise 4.4.11 by reusing predictable
transform support and the compiled Exercise 4.4.10 square-summability
endpoint.

For each cycle, route from:

1. `docs/durrett2019_probability_theory_current_blocker_primitive_plan.md`;
2. `docs/durrett2019_probability_theory_progress_dashboard.md`;
3. this blueprint;
4. the latest pushed commit and current remote contributions.

Keep the cycle small and source-facing: sync, inspect only the current theorem
anchors and relevant local/GitHub Lean contributions, name the source item,
target declaration, and consumed primitive, implement one theorem-sized Lean
packet, verify, update docs only when the frontier changes, commit, and push.
Use a separate worktree for dirty checkouts, long builds, or disjoint lanes.
Use subagents only when the user explicitly authorizes parallel agent work.

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
`strongLaw_ae_real`.  Durrett Theorem 2.4.1 starts as a source-wrapper over
that theorem; this wrapper now compiles in
`StatInference/ProbabilityTheory/Basic.lean`.  The previous Chapter 2.4 target
was Durrett Theorem 2.4.9, Glivenko-Cantelli for empirical CDFs, by reusing the
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

Compiled Section 3.2 packets:

- Durrett Theorem 3.2.10, continuous mapping theorem, continuous case.  Reuse
  `MeasureTheory.TendstoInDistribution.continuous_comp` through the local
  `tendstoInDistribution_continuous_comp` wrapper.  The varying-domain and
  common-probability-space forms now compile in
  `StatInference/ProbabilityTheory/Basic.lean`.
- Durrett Theorem 3.2.9, bounded-continuous test functions.  The wrapper
  bridges random-variable laws to local probability-measure weak convergence
  and uses `integral_map` to state the theorem in Durrett's expectation form.
- Durrett Theorem 3.2.11, Portmanteau alternatives.  The compiled wrappers
  cover open-set, closed-set, continuity-set, closed-converse, and open-converse
  forms for `TendstoInDistribution`.
- Durrett Section 3.3, characteristic functions.  The compiled wrappers cover
  law-level notation, Theorem 3.3.1 zero, conjugation, norm bound, continuous
  consequence, affine-map formula, and Theorem 3.3.2 independent-sum product
  law.
- Durrett Theorem 3.3.17, continuity theorem.  The compiled wrappers cover both
  directions of law-level characteristic-function convergence, the tightness
  branch from pointwise convergence to a continuous-at-zero limit, a bundled
  identified-limit form, and random-variable `TendstoInDistribution` wrappers.
- Durrett Theorem 3.3.20, centered unit-variance second-order expansion.  This
  exposes the Taylor estimate used in the i.i.d. CLT proof.
- Durrett Theorem 3.4.1, i.i.d. central limit theorem.  The compiled wrappers
  cover centered unit-variance and variance-Gaussian display forms.
- Durrett Theorem 3.4.10, Lindeberg-Feller for triangular arrays.  The
  compiled bridge covers row-sum notation, row-wise independence, finite-row
  characteristic-function products, product-to-row characteristic-function
  convergence, textbook mean-zero/variance-sum/Lindeberg-tail predicates, the
  explicit `exp(-sigma^2 t^2 / 2)` product-convergence interface, Gaussian
  characteristic-function display, row Gaussian exponential targets, quadratic
  variance coefficients/factors/products, Exercise 3.1.1 triangular-array
  row-sum, max-absolute, absolute-row-sum boundedness, product interfaces, the
  positivity/log-remainder proof route, and the proved source theorem, a
  variance-tail split bridge from Lindeberg to max-row-variance smallness, a
  proof of the textbook variance-tail split from square-integrable rows,
  specialized Exercise 3.1.1 bridges for the quadratic coefficients,
  max-row-variance-to-factor-norm bridges, Lemma 3.4.3 product-difference
  control, the variance-sum-to-row-target convergence bridge, the
  Levy-continuity handoff from a supplied analytic certificate to convergence
  in distribution, a named characteristic/quadratic error row sum, a
  source-shaped finite-row Taylor/Lindeberg bound predicate, a compiled bridge
  from that finite-row bound plus Lindeberg to row-sum error convergence, a
  source-shaped one-factor Taylor/Lindeberg bound predicate, a scalar
  Taylor-bound predicate written with second moments, a scalar expansion-bound
  predicate retaining the linear term, the pointwise truncation split of
  Durrett's minimum term, the pointwise Durrett Lemma 3.3.19 remainder term and
  predicate, the pure scalar minimum-form Taylor estimate, the compiled
  pointwise-to-expectation bridge to the (3.3.3) remainder predicate, and
  compiled constructors from the expansion bound to the scalar Taylor bound,
  one-factor bound, finite-row bound, analytic certificate, direct
  square-integrable analytic certificate, and final convergence-in-distribution
  theorem.

Next packet:

- Chapter 4.4: continue the martingale maximal-inequality layer.  The current
  frontier is the remaining exact Exercise 4.4.6 source instantiation:
  square-martingale source from increments feeding the compiled
  exact-denominator deterministic variance-clock wrapper.
  Theorem 4.4.1 optional-stopping wrappers, Exercise 4.4.5's
  conditional-variance variant, Exercise 4.4.6's stopped-variance small-ball
  handoff, the finite first-exit/small-ball assembly, the bounded-increment
  overshoot/source wrapper, the square-martingale wrapper with automatic
  stopped integrability, the deterministic variance-clock wrapper, and the
  exact-denominator wrapper now compile.  The
  finite-sum display, shifted geometric-sum, uniform second-moment bound,
  `eLpNorm 2` handoff, `L^2` convergence endpoint, expectation handoff,
  `E X = 1`, and nonzero-limit endpoint now compile for Example 4.4.9.  The
  Section 3.10
  multivariate CLT chain, Gaussian-coordinate independence criterion, Exercise
  3.10.8 linear-combination characterization wrappers, Durrett conditional
  expectation version predicate, mathlib-condExp version wrapper, Example 4.1.3
  self/constant wrappers, Example 4.1.4 independence wrapper, Theorem 4.1.9
  linearity/monotonicity wrappers, Theorem 4.1.10 conditional Jensen, Theorem
  4.1.11 `L¹`/`L²` contraction wrappers, Theorem 4.1.12
  measurability-collapse wrapper, Theorem 4.1.13 tower wrappers, and Theorem
  4.1.14 pull-out wrapper, and Theorem 4.1.15 `condExpL2` projection wrappers
  now compile and should be treated as closed support.  Chapter 4.2
  definition-level martingale wrappers and Example 4.2.1 linear random-walk
  martingale/supermartingale/submartingale and centered-display wrappers now
  compile.  The Example 4.2.2 quadratic martingale source bridge and its
  natural-random-walk instantiation now compile.  Example 4.2.3 product
  martingales now compile for independent integrable mean-one factors, and its
  normalized exponential display/wrapper now compiles from a nonzero common
  exponential moment.  Theorems 4.2.4 and 4.2.5 now compile as all-times and
  strict-index conditional-expectation wrappers, and the generic Theorem 4.2.6
  convex-image submartingale wrapper and `|X_n|^p` consequence now compile
  from conditional Jensen and the `x ↦ |x|^p` convexity wrapper.  Theorem
  4.2.7 increasing-convex transform, positive-part, and minimum-truncation
  wrappers now compile.  Theorem 4.2.8 predictable-transform wrappers now
  compile for submartingales, supermartingales, predictable-process
  entrypoints, and nonnegative martingale transforms.  Theorem 4.2.9
  stopped-process wrappers now compile for submartingales, supermartingales,
  and martingales.  Theorem 4.2.10 upcrossing inequality now compiles in both
  mathlib positive-part form and Durrett's textbook initial-positive-part
  subtraction display.  Theorem 4.2.11 now has direct mathlib L1/eLpNorm
  convergence wrappers: almost-sure existence, convergence to `ℱ.limitProcess`,
  L1 membership, integrability of the limit, martingale specializations, and
  the exact positive-part-boundedness bridge for Durrett's source hypothesis.
  Theorem 4.2.12 now has nonnegative-supermartingale convergence,
  integrable-limit, Fatou expectation, and final expectation-bounded limit
  wrappers.  Theorem 4.3.1 now has stopped-shifted convergence,
  survival-transfer, first-below stopping-time, bounded-increment lower-bound,
  first-below survival convergence, and bounded-below path-event convergence
  support wrappers, plus symmetric bounded-above and one-sided-bounded union
  convergence wrappers, plus the range-form convergence-or-unbounded
  dichotomy wrapper, the threshold-form oscillation wrapper, and the exact
  extended-real liminf/limsup display.  Durrett Theorem 4.3.2 now compiles
  through the Doob-decomposition existence/formula wrapper and canonical plus
  source-facing uniqueness wrappers using mathlib's
  `predictablePart`/`martingalePart` centering API.  Example 4.3.3 and Theorem
  4.3.4 conditional Borel-Cantelli now compile via mathlib
  `Probability.Martingale.BorelCantelli`.  The first Theorem 4.3.5 / Lemma
  4.3.6 RN-derivative packet now compiles: trimmed RN set-integral identity,
  likelihood-ratio martingale, and nonnegative convergence.  The Theorem 4.3.5
  regular/singular decomposition identities also now compile, including the
  source-shaped endpoint from supplied a.e. density and singular-restriction
  hypotheses.  The density-ratio/top-set source assembly also now compiles:
  dominating-measure and `mu + nu` RN ratio bridges, a source-facing `Y/Z`
  bridge, singular-set and `{X = infinity}` endpoints, and the final source
  assembly from `Y = dmu/drho`, `Z = dnu/drho`, `X = Y/Z`, and top-set
  separation.  The integral-representation to RN-derivative bridge also now
  compiles: set-integral representations of `mu` and `nu` against `rho`
  produce the `Y = dmu/drho` and `Z = dnu/drho` hypotheses consumed by the
  assembly.  The generator-extension bridge also now compiles, turning
  generator pi-system plus `univ` set-integral identities into all-measurable
  identities and the final source endpoint.  The bounded-convergence
  generator-production bridge also now compiles, turning eventual
  restricted-density identities for uniformly bounded nonnegative sequence
  densities into the generator/univ identities consumed by the endpoint.  The
  trimmed-RN eventual restricted-density bridge also now compiles, specializing
  that endpoint to the actual trimmed RN derivative sequences.  The natural
  `mu + nu` boundedness bridge also now compiles, discharging the uniform
  bound by `1` for both source sequences.  The real-to-`ENNReal` convergence
  handoff also now compiles, so the `mu + nu` endpoint consumes real-valued
  convergence of the bounded trimmed RN derivative sequences.  The bounded
  real-martingale layer also now compiles, giving limitProcess convergence for
  both natural `mu + nu` trimmed RN `toReal` sequences.  The canonical
  limit-density endpoint also now compiles, feeding finite nonnegative
  `ENNReal` density candidates built from those limit processes into the
  `mu + nu` endpoint.  The canonical-ratio endpoint also now compiles, and the
  denominator and singular-support top-set endpoints now prove both
  `nu {canonicalRatio = infinity} = 0` and
  `mu.singularPart nu {canonicalRatio = infinity}^c = 0` automatically.  The
  full canonical-ratio real identity for Theorem 4.3.5 now compiles.  The first
  Example 4.3.7 finite-partition packet also now compiles: the elementary
  partition likelihood approximation is measurable, equals the cell ratio on
  disjoint cells, and integrates over each cell to the numerator cell mass
  under the finite-cell absolute-continuity condition; its finite-union and
  generator-facing endpoint now also compile.  The first Theorem 4.3.8
  Kakutani finite-product packet also now compiles: finite-coordinate product
  likelihood measurability, rectangle set-integrals under `Measure.pi`, and the
  finite product-law `withDensity` identity.  The infinite-product
  cylinder/restriction handoff also now compiles: pulled-back likelihood
  measurability, finite-coordinate restriction `withDensity`, and cylinder
  set-integral endpoints.  The Hellinger factorization layer now also compiles:
  finite product square-root-power factorization, finite product Hellinger
  integral factorization, and the infinite-cylinder pulled-back Hellinger
  integral endpoint.  The zero-product Fatou layer now also compiles: Hellinger
  integrals tending to zero force the limiting likelihood to vanish a.e., and
  the finite-cylinder source handoff consumes finite Hellinger products
  directly.  The zero-product singularity bridge now also compiles from source
  real-identities plus `X = 0` denominator-a.e., including top-set,
  Hellinger, and cylinder-product handoffs.  The positive-product
  absolute-continuity bridge now also compiles from no-top-mass source
  real-identities, including a two-sided absolute-continuity handoff.  The
  first final branch assemblers now also compile for the zero Hellinger-product
  singular side and the two-sided no-top-mass positive side.  The
  positive-branch eliminator now also compiles: singularity forces the
  likelihood to vanish a.e., so a source dichotomy plus nonzero likelihood or
  null zero-set input yields absolute continuity.  The lintegral-nonzero and
  mass-one consumers now also compile for the positive branch.  The
  finite-cylinder mass-one/integral-convergence handoffs, the
  positive-product L1-to-integral handoff, the pairwise-liminf Cauchy-to-L1
  handoff, the Hellinger-tail-bound positive consumer, and the
  square-root/Cauchy-Schwarz Hellinger L1 bridge, and normalized
  positive-prefix product-tail convergence bridge now also compile.  The
  concrete pointwise/cylinder square-root factorization and concrete cylinder
  Cauchy handoff with the textbook factors also now compile.  The
  `sqrt X_n + sqrt X_m` square-integral estimate and the overlap-to-tail
  algebra handoff for the `sqrt X_n - sqrt X_m` side also now compile.  The
  scalar/cylinder Pythagorean overlap inequality and lower-bound-only overlap
  Cauchy handoff now also compile.  The finite-coordinate product integral,
  exact nested square-root overlap factorization, and finite Hellinger
  tail-product overlap handoff now also compile.  The HasProd/Multipliable
  prefix-tail bridge and standard `Finset.range n` HasProd-to-pairwise-liminf
  handoff now also compile.  The finite tail-product lower bound from positive
  prefix/tail monotonicity and the standard positive-product range consumer
  now also compile.  The source-density one-coordinate Hellinger affinity
  bound `≤ 1`, normalized positive-product tail `≤ 1` bridge, and standard
  source-density positive-product range consumer now also compile.  The
  standard `Finset.range n` source-density `HasProd` positive-product
  absolute-continuity handoff now also compiles.  The a.e.-finite no-top
  source bridge and the standard source-density `HasProd`
  absolute-continuity consumer using it now also compile.  Kolmogorov
  tail-event zero-one support and the zero-set-not-full positive-branch
  eliminator now also compile.  The lower-integral source bridge from tail
  zero set and `∫⁻ X ≠ 0` to zero-set-null and the positive-branch conclusion
  now also compiles.  The every-tail-block measurability bridge into the
  `limsup` tail sigma-field now also compiles, including zero-set-null and
  absolute-continuity consumers from every-tail-block measurability plus
  `∫⁻ X ≠ 0`.  The tail-coordinate sigma-field and finite tail cylinder
  likelihood measurability layer now also compiles, including finite tail
  cylinder zero-set measurability and the zero-set-equality handoff to
  every-tail-coordinate measurability.  The finite-prefix zero-set algebra and
  prefix-cylinder zero-set handoff now also compile.  The prefix/tail
  finite-block and tail-block-limit handoff layer now also compiles, including
  finite tail-block measurability, pointwise tail-block-limit measurability,
  limiting prefix/tail factorization, and the zero-set handoff from tail-block
  limits.  The pointwise finite/nonzero coordinate side-condition bridge now
  also compiles.  The range-limit tail handoff now also compiles: full-prefix
  likelihood convergence supplies the canonical tail-block limit
  `X / prefix_n` and tail-coordinate zero-set handoff under pointwise finite
  and nonzero coordinate densities.  The range-limit positive-branch consumers
  now also compile: coordinate sigma-fields are independent under the
  denominator infinite product law; ENNReal full-prefix convergence supplies
  the `toReal` convergence input for the L1/Cauchy branch; pointwise finite
  coordinate densities supply the pairwise no-top side condition; and
  pointwise full-prefix convergence plus finite/nonzero coordinate densities
  and `∫⁻ X ≠ 0` feed the tail-zero-set positive-branch eliminator.  The
  canonical-ratio handoff into these range-limit consumers now also compiles:
  the canonical `mu + nu` ratio supplies `toReal = dmu/dnu` and
  `nu {canonicalRatio = infinity} = 0` automatically.  Canonical-ratio real
  integrability, the real-valued full-prefix convergence consumer, the
  quotient-limit convergence bridge, the canonical prefix-filtration
  measurability/inclusion support, the trimmed-prefix RN-ratio identity, the
  denominator-limit nonzero bridge, canonical prefix convergence from the
  trimmed-prefix ratio, and the positive Hellinger-product wrapper with that
  convergence supplied also now compile.  The positive-product finite-limit side
  condition is also discharged from the source Hellinger affinity bounds.  The
  canonical product-tail and `tprod` positive-product wrappers also now compile,
  so the positive branch no longer needs an auxiliary tail equality and can use
  `Multipliable` plus the actual infinite Hellinger product, including
  strict-positive product variants.  The first canonical zero/positive product
  criterion wrapper also now compiles: `HasProd h 0` feeds the singular branch,
  while strict product positivity feeds the positive branch.  Canonical
  `mu + nu` limit-density and likelihood-ratio measurability are compiled
  support.  The ENNReal full-prefix convergence upgrade and closed zero/positive
  branch wrapper also now compile.  The textbook `tprod` zero/positive branch
  wrapper now also compiles.  Coordinate finiteness is now discharged from the
  finite-prefix likelihood integral-one identities, and the no-top `tprod`
  branch wrapper now also compiles, and the direct source-identity
  likelihood-mass bridge removes the ambient Kakutani dichotomy from that
  endpoint.  Lemma 4.3.9's normalized conditional-mean martingale bridge also
  now compiles.  Section 4.4 Theorem 4.4.2's nonnegative-submartingale and
  positive-part Doob maximal inequality wrappers also now compile.  The active
  target is the remaining 4.4.2 display, Example 4.4.3 Kolmogorov maximal
  inequality, or Theorem 4.4.4 Lp maximal inequality.  The remaining 4.4.2
  positive-part total-expectation display now also compiles, so the active
  frontier is Example 4.4.3 or Theorem 4.4.4.  Example 4.4.3 now has the
  squared-threshold Kolmogorov maximal wrapper, so the next frontier is the
  exact absolute-max/variance display if cheap, otherwise Theorem 4.4.4.  The
  Example 4.4.3 division and absolute-maximum variance-bound displays now also
  compile.  Theorem 4.4.4's martingale absolute-maximum consequence bridge now
  compiles from a supplied positive-part Lp maximal bound.  The p-th-power
  `lintegral` to `eLpNorm` bridge and martingale source wrapper now also
  compile.  The positive-part layer-cake equality, pointwise Doob layer-cake
  integrand bound, Hölder integral bound, set-integral to restricted-`lintegral`
  bridge, pure `lintegral` Doob integrand bound, and integrated Doob layer-cake
  bound now also compile.  The weighted/Fubini identification now also compiles
  through withDensity and base-measure forms.  The coefficient extraction,
  assembled Doob/Fubini/Hölder endpoint, scalar cancellation lemma, finite
  `lintegral` estimate, finite `eLpNorm` wrapper, generic nonnegative
  layer-cake helper, measurable-comparison Hölder helper, bounded-truncation
  Doob/Fubini/Hölder assembly, finite truncation `lintegral` proof, and
  per-cutoff truncated `lintegral` estimate, monotone-convergence/iSup handoff,
  final positive-part `eLpNorm` wrapper, and final martingale absolute-maximum
  `eLpNorm` wrapper now also compile.  The Theorem 4.4.6 bridge from a uniform
  `L^p` martingale bound to the 4.2.11 almost-sure limit and limit-process
  `MemLp` now also compiles, and the final `L^p` convergence endpoint compiles
  when a single `MemLp` dominating variable is supplied.  The finite
  running-maximum assembly now also compiles from Theorem 4.4.4 bounds and a
  supplied a.s. running-maximum limit.  The canonical running supremum,
  measurability, convergence from a.s. boundedness, and final running-`S`
  assembly now also compile.  The a.s. boundedness bridge from uniform
  finite-maximal `eLpNorm` bounds and the final Theorem 4.4.6 `L^p` convergence
  endpoint now compile.  The Theorem 4.4.7 orthogonality and
  increment-increment wrappers now compile.  The Theorem 4.4.8 conditional
  variance formula now also compiles.  The Example 4.4.9 conditional,
  integrated second-moment recurrence, finite-sum display, shifted
  geometric-sum, uniform second-moment bound, `eLpNorm 2` handoff, `L^2`
  convergence endpoint, expectation handoff, `E X = 1`, and nonzero-limit
  endpoint now also compile.  Exercise 4.4.5's conditional-variance variant now
  also compiles.  Theorem 4.4.1 optional-stopping wrappers, Exercise 4.4.6's
  stopped-variance small-ball handoff, the finite first-exit/small-ball
  assembly, the bounded-increment overshoot/source wrapper, and the
  square-martingale wrapper with automatic stopped integrability, plus the
  deterministic variance-clock and exact-denominator wrappers, now also
  compile.
  Theorem 4.1.16 remains deferred unless a direct kernel API appears.

Support-only dependencies:

- Use Section 3.3 inversion or uniqueness support only when it directly blocks
  the active Chapter 4.1 theorem or a later theorem with a real dependency.
- Treat Section 3.4 Lindeberg-Feller analytic estimates, including the direct
  square-integrable source wrapper and variance-tail split machinery, as closed
  support to consume rather than re-prove.

Chapter 3 source inventory:

- Section 3.2 weak convergence of random variables.
- Theorem 3.2.9, bounded-continuous test functions.
- Theorem 3.2.10, continuous mapping theorem.
- Theorem 3.2.11, Portmanteau alternatives.
- Lemma 3.1.1, scalar exponential limit.
- Theorem 3.1.2, de Moivre-Laplace local limit.
- Section 3.3 characteristic functions and inversion formula.
- Section 3.4 central limit theorems.
- Section 3.10 limit theorems in `R^d`.
- Active frontier: Chapter 4.2 martingales.

Source anchors:

- `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`
  contains Section 3.2 near line 41, Theorem 3.2.9 near line 158, Theorem
  3.2.10 near line 188, Theorem 3.2.11 near line 197, Section 3.3 near line
  411, Theorem 3.3.17 near line 748, Theorem 3.3.20 near line 898, Section
  3.4 near line 1228, Theorem 3.4.1 near line 1234, and Section 3.10 near line
  3643.
- The same Markdown chunk contains Chapter 4.1 conditional expectation:
  Lemma 4.1.1 near line 3894, Theorem 4.1.2 near line 3920, Example 4.1.4
  near line 3969, Example 4.1.5 near line 3982, Theorem 4.1.9 near line 4081,
  Theorem 4.1.13 near line 4183, and Theorem 4.1.14 near line 4196.
- The same Markdown chunk contains Chapter 4.2 martingales near line 4348,
  Example 4.2.1 linear martingales near line 4358, and Example 4.2.2 quadratic
  martingales near line 4378, followed by Example 4.2.3 exponential
  martingales.

Initial Lean reuse anchors:

- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/AsymptoticStatistics/MomentEstimators.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/CharacteristicFunction/TaylorExpansion.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/LevyConvergence.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/CharacteristicFunction.lean`
- `.lake/packages/mathlib/Mathlib/Probability/CentralLimitTheorem.lean`

### Lane E: martingales, Markov chains, Brownian motion

These later chapters should be prepared by read-only search first.  They are
valuable, but should not block the active Chapter 4.1 conditional-expectation
lane unless a remote agent has already landed directly reusable support.

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
