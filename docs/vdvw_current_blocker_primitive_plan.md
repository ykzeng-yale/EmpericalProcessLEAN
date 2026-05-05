# VdV&W Current Blocker Primitive Plan

Status date: 2026-05-04.

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
