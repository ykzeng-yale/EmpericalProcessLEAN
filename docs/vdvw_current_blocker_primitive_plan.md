# VdV&W Current Blocker Primitive Plan

Status date: 2026-05-02.

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
symmetrization/truncation, outer envelope-tail, entropy-to-convergence, or
final assembly handoff.

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
   measurable_vdVWTruncatedClassFun
   VdVWClassCoordinateMeasurable.truncate
   VdVWTheorem243TruncatedEntropyCondition
   VdVWTheorem243TruncatedEntropyConditionForAllEpsilonM
   ```

   Remaining Step 1 work: add the outer-integrability/envelope-tail handoff
   `P^* F{F > M}` when the proof reaches the symmetrization/truncation layer.
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
   `M` assumptions.  The remaining Theorem 2.4.3 blocker is now the
   symmetrization/truncation and outer envelope-tail layer, not the finite-net
   Rademacher/Hoeffding maximal scale.
5. Symmetrization/truncation layer: formalize or bridge Lemma 2.3.1,
   Fubini-compatible outer expectation, and the envelope-tail bound
   `P^* F{F > M}`.

   Status: the Chapter 1.2 nonnegative tail-product cover-majorant bridge is
   implemented as
   `VdVWOuterExpectation_tailProduct_le_lintegral_tail_cover`.  This is a
   reusable outer-expectation layer for envelope tails.  The companion
   Markov-style outer-probability bridge
   `VdVWOuterProbability_lt_le_outerExpectation_div_cover` is also compiled.
   The full Theorem 2.4.3 symmetrization/truncation argument and real-valued
   `P^* F{F > M}` convergence handoff remain pending.
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

Next exact edit: start the theorem-specific symmetrization/truncation layer
for Theorem 2.4.3.  First add a proof-carrying product/Fubini-compatible
symmetrization interface targeted to the `Phi(x)=x` case, reusing
`VdVWPMeasurableClass`, `VdVWClassCoordinateMeasurable.truncate`,
`StatInference/ProbabilityMeasure/ProductMeasure.lean`, and the existing
Rademacher law/construction.  In parallel, build the real-valued
`P^* F{F > M}` envelope-tail handoff from the existing outer-expectation
tail-product cover-majorant and Markov-style outer-probability bridge.

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
| local ProbabilityMeasure lane | `StatInference/ProbabilityMeasure` | Billingsley/probability-measure wrappers now available for generated sigma fields and pi-system uniqueness (`GeneratedSigma`, `generatedSigma_measurableSet_of_mem`, `generatedSigma_le`, `measurable_generatedSigma`, `measure_ext_of_generate_finite`, `probabilityMeasure_ext_of_generate_finite_toMeasure`, `probabilityMeasure_ext_of_generate_finite`, `isPiSystem_pi`, `pi_generatedSigma_eq`), weak convergence/Portmanteau including continuity-set, closed-set converse, and pi-system convergence wrappers, product/Fubini, FDDs, Borel-Cantelli, tails, strong laws, and reusable iid Rademacher signs. These are reusable for Chapter 1 generated-sigma/FDD/product-law foundations and later symmetrization support, but they do not close VdV&W arbitrary-map/asymptotic-measurability or the current Theorem 2.4.3 symmetrization/truncation, outer envelope-tail, entropy-to-convergence, and final assembly blockers. |
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
