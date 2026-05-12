# VdV&W Formalization Status Through Theorem 2.4.1

This document records the current Lean base, the textbook anchors through
VdV&W Theorem 2.4.1, and the remaining formalization needed before the repo can
claim the full textbook theorem.

The comprehensive named-item inventory for every Chapter 1 and Chapter 2 item
through Theorem 2.4.1 is maintained in:

```text
docs/vdvw_pre_2_4_1_named_item_inventory.md
```

The broader Chapter 1-2 theorem-level blueprint after Theorem 2.4.1 is:

```text
docs/vdvw_chapter1_2_formalization_blueprint.md
```

## Chapter 1 Dependency Policy

The Chapter 1 inventory is intentionally broad, and much of it is fundamental
weak-convergence or stochastic-process infrastructure.  These items should not
be treated as skipped.  The current policy is to split them into:

1. self-contained Chapter 1 building blocks to prove locally without proof
   holes;
2. classical measure/topology results that should be wrapped from pinned
   mathlib under VdV&W-local names;
3. exact VdV&W arbitrary-map, nonmeasurable, perfect-map, or representation
   statements that require a precisely recorded missing primitive.

Any temporary `sorry` sketches for planning should stay out of committed
verified Lean.  Promoted Chapter 1 Lean code remains proof-hole-free.  The
current `StatInference.EmpiricalProcess.WeakConvergence` module starts the
mathlib-backed foundation lane for measure-level weak convergence and
continuous mapping; the broader arbitrary-map outer-expectation layer remains a
separate blocker.

## Current Verified Lean Base

Tracked Lean files are intentionally restricted to the empirical-process core
and minimal deterministic support:

| File | Role |
| --- | --- |
| `StatInference/Asymptotics/Basic.lean` | deterministic deviation/oracle support lemmas |
| `StatInference/EmpiricalProcess/Basic.lean` | empirical-deviation, GC, finite-class interfaces |
| `StatInference/EmpiricalProcess/Average.lean` | finite-sample empirical averages and empirical-risk notation |
| `StatInference/EmpiricalProcess/Finite.lean` | finite-union and finite-class deviation certificates |
| `StatInference/EmpiricalProcess/Preservation.lean` | projection/subclass preservation lemmas |
| `StatInference/EmpiricalProcess/Complexity.lean` | proof-carrying complexity interfaces |
| `StatInference/EmpiricalProcess/CoveringPrimitive.lean` | Chapter 2.1 covering-number, empirical `L1(P_n)`, semimetric covering/packing, and finite-cover witness primitives |
| `StatInference/EmpiricalProcess/Bracketing.lean` | deterministic bracketing inequality and route to GC |
| `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive brackets, `L1(P)` width, finite covers, and primitive cover-to-route theorems |
| `StatInference/EmpiricalProcess/BracketingCountable.lean` | countable decreasing finite-cover route |
| `StatInference/EmpiricalProcess/EndpointStrongLaw.lean` | endpoint SLLN wrappers from mathlib |
| `StatInference/EmpiricalProcess/EndpointSamples.lean` | iid sample-path endpoint SLLN bridge for finite bracket covers |
| `StatInference/EmpiricalProcess/OuterExpectation.lean` | Chapter 1.2 nonnegative outer-expectation, measurable-cover primitives, measurable real signed positive/negative bridge, and bounded `EReal` cover bridge |
| `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean` | Chapter 1.2 outer-probability, outer-a.s., and outer-expectation tail/Markov bridge primitives |
| `StatInference/EmpiricalProcess/WeakConvergence.lean` | Chapter 1.3/1.11 mathlib-backed weak-convergence, bounded-Lipschitz, Levy-Prokhorov, continuous-mapping, product, and FDD wrappers |
| `StatInference/EmpiricalProcess/BallSigma.lean` | Chapter 1.7 open/closed ball sigma-field, Borel equality, dense-sequence distance-coordinate, and bounded distance-coordinate measurability wrappers |
| `StatInference/EmpiricalProcess/HilbertGaussian.lean` | Chapter 1.8 Hilbert/L2/Gaussian mathlib-backed foundation wrappers |
| `StatInference/EmpiricalProcess/PMeasurable.lean` | Chapter 2.3 product-measure, product-measure probability instance, `P`-measurable class, weighted sample-sum, and finite-cover supremum-bound primitives |
| `StatInference/EmpiricalProcess/RealHalfLine.lean` | Example 2.4.2 reusable half-line bracket, endpoint, CDF/Stieltjes, and grid primitives |
| `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Conditional half-line Glivenko-Cantelli corollaries from supplied endpoint grids |
| `StatInference/EmpiricalProcess/FiniteDimensional.lean` | Chapter 1.4.8 uniqueness-only empirical-process FDD wrappers for process-law equality and `IdentDistrib` |
| `StatInference/EmpiricalProcess/Theorem243.lean` | Theorem 2.4.3 covering, truncation, product-copy/Fubini, ordinary truncation-tail integral, fixed-sample net, finite-center handoff, Rademacher sub-Gaussian, variance-proxy, sub-Gaussian proxy monotonicity, finite-center tail, finite-supremum integrability, expected finite-center supremum handoff, layer-cake tail-integral monotonicity, Gaussian-tail integrability/evaluation, coarse closed-form finite-center expectation-bound layers, split-at-radius tail-to-expectation layers, Mills-type finite-center expectation layers, expected-maximal packaging, truncated Rademacher expected-maximal specialization, finite-empirical-cover expected-maximal wrapper, fixed-sample `Phi(x)=x` ghost comparison, finite product-coordinate projection, one-sided product-sample projections, deterministic weight sign-flip invariance, expectation-level integral lifts, supplied-`hphi_id` finite-net projection, random-cover entropy convergence, product-integrated centered finite-net composition, and fixed-`M` centered-truncated convergence from vanishing integrated finite-net upper bounds, including a real-mean consumer |
| `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | generic outer-probability convergence primitives and local/outer GC wrappers for the primitive bracketing theorem |

Old local non-empirical-process theorem experiments are not part of this clean
repo.  The current tracked Lean library has no `sorry`, `admit`, `axiom`, or
`unsafe` in `StatInference`.

Current verification gate:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

Expected result: build succeeds and the proof-hole scan returns no matches.

## Textbook Anchors

The markdown/PDF/screenshot assets are tracked source-audit anchors under
`Textbooks/Vaart1996/`.

The full inventory through Theorem 2.4.1 contains 102 named items: 70 in
Chapter 1, 31 in Chapter 2 before Theorem 2.4.1, and Theorem 2.4.1 itself.
The table below is only the active direct-proof anchor subset.

| Textbook item | Markdown anchor | Current Lean status |
| --- | --- | --- |
| Section 1.2 outer integrals and Lemma 1.2.1 measurable cover | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:356-388` | nonnegative `ℝ≥0∞` outer-expectation and proof-carrying measurable-cover primitive layer formalized; extended-real existence theorem remains pending |
| Lemma 1.2.2, measurable-cover algebra | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:389-437` | nonnegative sup/add/inf/product cover algebra proved; two-sided constant addition equality proved as `VdVWMeasurableCover.addConstLeft` and `VdVWMeasurableCover.addConstRight`; nonnegative threshold-indicator clause proved as `VdVWMeasurableCover.thresholdIndicatorCover` and `VdVWOuterExpectation_thresholdIndicator_eq_measure_cover_threshold`; two-sided measurable infimum equality proved as `VdVWMeasurableCover.infOfMeasurableLeft` and `VdVWMeasurableCover.infOfMeasurableRight`; measurable integrable real signed bridge proved as `VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_measurable`; full arbitrary-map signed extended-real statement remains pending |
| Lemma 1.2.3, outer probabilities as outer integrals | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:438-445` | nonnegative indicator version proved: `VdVWOuterExpectation_eventIndicator_eq_measure`; finite-measure event-indicator measurable-cover bridge proved: `VdVWMeasurableCover.eventIndicatorOfToMeasurable`; inner indicator equality proved: `VdVWMeasurableLowerCover.eventIndicatorOfToMeasurableCompl` and `VdVWInnerExpectation_eventIndicator_eq_innerProbability`; complement-expectation identity proved as `VdVWOuterExpectation_eventIndicator_add_innerExpectation_compl` |
| Definition 1.3.3, weak convergence | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:585` | measure-level probability-law wrapper proved as `VdVWWeakConvergenceProbabilityMeasures`; exact arbitrary-map/outer-expectation definition remains a separate primitive |
| Theorem 1.3.4, Portmanteau implications | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:606` | measure-level closed/open implications proved as `VdVWWeakConvergenceProbabilityMeasures.limsup_measure_closed_le` and `VdVWWeakConvergenceProbabilityMeasures.le_liminf_measure_open`; exact arbitrary-map/outer-expectation version remains pending |
| Theorem 1.3.6 / Theorem 1.11.1, continuous mapping | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:650,1630` | fixed continuous-map, measurable law-level wrappers proved as `VdVWWeakConvergenceProbabilityMeasures.map_continuous` and `vdVWTendstoInDistribution_continuous_comp`; varying-map/nonmeasurable VdV&W formulations remain pending |
| Theorem 1.3.9, Prohorov theorem foundations | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:688` | probability-measure tightness wrapper, compact-set characterization, and compact-closure wrapper proved as `VdVWProbabilityMeasuresTight`, `vdVWProbabilityMeasuresTight_iff_exists_compact_measure_compl_le`, and `VdVWProbabilityMeasuresTight.isCompact_closure`; exact arbitrary-map/asymptotic-tightness extension remains pending |
| Lemma 1.7.1, ball sigma-field foundation | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1156` | open-ball and closed-ball sigma-field wrappers, rational open/closed ball bridge lemmas, open-ball/closed-ball sigma equality, Borel equality, generator measurability, and separable dense-sequence distance-coordinate measurability iff proved in `BallSigma.lean`; arbitrary-map/asymptotic-measurability clauses remain pending |
| Definition 1.10.1, convergence in outer probability to a constant | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1406` | generic constant-limit and common-domain outer-probability primitives formalized; common-domain equivalence with mathlib `TendstoInMeasure` proved; uniform-deviation predicates and conditional tail-continuity bridge formalized |
| Lemma 1.10.2, outer probability versus weak convergence | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1408-1417` | measurable common-domain version of part (ii) proved using mathlib convergence in distribution |
| GC definition for uniform LLN | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1828-1834` | book-style predicate formalized with outer-probability and outer-a.s. branches |
| Definition 2.1.5, covering numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1894` | local-layer: `vdVWCoveringNumber` wraps mathlib external covering numbers, with explicit finite-cover witnesses, `vdVWCoveringLogEntropy`, and slack note for open vs closed balls |
| Definition 2.1.6, bracketing numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1895` | primitive bracket, epsilon-bracket, finite-cover, and numeric `N_[]` layers formalized |
| Definition 2.2.3, semimetric covering and packing numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:292-300` | local-layer: `vdVWSemimetricCoveringNumber`, `vdVWSemimetricPackingNumber`, `vdVWSemimetricLogEntropy`, `N <= D <= N(epsilon/2)`, and total-boundedness-to-finiteness direction formalized; square-root entropy/integral wrappers still pending |
| Definition 2.3.3, `P`-measurable classes | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:627` | local-layer: `vdVWProductMeasure`, display `(2.3.2)` weighted sample sums and class suprema, `VdVWPMeasurableClass`, countable coordinate-measurable constructor, and deterministic finite-cover supremum bound formalized |
| Chapter 2.4 intro | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:963-969` | reflected in roadmap only |
| Theorem 2.4.1 statement | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:970` | proved as `vdVW_theorem_2_4_1_glivenkoCantelli` via the outer-a.s. branch |
| Theorem 2.4.1 proof, finite brackets and endpoint inequality | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:972-981` | deterministic bracketing theorem proved |
| Theorem 2.4.1 proof, endpoint SLLN and decreasing radius | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:984` | endpoint SLLN wrapper, iid sample-path bridge, finite endpoint-radius bridge, and countable/decreasing-scale assembly proved |
| Example 2.4.2, empirical CDF brackets | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:985` | local-layer: real and extended-real half-line bracket membership, endpoint integrability, `L1(P)` width identities, probability-measure CDF/Stieltjes open-cell identity and CDF-increment-to-middle-width handoffs, finite-measure real-tail cutpoints, adjacent-endpoint grid handoff, supplied finite-grid bridges, one-cell base grid and one-cell adjacent-endpoint base grid for radii above total mass, radius-monotonicity helpers for supplied real/extended/adjacent-endpoint grids, finite-real-endpoint assembly constructor, three-cell endpoint-grid constructor from supplied tail/middle width bounds and CDF increment bounds, reduction of full endpoint-grid existence, primitive-grid existence, and bracketing-number finiteness to `0 < epsilon <= μ.real univ`, all-positive-radius `N_[] < ∞` handoff, conditional GC corollary from supplied grids, and conditional GC corollary from adjacent endpoint grids; distribution-dependent middle-cell finite partition in the nontrivial radius range and exact example report remain pending |

Current screenshot anchors:

```text
Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png
Textbooks/Vaart1996/Screenshots/vdvw_lemma_1_2_1_pdf_page_6.png
Textbooks/Vaart1996/Screenshots/vdvw_definition_1_10_1_pdf_page_72.png
Textbooks/Vaart1996/Screenshots/vdvw_gc_definition_pdf_page_96.png
Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png
Textbooks/Vaart1996/Screenshots/vdvw_example_2_4_2_pdf_page_138.png
```

## What Is Already Proved Toward Theorem 2.4.1

The following are compiled Lean declarations with no proof holes:

| Lean declaration | Textbook proof role |
| --- | --- |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` | formalizes the deterministic bracket comparison step |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds` | packages that comparison across sample sizes |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero` | converts vanishing endpoint and width radii into the current GC interface |
| `FiniteBracketingEndpointRoute` | proof-carrying finite-bracket route |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass` | converts a verified route into `GlivenkoCantelliClass` |
| `endpoint_strong_law_ae_real` | wraps mathlib strong law for one endpoint |
| `finite_endpoint_strong_law_ae_real` | finite endpoint family strong-law handoff |
| `samplePath`, `empiricalAverage_samplePath_eq_range_sum` | deterministic sample path from an observation process and its range-sum rewrite |
| `endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid` | iid endpoint empirical average converges almost surely to the population integral |
| `FiniteL1BracketCover.endpoint_tendsto_ae_of_iid`, `FiniteL1BracketCover.exists_endpointRadius_ae_of_iid` | fixed finite bracket cover gets endpoint convergence and endpoint-radius fields almost surely |
| `FunctionBracket`, `MemFunctionBracket`, `l1BracketWidth`, `IsL1EpsilonBracket` | primitive Definition 2.1.6 bracket vocabulary |
| `FiniteBracketCover`, `FiniteL1BracketCover` | finite primitive cover witnesses with integrability and width evidence |
| `FiniteL1BracketCoverAtCard`, `HasFiniteL1BracketingNumber` | explicit-cardinality finite bracketing witness layer |
| `l1BracketingNumber`, `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` | primitive numeric `N_[] : ℕ∞` and finite-cover bridge |
| `finiteEndpointRadius`, `exists_endpointRadius_of_finite_endpoint_tendsto` | finite endpoint convergence produces one vanishing endpoint-radius sequence |
| `FiniteL1BracketCover.endpointRadius`, `FiniteL1BracketCover.exists_endpointRadius_of_endpoint_tendsto` | primitive-cover endpoint-radius bridge |
| `FiniteL1BracketCover.empiricalDeviationBoundOn_of_endpoint_bounds` | one-sample primitive-cover deviation bound |
| `FiniteL1BracketCover.empiricalDeviationSequenceOn_of_endpoint_bounds` | sequence-level primitive-cover deviation bound |
| `FiniteL1BracketCover.toFiniteBracketingEndpointRoute` | primitive cover constructor into the existing finite endpoint route |
| `PrimitiveFiniteBracketingGCRoute.ofFiniteCoversAndEndpointTendsto` | route constructor from finite covers and endpoint convergence |
| `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | epsilon/eventual deterministic route from primitive finite covers |
| `CountablePrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | countable decreasing-cover deterministic route |
| `uniformDeviationTendstoZeroOn_ae_of_iid_countable_covers` | iid observations plus countably many finite covers imply a.s. pathwise uniform deviation convergence |
| `uniformDeviationTendstoZeroOn_ae_of_iid_l1BracketingNumber_lt_top` | primitive `N_[]` finiteness at every positive radius implies a.s. pathwise uniform deviation convergence |
| `VdVWMeasurableMajorant`, `VdVWOuterExpectation`, `VdVWMeasurableCover` | nonnegative Chapter 1.2 outer-expectation and measurable-cover primitive layer |
| `VdVWOuterExpectation_eq_lintegral_of_measurable`, `VdVWOuterExpectation_eq_lintegral_cover` | nonnegative outer expectation is realized by measurable maps and supplied minimal measurable covers |
| `VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_measurable` | for measurable integrable real maps, the difference between positive-part and negative-part nonnegative outer expectations equals the Bochner integral |
| `VdVWEventIndicator`, `VdVWMeasurableSetCover`, `VdVWOuterExpectation_eventIndicator_eq_measure` | Lemma 1.2.3(i) nonnegative indicator bridge: outer probability as outer expectation |
| `VdVWMeasurableCover.eventIndicatorOfToMeasurable`, `VdVWOuterExpectation_eq_lintegral_eventIndicatorCover` | finite-measure event-indicator measurable-cover bridge using mathlib `toMeasurable` |
| `AlmostSureUniformDeviationTendstoZeroOn` | names the ordinary a.s. pathwise uniform LLN convergence mode used by the local GC wrapper |
| `VdVWAlmostSureGlivenkoCantelliClass` | packages iid law/independence assumptions and the local GC conclusion |
| `almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top` | converts primitive `N_[]` finiteness into the named a.s. convergence wrapper |
| `vdVWAlmostSureGlivenkoCantelliClass_of_iid_l1BracketingNumber_lt_top` | packages the primitive bracketing theorem as a local a.s. pathwise Glivenko-Cantelli conclusion |
| `VdVWOuterProbability`, `VdVWOuterAlmostSure`, `VdVWOuterProbability_lt_le_outerExpectation_div_cover` | formalize outer probability of arbitrary events and outer-a.s. truth using mathlib's outer-measure semantics for `Measure`, plus a Markov-style outer-probability bound from a supplied measurable cover |
| `VdVWConvergesInOuterProbabilityConst`, `VdVWConvergesInOuterProbability` | generic VdV&W outer-probability convergence primitives for varying-space constant limits and common-domain limits |
| `vdVWConvergesInOuterProbability_of_tendstoInMeasure` | bridge from mathlib `TendstoInMeasure` to the common-domain VdV&W outer-probability predicate |
| `tendstoInMeasure_of_vdVWConvergesInOuterProbability` | bridge from the common-domain VdV&W outer-probability predicate to mathlib `TendstoInMeasure` |
| `vdVWConvergesInOuterProbability_iff_tendstoInMeasure` | common-domain equivalence between VdV&W outer-probability convergence and mathlib convergence in measure |
| `tendstoInDistribution_of_vdVWConvergesInOuterProbability` | measurable common-domain version of Lemma 1.10.2(ii): outer-probability convergence implies convergence in distribution |
| `VdVWWeakConvergenceProbabilityMeasures`, `vdVWWeakConvergenceProbabilityMeasures_iff_forall_integral_tendsto`, `vdVWWeakConvergenceProbabilityMeasures_iff_forall_bounded_lipschitz_integral_tendsto`, `vdVWWeakConvergenceProbabilityMeasures_iff_levyProkhorov_tendsto`, `vdVWWeakConvergenceProbabilityMeasures_iff_levyProkhorovDist_tendsto_zero` | measure-level VdV&W weak-convergence wrapper and bounded-continuous, bounded-Lipschitz, and Levy-Prokhorov characterizations, proved by pinned mathlib |
| `VdVWWeakConvergenceProbabilityMeasures.limsup_measure_closed_le`, `VdVWWeakConvergenceProbabilityMeasures.le_liminf_measure_open` | measure-level Portmanteau closed/open implications wrapped from pinned mathlib |
| `VdVWProbabilityMeasuresTight`, `vdVWProbabilityMeasuresTight_singleton`, `vdVWProbabilityMeasuresTight_iff_exists_compact_measure_compl_le`, `VdVWProbabilityMeasuresTight.isCompact_closure` | probability-measure tightness, singleton tightness, and Prokhorov compact-closure foundations wrapped from pinned mathlib |
| `VdVWWeakConvergenceProbabilityMeasures.map_continuous`, `vdVWTendstoInDistribution_continuous_comp` | mathlib-backed continuous mapping wrappers for probability laws and convergence in distribution |
| `VdVWWeakConvergenceProbabilityMeasures.prod`, `VdVWWeakConvergenceProbabilityMeasures.pi`, `VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict` | mathlib-backed product-law weak-convergence wrappers and finite-coordinate/FDD forward wrapper for Chapter 1.4 |
| `vdVWTendstoInDistribution_prodMk_of_tendstoInMeasure_const` | measurable common-domain Slutsky/product convergence wrapper for Section 1.4 |
| `VdVWOpenBallSets`, `VdVWOpenBallMeasurableSpace`, `VdVWClosedBallSets`, `VdVWClosedBallMeasurableSpace`, `vdVWOpenBallSets_isTopologicalBasis`, `vdVW_ball_eq_iUnion_rat_closedBall`, `vdVW_closedBall_eq_iInter_rat_ball`, `vdVWClosedBallMeasurableSpace_eq_openBallMeasurableSpace`, `vdVWBorel_eq_openBallMeasurableSpace`, `vdVWOpenBall_measurableSet`, `vdVWClosedBall_measurableSet`, `vdVWBoundedDist_measurable_iff_dist`, `vdVWBoundedDist_measurable_openBallSigma`, `vdVWBoundedDist_measurable_closedBallSigma`, `vdVWBorelMeasurable_iff_forall_denseSeq_boundedDist_measurable` | mathlib-backed open/closed ball sigma-field, Borel equality, and bounded/dense distance-coordinate wrappers for Chapter 1.7 |
| `vdVWHilbertSpace_of_complete_innerProductSpace`, `vdVWL2_hilbertSpace`, `vdVWL2_inner_def`, `vdVWHilbertDualRepresentative`, `vdVWHilbertDualRepresentation`, `vdVWHasGaussianLaw_inner`, `vdVWGaussianProcess_eval` | mathlib-backed Hilbert/L2/Gaussian-process foundation wrappers for Section 1.8 |
| `VdVWBoundedERealMeasurableCover`, `VdVWBoundedERealMeasurableCover.lower_le_cover`, `VdVWBoundedERealMeasurableCover.ofMeasurable`, `VdVWBoundedERealMeasurableCover.toNonnegativeCover` | bounded extended-real measurable-cover primitive, lower-bound inheritance, and nonnegative-cover bridge for Chapter 1.2 exactness work |
| `vdVW148_processLaw_ext_of_forall_finiteDimensional_eq`, `vdVW148_identDistrib_of_forall_finiteDimensional_identDistrib` | Chapter 1.4.8 uniqueness-only FDD wrappers: equality or identical distribution of all finite-dimensional restrictions gives equality or identical distribution of the process law; this is not the full weak-convergence/FDD-converse theorem |
| `integral_abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail`, `FiniteEmpiricalL1CoverAtCard.cardinality_pos_of_nonempty`, `vdVWTheorem243_oneCenter_rademacher_subGaussian_bridge`, `vdVWTheorem243_varianceProxy_real_le_of_abs_le`, `vdVWTheorem243_truncated_varianceProxy_le`, `vdVWTheorem243_hasSubgaussianMGF_mono`, `vdVWTheorem243_abs_tail_le_of_hasSubgaussianMGF`, `vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF`, `vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF_of_pos`, `vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF`, `vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF_of_pos`, `vdVWTheorem243FiniteCenterExpectedSupremum`, `vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail`, `vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF`, `vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF_of_pos`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_tail_bound`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_subGaussian_tail_bound`, `vdVWTheorem243_subGaussian_tail_bound_integrable`, `vdVWTheorem243_integral_subGaussian_tail_bound_eq`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_subGaussian_tail_closedForm`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_tail_bound`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_subGaussian_tail_bound`, `vdVWTheorem243_integral_mul_exp_neg_mul_sq_Ioi_eq`, `vdVWTheorem243_integral_exp_neg_mul_sq_Ioi_le_mills`, `vdVWTheorem243_integral_subGaussian_exp_tail_le_mills`, `vdVWTheorem243_integral_finiteCenter_subGaussian_tail_le_mills`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_bound`, `vdVWTheorem243_logRadius_pos`, `vdVWTheorem243_logRadius_sq_div`, `vdVWTheorem243_logRadius_exp_factor_eq`, `vdVWTheorem243_logRadius_mills_factor_eq`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_logRadius_mills_bound`, `vdVWTheorem243LogRadiusMillsUpper`, `vdVWTheorem243LogRadiusMillsUpper_nonneg`, `VdVWTheorem243FiniteCenterExpectedMaximalBound`, `VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills`, `VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le`, `VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le_finiteNetHoeffdingUpper`, `vdVWTheorem243_truncated_rademacher_expectedMaximalBound`, `vdVWTheorem243_truncated_rademacher_expectedMaximalBound_of_finiteEmpiricalL1CoverAtCard`, `vdVWTheorem243_truncated_commonProxy_pos`, `VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale`, `vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard`, `vdVWTheorem243FiniteCenterExpectedSupremum_nonneg`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_of_ae_le`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_ae_le`, `vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_pos_of_ae_le` | one-center random Rademacher weighted sum is sub-Gaussian, its truncated-envelope variance proxy is bounded by `M^2 / n`, sub-Gaussian proxy monotonicity promotes center-specific proxies to a common upper proxy, empirical covers of nonempty classes provide positive center cardinality, finite center suprema have a compiled sub-Gaussian tail/union-bound layer, the finite supremum of absolute sub-Gaussian centers is integrable, the expected finite-center supremum is represented by layer-cake tails and bounded by supplied tail majorants, the sub-Gaussian Gaussian majorant is integrable and has closed-form integral `(cardinality : ℝ) * sqrt (2*pi*c)`, giving a coarse finite-center expectation bound, the split-at-radius bound isolates the logarithmic tail remainder, the Mills-type bound controls that remainder for positive radii, the logarithmic-radius arithmetic has been compiled into a finite-center expectation bound and reusable log-radius upper, the expected maximal-bound predicate is packaged, the generic expected-maximal handoff now has a direct finite-net Hoeffding-upper specialization, truncated Rademacher expected-maximal specializations are compiled including a finite empirical-cover wrapper, positivity of the common proxy `M^2/n` is proved from `0 < n` and `0 < M`, and the finite empirical-cover expected-maximal wrapper can target the VdV&W Hoeffding display scale through the now-proved scale comparison; the remaining maximal-to-Theorem-2.4.3 work is fixed-`M` truncated convergence and final assembly |
| `vdVWTheorem243_exp_neg_one_le_half`, `vdVWTheorem243_logRadius_log_le_succ`, `VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale.of_pos`, `vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard_of_pos` | 2026-05-03 update: the previously named scale-comparison handoff is now proved under `0 < cardinality`, `0 < n`, and `0 < M`, and the finite empirical-cover truncated Rademacher expected-maximal wrapper now reaches the VdV&W Hoeffding display scale without an extra supplied scale hypothesis.  The remaining Theorem 2.4.3 blockers are fixed-`M` truncated convergence and final assembly. |
| `VdVWPMeasurableClass.truncate_of_countable_of_coordinate` | 2026-05-03 update: countable coordinate-measurable classes are now proved `P`-measurable after the `F_M` truncation.  This closes a concrete Definition 2.3.3 measurability gate for Theorem 2.4.3 symmetrization/truncation; the remaining active blocker is fixed-`M` truncated convergence. |
| `envelope_tail_ofReal_eq_tailProduct`, `VdVWOuterExpectation_envelope_tail_le_lintegral_tail_cover`, `VdVWOuterProbability_envelope_tail_gt_le_outerExpectation_div`, `VdVWOuterExpectation_envelope_tail_eq_lintegral_tail_of_measurable`, `lintegral_envelope_tail_lt_tendsto_zero_of_integrable`, `VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable`, `measurable_vdVWTruncatedClassFun_pairDifference` | 2026-05-03 update: the real-valued envelope-tail term `F 1{F > M}` is now connected to the Chapter 1.2 nonnegative tail-product cover algebra and Markov outer-probability bridge, with a measurable-envelope ordinary-lintegral specialization and measurable-integrable convergence to zero as `M -> ∞`.  Fixed truncated product-copy pair differences are also measurable.  The next Theorem 2.4.3 frontier is fixed-`M` truncated convergence; nonmeasurable/arbitrary-cover tail variants should only be added if the final assembly needs them. |
| `probability_pi_map_mapped_coordinates_eq`, `probability_pi_independent_mapped_coordinates_with_joint_law`, `probability_pi_integral_weighted_sum_const_sub`, `probability_pi_prod_coordinates_measurePreserving`, `vdVWTheorem243_productCopy_fst_hasLaw`, `vdVWTheorem243_productCopy_snd_hasLaw`, `vdVWTheorem243_productCopy_fst_snd_indep`, `vdVWTheorem243_productCopy_fst_snd_identDistrib`, `integrable_vdVWTruncatedClassFun_pairDifference`, `vdVWTheorem243_productCopy_truncatedClassFun_laws_indep`, `vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep`, `integral_vdVWTruncatedClassFun_productCopy_pairDifference_eq_zero`, `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`, `measurePreserving_vdVWProductMeasure_prod_to_original`, `measurePreserving_vdVWProductMeasure_prod_to_ghost`, `integral_vdVWTruncatedClassFun_productSample_const_sub_eq`, `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`, `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`, `vdVWWeightedClassSupremum_pairDifference_le_add`, `vdVWWeightedClassSupremum_truncated_pairDifference_le_add`, `vdVWWeightedSampleSum_neg_weights`, `vdVWWeightedClassSupremum_neg_weights`, `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd`, `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd_same_weights`, `VdVWTheorem243SymmetrizationPrecursor.randomSign_expectedMaximal_le`, `VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add`, `VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`, `ae_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSigns` | 2026-05-03 update: Theorem 2.4.3 now has VdVW-facing product-copy wrappers for the two `P.prod P` coordinates, plus finite-`Pi` mapped-coordinate laws/independence for sample-coordinate truncated class functions, reusing the Billingsley/ProbabilityMeasure product-self-copy and finite-`Pi` product-law layers.  Fixed truncated pair differences are integrable on `P.prod P` whenever the fixed truncated coordinate is integrable under `P`, their product-copy mean is zero, finite ghost-copy integration has the fixed-original-sample identity needed for the conditional Fubini step, the fixed-sample centered supremum is bounded by the ghost pair-difference expectation, the finite product-coordinate projection, one-sided projections, deterministic sign-flip invariance, and expectation-level integral lifts, including the same-weight pair-split rewrite, are compiled, the pair-difference supremum has a deterministic split into coordinate suprema, and the random-sign side now exposes expected-maximal, supplied-cover outer-expectation, supplied-`hphi_id` finite-net projections, random empirical-cover product finite-net handoff, and expectation-level random-cover outer-expectation projection.  The next step is fixed-`M` truncated convergence; the fixed-sample pointwise and product-a.e. finite-center Hoeffding targets are too strong. |
| `vdVWTheorem243_truncated_productCopy_mapped_hasLaw_indep` | Fixed mapped product-copy law and independence wrapper for truncated class coordinates; this came in with the product-Fubini gate and remains part of the fixed-`M` assembly support. |
| `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`, `vdVWWeightedClassSupremum_rademacherWeights_neg_sign` | 2026-05-03 update: the same-weight pair split now projects back to `2 *` the ordinary original-sample `P^n` expectation, and negating all Rademacher signs leaves the weighted class supremum unchanged.  The remaining work is fixed-`M` truncated convergence, not the product-coordinate, deterministic sign-negation, or product-a.e. Hoeffding layer. |
| `integral_integral_vdVWWeightedClassSupremum_pairDifference_eq_integral_productSample`, `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifference`, `integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original` | 2026-05-03 update: the fixed-sample `Phi(x)=x` ghost-copy comparison has been lifted through Fubini/product projection and composed with the same-weight pair split, giving a direct centered-supremum expectation bound by twice the ordinary truncated-supremum expectation.  The random-sign outer-expectation conversion is now available through the product-integrated expected-maximal route; the next gap is fixed-`M` truncated convergence. |
| `vdVWRandomEmpiricalL1CoverAtCard_center_mem`, `vdVWRandomEmpiricalL1CoverAtCard_cardinality_pos`, `vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_randomEmpiricalL1CoverAtCard_of_pos`, `integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`, `VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`, `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`, `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbability_zero_of_logCardinality_littleO_n`, `vdVWTheorem243FiniteNetHoeffdingUpper_add_convergesInOuterProbability_epsilon_of_logCardinality_littleO_n`, `VdVWConvergesInOuterProbability_zero_of_outerExpectation_tendsto_zero_ofReal`, `VdVWConvergesInOuterProbability_zero_of_outerExpectation_le_tendsto_zero_ofReal`, `VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_tendsto_zero_ofReal`, `VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_le_tendsto_zero_ofReal`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_tendsto_zero`, `tendsto_two_mul_ofReal_zero_of_tendsto_zero`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_real_tendsto_zero`, `tendsto_integral_finiteNetHoeffdingUpper_add_coverRadius_of_tendsto_integral_finiteNetHoeffdingUpper`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_and_coverRadius_tendsto_zero` | 2026-05-03 update: the selected random empirical-cover witness now feeds the expectation-level finite-net route all the way through product outer expectation, the centered-truncated product-integral bound is composed with it, the entropy-to-Hoeffding/Markov convergence handoffs are compiled, and the fixed-`M` centered-truncated convergence handoff is available for variable product sample spaces under a vanishing integrated Hoeffding-plus-radius hypothesis, an ordinary real mean convergence hypothesis, or the split finite-net-mean plus cover-radius convergence inputs.  This replaces the over-strong product-a.e. finite-center Hoeffding route for selected noncomputable covers.  The remaining active blocker is proving finite-net Hoeffding upper mean convergence from entropy plus a variable-domain bounded-convergence/UI primitive, then final Theorem 2.4.3 assembly. |
| `probability_integral_le_threshold_add_bound_mul_tail`, `tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`, `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_bounded` | 2026-05-03 update: the bounded variable-domain outer-probability-to-mean bridge, measurable-cardinality finite-net upper measurability/integrability packaging, and bounded entropy-to-finite-net-mean consumer now feed directly into a fixed-`M` centered-truncated convergence theorem.  The remaining Theorem 2.4.3 blocker is no longer composing these layers; it is deriving/supplying the measurable-cardinality, boundedness/UI or dominated-convergence, and cover-radius convergence side conditions from the book entropy setup, then performing the final truncation/tail assembly. |
| `VdVWTheorem243FixedMInvRadiusEntropySideConditions`, `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`, `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_bounded` | 2026-05-03 update: the inverse-radius route now has a theorem-facing side-condition package for selected covers at radius `1/(n+1)`, diagonal log-cardinality convergence, and measurable cardinality.  The fixed-`M` centered-truncated consumer can use this package directly while keeping the finite-net upper boundedness/UI input explicit as `hupperBound`; no fixed-domain mathlib UI/Vitali theorem currently removes that assumption. |
| `measurable_terminal_minimalRandomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`, `measurable_selected_randomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable_of_measurable`, `measurable_selected_truncatedRandomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated_invRadius`, `VdVWTheorem243SelectedInvRadiusEntropySideConditions`, `VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_invRadiusFiniteCovers`, `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy` | 2026-05-03 update: selected terminal minimal-cardinality measurability is packaged for countable class-coordinate-measurable classes, including the theorem-facing truncated class, and the inverse-radius fixed-`M` consumer can discharge measurable-cardinality from equality with the selected truncated minimal-cardinality process.  The selected inverse-radius entropy package now has a finite-cover constructor and compact fixed-`M` convergence consumer, closing the finite-cover domination and terminal-equality plumbing.  The remaining blocker is the selected diagonal shrinking-radius log convergence plus normalized log-ratio bound or a genuine UI replacement. |
| `VdVWOuterAlmostSureUniformDeviationTendstoZeroOn`, `VdVWOuterAlmostSurePGlivenkoCantelliClass` | exact outer-a.s. uniform LLN and `P`-Glivenko-Cantelli predicates |
| `vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top` | converts primitive `N_[]` finiteness into outer-a.s. uniform deviation convergence |
| `vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli` | VdV&W Theorem 2.4.1 in the outer-a.s. convergence mode |
| `VdVWOuterProbabilityUniformDeviationTendstoZeroOn`, `VdVWOuterProbabilityPGlivenkoCantelliClass` | outer-probability convergence-mode predicates |
| `VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_tail` | tail-event sufficient condition for the direct outer-probability branch |
| `VdVWUniformDeviationBadEvent`, `VdVWUniformDeviationBadTailEvent`, `VdVWUniformDeviationBadInfinitelyOftenEvent` | bad-event vocabulary for fixed sample sizes, future tails, and infinitely-often failures |
| `vdVWUniformDeviationBadInfinitelyOften_subset_not_tendsto` | infinitely many fixed-tolerance failures imply pathwise uniform convergence fails |
| `VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn` | tail outer-probabilities converge to the outer probability of the bad-limsup event |
| `vdVWOuterProbabilityUniformDeviationTailTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup` | outer-a.s. convergence plus tail-limsup continuity gives vanishing future-tail outer probabilities |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup` | same hypotheses give the direct outer-probability convergence branch |
| `vdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn_of_isFiniteMeasure_of_nullMeasurable_badEvent` | finite-measure continuity from above gives the tail-limsup condition from fixed bad-event null measurability |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_isFiniteMeasure_of_nullMeasurable_badEvent` | outer-a.s. convergence implies direct outer-probability convergence under fixed bad-event null measurability |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_nullMeasurable_badEvent` | VdV&W Theorem 2.4.1 in the direct outer-probability mode under the null-measurable bad-event bridge |
| `vdVWUniformDeviationBadEvent_nullMeasurableSet_of_countable_of_coordinate` | fixed bad-event null measurability follows from countably many coordinate bad events |
| `vdVWUniformDeviationBadEvent_nullMeasurableSet_of_countable_of_aemeasurable_coordinate` | coordinate a.e.-measurability implies fixed bad-event null measurability for countable classes |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_countable_of_aemeasurable_coordinate` | outer-a.s. convergence implies direct outer-probability convergence for countable classes with coordinate a.e.-measurable deviations |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_aemeasurable_coordinate` | VdV&W Theorem 2.4.1 in the direct outer-probability mode for countable classes with coordinate a.e.-measurable deviations |
| `vdVWCoordinateDeviation_aemeasurable_of_empiricalRisk` | empirical-risk coordinate a.e.-measurability implies coordinate empirical-deviation a.e.-measurability |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalRisk` | outer-a.s. convergence implies direct outer-probability convergence for countable classes with a.e.-measurable empirical-risk coordinates |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_aemeasurable_empiricalAverage` | VdV&W Theorem 2.4.1 in the direct outer-probability mode for countable classes with a.e.-measurable empirical-average coordinates |
| `empiricalAverage_samplePath_aemeasurable_of_coordinate` | finite sample-path empirical averages are a.e.-measurable from coordinate a.e.-measurability |
| `empiricalAverage_samplePath_aemeasurable_of_sample_aemeasurable` | finite sample-path empirical averages are a.e.-measurable from a.e.-measurable samples and a measurable statistic |
| `empiricalAverage_samplePath_aemeasurable_of_hasLaw` | finite sample-path empirical averages are a.e.-measurable from `HasLaw` and a measurable statistic |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_sample_aemeasurable_of_classFun_measurable` | VdV&W Theorem 2.4.1 in the direct outer-probability mode for countable classes with a.e.-measurable samples and measurable class functions |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_classFun_measurable` | VdV&W Theorem 2.4.1 in the direct outer-probability mode for countable classes with measurable class functions, using `HasLaw` for sample a.e.-measurability |
| `VdVWPGlivenkoCantelliClass` | book-style GC predicate: outer probability or outer almost surely |
| `vdVW_theorem_2_4_1_glivenkoCantelli` | VdV&W Theorem 2.4.1 packaged into the book-style GC predicate |

This is now the dependency-minimal finite-bracketing theorem in the local
pathwise, outer-a.s., and book-style GC interfaces.  The final book-style
predicate is proved through the outer-a.s. branch used by the textbook proof.
A tail-event sufficient condition for the direct outer-probability branch is
also proved.  The repo now additionally proves a conditional conversion from
outer-a.s. convergence to the direct outer-probability branch, assuming the
future-tail outer probabilities converge to the outer probability of the
bad-infinitely-often event.  It also proves that this tail-continuity condition
follows from fixed bad-event null measurability and finite sample-space measure,
using mathlib's continuity from above.  It further derives fixed bad-event
null-measurability from countability of the class and coordinate
a.e.-measurability, packages that into a direct outer-probability Theorem
2.4.1 layer for countable classes, and proves the mathlib bridge from
empirical-risk coordinate a.e.-measurability to coordinate empirical-deviation
a.e.-measurability.  The latest promoted corollary derives the countable direct
outer-probability theorem from measurable class functions; the existing
`HasLaw` assumptions already supply sample-coordinate a.e.-measurability.
Extending this countable concrete bridge to VdV&W measurable-cover and
arbitrary-map hypotheses remains future compatibility work with broader
Chapter 1 machinery.

## Dependency-Minimal Remaining Work For Theorem 2.4.1

These are the missing primitives and lemmas on the direct proof path.

| Order | Missing item | Textbook source | Lean target shape |
| --- | --- | --- | --- |
| 1 | measurable real function class | Theorem 2.4.1 statement | represent `F : Set (Omega -> Real)` with endpoint/function measurability assumptions |
| 2 | pointwise bracket `[l, u]` | Definition 2.1.6 | done: `FunctionBracket`, `MemFunctionBracket` |
| 3 | epsilon bracket | Definition 2.1.6 | done: `IsL1EpsilonBracket` |
| 4 | `L1(P)` bracket width | Definition 2.1.6 and Theorem 2.4.1 | done: `l1BracketWidth` as integral of `abs (u - l)` |
| 5 | finite bracket cover | Definition 2.1.6 | done: `FiniteBracketCover`, `FiniteL1BracketCover` |
| 6 | primitive bracketing number `N_[]` | Definition 2.1.6 | done: `l1BracketingNumber : ℕ∞` with finite case from least `Nat.find` cardinality |
| 7 | finite bracketing hypothesis to cover witness | Theorem 2.4.1 statement | done: `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` |
| 8 | population order lemmas | proof lines 972-981 | done using mathlib `integral_mono` |
| 9 | empirical order lemmas | proof lines 972-981 | done using finite sums |
| 10 | endpoint empirical averages | proof line 984 | done for fixed finite covers: `EndpointSamples.lean` connects iid samples to endpoint empirical averages |
| 11 | endpoint convergence to route fields | proof line 984 | done: `finiteEndpointRadius`, `FiniteL1BracketCover.endpointRadius`, and route constructor from endpoint convergence |
| 12 | construct `FiniteBracketingEndpointRoute` | proof lines 972-984 | done from primitive finite `L1(P)` cover plus endpoint/width assumptions |
| 13 | decreasing-radius argument | proof line 984 | done for the dependency-minimal deterministic and iid countable-cover routes |
| 14 | final textbook theorem | Theorem 2.4.1 statement | done as book-style GC predicate: `vdVW_theorem_2_4_1_glivenkoCantelli`; direct outer-probability theorem also proved under fixed bad-event null-measurability, for countable classes under coordinate/empirical-average a.e.-measurability, for countable classes under concrete sample/function measurability, and in the stronger countable form where `HasLaw` plus measurable class functions supplies empirical-average measurability |

## Full Textbook-Order Work Before 2.4.1

If the goal is literal coverage of every named item before Theorem 2.4.1, the
repo also needs the named material in Chapter 1 and Sections 2.1-2.3. This is
separate from the dependency-minimal proof of Theorem 2.4.1.

| Section | Named content before 2.4.1 | Current status |
| --- | --- | --- |
| 1.2 | outer probabilities, measurable covers, outer/inner Fubini | nonnegative outer-expectation/measurable-cover primitive layer exists; exact extended-real existence theorem, inner expectation, and Fubini variants remain pending |
| 1.3 | weak convergence of arbitrary maps, asymptotic measurability/tightness, Portmanteau/Prohorov | mathlib measure-level weak convergence and Portmanteau/Prokhorov foundations exist; VdV&W arbitrary-map wrappers pending |
| 1.4 | product weak convergence, finite-coordinate projections, asymptotic independence, Slutsky | local measure-level product-law, FDD-forward, process-law/FDD uniqueness, and `IdentDistrib` FDD uniqueness wrappers proved; exact arbitrary-map/asymptotic-independence and weak-convergence FDD-converse statements pending |
| 1.5-1.7 | `l_infty(T)`, tightness/equicontinuity, separability, ball measurability, Suslin examples | open/closed ball sigma/Borel foundation and separable dense-sequence distance-coordinate criterion now formalized; `l_infty`, tightness/equicontinuity, arbitrary-map/asymptotic-measurability, and Suslin/example material pending |
| 1.8 | Hilbert-space weak convergence material | Hilbert/L2/Gaussian mathlib-backed foundation wrappers now formalized; exact Hilbert tightness/asymptotic-measurability and functional-CLT/process results pending |
| 1.9-1.12 | convergence in outer probability, extended continuous mapping, uniform integrability, bounded Lipschitz metric | common-domain outer-probability/TendstoInMeasure bridges, measurable common-domain distribution bridge, continuous-mapping wrappers, bounded-Lipschitz weak-convergence criterion, and Levy-Prokhorov distance wrappers are formalized; arbitrary-map/asymptotic-measurability, uniform integrability, and broader nonmeasurable-cover variants remain pending |
| 2.1 | empirical-process examples, covering numbers, bracketing numbers, Donsker overview examples/proposition | empirical-process interfaces, averages, primitive bracketing numbers, and a local covering-number primitive exist; Donsker overview examples/proposition remain pending |
| 2.2 | Orlicz norm lemmas, covering/packing definition, chaining maximal inequality, Hoeffding/Bernstein inequalities | covering/packing primitive layer exists; Orlicz norm lemmas, chaining maximal inequality, and exact Hoeffding/Bernstein wrappers remain pending |
| 2.3 | symmetrization, measurable classes, separability/lifting, Donsker separable modification results | product measure, weighted sample sums/suprema, `P`-measurable class predicate, countable coordinate-measurable constructor, pointwise-to-weighted-sum helpers, deterministic finite-cover supremum bound, and ordinary measurable truncation-tail integral bridge are formalized; symmetrization, separability/lifting, and Donsker separable modification results remain pending |

Theorem 2.4.1 itself uses Definition 2.1.6 and the real-valued strong law
directly; it does not require the maximal inequalities or symmetrization
machinery from Sections 2.2-2.3.

Pinned mathlib already supplies large parts of the mathematical foundation:
measure theory, probability measures, integration, product/Fubini theorems,
`L1`/`Lp` infrastructure, weak convergence of measures, Portmanteau-related
results, Prokhorov-related files, iid/independence primitives, and a real strong
law.  It does not appear to contain VdV&W's empirical-process-specific
bracketing-number Glivenko-Cantelli theorem.  The exact outer-a.s. event
semantics needed for Theorem 2.4.1 are now represented locally using
mathlib's outer-measure semantics for `Measure`; the broader Chapter 1
outer-probability and arbitrary-map formalism is still pending.

## Report Requirement

Every exact VdV&W textbook theorem or lemma fully proved in Lean must add a
report under `Reports/`. Intermediate theorem layers and proof-carrying
interfaces are tracked in this status document, the active blueprint, or the
dashboard until an exact textbook item is complete. A formal report must
include a side-by-side cross-check:

| Required column | Meaning |
| --- | --- |
| Lean realization | declaration name, file, kind, and exact formal role |
| Textbook markdown anchor | local markdown file and line range; include only a short excerpt or paraphrase in public tracked docs |
| PDF screenshot anchor | local screenshot path for the corresponding textbook passage |
| Status/gap | exact theorem, proved layer, proof-carrying interface, or pending primitive |

Long textbook excerpts should not be copied into public docs.  The requested
textbook markdown/PDF/screenshot source anchors under `Textbooks/Vaart1996/`
are intentionally tracked; generated report PDFs remain local build artifacts
unless explicitly reviewed for publication.
