# VdV&W Chapter 1-2 Progress Dashboard

This dashboard is a quick visual view of the current formalization state for
van der Vaart and Wellner Chapters 1 and 2.  The authoritative detailed
inventory is `docs/vdvw_chapter1_2_formalization_blueprint.md`; this file is a
human-facing monitor for what is proved, what is in progress, and what remains.

Status snapshot date: 2026-05-04.

Active blocker/primitives register:

```text
docs/vdvw_current_blocker_primitive_plan.md
```

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
  T243["Theorem 2.4.3 next bracketing/GC result<br/>next"]
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
| Lemma 1.2.1 | Nonnegative outer/inner expectation and measurable-cover interfaces, plus monotonicity of nonnegative outer and inner expectation | Full extended-real measurable-cover existence theorem. |
| Lemma 1.2.2 | Nonnegative cover algebra: sup, add majorant, product majorant, two-sided constant addition equality, finite-measurable addition equality, threshold indicators, tail-product cover-majorant for envelope-tail terms, two-sided measurable infimum equality, and measurable integrable real signed bridge via positive/negative outer expectations | Full arbitrary-map signed extended-real clauses, subtraction, absolute value, and stronger addition/product equality cases. |
| Lemma 1.2.3 | Nonnegative event indicator bridges for outer/inner probability, event-indicator monotonicity, explicit measurable event-cover existence, arbitrary measurable set covers with integral equality, direct `toMeasurable` hull integral equality, complement-set-cover lower covers, direct complement-cover inner-probability equalities, outer-probability/outer-expectation bridge, Markov-style outer-probability bound via supplied measurable cover, and two-sided complement identities | Remaining extended-real and full measurable-set-cover clauses. |
| Definition 1.3.3 / Theorem 1.3.4 / Theorem 1.3.6 / Theorem 1.3.9 / Section 1.4 | Measure-level weak convergence of probability measures, bounded-continuous and bounded-Lipschitz integral characterizations, Levy-Prokhorov distance characterizations, Portmanteau closed/open implications, probability-measure tightness compact-set characterization, Prokhorov compact-closure wrapper, continuous-map pushforward, binary and finite product-law weak convergence, finite-coordinate restriction/FDD forward wrapper, process-law and `IdentDistrib` uniqueness-only FDD wrappers, convergence-in-distribution continuous mapping, and measurable common-domain Slutsky/product convergence wrappers in `WeakConvergence.lean` and `FiniteDimensional.lean` | Full VdV&W arbitrary-map/nonmeasurable outer-expectation, asymptotic-measurability, asymptotic-tightness, asymptotic-independence, and FDD weak-convergence converse versions remain separate blocked primitives. |
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
READY      Definition 2.1.5 covering-number primitive plus fixed-sample/random empirical L1(P_n) entropy, F_M truncation interfaces, countable/measurable-cardinality selectors, product-copy/Fubini/symmetrization bridges, Rademacher finite-net Hoeffding and Mills/log-radius maximal layers, bounded varying-domain real-tail-to-mean wrapper, variable-domain fixed-M centered-truncated convergence handoffs, deterministic log-bound/inverse-radius consumers, selected-cardinality equality-transport arbitrary-radius/inverse-radius consumers, all-radius covering-domination selectors, selected inverse-radius finite-cover constructor, selected side-condition constructor, inverse-radius entropy side-condition package, package-level inverse-radius entropy mean projections, selected finite-cover and selected inverse-radius all-radius finite-net mean projections, explicit variable-domain tail/UI mean bridge and bounded-tail adapters, generic outer-probability perturbation, deterministic untruncation perturbation inequalities, empirical envelope-tail expectation/Markov bridges, untruncation bad-event probability split, large-M untruncation convergence handoff, untruncated selected/non-selected/all-radius-selected inverse-radius consumers, faithful fixed-radius finite-net mean and log-cardinality handoffs, selected fixed-radius cardinality/log-convergence/finite-net mean handoffs, selected fixed-radius fixed-M and untruncated consumers, selected fixed-radius tail/UI fixed-M and untruncated consumers with finite-center Rademacher integrability derived internally, selected fixed-radius tail/UI side-condition package with deterministic-log-bound and terminal-`base^n` constructors plus fixed-M and untruncated packaged consumers, induced empirical `L1(P_n)` pseudometric/internal-cover adapters and sample-path random-cover bridge, fixed-sample trace image/repr empirical-cover bridges, finite-trace random-cover and selected fixed-radius tail-package constructors, deterministic-rate-to-outer-probability entropy bridges, finite-trace selected fixed-radius tail-package constructor from deterministic normalized log-cardinality rates, log-linear/polynomial-rate, shifted-log-linear, and natural-polynomial finite-trace tail-package constructors, local VC/Sauer wrappers with coarse polynomial set-family bound, generic finite-code empirical-trace cardinality bridge, binary empirical-trace-to-Sauer cardinality bridge, fixed-threshold subgraph/indicator trace bridge, finite-threshold signature/product-cardinality bridge plus product-bound, factorwise-bound, common-base, threshold-count, base-growth, uniform-VC polynomial handoffs, pointwise/coordinatewise-threshold separation consumers, exact finite-value-membership threshold consumers, direct finite-value threshold selected fixed-radius tail/UI package constructor, finite-value threshold untruncated convergence consumer, finite realized value-set threshold/cardinality constructor, finite realized value-set untruncated convergence consumer, finite approximate-code and pointwise-code empirical-cover primitives with padded cardinality, finite-class empirical pseudometric cardinality bounds, finite-class selected fixed-radius tail-package constructor with deterministic log-cardinality convergence, finite-class untruncated centered convergence consumer with truncation-integrability, value-set boundedness, finite-center Rademacher integrability, centered measurable-cover, centered-supremum integrability, pair/split-copy supremum integrability, ghost-expectation integrability, sample-side Rademacher supremum integrability, product-space Rademacher supremum integrability, product-space measurable cover, sign-side supremum integrability, sign-side iterated-integral integrability, canonical common iid Rademacher sign instantiation, and canonical terminal sample-path instantiation discharged, untruncated fixed-radius log-bound consumer, and proof-carrying symmetrization precursor package for Theorem 2.4.3 setup.
NEXT       Do not repeat the finite-class geometry/entropy/consumer, finite-center integrability, centered-cover, centered-supremum/pair/sample/random-sign product integrability, canonical iid-sign instantiation, canonical sample-path instantiation, untruncation bridges, fixed-sample trace-cover bridges, finite-trace selected fixed-radius package bridges, deterministic-rate entropy adapters, log-linear/polynomial-rate package constructors, shifted `log(n+1)` package constructors, natural-polynomial `cardinality + 1 <= C*(n+1)^d` package constructors, finite set-family Sauer polynomial wrapper, generic finite-code trace cardinality bridge, binary `{0,1}` empirical-trace-to-Sauer bridge, fixed-threshold indicator bridge, finite-threshold product-cardinality bridge, product-bound-to-polynomial handoff, factorwise product handoff, common-base product handoff, threshold-count `base^k` handoff, base-growth arithmetic handoff, uniform-VC threshold-cardinality consumer, pointwise/coordinatewise-threshold code/separation consumers, exact finite-value-membership threshold consumers, the direct finite-value threshold selected fixed-radius package constructor, its untruncated convergence consumer, the finite realized value-set threshold/cardinality constructor, its untruncated convergence consumer, or the finite approximate-code/pointwise-code empirical-cover primitives.  The remaining full-route gap is now constructing an actual bounded quantized-trace code with empirical L1 error control and VC/subgraph/grid cardinality bounds; exact finite-threshold or finite realized value-set routes remain available only under stronger finite/discretized hypotheses; the exact finite-value-membership route is compiled and reaches untruncated Theorem 2.4.3 convergence under its strong finite/discretized trace hypothesis, but it is too strong for arbitrary continuum-valued classes unless that hypothesis is supplied.  The random-cover domination, selected tail/UI package handoff, analytic package handoff, finite-class route, trace-to-cover bridge, deterministic-rate/log-linear/natural-polynomial asymptotic bridges, mathlib Sauer wrapper, finite-code trace bridge, binary indicator trace bridge, fixed-threshold subgraph bridge, finite-threshold product bridge, product-bound/factor-bound/common-base/threshold-count/base-growth/uniform-VC handoffs, pointwise/coordinatewise/value-membership threshold separation bridges, threshold-to-selected-package bridge, threshold-to-untruncated consumer, finite realized value-set constructor, finite realized value-set untruncated consumer, finite approximate-code and pointwise-code cover bridges, and `edist` compatibility are compiled.
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
