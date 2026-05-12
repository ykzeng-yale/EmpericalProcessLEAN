# VdV&W Inventory Through Theorem 2.4.1

This is the working inventory for progressively formalizing van der Vaart and
Wellner up to and including Theorem 2.4.1.  It records the local textbook
anchors, the currently verified Lean base, the reusable pinned mathlib layer,
and the definitions/lemmas that still need to be built locally.

The public repository should not copy long textbook passages.  The textbook
PDF, markdown extraction, and screenshots under `Textbooks/Vaart1996/` are
intentionally tracked source-audit anchors per user request, and this document
uses local path anchors and short paraphrases only.

## Scope

Local source shorthand:

| Label | Local source file |
| --- | --- |
| `M1` | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md` |
| `M2` | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md` |

Extraction boundary:

- Chapter 1 named items in `M1`.
- Chapter 2 named items from `M1` and `M2` through `M2:970`.
- Theorem 2.4.1 is included as the current target.

Extraction count:

| Bucket | Count |
| --- | ---: |
| Chapter 1 named items before Chapter 2 | 70 |
| Chapter 2 named items before Theorem 2.4.1 | 31 |
| Theorem 2.4.1 target item | 1 |
| Total inventory through Theorem 2.4.1 | 102 |

Commands used for the local extraction:

```bash
rg -n "^[0-9]+\\.[0-9]+(\\.[0-9]+)? (Theorem|Lemma|Definition|Example|Proposition|Corollary|Addendum)" \
  "Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md"

rg -n "^#{1,6} [0-9]+\\.[0-9]+(\\.[0-9]+)? (Theorem|Lemma|Definition|Example|Proposition|Corollary|Addendum)" \
  "Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md"

awk 'NR<=970 && $0 ~ /^[0-9]+\\.[0-9]+(\\.[0-9]+)? (Theorem|Lemma|Definition|Example|Proposition|Corollary|Addendum)/ { print FILENAME ":" NR ":" $0 }' \
  "Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md"
```

## Current Verified Lean Base

The tracked Lean tree is intentionally empirical-process focused.  Old local
non-empirical-development files with incomplete proof experiments are not part
of this repository.

| File | Role | Proof status |
| --- | --- | --- |
| `StatInference/Asymptotics/Basic.lean` | deterministic oracle/deviation support | compiled, no proof holes |
| `StatInference/EmpiricalProcess/Average.lean` | empirical averages and risk sequences | compiled, no proof holes |
| `StatInference/EmpiricalProcess/Basic.lean` | empirical-deviation and GC interfaces | compiled, no proof holes |
| `StatInference/EmpiricalProcess/Finite.lean` | finite union/class handoffs | compiled, no proof holes |
| `StatInference/EmpiricalProcess/Preservation.lean` | subclass/projection preservation | compiled, no proof holes |
| `StatInference/EmpiricalProcess/Complexity.lean` | abstract covering/bracketing/VC certificates | compiled, no proof holes |
| `StatInference/EmpiricalProcess/Bracketing.lean` | deterministic bracket inequality and route | compiled, no proof holes |
| `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive brackets, `L1(P)` width, finite covers, and primitive cover-to-route theorems | compiled, no proof holes |
| `StatInference/EmpiricalProcess/BracketingCountable.lean` | countable decreasing finite-cover route | compiled, no proof holes |
| `StatInference/EmpiricalProcess/EndpointStrongLaw.lean` | endpoint SLLN wrappers from mathlib | compiled, no proof holes |
| `StatInference/EmpiricalProcess/EndpointSamples.lean` | iid sample-path endpoint SLLN bridge for finite bracket covers | compiled, no proof holes |
| `StatInference/EmpiricalProcess/OuterExpectation.lean` | Chapter 1.2 nonnegative outer-expectation and measurable-cover primitives | compiled, no proof holes |
| `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | generic outer-probability convergence primitives and local/outer GC wrappers for the primitive bracketing theorem | compiled, no proof holes |

Current promoted declarations toward Theorem 2.4.1:

| Declaration | Status |
| --- | --- |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` | proved deterministic bracket comparison layer |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds` | proved sequence-level bracket comparison layer |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero` | proved route from endpoint/width radii to local GC interface |
| `FiniteBracketingEndpointRoute` | proved proof-carrying finite endpoint route interface |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass` | proved route-to-GC conversion |
| `endpoint_strong_law_ae_real` | proved wrapper around mathlib SLLN |
| `finite_endpoint_strong_law_ae_real` | proved finite endpoint SLLN handoff |
| `samplePath`, `empiricalAverage_samplePath_eq_range_sum` | proved sample-path and empirical-average/range-sum bridge |
| `endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid` | proved iid endpoint SLLN for sample-path empirical averages |
| `FiniteL1BracketCover.endpoint_tendsto_ae_of_iid`, `FiniteL1BracketCover.exists_endpointRadius_ae_of_iid` | proved fixed-cover iid endpoint convergence and endpoint-radius bridge |
| `FunctionBracket`, `MemFunctionBracket`, `l1BracketWidth`, `IsL1EpsilonBracket` | proved/compiled primitive bracketing vocabulary for Definition 2.1.6 |
| `FiniteBracketCover`, `FiniteL1BracketCover` | proved/compiled finite primitive cover witnesses |
| `FiniteL1BracketCoverAtCard`, `HasFiniteL1BracketingNumber` | proved/compiled explicit-cardinality finite bracketing witness layer |
| `l1BracketingNumber`, `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` | proved/compiled primitive numeric `N_[] : ℕ∞` and finite-cover bridge |
| `finiteEndpointRadius`, `exists_endpointRadius_of_finite_endpoint_tendsto` | proved finite endpoint convergence to one vanishing endpoint-radius sequence |
| `FiniteL1BracketCover.endpointRadius`, `FiniteL1BracketCover.exists_endpointRadius_of_endpoint_tendsto` | proved primitive-cover endpoint-radius bridge |
| `FiniteL1BracketCover.toFiniteBracketingEndpointRoute` | proved primitive-cover constructor into the existing endpoint route |
| `PrimitiveFiniteBracketingGCRoute.ofFiniteCoversAndEndpointTendsto` | proved route constructor from finite covers and endpoint convergence |
| `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | proved epsilon/eventual deterministic bracketing route |
| `CountablePrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | proved countable decreasing-cover deterministic route |
| `uniformDeviationTendstoZeroOn_ae_of_iid_countable_covers` | proved iid countable-cover almost-sure uniform convergence layer |
| `uniformDeviationTendstoZeroOn_ae_of_iid_l1BracketingNumber_lt_top` | proved primitive `N_[]` to a.s. pathwise uniform convergence theorem |
| `VdVWMeasurableMajorant`, `VdVWOuterExpectation`, `VdVWMeasurableCover` | proved/compiled nonnegative Chapter 1.2 outer-expectation and measurable-cover primitive layer |
| `VdVWOuterExpectation_eq_lintegral_of_measurable`, `VdVWOuterExpectation_eq_lintegral_cover`, `VdVWOuterExpectation_mono`, `VdVWInnerExpectation_mono` | proved nonnegative outer/inner-expectation realization and monotonicity lemmas for measurable maps and supplied minimal measurable covers |
| `VdVWMeasurableCover.sup`, `VdVWMeasurableCover.addMajorant`, `VdVWMeasurableCover.infMajorant`, `VdVWMeasurableCover.mulMajorant` | proved nonnegative Lemma 1.2.2 cover-algebra layers for pointwise sup, sum, inf, and product majorants |
| `VdVWMeasurableCover.addConstLeft`, `VdVWMeasurableCover.addConstRight`, `VdVWOuterExpectation_eq_lintegral_const_add_cover`, `VdVWOuterExpectation_eq_lintegral_add_const_cover` | proved nonnegative Lemma 1.2.2(i) equality layer when either summand is a constant: `(c + T)* = c + T*` and `(T + c)* = T* + c` |
| `VdVWMeasurableCover.thresholdIndicatorCover`, `VdVWOuterExpectation_thresholdIndicator_eq_measure_cover_threshold`, `VdVWOuterExpectation_tailProduct_le_lintegral_tail_cover` | proved nonnegative Lemma 1.2.2(vi) threshold-indicator layer and tail-product cover-majorant bridge: the cover of `1_{T>c}` is `1_{T*>c}`, and `E^*[T 1_{T>c}]` is bounded by the supplied cover-tail integral |
| `VdVWMeasurableCover.infOfMeasurableLeft`, `VdVWMeasurableCover.infOfMeasurableRight`, `VdVWOuterExpectation_eq_lintegral_inf_cover_of_left_measurable`, `VdVWOuterExpectation_eq_lintegral_inf_cover_of_right_measurable` | proved nonnegative Lemma 1.2.2(ix) equality layer when either map is measurable: `(S ∧ T)* = S ∧ T*` and `(S ∧ T)* = S* ∧ T` |
| `VdVWEventIndicator`, `VdVWEventIndicator_mono`, `VdVWOuterExpectation_eventIndicator_mono`, `VdVWInnerExpectation_eventIndicator_mono`, `VdVWMeasurableSetCover`, `VdVWOuterExpectation_eventIndicator_eq_measure` | proved nonnegative Lemma 1.2.3(i) indicator bridge and monotonicity layer: outer probability as outer expectation |
| `VdVWMeasurableCover.eventIndicatorOfToMeasurable`, `VdVWOuterExpectation_eq_lintegral_eventIndicatorCover` | proved finite-measure event-indicator measurable-cover bridge for Lemma 1.2.3 |
| `VdVWMeasurableLowerCover.eventIndicatorOfToMeasurableCompl`, `VdVWInnerExpectation_eventIndicator_eq_innerProbability` | proved finite-measure nonnegative Lemma 1.2.3 inner indicator bridge: inner probability as inner expectation |
| `VdVWOuterExpectation_eventIndicator_add_innerExpectation_compl`, `VdVWOuterExpectation_eventIndicator_add_innerExpectation_compl_eq_one` | proved nonnegative Lemma 1.2.3 complement-expectation identity: `E* 1_B + E_* 1_{Bᶜ}` is total mass, and is `1` for probabilities |
| `AlmostSureUniformDeviationTendstoZeroOn` | proved/compiled named ordinary a.s. pathwise uniform LLN convergence mode |
| `VdVWAlmostSureGlivenkoCantelliClass` | proved/compiled local GC wrapper structure for iid observation processes |
| `almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top` | proved primitive `N_[]` to named a.s. pathwise convergence wrapper |
| `vdVWAlmostSureGlivenkoCantelliClass_of_iid_l1BracketingNumber_lt_top` | proved local a.s. pathwise Glivenko-Cantelli conclusion from primitive `N_[]` |
| `VdVWOuterProbability`, `VdVWOuterAlmostSure`, `VdVWOuterProbability_lt_le_outerExpectation_div_cover` | proved/compiled outer probability and outer-a.s. event primitives, including a Markov-style supplied-cover outer-probability bound |
| `VdVWConvergesInOuterProbabilityConst`, `VdVWConvergesInOuterProbability` | proved/compiled generic Definition 1.10.1-style outer-probability convergence primitives |
| `vdVWConvergesInOuterProbability_of_tendstoInMeasure` | proved bridge from mathlib `TendstoInMeasure` to the VdV&W common-domain outer-probability predicate |
| `tendstoInMeasure_of_vdVWConvergesInOuterProbability`, `vdVWConvergesInOuterProbability_iff_tendstoInMeasure` | proved the reverse bridge and equivalence between common-domain VdV&W outer-probability convergence and mathlib convergence in measure |
| `tendstoInDistribution_of_vdVWConvergesInOuterProbability` | proved measurable common-domain version of Lemma 1.10.2(ii), using mathlib convergence in distribution |
| `VdVWOuterAlmostSureUniformDeviationTendstoZeroOn`, `VdVWOuterAlmostSurePGlivenkoCantelliClass` | proved/compiled exact outer-a.s. uniform LLN and GC predicates |
| `vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top` | proved primitive `N_[]` to outer-a.s. uniform deviation convergence |
| `vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli` | proved VdV&W Theorem 2.4.1 in the outer-a.s. convergence mode |
| `VdVWOuterProbabilityUniformDeviationTendstoZeroOn`, `VdVWOuterProbabilityPGlivenkoCantelliClass` | proved/compiled outer-probability convergence-mode predicates |
| `VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_tail` | proved tail-event sufficient condition for outer-probability convergence |
| `VdVWUniformDeviationBadEvent`, `VdVWUniformDeviationBadTailEvent`, `VdVWUniformDeviationBadInfinitelyOftenEvent`, `vdVWUniformDeviationBadInfinitelyOften_subset_not_tendsto` | proved bad-event vocabulary and infinitely-often-failure implication |
| `VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn`, `vdVWOuterProbabilityUniformDeviationTailTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup` | proved conditional tail-continuity route from outer-a.s. convergence to direct outer-probability convergence |
| `vdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn_of_isFiniteMeasure_of_nullMeasurable_badEvent`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_isFiniteMeasure_of_nullMeasurable_badEvent` | proved finite-measure/null-measurable bridge from outer-a.s. convergence to direct outer-probability convergence |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_nullMeasurable_badEvent` | proved direct outer-probability Theorem 2.4.1 under fixed bad-event null-measurability |
| `vdVWUniformDeviationBadEvent_nullMeasurableSet_of_countable_of_coordinate`, `vdVWUniformDeviationBadEvent_nullMeasurableSet_of_countable_of_aemeasurable_coordinate` | proved countable-class bridge from coordinate measurability to fixed bad-event null measurability |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_countable_of_aemeasurable_coordinate`, `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_aemeasurable_coordinate` | proved direct outer-probability Theorem 2.4.1 for countable classes with coordinate a.e.-measurable deviations |
| `vdVWCoordinateDeviation_aemeasurable_of_empiricalRisk`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalRisk` | proved empirical-risk a.e.-measurability bridge into the countable direct outer-probability theorem layer |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_aemeasurable_empiricalAverage` | proved direct outer-probability Theorem 2.4.1 for countable classes with a.e.-measurable empirical-average coordinates |
| `empiricalAverage_samplePath_aemeasurable_of_coordinate`, `empiricalAverage_samplePath_aemeasurable_of_sample_aemeasurable`, `empiricalAverage_samplePath_aemeasurable_of_hasLaw` | proved finite sample-path empirical-average a.e.-measurability from coordinate/sample a.e.-measurability, `HasLaw`, and measurable statistics |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_sample_aemeasurable_of_classFun_measurable`, `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_classFun_measurable` | proved direct outer-probability Theorem 2.4.1 for countable classes with concrete sample/function measurability, including the stronger `HasLaw` plus measurable class-function form |
| `VdVWPGlivenkoCantelliClass` | proved/compiled book-style GC predicate with outer-probability or outer-a.s. branches |
| `vdVW_theorem_2_4_1_glivenkoCantelli` | proved VdV&W Theorem 2.4.1 into the book-style GC predicate |

Verification gate:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

Expected result: build succeeds and the scan returns no matches.

## Pinned Mathlib Reuse Audit

This repo builds against the pinned mathlib revision recorded in
`lake-manifest.json`:

```text
49f10344339f99fda2d3bb0aa1455bfa6801fd93
```

Local source volume:

| Local source set | Lean files |
| --- | ---: |
| all pinned `Mathlib` files | 7993 |
| `MeasureTheory`, `Probability`, `Topology`, `Analysis` | 1870 |

Targeted search found these reusable foundations.

| VdV&W need | Pinned mathlib source | Reuse status |
| --- | --- | --- |
| measurable spaces, Borel spaces, measures | `Mathlib/MeasureTheory/MeasurableSpace/*`, `Mathlib/MeasureTheory/Measure/*` | use directly |
| probability measures | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean` | use `ProbabilityMeasure`, `IsProbabilityMeasure`, coercion to `Measure` |
| finite measures and weak convergence topology | `Mathlib/MeasureTheory/Measure/FiniteMeasure.lean` | use finite-measure topology and integral characterizations |
| local VdV&W weak convergence wrappers | `StatInference/EmpiricalProcess/WeakConvergence.lean` | compiled measure-level probability-law weak convergence, bounded-continuous integral characterization, Portmanteau closed/open implications, tightness/Prokhorov wrappers, VdV&W-numbered Lemma 1.10.2(ii) common-domain bridge, VdV&W-numbered Theorem 1.11.1 fixed continuous-map wrappers, product-law weak convergence, finite-coordinate/FDD forward direction, and measurable Slutsky/product wrappers |
| local VdV&W ball sigma-field wrappers | `StatInference/EmpiricalProcess/BallSigma.lean` | compiled open/closed ball sigma-field definitions, open-ball topological basis, rational open/closed ball bridges, open/closed ball sigma equality, Borel equality, generator measurability, and separable dense-sequence distance-coordinate measurability iff |
| local VdV&W Hilbert/Gaussian wrappers | `StatInference/EmpiricalProcess/HilbertGaussian.lean` | compiled Hilbert, L2, Frechet-Riesz, Gaussian inner-coordinate, and Gaussian-process coordinate foundation wrappers |
| Portmanteau style weak convergence | `Mathlib/MeasureTheory/Measure/Portmanteau.lean` | reused directly through local measure-level Portmanteau wrappers; arbitrary-map/outer-expectation version remains pending |
| Prokhorov-related measure theory | `Mathlib/MeasureTheory/Measure/Prokhorov.lean`, `LevyProkhorovMetric.lean` | reused for probability-measure tightness and compact closure; VdV&W outer-probability/asymptotic-tightness nets still need local primitives |
| convergence in distribution | `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean` | reusable for measurable random variables |
| Bochner integrals and order monotonicity | `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`, `Set.lean` | use `integral_mono`, `integral_mono_ae`, `setIntegral_mono` |
| product integrals and Fubini | `Mathlib/MeasureTheory/Integral/Prod.lean`, `Pi.lean` | use for Chapter 1 product/Fubini material |
| `L1`/`Lp` functions and seminorms | `Mathlib/MeasureTheory/Function/LpSpace/*`, `LpSeminorm/*` | use `MemLp`, `Lp`, `eLpNorm`, `lpNorm` where exact `L1(P)` is needed |
| integrability closure | `Mathlib/MeasureTheory/Integral/Bochner/*`, `Function/LpSpace/*` | use `Integrable.add`, `Integrable.sub`, `MemLp` lemmas |
| iid/independence foundations | `Mathlib/Probability/IdentDistrib.lean`, `IdentDistribIndep.lean`, `Independence/*` | use for sample and endpoint SLLN hypotheses |
| strong law of large numbers | `Mathlib/Probability/StrongLaw.lean` | already reused via `ProbabilityTheory.strong_law_ae_real` |
| Borel-Cantelli | `Mathlib/Probability/BorelCantelli.lean` | reusable for later almost-sure convergence arguments |
| Hoeffding/sub-Gaussian inequalities | `Mathlib/Probability/Moments/SubGaussian.lean` | reusable for later Section 2.2 inequality formalization |
| filters and asymptotics | `Mathlib/Order/Filter/*`, topology filter libraries | use `Tendsto`, `atTop`, eventual statements |
| finite sums and finite maxima | `Mathlib/Data/Finset/*`, algebra/order libraries | use for finite endpoint maxima and finite covers |
| VC combinatorics | `Mathlib/Combinatorics/SetFamily/Shatter.lean` | reusable later for VC-subgraph/VC-class work |

Targeted local search did not find a ready-made theorem equivalent to VdV&W
Theorem 2.4.1:

```text
finite L1(P) bracketing numbers at every positive radius
  -> Glivenko-Cantelli
```

It also did not find ready-made VdV&W-specific primitives for outer
expectation/outer probability, asymptotic measurability of arbitrary maps,
bracketing numbers `N_[]`, empirical-process suprema, or entropy with
bracketing.  Those should be built locally, while reusing mathlib's measure,
integration, convergence, and probability theorems.

## Inventory Status Legend

| Status | Meaning |
| --- | --- |
| `mathlib foundation` | mathlib has close foundational material; local glue may still be needed |
| `local layer exists` | this repo has a compiled proof layer, not necessarily exact textbook statement |
| `pending primitive` | exact textbook definition/theorem still needs local Lean declaration |
| `later roadmap` | not needed for the dependency-minimal proof of 2.4.1, but needed for full textbook-order coverage |

## Chapter 1 Named Items

These are upstream foundations for the book's weak-convergence and
outer-probability language.  They are not all logically required for the first
dependency-minimal proof of Theorem 2.4.1, but full textbook-order coverage
through 2.4.1 requires accounting for them.

| Item | Anchor | Topic | Current status |
| --- | --- | --- | --- |
| 1.2.1 Lemma | `M1:372` | measurable cover function | local layer exists: nonnegative outer-expectation primitives and proof-carrying measurable-cover realization theorem; exact extended-real cover existence remains pending |
| 1.2.2 Lemma | `M1:389` | a.s. rules for arbitrary maps | local layer exists: nonnegative sup/add/inf/product, two-sided constant addition equality, threshold-indicator, and two-sided measurable infimum equality cover algebra; exact extended-real signed clauses, subtraction, absolute value, and remaining equality cases remain pending |
| 1.2.3 Lemma | `M1:438` | outer measure of subsets | local layer exists: nonnegative indicator bridges `P*(B)=E*1_B` and `P_*(B)=E_*1_B`, complement-expectation identity, plus finite-measure event-indicator upper/lower measurable-cover realizations; full extended-real measurable-set-cover identities pending |
| 1.2.4 Lemma | `M1:446` | dominated family measurable cover | local-layer: numbered nonnegative and bounded extended-real dominated a.e.-measurable common-cover wrappers compiled as `VdVWMeasurableCover.vdVW124_exists_common_measurableCover_of_dominated_aemeasurable` and `VdVWBoundedERealMeasurableCover.vdVW124_exists_common_boundedERealMeasurableCover_of_dominated_aemeasurable`; full arbitrary/nonmeasurable extended-real common-cover existence still pending |
| 1.2.5 Lemma | `M1:467` | perfect coordinate projection | local-layer: numbered nonnegative measurable coordinate-projection packages compiled as `vdVW125_fst_coordinateProjection_cover_outer_inner_package_of_measurable` and `vdVW125_snd_coordinateProjection_cover_outer_inner_package_of_measurable`; full arbitrary-map bounded real perfect-projection theorem still pending |
| 1.2.6 Lemma | `M1:480` | outer/inner Fubini inequalities | local-layer/mathlib-foundation: nonnegative measurable Fubini inequality chain compiled as `vdVW126_inner_repeatedInner_repeatedOuter_outer_chain_of_measurable`, plus Tonelli outer-expectation wrappers; exact arbitrary-map/perfect-map extended-real variants still pending |
| 1.2.7 Lemma | `M1:492` | Lipschitz Fubini equality | local-layer/mathlib-foundation: measurable nonnegative repeated-outer equality compiled as `vdVW127_jointOuter_eq_repeatedOuter_symm_of_measurable`, plus symmetric Tonelli wrappers; exact Lipschitz-in-one-coordinate nonmeasurable theorem still pending |
| 1.3.1 Lemma | `M1:575` | Borel sigma field from bounded continuous functions | local-layer/mathlib-foundation: Borel sigma-field least for bounded-continuous real tests wrapped as `vdVW131_borel_le_iff_forall_boundedContinuous_measurable`, with closed-set distance proof |
| 1.3.2 Lemma | `M1:582` | pre-tightness, separability, tightness | local-layer/mathlib-foundation: measure-level separability, pre-tightness, and Polishness predicates introduced as `VdVWProbabilityMeasureSeparable`, `VdVWProbabilityMeasurePreTight`, and `VdVWProbabilityMeasurePolish`; pre-tight measures concentrate on a countable union of totally bounded sets via `VdVWProbabilityMeasurePreTight.exists_iUnion_totallyBounded_measure_compl_eq_zero` and are separable via `VdVWProbabilityMeasurePreTight.separable`/`vdVW132_probabilityMeasure_separable_of_preTight`; separable measures have finite high-mass ball-prefix covers and pre-tightness via `vdVW132_probabilityMeasure_preTight_of_separable` and `vdVW132_probabilityMeasure_preTight_iff_separable`; tight families give σ-compact full-measure support and tight probability measures are pre-tight/separable via `VdVWProbabilityMeasurePreTight.of_tight` and `vdVW132_probabilityMeasure_separable_of_tight`; complete-space tight/pre-tight/separable equivalences are packaged by `vdVW132_complete_probabilityMeasure_tight_preTight_separable_equiv`; Polish-measure tightness is compiled as `vdVW132_probabilityMeasure_tight_of_polish`; random-map/law-facing wrappers still pending |
| 1.3.3 Definition | `M1:585` | weak convergence of arbitrary maps | local-layer/mathlib-foundation: measure-level probability-law wrapper and bounded-continuous integral characterization compiled; exact arbitrary-map outer-expectation primitive pending |
| 1.3.4 Theorem | `M1:606` | Portmanteau | local-layer/mathlib-foundation: closed/open implications proved for probability measures; arbitrary-map/outer version pending |
| 1.3.6 Theorem | `M1:650` | continuous mapping theorem | local-layer/mathlib-foundation: continuous map pushforward and `TendstoInDistribution` continuous-composition wrappers compiled; VdV&W arbitrary-map version pending |
| 1.3.7 Definition | `M1:661` | asymptotic measurability | pending primitive |
| 1.3.8 Lemma | `M1:678` | weak convergence implies asymptotic measurability/tightness relation | pending primitive |
| 1.3.9 Theorem | `M1:688` | Prohorov theorem | local-layer/mathlib-foundation: probability-measure tightness compact-characterization and compact-closure wrappers proved; VdV&W net/sequence arbitrary-map version pending |
| 1.3.10 Theorem | `M1:756` | weak convergence in subspaces | later roadmap |
| 1.3.11 Example | `M1:759` | weak convergence of discrete measures | later roadmap |
| 1.3.12 Lemma | `M1:768` | finite Borel measure uniqueness | local-layer/mathlib-foundation: finite-measure bounded-continuous integral uniqueness wrapped as `vdVW1312_measure_ext_of_forall_boundedContinuous_integral_eq`, finite-measure separating star-subalgebra uniqueness wrapped as `vdVW1312_measure_ext_of_forall_separating_starSubalgebra_integral_eq`, and the measure-level tight separating star-subalgebra convergence variant wrapped as `VdVWWeakConvergenceProbabilityMeasures.of_tight_of_separating_starSubalgebra`; exact arbitrary-map/nonmeasurable variant pending |
| 1.3.13 Lemma | `M1:778` | asymptotic measurability via separating subalgebra | later roadmap |
| 1.4.1 Lemma | `M1:848` | product Borel sigma field | mathlib foundation likely reusable |
| 1.4.2 Lemma | `M1:849` | product measure uniqueness via test functions | local-layer/mathlib-foundation: bounded-continuous integral product-test uniqueness wrappers compiled as `vdVW142_prod_measure_ext_of_forall_boundedContinuous_integral_mul` and `vdVW142_prod_measure_eq_prod_of_forall_boundedContinuous_integral_mul`, with nonnegative bounded-continuous `NNReal`/lintegral variants `vdVW142_prod_measure_ext_of_forall_nnreal_boundedContinuous_lintegral_mul` and `vdVW142_prod_measure_eq_prod_of_forall_nnreal_boundedContinuous_lintegral_mul`; exact real nonnegative-Lipschitz wording remains source-alignment |
| 1.4.3 Lemma | `M1:857` | asymptotic tightness and products | local-layer/mathlib-foundation: measure-level binary and finite product-law weak-convergence wrappers compiled; asymptotic-tightness/arbitrary-map version pending |
| 1.4.4 Lemma | `M1:858` | asymptotic measurability and products | local-layer/mathlib-foundation: finite-coordinate/FDD forward wrapper compiled; asymptotic-measurability and FDD converse pending |
| 1.4.5 Corollary | `M1:878` | product weak convergence criterion | local-layer/mathlib-foundation: measurable common-domain Slutsky/product convergence wrapper compiled; exact product/arbitrary-map criterion pending |
| 1.4.6 Example | `M1:883` | asymptotic independence | later roadmap |
| 1.4.7 Example | `M1:892` | Slutsky lemma | mathlib/topology foundations reusable; VdV&W statement pending |
| 1.4.8 Theorem | `M1:910` | finite-dimensional projections | local-layer/mathlib-foundation: FDD forward direction compiled via finite-coordinate restriction; exact weak-convergence iff-over-FDD converse pending |
| 1.5.1 Example | `M1:927` | continuous functions as subspace of `l_infty` | later roadmap |
| 1.5.2 Lemma | `M1:932` | asymptotic measurability by coordinates | later roadmap |
| 1.5.3 Lemma | `M1:933` | law equality from marginals | later roadmap |
| 1.5.4 Theorem | `M1:934` | weak convergence in `l_infty` via tightness and marginals | later roadmap |
| 1.5.6 Theorem | `M1:958` | asymptotic tightness via finite partitions | later roadmap |
| 1.5.7 Theorem | `M1:987` | asymptotic tightness via semimetric equicontinuity | later roadmap |
| 1.5.8 Addendum | `M1:988` | uniformly continuous paths under tight limit | later roadmap |
| 1.5.9 Lemma | `M1:1044` | tight maps in `l_infty` and semimetrics | later roadmap |
| 1.5.10 Example | `M1:1059` | Gaussian process definition/example | later roadmap |
| 1.6.1 Theorem | `M1:1117` | restrictions on countable unions of index sets | later roadmap |
| 1.7.1 Lemma | `M1:1156` | ball measurable functions and asymptotic measurability | local-layer/mathlib-foundation: open/closed ball sigma-fields, Borel equality, and separable dense-sequence distance-coordinate criterion compiled; arbitrary-map/asymptotic clauses pending |
| 1.7.2 Theorem | `M1:1157` | ball-measurable separable random elements | local-layer/mathlib-foundation: Borel/open-ball/closed-ball dense-sequence distance-coordinate equivalences compiled; exact arbitrary-map separability statement pending |
| 1.7.3 Example | `M1:1178` | cadlag functions | later roadmap |
| 1.7.4 Example | `M1:1179` | pointwise separable processes | later roadmap; relevant to Section 2.3 |
| 1.7.5 Example | `M1:1190` | measurable processes with Suslin index set | later roadmap; relevant to Section 2.3 |
| 1.8.1 Lemma | `M1:1234` | Hilbert-space tightness | local foundation wrappers compiled; exact tightness theorem pending stochastic-process primitives |
| 1.8.2 Lemma | `M1:1245` | Hilbert-space asymptotic measurability | local Frechet-Riesz/Hilbert wrappers compiled; exact asymptotic-measurability theorem pending |
| 1.8.3 Lemma | `M1:1246` | Hilbert-space law equality | local Gaussian-coordinate wrappers compiled; exact law-equality/process theorem pending |
| 1.8.4 Theorem | `M1:1247` | Hilbert-space convergence criterion | local Hilbert/Gaussian foundations compiled; exact convergence criterion pending |
| 1.8.5 Example | `M1:1258` | Hilbert-space CLT | later roadmap |
| 1.8.6 Example | `M1:1268` | Anderson-Darling statistic | later roadmap |
| 1.9.1 Definition | `M1:1292` | stochastic convergence notation around arbitrary maps | common-domain outer-probability primitive formalized; full theorem suite pending |
| 1.9.2 Lemma | `M1:1304` | stochastic convergence implication | later roadmap |
| 1.9.3 Lemma | `M1:1308` | stochastic convergence implication | later roadmap |
| 1.9.5 Theorem | `M1:1328` | continuous mapping for convergence in probability | later roadmap |
| 1.9.6 Theorem | `M1:1354` | equivalent formulations of convergence in probability/distribution context | later roadmap |
| 1.10.1 Definition | `M1:1406` | convergence in outer probability | generic constant-limit and common-domain primitives formalized; full arbitrary-map API still being expanded |
| 1.10.2 Lemma | `M1:1409` | outer-probability comparison lemmas | local-layer/mathlib-foundation: measurable common-domain part (ii) now named as `vdVW1102_ii_tendstoInDistribution_of_vdVWConvergesInOuterProbability`, plus signed bounded-continuous arbitrary-map consequence `vdVW1102_ii_to_signedBoundedContinuousArbitraryMap_aemeasurable`; full arbitrary-map/measurable-cover version remains pending |
| 1.10.3 Theorem | `M1:1420` | a.s. representations | later roadmap |
| 1.10.5 Addendum | `M1:1437` | representation refinement | later roadmap |
| 1.10.6 Example | `M1:1441` | empirical process representation | later roadmap; conceptually relevant |
| 1.10.10 Example | `M1:1548` | expectation convergence under domination | mathlib integrability foundation reusable; exact outer version pending |
| 1.10.11 Example | `M1:1551` | weighted measures and weak convergence | later roadmap |
| 1.10.12 Proposition | `M1:1554` | Borel measurable approximants | later roadmap |
| 1.11.1 Theorem | `M1:1630` | extended continuous mapping theorem | local-layer/mathlib-foundation: fixed continuous-map measurable, signed arbitrary-map, and varying-domain wrappers now named as `vdVW1111_tendstoInDistribution_continuous_comp`, `vdVW1111_signedBoundedContinuousArbitraryMap_comp_continuous`, and `vdVW1111_signedBoundedContinuousVaryingDomains_comp_continuous`; full varying-map/nonmeasurable statement remains pending |
| 1.11.3 Theorem | `M1:1674` | continuous function expectation convergence | later roadmap |
| 1.11.4 Example | `M1:1692` | asymptotic uniform integrability and moments | mathlib integrability foundation reusable; exact outer version pending |
| 1.11.5 Example | `M1:1693` | Gaussian moment convergence | later roadmap |
| 1.11.6 Example | `M1:1694` | dominated convergence under weak convergence | later roadmap |
| 1.12.1 Theorem | `M1:1706` | uniformity in bounded equicontinuous test classes | later roadmap |
| 1.12.2 Theorem | `M1:1718` | bounded Lipschitz determining class | local-layer/mathlib-foundation: measure-level bounded-Lipschitz determining direction and testing consequence compiled as `vdVW1122_weakConvergenceProbabilityMeasures_of_forall_bounded_lipschitz_integral_tendsto` and `vdVW1122_forall_bounded_lipschitz_integral_tendsto_of_weakConvergenceProbabilityMeasures`; exact arbitrary-map/nonmeasurable version pending |
| 1.12.3 Addendum | `M1:1722` | explicit bounded Lipschitz class | later roadmap |
| 1.12.4 Theorem | `M1:1751` | bounded Lipschitz metric for weak convergence | local-layer/mathlib-foundation: measure-level Levy-Prokhorov distance criterion compiled as `vdVW1124_weakConvergenceProbabilityMeasures_iff_levyProkhorovDist_tendsto_zero`, plus both directions `vdVW1124_weakConvergenceProbabilityMeasures_of_levyProkhorovDist_tendsto_zero` and `vdVW1124_levyProkhorovDist_tendsto_zero_of_weakConvergenceProbabilityMeasures`; exact arbitrary-map/nonmeasurable bounded-Lipschitz metric theorem pending |

## Chapter 2 Named Items Through Theorem 2.4.1

| Item | Anchor | Topic | Current status |
| --- | --- | --- | --- |
| 2.1.3 Example | `M1:1870` | empirical distribution function | later roadmap example |
| 2.1.4 Example | `M1:1879` | empirical process indexed by sets | later roadmap example |
| 2.1.5 Definition | `M1:1894` | covering numbers and entropy | local-layer: `vdVWCoveringNumber` wraps mathlib external covering numbers; entropy/logarithm and open-ball exactness pending |
| 2.1.6 Definition | `M1:1895` | bracketing numbers and entropy with bracketing | primitive bracket, width, epsilon-bracket, finite-cover, and numeric `N_[]` layers exist; entropy/logarithm still pending |
| 2.1.10 Example | `M2:160` | process indexed by arbitrary set as function class | later roadmap |
| 2.1.11 Proposition | `M2:169` | Donsker criterion for dual unit ball of `L_p` | later roadmap |
| 2.2.1 Lemma | `M2:229` | Orlicz tail-to-norm bound | later roadmap; not needed for direct 2.4.1 proof |
| 2.2.2 Lemma | `M2:246` | Orlicz norm of maximum | later roadmap |
| 2.2.3 Definition | `M2:292-300` | covering/packing numbers for semimetric spaces | local-layer: semimetric covering/packing wrappers, comparison inequalities, and total-boundedness-to-finiteness direction; entropy/logarithm and open-ball exactness pending |
| 2.2.4 Theorem | `M2:301` | chaining/maximal inequality | later roadmap |
| 2.2.5 Corollary | `M2:314` | maximal inequality corollary | later roadmap |
| 2.2.7 Lemma | `M2:372` | Hoeffding inequality for Rademacher sums | mathlib sub-Gaussian/Hoeffding foundation exists; exact statement pending |
| 2.2.8 Corollary | `M2:405` | separable sub-Gaussian process bound | later roadmap |
| 2.2.9 Lemma | `M2:429` | Bernstein inequality, bounded variables | later roadmap; some probability foundations reusable |
| 2.2.10 Lemma | `M2:438` | maximum bound from tail bound | later roadmap |
| 2.2.11 Lemma | `M2:466` | Bernstein inequality, moment condition | later roadmap |
| 2.2.12 Example | `M2:485` | process tightness by increment bounds | later roadmap |
| 2.3.1 Lemma | `M2:572` | symmetrization | later roadmap; not needed for direct 2.4.1 proof |
| 2.3.3 Definition | `M2:627` | measurable class | local-layer: product measure, weighted supremum display `(2.3.2)`, completion/null-measurability predicate, and countable coordinate-measurable constructor formalized |
| 2.3.4 Example | `M2:630` | pointwise measurable classes | local-layer: pointwise/countable-subclass predicates, pointwise-to-weighted-sum convergence helpers, value-set/boundedness infrastructure for real suprema, bounded pointwise-approximability-to-supremum-equality bridge, and supremum-equality handoff to `P`-measurability; exact convergence-to-supremum-equality proof without extra boundedness assumptions pending |
| 2.3.5 Example | `M2:637` | Suslin-index measurable classes | later roadmap |
| 2.3.6 Lemma | `M2:650` | expectation bound for independent mean-zero processes | later roadmap |
| 2.3.7 Lemma | `M2:672` | symmetrization for probabilities | later roadmap |
| 2.3.9 Lemma | `M2:717` | Donsker sequence consequence | later roadmap |
| 2.3.11 Lemma | `M2:762` | Donsker/equicontinuity equivalences | later roadmap |
| 2.3.12 Corollary | `M2:780` | Donsker equivalence for measurable function classes | later roadmap |
| 2.3.13 Corollary | `M2:784` | Donsker envelope tail consequence | later roadmap |
| 2.3.14 Lemma | `M2:807` | separable versions and convergence | later roadmap |
| 2.3.15 Theorem | `M2:818` | pointwise separable version Donsker equivalence | later roadmap |
| 2.3.16 Proposition | `M2:857` | consistent lifting | later roadmap |
| 2.3.17 Theorem | `M2:882` | separable modification | later roadmap |
| 2.4.1 Theorem | `M2:970` | finite `L1(P)` bracketing numbers imply Glivenko-Cantelli | proved as `vdVW_theorem_2_4_1_glivenkoCantelli` into the book-style predicate; tail-event bridge and countable direct outer-probability corollary from `HasLaw` plus measurable class functions proved |

## Dependency-Minimal Route To Theorem 2.4.1

The direct proof of Theorem 2.4.1 should not wait for all Chapter 1 and
Sections 2.1-2.3 to be formalized literally.  The dependency-minimal route is:

| Order | Needed Lean item | Source anchor | Status |
| --- | --- | --- | --- |
| 1 | real-valued measurable function class over a probability space | `M2:970` | represented by `classFun : Index -> Observation -> ℝ`; integrability/measurability evidence is carried by primitive `FiniteL1BracketCover` witnesses |
| 2 | pointwise bracket `[l, u]` and membership | `M1:1895` | done: `FunctionBracket`, `MemFunctionBracket` |
| 3 | epsilon bracket in `L1(P)` width | `M1:1895`, `M2:970` | done: `l1BracketWidth`, `IsL1EpsilonBracket` |
| 4 | finite bracket cover | `M1:1895`, `M2:972` | done: `FiniteBracketCover`, `FiniteL1BracketCover` |
| 5 | bracketing number `N_[]` or equivalent finite-existence predicate | `M1:1895` | done: `l1BracketingNumber : ℕ∞` and finite-existence witness |
| 6 | construct endpoints from a finite bracket cover | `M2:972-984` | done for primitive covers and fixed-cover iid endpoint convergence |
| 7 | population integral order for bracket endpoints | `M2:972-981` | done using mathlib `integral_mono` |
| 8 | empirical average order for bracket endpoints | `M2:972-981` | done using finite sums |
| 9 | endpoint empirical average SLLN | `M2:984` | done for fixed finite covers: `EndpointSamples.lean` |
| 10 | build `FiniteBracketingEndpointRoute` from primitive brackets | `M2:972-984` | done from primitive cover plus endpoint/width assumptions |
| 11 | decreasing-radius argument | `M2:984` | done for the dependency-minimal deterministic and iid `N_[]` route |
| 12 | final exact theorem statement | `M2:970` | done as book-style predicate: `vdVW_theorem_2_4_1_glivenkoCantelli`; tail-event bridge and countable direct outer-probability corollary from `HasLaw` plus measurable class functions proved |

This route should reuse mathlib for measure/integration/probability and only
build the empirical-process-specific layer locally.

## Full Textbook-Order Remaining Work

For a literal "all content until Theorem 2.4.1" project, the remaining work is
larger than the direct bracketing GC proof.

| Block | Remaining formalization |
| --- | --- |
| Chapter 1.2 | outer probability, outer/inner expectation, measurable covers, VdV&W Fubini variants |
| Chapter 1.3 | weak convergence of arbitrary maps, asymptotic measurability/tightness, Portmanteau/Prohorov wrappers |
| Chapter 1.4 | product weak convergence, asymptotic independence, Slutsky-style results |
| Chapter 1.5-1.7 | `l_infty(T)`, tightness/equicontinuity, separability and measurability variants |
| Chapter 1.8 | Hilbert-space convergence material |
| Chapter 1.9-1.12 | convergence in outer probability, extended continuous mapping, uniform integrability, bounded Lipschitz metric |
| Chapter 2.1 | empirical process examples, covering/bracketing primitive definitions |
| Chapter 2.2 | Orlicz norms, covering/packing numbers, chaining, Hoeffding/Bernstein inequalities |
| Chapter 2.3 | symmetrization, measurable classes, pointwise/Suslin measurability, separable modifications |
| Chapter 2.4.1 | exact finite-bracketing Glivenko-Cantelli theorem |

## Report Rule For Promoted Theorems

Every newly completed exact textbook theorem or lemma derived from VdV&W must
add or update a report under `Reports/`.  Intermediate definitions, structures,
and local support lemmas should update this inventory, the blueprint, or the
dashboard instead, unless they are promoted as part of an exact source-matched
theorem/lemma report. Each report must include a side-by-side table:

| Column | Required content |
| --- | --- |
| Lean realization | declaration name, file, kind, formal role, proof status |
| Markdown textbook anchor | local markdown path and line range, with only short excerpt or paraphrase |
| PDF screenshot anchor | local screenshot path for the corresponding textbook passage |
| Status and gap | exact textbook theorem, proved layer, proof-carrying interface, or pending primitive |

For Theorem 2.4.1 the current screenshot anchor is:

```text
Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png
```

For Definition 2.1.6 the current screenshot anchor is:

```text
Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png
```

For the GC definition in the uniform LLN introduction the current screenshot
anchor is:

```text
Textbooks/Vaart1996/Screenshots/vdvw_gc_definition_pdf_page_96.png
```

These screenshot files are tracked source-audit anchors under
`Textbooks/Vaart1996/`.
