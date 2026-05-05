# VdV&W Chapter 1-2 Progress Dashboard

This dashboard is a quick visual view of the current formalization state for
van der Vaart and Wellner Chapters 1 and 2.  The authoritative detailed
inventory is `docs/vdvw_chapter1_2_formalization_blueprint.md`; this file is a
human-facing monitor for what is proved, what is in progress, and what remains.

Status snapshot date: 2026-05-05.

Active blocker/primitives register:

```text
docs/vdvw_current_blocker_primitive_plan.md
```

Current `/goal` target override, 2026-05-05 at synced repository head
`3dcacda`: closed finite-net/Hoeffding/Mills, selected fixed-radius and
inverse-radius, untruncation, reverse-cofiltration, selected-entropy,
full-subgraph, finite-class, measurable/null-measurable signed weak-convergence,
and Dirac-law endpoint packages should not be rebuilt.  The current
theorem-facing gap is the exact book random-entropy selected finite-net
tail/UI or mean-convergence bridge for Theorem 2.4.3, plus any exact
nonmeasurable envelope-tail or arbitrary-map clauses required by final
textbook statements.  Bare outer-probability convergence of normalized random
entropy should not be treated as tail/UI; future runs must either prove a real
structural/UI theorem, instantiate an existing deterministic/L1 route from a
valid structural bound, or record the missing primitive precisely and move to
the next theorem-critical Chapter 1-2 gap.

2026-05-05 proof update: the `P`-measurable/null-measurable side of that
countability mismatch now has a compiled law-convergence bridge.  The new
Theorem 2.4.3 consumer
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pMeasurableClass_convergesInOuterProbabilityConst`
promotes centered finite-product suprema from `VdVWPMeasurableClass` plus
outer-probability convergence to weak convergence of pushforward laws to
`δ_0`.  Remaining gap: the signed arbitrary-map endpoint still needs a
null-measurable outer/inner-gap asymptotic-measurability bridge.

2026-05-05 follow-up: that null-measurable asymptotic-measurability bridge is
now compiled.  The remaining signed endpoint gap is narrower: prove equality
between the signed positive/negative outer expectation of a null-measurable
bounded real test and the ordinary/pushforward-law integral, then combine that
with the null-measurable Dirac-law convergence bridge for the Theorem 2.4.3
`P`-measurable endpoint.

2026-05-05 follow-up: that `P`-measurable signed endpoint is now compiled.
The new bridge includes the a.e.-measurable nonnegative outer-expectation
collapse, the null-measurable signed positive/negative integral collapse, the
null-measurable varying-domain signed weak-convergence feeder, and the
Theorem 2.4.3 consumer
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pMeasurableClass_convergesInOuterProbabilityConst`.
Next target: the exact textbook entropy/tail-UI mismatch, not more endpoint
packaging.

2026-05-05 current proof batch: the variable-domain book-entropy route now has
a direct untruncated centered convergence consumer with explicit selected
finite-net tail/UI hypotheses:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_tailExpectation`.
This removes another package-construction layer but keeps the mathematical
gap honest.  The next `/goal` target is still to prove the selected finite-net
tail/UI bridge from the textbook random entropy hypothesis, or derive the
needed deterministic/tail control from a real structural entropy theorem.

2026-05-05 current proof batch: the finite-net tail/UI bridge now has the
pointwise and integrated reduction from Hoeffding tails to normalized
log-cardinality tails:
`vdVWTheorem243FiniteNetHoeffdingUpper_le_six_mul_M_mul_one_add_logCardinality_div`,
`vdVWTheorem243FiniteNetHoeffdingUpper_tail_subset_logCardinality_div_tail`,
and
`vdVWTheorem243FiniteNetHoeffdingUpper_tail_indicator_le_logCardinality_div_tail_indicator`,
with the integrated theorem
`finiteNetHoeffdingUpper_tailExpectation_condition_of_logCardinality_div_tailExpectation`
and selected-package constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_tailExpectation`.
The remaining analytic step is now to prove or isolate normalized-log affine
tail/UI and integrability from the book random entropy condition.

2026-05-05 follow-up: the normalized-log affine tail step itself is now
compiled.  The new declarations
`logCardinality_div_affineTailIntegrable_of_measurable_integrable`,
`logCardinality_div_affine_tailExpectation_condition_of_tailExpectation`,
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_tailExpectation`,
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_tailExpectation_raw`
turn raw normalized-log measurability, integrability, and tail/UI for the
selected empirical-cover cardinality into the finite-net Hoeffding tail/UI
condition and the selected fixed-radius tail/UI package.  The remaining exact
Theorem 2.4.3 entropy gap is now narrower: derive those raw normalized-log
tail/UI and integrability inputs from the book random entropy hypothesis, or
isolate the missing varying-domain uniform-integrability theorem honestly.

2026-05-05 deterministic-tail follow-up: the structural deterministic branch
of that raw-log gap is now compiled.  The new declarations
`logCardinality_div_integrable_of_measurable_bound`,
`logCardinality_div_tailExpectation_condition_of_bound`, and
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_bound`
show that deterministic normalized-log cardinality bounds imply the raw
normalized-log integrability/tail/UI inputs and then the finite-net Hoeffding
tail/UI condition.  This keeps VC/finite-code entropy routes usable while
leaving the pure stochastic random-entropy-to-UI implication as the honest
remaining mismatch.

2026-05-05 blocker refinement: after local/mathlib search, the remaining
non-deterministic entropy target is now explicitly a varying-domain UI theorem
or a stronger structural entropy theorem.  The compiled deterministic
normalized-log route already feeds the selected fixed-radius and untruncated
Theorem 2.4.3 consumers, so adding more endpoint wrappers would be redundant.
The missing theorem cannot have the bare form "outer-probability convergence
of normalized log cardinality implies tail expectation"; it needs an explicit
uniform-integrability/tail hypothesis or a proof that the VdV&W entropy
assumptions supply one.

2026-05-05 L1-strengthened follow-up: a mean-convergence route to raw
normalized-log tail/UI is now compiled.  The new general bridge
`tailExpectation_condition_of_integral_tendsto_zero_nonneg` and Theorem 2.4.3
specialization
`logCardinality_div_tailExpectation_condition_of_integral_tendsto_zero`, plus
the finite-net handoff
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_integral_tendsto_zero`,
show that ordinary mean convergence of normalized log cardinalities implies
the tail/UI condition required by the finite-net route.  This does not replace
the textbook `o_P^*` hypothesis, but it gives a non-deterministic L1 route for
later structural entropy arguments.

2026-05-05 selected-package follow-up: that L1 route now has a theorem-facing
selected fixed-radius package constructor,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_integral_tendsto_zero`.
The next useful proof is no longer another selected-package wrapper; it is
deriving the selected normalized-log mean convergence/UI input from a real
structural entropy hypothesis, or moving to the next exact Chapter 1-2 gap if
that remains blocked after search.

2026-05-05 untruncated L1 follow-up: the same L1 route now reaches the
untruncated centered Theorem 2.4.3 conclusion through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_integral_tendsto_zero`.
The current highest-value target is therefore the structural proof that
selected normalized empirical entropy converges in ordinary mean or is
uniformly integrable; adding more endpoint wrappers around these same
hypotheses would be duplicative.

## Status Legend

| Status | Meaning |
| --- | --- |
| `local-exact` | The exact textbook theorem/lemma target is formalized and proved in Lean with no proof holes. |
| `local-layer` | A compiled local proof layer exists, but the exact textbook item still has compatibility gaps. |
| `mathlib-foundation` | Pinned mathlib has reusable foundations, but the exact VdV&W statement is not locally proved. |
| `pending-local` | No exact local Lean proof yet. |
| `foundation-lane` | Fundamental Chapter 1 item with a concrete mathlib-wrapper or local-primitive route. |
| `blocked-vdvw` | Exact VdV&W statement needs a missing arbitrary-map/nonmeasurable/perfect-map/representation primitive. |
| `deferred` | Audited and intentionally outside the current theorem line, with a recorded reason; not a substitute for mathlib search. |
| `deferred-example` | Example/addendum intentionally skipped for now because it needs external-domain formalization outside the current Chapter 1-2 main line. |

## Global Theorem-Level Inventory

The Chapter 1-2 theorem-level extraction currently has 157 items after the
Chapter 1 re-audit restored the missing Theorem 1.10.4 inventory row.

```text
local-exact        1 / 157  [#-----------------------------]
local-layer       11 / 157  [##----------------------------]
mathlib-found.    11 / 157  [##----------------------------]
ch1 foundation    25 / 157  [#####-------------------------]
blocked-vdvw       7 / 157  [#-----------------------------]
pending-local    101 / 157  [###################-----------]
```

The bars are inventory tags, not effort estimates.  The Chapter 1 foundation
lane is not a skip bucket: those rows should be formalized as mathlib-backed
wrappers or local primitive proofs.  Only `blocked-vdvw` records a genuine
missing exact VdV&W arbitrary-map/nonmeasurable/perfect-map/representation
primitive after local and pinned mathlib search.

Examples/addenda are tracked separately from this theorem-level inventory and
are no longer a main-line blocker.  The existing Example 2.3.4 and Example
2.4.2 compiled local layers remain reusable infrastructure, but exact example
reports and remaining example-specific external/domain-heavy closures are
deferred unless a theorem target needs them.

## Chapter Split

| Chapter | Total theorem-level items | local-exact | local-layer | mathlib-foundation | pending-local |
| --- | ---: | ---: | ---: | ---: | ---: |
| Chapter 1 | 47 | 0 | 10 | 17 | 20 |
| Chapter 2 | 109 | 1 | 1 | 4 | 103 |

Chapter 1 has more infrastructure layers than exact completions because many
statements are foundational weak-convergence/tightness/product/Hilbert
theorems that need mathlib-backed VdV&W wrappers or local primitives.  Chapter
2 has the current exact theorem milestone, Theorem 2.4.1.

## Main Formalization Path

```mermaid
flowchart LR
  C12["Chapter 1.2 outer expectation and covers<br/>local-layer"]
  OP["Outer probability / a.s. / measurability bridges<br/>local-layer"]
  PM["Definition 2.3.3 P-measurable class<br/>local-layer"]
  BR["Definition 2.1.6 bracketing number<br/>local-layer"]
  T241["Theorem 2.4.1 finite bracketing GC<br/>local-exact"]
  E242["Example 2.4.2 empirical CDF brackets<br/>deferred-example local-layer"]
  T243["Theorem 2.4.3 / Lemma 2.4.5 final alignment<br/>current"]
  GCH1["Chapter 1 weak convergence and tightness<br/>foundation-lane wrappers"]

  C12 --> OP
  OP --> T241
  PM --> T243
  BR --> T241
  BR --> T243
  T241 -. proof pattern .-> T243
  T241 --> E242
  E242 -. not blocking theorem line .-> T243
  GCH1 -. audited but not blocking .-> T241
```

## What Is Proved Exactly

| Textbook item | Lean status | Notes |
| --- | --- | --- |
| Theorem 2.4.1 | `local-exact` | Proved as `vdVW_theorem_2_4_1_glivenkoCantelli` in the book-style GC predicate. |

The Theorem 2.4.1 proof route includes primitive finite `L1(P)` bracketing
numbers, endpoint SLLN bridges, countable decreasing cover assembly, and
outer-a.s./outer-probability GC wrappers.

## Active Local Layers

| Textbook area | Current local Lean layer | Remaining gap before exact textbook item |
| --- | --- | --- |
| Lemma 1.2.1 | Nonnegative outer/inner expectation and measurable-cover interfaces, measurable nonnegative maps reduce both outer and inner expectation to ordinary `lintegral`, measurable real/test-composition bridges collapse the nonnegative outer/inner expectation gap, plus monotonicity of nonnegative outer and inner expectation | Full extended-real measurable-cover existence theorem and signed arbitrary-map asymptotic-measurability layer. |
| Lemma 1.2.2 | Nonnegative cover algebra: sup, add majorant, product majorant, two-sided constant addition equality, finite-measurable addition equality, threshold indicators, tail-product cover-majorant for envelope-tail terms, two-sided measurable infimum equality, and measurable integrable real signed bridge via positive/negative outer expectations | Full arbitrary-map signed extended-real clauses, subtraction, absolute value, and stronger addition/product equality cases. |
| Lemma 1.2.3 | Nonnegative event indicator bridges for outer/inner probability, event-indicator monotonicity, explicit measurable event-cover existence, arbitrary measurable set covers with integral equality, direct `toMeasurable` hull integral equality, complement-set-cover lower covers, direct complement-cover inner-probability equalities, outer-probability/outer-expectation bridge, Markov-style outer-probability bound via supplied measurable cover, and two-sided complement identities | Remaining extended-real and full measurable-set-cover clauses. |
| Definition 1.3.3 / Definition 1.3.7 / Theorem 1.3.4 / Theorem 1.3.6 / Theorem 1.3.9 / Section 1.4 | Measure-level weak convergence of probability measures, bounded-continuous and bounded-Lipschitz integral characterizations, Levy-Prokhorov distance characterizations, Portmanteau closed/open implications, probability-measure tightness compact-set characterization, Prokhorov compact-closure wrapper, continuous-map pushforward, binary and finite product-law weak convergence, finite-coordinate restriction/FDD forward wrapper, process-law and `IdentDistrib` uniqueness-only FDD wrappers, convergence-in-distribution continuous mapping, measurable common-domain Slutsky/product convergence wrappers, a nonnegative asymptotic-measurability primitive whose outer/inner expectation gap vanishes for measurable test compositions, lower-shifted real / bounded-continuous versions for measurable maps, a canonical bounded-continuous shift `-‖f‖` version, selected-test monotonicity and arbitrary-map pullback closures for nonnegative/lower-shifted predicates, continuous-map closure for shifted bounded-continuous predicates, filter-refinement closure for local asymptotic-measurability predicates, signed positive/negative outer-expectation bridges for measurable real maps and bounded-continuous test compositions, a signed bounded-continuous positive/negative outer-inner gap predicate, signed bounded-continuous asymptotic-measurability predicate with measurable-map/filter/continuous closures, proof-carrying signed bounded-continuous arbitrary-map weak-convergence package whose map-law, `HasLaw`, common-domain `TendstoInDistribution`, common-domain outer-probability convergence, and continuous-mapping cases follow from the measure-level weak-convergence/law APIs, and varying-domain signed bounded-continuous weak-convergence/asymptotic-measurability packages with map-law and automatic-pushforward feeders for sample-size-varying endpoints | Full VdV&W nonmeasurable outer-cover signed extended-real weak convergence, asymptotic-tightness, asymptotic-independence, and FDD weak-convergence converse versions remain separate blocked primitives. |
| Lemma 1.7.1 | Open-ball and closed-ball sigma-field wrappers, open-ball topological basis, rational open/closed ball bridges, open-ball/closed-ball sigma equality, Borel equality, generator measurability, separable dense-sequence distance-coordinate measurability iff, and bounded distance-coordinate measurability iff in `BallSigma.lean` | Full arbitrary-map/asymptotic-measurability clauses remain pending. |
| Section 1.8 | Hilbert/L2/Gaussian foundation wrappers: complete inner-product spaces as Hilbert spaces, `L2` Hilbert space and inner product, Frechet-Riesz dual representative, Gaussian inner-coordinate maps, and Gaussian-process coordinate laws in `HilbertGaussian.lean` | Full VdV&W Hilbert tightness/asymptotic-measurability, Brownian bridge/pre-Gaussian, and functional CLT/Donsker statements still require local process primitives. |
| Definition 1.10.1 | Outer-probability convergence primitives and common-domain `TendstoInMeasure` bridge | Broader arbitrary-map API. |
| Lemma 1.10.2 | Measurable common-domain weak-convergence bridge | Full VdV&W arbitrary-map/measurable-cover version. |
| Definition 2.1.5 / Theorem 2.4.3 setup | `vdVWCoveringNumber` wrapper over mathlib `Metric.externalCoveringNumber`, explicit finite closed-ball cover witnesses, finite-number handoff, monotonicity, packing comparison wrappers, deterministic empirical `L1(P_n)` distance/finite-covering-number interface including nonempty-class positive-cardinality handoff, random sample-path empirical covering-number wrapper, random empirical-cover cardinality witness handoff, random empirical-cover product random-sign finite-net handoff, outer-probability `o_P^*(n)` entropy condition, `F_M` truncated-class/envelope interface, countable truncated-class `P`-measurability bridge, a.e./null-measurable cover constructors, truncated product-copy pair-difference measurability/integrability, `P.prod P` coordinate law/independence/identical-distribution wrappers, mapped truncated-class product-copy law/independence wrapper, finite-sample mapped-coordinate laws/independence wrapper, fixed-index product-copy mean-zero bridge, finite product-sample weighted-sum mean-zero bridge, conditional fixed-original-sample ghost-copy identity, fixed-sample `Phi(x)=x` ghost-copy comparison, product-copy pair-difference supremum split, envelope-bounded pair split, finite product-coordinate projection and expectation-level integral lifts, Fubini/product-projection centered handoff, deterministic weight sign-flip invariance, projected two-coordinate pair-difference expectation bound, composed centered-to-two-truncated-expectation handoff, deterministic Rademacher-weight sign-negation bridge, product-pair Rademacher sign-swap measure-preserving wrapper, integrated product-pair sign-symmetry and random-sign averaging comparisons, precursor random-sign expected-maximal and outer-expectation projections, supplied-`hphi_id` finite-net projection, product-integrated measurable-cover outer-expectation bridge, supplied product-space finite-net projection, sample-cover and sample-dependent-cardinality product-a.e. finite-net bridges, selected random-cover expected-maximal handoff, product-integrated random-cover finite-net expected-maximal bound, product outer-expectation projection for the expectation-level random-cover route, real-valued envelope-tail outer-expectation/probability bridge, ordinary measurable truncation-tail integral bridge, measurable-integrable outer/lintegral envelope-tail convergence, fixed-sample empirical-net inequality `(2.4.4)`, finite-center maximal/Hoeffding-scale handoff layer, deterministic and a.e. random Rademacher-sign finite-net specializations, one-center random Rademacher sub-Gaussian bridge, truncated-envelope variance-proxy arithmetic, sub-Gaussian proxy monotonicity, finite-center sub-Gaussian tail/union-bound layer, iid real-valued Rademacher-sign construction, finite-center supremum integrability layer, expected finite-center supremum handoff, layer-cake tail-integral monotonicity, generic ordinary dominated-convergence tail cutoff, bounded-tail expectation wrapper, product self-copy, mapped-coordinate joint-law independence wrappers, finite-`Pi` mapped-coordinate product wrappers, finite-`Pi` weighted-sum expectation wrappers, generic product-copy weighted-sum mean-zero wrapper, generic conditional ghost-copy finite-`Pi` Fubini wrapper, Gaussian-tail integrability, exact Gaussian-tail integral, coarse closed-form expectation bound, split-at-radius tail-to-expectation bound, Mills-type Gaussian-tail estimate, finite-center Mills expectation bound, supplied small-tail Mills simplification, logarithmic-radius arithmetic, finite-center logarithmic-radius Mills expectation bound, expected maximal-bound packaging, truncated Rademacher expected-maximal specialization, finite-empirical-cover expected-maximal wrapper, positive common-proxy lemma, proved log-radius-to-Hoeffding scale comparison, finite-empirical-cover expected-maximal wrapper at the Hoeffding display scale under explicit positivity, stochastic entropy-to-Hoeffding convergence, shifted-display and fixed/all-entropy Hoeffding convergence consumers, Markov outer-expectation-to-outer-probability bridge, variable-domain bounded outer-probability-to-mean bridge, finite-net mean consumer, deterministic finite-net log-bound suppliers, selected-cardinality equality-transport arbitrary-radius/inverse-radius consumers, inverse-radius entropy side-condition package, package-level finite-net mean projections from deterministic selected log-ratio bounds, and proof-carrying `VdVWTheorem243SymmetrizationPrecursor` package | The remaining gap is diagonal selected log-cardinality convergence plus a deterministic selected normalized log-ratio bound, or a genuine varying-domain tail/UI replacement, from the theorem entropy hypotheses, then final assembly. The fixed-sample pointwise `hphi_id` and product-a.e. finite-center Hoeffding targets are too strong. Add nonmeasurable/arbitrary-cover envelope-tail variants only if the exact assembly needs them. |
| Definition 2.1.6 | Primitive brackets, finite covers, `L1(P)` width, and numeric `l1BracketingNumber` | Entropy/logarithm refinements are not the current target. |
| Definition 2.2.3 | Semimetric whole-space covering/packing wrappers `vdVWSemimetricCoveringNumber` and `vdVWSemimetricPackingNumber`, finite-cover handoff, and `N <= D <= N(epsilon/2)` comparison layer | Entropy/logarithm wrappers and exact open-ball convention remain pending. |
| Definition 2.3.3 / Example 2.3.4 | Product measure `P^n`, its probability-measure instance `instIsProbabilityMeasure_vdVWProductMeasure`, display `(2.3.2)` weighted sample sums and class suprema, `NullMeasurable` predicate for measurability on the completion, countable coordinate-measurable constructor, pointwise-to-weighted-sum convergence helpers, value-set/boundedness infrastructure for real suprema, bounded pointwise-approximability-to-supremum-equality bridge, deterministic finite-cover supremum bound for Theorem 2.4.3, and proof-carrying countable-subclass supremum-equality handoff | The theorem-relevant deterministic finite-cover handoff is available; exact example-only supremum equality is deferred unless needed by Theorem 2.4.3. |
| Example 2.4.2 | Real half-line indicator bracket membership, endpoint integrability, `L1(P)` width identity, extended-real endpoint indicators/brackets for `-∞`/`∞`, extended-open-cell endpoint/width identities, probability-measure CDF/Stieltjes open-cell identity and CDF-increment-to-middle-width handoffs, finite-measure real-tail cutpoints, adjacent-endpoint grid handoff, supplied finite-grid bridges, one-cell base grid and one-cell adjacent-endpoint base grid for radii above total mass, radius-monotonicity helpers for supplied real/extended/adjacent-endpoint grids, finite-real-endpoint assembly constructor, three-cell endpoint-grid constructor from supplied tail/middle width bounds and CDF increment bounds, bounded-middle CDF partition interface `SuppliedRealMiddleCDFPartition` with adjacent-endpoint strictness and open-cell width handoff, tail-appending endpoint constructor and endpoint-grid existence handoff from a supplied middle partition, reduction from uniform bounded middle partitions to full endpoint-grid existence, primitive-grid existence, and bracketing-number finiteness to `0 < epsilon <= μ.real univ`, all-positive-radius `N_[] < ∞` handoff, conditional half-line GC corollary from supplied grids, and conditional half-line GC corollary from adjacent endpoint grids | Deferred example-specific blocker: distribution-dependent bounded middle CDF/quantile partition existence and exact empirical-CDF example report. |

2026-05-03 update: the selected random empirical-cover witness now also feeds
the expectation-level finite-net route via
`vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_randomEmpiricalL1CoverAtCard_of_pos`
and
`integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
The product outer-expectation projection for this route is also compiled as
`VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
The entropy-to-Hoeffding-scale algebra now also has
`vdVWTheorem243FiniteNetHoeffdingUpper_nonneg`,
`vdVWTheorem243FiniteNetHoeffdingUpper_sq`,
`vdVWTheorem243FiniteNetHoeffdingUpper_eq_logCardinality`,
`vdVWTheorem243FiniteNetHoeffdingUpper_sq_eq_logCardinality`,
`tendsto_sqrt_one_add_mul_sqrt_six_div_of_div_tendsto_zero`,
`tendsto_finiteNetHoeffdingUpper_of_logCardinality_div_tendsto_zero`, and
`VdVWTheorem243TruncatedEntropyCondition.fixed_of_forAllEpsilonM`.
The stochastic outer-probability entropy-to-Hoeffding-scale handoff is now
compiled as
`vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbability_zero_of_logCardinality_littleO_n`,
with shifted-display and fixed/all-entropy consumers, and
`VdVWConvergesInOuterProbability_zero_of_outerExpectation_tendsto_zero_ofReal`
now provides the Markov bridge from vanishing outer expectation to outer
probability, with variable-domain and supplied-bound variants added for the
canonical product sample spaces. The fixed-`M` centered-truncated convergence
handoff is compiled as
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_tendsto_zero`.
The real-to-`ENNReal.ofReal` convergence bridge
`tendsto_two_mul_ofReal_zero_of_tendsto_zero` and real-mean consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_real_tendsto_zero`
are also compiled.  The deterministic covering-radius term is now split off by
`tendsto_integral_finiteNetHoeffdingUpper_add_coverRadius_of_tendsto_integral_finiteNetHoeffdingUpper`,
and the theorem-facing fixed-`M` consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_and_coverRadius_tendsto_zero`
uses separate finite-net mean convergence and cover-radius convergence inputs.
The bounded-tail expectation wrapper
`probability_integral_le_threshold_add_bound_mul_tail`, the variable-domain
bounded outer-probability-to-mean bridge
`tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`,
and the finite-net mean consumer
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`
plus the pure finite-net mean consumer
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`
are now compiled. The variable-domain entropy-to-Hoeffding bridge
`vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`
and bounded entropy-to-integrated-mean consumer
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
with pure finite-net mean form
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
and measurable-cardinality consumer
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`
and radius-added measurable-cardinality consumer
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`
are compiled as well. The random finite-net upper measurability/integrability
packaging lemmas
`measurable_vdVWLogEmpiricalL1CoveringCardinality_of_measurable_cardinality`,
`measurable_vdVWTheorem243FiniteNetHoeffdingUpper_of_measurable_cardinality`,
and
`integrable_vdVWTheorem243FiniteNetHoeffdingUpper_of_measurable_cardinality_bound`
are also compiled. The fixed-`M` centered-truncated consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_bounded`
now composes these pieces under explicit measurable-cardinality,
boundedness/UI, and `coverRadius -> 0` hypotheses. The
cover-event-to-covering-number measurability abstraction
`measurable_empiricalL1CoveringNumber_of_cover_event_measurable` and the least
finite-cover cardinality measurability wrapper
`measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable` are
compiled, so the measurable-cardinality blocker is now pinned to
fixed-cardinality cover-event measurability/selection hypotheses. The minimal
finite cardinality process also has the domination wrapper
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_minimal_finite`. The
countable-class cover-event route is now compiled as
`nonempty_finiteEmpiricalL1CoverAtCard_iff_exists_centers`,
`measurable_empiricalL1Distance_of_measurable`,
`measurableSet_finiteEmpiricalL1CoverAtCard_of_countable`,
`measurable_empiricalL1CoveringNumber_of_countable`, and
`measurable_finiteEmpiricalL1CoveringNumberCard_of_countable`, plus measurable
class specializations. The theorem-facing selected minimal-cardinality
measurability wrappers
`measurable_terminal_minimalRandomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`,
`measurable_selected_randomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable_of_measurable`,
and
`measurable_selected_truncatedRandomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable`
are also compiled, together with the equality-transport wrappers
`measurable_cardinality_at_sampleSize_of_eq_selected_randomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`
and
`measurable_cardinality_at_sampleSize_of_eq_selected_truncatedRandomEmpiricalL1CoveringNumberCard_of_countable`.
The covering domination-to-finiteness bridges
`hasFiniteEmpiricalL1Cover_of_randomEmpiricalL1CoveringNumber_le_cardinality`
and
`hasFiniteEmpiricalL1Cover_of_randomEmpiricalL1CoveringNumber_le_cardinality_samplePath`,
plus
`measurable_cardinality_at_sampleSize_of_eq_selected_truncatedRandomEmpiricalL1CoveringNumberCard_of_countable_of_covering_le`,
are also compiled.
The
deterministic finite-net log-bound suppliers
`vdVWTheorem243FiniteNetHoeffdingUpper_le_of_logCardinality_div_le`,
`vdVWTheorem243FiniteNetHoeffdingUpper_bound_of_logCardinality_div_le`,
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
and
`integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
plus the fixed-`M` centered-truncated consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound`
and its inverse-radius specialization
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound_invRadius`
are also compiled. The side-condition package
`VdVWTheorem243FixedMInvRadiusEntropySideConditions` and consumers
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`,
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_bounded`
also package the selected inverse-radius cover, diagonal log-cardinality
convergence, and measurable cardinality while keeping finite-net boundedness/UI
explicit. The theorem-facing selected-cardinality consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated`
is compiled for arbitrary deterministic shrinking cover radii, and its
inverse-radius specialization
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated_invRadius`
is compiled as well; it discharges the measurable-cardinality input from
equality with the selected truncated minimal empirical-cover cardinality. The
selected package
`VdVWTheorem243SelectedInvRadiusEntropySideConditions`, its fixed-`M` package
projection, its finite-cover constructor
`VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_invRadiusFiniteCovers`,
and the compact fixed-`M` convergence consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy`
are now compiled. The remaining blocker is no longer finite-cover domination or
terminal equality; it is supplying the diagonal shrinking-radius log
convergence and deterministic log-ratio/UI input needed by that selected
package, then final assembly.
All-positive-radius covering domination can now be projected by
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.coverRadius_of_forAllRadius_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.invRadius_of_forAllRadius_samplePath`,
with finite-witness forms
`hasFiniteEmpiricalL1Cover_coverRadius_of_forAllRadius_samplePath` and
`hasFiniteEmpiricalL1Cover_invRadius_of_forAllRadius_samplePath`,
and selected-cardinality domination helpers
`finiteEmpiricalL1CoveringNumberCard_le_of_empiricalL1CoveringNumber_le` and
`finiteEmpiricalL1CoveringNumberCard_terminal_le_of_covering_le_samplePath`,
with selected log-bound transfer helpers
`vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_terminal_le` and
`vdVWLogEmpiricalL1CoveringCardinality_selected_terminal_div_le_of_covering_le_samplePath`,
all-radius/inverse-radius selected log-bound transfers
`vdVWLogEmpiricalL1CoveringCardinality_selected_coverRadius_terminal_div_le_of_forAllRadius_samplePath`
and
`vdVWLogEmpiricalL1CoveringCardinality_selected_invRadius_terminal_div_le_of_forAllRadius_samplePath`,
while
`finiteEmpiricalL1CoveringNumberCard_terminal_eq_of_minimal_finite_samplePath`
packages the terminal selected equality for the least finite-cover cardinality
process, and
`VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_invRadiusFiniteCovers`
packages the theorem-facing selected inverse-radius side conditions from finite
empirical covers once diagonal selected log convergence and deterministic
log-ratio control are supplied.
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.of_selected_truncated`
packages inverse-radius selected side conditions once diagonal selected log
convergence is supplied, and
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.of_eq_selected_truncated`
does the same for externally named cardinalities after terminal equality with
the selected truncated minimal process is supplied, while
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_logCardinality_div_bound`
consumes that package plus a deterministic selected log-ratio bound. The
package-level finite-net mean projections
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_bound`
and
`VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_logCardinality_div_bound`
also now expose the ordinary finite-net and finite-net-plus-inverse-radius
mean convergence consequences directly from the side-condition package and the
same deterministic selected log-ratio bound. The selected package and finite
cover constructor now expose matching direct finite-net mean projections, and
the selected inverse-radius all-radius route has the named selected
cardinality `vdVWSelectedTruncatedInvRadiusEmpiricalL1CoveringNumberCard` plus
direct selected mean projections
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_selected_truncated_invRadiusEntropy_logCardinality_div_bound`
and
`integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_selected_truncated_invRadiusEntropy_logCardinality_div_bound`.
The explicit varying-domain tail bridge
`tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_tailExpectation_nonneg`
is compiled with the Theorem 2.4.3 specialization
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_tailExpectation_convergesInOuterProbabilityConst`,
and the probability support lane also has
`tendsto_integral_of_tendsto_measureReal_tail_zero_of_bounded_nonneg` for the
bounded real-tail route.
The bounded-to-tail/UI adapter route is now compiled as
`tailExpectation_condition_of_eventual_bound` and the finite-net/selected
specializations through
`integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_invRadiusFiniteCovers_tailExpectation`.
The untruncation perturbation substrate is compiled as
`VdVWConvergesInOuterProbabilityConst_zero_of_eventual_dist_le_add_errors`.
The deterministic untruncation perturbation inequalities are now also compiled:
weighted sample truncation, empirical-average truncation, population integral
truncation, fixed-index centered truncation, and supremum-level centered
truncation are closed.  The empirical envelope-tail expectation/Markov route is
compiled through
`VdVWOuterExpectation_empiricalEnvelopeTail_eq_ofReal_integral_tail` and
`VdVWOuterProbability_empiricalEnvelopeTail_gt_le_integral_tail_div`.
The untruncation bad-event probability split is now compiled through
`vdVWTheorem243_untruncated_centered_badEvent_subset_truncated_or_empiricalTail`,
`VdVWOuterProbability_untruncated_centered_bad_le_truncated_add_empiricalTail`,
and
`VdVWOuterProbability_untruncated_centered_bad_le_truncated_add_tailIntegral`.
The remaining blockers are the large-`M` tail-choice convergence handoff from
the fixed-`M` truncated process to the untruncated process, plus deriving the selected diagonal
log-cardinality/log-ratio inputs or a stronger selected finite-net tail/UI
condition from the book assumptions, then final assembly.
The large-`M` handoff itself is now compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_fixedM_centered_truncated`,
closing the fixed-`M`-to-untruncated convergence blocker under the honest
forall-fixed-`M` convergence hypothesis.
The selected inverse-radius untruncated composition is now compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedInvRadiusEntropy`,
and the large-`M` handoff only needs positive fixed-`M` convergence, matching
the chosen truncation levels.
The selected side-condition constructor
`VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_selected_truncated`
and the non-selected untruncated inverse-radius/log-bound consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_invRadiusEntropy_logCardinality_div_bound`
are also compiled, so both selected and externally packaged inverse-radius
routes now feed the large-`M` untruncation layer under honest diagonal
entropy/log-bound assumptions.
The all-radius selected-truncated bridge
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_invRadiusEntropy_logCardinality_div_bound`
is now compiled as well: it builds the selected inverse-radius fixed-`M`
packages from all-positive-radius truncated finite covers and keeps the
diagonal selected log convergence/log-ratio assumptions explicit.
The product-integrated symmetrization route now also has the composed
random-cover finite-net integral bridge
`integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.

## Near-Term Frontier

```text
DONE       Theorem 2.4.1: finite L1(P) bracketing numbers imply GC.
ONGOING    Chapter 1.2 local cover/probability layers needed by empirical processes.
ONGOING    Theorem 2.4.3 and nearby Chapter 2 bracketing/GC results.
CURRENT    The active /goal frontier is no longer the reverse/cofiltration
           theorem: VdVWOrderDualSubmartingaleConvergenceHandoff.proved,
           VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable,
           the no-hreverse Lemma 2.4.5 endpoint, and the strong full-subgraph
           Theorem 2.4.3/Lemma 2.4.5 package are compiled.  The next target is
           exact final-statement assembly: turn the strong full-subgraph
           package into the cleanest named VdVW Theorem 2.4.3/Lemma 2.4.5
           theorem statement, audit/remove any stronger-than-book side
           assumptions, and record any remaining mismatch with the book's
           entropy/VC hypotheses instead of adding more endpoint wrappers.  The
           avoidable nonempty-class assumption is now removed by the compiled
           empty-class split
           `VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`.
READY      Definition 2.1.5 covering-number primitive plus fixed-sample/random empirical L1(P_n) entropy, F_M truncation interfaces, countable/measurable-cardinality selectors, product-copy/Fubini/symmetrization bridges, Rademacher finite-net Hoeffding and Mills/log-radius maximal layers, bounded varying-domain real-tail-to-mean wrapper, variable-domain fixed-M centered-truncated convergence handoffs, deterministic log-bound/inverse-radius consumers, selected-cardinality equality-transport arbitrary-radius/inverse-radius consumers, all-radius covering-domination selectors, selected inverse-radius finite-cover constructor, selected side-condition constructor, inverse-radius entropy side-condition package, package-level inverse-radius entropy mean projections, selected finite-cover and selected inverse-radius all-radius finite-net mean projections, explicit variable-domain tail/UI mean bridge and bounded-tail adapters, generic outer-probability perturbation, deterministic untruncation perturbation inequalities, empirical envelope-tail expectation/Markov bridges, untruncation bad-event probability split, large-M untruncation convergence handoff, untruncated selected/non-selected/all-radius-selected inverse-radius consumers, faithful fixed-radius finite-net mean and log-cardinality handoffs, selected fixed-radius cardinality/log-convergence/finite-net mean handoffs, selected fixed-radius fixed-M and untruncated consumers, selected fixed-radius tail/UI fixed-M and untruncated consumers with finite-center Rademacher integrability derived internally, selected fixed-radius tail/UI side-condition package with deterministic-log-bound and terminal-`base^n` constructors plus fixed-M and untruncated packaged consumers, induced empirical `L1(P_n)` pseudometric/internal-cover adapters and sample-path random-cover bridge, fixed-sample trace image/repr empirical-cover bridges, finite-trace random-cover and selected fixed-radius tail-package constructors, deterministic-rate-to-outer-probability entropy bridges, finite-trace selected fixed-radius tail-package constructor from deterministic normalized log-cardinality rates, log-linear/polynomial-rate, shifted-log-linear, and natural-polynomial finite-trace tail-package constructors, local VC/Sauer wrappers with coarse polynomial set-family bound, generic finite-code empirical-trace cardinality bridge, binary empirical-trace-to-Sauer cardinality bridge, fixed-threshold subgraph/indicator trace bridge, finite-threshold signature/product-cardinality bridge plus product-bound, factorwise-bound, common-base, threshold-count, base-growth, uniform-VC polynomial handoffs, pointwise/coordinatewise-threshold separation consumers, exact finite-value-membership threshold consumers, direct finite-value threshold selected fixed-radius tail/UI package constructor, finite-value threshold untruncated convergence consumer, finite realized value-set threshold/cardinality constructor, finite realized value-set untruncated convergence consumer, finite approximate-code and pointwise-code empirical-cover primitives with padded cardinality, finite-class empirical pseudometric cardinality bounds, finite-class selected fixed-radius tail-package constructor with deterministic log-cardinality convergence, finite-class untruncated centered convergence consumer with truncation-integrability, value-set boundedness, finite-center Rademacher integrability, centered measurable-cover, centered-supremum integrability, pair/split-copy supremum integrability, ghost-expectation integrability, sample-side Rademacher supremum integrability, product-space Rademacher supremum integrability, product-space measurable cover, sign-side supremum integrability, sign-side iterated-integral integrability, canonical common iid Rademacher sign instantiation, and canonical terminal sample-path instantiation discharged, untruncated fixed-radius log-bound consumer, and proof-carrying symmetrization precursor package for Theorem 2.4.3 setup.
NEXT       Do not repeat finite-class geometry/entropy consumers, finite-center
           integrability, untruncation bridges, fixed/selected radius entropy
           packages, trace-cover bridges, Sauer/VC threshold-cardinality
           handoffs, or reverse/cofiltration wrappers.  The immediate
           theorem-facing route is: (1) try to assemble a named exact
           full-subgraph Theorem 2.4.3/Lemma 2.4.5 statement from
           `VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`;
           (2) compare the exposed countability, coordinate-measurability,
           measurable integrable-envelope, and full-subgraph VC assumptions
           against the book statement; (3) if exact textbook entropy/VC
           hypotheses still do not match, record the precise missing bridge and
           continue to the next theorem-critical Chapter 1/2 primitive instead
           of manufacturing weaker wrappers.
READY      Definition 2.2.3 semimetric covering/packing comparison layer.
READY      Definition 2.3.3 P-measurable class primitive, countable constructor, bounded Example 2.3.4 handoff, and deterministic finite-cover supremum bound.
DEFERRED-EXAMPLE Example 2.4.2 exact quantile-grid closure and empirical-CDF report unless a theorem needs it.
FOUNDATION Chapter 1 weak-convergence/tightness/product/Hilbert wrappers are real proof targets.
BLOCKED    Exact arbitrary-map/nonmeasurable/representation layers need new primitives.
```

The exact current blocker and the next primitive declarations are maintained
in `docs/vdvw_current_blocker_primitive_plan.md`; this dashboard should not be
used as the only source for choosing the next low-level proof target.

2026-05-04 `/goal` monitor update: the finite coordinate-code image/product
cardinality bridge is now compiled in `CoveringPrimitive.lean` as
`finite_coordinateCode_image`,
`coordinateCode_image_toFinset_card_le_prod`, and the coordinate pointwise-code
empirical-cover consumers.  Do not repeat that bookkeeping layer.  The next
Theorem 2.4.3 quantized-grid target is the concrete bounded trace code plus
the VC/subgraph/grid cardinality theorem strong enough to feed the fixed-radius
side-condition package.

2026-05-04 follow-up: the scalar-quantizer-to-coordinate-code cover bridge is
also compiled as
`empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_card_le` with the
matching finite-cover witness theorem.  The next target is therefore the real
bounded grid/rounding instantiation and its VC/subgraph/grid count, not the
abstract quantizer-to-cover reduction.

2026-05-04 follow-up: the decoder-error grid interface is now also compiled as
`empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_decode_error_card_le`.
The next proof target should instantiate this with actual finite grid cells for
bounded truncated values and then prove the theorem-facing cardinality bound.

2026-05-04 follow-up: nearest-integer rounding is now connected to empirical
covers by
`empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_card_le`.
The next target is finite integer-code interval membership/cardinality under
bounded truncated values, then VC/subgraph/grid cardinality control.

2026-05-04 follow-up: rounded-code membership in finite symmetric integer
intervals is now compiled as
`empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_interval_card_le`.
The bounded rounding-grid closure is now also compiled:
`round_div_mem_intInterval_of_abs_le` derives rounded-code interval membership
from `|x| <= M`, `card_int_symmetric_Icc` normalizes the symmetric integer
interval cardinality, and
`empiricalL1CoveringNumber_le_of_roundingQuantizer_uniform_abs_bound_card_le`
gives the uniform grid cover with terminal count `(2 * B + 1)^n`.  Next target:
use this only under honest finite/discretized hypotheses and prove the sharper
VC/subgraph/grid cardinality control needed for the general Theorem 2.4.3
fixed-radius side-condition package.

2026-05-04 follow-up: the general VC/subgraph route now has an approximate
threshold-signature empirical-cover bridge in `ThresholdCoding.lean`.
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_gap_grid_uniform_vc_card_le`
combines a finite threshold grid hitting every gap wider than `epsilon`, fixed
threshold-count `k`, and uniform VC dimension `d` of the threshold indicator
families to bound the empirical covering number by
`(((d + 2) * (n + 1)^d)^k)`.  Next target: instantiate the finite gap-grid
condition for bounded truncated values and package the resulting fixed-radius
selected side conditions for Theorem 2.4.3.

2026-05-04 follow-up: the bounded truncated-value threshold grid is now
instantiated by `integerMultipleThresholdGrid` in `ThresholdCoding.lean`.
`exists_integerMultipleThresholdGrid_between_of_bounds` proves the concrete
integer-ceiling gap witness, and
`empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_uniform_vc_card_le`
feeds bounded sampled values plus per-threshold VC bounds into the empirical
covering-number estimate.  Next target: discharge or honestly package the
remaining theorem-facing side conditions for fixed-radius Theorem 2.4.3:
integer-grid cardinality, truncated-value boundedness, and uniform
threshold/subgraph VC control.

2026-05-04 follow-up: the integer-grid cardinality side condition is now
compiled.  `integerMultipleThresholdGrid_nat_card_le` bounds the concrete grid
by `2 * bound + 1`, and
`empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_nat_uniform_abs_bound_vc_card_le`
is the envelope-friendly empirical-cover consumer under coordinatewise
absolute boundedness plus uniform fixed-threshold VC.  Next target: feed this
into the selected fixed-radius Theorem 2.4.3 package under honest
truncation-bound and threshold/subgraph VC assumptions.

2026-05-04 follow-up: the integer-grid route now reaches the selected
fixed-radius tail/UI package.  `Theorem243.lean` adds the direct random
empirical-covering-number bridge from deterministic
`empiricalL1CoveringNumber` bounds and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_abs_bound_vc`.
Next target: compose this package with the existing untruncated Theorem 2.4.3
consumer and keep the remaining structural assumptions explicit.

2026-05-04 follow-up: the integer-grid route now reaches the centered
untruncated Theorem 2.4.3 convergence conclusion under explicit structural
hypotheses via
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_abs_bound_vc`.
Next target: reduce the explicit truncated-value integer bound and per-grid
threshold VC assumptions to textbook-facing envelope/subgraph-VC hypotheses.

2026-05-04 follow-up: the selected fixed-radius package now has an
envelope-bound constructor,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_bound_vc`.
It reuses `abs_vdVWTruncatedClassFun_le_M`, so the sampled absolute-bound
field is replaced by the arithmetic domination `M <= bound * eta`.  Next
target: add the matching untruncated consumer and then reduce threshold VC to
a textbook-facing subgraph/VC class condition.

2026-05-04 follow-up: the canonical integer-grid radius is compiled as
`vdVWIntegerGridRadius M eta = Nat.ceil (M / eta)`, with
`vdVWIntegerGridRadius_mul_eta_ge` proving the required scaled domination.
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_vc`
now packages the selected fixed-radius route with no caller-supplied grid
radius arithmetic.
The matching untruncated consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_vc`
is also compiled, so the remaining integer-grid route blocker is the
textbook-facing reduction from subgraph/VC assumptions to the per-grid
threshold VC hypothesis.
2026-05-04 follow-up: `VdVWUniformThresholdVCSubgraphBound` now packages the
uniform all-threshold empirical VC input, and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_subgraph_vc`
feeds it into the canonical selected fixed-radius package.  Remaining gap:
connect the actual textbook VC-subgraph condition for truncated classes to
this uniform threshold predicate and consume it in the final untruncated route.
2026-05-04 follow-up: the untruncated route now has the matching consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_subgraph_vc`.
The current blocker is therefore the mathematical VC-subgraph implication
itself, not per-grid packaging.
2026-05-04 follow-up: the lifted subgraph trace bridge is now compiled:
`empiricalSubgraphTraceSetFamily`,
`empiricalBinaryTraceSetFamily_thresholdIndicatorClassFun_eq_empiricalSubgraphTraceSetFamily`,
`VdVWUniformSubgraphVCBound`, and
`VdVWUniformSubgraphVCBound.toUniformThresholdVCSubgraphBound`.  The selected
fixed-radius package also has
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`,
so the VC/subgraph-to-threshold direction is now formalized.
2026-05-04 follow-up: the direct untruncated full-subgraph consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`
is compiled.  Next target: package this as the named final Theorem 2.4.3
side-condition theorem while keeping remaining measurability/integrability and
Rademacher assumptions explicit.
2026-05-04 follow-up: that package is now compiled as
`VdVWTheorem243FullSubgraphSideConditions`, with consumer
`VdVWTheorem243FullSubgraphSideConditions.centered_untruncated_convergesInOuterProbabilityConst_zero`.
It is data-carrying because it includes measurable-cover witnesses.
2026-05-04 follow-up: the simplified constructor is now consumed by
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_fullSubgraph_integrable`,
which keeps the theorem-facing full-subgraph route while hiding all derived
integrability/measurable-cover witnesses behind
`VdVWTheorem243FullSubgraphSideConditions.of_integrable`.
2026-05-04 follow-up: the full-subgraph integrable route now also has iid
Rademacher and canonical terminal-sample wrappers, so the caller-facing
auxiliary sign space and `X`/sample-path plumbing can be discharged by
`exists_common_iid_vdVWRademacherSigns` and `vdVWCanonicalSampleProcess`.
2026-05-04 follow-up: ordinary class-member integrability is now derived
internally from the measurable class, envelope domination, and
`Integrable envelope P` via `integrable_classFun_of_integrable_envelope`.
The full-subgraph constructor and iid/canonical wrappers no longer expose a
separate `hclassIntegrable` argument.
2026-05-04 follow-up: the finite-class untruncated consumer and its iid and
canonical wrappers now use the same envelope-integrability helper internally,
so finite-class callers also no longer supply ordinary class-member
integrability separately.
2026-05-04 follow-up: the selected fixed-radius tail/UI consumer and the
integer-grid/finite-threshold/full-subgraph bridge stack now also derive
ordinary class-member integrability from the envelope; these theorem-facing
routes no longer take a separate `hclassIntegrable` argument.
2026-05-04 follow-up: the proof-carrying
`VdVWTheorem243FullSubgraphSideConditions` package itself no longer stores a
separate class-member integrability field; all remaining uses are derived
inside the constructor from the envelope helper.
2026-05-04 follow-up: constructor
`VdVWTheorem243FullSubgraphSideConditions.of_integrable` now derives
`htruncIntegrable` from ordinary class integrability plus the measurable
truncation/envelope data, reducing one explicit final side-condition field.
2026-05-04 follow-up: the same constructor now also derives
`hbdd_truncated`.  The new local lemmas prove that nonnegative truncation
levels have centered bound `2*M`, while negative truncation levels make the
truncated class identically zero.
2026-05-04 follow-up: the constructor is now `noncomputable` and also derives
`Ucentered` from
`VdVWMeasurableCover.centered_truncated_of_countable_of_coordinate`, using the
countability of `Index` plus coordinate measurability.
2026-05-04 follow-up: the same constructor now also derives
`hghostExpectationIntegrable`, `hsplitSupIntegrable`, and
`hsampleSupIntegrable`.  The new countable split product-copy integrability
lemma uses the uniform pair-difference truncation bound and countable supremum
measurability, the ghost-expectation field follows by
`Integrable.integral_prod_left`, and the sample-side Rademacher supremum
integrability follows from the all-level truncated bound
`abs_vdVWTruncatedClassFun_le_max_M_zero`.
2026-05-04 follow-up: the constructor now also derives the remaining
random-sign block: `hrandomIntegralIntegrable`, `Urandom`,
`hproductSupIntegrable`, and `hsignSupIntegrable`.  The countable
Rademacher-product integrability lemmas reuse `HasSubgaussianMGF.integrable`,
product integrability/Fubini, and the countable supremum measurability pattern;
the product measurable cover follows from `VdVWMeasurableCover.ofAEMeasurable`.
2026-05-04 follow-up: the constructor now also derives
`hcenteredSupIntegrable`.  New supporting lemmas bound a weighted supremum from
a uniform class bound and prove countable centered truncated supremum
integrability under `P^n`.
2026-05-04 follow-up: the constructor now also derives
`hpairSupIntegrable`.  The new countable ghost-copy pair theorem uses the
uniform `2*max M 0` pair-difference truncation bound plus countable supremum
measurability.
2026-05-04 `/goal` follow-up: the Theorem 2.4.3 centered untruncated
convergence layer now has a finite-product GC-deviation bridge.  New compiled
declarations are `VdVWOuterProbabilityUniformDeviationConstOn`,
`vdVWWeightedSampleSum_centered_const_inv_eq_empiricalAverage_sub`, and
`VdVWOuterProbabilityUniformDeviationConstOn_of_centered_weightedSupremum`.
This converts centered `1/n` weighted-supremum convergence over
`SampleAt Observation n` into convergence of the usual uniform empirical
deviation bad event on the same variable finite-product spaces.  It is still
not the exact textbook Theorem 2.4.3 report: the remaining work is to align the
book entropy/full-subgraph assumptions with the current side-condition route
and then add the in-mean and almost-sure/reverse-submartingale conclusions.
2026-05-04 follow-up: the finite-product GC-deviation bridge is now consumed by
the current full-subgraph and finite-class routes.  New compiled declarations
are `abs_integral_classFun_le_integral_envelope`,
`bddAbove_vdVWWeightedClassValueSet_centered_of_integrable_envelope`,
`VdVWOuterProbabilityUniformDeviationConstOn_of_fullSubgraph_integrable`,
`VdVWOuterProbabilityUniformDeviationConstOn_of_fullSubgraph_integrable_canonical`,
and `VdVWOuterProbabilityUniformDeviationConstOn_of_finite_indexClass_canonical`.
The route now reaches the finite-product uniform-deviation conclusion under
the full-subgraph/canonical and finite-class/canonical hypotheses, while the
exact in-mean and a.s. textbook conclusions remain pending.
2026-05-04 `/goal` follow-up: the finite-product uniform-deviation conclusion
now also feeds the fixed infinite iid-process outer-probability GC predicate.
New compiled declarations are
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_uniformDeviationConstOn_canonical`,
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical`,
and `VdVWOuterProbabilityPGlivenkoCantelliClass_of_finite_indexClass_canonical`.
The bridge uses `vdVWInfiniteProductMeasure_measurePreserving_firstNSample`
and mathlib `Measure.le_map_apply`, so it works for arbitrary outer bad events
without requiring measurable bad-event sets.
2026-05-04 `/goal` follow-up: the fixed-iid outer-probability branch is now
packaged into the local book-style `P`-Glivenko-Cantelli predicate, together
with the current in-mean conclusion.  New compiled declarations are
`vdVWPGlivenkoCantelliClass_of_outerProbability`,
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_and_inMean_canonical`,
and
`VdVWTheorem243_finite_indexClass_pGlivenkoCantelli_and_inMean_canonical`.
2026-05-04 `/goal` follow-up: the current in-mean centered-supremum
conclusion now also has a fixed infinite-product form for the named Lemma
2.4.5 statistic.  New compiled declarations are
`integral_vdVWLemma245CenteredEmpiricalSupremum_eq`,
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finiteProduct`,
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_fullSubgraph_integrable_canonical`,
and
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finite_indexClass_canonical`.
2026-05-04 `/goal` follow-up: the centered-supremum outer-probability
convergence now also has a fixed infinite-product form for the named Lemma
2.4.5 statistic.  New compiled declarations are
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finiteProduct`,
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_fullSubgraph_integrable_canonical`,
and
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finite_indexClass_canonical`.
2026-05-04 follow-up: the in-mean adapter layer has started.  New compiled
declarations are
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_tailExpectation`
and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation`.
These turn the centered full-subgraph outer-probability route into ordinary
mean convergence of the centered weighted supremum under explicit
measurability, integrability, and varying-domain tail/UI assumptions.  The
book-level task still has to discharge those side conditions from the theorem
hypotheses and then prove the a.s./reverse-submartingale conclusion.
2026-05-04 follow-up: the countable/envelope analytic witnesses for that
in-mean route are now compiled.  New declarations are
`vdVWWeightedClassSupremum_centered_le_sum_abs_mul_envelope_add_integral`,
`measurable_vdVWWeightedClassSupremum_centered_of_countable`,
`integrable_vdVWWeightedClassSupremum_centered_of_countable`, and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable`.
The full-subgraph in-mean consumer no longer needs caller-supplied
measurability/integrability witnesses for the centered supremum; only the
genuine varying-domain tail/UI condition remains explicit.
Additional compiled wrappers
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable_iidRademacher`
and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable_canonical`
remove the auxiliary Rademacher sign-space and canonical sample-path process
choices from this in-mean route.
2026-05-04 follow-up: the deterministic tail-reduction bridge
`vdVWWeightedClassSupremum_centered_invNat_le_empiricalAverage_envelope_add_integral`
now compiles.  For positive sample sizes it bounds the centered `1/n`
weighted supremum by the empirical envelope average plus `∫ envelope dP`.
This narrows the remaining in-mean tail/UI blocker to a tail expectation
theorem for empirical averages of a nonnegative integrable envelope.
2026-05-04 follow-up: that empirical-average tail/UI layer is now compiled.
New declarations are `measurable_empiricalAverage`,
`integrable_empiricalAverage`,
`empiricalAverage_le_two_mul_empiricalAverage_tail_half_of_lt`,
`integral_indicator_empiricalAverage_envelope_tail_le_two_integral_tail_half`,
and `empiricalAverage_envelope_tailExpectation_condition_of_integrable`.
The next closure is to combine this empirical-average tail condition with the
centered-supremum envelope domination to discharge the explicit `hTail` input
in the current Theorem 2.4.3 in-mean consumers.
2026-05-04 follow-up: that closure is now compiled.  The new countable
integrable-envelope theorem
`centered_vdVWWeightedClassSupremum_tailExpectation_condition_of_integrable_envelope`
discharges the centered-supremum varying-domain tail/UI condition from the
empirical-average tail estimate and the deterministic envelope domination.
The no-tail in-mean consumers
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable`,
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable_iidRademacher`,
and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable_canonical`
now remove the caller-facing tail/UI, auxiliary sign-space, and sample-path
plumbing from the countable/envelope full-subgraph in-mean route.  The next
closure is to package this with the existing uniform-deviation route and keep
the remaining full-subgraph/entropy assumptions explicit before attacking the
a.s./reverse-submartingale conclusion.
2026-05-04 follow-up: that joint package is now compiled.  The new declarations
`VdVWTheorem243_fullSubgraph_integrable_outerProbabilityUniformDeviation_and_inMean`
and
`VdVWTheorem243_fullSubgraph_integrable_outerProbabilityUniformDeviation_and_inMean_canonical`
return both finite-product outer-probability uniform-deviation convergence and
ordinary in-mean convergence of the centered weighted supremum under the
current explicit full-subgraph structural assumptions.  This is still a
theorem layer, not the exact textbook Theorem 2.4.3: remaining work is the
structural entropy/trace-grid alignment and the a.s./reverse-submartingale
conclusion.
2026-05-04 follow-up: the finite-class canonical route now also has the
matching no-tail in-mean and paired conclusion package:
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_finite_indexClass_canonical`
and
`VdVWTheorem243_finite_indexClass_outerProbabilityUniformDeviation_and_inMean_canonical`.
This aligns finite classes with the current full-subgraph package for the
outer-probability plus in-mean parts of Theorem 2.4.3; the almost-sure part
still waits on Lemma 2.4.5 reverse/cofiltration convergence.
2026-05-04 follow-up: the pinned-mathlib martingale-convergence substrate for
Lemma 2.4.5 is now wrapped locally as
`vdVW_submartingale_ae_tendsto_limitProcess_of_eLpNorm_bdd`, using
`Submartingale.ae_tendsto_limitProcess`.  This does not close the exact
reverse-submartingale lemma; the remaining blocker is the VdV&W-specific
permutation-symmetric decreasing filtration and adapted measurable-cover
construction.
2026-05-04 follow-up: the exterior product-coordinate cofiltration needed for
that reverse-filtration route is now also wrapped locally.  New declarations
`vdVWExteriorCofiltration`,
`vdVWExteriorCofiltration_eq_cylinderEventsCompl`,
`vdVWExteriorCofiltration_apply`, `vdVWExteriorCofiltration_le_pi`, and
`vdVWExteriorCofiltration_antitone` reuse mathlib
`Filtration.cylinderEventsCompl` and record the shrink direction as finite
coordinate sets grow.  This is still substrate only; the exact VdV&W
permutation-symmetric filtration and reverse-submartingale reduction remain
open.
2026-05-04 follow-up: the finite-product iid coordinate-permutation layer is
now compiled in `PMeasurable.lean`.  New declarations
`vdVWFinCoordinatePermMeasurableEquiv`,
`vdVWFinCoordinatePermMeasurableEquiv_apply_apply`,
`vdVWProductMeasure_measurePreserving_finCoordinatePerm`, and
`integral_vdVWProductMeasure_comp_finCoordinatePerm` reuse mathlib
`MeasurableEquiv.piCongrLeft` and
`MeasureTheory.measurePreserving_piCongrLeft`.  The empirical-sum consequences
`vdVWWeightedSampleSum_finCoordinatePerm`,
`vdVWWeightedSampleSum_uniform_finCoordinatePerm`, and
`vdVWWeightedClassSupremum_uniform_finCoordinatePerm` also compile, using
mathlib `Equiv.sum_comp` for the finite reindexing.  This removes
finite-sample permutation invariance as a blocker for symmetric sample
expressions and uniform empirical suprema; it does not yet construct the
decreasing VdV&W symmetric sigma-fields or prove the reverse-submartingale
handoff.
2026-05-04 follow-up: the finite-to-infinite bridge for the Lemma 2.4.5
generator shape is compiled.  New declarations `vdVWFirstNSample`,
`measurable_vdVWFirstNSample`, `vdVWPermuteFirstN`,
`VdVWFirstNPermutationSymmetric`, `vdVWFirstNSample_permuteFirstN`, and
`vdVWFirstNPermutationSymmetric_uniformClassSupremum` show that the
infinite-sequence statistic induced by the uniform empirical supremum is
symmetric in the first `n` arguments.  Remaining work is the generated
sigma-field `Σ_n`, its decreasing direction, adapted measurable-cover
versions, and the reverse-submartingale handoff.
2026-05-04 follow-up: the generated `Σ_n` substrate is now compiled in
`PMeasurable.lean`.  New declarations include `VdVWNatPermFixesFrom`,
`vdVWPermuteNatSequence`, `vdVWNatPermRestrictFin`,
`VdVWPermutationSymmetricFrom`,
`VdVWPermutationSymmetricGeneratorSet`,
`vdVWPermutationSymmetricMeasurableSpace`,
`vdVWPermutationSymmetricMeasurableSpace_antitone`,
`measurable_vdVWPermutationSymmetricMeasurableSpace_of_symmetric`,
`vdVWFirstNSample_permuteNatSequence`, and
`VdVWPermutationSymmetricFrom_uniformClassSupremum`.  This closes the
generated sigma-field and decreasing-direction substrate for the
permutation-symmetric route.  Remaining work is now adapted
measurable-cover/supremum process construction over `Σ_n` and the
reverse-submartingale inequality/convergence handoff.
2026-05-04 follow-up: the first adapted `Σ_n` empirical-supremum bridge is
compiled as
`measurable_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`.
It combines the countable weighted-supremum measurability theorem with
`VdVWPermutationSymmetricFrom_uniformClassSupremum`, so the countable
coordinate-measurable uniform empirical supremum is now `Σ_n`-measurable.
Remaining work: measurable-cover version plus reverse-submartingale
inequality/convergence over decreasing `Σ_n`.
2026-05-04 follow-up: the adapted measurable-cover version is now compiled as
`VdVWMeasurableCover_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`.
It packages the nonnegative `ENNReal.ofReal` empirical supremum as a
`VdVWMeasurableCover` over the explicit source sigma-field `Σ_n`.  Remaining
work is the reverse-submartingale comparison/convergence reduction.
2026-05-04 follow-up: the decreasing `Σ_n` family is now a mathlib
filtration over `ℕᵒᵈ`, with
`vdVWPermutationSymmetricMeasurableSpace_le_pi`,
`vdVWPermutationSymmetricCofiltration`,
`vdVWPermutationSymmetricCofiltration_apply`, and
`adapted_vdVWPermutationSymmetricCofiltration_uniformClassSupremum_of_countable`.
Remaining work is now the conditional-expectation/reverse-submartingale
comparison and L1 boundedness handoff.
2026-05-04 follow-up: the ordinary-filtration conditional-expectation
martingale/UI/convergence handoff is now compiled.  New declarations
`vdVW_condExp_submartingale`, `vdVW_condExp_uniformIntegrable_filtration`,
`vdVW_condExp_ae_tendsto_limitProcess_of_integrable`,
`vdVW_condExp_tendsto_eLpNorm_one_limitProcess_of_integrable`,
`vdVW_condExp_ae_tendsto_condExp_iSup`,
`vdVW_condExp_tendsto_eLpNorm_one_condExp_iSup`, and
`vdVW_condExp_ae_tendsto_limitProcess_of_eLpNorm_le` wrap pinned mathlib
`martingale_condExp`, conditional-expectation L1 contraction, UI, martingale
convergence, and Levy upward convergence.  The remaining Lemma 2.4.5 gap is
now the VdV&W-specific reverse/permutation-symmetric comparison from the
decreasing `Σ_n` empirical-supremum covers into that ordinary conditional
expectation framework, plus the terminal integrability/L1-bound discharge from
the envelope assumptions.
2026-05-04 follow-up: the finite-to-infinite iid sample bridge is now
compiled.  `PMeasurable.lean` adds `vdVWInfiniteProductMeasure`,
`vdVWInfiniteProductMeasure_measurePreserving_firstNSample`,
`vdVWFirstNSample_hasLaw_vdVWProductMeasure`, and
`integral_vdVWInfiniteProductMeasure_firstNSample`; `Theorem243.lean` adds
the truncated and untruncated infinite-product integrability lifts for
countable centered empirical suprema.  Remaining Lemma 2.4.5 work is the
actual reverse/permutation-symmetric comparison, not first-coordinate law or
finite-to-infinite integrability transport.
2026-05-04 follow-up: the same bridge now has exact integral and `L^p`
seminorm transport for truncated and untruncated centered empirical suprema:
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_truncated_eq`,
`eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_truncated_eq`,
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_eq`, and
`eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_eq`.
Remaining work is the structural reverse/permutation-symmetric comparison
over `Σ_n`, plus using these identities to discharge the L1-bound input.
2026-05-04 follow-up: the deterministic leave-one-out part of Lemma 2.4.5 is
now compiled: `sum_leaveOneOut_eq_nat_mul_sum`,
`vdVWWeightedSampleSum_uniform_leaveOneOut_average_eq`, and
`vdVWWeightedClassSupremum_uniform_le_leaveOneOutAverage`.  This closes the
sample-path inequality before conditional expectations.  Remaining work is the
conditional-expectation symmetry of the leave-one-out terms given `Σ_{n+1}`
and the resulting reverse-submartingale comparison.
2026-05-04 follow-up: the generic conditional-expectation comparison part of
that reverse-submartingale comparison is now compiled:
`vdVW_condExp_comparison_of_ae_le_of_condExp_eq`,
`vdVW_condExp_uniformAverage_eq_of_finite_condExp_symmetry`, and
`vdVW_condExp_reverseComparison_of_ae_le_uniformAverage`.  These proofs reuse
mathlib `condExp_of_stronglyMeasurable`, `condExp_mono`,
`condExp_finsetSum`, `condExp_smul`, and `ae_all_iff`.  Remaining work is now
the VdV&W-specific conditional symmetry theorem for the leave-one-out terms
given `Σ_{n+1}`, then instantiation of the bridge with the existing
deterministic leave-one-out supremum inequality.
2026-05-04 follow-up: the two structural primitives for that conditional
symmetry proof are now compiled in `PMeasurable.lean`: every `Σ_n`-measurable
set is invariant under coordinate permutations fixing the tail from `n`
onward, and the iid infinite product measure `P^∞` is invariant under
coordinate permutations.  New declarations include
`preimage_vdVWPermuteNatSequence_eq_of_measurableSet_permutationSymmetric`,
`measurable_vdVWPermuteNatSequence_permutationSymmetric`, and
`vdVWInfiniteProductMeasure_measurePreserving_permuteNatSequence`.  Remaining
work is the set-integral/conditional-expectation equality for the actual
leave-one-out terms.
2026-05-04 follow-up: the set-integral and conditional-expectation invariance
bridges over `Σ_n` are now compiled:
`setIntegral_vdVWInfiniteProductMeasure_comp_permuteNatSequence_of_measurableSet_permutationSymmetric`,
`vdVW_condExp_eq_of_forall_setIntegral_eq`, and
`vdVW_condExp_comp_permuteNatSequence_eq_of_permutationSymmetric`.  Thus any
integrable statistic composed with a tail-fixing coordinate permutation has
the same conditional expectation over `Σ_n`.  Remaining Lemma 2.4.5 work is
the deterministic leave-one-out transport identifying each omitted term as a
permuted copy of a distinguished omitted term, then final instantiation of the
reverse-comparison bridge.
2026-05-04 follow-up: that transport and instantiation are now compiled.  New
declarations include `vdVWLeaveOneOutToLastPerm`,
`removeNth_last_vdVWFinCoordinatePerm_leaveOneOutToLastPerm`,
`vdVWNatPermOfFin`, `VdVWNatPermFixesFrom_natPermOfFin`,
`vdVWFirstNSample_permuteNatSequence_natPermOfFin`,
`vdVWWeightedClassSupremum_leaveOneOut_last_comp_natPermOfFin_eq`,
`vdVW_condExp_leaveOneOut_uniformClassSupremum_eq_last`, and
`vdVW_condExp_reverseComparison_uniformClassSupremum_le_lastLeaveOneOut`.
The remaining Lemma 2.4.5 work is now the measurable-cover/integrability and
L1-boundedness instantiation of this reverse-comparison handoff, followed by
the reverse-submartingale convergence reduction.
2026-05-04 follow-up: the countable integrable-envelope instantiation is now
compiled as
`vdVW_condExp_reverseComparison_centered_uniformClassSupremum_le_lastLeaveOneOut_of_countable`.
This discharges the comparison theorem's strong measurability, integrability,
and bounded-value-set side conditions for centered empirical suprema under
countability, coordinate measurability, and an integrable envelope.  Remaining
Lemma 2.4.5 work is now the final reverse-submartingale convergence reduction
and uniform L1/eLpNorm bound.
2026-05-04 follow-up: the uniform bound part is now compiled.  New
declarations are
`integral_vdVWWeightedClassSupremum_centered_invNat_le_two_integral_envelope`,
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_invNat_le_two_integral_envelope`,
`eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_invNat_le_two_integral_envelope`,
and `vdVW_condExp_comparison_and_ae_tendsto_limitProcess_of_eLpNorm_le`.
The remaining Lemma 2.4.5 work is now the actual reverse-filtration
convergence reduction for the decreasing permutation-symmetric `Σ_n`
cofiltration, not the envelope L1/eLpNorm estimate.
2026-05-04 follow-up: the theorem-specific positive-`n` row handoff is also
compiled as
`vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_of_countable`.
It consumes the centered leave-one-out comparison and the envelope `eLpNorm`
bound through the generic conditional-expectation comparison/convergence
adapter.  Remaining Lemma 2.4.5 work is now only the global
reverse-filtration convergence/reindexing step.
2026-05-04 follow-up: all positive row handoffs are now also packaged on one
full-measure set as
`vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_allRows_of_countable`.
The theorem keeps row-wise filtrations explicit, so it avoids the false claim
that the decreasing `Σ_n` family is already an increasing mathlib filtration.
The only remaining Lemma 2.4.5 blocker is the reverse/cofiltration convergence
theorem itself.
2026-05-04 follow-up: the all-row package now feeds the theorem-facing
consumer
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseCofiltrationHandoff`,
using the named displays `vdVWLemma245CenteredEmpiricalSupremum` and
`vdVWLemma245LeaveOneOutCenteredSupremum`.  This closes the local handoff from
countable class/envelope hypotheses to the final a.e. centered-supremum
convergence statement under one explicit reverse/cofiltration convergence
primitive.  The remaining gap is still the mathematical reverse
martingale/cofiltration convergence theorem for the decreasing
permutation-symmetric `Σ_n` fields.
2026-05-04 follow-up: the handoff is now cleaner.  The canonical constant-row
consumer
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseCofiltrationHandoff_constRows`
and the comparison-only consumer
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseComparisonHandoff`
compile.  The next Lemma 2.4.5 target is now exactly the reverse/cofiltration
convergence theorem from the all-row inequalities
`Z_{n+1} <= E[Z_n^{(-last)} | Σ_{n+1}]` to a.e. convergence of `Z_{n+1}`;
the auxiliary ordinary-row `limitProcess` data is no longer part of the
preferred theorem statement.

## Verification Monitor

Latest targeted verification includes the Theorem 2.4.3 theorem module after
the Lemma 2.4.5 countable integrable-envelope reverse-comparison consumer and
uniform L1/eLpNorm bound on 2026-05-04.

```text
lake env lean StatInference/EmpiricalProcess/Theorem243.lean
lake build
Build completed successfully (8427 jobs).

rg -n '\b(sorry|admit|axiom|unsafe)\b' StatInference -g '*.lean'
No matches.
```

For the latest pushed proof-layer commit, use:

```text
git log --oneline -5
```

## Report Monitor

| Report folder | Status |
| --- | --- |
| `Reports/Theorem_2_4_1_Bracketing_GC/` | Existing exact-theorem report for Theorem 2.4.1. |
| Future `Reports/VdVW_<item>_<slug>/` | Created only after an exact textbook theorem or lemma is fully proved in Lean. |

Intermediate proof layers should update this dashboard and the blueprint, not
create formal theorem reports.

2026-05-04 `/goal` follow-up: the Lemma 2.4.5 zero-limit reduction is now
compiled.  New theorem-facing declarations in `Theorem243.lean` are
`ae_tendsto_zero_of_ae_tendsto_limit_of_subseq_tendsto_zero`,
`ae_subseq_tendsto_zero_of_eventually_notMem_bad_events`,
`ae_subseq_tendsto_zero_of_summable_bad_events`,
`ae_subseq_tendsto_zero_of_bad_measure_le_summable_bound`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_subseq`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_summable_subseq_bad`,
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_bad_measure_le_summable_bound`.
The remaining a.s. Lemma 2.4.5 task is now more concrete: combine the existing
fixed-space outer-probability convergence of the centered empirical supremum
with a Borel-Cantelli subsequence-selection theorem, then feed the resulting
summable-bad-event subsequence or summable upper bound into the compiled
zero-limit consumer.

2026-05-04 `/goal` follow-up: the Borel-Cantelli subsequence-selection theorem
from fixed-space outer-probability convergence is now compiled.  The main new
declarations are
`exists_subseq_bad_measure_le_of_vdVWConvergesInOuterProbability_zero`,
`ae_tendsto_zero_of_ae_tendsto_limit_of_vdVWConvergesInOuterProbability_zero`,
its canonical inverse-threshold/geometric-bound specialization, and the two
Lemma 2.4.5 consumers
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_outerProbability`
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_outerProbability_invNat_geometric`.
So the zero-identification part is no longer blocked: once the
reverse-comparison/cofiltration handoff supplies a.e. convergence to some
finite limit and the fixed-space outer-probability endpoint is available, the
centered empirical supremum converges a.e. to zero.  Remaining exact work is
the reverse/cofiltration comparison theorem itself and the final wiring to the
Theorem 2.4.3 outer-probability endpoint.

2026-05-04 `/goal` follow-up: the final wiring to the currently compiled
Theorem 2.4.3 fixed-space endpoints is now done for the canonical
full-subgraph and finite-class routes.  The new declarations are
`VdVWConvergesInOuterProbability_nat_succ`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_reverseComparisonHandoff`,
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_finite_indexClass_canonical_of_reverseComparisonHandoff`.
These consumers leave only the genuine reverse-comparison/cofiltration handoff
as an explicit assumption for those routes.

2026-05-04 `/goal` follow-up: the finite-class canonical Lemma 2.4.5 endpoint
now has a direct proof from iid coordinate SLLN, without the
reverse/cofiltration assumption.  New compiled declarations are
`vdVWInfiniteProductMeasure_coordinate_hasLaw`,
`vdVWInfiniteProductMeasure_iIndepFun_coordinates`,
`ae_forall_mem_tendsto_empiricalAverage_sub_integral_zero_of_countable_canonical`,
`vdVWLemma245CenteredEmpiricalSupremum_le_sum_abs_empiricalAverage_sub_integral_of_finite`,
and
`vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_zero_of_finite_indexClass_canonical_slln`.
This is a theorem-facing closure for finite index classes: the remaining
reverse/permutation-symmetric cofiltration blocker is now only needed for
arbitrary/countable classes beyond the finite SLLN route.

2026-05-04 follow-up: the direct finite-class SLLN route now reaches canonical
book-style GC endpoints.  New compiled declarations are
`UniformDeviationTendstoZeroOn_of_vdVWLemma245CenteredEmpiricalSupremum_tendsto_zero_canonical`,
`VdVWAlmostSureGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`,
`VdVWOuterAlmostSurePGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`,
and `VdVWPGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`.
This closes the finite-index outer-a.s. branch without the
reverse/cofiltration assumption; arbitrary/countable classes still need the
general reverse/permutation-symmetric theorem or another structural route.

2026-05-04 follow-up: the finite-class canonical SLLN/GC endpoint was tightened
again: the direct finite-class route no longer assumes `[Countable Index]`.
The new bridge
`ae_forall_mem_tendsto_empiricalAverage_sub_integral_zero_of_finite_canonical`
uses a finite intersection over `hindex_finite.toFinset`; the finite-class
SLLN and canonical outer-a.s. GC endpoints now depend only on actual class
finiteness plus the envelope/measurability assumptions.

2026-05-04 follow-up: the finite-class canonical route now also exports the
direct outer-probability endpoint without global `[Countable Index]`.  The
new general bridge
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalAverage`
converts an outer-a.s. `P`-GC proof plus countable empirical-risk
a.e.-measurability into the outer-probability branch.  The theorem-facing
finite-class consumer
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`
uses `hindex_finite.countable`,
`empiricalAverage_samplePath_aemeasurable_of_hasLaw`, and the canonical
coordinate law `vdVWInfiniteProductMeasure_coordinate_hasLaw`; the book-style
`VdVWPGlivenkoCantelliClass_of_finite_indexClass_canonical_slln` now enters
through this outer-probability branch.  This closes another finite-class
endpoint while leaving the arbitrary/countable-class reverse/cofiltration
blocker unchanged.

2026-05-04 follow-up: the arbitrary/countable-class Lemma 2.4.5 reverse
cofiltration gap is now exposed as the named Lean proposition
`VdVWLemma245ReverseCofiltrationHandoff`.  The new consumers
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_namedReverseCofiltrationHandoff`
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseCofiltrationHandoff_of_outerProbability_invNat_geometric`
compose this primitive with the already-compiled row comparisons,
martingale/limit-process wrappers, and fixed-space outer-probability
Borel-Cantelli route.  Search confirmed that mathlib currently supplies the
forward filtration martingale convergence APIs, but not the exact VdV&W
reverse/permutation-symmetric cofiltration theorem.  Next real proof work is
therefore the named primitive itself or a structural route that avoids it.

2026-05-04 follow-up: the full-subgraph route now has a consolidated
named-blocker package:
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_reverseCofiltrationHandoff`.
It returns the book-style `P`-GC branch, the in-mean centered-supremum
conclusion, and the Lemma 2.4.5 a.s. zero conclusion from the existing
full-subgraph hypotheses plus the single named reverse/cofiltration primitive.
The companion a.s. consumer is
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_reverseCofiltrationHandoff`.

2026-05-04 follow-up: the direct finite-class iid-SLLN route now has the
package
`VdVWTheorem243_finite_indexClass_pGlivenkoCantelli_and_lemma245_canonical_slln`.
It gives the direct outer-probability endpoint, direct outer-a.s. endpoint,
book-style `P`-GC predicate, and Lemma 2.4.5 a.s. zero endpoint without
ambient countability, an inhabited observation type, or the reverse
cofiltration primitive.  This is the clean finite-class closure; the
non-finite arbitrary/countable route still depends on
`VdVWLemma245ReverseCofiltrationHandoff`.

2026-05-04 follow-up: the named Lemma 2.4.5 centered statistic is now
measurable/adapted with respect to the permutation-symmetric cofiltration.  New
compiled declarations are
`measurable_vdVWPermutationSymmetricMeasurableSpace_vdVWLemma245CenteredEmpiricalSupremum_of_countable`,
`adapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_of_countable`,
and
`adapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_succ_of_countable`.
The same batch also adds
`vdVWLemma245CenteredEmpiricalSupremum_nonneg`,
`integrable_vdVWLemma245CenteredEmpiricalSupremum_of_countable`, and
`eLpNorm_vdVWLemma245CenteredEmpiricalSupremum_le_two_integral_envelope`.
This removes another bookkeeping layer from the non-finite Lemma 2.4.5 route:
the remaining blocker is the actual reverse/permutation-symmetric convergence
principle, not measurability, adaptedness, nonnegativity, or envelope `L¹`
control of the centered supremum process.

2026-05-04 follow-up: the centered process also now has the direct strong
adaptedness wrappers required by mathlib martingale APIs:
`stronglyAdapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_of_countable`
and
`stronglyAdapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_succ_of_countable`.
The remaining blocker is unchanged but sharper: prove the VdV&W
reverse/permutation-symmetric convergence theorem, not the process API
plumbing around it.

2026-05-04 follow-up: the reverse/cofiltration blocker now has an ordinary
submartingale sufficient-condition route.  New compiled declarations
`vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_of_submartingale` and
`VdVWLemma245ReverseCofiltrationHandoff.of_submartingale` combine mathlib's
`Submartingale.exists_ae_tendsto_of_bdd` with the named centered-supremum
`eLpNorm` envelope bound.  The next non-finite Lemma 2.4.5 target is therefore
very concrete: produce the ordinary `ℕ` submartingale realization of the
shifted process from the decreasing permutation-symmetric fields, or prove the
reverse convergence theorem directly.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3 package now has a direct
ordinary-submartingale variant:
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_submartingale`
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_submartingale`.
This means the downstream full-subgraph route can now be closed from one
ordinary submartingale realization of the shifted centered process, without
asking callers to supply the broader named reverse/cofiltration proposition.

2026-05-04 follow-up: the ordinary-submartingale realization has been reduced
to explicit constructor inputs by
`VdVWLemma245ReverseCofiltrationHandoff.of_condExp_step_nonneg`, using
mathlib's `submartingale_of_condExp_sub_nonneg_nat`.  The next proof target is
now the one-step conditional drift inequality for the shifted centered
supremum under a suitable ordinary filtration, together with strong
adaptedness for that filtration.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3 package now exposes that
constructor-level condition directly through
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_condExp_step_nonneg`
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_condExp_step_nonneg`.
The active non-finite-class target is therefore exactly: choose/build the
ordinary filtration, prove strong adaptedness of the shifted centered process,
and prove the one-step conditional drift inequality.

2026-05-04 follow-up: the first two parts of that target are now closed using
mathlib's natural filtration.  New compiled declarations include
`vdVWLemma245CenteredEmpiricalSupremumNaturalFiltration`,
`stronglyAdapted_vdVWLemma245CenteredEmpiricalSupremumNaturalFiltration`,
`VdVWLemma245ReverseCofiltrationHandoff.of_natural_condExp_step_nonneg`, and
the full-subgraph endpoint
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_natural_condExp_step_nonneg`.
This natural-filtration route is only a sufficient condition; it may be
stronger than the VdV&W row-wise reverse/permutation-symmetric proof and should
not be the default target unless a concrete drift proof appears.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3/Lemma 2.4.5 endpoint
now has a direct row-wise reverse-comparison package:
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_reverseComparisonHandoff`.
It combines the full-subgraph `P`-GC endpoint, in-mean endpoint, and existing
direct Lemma 2.4.5 zero consumer from the all-row comparison over
`Σ_{n+1}`.  The active non-finite-class target is therefore the actual
reverse/cofiltration convergence theorem that consumes the compiled all-row
conditional-expectation comparison, or an equivalent row-wise handoff.  Avoid
additional natural-filtration packaging unless it proves that theorem.

2026-05-04 follow-up: the ordinary martingale fallback now handles both signs.
New compiled declarations
`vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_of_supermartingale`,
`VdVWLemma245ReverseCofiltrationHandoff.of_supermartingale`, and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_supermartingale`
use mathlib `Supermartingale.neg` and `eLpNorm_neg` to reduce an ordinary
supermartingale realization to the same finite-limit and full-subgraph endpoint
as the submartingale route.  This keeps the reverse/cofiltration reindexing
lane flexible without changing the active blocker.

2026-05-04 follow-up: the supermartingale path now has the matching
constructor-level one-step drift endpoint:
`VdVWLemma245ReverseCofiltrationHandoff.of_condExp_step_nonpos` and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_condExp_step_nonpos`.
These consume mathlib `supermartingale_of_condExp_sub_nonneg_nat`, so future
reverse/cofiltration attempts can target the signed drift condition that is
actually produced by the reindexing.

2026-05-04 follow-up: the direct Lemma 2.4.5 reverse-comparison route now
matches the textbook display notation.  New compiled declarations
`vdVWLemma245LeaveOneOutCenteredSupremum_eq_centeredEmpiricalSupremum`,
`vdVW_condExp_reverseComparison_centeredEmpiricalSupremum_le_prev_of_countable`,
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_textbookReverseComparisonHandoff`
identify the distinguished leave-one-out statistic with the previous centered
empirical supremum and expose the inequality as
`E[‖P_n - P‖_F^* | Σ_{n+1}] ≥ ‖P_{n+1} - P‖_F^*`.  The active blocker remains
the genuine reverse/permutation-symmetric cofiltration convergence theorem,
not the leave-one-out notation.

2026-05-04 follow-up: that textbook-display route now reaches the full
Theorem 2.4.3/Lemma 2.4.5 package boundary.  New compiled declarations
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_textbookReverseComparisonHandoff_of_outerProbability_invNat_geometric`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_textbookReverseComparisonHandoff`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_textbookReverseComparisonHandoff`
combine the existing full-subgraph `P`-GC, in-mean, and a.s. zero endpoints
under the displayed reverse/cofiltration handoff.  This should be the active
non-finite-class Theorem 2.4.3 target; further progress should prove the
displayed handoff itself.

2026-05-04 follow-up: the displayed handoff is now named and connected to the
full-subgraph endpoint.  New compiled declarations are
`VdVWLemma245TextbookReverseCofiltrationHandoff`,
`VdVWLemma245ReverseCofiltrationHandoff.of_textbook`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_leaveOneOut`, and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_textbookReverseCofiltrationHandoff`.
The active blocker is now exactly this named textbook-display reverse
cofiltration theorem; the older leave-one-out primitive is equivalent and
remains available for local proof routes.

2026-05-04 follow-up: the named textbook-display blocker now has direct
ordinary submartingale/supermartingale sufficient-condition constructors:
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_submartingale`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_supermartingale`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_condExp_step_nonneg`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_condExp_step_nonpos`, and
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_natural_condExp_step_nonneg`.
The remaining mathematical task is still to prove the reverse/permutation-
symmetric cofiltration theorem itself, or to derive one of these constructor
hypotheses from the actual `Σ_n` comparison.

2026-05-04 follow-up: the theorem-facing bridge
`vdVW_textbookReverseComparison_of_permutationSymmetricCofiltration_submartingale`
now shows that an `ℕᵒᵈ` submartingale over the actual VdV&W
permutation-symmetric cofiltration yields the textbook display comparison
`E[‖P_n-P‖_F^* | Σ_{n+1}] ≥ ‖P_{n+1}-P‖_F^*`.  This confirms the local
cofiltration object and mathlib `Submartingale.ae_le_condExp` line up with the
book's row inequality.  The active blocker is unchanged but sharper: prove the
reverse cofiltration convergence theorem from this comparison, or reindex it
into one of the compiled ordinary sub/supermartingale convergence routes.

2026-05-04 follow-up: the adjacent textbook comparison now also constructs the
actual shifted `ℕᵒᵈ` cofiltration submartingale object.  New compiled
declarations are `submartingale_orderDual_nat_of_succ`,
`vdVWLemma245ShiftedPermutationSymmetricCofiltration`,
`adapted_vdVWLemma245ShiftedPermutationSymmetricCofiltration_centeredEmpiricalSupremum_of_countable`,
`stronglyAdapted_vdVWLemma245ShiftedPermutationSymmetricCofiltration_centeredEmpiricalSupremum_of_countable`,
and
`submartingale_vdVWLemma245ShiftedPermutationSymmetricCofiltration_of_textbookReverseComparison`.
Thus the remaining Lemma 2.4.5 gap is narrowed to reverse convergence for this
`ℕᵒᵈ` submartingale, not construction of the cofiltration/submartingale
structure itself.
2026-05-04 follow-up: the generic reverse-time convergence gap is now named
as `VdVWOrderDualSubmartingaleConvergenceHandoff`, and the VdV&W-specific
consumer
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_orderDualSubmartingaleConvergence`
is compiled.  It composes the shifted `ℕᵒᵈ` cofiltration submartingale with
the existing envelope `eLpNorm` bound.  The generic handoff has now been
tightened to use a finite `ℝ≥0` L¹ bound, matching the pinned mathlib
submartingale convergence theorem; the VdV&W consumer supplies this bound from
`2 * ∫ envelope dP`.  The next target is to prove this generic handoff,
preferably by reindexing an `ℕᵒᵈ` submartingale into an ordinary mathlib
martingale-convergence theorem or by proving the corresponding reverse
upcrossing theorem.
2026-05-04 follow-up: the finite-window reindexing substrate for that proof is
now compiled.  `vdVWOrderDualFiniteHorizonFiltration` reverses a fixed
`ℕᵒᵈ` window, and `submartingale_vdVWOrderDualFiniteHorizon` proves
`k ↦ f (OrderDual.toDual (N-k))` is an ordinary mathlib submartingale on that
window.  This avoids the invalid global ordinary-time filtration and points the
next proof at a finite-window reverse-upcrossing estimate.
2026-05-04 follow-up: the finite-window quantitative estimate now compiles as
`vdVWOrderDualFiniteHorizon_mul_integral_upcrossingsBefore_le_integral_pos_part`.
It applies mathlib's ordinary Doob upcrossing inequality to each reversed
finite window.  The next bridge is the combinatorial comparison between
ordinary reverse-time upcrossings and those finite-window reversed estimates.
2026-05-04 follow-up: the ordinary supermartingale convergence adapter now
compiles as `vdVW_supermartingale_exists_ae_tendsto_of_eLpNorm_bdd`.  It is
proved only from pinned mathlib `Submartingale.exists_ae_tendsto_of_bdd`,
`Supermartingale.neg`, and `eLpNorm_neg`, so it adds no new probabilistic
primitive.  This keeps the reverse/cofiltration route sign-flexible if a later
finite-window or reindexing step yields an ordinary supermartingale, but the
main blocker remains `VdVWOrderDualSubmartingaleConvergenceHandoff`.
2026-05-04 follow-up: the reverse downcrossing reduction now compiles as
`vdVW_tendsto_of_downcrossings_lt_top` and
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_ae_lt_top`.  The
order-dual handoff now has a sharper intermediate target: prove a.e. finite
reverse downcrossing counts for
`n ↦ f (OrderDual.toDual n)`.  Once that is available, boundedness and
pointwise convergence follow from existing mathlib plus the new local
deterministic criterion.
2026-05-04 follow-up: the finite-prefix version of that target is now
compiled as `vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossingsBefore_bound`.
It converts a uniform bound on all finite `upcrossingsBefore` reverse
downcrossing counts into the a.e. convergence conclusion.  The remaining
proof obligation is now the deterministic/measure bridge from finite-window
reversed-process upcrossing estimates to those finite-prefix bounds.
2026-05-04 follow-up: the expectation-facing route is now also compiled as
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_lintegral_lt_top`.
It converts finite lintegral of total reverse downcrossing counts into the
same order-dual convergence conclusion, using the natural filtration of the
signed reverse process for measurability.  This is the route most directly
aligned with finite-window Doob estimates.
2026-05-04 follow-up: the finite-window analytic estimate is now packaged as
`vdVW_submartingale_lintegral_upcrossings_lt_top` and
`vdVWOrderDualFiniteHorizon_lintegral_upcrossings_lt_top`.  Every reversed
finite horizon of an `ℕᵒᵈ` submartingale now has finite expected total
upcrossings under the uniform `eLpNorm` bound.  The active gap is the
deterministic reversal/monotone comparison to total reverse downcrossings.
2026-05-04 follow-up: the finite-horizon expected-upcrossing estimate now also
has the explicit uniform bound
`vdVW_submartingale_lintegral_upcrossings_le` and
`vdVWOrderDualFiniteHorizon_lintegral_upcrossings_le`.  The remaining
reverse/cofiltration blocker is therefore only the deterministic comparison
needed to pass this uniform bound to total reverse downcrossings.
2026-05-04 follow-up: the uniform finite-horizon bound now feeds a compiled
order-dual convergence consumer
`vdVWOrderDualSubmartingale_ae_tendsto_of_finiteHorizon_reverseComparison`.
This theorem consumes exactly the pointwise deterministic comparison between
finite-prefix reverse downcrossings and the corresponding reversed-window
upcrossing count.  Once that comparison is proved, the generic order-dual
submartingale convergence handoff and the VdV&W Lemma 2.4.5 reverse
cofiltration package can be closed without further probabilistic or
integration primitives.  The generic interface-level wrapper
`VdVWOrderDualSubmartingaleConvergenceHandoff.of_finiteHorizon_reverseComparison`
is also compiled, so the next proof should target the deterministic comparison
directly rather than adding more convergence adapters.
2026-05-04 follow-up: a strict inner-threshold variant is now compiled as
`vdVWOrderDualSubmartingale_ae_tendsto_of_finiteHorizon_innerReverseComparison`
and
`VdVWOrderDualSubmartingaleConvergenceHandoff.of_finiteHorizon_innerReverseComparison`.
This is the preferred deterministic target because mathlib's crossing
extension lemma uses strict inequalities; downcrossing from `b` to `a` can be
reversed into an upcrossing from any `c,d` with `a < c < d < b`.
2026-05-04 follow-up: the first pathwise crossing-time step toward that
deterministic target now compiles.  `vdVW_exists_reverse_inner_upcrossing_of_lt_downcrossingsBefore`
extracts a strict reversed-window inner upcrossing pair from each counted
reverse downcrossing, and
`vdVW_reverse_inner_upcrossings_pos_of_downcrossingsBefore_pos` turns positive
reverse-downcrossing count into positive reversed inner-upcrossing count via
mathlib `upcrossingsBefore_lt_of_exists_upcrossing`.  The remaining task is
the multiplicity/counting upgrade to the full finite-prefix comparison.
2026-05-04 follow-up: the ordering half of that multiplicity argument now
compiles.  `vdVW_reverse_crossing_pair_order_of_lt` and
`vdVW_reverse_crossing_pair_succ_le_of_lt_of_lower_lt` show that later original
crossing intervals are earlier, with a one-index separation, in the reversed
finite window.  The remaining exact step is an induction/counting proof chaining
these separated pairs into a full `upcrossingsBefore` lower bound.
2026-05-05 follow-up: that induction/counting proof is now compiled as
`vdVW_reverse_inner_upcrossingsBefore_ge_downcrossingsBefore`, closing the
deterministic finite-prefix comparison.  Consequently
`VdVWOrderDualSubmartingaleConvergenceHandoff.proved` proves the generic
order-dual submartingale convergence theorem, and
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable`
removes the former reverse/cofiltration primitive from the standard
countable/integrable-envelope Lemma 2.4.5 route.  The next dashboard frontier
is final endpoint cleanup: consume this proved handoff in Lemma 2.4.5 and
Theorem 2.4.3 wrappers that still carry an explicit `hreverse` hypothesis.

2026-05-05 follow-up: the canonical full-subgraph endpoint cleanup is now
compiled.  New theorem-facing declarations
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_textbookReverseCofiltrationHandoff`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_countable_integrable`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_countable_integrable`
use the proved textbook reverse/cofiltration handoff, so the full-subgraph
Theorem 2.4.3/Lemma 2.4.5 package no longer asks callers for an explicit
`hreverse` primitive under the standard countable/integrable-envelope
assumptions.  The next frontier is exact final-statement assembly and auditing
remaining `hreverse` wrappers as optional alternative sufficient conditions.

2026-05-05 follow-up: the canonical full-subgraph endpoint package now also
includes the outer-a.s. `P`-GC branch.  The compiled declarations
`VdVWAlmostSureGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical_of_countable_integrable`,
`VdVWOuterAlmostSurePGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical_of_countable_integrable`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_of_countable_integrable`
package outer-probability GC, outer-a.s. GC, book-style `P`-GC, in-mean
centered-supremum convergence, and Lemma 2.4.5 a.s. centered-supremum
convergence without an explicit reverse/cofiltration hypothesis.  The next
frontier is exact final-statement assembly and matching the remaining book
entropy/VC hypotheses to this strong package.

2026-05-05 follow-up: the envelope-integrability assumption is now explicitly
connected to the textbook `P^* F < ∞` side condition for the measurable-envelope
route.  The compiled bridge
`VdVWOuterExpectation_ofReal_lt_top_of_measurable_integrable_nonneg`, with the
class-envelope specialization
`VdVWClassEnvelope.outerExpectation_lt_top_of_measurable_integrable`, proves
finite VdV&W nonnegative outer expectation from ordinary measurable
integrability and nonnegativity of the envelope.  This closes one final
assembly mismatch; the remaining Theorem 2.4.3 mismatches are the exact
arbitrary `P`-measurable/asymptotic-measurable class layer and the conversion
from the book random empirical entropy condition to the current fixed-radius
selected/full-subgraph finite-net package.

2026-05-05 follow-up: the countable full-subgraph route now has a compact
textbook-aligned consumer,
`VdVWTheorem243_fullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`.
It packages Definition 2.3.3 `P`-measurability and finite outer envelope
expectation together with the already proved no-nonempty Theorem 2.4.3/Lemma
2.4.5 strong conclusions.  The remaining Theorem 2.4.3 work is no longer
bookkeeping for the countable route; it is the genuinely broader arbitrary
`P`-measurable/asymptotic-measurable layer and the conversion from the book's
random empirical entropy hypothesis to the current fixed-radius/full-subgraph
finite-net assumptions.

2026-05-05 follow-up: the book entropy assumption now has a canonical
variable-domain Lean shape for the Theorem 2.4.3 route:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM`.  It records
all-`M`, all-positive-radius empirical covering domination and normalized
log-cardinality convergence on `SampleAt Observation n`, and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions`
projects it into the selected fixed-radius package once the explicit
finite-net integrability and tail/UI inputs are available.  This sharpens the
remaining target to the analytic tail/UI derivation and the broader arbitrary
`P`-measurable/asymptotic-measurable class layer.

2026-05-05 follow-up: the bounded-log-ratio branch of that variable-domain
entropy route now reaches untruncated centered convergence.  The compiled
declarations
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_bound`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_bound`
compose the canonical book entropy package with a deterministic normalized
log-cardinality bound, discharge selected finite-net integrability and tail/UI
through the existing Hoeffding-scale bounded route, and feed the result into
the untruncated Theorem 2.4.3 convergence handoff.  Next frontier: prove that
deterministic log-ratio bound from a genuine structural covering/VC argument
or replace it with a real selected finite-net tail/UI theorem; the arbitrary
`P`-measurable/asymptotic-measurable class layer remains separate.

2026-05-05 follow-up: structural deterministic-rate inputs can now be consumed
without manual entropy/package rebuilding.  The compiled constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_div_tendsto_bound`
turns a pointwise bound
`log(cardinality M eta n sample n + 1) / n <= rate M eta n` with
`rate M eta -> 0` into the canonical variable-domain entropy condition.  The
compiled constructor
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_logCardinality_div_tendsto_bound`
then builds the all-positive-`M` selected fixed-radius tail/UI packages when
`rate M eta n` is also bounded by a deterministic `K M eta`.  This is the
intended feeder for future VC/Sauer/polynomial covering proofs before the
untruncated Theorem 2.4.3 convergence consumer.

2026-05-05 follow-up: that structural-rate feeder now reaches the theorem
output layer.  The compiled declarations
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_tendsto_bound`
and
`VdVWOuterProbabilityUniformDeviationConstOn_of_logCardinality_div_tendsto_bound`
turn deterministic rate/covering inputs into untruncated centered convergence
and the finite-product outer-probability uniform-deviation conclusion.  The
remaining theorem-critical work is to instantiate those rate/covering inputs
from actual VdV&W structural entropy/VC hypotheses, or replace the
deterministic boundedness branch with a true random-entropy tail/UI theorem.

2026-05-05 follow-up: the same structural-rate branch now also reaches the
canonical infinite-product GC endpoints.  New compiled declarations
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_logCardinality_div_tendsto_bound`
and `VdVWPGlivenkoCantelliClass_of_logCardinality_div_tendsto_bound` project
the finite-product result to the canonical iid process and package it as the
local book-style `P`-Glivenko-Cantelli predicate.  Remaining work is now
concentrated on proving the structural rate/covering inputs from actual
VdV&W entropy/VC hypotheses, or proving the missing random-entropy tail/UI
bridge without deterministic boundedness.

2026-05-05 follow-up: the variable-domain book entropy branch with a
deterministic normalized log-cardinality bound now reaches the canonical
book-style `P`-GC endpoint.  The compiled declaration
`VdVWPGlivenkoCantelliClass_of_variableEntropy_logCardinality_div_bound`
projects the variable-entropy centered convergence theorem through the
finite-product uniform-deviation bridge and the canonical iid process bridge.
This closes another endpoint handoff; the remaining theorem-critical issue is
still the deterministic-bound/tail-UI input or the broader arbitrary
`P`-measurable/asymptotic-measurable layer.

2026-05-05 follow-up: the same variable-domain entropy branch now also reaches
the in-mean centered-supremum conclusion.  The compiled theorem
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_variableEntropy_logCardinality_div_bound`
upgrades outer-probability convergence through the generic tail/UI adapter,
with countability plus a measurable integrable envelope supplying the
measurability, integrability, and centered-supremum tail/UI inputs.  The branch
now has both local book-style `P`-GC and in-mean conclusions under the honest
deterministic log-bound assumption.

2026-05-05 follow-up: the structural deterministic-rate branch now has the
matching in-mean endpoint.  The compiled declaration
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_logCardinality_div_tendsto_bound`
turns empirical covering domination plus deterministic normalized
log-cardinality rates into in-mean centered-supremum convergence by reusing the
variable-domain entropy constructor and in-mean theorem.  This leaves the
same substantive blockers: instantiate the structural rates from a book-level
VC/Sauer/trace-cover theorem, remove deterministic boundedness by a genuine
random-entropy finite-net tail/UI theorem, or extend beyond the countable
coordinate-measurable class layer.

2026-05-05 follow-up: the structural deterministic-rate branch is now packaged
as a paired endpoint.  The compiled theorem
`VdVWTheorem243_logCardinality_div_tendsto_bound_pGlivenkoCantelli_and_inMean`
returns both the local book-style `P`-GC conclusion and the in-mean
centered-supremum conclusion from the same structural covering/rate
hypotheses.  This keeps the next work honest: instantiate the already compiled
full-subgraph/structural-rate consumers for concrete textbook class
hypotheses when needed, remove deterministic boundedness with a
random-entropy tail/UI theorem, or extend beyond the countable
coordinate-measurable route.  The generic full-subgraph endpoint is no longer
a missing proof target; it is compiled under `VdVWUniformSubgraphVCBound`.
