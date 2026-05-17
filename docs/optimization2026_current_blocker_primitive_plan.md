# Optimization 2026 Current Blocker And Primitive Plan

This file is the active blocker register for the Chewi optimization lane.  It
should be checked at the start of each automation run before selecting a proof
target.

## Adaptive Automation Prompt Rule

The recurring Optimization heartbeat is part of the proof state.  Every
automation run should finish by checking whether its live prompt is stale
relative to this file, the dashboard, and the latest verified commit.  If the
run proves a Lean declaration, narrows a blocker, merges another agent's work,
changes the next atomic target, or records a material mathlib/local-code search
result, update the automation prompt before ending the run.

The refreshed prompt should name:

- the latest pushed commit and the exact new declarations or blocker
  refinement;
- a primary theorem/proof target plus the highest-value parallel support
  targets, with dependency order after them;
- the search-first scope: pinned mathlib, local `StatInference`, and existing
  optimization/probability/empirical-process wrappers;
- the verification gate: focused `lake env lean`, targeted `lake build` for
  promoted theorem layers, proof-hole scan, and secret scan;
- the report gate: no Optimization report without an exact source-matched
  theorem/lemma, screenshots, and local report compilation.

Do not update the prompt for wording-only churn.  Do update it whenever the old
prompt would send the next heartbeat toward a solved target, omit a newly
proved dependency, or hide the current blocker.

## Throughput Policy

The Optimization heartbeat should be aggressive proof work, not a one-wrapper
drip feed.  Each run should try to close a primary theorem/proof target and, in
parallel, prepare adjacent support that can be checked independently: mathlib
API discovery, local dependency reuse, source anchors, verification/report
policy, and one bounded Lean/doc worker when safe.  A small primitive is
acceptable only when it is the fastest verified dependency for the active proof
route or when the exact theorem target is blocked and the blocker is recorded
precisely.

Manual goal acceleration mode: avoid tiny push loops when other agents are
moving `origin/main`.  Prefer theorem packets with focused `lake env lean`
checks during development, route-doc updates after a verified packet, then a
single `lake build StatInference`/scan/commit/push gate for the batch.  Use
read-only scout agents to map future chapters and mathlib APIs while the main
thread proves the active theorem layer.  The current 2-4 hour route is:

Multi-book collaboration policy: when several local agents are working on
different textbook lanes, prefer isolated `git worktree` checkouts named by
book/lane for broad packets.  Keep shared `main` for narrow verified handoffs
only, never revert another lane's dirty or committed work, and merge/push
after a scoped Lean build and hygiene scan.
Do not share mutable `.lake/build` artifacts across active proof worktrees when
running root builds; a symlinked `.lake` can make unrelated local agents delete
or invalidate `.olean` files mid-build.  Use focused module Lean checks during
development, and treat missing-artifact root-build failures as infrastructure
until a focused proof/module check points to an actual theorem error.

## High-Accuracy High-Throughput Protocol

This section is the operating discipline for manual `/goal` runs.  It is meant
to prevent the two observed failure modes in this lane: stale route replay and
micro-packet overhead.

1. Source of truth.  The immutable app-level `/goal` objective is stale.  Until
   the full book is complete, route from `Live Goal Prompt V39`, this file's top
   sections, and the dashboard snapshot, not from older ASGD or Chapter 3
   archived wording.
2. Packet size.  A normal run should target a theorem-sized packet: one
   primary Lean theorem layer plus any directly needed algebra/interface
   support and route-doc updates.  Do not commit a search-only or
   wording-only change unless it records a genuine blocker or prevents a
   wrong next run.
3. Search cache.  Search mathlib and local `StatInference` before adding a
   primitive, but write down only material results that change the route.
   Reuse the cached search results in this document before repeating broad
   `rg` passes.
4. Worktree discipline.  Broad Optimization proof packets should run in an
   isolated Optimization worktree such as `/tmp/chewi-dual-seminorm`.  Fetch/rebase at
   the start and once immediately before push; avoid repeated fetch/rebase
   loops while a focused proof packet is still being developed.
5. Verification tiers.  During development, use focused
   `lake env lean StatInference/Optimization/<module>.lean` checks.  Promote
   with `lake build StatInference.Optimization.<Module>` after a public theorem
   layer compiles.  Reserve root `lake build StatInference` for root-import or
   broad cross-module changes, especially while `.lake` artifacts are shared
   with other active agents.
6. Git cadence.  Batch code, docs, proof-hole scan, secret scan, and final
   rebase into one push.  If the push is rejected, rebase once, rerun the
   focused module build and scans, then push.  Do not restart source search or
   route planning merely because `origin/main` moved.
7. Agent ownership.  When the user explicitly authorizes subagents, the main
   thread owns the active proof and proof integration.  Scouts should be
   read-only or have disjoint write sets: mathlib API scout, local reuse scout,
   source-anchor scout, one bounded Lean worker for the adjacent theorem, and
   one verification/cleanup scout.
8. Proof-gap policy.  Supplied interfaces are allowed only as named temporary
   gates with a recorded discharge route.  Exact theorem reports remain
   blocked until the source theorem/lemma statement itself is fully proved with
   no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
9. Exercise policy.  Exercise statements and cheap reusable exercise proofs may
   accumulate in `StatInference/Optimization/Exercises.lean`, but exercise work
   must not consume the main theorem packet budget unless it unlocks a
   main-text theorem.
10. Dirty Lean truth gate.  If a manual run starts with a dirty Lean diff, first
    compile or sharply block that diff before doing process or route work.  Do
    not leave an unverified theorem in progress while updating strategy docs.

## Proof Packet Contract

Every manual proof run should begin by fixing the packet contract below before
editing Lean.  This is the live replacement for the stale app-level `/goal`
objective and should be preferred over archived prompts.

- Primary theorem packet: one theorem-sized endpoint or one hard proof layer
  that directly removes a supplied assumption.  Name the exact Lean statement
  to prove, the source theorem/lemma it supports, and the module that owns it.
- Reuse boundary: list the already-compiled local declarations and mathlib APIs
  that must be reused.  Run at most one bounded extra search pass for the
  active blocker, then stop searching and prove.
- Edit set: keep writes scoped to the packet owner module plus material route
  docs.  Introduce a new module only when it isolates a reusable theorem family
  or prevents multiple agents from editing the same large file.
- Success gate: state the focused Lean command and, for public theorem layers,
  the targeted `lake build StatInference.Optimization.<Module>` promotion
  command.  Root builds are reserved for root-import or broad cross-module
  changes.
- Failure gate: if the endpoint does not close, record the exact attempted
  theorem, the stuck subgoal or missing API, the search tried, and two viable
  next routes.  Avoid vague labels such as "next small gap".

## Live Goal Prompt V39

Use this as the current `/goal` replacement.  The app-level objective text is
stale and cannot be edited until the whole textbook goal is complete.

Current active frontier: the concrete standard preliminary stage now feeds a
concrete source-coordinate standard main-stage Newton recursion for §13.16
objective-gap accuracy.  Previously compiled handoff declarations include:
`Chewi1316SourceMainStageObjectiveGapHandoff`,
`chewi1316_sourceMainStageObjectiveGapHandoff_of_preliminaryInit`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
and
`chewi1316_sourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`,
plus the concrete main-stage layer
`chewi1316_standardSourceMainStageTSeq`,
`chewi1316_standardSourceMainStageXSeq`,
`Chewi1316StandardSourceMainStageObjectiveGapHandoff`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_of_sourceMainStageObjectiveGapHandoff`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
and
`chewi1316_standardSourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`.
The V16/V17 route-reduction declarations remain available:
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_range_decrement_lt_one`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_source_decrement_lt_one`,
`chewi1316_standardSourceMainStage_objective_gap_le_eps_of_source_decrement_lt_one`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_range_decrement_le_quarter`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_source_decrement_le_quarter`,
`chewi1316_standardSourceMainStage_objective_gap_le_eps_of_source_decrement_le_quarter`,
and `chewi1316_standardSourcePreliminaryXSeq_rangeRestrict_mem_of_sourceMem`.

The V18 packet closes the concrete main-stage membership/decrement blocker.
Compiled declarations in `StatInference/Optimization/InteriorPoint.lean`:
`chewi1316_polytopeSlackNegLog_range_mainStage_preNewtonDecrement_le_update_bound`,
`chewi1316_polytopeSlackNegLog_range_mainStage_preNewtonDecrement_lt_one`,
`chewi1316_polytopeSlackNegLog_range_mainStage_step_mem`,
`chewi1316_polytopeSlackNegLog_range_mainStage_decrement_le_quarter`,
`chewi1316_polytopeSlackNegLog_range_mainStage_step_mem_and_decrement_le_quarter`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_and_range_decrement_le_quarter`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_and_source_decrement_le_quarter`,
and
`chewi1316_polytopeSlackNegLog_exists_standardSourceMainStage_objective_gap_le_eps_imp_of_preliminaryInit`.
The proof reuses the local generic self-concordant main-stage theorem,
`chewi1316_preNewtonDecrement_le_update_bound_of_centralPathGradient_adjointSqrt_right_inverse`,
`chewi1314_polytopeSlackNegLog_range_newtonStep_mem_of_decrement_lt_one`,
the slack-range sqrt-coordinate model, and source/range central-path transport.
Do not repeat this membership induction or ask again for a global `hxseq_mem`.

Current V19 packet upgrades the automatic standard-main-stage wrapper into
standard-path endpoints.  New compiled declarations:
`Chewi1316StandardSourceMainStageObjectiveGapAutoHandoff`,
`chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_of_preliminaryInit`,
`chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_boundedPolytope_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_boundedClosedPolytope_standardPath`,
and
`chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_compactClosedPolytope_standardPath`.
This packet reuses the V18 automatic objective-gap wrapper, the standard
preliminary source-membership theorem
`chewi1316_standardSourcePreliminaryXSeq_rangeRestrict_mem_of_sourceMem`, and
the existing bounded/closed/compact preliminary initializers.  Search-first
result: the local `chewi1316_objective_gap_le_eps_of_mainStageParameter_large`
family already contains the main-stage closed-form/large-parameter API; no
new mathlib geometric-series work was needed for this packet.

Current V20 packet discharges the large-parameter stopping/count terminal
certificate family.  New compiled declarations:
`chewi1316_large_parameter_condition_of_log_le`,
`chewi1316_exists_large_parameter_condition_of_one_lt`,
`chewi1316_exists_mainStageIndex_large_parameter_of_pos`, and
`chewi1316_exists_mainStageIndex_large_parameter`.  Search-first result: the
right reuse is the local scalar Archimedean lemma
`chewi1316_exists_nat_mul_pos_ge` plus mathlib
`Real.log_pos`, `Real.log_pow`, and `Real.log_le_log_iff`; no tendsto/geometric
series API is needed for this terminal count certificate.

Current V21 packet discharges the finite-row range terminal barrier-step
certificate from terminal feasibility.  New compiled declarations:
`chewi1316_polytopeSlackNegLog_range_barrier_step_le_of_mem` and
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStage_nextNewton_of_terminal_mem`.
Search-first result: reuse the already compiled Chewi Lemma 13.15 finite-row
range theorem `chewi1315_polytopeSlackNegLog_range_gradient_segment_inner_le`;
no new self-concordance/Riccati proof is needed for this certificate.

Current V22 packet reduces the Lemma 13.6 lower-model terminal certificate to
the genuine self-concordant value-growth inequality plus a reusable
first-order convex lower-model bridge.  New compiled declarations:
`chewi1316_lowerModel_of_value_gap_and_firstOrder`,
`chewi1316_lowerModel_of_value_gap_and_firstOrderStrongConvexOn`, and
`chewi1316_centralPath_lowerModel_of_value_gap_and_firstOrderStrongConvexOn`.
Search-first result: local `FirstOrderStrongConvexOn.lower_model` is the right
reuse for the first-order convexity part; mathlib convex-derivative slope APIs
do not directly provide the Chewi §13.16 self-concordant value-growth display.

Current V23 packet pushes that split through the §13.16 objective-gap
consumers.  New compiled declarations:
`chewi1316_objective_gap_le_of_value_growth_and_firstOrderStrongConvexOn`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_value_growth_and_firstOrderStrongConvexOn`,
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_value_growth_and_firstOrderStrongConvexOn`,
and
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStage_nextNewton_of_terminal_mem_and_value_growth`.
The finite-row range endpoint now combines V21 terminal feasibility
barrier-step with V22 value-growth/first-order lower-model discharge.

Current V24 packet adds a second, more analytic Lemma 13.6 route: a segment
gradient fundamental-theorem bridge reduces the lower-model certificate to a
pointwise Hessian quadratic lower bound along the segment from the central-path
point to the terminal iterate.  New compiled declarations:
`chewi1316_lowerModel_of_gradient_segment_quadratic_lower`,
`chewi1316_centralPath_lowerModel_of_gradient_segment_quadratic_lower`,
`chewi1316_objective_gap_le_of_gradient_segment_quadratic_lower`, and
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_gradient_segment_quadratic_lower`.
Search-first result: neither mathlib nor local `StatInference` has a direct
Chewi self-concordant value-growth theorem, but local
`hessianSegmentGradient_hasDerivAt_of_hasFDerivAt`, mathlib
`intervalIntegral.integral_eq_sub_of_hasDerivAt`, and
`intervalIntegral.integral_mono_on` close the FTC/integration layer.  The
remaining analytic blocker is pointwise Hessian lower control; search/reuse the
existing local-norm sandwich machinery such as
`chewi136_localNorm_sandwich_sourceRadius` and related Hessian segment
comparison lemmas before adding any new self-concordance primitive.

Current V25 packet corrects the route to the exact textbook Lemma 13.6 kernel
used in the proof of Theorem 13.16.  The V24 pointwise constant lower-bound
consumer remains available as a stronger supplied-interface theorem, but the
preferred route is now the weighted segment bound
`r^2 / (1 + r * tau)^2`, integrated over `tau ∈ [0,1]`.  New compiled
declarations:
`chewi1316_weightedKernel_intervalIntegrable`,
`chewi1316_weightedKernel_integral_eq_sq_div_one_add`,
`chewi1316_lowerModel_of_gradient_segment_weighted_quadratic_lower`,
`chewi1316_centralPath_lowerModel_of_gradient_segment_weighted_quadratic_lower`,
`chewi1316_objective_gap_le_of_gradient_segment_weighted_quadratic_lower`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_gradient_segment_weighted_quadratic_lower`,
and
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_gradient_segment_weighted_quadratic_lower`.
Search-first result: Chewi's Markdown proof at Lemma 13.6 explicitly uses the
kernel `||y-x||_x^2/(1 + M t ||y-x||_x)^2` and then integrates it to
`||y-x||_x^2/(1 + M ||y-x||_x)`; mathlib has the FTC/integral infrastructure,
while the local code already has segment-gradient FTC and Hessian/local-norm
sandwich machinery.  Next proof work should discharge this V25 weighted
`hquad_lower` gate from the existing Lemma 13.6 local-norm/Hessian comparison
APIs, not from the stronger V24 constant pointwise gate.

Current V26 packet discharges the V25 weighted `hquad_lower` gate through the
actual one-plus Riccati lower comparison from Chewi Lemma 13.6, rather than
the stronger V24 constant pointwise supplied gate.  New compiled declarations:
`scalar_riccati_lower_bound_on_unit_interval`,
`hessianSegmentLocalNorm_riccatiDerivLowerBound_of_mixedThirdSelfConcordantOn`,
`hessianSegmentLocalNorm_ge_of_riccati_lower_bound`,
`hessianSegment_quadratic_lower_weighted_of_mixedThirdSelfConcordantOn`,
`chewi1316_weighted_hessian_quadratic_lower_of_mixedThirdSelfConcordantOn`,
`chewi1316_lowerModel_of_mixedThirdSelfConcordantOn`, and
`chewi1316_centralPath_lowerModel_of_mixedThirdSelfConcordantOn`.
Search-first result: existing local APIs had the one-minus upper sandwich
(`chewi136_localNorm_sandwich_sourceRadius` and
`hessianSegmentLocalNorm_le_of_riccati_bound`) but no one-plus lower Riccati
primitive; mathlib's general ODE/Gronwall material was not a closer match than
adding the scalar inverse-monotonicity proof.  The proof reuses local
`hessianSegmentLocalNorm_hasDerivWithinAt_of_mixedThird`, mixed-third
self-concordance, segment membership, local norm positivity, and
`localNorm_sq_eq_inner`.

Current V27 packet pushes the V26 lower-model discharge through the generic
§13.16 objective-gap consumers, so callers no longer supply the weighted
pointwise `hquad_lower` gate separately at the main assembly level.  New
compiled declarations:
`chewi1316_objective_gap_le_of_mixedThirdSelfConcordantOn`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_mixedThirdSelfConcordantOn`,
and
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_mixedThirdSelfConcordantOn`.
Search-first result: existing V24/V25 consumers already had the right
objective-gap algebra and large-parameter count APIs; the missing piece was
only the composition from V26
`chewi1316_centralPath_lowerModel_of_mixedThirdSelfConcordantOn` into those
consumers.  Do not add more supplied lower-model wrappers before using these
mixed-third endpoints.

Current V28 packet specializes the V27 mixed-third objective-gap endpoint to
the finite-row slack range at a terminal iterate and removes the supplied
`hlower` premise from that range handoff.  New compiled declaration:
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStageParameter_large_of_terminal_mem_and_mixedThird`.
The proof reuses the finite-row range self-concordant barrier package,
`chewi1314_polytopeSlackNegLog_rangeHess_hasFDerivAt`,
`chewi1314_polytopeSlackNegLog_rangeHessDeriv_mixed_inner`,
`chewi1314_polytopeSlackNegLog_rangeHess_quadratic_pos`,
`chewi1314_polytopeSlackNegLog_range_sourceCauchy`,
`hessianSegmentPsi_continuousOn_of_convex_continuousOn`, and
`centralPathGrad_hasFDerivAt`.  Search-first result: arbitrary-sequence
terminal decrement is not the right next primitive; existing V18 standard
main-stage declarations already prove terminal range/source decrement for the
standard path, so the next packet should connect that standard-path decrement
to the V28 terminal endpoint rather than redoing a generic induction.

Current V29 packet removes the temporary nonzero terminal-displacement side
condition and connects the finite-row mixed-third endpoint to the concrete
standard main-stage recursion.  New compiled declarations:
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStageParameter_large_of_terminal_mem_and_mixedThird_zeroSafe`
and
`chewi1316_polytopeSlackNegLog_exists_standardSourceMainStage_objective_gap_le_eps_imp_of_preliminaryInit_and_terminal_mem_mixedThird`.
Search-first result: local `chewi1316_central_objective_gap_le` already closes
the `center = x` branch from centrality and the V21 barrier-step estimate, so
no new scalar algebra was needed.  The standard wrapper reuses V18
`chewi1316_standardSourceMainStage_rangeRestrict_mem_and_range_decrement_le_quarter`
to supply terminal range feasibility and decrement, then calls the V29
zero-safe endpoint; the active standard preliminary-to-main handoff no longer
needs a supplied `hlower` or a manually supplied barrier-step premise.

Current V30 packet packages the V29 theorem into the named no-`hlower`
standard auto-handoff family.  New compiled declarations:
`Chewi1316StandardSourceMainStageObjectiveGapMixedThirdAutoHandoff`,
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_of_preliminaryInit`,
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedPolytope_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedClosedPolytope_standardPath`, and
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_compactClosedPolytope_standardPath`.
Search-first result: the existing V19 bounded/closed/compact standard-path
endpoint shapes are shallow constructors over the preliminary initializer, so
the new packet reuses those exact initializer theorems and changes only the
main-stage handoff surface.  The mixed-third auto-handoff stores terminal
feasibility of `center` and `optimum`, then exposes only centrality and the
large-parameter stopping inequality at the terminal main-stage call.

Current V31 packet closes that large-parameter selection handoff.  New compiled
declaration:
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_exists_mainStageIndex_objective_gap_le_eps`.
Search-first result: reuse V20
`chewi1316_exists_mainStageIndex_large_parameter` directly; no new geometric or
logarithmic scalar algebra was needed.  This wrapper chooses an existential
terminal `Nmain` from `m > 0`, `c0 > 0`, `tMain > 0`, and `eps > 0`, then calls
the V30 handoff, so the caller no longer supplies the large-parameter stopping
inequality.  The remaining genuine terminal mathematical certificate is
centrality of the selected `center` for the selected terminal parameter.

Current V32 packet threads that V31 existential terminal-index consumer through
the four concrete standard-path endpoints.  New compiled declarations:
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedFeasibleRange_exists_mainStageIndex_objective_gap_le_eps`,
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedPolytope_exists_mainStageIndex_objective_gap_le_eps`,
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedClosedPolytope_exists_mainStageIndex_objective_gap_le_eps`, and
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_compactClosedPolytope_exists_mainStageIndex_objective_gap_le_eps`.
Search-first result: the V30 bounded/closed/compact constructors were shallow,
so the new wrappers simply compose those constructors with the V31 index
selection theorem.  No new scalar, barrier-step, lower-model, or decrement
proof was introduced.

Current V33 packet packages the centrality-selection call surface.  New
compiled declarations:
`chewi1316_standardSourceMainStageTSeq_pos`,
`Chewi1316RangeCentralPathSelector`,
`chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_centralPathSelector`,
`chewi1316_standardSourceMainStage_boundedFeasibleRange_exists_center_mainStageIndex_objective_gap_le_eps_of_centralPathSelector`,
`chewi1316_standardSourceMainStage_boundedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_centralPathSelector`,
`chewi1316_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_centralPathSelector`, and
`chewi1316_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_centralPathSelector`.
Search-first result: local code had `centralPathGrad`,
`centralPathGrad_hasFDerivAt`, `centralPathGrad_at_analyticalCenter`, the V29
zero-safe mixed-third endpoint, V30 bounded constructors, and V20 large-index
selection; mathlib provides `IsCompact.exists_isMinOn` and Fermat local-minimum
APIs for the eventual selector existence proof, but no direct finite-row Chewi
central-path selector theorem.  V33 therefore formalizes only the missing
interface layer: a selector hypothesis for positive terminal parameters now
chooses the matching `center`, proves terminal centrality, and returns the
objective gap directly for all four bounded standard-path endpoints.

Current V34 packet packages the Fermat/minimizer bridge and the first concrete
barrier-value gradient atom needed for selector existence.  New compiled
declarations:
`negLogBarrier_hasDerivAt_of_pos`,
`positiveOrthantNegLogBarrier_hasGradientAt`,
`Chewi1316RangeCentralPathMinimizerSelector`, and
`chewi1316_rangeCentralPathSelector_of_minimizerSelector`.
Search-first result: mathlib supplies `Real.hasDerivAt_log`,
`HasDerivAt.comp_hasFDerivAt`, `PiLp.hasFDerivAt_apply`,
`HasFDerivAt.fun_sum`, and the `HasGradientAt`/`HasFDerivAt` equivalence for
the finite positive-orthant barrier gradient; local `Minimizer.lean` already
supplies `gradient_eq_zero_of_isMinOn_univ_hasGradientAt`, so V34 reuses that
Fermat wrapper instead of reproving local-minimum calculus.

Current V35 packet fixes the concrete finite-row central-path value and its
selector handoff.  New compiled declarations:
`barrierAffineRangeValue`,
`barrierAffineRangeValue_hasGradientAt`,
`barrierAffineRangeValue_positiveOrthantNegLogBarrier_hasGradientAt`,
`chewi1316RangeCentralPathValue`,
`chewi1316RangeCentralPathValue_hasGradientAt`,
`Chewi1316RangeCentralPathValueMinimizerSelector`,
`chewi1316_rangeCentralPathMinimizerSelector_of_valueMinimizerSelector`, and
`chewi1316_rangeCentralPathSelector_of_valueMinimizerSelector`.
Search-first result: the value-gradient proof reuses mathlib
`ContinuousLinearMap.hasFDerivAt`, `HasFDerivAt.const_smul`,
`HasFDerivAt.add`, `HasFDerivAt.comp`, `hasGradientAt_iff_hasFDerivAt`, and
`ContinuousLinearMap.adjoint_inner_left`, plus the V34
`positiveOrthantNegLogBarrier_hasGradientAt`.  The remaining selector
existence problem is now exactly a value-minimizer existence certificate for
`chewi1316RangeCentralPathValue`.

Current V36 packet weakens the central-path existence handoff to the
source-realistic local/interior optimum surface.  New compiled declarations:
`gradient_eq_zero_of_isLocalMin_hasGradientAt`,
`gradient_eq_zero_of_isMinOn_hasGradientAt_of_mem_nhds`,
`Chewi1316RangeCentralPathValueLocalMinimizerSelector`,
`Chewi1316RangeCentralPathValueDomainMinimizerSelector`,
`chewi1316_rangeCentralPathValueLocalMinimizerSelector_of_valueMinimizerSelector`,
`chewi1316_rangeCentralPathValueLocalMinimizerSelector_of_domainMinimizerSelector`,
`chewi1316_rangeCentralPathSelector_of_valueLocalMinimizerSelector`, and
`chewi1316_rangeCentralPathSelector_of_valueDomainMinimizerSelector`.
Search-first result: mathlib already has `IsMinOn.localize`,
`IsLocalMinOn.isLocalMin`, `IsMinOn.isLocalMin`, and
`IsLocalMin.hasFDerivAt_eq_zero`; V36 reuses those rather than inventing a new
Fermat calculus proof.  The remaining selector existence problem is now exactly
to produce a minimizer of `chewi1316RangeCentralPathValue` on the feasible
positive slack range, together with the neighborhood/interior certificate
`barrierAffineRangeSet ... ∈ 𝓝 center`.

Current V37 packet discharges that neighborhood/interior certificate for the
actual finite positive slack range.  New compiled declarations:
`isOpen_barrierAffineRangeSet`,
`isOpen_positiveOrthant`,
`isOpen_barrierAffineRangeSet_positiveOrthant`,
`barrierAffineRangeSet_positiveOrthant_mem_nhds`,
`Chewi1316RangeCentralPathValueFeasibleMinimizerSelector`,
`chewi1316_rangeCentralPathValueDomainMinimizerSelector_of_feasibleMinimizerSelector`,
and `chewi1316_rangeCentralPathSelector_of_valueFeasibleMinimizerSelector`.
Search-first result: mathlib has exactly the needed topology primitives
`IsOpen.preimage`, `isOpen_iInter_of_finite`, `isOpen_lt`,
`PiLp.continuous_apply`, and `IsOpen.mem_nhds`; local code already had the
translated slack-coordinate continuity pattern.  Do not ask again for a
separate `barrierAffineRangeSet ... ∈ 𝓝 center` premise when the point is in
the positive slack range.

Current V38 packet constructs the compact feasible-range minimizer selector
layer.  New compiled declarations:
`chewi1316RangeCentralPathValue_continuousOn`,
`chewi1316_rangeCentralPathValueFeasibleMinimizerSelector_of_isCompact`, and
`chewi1316_rangeCentralPathSelector_of_isCompact_feasibleRange`.
Search-first result: reuse mathlib `HasGradientAt.continuousOn` to get
continuity of the concrete central-path value on the positive slack range, and
reuse `IsCompact.exists_isMinOn` for the compact minimum.  This proves the
central-path selector from compactness and nonemptiness of the feasible slack
range; do not reintroduce a per-parameter supplied minimizer when a compact
feasible range hypothesis is available.

Current V39 packet pushes the V38 compact feasible-range selector through the
source-facing §13.16 endpoints.  New compiled declarations:
`chewi1316_rangeCentralPathSelector_of_isCompact_feasibleRange_of_polytopeSlackSet_mem`,
`Chewi1316StandardSourceMainStageExistsCenterObjectiveGapConclusion`,
`chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_isCompact_feasibleRange`,
`chewi1316_standardSourceMainStage_boundedFeasibleRange_exists_center_mainStageIndex_objective_gap_le_eps_of_isCompact_feasibleRange`,
`chewi1316_standardSourceMainStage_boundedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_isCompact_feasibleRange`,
`chewi1316_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_isCompact_feasibleRange`,
and
`chewi1316_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_isCompact_feasibleRange`.
Search-first result: local `rangeRestrict_mem_of_polytopeSlackSet` discharges
nonemptiness from a strict feasible source point, and mathlib
`IsCompact.isBounded` discharges the bounded feasible-range premise where the
old endpoint only needed boundedness.  Do not ask again for a raw
central-path selector in these compact-feasible-range standard-path wrappers.

Next theorem-sized target: discharge the remaining compactness hypothesis for
the open feasible slack range in a mathematically source-faithful way.  The
raw positive slack range is open, so avoid claiming it is compact unless a
caller explicitly supplies a compact feasible range.  Prefer formalizing the
standard compact sublevel/envelope route: write the informal proof in this
file, prove the coercive/barrier-blowup lemma for
`positiveOrthantNegLogBarrier`, package the compact sublevel minimizer
selector, and then feed it into the V39 endpoint wrappers.
Do not redo large-parameter stopping/count, barrier-step from terminal
feasibility, preliminary initialization, main-stage feasibility/decrement
induction, standard-path auto packaging, or the first-order convex lower-model
bridge/consumer wrappers, the weighted kernel route, or the one-plus Riccati
lower/Hessian-lower discharge, or the generic mixed-third objective-gap
consumers.  Search first near existing `*_standardPath` wrappers,
`chewi1316_objective_gap_le_eps_*` consumers, central-path gradient
definitions, finite-row range Hessian derivative/mixed-third lemmas, and
terminal centrality/Hessian-derivative wrappers; then
formalize only the genuinely missing terminal analytic certificate.
Older paragraphs below are cached route history and must not override this V29
target.

Cached prior frontier before the main-stage accuracy packet: the finite-row
slack-range §13.16 handoff now
compiles through source-pullback preliminary decrement transport and a
point-dependent range sqrt-coordinate one-step wrapper.  Reusable
declarations are `chewi1314_polytopeSlackNegLog_range_selfConcordantBarrierOn`,
`chewi1316_polytopeSlackNegLog_range_decrement_step_le_eighth_of_nextNewton_sqrtCoordModel`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
The newest correction weakens both `sqrtCoordModel` wrappers from a fixed
range equivalence to a domain-wide family `fun z => sqrtCoordRange z`, matching the
nonconstant logarithmic-barrier Hessian.  The newest source-transport packet
adds `barrierAffineRange_preliminaryPathGrad_adjoint_rightInverse_eq`,
`barrierAffineRange_preliminaryPath_newtonStep_rangeRestrict_eq`,
`chewi1316_polytopeSlackNegLog_rangePreliminaryNextNewtonSteps_of_sourcePullbackPreliminaryNextNewtonSteps`,
`chewi1316_polytopeSlackNegLog_rangePreDecrementNext_le_of_sourcePullbackPreDecrementNext_le`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
The newest source one-step API adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_sourceDecrement`, and the newest source canonical-lambda packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_canonicalLambda`.
A direct source-coordinate `1/4 -> 1/8` decrement proof can now feed either
the general `c0`/`tailBound` handoff or the standard-constant handoff without
any separate range recurrence or range pre-decrement assumptions.  The newest
source `tsum` budget packet adds
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_prefix_le_half_of_tsum`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_canonicalLambda`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants_of_sourceDecrement`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
Thus the remaining source next-pre-decrement budget can be proved as a
summable majorant with total `tsum <= 1 / 2`; nonnegativity of `stepBudget` is
now derived from the pre-decrement inequality itself.  The newest geometric
budget bridge adds `chewi1316_stepBudget_tsum_le_half_of_geometric_majorant`
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_tsum_le_half_of_geometric_majorant`,
so a pointwise estimate `2 * stepBudget n <= C * q^n` with `0 <= q < 1` and
`C * (1 - q)⁻¹ <= 1 / 2` directly supplies the `tsum` assumptions.  The newest
geometric handoff packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_canonicalLambda`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants_of_sourceDecrement`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`,
so the source §13.16 handoff can now consume the geometric majorant directly.
The newest contracting-budget packet adds
`chewi1316_stepBudget_geometric_majorant_of_doubled_recurrence`,
`chewi1316_stepBudget_tsum_le_half_of_doubled_recurrence`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_tsum_le_half_of_doubled_recurrence`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_geometricBudget_of_rangePreDecrementNext`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_contractingBudget_of_rangePreDecrementNext`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_canonicalLambda`.
The standard-consumer packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants_of_sourceDecrement` and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
Do not redo scalar recurrence-to-geometric/`tsum` algebra: a future proof can
now supply the source or range pre-decrement estimate, the doubled-budget
contraction `2 * stepBudget (n+1) <= q * (2 * stepBudget n)`, `0 <= q < 1`,
and `(2 * stepBudget 0) * (1 - q)⁻¹ <= 1 / 2`, then call the contracting
canonical, standard source-decrement, or standard range-sqrt handoff directly.
Continue aggressively from exactly this frontier.  The range
sqrt-coordinate family is no longer the active blocker: the newest local
spectral packet adds
`continuousLinearMap_exists_adjointSqrt_of_isPositive_finiteDim`, proving from
Mathlib's finite-dimensional self-adjoint eigenbasis APIs that every positive
continuous linear map has an adjoint-square CLM factor, and
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`, which packages the
finite-row logarithmic-barrier range Hessian and inverse-Hessian model into
the exact point-dependent family consumed by the §13.16 wrappers.  The next
theorem-sized target is the source next pre-decrement decay / total-mass
bound, preferably as the doubled-budget contraction feeding the new source
`preDecrementContractingBudget` handoff or as the pointwise geometric majorant
feeding the source `preDecrementGeometricBudget` handoffs.  The newest
range-Hessian positivity bridge adds
`chewi1314_polytopeSlackNegLog_rangeHess_isPositive` and
`chewi1314_polytopeSlackNegLog_rangeHess_toLinearMap_isPositive`, so the
concrete finite-row range Hessian is already packaged as a Mathlib positive
operator via `ContinuousLinearMap.isPositive_iff` and
`ContinuousLinearMap.isPositive_toLinearMap_iff`.  The newest inverse-model
handoff adds
`continuousLinearMap_adjointSqrtCoord_inv_eq_of_right_inverse_finiteDim` and
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_hess_pointwise`:
if future spectral work supplies a pointwise Hessian square-root factor
`H = S†S`, the required inverse-Hessian model follows automatically from the
compiled range right-inverse identity.  The newest CLM-to-equivalence adapter
adds
`continuousLinearMap_exists_adjointSqrtCoord_of_adjointSqrt_right_inverse_finiteDim`
and
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_hessCLM_pointwise`:
if future spectral work supplies only a continuous-linear-map factor
`H = sqrtH†sqrtH`, finite-dimensional invertibility and the full range
sqrt-coordinate model now follow automatically.  The search-first spectral
result is that no ready local/mathlib theorem directly returns this full
sqrt-coordinate family from a positive self-adjoint continuous linear map; this
is now discharged locally by the generic finite-dimensional spectral theorem.
Reuse this new generic theorem, the positive-operator bridge, and the range
Hessian right-inverse lemmas instead of redoing spectral selection,
equivalence promotion, positivity conversion, or the inverse model proof.
The selection part is now compiled as
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_pointwise`: the
full source-facing range-sqrt endpoint is now compiled as
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`.
The newest concrete-consumer packet instantiates that endpoint inside the
source-facing §13.16 wrappers, adding
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants`.
These remain useful conditional source-facing consumers when a valid
pre-decrement budget is available, but they are no longer the preferred
unconditional route for the actual preliminary path.
The newest actual-budget packet names the real source next-pre-decrement
sequence as `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget` and
adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementContractingBudget_noFactor_standardConstants`.
The newest initial-budget packet adds
`preliminaryPathGrad_self_eq` and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_zero_le_standard`,
proving from the barrier gradient bound and the standard update
`t_{1} = (1 - (1/200) / sqrt m) * t_0`, `t_0 = 1`, that the actual source
next-pre-decrement budget at index `0` is at most `1 / 200`.  This supplies
the base estimate needed for the contracting-budget total-mass side when
combined with the scalar `q = 1 / 2` arithmetic.  The newest half-contraction
consumer adds `chewi1316_initialTotal_half_le_of_stepBudget_zero_le_standard`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_initialTotal_half_le_standard`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_noFactor_standardConstants`.
The newest actual selected-tail bridge adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
It instantiates `stepBudget` with the real source next-pre-decrement sequence,
uses the compiled half-contraction-to-`tsum` and `tsum`-to-prefix bridges to
derive the prefix budget, and then calls the existential selected-tail handoff.
Future work should therefore not rebuild the actual-budget prefix summability
plumbing: after a valid theorem supplies the actual half contraction and the
moving-center/bounded-polytope eventual selected range-tail bound, this
endpoint initializes the positive main stage directly.
The thresholded actual selected-tail bridge now adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
It lets the tail invariant begin only after a supplied burn-in threshold
`Nmin`; the proof shifts the selected count index past that threshold before
calling the selected-tail consumer.  Future moving-center/bounded-polytope
work can therefore state its tail estimate as a post-threshold invariant.
The newest post-threshold tail-bound packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`.
These reduce the geometric input to a plain bound
`∀ Nout, Nmin ≤ Nout -> rangeTailNorm Nout <= tailBound`; the wrapper supplies
the selected `M,N` and count side internally.
The newest scaled-to-unscaled tail bridge adds
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_barrier_dualLaws`,
`dualLocalNorm_le_div_of_abs_mul_dualLocalNorm_le_of_abs_lower`,
`sourceGrad_dualLocalNorm_le_of_preliminaryPath_sequence_barrier_dualLaws_abs_t_lower`,
`chewi1316_polytopeSlackNegLog_rangeTailBound_of_sourcePreliminaryPath_abs_t_lower`, and
`chewi1316_polytopeSlackNegLog_postThresholdRangeTailBound_of_sourcePreliminaryPath_abs_t_lower`.
These reuse the reverse preliminary-path scaled-tail estimate, the finite-row
range-pull dual-local triangle/homogeneity laws, and
`chewi1314_polytopeSlackNegLog_sourceGrad_dualLocalNorm_rangeInvHess_eq` to
produce exactly the post-threshold range-tail predicate from per-output
assumptions `0 < tau_N <= |t_N|`, `lambda_N <= Lambda_N`, and
`(sqrt m + Lambda_N) / tau_N <= tailBound`.  This is a conditional bridge,
not a replacement for the moving-center/bounded-polytope invariant: because
the standard preliminary `t_N` decreases, future use must prove a valid
finite-window, selected-window, or genuinely moving-center lower-denominator
certificate before calling this route.
The newest composition packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
These call the post-threshold range-tail consumers after deriving the tail
predicate from the scaled preliminary-path bridge.  Future callers no longer
need to manually compose `...postThresholdRangeTailBound...` with
`...postThresholdRangeTailBound_of_sourcePreliminaryPath_abs_t_lower`; they can
state the lower-denominator/lambda-budget certificate directly.
The newest canonical-source-decrement packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
These instantiate the canonical preliminary lambda schedule
`lambda_0 = 1/4`, `lambda_{n+1} = 1/8` from the source `1/4 -> 1/8`
decrement step, requiring only `1 <= Nmin` for the post-threshold window and
the denominator budget `(sqrt m + 1/8) / tau_N <= tailBound`.
The newest selected-window lower-denominator packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`.
These are the preferred lower-denominator consumers for the finite selected
window: they need only `x_{N+1}` in the slack polytope,
`0 < tau <= |t_{N+1}|`, `(sqrt m + 1/8) / tau <= tailBound`, and the selected
log/count side.  Prefer these over the post-threshold lower-`|t|` wrappers
when the decreasing preliminary `t_N` makes a uniform all-future lower
denominator implausible.
The newest closed-form denominator packet adds
`chewi1316_preliminaryStageParameter_abs_eq_pow_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_postThresholdClosedFormAbsTLowerTail_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_selectedClosedFormAbsTLowerTail_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_postThresholdClosedFormAbsTLowerTail_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_selectedClosedFormAbsTLowerTail_succ_noFactor_standardConstants`.
For the standard preliminary schedule, future prefix-budget and actual-budget
callers no longer need to prove `tau <= |t_N|`; they can state the tail
budget directly with the explicit denominator
`(1 - (1/200) / sqrt m)^N` or the selected successor denominator
`(1 - (1/200) / sqrt m)^(N+1)`.
The newest selected closed-form source-shape wrapper adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_selectedClosedFormAbsTLowerTail_internalTailBound_succ_noFactor_standardConstants`.
It fixes the selected tail bound to
`(sqrt m + 1/8) / (1 - (1/200) / sqrt m)^(N+1)` internally and discharges the
tail-bound nonnegativity and reflexive budget side, leaving only the selected
count/log hypotheses plus range feasibility.  This is useful finite selected
window infrastructure, but it is not the long-window Chewi/Nesterov
preliminary-stage proof: the denominator decreases with `N`, so this
closed-form lower-`|t|` route should not be treated as a substitute for a
moving-center or bounded-polytope range-tail invariant.
The newest selected range source-radius packet adds
`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourceRadiusHalf`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeSourceRadiusHalf_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_selectedRangeSourceRadiusHalf_succ_noFactor_standardConstants`.
This is the finite-window bounded-polytope entrypoint: a selected range
source-radius-half certificate at `x_{N+1}` gives the selected slack-range
source-tail bound, and the actual-budget wrapper additionally derives the
prefix pre-decrement budget from the half-contraction of the real
`sourcePreDecrementNextBudget`.
The newest internal selected-tail packet adds
`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_preDecrementBudget`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalSelectedRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalSelectedRangeTailBound_succ_noFactor_standardConstants`.
These reuse the compiled source-to-range transport, successor range
membership, and `rangeRestrict_sourceRadiusHalf` budget theorem to derive the
selected tail bound internally from the source preliminary recurrence and
prefix budget.  Future callers should prefer these compact endpoints when
they already have the pre-decrement budget or actual half-contraction; do not
manually supply `hxN_range`, selected source-radius-half, or selected
range-tail hypotheses in that case.
The newest existential compact packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalEventualSelectedRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalEventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
These also choose the logarithmic/count indices internally, so the conditional
source §13.16 handoff now exposes only the source preliminary recurrence,
prefix pre-decrement budget (or actual half-contraction), and scalar
`2 * sqrt m <= tailBound`.  Do not re-add wrappers whose only purpose is to
pass explicit `M,N`, count, log, selected range-tail, or selected
source-radius hypotheses.
This half-contraction endpoint is conditional infrastructure, not yet the
recommended mathematical route.  The search-first check of the archived
Chapter 13 obstruction notes shows that fixed-source global preliminary
summability and source-radius style gates were already ruled out for the
textbook-scale decreasing-`t` path unless a genuinely new moving-center or
bounded-polytope invariant is supplied.  Therefore do not spend another run
trying to prove the unconditional actual doubled contraction
`2 * stepBudget (n+1) <= (1 / 2) * (2 * stepBudget n)` from the bare actual
recurrence.  Use the half-contraction endpoint only if a separate theorem
proves that contraction under additional valid hypotheses.  The preferred live
route is the direct moving-center / bounded-polytope range-tail estimate that
older route notes identify after the positive-orthant obstruction packets,
reusing the compiled range-tail and source-start consumers rather than
re-entering the false fixed-source radius/summability path.
Search/agent check for this run: the scalar actual-budget recurrence
`B_{n+1} <= B_n^2/(1-B_n)^2 + 1/200` supports uniform smallness and finite
short-window prefix bounds, but it does not imply a summable total mass or the
standard doubled half-contraction by itself.  Local consumers for geometric,
contracting, and range-to-source budgets are already compiled; do not recreate
them.  The next aggressive target remains a genuine long-window range-tail
estimate, preferably a moving-center/bounded-polytope theorem producing the
measured or selected slack-range tail bound consumed by the `rangeMem`
source-start wrappers.
The newest measured-tail packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_noFactor`.
It removes the need for a uniform guessed tail bound at this layer: for a
chosen `M,N`, the actual measured slack-range tail norm at `x_N`, plus the
usual count/log inequality, directly initializes the positive main stage.  This
is now the preferred wrapper for the omitted Chewi/Nesterov preliminary-stage
quantity while the stronger bounded-polytope or moving-center invariant is
being developed.
The newest successor selected-index packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_succ_noFactor_canonicalLambda`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_succ_noFactor_standardConstants`.
These discharge the auxiliary `lambdaSeq` bookkeeping and standard Chewi
constant side for a selected successor index.  The remaining high-value
preliminary-stage target is now a theorem that supplies the measured
slack-range tail logarithmic bound at some successor index; do not reintroduce
a uniform fixed-source tail assumption.  The newest source-facing measured-tail
packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants`.
These wrappers derive successor range feasibility and the `1/4 -> 1/8`
one-step preliminary invariant from range/source preliminary Newton data plus
the prefix pre-decrement budget before calling the selected measured-tail
consumer.  Treat them as conditional infrastructure: the preferred exact route
still needs a valid moving-center / bounded-polytope argument for the measured
range-tail logarithmic bound, and eventually a side-condition route that does
not smuggle in the archived false fixed-source radius/summability assumption.
The newest range-feasibility measured-tail packet adds
`chewi1316_polytopeSlackNegLog_range_decrement_step_le_eighth_of_nextNewton_sqrtCoordModel_of_rangeMem`,
`chewi1316_polytopeSlackNegLog_source_decrement_step_le_eighth_of_nextNewton_rangeMem_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_measuredRangeTailLogBound_succ_noFactor_standardConstants`.
These are the preferred no-prefix-budget measured-tail consumers when a
future moving-center or bounded-polytope proof supplies feasibility of the
range-restricted preliminary iterates directly.  They reuse the local
point-dependent range square-root-coordinate model, the source-to-range Newton
transport, and the canonical measured-tail selected-index wrapper; Mathlib has
no optimizer-specific replacement for this local self-concordant bridge.  The
next exact-source blocker is now sharply split into: prove a valid
range-feasibility/moving-center invariant for the actual preliminary path, and
prove the measured slack-range tail logarithmic bound at a selected successor
index.  Do not route this through the archived global prefix-budget
summability gate unless a separate valid pre-decrement budget theorem has
already been proved.
The newest no-prefix selected-tail packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_selectedRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
These compose the `rangeMem` measured-tail endpoint with the scalar
`chewi1316_measuredTailLog_le_of_tailBound` bridge and the existing
`chewi1316_exists_preliminary_tail_log_count_indices` selector.  The preferred
future geometry target is now a plain eventual selected successor bound
`dualLocalNorm rangeInvHess (rangeRestrict (xseq (N+1))) (rangeGrad (rangeRestrict xbar0)) <= tailBound`
under the count inequality, plus the all-iterate range-feasibility invariant;
manual measured-tail log and `M,N` plumbing should not be repeated.
The newest no-prefix slack-ratio packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySlackRatioBound_succ_noFactor_standardConstants`.
It consumes all-iterate range feasibility plus an eventual translated-slack
coordinate ratio envelope, converts it through
`chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_sqrt_mul_of_slackRatio_le`,
and calls the no-prefix eventual range-tail initializer.  This is now the
preferred consumer when the moving-center/bounded-polytope proof naturally
outputs coordinate slack ratios rather than a dual-norm tail bound.
The newest no-prefix source-radius packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySourceRadiusBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySourceRadiusHalf_succ_noFactor_standardConstants`.
It consumes all-iterate range feasibility plus an eventual source local-norm
bound around `rangeRestrict xbar0`, converts that bound to the translated-slack
coordinate envelope through
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`,
and then calls the no-prefix slack-ratio initializer.  This is the preferred
consumer when the moving-center/bounded-polytope proof naturally proves an
eventual source Dikin-radius bound, especially the half-radius invariant; the
remaining real blocker is to prove that eventual local-radius/range-feasibility
invariant for the actual preliminary path.
The newest no-prefix post-threshold packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_postThresholdRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These are the preferred consumers for the next geometry packet: supply
all-iterate range feasibility, the source preliminary Newton recurrence, and
either a post-threshold or `∀ᶠ N in atTop` plain range-tail dual-norm bound.
They choose the selected index internally and avoid both prefix-budget and
manual selected-count hypotheses.
The newest no-prefix lower-denominator packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
These compose the reverse preliminary-path scaled-tail bridge
`chewi1316_polytopeSlackNegLog_postThresholdRangeTailBound_of_sourcePreliminaryPath_abs_t_lower`
with the no-prefix post-threshold consumer.  The next proof may now supply
post-threshold lower bounds on `|t_N|` and the budget
`(sqrt m + 1/8) / tau_N <= tailBound`; the standard `1/4 -> 1/8`
source-decrement invariant is derived from `hxRange` and the source Newton
recurrence.
The newest no-prefix selected lower-denominator packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`.
This is the finite-window sibling of the post-threshold lower-denominator
handoff: future proofs can supply the denominator certificate only at the
chosen successor index `N+1`, together with the selected count/log scalar
inputs, while `hxRange` and the source Newton recurrence still discharge the
standard decrement invariant internally.
The newest no-prefix closed-form denominator packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_postThresholdClosedFormAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_selectedClosedFormAbsTLowerTail_succ_noFactor_standardConstants`.
These instantiate `tauSeq N` internally as the exact standard preliminary
closed form.  Future range-feasibility/moving-center work should supply the
tail budget against the explicit geometric denominator instead of separately
proving `tauSeq N <= |t_N|`.
The newest selected-tail-bound packet adds the scalar log bridge
`chewi1316_measuredTailLog_le_of_tailBound` plus
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants`.
Thus the next moving-center/bounded-polytope packet can target a plain
selected successor estimate
`dualLocalNorm rangeInvHess (rangeRestrict (xseq (N+1))) (rangeGrad (rangeRestrict xbar0)) <= tailBound`
together with `log (16 * (tailBound + 1)) <= M log 2`; it no longer needs to
manually prove the measured-tail logarithmic hypothesis or redo source/range
transport.
The newest existential selected-tail-bound handoff adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
It chooses the logarithmic `M` and successor count index internally from
`chewi1316_exists_preliminary_tail_log_count_indices`; the remaining geometry
input is now an eventual selected successor bound valid whenever the count
inequality holds.  This is the preferred conditional entrypoint for the next
moving-center/bounded-polytope proof packet.
The thresholded pre-decrement-budget variant
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`
also chooses the selected index internally, but forces the output index past a
burn-in threshold `Nmin`.  Prefer this variant when the next geometric proof
only establishes the range-tail estimate eventually.
Even better, use
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`
when the moving-center/bounded-polytope proof gives a plain post-threshold
tail bound independent of `M` and the count inequality.
The newest eventual-tail adapter packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallyRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
Search-first reuse result: Mathlib exposes `Filter.eventually_atTop`, and
local `StatInference/Optimization/ASGD.lean` already uses `∀ᶠ N in atTop`
interfaces heavily.  Future moving-center/bounded-polytope proofs can now
state the tail estimate as a filter-eventual fact and let the compiled adapter
extract the burn-in threshold before invoking the post-threshold §13.16
handoff.
The bounded-polytope geometry interface is now sharper: use the pointwise
range/ambient bridge
`chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_positiveOrthant_sourceGrad`
and its coordinate-envelope corollary
`chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_sqrt_mul_of_slackRatio_le`.
The source §13.16 wrapper
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallySlackRatioBound_succ_noFactor_standardConstants`
turns an eventual translated-slack coordinate ratio bound into the compiled
main-stage initializer.  Search-first reuse result: no Mathlib theorem directly
covered this affine-range restriction, but local
`positiveOrthantNegLog_sourceGrad_dualLocalNorm_eq_norm_relative`,
`euclideanSpace_norm_le_sqrt_fin_mul_of_abs_coord_le`, the range inverse-Hessian
right-inverse theorem, and local dual/primal Cauchy primitives provide the
whole bridge.  The remaining real blocker is no longer raw dual-norm plumbing:
prove the eventual slack-ratio envelope from the bounded-polytope or
moving-center trajectory invariant.
That envelope is now also available from the existing prefix pre-decrement
budget in a concrete `3/2` form:
`positiveOrthant_ratio_abs_le_one_add_of_localNorm_sub_le`,
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`,
`chewi1316_polytopeSlackNegLog_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallySlackRatioBound_three_halves_succ_noFactor`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
Search-first reuse result: this packet uses the compiled source-radius-half
certificate
`chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`,
`eventually_ge_atTop`, and the local positive-orthant square-root coordinate
norm identity.  Do not rebuild slack-coordinate ratio bounds from scratch.
The next aggressive target is to discharge or improve the actual preliminary
pre-decrement budget/decay assumption that feeds this concrete initializer.
The actual-budget route now has a reusable prefix-budget adapter:
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_half_contraction_standard`.
The new actual-path endpoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`
combines the actual doubled half-contraction with the `3/2` slack-ratio
initializer, so callers only need the actual half-contraction and
`sqrt(m) * 3/2 <= tailBound`.  Search-first result for the next contraction
proof: Mathlib has no Newton-decrement/self-concordant optimizer API to reuse;
stay local and inspect the `chewi138_*newtonDecrement_step*` stack plus
`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_*` wrappers before
adding any new primitives.
The parameter-shift packet adds `polytopeSlackSet_of_rangeRestrict_mem`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_postDecrement_add_delta_sqrt`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_eighth_add_standard_of_postDecrement_le_eighth`.
It proves the honest relation
`B_{n+1} <= postDecrement(t_{n+1}, x_{n+1}) + delta * sqrt(m)`, hence under
the standard constants `B_{n+1} <= 1/8 + 1/200` after a `1/8` post-step
certificate.  This is not the raw half-contraction; future work should combine
the local `1/8` preliminary-stage theorem with a valid scalar recurrence or
finite-window budget, rather than assuming `B_{n+1} <= B_n / 2`.
The quadratic-recurrence packet now adds
`chewi1316_polytopeSlackNegLog_range_postDecrement_le_quadratic_of_nextNewton_sqrtCoordModel`,
`chewi1316_polytopeSlackNegLog_sourcePostDecrement_le_quadratic_of_nextNewton`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_delta_sqrt`, and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard`.
The verified actual recurrence is
`B_{n+1} <= B_n^2 / (1 - B_n)^2 + delta * sqrt(m)`, and under standard
constants the additive term is `1 / 200`.  This is the current precise
blocker: the additive floor prevents a free geometric/summable prefix budget,
so the next aggressive packet should either prove a valid scalar finite-window
consequence that feeds an existing measured-tail/selected-index handoff, or
switch to the moving-center bounded-polytope tail route instead of trying to
force half-contraction.
The scalar closure packet adds `real_quadratic_add_standard_le_one_hundredth`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_hundredth_of_quadratic_add_standard`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_lt_one_of_quadratic_add_standard`.
Thus the verified actual recurrence can now be iterated without carrying a
separate `< 1` side condition: all actual next-pre-decrement budgets stay
below `1 / 100`.  This is a boundedness invariant only; it still does not
produce the prefix `tsum <= 1 / 2`, so the remaining §13.16 route is still
finite-window/selected-index or moving-tail, not summability by contraction.
The packaged finite-window packet adds
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard_of_nextNewton`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_fifty_of_quadratic_add_standard`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_twenty_five`.
Future finite-window work should call these instead of reopening the
quadratic recurrence side-condition or re-summing the uniform `1/100` bound.
The newest sharpened finite-window packet improves this route by proving the
stable scalar invariant `real_quadratic_add_standard_le_one_one_hundred_ninety_eight`,
the actual-budget bound
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard`,
the prefix estimate
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_ninety_nine_of_quadratic_add_standard`,
and the half-budget corollary
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_forty_nine`.
The exact-tail finite-window wrapper
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail_succ_noFactor_standardConstants`
now fixes the verified internal tail budget to `sqrt(m) * 3/2`, so finite
source-start callers no longer need to pass an arbitrary `tailBound` plus the
reflexive `sqrt(m) * 3/2 <= tailBound` side condition.
The auto-log-index finite-window packet adds the scalar selector
`chewi1316_exists_nat_mul_log_two_between` and the source initializer
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail_autoLogIndex_succ_noFactor_standardConstants`.
Search-first reuse result: the proof uses Mathlib `Nat.le_ceil`,
`Nat.ceil_lt_add_one`, and `Real.log_nonneg` rather than a new
Archimedean primitive.  Finite-window callers now supply only `N + 1 <= 49`
and the single overshoot-aware scalar window
`(log (16 * (sqrt m * 3 / 2 + 1)) + log 2) * sqrt m <= (N + 1) / 200`;
they no longer manually choose `M` or separately prove the log/count
side-conditions.
The newest selected-tail auto-index packet generalizes this shape by adding
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_selectedRangeTailBound_autoLogIndex_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_internalSlackRatioBound_three_halves_autoLogIndex_succ_noFactor_standardConstants`.
Future moving-center or bounded-polytope packets should call the general
`rangeMem_selectedRangeTailBound_autoLogIndex` theorem after proving the
selected successor dual-norm tail bound and one scalar window inequality
`(log (16 * (tailBound + 1)) + log 2) * sqrt m <= (N + 1) / 200`; do not
reintroduce manual `M`, `hcount`, or `htailBoundLog` plumbing.
The newest finite-window geometry packet exposes the actual-path
bounded-polytope facts directly as
`chewi1316_polytopeSlackNegLog_rangeRestrict_successor_mem_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine`,
`chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine`
and
`chewi1316_polytopeSlackNegLog_slackRatio_three_halves_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine`.
The measured-tail log-index packet adds
`chewi1316_polytopeSlackNegLog_exists_logIndex_measuredRangeTailLog_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail`,
which chooses a base-two logarithmic index satisfying both the Chewi count
budget and the measured range-tail logarithmic bound from the exact
`sqrt(m) * 3/2` tail estimate plus the single overshoot-aware scalar window.
These are the reusable geometry artifacts behind the finite-window selected
tail bound: from the honest actual quadratic budget and `N + 1 <= 49`, the
range-restricted successor stays in the slack-range domain, lies within source
local radius `1/2`, and has translated slack-coordinate ratios bounded by
`3/2`.  Future range-tail work should reuse these declarations instead of
reopening the selected pre-decrement budget, source-to-range transport,
successor-membership induction, radius-half proof, or coordinate ratio
conversion.
The old `K+1 <= 25` corollary is superseded by `K+1 <= 49` for finite-window
work, but this remains a local-window prefix budget, not a global
preliminary-stage summability theorem.
Range recurrence and range pre-decrement budget are now transported from the
source-coordinate recurrence/budget by compiled wrappers.  If the next route
proves a source-coordinate one-step decrement directly, use the new
source canonical/standard handoffs instead of re-entering the range wrapper
stack.  Do not spend a run
re-solving source-pullback decrement transport, scalar constants, successor
membership, source-radius-half, finite sequence/log-count plumbing, or the
exposed range one-step `1/4 -> 1/8` invariant; these are already behind
compiled wrappers.  Keep code/docs in English, chat status in Chinese/English
mix, use search-first reuse of mathlib and local `StatInference`, then edit
one endpoint-moving Lean theorem packet, run focused `lake env lean`, promote
with `lake build StatInference.Optimization.InteriorPoint`, scan for proof
holes/secrets, rebase, commit, and push.

The local recurrence refactor has started: use
`chewi1316_polytopeSlackNegLog_range_postDecrement_le_quadratic_of_nextNewton_sqrtCoordModel_of_pairMem`
and
`chewi1316_polytopeSlackNegLog_sourcePostDecrement_le_quadratic_of_nextNewton_pairMem`
when a proof has only current/next range feasibility.  These pairwise
quadratic post-step estimates remove the all-iterate feasibility assumption
from the post-decrement layer itself.  The newest parameter-shift localization
adds
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_delta_sqrt_pairMem`
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard_pairMem`,
so the honest actual recurrence now also has a pairwise current/next
feasibility form.  The remaining assumption-reduction target is finite prefix
budget induction: derive each successor's local feasibility from the already
proved local-window budget/radius facts, then call the pairwise recurrence
instead of carrying an external global `∀ k` range-feasibility hypothesis.
The newest finite-prefix packet adds
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard_prefixRange`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_ninety_nine_of_quadratic_add_standard_prefixRange`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_forty_nine_prefixRange`, and
`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRatio_three_halves_length_le_forty_nine_prefixRange`.
Thus the `K+1 <= 49` budget and selected range-tail route now need only
finite range feasibility through the selected successor `N+1`, not global
all-iterate feasibility.  The next blocker is to discharge that finite
`hxRangePrefix` assumption itself by a simultaneous local feasibility/budget
induction, reusing the pairwise recurrence and selected pre-decrement geometry
wrappers rather than reopening scalar recurrence or range-tail plumbing.
That simultaneous induction is now compiled as
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard_currentPrefixRange`
and
`chewi1316_polytopeSlackNegLog_rangeRestrict_mem_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget`.
The exact finite-window auto-index initializer is lifted to initial-range
form by
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail_autoLogIndex_succ_noFactor_standardConstants_of_initialRange`.
The global `∀ k` range-feasibility blocker for this finite-window route is
therefore closed.  The next blocker is scalar/source-side: prove that Chewi's
overshoot-aware log window can be met for a useful selected `N <= 48` from the
textbook parameter/margin assumptions, or shift to the moving-center
long-window argument when the finite window is too short.
The scalar check is now compiled as
`chewi1316_exactSlackRatioTail_logWindow_impossible_of_length_le_forty_nine`:
for every nonzero finite-row dimension and every `N + 1 <= 49`, the exact
slack-ratio-tail auto-index log window is impossible because the left side is
at least `log 2 > 49 / 200` while the right side is at most `49 / 200`.
Therefore the finite-window exact-tail initializer remains useful only as a
local consistency/diagnostic stepping stone; it cannot be the final Chewi
§13.16 preliminary-stage route.  The next aggressive target is the
moving-center or long-window range-tail invariant that decouples the
logarithmic count window from the local `K+1 <= 49` prefix budget.
The bounded-polytope handoff now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_globalSlackRatioBound_succ_noFactor_standardConstants`.
It reuses the actual-path range-feasibility theorem and the no-prefix
eventual slack-ratio initializer: future geometry only has to prove a global
source-relative slack-ratio envelope for every feasible range point, plus the
scalar budget `sqrt(m) * B <= tailBound`.  This is the preferred route over
reopening the impossible finite-window log window or assuming an unproved
actual-budget half-contraction.
The next coordinate-envelope layer is also compiled:
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_slackCoordinateUpperBound`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackCoordinateUpperBound_succ_noFactor_standardConstants`.
These reduce the bounded-polytope obligation further: prove upper bounds
`slack_i(y) <= upper_i` for every feasible translated range point, and prove
`upper_i <= B * slack_i(xbar0)` coordinatewise.  The actual preliminary path
and §13.16 initializer are then handled by existing compiled infrastructure.
The newest `BddAbove`/`sSup` version adds
`chewi1316_polytopeSlackNegLog_feasibleSlackCoordinateImage`,
`chewi1316_polytopeSlackNegLog_slackCoordinateImageOn`,
`chewi1316_polytopeSlackNegLog_bddAbove_feasibleSlackCoordinateImage_of_isCompact`,
`chewi1316_polytopeSlackNegLog_bddAbove_feasibleSlackCoordinateImage_of_subset_isCompact`,
`chewi1316_polytopeSlackNegLog_feasibleSlackCoordinateSup_le_slackCoordinateImageOnSup_of_subset_isCompact`,
`chewi1316_polytopeSlackNegLog_slackCoordinateImageOnSup_le_of_forall_le`,
`chewi1316_polytopeSlackNegLog_slackCoordinate_le_center_add_radius_of_mem_closedBall`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_bddAbove_slackCoordinateSup`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_compactSuperset_slackCoordinateSup`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_compactSuperset_slackCoordinateUpperBound`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_closedBall_slackCoordinateUpperBound`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_sourceCenteredRadiusBound`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_sourceLocalNormBound`,
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_sourceLocalNormBound_le`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_bddAboveSlackCoordinateSup_succ_noFactor_standardConstants`,
with the compact-entry wrapper
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSlackCoordinateSup_succ_noFactor_standardConstants`
and the more practical compact-superset wrapper
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetSlackCoordinateSup_succ_noFactor_standardConstants`,
plus the envelope-sup entrypoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetEnvelopeSlackCoordinateSup_succ_noFactor_standardConstants`
and the pointwise envelope-upper-bound entrypoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetSlackCoordinateUpperBound_succ_noFactor_standardConstants`,
now followed by the closed-ball envelope entrypoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_closedBallSlackCoordinateUpperBound_succ_noFactor_standardConstants`
and the source-centered radius entrypoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceCenteredRadiusBound_succ_noFactor_standardConstants`,
plus the Dikin/source-local-norm entrypoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceLocalNormBound_succ_noFactor_standardConstants`
and its exact-budget specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceLocalNormBound_exactBudget_succ_noFactor_standardConstants`.
The newest coordinate-relative Dikin bridge adds
`chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_coord_abs_le`,
`chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_relative_abs_sub_le`,
`chewi1316_polytopeSlackNegLog_sourceLocalNormBound_of_slackCoordAbsBound`,
`chewi1316_polytopeSlackNegLog_sourceLocalNormBound_of_slackRelativeAbsSubBound`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRelativeAbsSubBound_exactBudget_succ_noFactor_standardConstants`.
The moving-center relative-slack tail packet adds
`positiveOrthant_ratio_abs_le_one_add_of_relative_abs_sub_le`,
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_relative_abs_sub_le`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSlackRelativeAbsSubBound_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySlackRelativeAbsSubBound_succ_noFactor_standardConstants`.
This sharper route uses the direct scalar triangle inequality to consume
`|slack_i(x_N) / slack_i(xbar0) - 1| <= rho` with budget
`sqrt(m) * (1 + rho) <= tailBound`, instead of forcing the Dikin-radius
detour budget `sqrt(m) * (1 + sqrt(m) * rho)`.  It is now the preferred
post-threshold/eventual moving-center interface when the remaining geometry is
pathwise rather than a global feasible-range compactness envelope.
The actual half-contracting source-radius handoff now also compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceRadiusBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceRadiusBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceRadiusHalf_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceRadiusHalf_succ_noFactor_standardConstants`.
Use these when moving-center geometry proves a Dikin/source-local-norm bound
along the actual preliminary iterates; the generalized scalar budget is
`sqrt(m) * (1 + r) <= tailBound`, with the common half-ball specialization
using `sqrt(m) * (3 / 2) <= tailBound`.
The pathwise coordinate-displacement handoff now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSlackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySlackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`.
These compose the coordinate-to-Dikin bridge
`chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_coord_abs_le`
with the actual source-radius endpoint, so a future moving-center proof may
state the source-slack coordinate displacement directly; the exact scalar
budget is `sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.
The pathwise source-centered radius handoff now adds
`chewi1316_polytopeSlackNegLog_slackCoordAbsSub_le_of_dist_le`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceCenteredRadiusBound_exactBudget_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceCenteredRadiusBound_exactBudget_succ_noFactor_standardConstants`.
These let a moving-center proof give only a range-subtype distance bound
`dist x_N xbar0 <= R` plus coordinate comparisons
`R <= rho * slack_i(xbar0)`; `PiLp.norm_apply_le` turns that into the
coordinate-displacement certificate above.
The source-slack floor specialization now adds
`chewi1316_polytopeSlackNegLog_exists_pos_sourceSlackFloor`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`.
These replace the per-coordinate comparison by a single floor certificate
`sFloor <= slack_i(xbar0)` for all `i` plus the scalar radius side
`R <= rho * sFloor`.
The actual-budget/non-half-contraction route now also has
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`.
This should be the preferred source-centered floor endpoint: it avoids the
temporary half-contraction recurrence assumption and only leaves a feasible
range radius bound, `R <= rho * sFloor`, the finite floor comparison, and the
scalar tail budget `sqrt(m) * (1 + rho) <= tailBound`.  The floor existence
lemma uses Mathlib `Finset.inf'`, `Finset.lt_inf'_iff`, and `Finset.inf'_le`
to extract a positive finite lower bound directly from `hxbar0Range`.
The bounded feasible-range specialization now adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_autoFloor_succ_noFactor_standardConstants`.
It consumes `Bornology.IsBounded` for the translated feasible slack range,
uses Mathlib `Bornology.IsBounded.subset_closedBall` to obtain a
source-centered radius, chooses `rho = R / sFloor`, and returns existential
`sFloor`, `rho`, and `tailBound` together with the main-stage initializer.
This is now the preferred bounded-polytope route when the remaining geometry
proves boundedness of the feasible slack range rather than a hand-picked
radius.
The newest bounded range-tail budget packet exposes the reusable intermediate
facts behind that endpoint:
`chewi1316_polytopeSlackNegLog_exists_globalSlackRatioBound_of_boundedFeasibleRange`,
`chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_boundedFeasibleRange`,
`chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_boundedPolytope`,
`chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_closedPolytope_isBounded`, and
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedFeasibleRange`.
It reuses Mathlib `Bornology.IsBounded.subset_closedBall`, the local source
slack-floor lemma, and
`chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_sqrt_mul_of_slackRatio_le`
to turn bounded feasible-range geometry into an existential global
slack-ratio budget, a uniform source-gradient range-tail budget, and a
filter-eventual actual-path range-tail invariant.  Future §13.16 work should
call these facts instead of recomputing `rho = R / sFloor`, `B = 1 + rho`, or
`tailBound = sqrt m * B`.
The clean boundedness-to-§13.16 packet now adds
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedPolytope`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_closedPolytope_isBounded`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These call the no-prefix `rangeMem_eventuallyRangeTailBound` §13.16 handoff
after deriving actual-path range feasibility internally.  They are the
preferred caller-facing endpoints when the only intended geometric assumption
is bounded feasible range, bounded strict source polytope, or bounded textbook
closed polytope; use the older `autoFloor` wrappers only when downstream work
needs the explicit witnesses `sFloor`, `rho`, or `tailBound`.
The source-start packet now adds the converse membership bridge
`rangeRestrict_mem_of_polytopeSlackSet` plus
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedFeasibleRange_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedPolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_closedPolytope_isBounded_sourceMem`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These are now the preferred textbook-facing finite-row §13.16 endpoints:
strict feasibility is stated as `xbar0 ∈ polytopeSlackSet aRow bSlack`, while
range feasibility of `(polytopeSlackCLM aRow).rangeRestrict xbar0` is derived
internally.
The compact source-start packet now adds actual range-tail invariant and clean
§13.16 wrappers for compact source envelopes, compact strict source polytopes,
compact source closures, and compact textbook closed polytopes:
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourceSupersetPolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourcePolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourceClosurePolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactClosedPolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceSupersetPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourcePolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These reuse the existing compact-to-bounded lemmas and should be preferred
when the textbook side proves compactness rather than an explicit boundedness
certificate.
The source-path packaging packet now adds
`Chewi1316StandardSourcePreliminaryPath`,
`Chewi1316StandardSourcePreliminaryPath.rangeRestrict_mem_of_sourceMem`, and
source-path packaged bounded/compact §13.16 endpoints:
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
Use these as the preferred theorem-facing APIs when the preliminary Newton
path is already bundled by its source start, standard parameter schedule, and
source Newton recurrence; do not keep rethreading
`hx0`/`ht0`/`htstep`/`hnewton_next_source` through final statements.
The standard recursive-path packet now adds
`chewi1316_standardPreliminaryTSeq`,
`chewi1316_standardSourcePreliminaryXSeq`,
`chewi1316_standardSourcePreliminaryPath`, and concrete standard-path
bounded/compact §13.16 endpoints:
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These are now the preferred concrete preliminary-stage APIs: callers supply
only strict source feasibility and boundedness/compactness of the relevant
polytope, and the standard `t_n`/`x_n` recursion is fixed internally.
The preliminary/main-stage handoff packet now compiles
`Chewi1316SourceMainStageObjectiveGapHandoff`,
`chewi1316_sourceMainStageObjectiveGapHandoff_of_preliminaryInit`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
and
`chewi1316_sourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`.
The next aggressive packet should package the standard main-stage recurrence
and discharge the remaining centrality, barrier-step/lower-model, membership,
and large-parameter assumptions around this handoff toward the final finite-row
LP accuracy theorem, rather than reworking preliminary initialization.
The source-space bounded-polytope bridge now adds
`chewi1316_polytopeSlackNegLog_bounded_feasibleRange_of_bounded_polytopeSlackSet`
and the endpoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_autoFloor_succ_noFactor_standardConstants`.
It reuses Mathlib `Bornology.IsBounded.image` for the continuous linear
`rangeRestrict` map plus the local
`polytopeSlackSet_of_rangeRestrict_mem` bridge, so a boundedness certificate
for the original source polytope slack set now feeds the actual §13.16
main-stage initializer directly.
The source-facing boundedness packet now adds
`closedHalfspaceSlackSet`, `closedPolytopeSlackSet`,
`halfspaceSlackSet_subset_closedHalfspaceSlackSet`,
`polytopeSlackSet_subset_closedPolytopeSlackSet`,
`isClosed_closedHalfspaceSlackSet`, `isClosed_closedPolytopeSlackSet`,
`polytopeSlackSet_segment_source_mem_of_closed_mem_of_mem`,
`closedPolytopeSlackSet_subset_closure_polytopeSlackSet_of_mem`,
`closure_polytopeSlackSet_eq_closedPolytopeSlackSet_of_mem`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_subset_closedBall`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_dist_le`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_norm_sub_le`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_subset_isCompact`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_isCompact`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_closure_isCompact`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_closedPolytope_isCompact`,
`chewi1316_polytopeSlackNegLog_bounded_polytopeSlackSet_of_closedPolytope_isBounded`,
`chewi1316_polytopeSlackNegLog_closedPolytope_isCompact_of_isBounded`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytopeClosedBall_autoFloor_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytopeDistBound_autoFloor_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytopeNormSubBound_autoFloor_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourcePolytope_autoFloor_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceSupersetPolytope_autoFloor_succ_noFactor_standardConstants`.
It now also includes
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_autoFloor_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_autoFloor_succ_noFactor_standardConstants`.
The bounded closed-polytope source endpoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_autoFloor_succ_noFactor_standardConstants`
now consumes boundedness of the textbook closed polytope directly, without
requiring callers to first package it as compact; in a proper ambient space the
local compactness upgrade proves compactness from closedness plus boundedness.
These reuse Mathlib `Metric.isBounded_closedBall`, `IsCompact.isBounded`, and
`Bornology.IsBounded.subset`, plus `Metric.mem_closedBall`, `dist_eq_norm`,
`subset_closure`, `isClosed_Iic.preimage`, `innerSL` continuity, and finite
`isClosed_iInter`, plus `mem_closure_iff_seq_limit`,
`tendsto_one_div_add_atTop_nhds_zero_nat`, and
`Metric.isCompact_of_isClosed_isBounded` for the proper-space Heine-Borel
route.  Under one strict feasible point, the new Slater closure identity
proves `closure (polytopeSlackSet a b) = closedPolytopeSlackSet a b`, so
future source-topology arguments can move between strict barrier domains and
textbook closed polytopes without redoing open-segment/sequence arguments.
Thus future source geometry can give a closed-ball
enclosure, pointwise distance/norm radius certificate, compact source set,
compact source closure, compact source envelope, or compactness of the
textbook closed polytope `{x | inner a_i x <= b_i}` for the original polytope
slack set.
This lets compactness or boundedness proofs feed Mathlib least-upper-bound
data directly: prove the feasible translated slack range is compact (or show
it sits inside a compact closure/envelope, or show each coordinate image is
`BddAbove`), then compare either its coordinate `sSup` values or the compact
envelope coordinate `sSup` values to `B * slack_i(xbar0)`.  The envelope-sup
comparison uses `csSup_le_csSup` with the source feasible point as the
nonempty witness, avoiding any fake bottom instance for real `sSup`.  The
newest upper-bound wrapper reduces the scalar envelope obligation further to
pointwise bounds `slack_i(y) <= upper_i` on the compact envelope plus
`upper_i <= B * slack_i(xbar0)`.  The closed-ball wrapper specializes this to
`feasible <= closedBall center R` and coordinate bounds
`slack_i(y) <= slack_i(center) + R`, reusing Mathlib `isCompact_closedBall`,
finite-dimensional proper-space inference for the range subtype, and
`PiLp.norm_apply_le`.  The source-centered radius wrapper should now be the
preferred aggressive §13.16 geometry target when the bounded-polytope proof
can show
`dist y ((polytopeSlackCLM aRow).rangeRestrict xbar0) <= R` for every
feasible translated slack-range point; it reuses `Metric.mem_closedBall` to
feed the closed-ball bridge and reduces the remaining scalar work to
`R <= (B - 1) * slack_i(xbar0)`.  When the geometry is naturally in the
logarithmic-barrier/Dikin metric, prefer the source-local-norm wrapper: a
uniform bound
`localNorm rangeHess xbar0Range (y - xbar0Range) <= r` gives slack-ratio
budget `1 + r` by reusing
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`;
the exact-budget specialization removes the auxiliary `B`, derives
`0 <= 1 + r` from the bound at the source using `localNorm_zero`, and leaves
only the scalar tail budget `sqrt(m) * (1 + r) <= tailBound`.
If the geometry is coordinate-relative instead, prefer the new exact-budget
coordinate wrappers: prove either
`||slack_i(y) - slack_i(xbar0)|| <= rho * slack_i(xbar0)` or
`||slack_i(y) / slack_i(xbar0) - 1|| <= rho` for every feasible range point.
The compiled bridge reuses
`positiveOrthantNegLog_localNorm_le_sqrt_fin_mul_of_coord_abs_le`,
`positiveOrthant_coord_abs_sub_le_mul_of_relative_abs_sub_le`,
`barrierAffineRange_localNorm_eq_ambient`, and `Real.norm_eq_abs`, then
reduces the scalar tail obligation to
`sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.

Archived route log below: the active Chapter 13 lane has moved beyond
Example 13.14's finite-row logarithmic barrier closure into Chewi Lemma
13.15.  The compiled local packets add `localNorm_neg`,
`abs_inner_le_dualLocalNorm_mul_localNorm_of_cauchy`,
`inner_sq_le_dualLocalNorm_sq_mul_localNorm_sq_of_cauchy`,
`abs_inner_le_sqrt_mul_localNorm_of_one_sided_cauchy`,
`inner_sq_le_mul_hessian_of_one_sided_cauchy`,
`chewi1315_gradient_inner_sq_le_of_cauchy`, and the concrete range-slice
consumer `chewi1315_polytopeSlackNegLog_range_gradient_inner_sq_le` in
`StatInference/Optimization/InteriorPoint.lean`.  This closes Lemma 13.15(1)
in supplied-oracle form and for the arbitrary finite-row log barrier range
model using the already-compiled Example 13.14 Cauchy bridge.  The latest
Lemma 13.15(2) packet adds
`scalar_initial_le_of_sq_le_mul_deriv_on_unit_interval`,
`hessianSegmentGradientInner_hasDerivWithinAt_of_hasFDerivAt`,
`hessianSegmentGradientInner_continuousOn_of_convex`,
`chewi1315_segment_inner_le_of_sq_deriv`,
`chewi1315_gradient_segment_inner_le_of_cauchy`, and
`chewi1315_gradient_segment_inner_le_of_cauchy_continuousOn`.  This discharges
the source reciprocal/sign/zero-crossing argument in Lean and proves the
source inequality from convex-domain segment membership, gradient continuity,
gradient/Hessian differentiability, and the local Cauchy bridge.  The newest
concrete instantiation adds `positiveOrthantNegLogGrad_continuousOn` and
`chewi1315_positiveOrthantNegLog_gradient_segment_inner_le`, proving Lemma
13.15(2) for the finite positive-orthant logarithmic barrier when `0 < d`.
The newest affine transport packet adds
`barrierAffinePreimageGrad_hasFDerivAt`,
`convex_barrierAffineRangeSet`, `barrierAffineRangeGrad_hasFDerivAt`,
`barrierAffineRangeGrad_continuousOn_of_hasFDerivAt`,
`chewi1315_polytopeSlackNegLog_range_gradient_segment_inner_le`, and the
source-space endpoint
`chewi1315_polytopeSlackNegLog_gradient_segment_inner_le`.  This closes Chewi
Lemma 13.15(2) for arbitrary finite-row polytope logarithmic barriers when
`0 < m`, reusing the existing Example 13.14 range Cauchy bridge and the
positive-orthant gradient derivative rather than duplicating barrier
foundations.  The next theorem-sized packet should use the compiled Lemma
13.15 wrappers in the path-following decrement recurrence and central-path
barrier-parameter estimates.  The newest Lemma 13.16 assembly packet adds
`real_le_div_one_sub_of_sq_div_one_add_le_mul`,
`chewi1316_localNorm_le_decrement_div_one_sub`,
`chewi1316_central_objective_gap_le`,
`chewi1316_objective_gap_to_center_le`, and
`chewi1316_objective_gap_le`, proving the source-shaped objective-gap bound
from supplied central-path optimality, Lemma 13.15 barrier displacement,
local Cauchy/decrement bounds, and the Lemma 13.6 distance lower inequality.
The next theorem-sized packet should formalize the main-stage update
invariant: with `lambda_{t_n}(x_n) <= 1/4`,
`t_{n+1} = (1 + c0 / sqrt nu) * t_n`, `0 <= c0 <= 1/16`, and `1 <= nu`,
the pre-Newton decrement for `f_{t_{n+1}}` is small enough that the compiled
Theorem 13.8 Newton-step wrapper returns
`lambda_{t_{n+1}}(x_{n+1}) <= 1/4`.  The newest main-stage algebra packet adds
`chewi1316_preNewtonDecrement_le_update_bound`,
`real_mainStage_newton_fraction_le_quarter`, and
`chewi1316_mainStage_newtonDecrement_le_quarter`.  This closes the scalar
`c0 <= 1/16` post-Newton algebra and the supplied dual-norm-interface
pre-Newton update bound.  The newest dual-norm update-interface packet adds
`dualLocalNorm_eq_adjointCoord_norm_of_factor`,
`dualLocalNorm_add_le_of_adjointCoordFactor`,
`dualLocalNorm_smul_of_adjointCoordFactor`,
`chewi1316_preNewtonDecrement_le_update_bound_of_adjointCoordFactor`, and
`chewi1316_preNewtonDecrement_le_update_bound_of_adjointSqrt_right_inverse`.
This discharges the triangle/homogeneity interface from the same
inverse-Hessian right-inverse plus square-root-coordinate model used in the
Theorem 13.8 route.  The newest main-stage invariant packet adds
`chewi1316_preNewtonDecrement_le_update_bound_of_gradientUpdate_adjointSqrt_right_inverse`,
`chewi1316_mainStage_newtonDecrement_le_quarter_of_gradientUpdate_and_newtonBound`,
and
`chewi1316_mainStage_newtonDecrement_le_quarter_of_sqrtCoordFamilyModel_sourceNewtonSegment`.
This packages the source gradient-update equality, the pre-Newton bound, and
the compiled Theorem 13.8 Newton-step wrapper into the invariant
`lambda <= 1/4 -> lambda_next <= 1/4`.  The newest central-path algebra packet
adds `centralPathGradient_update_eq`,
`centralPathGradient_update_eq_of_tNext`,
`chewi1316_preNewtonDecrement_le_update_bound_of_centralPathGradient_adjointSqrt_right_inverse`,
and
`chewi1316_mainStage_newtonDecrement_le_quarter_of_centralPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
This discharges the purely algebraic `t_next = (1 + delta) * t` gradient-update
rewrite for objectives with gradient `t • a + grad phi(x)`.  The newest
positive-orthant central-path packet adds `centralPathGrad`,
`centralPathGrad_hasFDerivAt`, `newton_linear_of_hessian_right_inverse`,
`positiveOrthantCentralPathGrad_hasFDerivAt`,
`positiveOrthantCentralPathGrad_segment_hasFDerivAt`,
`positiveOrthantCentralPathGrad_newton_linear`, and
`positiveOrthantNegLog_dualLocalNorm_grad_le_sqrt_card`.  This discharges the
positive-orthant central-path objective differentiability, segment
differentiability, Newton linearization, and barrier-gradient norm bound used
by the main-stage wrapper.  The newest feasible-step packet adds
`positiveOrthant_mem_of_localNorm_sub_lt_one`,
`positiveOrthant_mem_of_mem_dikinEllipsoid_one`,
`positiveOrthant_newtonStep_mem_of_newtonDecrement_lt_one`, and
`positiveOrthantCentralPathGrad_newtonStep_mem_of_decrement_lt_one`.  This
closes the Dikin-radius-one feasibility gate for positive-orthant Newton
steps by reusing the compiled square-root-coordinate local norm identity and
Newton decrement/Dikin membership wrappers.  The newest positive-orthant
main-stage assembly packet adds
`chewi1316_positiveOrthant_preNewtonDecrement_le_update_bound`,
`chewi1316_positiveOrthant_preNewtonDecrement_lt_one`,
`chewi1316_positiveOrthant_mainStage_step_mem`,
`chewi1316_positiveOrthant_mainStage_decrement_le_quarter`, and
`chewi1316_positiveOrthant_mainStage_step_mem_and_decrement_le_quarter`.  This
packages the source update `tNext = (1 + delta) * t`, the pre-Newton bound,
the Dikin feasibility step, and the post-Newton `lambda <= 1/4` invariant for
the finite positive-orthant central path.  The newest scalar iteration packet
adds `chewi1316_mainStageParameter_eq_pow_mul`,
`chewi1316_mainStageParameter_eq_pow_mul_of_delta`, and
`chewi1316_mainStageParameter_pos_of_pos`, proving the source closed form
`t_N = (1 + c0 / sqrt nu)^N * t_0` from the multiplicative update recurrence.
The newest objective-gap stopping packet adds
`chewi1316_objectiveGapNumerator_le_two_mul`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t`, and
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large`, combining the
closed-form parameter growth with the compiled Lemma 13.16 objective-gap bound
to prove the source stopping rule when `t_N` is large enough.  The next live
preliminary-stage packet adds
`chewi1316_preliminaryStageParameter_eq_pow_mul_of_delta`,
`chewi1316_preliminaryStageParameter_pos_of_pos`,
`centralPathGradient_decrease_eq`,
`centralPathGradient_decrease_eq_of_tNext`, `preliminaryPathDirection`,
`preliminaryPathGrad`, `preliminaryPathGrad_one_self`,
`preliminaryPathGrad_zero`, `preliminaryPathGrad_zero_of_analyticalCenter`,
`preliminaryPath_newtonDecrement_one_self_eq_zero`,
`preliminaryPath_newtonDecrement_one_self_le_quarter`,
`preliminaryPath_newtonDecrement_zero_of_analyticalCenter`,
`preliminaryPathGrad_hasFDerivAt`, and
`preliminaryPathGradient_decrease_eq_of_tNext`.  The newest preliminary
invariant packet then adds
`chewi1316_preNewtonDecrement_le_decrease_bound`,
`chewi1316_preNewtonDecrement_le_decrease_bound_of_adjointCoordFactor`,
`chewi1316_preNewtonDecrement_le_decrease_bound_of_adjointSqrt_right_inverse`,
`chewi1316_preNewtonDecrement_le_decrease_bound_of_gradientUpdate_adjointSqrt_right_inverse`,
`chewi1316_preNewtonDecrement_le_decrease_bound_of_preliminaryPathGradient_adjointSqrt_right_inverse`,
`chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_gradientDecrease_and_newtonBound`,
`chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_sqrtCoordFamilyModel_sourceNewtonSegment`,
and
`chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_preliminaryPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
The exact-center main-stage initialization bridge also adds
`centralPathGrad_at_analyticalCenter`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_analyticalCenter`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_analyticalCenter_of_nonneg`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_analyticalCenter_of_adjointCoordFactor`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_analyticalCenter_of_adjointCoordFactor_nonneg`,
showing that at `grad phi(center) = 0`, the main-stage decrement is controlled by
the scaled dual norm `|t| * ||a||*_center`.  The newest preliminary-to-main bridge
adds
`chewi1316_mainStage_initial_decrement_le_quarter_of_barrierGrad_and_objective`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_barrierGrad_and_objective_adjointCoordFactor`,
`barrierGrad_dualLocalNorm_le_of_preliminaryPath`,
`barrierGrad_dualLocalNorm_le_of_preliminaryPath_adjointCoordFactor`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_bound`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_bound_adjointCoordFactor`.
It converts a final preliminary-path decrement at `tPre` plus small budgets
`|tPre| * ||grad phi(xbar0)||*` and `|tMain| * ||a||*` into the main-stage
initial condition `lambda <= 1/4`.  The finite sequence layer adds
`preliminaryPath_decrement_bound_of_step`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm`.
It carries an arbitrary preliminary decrement budget sequence by induction,
then rewrites the source decreasing parameter as
`t_N = (1 - c0 / sqrt nu)^N * tStart` before applying the budget bridge.
The log-count split packet adds
`chewi1316_preliminary_budget_le_quarter_of_split`,
`chewi1316_preliminary_tail_le_of_half_power_log`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_split`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_logTail`.
It explicitly splits the initialization budget into `1/16`, `1/8`, and `1/16`
terms and reuses the already-verified Chapter 5 scalar log theorem
`chewi54_half_pow_mul_le_eps_of_log_ratio_le` for the preliminary tail
half-power certificate.  The factor-count packet adds
`chewi1316_preliminary_tail_half_power_bound_of_factor_pow`,
`chewi1316_preliminary_tail_half_power_bound_of_nonneg_factor_pow`,
`chewi1316_factor_pow_le_half_pow_of_log_le`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_absFactorPowLogTail`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorPowLogTail`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorLogTail`.
It converts a scalar contraction-factor power/log certificate for
`1 - c0 / sqrt nu` into the half-power preliminary tail bound with
`tailBase = |tStart| * ||grad phi(xbar0)||*`.  The count-discharge packet adds
`chewi1316_factorLog_le_halfLog_of_count`,
`chewi1316_factor_pow_le_half_pow_of_count`,
`chewi1316_count_condition_of_sqrt_mul_log_le`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorCountTail`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTail`.
It proves the `log(1 - delta) <= -delta` count argument and exposes the
textbook-shaped sufficient condition `M log 2 * sqrt nu <= N c0`.  The
tail-base packet adds `chewi1316_tailBase_log_budget_of_le_pow` and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBound`,
so the tail-base logarithmic budget is now discharged from the plain power
bound `|tStart| * ||grad phi(xbar0)||* <= (1/16) * 2^M`.  The log-choice packet
adds `chewi1316_tailBase_le_sixteenth_mul_two_pow_of_log_le`,
`chewi1316_tailBase_le_sixteenth_mul_two_pow_of_bound_log_le`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailLogBound`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound`.
It lets the proof choose `M` from `log(16 * tailBound) <= M log 2` for any
source upper bound `tailBound` on the actual preliminary tail base.  The
integer-choice packet adds `chewi1316_exists_nat_mul_log_two_ge`,
`chewi1316_exists_nat_mul_pos_ge`,
`chewi1316_exists_tailBound_log_index`,
`chewi1316_exists_preliminary_count_index`, and
`chewi1316_exists_preliminary_tail_log_count_indices`, so the preliminary stage
now has verified natural `M,N` choices for the log-tail and
`M log 2 * sqrt nu <= N c0` count budgets whenever `tailBound > 0` and
`c0 > 0`.  The nonnegative-tail packet adds
`chewi1316_preliminary_tail_le_of_half_power_tailBase_bound`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBound_nonneg`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound_nonneg`,
so downstream source bounds no longer need to prove the actual tail base is
strictly positive.  The positive-main-parameter packet adds
`chewi1316_exists_pos_abs_mul_le_sixteenth`,
`chewi1316_exists_positive_mainStageParameter_budget`, and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound_nonneg`,
so the `|tMain| * ||a||* <= 1/16` scalar budget is now discharged by an
explicit positive choice of `tMain`.  The source-start packet adds
`preliminaryPath_initial_decrement_le_of_start_one_self` and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_factorSqrtCountTailBoundLogBound_nonneg`,
so the canonical preliminary start `tseq 0 = 1`, `xseq 0 = xbar0` discharges
the initial decrement from endpoint stationarity.
The measured-tail fallback packet adds
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredTailLogBound`,
which uses the automatic positive upper bound
`||grad phi(xbar0)||*_{x_N} + 1` on the preliminary tail base.
The reverse preliminary-gradient packet adds
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath`,
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_adjointCoordFactor`,
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_barrier`,
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_adjointCoordFactor`,
and `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_barrier`,
proving the source-side triangle estimate
`|t_N| * ||grad phi(xbar0)||*_{x_N} <= sqrt(nu) + lambda_N` from the
preliminary residual and the self-concordant barrier gradient bound.
The final-tail initialization packet adds
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_sourceStart_tailBudget`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBudget`,
which consume the actual scaled preliminary tail budget
`|t_N| * ||grad phi(xbar0)||*_{x_N} <= 1/16` directly and then choose a positive
main-stage parameter.  The extracted final-tail packet adds
`chewi1316_preliminary_final_tail_le_sixteenth_of_factorSqrtCountTailBound_nonneg`,
`chewi1316_preliminary_final_tail_le_sixteenth_of_factorSqrtCountTailBoundLogBound_nonneg`,
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBoundLogBound`,
so log/count tail algebra now produces the direct scaled final-tail budget as
a reusable standalone theorem.  The uniform-tail packet adds
`chewi1316_exists_preliminary_final_tail_budget_indices_of_uniformTailBound`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformTailBound`,
which choose `M,N` internally from a positive uniform source tail bound and
positive `c0`, then feed the direct final-tail initialization wrapper.  The
inverse-Hessian transport packet adds
`chewi1316_uniformTailBound_of_inverseHessianQuadraticUpper` and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_inverseHessianQuadraticUpper`,
so a single quadratic-form upper comparison between `invHess (xseq N)` and
`invHess xbar0`, plus a source-point dual-norm budget, now supplies the uniform
tail bound and triggers the same index-choice/main-stage initialization
pipeline.  The local-norm duality packet adds
`chewi1316_uniformTailBound_of_dualLocalNormUpper`,
`chewi1316_uniformTailBound_of_localNormLower_and_inverseIdentity`, and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_localNormLower_and_inverseIdentity`,
so a primal local-norm lower comparison plus inverse-local and Cauchy
identities now also supplies the same uniform source-tail/main-stage
initialization result.  The segment-stability packet adds
`chewi1316_uniformTailBound_of_hessianSegmentExponentialBounds_and_inverseIdentity`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_hessianSegmentExponentialBounds_and_inverseIdentity`,
so a sequence of `HessianSegmentExponentialBounds` certificates plus a uniform
denominator budget `den <= 1 - M*r_N` now feeds the same source-start
initialization route.  The mixed-third certificate packet adds
`chewi1316_uniformTailBound_of_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`,
so the source-radius `HessianSegmentMixedThirdLocalNormCertificate` sequence can
now feed preliminary initialization directly.  The source-start successor
packet adds
	`chewi1316_sourceTailBound_of_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_and_inverseIdentity`, and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_and_inverseIdentity`,
	handling the degenerate `xseq 0 = xbar0` case separately and using
	source-radius certificates only on successor indices.  The uniform-radius
	successor packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_and_inverseIdentity`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_and_inverseIdentity`,
	so one global bound
	`||x_{N+1}-xbar0||_{xbar0} <= radiusBound`, together with
	`M*radiusBound < 1` and `den <= 1 - M*radiusBound`, now discharges all
	successor denominator obligations.  The latest scalar-budget shrink adds
	`sourceBound_le_tailBound_of_div_budget`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_budget_and_inverseIdentity`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_and_inverseIdentity`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_budget_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_and_inverseIdentity`.
	These derive the degenerate source-index tail bound from the denominator
	budget and expose the canonical denominator `1 - M*radiusBound`.  The
	zero-displacement-safe packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_and_inverseIdentity`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_and_inverseIdentity`,
	so successor points equal to `xbar0` are discharged by the source tail and
	only genuinely nonzero successors use the source-radius segment certificate.
	The global-derivative packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_globalDeriv_and_inverseIdentity`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_globalDeriv_and_inverseIdentity`,
	so exact-source callers can provide a single domain-wide Hessian derivative
	and mixed-third identity package instead of per-successor segment oracles.
	The barrier-interface packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	These consume `SelfConcordantBarrierOn` directly, deriving
	self-concordance, inverse-Hessian nonnegativity, and the source gradient
	bound `||grad phi(xbar0)||* <= sqrt(nu)` from the barrier record.  In the
	common unit-parameter/radius-half shape, the scalar source budget is exposed
	as `2 * sqrt(nu) <= tailBound`.  The latest source-radius telescope packet
	adds `localNorm_eq_norm_of_adjointSqrt`,
	`localNorm_add_le_of_adjointSqrt`,
	`localNorm_sum_le_sum_localNorm_of_adjointSqrt`,
	`sequence_sub_initial_eq_sum_steps_of_succ_sub`,
	`sequence_sub_initial_eq_sum_steps_of_succ_eq_add`,
	`sourceRadius_le_of_sum_steps_of_adjointSqrt`,
	`sourceRadius_successor_bound_of_sum_steps_of_adjointSqrt`,
	`sourceRadius_successor_bound_of_succ_sub_steps_of_adjointSqrt`,
	`sourceRadius_successor_bound_of_add_steps_of_adjointSqrt`,
	the corresponding radius-half wrappers, and
	`chewi1316_uniformTailBound_of_add_steps_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	The existential source-start lift
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_addSteps_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`
	now turns those additive-step radius-half data directly into the positive
	main-stage initialization conclusion.
	The direct local-step-sum packet adds
	`sourceRadius_successor_half_of_add_steps_sumLocalNorm_of_adjointSqrt`,
	`chewi1316_uniformTailBound_of_add_steps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_addSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	These remove the auxiliary `stepBound` function when the caller has the
	natural cumulative source-local step-norm budget
	`sum_{n<=N} ||steps n||_{xbar0} <= 1/2`.
	The preliminary-Newton packet adds
	`sourceRadius_successor_half_of_newtonSteps_sumLocalNorm_of_adjointSqrt`,
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	These replace the additive-update premise by the algorithmic recurrence
	`x_{n+1} = NewtonStep(preliminaryPathGrad(t_n), x_n)`.
	The current-local budget packet adds
	`localNorm_source_le_two_current_of_sourceRadius_half`,
	`sourceLocalNorm_sum_newtonSteps_le_half_of_currentLocalNorm_budget`,
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	These use Chewi Lemma 13.6 to transport each current-local Newton
	displacement into the source metric and replace the raw source-local
	cumulative budget by the scalar budget `sum_{n<=N} 2 * lambda_n <= 1/2`
	together with current-local/Newton-decrement identities.
	The right-inverse cleanup adds
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_hessianRightInverse`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_hessianRightInverse`.
	These derive both the inverse-local identity and the Newton-step
	local-norm/decrement identity from
	`hess(x_n) (invHess(x_n) v) = v`.
	The square-root-coordinate family layer adds
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`.
	These derive the source Hessian factorization, inverse-Hessian right-inverse,
	and dual quadratic factorization from the concrete representation
	`hess(x_n) = sqrtCoord_n† sqrtCoord_n` and
	`invHess(x_n) = sqrtCoord_n.symm sqrtCoord_n.symm†`.
	The non-vacuous successor-index cleanup adds
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformTailBound_tailLambdaBudget`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	This fixes the route issue that the older existential source-start wrappers
	combined `1/4 <= lambdaSeq 0` with a global `lambdaSeq N <= 1/8` premise,
	which is inconsistent at `N = 0`; the new wrappers always select a
	successor preliminary index and only require `lambdaSeq (N+1) <= 1/8`.
	The sharper preliminary-stage invariant packet adds
	`real_mainStage_newton_fraction_le_eighth`,
	`chewi1316_mainStage_newtonDecrement_le_eighth`,
	`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_gradientDecrease_and_newtonBound`,
	`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_sqrtCoordFamilyModel_sourceNewtonSegment`,
	and
	`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_preliminaryPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
	These show the successor `1/8` budget follows from the same Theorem 13.8
	Newton-step route when the source update constant satisfies `c0 <= 1/200`.
	The next-parameter sequence bridge adds
	`chewi1316_preliminaryPath_decrement_step_le_eighth_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`
	and
	`chewi1316_preliminaryPath_lambdaSeq_step_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`.
	These turn the pointwise preliminary invariant into the exact
	`hdecrement_step` interface for a trajectory satisfying the textbook update
	`x_{n+1} = newtonStep (grad f_{t_{n+1}}) x_n`; this fixes the indexing
	risk in older source-tail wrappers that used the old-parameter Newton
	step `grad f_{t_n}`.
	The correct-index source-tail packet adds
	`chewi1316_uniformTailBound_of_preliminaryNextNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	These reuse the generic Newton-step source-radius engine with
	`gradSeq n = grad f_{t_{n+1}}` and keep a separate `stepBudget` for the
	pre-Newton displacements, avoiding the incorrect shortcut that the old
	residual sequence `lambdaSeq n` controls the next-parameter Newton step
	norm.
	The pre-decrement-budget cleanup adds
	`chewi1316_uniformTailBound_of_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	These derive the local step norm from
	`lambda_{f_{t_{n+1}}}(x_n)` using
	`localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse`, so
	callers no longer need to provide raw local-norm step bounds.
	The pre-decrement pointwise bridge adds
	`chewi1316_preliminaryPath_preDecrementNext_le_stepBudget_of_residual_quarter_sqrtCoordFamily`,
	which derives a next-parameter pre-Newton decrement budget from the old
	residual invariant `lambda_{f_{t_n}}(x_n) <= 1/4`, the decreasing update
	`t_{n+1} = (1 - delta) t_n`, and the square-root-coordinate inverse-Hessian
	model.  It also records
	`chewi1316_preDecrementStepBudget_lower_incompatible_with_sourceBudget`:
	when `c0 >= 0`, the resulting constant lower bound is already at least
	`1/4`, so feeding that constant-level budget into the global prefix-sum
	source-radius interface contradicts the `1/2` source budget after two
	steps.  This formally rules out the naive constant pre-decrement
	summability route and points the next blocker at a sharper preliminary
	radius/telescoping argument or an analytical-center distance bound.
	The correct-index source-start consumer now adds
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordModel`.
	This theorem removes repeated caller plumbing: it uses the domain-wide
	`sqrtCoord : E -> E ≃L[ℝ] E` model to build the sequence square-root data,
	the source Cauchy bridge, Hessian strict positivity, and the internal
	`lambdaSeq` decrement step with budgets `lambdaSeq 0 = 1/4` and
	`lambdaSeq (n+1) = 1/8`.  It still leaves the real source gate explicit:
	prove a summable next-parameter pre-Newton budget
	`sum_{n<=N} 2 * stepBudget n <= 1/2`; do not replace it by the constant
	pointwise budget ruled out above.
	The concrete positive-orthant specialization now adds
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_preDecrementBudget`.
	This discharges the finite-product log-barrier plumbing for the same
	correct-index source-start route: `positiveOrthantNegLogSqrtCoord`,
	`positiveOrthantNegLogHessCLM_sqrtCoord_model_positiveOrthant`,
	`positiveOrthantNegLogInvHessCLM_sqrtCoord_model_positiveOrthant`,
	`positiveOrthantNegLog_selfConcordantBarrierOn`,
	`positiveOrthantNegLogHessCLM_hasFDerivAt`, and
	`positiveOrthantNegLogHessDerivCLM_mixed_inner`.  The live blocker remains
	exactly the quantitative summable next-parameter pre-Newton decrement
	budget or a stronger analytical-center/source-radius route.
	The direct source-radius route now also compiles as
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadiusHalf_barrier_globalDeriv_and_sqrtCoordModel`
	and its concrete finite-product specialization
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_sourceRadiusHalf`.
	These use the tail-lambda source-start wrapper, so `lambdaSeq 0 = 1/4`
	and successor `lambdaSeq = 1/8` are compatible.  The remaining analytical
	center gate can now be stated sharply as
	`forall N, ||x_{N+1} - xbar0||_{xbar0} <= 1/2` for the actual preliminary
	path, without any additional positive-orthant barrier plumbing.
	The coordinate-radius interface now also compiles through
	`euclideanSpace_norm_le_sqrt_fin_mul_of_abs_coord_le`,
	`positiveOrthantNegLog_localNorm_le_sqrt_fin_mul_of_coord_abs_le`,
	`positiveOrthantNegLog_sourceRadiusHalf_of_coord_abs_le_inv_two_sqrt`,
	and
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_coordRadiusHalf`.
	The next quantitative gate can therefore be attacked coordinatewise:
	prove for the concrete preliminary path
	`|xseq (N+1) i - xbar0 i| <= (1/(2*sqrt d))*xbar0 i` for every
	coordinate and prefix index.
	The scalar recurrence layer now further compiles:
	`positiveOrthant_preliminaryPathGrad_apply_coord`,
	`positiveOrthant_preliminaryPath_newtonStep_apply`,
	`positiveOrthant_coord_abs_sub_le_mul_of_relative_abs_sub_le`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_coord_eq`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_relativeCoord_eq`,
	and
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_relativeCoordRadiusHalf`.
	Thus the next sharp blocker is scalar: for
	`y_n(i)=xseq n i / xbar0 i`, use
	`y_{n+1}=2*y_n-tseq(n+1)*y_n^2` and the closed-form `tseq`
	recurrence to prove `|y_{N+1}(i)-1| <= 1/(2*sqrt d)`.
	A verified obstruction/consequence layer now also compiles:
	`scalar_sequence_linear_lower_bound_of_step`,
	`scalar_radius_bound_forces_linear_step_count`, and
	`chewi1316_relativeCoordRadiusHalf_forces_count_bound_of_linear_growth`.
	If the scalar relative coordinate grows by at least `c0/sqrt d` per step,
	the uniform relative-radius-half premise forces `(N+1)*c0 <= 1/2` for
	every certified prefix index.  This flags that a global all-`N`
	source-radius premise is likely too strong for the full decreasing-`t`
	preliminary path; future work should either prove a finite-window version
	or switch to a metric/center adapted to the moving path.
	The selected-index source-radius packet now adds
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_selectedSourceRadiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	This is the finite-window replacement for the suspect all-prefix route:
	callers provide the chosen log/count indices `M,N`, the source-radius-half
	certificate only at `xseq N`, the global barrier derivative package, and
	the scalar budget `2 * sqrt(nu) <= tailBound`; the wrapper proves the
	selected source-tail estimate and returns the positive main-stage
	initialization conclusion with that same `M,N`.  The next exact-source
	packet should target a selected finite window or moving-center radius
	certificate, not a global `forall N` source-radius theorem.
	The selected-index route is now lifted through the square-root-coordinate
	and concrete finite positive-orthant layers by
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_selectedSourceRadiusHalf_barrier_globalDeriv_and_sqrtCoordModel`,
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedSourceRadiusHalf`,
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedCoordRadiusHalf`,
	and
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedRelativeCoordRadiusHalf`.
	Thus the positive-orthant exact-source gate is now a finite-window scalar
	bound:
	`|xseq N i / xbar0 i - 1| <= 1/(2*sqrt d)` for the selected positive
	index `N`, together with the already-explicit log/count budgets for `M,N`.
	The actual preliminary Newton scalar recurrence has now been checked
	against this gate.  The new declarations
	`scalar_newton_decreasing_parameter_step_lower`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_relativeCoord_linear_lower`,
	`chewi1316_selectedRelativeCoordRadiusHalf_forces_count_bound_of_preliminaryNextNewton`,
	and
	`chewi1316_selectedRelativeCoordRadiusHalf_and_count_force_logIndex_bound`
	show that the recurrence itself forces linear relative-coordinate growth:
	a selected relative-radius certificate at index `N`, combined with the
	Chewi count condition, implies
	`M * log 2 * sqrt d <= 1/2`.  Therefore the selected-source-radius route is
	only viable in a very small finite window; for the textbook-scale log/count
	choice, the exact §13.16 proof should switch to a moving-center/local-metric
	argument or a different source-tail estimate rather than trying to prove
	this selected relative-radius certificate.
	The moving-coordinate source-tail route now has a concrete positive-orthant
	API: `positiveOrthantNegLog_sourceGrad_dualLocalNorm_eq_norm_relative`
	rewrites
	`||grad phi(xbar0)||*_{x}` as the Euclidean norm of the coordinate ratios
	`x_i / xbar0_i`, and
	`positiveOrthantNegLog_sourceGrad_tailBudget_of_scaled_relative_le`
	discharges the direct final-tail budget from the scaled coordinate bounds
	`|t| * |x_i / xbar0_i| <= 1/(16*sqrt d)`.  Future §13.16 packets should
	target this moving/scaled relative-coordinate invariant rather than
	unscaled displacement from `xbar0`.
	The newest scaled-relative obstruction packet adds
	`scalar_newton_decreasing_parameter_product_ge_half`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_scaled_relative_ge_half`,
	and
	`chewi1316_positiveOrthant_scaledRelativeTailBudget_forces_half_le`.
	For the actual preliminary Newton recurrence with `c0/sqrt d <= 1/200`,
	it proves `1/2 <= |t_N| * |x_N i / xbar0_i|`; therefore any direct
	positive-orthant scaled-tail certificate
	`|t_N| * |x_N i / xbar0_i| <= 1/(16*sqrt d)` forces
	`1/2 <= 1/(16*sqrt d)`.  This rules out the pure positive-orthant
	scaled-tail gate as a textbook-scale §13.16 route and redirects the next
	packet toward a true moving-center/local-metric certificate or a
	bounded-polytope source-tail argument.  Search-first result: no existing
	mathlib/local theorem matched this scalar product invariant; the proof
	reuses the compiled positive-orthant coordinate recurrence and elementary
	real algebra.
	The newest affine/range source-tail transport packet adds
	`barrierAffinePreimageAdjointDualLocalNorm_rightInverse_eq`,
	`barrierAffinePreimageSourceGradientDualLocalNorm_rightInverse_eq`,
	`barrierAffineRangeSourceGradientDualLocalNorm_surjective_eq`,
	`chewi1314_polytopeSlackNegLog_sourceGrad_dualLocalNorm_rangeInvHess_eq`,
	and
	`chewi1314_polytopeSlackNegLog_scaled_sourceGrad_dualLocalNorm_rangeInvHess_eq`.
	It rewrites the §13.16 source-gradient tail for a finite-row polytope
	logarithmic barrier into the slack-range inverse-Hessian metric.  The next
	packet should use this range-coordinate statement to prove the true
	bounded-polytope source-tail estimate, rather than returning to the already
	ruled-out positive-orthant source-radius or scaled-tail certificates.
	The newest range-tail consumer packet adds
	`chewi1314_polytopeSlackNegLog_rangePullInvHess` and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeTailBudget`.
	It turns a closed-form scaled final source-tail bound in the slack-range
	inverse-Hessian metric into the positive main-stage initialization
	certificate, reusing the compiled source-start theorem.  The next packet is
	therefore the actual bounded-polytope range-tail estimate.
	The newest uniform range-tail handoff packet adds
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformRangeTailBound_tailLambdaBudget`.
	It chooses the logarithmic/count preliminary length internally, shifts to a
	successor index for the final `lambda <= 1/8` budget, and feeds the
	range-tail consumer from a single uniform slack-range bound
	`dualLocalNorm rangeInvHess (rangeRestrict (xseq N)) (rangeGrad (rangeRestrict xbar0)) <= tailBound`.
	The live mathematical blocker is now exactly this uniform slack-range
	source-tail estimate for bounded polytopes; do not return to the already
	ruled-out positive-orthant source-radius or scaled-relative certificates,
	and do not repeat affine/range transport or scalar log/count plumbing.
	The range-preliminary-Newton packet adds
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	It instantiates the generic correct-index preliminary-next-Newton tail
	theorem on the finite slack range, deriving the range barrier, Hessian
	positivity, and source-point Cauchy bridge from Example 13.14's
	range inverse-Hessian plus a supplied range square-root-coordinate family.
	The direct source-radius handoff packet adds
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_zeroSafe_globalDeriv_and_inverseIdentity`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_zeroSafe_globalDeriv_and_inverseIdentity_tailLambdaBudget`.
	It reuses the same generic source-tail theorem but avoids baking in the
	preliminary-Newton recurrence and square-root-coordinate family: the
	remaining direct gate is now a range source-radius-half certificate,
	source-point Cauchy certificate, successor membership, and the global range
	Hessian derivative package.  The exact-source route can proceed either by
	proving these direct certificates or by instantiating the stronger
	range preliminary Newton recurrence, summed pre-decrement budget, and
	range square-root-coordinate model when that is faster.
	The source-only square-root packet adds
	`chewi1314_polytopeSlackNegLog_range_sourceCauchy_of_adjointSqrtCoord`,
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_zeroSafe_globalDeriv_and_sourceSqrtCoord`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_zeroSafe_globalDeriv_and_sourceSqrtCoord_tailLambdaBudget`.
	It discharges the direct route's source-point Cauchy certificate from an
	adjoint-square factorization only at `xbar0Range`.  The remaining direct
	gates before the Hessian-calculus handoff were the range
	source-radius-half certificate, successor membership, source
	Hessian/inverse-Hessian factorization, global range Hessian
	derivative/mixed-third package, and the scalar tail budget.
	The newest range Hessian-derivative handoff packet adds
	`barrierAffinePreimageHessCLM`, `barrierAffinePreimageHessDeriv`,
	`barrierAffinePreimageHess_hasFDerivAt`,
	`barrierAffinePreimageHessDeriv_inner_eq`,
	`barrierAffineRangeHessDeriv`, `barrierAffineRangeHess_hasFDerivAt`,
	`barrierAffineRangeHess_continuousOn_of_hasFDerivAt`,
	`barrierAffineRangeHessDeriv_inner_eq`,
	`chewi1314_polytopeSlackNegLog_rangeHessDeriv`,
	`chewi1314_polytopeSlackNegLog_rangeHess_hasFDerivAt`,
	`chewi1314_polytopeSlackNegLog_rangeHess_continuousOn`,
	`chewi1314_polytopeSlackNegLog_rangeHessDeriv_mixed_inner`,
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_and_sourceSqrtCoord`,
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_and_sourceSqrtCoord_tailLambdaBudget`.
	This instantiates the finite-row polytope range Hessian continuity,
	derivative, and mixed-third assumptions from the positive-orthant
	logarithmic barrier, so the remaining direct gates are now range
	source-radius-half, successor range membership, source Hessian/inverse-
	Hessian factorization at the source point, and the scalar tail budget.
	The newest direct Cauchy/right-inverse packet adds
	`hessianCauchy_sq_of_quadratic_pos`,
	`dualPrimalCauchy_of_hessian_right_inverse_pos`,
	`barrierAffinePreimageHess_symmetric`,
	`barrierAffineRangeHess_symmetric`,
	`positiveOrthantNegLogHessCLM_symmetric`,
	`chewi1314_polytopeSlackNegLog_rangeHess_symmetric`,
	`chewi1314_polytopeSlackNegLog_range_sourceCauchy`,
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf`,
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget`.
	This discharges the source-point Cauchy/source square-root factorization
	gate directly from strict range Hessian positivity plus the concrete range
	inverse-Hessian right-inverse.  The direct dual-seminorm/no-factor packet adds
	`localNorm_add_le_of_hessian_pos`,
	`dualLocalNorm_add_le_of_hessian_right_inverse_pos`,
	`dualLocalNorm_smul_of_invHess_nonneg`,
	`dualLocalNorm_smul_of_hessian_right_inverse`,
	`chewi1314_polytopeSlackNegLog_rangeInvHess_dualLocalNorm_add_le`,
	`chewi1314_polytopeSlackNegLog_rangeInvHess_dualLocalNorm_smul`,
	`chewi1314_polytopeSlackNegLog_rangePullInvHess_dualLocalNorm_add_le`,
	`chewi1314_polytopeSlackNegLog_rangePullInvHess_dualLocalNorm_smul`,
	`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_dualLaws`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_sourceStart_tailBudget_dualLaws`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBudget_dualLaws`,
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeTailBudget_noFactor`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor`.
	This removes the pulled-back inverse-Hessian factorization from the direct
	§13.16 slack-range handoff: the final-point triangle/homogeneity laws are
	now derived from the concrete range Hessian right-inverse.  The newest
	range-successor packet adds `barrierAffineRange_localNorm_eq_ambient`,
	`barrierAffineRangeSet_mem_of_localNorm_sub_lt_one_positiveOrthant`,
	`chewi1314_polytopeSlackNegLog_range_newtonStep_mem_of_decrement_lt_one`,
	`chewi1316_polytopeSlackNegLog_range_successor_mem_of_preliminaryNextNewtonSteps_preDecrementBudget`,
	`chewi1316_polytopeSlackNegLog_rangeRestrict_successor_mem_of_preliminaryNextNewtonSteps_preDecrementBudget`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor_of_preliminaryNextNewtonSteps`.
	This removes successor range membership as a separate direct-route gate
	whenever the caller supplies the range preliminary-next-Newton recurrence
	and its summable pre-decrement budget.  The no-square-root radius packet adds
	`localNorm_sum_le_sum_localNorm_of_hessian_pos`,
	`sourceRadius_le_of_sum_steps_of_hessian_pos`,
	`sourceRadius_successor_half_of_add_steps_sumLocalNorm_of_hessian_pos`,
	`sourceRadius_successor_half_of_newtonSteps_sumLocalNorm_of_hessian_pos`,
	`sourceLocalNorm_sum_newtonSteps_le_half_of_currentLocalNorm_budget_hessian_pos`,
	`sourceRadius_successor_half_of_newtonSteps_currentLocalNorm_budget_hessian_pos`,
	`chewi1316_polytopeSlackNegLog_rangeSourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`,
	`chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor_of_preliminaryNextNewtonSteps_preDecrementBudget`.
	This removes range source-radius-half as a separate direct-route gate when
	the same range preliminary-next-Newton recurrence and summable
	pre-decrement budget are supplied.  The selected finite-window budget packet
	now also compiles:
	`scaledPrefixBudget_le_of_selectedPrefixBudget`,
	`sourceLocalNorm_sum_newtonSteps_le_half_of_currentLocalNorm_selectedBudget_hessian_pos`,
	`sourceRadius_successor_half_of_newtonSteps_currentLocalNorm_selectedBudget_hessian_pos`,
	`chewi1316_polytopeSlackNegLog_range_successor_mem_of_preliminaryNextNewtonSteps_selectedPreDecrementBudget`,
	`chewi1316_polytopeSlackNegLog_rangeRestrict_successor_mem_of_preliminaryNextNewtonSteps_selectedPreDecrementBudget`,
	`chewi1316_polytopeSlackNegLog_rangeSourceRadiusHalf_of_preliminaryNextNewtonSteps_selectedPreDecrementBudget_noFactor`,
	`chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_preliminaryNextNewtonSteps_selectedPreDecrementBudget_noFactor`,
	`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_selectedPreDecrementBudget`, and
	`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_twenty_five`,
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_twenty_five_internalSelectedRangeTailBound_succ_noFactor_standardConstants`.
	The sharper slack-ratio finite-window packet also compiles:
	`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRatio_three_halves_length_le_twenty_five` and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_twenty_five_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
	The newest sharpened finite-window packet improves the scalar invariant to
	`1/198`, giving the prefix bound `(K+1)/99` and extending the selected
	slack-ratio route through
	`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRatio_three_halves_length_le_forty_nine`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
	This is the current §13.16 finite-window frontier: the honest actual
	quadratic finite-window prefix budget now feeds the selected range-tail
	estimate and the main-stage initializer under `N + 1 <= 49`; the best verified
	finite-window tail constant is still `sqrt(m) * 3/2`, without assuming a global
	all-prefix budget or the unproved half-contraction.  Next target: remove the
	short-window restriction by proving the moving-center range-tail/count
	estimate, or replace the linear `(K+1)/99` finite-window budget with a valid
	long-window decay
	argument for the actual next-pre-decrement sequence.
	The canonical scalar packet adds
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_canonicalLambda`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants`.
	This fixes the auxiliary residual sequence to `1/4, 1/8, ...`, sets
	`c0 = 1/200`, and discharges `tailBound = 2 * sqrt m` under `0 < m`.
	The range-preliminary transport packet adds
	`barrierAffinePreimage_preliminaryPathGrad_eq`,
	`barrierAffineRange_preliminaryPathGrad_dualLocalNorm_surjective_eq`,
	`chewi1314_polytopeSlackNegLog_preliminaryPath_newtonDecrement_rangePull_eq`,
	`chewi1316_polytopeSlackNegLog_rangePull_decrement_step_le_eighth_of_range_decrement_step`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeDecrement`.
	The range sqrt-coordinate wrapper adds
	`chewi1314_polytopeSlackNegLog_range_selfConcordantBarrierOn`,
	`chewi1316_polytopeSlackNegLog_range_decrement_step_le_eighth_of_nextNewton_sqrtCoordModel`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
	This removes the source-pullback preliminary decrement shape and the
	range one-step `1/4 -> 1/8` invariant as live caller-facing gates whenever
	a point-dependent domain-wide range Hessian/inverse-Hessian
	sqrt-coordinate family is
	supplied.  The source-transport packet adds
	`barrierAffineRange_preliminaryPathGrad_adjoint_rightInverse_eq`,
	`barrierAffineRange_preliminaryPath_newtonStep_rangeRestrict_eq`,
	`chewi1316_polytopeSlackNegLog_rangePreliminaryNextNewtonSteps_of_sourcePullbackPreliminaryNextNewtonSteps`,
	`chewi1316_polytopeSlackNegLog_rangePreDecrementNext_le_of_sourcePullbackPreDecrementNext_le`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
	The source one-step API adds
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_sourceDecrement`.
	The remaining direct gates are the source next pre-decrement summability
	and the range sqrt-coordinate family itself (or an equivalent mathlib
	spectral / positive-operator construction) for the range-sqrt route; a
	direct source one-step proof can bypass the range-sqrt wrapper and feed
	`...standardConstants_of_sourceDecrement` directly.  The range recurrence
	is now just transport from the source-coordinate Newton recurrence.
	Search-first reuse: local `chewi136_localNorm_sandwich_sourceRadius`,
	`hessianPrimalFactor_of_adjointSqrt`,
	`localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse`,
	`localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse`,
	`hessianRightInverse_of_adjointSqrtCoord_invHess`,
	`inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse`,
	`newton_linear_of_hessian_right_inverse`, the compiled pointwise
	preliminary `1/8` invariant, and mathlib `norm_add_le`, `norm_sum_le`,
	and `Finset.sum_range_sub`.
	Together these formalize the reverse
	path-following setup with vector
	`-grad phi(xbar0)`, decreasing `t`, endpoint stationarity at `t = 1` and `t = 0`,
	zero Newton decrement at the source endpoints, and the one-step post-Newton
	`lambda <= 1/4` and successor `lambda <= 1/8` invariants for the supplied
	preliminary path.  The next live gate is now sharper: build the concrete
	point-dependent range sqrt-coordinate family and prove the summable
	next-parameter source pre-Newton decrement budget feeding the compiled
	standard-constant no-factor handoff.
	Equivalent exponential/local-norm,
	inverse-Hessian, or direct scaled final-tail routes remain acceptable; the
	measured unscaled-tail fallback should be used only when a caller genuinely has
	an unscaled tail bound.
Do not route the next run back to product,
sum,
affine/range, positive-orthant barrier setup, the already-compiled Lemma
13.16/main-stage algebra, the dual-norm interface, the generic main-stage
wrappers, feasible-step membership, the positive-orthant main-stage one-step
invariant, the closed-form parameter recurrence, the objective-gap stopping
rule, exact-center/main-stage budget initialization, preliminary-to-main bridge,
finite preliminary sequence bridge, generic log-halving lemma, factor-tail
algebra, log-to-power comparison, count-discharge algebra, tail-base log-budget
algebra, tail-base log-choice algebra, integer budget existence, nonnegative
tail-base discharge, positive main-parameter budget, or finite preliminary
sequence induction, or source-start initial decrement unless a new downstream
proof directly needs one of those verified declarations.

Superseding update for the current frontier: the active Chapter 13 lane has
moved past the positive-orthant Theorem 13.8 wrapper and Definition 13.9
barrier packaging into Chewi Proposition 13.11 barrier calculus.  The newest
verified packet adds the `WithLp 2` product-space infrastructure, product
Hessian/inverse-Hessian/gradient/mixed-third oracles, product local/dual local
norm square identities and component domination lemmas,
`barrierProductGradient_bound`, `MixedThirdSelfConcordantOn.product`,
`SelfConcordantBarrierOn.product`, and the source-facing
`chewi1311_product_selfConcordantBarrierOn`.  Search-first result: raw
`E₁ × E₂` does not carry the needed L2 inner-product instance in this mathlib;
the reusable product rule should use `Mathlib.Analysis.InnerProductSpace.ProdL2`
and `WithLp 2 (E₁ × E₂)`.  Product local-norm algebra is no longer a live
blocker.

Next frontier update: the shared-domain sum case now has compiled
local-norm/self-concordance algebra through `barrierInterSet`,
`barrierSumHess`, `barrierSumGrad`, `barrierSumThirdMixed`,
`barrierSumLocalNorm_sq_eq`, `barrierSumLocalNorm_left_le`,
`barrierSumLocalNorm_right_le`, `MixedThirdSelfConcordantOn.sum`,
`SelfConcordantBarrierOn.sum_of_gradient_bound`, and the source-facing
`chewi1311_sum_selfConcordantBarrierOn_of_gradient_bound`.  This closes the
tedious mixed-third part of Proposition 13.11(1) in supplied-oracle form.  The
remaining nontrivial gate for the exact unsupplied sum rule is the inverse-
Hessian/dual-gradient comparison for the summed Hessian; reuse
`barrierSumGradient_bound_of_quadratic_le` if proving it from a quadratic
bound.  Do not redo product or sum local-norm algebra in the next packet.
The newest sum-gradient packet also adds `real_two_term_cauchy_sqrt`,
`barrierSumGradient_bound_of_component_cauchy`,
`SelfConcordantBarrierOn.sum_of_component_cauchy`, and
`chewi1311_sum_selfConcordantBarrierOn_of_component_cauchy`, reducing that
gate to standard component Cauchy bridges plus the summed inverse-local
identity.
The latest Cauchy reuse packet adds
`SelfConcordantBarrierOn.sum_of_adjointCoord_cauchy` and
`chewi1311_sum_selfConcordantBarrierOn_of_adjointCoord_cauchy`, using
`dualPrimalCauchy_of_adjointCoordSqrt` to discharge those component Cauchy
bridges from the same adjoint square-root coordinate models already used in
Theorem 13.8.  Search-first result: mathlib has raw Cauchy/positive-operator
APIs, but the local supplied-oracle theorem is the right abstraction here.
The exact unsupplied sum rule is now concentrated on the canonical summed
inverse-Hessian/inverse-local identity, not on component Cauchy.
The follow-up right-inverse packet adds
`SelfConcordantBarrierOn.sum_of_adjointCoord_right_inverse` and
`chewi1311_sum_selfConcordantBarrierOn_of_adjointCoord_right_inverse`.  It
derives the summed inverse-local identity from a right-inverse identity for
`barrierSumHess`, and derives the component inverse quadratic factors from
component Hessian right-inverses plus square-root coordinate models.  The
remaining exact Proposition 13.11(1) blocker is to instantiate the canonical
summed inverse-Hessian oracle and prove that right-inverse identity.
The newest sum inverse-local extraction factors that internal right-inverse
algebra into
`barrierSum_invHess_nonneg_and_invLocal_of_right_inverse`,
`barrierSum_invHess_nonneg_and_invLocal_of_right_inverse_on`,
`barrierSumHess_right_inverse_of_adjointSqrtCoord`,
`barrierSumInvHess_quadratic_nonneg_of_adjointSqrtCoord`, and
`barrierSumLocalNorm_invHess_eq_dualLocalNorm_of_adjointSqrtCoord`.
Future exact sum work should prove only the canonical summed right-inverse or
summed adjoint-square equalities, then reuse these extracted gates.
The square-root-equivalence packet adds
`SelfConcordantBarrierOn.sum_of_adjointSqrtCoord` and
`chewi1311_sum_selfConcordantBarrierOn_of_adjointSqrtCoord`.  It derives the
right-inverse hypotheses themselves from continuous-linear-equivalence
square-root models for the component Hessians and the summed Hessian:
`H = S†S`, `H⁻¹ = S⁻¹(S⁻¹)†`.  The next exact sum step should construct or
instantiate the summed square-root equivalence for a concrete model; do not
re-open the already-compiled Cauchy/right-inverse algebra.
The newest sum adjoint-square model package adds
`BarrierSumAdjointSqrtModel`,
`BarrierSumAdjointSqrtModel.sum_right_inverse`,
`BarrierSumAdjointSqrtModel.invHess_nonneg`,
`BarrierSumAdjointSqrtModel.sum_inv_local`,
`BarrierSumAdjointSqrtModel.selfConcordantBarrierOn`, and
`chewi1311_sum_selfConcordantBarrierOn_of_adjointSqrtModel`.
Future exact Proposition 13.11(1) work can instantiate one certificate carrying
the two component barriers, component square-root models, and the summed
square-root model, instead of threading the long equality list.
Bounded search result for the exact sum gate: pinned mathlib has matrix
positive-semidefinite/spectral/CFC square-root APIs
(`Mathlib.Analysis.Matrix.Spectrum`, `Mathlib.Analysis.Matrix.Order`, and
`Matrix.PosSemidef.add`), but no ready generic
`ContinuousLinearMap`/Hilbert-space square-root equivalence constructor that
turns a positive summed Hessian oracle into the `BarrierSumAdjointSqrtModel`
fields.  Do not spend the next packet rebuilding spectral theory unless the
route explicitly moves to a finite-dimensional matrix-coordinate model.

Latest affine-preimage update: Proposition 13.11(3) now has a compiled
supplied-oracle affine-preimage spine, an invertible-affine corollary, a
single oracle-model package for the non-invertible/range route, and a
right-inverse affine-preimage construction.  Reusable declarations include
`barrierAffinePreimageSet`,
`barrierAffinePreimageHess`, `barrierAffinePreimageGrad`,
`barrierAffinePreimageThirdMixed`,
`barrierAffinePreimageHess_quadratic_eq`,
`barrierAffinePreimageLocalNorm_eq`,
`MixedThirdSelfConcordantOn.affinePreimage`,
`SelfConcordantBarrierOn.affinePreimage_of_gradient_bound`,
`chewi1311_affinePreimage_selfConcordantBarrierOn_of_gradient_bound`,
`barrierAffinePreimageInvHessEquiv`,
`barrierAffinePreimageGradientDualLocalNorm_equiv_eq`,
`chewi1311_affinePreimage_selfConcordantBarrierOn_equiv`,
`BarrierAffinePreimageOracleModel`,
`BarrierAffinePreimageOracleModel.invHess_nonneg`,
`BarrierAffinePreimageOracleModel.gradient_bound_le`,
`BarrierAffinePreimageOracleModel.selfConcordantBarrierOn`, and
`chewi1311_affinePreimage_selfConcordantBarrierOn_of_oracleModel`.
The right-inverse packet adds
`barrierAffinePreimageInvHessRightInverse`,
`barrierAffinePreimageInvHessRightInverse_quadratic_eq`,
`barrierAffinePreimageDualLocalNorm_rightInverse_eq`,
`barrierAffinePreimageGrad_rightInverse_adjoint`,
`barrierAffinePreimageGradientDualLocalNorm_rightInverse_eq`,
`BarrierAffinePreimageOracleModel.of_rightInverse`,
`SelfConcordantBarrierOn.affinePreimage_rightInverse`, and
`chewi1311_affinePreimage_selfConcordantBarrierOn_of_rightInverse`.
The finite-dimensional surjective packet adds
`barrierAffinePreimageRightInverseOfSurjective`,
`barrierAffinePreimageRightInverseOfSurjective_spec`,
`barrierAffinePreimageInvHessSurjective`,
`BarrierAffinePreimageOracleModel.of_surjective`,
`SelfConcordantBarrierOn.affinePreimage_surjective`, and
`chewi1311_affinePreimage_selfConcordantBarrierOn_of_surjective`, reusing
mathlib's `ContinuousLinearMap.exists_rightInverse_of_surjective`.
The range-restriction packet adds
`barrierAffinePreimageRangeRestrict_range_eq_top`,
`SelfConcordantBarrierOn.affinePreimage_rangeRestrict`, and
`chewi1311_affinePreimage_selfConcordantBarrierOn_rangeRestrict`, so the next
exact source attempt should move the codomain to `A.range` and reuse the
surjective theorem rather than passing or rebuilding a right inverse.
The translated-range packet adds `barrierAffineRangeSet`,
`barrierAffineRangeHess`, `barrierAffineRangeGrad`,
`barrierAffineRangeThirdMixed`,
`barrierAffineRangeSet_preimage_rangeRestrict_eq`,
`SelfConcordantBarrierOn.affineRange_of_gradient_bound`,
`SelfConcordantBarrierOn.affinePreimage_rangeTranslated_of_gradient_bound`,
and `chewi1311_affinePreimage_selfConcordantBarrierOn_rangeTranslated`.
This handles the affine offset `b` by representing `dom f ∩ (b + range A)` in
coordinates on `A.range`; the next exact source attempt should provide or
identify the restricted inverse-Hessian/dual-gradient gates for that
coordinate barrier.
The translated-range collapse packet adds
`barrierAffineRange_subtype_comp_rangeRestrict`,
`barrierAffineRange_adjoint_rangeRestrict_subtype`,
`barrierAffineRange_preimageHess_eq`,
`barrierAffineRange_preimageGrad_eq`,
`barrierAffineRange_preimageThirdMixed_eq`,
`SelfConcordantBarrierOn.affinePreimage_rangeTranslated_source_of_gradient_bound`,
and `chewi1311_affinePreimage_selfConcordantBarrierOn_rangeTranslated_source`.
The outer domain/Hessian/gradient/third are now exactly the original affine
preimage oracles; only the transported range-coordinate inverse Hessian remains
exposed.
Search-first result: mathlib supplies `ContinuousLinearMap.adjoint`,
`ContinuousLinearMap.adjoint_inner_left/right`,
`ContinuousLinearMap.adjoint_comp`, and
`ContinuousLinearEquiv.coe_comp_coe_symm`; there is no local Chewi affine
barrier wrapper.  Because the source statement assumes
`dom f ⊆ range 𝒜` rather than injectivity, the exact general case now needs a
range-subtype, surjective-restriction, or pseudoinverse construction reducing
the source affine map to the compiled right-inverse model.  Do not redo the
adjoint transport, invertible-affine proof, supplied oracle packaging, or
right-inverse dual-norm algebra in the next packet.

Latest inf-projection update: Proposition 13.11(4) now has a compiled
supplied-projected-oracle spine through `barrierInfProjectionSet`,
`barrierInfProjectionPoint`, `barrierInfProjectionPoint_mem_set`,
`barrierInfProjectionSet_mono`,
`SelfConcordantBarrierOn.infProjection_of_projected_oracles`, and
`chewi1311_infProjection_selfConcordantBarrierOn_of_projected_oracles`.
The next item-4 packet should attack the Schur-complement/envelope certificate
that produces the projected Hessian, inverse-Hessian, gradient, and mixed
third derivative oracles from an original product-domain barrier and a
minimizer/first-order optimality map.
The Schur-complement block packet adds `withLpProdFstCLM`,
`withLpProdSndCLM`, `withLpProdInlCLM`, `withLpProdInrCLM`,
`barrierInfProjectionBlockXX`, `barrierInfProjectionBlockXY`,
`barrierInfProjectionBlockYX`, `barrierInfProjectionBlockYY`, and
`barrierInfProjectionSchurHess`.  Reuse these for the envelope theorem; do not
redo WithLp product projection/injection plumbing.
The projected-envelope interface packet adds `barrierInfProjectionGrad`,
`barrierInfProjectionVerticalGrad`, `BarrierInfProjectionSelectorStationary`,
`barrierInfProjectionSchurHessFrom`, and
`chewi1311_infProjection_selfConcordantBarrierOn_of_schur_oracles`.  The next
proof should use the selector stationarity field and Schur Hessian from blocks
to prove or package the projected self-concordance/dual-gradient certificate.
The Schur-lift bridge packet adds `barrierInfProjectionSchurCorrection`,
`barrierInfProjectionSchurLift`, its first/second-coordinate simp lemmas,
`barrierInfProjectionSchurHessFrom_quadratic_nonneg_of_lift_eq`, and
`BarrierInfProjectionSelectorStationary.schurHessFrom_quadratic_nonneg_of_lift_eq`.
The Schur completed-square packet adds `barrierInfProjectionSchurLift_hess_fst`,
`barrierInfProjectionSchurLift_hess_snd_of_Hyy_right_inverse`,
`barrierInfProjectionSchurHessFrom_quadratic_eq_lift_of_Hyy_right_inverse`,
`BarrierInfProjectionSelectorStationary.schurHessFrom_quadratic_nonneg_of_Hyy_right_inverse`,
`BarrierInfProjectionSelectorStationary.schurMixedThirdSelfConcordantOn_of_Hyy_right_inverse`,
and `chewi1311_infProjection_selfConcordantBarrierOn_of_Hyy_right_inverse`.
Search-first result: the quadratic identity reuses mathlib
`WithLp.prod_inner_apply` and the local Schur block definitions; block symmetry
is not needed for Hessian nonnegativity once the `Hyy` right-inverse zeroes the
vertical Hessian component.  The next item-4 proof should attack the projected
mixed-third bound, projected inverse positivity, or projected dual-gradient
bound.  Do not redo the selector, projected-gradient, Schur block,
Schur-lift, or WithLp product-coordinate interfaces.
The projected-inverse gate packet adds
`BarrierInfProjectionSelectorStationary.projectedInvHess_quadratic_nonneg_of_Hyy_right_inverse`,
`barrierInfProjectionGrad_bound_of_quadratic_le`, and
`chewi1311_infProjection_selfConcordantBarrierOn_of_Hyy_projInv_right_inverse`.
The projected inverse positivity gate is now discharged from a right-inverse
identity for the Schur Hessian, and the projected dual-gradient gate is reduced
to the scalar energy estimate `<grad, projInvHess grad> <= nu`.  The next
item-4 proof should attack the projected mixed-third bound or construct the
Schur inverse right-inverse/scalar energy certificates; do not ask future runs
to directly supply projected inverse positivity or a raw dual-gradient bound.
The mixed-third lift packet adds
`barrierInfProjectionSchurLift_localNorm_eq_of_Hyy_right_inverse`,
`BarrierInfProjectionSelectorStationary.schurLift_localNorm_eq_of_Hyy_right_inverse`,
`BarrierInfProjectionSelectorStationary.schurMixedThird_bound_of_lift_third`,
`BarrierInfProjectionSelectorStationary.schurMixedThirdSelfConcordantOn_of_lift_third`,
and
`chewi1311_infProjection_selfConcordantBarrierOn_of_lift_third_projInv_right_inverse`.
The projected mixed-third gate is now reduced to the lifted third-derivative
identity
`projThird x u v = third (point x) (schurLift x u) (schurLift x v)`.  The
remaining item-4 gates are therefore the projected-third lift identity, the
Schur projected inverse/right-inverse construction, and the scalar projected
gradient energy certificate; do not route future runs through a raw projected
mixed-third bound.
The projected-full-inverse packet adds `withLpProdInl_fst_add_inr_snd`,
`barrierInfProjectionBlockXX_add_XY_eq_hess_fst`,
`barrierInfProjectionBlockYX_add_YY_eq_hess_snd`,
`barrierInfProjectionProjInvHessFromFullInv`,
`barrierInfProjectionSchurHessFrom_projInvHessFromFullInv_right_inverse`,
`BarrierInfProjectionSelectorStationary.projectedFullInv_gradient_quadratic_le`,
`chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_energy`,
and `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third`.
This removes the raw Schur projected-inverse/right-inverse and scalar
projected-gradient energy gates from the final item-4 wrapper: the projected
inverse is the horizontal part of the full inverse-Hessian, the Schur
right-inverse follows from the full Hessian right-inverse plus an `Hyy`
left-inverse, and the projected energy bound follows from the original barrier
gradient bound plus selector stationarity.  Outside the finite-dimensional
`Hyy` route below, that wrapper still exposes the lifted third-derivative
identity and two-sided `Hyy`/full-Hessian inverse identities.
The finite-dimensional `Hyy` inverse packet adds
`continuousLinearMap_left_inverse_of_right_inverse_finiteDim`,
`barrierInfProjectionBlockYY_left_inverse_of_right_inverse_finiteDim`,
`chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_energy_finiteDimHyy`,
and
`chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_finiteDimHyy`.
Search-first result: mathlib's
`LinearMap.injective_iff_surjective` discharges the left-inverse side from a
right-inverse identity for an endomorphism of a finite-dimensional space.  In
the finite-dimensional vertical-block setting, the final item-4 wrapper now
needs only the lifted third-derivative identity, `Hyy` right-invertibility, and
the full Hessian right-inverse; do not ask future runs to supply a separate
`Hyy` left-inverse in this finite-dimensional route.
The square-root inverse packet adds
`continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv` and
`chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_adjointSqrtCoord_finiteDimHyy`.
This reuses the existing adjoint-square model route from the sum/Newton
packets: source equalities `H = S†S` and `H⁻¹ = S⁻¹(S⁻¹)†` now derive both the
`Hyy` right-inverse and the full Hessian right-inverse for the
finite-dimensional inf-projection wrapper.  The active item-4 gates in this
route are now the lifted third-derivative identity plus concrete square-root
model equalities for the vertical block and full Hessian; do not route future
runs through raw inverse equations when the square-root model is available.
The canonical lifted-third packet adds `barrierInfProjectionSchurLiftedThird`,
`barrierInfProjectionSchurLiftedThird_apply`,
`BarrierInfProjectionSelectorStationary.schurMixedThirdSelfConcordantOn_liftedThird`,
and
`chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_liftedThird_adjointSqrtCoord_finiteDimHyy`.
The best finite-dimensional square-root route now fixes the projected
mixed-third oracle to `third (point x) (schurLift x u) (schurLift x v)`, so no
separate lifted-third equality hypothesis is needed.  The remaining exact
source work is the differentiability/envelope proof that this canonical oracle
is the actual third derivative of the inf-projection value function, plus
concrete square-root model equalities for the vertical block and full Hessian.
The adjoint-sqrt envelope certificate packet adds
`BarrierInfProjectionAdjointSqrtEnvelopeModel`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.selfConcordantBarrierOn`, and
`chewi1311_infProjection_selfConcordantBarrierOn_of_adjointSqrtEnvelopeModel`.
The source square-root constructor
`BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt` now lifts the
full-Hessian and inverse-Hessian adjoint-square equalities from the original
domain `s` to selected graph points using selector stationarity, so concrete
instances only need to keep the vertical `Hyy` square-root equalities on the
projected domain.
The direct source-domain Proposition 13.11 wrapper
`chewi1311_infProjection_selfConcordantBarrierOn_of_sourceFullSqrt` now
composes that constructor with the packaged Schur-envelope barrier theorem,
so concrete instances can prove the inf-projection `SelfConcordantBarrierOn`
conclusion without first materializing the model as a separate intermediate
artifact.
Future exact inf-projection work should construct this one certificate from a
selector/envelope differentiability theorem and concrete square-root models,
rather than restating the selector stationarity, original barrier, vertical
block square-root, and full Hessian square-root hypotheses at every theorem
call.
The first-order envelope packet adds `barrierInfProjectionPointFDeriv`,
`barrierInfProjectionPoint_hasFDerivAt`, `barrierInfProjectionValue`,
`barrierInfProjectionPointFDeriv_toDual_comp_of_vertical_grad_eq_zero`,
`barrierInfProjectionValue_hasGradientAt_of_vertical_grad_eq_zero`, and
`BarrierInfProjectionSelectorStationary.value_hasGradientAt`.  This proves the
source calculus fact that, when the selector is differentiable and the vertical
first-order condition holds, the selected value function has projected gradient
`barrierInfProjectionGrad`.  The next exact envelope step is the second
derivative/Schur-Hessian identity; reuse this first-order layer rather than
re-proving the chain rule or vertical cancellation.
The literal-infimum bridge packet adds `barrierInfProjectionFiberValues`,
`barrierInfProjectionInfValue`, `BarrierInfProjectionSelectorMinimizes`,
`BarrierInfProjectionSelectorMinimizes.value_eq_infValue`,
`BarrierInfProjectionSelectorMinimizes.infValue_eq_value`,
`BarrierInfProjectionSelectorMinimizes.of_vertical_firstOrder_zero`,
`BarrierInfProjectionSelectorStationary.infValue_hasGradientAt`, and
`BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt`.  It turns
the selected envelope into Chewi's source value `x ↦ inf_y f(x, y)` whenever
the selector minimizes every vertical fiber.  Search-first result: mathlib's
`IsLeast.csInf_eq` handles the `sInf` equality, and
`HasGradientAt.congr_of_eventuallyEq` transports the gradient theorem; the
selector-minimizer constructor reuses `FirstOrderStrongConvexOn.lower_model`
for the vertical fiber lower model, so zero vertical gradient proves the
fiber minimum.  Future item-4 source wrappers should carry/prove
`BarrierInfProjectionSelectorMinimizes` rather than silently identifying the
selected value with the literal infimum.
The local literal-infimum bridge packet adds
`BarrierInfProjectionSelectorMinimizesOn`,
`BarrierInfProjectionSelectorMinimizesOn.value_eq_infValue_of_mem`,
`BarrierInfProjectionSelectorMinimizesOn.infValue_eq_value_of_mem`,
`BarrierInfProjectionSelectorMinimizesOn.of_vertical_firstOrder_zero`,
`BarrierInfProjectionSelectorStationary.infValue_hasGradientAt_of_minimizesOn_mem_nhds`,
`BarrierInfProjectionSelectorStationary.infValue_hasGradientAt_of_minimizesOn_isOpen`,
`BarrierInfProjectionSelectorStationary.minimizesOn_of_vertical_firstOrder`,
`BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt_of_minimizesOn_mem_nhds`,
`BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt_of_minimizesOn_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.infValue_hasGradientAt_of_fullHessianDerivative_isOpen`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.infValue_hasGradientAt_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`.
This replaces the stronger global fiber-minimizer route with a projected-domain
open-neighborhood route: prove the vertical lower model only for
`x ∈ barrierInfProjectionSet s`, then use stationarity and `IsOpen.mem_nhds`
to transport the selected-envelope gradient to Chewi's literal `inf_y` value.
Search-first result: the proof reuses mathlib `IsLeast.csInf_eq`,
`HasGradientAt.congr_of_eventuallyEq`, `IsOpen.mem_nhds`, and the local
`FirstOrderStrongConvexOn.lower_model`; no direct mathlib inf-projection
envelope theorem was found.
The literal third-order source-package packet adds
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn` and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`.
This certificate simultaneously exposes the projected
`SelfConcordantBarrierOn`, the literal-infimum `HasGradientAt` theorem, the
projected-gradient Schur-Hessian derivative, and the Schur lifted-third
derivative certificate.  Future item-4 consumers should use this package
instead of independently threading `selfConcordantBarrierOn`,
`infValue_hasGradientAt`, `grad_hasFDerivAt`, and `schur_deriv`.  The remaining
exact blocker is now concrete: provide selector/envelope differentiability,
vertical lower-model data, full-Hessian derivative pairing, and square-root
models for a source instance.
The literal-package local-norm consumer packet adds
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius_of_hessianPositive`
and
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius`.
Given the literal package and strict positivity of the projected Schur Hessian,
these wrappers derive the Chewi Lemma 13.6-style source-radius local-norm
sandwich directly, including the zero-displacement case.  The next item-4
proof should therefore construct the concrete package and positivity data; it
should not reopen the mixed-third segment or local-norm sandwich machinery.
The follow-up wrapper
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius_of_adjointSqrtModel`
derives the required projected-Hessian positivity from the adjoint-square-root
model.  Thus a source instance only needs to provide the literal package and
the square-root/envelope model; do not manually thread projected positivity
unless no square-root model is available.
The source one-call wrapper
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`
packages this chain directly from vertical first-order, full-Hessian
derivative, selector, inverse-block derivative, and mixed-third pairing data.
Future exact item-4 work should target this theorem before adding any new
local-norm transport wrapper.
The second-order Schur-envelope packet adds
`barrierInfProjectionPointFDeriv_apply` and
`barrierInfProjectionGrad_hasFDerivAt_schur`.  If the original gradient has
Frechet derivative `hess` at the selected graph point and the selector
derivative satisfies the implicit equation
`D selector v = - Hyy^{-1} Hyx v`, then the projected gradient has derivative
`barrierInfProjectionSchurHessFrom`.
The adjoint-square-root model API now adds
`BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.secondOrderEnvelopeAt_of_sourceFirstSecond_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.hyy_right_inverse`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.hyy_left_inverse`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.full_right_inverse`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.grad_hasFDerivAt_schur_of_isOpen`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.secondOrderEnvelopeAt_of_isOpen`.
These lift full-space square-root equations from `s`, source first/second
differentiability data from `s`, discharge the `Hyy` inverse identities, the
selected full-Hessian right inverse, and the open-domain second-order envelope
directly from the packaged square-root model.  The next exact inf-projection
proof should consume these helpers before adding any new raw inverse,
selected-graph square-root, source first/second-order, or second-order wrapper.
The implicit-selector derivative packet adds
`barrierInfProjectionVerticalGrad_hasFDerivAt`,
`barrierInfProjection_verticalDerivative_eq_zero_of_eventually_eq_zero`,
`barrierInfProjection_selector_deriv_eq_neg_invHyy_of_vertical_eventuallyEq`,
and
`barrierInfProjectionGrad_hasFDerivAt_schur_of_vertical_eventuallyEq`.  It
derives the equation `D selector v = - Hyy^{-1} Hyx v` by differentiating the
vertical first-order residual when that residual is locally zero and `Hyy` has
a left inverse.  Search-first result: the proof reuses the local graph-map
derivative and Schur theorem plus mathlib `HasFDerivAt.comp`,
`HasFDerivAt.unique`, `hasFDerivAt_const`, `EventuallyEq`, and
`add_eq_zero_iff_eq_neg`; no new implicit-function primitive is needed for
this finite supplied-envelope layer.  The next exact envelope step is now the
actual third-derivative identity for the selected value/projected Hessian and
the construction of the packaged adjoint-square-root envelope certificate from
concrete models.

The local-stationarity source-shaping packet adds
`BarrierInfProjectionSelectorStationary.verticalGrad_eventually_eq_zero`,
`BarrierInfProjectionSelectorStationary.verticalGrad_eventually_eq_zero_of_isOpen`,
`BarrierInfProjectionSelectorStationary.selector_deriv_eq_neg_invHyy_of_mem_nhds`,
`BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_schur_of_mem_nhds`,
and `BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_schur_of_isOpen`.
These lemmas derive the raw `EventuallyEq` vertical-residual hypothesis from
the stationary selector plus neighborhood membership or an open projected
domain.  Future inf-projection work should reuse these source-facing bridges
instead of passing `barrierInfProjectionVerticalGrad =ᶠ[nhds x] 0` directly.

The newest source-derivative packet removes another repeated graph-restriction
obligation.  Reuse
`BarrierInfProjectionSelectorStationary.hasGradientAt_of_source` and
`BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_of_source` to lift
source-domain `∀ z ∈ s, HasGradientAt f (grad z) z` and
`∀ z ∈ s, HasFDerivAt grad (hess z) z` to selected graph points.  For
Proposition 13.11(4) source instances that need the reusable selected-value
third-order envelope before literal minimization, prefer
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_sourceFullHessianDerivative_isOpen`
or
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_sourceFirstSecondFullHessianDerivative_isOpen`.
When the literal `inf_y` package is also needed, prefer
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_sourceFirstSecondFullHessianDerivative_isOpen_of_verticalFirstOrder`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_sourceFirstSecondFullHessianDerivative_isOpen_of_verticalFirstOrder`
when first-, second-, and full-Hessian derivative data are all naturally proved
on the original barrier domain.  Do not ask future runs to manually restate
`hfgrad` or `hgrad` on `barrierInfProjectionPoint selector x` unless the source
model genuinely only has graph-local data.
For the shorter local-norm route, use
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_sourceSecondFullHessianDerivative_isOpen_direct`.
It needs no selected-value `f`, no `hfgrad`, and no vertical first-order
literal-infimum package; it only lifts source-domain `HasFDerivAt grad`,
source-domain full Hessian differentiability, and the source mixed-third
pairing before invoking the direct Schur local-norm consumer.  When the
selected-value third-order envelope is part of the source proof, use
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_sourceFirstSecondFullHessianDerivative_isOpen_envelope`.

The second-order envelope packet adds
`BarrierInfProjectionSecondOrderEnvelopeAt`,
`BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_mem_nhds`,
`BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_isOpen`,
`BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_mem_nhds_finiteDimHyy`,
and
`BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_isOpen_finiteDimHyy`.
It packages the first-order selected-value gradient identity together with the
Schur derivative of the projected gradient.  In the finite-dimensional
vertical-block route, callers now only need an `Hyy` right inverse; the needed
left inverse is derived internally.  The remaining exact inf-projection step is
therefore the actual third-derivative/lifted-third identity and concrete
construction of the square-root envelope model.

The Schur-third bridge packet adds
`BarrierInfProjectionSchurHessDerivativeOn`,
`BarrierInfProjectionSchurHessDerivativeOn.mono_projected`,
`BarrierInfProjectionSchurHessDerivativeOn.continuousOn`,
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate`,
and
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex`,
plus the derivative-continuity variant
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_deriv`
and the projected source-radius sandwich
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv`.
The scalar-segment packet adds
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_scalarPsi`,
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_segmentCertificate`,
and
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_scalarPsi`.
The continuity-on-domain follow-up adds
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_scalarPsi_continuousOn`
and
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_scalarPsi_continuousOn`,
so callers only need `ContinuousOn H_schur` on the projected domain rather
than a separate per-vector continuity proof for every segment quadratic form.
The newest vector-path packet adds
`hessianSegmentPsi_hasDerivAt_of_hasDerivAt_apply`,
`hessianSegmentPsi_hasDerivWithinAt_of_hasDerivWithinAt_apply`,
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_hessApplyDeriv`,
and
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv`.
The follow-up calculus extraction adds
`hessianSegmentHessApply_hasDerivAt_of_hasFDerivAt` and
`hessianSegmentHessApply_hasDerivWithinAt_of_hasFDerivAt`, so a full Frechet
derivative of the Schur Hessian can feed the applied-vector route directly
without reproving `clm_apply` segment calculus.
The newest Schur-certificate bridge adds
`BarrierInfProjectionSchurHessDerivativeOn.hessApply_hasDerivWithinAt` and
`BarrierInfProjectionSchurHessDerivativeOn.hessApply_mixed_inner_eq`, packaging
that feed-through for the actual `BarrierInfProjectionSchurHessDerivativeOn`
interface and identifying the paired derivative with the canonical lifted
third derivative.
The newest scalar-display bridge adds
`BarrierInfProjectionSchurHessDerivativeOn.hessianSegmentPsi_hasDerivWithinAt_liftedThird`,
so the source identity
`d/dt <v, H_schur(z_t) v> = liftedThird(z_t, y - x, v)` is now a named theorem
once the Schur derivative certificate is available.
The newest source-radius consumer adds
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply`,
so the preferred full-Schur-derivative route now passes through the
applied-vector scalar segment certificate and no longer exposes the older
strict projected-Hessian positivity or nonzero-displacement side conditions.
The newest Schur block-calculus packet adds the fixed extraction maps
`barrierInfProjectionBlockXXCLM`, `barrierInfProjectionBlockXYCLM`,
`barrierInfProjectionBlockYXCLM`, `barrierInfProjectionBlockYYCLM`, the four
derived block-derivative maps
`barrierInfProjectionBlockXXDeriv`,
`barrierInfProjectionBlockXYDeriv`,
`barrierInfProjectionBlockYXDeriv`, and
`barrierInfProjectionBlockYYDeriv`, plus the corresponding
`barrierInfProjectionBlock*_hasFDerivAt` lemmas.  It also adds
`barrierInfProjectionSchurHessDeriv`,
`barrierInfProjectionSchurHess_hasFDerivAt`,
`BarrierInfProjectionSchurHessDerivativeOn.of_blockDerivatives`, and
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative`.  Search
reuse: mathlib's `HasFDerivAt.comp`, `HasFDerivAt.clm_comp`,
`HasFDerivAt.sub`, and `ContinuousLinearMap.hasFDerivAt` are enough for this
layer; no separate Schur-complement differentiability primitive exists in
mathlib.  The next exact inf-projection gate should use the full-Hessian
derivative wrapper and focus only on the scalar mixed pairing identity
`inner v ((schurDeriv x u) v) = liftedThird x u v`.
The newest component-pairing packet adds
`barrierInfProjectionSchurHessDeriv_inner_eq_of_component_pairing` and
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_componentPairing`.
The scalar mixed pairing is now split into three concrete obligations:
cross-block pairing
`<v, Hxy Hyy⁻¹ w> = <Hyy⁻¹ Hyx v, w>`, inverse-derivative cancellation
`<v, Hxy (D Hyy⁻¹[u] Hyx v)> =
 -<Hyy⁻¹ Hyx v, D Hyy[u] (Hyy⁻¹ Hyx v)>`, and the four-term component
expansion of the full Hessian derivative on Schur lifts.  Future work should
prove these three obligations from Hessian symmetry, the differentiated
`Hyy * Hyy⁻¹ = I` identity, and the product-space third-derivative formula.
Thus the preferred exact source gate can now be proved by differentiating only
the applied Schur-Hessian vector path `t ↦ H_schur(z_t) v` and pairing the
result with `v`; a full operator-valued Schur derivative and even a direct
scalar-`ψ` derivative theorem are optional stronger routes.
This weakens the next exact source gate: future work may prove only the
source-shaped scalar segment derivative
`d/dt <v, H_schur(z_t) v> = liftedThird(z_t, y - x, v)` instead of first
constructing a full operator-valued Frechet derivative for `H_schur`.  The
stronger certificate remains available when convenient, but the local-norm
sandwich no longer needs strict projected-Hessian positivity or a separate
Schur-Hessian continuity proof once the scalar `ψ` derivative and segment
coefficient bound are supplied.  Do not rebuild the segment Gronwall,
canonical lifted-third self-concordance, or local-norm transport layers.

Current active lane: Chewi Proposition 13.11 barrier calculus in
`StatInference/Optimization/InteriorPoint.lean`.  Lemma 13.6, Theorem 13.8,
Definition 13.9, and the positive-orthant barrier packet are now substrate for
the calculus rules, not the live blocker.  Continue from the compiled product,
sum, sum component-Cauchy, adjoint-coordinate Cauchy reuse, and
affine-preimage/equivalence wrappers; the next aggressive choices are the
exact shared-domain sum inverse-Hessian/inverse-local gate, a
principled non-invertible affine-preimage/range interface, or the
inf-projection third-derivative/envelope-certificate construction.  For the
inf-projection route, do not re-prove block differentiability or raw Schur
product rules; instantiate
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative` and spend
the proof budget on the scalar mixed-third pairing and concrete square-root
models.  If taking the scalar route, call
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_componentPairing`
and prove its three component obligations instead of expanding the whole
Schur derivative directly.
The cross-block symmetry packet adds the new root-imported module
`StatInference/Optimization/SchurSymmetry.lean` with
`withLpProdInlCLM_inner`, `withLpProdInrCLM_inner`,
`inner_withLpProdInrCLM`, and
`barrierInfProjectionBlockXY_invHyy_pair_eq_of_hessian_symmetric`.  The first
of the three component obligations is now closed whenever the full
product-space Hessian is symmetric and `Hyy * Hyy⁻¹ = I`.  Search-first result:
mathlib's `LinearMap.IsSymmetric` plus `WithLp.prod_inner_apply` and the local
block definitions are enough; future runs should spend proof budget on the
remaining four-term lifted-third expansion, not on a supplied cross-block
pairing.
The inverse-derivative cancellation packet extends the same module with
`barrierInfProjectionBlockXY_invHyyDeriv_pair_eq_neg_of_hessian_symmetric`.
The second component obligation is now closed from the cross-block symmetry
bridge, an `Hyy` left inverse, and the differentiated inverse equation
`Hyy (D Hyy⁻¹[u] w) + D Hyy[u] (Hyy⁻¹ w) = 0`.  Future work should not
re-supply this scalar cancellation either.
The lifted-third component packet extends `SchurSymmetry.lean` with
`withLpProdInlSubInr_inner_map_sub_self`, the four
`barrierInfProjectionBlock*Deriv_apply` lemmas,
`barrierInfProjectionPointFDeriv_eq_schurLift_of_selector_deriv_eq`,
`barrierInfProjectionSchurLiftedThird_eq_component_expansion_of_pairing`, and
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_liftPairing`.
The raw four-term component-expansion gate is now closed by product-space
inner-product algebra once the graph derivative is the Schur lift and the full
Hessian derivative has the source-shaped lifted-third pairing.  The next
inf-projection source blocker is therefore the actual lifted-third/third-
derivative identity for the selected value, not the block component algebra.
The source-facing Schur derivative packet adds
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse`.
It composes the existing Schur symmetry/cancellation/component bridges, so a
future source proof only supplies the original product-space Hessian derivative,
Hessian symmetry, `Hyy` inverse identities, selector derivative equation,
differentiated inverse equation, and the standard full mixed-third identity.
Do not re-split those scalar obligations unless this combined constructor
is too strong for a concrete model.
The inverse-identity derivative packet adds
`barrierInfProjectionBlockYY_invHyy_deriv_cancel_of_eventually_right_inverse`
and
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse_eventually`.
It derives the differentiated inverse equation from the local/eventual
right-inverse identity `Hyy(y) (Hyy⁻¹(y) w) = w` via mathlib
`HasFDerivAt.clm_apply`.  Prefer this constructor whenever the concrete
selector model gives a local `Hyy` inverse, and do not pass a raw
`hderiv_cancel` field unless the local identity is unavailable.
The stationary-neighborhood packet adds
`barrierInfProjectionBlockYY_invHyy_eventually_right_inverse_of_mem_nhds`,
`BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds`,
and
`BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_isOpen`.
It derives the eventual `Hyy * Hyy⁻¹ = I` identity from projected-domain
neighborhood membership, and derives the selector derivative equation from the
stationary-selector certificate.  Future exact item-4 work should use selector
stationarity plus a projected-domain neighborhood/open-domain fact, not raw
`hdselector` or raw eventual inverse assumptions.
The finite-dimensional stationary follow-up adds
`BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy`
and
`BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy`.
It reuses `barrierInfProjectionBlockYY_left_inverse_of_right_inverse_finiteDim`
to derive the `Hyy` left-inverse side from the right-inverse side, so the
finite-dimensional vertical-block route should now pass only `Hyy * Hyy⁻¹ = I`.
The third-order envelope packaging follow-up adds
`BarrierInfProjectionThirdOrderEnvelopeOn`,
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy`,
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivative_mem_nhds`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen`.
It packages the selected-value first derivative, projected-gradient Schur
Hessian derivative, and Schur-Hessian lifted-third derivative in one reusable
source-facing object.  Search-first result: mathlib has the generic
`HasFDerivAt`/inner-product calculus, while the local `InteriorPoint` and
`SchurSymmetry` files supply the Chewi-specific Schur and segment bridges; no
direct mathlib inf-projection envelope-third theorem was found.  The next exact
item-4 step should construct the derivative inputs for this package from a
concrete selector/envelope theorem and then identify the canonical lifted
Schur oracle with the actual third derivative of the selected value.
The follow-up segment bridge adds
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projectedHessianSegmentMixedThirdLocalNormCertificate_of_fullHessianDerivative_isOpen`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen`.
It feeds the packaged adjoint-square envelope model plus source full-Hessian
derivative data directly into the projected Lemma 13.6 segment certificate and
source-radius local-norm sandwich, deriving the Schur derivative certificate
and `Hyy` right-inverse internally.  The next exact item-4 step should now
construct the concrete model derivative inputs and segment coefficient bound
against these wrappers, not reopen the Schur derivative/local-norm sandwich
proofs.
The source-radius shrink adds
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_hessianPositive`.
It removes the explicit segment-coefficient hypothesis from the packaged
adjoint-square route by reusing the existing Riccati source-radius proof
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv`.
The remaining source-radius local-norm gate is the standard strict projected
Hessian positivity on the projected domain plus `y - x ≠ 0`, not a manually
supplied segment coefficient bound.
The follow-up positivity shrink adds
`barrierInfProjectionSchurLift_ne_zero_of_ne`,
`barrierInfProjectionSchurHessFrom_quadratic_pos_of_fullHessian_pos`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projectedSchurHess_quadratic_pos`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_ne`.
Thus the adjoint-square envelope model now derives strict projected Hessian
positivity internally from the full Hessian factorization `H = S^* S` and the
Schur lift identity.  The remaining nontrivial source-radius side gate for
this wrapper is the distinct-point condition `y - x ≠ 0`.
The zero-displacement split is now closed by
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_sourceRadius`.
This wrapper handles `y = x` by simplification with `localNorm_zero` and uses
the strict-positivity route only for `y - x ≠ 0`.  The local-norm sandwich
gate is now reduced to concrete derivative inputs, convex projected-domain
membership, openness, and the scalar source-radius condition.
The third-order-envelope consumer is now also available as
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_thirdOrderEnvelope`.
It consumes an already-built `BarrierInfProjectionThirdOrderEnvelopeOn` and
uses the adjoint-square envelope model to supply the Schur positivity and
`Hyy` inverse identities internally.  The next exact item-4 source packet
should construct this third-order envelope from selector/envelope data; do not
route future work back through raw full-Hessian derivative inputs if the
third-order envelope certificate is available.
The Schur-certificate envelope adapter is now also available as
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn_isOpen`.
It constructs the selected-value second-order envelope from the open-domain
first/second derivative data and the adjoint-square `Hyy` right-inverse, then
packages any already-built `BarrierInfProjectionSchurHessDerivativeOn` into the
third-order envelope and source-radius local-norm sandwich.  The remaining
exact item-4 source work is therefore not local-norm transport or raw inverse
derivative plumbing; it is constructing the actual Schur derivative certificate
and lifted-third identity from the selector/envelope derivative hypotheses.
The scalar applied-Hessian adapter is now also available as
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv`.
It lets the adjoint-square model consume the narrower segment proof route:
continuity of `H_schur` on the projected domain, differentiability of
`t ↦ H_schur(x + t • (y - x)) v`, the scalar pairing identity with lifted
third, and the standard source-radius coefficient bound.  The next exact
packet can therefore attack the segment applied-Hessian derivative identity
directly instead of constructing the full operator-valued
`BarrierInfProjectionSchurHessDerivativeOn` first.
The scalar source-radius shrink is now also available through
`hessianSegmentLocalNorm_hasDerivWithinAt_of_psi`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_scalarPsi_sourceRadius`,
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius`.
This derives the Riccati/source-radius segment coefficient internally from the
scalar `ψ_{y-x}` derivative, strict projected Hessian positivity, and
self-concordance.  The next exact item-4 packet should provide the projected
Schur-Hessian continuity and applied-vector derivative/pairing identity; do
not ask for a separate `hsegment_coeff`.
The scalar-continuity shrink now adds
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_scalarPsi_sourceRadius_of_continuity`,
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity`.
This removes the operator-valued `ContinuousOn H_schur` gate from the scalar
source-radius route.  The exact source proof should now supply per-vector
`ψ_v` continuity, segment local-norm continuity, the segment applied-vector
derivative, and the lifted-third pairing identity directly.
The local-norm-continuity shrink now adds
`hessianSegmentLocalNorm_continuousOn_of_psi`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_scalarPsi_sourceRadius_of_psi_continuity`,
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_psi_continuity`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_psi_continuity`.
Thus the exact source route no longer needs a separate `hlocal_cont` input:
per-vector `ψ` continuity already gives the segment local-norm continuity by
`ContinuousOn.sqrt`.  The remaining source obligations are per-vector `ψ`
continuity, the segment applied-vector derivative, and the lifted-third pairing.
The applied-vector continuity shrink now adds
`hessianSegmentPsi_continuousOn_of_apply_continuousOn`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hessApplyDeriv_sourceRadius`,
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_apply_continuity`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_apply_continuity`.
This lets the exact source proof stay at the applied-vector path
`t ↦ H_schur(z_t) v`: continuity of that path gives `ψ_v` continuity, and its
derivative plus the lifted-third pairing supplies the scalar source-radius
local-norm sandwich.
The Schur-derivative applied-continuity packet now adds
`BarrierInfProjectionSchurHessDerivativeOn.hessApply_continuousOn`,
`BarrierInfProjectionSchurHessDerivativeOn.hessApply_continuousOn_of_convex`,
and
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply_sourceRadius`.
Thus a full `BarrierInfProjectionSchurHessDerivativeOn` certificate supplies
the applied-vector continuity, derivative, and lifted-third pairing needed by
the scalar source-radius route.  The live item-4 source work is now the actual
construction of the Schur derivative certificate or third-order envelope from
selector/envelope data, not another continuity/local-norm wrapper.
The adjoint-square direct Schur-consumer packet now adds
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_direct`,
and routes the third-order/open-domain compatibility wrappers through the
direct consumer.
The theorem-facing envelope consumer is now also available as
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_envelope`.
It builds the selected-value third-order envelope from the full-Hessian
derivative package and immediately consumes it for the source-radius
local-norm sandwich.
The newest envelope-constructor extraction adds
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds`,
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen`,
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds_finiteDimHyy`,
and
`BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_finiteDimHyy`.
These package a supplied Schur-Hessian derivative certificate into the
selected-value third-order envelope either from a supplied `Hyy` left inverse
or from the finite-dimensional `Hyy` right-inverse route, without requiring the
adjoint-square model.  The adjoint-square adapter now reuses the
finite-dimensional open-domain constructor.
Thus a packaged adjoint-square model plus a Schur derivative certificate
already gives the projected source-radius local-norm sandwich without
selected-value `f`, open-domain gradient, or second-order envelope assumptions.
Source full-Hessian derivative data can now build that Schur derivative
certificate and immediately use the direct consumer, avoiding the older
positivity/nonzero wrapper path when only local-norm transport is needed.
When selected-value envelope hypotheses are already in hand, use the
theorem-facing envelope consumer as the source endpoint.  When the next task is
only local-norm transport, use the shorter direct theorem.
The literal Schur-certificate route is now exposed as
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_of_verticalFirstOrder`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn_isOpen_of_verticalFirstOrder`.
Use these after proving an explicit
`BarrierInfProjectionSchurHessDerivativeOn` certificate: they build Chewi's
literal `inf_y` third-order package and the projected source-radius local-norm
sandwich directly from the Schur certificate, vertical first-order data,
open-domain gradient data, and the adjoint-square-root model.  This is the
preferred source route when the Schur derivative certificate has already been
constructed separately from lifted-third/source scalar identities.
The actual full-Hessian derivative source obligations are now packaged as
`BarrierInfProjectionFullHessianDerivativeOn`.  Reuse its consumers
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivativeOn_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_sourceFullHessianDerivative_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_fullHessianDerivativeOn_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivativeOn_isOpen_of_verticalFirstOrder`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivativeOn_isOpen_of_verticalFirstOrder`.
The live exact inf-projection blocker is now sharply named: prove this
full-Hessian derivative certificate, or prove a Schur derivative certificate
directly, then invoke the packaged literal/local-norm consumers.
If the concrete source model supplies Hessian differentiability on the
original barrier domain, use
`BarrierInfProjectionFullHessianDerivativeOn.of_source` instead of proving the
selected-graph certificate manually.  It converts
`∀ z ∈ s, HasFDerivAt hess ... z` plus the source mixed-third pairing into
the selected-graph certificate via `hmodel.selector_stationary.point_mem`.
If the immediate target is the Schur derivative certificate itself, call
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_sourceFullHessianDerivative_isOpen`
to consume source-domain `grad`, `hess`, `hessDeriv`, and mixed-third data
directly.  Then use
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_sourceFullHessianDerivative_isOpen_of_verticalFirstOrder`
or
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullHessianDerivative_isOpen_of_verticalFirstOrder`.
The theorem-facing source-square-root Schur certificate endpoint
`chewi1311_infProjection_schurHessDerivativeOn_of_sourceFullSqrtSecondFullHessianDerivative`
is now the shortest source-start route to this certificate: it combines
`BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt` with
source-domain `grad`/`hess` derivative data, the mixed-third pairing,
selector differentiability, and vertical inverse differentiability.  Use it
before choosing the literal-envelope or direct local-norm transport consumer.
If that Schur certificate is already built and the next target is only the
source-radius local-norm sandwich, use
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtSchurHessDerivativeOn`;
it reuses the source-square-root model to supply positivity and inverse
identities without restating derivative data.
If the next target is instead the reusable selected-value envelope or the
literal infimum package, use
`chewi1311_infProjection_thirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
or
`chewi1311_infProjection_literalThirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`.
These turn the same Schur certificate plus source first/second differentiability
and vertical first-order data into the envelope/literal package without
replaying full-Hessian derivative hypotheses.
For the full literal source-radius local-norm theorem in one call, use
`chewi1311_infProjection_literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`.
It combines the same Schur-certificate branch with vertical first-order data
and the local-norm transport target.
The theorem-facing source-square-root endpoints
`chewi1311_infProjection_thirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondFullHessianDerivative`,
`chewi1311_infProjection_literalThirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondFullHessianDerivative`
and
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondFullHessianDerivative`
now combine `BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt`
with source-domain first/second/full-Hessian derivative data.  Use these when
the concrete source instance already has the adjoint-square full-Hessian model
on `s`, the vertical `Hyy` square-root model on the projected domain, and the
source mixed-third identity.  Prefer the non-literal third-order endpoint when
the reusable `BarrierInfProjectionThirdOrderEnvelopeOn` certificate is needed
before vertical-minimizer/literal-infimum data is packaged.
When the source proof has vertical first-order lower models and needs the
literal local-norm theorem directly from full-Hessian derivative data, call
`chewi1311_infProjection_literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondFullHessianDerivative`.
Once that reusable third-order envelope certificate is already available,
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtThirdOrderEnvelope`
is the shortest local-norm consumer; it avoids re-threading first-, second-,
and full-Hessian derivative hypotheses.
When no selected-value/literal envelope data is needed, use the shorter direct
endpoint
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtSecondFullHessianDerivative_direct`.
It combines the same source full-square-root model with source `grad`/`hess`
derivative data and the mixed-third pairing, then routes through the direct
Schur local-norm consumer.

Compiled declarations to reuse include
`hessianSegmentPoint_hasDerivAt`,
`hessianSegmentPsi_hasDerivAt_of_hasFDerivAt`,
`hessianSegmentPsi_hasDerivWithinAt_of_hasFDerivAt`,
`hessianSegmentLocalNorm_hasDerivWithinAt_of_hasFDerivAt`,
`hessianSegmentMixedThirdPsiDeriv`,
`hessianSegmentLocalNorm_hasDerivWithinAt_of_mixedThird`,
`HessianSegmentMixedThirdCertificate`,
`HessianSegmentMixedThirdLocalNormCertificate`,
`MixedThirdSelfConcordantOn`,
`hessianSegmentLocalNorm_riccatiDerivBound_of_mixedThirdSelfConcordantOn`,
`hessianSegmentPoint_eq_lineMap`,
`hessianSegmentPoint_mem_of_convex`,
`hessianSegmentPoint_mem_of_convex_interior`,
`hessianSegmentPoint_continuous`,
`localNorm_pos_of_inner_pos`,
`hessianSegmentPsi_continuousOn_of_continuousOn`,
`hessianSegmentPsi_continuousOn_of_continuous`,
`hessianSegmentPsi_continuousOn_of_convex_continuousOn`,
`hessianSegmentLocalNorm_continuousOn_of_continuousOn`,
`hessianSegmentLocalNorm_continuousOn_of_convex_continuousOn`,
`hessianSegmentLocalNorm_pos_of_hessian_pos`,
`scalar_riccati_upper_bound_on_unit_interval`,
`hessianSegmentLocalNorm_le_of_riccati_bound`,
`hessianSegmentLocalNorm_le_of_riccati_bound_of_mul_lt`,
`hessianSegmentCoeffBound_of_localNorm_bound`,
`HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn`,
`HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn_of_hasFDerivAt`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius`,
the corresponding `.toHessianSegmentConcretePsiCertificate` and
`.toHessianSegmentExponentialBounds` bridges, and
`localNorm_sandwich_of_hessianSegmentMixedThirdCertificate` /
`localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate` /
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound` /
	`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound` /
	`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm` /
	`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive` /
	`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius` /
	`chewi136_localNorm_sandwich_sourceRadius`, plus the first Newton/Dikin
	consequence layer `localNorm_newtonStep_sub_eq_newtonDecrement_of_inner`,
	`newtonStep_mem_dikinEllipsoid_of_newtonDecrement_lt`,
	`newtonStep_mem_dikinEllipsoid_of_inner_of_newtonDecrement_lt`,
	`newtonStep_mem_dikinEllipsoid_inv_of_mul_newtonDecrement_lt`,
	`newtonStep_mem_dikinEllipsoid_inv_of_inner_of_mul_newtonDecrement_lt`, and
	`chewi136_newtonStep_localNorm_sandwich_sourceRadius`.  The newest
	Theorem 13.8 dual-transport packet adds
	`InverseHessianQuadraticBounds`,
	`dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticUpper`,
	`sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticLower`,
	`dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticBounds`,
	`sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticBounds`,
	`dualLocalNorm_le_div_one_sub_of_inverseHessianQuadraticUpper`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper`.  The
	newest Theorem 13.8 assembly packet adds
	`dualLocalNorm_le_mul_localNorm_of_quadratic_bound`,
	`chewi138_gradientResidual_dualLocalNorm_le_of_quadratic_bound`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_residualQuadraticBound`.
	The newest scalar Delta-coefficient packet adds
	`chewi138DeltaCoefficientPrimitive`,
	`chewi138DeltaCoefficientPrimitive_hasDerivAt`,
	`chewi138_deltaCoefficient_integral_eq`, and
	`chewi138_deltaCoefficient_integral_eq_mul`, formalizing the source
	calculation
	`int_0^1 ((1 - M * lambda * t)^(-2) - 1) dt =
	  M * lambda / (1 - M * lambda)`.  The newest integrated Delta-bound
	packet adds `chewi138_deltaCoefficient_intervalIntegrable` and
	`chewi138_integral_le_deltaCoefficient_mul`, which turn a pointwise
	coefficient-times-`B` residual bound on `[0,1]` into the closed coefficient
	`(M * lambda / (1 - M * lambda)) * B`.  The newest Delta source packet
	adds `hessianQuadraticUpper_of_localNorm_le_div`,
	`hessianQuadraticUpper_of_localNorm_le_div_one_sub`,
	`chewi138_hessianSegmentDelta_integral_le_of_hessianUpper`, and
	`chewi138_hessianSegmentDelta_integral_le_of_localNormUpper`, turning
	Lemma 13.6-style pointwise local-norm control along the segment into the
	integrated scalar Hessian-difference bound used in the proof of Theorem
	13.8.  The newest Delta-operator residual packet adds
	`HessianDeltaQuadraticBound`,
	`dualLocalNorm_delta_le_of_hessianDeltaQuadraticBound`,
	`chewi138_gradientResidual_dualLocalNorm_le_of_deltaQuadraticBound`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_deltaQuadraticBound`,
	so the final decrement wrapper now takes the source decomposition
	`grad x+ = Delta (x+ - x)` plus a Delta operator quadratic bound instead
	of a raw residual quadratic-form hypothesis.  The newest gradient-residual
	FTC packet adds `hessianSegmentGradient_hasDerivAt_of_hasFDerivAt`,
	`hessianSegmentGradient_integral_eq_sub_of_hasFDerivAt`, and
	`chewi138_gradientResidual_eq_deltaStep_of_integral_delta`, discharging
	the source identity `grad x+ = Delta (x+ - x)` from the gradient FTC along
	the Newton segment, a supplied Delta action formula, and Newton's linear
	equation.  The newest concrete Delta-action packet adds
	`hessianSegmentDelta`,
	`hessianSegmentHessian_intervalIntegrable_of_continuousOn`,
	`hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn`,
	`hessianSegmentDelta_apply`,
	`chewi138_gradientResidual_eq_hessianSegmentDelta_step`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaQuadraticBound`.
	This removes the supplied Delta action formula from the residual route.  The
	newest concrete Delta scalar/order packet adds
	`hessianSegmentDelta_inner_eq_integral_sub_of_continuousOn`,
	`hessianSegmentDelta_inner_le_of_localNormUpper`,
	`hessianSegmentDelta_quadraticBound_of_localNormUpper_and_dualEnergy`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaEnergy`.
	It converts the scalar integrated Hessian-difference estimate into the
	`HessianDeltaQuadraticBound` input, leaving only the explicit
	dual-energy/order comparison as the remaining Delta-operator source
	obligation.  The newest normalized-operator packet adds
	`hessianDeltaQuadraticBound_of_normalizedOperator`,
	`hessianSegmentDelta_quadraticBound_of_normalizedOperator`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta`.
	This matches the textbook line
	`||H(x)^(-1/2) Delta H(x)^(-1/2)||_op <= M * lambda / (1 - M * lambda)`
	and makes the square-root factorization plus normalized operator-norm bound
	the preferred next Delta route.  The newest normalized squared-bound packet
	adds `continuousLinearMap_opNorm_le_of_norm_sq_le`,
	`hessianDeltaQuadraticBound_of_normalizedSquaredBound`,
	`hessianSegmentDelta_quadraticBound_of_normalizedSquaredBound`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSquaredConcreteDelta`.
	This lets the next proof use the pointwise squared normalized estimate
	directly before packaging it as an op-norm bound.  The newest normalized
	unit-bilinear packet adds
	`continuousLinearMap_opNorm_le_of_unit_inner_le`,
	`hessianDeltaQuadraticBound_of_normalizedUnitInnerBound`,
	`hessianSegmentDelta_quadraticBound_of_normalizedUnitInnerBound`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedUnitInnerConcreteDelta`.
	This reuses mathlib's `ContinuousLinearMap.opNorm_le_of_re_inner_le` so a
	unit bilinear normalized Hessian-difference estimate can feed the same
	Theorem 13.8 decrement wrapper without redoing operator-norm foundations.
	The newest normalized symmetric-quadratic packet adds
	`continuousLinearMap_opNorm_le_of_isSymmetric_abs_inner_le`,
	`hessianDeltaQuadraticBound_of_normalizedSymmetricQuadraticBound`,
	`hessianSegmentDelta_quadraticBound_of_normalizedSymmetricQuadraticBound`,
	and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSymmetricQuadraticConcreteDelta`.
	This reuses mathlib's
	`ContinuousLinearMap.norm_eq_iSup_rayleighQuotient` so a self-adjoint
	normalized Hessian-difference operator plus the source-style absolute
	quadratic-form estimate `|<A z,z>| <= coeff * ||z||^2` feeds the same
	Theorem 13.8 decrement wrapper.
	The newest concrete Delta symmetry packet adds
	`hessianSegmentHessian_intervalIntegral_isSymmetric_of_continuousOn` and
	`hessianSegmentDelta_isSymmetric_of_continuousOn`, using
	`ContinuousLinearMap.intervalIntegral_apply`,
	`ContinuousLinearMap.intervalIntegral_comp_comm`,
	`innerSL_apply_apply`, `real_inner_comm`, and `LinearMap.IsSymmetric.sub`.
	Thus the unnormalized integrated Hessian-difference operator is now proved
	self-adjoint from pointwise Hessian symmetry along the segment; the remaining
	Rayleigh-route work is the square-root coordinate factorization and
	normalized absolute quadratic-form estimate.
	The newest normalized adjoint-conjugation packet adds
	`continuousLinearMap_adjointConj_isSymmetric_of_isSymmetric`,
	`hessianSegmentDelta_adjointConj_isSymmetric_of_continuousOn`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedAdjointConjSymmetricQuadraticConcreteDelta`.
	This reuses mathlib's `IsSelfAdjoint.adjoint_conj` to carry concrete Delta
	symmetry through a coordinate map `coord`, so future source work can provide
	`normalized = coord† Delta coord` plus the absolute quadratic-form bound
	instead of a separate normalized self-adjointness assumption.
	The newest coordinate-factorization packet adds
	`hessianDeltaDualFactor_of_adjointCoord`,
	`hessianPrimalFactor_of_adjointSqrt`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta`.
	It derives the Theorem 13.8 `hdual_factor` from
	`normalized = coord† Delta coord`, `coord (sqrtH step) = step`, and the
	dual quadratic factor
	`<v, invHess(x)v> = ||coord† v||^2`, and derives `hhess_factor` from
	`hess x = sqrtH† sqrtH` using
	`ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right`.
	The newest local-norm-to-Rayleigh packet adds
	`hessianQuadraticLower_of_mul_le_localNorm`,
	`hessianQuadraticLower_of_mul_one_sub_localNorm_le`,
	`chewi138_hessianSegmentDelta_integral_neg_le_of_hessianLower`,
	`chewi138_hessianSegmentDelta_integral_neg_le_of_localNormLower`,
	`hessianSegmentDelta_inner_neg_le_of_localNormLower`,
	`hessianSegmentDelta_abs_inner_le_of_localNormSandwich`,
	`adjointConj_inner_eq_delta_inner`,
	`normalizedAdjointConj_absQuadBound_of_deltaAbsQuadBound`, and
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_localNormSandwich`.
	This proves the source Rayleigh route from the two-sided Lemma 13.6
	local-norm sandwich: local lower control gives the negative Delta scalar
	bound, local upper control gives the positive Delta scalar bound, the two
	sides give `|<Delta w,w>|`, and `normalized = coord† Delta coord` plus
	`sqrtH coord = id` transports it to
	`|<normalized z,z>| <= coeff * ||z||^2`.
	The newest Newton-segment sandwich packet adds
	`localNorm_smul_of_nonneg`, `hessianSegmentPoint_sub_left`, and
	`chewi138_newtonSegment_localNorm_sandwich_sourceRadius`.  It proves the
	pointwise source assumptions
	`(1 - M * lambda * t) * ||w||_x <= ||w||_{z_t}` and
	`||w||_{z_t} <= ||w||_x / (1 - M * lambda * t)` for
	`z_t = (1-t)x + t x+` from the compiled Lemma 13.6 source-radius theorem,
	the segment identity `z_t - x = t • (x+ - x)`, and
	`||t • v||_x = t * ||v||_x` for `0 <= t`.
	The newest source-Newton-segment assembly packet adds
	`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`.
	This feeds the compiled pointwise `z_t` sandwich into the local-norm-to-
	Rayleigh 13.8 wrapper, deriving the segment membership and Hessian
	nonnegativity hypotheses from convexity plus `MixedThirdSelfConcordantOn`.
	The newest dual-transport packet adds
	`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div`,
	`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div_one_sub`, and
	`chewi138_newtonDecrement_step_le_of_dualLocalNormUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`.
	This shifts the remaining inverse-Hessian transport obligation from a raw
	quadratic-form upper bound to the Chewi Lemma 13.6 source shape
	`||v||^*_{x+} <= ||v||^*_x / (1 - M * lambda)`.
	The newest duality packet adds
	`dualLocalNorm_le_div_of_localNorm_lower_and_inverseIdentity`,
	`dualLocalNorm_le_div_one_sub_of_localNorm_lower_and_inverseIdentity`, and
	`chewi138_newtonDecrement_step_le_of_primalLowerDualIdentity_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`.
	This derives the dual-local-norm transport from the compiled Lemma 13.6
	primal lower sandwich plus supplied Cauchy and inverse-local identities, so
	callers no longer need to provide the dual transport comparison directly.
	The newest Cauchy packet adds
	`dualPrimalCauchy_of_adjointCoordSqrt` and
	`chewi138_newtonDecrement_step_le_of_inverseLocal_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`.
	This derives the Cauchy bridge `<v,w> <= ||v||^*_x ||w||_x` from the same
	`coord`/`sqrtH` factorization already used by the normalized Rayleigh line.
	The newest right-inverse packet adds
	`inverseHessianQuadratic_nonneg_of_hessian_right_inverse`,
	`localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse`,
	`inverseHessianQuadratic_nonneg_of_adjointCoordFactor`, and
	`chewi138_newtonDecrement_step_le_of_hessianRightInverse_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`.
	This derives inverse-Hessian nonnegativity and the inverse-local identity
	from the concrete equation `hess(x+) (invHess(x+) v) = v`.
	The newest right-inverse-at-`x` packet adds
	`localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse` and
	`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`.
	This derives the Definition 13.7 Newton-decrement norm identity from
	`hess(x) (invHess(x) v) = v`, so callers no longer need to supply
	`||x+ - x||_x = lambda_f(x)` separately.
	The newest zero-step packet adds
	`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment_or_zero`.
	This handles the case `x+ = x` directly from Newton's linear equation, so
	the source-facing 13.8 wrapper no longer needs a nonzero-step assumption.
	The newest continuous-equivalence coordinate packet adds
	`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_continuousLinearEquivCoord_of_sourceNewtonSegment`.
	This derives the inverse coordinate equations from a single
	`sqrtCoord : E ≃L[ℝ] E`, with `sqrtH = sqrtCoord.toContinuousLinearMap`
	and `coord = sqrtCoord.symm.toContinuousLinearMap`.
	The newest adjoint/square-root packet adds
	`inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse`
	and
	`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_adjointSqrtCoord_of_sourceNewtonSegment`.
	This derives `<v, invHess(x)v> = ||coord†v||^2` from
	`hess x = sqrtH†sqrtH`, `hess(x)(invHess(x)v)=v`, and the coordinate
	equivalence.
	The newest right-inverse-on packet adds
	`chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoord_of_sourceNewtonSegment`,
	replacing the two pointwise inverse-Hessian equations at `x` and `x+` by
	one feasible-set hypothesis
	`∀ z ∈ s, ∀ v, hess z (invHess z v) = v`.
	It also adds
	`chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoordDelta_of_sourceNewtonSegment`,
	where the normalized Delta operator is chosen definitionally as
	`coord† Delta coord`; use this stronger wrapper when no external
	`normalized` operator needs to be named.
	The newest concrete square-root-family packet adds
	`hessianSymmetric_of_adjointSqrt`,
	`hessianQuadratic_pos_of_adjointSqrtCoord`,
	`hessianRightInverse_of_adjointSqrtCoord_invHess`, and
	`chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment`.
	This derives Hessian symmetry, positive definiteness, and the on-set
	inverse-Hessian right-inverse identity from the source model
	`hess z = S_z† S_z` and `invHess z = S_z^{-1}(S_z^{-1})†`.
	The newest one-dimensional barrier model packet adds `realScaleCLM`,
	`realScaleCLE`, their adjoint/comp/inverse-map lemmas, plus
	`negLogHessCLM`, `negLogInvHessCLM`, `negLogSqrtCoord`, and the compiled
	positive-domain/Ioi square-root model theorems
	`negLogHessCLM_sqrtCoord_model_Ioi` and
	`negLogInvHessCLM_sqrtCoord_model_Ioi` for Chewi Examples 13.4/13.10.
	The newest logarithmic-barrier parameter packet adds
	`negLogBarrier_deriv_sq_div_second_eq_one` and
	`negLogBarrier_dualLocalNorm_deriv_eq_one`, formalizing the source
	Example 13.10 calculation `f'(x)^2 / f''(x) = 1` and its Definition 13.7
	dual-local-norm form for `f(x) = -log x` on `x > 0`.
	The newest finite-product barrier packet adds `positiveOrthant`,
	`positiveOrthantNegLogBarrier`, `positiveOrthantNegLogGrad`,
	`positiveOrthantNegLogInvHessCLM`, and
	`positiveOrthantNegLog_dualLocalNorm_grad_eq_sqrt_card`, proving the
	exact positive-orthant product barrier identity `||grad f(x)||_x^* =
	sqrt d` for the coordinatewise sum of `-log`, i.e. barrier parameter `d`.
	The newest positive-orthant square-root model packet adds
	`positiveOrthantNegLogHessCLM`,
	`positiveOrthantNegLogSqrtCoordOfMem`,
	`positiveOrthantNegLogSqrtCoord`,
	`positiveOrthantNegLogSqrtCoord_adjoint_eq_self_of_mem`,
	`positiveOrthantNegLogSqrtCoord_symm_adjoint_eq_self_of_mem`,
	`positiveOrthantNegLogHessCLM_sqrtCoord_model`,
	`positiveOrthantNegLogInvHessCLM_sqrtCoord_model`, and the corresponding
	`_positiveOrthant` source-shaped wrappers.  These compile the diagonal
	finite-product model equalities `hess = S† S` and
	`invHess = S^{-1}(S^{-1})†` needed by the generic Theorem 13.8
	square-root-family wrapper.
	The newest positive-orthant 13.8 specialization packet adds
	`convex_positiveOrthant` and
	`chewi138_positiveOrthant_newtonDecrement_step_le_of_sourceNewtonSegment`.
	This source-facing wrapper fixes the Hessian/inverse-Hessian/square-root
	model to the finite positive-orthant log barrier while leaving the gradient
	oracle generic, so it can cover central-path objectives whose Hessian is
	the barrier Hessian.
	The newest positive-orthant mixed-third preparation packet adds
	`positiveOrthantNegLogThirdMixed`,
	`positiveOrthantNegLogHessCLM_quadratic_eq_sum`,
	`positiveOrthantNegLogHessCLM_quadratic_nonneg`,
	`positiveOrthantNegLog_localNorm_sq_eq_sum`,
	`positiveOrthantSquareVec`, `positiveOrthantSquareVec_norm_le_norm_sq`,
	`positiveOrthantNegLog_localNorm_eq_sqrtCoord_norm`,
	`positiveOrthantNegLogThirdMixed_eq_neg_two_inner_sqrt_squareVec`,
	`positiveOrthantNegLog_mixedThird_bound`, and
	`positiveOrthantNegLog_mixedThirdSelfConcordantOn`.  The concrete
	positive-orthant product barrier now has the full
	`MixedThirdSelfConcordantOn ... 1` certificate; do not keep asking future
	runs to prove the finite weighted Cauchy mixed-third inequality.

Next theorem-sized target: discharge the remaining source hypotheses for the
new source-Newton-segment 13.8 wrapper.  The pointwise Newton-segment
local-norm sandwich and its integration into the Rayleigh decrement wrapper
are now compiled, and the concrete square-root family wrapper now discharges
Hessian positive definiteness, symmetry, the inverse-Hessian right-inverse
identity, the Definition 13.7 norm identity, inverse-local identity, and the
normalized Delta bookkeeping from the model equalities.  The one-dimensional
`-log` barrier model is now instantiated on `Set.Ioi 0`, including the exact
1-self-concordant-barrier parameter identity in dual-local-norm form, and the
finite positive-orthant product now has the exact barrier parameter `d` plus
compiled diagonal Hessian/inverse-Hessian square-root model equalities and a
source-facing Theorem 13.8 positive-orthant wrapper.  The newest wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment`
supplies the compiled certificate
`positiveOrthantNegLog_mixedThirdSelfConcordantOn`, fixes `M = 1` and
`thirdMixed = positiveOrthantNegLogThirdMixed`, and leaves only the
Hessian/gradient differentiability plus Newton-linearization source hypotheses.
The newest Hessian-derivative packet adds
`positiveOrthantNegLogHessDerivCLM`,
`positiveOrthantNegLogHessDerivCLM_mixed_inner`, and
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_sourceNewtonSegment`,
so callers no longer need to supply the mixed-third identity separately.
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_hasFDeriv_sourceNewtonSegment`
also derives Hessian continuity from the supplied `HasFDerivAt` Hessian proof.
The newest concrete-Hessian packet adds `positiveOrthantDiagonalCLM`,
`positiveOrthantNegLogHessCoeff`,
`positiveOrthantNegLogHessCoeffDerivCLM`,
`positiveOrthantNegLogHessCoeff_hasFDerivAt`,
`positiveOrthantNegLogHessCLM_hasFDerivAt`, and
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment_finalHessian`.
It uses the searched mathlib APIs `hasStrictDerivAt_zpow`,
`hasStrictFDerivAt_euclidean`, `PiLp.hasStrictFDerivAt_apply`, and
`ContinuousLinearMap.toSpanSingleton` rather than inventing new calculus
infrastructure.  The newest concrete-gradient/Newton packet adds
`positiveOrthantNegLogGrad_hasFDerivAt`,
`positiveOrthantNegLog_newtonStep_mem`,
`positiveOrthantNegLog_newton_linear`, and
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier`, so the finite
positive-orthant log-barrier Theorem 13.8 wrapper now has only the source
feasibility hypothesis `x ∈ positiveOrthant` and the radius condition
`newtonDecrement positiveOrthantNegLogGrad positiveOrthantNegLogInvHessCLM x < 1`.
The newest Definition 13.9 packet adds `SelfConcordantBarrierOn`,
`SelfConcordantBarrierOn.of_le_parameter`, and
`positiveOrthantNegLog_selfConcordantBarrierOn`, packaging the finite
positive-orthant logarithmic barrier as a `d`-self-concordant barrier from the
compiled mixed-third certificate and exact dual-local-norm identity.
The newest scalar/Example 13.14 packet adds `negLogBarrierGrad`,
`negLogBarrierThirdMixed`, `negLogBarrier_localNorm_eq_oneDimLocalNorm`,
`negLogBarrier_localNorm_eq_abs_div'`, `negLogHessCLM_quadratic_nonneg`,
`negLogInvHessCLM_quadratic_nonneg`, `negLogBarrier_mixedThird_bound`,
`negLogBarrier_mixedThirdSelfConcordantOn_Ioi`, and
`negLogBarrier_selfConcordantBarrierOn_Ioi`, so the one-dimensional `-log`
barrier is now available in the same supplied-oracle `SelfConcordantBarrierOn`
interface.  It also adds
`chewi1314_affineNegLog_selfConcordantBarrierOn_of_rightInverse` and
`chewi1314_affineNegLog_selfConcordantBarrierOn_of_surjective`, which turn a
scalar affine preimage of `ℝ_{>0}` into a `1`-self-concordant barrier for the
single-halfspace logarithmic barrier.  The newest row-slack packet adds
`halfspaceSlackCLM`, `halfspaceSlackSet`,
`mem_barrierAffinePreimageSet_halfspaceSlackCLM_iff`,
`halfspaceSlackRightInverse`, `halfspaceSlackCLM_rightInverse`, and
`chewi1314_halfspaceSlackNegLog_selfConcordantBarrierOn`, giving the exact
source row form `x ↦ -log (b - inner a x)` for nonzero rows.  The newest
vector-slack packet adds `polytopeSlackCLM`, `polytopeSlackSet`,
`polytopeSlackCLM_apply`, `polytopeSlackCLM_add_offset_apply`,
`mem_polytopeSlackSet_iff_forall_halfspaceSlackSet`,
`polytopeSlackSet_eq_iInter_halfspaceSlackSet`, `polytopeSlackTailOffset`,
`polytopeSlackTailOffset_apply`, `polytopeSlackSet_succ_eq_barrierInterSet`,
`mem_barrierAffinePreimageSet_polytopeSlackCLM_iff`,
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_of_rightInverse`, and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_of_surjective`, pulling
the finite positive-orthant log barrier back to the source domain
`∀ i, 0 < b i - inner (a i) x` whenever the slack map has a supplied right
inverse or is surjective.  The newest range-slice packet adds
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated`, so the
source-level surjectivity/right-inverse front door is gone once an inverse-
Hessian oracle on `(polytopeSlackCLM a).range` is supplied with nonnegativity
and the barrier-gradient bound.  The newest quadratic-bound packet adds
`dualLocalNorm_le_sqrt_of_inner_le` and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated_of_gradient_quadratic`,
so future work can prove the concrete range-gradient energy inequality
`inner grad (invHessRange grad) <= m` instead of manipulating the dual norm
and square root directly.  The newest range-right-inverse packet adds
`barrierAffineRangeHess_quadratic_nonneg` and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated_of_hessianRightInverse_and_gradient_quadratic`,
so the translated-range route no longer needs inverse-Hessian nonnegativity as
an oracle once `invHessRange` is proved to be a right inverse of the range
Hessian.  The newest positive-orthant base-identity packet adds
`positiveOrthantNegLogHessCLM_invHess_right_inverse` and
`positiveOrthantNegLog_gradient_invHess_inner_eq_card`, giving the exact
full-space Hessian inverse identity and gradient energy for the orthant model.
The newest affine-gradient energy packet adds
`barrierAffinePreimageGradientInvHessRightInverse_quadratic_eq`,
`chewi1314_polytopeSlackNegLog_gradient_invHessRightInverse_inner_eq_card`,
and `chewi1314_polytopeSlackNegLog_gradient_invHessSurjective_inner_eq_card`,
so full-row-rank/surjective slack-map pullbacks inherit the exact orthant
gradient energy `(m : ℝ)`.
The newest affine pulled-gradient right-inverse packet adds
`barrierAffinePreimageRightInverse_adjoint`,
`barrierAffinePreimageHess_invHessRightInverse_adjoint`,
`barrierAffinePreimageHess_invHessRightInverse_grad`,
`chewi1314_polytopeSlackNegLog_hess_invHessRightInverse_grad`, and
`chewi1314_polytopeSlackNegLog_hess_invHessSurjective_grad`.  Thus
full-row-rank/surjective slack-map pullbacks now have both the exact gradient
energy and the Hessian right-inverse identity on the pulled barrier gradient;
future work should feed these facts into the range/oracle barrier wrapper
instead of asking for a false global inverse on rank-deficient pullbacks.
The newest range-slice inverse packet closes the concrete fully general
finite-row oracle route.  It adds
`dualLocalNorm_le_sqrt_of_cauchy_and_hessian_right_inverse`,
`continuousLinearMap_range_eq_top_of_quadratic_pos`,
`barrierAffineRangeInvHessOfPos`,
`positiveOrthantNegLogHessCLM_quadratic_pos`,
`chewi1314_polytopeSlackNegLog_rangeInvHess`,
`chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse`,
`chewi1314_polytopeSlackNegLog_range_componentCauchy`, and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeInvHess`.
Thus Example 13.14's finite-row logarithmic barrier now compiles for arbitrary
row families, without a surjectivity/full-row-rank hypothesis: the
finite-dimensional range Hessian is inverted on its range slice using
positive definiteness, and the gradient bound is obtained from the
positive-orthant Cauchy bridge plus the Hessian right-inverse identity.
Future work should now package/report Example 13.14 or use it downstream; do
not reopen the old range oracle construction unless a cleaner exported
interface is needed.
The row-decomposition alternative remains available through the compiled
finite sum-rule packets together with the row-decomposition and head/tail
induction lemmas above.  The newest induction
packet adds
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum` and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum_gradient_quadratic`,
so a nonzero head row plus a recursively supplied tail barrier now combine via
the binary sum rule.  The newest square-root-coordinate consumer
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_adjointSqrtCoord`
further reduces the same induction step to the standard summed Hessian and
component Hessian adjoint-square models.  The newest semidefinite-friendly
packet adds `barrierAffinePreimageCauchy_rightInverse`,
`negLogBarrier_cauchy_Ioi`, `chewi1314_halfspaceSlackNegLog_componentCauchy`,
and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy`;
for arbitrary ambient halfspaces, prefer this component-Cauchy induction route
over full-space square-root equivalence assumptions, since single halfspace
Hessians are rank-deficient in general.  The newest vector-slack Cauchy packet
adds `positiveOrthantNegLog_componentCauchy`,
`chewi1314_polytopeSlackNegLog_componentCauchy_of_rightInverse`, and
`chewi1314_polytopeSlackNegLog_componentCauchy_of_surjective`, so full-row-rank
finite slack systems can now provide the recursive tail Cauchy bridge directly
from the positive-orthant product barrier and affine right-inverse transport.
The newest tail-induction consumer packet adds
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy`
and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy`;
for a nonzero head row and a full-row-rank/surjective tail slack map, these
wrappers discharge both the recursive tail barrier and the recursive tail
Cauchy bridge from the existing vector-slack right-inverse/surjective APIs.
The remaining hypotheses in that source-shaped route are only the summed
inverse-Hessian nonnegativity and inverse-local identity for the head-plus-tail
barrier Hessian.
The newest sum-right-inverse packet adds
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy_of_sumRightInverse`,
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy_of_sumRightInverse`,
and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy_of_sumRightInverse`,
reusing `barrierSum_invHess_nonneg_and_invLocal_of_right_inverse_on`.  For
full-row-rank/surjective tail slack maps, the remaining source-shaped induction
gate is now a single identity:
`barrierSumHess headHess tailHess x (sumInvHess x v) = v`.
The newest summed-square-root correction adds
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy_of_sumAdjointSqrtCoord`,
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy_of_sumAdjointSqrtCoord`,
and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy_of_sumAdjointSqrtCoord`.
These derive the single summed Hessian right-inverse from
`H_sum = S†S` and `H_sum^{-1} = S^{-1}(S^{-1})†`, while keeping the
rank-deficient head halfspace on the component-Cauchy route.  Proof-route
warning: do not try to instantiate full-space adjoint-square equivalences for
individual halfspace Hessians in arbitrary ambient dimension; the single-row
head Hessian is generally degenerate.
Do not redo scalar
self-concordance, affine right-inverse algebra, or binary sum inverse-local /
Cauchy algebra.
Do not redo the
square-root/right-inverse/Hessian-nonnegativity/self-concordance/model-Hessian
plumbing; use
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier`.
The Definition 13.7 norm identity,
inverse-local identity, Cauchy bridge, dual-local-norm transport, and raw
inverse-Hessian quadratic upper comparison should be obtained only via the
compiled right-inverse, square-root/Cauchy, duality, and reverse-algebra
bridges, not reproved at each theorem wrapper.  Do not reintroduce a global
`x+ - x != 0` requirement at the source-facing layer; use the compiled
zero-step split wrapper.  Do not ask separately for `coord sqrtH = id` and
`sqrtH coord = id` when a single continuous linear equivalence can supply
both; use the compiled `ContinuousLinearEquiv` coordinate wrapper.
The exact blockers are:

- connect the real third Frechet derivative or `iteratedFDeriv` representation
  to `MixedThirdSelfConcordantOn.mixed_third_bound` when removing the supplied
  mixed-third source interface.  Positivity of `||y - x||_{z_s}` is already
  packaged from a source-shaped positive-definite Hessian hypothesis and
  `y - x ≠ 0`; do not add more generic Gronwall/`ψ` plumbing.
- continue Proposition 13.11 from the already-compiled product, shared-domain
  sum, and affine-preimage supplied-oracle layers.  The next aggressive
  targets are either constructing the concrete positive-orthant range-slice
  inverse-Hessian oracle, proving its range Hessian right-inverse identity, and
  proving the range-gradient quadratic energy bound
  for arbitrary finite row families, closing the exact shared-domain sum
  inverse-Hessian / inverse-local gate for finite row sums using
  `polytopeSlackSet_eq_iInter_halfspaceSlackSet` and
  `polytopeSlackSet_succ_eq_barrierInterSet` plus the compiled
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum`
  and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_adjointSqrtCoord`
  wrappers; for the arbitrary-halfspace induction route, use the compiled
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy`
  wrapper and prove only the summed inverse-Hessian nonnegativity /
  inverse-local identity plus the recursive tail Cauchy bridge.  When the
  tail slack map has a supplied right inverse or is surjective, discharge that
  whole recursive tail package with
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy`
  or
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy`,
  leaving only the summed inverse-Hessian nonnegativity/inverse-local gate.
  Prefer the newer `_of_sumRightInverse` wrappers when a candidate
  `sumInvHess` is available; then prove only the single summed Hessian
  right-inverse identity
  `barrierSumHess headHess tailHess x (sumInvHess x v) = v`.
  The remaining alternative is opening the inf-projection rule.
  Do not reconstruct product, sum, or invertible-affine local-norm algebra.

Search-first cache for this lane: pinned mathlib has no direct Chewi
Hessian-stability theorem and no direct derivative theorem for
`fun t => inner ℝ v (hess (hessianSegmentPoint x y t) v)`, and no direct
Riccati comparison theorem matching `q' <= M*q^2`.  Reuse
`HasFDerivAt.comp_hasDerivAt`, `HasDerivAt.clm_apply`,
`HasDerivAt.inner`, `HasDerivWithinAt.inner`, `HasDerivWithinAt.inv`,
`HasDerivWithinAt.sqrt`,
`monotoneOn_of_hasDerivWithinAt_nonneg`,
`Continuous.clm_apply`/`ContinuousOn.clm_apply`,
`ContinuousOn.intervalIntegrable_of_Icc`,
`ContinuousLinearMap.intervalIntegral_comp_comm`,
`innerSL`/`innerSL_apply_apply`,
`intervalIntegral.integral_sub`,
`ContinuousLinearMap.le_opNorm`,
`ContinuousMultilinearMap` and `iteratedFDeriv` APIs, plus
`ContinuousLinearMap.IsPositive`/matrix `PosSemidef` APIs only when the
supplied-Hessian interface is insufficient.  Faraday's API scout found no
one-shot pinned theorem saying that the derivative of the Hessian operator
equals the third Frechet derivative in the local `E -> E →L[ℝ] E` shape.
Reusable exact names for that bridge include
`ContDiffAt.differentiableAt_iteratedFDeriv`,
`fderiv_iteratedFDeriv`, `iteratedFDeriv_succ_apply_left`,
`iteratedFDeriv_succ_apply_right`, `iteratedFDeriv_two_apply`,
`ContDiffAt.iteratedFDeriv_comp_perm`,
`HasFDerivAt.continuousMultilinear_apply_const`, and
`fderiv_continuousMultilinear_apply_const`.  For the scalar Delta integral
layer, reuse `IntervalIntegrable.mul_const`,
`intervalIntegral.integral_mono_on`,
`intervalIntegral.integral_mul_const`, and
`intervalIntegral.integral_eq_sub_of_hasDerivAt`; do not reprove interval
integral algebra.  Do not return to ASGD, old
Chapter 3, or generic process-prompt edits unless the user explicitly switches
lanes.

Verification gate: after Lean edits run
`lake env lean StatInference/Optimization/InteriorPoint.lean`, then
`lake build StatInference.Optimization.InteriorPoint`; run root
`lake build StatInference` only for root imports or broad cross-module changes.
Scan `StatInference/Optimization` plus
`StatInference/ProbabilityTheory/ProductBounds.lean` for
`sorry|admit|axiom|unsafe`, run `git diff --check`, scan changed files for
secrets, then fetch/rebase once and push verified progress.

## Archived Live Goal Prompt V5 (ASGD)

This archived ASGD prompt is retained for historical route context only.  It is
not the current `/goal` target selector unless the user explicitly switches
back to ASGD.

Latest verified ASGD packet: the right compensated full-inverse
route has been sharpened to the normalized Taylor product route.  Reuse the
new no-factor-bound declarations in `StatInference/Optimization/ASGD.lean`:
`projectedCompensatedFullInverseRight_integral_eq_normalizedTaylorProduct_integral`,
`projectedNormalizedTaylorProduct_tendsto_exp_of_compensated_error`,
`projectedNormalizedTaylorProduct_tendsto_exp_of_source_variance_of_variance_error`,
`projectedCompensatedFullInverseRight_tendsto_exp_of_source_variance_of_variance_error_no_factor_bound`,
`projected_charFun_tendsto_exp_of_compensated_full_inverse_right_source_variance_and_mixedTowerDefect_of_variance_error_no_factor_bound`,
and the downstream `_no_factor_bound` future-tail/inverse-tail scalar CLT,
projected CLT, projected bridge, and certificate wrappers.  The previous
`herror_factor_bound : ‖1 + error‖ ≤ 1` gate is superseded for the active
source-variance ASGD route; keep the older declarations only for API
compatibility and do not route new proof work through that assumption.
Newest source-facing shrink: the `_of_uniform_bound_no_factor_bound` wrappers
also discharge the variance-error row integrability from the bounded source via
`projectedCompensationVarianceError_row_norm_integrable_of_uniform_bound`.
Use these newest wrappers for future-tail/inverse-tail ASGD certificates unless
an external theorem really needs to expose the variance-error row.
The deterministic future-tail proxy route now also has compact
`deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`
characteristic-function, scalar/projected CLT, bridge, and certificate
wrappers; use them when the proxy is constant in `ω`.  It now also has the
Chewi 12.3 ASGD endpoint wrapper
`asgd_limit_package_of_deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`.
Newest source-construction bridge: `ASGD.lean` now also proves
`projectedNormalizedTaylorFactor_integrable_of_uniform_bound`,
`projectedMixedTowerFutureTail_sub_deterministicTailProxy_norm_le`,
`projectedMixedTowerFutureTail_deterministicTailProxy_l1_le_suffix_error`,
`projectedMixedTowerFutureTail_deterministicTailProxy_l1_row_sum_le_suffix_error`,
`projectedMixedTowerFutureTail_deterministicTailProxy_l1_sum_tendsto_zero_of_suffix_error`,
and
`projectedMixedTowerFutureTail_deterministicTailProxy_l1_sum_tendsto_zero_of_weighted_factor_error`.
These theorems promote weighted one-step deterministic proxy-factor error to
row-summed future-tail `L1` approximation, reusing
`StatInference.norm_prod_sub_prod_le_sum_norm_sub` and
`chewi127_integral_sum_range_sum_Ico_succ_eq_integral_weighted`.  The next
ASGD source task is to construct/prove the concrete deterministic factor proxy
error estimate, not to rework suffix-product algebra.
Newest limit-variance proxy packet: `ASGD.lean` now defines the canonical
deterministic factor `chewi127LimitVarianceProxyFactor`, proves its unit-ball
bound from `covariance_limit_self_nonneg`, packages the suffix product as
`projectedLimitVarianceFutureTailProxy`, proves
`projectedMixedTowerFutureTail_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_factor_error`,
and exposes the Chewi 12.3 endpoint
`asgd_limit_package_of_limitVarianceProxy_weighted_factor_error_of_uniform_bound_no_factor_bound`.
The remaining proof obligation for this lane is precisely the weighted
one-step factor-error convergence against this proxy.
Newest split packet: `ASGD.lean` now also proves
`projectedNormalizedTaylorFactor_limitVarianceProxy_weighted_error_tendsto_zero_of_inverse_error_compensated_error`
and the Chewi 12.3 endpoint
`asgd_limit_package_of_limitVarianceProxy_inverse_error_compensated_error_of_uniform_bound_no_factor_bound`.
The remaining weighted factor-error obligation is split into the
inverse-compensation-to-limit-variance proxy weighted error and the compensated
Taylor-error weighted row sum.
Newest scalar variance-difference proxy packet: `ASGD.lean` now also proves
the scalar exponential comparison
`chewi127_complex_exp_sub_exp_norm_le_abs_sub_mul_exp`, defines
`projectedInverseLimitVarianceProxyScaledDiffExp`, proves the pointwise
inverse-factor proxy bound
`projectedInverseCompensationFactor_limitVarianceProxy_norm_le_scaled_variance_diff_exp`,
promotes it to the weighted row convergence theorem
`projectedInverseCompensationFactor_limitVarianceProxy_weighted_error_tendsto_zero_of_scaled_variance_diff_exp`,
and exposes the Chewi 12.3 endpoint
`asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_compensated_error_of_uniform_bound_no_factor_bound`.
The inverse-compensation-to-limit-variance proxy obligation is now reduced to a
single row-weighted scalar conditional-variance difference exponential bound;
do not reprove the complex exponential Lipschitz/product/suffix plumbing.
Newest scalar proxy integrability shrink: `ASGD.lean` now also proves
`projectedInverseLimitVarianceProxyScaledDiffExp_aestronglyMeasurable`,
`projectedInverseLimitVarianceProxyScaledDiffExp_nonneg`,
`projectedInverseLimitVarianceProxyScaledDiffExp_le_of_variance_abs_le`,
`projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integrable_of_variance_abs_le`,
`projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integrable_of_uniform_bound`,
`projectedInverseCompensationFactor_limitVarianceProxy_weighted_error_tendsto_zero_of_scaled_variance_diff_exp_of_uniform_bound`,
and the endpoint
`asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_compensated_error_of_uniform_bound_no_factor_bound_no_scaled_integrability`.
Uniform boundedness now discharges scalar-proxy row integrability.  The
remaining scalar-proxy convergence is a genuine strong row condition, not a
free consequence of the averaged covariance convergence alone; if the source
route needs only averaged covariance, use the compensated full-inverse/product
route rather than pretending an absolute weighted one-step proxy follows.
Newest scalar-proxy endpoint shrink: `ASGD.lean` now also proves
`asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_weighted_variance_remainder_of_uniform_bound_no_factor_bound`,
which discharges the compensated Taylor weighted-error row from the existing
weighted variance-error and weighted Taylor-remainder rows.  The scalar proxy
route now exposes only the scalar inverse-proxy convergence plus those two
weighted source-error convergence assumptions; do not ask callers separately
for compensated Taylor weighted-error convergence.
Newest weighted absolute variance-difference bridge: `ASGD.lean` now proves
`projectedInverseLimitVarianceProxyScaledDiffExp_le_const_mul_inv_mul_abs_variance_diff`,
`projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integral_tendsto_zero_of_weighted_abs_variance_diff`,
and the source-facing endpoint
`asgd_limit_package_of_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
This closes the scalar-proxy lane whenever a caller can provide the explicit
row-weighted `L1` absolute variance-difference gate.  It does not turn Chewi's
plain averaged covariance convergence into an absolute row estimate; for the
source Theorem 12.7 route under only averaged covariance convergence, keep
using the compensated full-inverse/product or direct future-multiplier residual
lanes.
The newest residual-estimate packet extracts the actual row-summed residual
handoffs as reusable theorems:
`projectedMixedTowerFutureTail_l1_residual_sum_tendsto_zero_of_predictable_l1_approx`,
`projectedMixedTowerFutureTail_l1_residual_sum_tendsto_zero_of_deterministic_l1_approx`,
and
`projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_futureTail_l1_residual_sum`.
Use these when proving source proxy estimates; do not re-enter the mixed-tower
defect proof just to recover a residual convergence statement.
The direct future-tail residual route now has
`futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound` wrappers through
the certificate layer.  This is the preferred route when the normalized future
tail is proved asymptotically predictable in row-summed `L1`; no proxy object
or normalized-product argument is needed.  It now also has the Chewi 12.3 ASGD
endpoint wrapper
`asgd_limit_package_of_futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound`.
The even more direct preferred route now has
`futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound` wrappers
through charFun/scalar/projected CLT, bridge, and certificate: once the
mixed-tower future multiplier is asymptotically predictable in row-summed
`L1`, Theorem 12.7 certificate plumbing is complete.  It now also has the
Chewi 12.3 ASGD endpoint wrapper
`asgd_limit_package_of_futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound`.
Newest future-multiplier proxy packet: `ASGD.lean` now also proves
`projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_predictable_l1_approx`,
`projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_deterministic_l1_approx`,
`asgd_limit_package_of_futureMultiplier_predictable_l1_approx_of_uniform_bound_no_factor_bound`,
and
`asgd_limit_package_of_futureMultiplier_deterministic_l1_approx_of_uniform_bound_no_factor_bound`.
The preferred ASGD route can now start from an explicit predictable or
deterministic proxy approximation of the mixed-tower future multiplier, rather
than a raw conditional-expectation residual statement.
Newest concrete proxy packet: `ASGD.lean` now defines the predictable
limit-variance future-multiplier proxy
`projectedLimitVarianceFutureMultiplierProxy`, proves its
`F_r`-measurability, integrability, unit-ball bound, and the approximation
theorem
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_factor_error`.
It also exposes the ASGD endpoint
`asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_factor_error_of_uniform_bound_no_factor_bound`.
This routes the canonical limit-variance factor-error lane through the
preferred future-multiplier proxy interface.
Latest proxy-source bridge packet: the concrete future-multiplier proxy route
now also has reusable row-summed `L1` approximation theorems from
inverse-error/compensated-error, scalar variance-difference exponential, and
weighted variance-error/Taylor-remainder inputs:
`projectedInverseCompensationFactor_limitVarianceProxy_weighted_row_norm_integrable_of_uniform_bound`,
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_inverse_error_compensated_error`,
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp`,
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp_of_uniform_bound`,
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp_weighted_variance_remainder`,
and
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_abs_variance_diff_weighted_variance_remainder`.
The matching ASGD endpoints are
`asgd_limit_package_of_limitVarianceFutureMultiplierProxy_inverse_error_compensated_error_of_uniform_bound_no_factor_bound`
and
`asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
The weighted inverse-tail fallback is now packaged through the certificate
layer as
`inverseFutureTail_weighted_variance_remainder_of_uniform_bound_no_factor_bound`:
weighted variance-error and Taylor-remainder convergence supply the
future-tail versus inverse-tail comparison, and the only remaining probabilistic
input is row-summed `L1` predictability of the inverse future tail.

Mission: finish the main-text Chewi Optimization 2026 Lean formalization under
`StatInference/Optimization` as fast as correctness allows.  Keep all
code/docs/comments in English; chat updates may be Chinese/English mix.
Exercises live only in `StatInference/Optimization/Exercises.lean` and must not
consume the main theorem packet unless they unlock a main-text proof.

Current frontier: the active module is `StatInference/Optimization/ASGD.lean`;
the active source packet is Chapter 12 ASGD Theorem 12.7/12.3.  The concrete
limit-variance future-multiplier proxy now consumes the inverse-error,
scalar-variance-difference, weighted variance-remainder, and explicit weighted
absolute variance-difference lanes.  Do not add more endpoint-only wrappers
around this proxy unless they eliminate an assumption.  The next aggressive
Lean target is the genuinely source-side part: prove a row-summed `L1`
approximation/residual for the mixed-tower future multiplier from Chewi's
actual averaged covariance assumptions, or prove the missing compensated
full-inverse/product source estimate that bypasses the unjustified absolute row
gate.  If a source argument really supplies the stronger absolute row
hypothesis, use the compiled endpoint
`asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
The stable ASGD stack now includes the
conditional residual/correlation primitives
`integral_mul_condExp_residual_eq_zero_of_aestronglyMeasurable_left` and
`norm_integral_mul_condExp_residual_le_integral_norm_residual_mul_norm`, the
future-multiplier defect layer
`projectedRawCharFunStepFactor`,
`projectedMixedTowerFutureMultiplier`,
`projectedRawPrefixNormalizedTailProduct_succ_eq_futureMultiplier_mul_rawStep`,
`projectedRawPrefixNormalizedTailProduct_eq_futureMultiplier_mul_normalizedStep`,
`projectedMixedTowerStepDefect_norm_le_futureMultiplier_residual`,
`projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum`,
`projectedMixedTowerFutureMultiplier_mul_rawStep_integrable`,
`projectedMixedTowerFutureMultiplier_mul_condRawStep_integrable`,
`projectedMixedTowerFutureMultiplier_mul_rawStepResidual_integrable`,
`projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum_of_condResidual_integrable`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum_of_condResidual_integrable`,
`projectedMixedTowerFutureMultiplier_integrable_of_uniform_bound`,
`projectedMixedTowerFutureMultiplier_norm_le_one_ae`,
`projectedMixedTowerFutureMultiplier_condExp_norm_le_one_ae`,
`projectedRawCharFunStepFactor_integrable`,
`projectedRawCharFunStepFactor_residual_integrable`,
`projectedMixedTowerFutureMultiplier_condExp_mul_rawStepResidual_integrable`,
`projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum_of_source_integrability`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum_of_source_integrability`,
`projectedRawCharFunStepFactor_norm_le_one_ae`,
`projectedRawCharFunStepFactor_condExp_norm_le_one_ae`,
`projectedRawCharFunStepFactor_residual_norm_le_two_ae`,
`projectedFutureMultiplierResidualProduct_integral_le_two_mul_futureResidual_integral`,
`projectedFutureMultiplierResidualProduct_row_sum_le_two_mul_futureResidual_row_sum`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_l1_residual_sum`,
`projectedMixedTowerFutureTail`,
`projectedMixedTowerFutureTail_integrable_of_uniform_bound`,
`projectedMixedTowerInverseFutureTail`,
`projectedMixedTowerInverseFutureTail_integrable`,
`projectedMixedTowerFutureTail_sub_inverseFutureTail_norm_le`,
`projectedMixedTowerFutureTail_inverseFutureTail_l1_le_suffix_error`,
`projectedMixedTowerFutureTail_inverseFutureTail_l1_row_sum_le_suffix_error`,
`projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_suffix_error`,
`projectedMixedTowerFutureTail_condExp_inverseFutureTail_l1_sum_tendsto_zero_of_parts`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_inverseFutureTail_condExp`,
`projectedMixedTowerFutureMultiplier_condExp_eq_rawPrefix_mul_tailCondExp`,
`projectedMixedTowerFutureMultiplier_residual_norm_le_tail_residual_ae`,
`projectedMixedTowerFutureMultiplier_l1_residual_le_tail_l1_residual`,
`projectedMixedTowerFutureMultiplier_l1_residual_row_sum_le_tail_l1_residual_row_sum`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_l1_residual_sum`,
`integral_norm_sub_condExp_le_two_mul_integral_norm_sub_of_aestronglyMeasurable`,
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_predictable_l1_approx`,
`projected_charFun_tendsto_exp_of_futureTail_predictable_l1_approx`,
`projected_scalar_clt_of_futureTail_predictable_l1_approx`,
`projected_clt_of_futureTail_predictable_l1_approx`,
`toProjectedBridge_of_futureTail_predictable_l1_approx`,
`toMartingaleCLTCertificate_of_futureTail_predictable_l1_approx`,
`projected_charFun_tendsto_exp_of_deterministic_futureTail_l1_approx`,
`projected_scalar_clt_of_deterministic_futureTail_l1_approx`,
`projected_clt_of_deterministic_futureTail_l1_approx`,
`toProjectedBridge_of_deterministic_futureTail_l1_approx`,
`toMartingaleCLTCertificate_of_deterministic_futureTail_l1_approx`,
and
`projected_charFun_tendsto_exp_of_futureMultiplier_residual_sum`, the
conditional Taylor-remainder row convergence from `a94b579` and the
compensated one-step/error interface:
`projectedCompensationFactor`, `projectedCompensatedTaylorErrorFactor`,
`one_add_projectedCompensatedTaylorErrorFactor`,
`projectedCompensatedTaylorErrorFactor_norm_le`,
`projectedCompensatedTaylorErrorFactor_row_norm_le`, and
`projected_charFun_compensated_taylor_step_mul_scaled`, plus the adapted
compensated-prefix layer
`Chewi127ConditionalCovarianceProcess.Xi_succ_filtration_aestronglyMeasurable`,
`projectedCompensationPrefixProduct`,
`projectedCompensatedRawPrefixProduct`,
`projectedCompensationPrefixProduct_zero`,
`projectedCompensatedRawPrefixProduct_zero`,
`projectedCompensationFactor_filtration_aestronglyMeasurable`,
`projectedCompensationPrefixProduct_aestronglyMeasurable_of_le`,
`projectedCompensatedRawPrefixProduct_aestronglyMeasurable_of_le`, and
`projectedCompensatedRawPrefixProduct_integral_succ_eq`, plus the mixed-defect
compensated algebra bridge
`projectedCompensationFactor_mul_inverseCompensationFactor`,
`projectedRawPrefixNormalizedTailProduct_eq_compensated_prefix_inverse_tail`,
`projectedRawPrefixNormalizedTailProduct_eq_compensated_prefix_full_inverse_error_tail`,
and
`projectedMixedTowerDefect_sum_eq_compensated_full_inverse_sub_error_product`;
the product-to-one
bridges `StatInference.norm_prod_one_add_sub_one_le_sum_norm`,
`StatInference.product_one_add_tendsto_one_of_sum_norm`,
`chewi127_integral_product_one_add_tendsto_one_of_integral_sum_norm`, and
`projectedCompensatedTaylorErrorProduct_integral_tendsto_one`, the row-error
discharge bridge `projectedCompensatedTaylorError_row_integral_tendsto_zero`,
and the source compensation-bound layer
`projected_conditional_variance_abs_le_of_uniform_bound`,
`projectedCompensationFactor_norm_le_of_variance_abs_le`,
`projectedCompensationFactor_eventually_row_norm_le`, and
`projectedCompensatedTaylorError_row_integral_tendsto_zero_of_variance_error`,
plus the variance-only discharge
`chewi127_complex_exp_mul_one_sub_sub_one_norm_le`,
`projectedCompensationVarianceError_norm_le_of_variance_abs_le`,
`projectedCompensationVarianceError_row_integral_tendsto_zero`, and
`projectedCompensatedTaylorError_row_integral_tendsto_zero_of_source_variance`,
plus the normalized compensated-product bridge:
`projectedInverseCompensationFactor`,
`projectedNormalizedTaylorFactor`,
`projectedInverseCompensationFactor_mul_compensationFactor`,
`projectedInverseCompensationProduct_eq_exp_averageVariance`,
`projectedInverseCompensationProduct_integral_eq_exp_averageVariance`,
`projectedInverseCompensationProduct_tendsto_exp_of_averageVariance_integral`,
`projectedAverageVariance_exp_integral_tendsto_of_boundedContinuous`,
`projectedInverseCompensationProduct_tendsto_exp_of_boundedContinuous_averageVariance`,
`chewi127VarianceExpOnIcc`,
`chewi127ClampedVarianceExp`,
`chewi127ClampedVarianceExp_apply_of_abs_le`,
`Chewi127ConditionalCovarianceProcess.Xi_succ_aemeasurable`,
`Chewi127ConditionalCovarianceProcess.averageConditionalCovariance_aemeasurable`,
`Chewi127ConditionalCovarianceProcess.averageConditionalVariance_aemeasurable`,
`chewi127AverageConditionalVariance_abs_le_of_row_bound`,
`tendstoInMeasure_const_abs_le_of_ae_bound`,
`projectedAverageVariance_exp_integral_tendsto_of_abs_bound`,
`projectedInverseCompensationProduct_tendsto_exp_of_averageVariance_abs_bound`,
`projected_average_conditional_variance_abs_le_of_uniform_bound`,
`projected_covariance_limit_abs_le_of_average_bound`,
`projected_average_and_limit_variance_abs_le_of_uniform_bound`,
`projectedInverseCompensationProduct_tendsto_exp_of_uniform_bound`,
`projected_conditional_variance_nonneg_ae`,
`projectedInverseCompensationFactor_norm_le_one_of_variance_nonneg`,
`projectedInverseCompensationFactor_aestronglyMeasurable`,
`projectedInverseCompensationFactor_norm_le_one_ae`,
`projectedInverseCompensationFactor_row_norm_le_one_ae`,
`projectedInverseCompensationFactor_eventually_row_norm_le_one`,
`projectedInverseCompensationProduct_aestronglyMeasurable`,
`projectedInverseCompensationProduct_integrable`,
`projectedNormalizedInverseDifference_row_integrable_of_uniform_bound`,
`projectedNormalizedTaylorFactor_eq_taylorModel`,
`projectedNormalizedTaylorFactor_ae_eq_condExp_charFun`,
`projectedNormalizedTaylorFactor_norm_le_one_ae`,
`projectedNormalizedTaylorFactor_aestronglyMeasurable`,
`projectedNormalizedTaylorFactor_row_norm_le_one_ae`,
`projectedNormalizedTaylorFactor_eventually_row_norm_le_one`,
`projectedNormalizedTaylorProduct_aestronglyMeasurable_of_uniform_bound`,
`projectedNormalizedTaylorProduct_integrable_of_uniform_bound`,
`projected_charFun_normalized_taylor_step_mul_scaled`,
`projected_charFun_normalized_taylor_step_mul_scaled_of_measurable`,
`projected_scalarScaledSum_charFun_eq_integral_product`,
`projected_charFun_product_tower_succ_normalized_scaled'`,
`projectedRawPrefixNormalizedTailProduct`,
`projectedRawPrefixNormalizedTailProduct_zero`,
`projectedRawPrefixNormalizedTailProduct_self`,
`projectedRawPrefixNormalizedTailProduct_integral_succ_eq`,
`projectedRawPrefixNormalizedTailProduct_integral_self_eq_zero`,
`projected_scalarScaledSum_charFun_eq_integral_normalized_product_of_mixed_tower`,
`projected_charFun_normalized_product_model_of_mixed_tower`,
`projected_charFun_tendsto_exp_of_mixed_tower`,
`projected_remainder_row_norm_integrable_of_uniform_bound`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_normalized_bound`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_normalized_controls`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_product_controls`,
`projectedCompensationFactor_aestronglyMeasurable`,
`projectedVarianceFactor_aestronglyMeasurable`,
`projectedRemainderFactor_aestronglyMeasurable`,
`projectedCompensatedTaylorErrorFactor_aestronglyMeasurable`,
`projectedCompensationFactor_row_norm_le_of_uniform_bound`,
`projectedCompensatedTaylorError_row_norm_integrable_of_variance_error`,
`projectedCompensationVarianceError_row_norm_integrable_of_uniform_bound`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_error_integrability`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_row_integrability`,
`projectedMixedTowerMultiplier_integrable_of_uniform_bound`,
`projectedMixedTowerMultiplier_aestronglyMeasurable_of_future_tail`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_future_measurability`,
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_future_tail_measurability`,
`projected_scalar_clt_of_mixed_tower_future_measurability`,
`projected_clt_of_mixed_tower_future_measurability`,
`projected_scalar_clt_of_mixed_tower_future_tail_measurability`,
`projected_clt_of_mixed_tower_future_tail_measurability`,
`toProjectedBridge_of_mixed_tower_future_tail_measurability`,
`toMartingaleCLTCertificate_of_mixed_tower_future_tail_measurability`,
`asgd_limit_package_of_mixed_tower_future_tail_measurability`,
`projectedNormalizedTaylorFutureTail_aestronglyMeasurable_of_factorwise`,
`asgd_limit_package_of_factorwise_future_tail_measurability`,
`projectedNormalizedTaylorFactor_filtration_aestronglyMeasurable`,
`projectedNormalizedTaylorFactor_filtration_aestronglyMeasurable_of_uniform_bound`,
`projectedNormalizedTaylorProduct_aestronglyMeasurable_of_le`,
`projectedNormalizedTaylorProduct_Ico_terminal_aestronglyMeasurable`,
`projectedRawPrefixNormalizedTailProduct_terminal_aestronglyMeasurable`,
`projectedRawPrefixNormalizedTailProduct_integrable_of_uniform_bound`,
`projectedMixedTowerStepDefect`,
`projectedRawPrefixNormalizedTailProduct_integral_self_eq_zero_add_defect_sum`,
`projected_scalarScaledSum_charFun_eq_integral_normalized_product_add_mixedTowerDefect_sum`,
`projected_charFun_tendsto_exp_of_normalized_product_model_with_mixedTowerDefect`,
`projectedCompensatedTaylorErrorProduct_integral_tendsto_one_of_source_variance`,
`projected_charFun_tendsto_exp_of_normalized_product_model`,
and
`projected_charFun_tendsto_exp_of_normalized_product_model_of_source_variance`.

Next theorem packet: construct a concrete predictable proxy for the future
normalized tail and prove its row-summed L1 approximation error tends to zero,
consumed by
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_predictable_l1_approx`.
All raw current-step, normalized current-step, raw residual, conditional future-
multiplier residual, and source boundedness integrability gates are already
discharged; the raw-step residual has also been uniformly bounded by two, so
the product row-sum is reduced to twice the future-multiplier L1 residual
row-sum, and the raw characteristic prefix has been pulled out of the
future-multiplier conditional expectation.  Do not re-prove these reductions.
The next genuine estimate should control the normalized future tail
by an `F_r`-measurable proxy `A_{N,r}` in row-summed L1.  That will prove the
standard compensated martingale defect bound
`Tendsto (fun N => ∑ r in Finset.range N,
S.projectedMixedTowerStepDefect L N r t) atTop (𝓝 0)` and now feeds directly
into `projected_charFun_tendsto_exp_of_futureTail_predictable_l1_approx` and
`projected_scalar_clt_of_futureTail_predictable_l1_approx`; the displayed
projected-noise CLT and vector certificate constructors
`projected_clt_of_futureTail_predictable_l1_approx`,
`toProjectedBridge_of_futureTail_predictable_l1_approx`, and
`toMartingaleCLTCertificate_of_futureTail_predictable_l1_approx` are also
compiled.  If the proxy is deterministic, the constant-in-`ω` source-facing
constructors
`projected_charFun_tendsto_exp_of_deterministic_futureTail_l1_approx`,
`projected_scalar_clt_of_deterministic_futureTail_l1_approx`,
`projected_clt_of_deterministic_futureTail_l1_approx`,
`toProjectedBridge_of_deterministic_futureTail_l1_approx`, and
`toMartingaleCLTCertificate_of_deterministic_futureTail_l1_approx` discharge
proxy measurability/integrability plus bounded-source square/remainder
integrability automatically.  The compact no-factor deterministic-proxy route
also reaches the Chewi 12.3 ASGD endpoint through
`asgd_limit_package_of_deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`.
The residual-estimate layer now separately exposes the future-tail residual
from predictable or deterministic proxy approximations, and the
future-multiplier residual from the future-tail residual.  After the proxy
estimate is closed, instantiate these residual and endpoint constructors; do
not spend another run on characteristic-function, certificate, or ASGD endpoint
adapter wiring.  The one-step
normalized peel, inverse-compensation algebra, and bounded-continuous
expectation handoff are already compiled; the raw-product start and normalized
successor peel are also compiled as
`projected_scalarScaledSum_charFun_eq_integral_product` and
`projected_charFun_product_tower_succ_normalized_scaled'`; the guarded mixed
raw-prefix/normalized-tail product and its endpoint/successor lemmas are now
compiled as `projectedRawPrefixNormalizedTailProduct`,
`projectedRawPrefixNormalizedTailProduct_zero`,
`projectedRawPrefixNormalizedTailProduct_self`, and
`projectedRawPrefixNormalizedTailProduct_integral_succ_eq`.  The guarded
finite induction and product-model handoff are now compiled as
`projectedRawPrefixNormalizedTailProduct_integral_self_eq_zero`,
`projected_scalarScaledSum_charFun_eq_integral_normalized_product_of_mixed_tower`,
`projected_charFun_normalized_product_model_of_mixed_tower`, and
`projected_charFun_tendsto_exp_of_mixed_tower`.  The newest uniform-
integrability packet also proves
`projected_remainder_row_norm_integrable_of_uniform_bound` and
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability`,
discharging projected square integrability, one-step Taylor-remainder
integrability, and conditional-remainder row integrability from the source
uniform bound.  The newest normalized-control packet identifies each
normalized Taylor factor with the conditional characteristic function of the
next projected martingale increment, bounds it by one a.e. via
`norm_condExp_le` and `condExp_const`, proves normalized-product
a.e.-measurability/integrability from the uniform bound, and provides the
source wrapper
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_normalized_controls`.
The newest inverse-control packet proves conditional-variance nonnegativity
from `condExp_nonneg`, bounds every inverse-compensation factor by one a.e.,
proves inverse-product measurability/integrability, discharges the
normalized-minus-inverse row integrability side condition, and provides
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_product_controls`.
The newest row-integrability packet proves a.e.-measurability for the
compensation, variance, remainder, and compensated-Taylor error factors,
derives the compensated-error row-sum integrability from the variance-error
row-sum integrability plus source boundedness, discharges the variance-only
row-sum integrability directly from source boundedness, and provides
`projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_row_integrability`.
The newest mixed-tail packet discharges mixed-tower multiplier integrability
from source boundedness, proves raw-prefix times tail measurability from the
precise future-tail `F_r`-measurability condition, and packages the resulting
characteristic-function and projected scalar CLT bridges.  The newest
certificate packet wires that same gate into the Chewi 12.7 vector CLT
certificate through the compiled Cramér-Wold bridge.  The preferred
source-facing frontier is now
`asgd_limit_package_of_mixed_tower_future_tail_measurability`: the future-tail
gate constructs the Chewi 12.7 certificate and then feeds the compiled Chewi
12.3 ASGD limit/covariance package.  All analytic and integrability
obligations are compiled, and the only remaining displayed input is
`∀ t N r, r < N -> AEStronglyMeasurable[S.martingale.filtration r]
  (fun ω => ∏ k ∈ Finset.Ico (r + 1) N,
    S.projectedNormalizedTaylorFactor L N t k ω) P`.
The newest factorwise-source packet also proves
`projectedNormalizedTaylorFutureTail_aestronglyMeasurable_of_factorwise` by
finite-product induction over the sub-filtration measurability API and exposes
`asgd_limit_package_of_factorwise_future_tail_measurability`, where callers
may instead prove the stronger but often natural condition that each future
normalized Taylor factor in `[r+1, N)` is already `F_r`-measurable.
The newest forward-measurability packet proves the honest adapted-filtration
facts: every normalized Taylor factor is `F_k`-measurable, the source uniform
bound discharges its square/remainder integrability prerequisites, any finite
product is measurable at a filtration level after all its factor indices, and
the interval product over `[r, N)` is `F_N`-measurable.  This records exactly
what adaptedness provides and supplies the building block for a backward or
telescoping conditional-multiplier formulation that avoids false future-tail
measurability.
The newest mixed-terminal packet packages the corresponding split product:
`projectedRawPrefixNormalizedTailProduct_terminal_aestronglyMeasurable` proves
the raw-prefix/normalized-tail product is `F_N`-measurable when `r <= N`, and
`projectedRawPrefixNormalizedTailProduct_integrable_of_uniform_bound` proves it
is integrable from the source bound and the a.e. unit bound on normalized
factors.  This is the correct measurability/integrability interface for an
honest backward/telescoping conditional-multiplier route.
The newest defect packet names the honest obstruction as
`projectedMixedTowerStepDefect`, proves the finite telescope
`projectedRawPrefixNormalizedTailProduct_integral_self_eq_zero_add_defect_sum`,
derives the exact characteristic-function decomposition
`projected_scalarScaledSum_charFun_eq_integral_normalized_product_add_mixedTowerDefect_sum`,
and provides the convergence adapter
`projected_charFun_tendsto_exp_of_normalized_product_model_with_mixedTowerDefect`.
This is now the preferred no-false-predictability route: prove the defect sum
vanishes using the compensated martingale prefix argument.
The newest adapted compensated-prefix packet adds `F_k` measurability for
compensation factors, later-filtration measurability for compensation prefixes
and compensated raw prefixes, and the forward one-step identity that replaces
the next raw factor plus its current compensation by `1 +` the compensated
Taylor error.  This is the substrate for the finite compensated-prefix
iteration; the remaining work is accumulation and comparison to the mixed
defect sum, not another local measurability wrapper.
The newest mixed-defect algebra packet proves the inverse/compensation
commuted cancellation, rewrites each mixed raw-prefix/normalized-tail product
as a compensated raw prefix times the full inverse-compensation product and
the remaining compensated-error tail, and rewrites the finite mixed-defect sum
as the exact difference between the full compensated raw prefix weighted by the
full inverse product and the full inverse product weighted by all
compensated-error factors.  This sharpens the blocker: the remaining theorem
is a weighted martingale correlation/convergence estimate, not a missing
finite-product algebra identity.
The newest future-multiplier residual packet names the raw one-step factor and
future multiplier, rewrites the two neighboring mixed products around split
`r`, bounds each one-step mixed defect by the conditional residual correlation
estimate, sums those bounds across the row, and adds the characteristic-
function convergence adapter from normalized-product convergence plus
future-multiplier residual row-sum convergence.  This is now the preferred
frontier; do not return to exact defect algebra unless a regression breaks it.
The newest future-multiplier integrability bridge discharges the raw step,
conditional normalized step, and raw step-residual product integrability gates
from the existing bounded-product and normalized-factor interfaces, then adds
source-shaped row-sum and convergence adapters that leave only the conditional
future-multiplier residual product integrability and residual row-sum
convergence hypotheses exposed.
The newest source-integrability bridge proves the future multiplier is
integrable and a.e. bounded by one, proves the same a.e. bound for its
conditional expectation using `norm_condExp_le`, `condExp_mono`, and
`condExp_const`, proves raw-step and raw-step-residual integrability, and
discharges the conditional future-multiplier residual product integrability
gate.  The remaining blocker is therefore only the residual row-sum convergence
estimate.
The newest residual-reduction bridge proves the raw one-step factor and its
conditional expectation are a.e. bounded by one, hence the raw residual is
a.e. bounded by two, and reduces the full residual product row-sum to twice the
future-multiplier L1 residual row-sum.  The active blocker is now only the
future-multiplier unpredictability estimate
`∑_r ∫ ‖M_{N,r} - E[M_{N,r} | F_r]‖ -> 0`.
The newest future-tail reduction names the normalized future tail, proves its
integrability, pulls the raw prefix out of
`E[rawPrefix * futureTail | F_r]`, and bounds the future-multiplier residual by
the future-tail residual.  The active blocker is now only
`∑_r ∫ ‖T_{N,r} - E[T_{N,r} | F_r]‖ -> 0` for the normalized future tails.
The newest predictable-proxy reduction proves the general L1 inequality
`∫ ‖X - E[X|F]‖ <= 2 ∫ ‖X - A‖` whenever `A` is `F`-measurable, then wires it
to the ASGD defect theorem.  The active blocker is now to choose a concrete
`F_r`-measurable proxy for the normalized future tail and prove its row-summed
L1 approximation error vanishes.
The newest deterministic-proxy wrapper specializes this to constant-in-`ω`
tail proxies and automatically discharges proxy measurability/integrability
and bounded-source square/remainder integrability gates.  A material scout
result for the next proof packet: the natural deterministic core is the
inverse-compensation future tail
`∏ k in Finset.Ico (r+1) N, S.projectedInverseCompensationFactor L N t k`,
but this raw random tail is not itself `F_r`-measurable.  The honest
predictable candidate is its conditional expectation onto `F_r`.  The newest
inverse-tail layer names this tail, proves integrability, proves the
arbitrary-`Finset.Ico` suffix product perturbation bound via
`StatInference.norm_prod_sub_prod_le_sum_norm_sub`, lifts it to a row-summed
L1 suffix-error convergence wrapper, and proves
`projectedMixedTowerDefect_sum_tendsto_zero_of_inverseFutureTail_condExp`.
The newest weighted-suffix bridge adds the finite triangular counting identity
`chewi127_integral_sum_range_sum_Ico_succ_eq_integral_weighted`, using mathlib
`Finset.sum_Ico_Ico_comm'`, and the ASGD consumers
`projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_difference_error`
and
`projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_compensated_error`.
The newest weighted compensated-error packet proves
`projectedCompensatedTaylorErrorFactor_weighted_row_norm_le`,
`projectedCompensatedTaylorError_weighted_row_integral_tendsto_zero`,
`projectedCompensatedTaylorError_weighted_row_norm_integrable_of_variance_remainder`,
`projectedCompensatedTaylorError_weighted_row_integral_tendsto_zero_of_variance_remainder`,
and the future-tail consumer
`projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_variance_remainder`.
The newest same-limit defect packet proves
`projectedMixedTowerDefect_sum_tendsto_zero_of_compensated_full_inverse_same_limit`
and
`projected_charFun_tendsto_exp_of_compensated_full_inverse_same_limit`.
The newest right-product packet proves
`projectedCompensatedFullInverseRight_tendsto_exp_of_compensated_error` and
`projectedCompensatedFullInverseRight_tendsto_exp_of_source_variance`, comparing
`∏ inverse_k * ∏ (1 + error_k)` to `∏ inverse_k` by the existing product
perturbation bridge and the unweighted compensated-error row convergence.
The newest route-correction packet proves
`projectedCompensatedFullInverseLeft_eq_raw_product`,
`projectedCompensatedFullInverseLeft_integral_eq_raw_product_integral`,
`projectedCompensatedFullInverseLeft_integral_eq_charFun`,
`projected_charFun_tendsto_of_compensated_full_inverse_right_and_mixedTowerDefect`,
and
`projected_charFun_tendsto_exp_of_compensated_full_inverse_right_source_variance_and_mixedTowerDefect`.
The newest source-consumer packet adds
`projected_charFun_tendsto_exp_of_futureTail_predictable_l1_approx_source_variance`
and
`projected_charFun_tendsto_exp_of_inverseFutureTail_condExp_source_variance`,
so a future-tail predictable-proxy estimate or inverse-tail conditional
residual estimate now feeds directly into the projected characteristic-function
limit through the compiled right-product source-variance bridge.
The newest certificate-consumer packet adds source-variance scalar/vector CLT
and certificate wrappers for those two routes:
`projected_scalar_clt_of_futureTail_predictable_l1_approx_source_variance`,
`projected_scalar_clt_of_inverseFutureTail_condExp_source_variance`,
`projected_clt_of_futureTail_predictable_l1_approx_source_variance`,
`projected_clt_of_inverseFutureTail_condExp_source_variance`,
`toProjectedBridge_of_futureTail_predictable_l1_approx_source_variance`,
`toProjectedBridge_of_inverseFutureTail_condExp_source_variance`,
`toMartingaleCLTCertificate_of_futureTail_predictable_l1_approx_source_variance`,
and
`toMartingaleCLTCertificate_of_inverseFutureTail_condExp_source_variance`.
The newest reduced-source packet adds
`projectedCompensatedFullInverseRight_integrable_of_uniform_bound`,
`projectedCompensatedFullInverseRight_tendsto_exp_of_source_variance_of_variance_error`,
and
`projected_charFun_tendsto_exp_of_compensated_full_inverse_right_source_variance_and_mixedTowerDefect_of_variance_error`,
discharging the routine right-product, compensated-error, and remainder
integrability gates from existing source boundedness and the variance-error row.
This shows the left compensated full-inverse product is exactly the target
projected characteristic function, so left convergence is not an independent
blocker.  The preferred ASGD 12.7 route is now: use the compiled right-product
source-variance limit, then prove the genuinely non-circular mixed-tower defect
sum tends to zero.  The weighted suffix route remains a strong-assumption
fallback, not the default source route: unweighted row convergence is not
enough for suffix sums, because triangular regrouping counts the one-step error
at index `k` exactly `k` times.
The remaining ASGD proof obligations for the preferred route are now precisely:
1. prove row-summed `L1` asymptotic predictability of
   `S.projectedMixedTowerFutureMultiplier L N t r`; the certificate and ASGD
   endpoint routes are already packaged as
   `futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound` and
   `asgd_limit_package_of_futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound`;
2. alternatively prove row-summed `L1` asymptotic predictability of
   `S.projectedMixedTowerFutureTail L N t r`, whose certificate and ASGD
   endpoint routes are
   `futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound` and
   `asgd_limit_package_of_futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound`;
3. prove/discharge the weighted variance-only and weighted Taylor-remainder
   assumptions only if deliberately using the stronger weighted-suffix
   fallback; the fallback now already has charFun/scalar/projected/bridge/
   certificate wrappers through
   `inverseFutureTail_weighted_variance_remainder_of_uniform_bound_no_factor_bound`;
4. prove the row-summed conditional residual convergence of
   `projectedMixedTowerInverseFutureTail -
   E[projectedMixedTowerInverseFutureTail | F_r]` only if deliberately using
   the future-tail predictable-proxy route.
Reuse `projectedCompensatedTaylorError_row_integral_tendsto_zero_of_source_variance`,
the one-step error bounds, inverse-factor norm/measurability, and finite-sum
reindexing/counting APIs before adding new product machinery.
Fresh search check during the Exercise 4.2 obstruction pass found that the
generic suffix/counting product machinery is already present:
`projectedMixedTowerFutureTail_deterministicTailProxy_l1_row_sum_le_suffix_error`,
`projectedMixedTowerFutureTail_inverseFutureTail_l1_row_sum_le_suffix_error`,
`projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_difference_error`,
and the weighted variance/remainder consumers through
`projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_variance_remainder`.
Do not duplicate those suffix bounds; the live ASGD source task is to discharge
one of the concrete row-summed residual or weighted source assumptions.
Do not prove another compensation, row-error, inverse-product, raw
charFun-product start, successor peel, mixed-product endpoint, finite
mixed-product accumulation, abstract product-model handoff, uniform
square/remainder integrability wrapper, normalized factor norm bound,
normalized product integrability wrapper, inverse factor/product control
wrapper, normalized-minus-inverse row integrability wrapper, compensated-error
row integrability wrapper, variance-error row integrability wrapper, mixed
multiplier integrability wrapper, prefix-times-tail measurability wrapper,
future-tail scalar CLT wrapper, certificate-level future-tail bridge, or
ASGD future-tail endpoint wrapper, factorwise future-tail product wrapper,
forward normalized-factor measurability wrapper, mixed terminal measurability or
integrability wrapper, mixed-tower defect telescope/decomposition adapter,
compensated-prefix adaptedness wrapper, compensated raw-prefix one-step
identity, mixed-defect compensated algebra bridge, one-step future-multiplier
defect bound, row-sum residual bound, residual-sum convergence adapter, or
generic weak-convergence wrapper.
The variance
side is now source-facing:
`projectedInverseCompensationProduct_tendsto_exp_of_uniform_bound` consumes the
uniform martingale source bound, averaged-variance convergence in measure, and
the clamp bridge, and the new source-variance normalized-product wrapper also
discharges the compensated row-error convergence from the source variance and
remainder integrability hypotheses.  The finite martingale tower
representation into the normalized product integral is compiled under the
honest future-tail measurability gate, and the new CLT wrappers wire that gate
to the projected Chewi 12.7 scalar conclusion.

Accuracy note for the next packet: do not claim an unconditional exact finite
equality with a product of all random future normalized factors unless the
needed future-tail `F_n` measurability is supplied or proved.  The safe
one-step interface is
`projected_charFun_normalized_taylor_step_mul_scaled_of_measurable`, which
requires only the honest measurability/integrability of the current multiplier.
If the future random product route needs unavailable measurability, switch to
a telescoping/error representation with explicit conditional multipliers
instead of forcing a false exact product model.
The next ASGD packet should now prove the compensated martingale defect-sum
bound behind
`projected_charFun_tendsto_exp_of_compensated_full_inverse_right_source_variance_and_mixedTowerDefect`.
Use
`asgd_limit_package_of_factorwise_future_tail_measurability` only for an
explicit predictable/frozen-tail source condition, or
`asgd_limit_package_of_mixed_tower_future_tail_measurability` only if a caller
really supplies whole-tail `F_r`-measurability.  The remaining source gap is not
integrability and not raw-prefix adaptedness: the current increasing
martingale filtration does not imply that a future normalized-tail product is
`F_r`-measurable, because each tail factor is naturally measurable at `F_k` with
`r < k`.  Do not attempt to prove this gate from `StronglyAdapted` alone.

Search cache for the finite tower packet: no ready-made martingale CLT or
martingale product theorem was found in pinned mathlib or local
`StatInference`.  Reuse mathlib/local APIs
`Finset.prod_range_succ`, `Finset.prod_range_induction`,
`condExp_condExp_of_le`, `condExp_mul_of_aestronglyMeasurable_left`,
`StronglyAdapted.stronglyMeasurable_le`, `Finset.aestronglyMeasurable_prod`,
`integral_sub`, `integral_congr_ae`, `norm_integral_le_integral_norm`, and
local product bounds in `StatInference/ProbabilityTheory/ProductBounds.lean`.
New conditional-residual search result: mathlib/local APIs
`condExp_bilin_of_aestronglyMeasurable_left`, `condExp_sub`,
`condExp_condExp_of_le`, `stronglyMeasurable_condExp`, and
`integral_condExp` suffice to prove the compiled primitives
`integral_mul_condExp_residual_eq_zero_of_aestronglyMeasurable_left` and
`norm_integral_mul_condExp_residual_le_integral_norm_residual_mul_norm`.  Reuse
these for the weighted martingale correlation estimate instead of reproving
pull-out/tower algebra.
For the adapted compensated-prefix route, reuse
`Chewi127ConditionalCovarianceProcess.Xi_succ_filtration_aestronglyMeasurable`,
`AEStronglyMeasurable.mono`, finite-product induction over `Finset.range`, and
`projected_charFun_compensated_taylor_step_mul_scaled`; do not redo conditional
covariance or compensation-factor measurability.
For the normalized-control route, reuse mathlib `norm_condExp_le`,
`condExp_const`, `condExp_congr_ae`, `stronglyMeasurable_condExp`, and
`integrable_condExp`.  The inverse-product route now reuses mathlib
`condExp_nonneg`, `Complex.norm_exp_ofReal`, `Real.exp_le_one_iff`,
`AEMeasurable.complex_ofReal`, and local covariance measurability/nonnegativity
wrappers.  Do not repeat a broad CLT search unless the theorem shape changes.

Reuse boundary: do not redo scaled-sum definitions, Cramér-Wold plumbing,
bounded-tail/Lindeberg, Taylor expansion, conditional mean-zero/quadratic
substitution, product measurability/integrability, finite product bounds, or
conditional Taylor-remainder row convergence.  Reuse
`projected_charFun_taylor_step_mul_scaled`,
`projected_charFun_compensated_taylor_step_mul_scaled`,
`projectedCompensatedRawPrefixProduct_integral_succ_eq`,
`projectedMixedTowerDefect_sum_eq_compensated_full_inverse_sub_error_product`,
`projectedMixedTowerStepDefect_norm_le_futureMultiplier_residual`,
`projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum`, and
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum`,
`projected_remainder_row_integral_tendsto_zero`, the named projected variance
and remainder/compensation/error factors, the compensated error norm split,
the product-to-one, row-error, and compensation-bound bridges,
`integral_norm_condExp_le_integral_norm`,
`chewi127ScalarCharFunProduct` lemmas, and local product perturbation bridges.
One bounded API search is allowed only for the exact finite compensated
iteration measurability side condition or normalized-product induction shape;
after that, prove.

Execution gate: use `/private/tmp/chewi-smpgd-probability`; before Lean edits
state the exact theorem-sized target and fallback blocker.  Verify with
`lake env lean StatInference/Optimization/ASGD.lean`; promote with
`lake build StatInference.Optimization.ASGD`; scan for
`sorry`/`admit`/`axiom`/`unsafe`, secrets, and `git diff --check`; update docs
only for material frontier/blocker changes; fetch/rebase once before the final
commit/push.

Failure gate: if the theorem does not close, record the exact Lean statement,
the stuck goal or missing API, the bounded search already tried, and two
concrete continuation routes.  Avoid vague labels such as "next small gap" and
avoid wording-only prompt churn.

## Accuracy And Speed Corrections From Process Audit

The main observed slowdown was not a lack of effort; it was spending too much
of each run rediscovering context and producing small verified wrappers that
did not remove the current endpoint assumption.  The current process is:

1. Use `Live Goal Prompt V4` above before reading any archived route history.  Read
   older sections only when a named declaration cannot be found.
2. Start each proof packet by writing or checking the exact target statement in
   Lean.  This prevents proving a convenient lemma that does not compose into
   the source theorem.
3. Keep search bounded and blocker-specific.  Search must answer one concrete
   question, such as "how do I prove this prefix product is
   `AEStronglyMeasurable`?", not re-audit the entire optimization codebase.
4. Prefer one endpoint-moving theorem over several cosmetic wrappers.  Helper
   lemmas are fine when they are private to the packet or immediately consumed
   by the primary theorem.
5. Avoid Git churn during proof development.  Fetch/rebase at the start and
   once immediately before final push; if the second push race fails, report
   the verified local commit/base instead of restarting proof search.
6. Treat subagents as scoped accelerators, not a replacement for integration.
   Reuse or close stale completed agents before spawning new ones; new agents
   need read-only tasks or disjoint write ownership.
7. Never carry a dirty Lean theorem across a process update.  Either verify it
   with the focused Lean command or record the precise unresolved subgoal.

For the current ASGD frontier, acceptable primary packets are:

- prove the projected scalar bounded-martingale characteristic-function
  convergence to `exp (-(S_infty L L) t^2 / 2)` from the compiled conditional
  mean-zero, conditional second-moment, averaged variance convergence, uniform
  boundedness, Lindeberg, scalar Lévy, and projected Gaussian target layers;
- introduce a source-shaped scalar martingale characteristic-function
  structure only if it removes the existing supplied `projected_clt` field from
  an endpoint constructor and records the exact hard Taylor/product theorem
  still to discharge;
- connect a proved scalar characteristic-function packet through the existing
  Cramér-Wold/projected-Gaussian bridge into the Chewi Theorem 12.7 ASGD
  certificate.

Do not spend ASGD packet time redoing projected scaled sums, bounded-tail
Lindeberg discharge, Lévy conversion from characteristic functions, or Gaussian
target identification; those layers already compile.

## Multi-Agent And Worktree Routing

Use multiple agents only when they can reduce the critical path without
duplicating the main proof thread.

- Main thread: owns the active theorem statement, Lean integration, final
  verification, route-doc update, commit, and push.
- Mathlib scout: read-only search for exact APIs, theorem names, and nearby
  proof patterns.  It should return file paths and declaration names, not
  speculative rewrites.
- Local reuse scout: read-only search through `StatInference` for reusable
  probability, asymptotic, convex, and finite-sum wrappers.
- Source-anchor scout: read-only source mapping for theorem numbers, displayed
  equations, omitted proof steps, and external references when the textbook
  proof is incomplete.
- Lean worker: may edit only a disjoint new module or a clearly assigned file
  range.  It must not rewrite the main thread's active proof or revert another
  agent's changes.
- Verification scout: runs scans/builds after the packet has a stable diff and
  reports exact failures.

During heavy collaboration, keep broad packets in isolated book/lane worktrees.
Avoid sharing mutable `.lake/build` artifacts between active root builds.  If a
focused Lean check succeeds but a root build fails because another worktree
invalidated `.olean` files, treat that as build-artifact contention and rerun a
targeted module build before changing theorem code.

## Manual Run Operating Loop

Use this shorter loop for each live `/goal` turn.  It is stricter than the
archived automation prompts and should override them when they conflict.

1. Orient once.  Check the worktree status, `origin/main`, the latest local
   Optimization commit, and this file's `Live Goal Prompt V4`.  Do not
   spend the proof budget rereading old archived prompts unless a named
   dependency is missing.
2. State the packet.  Before editing Lean, name one primary theorem-sized
   target, the exact module to edit, the expected verification command, and the
   fallback blocker statement if the proof does not close.
3. Reuse before invention.  Read cached search notes here first.  Then run at
   most one bounded search pass for the active blocker.  Record only search
   results that change the route or prevent duplicate primitives.
4. Keep the main thread on the proof.  If subagents are explicitly authorized,
   use them for read-only scouting or disjoint adjacent proof files; the main
   thread owns the active theorem, integration, and final verification.
5. Prefer endpoint packets.  Bundle small algebra/interface lemmas into the
   theorem packet that uses them.  A wrapper-only packet is acceptable only if
   it removes a blocker for the current endpoint or replaces a supplied
   interface with verified assumptions.
6. Verify in tiers.  Run focused `lake env lean` repeatedly while proving,
   then `lake build StatInference.Optimization.<Module>` after the public
   theorem layer compiles.  Use root `lake build StatInference` only after
   root-import or broad cross-module changes.
7. Push once.  After code, material docs, proof-hole scan, and secret scan pass,
   fetch/rebase once immediately before pushing.  If the push is rejected,
   rebase once, rerun the focused build and scans, then push again.  If it is
   rejected again because other textbook lanes are racing, keep the verified
   local packet and report the exact commit/base instead of restarting the
   search loop.
8. Block sharply.  If the primary proof cannot close, leave behind a precise
   blocker: the theorem statement attempted, the failing Lean subgoal shape or
   missing API, the APIs already searched, and the next two viable routes.
   Avoid vague "next small gap" language.

## Current Frontier Contract

This is the authoritative manual route for the current `/goal` run.  The
app-level `/goal` objective and archived prompts still mention older Chapter 3
or ASGD frontiers; do not use those references to choose work unless the user
explicitly switches lanes.

Stable substrate:

- Chapters 3-12 are reusable infrastructure for now; do not reopen ASGD,
  SMPGD, Sinkhorn, or deterministic-rate packaging unless Chapter 13 stalls or
  the user redirects.
- Chapter 13 `InteriorPoint.lean` is stable through the logarithmic barrier
  example, supplied-Hessian local/dual norm, Dikin ellipsoid, Newton
  step/decrement, scalar Gronwall, concrete segment `ψ_v(t)` bridge,
  exponential Hessian bounds, and local-norm sandwich consumers.
- Search-first result for this packet: mathlib/local code has no direct Chewi
  Hessian-stability theorem and no direct derivative theorem for
  `fun t => inner ℝ v (hess (hessianSegmentPoint x y t) v)`.  The reusable
  path is the compiled Frechet-Hessian derivative bridge using
  `HasFDerivAt.comp_hasDerivAt`, `HasDerivAt.clm_apply`, and
  `HasDerivAt.inner`.

Current priority packet sequence:

1. `Chapter13-Lemma13.6-source`: construct
   `HessianSegmentMixedThirdLocalNormCertificate` from source hypotheses by
   proving the segment coefficient/local-norm estimate, Hessian continuity on
   the segment, and the mixed-third self-concordance bound from a real
  third-derivative or `iteratedFDeriv` representation.  Segment membership and
  `ψ` continuity are now compiled from convexity plus `ContinuousOn hess s`;
  do not spend another packet on those fields.
2. `Chapter13-Lemma13.6-statement`: consume
   `localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate` to
   state/prove the source-shaped Lemma 13.6(4) local-norm sandwich.
3. `Chapter13-Newton`: use Lemma 13.6 to build the Newton decrement and
   Dikin-ellipsoid consequences, then continue the Chapter 13 theorem stack.

Execution rule for the next proof run: do not add more generic Gronwall or
`ψ` certificate plumbing.  Reuse
`hessianSegmentPoint_hasDerivAt`,
`hessianSegmentPsi_hasDerivAt_of_hasFDerivAt`,
`hessianSegmentPsi_hasDerivWithinAt_of_hasFDerivAt`,
`MixedThirdSelfConcordantOn`,
`HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn_of_hasFDerivAt`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt`,
and the mixed-third local-norm sandwich consumers.  The next proof should
attack the segment coefficient estimate and the true third-derivative
interpretation; if blocked, record the exact missing mathlib API or algebraic
subgoal and two viable routes.

Keep exercise statements and cheap reusable exercise proofs in
`StatInference/Optimization/Exercises.lean`, but never let exercises block the
main-text theorem lane.

The current scout map says:

- Chapters 6-8 should start with local `Subgradient.lean`,
  `ProjectedSubgradient.lean`, `FrankWolfe.lean`, and `Proximal.lean`,
  using source-shaped algorithmic interfaces before heavy extended-real
  convex analysis.
- Chapters 9-11 should start with `Fenchel.lean`, `Bregman.lean`,
  `MirrorDescent.lean`, and `AlternatingBregman.lean`, emphasizing
  the now-started finite-valued Fenchel-Young/double-conjugate,
  convexity-smoothness duality, Bregman divergence, relative
  convexity/smoothness, and ABP telescoping wrappers.
- Chapters 12-13/Appendix A should continue from `StochasticGradient.lean` and
  `ASGD.lean`, then open `MatrixOrder.lean`, `Newton.lean`, and
  `SelfConcordance.lean`, reusing local empirical/probability wrappers plus
  mathlib matrix/spectral and finite-dimensional APIs.

## Archived Manual Goal Prompt

The active app-level `/goal` text is immutable in the current tool surface
except for marking the goal complete.  Since the full textbook formalization is
not complete, the current frontier contract above is the live replacement
prompt for manual goal runs.  The old long prompt below is preserved only as
history and may contain stale commits, solved targets, and archived route
context.

Archived long replacement `/goal` prompt after pushed frontier `029d017`
(`Add Chewi ASGD scaled noise interfaces`) and the Chapter 12 finite sampled
rate packet, smooth integral-L2 sampled-model endpoint packet, smooth
Bochner-unbiased growth/star-upper packet, non-smooth source-L2 sampled
endpoint packet, smooth source variance-bound bridge for Chewi Theorem 12.1
SMPGD, the non-smooth relative-subgradient growth/star-upper bridge, the final
smooth/non-smooth weighted stochastic averaged-iterate wrappers, the exact
source-displayed stochastic-error RHS bridges, and the full source-displayed
smooth/non-smooth averaged-iterate wrappers, plus the filtration-level
conditional-mean wrappers and the first ASGD quadratic-decomposition algebra
packet, the first ASGD probabilistic CLT handoff packet, and the
martingale-CLT certificate/covariance package, plus the exact scaled-noise and
averaged-conditional-covariance definitions:
aggressively formalize and prove all main theorem content of Sinho Chewi's
Optimization 2026 notes in Lean under
`StatInference/Optimization`, with exercise statements and cheap reusable
exercise proofs kept in `StatInference/Optimization/Exercises.lean` without
slowing the main-text theorem lane.  Do not route back to stale Chapter 3/4/5
setup, solved Chapter 6 lower-bound/feasibility infrastructure, Chapter 7
Frank-Wolfe, Chapter 8 PGD/APGD, or already-compiled Chapter 9 Fenchel/Bregman
substrate unless an exact source report or later theorem dependency demands it.
Do not spend a run on wording-only route churn or a single wrapper when a
theorem-sized packet is available.  Treat Chapters 3-8 as stable reusable
infrastructure, Chapter 9/10/11.2-11.4 as reusable Bregman/MPGD/ABP/AM
substrate, `StatInference/Optimization/RandomizedAlternatingMinimization.lean`
as stable through the source-shaped Chewi Theorem 11.5 strong/weak RAM rates,
`StatInference/Optimization/AlternatingBregman.lean` as stable through the
Theorem 11.7 ABP/Pinsker selector layer and the Theorem 11.8
Sinkhorn/mirror-descent certificate endpoint,
`StatInference/Optimization/StochasticGradient.lean` as stable through the
conditional-mean SMPGD source wrappers, and
`StatInference/Optimization/ASGD.lean` as the current Chapter 12 active theorem
gate.

Immediate aggressive target: move from the now-compiled ASGD finite-sum
decomposition algebra, Slutsky/continuous-mapping handoff, process-level
martingale-difference/covariance interfaces, supplied martingale-CLT
certificate, covarianceBilinDual/table pushforward package, exact scaled
martingale sum, averaged conditional covariance interface, and
conditional-expectation integral bridges toward the actual Theorem 12.7 proof
obligations: derive the supplied CLT certificate from bounded martingale
differences and the averaged conditional covariance convergence interface,
then connect it to the source quadratic ASGD recurrence.  Theorem 12.1 SMPGD
now sits on
top of the compiled
integral-component final-rate wrappers, the smooth L2 noise wrapper, the
finite sampled smooth/pointwise-bounded non-smooth rate endpoints, the
non-smooth `(12.2)` source-L2 endpoint, the smooth `(12.1)` variance-root
bridge, and the compiled final smooth/non-smooth weighted stochastic
averaged-iterate wrappers with exact displayed stochastic-error constants.  Do
not redo the 10.11
average-gap telescope, the 11.5 RAM recurrences, the 11.7 selector wrappers,
the 11.8 certificate endpoint, the Chapter 12 weighted-average algebra, the
compiled smooth/non-smooth scalar rate wrappers, expected-model one-step
algebra, RMS wrappers, component-to-`hcore` scalar algebra, finite-support
component wrappers, or the verified Bochner `integral_mono_ae` transport
wrappers, the verified L2/Hölder noise bound, or the verified sampled
`ψ_x` raw inequalities, finite sampled growth, relative-smoothness absorption,
finite unbiased star-upper averaging, finite sampled smooth `hcore`, finite
sampled smooth rate endpoint, finite sampled pointwise-bounded non-smooth
`hcore`, finite sampled pointwise-bounded non-smooth rate endpoint, smooth
integral-L2 sampled-model `hcore`, smooth integral-L2 sampled-model
weighted-average endpoint, Bochner sampled growth wrapper, Bochner unbiased
star-upper wrapper, or smooth unbiased integral-L2 sampled-model
weighted-average endpoint, probability L2-to-L1 average bridge, non-smooth
source-L2 sampled `hcore`, non-smooth source-L2 sampled weighted-average
endpoint, smooth source variance-bound wrapper, non-smooth
relative-subgradient growth/star-upper wrapper, or the Jensen/center-mass
transport from weighted expected gaps to the weighted stochastic averaged
iterate, the final smooth/non-smooth weightedSampleAverage wrappers, the
source-displayed `(1 + alphaG * h)` error-factor upgrade, the full
source-displayed averaged-iterate wrappers, or the filtration conditional-mean
handoff to unconditional unbiasedness/relative-subgradient mean fields, or the
ASGD `(12.5)` finite-sum splitting/scaled-average algebra, or the ASGD
continuous-mapping/Slutsky handoff from the martingale CLT term plus
`o_P(1)` initial/remainder terms to the averaged-iterate weak limit, or the
new supplied martingale-CLT/covariance certificate package, or the exact
scaled-noise/averaged-covariance definitions and their conditional-expectation
integral consequences.  First search local
`MirrorDescent.lean`, `Bregman.lean`, `ProjectedSubgradient.lean`,
`StochasticGradient.lean`, `ASGD.lean`, local probability/expectation and
asymptotic-statistics wrappers, and pinned mathlib expectation/Jensen/
conditional expectation/Bochner/L2/process/martingale/covariance APIs.  The
quadratic ASGD recurrence/unrolling layer now compiles through the ordered
transition product, Chewi's `M_k^n` triangular regrouping, the split around
`A^{-1}`, and the `sqrt N`-scaled display, so the next ASGD primitive is the
source-shaped bounded martingale CLT proof/certificate constructor from the
already-defined process/covariance interfaces.
Keep the concrete Sinkhorn row/column KL identity layer as the next Chapter
11.8 blocker, but do not let it stall Chapter 12 coverage.

Fresh search-first result for the Chapter 11.8 concrete blocker: local
Optimization now has the 11.7 Sinkhorn selectors and 11.8
Sinkhorn/mirror-descent certificate endpoint in `AlternatingBregman.lean`,
plus the 11.8 last-iterate wrappers in `MirrorDescent.lean`; local probability
support has product-law and marginal expectation wrappers in
`StatInference/ProbabilityMeasure` and `StatInference/ProbabilityTheory`;
pinned mathlib has
`Mathlib.InformationTheory.KullbackLeibler.Basic`,
`Mathlib.InformationTheory.KullbackLeibler.ChainRule`, and
`Mathlib.MeasureTheory.Integral.Marginal`.  No local concrete row/column
Sinkhorn normalization KL identity was found, so that is the next missing
formal layer before the concrete source-shaped 11.8 statement.  Fresh
search-first result for Chapter 12: no local SMPGD theorem existed; reuse the
compiled Chapter 10 MPGD recurrence/weighted-denominator infrastructure,
`DiscreteGronwall.lean`, local finite averaging/Jensen APIs, mathlib
`ConvexOn.map_centerMass_le`, `eventually_finset_ball`,
`integrable_finsetSum`, `integral_finsetSum`, `integral_const_mul`, and local
probability modules for later expectation-side discharges.

Latest verified Optimization proof frontier:
the current finite sampled endpoint packet verifies the smooth and
pointwise-bounded non-smooth sampled rate layer in
`StatInference/Optimization/StochasticGradient.lean` with
`weightedSumBound_of_gronwall_negative_forcing_with_error`,
`weightedAverageGap_le_of_gronwall_negative_forcing_with_error`, and
`chewi121_weightedAverageGap_le_of_oneStep`, plus the newly compiled
`chewi121_weightedAverageGap_le_of_source_oneStep`,
`chewi121_weightedAverageGap_le_geometric_of_source_oneStep`,
`chewi121_smooth_weightedAverageGap_le_of_source_oneStep`, and
`chewi121_nonsmooth_weightedAverageGap_le_of_source_oneStep`, the expected
model packet `chewi121_source_oneStep_of_model_bounds` and
`chewi121_weightedAverageGap_le_geometric_of_model_bounds`, and the newest
expected-lower-model packet
`chewi121_smooth_next_lower_of_expected_model_error`,
`chewi121_nonsmooth_next_lower_of_expected_model_error`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_model_bounds`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_model_bounds`, plus the
newest RMS analytic packet
`chewi121_smooth_young_lower_bound`,
`chewi121_smooth_expected_model_lower_of_rms_bound`,
`chewi121_nonsmooth_expected_model_lower_of_rms_bound`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_rms_model_bounds`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_rms_model_bounds`, plus
the component-level wrappers `chewi121_smooth_hcore_of_expected_components`,
`chewi121_nonsmooth_hcore_of_expected_components`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_component_model_bounds`,
and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_component_model_bounds`,
and the current finite-support expectation packet
`chewi121_smooth_finite_raw_component_bound`,
`chewi121_smooth_finite_absorb_component_bound`,
`chewi121_finite_mirror_lower_component_bound`,
`chewi121_nonsmooth_finite_raw_component_bound`,
`chewi121_finite_linear_component_bound`,
`chewi121_smooth_hcore_of_finite_components`,
`chewi121_nonsmooth_hcore_of_finite_components`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_finite_components`,
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_components`,
and the Bochner-integral expectation packet
`chewi121_smooth_integral_raw_component_bound`,
`chewi121_smooth_integral_absorb_component_bound`,
`chewi121_integral_mirror_lower_component_bound`,
`chewi121_nonsmooth_integral_raw_component_bound`,
`chewi121_integral_linear_component_bound`,
`chewi121_smooth_hcore_of_integral_components`,
`chewi121_nonsmooth_hcore_of_integral_components`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_components`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_components`,
plus the smooth L2/Hölder probability packet
`chewi121_integral_noise_bound_of_l2_roots`,
`chewi121_smooth_hcore_of_integral_l2_noise_components`, and
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_noise_components`,
plus the sampled-model bridge packet
`chewi121_smooth_raw_point_of_sampled_model`,
`chewi121_nonsmooth_raw_point_of_sampled_model`,
`chewi121_smooth_absorb_of_relativeSmoothOn`,
`chewi121_finite_sampled_growth_of_steps`, and
`chewi121_finite_sampled_star_upper_of_unbiased`, plus the newest finite
sampled endpoint packet
`chewi121_smooth_hcore_of_finite_sampled_models`,
`chewi121_nonsmooth_hcore_of_finite_sampled_models`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_finite_sampled_models`,
and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_sampled_models`,
plus the smooth integral-L2 sampled-model packet
`chewi121_smooth_hcore_of_integral_l2_sampled_models` and
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models`,
plus the smooth Bochner-unbiased packet
`chewi121_integral_sampled_growth_of_steps`,
`chewi121_integral_sampled_star_upper_of_unbiased`, and
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_unbiased`,
plus the smooth source variance-bound packet
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_unbiased_of_variance_bound`,
plus the non-smooth source-L2 sampled packet
`chewi121_integral_average_le_l2_root_of_probability`,
`chewi121_nonsmooth_hcore_of_integral_l2_sampled_models`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models`,
plus the non-smooth relative-subgradient packet
`IsRelativeSubgradientAt`,
`IsRelativeSubgradientAt.lower_model`,
`chewi121_integral_sampled_star_upper_of_relativeSubgradient`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_relativeSubgradient`,
plus the weighted stochastic averaged-iterate packet
`weightedSampleAverage`,
`integral_weightedSampleAverage_gap_le_of_weighted_gap_bound`, and
`chewi121_weightedSampleAverage_gap_le_geometric_of_weightedAverageGap`, plus
the final smooth/non-smooth source-shaped wrappers
`chewi121_smooth_weightedSampleAverage_gap_le_geometric_of_integral_l2_sampled_models_unbiased_of_variance_bound`
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_geometric_of_integral_l2_sampled_models_relativeSubgradient`,
plus the exact source-displayed RHS bridges
`chewi121_smooth_displayed_error_rhs_of_stronger`,
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_stronger`,
`chewi121_nonsmooth_displayed_error_rhs_of_stronger`, and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_stronger`, plus
the full source-displayed averaged-iterate wrappers
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_integral_l2_sampled_models_unbiased_of_variance_bound`
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_integral_l2_sampled_models_relativeSubgradient`,
plus the conditional-expectation/process bridge declarations
`integral_eq_const_of_condExp_ae_eq_const`,
`integral_eq_const_of_filtration_condExp_ae_eq_const`,
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_filtration_condExp_unbiased_of_variance_bound`,
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_filtration_condExp_relativeSubgradient`.
This proves the source recurrence-to-rate algebra, smooth/non-smooth
stochastic error instantiations, the expected-model algebra turning Chewi's
three `psi_x` bounds into the displayed SMPGD one-step recurrence, the direct
handoff from expected `E F(x+)` lower estimates to the closed weighted-average
rates, the scalar RMS/Young algebra used in Chewi's displayed smooth and
non-smooth lower estimates, and the deterministic component-to-`hcore`
assembly for both smooth and non-smooth SMPGD, including a finite-support
stochastic-gradient route, a general Bochner-integral route from supplied
a.e. model inequalities to the final weighted-average rate, the sampled
`ψ_x` raw/growth/star-upper finite bridge, and the finite sampled smooth and
pointwise-bounded non-smooth endpoints, and the smooth sampled source-L2 route
to the final weighted-average rate with growth and star-upper no longer
supplied fields, the smooth `(12.1)` source variance-root specialization, and
the non-smooth source-L2 route from `(12.2)` to the final weighted-average rate
with growth/star-upper no longer supplied once the mean sampled oracle is a
relative subgradient.  The remaining Theorem 12.1 blocker is now not integral
transport, smooth Cauchy-Schwarz/Hölder, finite unbiased star averaging,
finite sampled model assembly, smooth sampled L2 endpoint assembly, Bochner
sampled growth, Bochner unbiased star-upper transport, smooth `(12.1)`
variance domination, non-smooth relative-subgradient star upper, or the
non-smooth `(12.2)` sampled lower-model/rate endpoint, or the Jensen
transition from weighted expected gaps to the weighted stochastic averaged
iterate, the final smooth/non-smooth weightedSampleAverage wrappers, or the
exact source-displayed stochastic-error RHS factor, or the full
source-displayed averaged-iterate wrappers, or the filtration conditional-mean
handoff, or the ASGD `(12.5)` finite-sum splitting/scaled-average algebra; it
handoff, or the ASGD `(12.5)` finite-sum splitting/scaled-average algebra, or
the first ASGD continuous-mapping/Slutsky weak-limit handoff, or the
process-level martingale-difference/covariance interfaces and supplied CLT
certificate/covariance-pushforward package, or the exact scaled-noise/
averaged-covariance definitions and conditional-expectation integral bridges,
or the exact source quadratic ASGD one-step recurrence, ordered transition
product, finite unrolling, averaged nested unrolling, triangular regrouping
into Chewi's `M_k^n` coefficients, split around `A^{-1}`, or `sqrt N`-scaled
display; it is now the ASGD martingale proof frontier: build the bounded
martingale CLT constructor, then connect the exact scaled noise sum and source
decomposition to the Theorem 12.7/12.3 endpoint.

Fresh Chapter 12 ASGD recurrence search result: local Optimization had no
source-shaped ASGD unrolling theorem, and pinned mathlib gives generic
noncommutative `List`/monoid product and `Finset.sum_range_succ`/`sum_Ico`
APIs but no ordered continuous-linear-map recurrence package.  The local
solution therefore uses a recursive ordered endomorphism product rather than
`Finset.prod`, since CLM composition is order-sensitive.

Fresh Chapter 12 ASGD triangular-sum search result: mathlib's
`Finset.sum_comm'`, `Finset.sum_Ico_eq_sum_range`, and
`ContinuousLinearMap.sum_apply` discharge the source regrouping without a
custom finite-sum induction.  Reuse those APIs for any later `M_k^n`
coefficient refinement.

Fresh Chapter 12 Bochner search result: mathlib has `integral_mono_ae` and
`integral_mono` for pointwise or a.e. real integral inequalities,
`ContinuousLinearMap.integral_comp_comm` and `integral_inner` for moving
linear maps/inner products through Bochner integrals, and
`integral_mul_le_Lp_mul_Lq_of_nonneg` with `Real.HolderConjugate.two_two` for
the scalar L2 Cauchy-Schwarz/Hölder step.  The integral transport part now
compiles through the `chewi121_*_integral_*` wrappers, so future work should
reuse those declarations rather than adding more copies of integral algebra.
The L2/Hölder noise part now compiles through
`chewi121_integral_noise_bound_of_l2_roots`, with the typeclass instance
`Real.HolderConjugate.two_two.ennrealOfReal` used for `MemLp.integrable_mul`.
Local reuse remains
`Bregman.lean`'s `RelativelySmoothOn.upper_model` and
`RelativelyStrongConvexOn.lower_model`, `MirrorDescent.lean`'s
`bregmanDivergence_lower_of_firstOrderStrongConvexOn`, and local product
expectation wrappers in `StatInference/ProbabilityMeasure/ProductMeasure.lean`.
The previous verified `StatInference/Optimization/AlternatingBregman.lean`
packet adds
`IsChewi118SinkhornMirrorDescentCertificate`,
`IsChewi118SinkhornMirrorDescentCertificate.last_rowMarginalKL_le`, and
`chewi118_sinkhorn_last_rowMarginalKL_le_of_mirrorDescent`.  This packet turns
the generic 11.8 last-iterate wrapper into the source-shaped Sinkhorn endpoint:
once the finite KL normalization identities supply the certificate fields, the
last `X`-marginal KL is bounded by
`KL(gammaStar || gamma^0) / N`.
`StatInference/Optimization/MirrorDescent.lean` verifies
`chewi118_last_gap_le_of_recurrence` and `chewi118_last_gap_le_of_oneStep`.
These two wrappers derive Chewi Theorem 11.8's last-iterate `D_0 / N` rate
from a zero-error Bregman descent recurrence plus monotonicity of the displayed
objective/KL gaps.
`StatInference/Optimization/RandomizedAlternatingMinimization.lean` compiles
the Chewi 11.5 strong and weak scalar expected-gap certificates, nonnegative
weak wrappers, and Hopf-Lax bridge wrappers:
`chewi115_strong_one_step_of_hopf_lax_gap_bound`,
`IsChewi115RAMStrongHopfLaxCertificate`,
`IsChewi115RAMStrongHopfLaxCertificate.toGapCertificate`,
`IsChewi115RAMStrongHopfLaxCertificate.gap_le_geometric`,
`chewi115_zero_one_step_of_hopf_lax_gap_bound`,
`IsChewi115RAMZeroHopfLaxCertificate`,
`IsChewi115RAMZeroHopfLaxCertificate.toGapCertificate`,
`IsChewi115RAMZeroHopfLaxCertificate.gap_le_source_rate_nonneg`, and
`IsChewi115RAMZeroHopfLaxCertificate.gap_le_eps_nonneg`.  The strong bridge
turns Chewi's conditional-expectation display plus the Hopf-Lax contraction
`hopfGap <= ((1-alphaF)/(1+alphaG))*gap` into the geometric RAM certificate.
The weak bridge turns the zero-curvature Hopf-Lax estimate
`hopfGap <= (1 - gap/(2*Rbeta^2))*gap` into the inverse-gap RAM certificate,
reusing the compiled Chapter 11.4 telescope.  The newest block-model layer
adds `chewi115_uniform_average_le_of_block_model`,
`chewi115_conditional_gap_upper_of_averaged_model`,
`chewi115_conditional_gap_upper_of_block_model`, and
`chewi115_conditional_upper_of_block_model_sequence`, turning pointwise
per-block smooth model estimates, finite `Fin D` sums, first-order convexity,
and a selected Hopf-Lax model value into the exact `conditional_upper` field
for `expectedGap`/`hopfGap`.  The newest Exercise 9.3 interpolation packet adds
`chewi93_hopf_lax_strong_gap_bound_of_interpolant`,
`chewi93_hopf_lax_zero_gap_bound_of_interpolant`,
`chewi115_strong_hopf_lax_bound_of_chewi93`, and
`chewi115_strong_hopf_lax_bound_of_interpolant`, proving the positive-curvature
quadratic cancellation, the zero-curvature optimized-interpolant algebra, and
the source factor rewrite
`(1 + (alphaF + alphaG)/(1-alphaF))^{-1} = (1-alphaF)/(1+alphaG)`.  The newest
source-candidate packet adds `chewi93_selected_model_value_le_interpolant`,
`chewi115_strong_selected_model_value_le_interpolant`, and
`chewi115_zero_selected_model_value_le_interpolant`, turning Chewi's Exercise
9.3 test point into the exact strong/zero `hmodel_interp` displays.  The newest
source-certificate packet adds `chewi93_hopf_lax_zero_gap_bound_of_radius`,
`chewi115_zero_hopf_lax_bound_of_interpolant`,
`chewi115_strong_hopf_lax_certificate_of_interpolants`, and
`chewi115_zero_hopf_lax_certificate_of_interpolants`, so the strong and weak
RAM Hopf-Lax certificate fields can now be built directly from source
interpolant bounds plus the block conditional upper theorem.  The newest
block-selected assembly packet adds
`chewi115_strong_hopf_lax_certificate_of_block_model_interpolants` and
`chewi115_zero_hopf_lax_certificate_of_block_model_interpolants`, which combine
the finite block-model conditional upper layer with the selected
Hopf-Lax/Moreau interpolation estimate to produce the exact strong and weak RAM
certificates.  The newest direct source-candidate assembly packet adds
`chewi115_strong_hopf_lax_certificate_of_block_model_source_candidates` and
`chewi115_zero_hopf_lax_certificate_of_block_model_source_candidates`, so the
block model plus Chewi's selected Exercise 9.3 test point now produce strong
and weak RAM Hopf-Lax certificates without an intermediate supplied
`hmodel_interp`.  The newest displayed-rate packet adds
`chewi115_strong_rate_of_block_model_source_candidates` and
`chewi115_zero_rate_of_block_model_source_candidates`, proving the source
Theorem 11.5 geometric rate and weak `2 * D * R_beta^2 / N` rate directly from
the block model plus selected source-candidate assumptions.  The newest
Sinkhorn selector packet in `AlternatingBregman.lean` adds
`chewi117_exists_sinkhorn_marginal_errors_le_of_abp`, combining the compiled
Lemma 11.2 finite-minimum wrapper with supplied Pinsker lower bounds to produce
the selected marginal-error iterate for Theorem 11.7.  The newest source-shaped
selectors add `chewi117_exists_sinkhorn_full_iterate_error_sum_le_of_abp` and
`chewi117_exists_sinkhorn_half_iterate_error_sum_le_of_abp`, choosing
respectively the column-correct full iterate `gamma^n` or row-correct half
iterate `gamma^(n+1/2)` and proving the displayed total marginal-error bound
from one finite marginal identity plus one Pinsker/KL lower bound.
The newest finite Sinkhorn KL packet in `AlternatingBregman.lean` adds
`finiteKL`, `finiteCouplingKL`, `rowMarginal`, `columnMarginal`,
`rowNormalizedCoupling`, `columnNormalizedCoupling`,
`rowMarginal_rowNormalizedCoupling`,
`columnMarginal_columnNormalizedCoupling`,
`finiteCouplingKL_eq_finiteKL_of_row_ratio`,
`finiteCouplingKL_eq_finiteKL_of_column_ratio`,
`finiteCouplingKL_rowNormalizedCoupling_eq_finiteKL`, and
`finiteCouplingKL_columnNormalizedCoupling_eq_finiteKL`, proving the finite
row/column normalization KL identities behind Theorem 11.7/11.8 under explicit
nonzero support/denominator assumptions.
The newest entropic-Bregman packet adds `finiteCouplingMass`,
`finiteCouplingEntropy`, `finiteCouplingLogGradient`,
`finiteCouplingEntropyBregman`,
`finiteCouplingEntropyBregman_eq_finiteCouplingKL`,
`finiteCouplingMass_rowNormalizedCoupling`,
`finiteCouplingMass_columnNormalizedCoupling`,
`rowNormalizedCoupling_ne_of_ne`, `columnNormalizedCoupling_ne_of_ne`,
`finiteCouplingEntropyBregman_rowNormalizedCoupling_eq_finiteKL`, and
`finiteCouplingEntropyBregman_columnNormalizedCoupling_eq_finiteKL`.  This
turns the finite row/column normalization identities into the entropic Bregman
movement terms used by the Sinkhorn-as-ABP/Mirror-Descent route; the remaining
11.8 concrete work is the zero-error recurrence, monotone marginal-KL fields,
and any source support/positivity package.
The newest finite-array endpoint packet adds
`IsChewi118FiniteSinkhornEntropyCertificate`,
`IsChewi118FiniteSinkhornEntropyCertificate.last_rowMarginalKL_le`, and
`chewi118_finiteSinkhorn_last_rowMarginalKL_le_of_entropyCertificate`,
reusing `chewi118_last_gap_le_of_recurrence` to provide the Theorem 11.8
last-iterate KL rate directly over curried finite Sinkhorn arrays.
The newest finite Sinkhorn 11.8 packet adds `finiteKL_self`,
`sum_rowMarginal_eq_finiteCouplingMass`,
`sum_columnMarginal_eq_finiteCouplingMass`,
`rowMarginal_nonneg_of_nonneg`, `columnMarginal_nonneg_of_nonneg`,
`sinkhornRowObjective`, `sinkhornRowObjective_eq_zero_of_rowMarginal_eq`,
`finiteKL_term_lower`, `finiteKL_nonneg_of_nonneg_of_pos_of_sum_eq`,
`sinkhornRowObjective_nonneg_of_nonneg_of_pos_of_mass_eq`,
`finiteCouplingKL_nonneg_of_nonneg_of_pos_of_mass_eq`,
`finiteCouplingEntropyBregman_nonneg_of_pos_of_mass_eq`,
`IsChewi118FiniteSinkhornEntropyCertificate.of_initialCouplingKL`,
`chewi118_finiteSinkhorn_last_rowMarginalKL_le_of_entropyRecurrence_initialKL`,
`IsChewi118FiniteSinkhornEntropyCertificate.of_initialCouplingKL_and_terminal_pos`,
`chewi118_finiteSinkhorn_last_rowMarginalKL_le_of_entropyRecurrence_pos_initialKL`,
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_entropyRecurrence_pos_initialKL`,
and
`chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_entropyRecurrence_pos_initialKL`.
This discharges terminal Bregman nonnegativity from positive equal-mass
couplings, identifies the initial Bregman term with the source
`KL(gammaStar || gamma^0)`, and states Theorem 11.8 in the displayed
`KL(rowMarginal gamma^N || mu)` orientation.  Fresh search-first result:
mathlib has measure-level KL/data-processing material in
`Mathlib.InformationTheory.KullbackLeibler.*` and convex Jensen APIs, but no
ready finite curried-array Sinkhorn/log-sum theorem.  The newest
data-processing packet proves the missing finite real-array bridge directly:
`finiteKL_logSum_term_le`, `finiteKL_row_logSum_le`,
`finiteKL_rowMarginal_le_finiteCouplingKL_of_pos`,
`finiteKL_rowMarginal_le_finiteCouplingKL_of_rowMarginal_eq_of_pos`, and
`sinkhornRowObjective_le_finiteCouplingKL_of_rowMarginal_eq_of_pos`, plus
positive row/column marginal lemmas for positive nonempty finite arrays.  The
newest recurrence bridge packet adds
`rowNormalizedCoupling_pos_of_pos`, `columnNormalizedCoupling_pos_of_pos`,
`sinkhornRowObjective_columnNormalized_le_entropyBregman`,
`chewi118_entropy_one_step_of_columnNormalized_projection_decrease`, and
`chewi118_entropy_one_step_trajectory_of_columnNormalized_projection_decrease`.
This turns a supplied column-normalization Pythagorean/projection decrease
into the exact Theorem 11.8 one-step recurrence with the concrete
`sinkhornRowObjective` gap.  The newest finite projection certificate packet
adds `IsFiniteCouplingEntropyProjectionStep`,
`finiteCouplingEntropyProjection_two_step_decrease`,
`chewi118_entropy_one_step_of_finiteEntropyProjectionSteps_columnNormalized`,
and
`chewi118_entropy_one_step_trajectory_of_finiteEntropyProjectionSteps_columnNormalized`.
This closes the projection-decrease field at the supplied finite-certificate
level.  The newest concrete Sinkhorn normalization packet adds
`finiteRowMarginalConstraint`, `finiteColumnMarginalConstraint`,
`finiteCouplingEntropyBregman_add_eq_of_row_log_diff`,
`finiteCouplingEntropyBregman_add_eq_of_column_log_diff`,
`rowNormalizedCoupling_log_sub_log_eq`,
`columnNormalizedCoupling_log_sub_log_eq`,
`isFiniteCouplingEntropyProjectionStep_rowNormalized`,
`isFiniteCouplingEntropyProjectionStep_columnNormalized`,
`chewi118_entropy_one_step_of_concreteSinkhornNormalizations`, and
`chewi118_entropy_one_step_trajectory_of_concreteSinkhornNormalizations`.
This discharges the previous actual-normalization projection-certificate
blocker and gives the zero-error Theorem 11.8 one-step recurrence for concrete
finite row-then-column Sinkhorn cycles.  The newest source-rate wrapper adds
`chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations`,
which feeds the concrete trajectory equation into the existing
finite-entropy last-iterate rate theorem, derives the initial/terminal
equal-mass side conditions from the target marginals and the final column
normalization step, and leaves only the source monotone-row-objective field as
the remaining concrete 11.8 rate blocker.  The newest monotonicity adapter
adds `chewi118_last_le_of_antitone`,
`chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations_antitone`,
and
`chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations_succ_le`,
reducing the certificate field to adjacent nonincrease of the displayed row
objective along the concrete Sinkhorn trajectory.
The newest literal KL display packet adds
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations`,
`chewi118_finiteSinkhorn_exists_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations`,
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations_antitone`,
and
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations_succ_le`.
These wrappers unfold `sinkhornRowObjective` at the theorem boundary, so the
concrete finite Sinkhorn Theorem 11.8 endpoints are now stated directly in the
source orientation `finiteKL (rowMarginal gamma^N) mu` or selected successor
row-marginal KL.
The newest selected-rate packet adds `chewi118_exists_gap_le_of_recurrence`,
`chewi118_exists_gap_le_of_oneStep`,
`chewi118_finiteSinkhorn_exists_rowMarginalKL_le_of_entropyRecurrence_initialKL`,
`chewi118_finiteSinkhorn_exists_rowMarginalKL_le_of_entropyRecurrence_pos_initialKL`,
`chewi118_finiteSinkhorn_exists_sinkhornRowObjective_le_of_entropyRecurrence_pos_initialKL`,
and
`chewi118_finiteSinkhorn_exists_sinkhornRowObjective_le_of_concreteSinkhornNormalizations`.
This proves a Chewi 11.8 selected-iterate `D_0 / N` rate for concrete finite
row-then-column Sinkhorn cycles without any row-objective monotonicity
assumption, now also in literal row-marginal KL form.  Exact last-iterate
reporting still needs the adjacent row-marginal KL nonincrease/source proof,
but the selected-rate theorem can now be used immediately when the source
statement permits an existential iterate.
`MirrorDescent.lean` now
compiles through
`mirrorProximalGradientModel`, `IsMirrorProximalGradientStep`,
`mirrorProximalGradientModel_le_composite_add_bregman`,
`composite_le_mirrorProximalGradientModel`,
`mirrorProximalGradient_oneStep_ineq`, `mirrorProximalGradient_descent`,
`IsMirrorProximalGradientTrajectory`, trajectory membership, and trajectory
one-step accessors.  The new rate packet adds the Chapter 10 scalar recurrence
and denominator layer:
`weightedSumBound_of_gronwall_negative_forcing_one`,
`finalGap_le_weighted_denominator_of_one_step`,
`finalGap_le_geometric_denominator_of_one_step`, `chewi109Lambda`,
`chewi109Rho`,
`chewi109_final_gap_le_geometric_denominator_of_oneStep`, and
`chewi109_final_gap_le_geometric_denominator_of_trajectory`.  The proof reuses
`Bregman.lean` relative lower/upper models, Lemma 10.7-style relative growth
as a supplied minimizer certificate, `Proximal.lean`'s `compositeObjective`,
and the local Chapter 3 geometric-weight/Gronwall APIs.
The previous 10.11 packet adds
`mirrorProximalGradient_nonsmooth_oneStep_ineq`,
`chewi1011_average_gap_le_of_recurrence`,
`chewi1011_average_gap_le_of_oneStep`,
`chewi1011_iterateAverage_gap_le_of_oneStep`,
`chewi1011_average_gap_le_of_trajectory`, and
`chewi1011_iterateAverage_gap_le_of_trajectory`.  It reuses
`ProjectedSubgradient.lean`'s `iterateAverage` and Jensen wrapper
`convex_value_iterateAverage_sub_le_average_gap`.  The newest local analytic
bridge adds `chewi1011_young_lower_bound`,
`mirrorProximalGradientModel_lower_of_bregman_bounds`,
`mirrorProximalGradient_nonsmooth_oneStep_ineq_of_bregman_bounds`,
`chewi1011_average_gap_le_of_trajectory_bregman_bounds`, and
`chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds`.  Thus the
opaque 10.11 model-lower-bound has been reduced to the two displayed source
estimates `D_f(x⁺,x) <= 2 L r` and
`D_phi(x⁺,x) >= alphaPhi/2 * r^2`.  The newest focused Lean-verified
step-size packet adds `chewi1011_stepsize_rhs_bound`,
`chewi1011_average_gap_le_of_oneStep_stepsize`,
`chewi1011_iterateAverage_gap_le_of_oneStep_stepsize`,
`chewi1011_average_gap_le_of_trajectory_bregman_bounds_stepsize`, and
`chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds_stepsize`,
closing the displayed
`h^2 = alphaPhi * R_phi^2 / (2 * L^2 * N)` corollary in supplied-interface
and trajectory forms.  The newest ordinary Hilbert-norm packet adds
`bregmanDivergence_le_two_mul_lipschitz_norm`,
`bregmanDivergence_lower_of_firstOrderStrongConvexOn`,
`mirrorProximalGradientModel_lower_of_lipschitz_norm`,
`chewi1011_average_gap_le_of_trajectory_lipschitz_norm`,
`chewi1011_iterateAverage_gap_le_of_trajectory_lipschitz_norm`,
`chewi1011_average_gap_le_of_trajectory_lipschitz_norm_stepsize`, and
`chewi1011_iterateAverage_gap_le_of_trajectory_lipschitz_norm_stepsize`.  This
produces the two source analytic estimates internally for the ordinary norm
from `LipschitzOnWith (Real.toNNReal L) f C`, `‖gradF (x n)‖ <= L`, and
`FirstOrderStrongConvexOn C phi gradPhi alphaPhi`.  The newest OMD packet adds
`onlineMirrorDescentModel`, `IsOnlineMirrorDescentStep`,
`IsOnlineMirrorDescentTrajectory`, trajectory accessors,
`chewi1013_young_lower_bound`,
`bregmanDivergence_nonneg_of_firstOrderStrongConvexOn`,
`onlineMirrorDescentModel_lower_of_norm_bound`,
`onlineMirrorDescent_oneStep_regret`,
`onlineMirrorDescent_regret_gap_sum_le_of_oneStep`,
`chewi1013_regret_bound_of_oneStep`,
`chewi1013_regret_bound_of_trajectory`,
`chewi1013_regret_bound_of_trajectory_norm_bound`,
`chewi1013_stepsize_rhs_bound`, and
`chewi1013_regret_bound_of_trajectory_norm_bound_stepsize`.  The newest
source-facing infimum packet adds
`chewi1013_regret_bound_inf_of_forall_comparator` and
`chewi1013_regret_bound_inf_of_trajectory_norm_bound_stepsize`, using Mathlib
`le_csInf` to convert the fixed-comparator theorem into Chewi's displayed
`inf_{y in C}` regret bound under nonempty `C` and a uniform initial Bregman
radius.  The new `AlternatingBregman.lean` module
is imported by `StatInference.lean` and compiles through
`IsBregmanProjectionStep`,
`IsAlternatingBregmanProjectionTrajectory`, trajectory membership accessors,
the two monotonicity halves
`alternatingBregmanProjection_star_x_le_star_y` and
`alternatingBregmanProjection_star_y_succ_le_star_x`, the combined monotonicity
wrapper, the one-cycle decrease
`alternatingBregmanProjection_cycle_decrease`,
`chewi112_finite_sum_with_terminal_le`, `chewi112_finite_sum_le`, and
`chewi113_exists_small_abp_cycle_gap`.  This proves the finite-source content
behind Lemma 11.2 and the finite-minimum display `(11.1)` in existential form.
The new `AlternatingMinimization.lean` module is imported by
`StatInference.lean` and compiles through `sum_range_succ_sub`,
`chewi114_inverse_gap_step_growth`,
`chewi114_inverse_gap_growth_of_quadratic_descent`,
`chewi114_gap_le_K_div_iterations_of_quadratic_descent`,
`chewi114_gap_le_eps_of_quadratic_descent`,
`chewi114_quadratic_descent_of_next_gap_sq`,
`chewi114_quadratic_descent_recurrence_of_source`,
`chewi114_gap_le_K_div_iterations_of_source_recurrence`, `chewi114A`,
`chewi114K`, `chewi114K_eq_four_chewi114A`,
`chewi114_gap_le_source_K_div_iterations`,
`chewi114_gap_le_source_K_div_iterations_of_source_recurrence`,
`chewi114_gap_le_eps_of_source_recurrence`,
`chewi114_next_gap_le_max_halving_quadratic_of_source`,
`chewi114_max_recurrence_of_source`,
`chewi114_source_max_recurrence_of_source`,
`chewi114_halving_of_max_recurrence_above_threshold`,
`chewi114_halving_of_source_above_threshold`,
`chewi114_gap_le_half_pow_mul_of_halving`,
`chewi114_source_halving_above_threshold`,
`IsChewi114AMSourceCertificate`,
`IsChewi114AMSourceCertificate.max_recurrence`,
`IsChewi114AMSourceCertificate.halving_above_threshold`,
`IsChewi114AMSourceCertificate.gap_le_half_pow_mul_of_threshold_phase`,
`IsChewi114AMSourceCertificate.gap_le_threshold_of_geometric_burnin`,
`IsChewi114AMSourceCertificate.gap_le_source_K_div_iterations_of_tail_half`,
`IsChewi114AMSourceCertificate.gap_le_eps_of_tail_half`,
`chewi114_source_recurrence_of_descent_energy`,
`IsChewi114AMDescentCertificate`,
`IsChewi114AMDescentCertificate.sourceCertificate`,
`IsChewi114AMDescentCertificate.max_recurrence`,
`IsChewi114AMDescentCertificate.gap_le_source_K_div_iterations_of_tail_half`,
`IsChewi114AMDescentCertificate.gap_le_eps_of_tail_half`,
`chewi114_quadratic_of_max_recurrence_below_threshold`,
`chewi114_quadratic_of_source_below_threshold`,
`IsChewi114AMSourceCertificate.quadratic_recurrence_below_threshold`,
`IsChewi114AMSourceCertificate.gap_le_source_K_div_iterations_of_threshold_tail`,
`IsChewi114AMSourceCertificate.gap_le_eps_of_threshold_tail`,
`IsChewi114AMSourceCertificate.threshold_tail_of_initial_threshold`,
`IsChewi114AMSourceCertificate.gap_le_source_K_div_iterations_of_initial_threshold`,
`IsChewi114AMSourceCertificate.gap_le_eps_of_initial_threshold`,
`IsChewi114AMDescentCertificate.quadratic_recurrence_below_threshold`,
`IsChewi114AMDescentCertificate.gap_le_source_K_div_iterations_of_threshold_tail`,
`IsChewi114AMDescentCertificate.gap_le_eps_of_threshold_tail`,
`IsChewi114AMDescentCertificate.gap_le_source_K_div_iterations_of_initial_threshold`,
`IsChewi114AMDescentCertificate.gap_le_eps_of_initial_threshold`,
`IsChewi114AMSourceCertificate.exists_threshold_index_of_geometric_burnin`,
`IsChewi114AMSourceCertificate.exists_tail_gap_le_eps_of_geometric_burnin`,
`chewi114_half_pow_mul_gap_le_threshold_of_log`,
`IsChewi114AMSourceCertificate.exists_threshold_index_of_log_burnin`,
`IsChewi114AMSourceCertificate.exists_tail_gap_le_eps_of_log_burnin`,
`IsChewi114AMDescentCertificate.exists_threshold_index_of_geometric_burnin`,
`IsChewi114AMDescentCertificate.exists_tail_gap_le_eps_of_geometric_burnin`,
`IsChewi114AMDescentCertificate.exists_threshold_index_of_log_burnin`, and
`IsChewi114AMDescentCertificate.exists_tail_gap_le_eps_of_log_burnin`.  This
proves the post-threshold inverse-gap/telescope layer of Chewi Theorem 11.4 in
the source constant `K = 8 * beta * D^2 * R^2` form, discharges the displayed
source recurrence with denominator `2 * beta * D^2 * R^2`, derives Chewi's max
recurrence without a pre-supplied half-gap assumption, proves the scalar
burn-in halving/threshold/log consumers, proves that below `K/2` the max
recurrence is automatically the quadratic recurrence, propagates a single
initial threshold bound along the tail, turns the logarithmic burn-in condition
into an existing threshold index and epsilon tail endpoint, and turns the two
source block-coordinate descent estimates
`energy/(2*beta) <= gap n - gap (n+1)` and
`gap(n+1)^2 <= D^2 R^2 * energy` into the AM source certificate.
The new `RandomizedAlternatingMinimization.lean` module is root-imported and
compiles the supplied scalar recurrence layer for Chewi Theorem 11.5:
`chewi115StrongFactor`, `chewi115ZeroK`,
`chewi115StrongFactor_nonneg`, `chewi115ZeroK_pos`,
`chewi115_strong_expected_gap_le_of_recurrence`,
`IsChewi115RAMStrongGapCertificate`,
`IsChewi115RAMStrongGapCertificate.gap_le_geometric`,
`chewi115_strong_one_step_of_hopf_lax_gap_bound`,
`IsChewi115RAMStrongHopfLaxCertificate`,
`IsChewi115RAMStrongHopfLaxCertificate.toGapCertificate`,
`IsChewi115RAMStrongHopfLaxCertificate.gap_le_geometric`,
`chewi115_zero_quadratic_recurrence_of_jensen`,
`chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence`,
`chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence_nonneg`,
`chewi115_zero_expected_gap_le_source_rate_of_recurrence`,
`chewi115_zero_expected_gap_le_source_rate_of_recurrence_nonneg`,
`chewi115_zero_expected_gap_le_eps_of_recurrence`,
`chewi115_zero_expected_gap_le_eps_of_recurrence_nonneg`,
`IsChewi115RAMZeroGapCertificate`,
`IsChewi115RAMZeroGapCertificate.gap_le_source_rate`,
`IsChewi115RAMZeroGapCertificate.gap_le_source_rate_nonneg`,
`IsChewi115RAMZeroGapCertificate.gap_le_eps`, and
`IsChewi115RAMZeroGapCertificate.gap_le_eps_nonneg`,
`chewi115_zero_one_step_of_hopf_lax_gap_bound`,
`IsChewi115RAMZeroHopfLaxCertificate`,
`IsChewi115RAMZeroHopfLaxCertificate.toGapCertificate`,
`IsChewi115RAMZeroHopfLaxCertificate.gap_le_source_rate_nonneg`, and
`IsChewi115RAMZeroHopfLaxCertificate.gap_le_eps_nonneg`.  The strong case reuses
`scalarRecurrence_le_pow`; the weak case reuses the Chapter 11.4 inverse-gap
telescope with `K = 2 * D * R_beta^2`, and the nonnegative wrappers handle
zero-hit trajectories by proving the gap remains zero after the first hit.  The
new Hopf-Lax bridge layer packages Chewi's conditional-expectation display and
the two Exercise 9.3 Hopf-Lax estimates into the strong and weak RAM
certificates without introducing full probability infrastructure.  The newest
block-model conditional-upper layer adds
`chewi115_uniform_average_le_of_block_model`,
`chewi115_conditional_gap_upper_of_averaged_model`,
`chewi115_conditional_gap_upper_of_block_model`, and
`chewi115_conditional_upper_of_block_model_sequence`, so the finite uniform
block expectation and source convexity algebra no longer remain as opaque
assumptions.

Search-first results to preserve: pinned mathlib search for
`Bregman`, `Mirror`, `proximal`, `Fenchel`, relative smoothness, OMD, online
mirror descent, regret, dual-norm abstractions, Bregman projection,
Pythagorean inequality, and alternating projections found no direct
Bregman/mirror-descent/MPGD/OMD regret/ABP theorem; the `MirrorImage` hits in
`Analysis/Convex/Deriv.lean` are unrelated symmetry lemmas.  Local search
confirms the useful APIs are the compiled `Fenchel.lean`, `Bregman.lean`,
`Proximal.lean`, Chapter 3/5 scalar recurrence/telescope machinery, local
`sum_range_sub_succ`, local Chapter 5
`chewi54_half_pow_mul_le_eps_of_log_ratio_le`, mathlib/local
`LipschitzOnWith.le_add_mul`,
`abs_real_inner_le_norm`, and `FirstOrderStrongConvexOn.lower_model`.  There is
still no arbitrary norm/dual norm abstraction in local code or pinned mathlib;
the OMD theorem packet covers the ordinary Hilbert norm specialization.
The 2026-05-06 route rebase searched the Chapter 11/12 source and local/mathlib
recurrence/probability APIs.  Result: Corollary 11.3 is topology-heavy
compactness/subsequence work, while Theorem 11.4 exposes a clean scalar
inverse-gap recurrence that reuses `sum_range_sub_succ`, the Chapter 3/5
recurrence/telescope style, `sq_le_sq₀`, `div_le_iff₀`, `field_simp`, `ring`,
and ordinary real algebra.  No local/mathlib coordinate-descent or
alternating-minimization theorem was found.  Chapter 12
has usable mathlib probability foundations for conditional expectation,
conditional Jensen, martingales, and process convergence, but the fast initial
route should use supplied expectation-level SMPGD one-step inequalities before
attempting full martingale/CLT formalization.

Active aggressive target ladder:

1. Finish Chewi Theorem 12.1 SMPGD beyond the compiled finite-support,
   Bochner-integral, smooth L2-noise, smooth integral-L2 sampled-model, smooth
   Bochner-unbiased, non-smooth source-L2 sampled, and smooth source
   variance-bound routes, plus the non-smooth relative-subgradient
   growth/star-upper route.  The smooth sampled `hcore`, weighted-average
   endpoint, growth wrapper, unbiased star-upper wrapper, smooth unbiased
   weighted-average endpoint, probability L2-to-L1 bridge, non-smooth `(12.2)`
   sampled `hcore`, non-smooth source-L2 sampled weighted-average endpoint,
   smooth `(12.1)` source variance-root wrapper, and non-smooth
   relative-subgradient endpoint are closed, as are the final weighted
   averaged-iterate wrappers and displayed RHS factor bridges.  Next prove any
   exact conditional-expectation/process packaging needed for source reporting,
   then move to ASGD CLT once the SMPGD source packaging is sufficiently
   complete.
2. Instantiate the compiled Chewi Theorem 11.8 Sinkhorn/mirror-descent
   certificate with concrete finite row/column-normalization KL identities and
   the concrete row/column projection-step recurrence.
   Reuse `IsChewi118SinkhornMirrorDescentCertificate`,
   `chewi118_sinkhorn_last_rowMarginalKL_le_of_mirrorDescent`, the 11.7
   ABP/Pinsker selectors, and the new `finiteKL`/`finiteCouplingKL`
   row/column normalization plus entropic-Bregman identities and the finite
   array entropy certificate endpoint, plus
   `chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations`
   and the no-monotonicity selected wrapper
   `chewi118_finiteSinkhorn_exists_sinkhornRowObjective_le_of_concreteSinkhornNormalizations`.
   Use the selected wrapper when an existential iterate suffices; only
   formalize the remaining monotone gap/source trajectory field when the
   exact source statement requires the terminal Sinkhorn iterate.
3. Finish exact Sinkhorn Theorem 11.7/11.8 source packaging from the compiled
   ABP and mirror-descent layers; do not expand full EOT duality unless exact
   Theorem 11.6 reporting is requested.
4. Continue Chapter 13 from the new root-imported
   `StatInference/Optimization/InteriorPoint.lean` layer.  Reuse the compiled
   vector Definitions 13.2/13.5/13.7 substrate `localNorm`,
   `dualLocalNorm`, `dikinEllipsoid`, `newtonStep`, `newtonDecrement`,
   `SelfConcordantOn`, `SelfConcordantOn.of_zero_third`, and
   `constantHessian_zeroThird_selfConcordantOn`, plus the one-dimensional
   Example 13.4 declarations `negLogBarrier_deriv`,
   `negLogBarrier_second_deriv`, `negLogBarrier_third_deriv`,
   `negLogBarrier_localNorm_eq_abs_div`,
   `negLogBarrier_selfConcordance_ineq`, and
   `negLogBarrier_oneDimSelfConcordantOn_Ioi`, plus the compiled Lemma 13.6
   algebra layer `HessianQuadraticBounds`,
   `localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticUpper`,
   `sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticLower`,
   `localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticBounds`,
   `sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticBounds`,
   `localNorm_le_div_one_sub_of_hessianQuadraticUpper`, and
   `mul_one_sub_localNorm_le_of_hessianQuadraticLower`, plus the segment
   exponential-envelope bridge `scalar_le_exp_of_abs_deriv_le`,
   `chewi136HessianStabilityExponent`,
   `chewi136_exp_stability_upper`, `chewi136_exp_stability_lower`,
   `HessianSegmentExponentialBounds`,
   `HessianSegmentExponentialBounds.toHessianQuadraticBounds`,
   `localNorm_le_div_one_sub_of_hessianSegmentExponentialBounds`,
   `mul_one_sub_localNorm_le_of_hessianSegmentExponentialBounds`, and
   `localNorm_sandwich_of_hessianSegmentExponentialBounds`.  The newest
   scalar analytic packet adds `scalar_le_exp_antideriv_of_abs_deriv_le`,
   `scalar_exp_neg_antideriv_le_of_abs_deriv_le`,
   `scalar_exp_sandwich_of_abs_deriv_le_antideriv`,
   `chewi136HessianStabilityPrimitive`,
   `chewi136HessianStabilityPrimitive_zero`,
   `chewi136HessianStabilityPrimitive_one`, and
   `chewi136HessianStabilityPrimitive_hasDerivAt`, formalizing the
   variable-coefficient Gronwall antiderivative calculus for Chewi's displayed
   `2 M r / (1 - M r t)` coefficient.  The newest interval/psi packet adds
   `scalar_le_exp_antideriv_of_abs_deriv_le_on_Icc`,
   `scalar_exp_neg_antideriv_le_of_abs_deriv_le_on_Icc`,
   `scalar_exp_sandwich_of_abs_deriv_le_antideriv_on_Icc`,
   `chewi136HessianStabilityPrimitive_continuousOn_Icc`,
   `chewi136HessianStabilityPrimitive_hasDerivWithinAt_Icc`,
   `HessianSegmentPsiCertificate`, and
   `HessianSegmentPsiCertificate.toHessianSegmentExponentialBounds`, so the
   endpoint/ODE algebra from a per-vector `ψ(t) = <v, Hess(z_t) v>` certificate
   to `HessianSegmentExponentialBounds` is now compiled.  The concrete segment
   packet adds `hessianSegmentPoint`, `hessianSegmentPoint_zero`,
   `hessianSegmentPoint_one`, `hessianSegmentPsi`,
   `hessianSegmentPsi_zero`, `hessianSegmentPsi_one`,
   `HessianSegmentConcretePsiCertificate`,
   `HessianSegmentConcretePsiCertificate.toHessianSegmentPsiCertificate`,
   `HessianSegmentConcretePsiCertificate.toHessianSegmentExponentialBounds`,
   and `localNorm_sandwich_of_hessianSegmentConcretePsiCertificate`, so
   concrete Chewi `z_t`/`ψ_v(t)` endpoint plumbing now closes directly to the
   local-norm sandwich.  The next bounded packet is to prove the concrete
   certificate fields, especially `psi_deriv_bound`, from the
   self-concordance/third-derivative inequality and the local-norm estimate
   along the segment; reuse mathlib `Analysis/ODE/Gronwall`, `gronwallBound`,
   `norm_le_gronwallBound_of_norm_deriv_right_le`, `Real.exp_log`,
   `Real.exp_neg`, `Real.log_inv`, `HasDerivAt.log`, `sq_le_sq₀`,
   `Real.sq_sqrt`, `Real.sqrt_sq`,
   `ContinuousLinearMap.IsPositive`, and matrix `PosSemidef` APIs only when
   the generic supplied-Hessian interface is insufficient.
5. Theorem 10.13 now has the source-shaped `sInf` fixed-comparator wrapper in
   the ordinary Hilbert norm.  If exact source-report packaging is requested,
   only the report anchors/screenshots and any arbitrary norm/dual-norm
   generalization remain; do not redo the infimum closure.  If exact Lemma
   11.2 reporting is requested, package the finite telescope into source
   screenshots/report form; do not block the main-text theorem lane on reports.

Verification gate remains: focused `lake env lean` during development,
promoted `lake build StatInference` after theorem packets, proof-hole scan,
secret scan, route-doc refresh, rebase over remote main, then one clean
commit/push batch.

Historical live replacement prompt after focused Lean verification of the
Chapter 7 Frank-Wolfe packet rebased over pushed frontier `4d4601c`
(`Add Theorem 2.4.3 coordinate-code selected package`), building on `bb0a297`
(`Add Chewi theorem 6.25 feasibility instance wrapper`): aggressively
formalize and prove all main theorem content of Sinho Chewi's Optimization
2026 notes in Lean under `StatInference/Optimization`, with exercise
statements and cheap reusable exercise proofs kept in
`StatInference/Optimization/Exercises.lean` without slowing the main-text
theorem lane.  Do not route back to the stale Chapter 3/4/5 setup, solved
Chapter 6 6.21/6.22 packets, or already-compiled Theorem 6.25 feasibility
infrastructure unless exact source/report packaging needs them.  Treat
`ProjectedSubgradient.lean`, `CuttingPlane.lean`, `Ellipsoid.lean`, and
`NonsmoothLowerBounds.lean` as stable Chapter 6 infrastructure through the
supplied Definition 6.24/Theorem 6.25 closed-convex feasibility-instance and
no-interior-success wrapper.  Treat `StatInference/Optimization/FrankWolfe.lean`
as the stable Chapter 7 starter: it now compiles `LinearOptimizationOracleOn`,
`HasDiameterBound`, `frankWolfeStep`, `chewi73StepSize`,
`IsFrankWolfeTrajectory`, step feasibility, the one-step Frank-Wolfe gap
recurrence, the scalar `2/(n+2)` induction, trajectory recurrence, and
`chewi73_gap_le_two_beta_mul_diam_sq_div`, the supplied-interface
Theorem 7.3 rate.  Search-first results to preserve: no local/mathlib
Frank-Wolfe theorem was found; the proof reuses local
`FirstOrderStrongConvexOn.lower_model`, `SmoothWithGradientOn.upper_model`,
mathlib `convex_iff_add_mem`, inner-product smul/norm algebra, and scalar
`field_simp`/`ring`/`nlinarith`.  The next aggressive main-text packet is
Chapter 8 `Proximal.lean`: source-scan the proximal/composite-gradient section
of the Chewi notes, search local Chapter 3/5 descent/AGD recurrence APIs,
mathlib proximal/projection/convex-subdifferential candidates, and then prove
the largest bounded theorem interface first.  Return to Theorem 6.25 or 7.3
only for exact source-report packaging or a dependency.  Verification gate:
focused `lake env lean` during development, root import plus targeted
`lake build StatInference` after promotion, proof-hole scan, secret scan,
route-doc refresh, rebase over remote main when needed, then one clean
commit/push batch.

Superseded historical `/goal` prompt after focused Lean verification of the
Theorem 6.25 deterministic no-success packet on top of pushed frontier
`e906bd1` (`Add Chewi theorem 6.25 replay certificate`): aggressively formalize and
prove all main theorem content of Sinho Chewi's Optimization 2026 notes in
Lean under `StatInference/Optimization`, with all exercise statements and any
cheap exercise proofs kept in `StatInference/Optimization/Exercises.lean`
without slowing the main-text theorem lane.  Do not route back to the stale
Chapter 3 Theorem 3.4 goal, finished Chapter 5/6 setup, or already-certified
Theorem 6.21/6.22 source side conditions and 6.25 box/width setup.  Treat
`StatInference/Optimization/ProjectedSubgradient.lean`,
`CuttingPlane.lean`, and `Ellipsoid.lean` as stable Chapter 6 infrastructure:
Theorems 6.14/6.16, the supplied CoGM Theorem 6.19 spine, and the supplied
Lemma 6.20 ellipsoid trajectory/rate with displayed CFC-root matrix
certificates now compile.  The active frontier is
`StatInference/Optimization/NonsmoothLowerBounds.lean`, where Theorem 6.21 now
has the hard max-coordinate objective, constant minimizer and value,
first-max resisting oracle, whole-space `IsSubgradientAt` correctness,
prefix-support induction, concrete `gamma^2 / (2 * alpha * d)` gap, source
parameter identity, `d = N + 1` lower bound
`L * R / (8 * sqrt (N + 1))`, and displayed source-radius facts
`‖x_*‖ = R` and `dist 0 x_* <= R` for
`alpha = gamma / (R * sqrt d)`.  The newest 6.21 side-condition packet also
compiles `chewi621CoordinateBasis_norm`,
`chewi621FirstMaxOracle_norm_le_of_norm_le`,
`chewi621HardObjective_firstOrderConvexOn_univ`,
`chewi621HardObjective_lipschitzOnWith_closedBall_zero`,
`chewi621_source_lipschitz_constant_le`,
`chewi621HardObjective_lipschitzOnWith_source_closedBall_zero`,
`chewi621HardObjective_firstOrderConvexOn_source_univ`,
`chewi621_quadratic_strong_subgradient_ineq`,
`chewi621HardObjective_firstOrderStrongConvexOn_univ`,
`chewi621HardObjective_lipschitzOnWith_closedBall`,
`chewi621_source_center_lipschitz_constant_le`, and
`chewi621HardObjective_lipschitzOnWith_source_closedBall_minimizer`; this
certifies the mathematically correct `B(x_*, R)` Lipschitz, first-order convex,
and strong-model reusable side conditions for the concrete hard family.
Theorem 6.22 now compiles in the same module through
`chewi622_source_parameter_gap_eq`, `chewi622Radius`,
`chewi622Radius_pos`, `chewi622_alpha_eq_source_radius`,
`chewi622Minimizer_norm_eq_radius`,
`chewi622_zero_dist_minimizer_le_radius`,
`chewi622_source_lipschitz_constant_le`,
`chewi622HardObjective_lipschitzOnWith_source_closedBall_minimizer`,
`chewi622_gap_ge_source_parameters`, and
`chewi622HardObjective_firstOrderStrongConvexOn_source_univ`.
The current local 6.25 feasibility packet now starts the resisting-oracle box
lower bound with compiled declarations `chewi625CoordinateBox`,
`chewi625StrictCoordinateBox`, `IsSeparationVector`, `chewi625Midpoint`,
`chewi625ReplaceCoord`, `chewi625CutLower`, `chewi625CutUpper`,
`chewi625CutVector`, `chewi625CutVector_norm`,
`chewi625CutVector_ne_zero`, `chewi625_query_not_mem_strict_cut_box`,
`chewi625CutVector_separates_cut_box`,
`chewi625CutVector_isSeparationVector`, box nesting and selected/unselected
width lemmas, `chewi625_closedBall_subset_coordinateBox`, and
`chewi625_no_closedBall_subset_of_short_side`.  The newest recursive-state
packet adds `chewi625_cutLower_le_cutUpper`, `chewi625ConstVec`,
`chewi625CycleCoord`, `chewi625BoxState`, `chewi625BoxLower`,
`chewi625BoxUpper`, zero/successor simp wrappers,
`chewi625BoxState_ordered`, `chewi625BoxState_step_isSeparationVector`,
`chewi625BoxState_query_not_mem_next_strict_box`,
`chewi625BoxState_step_subset`, `chewi625BoxState_selected_width_succ`, and
`chewi625BoxState_unselected_width_succ`.  The newest width/counting bridge
adds `chewi625BoxWidth`, `chewi625BoxWidth_zero`,
`chewi625BoxWidth_selected_succ`, `chewi625BoxWidth_unselected_succ`,
`chewi625BoxWidth_succ_of_cycleCoord_eq`,
`chewi625BoxWidth_succ_of_cycleCoord_ne`,
`chewi625CycleCoord_add_mul_eq`, `chewi625BoxWidth_succ_add_mul_self`,
`chewi625_side_ge_two_eps_of_closedBall_subset`,
`chewi625BoxWidth_ge_two_eps_of_closedBall_subset`, and
`chewi625BoxState_no_closedBall_subset_of_width_lt`.  The full-cycle width
packet now compiles through `chewi625BoxWidth_add_eq_of_no_cycle_hits`,
`chewi625CycleCoord_mul_add_eq`,
`chewi625CycleCoord_mul_add_ne_of_lt`,
`chewi625CycleCoord_after_mul_add_ne_of_lt`,
`chewi625BoxWidth_full_cycle_succ`,
`chewi625BoxWidth_full_cycles`,
`chewi625BoxState_no_closedBall_subset_of_full_cycles_width_lt`, and
`chewi625_full_cycles_width_ge_two_eps_of_closedBall_subset`.  The scalar/log
success-side packet now compiles through `chewi625BoxState_subset_add`,
`chewi625BoxState_subset_of_le`,
`chewi625BoxLower_mem_coordinateBox`,
`chewi625BoxUpper_mem_coordinateBox`,
`chewi625BoxLower_le_of_le`, `chewi625BoxUpper_le_of_le`,
`chewi625StrictBoxState_subset_of_le`,
`chewi625BoxState_query_not_mem_final_strict_box`,
`chewi625ReturnedCutVector`,
`chewi625ReturnedCutVector_isSeparationVector_final_box`,
`IsFeasibilitySeparationTranscript`,
`chewi625BoxState_final_separationTranscript`,
`IsFeasibilityReplayCertificate`,
`chewi625BoxState_final_replayCertificate`,
`chewi625_closedBall_subset_full_cycles_of_two_eps_le_width`,
`chewi625_closedBall_subset_full_cycles_of_eps_le_radius`,
`chewi625_eps_le_half_pow_mul_of_nat_mul_log_le`,
`chewi625_eps_le_radius_of_nat_mul_log_le`,
`chewi625_closedBall_subset_full_cycles_of_log_bound`,
`chewi625_closedBall_subset_of_le_full_cycle`, and
`chewi625_closedBall_subset_of_le_full_cycle_log_bound`, plus the
source-shaped package
`chewi625_final_replayCertificate_and_closedBall_of_le_full_cycle_log_bound`.
The supplied deterministic replay abstraction now compiles through
`IsPrefixCausalQueryFunctional`, `IsDeterministicFeasibilityRun`,
`deterministicFeasibilityRun_query_eq_of_transcript_eq`,
`IsFeasibilityReplayCertificate.no_strict_success_of_deterministic_run`, and
`chewi625_deterministic_run_no_strict_success_of_log_bound`.

Historical immediate target: do not loop on narrow cleanup wrappers for
6.21/6.22 and do not try to prove Theorem 6.23 directly, since the source
explicitly switches to feasibility.  Theorem 6.25 now has the supplied
deterministic replay core, final-box separation transcript, final-query
strict-infeasibility, log-bound ball-containment, and deterministic no-success
wrapper.  Next choose either exact Theorem 6.25 source/report packaging
(including any needed closed/convex/topological-interior wrappers and source
screenshots) or, if report packaging would bog down, open Chapters 7-13 in
parallel theorem-sized packets while leaving 6.25 as a compiled supplied
interface.  Add arbitrary-`d > N` wrappers for 6.21/6.22 only if exact theorem
reporting requires them.  Do the
mandatory search-first pass before new primitives: local `IsSubgradientAt` and
Lipschitz bridges in `ProjectedSubgradient.lean`, prefix-span machinery in
`LowerBounds.lean`, mathlib `LipschitzOnWith`, finite `Finset.max'` APIs,
convex `sup`/finite max APIs, Euclidean norm-sum formulas, feasibility/oracle
APIs in the Optimization lane, mathlib `PiLp.dist_apply_le`,
`PiLp.norm_apply_le`, `interior_pi_set`, `interior_Icc`, `Box`/`Set.pi`
interval APIs, and matrix/PSD APIs if a feasibility theorem touches separation
geometry.  Verification gate: focused `lake env lean` while
developing, targeted `lake build` for promoted Optimization modules,
proof-hole scan, secret scan, route-doc refresh, rebase over remote main when
needed, then a single commit/push batch.

Historical detailed `/goal` prompt retained for dependency context
(superseded by the current paragraph above) as of 2026-05-05 after rebasing
local `main`
onto `origin/main` at `b21bcbd`
(`Add asymptotic tightness reindexing`) and adding the local
displayed-shape positivity/no-extra-PosDef CFC-root certificate packet:
aggressively formalize and prove
all main theorem content of Sinho Chewi's Optimization 2026 notes in Lean under
`StatInference/Optimization`, with exercises tracked in the single
`StatInference/Optimization/Exercises.lean` module but not allowed to slow the
main-text theorem lane.  Continue from the Chapter 6 Lemma 6.20 frontier after
the standard-cut scalar, determinant-ratio, coordinate-free
affine-containment, supplied-identity affine-transport certificate, first
Euclidean matrix quadratic packet, cut-normalization algebra packet, raw
square-root adjoint/cut bridge, PosDef invertibility/cancellation packet,
pullback-standard-cut certificate packet, and displayed current
`Σ⁻¹`/displayed center-update packet:
`StatInference/Optimization/ProjectedSubgradient.lean`
proves the finite-valued Theorem 6.14 and Theorem 6.16 PSD/functional-constraint
layers, `StatInference/Optimization/CuttingPlane.lean` proves the
supplied-interface algebraic spine and final source-shaped CoGM display wrapper
`chewi619_gap_le_display_rate_of_scaled_candidates`, and
`StatInference/Optimization/Ellipsoid.lean` now starts Lemma 6.20 with
source ellipsoid sets, cut half-spaces, the displayed center update,
`ellipsoidVolumeRatio`, ellipsoid step/trajectory certificates, finite
ellipsoid volume shrink,
`chewi620_volume_ratio_and_gap_bound_of_scaled_candidates`, and the normalized
central-cut scalar containment core
`chewi620_standard_cut_scalar_containment_cleared` /
`chewi620_standard_cut_scalar_containment`, plus the normalized determinant/
volume scalar bridge `chewi620_ellipsoidVolumeRatio_source_nonneg`,
`chewi620_standardCut_detRatio_eq_source`, and
`chewi620_ellipsoidVolumeRatio_sq_eq_standardCut_detRatio`, and now the
coordinate-free normalized central-cut bridge
`chewi620StandardCutCenter`, `chewi620StandardCutInvShape`,
`chewi620_norm_sq_eq_inner_sq_add_orthogonal_sq`,
`chewi620_standardCutInvShape_quadratic`, and
`chewi620_standardCut_halfspace_subset`, plus the certificate bridge
`chewi620_affineTransport_halfspace_subset_of_quadratic` and
`chewi620_affineTransport_stepCertificate_of_quadratic`, plus the
matrix-backed inverse-shape bridge `matrixInvShape`,
`matrixInvShape_quadratic_eq_dotProduct`,
`matrixInvShape_quadratic_nonneg_of_posSemidef`,
`matrixInvShape_quadratic_pos_of_posDef`, and
`chewi620_matrix_cut_sqrt_inv_pos_of_posDef`, plus
`chewi620MatrixCutScale`, `chewi620MatrixNormalizedCutDirection`,
`chewi620_matrixNormalizedCutDirection_norm_of_posDef`,
`chewi620_matrixNormalizedCutDirection_inner_toStd`, and now
`chewi620_rawAdjointIdentity_of_symmetric_inverse`,
`chewi620_matrixSqrt_normalizedCutDirection_norm_of_posDef`, and
`chewi620_matrixSqrt_normalizedCutDirection_inner_toStd`, plus the
PosDef/invertibility packet `matrixInvShape_mul`,
`chewi620_matrixPosDef_det_pos`, `chewi620_matrixPosDef_det_ne_zero`,
`chewi620_matrixPosDef_det_isUnit`, `chewi620_matrixPosDef_inv`,
`chewi620_matrixPosDef_mul_inv`, `chewi620_matrixPosDef_inv_mul`,
`chewi620_matrixPosDef_mul_inv_cancel_right`,
`chewi620_matrixPosDef_inv_mul_cancel_left`,
`chewi620_matrixPosDef_det_inv_mul_det`, `chewi620_matrixPosDef_inv_inv`,
`matrixInvShape_mul_inv_cancel`, and `matrixInvShape_inv_mul_cancel`, plus
the pullback packet `chewi620PullbackIdentityInvShape`,
`chewi620PullbackStandardCutInvShape`,
`chewi620_pullbackIdentityInvShape_quadratic`,
`chewi620_pullbackStandardCutInvShape_quadratic`,
`chewi620_pullbackStandardCutInvShape_hnext`, and
`chewi620_sqrtAffineTransport_stepCertificate_of_pullback`, plus
`chewi620_pullbackIdentityInvShape_eq_matrixInvShape_inv`,
`chewi620_ellipsoidSet_pullbackIdentity_eq_matrixInvShape_inv`,
`chewi620_matrixSqrt_centerUpdate_hcenter`,
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedCenter`, and
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedCurrentAndCenter`,
plus `chewi620_matrix_rankOne_collapse`,
`chewi620_matrix_rankOne_det_update`,
`chewi620DisplayedShapeUpdateCore`,
`chewi620_displayedShapeUpdateCore_det`,
`chewi620DisplayedShapeUpdate`, and
`chewi620_displayedShapeUpdate_det`, plus the source-volume determinant packet
`chewi620_displayedShapeUpdate_det_div_det`,
`chewi620_displayedShapeUpdate_det_div_det_eq_ellipsoidVolumeRatio_sq`,
`chewi620_displayedShapeUpdate_det_pos`,
`chewi620_displayedShapeUpdate_det_ne_zero`,
`chewi620_displayedShapeUpdate_det_isUnit`, and
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio`, plus the
determinant-unit inverse-shape reduction packet
`matrixInvShape_mul_inv_cancel_of_det_isUnit`,
`matrixInvShape_inv_mul_cancel_of_det_isUnit`,
`matrixInvShape_eq_inv_of_left_inverse`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_left_inverse`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_left_inverse`,
plus the normalized forward/inverse algebra packet
`chewi620StandardCutForwardShape` and
`chewi620_standardCutForwardShape_left_inverse`, plus the transport reductions
`chewi620_displayedShapeUpdate_left_inverse_of_standardCutForward_transport`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
plus the matrix-action support packet `matrixInvShape_eq_toLp_mulVec`,
`matrixInvShape_one`, `matrixInvShape_add`, `matrixInvShape_smul`,
`matrixInvShape_sub`, `matrixInvShape_vecMulVec`,
`inner_toLp_eq_dotProduct`, `matrixInvShape_vecMulVec_self`,
`chewi620_displayedShapeUpdateCore_action`,
`chewi620_displayedShapeUpdate_action`,
`chewi620_matrixSqrt_current_action`, and
`chewi620_matrixSqrt_rank_inner`, plus the concrete scalar/transport packet
`chewi620_matrixCutScale_mul_self_of_pos` and
`chewi620_displayedShapeUpdate_forwardShape_transport_of_sqrt`, plus the
real-volume scaling packet `addHaar_image_linearMap_real`,
`addHaar_image_add_left_real`, `matrix_toEuclideanLin_det`,
`matrixInvShape_image_volume_real`, and `matrixInvShape_image_add_volume_real`,
plus the displayed-matrices certificate packet `chewi620_matrixSqrt_quadratic`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_sqrt`,
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_sqrt`,
and `chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`, plus
the determinant-volume bridge packet
`chewi620_hvolume_of_matrix_image_volume_models` and
`chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`,
plus the square-root image-model packet
`ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`,
`cfcSqrt_det_sq_of_posSemidef`, and
`chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`, plus
the CFC-root instantiation packet
`cfcSqrt_quadratic_inv_of_posDef` and
`chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`, plus the
displayed-shape positivity packet
`cfcSqrt_inner_matrixInvShape_left`,
`chewi620_matrix_rankOne_cauchy_schwarz`,
`chewi620_displayedShapeUpdateCore_isHermitian`,
`chewi620_displayedShapeUpdate_isHermitian`,
`chewi620_displayedShapeUpdateCore_quadratic_pos`,
`chewi620_displayedShapeUpdate_quadratic_pos`,
`chewi620_displayedShapeUpdate_posDef`, and
`chewi620_displayedMatrices_stepCertificate_of_cfcSqrt`, plus the sequence/rate
promotion packet `chewi620_displayedMatrices_trajectory_of_cfcSqrt` and
`chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`.
The determinant/scalar `hvolume` bridge, inverse-shape left-inverse reduction,
normalized forward/inverse cancellation, transport reduction, rank-one action
expansion, displayed-shape action expansion, square-root current/rank-inner
transport, concrete displayed-to-normalized forward-shape transport theorem, and
matrix-backed translated real image-volume scaling bridge are verified in
focused Lean; the displayed next-shape matrix certificate, the generic
determinant-square-to-`hvolume` theorem, the translated closed-unit-ball image
model, the displayed-volume certificate wrapper, the CFC-root quadratic
instantiation, the rank-one displayed-shape positivity theorem, and the
displayed sequence/rate wrappers now compile, so the next run must not spend
theorem time reproving or repackaging those cores unless they are directly
needed for the next Chapter 6 theorem packet.
The app-level
`/goal` objective text still mentions the obsolete Theorem 3.4 frontier and
cannot be edited directly through the current tool surface unless the full
textbook goal is marked complete.  This older Lemma 6.20 paragraph is retained
only as historical dependency context; the operative manual `/goal` target is
the 2026-05-06 live replacement prompt near the top of this file.

Superseded historical target: the lane already moved past Lemma 6.20 packaging,
Theorems 6.21-6.25, Chapter 7 Frank-Wolfe, Chapter 8 proximal methods, and
Chapter 10 mirror-descent packets.  Do not route new manual-goal time to this
paragraph unless exact source-report packaging needs one of these dependencies.
The displayed determinant ratio is now in the exact source shape
`(chewi620DisplayedShapeUpdate d Sigma p).det / Sigma.det =
ellipsoidVolumeRatio d ^ 2`, the scalar bridge
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio` converts squared
volume determinant bounds into the certificate's `hvolume` hypothesis, the
displayed inverse-shape/set replacement and translated image-volume model are
packaged, and `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt` removes
the separate next-shape PosDef assumption; the sequence theorem
`chewi620_displayedMatrices_trajectory_of_cfcSqrt` instantiates
`IsEllipsoidCuttingPlaneTrajectory`, and
`chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`
feeds the displayed updates into the compiled CoGM rate wrapper.  The next
proof should search the Chewi source around 6.21-6.25, then choose the largest
bounded theorem packet whose primitives already exist in
`ProjectedSubgradient.lean`, `CuttingPlane.lean`, or `Ellipsoid.lean`.
The raw square-root adjoint identity, normalized cut
`hcut` bridge, `Sigma.PosDef` invertibility/cancellation layer, pullback
`hnext` certificate, current `Σ⁻¹` ellipsoid identification, displayed center
update, rank-one collapse `(Σp)^T Σ⁻¹ (Σp) = <p, Σp>`, displayed
forward-shape determinant formula, determinant/source-volume ratio, determinant
positivity/nonzero/unit facts, scalar `hvolume` bridge, determinant-unit
left-inverse reduction, normalized standard-cut forward/inverse cancellation,
forward-shape transport reductions, rank-one action expansion, displayed-shape
action expansion, square-root current/rank-inner transport, scale-square
normalization, and concrete displayed-to-normalized forward-shape transport are now local;
this is not a minor wrapper target.  Do not spend another run on
scalar, coordinate-free, abstract transport, current-shape, center-update,
pullback-only wrappers, rank-one collapse, rank-one action expansion,
displayed-shape action expansion, square-root current-action transport, or
determinant-core algebra unless one is the shortest verified route to the
measure-scaling theorem.  The dependency order is:

1. Search pinned mathlib and local `StatInference/Optimization` for
   square-root/symmetric linear-equivalence, `Matrix.toEuclideanLin`,
   PosDef/PosSemidef, nonsingular inverse, rank-one determinant, and
   volume-scaling APIs.  Current reusable search results: mathlib
   `LinearMap.IsSymmetric`, `LinearMap.IsSymmetric.toLinearMap_symm`,
   `LinearEquiv.isSymmetric_symm_iff`, `LinearEquiv.apply_symm_apply`, and
   `inner_sub_right` proved the symmetric square-root raw identity; mathlib
   nonsingular-inverse APIs are wrapped locally for PosDef cancellation; the
   rank-one determinant path uses mathlib
   `Matrix.det_add_replicateCol_mul_replicateRow`,
   `Matrix.det_fin_one`, `Matrix.vecMulVec_eq`,
   `Matrix.replicateCol`, and `Matrix.replicateRow`, and is now local through
   `chewi620_matrix_rankOne_det_update`,
   `chewi620_displayedShapeUpdateCore_det`, and
   `chewi620_displayedShapeUpdate_det`.  Volume-scaling scout result:
   for actual set volumes use mathlib Haar/Lebesgue image APIs on
   `EuclideanSpace`, especially `Measure.addHaar_image_linearMap`,
   `Measure.addHaar_image_continuousLinearMap`,
   `Measure.addHaar_preimage_linearMap`,
   `Measure.addHaar_preimage_linearEquiv`, and translation invariance,
   rather than only the raw pushforward formulas
   `Real.map_matrix_volume_pi_eq_smul_volume_pi` /
   `Real.map_linearMap_volume_pi_eq_smul_volume_pi`.  The raw `Real.map_*`
   lemmas scale pushforwards by `|det|⁻¹`; set images need the `|det|`
   addHaar-image route, now locally wrapped by `addHaar_image_linearMap_real`,
   `addHaar_image_add_left_real`, `matrixInvShape_image_volume_real`, and
   `matrixInvShape_image_add_volume_real`.  For `Matrix.toEuclideanLin`, reuse
   `Matrix.toEuclideanLin = Matrix.toLpLin 2 2`, `LinearMap.det_toLpLin`,
   and `PiLp.volume_preserving_toLp` / `PiLp.volume_preserving_ofLp`.
2. The concrete determinant-volume inequality now compiles as
   `chewi620_hvolume_of_matrix_image_volume_models`, and the displayed matrix
   certificate consumer compiles as
   `chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`.
   Do not redo this scalar hvolume algebra.
3. The exact displayed next-shape certificate is now packaged through
   `chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`; do not
   redo the pullback-to-displayed matrix equality unless it is needed to rewrite
   the final hvolume statement.
4. The supplied actual ellipsoid image model now compiles as
   `ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`, and the displayed
   volume wrapper now compiles as
   `chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`.
   Do not redo the set-image/closed-ball packaging.
5. The supplied square-root inputs are now instantiated for any positive-definite
   matrix using `cfcSqrt_quadratic_inv_of_posDef`,
   `cfcSqrt_det_sq_of_posSemidef`, and
   `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`.  Do not redo
   the CFC root algebra.
6. Reuse `chewi620_displayedMatrices_trajectory_of_cfcSqrt` and
   `chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`
   as the Lemma 6.20 trajectory/rate frontier; do not repackage them unless a
   later theorem needs a strictly cleaner hypothesis surface.
7. Source-scan Chapter 6 Theorems 6.21-6.25 and implement the next theorem-sized
   nonsmooth lower-bound or feasibility packet, reusing existing PSD, CoGM, and
   ellipsoid layers first.

The current matrix quadratic, positive denominator, and normalized cut
direction algebra are already local, and the raw symmetric square-root
adjoint/cut bridge now discharges the `hcut` side of the affine-transport
certificate.  The `Sigma.PosDef` matrix invertibility/cancellation layer is
also local through nonsingular-inverse APIs and `matrixInvShape` composition.
The displayed-current/displayed-center packet identifies
`chewi620PullbackIdentityInvShape T` with `matrixInvShape Sigma⁻¹`, rewrites the
current ellipsoid set to Chewi's displayed form, derives the displayed center
update from `T ∘ T = Sigma`, and exposes a certificate whose former geometric
blockers, the next inverse-shape matrix equality and determinant/volume ratio,
are now discharged by the displayed-matrix, image-volume, CFC-root, and
rank-one positivity packets.  The next useful Lean work is therefore exact
source-shaped one-step packaging and trajectory/rate promotion.  If that
packaging balloons, record the exact missing sequence/root/model API and prove
the smallest wrapper that removes that blocker in the same run.

Do not replay completed Chapter 3 gradient-descent work, Chapter 4
gradient-span/hard-instance setup, Chapter 5 CG substrate, Theorem 5.8 AGF
Lyapunov work, Theorem 5.9 strong-convex AGF work, or the now-closed Theorem
5.10 discrete AGD proof.  `Theorem510.lean` now compiles the lambda/theta
recurrences, telescope alignment, source `(3.3)` reuse from
`StatInference.Optimization.oneStepRecurrence_of_firstOrderStrongConvexOn`,
weighted two-point inequality, finite weighted telescope, denominator form, and
the final source wrapper
`chewi510_gap_le_two_beta_dist_sq_over_nat_sq`:
`f (x N) - f xStar <= 2 * beta * ‖x 0 - xStar‖ ^ 2 / (N : ℝ) ^ 2` for
positive `N` under convexity, smoothness, feasible AGD trajectory, and
minimizer membership assumptions.

The active aggressive target is Chapter 6 nonsmooth convex optimization, with
main-text theorem coverage prioritized over reports and exercises.  Theorem
6.14 is source-complete in the finite-valued/ray-valid form, Theorem 6.16 now
compiles in the proof-carrying existential form of display (6.5), the
source-shaped CoGM Theorem 6.19 wrapper compiles after isolating the genuine
centroid/volume fact as `HasScaledOutsideCandidatesAbove`, and Lemma 6.20 now
has a compiled supplied-interface ellipsoid trajectory/rate layer plus the
normalized scalar central-cut containment, determinant-ratio inequalities,
coordinate-free normalized half-space containment, abstract affine-transport
certificate bridge, matrix/CFC displayed-shape positivity, and final
trajectory/rate wrappers.  The current lower-bound packet in
`StatInference/Optimization/NonsmoothLowerBounds.lean` now compiles the Theorem
6.21 max-coordinate hard objective, prefix-subspace nonnegativity,
gradient-span prefix induction consumer, supplied final gap obstruction
`chewi621_hardObjective_gap_ge_of_gradientSpan`, Chewi's source minimizer
`x_*[k] = -γ/(α d)`, the value calculation `f x_* = -γ^2/(2 α d)`, the
first-max resisting oracle, oracle prefix-support, the concrete
`gamma^2/(2 alpha d)` gap theorem, and the source-parameter `d = N + 1`,
`γ = L/4`, `α = γ/(R sqrt d)` lower bound
`chewi621_gap_ge_source_parameters`.  The certification packets import the
local `IsSubgradientAt` interface, prove the quadratic/max-coordinate
subgradient inequalities, prove the first-max oracle is a whole-space
subgradient of `chewi621HardObjective`, prove the displayed source radius facts
`‖x_*‖ = R` and `dist 0 x_* <= R`, promote the hard family to centered
`B(x_*, R)` Lipschitz and first-order strong-convexity certificates, and prove
the Chewi 6.22 source-rate packet with displayed radius, `x0` membership,
strong-convexity, and Lipschitz side conditions.  The current 6.25 packet now
compiles the box-halving resisting-oracle geometry, retained-box separation,
query exclusion, side-width facts, closed-ball containment, short-side
no-ball obstruction, cyclic coordinate schedule, full-cycle side-length/log
iteration, final replay certificate, deterministic transcript replay, closed
convex Definition 6.24-style feasibility instance, and topological
`interior C` no-success wrapper
`chewi625_deterministic_run_no_interior_success_of_log_bound`.  It now also
packages the same-run source theorem interfaces
`chewi625_resisting_final_box_source_package_of_log_bound` and
`chewi625_exists_resisting_feasibility_instance_of_log_bound`, which expose the
closed convex feasibility instance, deterministic transcript, valid separation
transcript, and no-interior-success conclusion behind an existential final set.
The next aggressive theorem packet should open Chapter 7 Frank-Wolfe in a
theorem-sized module, using Chapter 6 only for dependencies; add an arbitrary-`d > N`
embedding/report wrapper for 6.21/6.22 only if the fully literal theorem
statement or report needs it.  Search the local PSD, CoGM,
ellipsoid, lower-bound, nonsmooth-lower-bound, and exercises modules first; if
the next source theorem needs a missing nonsmooth lower-bound primitive, record
that precise API and prove the smallest wrapper that removes it.
Do not spend a run only polishing a minor wrapper unless it is the fastest
verified dependency for this theorem packet.

`StatInference/Optimization/ProjectedSubgradient.lean` now starts this lane and
compiles a source-shaped finite-valued packet for Definition 6.8, Definition
6.11, Lemma 6.12, Lemma 6.13, the PSD trajectory display, and the main
Theorem 6.14 average-gap inequality in a supplied-interface form.  Compiled
declarations include `IsSubgradientAt`, `ProjectionCharacterizationOn`,
`ProjectionCharacterizationOn.dist_to_set_le`,
`ProjectionCharacterizationOn.fixed`,
`ProjectionCharacterizationOn.nonexpansive`, `ProjectionOracleOn`,
`ProjectionCharacterizationOn.toProjectionOracleOn`, `normalizedSubgradient`,
`normalizedSubgradient_norm`, `projectedSubgradientStep`,
`IsProjectedSubgradientTrajectory`, `iterateAverage`, the Jensen wrappers
`convex_value_iterateAverage_le_average` and
`convex_value_iterateAverage_sub_le_average_gap`,
`projectedSubgradientScaledStep`,
`projectedSubgradient_scaled_sqdist_recurrence`,
`projectedSubgradient_sqdist_recurrence`,
`projectedSubgradient_gap_average_bound_of_recurrence`,
`chewi614_average_gap_bound`,
`normalizedSubgradient_inner_self`,
`IsSubgradientAt.norm_le_of_lipschitzOnWith_feasible_ray`,
`chewi614_average_gap_bound_of_lipschitzOnWith_feasible_rays`,
`chewi614_average_gap_bound_stepsize`,
`chewi614_average_gap_bound_of_lipschitzOnWith_feasible_rays_stepsize`,
`FunctionalConstraintSuccess`,
`FunctionalConstraintSuccess.constraint`,
`FunctionalConstraintSuccess.value_gap`,
`IsFunctionalConstraintPSDStep`,
`IsFunctionalConstraintPSDTrajectory`,
`IsFunctionalConstraintPSDTrajectory.mem`,
`IsFunctionalConstraintPSDTrajectory.step`,
`functionalConstraintPSD_objective_case_sqdist_decrease`,
`functionalConstraintPSD_constraint_case_sqdist_decrease`,
`functionalConstraintPSD_step_sqdist_decrease_of_not_success`,
`strict_decrease_contradiction_of_le_mul`, and
`chewi616_exists_functionalConstraintSuccess`.

Mandatory Chapter 6 search-first gate before inventing new primitives:
mathlib `Analysis/InnerProductSpace/Projection/Minimal.lean` has
`exists_norm_eq_iInf_of_complete_convex` and
`norm_eq_iInf_iff_real_inner_le_zero`; mathlib `Analysis/Convex/Jensen.lean`
has `ConvexOn.map_sum_le`; mathlib `Topology/MetricSpace/Lipschitz.lean` has
`LipschitzOnWith`, `LipschitzOnWith.dist_le_mul`, and
`LipschitzOnWith.le_add_mul`; mathlib `Data/Real/Sqrt.lean` supplies
`Real.sqrt_pos` and `Real.sq_sqrt`; mathlib convex segment APIs include
`Convex.lineMap_mem` and `ConvexOn.le_on_segment`/`le_on_segment'`; mathlib
diameter APIs include `Metric.ediam_le`/the deprecated `diam_le` aliases; real
power APIs include `Real.rpow`, `Real.rpow_nonneg`, and monotonicity lemmas.
Local Chapter 3/5 finite-sum telescope and convex-average patterns are already
reused for the PSD summation.  Avoid a heavy extended-real regular-convex
foundation unless it directly unblocks a named theorem; backfill Definitions
6.1-6.10 only when a theorem needs them.  For the cutting-plane lane, the
current search found no direct local or mathlib Grünbaum/centroid theorem.
Mathlib has extensive measure/volume and convex-body infrastructure in
specialized files, but the fastest route for Theorem 6.19 is the now-verified
supplied candidate-family interface plus finite recurrence and
Lipschitz/diameter algebra in `CuttingPlane.lean`.  For Lemma 6.20, the current
search found relevant mathlib files/APIs: `Matrix.toEuclideanLin` and
`EuclideanSpace.inner_eq_star_dotProduct` in inner-product `PiL2` files,
`Matrix.isSymmetric_toEuclideanLin_iff`, `Matrix.isPositive_toEuclideanLin_iff`,
`Matrix.posSemidef_iff_dotProduct_mulVec`,
`Matrix.PosSemidef.dotProduct_mulVec_nonneg`,
`Matrix.PosDef.dotProduct_mulVec_pos`, positive-definite inverse/isUnit
bridges in `LinearAlgebra/Matrix/PosDef.lean`,
`LinearAlgebra/Matrix/NonsingularInverse.lean` cancellation/determinant lemmas,
rank-one determinant APIs in `LinearAlgebra/Matrix/SchurComplement.lean`, and
volume-scaling APIs such as `Real.map_matrix_volume_pi_eq_smul_volume_pi` and
`Real.map_linearMap_volume_pi_eq_smul_volume_pi` in
`MeasureTheory/Measure/Lebesgue/Basic.lean`.  Local reusable patterns are
mostly EuclideanSpace/coordinate algebra in `LowerBounds.lean` and quadratic
operator-form bounds in `ConjugateGradient.lean`.  Use these before adding a
more concrete matrix primitive.

Speed rule for this manual goal: make theorem-sized packets, not one-wrapper
push loops.  Use scouts in parallel for future Chapter 6-8 nonsmooth/proximal
APIs, Chapter 9-11 Fenchel/Bregman/mirror APIs, and Chapter 12-13 stochastic/
matrix/self-concordance APIs while the main thread proves the current theorem.
Search existing mathlib and local `StatInference` APIs first, prove the
highest-leverage theorem packet per run, verify with focused `lake env lean`,
promote with targeted `lake build StatInference` after adding root imports,
scan for proof holes and secrets, update this route state, then batch
commit/push clean verified progress.  Keep main-text theorem coverage as the
priority; exercise statements and exercise proofs may still be formalized
opportunistically when cheap, reusable, or directly unblock a main-text
theorem.  All Optimization textbook exercise statements and exercise proofs
should live in the single module `StatInference/Optimization/Exercises.lean`,
so the later exercise sweep remains source-trackable.

Book-level target map for the next 2-4 hour acceleration window: stay in
Chapter 6 only for exact 6.25 source/report packaging; otherwise jump to the
next theorem-sized main-text chapter packet rather than polishing small
wrappers:
Theorem 6.21's centered-domain Lipschitz/convexity side conditions and Theorem
6.22's strongly convex nonsmooth lower-bound source packet are now compiled for
the concrete `d = N + 1` hard family.  Add an arbitrary-d embedding/report
wrapper only if it is needed for exact source reporting.  Definition
6.24/Theorem 6.25 now has the closed-convex feasibility-instance and
topological interior no-success wrapper, and Chapter 7 `FrankWolfe.lean` now
has the supplied Theorem 7.3 rate wrapper, and Chapter 8 `Proximal.lean` now
has the supplied Theorem 8.5 PGD one-step/final-rate wrapper plus the pushed
Theorem 8.6 APGD/FISTA packet and the Chapter 9/10 Fenchel/Bregman substrate.
The current non-report lane is MirrorDescent/MPGD telescoping, rather than
another small Chapter 8 cleanup loop.
Lemma 6.20 now has a compiled trajectory/rate frontier, and Lemma 6.18/Theorem
6.19 already have a supplied-interface algebraic spine; their exact
source-audited report remains blocked only by the genuine Grünbaum/centroid
measure theorem.
After Chapter 6, the first Chapter 7 Frank-Wolfe rate packet, and Chapter 8
Theorem 8.5 have a stable main-text spine, split future packets by chapter
surface rather than by tiny lemmas: optional Chapter 7 Carathéodory/report
wrappers only when needed, Chapters 9-10 `Fenchel.lean` and
`MirrorDescent.lean` for Fenchel-Young/Bregman/OMD telescopes, Chapter 11
`AlternatingBregman.lean`/`AlternatingMinimization.lean` for ABP/AM/RAM
recurrences, Chapter 12
`StochasticGradient.lean`/`SMPGD.lean` reusing local probability modules, and
Chapter 13/Appendix `Newton.lean`/`SelfConcordance.lean` with mathlib matrix
and spectral APIs.  Scouts may map later APIs in parallel, but the commit gate
should favor verified main-text theorem packets.

## Current Blocker

The Chewi lane has source materials and a compiled content-based Lean namespace
under `StatInference/Optimization/`, but it does not yet have an exact
source-audited Optimization theorem report.  Main-text Chapter 3 now has a
strong reusable spine through Theorem 3.7's finite-minimum gradient-norm form,
Chapter 4 now has a compiled gradient-span/oracle-model foundation, and the
Chapter 1 convexity bridge now removes a major supplied-interface blocker for
the whole-space differentiable case:

- Lemma 1.10 minimizer uniqueness under mathlib `StrictConvexOn` compiles in
  `StatInference/Optimization/Minimizer.lean`, reusing
  `StrictConvexOn.eq_of_isMinOn`.
- Chewi's segment `StrongConvexOn C f alpha` is now bridged both ways with
  mathlib's root `_root_.StrongConvexOn C alpha f` via
  `StrongConvexOn.to_mathlibStrongConvexOn`,
  `StrongConvexOn.of_mathlibStrongConvexOn`, and
  `strongConvexOn_iff_mathlibStrongConvexOn`; local parameter downshift now
  compiles as `StrongConvexOn.mono`, reusing mathlib root
  `StrongConvexOn.mono`, and nonnegative strong convexity now gives
  `StrongConvexOn.chewiConvexOn` as well as mathlib `ConvexOn`.
- The first-order lower-model interface also now has
  `FirstOrderStrongConvexOn.mono` and `FirstOrderStrongConvexOn.convex`,
  so downstream theorem wrappers can derive the alpha-zero convex lower model
  from `0 <= alpha` instead of asking for a separate convexity hypothesis.
- Positive local `StrongConvexOn` implies mathlib `StrictConvexOn`, so positive
  Chewi strong convexity plus minimizer existence gives an `∃!` minimizer.
- Corollary 1.11-style wrappers compile for the supplied first-order lower
  model, including the whole-space mathlib-gradient necessary condition
  `IsMinOn f Set.univ x -> HasGradientAt f grad x -> grad = 0`.
- Proposition 1.6 `(1.3) => (1.4)` now compiles on `Set.univ` as
  `FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt`, using
  mathlib `HasGradientAt`/`HasFDerivAt` and a right-limit directional-slope
  argument.
- Proposition 1.6 `(1.4) => (1.5)` already compiles as
  `FirstOrderStrongConvexOn.stronglyMonotoneGradientOn`.

- Chapter 2 gradient-flow modeling now compiles in
  `StatInference/Optimization/GradientFlow.lean` with the supplied ODE
  interface `IsGradientFlowTrajectory grad x := ∀ t, HasDerivAt x
  (-(grad (x t))) t`, matching the notes' decision not to prove
  well-posedness.
- Lemma 2.1 now compiles as `gradientFlow_value_hasDerivAt` and
  `gradientFlow_gap_hasDerivAt`, with the nonpositive derivative scalar
  helper `gradientFlow_value_deriv_nonpos` and antitonicity wrapper
  `gradientFlow_value_antitone`.
- Theorem 2.2's proof spine now compiles: squared-distance derivative
  identity, strong-monotonicity differential inequality, first-order and
  whole-space `StrongConvexOn` plus `HasGradientAt` bridges, and weighted
  exponential squared-distance contraction via
  `chewi22_sqdist_weighted_le_of_*`, plus the literal norm-form source
  contraction via `chewi22_dist_le_exp_of_*`.
- Theorem 2.4 now has source-shaped positive-`alpha` and `alpha = 0`
  denominator assembly wrappers from a weighted Gronwall/integral lower-bound
  interface as `chewi24_gap_le_geometric_denominator_of_weighted_gap_bound`
  and `chewi24_gap_le_alpha_zero_denominator_of_weighted_gap_bound`.  It also
  now has the analytic interval-integral instantiation in both branches:
  `chewi24_gap_le_geometric_denominator_of_firstOrderStrongConvexOn`,
  `chewi24_gap_le_geometric_denominator_of_strongConvexOn_univ_hasGradientAt`,
  `chewi24_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn`, and
  `chewi24_gap_le_alpha_zero_denominator_of_strongConvexOn_univ_hasGradientAt`,
  with interval-integrability hypotheses exposed.  The newest wrappers
  discharge those interval-integrability hypotheses from continuity of
  `s ↦ grad (x s)` on `[0,t]`, using gradient-flow differentiability to
  obtain continuity of `x` and `s ↦ f (x s) - f xStar`.
- Chapter 4 lower-bound modeling now starts in
  `StatInference/Optimization/LowerBounds.lean`.  Chewi Definition 4.3 is
  represented by `gradientSpanSubmodule`, `affineGradientSpan`, and
  `IsGradientSpanTrajectory`, and the source example "GD is a gradient span
  algorithm" compiles as
  `IsGradientDescentTrajectory.isGradientSpanTrajectory`,
  `gradientDescentTrajectory_mem_gradientSpanSubmodule`, and
  `gradientDescentTrajectory_mem_affineGradientSpan`.  Search-first result:
  no local Chewi-specific gradient-span layer existed; mathlib's
  `Submodule.span`, `Submodule.subset_span`, and `Submodule.span_mono` are the
  reusable foundation.  The next Theorem 4.4 source subspace layer also now
  compiles: `coordinatePrefixSubmodule` models `V_n` over
  `EuclideanSpace ℝ (Fin d)`, and
  `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next`
  proves the abstract induction that a zero-start gradient-span trajectory
  stays in `V_n` once the displayed gradient support condition
  `grad (x_k) ∈ V_{k+1}` is supplied.  Search-first result: use mathlib's
  `EuclideanSpace`/`PiLp` coordinate APIs for `ℝ^d`, not plain
  `Fin d -> ℝ`, when inner-product structure is needed.  The tridiagonal
  support calculation itself also now compiles: `lowerBoundChainGradient`
  records the finite-difference chain-gradient oracle,
  `lowerBoundChainGradient_mem_coordinatePrefixSubmodule` proves
  `x ∈ V_k -> grad x ∈ V_{k+1}`, and
  `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_lowerBoundChainGradient`
  assembles the zero-start gradient-span induction for this oracle.  The
  displayed minimizer candidate also now compiles as
  `lowerBoundChainMinimizer`, with
  `lowerBoundChainGradient_lowerBoundChainMinimizer` proving that the
  chain-gradient vanishes at it.  The source norm estimate also now compiles:
  coordinate nonnegativity, coordinate upper bounds, coordinate square bounds,
  and `lowerBoundChainMinimizer_norm_sq_le_dim` prove `‖x_*‖² ≤ d` using
  mathlib's `EuclideanSpace.real_norm_sq_eq` and `Finset.sum_le_sum`.  The
  actual lower-bound quadratic now compiles as `lowerBoundChainObjective`,
  modeled by extended boundary nodes `1, x_0, ..., x_{d-1}, 0`; the exact
  displayed minimizer value compiles as
  `lowerBoundChainObjective_lowerBoundChainMinimizer`.  The algebraic
  objective-gradient bridge now starts with
  `lowerBoundChainGradient_eq_edgeDifference`, which rewrites the tridiagonal
  gradient as `β/4` times adjacent chain-edge residual differences.  The
  global lower-bound/minimizer layer also now compiles: `finSum_forwardDifference`
  and `lowerBoundChainEdge_sum` telescope the boundary chain edge residuals,
  mathlib's `sq_sum_le_card_mul_sum_sq` supplies the finite Cauchy inequality,
  `lowerBoundChain_edgeSquareSum_ge` proves the edge-energy lower bound,
  `lowerBoundChainObjective_ge_minValue` proves the global objective lower
  bound for `0 ≤ β`, and
  `lowerBoundChainObjective_isMinOn_lowerBoundChainMinimizer` proves the
  displayed chain point is an `IsMinOn` global minimizer.  The source step
  `f_d = f_N` on `V_N` is now packaged as a direct lower bound:
  `lowerBoundChain_prefixEdge_sum_of_mem_coordinatePrefixSubmodule`,
  `lowerBoundChain_prefixEdgeSquareSum_ge_of_mem_coordinatePrefixSubmodule`,
  `lowerBoundChain_prefixEdgeSquareSum_le_full`, and
  `lowerBoundChainObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`
  prove that a point in `V_N` has full `d`-chain objective at least the
  `N`-chain minimum.  Then
  `lowerBoundChainObjective_gap_ge_of_gradientSpanTrajectory` proves the main
  finite-dimensional Theorem 4.4 gap estimate before the final `d ≍ N`
  parameter choice.  The source-shaped `d = 2N + 1` specialization now
  compiles as `lowerBoundChainObjective_gap_ge_two_mul_add_one`, with the clean
  `β / (16 * (N + 1))` lower bound.  The unshifted textbook-display objective
  is now connected by `lowerBoundChainTextbookObjective`, with the constant-gap
  bridge `lowerBoundChainTextbookObjective_gap_eq_objective_gap`, exact
  minimizer value
  `lowerBoundChainTextbookObjective_lowerBoundChainMinimizer`, global minimizer
  theorem `lowerBoundChainTextbookObjective_isMinOn_lowerBoundChainMinimizer`,
  direct `(f_N)_*` lower-bound theorem
  `lowerBoundChainTextbookObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`,
  source-objective wrappers for the finite-dimensional and `d = 2N + 1`
  gap estimates, and the norm-scaled final lower-bound line
  `lowerBoundChainTextbookObjective_gap_ge_norm_scaled_of_gradientSpanTrajectory`.
- The scalar Gronwall special case used by Theorem 2.2 and Corollary 2.6 now
  compiles as `scalarExpWeighted_antitone_of_hasDerivAt_le`,
  `scalarExpWeighted_le_initial_of_hasDerivAt_le`, and
  `scalarExpDecay_le_of_hasDerivAt_le`, reusing mathlib derivative
  monotonicity rather than duplicating a full ODE library.
- Corollary 2.6 under PL now compiles in weighted and source-shaped forms as
  `chewi26_gap_weighted_le_of_polyakLojasiewiczOn` and
  `chewi26_gap_le_exp_of_polyakLojasiewiczOn`.
- Proposition 2.7(1) now compiles in
  `StatInference/Optimization/Theorem27.lean`: first-order strong convexity
  implies `PolyakLojasiewiczOn` by setting `y = xStar` in the lower model and
  applying Cauchy-Schwarz/Young; whole-space `StrongConvexOn Set.univ` plus
  `HasGradientAt` discharges the first-order model.
- Proposition 2.7(2)'s algebraic layer now compiles in
  `StatInference/Optimization/Theorem27.lean`: `QuadraticGrowthOn` records
  the source infimum-over-minimizers `(QG)` form, `QuadraticGrowthWitnessOn`
  is the witness form, and
  `quadraticGrowthOn_of_plGradientFlowLimitRoute` proves `(QG)` from the
  gradient-flow limit inequality Chewi uses after assuming flow convergence.
  The next analytic bridge also now compiles:
  `PLGradientFlowLyapunovRouteToQGOn` records the explicit book route with a
  convergent flow and Lyapunov inequality, and
  `quadraticGrowthOn_of_plGradientFlowLyapunovRoute` derives `(QG)` from it
  via `Tendsto`, `eventually_ge_atTop`, and `le_of_tendsto`.  The latest
  bridge tightens this toward the actual displayed proof: the antitone,
  derivative, and differential-estimate route interfaces compile as
  `PLGradientFlowLyapunovAntitoneRouteToQGOn`,
  `PLGradientFlowLyapunovDerivativeRouteToQGOn`, and
  `PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn`; theorems
  `plGradientFlowLyapunovAntitoneRouteToQGOn_of_derivativeRoute`,
  `plGradientFlowLyapunovDerivativeRouteToQGOn_of_differentialEstimateRoute`,
  `plLyapunovDerivativeBound_nonpos`, and
  `quadraticGrowthOn_of_plGradientFlowLyapunovDifferentialEstimateRoute`
  prove the mathlib derivative-monotonicity and PL scalar-algebra parts of
  Chewi's Lyapunov calculation.  The newest layer removes the supplied
  objective-gap derivative and then the supplied norm derivative away from
  zero: `PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn`,
  `PLGradientFlowLyapunovNormDerivativeRouteToQGOn`, and
  `PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn` compile, with
  wrappers through
  `quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute`.
  The proof reuses `gradientFlow_gap_hasDerivAt` for the objective gap and
  mathlib `HasDerivWithinAt.norm_sq` plus `HasDerivWithinAt.sqrt` for the
  derivative of `‖x_t - x_0‖` when `x_t ≠ x_0`.  The continuity plumbing is
  also no longer opaque: `PLGradientFlowLyapunovContinuousDataRouteToQGOn`
  derives Lyapunov continuity from `ContinuousOn y (Ici 0)` and
  `ContinuousOn (fun t => f (y t) - fstar) (Ici 0)`.  The newest
  `PLGradientFlowLyapunovSideConditionRouteToQGOn` goes one step further:
  `HasDerivAt.continuousOn` plus `gradientFlow_gap_hasDerivAt` derive both
  trajectory continuity and gap continuity from the gradient-flow hypotheses.
  The latest branch split records the correct proof shape for minimizer
  starts: `PLGradientFlowLimitNonMinimizerRouteToQGOn` and
  `PLGradientFlowLyapunovNonMinimizerRouteToQGOn` require the flow/Lyapunov
  argument only when the starting point is not already a minimizer, while
  `plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute`,
  `plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute`,
  `quadraticGrowthWitnessOn_of_plGradientFlowLimitNonMinimizerRoute`,
  `quadraticGrowthWitnessOn_of_plGradientFlowLyapunovNonMinimizerRoute`,
  `quadraticGrowthOn_of_plGradientFlowLimitNonMinimizerRoute`, and
  `quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute` discharge
  the already-minimizer branch from the minimizer-value invariant
  `∀ z ∈ C, IsMinOn f C z -> f z = fstar`.  The newest layer moves this
  split all the way down to the side-condition route:
  `PLGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn` now compiles,
  `plGradientFlowLyapunov_inequality_of_sideConditionData` proves the
  pointwise Lyapunov inequality directly from side-condition data, and the
  wrappers through
  `quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
  derive `(QG)` while requiring convergence/positive-gap/nonzero-displacement
  only for non-minimizer starts.  The newest route removes the explicit
  positive-gap side condition: `positive_gap_of_not_isMinOn` derives
  `0 < f y - fstar` from a minimizer witness plus `¬ IsMinOn f C y`, and
  `PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn` plus wrappers through
  `quadraticGrowthOn_of_plGradientFlowLyapunovNoMinimizerHitRoute` derive
  `(QG)` from convergence, feasible trajectory membership, no minimizer hit
  on positive times, and nonzero displacement.  The newest reference-minimizer
  layer proves `minimizer_value_eq_of_reference_minimizer` and adds route/QG
  wrappers ending in `_of_referenceMinimizer`, replacing the former global
  minimizer-value invariant by one attained minimizer with value `fstar`.
- Corollary 2.8 now compiles in `StatInference/Optimization/Theorem28.lean`:
  the integrated Lemma 2.1 identity, squared-gradient integral bound, average
  bound, interval lower-bound principle, and source square-root minimum form
  from an `IsMinOn` representative over `[0,t]`.  The compactness/continuity
  bridge also now compiles: `chewi28_exists_grad_norm_le_of_continuousOn_norm`
  discharges both the minimizer and interval-integrability hypotheses from
  continuity of `s ↦ ‖grad (x s)‖` on `[0,t]`, and
  `chewi28_exists_grad_norm_le_of_continuousOn_grad` derives that continuity
  from the gradient-oracle trajectory.

- Lemma 3.5 discrete Gronwall has both zero-based finite-sum and source-shaped
  one-based display wrappers in `StatInference/Optimization/DiscreteGronwall.lean`.
- Lemma 3.1 descent lemma has a supplied-smoothness proof in
  `StatInference/Optimization/GradientDescent.lean`, from
  `SmoothWithGradientOn.upper_model`, including the source-shaped
  `h <= 1 / beta` corollary under `0 < beta`.
- Theorem 3.3 contraction has squared-distance and norm-form wrappers in
  `StatInference/Optimization/Theorem33.lean`, from the supplied
  `StronglyMonotoneGradientOn` and `GradientStepCocoerciveOn` interfaces.
  It also has wrappers deriving gradient monotonicity from the supplied
  first-order lower-model form `FirstOrderStrongConvexOn`, and wrappers using
  the source-shaped Exercise 3.1 display `(3.5)` as `GradientCocoerciveOn`
  together with `h <= 1 / beta`.  The newest wrappers discharge the
  first-order lower model from actual whole-space segment strong convexity plus
  `HasGradientAt`.  Exercise 3.1 itself now compiles in
  `StatInference/Optimization/Exercises.lean` for the whole-space
  smooth-convex route, removing the supplied co-coercivity input from the
  corresponding Theorem 3.3 squared/norm wrappers.  The newest wrappers also
  remove the separate alpha-zero convexity input by downshifting
  `FirstOrderStrongConvexOn` or `StrongConvexOn` from `alpha` to `0` under
  `0 <= alpha`.

The positive-`alpha` closed-form Theorem 3.4 function-value denominator now
compiles.  The assembly layer in
`StatInference/Optimization/Theorem34.lean`: it proves the weighted finite-sum
bound from the supplied one-step recurrence (3.1), including a source-indexed
one-based display, plus a monotone-gap weighted lower-bound helper, finite
denominator corollaries, and the closed geometric denominator corollary
matching (3.2) under `0 < alpha`, `0 < h`, and `0 < 1 - alpha * h`, and the
`alpha = 0` limiting-value denominator bound
`‖x₀ - x⋆‖² / (2 h N)`.  The
first-order supplied strong-convexity bridge now also compiles: it adds
`FirstOrderStrongConvexOn`, proves the one-step recurrence (3.1)/(3.3) from
that lower model plus Lemma 3.1, and feeds a gradient-descent trajectory into
the weighted finite-sum/final-value bounds.  The descent lemma also now
derives monotonicity of function values along GD trajectories, removing the
last supplied monotone-gap assumption from the positive-`alpha` and
`alpha = 0` closed-form wrappers.  The newest Theorem 3.4 wrappers discharge
the first-order lower model from actual whole-space segment strong convexity
plus `HasGradientAt`, giving closed-form `alpha > 0` and `alpha = 0` GD
function-value convergence directly from Definition 1.5-style strong
convexity assumptions.  The source-shaped Exercise 3.1
display `(3.5)` now has a whole-space proof from convexity plus smoothness in
`StatInference/Optimization/Exercises.lean`, and it supplies the h-scaled
Theorem 3.3 co-coercivity condition under `0 < beta`, `0 <= h`, and
`h <= 1 / beta`.  Exercise statements/proofs may be added opportunistically,
but they should not slow the main theorem lane.  Next choices are main-text
source-audited packaging for Theorem 3.3/3.4/3.7, Chapter 2 gradient-flow
theorems, or the next main deterministic algorithm chapter.

Theorem 3.6 under PL also compiles in
`StatInference/Optimization/Theorem36.lean`.  It adds
`PolyakLojasiewiczOn`, proves the one-step function-gap recurrence from Lemma
3.1 plus PL, unrolls a nonnegative scalar recurrence with the existing
`discreteGronwall_sum_le`, and provides a source-shaped wrapper for
`h <= 1 / beta`.

Theorem 3.7 now compiles in `StatInference/Optimization/Theorem37.lean` in
both the source-faithful existential form over `n < N` and the literal
finite-minimum display form using `(Finset.range N).inf'`.  It proves the
one-step squared-gradient decrease from Lemma 3.1, telescopes the finite sum,
applies a finite average/existence principle, converts to the square-root norm
bound, and provides source-shaped `h <= 1 / beta` wrappers.  It has no
dependency on Chapter 3 exercises.  The next high-value tasks are
source-audited Chapter 3 report packaging and the segment-strong-convexity plus
differentiability bridge to `FirstOrderStrongConvexOn`.

## Search-First Record

Pinned mathlib searches should prioritize:

- `Convex`, `ConvexOn`, `StrictConvexOn`, `ConcaveOn`
- mathlib `StrongConvexOn`, `UniformConvexOn`, `strongConvexOn_zero`,
  `strongConvexOn_iff_convex`, and `StrongConvexOn.strictConvexOn`
- `DifferentiableAt`, `DifferentiableOn`, `fderiv`, `HasFDerivAt`
- `HasGradientAt`, `HasGradientWithinAt`, `gradient`, and
  `hasGradientAt_iff_hasFDerivAt`
- `inner ℝ`, norm-square identities, Cauchy-Schwarz
- `LipschitzWith`, mean-value theorem, Frechet derivative bounds
- `Analysis/ODE/Gronwall.lean`
- finite sums/products and geometric-series lemmas
- matrix PSD/Loewner order/eigenvalue/operator-norm APIs

Current discrete-Gronwall search result: no local `StatInference` recurrence
or geometric helper matched Chewi Lemma 3.5.  Mathlib has the reusable
product/Ico recurrence theorems `discrete_gronwall_prod_general`,
`discrete_gronwall`, and `discrete_gronwall_Ico` in
`Mathlib.Analysis.ODE.DiscreteGronwall`.  The compiled local theorem is the
Chewi power/range display specialization used by the Chapter 3 route.  Useful
support APIs include `Finset.sum_range_succ`, `Finset.mul_sum`,
`Finset.sum_congr`, `Finset.sum_Ico_eq_sum_range`, `Finset.sum_range_reflect`,
`pow_succ`, `omega`, and `ring`/`nlinarith`; later Theorem 3.4 denominator work
should reuse mathlib `geom_sum_*` APIs rather than adding custom
geometric-series lemmas.

Current descent-lemma search result: neither pinned mathlib nor local
`StatInference` contains a direct Chewi-style smooth-descent theorem.  The
right local proof engine is `SmoothWithGradientOn.upper_model`; the needed
mathlib algebra APIs are `gradientDescentStep`, `inner_smul_right`,
`real_inner_self_eq_norm_sq`, `norm_smul`, `Real.norm_eq_abs`, and standard
`ring`/`nlinarith` arithmetic.  Mathlib's derivative/gradient bridge remains
available through `HasGradientAt`, `gradient`, `hasGradientAt_iff_hasFDerivAt`,
and `HasLipschitzGradientOn`, but it is not needed for the supplied-gradient
Lemma 3.1 layer.

Current Theorem 3.4 assembly search result: the weighted finite-sum step needs
only algebra after applying `discreteGronwall_sum_le`.  Useful APIs are
`Finset.mul_sum`, `Finset.sum_congr`, `Finset.sum_Ico_eq_sum_range`,
`sub_nonneg`/`le_of_sub_nonneg`, and `nlinarith`.  The closed positive-`alpha`
denominator layer reuses `Finset.sum_range_reflect`, `geom_sum_pos`,
`geom_sum_Ico'`, `pow_lt_one₀`, `le_div_iff₀`, and `field_simp`; no local
geometric-series foundation was added.  The monotone-gap assumption can be
derived from `descentLemma_of_smoothWithGradientOn` plus
`antitone_nat_of_succ_le`.  The `alpha = 0` branch reuses mathlib
`one_geom_sum`/`simp` for the finite sum of unit weights, then specializes the
same finite-denominator theorem.
For the one-step recurrence (3.1), the new whole-space bridge
`FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt` proves the
first-order lower model from the local segment `StrongConvexOn Set.univ`
definition plus mathlib `HasGradientAt`.  It uses
`HasFDerivAt.comp_hasDerivAt`, `HasDerivAt.tendsto_slope_zero_right`,
`le_of_tendsto`, `eventually_le_nhds`, `self_mem_nhdsWithin`, and
`mul_le_mul_iff_of_pos_left`.

Current Definition 1.5/root-API bridge result: mathlib's
`Mathlib.Analysis.Convex.Strong` defines root `_root_.StrongConvexOn` as
uniform convexity with modulus `fun r => alpha / 2 * r ^ 2`.  The local Chewi
display (1.3) is equivalent after reindexing `a = 1 - t`, `b = t` and using
`norm_sub_rev`; the compiled wrappers are
`StrongConvexOn.to_mathlibStrongConvexOn`,
`StrongConvexOn.of_mathlibStrongConvexOn`,
`strongConvexOn_iff_mathlibStrongConvexOn`,
`StrongConvexOn.mono`, `StrongConvexOn.chewiConvexOn`,
`StrongConvexOn.convexOn`, and `ChewiConvexOn.convexOn`.  The downshift search
found mathlib's root `StrongConvexOn.mono` in
`Mathlib.Analysis.Convex.Strong`; no local wrapper existed before this layer.
Future convexity routes should reuse these wrappers before opening local
algebra.

Current first-order recurrence bridge result: `FirstOrderStrongConvexOn` is a
source-faithful version of Chewi Proposition 1.6 / equation (1.4), and on the
whole space it is now derived from local segment strong convexity plus
`HasGradientAt`.  The one-step recurrence proof uses `norm_sub_sq_real`,
`real_inner_comm`,
`inner_neg_right`, `real_inner_smul_right`, `norm_smul`, `Real.norm_eq_abs`,
`abs_of_nonneg`, `mul_le_mul_of_nonpos_left`, and `nlinarith`.

Current Proposition 1.6 monotonicity bridge result: the implication
`(1.4) => (1.5)` now compiles locally as
`FirstOrderStrongConvexOn.stronglyMonotoneGradientOn`.  The proof follows the
textbook's swap-and-add argument directly, using two applications of
`FirstOrderStrongConvexOn.lower_model`, `norm_sub_rev`, `inner_neg_right`,
`inner_sub_left`, `ring`, and `nlinarith`.  Mathlib has one-dimensional
convex-derivative monotonicity lemmas in `Analysis/Convex/Deriv.lean` and
gradient/fderiv bridges in `Analysis/Calculus/Gradient/Basic.lean`, but no
ready multidimensional theorem matching the local supplied first-order
interface.  No local first-order parameter monotonicity theorem existed; the
compiled `FirstOrderStrongConvexOn.mono` is the direct algebraic downshift of
the lower-model correction term, and `FirstOrderStrongConvexOn.convex` is the
`gamma = 0` specialization used by Exercise 3.1/Theorem 3.3 wrappers.

Current Theorem 3.3 contraction search result: mathlib provides the norm-square
expansion `norm_sub_sq_real` and the square-root/order helpers
`sq_le_sq₀`, `Real.sq_sqrt`, and `Real.sqrt_nonneg`, but neither pinned
mathlib nor local `StatInference` has a ready Chewi Exercise 3.1 co-coercivity
theorem.  The direct strong-convexity-to-gradient-monotonicity bridge now
exists on `Set.univ` by composing
`FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt` with
`FirstOrderStrongConvexOn.stronglyMonotoneGradientOn`.  The compiled local
theorem also keeps the source-shaped supplied interfaces
`StronglyMonotoneGradientOn` and
`GradientStepCocoerciveOn`, expands the square with `smul_sub`,
`norm_sub_sq_real`, `real_inner_smul_right`, `norm_smul`, and
`Real.norm_eq_abs`, then closes the contraction with `nlinarith` and
`sq_le_sq₀`.  Theorem 3.3 also has wrappers from
`FirstOrderStrongConvexOn` plus `GradientStepCocoerciveOn`, and whole-space
wrappers from local `StrongConvexOn Set.univ` plus `HasGradientAt`.

Current Chapter 2 gradient-flow search result: mathlib has the general
continuous Gronwall API in `Mathlib.Analysis.ODE.Gronwall`, including
`gronwallBound`, `le_gronwallBound_of_liminf_deriv_right_le`, and
`norm_le_gronwallBound_of_norm_deriv_right_le`.  For the repeated Chewi
special case `u' <= -c u`, the faster local route is the fully proved weighted
monotonicity argument using `HasDerivAt.exp`, `HasDerivAt.mul`,
`HasDerivAt.deriv`, and `antitone_of_deriv_nonpos`.  Gradient-flow calculus
uses `HasGradientAt.hasFDerivAt`, `HasFDerivAt.comp_hasDerivAt`,
`InnerProductSpace.toDual_apply_apply`, `HasDerivAt.norm_sq`,
`inner_sub_right`, `inner_sub_left`, `inner_neg_right`,
`real_inner_self_eq_norm_sq`, and `real_inner_comm`.  This search result
changes the route: use the local exponential-decay wrapper for Theorem 2.2 and
Corollary 2.6, and reserve full integral Gronwall APIs for Theorem 2.4's
weighted-forcing denominator if the direct proof becomes longer than the
mathlib bridge.  The Theorem 2.2 norm-form conversion reuses `sq_le_sq₀`,
`Real.exp_add`, `Real.exp_nat_mul`, and positivity of `Real.exp`.  The Theorem
2.4 denominator assembly first compiled without interval integrals; the
follow-up interval-integral instantiation now reuses
`intervalIntegral.integral_eq_sub_of_hasDerivAt`,
`intervalIntegral.integral_mono_on`, `intervalIntegral.integral_const_mul`,
`intervalIntegral.integral_const`, `Continuous.intervalIntegrable`,
`HasDerivAt.div_const`, and `fun_prop` for the exponential lower-bound
integrand.  The remaining regularity task is to derive the exposed
`IntervalIntegrable` assumptions from a clean regularity surface instead of
passing them explicitly.  The current compiled surface is continuity of the
gradient-oracle trajectory on `[0,t]`; it reuses
`ContinuousOn.intervalIntegrable_of_Icc`, `ContinuousOn.inner`,
`ContinuousOn.norm`, `ContinuousOn.pow`, `HasDerivAt.continuousOn`, and local
`gradientFlow_gap_hasDerivAt`.

Current Proposition 2.7 / Corollary 2.8 search result: local
`PolyakLojasiewiczOn` and `FirstOrderStrongConvexOn.lower_model` already give
the right interfaces for part (1).  Mathlib supplies `real_inner_le_norm`;
the Young step is easiest locally from `sq_nonneg (r - alpha * d)` plus
`le_div_iff₀`.  Mathlib has no PL/QG predicate, so the local
`QuadraticGrowthOn`/`QuadraticGrowthWitnessOn` surface is necessary.  Useful
mathlib APIs for the remaining analytic route are `Filter.Tendsto`,
`tendsto_of_tendsto_of_tendsto_of_le_of_le`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`,
`intervalIntegral.norm_integral_le_integral_norm`,
`AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`,
`Real.hasDerivAt_sqrt`, `HasDerivAt.sqrt`, `HasDerivAt.norm_sq`,
`HasDerivWithinAt.sqrt`, `HasDerivWithinAt.norm_sq`,
`IsCompact.exists_isMinOn`, `ContinuousOn.exists_isMinOn'`, and
`isCompact_Icc`.  For the Lyapunov monotonicity step, mathlib's
`antitoneOn_of_hasDerivWithinAt_nonpos` over `convex_Ici (0 : ℝ)` now bridges
the supplied nonpositive derivative on `interior (Set.Ici 0)` to
`AntitoneOn`.  `ContinuousOn.sqrt`, `ContinuousOn.const_mul`,
`ContinuousOn.add`, and `ContinuousOn.norm` discharge Lyapunov continuity from
continuous trajectory/gap data.  The scalar PL sign calculation is now local as
`plLyapunovDerivativeBound_nonpos`.  There is no direct mathlib
`HasDerivWithinAt.norm`; the compiled route uses
`‖z‖ = sqrt (‖z‖^2)` away from `z = 0`.  `HasDerivAt.continuousOn` and
`gradientFlow_gap_hasDerivAt` now discharge trajectory/gap continuity from the
gradient-flow hypotheses.  `positive_gap_of_not_isMinOn` now removes the
explicit positive-gap assumption once no minimizer hit is known.  Mathlib's
`isMinOn_iff` is enough to prove the local invariant
`minimizer_value_eq_of_reference_minimizer`: if one minimizer attains
`fstar`, then every minimizer in the same feasible set has value `fstar`.
The compiled `_of_referenceMinimizer` wrappers use this invariant to avoid
passing a global minimizer-value axiom through the nontrivial-start and
no-minimizer-hit QG routes.  The
remaining proof step should discharge the no-minimizer-hit route itself:
prove or supply gradient-flow convergence to a minimizer, feasible
positive-time membership, no minimizer hit on positive times, and the
nonzero-displacement side condition needed for the classical norm derivative.
The Corollary 2.8 compactness step is now done using
`isCompact_Icc.exists_isMinOn` and `ContinuousOn.intervalIntegrable_of_Icc`;
future work should not rediscover that API.

Current Exercise 3.1 co-coercivity result: the whole-space source display
(3.5) now compiles in `StatInference/Optimization/Exercises.lean` as
`exercise31_gradientCocoerciveOn_univ_of_firstOrderStrongConvexOn_smooth`.
The proof follows Chewi's hint by applying the smooth upper model to the two
shifted objectives and adding the two half-gap estimates; the compiled helper
is `exercise31_shifted_gap_lower_half_grad_diff_sq`.  The same file also
provides Theorem 3.3 squared/norm contraction wrappers
`exercise31_gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_smooth_univ`,
`exercise31_gradientStep_dist_contract_of_firstOrderStrongConvexOn_smooth_univ`,
`exercise31_gradientStep_sqdist_contract_of_strongConvexOn_univ_hasGradientAt_smooth`,
and `exercise31_gradientStep_dist_contract_of_strongConvexOn_univ_hasGradientAt_smooth`.
These wrappers now assume only `0 <= alpha` for the convex downshift instead
of requiring an extra alpha-zero convexity/strong-convexity hypothesis.
The older interface bridge `GradientCocoerciveOn.stepCocoerciveOn_of_le_inv`
remains the reusable conversion from (3.5) to the h-scaled step inequality.

Current Theorem 3.7 search result: local `GradientDescent.lean` already
supplies the descent lemma and GD trajectory interface.  Mathlib supplies the
finite telescope as `Finset.sum_range_sub`, the finite average/existence step
as `Finset.exists_le_of_sum_le` with `Finset.nonempty_range_iff`, the
square-root conversion as `Real.le_sqrt_of_sq_le`, and the literal finite-min
packaging via `Finset.inf'` and `Finset.inf'_le`.  The local theorem layer
only adds Chewi-shaped wrappers around these APIs; it does not duplicate a
finite-sum or minimum foundation.

Local searches should prioritize:

- `StatInference/Optimization/Basic.lean`
- `StatInference/Asymptotics/Basic.lean`
- `StatInference/EmpiricalProcess/Basic.lean`
- `StatInference/ProbabilityMeasure/Basic.lean`

## Primitive Sequence

1. Keep `StatInference/Optimization/Basic.lean` compiling and imported by
   `StatInference.lean`.  It now includes the whole-space Proposition 1.6
   bridge from segment `StrongConvexOn` plus `HasGradientAt` to
   `FirstOrderStrongConvexOn`.
2. Keep `StatInference/Optimization/DiscreteGronwall.lean` compiling.  It now
   proves both the zero-based finite-sum form and the source-shaped one-based
   display form of Chewi Lemma 3.5.
3. Keep the mathlib-geometric denominator simplification in Theorem 3.4
   compiling.  It uses local source-shaped wrappers around mathlib
   `sum_range_reflect`/`geom_sum_Ico'`/`geom_sum_pos`, not a duplicate
   geometric-series foundation.
4. Keep `StatInference/Optimization/GradientDescent.lean` compiling.  It now
   proves Chewi Lemma 3.1 from `SmoothWithGradientOn`, with both
   `beta * h <= 1` and source-shaped `h <= 1 / beta` versions, and derives
   antitonicity of function values along GD trajectories.
5. Keep `StatInference/Optimization/Theorem33.lean` compiling.  It proves
   Chewi Theorem 3.3 squared and norm contraction forms from supplied gradient
   monotonicity and Exercise 3.1 co-coercivity interfaces.  The whole-space
   smooth-convex Exercise 3.1 proof in `Exercises.lean` now discharges the
   co-coercivity input for first-order and actual whole-space
   `StrongConvexOn` plus `HasGradientAt` wrappers, and the local downshift
   lemmas remove the former separate alpha-zero convexity input under
   `0 <= alpha`.
6. Keep the Theorem 3.4 assembly layer compiling.  It has the weighted
   finite-sum, finite denominator, positive-`alpha` closed denominator,
   `alpha = 0` limiting denominator, first-order trajectory wrappers, and
   whole-space `StrongConvexOn` plus `HasGradientAt` wrappers in
   `Theorem34.lean`.
7. Keep `StatInference/Optimization/Theorem36.lean` and
   `StatInference/Optimization/Theorem37.lean` compiling.  Theorem 3.6 gives
   PL convergence; Theorem 3.7 gives the main-text gradient-norm guarantee in
   existential form from the descent lemma, finite telescoping, and finite
   average APIs.
8. Keep `StatInference/Optimization/GradientFlow.lean` compiling.  It now
   proves Chewi Lemma 2.1's derivative identity, Theorem 2.2's
   squared-distance exponential contraction layer, and Corollary 2.6's PL
   exponential convergence through the local scalar exponential-decay wrapper.
9. Keep `StatInference/Optimization/Exercises.lean` as the single exercise
   module for all Optimization textbook exercises.  Exercise statements may be
   formalized there before the full exercise-proof pass when they help main
   theorem reuse, and exercise proofs may be added opportunistically when they
   are cheap or unlock theorem reuse, without displacing the main-text theorem
   lane.
10. Prove the first source-exact report candidate only after the exact theorem
   declaration compiles and source screenshots are captured.

## Verification Gate

Each run that changes Lean must run:

1. focused `lake env lean` on edited Lean files;
2. targeted `lake build StatInference` after root import or theorem-layer
   changes;
3. `rg -n "sorry|admit|axiom|unsafe" StatInference/Optimization docs/optimization2026_*`;
4. a changed-file secret scan before committing or pushing.

## Current Automation Seed

Latest verified local frontier after lane creation:

- `StatInference.Optimization.StrongConvexOn`
- `StatInference.Optimization.ChewiConvexOn`
- `StatInference.Optimization.StrongConvexOn.to_mathlibStrongConvexOn`
- `StatInference.Optimization.StrongConvexOn.of_mathlibStrongConvexOn`
- `StatInference.Optimization.strongConvexOn_iff_mathlibStrongConvexOn`
- `StatInference.Optimization.StrongConvexOn.convexOn`
- `StatInference.Optimization.ChewiConvexOn.convexOn`
- `StatInference.Optimization.SmoothWithGradientOn`
- `StatInference.Optimization.PolyakLojasiewiczOn`
- `StatInference.Optimization.gradientDescentStep`
- `StatInference.Optimization.IsGradientDescentTrajectory`
- `StatInference.Optimization.IsGradientFlowTrajectory`
- `StatInference.Optimization.gradientFlow_value_hasDerivAt`
- `StatInference.Optimization.gradientFlow_gap_hasDerivAt`
- `StatInference.Optimization.gradientFlow_value_deriv_nonpos`
- `StatInference.Optimization.gradientFlow_value_antitone`
- `StatInference.Optimization.gradientFlow_sqdist_hasDerivAt`
- `StatInference.Optimization.gradientFlow_sqdist_deriv_le_of_stronglyMonotoneGradientOn`
- `StatInference.Optimization.gradientFlow_sqdist_deriv_le_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.gradientFlow_sqdist_deriv_le_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.scalarExpWeighted_antitone_of_hasDerivAt_le`
- `StatInference.Optimization.scalarExpWeighted_le_initial_of_hasDerivAt_le`
- `StatInference.Optimization.scalarExpDecay_le_of_hasDerivAt_le`
- `StatInference.Optimization.chewi22_sqdist_weighted_le_of_stronglyMonotoneGradientOn`
- `StatInference.Optimization.chewi22_sqdist_weighted_le_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi22_sqdist_weighted_le_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.chewi22_dist_le_exp_of_stronglyMonotoneGradientOn`
- `StatInference.Optimization.chewi22_dist_le_exp_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi22_dist_le_exp_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.gradientFlow_sqdist_to_point_hasDerivAt`
- `StatInference.Optimization.gradientFlow_sqdist_to_minimizer_deriv_le_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.gradientFlow_sqdist_to_minimizer_deriv_le_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.scalarWeightedGrowthIntegral_nonneg_of_hasDerivAt_le`
- `StatInference.Optimization.weightedGrowthIntegral_lower_bound`
- `StatInference.Optimization.scalarIntegral_nonneg_of_hasDerivAt_le`
- `StatInference.Optimization.integral_lower_bound_of_monotone_gap`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_growth_bound`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_firstOrderStrongConvexOn_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_strongConvexOn_univ_hasGradientAt_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_strongConvexOn_univ_hasGradientAt_of_continuousOn_grad`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_weighted_bound`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_weighted_bound`
- `StatInference.Optimization.chewi24_gap_le_geometric_denominator_of_weighted_gap_bound`
- `StatInference.Optimization.chewi24_gap_le_alpha_zero_denominator_of_weighted_gap_bound`
- `StatInference.Optimization.gradientFlow_gap_deriv_le_of_polyakLojasiewiczOn`
- `StatInference.Optimization.chewi26_gap_weighted_le_of_polyakLojasiewiczOn`
- `StatInference.Optimization.chewi26_gap_le_exp_of_polyakLojasiewiczOn`
- `StatInference.Optimization.HasLipschitzGradientOn`
- `StatInference.Optimization.gradientStep`
- `StatInference.Optimization.FirstOrderStrongConvexOn`
- `StatInference.Optimization.FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.QuadraticGrowthOn`
- `StatInference.Optimization.QuadraticGrowthWitnessOn`
- `StatInference.Optimization.PLGradientFlowLimitRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLimitNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovAntitoneRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovDerivativeRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovDifferentialEstimateRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovDerivativeComponentsRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNormDerivativeRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovContinuousDataRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovSideConditionRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn`
- `StatInference.Optimization.plLyapunovDerivativeBound_nonpos`
- `StatInference.Optimization.positive_gap_of_not_isMinOn`
- `StatInference.Optimization.plGradientFlowLyapunov_inequality_of_sideConditionData`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn`
- `StatInference.Optimization.plGradientFlowLyapunovRouteToQGOn_of_antitoneRoute`
- `StatInference.Optimization.plGradientFlowLyapunovAntitoneRouteToQGOn_of_derivativeRoute`
- `StatInference.Optimization.plGradientFlowLyapunovRouteToQGOn_of_derivativeRoute`
- `StatInference.Optimization.plGradientFlowLyapunovDerivativeRouteToQGOn_of_differentialEstimateRoute`
- `StatInference.Optimization.plGradientFlowLyapunovRouteToQGOn_of_differentialEstimateRoute`
- `StatInference.Optimization.plGradientFlowLyapunovDifferentialEstimateRouteToQGOn_of_derivativeComponentsRoute`
- `StatInference.Optimization.plGradientFlowLyapunovDerivativeComponentsRouteToQGOn_of_normDerivativeRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNormDerivativeRouteToQGOn_of_nonzeroDisplacementRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNonzeroDisplacementRouteToQGOn_of_continuousDataRoute`
- `StatInference.Optimization.plGradientFlowLyapunovContinuousDataRouteToQGOn_of_sideConditionRoute`
- `StatInference.Optimization.plGradientFlowLyapunovRouteToQGOn_of_derivativeComponentsRoute`
- `StatInference.Optimization.plGradientFlowLyapunovRouteToQGOn_of_normDerivativeRoute`
- `StatInference.Optimization.plGradientFlowLyapunovRouteToQGOn_of_sideConditionRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovRoute`
- `StatInference.Optimization.plGradientFlowLimitNonMinimizerRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionRoute`
- `StatInference.Optimization.QuadraticGrowthWitnessOn.quadraticGrowthOn`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovNoMinimizerHitRoute`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLyapunovSideConditionRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNoMinimizerHitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovAntitoneRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovDerivativeRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovDifferentialEstimateRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovDerivativeComponentsRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNormDerivativeRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovContinuousDataRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionRoute`
- `StatInference.Optimization.gradientFlow_grad_sq_integral_eq_value_drop`
- `StatInference.Optimization.chewi28_gradient_sq_integral_bound`
- `StatInference.Optimization.chewi28_gradient_sq_average_bound`
- `StatInference.Optimization.chewi28_interval_sq_lower_bound_le_average`
- `StatInference.Optimization.chewi28_min_grad_norm_le_of_isMinOn`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn_norm`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn_grad`
- `StatInference.Optimization.discreteGronwall_sum_le`
- `StatInference.Optimization.discreteGronwall_sum_le_of_pos`
- `StatInference.Optimization.discreteGronwall_one_based_sum_le`
- `StatInference.Optimization.discreteGronwall_one_based_sum_le_of_pos`
- `StatInference.Optimization.descentLemma_of_smoothWithGradientOn`
- `StatInference.Optimization.descentLemma_of_smoothWithGradientOn_of_le_inv`
- `StatInference.Optimization.functionValue_antitone_of_smoothWithGradientOn`
- `StatInference.Optimization.StronglyMonotoneGradientOn`
- `StatInference.Optimization.GradientCocoerciveOn`
- `StatInference.Optimization.GradientCocoerciveOn.stepCocoerciveOn`
- `StatInference.Optimization.GradientCocoerciveOn.stepCocoerciveOn_of_le_inv`
- `StatInference.Optimization.GradientStepCocoerciveOn`
- `StatInference.Optimization.FirstOrderStrongConvexOn.stronglyMonotoneGradientOn`
- `StatInference.Optimization.gradientStep_sqdist_contract_of_strongMonotone_cocoercive`
- `StatInference.Optimization.gradientStep_dist_contract_of_strongMonotone_cocoercive`
- `StatInference.Optimization.gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_cocoercive`
- `StatInference.Optimization.gradientStep_dist_contract_of_firstOrderStrongConvexOn_cocoercive`
- `StatInference.Optimization.gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_gradientCocoerciveOn`
- `StatInference.Optimization.gradientStep_dist_contract_of_firstOrderStrongConvexOn_gradientCocoerciveOn`
- `StatInference.Optimization.gradientStep_sqdist_contract_of_strongConvexOn_univ_hasGradientAt_gradientCocoerciveOn`
- `StatInference.Optimization.gradientStep_dist_contract_of_strongConvexOn_univ_hasGradientAt_gradientCocoerciveOn`
- `StatInference.Optimization.exercise31_shifted_gap_lower_half_grad_diff_sq`
- `StatInference.Optimization.exercise31_gradientCocoerciveOn_univ_of_firstOrderStrongConvexOn_smooth`
- `StatInference.Optimization.exercise31_gradientStep_sqdist_contract_of_firstOrderStrongConvexOn_smooth_univ`
- `StatInference.Optimization.exercise31_gradientStep_dist_contract_of_firstOrderStrongConvexOn_smooth_univ`
- `StatInference.Optimization.exercise31_gradientStep_sqdist_contract_of_strongConvexOn_univ_hasGradientAt_smooth`
- `StatInference.Optimization.exercise31_gradientStep_dist_contract_of_strongConvexOn_univ_hasGradientAt_smooth`
- `StatInference.Optimization.StrongConvexOn.strictConvexOn`
- `StatInference.Optimization.minimizer_unique_of_strictConvexOn`
- `StatInference.Optimization.minimizer_unique_of_strongConvexOn`
- `StatInference.Optimization.existsUnique_minimizer_of_strictConvexOn`
- `StatInference.Optimization.existsUnique_minimizer_of_strongConvexOn`
- `StatInference.Optimization.isMinOn_of_firstOrderStrongConvexOn_gradient_eq_zero`
- `StatInference.Optimization.gradient_eq_zero_unique_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.isMinOn_iff_gradient_eq_zero_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.existsUnique_minimizer_gradient_zero_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.existsUnique_minimizer_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.gradient_eq_zero_of_isMinOn_univ_hasGradientAt`
- `StatInference.Optimization.isMinOn_univ_iff_gradient_eq_zero_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.existsUnique_minimizer_gradient_zero_univ_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.weightedSumBound_of_gronwall_negative_forcing`
- `StatInference.Optimization.weightedFinalGap_le_weightedGapSum`
- `StatInference.Optimization.geometricWeights_sum_eq_geom_sum`
- `StatInference.Optimization.geometricWeights_sum_pos`
- `StatInference.Optimization.geometricWeights_sum_eq_div`
- `StatInference.Optimization.geometricWeights_sum_one`
- `StatInference.Optimization.chewi34_weighted_sum_bound_of_one_step`
- `StatInference.Optimization.chewi34_weighted_sum_bound_one_based_of_one_step`
- `StatInference.Optimization.chewi34_weighted_final_gap_le_weighted_gap_sum`
- `StatInference.Optimization.chewi34_final_gap_le_weighted_denominator_of_one_step`
- `StatInference.Optimization.chewi34_final_gap_le_geometric_denominator_of_one_step`
- `StatInference.Optimization.chewi34_final_gap_le_alpha_zero_denominator_of_one_step`
- `StatInference.Optimization.oneStepRecurrence_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi34_weighted_sum_bound_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi34_weighted_sum_bound_one_based_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi34_final_gap_le_weighted_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi34_final_gap_le_geometric_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi34_final_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi34_final_gap_le_geometric_denominator_of_firstOrderStrongConvexOn_of_descent`
- `StatInference.Optimization.chewi34_final_gap_le_alpha_zero_denominator_of_firstOrderStrongConvexOn_of_descent`
- `StatInference.Optimization.chewi34_final_gap_le_geometric_denominator_of_strongConvexOn_univ_hasGradientAt_of_descent`
- `StatInference.Optimization.chewi34_final_gap_le_alpha_zero_denominator_of_strongConvexOn_univ_hasGradientAt_of_descent`
- `StatInference.Optimization.oneStepGap_le_of_polyakLojasiewiczOn`
- `StatInference.Optimization.oneStepGap_le_of_polyakLojasiewiczOn_of_le_inv`
- `StatInference.Optimization.gapRecurrence_of_polyakLojasiewiczOn`
- `StatInference.Optimization.scalarRecurrence_le_pow`
- `StatInference.Optimization.chewi36_gap_le_of_polyakLojasiewiczOn`
- `StatInference.Optimization.chewi36_gap_le_of_polyakLojasiewiczOn_of_le_inv`
- `StatInference.Optimization.sum_range_sub_succ`
- `StatInference.Optimization.gradient_sq_step_le_drop_of_smoothWithGradientOn`
- `StatInference.Optimization.gradient_sq_step_le_drop_of_trajectory`
- `StatInference.Optimization.chewi37_gradient_sq_sum_bound`
- `StatInference.Optimization.exists_le_average_of_sum_le`
- `StatInference.Optimization.chewi37_exists_grad_sq_le`
- `StatInference.Optimization.chewi37_exists_grad_norm_le`
- `StatInference.Optimization.chewi37_exists_grad_norm_le_of_le_inv`
- `StatInference.Optimization.chewi37_min_grad_norm_le`
- `StatInference.Optimization.chewi37_min_grad_norm_le_of_le_inv`
- `StatInference.Optimization.gradientSpanSubmodule`
- `StatInference.Optimization.affineGradientSpan`
- `StatInference.Optimization.IsGradientSpanTrajectory`
- `StatInference.Optimization.mem_affineGradientSpan_iff`
- `StatInference.Optimization.gradient_mem_gradientSpanSubmodule`
- `StatInference.Optimization.gradientSpanSubmodule_mono`
- `StatInference.Optimization.gradientDescentStep_sub_initial_mem_gradientSpanSubmodule`
- `StatInference.Optimization.IsGradientDescentTrajectory.isGradientSpanTrajectory`
- `StatInference.Optimization.gradientDescentTrajectory_mem_gradientSpanSubmodule`
- `StatInference.Optimization.gradientDescentTrajectory_mem_affineGradientSpan`
- `StatInference.Optimization.coordinatePrefixSubmodule`
- `StatInference.Optimization.mem_coordinatePrefixSubmodule_iff`
- `StatInference.Optimization.coordinatePrefixSubmodule_mono`
- `StatInference.Optimization.coordinatePrefixSubmodule_eq_top_of_le`
- `StatInference.Optimization.gradientSpanSubmodule_le_coordinatePrefixSubmodule`
- `StatInference.Optimization.gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next`
- `StatInference.Optimization.lowerBoundChainGradient`
- `StatInference.Optimization.lowerBoundChainNode`
- `StatInference.Optimization.lowerBoundChainEdge`
- `StatInference.Optimization.lowerBoundChainDirectionNode`
- `StatInference.Optimization.lowerBoundChainDirectionEdge`
- `StatInference.Optimization.lowerBoundChainEdge_sub`
- `StatInference.Optimization.lowerBoundChainEdge_add_direction`
- `StatInference.Optimization.lowerBoundChainObjective`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction`
- `StatInference.Optimization.lowerBoundChainDirectionEnergy_nonneg`
- `StatInference.Optimization.sq_sub_le_two_mul_sq_add_two_mul_sq`
- `StatInference.Optimization.lowerBoundChain_directionNode_succ_sq_sum`
- `StatInference.Optimization.lowerBoundChain_directionNode_sq_sum`
- `StatInference.Optimization.lowerBoundChainDirectionEnergy_le_four_norm_sq`
- `StatInference.Optimization.lowerBoundChain_sum_mul_directionNode_succ`
- `StatInference.Optimization.lowerBoundChain_sum_mul_directionNode`
- `StatInference.Optimization.lowerBoundChain_edge_direction_sum_eq_edgeDifference_sum`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_ge_linear`
- `StatInference.Optimization.lowerBoundChainObjective_ge_linear`
- `StatInference.Optimization.lowerBoundChainTextbookObjective`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_add_direction`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_linear`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_eq_objective_gap`
- `StatInference.Optimization.finSum_forwardDifference`
- `StatInference.Optimization.lowerBoundChainEdge_sum`
- `StatInference.Optimization.lowerBoundChainGradient_eq_edgeDifference`
- `StatInference.Optimization.inner_lowerBoundChainGradient_eq_edgeDifference_sum`
- `StatInference.Optimization.inner_lowerBoundChainGradient_eq_edgeDirection_sum`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_inner`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_ge_inner`
- `StatInference.Optimization.lowerBoundChainObjective_ge_inner`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_add_direction_inner`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_inner`
- `StatInference.Optimization.lowerBoundChainObjective_add_direction_le_smooth`
- `StatInference.Optimization.lowerBoundChainObjective_le_smooth`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_add_direction_le_smooth`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_le_smooth`
- `StatInference.Optimization.continuous_lowerBoundChainNode`
- `StatInference.Optimization.continuous_lowerBoundChainEdge`
- `StatInference.Optimization.continuous_lowerBoundChainObjective`
- `StatInference.Optimization.continuous_lowerBoundChainTextbookObjective`
- `StatInference.Optimization.lowerBoundChainObjective_firstOrderConvex`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_firstOrderConvex`
- `StatInference.Optimization.lowerBoundChainObjective_smoothWithGradientOn`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_smoothWithGradientOn`
- `StatInference.Optimization.lowerBoundChainGradient_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_lowerBoundChainGradient`
- `StatInference.Optimization.lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainGradient_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainMinimizer_coord_nonneg`
- `StatInference.Optimization.lowerBoundChainMinimizer_coord_le_one`
- `StatInference.Optimization.lowerBoundChainMinimizer_coord_sq_le_one`
- `StatInference.Optimization.lowerBoundChainMinimizer_norm_sq_le_dim`
- `StatInference.Optimization.lowerBoundChainNode_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainEdge_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainObjective_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChain_edgeSquareSum_ge`
- `StatInference.Optimization.lowerBoundChainObjective_ge_minValue`
- `StatInference.Optimization.lowerBoundChainObjective_isMinOn_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_minValue`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_isMinOn_lowerBoundChainMinimizer`
- `StatInference.Optimization.lowerBoundChain_prefixEdge_sum_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChain_prefixEdgeSquareSum_ge_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChain_prefixEdgeSquareSum_le_full`
- `StatInference.Optimization.lowerBoundChainObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`
- `StatInference.Optimization.lowerBoundChainObjective_gap_ge_of_gradientSpanTrajectory`
- `StatInference.Optimization.lowerBoundChainObjective_gap_ge_two_mul_add_one`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_ge_of_gradientSpanTrajectory`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_ge_norm_scaled_of_gradientSpanTrajectory`
- `StatInference.Optimization.lowerBoundChainTextbookObjective_gap_ge_two_mul_add_one`
- projection lemmas for convex-set, segment inequality, smooth upper model,
  continuity, mathlib-gradient Lipschitzness, and trajectory successor steps.

Next manual goal targets: use the now-compiled Chapter 4 Lemma 4.2 reduction
package to derive the strongly-convex lower-bound Theorem 4.5 from the
compiled Theorem 4.4 lower-bound lane, then decide whether to source-report
Theorem 4.4 or the Theorem 4.5 reduction first.  The
`StatInference/Optimization/Reductions.lean` module already compiles
`quadraticRegularizedAround`, `regularizedGradient`,
`quadraticRegularizedAround_firstOrderStrongConvexOn`,
`quadraticRegularizedAround_smoothWithGradientOn`,
`le_quadraticRegularizedAround`,
`quadraticRegularizedAround_near_min_le_base_add_penalty`,
`quadraticRegularizedAround_near_min_gap_le_eps`,
`regularization_penalty_le_of_norm_le`,
`regularized_minimizer_dist_le_of_base_min`, and
`regularized_smoothness_le_two_beta`, plus the newer
`regularization_delta_pos`, `regularization_delta_le_beta_of_eps_le`,
`regularization_delta_mul_radius_sq`,
`regularization_penalty_le_eps_of_norm_le_radius`,
`quadraticRegularizedAround_near_min_gap_le_eps_of_radius`,
`regularized_minimizer_dist_le_radius_of_base_min_delta`,
`quadraticRegularizedAround_smoothWithGradientOn_two_beta`,
`regularized_conditionNumber_le`,
`lemma42_regularization_complexity_package`,
`lemma42_regularization_reduction_package`, and
`lemma42_regularization_reduction_package_of_isMinOn`.  Do not repeat these.
The latest source-shaped Theorem 4.5 reduction plumbing now compiles:
`Theorem45.lean` instantiates Lemma 4.2 on the concrete Theorem 4.4 lower-bound
chain through `lowerBoundChainMinimizer_norm_le_sqrt_dim`,
`chewi45_lowerBoundChain_regularization_complexity_package`,
`chewi45_lowerBoundChain_regularization_reduction_package`, and
`chewi45_lowerBoundChain_regularization_reduction_package_sqrt_dim`.  Do not
repeat this regularization/condition-number/radius package.  The newest
obstruction layer also compiles:
`lowerBoundChainTextbookObjective_gap_ge_of_mem_coordinatePrefixSubmodule`,
`regularizedLowerBoundChainGradient_mem_coordinatePrefixSubmodule`,
`gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_regularizedLowerBoundChainGradient`,
`chewi45_convex_lower_bound_le_eps_of_regularizedGradientSpan_near_min`,
`chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min`,
and `chewi45_not_regularizedGradientSpan_near_min_of_eps_lt_two_mul_add_one_bound`.
The finite iteration-count layer also compiles:
`chewi45_iteration_count_ge_of_two_mul_add_one_lower_bound`,
`chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min`, and
`chewi45_not_regularizedGradientSpan_near_min_of_iteration_count_lt`.  Do not
repeat the prefix-support, `d = 2N + 1` obstruction, or the algebra converting
`beta / (16 * (N + 1)) <= eps` into `beta / (16 * eps) - 1 <= N`.  The newest
source-shaped rate wrappers also compile:
`chewi45_iteration_count_ge_rate_of_regularizedGradientSpan_near_min`,
`chewi45_iteration_count_ge_sqrtKappa_log_rate_of_regularizedGradientSpan_near_min`,
and `chewi45_not_regularizedGradientSpan_near_min_of_sqrtKappa_log_rate_lt`.
Do not repeat the arbitrary-rate or `c * sqrt(kappa) * log(ratio)` wrapper.
The direct Exercise 4.2 route now also has compiled geometric-tail obstruction
plumbing: `chewi45GeometricRatio`,
`chewi45GeometricRatio_nonneg`, `chewi45GeometricRatio_pos`,
`chewi45GeometricRatio_lt_one`, `chewi45GeometricRatio_le_one`,
`chewi45GeometricRatio_pow_nonneg`,
`strongLowerBoundChainObjective_gap_ge_geometric_tail_of_gradientSpanTrajectory`,
`chewi45_gap_ge_geometricRatio_tail_of_gradientSpanTrajectory`, and
`chewi45_not_near_min_of_geometricRatio_tail_lower_bound`.  Do not repeat the
tail-to-gap assembly.  The newest geometric-candidate algebra also compiles:
`chewi45GeometricRatio_quadratic`, `chewi45GeometricRatio_recurrence`,
`chewi45GeometricRatio_pow_recurrence`,
`strongLowerBoundGeometricCandidate`, `strongLowerBoundGeometricCandidate_apply`,
and `strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_interior`.
The boundary-coordinate layer also now compiles:
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_first`,
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_not_last`, and
`strongLowerBoundChainGradient_geometricCandidate_eq_terminal_residual`.
Do not repeat the scalar characteristic-root algebra, the nonterminal
zero-gradient proof, or the exact terminal-residual computation.  The finite
correction route now also compiles:
`chewi45GeometricRatio_finiteDenominator_pos`,
`chewi45GeometricRatio_finiteDenominator_ne_zero`,
`strongLowerBoundFiniteGeometricNode`,
`strongLowerBoundFiniteGeometricNode_zero`,
`strongLowerBoundFiniteGeometricNode_last`,
`strongLowerBoundFiniteGeometricCandidate`,
`strongLowerBoundFiniteGeometricCandidate_apply`,
`strongLowerBoundFiniteGeometricNode_recurrence`, and
`strongLowerBoundChainGradient_finiteGeometricCandidate_eq_zero` show that the
corrected finite geometric vector is an exact zero-gradient point for the
strongly-convex hard chain.  The concrete wrappers
`chewi45_gap_ge_geometricRatio_tail_of_finiteGeometricCandidate` and
`chewi45_not_near_min_of_finiteGeometricCandidate_tail_lower_bound` remove the
old supplied zero-gradient hypothesis.  The reusable tail primitives
`coordinate_sq_le_coordinateTailSq`, `coordinateTailSq_anti_mono`,
`coordinateTailSq_zero_eq_norm_sq`, `norm_zero_sub_sq_eq_coordinateTailSq_zero`,
and
`chewi45_gap_ge_geometricRatio_tail_of_finiteGeometricCandidate_tailSq` now
isolate the remaining comparison as
`q^(2N) * coordinateTailSq d 0 xStar <= coordinateTailSq d N xStar`.
The finite-boundary comparison layer now compiles:
`strongLowerBoundFiniteGeometricNode_nonneg`,
`strongLowerBoundFiniteGeometricNode_le_geometric`,
`geometric_mul_boundary_le_strongLowerBoundFiniteGeometricNode`,
`strongLowerBoundFiniteGeometricCandidate_nonneg`,
`strongLowerBoundFiniteGeometricCandidate_le_geometric`,
`geometric_mul_boundary_le_strongLowerBoundFiniteGeometricCandidate`,
`strongLowerBoundFiniteGeometricCandidate_sq_le_geometric_sq`,
`geometric_boundary_sq_le_finiteGeometricCandidate_sq`,
`coordinateTailSq_finiteGeometricCandidate_le_geometric`,
`finiteGeometricCandidate_coordinate_sq_le_coordinateTailSq`, and
`geometric_boundary_sq_le_finiteGeometricCandidate_coordinateTailSq`.  Reuse
these before reopening the corrected-node algebra.
The concrete finite-boundary obstruction wrappers now also compile:
`chewi45_gap_ge_geometric_boundary_of_finiteGeometricCandidate` and
`chewi45_not_near_min_of_finiteGeometricCandidate_boundary_lower_bound`.  They
turn one corrected-candidate tail coordinate into a fully discharged finite
gap lower bound with no supplied tail-comparison hypothesis.
The finite slack/log stepping stone now also compiles:
`chewi45_gap_ge_geometric_boundary_floor_of_finiteGeometricCandidate`,
`chewi45_gap_ge_geometric_half_boundary_of_finiteGeometricCandidate`, and
`chewi45_not_near_min_of_finiteGeometricCandidate_half_boundary_lower_bound`.
These package any lower floor on the finite-boundary correction factor, and in
particular reduce the next concrete finite route to proving
`q^(2*d+2-2*(N+1)) <= 1/2`, which gives the clean gap lower bound
`(alpha/8) * q^(2*(N+1))`.
The half-boundary monotonicity bridge now also compiles:
`chewi45GeometricRatio_pow_le_half_of_exponent_le`,
`chewi45_half_boundary_condition_of_exponent_le`, and
`chewi45_gap_ge_geometric_half_boundary_of_finiteGeometricCandidate_of_exponent_le`.
These let the log/dimension proof establish `q^M <= 1/2` for any convenient
smaller exponent `M <= 2*d+2-2*(N+1)` and then reuse the compiled finite gap
bound.
The exponent-bridge near-minimality layer now also compiles:
`chewi45_not_near_min_of_finiteGeometricCandidate_half_boundary_lower_bound_of_exponent_le`
and
`chewi45_geometric_half_boundary_lower_bound_le_eps_of_near_min_of_exponent_le`.
The latter is the preferred next input for iteration conversion: under the
finite `M` half-bound, any `eps`-near iterate forces
`(alpha/8) * q^(2*(N+1)) <= eps`.
The log-to-half bridge now compiles:
`chewi45GeometricRatio_pow_le_half_of_nat_mul_log_le`,
`chewi45_half_boundary_condition_of_log_exponent_le`, and
`chewi45_geometric_half_boundary_lower_bound_le_eps_of_near_min_of_log_exponent_le`.
These replace the raw `q^M <= 1/2` assumption by the logarithmic sufficient
condition `(M : Real) * log q <= log (1/2)`.
The scalar log-rate conversion now also compiles:
`chewi45_rate_le_iterations_of_log_chain`,
`chewi45_iteration_count_ge_rate_of_geometric_eps_lower_bound`,
`chewi45_iteration_count_ge_rate_of_finiteGeometricCandidate_log_near_min`,
and `chewi45_not_finiteGeometricCandidate_near_min_of_log_rate_lt`.  These use
mathlib `Real.log_le_log_iff`, `Real.log_pow`, `Real.log_neg`,
`le_div_iff₀`, and `mul_le_mul_right_of_neg` to convert the verified finite
geometric lower bound plus a supplied scalar log comparison into `rate <= N`.
The canonical quotient-rate variant now compiles too:
`chewi45_logQuotientRate_log_comparison`,
`chewi45_iteration_count_ge_logQuotientRate_of_geometric_eps_lower_bound`,
`chewi45_iteration_count_ge_logQuotientRate_of_finiteGeometricCandidate_log_near_min`,
and `chewi45_not_finiteGeometricCandidate_near_min_of_logQuotientRate_lt`.
This eliminates the redundant `hrate_log` hypothesis when the rate is chosen
as `log (eps/(alpha/8)) / (2*log q) - 1`.
The standard source-dimension specialization now compiles:
`chewi45_two_mul_add_one_boundary_exponent_eq`,
`chewi45_iteration_count_ge_logQuotientRate_two_mul_add_one`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_logQuotientRate_lt_two_mul_add_one`.
These instantiate `d = 2*N+1` and `M = 2*(N+1)`, discharging `N < d` and the
finite boundary inequality by `omega`.
The half-boundary rate conversion now also compiles:
`chewi45_log_half_bound_of_logQuotient_iteration_lower_bound` and
`chewi45_not_finiteGeometricCandidate_near_min_of_two_logQuotient_rates`.
The latter is the current strongest direct finite route: it rules out
near-minimality from two explicit rate comparisons,
`log(1/2)/(2*log q)-1 <= N` and
`N < log(eps/(alpha/8))/(2*log q)-1`, with `q = chewi45GeometricRatio kappa`.
The condition-number comparison layer now compiles:
`chewi45GeometricRatio_sub_one`,
`chewi45GeometricRatio_inv_sub_one`,
`chewi45GeometricRatio_log_le_neg_two_div_sqrt_add_one`,
`chewi45GeometricRatio_neg_two_div_sqrt_sub_one_le_log`,
`chewi45_logQuotientRate_le_sqrt_add_one_bound`,
`chewi45_sqrt_sub_one_bound_le_logQuotientRate`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_conditionNumber_rates`.
Search-first result: reused mathlib `Real.log_le_sub_one_of_pos`,
`Real.log_inv`, `div_le_div_of_nonneg_left`, `mul_le_mul_of_nonpos_left`,
and local positivity/ratio facts.  The strongest direct finite obstruction is
now phrased with `(sqrt kappa + 1)` for the finite half-boundary gate and
`(sqrt kappa - 1)` for the `eps`-rate gate.
The constant-cleanup layer now compiles:
`chewi45_two_le_sqrt_of_four_le`,
`chewi45_sqrt_add_one_le_three_halves_sqrt_of_four_le`,
`chewi45_half_sqrt_le_sqrt_sub_one_of_four_le`,
`chewi45_sqrt_add_one_rate_le_three_halves_sqrt_rate`,
`chewi45_half_sqrt_rate_le_sqrt_sub_one_rate`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_sqrtKappa_rates`.
Under `4 <= kappa`, the direct finite obstruction is now phrased using pure
`sqrt(kappa)` gates: `3/2 * sqrt(kappa)` for the half-boundary gate and
`sqrt(kappa)/2` for the `eps` gate.
The positive-log presentation layer now compiles:
`chewi45_log_half_eq_neg_log_two`,
`chewi45_neg_log_eps_div_alpha_eighth_eq_log_alpha_eighth_div_eps`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_sqrtKappa_positiveLog_rates`.
This rewrites the two `sqrt(kappa)` gates into source-facing
`log 2` and `log ((alpha/8)/eps)` forms.
The source-constant window wrapper now also compiles as
`chewi45_not_finiteGeometricCandidate_near_min_of_source_positiveLog_window`;
it multiplies out the gates to the textbook-facing constants
`3 * sqrt(kappa) * log 2 / 8 - 1 <= N` and
`N < sqrt(kappa) * log ((alpha/8)/eps) / 8 - 1`.
The source window nonemptiness comparisons also compile as
`chewi45_source_positiveLog_half_gate_le_eps_gate`,
`chewi45_source_positiveLog_half_gate_lt_eps_gate_of_kappa_pos`, and
`chewi45_source_positiveLog_half_gate_lt_eps_gate_of_four_le`, so a
large-log assumption `3 * log 2 < log ((alpha/8)/eps)` can now be converted
directly into the strict source-window ordering under `4 <= kappa`.
The contradiction-to-lower-bound conversion now compiles as
`chewi45_source_positiveLog_rate_le_of_finiteGeometricCandidate_near_min`:
assuming the finite half-boundary gate and an `eps`-near gradient-span
trajectory for the corrected finite geometric candidate, Lean derives
`sqrt(kappa) * log ((alpha/8)/eps) / 8 - 1 <= N`.
The burn-in-or-rate presentation now compiles as
`chewi45_source_positiveLog_burnin_or_rate_le_of_finiteGeometricCandidate_near_min`:
without assuming the finite half-boundary gate in advance, any such near-min
trajectory either has `N < 3 * sqrt(kappa) * log 2 / 8 - 1` or satisfies the
source rate lower bound above.
Search/source correction: Exercise 4.2 is stated for an infinite-dimensional
`R^infty` chain, and scalar checks of the finite corrected truncation show the
literal `q^(2N)` tail factor is approached from below rather than true for all
finite `d` without extra slack.  The next atomic target is therefore either a
source-level theorem wrapper that turns this burn-in disjunction into a
clean textbook corollary under an explicit non-burn-in or large-log iteration
regime for the `gtrsim sqrt(kappa) log(alpha||x0-x*||^2/eps)` statement, or a
true
`l^2`/infinite-sequence model where the exact Exercise 4.2 tail identity
should hold.  The reduction-route comparison
`c * sqrt(kappa) * log(ratio) <= beta / (16 * eps) - 1` remains an alternate
assembly target when concrete condition-number/log hypotheses make it faster.
Search mathlib/local APIs for `Real.log` monotonicity, `Real.exp` inversions,
sqrt/order facts, finite geometric sums, recurrence solutions, and asymptotic
iteration-count wrappers before introducing any new complexity primitive.
The first true infinite-chain substrate now compiles in
`StatInference/Optimization/Exercises.lean`: `exercise42_geometric_l2_term_eq`,
`exercise42_geometric_memℓp_two`, `exercise42InfiniteGeometric`,
`exercise42InfiniteGeometric_apply`, and
`exercise42InfiniteGeometric_norm_sq` use mathlib `lp`, `Memℓp`,
`lp.norm_rpow_eq_tsum`, `summable_geometric_of_lt_one`, and
`tsum_geometric_of_lt_one` to prove that the nonnegative profile
`n |-> q^n` is in `ell^2` and has squared norm `(1 - q^2)^{-1}` for
`0 <= q < 1`.  The exact infinite tail identity also now compiles:
`exercise42InfiniteTailSq`, `exercise42_geometric_l2_tail_term_eq`,
`exercise42InfiniteGeometric_tailSq_eq`,
`exercise42InfiniteGeometric_tailSq_eq_pow_mul_norm_sq`,
`exercise42InfiniteGeometric_tailSq_eq_pow_mul_zero_dist_sq`, and
`exercise42InfiniteGeometric_pow_mul_zero_dist_sq_le_tailSq` prove that the
tail after `N` coordinates is `(q^2)^N` times the full squared norm, equivalently
the zero-start squared distance.  This reused mathlib `tsum_mul_left` and
`tsum_congr`; no new summability primitive was needed.  The actual shifted
hard-chain minimizer profile now also compiles as
`exercise42InfiniteGeometricMinimizer` with apply/norm/tail identities
`exercise42InfiniteGeometricMinimizer_apply`,
`exercise42InfiniteGeometricMinimizer_norm_sq`,
`exercise42InfiniteGeometricMinimizer_tailSq_eq`, and
`exercise42InfiniteGeometricMinimizer_tailSq_eq_pow_mul_zero_dist_sq`.
The infinite no-terminal-residual gradient coordinate formula
`exercise42InfiniteChainGradient` compiles, and
`exercise42InfiniteChainGradient_geometricMinimizer_eq_zero` plus
`exercise42InfiniteChainGradient_geometricMinimizer_eq_zero_of_kappa` prove the
Chewi-ratio shifted profile is an exact zero-gradient point in every
coordinate.  Search-first reuse: mathlib `lp.coeFn_smul`,
`lp.norm_const_smul`, local `chewi45GeometricRatio_pow_recurrence`, and the
finite Theorem 4.5 ratio algebra; no new recurrence primitive was introduced.
The supplied infinite tail-to-gap obstruction now compiles too:
`exercise42InfinitePrefixSupported`, `exercise42InfinitePrefixSubmodule`,
`mem_exercise42InfinitePrefixSubmodule_iff`,
`exercise42InfinitePrefixSubmodule_mono`,
`gradientSpanSubmodule_le_exercise42InfinitePrefixSubmodule`,
`gradientSpanTrajectory_mem_exercise42InfinitePrefixSubmodule_of_grad_mem_next`,
`exercise42InfiniteTailSq_le_sqdist_of_prefixSupported`,
`exercise42Infinite_gap_ge_tailSq_of_lowerModel`, and
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_lowerModel`
show that a prefix-supported iterate plus a supplied strong lower model at the
shifted minimizer forces the exact
`(alpha/2) * (q^2)^N * ‖0 - x_*‖^2` function-gap obstruction.  Reused mathlib
`lp.norm_rpow_eq_tsum`, `Summable.sum_add_tsum_nat_add`, and nonnegative
finite-sum/tsum decomposition; no new infinite-series primitive was introduced.
The gradient-span support induction now also compiles for the supplied
infinite hard-chain gradient oracle:
`exercise42InfiniteChainGradient_mem_prefixSubmodule_of_apply`,
`exercise42InfiniteGradientSpanTrajectory_mem_prefixSubmodule_of_apply`,
`exercise42InfiniteGradientSpanTrajectory_prefixSupported_of_apply`, and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_lowerModel`.
The lower-model input is now reduced to the first-order interface:
`exercise42InfiniteGeometricMinimizer_grad_eq_zero_of_apply`,
`exercise42InfiniteGeometricMinimizer_isMinOn_concreteGradient`,
`exercise42InfiniteGeometricMinimizer_lowerModel_of_firstOrder`,
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_firstOrder`,
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_firstOrder`,
and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometricRatio_tail_of_firstOrder`
combine `FirstOrderStrongConvexOn`, the Chewi hard-chain coordinate gradient,
the zero-gradient minimizer certificate, and the support induction into the
exact geometric function-gap obstruction.
The concrete source objective layer now compiles:
`exercise42InfiniteChainEdgeSq_summable`,
`exercise42InfiniteChainObjective`,
`exercise42InfiniteChainObjective_apply`, and
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder`.
The source display
`((beta-alpha)/8) * (x[0]^2 + tsum (x[n]-x[n+1])^2 - 2*x[0]) +
(alpha/2)*‖x‖^2` is now a reusable Lean objective on `ell^2`.
The infinite log bridge now also compiles:
`exercise42_iteration_count_ge_logQuotientRate_of_sq_geometric_eps_lower_bound`
and
`exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min`
convert the exact geometric obstruction into the source log-quotient iteration
lower bound with constant `(alpha/2) * ‖0 - x_*‖^2`.  The concrete `ell^2`
gradient oracle now also compiles:
`exercise42Infinite_shiftForward_memℓp_two`,
`exercise42Infinite_shiftBackwardZero_memℓp_two`,
`exercise42Infinite_predecessor_memℓp_two`,
`exercise42InfiniteChainGradient_memℓp_two`,
`exercise42InfiniteChainGradientLp`,
`exercise42InfiniteChainGradientLp_apply`,
`exercise42InfiniteChainGradientLp_mem_prefixSubmodule`,
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder_concreteGradient`,
and
`exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min_concreteGradient`.
Search-first result: this reuses mathlib/local `lp`, `Memℓp.add/sub/const_smul`,
`lp.single`, `summable_nat_add_iff`, and existing prefix-support induction
instead of inventing a new sequence space.  The regularization bridge now
also compiles:
`exercise42InfiniteBaseChainObjective`,
`exercise42InfiniteBaseChainGradient`,
`exercise42InfiniteBaseChainGradientLp`,
`exercise42InfiniteBaseChainGradientLp_apply`,
`exercise42InfiniteChainObjective_eq_quadraticRegularizedAround`,
`exercise42InfiniteChainGradientLp_eq_regularizedGradient`, and
`exercise42InfiniteChainObjective_firstOrderStrongConvexOn_of_base`.
This reuses `quadraticRegularizedAround_firstOrderStrongConvexOn_convex`
instead of reproving the quadratic regularizer algebra in the infinite model.
The edge-energy substrate for the remaining convex base lower model now
compiles:
`exercise42InfiniteBaseChainEdge`,
`exercise42InfiniteBaseChainDirectionEdge`,
`exercise42InfiniteBaseChainEdgeSq_summable`,
`exercise42InfiniteBaseChainDirectionEdgeSq_summable`,
`exercise42InfiniteBaseChainEdgeLp`,
`exercise42InfiniteBaseChainEdgeLp_apply`,
`exercise42InfiniteBaseChainDirectionEdgeLp`,
`exercise42InfiniteBaseChainDirectionEdgeLp_apply`,
`exercise42InfiniteBaseChainEdge_mul_direction_summable`,
`exercise42InfiniteBaseChainEdge_add_direction`, and
`exercise42InfiniteBaseChainObjective_eq_edge_tsum`.  The exact direction
expansion and nonnegative-remainder lower model also compile as
`exercise42InfiniteBaseChainObjective_add_direction`,
`exercise42InfiniteBaseChainObjective_add_direction_ge_edge_linear`, and
`exercise42InfiniteBaseChainObjective_ge_edge_linear`.  This mirrors the
finite `lowerBoundChainTextbookObjective_add_direction` route and reuses
`summable_nat_add_iff`, `lp.summable_inner`, and the existing infinite
edge-square summability.  The summation-by-parts bridge now also compiles:
`exercise42InfiniteBaseChain_edge_direction_sum_range_eq_core_sum_sub_boundary`
proves the finite boundary identity,
`exercise42InfiniteBaseChain_edge_direction_tsum_eq_core_tsum` passes to the
`ell^2` limit, and
`inner_exercise42InfiniteBaseChainGradientLp_eq_edgeDirection_tsum` identifies
the edge-linear work with
`inner ℝ (exercise42InfiniteBaseChainGradientLp gamma x) (y - x)`.  This
reuses mathlib `lp.inner_eq_tsum`, `lp.summable_inner`,
`Summable.tendsto_atTop_zero`, and `tendsto_add_atTop_nat`.  Consequently
`exercise42InfiniteBaseChainObjective_firstOrderConvex` and
`exercise42InfiniteChainObjective_firstOrderStrongConvexOn` discharge the
formerly supplied first-order package for the concrete infinite hard-chain
objective.  The no-supplied-interface geometric/log wrappers now compile as
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_concreteGradient`
and
`exercise42InfiniteChainObjective_logQuotientRate_le_near_min_concreteGradient`.
The newest source-rate wrappers convert this exact quotient into the
textbook-shaped square-root condition-number form:
`exercise42InfiniteChainObjective_sqrtSubOneLogRate_le_near_min_concreteGradient`
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient`.
They reuse `chewi45_sqrt_sub_one_bound_le_logQuotientRate` and
`chewi45_half_sqrt_rate_le_sqrt_sub_one_rate`, so no new real-log comparison
primitive was introduced.  The small-accuracy side condition is now discharged
by `exercise42InfiniteGeometricInitialScale_pos` and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient_of_eps_le_initialScale`,
which derive the needed `log(eps / scale) <= 0` from
`eps <= (alpha/2) * ‖x_0 - x_*‖^2`.  The literal source exponent display now
also compiles as
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_concreteGradient`,
rewriting `(q^2)^N` to `q^(2N)` with `pow_mul` and `omega`.  The follow-up
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_minValue_concreteGradient`
now names the optimum value as `fstar`, giving the textbook-shaped right side
`f(x_N)-f_*` once `hfstar` identifies `fstar` with the geometric minimizer
value.  The public rate wrapper
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_fstar_concreteGradient`
now also compiles: its near-minimality hypothesis is exactly the source-shaped
`f(x_N) <= f_* + eps`, while `hfstar` records that `f_*` is the geometric
minimizer value.  The newest layer removes that bookkeeping by defining
`exercise42InfiniteChainObjectiveMinValue` and proving
`exercise42InfiniteChainObjectiveMinValue_le_concreteGradient`,
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_optValue_concreteGradient`,
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_optValue_concreteGradient`.
The public Exercise 4.2 rate route can now state near-minimality directly
against the named optimum value.  Next direct step: feed this opt-value package
into the Theorem 4.5 lower-bound route, or factor the infinite Exercise 4.2
substrate into a pre-`Theorem45` module if Theorem 4.5 itself must import it
without a cycle.
The newest smoothness bridge also compiles:
`exercise42InfiniteBaseChainDirectionEnergy_le_four_norm_sq`,
`exercise42InfiniteBaseChainObjective_add_direction_inner`,
`exercise42InfiniteBaseChainObjective_add_direction_le_smooth`,
`exercise42InfiniteBaseChainObjective_le_smooth`, and
`exercise42InfiniteChainObjective_le_smooth`.  This proves the full two-point
`beta`-smooth upper inequality for the concrete infinite hard-chain objective.
The continuity blocker is now also closed: the compiled declarations
`continuous_exercise42InfiniteBaseChainObjective`,
`exercise42InfiniteBaseChainObjective_smoothWithGradientOn`,
`continuous_exercise42InfiniteChainObjective`, and
`exercise42InfiniteChainObjective_smoothWithGradientOn` give the full supplied
`SmoothWithGradientOn Set.univ` interface for the infinite Exercise 4.2 hard
instance.  The new
`exercise42InfiniteChainObjective_oracle_interface_package` now bundles
first-order strong convexity, smoothness, and gradient-span prefix support in
one source-facing theorem.  The Theorem 4.5-facing package step is now also
closed by `exercise42InfiniteInitialScale`,
`exercise42InfiniteInitialScale_pos`, and
`exercise42InfiniteChainObjective_theorem45_hard_instance_package`, which
combines the oracle interfaces, geometric minimizer, named optimum-value lower
bound, zero-start gradient-span support, and the opt-value `sqrt(kappa)` rate
obstruction.  The positive-log source display is also closed by
`exercise42InfiniteGeometricMinimizer_proof_irrel` and
`exercise42InfiniteChainObjective_positiveLogRate_le_near_min_optValue_concreteGradient`,
which convert the internal negative-log rate into the source-facing
`log(C/eps)` form for the named initial scale.  Next direct step: either use
this package as the source-facing direct Exercise 4.2 hard instance, or factor
the infinite substrate out of `Exercises.lean` into a pre-`Theorem45` module if
the main Theorem 4.5 file must import it without a cycle.
The concrete regularized-chain setup for Theorem 4.5 also now compiles in
`StatInference/Optimization/Theorem45.lean`: `strongLowerBoundChainObjective`,
`strongLowerBoundChainGradient`,
`strongLowerBoundChainObjective_firstOrderStrongConvexOn`,
`strongLowerBoundChainObjective_smoothWithGradientOn`,
`strongLowerBoundChainGradient_mem_coordinatePrefixSubmodule`,
`gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_strongLowerBoundChainGradient`,
and `chewi45_regularized_chain_interface_package`.  Do not repeat this setup;
the newest witness layer also compiles `coordinateTailSq`,
`coordinateTailSq_le_sqdist_of_mem_coordinatePrefixSubmodule`,
`strongLowerBoundChainObjective_gap_ge_tailSq_of_gradient_eq_zero`, and
`strongLowerBoundChainObjective_gap_ge_tailSq_of_gradientSpanTrajectory`.  Do
not repeat these.  The remaining missing theorem content is the logarithmic
iteration-count/rate assembly or the direct Exercise 4.2 geometric tail
argument, not the already solved Lemma 4.2 or obstruction bookkeeping.

Chapter 5 current active target: the next aggressive lane is the quadratic
case and conjugate-gradient method around markdown lines 950-1070.  The new
module `StatInference/Optimization/ConjugateGradient.lean` starts the reusable
quadratic substrate with `quadraticObjective`, `quadraticGradient`,
`IsSelfAdjointOperator`, `QuadraticFormLowerBound`,
`QuadraticFormUpperBound`, `quadraticGradient_eq_zero_iff`,
`continuous_quadraticObjective`,
`quadraticObjective_eq_model_add_quadratic`,
`quadraticObjective_firstOrderStrongConvexOn`,
`quadraticObjective_smoothWithGradientOn`,
`quadraticObjective_oracle_package`, and
`quadraticObjective_isMinOn_of_apply_eq`.  The newest pass adds the Chapter 5
`A`-inner-product/Krylov substrate: `aInner`, `aNormSq`, `aInner_comm`,
`aNormSq_nonneg_of_lowerBound`, `krylovVector`, `krylovSubmodule`,
`cgDirectionSubmodule`, monotonicity and `A`-image lemmas for both Krylov and
direction spans, `IsCGKrylovRecurrence`, the Lemma 5.1 supplied-interface
theorem `IsCGKrylovRecurrence.cgDirectionSubmodule_eq_krylovSubmodule`,
`IsOrthogonalToSubmodule`, `IsCGResidualExactnessState`,
`quadraticGradient_eq_zero_of_cgResidualExactnessState`, and
`quadraticObjective_isMinOn_of_cgResidualExactnessState`.  The newest
three-term recurrence layer adds `IsCGThreeTermRecurrence`,
`IsCGThreeTermRecurrence.residual_and_direction_mem_krylovSubmodule`,
`IsCGThreeTermRecurrence.residual_mem_cgDirectionSubmodule`,
`IsCGThreeTermRecurrence.apply_direction_mem_next`,
`IsCGThreeTermRecurrence.to_isCGKrylovRecurrence`, and
`IsCGThreeTermRecurrence.cgDirectionSubmodule_eq_krylovSubmodule`.  This
bridges the source residual/direction updates
`r_{n+1}=r_n+eta_n A p_n` and `p_{n+1}=r_{n+1}+gamma_n p_n` to Lemma 5.1's
Krylov equality, assuming the line-search coefficient `eta_n` is nonzero.
The newest scalar-coefficient pass adds the displayed textbook coefficients
`cgLineSearchCoeff = -‖r_n‖^2 / <p_n,A p_n>` and
`cgDirectionUpdateCoeff = ‖r_{n+1}‖^2 / ‖r_n‖^2`, proves the squared-residual
denominator and both coefficient nonzero lemmas
`cgDirectionUpdateCoeff_denom_ne_zero`, `cgLineSearchCoeff_ne_zero`, and
`cgDirectionUpdateCoeff_ne_zero`, and packages the literal displayed residual
and direction formulas as `IsCGDisplayedIteration`.  The compiled bridges
`IsCGDisplayedIteration.to_isCGThreeTermRecurrence`,
`IsCGDisplayedIteration.to_isCGKrylovRecurrence`, and
`IsCGDisplayedIteration.cgDirectionSubmodule_eq_krylovSubmodule` now derive
Lemma 5.1 from the displayed coefficient formulas plus the exposed nonzero
residual/A-norm side conditions.  The latest termination pass adds the
source branch `residual_succ_mem_cgDirectionSubmodule_of_direction_succ_eq_zero`,
`residual_succ_eq_zero_of_direction_succ_eq_zero_and_orthogonal`, and
`quadraticObjective_isMinOn_of_direction_succ_eq_zero_and_orthogonal`, plus
the finite-dimensional counting core
`exists_residual_eq_zero_of_pairwise_orthogonal` and the Theorem 5.3-facing
wrapper `exists_quadraticObjective_isMinOn_of_pairwise_orthogonal_residuals`.
These prove that mutually orthogonal residuals identifying with quadratic
gradients force a global minimizer among the first `finrank ℝ E + 1` iterates.
The newest point-update bridge adds `quadraticGradient_succ_of_point_step`,
`residual_succ_eq_quadraticGradient_of_point_and_residual_steps`,
`residual_eq_quadraticGradient_of_point_and_residual_updates`,
`IsCGDisplayedIteration.residual_eq_quadraticGradient_of_point_updates`, and
`IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_pairwise_orthogonal`.
This connects the displayed CG point update
`x_{n+1}=x_n+eta_n p_n` to the residual-gradient invariant used by the
finite-dimensional termination wrapper.  The newest orthogonality propagation
pass adds `IsCGThreeTermRecurrence.pairwise_residual_orthogonal`,
`IsCGDisplayedIteration.pairwise_residual_orthogonal`, and
`IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_orthogonalToPrevious`:
the source-shaped invariant that each new residual is orthogonal to the
previous direction span now implies the pairwise residual orthogonality needed
for the finite-dimensional Theorem 5.3 wrapper.  The latest scalar
orthogonality pass adds
`isOrthogonalToSubmodule_cgDirectionSubmodule_of_inner_direction_eq_zero`,
`orthogonalToPrevious_of_inner_directions_eq_zero`, and
`IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_inner_directions_eq_zero`,
so it is now enough to prove the scalar source equations
`inner ℝ (r (n+1)) (p k) = 0` for every `k ≤ n`.  The newest line-search
and A-conjugacy pass proves
`inner_residual_succ_direction_eq_zero_of_inner_residual_direction_eq_norm_sq`,
`IsCGDisplayedIteration.inner_residual_direction_eq_norm_sq`,
`IsCGDisplayedIteration.inner_residual_succ_direction_self_eq_zero`,
`IsCGDisplayedIteration.inner_residual_succ_directions_eq_zero_of_aOrthogonal`,
and
`IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_aOrthogonal`.
The exact zero-direction source branch also now compiles as
`IsCGDisplayedIteration.quadraticObjective_isMinOn_of_direction_succ_eq_zero_and_aOrthogonal`:
if `p_{n+1}=0`, then the A-conjugacy route gives orthogonality to
`span {p_0,...,p_n}`, the residual-gradient bridge identifies
`r_{n+1}=∇f(x_{n+1})`, and the next iterate is a global minimizer.
The newest A-conjugacy induction pass discharges that condition from the
displayed CG updates themselves.  It proves
`IsCGDisplayedIteration.aInner_direction_self_succ_eq_zero_of_orthogonalToPrevious`,
`IsCGDisplayedIteration.aInner_direction_succ_eq_zero_of_lt_of_orthogonalToPrevious`,
`IsCGDisplayedIteration.aOrthogonal_and_inner_residual_succ_directions`,
`IsCGDisplayedIteration.aOrthogonal_directions`, and
`IsCGDisplayedIteration.inner_residual_succ_directions_eq_zero`, and upgrades
the wrappers to
`IsCGDisplayedIteration.quadraticObjective_isMinOn_of_direction_succ_eq_zero`
and `IsCGDisplayedIteration.exists_quadraticObjective_isMinOn`.  Thus the
finite-dimensional Theorem 5.3-facing termination wrapper now needs only the
displayed iteration, self-adjointness/lower-bound minimizer hypotheses, the
initial residual-gradient identity, and the matching point update; it no
longer needs an external A-conjugacy or scalar residual-orthogonality
assumption.
Search-first result: mathlib has continuous linear maps,
`continuous_id.inner`, `Continuous.inner`, `real_inner_comm`,
`real_inner_smul_left`,
`Function.iterate_succ_apply'`, `Submodule.span_induction`,
`Submodule.span_mono`, inverse scalar algebra via `smul_smul` and
`inv_mul_cancel₀`, coefficient nonzero APIs `div_ne_zero`, `neg_ne_zero`,
`pow_ne_zero`, `norm_ne_zero_iff`, `field_simp`, and `ring`, Nat split APIs
`Nat.lt_or_eq_of_le` and `Nat.lt_succ_of_le`, finite-dimensional
orthogonal-family APIs `LinearMap.BilinForm.linearIndependent_of_iIsOrtho`,
`LinearIndependent.fintype_card_le_finrank`, and `innerₗ`, and
`Submodule.orthogonal` APIs;
self-adjoint/positive
operator APIs under `Analysis/InnerProductSpace/Positive.lean` should be
searched before adding a future spectral bridge.  The current substrate
deliberately uses supplied quadratic-form bounds so it can reuse local
`FirstOrderStrongConvexOn`, `SmoothWithGradientOn`, and minimizer wrappers
without waiting for a full spectral theorem bridge.  The Theorem 5.4 lane has
now started in `StatInference/Optimization/Theorem54.lean`.
`chewi54_gradient_sq_sum_bound_of_competitive_step` compiles the first
displayed descent-sum bound: any CG-like step competitive with the `1 / beta`
gradient-descent trial step inherits the Lemma 3.1 telescoped squared-gradient
bound `(1 / (2 * beta)) * sum ||grad x_n||^2 <= f x_0 - fstar`.
The newest Theorem 5.4 packet adds
`chewi54_gradient_sq_sum_le_two_beta_gap`,
`chewi54_gap_sum_le_inner_gradient_sum`,
`chewi54_gap_sum_le_norm_gradient_sum`,
`norm_sq_sum_range_eq_sum_norm_sq_of_pairwise_orthogonal`,
`norm_sum_range_le_sqrt_sum_norm_sq_of_pairwise_orthogonal`,
`chewi54_gap_sum_le_sqrt_sum_norm_sq_mul_dist`,
`chewi54_gap_sum_le_sqrt_product_bound`,
`chewi54_gap_sum_le_sqrt_product_bound_of_competitive_step`,
`chewi54_dist_initial_le_sqrt_gap_of_firstOrderStrongConvexOn`, and
`chewi54_gap_sum_le_sqrt_product_bound_of_firstOrderStrongConvexOn`.
The scalar/rate close-out now also compiles as
`chewi54_sqrt_product_bound_le_conditioned_gap`,
`chewi54_gap_sum_le_two_sqrt_condition_mul_gap_of_firstOrderStrongConvexOn`,
and `chewi54_iteration_le_four_sqrt_condition_of_not_halved`.
The source-facing affine-minimizer wrapper layer now compiles:
`cgAffineSpan`, `mem_cgAffineSpan_iff`,
`cgPoint_sub_initial_mem_cgDirectionSubmodule_of_step`,
`gradientDescentStep_mem_cgAffineSpan_of_mem`,
`chewi54_competitive_step_of_cgAffineMinimizer`,
`chewi54_functionValue_antitone_of_competitive_step`,
`chewi54_gap_mono_of_competitive_step`,
`chewi54_first_orth_of_firstOrderStrongConvexOn`,
`chewi54_star_lower_of_firstOrderStrongConvexOn`,
`chewi54_accelerated_bound_of_cgAffineMinimizer`, and
`chewi54_accelerated_bound_of_cgAffineMinimizer_univ`.
The concrete displayed-CG bridge also compiles
`cgPoint_succ_sub_initial_mem_cgDirectionSubmodule_of_step`,
`IsCGDisplayedIteration.point_sub_initial_mem_cgDirectionSubmodule`,
`IsCGDisplayedIteration.point_succ_sub_initial_mem_cgDirectionSubmodule`,
`IsCGDisplayedIteration.quadraticGradient_mem_cgDirectionSubmodule`,
`IsCGDisplayedIteration.quadraticGradient_orthogonal_displacement`,
`IsCGDisplayedIteration.quadraticGradient_pairwise_orthogonal`, and
`IsCGDisplayedIteration.chewi54_accelerated_bound_of_cgAffineMinimizer`.
The affine minimization property itself now also compiles from first-order
convexity and residual orthogonality:
`firstOrderStrongConvexOn_isMinOn_cgAffineSpan_of_orthogonal`,
`IsCGDisplayedIteration.isMinOn_cgAffineSpan_of_point_updates`, and
`IsCGDisplayedIteration.chewi54_accelerated_bound_of_point_updates`.
This proves the source pre-halving chain through
`N * gap_N <= sqrt(2 * beta * initial_gap) *
sqrt(2 * initial_gap / alpha)` from competitive steps, first-order strong
convexity, gradient orthogonality, and the first-order/orthogonality gap
comparison, simplifies it to the readable
`N * gap_N <= 2 * sqrt(beta / alpha) * initial_gap`, and proves the halving
algebra `gap_N >= gap_0 / 2 -> N <= 4 * sqrt(beta / alpha)`.  The search-span,
residual-gradient, displacement-orthogonality, pairwise-gradient-orthogonality,
and affine-minimizer assumptions are now discharged from the displayed point
update and `IsCGDisplayedIteration`.  The restart/log endpoint packaging now
also compiles: `chewi54_halvingBlocks_gap_le`,
`chewi54_halvingBlocks_gap_le_of_power_bound`,
`chewi54_half_pow_mul_le_eps_of_log_ratio_le`, and
`chewi54_halvingBlocks_gap_le_of_log_ratio_le`.  The integer block bridge now
also compiles: `chewi54BlockSize`, `chewi54_four_sqrt_le_blockSize`,
`chewi54_block_halving_of_accelerated_block_bound`,
`chewi54_block_halving_recurrence_of_accelerated_block_bounds`,
`chewi54_log_rate_of_accelerated_block_bounds`, and
`chewi54_log_rate_of_accelerated_block_bounds_blockSize`.  Search-first reuse:
local `scalarRecurrence_le_pow`, the Chapter 4 geometric/log bridges, mathlib
`Nat.le_ceil`, and mathlib `Real.log_pow`, `Real.log_mul`, `Real.log_div`,
`Real.log_inv`, and `Real.log_le_log_iff`.  Next target: derive the per-block
accelerated bound from a restarted/displayed CG interface so the block shell
is connected to the actual algorithm, or move directly to the polynomial/
Chebyshev alternative proof after a source-facing Theorem 5.4 statement audit.
The shifted affine-minimizer block interface now compiles:
`chewi54_block_bound_of_cgAffineMinimizer_blocks`,
`chewi54_log_rate_of_cgAffineMinimizer_blocks`, and
`chewi54_log_rate_of_cgAffineMinimizer_blocks_blockSize`.  The displayed
restart layer now also compiles: `chewi54_log_rate_of_displayed_cg_blocks`
and `chewi54_log_rate_of_displayed_cg_blocks_blockSize`, reusing the existing
`IsCGDisplayedIteration` bridges to discharge the span, gradient-span,
orthogonality, and affine-minimizer assumptions inside each block.  The Theorem
5.8 AGF lane has now started in `StatInference/Optimization/Theorem58.lean`.
Compiled declarations include `IsAcceleratedGradientFlowTrajectory`,
`chewi58Friction`, `IsChewi58AcceleratedGradientFlowTrajectory`,
`agfAuxPoint`, `chewi58Lyapunov`, `chewi58Lyapunov_zero`,
`chewi58_gap_hasDerivAt`, `agfAuxPoint_hasDerivAt`,
`chewi58Lyapunov_hasDerivAt`, `chewi58Lyapunov_hasDerivWithinAt`,
`agfAuxPoint_continuousOn`, `chewi58Lyapunov_continuousOn`,
`chewi58_gap_le_of_lyapunov_le_initial`,
`chewi58_gap_le_of_lyapunov_antitoneOn`,
`chewi58LyapunovDerivative_nonpos_of_firstOrderConvex`,
`chewi58_gap_le_of_lyapunov_derivative_nonpos`, and
`chewi58_gap_le_of_lyapunov_derivative_formula_firstOrderConvex`, plus the
source-facing wrapper `chewi58_gap_le_of_agf_firstOrderConvex` with Lyapunov
continuity now discharged from the AGF trajectory and gradient oracle.
Search-first reuse: local `FirstOrderStrongConvexOn` convex lower model,
Chapter 2
`antitoneOn_of_hasDerivWithinAt_nonpos` route pattern, mathlib
`HasGradientAt.hasFDerivAt`, `HasDerivAt.smul`, `HasDerivAt.mul`,
`HasDerivAt.norm_sq`, `HasDerivWithinAt.norm_sq`, `HasDerivAt.inner`,
`ContinuousOn.smul`, `ContinuousOn.pow`, `le_div_iff₀`, `sq_nonneg`,
`field_simp`, `module`, and `nlinarith`.  The AGF ODE derivative formula,
Lyapunov continuity, and source-facing Theorem 5.8 rate wrapper are now
proved.  Next target: Theorem 5.9.  Because the notes leave it as
Exercise 5.3, first record the informal strong-convex AGF Lyapunov proof, then
formalize the reusable strong-convex friction/Lyapunov derivative layer and
the exponential rate wrapper.
Theorem 5.9 now compiles in source-shaped supplied-interface form in
`StatInference/Optimization/Theorem59.lean`: `chewi59Friction`,
`IsChewi59AcceleratedGradientFlowTrajectory`, `chewi59EnergyVector`,
`chewi59Lyapunov`, `agf_gap_hasDerivAt`,
`chewi59EnergyVector_hasDerivAt`, `chewi59Lyapunov_hasDerivAt_raw`,
`chewi59LyapunovDerivative_le_neg_sqrt_mul_of_gap_bound`,
`chewi59LyapunovDerivative_le_neg_sqrt_mul_of_firstOrderStrongConvex`,
`chewi59_gap_le_lyapunov`,
`chewi59Lyapunov_le_exp_decay_of_firstOrderStrongConvex`,
`chewi59_gap_le_initial_lyapunov_exp_decay`,
`chewi59EnergyVector_zero_of_momentum_zero`,
`chewi59Lyapunov_zero_le_two_gap_of_momentum_zero`,
`chewi59_gap_le_exp_decay_of_firstOrderStrongConvex`, and
`chewi59_gap_le_exp_decay_of_firstOrderStrongConvex_of_isMinOn`.  Search-first
reuse for this layer: local `IsAcceleratedGradientFlowTrajectory` from
Theorem 5.8, local `scalarExpDecay_le_of_hasDerivAt_le` from Chapter 2, local
minimizer/gradient-zero APIs for stationarity, and mathlib
`HasDerivAt.const_smul`, `HasDerivAt.norm_sq`, `HasGradientAt` chain rule APIs,
`norm_add_sq_real`, `Real.sq_sqrt`, `module`, `ring`, and `nlinarith`.  Next
atomic target: Theorem 5.10 discrete AGD.  Before defining new primitives,
search Chapter 3 for the compiled (3.3)-style one-step inequality, search
mathlib/local APIs for the lambda recurrence and finite telescoping algebra,
and then formalize the AGD state/update/Lyapunov wrapper.
Do not redo
Theorem 5.3's
A-conjugacy induction, the Chapter 3 descent lemma, Chapter 4 gradient-span
interfaces, or Chapter 4 hard-instance packages.

Chapter 2 route context is still available but no longer the active target:
The route
`PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn -> QG` now compiles, so the
remaining assumptions to attack are convergence to a minimizer, feasible
positive-time trajectory membership, no minimizer hit on positive times, and
nonzero displacement on positive times for `¬ IsMinOn f C x`.  The
derivative-to-antitone bridge, PL scalar sign calculation, positive-gap
derivation from no minimizer hit, gap derivative, classical nonzero
norm-derivative calculation, trajectory/gap continuity,
Lyapunov-continuity wrapper, minimizer-start split, and pointwise
side-condition-to-Lyapunov inequality are now compiled; do not repeat them.
The Corollary 2.8 compact-minimum and continuity/integrability bridge is
already compiled, so do not spend another run there unless strengthening the
continuity hypotheses materially advances the analytic route.  For Chapter 4,
reuse `LowerBounds.lean`'s single gradient-span/oracle model, the compiled
`coordinatePrefixSubmodule` induction, and `lowerBoundChainGradient`
support/minimizer/norm/objective-value/global-minimizer theorems.  The current
Chapter 4 algebra package now has zero-boundary direction nodes/edges, exact
edge residual subtraction/addition, exact shifted and source-objective
quadratic expansions, nonnegative quadratic remainders, edge-coordinate
first-order lower models, the coordinate-sum form of the inner product with
`lowerBoundChainGradient`, the summation-by-parts identity turning edge-linear
work into `inner ℝ (lowerBoundChainGradient beta d x) v`, the uniform
direction-energy bound behind the displayed Hessian/smoothness estimate, and
source convexity/smoothness wrappers:
`lowerBoundChainTextbookObjective_firstOrderConvex` and
`lowerBoundChainTextbookObjective_smoothWithGradientOn`.  Next aggressive
Chapter 4 targets are exact source-report packaging around Theorem 4.4, or
continuing to the strongly-convex lower bound Theorem 4.5 and its reduction
from Lemma 4.2 if report packaging is deferred.  Search
mathlib basis/coordinate, matrix, PSD, derivative, smoothness,
finite-sum telescoping, and Cauchy APIs before proving the full
objective-gradient bridge, convex/smooth facts, or the final source-report
packaging around the compiled Theorem 4.4 declarations.
Continue
deferring exercise proofs except where an exercise statement is needed as a
temporary interface for a main-text theorem; such exercise material belongs
in `StatInference/Optimization/Exercises.lean`.
