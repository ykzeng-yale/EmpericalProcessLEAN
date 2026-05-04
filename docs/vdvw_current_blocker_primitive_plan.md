# VdV&W Current Blocker Primitive Plan

Status date: 2026-05-03.

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
integrated-Hoeffding mean convergence, truncation/tail, or final assembly
handoff.

## Active Blocker

Current main-line target: Theorem 2.4.3 and the Chapter 2
bracketing/measurable-class primitives it needs.

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
