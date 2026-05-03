# Billingsley 1995 Progress Dashboard

This dashboard tracks the Billingsley support lane for `StatInference/`.  It is
separate from the VdV&W Chapter 1-2 dashboard, but the two lanes should share
mathlib searches and local primitives whenever possible.

## Snapshot

- Source assets: local PDF and five Markdown chunks available under
  `Textbooks/Billingsley1995/`.
- Lean namespace started: `StatInference.ProbabilityMeasure`.
- Lean code location: content-based folder `StatInference/ProbabilityMeasure/`
  rather than an author-named folder.
- First modules: `StatInference/ProbabilityMeasure/WeakConvergence.lean`,
  `StatInference/ProbabilityMeasure/FiniteDimensional.lean`,
  `StatInference/ProbabilityMeasure/ProductMeasure.lean`,
  `StatInference/ProbabilityMeasure/GeneratedSigma.lean`, and
  `StatInference/ProbabilityMeasure/BorelCantelli.lean`,
  `StatInference/ProbabilityMeasure/StrongLaw.lean`,
  `StatInference/ProbabilityMeasure/Tail.lean`, and
  `StatInference/ProbabilityMeasure/Rademacher.lean`, re-exported by
  `StatInference/ProbabilityMeasure/Basic.lean`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Billingsley report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
- Automation policy: each heartbeat that changes the verified proof frontier
  must refresh the live automation prompt from the blocker plan and dashboard
  before ending the run.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Section 25 weak convergence and tightness | local-wrapper | `StatInference/ProbabilityMeasure/WeakConvergence.lean` | Reuses mathlib and local VdV&W wrappers for probability-measure weak convergence, tightness, Portmanteau, continuity-set convergence, closed-set converse, pi-system convergence, Levy-Prokhorov, continuous mapping, products, FDD restriction, and Slutsky. |
| Sections 15-16 integration/tails/UI | local-wrapper | `StatInference/ProbabilityMeasure/Tail.lean`; `StatInference/EmpiricalProcess/OuterExpectation.lean`; `StatInference/EmpiricalProcess/Theorem243.lean` | Mathlib-backed layer-cake, tail-integral monotonicity, split-at-radius, Markov, and dominated-convergence upper-tail cutoff wrappers are available for VdV&W Theorem 2.4.3 envelope-tail and truncation handoffs. The measurable-integrable VdV&W lintegral and outer-expectation tail convergence handoffs are now compiled in `Theorem243.lean`. These are content-based support wrappers, not exact Billingsley Sections 15-16 theorem reports. |
| Section 18 product/Fubini | local-wrapper | `StatInference/ProbabilityMeasure/ProductMeasure.lean` | Product probability measures, Tonelli/Fubini, finite independent-product expectation wrappers, product-coordinate marginal projection, separated product-expectation wrappers, mean-zero product-copy difference, binary independent self-copy/product-law handoff, mapped-coordinate marginal/joint-law plus independence handoff, finite-`Pi` mapped-coordinate laws/independence, finite-`Pi` weighted-sum expectation/mean-zero wrappers, product-copy weighted-sum mean-zero, and conditional ghost-copy finite-`Pi` Fubini wrappers are available. These are content-based local wrappers over mathlib/local APIs for empirical-process independent-copy work, not exact Billingsley Section 18 theorem reports. |
| Sections 4/6/20/22 independence, Borel-Cantelli, strong laws, empirical distribution | local-wrapper/mathlib-foundation | `StatInference/ProbabilityMeasure/BorelCantelli.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/ProbabilityMeasure/Rademacher.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Mathlib-backed first/second Borel-Cantelli, strong-law, and finite iid Rademacher-sign wrappers are available for tail-event, endpoint empirical-average, and symmetrization arguments. `RealHalfLineGC.lean` also contains local pointwise empirical-CDF support wrappers for fixed half-line endpoints, including fixed-endpoint convergence-in-probability/`TendstoInMeasure` and outer-probability handoffs. These are content-based support wrappers, not exact Billingsley theorem reports; Theorem 6.1 and the uniform empirical distribution function statement of Theorem 20.6 remain pending until source-matched statements are selected, proved, and reported. |
| Sections 3/10-14 sigma-fields and measurable maps | local-layer/mathlib-foundation | `StatInference/ProbabilityMeasure/GeneratedSigma.lean`; `BallSigma.lean`, `RealHalfLine.lean` nearby | GeneratedSigma wrappers now pin Billingsley generated-sigma-field anchors over mathlib's generated measurable-space API; pi-lambda, uniqueness/extension, measurable-map, and pushforward machinery remain mathlib-backed support wrappers, with no exact Billingsley theorem report yet. |
| Sections 36-38 process laws/cylinders/separability | local-wrapper | `StatInference/ProbabilityMeasure/FiniteDimensional.lean` | Started finite-dimensional law wrappers over mathlib; defer broad path-space theory until needed. |
| Examples/applications | deferred-example | none | Defer domain-heavy applications unless a nearby theorem route requires them. |

## Initial Reuse Audit

High-value mathlib files already searched:

- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Portmanteau.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Tight.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Prokhorov.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/PiSystem.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/Layercake.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Typeclasses/Finite.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/MeasurableSpace/Pi.lean`
- `.lake/packages/mathlib/Mathlib/Probability/StrongLaw.lean`
- `.lake/packages/mathlib/Mathlib/Probability/BorelCantelli.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLawExists.lean`
- `.lake/packages/mathlib/Mathlib/Probability/IdentDistrib.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Moments/SubGaussian.lean`
- `.lake/packages/mathlib/Mathlib/Probability/ProbabilityMassFunction/Integrals.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Process/FiniteDimensionalLaws.lean`

High-value local files:

- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/OuterExpectation.lean`
- `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`
- `StatInference/EmpiricalProcess/Theorem243.lean`
- `StatInference/EmpiricalProcess/BallSigma.lean`
- `StatInference/EmpiricalProcess/RealHalfLine.lean`

## Current Active Target

Near-term target: use Billingsley Section 16 and Section 18 as a probability
support lane for VdV&W Theorem 2.4.3 when a reusable measure/probability
primitive is actually needed; otherwise move Section 25
weak-convergence/Portmanteau/tightness theorem slices toward exact
source-audited Billingsley theorem candidates.  Each run should pursue a
primary proof target and parallel adjacent support, not only a single cosmetic
wrapper.

Concrete next edits:

1. Keep the probability-measure integration-tail wrapper module
   `StatInference/ProbabilityMeasure/Tail.lean` compiling, including
   `integral_indicator_tail_lt_tendsto_zero_of_integrable`, and consume the
   compiled VdV&W-specific handoffs
   `lintegral_envelope_tail_lt_tendsto_zero_of_integrable` and
   `VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable`
   in the Theorem 2.4.3 assembly. Add further tail primitives only for
   nonmeasurable/arbitrary-cover variants forced by the exact theorem route.
2. Keep the new `StatInference/ProbabilityMeasure/Rademacher.lean` and
   Section 25 Portmanteau wrappers compiling under
   `StatInference/ProbabilityMeasure/Basic.lean`; use them as the reusable
   surface for iid signs, continuity-set convergence, closed-set converse, and
   pi-system convergence.
3. Keep the Section 18 independent-copy surface compiling, especially
   `probability_prod_independent_self_copies` and
   `probability_prod_independent_mapped_copies_with_joint_law`, plus the
   finite-`Pi` wrappers `probability_pi_map_mapped_coordinates_eq`,
   `probability_pi_independent_mapped_coordinates_with_joint_law`,
   `probability_pi_integral_weighted_sum`, and
   `probability_pi_integral_weighted_sum_eq_zero`, plus
   `probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero` and
   `probability_pi_integral_weighted_sum_const_sub`.  The VdV&W side now
   consumes these through `VdVWTheorem243SymmetrizationPrecursor` and
   `integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero`,
   plus the fixed-original-sample conditional identity
   `integral_vdVWTruncatedClassFun_productSample_const_sub_eq`;
   the random-sign side now also has the precursor projections
   `VdVWTheorem243SymmetrizationPrecursor.randomSign_expectedMaximal_le` and
   `VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add`.
   The deterministic pair-difference supremum split
   `vdVWWeightedClassSupremum_pairDifference_le_add` is also available for the
   next `Phi(x)=x` comparison, with bounded value sets supplied by
   `bddAbove_vdVWWeightedClassValueSet_of_uniform_bound` when a uniform class
   bound is available.  The fixed-sample centered supremum-to-ghost-pair
   expectation handoff
   `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`
   and the envelope-bounded split
   `vdVWWeightedClassSupremum_truncated_pairDifference_le_add` are now compiled.
   The finite product-coordinate projection wrapper
   `probability_pi_prod_coordinates_measurePreserving`, its VdV&W specialization
   `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`, the one-sided
   projections `measurePreserving_vdVWProductMeasure_prod_to_original` and
   `measurePreserving_vdVWProductMeasure_prod_to_ghost`, and the expectation-level
   integral lifts for the centered ghost-copy comparison and envelope-bounded
   pair split are now compiled, including the projected two-coordinate bound
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`
   and the composed centered-to-two-truncated-expectation handoff
   `integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original`.
   The theorem-local random-sign side also has
   `vdVWWeightedClassSupremum_rademacherWeights_neg_sign`,
   `measurePreserving_vdVWProductMeasure_rademacherProductSampleSignSwap`,
   `integral_vdVWWeightedClassSupremum_pairDifference_constWeights_eq_rademacherWeights`,
   and
   `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
   The reusable bridge
   `VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg` is also
   compiled for ordinary-integral-to-outer-expectation handoffs.
   The cover API now also has `VdVWMeasurableCover.ofAEMeasurable` and
   `VdVWMeasurableCover.ofNullMeasurable_ofReal` for a.e.-measurable and
   null-measurable random targets.
   The product-integrated cover bridge is also compiled as
   `VdVWOuterExpectation_prod_hphi_id_of_integral_integral_le` and
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_outerExpectation_prod_randomSign_truncated_original`.
   The supplied product-space a.e. finite-net projection is compiled as
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_finiteNetHoeffdingUpper_add_of_product_randomSign_ae`.
   The sample-cover product-a.e. finite-net bridges
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
   and
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`
   are also compiled for supplied sample-indexed empirical covers, including
   sample-dependent cardinalities, and a product-a.e. finite-center Hoeffding
   predicate.
   The empirical-cover cardinality side now also has
   `FiniteEmpiricalL1CoverAtCard.pad_cardinality`,
   `exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le`, and
   `finiteEmpiricalL1CoverAtCard_of_randomEmpiricalL1CoveringNumber_le_cardinality`.
   The supplied-`hphi_id` projection to the random-sign finite-net
   Hoeffding-scale bound is also compiled as
   `VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`.
   Add another probability-measure product wrapper only if the final
   product-integrated finite-net projection exposes a reusable missing API.
4. Check the current VdV&W Theorem 2.4.3 blocker before adding Billingsley
   support.  The log-radius-to-Hoeffding scale comparison and proof-carrying
   symmetrization precursor package and finite product-sample weighted-sum
   mean-zero bridge, the fixed-sample `Phi(x)=x` ghost-copy comparison, and the
   finite product-coordinate projection, expectation-level integral lifts, and
   supplied-`hphi_id` finite-net projection are now compiled, as are the
   ordinary integrated product-sample/Rademacher sign-symmetry comparison, the
   product-integrated measurable-cover outer-expectation handoff, and the
   supplied product-space a.e. finite-net projection, sample-cover
   product-a.e. finite-net bridge, and random empirical-cover product random-sign
   handoff, selected random-cover expected-maximal handoff, and
   product-integrated random-cover finite-net expected-maximal bound, plus the
   product outer-expectation projection
   `VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
   The direct product-integrated centered-truncated composition is now compiled
   as
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
   The finite-net Hoeffding upper now also has nonnegativity, square-expansion,
   random log-cardinality rewrite/square-expansion, deterministic
   `L_n / n -> 0` to Hoeffding-scale convergence, pointwise finite-net notation
   convergence, the stochastic outer-probability entropy-to-Hoeffding-scale
   handoff, shifted-display convergence, and fixed/all-entropy projection
   helpers. The latest empirical-process frontier is the real integrated
   Hoeffding-plus-radius mean convergence input exposed by the compiled
   fixed-`M` centered-truncated convergence handoff, variable-domain Markov
   bridges, `tendsto_two_mul_ofReal_zero_of_tendsto_zero`, and the
   real-mean consumer
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_real_tendsto_zero`.
   The probability-measure tail lane now also has
   `probability_integral_le_threshold_add_bound_mul_tail`, and the VdV&W side
   has
   `tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`
   plus
   `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`,
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`,
   and
   `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
   plus
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
   plus
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`;
   the radius-added measurable-cardinality integrated-mean consumer
   `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`
   is also compiled;
   the finite-net upper measurability/integrability packaging lemmas from
   measurable cardinality and a deterministic bound are also compiled;
   the covering primitive measurability abstractions
   `measurable_empiricalL1CoveringNumber_of_cover_event_measurable` and
   `measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable`
   are compiled, reducing empirical covering-number and least finite-cardinality
   measurability to fixed-cardinality cover-event measurability under explicit
   selection hypotheses, with
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_minimal_finite`
   providing the minimal finite-cardinality domination process; the countable
   fixed-cardinality cover-event route is also compiled as
   `nonempty_finiteEmpiricalL1CoverAtCard_iff_exists_centers`,
   `measurable_empiricalL1Distance_of_measurable`,
   `measurableSet_finiteEmpiricalL1CoverAtCard_of_countable`,
   `measurable_empiricalL1CoveringNumber_of_countable`, and
   `measurable_finiteEmpiricalL1CoveringNumberCard_of_countable`;
   the deterministic finite-net log-bound suppliers
   `vdVWTheorem243FiniteNetHoeffdingUpper_le_of_logCardinality_div_le`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_bound_of_logCardinality_div_le`,
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
   and
   `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
   plus the fixed-`M` centered-truncated consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound`
are also compiled;
the selected minimal-cardinality measurability wrappers
`measurable_terminal_minimalRandomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`,
`measurable_selected_randomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable_of_measurable`,
and
`measurable_selected_truncatedRandomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable`
are now compiled as well, together with equality-transport wrappers
`measurable_cardinality_at_sampleSize_of_eq_selected_randomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`
and
`measurable_cardinality_at_sampleSize_of_eq_selected_truncatedRandomEmpiricalL1CoveringNumberCard_of_countable`
for externally named cardinality processes.  The deterministic log-bound route
also has the inverse-radius fixed-`M` consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound_invRadius`.
The covering-domination finite-witness bridges
`hasFiniteEmpiricalL1Cover_of_randomEmpiricalL1CoveringNumber_le_cardinality_samplePath`
and
`measurable_cardinality_at_sampleSize_of_eq_selected_truncatedRandomEmpiricalL1CoveringNumberCard_of_countable_of_covering_le`
are available for theorem entropy hypotheses.
The all-positive-radius covering-domination selector is packaged as
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.coverRadius_of_forAllRadius_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.invRadius_of_forAllRadius_samplePath`.
The finite-cover witness side of the same specialization is now packaged as
`hasFiniteEmpiricalL1Cover_coverRadius_of_forAllRadius_samplePath` and
`hasFiniteEmpiricalL1Cover_invRadius_of_forAllRadius_samplePath`.
The least selected cardinality can also be compared against any dominating
finite cardinality process through
`finiteEmpiricalL1CoveringNumberCard_le_of_empiricalL1CoveringNumber_le` and
`finiteEmpiricalL1CoveringNumberCard_terminal_le_of_covering_le_samplePath`.
The normalized selected log-cardinality bound can then be transported by
`vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_terminal_le` and
`vdVWLogEmpiricalL1CoveringCardinality_selected_terminal_div_le_of_covering_le_samplePath`.
All-radius and inverse-radius selected log-bound transfers are available as
`vdVWLogEmpiricalL1CoveringCardinality_selected_coverRadius_terminal_div_le_of_forAllRadius_samplePath`
and
`vdVWLogEmpiricalL1CoveringCardinality_selected_invRadius_terminal_div_le_of_forAllRadius_samplePath`.
`finiteEmpiricalL1CoveringNumberCard_terminal_eq_of_minimal_finite_samplePath`
now packages the terminal selected-cardinality equality when the final theorem
chooses the least finite empirical-cover cardinality process itself.
The theorem-facing selected-cardinality consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated`
is available for arbitrary deterministic shrinking cover radii, and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated_invRadius`
specializes it to `1 / ((n : ℝ) + 1)`, while
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.of_selected_truncated`
packages the selected inverse-radius side conditions except for the supplied
diagonal selected log convergence, and
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.of_eq_selected_truncated`
does the same for an externally named cardinality once terminal equality with
the selected truncated minimal process is supplied.  The fixed-`M` consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_logCardinality_div_bound`
now consumes that package plus the deterministic selected log-ratio bound.
The side-condition package also now projects directly to finite-net mean
convergence and finite-net-plus-inverse-radius mean convergence via
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_bound`
and
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_logCardinality_div_bound`.  The
next blocker is feeding theorem entropy hypotheses into this package past the
now-closed covering-domination/finite-witness step: diagonal selected
log-cardinality convergence and a deterministic normalized
log-cardinality bound or genuine varying-domain tail/UI replacement.  Pinned
mathlib UI/Vitali/DCT APIs are fixed-domain, so the deterministic bound remains
the practical route unless a new explicit varying-domain tail-expectation
bridge is proved.
   Do not add new Billingsley
   tail/Fubini wrappers unless one of those steps needs reusable
   probability/measure support.
5. If no empirical-process dependency is blocked on Billingsley support, pick
   Billingsley Theorem 25.8 bounded-continuous/continuity-set slice as the next
   exact source-audited wrapper candidate.
6. Add a source-crosswalk note in this dashboard before any exact theorem
   report is created.

## Report Gate

Before any `Reports/Billingsley1995_.../` folder is created:

1. Exact textbook statement must be selected and recorded in the inventory.
2. Lean statement must match the selected textbook item, modulo explicitly
   documented mathlib-compatible assumptions.
3. The proof must compile with no proof holes.
4. Local PDF screenshots must be embedded in `source_screenshots.md`.
5. The report must compile locally to `report.pdf`.
