# VdV&W Chapter 1-2 Formalization Blueprint

This is the working blueprint for moving beyond Theorem 2.4.1 toward a
source-audited Lean formalization of Chapters 1 and 2 of van der Vaart and
Wellner, *Weak Convergence and Empirical Processes*.

The public repository must remain a Lean library plus audit metadata.  The
textbook markdown, PDF, and selected screenshots under `Textbooks/Vaart1996/`
are intentionally tracked source-audit anchors, per user request; generated
report PDFs remain untracked build artifacts.

## Audit Scope

Local extraction source:

```text
Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md
Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md
Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_201-300.md
```

The Chapter 1-2 extraction contains 227 named items after the Chapter 1
re-audit restored the missing Theorem 1.10.4 inventory row:

| Bucket | Count |
| --- | ---: |
| theorem-level items: lemmas, theorems, propositions, corollaries | 157 |
| definitions | 8 |
| examples and addenda | 62 |

This blueprint tracks theorem-level items first.  Definitions are promoted as
primitives whenever a theorem needs them.  Examples and addenda are now
non-blocking: keep already compiled example layers available as reusable
infrastructure, but do not spend main proof time on exact example reports or
domain-heavy example closures unless a later theorem explicitly needs them.

## Prioritization Policy

The inventory below is comprehensive, but it is not a strict implementation
queue.  Chapter 1's weak-convergence, tightness, product-space, Hilbert, and
representation material is fundamental.  It must not be treated as skipped
just because it is not the immediate Chapter 2.4.3 blocker.  Each such item
gets one of three concrete routes:

1. prove a local exact VdV&W statement now if it is self-contained;
2. wrap or specialize an existing pinned mathlib theorem when mathlib already
   contains the classical measure/topology result;
3. record the precise missing primitive when the exact VdV&W arbitrary-map,
   nonmeasurable, perfect-map, or representation layer is not yet in mathlib or
   local code.

Current priority is dependency-driven:

1. keep the already proved Theorem 2.4.1 route verified;
2. finish only the Chapter 1 primitives that are directly needed for outer
   probability, measurable-cover, and empirical-process measurability layers;
3. proceed through Chapter 2 bracketing, covering, measurable-class, and
   symmetrization results in textbook order;
4. maintain a Chapter 1 foundation lane for weak convergence, tightness,
   product-space, stochastic-process, Hilbert, and representation results, with
   mathlib-backed wrappers promoted before any claim that the item is blocked;
5. only mark a Chapter 1 theorem as blocked/later-dependent after recording
   the missing local primitive or the exact mathlib search result.

When a Chapter 1 item is promoted, it has the same standard as every other
theorem: exact Lean statement, no proof holes, local mathlib search first, and
one theorem report only after the exact theorem or lemma is fully proved.

Later-dependent Chapter 1 overview results may be marked as blocked or
later-dependent only in the docs, and temporary `sorry` sketches may be used
only as uncommitted planning artifacts.  Tracked/promoted Lean progress should
remain proof-hole-free.  Self-contained or mathlib-backed Chapter 1 building
blocks for weak convergence, tightness, product spaces, Hilbert/Gaussian
foundations, outer probability, measurable covers, measurability, and
empirical-process bounds should be formalized and proved or wrapped rather than
parked indefinitely.

Examples and addenda should be formalized only when they directly support the
Chapter 1-2 empirical-process theorem line.  After the existing Example 2.3.4
and Example 2.4.2 local layers, example-specific exact reports and remaining
domain-heavy closures are deferred by default.  If an example would require a
large external-domain formalization outside the VdV&W Chapter 1-2 theorem
scope, mark it as `deferred-example` with a concrete reason and the missing
external theory instead of blocking nearby theorem-level progress.

The active frontier blocker is pinned separately in:

```text
docs/vdvw_current_blocker_primitive_plan.md
```

Current operational target, 2026-05-06 after verified pushed head
`57037fa Add separable centered weak convergence endpoints`: the active Codex
`/goal` remains broad and cannot be edited in place, so this paragraph is the
blueprint-level replacement target.  Do not rebuild forward FDD/process-law
support, finite-index `ell_infty(T)` wrappers, Theorem 2.4.3 endpoint
packages, or centered separability wrappers unless a new exact theorem consumes
them immediately.  The newest proof state adds the centered
pointwise-approximable and `P`-measurable constructor chain
`VdVWPointwiseApproximableByCountableSubclass.tendsto_integral_of_uniform_bound`,
`VdVWPointwiseApproximableByCountableSubclass.centered_of_uniform_bound`, and
`VdVWPMeasurableClass.centered_of_pointwiseApproximableByCountableSubclass_of_uniform_bound`,
plus the law-level Theorem 2.4.3 endpoints
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`.
The next proof work should close a new upstream theorem-facing blocker:

1. structural entropy/cardinality: prove a genuine finite-code/compression,
   VC/Sauer, finite-trace, threshold-grid, or quantizer estimate with
   sublinear normalized logarithmic growth feeding the selected fixed-radius
   Theorem 2.4.3 route, after searching the existing
   threshold/grid/full-subgraph/finite-trace routes to avoid duplication;
2. selected empirical-cover tail/UI/ordinary-mean: prove such a bridge from
   hypotheses strong enough to imply it, without treating bare
   outer-probability random-entropy convergence as uniform integrability;
3. exact Chapter 1 process primitives: arbitrary-index FDD converse,
   separability/tightness/asymptotic-measurability, nonmeasurable signed
   outer-cover weak convergence, or full arbitrary-map extended-real
   measurable-cover existence.

Earlier context for the same target:
the strong
Theorem 2.4.3/Lemma 2.4.5 endpoint packages, selected
fixed-radius/inverse-radius entropy packages, deterministic untruncation and
envelope-tail bridges, finite-class and full-subgraph structural routes,
measurable/null-measurable signed arbitrary-map/varying-domain
weak-convergence interfaces, Dirac-law bridges, and null-measurable
asymptotic-measurability constructors, deterministic normalized-log bound
route, raw tail/UI route, ordinary-mean normalized-log route, selected L1
side-condition package, untruncated centered L1 consumer, and varying-domain
signed continuous-mapping closures are compiled and should be treated as
closed infrastructure.  The next blueprint target is the
exact textbook mismatch layer: prove a real tail/UI, uniform-integrability,
deterministic structural cardinality, or ordinary mean-convergence input from
the book random entropy condition
`log N(η, F_M, L1(P_n)) = o_P^*(n)`, or prove/record the precise structural
primitive needed to justify that step.  The productive structural fallback is
not another endpoint alias: prove a concrete VC/Sauer, finite-trace,
threshold-grid, or quantizer cardinality theorem that feeds the compiled
natural-polynomial selected fixed-radius route.  Do not rebuild closed
Theorem 2.4.3 endpoint packages.  If the entropy/cardinality bridge is
blocked after real search and Lean attempts, produce the cleanest
final-current Theorem 2.4.3/Lemma 2.4.5 statement from the full-subgraph or
structural-rate packages and classify its assumptions before moving to
Chapter 1 arbitrary-map/`P`-measurable foundations, nonmeasurable envelope-tail
outer-cover clauses, arbitrary-index FDD converse, or separability primitives
required by exact Chapter 1-2 statements.  The finite-trace
natural-polynomial structural route now directly
reaches centered untruncated convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_trace_image_cardinality_bound_nat_poly`;
the paired endpoint
`VdVWTheorem243_finite_trace_image_cardinality_bound_nat_poly_pGlivenkoCantelli_and_inMean`
now upgrades it to canonical `P`-GC and in-mean convergence.  Future work
should return to the true random-entropy tail/UI bridge or prove a new
structural cardinality theorem rather than rebuild selected-package routes.

2026-05-06 `/goal` rebase after `2d2b441`: finite-coordinate raw-process
measurability and finite-index FDD/converse wrappers are closed support.  The
next continuation should target a new structural entropy/cardinality theorem,
a real selected empirical-cover tail/UI/ordinary-mean bridge from hypotheses
strong enough to imply it, or a Chapter 1 process primitive upstream of the
arbitrary-index VdV&W 1.4.8 converse.  Do not spend the next run on another
endpoint alias for an already-consumed Theorem 2.4.3 route.

2026-05-06 `/goal` rebase after `e3d050e`: finite-index boundedness for
`ell_infty(T)` process maps and the finite-product law/identically-distributed/
weak-convergence converse wrappers are also closed support.  The remaining
Chapter 1-2 target should now be read as: close a genuine upstream
entropy/cardinality or selected-tail/UI theorem feeding Theorem 2.4.3, or move
to an exact Chapter 1 process blocker such as arbitrary-index FDD converse,
separability/tightness/asymptotic measurability, nonmeasurable signed
outer-cover weak convergence, or full arbitrary-map extended-real
measurable-cover existence.  More finite-index or endpoint-alias wrappers are
out of order unless a new exact textbook theorem consumes them directly.

2026-05-06 finite-dimensional process transport update:
`FiniteDimensional.lean` now proves direct transport from raw finite-vector
HasLaw, IdentDistrib, and TendstoInDistribution hypotheses to the corresponding
finite-coordinate restrictions of bounded `ell_infty(T)` process maps.  The
compiled declarations are
`vdVW148_boundedProcess_finiteRestrict_hasLaw_of_hasLaw`,
`vdVW148_boundedProcess_finiteRestrict_identDistrib_of_identDistrib`, and
`vdVW148_boundedProcess_finiteRestrict_tendstoInDistribution_of_tendstoInDistribution`.
This is still finite-dimensional support only, not the arbitrary-index VdV&W
1.4.8 converse.
The finite-index nuisance boundedness assumption is also removed:
`VdVWEllInfty.isBoundedSamplePath_of_finite` and
`VdVWEllInfty.processMapFinite` provide the canonical finite-index
`ell_infty(T)` process map, and
`vdVW148_finiteProcess_hasLaw_of_finiteProduct_hasLaw_finite`,
`vdVW148_finiteProcess_identDistrib_of_finiteProduct_identDistrib_finite`, and
`vdVW148_finiteProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`
consume ordinary finite-product law/FDD hypotheses directly.  This remains a
finite-index bridge only.
The process-level tightness interface is now also explicit:
`vdVWEllInftyProcessLaw` and `vdVWFDDProcessLaw` name the bounded
`ell_infty(T)` process law and finite-dimensional raw coordinate law,
`vdVWEllInftyProcessLaw_map_finiteRestrict` identifies finite restrictions of
the process law with ordinary FDD laws, and
`VdVWEllInftyProcessAsymptoticallyTight.finiteDimensionalLaw` proves the
forward tightness implication for every finite-dimensional law.  This is a
Chapter 1 process primitive, but it still leaves the arbitrary-index FDD
converse, separability/asymptotic-measurability, and nonmeasurable outer-cover
weak-convergence layers open.
The weak-convergence analogue is now compiled as
`VdVWEllInftyProcessWeakConvergence` and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw`: weak convergence of
bounded `ell_infty(T)` process laws implies weak convergence of every
finite-dimensional raw coordinate law.  This is still forward FDD support only
and should not be reported as the full VdV&W 1.4.8 converse.
The same raw-process interface now consumes the measure-level Prokhorov
tightness consequence through
`VdVWEllInftyProcessWeakConvergence.asymptoticallyTight_atTop` and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_asymptoticallyTight_atTop`,
giving process-law and finite-dimensional-law asymptotic tightness from
sequential weak convergence of bounded process laws.
The raw-process predicates also now inherit filter-refinement and reindexing
stability from the measure-level weak-convergence/tightness APIs through
`VdVWEllInftyProcessWeakConvergence.mono_filter`,
`VdVWEllInftyProcessWeakConvergence.comp_tendsto`,
`VdVWEllInftyProcessAsymptoticallyTight.mono_filter`, and
`VdVWEllInftyProcessAsymptoticallyTight.comp_tendsto`.  This is support for
subsequence/subnet arguments, not the arbitrary-index VdV&W 1.4.8 converse.
The same process-law layer now has a.e.-congruence support:
`vdVWEllInftyProcessLaw_congr_ae`,
`VdVWEllInftyProcessWeakConvergence.congr_eventually_ae`, and
`VdVWEllInftyProcessAsymptoticallyTight.congr_eventually_ae`.  These lemmas are
intended for replacing raw processes by a.e.-equal measurable or canonical
versions in later separability/asymptotic-measurability arguments.
For Definition 2.3.3, bounded pointwise approximability by a countable
measurable subclass now directly gives `P`-measurability through
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_uniform_bound`.
This composes the existing pointwise-approximability handoff with the uniform
weighted-value-set boundedness primitive.
The centered version is compiled as well:
`VdVWPointwiseApproximableByCountableSubclass.tendsto_integral_of_uniform_bound`
uses mathlib dominated convergence to pass pointwise approximation through
population integrals,
`VdVWPointwiseApproximableByCountableSubclass.centered_of_uniform_bound`
packages centered pointwise approximability, and
`VdVWPMeasurableClass.centered_of_pointwiseApproximableByCountableSubclass_of_uniform_bound`
gives centered `P`-measurability under finite-measure and uniform-bound
hypotheses.
The Theorem 2.4.3 weak-convergence endpoint layer now has the matching
bounded-separable consumers:
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`.

2026-05-06 scalar-quantizer cover update: `Theorem243.lean` now lifts the
deterministic coordinate scalar-quantizer decoder-error covering bound from
`CoveringPrimitive.lean` to the random empirical-cover interface through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_scalarQuantizer_decode_error_cardinality_bound_samplePath`
and its all-positive-radius wrapper.  Future grid/compression work can now
feed Theorem 2.4.3 by proving finite coordinate code-set cardinality and
decoder-error hypotheses, rather than manually rebuilding the selected
fixed-radius package.
The paired coordinate-cardinality wrappers now further reduce the product
bound to per-coordinate code-set cardinality estimates and
`coordinateCard ^ m` domination.
The route now also feeds the selected fixed-radius tail/UI side-condition
package directly through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_logCardinality_div_tendsto_bound`.
The remaining useful theorem work is still upstream: prove a genuine
finite-code/compression, VC/Sauer, or other structural cardinality estimate
that makes the normalized log-cardinality side condition true.

The first-sample `UnifIntegrable` route now also reaches untruncated centered
convergence directly, so future work should prove the UI/tail/mean or
structural-cardinality input consumed by that endpoint rather than add another
alias around the same selected fixed-radius package.
The 2026-05-06 post-endpoint search audit found no remaining non-duplicative
Theorem 2.4.3 endpoint consumer: raw tail expectation, ordinary selected
normalized-log mean convergence, first-sample `UnifIntegrable`, first-sample
`eLpNorm` tail, bounded first-sample selected entropy, deterministic
normalized-log, natural-polynomial cardinality, finite trace/code-set,
threshold-code, integer-grid/full-subgraph, finite-class, and
centered-to-`P`-GC/in-mean routes are all already available.  The next theorem
work is upstream: prove UI/tail/mean from a real structural assumption, or
instantiate `VdVWUniformSubgraphVCBound`/VC-Sauer cardinality for a concrete
class.  Do not try to prove UI from bare outer-probability entropy convergence;
that implication is false without additional uniform-integrability/tail or
structural-cardinality input.
The structural-cardinality line now has its first truncation-specific algebra:
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter`
and its nonnegative/negative threshold specializations identify the threshold
traces of `f 1{F <= M}` with fixed-mask transforms of the original threshold
traces.  The next proof target is not another full-subgraph endpoint; it is a
finite-family cardinality or VC-dimension lemma for these fixed-mask transforms
and then a transfer theorem for truncated-class threshold traces.
The fixed-mask cardinality half of that target is now compiled through
`vdVWTraceMaskTransform`, `vdVWTraceMaskTransform_image_card_le`,
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le`,
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_of_nonneg`,
and
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_of_neg`.
The threshold-level Sauer transfer is now compiled as
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_add_one_real_le_nat_poly_of_original_vc`.
The product/code-set and selected fixed-radius consumer layer is now compiled
as
`threshold_binaryTraceSetFamily_product_card_le_truncated_of_original_uniform_vc`,
`thresholdTraceCodeSet_vdVWTruncatedClassFun_card_add_one_real_le_original_uniform_vc`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`.
The original-VC threshold-code package now reaches untruncated centered
convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`.
The integer-grid specialization now also consumes original fixed-threshold
VC/Sauer input without requiring VC bounds for the already truncated class:
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_abs_bound_original_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_integerMultipleThresholdGrid_uniform_abs_bound_original_vc`.
The canonical envelope/grid version is now compiled on both sides of the
Theorem 2.4.3 machinery.  The selected side has
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_bound_original_vc`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_vc`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_subgraph_vc`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`.
The entropy side has
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_vc`,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_subgraph_vc`,
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`.
The original-VC canonical grid package is now consumed by the centered
untruncated convergence machinery through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`.
This keeps the analytic side conditions explicit but reduces the structural
VC input from truncated-class full-subgraph VC to original-class full-subgraph
VC.  The compact original-VC side-condition/integrable constructor is now
compiled through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable`,
the iid-Rademacher variant
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable_iidRademacher`,
and the canonical endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable_canonical`.
The route is now consumed by the final-shape finite-product uniform-deviation
and canonical outer-probability `P`-GC endpoints
`VdVWOuterProbabilityUniformDeviationConstOn_of_originalFullSubgraph_integrable_canonical`
and
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_originalFullSubgraph_integrable_canonical`.
It now also reaches in-mean centered-supremum convergence via
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_originalFullSubgraph_integrable_tailExpectation_of_countable_canonical`,
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_originalFullSubgraph_integrable_of_countable_canonical`,
and the combined package
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_and_inMean_canonical`.
It now also feeds the Lemma 2.4.5 finite-product and a.s. centered-supremum
layer through
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_originalFullSubgraph_integrable_canonical`,
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_originalFullSubgraph_integrable_canonical`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_originalFullSubgraph_integrable_canonical_of_countable_integrable`,
`VdVWAlmostSureGlivenkoCantelliClass_of_originalFullSubgraph_integrable_canonical_of_countable_integrable`,
and the strong package
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_of_countable_integrable`.
The no-nonempty version
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`
is compiled as well.
Do not add another endpoint alias for this same route unless final theorem
assembly consumes a genuinely new proof input.  The next non-duplicative target
is a new class-geometry/cardinality theorem or the book random-entropy
tail/UI/mean bridge.
The finite pointwise-code covering lift is now also available:
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_pointwise_approx_code_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_pointwise_approx_code_cardinality_bound_samplePath`
turn samplewise finite approximate codes with pointwise empirical-sample
closeness into the random empirical covering-number domination consumed by the
selected fixed-radius route.  The selected fixed-radius package now consumes
this route through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_code_cardinality_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_code_cardinality_bound_logCardinality_div_tendsto_bound`.
The resulting route now has the centered untruncated convergence consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_pointwise_approx_code_logCardinality_div_tendsto_bound`.
It also now has a direct natural-polynomial selected fixed-radius package,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_code_cardinality_bound_nat_poly`
and its all-positive-`M` wrapper, plus the concrete finite-code-set variants
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_codeSet_cardinality_bound_nat_poly`.
The trace-code-set analogue is also compiled as
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_trace_codeSet_cardinality_bound_nat_poly`,
using the finite-code image and cardinality transfer from `TraceCoding.lean`.
This should be used for quantized-trace or finite-code structural entropy
arguments; the remaining theorem work is the concrete code-image
log-cardinality, VC/Sauer polynomial, or tail/UI estimate, not another
selected endpoint.
The threshold-code structural cardinality layer also now has the raw
fixed-threshold and full-subgraph VC inputs
`thresholdTraceCodeSet_card_add_one_real_le_uniform_vc`,
`thresholdTraceCodeSet_card_add_one_real_le_uniform_subgraph_vc_nat_poly`, and
`thresholdTraceCode_image_toFinset_card_add_one_real_le_uniform_vc`,
`thresholdTraceCode_image_toFinset_card_add_one_real_le_uniform_subgraph_vc_nat_poly`,
and `thresholdTraceCode_image_toFinset_card_le_uniform_subgraph_vc_nat_poly` in
`ThresholdCoding.lean`, bounding the whole threshold-code set and the realized
threshold-code image by the Sauer-polynomial product under the appropriate VC
hypothesis, including the real `card + 1` shape consumed by entropy routes.
Future VC/grid instantiations should consume these lemmas rather than
reproving the threshold-code/product-cardinality chain.  The lower-level
empirical-cover interface now also has direct code-set-cardinality bridges
`nonempty_finiteEmpiricalL1CoverAtCard_of_thresholdTraceCode_coordinate_approx_codeSet_card_le`
and
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_coordinate_approx_codeSet_card_le`.
The Theorem 2.4.3 random empirical-cover interface consumes the same
threshold-code-set shape through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_thresholdTraceCode_coordinate_approx_codeSet_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_thresholdTraceCode_coordinate_approx_codeSet_cardinality_bound_samplePath`.
The same route now feeds the selected fixed-radius Theorem 2.4.3 package
through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`.
The exact coordinatewise threshold-separation variant now also feeds selected
fixed-radius side conditions through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_thresholds_separate_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_thresholds_separate_uniform_vc`,
using the finite trace image and VC/Sauer cardinality theorem from
`ThresholdCoding.lean`.
The exact-separation route now also reaches the local `P`-Glivenko-Cantelli
and in-mean centered-supremum endpoint via
`VdVWTheorem243_coordinate_thresholds_separate_uniform_vc_pGlivenkoCantelli_and_inMean`.
Do not add another endpoint alias for the same exact threshold-separation
input unless final theorem assembly needs it; future progress should supply
concrete grid/quantizer/VC cardinality hypotheses or the genuine random
entropy tail/UI bridge.
The threshold-signature approximate route now also reaches the untruncated
centered convergence conclusion through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`,
which composes that selected package with the existing large-`M`
untruncation consumer.  The same structural route is now packaged with the
local `P`-Glivenko-Cantelli and in-mean conclusions as
`VdVWTheorem243_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc_pGlivenkoCantelli_and_inMean`.
The coordinate-code structural route also now lifts into the random
empirical-cover interface through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_pointwise_approx_code_product_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_coordinate_pointwise_approx_code_product_cardinality_bound_samplePath`,
so finite coordinate code-set products can feed the pointwise-code Theorem
2.4.3 endpoint directly.  The selected fixed-radius package now consumes this
route through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_pointwise_approx_code_product_cardinality_bound_logCardinality_div_tendsto_bound`;
the matching untruncated centered convergence consumer is
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_logCardinality_div_tendsto_bound`.
The same route now also has the natural-polynomial structural-cardinality
package and endpoint
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_nat_poly`.
The variable-domain book-entropy package now also has the direct
natural-polynomial selected fixed-radius tail/UI bridge
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_nat_poly_bound`,
which composes the first-sample bounded-entropy route with the selected
tail/UI package.  Future VC/Sauer, finite-trace, and quantizer/grid arguments
should feed this constructor rather than restating the intermediate
first-sample `nnnorm` side condition.
The matching variable-domain book-entropy constructor is also compiled:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_nat_poly_bound`
turns the same pointwise natural-polynomial cardinality growth into the
book-facing varying-domain entropy condition itself.  This closes the generic
nat-poly plumbing on both the entropy and selected tail/UI sides.
The finite-trace versions are compiled as well:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_image_cardinality_bound_nat_poly`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_codeSet_cardinality_bound_nat_poly`
turn finite empirical trace images or injective finite trace-code sets plus a
natural-polynomial cardinality estimate into the book-facing entropy
condition.
The concrete threshold VC/Sauer entropy-side constructors are now compiled too:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_coordinate_thresholds_separate_uniform_vc`
feed `thresholdTraceCodeSet` VC/Sauer cardinality and exact
coordinate-threshold separation directly into the variable-domain entropy
condition.
The canonical integer-grid/full-subgraph entropy constructor is also compiled:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`
turns the truncated-envelope bound plus `VdVWUniformSubgraphVCBound` into the
same book-facing entropy condition with the explicit canonical grid
cardinality.
The remaining useful work is a concrete quantizer/grid/VC cardinality estimate
for the coordinate code sets, not another endpoint wrapper.
For Chapter 1 varying-domain asymptotic-measurability,
`WeakConvergence.lean` now also has the lower-shifted continuous-map closure
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.comp_continuous`
and the canonical shifted handoff
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.comp_continuous_of_lowerShifted`.
The VdV&W 1.4.1 product Borel-space equality is also closed as
`vdVW141_prod_borel_eq_product_borel`.  The next small but theorem-facing
Chapter 1 foundation closure is now closed: filter-refinement stability for
the signed weak-convergence packages in `WeakConvergence.lean`, covering
signed-outer, arbitrary-map, and
varying-domain proof-carrying predicates.  The measurable independent-product
law convergence layer behind VdV&W 1.4.6 is also now closed in both the binary
and finite-coordinate forms: the compiled wrappers are
`vdVWTendstoInDistribution_prodMk_laws_of_indepFun` and
`vdVWTendstoInDistribution_pi_laws_of_iIndepFun`, plus their corresponding
ordinary `TendstoInDistribution` wrappers
`vdVWTendstoInDistribution_prodMk_of_indepFun` and
`vdVWTendstoInDistribution_pi_of_iIndepFun`.  The finite-class Theorem 2.4.3
route also now has a textbook-facing package
`VdVWTheorem243_finite_indexClass_textbookAligned_canonical_slln`, combining
finite-class `P`-measurability, finite measurable integrable-envelope outer
expectation, outer-probability/a.s./local `P`-GC, in-mean convergence, and
Lemma 2.4.5 a.s. centered-supremum convergence.  Treat this as closed
finite-class infrastructure; the remaining main-line gap is still the
non-finite book entropy/tail-UI or structural cardinality bridge.
The separability-to-Definition 2.3.3 route now also has the direct local
handoff
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_bddAbove`,
which turns a countable pointwise-approximating measurable subclass and
bounded finite weighted value sets into `P`-measurability of the original
class.  The remaining separability gap is therefore the full arbitrary-map /
nonmeasurable process asymptotic-measurability and weak-convergence layer.
The measure-level continuous-image/reindexed asymptotic-tightness handoff is
now closed too:
`VdVWWeakConvergenceProbabilityMeasures.map_asymptoticallyTight_atTop` and
`VdVWWeakConvergenceProbabilityMeasures.map_asymptoticallyTight_comp_tendsto_atTop`
combine sequential weak convergence, Prokhorov tightness, continuous-map
stability, and reindexing along filters tending to `atTop`.
The canonical infinite iid
product substrate is already present in `PMeasurable.lean` via
`vdVWInfiniteProductMeasure`, coordinate `HasLaw`, and coordinate
`iIndepFun` wrappers over mathlib `Measure.infinitePi`, so the next Chapter 1
fallback should therefore move to deeper exact primitives such as
nonmeasurable outer-cover signed weak convergence, asymptotic-tightness/
asymptotic-independence, arbitrary-index FDD converse, or separability/
`P`-measurable class support.
The finite-index FDD converse, Portmanteau converse, norm-tail tightness
including the sequence/range limsup norm-tail criterion and
finite-dimensional inner-product tail criteria,
π-system convergence-determining criterion, and VdV&W 1.4.2 product
bounded-continuous test uniqueness wrappers are closed and should not be
repeated.

2026-05-05 signed/shifted bridge update: `WeakConvergence.lean` now proves
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.to_lowerShifted` and
`.to_canonicalShifted`, so the signed bounded-continuous arbitrary-map
asymptotic-measurability layer directly feeds the older nonnegative
lower-shifted/canonical shifted predicates.

2026-05-05 varying-domain shifted bridge update: `WeakConvergence.lean` now
adds the varying-domain lower-shifted/canonical shifted asymptotic-
measurability predicates and constructors, plus
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.to_lowerShifted`
and `.to_canonicalShifted`.  The sample-size-varying signed layer can now feed
the same shifted interface as the common-domain Chapter 1 layer.

2026-05-05 a.e.-measurable bridge update: `WeakConvergence.lean` now exposes
the signed arbitrary-map and varying-domain weak-convergence packages directly
from mathlib-style a.e.-measurable maps.  The new declarations include the
common-domain null-measurable map-law bridge, common-domain null/a.e.
automatic-pushforward wrappers, the varying-domain a.e. automatic-pushforward
wrapper, and a.e.-measurable asymptotic-measurability constructors.  This is a
Chapter 1 foundation closure; the remaining exact gap is still the deeper
nonmeasurable outer-cover/process layer and the Theorem 2.4.3 random-entropy
tail/UI theorem.

2026-05-05 distribution-convergence follow-up: the same a.e.-measurable bridge
now reaches the local VdV&W arbitrary-map package directly from mathlib
`TendstoInDistribution` and common-domain outer-probability convergence.
This removes a pointwise-measurability strengthening in the Chapter 1
weak-convergence handoff.

2026-05-05 varying-domain distribution follow-up: the same direct
`TendstoInDistribution` feeder is now available for sample-size-varying
domains.  This is the form needed by finite-product empirical-process
statistics and Theorem 2.4.3 law endpoints.

2026-05-05 has-law follow-up: common-domain and varying-domain `HasLaw`
bridges now enter the local signed weak-convergence packages using mathlib's
built-in a.e.-measurability and map-law fields, without adding pointwise
measurability assumptions.

2026-05-05 shifted-constructor follow-up: lower-shifted and canonical shifted
bounded-continuous asymptotic-measurability predicates now have direct
null/a.e.-measurable constructors, including varying-domain a.e.-measurable
constructors for sample-size-varying endpoints.

2026-05-05 signed a.e.-measurable collapse follow-up:
`WeakConvergence.lean` now exposes the direct a.e.-measurable signed
positive/negative outer-expectation integral bridge and signed outer/inner-gap
collapse.  The common-domain and varying-domain signed/lower-shifted/canonical
a.e.-measurable asymptotic-measurability constructors therefore no longer need
a countably-generated target assumption just to route through
`NullMeasurable`.

2026-05-05 proof update: the countability-to-`P`-measurability route has a new
compiled law-convergence layer.  `VdVWConvergesInOuterProbabilityConst.congr_ae`
and
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_nullMeasurable`
use mathlib `NullMeasurable.aemeasurable`, measurable representatives, and
`Measure.map_congr` to replace ordinary measurability by null-measurability for
real-valued varying-domain Dirac-law weak convergence.  The Theorem 2.4.3
consumer
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pMeasurableClass_convergesInOuterProbabilityConst`
applies this to centered finite-product suprema under a
`VdVWPMeasurableClass` hypothesis.  This is a theorem-facing closure, not the
final exact theorem: signed arbitrary-map asymptotic-measurability and the
book entropy-to-tail/UI implication remain open.

2026-05-05 follow-up: the signed arbitrary-map asymptotic-measurability part
now has null-measurable constructors.  The new lower-cover primitive
`VdVWMeasurableLowerCover.ofAEMeasurable` pairs with the existing upper cover
to prove `VdVWOuterExpectation_eq_innerExpectation_of_aemeasurable`; this feeds
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_nullMeasurable`
and the common/varying-domain
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous...of_forall_nullMeasurable`
constructors.  The remaining exact signed endpoint bridge is now the signed
positive/negative outer-expectation equality for null-measurable bounded real
tests, not the asymptotic-measurability gap.

2026-05-05 second follow-up: that final `P`-measurable signed endpoint bridge
is now compiled.  The new declarations are recorded in
`docs/vdvw_current_blocker_primitive_plan.md`.  The main dependency order now
returns to the book entropy/tail-UI mismatch and exact theorem-statement
alignment, not additional signed endpoint packaging.

2026-05-05 entropy follow-up: the normalized-log affine tail/UI reduction now
also compiles.  Raw normalized-log measurability, integrability, and tail/UI of
the selected empirical-cover cardinality feed the affine normalized-log tail
majorant, the finite-net Hoeffding tail/UI condition, and the selected
fixed-radius tail/UI package through
`logCardinality_div_affineTailIntegrable_of_measurable_integrable`,
`logCardinality_div_affine_tailExpectation_condition_of_tailExpectation`,
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_tailExpectation`,
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_tailExpectation_raw`.

2026-05-05 fixed-domain UI follow-up: `OuterProbabilityExpectation.lean` now
wraps mathlib's fixed-domain Vitali theorem in local notation through
`tendsto_eLpNorm_one_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable`.
The theorem proves that common-domain VdV&W outer-probability convergence plus
`UnifIntegrable` gives `L1` convergence to zero.  This records the reusable
common-space route found by search.  The companion ordinary-mean consumer
`tendsto_integral_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable_nonneg`
is also compiled for nonnegative integrable processes, and the signed
ordinary-mean consumer
`tendsto_integral_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable`
is compiled for centered real processes.  The actual Theorem 2.4.3
varying-domain random-entropy/UI bridge remains the blocker.

2026-05-05 first-sample event recoding follow-up: `PMeasurable.lean` now
contains the measurable-event lift
`vdVWInfiniteProductMeasure_firstNSample_preimage_eq` and the measurable
real-tail specialization `vdVWInfiniteProductMeasure_firstNSample_real_tail_eq`.
Together with `integral_vdVWInfiniteProductMeasure_firstNSample`, these are the
probability and integral bridges needed to move measurable finite-sample
statistics onto the canonical infinite iid product space.  They intentionally
do not assert equality for arbitrary nonmeasurable outer events.

2026-05-05 convergence recoding follow-up: `PMeasurable.lean` now also proves
the corresponding convergence-level bridge and equivalence,
`VdVWConvergesInOuterProbability_firstNSample_real_of_const`,
`VdVWConvergesInOuterProbabilityConst_of_firstNSample_real`, and
`vdVWConvergesInOuterProbability_firstNSample_real_iff_const`.  The
common-space/UI strategy can now reuse the fixed-domain Vitali bridge for any
measurable real statistic whose first-sample lifts are uniformly integrable;
the remaining Theorem 2.4.3 entropy blocker is to supply that measurability
and UI/tail control for selected empirical-cover entropy.

2026-05-05 UI mean recoding follow-up: `PMeasurable.lean` now closes the
ordinary-mean version of that common-space route via
`tendsto_integral_vdVWProductMeasure_of_VdVWConvergesInOuterProbabilityConst_firstNSample_unifIntegrable`.
This consumes measurable finite-product outer-probability convergence and
uniform integrability of first-sample lifts to prove convergence of the
finite-product integrals.  The next non-duplicative proof target remains the
UI/tail or structural-cardinality theorem for selected normalized
empirical-cover entropy.

2026-05-05 selected UI package follow-up: `Theorem243.lean` now adds
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_unifIntegrable`.
This consumes the book entropy field, selected-cardinality monotonicity,
measurability/integrability of the selected normalized log-cardinality process,
and uniform integrability of its first-sample lifts to build the selected
fixed-radius tail/UI side-condition package.  The next proof target is the
substantive UI/tail or structural cardinality theorem supplying that final
uniform-integrability input.

2026-05-05 selected `eLpNorm` tail follow-up: the previous UI input now has a
direct theorem-facing mathlib-tail criterion.  The compiled declaration
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_eLpNormTail`
applies `MeasureTheory.unifIntegrable_of` to the canonical first-sample lift of
the selected normalized empirical-cover entropy.  The next target is therefore
sharper: prove the explicit lifted selected-entropy `eLpNorm` tail condition
from a genuine structural entropy theorem, or record the exact missing
cardinality/VC/finite-trace primitive.

2026-05-06 first-sample UI endpoint follow-up: `Theorem243.lean` now exposes
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_unifIntegrable`.
It composes the existing selected first-sample `UnifIntegrable`
side-condition constructor with the selected fixed-radius finite-net route and
the large-`M` untruncation handoff.  This is an honest theorem-facing endpoint
under explicit UI; it does not prove that the textbook random entropy
condition supplies UI.

2026-05-05 bounded first-sample tail follow-up: the deterministic sufficient
condition for that `eLpNorm` route is now compiled.  The reusable
`OuterProbabilityExpectation.lean` lemma
`eLpNorm_one_tail_condition_of_nnnorm_bound` turns a uniform pointwise
`nnnorm` bound into the large-tail `L¹` condition expected by mathlib
uniform-integrability.  The Theorem 2.4.3 wrapper
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_nnnorm_bound`
feeds such a bound on the first-sample lifted selected normalized entropy into
the selected fixed-radius package.  The next target is the actual structural
entropy/cardinality theorem supplying that bound or a stronger tail estimate.
The next proof target is therefore not more selected-package plumbing: it is
the honest varying-domain theorem deriving those raw normalized-log
integrability/tail-UI hypotheses from the book random entropy assumption, or a
precise blocker showing which structural uniform-integrability input is
missing.

2026-05-05 deterministic-tail follow-up: the deterministic structural route
for those raw normalized-log hypotheses is now compiled.  A deterministic
bound on `log(cardinality + 1) / n` gives normalized-log integrability,
normalized-log tail/UI, and finite-net Hoeffding tail/UI through
`logCardinality_div_integrable_of_measurable_bound`,
`logCardinality_div_tailExpectation_condition_of_bound`, and
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_bound`.
This is the correct bridge for finite-code, VC, and other structural entropy
routes.  It does not assert that convergence in outer probability alone
implies UI; that remains the exact non-deterministic entropy blocker.

2026-05-05 blocker refinement: the non-deterministic entropy blocker is now
isolated to a real varying-domain uniform-integrability/tail-expectation
principle for the normalized log-cardinality process.  The deterministic
normalized-log route and the selected/untruncated Theorem 2.4.3 consumers are
already compiled; the next proof should either instantiate those consumers
with a structural entropy bound, or introduce/prove an explicit
book-facing UI/tail hypothesis.  Do not add another final wrapper that simply
renames the same selected fixed-radius side-condition package.

2026-05-05 L1-strengthened follow-up: the blueprint now has a compiled
mean-convergence route for the raw normalized-log tail/UI input.  The general
varying-domain lemma
`tailExpectation_condition_of_integral_tendsto_zero_nonneg` and the
Theorem 2.4.3 specialization
`logCardinality_div_tailExpectation_condition_of_integral_tendsto_zero`,
together with
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_integral_tendsto_zero`,
show that if normalized empirical entropy converges to zero in ordinary mean,
then the required raw normalized-log and finite-net tail expectations follow.
This is deliberately recorded as stronger than VdV&W's outer-probability
entropy condition; the remaining theorem-line work is to derive such mean
convergence or UI from a structural entropy assumption, not from probability
convergence alone.

2026-05-05 selected-package follow-up: the L1-strengthened route now feeds
the selected fixed-radius package through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_integral_tendsto_zero`.
This closes the package-construction layer for ordinary mean convergence of
the selected normalized-log process.  The next theorem-facing target is the
actual structural entropy/UI theorem that supplies that mean convergence, not
more fixed-radius or untruncated endpoint packaging.

2026-05-05 untruncated L1 follow-up: ordinary mean convergence of the selected
normalized-log process now also has a direct untruncated centered convergence
consumer,
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_integral_tendsto_zero`.
This closes the endpoint-composition layer for the L1-strengthened branch.
The remaining work is the structural entropy theorem that produces mean
convergence/UI, or the next exact arbitrary-map/nonmeasurable Chapter 1-2
primitive if that theorem is blocked.

2026-05-05 Chapter 1 arbitrary-map follow-up: the varying-domain signed
bounded-continuous layer now has continuous-mapping stability through
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.comp_continuous`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.comp_continuous`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.comp_continuous`.
This closes the sample-size-varying analogue of the common-domain signed
continuous-mapping theorem and is reusable for Theorem 2.4.3 law endpoints.
It remains a foundation layer, not the full VdV&W arbitrary-map theory:
nonmeasurable outer-cover signed extended-real weak convergence,
asymptotic-tightness/asymptotic-independence, FDD converse, and exact
separability/`P`-measurable class bridges remain open.

2026-05-05 signed filter-refinement follow-up: the signed weak-convergence
packages now have filter-refinement stability through
`VdVWWeakConvergenceSignedOuterBoundedContinuous.mono_filter`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.mono_filter`,
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.mono_filter`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.mono_filter`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.mono_filter`.
Search record: local code already had analogous asymptotic-measurability
filter closures, but no signed weak-convergence package closures.  This closes
the simple filter-refinement foundation gap and keeps the active Chapter 1
fallback focused on the deeper arbitrary-map/nonmeasurable/process primitives.

2026-05-05 base filter-refinement follow-up: the same stability is now present
at the base convergence layers.  `GlivenkoCantelli.lean` proves
`VdVWConvergesInOuterProbabilityConst.mono_filter` and
`VdVWConvergesInOuterProbability.mono_filter`, and `WeakConvergence.lean`
proves `VdVWWeakConvergenceProbabilityMeasures.mono_filter`.  These wrappers
are direct `Tendsto.mono_left` consequences, but they remove repeated
subsequence/finer-filter plumbing from later Chapter 1 and Theorem 2.4.3
endpoint arguments.

2026-05-05 FDD forward-direction follow-up: `FiniteDimensional.lean` now adds
the VdV&W 1.4.8-named forward weak-convergence handoff
`vdVW148_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`.
It packages the existing probability-measure finite-coordinate restriction
theorem under the empirical-process/FDD namespace.  The exact FDD
weak-convergence converse remains blocked by the missing tightness,
separability, and asymptotic-measurability/process hypotheses.

2026-05-05 bounded-continuous uniqueness follow-up: `WeakConvergence.lean` now
adds the VdV&W 1.3.12(i)-named finite-measure uniqueness wrapper
`vdVW1312_measure_ext_of_forall_boundedContinuous_integral_eq`.  It is a
direct wrapper around pinned mathlib's
`MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure` for finite Borel
measures on `HasOuterApproxClosed` spaces.  This closes the bounded-continuous
integral uniqueness direction; the VdV&W 1.3.12(ii) vector-lattice/tight
variant remains pending.

2026-05-05 bounded-continuous generated-sigma follow-up:
`WeakConvergence.lean` now adds VdV&W 1.3.1 generated-sigma wrappers:
`vdVW131_measurableSet_isClosed_of_forall_boundedContinuous_measurable`,
`vdVW131_borel_le_of_forall_boundedContinuous_measurable`, and
`vdVW131_borel_le_iff_forall_boundedContinuous_measurable`.  The proof uses
pinned mathlib's closed-set Borel generator theorem and the continuous
distance-to-a-closed-set function, matching the textbook argument.

2026-05-05 tightness component follow-up: `WeakConvergence.lean` now adds
`vdVW132_complete_separable_probabilityMeasure_tight`, which records the
mathlib-backed complete separable metric-type probability-measure tightness
direction for VdV&W 1.3.2.  The pre-tight/separable equivalence, complete-space
equivalence with tightness, and Polish-measure tightness clauses remain pending
until the corresponding local measure-level definitions are introduced.

2026-05-05 product Borel-space follow-up: `FiniteDimensional.lean` now adds
`vdVW141_prod_borel_eq_product_borel`, a VdV&W 1.4.1 wrapper stating that the
product of the Borel sigma-fields equals the Borel sigma-field of the product
topology for separable pseudometric Borel spaces.  This consumes mathlib's
`Prod.borelSpace`; the later VdV&W 1.4.2 bounded-continuous product-test
uniqueness wrapper is now also compiled.

Every proof heartbeat should inspect that file before introducing a new
primitive.  As of 2026-05-05, the active main-line frontier is no longer the
reverse/cofiltration theorem, finite-cover entropy plumbing, untruncation,
finite-class endpoints, or the countable full-subgraph package: those layers
have compiled.  The current target is exact Theorem 2.4.3/Lemma 2.4.5
statement alignment from the strongest no-nonempty full-subgraph and
structural-rate packages, followed by the exact missing bridges to the
textbook hypotheses: random entropy/tail-UI without deterministic log
boundedness, concrete textbook-class instantiation of the already compiled
full-subgraph/structural-rate consumers, arbitrary
`P`-measurable/asymptotic-measurable class support beyond the countable
coordinate-measurable route, and any
nonmeasurable outer-cover envelope variants required by the exact statement.
A new Chapter 1 bridge now collapses nonnegative outer and inner expectations
for measurable maps and measurable test compositions; this should be used as
the first building block for the arbitrary-map/asymptotic-measurability lane
rather than adding more already-consumed Theorem 2.4.3 wrappers.  The same
lane now has continuous-map closure for lower-shifted/canonical
bounded-continuous tests via
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.comp_continuous`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.comp_continuous_of_lowerShifted`.
It also has selected-test monotonicity and arbitrary-map pullback closures for
the nonnegative and lower-shifted real predicates, plus filter-refinement
closure for all four local asymptotic-measurability predicates.  The signed
positive/negative outer-expectation lane now has
`VdVWSignedOuterExpectationPosNeg` with measurable, composable, and
bounded-continuous finite-measure integral collapse theorems, plus
`VdVWWeakConvergenceSignedOuterBoundedContinuous` and the identity-map bridge
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_id`.
It also has map-law, `HasLaw`, and common-domain `TendstoInDistribution`
feeders:
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_hasLaw`,
`vdVWTendstoInDistribution_to_signedOuterBoundedContinuous`, and the
continuous-mapping closure
`VdVWWeakConvergenceSignedOuterBoundedContinuous.comp_continuous`.
The signed asymptotic-measurability layer now also has the positive/negative
gap predicate `VdVWSignedBoundedContinuousOuterInnerExpectationGap`, the
bounded-continuous test predicate
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous`, and the proof-carrying
package `VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap`, with
measurable-map, law-map, `HasLaw`, common-domain `TendstoInDistribution`,
common-domain outer-probability convergence, filter-refinement, and
continuous-map closures.
For sample-size-varying endpoints, it now also has the varying-domain
predicates
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains`, and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains`, plus map-law and
automatic-pushforward feeders from measure-level weak convergence.
This is the current signed foundation for the exact arbitrary-map weak
convergence route; it still does not discharge full nonmeasurable
outer-cover, asymptotic-tightness, or exact VdV&W signed extended-real
clauses.
The
example-specific Example 2.4.2 distribution-dependent finite middle partition
/ quantile cutpoint layer remains parked as a deferred example blocker unless
a theorem needs it.

## Automation Prompt Maintenance

The recurring VdV&W proof automation is part of the proof process and should
not drift into a stale status summary.  At the end of every automation run that
proves, refines, blocks, commits, or pushes a theorem-line layer, update the
automation prompt itself to reflect the verified current state.  The updated
prompt should be short enough to stay usable, and must include:

1. the latest pushed commit and the exact new Lean declarations or doc-only
   blocker refinement from that run;
2. the single next atomic proof target and the dependency order after it;
3. the current search-first scope, including local `StatInference`, pinned
   mathlib, and `StatInference/ProbabilityMeasure` reuse;
4. the verification gate: focused Lean check, `lake build` for substantive
   theorem edits, proof-hole scan, diff check, secret scan, then commit/push
   only verified progress;
5. any active blocker that must stay explicit rather than hidden as an
   informal assumption.

The automation should also update this blueprint, the dashboard, or
`docs/vdvw_current_blocker_primitive_plan.md` whenever the next target changes
or a blocker is narrowed.  Do not churn the prompt for cosmetic wording-only
changes, and do not create formal reports for intermediate layers.

## Existing Lean Coverage Conclusion

Pinned mathlib is the authority for reusable foundations in this repository.
The current pinned dependency is the one in `lake-manifest.json`.

Search-before-defining is mandatory.  Before adding any local definition,
primitive lemma, theorem wrapper, or proof-carrying structure, search local
`StatInference`, pinned `.lake/packages/mathlib/Mathlib`, relevant pinned Lake
support packages, and the local open-source Lean checkouts recorded in
`docs/vdvw_current_blocker_primitive_plan.md`.  If the result affects the
design, record the searched names/patterns, reusable APIs found, missing APIs
that create a blocker, and the reason a new local primitive is still needed.
Do not mark a theorem `blocked-vdvw` until that search has been done.

Targeted search of pinned mathlib found reusable foundations for:

| VdV&W need | Pinned mathlib foundation |
| --- | --- |
| measure and outer-measure semantics | `MeasureTheory.Measure.*`, `toMeasurable`, null-measurability |
| products and Fubini | `MeasureTheory.Integral.Prod`, product measures |
| weak convergence of measures | `MeasureTheory.Measure.Portmanteau`, `MeasureTheory.Measure.Prokhorov`, `LevyProkhorovMetric` |
| convergence in probability/distribution | `TendstoInMeasure`, `TendstoInDistribution`, continuous mapping, Slutsky-style lemmas |
| probability spaces and laws | `ProbabilityMeasure`, `IsProbabilityMeasure`, `HasLaw`, `IdentDistrib`, independence APIs |
| strong laws and Borel-Cantelli | `ProbabilityTheory.strong_law_ae_real`, first/second Borel-Cantelli files |
| CLT foundations | `Probability.CentralLimitTheorem` |
| tail inequalities | sub-Gaussian and Hoeffding infrastructure in `Probability.Moments.SubGaussian` |
| `L_p`/integrability | `MemLp`, `eLpNorm`, Bochner/Lebesgue integrals |
| VC combinatorics | `Combinatorics.SetFamily.Shatter`, `Finset.vcDim`, local `StatInference.EmpiricalProcess.VCSauer` Sauer/polynomial wrappers, `StatInference.EmpiricalProcess.TraceCoding` finite-code trace bridge, `StatInference.EmpiricalProcess.BinaryTraceVC` binary empirical-trace bridge, `StatInference.EmpiricalProcess.SubgraphTraceVC` fixed-threshold subgraph bridge, and `StatInference.EmpiricalProcess.ThresholdCoding` finite-threshold signature/product-cardinality bridge |

Targeted search did not find exact Lean statements for VdV&W-specific
empirical-process objects such as:

```text
Glivenko-Cantelli class
Donsker class
bracketing number theorem
entropy with bracketing
outer expectation of arbitrary maps in the VdV&W sense
asymptotic measurability/tightness of arbitrary maps
measurable classes in the VdV&W empirical-process sense
symmetrization/maximal inequalities for empirical-process suprema
```

Therefore the status convention is:

| Status | Meaning |
| --- | --- |
| `local-exact` | exact textbook theorem statement is compiled locally from local primitives |
| `local-layer` | compiled local theorem layer exists, but the exact textbook theorem still has pending compatibility primitives |
| `mathlib-foundation` | mathlib has major reusable foundations, but not the exact VdV&W theorem |
| `pending-local` | no exact local proof yet; build local primitives and proof |
| `foundation-lane` | fundamental Chapter 1 item with a concrete mathlib-wrapper or local-primitive path |
| `blocked-vdvw` | exact VdV&W statement needs a missing arbitrary-map/nonmeasurable/perfect-map/representation primitive |
| `deferred` | audited and intentionally not on the current theorem line, with a recorded reason; not a substitute for mathlib search |
| `deferred-example` | example/addendum intentionally skipped for now because it needs domain-heavy external formalization |

## Definitions To Track As Primitive Dependencies

| Item | Anchor | Current status |
| --- | --- | --- |
| 1.3.3 weak convergence of arbitrary maps | `..._1-100.md:585` | local-layer/mathlib-foundation: measure-level probability-law wrapper `VdVWWeakConvergenceProbabilityMeasures` and bounded-continuous integral characterization proved; exact arbitrary-map outer-expectation definition pending |
| 1.3.7 asymptotic measurability | `..._1-100.md:661` | local-layer: nonnegative outer/inner expectation-gap primitive `VdVWAsymptoticallyMeasurableNonnegative`, lower-shifted real-test primitive `VdVWAsymptoticallyMeasurableLowerShiftedReal`, bounded-continuous lower-shifted primitive `VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted`, canonical bounded-continuous shift primitive `VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted`, and measurable-composition constructors proved; full signed bounded-continuous arbitrary-map definition pending |
| 1.9.1 stochastic convergence notation | `..._1-100.md:1292` | local-layer for common-domain outer-probability convergence |
| 1.10.1 convergence in outer probability to a constant | `..._1-100.md:1406` | local-layer |
| 2.1.5 covering numbers | `..._1-100.md:1894` | local-layer: `vdVWCoveringNumber` wraps mathlib `Metric.externalCoveringNumber`, with explicit finite-cover witnesses and closed-ball/open-ball slack documented |
| 2.1.6 bracketing numbers | `..._1-100.md:1895` | local-layer with primitive `l1BracketingNumber` |
| 2.2.3 covering and packing numbers for semimetrics | `..._101-200.md:292` | local-layer: `vdVWSemimetricCoveringNumber`, `vdVWSemimetricPackingNumber`, finite-cover handoff, and mathlib covering-packing inequalities |
| 2.3.3 `P`-measurable class | `..._101-200.md:627` | local-layer: product measure `P^n`, display `(2.3.2)` weighted supremum, completion/null-measurability predicate, countable coordinate-measurable constructor, and deterministic finite-cover supremum bound formalized |

## Report Contract For Every Promoted Theorem

Every theorem-level item must have exactly one theorem report folder once its
exact textbook statement is fully formalized in Lean.  Intermediate proof
layers and intentionally scoped compatibility wrappers should update this
blueprint or another status document, not `Reports/`.

Recommended folder naming:

```text
Reports/VdVW_<item-number>_<short_slug>/
```

Each folder must contain:

| File | Required content |
| --- | --- |
| `README.md` | theorem status, exact-statement classification, verification command |
| `crosswalk.md` | Lean realization vs markdown anchor vs PDF screenshot anchor |
| `definition_lemma_crosscheck.md` | every new local definition/lemma/structure/theorem introduced beyond mathlib |

Quality gate before marking a theorem `local-exact`:

1. the final theorem declaration compiles with local Lake;
2. no tracked Lean source contains `sorry`, `admit`, `axiom`, or `unsafe`;
3. the theorem statement uses primitive definitions that correspond to the
   textbook statement;
4. every new local primitive has a cross-check row;
5. the report includes local markdown line range and local PDF screenshot path;
6. reused mathlib declarations are listed as dependencies, not re-proved.

## Theorem-Level Gap Inventory

The table below lists every Chapter 1-2 lemma/theorem/proposition/corollary
extracted from the local markdown.  It intentionally avoids long textbook
quotes; the anchor is the authoritative local source location.

| Item | Kind | Anchor | Current audit status |
| --- | --- | --- | --- |
| 1.2.1 | Lemma | `..._1-100.md:372` | local-layer: nonnegative outer/inner expectation and cover interfaces, including monotonicity of outer and inner expectation |
| 1.2.2 | Lemma | `..._1-100.md:389` | local-layer: nonnegative sup/add/inf/product, two-sided constant addition equality, finite-measurable addition equality, threshold-indicator, tail-product cover-majorant, two-sided measurable infimum equality cover algebra, and measurable integrable real signed positive/negative bridge |
| 1.2.3 | Lemma | `..._1-100.md:438` | local-layer: outer/inner event probability, event-indicator monotonicity, explicit measurable event-cover existence, arbitrary measurable set cover to event-indicator cover with integral equality, direct `toMeasurable` hull integral equality, complement-set-cover lower cover, direct complement-cover inner-probability equalities, outer-probability/outer-expectation bridge, Markov-style outer-probability bound via supplied measurable cover, inner-expectation indicator equality, and two-sided complement identities |
| 1.2.4 | Lemma | `..._1-100.md:446` | local-layer: nonnegative a.e.-measurable dominated common-cover theorem compiled as `VdVWMeasurableCover.ofAEMeasurable_ae_eq`, `.ofAEMeasurable_minimal_ae_of_absolutelyContinuous`, `.ofAEMeasurableDominated`, and `exists_common_measurableCover_of_forall_absolutelyContinuous_aemeasurable`; bounded extended-real common-cover layer compiled for measurable maps and dominated a.e.-measurable maps as `VdVWBoundedERealMeasurableCover.exists_common_boundedERealMeasurableCover_of_measurable` and `.exists_common_boundedERealMeasurableCover_of_forall_absolutelyContinuous_aemeasurable`; full arbitrary/nonmeasurable extended-real common-cover existence still pending |
| 1.2.5 | Lemma | `..._1-100.md:467` | local-layer: measurable-target first/second coordinate product-cover transfers compiled as `VdVWMeasurableCover.fstProductOfMeasurable` and `.sndProductOfMeasurable`, plus probability-product outer- and inner-expectation invariance for measurable and a.e.-measurable targets as `VdVWOuterExpectation_prod_fst_eq_of_measurable`, `.prod_snd_eq_of_measurable`, `.prod_fst_eq_of_aemeasurable`, `.prod_snd_eq_of_aemeasurable`, `VdVWInnerExpectation_prod_fst_eq_of_measurable`, `.prod_snd_eq_of_measurable`, `.prod_fst_eq_of_aemeasurable`, and `.prod_snd_eq_of_aemeasurable`; full arbitrary-map perfect-projection theorem still pending |
| 1.2.6 | Lemma | `..._1-100.md:480` | local-layer/mathlib-foundation: product-space Tonelli wrappers for nonnegative VdV&W outer expectation compiled as `VdVWOuterExpectation_prod_eq_lintegral_lintegral_of_aemeasurable` and measurable specialization; exact arbitrary-map/perfect-map variants still pending |
| 1.2.7 | Lemma | `..._1-100.md:492` | local-layer/mathlib-foundation: symmetric product-space Tonelli wrappers for nonnegative VdV&W outer expectation compiled as `VdVWOuterExpectation_prod_eq_lintegral_lintegral_symm_of_aemeasurable` and measurable specialization; exact arbitrary-map/perfect-map variants still pending |
| 1.3.1 | Lemma | `..._1-100.md:575` | local-layer/mathlib-foundation: Borel sigma-field least for bounded-continuous real tests wrapped as `vdVW131_borel_le_iff_forall_boundedContinuous_measurable`, with closed-set distance proof |
| 1.3.2 | Lemma | `..._1-100.md:582` | local-layer/mathlib-foundation: complete separable metric-type probability-measure tightness wrapped as `vdVW132_complete_separable_probabilityMeasure_tight`; exact pre-tight/separable/tight/Polish-measure equivalence still pending local definitions |
| 1.3.4 | Theorem | `..._1-100.md:606` | local-layer/mathlib-foundation: weak convergence of probability measures via `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` plus Portmanteau closed/open implications wrapped locally; exact arbitrary-map outer-expectation version remains pending |
| 1.3.6 | Theorem | `..._1-100.md:650` | local-layer/mathlib-foundation: continuous map pushforward and `TendstoInDistribution` continuous-composition wrappers proved; signed arbitrary-map weak convergence now has continuous-map, filter-refinement, and ignored probability-product coordinate closures under a.e.-measurability in both common-domain and varying-domain forms; full nonmeasurable arbitrary-map cover layer still pending |
| 1.3.8 | Lemma | `..._1-100.md:678` | blocked-vdvw: Hoffmann-Jørgensen arbitrary-map weak-convergence infrastructure; missing exact local arbitrary-map/asymptotic-measurability primitive |
| 1.3.9 | Theorem | `..._1-100.md:688` | local-layer/mathlib-foundation: probability-measure tightness wrapper, compact-set characterization, Prokhorov compact-closure wrapper, closed-ball characterization on proper pseudo-metric spaces, norm-tail family characterization, sequence/range limsup norm-tail criterion, and finite-dimensional inner-product tail criteria including unit-vector and real-measure sequence forms proved over mathlib; exact arbitrary-map/asymptotic-tightness extension remains pending |
| 1.3.10 | Theorem | `..._1-100.md:756` | blocked-vdvw: exact nonmeasurable/arbitrary-map weak-convergence layer missing; measure-level weak-convergence/Portmanteau/tightness wrappers are already local, so the remaining gap is the exact arbitrary-map extension |
| 1.3.12 | Lemma | `..._1-100.md:768` | local-layer/mathlib-foundation: part (i) finite Borel measure uniqueness from bounded-continuous real integrals wrapped as `vdVW1312_measure_ext_of_forall_boundedContinuous_integral_eq`; part (ii) vector-lattice/tight variant pending |
| 1.3.13 | Lemma | `..._1-100.md:778` | blocked-vdvw: arbitrary-map/asymptotic-measurability infrastructure missing after mathlib search |
| 1.4.1 | Lemma | `..._1-100.md:848` | local-layer/mathlib-foundation: product Borel equality for separable pseudometric Borel spaces wrapped as `vdVW141_prod_borel_eq_product_borel` |
| 1.4.2 | Lemma | `..._1-100.md:849` | local-layer/mathlib-foundation: product bounded-continuous test uniqueness wrappers compiled as `vdVW142_prod_measure_ext_of_forall_boundedContinuous_integral_mul` and `vdVW142_prod_measure_eq_prod_of_forall_boundedContinuous_integral_mul`; exact nonnegative-Lipschitz spelling is a source-alignment refinement |
| 1.4.3 | Lemma | `..._1-100.md:857` | local-layer/mathlib-foundation: binary and finite product-law weak-convergence wrappers proved as `VdVWWeakConvergenceProbabilityMeasures.prod` and `.pi`; arbitrary-map/asymptotic-tightness extension pending |
| 1.4.4 | Lemma | `..._1-100.md:858` | local-layer/mathlib-foundation: finite-coordinate projection/FDD forward wrapper proved as `VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict`; converse FDD iff theorem still missing |
| 1.4.5 / 1.4.6 | Corollary/Example | `..._1-100.md:878`, `..._1-100.md:883` | local-layer/mathlib-foundation: measurable common-domain Slutsky/product convergence wrapper plus binary and finite-coordinate independent joint-law convergence wrappers `vdVWTendstoInDistribution_prodMk_laws_of_indepFun`, `vdVWTendstoInDistribution_pi_laws_of_iIndepFun`, `vdVWTendstoInDistribution_prodMk_of_indepFun`, and `vdVWTendstoInDistribution_pi_of_iIndepFun` proved; exact VdV&W product/arbitrary-map/asymptotic-independence criteria still pending |
| 1.4.8 | Theorem | `..._1-100.md:910` | local-layer/mathlib-foundation: FDD forward direction now wrapped for weak convergence, including the VdV&W-named `vdVW148_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`; process-law and `IdentDistrib` uniqueness-only FDD wrappers are compiled in `FiniteDimensional.lean`; projective-limit/FDD law equality APIs exist, but no exact weak-convergence iff-over-FDD converse theorem found |
| 1.5.2 | Lemma | `..._1-100.md:932` | foundation-lane: `l_infty(T)`/separability primitive target; mathlib has tightness/Prokhorov but local bounded-function-space API is still needed |
| 1.5.3 | Lemma | `..._1-100.md:933` | foundation-lane: `l_infty(T)`/Donsker tightness primitive target, local bounded-function-space API needed |
| 1.5.4 | Theorem | `..._1-100.md:934` | foundation-lane/mathlib-foundation: tightness theorem target using mathlib `IsTightMeasureSet`/Prokhorov plus local `l_infty(T)` wrappers |
| 1.5.6 | Theorem | `..._1-100.md:958` | foundation-lane: tightness/equicontinuity theorem target, local semimetric process API needed |
| 1.5.7 | Theorem | `..._1-100.md:987` | foundation-lane: pre-Gaussian/Donsker tightness theorem target; mathlib Gaussian foundations exist, local process wrapper needed |
| 1.5.9 | Lemma | `..._1-100.md:1044` | foundation-lane: tightness/equicontinuity wrapper target, local semimetric/process primitive needed |
| 1.6.1 | Theorem | `..._1-100.md:1117` | foundation-lane: stochastic-process tightness target; requires local stochastic-process/l_infty API over mathlib tightness |
| 1.7.1 | Lemma | `..._1-100.md:1156` | local-layer/mathlib-foundation: open-ball and closed-ball sigma-field wrappers, open-ball topological basis, rational open/closed ball bridges, open-ball/closed-ball sigma equality, Borel equality, generator measurability, and separable dense-sequence distance-coordinate measurability iff proved in `BallSigma.lean`; exact arbitrary-map/asymptotic-measurability clauses pending |
| 1.7.2 | Theorem | `..._1-100.md:1157` | local-layer/mathlib-foundation: dense-sequence distance-coordinate criterion and Borel/open-ball/closed-ball measurability equivalences compiled; exact VdV&W arbitrary-map separability/asymptotic-measurability statement still needs local wrapper |
| 1.8.1 | Lemma | `..._1-100.md:1234` | local-layer/mathlib-foundation: `HilbertGaussian.lean` wraps complete inner-product spaces as Hilbert spaces, `L2` Hilbert space, and `L2` inner product |
| 1.8.2 | Lemma | `..._1-100.md:1245` | local-layer/mathlib-foundation: Frechet-Riesz continuous-dual representative and evaluation identity wrapped in `HilbertGaussian.lean` |
| 1.8.3 | Lemma | `..._1-100.md:1246` | local-layer/mathlib-foundation: Gaussian inner-coordinate maps and Gaussian-process coordinate laws wrapped in `HilbertGaussian.lean`; no Brownian-bridge/pre-Gaussian full theorem found |
| 1.8.4 | Theorem | `..._1-100.md:1247` | foundation-lane/mathlib-foundation: Hilbert/Gaussian foundations are wrapped; exact functional-CLT/P-Donsker statement still needs local stochastic-process primitives |
| 1.9.2 | Lemma | `..._1-100.md:1304` | local-layer; scoped convergence-mode building block |
| 1.9.3 | Lemma | `..._1-100.md:1308` | local-layer; scoped convergence-mode building block |
| 1.9.5 | Theorem | `..._1-100.md:1328` | mathlib-foundation, pending scoped VdV&W wrapper when active |
| 1.9.6 | Theorem | `..._1-100.md:1354` | local-layer |
| 1.10.2 | Lemma | `..._1-100.md:1409` | local-layer for measurable common-domain part |
| 1.10.3 | Theorem | `..._1-100.md:1420` | blocked-vdvw: almost-sure representation/Skorokhod route; no exact local or pinned mathlib theorem found yet |
| 1.10.4 | Theorem | `..._1-100.md:1434` | blocked-vdvw: nonmeasurable almost-sure representation theorem; missing arbitrary-map/perfect-map representation primitive |
| 1.10.12 | Proposition | `..._1-100.md:1554` | blocked-vdvw: Borel measurable approximants/representation roadmap; exact local measurable-approximation primitive missing |
| 1.11.1 | Theorem | `..._1-100.md:1630` | foundation-lane/mathlib-foundation: extended continuous-mapping wrapper target over mathlib continuous mapping plus local outer-probability layer |
| 1.11.3 | Theorem | `..._1-100.md:1674` | foundation-lane: refined mapping/integrability theorem target; needs local integrability/tail primitive audit |
| 1.12.1 | Theorem | `..._1-100.md:1706` | foundation-lane: uniformity over bounded equicontinuous test classes, local test-class primitive needed |
| 1.12.2 | Theorem | `..._1-100.md:1718` | foundation-lane: bounded-Lipschitz determining-class theorem target, search/wrap mathlib metric weak-convergence APIs |
| 1.12.4 | Theorem | `..._1-100.md:1751` | foundation-lane/mathlib-foundation: bounded-Lipschitz/Levy-Prokhorov metric wrapper target |
| 2.1.11 | Proposition | `..._101-200.md:169` | pending-local |
| 2.2.1 | Lemma | `..._101-200.md:229` | pending-local |
| 2.2.2 | Lemma | `..._101-200.md:246` | pending-local |
| 2.2.4 | Theorem | `..._101-200.md:301` | pending-local |
| 2.2.5 | Corollary | `..._101-200.md:314` | pending-local |
| 2.2.7 | Lemma | `..._101-200.md:372` | mathlib-foundation, pending exact Rademacher form |
| 2.2.8 | Corollary | `..._101-200.md:405` | pending-local |
| 2.2.9 | Lemma | `..._101-200.md:429` | pending-local |
| 2.2.10 | Lemma | `..._101-200.md:438` | pending-local |
| 2.2.11 | Lemma | `..._101-200.md:466` | mathlib-foundation, pending exact Bernstein form |
| 2.3.1 | Lemma | `..._101-200.md:572` | pending-local |
| 2.3.6 | Lemma | `..._101-200.md:650` | pending-local |
| 2.3.7 | Lemma | `..._101-200.md:672` | pending-local |
| 2.3.9 | Lemma | `..._101-200.md:717` | pending-local |
| 2.3.11 | Lemma | `..._101-200.md:762` | pending-local |
| 2.3.12 | Corollary | `..._101-200.md:780` | pending-local |
| 2.3.13 | Corollary | `..._101-200.md:784` | pending-local |
| 2.3.14 | Lemma | `..._101-200.md:807` | pending-local |
| 2.3.15 | Theorem | `..._101-200.md:818` | pending-local |
| 2.3.16 | Proposition | `..._101-200.md:857` | pending-local |
| 2.3.17 | Theorem | `..._101-200.md:882` | pending-local |
| 2.4.1 | Theorem | `..._101-200.md:970` | local-exact |
| 2.4.3 | Theorem | `..._101-200.md:988` | local-layer; Definition 2.1.5 covering primitive, fixed-sample empirical `L1(P_n)` distance/covering-number interface, nonempty empirical-cover positive-cardinality bridge, random empirical covering-number sequence, random empirical-cover cardinality witness handoff, random empirical-cover product random-sign handoff, outer-probability `o_P^*(n)` entropy wrapper, `F_M` truncated-class/envelope interface plus ordinary measurable truncation-tail integral bridge, measurable-integrable outer/lintegral envelope-tail convergence, a.e./null-measurable cover constructors, Definition 2.3.3 `P`-measurable primitive, deterministic finite-cover supremum-bound layers, fixed-sample empirical-net inequality `(2.4.4)`, finite-center maximal/Hoeffding-scale handoff layer, deterministic Rademacher-sign specialization, one-center random Rademacher sub-Gaussian bridge, variance-proxy arithmetic, sub-Gaussian proxy monotonicity, finite-center sub-Gaussian tail/union-bound layer, iid real-valued Rademacher-sign construction, finite-center supremum integrability layer, expected finite-center supremum handoff, layer-cake tail-integral monotonicity, finite-`Pi` mapped-coordinate product wrappers, finite-`Pi` weighted-sum expectation/mean-zero wrappers, product-copy weighted-sum mean-zero wrapper, conditional ghost-copy finite-`Pi` Fubini wrapper, finite product-coordinate projection wrapper, one-sided product-sample projections, Gaussian-tail integrability/evaluation, coarse closed-form expectation bound, split-at-radius tail-to-expectation bound, bounded-tail expectation wrapper, bounded varying-domain real-tail-to-mean wrapper, Mills-type Gaussian-tail estimate, finite-center Mills expectation bound, supplied small-tail Mills simplification, logarithmic-radius expected-maximal packaging, truncated Rademacher finite-cover expected-maximal specialization, log-radius-to-Hoeffding scale comparison, finite-sample truncated-coordinate law/independence, finite product-sample pair-difference weighted-sum mean-zero, fixed-original-sample ghost-copy identity, fixed-sample `Phi(x)=x` ghost-copy comparison, pair-difference supremum split, envelope-bounded pair split, expectation-level integral lifts, Fubini/product-projection centered handoff, deterministic weight sign-flip invariance, projected two-coordinate pair-difference expectation bound, composed centered-to-two-truncated-expectation handoff, deterministic Rademacher-weight sign-negation bridge, product-pair Rademacher sign-swap measure-preserving wrapper, integrated product-pair sign-symmetry and random-sign averaging comparisons, random-sign expected-maximal and outer-expectation projections, supplied-`hphi_id` finite-net projection, product-integrated measurable-cover outer-expectation bridge, supplied product-space finite-net projection, sample-cover and sample-dependent-cardinality product-a.e. finite-net bridges, selected random-cover expected-maximal handoff, product-integrated random-cover finite-net expected-maximal bound, product outer-expectation projection for the expectation-level random-cover route, finite-net Hoeffding upper nonnegativity/square/log-cardinality rewrites, deterministic `L_n / n -> 0` to Hoeffding-scale convergence helper, pointwise finite-net notation convergence bridge, stochastic outer-probability entropy-to-Hoeffding convergence, shifted-display convergence, fixed/all-entropy Hoeffding convergence consumers, Markov outer-expectation-to-outer-probability bridges including variable-domain/sample-space variants, variable-domain bounded outer-probability-to-mean bridge, finite-net mean consumer, deterministic finite-net log-bound suppliers, selected terminal/truncated minimal-cardinality measurability wrappers, fixed-`M` centered-truncated convergence handoff under a vanishing integrated Hoeffding-plus-radius hypothesis, inverse-radius selected entropy side-condition package, package-level finite-net mean projections from deterministic selected log-ratio bounds, selected inverse-radius all-radius finite-net mean projections, and proof-carrying symmetrization precursor package now available; exact theorem still pending diagonal selected log-cardinality convergence plus a deterministic selected normalized log-cardinality bound, or a genuine varying-domain bounded/UI replacement, from the theorem entropy hypotheses, then final assembly |
| 2.4.5 | Lemma | `..._101-200.md:1022` | pending-local |
| 2.5.2 | Theorem | `..._101-200.md:1106` | pending-local |
| 2.5.6 | Theorem | `..._101-200.md:1204` | pending-local |
| 2.6.2 | Lemma | `..._101-200.md:1358` | mathlib-foundation, pending VdV&W wrapper |
| 2.6.3 | Corollary | `..._101-200.md:1369` | mathlib-foundation, pending VdV&W wrapper |
| 2.6.4 | Theorem | `..._101-200.md:1378` | pending-local |
| 2.6.6 | Lemma | `..._101-200.md:1450` | pending-local |
| 2.6.7 | Theorem | `..._101-200.md:1490` | pending-local |
| 2.6.9 | Theorem | `..._101-200.md:1533` | pending-local |
| 2.6.11 | Lemma | `..._101-200.md:1604` | pending-local |
| 2.6.12 | Corollary | `..._101-200.md:1623` | pending-local |
| 2.6.13 | Lemma | `..._101-200.md:1634` | pending-local |
| 2.6.14 | Theorem | `..._101-200.md:1645` | pending-local |
| 2.6.15 | Lemma | `..._101-200.md:1652` | pending-local |
| 2.6.16 | Lemma | `..._101-200.md:1667` | pending-local |
| 2.6.17 | Lemma | `..._101-200.md:1670` | pending-local |
| 2.6.18 | Lemma | `..._101-200.md:1685` | pending-local |
| 2.6.19 | Lemma | `..._101-200.md:1713` | pending-local |
| 2.6.20 | Lemma | `..._101-200.md:1714` | pending-local |
| 2.6.22 | Lemma | `..._101-200.md:1720` | pending-local |
| 2.7.1 | Theorem | `..._101-200.md:1859` | pending-local |
| 2.7.2 | Corollary | `..._101-200.md:1927` | pending-local |
| 2.7.3 | Corollary | `..._101-200.md:1939` | pending-local |
| 2.7.4 | Corollary | `..._101-200.md:1956` | pending-local |
| 2.7.5 | Theorem | `..._101-200.md:2000` | pending-local |
| 2.7.8 | Lemma | `..._101-200.md:2129` | pending-local |
| 2.7.9 | Corollary | `..._101-200.md:2140` | pending-local |
| 2.7.11 | Theorem | `..._101-200.md:2186` | pending-local |
| 2.8.1 | Theorem | `..._101-200.md:2227` | pending-local |
| 2.8.2 | Theorem | `..._101-200.md:2309` | pending-local |
| 2.8.3 | Theorem | `..._101-200.md:2370` | pending-local |
| 2.8.4 | Theorem | `..._101-200.md:2407` | pending-local |
| 2.8.7 | Lemma | `..._101-200.md:2471` | pending-local |
| 2.8.8 | Lemma | `..._101-200.md:2472` | pending-local |
| 2.8.9 | Theorem | `..._101-200.md:2485` | pending-local |
| 2.8.10 | Theorem | `..._101-200.md:2486` | pending-local |
| 2.9.1 | Lemma | `..._101-200.md:2537` | pending-local |
| 2.9.2 | Theorem | `..._101-200.md:2613` | pending-local |
| 2.9.3 | Corollary | `..._101-200.md:2638` | pending-local |
| 2.9.4 | Corollary | `..._101-200.md:2650` | pending-local |
| 2.9.5 | Lemma | `..._101-200.md:2659` | pending-local |
| 2.9.6 | Theorem | `..._101-200.md:2684` | pending-local |
| 2.9.7 | Theorem | `..._101-200.md:2729` | pending-local |
| 2.9.8 | Lemma | `..._101-200.md:2770` | pending-local |
| 2.9.9 | Corollary | `..._101-200.md:2777` | pending-local |
| 2.10.1 | Theorem | `..._201-300.md:117` | pending-local |
| 2.10.2 | Theorem | `..._201-300.md:118` | pending-local |
| 2.10.3 | Theorem | `..._201-300.md:119` | pending-local |
| 2.10.6 | Theorem | `..._201-300.md:153` | pending-local |
| 2.10.13 | Corollary | `..._201-300.md:179` | pending-local |
| 2.10.14 | Lemma | `..._201-300.md:198` | pending-local |
| 2.10.15 | Lemma | `..._201-300.md:223` | pending-local |
| 2.10.16 | Lemma | `..._201-300.md:240` | pending-local |
| 2.10.20 | Theorem | `..._201-300.md:354` | pending-local |
| 2.10.24 | Theorem | `..._201-300.md:411` | pending-local |
| 2.11.1 | Theorem | `..._201-300.md:523` | pending-local |
| 2.11.6 | Lemma | `..._201-300.md:635` | pending-local |
| 2.11.9 | Theorem | `..._201-300.md:692` | pending-local |
| 2.11.11 | Theorem | `..._201-300.md:740` | pending-local |
| 2.11.12 | Corollary | `..._201-300.md:757` | pending-local |
| 2.11.17 | Lemma | `..._201-300.md:849` | pending-local |
| 2.11.22 | Theorem | `..._201-300.md:1008` | pending-local |
| 2.11.23 | Theorem | `..._201-300.md:1015` | pending-local |
| 2.12.1 | Theorem | `..._201-300.md:1178` | pending-local |
| 2.12.6 | Theorem | `..._201-300.md:1258` | pending-local |
| 2.13.1 | Theorem | `..._201-300.md:1343` | pending-local |
| 2.13.2 | Theorem | `..._201-300.md:1365` | pending-local |
| 2.13.6 | Theorem | `..._201-300.md:1478` | pending-local |
| 2.14.1 | Theorem | `..._201-300.md:1554` | pending-local |
| 2.14.2 | Theorem | `..._201-300.md:1585` | pending-local |
| 2.14.3 | Lemma | `..._201-300.md:1615` | pending-local |
| 2.14.5 | Theorem | `..._201-300.md:1731` | pending-local |
| 2.14.9 | Theorem | `..._201-300.md:1818` | pending-local |
| 2.14.10 | Theorem | `..._201-300.md:1825` | pending-local |
| 2.14.13 | Theorem | `..._201-300.md:1862` | pending-local |
| 2.14.14 | Theorem | `..._201-300.md:1878` | pending-local |
| 2.14.16 | Theorem | `..._201-300.md:1907` | pending-local |
| 2.14.17 | Theorem | `..._201-300.md:1914` | pending-local |
| 2.14.18 | Lemma | `..._201-300.md:1930` | pending-local |
| 2.14.19 | Lemma | `..._201-300.md:1941` | pending-local |
| 2.14.24 | Theorem | `..._201-300.md:2159` | pending-local |
| 2.14.25 | Theorem | `..._201-300.md:2172` | pending-local |
| 2.14.26 | Lemma | `..._201-300.md:2231` | pending-local |
| 2.14.27 | Theorem | `..._201-300.md:2262` | pending-local |
| 2.14.28 | Lemma | `..._201-300.md:2289` | pending-local |
| 2.14.32 | Lemma | `..._201-300.md:2491` | pending-local |

## Examples And Addenda Frontier

Examples and addenda are tracked separately from the 157 theorem-level items
above, so they do not change the theorem-level dashboard counts.

| Item | Kind | Anchor | Current audit status |
| --- | --- | --- | --- |
| 2.3.4 | Example | `..._101-200.md:630` | deferred-example local-layer: pointwise/countable-subclass predicates, pointwise-to-weighted-sum convergence helpers, value-set/boundedness infrastructure for the real supremum display, bounded pointwise-approximability-to-supremum-equality bridge, deterministic finite-cover supremum bound, and the proof-carrying supremum-equality handoff to `P`-measurability; exact example closure is deferred unless needed by a theorem |
| 2.4.2 | Example | `..._101-200.md:985` | deferred-example local-layer: real half-line indicator bracket membership, endpoint integrability, `L1(P)` width identity, extended-real endpoint indicators/brackets for `-∞`/`∞`, extended-open-cell endpoint identities and width identity, probability-measure CDF/Stieltjes open-cell identity and CDF-increment-to-middle-width handoffs, finite-measure real-tail cutpoint lemma, adjacent-endpoint grid handoff, supplied finite-grid bridges to the primitive bracketing-number witness, one-cell base grid and one-cell adjacent-endpoint base grid for radii above total mass, radius-monotonicity helpers for supplied real/extended/adjacent-endpoint grids, finite-real-endpoint assembly constructor, three-cell endpoint-grid constructor from supplied lower-tail/middle-cell/upper-tail width bounds and CDF increment bounds, bounded-middle CDF partition interface `SuppliedRealMiddleCDFPartition` with adjacent-endpoint strictness and open-cell width handoff, tail-appending endpoint constructor and endpoint-grid existence handoff from a supplied middle partition, reduction from uniform bounded middle partitions to full endpoint-grid existence, primitive-grid existence, and bracketing-number finiteness to the nontrivial range `epsilon <= μ.real univ`, all-positive-radius handoff to the Theorem 2.4.1 `N_[] < ∞` hypothesis, conditional half-line GC corollary from supplied grids, and conditional half-line GC corollary from adjacent endpoint grids; distribution-dependent bounded middle CDF/quantile partition and exact empirical-CDF report are deferred unless needed by a theorem |

## Priority Order

1. Finish Chapter 1.2 arbitrary-map outer expectation/inner probability:
   extended-real compatibility, remaining exact Lemma 1.2.3 clauses beyond
   the nonnegative indicator equality, and Fubini-compatible statements.
2. Promote Chapter 1.3-1.12 foundation wrappers systematically, starting with
   mathlib-backed measure-level weak convergence, Portmanteau, tightness,
   continuous mapping, product laws, convergence in distribution, Hilbert, and
   bounded-Lipschitz metrics.  Mark only the exact VdV&W arbitrary-map or
   representation extensions as blocked when the needed primitive is genuinely
   absent.
3. Promote Chapter 2 primitive infrastructure: covering/packing semimetric
   numbers, `P`-measurable classes, Orlicz norms, and separability wrappers.
   Definition 2.1.5 now has a local covering-number primitive layer,
   Definition 2.2.3 now has semimetric covering/packing wrappers, and
   Definition 2.3.3 now has a deterministic finite-cover supremum bound for
   display `(2.3.2)`; the fixed-sample and random empirical `L1(P_n)`
   covering-number/entropy interfaces, the `F_M` truncated-class/envelope
   interface, the fixed-sample net inequality `(2.4.4)`, the finite-center
   maximal/Hoeffding-scale handoff layer, and the deterministic
   Rademacher-sign specialization and one-center sub-Gaussian bridge are now
   available, and the nonempty empirical-cover positive-cardinality bridge,
   truncated-envelope variance-proxy arithmetic, sub-Gaussian proxy
   monotonicity, finite-center sub-Gaussian tail/union-bound layer, iid
   real-valued Rademacher-sign construction, finite-center supremum
   integrability layer, expected finite-center supremum handoff,
   layer-cake tail-integral monotonicity, Gaussian-tail integrability,
   exact Gaussian-tail integral evaluation, coarse closed-form finite-center
   expectation bound, split-at-radius tail-to-expectation bound, Mills-type
   Gaussian-tail estimate, finite-center Mills expectation bound, supplied
   small-tail Mills simplification,
   logarithmic-radius positivity/square/exponential-factor arithmetic, the
   finite-center logarithmic-radius Mills expectation bound, a proof-carrying
   expected finite-center maximal-bound predicate, the log-radius Mills upper
   wrapper, the truncated Rademacher expected-maximal specialization, its
   finite-empirical-cover version, ordinary measurable truncation-tail
   integral bridge, measurable-integrable outer/lintegral envelope-tail
   convergence, the log-radius-to-Hoeffding scale comparison, mapped
   truncated-class product-copy law/independence, finite-sample mapped
   truncated-coordinate laws/independence, fixed-index product-copy
   mean-zero, a.e. random Rademacher-sign finite-net handoff, and the
   proof-carrying `VdVWTheorem243SymmetrizationPrecursor` package and finite
   product-sample pair-difference weighted-sum mean-zero bridge, plus the
   fixed-original-sample conditional ghost-copy identity, fixed-sample
   `Phi(x)=x` ghost-copy comparison, envelope-bounded pair split, and
   supplied-`hphi_id` finite-net projection are now compiled.  The finite
   product-coordinate projection wrapper
   `probability_pi_prod_coordinates_measurePreserving`, VdV&W projection
   specializations `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
   `measurePreserving_vdVWProductMeasure_prod_to_original`, and
   `measurePreserving_vdVWProductMeasure_prod_to_ghost`, deterministic
   sign-flip invariance for weighted suprema, and the two expectation-level
   integral lifts are also compiled.
   The precursor now also exposes random-sign expected-maximal and
   supplied-cover outer-expectation projections, and `PMeasurable.lean` has a
   bounded-value-set bridge from a class member's absolute weighted sum to
   `vdVWWeightedClassSupremum`, plus a pointwise-uniform-bound route to the
   needed value-set boundedness.  The product-pair Rademacher sign-symmetry
   route is compiled through
   `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
   The product-integrated measurable-cover transfer, supplied product-space
   finite-net projection, sample-cover/sample-dependent-cardinality
   product-a.e. finite-net bridges, random empirical-cover cardinality witness
   handoff, random empirical-cover product random-sign handoff, selected
   random-cover expected-maximal handoff, and product-integrated random-cover
   finite-net expected-maximal bound are now compiled, along with the product
   outer-expectation projection for the expectation-level route and the
   composed product-integrated centered-truncated finite-net bridge
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
   The outer-probability entropy-to-Hoeffding-scale handoff, fixed/all-entropy
   consumers, fixed-`M` centered-truncated convergence handoff under a
   vanishing integrated Hoeffding-plus-radius hypothesis, real-mean convergence
   consumer, split finite-net-mean/cover-radius fixed-`M` consumer, bounded-tail
   expectation wrapper, bounded varying-domain real-tail-to-mean wrapper,
   variable-domain bounded outer-probability-to-mean
   bridge, variable-domain entropy-to-Hoeffding bridge, finite-net mean
   consumer, pure finite-net mean consumer, bounded entropy-to-integrated-mean
   consumer, pure bounded entropy-to-finite-net mean consumer, random finite-net
   upper measurability/integrability packaging, measurable-cardinality
   finite-net mean and integrated-mean consumers, selected inverse-radius
   all-radius finite-net mean projections from deterministic log bounds, and
   the bounded fixed-`M`
   centered-truncated consumer
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_bounded`
   plus the canonical inverse-radius variant
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_bounded_invRadius`
   are now compiled.  The
   cover-event-to-covering-number measurability abstraction
   `measurable_empiricalL1CoveringNumber_of_cover_event_measurable`, the least
   finite-cardinality measurability wrapper
   `measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable`,
   the minimal finite cardinality domination wrapper
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_minimal_finite`, and the
   countable-class route
   `nonempty_finiteEmpiricalL1CoverAtCard_iff_exists_centers`,
   `measurableSet_finiteEmpiricalL1CoverAtCard_of_countable`,
   `measurable_empiricalL1CoveringNumber_of_countable`,
   `measurable_finiteEmpiricalL1CoveringNumberCard_of_countable`, plus the
   measurable-member convenience wrappers, and theorem-facing
   selected-cardinality wrappers for countable/truncated classes are compiled.
   The
   deterministic finite-net log-bound suppliers
   `vdVWTheorem243FiniteNetHoeffdingUpper_le_of_logCardinality_div_le`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_bound_of_logCardinality_div_le`,
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
   and
   `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
   plus the fixed-`M` centered-truncated consumer
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound`
   are now compiled as well.  The packaged inverse-radius entropy
   side-condition layer
   `VdVWTheorem243FixedMInvRadiusEntropySideConditions`,
   `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`,
   `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero`,
   and
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_bounded`
   is also compiled.  It packages selected inverse-radius covers, diagonal
   log-cardinality convergence, and measurable cardinality while leaving the
   finite-net boundedness/UI assumption explicit.  The selected inverse-radius
   package `VdVWTheorem243SelectedInvRadiusEntropySideConditions`, finite-cover
   constructor
   `VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_invRadiusFiniteCovers`,
   fixed-package projection, and compact fixed-`M` convergence consumer
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy`
   are also compiled, closing finite-cover domination and terminal equality for
   the selected minimal-cardinality route.  The next frontier is supplying the
   diagonal shrinking-radius selected log-cardinality convergence and
   deterministic normalized log-cardinality bound, or a genuine variable-domain
   boundedness/UI input, then final assembly.
   The untruncation side now has compiled deterministic and probabilistic
   bridges through
   `vdVWTheorem243_untruncated_centered_badEvent_subset_truncated_or_empiricalTail`,
   `VdVWOuterProbability_untruncated_centered_bad_le_truncated_add_empiricalTail`,
   and
   `VdVWOuterProbability_untruncated_centered_bad_le_truncated_add_tailIntegral`.
   The large-`M` tail-choice convergence handoff is now compiled as
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_fixedM_centered_truncated`.
   The selected inverse-radius composition is now compiled as
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedInvRadiusEntropy`.
   The selected-cardinality constructor
   `VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_selected_truncated`
   and the non-selected untruncated inverse-radius/log-bound consumer
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_invRadiusEntropy_logCardinality_div_bound`
   are also compiled.  The all-radius selected-truncated bridge
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_invRadiusEntropy_logCardinality_div_bound`
   is compiled as well, but it still keeps the inverse-radius diagonal selected
   log convergence and log-ratio assumptions explicit.  The faithful
   fixed-radius alternative is now compiled through
   `exists_pos_radius_eventually_two_mul_ofReal_add_div_le_of_forall_tendsto_zero`,
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_integral_finiteNetHoeffdingUpper_tendsto_zero`,
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_div_bound`, and
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_div_bound`.
   The selected fixed-radius route is now compiled through the monotone
   outer-probability bridge
   `VdVWConvergesInOuterProbabilityConst_zero_of_nonneg_le`, the selected
   fixed-radius cardinality wrapper
   `vdVWSelectedTruncatedFixedRadiusEmpiricalL1CoveringNumberCard`, selected
   normalized-log convergence
   `vdVWLogEmpiricalL1CoveringCardinality_selected_fixedRadius_div_convergesInOuterProbabilityConst_zero_of_forAllRadius_samplePath`,
   and the selected finite-net mean handoffs
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_selected_truncated_fixedRadius_logCardinality_div_bound`
   and
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_forall_pos_selected_truncated_fixedRadius_logCardinality_div_bound`.
   It now also feeds the theorem-facing consumers through
   `vdVWSelectedTruncatedPositiveRadiusEmpiricalL1CoveringNumberCard`,
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.selected_truncated_positiveRadius_of_forAllRadius_samplePath`,
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_logCardinality_div_bound`,
   and
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_logCardinality_div_bound`.
   The tail/UI alternative is now also compiled through
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_selected_truncated_fixedRadius_tailExpectation`,
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_forall_pos_selected_truncated_fixedRadius_tailExpectation`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_div_bound`,
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_tailExpectation`,
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_tailExpectation`,
   `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedFixedRadiusTailSideConditions`,
   and
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedFixedRadiusTailSideConditions`.
   The terminal product-grid arithmetic handoffs
   `vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_succ_terminal_le_pow`
   and
   `vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_terminal_le_pow`
   now convert future `base ^ n` finite-grid/packing cardinality estimates
   into the normalized log-cardinality bound required by the selected
   fixed-radius tail route.  The finite-center-set and mathlib internal-cover
   adapter layer is now compiled in `CoveringPrimitive.lean` through
   `nonempty_finiteEmpiricalL1CoverAtCard_of_finite_centerSet`,
   `empiricalL1CoveringNumber_le_of_finite_centerSet`,
   `nonempty_finiteEmpiricalL1CoverAtCard_of_metric_isCover`,
   `empiricalL1CoveringNumber_le_of_metric_isCover`,
   `nonempty_finiteEmpiricalL1CoverAtCard_of_metric_minimalCover`, and
   `empiricalL1CoveringNumber_le_of_metric_minimalCover`.  The induced
   empirical pseudometric adapter is also compiled through
   `EmpiricalL1Index`, `EmpiricalL1Index.instPseudoEMetricSpace`,
   `EmpiricalL1Index.empiricalL1Distance_le_coe_radius_of_edist_le`,
   `nonempty_finiteEmpiricalL1CoverAtCard_of_empiricalL1Index_isCover`,
   `nonempty_finiteEmpiricalL1CoverAtCard_of_empiricalL1Index_minimalCover`,
   `empiricalL1CoveringNumber_le_of_empiricalL1Index_minimalCover_card`, and
   `empiricalL1CoveringNumber_le_empiricalL1Index_coveringNumber`,
   `nonempty_finiteEmpiricalL1CoverAtCard_of_empiricalL1Index_coveringNumber_le`,
   and
   `empiricalL1CoveringNumber_le_of_empiricalL1Index_coveringNumber_le`, so
   mathlib internal covers for the empirical `L1(P_n)` pseudometric now give
   local empirical-cover witnesses with centers in the class, and finite
   internal-cover cardinality bounds can be consumed directly.  The
   sample-path random-cover bridge and selected fixed-radius tail-package
   constructors are also compiled through
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_empiricalL1Index_coveringNumber_le_samplePath`,
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_empiricalL1Index_coveringNumber_le_samplePath`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_empiricalL1Index_coveringNumber_le_terminal_pow`,
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_empiricalL1Index_coveringNumber_le_succ_terminal_pow`.
   The finite-class geometric/cardinality instantiation is now also compiled:
   `EmpiricalL1Index.ofIndex_injective`,
   `EmpiricalL1Index.image_ofIndex_eq_liftSet`,
   `EmpiricalL1Index.encard_liftSet_eq`,
   `EmpiricalL1Index.finite_liftSet`,
   `empiricalL1Index_coveringNumber_le_indexClass_encard`,
   `empiricalL1Index_coveringNumber_le_indexClass_toFinset_card`,
   `empiricalL1CoveringNumber_le_indexClass_toFinset_card`,
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_indexClass_cardinality_bound`,
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_indexClass_cardinality_bound_samplePath`,
   `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_indexClass_cardinality_bound_samplePath`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_indexClass_cardinality_bound_terminal_pow`,
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_indexClass_cardinality_bound_succ_terminal_pow`.
   The finite-class entropy/tail package is also compiled through
   `VdVWConvergesInOuterProbabilityConst_of_tendsto_const`,
   `VdVWConvergesInOuterProbabilityConst_zero_of_constant_logCardinality_div`,
   `vdVWLogEmpiricalL1CoveringCardinality_const_terminal_div_le_log`, and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_indexClass`.
   The finite-class package is now consumed by the untruncated theorem-facing
   convergence declaration
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`.
   This finite-class consumer now also discharges truncated-class integrability
   and finite-class value-set boundedness through
   `integrable_vdVWTruncatedClassFun_of_integrable`,
   `integrable_envelope_tail_of_integrable`, and
   `bddAbove_vdVWWeightedClassValueSet_of_finite`.
   The selected fixed-radius tail/untruncated wrappers and the finite-class
   consumer now also derive finite-center Rademacher supremum integrability via
   `integrable_vdVWFiniteCenterWeightedSupremum_of_truncated_rademacher`, using
   the existing one-center sub-Gaussian bridge and truncated variance proxy.
   The finite-class consumer now also derives the centered truncated measurable
   cover internally through
   `VdVWMeasurableCover.centered_truncated_of_countable_of_coordinate`, which
   combines countable coordinate measurability with the existing `ofReal`
   measurable-cover constructor.
   It also derives the centered truncated weighted-class supremum
   integrability input internally through
   `integrable_vdVWWeightedSampleSum_of_integrable`,
   `vdVWWeightedClassSupremum_le_sum_abs_of_finite`, and
   `integrable_vdVWWeightedClassSupremum_of_finite`, by bounding the finite
   supremum with a finite sum of absolute fixed-index weighted sample sums and
   using mathlib product-coordinate integrability.
   The same finite-sum route now also removes the finite-class ghost
   pair-difference supremum integrability, ghost-expectation integrability,
   split-copy supremum integrability, and sample-side Rademacher supremum
   integrability assumptions through
   `integrable_vdVWWeightedClassSupremum_truncated_of_finite`,
   `integrable_vdVWWeightedClassSupremum_pairDifference_ghost_of_finite`, and
   `integrable_vdVWWeightedClassSupremum_pairDifference_split_of_finite`.
   The finite-class consumer now also derives the remaining random-sign
   product-space assumptions internally: sign-side Rademacher supremum
   integrability, product-space Rademacher supremum integrability, the
   product-space measurable cover, and the sign-side iterated-integral
   integrability.  This is compiled through
   `integrable_vdVWWeightedClassSupremum_of_finite_varying_weights`,
   `integrable_vdVWWeightedClassSupremum_truncated_rademacher_sign_of_finite`,
   `integrable_vdVWWeightedClassSupremum_truncated_rademacher_product_of_finite`,
   `integrable_vdVWWeightedClassSupremum_truncated_rademacher_integral_of_finite`,
   and
   `VdVWMeasurableCover.truncated_rademacher_product_of_finite`, using
   mathlib `HasSubgaussianMGF.integrable`, `Integrable.mul_prod`, Fubini
   integrability, and finite `biSup` measurability.
   The finite-class route also now has
   `exists_common_iid_vdVWRademacherSigns` and
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass_iidRademacher`,
   so the final finite-class specialization no longer asks the caller for an
   auxiliary Rademacher sign probability space.
   It also has the canonical terminal sample-path wrapper
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass_canonical`,
   removing the remaining finite-class `X`/`samplePath` plumbing under the
   honest `[Inhabited Observation]` dummy-coordinate assumption.
   The next proof step is therefore the non-finite-class
   geometric/cardinality instantiation, or a final theorem-critical
   specialization consuming this finite-class untruncated consumer.
   The terminal
   power-bound constructors
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_terminal_le_pow`
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_succ_terminal_le_pow`
   are also compiled, so a future estimate
   `cardinality eta n sample n <= base eta ^ n` or
   `cardinality eta n sample n + 1 <= base eta ^ n` now directly supplies the
   selected fixed-radius tail/UI package.  The fixed-sample trace layer is also
   compiled via `empiricalTrace` and
   `nonempty_finiteEmpiricalL1CoverAtCard_of_finite_trace_image`, so any
   finite trace-count, VC/Sauer, or discretization argument now directly
   produces a deterministic empirical `L1(P_n)` cover and covering-number
   bound.  The corresponding Theorem 2.4.3 selected fixed-radius package
   constructors are also compiled:
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_terminal_pow`
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_succ_terminal_pow`.
   The deterministic-rate entropy adapter is also compiled through
   `VdVWConvergesInOuterProbabilityConst_zero_of_logCardinality_div_le_tendsto_bound`,
   `VdVWConvergesInOuterProbabilityConst_zero_of_real_log_cardinality_div_le_tendsto_bound`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_div_tendsto_bound`,
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_logCardinality_div_tendsto_bound`.
   The concrete log-linear/polynomial-rate layer is also compiled via
   `tendsto_log_nat_div_atTop_nhds_zero`,
   `tendsto_const_add_mul_log_nat_div_atTop_nhds_zero`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_log_linear_bound`,
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_log_linear`.
   The shifted `log(n+1)` variant is compiled as well via
   `tendsto_log_nat_succ_div_atTop_nhds_zero`,
   `tendsto_const_add_mul_log_nat_succ_div_atTop_nhds_zero`,
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_log_succ_linear_bound`,
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_log_succ_linear`.
   The natural polynomial-count version
   `cardinality + 1 <= C eta * (n + 1) ^ d eta` is compiled through
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_nat_poly_bound`
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_nat_poly`.
   What remains for the full non-finite class route is the actual
   geometric/cardinality estimate in natural polynomial or shifted-log-linear
   form for the chosen empirical internal cover, trace image, VC/Sauer trace
   count, or maximal separated set.  The generic finite-code bridge
   `StatInference.EmpiricalProcess.TraceCoding` now reduces any injective
   coding of realized traces into a finite code set to a trace-image
   cardinality bound, with the polynomial real-cardinality handoff
   `empiricalTrace_image_card_add_one_real_le_of_finite_code_nat_poly`.
   The finite-threshold bridge `StatInference.EmpiricalProcess.ThresholdCoding`
   now packages threshold signatures, proves they are realized by the
   individual fixed-threshold binary trace families, and composes separation
   with the finite-code layer to obtain
   `empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card`.
   The follow-on handoff
   `empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_product_bound`
   converts any supplied product cardinality estimate into the exact real
   natural-polynomial trace-cardinality bound used by the Theorem 2.4.3
   entropy constructors.  The factorwise bridge
   `empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_factor_bound`
   now also converts per-threshold cardinality bounds plus a polynomial
   estimate on their product into the same theorem-facing shape.  The
   common-base specialization
   `empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_bound`
   reduces the product estimate to a bound on `base ^ thresholds.card`; the
   threshold-count version
   `empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_card_le`
   reduces it further to a supplied bound on `base ^ k` when
   `thresholds.card <= k`.  The base-growth theorem
   `empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_base_le_nat_poly`
   now proves that supplied bound from a polynomial estimate on `base`.  The
   uniform VC consumer
   `empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_uniform_vc`
   combines fixed-threshold Sauer bounds, separation, and a threshold-count
   bound into the natural-polynomial trace-cardinality estimate.  The
   pointwise-threshold bridge
   `thresholdTraceCode_eq_iff_forall_threshold_sample`,
   `thresholdTraceCode_separates_of_pointwise_thresholds_separate`, and
   `empiricalTrace_image_card_add_one_real_le_of_pointwise_thresholds_separate_uniform_vc`
   now lets later geometry prove only samplewise threshold predicate
   separation and then feed the same finite-image/product/uniform-VC
   cardinality consumers.  The coordinatewise bridge
   `pointwise_thresholds_separate_of_coordinate_thresholds_separate`,
   `thresholdTraceCode_separates_of_coordinate_thresholds_separate`, and
   `empiricalTrace_image_card_add_one_real_le_of_coordinate_thresholds_separate_uniform_vc`
   localizes this further to one sample coordinate: matching all threshold
   predicates at that coordinate must force equality of the two realized
   real values.  The exact value-membership route
   `coordinate_thresholds_separate_of_values_mem_thresholds` and
   `empiricalTrace_image_card_add_one_real_le_of_values_mem_thresholds_uniform_vc`
   closes the special case where the threshold set contains every realized
   coordinate value; this is intentionally stronger than the general
   continuum-valued textbook route.  The Theorem 2.4.3 package constructor
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_values_mem_thresholds_uniform_vc`
   now consumes that exact finite-value threshold route directly, defining the
   selected cardinality from the threshold-coded finite trace image and feeding
   the natural-polynomial threshold/VC bound into the fixed-radius tail/UI
   package.  The theorem-facing untruncated consumer
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_values_mem_thresholds_uniform_vc`
   now composes this package with the large-`M` untruncation layer, so the
   exact finite-value/discretized threshold route reaches centered untruncated
   convergence under its explicit structural and integrability hypotheses.
   The finite realized value-set bridge
   `empiricalTrace_image_card_add_one_real_le_of_sample_valueSet_finite_uniform_vc`
   and Theorem 2.4.3 constructor
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_sample_valueSet_finite_uniform_vc`
   now also choose the threshold finset as the finite set of values realized
   on the empirical sample, so later geometry can target value-set finiteness
   and cardinality directly.  The untruncated consumer
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_sample_valueSet_finite_uniform_vc`
   composes this value-set package with the large-`M` layer.
   The approximate finite-code empirical-cover primitives
   `nonempty_finiteEmpiricalL1CoverAtCard_of_finite_approx_code`,
   `empiricalL1CoveringNumber_le_of_finite_approx_code`, and their
   padded-cardinality variants are now available for the more faithful
   quantized-trace/grid route, where exact trace equality is too strong but
   equal codes give empirical `L1(P_n)` error at most the target radius.  The
   pointwise variant
   `empiricalL1CoveringNumber_le_of_finite_pointwise_approx_code_card_le`
   lets a grid proof supply coordinatewise absolute-error bounds directly.
   The coordinate-code layer
   `finite_coordinateCode_image`,
   `coordinateCode_image_toFinset_card_le_prod`, and
   `empiricalL1CoveringNumber_le_of_coordinate_pointwise_approx_code_card_le`
   now discharges the finite vector-code image and product-cardinality
   bookkeeping once each sample coordinate has a finite code set.  This route
   now also feeds the selected fixed-radius Theorem 2.4.3 side-condition
   package through
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_logCardinality_div_tendsto_bound`
   and its all-positive-`M` wrapper, and reaches untruncated centered
   convergence through
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_logCardinality_div_tendsto_bound`.
   The natural-polynomial structural-cardinality version is also compiled as
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
   its all-positive-`M` wrapper, and
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_nat_poly`.
   The
   scalar-quantizer bridge
   `empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_card_le`
   then builds this vector code by applying coordinate quantizers to the
   empirical sample values and reduces equal-code closeness to the scalar
   quantizer error condition.  The decoder-error variant
   `empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_decode_error_card_le`
   is now the intended grid interface: it is enough to prove every sampled
   value lies within `epsilon / 2` of its decoded representative.  The
   nearest-integer rounding bridge
   `empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_card_le`
   now instantiates this interface with `round (x / epsilon)` and decoder
   `epsilon * code`, leaving finite integer-code membership and cardinality
   as the next inputs.  The interval-code bridge
   `empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_interval_card_le`
   now discharges membership in finite integer intervals once coordinatewise
   lower/upper rounded-code bounds are supplied.  The bounded rounding-grid
   closure
   `empiricalL1CoveringNumber_le_of_roundingQuantizer_uniform_abs_bound_card_le`
   now derives those interval bounds from `|f(X_i)| <= M` and
   `M / epsilon + 1/2 <= B`, with terminal grid count `(2 * B + 1)^n`.  The
   remaining theorem-facing work is therefore not nearest-integer or finite
   product-code plumbing; it is the nontrivial VC/subgraph/grid cardinality
   estimate strong enough for the fixed-radius Theorem 2.4.3 side-condition
   package.  The approximate threshold-signature route is now compiled in
   `ThresholdCoding.lean`: if a finite threshold grid hits every gap wider than
   `epsilon`, then equal threshold signatures give coordinatewise
   `epsilon`-closeness, and
   `empiricalL1CoveringNumber_le_of_thresholdTraceCode_gap_grid_uniform_vc_card_le`
   combines that approximate-code bridge with fixed-threshold Sauer/VC bounds.
   The bounded truncated-value threshold grid is now instantiated by
   `integerMultipleThresholdGrid`,
   `exists_integerMultipleThresholdGrid_between_of_bounds`,
   `abs_sub_le_of_forall_bounded_gap_exists_threshold`, and
   `empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_uniform_vc_card_le`.
   This converts bounded sampled values and fixed-threshold VC bounds into the
   theorem-facing empirical covering-number estimate.
   The explicit integer-grid cardinality and envelope-friendly absolute-bound
   consumer are now compiled as `integerMultipleThresholdGrid_nat_card_le` and
   `empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_nat_uniform_abs_bound_vc_card_le`.
   `Theorem243.lean` now consumes this route through
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_abs_bound_vc`,
   after adding direct random-covering-number bridges from deterministic
   empirical-covering-number bounds.
   The untruncated theorem-facing consumer is now compiled as
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_abs_bound_vc`.
   The selected fixed-radius package now also has the envelope-bound constructor
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_bound_vc`,
   replacing sampled absolute boundedness by `abs_vdVWTruncatedClassFun_le_M`
   and the arithmetic condition `M <= bound * eta`.
   The canonical grid-radius choice is now compiled as
   `vdVWIntegerGridRadius`, with
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_vc`
   removing caller-supplied grid-radius arithmetic.
   The matching untruncated consumer
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_vc`
   is also compiled.  The next structural input is the reduction from
   textbook-facing VC-subgraph assumptions to the explicit per-threshold VC
   hypotheses.
   The first reduction layer is now compiled as
   `VdVWUniformThresholdVCSubgraphBound` plus
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_subgraph_vc`,
   which turns one uniform all-threshold empirical VC predicate into the
   canonical selected fixed-radius package.
   The matching untruncated consumer is now compiled as
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_subgraph_vc`.
   The lifted full-subgraph bridge is now compiled as
   `empiricalSubgraphTraceSetFamily`,
   `empiricalBinaryTraceSetFamily_thresholdIndicatorClassFun_eq_empiricalSubgraphTraceSetFamily`,
   `VdVWUniformSubgraphVCBound`,
   `VdVWUniformSubgraphVCBound.toUniformThresholdVCSubgraphBound`, and the
   package constructor
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`.
   The direct untruncated consumer from the lifted full-subgraph VC predicate is
   now compiled as
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`.
   The current compact assembly point is
   `VdVWTheorem243FullSubgraphSideConditions` with consumer
   `VdVWTheorem243FullSubgraphSideConditions.centered_untruncated_convergesInOuterProbabilityConst_zero`.
   The constructor
   `VdVWTheorem243FullSubgraphSideConditions.of_integrable` now discharges the
   truncated-function integrability field from ordinary class integrability and
   the centered truncated weighted-value-set boundedness field from the
   envelope/probability integral bounds; it also derives the centered
   measurable-cover field and the centered supremum integrability field from
   countability, coordinate measurability, and the centered truncation bound.
   The ghost-copy pair-difference supremum integrability field, the split
   product-copy pair-difference supremum integrability field, the ghost
   iterated-expectation integrability field, and the sample-side Rademacher
   supremum integrability field are also derived from countability, Fubini over
   product measures, and the uniform all-level truncation/pair-difference
   bounds.  The random-sign iterated-integral, product-space measurable-cover,
   product-space integrability, and sign-side supremum integrability fields are
   now also derived from countability, sub-Gaussian sign integrability,
   product-measure integrability/Fubini, and the countable product measurable
   cover constructor.  The theorem-facing wrapper
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_fullSubgraph_integrable`
   now consumes this constructor, so the full-subgraph route exposes only the
   structural VC route, envelope measurability/integrability hypotheses, and
   Rademacher sign hypotheses; ordinary class-member integrability is derived
   internally from envelope domination, coordinate measurability, and
   `Integrable envelope P` using `integrable_classFun_of_integrable_envelope`.
   The iid Rademacher and
   canonical terminal-sample wrappers now also remove the auxiliary sign-space
   and `X`/sample-path choices from this full-subgraph proof layer.
   The finite-class untruncated consumer and its iid/canonical wrappers also
   derive ordinary class-member integrability from the envelope, so that
   finite-class theorem-facing route exposes the same reduced analytic
   assumption profile.
   The selected fixed-radius tail/UI consumer and the integer-grid,
   finite-threshold, and full-subgraph bridge stack now share this reduction:
   caller-facing ordinary class-member integrability is derived internally
   from the envelope hypotheses.
   The proof-carrying `VdVWTheorem243FullSubgraphSideConditions` package no
   longer stores an `hclassIntegrable` field.
   The centered untruncated convergence layer now also has a variable
   finite-product GC-deviation bridge:
   `VdVWOuterProbabilityUniformDeviationConstOn` and
   `VdVWOuterProbabilityUniformDeviationConstOn_of_centered_weightedSupremum`.
   This is the bridge from the current centered weighted-supremum proof layer
   to the book's uniform-deviation conclusion shape over `SampleAt
   Observation n`; it is not yet the exact in-mean/a.s. textbook theorem.
   The bridge is now consumed by the full-subgraph and finite-class routes via
   `VdVWOuterProbabilityUniformDeviationConstOn_of_fullSubgraph_integrable`,
   `VdVWOuterProbabilityUniformDeviationConstOn_of_fullSubgraph_integrable_canonical`,
   and `VdVWOuterProbabilityUniformDeviationConstOn_of_finite_indexClass_canonical`.
   The supporting boundedness lemma
   `bddAbove_vdVWWeightedClassValueSet_centered_of_integrable_envelope` uses
   only the finite observed envelope values and `∫ envelope dP`, not a global
   bounded-envelope hypothesis.  The finite-product conclusion now also
   transfers to the fixed canonical iid sample space through
   `VdVWOuterProbabilityPGlivenkoCantelliClass_of_uniformDeviationConstOn_canonical`,
   consumed by
   `VdVWOuterProbabilityPGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical`
   and
   `VdVWOuterProbabilityPGlivenkoCantelliClass_of_finite_indexClass_canonical`.
   This uses the existing first-`n` coordinate law and mathlib
   `Measure.le_map_apply`, so no measurable-bad-event assumption is introduced.
   The outer-probability branch is now also consumed by the local book-style
   disjunction through `vdVWPGlivenkoCantelliClass_of_outerProbability`, and
   theorem-facing packages
   `VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_and_inMean_canonical`
   and
   `VdVWTheorem243_finite_indexClass_pGlivenkoCantelli_and_inMean_canonical`
   return both the canonical fixed-iid `VdVWPGlivenkoCantelliClass` conclusion
   and the current in-mean centered-supremum conclusion under their respective
   structural hypotheses.
   The same in-mean conclusion is now transported to the fixed infinite iid
   product space and the named Lemma 2.4.5 statistic via
   `integral_vdVWLemma245CenteredEmpiricalSupremum_eq`,
   `tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finiteProduct`,
   `tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_fullSubgraph_integrable_canonical`,
   and
   `tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finite_indexClass_canonical`.
   Its outer-probability zero-convergence analogue is also available on the
   fixed infinite iid product space through
   `VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finiteProduct`,
   `VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_fullSubgraph_integrable_canonical`,
   and
   `VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finite_indexClass_canonical`.
   The in-mean bridge has also started: the generic adapter
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_tailExpectation`
   and the full-subgraph consumer
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation`
   compile under explicit varying-domain tail/UI, measurability, and
   integrability inputs.  These side conditions must still be discharged or
   stated honestly in the final theorem layer.
   The countable-class/envelope part of those analytic inputs is now
   discharged by
   `vdVWWeightedClassSupremum_centered_le_sum_abs_mul_envelope_add_integral`,
   `measurable_vdVWWeightedClassSupremum_centered_of_countable`,
   `integrable_vdVWWeightedClassSupremum_centered_of_countable`, and
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable`.
   The iid and canonical wrappers
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable_iidRademacher`
   and
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable_canonical`
   also remove the auxiliary sign-space and sample-path process plumbing from
   this in-mean route.
   The remaining in-mean side condition is the genuine varying-domain
   tail/UI hypothesis for the centered supremum.  The deterministic bridge
   `vdVWWeightedClassSupremum_centered_invNat_le_empiricalAverage_envelope_add_integral`
   now reduces the positive-sample-size tail estimate to the empirical
   envelope average plus the population envelope mean; the next analytic
   target is to combine this domination with the compiled empirical-average
   tail/UI layer
   `empiricalAverage_envelope_tailExpectation_condition_of_integrable`.
   That combination is now compiled as
   `centered_vdVWWeightedClassSupremum_tailExpectation_condition_of_integrable_envelope`.
   The no-tail countable, iid-Rademacher, and canonical in-mean wrappers
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable`,
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable_iidRademacher`,
   and
   `integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable_canonical`
   mean that the countable/envelope full-subgraph in-mean route no longer
   exposes the centered-supremum tail/UI, auxiliary sign-space, or terminal
   sample-path choices to callers.
   The outer-probability and in-mean conclusions are now packaged together as
   `VdVWTheorem243_fullSubgraph_integrable_outerProbabilityUniformDeviation_and_inMean`
   and
   `VdVWTheorem243_fullSubgraph_integrable_outerProbabilityUniformDeviation_and_inMean_canonical`.
   These are theorem-facing assembly points under explicit full-subgraph
   structural assumptions, not exact textbook reports.
   For the almost-sure part, the pinned mathlib submartingale convergence
   theorem has been wrapped as
   `vdVW_submartingale_ae_tendsto_limitProcess_of_eLpNorm_bdd`.  This is only
   the forward martingale-convergence substrate; the exact Lemma 2.4.5 still
   needs the VdV&W reverse/permutation-symmetric filtration construction and
   adapted measurable-cover versions.  The product-coordinate exterior
   cofiltration substrate is now also wrapped as
   `vdVWExteriorCofiltration`, with display/monotonicity helpers
   `vdVWExteriorCofiltration_apply`, `vdVWExteriorCofiltration_le_pi`, and
   `vdVWExteriorCofiltration_antitone`, reusing mathlib
   `Filtration.cylinderEventsCompl`.  The finite-sample iid
   coordinate-permutation layer is now compiled as
   `vdVWFinCoordinatePermMeasurableEquiv`,
   `vdVWProductMeasure_measurePreserving_finCoordinatePerm`, and
   `integral_vdVWProductMeasure_comp_finCoordinatePerm`, reusing mathlib
   `MeasurableEquiv.piCongrLeft` and
   `MeasureTheory.measurePreserving_piCongrLeft`; the uniform empirical
   supremum is now permutation-invariant via
   `vdVWWeightedClassSupremum_uniform_finCoordinatePerm`.  The infinite
   first-`n` generator bridge is now compiled as
   `VdVWFirstNPermutationSymmetric` and
   `vdVWFirstNPermutationSymmetric_uniformClassSupremum`.  The generated
   permutation-symmetric sigma-field substrate is also compiled as
   `VdVWPermutationSymmetricGeneratorSet`,
   `vdVWPermutationSymmetricMeasurableSpace`,
   `vdVWPermutationSymmetricMeasurableSpace_antitone`, and
   `measurable_vdVWPermutationSymmetricMeasurableSpace_of_symmetric`, with
   the direct infinite-permutation empirical-supremum bridge
   `VdVWPermutationSymmetricFrom_uniformClassSupremum`.  The first adapted
   countable empirical-supremum bridge is compiled as
   `measurable_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`,
   and its Chapter 1.2 cover-shaped counterpart is compiled as
   `VdVWMeasurableCover_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`.
   The decreasing `Σ_n` family is now packaged as
   `vdVWPermutationSymmetricCofiltration : Filtration ℕᵒᵈ ...`, with
   `adapted_vdVWPermutationSymmetricCofiltration_uniformClassSupremum_of_countable`
   proving the countable uniform empirical supremum process adapted to that
   cofiltration.
   The ordinary-filtration conditional-expectation handoff is also now
   compiled under VdV&W-local names:
   `vdVW_condExp_submartingale`,
   `vdVW_condExp_uniformIntegrable_filtration`,
   `vdVW_condExp_ae_tendsto_limitProcess_of_integrable`,
   `vdVW_condExp_tendsto_eLpNorm_one_limitProcess_of_integrable`,
   `vdVW_condExp_ae_tendsto_condExp_iSup`,
   `vdVW_condExp_tendsto_eLpNorm_one_condExp_iSup`, and
   `vdVW_condExp_ae_tendsto_limitProcess_of_eLpNorm_le`.  These wrappers
   reuse pinned mathlib conditional-expectation martingale, UI, L1 contraction,
   martingale-convergence, and Levy upward-convergence APIs.
   If the remaining quantitative structural estimate
   cannot be proved from the textbook assumptions, state the exact additional
   theorem-level side condition honestly.  For Lemma 2.4.5, the next exact
   primitive is now the VdV&W-specific reverse/permutation-symmetric comparison
   that reindexes or compares the decreasing `Σ_n` empirical-supremum covers
   to this ordinary conditional-expectation martingale framework, plus the
   terminal integrability/L1-bound discharge from the envelope hypotheses.  The
   first finite-to-infinite iid sample transport is also compiled:
   `vdVWInfiniteProductMeasure_measurePreserving_firstNSample`,
   `vdVWFirstNSample_hasLaw_vdVWProductMeasure`,
   `integral_vdVWInfiniteProductMeasure_firstNSample`, and the truncated and
   untruncated infinite-product integrability, integral, and `L^p` seminorm
   lifts for countable centered empirical suprema.  Thus the next work should
   not redo first-coordinate law/integrability/integral/seminorm transport,
   and should instead prove the structural
   reverse/permutation-symmetric comparison itself.  The deterministic
   leave-one-out algebra and sample-path inequality are also compiled as
   `sum_leaveOneOut_eq_nat_mul_sum`,
   `vdVWWeightedSampleSum_uniform_leaveOneOut_average_eq`, and
   `vdVWWeightedClassSupremum_uniform_le_leaveOneOutAverage`; the next
   Lemma 2.4.5 step is the conditional-expectation symmetry of the
   leave-one-out terms given `Σ_{n+1}` and the resulting reverse-submartingale
   comparison.  The generic conditional-expectation comparison and finite
   average symmetry reduction are now compiled as
   `vdVW_condExp_comparison_of_ae_le_of_condExp_eq`,
   `vdVW_condExp_uniformAverage_eq_of_finite_condExp_symmetry`, and
   `vdVW_condExp_reverseComparison_of_ae_le_uniformAverage`; the remaining
   exact task is the VdV&W-specific conditional symmetry theorem for the
   leave-one-out terms under `Σ_{n+1}`, not the finite permutation,
   generated-sigma, countable-supremum adaptedness, cover-shaped adaptedness,
   cofiltration substrate, ordinary conditional expectation convergence
   substrate, or generic conditional-expectation algebra.  The generated-sigma
   invariant-set and infinite-product measure-preserving ingredients are now
   compiled as
   `preimage_vdVWPermuteNatSequence_eq_of_measurableSet_permutationSymmetric`,
   `measurable_vdVWPermuteNatSequence_permutationSymmetric`, and
   `vdVWInfiniteProductMeasure_measurePreserving_permuteNatSequence`; the next
   patch should use these with set-integral/conditional-expectation uniqueness
   to prove the leave-one-out conditional symmetry itself.  The set-integral
   and conditional-expectation invariance bridges are also now compiled as
   `setIntegral_vdVWInfiniteProductMeasure_comp_permuteNatSequence_of_measurableSet_permutationSymmetric`,
   `vdVW_condExp_eq_of_forall_setIntegral_eq`, and
   `vdVW_condExp_comp_permuteNatSequence_eq_of_permutationSymmetric`; the
   remaining patch should prove the deterministic leave-one-out transport
   identifying each omitted term as a tail-fixing permutation of a distinguished
   omitted term, then instantiate the reverse-comparison bridge.
   That transport and instantiation are now compiled as
   `vdVWLeaveOneOutToLastPerm`,
   `removeNth_last_vdVWFinCoordinatePerm_leaveOneOutToLastPerm`,
   `vdVWNatPermOfFin`, `VdVWNatPermFixesFrom_natPermOfFin`,
   `vdVWFirstNSample_permuteNatSequence_natPermOfFin`,
   `vdVWWeightedClassSupremum_leaveOneOut_last_comp_natPermOfFin_eq`,
   `vdVW_condExp_leaveOneOut_uniformClassSupremum_eq_last`, and
   `vdVW_condExp_reverseComparison_uniformClassSupremum_le_lastLeaveOneOut`.
   The remaining Lemma 2.4.5 task is to instantiate this comparison for the
   measurable-cover empirical supremum process, prove the required
   integrability/L1-boundedness inputs, and connect it to the
   reverse-submartingale convergence reduction.
   The countable integrable-envelope instantiation is now compiled as
   `vdVW_condExp_reverseComparison_centered_uniformClassSupremum_le_lastLeaveOneOut_of_countable`,
   discharging strong measurability, integrability of all leave-one-out terms,
   and bounded-value-set hypotheses for centered empirical suprema.  The
   remaining Lemma 2.4.5 task is now the final reverse-submartingale
   convergence reduction and its uniform L1/eLpNorm bound.
   The uniform bound and row-comparison adapter are now compiled as
   `integral_vdVWWeightedClassSupremum_centered_invNat_le_two_integral_envelope`,
   `integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_invNat_le_two_integral_envelope`,
   `eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_invNat_le_two_integral_envelope`,
   and `vdVW_condExp_comparison_and_ae_tendsto_limitProcess_of_eLpNorm_le`.
   The theorem-specific row consumer
   `vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_of_countable`
   now also compiles, combining the centered leave-one-out comparison, the
   envelope `eLpNorm` bound, and the conditional-expectation convergence
   adapter for each positive row.
   The all-positive-row full-measure packaging
   `vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_allRows_of_countable`
   is also compiled.  It keeps filtrations row-indexed, avoiding an invalid
   increasing-filtration encoding of the decreasing `Σ_n` family.
   The remaining Lemma 2.4.5 task is therefore narrowed to the actual
   reverse-filtration convergence reduction for the decreasing
   permutation-symmetric `Σ_n` cofiltration, or an honest reindexing into a
   mathlib-compatible increasing filtration.
   The theorem-facing consumer
   `vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseCofiltrationHandoff`
   now compiles as well, so the final local class/envelope/measurability
   plumbing is closed once that reverse/cofiltration convergence primitive is
   available.
   The preferred follow-up shape is now even sharper:
   `vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseComparisonHandoff`
   consumes only the all-row reverse comparisons over the actual
   permutation-symmetric fields `Σ_{n+1}`.  The remaining primitive should
   prove the reverse/cofiltration convergence from those comparisons, not add
   more ordinary-row filtration wrappers.
   The full-subgraph endpoint now also has the direct theorem-facing package
   `VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_reverseComparisonHandoff`,
   which combines the compiled `P`-GC branch, in-mean branch, and this
   row-wise Lemma 2.4.5 handoff.  Natural-filtration drift packages are only
   sufficient-condition adapters; they should not displace the row-wise
   reverse/cofiltration theorem as the active textbook target.
   The ordinary martingale fallback now also has an opposite-sign
   supermartingale route via
   `vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_of_supermartingale`,
   `VdVWLemma245ReverseCofiltrationHandoff.of_supermartingale`, and
   `VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_supermartingale`.
   This is a flexibility layer for the eventual reindexing proof, not a
   replacement for the missing reverse/cofiltration convergence theorem.
   The matching constructor-level supermartingale drift package is also
   compiled as `VdVWLemma245ReverseCofiltrationHandoff.of_condExp_step_nonpos`
   and
   `VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_condExp_step_nonpos`,
   reusing mathlib `supermartingale_of_condExp_sub_nonneg_nat`.
   On the Theorem 2.4.3 convergence side, the finite-class canonical route now
   also packages both current conclusions as
   `VdVWTheorem243_finite_indexClass_outerProbabilityUniformDeviation_and_inMean_canonical`;
   exact a.s. completion still depends on Lemma 2.4.5.
   The variable-domain random-entropy branch now also has the direct
   proof-carrying consumer
   `VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_tailExpectation`,
   which composes the book-shaped entropy package with explicit selected
   finite-net integrability and tail-expectation hypotheses.  This is a
   theorem-facing bridge, not the missing analytic theorem: the next
   Chapter 2.4.3 target is to derive those selected finite-net tail/UI inputs
   from the textbook random entropy condition, or from a genuine structural
   entropy/VC bound, without hiding the assumption as deterministic
   boundedness.
   The first analytic reduction for that target is now compiled:
   `vdVWTheorem243FiniteNetHoeffdingUpper_le_six_mul_M_mul_one_add_logCardinality_div`,
   `vdVWTheorem243FiniteNetHoeffdingUpper_tail_subset_logCardinality_div_tail`,
   and
   `vdVWTheorem243FiniteNetHoeffdingUpper_tail_indicator_le_logCardinality_div_tail_indicator`.
   The integrated theorem
   `finiteNetHoeffdingUpper_tailExpectation_condition_of_logCardinality_div_tailExpectation`
   and selected-package constructor
   `VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_tailExpectation`
   now turn explicit normalized-log affine tail/UI into the finite-net
   Hoeffding tail/UI field needed by the selected fixed-radius Theorem 2.4.3
   route.  The next proof should determine whether the textbook random entropy
   condition supplies that normalized-log tail/UI and integrability, or whether
   a genuine varying-domain uniform-integrability primitive or structural
   entropy bound is missing.
4. Defer exact example closures by default.  The Example 2.4.2 endpoint-grid
   and CDF/Stieltjes layers remain available if a theorem needs them, but the
   main line now moves directly to Theorem 2.4.3 and its Chapter 2
   bracketing/measurable-class prerequisites.
5. Formalize Sections 2.2-2.3 inequalities and symmetrization before using
   them for later entropy/Donsker results.
6. Formalize VC/entropy Sections 2.5-2.8 using mathlib shattering foundations
   plus local empirical-process definitions.
7. Formalize multiplier, permanence, bracketing CLT, functional Donsker, and
   maximal inequality sections 2.9-2.14.

2026-05-05 `ell_infty(T)` foundation update: the first VdV&W-named bounded
process-space substrate is now compiled.  `EllInfty.lean` wraps mathlib
`lp (fun _ : T => ℝ) ∞` as `VdVWEllInfty T`, proves the bounded-function
constructor, coordinate norm/supremum-norm wrappers, continuous coordinate
evaluation, bounded sample-path process map, and finite-dimensional coordinate
restriction.  `FiniteDimensional.lean` now adds the forward FDD
weak-convergence wrapper for laws on `ell_infty(T)`, plus the corresponding
`HasLaw`, `IdentDistrib`, and varying-domain `TendstoInDistribution` finite
restriction wrappers.  This should be treated as the base substrate for later
VdV&W process statements, not as a proof of separability, asymptotic
tightness, Donsker, or the FDD converse.

2026-05-06 finite-coordinate raw-process measurability follow-up:
`EllInfty.lean` now adds
`VdVWEllInfty.measurable_finiteRestrict_processMap` and
`VdVWEllInfty.aemeasurable_finiteRestrict_processMap`, which turn coordinate
measurability/a.e.-measurability of a raw bounded sample-path process into
measurability/a.e.-measurability of each finite-dimensional restriction.  This
is deliberately finite-dimensional and does not assert full `ell_infty(T)`
process measurability.

2026-05-05 finite-index `ell_infty(T)` follow-up: the finite-index process
space is now explicitly identified with the ordinary product through
`VdVWEllInfty.finiteContinuousLinearEquiv`.  This reuses mathlib's
`lpPiLpₗᵢ` and `PiLp.continuousLinearEquiv` and should be used for any
finite-index FDD-converse sanity layer before attempting the arbitrary-index
separability/tightness theorem.

2026-05-05 finite-index FDD-converse follow-up: that sanity layer is now
compiled.  `FiniteDimensional.lean` proves cancellation of the finite product
equivalence on `ProbabilityMeasure (VdVWEllInfty T)`, the finite-index
weak-convergence converse
`vdVW148_ellInfty_weakConvergence_of_finiteProduct_weakConvergence_finite`,
and the random-variable distribution-convergence converse
`vdVW148_ellInfty_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`.
This closes only the finite-index case.  The arbitrary-index VdV&W 1.4.8
criterion still depends on separability, tightness, asymptotic measurability,
and nonmeasurable/process primitives.

2026-05-05 Portmanteau converse follow-up: the ordinary measure-level
Portmanteau layer now includes the continuity-set implication and closed/open
converses in VdV&W-local names.  `WeakConvergence.lean` exposes
`VdVWWeakConvergenceProbabilityMeasures.tendsto_measure_of_null_frontier`,
`vdVWWeakConvergenceProbabilityMeasures_of_forall_isClosed_limsup_measure_le`,
and
`vdVWWeakConvergenceProbabilityMeasures_of_forall_isOpen_measure_le_liminf`,
reusing pinned mathlib Portmanteau APIs and the Billingsley/ProbabilityMeasure
search result.  This is still the ordinary probability-measure statement; the
arbitrary-map/nonmeasurable outer-probability Portmanteau layer remains a
separate Chapter 1 primitive.

2026-05-05 norm-tail tightness follow-up: `WeakConvergence.lean` now also
wraps mathlib's normed-space tightness characterization for the local
`VdVWProbabilityMeasuresTight` predicate.  The new declarations
`VdVWProbabilityMeasuresTight.tendsto_norm_tail`,
`vdVWProbabilityMeasuresTight_of_tendsto_norm_tail`, and
`vdVWProbabilityMeasuresTight_iff_tendsto_norm_tail` connect tightness of
probability-measure families on normed/proper normed spaces with uniformly
vanishing norm tails.  This supports Chapter 1 tightness and later
finite-dimensional/Hilbert process routes without claiming arbitrary-map
asymptotic tightness.

2026-05-05 π-system/product-test follow-up: the Chapter 1 product and
convergence-determining foundations now include a VdVW-local π-system weak-
convergence criterion and VdV&W 1.4.2 product bounded-continuous test
uniqueness.  `WeakConvergence.lean` adds
`vdVWWeakConvergenceProbabilityMeasures_of_piSystem_tendsto`; `FiniteDimensional.lean`
adds `vdVW142_prod_measure_ext_of_forall_boundedContinuous_integral_mul` and
`vdVW142_prod_measure_eq_prod_of_forall_boundedContinuous_integral_mul`, both
backed by pinned mathlib product-measure extensionality.  These are
measure-level foundations for product/FDD work and should not be confused with
the still-pending arbitrary-index VdV&W 1.4.8 process weak-convergence
criterion.

2026-05-05 independent product-law follow-up: `WeakConvergence.lean` now adds
`vdVWTendstoInDistribution_prodMk_laws_of_indepFun`, the measurable
random-variable form of the VdV&W 1.4.6 independent-coordinate product
principle.  It combines marginal convergence in distribution with finite-stage
independence to get weak convergence of the joint laws to the product of the
two limiting laws.  The nonmeasurable arbitrary-map/asymptotic-independence
version remains a deeper Chapter 1 primitive.

2026-05-05 raw bounded-process FDD follow-up: the VdV&W 1.4.8 forward FDD
substrate now includes raw bounded sample-path processes, not only already
packaged `ell_infty(T)` random elements.  `EllInfty.lean` exposes
`VdVWEllInfty.finiteRestrict_processMap_apply`, while
`FiniteDimensional.lean` adds the raw-process law, identical-distribution, and
convergence-in-distribution wrappers
`vdVW148_boundedProcess_finiteDimensional_hasLaw`,
`vdVW148_boundedProcess_finiteDimensional_identDistrib`, and
`vdVW148_boundedProcess_finiteDimensional_tendstoInDistribution`.  This closes
the forward raw-process bridge and leaves the exact arbitrary-index FDD
converse, separability, asymptotic tightness, and nonmeasurable arbitrary-map
weak-convergence primitives as the real Chapter 1 blockers.

2026-05-05 finite-index raw-process converse follow-up: the finite-index
VdV&W 1.4.8 converse now also has a raw bounded-process entry point.
`EllInfty.lean` adds
`VdVWEllInfty.finiteContinuousLinearEquiv_processMap_apply`, and
`FiniteDimensional.lean` adds
`vdVW148_boundedProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`.
For finite `T`, ordinary finite-product convergence in distribution of raw
bounded processes now feeds convergence of their `ell_infty(T)` process maps.
This is still a finite-index theorem and does not close the arbitrary-index
separability/tightness/asymptotic-measurability converse.

2026-05-05 finite-index raw-process law follow-up: `FiniteDimensional.lean`
now also adds
`vdVW148_boundedProcess_hasLaw_of_finiteProduct_hasLaw_finite` and
`vdVW148_boundedProcess_identDistrib_of_finiteProduct_identDistrib_finite`.
These lift finite-product `HasLaw` and `IdentDistrib` statements for raw
bounded processes to their `ell_infty(T)` process maps by composing with the
finite continuous linear equivalence inverse.  This closes the finite-index
raw law/identical-distribution bridge, while leaving the arbitrary-index
VdV&W 1.4.8 converse as a genuine process primitive.

2026-05-05 finite-product law weak-convergence follow-up:
`FiniteDimensional.lean` now adds the direct finite-index measure-level
wrapper
`vdVW148_ellInfty_map_symm_weakConvergence_of_finiteProduct_weakConvergence_finite`.
Weak convergence of probability measures on the ordinary finite product
`T -> ℝ` now pushes back to weak convergence of the associated
`ell_infty(T)` laws through the finite continuous linear equivalence inverse.
This is a finite-index feeder, not the arbitrary-index FDD criterion.

2026-05-05 measure-level asymptotic tightness follow-up:
`WeakConvergence.lean` now exposes
`VdVWProbabilityMeasuresAsymptoticallyTight`, plus the basic feeders from a
tight ambient family/range and continuous-map stability.  These declarations
give Chapter 1 a named ordinary probability-measure asymptotic-tightness
foundation.  The exact VdV&W arbitrary-map and nonmeasurable process
asymptotic-tightness statements remain future primitives.

2026-05-05 finite-dimensional asymptotic-tightness follow-up:
`WeakConvergence.lean` now exposes
`VdVWProbabilityMeasuresAsymptoticallyTight.finiteDimensionalRestrict`.
`FiniteDimensional.lean` adds the `ell_infty(T)` finite-coordinate and
finite-index pushback wrappers
`vdVW148_ellInfty_finiteDimensional_asymptoticallyTight_of_processLaw_asymptoticallyTight`,
`vdVW148_ellInfty_asymptoticallyTight_of_finiteProduct_asymptoticallyTight_finite`,
and
`vdVW148_ellInfty_map_symm_asymptoticallyTight_of_finiteProduct_asymptoticallyTight_finite`.
This closes the ordinary finite-dimensional asymptotic-tightness feeder for
the Chapter 1 process/FDD route.  The arbitrary-index VdV&W 1.4.8 converse
still needs separability, process asymptotic tightness, and nonmeasurable
arbitrary-map weak-convergence primitives.

2026-05-05 product asymptotic-tightness follow-up:
`WeakConvergence.lean` now adds
`VdVWProbabilityMeasuresAsymptoticallyTight.prod`, using compact product sets
and product-measure complement bounds to show that binary product laws preserve
ordinary measure-level asymptotic tightness.  This supports the Chapter 1
product/FDD route but remains separate from the exact VdV&W
arbitrary-map/asymptotic-independence theorem.

2026-05-05 asymptotic-tightness filter-stability follow-up:
`WeakConvergence.lean` now adds
`VdVWProbabilityMeasuresAsymptoticallyTight.mono_filter` and
`VdVWProbabilityMeasuresAsymptoticallyTight.congr_eventually`, matching the
filter-refinement style already available for weak convergence and local
asymptotic-measurability predicates.  These are support lemmas for Chapter 1
subsequence/reindexing process arguments, not the full arbitrary-map process
asymptotic-tightness theorem.

2026-05-05 asymptotic-tightness reindexing follow-up:
`WeakConvergence.lean` now adds
`VdVWProbabilityMeasuresAsymptoticallyTight.comp_tendsto`, the ordinary
net/subsequence handoff for reindexed probability-measure families.  This
rounds out the measure-level filter-stability layer while preserving the
remaining arbitrary-map/process blockers.

2026-05-05 weak-convergence-to-tightness follow-up:
`WeakConvergence.lean` now adds
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_atTop`, using
compactness of a convergent sequence plus mathlib's Prokhorov tightness
theorem to turn sequential weak convergence into ordinary measure-level
asymptotic tightness on complete second-countable pseudo-metric Borel spaces.
This supports the Chapter 1 Prokhorov/tightness route but remains separate
from stochastic-process asymptotic tightness for arbitrary maps.

2026-05-05 weak-convergence tightness reindex/product follow-up:
`WeakConvergence.lean` now adds
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_comp_tendsto_atTop`
and `VdVWWeakConvergenceProbabilityMeasures.pi_asymptoticallyTight_atTop`.
The first turns sequential weak convergence into ordinary asymptotic
tightness after any reindexing map tending to `atTop`; the second turns
finite-coordinate weak convergence into ordinary asymptotic tightness of the
finite product laws by reusing `VdVWWeakConvergenceProbabilityMeasures.pi`.
This closes a finite-product FDD/tightness feeder without claiming the
arbitrary-index VdV&W FDD converse or arbitrary-map process asymptotic
tightness theorem.

2026-05-05 `/goal` target refresh:
`Theorem243.lean` now includes the probability-level fixed-radius chooser
`exists_pos_radius_eventually_outerProbability_add_const_le_of_forall_convergesInOuterProbabilityConst`.
This keeps the active goal aligned with the exact textbook route: use the
already proved stochastic entropy convergence in outer probability if a
centered-truncated finite-net comparison can be proved at probability level,
instead of repeatedly wrapping the older mean/tail/UI route.  The next
Theorem 2.4.3 work should therefore either prove that probability-level
finite-net comparison, prove a structural selected-cover cardinality/tail
condition from the book assumptions, or move to the Chapter 1 arbitrary-map and
outer-cover primitives needed by the exact statements.

2026-05-05 probability finite-net handoff:
`Theorem243.lean` now adds the fixed-radius pure outer-probability handoff
`VdVWConvergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_add_bound`
and the theorem-facing fixed-`M` consumers ending in
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_finiteNetHoeffdingUpper`.
The blueprint target is now sharper: prove the event comparison between the
centered truncated supremum and `finiteNetHoeffdingUpper + eta` at fixed radius,
or prove a structural selected-cover theorem that supplies one of the existing
honest side-condition routes.

2026-05-05 pointwise finite-net comparison endpoint:
`Theorem243.lean` now records the corresponding pointwise sufficient condition
as
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_pointwise_finiteNetHoeffdingUpper`.
This supports structural finite-code/trace/VC proof routes while preserving the
general arbitrary-class blocker as the weaker probability-level event
comparison.

2026-05-05 untruncated pointwise route:
`Theorem243.lean` now adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_pointwise_finiteNetHoeffdingUpper`,
so a structural proof of fixed-radius pointwise finite-net control at all
positive truncation levels now reaches the untruncated centered convergence
statement directly.

## Automation Checklist

Every heartbeat or continuation run for this blueprint should:

1. inspect git status, recent declarations, reports, and this blueprint;
2. identify the next pending item by priority, not only by file locality;
3. search pinned mathlib before introducing a primitive;
4. implement one concrete Lean proof step or document a precise blocker;
5. run the smallest relevant `lake env lean ...` check after Lean edits;
6. run `lake build` after substantive promoted theorem edits;
7. scan tracked Lean sources for `sorry`, `admit`, `axiom`, and `unsafe`;
8. create or update a theorem report only when an exact textbook theorem or
   lemma is fully proved; otherwise update blueprint/status docs only;
9. keep credentials out of Git; treat generated report PDFs as local-only
   artifacts while allowing the requested textbook source anchors under
   `Textbooks/Vaart1996/`.
