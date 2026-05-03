# Billingsley 1995 Current Blocker And Primitive Plan

This file is the active blocker register for the Billingsley lane.  It should be
checked at the start of each automation run before selecting a proof target.

## Adaptive Automation Prompt Rule

The recurring Billingsley/probability-measure heartbeat is part of the proof
state.  Every automation run should finish by checking whether its live prompt
is stale relative to this file, the dashboard, and the latest verified commit.
If the run proves a Lean declaration, narrows a blocker, merges another
agent's work, changes the next atomic target, or records a material mathlib or
local-code search result, update the automation prompt before ending the run.

The refreshed prompt should name:

- the latest pushed commit and the exact new declarations or blocker
  refinement;
- a primary theorem/proof target plus the highest-value parallel support
  targets, with dependency order after them;
- the search-first scope: pinned mathlib, local `StatInference`, and existing
  `StatInference/ProbabilityMeasure` wrappers;
- the verification gate: focused `lake env lean`, targeted `lake build` for
  promoted theorem layers, proof-hole scan, and secret scan;
- the report gate: no Billingsley report without an exact source-matched
  theorem/lemma, screenshots, and local report compilation.

Do not update the prompt for wording-only churn.  Do update it whenever the old
prompt would send the next heartbeat toward a solved target, omit a newly
proved dependency, or hide the current blocker.

## Throughput Policy

The Billingsley heartbeat should be aggressive proof work, not a one-wrapper
drip feed.  Each run should try to close a primary theorem/proof target and, in
parallel, prepare adjacent support that can be checked independently: mathlib
API discovery, local dependency reuse, source anchors, verification/report
policy, and one bounded Lean/doc worker when safe.  A small primitive is
acceptable only when it is the fastest verified dependency for the active proof
route or when the exact theorem target is blocked and the blocker is recorded
precisely.

## Current Blocker

The Billingsley lane now has source materials and compiled content-based Lean
modules under `StatInference/ProbabilityMeasure/`, but it does not yet have an
exact source-audited Billingsley theorem report.
The blocker is selecting a theorem whose statement can be made both:

- faithful to the textbook source; and
- immediately useful to the empirical-process route.

The best current candidate family is Section 25 weak convergence and
Portmanteau/tightness wrappers, while Section 16/18 support should stay
dependency-driven by the current VdV&W Theorem 2.4.3 route.  As of the latest
merged empirical-process progress, the log-radius-to-Hoeffding scale comparison
is proved, finite-`Pi` mapped-coordinate product laws are available, and the
measurable-integrable envelope-tail convergence handoff is compiled locally in
the empirical-process file.  The active VdV&W blocker is now the
boundedness/uniform-integrability input needed to turn the entropy-driven
finite-net Hoeffding outer-probability convergence into the integrated
Hoeffding-plus-radius mean convergence consumed by the fixed-`M`
centered-truncated convergence handoff, then final assembly.  Nonmeasurable or
arbitrary-cover envelope-tail variants remain out of scope unless the theorem
assembly forces them.  Billingsley support should only add reusable
probability/measure wrappers if those steps need tail, product/Fubini,
independent-copy, uniform-integrability, dominated-convergence, or
outer-expectation infrastructure.

## Search-First Record

Pinned mathlib searches found reusable APIs in:

- `MeasureTheory.Measure.ProbabilityMeasure`
- `MeasureTheory.Measure.Portmanteau`
- `MeasureTheory.Measure.Tight`
- `MeasureTheory.Measure.Prokhorov`
- `MeasureTheory.Measure.LevyProkhorovMetric`
- `MeasureTheory.Function.ConvergenceInMeasure`
- `MeasureTheory.Function.ConvergenceInDistribution`
- `MeasureTheory.Integral.Layercake`
- `MeasureTheory.Integral.Lebesgue.Markov`
- `MeasureTheory.Integral.DominatedConvergence`
- `MeasureTheory.Function.UniformIntegrable`
- `MeasureTheory.PiSystem`
- `MeasureTheory.Measure.Typeclasses.Finite`
- `MeasureTheory.MeasurableSpace.Pi`
- `MeasureTheory.Measure.Prod`
- `MeasureTheory.Constructions.Pi`
- `Probability.ProductMeasure`
- `Probability.HasLaw`
- `Probability.iIndepFun_pi`
- `MeasureTheory.measurePreserving_eval`
- `MeasureTheory.Measure.pi_map_eval`
- `MeasureTheory.Measure.pi_map_pi`
- `Probability.Process.FiniteDimensionalLaws`
- `Probability.StrongLaw`
- `Probability.BorelCantelli`
- `Probability.Independence.Basic`
- `Probability.Independence.Integration`
- `Probability.HasLawExists`
- `Probability.IdentDistrib`
- `Probability.Moments.SubGaussian`
- `Probability.ProbabilityMassFunction.Integrals`

Local searches found reusable APIs in:

- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/OuterExpectation.lean`
- `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`
- `StatInference/EmpiricalProcess/Theorem243.lean`
- `StatInference/EmpiricalProcess/BallSigma.lean`
- `StatInference/EmpiricalProcess/RealHalfLine.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/Rademacher.lean`

## Primitive Sequence

1. Keep the Section 25 Billingsley weak-convergence wrappers compiling,
   including the bounded-continuous criterion, open/closed Portmanteau
   directions, continuity-set convergence, closed-set converse, and pi-system
   convergence criterion.
2. Keep the finite-dimensional process-law, product/Fubini, and
   Borel-Cantelli/generated-sigma/strong-law wrappers compiling.
3. Add a precise Section 25 theorem candidate to the inventory:
   bounded-continuous test functions, open/closed Portmanteau directions,
   continuous mapping, or tightness/Prokhorov.
4. If an exact Section 25 theorem requires only packaging existing APIs, create
   the exact theorem declaration first, then the report.
5. In parallel, push Section 16/18 support for VdV&W Theorem 2.4.3:
   envelope-tail, truncation-error, layer-cake/tail-integral,
   finite-product/Fubini, iid Rademacher signs, and independent-copy wrappers.
   The content-based
   Section 16 wrapper layer has started in
   `StatInference/ProbabilityMeasure/Tail.lean`; it packages mathlib
   layer-cake, tail-integral monotonicity, split-at-radius, Markov, and
   dominated-convergence upper-tail cutoff APIs for
   downstream empirical-process use. `StatInference/EmpiricalProcess/Theorem243.lean`
   now consumes these generic wrappers for its finite-center expected-supremum
   tail layer and proves the VdV&W-specific measurable-integrable lintegral and
   outer-expectation envelope-tail convergence handoffs
   `lintegral_envelope_tail_lt_tendsto_zero_of_integrable` and
   `VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable`.
   The same outer-expectation support lane now also has the generic
   probability-measure handoff
   `VdVWOuterExpectation_le_of_cover_ae_le_const_ofReal`, which turns a
   supplied measurable cover plus an a.e. real constant bound into an
   `ENNReal.ofReal` outer-expectation bound.
   The cover API also now has `VdVWMeasurableCover.ofAEMeasurable` and
   `VdVWMeasurableCover.ofNullMeasurable_ofReal`, so future random targets that
   are only a.e.-measurable or null-measurable can still supply the required
   VdV&W measurable cover.
   This is support infrastructure, not a source-exact Billingsley Sections
   15-16 report. The
   content-based Section 18
   wrapper layer has started in
   `StatInference/ProbabilityMeasure/ProductMeasure.lean`; it now includes
   product-coordinate marginal projection and separated product-expectation
   identities for binary product probability spaces, plus
   `probability_integral_prod_fst_sub_snd_eq_zero`, which packages the
   mean-zero difference of two coordinate copies of an integrable function,
   `probability_prod_independent_self_copies`, which packages the two product
   coordinates as independent copies with common law `P`, and
   `probability_prod_independent_mapped_copies_with_joint_law`, which packages
   measurable mapped-coordinate marginal laws, joint product law, and
   independence.  It also now includes finite-`Pi` mapped-coordinate wrappers
   `probability_pi_map_mapped_coordinates_eq`,
   `probability_pi_independent_mapped_coordinates_with_joint_law`,
   `probability_pi_integral_weighted_sum`, and
   `probability_pi_integral_weighted_sum_eq_zero`, plus the product-copy
   weighted-sum mean-zero wrapper
   `probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero` and the
   conditional ghost-copy Fubini identity
   `probability_pi_integral_weighted_sum_const_sub`; the VdV&W side specializes
   these as
   `vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep`.
   It also specializes the finite weighted-sum expectation bridge as
   `integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero`,
   and the fixed-original-sample conditional identity as
   `integral_vdVWTruncatedClassFun_productSample_const_sub_eq`.
   The VdV&W side now packages these product-copy, finite-`Pi`, mean-zero,
   random-sign, and finite-cover expected-maximal components as
   `VdVWTheorem243SymmetrizationPrecursor` with constructor
   `VdVWTheorem243SymmetrizationPrecursor.of_finiteEmpiricalCover`.  The
   precursor now also exposes the theorem-local projections
   `VdVWTheorem243SymmetrizationPrecursor.randomSign_expectedMaximal_le` and
   `VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add`.
   A deterministic supremum split
   `vdVWWeightedClassSupremum_pairDifference_le_add` and the bounded-value-set
   class-member bridge
   `abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove`, with
   boundedness supplied by
   `bddAbove_vdVWWeightedClassValueSet_of_uniform_bound`, are also compiled.
   The fixed-original-sample `Phi(x)=x` ghost-copy comparison is now compiled
   as
   `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`,
   and the envelope-bounded pair split is packaged as
   `vdVWWeightedClassSupremum_truncated_pairDifference_le_add`.  The finite
   product-coordinate projection wrapper
   `probability_pi_prod_coordinates_measurePreserving`, VdV&W specializations
   `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
   `measurePreserving_vdVWProductMeasure_prod_to_original`, and
   `measurePreserving_vdVWProductMeasure_prod_to_ghost` are now compiled, along
   with the expectation-level monotonicity lifts
   `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`
   and the Fubini/projection identity
   `integral_integral_vdVWWeightedClassSupremum_pairDifference_eq_integral_productSample`,
   yielding
   `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifference`,
   and
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd`,
   plus the same-weight variant
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd_same_weights`
   using `vdVWWeightedSampleSum_neg_weights` and
   `vdVWWeightedClassSupremum_neg_weights`, and the projected
   expectation-level consequence
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`.
   Their direct composition is also compiled as
   `integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original`.
   The random-sign side also now has
   `vdVWWeightedClassSupremum_rademacherWeights_neg_sign`, the
   coordinatewise product-pair sign-swap
   `measurePreserving_vdVWProductMeasure_rademacherProductSampleSignSwap`,
   deterministic pair-difference sign-swap identities, the integrated
   sign-symmetry identity
   `integral_vdVWWeightedClassSupremum_pairDifference_constWeights_eq_rademacherWeights`,
   and the averaged random-sign comparison
   `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
   The reusable outer-expectation equality
   `VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg`
   turns an integrable nonnegative real target with a supplied measurable cover
   into its ordinary `ofReal` expectation.
   The product-integrated measurable-cover bridge
   `VdVWOuterExpectation_prod_hphi_id_of_integral_integral_le` and its VdV&W
   specialization
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_outerExpectation_prod_randomSign_truncated_original`
   are also compiled, as is the supplied product-space finite-net projection
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_finiteNetHoeffdingUpper_add_of_product_randomSign_ae`.
   The sample-cover product-a.e. finite-net bridges
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
   and
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`
   are also compiled for supplied sample-indexed empirical covers, including
   the sample-dependent cardinality shape needed by random empirical entropy,
   and a product-a.e. finite-center Hoeffding predicate.
   The empirical-cover cardinality side now has
   `FiniteEmpiricalL1CoverAtCard.pad_cardinality`,
   `exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le`, and
   `finiteEmpiricalL1CoverAtCard_of_randomEmpiricalL1CoveringNumber_le_cardinality`,
   which turn finite upper bounds on empirical covering numbers into concrete
   finite-cover witnesses at the supplied cardinality.
   The remaining
   hphi-to-Hoeffding projection after a supplied `Phi(x)=x` comparison is
   packaged as
   `VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`.
   Search refined the target: a pointwise fixed-sample `hphi_id` comparison and
   product-a.e. finite-center Hoeffding predicate are too strong; the valid
   cover transfer is product-integrated over signs and samples.  The random
   empirical-cover witness is now consumed by the expectation-level finite-net
   handoff
   `integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
   The product outer-expectation projection for that route is compiled as
   `VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
   The entropy/Hoeffding-scale algebra now also has
   `vdVWTheorem243FiniteNetHoeffdingUpper_nonneg`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_sq`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_eq_logCardinality`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_sq_eq_logCardinality`,
   `tendsto_sqrt_one_add_mul_sqrt_six_div_of_div_tendsto_zero`,
   `tendsto_finiteNetHoeffdingUpper_of_logCardinality_div_tendsto_zero`, and
   `VdVWTheorem243TruncatedEntropyCondition.fixed_of_forAllEpsilonM`.
   The stochastic entropy-to-Hoeffding-scale handoff is now also compiled as
   `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbability_zero_of_logCardinality_littleO_n`,
   with shifted-display and fixed/all-entropy consumers
   `vdVWTheorem243FiniteNetHoeffdingUpper_add_convergesInOuterProbability_epsilon_of_logCardinality_littleO_n`,
   `VdVWTheorem243TruncatedEntropyCondition.finiteNetHoeffdingUpper_convergesInOuterProbability_zero`,
   and
   `VdVWTheorem243TruncatedEntropyConditionForAllEpsilonM.finiteNetHoeffdingUpper_convergesInOuterProbability_zero`.
   The variable-domain Markov bridges and fixed-`M` centered-truncated
   convergence handoff is now compiled under an explicit vanishing integrated
   Hoeffding-plus-radius `ℝ≥0∞` hypothesis, and
   `tendsto_two_mul_ofReal_zero_of_tendsto_zero` plus
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_real_tendsto_zero`
   repackage the consumer under an ordinary real mean convergence hypothesis.
   The next target is proving that real integrated upper, not another
   fixed-sample pointwise comparison or product-a.e. Hoeffding predicate.
   The reusable Rademacher-sign layer has started in
   `StatInference/ProbabilityMeasure/Rademacher.lean`; it packages the fair
   Bool law, real sign map, real Rademacher law, zero mean, sub-Gaussian
   one-dimensional law, deterministic sign vectors, and finite iid sign
   existence.
6. Defer examples requiring unrelated number theory, Markov chains, martingales,
   Brownian path theory, or Fourier analysis unless a concrete theorem needs
   them.

## Next Exact Lean Edit

The next high-value proof step is the theorem-specific Section 18/entropy
assembly for VdV&W Theorem 2.4.3:

- prove the real integrated Hoeffding-plus-radius upper tends to zero, using
  the new bounded/UI-style bridges
  `probability_integral_le_threshold_add_bound_mul_tail`,
  `tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`,
  and
  `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`,
  pure finite-net mean consumer
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`,
  plus the variable-domain entropy-to-Hoeffding bridge
  `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`
  and bounded entropy-to-integrated-mean consumer
  `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`,
  with pure finite-net mean form
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`,
  and measurable-cardinality finite-net mean form
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`,
  the compiled fixed-`M` centered-truncated convergence consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_real_tendsto_zero`
  and the generic real-to-`ENNReal.ofReal` handoff
  `tendsto_two_mul_ofReal_zero_of_tendsto_zero`;
- if that assembly exposes only a.e.-measurable or null-measurable random
  targets, use `VdVWMeasurableCover.ofAEMeasurable` or
  `VdVWMeasurableCover.ofNullMeasurable_ofReal` rather than adding another
  supplied-cover wrapper;
- if no empirical-process dependency is blocked on Billingsley support, move to
  the Billingsley Section 25 exact theorem candidate wrapping an already proved
  mathlib/local weak-convergence implication, with Theorem 25.8
  bounded-continuous and continuity-set directions as the current best
  source-audited candidate.

The closed Section 18 independent-copy/symmetrization surface includes the
  compiled `VdVWTheorem243SymmetrizationPrecursor` package: the finite
  product-sample weighted-sum mean-zero bridge over `(P.prod P)^n` is now
  compiled, and the fixed-original-sample `Phi(x)=x` ghost-copy comparison is
  now available as
  `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`.
  The finite product-coordinate projection wrapper
  `probability_pi_prod_coordinates_measurePreserving` and VdV&W specializations
  `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
  `measurePreserving_vdVWProductMeasure_prod_to_original`, and
  `measurePreserving_vdVWProductMeasure_prod_to_ghost` are now compiled, as are
  the expectation-level integral lifts for the centered ghost-copy comparison,
  the envelope-bounded pair split, and the same-weight second-coordinate
  rewrite, plus the two-to-one original-sample expectation projection
  `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`.
  The supplied-`hphi_id` projection to the Hoeffding finite-net bound is also
  compiled, and the ordinary integrated product/Rademacher sign-symmetry layer
  is compiled through
  `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
  The reusable cover-integral bridge
  `VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg` is
  available for future ordinary-integral-to-outer-expectation transfers.
  The product-integrated cover transfer is compiled as
  `VdVWOuterExpectation_prod_hphi_id_of_integral_integral_le` and
  `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_outerExpectation_prod_randomSign_truncated_original`.
  The supplied product-space a.e. finite-net projection
  `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_finiteNetHoeffdingUpper_add_of_product_randomSign_ae`
  is also compiled, along with the sample-cover product-a.e. finite-net bridges
  `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
  and
  `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`.
  Do not target the false fixed-sample pointwise comparison. Only add a new
  `StatInference/ProbabilityMeasure`
  product wrapper if this assembly exposes a genuinely reusable gap beyond the
  existing
  `probability_integral_prod_fst`, `probability_integral_prod_snd`,
  `probability_integral_prod_mul`,
  `probability_integral_prod_fst_sub_snd_eq_zero`,
  `probability_prod_independent_self_copies`,
  `probability_prod_independent_mapped_copies_with_joint_law`,
  `probability_pi_map_mapped_coordinates_eq`,
  `probability_pi_independent_mapped_coordinates_with_joint_law`,
  `probability_pi_integral_weighted_sum`,
  `probability_pi_integral_weighted_sum_eq_zero`, and
  `probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero`, and
  `probability_pi_integral_weighted_sum_const_sub` APIs.

The deciding rule is dependency value: if Theorem 2.4.3 is blocked on a tail,
Fubini, independent-copy, or outer-expectation primitive, prefer that over a
cosmetic Billingsley report.  Otherwise, select a narrow Section 25 theorem
candidate whose proof is already mostly present in mathlib/local wrappers and
move it toward an exact source-audited Billingsley statement.

Finite-sample product note: local/mathlib search showed that the reusable
product primitive did not need to stay binary.  Since
`SampleAt Observation n` is `Fin n -> Observation` and
`vdVWProductMeasure P n` is `Measure.pi fun _ : Fin n => P`, the compiled
content-based Section 18/20 support layer now includes finite-`Pi`
mapped-coordinate wrappers using `ProbabilityTheory.iIndepFun_pi`,
`iIndepFun.hasLaw_pi`, `MeasureTheory.measurePreserving_eval`, and
`Measure.pi_map_pi`, plus finite weighted-sum expectation and mean-zero
wrappers using `MeasureTheory.integrable_comp_eval`,
`MeasureTheory.integral_comp_eval`, `MeasureTheory.integral_finsetSum`, and
`MeasureTheory.integral_const_mul`.  These are now consumed by the VdV&W
`VdVWTheorem243SymmetrizationPrecursor` package, by the theorem-local
pair-difference weighted-sum mean-zero specialization, and by the conditional
ghost-copy identity with a fixed original sample.  The VdV&W file now also
proves the fixed-sample centered supremum-to-ghost-pair expectation handoff
`vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`
and the envelope-bounded split
`vdVWWeightedClassSupremum_truncated_pairDifference_le_add`, plus the
finite product-coordinate projection wrapper
`probability_pi_prod_coordinates_measurePreserving`, the VdV&W projection
specializations `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
`measurePreserving_vdVWProductMeasure_prod_to_original`, and
`measurePreserving_vdVWProductMeasure_prod_to_ghost`,
and the expectation-level integral lifts
`integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`
and the Fubini/product-projection identity
`integral_integral_vdVWWeightedClassSupremum_pairDifference_eq_integral_productSample`,
giving
`integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifference`,
and
`integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd`,
plus the same-weight variant
`integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd_same_weights`.
It also proves the projected pair-difference expectation bound
`integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`
and their composed centered-to-two-truncated-expectation handoff
`integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original`
and the Rademacher-weight sign-negation bridge
`vdVWWeightedClassSupremum_rademacherWeights_neg_sign`. It also proves the
coordinatewise product-pair sign-swap measure-preserving wrapper, deterministic
pair-difference sign-swap identities, the integrated product-pair sign-symmetry
identity
`integral_vdVWWeightedClassSupremum_pairDifference_constWeights_eq_rademacherWeights`,
and the random-sign integrated averaging comparison
`integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
It also proves the reusable bridge
`VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg`, which
handles ordinary real integral equalities for integrable nonnegative targets
with supplied VdV&W measurable covers.
It also proves `VdVWMeasurableCover.ofAEMeasurable` and
`VdVWMeasurableCover.ofNullMeasurable_ofReal` for a.e.-measurable and
null-measurable random targets.
It also proves the product-integrated measurable-cover bridge
`VdVWOuterExpectation_prod_hphi_id_of_integral_integral_le` and the specialized
outer-expectation handoff
`integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_outerExpectation_prod_randomSign_truncated_original`.
It also proves the supplied product-space finite-net projection
`integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_finiteNetHoeffdingUpper_add_of_product_randomSign_ae`.
It also proves the sample-cover product-a.e. finite-net bridges
`ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
and
`ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`.
It also proves the empirical-cover cardinality witness handoffs
`FiniteEmpiricalL1CoverAtCard.pad_cardinality`,
`exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le`, and
`finiteEmpiricalL1CoverAtCard_of_randomEmpiricalL1CoveringNumber_le_cardinality`.
It also proves
`ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_rademacherSigns`,
which consumes the random empirical-cover witness in the product random-sign
finite-net handoff.
It also proves the selected-cover projections
`vdVWRandomEmpiricalL1CoverAtCard_center_mem` and
`vdVWRandomEmpiricalL1CoverAtCard_cardinality_pos`, the expected-maximal
selected-cover handoff
`vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_randomEmpiricalL1CoverAtCard_of_pos`,
and the product-integrated random-cover finite-net bound
`integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
It also proves the product outer-expectation projection
`VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
The composed product-integrated centered-truncated finite-net bridge is also
compiled as
`integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
It also proves the
supplied-`hphi_id` finite-net projection
`VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`.
The entropy-to-Hoeffding-scale outer-probability handoff is now compiled for
the product-integrated expected-maximal route, including fixed/all-entropy
consumers.  The variable-domain Markov bridges and fixed-`M`
centered-truncated convergence handoff are also compiled.  The bounded
outer-probability-to-mean bridge and finite-net mean consumer are now compiled
as
`tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`
and
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`.
The pure finite-net mean form
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`
is also compiled.
The variable-domain entropy-to-Hoeffding bridge
`vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`
and bounded entropy-to-integrated-mean consumer
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
with pure finite-net mean form
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
and measurable-cardinality finite-net mean form
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`
and radius-added measurable-cardinality integrated-mean consumer
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`
are now compiled as well. The finite-net upper measurability/integrability
packaging lemmas from measurable cardinality and a deterministic bound are also
compiled. The next proof target is supplying measurable cardinality plus
variable-domain boundedness/UI input from the entropy hypotheses and selecting
a shrinking deterministic cover radius, not a fixed-sample pointwise comparison
or product-a.e. finite-center Hoeffding predicate. Do not add another product
surface unless that assembly exposes a sharper missing API.
