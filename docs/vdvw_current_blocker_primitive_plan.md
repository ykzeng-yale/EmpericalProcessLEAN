# VdV&W Current Blocker Primitive Plan

Status date: 2026-05-06.

This file pins down the active blocker and the primitive Lean declarations
needed to close it.  It is not a theorem report.  A formal report is created
only after the exact textbook item is fully proved with no proof holes.

## Mandatory Search-First Gate

Every proof or formalization step must search before introducing a local
definition, primitive lemma, theorem wrapper, or proof-carrying structure.  The
search is part of the proof work, not optional bookkeeping.

Minimum search scope for each new target:

1. local project declarations under `StatInference`;
2. pinned mathlib under `.lake/packages/mathlib/Mathlib`;
3. relevant pinned Lake support packages under `.lake/packages`;
4. recorded local open-source Lean checkouts listed near the end of this file
   when the topic is measure theory, probability, weak convergence, empirical
   processes, or asymptotic statistics.

The run must record the useful search results in this blocker register,
blueprint, dashboard, or theorem report before committing if the search affects
the design.  The record should include searched names/patterns, reusable APIs
found, APIs not found when absence creates a blocker, and why a new local
primitive is still needed.  A theorem should be marked `blocked-vdvw` only
after this search fails to find a reusable exact or adaptable Lean theorem.

## Adaptive Automation Prompt Rule

Every recurring proof run should finish by checking whether the automation
prompt itself is now stale.  If the run verified new Lean declarations, pushed
a commit, narrowed a blocker, or changed the next atomic proof target, update
the automation prompt to match this file and the dashboard before ending the
run.  The refreshed prompt should name the latest verified commit, the exact
closed declarations or blocker refinement, the next proof target, and the
verification/search gates.  This keeps future runs aligned with the current
proof state instead of replaying old instructions.

Do not update the automation prompt for wording-only churn.  Do update it when
an old prompt would point at a solved target, omit a newly discovered reusable
API, or hide a genuine blocker such as the current Theorem 2.4.3
random-entropy/tail-UI mismatch or the Chapter 1 arbitrary-map/process
converse and measurability primitives.

## Active Blocker

Current main-line target: finish VdV&W Chapters 1-2 by dependency order, using
the already compiled Theorem 2.4.3 endpoint infrastructure and Chapter 1
measure-level wrappers instead of rebuilding them.  The finite-index
`ell_infty(T)`/FDD converse, Portmanteau converse, norm-tail tightness,
π-system convergence-determining, VdV&W 1.4.2 product-test uniqueness, and
measurable independent-product law convergence layers are now compiled, and
measure-level weak convergence has target/source congruence via
`VdVWWeakConvergenceProbabilityMeasures.congr_limit` and
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually_limit`.  The
highest-value remaining Chapter 1 process blockers are the arbitrary-index
VdV&W 1.4.8 converse, separability/tightness/asymptotic-measurability
interfaces, and the nonmeasurable outer-cover signed weak-convergence layer.
The highest-value Theorem 2.4.3 blocker remains the genuine book
random-entropy mismatch: deriving a tail/UI, ordinary-mean, or deterministic
structural cardinality input from
`log N(η, F_M, L1(P_n)) = o_P^*(n)` for fixed positive `η`.  Do not reopen the
closed Theorem 2.4.3 finite-net/Hoeffding/Mills/untruncation/
reverse-cofiltration, full-subgraph, measurable/null-measurable signed
weak-convergence, asymptotic-measurability, or Dirac-law endpoint packages
unless a new exact statement directly consumes them.

## Current `/goal` Target

Authoritative `/goal` rebase, 2026-05-06 after the finite-index 1.4.8
weak-convergence/tightness iff wrappers: local `main` should be kept synced
with `origin/main`, and the active Codex goal object remains a broad
orchestration label because it cannot be edited in place.  Use this paragraph,
not older rebase paragraphs below, as the operative continuation prompt.

Current closed support is much stronger than the older finite-code target
paragraphs indicate.  Theorem 2.4.3 now has proof-hole-free endpoint
infrastructure for selected fixed-radius tail/UI, finite code-set and
natural-polynomial code-set routes, threshold/grid/finite-trace/full-subgraph
VC routes, canonical iid sample-process specializations, finite-class SLLN
endpoints, full-subgraph `P`-GC plus in-mean packages, and Lemma 2.4.5
reverse/cofiltration consumers.  Chapter 1 support also includes measure-level
weak-convergence/tightness/product/FDD wrappers, finite-index
`ell_infty(T)` weak-convergence/tightness iff wrappers, raw bounded
`ell_infty(T)` process-law forward FDD/tightness wrappers,
finite-FDD/raw-coordinate replacement and atTop tightness consumers,
source/target/reindexing congruence, and centered separability-to-`P`-
measurability bridges.

The exact textbook Theorem 2.4.3 is not yet closed because the book assumes the
generic random entropy condition
`log N(epsilon, F_M, L1(P_n)) = o_P^*(n)` for each fixed positive
`epsilon, M` and concludes outer-probability/outer-a.s./in-mean GC.  The
compiled structural routes prove strong theorem-facing corollaries under
finite-class, full-subgraph VC, threshold-grid, finite-trace, quantizer, or
explicit tail/UI hypotheses, but they do not prove that bare outer-probability
random-entropy convergence supplies the selected finite-net tail/UI or
ordinary-mean/uniform-integrability side condition.  Do not add more aliases
around already closed endpoint packages unless an exact textbook statement
immediately consumes them.

Next high-capacity `/goal` batch should do one of the following, in order:
(1) prove the genuine random empirical-entropy event/tail/UI or ordinary-mean
bridge from assumptions strong enough to imply it, clearly separating what
follows from the textbook `o_P^*(n)` condition and what requires an extra
uniform-integrability/tail hypothesis; (2) align and state the strongest
current full-subgraph or finite-class route as an exact theorem-facing
corollary only if the textbook item/corollary statement really matches those
structural hypotheses; (3) attack a real Chapter 1 blocker: arbitrary-index
VdV&W 1.4.8 FDD converse, process separability/tightness/asymptotic-
measurability, nonmeasurable signed outer-cover weak convergence, or full
arbitrary-map extended-real measurable-cover existence.  If a lane blocks,
record searched APIs, the failing theorem shape, and the next patchable edit
before switching lanes.

2026-05-06 explicit tail/UI endpoint closure: search found existing centered
untruncated convergence routes, `P`-GC projection, and in-mean envelope
adapters, but no generic theorem bundling the endpoint conclusions and no
direct endpoint theorem for the explicit selected finite-net tail/UI route.
`Theorem243.lean` now proves
`VdVWTheorem243_pGlivenkoCantelli_and_inMean_of_centered_untruncated_convergesInOuterProbabilityConst_zero`
and
`VdVWTheorem243_variableEntropy_tailExpectation_pGlivenkoCantelli_and_inMean`.
This closes the theorem-facing endpoint for the honest extra-tail/UI route.
It still does not prove that the bare textbook outer-probability random
entropy assumption supplies selected tail/UI or ordinary-mean/UI.

2026-05-06 selected fixed-radius endpoint consumer: after checking that no
central `P`-GC plus in-mean consumer existed for
`VdVWTheorem243SelectedFixedRadiusTailSideConditions`, `Theorem243.lean` now
proves `VdVWTheorem243_selectedFixedRadiusTail_pGlivenkoCantelli_and_inMean`.
This is the canonical endpoint for the selected fixed-radius route: future
Theorem 2.4.3 work should prove the selected side-condition package from a
real entropy/tail/UI source, then consume this theorem directly.  Do not add
more endpoint aliases unless an exact textbook corollary immediately needs a
different statement shape.

2026-05-06 finite-net-upper mean source bridge: search found generic
`tailExpectation_condition_of_integral_tendsto_zero_nonneg` and the selected
fixed-radius package, but no constructor taking ordinary mean convergence of
the selected finite-net Hoeffding upper directly.  `Theorem243.lean` now proves
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_finiteNetUpper_integral_tendsto_zero`.
This is a genuine source-side bridge: variable entropy plus finite-net upper
integrability and mean convergence supplies the selected tail/UI package.  It
still leaves the exact textbook issue unchanged: bare outer-probability
random entropy must be strengthened by, or proved to imply, this ordinary-mean
input or another valid tail/UI source.

2026-05-06 ordinary-mean outer-probability bridges: local search found
`tailExpectation_condition_of_integral_tendsto_zero_nonneg` and the
outer-expectation Markov bridges, but no direct common-domain or
varying-domain theorem from ordinary nonnegative means to VdV&W
outer-probability convergence.  Search in mathlib confirmed the reusable
continuity API `ENNReal.tendsto_ofReal`; the existing local cover equality
`VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg` supplies
the remaining bridge.  `OuterProbabilityExpectation.lean` now proves
`VdVWConvergesInOuterProbability_zero_of_integral_tendsto_zero_nonneg` and
`VdVWConvergesInOuterProbabilityConst_zero_of_integral_tendsto_zero_nonneg`.
These are useful for fixed-space and finite-net mean routes and avoid
repeating the measurable cover/Markov argument, but they still do not prove the
missing textbook random-entropy-to-tail/UI or random-entropy-to-mean
implication.

2026-05-06 finite-net mean-to-probability consumer: after the ordinary-mean
outer-probability bridges were added, local search found fixed-radius
Theorem 2.4.3 consumers from finite-net integrals and from finite-net
outer-probability convergence, but no named theorem converting the random
finite-net Hoeffding upper's ordinary mean convergence into its own
outer-probability convergence.  `Theorem243.lean` now proves
`finiteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_integral_tendsto_zero`,
using the new varying-domain mean bridge and
`vdVWTheorem243FiniteNetHoeffdingUpper_nonneg`.  This connects the mean route
to the pure probability finite-net comparison route.  The remaining exact
source problem is still upstream: prove the finite-net mean/tail/UI input from
the book random-entropy hypothesis, or state the extra UI/structural
assumption honestly.

2026-05-06 finite-net mean plus event-comparison consumer: local search found
the fixed-`M` pure outer-probability event-comparison route
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_finiteNetHoeffdingUpper`
and the finite-net mean-to-probability bridge above, but no named composition.
`Theorem243.lean` now proves
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_integral_outerProbability_finiteNetHoeffdingUpper`.
This is the source-side fixed-radius consumer for routes that prove ordinary
mean convergence of the finite-net Hoeffding upper and separately prove the
outer-probability finite-net event comparison.  It avoids reopening the heavy
product-sign expectation route.  The remaining theorem gap is still the
upstream derivation of the finite-net mean/tail/UI or event-comparison input
from the book entropy hypothesis.

2026-05-06 option-1 recalibration after direct search: the correct current
Theorem 2.4.3 target is not another endpoint consumer.  Local search in
`Theorem243.lean`, `OuterProbabilityExpectation.lean`,
`StatInference/ProbabilityMeasure`, pinned mathlib, the local AI-Statistician
checkout, the empirical-blueprint worktree, and the local Aristotle download
found no exact theorem proving the needed VdV&W probability-level
symmetrization/net comparison.  The precise missing source-side theorem is the
`hprob_bound` field consumed by
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_finiteNetHoeffdingUpper`:
for every fixed `eta > 0` and `epsilon > 0`, eventually in `n`, the outer
probability of the fixed-`M` centered truncated supremum bad event is bounded
by the outer probability of the bad event for
`vdVWTheorem243FiniteNetHoeffdingUpper (cardinality eta n sample n) n M + eta`.
The deterministic finite-cover inequalities and the
`VdVWTheorem243SymmetrizationPrecursor` currently supply finite-net
Rademacher and expectation/outer-expectation routes, but they do not prove this
probability-event comparison.  Next proof work should attack this exact
`hprob_bound` via ghost-sample/Rademacher/outer-probability symmetrization, or
primitive-register exactly this comparison if a self-contained Lean proof
requires a new VdV&W nonmeasurable empirical-process primitive.  Do not spend
the next batch on selected fixed-radius/inverse-radius endpoint aliases,
finite-class/full-subgraph endpoint packaging, or another consumer of already
closed side-condition structures unless it immediately proves this
`hprob_bound` or the exact textbook theorem.

2026-05-06 compiled comparison target: `Theorem243.lean` now names the exact
missing event comparison as the proof-carrying structure
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison` and adds the
single non-duplicative consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbabilityComparison`.
This does not assert the comparison as an axiom; it makes the source-side
VdV&W symmetrization/net theorem a concrete Lean target.  The next proof work
should construct this structure from the existing product-copy, ghost-sample,
Rademacher, finite-cover, and outer-probability APIs.  If construction blocks,
record the exact lower-level primitive missing from that construction rather
than adding another endpoint alias.

2026-05-06 fixed-FDD selected-coordinate congruence follow-up: local search
found only the whole-sample-path finite-dimensional congruence wrappers
`aemeasurable_fdd_congr_forall_coord_ae` and
`vdVWFDDProcessLaw_congr_forall_coord_ae`, plus mathlib `Measure.map_congr`.
For a fixed finite-dimensional law, whole-path equality is unnecessarily
strong.  `FiniteDimensional.lean` now proves
`aemeasurable_fdd_congr_finite_coord_ae` and
`vdVWFDDProcessLaw_congr_finite_coord_ae`, requiring a.e. equality only on the
selected finite coordinate set `I`.  This closes a small Chapter 1 FDD
replacement primitive without claiming the arbitrary-index VdV&W 1.4.8
converse, process separability, asymptotic tightness, or nonmeasurable
arbitrary-map weak convergence.  Next work should return to the upstream
Theorem 2.4.3 entropy/cardinality or selected tail/UI/ordinary-mean lanes, or
to a genuinely stronger Chapter 1 process primitive.

2026-05-06 finite pointwise-code-set random-cover bridge: local search found
the finite-image pointwise-code empirical-cover primitive
`empiricalL1CoveringNumber_le_of_finite_pointwise_approx_code_card_le`, the
coordinate-code and threshold-code-set specializations, and mathlib finite
image/cardinality lemmas, but no reusable generic finite code-set bridge at
the `CoveringPrimitive` layer or generic random-cover lift.  `CoveringPrimitive.lean`
now proves
`finite_pointwiseApproxCode_image_of_mem_codeSet`,
`pointwiseApproxCode_image_toFinset_card_le_codeSet`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_pointwise_approx_codeSet_card_le`,
and
`empiricalL1CoveringNumber_le_of_finite_pointwise_approx_codeSet_card_le`.
`Theorem243.lean` now lifts this to
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_pointwise_approx_codeSet_cardinality_bound_samplePath`
and the all-positive-radius wrapper
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_pointwise_approx_codeSet_cardinality_bound_samplePath`.
This is upstream structural content for sample-size-dependent compression and
code-image arguments; it is not another endpoint alias.  Next proof work
should either instantiate this bridge with a genuinely new polynomial
code-image/cardinality theorem, prove a selected tail/UI/ordinary-mean
condition, or move to a stronger Chapter 1 arbitrary-map/process primitive.

Authoritative `/goal` rebase, 2026-05-06 after verified pushed head
`109ab17 Add finite code-set random cover bridge`: local `main` is synced with
`origin/main`, and the newest closed Lean support is the generic finite
pointwise-code-set empirical-cover bridge in `CoveringPrimitive.lean` plus its
Theorem 2.4.3 random-cover lift in `Theorem243.lean`.  Treat the active Codex
goal object as broad orchestration only; this paragraph is the current
operational target and supersedes older rebase paragraphs below.  Do not replay
closed endpoint aliases, finite-index/FDD congruence wrappers, scalar-quantizer
packages, selected fixed-radius/inverse-radius consumers, or the new generic
finite code-set bridge unless a new exact theorem consumes them immediately.
The next high-capacity proof batch should choose the first lane that can make
real Lean progress after search:

1. instantiate the finite code-set bridge with a genuinely new polynomial
   code-image/cardinality theorem, VC/Sauer/finite-trace/threshold-grid
   estimate, or sample-size-dependent compression theorem feeding an already
   compiled selected fixed-radius Theorem 2.4.3 route;
2. prove a selected empirical-cover event, tail/UI, or ordinary-mean theorem
   from hypotheses strong enough to imply the finite-net mean/tail side
   conditions, without pretending bare outer-probability entropy convergence
   gives uniform integrability;
3. if those theorem-line entropy/tail lanes block after real Lean/search
   attempts, prove a stronger exact Chapter 1 process primitive: arbitrary-index
   VdV&W 1.4.8 FDD converse, process separability/tightness or
   asymptotic-measurability, nonmeasurable signed outer-cover weak convergence,
   or full arbitrary-map extended-real measurable-cover existence.

Each continuation should close a theorem-facing batch in one of these lanes or
record the precise missing theorem shape and next patchable edit.  Do not
create a formal theorem report from this rebase alone.

2026-05-06 finite code-set endpoint consumption: after the generic code-set
random-cover bridge, `Theorem243.lean` now also exposes the selected
fixed-radius and centered untruncated consumers
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_codeSet_cardinality_bound_logCardinality_div_tendsto_bound`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_codeSet_cardinality_bound_logCardinality_div_tendsto_bound`,
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_pointwise_approx_codeSet_logCardinality_div_tendsto_bound`,
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_pointwise_approx_codeSet_nat_poly`.
The code-set route is therefore now consumable all the way to the centered
Theorem 2.4.3 convergence conclusion.  The next non-duplicative theorem-line
step should prove an actual structural code-image/cardinality estimate feeding
one of these endpoints, or move to selected tail/UI or exact Chapter 1 process
primitives if that structural estimate blocks after search.

Authoritative `/goal` rebase, 2026-05-06 after verified pushed head
`ce2bb2c Add Theorem 2.4.3 scalar quantizer polynomial route`: local `main`
is synced with `origin/main`, the worktree is clean, and the active Codex goal
object remains a broad orchestration label because it cannot be edited in
place.  Use this paragraph as the operative replacement prompt.  Closed
support now includes all previously listed Chapter 1 weak-convergence/process
congruence and centered separability endpoints, plus the scalar-quantizer
coordinate-cardinality natural-polynomial bridge
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`,
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`.
The finite vector-code-set scalar-quantizer decoder-error bridge is also now
compiled as
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_scalarQuantizer_decode_error_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_scalarQuantizer_decode_error_codeSet_cardinality_bound_nat_poly`;
it reuses `abs_sub_le_of_abs_sub_decode_le_half` and the existing finite
pointwise-code-set constructor.  The fixed finite-code compression special case
is also compiled through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_fintype_scalarQuantizer_decode_error_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_fintype_scalarQuantizer_decode_error_nat_poly`,
using `Finset.univ` and a degree-zero polynomial bound.  This finite-code
side-condition package is now consumed by the theorem-facing centered
untruncated convergence endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_fintype_scalarQuantizer_decode_error_nat_poly`.

Do not spend the next `/goal` continuation on another final endpoint alias,
another finite-index/FDD/process congruence wrapper, another selected-route
restatement, or another coordinate-cardinality quantizer wrapper unless a new
exact theorem consumes it immediately.  The next theorem-facing batch should
now supply actual upstream mathematics: a finite-code/compression theorem,
VC/Sauer/finite-trace/threshold-grid/quantizer cardinality estimate, or
selected empirical-cover tail/UI/ordinary-mean theorem that feeds the compiled
fixed-radius route.  The fixed-finite-code route is now closed through the
centered untruncated convergence endpoint, so the next non-duplicative
structural target should handle sample-size-dependent compression/code images
or a true VC/Sauer/grid/threshold estimate not already covered by the existing
threshold/full-subgraph packages.  If those
Theorem 2.4.3 entropy/tail lanes block after real Lean/search attempts, switch
to an exact Chapter 1 process primitive (arbitrary-index VdV&W 1.4.8 FDD
converse, separability/tightness/asymptotic-measurability, nonmeasurable
signed outer-cover weak convergence, or full arbitrary-map extended-real
measurable-cover existence).

Authoritative `/goal` rebase, 2026-05-06 after verified pushed head
`fc98144 Add weak convergence target congruence`: local `main` is synced with
`origin/main`, the worktree is clean, and the active Codex goal object remains
broad because the goal API cannot edit an active objective in place.  Use this
paragraph as the operative replacement prompt.  The latest closed Lean support
is:

* measure-level weak-convergence source/target replacement:
  `VdVWWeakConvergenceProbabilityMeasures.congr_limit` and
  `VdVWWeakConvergenceProbabilityMeasures.congr_eventually_limit`;
* Chapter 1 process-law stability:
  `VdVWEllInftyProcessWeakConvergence.mono_filter`,
  `VdVWEllInftyProcessWeakConvergence.comp_tendsto`,
  `VdVWEllInftyProcessAsymptoticallyTight.mono_filter`,
  `VdVWEllInftyProcessAsymptoticallyTight.comp_tendsto`,
  `vdVWEllInftyProcessLaw_congr_ae`,
  `VdVWEllInftyProcessWeakConvergence.congr_eventually_ae`, and
  `VdVWEllInftyProcessAsymptoticallyTight.congr_eventually_ae`, plus the raw
  whole-sample-path coordinate equality wrappers
  `VdVWEllInfty.processMap_congr_ae`,
  `vdVWEllInftyProcessLaw_congr_forall_coord_ae`,
  `VdVWEllInftyProcessWeakConvergence.congr_eventually_forall_coord_ae`, and
  `VdVWEllInftyProcessAsymptoticallyTight.congr_eventually_forall_coord_ae`,
  plus the weak-convergence limit-process replacements
  `VdVWEllInftyProcessWeakConvergence.congr_limit_ae` and
  `VdVWEllInftyProcessWeakConvergence.congr_limit_forall_coord_ae`, and the
  finite-dimensional law congruence wrappers
  `aemeasurable_fdd_congr_forall_coord_ae` and
  `vdVWFDDProcessLaw_congr_forall_coord_ae`;
* Chapter 2.3 separability/measurability support:
  `VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_uniform_bound`,
  `VdVWPointwiseApproximableByCountableSubclass.tendsto_integral_of_uniform_bound`,
  `VdVWPointwiseApproximableByCountableSubclass.centered_of_uniform_bound`, and
  `VdVWPMeasurableClass.centered_of_pointwiseApproximableByCountableSubclass_of_uniform_bound`;
* Theorem 2.4.3 law-level endpoints consuming that separability route:
  `VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`
  and
  `VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`;
* all earlier Theorem 2.4.3 endpoint packages, selected fixed-radius and
  inverse-radius routes, finite-net/Hoeffding/Mills/untruncation packages,
  finite-class/full-subgraph/threshold/grid/quantizer routes, finite-index
  `ell_infty(T)` wrappers, and finite-dimensional forward process-law support
  listed below.

Do not spend the next `/goal` continuation on another endpoint alias, another
finite-index process wrapper, another selected-route restatement, another
process/FDD congruence alias, or another centered-separability wrapper unless a
new exact theorem consumes it immediately.  The next high-capacity proof batch
should choose the first lane below that can make genuine Lean progress after
search:

1. **Theorem 2.4.3 structural entropy lane.**  Prove a real structural
   entropy/cardinality theorem feeding an already compiled selected
   fixed-radius route, such as a finite-code/compression, VC/Sauer,
   finite-trace, threshold-grid, or quantizer estimate with sublinear
   normalized logarithmic growth.  First search the existing
   threshold/grid/full-subgraph/finite-trace routes to avoid duplicating a
   closed endpoint package.  The target should supply a new proof input for
   the book random entropy condition, not merely repackage an existing final
   consumer.
2. **Selected empirical-cover tail/UI/mean lane.**  Prove a genuine selected
   empirical-cover event, tail-expectation, uniform-integrability, or ordinary
   mean-convergence bridge from hypotheses strong enough to imply it.  Bare
   outer-probability convergence of normalized random entropy is not enough.
3. **Chapter 1 process primitive lane.**  If the theorem-line entropy or
   selected-cover mean lanes block after real Lean/search attempts, attack an
   exact Chapter 1 blocker: arbitrary-index VdV&W 1.4.8 FDD converse, process
   separability/tightness/asymptotic-measurability, nonmeasurable signed
   outer-cover weak convergence, or full arbitrary-map extended-real
   measurable-cover existence.

Each continuation should close a theorem-facing batch in one of these lanes or
record a precise blocker with searched APIs, failing theorem shape, and the
next patchable edit.  Do not create a formal theorem report from this rebase
alone.

2026-05-06 `/goal` rebase after `e3d050e`: local `main` is synced with
`origin/main`, the worktree is clean, and the latest verified closure is the
finite-process `ell_infty(T)` converse-support batch.  Treat the current
`/goal` objective as broad orchestration only; the operative next target is now
this narrowed dependency order.  Do not spend proof time on more finite-index
`ell_infty(T)` wrappers, selected fixed-radius/inverse-radius endpoint aliases,
full-subgraph/finite-class/threshold/grid/quantizer endpoint aliases, or
Theorem 2.4.3 final consumers already listed below.  The next high-capacity
proof batch should start with one of the following non-duplicative blockers:

1. prove a real structural entropy/cardinality theorem that supplies an
   already-compiled selected fixed-radius Theorem 2.4.3 route, such as a
   genuine finite-code/compression, VC/Sauer, grid, quantizer, or trace
   cardinality estimate with sublinear normalized logarithmic growth;
2. prove a genuine selected empirical-cover event/tail/UI/ordinary-mean bridge
   from hypotheses strong enough to imply it, rather than treating bare
   outer-probability convergence of normalized entropy as uniform
   integrability;
3. if those Theorem 2.4.3 upstream attempts are blocked after search and Lean
   attempts, switch to a theorem-critical Chapter 1 process primitive:
   arbitrary-index VdV&W 1.4.8 FDD converse, process separability/tightness or
   asymptotic-measurability interfaces, nonmeasurable signed outer-cover weak
   convergence, or full arbitrary-map extended-real measurable-cover
   existence.

For the active `/goal` work, a successful run should close a theorem-facing
batch in one of these lanes, not merely refresh documentation or add another
route alias.  The current Codex goal tool objective cannot be edited in place,
so this paragraph is the current replacement prompt for continuing the active
goal without replaying stale completed work.

2026-05-06 `/goal` rebase after `50f88c7`: local `main` is synced with
`origin/main`, the worktree is clean, and the latest verified Chapter 1 closure
is the raw bounded-process weak-convergence/tightness interface:
`VdVWEllInftyProcessWeakConvergence`,
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw`,
`VdVWEllInftyProcessWeakConvergence.asymptoticallyTight_atTop`, and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_asymptoticallyTight_atTop`.
The active Codex goal tool objective remains broad and cannot be edited
in-place except to mark it complete; this paragraph is the operative
replacement prompt.  Do not replay closed finite-index `ell_infty(T)` wrappers,
selected fixed-radius/inverse-radius Theorem 2.4.3 endpoint packages,
quantizer/grid/finite-trace endpoint aliases, or forward FDD/tightness support
already compiled.  The next high-capacity proof batch should attack one of the
remaining non-duplicative blockers: prove a real structural entropy/cardinality
theorem feeding an existing Theorem 2.4.3 selected fixed-radius route; prove a
selected empirical-cover tail/UI/ordinary-mean theorem from hypotheses strong
enough to imply it; or prove a Chapter 1 process primitive required for exact
textbook statements, especially arbitrary-index VdV&W 1.4.8 FDD converse,
process separability/tightness/asymptotic-measurability, nonmeasurable signed
outer-cover weak convergence, or full arbitrary-map extended-real measurable
cover existence.

2026-05-06 process coordinate-law follow-up: local search found raw
bounded-process finite-dimensional law consequences and measure-level
coordinate weak-convergence/tightness wrappers, but no direct single-coordinate
law consequence for the `VdVWEllInftyProcessWeakConvergence` and
`VdVWEllInftyProcessAsymptoticallyTight` interfaces.  `FiniteDimensional.lean`
now proves `VdVWEllInftyProcessWeakConvergence.coordinateLaw` and
`VdVWEllInftyProcessAsymptoticallyTight.coordinateLaw`.  These are forward
continuous-image process primitives for Chapter 1.4/1.5 arguments; they do
not assert the arbitrary-index VdV&W 1.4.8 FDD converse or process
separability/tightness criteria.

2026-05-06 raw coordinate-law follow-up: local search found the mapped
`ell_infty(T)` coordinate-law consequences above and mathlib's generic
`AEMeasurable.map_map_of_aemeasurable`, but no ordinary raw coordinate process
law adapter.  `FiniteDimensional.lean` now adds `vdVWCoordinateProcessLaw`,
`vdVWEllInftyProcessLaw_map_eval`,
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw`, and
`VdVWEllInftyProcessAsymptoticallyTight.rawCoordinateLaw`.  These let later
Chapter 1 process arguments consume ordinary one-coordinate laws directly
instead of carrying mapped `ell_infty(T)` eval-pushforward measures.  This is
still only the forward continuous-mapping direction; the exact arbitrary-index
FDD converse and process separability/asymptotic-measurability blockers remain
open.

2026-05-06 raw coordinate-law congruence follow-up: local search found the
finite-dimensional/process a.e.-congruence lemmas and mathlib
`Measure.map_congr`/`AEMeasurable.congr`, but no ordinary one-coordinate law
replacement theorem.  `FiniteDimensional.lean` now proves
`aemeasurable_coordinate_congr_ae` and `vdVWCoordinateProcessLaw_congr_ae`.
These make the new raw coordinate-law bridge stable under coordinatewise
a.e. replacement, which is needed before later separability or canonical
measurable-version arguments can use ordinary coordinate laws.

2026-05-06 raw coordinate-law replacement consumers: search found the
measure-level replacement APIs
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually_limit` and
`VdVWProbabilityMeasuresAsymptoticallyTight.congr_eventually`, together with
the new `vdVWCoordinateProcessLaw_congr_ae`, but no raw bounded-process
single-coordinate consumers for coordinatewise a.e. replacement.
`FiniteDimensional.lean` now proves
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw_congr_eventually_ae` and
`VdVWEllInftyProcessAsymptoticallyTight.rawCoordinateLaw_congr_eventually_ae`.
These close the one-coordinate replacement layer while still not claiming a
whole-process a.e. replacement from only one-coordinate equality, nor the
arbitrary-index VdV&W 1.4.8 converse.

2026-05-06 finite-FDD selected-coordinate replacement consumers: search found
the fixed-FDD congruence theorem `vdVWFDDProcessLaw_congr_finite_coord_ae`,
mathlib `Measure.map_congr`, and the measure-level
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually_limit` /
`VdVWProbabilityMeasuresAsymptoticallyTight.congr_eventually`, but no
process-facing consumers combining them with the forward bounded-process FDD
wrappers.  `FiniteDimensional.lean` now proves
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_congr_eventually_finite_coord_ae`
and
`VdVWEllInftyProcessAsymptoticallyTight.finiteDimensionalLaw_congr_eventually_finite_coord_ae`.
These let later Chapter 1 arguments replace only the selected finite
coordinates of FDD laws a.e. on source and limit spaces.  They are still
finite-FDD forward support, not the arbitrary-index weak-convergence/FDD
converse.

2026-05-06 finite-FDD/raw-coordinate atTop tightness replacement consumers:
search found existing
`VdVWEllInftyProcessWeakConvergence.asymptoticallyTight_atTop`,
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_asymptoticallyTight_atTop`,
and the finite-FDD/raw-coordinate replacement consumers, but no direct atTop
tightness consequences for replacement FDD or raw coordinate laws.
`FiniteDimensional.lean` now proves
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw_asymptoticallyTight_atTop`,
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_congr_eventually_finite_coord_ae_asymptoticallyTight_atTop`,
and
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw_congr_eventually_ae_asymptoticallyTight_atTop`.
These connect sequential bounded-process weak convergence to fixed-FDD and
raw-coordinate tightness after selected-coordinate replacement.  This is still
forward finite-dimensional support; it does not prove the arbitrary-index
VdV&W 1.4.8 converse or the process separability/asymptotic-measurability
interfaces.

2026-05-06 finite-index VdV&W 1.4.8 iff wrappers: search in local
`FiniteDimensional.lean`, `StatInference/ProbabilityMeasure`, and pinned
mathlib found the already compiled finite-product forward/converse directions
but no named iff criteria.  `FiniteDimensional.lean` now proves
`vdVW148_ellInfty_weakConvergence_iff_finiteProduct_weakConvergence_finite`
and
`vdVW148_ellInfty_asymptoticallyTight_iff_finiteProduct_asymptoticallyTight_finite`.
These are self-contained finite-index versions of the VdV&W 1.4.8
weak-convergence and tightness criteria.  They deliberately do not close the
arbitrary-index FDD converse, separability, asymptotic-measurability, or
nonmeasurable outer-cover weak-convergence blockers.

Authoritative operational prompt, 2026-05-06 after the verified
original-cover truncation/polynomial entropy bridges and the quantizer
random-cover lifts, plus the earlier truncated threshold trace algebra,
fixed-mask cardinality transfer, and first-sample uniform-integrability endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_unifIntegrable`
and the earlier natural-polynomial variable-domain entropy constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_nat_poly_bound`
and selected tail/UI bridge
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_nat_poly_bound`:
finish VdV&W Chapters 1-2 in Lean by dependency order, with proof-hole-free
code, search-first reuse of pinned mathlib and local
`StatInference/ProbabilityMeasure`, and no exact textbook claim until the
corresponding theorem statement compiles.  The active Codex `/goal` tool
objective is intentionally broad and currently cannot be edited in place; this
paragraph is the replacement target for ongoing `/goal` work.

2026-05-06 `/goal` rebase after `2d2b441`: the next continuation should start
from the verified finite-restriction process measurability and finite-index
FDD/converse layers.  Do not rebuild `ell_infty(T)` wrappers, selected
fixed-radius/inverse-radius packages, full-subgraph/finite-class/quantizer/
threshold/grid endpoint packages, or generic Theorem 2.4.3 final consumers
already listed here.  The next high-capacity proof batch should try, in order:
prove a genuine structural entropy/cardinality theorem feeding the selected
fixed-radius Theorem 2.4.3 route; prove a real selected empirical-cover
tail/UI/ordinary-mean bridge from a hypothesis strong enough to imply it; or,
if those theorem-line routes block after search and Lean attempts, move to a
theorem-critical Chapter 1 process primitive such as arbitrary-index FDD
converse, separability/tightness/asymptotic-measurability, or nonmeasurable
outer-cover signed weak convergence.  The finite-coordinate measurability,
finite-index law, identically-distributed, weak-convergence, and
asymptotic-tightness wrappers are support infrastructure already compiled, not
the next target.

2026-05-06 Chapter 1 FDD transport closure: local search found mathlib
`HasLaw.congr`, `IdentDistrib.of_ae_eq`, and `TendstoInDistribution.congr`,
but no local raw finite-vector law transport to the finite-coordinate
restriction of `VdVWEllInfty.processMap`.  `FiniteDimensional.lean` now adds
`vdVW148_boundedProcess_finiteRestrict_hasLaw_of_hasLaw`,
`vdVW148_boundedProcess_finiteRestrict_identDistrib_of_identDistrib`, and
`vdVW148_boundedProcess_finiteRestrict_tendstoInDistribution_of_tendstoInDistribution`.
These let raw finite-dimensional HasLaw/IdentDistrib/TendstoInDistribution
hypotheses be consumed directly by finite restrictions of bounded
`ell_infty(T)` process maps.  This closes another finite-dimensional support
gap only; the arbitrary-index VdV&W 1.4.8 converse, process separability,
asymptotic tightness/measurability, and nonmeasurable outer-cover signed weak
convergence remain the Chapter 1 process blockers.

2026-05-06 finite-index boundedness cleanup: local search found mathlib
`Finite.bddAbove_range`, which proves boundedness of finite real coordinate
ranges without an empirical-process primitive.  `EllInfty.lean` now adds
`VdVWEllInfty.isBoundedSamplePath_of_finite`, the canonical finite-index map
`VdVWEllInfty.processMapFinite`, and compatibility with
`finiteContinuousLinearEquiv`.  `FiniteDimensional.lean` now adds
`vdVW148_finiteProcess_hasLaw_of_finiteProduct_hasLaw_finite`,
`vdVW148_finiteProcess_identDistrib_of_finiteProduct_identDistrib_finite`,
and
`vdVW148_finiteProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`.
These remove a nuisance boundedness hypothesis only for finite `T`; they do
not close the arbitrary-index VdV&W 1.4.8 converse.

2026-05-06 scalar-quantizer structural-cover lift: local search found
deterministic coordinate scalar-quantizer empirical-cover bounds in
`CoveringPrimitive.lean`, especially
`empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_decode_error_card_le`,
but no Theorem 2.4.3 random empirical-cover lift.  `Theorem243.lean` now adds
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_scalarQuantizer_decode_error_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_coordinate_scalarQuantizer_decode_error_cardinality_bound_samplePath`.
These convert finite coordinate code sets plus decoder error `eta / 2` into
the selected random empirical-cover domination used by the fixed-radius
Theorem 2.4.3 route.  Remaining structural work is still the actual finite
code-set cardinality/compression or VC/Sauer estimate, not another endpoint
alias.

2026-05-06 scalar-quantizer coordinate-cardinality follow-up: the same route
now has product-cardinality convenience wrappers
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_samplePath`.
They use mathlib `Finset.prod_le_pow_card` to reduce the product domination
side condition to a uniform per-coordinate code-set cardinality bound plus
`coordinateCard ^ m` domination.  Future compression/grid proofs should supply
that per-coordinate bound or a sharper structural bound.

2026-05-06 scalar-quantizer selected fixed-radius package update: the
coordinate-cardinality route now feeds the selected fixed-radius tail/UI side
condition interface through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_logCardinality_div_tendsto_bound`.
This removes another manual conversion layer for quantizer/grid/compression
arguments stated in terms of coordinate code sets, decoder error, and a
deterministic normalized log-cardinality bound.  It is still not the missing
cardinality theorem: the next non-duplicative step is a real finite-code,
compression, VC/Sauer, or other structural estimate supplying the
per-coordinate/product cardinality hypotheses with sublinear normalized log
growth.

2026-05-06 scalar-quantizer natural-polynomial closure: local search found no
existing nat-polynomial selected fixed-radius package for the coordinate
scalar-quantizer coordinate-cardinality route.  `Theorem243.lean` now adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`,
and the centered untruncated convergence consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`.
This is a structural bridge that consumes a genuine polynomial cardinality
input; it should not be followed by another scalar-quantizer endpoint alias.
The next useful theorem should prove the actual VC/Sauer, grid, finite-code, or
compression estimate supplying the coordinate-cardinality and polynomial
growth hypotheses, or switch to the selected tail/UI or Chapter 1 process
blocker lanes.

Rebased next-target rule: do not add another alias or endpoint wrapper for a
route already listed below unless it consumes a genuinely new theorem
hypothesis.  The highest-value Theorem 2.4.3 work is now upstream: prove the
selected empirical-cover entropy tail/UI or ordinary-mean input from the
book's fixed-radius condition, or prove a concrete structural cardinality
theorem such as VC/Sauer, finite-trace, threshold-grid, or quantizer
cardinality that feeds the existing natural-polynomial selected fixed-radius
route.  The raw nearest-integer quantizer bridge
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_roundingQuantizer_uniform_abs_bound_cardinality_bound_samplePath`
is only a covering lift; by itself it gives exponential-in-sample-size
cardinality and does not close Theorem 2.4.3.  Consume it only together with a
real subexponential/natural-polynomial structural bound or a new finite-code
compression theorem.  If those entropy/cardinality attempts are genuinely
blocked after search and Lean attempts, move to a theorem-critical Chapter 1
process primitive: arbitrary-index FDD converse, separability/tightness/
asymptotic measurability, or nonmeasurable outer-cover signed weak
convergence.

2026-05-06 follow-up: the quantizer lift now has exactly that honest selected
fixed-radius consumer under an explicit natural-polynomial cardinality
assumption:
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_roundingQuantizer_uniform_abs_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_roundingQuantizer_uniform_abs_bound_nat_poly`.
These theorems do not assert that the raw nearest-integer product grid has
polynomial size; future progress must prove a real compression/VC/Sauer
cardinality bound or use another structural entropy input before claiming a
new Theorem 2.4.3 endpoint.  The corresponding centered untruncated
convergence endpoint is now compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_roundingQuantizer_uniform_abs_bound_nat_poly`,
again with the polynomial cardinality/compression hypothesis explicit.
The same hypothesis now also feeds the book-facing variable truncated entropy
package through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_roundingQuantizer_uniform_abs_bound_nat_poly`.
The same route now reaches the final local `P`-GC and in-mean package
`VdVWTheorem243_roundingQuantizer_uniform_abs_bound_nat_poly_pGlivenkoCantelli_and_inMean`.
The remaining non-duplicative quantizer task is therefore not another
selected/entropy/final endpoint; it is a genuine finite-code compression,
VC/Sauer-style, or other structural theorem that supplies the polynomial
cardinality bound.

Verified compiled foundation that should not be repeated:
`vdVW_theorem_2_4_1_glivenkoCantelli`;
the strong countable/full-subgraph Theorem 2.4.3 and Lemma 2.4.5 endpoint
packages including
`VdVWTheorem243_fullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`,
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`,
`VdVWOrderDualSubmartingaleConvergenceHandoff.proved`, and
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable`;
selected fixed-radius/inverse-radius entropy packages and finite-net
tail/UI consumers; deterministic untruncation and envelope-tail bridges;
the raw normalized-log tail/UI route, deterministic normalized-log bound route,
ordinary-mean normalized-log route, selected L1 side-condition package, and
the untruncated centered L1 consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_integral_tendsto_zero`;
the measurable and null-measurable signed positive/negative outer-expectation
bridges, signed bounded-continuous arbitrary-map asymptotic-measurability
including null-measurable constructors, common-domain/varying-domain
measurable and null-measurable signed weak-convergence packages, the
varying-domain signed continuous-mapping closures
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.comp_continuous`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.comp_continuous`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.comp_continuous`,
the signed weak-convergence filter-refinement closures
`VdVWWeakConvergenceSignedOuterBoundedContinuous.mono_filter`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.mono_filter`,
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.mono_filter`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.mono_filter`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.mono_filter`,
and the
real-valued varying-domain Dirac-law bridge
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real`
with its null-measurable variant
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_nullMeasurable`
and the Theorem 2.4.3 `P`-measurable law consumer
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pMeasurableClass_convergesInOuterProbabilityConst`
plus the signed endpoint consumer
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pMeasurableClass_convergesInOuterProbabilityConst`;
the `ell_infty(T)` substrate in `EllInfty.lean`, including
`VdVWEllInfty.ofBounded`, coordinate norm/evaluation wrappers,
bounded-sample-path process maps, finite-coordinate restrictions, the forward
FDD weak-convergence/HasLaw/IdentDistrib/TendstoInDistribution wrappers,
finite-coordinate measurable/a.e.-measurable raw process restriction bridges
`VdVWEllInfty.measurable_finiteRestrict_processMap` and
`VdVWEllInfty.aemeasurable_finiteRestrict_processMap`, and
the finite-index product identification
`VdVWEllInfty.finiteContinuousLinearEquiv`; and the finite-index converse
wrappers
`vdVW148_ellInfty_map_finiteContinuousLinearEquiv_symm_map`,
`vdVW148_ellInfty_weakConvergence_of_finiteProduct_weakConvergence_finite`,
and
`vdVW148_ellInfty_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`;
and the measure-level Portmanteau continuity-set/converse wrappers
`VdVWWeakConvergenceProbabilityMeasures.tendsto_measure_of_null_frontier`,
`vdVWWeakConvergenceProbabilityMeasures_of_forall_isClosed_limsup_measure_le`,
and
`vdVWWeakConvergenceProbabilityMeasures_of_forall_isOpen_measure_le_liminf`;
and the norm-tail tightness wrappers
`VdVWProbabilityMeasuresTight.tendsto_norm_tail`,
`vdVWProbabilityMeasuresTight_of_tendsto_norm_tail`, and
`vdVWProbabilityMeasuresTight_iff_tendsto_norm_tail`;
the π-system convergence-determining wrapper
`vdVWWeakConvergenceProbabilityMeasures_of_piSystem_tendsto`;
and the VdV&W 1.4.2 product-test uniqueness wrappers
`vdVW142_prod_measure_ext_of_forall_boundedContinuous_integral_mul` and
`vdVW142_prod_measure_eq_prod_of_forall_boundedContinuous_integral_mul`;
and the measurable independent-coordinate joint-law convergence wrappers
`vdVWTendstoInDistribution_prodMk_laws_of_indepFun` and
`vdVWTendstoInDistribution_pi_laws_of_iIndepFun`, plus the corresponding
ordinary convergence-in-distribution wrappers
`vdVWTendstoInDistribution_prodMk_of_indepFun` and
`vdVWTendstoInDistribution_pi_of_iIndepFun`;
and the direct finite-class Theorem 2.4.3/Lemma 2.4.5 package
`VdVWTheorem243_finite_indexClass_textbookAligned_canonical_slln`, which
collects finite-class `P`-measurability, finite measurable integrable-envelope
outer expectation, outer-probability/a.s./local `P`-GC, in-mean convergence,
and Lemma 2.4.5 a.s. centered-supremum convergence without invoking the
full-subgraph/VC route;
and the direct bounded separability-to-Definition 2.3.3 handoff
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_bddAbove`,
which combines the existing pointwise-approximability supremum-equality bridge
with the countable-subclass `P`-measurability constructor;
and the measure-level continuous-image/reindexed asymptotic-tightness wrappers
`VdVWWeakConvergenceProbabilityMeasures.map_asymptoticallyTight_atTop` and
`VdVWWeakConvergenceProbabilityMeasures.map_asymptoticallyTight_comp_tendsto_atTop`.
The finite-trace natural-polynomial structural route now also has the direct
centered untruncated convergence consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_trace_image_cardinality_bound_nat_poly`,
which composes finite-trace/Sauer-style cardinality estimates with the compiled
selected fixed-radius untruncation route, and the endpoint package
`VdVWTheorem243_finite_trace_image_cardinality_bound_nat_poly_pGlivenkoCantelli_and_inMean`
which upgrades that centered convergence to canonical `P`-Glivenko-Cantelli
and in-mean centered-supremum convergence through the existing endpoint
adapters.
The finite pointwise-code structural covering lift is now compiled too:
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_pointwise_approx_code_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_pointwise_approx_code_cardinality_bound_samplePath`
turn samplewise finite approximate codes, whose equal-code classes are
pointwise close on the realized empirical sample, into the random empirical
covering-number domination required by the selected fixed-radius Theorem 2.4.3
routes.  The route is now consumed by the selected fixed-radius package through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_code_cardinality_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_code_cardinality_bound_logCardinality_div_tendsto_bound`.
The route now reaches the centered untruncated Theorem 2.4.3 convergence
conclusion through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_pointwise_approx_code_logCardinality_div_tendsto_bound`.
This is a genuine structural-cardinality input route; future work should prove
deterministic log-cardinality/tail/UI bounds for concrete code images, not add
another endpoint wrapper.
The first-sample UI route also now has the direct untruncated centered
convergence endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_unifIntegrable`,
which composes the existing selected first-sample `UnifIntegrable`
side-condition constructor with the large-`M` untruncation handoff.  This is an
honest endpoint under explicit UI; it does not prove that the textbook
outer-probability entropy condition implies UI.

2026-05-06 search-first blocker audit after the first-sample UI endpoint:
local search in `Theorem243.lean`, `PMeasurable.lean`,
`OuterProbabilityExpectation.lean`, `ProbabilityMeasure`, `ThresholdCoding.lean`,
`TraceCoding.lean`, `VCSauer.lean`, and `CoveringPrimitive.lean` found that the
usable endpoint surface is already compiled.  Existing consumers cover raw
selected finite-net tail expectation, ordinary selected normalized-log mean
convergence, first-sample `UnifIntegrable`, first-sample `eLpNorm` tail,
first-sample uniform `nnnorm` bounds, deterministic normalized-log bounds,
natural-polynomial cardinality growth, finite trace/code-set routes,
threshold-code routes, integer-grid/full-subgraph routes, finite-class routes,
and the centered-to-`P`-GC/in-mean endpoint adapters.  No non-duplicative
endpoint theorem is currently missing.

The tempting theorem
`selected first-sample UnifIntegrable from
VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM` is blocked as
stated: outer-probability convergence of
`log N(η, F_M, L1(P_n)) / n` does not imply uniform integrability, tail
expectation control, or ordinary mean convergence on varying sample spaces.
The next proof must add real mathematics upstream, not another wrapper:
either prove a structural theorem implying one of the compiled UI/tail/mean
inputs, or instantiate the existing
`VdVWUniformSubgraphVCBound indexClass (vdVWTruncatedClassFun classFun envelope M)`
for a concrete class/truncation geometry.  A generic quantizer/grid product
bound alone is insufficient when it only gives exponential-in-`n` growth,
because the selected fixed-radius routes require subexponential or
natural-polynomial cardinality growth so that `log(cardinality_n) / n -> 0`.

2026-05-06 fixed-mask cardinality transfer: `Theorem243.lean` now adds
`vdVWTraceMaskTransform`, `vdVWTraceMaskTransform_image_card_le`, and the
all-threshold cardinality bound
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le`
with its nonnegative/negative threshold-family specializations
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_of_nonneg`
and
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_of_neg`.
The reusable search result is `Finset.card_image_le`: the truncated threshold
trace family is contained in a fixed image of the original threshold-trace
family, so finite cardinality cannot increase.  The same file also now has
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_add_one_real_le_nat_poly_of_original_vc`,
which combines the fixed-mask cardinality inequality with the existing local
Sauer wrapper.  It also pushes that result through finite threshold products
and threshold-code sets via
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_nat_poly_of_original_vc`,
`threshold_binaryTraceSetFamily_product_card_le_truncated_of_original_uniform_vc`,
and
`thresholdTraceCodeSet_vdVWTruncatedClassFun_card_add_one_real_le_original_uniform_vc`.
The selected fixed-radius route now consumes the original fixed-threshold VC
input directly through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`.
The package now reaches untruncated centered convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`.
The integer-grid selected fixed-radius route now has the same original-VC
cardinality transfer through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_abs_bound_original_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_integerMultipleThresholdGrid_uniform_abs_bound_original_vc`.
This uses local searches around `integerMultipleThresholdGrid`,
`exists_integerMultipleThresholdGrid_between_of_bounds`,
`abs_sub_le_of_forall_bounded_gap_exists_threshold`, and the compiled
original-VC threshold-code package.  The canonical envelope/grid original-VC
route is now also compiled.  The selected side adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_bound_original_vc`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_vc`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_subgraph_vc`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`.
The entropy side adds
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_vc`,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_subgraph_vc`,
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`.
The original-VC canonical grid route now feeds the centered untruncated
Theorem 2.4.3 convergence machinery through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`.
This is an actual final-machinery consumer, not another wrapper around the
same selected package: it keeps the analytic side conditions explicit while
reducing the structural input from truncated-class full-subgraph VC to
original-class full-subgraph VC.  The compact original-VC
side-condition/integrable constructor is now compiled through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable`,
its iid-Rademacher variant
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable_iidRademacher`,
and the canonical endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable_canonical`.
This centered convergence is now consumed by the finite-product
uniform-deviation endpoint
`VdVWOuterProbabilityUniformDeviationConstOn_of_originalFullSubgraph_integrable_canonical`
and the canonical outer-probability `P`-GC endpoint
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_originalFullSubgraph_integrable_canonical`.
The same original full-subgraph hypothesis now also feeds the in-mean route
through
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_originalFullSubgraph_integrable_tailExpectation_of_countable_canonical`,
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_originalFullSubgraph_integrable_of_countable_canonical`,
and the combined canonical `P`-GC/in-mean package
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_and_inMean_canonical`.
The same route now reaches the Lemma 2.4.5 finite-product/a.s.
centered-supremum layer through
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_originalFullSubgraph_integrable_canonical`,
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_originalFullSubgraph_integrable_canonical`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_originalFullSubgraph_integrable_canonical_of_countable_integrable`,
`VdVWAlmostSureGlivenkoCantelliClass_of_originalFullSubgraph_integrable_canonical_of_countable_integrable`,
and the strong endpoint
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_of_countable_integrable`.
The matching no-nonempty endpoint
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`
is compiled too.
The next useful proof is to prove a new concrete class-geometry/cardinality
theorem or move to the genuine random-entropy tail/UI bridge.  Do not add
another endpoint alias for the same selected fixed-radius cardinality route
unless final theorem assembly consumes a new proof input.

The parallel Chapter 1 audit reached the same conclusion on the process side:
`WeakConvergence.lean`, `EllInfty.lean`, `BallSigma.lean`, and
`FiniteDimensional.lean` already contain the measure-level weak convergence,
Portmanteau/tightness/product/FDD wrappers, signed bounded-continuous
arbitrary-map filter/reindex/congruence layers, `ell_infty(T)` substrate,
finite-coordinate restriction wrappers, and finite-index `ell_infty(T)`/raw
bounded-process FDD converses.  The missing VdV&W 1.4.8 shape is the
arbitrary-index process converse, which should not be faked as another
finite-index wrapper.  A future exact statement needs primitives like
`VdVWProcessAsymptoticallyTight μs l` and `VdVWSeparableLimitProcess μ`, plus a
proof that finite-dimensional weak convergence under those hypotheses implies
weak convergence of the full `ell_infty(T)` process laws.

2026-05-06 structural-cardinality primitive progress: `Theorem243.lean` now
has the exact threshold-trace algebra for VdV&W truncation
`f 1{F <= M}`:
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter`,
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter_of_nonneg`,
and
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter_of_neg`.
These lemmas describe the threshold trace of the truncated class as the
original threshold trace restricted to the realized envelope sublevel mask,
with a fixed outside-mask contribution for negative thresholds.  This is the
first algebraic step toward replacing the current opaque assumption
`∀ M > 0, VdVWUniformSubgraphVCBound indexClass
  (vdVWTruncatedClassFun classFun envelope M) (vcDegree M)` by a real
structural transfer theorem.  The next Lean target is a finite trace-family
cardinality/VC transfer for the operation
`trace ↦ fixedMask ∪ (trace ∩ insideMask)` on `Finset (Fin n)`, then apply it
to threshold traces of `vdVWTruncatedClassFun`.

Next high-capacity proof batches, in order:

1. Return to the exact book entropy mismatch.
   The finite-net/Hoeffding/Mills, selected fixed-radius and inverse-radius,
   untruncation, signed endpoint, full-subgraph, finite-class, Lemma 2.4.5
   reverse/cofiltration, deterministic normalized-log, raw tail/UI, L1
   ordinary-mean packages, and finite pointwise-code selected fixed-radius
   consumers are already compiled.  The remaining non-duplicative
   theorem target is the structural bridge from the book condition
   `log N(η, F_M, L1(P_n)) = o_P^*(n)` for each fixed `η > 0` to a real
   tail/UI, uniform-integrability, deterministic cardinality, or ordinary
   mean-convergence input consumed by those compiled routes.  Do not add
   another endpoint or selected-package wrapper unless it directly consumes a
   new theorem hypothesis.
3. Search and try the strongest honest entropy closure first:
   prove a structural varying-domain uniform-integrability theorem for
   `Y_n = log(cardinality_n + 1) / n`, derive ordinary mean convergence of
   `Y_n`, or instantiate the compiled deterministic normalized-log route from
   a real structural cardinality estimate such as finite-code, VC, finite-trace,
   or polynomial growth.  Bare outer-probability convergence of `Y_n` is not
   enough for tail expectation; do not assert that implication without an
   added UI/tail or structural bound hypothesis.  The fixed-domain Vitali/UI
   bridge is now compiled as
   `tendsto_eLpNorm_one_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable`,
   reusing mathlib `tendsto_Lp_finite_of_tendstoInMeasure`, and its
   nonnegative ordinary-mean consumer is compiled as
   `tendsto_integral_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable_nonneg`.
   The signed ordinary-mean consumer
   `tendsto_integral_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable`
   is compiled too, using `‖∫ Y_n‖ ≤ ∫ ‖Y_n‖`.
   These confirm the reusable common-space route but do not remove the
   varying-domain empirical-cover entropy blocker.  The finite-product to
   infinite-product event recoding now has the measurable-event equality
   `vdVWInfiniteProductMeasure_firstNSample_preimage_eq` and real-tail
   specialization `vdVWInfiniteProductMeasure_firstNSample_real_tail_eq`,
   complementing the existing first-sample integral lift.  The convergence-level
   real recoding is also compiled as
   `VdVWConvergesInOuterProbability_firstNSample_real_of_const`,
   `VdVWConvergesInOuterProbabilityConst_of_firstNSample_real`, and
   `vdVWConvergesInOuterProbability_firstNSample_real_iff_const`; arbitrary
   nonmeasurable outer events still require separate one-sided primitives.
   The common-space UI mean route is compiled as
   `tendsto_integral_vdVWProductMeasure_of_VdVWConvergesInOuterProbabilityConst_firstNSample_unifIntegrable`:
   measurable finite-product convergence plus uniform integrability of the
   infinite-product first-sample lifts gives ordinary finite-product mean
   convergence.  The remaining entropy target is therefore the actual UI/tail
   or structural cardinality proof for the selected normalized empirical-cover
   entropy.  The common-space UI input now feeds the Theorem 2.4.3 selected
   fixed-radius side-condition package through
   `VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_unifIntegrable`;
   it first transfers the book external-cardinality convergence to the selected
   least-cover process by monotonicity, then uses the first-sample UI mean
   bridge.  The mathlib large-tail criterion is now consumed directly by
   `VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_eLpNormTail`,
   using `MeasureTheory.unifIntegrable_of` after search in
   `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/UniformIntegrable.lean`.
   The remaining blocker is no longer UI plumbing: it is proving the explicit
   lifted selected-entropy `eLpNorm` tail condition, or a stronger structural
   cardinality/VC/finite-trace theorem that implies it.  A deterministic
   pointwise support criterion for this route is also compiled:
   `eLpNorm_one_tail_condition_of_nnnorm_bound` proves the fixed-domain
   `eLpNorm` tail condition from a uniform `nnnorm` bound, and
   `VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_nnnorm_bound`
   feeds such a bound for the first-sample selected entropy lifts into the
   selected fixed-radius package.  Next proof work should instantiate that
   bound or the stronger tail criterion from an actual structural entropy
   theorem, not add another package endpoint.
4. In parallel only when it directly supports exact Chapter 1-2 statements or
   Theorem 2.4.3 endpoints, close reusable arbitrary-map/process foundation
   gaps that are already search-isolated.  The signed weak-convergence
   filter-refinement package and the binary/finite independent product
   convergence wrappers are now closed; do not repeat them.  The canonical
   infinite iid product substrate is also already present in `PMeasurable.lean`
   through `vdVWInfiniteProductMeasure`,
   `vdVWInfiniteProductMeasure_coordinate_hasLaw`, and
   `vdVWInfiniteProductMeasure_iIndepFun_coordinates`, reusing mathlib
   `Measure.infinitePi` and `iIndepFun_iff_map_fun_eq_infinitePi_map`.
   The next Chapter 1 fallback should therefore address a deeper exact
   primitive: nonmeasurable outer-cover signed extended-real weak convergence,
   asymptotic-tightness/asymptotic-independence, arbitrary-index FDD converse,
   or exact separability/`P`-measurable class support beyond the current signed
   bounded-continuous and ordinary product-law packages.
4. If the book random-entropy route remains blocked after real Lean/search
   attempts, move immediately to theorem-critical exactness gaps instead of
   rewrapping closed Theorem 2.4.3 layers.  The first fallback is a precise
   named final-current Theorem 2.4.3/Lemma 2.4.5 statement from the strongest
   full-subgraph/structural-route packages, with every assumption classified
   as textbook, stronger-but-structural, or missing primitive.  Then continue
   to arbitrary-map/asymptotic measurability for Chapter 1, exact
   nonmeasurable outer-cover envelope-tail variants if final statements
   require them, and removal of remaining countability/coordinate-
   measurability assumptions through the `VdVWPMeasurableClass` and
   pointwise-separable APIs.
5. After Theorem 2.4.3 is exact or its remaining hypotheses are named as
   honest primitives, advance in textbook dependency order through Chapter 2:
   Section 2.2 covering/packing/entropy results, Section 2.3 measurable-class
   and separability lemmas, then bracketing/GC, Orlicz/maximal inequalities,
   Donsker/entropy material, and the corresponding Chapter 1
   Portmanteau/Prokhorov/tightness/product/FDD/Hilbert/generated-sigma
   foundations when they discharge those theorem lines.

Older entries below are historical proof-state logs.  Use the authoritative
paragraph above for the next `/goal` run unless a later verified commit updates
it.

2026-05-05 current proof batch: the selected finite-net tail/UI gap now has the
raw normalized-log to affine-tail reduction and selected-package constructor.
New compiled declarations:
`logCardinality_div_affineTailIntegrable_of_measurable_integrable`,
`logCardinality_div_affine_tailExpectation_condition_of_tailExpectation`, and
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_tailExpectation`,
plus the selected package constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_tailExpectation_raw`.
These prove that measurability, integrability, and tail/UI of the normalized
log selected empirical-cover cardinality imply both the finite-net Hoeffding
tail/UI condition and the selected fixed-radius tail/UI package.  Search
record: local code already had the finite-net Hoeffding-to-affine-log tail
reduction and selected fixed-radius package constructor; pinned mathlib has
fixed-domain `UniformIntegrable`/Vitali APIs but no ready theorem turning
varying-domain outer-probability entropy into tail expectation.  Next exact
edit: derive the raw normalized-log tail/UI and integrability hypotheses from
the textbook random entropy condition, or record the missing structural
uniform-integrability theorem shape if convergence in outer probability alone
is insufficient.

2026-05-05 follow-up: the deterministic structural branch of the raw
normalized-log gap now compiles.  New declarations:
`logCardinality_div_integrable_of_measurable_bound`,
`logCardinality_div_tailExpectation_condition_of_bound`, and
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_bound`.
They prove that a deterministic normalized-log bound supplies raw
normalized-log integrability, raw normalized-log tail/UI, and hence the
finite-net Hoeffding tail/UI condition.  This supports VC/finite-code
entropy routes.  It does not close the pure random-entropy route: the exact
remaining theorem is still a varying-domain uniform-integrability/tail
expectation implication from
`log N(η, F_M, L1(P_n)) / n -> 0` in outer probability, or an explicit
book-facing assumption strong enough to provide it.

2026-05-05 blocker refinement after search: the next non-duplicative
Theorem 2.4.3 target is not another selected fixed-radius or untruncated
consumer.  Existing compiled declarations already consume deterministic
normalized-log bounds through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_div_bound`,
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_bound`,
and the raw-log tail reductions above.  Searches over local `StatInference`,
`StatInference/ProbabilityMeasure`, and pinned mathlib found fixed-domain
`UniformIntegrable`/Vitali APIs and local varying-domain tail-expectation
adapters, but no theorem of the false-too-strong shape
`VdVWConvergesInOuterProbabilityConst Y_n 0 -> tailExpectation_condition Y_n`.
The exact remaining non-deterministic theorem shape must therefore include a
real varying-domain uniform-integrability/tail condition, or a structural
entropy theorem implying it.  Patchable missing primitive:
for
`Y_n(sample) = log(cardinality_n(sample,n)+1)/n`, prove measurability,
integrability, and
`∀ ε>0, ∃ R≥0, ∀ᶠ n, ∫ 1_{R<Y_n} Y_n dP_n ≤ ε`
from a named VdV&W/book entropy hypothesis stronger than mere outer
probability convergence, or prove the structural cardinality bound that lets
the already compiled deterministic route apply.

2026-05-05 L1-strengthened entropy bridge: the varying-domain tail/UI route
now has a mean-convergence sufficient condition.  New compiled declarations:
`tailExpectation_condition_of_integral_tendsto_zero_nonneg` in
`OuterProbabilityExpectation.lean` and
`logCardinality_div_tailExpectation_condition_of_integral_tendsto_zero` plus
`finiteNetHoeffdingUpper_tailExpectation_condition_of_raw_logCardinality_div_integral_tendsto_zero`
in `Theorem243.lean`.  They prove that if the ordinary means of the normalized
log-cardinality process tend to zero, then the raw normalized-log tail/UI
condition and the finite-net Hoeffding tail/UI condition hold.  This is
stronger than the textbook outer-probability entropy condition, but it is a
genuine non-deterministic route that avoids a deterministic cardinality bound.
Remaining exact blocker: derive this mean convergence from a VdV&W structural
entropy hypothesis, or prove a separate uniform-integrability theorem for the
normalized log-cardinality process.

2026-05-05 follow-up: the L1-strengthened route now feeds the selected
fixed-radius Theorem 2.4.3 side-condition package directly through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_integral_tendsto_zero`.
Given variable-domain book entropy, finite-net upper integrability, selected
normalized-log measurability/integrability, and ordinary mean convergence of
the selected normalized-log process, this constructor supplies the packaged
fixed-radius tail/UI assumptions consumed by the existing untruncation route.
The remaining non-duplicative target is therefore structural: prove the
selected normalized-log mean convergence or a genuine UI theorem from VdV&W
entropy hypotheses, or instantiate the compiled deterministic route from a
valid cardinality estimate.

2026-05-05 second L1 follow-up: the selected package constructor now feeds an
untruncated centered convergence consumer:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_integral_tendsto_zero`.
This is the theorem-facing endpoint for the L1-strengthened branch.  It
combines variable-domain book entropy, finite-net upper integrability,
selected normalized-log measurability/integrability, and selected
normalized-log mean convergence with the existing selected fixed-radius
untruncation route.  Future runs should not add another untruncated wrapper
for the same hypotheses; they should prove the structural mean/UI input or
continue to the next theorem-critical arbitrary-map primitive.

2026-05-05 Chapter 1 arbitrary-map follow-up: the varying-domain signed
bounded-continuous weak-convergence layer now has the same continuous-mapping
closure as the common-domain layer.  New compiled declarations:
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.comp_continuous`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.comp_continuous`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.comp_continuous`.
Search record: local code already had common-domain signed continuous-mapping
closures and varying-domain map-law/null-measurable feeders, while pinned
mathlib supplies `integral_map` and bounded-continuous composition.  The new
lemmas close the sample-size-varying continuous-mapping gap for endpoints such
as Theorem 2.4.3 pushforwards.  Remaining arbitrary-map work is deeper:
nonmeasurable outer-cover signed extended-real weak convergence,
asymptotic-tightness/asymptotic-independence, FDD converse, and exact
separability/`P`-measurable class support beyond the current signed
bounded-continuous package.

2026-05-05 signed filter-refinement follow-up: the signed bounded-continuous
weak-convergence packages are now stable under passing to a finer index
filter.  New compiled declarations:
`VdVWWeakConvergenceSignedOuterBoundedContinuous.mono_filter`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.mono_filter`,
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.mono_filter`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.mono_filter`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.mono_filter`.
Search record: local `WeakConvergence.lean` already had
filter-refinement closures for the nonnegative, lower-shifted, canonical
shifted, and common-domain signed asymptotic-measurability predicates, while
local/mathlib search found no signed weak-convergence package closures.  The
new proofs are direct `Tendsto.mono_left` and package-field reuse.  Remaining
Chapter 1 arbitrary-map work is the deeper nonmeasurable outer-cover,
asymptotic-tightness/asymptotic-independence, FDD-converse, and separability
support listed above.

2026-05-05 base filter-refinement follow-up: the convergence foundation now
also has base-level refinement wrappers.  `GlivenkoCantelli.lean` adds
`VdVWConvergesInOuterProbabilityConst.mono_filter` and
`VdVWConvergesInOuterProbability.mono_filter`; `WeakConvergence.lean` adds
`VdVWWeakConvergenceProbabilityMeasures.mono_filter`.  These are direct
`Tendsto.mono_left` closures, but they prevent later subsequence/finer-filter
arguments from depending only on the higher signed-package wrappers.

2026-05-05 a.e.-measurable signed-collapse follow-up: local search found the
lower-level
`VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_aemeasurable` but no
direct signed positive/negative VdV&W wrapper or signed outer/inner-gap
a.e.-measurable collapse.  `WeakConvergence.lean` now adds
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_aemeasurable`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_aemeasurable_comp`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp_aemeasurable`,
and
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_aemeasurable`.
The common-domain and varying-domain signed/lower-shifted/canonical
a.e.-measurable constructors now use these direct a.e.-measurable proofs and
no longer require a countably-generated state-space assumption merely to pass
through `NullMeasurable`.

2026-05-05 product outer-expectation Tonelli follow-up: search found the
needed mathlib APIs `MeasureTheory.lintegral_prod` and
`MeasureTheory.lintegral_prod_symm`, plus product/Fubini wrappers in the local
`ProbabilityMeasure` lane and theorem-local product wrappers in
`Theorem243.lean`, but no general Chapter 1.2 VdV&W nonnegative
outer-expectation product wrapper.  `OuterExpectation.lean` now adds
`VdVWOuterExpectation_prod_eq_lintegral_lintegral_of_aemeasurable`,
`VdVWOuterExpectation_prod_eq_lintegral_lintegral_of_measurable`,
`VdVWOuterExpectation_prod_eq_lintegral_lintegral_symm_of_aemeasurable`, and
`VdVWOuterExpectation_prod_eq_lintegral_lintegral_symm_of_measurable`.
These close the measure-level Tonelli/Fubini bridge for nonnegative
a.e.-measurable product integrands; the exact VdV&W arbitrary-map/perfect-map
product-cover statements remain separate blockers.

2026-05-05 dominated common-cover follow-up: search found mathlib absolute
continuity transport through `Measure.AbsolutelyContinuous.ae_le` and local
`VdVWMeasurableCover.ofAEMeasurable`, but no VdV&W-named dominated common
cover theorem.  `OuterExpectation.lean` now proves
`VdVWMeasurableCover.ofAEMeasurable_ae_eq`,
`VdVWMeasurableCover.ofAEMeasurable_minimal_ae_of_absolutelyContinuous`, and
`VdVWMeasurableCover.ofAEMeasurableDominated`.  This gives the nonnegative
a.e.-measurable core of VdV&W Lemma 1.2.4: a cover constructed under a
dominating measure is a valid minimal cover for every absolutely continuous
measure.  The remaining exact 1.2.4 gap is full arbitrary extended-real
common-cover existence for arbitrary maps.

2026-05-05 family common-cover follow-up: the same dominated-cover layer now
has the family-level existence theorem
`exists_common_measurableCover_of_forall_absolutelyContinuous_aemeasurable`.
It packages the single cover built under the dominating measure and proves
simultaneous minimality for every measure in a dominated family.  This closes
the nonnegative a.e.-measurable reading of VdV&W Lemma 1.2.4; the remaining
gap is still the arbitrary extended-real/nonmeasurable common-cover existence
statement.

2026-05-05 bounded `EReal` common-cover follow-up:
`VdVWBoundedERealMeasurableCover.exists_common_boundedERealMeasurableCover_of_measurable`
now records the measurable bounded extended-real case: a bounded measurable
`EReal` map is its own simultaneous minimal cover for any family of measures.
This closes the measurable-map extended-real common-cover clause while keeping
the arbitrary/nonmeasurable existence theorem as the remaining 1.2.4 gap.

2026-05-05 bounded `EReal` dominated-cover follow-up:
`VdVWBoundedERealMeasurableCover.ofAEMeasurable`,
`.ofAEMeasurable_ae_eq`,
`.ofAEMeasurable_minimal_ae_of_absolutelyContinuous`,
`.ofAEMeasurableDominated`, and
`.exists_common_boundedERealMeasurableCover_of_forall_absolutelyContinuous_aemeasurable`
now extend the bounded extended-real common-cover layer from measurable maps
to maps that are a.e.-measurable under a dominating measure.  This mirrors the
nonnegative dominated-family theorem and leaves only the genuinely arbitrary
nonmeasurable extended-real common-cover existence clause open for Lemma 1.2.4.

2026-05-05 product projection cover follow-up: search found no existing exact
VdV&W perfect-map theorem in mathlib or local `StatInference`, but mathlib's
product-a.e. section APIs (`Measure.ae_prod_iff_ae_ae` and
`Measure.ae_ae_comm`) are enough for the measurable-target core of Lemma
1.2.5.  `VdVWMeasurableCover.fstProductOfMeasurable` and
`.sndProductOfMeasurable` now prove that first/second coordinate pullbacks of
a nonnegative measurable cover remain minimal measurable covers on the product
space.  The remaining 1.2.5 gap is the full arbitrary-map perfect projection
statement, where the required majorization set need not be measurable.

2026-05-05 product projection expectation follow-up:
`VdVWOuterExpectation_prod_fst_eq_of_measurable` and
`VdVWOuterExpectation_prod_snd_eq_of_measurable` now package the corresponding
probability-product outer-expectation invariance for measurable nonnegative
targets.  This is the expectation-level form needed when adjoining an ignored
probability-coordinate product factor; it still deliberately does not claim
full arbitrary-map perfectness.

2026-05-05 product projection a.e.-measurable expectation follow-up:
`VdVWOuterExpectation_prod_fst_eq_of_aemeasurable` and
`VdVWOuterExpectation_prod_snd_eq_of_aemeasurable` extend the same
probability-product outer-expectation invariance to a.e.-measurable
nonnegative targets, using `AEMeasurable.comp_fst`/`.comp_snd` and Tonelli.
This closes the null-measurable/a.e.-measurable product-coordinate branch
while keeping the full arbitrary perfect-map statement open.

2026-05-05 product projection inner-expectation follow-up:
`VdVWInnerExpectation_prod_fst_eq_of_measurable`,
`VdVWInnerExpectation_prod_snd_eq_of_measurable`,
`VdVWInnerExpectation_prod_fst_eq_of_aemeasurable`, and
`VdVWInnerExpectation_prod_snd_eq_of_aemeasurable` now package the matching
probability-product inner-expectation invariance for measurable and
a.e.-measurable nonnegative coordinate pullbacks.  The proofs reuse the
outer-expectation product projection invariance plus the measurable/a.e.-
measurable outer-inner collapse, so this is a Chapter 1.2 cleanup rather than
a new perfect-map primitive.  The remaining 1.2.5 gap is still the full
arbitrary-map perfect projection theorem.

2026-05-05 FDD forward-direction follow-up: the empirical-process namespace now
has a VdV&W 1.4.8-named forward finite-dimensional weak-convergence wrapper,
`vdVW148_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`.
It reuses the already compiled
`VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict` theorem to
state that weak convergence of process laws implies weak convergence of each
finite-coordinate restriction.  Search record: local ProbabilityMeasure and
EmpiricalProcess weak-convergence layers already had the measure-level
restriction theorem, while the local `FiniteDimensional.lean` file only
exposed process-law and `IdentDistrib` uniqueness wrappers.  This closes the
forward FDD handoff in the VdV&W-named namespace; the FDD weak-convergence
converse remains a genuine blocker requiring tightness, separability, and
asymptotic-measurability/process primitives.

2026-05-05 bounded-continuous uniqueness follow-up: the Chapter 1 weak
convergence file now has the VdV&W 1.3.12(i)-named finite-measure uniqueness
wrapper
`vdVW1312_measure_ext_of_forall_boundedContinuous_integral_eq`.  It reuses
pinned mathlib's
`MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure`, whose hypotheses
are finite Borel measures on `HasOuterApproxClosed` spaces.  Search record:
local ProbabilityMeasure/EmpiricalProcess weak-convergence files did not have
the VdVW 1.3.12 wrapper, while pinned mathlib had the exact finite-measure
bounded-continuous integral uniqueness theorem.  The vector-lattice/tight
variant in VdV&W 1.3.12(ii) remains pending.

2026-05-05 bounded-continuous generated-sigma follow-up: the Chapter 1 weak
convergence file now has VdV&W 1.3.1 local wrappers:
`vdVW131_measurableSet_isClosed_of_forall_boundedContinuous_measurable`,
`vdVW131_borel_le_of_forall_boundedContinuous_measurable`, and
`vdVW131_borel_le_iff_forall_boundedContinuous_measurable`.  They prove the
metric-space statement that the Borel sigma-field is the least sigma-field
making all bounded-continuous real functions measurable.  Search record:
pinned mathlib supplied `borel_eq_generateFrom_isClosed`,
`Metric.continuous_infDist_pt`, and `IsClosed.mem_iff_infDist_zero`, but no
VdVW-named bounded-continuous generated-sigma wrapper existed locally.

2026-05-05 tightness component follow-up: the Chapter 1 weak-convergence file
now has the VdV&W 1.3.2-named tightness component
`vdVW132_complete_separable_probabilityMeasure_tight`, reusing the compiled
`vdVWProbabilityMeasuresTight_singleton` / mathlib `IsTightMeasureSet`
foundation.  This proves the complete separable metric-type probability
measure tightness direction.  The full VdV&W 1.3.2 equivalence between
pre-tightness and separability, the complete-space equivalence with tightness,
and the Polish-measure formulation still require local definitions for
pre-tight/separable/Polish probability measures before an exact theorem can be
claimed.

2026-05-05 product Borel-space follow-up: the empirical-process
finite-dimensional file now has the VdV&W 1.4.1 wrapper
`vdVW141_prod_borel_eq_product_borel`.  It states that for separable
pseudometric Borel spaces the product measurable space equals the Borel
sigma-field of the product topology, reusing mathlib's `Prod.borelSpace` and
the separable-pseudometric second-countability route.  The stronger VdV&W
1.4.2 uniqueness theorem from nonnegative Lipschitz product tests remains open.

2026-05-05 current proof batch: the selected finite-net tail/UI gap now has
the pointwise and integrated analytic reduction needed for the
non-deterministic entropy route.  New compiled declarations:
`vdVWTheorem243FiniteNetHoeffdingUpper_le_six_mul_M_mul_one_add_logCardinality_div`,
`vdVWTheorem243FiniteNetHoeffdingUpper_tail_subset_logCardinality_div_tail`,
and
`vdVWTheorem243FiniteNetHoeffdingUpper_tail_indicator_le_logCardinality_div_tail_indicator`,
plus the integrated bridge
`finiteNetHoeffdingUpper_tailExpectation_condition_of_logCardinality_div_tailExpectation`
and selected-package constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_tailExpectation`.
They prove that the Hoeffding finite-net upper is dominated by
`6 M * (1 + log(cardinality + 1) / n)`, and that its large-tail event and
tail integrand are controlled by the corresponding normalized-log tail; the
integrated theorem turns explicit normalized-log affine tail/UI into the
finite-net Hoeffding tail/UI field required by the selected fixed-radius
Theorem 2.4.3 side-condition package.  Search record: local code already had
the generic varying-domain tail-expectation mean theorem, deterministic bound
adapters
`vdVWTheorem243FiniteNetHoeffdingUpper_le_of_logCardinality_div_le` and
`finiteNetHoeffdingUpper_tailExpectation_condition_of_bound`; pinned mathlib
supplies the real square-root order API but no varying-domain UI theorem that
turns random entropy in probability into tail expectation.  Next exact edit:
derive the normalized-log affine tail/UI and integrability hypotheses from the
textbook entropy assumption, or record the missing uniform-integrability
theorem shape if convergence in outer probability is insufficient without an
extra structural bound.

2026-05-05 current proof batch: the direct book-shaped variable-entropy route
with honest selected finite-net tail/UI side conditions now compiles in
`Theorem243.lean`.  The new declaration
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_tailExpectation`
feeds
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM` and explicit
selected finite-net integrability/tail-expectation hypotheses into the
already compiled fixed-radius/untruncation Theorem 2.4.3 consumer.  Search
record: local code already had
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions`,
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_tailExpectation_convergesInOuterProbabilityConst`,
and bounded deterministic-log tail/UI adapters; pinned mathlib has
fixed-domain `UniformIntegrable`/Vitali APIs but no ready varying-domain
`SampleAt Observation n` selected finite-net UI theorem.  This closes manual
tail-side-condition packaging for the random-entropy branch but does not prove
that the textbook random entropy hypothesis alone implies the required
tail/UI.  The next target remains exactly that analytic bridge, or an honest
structural entropy theorem deriving a deterministic bound.

2026-05-05 proof follow-up: the first `NullMeasurable` bridge for the
countability/P-measurability mismatch is now compiled.  New declarations:
`VdVWConvergesInOuterProbabilityConst.congr_ae`,
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_nullMeasurable`,
and the Theorem 2.4.3 consumer
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pMeasurableClass_convergesInOuterProbabilityConst`.
Search/reuse record: pinned mathlib supplies
`MeasureTheory.NullMeasurable.aemeasurable`, `AEMeasurable.mk`,
`Measure.map_congr`, `Measure.isProbabilityMeasure_map`, and the existing
local measurable Dirac bridge.  This closes the law-convergence layer for
`P`-measurable centered finite-product suprema without a countability
assumption.  It does not yet close the signed arbitrary-map endpoint, because
that still needs a null-measurable/outer-inner-gap asymptotic-measurability
variant for the original statistic rather than only the pushforward law.

2026-05-05 second null-measurable follow-up: the outer/inner-gap half of that
remaining signed endpoint is now compiled.  New declarations:
`VdVWMeasurableLowerCover.ofAEMeasurable`,
`VdVWOuterExpectation_eq_innerExpectation_of_aemeasurable`,
`VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_aemeasurable`,
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_nullMeasurable`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_nullMeasurable`,
and
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_nullMeasurable`.
Search/reuse record: local `VdVWMeasurableCover.ofAEMeasurable` already
supplied the upper cover; the new lower cover mirrors it using the same
`AEMeasurable.mk` representative and `toMeasurable` hull.  Pinned mathlib
supplies `NullMeasurable.aemeasurable`, `Measurable.comp_nullMeasurable`, and
`lintegral_congr_ae`.  The next missing bridge is now sharper: prove the
signed positive/negative outer expectation of a null-measurable bounded real
test equals the ordinary integral/pushforward-law integral, then combine it
with the already compiled null-measurable Dirac law convergence.

2026-05-05 third null-measurable follow-up: the `P`-measurable signed endpoint
bridge is now compiled.  New declarations:
`VdVWOuterExpectation_eq_lintegral_of_aemeasurable`,
`VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_aemeasurable`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_nullMeasurable`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp_nullMeasurable`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq_nullMeasurable`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps_nullMeasurable`,
`VdVWConvergesInOuterProbabilityConst.to_signedBoundedContinuousVaryingDomains_real_of_nullMeasurable`,
and the Theorem 2.4.3 consumer
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pMeasurableClass_convergesInOuterProbabilityConst`.
Search/reuse record: local `VdVWMeasurableCover.ofAEMeasurable`,
`VdVWOuterExpectation_eq_lintegral_cover`, the existing measurable signed
bridge, and the null-measurable Dirac-law bridge were reused; pinned mathlib
supplied `AEMeasurable.ennreal_ofReal`, `NullMeasurable.aemeasurable`,
`lintegral_congr_ae`, `integral_eq_lintegral_pos_part_sub_lintegral_neg_part`,
and `integral_map`.  Mathlib requires `MeasurableSpace.CountablyGenerated S`
for the general null-measurable pushforward map bridge; the real-valued
Theorem 2.4.3 endpoint has that instance.

Latest override, 2026-05-05, repository head `633efcc`: the active Codex
`/goal` object is broad and cannot be edited in place, so this paragraph is
the operational goal prompt for the next run.  Continue the full Chapter 1-2
formalization in dependency order, but start from the verified state: the
strong countable full-subgraph Theorem 2.4.3/Lemma 2.4.5 packages, the signed
positive/negative outer-expectation bridge, the signed bounded-continuous
arbitrary-map weak-convergence package, the common-domain
outer-probability-to-signed-weak-convergence bridge, and the varying-domain
signed weak-convergence/asymptotic-measurability interfaces are compiled.  The
real-valued varying-domain Dirac-law bridge is also compiled as
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real`,
with the direct signed endpoint consumer
`VdVWConvergesInOuterProbabilityConst.to_signedBoundedContinuousVaryingDomains_real`.
The concrete Theorem 2.4.3 finite-product centered-supremum adapter is compiled
as
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_convergesInOuterProbabilityConst`.
The next proof batch should now return to the exact textbook mismatches:
random-entropy selected finite-net tail/UI from the book entropy condition,
arbitrary `P`-measurable/asymptotic-measurable class support beyond countable
coordinate-measurable classes, and any nonmeasurable outer-cover envelope
variants required by the final statement.

Search/reuse record for this closed bridge: local code had no exact theorem
from varying-domain `VdVWConvergesInOuterProbabilityConst` to Dirac weak
convergence.  The proof reuses `Measure.dirac.isProbabilityMeasure`,
`integral_dirac'`, `integral_map`,
`ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`,
`BoundedContinuousFunction` measurability/boundedness, and the local
`tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`
bounded nonnegative integral convergence theorem, applied to
`ω ↦ |f (X i ω) - f c|`.

As of 2026-05-05, after syncing to repository head `f3424f9`, the active
`/goal` should be interpreted as:

> Finish VdV&W Chapters 1-2 in Lean by dependency order, with proof-hole-free
> code, search-first reuse of pinned mathlib and local `ProbabilityMeasure`,
> and no exact textbook claim until the corresponding theorem statement
> compiles.  Do not spend more runs on endpoint packaging already closed by
> the strongest compiled Theorem 2.4.3/Lemma 2.4.5 endpoints:
> `VdVWTheorem243_fullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`,
> `VdVWTheorem243_logCardinality_div_tendsto_bound_pGlivenkoCantelli_and_inMean`,
> `VdVWOrderDualSubmartingaleConvergenceHandoff.proved`, and
> `VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable`.
> The next high-capacity proof batches are, in order:
> (1) extend the new signed positive/negative outer-expectation bridge into the
> full signed bounded-continuous arbitrary-map/asymptotic-measurability
> foundation, connecting it to the existing lower-shifted/canonical
> bounded-continuous asymptotic-measurability predicates;
> (2) use that signed foundation to state/prove the honest arbitrary-map weak
> convergence/asymptotic-measurability wrappers needed by exact VdV&W Chapter 1
> and by Theorem 2.4.3 without countability-only assumptions;
> (3) remove or explicitly isolate the remaining Theorem 2.4.3 textbook
> mismatch by proving the random-entropy selected finite-net tail/UI theorem
> from the book entropy condition, or by recording the exact missing theorem
> shape after real Lean/search attempts; and
> (4) instantiate the already compiled full-subgraph/structural-rate consumers
> for concrete textbook class hypotheses only when a Chapter 1-2 theorem or
> theorem-critical example needs that instantiation.  The full-subgraph VC
> consumer itself is no longer a missing bridge: it is compiled under
> `VdVWUniformSubgraphVCBound` in
> `VdVWTheorem243_fullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`.

The Codex `/goal` tool currently exposes only completion updates for an active
goal, so this section is the authoritative refreshed target text for the
ongoing goal until the tool objective can be recreated.

2026-05-05 live recalibration: repository head is `f3424f9`; the latest VdVW
proof commit remains `407962b Add asymptotic measurability filter closures`,
and `f3424f9` only updates the parallel optimization docs.  The active tool
goal remains broad because the `/goal` API cannot edit an active objective in
place.  Operationally, the next proof run should start with the signed
positive/negative outer-expectation bridge in `WeakConvergence.lean` or an
equally direct arbitrary-map/asymptotic-measurability closure; it should not
reopen solved Theorem 2.4.3 endpoint-packaging work.

2026-05-05 follow-up: the signed positive/negative outer-expectation bridge is
now compiled in `WeakConvergence.lean`.  New declarations are
`VdVWSignedOuterExpectationPosNeg`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_measurable`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_measurable_comp`,
`VdVWSignedOuterExpectationPosNeg_eq_integral_of_boundedContinuous_comp`,
`VdVWWeakConvergenceSignedOuterBoundedContinuous`, and
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_id`.
Search/reuse record: local `OuterExpectation.lean` already had
`VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_measurable`; pinned
mathlib has `BoundedContinuousFunction.integrable` on finite measure spaces and
`Integrable.of_bound`, but no VdV&W signed arbitrary-map weak-convergence API.
The next target is therefore not to recreate this bridge, but to connect the
signed-outer predicate to the existing asymptotic-measurability predicates and
then state/prove the exact arbitrary-map weak-convergence wrappers.

2026-05-05 second signed follow-up: the signed-outer bounded-continuous
weak-convergence predicate now has law-level and convergence-in-distribution
feeders:
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_hasLaw`,
and `vdVWTendstoInDistribution_to_signedOuterBoundedContinuous`.  Search/reuse
record: pinned mathlib supplies `integral_map`, `Measure.isProbabilityMeasure_map`,
and `TendstoInDistribution.tendsto`; local `ProbabilityMeasure` wrappers and
`HasLaw` APIs provide the map-law bridge.  This closes the measurable
arbitrary-map law-convergence route for signed bounded-continuous tests.  The
remaining Chapter 1 primitive is now sharper: extend this signed-outer
weak-convergence layer to the exact VdV&W asymptotic-measurability/outer-inner
gap formulation for nonmeasurable maps, and then use it to reduce the
countability/measurability mismatch in Theorem 2.4.3.

2026-05-05 third signed follow-up: the signed-outer bounded-continuous
weak-convergence predicate is now stable under continuous maps via
`VdVWWeakConvergenceSignedOuterBoundedContinuous.comp_continuous`.  The proof
reuses `BoundedContinuousFunction.compContinuous`, `ProbabilityMeasure.map`,
and pinned mathlib `integral_map` to identify the pushed-forward limit
integral.  This closes the signed-outer continuous-mapping layer for
measurable/arbitrary-map weak convergence.  The next useful proof step should
target the remaining exact VdV&W gap: a signed outer/inner expectation-gap or
asymptotic-measurability predicate strong enough for nonmeasurable maps, not
another measurable law-convergence or continuous-map wrapper.

2026-05-05 `/goal` recalibration after pushed head `f948c5b`: the editable
target is now this blocker plan, because the active `/goal` tool objective is
broad and cannot be rewritten without completing it.  Do not spend further
runs on measurable signed law feeders, continuous-map wrappers, Theorem 2.4.3
finite-net/Hoeffding/Mills/untruncation/reverse-cofiltration packaging, or
full-subgraph endpoint wrappers unless a final exact statement directly
consumes them.  The next high-value proof batch should build the missing
signed outer/inner expectation-gap or asymptotic-measurability predicate for
bounded-continuous real tests of arbitrary maps, prove its measurable-map
collapse from the existing positive/negative layer, and connect it to
`VdVWWeakConvergenceSignedOuterBoundedContinuous`.  After that, return to the
exact Theorem 2.4.3 mismatch: remove countability/coordinate-measurability via
that Chapter 1 primitive, or prove the random-entropy selected finite-net
tail/UI theorem without deterministic log-cardinality boundedness.

2026-05-05 signed asymptotic-measurability follow-up: the next bridge in that
plan is now compiled.  New declarations are
`VdVWSignedBoundedContinuousOuterInnerExpectationGap`,
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_of_measurable`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_measurable`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.comp_continuous`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.mono_filter`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.comp_continuous`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_map_eq`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_hasLaw`,
and `vdVWTendstoInDistribution_to_signedBoundedContinuousArbitraryMap`.
Search/reuse record: local `OuterExpectation` supplied the nonnegative
outer/inner gap collapse; pinned mathlib supplied bounded-continuous
composition, `integral_map`, `HasLaw`, and `TendstoInDistribution` law
convergence.  The next target should consume this bridge in the Theorem 2.4.3
alignment layer or extend it only where exact VdV&W nonmeasurable
outer-cover/asymptotic-tightness clauses require stronger primitives.

2026-05-05 outer-probability consumption follow-up: the signed arbitrary-map
package now consumes the existing common-domain VdV&W outer-probability
convergence bridge.  New declaration:
`VdVWConvergesInOuterProbability.to_signedBoundedContinuousArbitraryMap`.
It composes `tendstoInDistribution_of_vdVWConvergesInOuterProbability` with
`vdVWTendstoInDistribution_to_signedBoundedContinuousArbitraryMap`, so any
measurable common-domain outer-probability endpoint can now be promoted to the
proof-carrying signed bounded-continuous arbitrary-map weak-convergence layer.
The remaining Theorem 2.4.3 consumption issue is the sample-size-varying
domain in the current finite-product centered-supremum endpoints; handling it
requires either a varying-domain law convergence primitive to `δ_0`, or a
canonical infinite-product projection of those endpoints before applying this
common-domain bridge.

2026-05-05 varying-domain follow-up: the sample-size-varying side of that
blocker now has a compiled signed weak-convergence interface.  New
declarations are
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_measurable`,
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq`,
and
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps`.
Search/reuse record: no local/mathlib varying-domain signed weak-convergence
predicate existed; the proof reuses the existing signed positive/negative
outer-expectation measurable-collapse theorem and the mathlib `integral_map`
law transport.  The next exact target is now narrower: prove weak convergence
of the pushforward laws for finite-product centered-supremum statistics to
`δ_0` from `VdVWConvergesInOuterProbabilityConst`, or project those statistics
to a canonical common domain and use the already compiled common-domain
outer-probability bridge.

2026-05-05 status check: this run started from VdVW head `4903594` and pushed
the merged verified head `57c0b80`; the active `/goal` tool objective remains
broad but cannot be edited in place.
The code search confirms the reverse/cofiltration route and the strong
countable full-subgraph Theorem 2.4.3/Lemma 2.4.5 packages are compiled.  It
also confirms there is no local exact `VdVWAsymptoticMeasurable` primitive yet;
`WeakConvergence.lean` is still measure-level, while `PMeasurable.lean`
contains the countable and pointwise-separable routes for Definition 2.3.3.
Therefore the next `/goal` work should alternate only between exact theorem
assumption removal for Theorem 2.4.3 and the Chapter 1 arbitrary-map
measurability primitives needed to state that theorem without countability.
As a first foundation closure in that direction,
`VdVWOuterExpectation_eq_innerExpectation_of_measurable`,
`VdVWOuterExpectation_eq_innerExpectation_of_measurable_ofReal`, and
`VdVWOuterExpectation_eq_innerExpectation_of_measurable_comp` collapse the
nonnegative outer/inner expectation gap for measurable test compositions.

2026-05-05 follow-up: search of local `StatInference` and pinned mathlib for
`Asymptotic`, `asymptotic`, `outer.*inner`, and `VdVWAsymptotic` found no
existing VdV&W asymptotic-measurability primitive.  Pinned mathlib has general
asymptotics and measure-theoretic measurability APIs, but not the VdV&W
outer/inner expectation-gap formulation.  The nonnegative foundation is now
compiled in `WeakConvergence.lean` as
`VdVWNonnegativeOuterInnerExpectationGap`,
`VdVWNonnegativeOuterInnerExpectationGap_eq_zero_of_measurable`,
`VdVWAsymptoticallyMeasurableNonnegative`,
`VdVWAsymptoticallyMeasurableNonnegative.of_forall_measurable_comp`, and
`VdVWAsymptoticallyMeasurableNonnegative.of_forall_measurable`.  This is not
the full signed bounded-continuous textbook definition, but it removes the
first proof obstacle: measurable nonnegative test compositions are
automatically asymptotically measurable in the outer/inner-gap sense.

2026-05-05 second follow-up: the asymptotic-measurability foundation now also
has lower-shifted real-test and bounded-continuous local layers:
`VdVWLowerShiftedRealOuterInnerExpectationGap`,
`VdVWLowerShiftedRealOuterInnerExpectationGap_eq_zero_of_measurable`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal.of_forall_measurable_comp`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal.of_forall_measurable`,
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted`, and
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.of_forall_measurable`.
These declarations move Definition 1.3.7 closer to the textbook bounded
continuous test class while honestly keeping the missing signed arbitrary-map
outer expectation as a remaining primitive.

2026-05-05 third follow-up: pinned mathlib exposes the needed bounded
continuous lower-bound API as
`BoundedContinuousFunction.neg_norm_le_apply`.  The local bounded-continuous
layer now has the canonical shift declarations
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted`,
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_lowerShifted`,
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_forall_measurable`.
This removes the extra supplied lower-bound parameter for bounded continuous
tests by using the automatic lower bound `-‖f‖`.

2026-05-04 `/goal` status correction: local scratch now registers the exact
remaining reverse-time theorem as the generic proposition
`VdVWOrderDualSubmartingaleConvergenceHandoff`.  The theorem-facing consumer
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_orderDualSubmartingaleConvergence`
compiles against the VdV&W-specific shifted permutation-symmetric
cofiltration submartingale and the envelope `L¹`/`eLpNorm` bound.  Follow-up
correction: this generic handoff now requires a finite `ℝ≥0` seminorm bound,
matching mathlib's L¹-bounded submartingale convergence theorem; the VdV&W
consumer supplies that finite bound from `2 * ∫ envelope dP` using envelope
nonnegativity.  Therefore the next proof target should be the generic
reverse-time convergence theorem itself, or an equivalent reindexing of an
`ℕᵒᵈ` submartingale into an ordinary mathlib `ℕ`
submartingale/supermartingale convergence theorem.  Do not spend the next run
on already-closed cofiltration construction, adaptedness, textbook comparison,
leave-one-out notation, finite-cover entropy, grid/VC packaging, or
finite-class SLLN endpoints.

2026-05-04 follow-up: the safe finite-window reindexing route is now compiled
as `vdVWOrderDualFiniteHorizonFiltration` and
`submartingale_vdVWOrderDualFiniteHorizon`.  For each fixed horizon `N`, the
ordinary process `k ↦ f (OrderDual.toDual (N-k))` is a mathlib
`Submartingale` over the reversed finite-horizon filtration.  This is the
right substrate for the reverse-upcrossing proof.  The ordinary-time
filtration `n ↦ ℱ (OrderDual.toDual n)` is decreasing and must not be treated
as a mathlib `Filtration ℕ`.
The finite-window quantitative estimate is now also compiled as
`vdVWOrderDualFiniteHorizon_mul_integral_upcrossingsBefore_le_integral_pos_part`,
specializing mathlib's ordinary Doob upcrossing inequality to the reversed
finite-window process.  Next proof target: relate ordinary upcrossings of
`n ↦ f (OrderDual.toDual n)` up to `N` to the corresponding finite-horizon
reversed-window estimate, then pass to the global reverse-time convergence
handoff.

2026-05-04 follow-up: the ordinary supermartingale convergence sign adapter is
now compiled as `vdVW_supermartingale_exists_ae_tendsto_of_eLpNorm_bdd`.
Search/reuse record: pinned mathlib has
`Submartingale.exists_ae_tendsto_of_bdd`, `Supermartingale.neg`, and
`eLpNorm_neg`, but no standalone
`Supermartingale.exists_ae_tendsto_of_bdd`.  The new local theorem is proved
by negating into the pinned submartingale convergence theorem and then
negating the pointwise limit back.  This does not close the reverse
cofiltration theorem, but it removes a sign-only obstacle for attempts that
reindex the `ℕᵒᵈ` process into an ordinary supermartingale.  The active
blocker remains the reverse/upcrossing or reindexing theorem for
`VdVWOrderDualSubmartingaleConvergenceHandoff`; do not count this adapter as a
proof of Lemma 2.4.5.

2026-05-04 follow-up: the reverse-crossing convergence reduction is now
compiled.  New declarations are `vdVW_tendsto_of_downcrossings_lt_top` and
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_ae_lt_top`.  The first
is a deterministic criterion: bounded liminf plus finite downcrossings of
`f` imply convergence, by applying mathlib's
`tendsto_of_uncrossing_lt_top` to `-f`.  The second applies mathlib
`ae_bdd_liminf_atTop_of_eLpNorm_bdd` to an `ℕᵒᵈ` submartingale read as
`n ↦ f (OrderDual.toDual n)`, so the remaining generic handoff is reduced to
a.e. finiteness of the reverse downcrossing counts
`upcrossings (-(b : ℝ)) (-(a : ℝ)) (fun n ω => -f (OrderDual.toDual n) ω)`.
Next exact proof target: derive this downcrossing finiteness from the compiled
finite-window estimate
`vdVWOrderDualFiniteHorizon_mul_integral_upcrossingsBefore_le_integral_pos_part`,
or show that a different reindexing into an ordinary sub/supermartingale
constructor is shorter.

2026-05-04 follow-up: the total-upcrossing layer is now removed from the
remaining order-dual proof obligation.  The compiled theorem
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossingsBefore_bound` consumes
the finite-prefix form
`∃ K, ∀ N, upcrossingsBefore (-(b : ℝ)) (-(a : ℝ))
  (fun n ω => -f (OrderDual.toDual n) ω) N ω ≤ K`
for every rational `a < b`, then applies
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_ae_lt_top` via
mathlib `upcrossings_lt_top_iff`.  The next target is therefore the exact
finite-prefix reverse-downcrossing bound from the finite-window estimates,
including the deterministic comparison between a downcrossing of
`n ↦ f (OrderDual.toDual n)` on `[0, N]` and an upcrossing of the reversed
finite-window process `k ↦ f (OrderDual.toDual (N-k))`.

2026-05-04 follow-up: the expected-crossing version is now compiled as
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_lintegral_lt_top`.
Search/reuse record: mathlib provides `StronglyAdapted.measurable_upcrossings`,
`Filtration.stronglyAdapted_natural`, and `ae_lt_top`, but no reverse
cofiltration convergence theorem.  The new consumer builds the natural
filtration of the ordinary reverse signed process
`g n ω = -f (OrderDual.toDual n) ω`, uses the submartingale's coordinate
strong measurability to get measurability of total reverse downcrossing counts,
and turns finite lintegral of those counts into the a.e. finiteness input
required by `vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_ae_lt_top`.
Next target: prove the finite lintegral hypotheses from the finite-window Doob
estimate or from a deterministic comparison plus monotone convergence.

2026-05-04 follow-up: the finite-window analytic side is now compiled.
`vdVW_submartingale_lintegral_upcrossings_lt_top` exposes the lintegral
finiteness consequence inside mathlib's ordinary submartingale convergence
proof, and `vdVWOrderDualFiniteHorizon_lintegral_upcrossings_lt_top`
specializes it to every reversed finite horizon
`k ↦ f (OrderDual.toDual (N-k))` of an `ℕᵒᵈ` submartingale under the same
uniform `eLpNorm` bound.  Thus the remaining nontrivial step on this route is
not analytic boundedness; it is the deterministic/monotone comparison that
transfers these finite-horizon upcrossing bounds to the total reverse
downcrossing lintegral consumed by
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_lintegral_lt_top`.

2026-05-04 follow-up: the same analytic side is now available with an explicit
uniform bound.  New declarations are `vdVW_submartingale_lintegral_upcrossings_le`
and `vdVWOrderDualFiniteHorizon_lintegral_upcrossings_le`, proving
`∫⁻ upcrossings ≤ (R + ‖a‖₊ * μ univ) / ENNReal.ofReal (b - a)` for ordinary
submartingales and for every reversed finite horizon of an `ℕᵒᵈ`
submartingale.  This removes the possible weakness that each finite horizon
was only known finite separately.  The remaining blocker is now exactly:
prove the deterministic reversal/monotone comparison that bounds total
reverse downcrossings by the supremum/limit of the finite-horizon reversed
upcrossing counts so this uniform lintegral bound can pass to
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_lintegral_lt_top`.

2026-05-04 `/goal` target update: the live non-finite-class frontier is no
longer inverse-radius entropy, finite-cover selection, VC/subgraph packaging,
untruncation, finite-class GC, or leave-one-out notation.  Those layers are
compiled.  The active theorem-facing blocker is exactly the named
textbook-display Lemma 2.4.5 reverse/cofiltration primitive
`VdVWLemma245TextbookReverseCofiltrationHandoff`: prove that the VdV&W
comparison
`E[‖P_n - P‖_F^* | Σ_{n+1}] ≥ ‖P_{n+1} - P‖_F^*` over the decreasing
permutation-symmetric fields implies a.e. finite convergence of the centered
empirical supremum.  The preferred downstream consumer is
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_textbookReverseCofiltrationHandoff`.
The next proof attempt should target the reverse/cofiltration theorem itself,
or one of its already-compiled ordinary sub/supermartingale constructor
hypotheses, using the actual `Σ_n` cofiltration.  Do not add more wrappers
around natural filtrations, inverse-radius entropy, finite-cover witnesses, or
finite-class endpoints unless a Lean proof attempt shows they directly close
this named blocker.

Policy update: exact example closures are deferred by default.  The Example
2.4.2 empirical-CDF quantile-grid blocker below is preserved because it has a
large compiled local layer and may be useful later, but it should not block the
main theorem-line queue unless a later theorem explicitly needs this exact
example.

Chapter 1 weak-convergence, tightness, product-space, stochastic-process, and
Hilbert results are fundamental foundation-lane work, not a skip bucket.  For
each such item, first search pinned mathlib and local Lean code, then either
wrap/prove the mathlib-backed statement or record the precise missing VdV&W
primitive.  Only exact arbitrary-map, nonmeasurable, perfect-map, or
representation statements with no available local/mathlib theorem should be
marked `blocked-vdvw`.  Do not add committed `sorry` placeholders for any of
these items; promoted Lean statements must be proof-hole-free.

Current correction layer: `StatInference/EmpiricalProcess/WeakConvergence.lean`
now compiles mathlib-backed VdV&W-local wrappers for measure-level weak
convergence, bounded-continuous integral characterization, continuous mapping,
Portmanteau closed/open implications, probability-measure tightness, Prokhorov
compact-closure, and measurable common-domain Slutsky/product convergence.  This
closes the "mathlib exists but not named locally" part for those Chapter 1
foundations; the exact arbitrary-map/nonmeasurable outer-expectation extensions
remain separate blockers.

Search record for the Portmanteau/tightness correction layer:

- searched local declarations for `VdVWWeakConvergenceProbabilityMeasures`,
  `Portmanteau`, `IsTightMeasureSet`, `Prokhorov`, and `LevyProkhorov`;
- searched pinned mathlib files
  `Mathlib/MeasureTheory/Measure/Portmanteau.lean`,
  `Mathlib/MeasureTheory/Measure/Tight.lean`,
  `Mathlib/MeasureTheory/Measure/Prokhorov.lean`, and
  `Mathlib/MeasureTheory/Measure/LevyProkhorovMetric.lean`;
- reused `ProbabilityMeasure.limsup_measure_closed_le_of_tendsto`,
  `ProbabilityMeasure.le_liminf_measure_open_of_tendsto`,
  `IsTightMeasureSet`,
  `isTightMeasureSet_iff_exists_isCompact_measure_compl_le`, and
  `isCompact_closure_of_isTightMeasureSet`;
- no new primitive was introduced for these measure-level foundations; the
  remaining blockers are the exact VdV&W arbitrary-map/nonmeasurable and
  asymptotic-measurability extensions.

Search record for the Chapter 1.2 measurable signed bridge:

- searched local `StatInference` for `VdVWOuterExpectation`,
  `VdVWOuterExpectation_eq_lintegral_of_measurable`, signed expectation, positive
  part, and negative part primitives;
- searched pinned mathlib for `ENNReal.ofReal`, `Measurable.ennreal_ofReal`,
  `Integrable`, and the signed Bochner split theorem
  `integral_eq_lintegral_pos_part_sub_lintegral_neg_part`;
- proved the self-contained measurable integrable real case as
  `VdVWOuterExpectation_posPart_sub_negPart_eq_integral_of_measurable` by
  reducing both nonnegative outer expectations to lintegrals.  The remaining
  blocker is not this measurable real case; it is the full VdV&W arbitrary-map
  signed extended-real measurable-cover API.

Search record for the Chapter 1 Hilbert/Gaussian foundation lane:

- searched local `StatInference`, pinned mathlib, pinned Lake support packages,
  and the recorded local open-source Lean checkouts for `HilbertSpace`,
  `InnerProductSpace`, `Gaussian`, `HasGaussianLaw`, `IsGaussianProcess`,
  `CentralLimitTheorem`, `BrownianBridge`, `PreGaussian`, and `Donsker`;
- reusable mathlib foundations found:
  `InnerProductSpace`, `HilbertSpace`, `InnerProductSpace.toDual`,
  `MeasureTheory.Lp`, the `L2` inner-product-space instance,
  `ProbabilityTheory.gaussianReal`,
  `ProbabilityTheory.IsGaussian`, `ProbabilityTheory.HasGaussianLaw`,
  `ProbabilityTheory.IsGaussianProcess`, `ProbabilityTheory.stdGaussian`,
  `ProbabilityTheory.multivariateGaussian`, `HasGaussianLaw.map`,
  `HasGaussianLaw.add`, `HasGaussianLaw.sum`,
  `IsGaussianProcess.hasGaussianLaw_eval`, and the scalar CLT theorems
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum` and
  `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub`;
- no exact pinned theorem was found for Brownian bridge, functional CLT,
  `P`-pre-Gaussian classes, or a full VdV&W `P`-Donsker theorem;
- compiled local wrappers now exist in `HilbertGaussian.lean` for
  complete-inner-product Hilbert spaces, `L2` Hilbert spaces, `L2` inner
  product, Frechet-Riesz dual representatives, Gaussian inner-coordinate maps,
  and Gaussian-process coordinate laws.  The remaining Section 1.8 blocker is
  the exact stochastic-process/Hilbert tightness and functional-CLT layer, not
  these basic Hilbert/Gaussian foundations.
- follow-up `ell_infty(T)` search found the pinned mathlib substrate
  `ℓ^∞(T, ℝ)` / `lp (fun _ : T => ℝ) ∞` in
  `Mathlib.Analysis.Normed.Lp.lpSpace`, with reusable names `Memℓp`,
  `memℓp_infty_iff`, `memℓp_infty`, `Memℓp.bddAbove`,
  `lp.norm_eq_ciSup`, `lp.norm_apply_le_norm`, `lp.norm_le_of_forall_le`,
  `lp.evalCLM`, `lp.uniformContinuous_coe`, and `lp.completeSpace`.  This is
  safe future substrate for a local `VdVWEllInfty` bounded-function-space
  wrapper, but it does not itself prove VdV&W separability, process tightness,
  asymptotic measurability, or Donsker conclusions.  `PiLp` is useful only for
  finite-coordinate/FDD blocks because its normed product API requires a
  finite index type.

Search record for the Chapter 1 ball-sigma/measurability foundation lane:

- searched local `StatInference`, pinned mathlib, pinned Lake support packages,
  and the recorded local open-source Lean checkouts for `BallSigmaField`,
  `borel`, `generateFrom`, metric balls, distance measurability, separability,
  and VdV&W Lemma 1.7.1/Theorem 1.7.2 keywords;
- reusable mathlib/local foundations found:
  `borel`, `borel_eq_generateFrom_of_subbasis`,
  `TopologicalSpace.IsTopologicalBasis.borel_eq_generateFrom`,
  `borel_eq_generateFrom_isClosed`, `OpensMeasurableSpace`, `BorelSpace`,
  `IsOpen.measurableSet`, `IsClosed.measurableSet`, `Metric.ball`,
  `Metric.closedBall`, `measurableSet_ball`, `measurableSet_closedBall`,
  `measurable_dist`, `Measurable.dist`, `SeparableSpace`,
  `exists_countable_dense`, `denseSeq`, `SecondCountableTopology`,
  `Metric.PiNatEmbed.distDenseSeq`, `Metric.PiNatEmbed.continuous_distDenseSeq`,
  `Metric.PiNatEmbed.injective_distDenseSeq`,
  `Metric.PiNatEmbed.continuous_distDenseSeq_inv`, and the local
  `VdVWPMeasurableClass`/pointwise-supremum separability route;
- no exact pinned theorem was found for a named VdV&W ball sigma-field or the
  exact distance-coordinate characterization of arbitrary-map ball
  measurability.  The compiled local `BallSigma.lean` layer now closes the
  open/closed ball sigma-field part with `VdVWClosedBallSets`,
  `VdVWClosedBallMeasurableSpace`, rational open/closed ball bridge lemmas,
  open-ball/closed-ball sigma equality, and Borel equality for the closed-ball
  sigma field.
- a follow-up search confirmed that no exact theorem was found for
  `Measurable X ↔ ∀ n, Measurable fun ω => dist (X ω) (denseSeq S n)`.  The
  reusable route is through `measurableSet_lt`, `measurable_of_Iio`,
  `denseSeq`, `denseRange_denseSeq`, `DenseRange.exists_dist_lt`,
  `Metric.PiNatEmbed.distDenseSeq`, and the local ball-sigma constructors.
  This route is now compiled as
  `vdVW_dist_measurable_openBallSigma`,
  `vdVW_ball_eq_iUnion_denseSeq_dist_sublevel`,
  `vdVW_measurable_openBallSigma_iff_dist_denseSeq`,
  `vdVW_measurable_closedBallSigma_iff_dist_denseSeq`,
  `vdVWOpenBallMeasurable_iff_forall_denseSeq_dist_measurable`,
  `vdVWClosedBallMeasurable_iff_forall_denseSeq_dist_measurable`, and
  `vdVWBorelMeasurable_iff_forall_denseSeq_dist_measurable`.  The remaining
  Section 1.7 blocker is the exact VdV&W arbitrary-map/asymptotic-measurability
  layer, not the separable distance-coordinate criterion.

Search record for the Chapter 1 product/FDD foundation lane:

- searched local `StatInference`, pinned mathlib, pinned Lake support packages,
  and the recorded local open-source Lean checkouts for product spaces,
  product laws, product weak convergence, finite-dimensional laws, projective
  limits, and VdV&W Section 1.4 keywords;
- reusable mathlib/local foundations found:
  `MeasurableSpace.prod`, `Prod.instMeasurableSpace`, `generateFrom_prod`,
  `pi_le_borel_pi`, `prod_le_borel_prod`, `Pi.borelSpace`,
  `Prod.borelSpace`, `Finset.continuous_restrict`,
  `ProbabilityMeasure.prod`, `ProbabilityMeasure.map_prod_map`,
  `ProbabilityMeasure.continuous_prod`, `ProbabilityMeasure.pi`,
  `ProbabilityMeasure.continuous_pi`, `HasLaw`, `IndepFun.hasLaw_prod`,
  `iIndepFun.hasLaw_pi`, `IdentDistrib.prodMk`, `IdentDistrib.pi`,
  `IsProjectiveMeasureFamily`, `IsProjectiveLimit`,
  `IsProjectiveLimit.unique`, `isProjectiveLimit_map`,
  `map_eq_iff_forall_finset_map_restrict_eq`, and
  `identDistrib_iff_forall_finset_identDistrib`;
- directly reusable local wrappers already include
  `VdVWWeakConvergenceProbabilityMeasures.map_continuous`,
  `VdVWWeakConvergenceProbabilityMeasures.prod`,
  `VdVWWeakConvergenceProbabilityMeasures.pi`,
  `VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict`,
  `vdVWTendstoInDistribution_prodMk_of_tendstoInMeasure_const`, and
  `vdVWProductMeasure`; the empirical-process lane also now has
  `vdVW148_processLaw_ext_of_forall_finiteDimensional_eq` and
  `vdVW148_identDistrib_of_forall_finiteDimensional_identDistrib` as
  uniqueness-only FDD wrappers over the local ProbabilityMeasure foundation;
  the Billingsley/ProbabilityMeasure support lane also provides
  `probability_prod_independent_self_copies`,
  `probability_prod_independent_mapped_copies_with_joint_law`, and
  `integral_indicator_tail_lt_tendsto_zero_of_integrable` for the current
  product-copy symmetrization and envelope-tail convergence route;
- no exact theorem was found for VdV&W 1.4.2 product-measure uniqueness from
  nonnegative Lipschitz product tests, 1.4.5 arbitrary-net product weak
  convergence, or the converse direction of 1.4.8 weak convergence iff all
  finite-dimensional distributions converge.  The measure-level product-law
  wrappers over `ProbabilityMeasure.continuous_prod`/`continuous_pi` and the
  finite-coordinate projection wrapper over `Finset.continuous_restrict` are
  now compiled; the remaining Section 1.4 proof work is the exact VdV&W
  arbitrary-map/asymptotic-independence layer and the FDD converse.

## Active Main-Line Primitive Sequence

Textbook anchor: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and
Emperical Process_101-200.md:988`.

Theorem 2.4.3 should be developed through theorem-level primitives, not through
additional example closures:

1. Statement interfaces for the theorem: `P`-measurable class, envelope,
   truncated class `F_M = {x | f x * 1{F x <= M}}`, outer integrability
   `P^* F < ∞`, and the random empirical `L1(P_n)` covering-number condition
   `log N(epsilon, F_M, L1(P_n)) = o_P^*(n)`.

   Status: first fixed-sample empirical covering interface is implemented in
   `StatInference/EmpiricalProcess/CoveringPrimitive.lean`:

   ```lean
   empiricalL1Distance
   empiricalL1Distance_nonneg
   empiricalL1Distance_self
   empiricalL1Distance_comm
   empiricalL1Distance_triangle
   FiniteEmpiricalL1CoverAtCard
   FiniteEmpiricalL1CoverAtCard.centerSet
   FiniteEmpiricalL1CoverAtCard.finite_centerSet
   FiniteEmpiricalL1CoverAtCard.centerSet_subset
   FiniteEmpiricalL1CoverAtCard.exists_center
   HasFiniteEmpiricalL1Cover
   finiteEmpiricalL1CoveringNumberCard
   empiricalL1CoveringNumber
   empiricalL1CoveringNumber_eq_find
   empiricalL1CoveringNumber_find_spec
   empiricalL1CoveringNumber_lt_top_of_hasFinite
   hasFinite_of_empiricalL1CoveringNumber_lt_top
   ```

   The random-sample/path and stochastic-little-o interface is implemented in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   VdVWOuterProbabilityLittleOAtTop
   VdVWOuterProbabilityLittleO_n
   vdVWRandomEmpiricalL1CoveringNumber
   VdVWRandomEmpiricalL1CoveringNumberLeCardinality
   vdVWLogEmpiricalL1CoveringCardinality
   vdVWLogEmpiricalL1CoveringCardinality_nonneg
   VdVWTheorem243EmpiricalEntropyCondition
   VdVWTheorem243EmpiricalEntropyConditionForAllEpsilon
   ```

   The truncated-class/envelope interface is implemented in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   VdVWClassEnvelope
   vdVWTruncatedClassFun
   vdVWTruncatedClassFun_eq_of_envelope_le
   vdVWTruncatedClassFun_eq_zero_of_lt_envelope
   abs_vdVWTruncatedClassFun_le_abs
   abs_vdVWTruncatedClassFun_le_envelope
   abs_vdVWTruncatedClassFun_le_M
   envelope_tail_ofReal_eq_tailProduct
   VdVWOuterExpectation_envelope_tail_le_lintegral_tail_cover
   VdVWOuterProbability_envelope_tail_gt_le_outerExpectation_div
   VdVWOuterExpectation_envelope_tail_eq_lintegral_tail_of_measurable
   lintegral_envelope_tail_lt_tendsto_zero_of_integrable
   VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable
   measurable_vdVWTruncatedClassFun
   VdVWClassCoordinateMeasurable.truncate
   VdVWPMeasurableClass.truncate_of_countable_of_coordinate
   measurable_vdVWTruncatedClassFun_pairDifference
   vdVWTheorem243_productCopy_fst_hasLaw
   vdVWTheorem243_productCopy_snd_hasLaw
   vdVWTheorem243_productCopy_fst_snd_indep
   vdVWTheorem243_productCopy_fst_snd_identDistrib
   integrable_vdVWTruncatedClassFun_pairDifference
   vdVWTheorem243_truncated_productCopy_mapped_hasLaw_indep
   vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep
   VdVWTheorem243TruncatedEntropyCondition
   VdVWTheorem243TruncatedEntropyConditionForAllEpsilonM
   ```

   The latest local layer closes the countable coordinate-measurable
   Definition 2.3.3 gate for the truncated class by combining
   `VdVWClassCoordinateMeasurable.truncate` with
   `VdVWPMeasurableClass.of_countable_of_measurable`, adds a measurable
   product-copy pair-difference integrand for fixed truncated class members,
   and closes the real-valued envelope-tail outer-expectation/probability
   bridge through the existing Chapter 1.2 cover-majorant and Markov layers,
   including measurable-integrable lintegral and outer-expectation convergence
   of `F 1{F > M}` as `M -> ∞`.
   It also reuses the Billingsley/ProbabilityMeasure product-self-copy wrapper
   to give VdVW-facing `P.prod P` first/second-coordinate law, independence,
   identical-distribution wrappers, and fixed truncated pair-difference
   integrability.  It also specializes the reusable mapped-copy product wrapper
   to fixed truncated class members and the new finite-`Pi` mapped-coordinate
   product wrapper to sample-coordinate truncated class functions.  Remaining
   Step 1 work: plug these gates into the full product/Fubini-compatible
   symmetrization inequality.
2. Deterministic fixed-sample net inequality `(2.4.4)` for a finite empirical
   `L1(P_n)` net.

   Status: implemented as a compiled local layer in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   abs_vdVWWeightedSampleSum_sub_le_empiricalL1Distance_of_abs_weight_le
   vdVWWeightedClassSupremum_le_upper_add_of_finiteEmpiricalL1CoverAtCard
   ```

   The proof reuses the Definition 2.3.3 weighted-supremum infrastructure and
   the fixed-sample `FiniteEmpiricalL1CoverAtCard` primitive.  It searches and
   uses pinned mathlib finite-sum APIs including `Finset.abs_sum_le_sum_abs`,
   `Finset.sum_sub_distrib`, `Finset.sum_le_sum`, and `Finset.mul_sum`.
3. Finite-center maximal-inequality handoff for `(2.4.4)`.

   Status: implemented as a compiled local layer in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   vdVWFiniteCenterWeightedSupremum
   vdVWFiniteCenterWeightedSupremum_nonneg
   abs_vdVWWeightedSampleSum_center_le_finiteCenterWeightedSupremum
   vdVWWeightedClassSupremum_le_finiteCenterWeightedSupremum_add_of_finiteEmpiricalL1CoverAtCard
   vdVWTheorem243FiniteNetMaximalUpper
   vdVWTheorem243FiniteNetMaximalUpper_nonneg
   VdVWTheorem243FiniteCenterMaximalBound
   vdVWWeightedClassSupremum_le_finiteNetMaximalUpper_add_of_finiteEmpiricalL1CoverAtCard
   vdVWTheorem243HoeffdingCenterScale
   vdVWTheorem243HoeffdingCenterScale_nonneg
   vdVWTheorem243FiniteNetHoeffdingUpper
   vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_finiteEmpiricalL1CoverAtCard
   ```

   This closes the deterministic bridge from a finite empirical net to the
   book-shaped `sqrt(1 + log #G)` maximal-expression, assuming the
   finite-center maximal bound.  It deliberately does not prove the
   probabilistic Orlicz/Hoeffding bound yet.
4. Orlicz/Hoeffding maximal-inequality layer: prove the finite-center maximal
   bound above from Rademacher signs, Hoeffding/sub-Gaussian tails, and the
   Lemma 2.2.2 `psi_2` maximal inequality.  Search pinned mathlib for
   `SubGaussian`, `Hoeffding`, `Orlicz`, `eLpNorm`, and finite supremum
   inequalities before introducing local primitives.

   Status: the deterministic fixed-Rademacher-sign specialization and first
   probabilistic one-center bridge are now implemented as compiled local layers
   in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   vdVWRademacherBoolPMF
   vdVWBoolToRademacherSign
   vdVWRademacherBoolLaw
   measurable_vdVWBoolToRademacherSign
   vdVWBoolToRademacherSign_eq_neg_one_or_one
   abs_vdVWBoolToRademacherSign_le_one
   integral_vdVWBoolToRademacherSign_eq_zero
   vdVWRademacherPMF
   vdVWRademacherLaw
   vdVWBoolToRademacherSign_hasLaw
   vdVWBoolToRademacherSign_hasSubgaussianMGF
   id_vdVWRademacherLaw_hasSubgaussianMGF
   exists_iid_vdVWRademacherSigns
   VdVWRademacherSignVector
   VdVWRademacherSignVector.abs_le_one
   vdVWRademacherWeights
   abs_vdVWRademacherWeights_le_inv_card
   abs_vdVWRademacherWeights_le_inv_card_of_signVector
   VdVWTheorem243RademacherFiniteCenterHoeffdingBound
   vdVWTheorem243_oneCenter_rademacher_subGaussian_bridge
   vdVWTheorem243_varianceProxy_real_le_of_abs_le
   vdVWTheorem243_truncated_varianceProxy_le
   vdVWTheorem243_hasSubgaussianMGF_mono
   vdVWTheorem243_abs_tail_le_of_hasSubgaussianMGF
   vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF
   vdVWTheorem243_finiteCenter_iSup_abs_tail_le_of_hasSubgaussianMGF_of_pos
   vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF
   vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF_of_pos
   vdVWTheorem243FiniteCenterExpectedSupremum
   vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail
   vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF
   vdVWTheorem243FiniteCenterExpectedSupremum_eq_integral_tail_of_hasSubgaussianMGF_of_pos
   vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_tail_bound
   vdVWTheorem243FiniteCenterExpectedSupremum_le_integral_subGaussian_tail_bound
   vdVWTheorem243_subGaussian_tail_bound_integrable
   vdVWTheorem243_integral_subGaussian_tail_bound_eq
   vdVWTheorem243FiniteCenterExpectedSupremum_le_subGaussian_tail_closedForm
   vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_tail_bound
   vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_integral_subGaussian_tail_bound
   vdVWTheorem243_integral_mul_exp_neg_mul_sq_Ioi_eq
   vdVWTheorem243_integral_exp_neg_mul_sq_Ioi_le_mills
   vdVWTheorem243_integral_subGaussian_exp_tail_le_mills
   vdVWTheorem243_integral_finiteCenter_subGaussian_tail_le_mills
   vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_bound
   vdVWTheorem243FiniteCenterExpectedSupremum_le_radius_add_mills_simplified
   integral_abs_classFun_sub_vdVWTruncatedClassFun_le_envelope_tail
   vdVWTheorem243FiniteCenterExpectedSupremum_nonneg
   vdVWTheorem243FiniteCenterExpectedSupremum_le_of_ae_le
   vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_ae_le
   vdVWTheorem243FiniteCenterExpectedSupremum_le_of_hasSubgaussianMGF_of_pos_of_ae_le
   vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSignVector
   vdVWTheorem243LogRadiusMillsUpper
   vdVWTheorem243LogRadiusMillsUpper_nonneg
   VdVWTheorem243FiniteCenterExpectedMaximalBound
   VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills
   VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le
   VdVWTheorem243FiniteCenterExpectedMaximalBound.of_logRadius_mills_le_finiteNetHoeffdingUpper
   vdVWTheorem243_truncated_rademacher_expectedMaximalBound
   vdVWTheorem243_truncated_rademacher_expectedMaximalBound_of_finiteEmpiricalL1CoverAtCard
   vdVWTheorem243_truncated_commonProxy_pos
   VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale
   vdVWTheorem243_exp_neg_one_le_half
   vdVWTheorem243_logRadius_log_le_succ
   VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale.of_pos
   vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard
   vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_finiteEmpiricalL1CoverAtCard_of_pos
   VdVWTheorem243SymmetrizationPrecursor
   VdVWTheorem243SymmetrizationPrecursor.of_finiteEmpiricalCover
   ```

   This closes the deterministic passage from fixed signs `epsilon_i` to the
   existing finite-net/Hoeffding-scale handoff, and proves the one-center
   random Rademacher weighted sum is sub-Gaussian using mathlib's
   `HasSubgaussianMGF.const_mul` and `HasSubgaussianMGF.sum_of_iIndepFun`.  It
   also proves the deterministic variance-proxy arithmetic and its
   truncated-envelope specialization, bounding the `NNReal` sub-Gaussian proxy
   by `M^2 / n`; the local proxy-monotonicity wrapper
   `vdVWTheorem243_hasSubgaussianMGF_mono` promotes center-specific
   sub-Gaussian proxies to a common larger proxy when needed.  The tail layer
   converts mathlib's one-sided
   `HasSubgaussianMGF.measure_ge_le` into a two-sided absolute-value tail
   bound and then into a finite-center union bound for the supremum over a
   nonempty `Fin cardinality` net, with a companion wrapper from the explicit
   proof `0 < cardinality` that empirical-cover witnesses expose.  The
   iid layer constructs the fair Bool Bernoulli law, pushes it through the
   Bool-to-real sign map to a real Rademacher law, proves its zero-mean
   Hoeffding sub-Gaussian bound, and uses mathlib's iid existence theorem to
   produce finitely many iid real-valued signs together with measurability,
   laws, independence, sub-Gaussian marginals, probability-space structure, and
   almost-sure sign-vector support.  The finite-supremum layer proves
   that the finite supremum of absolute sub-Gaussian center variables is
   integrable, both from a `Nonempty (Fin cardinality)` typeclass and from the
   explicit positive-cardinality proof exposed by empirical-cover witnesses.
   The expected-supremum handoff defines the finite-center expectation, proves
   its nonnegativity for nonempty nets, converts an almost-sure upper bound
   into the corresponding expectation bound using `integral_nonneg`,
   `integral_mono_ae`, `integrable_const`, and the compiled finite-supremum
   integrability layer, exposes layer-cake tail-integral representations via
   `Integrable.integral_eq_integral_meas_le`, proves a monotone tail-bound
   integral handoff, proves integrability and exact evaluation of the
   sub-Gaussian Gaussian majorant using
   `integrable_exp_neg_mul_sq`, `integral_const_mul`, and
   `integral_gaussian_Ioi`, and derives the coarse closed-form expectation
   bound `(cardinality : ℝ) * sqrt (2 * pi * c)`.  The truncation lane also
   now has the ordinary measurable integral bridge from
   `|f - f_M|` to `F 1{F > M}`.  This deliberately does not yet prove the
   sharp split/log tail-to-Orlicz/maximal expectation inequality at the
   textbook scale.

   Search correction: the current
   `VdVWTheorem243RademacherFiniteCenterHoeffdingBound` is a deterministic
   pointwise predicate for a fixed sign vector.  The textbook display uses an
   expectation/Orlicz bound over random Rademacher signs, so the next proof
   should not try to prove that deterministic predicate directly from
   Hoeffding.  Pinned mathlib provides
   `ProbabilityTheory.HasSubgaussianMGF`,
   `HasSubgaussianMGF.const_mul`,
   `HasSubgaussianMGF.sum_of_iIndepFun`,
   `HasSubgaussianMGF.measure_ge_le`,
   `HasSubgaussianMGF.integrable`,
   `HasSubgaussianMGF.neg`,
   `Integrable.abs`,
   `integrable_finsetSum`,
   `AEMeasurable.iSup`,
   `Finite.le_ciSup`,
   `Finset.single_le_sum`,
   `MeasureTheory.measureReal_union_le`,
   `MeasureTheory.measureReal_iUnion_fintype_le`,
   `exists_eq_ciSup_of_finite`,
   `FiniteEmpiricalL1CoverAtCard.centerOf`,
   `measure_sum_ge_le_of_iIndepFun`,
   `measure_sum_range_ge_le_of_iIndepFun`,
   `PMF.bernoulli`,
   `PMF.map`,
   `PMF.toMeasure.isProbabilityMeasure`,
   `PMF.integral_eq_sum`,
   `PMF.bernoulli_apply`,
   `PMF.toMeasure_map`,
   `ProbabilityTheory.exists_iid`,
   `ProbabilityTheory.HasLaw.comp`,
   `ProbabilityTheory.HasLaw.identDistrib`,
   `ProbabilityTheory.iIndepFun.comp`,
   `hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`,
   `hasSubgaussianMGF_of_mem_Icc`,
   `HasSubgaussianMGF.integrable_exp_mul`,
   `HasSubgaussianMGF.mgf_le`,
   `Real.exp_le_exp`,
   `integral_nonneg`,
   `integral_mono_ae`,
   `integrable_const`, and
   `ProbabilityTheory.exists_hasLaw_indepFun`.  The pinned layer-cake API
   provides the route through
   `MeasureTheory.lintegral_eq_lintegral_meas_le`,
   `MeasureTheory.lintegral_eq_lintegral_meas_lt`,
   `MeasureTheory.Integrable.integral_eq_integral_meas_le`, and
   `MeasureTheory.Integrable.integral_eq_integral_meas_lt` in
   `Mathlib.MeasureTheory.Integral.Layercake`; the Gaussian-integral search
   found `integrable_exp_neg_mul_sq` and `integral_gaussian_Ioi` in
   `Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral`, both now
   used by compiled local lemmas.  No reusable
   Orlicz/`psi_2` API was found.  The probabilistic one-center sub-Gaussian
   bridge, variance-proxy arithmetic, finite-center tail/union-bound layer,
   iid Rademacher-sign construction, finite-center supremum integrability
   layer, expected-supremum handoff, layer-cake tail-integral support,
   Gaussian-tail integrability/evaluation, coarse closed-form expectation
   bound, split-at-radius tail-to-expectation bound, Mills-type Gaussian-tail
   estimate, finite-center Mills expectation bound, supplied small-tail Mills
   simplification, logarithmic-radius
   positivity/square/exponential-factor arithmetic, finite-center
   logarithmic-radius Mills expectation bound, log-radius Mills upper wrapper,
   proof-carrying expected finite-center maximal-bound predicate, truncated
   Rademacher expected-maximal specialization, finite-empirical-cover
   expected-maximal wrapper, and ordinary measurable truncation-tail integral
   bridge are now compiled.  The theorem-specific
   expected-supremum layer now routes its reusable layer-cake,
   tail-integral-monotonicity, and split-at-radius probability bounds through
   `StatInference/ProbabilityMeasure/Tail.lean`; VdV&W-specific empirical,
   Mills, logarithmic-radius arithmetic, outer-expectation, and truncation
   handoffs remain in the empirical-process files.  Search found no reusable
   Orlicz/`psi_2` API and no reusable ProbabilityMeasure-level finite-class
   maximal theorem; the VdV&W maximal packaging should remain local in
   `Theorem243.lean`.  The latest local layer proves the common
   truncated-proxy positivity, the `exp(-1) <= 1/2` helper, the
   log-cardinality monotonicity helper, and the full scale comparison
   `VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale.of_pos`.  It also
   packages the finite-empirical-cover expected maximal bound directly at
   `vdVWTheorem243FiniteNetHoeffdingUpper` under explicit positive `n` and
   `M` assumptions.  The latest product/Fubini local layer also packages
   mapped truncated-class product-copy laws/independence, mean-zero fixed-index
   pair differences, and an a.e. random-sign finite-net handoff.  The theorem
   file now packages these pieces as
   `VdVWTheorem243SymmetrizationPrecursor` with constructor
   `VdVWTheorem243SymmetrizationPrecursor.of_finiteEmpiricalCover`.  The
   finite product-sample weighted-sum mean-zero bridge is also compiled as
   `probability_pi_integral_weighted_sum`,
   `probability_pi_integral_weighted_sum_eq_zero`,
   `probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero`, and the VdV&W specialization
   `integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero`.
   The fixed-original-sample conditional ghost-copy identity is also compiled as
   `probability_pi_integral_weighted_sum_const_sub` and the VdV&W specialization
   `integral_vdVWTruncatedClassFun_productSample_const_sub_eq`.
   The random-sign finite-net side also now has the compiled projections
   `VdVWTheorem243SymmetrizationPrecursor.randomSign_expectedMaximal_le` and
   `VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add`,
   the latter using the generic supplied-cover/a.e.-constant outer-expectation
   bridge `VdVWOuterExpectation_le_of_cover_ae_le_const_ofReal`.
   The measurable-cover API also now includes
   `VdVWMeasurableCover.ofAEMeasurable` and
   `VdVWMeasurableCover.ofNullMeasurable_ofReal` for a.e.-measurable and
   null-measurable random targets.
   The product-integrated measurable-cover outer-expectation transfer from the
   integrated random-sign symmetrization comparison is now compiled.  The
   supplied product-space finite-net projection is now compiled, as are the
   sample-cover product-a.e. finite-net bridges
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
   and
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`.
   The empirical-cover cardinality side now has
   `FiniteEmpiricalL1CoverAtCard.pad_cardinality`,
   `exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le`, and
   `finiteEmpiricalL1CoverAtCard_of_randomEmpiricalL1CoveringNumber_le_cardinality`.
   The random empirical-cover witness is now consumed by
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_rademacherSigns`.
   The product-a.e. finite-center Hoeffding route is no longer the active
   blocker for selected random empirical covers: the expectation-level
   random-cover route and product outer-expectation projection are compiled.
   The entropy-to-Hoeffding outer-probability and Markov cover bridges are now
   compiled.  The bounded variable-domain route to the real integrated
   Hoeffding-plus-radius mean convergence is also compiled through
   `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`
   and
   `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`,
   with measurable cardinality, deterministic boundedness/UI, and
   `coverRadius -> 0` supplied explicitly.  The selected inverse-radius
   all-radius route now packages the selected cardinality and finite-net mean
   consequences under explicit diagonal selected log convergence plus a
   deterministic all-radius log bound.  The remaining Theorem 2.4.3 blocker
   is deriving or supplying those two hypotheses from the entropy route, or a
   genuinely varying-domain UI replacement, then final assembly;
   it is not the finite-net Rademacher/Hoeffding maximal scale,
   the fixed-sample random-sign outer-expectation finite-net handoff, the finite
   sample mean-zero bridge, the ordinary integrated product/sign-symmetry layer,
   or a fixed-sample pointwise `hphi_id` comparison.
   A deterministic pointwise class-member-to-supremum
   bridge is also available as
   `abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove` for
   bounded `vdVWWeightedClassValueSet`s, with
   `bddAbove_vdVWWeightedClassValueSet_of_uniform_bound` giving boundedness
   from a pointwise uniform class bound.  These support the next supremum
   comparison step.  The fixed-sample `Phi(x)=x` ghost-copy comparison itself
   is now compiled as
   `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`,
   and the envelope-bounded pair split is compiled as
   `vdVWWeightedClassSupremum_truncated_pairDifference_le_add`.  The finite
   product-coordinate projection wrapper
   `probability_pi_prod_coordinates_measurePreserving` and VdV&W specializations
   `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
   `measurePreserving_vdVWProductMeasure_prod_to_original`, and
   `measurePreserving_vdVWProductMeasure_prod_to_ghost` are now compiled, along
   with the expectation-level monotonicity lifts
   `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`
   and the Fubini/product-projection identity
   `integral_integral_vdVWWeightedClassSupremum_pairDifference_eq_integral_productSample`,
   yielding
   `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifference`,
   and
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd`,
   plus the same-weight variant
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_integral_fst_add_integral_snd_same_weights`
   using `vdVWWeightedSampleSum_neg_weights` and
   `vdVWWeightedClassSupremum_neg_weights`, and the projected two-coordinate
   expectation bound
   `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`.
   Their direct composition is compiled as
   `integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original`.
   The random-sign side now also has
   `vdVWWeightedClassSupremum_rademacherWeights_neg_sign`,
   `measurePreserving_vdVWProductMeasure_rademacherProductSampleSignSwap`,
   `integral_vdVWWeightedClassSupremum_pairDifference_constWeights_eq_rademacherWeights`,
   `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_rademacher_truncated_original`,
   and
   `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
   The generic cover/integral bridge
   `VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg` is
   compiled for supplied-cover ordinary expectation conversions.
   The a.e./null-measurable constructors
   `VdVWMeasurableCover.ofAEMeasurable` and
   `VdVWMeasurableCover.ofNullMeasurable_ofReal` are compiled for random
   targets that are not strictly measurable.
   The product-integrated cover bridge is compiled as
   `VdVWOuterExpectation_prod_hphi_id_of_integral_integral_le` and
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_outerExpectation_prod_randomSign_truncated_original`.
   The supplied product-space a.e. finite-net projection is compiled as
   `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_finiteNetHoeffdingUpper_add_of_product_randomSign_ae`.
   The sample-cover product-space finite-net bridges
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
   and
   `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`
   are compiled for the case where each sample has a finite empirical cover
   and the finite-center Hoeffding predicate holds product-a.e.; the second
   keeps the sample-dependent cardinality exposed for random entropy.
   The finite-cover/cardinality witness handoffs
   `FiniteEmpiricalL1CoverAtCard.pad_cardinality`,
   `exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le`, and
   `finiteEmpiricalL1CoverAtCard_of_randomEmpiricalL1CoveringNumber_le_cardinality`
   are compiled.
   The remaining
   supplied-`hphi_id` projection into the random-sign finite-net bound is
   compiled as
   `VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`.
   Search refined the remaining comparison: the fixed-sample pointwise
   `hphi_id` target is too strong, and the ordinary integrated product-sample
   comparison plus product-cover transfer, supplied product-space finite-net
   projection, sample-cover/sample-dependent-cardinality product-a.e.
   finite-net bridges, random empirical-cover product random-sign handoff,
   selected random-cover expected-maximal handoff, and product-integrated
   random-cover finite-net expected-maximal bound are now compiled, as is the
   product outer-expectation projection
   `VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`;
   the selected inverse-radius entropy-to-mean projections are now compiled as
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_selected_truncated_invRadiusEntropy_logCardinality_div_bound`
   and
   `integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_selected_truncated_invRadiusEntropy_logCardinality_div_bound`.
   The valid next target is deriving or supplying the diagonal selected
   log-cardinality convergence and deterministic all-radius log-ratio bound
   they require, or proving a genuinely varying-domain UI/dominated-convergence
   bridge strong enough to replace that deterministic boundedness input.
5. Symmetrization/truncation layer: formalize or bridge Lemma 2.3.1,
   Fubini-compatible outer expectation, and the envelope-tail bound
   `P^* F{F > M}`.

   Status: the Chapter 1.2 nonnegative tail-product cover-majorant bridge is
   implemented as
   `VdVWOuterExpectation_tailProduct_le_lintegral_tail_cover`.  This is now
   specialized to the real-valued envelope tail by
   `VdVWOuterExpectation_envelope_tail_le_lintegral_tail_cover`; the companion
   Markov-style outer-probability bridge is specialized by
   `VdVWOuterProbability_envelope_tail_gt_le_outerExpectation_div`, and the
   measurable-envelope case reduces to an ordinary tail-set lintegral via
   `VdVWOuterExpectation_envelope_tail_eq_lintegral_tail_of_measurable`.
   The reusable Billingsley/ProbabilityMeasure tail wrapper
   `integral_indicator_tail_lt_tendsto_zero_of_integrable` now proves the
   ordinary real upper-tail cutoff convergence by dominated convergence, and
   the VdV&W measurable-envelope conversions are now compiled as
   `lintegral_envelope_tail_lt_tendsto_zero_of_integrable` and
   `VdVWOuterExpectation_envelope_tail_tendsto_zero_of_measurable_integrable`.
   A reusable nonnegative outer-expectation projection
   `VdVWOuterExpectation_le_of_cover_ae_le_const_ofReal` is also compiled for
   supplied measurable covers with an a.e. real constant bound, and is consumed
   by the precursor random-sign finite-net outer-expectation projection.
   The full Theorem 2.4.3 symmetrization/truncation argument remains pending;
   nonmeasurable/arbitrary-cover envelope-tail variants should only be added
   if that final assembly genuinely needs them.
6. Final convergence handoff: from the random entropy condition to convergence
   in outer mean, then use the stated martingale/Lemma 2.4.5 route for almost
   sure convergence.  Do not report Theorem 2.4.3 until these components are
   exact and compile without proof holes.

Search record for the scale-comparison handoff:

- searched local `StatInference` for existing `LogRadiusMillsUpper`,
  `FiniteNetHoeffdingUpper`, `ExpectedMaximalBound`, `HoeffdingScale`, and
  scale handoff declarations;
- searched pinned mathlib for `Real.sqrt`, `sqrt_mul`, `sqrt_div`,
  `le_sqrt_of_sq_le`, `sqrt_le_left`, `sq_le_sq`, `sq_le_sq₀`,
  `Real.log_nonneg`, `Real.log_natCast_nonneg`, `Real.exp_le_exp`,
  `exp_one_gt_two`, and `exp_one_gt_d9`;
- no exact reusable theorem was found for the whole comparison
  `vdVWTheorem243LogRadiusMillsUpper cardinality (M^2/n) ≤
  vdVWTheorem243FiniteNetHoeffdingUpper cardinality n M`.  The reusable
  arithmetic pieces were enough to prove the local comparison as
  `VdVWTheorem243LogRadiusMillsUpperToHoeffdingScale.of_pos`, using
  `Real.add_one_le_exp`, `Real.exp_neg`, `Real.log_le_log`, `Real.sq_sqrt`,
  `sq_le_sq₀`, `div_le_iff₀`, and `field_simp`/`nlinarith` for the final
  nonnegative square comparison.

Search record for the entropy-to-Hoeffding-scale algebra:

- searched local `StatInference` and pinned mathlib for `Tendsto`, `sqrt`,
  `Real.log_nonneg`, `ENNReal.ofReal`, stochastic little-o, and
  random-cardinality coercion helpers;
- no packaged outer-probability continuous-mapping theorem was found for the
  exact map `L_n ↦ sqrt(1 + L_n) * sqrt(6 / n) * M`;
- compiled the theorem-local deterministic helpers
  `vdVWTheorem243FiniteNetHoeffdingUpper_nonneg`,
  `vdVWTheorem243FiniteNetHoeffdingUpper_sq`,
  `vdVWTheorem243FiniteNetHoeffdingUpper_eq_logCardinality`,
  `vdVWTheorem243FiniteNetHoeffdingUpper_sq_eq_logCardinality`, and
  `tendsto_sqrt_one_add_mul_sqrt_six_div_of_div_tendsto_zero`, plus the
  pointwise finite-net notation bridge
  `tendsto_finiteNetHoeffdingUpper_of_logCardinality_div_tendsto_zero`,
  using `tendsto_one_div_atTop_nhds_zero_nat`, `Tendsto.add`,
  `Tendsto.const_mul`, `Real.continuous_sqrt`, `Real.sqrt_mul`, and the
  random log-cardinality rewrite;
- also compiled
  `VdVWTheorem243TruncatedEntropyCondition.fixed_of_forAllEpsilonM`, which
  projects the book-facing all-`M`, all-`epsilon` entropy hypothesis to the
  fixed truncated entropy condition needed by the next assembly theorem.

Search record for the symmetrization precursor package:

- searched local `StatInference` for product/Fubini, `HasLaw`,
  `IndepFun`/`iIndepFun`, pair-difference mean-zero, finite-center expected
  maximal bounds, random Rademacher signs, and a.e. finite-net handoffs;
- searched pinned mathlib for finite Jensen/convexity and product/Fubini APIs,
  including `ConvexOn.map_sum_le`, `ConvexOn.map_integral_le`,
  `MeasureTheory.integral_prod`, `ProbabilityTheory.iIndepFun_pi`,
  `iIndepFun.hasLaw_pi`, `MeasureTheory.measurePreserving_eval`, and
  `Measure.pi_map_pi`;
- the practical route for Theorem 2.4.3 remains the theorem-local
  `Phi(x)=x` linear/Fubini argument rather than a general Jensen wrapper.
  The useful missing primitive exposed by this search is now compiled as the
  generic product-copy finite weighted-sum mean-zero bridge
  `probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero` over
  `(P.prod P)^n` and
  the theorem-specific specialization to truncated pair differences.  The
  conditional ghost-copy search also exposed the compiled
  `probability_pi_integral_weighted_sum_const_sub` /
  `integral_vdVWTruncatedClassFun_productSample_const_sub_eq` route for
  integrating over only the ghost sample with the original sample fixed.
  Follow-up
  local search found no completed `Phi(x)=x` comparison, but did identify the
  supplied-cover route through `VdVWOuterExpectation_mono`,
  `VdVWOuterExpectation_le_of_cover_ae_le_const_ofReal`,
  `HasLaw.integral_comp`, `IdentDistrib.integral_eq`, `integral_mono_ae`,
  finite `Measure.pi`/product Fubini APIs, and the local deterministic
  supremum bridge
  `abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove` together
  with `bddAbove_vdVWWeightedClassValueSet_of_uniform_bound`.  The
  theorem-local random-sign expected-maximal and outer-expectation projections
  are now compiled.  The fixed-sample `Phi(x)=x` comparison
  `vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifferenceSupremum`
  and the envelope-bounded split
  `vdVWWeightedClassSupremum_truncated_pairDifference_le_add` are now compiled
  as well.  The product-coordinate projection layer is also compiled as
  `probability_pi_prod_coordinates_measurePreserving`,
  `measurePreserving_vdVWProductMeasure_prod_to_original_ghost`,
  `measurePreserving_vdVWProductMeasure_prod_to_original`, and
  `measurePreserving_vdVWProductMeasure_prod_to_ghost`; the same-weight
  integrated pair split is compiled using the deterministic sign-flip lemmas
  `vdVWWeightedSampleSum_neg_weights` and
  `vdVWWeightedClassSupremum_neg_weights`, and its projected same-law
  consequence
  `integral_vdVWWeightedClassSupremum_truncated_pairDifference_le_two_integral_original`
  is compiled.  The integrated centered-to-product-sample projection
  `integral_vdVWWeightedClassSupremum_centered_le_integral_productSample_pairDifference`
  and the composed centered-to-two-truncated-expectation handoff
  `integral_vdVWWeightedClassSupremum_centered_le_two_integral_truncated_original`
  are compiled as well.  The Rademacher-weight sign-negation bridge
  `vdVWWeightedClassSupremum_rademacherWeights_neg_sign` is compiled as well,
  along with the coordinatewise product-pair sign-swap measure-preserving
  wrapper, deterministic pair-difference sign-swap identities, the product-pair
  integrated sign-symmetry identity
  `integral_vdVWWeightedClassSupremum_pairDifference_constWeights_eq_rademacherWeights`,
  and the random-sign integrated averaging comparison
  `integral_vdVWWeightedClassSupremum_centered_const_le_two_integral_randomSign_truncated_original`.
  The generic cover/integral equality
  `VdVWOuterExpectation_eq_ofReal_integral_of_cover_integrable_nonneg` is also
  compiled for supplied measurable covers of integrable nonnegative real targets.
  The cover constructors `VdVWMeasurableCover.ofAEMeasurable` and
  `VdVWMeasurableCover.ofNullMeasurable_ofReal` are compiled for random targets
  supplied only as a.e.-measurable or null-measurable.
  The product-integrated measurable-cover bridge
  `VdVWOuterExpectation_prod_hphi_id_of_integral_integral_le` and its VdV&W
  specialization
  `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_outerExpectation_prod_randomSign_truncated_original`
  are compiled.  The supplied product-space finite-net projection
  `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_finiteNetHoeffdingUpper_add_of_product_randomSign_ae`
  is compiled as well, along with the sample-cover product-a.e. finite-net
  bridges
  `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleCovers_rademacherSigns`
  and
  `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_sampleDependentCovers_rademacherSigns`.
  The random empirical-cover cardinality bridge
  `finiteEmpiricalL1CoverAtCard_of_randomEmpiricalL1CoveringNumber_le_cardinality`
  is compiled on top of
  `exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le` and
  `FiniteEmpiricalL1CoverAtCard.pad_cardinality`.  The random empirical-cover
  product random-sign handoff
  `ae_prod_vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_rademacherSigns`
  is compiled as well.  A follow-up search found the fixed-sample pointwise
  `hphi_id` target is too strong, and the Hoeffding/log-radius stack currently
  supplies expected-maximal bounds rather than the pointwise finite-center
  predicate.  The selected random empirical-cover projections
  `vdVWRandomEmpiricalL1CoverAtCard_center_mem` and
  `vdVWRandomEmpiricalL1CoverAtCard_cardinality_pos`, selected-cover
  expected-maximal handoff
  `vdVWTheorem243_truncated_rademacher_expectedMaximalBound_le_finiteNetHoeffdingUpper_of_randomEmpiricalL1CoverAtCard_of_pos`,
  and product-integrated random-cover finite-net bound
  `integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`
  are compiled, along with product outer-expectation projection
  `VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
  Their direct composition with the product-integrated symmetrization bound is
  compiled as
  `integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_randomEmpiricalCovers_expectedMaximal`.
  The entropy-to-Hoeffding-scale outer-probability handoff is compiled as
  `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbability_zero_of_logCardinality_littleO_n`,
  with shifted-display and fixed/all-entropy consumers
  `vdVWTheorem243FiniteNetHoeffdingUpper_add_convergesInOuterProbability_epsilon_of_logCardinality_littleO_n`,
  `VdVWTheorem243TruncatedEntropyCondition.finiteNetHoeffdingUpper_convergesInOuterProbability_zero`,
  and
  `VdVWTheorem243TruncatedEntropyConditionForAllEpsilonM.finiteNetHoeffdingUpper_convergesInOuterProbability_zero`.
  The generic Markov bridges
  `VdVWConvergesInOuterProbability_zero_of_outerExpectation_tendsto_zero_ofReal`,
  `VdVWConvergesInOuterProbability_zero_of_outerExpectation_le_tendsto_zero_ofReal`,
  `VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_tendsto_zero_ofReal`,
  and
  `VdVWConvergesInOuterProbabilityConst_zero_of_outerExpectation_le_tendsto_zero_ofReal`
  are also compiled.  The theorem-specific fixed-`M` centered-truncated
  convergence handoff is compiled as
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_tendsto_zero`.
  The generic real-to-`ENNReal.ofReal` convergence bridge
  `tendsto_two_mul_ofReal_zero_of_tendsto_zero` and theorem-specific real mean
  consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_add_real_tendsto_zero`
  are also compiled.  The deterministic covering-radius part is now separated by
  `tendsto_integral_finiteNetHoeffdingUpper_add_coverRadius_of_tendsto_integral_finiteNetHoeffdingUpper`,
  and the theorem-facing fixed-`M` consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_integral_finiteNetHoeffdingUpper_and_coverRadius_tendsto_zero`
  reduces the bundled real mean input to two assumptions: the finite-net
  Hoeffding upper mean tends to zero and the chosen empirical-cover radius tends
  to zero.  The bounded-tail expectation wrapper
  `probability_integral_le_threshold_add_bound_mul_tail`, the variable-domain
  bounded outer-probability-to-mean bridge
  `tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_bounded_nonneg`,
  and the finite-net mean consumer
  `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`
  plus the pure finite-net mean consumer
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_bounded_convergesInOuterProbabilityConst`
  are also compiled.  The variable-domain entropy-to-Hoeffding bridge
  `vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`
  and the bounded entropy-to-integrated-mean consumer
  `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
  with pure finite-net mean form
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded`
  are now compiled as well.  The random finite-net upper measurability and
  integrability packaging lemmas
  `measurable_vdVWLogEmpiricalL1CoveringCardinality_of_measurable_cardinality`,
  `measurable_vdVWTheorem243FiniteNetHoeffdingUpper_of_measurable_cardinality`,
  and
  `integrable_vdVWTheorem243FiniteNetHoeffdingUpper_of_measurable_cardinality_bound`,
  plus the measurable-cardinality finite-net mean consumer
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`,
  and the radius-added measurable-cardinality consumer
  `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_bounded_of_measurable_cardinality`,
  are also compiled.  The fixed-`M` centered-truncated convergence consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_bounded`
  now composes these pieces under explicit measurable-cardinality,
  boundedness/uniform-integrability, and empirical-cover radius convergence
  hypotheses.  The inverse-radius consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_bounded_invRadius`
  also compiles and discharges the deterministic radius convergence for
  `coverRadius n = 1 / ((n : ℝ) + 1)` using mathlib's
  `tendsto_one_div_add_atTop_nhds_zero_nat`.  The covering primitive layer now
  also has
  `measurable_empiricalL1CoveringNumber_of_cover_event_measurable`, which
  reduces measurability of the empirical covering number to measurability of
  each fixed-cardinality cover-existence event, and
  `measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable`,
  which applies mathlib's `measurable_find` to the least finite cover
  cardinality.  The theorem-local random covering interface also has
  `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_minimal_finite` for the
  minimal finite cardinality process.  This records the precise measurable
  cardinality split: countable or finite center-selection assumptions can feed
  fixed-cardinality cover events, while arbitrary uncountable index classes
  still need a measurable selection/separability hypothesis.
  The deterministic finite-net log-bound suppliers
  `vdVWTheorem243FiniteNetHoeffdingUpper_le_of_logCardinality_div_le`,
  `vdVWTheorem243FiniteNetHoeffdingUpper_bound_of_logCardinality_div_le`,
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
  and
  `integral_finiteNetHoeffdingUpper_add_tendsto_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_of_measurable_cardinality_logCardinality_div_bound`,
  plus the fixed-`M` centered-truncated consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound`
  are also compiled, and the inverse-radius specialization
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_measurable_cardinality_logCardinality_div_bound_invRadius`
  discharges the canonical `coverRadius n = 1 / ((n : ℝ) + 1)` convergence.
  The packaged inverse-radius side-condition layer
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions`,
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`,
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero`,
  and
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_bounded`
  also compiles.  It packages the selected inverse-radius cover, diagonal
  log-cardinality convergence, and measurable cardinality, while keeping the
  deterministic finite-net upper bound as an explicit boundedness/UI assumption.
  The selected-cardinality measurability route now also has equality-transport
  wrappers
  `measurable_cardinality_at_sampleSize_of_eq_selected_randomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`
  and
  `measurable_cardinality_at_sampleSize_of_eq_selected_truncatedRandomEmpiricalL1CoveringNumberCard_of_countable`
  for externally named theorem cardinality processes.  The finite-cover witness
  input can now be derived directly from covering-number domination by
  `hasFiniteEmpiricalL1Cover_of_randomEmpiricalL1CoveringNumber_le_cardinality_samplePath`,
  and the countable truncated measurability transport is packaged as
  `measurable_cardinality_at_sampleSize_of_eq_selected_truncatedRandomEmpiricalL1CoveringNumberCard_of_countable_of_covering_le`.
  The theorem-facing consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated_invRadius`
  discharges `hcardinality` from equality with the selected truncated
  minimal-cardinality process.  The selected package
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions`, its projection
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.toFixedMInvRadiusEntropySideConditions`,
  its finite-cover constructor
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_invRadiusFiniteCovers`,
  and the compact fixed-`M` convergence consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy`
  are compiled as well.  This closes the selected finite-cover domination and
  terminal selected-cardinality equality plumbing.  The next valid target is
  one layer later: supply diagonal shrinking-radius selected log-cardinality
  convergence plus a deterministic normalized log-ratio bound, or prove a
  genuine variable-domain uniform-integrability/dominated-convergence
  replacement.
  All-positive-radius covering domination can now be specialized by
  `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.coverRadius_of_forAllRadius_samplePath`,
  with inverse-radius form
  `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.invRadius_of_forAllRadius_samplePath`.
  The same all-radius-to-chosen-radius step supplies finite empirical-cover
  witnesses through `hasFiniteEmpiricalL1Cover_coverRadius_of_forAllRadius_samplePath`
  and `hasFiniteEmpiricalL1Cover_invRadius_of_forAllRadius_samplePath`.
  For externally supplied finite cardinality processes, the selected least
  finite-cover cardinality is bounded by the supplied process via
  `finiteEmpiricalL1CoveringNumberCard_le_of_empiricalL1CoveringNumber_le`
  and
  `finiteEmpiricalL1CoveringNumberCard_terminal_le_of_covering_le_samplePath`.
  The normalized selected log-cardinality bound can then be transferred from
  the external bound by
  `vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_terminal_le` and
  `vdVWLogEmpiricalL1CoveringCardinality_selected_terminal_div_le_of_covering_le_samplePath`.
  The all-radius and inverse-radius selected-log transfer forms
  `vdVWLogEmpiricalL1CoveringCardinality_selected_coverRadius_terminal_div_le_of_forAllRadius_samplePath`
  and
  `vdVWLogEmpiricalL1CoveringCardinality_selected_invRadius_terminal_div_le_of_forAllRadius_samplePath`
  are compiled as well.
  The selected least finite-cardinality process also has
  `finiteEmpiricalL1CoveringNumberCard_terminal_eq_of_minimal_finite_samplePath`,
  which supplies the terminal equality proof needed by the selected-cardinality
  consumers when `cardinality` is chosen to be the minimal finite empirical
  cover cardinality itself.
  The arbitrary-radius theorem-facing consumer
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated`
  handles arbitrary deterministic shrinking cover radii, while
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero_eq_selected_truncated_invRadius`
  specializes it to `1 / ((n : ℝ) + 1)` and discharges `hcardinality` from
  equality with the selected truncated minimal-cardinality process.  The
  remaining analytic inputs remain the diagonal normalized log-cardinality
  convergence plus deterministic bound, or a genuine variable-domain
  uniform-integrability/dominated-convergence replacement.
  Search record: local `StatInference` and pinned mathlib searches for
  `UniformIntegrable`, `UnifIntegrable`, `tendsto_Lp_finite_of_tendstoInMeasure`,
  `tendsto_integral_of_L1`, `TendstoInMeasure`, and
  `VdVWConvergesInOuterProbabilityConst` found fixed-domain mathlib Vitali/L1
  APIs and the local common-domain
  `vdVWConvergesInOuterProbability_iff_tendstoInMeasure`; this run added the
  variable-domain bounded nonnegative outer-probability-to-mean bridge, the
  finite-net upper measurability/integrability packaging from measurable
  cardinality, the cover-event-to-covering-number measurability abstraction,
  the least finite-cardinality measurability wrapper, the minimal finite
  cardinality domination wrapper, and the deterministic normalized
  log-cardinality bound suppliers.  The countable-class route now also has the
  witness-free characterization
  `nonempty_finiteEmpiricalL1CoverAtCard_iff_exists_centers`, the pairwise
  distance bridge `measurable_empiricalL1Distance_of_measurable`, the measurable
  event wrapper `measurableSet_finiteEmpiricalL1CoverAtCard_of_countable`, the
  direct wrappers `measurable_empiricalL1CoveringNumber_of_countable` and
  `measurable_finiteEmpiricalL1CoveringNumberCard_of_countable`, and their
  measurable-class specializations.  The theorem-facing selected
  minimal-cardinality measurability wrappers
  `measurable_terminal_minimalRandomEmpiricalL1CoveringNumberCard_of_countable_of_measurable`,
  `measurable_selected_randomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable_of_measurable`,
  and
  `measurable_selected_truncatedRandomEmpiricalL1CoveringNumberCard_at_sampleSize_of_countable`
  are compiled as well.  The theorem route still needs diagonal selected
  log-cardinality convergence, plus either the deterministic selected
  log-ratio bound input or a genuine bounded/UI replacement.  The
  cover-radius selector, all-radius covering projection, finite-witness
  handoff, selected log-bound transfer, and
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_invRadiusFiniteCovers`
  selected inverse-radius package are now compiled.  The
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions.of_selected_truncated`
  side-condition packaging are now compiled.  The external-cardinality
  equality-transport constructor
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions.of_eq_selected_truncated`
  is compiled as well.  The fixed-`M` handoff from that package and a
  deterministic selected log-ratio bound is compiled as
  `VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_invRadiusEntropy_logCardinality_div_bound`.
  The same side-condition package now also projects directly to the ordinary
  finite-net and finite-net-plus-inverse-radius mean convergence conclusions
  via
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero_of_logCardinality_div_bound`
  and
  `VdVWTheorem243FixedMInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_logCardinality_div_bound`.
  The selected package now has the corresponding direct projections
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.finiteNetHoeffdingUpper_bound`,
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.integrable_finiteNetHoeffdingUpper`,
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`,
  and
  `VdVWTheorem243SelectedInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero`.
  The finite-cover constructor route also has direct mean consumers
  `integral_finiteNetHoeffdingUpper_tendsto_zero_of_invRadiusFiniteCovers`
  and
  `integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_invRadiusFiniteCovers`.
  Follow-up search found no ready
  variable-domain `UniformIntegrable`/Vitali API; pinned mathlib's
  `UniformIntegrable`, `UnifIntegrable`, `tendsto_Lp_finite_of_tendstoInMeasure`,
  `tendstoInMeasure_iff_tendsto_Lp_finite`, and dominated-convergence APIs are
   fixed-domain.  The compiled replacement route is now the explicit
   variable-domain tail-expectation/UI bridge
   `tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_tailExpectation_nonneg`,
   specialized to finite-net Hoeffding means as
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_tailExpectation_convergesInOuterProbabilityConst`.
   The bounded-tail/UI adapter route is now also compiled:
   `tailExpectation_condition_of_eventual_bound`,
   `finiteNetHoeffdingUpper_tailExpectation_condition_of_eventual_bound`,
   `finiteNetHoeffdingUpper_tailExpectation_condition_of_bound`,
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_bounded_tailExpectation_convergesInOuterProbabilityConst`,
   `VdVWTheorem243SelectedInvRadiusEntropySideConditions.finiteNetHoeffdingUpper_tailExpectation`,
   `VdVWTheorem243SelectedInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero_of_tailExpectation`,
   `VdVWTheorem243SelectedInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_tailExpectation`,
   `integral_finiteNetHoeffdingUpper_tendsto_zero_of_invRadiusFiniteCovers_tailExpectation`,
   and
   `integral_finiteNetHoeffdingUpper_add_invRadius_tendsto_zero_of_invRadiusFiniteCovers_tailExpectation`.
   Search also found no existing local/mathlib perturbation theorem for
   varying-domain `VdVWConvergesInOuterProbabilityConst`; the compiled local
   replacement is
   `VdVWConvergesInOuterProbabilityConst_zero_of_eventual_dist_le_add_errors`,
   which is the next untruncation support lemma.  The remaining theorem input is
   now not the tail/UI adapter itself; it is proving the selected diagonal
   log-cardinality convergence and deterministic selected log-ratio bound from
   the book assumptions, or proving a genuinely stronger selected finite-net
   tail/UI theorem from those assumptions.  The best Billingsley source fallback
   for a stronger UI theorem is Theorem 25.12/UI, but no report should be
   created unless an exact theorem is proved and the source screenshots/report
   PDF are compiled.
  A radius-monotonicity search found mathlib
  `Metric.externalCoveringNumber_anti`, `Metric.coveringNumber_anti`, and local
  `vdVWCoveringNumber_anti`, but this direction does not derive an upper bound
  for the shrinking radius `1/(n+1)` from fixed positive-radius entropy:
  eventually `1/(n+1) ≤ ε`, so antitonicity gives
  `N(ε) ≤ N(1/(n+1))`, not the needed upper bound on the selected diagonal
  covering number.
  The
  supplied projection
  `VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`
  still packages the fixed-sample finite-net consequence when such a supplied
  comparison is available, but the theorem-line route should remain
  product-integrated.

The deterministic untruncation perturbation batch is now compiled.  The new
Theorem 2.4.3-facing declarations are
`abs_vdVWWeightedSampleSum_classFun_sub_truncated_le_weightedEnvelopeTail`,
`abs_vdVWWeightedSampleSum_classFun_sub_truncated_le_empiricalEnvelopeTail`,
`abs_integral_classFun_sub_integral_truncated_le_integral_envelope_tail`,
`abs_vdVWWeightedSampleSum_centered_classFun_sub_centered_truncated_le_empiricalEnvelopeTail_add_integral`,
and
`vdVWWeightedClassSupremum_centered_classFun_le_centered_truncated_add_empiricalEnvelopeTail_add_integral`.
The empirical envelope-tail expectation/Markov bridge is also compiled through
`measurable_empiricalAverage_envelope_tail`,
`integrable_empiricalAverage_envelope_tail`,
`integral_empiricalAverage_envelope_tail_eq_integral_envelope_tail`,
`VdVWOuterExpectation_empiricalEnvelopeTail_eq_ofReal_integral_tail`, and
`VdVWOuterProbability_empiricalEnvelopeTail_gt_le_integral_tail_div`.

The first untruncation probability split is now compiled as a theorem-facing
batch:
`vdVWTheorem243_untruncated_centered_badEvent_subset_truncated_or_empiricalTail`,
`VdVWOuterProbability_untruncated_centered_bad_le_truncated_add_empiricalTail`,
and
`VdVWOuterProbability_untruncated_centered_bad_le_truncated_add_tailIntegral`.
These declarations convert the deterministic supremum perturbation into the
exact bad-event union/Markov estimate needed by the textbook proof: after
choosing `M` with population envelope-tail integral at most `epsilon / 3`, the
untruncated bad event is bounded by the fixed-`M` truncated bad event plus the
empirical envelope-tail Markov bound.

The large-`M` untruncation convergence handoff is now compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_fixedM_centered_truncated`.
It uses the probability split, the ordinary real envelope-tail cutoff
`StatInference.ProbabilityMeasure.integral_indicator_tail_lt_tendsto_zero_of_integrable`,
and `ENNReal.tendsto_nhds_zero` to choose `M` before sending `n -> infinity`.
This closes the fixed-`M`-to-untruncated blocker under the honest hypothesis
that every fixed truncation level already has centered-truncated convergence.

The selected inverse-radius composition is now compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedInvRadiusEntropy`.
This theorem feeds the fixed-`M` selected inverse-radius entropy consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy`
into the large-`M` untruncation handoff, under `∀ M, 0 < M -> ...` selected
entropy/cover/integrability side conditions.  The large-`M` handoff was
strengthened to require fixed-`M` convergence only for positive truncation
levels, matching the actual `M -> infinity` proof.

The selected side-condition constructor and the non-selected untruncated
inverse-radius/log-bound route are now compiled.  The selected constructor
`VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_selected_truncated`
builds the selected least-cardinality inverse-radius package from all-positive
radius finite-cover domination, diagonal selected log-cardinality convergence,
and a deterministic all-radius normalized log bound.  The final-facing
consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_invRadiusEntropy_logCardinality_div_bound`
composes fixed-`M` inverse-radius entropy packages and normalized log-ratio
bounds with the large-`M` untruncation handoff.  This closes the side-condition
packaging surface without pretending that the book fixed-radius entropy
hypothesis implies the shrinking-radius diagonal selected entropy input.

The all-radius selected-truncated composition is now also compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_invRadiusEntropy_logCardinality_div_bound`.
It starts from all-positive-radius truncated finite-cover domination and builds
the selected inverse-radius fixed-`M` packages internally.  The remaining
explicit assumptions are exactly the honest diagonal selected log convergence
and deterministic all-radius log-ratio bound; these are stronger than the
textbook fixed-positive-radius `o_P^*(n)` entropy hypothesis unless an
additional uniform/diagonal entropy theorem is proved.

The faithful fixed-radius route is now compiled.  The arithmetic chooser
`exists_pos_radius_eventually_two_mul_ofReal_add_div_le_of_forall_tendsto_zero`
selects a fixed positive radius after the final outer-probability tolerance.
The fixed-`M` theorem
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_integral_finiteNetHoeffdingUpper_tendsto_zero`
proves centered-truncated convergence from fixed-radius finite-net mean
convergence for every `η > 0`.  The bounded log-cardinality feeder
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_div_bound`
connects that consumer to the existing fixed-radius entropy-to-Hoeffding-mean
machinery, and the untruncated handoff
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_div_bound`
composes it with the large-`M` envelope-tail truncation removal.

The selected fixed-radius route is now compiled as well.  The monotone
outer-probability bridge
`VdVWConvergesInOuterProbabilityConst_zero_of_nonneg_le` transfers convergence
from a pointwise larger nonnegative process.  The selected fixed-radius
cardinality wrappers
`vdVWSelectedTruncatedFixedRadiusEmpiricalL1CoveringNumberCard` and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.selected_truncated_fixedRadius_of_forAllRadius_samplePath`
build the least finite empirical cover at each fixed radius.  The log
convergence bridge
`vdVWLogEmpiricalL1CoveringCardinality_selected_fixedRadius_div_convergesInOuterProbabilityConst_zero_of_forAllRadius_samplePath`
derives selected normalized-log convergence from the book-facing finite-valued
fixed-radius entropy envelope, and
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_selected_truncated_fixedRadius_logCardinality_div_bound`
and
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_forall_pos_selected_truncated_fixedRadius_logCardinality_div_bound`
turn that into selected fixed-radius finite-net mean convergence when a
deterministic normalized log-cardinality bound is supplied.  Countable
coordinate-measurable truncated classes now discharge the selected
cardinality-measurability input through existing `Nat.find` cover-event
measurability.

The selected fixed-radius route now feeds the theorem consumers directly.  The
positive-radius selector
`vdVWSelectedTruncatedPositiveRadiusEmpiricalL1CoveringNumberCard` and
covering domination wrapper
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.selected_truncated_positiveRadius_of_forAllRadius_samplePath`
let downstream handoffs use one `eta ↦ cardinality eta` process while keeping
only positive radii theorem-relevant.  The fixed-`M` consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_logCardinality_div_bound`
and untruncated consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_logCardinality_div_bound`
compose selected fixed-radius finite-net mean convergence with the existing
fixed-`M` and large-`M` envelope-tail routes.

The selected fixed-radius tail/UI route is also compiled.  The finite-net mean
handoffs
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_selected_truncated_fixedRadius_tailExpectation`
and
`integral_finiteNetHoeffdingUpper_tendsto_zero_of_forall_pos_selected_truncated_fixedRadius_tailExpectation`
use the same selected log-convergence and selected measurability facts, but
replace the deterministic normalized log bound by an explicit varying-domain
tail-expectation condition for the selected Hoeffding upper.  The packaged
side-condition structure
`VdVWTheorem243SelectedFixedRadiusTailSideConditions` and its analytic
consumer
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.integral_finiteNetHoeffdingUpper_tendsto_zero`
now keep the fixed-radius cover domination, entropy convergence,
finite-net-upper integrability, and tail/UI inputs together.  The constructor
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_div_bound`
now proves this tail/UI package from a deterministic normalized log-cardinality
bound by reusing the bounded finite-net Hoeffding route.  The fixed-`M`
and untruncated theorem-facing consumers
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_tailExpectation`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_fixedRadius_tailExpectation`
remain available, and the packaged consumers
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedFixedRadiusTailSideConditions`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedFixedRadiusTailSideConditions`
now compose that tail/UI route with the main symmetrization and large-`M`
envelope-tail handoffs without re-threading four separate analytic fields.

2026-05-03 `/goal` update: the first product-grid arithmetic handoff is now
compiled.  The declarations
`vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_succ_terminal_le_pow`
and
`vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_terminal_le_pow`
convert future finite-grid/packing cardinality estimates
`cardinality n sample n + 1 ≤ base ^ n` or
`cardinality n sample n ≤ base ^ n` into the deterministic normalized
log-cardinality bounds consumed by the selected fixed-radius tail package.
This removes the real-log arithmetic part of the current blocker.

2026-05-03 `/goal` update: the internal-cover adapter is now compiled in
`StatInference/EmpiricalProcess/CoveringPrimitive.lean`.  Search used local
`FiniteEmpiricalL1CoverAtCard`/`empiricalL1CoveringNumber` declarations and
pinned mathlib APIs `Metric.IsCover`, `Metric.coveringNumber`,
`Metric.minimalCover`, `Metric.finite_minimalCover`,
`Metric.minimalCover_subset`, and `Metric.isCover_minimalCover`.  The new
proof-carrying declarations are
`empiricalL1CoveringNumber_le_of_coverAtCard`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_centerSet`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_centerSet_card_le`,
`empiricalL1CoveringNumber_le_of_finite_centerSet`,
`empiricalL1CoveringNumber_le_of_finite_centerSet_card_le`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_metric_isCover`,
`empiricalL1CoveringNumber_le_of_metric_isCover`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_metric_minimalCover`, and
`empiricalL1CoveringNumber_le_of_metric_minimalCover`.  This closes the
missing local adapter from finite internal metric centers to empirical
`L1(P_n)` cover witnesses, under the honest compatibility hypothesis
`edist index center <= radius -> empiricalL1Distance ... <= epsilon`.

2026-05-03 `/goal` update: the terminal power estimates now feed the selected
fixed-radius tail/UI package directly.  Search reused the local terminal
log-cardinality arithmetic declarations
`vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_terminal_le_pow`,
`vdVWLogEmpiricalL1CoveringCardinality_terminal_div_le_of_succ_terminal_le_pow`,
and the existing package constructor
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_div_bound`.
The new compiled constructors are
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_terminal_le_pow` and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_succ_terminal_le_pow`.
Thus a geometric estimate of the form
`cardinality eta n sample n <= base eta ^ n`, or the sharper
`cardinality eta n sample n + 1 <= base eta ^ n`, now directly produces the
fixed-radius tail/UI package consumed by the fixed-`M` and untruncated
Theorem 2.4.3 handoffs.

2026-05-03 `/goal` update: the induced empirical `L1(P_n)` pseudometric bridge
is now compiled.  Search reused pinned mathlib
`PseudoEMetricSpace.ofEDist`, `Metric.IsCover`, `Metric.coveringNumber`,
`Metric.minimalCover`, `Metric.finite_minimalCover`,
`Metric.minimalCover_subset`, `Metric.isCover_minimalCover`,
`Metric.encard_minimalCover`, `ENNReal.ofReal_add_le`,
`ENNReal.ofReal_le_ofReal`, `ENNReal.ofReal_le_ofReal_iff`, and finite
image-cardinality APIs `Set.ncard_image_le` /
`Set.ncard_eq_toFinset_card`.  The new proof-carrying local declarations are
`EmpiricalL1Index`, `EmpiricalL1Index.instPseudoEMetricSpace`,
`EmpiricalL1Index.empiricalL1Distance_le_coe_radius_of_edist_le`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_empiricalL1Index_isCover`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_empiricalL1Index_minimalCover`,
`empiricalL1CoveringNumber_le_of_empiricalL1Index_isCover`,
`empiricalL1Index_image_toFinset_card_le`,
`empiricalL1CoveringNumber_le_of_empiricalL1Index_isCover_card`,
`empiricalL1CoveringNumber_le_of_empiricalL1Index_minimalCover`,
`empiricalL1CoveringNumber_le_of_empiricalL1Index_minimalCover_card`, and
`empiricalL1CoveringNumber_le_empiricalL1Index_coveringNumber`.  The same
closure batch also compiled the finite-bound consumers
`nonempty_finiteEmpiricalL1CoverAtCard_of_empiricalL1Index_coveringNumber_le`
and
`empiricalL1CoveringNumber_le_of_empiricalL1Index_coveringNumber_le`, so a
future geometric estimate `Metric.coveringNumber <= cardinality` immediately
produces a local empirical finite-cover witness at that finite cardinality.
This closes the compatibility step from internal-cover `edist` balls in the
empirical pseudometric to local empirical `L1(P_n)` cover witnesses with
centers still in `indexClass`.

2026-05-03 `/goal` update: the induced empirical-pseudometric covering-number
bridge now feeds the selected fixed-radius tail/UI package directly.  The
new compiled declarations in `StatInference/EmpiricalProcess/Theorem243.lean`
are
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_empiricalL1Index_coveringNumber_le`,
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_empiricalL1Index_coveringNumber_le_samplePath`,
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_empiricalL1Index_coveringNumber_le_samplePath`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_empiricalL1Index_coveringNumber_le_terminal_pow`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_empiricalL1Index_coveringNumber_le_succ_terminal_pow`.
Thus a future theorem only has to prove the geometric finite-cardinality
estimate in the induced empirical pseudometric, plus the existing stochastic
entropy convergence input; the random-cover domination and selected tail/UI
handoff are now closed.

2026-05-03 `/goal` update after the finite-class geometric pass: the reusable
finite-class cardinality route is now compiled.  Mathlib APIs searched and
used were `Metric.coveringNumber_le_encard_self`,
`Metric.IsCover.coveringNumber_le_encard`,
`Metric.coveringNumber_le_packingNumber`, `Metric.minimalCover`,
`Metric.maximalSeparatedSet`, `Function.Injective.encard_image`,
`Set.ncard_image_le`, and finite `encard`/`toFinset` coercions.  New compiled
primitive declarations in `CoveringPrimitive.lean` are
`EmpiricalL1Index.ofIndex_injective`,
`EmpiricalL1Index.image_ofIndex_eq_liftSet`,
`EmpiricalL1Index.encard_liftSet_eq`,
`EmpiricalL1Index.finite_liftSet`,
`empiricalL1Index_coveringNumber_le_indexClass_encard`,
`empiricalL1Index_coveringNumber_le_indexClass_toFinset_card`, and
`empiricalL1CoveringNumber_le_indexClass_toFinset_card`.  New theorem-facing
declarations in `Theorem243.lean` are
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_indexClass_cardinality_bound`,
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_indexClass_cardinality_bound_samplePath`,
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_indexClass_cardinality_bound_samplePath`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_indexClass_cardinality_bound_terminal_pow`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_indexClass_cardinality_bound_succ_terminal_pow`.

2026-05-03 `/goal` update after the finite-class entropy pass: the finite
class route now also discharges the fixed-radius stochastic entropy/tail
package itself.  New compiled declarations are
`VdVWConvergesInOuterProbabilityConst_of_tendsto_const` in
`GlivenkoCantelli.lean`, plus
`VdVWConvergesInOuterProbabilityConst_zero_of_constant_logCardinality_div`,
`vdVWLogEmpiricalL1CoveringCardinality_const_terminal_div_le_log`, and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_indexClass` in
`Theorem243.lean`.  Thus a finite nonempty index class with countable
coordinate measurability now supplies the selected fixed-radius tail/UI
package directly; it no longer needs a separate stochastic entropy hypothesis
at this layer.

2026-05-03 `/goal` update after consuming the finite-class package: the finite
nonempty-class route now reaches untruncated centered convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`.
This theorem packages the finite-class selected fixed-radius tail/UI side
conditions for every positive truncation level and feeds them to the existing
large-`M` untruncation handoff.  The remaining assumptions are exactly the
current theorem-local measurability, envelope integrability, symmetrization,
Rademacher, and finite-center integrability inputs; the entropy/tail package is
no longer a separate assumption for finite classes.

2026-05-03 `/goal` update after the finite-class side-condition reduction:
two remaining routine finite-class assumptions are now discharged locally.
`bddAbove_vdVWWeightedClassValueSet_of_finite` proves boundedness of the
weighted value set from finite index classes, and
`integrable_vdVWTruncatedClassFun_of_integrable` plus
`integrable_envelope_tail_of_integrable` provide the truncation/tail
integrability bridges from ordinary measurable integrability.  Consequently
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`
no longer assumes separate truncated-class integrability or finite-class
boundedness; those are derived from coordinate measurability, original-class
integrability, envelope measurability, and finite `indexClass`.

2026-05-03 `/goal` update after the finite-center integrability closure:
`integrable_vdVWFiniteCenterWeightedSupremum_of_truncated_rademacher`
now derives finite-empirical-cover Rademacher center-supremum integrability
from the compiled one-center `HasSubgaussianMGF` bridge, the truncated
variance-proxy bound, and the finite-center sub-Gaussian integrability
handoff.  This removes the explicit finite-center integrability assumption
from the selected fixed-radius tail/untruncated wrappers and from
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`.
Search record for this edit: local `Theorem243.lean` already had
`vdVWTheorem243_oneCenter_rademacher_subGaussian_bridge`,
`vdVWTheorem243_truncated_varianceProxy_le`, and
`vdVWTheorem243_finiteCenter_iSup_abs_integrable_of_hasSubgaussianMGF_of_pos`;
pinned mathlib supplies the underlying `HasSubgaussianMGF` API but no VdVW
finite empirical-cover supremum specialization.

2026-05-03 `/goal` update after the centered-cover closure:
`VdVWMeasurableCover.centered_truncated_of_countable_of_coordinate` now derives
the centered truncated measurable cover from countability, coordinate
measurability, and envelope measurability by combining
`VdVWPMeasurableClass.of_countable_of_measurable` with
`VdVWMeasurableCover.ofNullMeasurable_ofReal`.  The finite-class untruncated
consumer no longer carries the separate `Ucentered` assumption; it derives the
cover internally from `hindex_finite.countable`, `hclass`, and `henv`.
Search record for this edit: local `PMeasurable.lean` already supplies the
countable null-measurable class constructor, local `OuterExpectation.lean`
supplies the `ENNReal.ofReal` measurable-cover constructor, and no new mathlib
primitive was needed.

2026-05-03 `/goal` update after the finite-class centered-supremum
integrability closure: the finite nonempty-class untruncated consumer now also
derives the centered truncated weighted-class supremum integrability input
internally.  New compiled helpers in `Theorem243.lean` are
`integrable_vdVWWeightedSampleSum_of_integrable`,
`vdVWWeightedClassSupremum_le_sum_abs_of_finite`, and
`integrable_vdVWWeightedClassSupremum_of_finite`.  The proof bounds the finite
class supremum by the finite sum of absolute fixed-index weighted sample sums,
then applies the product-coordinate integrability of each fixed class member.
Consequently
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`
no longer assumes `hcenteredSupIntegrable`; it derives it from finite
`indexClass`, countable coordinate measurability, envelope measurability, and
ordinary class-member integrability.  Search record for this edit: local
`Theorem243.lean` already had the weighted-sum display, finite value-set
boundedness, countable measurable-class constructors, and truncated-class
integrability helpers; pinned mathlib supplies
`MeasureTheory.integrable_comp_eval`, `MeasureTheory.integrable_finsetSum`,
and `Integrable.mono'`.

2026-05-03 `/goal` update after the finite-class pair/sample integrability
closure: four more finite-class assumptions are now discharged internally.
New compiled helpers in `Theorem243.lean` are
`measurable_vdVWWeightedClassSupremum_of_countable`,
`integrable_vdVWWeightedClassSupremum_truncated_of_finite`,
`integrable_vdVWWeightedClassSupremum_pairDifference_ghost_of_finite`, and
`integrable_vdVWWeightedClassSupremum_pairDifference_split_of_finite`.
Consequently
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`
no longer assumes the ghost pair-difference supremum integrability,
ghost-expectation integrability, split-copy supremum integrability, or
sample-side Rademacher supremum integrability hypotheses.  These now follow
from finite `indexClass`, coordinate measurability, envelope measurability,
and ordinary class-member integrability.  Search record for this edit: local
`Theorem243.lean` and `PMeasurable.lean` supply the weighted-sum/supremum
display, countable `biSup` measurability pattern, pair-difference
measurability, and finite supremum integrability helper; pinned mathlib
supplies `MeasureTheory.integrable_comp_eval`,
`MeasureTheory.integrable_finsetSum`, `Integrable.comp_fst`,
`Integrable.comp_snd`, `Integrable.integral_prod_left`, and
`AEMeasurable.biSup`.

2026-05-03 `/goal` update after the finite-class random-sign/product
integrability closure: the remaining theorem-local finite-class
Rademacher/product assumptions are now discharged internally.  New compiled
helpers in `Theorem243.lean` are
`integrable_vdVWWeightedClassSupremum_of_finite_varying_weights`,
`integrable_vdVWWeightedClassSupremum_truncated_rademacher_sign_of_finite`,
`integrable_vdVWWeightedClassSupremum_truncated_rademacher_product_of_finite`,
`integrable_vdVWWeightedClassSupremum_truncated_rademacher_integral_of_finite`,
and
`VdVWMeasurableCover.truncated_rademacher_product_of_finite`.  Consequently
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass`
no longer assumes the random-sign iterated-integral integrability,
product-space Rademacher supremum measurable cover, product-space supremum
integrability, or sign-side supremum integrability fields.  These now follow
from finite `indexClass`, coordinate measurability, envelope measurability,
ordinary class-member integrability, and the existing `HasSubgaussianMGF`
sign hypotheses.  Search record for this edit: local
`Theorem243.lean` supplied the weighted-sum/supremum displays, finite-class
finite-sum domination, truncated-coordinate integrability, and measurable-cover
constructors; pinned mathlib supplied `HasSubgaussianMGF.integrable`,
`Integrable.mul_prod`, `MeasureTheory.integrable_comp_eval`,
`MeasureTheory.integrable_finsetSum`, `Integrable.integral_prod_left`,
`AEMeasurable.biSup`, and `VdVWMeasurableCover.ofAEMeasurable`.

2026-05-03 follow-up `/goal` update after canonical iid-sign instantiation:
the finite-class untruncated consumer is now available without caller-supplied
auxiliary Rademacher signs.  New compiled declarations are
`exists_common_iid_vdVWRademacherSigns`, a common countable iid
Rademacher-sign probability space built from mathlib `ProbabilityTheory.exists_iid`,
`HasLaw.comp`, `iIndepFun.comp`, `iIndepFun.precomp`, and sub-Gaussian
identical-distribution transport, and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass_iidRademacher`,
which restricts the common signs to each `Fin n` and calls the finite-class
consumer.  Search record: local `Theorem243.lean` already had the VdVW
Bool-to-real Rademacher law, sub-Gaussian proof, and finite iid construction;
`StatInference/ProbabilityMeasure/Rademacher.lean` has parallel reusable
Billingsley-lane wrappers; pinned mathlib supplied `exists_iid` and
`iIndepFun.precomp` for the countable-to-finite restriction.

2026-05-03 follow-up `/goal` update after canonical finite-class sample-path
instantiation: the finite-class route now also has
`vdVWCanonicalSampleProcess`,
`samplePath_vdVWCanonicalSampleProcess`, and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_finite_indexClass_canonical`.
This removes caller-facing `X`/`hX_samplePath` plumbing from the finite-class
iid-Rademacher consumer, at the honest cost of `[Inhabited Observation]` for
irrelevant coordinates outside the terminal sample.  Search record: local
`EndpointSamples.lean` shows `samplePath X sample n` only reads coordinates
`< n`; local `Theorem243.lean` finite-class iid consumer supplies the target;
no mathlib theorem is needed beyond ordinary `Fin` simplification.

Current compact `/goal` execution prompt: continue VdV&W Chapters 1-2 in
dependency order without repeating closed Theorem 2.4.3 finite-net,
selected-fixed-radius, finite-class, integrability, centered-cover, and
centered-supremum/pair/sample/random-sign product integrability, canonical
common iid Rademacher sign instantiation, canonical finite-class sample-path
instantiation, and
untruncation layers.  The active closure batch is the actual non-finite
theorem handoff from textbook entropy assumptions to selected fixed-radius
tail/UI or deterministic log-ratio inputs; if that blocks after Lean/search,
move to a theorem-critical finite-class specialization or a precise Chapter 1
arbitrary-map/asymptotic-measurability primitive.

Next exact edit: do not repeat the finite-class geometry/entropy/consumer
bridge, finite-center integrability closure, centered-cover closure, or
centered-supremum/pair/sample/random-sign product integrability closure, and
do not ask theorem callers to provide iid Rademacher signs in the finite-class
route or terminal sample-path plumbing in the canonical finite-class route.
The
remaining Theorem 2.4.3 proof work is now either (1) prove the actual
non-finite-class
geometric packing/cardinality estimate for the chosen empirical internal
cover/maximal separated set, for example
`Metric.coveringNumber (⟨eta, _⟩ : ℝ≥0)
  (EmpiricalL1Index.liftSet ...) <= base eta ^ n` at the terminal sample
size under the correct textbook structural assumptions, or (2) consume the
new finite-class untruncated consumer in a theorem-critical final finite-class
statement if that is the next honest closure.  If the non-finite geometric
packing route blocks, record the precise additional book-level structural or
uniform-integrability/tail-expectation condition needed to keep the final
Theorem 2.4.3 statement honest.
The remaining analytic gap is no longer selected-cardinality measurability/log
convergence under countability, nor the fixed-`M`/untruncated consumer
composition, nor a missing tail/UI consumer, nor converting a deterministic
log-ratio bound into tail/UI; it is deriving such a deterministic log-ratio
bound, or a genuinely stronger tail/UI theorem, from
`log N(η, F_M, L1(P_n)) = o_P^*(n)` for each fixed `η`, or showing that an
explicit uniform-integrability/tail-expectation input must be part of the
current Lean theorem interface.
The finite-cover domination, terminal selected-cardinality equality,
measurability transport, fixed-`M` centered-truncated consumers,
inverse-radius and fixed-radius consumers, finite-net tail/UI adapters,
untruncation handoffs, and symmetrization/product finite-net route are already
compiled.

2026-05-03 `/goal` update after fixed-sample trace-cover closure:
`StatInference/EmpiricalProcess/CoveringPrimitive.lean` now has the
theorem-facing finite-trace empirical-cover primitive.  New compiled
declarations are `empiricalTrace`,
`empiricalL1Distance_eq_zero_of_empiricalTrace_eq`,
`empiricalL1Distance_le_of_empiricalTrace_eq`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_trace_centerSet`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_trace_centerSet_card_le`,
`empiricalL1CoveringNumber_le_of_finite_trace_centerSet`,
`empiricalL1CoveringNumber_le_of_finite_trace_centerSet_card_le`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_trace_image`,
`empiricalL1CoveringNumber_le_of_finite_trace_image`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_trace_image_card_le`, and
`empiricalL1CoveringNumber_le_of_finite_trace_image_card_le`.  Search record:
local `CoveringPrimitive.lean` already supplied finite-center empirical-cover
and padding adapters; pinned mathlib supplied finite-image/cardinality APIs
such as `Set.ncard_image_le`, but no fixed-sample trace-to-empirical-cover
primitive existed.  This closure gives the next non-finite route a clean
bridge from a combinatorial finite trace count, VC/Sauer trace count, or
sample discretization argument to a deterministic empirical `L1(P_n)` cover.
It does not by itself prove the full book entropy hypothesis; the remaining
structural task is to bound or control the number of distinct traces (or
selected fixed-radius cover cardinalities) under the theorem's assumptions.

Current compact `/goal` execution prompt: continue VdV&W Chapters 1-2 in
dependency order without repeating closed Theorem 2.4.3 finite-net,
selected-fixed-radius, finite-class, integrability, centered-cover,
centered-supremum/pair/sample/random-sign product integrability, canonical
iid-sign/sample-path instantiations, untruncation, or fixed-sample trace-cover
bridges.  The active closure batch is now a structural non-finite entropy
handoff: prove a theorem-facing trace-count / VC-Sauer / empirical internal
cover cardinality estimate that feeds the selected fixed-radius tail/UI
package through the new trace-cover declarations, or honestly record the exact
missing structural hypothesis before moving to the next Chapter 1
arbitrary-map/asymptotic-measurability primitive needed by the exact textbook
statement.

2026-05-04 `/goal` update after finite-trace selected fixed-radius package
closure: `StatInference/EmpiricalProcess/Theorem243.lean` now connects the
fixed-sample trace-cover layer to the random empirical-cover and Theorem 2.4.3
selected fixed-radius tail/UI packages.  New compiled declarations are
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_trace_image_cardinality_bound`,
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_trace_image_cardinality_bound_samplePath`,
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_trace_image_cardinality_bound_samplePath`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_terminal_pow`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_succ_terminal_pow`.
Search record: local `VdVWRandomEmpiricalL1CoveringNumberLeCardinality`
already had constructors from induced empirical internal-covering numbers and
finite index classes; no finite-trace random-cover or selected fixed-radius
constructor existed.  The new route uses the compiled `empiricalTrace` finite
image cover lemmas plus the existing terminal `base^n` log-bound/tail/UI
constructors.

Important remaining gap: these finite-trace constructors still require the
fixed-radius stochastic entropy field
`vdVWLogEmpiricalL1CoveringCardinality (cardinality eta n) sample n / n -> 0`
in outer probability.  A terminal `cardinality <= base eta ^ n` bound only
supplies boundedness/tail UI, not convergence to zero.  The next exact edit is
therefore a theorem-facing trace-count/VC-Sauer/polynomial-cardinality route
whose normalized log cardinality tends to zero, or a proof that the precise
polynomial/VC assumption must be added as the honest interface for the current
Lean theorem before full Theorem 2.4.3 assembly.

2026-05-04 `/goal` update after deterministic-rate entropy bridge closure:
`StatInference/EmpiricalProcess/Theorem243.lean` now has the missing
outer-probability adapter that turns a deterministic normalized
log-cardinality rate into the VdV&W stochastic entropy field.  New compiled
declarations are
`VdVWConvergesInOuterProbabilityConst_zero_of_nonneg_le_tendsto_bound`,
`VdVWConvergesInOuterProbabilityConst_zero_of_logCardinality_div_le_tendsto_bound`,
`VdVWConvergesInOuterProbabilityConst_zero_of_real_log_cardinality_div_le_tendsto_bound`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_div_tendsto_bound`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_logCardinality_div_tendsto_bound`.
Search record: local outer-probability monotonicity
`VdVWConvergesInOuterProbabilityConst_zero_of_nonneg_le` and deterministic
constant convergence `VdVWConvergesInOuterProbabilityConst_of_tendsto_const`
were sufficient; pinned mathlib asymptotic log APIs such as
`Real.isLittleO_log_id_atTop`, `IsLittleO.comp_tendsto`, and
`Real.log_natCast_le_rpow_div` remain available for later concrete
polynomial/VC cardinality rates, but no ready VdVW normalized
log-cardinality-to-outer-probability adapter existed locally.

Remaining blocker is now narrower: prove a concrete theorem-facing structural
cardinality estimate, for example VC/Sauer/polynomial trace growth, and its
deterministic rate hypothesis
`Tendsto (rate eta) atTop (𝓝 0)` plus
`log(cardinality eta n sample n + 1) / n <= rate eta n`.  Once that is
available, the selected fixed-radius tail/UI package and untruncated
Theorem 2.4.3 consumers no longer need a separate stochastic entropy proof.

2026-05-04 `/goal` update after log-linear/polynomial-rate package closure:
`StatInference/EmpiricalProcess/Theorem243.lean` now also has the concrete
asymptotic arithmetic and package constructors for polynomial or VC/Sauer
growth once it is expressed as a log-linear trace-count bound.  New compiled
declarations are `tendsto_log_nat_div_atTop_nhds_zero`,
`tendsto_const_add_mul_log_nat_div_atTop_nhds_zero`,
`const_add_mul_log_nat_div_le_const_add`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_log_linear_bound`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_log_linear`.
Search record: pinned mathlib's `Real.isLittleO_log_id_atTop` and
`Asymptotics.IsLittleO.natCast_atTop` give `log n / n -> 0`; local selected
fixed-radius package constructors supply the theorem-facing tail/UI handoff.

Remaining blocker is now the actual combinatorial theorem, not analytic
asymptotics: prove a finite trace/VC/Sauer/polynomial cardinality estimate of
the form
`Real.log ((cardinality eta n sample n : ℝ) + 1) <= offset eta + degree eta * Real.log (n : ℝ)`
with nonnegative `offset` and `degree`, or state the exact additional
structural assumption needed for this estimate.  That estimate will feed the
compiled log-linear finite-trace constructor directly.

2026-05-04 `/goal` update after shifted log-linear package closure:
`StatInference/EmpiricalProcess/Theorem243.lean` now also supports the more
natural polynomial/VC spelling with `log (n + 1)`, avoiding a special
sample-size-zero cardinality case.  New compiled declarations are
`tendsto_log_nat_succ_div_atTop_nhds_zero`,
`tendsto_const_add_mul_log_nat_succ_div_atTop_nhds_zero`,
`const_add_mul_log_nat_succ_div_le_const_add`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_log_succ_linear_bound`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_log_succ_linear`.
Search record: the proof reuses the already compiled `log n / n -> 0`, mathlib
`tendsto_add_atTop_nat`, `tendsto_const_div_atTop_nhds_zero_nat`, and
`Real.log_le_sub_one_of_pos` to get the shifted rate and deterministic bound.

The exact next theorem-facing edit is now combinatorial: prove a trace-count
or VC/Sauer estimate in the shifted log-linear form
`Real.log ((cardinality eta n sample n : ℝ) + 1) <= offset eta + degree eta * Real.log (((n + 1 : ℕ) : ℝ))`.
That theorem should then be fed directly into
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_log_succ_linear`.

2026-05-04 `/goal` update after natural polynomial package closure:
`StatInference/EmpiricalProcess/Theorem243.lean` now also compiles the direct
polynomial-cardinality bridge for estimates of the form
`cardinality eta n sample n + 1 <= C eta * (n + 1) ^ d eta`.  New declarations
are
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_nat_poly_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_nat_poly`.
Search record: mathlib supplies the set-family Sauer-Shelah layer in
`Mathlib.Combinatorics.SetFamily.Shatter` (`Finset.card_le_card_shatterer`,
`Finset.card_shatterer_le_sum_vcDim`), plus real-log arithmetic
`Real.log_le_log`, `Real.log_mul`, `Real.log_pow`, and `Real.log_nonneg`.
There is still no ready real-valued VdVW truncated-trace VC/Sauer theorem in
mathlib or local `StatInference`.

The exact next theorem-facing edit is now structural, not analytic: prove a
class-specific trace-count theorem giving
`((cardinality eta n sample n : ℝ) + 1) <= C eta * (((n + 1 : ℕ) : ℝ) ^ d eta)`
for the truncated empirical trace image or for a maximal separated/internal
cover.  Feed that theorem into
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_nat_poly`.

2026-05-04 `/goal` update after local VC/Sauer wrapper closure:
`StatInference/EmpiricalProcess/VCSauer.lean` now wraps mathlib's finite
set-family Sauer-Shelah theorem in the form needed by the VdVW entropy route.
New compiled declarations are `vdVWSauerShelah_card_le_sum_vcDim`,
`vdVWSauerShelah_card_le_sum_of_vcDim_le`,
`vdVWSauerShelah_card_add_one_le_nat_poly_of_vcDim_le`, and
`vdVWSauerShelah_card_add_one_real_le_nat_poly_of_vcDim_le`.  The last two
prove the coarse but directly usable bound
`#family + 1 <= (d + 2) * (N + 1)^d` from `vcDim family <= d` and ground-set
size `<= N`.

Search record: reused mathlib `Mathlib.Combinatorics.SetFamily.Shatter`
(`Finset.card_le_card_shatterer`, `Finset.card_shatterer_le_sum_vcDim`) and
`Mathlib.Data.Nat.Choose.Bounds` (`Nat.choose_le_pow`).  No exact local/mathlib
bridge was found from VdVW real-valued truncated traces to binary set-family
VC dimension.

The exact next theorem-facing edit is now to connect a concrete VdVW class
(indicator/subgraph/thresholded truncated traces, or a maximal separated
internal-cover construction) to a finite set family `family : Finset (Finset α)`
whose cardinality controls the empirical trace image and whose `vcDim` is
bounded.  Then apply
`vdVWSauerShelah_card_add_one_real_le_nat_poly_of_vcDim_le` and feed the result
to
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_image_cardinality_bound_nat_poly`.

2026-05-04 `/goal` update after binary empirical-trace VC bridge closure:
`StatInference/EmpiricalProcess/BinaryTraceVC.lean` now connects `{0,1}`-valued
fixed-sample empirical traces to the local Sauer polynomial wrapper.  New
compiled declarations include `empiricalBinaryTraceSet`,
`empiricalBinaryTraceSetFamily`, `empiricalBinaryTraceFunction`,
`empiricalTrace_eq_binaryTraceFunction_of_sample_binary`,
`finite_empiricalTrace_image_of_sample_binary`,
`empiricalTrace_image_toFinset_card_le_binaryTraceSetFamily_card`, and
`empiricalTrace_image_card_add_one_real_le_vc_nat_poly_of_sample_binary`.
The final theorem proves that if the realized binary trace family has
`vcDim <= d`, then the real empirical trace image satisfies
`traceCard + 1 <= (d + 2) * (n + 1)^d`.

Search record: reused local `empiricalTrace`, mathlib/local finite-set
cardinality APIs `Set.ncard_le_ncard`, `Set.ncard_image_le`,
`Set.ncard_eq_toFinset_card`, and the new
`vdVWSauerShelah_card_add_one_real_le_nat_poly_of_vcDim_le`.  No exact
general real-valued VdVW subgraph/threshold trace bridge was found.

The exact next theorem-facing edit is now the subgraph/threshold lift: encode
bounded real-valued truncated traces by binary threshold/subgraph traces with
controlled VC dimension, or prove an independent maximal-separated/internal
cover cardinality bound.  The pure binary indicator case is now closed.

2026-05-04 `/goal` update after fixed-threshold subgraph bridge closure:
`StatInference/EmpiricalProcess/SubgraphTraceVC.lean` now exposes the first
real-valued subgraph entry point.  New compiled declarations are
`thresholdIndicatorClassFun`, `thresholdIndicatorClassFun_sample_binary`,
`empiricalBinaryTraceSet_thresholdIndicatorClassFun_eq`, and
`thresholdIndicator_trace_card_add_one_real_le_vc_nat_poly`.  For each fixed
threshold, the thresholded class consumes the binary empirical-trace Sauer
bridge under a `vcDim` bound on the realized threshold trace family.

Search record: local `BinaryTraceVC` closes the `{0,1}` case; no ready
mathlib/local theorem was found that uniformly reconstructs or bounds a
general real-valued truncated trace image from all threshold/subgraph traces.

The exact next theorem-facing edit is now the uniform subgraph lift: prove a
finite-threshold or subgraph coding theorem that bounds the number of distinct
bounded real-valued truncated traces by controlled threshold trace families, or
switch to a maximal-separated/internal-cover cardinality proof.  Fixed
thresholds alone are compiled but do not yet bound full real-valued traces.

Search note for the finite product layer: the finite-sample route can use
mathlib's finite `Pi` product APIs rather than only binary products.  Relevant
APIs found and used are `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.iIndepFun.hasLaw_pi`,
`MeasureTheory.measurePreserving_eval`, and `MeasureTheory.Measure.pi_map_pi`.
These now support `probability_pi_map_mapped_coordinates_eq`,
`probability_pi_independent_mapped_coordinates_with_joint_law`,
`probability_pi_integral_weighted_sum`,
`probability_pi_integral_weighted_sum_eq_zero`,
`probability_pi_integral_weighted_sum_const_sub`,
`probability_pi_integral_prod_fst_sub_snd_weighted_sum_eq_zero`, and the
VdV&W-facing `vdVWTheorem243_productSample_truncatedClassFun_coordinates_laws_indep`
plus
`integral_vdVWTruncatedClassFun_productSample_pairDifference_weightedSum_eq_zero`
and `integral_vdVWTruncatedClassFun_productSample_const_sub_eq`.

## Parked Example-Specific Blocker

Deferred target: Example 2.4.2, empirical CDF half-line class.

The proved local layer already turns supplied extended-real endpoint grids into
finite `L1(P)` bracketing-number witnesses and then into the conditional
half-line Glivenko-Cantelli result.  The remaining blocker is:

```text
Build the distribution-dependent finite middle partition / quantile cutpoints
for a probability measure on R, then append finite lower and upper tails to
obtain an unconditional SuppliedERealHalfLineEndpointGrid.
```

## Reuse Audit

Pinned/local Lean sources searched before adding new primitives:

| Source | Local path | Useful APIs found |
| --- | --- | --- |
| pinned mathlib | `.lake/packages/mathlib/Mathlib` | `Metric.externalCoveringNumber`, `Metric.coveringNumber`, `Metric.IsCover`, `externalCoveringNumber_mono_set`, `Set.indicator`, `Measurable.indicator`, `measurableSet_le`, `Asymptotics.IsLittleO`, `MeasureTheory.TendstoInMeasure`, `Real.log`, `Real.log_nonneg`, `Real.log_natCast_nonneg`, `Real.sqrt`, `Real.sqrt_nonneg`, `ENat.toNat`, `ENat.map`, `WithTop.untopD`, `PMF.bernoulli`, `ProbabilityTheory.exists_hasLaw_indepFun`, `Kernel.HasSubgaussianMGF`, `HasSubgaussianMGF`, `HasSubgaussianMGF.neg`, `HasSubgaussianMGF.measure_ge_le`, `hasSubgaussianMGF_of_mem_Icc`, `hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`, `measure_sum_range_ge_le_of_iIndepFun`, `measure_sum_ge_le_of_iIndepFun`, `measure_sum_ge_le_of_hasCondSubgaussianMGF`, `MeasureTheory.measureReal_union_le`, `MeasureTheory.measureReal_iUnion_fintype_le`, `exists_eq_ciSup_of_finite`, `eLpNorm`, `eLpNorm_one_eq_lintegral_enorm`, `eLpNorm_add_le`, `eLpNorm_sum_le`, plus previous Example 2.4.2 APIs: `ProbabilityTheory.cdf`, `ProbabilityTheory.measure_cdf`, `ProbabilityTheory.cdf_eq_real`, `ProbabilityTheory.tendsto_cdf_atBot`, `ProbabilityTheory.tendsto_cdf_atTop`, `StieltjesFunction.measure_Ioo`, `measure_Iio`, `measure_Ioi`, `tendsto_measure_Iic_atTop`, `tendsto_measure_Ici_atBot`, `Measure.real`, `measureReal_mono`, `Fin.cases`, `Fin.lastCases`, `Fin.snoc`, `Fin.cons`, `Fin.eq_castSucc_or_eq_last` |
| local ProbabilityMeasure lane | `StatInference/ProbabilityMeasure` | Billingsley/probability-measure wrappers now available for generated sigma fields and pi-system uniqueness (`GeneratedSigma`, `generatedSigma_measurableSet_of_mem`, `generatedSigma_le`, `measurable_generatedSigma`, `measure_ext_of_generate_finite`, `probabilityMeasure_ext_of_generate_finite_toMeasure`, `probabilityMeasure_ext_of_generate_finite`, `isPiSystem_pi`, `pi_generatedSigma_eq`), weak convergence/Portmanteau including continuity-set, closed-set converse, and pi-system convergence wrappers, product/Fubini including self-copy and mapped-coordinate joint-law independence, FDDs, Borel-Cantelli, tails including ordinary dominated-convergence tail cutoff, strong laws, and reusable iid Rademacher signs. These are reusable for Chapter 1 generated-sigma/FDD/product-law foundations and later symmetrization support, but they do not close VdV&W arbitrary-map/asymptotic-measurability or the remaining Theorem 2.4.3 fixed-`M` truncated convergence and final assembly blockers. |
| pinned packages | `.lake/packages/{aesop,batteries,proofwidgets,LeanSearchClient,Qq,Cli,plausible,importGraph}` | tactic/support libraries, no empirical-CDF bracketing theorem and no VdV&W-style Orlicz maximal theorem found |
| local AI-Statistician checkout | `/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician` | older/high-level Rademacher and empirical-process certificate interfaces only; no exact VdV&W half-line quantile grid theorem and no reusable Theorem 2.4.3 Orlicz/Hoeffding proof |
| local empirical blueprint worktree | `/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician/.worktrees/empirical-blueprint` | high-level empirical-process certificates; no reusable measure-theoretic quantile grid proof, iid Rademacher construction, or finite-center maximal proof |
| local Aristotle download | `/Users/yukang/Downloads/2ee0bdf3-d67d-4ce3-ac7e-b87dfe7f9455_aristotle` | no relevant empirical-process/CDF partition layer found |

No direct open-source Lean theorem was found that states VdV&W Example 2.4.2
or the needed finite CDF-increment partition for arbitrary real probability
measures.  Reuse should therefore keep leaning on pinned mathlib's CDF,
Stieltjes, measure, and `Fin` tuple APIs.

## Local Lean Source Access

The project has local searchable access to the pinned Lake dependency store
through `.lake/packages`, including `mathlib`, `aesop`, `batteries`,
`proofwidgets`, `LeanSearchClient`, `Qq`, `Cli`, `plausible`, and
`importGraph`.  The package revisions are fixed by `lake-manifest.json`, so
proof work should treat those local checkouts as the authoritative API surface.

The current audit also checked nearby local open-source Lean workspaces under
`/Users/yukang/Desktop` and `/Users/yukang/Downloads`, including the
AI-Statistician checkout, its empirical-blueprint worktree, and the local
Aristotle download.  A broader `/Users/yukang` filesystem search can hit macOS
protected directories, but the targeted Lean source locations relevant to this
project are readable and searchable with `rg`/`find -L`.

Before adding a primitive for this blocker, search at least:

```text
.lake/packages/mathlib/Mathlib
.lake/packages/batteries/Batteries
/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician
/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician/.worktrees/empirical-blueprint
/Users/yukang/Downloads/2ee0bdf3-d67d-4ce3-ac7e-b87dfe7f9455_aristotle
```

Record any useful APIs found here before re-proving a shared measure-theory,
CDF, finite-index, or integration lemma locally.

## Primitive Lemma Sequence

### 1. Tail-Appending Endpoint Constructor

Status: implemented as a compiled local primitive in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declarations:

```lean
SuppliedERealHalfLineEndpointGrid.endpointWithRealTails
SuppliedERealHalfLineEndpointGrid.ofMiddleCDFPartitionWithTails
```

The implemented constructor appends `⊥` and `⊤` around the existing real
compact-core grid:

```lean
noncomputable def SuppliedERealHalfLineEndpointGrid.withRealTails
    {μ : Measure ℝ} {epsilon : ℝ} {middleCells : ℕ}
    (endpoint : Fin (middleCells + 1) -> ℝ)
    (hendpoint_strictMono : StrictMono endpoint)
    (hleftTail : μ.real (Set.Iio (endpoint 0)) < epsilon)
    (hrightTail : μ.real (Set.Ioi (endpoint (Fin.last middleCells))) < epsilon)
    (bracketOfMiddle : ℝ -> Fin middleCells)
    (left_le_middle : ...)
    (middle_lt_right : ...)
    (middle_width_lt : ∀ cell, μ.real (Set.Ioo ... ...) < epsilon) :
    SuppliedERealHalfLineEndpointGrid μ epsilon (middleCells + 2)
```

Preferred API route: use `Fin.cons` for the lower `⊥` endpoint and `Fin.snoc`
for the upper `⊤` endpoint; use `Fin.cases`, `Fin.lastCases`,
`Fin.snoc_castSucc`, `Fin.snoc_last`, and `Fin.succ_last` for simplification.
The compiled proof uses this route, plus `Fin.castSucc_succ` for the middle
and upper-tail adjacent endpoint simplifications.

### 2. Bounded Middle Partition Interface

Status: implemented as a compiled local primitive in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declarations:

```lean
SuppliedRealMiddleCDFPartition
SuppliedRealMiddleCDFPartition.endpoint_left_lt_right
SuppliedRealMiddleCDFPartition.cell_width_lt
```

This proof-carrying interface is not yet quantile existence:

```lean
structure SuppliedRealMiddleCDFPartition
    (μ : Measure ℝ) (epsilon a b : ℝ) (middleCells : ℕ) where
  endpoint : Fin (middleCells + 1) -> ℝ
  strictMono : StrictMono endpoint
  left_eq : endpoint 0 = a
  right_eq : endpoint (Fin.last middleCells) = b
  bracketOf : ∀ c : ℝ, a ≤ c -> c < b -> Fin middleCells
  left_le : ...
  lt_right : ...
  cdf_increment_lt :
    ∀ cell,
      Function.leftLim (ProbabilityTheory.cdf μ) (endpoint (Fin.succ cell)) -
        ProbabilityTheory.cdf μ (endpoint (Fin.castSucc cell)) < epsilon
```

Then use the already proved
`measureReal_Ioo_lt_of_cdf_leftLim_sub_lt` to get the middle `L1(P)` widths.
The compiled theorem `SuppliedRealMiddleCDFPartition.cell_width_lt` performs
that handoff.

### 3. Middle Partition To Endpoint Grid

Status: implemented as a compiled local theorem in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declaration:

```lean
SuppliedERealHalfLineEndpointGrid.exists_endpointGrid_of_realMiddleCDFPartition
```

This combines the partition interface with finite tail cutpoints:

```lean
theorem exists_endpointGrid_of_realMiddleCDFPartition
    (μ : Measure ℝ) [IsProbabilityMeasure μ] {epsilon a b : ℝ}
    (hleftTail : μ.real (Set.Iio a) < epsilon)
    (hrightTail : μ.real (Set.Ioi b) < epsilon)
    (partition : SuppliedRealMiddleCDFPartition μ epsilon a b middleCells) :
    ∃ cellCount, Nonempty
      (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)
```

This is the clean bridge from quantile work to the existing bracketing-number
and GC handoffs.

### 4. Quantile / Cutpoint Existence

Prove the actual distribution-dependent finite partition theorem:

```lean
theorem exists_realMiddleCDFPartition
    (μ : Measure ℝ) [IsProbabilityMeasure μ]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) (hab : a < b) :
    ∃ middleCells, Nonempty
      (SuppliedRealMiddleCDFPartition μ epsilon a b middleCells)
```

Likely proof route:

1. Use `ProbabilityTheory.cdf` monotonicity and boundedness in `[0,1]`.
2. Choose `N : ℕ` with `1 / (N + 1 : ℝ) < epsilon`.
3. Define cut levels in CDF space and choose real cutpoints by `sInf` of
   level sets `{x | level ≤ cdf μ x}` or an equivalent proof-carrying
   primitive.
4. Use monotonicity and `Function.leftLim` to prove adjacent open-cell
   increments are below `epsilon`.
5. Keep atoms safe by using open cells and the Stieltjes `leftLim` identity.

This is the only hard mathematical blocker left for Example 2.4.2.

### 5. Unconditional Example 2.4.2 Handoff

Status: partially implemented as a compiled reduction theorem in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declaration:

```lean
SuppliedERealHalfLineEndpointGrid.exists_forall_of_forall_realMiddleCDFPartition
```

This theorem proves that finite tail cutpoints plus bounded middle partition
existence on every strict bounded interval imply full endpoint-grid existence
for every positive radius.  The remaining missing theorem is therefore exactly
the middle partition existence theorem in Step 4.

After Step 4, the final endpoint-grid statement is:

```lean
theorem exists_suppliedERealHalfLineEndpointGrid_probability
    (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    ∀ epsilon, 0 < epsilon ->
      ∃ cellCount, Nonempty
        (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)
```

Then the existing declarations already give:

```lean
SuppliedERealHalfLineEndpointGrid.l1BracketingNumber_lt_top_forall
vdVW_realHalfLine_glivenkoCantelli_of_suppliedERealHalfLineEndpointGrids
```

That closes the Lean side needed for the exact Example 2.4.2 theorem report.

## Automation Rule

Every heartbeat should check this file before choosing a new primitive.  If a
mathlib or local-code search finds a reusable theorem for one of the steps
above, update this file and reuse that theorem rather than duplicating it.

## 2026-05-04 `/goal` update: finite-code empirical trace bridge

`StatInference/EmpiricalProcess/TraceCoding.lean` adds the generic finite-code
layer between structural coding arguments and Theorem 2.4.3 entropy
constructors.  New compiled declarations:

```lean
finite_empiricalTrace_image_of_finite_code
empiricalTrace_image_toFinset_card_le_finite_code
empiricalTrace_image_card_add_one_real_le_of_finite_code_nat_poly
```

These prove that if the realized empirical trace image is injectively coded
into a finite `Finset Code`, then the trace image is finite, its cardinality is
bounded by `codeSet.card`, and any supplied natural-polynomial bound on the
code set transfers to the trace image.

Search record: reused pinned mathlib finite-image/cardinality APIs
`Set.Finite.of_finite_image`, `Set.ncard_le_ncard_of_injOn`,
`Set.ncard_eq_toFinset_card`, and `Set.ncard_coe_finset`; reused local
`empiricalTrace` from `CoveringPrimitive`.  No existing local/mathlib theorem
provided this exact VdV&W finite-code trace bridge.

Next exact theorem-facing edit: build the structural code itself for the
remaining non-finite real-valued route, either by a uniform finite-threshold /
subgraph coding theorem that injectively codes bounded truncated traces into a
polynomial-size finite code set, or by a maximal-separated/internal-cover
cardinality theorem that directly supplies the natural-polynomial trace bound.

## 2026-05-04 `/goal` update: finite-threshold signature product bridge

`StatInference/EmpiricalProcess/ThresholdCoding.lean` adds the finite-threshold
signature bridge after `TraceCoding`, `BinaryTraceVC`, and `SubgraphTraceVC`.
New compiled declarations:

```lean
thresholdTraceCode
thresholdTraceCodeSet
thresholdTraceCode_empiricalTrace_eq_binaryTraceSet
thresholdTraceCode_mem_thresholdTraceCodeSet
thresholdTraceCode_injOn_empiricalTrace_image_of_separates
finite_empiricalTrace_image_of_thresholdTraceCode_separates
empiricalTrace_image_toFinset_card_le_thresholdTraceCodeSet_card
thresholdTraceCodeSet_card_le_pi_binaryTraceSetFamily_card
empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card
empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_product_bound
threshold_binaryTraceSetFamily_product_card_le_of_forall_card_le
empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_factor_bound
threshold_binaryTraceSetFamily_product_card_le_const_pow
empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_bound
threshold_binaryTraceSetFamily_product_card_le_const_pow_of_card_le
empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_const_factor_card_le
nat_pow_add_one_real_le_nat_poly_of_base_le
empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_base_le_nat_poly
threshold_binaryTraceSetFamily_card_le_vc_nat_poly
empiricalTrace_image_card_add_one_real_le_of_thresholdTraceCode_uniform_vc
thresholdTraceCode_eq_iff_forall_threshold_sample
thresholdTraceCode_separates_of_pointwise_thresholds_separate
finite_empiricalTrace_image_of_pointwise_thresholds_separate
empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card_of_pointwise_thresholds_separate
empiricalTrace_image_card_add_one_real_le_of_pointwise_thresholds_separate_uniform_vc
pointwise_thresholds_separate_of_coordinate_thresholds_separate
thresholdTraceCode_separates_of_coordinate_thresholds_separate
finite_empiricalTrace_image_of_coordinate_thresholds_separate
empiricalTrace_image_toFinset_card_le_pi_binaryTraceSetFamily_card_of_coordinate_thresholds_separate
empiricalTrace_image_card_add_one_real_le_of_coordinate_thresholds_separate_uniform_vc
coordinate_thresholds_separate_of_values_mem_thresholds
thresholdTraceCode_separates_of_values_mem_thresholds
finite_empiricalTrace_image_of_values_mem_thresholds
empiricalTrace_image_card_add_one_real_le_of_values_mem_thresholds_uniform_vc
VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_values_mem_thresholds_uniform_vc
```

These prove that finite threshold signatures, when they separate the realized
real-valued traces, make the empirical trace image finite and bound its
cardinality by the product of the individual fixed-threshold binary trace
family cardinalities.  The final declaration also converts any supplied
product cardinality estimate into the real natural-polynomial
`traceCard + 1 <= C * (n + 1)^d` shape consumed by the Theorem 2.4.3
finite-trace entropy package.  The factorwise declarations additionally turn
per-threshold cardinality bounds into the required product estimate before
using the same theorem-facing handoff.  The common-base declarations specialize
this further to `base ^ thresholds.card`, which is the convenient target when
every fixed-threshold binary trace family has the same VC/Sauer cardinality
bound.  The threshold-count declarations reduce this target further to
`base ^ k` under an explicit `thresholds.card <= k` assumption.  The
base-growth declarations prove the required `base ^ k + 1` polynomial bound
from a polynomial real bound on `base` itself.  The uniform-VC declarations
derive that base from the fixed-threshold Sauer-Shelah wrapper, yielding the
natural-polynomial trace bound from separation, threshold-count, and uniform
fixed-threshold `vcDim <= d` assumptions.

The pointwise-threshold declarations refine the separation surface: equality
of threshold signatures is equivalent to equality of every sample-level
predicate `threshold < trace sampleIndex`, and any proof that those pointwise
threshold predicates separate realized traces now feeds the finite-image,
product-cardinality, and uniform-VC natural-polynomial consumers directly.
This is the next theorem-facing interface for deriving separation from the
actual subgraph/truncated-class geometry, rather than requiring later geometry
proofs to manipulate `Finset` code equality.

The coordinatewise-threshold declarations narrow the same interface one step
further: it is enough to prove, for each sample coordinate, that matching all
threshold predicates forces equality of the two realized real values.  This
feeds the pointwise separation condition and therefore the finite-image,
product-cardinality, and uniform-VC natural-polynomial consumers.  This is a
more local target for the next subgraph/truncated-class geometry proof.

2026-05-06 follow-up: `Theorem243.lean` now consumes this exact
coordinatewise threshold-separation layer directly as a selected fixed-radius
Theorem 2.4.3 input through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_thresholds_separate_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_thresholds_separate_uniform_vc`.
The bridge reuses the finite empirical trace image and VC/Sauer
trace-cardinality theorem
`empiricalTrace_image_card_add_one_real_le_of_coordinate_thresholds_separate_uniform_vc`,
then feeds the result into the selected fixed-radius tail/UI package.  This is
upstream structural progress: endpoint aliases should only be added if a
later final assembly consumes this exact coordinate-threshold route.

The value-membership declarations give a concrete exact-separation sufficient
condition: if the finite threshold set contains every realized coordinate
value, then matching threshold predicates forces equality of those values.
This supplies finite-code separation and the uniform-VC natural-polynomial
trace bound under the same threshold-count and fixed-threshold VC assumptions.
This is useful for finite-valued/discretized traces and also documents why the
non-finite textbook route still needs a genuine geometric or approximation
argument rather than an exact finite threshold injection.

The Theorem 2.4.3 selected fixed-radius constructor now consumes this exact
finite-value threshold route directly.  It defines the selected cardinality as
the threshold-coded finite trace-cardinality at each radius/sample size, proves
random empirical covering domination from the finite trace image, and feeds the
natural-polynomial threshold/VC bound into
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_nat_poly_bound`.
Thus finite-valued/discretized threshold traces no longer need separate
manual plumbing to enter the fixed-radius tail/UI package.

Search record: reused local fixed-threshold declarations in `SubgraphTraceVC`,
the new finite-code bridge in `TraceCoding`, mathlib `Finset.pi`,
`Finset.card_pi`, `Finset.card_le_card_of_injOn`, and finite-product
big-operator APIs from `Mathlib.Data.Fintype.BigOperators`, plus `Finset.ext`
and membership extensionality for the pointwise threshold bridge.  Searches for
`thresholdTraceCode_eq`, `pointwise_threshold`, `threshold.*separate`,
`coordinate.*separate`, `threshold.*coordinate`,
`value.*threshold`, `threshold.*value`, `contains.*values`,
`empiricalTrace.*threshold`, and threshold-indicator trace APIs found no ready
local/mathlib theorem giving this VdVW finite-threshold
signature/product-cardinality, pointwise-separation,
coordinatewise-separation, or value-membership separation bridge.
The selected fixed-radius package search reused
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_logCardinality_nat_poly_bound`
and `VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_trace_image_cardinality_bound_samplePath`;
the direct threshold-to-package constructor did not previously exist.

2026-05-04 `/goal` update after threshold-to-untruncated consumer:
`Theorem243.lean` now also adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_values_mem_thresholds_uniform_vc`.
This composes the finite-value threshold selected fixed-radius tail/UI package
with the already compiled large-`M` untruncation consumer.  Consequently a
finite/discretized threshold route now reaches the centered untruncated
Theorem 2.4.3 conclusion under the existing measurable envelope, integrability,
Rademacher, and product/Fubini hypotheses; it no longer stops at the selected
side-condition package.

Search record for this composition: reused the local declarations
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_values_mem_thresholds_uniform_vc`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedFixedRadiusTailSideConditions`.
No new mathlib theorem was needed because the step is theorem plumbing between
two compiled VdVW-local interfaces.

2026-05-04 `/goal` update after finite realized value-set constructor:
`ThresholdCoding.lean` now adds
`empiricalTrace_image_card_add_one_real_le_of_sample_valueSet_finite_uniform_vc`,
which chooses the threshold finset as the finite set of all real values
actually realized by the class on the current empirical sample.  `Theorem243.lean`
now adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_sample_valueSet_finite_uniform_vc`,
which packages that finite realized value-set route into the selected
fixed-radius tail/UI structure.  This removes the need for callers to provide
an arbitrary threshold finset when they can prove finite realized value-set
finiteness, a cardinality bound, and fixed-threshold VC bounds for the induced
thresholds.
`Theorem243.lean` now also adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_sample_valueSet_finite_uniform_vc`,
which composes this finite realized value-set package with the untruncated
large-`M` convergence consumer.  Thus the finite realized value-set route now
reaches the same centered untruncated Theorem 2.4.3 conclusion under its
explicit structural and integrability hypotheses.

Search record: local searches for finite-value/range helpers found no prior
VdVW constructor with this shape.  The proof reuses mathlib
`Set.Finite.toFinset` / `mem_toFinset` and the compiled local
`empiricalTrace_image_card_add_one_real_le_of_values_mem_thresholds_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_values_mem_thresholds_uniform_vc`.
The untruncated composition reuses
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_values_mem_thresholds_uniform_vc`.

Next exact theorem-facing edit: prove the actual coordinatewise
finite-threshold value-separation/count assumptions, or finite realized
value-set cardinality bounds, from the subgraph/truncated-class geometry; or
provide the
maximal-separated/internal-cover cardinality theorem that bypasses threshold
products and directly supplies the natural-polynomial trace bound consumed by
Theorem 2.4.3.  The exact finite-value threshold route now reaches untruncated
convergence, but it remains too strong for arbitrary continuum-valued classes
unless a finite/discretized trace hypothesis is supplied.

2026-05-04 `/goal` update after approximate-code cover primitive:
`CoveringPrimitive.lean` now adds the approximate finite-code empirical-cover
bridge
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_approx_code`,
`empiricalL1CoveringNumber_le_of_finite_approx_code`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_approx_code_card_le`, and
`empiricalL1CoveringNumber_le_of_finite_approx_code_card_le`.  It also adds
`empiricalL1Distance_le_of_forall_abs_le` plus the pointwise-code consumers
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_pointwise_approx_code_card_le`
and
`empiricalL1CoveringNumber_le_of_finite_pointwise_approx_code_card_le`.
These are the
approximate analogues of the finite exact-trace cover layer: a finite code
image plus the hypothesis that equal codes imply empirical `L1(P_n)` distance
at most `epsilon` gives a local empirical cover, with padded cardinality
versions for entropy estimates.  The pointwise variants reduce that distance
hypothesis to coordinatewise absolute-error bounds on the empirical sample.

Search record: the local exact-trace cover declarations
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_trace_image` and
`empiricalL1CoveringNumber_le_of_finite_trace_image` existed, and mathlib
provides generic finite image/set APIs, but no local theorem supplied the
approximate finite-code cover shape needed for quantized-trace/grid entropy.
The proof reuses `Set.Finite.toFinset`, representative choice from finite code
images, and `FiniteEmpiricalL1CoverAtCard.pad_cardinality`.

Next exact theorem-facing edit: construct an actual quantized-trace code for
bounded truncated classes, prove that equal quantized codes imply empirical
`L1(P_n)` error at most the chosen radius, and bound the code image cardinality
by the VC/subgraph/grid polynomial needed by Theorem 2.4.3.  This is the more
faithful route for arbitrary real-valued classes than exact threshold
separation.

2026-05-04 `/goal` update after coordinate-code cardinality bridge:
`CoveringPrimitive.lean` now adds
`finite_coordinateCode_image`,
`coordinateCode_image_toFinset_card_le_prod`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_pointwise_approx_code_card_le`,
and
`empiricalL1CoveringNumber_le_of_coordinate_pointwise_approx_code_card_le`.
These declarations close the finite vector-code bookkeeping layer needed by
the quantized/grid route: if each sample coordinate code lies in a finite
coordinate code set, then the realized vector-code image is finite and its
cardinality is bounded by the product of the coordinate code-set
cardinalities.  The empirical-cover consumers then combine this product bound
with the existing pointwise approximate-code cover bridge.

Search record: local searches reused the just-added approximate-code cover
bridge and the older exact finite-trace cover layer in
`CoveringPrimitive.lean`, plus finite-code cardinality patterns in
`TraceCoding.lean` and `ThresholdCoding.lean`.  Pinned mathlib search found
the exact product-code APIs `Fintype.piFinset`, `Fintype.mem_piFinset`,
`Fintype.card_piFinset`, `Set.ncard_le_ncard_of_injOn`, and
`Set.ncard_coe_finset`; no local theorem previously supplied this finite
coordinate-code image/product-cardinality bridge for empirical approximate
codes.

Next exact theorem-facing edit: define the concrete bounded quantized trace
code for truncated classes, prove the coordinatewise absolute-error implication
required by
`empiricalL1CoveringNumber_le_of_coordinate_pointwise_approx_code_card_le`,
and replace the crude product bound by a theorem-facing VC/subgraph/grid
cardinality estimate strong enough for the fixed-radius Theorem 2.4.3
side-condition package.  If that final cardinality estimate needs an additional
structural hypothesis, record its exact theorem shape rather than folding it
into a vague entropy assumption.

2026-05-04 `/goal` update after scalar-quantizer empirical-cover bridge:
`CoveringPrimitive.lean` now also adds
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_scalarQuantizer_card_le`
and
`empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_card_le`.  These
bridge the abstract coordinate-code layer to the intended bounded
quantization/grid route: the vector code is now built from scalar coordinate
quantizers applied to the empirical sample values, and equal vector codes reduce
to the scalar equal-code absolute-error hypothesis at each coordinate.

Search record: local searches found no existing scalar-quantizer-to-empirical
cover theorem.  The proof reuses the compiled coordinate-code product bridge
and pointwise approximate-code empirical-cover consumer; no additional mathlib
API beyond function extensionality (`congrFun`) was required.

Next exact theorem-facing edit: instantiate the scalar quantizer with an actual
bounded grid/rounding construction for truncated real values, prove the
coordinate absolute-error condition from the grid cells, and then supply the
nontrivial VC/subgraph/grid cardinality estimate needed to turn this into
Theorem 2.4.3 fixed-radius selected side conditions.  The remaining hard part
is not vector-code construction; it is the geometric/cardinality estimate for
arbitrary real-valued classes.

2026-05-04 `/goal` update after decoder-error quantizer bridge:
`CoveringPrimitive.lean` now adds the real triangle helper
`abs_sub_le_of_abs_sub_decode_le_half` and the decoder-error empirical-cover
consumers
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_scalarQuantizer_decode_error_card_le`
and
`empiricalL1CoveringNumber_le_of_coordinate_scalarQuantizer_decode_error_card_le`.
These are the grid-friendly form of the scalar quantizer route: once every
sampled value is within `epsilon / 2` of its decoded grid representative,
equal quantizer codes imply pointwise `epsilon` closeness and hence an
empirical `L1(P_n)` cover.

Search record: local search found no existing decode-error bridge for
quantized empirical covers.  The proof reused the compiled scalar-quantizer
cover bridge and mathlib's real triangle inequality `abs_add_le`; no new
probability or measurability primitive was required.

Next exact theorem-facing edit: instantiate this decoder-error interface with
a concrete finite grid for bounded truncated real values, most likely using a
floor/rounding API or a supplied finite grid with a proof that every truncated
sample value is within `epsilon / 2` of a decoded cell representative.  After
that, prove or honestly package the VC/subgraph/grid cardinality estimate that
keeps normalized log cardinalities negligible for Theorem 2.4.3.

2026-05-04 `/goal` update after nearest-integer rounding bridge:
`CoveringPrimitive.lean` now imports mathlib's rounding API and adds
`abs_sub_mul_round_div_le_half`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_roundingQuantizer_card_le`,
and
`empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_card_le`.
The scalar quantizer is now concretely instantiated as
`round (x / epsilon)` with decoder `epsilon * code`, and mathlib's nearest
integer theorem proves the decoding error is at most `epsilon / 2`.

Search record: pinned mathlib search found `round`, `round_eq`,
`round_eq_iff`, and `abs_sub_round` in `Mathlib.Algebra.Order.Round`, plus
floor/ceil support in `Mathlib.Algebra.Order.Floor.Ring`.  The proof reuses
`abs_sub_round` and elementary field arithmetic to establish
`|x - epsilon * round (x / epsilon)| <= epsilon / 2`.  No prior local theorem
connected this rounding quantizer to empirical `L1(P_n)` covers.

Next exact theorem-facing edit: prove finite code-set membership and a usable
cardinality estimate for the integer rounding codes under bounded truncated
values, e.g. by bounding `round (x / epsilon)` inside a finite integer interval
when `|x| <= M`, then feeding the resulting finite interval/cardinality bound
into the selected fixed-radius Theorem 2.4.3 side-condition package.  The
remaining major theorem gap is still the VC/subgraph/grid cardinality control,
not the nearest-integer rounding error.

2026-05-04 `/goal` update after rounding interval-code bridge:
`CoveringPrimitive.lean` now adds
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_roundingQuantizer_interval_card_le`
and
`empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_interval_card_le`.
These specialize the rounding quantizer route to coordinate code sets of the
form `Finset.Icc (-bound i) (bound i)`: once lower and upper integer bounds
for each rounded sample coordinate are supplied, finite code-set membership is
discharged by `Finset.mem_Icc`, and the product of interval cardinalities feeds
the empirical covering-number bound.

Search record: local search found the compiled rounding quantizer bridge and
mathlib interval membership/cardinality APIs around `Finset.Icc`; no local
rounding-code interval membership theorem existed.  This step intentionally
keeps the interval-cardinality product bound explicit because the next theorem
must choose bounds from truncated-value envelopes and eventually improve the
cardinality route using VC/subgraph structure.

Next exact theorem-facing edit: prove the integer bounds for
`round (x / epsilon)` from a real truncated-value bound such as `|x| <= M`, and
then prove a usable bound on
`(Finset.Icc (-B) B).card` or its finite-coordinate product.  This closes the
plain bounded-grid route before the harder VC/subgraph/grid cardinality
refinement.

2026-05-04 `/goal` update after bounded rounding-grid closure:
`CoveringPrimitive.lean` now proves the missing real-to-integer bounded-code
bridge.  The compiled declarations are
`round_le_int_of_add_half_le`,
`int_neg_le_round_of_le_sub_half`,
`round_div_mem_intInterval_of_abs_le`,
`card_int_symmetric_Icc`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_roundingQuantizer_abs_bound_interval_card_le`,
`empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_abs_bound_interval_card_le`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_coordinate_roundingQuantizer_abs_bound_symmetric_card_le`,
`empiricalL1CoveringNumber_le_of_coordinate_roundingQuantizer_abs_bound_symmetric_card_le`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_roundingQuantizer_uniform_abs_bound_card_le`, and
`empiricalL1CoveringNumber_le_of_roundingQuantizer_uniform_abs_bound_card_le`.
Thus a uniform truncated-value bound `|f(X_i)| <= M` plus
`M / epsilon + 1/2 <= B` gives an empirical `L1(P_n)` cover with terminal
grid count `(2 * B + 1)^n`.

Search record: this step reused mathlib `round_le_add_half`,
`sub_half_lt_round`, `abs_sub_round`, integer-cast order transport
(`exact_mod_cast`/`Int.cast_le`), `Finset.Icc`, and `Int.card_Icc`.
No prior local theorem converted real truncated-value bounds into finite
rounding-code interval membership or the normalized symmetric interval count.

Next exact theorem-facing edit: use this bounded-grid cover as an input to the
Theorem 2.4.3 fixed-radius side-condition package only when its exponential
grid count is acceptable under an explicit discretization/finite-value
hypothesis.  For the general textbook VC/subgraph route, the remaining
nontrivial blocker is sharper VC/subgraph/grid cardinality control; the plain
uniform grid count `(2B+1)^n` is too large by itself for normalized
log-cardinality convergence.

2026-05-04 `/goal` update after approximate threshold-grid closure:
`ThresholdCoding.lean` now has the missing approximate threshold-signature
route.  The new compiled declarations are
`finite_thresholdTraceCode_image`,
`thresholdTraceCode_image_toFinset_card_le_thresholdTraceCodeSet_card`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_thresholdTraceCode_coordinate_approx_card_le`,
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_coordinate_approx_card_le`,
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_coordinate_approx_product_card_le`,
`abs_sub_le_of_forall_gap_exists_threshold`,
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_gap_grid_product_card_le`,
`threshold_binaryTraceSetFamily_product_card_le_uniform_vc`, and
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_gap_grid_uniform_vc_card_le`.
This closes the proof-theoretic gap between finite threshold signatures and
empirical `L1(P_n)` approximation: exact trace separation is no longer needed.
If a finite threshold grid hits every interval of length greater than
`epsilon`, equal threshold signatures force coordinatewise `epsilon`-closeness,
and Sauer/VC bounds for each fixed threshold control the terminal cover
cardinality by `(((d + 2) * (n + 1)^d)^k)`.

Search record: local search found exact threshold-signature separation,
finite-value threshold consumers, finite-code approximate cover primitives,
and Sauer/VC fixed-threshold product bounds, but no theorem combining
approximate threshold signatures with empirical `L1(P_n)` covers.  The new
route reuses `thresholdTraceCode_eq_iff_forall_threshold_sample`,
`thresholdTraceCodeSet_card_le_pi_binaryTraceSetFamily_card`,
`nonempty_finiteEmpiricalL1CoverAtCard_of_finite_pointwise_approx_code_card_le`,
`empiricalL1CoveringNumber_le_of_finite_pointwise_approx_code_card_le`, and
`threshold_binaryTraceSetFamily_card_le_vc_nat_poly`.

Next exact theorem-facing edit: instantiate the gap-grid hypothesis with an
actual finite threshold grid for bounded truncated values, then feed the
resulting empirical-cover bound into the selected fixed-radius Theorem 2.4.3
side-condition package.  The remaining issue is now choosing/counting a
finite threshold grid with fixed `k` for each fixed `M, epsilon`, not proving
that threshold signatures can act as approximate covers.

2026-05-04 `/goal` update after bounded integer threshold-grid instantiation:
`ThresholdCoding.lean` now closes the bounded finite-threshold grid step.  The
new compiled declarations are
`integerMultipleThresholdGrid`,
`exists_integerMultipleThresholdGrid_between_of_bounds`,
`abs_sub_le_of_forall_bounded_gap_exists_threshold`,
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_bounded_gap_grid_product_card_le`,
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_bounded_gap_grid_uniform_vc_card_le`,
and
`empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_uniform_vc_card_le`.
Thus, if all sampled truncated values lie in
`[-bound * epsilon, bound * epsilon]`, the integer-multiple threshold grid
hits every relevant gap and the fixed-threshold VC/Sauer product bound gives
the empirical `L1(P_n)` cover cardinality
`(((d + 2) * (n + 1)^d)^k)` under an explicit bound on the grid size.

Search record: reused local approximate threshold-signature cover bridges,
fixed-threshold Sauer/VC product bounds, and mathlib integer ceiling/grid APIs
`Int.le_ceil`, `Int.ceil_lt_add_one`, `Finset.Icc`, and `Finset.image`.  No
prior local theorem instantiated bounded real threshold gaps with a concrete
finite integer-multiple threshold grid.

Next exact theorem-facing edit: prove or package the fixed-radius truncated
class hypotheses that feed this integer-grid route into Theorem 2.4.3:
boundedness of sampled `F_M` values by an integer multiple of the target
radius, an explicit usable bound on
`(integerMultipleThresholdGrid epsilon bound).card`, and the theorem-level
uniform VC/subgraph assumption for every grid threshold.  Then compose the
result with the selected fixed-radius side-condition package and the existing
untruncated Theorem 2.4.3 consumer.  The main remaining mathematical blocker
is the honest VC/subgraph/grid cardinality side condition, not finite
threshold-code plumbing.

2026-05-04 `/goal` update after integer-grid cardinality and abs-bound
consumer: the explicit grid-size side condition is now discharged for natural
symmetric integer radii.  New compiled declarations are
`integerMultipleThresholdGrid_card_le`,
`integerMultipleThresholdGrid_nat_card_le`,
`empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_nat_uniform_vc_card_le`,
and
`empiricalL1CoveringNumber_le_of_integerMultipleThresholdGrid_nat_uniform_abs_bound_vc_card_le`.
The last theorem is the truncated-envelope-friendly form: a coordinatewise
absolute bound
`|f(X_i)| <= ((bound : ℤ) : ℝ) * epsilon` plus uniform fixed-threshold VC
control yields the empirical covering bound with terminal cardinality
`(((d + 2) * (n + 1)^d) ^ (2 * bound + 1))`.

Search record: reused local `card_int_symmetric_Icc`, mathlib
`Finset.card_image_le`, and the standard `abs_le` lower/upper splitter.  No
new primitive was needed for the grid count.

Next exact theorem-facing edit: connect this compiled integer-grid empirical
cover bound to the Theorem 2.4.3 selected fixed-radius side-condition package.
The remaining assumptions to prove or package honestly are now the
truncated-class absolute bound by a chosen integer multiple of the fixed
radius and the uniform fixed-threshold VC/subgraph condition over the finite
integer grid.

2026-05-04 `/goal` update after integer-grid selected-package closure:
`Theorem243.lean` now consumes deterministic empirical-covering-number bounds
directly through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_empiricalL1CoveringNumber_le_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_empiricalL1CoveringNumber_le_samplePath`.
It also adds the theorem-facing selected fixed-radius constructor
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_abs_bound_vc`.
This composes the concrete integer-multiple threshold grid, its cardinality
bound, the absolute boundedness form, fixed-threshold VC/Sauer, and the
existing natural-polynomial entropy/tail/UI package.

Next exact theorem-facing edit: use this selected fixed-radius package in the
untruncated Theorem 2.4.3 consumer, under explicit for-all-positive-`M`
integer-bound and threshold/subgraph VC hypotheses.  The remaining gap is now
stating/proving those structural hypotheses from the exact textbook
measurable/VC class assumptions, not connecting the grid cover to the
Theorem 2.4.3 package.

2026-05-04 `/goal` update after integer-grid untruncated consumer:
`Theorem243.lean` now adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_abs_bound_vc`.
This composes the concrete integer-grid selected fixed-radius package with the
existing untruncation/symmetrization/Rademacher/Hoeffding/tail stack, yielding
the centered untruncated Theorem 2.4.3 convergence conclusion under explicit
for-all-positive-`M` structural assumptions: sampled truncated-class absolute
boundedness by an integer multiple of each fixed radius and uniform VC control
for all thresholds in the finite integer grid.

Next exact theorem-facing edit: reduce these explicit structural assumptions
to more textbook-facing hypotheses.  The likely next local lemmas are
(1) a truncation/envelope bound showing
`|F_M f(x)| <= M` or the appropriate integer-multiple radius bound, and
(2) a class-level subgraph/VC assumption implying the per-grid-threshold
`empiricalBinaryTraceSetFamily ... vcDim <= d` condition.  If those are not
available from current definitions, introduce an honest theorem-facing
structure for the VC-subgraph class assumption rather than overclaiming the
full textbook entropy condition.

2026-05-04 `/goal` update after envelope-bound integer-grid package:
`Theorem243.lean` now adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_bound_vc`.
This discharges the sampled absolute-boundedness input of the integer-grid
selected fixed-radius package from the existing theorem
`abs_vdVWTruncatedClassFun_le_M` plus the simple arithmetic condition
`M <= ((bound eta : ℤ) : ℝ) * eta`.

Next exact theorem-facing edit: add the corresponding centered untruncated
consumer that uses this envelope-bound package, so callers need only provide
the integer-radius domination and per-grid-threshold VC hypotheses.  After
that, reduce the remaining VC hypothesis to a textbook-facing subgraph/VC
class assumption.

2026-05-04 `/goal` update after canonical integer-grid radius closure:
`Theorem243.lean` now defines `vdVWIntegerGridRadius M eta := Nat.ceil (M / eta)`
and proves `vdVWIntegerGridRadius_mul_eta_ge`, discharging
`M <= ((bound eta : ℤ) : ℝ) * eta` for positive `eta`.  It also adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_vc`,
which specializes the envelope-bound selected fixed-radius package to this
canonical radius.

2026-05-04 follow-up: the corresponding untruncated consumer is compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_vc`.
This removes both the sampled absolute-bound input and the caller-supplied
grid-radius arithmetic from the theorem-facing integer-grid route.

Next exact theorem-facing edit: reduce the remaining per-grid-threshold VC
hypothesis to a textbook-facing subgraph/VC class assumption, then consume this
canonical route in the final Theorem 2.4.3 handoff.  Do not add more
integer-grid packaging unless the final assembly explicitly requires it.

2026-05-04 follow-up: `SubgraphTraceVC.lean` now defines
`VdVWUniformThresholdVCSubgraphBound`, a textbook-facing predicate requiring
every finite sample and real threshold of a class to have threshold-indicator
trace VC dimension bounded by a single `d`.  `Theorem243.lean` adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_subgraph_vc`,
which uses that predicate to discharge the per-grid-threshold VC assumptions
for the canonical selected fixed-radius package.

Next exact theorem-facing edit: either add the matching untruncated consumer
from `VdVWUniformThresholdVCSubgraphBound`, or consume the selected package
directly in the final Theorem 2.4.3 assembly.  The remaining mathematical
input is an honest proof or assumption that the textbook VC-subgraph condition
implies `VdVWUniformThresholdVCSubgraphBound` for the truncated class.

2026-05-04 follow-up: the matching untruncated consumer is now compiled as
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_subgraph_vc`.
It composes the canonical integer-grid untruncated route with
`VdVWUniformThresholdVCSubgraphBound`, so the theorem-facing structural input
is now one uniform all-threshold VC predicate for each positive truncation
level.

Next exact theorem-facing edit: prove or precisely primitive-register the
bridge from the textbook VC-subgraph condition for the truncated class to
`VdVWUniformThresholdVCSubgraphBound`, then use this untruncated consumer in
the final Theorem 2.4.3 statement.  Do not add more integer-grid or
threshold-subgraph wrappers unless the final assembly exposes a real mismatch.

2026-05-04 follow-up: `SubgraphTraceVC.lean` now adds the lifted finite
subgraph trace family `empiricalSubgraphTraceSetFamily` over samples in
`Observation × ℝ`, proves the fixed-threshold equality
`empiricalBinaryTraceSetFamily_thresholdIndicatorClassFun_eq_empiricalSubgraphTraceSetFamily`,
defines `VdVWUniformSubgraphVCBound`, and proves
`VdVWUniformSubgraphVCBound.toUniformThresholdVCSubgraphBound`.  `Theorem243.lean`
also adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`,
which consumes this full lifted-subgraph VC predicate directly.

Next exact theorem-facing edit: use the full-subgraph selected package and the
existing untruncated consumer in the final Theorem 2.4.3 assembly under honest
structural side conditions.  Remaining exact textbook work is to align
`VdVWUniformSubgraphVCBound` with the book's named VC-subgraph hypothesis and
discharge or expose the non-combinatorial measurability/integrability side
conditions.

2026-05-04 follow-up: `Theorem243.lean` now adds the direct untruncated
consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`.
This composes `VdVWUniformSubgraphVCBound` with the canonical integer-grid
untruncated route, so final assembly can use the lifted full-subgraph VC
predicate directly.

Next exact theorem-facing edit: assemble a named final Theorem 2.4.3
side-condition theorem around this consumer, grouping the still-explicit
measurability, integrability, Rademacher, sample-path, and envelope
assumptions honestly.  Do not add further VC/grid wrappers unless final
assembly exposes a type mismatch.

2026-05-04 follow-up: `Theorem243.lean` now adds the data-carrying structure
`VdVWTheorem243FullSubgraphSideConditions` and compact consumer
`VdVWTheorem243FullSubgraphSideConditions.centered_untruncated_convergesInOuterProbabilityConst_zero`.
The structure groups the full lifted-subgraph VC input, sample-path identity,
envelope/measurability/integrability assumptions, Rademacher sign hypotheses,
and the remaining measurable-cover witnesses needed by the current proof.

Next exact theorem-facing edit: reduce fields of
`VdVWTheorem243FullSubgraphSideConditions` where existing local lemmas already
derive them, especially truncated-function integrability and any finite/finitely
measurable supremum cases, while keeping genuinely infinite-class
measurability/integrability assumptions explicit.  Exact textbook completion
still requires replacing or justifying the remaining side-condition fields.

2026-05-04 follow-up: `Theorem243.lean` now adds
`VdVWTheorem243FullSubgraphSideConditions.of_integrable`, a constructor that
derives ordinary class-member integrability from `hclass`, the envelope bound,
and `Integrable envelope P` using the new theorem-facing helper
`integrable_classFun_of_integrable_envelope` and mathlib `Integrable.mono'`.
The package field `htruncIntegrable` is then derived from this internally
proved class-member integrability, `henv`, and the existing lemma
`integrable_vdVWTruncatedClassFun_of_integrable`.

2026-05-04 follow-up: the same theorem-facing package constructor now also
derives the package field `hbdd_truncated`.  Search/reuse record: local
`PMeasurable.lean` already had
`bddAbove_vdVWWeightedClassValueSet_of_uniform_bound`; local `Theorem243.lean`
already had `abs_vdVWTruncatedClassFun_le_M`; pinned mathlib supplied
`abs_integral_le_integral_abs`, `integral_mono`, and probability-measure
`integral_const` simplification.  New local lemmas prove
`abs_integral_vdVWTruncatedClassFun_le_M`,
`abs_centered_vdVWTruncatedClassFun_le_two_mul_M`, nonnegative centered
boundedness, negative-level truncation identity/zero integral, and the final
all-level `bddAbove_vdVWWeightedClassValueSet_centered_truncated`.

2026-05-04 follow-up: `VdVWTheorem243FullSubgraphSideConditions.of_integrable`
is now `noncomputable` and additionally derives the package field `Ucentered`.
Search/reuse record: local `Theorem243.lean` already had
`VdVWMeasurableCover.centered_truncated_of_countable_of_coordinate`; pinned
mathlib `Set.to_countable` supplies the countability evidence from
`[Countable Index]`.  No new primitive was needed for this centered cover.

2026-05-04 follow-up: the constructor now also derives the package field
`hcenteredSupIntegrable`.  Search/reuse record: local `Theorem243.lean` already
had `measurable_vdVWWeightedClassSupremum_of_countable`,
`measurable_vdVWWeightedSampleSum`, and centered truncation bounds; local
`PMeasurable.lean` supplied `vdVWWeightedClassSupremum_nonneg`; mathlib supplied
`Integrable.mono'` and `integrable_const`.  New local lemmas prove
`vdVWWeightedClassSupremum_le_sum_abs_mul_bound_of_uniform_bound`,
`abs_centered_vdVWTruncatedClassFun_le_two_mul_max_M_zero`, and
`integrable_vdVWWeightedClassSupremum_centered_truncated_of_countable`.

2026-05-04 follow-up: the constructor now also derives the package field
`hpairSupIntegrable`.  Search/reuse record: local code already had the weighted
supremum uniform-bound integrability pattern above, countable supremum
measurability, product-coordinate measurable combinators, and
`measurable_vdVWWeightedSampleSum`; mathlib supplied `measurable_pi_lambda` and
`Measurable.prodMk`.  New local lemmas prove
`abs_vdVWTruncatedClassFun_pairDifference_le_two_mul_max_M_zero` and
`integrable_vdVWWeightedClassSupremum_pairDifference_ghost_of_countable`.

2026-05-04 follow-up: the constructor now also derives
`hghostExpectationIntegrable`, `hsplitSupIntegrable`, and
`hsampleSupIntegrable`.  Search/reuse record: local code already had
`integrable_vdVWWeightedClassSupremum_pairDifference_ghost_of_countable`,
`measurable_vdVWWeightedClassSupremum_of_countable`,
`measurable_vdVWWeightedSampleSum`,
`vdVWWeightedClassSupremum_le_sum_abs_mul_bound_of_uniform_bound`, and
`vdVWRademacherWeights`; pinned mathlib supplied
`MeasureTheory.Integrable.integral_prod_left`, `Integrable.mono'`,
`integrable_const`, `measurable_pi_lambda`, `Measurable.prodMk`,
`measurable_fst`, `measurable_snd`, and `measurable_pi_apply`.  New local
lemmas prove `abs_vdVWTruncatedClassFun_le_max_M_zero`,
`integrable_vdVWWeightedClassSupremum_truncated_of_countable`, and
`integrable_vdVWWeightedClassSupremum_pairDifference_split_of_countable`.
The ghost expectation is now a Fubini consequence of the split product-copy
integrability theorem.

2026-05-04 follow-up: the same constructor now also derives
`hrandomIntegralIntegrable`, `Urandom`, `hproductSupIntegrable`, and
`hsignSupIntegrable`.  Search/reuse record: local code already had the finite
Rademacher varying-weight pattern, the countable supremum measurability
pattern, `integrable_vdVWTruncatedClassFun_of_integrable`,
`integrable_vdVWWeightedClassSupremum_truncated_of_countable`, and
`VdVWMeasurableCover.ofAEMeasurable`; pinned mathlib supplied
`HasSubgaussianMGF.integrable`, `Integrable.mul_prod`, `Integrable.comp_fst`,
`Integrable.integral_prod_left`, and finite-sum integrability.  New local
lemmas prove
`integrable_vdVWWeightedClassSupremum_truncated_rademacher_sign_of_countable`,
`integrable_vdVWWeightedClassSupremum_truncated_rademacher_product_of_countable`,
and `VdVWMeasurableCover.truncated_rademacher_product_of_countable`.

2026-05-04 follow-up: the simplified constructor is now consumed by the
theorem-facing assembly
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_fullSubgraph_integrable`.
This full-subgraph route no longer exposes the now-derived
integrability/measurable-cover witnesses; it keeps only the structural
full-subgraph VC route, envelope/measurability/integrability assumptions, and
Rademacher sign hypotheses explicit.

2026-05-04 follow-up: the full-subgraph integrable route now also has
caller-facing auxiliary choices discharged by
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_fullSubgraph_integrable_iidRademacher`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_fullSubgraph_integrable_canonical`.
The first uses `exists_common_iid_vdVWRademacherSigns`; the second uses
`vdVWCanonicalSampleProcess` and `samplePath_vdVWCanonicalSampleProcess`.
The full-subgraph constructor and its iid/canonical consumers no longer expose
the previously separate `hclassIntegrable` parameter; envelope integrability
and coordinate measurability now discharge it.
The finite-class untruncated consumer and its iid/canonical wrappers have the
same reduction: `hclassIntegrable` is derived locally from
`integrable_classFun_of_integrable_envelope`, so finite-class callers now need
only envelope measurability/integrability plus coordinate measurability.
The selected fixed-radius tail/UI consumer and the integer-grid,
finite-threshold, finite-realized-value, canonical envelope, subgraph, and
full-subgraph bridge stack now also remove caller-facing `hclassIntegrable`
where the envelope hypotheses are available; the lower-level tail-expectation
primitive still keeps explicit class integrability for direct users.
`VdVWTheorem243FullSubgraphSideConditions` also no longer stores a
`hclassIntegrable` field; package construction still derives the needed
ordinary member integrability internally whenever a lower-level direct
primitive requires it.

2026-05-04 `/goal` follow-up: `Theorem243.lean` now adds the theorem-facing
finite-product uniform-deviation bridge from centered weighted-supremum
convergence to a variable-domain Glivenko-Cantelli bad-event predicate:
`VdVWOuterProbabilityUniformDeviationConstOn`,
`vdVWWeightedSampleSum_centered_const_inv_eq_empiricalAverage_sub`, and
`VdVWOuterProbabilityUniformDeviationConstOn_of_centered_weightedSupremum`.
Search/reuse record: local `GlivenkoCantelli.lean` only supplied fixed-domain
GC predicates, while the existing Theorem 2.4.3 convergence layer lives over
the variable finite product spaces `SampleAt Observation n`; no exact reusable
variable-domain GC predicate was found.  The bridge reuses
`EmpiricalDeviationBoundOn`, `populationRiskOfFunction`,
`empiricalAverage`, `VdVWConvergesInOuterProbabilityConst`,
`abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove`, and
`vdVWWeightedClassSupremum_nonneg`.

2026-05-04 follow-up: the finite-product GC bridge is now consumed by the
full-subgraph and finite-class Theorem 2.4.3 routes.  New compiled declarations
are `abs_integral_classFun_le_integral_envelope`,
`bddAbove_vdVWWeightedClassValueSet_centered_of_integrable_envelope`,
`VdVWOuterProbabilityUniformDeviationConstOn_of_fullSubgraph_integrable`,
`VdVWOuterProbabilityUniformDeviationConstOn_of_fullSubgraph_integrable_canonical`,
and `VdVWOuterProbabilityUniformDeviationConstOn_of_finite_indexClass_canonical`.
The key new boundedness lemma is sample-dependent: it uses the finitely many
envelope values along `SampleAt Observation n` plus
`∫ envelope dP`, so it does not assume a globally bounded envelope.  Search
reused mathlib `abs_integral_le_integral_abs`, `integral_mono`, and
`Finset.abs_sum_le_sum_abs`, together with the local envelope and weighted
sample-sum APIs.

2026-05-04 `/goal` follow-up: the finite-product GC bridge now transfers to
the fixed infinite iid sample-space predicate used by the local book-style
`P`-Glivenko-Cantelli definition.  New compiled declarations are
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_uniformDeviationConstOn_canonical`,
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical`,
and `VdVWOuterProbabilityPGlivenkoCantelliClass_of_finite_indexClass_canonical`.
Search/reuse record: local `PMeasurable.lean` already had
`vdVWFirstNSample`, `measurable_vdVWFirstNSample`, and
`vdVWInfiniteProductMeasure_measurePreserving_firstNSample`; pinned mathlib
`MeasureTheory/Measure/Map.lean` supplies `Measure.le_map_apply`, which gives
the needed domination for arbitrary, possibly nonmeasurable, uniform-deviation
bad events.  This closes the finite-product-to-fixed-iid outer-probability
bridge without adding a measurability assumption.  Remaining Theorem 2.4.3
work is still the exact general structural entropy/full-subgraph alignment and
the almost-sure reverse/cofiltration Lemma 2.4.5 route.

2026-05-04 `/goal` follow-up: the fixed-iid outer-probability branch is now
consumed by the local book-style `P`-Glivenko-Cantelli disjunction.  New
compiled declarations are
`vdVWPGlivenkoCantelliClass_of_outerProbability`,
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_and_inMean_canonical`,
and
`VdVWTheorem243_finite_indexClass_pGlivenkoCantelli_and_inMean_canonical`.
These packages return the book-style `VdVWPGlivenkoCantelliClass` on the
canonical infinite iid sample space together with the current ordinary in-mean
centered-supremum conclusion.  They are theorem-facing endpoint packages under
the current full-subgraph or finite-class hypotheses, not exact textbook
Theorem 2.4.3: the remaining gap is still the general entropy/structural
alignment plus the a.s. reverse-submartingale route.

2026-05-04 `/goal` follow-up: the ordinary in-mean centered-supremum
conclusion is now transported to the fixed infinite iid product space and the
named Lemma 2.4.5 statistic.  New compiled declarations are
`integral_vdVWLemma245CenteredEmpiricalSupremum_eq`,
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finiteProduct`,
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_fullSubgraph_integrable_canonical`,
and
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finite_indexClass_canonical`.
Search/reuse record: this reuses the existing first-`n` coordinate integral
transport `integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_eq`
and the already-compiled finite-product in-mean consumers.  It does not prove
the a.s. Lemma 2.4.5 reverse/cofiltration convergence theorem, but it closes a
fixed-space in-mean input for the same centered empirical supremum process.

2026-05-04 `/goal` follow-up: the centered-supremum outer-probability
convergence itself is now transported from finite products to the fixed
infinite iid product space used by Lemma 2.4.5.  New compiled declarations are
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finiteProduct`,
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_fullSubgraph_integrable_canonical`,
and
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_finite_indexClass_canonical`.
Search/reuse record: this uses the same first-coordinate product-law bridge
and mathlib `Measure.le_map_apply` pattern as the fixed-iid GC bridge, so it
does not require measurability of the centered-supremum bad events.  The next
hard step remains converting reverse/cofiltration a.e. convergence plus these
zero-convergence inputs into the exact almost-sure Lemma 2.4.5 conclusion.

2026-05-04 follow-up: the first in-mean Theorem 2.4.3 adapter is now compiled.
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_tailExpectation`
specializes the existing varying-domain tail/UI mean theorem
`tendsto_integral_of_VdVWConvergesInOuterProbabilityConst_zero_of_tailExpectation_nonneg`
to the centered weighted-supremum process.  The full-subgraph composition
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation`
then consumes the full-subgraph outer-probability convergence route.  The
remaining measurability, integrability, and tail/UI inputs are intentionally
explicit; this does not yet prove the exact textbook in-mean conclusion from
only the book entropy assumptions.

2026-05-04 follow-up: the countable/envelope part of the in-mean side
conditions is now discharged.  Search/reuse record: local APIs
`measurable_vdVWWeightedClassSupremum_of_countable`,
`measurable_vdVWWeightedSampleSum`,
`integrable_vdVWWeightedSampleSum_of_integrable`,
`integrable_classFun_of_integrable_envelope`, and
`abs_integral_classFun_le_integral_envelope` were reusable; pinned mathlib
provided `MeasureTheory.integrable_comp_eval`,
`MeasureTheory.integrable_finsetSum`, `Finset.abs_sum_le_sum_abs`,
`integral_nonneg`, and `Integrable.mono'`.  New compiled declarations are
`vdVWWeightedClassSupremum_centered_le_sum_abs_mul_envelope_add_integral`,
`measurable_vdVWWeightedClassSupremum_centered_of_countable`,
`integrable_vdVWWeightedClassSupremum_centered_of_countable`, and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable`.
The adjacent iid/canonical wrappers
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable_iidRademacher`
and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_tailExpectation_of_countable_canonical`
now remove the auxiliary Rademacher sign-space and terminal sample-path process
choices from this in-mean route.
The deterministic tail-reduction bridge
`vdVWWeightedClassSupremum_centered_invNat_le_empiricalAverage_envelope_add_integral`
now specializes the sample-dependent envelope domination to empirical weights
`1/n`, giving a pointwise bound by the empirical envelope average plus
`∫ envelope dP` for every positive sample size.
The remaining nontrivial analytic input for the current in-mean theorem layer
is the varying-domain tail/UI condition for that empirical-envelope-average
upper bound, not routine measurability or integrability.

Next exact theorem-facing edit: move from this proof layer toward the exact
Theorem 2.4.3 statement by aligning the remaining structural full-subgraph
VC/grid assumption with the textbook entropy hypothesis, then add the
remaining in-mean tail/UI discharge and almost-sure/reverse-submartingale
conclusions.  The finite-product GC outer-probability conclusion and the
countable/envelope in-mean adapter are now available for the current
full-subgraph route; do not recreate the derived integrability,
measurable-cover, finite-product GC, countable measurability/integrability, or
generic in-mean adapter witnesses.
Next patchable tail/UI target: prove an empirical-average tail expectation
bound for a nonnegative integrable envelope, e.g. an inequality of the form
`∫ 1{K < empiricalAverage F} empiricalAverage F dP^n ≤
2 * ∫ 1{K/2 < F} F dP` for `0 < n` and `0 < K`, then combine it with the
new centered-supremum domination and the constant population envelope mean.

2026-05-04 follow-up: the empirical-average tail/UI target is now partially
closed.  New compiled declarations are `measurable_empiricalAverage`,
`integrable_empiricalAverage`,
`empiricalAverage_le_two_mul_empiricalAverage_tail_half_of_lt`,
`integral_indicator_empiricalAverage_envelope_tail_le_two_integral_tail_half`,
and `empiricalAverage_envelope_tailExpectation_condition_of_integrable`.
Search/reuse record: the proof reuses local
`integral_indicator_tail_lt_tendsto_zero_of_integrable`,
`probability_pi_integral_weighted_sum`, and the empirical-average product-law
API; no ready variable-domain empirical-average uniform-integrability theorem
was found in pinned mathlib.  The remaining patchable step is to combine this
empirical-average tail condition with
`vdVWWeightedClassSupremum_centered_invNat_le_empiricalAverage_envelope_add_integral`
to discharge the centered-supremum `hTail` input in the in-mean Theorem 2.4.3
route.

2026-05-04 follow-up: the centered-supremum tail/UI input for the countable
integrable-envelope in-mean route is now discharged.  Search/reuse record:
local APIs `integrable_vdVWWeightedClassSupremum_centered_of_countable`,
`measurable_vdVWWeightedClassSupremum_centered_of_countable`,
`vdVWWeightedClassSupremum_centered_invNat_le_empiricalAverage_envelope_add_integral`,
`integral_indicator_empiricalAverage_envelope_tail_le_two_integral_tail_half`,
and the ProbabilityMeasure tail convergence
`integral_indicator_tail_lt_tendsto_zero_of_integrable` supply the proof; no
new mathlib primitive was needed.  New compiled declarations are
`centered_vdVWWeightedClassSupremum_tailExpectation_condition_of_integrable_envelope`,
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable`,
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable_iidRademacher`,
and
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_fullSubgraph_integrable_of_countable_canonical`.
Thus the current countable/envelope full-subgraph in-mean route no longer
requires caller-supplied centered-supremum measurability, integrability, sign
space, sample-path process, or varying-domain tail/UI hypotheses.  The next
theorem-facing target is to package this in-mean convergence with the existing
uniform-deviation outer-probability route and keep the remaining structural
full-subgraph/entropy assumptions explicit, then continue to the
almost-sure/reverse-submartingale part of Theorem 2.4.3.

2026-05-04 follow-up: the outer-probability and in-mean conclusions are now
jointly packaged for the full-subgraph route.  New compiled declarations are
`VdVWTheorem243_fullSubgraph_integrable_outerProbabilityUniformDeviation_and_inMean`
and
`VdVWTheorem243_fullSubgraph_integrable_outerProbabilityUniformDeviation_and_inMean_canonical`.
They consume the existing finite-product uniform-deviation theorem and the
new no-tail in-mean theorem, so callers can obtain both current Theorem 2.4.3
conclusions from one explicit full-subgraph structural hypothesis package.
This remains a theorem layer, not an exact textbook report: the remaining
main-line work is to align the structural full-subgraph/trace-grid assumption
with the textbook entropy hypothesis or keep it honest as a side condition,
then prove the almost-sure/reverse-submartingale conclusion.

2026-05-04 follow-up: the finite-class canonical route now reaches the same
two current Theorem 2.4.3 conclusions.  New compiled declarations are
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_finite_indexClass_canonical`
and
`VdVWTheorem243_finite_indexClass_outerProbabilityUniformDeviation_and_inMean_canonical`.
They reuse the finite-class canonical centered convergence, the generic
in-mean tail/UI adapter, and the countable/envelope tail-expectation theorem,
so finite-class callers no longer need a separate in-mean side condition.
This remains a theorem layer: the exact textbook a.s. conclusion still depends
on the Lemma 2.4.5 reverse/cofiltration convergence primitive.

2026-05-04 follow-up: the first Lemma 2.4.5 martingale-convergence foundation
wrapper is compiled.  Search record: local `StatInference` had no exact
reverse-submartingale/permutation-symmetric filtration theorem; pinned mathlib
`Mathlib/Probability/Martingale/Convergence.lean` provides
`Submartingale.ae_tendsto_limitProcess`, and
`Mathlib/Probability/Martingale/Basic.lean` plus
`Mathlib/Probability/Process/Filtration.lean` provide the required
`Submartingale`, `Filtration`, and `limitProcess` foundations.  The new local
wrapper is
`vdVW_submartingale_ae_tendsto_limitProcess_of_eLpNorm_bdd`.  It is not the
exact VdV&W Lemma 2.4.5: the missing theorem-facing primitive is still the
construction of the decreasing permutation-symmetric filtration, measurable
cover versions adapted to it, and the reduction of that reverse
submartingale to a mathlib-compatible submartingale convergence theorem.

2026-05-04 follow-up: the exterior-cofiltration substrate for the same
Lemma 2.4.5 route is now wrapped locally.  Search record: local
`StatInference` had no exterior/reverse filtration layer; pinned mathlib
`Mathlib/Probability/Process/Filtration.lean` provides
`Filtration.cylinderEventsCompl`, and
`Mathlib/MeasureTheory/Constructions/Cylinders.lean` provides
`cylinderEvents`, `cylinderEvents_mono`, and `cylinderEvents_le_pi`.
New compiled declarations are `vdVWExteriorCofiltration`,
`vdVWExteriorCofiltration_eq_cylinderEventsCompl`,
`vdVWExteriorCofiltration_apply`, `vdVWExteriorCofiltration_le_pi`, and
`vdVWExteriorCofiltration_antitone`.  These close only the product-coordinate
exterior sigma-field/cofiltration substrate.  The next missing primitive is
still the VdV&W permutation-symmetric decreasing filtration on sample paths,
its adapted measurable-cover/supremum process, and the reverse-submartingale
inequality/convergence reduction needed for the almost-sure part of
Theorem 2.4.3.

2026-05-04 follow-up: the finite-sample iid permutation-invariance layer for
the Lemma 2.4.5 permutation-symmetric route is now compiled in
`PMeasurable.lean`.  Search record: local code had product-measure and
finite-`Pi` law wrappers but no coordinate-permutation action; pinned mathlib
`Mathlib/MeasureTheory/Constructions/Pi.lean` provides
`MeasurableEquiv.piCongrLeft`,
`MeasurableEquiv.piCongrLeft_apply_apply`,
`MeasureTheory.measurePreserving_piCongrLeft`, and
`Measure.pi_map_piCongrLeft`.  New compiled declarations are
`vdVWFinCoordinatePermMeasurableEquiv`,
`vdVWFinCoordinatePermMeasurableEquiv_apply_apply`,
`vdVWProductMeasure_measurePreserving_finCoordinatePerm`, and
`integral_vdVWProductMeasure_comp_finCoordinatePerm`.  The same closure batch
also proves the empirical-process consequences
`vdVWWeightedSampleSum_finCoordinatePerm`,
`vdVWWeightedSampleSum_uniform_finCoordinatePerm`, and
`vdVWWeightedClassSupremum_uniform_finCoordinatePerm`, using mathlib
`Equiv.sum_comp` for the finite reindexing.  These close the finite-product
iid coordinate-permutation invariance needed for symmetric sample
expressions and the uniform empirical supremum.  The remaining blocker is not
finite permutation invariance itself; it is the VdV&W decreasing
permutation-symmetric sigma-field or adapted process, plus the
reverse-submartingale inequality/convergence handoff that uses it.

2026-05-04 follow-up: the finite-to-infinite symmetry bridge for Lemma 2.4.5
is now compiled.  New declarations are `vdVWFirstNSample`,
`measurable_vdVWFirstNSample`, `vdVWPermuteFirstN`,
`VdVWFirstNPermutationSymmetric`, `vdVWFirstNSample_permuteFirstN`, and
`vdVWFirstNPermutationSymmetric_uniformClassSupremum`.  These connect the
finite uniform empirical supremum to the textbook generator shape
`h : X^∞ -> R` symmetric in its first `n` arguments.  Search/reuse record:
the proof reuses the finite-coordinate permutation layer above, mathlib
`Equiv.sum_comp`, and product-coordinate measurability via `measurable_pi_iff`
and `measurable_pi_apply`; no exact mathlib theorem was found for the VdV&W
generated symmetric sigma-field itself.  The next missing primitive is to
construct the sigma-field `Σ_n` generated by these first-`n` symmetric
measurable real functions, prove its decreasing direction, and connect
adapted measurable covers to it.

2026-05-04 follow-up: the generated permutation-symmetric sigma-field layer
for the Lemma 2.4.5 route is now compiled.  New declarations are
`VdVWNatPermFixesFrom`, `vdVWPermuteNatSequence`,
`VdVWNatPermFixesFrom.image_lt`,
`VdVWNatPermFixesFrom.symm_image_lt`, `vdVWNatPermRestrictFin`,
`VdVWPermutationSymmetricFrom`, `VdVWPermutationSymmetricFrom.mono`,
`VdVWPermutationSymmetricGeneratorSet`,
`vdVWPermutationSymmetricMeasurableSpace`,
`measurableSet_vdVWPermutationSymmetricMeasurableSpace_of_generator`,
`vdVWPermutationSymmetricMeasurableSpace_antitone`,
`measurable_vdVWPermutationSymmetricMeasurableSpace_of_symmetric`,
`vdVWFirstNSample_permuteNatSequence`, and
`VdVWPermutationSymmetricFrom_uniformClassSupremum`.  Search/reuse record:
local `StatInference/ProbabilityMeasure/GeneratedSigma.lean` supplies
generic generated-sigma wrappers, but no exact VdV&W `Σ_n`; pinned mathlib
supplies `MeasurableSpace.generateFrom_le`,
`MeasurableSpace.measurableSet_generateFrom`, `measurable_pi_iff`,
`measurable_pi_apply`, and finite/infinite `Equiv` primitives.  This closes
the generated sigma-field substrate and the decreasing `Σ_m <= Σ_n` direction
for `n <= m`, plus the direct infinite-permutation symmetry of the uniform
empirical supremum.  The remaining exact Lemma 2.4.5 blockers are now the
adapted measurable-cover/supremum process over this decreasing
permutation-symmetric sigma-field and the reverse-submartingale
inequality/convergence handoff used for the almost-sure part of
Theorem 2.4.3.

2026-05-04 follow-up: the first adapted `Σ_n` empirical-supremum bridge is
compiled in `Theorem243.lean` as
`measurable_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`.
It proves that a countable coordinate-measurable class has its infinite
uniform empirical supremum measurable with respect to the generated
permutation-symmetric sigma-field `Σ_n`.  Search/reuse record: this reuses
the local countable-supremum theorem
`measurable_vdVWWeightedClassSupremum_of_countable`,
`measurable_vdVWWeightedSampleSum`, `measurable_vdVWFirstNSample`,
`measurable_vdVWPermutationSymmetricMeasurableSpace_of_symmetric`, and
`VdVWPermutationSymmetricFrom_uniformClassSupremum`; no new primitive was
needed.  The remaining Lemma 2.4.5 blocker is now the measurable-cover
version and reverse-submartingale inequality/convergence handoff over the
decreasing `Σ_n`.

2026-05-04 follow-up: the corresponding adapted measurable-cover object is
now compiled as
`VdVWMeasurableCover_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`.
It constructs the Chapter 1.2 `VdVWMeasurableCover` of the nonnegative
`ENNReal.ofReal` uniform empirical supremum over the explicit source
measurable space `vdVWPermutationSymmetricMeasurableSpace Observation n`.
Search/reuse record: this is not a new cover primitive; it fully reuses
`VdVWMeasurableCover.ofMeasurable` and the preceding `Σ_n` measurability
theorem, with the constructor made explicitly source-measurable-space
specific to avoid falling back to the ambient product sigma-field.  The next
blocker is the reverse-submartingale inequality/convergence reduction itself:
identify the adapted process/covers indexed by decreasing `Σ_n`, prove the
conditional-expectation/submartingale comparison, then feed it into the
existing mathlib martingale convergence wrapper.

2026-05-04 follow-up: the decreasing `Σ_n` family is now packaged as an
actual mathlib filtration on the dual order `ℕᵒᵈ`.  New compiled declarations
are `vdVWPermutationSymmetricMeasurableSpace_le_pi`,
`vdVWPermutationSymmetricCofiltration`,
`vdVWPermutationSymmetricCofiltration_apply`, and
`adapted_vdVWPermutationSymmetricCofiltration_uniformClassSupremum_of_countable`.
Search/reuse record: this uses mathlib `Filtration` and `Adapted`, plus local
`vdVWPermutationSymmetricMeasurableSpace_antitone` and
`measurable_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`.
This closes the adapted-process substrate for the countable uniform empirical
supremum over decreasing `Σ_n`.  The next exact blocker is the
conditional-expectation/reverse-submartingale comparison and L1-boundedness
handoff needed to invoke `vdVW_submartingale_ae_tendsto_limitProcess_of_eLpNorm_bdd`.

2026-05-04 follow-up: the mathlib conditional-expectation martingale/UI/L1
convergence layer for the Lemma 2.4.5 route is now compiled under VdV&W-local
names.  Search record: local `StatInference` had no named VdV&W conditional
expectation handoff; pinned mathlib provides `martingale_condExp`,
`eLpNorm_one_condExp_le_eLpNorm`,
`Integrable.uniformIntegrable_condExp_filtration`,
`Submartingale.ae_tendsto_limitProcess_of_uniformIntegrable`,
`Submartingale.tendsto_eLpNorm_one_limitProcess`, and the Levy upward
theorems `tendsto_ae_condExp`/`tendsto_eLpNorm_condExp`.  New compiled
declarations are `vdVW_condExp_submartingale`,
`vdVW_condExp_uniformIntegrable_filtration`,
`vdVW_condExp_ae_tendsto_limitProcess_of_integrable`,
`vdVW_condExp_tendsto_eLpNorm_one_limitProcess_of_integrable`,
`vdVW_condExp_ae_tendsto_condExp_iSup`,
`vdVW_condExp_tendsto_eLpNorm_one_condExp_iSup`, and
`vdVW_condExp_ae_tendsto_limitProcess_of_eLpNorm_le`.  These close the
ordinary-filtration conditional-expectation martingale, UI, L1 contraction,
a.e. convergence, L1 convergence, and terminal sigma-field identification
substrates.  The remaining exact Lemma 2.4.5 blocker is now narrower:
construct the VdV&W reverse/permutation-symmetric comparison that reindexes or
compares the decreasing `Σ_n` empirical-supremum covers to this ordinary
conditional-expectation martingale framework, then discharge the required
integrable terminal variable or explicit finite L1 bound from the envelope
hypotheses.

2026-05-04 follow-up: the finite-sample law/integrability bridge from the
infinite iid sequence space to the first `n` coordinates is now compiled.
Search record: local `StatInference` had no existing first-`n` law bridge;
pinned mathlib provides `Measure.infinitePi`, `Measure.infinitePi_map_restrict`,
`MeasureTheory.measurePreserving_piCongrLeft`,
`Finset.measurable_restrict`, `integral_map`, and
`MeasurePreserving.integrable_comp_of_integrable`.  New compiled declarations
are `vdVWInfiniteProductMeasure`,
`instIsProbabilityMeasure_vdVWInfiniteProductMeasure`,
`vdVWFinRangeEquiv`,
`vdVWInfiniteProductMeasure_measurePreserving_firstNSample`,
`vdVWFirstNSample_hasLaw_vdVWProductMeasure`,
`integral_vdVWInfiniteProductMeasure_firstNSample`,
`integrable_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_truncated_of_countable`,
and
`integrable_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_of_countable`.
This closes the basic `P^∞ -> P^n` transport needed to move finite empirical
supremum estimates into the Lemma 2.4.5 infinite-sequence/cofiltration setting.
The next exact blocker is now more concrete: prove the reverse/permutation
symmetric comparison itself, using the transported integrability and the
already-compiled `Σ_n` adaptedness/conditional-expectation convergence layers.

2026-05-04 follow-up: the finite-to-infinite transport has been strengthened
from law/integrability to exact integral and `L^p` seminorm identities for the
two empirical-supremum statistics used in the Theorem 2.4.3/Lemma 2.4.5
handoff.  Search/reuse record: pinned mathlib provides
`eLpNorm_comp_measurePreserving`; the new proofs also reuse the generic local
`integral_vdVWInfiniteProductMeasure_firstNSample` and the finite-product
integrability lemmas.  New compiled declarations are
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_truncated_eq`,
`eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_truncated_eq`,
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_eq`, and
`eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_eq`.  These
are the exact transport tools needed for the L1-boundedness side of the
reverse-submartingale convergence step.  The remaining blocker is still the
structural VdV&W comparison identifying or bounding the `Σ_n` process by the
appropriate conditional expectations; first-sample law, integral, seminorm,
and integrability transport should not be redone.

2026-05-04 follow-up: the deterministic leave-one-out arithmetic and supremum
step from the proof of Lemma 2.4.5 is now compiled.  Search/reuse record:
pinned mathlib provides `Fin.removeNth` and `Fin.sum_univ_succAbove`; local
`PMeasurable.lean` provides
`abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove`.  New
compiled declarations are
`vdVWWeightedClassSupremum_le_leaveOneOutAverage_of_forall_abs_le`,
`sum_leaveOneOut_eq_nat_mul_sum`,
`vdVWWeightedSampleSum_uniform_leaveOneOut_average_eq`, and
`vdVWWeightedClassSupremum_uniform_le_leaveOneOutAverage`.  This closes the
sample-path convexity/triangle-inequality part of the textbook argument:
`||P_{n+1}||_F` is bounded by the average of the `n`-sample leave-one-out
suprema, under explicit bounded-value-set hypotheses for the leave-one-out
suprema.  The remaining Lemma 2.4.5 blocker is now the probability side:
prove the conditional-expectation symmetry of the leave-one-out terms given
`Σ_{n+1}`, then combine it with this deterministic inequality to obtain the
reverse-submartingale comparison.

2026-05-04 follow-up: the generic conditional-expectation comparison layer
needed after the deterministic leave-one-out inequality is now compiled.
Search/reuse record: pinned mathlib conditional-expectation APIs used here are
`condExp_of_stronglyMeasurable`, `condExp_mono`, `condExp_finsetSum`,
`condExp_smul`, and `ae_all_iff`; no ready local/mathlib theorem was found for
the full VdV&W leave-one-out conditional symmetry under `Σ_{n+1}`.  New
compiled declarations are `vdVW_condExp_comparison_of_ae_le_of_condExp_eq`,
`vdVW_condExp_uniformAverage_eq_of_finite_condExp_symmetry`, and
`vdVW_condExp_reverseComparison_of_ae_le_uniformAverage`.  These close the
probability algebra once conditional symmetry of the leave-one-out terms is
available.  The remaining exact Lemma 2.4.5 blocker is now narrower: prove
that the leave-one-out empirical-supremum cover terms have equal conditional
expectations given the permutation-symmetric sigma-field `Σ_{n+1}` (or record
the precise invariant-set/measure-preserving primitive needed), then instantiate
the new reverse-comparison bridge with the existing deterministic
`vdVWWeightedClassSupremum_uniform_le_leaveOneOutAverage`.

2026-05-04 follow-up: the invariant-set and measure-preserving primitives
needed for the remaining conditional-symmetry proof are now compiled in
`PMeasurable.lean`.  Search/reuse record: pinned mathlib provided
`MeasurableSpace.generateFrom_induction`,
`MeasurableEquiv.piCongrLeft`, `MeasurableEquiv.piCongrLeft_apply_apply`,
and `Measure.infinitePi_map_piCongrLeft`; local code reused
`VdVWPermutationSymmetricGeneratorSet`, `VdVWPermutationSymmetricFrom`, and
`vdVWInfiniteProductMeasure`.  New declarations are
`preimage_vdVWPermuteNatSequence_eq_of_measurableSet_permutationSymmetric`,
`measurable_vdVWPermuteNatSequence_permutationSymmetric`,
`vdVWNatCoordinatePermMeasurableEquiv`,
`vdVWNatCoordinatePermMeasurableEquiv_apply_apply`,
`vdVWNatCoordinatePermMeasurableEquiv_eq_vdVWPermuteNatSequence`,
`vdVWInfiniteProductMeasure_measurePreserving_natCoordinatePerm`, and
`vdVWInfiniteProductMeasure_measurePreserving_permuteNatSequence`.  These
close the two structural ingredients for proving leave-one-out conditional
symmetry: `Σ_n` sets are invariant under tail-fixing coordinate permutations,
and `P^∞` is invariant under those permutations.  The next theorem-facing edit
is to combine these with `ae_eq_condExp_of_forall_setIntegral_eq` or
set-integral invariance to prove equality of the conditional expectations of
the leave-one-out empirical-supremum cover terms given `Σ_{n+1}`.

2026-05-04 follow-up: the set-integral and conditional-expectation invariance
bridges over `Σ_n` are now compiled.  Search/reuse record: pinned mathlib APIs
used are `MeasurePreserving.integrable_comp_of_integrable`,
`setIntegral_map_equiv`, `setIntegral_condExp`, and
`ae_eq_condExp_of_forall_setIntegral_eq`; local code reuses the just-compiled
`Σ_n` invariant-set theorem and `P^∞` coordinate-permutation
measure-preserving theorem.  New declarations are
`setIntegral_vdVWInfiniteProductMeasure_comp_permuteNatSequence_of_measurableSet_permutationSymmetric`,
`vdVW_condExp_eq_of_forall_setIntegral_eq`, and
`vdVW_condExp_comp_permuteNatSequence_eq_of_permutationSymmetric`.  This closes
the conditional-expectation equality theorem for any integrable statistic
composed with a tail-fixing coordinate permutation over `Σ_n`.  The remaining
Lemma 2.4.5 blocker is now the deterministic leave-one-out identification:
for each omitted index, construct a tail-fixing coordinate permutation of
`ℕ` that transports the distinguished leave-one-out empirical-supremum term to
that omitted term, then combine it with
`vdVW_condExp_comp_permuteNatSequence_eq_of_permutationSymmetric`,
`vdVW_condExp_reverseComparison_of_ae_le_uniformAverage`, and the compiled
sample-path inequality.

2026-05-04 follow-up: the deterministic leave-one-out transport and its
conditional-expectation consumption are now compiled.  Search/reuse record:
pinned mathlib provided `Fin.cycleRange_succAbove`,
`Fin.cycleRange_symm_succ`, and `Equiv.Perm.viaFintypeEmbedding`; local code
reused `vdVWFirstNSample_permuteNatSequence`,
`vdVWNatPermRestrictFin`,
`vdVW_condExp_comp_permuteNatSequence_eq_of_permutationSymmetric`, and
`vdVWWeightedClassSupremum_uniform_le_leaveOneOutAverage`.  New declarations
are `vdVWLeaveOneOutToLastPerm`,
`vdVWLeaveOneOutToLastPerm_apply_succAbove`,
`vdVWLeaveOneOutToLastPerm_symm_apply_last_succAbove`,
`removeNth_last_vdVWFinCoordinatePerm_leaveOneOutToLastPerm`,
`vdVWNatPermOfFin`, `VdVWNatPermFixesFrom_natPermOfFin`,
`vdVWNatPermRestrictFin_natPermOfFin`,
`vdVWFirstNSample_permuteNatSequence_natPermOfFin`,
`vdVWWeightedClassSupremum_leaveOneOut_last_comp_natPermOfFin_eq`,
`vdVW_condExp_leaveOneOut_uniformClassSupremum_eq_last`, and
`vdVW_condExp_reverseComparison_uniformClassSupremum_le_lastLeaveOneOut`.
This closes the finite/infinite omitted-coordinate transport, equality of
leave-one-out conditional expectations over `Σ_{n+1}`, and the theorem-facing
reverse-comparison handoff under explicit measurability, integrability, and
bounded-value-set assumptions.  The remaining exact Lemma 2.4.5 blocker is now
to instantiate those assumptions for the measurable-cover empirical supremum
process and connect the comparison to the reverse-submartingale convergence
and L1-boundedness route.

2026-05-04 follow-up: the countable integrable-envelope instantiation of that
reverse-comparison handoff is now compiled as
`vdVW_condExp_reverseComparison_centered_uniformClassSupremum_le_lastLeaveOneOut_of_countable`.
Search/reuse record: local code reused
`measurable_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`,
`integrable_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_of_countable`,
`vdVWInfiniteProductMeasure_measurePreserving_permuteNatSequence`,
`bddAbove_vdVWWeightedClassValueSet_centered_of_integrable_envelope`, and the
leave-one-out conditional-symmetry handoff above; no new primitive was needed.
This discharges the strong measurability, integrability of all leave-one-out
terms, and samplewise bounded-value-set assumptions under countability,
coordinate measurability, and an integrable envelope.  The remaining exact
Lemma 2.4.5 blocker is now the final reverse-submartingale convergence
reduction: reindex the decreasing `Σ_n` comparison into the compiled
conditional-expectation martingale convergence layer and prove the required
uniform L1/eLpNorm bound from the finite-product transport.

2026-05-04 follow-up: the uniform `L1`/`eLpNorm` side of that final
Lemma 2.4.5 route is now compiled.  New declarations are
`integral_vdVWWeightedClassSupremum_centered_invNat_le_two_integral_envelope`,
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_invNat_le_two_integral_envelope`,
and
`eLpNorm_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_invNat_le_two_integral_envelope`.
The same batch adds
`vdVW_condExp_comparison_and_ae_tendsto_limitProcess_of_eLpNorm_le`, combining
the conditional-expectation comparison with the existing martingale convergence
wrapper on a common full-measure set.  Search/reuse record: local proofs reuse
`vdVWWeightedClassSupremum_centered_invNat_le_empiricalAverage_envelope_add_integral`,
`integrable_vdVWWeightedClassSupremum_centered_of_countable`,
`integral_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_eq`,
`integrable_vdVWInfiniteProductMeasure_weightedClassSupremum_centered_of_countable`,
and the ProbabilityMeasure finite-product weighted-sum expectation wrapper;
mathlib supplies `MemLp.eLpNorm_eq_integral_rpow_norm`,
`memLp_one_iff_integrable`, and `ENNReal.ofReal_le_ofReal`.  The remaining
exact Lemma 2.4.5 blocker is now narrowed to the genuine reverse-filtration
convergence reduction: either prove a reverse/cofiltration martingale
convergence wrapper for the decreasing `Σ_n` process, or a valid reindexing
from `vdVWPermutationSymmetricCofiltration : Filtration ℕᵒᵈ` into a
mathlib-compatible increasing `Filtration ℕ` without losing the diagonal
comparison.

2026-05-04 follow-up: the theorem-specific row handoff is now compiled as
`vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_of_countable`.
It combines the countable centered leave-one-out reverse comparison with the
new envelope `eLpNorm` bound and the generic
`vdVW_condExp_comparison_and_ae_tendsto_limitProcess_of_eLpNorm_le` adapter.
This closes the positive-`n` row input for the final Lemma 2.4.5 proof.  The
remaining blocker is not row integrability, conditional symmetry, or envelope
boundedness; it is the global reverse-filtration convergence step over the
decreasing permutation-symmetric sigma-fields `Σ_n`.

2026-05-04 follow-up: the countable intersection of all positive row handoffs
is now compiled as
`vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_allRows_of_countable`.
This theorem deliberately uses a row-indexed family of ordinary filtrations
instead of pretending the decreasing `Σ_n` family is one increasing
`ℕ`-filtration.  It packages the row comparison/convergence statements on one
full-measure set, leaving the remaining exact blocker unchanged and sharper:
prove the reverse/cofiltration convergence theorem that turns these
row-wise conditional-expectation controls into a.e. convergence of the
centered empirical supremum sequence itself.

2026-05-04 follow-up: the final proof-facing consumer of that all-row package
is now compiled as
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseCofiltrationHandoff`,
with the display abbreviations
`vdVWLemma245CenteredEmpiricalSupremum` and
`vdVWLemma245LeaveOneOutCenteredSupremum`.  This removes the remaining local
class/envelope/measurability plumbing from the final Lemma 2.4.5 statement:
once a reverse/cofiltration convergence primitive turns the all-row
conditional-expectation controls into a.e. convergence of the centered
empirical supremum sequence, the theorem-facing handoff is immediate.  The
remaining blocker is therefore exactly that reverse/cofiltration convergence
primitive for the decreasing permutation-symmetric `Σ_n` fields; pinned
mathlib searches found only ordinary `ℕ`-filtration martingale convergence,
not a ready `ℕᵒᵈ` reverse/cofiltration convergence theorem.

2026-05-04 follow-up: the arbitrary row-filtration and `limitProcess`
bookkeeping has now been further removed from the cleanest Lemma 2.4.5
handoff.  The canonical constant-row specialization
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseCofiltrationHandoff_constRows`
compiles, and the stronger comparison-only consumer
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_reverseComparisonHandoff`
now feeds the final a.e. centered-supremum convergence from just the all-row
reverse comparisons over the actual fields `Σ_{n+1}`.  The remaining primitive
can therefore be stated sharply as: prove that these VdV&W
permutation-symmetric reverse comparisons imply a.e. convergence of the
centered empirical supremum sequence.  No row-filtration plumbing remains.

2026-05-04 follow-up: the zero-limit part of the Lemma 2.4.5 route is now
split off and compiled.  Search/reuse record: local `ProbabilityMeasure`
already exposed first Borel-Cantelli as
`StatInference.ProbabilityMeasure.ae_eventually_notMem`; pinned mathlib search
found `tendsto_nhds_unique`, `Tendsto.comp`, and the first Borel-Cantelli
limsup/eventual-not-member APIs, but no ready theorem combining reverse-limit
convergence with an outer-probability subsequence extraction.  New compiled
declarations in `Theorem243.lean` are
`ae_tendsto_zero_of_ae_tendsto_limit_of_subseq_tendsto_zero`,
`ae_subseq_tendsto_zero_of_eventually_notMem_bad_events`,
`ae_subseq_tendsto_zero_of_summable_bad_events`,
`ae_subseq_tendsto_zero_of_bad_measure_le_summable_bound`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_subseq`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_summable_subseq_bad`,
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_bad_measure_le_summable_bound`.
This narrows the remaining Lemma 2.4.5 probability task: after the
reverse/comparison handoff gives a.e. convergence to some limit, it is enough
to produce a cofinal subsequence whose shrinking bad-event probabilities are
summable, or are dominated by a summable `ℝ≥0∞` bound.  Next exact
theorem-facing edit: derive that summable subsequence/bound from the existing
fixed-space outer-probability convergence of
`vdVWLemma245CenteredEmpiricalSupremum`, or prove a direct Borel-Cantelli
selection theorem from `VdVWConvergesInOuterProbability`.

2026-05-04 `/goal` follow-up: the outer-probability subsequence-selection
step is now compiled.  New theorem-facing declarations in `Theorem243.lean`
are
`exists_ge_bad_measure_le_of_vdVWConvergesInOuterProbability_zero`,
`exists_subseq_bad_measure_le_of_vdVWConvergesInOuterProbability_zero`,
`ae_tendsto_zero_of_ae_tendsto_limit_of_vdVWConvergesInOuterProbability_zero`,
`ae_tendsto_zero_of_ae_tendsto_limit_of_vdVWConvergesInOuterProbability_zero_invNat_geometric`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_outerProbability`,
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseComparisonHandoff_of_outerProbability_invNat_geometric`.
Search/reuse record: local `ProbabilityMeasure` first Borel-Cantelli remains
the reusable a.e. eventual-not-member input; pinned mathlib supplies
`ENNReal.pow_pos` and `ENNReal.tsum_geometric_add_one` for the canonical
geometric allowance.  This closes the route
`fixed-space outer-probability convergence to zero + reverse-comparison
handoff to an a.e. finite limit => a.e. convergence to zero` for Lemma 2.4.5.
The remaining exact Lemma 2.4.5 blocker is now sharper: prove/discharge the
actual VdV&W reverse-comparison handoff from the permutation-symmetric
reverse/cofiltration argument, then connect the existing Theorem 2.4.3
fixed-space outer-probability convergence endpoints to this zero-limit
consumer.

2026-05-04 `/goal` follow-up: the fixed-space endpoint wiring is now also
compiled.  The new generic shift bridge
`VdVWConvergesInOuterProbability_nat_succ` lets theorem endpoints stated for
`n` feed Lemma 2.4.5 handoffs stated for `n + 1`.  The canonical consumers
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_reverseComparisonHandoff`
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_finite_indexClass_canonical_of_reverseComparisonHandoff`
now compose the existing Theorem 2.4.3 fixed-space outer-probability endpoints
with the outer-probability/Borel-Cantelli zero bridge.  For these two
important theorem-critical cases, the remaining exposed assumption is exactly
the reverse-comparison/cofiltration handoff; no separate subsequence,
summability, or endpoint-transport plumbing remains.

2026-05-04 `/goal` follow-up: the finite-class canonical route now also has a
direct pointwise-SLLN proof of the Lemma 2.4.5 a.s. zero conclusion, bypassing
the general reverse/cofiltration handoff for finite index classes.  Search
record: local `EndpointSamples.lean` supplies
`endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid`; local
`PMeasurable.lean` now supplies
`vdVWInfiniteProductMeasure_coordinate_hasLaw` and
`vdVWInfiniteProductMeasure_iIndepFun_coordinates`; pinned mathlib supplies
`tendsto_finsetSum`, `tendsto_add_atTop_nat`, `Tendsto.abs`, and the squeeze
lemma `tendsto_of_tendsto_of_tendsto_of_le_of_le'`.  New compiled theorem
layers in `Theorem243.lean` are
`ae_forall_mem_tendsto_empiricalAverage_sub_integral_zero_of_countable_canonical`,
`vdVWLemma245CenteredEmpiricalSupremum_le_sum_abs_empiricalAverage_sub_integral_of_finite`,
and
`vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_zero_of_finite_indexClass_canonical_slln`.
This closes a genuine finite-class Lemma 2.4.5 endpoint from iid product-space
SLLN plus a finite-sum supremum bound.  It does not solve the arbitrary-class
VdV&W reverse/permutation-symmetric cofiltration theorem, which remains the
main exact Lemma 2.4.5 blocker outside finite classes.

2026-05-04 follow-up: the finite-class SLLN endpoint has now been consumed by
canonical finite-class `P`-Glivenko-Cantelli endpoints.  New compiled
declarations are
`UniformDeviationTendstoZeroOn_of_vdVWLemma245CenteredEmpiricalSupremum_tendsto_zero_canonical`,
`VdVWAlmostSureGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`,
`VdVWOuterAlmostSurePGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`,
and `VdVWPGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`.
Search/reuse record: local `VdVWAlmostSureGlivenkoCantelliClass`,
`VdVWOuterAlmostSurePGlivenkoCantelliClass`,
`vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_almostSure`,
`vdVWWeightedSampleSum_centered_const_inv_eq_empiricalAverage_sub`,
`abs_vdVWWeightedSampleSum_le_vdVWWeightedClassSupremum_of_bddAbove`, and
`bddAbove_vdVWWeightedClassValueSet_centered_of_integrable_envelope` supply the
bridge; pinned mathlib supplies `tendsto_add_atTop_iff_nat` and
`Filter.Tendsto.eventually_lt`.  This gives finite classes both the existing
outer-probability/in-mean route and a direct outer-a.s. book-style GC branch.
The remaining non-finite-class blocker remains the reverse/cofiltration
convergence theorem or a different structural route that avoids it.

2026-05-04 follow-up: the finite-class canonical SLLN/GC route has been
strengthened to remove the global `[Countable Index]` assumption.  The new
finite-intersection bridge
`ae_forall_mem_tendsto_empiricalAverage_sub_integral_zero_of_finite_canonical`
intersects pointwise SLLN events over `hindex_finite.toFinset`, and the
finite-class endpoint theorems now consume that bridge directly.  Search/reuse
record: local `endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid`,
`vdVWInfiniteProductMeasure_coordinate_hasLaw`, and
`vdVWInfiniteProductMeasure_iIndepFun_coordinates` remain the pointwise SLLN
inputs; local finite-set API `Set.Finite.toFinset` and `Finset.induction_on`
replace the previous countable `ae_all_iff` route.  This is closer to the
textbook finite-class case: finiteness of the class, not countability of the
ambient index type, is now the relevant assumption.

2026-05-04 follow-up: the finite-class canonical SLLN/GC route now also has
the direct outer-probability `P`-Glivenko-Cantelli endpoint without a global
`[Countable Index]` assumption.  New compiled declarations are
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalAverage`
in `GlivenkoCantelli.lean`, and
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_finite_indexClass_canonical_slln`
in `Theorem243.lean`; the book-style
`VdVWPGlivenkoCantelliClass_of_finite_indexClass_canonical_slln` now consumes
the outer-probability branch directly.  Search/reuse record: local
`vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalRisk`
is the reusable bad-event bridge, finite class countability is supplied by
`hindex_finite.countable`, and empirical-risk a.e.-measurability is supplied by
`empiricalAverage_samplePath_aemeasurable_of_hasLaw` plus
`vdVWInfiniteProductMeasure_coordinate_hasLaw`.  The remaining non-finite-class
blocker is unchanged: exact arbitrary/countable-class Lemma 2.4.5 still needs
the reverse/permutation-symmetric cofiltration theorem or a different
structural route.

2026-05-04 follow-up: the remaining arbitrary/countable-class Lemma 2.4.5
reverse/cofiltration blocker is now registered as the named Lean proposition
`VdVWLemma245ReverseCofiltrationHandoff`.  Search/reuse record: pinned mathlib
has the forward `Filtration ℕ` martingale convergence stack
`Submartingale.ae_tendsto_limitProcess`,
`Submartingale.tendsto_eLpNorm_one_limitProcess`,
`martingale_condExp`, `Integrable.uniformIntegrable_condExp_filtration`,
and `tendsto_ae_condExp`; local `Theorem243.lean` already compiles the
row-wise conditional-expectation comparison and limit-process handoffs over
`Σ_{n+1}`.  No pinned mathlib theorem was found that directly turns the
decreasing VdV&W permutation-symmetric fields into the exact reverse
cofiltration convergence conclusion.  New compiled consumers
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_namedReverseCofiltrationHandoff`
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_reverseCofiltrationHandoff_of_outerProbability_invNat_geometric`
show that, once this named primitive is proved and a fixed-space
outer-probability endpoint is available, the a.s. zero conclusion follows.
This is a precise blocker registration, not a proof of the missing reverse
cofiltration theorem.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3/Lemma 2.4.5 route now
also consumes the named reverse/cofiltration blocker directly.  New compiled
declarations are
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_reverseCofiltrationHandoff`
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_reverseCofiltrationHandoff`.
They compose the full-subgraph `P`-GC endpoint, the in-mean centered-supremum
endpoint, the fixed-space outer-probability/Borel-Cantelli zero route, and the
named reverse/cofiltration primitive.  Downstream assembly for the
full-subgraph path now has one exposed missing hypothesis:
`VdVWLemma245ReverseCofiltrationHandoff P indexClass classFun`.

2026-05-04 follow-up: the direct finite-class iid-SLLN route now has a single
theorem-facing package
`VdVWTheorem243_finite_indexClass_pGlivenkoCantelli_and_lemma245_canonical_slln`.
It simultaneously returns the direct outer-probability `P`-GC endpoint, the
direct outer-a.s. endpoint, the book-style `P`-GC predicate, and the named
Lemma 2.4.5 centered-supremum a.s. zero conclusion.  This package uses only
finite class membership, the envelope, coordinate measurability, and envelope
integrability; it does not require `[Countable Index]`, `[Inhabited
Observation]`, or the reverse/cofiltration primitive.  The arbitrary/countable
non-finite route remains blocked exactly at
`VdVWLemma245ReverseCofiltrationHandoff`.

2026-05-04 follow-up: a cofiltration-adaptedness sub-primitive for the
arbitrary/countable Lemma 2.4.5 route is now compiled.  Search/reuse record:
local `Theorem243.lean` already had the generic
`measurable_vdVWPermutationSymmetricMeasurableSpace_uniformClassSupremum_of_countable`
and
`adapted_vdVWPermutationSymmetricCofiltration_uniformClassSupremum_of_countable`;
local `PMeasurable.lean` supplied the antitone field relation
`vdVWPermutationSymmetricMeasurableSpace_antitone`; pinned mathlib search still
found only ordinary forward-filtration martingale convergence APIs such as
`Submartingale.ae_tendsto_limitProcess`, not a direct reverse/cofiltration
convergence theorem over `ℕᵒᵈ`.  New declarations specialize the generic
uniform-supremum layer to the named centered Lemma 2.4.5 statistic:
`measurable_vdVWPermutationSymmetricMeasurableSpace_vdVWLemma245CenteredEmpiricalSupremum_of_countable`,
`adapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_of_countable`,
and
`adapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_succ_of_countable`.
The same run also exposed the named statistic's positivity and envelope
integrability inputs as
`vdVWLemma245CenteredEmpiricalSupremum_nonneg`,
`integrable_vdVWLemma245CenteredEmpiricalSupremum_of_countable`, and
`eLpNorm_vdVWLemma245CenteredEmpiricalSupremum_le_two_integral_envelope`,
reusing the existing infinite-product weighted-supremum integrability and
`eLpNorm` envelope bound.  This closes the process
measurability/adaptedness/integrability bookkeeping for `X_n` and `X_{n+1}`.
The remaining non-finite-class blocker is still the genuine
reverse/permutation-symmetric convergence theorem represented by
`VdVWLemma245ReverseCofiltrationHandoff`.

2026-05-04 follow-up: the same Lemma 2.4.5 process is now also exposed in the
strong adaptedness form required by mathlib martingale/submartingale APIs.
Search/reuse record: pinned mathlib `Probability/Process/Adapted.lean`
provides `Adapted.stronglyAdapted` for second-countable targets such as `ℝ`,
and `Probability/Martingale/Basic.lean` shows `Submartingale`,
`Supermartingale`, and `Martingale` all consume `StronglyAdapted`.  New
compiled wrappers are
`stronglyAdapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_of_countable`
and
`stronglyAdapted_vdVWPermutationSymmetricCofiltration_vdVWLemma245CenteredEmpiricalSupremum_succ_of_countable`.
This removes another API mismatch before the remaining reverse/cofiltration
proof; it is not itself the reverse convergence theorem.

2026-05-04 follow-up: the named reverse/cofiltration blocker now has a
mathlib-submartingale sufficient condition.  Search/reuse record: pinned
mathlib `Submartingale.exists_ae_tendsto_of_bdd` proves a.e. finite-limit
convergence for ordinary `ℕ`-indexed L¹-bounded submartingales, while the local
named envelope bound
`eLpNorm_vdVWLemma245CenteredEmpiricalSupremum_le_two_integral_envelope`
supplies the required L¹ bound for the shifted centered supremum.  New
compiled declarations are
`vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_of_submartingale` and
`VdVWLemma245ReverseCofiltrationHandoff.of_submartingale`.  Thus the remaining
non-finite-class proof target is sharper: construct or prove an ordinary
`ℕ`-indexed submartingale realization of
`fun n sequence => vdVWLemma245CenteredEmpiricalSupremum P indexClass classFun
(n + 1) sequence` from the VdV&W decreasing permutation-symmetric fields, or
prove the equivalent reverse/cofiltration convergence theorem directly.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3/Lemma 2.4.5 downstream
package now consumes the sharper ordinary-submartingale sufficient condition
directly.  New compiled declarations are
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_submartingale`
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_submartingale`.
They compose the existing full-subgraph `P`-GC and in-mean endpoints with
`VdVWLemma245ReverseCofiltrationHandoff.of_submartingale`.  The remaining
proof obligation for this route is no longer a generic named blocker at the
call site; it is exactly the ordinary submartingale realization of the shifted
centered empirical supremum process, or a direct proof of the reverse
cofiltration convergence theorem.

2026-05-04 follow-up: the ordinary-submartingale route has been reduced one
step further to the mathlib constructor inputs.  Search/reuse record: pinned
mathlib `Probability/Martingale/Basic.lean` provides
`submartingale_of_condExp_sub_nonneg_nat`, which builds an ordinary `ℕ`
submartingale from strong adaptedness, integrability, and one-step
nonnegative conditional drift.  The local named integrability theorem
`integrable_vdVWLemma245CenteredEmpiricalSupremum_of_countable` supplies the
integrability input for the shifted centered supremum.  New compiled
declaration:
`VdVWLemma245ReverseCofiltrationHandoff.of_condExp_step_nonneg`.  The
remaining proof target is now the exact VdV&W reverse/permutation-symmetric
conditional-drift inequality for a suitable ordinary filtration:
`0 ≤ E[X_{n+1} - X_n | ℱ_n]` where
`X_n(sequence) = vdVWLemma245CenteredEmpiricalSupremum P indexClass classFun
(n + 1) sequence`.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3 route now consumes that
constructor-level drift condition directly.  New compiled declarations are
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_condExp_step_nonneg`
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_condExp_step_nonneg`.
They expose the sharpest current caller-facing assumptions for the a.s.
Lemma 2.4.5 conclusion: strong adaptedness of the shifted centered process to
a suitable ordinary `ℕ` filtration and the one-step nonnegative conditional
drift.  No broader named reverse/cofiltration proposition or raw
`Submartingale` object is needed at this package boundary.

2026-05-04 follow-up: the ordinary filtration and strong adaptedness part of
that constructor-level route is now fixed by the process itself.  Search/reuse
record: pinned mathlib `Filtration.natural` and
`Filtration.stronglyAdapted_natural` build the smallest ordinary increasing
filtration that makes a strongly-measurable process strongly adapted.  Local
`measurable_vdVWPermutationSymmetricMeasurableSpace_vdVWLemma245CenteredEmpiricalSupremum_of_countable`
and `vdVWPermutationSymmetricMeasurableSpace_le_pi` provide full-product
strong measurability of the shifted centered supremum.  New compiled
declarations are
`stronglyMeasurable_vdVWLemma245CenteredEmpiricalSupremum_of_countable`,
`vdVWLemma245CenteredEmpiricalSupremumNaturalFiltration`,
`stronglyAdapted_vdVWLemma245CenteredEmpiricalSupremumNaturalFiltration`,
`VdVWLemma245ReverseCofiltrationHandoff.of_natural_condExp_step_nonneg`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_natural_condExp_step_nonneg`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_natural_condExp_step_nonneg`.
This natural-filtration endpoint is an optional sufficient condition, not the
main textbook route.  The natural one-step drift may be stronger than the
row-wise VdV&W reverse/permutation-symmetric argument and should not be chased
as the default next step without a concrete proof route.

2026-05-04 follow-up: the full-subgraph Theorem 2.4.3/Lemma 2.4.5 package now
also exposes the direct row-wise reverse-comparison handoff, avoiding the
natural-filtration detour.  Search/reuse record: pinned mathlib still supplies
ordinary forward `ℕ` martingale/submartingale convergence APIs only
(`Submartingale.exists_ae_tendsto_of_bdd`, `Submartingale.ae_tendsto_limitProcess`,
`submartingale_of_condExp_sub_nonneg_nat`, `Filtration.natural`); no exact
`ℕᵒᵈ` or VdV&W reverse/cofiltration convergence theorem was found.  Local
reusable declarations already provide the row-wise conditional-expectation
comparison over `Σ_{n+1}`:
`vdVW_condExp_reverseComparison_centered_uniformClassSupremum_le_lastLeaveOneOut_of_countable`,
`vdVW_condExp_centered_reverseComparison_and_ae_tendsto_limitProcess_allRows_of_countable`,
and the zero-limit consumer
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_reverseComparisonHandoff`.
The new compiled theorem-facing package
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_reverseComparisonHandoff`
combines the full-subgraph `P`-GC endpoint, in-mean endpoint, and direct
row-wise reverse-comparison handoff.

Current non-finite-class blocker: prove the actual VdV&W reverse/cofiltration
convergence theorem that turns the already-compiled all-row comparison over
`Σ_{n+1}` into an a.e. finite limit for
`vdVWLemma245CenteredEmpiricalSupremum P indexClass classFun (n + 1)`, or
prove an equivalent row-wise handoff consumed by
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_reverseComparisonHandoff`.
Do not spend the next run on more natural-filtration packaging unless it
directly proves that reverse/cofiltration theorem or is forced by a verified
Lean proof route.

2026-05-04 follow-up: the ordinary martingale-convergence adapter now supports
both signs.  Search/reuse record: pinned mathlib supplies `Supermartingale.neg`
and `eLpNorm_neg`, so an ordinary supermartingale realization of the shifted
centered supremum can be reduced to the already-used submartingale convergence
theorem without introducing a new primitive.  New compiled declarations are
`vdVWLemma245CenteredEmpiricalSupremum_ae_tendsto_of_supermartingale`,
`VdVWLemma245ReverseCofiltrationHandoff.of_supermartingale`, and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_supermartingale`.
This does not prove the VdV&W reverse/cofiltration theorem, but it removes a
possible sign mismatch in future reindexing attempts: either an ordinary
submartingale or ordinary supermartingale realization can now feed the same
full-subgraph Theorem 2.4.3/Lemma 2.4.5 endpoint.

2026-05-04 follow-up: the supermartingale route now also has the
constructor-level one-step drift form.  Search/reuse record: pinned mathlib
`Probability/Martingale/Basic.lean` supplies
`supermartingale_of_condExp_sub_nonneg_nat`, whose hypothesis is
`0 ≤ E[X_n - X_{n+1} | ℱ_n]`.  Local integrability is again supplied by
`integrable_vdVWLemma245CenteredEmpiricalSupremum_of_countable`.  New compiled
declarations are
`VdVWLemma245ReverseCofiltrationHandoff.of_condExp_step_nonpos` and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_condExp_step_nonpos`.
The active blocker remains the reverse/cofiltration convergence theorem, but
future proof attempts can now target either constructor condition:
`E[X_{n+1} - X_n | ℱ_n] ≥ 0` for a submartingale or
`E[X_n - X_{n+1} | ℱ_n] ≥ 0` for a supermartingale.

2026-05-04 follow-up: the row-wise Lemma 2.4.5 comparison is now also exposed
in the exact textbook display notation.  New compiled declarations are
`vdVWLemma245LeaveOneOutCenteredSupremum_eq_centeredEmpiricalSupremum`,
`vdVW_condExp_reverseComparison_centeredEmpiricalSupremum_le_prev_of_countable`,
and
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_of_textbookReverseComparisonHandoff`.
These prove that the distinguished leave-one-out term is the previous
centered empirical supremum, and rewrite the compiled comparison as
`E[‖P_n - P‖_F^* | Σ_{n+1}] ≥ ‖P_{n+1} - P‖_F^*`.  The remaining
non-finite-class blocker is no longer notation or leave-one-out bookkeeping:
prove the VdV&W reverse/permutation-symmetric cofiltration convergence theorem
from that displayed comparison, or an equivalent theorem consumed by the
existing full-subgraph Theorem 2.4.3/Lemma 2.4.5 endpoints.

2026-05-04 follow-up: the textbook-display comparison now feeds the
full-subgraph Theorem 2.4.3/Lemma 2.4.5 endpoint directly.  New compiled
declarations are
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_textbookReverseComparisonHandoff_of_outerProbability_invNat_geometric`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_textbookReverseComparisonHandoff`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_textbookReverseComparisonHandoff`.
This is now the preferred non-finite-class package boundary: it combines the
full-subgraph `P`-GC endpoint, in-mean endpoint, and Lemma 2.4.5 a.s. zero
endpoint under exactly the displayed reverse/cofiltration handoff.  The next
real proof step should prove that displayed handoff, not add more
natural-filtration or leave-one-out packaging.

2026-05-04 follow-up: the displayed reverse/cofiltration handoff is now
registered as a named primitive equivalent to the older leave-one-out blocker.
New compiled declarations are
`VdVWLemma245TextbookReverseCofiltrationHandoff`,
`VdVWLemma245ReverseCofiltrationHandoff.of_textbook`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_leaveOneOut`, and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_textbookReverseCofiltrationHandoff`.
This is now the clean active blocker for the arbitrary/countable
non-finite-class route: prove the named textbook-display reverse/permutation-
symmetric cofiltration convergence theorem itself.  The old
`VdVWLemma245ReverseCofiltrationHandoff` remains available for already-compiled
leave-one-out and martingale sufficient-condition routes, but future theorem
assembly should prefer the textbook-display primitive unless a proof step
naturally produces the leave-one-out form.

2026-05-04 follow-up: the preferred textbook-display blocker now also has
direct ordinary martingale sufficient-condition constructors, so future proof
attempts can target either the reverse/cofiltration theorem itself or an
ordinary `ℕ` sub/supermartingale realization without detouring through the old
leave-one-out primitive.  New compiled declarations are
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_submartingale`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_supermartingale`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_condExp_step_nonneg`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_condExp_step_nonpos`, and
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_natural_condExp_step_nonneg`.
These are sufficient-condition adapters, not a proof of the VdV&W reverse
cofiltration theorem.  The next high-value proof attempt should either prove
`VdVWLemma245TextbookReverseCofiltrationHandoff` directly from the decreasing
`Σ_n` comparison, or prove one of these constructor hypotheses from the
permutation-symmetric cofiltration.

2026-05-04 follow-up: the actual `ℕᵒᵈ` cofiltration submartingale API is now
connected to the textbook display comparison.  Search/reuse record: pinned
mathlib supplies `Submartingale.ae_le_condExp` for arbitrary preorder-indexed
filtrations, and local code supplies `vdVWPermutationSymmetricCofiltration`
plus its display lemma.  The new compiled theorem
`vdVW_textbookReverseComparison_of_permutationSymmetricCofiltration_submartingale`
proves that a submartingale realization of
`n ↦ vdVWLemma245CenteredEmpiricalSupremum ... (OrderDual.ofDual n)` over the
VdV&W `ℕᵒᵈ` permutation-symmetric cofiltration gives
`E[‖P_n - P‖_F^* | Σ_{n+1}] ≥ ‖P_{n+1} - P‖_F^*` on a common full-measure set.
This closes the cofiltration-submartingale-to-display direction.  It does not
close Lemma 2.4.5: the remaining mathematical task is still the reverse
cofiltration convergence theorem turning that displayed comparison into a.e.
finite convergence, or a proof that the displayed comparison satisfies one of
the already compiled ordinary sub/supermartingale constructor hypotheses.

2026-05-04 follow-up: the converse structural direction from adjacent textbook
comparison to a real mathlib submartingale object is now also compiled for the
shifted Lemma 2.4.5 process.  Search/reuse record: pinned mathlib has the
ordinary `submartingale_nat` constructor but no `ℕᵒᵈ` adjacent-step constructor,
so the local theorem `submartingale_orderDual_nat_of_succ` proves the dual
natural-order version using `condExp_mono` and `Filtration.condExp_condExp`.
The shifted cofiltration `vdVWLemma245ShiftedPermutationSymmetricCofiltration`
packages the fields `Σ_{n+1}`, with adaptedness and strong adaptedness
wrappers for `X_{n+1}`.  The theorem
`submartingale_vdVWLemma245ShiftedPermutationSymmetricCofiltration_of_textbookReverseComparison`
then turns the textbook display comparison plus the countable/envelope
integrability assumptions into a genuine `Submartingale` over this shifted
`ℕᵒᵈ` cofiltration.  The active blocker is therefore not construction of the
cofiltration submartingale object; it is the reverse martingale convergence
theorem for this `ℕᵒᵈ` object, or a proof that it can be reindexed into one of
the already compiled ordinary `ℕ` sub/supermartingale convergence routes.

2026-05-04 follow-up: the analytic/measure bridge from finite-window Doob
estimates to order-dual convergence is now closed modulo a single deterministic
comparison.  The new compiled theorem
`vdVWOrderDualSubmartingale_ae_tendsto_of_finiteHorizon_reverseComparison`
uses the uniform bound
`vdVWOrderDualFiniteHorizon_lintegral_upcrossings_le`, monotone convergence for
`lintegral_iSup`, and
`vdVWOrderDualSubmartingale_ae_tendsto_of_downcrossings_lintegral_lt_top` to
prove order-dual a.e. convergence from the pointwise comparison
```
upcrossingsBefore (-(b : ℝ)) (-(a : ℝ))
  (fun n => -f (OrderDual.toDual n)) N ω
≤ upcrossings (a : ℝ) (b : ℝ)
  (fun k => f (OrderDual.toDual (N - k))) ω.
```
Search/reuse record: pinned mathlib supplies `upcrossings`, `upcrossingsBefore`,
`upcrossingsBefore_mono`, `StronglyAdapted.measurable_upcrossingsBefore`, and
`lintegral_iSup`; local code supplies the order-dual finite-horizon
submartingale and uniform expected-upcrossing bound.  The remaining blocker is
therefore exactly the deterministic finite-prefix reversal comparison, with
careful endpoint/off-by-one handling in mathlib's recursive crossing-time
definitions.  The named generic handoff
`VdVWOrderDualSubmartingaleConvergenceHandoff.of_finiteHorizon_reverseComparison`
now exposes this as the final primitive boundary: a proof of the deterministic
comparison immediately closes `VdVWOrderDualSubmartingaleConvergenceHandoff`
for all finite-measure order-dual submartingales satisfying the existing
uniform `eLpNorm` bound.

2026-05-04 follow-up: the blocker boundary now also has the strict
inner-threshold form expected from mathlib's pathwise extension lemma
`upcrossingsBefore_lt_of_exists_upcrossing`.  The compiled declarations
`vdVWOrderDualSubmartingale_ae_tendsto_of_finiteHorizon_innerReverseComparison`
and
`VdVWOrderDualSubmartingaleConvergenceHandoff.of_finiteHorizon_innerReverseComparison`
prove order-dual convergence when every finite-prefix downcrossing from `b` to
`a` is bounded by a reversed-window upcrossing from some inner thresholds
`c,d` with `a < c < d < b`.  This avoids the non-strict endpoint mismatch:
the next proof should construct this inner comparison from the crossing times,
using the facts that a downcrossing reaches `f ≥ b` then `f ≤ a`, hence the
reversed path is strictly below `c` and strictly above `d`.

2026-05-04 follow-up: the first deterministic crossing-time step is now
proved.  The compiled lemma
`vdVW_exists_reverse_inner_upcrossing_of_lt_downcrossingsBefore` shows that
every counted reverse downcrossing before `N` produces concrete indices
`N₁ ≤ N₂ < N+1` such that the reversed finite window is strictly below `c` at
`N₁` and strictly above `d` at `N₂`, for any `a < c < d < b`.  The consumer
`vdVW_reverse_inner_upcrossings_pos_of_downcrossingsBefore_pos` then applies
mathlib `upcrossingsBefore_lt_of_exists_upcrossing` to prove that a positive
reverse-downcrossing count gives a positive strict inner upcrossing count in
the reversed window.  The remaining deterministic blocker is the multiplicity
step: upgrade this one-crossing/positive-count result to the full inequality
between finite-prefix downcrossing counts and reversed-window inner upcrossing
counts.

2026-05-04 follow-up: the crossing-pair ordering needed for that multiplicity
step is now compiled.  `vdVW_reverse_crossing_pair_order_of_lt` proves that
later original crossing intervals appear earlier in the reversed finite
window.  The sharper
`vdVW_reverse_crossing_pair_succ_le_of_lt_of_lower_lt` proves the required
one-index gap when the later lower crossing is completed before the horizon.
The next proof should use this strict ordering to induct over the counted
downcrossing indices and chain repeated applications of
`upcrossingsBefore_lt_of_exists_upcrossing`.

2026-05-05 follow-up: the multiplicity/counting blocker is now closed.
`vdVW_reverse_inner_upcrossingsBefore_ge_downcrossingsBefore` proves the full
finite-prefix deterministic comparison by a backward induction over completed
downcrossings.  It uses the one-crossing extension lemma and the strict
crossing-pair ordering to chain mathlib `upcrossingsBefore_lt_of_exists_upcrossing`.
This feeds the compiled inner-threshold handoff and proves the previously
named generic primitive as
`VdVWOrderDualSubmartingaleConvergenceHandoff.proved`: every uniformly
`L¹`-bounded finite-measure `ℕᵒᵈ` submartingale has an a.e. ordinary-time
limit along `n ↦ OrderDual.toDual n`.  The VdV&W-facing theorem
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable` now
removes the former `hreverse` primitive assumption from the textbook-display
reverse/cofiltration package under countability, coordinate measurability, and
integrable-envelope hypotheses.  Next target: consume this new handoff in the
Lemma 2.4.5 and Theorem 2.4.3 final endpoint wrappers, replacing theorem
statements that still ask for an explicit reverse/cofiltration primitive.

2026-05-05 follow-up: the main full-subgraph endpoint cleanup is now compiled.
New declarations
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_textbookReverseCofiltrationHandoff`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_fullSubgraph_integrable_canonical_of_countable_integrable`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_of_countable_integrable`
consume `VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable`
directly.  Thus the canonical full-subgraph package now exposes only the
countable-class, full-subgraph VC, coordinate-measurability, measurable
integrable-envelope, and nonempty-class hypotheses; it no longer requires a
caller-supplied reverse/cofiltration theorem.  Next target: audit remaining
`hreverse` wrappers and keep only the genuinely alternative sufficient
conditions; then continue final Theorem 2.4.3 exact-statement assembly from the
proved full-subgraph package and the fixed-radius/selected entropy consumers.

2026-05-05 follow-up: the no-`hreverse` endpoint now also reaches the
outer-a.s. `P`-Glivenko-Cantelli branch.  New declarations
`VdVWAlmostSureGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical_of_countable_integrable`,
`VdVWOuterAlmostSurePGlivenkoCantelliClass_of_fullSubgraph_integrable_canonical_of_countable_integrable`,
and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_of_countable_integrable`
combine the full-subgraph outer-probability endpoint, outer-a.s. endpoint,
book-style `P`-GC predicate, in-mean centered-supremum convergence, and
Lemma 2.4.5 a.s. centered-supremum convergence under the standard
countable/integrable-envelope hypotheses.  The next proof target should not
add more endpoint wrappers unless an exact textbook theorem statement consumes
them; instead assemble the exact named Theorem 2.4.3/Lemma 2.4.5 statement
from this strong package and identify any remaining mismatch with the book's
entropy/VC hypotheses.

2026-05-05 `/goal` recalibration: the active goal should now treat the
reverse/cofiltration theorem, no-`hreverse` Lemma 2.4.5 endpoint, and strong
full-subgraph Theorem 2.4.3 package as closed.  The next high-capacity target is
exact final-statement assembly, not another local endpoint wrapper.  Work from
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_of_countable_integrable`
and try to produce the cleanest named VdVW Theorem 2.4.3/Lemma 2.4.5 statement
with no avoidable extra assumptions.  First audit whether the remaining
nonempty-class hypothesis can be removed by an empty-class/vacuity split for
`vdVWWeightedClassSupremum`; if that fails, record the exact Lean obstruction.
Then compare the resulting assumptions against the textbook entropy/VC
statement.  Any remaining gap should be stated as a precise missing bridge, for
example a theorem converting the book's entropy/VC hypotheses to the current
full-subgraph/countable/integrable-envelope package, rather than hidden in a
new wrapper.  If final 2.4.3 assembly is genuinely blocked after search and
Lean attempts, continue to theorem-critical Chapter 1/2 primitives needed by
that exact statement: arbitrary-map/asymptotic-measurability, `ell_infty`
process primitives, FDD weak-convergence converse, or extended-real measurable
cover existence.

2026-05-05 follow-up: the first final-assembly mismatch is now closed.  New
compiled declarations
`vdVWWeightedClassSupremum_empty`,
`UniformDeviationTendstoZeroOn_empty`,
`AlmostSureUniformDeviationTendstoZeroOn_empty`,
`VdVWOuterAlmostSureUniformDeviationTendstoZeroOn_empty`,
`VdVWOuterProbabilityUniformDeviationTendstoZeroOn_empty`, and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`
remove the exposed nonempty-class hypothesis from the strongest full-subgraph
Theorem 2.4.3/Lemma 2.4.5 package.  The empty branch is handled by the
complete-lattice empty supremum convention and vacuous uniform-deviation
predicates; the nonempty branch delegates to the existing strong package.
Next target: do not add more endpoint wrappers for this route.  Compare the
remaining assumptions of the no-nonempty theorem against the exact book
Theorem 2.4.3/Lemma 2.4.5 hypotheses, especially countability vs.
separability/asymptotic measurability, coordinate measurability, measurable
integrable envelope, and the full-subgraph VC/entropy bridge.  If a direct
named exact theorem cannot yet be stated honestly, record the missing bridge as
a precise primitive and move to the theorem-critical Chapter 1/2 foundation
needed to close it.

2026-05-05 follow-up: the measurable/integrable envelope side of that
assumption comparison is now narrowed.  Search/reuse record: pinned mathlib
provides `MeasureTheory.ofReal_integral_eq_lintegral_ofReal` and
`ENNReal.ofReal_lt_top`; local `OuterExpectation.lean` already proves
`VdVWOuterExpectation_eq_lintegral_of_measurable`.  The new compiled bridge
`VdVWOuterExpectation_ofReal_lt_top_of_measurable_integrable_nonneg` proves
finite VdV&W nonnegative outer expectation for any measurable integrable
nonnegative real map, and
`VdVWClassEnvelope.outerExpectation_lt_top_of_measurable_integrable`
specializes it to a VdV&W class envelope.  Thus the current
measurable-integrable-envelope route honestly supplies the textbook-looking
`P^* F < ∞` side condition in the measurable-envelope case.  Remaining
Theorem 2.4.3 final-assembly gaps are now more sharply: exact arbitrary
`P`-measurable class versus the current countable coordinate-measurable route,
the book random empirical entropy hypothesis versus the current
full-subgraph/selected fixed-radius tail package, and nonmeasurable-envelope
outer-cover variants if the exact arbitrary-map statement requires them.

2026-05-05 follow-up: the countable coordinate-measurable route now explicitly
exports the two textbook-side hypotheses that it can honestly supply.  The
compiled theorem
`VdVWTheorem243_fullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`
combines `VdVWPMeasurableClass.of_countable_of_measurable`,
`VdVWClassEnvelope.outerExpectation_lt_top_of_measurable_integrable`, and the
no-nonempty strong full-subgraph package.  Its conclusion contains
Definition 2.3.3 `P`-measurability, finite VdV&W outer envelope expectation,
outer-probability GC, outer-a.s. GC, the local book-style `P`-GC predicate,
in-mean centered-supremum convergence, and Lemma 2.4.5 a.s.
centered-supremum convergence.  This closes the countable-route bookkeeping
for `P`-measurability; it does not close the exact arbitrary
`P`-measurable/asymptotic-measurable textbook class layer or the book random
entropy-to-full-subgraph/fixed-radius finite-net bridge.

2026-05-05 follow-up: the canonical varying-domain form of the book random
entropy hypothesis is now named.  The new structure
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM` records, for
every `M > 0` and `eta > 0`, empirical `L1(P_n)` covering-number domination and
normalized log-cardinality convergence on the actual sample spaces
`SampleAt Observation n`.  The projection theorem
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions`
feeds those two fields into the existing selected fixed-radius package once
the honest varying-domain finite-net integrability and tail/UI hypotheses are
supplied.  This removes the ambiguity between the older fixed-domain entropy
structure and the sample-size-varying theorem route.  Remaining Theorem 2.4.3
blockers are now exactly: prove the selected finite-net tail/UI condition from
book hypotheses or a stronger structural entropy bound, and extend from the
countable coordinate-measurable route to the arbitrary `P`-measurable /
asymptotic-measurable class layer.

2026-05-05 follow-up: the deterministic-boundedness branch of the
variable-domain entropy route is now compiled through the untruncated centered
convergence consumer.  The new bridge
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_bound`
turns the canonical book-shaped varying-domain entropy package plus a
deterministic normalized log-cardinality bound into
`VdVWTheorem243SelectedFixedRadiusTailSideConditions` for every `M > 0`.  The
new theorem-facing consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_bound`
feeds that package directly into the existing fixed-radius/untruncation
Theorem 2.4.3 route.  This closes the repeated manual selected-tail packaging
for the bounded log-ratio branch.  Remaining blockers are now sharper: prove
the deterministic log-ratio bound from a structural entropy/VC cover theorem
or prove a genuine selected finite-net tail/UI theorem from the textbook random
entropy hypothesis without deterministic boundedness; separately extend the
countable coordinate-measurable route to the arbitrary `P`-measurable /
asymptotic-measurable textbook class layer.

2026-05-05 follow-up: the structural deterministic-rate route is now named
before the final untruncated consumer.  The new constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_div_tendsto_bound`
builds the canonical varying-domain book entropy package from empirical
covering domination plus a deterministic normalized log-cardinality rate
tending to zero.  The new all-`M` constructor
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_logCardinality_div_tendsto_bound`
builds selected fixed-radius tail/UI packages directly from the same
structural-rate data plus a deterministic envelope bound `rate <= K`.  Thus a
future VC/Sauer/polynomial trace-count proof can now feed the current
Theorem 2.4.3 untruncated convergence theorem without separately proving the
book entropy structure or hand-building selected finite-net UI fields.
Remaining blockers are now: instantiate this rate-bound route from an actual
textbook structural covering theorem, or prove a non-deterministic selected
finite-net tail/UI theorem from the random entropy hypothesis alone; and
extend the countable coordinate-measurable route to the arbitrary
`P`-measurable/asymptotic-measurable class layer.

2026-05-05 follow-up: the structural deterministic-rate route now reaches both
the centered-supremum and finite-product outer-probability GC-direction
outputs.  The compiled theorem
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_logCardinality_div_tendsto_bound`
consumes all-positive-`M` empirical covering domination plus deterministic
rates `rate M eta -> 0` bounded by `K M eta` and produces untruncated centered
outer-probability convergence.  The compiled theorem
`VdVWOuterProbabilityUniformDeviationConstOn_of_logCardinality_div_tendsto_bound`
then applies the generic centered-supremum-to-uniform-deviation bridge to give
the finite-product outer-probability uniform-deviation conclusion.  The next
real blocker is no longer a packaging handoff: instantiate `hcovering_all`,
`hrate_tendsto`, `hrate_le_K`, and `hlog_rate_bound` from a genuine
textbook structural covering/VC theorem, or prove the missing
non-deterministic selected finite-net tail/UI theorem from random entropy
alone.

2026-05-05 follow-up: the structural deterministic-rate branch now reaches the
canonical infinite-product `P`-Glivenko-Cantelli endpoints.  The compiled
declaration
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_logCardinality_div_tendsto_bound`
projects the finite-product outer-probability uniform-deviation conclusion to
the infinite iid product process, and
`VdVWPGlivenkoCantelliClass_of_logCardinality_div_tendsto_bound` packages that
as the local book-style `P`-GC predicate.  These are still structural-rate
sufficient conditions, not the exact arbitrary textbook Theorem 2.4.3.  The
next real proof target is to derive those rate/covering inputs from a genuine
VdV&W structural entropy/VC theorem, or to remove the deterministic-rate
boundedness assumption by proving the selected finite-net tail/UI theorem from
random entropy alone.

2026-05-05 follow-up: the variable-domain book entropy branch with
deterministic normalized log-cardinality boundedness now also reaches the
canonical `P`-Glivenko-Cantelli endpoint.  The compiled declaration
`VdVWPGlivenkoCantelliClass_of_variableEntropy_logCardinality_div_bound`
composes the existing variable-entropy centered convergence theorem with the
finite-product uniform-deviation bridge and the canonical iid projection
bridge.  This is closer to the book's random-entropy statement than the
structural-rate sufficient condition, but it still carries the deterministic
boundedness input needed to discharge selected finite-net tail/UI.  Remaining
blocker: remove or derive that deterministic bound by proving a true
random-entropy tail/UI theorem, or derive it from structural entropy/VC
hypotheses.

2026-05-05 follow-up: the variable-domain entropy branch with deterministic
log-cardinality boundedness now also reaches the Theorem 2.4.3 in-mean
centered-supremum conclusion.  The compiled declaration
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_variableEntropy_logCardinality_div_bound`
reuses the variable-entropy outer-probability convergence theorem and upgrades
it through the generic varying-domain tail/UI adapter.  Countability,
coordinate measurability, and an integrable measurable envelope discharge the
centered-supremum measurability, integrability, and tail/UI obligations.  The
remaining mismatch with the exact textbook statement is still the deterministic
log-bound/tail-UI input and the broader arbitrary `P`-measurable /
asymptotic-measurable class layer.

2026-05-05 follow-up: the structural deterministic-rate branch now also
reaches the Theorem 2.4.3 in-mean centered-supremum conclusion.  The compiled
declaration
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_logCardinality_div_tendsto_bound`
builds the canonical variable-domain entropy package from empirical covering
domination plus deterministic normalized log-cardinality rates tending to zero,
then reuses the variable-entropy in-mean endpoint.  This closes a real
asymmetry in the structural-rate route: structural deterministic entropy rates
now feed centered outer-probability convergence, finite-product and canonical
`P`-GC endpoints, and in-mean centered-supremum convergence.  The next target
should not be another endpoint wrapper; it should instantiate the structural
rate inputs from a genuine textbook VC/Sauer/trace-cover theorem, prove the
random-entropy selected finite-net tail/UI theorem without deterministic
boundedness, or extend the route beyond the countable coordinate-measurable
class layer.

2026-05-05 follow-up: the structural deterministic-rate branch now has a
joint endpoint package.  The compiled theorem
`VdVWTheorem243_logCardinality_div_tendsto_bound_pGlivenkoCantelli_and_inMean`
combines the structural-rate local book-style `P`-GC endpoint with the
structural-rate in-mean centered-supremum endpoint under the same covering,
rate, measurability, integrability, and Rademacher side conditions.  This is a
final-assembly convenience for future VC/Sauer/trace-cover instantiations, not
a new primitive.  The next productive Lean target remains to prove one of the
inputs that this package still exposes: a genuine structural covering/rate
theorem, a random-entropy finite-net tail/UI theorem without deterministic log
boundedness, or the arbitrary `P`-measurable/asymptotic-measurable class
bridge beyond countable coordinate measurability.

2026-05-05 `/goal` audit update: local search of
`StatInference/EmpiricalProcess/SubgraphTraceVC.lean` and
`StatInference/EmpiricalProcess/Theorem243.lean` confirms that the
full-subgraph route itself is already compiled under the explicit structural
assumption `VdVWUniformSubgraphVCBound`.  The strongest endpoint
`VdVWTheorem243_fullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`
already consumes that assumption and returns the no-nonempty countable
full-subgraph package including local `P`-GC, in-mean convergence, and the
Lemma 2.4.5 strong route.  Therefore the current `/goal` target should not
spend more runs on generic full-subgraph endpoint packaging.  The remaining
Theorem 2.4.3 work is now exactly: prove the random-entropy selected finite-net
tail/UI bridge without deterministic log boundedness; instantiate the compiled
full-subgraph/structural-rate assumptions for concrete textbook classes when a
chapter theorem or example requires it; and remove the countability/measurable
coordinate restriction by building the exact arbitrary-map/asymptotic
measurability and outer-cover primitives.

2026-05-05 follow-up: the Chapter 1 asymptotic-measurability lane now has a
continuous-map closure for the local shifted bounded-continuous predicates.
The compiled theorem
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.comp_continuous`
pulls bounded continuous tests back along a continuous map, and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.comp_continuous_of_lowerShifted`
packages the corresponding canonical-shift corollary.  This is the
arbitrary-map foundation analogue of the continuous-mapping theorem for the
current outer/inner expectation-gap primitive; it still does not replace the
full signed outer-expectation/asymptotic-measurability textbook definition.
Next work in this lane should connect these shifted predicates to exact
arbitrary-map weak-convergence statements or build the missing signed
outer-cover envelope layer.

2026-05-05 follow-up: the selected-test asymptotic-measurability predicates now
have monotonicity and arbitrary-map pullback closures.  The compiled
declarations `VdVWAsymptoticallyMeasurableNonnegative.mono_tests`,
`VdVWAsymptoticallyMeasurableNonnegative.comp_map`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal.mono_tests`, and
`VdVWAsymptoticallyMeasurableLowerShiftedReal.comp_map` let future exact
weak-convergence statements shrink test classes or precompose tests with
state-space maps without reopening the outer/inner expectation-gap proof.
This is still a foundation layer: the next missing exact Chapter 1 bridge is
the signed bounded-continuous arbitrary-map weak-convergence formulation, or a
nonmeasurable outer-cover envelope layer strong enough to state it honestly.

2026-05-05 `/goal` target refresh after `fefbccd`: treat the Chapter 1
VdV&W 1.3.1 bounded-continuous generated-sigma wrapper, 1.3.12(i)
bounded-continuous measure uniqueness wrapper, 1.3.2 complete-separable
tightness wrapper, and 1.4.1 product Borel-space wrapper as closed.  The next
high-capacity proof target is not another generic Theorem 2.4.3 endpoint
wrapper.  Priority order is:

1. prove the selected finite-net/random-entropy tail/UI bridge without a
   deterministic normalized-log bound, or record the exact missing theorem
   after Lean/API attempts;
2. instantiate the compiled structural-rate/full-subgraph Theorem 2.4.3
   packages for concrete textbook VC/Sauer/trace-cover hypotheses when the
   needed combinatorial theorem is available;
3. build the exact Chapter 1 arbitrary-map/asymptotic-measurability signed
   weak-convergence and nonmeasurable outer-cover envelope primitives needed
   to remove countable/coordinate-measurable surrogate assumptions;
4. continue self-contained Chapter 1 wrappers from mathlib/ProbabilityMeasure
   such as product/FDD uniqueness and tightness/Portmanteau variants only when
   they directly remove a named row in the Chapter 1-2 blueprint.

2026-05-05 proof/search update: the random-entropy tail/UI target was searched
again in local `Theorem243.lean`, local `ProbabilityMeasure`, and pinned
mathlib `UniformIntegrable`/Vitali APIs.  The available mathlib theorems are
fixed-domain (`UniformIntegrable`, `tendsto_Lp_finite_of_tendstoInMeasure`,
`tendstoInMeasure_iff_tendsto_Lp_finite`) and do not by themselves convert
the varying-domain empirical-cover random entropy
`log N(η, F_M, L1(P_n))/n -> 0` in outer probability into tail expectation,
uniform integrability, or ordinary mean convergence.  This keeps the
random-entropy bridge as a genuine missing theorem unless an additional
tail/UI, deterministic bound, or structural cardinality estimate is supplied.

2026-05-05 Chapter 1 bridge update: the signed bounded-continuous
asymptotic-measurability layer now feeds the older lower-shifted/canonical
shifted predicates.  New compiled declarations:
`VdVWLowerShiftedRealOuterInnerExpectationGap_le_signed_sub_const`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.to_lowerShifted`, and
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.to_canonicalShifted`.
This reduces one foundation mismatch between the signed arbitrary-map
predicate and the earlier nonnegative shifted outer/inner expectation layer.

2026-05-05 varying-domain shifted bridge update: local/mathlib search found
no existing varying-domain lower-shifted/canonical shifted
asymptotic-measurability layer.  `WeakConvergence.lean` now adds the
sample-size-varying analogues
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains` and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains`,
their filter-refinement and measurable/null-measurable constructors, and the
signed bridge declarations
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.to_lowerShifted`
and `.to_canonicalShifted`.  This closes the shifted/canonical interface for
the varying-domain endpoints used by Theorem 2.4.3.

2026-05-05 a.e.-measurable arbitrary-map bridge update: local search found
the varying-domain null-measurable map-law wrappers but no common-domain
null-measurable or direct a.e.-measurable signed weak-convergence wrappers.
`WeakConvergence.lean` now adds
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_aemeasurable`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_aemeasurable`,
the common-domain null-measurable map-law bridge
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq_nullMeasurable`,
the proof-carrying common-domain wrappers
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_map_eq_nullMeasurable`,
`.to_signedBoundedContinuousArbitraryMap_of_maps_nullMeasurable`, and
`.to_signedBoundedContinuousArbitraryMap_of_maps_aemeasurable`, plus the
varying-domain a.e.-measurable wrapper
`.to_signedBoundedContinuousVaryingDomains_of_maps_aemeasurable`.  This closes
another Chapter 1 mismatch between mathlib a.e.-measurable random variables
and the local VdV&W signed arbitrary-map packages.

2026-05-05 distribution-convergence bridge update: the mathlib
`TendstoInDistribution` feeder no longer needs an extra pointwise
measurability hypothesis to enter the local signed arbitrary-map package.
`WeakConvergence.lean` now adds
`vdVWTendstoInDistribution_to_signedOuterBoundedContinuous_aemeasurable`,
`vdVWTendstoInDistribution_to_signedBoundedContinuousArbitraryMap_aemeasurable`,
and
`VdVWConvergesInOuterProbability.to_signedBoundedContinuousArbitraryMap_aemeasurable`.
These use the a.e.-measurability already stored in mathlib convergence in
distribution, plus the new a.e.-measurable pushforward wrappers, to close a
Chapter 1 bridge toward exact arbitrary-map weak-convergence statements.

2026-05-05 varying-domain distribution bridge update: local/mathlib search
found no direct varying-domain `TendstoInDistribution` feeder into the local
VdV&W signed package, even though mathlib's `TendstoInDistribution` itself is
sample-space-varying.  `WeakConvergence.lean` now adds
`vdVWTendstoInDistribution_to_signedOuterBoundedContinuousVaryingDomains_aemeasurable`
and
`vdVWTendstoInDistribution_to_signedBoundedContinuousVaryingDomains_aemeasurable`.
These let sample-size-varying law convergence feed Theorem 2.4.3-style
signed weak-convergence endpoints directly under a.e.-measurability.

2026-05-05 has-law bridge update: local search showed the `HasLaw` bridge still
had an unnecessary pointwise-measurability input, even though mathlib `HasLaw`
already stores `aemeasurable` and `map_eq`.  `WeakConvergence.lean` now adds
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_hasLaw_aemeasurable`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_hasLaw_aemeasurable`,
and
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_hasLaw_aemeasurable`.
This closes the has-law version of the same Chapter 1 arbitrary-map
measurability mismatch.

2026-05-05 shifted a.e.-measurable constructor update: local search found no
direct a.e.-measurable constructors for the lower-shifted/canonical shifted
bounded-continuous asymptotic-measurability predicates.  `WeakConvergence.lean`
now adds common-domain null/a.e. constructors
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.of_forall_nullMeasurable`,
`.of_forall_aemeasurable`,
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.of_forall_nullMeasurable`,
and `.of_forall_aemeasurable`, plus the varying-domain a.e. constructors
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.of_forall_aemeasurable`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.of_forall_aemeasurable`.
These are direct consumers of the signed a.e.-measurable bridge and avoid
manual routing through the signed package in later Chapter 1 and Theorem 2.4.3
endpoints.

2026-05-05 follow-up: the local asymptotic-measurability predicates are now
stable under filter refinement/subsequence filters.  The compiled declarations
`VdVWAsymptoticallyMeasurableNonnegative.mono_filter`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal.mono_filter`,
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.mono_filter`, and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.mono_filter`
let later Chapter 1 weak-convergence and tightness arguments pass to finer
filters without rebuilding outer/inner expectation-gap proofs.  This narrows
the remaining arbitrary-map gap to the signed bounded-continuous weak-
convergence definition and its nonmeasurable outer-cover envelope support.

2026-05-05 `ell_infty(T)` process-space update: local search confirmed the
mathlib substrate remains `lp (fun _ : T => ℝ) ∞` with `Memℓp`,
`memℓp_infty_iff`, `lp.norm_eq_ciSup`, `lp.norm_apply_le_norm`,
`lp.norm_le_of_forall_le`, `lp.evalCLM`, and `lp.completeSpace`; no existing
VdV&W-named `ell_infty(T)` process wrapper was present in `StatInference`.
`StatInference/EmpiricalProcess/EllInfty.lean` now adds the local
`VdVWEllInfty T` abbreviation, bounded-function constructor
`VdVWEllInfty.ofBounded`, coordinate norm and supremum-norm wrappers,
continuous coordinate evaluation `VdVWEllInfty.evalCLM`, bounded sample-path
process maps, and finite-dimensional coordinate restriction
`VdVWEllInfty.finiteRestrict` with continuity/measurability wrappers.  The
empirical-process FDD namespace now also has
`vdVW148_ellInfty_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`,
the forward FDD weak-convergence implication for laws on `ell_infty(T)`.  A
follow-up in the same layer adds
`vdVW148_ellInfty_finiteDimensional_hasLaw`,
`vdVW148_ellInfty_finiteDimensional_identDistrib`, and
`vdVW148_ellInfty_finiteDimensional_tendstoInDistribution`, so
`ell_infty(T)`-valued laws, identical distributions, and varying-domain
mathlib convergence in distribution now all feed finite-dimensional
coordinate restrictions directly.  This closes the first exact process-space
substrate layer; it does not prove separability, asymptotic tightness, or the
FDD weak-convergence converse.  Next work in this lane should target those
stronger process primitives or the nonmeasurable outer-cover signed
weak-convergence layer.

2026-05-05 finite-index `ell_infty(T)` follow-up: pinned mathlib search found
the exact finite-index equivalences
`Equiv.lpPiLp`, `lpPiLpₗᵢ`, and `PiLp.continuousLinearEquiv` in
`Mathlib.Analysis.Normed.Lp.LpEquiv`/`PiLp`.  `EllInfty.lean` now exposes
their composition as
`VdVWEllInfty.finiteContinuousLinearEquiv : VdVWEllInfty T ≃L[ℝ] (T -> ℝ)`
for `Fintype T`, with forward/symmetric coordinate simplification lemmas.
This is the finite-index process-space identification needed before a clean
finite-index FDD converse; it still does not close the arbitrary-index
separability/tightness/FDD-converse theorem.

2026-05-05 finite-index FDD converse follow-up: local/pinned search found
`ProbabilityMeasure.toMeasure_map`, `ProbabilityMeasure` extensionality,
`Measure.map_map`, and `AEMeasurable.map_map_of_aemeasurable` as the needed
pushforward-cancellation APIs.  `FiniteDimensional.lean` now proves
`vdVW148_ellInfty_map_finiteContinuousLinearEquiv_symm_map`, cancelling the
finite product equivalence on probability measures, plus the finite-index
weak-convergence converse
`vdVW148_ellInfty_weakConvergence_of_finiteProduct_weakConvergence_finite`
and random-variable converse
`vdVW148_ellInfty_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`.
This closes the finite-index converse layer.  It deliberately does not claim
the arbitrary-index VdV&W 1.4.8 criterion, whose remaining prerequisites are
separability, tightness, asymptotic measurability, and process-level
nonmeasurable/arbitrary-map primitives.

2026-05-05 Portmanteau converse follow-up: local and pinned search found the
Billingsley/ProbabilityMeasure closed-set converse wrapper
`weakConvergence_of_forall_isClosed_limsup_measure_le`, mathlib
`MeasureTheory.tendsto_of_forall_isClosed_limsup_le'`,
`MeasureTheory.tendsto_of_forall_isOpen_le_liminf'`, and
`ProbabilityMeasure.tendsto_measure_of_null_frontier_of_tendsto'`.
`WeakConvergence.lean` now exposes the VdV&W-local measure-level declarations
`VdVWWeakConvergenceProbabilityMeasures.tendsto_measure_of_null_frontier`,
`vdVWWeakConvergenceProbabilityMeasures_of_forall_isClosed_limsup_measure_le`,
and
`vdVWWeakConvergenceProbabilityMeasures_of_forall_isOpen_measure_le_liminf`.
This closes the ordinary probability-measure continuity-set and closed/open
Portmanteau converse layer.  It does not close arbitrary-map outer-probability
Portmanteau statements or the nonmeasurable process-level weak-convergence
definitions.

2026-05-05 norm-tail tightness follow-up: pinned search found mathlib
`MeasureTheory.tendsto_measure_norm_gt_of_isTightMeasureSet`,
`MeasureTheory.isTightMeasureSet_of_tendsto_measure_norm_gt`, and
`MeasureTheory.isTightMeasureSet_iff_tendsto_measure_norm_gt` in
`Mathlib.MeasureTheory.Measure.TightNormed`.  `WeakConvergence.lean` now
exposes the VdV&W-local wrappers
`VdVWProbabilityMeasuresTight.tendsto_norm_tail`,
`vdVWProbabilityMeasuresTight_of_tendsto_norm_tail`, and
`vdVWProbabilityMeasuresTight_iff_tendsto_norm_tail` for probability-measure
families on normed/proper normed spaces.  This is a reusable Chapter 1
tightness foundation for finite-dimensional and Hilbert/normed routes; it is
not an arbitrary-map asymptotic-tightness theorem.

2026-05-05 π-system and product-test follow-up: local search found
`StatInference.ProbabilityMeasure.weakConvergence_of_piSystem_tendsto` and
mathlib `IsPiSystem.tendsto_probabilityMeasure_of_tendsto_of_mem`; the
VdVW-local wrapper
`vdVWWeakConvergenceProbabilityMeasures_of_piSystem_tendsto` now exposes this
convergence-determining class criterion in `WeakConvergence.lean`.  Search also
found mathlib product bounded-continuous test extensionality in
`Mathlib.MeasureTheory.Measure.HasOuterApproxClosedProd`; `FiniteDimensional.lean`
now proves VdV&W 1.4.2-named wrappers
`vdVW142_prod_measure_ext_of_forall_boundedContinuous_integral_mul` and
`vdVW142_prod_measure_eq_prod_of_forall_boundedContinuous_integral_mul`.  These
are ordinary measure-level product/FDD foundations and do not close the
arbitrary-index process weak-convergence converse.

2026-05-05 independent product-law follow-up: local search found the already
compiled binary product-law wrapper `VdVWWeakConvergenceProbabilityMeasures.prod`,
finite product-law wrapper `VdVWWeakConvergenceProbabilityMeasures.pi`, and
mathlib independence law APIs `IndepFun.hasLaw_prod` and
`iIndepFun.hasLaw_pi`.  `WeakConvergence.lean` now exposes the ordinary
measurable random-variable forms of the VdV&W 1.4.6 independent-coordinate
product convergence layer as
`vdVWTendstoInDistribution_prodMk_laws_of_indepFun` for binary pairs and
`vdVWTendstoInDistribution_pi_laws_of_iIndepFun` for finite coordinate
families.  The current `/goal` target should treat ordinary measurable
finite-coordinate product-law convergence as closed and move to the remaining
exact blockers: arbitrary-map/asymptotic-independence product statements,
arbitrary-index FDD converse with separability/tightness support, the
nonmeasurable signed outer-cover weak-convergence layer, or the exact
Theorem 2.4.3 random-entropy/tail-UI mismatch.

2026-05-05 independent product convergence-in-distribution follow-up: local
and pinned search found no direct mathlib theorem for independent nonconstant
joint convergence in distribution; mathlib only has the Slutsky-style
`TendstoInDistribution.prodMk_of_tendstoInMeasure_const`, while the needed law
equalities are supplied by `IndepFun.hasLaw_prod` and `iIndepFun.hasLaw_pi`.
`WeakConvergence.lean` now consumes the law-level wrappers into the ordinary
random-variable declarations `vdVWTendstoInDistribution_prodMk_of_indepFun`
and `vdVWTendstoInDistribution_pi_of_iIndepFun`, assuming independence of the
limiting coordinates.  This closes the ordinary measurable binary and finite
VdV&W 1.4.6 convergence-in-distribution layer.  It still does not prove the
textbook arbitrary-map/asymptotic-independence product criterion.

2026-05-05 signed product-coordinate arbitrary-map follow-up: local search
found no existing signed arbitrary-map product-coordinate lift, but the newly
compiled Chapter 1.2 product projection outer/inner expectation invariance is
enough for the a.e.-measurable ignored-coordinate case.  `WeakConvergence.lean`
now adds
`VdVWSignedOuterExpectationPosNeg_prod_fst_eq_of_aemeasurable`,
`VdVWSignedOuterExpectationPosNeg_prod_snd_eq_of_aemeasurable`,
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_prod_fst_eq_of_aemeasurable`,
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_prod_snd_eq_of_aemeasurable`,
`VdVWWeakConvergenceSignedOuterBoundedContinuous.prod_fst_of_aemeasurable`,
`.prod_snd_of_aemeasurable`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.prod_fst_of_aemeasurable`,
and `.prod_snd_of_aemeasurable`.  This closes the ignored-product-coordinate
case for the local signed arbitrary-map weak-convergence package under
a.e.-measurability.  It does not close the full VdV&W
asymptotic-independence product theorem, which still needs a genuine
nonmeasurable/asymptotic-independence primitive.

2026-05-05 varying-domain signed product-coordinate follow-up:
`WeakConvergence.lean` now adds the sample-size-varying analogues
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.prod_fst_of_aemeasurable`,
`.prod_snd_of_aemeasurable`,
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.prod_fst_of_aemeasurable`,
and `.prod_snd_of_aemeasurable`.  These lift the signed varying-domain weak
convergence and asymptotic-measurability packages through an ignored
probability product coordinate, reusing the same signed product-projection
expectation equalities.  This is the product-coordinate closure needed for
finite-sample spaces such as `SampleAt Observation n`; the remaining product
gap is still the true arbitrary-map/asymptotic-independence theorem, not this
a.e.-measurable ignored-coordinate case.

2026-05-05 sequence norm-tail tightness follow-up: pinned mathlib search found
`MeasureTheory.isTightMeasureSet_range_of_tendsto_limsup_measure_norm_gt` and
`MeasureTheory.isTightMeasureSet_range_iff_tendsto_limsup_measure_norm_gt` in
`Mathlib.MeasureTheory.Measure.TightNormed`.  `WeakConvergence.lean` now wraps
them as
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_norm_tail` and
`vdVWProbabilityMeasuresTight_range_iff_tendsto_limsup_norm_tail` for
sequences of probability measures on proper normed Borel spaces.  This closes
the sequential measure-level norm-tail tightness foundation used by Chapter 1
Prokhorov/tightness arguments; it does not close VdV&W arbitrary-map
asymptotic tightness or process-level separability.

2026-05-05 closed-ball tightness follow-up: search in
`Mathlib.MeasureTheory.Measure.TightNormed` also found
`MeasureTheory.tendsto_measure_compl_closedBall_of_isTightMeasureSet`,
`MeasureTheory.isTightMeasureSet_of_tendsto_measure_compl_closedBall`, and
`MeasureTheory.isTightMeasureSet_iff_tendsto_measure_compl_closedBall`.
`WeakConvergence.lean` now exposes the corresponding VdV&W-local
probability-measure wrappers
`VdVWProbabilityMeasuresTight.tendsto_closedBall_compl`,
`vdVWProbabilityMeasuresTight_of_tendsto_closedBall_compl`, and
`vdVWProbabilityMeasuresTight_iff_tendsto_closedBall_compl`.  This closes the
proper pseudo-metric closed-ball tightness layer behind the norm-tail route;
the remaining tightness blocker is still exact arbitrary-map/asymptotic
tightness.

2026-05-05 finite-dimensional inner-product tightness follow-up: the same
pinned mathlib file also supplies
`MeasureTheory.isTightMeasureSet_of_inner_tendsto`,
`MeasureTheory.isTightMeasureSet_iff_inner_tendsto`,
`MeasureTheory.isTightMeasureSet_range_of_tendsto_limsup_inner`, and
`MeasureTheory.isTightMeasureSet_range_iff_tendsto_limsup_inner`.
`WeakConvergence.lean` now exposes the VdV&W-local probability-measure wrappers
`vdVWProbabilityMeasuresTight_of_forall_inner_tendsto`,
`vdVWProbabilityMeasuresTight_iff_forall_inner_tendsto`,
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_inner`, and
`vdVWProbabilityMeasuresTight_range_iff_tendsto_limsup_inner`.  This closes
the finite-dimensional inner-product/FDD-coordinate tightness layer; it is
still measure-level and does not prove arbitrary-map asymptotic tightness.

2026-05-05 finite-dimensional unit-tail follow-up: search in
`Mathlib.MeasureTheory.Measure.TightNormed` also found
`MeasureTheory.isTightMeasureSet_range_of_tendsto_limsup_inner_of_norm_eq_one`
and
`MeasureTheory.isTightMeasureSet_range_of_tendsto_limsup_measureReal_inner_of_norm_eq_one`.
`WeakConvergence.lean` now exposes the corresponding probability-measure
wrappers
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_inner_of_norm_eq_one`
and
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_measureReal_inner_of_norm_eq_one`.
The second wrapper discharges mathlib's eventual finite-measure total-mass
bound with probability total mass one.  This completes the current
mathlib-backed finite-dimensional tightness wrapper batch; the remaining
tightness blocker is still exact arbitrary-map/asymptotic tightness.

2026-05-05 raw bounded-process FDD follow-up: local search for
`processMap.*finiteDimensional`, `boundedProcess`, and raw-process FDD
wrappers found no existing VdV&W bridge beyond the already compiled
`ell_infty(T)`-valued declarations.  `EllInfty.lean` now adds the coordinate
simplification
`VdVWEllInfty.finiteRestrict_processMap_apply`, and
`FiniteDimensional.lean` adds
`vdVW148_boundedProcess_finiteDimensional_hasLaw`,
`vdVW148_boundedProcess_finiteDimensional_identDistrib`, and
`vdVW148_boundedProcess_finiteDimensional_tendstoInDistribution`.  These route
bounded raw sample-path processes through `VdVWEllInfty.processMap` into the
existing finite-dimensional law, identical-distribution, and convergence-in-
distribution wrappers.  This removes a small Chapter 1 process/FDD API gap
without claiming the arbitrary-index 1.4.8 converse; the remaining process
blockers are still separability/asymptotic tightness, arbitrary-map
asymptotic measurability/outer-cover weak convergence, and the full FDD
weak-convergence converse.

2026-05-05 finite-index raw-process converse follow-up: the adjacent search
for `boundedProcess.*finiteProduct`, `finiteProduct.*boundedProcess`,
`processMap.*finiteProduct`, and `finiteContinuousLinearEquiv.*processMap`
found no existing raw-process finite-index converse.  `EllInfty.lean` now
adds `VdVWEllInfty.finiteContinuousLinearEquiv_processMap_apply`, and
`FiniteDimensional.lean` adds
`vdVW148_boundedProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`.
This proves that for finite `T`, convergence in distribution of the ordinary
finite-coordinate raw processes implies convergence in distribution of the
bounded `ell_infty(T)` process maps.  It closes the raw finite-index converse
API while preserving the real arbitrary-index blockers: separability,
tightness/asymptotic tightness, asymptotic measurability, and nonmeasurable
outer-cover process weak convergence.

2026-05-05 finite-index raw-process law follow-up: local search for finite
raw-process `HasLaw`/`IdentDistrib` converse wrappers found no existing API.
`FiniteDimensional.lean` now adds
`vdVW148_boundedProcess_hasLaw_of_finiteProduct_hasLaw_finite` and
`vdVW148_boundedProcess_identDistrib_of_finiteProduct_identDistrib_finite`,
using `HasLaw.comp`, `IdentDistrib.comp`, and the finite
`VdVWEllInfty.finiteContinuousLinearEquiv`.  Thus finite-product laws and
identical distributions for raw bounded processes now lift directly to their
`ell_infty(T)` process maps.  This completes the finite-index raw law/FDD
bridge layer; the arbitrary-index VdV&W 1.4.8 converse still needs the
separability, tightness/asymptotic-tightness, and nonmeasurable
asymptotic-measurability primitives.

2026-05-05 finite-product law weak-convergence follow-up: local search found
the existing finite-index converse for `ell_infty(T)` laws, but not the direct
entry point from weak convergence of ordinary finite-product laws.
`FiniteDimensional.lean` now adds
`vdVW148_ellInfty_map_symm_weakConvergence_of_finiteProduct_weakConvergence_finite`,
which pushes weak convergence on `T -> ℝ` back along
`VdVWEllInfty.finiteContinuousLinearEquiv.symm`.  This closes the
measure-level finite-product law feeder for finite-index process arguments;
it remains separate from the arbitrary-index FDD converse.

2026-05-05 measure-level asymptotic tightness follow-up: local search found
ordinary tightness wrappers but no VdVW-local asymptotic-tightness predicate.
`WeakConvergence.lean` now adds
`VdVWProbabilityMeasuresAsymptoticallyTight`, the tight-family feeder
`VdVWProbabilityMeasuresTight.asymptoticallyTight_of_eventually_mem`, the
range feeder `VdVWProbabilityMeasuresAsymptoticallyTight.of_tight_range`, and
continuous-map stability
`VdVWProbabilityMeasuresAsymptoticallyTight.map_continuous`.  This is the
ordinary probability-measure foundation needed by Chapter 1 process/FDD
routes; it does not close the full VdV&W arbitrary-map/nonmeasurable process
asymptotic-tightness theorem.

2026-05-05 finite-dimensional asymptotic-tightness follow-up: local search
found the newly compiled measure-level asymptotic-tightness predicate and the
existing finite-dimensional weak-convergence/FDD wrappers, but no
finite-dimensional asymptotic-tightness bridge.  `WeakConvergence.lean` now
adds
`VdVWProbabilityMeasuresAsymptoticallyTight.finiteDimensionalRestrict`.
`FiniteDimensional.lean` adds
`vdVW148_ellInfty_finiteDimensional_asymptoticallyTight_of_processLaw_asymptoticallyTight`,
`vdVW148_ellInfty_asymptoticallyTight_of_finiteProduct_asymptoticallyTight_finite`,
and
`vdVW148_ellInfty_map_symm_asymptoticallyTight_of_finiteProduct_asymptoticallyTight_finite`.
This closes the ordinary finite-coordinate and finite-index process-law
asymptotic-tightness feeders.  It still does not prove the arbitrary-index
VdV&W process asymptotic-tightness/FDD-converse theorem, whose missing inputs
remain separability, exact arbitrary-map asymptotic measurability, and the
nonmeasurable outer-cover process weak-convergence layer.

2026-05-05 product asymptotic-tightness follow-up: local/mathlib search found
binary product weak-convergence wrappers and product-measure APIs
`Measure.prod_prod`, `Set.compl_prod_eq_union`, and `measure_union_le`, but no
existing VdV&W-local asymptotic-tightness product theorem.  `WeakConvergence.lean`
now adds `VdVWProbabilityMeasuresAsymptoticallyTight.prod`, proving that
ordinary measure-level asymptotic tightness is stable under binary product
laws along the same filter.  This closes the ordinary Chapter 1 product-law
tightness foundation; it still does not prove the nonmeasurable VdV&W
arbitrary-map/asymptotic-independence product criterion.

2026-05-05 asymptotic-tightness filter-stability follow-up: local search found
filter-refinement lemmas for weak convergence and asymptotic measurability,
but not for the newly introduced measure-level asymptotic-tightness predicate.
`WeakConvergence.lean` now adds
`VdVWProbabilityMeasuresAsymptoticallyTight.mono_filter` and
`VdVWProbabilityMeasuresAsymptoticallyTight.congr_eventually`.  These support
subsequence/finer-filter and eventually-equal law-family handoffs in Chapter 1
process arguments without changing the remaining exact arbitrary-map/process
blockers.

2026-05-05 asymptotic-tightness reindexing follow-up: local search found
generic `Tendsto.comp`/`Tendsto.eventually` patterns but no VdV&W-local
reindexing theorem for the measure-level asymptotic-tightness predicate.
`WeakConvergence.lean` now adds
`VdVWProbabilityMeasuresAsymptoticallyTight.comp_tendsto`, letting any
index-map tending to the original filter pull asymptotic tightness back to
the reindexed family.  This is the ordinary net/subsequence handoff needed by
Chapter 1 process arguments; it still leaves exact arbitrary-map
asymptotic-tightness and FDD-converse primitives open.

2026-05-05 weak-convergence-to-tightness follow-up: local/mathlib search found
the compact-range theorem `Tendsto.isCompact_insert_range` and mathlib's
Prokhorov tightness theorem
`MeasureTheory.isTightMeasureSet_of_isCompact_closure`, but no VdV&W-local
consumer connecting sequential weak convergence of probability laws to the
new asymptotic-tightness predicate.  `WeakConvergence.lean` now adds
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_atTop` for
complete second-countable pseudo-metric Borel spaces.  This closes the
ordinary sequential measure-level implication “weak convergence implies
asymptotic tightness”; it does not prove the VdV&W nonmeasurable
arbitrary-map/process asymptotic-tightness theorem.

2026-05-05 weak-convergence tightness reindex/product follow-up: local search
found the existing finite product weak-convergence wrapper
`VdVWWeakConvergenceProbabilityMeasures.pi`, the new measure-level
asymptotic-tightness reindexing theorem
`VdVWProbabilityMeasuresAsymptoticallyTight.comp_tendsto`, and mathlib's
finite product probability-measure continuity `ProbabilityMeasure.continuous_pi`;
no direct finite-product asymptotic-tightness theorem was present.  Rather
than adding a fragile finite-union measure proof, `WeakConvergence.lean` now
adds the theorem-facing consumers
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_comp_tendsto_atTop`
and `VdVWWeakConvergenceProbabilityMeasures.pi_asymptoticallyTight_atTop`.
Follow-up search found no binary product or reindexed finite-product
weak-convergence-to-tightness consumers.  The same file now also adds
`VdVWWeakConvergenceProbabilityMeasures.prod_asymptoticallyTight_atTop`,
`VdVWWeakConvergenceProbabilityMeasures.prod_asymptoticallyTight_comp_tendsto_atTop`,
and
`VdVWWeakConvergenceProbabilityMeasures.pi_asymptoticallyTight_comp_tendsto_atTop`.
These close the ordinary subsequence/reindexed weak-convergence-to-tightness,
binary product-law weak-convergence-to-tightness, and finite product-law
weak-convergence-to-tightness handoffs.  They still do not prove the
arbitrary-map/process asymptotic-tightness, asymptotic-independence, or
arbitrary-index FDD-converse theorem.

2026-05-05 signed eventual-congruence follow-up: local search found
filter-refinement closures for the signed arbitrary-map weak-convergence and
asymptotic-measurability packages, but no eventual-equality transport for
measure families or arbitrary maps.  `WeakConvergence.lean` now adds
`VdVWWeakConvergenceSignedOuterBoundedContinuous.congr_eventually`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.congr_eventually`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.congr_eventually`, and
the varying-domain analogues
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.congr_eventually`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.congr_eventually`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.congr_eventually`.
These let later Chapter 1 and Theorem 2.4.3 endpoints replace sample laws or
statistics by eventually equal versions without rebuilding signed
outer/inner-expectation proofs.

2026-05-05 centered `P`-measurability follow-up: Theorem 2.4.3 already had
centered-supremum consumers requiring a centered `VdVWPMeasurableClass`
hypothesis, but `PMeasurable.lean` only exposed the uncentered countable
coordinate-measurable constructor.  `PMeasurable.lean` now adds
`VdVWPMeasurableClass.centered_of_countable_of_coordinate`, proving that a
countable coordinate-measurable class remains `P`-measurable after subtracting
the population integral from every coordinate.  This is a direct Definition
2.3.3 bridge for centered Theorem 2.4.3 endpoints.  `Theorem243.lean` now
consumes it directly through
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_countable_coordinate_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_countable_coordinate_convergesInOuterProbabilityConst`,
so countable coordinate-measurable centered empirical suprema can feed both
Dirac-law weak convergence and signed varying-domain weak convergence without
carrying a separate centered `P`-measurability hypothesis.

2026-05-05 coordinate `ell_infty` law follow-up: local search found the
finite-dimensional `ell_infty(T)` law/IdentDistrib/Tendsto-in-distribution
wrappers but no direct single-coordinate wrappers.  `FiniteDimensional.lean`
now adds `vdVW148_ellInfty_coordinate_hasLaw`,
`vdVW148_ellInfty_coordinate_identDistrib`, and
`vdVW148_ellInfty_coordinate_tendstoInDistribution`, using
`VdVWEllInfty.evalCLM`, `HasLaw.comp`, `IdentDistrib.comp`, and
`TendstoInDistribution.continuous_comp`.  The same file also exposes the raw
bounded-process coordinate forms
`vdVW148_boundedProcess_coordinate_hasLaw`,
`vdVW148_boundedProcess_coordinate_identDistrib`, and
`vdVW148_boundedProcess_coordinate_tendstoInDistribution` via
`VdVWEllInfty.processMap`.  This closes the direct one-coordinate
process/FDD entry points while leaving the arbitrary-index FDD converse
dependent on separability, tightness, and
nonmeasurable/asymptotic-measurability primitives.

2026-05-05 generic coordinate law follow-up: local search found the
`ell_infty(T)` coordinate law/IdentDistrib/Tendsto-in-distribution wrappers
but no corresponding generic dependent-product coordinate wrappers.
`FiniteDimensional.lean` now adds `vdVW148_coordinate_hasLaw`,
`vdVW148_coordinate_identDistrib`, and
`vdVW148_coordinate_tendstoInDistribution`, using `continuous_apply`,
`HasLaw.comp`, `IdentDistrib.comp`, and
`TendstoInDistribution.continuous_comp`.  This closes the generic
single-coordinate random-element side of the VdV&W 1.4.8 forward FDD layer;
the arbitrary-index converse still depends on separability/tightness and the
nonmeasurable/asymptotic-measurability primitives.

2026-05-05 coordinate weak-convergence/tightness follow-up: local search found
the finite-coordinate weak-convergence and asymptotic-tightness feeders for
dependent product process laws and `ell_infty(T)` laws, but no direct
single-coordinate measure-level versions.  `FiniteDimensional.lean` now adds
the generic dependent-product wrappers
`vdVW148_coordinate_weakConvergence_of_processLaw_weakConvergence` and
`vdVW148_coordinate_asymptoticallyTight_of_processLaw_asymptoticallyTight`,
using `continuous_apply`, plus the `ell_infty(T)` wrappers
`vdVW148_ellInfty_coordinate_weakConvergence_of_processLaw_weakConvergence`
and
`vdVW148_ellInfty_coordinate_asymptoticallyTight_of_processLaw_asymptoticallyTight`,
using the continuous coordinate evaluation map `VdVWEllInfty.evalCLM`.  This
closes the direct one-coordinate law-level weak-convergence and tightness
feeders.  The real arbitrary-index FDD converse remains dependent on
separability, process asymptotic tightness, and the exact
nonmeasurable/asymptotic-measurability primitives.

2026-05-05 outer/inner order bridge follow-up: local search found the
nonnegative outer/inner expectation definitions, monotonicity lemmas, and
measurable-collapse bridges in `OuterExpectation.lean`, but no basic global
order theorem between the inner and outer envelopes.  `OuterExpectation.lean`
now proves `VdVWInnerExpectation_le_outerExpectation`: every measurable
minorant is below every measurable majorant pointwise, hence the supremum of
minorant `lintegral`s is bounded by the infimum of majorant `lintegral`s.  This
is the Chapter 1.2 support relation needed by local outer/inner gap predicates.
It does not close the full signed extended-real arbitrary-map measurable-cover
existence theorem or the nonmeasurable asymptotic-measurability layer.

2026-05-05 outer/inner gap-equivalence follow-up: after the basic order bridge
compiled, `WeakConvergence.lean` now proves
`VdVWNonnegativeOuterInnerExpectationGap_eq_zero_iff_outer_eq_inner`.  The
proof uses mathlib `tsub_eq_zero_iff_le` for the outer-minus-inner gap and the
new `VdVWInnerExpectation_le_outerExpectation` for the reverse inequality.
This turns the local Chapter 1 asymptotic-measurability gap predicate into the
expected equality criterion whenever an outer-to-inner inequality can be
supplied.  It still does not provide the missing arbitrary-map signed
extended-real cover existence theorem.

2026-05-05 signed gap-equivalence follow-up: local search found only the
measurable/null-measurable/a.e.-measurable zero lemmas for
`VdVWSignedBoundedContinuousOuterInnerExpectationGap`, not a criterion reducing
the signed gap to positive/negative outer-inner equality.  `WeakConvergence.lean`
now proves `VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_iff`
by splitting the two nonnegative gaps and reusing
`VdVWNonnegativeOuterInnerExpectationGap_eq_zero_iff_outer_eq_inner`.  This is
a Chapter 1 arbitrary-map/asymptotic-measurability support bridge for
bounded-continuous real tests; the exact full signed extended-real arbitrary-map
cover theorem remains open.

2026-05-05 lower-shifted gap-equivalence follow-up: local search found the
lower-shifted real gap definition and measurable zero lemma, but no equivalence
between zero gap and equality of outer/inner expectations for the shifted
nonnegative proxy.  `WeakConvergence.lean` now proves
`VdVWLowerShiftedRealOuterInnerExpectationGap_eq_zero_iff` by reusing
`VdVWNonnegativeOuterInnerExpectationGap_eq_zero_iff_outer_eq_inner`.  This
completes the same equality-criterion bridge for the lower-shifted real
asymptotic-measurability predicate; full signed extended-real arbitrary-map
cover existence remains the open exact-textbook primitive.

2026-05-05 Theorem 2.4.3 log-succ-linear constructor follow-up: local search
found fixed-`M` selected fixed-radius tail/UI constructors for shifted
log-linear bounds, but no all-positive-`M` package constructor.  `Theorem243.lean`
now adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_logCardinality_log_succ_linear_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_trace_image_cardinality_bound_log_succ_linear`.
These let polynomial/VC trace-count proofs feed the selected fixed-radius
Theorem 2.4.3 route uniformly over all positive truncation levels.  They do
not remove the exact random-entropy tail/UI gap when no deterministic
log-succ-linear or trace-count bound is available.

2026-05-05 Theorem 2.4.3 natural-polynomial constructor follow-up: the same
search found fixed-`M` natural-polynomial selected tail/UI constructors but no
all-positive-`M` version.  `Theorem243.lean` now adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_logCardinality_nat_poly_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_trace_image_cardinality_bound_nat_poly`.
These are the direct all-truncation-level consumers for VC/Sauer-style bounds
of the form `cardinality + 1 <= C(M, eta) * (n + 1) ^ d(M, eta)`.

2026-05-05 Theorem 2.4.3 first-sample tail bridge follow-up: local search
found the compiled selected fixed-radius side-condition constructor from the
first-sample `eLpNorm` tail criterion, but not the corresponding untruncated
centered convergence endpoint.  `Theorem243.lean` now adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_eLpNormTail`,
which composes the variable-domain book entropy condition, selected
first-sample `eLpNorm` tail/UI input, fixed-radius finite-net route, and
large-`M` untruncation handoff.  This does not prove the textbook
random-entropy implication by itself; it isolates the remaining proof target
to an explicit lifted selected-entropy `eLpNorm` tail condition or a
structural cardinality theorem implying that condition.

2026-05-05 Theorem 2.4.3 endpoint bridge follow-up: local search found the
two endpoint handoffs from centered finite-product convergence to finite
uniform-deviation convergence and then to the canonical infinite iid process,
but no single reusable book-style `P`-GC endpoint theorem.  `Theorem243.lean`
now adds
`VdVWPGlivenkoCantelliClass_of_centered_weightedSupremum_convergesInOuterProbabilityConst`,
so every centered-supremum route, including the new first-sample `eLpNorm`
tail route, can feed the canonical `P`-Glivenko-Cantelli endpoint without
duplicating the projection argument.  This is endpoint plumbing only; the
remaining mathematical blocker is still the selected-entropy tail/structural
cardinality proof.

2026-05-05 Theorem 2.4.3 in-mean endpoint follow-up: local search found the
generic tail/UI in-mean adapter
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_tailExpectation`
and repeated route-specific uses, but no reusable theorem discharging its
measurability, integrability, and tail/UI hypotheses from the standard
countable class plus integrable-envelope assumptions.  `Theorem243.lean` now
adds
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_integrable_envelope`.
Any centered-supremum convergence route, including the first-sample `eLpNorm`
tail route, can now feed the in-mean endpoint through this single adapter.
The selected-entropy tail/structural-cardinality proof remains the real
non-finite Theorem 2.4.3 blocker.

2026-05-05 Theorem 2.4.3 structural entropy follow-up: local search found the
selected fixed-radius constructor from a uniform first-sample selected
normalized-entropy `nnnorm` bound, but no final centered convergence theorem
consuming that structural bound.  `Theorem243.lean` now adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_nnnorm_bound`.
This is the deterministic structural specialization of the first-sample
`eLpNorm` tail route: a VC/Sauer, finite-trace, or finite-code cardinality
argument that proves the displayed uniform bound now feeds directly into
untruncated centered convergence.  The remaining non-finite theorem blocker is
to prove such a structural bound for the selected empirical-cover entropy, or
to prove the more general first-sample `eLpNorm` tail condition directly.

2026-05-05 Theorem 2.4.3 selected-entropy structural-bound follow-up: local
search found existing selected terminal log-bound transfer lemmas and
natural-polynomial cardinality arithmetic, but no bridge that produced the
new first-sample `nnnorm` hypothesis itself.  `Theorem243.lean` now adds
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.firstSample_nnnorm_bound_of_logCardinality_div_bound`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.firstSample_nnnorm_bound_of_logCardinality_nat_poly_bound`.
These close the deterministic structural route into the first-sample
selected-entropy input: a real normalized-log bound, or a VC/Sauer-style
`cardinality + 1 <= C(M, eta) * (n + 1)^d(M, eta)` estimate, now yields the
uniform first-sample `nnnorm` bound consumed by the centered untruncated
Theorem 2.4.3 route.  The remaining exact non-finite theorem blocker is no
longer this transfer; it is the upstream proof of such structural cardinality
estimates for the selected empirical-cover entropy from the textbook class
hypotheses, or the genuinely random first-sample `eLpNorm` tail/UI condition.

2026-05-05 a.e.-measurable Dirac endpoint follow-up: local search found the
measurable and null-measurable real-valued varying-domain
outer-probability-to-Dirac-law bridges, but no direct `AEMeasurable` forms.
`WeakConvergence.lean` now adds
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_aemeasurable`
and
`VdVWConvergesInOuterProbabilityConst.to_signedBoundedContinuousVaryingDomains_real_of_aemeasurable`.
These are Chapter 1/Theorem 2.4.3 endpoint convenience bridges for
sample-size-varying real statistics whose laws carry mathlib
`AEMeasurable` hypotheses.  They do not alter the main blocker: the remaining
Theorem 2.4.3 work is still the selected empirical-cover entropy
tail/UI or structural cardinality theorem, while the deeper Chapter 1
arbitrary-map blockers remain nonmeasurable outer-cover signed weak
convergence, asymptotic-tightness/asymptotic-independence, arbitrary-index FDD
converse, and separability/`P`-measurable class primitives.

2026-05-05 `/goal` recalibration and probability-radius closure: targeted
search of the active Theorem 2.4.3 route confirmed that the already compiled
mean/tail/UI and structural-cardinality packages are not the same as the book
random entropy assumption.  `Theorem243.lean` now adds
`exists_pos_radius_eventually_outerProbability_add_const_le_of_forall_convergesInOuterProbabilityConst`,
the direct outer-probability fixed-radius chooser.  It lets a future pure
probability proof choose a fixed positive net radius and absorb the deterministic
radius term once the finite-net error itself is known to converge in outer
probability.  This avoids forcing every fixed-radius route through ordinary
mean/Markov tail/UI.

Updated active `/goal` target: continue the broad Chapter 1-2 formalization in
dependency order, but stop adding generic Theorem 2.4.3 endpoint wrappers unless
they consume a new proof input.  The next high-value proof target is a
probability-level centered-truncated finite-net comparison using the stochastic
entropy convergence already available, or a structural selected-cover theorem
that proves the existing tail/UI or cardinality-growth hypotheses from exact
book assumptions.  If that remains blocked after search and Lean attempts,
advance to theorem-critical Chapter 1 arbitrary-map/asymptotic-measurability or
nonmeasurable outer-cover primitives that remove countability/measurability
mismatches in the exact Chapter 1-2 statements.

2026-05-05 probability finite-net handoff follow-up: local search found the
compiled stochastic-entropy-to-Hoeffding convergence theorem
`vdVWTheorem243FiniteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_logCardinality_div_convergesInOuterProbabilityConst_zero`
and the new fixed-radius outer-probability chooser, but no existing theorem
comparing the centered truncated supremum bad event directly to the
finite-net-Hoeffding bad event.  `Theorem243.lean` now adds
`VdVWConvergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_add_bound`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_finiteNetHoeffdingUpper`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_finiteNetHoeffdingUpper`.
Thus the book stochastic entropy input now reaches fixed-`M`
centered-truncated convergence modulo one explicit theorem-critical event
comparison:
`P^*( centered-truncated > epsilon ) <= P^*( finiteNetHoeffdingUpper_eta + eta > epsilon )`
eventually for every fixed `eta > 0` and `epsilon > 0`.  This is now the next
non-duplicative Theorem 2.4.3 proof target; do not replace it by another
ordinary-mean or tail/UI wrapper unless a later exact assembly requires that
route.

2026-05-05 pointwise finite-net comparison consumer: local search confirmed the
existing product-space symmetrization gives integrated/outer-expectation
comparisons and that the old `hphi_id` pointwise product target was too strong
for arbitrary classes.  `Theorem243.lean` now adds the exact sufficient
condition
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_pointwise_finiteNetHoeffdingUpper`.
It consumes the stochastic fixed-radius entropy hypothesis plus an eventual
pointwise inequality
`centeredTruncatedSup <= finiteNetHoeffdingUpper_eta + eta`.  This does not
assert that arbitrary VdV&W classes satisfy the inequality; it provides a clean
endpoint for structural finite-code/finite-trace/VC routes that can prove it.
The non-finite arbitrary-class blocker remains the weaker probability-level
event comparison or a genuine structural selected-cover theorem.

2026-05-05 untruncated pointwise route follow-up: the fixed-`M` pointwise
consumer now composes with the large-`M` envelope-tail handoff.  `Theorem243.lean`
adds
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_pointwise_finiteNetHoeffdingUpper`.
This gives an untruncated centered convergence endpoint from fixed-radius
stochastic entropy plus eventual pointwise finite-net control at every positive
truncation level, without introducing Rademacher/sign or tail/UI assumptions in
the statement.  The exact arbitrary-class blocker remains proving that
pointwise/event comparison or a structural selected-cover theorem from the
textbook hypotheses.

2026-05-06 threshold-code cardinality follow-up: local search found the
threshold-code image/product-cardinality chain and the full-subgraph VC
predicate, but no single raw structural cardinality lemma exposing that chain.
`ThresholdCoding.lean` now proves
`thresholdTraceCodeSet_card_add_one_real_le_uniform_vc`,
`thresholdTraceCodeSet_card_add_one_real_le_uniform_subgraph_vc_nat_poly`,
`thresholdTraceCode_image_toFinset_card_add_one_real_le_uniform_vc`,
`thresholdTraceCode_image_toFinset_card_add_one_real_le_uniform_subgraph_vc_nat_poly`,
and `thresholdTraceCode_image_toFinset_card_le_uniform_subgraph_vc_nat_poly`.
It packages
`thresholdTraceCodeSet <= product of binary trace families <= Sauer
polynomial^#thresholds`, and then transfers the same bound to the realized
`finite_thresholdTraceCode_image` in both natural-cardinality and real
`card + 1 <= C * (n + 1)^d` entropy shapes.  This is a genuine structural
input for finite-code/threshold-grid Theorem 2.4.3 routes; next work should
consume it in concrete selected-cover or grid-cardinality instantiations
instead of rebuilding the product-code estimate.  The approximate-cover layer
can now consume threshold code-set cardinality directly through
`nonempty_finiteEmpiricalL1CoverAtCard_of_thresholdTraceCode_coordinate_approx_codeSet_card_le`
and
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_coordinate_approx_codeSet_card_le`,
so later selected-cover routes no longer need to re-enter the product API
when the available structural estimate is already stated for
`thresholdTraceCodeSet.card`.  `Theorem243.lean` now lifts those deterministic
bridges into the random empirical-cover interface as
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_thresholdTraceCode_coordinate_approx_codeSet_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_thresholdTraceCode_coordinate_approx_codeSet_cardinality_bound_samplePath`.
These are the theorem-facing random-cover inputs for threshold-grid/VC routes
whose cardinality estimate is already on the finite threshold-code set.  The
route now reaches the selected fixed-radius tail/UI package through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`,
under coordinatewise threshold-approximation and fixed-threshold VC/Sauer
hypotheses.  The next non-duplicative step is to combine this selected package
with existing large-`M` untruncation, or specialize the coordinatewise
approximation hypothesis to concrete integer grids.

2026-05-06 threshold-code-set untruncated endpoint follow-up: local search
found the selected fixed-radius constructor
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and the generic untruncated selected fixed-radius consumer, but no direct
endpoint composing them.  `Theorem243.lean` now proves
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`.
This closes the large-`M` untruncation bridge for finite threshold-signature
code sets under coordinatewise threshold approximation and fixed-threshold
VC/Sauer hypotheses.  Do not add another alias for this route unless it
consumes a new structural input; the next useful theorem should specialize the
coordinatewise approximation to a concrete grid/quantizer, prove a new
VC/Sauer/structural cardinality estimate, or attack the broader selected
empirical-entropy tail/UI bridge.

2026-05-06 threshold-code-set `P`-GC/in-mean package follow-up: the same
centered untruncated threshold-code-set route is now consumed by the standard
`P`-Glivenko-Cantelli and in-mean adapters.  `Theorem243.lean` proves
`VdVWTheorem243_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc_pGlivenkoCantelli_and_inMean`.
This is the current strongest threshold-signature code-set endpoint: it
packages local `P`-GC and finite-product in-mean centered-supremum convergence
from coordinatewise threshold approximation, threshold-cardinality control,
and fixed-threshold VC/Sauer hypotheses.  The remaining productive work is
upstream structural content, not another endpoint wrapper for this same route.

2026-05-06 coordinate-code random-cover follow-up: local search found the
deterministic coordinate pointwise-code covering primitive
`empiricalL1CoveringNumber_le_of_coordinate_pointwise_approx_code_card_le`,
but no random empirical-cover lift into the Theorem 2.4.3 selected-cardinality
interface.  `Theorem243.lean` now proves
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_pointwise_approx_code_product_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_coordinate_pointwise_approx_code_product_cardinality_bound_samplePath`.
These turn coordinate finite code sets plus product-cardinality domination into
the random covering-number domination used by the pointwise-code endpoint.
This is a structural input closure; next work can specialize it to concrete
threshold grids, quantizers, or VC code-set cardinalities.

2026-05-06 coordinate-code selected-package follow-up: the new random-cover
lift is now consumed by the selected fixed-radius Theorem 2.4.3 side-condition
package.  `Theorem243.lean` proves
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_pointwise_approx_code_product_cardinality_bound_logCardinality_div_tendsto_bound`.
This closes the package-level bridge from finite coordinate code-set products
and deterministic normalized log-cardinality rates to the selected
fixed-radius tail/UI route.  The next non-duplicative work is a concrete
coordinate quantizer, threshold grid, VC/Sauer, or structural entropy estimate
that supplies those product-cardinality/log-rate hypotheses.

2026-05-06 coordinate-code untruncated endpoint follow-up: the coordinate-code
selected fixed-radius package is now consumed by the existing large-`M`
untruncation route.  `Theorem243.lean` proves
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_logCardinality_div_tendsto_bound`.
Thus finite coordinate code sets, coordinatewise `eta`-closeness of equal
vector codes, product-cardinality domination, and deterministic normalized
log-cardinality rates now imply the centered untruncated Theorem 2.4.3
convergence conclusion.  The next target should be an actual
quantizer/grid/VC cardinality estimate feeding these hypotheses, or the
broader selected empirical-entropy tail/UI theorem.

2026-05-06 coordinate-code natural-polynomial follow-up: the same coordinate
code route now consumes structural natural-polynomial product-cardinality
bounds directly, without forcing callers to construct an intermediate
normalized-log rate.  `Theorem243.lean` proves
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
and the untruncated endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_nat_poly`.
The next non-duplicative theorem should supply a real VC/Sauer, threshold-grid,
or quantizer product-cardinality estimate in this natural-polynomial shape.

2026-05-06 finite pointwise-code natural-polynomial follow-up: local search
found the finite pointwise-code selected fixed-radius route only in the
deterministic normalized-log-rate form, while the generic
`of_logCardinality_nat_poly_bound` and finite-code/trace cardinality APIs
already support VC/Sauer-style polynomial estimates.  `Theorem243.lean` now
adds
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_code_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_code_cardinality_bound_nat_poly`.
This lets finite approximate-code arguments feed polynomial cardinality
estimates directly into the selected fixed-radius Theorem 2.4.3 machinery.
The same batch adds the concrete finite-code-set versions
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_codeSet_cardinality_bound_nat_poly`,
which derive finite image and domination fields from membership in a supplied
`Finset` code set.  The next useful theorem should instantiate these
hypotheses from a concrete finite-code image, VC/Sauer, threshold-grid, or
quantizer construction rather than adding another endpoint alias.

2026-05-06 finite trace-code-set natural-polynomial follow-up: local search
found `TraceCoding.lean` already proves finite trace-code image finiteness,
cardinality domination, and transfer of polynomial code-set cardinality
bounds, but `Theorem243.lean` did not yet expose this as a selected
fixed-radius Theorem 2.4.3 input.  It now proves
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_trace_codeSet_cardinality_bound_nat_poly`.
These wrappers consume a finite trace-code set, injectivity on the realized
trace image, and a natural-polynomial code-set cardinality estimate.  The next
non-duplicative theorem should prove such a trace-code estimate from an actual
VC/Sauer, threshold-code, or quantizer construction.

2026-05-06 varying-domain lower-shifted continuous-map follow-up: local search
found common-domain lower-shifted continuous-map closure and varying-domain
signed continuous-map closure, but no matching varying-domain lower-shifted
bridge.  `WeakConvergence.lean` now proves
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.comp_continuous`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.comp_continuous_of_lowerShifted`.
This closes a self-contained Chapter 1 foundation gap for sample-size-varying
statistics while leaving the deeper signed extended-real arbitrary-map
cover-existence and process tightness/converse blockers open.

2026-05-06 coordinate-threshold endpoint follow-up: local search found the
exact coordinate-threshold selected fixed-radius package
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_thresholds_separate_uniform_vc`
and the standard centered-convergence-to-`P`-GC/in-mean adapters, but no direct
endpoint consuming that stronger exact-separation input.  `Theorem243.lean`
now proves
`VdVWTheorem243_coordinate_thresholds_separate_uniform_vc_pGlivenkoCantelli_and_inMean`.
This consumes exact threshold-predicate separation, threshold-cardinality
control, and fixed-threshold VC/Sauer hypotheses through the already compiled
selected fixed-radius/untruncation route.  Do not add another endpoint alias
for this same coordinate-threshold route unless final exact theorem assembly
requires it; the productive next target is upstream structural input
(grid/quantizer/VC cardinality or selected empirical-cover tail/UI from the
book entropy hypothesis) or a theorem-critical Chapter 1 arbitrary-map
primitive.

2026-05-06 selected fixed-radius nat-poly tail/UI bridge: local search found
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.firstSample_nnnorm_bound_of_logCardinality_nat_poly_bound`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_nnnorm_bound`,
but no direct constructor composing natural-polynomial structural cardinality
growth into the selected fixed-radius tail/UI package.  `Theorem243.lean` now
proves
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_nat_poly_bound`.
This is an upstream side-condition bridge for VC/Sauer, finite-trace, and
quantizer/grid routes: once a route proves
`cardinality + 1 <= C(M,eta) * (n+1)^d`, the selected finite-net tail/UI
package can be built without manually restating first-sample `nnnorm`
boundedness.  The next useful work is to supply concrete structural
cardinality estimates or prove the genuinely random selected empirical-cover
tail/UI theorem; do not spend another run on endpoint aliases for already
closed routes.

2026-05-06 variable-domain nat-poly entropy constructor follow-up: local search
found the deterministic-rate constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_div_tendsto_bound`
and the selected fixed-radius natural-polynomial tail/UI bridge above, but no
direct constructor producing the variable-domain book entropy condition itself
from natural-polynomial cardinality growth.  `Theorem243.lean` now proves
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_nat_poly_bound`.
This is the upstream VC/Sauer/finite-trace/grid constructor: a pointwise bound
`cardinality + 1 <= C(M,eta) * (n+1)^d` now directly yields the book-style
varying-domain entropy condition, and the existing selected tail/UI bridge can
then consume the same structural bound.  The next non-duplicative proof must
instantiate this polynomial cardinality hypothesis from a real VC/Sauer,
finite-trace, threshold-grid, or quantizer theorem, or prove the genuinely
random selected empirical-cover tail/UI theorem.

The same closure batch also adds the direct finite-trace structural
constructors
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_image_cardinality_bound_nat_poly`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_codeSet_cardinality_bound_nat_poly`.
These consume finite empirical trace images or injective finite trace-code
sets, respectively, plus a natural-polynomial cardinality estimate, and output
the variable-domain book entropy condition.  Thus finite-trace and trace-code
VC/Sauer routes can now feed both sides of the Theorem 2.4.3 machinery: the
book entropy condition and the selected fixed-radius tail/UI package.  The next
proof should specialize the trace/code cardinality estimate from a concrete
VC/Sauer, threshold-grid, or quantizer theorem rather than adding more
generic nat-poly constructors.

2026-05-06 threshold VC/Sauer entropy-side follow-up: local search found
selected fixed-radius threshold-code and coordinate-threshold VC/Sauer
packages, but no matching constructors for the variable-domain book entropy
condition.  `Theorem243.lean` now proves
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_coordinate_thresholds_separate_uniform_vc`.
These consume the concrete `thresholdTraceCodeSet` VC/Sauer cardinality bound
and the exact coordinate-threshold trace-cardinality theorem, respectively,
and output the book-facing entropy condition.  The threshold/grid/VC route
therefore now feeds both entropy and selected finite-net tail/UI sides; the
next useful theorem should remove or discharge the remaining structural
assumptions, such as coordinatewise threshold approximation, exact separation,
finite grid construction, or uniform subgraph VC input.

2026-05-06 canonical integer-grid/full-subgraph entropy follow-up: local search
found selected fixed-radius and final endpoint consumers for the canonical
integer-grid/full-subgraph VC route, but no variable-domain book-entropy
constructor for the same strongest structural assumptions.  `Theorem243.lean`
now proves
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`.
It uses the truncated-envelope bound, canonical grid radius
`vdVWIntegerGridRadius M eta`, and
`VdVWUniformSubgraphVCBound.toUniformThresholdVCSubgraphBound` to produce the
book entropy condition with the explicit Sauer-polynomial grid cardinality.
This removes the per-threshold VC side condition for the entropy layer.  The
remaining productive work is to connect the book's named subgraph/VC class
hypothesis and measurability/envelope hypotheses to this constructor and the
already compiled selected tail/UI/final endpoints.

2026-05-06 full-subgraph side-condition package follow-up:
`Theorem243.lean` now exposes the canonical full-subgraph route through the
same proof-carrying side-condition record used by the convergence endpoint.
New declarations are
`VdVWTheorem243FullSubgraphSideConditions.variableTruncatedEntropyCondition`,
`VdVWTheorem243FullSubgraphSideConditions.selectedFixedRadiusTailSideConditions`,
and
`VdVWTheorem243FullSubgraphSideConditions.entropy_and_selectedFixedRadiusTailSideConditions`.
Together they show that `VdVWTheorem243FullSubgraphSideConditions` supplies
both the book-style variable-domain entropy condition and the selected
fixed-radius tail/UI package for the canonical integer-grid/full-subgraph VC
route.  This closes the packaging gap between the named full-subgraph
side-condition record and the entropy/selected-tail machinery.  The next
non-duplicative proof target is not another full-subgraph endpoint alias:
either prove the genuine random empirical-entropy-to-selected-tail/event
comparison for the exact non-finite textbook theorem, discharge a concrete
structural cardinality/quantizer hypothesis not already covered by the
threshold/grid/full-subgraph packages, or move to the theorem-critical
Lemma 2.4.5 reverse/cofiltration or Chapter 1 arbitrary-map/process blockers.

2026-05-06 canonical full-subgraph entropy/selected-tail follow-up:
`Theorem243.lean` now specializes the full-subgraph entropy and selected
fixed-radius tail/UI bridge to the canonical terminal sample process
`vdVWCanonicalSampleProcess`, discharging the `samplePath ... = sample`
plumbing used by the iid product-space route.  New declarations are
`VdVWTheorem243_fullSubgraph_canonical_variableTruncatedEntropyCondition`,
`VdVWTheorem243_fullSubgraph_canonical_selectedFixedRadiusTailSideConditions`,
and
`VdVWTheorem243_fullSubgraph_canonical_entropy_and_selectedFixedRadiusTailSideConditions`.
This is not a new endpoint alias: it turns the strongest structural
full-subgraph assumptions into the two theorem-facing side-condition packages
on the exact canonical sample process used by the final `P`-GC/Lemma 2.4.5
packages.  The remaining exact non-finite-class gap is still the general
random empirical-entropy event/tail bridge, or a genuinely new structural
cardinality/quantizer theorem beyond the already covered threshold/grid/
full-subgraph routes.

2026-05-06 Chapter 1 shifted varying-domain congruence follow-up:
`WeakConvergence.lean` now adds congruence/replacement stability for the
varying-domain lower-shifted and canonical shifted bounded-continuous
asymptotic-measurability predicates:
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.congr_eventually`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.congr_eventually`.
This closes a small Chapter 1 arbitrary-map support gap for sample-size-varying
statistics and reindexing.  The lower-shifted bridge intentionally requires
pointwise equality of maps because its lower-bound hypothesis is global in the
index; the canonical shifted bridge permits eventually equal maps.  This does
not close the deeper signed extended-real cover-existence or process/FDD
converse blockers.

2026-05-06 Chapter 1 common-domain asymptotic-measurability congruence
follow-up: local search found the varying-domain shifted congruence bridges
but no matching common-domain replacement lemmas for the nonnegative,
lower-shifted real, lower-shifted bounded-continuous, and canonical
bounded-continuous asymptotic-measurability predicates.  `WeakConvergence.lean`
now proves
`VdVWAsymptoticallyMeasurableNonnegative.congr_eventually`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal.congr_eventually`,
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.congr_eventually`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.congr_eventually`.
This closes the common-domain counterpart of the previous varying-domain
replacement layer.  The nonnegative and canonical shifted bridges permit
eventually equal maps; the lower-shifted real and bounded-continuous bridges
keep pointwise map equality because their lower-bound side conditions are
global in the index.  The remaining Chapter 1 blockers are still the full signed
extended-real arbitrary-map cover-existence layer and the process/FDD
converse, separability, and asymptotic-tightness primitives.

2026-05-06 measure-level weak-convergence stability follow-up:
local search found `VdVWWeakConvergenceProbabilityMeasures.mono_filter` and
the analogous asymptotic-tightness replacement/reindexing lemmas, but no
matching replacement or reindexing theorem for the measure-level weak-
convergence wrapper itself.  `WeakConvergence.lean` now proves
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually` and
`VdVWWeakConvergenceProbabilityMeasures.comp_tendsto`.  These are ordinary
`Tendsto` stability facts, but they remove a small Chapter 1 product/FDD and
subsequence/reindexing support gap without changing the remaining exact
arbitrary-map/nonmeasurable process blockers.

2026-05-06 signed arbitrary-map reindexing follow-up:
local search found `mono_filter` and `congr_eventually` for the signed
outer/asymptotic-measurability arbitrary-map packages, but no corresponding
`comp_tendsto` reindexing lemmas.  `WeakConvergence.lean` now proves
`VdVWWeakConvergenceSignedOuterBoundedContinuous.comp_tendsto`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.comp_tendsto`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.comp_tendsto`, and the
varying-domain analogues
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.comp_tendsto`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.comp_tendsto`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.comp_tendsto`.
These close the basic subsequence/net reindexing layer for the current signed
bounded-continuous arbitrary-map weak-convergence foundations.  They do not
prove the still-missing signed extended-real measurable-cover existence,
arbitrary-map asymptotic tightness, or arbitrary-index FDD converse.

2026-05-06 generic original-cover truncation entropy bridge:
local search found the compiled truncation covering-number monotonicity
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.truncated_of_original`, but
no generic constructor consuming original-class random empirical-cover
domination in the variable truncated entropy side-condition record.
`Theorem243.lean` now proves
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_original_coveringNumber_le`.
It keeps the same normalized-log cardinality process and transports only the
covering-number domination field from `classFun` to
`vdVWTruncatedClassFun classFun envelope M`.  This removes a structural
plumbing mismatch for routes that naturally estimate empirical covers of the
original class before truncation.  It is not a final endpoint; the next
theorem-facing work should use it to instantiate a structural
entropy/cardinality route, or return to the genuine book random-entropy
tail/UI/event bridge.

2026-05-06 follow-up: the same original-cover truncation bridge now has the
natural-polynomial constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_original_coveringNumber_le_nat_poly_bound`.
It composes original-class random empirical-cover domination with a pointwise
bound `cardinality + 1 <= C(M,eta) * (n+1)^d`, producing the truncated
variable-domain book entropy condition directly.  This is the intended
structural input shape for original-class VC/Sauer, trace, grid, or quantizer
arguments; remaining work is to instantiate those hypotheses or prove the true
random-entropy tail/UI/event bridge, not another endpoint wrapper.

2026-05-06 quantizer random-cover lift: local search found deterministic
nearest-integer quantizer empirical-cover bounds in `CoveringPrimitive.lean`,
including
`empiricalL1CoveringNumber_le_of_roundingQuantizer_uniform_abs_bound_card_le`,
but no theorem-facing random empirical-cover domination wrapper in
`Theorem243.lean`.  New compiled declarations are
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_roundingQuantizer_uniform_abs_bound_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_roundingQuantizer_uniform_abs_bound_cardinality_bound_samplePath`.
They turn a uniform samplewise absolute bound, the integer grid inclusion
condition `M / eta + 1/2 <= bound`, and domination of `(2 * bound + 1)^n` by a
selected cardinality process into the random empirical-cover domination used
by the Theorem 2.4.3 entropy packages.  Remaining work is to compose these
with selected fixed-radius/variable entropy constructors or prove sharper
grid/cardinality estimates; this is structural input, not an endpoint alias.

2026-05-06 nonnegative/canonical asymptotic-measurability reindexing
follow-up: after the signed arbitrary-map reindexing batch, local search still
found `mono_filter` and `congr_eventually` but no `comp_tendsto` for the
nonnegative and canonical shifted asymptotic-measurability predicates.
`WeakConvergence.lean` now proves
`VdVWAsymptoticallyMeasurableNonnegative.comp_tendsto`,
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.comp_tendsto`,
and the varying-domain canonical shifted analogue
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.comp_tendsto`.
No generic lower-shifted reindexing theorem was added: its definition carries
an all-index lower-bound side condition, and a lower bound on the reindexed
subfamily alone does not imply the original all-index lower bound.  Such a
lemma should only be introduced later with an explicit lifted lower-bound
hypothesis if a theorem needs it.

2026-05-06 structural truncation-cover and Chapter 1 FDD/map-law follow-up:
local search found no existing theorem stating that the VdV&W truncation
`f ↦ f 1{F <= M}` preserves empirical `L1(P_n)` covering numbers.  The proof is
samplewise: at each observed point both indexed functions are either left
unchanged or both zeroed, so the absolute difference cannot increase.
`Theorem243.lean` now proves
`empiricalL1Distance_vdVWTruncatedClassFun_le`,
`FiniteEmpiricalL1CoverAtCard.truncate_vdVWTruncatedClassFun`,
`empiricalL1CoveringNumber_vdVWTruncatedClassFun_le`, and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.truncated_of_original`.
This is a theorem-facing structural input for entropy/cover routes; next work
should consume it in a genuine random-entropy, selected-cover, or concrete
class-geometry argument rather than adding another already-closed endpoint
alias.

The same run closes two Chapter 1 support gaps after search.  First,
`WeakConvergence.lean` now has the direct a.e.-measurable map-law bridge
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq_aemeasurable`
and proof-carrying companion
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_map_eq_aemeasurable`;
the automatic a.e.-measurable map wrapper now uses this direct bridge and no
longer requires `MeasurableSpace.CountablyGenerated S`.  Second, finite-
dimensional restrictions can now be combined directly with subsequence/filter
reindexing through
`VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict_comp_tendsto`
and
`VdVWProbabilityMeasuresAsymptoticallyTight.finiteDimensionalRestrict_comp_tendsto`.
These are measure-level FDD support wrappers only; the exact arbitrary-index
FDD converse, process asymptotic-tightness/asymptotic-independence, and full
nonmeasurable signed extended-real cover primitives remain open.

2026-05-06 process asymptotic-tightness interface follow-up: local search found
measure-level `VdVWProbabilityMeasuresAsymptoticallyTight.map_continuous` and
finite-dimensional restriction wrappers, but no raw bounded-process law
interface that packages `ell_infty(T)` process laws and projects them back to
ordinary finite-dimensional coordinate laws.  `FiniteDimensional.lean` now
adds `vdVWEllInftyProcessLaw`, `vdVWFDDProcessLaw`,
`aemeasurable_fdd_of_aemeasurable_ellInftyProcessMap`,
`vdVWEllInftyProcessLaw_map_finiteRestrict`,
`VdVWEllInftyProcessAsymptoticallyTight`, and
`VdVWEllInftyProcessAsymptoticallyTight.finiteDimensionalLaw`.  This closes an
honest Chapter 1 process-tightness interface layer: tightness of bounded
`ell_infty(T)` process laws now feeds tightness of every finite-dimensional
law.  It still does not prove the arbitrary-index VdV&W 1.4.8 converse,
separability/asymptotic-measurability, or nonmeasurable signed outer-cover
weak-convergence primitives.

2026-05-06 process weak-convergence interface follow-up: local search found
the existing measure-level forward FDD wrappers
`vdVW148_ellInfty_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`
and `VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict`, but no
raw bounded-process law interface matching the process-tightness package.
`FiniteDimensional.lean` now adds `VdVWEllInftyProcessWeakConvergence` and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw`.  These package weak
convergence of bounded `ell_infty(T)` process laws and prove the forward FDD
law consequence through `vdVWEllInftyProcessLaw_map_finiteRestrict`.  This is
still the forward direction only: the arbitrary-index VdV&W 1.4.8 converse and
the separability/asymptotic-measurability/nonmeasurable-cover primitives
remain open.

2026-05-06 process Prokhorov/tightness consequence: local search found the
measure-level
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_atTop`, but no
raw-process theorem consuming `VdVWEllInftyProcessWeakConvergence`.
`FiniteDimensional.lean` now proves
`VdVWEllInftyProcessWeakConvergence.asymptoticallyTight_atTop` and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_asymptoticallyTight_atTop`.
Thus sequential weak convergence of bounded `ell_infty(T)` process laws gives
process-law asymptotic tightness and finite-dimensional law tightness.  This
closes another forward Chapter 1 process consequence while leaving the
arbitrary-index converse and separability/asymptotic-measurability blockers
open.

2026-05-06 process filter/reindexing stability follow-up: local search found
the measure-level stability APIs
`VdVWWeakConvergenceProbabilityMeasures.mono_filter`,
`VdVWWeakConvergenceProbabilityMeasures.comp_tendsto`,
`VdVWProbabilityMeasuresAsymptoticallyTight.mono_filter`, and
`VdVWProbabilityMeasuresAsymptoticallyTight.comp_tendsto`, but no raw
bounded-process versions consuming `VdVWEllInftyProcessWeakConvergence` or
`VdVWEllInftyProcessAsymptoticallyTight`.  `FiniteDimensional.lean` now proves
`VdVWEllInftyProcessWeakConvergence.mono_filter`,
`VdVWEllInftyProcessWeakConvergence.comp_tendsto`,
`VdVWEllInftyProcessAsymptoticallyTight.mono_filter`, and
`VdVWEllInftyProcessAsymptoticallyTight.comp_tendsto`.  These are
subsequence/subnet support lemmas for the current process-law interface.  They
do not change the main blockers: arbitrary-index VdV&W 1.4.8 converse,
process separability/asymptotic-measurability, nonmeasurable signed
outer-cover weak convergence, and real Theorem 2.4.3 entropy/cardinality
inputs remain the high-value next targets.

2026-05-06 process a.e.-congruence follow-up: local search found mathlib
`Measure.map_congr`, local `processLaw_eq_of_forall_ae_eq`, and the
measure-level `congr_eventually` APIs, but no raw bounded-process law
congruence theorem for the `VdVWEllInftyProcessWeakConvergence`/
`VdVWEllInftyProcessAsymptoticallyTight` interfaces.  `FiniteDimensional.lean`
now proves `vdVWEllInftyProcessLaw_congr_ae`,
`VdVWEllInftyProcessWeakConvergence.congr_eventually_ae`, and
`VdVWEllInftyProcessAsymptoticallyTight.congr_eventually_ae`.  These let later
Chapter 1 process arguments replace source processes by a.e.-equal measurable
or canonical versions without changing process weak convergence or process
asymptotic tightness.  They are support for separability/measurability routes,
not the arbitrary-index FDD converse itself.

2026-05-06 bounded separability-to-`P`-measurability follow-up: local search
found the existing pointwise-approximable route
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_bddAbove`
and the boundedness primitive
`bddAbove_vdVWWeightedClassValueSet_of_uniform_bound`, but no theorem
combining them.  `PMeasurable.lean` now proves
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_uniform_bound`.
This discharges Definition 2.3.3 for a class pointwise approximable by a
countable measurable subclass under a global absolute bound on that subclass.
It is a genuine bounded separability/measurability handoff for Chapter 2
applications and avoids making another Theorem 2.4.3 endpoint alias.

2026-05-06 centered bounded separability follow-up: local search found pinned
mathlib dominated convergence as
`MeasureTheory.tendsto_integral_of_dominated_convergence`, local pointwise
approximability via `VdVWPointwiseApproximableByCountableSubclass`, and the
bounded separability handoff above, but no centered pointwise-approximability
or centered bounded-separability theorem.  `PMeasurable.lean` now proves
`VdVWPointwiseApproximableByCountableSubclass.tendsto_integral_of_uniform_bound`,
`VdVWPointwiseApproximableByCountableSubclass.centered_of_uniform_bound`, and
`VdVWPMeasurableClass.centered_of_pointwiseApproximableByCountableSubclass_of_uniform_bound`.
This closes the planned centered Definition 2.3.3 separability lane under a
finite measure and a uniform absolute bound on the original index class.  The
next `/goal` target should therefore move to a non-duplicative upstream
Theorem 2.4.3 entropy/cardinality or selected tail/UI/ordinary-mean theorem,
or to an exact Chapter 1 process primitive such as arbitrary-index FDD
converse, separability/tightness/asymptotic-measurability, nonmeasurable
signed outer-cover weak convergence, or full arbitrary-map extended-real
measurable-cover existence.

2026-05-06 centered separability endpoint consumers: local search found the
generic Theorem 2.4.3 `P`-measurable weak-convergence and signed
varying-domain endpoints, plus countable-coordinate consumers, but no bounded
pointwise-separable consumer using the centered `P`-measurability theorem.
`Theorem243.lean` now proves
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`.
These consume the centered separability lane in the Theorem 2.4.3 law-level
endpoints while keeping the actual convergence hypothesis explicit.  The next
non-duplicative target remains upstream: prove a real entropy/cardinality
input, a selected tail/UI/ordinary-mean bridge, or an exact Chapter 1 process
primitive.

2026-05-06 lower-shifted reindexing with lifted lower bounds: search found the
previous common/varying-domain `mono_filter` and `congr_eventually` lower-
shifted asymptotic-measurability wrappers, and the canonical shifted
`comp_tendsto` wrappers, but no lower-shifted `comp_tendsto` theorem that
accounts for the all-index lower-bound side condition.  `WeakConvergence.lean`
now proves
`VdVWAsymptoticallyMeasurableLowerShiftedReal.comp_tendsto_of_lower_bound`,
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.comp_tendsto_of_lower_bound`,
and
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.comp_tendsto_of_lower_bound`.
Each theorem requires an explicit hypothesis lifting lower bounds from the
reindexed subfamily back to all original indices/domains.  This closes the
honest reindexing support case without making the false claim that a
subsequence lower bound implies a global lower bound.  The remaining Chapter 1
arbitrary-map blockers are still signed extended-real cover existence,
arbitrary-map asymptotic tightness, process separability, and arbitrary-index
FDD converse; the remaining Theorem 2.4.3 upstream blocker is still a genuine
entropy/cardinality or selected tail/UI/ordinary-mean theorem rather than
another endpoint alias.

2026-05-06 process source/limit congruence follow-up: search found separate
raw bounded-process weak-convergence replacement lemmas
`VdVWEllInftyProcessWeakConvergence.congr_eventually_ae` and
`VdVWEllInftyProcessWeakConvergence.congr_limit_ae`, plus their coordinatewise
forms, but no single theorem combining eventual source canonicalization with
limiting-process canonicalization.  `FiniteDimensional.lean` now proves
`VdVWEllInftyProcessWeakConvergence.congr_eventually_limit_ae` and
`VdVWEllInftyProcessWeakConvergence.congr_eventually_limit_forall_coord_ae`.
These are Chapter 1 process/FDD support lemmas for separability and canonical
version arguments: later proofs can replace both the source family and the
limit process by a.e.-equal bounded `ell_infty(T)` representatives in one
step.  They do not prove the arbitrary-index VdV&W 1.4.8 FDD converse; that
still needs the separability/asymptotic-measurability/tightness and
nonmeasurable outer-cover ingredients.

2026-05-06 empirical-cover/internal-covering-number reverse bridge: search
found the existing internal-to-local comparison
`empiricalL1CoveringNumber_le_empiricalL1Index_coveringNumber`, but no reverse
handoff from proof-carrying VdV&W finite empirical covers back to mathlib's
internal `Metric.coveringNumber` on the induced empirical pseudometric.
`CoveringPrimitive.lean` now proves
`empiricalL1Index_coveringNumber_le_of_finiteEmpiricalL1CoverAtCard` and
`empiricalL1Index_coveringNumber_le_empiricalL1CoveringNumber`, and the two
directions are packaged as
`empiricalL1CoveringNumber_eq_empiricalL1Index_coveringNumber` under a finite
local-cover witness.  This closes a comparability gap needed by future entropy
arguments that move between local finite empirical nets and mathlib
covering-number displays.  It still does not prove the selected entropy
tail/UI or ordinary-mean bridge from the textbook random entropy hypothesis.

2026-05-06 varying-domain a.e.-measurable map-law bridge: search found the
existing measurable and null-measurable varying-domain weak-convergence map-law
bridges, but the automatic a.e.-measurable bridge unnecessarily passed through
`NullMeasurable` and required `[MeasurableSpace.CountablyGenerated S]`.
`WeakConvergence.lean` now proves
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_map_eq_aemeasurable`
directly from `AEMeasurable`, `integral_map`, and the signed outer-expectation
integral bridge, and the automatic a.e.-measurable pushforward wrapper now uses
that theorem without a countably-generated target-space assumption.  This is a
real Chapter 1 varying-domain arbitrary-map support improvement; the remaining
Chapter 1 blockers are still the full signed extended-real arbitrary-map
measurable-cover existence layer, nonmeasurable outer-cover weak convergence,
process separability/asymptotic tightness, and arbitrary-index FDD converse.

2026-05-06 HasLaw a.e.-measurable map-law cleanup: after the direct
a.e.-measurable map-law bridges above, local search showed that the common-
domain and varying-domain `HasLaw` weak-convergence consumers were still
routing through null-measurable variants.  `WeakConvergence.lean` now updates
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_hasLaw_aemeasurable`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_hasLaw_aemeasurable`,
and
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_hasLaw_aemeasurable`
to use the direct a.e.-measurable bridges and removes the unnecessary
`[MeasurableSpace.CountablyGenerated S]` assumption from these theorem
statements.  This is Chapter 1 arbitrary-map support cleanup, not an exact
Theorem 2.4.3 completion.

2026-05-06 Theorem 2.4.3 fixed-radius comparison constructor: search over
local `Theorem243.lean`, `OuterProbabilityExpectation.lean`, and
`ProbabilityMeasure` support found integrated/outer-expectation
symmetrization outputs such as
`VdVWTheorem243SymmetrizationPrecursor.randomSign_outerExpectation_le_finiteNetHoeffdingUpper_add`,
but no existing theorem proving the required generic probability-event
comparison from ghost/Rademacher arguments.  `Theorem243.lean` now proves
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.of_eventual_pointwise_bound`,
which turns an eventual pointwise finite-net domination into the exact
proof-carrying `VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison`
structure, and refactors the older pointwise fixed-`M` consumer through that
structure instead of duplicating the outer-probability monotonicity proof.
This is theorem-facing source plumbing, not a final 2.4.3 proof: the remaining
option-1 blocker is still to prove the weaker generic comparison from the
textbook ghost/Rademacher/nonmeasurable selected-cover argument, or to produce
a genuine structural selected-cover theorem that supplies the pointwise
constructor without over-strong assumptions.

2026-05-06 Theorem 2.4.3 a.e. comparison constructor: search found mathlib
`measure_mono_ae` / `Filter.EventuallyLE.measure_le`, so the next weakening did
not need a primitive.  `Theorem243.lean` now proves
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.of_eventual_ae_bound`.
It upgrades eventual `vdVWProductMeasure P n`-a.e. finite-net domination of the
centered truncated supremum by the selected Hoeffding upper plus radius into
the same fixed-radius outer-probability comparison structure.  This is closer
to the expected ghost/Fubini/selected-cover proof shape than the all-sample
pointwise constructor.  The remaining blocker is now sharper: prove that
eventual a.e. domination, or directly prove the comparison structure, from the
VdV&W symmetrization and random empirical-cover argument.
