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
thread proves the active theorem layer.  The current scout map says:

- Chapters 6-8 should start with local `Subgradient.lean`,
  `ProjectedSubgradient.lean`, `FrankWolfe.lean`, and `Proximal.lean`,
  using source-shaped algorithmic interfaces before heavy extended-real
  convex analysis.
- Chapters 9-11 should start with `Fenchel.lean`, `Bregman.lean`,
  `MirrorDescent.lean`, and `AlternatingProjection.lean`, emphasizing
  Fenchel-Young, Bregman divergence, relative convexity/smoothness, and ABP
  telescoping wrappers.
- Chapters 12-13/Appendix A should start with `MatrixOrder.lean`,
  `StochasticGradient.lean`, `SMPGD.lean`, `Newton.lean`, and
  `SelfConcordance.lean`, reusing local empirical/probability wrappers plus
  mathlib matrix/spectral and finite-dimensional APIs.

## Manual Goal Prompt

The active app-level `/goal` text is immutable in the current tool surface
except for marking the goal complete.  Since the full textbook formalization is
not complete, this document is the live replacement prompt for manual goal
runs.

Live replacement `/goal` prompt as of 2026-05-05 after syncing local `main` to
`origin/main` at `8d279bb` (`Add Chewi ellipsoid determinant bridge`):
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
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio`.  The determinant
and scalar `hvolume` bridge is verified in focused Lean, so the next run must
not spend theorem time reproving or repackaging that determinant/source-volume
core unless it is directly needed inside the measure-scaling theorem.
The app-level
`/goal` objective text still mentions the obsolete Theorem 3.4 frontier and
cannot be edited directly through the current tool surface unless the full
textbook goal is marked complete, so this paragraph is the operative manual
`/goal` target.

Immediate target for the next manual goal run: finish the remaining
theorem-sized Chewi Lemma 6.20 matrix-and-volume packet.  The displayed
determinant ratio is now in the exact source shape
`(chewi620DisplayedShapeUpdate d Sigma p).det / Sigma.det =
ellipsoidVolumeRatio d ^ 2`, and the scalar bridge
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio` converts any
squared-volume determinant bound into the certificate's `hvolume` hypothesis.
Next, instantiate the actual mathlib measure/volume-scaling API for the
ellipsoid affine image, or, if that route balloons, record the exact missing
measure API and switch to the displayed next inverse-shape matrix equality that
identifies the local pullback next shape with Chewi's displayed
`Σ_{n+1}^{-1}` update.  The raw square-root adjoint identity, normalized cut
`hcut` bridge, `Sigma.PosDef` invertibility/cancellation layer, pullback
`hnext` certificate, current `Σ⁻¹` ellipsoid identification, displayed center
update, rank-one collapse `(Σp)^T Σ⁻¹ (Σp) = <p, Σp>`, displayed
forward-shape determinant formula, determinant/source-volume ratio, determinant
positivity/nonzero/unit facts, and scalar `hvolume` bridge are now local; this
is not a minor wrapper target.  Do not spend another run on
scalar, coordinate-free, abstract transport, current-shape, center-update,
pullback-only wrappers, rank-one collapse, or determinant-core algebra unless
one is the shortest verified route to the concrete matrix theorem.  The
dependency order is:

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
   `chewi620_displayedShapeUpdate_det`.  Volume-scaling APIs still need to be
   instantiated; use `Real.map_matrix_volume_pi_eq_smul_volume_pi` /
   `Real.map_linearMap_volume_pi_eq_smul_volume_pi` after the determinant
   ratio is in source shape.
2. Instantiate mathlib volume-scaling from the determinant/source-volume packet
   and prove a concrete measured-volume inequality that feeds
   `chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio`.
3. Prove the displayed next-shape/inverse-shape matrix equality: connect
   `chewi620PullbackStandardCutInvShape d u T` under the square-root/inverse
   hypotheses with `matrixInvShape (chewi620DisplayedShapeUpdate d Sigma p)⁻¹`.
4. Prove the determinant-to-volume bridge needed for the `hvolume` hypothesis
   of the displayed-current/displayed-center certificate, reusing the compiled
   determinant formula and mathlib volume-scaling APIs.
5. Package the exact one-step Lemma 6.20 certificate, then promote it to the
   ellipsoid trajectory/rate wrapper.

The current matrix quadratic, positive denominator, and normalized cut
direction algebra are already local, and the raw symmetric square-root
adjoint/cut bridge now discharges the `hcut` side of the affine-transport
certificate.  The `Sigma.PosDef` matrix invertibility/cancellation layer is
also local through nonsingular-inverse APIs and `matrixInvShape` composition.
The displayed-current/displayed-center packet identifies
`chewi620PullbackIdentityInvShape T` with `matrixInvShape Sigma⁻¹`, rewrites the
current ellipsoid set to Chewi's displayed form, derives the displayed center
update from `T ∘ T = Sigma`, and exposes a certificate whose only geometric
blockers are the next inverse-shape matrix equality and determinant/volume
ratio.  The rank-one collapse and determinant formula needed inside the volume
lemma now compile, so the next useful Lean work is the inverse-shape equality
or the determinant-to-volume scaling bridge.  If the full matrix proof
balloons, record the exact missing API and prove the smallest matrix-coordinate,
inverse-shape, or volume-scaling certificate that removes that blocker in the
same run.

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
normalized scalar central-cut containment, determinant-ratio inequalities, and
coordinate-free normalized half-space containment, and an abstract
affine-transport `IsEllipsoidStepCertificate` bridge.  The current-ellipsoid
matrix quadratic, positive-denominator, normalized cut-direction algebra, raw
symmetric square-root cut bridge, PosDef invertibility/cancellation layer,
pullback-standard-cut certificate, current `Σ⁻¹` identification, and displayed
center-update bridge now compile via `matrixInvShape`,
PosDef/PosSemidef dot-product APIs, `Real.sqrt` normalization, mathlib
`LinearMap.IsSymmetric`, mathlib nonsingular-inverse APIs, and mathlib
rank-one determinant APIs.  The next aggressive theorem packet should prove the
displayed next inverse-shape matrix equivalence and determinant-to-volume piece
needed by
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedCurrentAndCenter`:
search and use mathlib matrix inverse/volume APIs to connect the remaining
local pullback object and volume expression to Chewi's displayed `Σ_{n+1}`
update.  If the full matrix proof balloons, record the exact missing matrix API
and prove the smallest matrix-coordinate, inverse-shape, or volume-scaling
certificate that removes it.
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
Chapter 6 and finish theorem-sized packets instead of jumping past the chapter:
Lemma 6.20 for exact ellipsoid update geometry, then Theorems 6.21-6.23 for
nonsmooth lower bounds and Definition 6.24/Theorem 6.25 for feasibility.
Lemma 6.18 and Theorem 6.19 already have a supplied-interface algebraic spine;
their exact source-audited report remains blocked only by the genuine
Grünbaum/centroid measure theorem.
After Chapter 6 has a stable main-text spine, split future packets by chapter
surface rather than by tiny lemmas: Chapter 7 `FrankWolfe.lean` for Theorem
7.3 and Carathéodory wrappers, Chapter 8 `Proximal.lean` for Theorems 8.5 and
8.6 reusing Chapter 5 AGD algebra, Chapters 9-10 `Fenchel.lean` and
`MirrorDescent.lean` for Fenchel-Young/Bregman/OMD telescopes, Chapter 11
`AlternatingProjection.lean` for ABP/AM/RAM recurrences, Chapter 12
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
