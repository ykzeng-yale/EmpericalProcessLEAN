# Billingsley 1995 Probability and Measure Formalization Blueprint

This document starts the Billingsley source-audit lane for the Lean
formalization in `StatInference/`.  The Lean code for reusable probability and
measure foundations lives in the content-based folder
`StatInference/ProbabilityMeasure/`, while Billingsley remains the source
crosswalk name.  The lane is meant to serve two goals:

1. Formalize Billingsley, *Probability and Measure*, from source-audited local
   PDF/Markdown materials.
2. Supply reusable probability and measure foundations for the ongoing
   empirical-process formalization of van der Vaart and Wellner.

The Billingsley lane should stay search-first: before adding a primitive, search
pinned mathlib under `.lake/packages/mathlib`, then search nearby
`StatInference/EmpiricalProcess` modules for an existing proof-carrying wrapper.

## Automation Prompt Maintenance

The recurring Billingsley/probability-measure automation is an active
orchestration tool, not a static checklist.  At the end of every automation run
that proves, blocks, merges, commits, or pushes a theorem-line or reusable
probability-measure layer, refresh the live automation prompt so the next
heartbeat starts from the verified current frontier.

The prompt update should be driven by:

1. `docs/billingsley1995_current_blocker_primitive_plan.md`;
2. `docs/billingsley1995_progress_dashboard.md`;
3. the current VdV&W blocker plan when the Billingsley lane is supplying
   empirical-process dependencies;
4. the latest pushed commit and verified Lean declarations.

Each refreshed prompt should name one next atomic proof target, the dependency
order after it, the required mathlib/local searches, and the verification/report
gate.  This avoids replaying stale broad instructions after another agent has
already moved the frontier.

## Local Sources

- Markdown chunks:
  - `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_1-121.md`
  - `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_122-242.md`
  - `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_243-363.md`
  - `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_364-484.md`
  - `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_485-608.md`
- PDF anchors:
  - `Textbooks/Billingsley1995/PDF/Billingsley Probabilty and Measure.pdf`
  - matching split PDFs in the same directory.

The filename typo `Probabilty` is part of the local source path and should not
be silently corrected in references.

## Status Vocabulary

- `exact-local`: exact textbook item statement is formalized and proved with no
  `sorry`, `admit`, unreviewed `axiom`, or `unsafe`, and a report may be
  prepared.
- `local-wrapper`: compiled Lean wrapper around mathlib or existing local code,
  useful for Billingsley naming and source crosswalks but not yet an exact
  source-audited textbook theorem report.
- `local-layer`: compiled supporting primitive or lemma that moves toward an
  exact item.
- `mathlib-foundation`: mathlib has the mathematical theorem/API, but no
  Billingsley-exact wrapper/report exists yet.
- `priority-local`: missing local theorem or primitive that directly helps the
  empirical-process route.
- `pending-local`: not started.
- `deferred-example`: example/application temporarily skipped because it would
  require substantial external-domain formalization not needed for the current
  probability/empirical-process route.

## Priority Lanes

### Lane A: Weak convergence and tightness

Billingsley Chapter 5 Section 25 is highest leverage because it overlaps with
empirical-process weak convergence, tightness, continuous mapping, product laws,
finite-dimensional distributions, and Prokhorov-style arguments.

Initial Lean module:

- `StatInference/ProbabilityMeasure/Basic.lean`
- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/Rademacher.lean`

Reuse audit:

- `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- `Mathlib.MeasureTheory.Measure.Portmanteau`
- `Mathlib.MeasureTheory.Measure.Tight`
- `Mathlib.MeasureTheory.Measure.Prokhorov`
- `Mathlib.MeasureTheory.Measure.LevyProkhorovMetric`
- `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`
- local `StatInference/EmpiricalProcess/WeakConvergence.lean`

Current compiled wrappers:

- `StatInference.ProbabilityMeasure.WeakConvergenceProbabilityMeasures`
- `StatInference.ProbabilityMeasure.ProbabilityMeasuresTight`
- bounded-continuous and bounded-Lipschitz integral criteria
- open/closed-set Portmanteau implications, continuity-set convergence,
  closed-set converse, and pi-system convergence criterion
- Levy-Prokhorov criteria
- continuous mapping, product, finite product, and finite-dimensional
  restriction wrappers
- random-variable continuous mapping and Slutsky product wrappers
- process-law equality iff every finite-dimensional distribution is equal
- identical distribution iff every finite-dimensional restriction is
  identically distributed
- projective finite-dimensional distribution family and process-law projective
  limit wrappers
- product probability measure, Tonelli/Fubini, and independent-product
  expectation wrappers, including product-coordinate marginal projection and
  separated product-expectation identities, mean-zero product-copy difference,
  a binary independent self-copy handoff under `P.prod P`, and
  mapped-coordinate marginal/joint-law plus independence handoff, plus
  finite-`Pi` mapped-coordinate law and independence wrappers for finite sample
  coordinates
- first and second Borel-Cantelli wrappers
- generated sigma-field, generator-measurability, pi-system, and
  finite/probability measure extensionality wrappers
- real-valued strong-law, centered strong-law, and finite-family centered
  strong-law wrappers
- layer-cake, tail-integral monotonicity, split-at-radius probability tail,
  extended-nonnegative Markov, and dominated-convergence upper-tail cutoff
  wrappers in
  `StatInference/ProbabilityMeasure/Tail.lean`
- fair Bool and real Rademacher laws, zero mean, sub-Gaussian support,
  deterministic sign-vector support, and finite iid real-valued Rademacher
  signs in `StatInference/ProbabilityMeasure/Rademacher.lean`
- fixed-endpoint empirical-distribution/CDF support wrappers in
  `StatInference/EmpiricalProcess/RealHalfLineGC.lean`, including the
  fixed-endpoint almost-sure, convergence-in-probability/`TendstoInMeasure`,
  and VdV&W outer-probability handoffs

### Lane B: Integration, tails, and uniform integrability

Billingsley Sections 15-16 supply the tail and integration-to-the-limit
language needed for VdV&W Theorem 2.4.3.

Current compiled wrappers:

- layer-cake tail-integral wrappers over
  `Mathlib.MeasureTheory.Integral.Layercake`
- measurable/nonnegative tail-integral support wrappers for empirical-process
  truncation and envelope-tail handoffs
- a split-at-radius probability tail bound for nonnegative integrable random
  variables
- extended-nonnegative Markov tail wrappers over
  `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`
- dominated-convergence upper-tail cutoff wrapper
  `integral_indicator_tail_lt_tendsto_zero_of_integrable`
- VdV&W-facing measurable-integrable envelope-tail convergence handoffs
  `lintegral_envelope_tail_lt_tendsto_zero_of_integrable` and
  `VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable`
  in `StatInference/EmpiricalProcess/Theorem243.lean`
- supplied-cover/a.e.-constant outer-expectation handoff
  `VdVWOuterExpectation_le_of_cover_ae_le_const_ofReal`, now consumed by the
  Theorem 2.4.3 random-sign finite-net outer-expectation projection
- source-crosswalk support for Billingsley Sections 15-16 integration/tail
  language, not an exact Billingsley theorem report

Search anchors:

- mathlib dominated convergence and uniform integrability APIs
- `Mathlib.MeasureTheory.Integral.Layercake`
- `Mathlib.MeasureTheory.Integral.Lebesgue.Markov`
- local `StatInference/EmpiricalProcess/OuterExpectation.lean`
- local `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`
- local `StatInference/EmpiricalProcess/Theorem243.lean`
- local `StatInference/ProbabilityMeasure/Tail.lean`

### Lane C: Product measure, Fubini, and independent copies

Billingsley Section 18 should be formalized only to the finite/product forms
needed for symmetrization and iid samples before attempting broad product-space
coverage.

Near-term declarations:

- `vdVW_lintegral_pi_fin_eq_iterated_nonnegative`
- `vdVW_integral_pi_fin_eq_iterated_integrable`
- `vdVW_expectation_independent_copy_swap`
- content-based wrappers started in
  `StatInference/ProbabilityMeasure/ProductMeasure.lean`, including
  product-coordinate integral projection and separated product-expectation
  wrappers for independent-copy arguments, mean-zero difference wrapper
  `probability_integral_prod_fst_sub_snd_eq_zero`, binary self-copy wrapper
  `probability_prod_independent_self_copies`, mapped-coordinate wrapper
  `probability_prod_independent_mapped_copies_with_joint_law`, finite-`Pi`
  wrapper `probability_pi_map_mapped_coordinates_eq`, finite-`Pi`
  law/independence wrapper
  `probability_pi_independent_mapped_coordinates_with_joint_law`, finite-`Pi`
  weighted-sum expectation/mean-zero wrappers
  `probability_pi_integral_weighted_sum` and
  `probability_pi_integral_weighted_sum_eq_zero`, product-copy weighted-sum
  mean-zero wrapper
  `probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero`, conditional
  ghost-copy Fubini wrapper `probability_pi_integral_weighted_sum_const_sub`,
  and the VdV&W
  specializations `vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep`
  and
  `integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero`,
  plus the fixed-original-sample specialization
  `integral_vdVWTruncatedClassFun_productSample_const_sub_eq`, the fixed-sample
  `Phi(x)=x` ghost-copy comparison
  `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`,
  and the envelope-bounded split
  `vdVWWeightedClassSupremum_truncated_pairDifference_le_add`, plus the
  finite product-coordinate projection wrapper
  `probability_pi_prod_coordinates_measurePreserving`, its VdV&W
  specializations `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
  `measurePreserving_vdVWProductMeasure_prod_to_original`, and
  `measurePreserving_vdVWProductMeasure_prod_to_ghost`, deterministic
  weight sign-flip invariance, and the expectation-level integral lifts for the
  fixed-sample ghost comparison and envelope-bounded pair split, including
  `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`,
  `integral_integral_vdVWWeightedClassSupremum_pairDifference_eq_integral_productSample`,
  `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifference`,
  and
  `integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original`,
  plus the theorem-local Rademacher negated-sign bridge and the
  integrated product-pair sign-symmetry/random-sign averaging comparison,
  reusable supplied-cover integral equality
  `VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg`,
  a.e./null-measurable cover constructors
  `VdVWMeasurableCover.ofAEMeasurable` and
  `VdVWMeasurableCover.ofNullMeasurable_ofReal`,
  product-integrated measurable-cover outer-expectation bridge, and
  supplied product-space a.e. finite-net projection, sample-cover and
  sample-dependent-cardinality product-a.e. finite-net bridges, and
  empirical-cover cardinality witness handoffs, plus the
  supplied-`hphi_id` finite-net projection
  `VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`.

Search anchors:

- `Mathlib.MeasureTheory.Measure.Prod`
- `Mathlib.MeasureTheory.Constructions.Pi`
- `Mathlib.Probability.ProductMeasure`
- local `StatInference/EmpiricalProcess/Theorem243.lean`

Source-crosswalk note: Billingsley Section 18 supplies product measure and
Fubini/Tonelli machinery.  Independence-as-product-law and product-expectation
formulas are sourced later in Sections 20-21, so Section 18 wrappers should not
be reported as exact independence theorems without those anchors.

### Lane D: Independence, Borel-Cantelli, and strong laws

Billingsley Sections 4, 6, 20, and 22 support endpoint strong laws,
empirical-distribution convergence, Rademacher variables, and maximal
inequalities.

Near-term declarations:

- Borel-Cantelli wrappers: started in
  `StatInference/ProbabilityMeasure/BorelCantelli.lean`.
- Strong-law wrappers around `strong_law_ae_real`: started in
  `StatInference/ProbabilityMeasure/StrongLaw.lean`.
- Fixed-endpoint empirical-distribution wrappers: started in
  `StatInference/EmpiricalProcess/RealHalfLineGC.lean`; the
  convergence-in-probability/`TendstoInMeasure` and outer-probability wrappers
  are fixed-endpoint corollaries of the pointwise support layer, not a
  Theorem 20.6 report.
- Rademacher PMF/has-law/iid construction primitives for Theorem 2.4.3.
  Reusable Billingsley/probability-measure versions now live in
  `StatInference/ProbabilityMeasure/Rademacher.lean`; future VdV&W work should
  import or bridge to this module when doing so does not create unnecessary
  churn.
- Borel-Cantelli wrappers only when needed for an exact theorem route.

Search anchors:

- `Mathlib.Probability.StrongLaw`
- `Mathlib.Probability.BorelCantelli`
- `Mathlib.MeasureTheory.OuterMeasure.BorelCantelli`
- `Mathlib.Probability.Independence.Basic`
- `Mathlib.Probability.Independence.Integration`
- `Mathlib.Probability.HasLawExists`
- `Mathlib.Probability.IdentDistrib`
- `Mathlib.Probability.Moments.SubGaussian`
- `Mathlib.Probability.ProbabilityMassFunction.Integrals`
- local `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`

### Lane E: Measurable maps, generated sigma-fields, and pi-lambda tools

Billingsley Sections 3, 10-14, and 20 provide the sigma-field and measurable
mapping language needed across the project.

Near-term wrappers:

- Generated-sigma utility wrappers around `MeasurableSpace.generateFrom`,
  `measurable_generateFrom`, `generateFrom_le`, finite-measure uniqueness on
  pi-systems, and probability-measure extensionality.
- Pi-system/Dynkin helpers over `Mathlib.MeasureTheory.PiSystem` only when
  needed for measure uniqueness or source-crosswalk proof friction.
- Generated Borel sigma-field wrappers for half-lines and metric balls.
- Treat this as support infrastructure until an exact Billingsley statement is
  selected, source-anchored, proved, and reported.

Search anchors:

- `Mathlib.MeasureTheory.MeasurableSpace.Defs`
- `Mathlib.MeasureTheory.PiSystem`
- `Mathlib.MeasureTheory.Constructions.BorelSpace.Basic`
- `Mathlib.MeasureTheory.Constructions.BorelSpace.Order`
- local `StatInference/EmpiricalProcess/BallSigma.lean`
- local `StatInference/EmpiricalProcess/RealHalfLine.lean`

### Lane F: Process laws, cylinders, and separability

Billingsley Sections 36-38 are useful for empirical-process indexed classes,
but they should follow finite-dimensional/product-law wrappers rather than
starting with broad stochastic-process foundations.

Near-term wrappers:

- cylinder finite-dimensional law equality: started in
  `StatInference/ProbabilityMeasure/FiniteDimensional.lean`.
- finite-coordinate restriction and product-process vocabulary.
- separability interfaces only after a concrete empirical-process theorem needs
  them.

Search anchors:

- `Mathlib.Probability.Process.FiniteDimensionalLaws`
- `Mathlib.Probability.ProductMeasure`
- local `StatInference/EmpiricalProcess/WeakConvergence.lean`
- local `StatInference/EmpiricalProcess/BallSigma.lean`

## Deferred Examples

Defer applications unless a theorem route explicitly needs them:

- normal-number and Diophantine approximation examples,
- gambling-system examples,
- finite Markov-chain worked examples,
- Poisson process path examples,
- Brownian irregularity/reflection/Skorohod embedding,
- Fourier-series and number-theory applications,
- characteristic-function sections beyond what is needed for a nearby theorem.

These remain in scope for the long-run Billingsley project, but they should not
block the empirical-process foundation route.

## Current Main Blocker

The first Billingsley-specific blocker is not a missing theorem in mathlib; it
is project organization and source alignment.  The immediate route is:

1. Keep `StatInference/ProbabilityMeasure/WeakConvergence.lean` compiling.
2. Add Section 25 source anchors and exact theorem candidates in the inventory.
3. Select one exact Billingsley theorem whose statement can be made source-exact
   with existing mathlib/local APIs, likely a Section 25 weak-convergence
   implication or continuous-mapping wrapper.
4. Only after the exact statement compiles, create a formal report with PDF
   screenshots.

For direct empirical-process impact, the dependency override is now active:
the next proof lane should prioritize consuming the VdV&W Theorem 2.4.3 random
empirical-cover witness handoff in the product random-sign assembly, proving the
product-a.e. finite-center Hoeffding predicate for the chosen covers, and then
entropy-to-convergence, after the compiled integrated
product-sample/Rademacher sign-symmetry comparison, product-space
measurable-cover outer-expectation bridge, and supplied product-space finite-net
projection, now past the fixed-sample, integral-lift, product-projection/Fubini,
same-weight pair split, deterministic sign-negation, ordinary random-sign
averaging, product-cover, sample-cover, sample-dependent-cardinality cover, and
empirical-cover witness pieces,
before new Billingsley Section 25 work unless no empirical-process
probability/measure dependency is blocked.
