# VdV&W Chapter 1-2 Progress Dashboard

This dashboard is a quick visual view of the current formalization state for
van der Vaart and Wellner Chapters 1 and 2.  The authoritative detailed
inventory is `docs/vdvw_chapter1_2_formalization_blueprint.md`; this file is a
human-facing monitor for what is proved, what is in progress, and what remains.

Status snapshot date: 2026-05-10.

Active blocker/primitives register:

```text
docs/vdvw_current_blocker_primitive_plan.md
```

Authoritative current `/goal` override, refreshed 2026-05-08: the active goal
object is the whole VdV&W empirical-process textbook formalization, with
Chapters 1-2 and Theorem 2.4.3 as the current frontier.  The current clean
VdVW proof lane is `/private/tmp/ep-vdvw-goal-fresh` on branch
`codex/vdvw-selected-cover-source` based at current `origin/main`; the
Desktop `main` worktree is intentionally avoided for VdVW commits because it
is not the verified VdVW proof lane and currently has stale/corrupt Git
metadata.  The
registered
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive` now feeds untruncated
centered convergence directly through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.centered_untruncated_convergesInOuterProbabilityConst_zero`.
Concrete deterministic entropy bounds can also build the primitive through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_bound`.
More generally, any compiled selected fixed-radius tail/UI package now feeds the
primitive through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_selectedFixedRadiusTailSideConditions`.
The canonical full-subgraph VC/Sauer route now exposes that source handoff
directly through
`VdVWTheorem243_fullSubgraph_canonical_selectedEntropyFiniteNetMeanPrimitive`.
The original-class full-subgraph VC route also feeds the same primitive via
`VdVWTheorem243_originalFullSubgraph_canonical_selectedEntropyFiniteNetMeanPrimitive`,
using the integer-grid fixed-mask transfer for truncated entropy.
The fixed-degree original VC-subgraph specialization is now exposed as
`VdVWTheorem243_originalFullSubgraph_canonical_selectedEntropyFiniteNetMeanPrimitive_of_uniformSubgraphVC`,
and the strongest textbook-aligned original full-subgraph package also has the
fixed-degree entry point
`VdVWTheorem243_originalFullSubgraph_integrable_textbookAligned_no_nonempty_of_uniformSubgraphVC`.
The selected-log mean route now has the localized countability constructor
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_integral_tendsto_zero_of_set_countable`,
and the displayed-beta selected-cover route now has
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_common_iidRademacher_hphi_id`.
Under localized class countability, the displayed-beta route now also has
the canonical fixed-sample sign-side cover
`VdVWMeasurableCover.truncated_rademacher_sign_of_countable`, the direct
selected-cover constructor
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_countable_hphi_id`,
and the common-iid wrapper
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_common_iidRademacher_hphi_id_of_set_countable`,
with
`VdVWTheorem243_signSideRademacherMeasurableCover_of_set_countable`
delegating to the canonical cover, so the sign-side measurable-cover input is
no longer a blocker in that lane.
The permutation-symmetric Chapter 1 substrate now also has the function-level
invariance lemmas
`vdVWPermutationSymmetricMeasurableSpace_comp_permuteNatSequence_eq`,
`vdVWPermutationSymmetricMeasurableSpace_apply_permuteNatSequence_eq`, and
`vdVWPermutationSymmetricMeasurableSpace_apply_permuteFirstN_eq`, plus the
finite/infinite permutation bridge
`vdVWPermuteFirstN_eq_permuteNatSequence_natPermOfFin`.  These make
`Σ_n`-measurable competitors constant on first-`n` permutation orbits, which
is the missing minimality ingredient for a supplied selected-cover
symmetrization theorem.
The finite-orbit symmetrization layer itself is now compiled in the
Lean-safe infimum direction through
`vdVWFinitePermutationOrbitInfReal`,
`measurable_vdVWPermutationSymmetricMeasurableSpace_finitePermutationOrbitInfReal`,
`le_vdVWFinitePermutationOrbitInfReal_of_majorizes_symmetric`,
`vdVWFinitePermutationOrbitInfReal_minimal_ae`, and
`VdVWMeasurableCover.finPermutationInf`.
Finite empirical `L1(P_n)` cover data are now stable under sample-coordinate
permutations through `empiricalL1Distance_finCoordinatePerm`,
`FiniteEmpiricalL1CoverAtCard.finCoordinatePerm`,
`nonempty_finiteEmpiricalL1CoverAtCard_finCoordinatePerm_iff`,
`finiteEmpiricalL1CoveringNumberCard_finCoordinatePerm`, and
`empiricalL1CoveringNumber_finCoordinatePerm`.
The same sample-coordinate permutation transport now reaches the Rademacher
and finite-center side of the selected-cover source argument through
`vdVWWeightedClassSupremum_finCoordinatePerm`,
`VdVWRademacherSignVector_finCoordinatePerm`,
`vdVWRademacherWeights_finCoordinatePerm`,
`vdVWWeightedClassSupremum_rademacherWeights_finCoordinatePerm`,
`vdVWFiniteCenterWeightedSupremum_finCoordinatePerm`, and
`VdVWTheorem243RademacherFiniteCenterHoeffdingBound_finCoordinatePerm`;
the deterministic selected-cover finite-net Hoeffding handoff itself now
commutes with the same simultaneous sample/sign permutation through
`vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSignVector_finCoordinatePerm`.
The selected-cover expected-maximal source side can now use canonical
finite-product Rademacher coordinates directly through
`ae_vdVWProductMeasure_vdVWRademacherSignVector`,
`iIndepFun_vdVWProductMeasure_vdVWRademacher`,
`hasSubgaussianMGF_vdVWProductMeasure_eval_vdVWRademacher`, and
`VdVWTheorem243_eventualAe_expectedMaximal_selectedHalfRadius_of_finiteEmpiricalCover_canonicalRademacher`.
The canonical finite-product sign space now also feeds the displayed-beta
event constructor through
`VdVWTheorem243SymmetrizationPrecursor.of_finiteEmpiricalCover_canonicalRademacher`,
`VdVWTheorem243_eventualAe_centered_le_two_finiteNetHoeffdingUpper_add_halfRadius_of_symmetrizationPrecursor_hphi_id_canonicalRademacher`,
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_canonicalRademacher_countable_hphi_id`;
the remaining obligations are the canonical maximal event and canonical
`Phi(x)=x` comparison, not auxiliary sign-space bookkeeping.
The displayed-beta comparison now also has a product-fiber source constructor:
`measure_mul_le_prod_measure_of_fiber_lower_bound`,
`VdVWOuterProbability_mul_left_le_of_product_fiber_lower_bound`, and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_product_fiber_lower_bound`
turn a measurable joint ghost/Rademacher event with beta-large fibers and
projection into the selected finite-net bad event into the exact displayed
outer-probability comparison.  The canonical finite-product Rademacher version
is now packaged as
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_canonicalRademacher_selectedFiniteNet_product_event`,
and the textbook-shaped ghost/sign fiber version is now packaged as
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_canonicalGhostRademacher_selectedFiniteNet_product_event`.
The arbitrary-event interface is now fixed to the named concrete event
`VdVWTheorem243CanonicalGhostRademacherSelectedNetEvent` by
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_canonicalGhostRademacher_selectedNetEvent`.
The shared deterministic pointwise core is
`VdVWTheorem243_selectedFiniteNetHoeffding_bad_of_rademacher_bad`.
The ghost-copy triangle step from the textbook proof is now compiled through
`abs_sub_gt_half_of_lt_abs_of_abs_lt_half`,
`vdVWWeightedSampleSum_pairSub_abs_gt_half_of_original_bad_of_ghost_good`, and
`vdVWWeightedClassSupremum_pairSub_gt_half_of_original_bad_of_ghost_good`.
The centered-bad witness extraction and uniform ghost-good composition are now
compiled as
`exists_abs_vdVWWeightedSampleSum_gt_of_nonneg_lt_vdVWWeightedClassSupremum`
and
`vdVWWeightedClassSupremum_pairSub_gt_half_of_sup_bad_of_forall_ghost_good`.
The sharper selected-witness version
`exists_index_for_sup_bad_pairSub_gt_half_of_ghost_good` is also compiled; it
requires ghost-goodness only for the class member extracted from the centered
bad supremum, matching the Chebyshev beta-fiber argument.
The selected-witness Chebyshev fiber is now packaged as
`VdVWTheorem243SelectedWitnessGhostGoodEvent`, with the displayed lower bound
compiled in
`VdVWChebyshev_betaLower_selectedWitnessGhostGoodEvent_centeredTruncated_uniformWeights_succ`
and its distance-form wrapper
`VdVWChebyshev_betaLower_selectedWitnessGhostGoodEvent_centeredTruncated_uniformWeights_succ_of_dist_bad`.
The selected-witness fiber is now transported to the centered pair-difference
bad event by
`vdVWWeightedClassSupremum_pairSub_gt_half_of_selectedWitnessGhostGoodEvent`
and
`VdVWChebyshev_betaLower_centeredPairSubBadEvent_of_selectedWitnessGhostGoodEvent_centeredTruncated_uniformWeights_succ_of_dist_bad`;
the latter discharges the needed pair-difference value-set boundedness from
the usual centered-truncated envelope hypotheses.  The event-level
sign-swap equality is compiled as
`measure_vdVWProductMeasure_pairDifference_constWeights_bad_eq_rademacherWeights_bad`,
and the deterministic one-sided Rademacher pair-difference split is compiled as
`vdVWWeightedClassSupremum_truncated_pairDifference_rademacher_bad_imp_original_or_ghost_bad`.
The selected finite-net side condition is now packaged in the deterministic
two-sided projection
`VdVWTheorem243_selectedFiniteNetHoeffding_original_or_ghost_bad_of_pairDifference_rademacher_bad`,
with sign-negation support from `VdVWRademacherSignVector.neg` and
`vdVWRademacherWeights_neg_sign`.  The factor-two product-fiber loss is now
packaged by
`VdVWOuterProbability_mul_left_le_two_mul_of_product_fiber_lower_bound_or_ghost`
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_ghost_product_fiber_lower_bound_or_selectedNet`.
The concrete ghost/Rademacher pair-difference event is now named
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent`, and its
pointwise original-or-ghost selected-net inclusion is compiled as
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_original_or_ghost_selectedNet_bad`.
The concrete-event source constructor is now compiled as
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_pairDifferenceGhostRademacher_selectedNetEvent`.
The sign-vector support part of this concrete event is now measurable via
`measurableSet_vdVWRademacherSignVector`, and the component-level constructor
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_of_components`
reduces event measurability to exactly three remaining component sets: the
original finite-center side condition, the ghost finite-center side condition
with negated signs, and the signed pair-difference bad event.  The remaining
source work is those three component measurability facts plus the displayed
Chebyshev fiber lower bound for this concrete event, then optional
specialization back to
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_canonicalGhostRademacher_selectedNetEvent`.
The signed pair-difference bad component is now also measurable under
countability, coordinate measurability, and envelope measurability, through
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacher_pairBad_of_countable`.
The stronger constructor
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_of_maximal_components_countable`
therefore leaves only the original and ghost selected finite-center side
conditions as event-measurability inputs.
The fixed-center version of those side conditions is now closed by
`measurableSet_VdVWTheorem243FiniteCenterMaximalBound_varying_weights`,
`measurableSet_VdVWTheorem243RademacherFiniteCenterHoeffdingBound_fixed_center`,
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacher_originalFiniteCenter_fixed_center`,
and
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacher_ghostFiniteCenter_fixed_center`.
The sample-dependent selected cover centers now have an explicit
measurable-selector interface through
`VdVWFiniteEmpiricalL1CoverSelectedCenterAt`,
`VdVWTheorem243RademacherFiniteCenterHoeffdingBound_selectedCenterAt_iff`,
`measurableSet_VdVWTheorem243RademacherFiniteCenterHoeffdingBound_selectedCenterAt`,
and the concrete original/ghost wrappers
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacher_originalFiniteCenter_selectedCenterAt`,
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacher_ghostFiniteCenter_selectedCenterAt`.
The countable concrete-event constructor
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_of_selectedCenterAt_countable`
therefore reduces selected-cover event measurability to Nat-indexed in-range
selector measurability assumptions.
The product-pair selected finite-center failure events can now use scalar
component measurability instead of raw selector-event assumptions through
`measurableSet_imp_abs_le_of_measurable`,
`measurableSet_VdVWTheorem243RademacherFiniteCenterHoeffdingBound_selectedCenterAt_of_measurable_components`,
`measurableSet_VdVWTheorem243ProductPairRademacher_originalFiniteCenter_failure_selectedCenterAt_of_measurable_components`, and
`measurableSet_VdVWTheorem243ProductPairRademacher_ghostFiniteCenter_failure_selectedCenterAt_of_measurable_components`.
The selected weighted sums themselves are now reduced to coordinate-level
inputs by `measurable_vdVWWeightedSampleSum_varying_index_of_coordinate`,
`measurable_vdVWWeightedSampleSum_selectedCenterAt_of_coordinate`, and the
product-pair wrappers
`measurableSet_VdVWTheorem243ProductPairRademacher_originalFiniteCenter_failure_selectedCenterAt_of_coordinate` /
`measurableSet_VdVWTheorem243ProductPairRademacher_ghostFiniteCenter_failure_selectedCenterAt_of_coordinate`.
The sign-first product-pair projection bookkeeping is now also closed by
`measurable_vdVWSignProductPair_originalSample`,
`measurable_vdVWSignProductPair_ghostSample`, and the sample-coordinate
failure-event wrappers
`measurableSet_VdVWTheorem243ProductPairRademacher_originalFiniteCenter_failure_selectedCenterAt_of_sample_coordinate` /
`measurableSet_VdVWTheorem243ProductPairRademacher_ghostFiniteCenter_failure_selectedCenterAt_of_sample_coordinate`.
The selected finite-center side condition and the named concrete
ghost/Rademacher event now also consume those same single-coordinate
assumptions through
`measurableSet_VdVWTheorem243RademacherFiniteCenterHoeffdingBound_selectedCenterAt_of_coordinate`
and
`measurableSet_VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_of_sample_coordinate_countable`.
The displayed-beta route also now consumes those inputs directly through
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_pairDifferenceGhostRademacher_selectedNetEvent_sample_coordinate_countable`.
The remaining selected-center task is therefore the actual single-sample
scalar measurability of selected cardinalities and Nat-indexed selected-center
coordinate evaluations.
The concrete product-fiber side now has the fiber-unpacking and lower-bound
transfer pair
`mem_fiber_VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_iff`
and
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_auxiliary_event`,
plus the threshold-doubling Chebyshev adapter
`VdVWChebyshev_betaLower_centeredPairSubBadEvent_centeredTruncated_uniformWeights_succ_of_dist_two_mul_bad`.
The centered sign-swap source event is now named by
`VdVWTheorem243CenteredPairSubSignSwapFiberSourceEvent`, with pointwise
inclusion and fiber transfer through
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_of_centeredPairSubSignSwapFiberSourceEvent`
and
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_centeredPairSubSignSwapFiberSourceEvent`.
The source probability proof is now split through
`VdVWTheorem243CenteredPairSubBadEvent` and
`VdVWTheorem243CenteredPairSubSignSwapBadEvent`, with a.e.-component and
direct concrete-fiber adapters ending in
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_pairSub_badEvent_signSwap_lower_bound`.
The canonical sign-support lift
`ae_vdVWProductMeasure_prod_vdVWRademacherSignVector`, the named Chebyshev
event wrapper
`VdVWChebyshev_betaLower_named_centeredPairSubBadEvent_centeredTruncated_uniformWeights_succ_of_dist_two_mul_bad`,
and the successor-sample concrete fiber wrapper
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_chebyshev_pairSub_badEvent_signSwap_lower_bound_succ`
now remove Chebyshev mass and Rademacher sign support as separate caller
inputs in the successor route.  The averaged product-pair route is now also
compiled through
`measurePreserving_vdVWProductMeasure_original_ghost_to_prod`,
`measure_vdVWProductMeasure_original_ghost_pairDifference_constWeights_bad_eq_productPair_bad`,
`measure_mul_le_vdVWProductMeasure_pairDifference_constWeights_bad_of_split_fiber_lower_bound`,
and
`VdVWTheorem243_productPair_centeredPairSubBadEvent_lower_bound_of_chebyshev_succ`.
This avoids treating fixed-original sign-swap as the main path: Chebyshev
mass is first integrated into the full `(P.prod P)^n` pair event, where the
existing product-pair sign symmetry applies.  The deterministic sign-swapped
averaged source is now compiled as
`VdVWTheorem243_productPair_centeredPairSubRademacherBadEvent_lower_bound_of_chebyshev_succ`,
which applies that product-pair symmetry for every deterministic Rademacher
sign vector.  The sign-averaged source is now also compiled as
`VdVWTheorem243_productPair_centeredPairSubRademacherBadEvent_integral_lower_bound_of_chebyshev_succ`,
with the countable-class measurability wrapper
`VdVWTheorem243_productPair_centeredPairSubRademacherBadEvent_integral_lower_bound_of_chebyshev_succ_of_countable`.
The product-pair bad-event measurability inputs are discharged by
`measurableSet_vdVWProductPair_centeredPairSubBadEvent_of_countable` and
`measurableSet_vdVWProductPair_centeredPairSubRademacherBadEvent_of_countable`.
The product-pair selected-event pointwise projection is now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent` and
`VdVWTheorem243_productPairRademacherSelectedNetEvent_original_or_ghost_selectedNet_bad`.
The product-pair selected-event measure lower bound is now compiled through
`ae_vdVWProductMeasure_rademacher_prod_productPair_vdVWRademacherSignVector`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_lower_bound_of_signedBad_ae_components`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_lower_bound_of_signedBad_ae_finiteCenter`,
and
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_lower_bound_of_chebyshev_countable_ae_finiteCenter_succ`.
The map/union-bound handoff is now compiled as
`VdVWOuterProbability_productPair_event_le_two_mul_of_original_or_ghost`,
`VdVWOuterProbability_mul_left_le_two_mul_of_productPair_event_lower_bound_or_ghost`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_lower_bound`,
and
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_ae_finiteCenter_succ`.
The finite-center support frontier is now sharpened by
`ae_vdVWProductMeasure_rademacher_prod_productPair_originalFiniteCenter_of_ae_sign_sample`,
`ae_vdVWProductMeasure_rademacher_prod_productPair_ghostFiniteCenter_neg_of_ae_sign_sample`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_signSample_ae_finiteCenter_succ`,
and
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_lower_bound_of_signedBad_finiteCenter_failures`.
The half-scale product-pair adapter is now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_signSample_ae_finiteCenter_halfScale_succ`:
it turns the successor comparison at `epsilon / 2` into an `epsilon`-bad
centered event with selected-net scale `4 * finiteNetHoeffdingUpper + eta`.
The positive-sample and convergence handoffs are now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_signSample_ae_finiteCenter_halfScale_of_pos`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_signSample_ae_finiteCenter_halfScale`,
closing the scale/penalty packaging into the fixed-`M` stochastic-entropy
consumer with `C = 4` and `A = 2`.
The canonical first-level selected-cover source wrapper is now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_signSample_ae_finiteCenter_halfScale_of_selected_truncated_quarterRadius_firstLevel`.
It chooses the first-level selected cover internally and leaves only the two
finite-center Hoeffding support facts on the natural `sign × sample` product
spaces.  This is the honest sign-averaged product-pair source layer; it does
not assume the invalid fixed-original sign-swap fiber transport.
The matching first-level additive-error source wrapper is now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel`.
It uses the same canonical selected cover while exposing the original and
ghost finite-center failures as explicit lintegral error terms.  The live
work on this branch is failure-event measurability plus tail control, or the
product-fiber replacement that avoids this additive error.
Its countable specialization
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_countable`
now discharges those two failure-event measurability inputs internally from
the canonical first-level selected-center coordinate bridge.  The branch's
remaining source burden is therefore only tail control for the displayed
lintegral failure terms, or the product-fiber replacement.
The source-level inverse-square relaxation is now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_invSq_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_countable`.
It replaces the two additive finite-center Hoeffding failure-tail integrals by
the explicit `(selected cardinality + 1)^(-2)` lintegrals already used by the
convergence consumers.  Thus this branch's remaining extra input is exactly
inverse-square selected-cardinality integrability/growth, not another
measurability or cover-selection bridge.
The fixed-`n` deterministic and a.e. lower-cardinality source wrappers are
also compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_invSq_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_countable_lowerBound`
and
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_invSq_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_countable_ae_lowerBound`.
They replace the two inverse-square lintegrals by the deterministic error
`2 * (2 * exp(-3)/(lower+1)^2)` under pointwise or a.e. lower selected
cardinality bounds.

The canonical sign-only finite-center failure-tail lane now has its
outer-probability bridge as well.  The reusable additive product-fiber
accounting is compiled as
`measure_mul_le_prod_measure_add_setLIntegral_error_of_fiber_lower_bound_add_error`
and `VdVWOuterProbability_mul_left_le_of_product_fiber_lower_bound_add_error`;
the VdVW sign-only comparison is
`VdVWTheorem243CanonicalRademacherSelectedNetEvent_outerProbability_bound_of_rademacherBad_finiteCenter_failure_tail_sample_coordinate_countable`.
This removes event measurability and selected-net projection from that lane's
blocker list.  What remains is probability-side: prove beta mass for the pure
Rademacher bad fibers and prove the integrated selected finite-center
failure-tail error is controlled strongly enough to feed the additive-error
convergence consumer.
That consumer is now compiled as
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_failure_tail_countable`,
so the dashboard frontier is now exactly those two source inputs, not another
fixed-`M` endpoint alias.
The same sign-only lane now has the inverse-square failure-tail specialization
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_invSq_tail_countable`.
It turns a one-sample inverse-square selected-cardinality lintegral condition
into the needed integrated finite-center failure-tail convergence.
The explicit original/ghost finite-center failure probabilities are now split
through the fixed-sample Rademacher finite-center Hoeffding tail, a
product-fiber upper-bound lift, and additive-error product-pair comparison
wrappers.  The fixed-sample tail is
`vdVWTheorem243_rademacherFiniteCenterHoeffding_failure_real_le`; the generic
upper disintegration lemma is `prod_measure_le_lintegral_fiber_bound`; and the
random selected-cover failure lifts are
`VdVWTheorem243ProductPairRademacher_originalFiniteCenter_failure_le_lintegral_finiteCenterHoeffdingTail`
and
`VdVWTheorem243ProductPairRademacher_ghostFiniteCenter_failure_le_lintegral_finiteCenterHoeffdingTail`.
The new additive wrappers are
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_lower_bound_of_signedBad_finiteCenter_failure_tails`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_lower_bound_of_chebyshev_countable_finiteCenter_failure_tails_succ`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_lower_bound_add_error`, and
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_failure_tails_succ`.
The additive half-scale source adapters are now compiled as
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_failure_tails_halfScale_succ`
and
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_finiteCenter_failure_tails_halfScale_of_pos`.
They keep the explicit integrated original/ghost finite-center failure tails
while converting the selected-net target to
`epsilon < dist (4 * finiteNetHoeffdingUpper + eta) 0`.
The additive-error fixed-`M` convergence consumer is now compiled through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_eventualBeta_scaledSelectedFiniteNetHoeffdingUpper_add_error`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_eventualBeta_of_chebyshevPenalty_invNat_bound_scaledSelectedFiniteNetHoeffdingUpper_add_error`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale`.
The sign-first finite-center failure-event measurability layer is now compiled
as
`measurableSet_VdVWTheorem243ProductPairRademacher_originalFiniteCenter_failure_selectedCenterAt`,
`measurableSet_VdVWTheorem243ProductPairRademacher_ghostFiniteCenter_failure_selectedCenterAt`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selectedCenterAt`.
The finite-center failure-tail closed form is now compiled through
`vdVWTheorem243FiniteCenterHoeffdingFailureTail_exponent_eq`,
`vdVWTheorem243FiniteCenterHoeffdingFailureTail_eq_closed_form`, and
`tendsto_vdVWTheorem243FiniteCenterHoeffdingFailureTail_one_succ`, plus the
direct nonconvergence theorem
`not_tendsto_vdVWTheorem243FiniteCenterHoeffdingFailureTail_one_succ_zero`.
The quantitative inverse-square tail package is now compiled as
`vdVWTheorem243FiniteCenterHoeffdingFailureTail_le_const_div_cardinality_succ_sq`,
`vdVWTheorem243FiniteCenterHoeffdingFailureTail_lintegral_le_const_div_cardinality_succ_sq`,
`vdVWTheorem243FiniteCenterHoeffdingFailureTail_pair_lintegral_tendsto_zero_of_invSq`,
and
`vdVWTheorem243_selectedFailureTail_tendsto_zero_of_invSq_lintegral`.
The inverse-square input now feeds the compiled fixed-`M` route directly through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_invSq_lintegral`
and the canonical first-level selected-cover wrapper
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_invSq_lintegral`.
These formalize the route warning: the additive Hoeffding failure-tail term at
the current display scale does not have automatic sample-size decay, and for a
one-center selected cover it is a positive constant rather than a
zero-convergent error.  The next blocker is therefore not to force this
additive error to vanish from bare stochastic entropy; it is now sharpened to
proving convergence to zero of the explicit inverse-square original/ghost
selected-cardinality lintegrals, or else supplying a different
expectation/symmetrization comparison that avoids the additive-tail
obstruction.  A new lower-growth consumer now proves those inverse-square
lintegrals vanish from an explicit deterministic lower bound on the canonical
selected-cover cardinality tending to infinity:
`vdVWTheorem243_selectedInvSq_lintegral_tendsto_zero_of_eventually_cardinality_ge`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_eventually_cardinality_ge`.
The same consumer now has an eventual-a.e. version,
`vdVW_pair_lintegral_sum_tendsto_zero_of_eventual_ae_ofReal_bound`,
`vdVWTheorem243_selectedInvSq_lintegral_tendsto_zero_of_eventually_ae_cardinality_ge`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_eventually_ae_cardinality_ge`.
This is a stronger structural assumption, now pointwise or eventual-a.e.; it
is not a consequence of bare stochastic entropy.
Use the selected-log mean route only under honest L1/UI/countability
strengthening.
Do not spend the next batch on more endpoint aliases, code-set/quantizer
restatements, finite-index wrappers, or selected-cardinality transport unless
it directly consumes that source proof.

Authoritative current `/goal` override, 2026-05-06 after the finite-index
1.4.8 weak-convergence/tightness iff wrappers: local `main` should equal
`origin/main` after the verified push, and the broad Codex goal object should
be treated only as an orchestration label.  The current Lean state has already
closed the main Theorem 2.4.3 endpoint plumbing for selected fixed-radius
tail/UI, finite code-set and natural-polynomial code-set routes,
threshold/grid/finite-trace/full-subgraph VC routes, canonical iid
sample-process specializations, finite-class SLLN endpoints, full-subgraph
`P`-GC plus in-mean packages, and Lemma 2.4.5 reverse/cofiltration consumers.
Chapter 1 support also includes the measure-level weak-convergence/tightness
wrappers and raw bounded-process forward FDD/tightness/congruence interfaces,
including direct coordinate-law consequences for process weak convergence and
process asymptotic tightness.  The raw one-coordinate law adapters
`vdVWCoordinateProcessLaw`, `vdVWEllInftyProcessLaw_map_eval`,
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw`, and
`VdVWEllInftyProcessAsymptoticallyTight.rawCoordinateLaw` are now compiled, so
later Chapter 1 process arguments can state ordinary coordinate laws directly
rather than mapped `ell_infty(T)` eval-pushforwards.  The corresponding
coordinatewise a.e.-replacement support is also compiled as
`aemeasurable_coordinate_congr_ae`, `vdVWCoordinateProcessLaw_congr_ae`,
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw_congr_eventually_ae`,
and
`VdVWEllInftyProcessAsymptoticallyTight.rawCoordinateLaw_congr_eventually_ae`.
The finite-FDD analogue is also compiled as
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_congr_eventually_finite_coord_ae`
and
`VdVWEllInftyProcessAsymptoticallyTight.finiteDimensionalLaw_congr_eventually_finite_coord_ae`,
so fixed finite-dimensional laws can be transported after replacing only the
selected coordinates a.e.  Sequential weak convergence now also feeds the
raw-coordinate and replacement FDD tightness consequences through
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw_asymptoticallyTight_atTop`,
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_congr_eventually_finite_coord_ae_asymptoticallyTight_atTop`,
and
`VdVWEllInftyProcessWeakConvergence.rawCoordinateLaw_congr_eventually_ae_asymptoticallyTight_atTop`.
For finite index sets, the forward/backward finite-product criteria are now
packaged as iff theorems:
`vdVW148_ellInfty_weakConvergence_iff_finiteProduct_weakConvergence_finite`
and
`vdVW148_ellInfty_asymptoticallyTight_iff_finiteProduct_asymptoticallyTight_finite`.
This run additionally closes the generic centered-convergence endpoint bundle
and the explicit selected finite-net tail/UI route to `P`-GC plus in-mean via
`VdVWTheorem243_pGlivenkoCantelli_and_inMean_of_centered_untruncated_convergesInOuterProbabilityConst_zero`
and
`VdVWTheorem243_variableEntropy_tailExpectation_pGlivenkoCantelli_and_inMean`.
The selected normalized-log tail/UI route now reaches the same final endpoint
through
`VdVWTheorem243_variableEntropy_logCardinality_div_tailExpectation_pGlivenkoCantelli_and_inMean`.
The central selected fixed-radius route now also has
`VdVWTheorem243_selectedFixedRadiusTail_pGlivenkoCantelli_and_inMean`, so the
next proof target is the source theorem for selected side conditions, not more
endpoint composition.
The first source-side bridge is now compiled:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_finiteNetUpper_integral_tendsto_zero`
constructs the selected side-condition package from variable entropy plus
ordinary mean convergence of the selected finite-net Hoeffding upper.  The
ordinary-mean Markov bridges are also compiled as
`VdVWConvergesInOuterProbability_zero_of_integral_tendsto_zero_nonneg` and
`VdVWConvergesInOuterProbabilityConst_zero_of_integral_tendsto_zero_nonneg`,
so nonnegative measurable fixed-space and finite-net mean routes can feed
outer-probability convergence directly.  The Theorem 2.4.3 finite-net version
is now named as
`finiteNetHoeffdingUpper_convergesInOuterProbabilityConst_zero_of_integral_tendsto_zero`.
The fixed-`M` event-comparison route also now consumes this mean input through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_integral_outerProbability_finiteNetHoeffdingUpper`.
The remaining exact-textbook gap is therefore sharper: prove that mean/tail/UI
input from the random entropy hypothesis, or add a stronger honest hypothesis.

2026-05-06 selected fixed-`M` source bridge: the selected scaled finite-net
route now has the fixed-`M` theorem
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_eventualAe_scaledSelectedFiniteNetHoeffdingUpper`.
It removes duplicate selected-cardinality transfer from the untruncated
consumer by proving the transfer once at fixed `M`: selected cover domination
is pushed to the entropy-controlled external cardinality by monotonicity of
`vdVWTheorem243FiniteNetHoeffdingUpper`.  The next source-side target is not a
new endpoint alias; it is the proof of selected eventual a.e. finite-net
domination, or the exact outer-probability comparison primitive, from the
VdV&W symmetrization/random empirical-cover argument.

2026-05-06 option-1 correction: after searching local `StatInference`,
`StatInference/ProbabilityMeasure`, pinned mathlib, and the recorded local
Lean checkouts, no reusable theorem was found for the actual probability-level
symmetrization/net comparison needed by the fixed-radius route.  The next
Theorem 2.4.3 batch should attack the `hprob_bound` consumed by
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_finiteNetHoeffdingUpper`:
outer probability of the fixed-`M` centered truncated bad event must be
controlled by the outer probability of the selected finite-net Hoeffding upper
plus the fixed radius.  Existing deterministic cover and precursor lemmas give
finite-net/Rademacher expectation support, not this event comparison.  Do not
continue endpoint packaging until this source-side comparison, or an exact
primitive for it, is in place.

The exact comparison target is now compiled as
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison`, with the
minimal consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbabilityComparison`.
This is not a theorem completion; it is the source-side proof target for the
next batch.

2026-05-07 comparison transport follow-up: agent-assisted search confirmed
that `origin/main` has no newer VdVW Lean work after the selected comparison
transport commit; the only later main commit refreshes an optimization prompt.
`Theorem243.lean` now adds
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.mono_cardinality`
and
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.of_selected_truncated_positiveRadius_ae_bound`.
These keep the source proof focused on selected empirical covers while letting
the entropy side use a larger externally recorded cardinality.  The remaining
Theorem 2.4.3 source gap is the selected-cover ghost/Rademacher a.e.
finite-net domination or exact selected-cardinality outer-probability
comparison.

2026-05-07 scaled selected probability route: `Theorem243.lean` now also has
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_scaledSelectedFiniteNetHoeffdingUpper`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_scaledSelectedFiniteNetHoeffdingUpper`.
This is the scaled probability-level consumer expected from the VdV&W
Lemma 2.3.7 symmetrization route: once the selected-cover ghost/Rademacher
argument proves the selected outer-probability bad-event comparison with its
constant, the existing entropy/Hoeffding machinery closes fixed-`M` centered
truncated convergence.

2026-05-07 constant-loss symmetrization route: the fixed-radius
outer-probability handoff now also accepts a finite multiplicative probability
loss through
`VdVWConvergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_const_mul_add_bound`.
The Theorem 2.4.3 selected route consumes this via
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_const_scaledSelectedFiniteNetHoeffdingUpper`.
This matches Lemma 2.3.7 more closely: the next proof should establish the
selected-cover probability symmetrization comparison with its `β_n(x)` lower
bound, rather than forcing a lossless event comparison.

2026-05-07 beta-weighted Lemma 2.3.7 handoff: `Theorem243.lean` now compiles
the beta-loss consumers
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_beta_scaledSelectedFiniteNetHoeffdingUpper`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_beta_scaledSelectedFiniteNetHoeffdingUpper`.
They convert a future source inequality
`B * P_left <= A * P_selected` into the finite constant-loss route.  The next
batch should prove the actual selected-cover Lemma 2.3.7 comparison and the
eventual positive lower bound for `β_n(x)`, not add another downstream
convergence wrapper.

2026-05-07 variable-beta source alignment: the selected route now also accepts
the literal Lemma 2.3.7 shape through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_eventualBeta_scaledSelectedFiniteNetHoeffdingUpper`.
The source comparison may keep the factor `β_n(epsilon)` varying in `n`; a
separate eventual lower bound `B <= β_n(epsilon)` freezes it to the compiled
constant-loss route.  The next target is now sharper: prove the variable-beta
nonmeasurable probability comparison and the Chebyshev lower bound for the
normalized fixed-`M` truncated coordinates.
The deterministic lower-bound postprocessor is also compiled as
`VdVWTheorem243_eventualBetaLower_half_of_eventually_eq_one_sub_penalty`, so
Chebyshev only needs to provide the displayed `1 - penalty_n(epsilon)` beta
formula and penalty convergence to zero.
The deterministic convergence of such a penalty is now reduced further by
`VdVWTheorem243_chebyshevPenalty_tendsto_zero_of_eventual_invNat_bound`: an
eventual nonnegative `C(epsilon) / (n + 1)` bound is enough.  The remaining
beta work is the variance/Chebyshev source proof producing that bound.
The combined consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_eventualBeta_of_chebyshevPenalty_invNat_bound_scaledSelectedFiniteNetHoeffdingUpper`
now composes that penalty estimate with the variable-beta selected comparison,
so the next proof task is the actual Lemma 2.3.7 selected-cover/Rademacher
source theorem and its variance bound.
The Chebyshev source lower-bound lemmas
`VdVWChebyshev_betaLower_centered_abs_lt_of_variance`,
`VdVWChebyshev_betaLower_centered_abs_lt_of_variance_le_penalty`,
`VdVWChebyshev_betaLower_abs_lt_of_mean_zero_variance_le_penalty`, and
`VdVWChebyshev_betaLower_abs_lt_half_of_mean_zero_variance_le_penalty` are also
compiled.  They supply the local probability step
`ofReal (1 - penalty) <= P(|X| < x / 2)` from `MemLp`, mean zero, and a
variance-ratio/penalty bound, leaving the finite-sample variance calculation
and selected-cover/Rademacher beta comparison as the real source blocker.
The finite-sample variance calculation is now compiled through
`VdVWVariance_pi_weightedSum`,
`VdVWChebyshev_betaLower_pi_weightedSum_abs_lt_half_of_varianceSum_le_penalty`,
`VdVWChebyshev_betaLower_pi_weightedSum_abs_lt_half_of_uniformVariance_le_penalty`,
`memLp_centered_vdVWTruncatedClassFun_of_nonneg`,
`VdVWVariance_centered_vdVWTruncatedClassFun_le_two_mul_M_sq`, and
`VdVWChebyshev_betaLower_productSample_centeredTruncated_weightedSum_abs_lt_half`.
The beta-side blocker is now the selected-cover/Rademacher probability
comparison itself, with the deterministic weighted-square penalty supplied.
The uniform empirical-weight specialization is also compiled through
`fin_sum_uniform_inv_sq_eq_inv_nat`,
`VdVWChebyshev_betaLower_productSample_centeredTruncated_uniformWeights_succ_abs_lt_half`,
`VdVWTheorem243_uniformChebyshevPenalty_tendsto_zero`, and
`VdVWTheorem243_eventualBetaLower_half_of_uniformChebyshevPenalty_eq`, giving
the explicit `16 * M^2 / ((n + 1) * epsilon^2)` penalty and its eventual
`1/2` beta lower bound.
The fixed-`M` route now consumes that displayed factor directly through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_uniformChebyshevBeta_scaledSelectedFiniteNetHoeffdingUpper`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_displayedUniformChebyshevBeta_scaledSelectedFiniteNetHoeffdingUpper`.
The remaining source theorem is the VdV&W Lemma 2.3.7 selected-cover/Rademacher
outer-probability comparison carrying
`ofReal (1 - 16 * M^2 / ((n + 1) * epsilon^2))`.
The exact missing source proposition is now named in Lean as
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison`, with
the fixed-`M` entropy consumer
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality`.
This is the next theorem to prove from the ghost-sample/Rademacher
selected-cover argument.

The operative target is no longer another endpoint alias.  The immediate exact
Theorem 2.4.3 mismatch is the selected-cover/Rademacher probability comparison
above; after that, the remaining generic random-entropy step is to turn
`log N(epsilon, F_M, L1(P_n)) = o_P^*(n)` for fixed positive `epsilon, M` into
the selected finite-net tail/UI or ordinary-mean/uniform-integrability input
used by the compiled fixed-radius route.  If those cannot be proved from the
textbook hypothesis alone, record the exact missing hypothesis/theorem shape and
then move to either a source-supported full-subgraph/finite-class corollary or a
real Chapter 1 primitive: arbitrary-index FDD converse,
separability/tightness/asymptotic-measurability, nonmeasurable signed
outer-cover weak convergence, or full arbitrary-map extended-real measurable
cover existence.  Historical target paragraphs below are retained for audit
context only.

2026-05-06 fixed-FDD selected-coordinate congruence: `FiniteDimensional.lean`
now has `aemeasurable_fdd_congr_finite_coord_ae` and
`vdVWFDDProcessLaw_congr_finite_coord_ae`, so fixed finite-dimensional laws can
be transported under a.e. equality on just the selected coordinate set.  This
is a finite-FDD support primitive, not the arbitrary-index FDD converse.

2026-05-06 finite code-set compression bridge: `CoveringPrimitive.lean` now
has generic finite pointwise-code-set empirical-cover/cardinality primitives,
and `Theorem243.lean` now lifts them to random empirical-cover domination via
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_pointwise_approx_codeSet_cardinality_bound_samplePath`
and its all-positive-radius wrapper.  This feeds future compression/code-image
entropy routes without adding a new endpoint alias.

Current `/goal` target override, 2026-05-06 after verified pushed head
`109ab17 Add finite code-set random cover bridge`: the broad active Codex goal
remains valid, but the operative next target is no longer another endpoint
alias or scalar-quantizer wrapper.  The next proof batch should instantiate the
new finite code-set random-cover bridge with a real polynomial code-image,
VC/Sauer, finite-trace, threshold-grid, quantizer, or sample-size-dependent
compression estimate; or prove selected empirical-cover tail/UI/ordinary-mean
inputs strong enough for the fixed-radius Theorem 2.4.3 route; or, if those
block after search and Lean attempts, switch to a stronger Chapter 1 process
primitive such as arbitrary-index FDD converse, asymptotic measurability or
tightness, nonmeasurable signed weak convergence, or full arbitrary-map
extended-real cover existence.  Historical target paragraphs below are audit
context only.

2026-05-06 code-set endpoint handoff: the generic finite code-set route now has
selected tail/UI constructors from deterministic log-rate and centered
untruncated convergence endpoints from both deterministic log-rate and
natural-polynomial code-set cardinality bounds.  The important next work is no
longer plumbing from code-set covers into Theorem 2.4.3; it is proving a real
structural code-image/cardinality estimate that supplies those hypotheses.

Current `/goal` target override, 2026-05-06 after verified pushed head
`ce2bb2c Add Theorem 2.4.3 scalar quantizer polynomial route`: local `main`
equals `origin/main` and the worktree is clean.  The broad Codex goal object
is only an orchestration label.  Treat the operative next target as:

1. treat the finite vector-code-set scalar-quantizer decoder-error bridge as
   closed support through
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_scalarQuantizer_decode_error_codeSet_cardinality_bound_nat_poly`
   and
   `VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_scalarQuantizer_decode_error_codeSet_cardinality_bound_nat_poly`;
2. push immediately to the real structural entropy/cardinality estimate
   that supplies the code-set polynomial bound, or another non-duplicative
   VC/Sauer, finite-trace, threshold-grid, or quantizer estimate feeding the
   selected fixed-radius Theorem 2.4.3 route;
3. if structural entropy blocks after search and Lean attempts, switch to a
   selected empirical-cover tail/UI/ordinary-mean theorem from strong enough
   assumptions or an exact Chapter 1 process primitive such as arbitrary-index
   FDD converse, separability/tightness/asymptotic-measurability, signed
   nonmeasurable outer-cover weak convergence, or full arbitrary-map
   extended-real measurable-cover existence.

Do not spend the next continuation on endpoint aliases, finite-index process
wrappers, selected-route restatements, or another scalar-quantizer
coordinate-cardinality wrapper.  The coordinate-cardinality natural-polynomial
route is already compiled through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`.
The vector-code-set route is now compiled too; the next useful work is the
actual finite-code/compression or VC/Sauer cardinality theorem that supplies
its polynomial bound.
The fixed finite-code compression special case is also closed through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_fintype_scalarQuantizer_decode_error_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_fintype_scalarQuantizer_decode_error_nat_poly`;
it uses `Finset.univ` and degree-zero growth.  It now reaches centered
untruncated convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_fintype_scalarQuantizer_decode_error_nat_poly`.
The next structural target therefore needs to go beyond fixed finite codes:
sample-size-dependent compression/code images, or a genuine
VC/Sauer/grid/threshold estimate not already covered by existing endpoint
packages.

Current `/goal` target override, 2026-05-06 after verified pushed head
`fc98144 Add weak convergence target congruence`: treat the broad Codex goal
objective as an orchestration label only, because the active goal object cannot
be edited in place.  The latest closed support includes measure-level
weak-convergence source/target replacement through
`VdVWWeakConvergenceProbabilityMeasures.congr_limit` and
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually_limit`; process and
FDD stability under whole-sample-path a.e. equality; and the earlier bounded
centered separability handoff:
`VdVWPointwiseApproximableByCountableSubclass.tendsto_integral_of_uniform_bound`,
`VdVWPointwiseApproximableByCountableSubclass.centered_of_uniform_bound`,
`VdVWPMeasurableClass.centered_of_pointwiseApproximableByCountableSubclass_of_uniform_bound`,
and the Theorem 2.4.3 law endpoints
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`.

The next useful `/goal` run should not rebuild finite-net/Hoeffding/Mills,
selected fixed-radius/inverse-radius, untruncation, reverse-cofiltration,
selected-entropy, full-subgraph, finite-class, threshold/grid/quantizer,
Dirac-law, finite-index `ell_infty(T)`, forward process-law endpoint packages,
process/FDD congruence aliases, or the centered separability endpoints already
compiled.  It should close a non-duplicative theorem-facing batch in one of
these lanes:

1. a real structural entropy/cardinality theorem feeding Theorem 2.4.3, such
   as finite-code/compression, VC/Sauer, finite-trace, threshold-grid, or
   quantizer sublinear normalized-log growth, only if it is not already covered
   by the existing threshold/grid/full-subgraph/finite-trace routes, and only
   if it supplies a new proof input rather than an endpoint alias;
2. a genuine selected empirical-cover event, tail/UI, or ordinary-mean bridge
   from hypotheses strong enough to imply it; bare outer-probability convergence
   of normalized random entropy is not enough;
3. an exact Chapter 1 process primitive, especially arbitrary-index FDD
   converse, separability/tightness/asymptotic-measurability, nonmeasurable
   signed outer-cover weak convergence, or full arbitrary-map extended-real
   measurable-cover existence.

Latest `/goal` rebase after `50f88c7`: local `main` equals `origin/main`, and
the newest verified Chapter 1 closure is the raw bounded-process
weak-convergence/tightness interface.  Treat the broad Codex goal objective as
an orchestration label only.  The operative target is now to close a
non-duplicative theorem-facing blocker: a real structural entropy/cardinality
theorem feeding Theorem 2.4.3, a selected empirical-cover tail/UI/ordinary-mean
bridge from strong enough assumptions, or a Chapter 1 process primitive such
as arbitrary-index FDD converse, separability/tightness/asymptotic-
measurability, nonmeasurable signed outer-cover weak convergence, or full
arbitrary-map extended-real measurable-cover existence.  Do not add more
endpoint aliases around already closed Theorem 2.4.3 routes or more
finite-index/process-forward wrappers unless a new exact statement consumes
them.

Latest `/goal` rebase after `e3d050e`: the finite-index `ell_infty(T)`
boundedness and finite-product converse support is now closed.  The next run
should not add more finite-index wrappers or endpoint aliases.  It should
attack one of the remaining non-duplicative blockers: a real structural
entropy/cardinality theorem feeding the selected fixed-radius Theorem 2.4.3
route, a genuine selected empirical-cover event/tail/UI/ordinary-mean theorem
from strong enough book-facing hypotheses, or a Chapter 1 process primitive
such as arbitrary-index FDD converse, separability/tightness/asymptotic
measurability, nonmeasurable signed outer-cover weak convergence, or full
arbitrary-map extended-real measurable-cover existence.

2026-05-06 `/goal` rebase after `2d2b441`: finite-coordinate measurability and
finite-index FDD/converse wrappers are closed support, not the next target.
The next useful run should either prove a new structural entropy/cardinality
theorem for a concrete VC/Sauer, finite-code, threshold-grid, finite-trace, or
quantizer-compression route; prove a selected empirical-cover
tail/UI/ordinary-mean bridge from a hypothesis strong enough to imply it; or
switch to a real Chapter 1 process blocker such as arbitrary-index FDD
converse, separability/tightness/asymptotic-measurability, or nonmeasurable
outer-cover signed weak convergence.  Do not add more endpoint aliases around
already-closed Theorem 2.4.3 routes.

The adjacent raw finite-vector transport is now compiled as
`vdVW148_boundedProcess_finiteRestrict_hasLaw_of_hasLaw`,
`vdVW148_boundedProcess_finiteRestrict_identDistrib_of_identDistrib`, and
`vdVW148_boundedProcess_finiteRestrict_tendstoInDistribution_of_tendstoInDistribution`.
These close direct finite-dimensional HasLaw/IdentDistrib/weak-convergence
transport to finite restrictions of bounded `ell_infty(T)` process maps, while
leaving the arbitrary-index FDD converse and process separability/tightness
blockers open.
Finite-index real processes now also have automatic bounded sample paths via
`VdVWEllInfty.isBoundedSamplePath_of_finite` and canonical maps
`VdVWEllInfty.processMapFinite`.  The finite-index law, identical-distribution,
and convergence-in-distribution converse wrappers
`vdVW148_finiteProcess_hasLaw_of_finiteProduct_hasLaw_finite`,
`vdVW148_finiteProcess_identDistrib_of_finiteProduct_identDistrib_finite`, and
`vdVW148_finiteProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`
remove the manual boundedness assumption only in the finite-index case; the
arbitrary-index VdV&W 1.4.8 converse remains open.

The Chapter 1 process-tightness interface now has a raw-process law layer:
`vdVWEllInftyProcessLaw`, `vdVWFDDProcessLaw`,
`vdVWEllInftyProcessLaw_map_finiteRestrict`,
`VdVWEllInftyProcessAsymptoticallyTight`, and
`VdVWEllInftyProcessAsymptoticallyTight.finiteDimensionalLaw`.  This proves
that tightness of bounded `ell_infty(T)` process laws implies tightness of each
finite-dimensional law.  It is a real process-level support bridge, but still
not the arbitrary-index FDD converse or separability/asymptotic-measurability
theorem.
The matching process weak-convergence interface is also compiled:
`VdVWEllInftyProcessWeakConvergence` and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw` package weak
convergence of bounded `ell_infty(T)` process laws and project it to weak
convergence of each finite-dimensional raw coordinate law.  This keeps the
direction honest: it is forward FDD support, not the arbitrary-index VdV&W
1.4.8 converse.
The process Prokhorov/tightness consequence is also available:
`VdVWEllInftyProcessWeakConvergence.asymptoticallyTight_atTop` and
`VdVWEllInftyProcessWeakConvergence.finiteDimensionalLaw_asymptoticallyTight_atTop`
turn sequential weak convergence of bounded process laws into process-law
asymptotic tightness and finite-dimensional law tightness.
The same raw-process weak-convergence/tightness predicates now have
filter-refinement and reindexing stability wrappers:
`VdVWEllInftyProcessWeakConvergence.mono_filter`,
`VdVWEllInftyProcessWeakConvergence.comp_tendsto`,
`VdVWEllInftyProcessAsymptoticallyTight.mono_filter`, and
`VdVWEllInftyProcessAsymptoticallyTight.comp_tendsto`.  These support
subsequence/subnet arguments without claiming the arbitrary-index FDD converse.
The process law and process-level convergence/tightness predicates are also
stable under a.e.-equal source-process replacement through
`vdVWEllInftyProcessLaw_congr_ae`,
`VdVWEllInftyProcessWeakConvergence.congr_eventually_ae`, and
`VdVWEllInftyProcessAsymptoticallyTight.congr_eventually_ae`.  This is the
needed raw-process congruence support for later measurable-version and
separability arguments.
The same congruence layer now has a raw sample-path coordinate-equality entry:
`VdVWEllInfty.processMap_congr_ae`,
`vdVWEllInftyProcessLaw_congr_forall_coord_ae`,
`VdVWEllInftyProcessWeakConvergence.congr_eventually_forall_coord_ae`, and
`VdVWEllInftyProcessAsymptoticallyTight.congr_eventually_forall_coord_ae`.
These require a.e. equality of whole sample paths `∀ t, Y ω t = X ω t`, not
separate coordinatewise a.e. equality, so they do not overclaim the
arbitrary-index FDD converse.
The weak-convergence side also has limit-process replacement wrappers
`VdVWEllInftyProcessWeakConvergence.congr_limit_ae` and
`VdVWEllInftyProcessWeakConvergence.congr_limit_forall_coord_ae`, so later
canonical or separable limit versions can be substituted without changing the
law-level convergence statement.
The finite-dimensional law layer now has the matching raw sample-path
congruence support:
`aemeasurable_fdd_congr_forall_coord_ae` and
`vdVWFDDProcessLaw_congr_forall_coord_ae`.
These keep FDD measurability and FDD laws stable under the same whole-path
a.e.-equal replacements.
The Definition 2.3.3 separability lane also has a bounded route:
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_uniform_bound`
combines pointwise approximability by a countable measurable subclass with a
global absolute bound on that subclass to prove `P`-measurability of the
original class.
The same lane now has the centered bounded route:
`VdVWPointwiseApproximableByCountableSubclass.tendsto_integral_of_uniform_bound`,
`VdVWPointwiseApproximableByCountableSubclass.centered_of_uniform_bound`, and
`VdVWPMeasurableClass.centered_of_pointwiseApproximableByCountableSubclass_of_uniform_bound`.
These use mathlib dominated convergence to move pointwise approximation
through population integrals and then prove centered `P`-measurability under a
uniform absolute bound on the original class.
The Theorem 2.4.3 law-level endpoints now consume this separability route via
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_pointwiseApproximable_uniform_bound_convergesInOuterProbabilityConst`.
They replace countability at those endpoints with bounded pointwise
approximability plus coordinate measurability.

The scalar-quantizer structural-cover lift is also compiled:
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_scalarQuantizer_decode_error_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_coordinate_scalarQuantizer_decode_error_cardinality_bound_samplePath`
turn finite coordinate code sets and decoder error `eta / 2` into the random
empirical-cover domination required by the selected fixed-radius Theorem 2.4.3
route.  This is a structural input; the remaining hard step is a real
cardinality/compression or VC/Sauer estimate for the code sets.
The route now also has coordinate-cardinality convenience wrappers
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_samplePath`,
reducing product-cardinality domination to per-coordinate cardinality bounds
via `Finset.prod_le_pow_card`.
The same coordinate-cardinality route now reaches the selected fixed-radius
tail/UI side-condition package through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_logCardinality_div_tendsto_bound`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_logCardinality_div_tendsto_bound`.
The scalar-quantizer coordinate-cardinality route now also has the
natural-polynomial closure
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`,
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_scalarQuantizer_decode_error_coordinateCard_bound_nat_poly`.
This is still an upstream structural route, not a final textbook entropy
closure: the next proof target is the actual finite-code/compression,
grid/quantizer, or VC/Sauer cardinality estimate that supplies the
coordinate-cardinality and polynomial-growth hypotheses.

The measure-level Portmanteau continuity-set
implication and closed/open converse wrappers are now compiled as well.  The
norm-tail tightness characterization for probability-measure families on
normed/proper normed spaces is compiled, including the sequence/range limsup
norm-tail criterion and finite-dimensional inner-product tail criteria backed
by mathlib `TightNormed`.  The π-system convergence-determining
criterion and VdV&W 1.4.2 product bounded-continuous test uniqueness wrappers
are compiled.  The measurable independent-coordinate product-law convergence
wrappers `vdVWTendstoInDistribution_prodMk_laws_of_indepFun` and
`vdVWTendstoInDistribution_pi_laws_of_iIndepFun` are compiled as the ordinary
binary and finite-coordinate law layers behind VdV&W 1.4.6; the corresponding
ordinary convergence-in-distribution wrappers
`vdVWTendstoInDistribution_prodMk_of_indepFun` and
`vdVWTendstoInDistribution_pi_of_iIndepFun` are compiled too.  The current
local search also shows that the canonical infinite iid product substrate is
already compiled in `PMeasurable.lean` through `vdVWInfiniteProductMeasure`,
coordinate law, and coordinate independence wrappers, so the next fallback
should not be another duplicate infinite-product wrapper.  The
measure-level weak-convergence interface also has target-limit congruence via
`VdVWWeakConvergenceProbabilityMeasures.congr_limit` and combined
source/target congruence via
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually_limit`.
The current
Theorem 2.4.3 gap remains the exact book
random-entropy bridge: derive a real tail/UI,
uniform-integrability,
deterministic structural cardinality, or ordinary mean-convergence input from
`log N(η, F_M, L1(P_n)) = o_P^*(n)` for each fixed `η > 0`, then consume the
already compiled selected finite-net routes.  Bare outer-probability
convergence of normalized random entropy should not be treated as tail/UI.  If
that bridge is blocked after real Lean/search attempts, move to theorem-
critical Chapter 1-2 primitives rather than adding more endpoint wrappers:
arbitrary-map/nonmeasurable outer-cover weak convergence, asymptotic
tightness/independence, arbitrary-index FDD converse, and separability/
`P`-measurable class support.  The truncation/covering route now
has an additional structural support lemma: truncating by the common envelope
sublevel set does not increase fixed-sample empirical `L1(P_n)` distances or
covering numbers, via
`empiricalL1Distance_vdVWTruncatedClassFun_le`,
`FiniteEmpiricalL1CoverAtCard.truncate_vdVWTruncatedClassFun`,
`empiricalL1CoveringNumber_vdVWTruncatedClassFun_le`, and the random
cardinality adapter
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.truncated_of_original`.
This is a genuine structural/truncation bridge; it should be consumed by later
entropy/cover routes rather than followed by another endpoint alias.  The
Chapter 1 a.e.-measurable map-law layer also now has the direct bridge
`VdVWWeakConvergenceProbabilityMeasures.to_signedOuterBoundedContinuous_of_map_eq_aemeasurable`
and proof-carrying companion
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_map_eq_aemeasurable`,
so the automatic a.e.-measurable map wrapper no longer needs a countably
generated target-space detour.  Reindexed finite-dimensional restriction
wrappers for weak convergence and asymptotic tightness are compiled as
`VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict_comp_tendsto`
and
`VdVWProbabilityMeasuresAsymptoticallyTight.finiteDimensionalRestrict_comp_tendsto`.
The remaining Chapter 1 process blockers are still the arbitrary-index FDD
converse, separability/tightness/asymptotic measurability, and full
nonmeasurable outer-cover signed weak convergence.  The finite-trace
natural-polynomial route now
has a direct centered untruncated convergence consumer,
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_trace_image_cardinality_bound_nat_poly`.
The corresponding structural endpoint
`VdVWTheorem243_finite_trace_image_cardinality_bound_nat_poly_pGlivenkoCantelli_and_inMean`
now consumes that theorem through the existing centered-to-`P`-GC and in-mean
adapters.  The next non-duplicative Theorem 2.4.3 `/goal` batch should return
to the genuine book entropy tail/UI bridge, prove ordinary mean/UI/tail input
from a structural theorem, or prove a concrete VC/Sauer, finite-trace,
threshold-grid, or quantizer cardinality estimate that feeds the closed
natural-polynomial selected fixed-radius route.  The raw nearest-integer
quantizer random-cover lifts are not enough by themselves: their naive product
cardinality is exponential in the sample size, so they should be consumed only
with a real finite-code compression, VC/Sauer, or other subexponential/
natural-polynomial bound.  Do not add another endpoint alias for a closed
route unless it consumes a genuinely new theorem hypothesis.  If those
attempts are blocked after search and Lean attempts, switch to a
theorem-critical Chapter 1 process primitive: arbitrary-index FDD converse,
separability/tightness/asymptotic measurability, or nonmeasurable outer-cover
signed weak convergence.  The VdV&W 1.4.1
product Borel-space equality is
also now
compiled as `vdVW141_prod_borel_eq_product_borel`; do not repeat that wrapper.
The honest quantizer-to-selected-side bridge is now compiled under an
explicit polynomial cardinality/compression hypothesis:
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_roundingQuantizer_uniform_abs_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_roundingQuantizer_uniform_abs_bound_nat_poly`.
This should be consumed only after a real subexponential/natural-polynomial
cardinality bound is proved; the raw nearest-integer grid remains
exponential-sized in the sample length.  The route now reaches centered
untruncated convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_roundingQuantizer_uniform_abs_bound_nat_poly`,
with that structural cardinality hypothesis still explicit.  It also feeds the
book-facing variable truncated entropy condition through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_roundingQuantizer_uniform_abs_bound_nat_poly`.
The same route reaches the final local `P`-GC and in-mean package
`VdVWTheorem243_roundingQuantizer_uniform_abs_bound_nat_poly_pGlivenkoCantelli_and_inMean`.
Future quantizer progress should prove the actual compression/VC/Sauer
cardinality estimate, not another selected, entropy, or endpoint wrapper.
The signed arbitrary-map asymptotic-measurability layer now also implies the
lower-shifted/canonical shifted predicates through
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.to_lowerShifted` and
`.to_canonicalShifted`.
The same shifted/canonical interface is now available for varying-domain
endpoints through
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains`,
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains`,
and the signed varying-domain `.to_lowerShifted`/`.to_canonicalShifted`
bridges.
The threshold-signature code-set route now also has the direct untruncated
Theorem 2.4.3 consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`.
The exact coordinatewise threshold-separation trace-cardinality theorem now
also feeds selected fixed-radius side conditions directly through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_thresholds_separate_uniform_vc`
and its all-positive-`M` wrapper.
The threshold-signature approximate route consumes coordinatewise threshold
approximation and fixed-threshold VC/Sauer hypotheses through the selected
fixed-radius package and existing large-`M` untruncation.  It reaches local
`P`-GC and in-mean centered-supremum convergence through
`VdVWTheorem243_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc_pGlivenkoCantelli_and_inMean`.
The exact threshold-separation route now has the matching endpoint
`VdVWTheorem243_coordinate_thresholds_separate_uniform_vc_pGlivenkoCantelli_and_inMean`.
The next non-duplicative work is a concrete grid/quantizer/VC structural
estimate or the genuine selected empirical-entropy tail/UI bridge.  The generic
original-cover truncation
constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_original_coveringNumber_le`
is now compiled: original-class random empirical-cover domination plus the same
normalized-log convergence yields the truncated variable-domain entropy
condition by the truncation monotonicity bridge.  Next work should consume this
constructor in structural entropy/cardinality routes or prove the real
book-entropy-to-tail/UI bridge; it is not itself a final Theorem 2.4.3 endpoint.
The adjacent natural-polynomial constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_original_coveringNumber_le_nat_poly_bound`
is also compiled, so original-class empirical-cover domination plus a pointwise
polynomial cardinality bound now directly yields the truncated book entropy
side condition.  The quantizer/grid route now has random empirical-cover lifts
for nearest-integer coordinate rounding under a uniform samplewise absolute
bound:
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_roundingQuantizer_uniform_abs_bound_cardinality_bound_samplePath`
and its all-positive-radius form
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_roundingQuantizer_uniform_abs_bound_cardinality_bound_samplePath`.
2026-05-06 post-UI-endpoint search audit: the Theorem 2.4.3 selected
fixed-radius endpoint surface is exhausted for the current hypotheses.  Local
search found consumers for raw tail expectation, ordinary selected normalized
log-mean convergence, first-sample `UnifIntegrable`, first-sample `eLpNorm`
tail, bounded first-sample selected entropy, deterministic normalized-log
bounds, natural-polynomial cardinality, finite trace/code-set, threshold-code,
integer-grid/full-subgraph, finite-class, and centered-to-`P`-GC/in-mean
routes.  The remaining gap is not an alias: prove a real structural
UI/tail/mean or VC/Sauer cardinality theorem, especially an instantiation of
`VdVWUniformSubgraphVCBound` for a concrete class, or record the exact missing
class-geometry assumption.
2026-05-06 truncation trace algebra progress:
`Theorem243.lean` now proves the threshold-trace identities
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter`,
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter_of_nonneg`,
and
`empiricalBinaryTraceSet_thresholdIndicator_vdVWTruncatedClassFun_eq_filter_of_neg`.
These are upstream of the full-subgraph route: they expose exactly how
`f 1{F <= M}` modifies threshold traces, reducing the next structural task to
a finite set-family cardinality/VC transfer under fixed masks.
2026-05-06 fixed-mask cardinality transfer:
`Theorem243.lean` now adds `vdVWTraceMaskTransform`,
`vdVWTraceMaskTransform_image_card_le`, and the all-threshold truncated
threshold-family cardinality bound
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le`
with its nonnegative/negative specializations
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_of_nonneg`
and
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_le_of_neg`.
It also adds
`empiricalBinaryTraceSetFamily_thresholdIndicator_vdVWTruncatedClassFun_card_add_one_real_le_nat_poly_of_original_vc`,
which transfers a fixed-threshold original VC/Sauer bound to the truncated
threshold-trace family.  The product/code-set layer and selected fixed-radius
consumer are now compiled too:
`threshold_binaryTraceSetFamily_product_card_le_truncated_of_original_uniform_vc`,
`thresholdTraceCodeSet_vdVWTruncatedClassFun_card_add_one_real_le_original_uniform_vc`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`,
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`.
The original-VC threshold-code package now reaches the untruncated centered
Theorem 2.4.3 convergence endpoint through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_thresholdTraceCode_coordinate_approx_codeSet_original_uniform_vc`.
The integer-grid selected fixed-radius package now also works with original
fixed-threshold VC/Sauer bounds through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_integerMultipleThresholdGrid_uniform_abs_bound_original_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_integerMultipleThresholdGrid_uniform_abs_bound_original_vc`.
The canonical envelope/grid original-VC route is now available for both
selected fixed-radius side conditions and variable-domain book entropy,
including the uniform original threshold-VC and original full-subgraph-VC
specializations.  It now also reaches centered untruncated convergence via
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_integerMultipleThresholdGrid_uniform_envelope_canonical_original_full_subgraph_vc`,
with the usual analytic side conditions kept explicit.  Those analytic
side-condition/integrable witnesses are now discharged by the compiled
original full-subgraph route
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable`,
its iid-Rademacher variant, and the canonical endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_originalFullSubgraph_integrable_canonical`.
That centered endpoint is now consumed in the finite-product uniform-deviation
and canonical outer-probability `P`-GC endpoints
`VdVWOuterProbabilityUniformDeviationConstOn_of_originalFullSubgraph_integrable_canonical`
and
`VdVWOuterProbabilityPGlivenkoCantelliClass_of_originalFullSubgraph_integrable_canonical`.
The same original full-subgraph hypothesis now also reaches in-mean
centered-supremum convergence through
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_originalFullSubgraph_integrable_tailExpectation_of_countable_canonical`,
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_originalFullSubgraph_integrable_of_countable_canonical`,
and the combined local `P`-GC/in-mean package
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_and_inMean_canonical`.
It now also reaches the fixed-product Lemma 2.4.5 centered-supremum layer and
the current strongest original-class endpoint through
`tendsto_integral_vdVWLemma245CenteredEmpiricalSupremum_zero_of_originalFullSubgraph_integrable_canonical`,
`VdVWConvergesInOuterProbability_vdVWLemma245CenteredEmpiricalSupremum_zero_of_originalFullSubgraph_integrable_canonical`,
`vdVW_lemma245_centeredEmpiricalSupremum_ae_tendsto_zero_of_originalFullSubgraph_integrable_canonical_of_countable_integrable`,
`VdVWAlmostSureGlivenkoCantelliClass_of_originalFullSubgraph_integrable_canonical_of_countable_integrable`,
and
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_of_countable_integrable`.
The original-class strong package now also has the empty-class branch
`VdVWTheorem243_originalFullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`.
The next useful `/goal` target is not another alias for this same route:
prove a genuinely new class-geometry/cardinality theorem, add a final theorem
statement only if it consumes a new proof input, or return to the book
random-entropy tail/UI/mean bridge.
The a.e.-measurable map-law bridge is now also available for common-domain
arbitrary maps and varying-domain endpoints through
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.of_forall_aemeasurable`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.of_forall_aemeasurable`,
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_maps_aemeasurable`,
and
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_maps_aemeasurable`.
Mathlib `TendstoInDistribution` and common-domain outer-probability
convergence can now feed the same local signed arbitrary-map package under
a.e.-measurability, via
`vdVWTendstoInDistribution_to_signedBoundedContinuousArbitraryMap_aemeasurable`
and
`VdVWConvergesInOuterProbability.to_signedBoundedContinuousArbitraryMap_aemeasurable`.
The same direct feeder is now available for sample-size-varying mathlib
`TendstoInDistribution` through
`vdVWTendstoInDistribution_to_signedBoundedContinuousVaryingDomains_aemeasurable`.
The `HasLaw` feeder also no longer needs pointwise measurability:
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousArbitraryMap_of_hasLaw_aemeasurable`
and
`VdVWWeakConvergenceProbabilityMeasures.to_signedBoundedContinuousVaryingDomains_of_hasLaw_aemeasurable`
consume mathlib `HasLaw.aemeasurable` and `HasLaw.map_eq` directly.
The signed arbitrary-map product-coordinate layer is now also compiled:
signed positive/negative outer expectation, signed outer/inner gaps, signed
outer weak convergence, and the proof-carrying signed arbitrary-map package
are invariant under adjoining an ignored probability product coordinate,
under a.e.-measurability of the original maps.
The same ignored-product-coordinate closure is now available for the
varying-domain signed weak-convergence package used by finite-sample
Theorem 2.4.3 endpoints.

2026-05-05 finite-class Theorem 2.4.3 package follow-up:
`Theorem243.lean` now exposes the direct finite-class route in the same
textbook-facing shape as the strongest full-subgraph package through
`VdVWTheorem243_finite_indexClass_textbookAligned_canonical_slln`.  The
compiled theorem packages finite-class `P`-measurability, finite measurable
integrable-envelope outer expectation, outer-probability `P`-GC, outer-a.s.
`P`-GC, local `P`-GC, in-mean centered-supremum convergence, and Lemma 2.4.5
a.s. centered-supremum convergence.  A 2026-05-08 cleanup removed the exposed
nonempty-class assumption by splitting off the empty class directly.  This is a
closed finite-class building block; the main non-finite Theorem 2.4.3 gap
remains the book random-entropy tail/UI or structural cardinality bridge.

2026-05-05 first-sample entropy-tail follow-up:
`Theorem243.lean` now exposes
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_unifIntegrable`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_eLpNormTail`.
These theorems consume the variable-domain book entropy package plus either
lifted selected normalized-entropy `UnifIntegrable` or the concrete `eLpNorm`
tail criterion on the canonical infinite iid product space, then reach
untruncated centered convergence through the compiled selected fixed-radius
and large-`M` handoffs.  The remaining non-finite Theorem 2.4.3 gap is
therefore sharper: prove that explicit first-sample selected-entropy UI/tail
condition, or prove a structural cardinality/VC/finite-trace bound that
implies it.
The canonical `P`-GC endpoint also now has the reusable bridge
`VdVWPGlivenkoCantelliClass_of_centered_weightedSupremum_convergesInOuterProbabilityConst`,
which packages the centered finite-product convergence to uniform-deviation
and infinite-product projection handoff for all current Theorem 2.4.3 routes.
The in-mean endpoint has the analogous reusable adapter
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_integrable_envelope`,
which upgrades centered convergence to ordinary mean convergence under the
standard countable-coordinate and integrable-envelope hypotheses.
The deterministic structural version of the first-sample entropy route is now
compiled too:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_firstSample_nnnorm_bound`
turns a uniform bound on the lifted selected normalized empirical-cover
entropy into untruncated centered convergence.
The coordinate-code structural route now also reaches the selected fixed-radius
side-condition package:
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_logCardinality_div_tendsto_bound`
and its all-positive-`M` wrapper consume finite coordinate code-set products
and deterministic normalized log-cardinality rates.  The route now also has
the untruncated centered convergence consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_logCardinality_div_tendsto_bound`.
It also has the natural-polynomial structural-cardinality package and endpoint:
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_coordinate_pointwise_approx_code_product_cardinality_bound_nat_poly`,
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_coordinate_pointwise_approx_code_product_nat_poly`.
The next useful proof step is a concrete quantizer/grid/VC cardinality estimate
feeding that natural-polynomial hypothesis, or the broader selected entropy
tail/UI theorem.
The structural input is now fed by two reusable bridges:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.firstSample_nnnorm_bound_of_logCardinality_div_bound`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.firstSample_nnnorm_bound_of_logCardinality_nat_poly_bound`.
The natural-polynomial route now also feeds the selected fixed-radius
tail/UI package directly through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_nat_poly_bound`,
so structural VC/Sauer and grid routes no longer need to expose the
intermediate first-sample `nnnorm` hypothesis by hand.
The variable-domain entropy package itself now also has the direct constructor
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_nat_poly_bound`,
so the same pointwise natural-polynomial cardinality estimate supplies the
book-facing entropy condition and the selected tail/UI package.
Finite trace images and trace-code sets also now feed the same entropy layer
through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_image_cardinality_bound_nat_poly`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_codeSet_cardinality_bound_nat_poly`.
The threshold VC/Sauer routes now have entropy-side constructors as well:
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_coordinate_thresholds_separate_uniform_vc`.
The canonical integer-grid/full-subgraph VC route also now feeds the
variable-domain book entropy condition through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_integerMultipleThresholdGrid_uniform_envelope_canonical_full_subgraph_vc`.
Thus deterministic normalized-log bounds, including natural-polynomial
VC/Sauer-style cardinality growth, now supply the first-sample `nnnorm`
condition directly.  The next non-finite theorem task is upstream: prove such
cardinality bounds for the selected empirical-cover entropy from the actual
textbook structural class hypotheses, or prove the genuinely random
first-sample `eLpNorm` tail/UI condition.

2026-05-05 finite pointwise-code covering follow-up:
`Theorem243.lean` now lifts the existing `CoveringPrimitive.lean` finite
pointwise-code empirical-cover lemmas into the random empirical covering-number
interface through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_finite_pointwise_approx_code_cardinality_bound_samplePath`
and
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_forall_pos_radius_finite_pointwise_approx_code_cardinality_bound_samplePath`.
This gives quantized-trace/finite-code entropy arguments a direct structural
input to the selected fixed-radius Theorem 2.4.3 routes.
`Theorem243.lean` now also consumes that lift through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_code_cardinality_bound_logCardinality_div_tendsto_bound`
and the all-positive-truncation wrapper
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_code_cardinality_bound_logCardinality_div_tendsto_bound`.
The same finite-code input now reaches centered untruncated convergence through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_finite_pointwise_approx_code_logCardinality_div_tendsto_bound`.
The remaining work is to prove deterministic log-cardinality, VC/Sauer, or
tail/UI bounds for such code images; this selected-package bridge should not
be rediscovered.
2026-05-06 follow-up: finite pointwise-code arguments can now feed polynomial
cardinality bounds directly through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_code_cardinality_bound_nat_poly`
and its all-positive-`M` wrapper.  The concrete code-set variants
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_pointwise_approx_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_pointwise_approx_codeSet_cardinality_bound_nat_poly`
also discharge finite-image and domination fields from membership in a
supplied `Finset` code set.  The next non-duplicative step is a concrete
finite-code/VC/Sauer/quantizer theorem supplying those polynomial bounds.
The trace-code analogue is now available too:
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_finite_trace_codeSet_cardinality_bound_nat_poly`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_finite_trace_codeSet_cardinality_bound_nat_poly`
consume an injective finite code on the realized empirical trace image plus a
natural-polynomial code-set cardinality estimate.

2026-05-05 separability/`P`-measurability follow-up:
`PMeasurable.lean` now adds
`VdVWPMeasurableClass.of_pointwiseApproximableByCountableSubclass_of_bddAbove`,
the direct handoff from the literal countable pointwise-approximability
separability hypothesis plus bounded finite weighted value sets to
Definition 2.3.3 `P`-measurability.  This closes the local theorem-facing
combination of the previously proved pointwise-approximability-to-supremum
equality bridge and the countable-subclass `P`-measurability constructor; the
remaining separability/process gap is the full arbitrary-map/nonmeasurable
asymptotic-measurability and weak-convergence layer, not this bounded
measurable-subclass route.

2026-05-05 continuous-image asymptotic-tightness follow-up:
`WeakConvergence.lean` now composes the existing sequential
weak-convergence-to-asymptotic-tightness theorem with the continuous-map and
reindexing stability layers as
`VdVWWeakConvergenceProbabilityMeasures.map_asymptoticallyTight_atTop` and
`VdVWWeakConvergenceProbabilityMeasures.map_asymptoticallyTight_comp_tendsto_atTop`.
This closes the measure-level continuous-image/reindexed tightness handoff for
complete second-countable pseudometric Borel source spaces; the arbitrary-map
process asymptotic-tightness theorem remains a separate primitive.

2026-05-05 tightness sequence follow-up: `WeakConvergence.lean` now wraps
mathlib's sequence/range norm-tail criterion as
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_norm_tail` and
`vdVWProbabilityMeasuresTight_range_iff_tendsto_limsup_norm_tail`.  This
closes a reusable Chapter 1 Prokhorov/tightness foundation for sequential
probability-measure families on proper normed Borel spaces; it deliberately
does not claim the still-missing arbitrary-map/asymptotic-tightness theorem.

2026-05-05 closed-ball tightness follow-up: `WeakConvergence.lean` now also
wraps mathlib's proper pseudo-metric closed-ball tightness criterion as
`VdVWProbabilityMeasuresTight.tendsto_closedBall_compl`,
`vdVWProbabilityMeasuresTight_of_tendsto_closedBall_compl`, and
`vdVWProbabilityMeasuresTight_iff_tendsto_closedBall_compl`.  This closes the
closed-ball form underlying the norm-tail route for measure-level Chapter 1
tightness; arbitrary-map/asymptotic tightness remains the real blocker.

2026-05-05 finite-dimensional tightness follow-up: local search found
mathlib's finite-dimensional inner-product tightness APIs in
`Mathlib.MeasureTheory.Measure.TightNormed`.  `WeakConvergence.lean` now wraps
the family and sequence/range forms as
`vdVWProbabilityMeasuresTight_of_forall_inner_tendsto`,
`vdVWProbabilityMeasuresTight_iff_forall_inner_tendsto`,
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_inner`, and
`vdVWProbabilityMeasuresTight_range_iff_tendsto_limsup_inner`.  These are
measure-level FDD/Hilbert-coordinate tightness foundations; arbitrary-map
asymptotic tightness remains open.

2026-05-05 finite-dimensional unit-tail follow-up: the remaining adjacent
mathlib sequence criteria in `TightNormed` are now wrapped too:
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_inner_of_norm_eq_one`
uses only unit-vector projection tails, and
`vdVWProbabilityMeasuresTight_range_of_tendsto_limsup_measureReal_inner_of_norm_eq_one`
uses real-valued measure tails with the probability total-mass bound discharged
locally.  This completes the current mathlib-backed finite-dimensional
inner-product tightness wrapper batch.

2026-05-05 raw bounded-process FDD follow-up: the finite-dimensional
`ell_infty(T)` process substrate now accepts raw bounded sample-path processes
directly.  `EllInfty.lean` adds
`VdVWEllInfty.finiteRestrict_processMap_apply`, and
`FiniteDimensional.lean` adds
`vdVW148_boundedProcess_finiteDimensional_hasLaw`,
`vdVW148_boundedProcess_finiteDimensional_identDistrib`, and
`vdVW148_boundedProcess_finiteDimensional_tendstoInDistribution`.  These are
forward FDD wrappers through `VdVWEllInfty.processMap`; arbitrary-index
separability/asymptotic-tightness and FDD-converse primitives remain open.

2026-05-05 finite-index raw-process converse follow-up: the raw bounded
process layer now also has the finite-index converse entry point
`vdVW148_boundedProcess_tendstoInDistribution_of_finiteProduct_tendstoInDistribution_finite`,
with `VdVWEllInfty.finiteContinuousLinearEquiv_processMap_apply` exposing the
finite equivalence on process maps.  For finite `T`, ordinary finite-product
convergence of raw processes now yields `ell_infty(T)` convergence; the
arbitrary-index converse remains a separability/tightness/asymptotic-
measurability problem.

2026-05-05 finite-index raw-process law follow-up:
`vdVW148_boundedProcess_hasLaw_of_finiteProduct_hasLaw_finite` and
`vdVW148_boundedProcess_identDistrib_of_finiteProduct_identDistrib_finite`
now lift finite-product law and identical-distribution statements for raw
bounded processes to their `ell_infty(T)` process maps.  This completes the
finite-index raw law/IdentDistrib bridge; arbitrary-index FDD converse remains
open.

2026-05-05 finite-product law weak-convergence follow-up:
`vdVW148_ellInfty_map_symm_weakConvergence_of_finiteProduct_weakConvergence_finite`
now lets weak convergence of ordinary finite-product laws on `T -> ℝ` feed
weak convergence of the corresponding finite-index `ell_infty(T)` laws.

2026-05-05 measure-level asymptotic tightness follow-up:
`VdVWProbabilityMeasuresAsymptoticallyTight` is now defined for probability
measure families along a filter, with feeders from tight ambient families and
tight ranges plus continuous-map stability.  This closes an ordinary
measure-level Chapter 1 foundation name; arbitrary-map process asymptotic
tightness remains open.
Direct null/a.e.-measurable constructors are now also available for the
lower-shifted/canonical shifted bounded-continuous predicates in both
common-domain and varying-domain forms.  The direct signed positive/negative
a.e.-measurable integral collapse and signed outer/inner-gap collapse are now
compiled too, so the a.e.-measurable signed asymptotic-measurability
constructors no longer need to detour through a countably-generated
null-measurable conversion.
The Chapter 1.2 product outer-expectation lane also now has nonnegative
a.e.-measurable and measurable Tonelli wrappers for both integration orders,
using mathlib `lintegral_prod`/`lintegral_prod_symm`.
The dominated common-cover lane for Lemma 1.2.4 now has its nonnegative
a.e.-measurable core: covers built under a dominating measure transport to
minimal covers for absolutely continuous measures, and the same cover is now
packaged as a simultaneous common cover for dominated measure families.
The bounded extended-real measurable case is also compiled: a bounded
measurable `EReal` map is a common minimal cover for every measure family.
The same bounded extended-real lane now has the dominated a.e.-measurable
family theorem, so a single cover built under a dominating measure is
simultaneously minimal for all absolutely continuous measures in the family.
Lemma 1.2.5 now has a compiled measurable-target core: first and second
coordinate product pullbacks of a nonnegative measurable cover remain minimal
measurable covers on the product space.
The corresponding probability-product outer-expectation invariance is also
compiled for first and second coordinate pullbacks.
The same invariance now also has a.e.-measurable target variants, covering the
null-measurable product-coordinate cases used by outer-expectation arguments.
The matching inner-expectation invariance is now compiled for measurable and
a.e.-measurable first/second coordinate pullbacks, so the Chapter 1.2
product-projection lane has both nonnegative outer and inner expectation
forms under ordinary measurable/null-measurable hypotheses.

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

2026-05-05 fixed-domain UI follow-up: the common-domain Vitali route is now
compiled in VdV&W notation as
`tendsto_eLpNorm_one_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable`.
It translates common-domain outer-probability convergence to mathlib
`TendstoInMeasure` and applies `tendsto_Lp_finite_of_tendstoInMeasure`.
The nonnegative ordinary-mean consumer
`tendsto_integral_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable_nonneg`
is compiled as well, and the signed ordinary-mean consumer
`tendsto_integral_of_VdVWConvergesInOuterProbability_zero_of_unifIntegrable`
now handles centered real processes by bounding `‖∫ Y_n‖` with the `L1` norm.
These are useful for any common-space recoding of entropy processes, but they
do not by themselves close Theorem 2.4.3 because the selected empirical-cover
cardinality processes currently live on varying finite-product sample spaces.

2026-05-05 first-sample event recoding follow-up: `PMeasurable.lean` now adds
`vdVWInfiniteProductMeasure_firstNSample_preimage_eq` and
`vdVWInfiniteProductMeasure_firstNSample_real_tail_eq`.  These lift measurable
finite-product events and real-valued measurable tail events to the canonical
infinite iid product space with equal probability, complementing the existing
`integral_vdVWInfiniteProductMeasure_firstNSample`.  This helps any honest
common-space recoding route, but arbitrary nonmeasurable outer events remain a
separate primitive.

2026-05-05 convergence recoding follow-up: the event equality now has a
compiled convergence-level interface:
`VdVWConvergesInOuterProbability_firstNSample_real_of_const`,
`VdVWConvergesInOuterProbabilityConst_of_firstNSample_real`, and
`vdVWConvergesInOuterProbability_firstNSample_real_iff_const`.  Measurable real
finite-sample statistics can therefore move back and forth between varying
finite-product outer-probability convergence and common-domain convergence on
the canonical infinite iid product space.  This narrows the common-space/UI
route to measurability and uniform-integrability/tail control for the selected
entropy statistics.

2026-05-05 UI mean recoding follow-up: the common-space route now reaches
ordinary finite-product means through
`tendsto_integral_vdVWProductMeasure_of_VdVWConvergesInOuterProbabilityConst_firstNSample_unifIntegrable`.
For measurable finite-sample real statistics, finite-product outer-probability
convergence plus uniform integrability of their infinite-product first-sample
lifts implies convergence of the finite-product integrals.  The remaining
Theorem 2.4.3 entropy problem is the substantive one: prove UI/tail or a
structural cardinality bound for the selected normalized empirical-cover
entropy.

2026-05-05 selected UI package follow-up: the fixed-domain UI route now feeds
the selected fixed-radius Theorem 2.4.3 side-condition package through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_unifIntegrable`.
This theorem composes the selected-cardinality monotonicity bridge, first-sample
convergence recoding, fixed-domain UI mean bridge, and existing mean-to-tail
adapter.  The remaining proof obligation is to establish the actual UI/tail or
structural bound for the selected normalized empirical-cover entropy.

2026-05-05 selected `eLpNorm` tail follow-up: the fixed-domain UI route now
also has a direct mathlib-tail criterion consumer,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_eLpNormTail`.
It applies mathlib `MeasureTheory.unifIntegrable_of` to the first-sample lifted
selected entropy process and then reuses the compiled first-sample UI package.
The current target is therefore the substantive entropy estimate itself:
prove the lifted selected normalized-log empirical-cover `eLpNorm` tail
condition, or derive it from a structural VC/finite-trace/cardinality theorem.

2026-05-05 bounded first-sample tail follow-up: the deterministic support
route into that criterion is now compiled.  The reusable lemma
`eLpNorm_one_tail_condition_of_nnnorm_bound` proves the fixed-domain `L¹`
large-tail condition from a uniform pointwise `nnnorm` bound, and
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.toSelectedFixedRadiusTailSideConditions_of_logCardinality_div_firstSample_nnnorm_bound`
feeds a bound on the first-sample lifted selected entropy process into the
selected fixed-radius Theorem 2.4.3 side-condition package.  The remaining
mathematical work is to prove such a bound, or a sharper tail estimate, from
the actual entropy/VC/trace hypotheses.

2026-05-05 Chapter 1 arbitrary-map follow-up: the varying-domain signed
bounded-continuous weak-convergence package now has continuous-mapping
stability.  The new declarations
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.comp_continuous`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.comp_continuous`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.comp_continuous`
match the existing common-domain continuous-mapping layer and are reusable for
sample-size-varying Chapter 1 endpoints and Theorem 2.4.3 pushforwards.  This
does not close the deeper nonmeasurable outer-cover, asymptotic-tightness,
asymptotic-independence, FDD-converse, or separability/`P`-measurable class
primitives.

2026-05-05 signed filter-refinement follow-up: the signed weak-convergence
packages now have filter-refinement stability:
`VdVWWeakConvergenceSignedOuterBoundedContinuous.mono_filter`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.mono_filter`,
`VdVWWeakConvergenceSignedOuterBoundedContinuousVaryingDomains.mono_filter`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuousVaryingDomains.mono_filter`,
and
`VdVWWeakConvergenceSignedBoundedContinuousVaryingDomains.mono_filter`.
This closes the already isolated sample-size/index-filter stability gap for
Chapter 1 arbitrary-map weak-convergence packages; remaining Chapter 1 work is
the deeper nonmeasurable outer-cover, asymptotic-tightness/independence,
FDD-converse, and separability/`P`-measurable class support.

2026-05-05 FDD forward-direction follow-up: `FiniteDimensional.lean` now
exports the VdV&W 1.4.8-named forward weak-convergence handoff
`vdVW148_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`,
reusing the compiled finite-coordinate restriction theorem for probability
measures.  This strengthens the Section 1.4 local layer without claiming the
still-missing FDD weak-convergence converse.

2026-05-05 base filter-refinement follow-up: the Chapter 1 convergence
foundations now have filter-refinement stability at the base level.
`GlivenkoCantelli.lean` adds
`VdVWConvergesInOuterProbabilityConst.mono_filter` and
`VdVWConvergesInOuterProbability.mono_filter`; `WeakConvergence.lean` adds
`VdVWWeakConvergenceProbabilityMeasures.mono_filter`.  These close the common
subsequence/finer-filter plumbing for Definition 1.10 outer-probability
convergence and measure-level weak convergence, matching the already compiled
signed arbitrary-map refinement wrappers.

2026-05-05 bounded-continuous uniqueness follow-up: `WeakConvergence.lean` now
exports the VdV&W 1.3.12(i)-named finite-measure uniqueness wrapper
`vdVW1312_measure_ext_of_forall_boundedContinuous_integral_eq`, proved by
mathlib's
`MeasureTheory.ext_of_forall_integral_eq_of_IsFiniteMeasure`.  This closes the
finite-Borel-measure bounded-continuous integral determination direction under
the standard `HasOuterApproxClosed` hypothesis.  The vector-lattice/tight
1.3.12(ii) measure-level variant is now compiled as
`VdVWWeakConvergenceProbabilityMeasures.of_tight_of_separating_starSubalgebra`,
reusing pinned mathlib's tight separating star-subalgebra convergence theorem.

2026-05-10 separating-subalgebra uniqueness follow-up:
`WeakConvergence.lean` now also exports
`vdVW1312_measure_ext_of_forall_separating_starSubalgebra_integral_eq`, a
finite-measure Polish-space uniqueness wrapper for point-separating star
subalgebras of bounded continuous `𝕜`-valued functions.  This reuses pinned
mathlib's
`MeasureTheory.ext_of_forall_mem_subalgebra_integral_eq_of_polish` and closes
the measure-level separating-class uniqueness half of VdV&W 1.3.12(ii).  The
remaining 1.3.12 gap is the exact arbitrary-map/nonmeasurable formulation, not
the measure-level Borel/Polish uniqueness theorem.

2026-05-05 bounded-continuous generated-sigma follow-up:
`WeakConvergence.lean` now exports the VdV&W 1.3.1 generated-sigma wrappers
`vdVW131_measurableSet_isClosed_of_forall_boundedContinuous_measurable`,
`vdVW131_borel_le_of_forall_boundedContinuous_measurable`, and
`vdVW131_borel_le_iff_forall_boundedContinuous_measurable`.  These formalize
the metric-space distance-to-closed-set proof that Borel is the least
sigma-field making all bounded-continuous real functions measurable.

2026-05-05 tightness component follow-up: `WeakConvergence.lean` now exports
`vdVW132_complete_separable_probabilityMeasure_tight`, a VdV&W 1.3.2-named
wrapper for the complete separable metric-type probability-measure tightness
direction.  The full pre-tight/separable/tight/Polish-measure equivalence
still needs local definitions before it can be marked exact.

2026-05-05 product Borel-space follow-up: `FiniteDimensional.lean` now exports
`vdVW141_prod_borel_eq_product_borel`, proving the VdV&W 1.4.1 product
Borel-space equality for separable pseudometric Borel spaces.  The exact
1.4.2 product-test uniqueness is compiled in bounded-continuous form and now
also in nonnegative bounded-continuous `NNReal`/lintegral form as
`vdVW142_prod_measure_ext_of_forall_nnreal_boundedContinuous_lintegral_mul`
and
`vdVW142_prod_measure_eq_prod_of_forall_nnreal_boundedContinuous_lintegral_mul`;
the exact real nonnegative-Lipschitz spelling is a source-alignment
refinement, not a missing product-law primitive.

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
| Definition 1.3.3 / Definition 1.3.7 / Theorem 1.3.4 / Theorem 1.3.6 / Theorem 1.3.9 / Section 1.4 | Measure-level weak convergence of probability measures, bounded-continuous and bounded-Lipschitz integral characterizations, Levy-Prokhorov distance characterizations, Portmanteau closed/open implications, probability-measure tightness compact-set characterization, Prokhorov compact-closure wrapper, continuous-map pushforward, binary and finite product-law weak convergence, finite-coordinate restriction/FDD forward wrapper plus VdV&W 1.4.8-named forward wrapper, process-law and `IdentDistrib` uniqueness-only FDD wrappers, convergence-in-distribution continuous mapping including `vdVW1111_tendstoInDistribution_continuous_comp`, measurable common-domain Slutsky/product convergence wrappers, binary and finite-coordinate measurable independent-coordinate product-law and convergence-in-distribution wrappers, a nonnegative asymptotic-measurability primitive whose outer/inner expectation gap vanishes for measurable test compositions, lower-shifted real / bounded-continuous versions for measurable maps, a canonical bounded-continuous shift `-‖f‖` version, selected-test monotonicity and arbitrary-map pullback closures for nonnegative/lower-shifted predicates, continuous-map closure for shifted bounded-continuous predicates, filter-refinement closure for local asymptotic-measurability predicates, signed positive/negative outer-expectation bridges for measurable real maps and bounded-continuous test compositions, a signed bounded-continuous positive/negative outer-inner gap predicate, signed bounded-continuous asymptotic-measurability predicate with measurable-map/filter/continuous closures, proof-carrying signed bounded-continuous arbitrary-map weak-convergence package whose map-law, `HasLaw`, common-domain `TendstoInDistribution`, common-domain outer-probability convergence, `vdVW1111_signedBoundedContinuousArbitraryMap_comp_continuous`, filter-refinement, and ignored product-coordinate cases follow from the measure-level weak-convergence/law and product-projection APIs, and varying-domain signed bounded-continuous weak-convergence/asymptotic-measurability packages with map-law, null-measurable, automatic-pushforward, `vdVW1111_signedBoundedContinuousVaryingDomains_comp_continuous`, filter-refinement, and ignored product-coordinate feeders for sample-size-varying endpoints | Full VdV&W nonmeasurable outer-cover signed extended-real weak convergence, asymptotic-tightness, asymptotic-independence, and FDD weak-convergence converse versions remain separate blocked primitives. |
| Lemma 1.7.1 | Open-ball and closed-ball sigma-field wrappers, open-ball topological basis, rational open/closed ball bridges, open-ball/closed-ball sigma equality, Borel equality, generator measurability, separable dense-sequence distance-coordinate measurability iff, and bounded distance-coordinate measurability iff in `BallSigma.lean` | Full arbitrary-map/asymptotic-measurability clauses remain pending. |
| Section 1.8 | Hilbert/L2/Gaussian foundation wrappers: complete inner-product spaces as Hilbert spaces, `L2` Hilbert space and inner product, Frechet-Riesz dual representative, Gaussian inner-coordinate maps, and Gaussian-process coordinate laws in `HilbertGaussian.lean` | Full VdV&W Hilbert tightness/asymptotic-measurability, Brownian bridge/pre-Gaussian, and functional CLT/Donsker statements still require local process primitives. |
| Definition 1.10.1 | Outer-probability convergence primitives and common-domain `TendstoInMeasure` bridge | Broader arbitrary-map API. |
| Lemma 1.10.2 | Measurable common-domain weak-convergence bridge now named as `vdVW1102_ii_tendstoInDistribution_of_vdVWConvergesInOuterProbability`, with proof-carrying signed bounded-continuous arbitrary-map consequence `vdVW1102_ii_to_signedBoundedContinuousArbitraryMap_aemeasurable` | Full VdV&W arbitrary-map/measurable-cover version. |
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

2026-05-05 process-space foundation update: the `ell_infty(T)` substrate is
now locally named and connected to finite-dimensional restrictions.  New
compiled declarations in `StatInference/EmpiricalProcess/EllInfty.lean`
include `VdVWEllInfty`, `VdVWEllInfty.ofBounded`,
`VdVWEllInfty.evalCLM`, `VdVWEllInfty.processMap`, and
`VdVWEllInfty.continuous_finiteRestrict`; `FiniteDimensional.lean` adds
`vdVW148_ellInfty_finiteDimensional_weakConvergence_of_processLaw_weakConvergence`,
`vdVW148_ellInfty_finiteDimensional_hasLaw`,
`vdVW148_ellInfty_finiteDimensional_identDistrib`, and
`vdVW148_ellInfty_finiteDimensional_tendstoInDistribution`.
This closes the safe mathlib-backed bounded-process/FDD forward substrate for
laws, identical distributions, and random-variable convergence in
distribution.  Remaining Chapter 1 process blockers are
separability/asymptotic tightness, the FDD weak-convergence converse, and
arbitrary-map/nonmeasurable outer-cover weak-convergence primitives.

2026-05-05 finite-index process follow-up: `EllInfty.lean` now adds
`VdVWEllInfty.finiteContinuousLinearEquiv`, identifying finite
`ell_infty(T)` with the ordinary product `T -> ℝ` through mathlib's
`lpPiLpₗᵢ` and `PiLp.continuousLinearEquiv`.  This is a finite-index
FDD-converse substrate, not the arbitrary-index VdV&W 1.4.8 converse.

2026-05-05 finite-dimensional asymptotic-tightness follow-up:
`VdVWProbabilityMeasuresAsymptoticallyTight.finiteDimensionalRestrict` now
pushes ordinary asymptotic tightness through finite-coordinate restrictions.
`FiniteDimensional.lean` also has the `ell_infty(T)` finite-coordinate and
finite-index asymptotic-tightness wrappers.  This closes the finite-dimensional
measure-level tightness feeder; arbitrary-index process asymptotic tightness,
separability, and nonmeasurable/arbitrary-map weak-convergence primitives
remain open.

2026-05-05 product asymptotic-tightness follow-up:
`VdVWProbabilityMeasuresAsymptoticallyTight.prod` now proves binary product
stability for ordinary measure-level asymptotic tightness.  This closes a
Chapter 1 product/tightness support lemma; arbitrary-map
asymptotic-independence is still open.

2026-05-05 asymptotic-tightness filter-stability follow-up:
`VdVWProbabilityMeasuresAsymptoticallyTight.mono_filter` and
`VdVWProbabilityMeasuresAsymptoticallyTight.congr_eventually` now support
subsequence/finer-filter and eventually-equal law-family transfers for the
ordinary measure-level asymptotic-tightness predicate.

2026-05-05 asymptotic-tightness reindexing follow-up:
`VdVWProbabilityMeasuresAsymptoticallyTight.comp_tendsto` now pulls ordinary
asymptotic tightness back along any index map tending to the original filter,
covering the basic net/subsequence reindexing use case.

2026-05-05 weak-convergence-to-tightness follow-up:
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_atTop` now proves
that sequential weak convergence of probability measures implies ordinary
measure-level asymptotic tightness in complete second-countable pseudo-metric
Borel spaces.

2026-05-05 weak-convergence tightness reindex/product follow-up:
`VdVWWeakConvergenceProbabilityMeasures.asymptoticallyTight_comp_tendsto_atTop`
now combines sequential weak convergence with any reindexing map tending to
`atTop`, and `VdVWWeakConvergenceProbabilityMeasures.pi_asymptoticallyTight_atTop`
combines finite product-law weak convergence with the ordinary measure-level
asymptotic-tightness consequence.  The adjacent binary/reindexed consumers
`VdVWWeakConvergenceProbabilityMeasures.prod_asymptoticallyTight_atTop`,
`VdVWWeakConvergenceProbabilityMeasures.prod_asymptoticallyTight_comp_tendsto_atTop`,
and
`VdVWWeakConvergenceProbabilityMeasures.pi_asymptoticallyTight_comp_tendsto_atTop`
are also compiled.  These close the binary and finite-product
weak-convergence-to-tightness feeders, while the exact arbitrary-map/process
asymptotic-tightness, asymptotic-independence, and arbitrary-index FDD converse
remain open.

2026-05-05 signed congruence / centered measurability / coordinate-law batch:
`WeakConvergence.lean` now has eventual-equality transport for the signed
common-domain and varying-domain weak-convergence/asymptotic-measurability
packages:
`VdVWWeakConvergenceSignedOuterBoundedContinuous.congr_eventually`,
`VdVWAsymptoticallyMeasurableSignedBoundedContinuous.congr_eventually`,
`VdVWWeakConvergenceSignedBoundedContinuousArbitraryMap.congr_eventually`, and
the three corresponding varying-domain declarations.  `PMeasurable.lean` adds
`VdVWPMeasurableClass.centered_of_countable_of_coordinate`, giving a direct
countable coordinate-measurable route to centered Definition 2.3.3
`P`-measurability for Theorem 2.4.3 endpoints.  `Theorem243.lean` now consumes
that bridge in
`VdVWTheorem243_centered_untruncated_weakConvergenceProbabilityMeasures_map_dirac_real_of_countable_coordinate_convergesInOuterProbabilityConst`
and
`VdVWTheorem243_centered_untruncated_signedWeakConvergenceVaryingDomains_real_of_countable_coordinate_convergesInOuterProbabilityConst`.
`FiniteDimensional.lean` adds
`vdVW148_ellInfty_coordinate_hasLaw`,
`vdVW148_ellInfty_coordinate_identDistrib`, and
`vdVW148_ellInfty_coordinate_tendstoInDistribution`, plus the raw
bounded-process coordinate forms `vdVW148_boundedProcess_coordinate_hasLaw`,
`vdVW148_boundedProcess_coordinate_identDistrib`, and
`vdVW148_boundedProcess_coordinate_tendstoInDistribution`.  These close the
direct one-coordinate process/FDD entry points; they do not close the exact
random-entropy tail/UI bridge or the arbitrary-index process/FDD converse.

2026-05-05 coordinate weak-convergence/tightness follow-up:
`FiniteDimensional.lean` now also adds the generic dependent-product wrappers
`vdVW148_coordinate_weakConvergence_of_processLaw_weakConvergence` and
`vdVW148_coordinate_asymptoticallyTight_of_processLaw_asymptoticallyTight`,
plus the `ell_infty(T)` wrappers
`vdVW148_ellInfty_coordinate_weakConvergence_of_processLaw_weakConvergence`
and
`vdVW148_ellInfty_coordinate_asymptoticallyTight_of_processLaw_asymptoticallyTight`.
These are the direct one-coordinate measure-level weak-convergence and
asymptotic-tightness feeders from process laws.  They close the coordinate
version of the forward FDD/tightness support layer, while the arbitrary-index
converse still needs separability, process asymptotic tightness, and
nonmeasurable/asymptotic-measurability primitives.

2026-05-05 generic coordinate law follow-up:
`FiniteDimensional.lean` now adds `vdVW148_coordinate_hasLaw`,
`vdVW148_coordinate_identDistrib`, and
`vdVW148_coordinate_tendstoInDistribution` for dependent-product-valued
process random elements.  These complement the `ell_infty(T)` and raw bounded
process coordinate wrappers and close the generic one-coordinate
law/IdentDistrib/convergence-in-distribution support layer.  They do not close
the random-entropy tail/UI bridge or the arbitrary-index process/FDD converse.

2026-05-05 outer/inner order bridge follow-up:
`OuterExpectation.lean` now proves `VdVWInnerExpectation_le_outerExpectation`,
the basic Chapter 1.2 nonnegative order relation between the supremum over
measurable minorants and the infimum over measurable majorants.  This supports
the local outer/inner expectation-gap predicates while leaving the full signed
extended-real arbitrary-map cover-existence and nonmeasurable
asymptotic-measurability primitives open.

2026-05-05 outer/inner gap-equivalence follow-up:
`WeakConvergence.lean` now proves
`VdVWNonnegativeOuterInnerExpectationGap_eq_zero_iff_outer_eq_inner`, converting
the nonnegative Chapter 1 outer/inner expectation-gap predicate into the exact
outer-equals-inner criterion using `tsub_eq_zero_iff_le` and
`VdVWInnerExpectation_le_outerExpectation`.

2026-05-05 signed gap-equivalence follow-up:
`WeakConvergence.lean` now proves
`VdVWSignedBoundedContinuousOuterInnerExpectationGap_eq_zero_iff`, reducing the
signed bounded-continuous outer/inner gap to the two positive/negative
nonnegative outer-equals-inner criteria.  This narrows the local arbitrary-map
asymptotic-measurability support layer while preserving the remaining full
signed extended-real cover-existence gap.

2026-05-05 lower-shifted gap-equivalence follow-up:
`WeakConvergence.lean` now proves
`VdVWLowerShiftedRealOuterInnerExpectationGap_eq_zero_iff`, giving the same
outer-equals-inner criterion for the lower-shifted real nonnegative proxy used
by the local asymptotic-measurability predicates.

2026-05-05 Theorem 2.4.3 log-succ-linear constructor follow-up:
`Theorem243.lean` now has all-positive-`M` selected fixed-radius tail/UI
constructors from shifted log-linear bounds and finite-trace shifted
log-linear bounds.  These are theorem-facing bridges for polynomial/VC
trace-count routes; the non-deterministic random-entropy tail/UI bridge remains
open.

2026-05-05 Theorem 2.4.3 natural-polynomial constructor follow-up:
`Theorem243.lean` now also has all-positive-`M` selected fixed-radius tail/UI
constructors from natural-polynomial cardinality bounds and finite-trace
natural-polynomial bounds, matching the standard VC/Sauer growth form.

2026-05-05 a.e.-measurable Dirac endpoint follow-up:
`WeakConvergence.lean` now adds direct a.e.-measurable real-valued
varying-domain outer-probability-to-Dirac-law bridges:
`VdVWConvergesInOuterProbabilityConst.to_weakConvergenceProbabilityMeasures_map_dirac_real_of_aemeasurable`
and
`VdVWConvergesInOuterProbabilityConst.to_signedBoundedContinuousVaryingDomains_real_of_aemeasurable`.
These close a small Chapter 1 / Theorem 2.4.3 endpoint API gap for
`AEMeasurable` sample-size-varying statistics.  The main non-finite
Theorem 2.4.3 gap remains the selected empirical-cover entropy tail/UI or
structural cardinality theorem.

2026-05-05 probability fixed-radius chooser follow-up:
`Theorem243.lean` now proves
`exists_pos_radius_eventually_outerProbability_add_const_le_of_forall_convergesInOuterProbabilityConst`.
This is the outer-probability analogue of the existing mean/radius chooser:
if each fixed positive radius has a nonnegative finite-net error converging to
zero in outer probability, then a fixed small radius makes `error_eta + eta`
eventually small in outer probability.  It is useful for a faithful stochastic
entropy route to Theorem 2.4.3, but it does not by itself derive the missing
finite-net comparison from the textbook random entropy hypothesis.

2026-05-05 probability finite-net handoff follow-up:
`Theorem243.lean` now proves the pure outer-probability fixed-radius handoff
`VdVWConvergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_add_bound`
and its fixed-`M` Theorem 2.4.3 specializations
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_finiteNetHoeffdingUpper`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbability_finiteNetHoeffdingUpper`.
The stochastic entropy hypothesis can now feed fixed-`M` centered-truncated
convergence once the remaining event comparison with
`finiteNetHoeffdingUpper_eta + eta` is proved.

2026-05-05 pointwise finite-net comparison consumer:
`Theorem243.lean` now also proves
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_pointwise_finiteNetHoeffdingUpper`.
This is a structural sufficient-condition endpoint: fixed-radius stochastic
entropy plus eventual pointwise control of the centered truncated supremum by
`finiteNetHoeffdingUpper_eta + eta` implies fixed-`M` centered-truncated
convergence.

2026-05-05 untruncated pointwise route follow-up:
`Theorem243.lean` now proves
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_pointwise_finiteNetHoeffdingUpper`,
composing the fixed-`M` pointwise finite-net consumer with the large-`M`
envelope-tail handoff.  The remaining work is to prove the pointwise/event
finite-net comparison, not another endpoint wrapper.

2026-05-06 threshold-code cardinality follow-up:
`ThresholdCoding.lean` now proves
`thresholdTraceCodeSet_card_add_one_real_le_uniform_vc`,
`thresholdTraceCodeSet_card_add_one_real_le_uniform_subgraph_vc_nat_poly`, and
`thresholdTraceCode_image_toFinset_card_add_one_real_le_uniform_vc`,
`thresholdTraceCode_image_toFinset_card_add_one_real_le_uniform_subgraph_vc_nat_poly`,
and `thresholdTraceCode_image_toFinset_card_le_uniform_subgraph_vc_nat_poly`.
These package the full threshold-code-set and realized threshold-code image
bounds from fixed-threshold or full-subgraph VC hypotheses through the product
of fixed-threshold binary trace families and Sauer-Shelah, including the real
`card + 1` entropy shape.  This is a structural cardinality input for
VC/threshold-grid Theorem 2.4.3 routes, not another convergence endpoint.  The
same layer now exposes direct threshold-code-set empirical-cover bridges
`nonempty_finiteEmpiricalL1CoverAtCard_of_thresholdTraceCode_coordinate_approx_codeSet_card_le`
and
`empiricalL1CoveringNumber_le_of_thresholdTraceCode_coordinate_approx_codeSet_card_le`.
`Theorem243.lean` now lifts this threshold-code-set shape into random
empirical-cover domination through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_thresholdTraceCode_coordinate_approx_codeSet_cardinality_bound_samplePath`
and its all-positive-radius wrapper.  It now also reaches the selected
fixed-radius tail/UI package through
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`
and
`VdVWTheorem243SelectedFixedRadiusTailSideConditions.forall_pos_of_thresholdTraceCode_coordinate_approx_codeSet_uniform_vc`.

2026-05-06 coordinate-code random-cover follow-up:
`Theorem243.lean` now lifts coordinatewise finite pointwise approximation codes
into the random empirical covering-number interface through
`VdVWRandomEmpiricalL1CoveringNumberLeCardinality.of_coordinate_pointwise_approx_code_product_cardinality_bound_samplePath`
and its all-positive-radius version.  This lets finite coordinate code-set
products feed the selected fixed-radius Theorem 2.4.3 route directly.

2026-05-06 varying-domain lower-shifted continuous-map follow-up:
`WeakConvergence.lean` now adds
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.comp_continuous`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.comp_continuous_of_lowerShifted`,
matching the existing common-domain and signed varying-domain continuous-map
closures for this Chapter 1 asymptotic-measurability layer.

2026-05-06 full-subgraph package follow-up:
`Theorem243.lean` now has
`VdVWTheorem243FullSubgraphSideConditions.variableTruncatedEntropyCondition`,
`VdVWTheorem243FullSubgraphSideConditions.selectedFixedRadiusTailSideConditions`,
and
`VdVWTheorem243FullSubgraphSideConditions.entropy_and_selectedFixedRadiusTailSideConditions`.
The existing full-subgraph side-condition record therefore feeds both the
book-style variable-domain entropy condition and the selected fixed-radius
tail/UI package.  This is a theorem-facing assembly bridge, not a new final
textbook theorem.  The remaining productive targets are the exact random
empirical-entropy event/tail bridge, a genuinely new structural cardinality
discharge, or the Lemma 2.4.5 / Chapter 1 arbitrary-map blockers.

2026-05-06 canonical sample-process follow-up:
`Theorem243.lean` now also proves
`VdVWTheorem243_fullSubgraph_canonical_variableTruncatedEntropyCondition`,
`VdVWTheorem243_fullSubgraph_canonical_selectedFixedRadiusTailSideConditions`,
and
`VdVWTheorem243_fullSubgraph_canonical_entropy_and_selectedFixedRadiusTailSideConditions`.
These discharge the canonical `samplePath` identity for
`vdVWCanonicalSampleProcess`, so the full-subgraph entropy and selected
tail/UI side conditions are available directly on the iid product-space sample
process used by the strongest current Theorem 2.4.3/Lemma 2.4.5 packages.

2026-05-06 varying-domain shifted congruence follow-up:
`WeakConvergence.lean` now proves
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.congr_eventually`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains.congr_eventually`.
These add the missing replacement stability for the Chapter 1 lower-shifted
and canonical shifted asymptotic-measurability predicates over varying sample
spaces.  The lower-shifted theorem keeps pointwise map equality because its
definition carries an all-index lower-bound hypothesis; the canonical theorem
allows eventually equal maps.

2026-05-06 common-domain asymptotic-measurability congruence follow-up:
`WeakConvergence.lean` now also proves the common-domain replacement bridges
`VdVWAsymptoticallyMeasurableNonnegative.congr_eventually`,
`VdVWAsymptoticallyMeasurableLowerShiftedReal.congr_eventually`,
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.congr_eventually`
and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted.congr_eventually`.
This closes the replacement-stability gap for the Chapter 1 nonnegative and
shifted asymptotic-measurability layer in common-domain form, matching the
previous varying-domain shifted congruence closures; the deeper signed
extended-real arbitrary-map and process/FDD blockers remain open.

2026-05-06 measure-level weak-convergence stability follow-up:
`WeakConvergence.lean` now adds
`VdVWWeakConvergenceProbabilityMeasures.congr_eventually` and
`VdVWWeakConvergenceProbabilityMeasures.comp_tendsto`, matching the filter,
replacement, and reindexing style already available for ordinary
asymptotic-tightness.  This supports Chapter 1 product/FDD and subsequence
arguments while leaving exact arbitrary-map/process weak convergence open.

2026-05-06 signed arbitrary-map reindexing follow-up:
`WeakConvergence.lean` now gives both common-domain and varying-domain signed
bounded-continuous arbitrary-map weak-convergence packages `comp_tendsto`
reindexing lemmas.  The new declarations cover the signed outer convergence
field, the signed asymptotic-measurability field, and the proof-carrying
packages.  This rounds out the filter/replacement/reindexing support layer
for Chapter 1 arbitrary-map arguments; exact nonmeasurable cover and
process/FDD converse blockers remain open.

2026-05-06 nonnegative/canonical asymptotic-measurability reindexing
follow-up:
`WeakConvergence.lean` now adds `comp_tendsto` reindexing lemmas for
`VdVWAsymptoticallyMeasurableNonnegative`,
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShifted`, and
`VdVWAsymptoticallyMeasurableBoundedContinuousCanonicalShiftedVaryingDomains`.
The lower-shifted predicates remain intentionally without generic
reindexing because their all-index lower-bound hypotheses do not follow from
a bound on only the reindexed subfamily.

2026-05-06 lower-shifted lifted-bound reindexing follow-up:
`WeakConvergence.lean` now adds the explicit lifted-bound versions that the
generic reindexing note above requires:
`VdVWAsymptoticallyMeasurableLowerShiftedReal.comp_tendsto_of_lower_bound`,
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShifted.comp_tendsto_of_lower_bound`,
and
`VdVWAsymptoticallyMeasurableBoundedContinuousLowerShiftedVaryingDomains.comp_tendsto_of_lower_bound`.
These close the honest reindexing support case while keeping the all-index
lower-bound assumption explicit.  They do not close the full arbitrary-map
asymptotic-measurability or process/FDD converse blockers.

2026-05-06 process source/limit congruence follow-up:
`FiniteDimensional.lean` now combines the previously separate process-source
and process-limit replacement layers in
`VdVWEllInftyProcessWeakConvergence.congr_eventually_limit_ae` and
`VdVWEllInftyProcessWeakConvergence.congr_eventually_limit_forall_coord_ae`.
This lets Chapter 1 process/FDD arguments canonicalize both the source family
and the limiting process by a.e.-equal bounded representatives in one proof
step.  It remains a support layer, not the arbitrary-index VdV&W 1.4.8
converse.

2026-05-06 current `/goal` recalibration:
the active objective remains full VdV&W Chapters 1-2 formalization in
dependency order, but the operational target should be more precise than the
stored one-line `/goal` object.  Treat the large Theorem 2.4.3 endpoint
surface as mostly closed support unless an exact textbook theorem consumes a
new endpoint immediately.  The highest-value remaining theorem-line gap is
source-side: prove a genuine entropy/cardinality, selected empirical-cover
tail/UI, or ordinary-mean theorem that feeds the selected fixed-radius
Theorem 2.4.3 package from the textbook random entropy hypothesis.  If that is
blocked after search and Lean attempts, switch to a theorem-critical Chapter 1
primitive: arbitrary-index FDD converse, process separability/asymptotic
tightness/asymptotic measurability, nonmeasurable signed outer-cover weak
convergence, or full arbitrary-map extended-real measurable-cover existence.

This recalibration batch also closes two support gaps without overclaiming the
exact textbook theorem: `CoveringPrimitive.lean` now proves reverse comparison
from local proof-carrying empirical covers to mathlib
`Metric.coveringNumber`, packages the finite-cover case as the equality
`empiricalL1CoveringNumber_eq_empiricalL1Index_coveringNumber`, and
`WeakConvergence.lean` now gives the direct varying-domain a.e.-measurable
weak-convergence map-law bridge without a countably-generated target-space
assumption.  The common-domain and varying-domain `HasLaw` weak-convergence
consumers now use the direct a.e.-measurable route as well, removing the same
unnecessary countably-generated assumption from those support statements.

2026-05-06 Theorem 2.4.3 fixed-radius comparison constructor:
`Theorem243.lean` now has
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.of_eventual_pointwise_bound`,
and the existing pointwise finite-net fixed-`M` convergence consumer has been
refactored to flow through the proof-carrying comparison structure.  This
removes duplicated event-monotonicity proof code and makes the true remaining
gap explicit: prove the generic fixed-radius probability comparison from the
VdV&W ghost/Rademacher selected-cover argument, or prove a structural selected
finite-cover theorem strong enough to feed the pointwise constructor.

The same comparison target now also has the weaker a.e. constructor
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.of_eventual_ae_bound`,
proved using mathlib `measure_mono_ae`.  Future Theorem 2.4.3 work should aim
to prove this eventual a.e. selected finite-net domination, or the comparison
structure directly, from the textbook symmetrization/random-cover argument.

The fixed-radius probability route also now supports deterministic
symmetrization constants through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_outerProbability_scaledFiniteNetHoeffdingUpper`
and its support lemma
`VdVWConvergesInOuterProbabilityConst_zero_of_const_mul_nonneg`.  This removes
a likely constant-factor mismatch before the next ghost/Rademacher comparison
proof attempt.

The source-facing scaled a.e. consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_eventualAe_scaledFiniteNetHoeffdingUpper`
is now compiled too.  The next productive theorem target is its `hae` input:
derive eventual a.e. scaled finite-net domination from the existing
ghost-sample, Rademacher, and selected empirical-cover machinery.

The corresponding untruncated consumer
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_eventualAe_scaledFiniteNetHoeffdingUpper`
is now compiled as well, using the existing envelope-tail untruncation
handoff.  No final textbook theorem is claimed; this narrows the remaining
work to proving the scaled a.e. source domination for all positive truncation
levels.

The fixed-radius route now also has a selected-log tail/UI source bridge:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_logCardinality_div_tailExpectation`.
This avoids asking directly for tail/UI of the finite-net Hoeffding upper and
instead consumes tail/UI of the selected normalized log-cardinality process.
The exact Theorem 2.4.3 blocker is therefore the book entropy-to-selected-log
tail/UI step, or a direct outer-probability source comparison replacing it.

The source comparison route now has the selected-to-external cardinality
bridge needed by the actual random-cover proof shape:
`vdVWTheorem243FiniteNetHoeffdingUpper_mono_cardinality` and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_eventualAe_scaledSelectedFiniteNetHoeffdingUpper`.
Thus a future proof may work with the selected least empirical-cover
cardinality in the a.e. finite-net domination step, while the stochastic
entropy hypothesis remains on the larger external cardinality.  Remaining
work: prove that selected a.e. scaled domination from ghost/Rademacher
symmetrization, or prove the direct outer-probability comparison.

2026-05-06 selected-log integrability cleanup:
`Theorem243.lean` now proves
`integrable_vdVWTheorem243FiniteNetHoeffdingUpper_of_logCardinality_div_integrable`.
This is a source-side assumption reduction: integrability of the normalized
selected log-cardinality process automatically gives integrability of the
finite-net Hoeffding display scale.  The exact generic 2.4.3 blocker remains
unchanged: selected normalized-log tail/UI, ordinary mean, or scaled selected
finite-net event comparison still must be derived from the textbook
outer-probability random entropy hypothesis.

2026-05-06 selected-log route interface cleanup:
the selected normalized-log tail/UI, ordinary-mean, first-sample UI/eLpNorm,
and first-sample bounded-entropy constructors now derive finite-net Hoeffding
upper integrability internally from selected normalized-log integrability.
Downstream untruncated centered and `P`-GC plus in-mean consumers therefore
carry one fewer artificial side condition.  This does not claim the generic
textbook theorem: the remaining high-priority source bridge is still the
outer-entropy-to-selected-tail/UI or scaled selected finite-net event
comparison.

2026-05-07 recalibration: the VdV&W lane is continuing from the clean
`/private/tmp/ep-vdvw-selected-log-route` worktree because the original Desktop
workspace is readable again but dirty with unrelated Matching-lane files and is
far behind `origin/main`.  The compact active target is now the generic
Theorem 2.4.3 source bridge only: prove selected normalized-log tail/UI or the
fixed-radius selected finite-net outer-probability/a.e. comparison from the
textbook entropy/symmetrization argument.  Avoid more endpoint aliases unless a
new upstream theorem is consumed.

`Theorem243.lean` now also proves
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_outerProbabilityComparison`.
This takes the proof-carrying fixed-radius finite-net outer-probability
comparison at every positive truncation level and immediately reaches the
untruncated centered convergence through the existing large-`M` envelope-tail
handoff.  Next work should prove that comparison primitive itself, not another
downstream wrapper.

The symmetrization precursor now also has a real-valued pointwise bridge:
`VdVWTheorem243SymmetrizationPrecursor.centered_le_two_finiteNetHoeffdingUpper_add_of_hphi_id`.
It converts the existing `ENNReal.ofReal` outer-expectation bound from
`hphi_id` into the real inequality needed by the fixed-radius event-comparison
route.  The remaining proof target is still upstream: prove the `hphi_id`
comparison / selected-cover symmetrization source theorem.

2026-05-07 selected-cardinality comparison transport:
`Theorem243.lean` now adds
`VdVWTheorem243FixedRadiusFiniteNetOuterProbabilityComparison.of_eventual_ae_selected_bound`,
which upgrades eventual a.e. domination by the selected least empirical-cover
finite-net scale to domination by a larger entropy-controlled cardinality.
This is theorem-facing support for the exact Theorem 2.4.3 source route, not a
new final endpoint.  Remaining blocker: prove the selected a.e. domination or
an equivalent VdV&W nonmeasurable entropy comparison from the textbook
ghost/Rademacher selected-cover argument.

2026-05-07 source-bridge refinement:
`Theorem243.lean` now also proves
`VdVWTheorem243_eventualAe_centered_le_two_finiteNetHoeffdingUpper_add_halfRadius_of_symmetrizationPrecursor_hphi_id`
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_symmetrizationPrecursor_hphi_id`.
The selected-cover route now reduces to two explicit source inputs: build the
finite-sample symmetrization precursor for the selected radius-`eta / 2`
empirical cover, and prove the fixed-sample `Phi(x)=x` comparison on the same
eventual a.e. samples.  Those are the next proof targets.

The selected half-radius precursor is now instantiated by
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_hphi_id`.
The remaining source proof targets are the selected-cover `hphi_id` comparison
and the finite-center Hoeffding/maximal event for those selected cover centers.

The same displayed-beta selected-cover source route now has a common iid
Rademacher sign-space bridge:
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_common_iidRademacher_hphi_id`.
It removes the need to carry an externally supplied sign space at this handoff,
while preserving the real source obligations: selected-cover measurability,
pathwise finite-center maximal control, and the fixed-sample `Phi(x)=x`
comparison.

The sign-side measurable-cover obligation in that displayed-beta route is now
closed under localized countability by the canonical fixed-sample cover
`VdVWMeasurableCover.truncated_rademacher_sign_of_countable`, the direct
selected-cover constructor
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_countable_hphi_id`,
and the common-iid wrapper
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_finiteEmpiricalCover_common_iidRademacher_hphi_id_of_set_countable`.
The compatibility helper
`VdVWTheorem243_signSideRademacherMeasurableCover_of_set_countable` now
delegates to that canonical cover.  For the countable common-iid selected-cover
lane, the remaining event-route inputs are therefore the finite-center
Hoeffding/maximal event and the `Phi(x)=x` comparison.

The selected half-radius expected-maximal route now also has its source bridge:
`VdVWTheorem243_eventualAe_expectedMaximal_selectedHalfRadius_of_finiteEmpiricalCover`.
This discharges the expected finite-center maximal input for selected covers
from the compiled Rademacher sub-Gaussian/Mills/Hoeffding route.  The weaker
mean/outer-expectation route no longer needs a separate selected-cover maximal
primitive; the displayed-beta event route still needs the actual fixed-sample
`hphi_id` comparison and the stronger pathwise finite-center Hoeffding event.

The selected expected-maximal bridge now feeds the product-integrated
finite-net handoff through
`integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_ae_expectedMaximal`
and
`eventually_integral_prod_vdVWWeightedClassSupremum_le_integral_finiteNetHoeffdingUpper_add_of_selectedHalfRadius_expectedMaximal`.
This closes the sample-a.e. versus all-sample mismatch for the mean route.
The remaining mean-route analytic target is the convergence to zero of the
selected finite-net Hoeffding-upper integral.

The same selected expected-maximal route now also reaches the VdVW
outer-expectation interface via
`VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_ae_expectedMaximal`
and
`eventually_VdVWOuterExpectation_prod_vdVWWeightedClassSupremum_le_ofReal_integral_finiteNetHoeffdingUpper_add_of_selectedHalfRadius_expectedMaximal`.
This prepares the centered symmetrization/Markov route to consume sample-a.e.
selected covers directly.

The selected route now also has the centered-integral bridge:
`integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_ae_expectedMaximal`
and
`eventually_integral_vdVWWeightedClassSupremum_centered_const_ofReal_le_two_integral_finiteNetHoeffdingUpper_add_of_selectedHalfRadius_expectedMaximal`.
This is the last projection layer before Markov; the remaining proof-facing
input is selected finite-net integral convergence at the chosen radius.

The selected expected-maximal mean route now reaches Markov convergence through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedHalfRadius_expectedMaximal_integral_tendsto_zero`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedHalfRadius_expectedMaximal_integral_real_tendsto_zero`.
The next non-duplicative mean-route target is to prove the selected finite-net
Hoeffding-upper integral convergence from the stochastic entropy/tail/UI
condition; the event-route blocker remains the selected-cover `Phi(x)=x`
comparison plus pathwise finite-center Hoeffding event.

The selected inverse-radius entropy package now also exposes that mean input
in the exact half-radius syntax needed by the selected Markov theorem via
`VdVWTheorem243SelectedInvRadiusEntropySideConditions.integral_finiteNetHoeffdingUpper_add_doubleInvRadius_half_tendsto_zero`.
This projects the canonical `1 / (n + 1)` additive term as
`(2 / (n + 1)) / 2`; it prepares, but does not by itself complete, the direct
selected-cover convergence consumer.

That direct selected-cover consumer is now compiled as
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy_directCover_expectedMaximal`.
It lets a future source proof provide explicit selected covers directly and
then uses the selected inverse-radius entropy package only for the mean side.
The remaining blocker is still upstream: the selected-cover source theorem or
the stochastic entropy-to-mean/UI theorem.

The selected direct-cover path now also has a sample/radius transport lemma:
`FiniteEmpiricalL1CoverAtCard.congr_sample_epsilon` (with its center simp
lemma).  The compact selected inverse-radius theorem
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_selectedInvRadiusEntropy`
now uses the direct-cover expected-maximal route by transporting
`vdVWRandomEmpiricalL1CoverAtCard (X n)` from `samplePath (X n) sample n` to
the terminal `sample` and rewriting the half-radius expression.  This is not a
new endpoint; it removes the remaining syntactic obstacle to feeding a future
selected-cover source proof into the mean route.  The next target remains the
selected-cover `Phi(x)=x`/finite-center event theorem or the stochastic
entropy-to-mean/UI theorem.

The all-positive-radius selected inverse-radius theorem now factors through
the selected side-condition package and direct selected-cover consumer:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selected_truncated_invRadiusEntropy_logCardinality_div_bound`
constructs
`VdVWTheorem243SelectedInvRadiusEntropySideConditions.of_selected_truncated`
and then uses
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_selectedInvRadiusEntropy`.
This keeps the active mean route on the same selected-cover object introduced
by the textbook random empirical-cover construction.

The variable-entropy mean route now has a direct untruncated consumer from
ordinary selected finite-net mean convergence:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_variableEntropy_finiteNetUpper_integral_tendsto_zero`.
This composes the book-shaped entropy package with the existing
`toSelectedFixedRadiusTailSideConditions_of_finiteNetUpper_integral_tendsto_zero`
source bridge and then reaches the selected fixed-radius Theorem 2.4.3 route.
The next useful target is therefore sharply stated: prove the selected
finite-net Hoeffding-upper integral tends to zero from the stochastic entropy
argument, or prove the selected-cover `Phi(x)=x`/finite-center event theorem
for the probability route.

The registered selected entropy-to-finite-net mean primitive now has a direct
untruncated centered-convergence consumer:
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.centered_untruncated_convergesInOuterProbabilityConst_zero`.
This means the remaining source proof can be plugged into the generic Theorem
2.4.3 route without another tail/UI or endpoint wrapper layer.  The active
blocker remains the source proof of the primitive itself, or the alternative
displayed-beta selected-cover event primitive.

The selected entropy-to-finite-net mean primitive now also has a deterministic
normalized-log-cardinality constructor:
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_bound`.
This packages the existing deterministic-bound selected fixed-radius route as a
proof of the registered primitive, so concrete finite-trace/VC/grid arguments
can reuse the same primitive-facing main route.  Parallel searches confirmed no
current local or pinned-mathlib theorem proves the primitive from
outer-probability entropy alone.

The selected fixed-radius tail/UI package now also collapses to the registered
primitive through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_selectedFixedRadiusTailSideConditions`.
This makes the primitive the common handoff for all existing L1/UI/deterministic
selected finite-net routes while leaving the source theorem target unchanged.

The full-subgraph side-condition package now also collapses to the registered
primitive through
`VdVWTheorem243FullSubgraphSideConditions.selectedEntropyFiniteNetMeanPrimitive`.
This lets the canonical full-subgraph route reuse the selected-entropy primitive
handoff directly, while keeping the active blocker focused on the missing
stochastic selected-cover entropy-to-mean proof or the displayed-beta event
primitive.

The selected normalized-log ordinary-mean route now also collapses to the
registered primitive through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_integral_tendsto_zero`.
This is the source-facing L1 strengthened entropy handoff: once the selected-log
mean convergence is proved, generic Theorem 2.4.3 can consume the primitive
without another selected tail/UI wrapper.

The selected-log ordinary-mean route now also has a localized countability
primitive:
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_integral_tendsto_zero_of_set_countable`.
It removes the global `[Countable Index]` requirement from the L1-strengthened
selected-log handoff when `indexClass.Countable` is available, while keeping
integrability and ordinary mean convergence as explicit hypotheses.

The selected-cover measurability layer now has localized countability support:
`measurableSet_finiteEmpiricalL1CoverAtCard_of_set_countable`,
`measurable_finiteEmpiricalL1CoveringNumberCard_of_set_countable_of_measurable`,
and the Theorem 2.4.3 selected truncated-cardinality lifts remove the need for
global `[Countable Index]` when the actual class is countable.  The selected
fixed-radius tail/UI mean consumer and the selected entropy finite-net mean
primitive bridge now have `_of_set_countable` forms.  This improves finite and
countable-class reuse; the remaining generic blocker is still the selected-log
mean theorem or the displayed-beta selected-cover event primitive.

The first-sample UI/Vitali route now also reaches the localized selected
entropy finite-net mean primitive through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_firstSample_unifIntegrable_of_set_countable`.
Thus a countable theorem class can supply first-sample uniform integrability of
the selected normalized-log empirical-cover process and immediately feed the
generic Theorem 2.4.3 primitive route.  The active source task remains proving
that UI/tail input from stochastic entropy, or proving the displayed-beta
selected-cover event comparison.

The localized selected-entropy primitive now also has bounded-tail and
natural-polynomial cardinality constructors:
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_firstSample_nnnorm_bound_of_set_countable`
and
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_nat_poly_bound_of_set_countable`.
These are the countable-class primitive handoffs for finite-trace, grid, and
VC/Sauer-style counting routes; the remaining source work is to prove the
needed boundedness/counting input or close the displayed-beta event route.

The selected-log measurability input for these first-sample routes is now
localized as
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.selectedLogMeasurable_of_set_countable`.
This removes another global countability dependency from the source route; the
remaining open analytic obligation is integrability/UI or a concrete
boundedness/counting proof.

The countable-class polynomial-cardinality route now discharges selected-log
measurability and finite-product integrability internally through
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.selectedLogIntegrable_of_logCardinality_div_bound_of_set_countable`
and
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_nat_poly_bound_auto_of_set_countable`.
This leaves polynomial growth/counting itself, or the displayed-beta event
comparison, as the next source-level mathematical task.

The first-sample common-space route now has an integrability transport lemma:
`integrable_vdVWProductMeasure_of_firstNSample`, plus selected-log consumers
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.selectedLogIntegrable_of_firstSample_integrable_of_set_countable`
and
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_firstSample_unifIntegrable_liftIntegrable_of_set_countable`.
This lets future proofs state lifted integrability and UI on the same infinite
iid product space before feeding the selected finite-net mean primitive.

The same common-space route now also has the compact mathlib interface
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_div_firstSample_uniformIntegrable_of_set_countable`.
It consumes one `UniformIntegrable` selected-log hypothesis and derives both
lifted integrability and `UnifIntegrable` for the primitive route.

The countable-class selected entropy primitive now also accepts shifted
log-succ-linear cardinality growth through
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_logCardinality_log_succ_linear_bound_auto_of_set_countable`.
This automates the selected-log measurability, finite-product integrability,
and first-sample boundedness handoff for bounds shaped like
`offset M eta + degree M eta * log (n + 1)`.  The next high-leverage source
target is to prove a finite-trace/VC counting theorem that supplies this bound,
or to close the displayed-beta selected-cover event comparison directly.

The finite-trace source route now reaches that same selected entropy primitive
directly.  `Theorem243.lean` adds
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_logCardinality_log_succ_linear_bound`,
`VdVWTheorem243VariableTruncatedEntropyConditionForAllEpsilonM.of_finite_trace_image_cardinality_bound_log_succ_linear`,
and
`VdVWTheorem243SelectedEntropyFiniteNetMeanPrimitive.of_finite_trace_image_cardinality_bound_log_succ_linear_auto_of_set_countable`.
Finite empirical trace images plus a shifted log-linear trace-count estimate
now supply the book entropy condition and primitive handoff without a separate
fixed-radius tail/UI package.

The canonical full-subgraph VC/Sauer route now feeds the registered selected
entropy finite-net mean primitive directly through
`VdVWTheorem243_fullSubgraph_canonical_selectedEntropyFiniteNetMeanPrimitive`.
This consumes the existing canonical book entropy condition and selected
fixed-radius tail/UI side conditions, so canonical full-subgraph VC classes can
use the new finite-net mean primitive without restating the side-condition
record.

The original-class canonical full-subgraph route also feeds the primitive
through
`VdVWTheorem243_originalFullSubgraph_canonical_selectedEntropyFiniteNetMeanPrimitive`.
This keeps VC control on `classFun` and uses the integer-grid fixed-mask
transfer to produce the truncated threshold-code entropy cardinality.

The original full-subgraph route now also has a textbook-aligned strong package:
`VdVWTheorem243_originalFullSubgraph_integrable_textbookAligned_no_nonempty_of_countable_integrable`.
It records `P`-measurability, finite outer-envelope expectation,
outer-probability and outer-a.s. `P`-GC, local `P`-GC, in-mean convergence, and
the canonical Lemma 2.4.5 a.s. centered-supremum conclusion from the original
VC assumption on `classFun`.
The same route now has fixed-degree specializations:
`VdVWTheorem243_originalFullSubgraph_canonical_selectedEntropyFiniteNetMeanPrimitive_of_uniformSubgraphVC`
feeds the selected finite-net mean primitive from a single
`VdVWUniformSubgraphVCBound indexClass classFun vcDegree`, and
`VdVWTheorem243_originalFullSubgraph_integrable_textbookAligned_no_nonempty_of_uniformSubgraphVC`
feeds the strongest textbook-aligned package from that same fixed VC-subgraph
bound.  The artificial `M ↦ vcDegree M` parameter is no longer exposed in the
clean original full-subgraph entry point.

The selected-cover event route now also has a reusable positive-radius
selected-cardinality measurability theorem:
`measurable_vdVWSelectedTruncatedPositiveRadiusEmpiricalL1CoveringNumberCard_at_sampleSize_of_set_countable`.
This closes the `hcard` side of the displayed-beta sample-coordinate event
wrapper for the canonical `Nat.find` selected-cover cardinality at terminal
sample size.  The current Theorem 2.4.3 event-route blocker is therefore
sharper: prove scalar selected-center coordinate measurability for
`VdVWFiniteEmpiricalL1CoverSelectedCenterAt`, and prove the product-fiber lower
bound with the displayed Chebyshev constants.

That `hcard` closure is now wired directly into the displayed-beta route by
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_sample_coordinate_countable`.
The wrapper specializes selected cardinality to the canonical positive-radius
least empirical cover at `eta / 2`, so future callers only supply the
half-radius selected cover, scalar selected-center coordinate measurability,
and the product-fiber lower bound.  Local/pinned-mathlib search found no
general measurable selector theorem for arbitrary `Classical.choice` empirical
covers and no undoubled concrete-fiber theorem for the displayed constants;
the available fallback remains the compiled half-scale `C = 4`, `A = 2`
comparison route.

The half-scale route now has the matching canonical selected-cardinality
coordinate wrapper:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_coordinate`.
It specializes the selected process to the least empirical-cover cardinality
at radius `(eta / 2) / 2`, transports the book entropy log convergence from
that radius, proves selected cardinality is measurable, and proves the
selected cardinality is bounded by the book-facing envelope.  Remaining
half-scale source obligations are now scalar selected-center coordinate
measurability for the chosen cover and vanishing integrated finite-center
failure-tail error.

The selected-center scalar-coordinate obligation now has a countable-fiber
source bridge.  `Theorem243.lean` adds
`measurable_vdVWTruncatedClassFun_selected_index_of_countable_fibers` and
`measurable_vdVWTruncatedClassFun_selectedCenterAt_of_countable_fibers`, which
derive scalar coordinate measurability from measurable fibers of the
Nat-indexed selected-center selector, plus membership of the out-of-range
`default` branch in the countable class.  This does not make an arbitrary
`Classical.choice` cover selector measurable; it narrows the next task to
constructing measurable fibers for a canonical selected-cover tuple or
removing the arbitrary default branch.

The current half-scale Theorem 2.4.3 source consumer now uses that fiber
interface directly through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_fibers`.
The exposed selected-center input is now measurable fibers of the
Nat-indexed selector, plus `default ∈ indexClass`, instead of a raw family of
scalar coordinate measurability assumptions.  Remaining source work is to
construct those fibers for a canonical selected-cover tuple and to handle the
integrated finite-center failure-tail convergence.

The selected-center route no longer depends on an ambient `default` being in
the class.  `Theorem243.lean` introduces
`VdVWFiniteEmpiricalL1CoverSelectedCenterAtInClass` and the consumer
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_inClass_fibers`.
The out-of-range selected-center value is now the nonempty-class witness, so
the live selected-center blocker is exactly measurable fibers for this
in-class selector.
The scalar-coordinate bridge for that same in-class selector is now compiled
as
`measurable_vdVWTruncatedClassFun_selectedCenterAtInClass_of_countable_fibers`;
it removes the last `default ∈ indexClass` artifact from the selected-center
coordinate interface.  The remaining selector blocker is still the real one:
construct measurable fibers for a canonical in-class selected-cover tuple.
The first reusable piece of that canonical-selector construction is now
compiled as `vdVWFirstNatCandidate` with fiber measurability theorem
`measurableSet_vdVWFirstNatCandidate_eq`: a Nat-enumerated first successful
candidate has measurable fibers whenever each candidate-success event is
measurable.  The next patch should instantiate this with enumerated finite
center tuples for the countable theorem class.
That fixed-cardinality instantiation is now started: the projected-fiber
selector theorem `measurableSet_vdVWFirstNatCandidate_map_eq`, the empirical
tuple predicate `vdVWFiniteEmpiricalL1CoverCenterTuplePredicate`, its event
measurability theorem, the cover-to-candidate existence bridge, the first
finite empirical-cover center tuple
`vdVWFirstFiniteEmpiricalL1CoverCenterTuple`, its spec theorem, and the center
fiber theorem
`measurableSet_vdVWFirstFiniteEmpiricalL1CoverCenterTuple_center_eq` are
compiled.  The remaining selected-cover fiber task is to lift this
fixed-cardinality selector through the measurable selected-cardinality level
sets used by the Theorem 2.4.3 quarter-radius route.

That selected-cardinality level-set lift is now compiled.  `Theorem243.lean`
adds `vdVWFirstVariableEmpiricalL1CoverCenterTuple`,
`vdVWFirstVariableEmpiricalL1CoverSelectedCenterAtInClass`,
`vdVWFirstVariableEmpiricalL1CoverSelectedCenterAtInClass_mem`, and
`measurableSet_vdVWFirstVariableEmpiricalL1CoverSelectedCenterAtInClass_eq`.
The fiber theorem splits by the measurable level sets
`{sample | cardinality sample = m}` and reuses the fixed-cardinality tuple
selector on each level, with an explicit nonempty-class fallback outside the
selected range.  The remaining selector work is now narrower: connect this
canonical variable-cardinality selector to the actual selected-cover object
used by the quarter-radius route, using a Nat enumeration/surjection of
in-class finite center tuples and the selected cover existence witness.  The
separate product-fiber/Chebyshev source probability input remains open.

The canonical selector is now also packaged as an actual proof-carrying
empirical cover.  `Theorem243.lean` adds
`vdVWFirstVariableEmpiricalL1CoverCenterTuple_spec`,
`vdVWFirstVariableEmpiricalL1CoverAtCard`,
`VdVWFiniteEmpiricalL1CoverSelectedCenterAtInClass_eq_firstVariable`,
`measurableSet_VdVWFiniteEmpiricalL1CoverSelectedCenterAtInClass_firstVariable_eq`,
and `measurable_vdVWTruncatedClassFun_firstVariableSelectedCenterAtInClass`.
This closes the abstract bridge from the canonical variable-cardinality
selector to the standard downstream in-class selected-center adapter.  The
remaining selector task is now the theorem-facing data supply: build the
Nat-enumerated tuple candidates and `hexists` witness from the selected
empirical-cover/cardinality hypotheses used in the quarter-radius route, then
instantiate the canonical-cover coordinate theorem there.

The stronger-than-needed selector existence assumption has now been removed
from the canonical route.  `Theorem243.lean` adds the level-local selector
layer `vdVWFirstLevelEmpiricalL1CoverCenterTuple`,
`vdVWFirstLevelEmpiricalL1CoverSelectedCenterAtInClass`,
`measurableSet_vdVWFirstLevelEmpiricalL1CoverSelectedCenterAtInClass_eq`,
`vdVWFirstLevelEmpiricalL1CoverAtCard`,
`VdVWFiniteEmpiricalL1CoverSelectedCenterAtInClass_eq_firstLevel`,
`measurableSet_VdVWFiniteEmpiricalL1CoverSelectedCenterAtInClass_firstLevel_eq`,
and `measurable_vdVWTruncatedClassFun_firstLevelSelectedCenterAtInClass`.
This version only needs a successful Nat tuple candidate at
`cardinality sample`, which matches selected empirical-cover existence.  The
next proof target is to supply the concrete tuple enumeration/surjection and
level-local existence witness from the quarter-radius selected-cover
hypotheses, then instantiate this `firstLevel` selector in the current
Theorem 2.4.3 source route.  The product-fiber/Chebyshev lower bound remains
open separately.

That `firstLevel` selected-cover data-supply step is now compiled.  The new
declarations are
`vdVWFiniteEmpiricalL1CoverCenterTupleCandidateOfCountable`,
`vdVWFiniteEmpiricalL1CoverCenterTupleCandidateOfCountable_surjective`,
`exists_vdVWFiniteEmpiricalL1CoverCenterTupleCandidateOfCountable_of_cover`,
`exists_vdVWFiniteEmpiricalL1CoverCenterTupleCandidateOfCountable_level`,
`vdVWFirstLevelEmpiricalL1CoverAtCardOfCountable`, and
`measurable_vdVWTruncatedClassFun_firstLevelSelectedCenterAtInClass_of_countable_cover`.
The current half-scale route now has the canonical selected-cover endpoint
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel`.
It no longer asks callers for an arbitrary finite cover or selected-center
fiber measurability; both are chosen internally from countability and minimal
selected empirical-cover existence.  The live blocker has moved back to the
probability side: avoid or replace the non-vanishing additive finite-center
failure-tail term, most likely through the product-fiber/Chebyshev lower-bound
route.

The selected-cardinality side of the honest a.e. finite-center route is now
compiled as
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_signSample_ae_finiteCenter_halfScale_of_selected_truncated_quarterRadius_cover`.
It feeds the existing sign-sample/product-pair Chebyshev convergence theorem
with the canonical positive-radius selected covering number at quarter radius
and proves the selected-cardinality comparison internally.  The remaining
inputs in this branch are exactly the two eventual a.e. finite-center support
facts for the selected cover; no selected-cardinality comparison or
selected-center fiber measurability is left in that wrapper.

The same branch now has a first-level canonical selected-cover endpoint:
`exists_vdVWSelectedTruncatedPositiveRadiusEmpiricalL1CoverAtCard`,
`vdVWSelectedTruncatedPositiveRadiusFirstLevelEmpiricalL1CoverAtCardOfCountable`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_signSample_ae_finiteCenter_halfScale_of_selected_truncated_quarterRadius_firstLevel`.
This wrapper chooses the finite empirical cover internally from the selected
positive-radius cardinality and the countable first-level tuple selector.  The
only remaining a.e. finite-center inputs are now stated for that canonical
cover.

The displayed-beta product-fiber branch now has the analogous canonical
first-level selected-cover endpoint:
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_firstLevel_countable`.
It removes the explicit cover and coordinate-measurability arguments from that
branch.  The remaining displayed-beta source assumption is exactly the
product-fiber lower bound for the canonical pair-difference ghost/Rademacher
selected-net event.

The displayed-beta branch now also reaches the fixed-`M` convergence endpoint:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel`.
This theorem shifts the entropy envelope to radius `eta / 2`, proves the
selected-cardinality comparison internally, and consumes the canonical
first-level displayed-beta primitive.  The remaining blocker is therefore the
single canonical product-fiber lower-bound hypothesis.

The canonical displayed-beta branch now has a sign-swapped bad-fiber
factorization endpoint:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_signSwapBad_fibers`.
It reuses
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_centeredPairSubSignSwapBadEvent_ae_components`
to reduce the remaining canonical product-fiber hypothesis to the
sign-swapped bad-event fiber lower bound plus original and ghost
finite-center a.e. support for the canonical first-level selected cover.  This
is progress on the source interface, not a final probability closure; the
active blocker is now exactly those probability-side three inputs.

The displayed-beta source chain now has one more compiled factorization:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_pairSubBad_signSwap_fibers`.
It replaces the direct sign-swapped bad-event lower-bound assumption by an
unswapped pair-sub bad-event lower bound plus fixed-sample sign-swap
transport.  This aligns the interface with the existing Chebyshev pair-sub
source theorem, while making clear that the fixed-fiber sign-swap transport is
still the nontrivial probability point and may be stronger than the integrated
product-pair symmetry route already compiled elsewhere.

The fixed-fiber sign-swap route now also has the positive-sample-size
measure-level handoff:
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_chebyshev_pairSub_badEvent_signSwap_lower_bound_of_pos`
and
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_pairSub_badEvent_signSwap_lower_bound_of_pos`.
These remove the successor-only shape and turn the concrete pair-difference
fiber lower bound into a factor-two outer-probability comparison for the
`2 * epsilon` centered-bad event.  The remaining blocker is not this
measure-theory plumbing; it is still the validity/proof of fixed-sample
sign-swap transport and the finite-center a.e. support assumptions.

The same fixed-fiber source route now has the normal half-scale
outer-probability comparison:
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_pairSub_badEvent_signSwap_lower_bound_halfScale_of_pos`.
It instantiates the positive-size bridge at `epsilon / 2`, yielding the usual
`epsilon` centered-bad event and the selected finite-net event
`epsilon < 4 * H + eta`.  This aligns the fixed-fiber route with the existing
product-pair half-scale scale constants; the unsolved inputs remain
fixed-sample sign-swap transport and original/ghost finite-center a.e. support.

The fixed-fiber pair-difference source route now reaches the same fixed-`M`
convergence boundary as the product-pair half-scale route:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_signSwap_ae_finiteCenter_halfScale`.
It consumes stochastic entropy, the selected-cardinality comparison, concrete
event measurability, fixed-sample sign-swap transport, and the original/ghost
finite-center a.e. support facts.  The remaining blocker is now fully
probability-side: prove those fixed-fiber inputs for the chosen cover, or
switch the final source theorem to the already compiled integrated
product-pair symmetry route.

2026-05-10 route audit / corrected active blocker:
The selected-cover construction, selected-cardinality comparisons, and endpoint
composition layers are now ahead of the actual probability argument.  The
compiled honest product-pair route is
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_signSample_ae_finiteCenter_halfScale`,
with canonical first-level selected-cover wrappers.  The fixed-fiber route
ending at
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_signSwap_ae_finiteCenter_halfScale`
is only a conditional endpoint until its fixed-original sign-swap transport is
proved; integrated product-pair symmetry does not by itself justify that
fiberwise statement.

The finite-center additive-tail workaround is formally blocked by
`not_tendsto_vdVWTheorem243FiniteCenterHoeffdingFailureTail_one_succ_zero`.
So the next valid Theorem 2.4.3 step is not another selected-cover wrapper:
it is a genuine probability/source theorem, either the canonical
displayed-beta product-fiber lower bound, a proved coefficient-correct
fixed-fiber transport, or an explicitly stated stronger assumption package.

Lemma 2.4.5 reverse/cofiltration should be removed from the "current blocker"
slot for the countable/full-subgraph branch.  The compiled route now includes
`VdVWOrderDualSubmartingaleConvergenceHandoff.proved`,
`VdVWLemma245TextbookReverseCofiltrationHandoff.of_countable_integrable`, and
`VdVWTheorem243_fullSubgraph_integrable_pGlivenkoCantelli_inMean_and_lemma245_canonical_strong_no_nonempty_of_countable_integrable`.
Those are the declarations to reuse; repeating reverse/cofiltration handoff
wrappers is now lower priority than closing the selected-entropy/source gap.

2026-05-10 fixed-sign Rademacher mass primitive:
`Theorem243.lean` now proves the exact finite-product mass for a deterministic
Rademacher sign vector:
`vdVWRademacherLaw_singleton_of_eq_neg_one_or_one`,
`vdVWProductMeasure_vdVWRademacherLaw_singleton_signVector`,
`measure_vdVWProductMeasure_prod_vdVWRademacherLaw_signSlice`, and
`measure_mul_rademacherSignVector_mass_le_prod_of_signSlice_subset`.
This is source-facing because it quantifies the real coefficient in any
fixed-fiber/sign-slice proof attempt: a single deterministic sign contributes
`(1 / 2)^n`, not unit mass.  Future probability work can use this to build a
coefficient-correct fixed-fiber route, or to rule it out in favor of the
already compiled integrated product-pair symmetry.

The same coefficient accounting is now available at the outer-probability
projection layer through
`VdVWOuterProbability_mul_rademacherSignVector_mass_le_of_signSlice_subset`.
It states that a fixed-sign slice proof can only transfer `left` to `right`
with the factor `(1 / 2)^n`, so it cannot be silently substituted for the
displayed Chebyshev beta factor required by the textbook route.

The variable deterministic sign-section form is also compiled:
`measure_mul_rademacherSignVector_mass_le_prod_of_pointwise_sign_section` and
`VdVWOuterProbability_mul_rademacherSignVector_mass_le_of_pointwise_sign_section`.
These close the natural loophole "choose one sign depending on the sample":
even pointwise deterministic sign choice still contributes only `(1 / 2)^n`.

The route audit now has a compiled asymptotic obstruction:
`tendsto_rademacherSignVector_singleton_mass_zero`,
`eventually_rademacherSignVector_singleton_mass_lt_half`, and
`eventually_rademacherSignVector_singleton_mass_lt_displayedChebyshevBeta`.
So the fixed-sign/section mass is eventually below the displayed Chebyshev
beta factor; the next valid source proof must average over a nontrivial
sign/ghost event or add an explicit stronger probability hypothesis.

The obstruction is also available in direct negative form:
`eventually_not_displayedChebyshevBeta_le_rademacherSignVector_singleton_mass`
and
`not_eventually_displayedChebyshevBeta_le_rademacherSignVector_singleton_mass`.
This rules out any endpoint proof that tries to upgrade a deterministic
sign-section coefficient `(1 / 2)^n` into the displayed Chebyshev beta by an
eventual monotonicity argument.

2026-05-10 Chapter 1.12 bounded-Lipschitz / Levy-Prokhorov foundation:
`WeakConvergence.lean` now gives VdV&W-numbered measure-level wrappers for the
bounded-Lipschitz determining-class theorem and the Levy-Prokhorov metric
criterion:
`vdVW1122_weakConvergenceProbabilityMeasures_of_forall_bounded_lipschitz_integral_tendsto`,
`vdVW1122_forall_bounded_lipschitz_integral_tendsto_of_weakConvergenceProbabilityMeasures`,
`vdVW1124_weakConvergenceProbabilityMeasures_iff_levyProkhorovDist_tendsto_zero`,
`vdVW1124_weakConvergenceProbabilityMeasures_of_levyProkhorovDist_tendsto_zero`,
and
`vdVW1124_levyProkhorovDist_tendsto_zero_of_weakConvergenceProbabilityMeasures`.
These close the ordinary probability-measure core of VdV&W 1.12.2 and 1.12.4
using pinned mathlib; the remaining exact textbook gap is still the
arbitrary-map/nonmeasurable outer-expectation version.

2026-05-10 Chapter 1.10/1.11 numbered weak-convergence wrappers:
`WeakConvergence.lean` now names the measurable common-domain part of
VdV&W Lemma 1.10.2(ii) as
`vdVW1102_ii_tendstoInDistribution_of_vdVWConvergesInOuterProbability` and
the local signed bounded-continuous arbitrary-map consequence as
`vdVW1102_ii_to_signedBoundedContinuousArbitraryMap_aemeasurable`.  The same
round names fixed continuous-map Theorem 1.11.1 wrappers for measurable
convergence in distribution, signed arbitrary maps, and varying-domain
endpoints:
`vdVW1111_tendstoInDistribution_continuous_comp`,
`vdVW1111_signedBoundedContinuousArbitraryMap_comp_continuous`, and
`vdVW1111_signedBoundedContinuousVaryingDomains_comp_continuous`.  These reuse
pinned mathlib continuous mapping and the local signed-outer expectation layer;
the full varying-map/nonmeasurable VdV&W theorem remains separate.

2026-05-10 selected half-radius a.e. finite-net source bridge:
`Theorem243.lean` now compiles
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_selected_truncated_halfRadius_eventualAe_scaledFiniteNetHoeffdingUpper`.
This is a source-interface improvement for Theorem 2.4.3: a future
ghost/Rademacher proof may state its a.e. scaled finite-net domination directly
for the canonical selected least cardinality at radius `eta / 2`; the theorem
then discharges the selected-cardinality comparison and stochastic entropy
radius change.  The remaining open work is still the probability proof of that
domination, not another endpoint assembly step.

2026-05-10 canonical Rademacher/hphi selected-cover consumer:
`Theorem243.lean` now also compiles
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_selected_truncated_halfRadius_canonicalRademacher_countable_hphi_id`.
It uses the first-level selected cover internally and derives the scaled a.e.
finite-net domination from the canonical finite-center Hoeffding event plus
the canonical `Phi(x)=x` comparison.  The remaining source work is therefore
localized to those two probability inputs for the selected half-radius cover.

2026-05-10 canonical ghost/Rademacher selected-net event:
The simpler canonical selected-net event now has countability-based
measurability wrappers through
`measurableSet_VdVWTheorem243CanonicalGhostRademacherSelectedNetEvent_of_sample_coordinate_countable`
and a selected-cardinality displayed-beta constructor
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_canonicalGhostRademacher_sample_coordinate_countable`.
The remaining input on this lane is no longer event measurability; it is the
actual displayed beta fiber lower bound for
`VdVWTheorem243CanonicalGhostRademacherSelectedNetEvent`.

The same canonical event now reaches the fixed-`M` stochastic-entropy endpoint
through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_canonicalGhostRademacher_countable_firstLevel`.
This internalizes the first-level selected cover, selected-cardinality
comparison, radius-halved entropy input, and selected-center coordinate
measurability.  The dashboard frontier for this lane is therefore a single
source probability input: the displayed Chebyshev beta fiber lower bound for
`VdVWTheorem243CanonicalGhostRademacherSelectedNetEvent`.

The ghost-coordinate part of that source input is now compiled away.  The
sign-only canonical event
`VdVWTheorem243CanonicalRademacherSelectedNetEvent` feeds the ghost event by
`VdVWTheorem243CanonicalGhostRademacherSelectedNetEvent_fiber_lower_bound_of_rademacher_fiber_lower_bound`,
and the displayed-beta constructor
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_canonicalRademacher_selectedNetEvent_sample_coordinate_countable`
uses that lift directly.  The remaining probability target on this lane is
therefore the displayed beta lower bound for the Rademacher sign fiber of the
sign-only event.

The sign-only event now also reaches fixed-`M` convergence directly through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_canonicalRademacher_countable_firstLevel`.
This is the current sharpest endpoint for the canonical lane: all first-level
selected-cover bookkeeping is internal, and the only exposed source input is
the displayed beta lower bound for
`VdVWTheorem243CanonicalRademacherSelectedNetEvent`.

That sign-only source input is now split by
`VdVWTheorem243CanonicalRademacherSelectedNetEvent_fiber_lower_bound_of_rademacherBad_ae_finiteCenter`
and the fixed-`M` endpoint
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_ae_finiteCenter_countable_firstLevel`.
The dashboard frontier is now: prove displayed beta mass for the pure
Rademacher bad event over centered-bad samples, and prove the selected
finite-center Hoeffding side condition a.e. for the first-level cover.

The sign-only lane now has an explicit failure-tail replacement for the
finite-center a.e. assumption:
`VdVWTheorem243CanonicalRademacherSelectedNetEvent_fiber_lower_bound_of_rademacherBad_finiteCenter_failure_tail`.
It derives the canonical sign-fiber lower bound up to an additive
finite-center Hoeffding failure-tail term, using the existing fixed-sample
Rademacher finite-center Hoeffding bound.  The practical frontier is therefore
sharper: either integrate this tail error and prove it vanishes under stronger
cardinality/tail assumptions, or use the product-pair averaged sign/ghost
failure-tail route that is already compiled.

The sign-only inverse-square tail branch now has the same lower-growth
consumer shape as the product-pair branch.  The new compiled endpoints
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_invSq_tail_countable_of_eventually_cardinality_ge`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_invSq_tail_countable_of_eventually_ae_cardinality_ge`
replace the raw single-sample inverse-square lintegral assumption by pointwise
or a.e. selected-cardinality lower growth tending to infinity.

The finite-class route now also reuses the scratch-branch no-global-countability
package:
`VdVWTheorem243_finite_indexClass_textbookAligned_canonical_slln_no_global_countable`.
It keeps the direct finite-class `P`-GC and Lemma 2.4.5 conclusions available
from `indexClass.Finite`; only the in-mean finite-product integral upgrade
stays in the stronger countable theorem.

The finite-class in-mean upgrade now has a no-global-countability consumer:
`integral_vdVWWeightedClassSupremum_centered_tendsto_zero_of_finite_indexClass_endpointL1_no_global_countable`
and
`VdVWTheorem243_finite_indexClass_textbookAligned_canonical_slln_and_inMean_no_global_countable_of_endpointL1`.
They use finite-sum domination of the centered supremum by the absolute
centered empirical averages and require only fixed-endpoint `L1(P^n)`
convergence for each member of the finite class.  Remaining finite-class
work: prove that endpoint `L1` convergence from mathlib strong-law/Lp
machinery or an equivalent finite-product transport theorem.

That remaining finite-class endpoint work is now closed.  The compiled theorem
`endpoint_integral_abs_empiricalAverage_sub_integral_tendsto_zero_of_integrable`
derives fixed-endpoint finite-product `L1(P^n)` convergence from mathlib
`strong_law_Lp`; the unconditional package
`VdVWTheorem243_finite_indexClass_textbookAligned_canonical_slln_and_inMean_no_global_countable`
therefore gives finite-class `P`-measurability, finite envelope expectation,
outer-probability `P`-GC, outer-a.s. `P`-GC, local `P`-GC, in-mean centered
supremum convergence, and canonical Lemma 2.4.5 a.s. convergence without a
global `Countable Index`.

The sign-only lower-growth branch has now been promoted to the canonical
first-level selected-cover interface.  The compiled endpoints
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_invSq_tail_countable_of_selected_truncated_halfRadius_firstLevel_of_eventually_cardinality_ge`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_invSq_tail_countable_of_selected_truncated_halfRadius_firstLevel_of_eventually_ae_cardinality_ge`
choose the countable first-level selected cover internally and discharge the
selected-cardinality comparison, radius change, and selected-center
measurability.  The remaining dashboard blocker for this lane is no longer
bookkeeping; it is the pure Rademacher bad-fiber beta lower bound plus a
structural lower-growth theorem for the canonical selected cardinality.

The honest product-pair Chebyshev lane now also has an untruncated
first-level endpoint:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_signSample_ae_finiteCenter_halfScale_of_selected_truncated_quarterRadius_firstLevel`.
It combines the compiled fixed-`M` product-pair selected-cover theorem with
the large-`M` envelope-tail handoff.  The current blocker on this lane is not
GitHub sync or mathlib discovery; it is proving the per-truncation
original/ghost a.e. finite-center support facts for the canonical
quarter-radius first-level selected cover.

The product-pair inverse-square failure-tail lane now has the corresponding
untruncated endpoint under a.e. selected-cardinality lower growth:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_finiteCenter_failure_tails_halfScale_of_selected_truncated_quarterRadius_firstLevel_of_eventually_ae_cardinality_ge`.
This removes the raw integrated failure-tail and large-`M` bookkeeping from
that route.  Its remaining blocker is an actual structural proof that the
canonical original and ghost selected quarter-radius cover cardinalities grow
at a deterministic rate tending to infinity, almost surely.

The sign-only inverse-square lower-growth branch now also reaches the
untruncated theorem layer through
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_rademacherBad_finiteCenter_invSq_tail_countable_of_selected_truncated_halfRadius_firstLevel_of_eventually_ae_cardinality_ge`.
The exposed inputs are now sharply mathematical: the pure Rademacher bad-event
lower bound and a.e. lower growth of the canonical half-radius selected
cardinality, both for each positive truncation level.

The lower-growth blocker is now formally separated from the stochastic-entropy
assumption.  `Theorem243.lean` proves
`tendsto_log_const_cardinality_div_atTop_nhds_zero`,
`not_tendsto_const_cardinality_atTop`,
`VdVWConvergesInOuterProbabilityConst_zero_of_const_terminal_cardinality`, and
`vdVWTheorem243_const_terminal_cardinality_entropy_zero_not_lowerGrowth`.
These show that a constant terminal selected cardinality has normalized
log-cardinality converging to zero in the local outer-probability sense, while
the same cardinality cannot tend to infinity.  The current blocker is
therefore not a missing mathlib convenience lemma: mathlib's
`Filter.not_tendsto_const_atTop` supplies the core obstruction.  What remains
is a real probabilistic/geometric source theorem giving lower growth under
additional structure, or a direct Chebyshev/product-fiber route that avoids
the inverse-square failure-tail lower-growth requirement.

The fixed-fiber pair-difference route now also reaches the untruncated theorem
layer.  The compiled endpoint
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_signSwap_ae_finiteCenter_halfScale`
packages the fixed-`M`
`..._of_pairDifferenceChebyshev_signSwap_ae_finiteCenter_halfScale` theorem
through the large-`M` envelope-tail handoff.  This gives a non-lower-growth
untruncated lane, but the source assumptions are still the hard ones:
measurability of the concrete pair-difference event, fixed-original sign-swap
transport with the right coefficient, and original/ghost selected finite-center
a.e. support.

The canonical displayed-beta first-level source wrappers also now reach the
untruncated theorem layer:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_signSwapBad_fibers`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_pairSubBad_signSwap_fibers`.
They internalize the countable first-level selected cover and leave only the
probability-side source inputs: sign-swapped bad-fiber mass, or pair-sub
bad-event mass plus fixed-original sign-swap transport, together with the
original/ghost finite-center a.e. support facts.

The raw product-pair Chebyshev source layer now also has arbitrary positive
sample-size forms:
`VdVWChebyshev_betaLower_named_centeredPairSubBadEvent_centeredTruncated_uniformWeights_of_pos`,
`VdVWTheorem243_productPair_centeredPairSubBadEvent_lower_bound_of_chebyshev_of_pos`,
`VdVWTheorem243_productPair_centeredPairSubRademacherBadEvent_lower_bound_of_chebyshev_of_pos`,
`VdVWTheorem243_productPair_centeredPairSubRademacherBadEvent_integral_lower_bound_of_chebyshev_of_pos`, and
`VdVWTheorem243_productPair_centeredPairSubRademacherBadEvent_integral_lower_bound_of_chebyshev_of_pos_of_countable`.
These remove a recurring successor-index adapter gap before the next source
proof, but they do not solve the probability-side displayed-beta/sign-swap
blocker.

The fixed-fiber sign-swap route now has the valid coefficient-correct all-one
slice theorem:
`VdVWRademacherSignVector_const_one`,
`VdVWTheorem243CenteredPairSubSignSwapBadEvent_lower_bound_of_pairSubBad_constOne`,
and
`VdVWTheorem243CenteredPairSubSignSwapBadEvent_lower_bound_of_chebyshev_constOne_of_pos`.
This formally transports pair-sub Chebyshev mass to the sign-swapped bad event
only with the exact `(2⁻¹)^n` Rademacher coefficient.  It confirms the
unit-coefficient fixed-fiber assumption is not justified by this route; the
remaining displayed-beta blocker still needs averaged sign/ghost mass or an
explicit stronger structural hypothesis.

The coefficient loss is now also recorded in the displayed-beta scale:
`eventually_displayedChebyshevBeta_mul_rademacherSignVector_singleton_mass_lt_displayedChebyshevBeta`,
`eventually_not_displayedChebyshevBeta_le_displayedChebyshevBeta_mul_rademacherSignVector_singleton_mass`,
and
`not_eventually_displayedChebyshevBeta_le_displayedChebyshevBeta_mul_rademacherSignVector_singleton_mass`
prove that the all-one fixed-sign coefficient is eventually too small even
after starting from the displayed Chebyshev beta.  Do not reopen the
deterministic fixed-sign shortcut; the live source target is averaged
sign/ghost mass or a stated stronger structural tail/cardinality route.

The canonical selected-net layer now has deterministic sign-negation
symmetry:
`vdVWFiniteCenterWeightedSupremum_neg_weights`,
`VdVWTheorem243FiniteCenterMaximalBound_neg_weights_iff`,
`vdVWFiniteCenterWeightedSupremum_rademacherWeights_neg_sign`,
`VdVWTheorem243RademacherFiniteCenterHoeffdingBound_neg_sign_iff`,
`mem_VdVWTheorem243CanonicalRademacherSelectedNetEvent_neg_sign_iff`, and
`mem_VdVWTheorem243CanonicalGhostRademacherSelectedNetEvent_neg_sign_iff`.
This is support infrastructure for the averaged sign/ghost route.  It does not
solve the displayed-beta source primitive, but it prevents future work from
duplicating finite-center side-condition transport when signs are flipped.

The product-pair finite-center support assumptions have now been unified on
the honest Chebyshev lane.  The compiled wrappers
`ae_VdVWTheorem243RademacherFiniteCenterHoeffdingBound_neg_sign`,
`ae_vdVWProductMeasure_rademacher_prod_productPair_ghostFiniteCenter_neg_of_ae_sign_sample_unneg`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_signSample_ae_finiteCenter_halfScale_of_pos_unneg`,
`VdVWTheorem243ProductPairRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_countable_signSample_ae_finiteCenter_halfScale_of_selected_truncated_quarterRadius_firstLevel_unneg`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_productPairChebyshev_countable_signSample_ae_finiteCenter_halfScale_of_selected_truncated_quarterRadius_firstLevel_unneg`
show that the ghost negated-sign finite-center support follows from the same
unnegated sign-sample support theorem used on the original coordinate.  The
remaining dashboard blocker on this lane is therefore a single canonical
selected-cover finite-center support theorem plus the existing stochastic
entropy/log-cardinality input; the displayed-beta probability-mass source
blocker remains open.

The canonical displayed-beta first-level route now has the same support
unification.  `Theorem243.lean` adds product/Fubini support lifts
`ae_vdVWProductMeasure_prod_rademacher_finiteCenter_fixed_sample_of_ae_sign`
and
`ae_vdVWProductMeasure_prod_rademacher_finiteCenter_neg_of_forall_ae_sign`,
then packages them in the fixed-`M` and untruncated sign-sample endpoints
ending in `_of_signSample_finiteCenter` for both `signSwapBad_fibers` and
`pairSubBad_signSwap_fibers`.  The old two-assumption
original/ghost finite-center support surface is now a one-assumption
sign-only support surface.  What remains is the actual probability source:
displayed-beta sign-swapped bad-fiber mass, or pair-sub bad-event mass plus a
coefficient-correct sign-swap transport, not another support wrapper.

The fixed-fiber pair-difference branch now has the corresponding canonical
first-level endpoint:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_signSwap_countable_firstLevel_of_signSample_finiteCenter`
and its untruncated large-`M` packaging
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_signSwap_countable_firstLevel_of_signSample_finiteCenter`.
This route now internalizes the selected event measurability and the
original/ghost finite-center support transport from a single sign-only support
hypothesis.  The remaining dashboard blocker for the fixed-fiber branch is
therefore the actual coefficient-correct sign-swap probability transport, not
selected-cover measurability or duplicated support plumbing.

The generic product-fiber source interface now also has almost-everywhere
variants:
`measure_mul_le_prod_measure_of_ae_fiber_lower_bound`,
`measure_mul_le_prod_measure_add_setLIntegral_error_of_ae_fiber_lower_bound_add_error`,
`VdVWOuterProbability_mul_left_le_of_ae_product_fiber_lower_bound`, and
`VdVWOuterProbability_mul_left_le_of_ae_product_fiber_lower_bound_add_error`.
This lets the next averaged sign/ghost proof state its fiber lower bound
`P.restrict left`-a.e. instead of pointwise for every centered-bad sample.  It
does not close the Lemma 2.3.7 probability source, but it removes an avoidable
over-strengthening from the source interface.

The a.e. product-fiber interface now reaches the exact factor-two
original-or-ghost selected-net projection as
`VdVWOuterProbability_mul_left_le_two_mul_of_ae_product_fiber_lower_bound_or_ghost`
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_ae_ghost_product_fiber_lower_bound_or_selectedNet`.
This is the preferred target for the next genuine source proof: construct a
measurable ghost/Rademacher joint event whose displayed Chebyshev beta fiber
mass holds almost everywhere on the centered-bad original samples and whose
points project into the original or ghost selected finite-net bad event.  The
dashboard blocker remains that probability-mass theorem, not the
measure-theoretic factor-two plumbing.

The sign-only Rademacher finite-center failure-tail bridge now has the same
a.e. source shape:
`VdVWTheorem243CanonicalRademacherSelectedNetEvent_outerProbability_bound_of_ae_rademacherBad_finiteCenter_failure_tail`
and
`VdVWTheorem243CanonicalRademacherSelectedNetEvent_outerProbability_bound_of_ae_rademacherBad_finiteCenter_failure_tail_sample_coordinate_countable`.
This lets a future Fubini or conditional argument prove the pure Rademacher
bad-fiber beta mass only almost everywhere on the centered-bad original
samples, while still paying the integrated finite-center Hoeffding failure
tail.  The remaining source blocker is still the probability-mass theorem
itself; the immediate dashboard follow-up is to propagate this a.e. `hbadLower`
shape through the fixed-`M`/first-level sign-only convergence consumers.

The a.e. pure Rademacher source shape has now been propagated through the
fixed-`M` sign-only convergence layer:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_failure_tail_countable`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_invSq_tail_countable`.
The route now accepts a.e. bad-fiber mass plus either a vanishing integrated
finite-center failure tail or the inverse-square selected-cardinality
lintegral condition.  The remaining probability blocker is still the a.e.
pure Rademacher bad-fiber mass theorem.

The selected first-level lower-growth propagation is now also compiled for the
same a.e. source surface:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_invSq_tail_countable_of_eventually_cardinality_ge`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_invSq_tail_countable_of_eventually_ae_cardinality_ge`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_invSq_tail_countable_of_selected_truncated_halfRadius_firstLevel_of_eventually_cardinality_ge`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_invSq_tail_countable_of_selected_truncated_halfRadius_firstLevel_of_eventually_ae_cardinality_ge`, and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_rademacherBad_finiteCenter_invSq_tail_countable_of_selected_truncated_halfRadius_firstLevel_of_eventually_ae_cardinality_ge`.
The dashboard blocker for this lane is therefore no longer downstream
propagation; it is the actual probability theorem proving the a.e. pure
Rademacher bad-fiber lower bound, or a coefficient-correct product-pair/
pair-sub sign-swap substitute.

The base-measure source handoff is now also compiled through
`eventually_ae_restrict_of_eventually_ae_imp_dep` and
`VdVWTheorem243_eventually_ae_rademacherBad_restrict_centeredBad_of_eventually_ae_imp`.
This means the next source proof can output the more natural Fubini shape
`P^n`-a.e. on the centered-bad event, rather than constructing a restricted
measure a.e. statement by hand.  It is plumbing only; the remaining blocker is
still the pure Rademacher bad-fiber mass theorem or the coefficient-correct
product-pair/sign-swap replacement.

The countable-class centered-bad measurability side condition for that handoff
is now discharged by
`measurableSet_vdVWWeightedClassSupremum_centered_truncated_bad_of_countable`
and
`VdVWTheorem243_eventually_measurableSet_centeredBad_truncated_of_countable`.
The countable adapter
`VdVWTheorem243_eventually_ae_rademacherBad_restrict_centeredBad_of_eventually_ae_imp_countable`
therefore reduces the source surface to the base-product a.e. implication
itself.  The same Lean update also exposes
`VdVWTheorem243SymmetrizationPrecursor.centered_ofReal_le_two_finiteNetHoeffdingUpper_add_of_pairSubBad_signSwap_fibers`
for product-space random-sign finite-net comparisons without a separate
fixed-sample `hphi_id` premise.

The concrete pair-difference selected-net displayed-beta source layer now
also accepts restricted-a.e. fibers:
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_ae_pairDifferenceGhostRademacher_selectedNetEvent`
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_ae_pairDifferenceGhostRademacher_selectedNetEvent_sample_coordinate_countable`.
These wrappers specialize the generic a.e. factor-two product bridge to
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent` and discharge
event measurability from the countable selected-center coordinate assumptions.
The dashboard blocker is therefore sharpened: future source work may prove an
a.e. displayed-beta fiber lower bound directly for the concrete
pair-difference event; it no longer needs to state a pointwise all-bad-samples
fiber hypothesis at this layer.

That concrete pair-difference a.e. source layer now also accepts the natural
base-measure implication form through
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_eventual_ae_imp_pairDifferenceGhostRademacher_selectedNetEvent_sample_coordinate_countable`.
The next source theorem can therefore target
`P^n`-a.e. samples with `centeredBad sample -> beta <= pairDifferenceFiberMass`
and let the bridge handle restriction to the centered-bad measure plus
countable event measurability.  This removes another statement-shape blocker;
it does not prove the pair-difference fiber mass itself.

The selected half-radius pair-difference route now has the same a.e. and
base-a.e. source shape:
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_ae_sample_coordinate_countable`
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_ae_imp_sample_coordinate_countable`.
These target the canonical selected truncated cover at radius `eta / 2` and
derive selected-cardinality measurability internally.  The dashboard blocker
is now the actual probability theorem for that canonical selected cover, not a
remaining selected-cardinality plumbing obligation.

The same pair-difference source surface is now specialized all the way to the
canonical countable first-level selected cover:
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_firstLevel_ae_countable`
and
`VdVWTheorem243DisplayedChebyshevBetaSelectedOuterProbabilityComparison.of_selected_truncated_halfRadius_cardinality_firstLevel_ae_imp_countable`.
These wrappers accept either restricted-a.e. pair-difference fibers or the
base-`P^n` a.e. centered-bad implication while choosing the first-level cover
internally.  The remaining dashboard blocker for this lane is therefore the
probability source theorem for the canonical first-level selected cover.

The fixed-`M` stochastic-entropy handoff now consumes that a.e. first-level
source surface directly:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_primitive`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_ae`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_ae_imp`.
The dashboard blocker has moved to the actual probability proof for the
canonical first-level selected-cover pair-difference fiber mass; fixed-`M`
propagation is no longer a separate obstruction.

The first-level pair-difference source is now factored one level lower in the
a.e. shape:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_ae_signSwapBad_fibers`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_ae_imp_signSwapBad_fibers`.
They expose the sign-swapped pair-sub bad-fiber mass as the remaining a.e.
probability source, with original/ghost selected finite-center support kept as
explicit side conditions.  The dashboard blocker for this lane is now that
sign-swapped bad-fiber mass theorem, or the coefficient-correct pair-sub
transport below it.

The a.e. sign-swapped source lane now also has one-sign finite-center support
wrappers:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_ae_signSwapBad_fibers_of_signSample_finiteCenter`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_ae_imp_signSwapBad_fibers_of_signSample_finiteCenter`.
They turn the single sign-sample finite-center support hypothesis into the
original and sign-negated ghost finite-center hypotheses needed by the
restricted-a.e. and base-a.e. sign-swapped bad-fiber consumers.  The dashboard
frontier is therefore the probability theorem for the sign-swapped pair-sub
bad-fiber mass, not another finite-center side-condition bridge.

The lower pair-sub/sign-swap source split now has the same a.e. one-sign
surface:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_ae_pairSubBad_signSwap_fibers_of_signSample_finiteCenter`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_displayedBeta_countable_firstLevel_of_ae_imp_pairSubBad_signSwap_fibers_of_signSample_finiteCenter`.
They combine an a.e. unswapped pair-sub displayed-beta lower bound with an
a.e. fixed-original sign-swap transport before feeding the a.e. sign-swapped
bad-fiber consumer.  The dashboard frontier is now the actual a.e.
probability source for those two inputs, or the averaged product-pair route
that avoids fixed-original transport.

The pair-sub/sign-swap route now also has the lower half-scale
outer-probability bridge in restricted-a.e. form:
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_pairSub_badEvent_ae_signSwap_lower_bound_of_pos`
and
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_outerProbability_bound_of_chebyshev_pairSub_badEvent_ae_signSwap_lower_bound_halfScale_of_pos`.
They reuse the pointwise Chebyshev pair-sub mass theorem and allow only the
fixed-original sign-swap transport to be a.e. on the centered-bad left event.
The dashboard frontier is therefore sharpened to the actual a.e. sign-swap
transport theorem, or to the averaged product-pair source that replaces it.

That restricted-a.e. half-scale sign-swap bridge now reaches the fixed-`M`
selected-cover endpoint:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_ae_signSwap_ae_finiteCenter_halfScale`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_ae_signSwap_countable_firstLevel_of_signSample_finiteCenter`.
The first theorem propagates the a.e. sign-swap source through the
stochastic-entropy beta/penalty machinery; the second chooses the countable
first-level selected cover and supplies centered-bad measurability from the
countable class interface.  The dashboard blocker remains the source
sign-swap transport itself, not fixed-`M` propagation.

The same sign-swap lane now accepts the natural base-measure implication form:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_ae_imp_signSwap_ae_finiteCenter_halfScale`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_ae_imp_signSwap_countable_firstLevel_of_signSample_finiteCenter`.
They use the existing dependent a.e.-restriction helper to turn
`P^n`-a.e. conditional transport on centered-bad samples into the
`P^n.restrict centeredBad` source required downstream.  The dashboard frontier
is now the actual conditional sign-swap transport proof, or the averaged
product-pair alternative.

The base-measure implication surface now reaches the untruncated centered
convergence endpoint:
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_ae_imp_signSwap_ae_finiteCenter_halfScale`
and
`VdVWTheorem243_centered_untruncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_pairDifferenceChebyshev_ae_imp_signSwap_countable_firstLevel_of_signSample_finiteCenter`.
These compose the fixed-`M` base-a.e. sign-swap handoffs with the large-`M`
untruncation theorem.  The dashboard blocker for this lane is now purely the
probability source theorem: prove the conditional fixed-original sign-swap
transport for `P^n`-a.e. centered-bad samples, or use the product-pair route
that avoids that transport.

The product-fiber route now has a generic original-or-ghost additive-error
projection:
`VdVWOuterProbability_product_fiber_event_le_two_mul_of_original_or_ghost`,
`VdVWOuterProbability_mul_left_le_two_mul_of_product_fiber_lower_bound_or_ghost_add_error`,
and
`VdVWOuterProbability_mul_left_le_two_mul_of_ae_product_fiber_lower_bound_or_ghost_add_error`.
This is the source-facing shape needed when finite-center failures are carried
as a samplewise error term rather than as an a.s. support hypothesis.  The
dashboard frontier remains the actual product-fiber/Chebyshev lower bound or
tail-control theorem, but that proof can now pay the integrated error over the
centered-bad left event directly.

The a.e. product-fiber samplewise-error source now feeds the fixed-`M`
stochastic-entropy convergence consumer directly:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_ghost_product_fiber_lower_bound_or_selectedNet_add_error`.
This theorem composes the measurable original/ghost/Rademacher joint event,
the a.e. displayed-beta fiber lower bound up to `errorSample`, and a
deterministic vanishing integrated-error bound with the Chebyshev penalty
machinery.  The frontier is therefore no longer a fixed-`M` wrapper; it is the
honest product-fiber lower bound or tail-control theorem that supplies those
source hypotheses.

The samplewise-error product-fiber lane now has its inverse-square
finite-center failure-tail specialization:
`vdVWTheorem243_selectedFailureTail_centered_setLIntegral_tendsto_zero_of_invSq_lintegral`,
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_ghost_product_fiber_lower_bound_or_selectedNet_finiteCenter_failure_tail_invSq`,
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_ghost_product_fiber_lower_bound_or_selectedNet_finiteCenter_failure_tail_of_eventually_cardinality_ge`.
The route can now pay centered-bad `errorSample` mass by the displayed
finite-center Hoeffding failure tail and close that tail with either an
inverse-square selected-cardinality lintegral or deterministic lower growth.
The dashboard blocker is now the a.e. product-fiber beta lower bound itself.

The same product-fiber finite-center failure-tail route now accepts a.e.
selected-cardinality lower growth through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_ghost_product_fiber_lower_bound_or_selectedNet_finiteCenter_failure_tail_of_eventually_ae_cardinality_ge`.
This matches the a.e. lower-growth source shape already available in the
sign-only route, so selected-cover growth no longer has to be pointwise in the
future product-fiber source theorem.

The fixed-`M` product-fiber source surface also now accepts base-measure a.e.
implications through
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_imp_ghost_product_fiber_lower_bound_or_selectedNet_add_error`.
The source proof may state the fiber lower bound as `P^n`-a.e.
`sample ∈ centeredBad -> ...`, with centered-bad measurability supplied
separately.

That base-a.e. implication source surface now also has the finite-center
failure-tail specializations
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_imp_ghost_product_fiber_lower_bound_or_selectedNet_finiteCenter_failure_tail_invSq`
and its deterministic/a.e. lower-growth wrappers.  This closes the combined
adapter: base-a.e. fiber lower bounds, finite-center `errorSample` tails, and
a.e. selected-cardinality growth now feed the fixed-`M` product-fiber route
without an extra manual restricted-measure conversion.

The fixed-original pair-difference source now has explicit finite-center
failure-tail accounting at the fiber level:
`VdVWTheorem243CenteredPairSubSignSwapFiberSourceEvent_lower_bound_of_badEvent_finiteCenter_failure_tails`
and
`VdVWTheorem243_pairDifferenceGhostRademacherSelectedNetEvent_fiber_lower_bound_of_centeredPairSubSignSwapBadEvent_finiteCenter_failure_tails`.
A lower bound for the centered sign-swapped bad event can now be promoted to
the concrete pair-difference selected-net fiber while paying exactly the
original fixed-sample Hoeffding tail plus the ghost-sample integrated tail.
The dashboard blocker is consequently the displayed-beta mass source for that
sign-swapped bad event, or the product-pair averaged replacement, rather than
another finite-center support adapter.

The same fixed-original source now has pointwise and restricted-a.e.
outer-probability consumers:
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_outerProbability_bound_of_signSwapBad_finiteCenter_failure_tails`
and
`VdVWTheorem243PairDifferenceGhostRademacherSelectedNetEvent_outerProbability_bound_of_ae_signSwapBad_finiteCenter_failure_tails`.
These feed the factor-two original-or-ghost selected-net comparison directly
from sign-swapped bad-fiber mass while preserving the two-tail additive error
`originalTail sample + ghostTail n`.  The dashboard frontier is now the
probability source for those sign-swapped bad fibers, or an averaged
product-pair replacement for fixed-original sign-swap transport.

The two-tail vanishing and fixed-`M` consumer layer is now compiled through
`vdVWTheorem243_selectedFailureTail_centered_setLIntegral_add_ghost_tendsto_zero_of_invSq_lintegral`
and
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_ghost_product_fiber_lower_bound_or_selectedNet_finiteCenter_failure_tails_invSq`.
The first theorem controls the centered-bad integral of
`originalTail sample + ghostTail n` from the existing inverse-square
selected-cardinality lintegral; the second feeds that plural-tail error into
the fixed-`M` a.e. product-fiber additive-error route.

The fixed-original sign-swap lane now has a direct fixed-`M` two-tail endpoint:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_signSwapBad_finiteCenter_failure_tails_invSq`.
It packages the concrete pair-difference selected-net event, restricted-a.e.
sign-swapped bad-fiber beta mass, and the two-tail finite-center error into
the convergence theorem with constant `2`.  The dashboard frontier is now only
the sign-swapped bad-fiber probability source itself, or the averaged
product-pair replacement that avoids fixed-original sign-swap transport.

The two-tail fixed-original sign-swap endpoint now also accepts the natural
base-measure implication source form:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_imp_signSwapBad_finiteCenter_failure_tails_invSq`.
After eventual centered-bad measurability, a `P^n`-a.e. implication on
membership in the centered bad event is converted internally to the
restricted-a.e. hypothesis.  The dashboard blocker remains the probability
theorem proving that implication.

That base-a.e. two-tail sign-swap endpoint now has a deterministic
lower-growth specialization:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_imp_signSwapBad_finiteCenter_failure_tails_of_eventually_cardinality_ge`.
Selected-cardinality growth tending to infinity now supplies the inverse-square
tail-control input for this source surface.  The dashboard frontier is still
the sign-swapped bad-fiber beta lower bound.

The same base-a.e. two-tail sign-swap surface now has an a.e. lower-growth
variant:
`VdVWTheorem243_fixedM_centered_truncated_convergesInOuterProbabilityConst_zero_of_forall_pos_radius_logCardinality_of_ae_imp_signSwapBad_finiteCenter_failure_tails_of_eventually_ae_cardinality_ge`.
This matches the natural eventual `P^n`-a.e. selected-cardinality growth shape,
so both remaining source-side hypotheses can be stated a.e.
