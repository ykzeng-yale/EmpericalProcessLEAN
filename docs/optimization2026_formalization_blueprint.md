# Optimization 2026 Formalization Blueprint

This document starts the Chewi optimization lane for `StatInference/`.  The
Lean code lives in the content-based folder `StatInference/Optimization/`,
while the source crosswalk is Sinho Chewi, *Lectures on Optimization*,
March 22, 2026.

The lane has two goals:

1. Formalize the theorem-proof optimization textbook from the local
   markdown/PDF source.
2. Build reusable deterministic optimization foundations for statistical
   learning, empirical-risk minimization, stochastic approximation, and later
   theorem routes in `StatInference/`.

The lane should stay search-first: before adding a local primitive, search
pinned mathlib under `.lake/packages/mathlib`, then search nearby
`StatInference` modules for an existing proof-carrying wrapper.

## Automation Prompt Maintenance

The recurring Chewi optimization automation is an active proof-state
orchestrator.  At the end of every run that proves, blocks, merges, commits, or
pushes a theorem-line or reusable optimization layer, refresh the live
automation prompt so the next heartbeat starts from the verified current
frontier.

The prompt update should be driven by:

1. `docs/optimization2026_current_blocker_primitive_plan.md`;
2. `docs/optimization2026_progress_dashboard.md`;
3. the latest pushed commit and verified Lean declarations;
4. recent GitHub contributions from other agents that can be reused or merged.

Each refreshed prompt should name one next aggressive proof target, the
dependency order after it, the required mathlib/local searches, and the
verification/report gate.  This avoids replaying stale broad instructions after
another agent has already moved the frontier.

The recurring automation is currently paused while this thread runs under a
manual `/goal`.  The current app-level goal objective text cannot be edited
directly in this tool surface unless the goal is complete, so
`docs/optimization2026_current_blocker_primitive_plan.md` carries the live
replacement prompt for manual runs.

Current manual goal frontier after focused Lean verification of Chapter 7
`StatInference/Optimization/FrankWolfe.lean` rebased over pushed frontier
`4d4601c`, building on `bb0a297`: Chapter 6 should be treated as stable through the supplied
Definition 6.24/Theorem 6.25 feasibility-instance and no-interior-success
package, and Chapter 7 now has a compiled supplied-interface Theorem 7.3 rate
wrapper.  The Frank-Wolfe layer introduces `LinearOptimizationOracleOn`,
`HasDiameterBound`, `frankWolfeStep`, `chewi73StepSize`,
`IsFrankWolfeTrajectory`, feasibility preservation, the one-step gap
recurrence, scalar rate induction, trajectory recurrence, and
`chewi73_gap_le_two_beta_mul_diam_sq_div`.  The next active main-text route is
Chapter 8 `Proximal.lean`; return to Theorem 6.25 or Theorem 7.3 only for
exact source/report packaging or a dependency.

Current manual goal frontier after focused Lean verification and root
`StatInference` build of the Chewi Theorem 10.13 OMD regret packet on
2026-05-06, based on verified code frontier `2c62fec` in
`StatInference/Optimization/MirrorDescent.lean`:
Theorem 8.5/8.6 PGD/APGD and the Chapter 9 Fenchel/Bregman substrate are now
stable dependencies, not active routing targets.  Latest verified Optimization
proof frontier: `2c62fec`.
`MirrorDescent.lean` now compiles the local MPGD model, source-shaped step and
trajectory interfaces, the model-to-composite Bregman upper/lower comparisons,
the supplied-interface Chewi Theorem 10.9 one-step inequality, the descent
corollary, trajectory one-step accessors, the Chapter 10 scalar
Gronwall/weighted-denominator wrappers, `chewi109Lambda`, `chewi109Rho`, and
the final displayed MPGD rate from `lambda_h` in both supplied-one-step and
trajectory forms.  It also compiles the Theorem 10.11 nonsmooth MPGD
one-step bridge from a supplied model lower bound, recurrence telescope,
average-gap bound, Jensen averaged-iterate bound, and trajectory wrappers.
The newest local analytic bridge compiles `chewi1011_young_lower_bound`,
`mirrorProximalGradientModel_lower_of_bregman_bounds`,
`mirrorProximalGradient_nonsmooth_oneStep_ineq_of_bregman_bounds`,
`chewi1011_average_gap_le_of_trajectory_bregman_bounds`, and
`chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds`, reducing the
opaque 10.11 model-lower-bound to the two displayed source estimates
`D_f <= 2 L r` and `D_phi >= alphaPhi/2 * r^2`.  The newest step-size packet
compiles `chewi1011_stepsize_rhs_bound`,
`chewi1011_average_gap_le_of_oneStep_stepsize`,
`chewi1011_iterateAverage_gap_le_of_oneStep_stepsize`,
`chewi1011_average_gap_le_of_trajectory_bregman_bounds_stepsize`, and
`chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds_stepsize`,
closing the displayed `h^2 = alphaPhi * R_phi^2 / (2 * L^2 * N)` corollary.
The newest ordinary Hilbert-norm packet compiles
`bregmanDivergence_le_two_mul_lipschitz_norm`,
`bregmanDivergence_lower_of_firstOrderStrongConvexOn`,
`mirrorProximalGradientModel_lower_of_lipschitz_norm`,
`chewi1011_average_gap_le_of_trajectory_lipschitz_norm`,
`chewi1011_iterateAverage_gap_le_of_trajectory_lipschitz_norm`,
`chewi1011_average_gap_le_of_trajectory_lipschitz_norm_stepsize`, and
`chewi1011_iterateAverage_gap_le_of_trajectory_lipschitz_norm_stepsize`.  The
newest OMD packet compiles `onlineMirrorDescentModel`,
`IsOnlineMirrorDescentStep`, `IsOnlineMirrorDescentTrajectory`, trajectory
accessors, `chewi1013_young_lower_bound`,
`bregmanDivergence_nonneg_of_firstOrderStrongConvexOn`,
`onlineMirrorDescentModel_lower_of_norm_bound`,
`onlineMirrorDescent_oneStep_regret`,
`onlineMirrorDescent_regret_gap_sum_le_of_oneStep`,
`chewi1013_regret_bound_of_oneStep`,
`chewi1013_regret_bound_of_trajectory`,
`chewi1013_regret_bound_of_trajectory_norm_bound`,
`chewi1013_stepsize_rhs_bound`, and
`chewi1013_regret_bound_of_trajectory_norm_bound_stepsize`.
Search-first result: mathlib has no direct Bregman/mirror-descent/MPGD theorem
in the pinned tree; the relevant reuse is local `Bregman.lean`,
`Proximal.lean`, Chapter 3 geometric-weight/Gronwall APIs,
`ProjectedSubgradient.lean` finite-average/Jensen APIs,
`LipschitzOnWith.le_add_mul`, `abs_real_inner_le_norm`, and
`FirstOrderStrongConvexOn.lower_model`.  The active route is now Chapter 11
alternating Bregman projection/minimization, starting with a Bregman projection
step certificate, ABP trajectory interface, and Lemma 11.2 finite telescoping
packet.  Generalize 10.11/10.13 to a custom arbitrary norm/dual-norm interface
or add an exact `sInf` wrapper only when source-report packaging or a later
theorem demands it.  In parallel, map Chapter 12/13 stochastic/Newton theorem
packets with source-shaped supplied interfaces first when exact analytic
dependencies would otherwise stall progress.

Current manual goal frontier after focused Lean and promoted module build of
the Theorem 6.25 feasibility-instance/topological-interior packet: the
lane has moved from Lemma 6.20 packaging through Chapter 6 Theorems 6.21 and
6.22 nonsmooth lower-bound source packets and into Theorem 6.25 feasibility
lower bound.  Treat `ProjectedSubgradient.lean`,
`CuttingPlane.lean`, and `Ellipsoid.lean` as stable infrastructure through
Theorems 6.14/6.16, the supplied CoGM 6.19 rate spine, and the supplied Lemma
6.20 ellipsoid trajectory/rate with displayed matrix certificates.  The active
Lean anchor is `StatInference/Optimization/NonsmoothLowerBounds.lean`, where
the concrete `d = N + 1` hard instance now compiles through first-max oracle
`IsSubgradientAt`, prefix support, source-rate gap, source-radius facts,
source first-order convexity, centered source bounded-domain Lipschitz facts,
and reusable first-order strong-convexity facts.  The same module now compiles
the 6.22 displayed radius, `x0 = 0` radius membership, source-rate gap
`L^2/(32 alpha (N+1))`, and source strong-convex/Lipschitz wrappers.  The same
module now also starts Definition 6.24/Theorem 6.25 with coordinate boxes,
strict box interiors, midpoint half-box updates, nonzero separating cut
vectors, retained-box separation, query-exclusion from strict interior,
box-nesting and side-width lemmas, Euclidean ball containment in boxes, and the
short-side obstruction to containing an `eps`-ball.  It now also has the
recursive cyclic box state: initial cube, cyclic coordinate selector,
recursive lower/upper endpoints, endpoint ordering, per-step separation,
query-exclusion, nesting, and selected/unselected width update facts.  The
width/counting bridge now adds a coordinate width abstraction, zero and
selected/unselected successor forms, explicit cyclic-hit selection at
`j + m*d`, width halving at those hit times, and recursive-box `eps`-ball
side-width necessary/contradiction wrappers.  The newest full-cycle packet
adds no-hit width preservation, pre/post-hit cycle miss lemmas, one-cycle
halving, the closed form `(2 * R) / 2^m` after `m` cycles, and full-cycle
`eps`-ball obstruction/necessary-width wrappers.  The newest scalar/log packet
adds multi-step nesting, full-cycle midpoint ball-containment from side-width
and radius hypotheses, the logarithmic scalar helper
`m * log 2 <= log (R / eps) -> eps <= R / 2^m`, and full-cycle/earlier-step
ball-containment wrappers from that log bound.  It also adds strict-box nesting
and final strict-box query exclusion for every previous query.  The newest
replay-certificate packet adds returned cut vectors, final-box separator
validity, finite separation transcript and replay-certificate interfaces, and
the source-shaped package combining replay validity with log-bound `eps`-ball
containment.  The deterministic replay abstraction now adds prefix-causal
query functionals, finite deterministic runs, transcript-equality replay, and
the source-shaped no-strict-success wrapper.  The newest source-facing packet
adds closedness and convexity of coordinate boxes, the topological
`interior C` subset of the strict coordinate box, the Definition 6.24-style
closed convex feasibility instance
`IsChewi625FeasibilityInstance`, and
`chewi625_deterministic_run_no_interior_success_of_log_bound`.  The next
theorem-sized packet should either package exact Theorem 6.25 for reporting or
open Chapter 7 `FrankWolfe.lean`; add a literal arbitrary `d > N`
embedding/report wrapper for 6.21/6.22 only if exact theorem reporting
requires it.
The detailed Lemma 6.20 frontier below is retained only as dependency context
and should not be used as the active route.

Historical manual goal frontier after rebasing local `main` onto `origin/main` at
`038e7e3` (`Add weak convergence asymptotic tightness bridge`) with the verified pushed
source-volume determinant, determinant-unit inverse-shape reduction,
normalized forward/inverse algebra, forward-shape transport reduction,
rank-one/displayed-action support, concrete displayed-to-normalized
forward-shape transport, displayed next-shape certificate, real matrix-image
volume scaling, determinant-square volume-model, CFC-root, and displayed-shape
positivity packets in
`StatInference/Optimization/Ellipsoid.lean`;
the latest Optimization proof frontier is Chapter 6 Lemma 6.20 after the
2026-05-05 standard-cut scalar, determinant-ratio, coordinate-free
affine-containment, supplied-identity affine-transport certificate, first
Euclidean matrix quadratic packet, cut-normalization algebra packet, raw
symmetric square-root adjoint/cut bridge, PosDef invertibility/cancellation
packet, pullback-standard-cut certificate packet, current `Σ⁻¹` identification,
and displayed center-update packet:
`StatInference/Optimization/Theorem510.lean` proves Chewi Theorem 5.10's
discrete AGD source rate,
`StatInference/Optimization/ProjectedSubgradient.lean` proves the finite-valued
Chapter 6 projected-subgradient layer through the Theorem 6.14 average-gap
bound and proof-carrying Theorem 6.16 wrapper
`chewi616_exists_functionalConstraintSuccess`, and
`StatInference/Optimization/CuttingPlane.lean` now proves the supplied-interface
finite volume-shrink, scaled-candidate, limiting, and final source-shaped CoGM
Theorem 6.19 display-rate wrapper
`chewi619_gap_le_display_rate_of_scaled_candidates`, and
`StatInference/Optimization/Ellipsoid.lean` now compiles the supplied-interface
Lemma 6.20 ellipsoid trajectory/rate layer plus the normalized central-cut
scalar containment, determinant-ratio cores, and coordinate-free normalized
half-space containment, plus an abstract affine-transport certificate bridge
and matrix-backed quadratic/positive-denominator plus normalized-cut algebra
helpers, plus the raw symmetric square-root cut bridge declarations
`chewi620_rawAdjointIdentity_of_symmetric_inverse`,
`chewi620_matrixSqrt_normalizedCutDirection_norm_of_posDef`, and
`chewi620_matrixSqrt_normalizedCutDirection_inner_toStd`, plus
`matrixInvShape_mul`, `chewi620_matrixPosDef_det_pos`,
`chewi620_matrixPosDef_det_ne_zero`, `chewi620_matrixPosDef_det_isUnit`,
`chewi620_matrixPosDef_inv`, `chewi620_matrixPosDef_mul_inv`,
`chewi620_matrixPosDef_inv_mul`,
`chewi620_matrixPosDef_mul_inv_cancel_right`,
`chewi620_matrixPosDef_inv_mul_cancel_left`,
`chewi620_matrixPosDef_det_inv_mul_det`, `chewi620_matrixPosDef_inv_inv`,
`matrixInvShape_mul_inv_cancel`, `matrixInvShape_inv_mul_cancel`,
`chewi620PullbackIdentityInvShape`,
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
`chewi620_matrix_rankOne_collapse`, `chewi620_matrix_rankOne_det_update`,
`chewi620DisplayedShapeUpdateCore`,
`chewi620_displayedShapeUpdateCore_det`,
`chewi620DisplayedShapeUpdate`, and `chewi620_displayedShapeUpdate_det`, plus
`chewi620_displayedShapeUpdate_det_div_det`,
`chewi620_displayedShapeUpdate_det_div_det_eq_ellipsoidVolumeRatio_sq`,
`chewi620_displayedShapeUpdate_det_pos`,
`chewi620_displayedShapeUpdate_det_ne_zero`,
`chewi620_displayedShapeUpdate_det_isUnit`,
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio`,
`matrixInvShape_mul_inv_cancel_of_det_isUnit`,
`matrixInvShape_inv_mul_cancel_of_det_isUnit`,
`matrixInvShape_eq_inv_of_left_inverse`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_left_inverse`,
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_left_inverse`,
`chewi620StandardCutForwardShape`,
`chewi620_standardCutForwardShape_left_inverse`,
`chewi620_displayedShapeUpdate_left_inverse_of_standardCutForward_transport`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
plus `matrixInvShape_eq_toLp_mulVec`, `matrixInvShape_one`,
`matrixInvShape_add`, `matrixInvShape_smul`, `matrixInvShape_sub`,
`matrixInvShape_vecMulVec`, `inner_toLp_eq_dotProduct`,
`matrixInvShape_vecMulVec_self`,
`chewi620_displayedShapeUpdateCore_action`,
`chewi620_displayedShapeUpdate_action`,
`chewi620_matrixSqrt_current_action`, and
`chewi620_matrixSqrt_rank_inner`, plus
`chewi620_matrixCutScale_mul_self_of_pos`,
`chewi620_displayedShapeUpdate_forwardShape_transport_of_sqrt`,
`addHaar_image_linearMap_real`, `addHaar_image_add_left_real`,
`matrix_toEuclideanLin_det`, `matrixInvShape_image_volume_real`,
`matrixInvShape_image_add_volume_real`, `chewi620_matrixSqrt_quadratic`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_sqrt`,
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_sqrt`,
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`,
`chewi620_hvolume_of_matrix_image_volume_models`,
`chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`,
`ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`,
`cfcSqrt_det_sq_of_posSemidef`, and
`chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`,
`cfcSqrt_quadratic_inv_of_posDef`,
`chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`,
`cfcSqrt_inner_matrixInvShape_left`,
`chewi620_matrix_rankOne_cauchy_schwarz`,
`chewi620_displayedShapeUpdateCore_isHermitian`,
`chewi620_displayedShapeUpdate_isHermitian`,
`chewi620_displayedShapeUpdateCore_quadratic_pos`,
`chewi620_displayedShapeUpdate_quadratic_pos`,
`chewi620_displayedShapeUpdate_posDef`, and
`chewi620_displayedMatrices_stepCertificate_of_cfcSqrt`, plus
`chewi620_displayedMatrices_trajectory_of_cfcSqrt` and
`chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`.
Do not target the stale app-level
`/goal` text's old Theorem 3.4 frontier, and do not replay the already-built CG
substrate, Theorem 5.8 AGF source wrapper, Theorem 5.9 strong-convex AGF proof,
Theorem 5.10 weighted-telescope proof, Theorem 6.14 PSD packet, Theorem 6.16
functional-constraint packet, the CuttingPlane CoGM wrapper packet, or the
now-compiled supplied ellipsoid trajectory/rate, scalar containment,
determinant-ratio, coordinate-free normalized containment, abstract
affine-transport, matrix normalization, PosDef cancellation, pullback
certificate, current-shape, center-update, determinant/source-volume,
inverse-shape reduction, normalized forward/inverse algebra, or
forward-shape transport-reduction, rank-one action, displayed-shape action,
square-root current/rank-inner transport, scale normalization, concrete
displayed-to-normalized forward-shape transport, displayed next-shape
certificate packaging, matrix-image volume scaling, determinant-to-hvolume
scalar bridge, translated closed-unit-ball image-model, displayed
ellipsoid-volume wrapper, or CFC-root quadratic packets.
`StatInference/Optimization/Theorem58.lean` proves the AGF Lyapunov derivative
formula, discharges Lyapunov continuity from the trajectory and gradient oracle,
and exposes a source-facing Theorem 5.8 rate wrapper.  Since Chewi leaves the
strongly-convex AGF proof to Exercise 5.3,
`StatInference/Optimization/Theorem59.lean` records the standard Lyapunov route
and final exponential gap wrappers.  `Theorem510.lean` now records
`chewi510Lambda`, `chewi510Theta`, `chewi510TrialPoint`,
`IsChewi510AGDTrajectory`, lambda positivity/nonzero/recurrence/growth,
`lambda N >= N / 2`, theta's scalar identity, source telescope alignment,
`(3.3)` reuse from
`StatInference.Optimization.oneStepRecurrence_of_firstOrderStrongConvexOn`,
the weighted two-point inequality, finite weighted telescope, denominator form,
and final source theorem `chewi510_gap_le_two_beta_dist_sq_over_nat_sq`.

Chapter 6 nonsmooth convex optimization is now open.  The packet in
`StatInference/Optimization/ProjectedSubgradient.lean` compiles source-shaped
finite-valued interfaces and proofs for Definition 6.8 subgradients,
Definition 6.11 projection, Lemma 6.12 projection characterization, Lemma 6.13
projection non-expansiveness, the PSD trajectory display, Jensen for averaged
iterates, the PSD squared-distance recurrence, finite telescoping, the
Theorem 6.14 average-gap wrapper `chewi614_average_gap_bound`, the
Lipschitz/ray source bridge, the displayed `h = R / sqrt N` corollary, and a
scaled projected-subgradient recurrence for Theorem 6.16.
`StatInference/Optimization/CuttingPlane.lean` compiles
`HasVolumeShrink`, `centerOfGravityRate`, `IsCuttingPlaneValueCertificate`,
`HasScaledOutsideCandidateWithinDiameter`, `volumeShrink_le_pow`,
`volumeShrink_ratio_le_pow`, `centerOfGravityRate_nonneg`,
`convex_scaled_candidate_gap_le_diameter_lipschitz`,
`chewi619_scaled_candidate_gap_bound`,
`chewi619_eventual_scaled_bound_of_scaled_candidates`,
`le_mul_of_forall_gt_le_mul`,
`chewi619_gap_le_of_eventual_scaled_bound`,
`chewi619_gap_le_centerOfGravityRate_of_eventual_scaled_bound`, and
`chewi619_gap_le_display_rate_of_eventual_scaled_bound`, and
`chewi619_gap_le_display_rate_of_scaled_candidates`.
`StatInference/Optimization/Ellipsoid.lean` compiles `ellipsoidSet`,
`ellipsoidCutHalfspace`, `ellipsoidCenterUpdate`, `ellipsoidVolumeRatio`,
`ellipsoidVolumeRatio_nonneg`, `IsEllipsoidStepCertificate`,
`IsEllipsoidStepCertificate.halfspace_subset`,
`IsEllipsoidStepCertificate.volume_le`, `ellipsoidSets`,
`IsEllipsoidCuttingPlaneTrajectory`,
`IsEllipsoidCuttingPlaneTrajectory.step`,
`IsEllipsoidCuttingPlaneTrajectory.hasVolumeShrink`,
`IsEllipsoidCuttingPlaneTrajectory.halfspace_subset`,
`ellipsoidTrajectory_volume_ratio_le_pow`, and
`chewi620_volume_ratio_and_gap_bound_of_scaled_candidates`, and the normalized
unit-ball central-cut containment inequalities
`chewi620_standard_cut_scalar_containment_cleared` and
`chewi620_standard_cut_scalar_containment`, plus
`chewi620_ellipsoidVolumeRatio_source_nonneg`,
`chewi620_standardCut_detRatio_eq_source`, and
`chewi620_ellipsoidVolumeRatio_sq_eq_standardCut_detRatio`, and the
coordinate-free normalized bridge `chewi620StandardCutCenter`,
`chewi620StandardCutInvShape`,
`chewi620_norm_sq_eq_inner_sq_add_orthogonal_sq`,
`chewi620_standardCutInvShape_quadratic`, and
`chewi620_standardCut_halfspace_subset`, plus
`chewi620_affineTransport_halfspace_subset_of_quadratic` and
`chewi620_affineTransport_stepCertificate_of_quadratic`, and the Euclidean
matrix bridge declarations `matrixInvShape`,
`matrixInvShape_quadratic_eq_dotProduct`,
`matrixInvShape_quadratic_nonneg_of_posSemidef`,
`matrixInvShape_quadratic_pos_of_posDef`, and
`chewi620_matrix_cut_sqrt_inv_pos_of_posDef`, plus
`chewi620MatrixCutScale`, `chewi620MatrixNormalizedCutDirection`,
`chewi620_matrixNormalizedCutDirection_norm_of_posDef`,
`chewi620_matrixNormalizedCutDirection_inner_toStd`,
`chewi620_rawAdjointIdentity_of_symmetric_inverse`,
`chewi620_matrixSqrt_normalizedCutDirection_norm_of_posDef`, and
`chewi620_matrixSqrt_normalizedCutDirection_inner_toStd`, plus the PosDef
invertibility/cancellation bridge declarations `matrixInvShape_mul`,
`chewi620_matrixPosDef_det_isUnit`, `chewi620_matrixPosDef_mul_inv`,
`chewi620_matrixPosDef_inv_mul`, and the two matrix-backed shape cancellation
theorems, plus the pullback-standard-cut declarations
`chewi620PullbackIdentityInvShape`,
`chewi620PullbackStandardCutInvShape`,
`chewi620_pullbackIdentityInvShape_quadratic`,
`chewi620_pullbackStandardCutInvShape_quadratic`,
`chewi620_pullbackStandardCutInvShape_hnext`,
`chewi620_sqrtAffineTransport_stepCertificate_of_pullback`,
`chewi620_pullbackIdentityInvShape_eq_matrixInvShape_inv`,
`chewi620_ellipsoidSet_pullbackIdentity_eq_matrixInvShape_inv`,
`chewi620_matrixSqrt_centerUpdate_hcenter`,
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedCenter`, and
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedCurrentAndCenter`.

The next active packet should stay in Chapter 6 and prove theorem-sized
nonsmooth lower-bound/feasibility steps, not drip minor wrappers.  The exact
Grünbaum/centroid measure theorem remains a precise supplied blocker before a
source-audited CoGM report, but Lemma 6.20 now has a compiled supplied
trajectory/rate frontier.  The current lower-bound packet in
`StatInference/Optimization/NonsmoothLowerBounds.lean` compiles the Theorem
6.21 max-coordinate hard objective, prefix-subspace nonnegativity, gradient-span
prefix-induction consumer, and supplied final gap obstruction.  It now also
compiles the constant minimizer `x_*[k] = -γ/(α d)`, its objective value
`-γ^2/(2 α d)`, the first-max resisting oracle, oracle prefix-support, the
concrete `γ^2/(2αd)` obstruction, and the source-parameter
`d = N + 1`, `γ = L / 4`, `α = γ / (R sqrt d)` lower bound
`L * R / (8 * sqrt (N + 1))`.  The latest packet also proves the first-max
oracle is a whole-space `IsSubgradientAt` of the hard objective, proves the
displayed radius facts `‖x_*‖ = R` and `dist 0 x_* <= R`, promotes the hard
family to centered `B(x_*, R)` Lipschitz and first-order strong-convexity
certificates, and proves the Chewi 6.22 source-rate packet with displayed
radius, `x0` membership, strong-convexity, and Lipschitz side conditions.  The
current packet also proves the first Definition 6.24/Theorem 6.25 feasibility
geometry: coordinate boxes, strict interiors, half-box cut update, nonzero
separator, retained-box separation, query exclusion, box nesting, width
halving/preservation, closed-ball containment, and short-side no-ball
obstruction.  The recursive state packet now adds cyclic coordinates, initial
cube, lower/upper endpoint recursion, endpoint ordering, per-step separation,
query exclusion, nesting, and width updates.  The next target is coordinate
cut-count and scalar
iteration/radius lower-bound layer for Theorem 6.25; Theorem 6.23 is source
context, not a direct proof target.  Search local PSD, CoGM, ellipsoid,
lower-bound, nonsmooth-lower-bound, and exercise APIs first before adding new
wrappers.  The
closed ellipsoid matrix packet remains reusable background:
the current matrix quadratic, positive denominator, normalized cut direction
algebra, raw symmetric square-root cut bridge, PosDef invertibility/cancellation
bridge, pullback-standard-cut certificate, current `Σ⁻¹` identification, and
displayed center-update bridge are now local; the rank-one collapse
`(Σp)^T Σ⁻¹ (Σp) = <p, Σp>` also now compiles as
`chewi620_matrix_rankOne_collapse`, and the determinant side of the displayed
forward-shape update now compiles through
`chewi620_matrix_rankOne_det_update`,
`chewi620_displayedShapeUpdateCore_det`, `chewi620_displayedShapeUpdate_det`,
`chewi620_displayedShapeUpdate_det_div_det`,
`chewi620_displayedShapeUpdate_det_div_det_eq_ellipsoidVolumeRatio_sq`,
`chewi620_displayedShapeUpdate_det_pos`,
`chewi620_displayedShapeUpdate_det_ne_zero`,
`chewi620_displayedShapeUpdate_det_isUnit`, and
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio`, plus
`matrixInvShape_mul_inv_cancel_of_det_isUnit`,
`matrixInvShape_inv_mul_cancel_of_det_isUnit`,
`matrixInvShape_eq_inv_of_left_inverse`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_left_inverse`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_left_inverse`,
plus `chewi620StandardCutForwardShape` and
`chewi620_standardCutForwardShape_left_inverse`, plus
`chewi620_displayedShapeUpdate_left_inverse_of_standardCutForward_transport`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
plus `matrixInvShape_eq_toLp_mulVec`, `matrixInvShape_vecMulVec`,
`matrixInvShape_vecMulVec_self`,
`chewi620_displayedShapeUpdateCore_action`,
`chewi620_displayedShapeUpdate_action`,
`chewi620_matrixSqrt_current_action`, and
`chewi620_matrixSqrt_rank_inner`, plus
`chewi620_matrixCutScale_mul_self_of_pos`,
`chewi620_displayedShapeUpdate_forwardShape_transport_of_sqrt`,
`addHaar_image_linearMap_real`, `addHaar_image_add_left_real`,
`matrix_toEuclideanLin_det`, `matrixInvShape_image_volume_real`,
`matrixInvShape_image_add_volume_real`, `chewi620_matrixSqrt_quadratic`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_sqrt`,
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_sqrt`,
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`,
`chewi620_hvolume_of_matrix_image_volume_models`,
`chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`,
`ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`,
`cfcSqrt_det_sq_of_posSemidef`, and
`chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`,
`cfcSqrt_quadratic_inv_of_posDef`,
`chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`,
`cfcSqrt_inner_matrixInvShape_left`,
`chewi620_matrix_rankOne_cauchy_schwarz`,
`chewi620_displayedShapeUpdateCore_isHermitian`,
`chewi620_displayedShapeUpdate_isHermitian`,
`chewi620_displayedShapeUpdateCore_quadratic_pos`,
`chewi620_displayedShapeUpdate_quadratic_pos`,
`chewi620_displayedShapeUpdate_posDef`, and
`chewi620_displayedMatrices_stepCertificate_of_cfcSqrt`,
`chewi620_displayedMatrices_trajectory_of_cfcSqrt`, and
`chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`.
The remaining blocker is Chapter 6 lower-bound/feasibility coverage after
Lemma 6.20, not
scalar algebra, abstract transport, current-shape rewriting, center algebra,
rank-one collapse, determinant-core algebra, source-volume determinant algebra,
normalized standard-cut algebra, rank-one action expansion, displayed-shape
action expansion, square-root current/rank-inner transport, concrete
displayed-to-normalized transport, transport reduction, displayed next-shape
certificate packaging, determinant-to-hvolume scalar algebra,
translated closed-unit-ball image-model packaging, displayed-volume wrapper
packaging, CFC-root quadratic algebra, displayed-shape PosDef, Lemma 6.20
sequence/rate packaging, or
nonsingular-inverse uniqueness.  For measure scaling, use
`Measure.addHaar_image_linearMap` / `Measure.addHaar_preimage_linearEquiv`,
translation invariance, and `LinearMap.det_toLpLin` for
`Matrix.toEuclideanLin`; the raw `Real.map_*` pushforward lemmas scale by
`|det|⁻¹`, while set-image volume needs the `|det|` addHaar route, now locally
wrapped by `addHaar_image_linearMap_real` and
`matrixInvShape_image_volume_real`, with translation wrapped by
`addHaar_image_add_left_real` and `matrixInvShape_image_add_volume_real`.  The
target order is now to source-scan and formalize Chapter 6 nonsmooth
lower-bound Theorems 6.21-6.23 and feasibility Definition 6.24/Theorem 6.25,
reusing `chewi620_displayedMatrices_trajectory_of_cfcSqrt` and
`chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`
as the Lemma 6.20 frontier.  Search first for local PSD, CoGM, ellipsoid,
lower-bound, and exercise APIs before adding new wrappers.  If the next theorem
balloons, prove the smallest nonsmooth lower-bound or feasibility primitive
that removes the precise missing API, then continue Chapter 6 before opening
Chapter 7 as the next main-text frontier.
Mandatory search and reuse: mathlib
`Analysis/InnerProductSpace/Projection/Minimal.lean` has
`exists_norm_eq_iInf_of_complete_convex` and
`norm_eq_iInf_iff_real_inner_le_zero`; mathlib `Analysis/Convex/Jensen.lean`
has `ConvexOn.map_sum_le`; mathlib `Topology/MetricSpace/Lipschitz.lean` has
`LipschitzOnWith`, `LipschitzOnWith.dist_le_mul`, and
`LipschitzOnWith.le_add_mul`; mathlib `Data/Real/Sqrt.lean` has
`Real.sqrt_pos` and `Real.sq_sqrt`; local `sum_range_sub_succ` is the finite
telescope.  Lemma 6.20 matrix scout results to reuse next include
`LinearMap.IsSymmetric`, `LinearMap.IsSymmetric.toLinearMap_symm`,
`LinearEquiv.isSymmetric_symm_iff`, `Matrix.toEuclideanLin`,
`EuclideanSpace.inner_eq_star_dotProduct`,
`Matrix.posSemidef_iff_dotProduct_mulVec`,
`Matrix.PosDef.dotProduct_mulVec_pos`, `Matrix.PosDef.isUnit`,
`Matrix.PosDef.inv`, nonsingular-inverse determinant and cancellation lemmas
now wrapped locally, rank-one determinant lemmas in `Matrix.SchurComplement`,
including `Matrix.det_add_replicateCol_mul_replicateRow`, `Matrix.det_add_mul`,
`Matrix.det_fin_one`, `Matrix.vecMulVec_eq`, `Matrix.replicateCol`, and
`Matrix.replicateRow`,
and volume-scaling lemmas
`Real.map_matrix_volume_pi_eq_smul_volume_pi` /
`Real.map_linearMap_volume_pi_eq_smul_volume_pi`.  Keep Chapter 6 finite-valued
and theorem-driven until a named result actually needs the extended-real
regular-convex infrastructure.

## Local Sources

- Markdown source:
  - `Textbooks/Optimization2026/Optimization_SinhoChewi_sp26.md`
- PDF anchor:
  - `Textbooks/Optimization2026/Optimization_SinhoChewi_sp26.pdf`

## Status Vocabulary

- `exact-local`: exact textbook item statement is formalized and proved with no
  `sorry`, `admit`, unreviewed `axiom`, or `unsafe`, and a report may be
  prepared.
- `local-wrapper`: compiled Lean wrapper around mathlib or existing local code,
  useful for Chewi naming and source crosswalks but not yet an exact
  source-audited textbook theorem report.
- `local-layer`: compiled supporting primitive or lemma that moves toward an
  exact item.
- `mathlib-foundation`: mathlib has the mathematical theorem/API, but no
  Chewi-exact wrapper/report exists yet.
- `priority-local`: missing local theorem or primitive that directly helps the
  Optimization route.
- `pending-local`: not started.
- `deferred-example`: example/application temporarily skipped because it would
  require substantial external-domain formalization not needed for the current
  optimization main line.

## Priority Lanes

### Lane A: Convexity and smoothness foundations

Source anchors:

- Definition 1.4 convex sets: markdown line 147.
- Definition 1.5 alpha-convex/strongly convex functions: markdown line 149.
- Proposition 1.6 convexity equivalences: markdown line 161.
- Lemma 1.7 existence of minimizer: markdown line 219.
- Lemma 1.8 necessary optimality conditions: markdown line 223.
- Lemma 1.9 sufficient optimality condition: markdown line 234.
- Lemma 1.10 uniqueness of minimizer: markdown line 241.
- Corollary 1.11 strongly convex unique minimizer: markdown line 247.
- Definition 1.12 beta-smooth functions: markdown line 251.
- Proposition 1.13 smoothness equivalences: markdown line 261.

Initial Lean module:

- `StatInference/Optimization/Basic.lean`

Current compiled surface:

- `StatInference.Optimization.StrongConvexOn`
- `StatInference.Optimization.ChewiConvexOn`
- `StatInference.Optimization.StrongConvexOn.to_mathlibStrongConvexOn`
- `StatInference.Optimization.StrongConvexOn.of_mathlibStrongConvexOn`
- `StatInference.Optimization.strongConvexOn_iff_mathlibStrongConvexOn`
- `StatInference.Optimization.StrongConvexOn.mono`
- `StatInference.Optimization.StrongConvexOn.chewiConvexOn`
- `StatInference.Optimization.StrongConvexOn.convexOn`
- `StatInference.Optimization.ChewiConvexOn.convexOn`
- `StatInference.Optimization.FirstOrderStrongConvexOn`
- `StatInference.Optimization.FirstOrderStrongConvexOn.mono`
- `StatInference.Optimization.FirstOrderStrongConvexOn.convex`
- `StatInference.Optimization.SmoothWithGradientOn`
- `StatInference.Optimization.gradientDescentStep`
- `StatInference.Optimization.IsGradientDescentTrajectory`
- `StatInference.Optimization.HasLipschitzGradientOn`
- `StatInference.Optimization.gradientStep`
- `StatInference.Optimization.FirstOrderStrongConvexOn.of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.FirstOrderStrongConvexOn.stronglyMonotoneGradientOn`
- `StatInference.Optimization.StrongConvexOn.strictConvexOn`
- `StatInference.Optimization.minimizer_unique_of_strictConvexOn`
- `StatInference.Optimization.minimizer_unique_of_strongConvexOn`
- `StatInference.Optimization.gradient_eq_zero_of_isMinOn_univ_hasGradientAt`
- `StatInference.Optimization.QuadraticGrowthOn`
- `StatInference.Optimization.QuadraticGrowthWitnessOn`
- `StatInference.Optimization.PLGradientFlowLimitRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLimitNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNonzeroDisplacementRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovContinuousDataRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovSideConditionRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn`
- `StatInference.Optimization.PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn`
- `StatInference.Optimization.positive_gap_of_not_isMinOn`
- `StatInference.Optimization.minimizer_value_eq_of_reference_minimizer`
- `StatInference.Optimization.plGradientFlowLyapunov_inequality_of_sideConditionData`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovRoute`
- `StatInference.Optimization.plGradientFlowLimitNonMinimizerRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_nonMinimizerLimitRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_lyapunovNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLyapunovSideConditionNonMinimizerRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLyapunovNonMinimizerRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionNonMinimizerRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_sideConditionNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_noMinimizerHitRoute`
- `StatInference.Optimization.plGradientFlowLimitRouteToQGOn_of_noMinimizerHitRoute_of_referenceMinimizer`
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
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionNonMinimizerRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNoMinimizerHitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNoMinimizerHitRoute_of_referenceMinimizer`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovNonzeroDisplacementRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovContinuousDataRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLyapunovSideConditionRoute`

Near-term exact candidates:

1. Use the compiled Definition 1.4/1.5 bridges
   `StrongConvexOn.to_mathlibStrongConvexOn`,
   `StrongConvexOn.of_mathlibStrongConvexOn`, and
   `strongConvexOn_iff_mathlibStrongConvexOn` when later theorem routes want
   mathlib's root `StrongConvexOn`/`ConvexOn` API; do not reprove this
   equivalence.  Reuse `StrongConvexOn.mono`,
   `StrongConvexOn.chewiConvexOn`, `FirstOrderStrongConvexOn.mono`, and
   `FirstOrderStrongConvexOn.convex` when a theorem route needs to downshift
   from nonnegative strong convexity to the alpha-zero convex lower model.
2. Source-audited packaging for Lemma 1.10 uniqueness of minimizer under
   strict convexity, now compiled via mathlib `StrictConvexOn.eq_of_isMinOn`.
3. Corollary 1.11 existence/coercivity layer; uniqueness and gradient-zero
   characterization wrappers compile, while existence from strong convexity
   still needs a coercivity/compactness argument.
4. Proposition 1.6 remaining directions beyond the compiled
   `(1.3) => (1.4)` whole-space bridge and `(1.4) => (1.5)` swap-and-add
   bridge.

### Lane B: Continuous-time gradient flow

Source anchors:

- Lemma 2.1 descent property of gradient flow: markdown line 316.
- Theorem 2.2 contraction of gradient flow: markdown line 325.
- Lemma 2.3 Gronwall: markdown line 341.
- Theorem 2.4 function-value convergence of gradient flow: markdown line 372.
- Definition 2.5 Polyak-Lojasiewicz inequality: markdown line 406.
- Corollary 2.6 convergence under PL: markdown line 416.
- Proposition 2.7 strong convexity implies PL implies quadratic growth:
  markdown line 423.
- Corollary 2.8 convergence in gradient norm: markdown line 479.

Search anchors:

- `.lake/packages/mathlib/Mathlib/Analysis/ODE/DiscreteGronwall.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/ODE/Gronwall.lean`
- mathlib differentiability and ODE APIs
- local `StatInference/Asymptotics/Basic.lean`

Current compiled surface:

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
- `StatInference.Optimization.gradientFlow_grad_sq_integral_eq_value_drop`
- `StatInference.Optimization.chewi28_gradient_sq_integral_bound`
- `StatInference.Optimization.chewi28_gradient_sq_average_bound`
- `StatInference.Optimization.chewi28_interval_sq_lower_bound_le_average`
- `StatInference.Optimization.chewi28_min_grad_norm_le_of_isMinOn`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn_norm`
- `StatInference.Optimization.chewi28_exists_grad_norm_le_of_continuousOn_grad`

Near-term exact candidates:

1. Discharge `PLGradientFlowLyapunovNoMinimizerHitRouteToQGOn` by
   formalizing or cleanly supplying the gradient-flow convergence/minimizer
   interface, feasible positive-time membership, no minimizer hit, and
   nonzero-displacement side conditions.  The derivative-to-antitone bridge,
   PL scalar sign calculation, positive-gap derivation from no minimizer hit,
   objective-gap derivative, nonzero norm-derivative calculation,
   trajectory/gap continuity, Lyapunov-continuity wrapper, and
   reference-minimizer replacement for the global minimizer-value invariant
   already compile for Proposition 2.7(2).
2. Theorem 2.4 now has wrappers discharging the interval-integrability
   assumptions from continuity of `s ↦ grad (x s)` on `[0,t]`, together with
   gradient-flow differentiability and `HasGradientAt`.  A later exact report
   can decide whether to present this regularity input directly or package it
   behind a `C¹`/`C²` trajectory surface matching the notes.
3. Strengthen the regularity bridge behind Corollary 2.8 only if needed for
   the Proposition 2.7(2) analytic route; the compact-minimum and
   continuity-to-integrability pieces already compile.

### Lane C: Discrete gradient descent and algorithmic rates

Source anchors:

- Lemma 3.1 descent lemma: markdown line 555.
- Definition 3.2 condition number: markdown line 569.
- Theorem 3.3 contraction of gradient descent: markdown line 573.
- Theorem 3.4 function-value convergence of gradient descent: markdown line 601.
- Lemma 3.5 discrete Gronwall: markdown line 641.
- Theorem 3.6 convergence of gradient descent under PL: markdown line 685.
- Theorem 3.7 gradient-norm convergence: markdown line 701.

Near-term exact candidates:

1. Lemma 3.5 discrete Gronwall as a standalone deterministic sequence lemma.
   The zero-based power/range display specialization is compiled in
   `StatInference/Optimization/DiscreteGronwall.lean`, and the source-shaped
   one-based display wrapper is also compiled; mathlib's product/Ico forms
   remain the reusable foundation.
2. Lemma 3.1 descent lemma from the smooth upper-model interface.  The local
   supplied-gradient version is compiled in
   `StatInference/Optimization/GradientDescent.lean`, including the source
   step-size corollary `h <= 1 / beta` under `0 < beta`, and the
   function-value antitonicity lemma for GD trajectories.
3. Theorem 3.3 contraction of gradient descent as a main-text theorem.
   `StatInference/Optimization/Theorem33.lean` compiles the squared-distance
   and norm contraction forms from the source-shaped
   `StronglyMonotoneGradientOn` and `GradientStepCocoerciveOn` interfaces,
   plus wrappers deriving gradient monotonicity from `FirstOrderStrongConvexOn`
   and from actual whole-space segment `StrongConvexOn` plus `HasGradientAt`.
   `StatInference/Optimization/Exercises.lean` now proves the whole-space
   Exercise 3.1 co-coercivity display `(3.5)` from convexity plus
   `SmoothWithGradientOn`, and provides Theorem 3.3 squared/norm wrappers with
   the co-coercivity input discharged for the whole-space smooth-convex route.
   Those wrappers now use the local parameter-downshift lemmas, so callers
   provide `0 <= alpha` rather than a separate alpha-zero convexity hypothesis.
4. Theorem 3.4 as a convergence theorem from actual whole-space
   `StrongConvexOn` plus `HasGradientAt`.  `Theorem34.lean` assumes the
   one-step recurrence (3.1), uses the compiled Gronwall theorem for the
   weighted finite-sum bound, provides the source-indexed one-based display,
   adds the monotone-gap weighted lower-bound helper, proves the finite and
   positive-`alpha` closed geometric denominator corollaries, proves the
   `alpha = 0` limiting display, proves the one-step recurrence from the
   first-order lower model plus Lemma 3.1, and now derives the first-order
   lower model from segment strong convexity plus `HasGradientAt` on
   `Set.univ`.
5. Theorem 3.6 convergence under PL.  `StatInference/Optimization/Theorem36.lean`
   now compiles a source-shaped PL interface, the one-step PL gap recurrence
   from Lemma 3.1, a scalar nonnegative-factor recurrence unrolling, and the
   source step-size wrapper for `h <= 1 / beta`.
6. Theorem 3.7 gradient-norm/stationary point convergence.
   `StatInference/Optimization/Theorem37.lean` now compiles the existential
   source-faithful form over `n < N` and the literal finite-min display using
   `(Finset.range N).inf'`.  It reuses the compiled descent lemma, proves the
   telescope/finite-average layer over `Finset.range N`, converts the squared
   bound with `Real.le_sqrt_of_sq_le`, and avoids Chapter 3 exercise proof
   derivations.

Exercise formalization policy: all exercises from the Optimization notes
should be formalized in `StatInference/Optimization/Exercises.lean`.  Main
textbook theorem modules may keep exercise statements as supplied interfaces
when needed for theorem reuse, but new exercise statements/proofs should be
centralized in that single exercise module.  The main theorem lane remains the
aggressive priority, while exercise statements and proofs may be added
opportunistically when they are cheap, reusable, or unblock a textbook theorem.

### Lane D: Later textbook expansion

Chapter 4 lower-bound expansion has now started in
`StatInference/Optimization/LowerBounds.lean`.  The compiled surface is:

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
- `StatInference.Optimization.finSum_forwardDifference`
- `StatInference.Optimization.lowerBoundChainEdge_sum`
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

Search-first result for this lane: there was no local Chewi gradient-span
formalization; mathlib's `Submodule.span`, `Submodule.subset_span`, and
`Submodule.span_mono` provide the reusable algebraic foundation, while
mathlib's `EuclideanSpace ℝ (Fin d)`/`PiLp` coordinate API is the right model
for the source's `ℝ^d`.  The norm estimate reuses
`EuclideanSpace.real_norm_sq_eq` and `Finset.sum_le_sum` instead of opening a
new coordinate norm primitive.  The actual lower-bound quadratic is now
modeled as `lowerBoundChainObjective` using extended boundary nodes
`1, x_0, ..., x_{d-1}, 0`; the exact displayed minimizer value
`β / (8 * (d + 1))` compiles by reducing every edge difference to
`-1 / (d + 1)`.  The tridiagonal chain-gradient support calculation,
displayed minimizer candidate, vanishing-gradient theorem, edge-difference
gradient bridge, `‖x_*‖² ≤ d` estimate, minimizer-value theorem, finite
telescoping identity, Cauchy edge-energy bound, global objective lower bound,
and `IsMinOn` minimizer theorem for Theorem 4.4 now compile on top of this
interface.  Search found and reused mathlib's `sq_sum_le_card_mul_sum_sq` for
the Cauchy step, mathlib's `isMinOn_univ_iff` for the global minimizer
wrapper, and `Finset.sum_map` plus
`Finset.sum_le_sum_of_subset_of_nonneg` to compare prefix edge energy with the
full chain energy.  The objective-gradient/smoothness package now compiles:
`lowerBoundChainDirectionNode` and `lowerBoundChainDirectionEdge` model
homogeneous zero-boundary direction chains; `lowerBoundChainEdge_sub` and
`lowerBoundChainEdge_add_direction` prove exact edge residual updates;
`lowerBoundChainObjective_add_direction` gives the exact quadratic expansion;
the nonnegative remainder gives edge-coordinate first-order lower models for
both shifted and unshifted objectives; and
`inner_lowerBoundChainGradient_eq_edgeDifference_sum` connects the compiled
tridiagonal gradient to its coordinate inner-product sum.  The new
summation-by-parts theorem
`lowerBoundChain_edge_direction_sum_eq_edgeDifference_sum` proves the exact
edge-work/gradient-work identity, and
`lowerBoundChainDirectionEnergy_le_four_norm_sq` proves the finite-dimensional
energy bound behind Chewi's displayed Hessian estimate.  Consequently both the
shifted and unshifted objectives now have first-order convex lower-model
wrappers and `SmoothWithGradientOn Set.univ` wrappers supplied by
`lowerBoundChainGradient`.  The next missing step is source-report packaging
or, if continuing theorem expansion before reporting, the nearby Chapter 4
strongly-convex lower-bound Theorem 4.5 route.  The Lemma 4.2 regularization
spine now compiles separately in `StatInference/Optimization/Reductions.lean`:
`quadraticRegularizedAround`, `regularizedGradient`, first-order
strong-convexity/smoothness parameter shifts, the source value-chain and
epsilon-gap corollaries, the radius-to-penalty hook, the
regularized-minimizer distance estimate, `beta + delta <= 2 beta`, the
textbook-choice arithmetic `delta = eps / R^2`, the condition-number bound,
and the bundled source-shaped packages
`lemma42_regularization_complexity_package`,
`lemma42_regularization_reduction_package`, and
`lemma42_regularization_reduction_package_of_isMinOn`.  Next source-shaped
work should connect Theorem 4.4 to Theorem 4.5 using this compiled reduction.
The concrete Theorem 4.5 setup in `StatInference/Optimization/Theorem45.lean`
now also compiles: it defines `strongLowerBoundChainObjective` and
`strongLowerBoundChainGradient`, proves the `alpha`-strong-convex and
`beta`-smooth supplied interfaces for `0 < alpha < beta`, and proves that
gradient-span trajectories from zero remain in `V_n`.  The newest witness
layer defines `coordinateTailSq` and proves that a supplied zero-gradient
minimizer candidate with tail beyond `V_N` forces a function gap for every
gradient-span trajectory iterate `x_N`.  The concrete Lemma 4.2 reduction
instantiation also now compiles here: `lowerBoundChainMinimizer_norm_le_sqrt_dim`
upgrades the existing `‖x_*‖² <= d` estimate to the source radius
`‖x_*‖ <= sqrt d`, and
`chewi45_lowerBoundChain_regularization_complexity_package`,
`chewi45_lowerBoundChain_regularization_reduction_package`, and
`chewi45_lowerBoundChain_regularization_reduction_package_sqrt_dim` plug the
compiled Theorem 4.4 lower-bound chain into the regularization/condition-number
packages from `Reductions.lean`.  The remaining Theorem 4.5 work is no longer
the Lemma 4.2 bookkeeping; it is the geometric/logarithmic rate statement,
either by the direct Exercise 4.2 tail route or by source-shaped packaging of
the Lemma 4.2 + Theorem 4.4 reduction.  The reduction obstruction itself now
also compiles: `lowerBoundChainTextbookObjective_gap_ge_of_mem_coordinatePrefixSubmodule`
turns prefix-subspace membership into the convex lower-bound gap,
`regularizedLowerBoundChainGradient_mem_coordinatePrefixSubmodule` and
`gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_regularizedLowerBoundChainGradient`
prove the regularized oracle support invariant, and
`chewi45_convex_lower_bound_le_eps_of_regularizedGradientSpan_near_min`,
`chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min`,
and `chewi45_not_regularizedGradientSpan_near_min_of_eps_lt_two_mul_add_one_bound`
give the concrete `d = 2N + 1` obstruction `beta / (16 * (N + 1)) <= eps`
and its contradiction form.  The finite rate wrapper now also compiles:
`chewi45_iteration_count_ge_of_two_mul_add_one_lower_bound` converts the
obstruction to `beta / (16 * eps) - 1 <= N`, and
`chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min` plus
`chewi45_not_regularizedGradientSpan_near_min_of_iteration_count_lt` package
that conclusion for the regularized gradient-span run.  The source-shaped rate
wrappers `chewi45_iteration_count_ge_rate_of_regularizedGradientSpan_near_min`,
`chewi45_iteration_count_ge_sqrtKappa_log_rate_of_regularizedGradientSpan_near_min`,
and `chewi45_not_regularizedGradientSpan_near_min_of_sqrtKappa_log_rate_lt`
now specialize this finite lower bound to an arbitrary rate and to the
Chewi-shaped expression `c * sqrt(kappa) * log(ratio)`, with the remaining
analytic comparison isolated as a separate hypothesis.  The direct Exercise
4.2 route has now started in the same theorem module: `chewi45GeometricRatio`
records the displayed factor `(sqrt kappa - 1)/(sqrt kappa + 1)`, its
nonnegative/positive/less-than-one/power order lemmas compile, and
`strongLowerBoundChainObjective_gap_ge_geometric_tail_of_gradientSpanTrajectory`,
`chewi45_gap_ge_geometricRatio_tail_of_gradientSpanTrajectory`, and
`chewi45_not_near_min_of_geometricRatio_tail_lower_bound` turn a supplied
geometric tail estimate for the hard-chain minimizer into the exact
function-gap obstruction used by Exercise 4.2.  The scalar root algebra behind
that geometric vector now also compiles:
`chewi45GeometricRatio_quadratic`, `chewi45GeometricRatio_recurrence`, and
`chewi45GeometricRatio_pow_recurrence` prove the characteristic recurrence.
The finite coordinate model `strongLowerBoundGeometricCandidate` and
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_interior` verify
that this vector satisfies the zero-gradient equation on every nonterminal
interior coordinate when `kappa = beta / alpha`.  The boundary-coordinate
algebra now also compiles: `strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_first`
handles the first coordinate when it is nonterminal,
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_not_last` packages
all nonterminal coordinates, and
`strongLowerBoundChainGradient_geometricCandidate_eq_terminal_residual`
computes the exact finite-truncation residual at the terminal coordinate.
The finite correction route now compiles rather than remaining a blocker:
`chewi45GeometricRatio_finiteDenominator_pos`,
`chewi45GeometricRatio_finiteDenominator_ne_zero`,
`strongLowerBoundFiniteGeometricNode`,
`strongLowerBoundFiniteGeometricNode_zero`,
`strongLowerBoundFiniteGeometricNode_last`,
`strongLowerBoundFiniteGeometricCandidate`,
`strongLowerBoundFiniteGeometricCandidate_apply`,
`strongLowerBoundFiniteGeometricNode_recurrence`, and
`strongLowerBoundChainGradient_finiteGeometricCandidate_eq_zero` prove that
the finite corrected geometric vector exactly cancels the terminal residual
and is a true zero-gradient point of the strongly-convex hard chain.  The
concrete wrappers
`chewi45_gap_ge_geometricRatio_tail_of_finiteGeometricCandidate` and
`chewi45_not_near_min_of_finiteGeometricCandidate_tail_lower_bound` reduce the
remaining direct Theorem 4.5 route to the tail comparison and log/rate
conversion.  The next tail-comparison interface is now cleaner:
`coordinate_sq_le_coordinateTailSq`, `coordinateTailSq_anti_mono`,
`coordinateTailSq_zero_eq_norm_sq`, `norm_zero_sub_sq_eq_coordinateTailSq_zero`,
and
`chewi45_gap_ge_geometricRatio_tail_of_finiteGeometricCandidate_tailSq` reduce
the finite-candidate obstruction to the scalar comparison
`q^(2N) * coordinateTailSq d 0 xStar <= coordinateTailSq d N xStar`.  Source
check: Exercise 4.2 is an infinite-dimensional `R^infty` construction; the
finite corrected truncation solves the finite boundary problem exactly, but
the literal textbook `q^(2N)` tail factor requires either dimension/slack
bookkeeping or the true `l^2` model.
The first true `l^2` substrate for Exercise 4.2 now compiles in
`StatInference/Optimization/Exercises.lean`: `exercise42_geometric_l2_term_eq`,
`exercise42_geometric_memℓp_two`, `exercise42InfiniteGeometric`,
`exercise42InfiniteGeometric_apply`, and
`exercise42InfiniteGeometric_norm_sq` instantiate the nonnegative geometric
profile `n |-> q^n` as a mathlib `lp` element and prove the exact squared norm
identity `(1 - q^2)^{-1}` for `0 <= q < 1`.  The search-first route reused
`Mathlib.Analysis.Normed.Lp.lpSpace`, `Memℓp`, `lp.norm_rpow_eq_tsum`,
`summable_geometric_of_lt_one`, and `tsum_geometric_of_lt_one`; no local
infinite-norm primitive was needed.  The tail-energy version now also compiles:
`exercise42InfiniteTailSq`, `exercise42_geometric_l2_tail_term_eq`,
`exercise42InfiniteGeometric_tailSq_eq`,
`exercise42InfiniteGeometric_tailSq_eq_pow_mul_norm_sq`,
`exercise42InfiniteGeometric_tailSq_eq_pow_mul_zero_dist_sq`, and
`exercise42InfiniteGeometric_pow_mul_zero_dist_sq_le_tailSq`; these prove the
exact source-shaped tail identity
`tail_N = (q^2)^N * ‖0 - geometricProfile‖^2` using `tsum_mul_left` and
`tsum_congr`.  The shifted minimizer and no-terminal infinite-gradient layer
now compiles too: `exercise42InfiniteGeometricMinimizer`,
`exercise42InfiniteGeometricMinimizer_apply`,
`exercise42InfiniteGeometricMinimizer_norm_sq`,
`exercise42InfiniteGeometricMinimizer_tailSq_eq`,
`exercise42InfiniteGeometricMinimizer_tailSq_eq_pow_mul_zero_dist_sq`,
`exercise42InfiniteChainGradient`,
`exercise42InfiniteChainGradient_geometricMinimizer_eq_zero`, and
`exercise42InfiniteChainGradient_geometricMinimizer_eq_zero_of_kappa` prove
that the Chewi-ratio profile `q^(n+1)` is the exact zero-gradient point of the
infinite hard-chain gradient and has the required `(q^2)^N` tail-times-distance
identity.  The search-first route reused mathlib `lp.coeFn_smul`,
`lp.norm_const_smul`, and local `chewi45GeometricRatio_pow_recurrence`; no new
recurrence theory was needed.  The supplied infinite tail-to-gap interface
now also compiles: `exercise42InfinitePrefixSupported`,
`exercise42InfinitePrefixSubmodule`,
`mem_exercise42InfinitePrefixSubmodule_iff`,
`exercise42InfinitePrefixSubmodule_mono`,
`gradientSpanSubmodule_le_exercise42InfinitePrefixSubmodule`,
`gradientSpanTrajectory_mem_exercise42InfinitePrefixSubmodule_of_grad_mem_next`,
`exercise42InfiniteTailSq_le_sqdist_of_prefixSupported`,
`exercise42Infinite_gap_ge_tailSq_of_lowerModel`, and
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_lowerModel`
turn prefix support plus a supplied lower model at the minimizer into the exact
`(alpha/2) * (q^2)^N * ‖0 - x_*‖^2` gap obstruction.  The search-first route
reused `lp.norm_rpow_eq_tsum`, `Summable.sum_add_tsum_nat_add`, and
nonnegative finite-sum decomposition; no local infinite-series comparison
primitive was needed.  The next infinite-model step is the tridiagonal
objective/lower-model package at the shifted minimizer, then a source-shaped
log-rate wrapper.  The gradient-span support induction now compiles for the
supplied infinite hard-chain gradient oracle through
`exercise42InfiniteChainGradient_mem_prefixSubmodule_of_apply`,
`exercise42InfiniteGradientSpanTrajectory_mem_prefixSubmodule_of_apply`,
`exercise42InfiniteGradientSpanTrajectory_prefixSupported_of_apply`, and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_lowerModel`.
The lower-model route has also been tightened to first-order data:
`exercise42InfiniteGeometricMinimizer_grad_eq_zero_of_apply`,
`exercise42InfiniteGeometricMinimizer_lowerModel_of_firstOrder`,
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_firstOrder`,
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_firstOrder`,
and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometricRatio_tail_of_firstOrder`
prove the geometric obstruction from `FirstOrderStrongConvexOn` plus the
coordinate gradient formula.  The next infinite-model step is therefore the
actual tridiagonal objective and its `FirstOrderStrongConvexOn`/gradient
package, followed by the source-shaped log-rate wrapper.  The concrete
objective layer now compiles as `exercise42InfiniteChainEdgeSq_summable`,
`exercise42InfiniteChainObjective`, `exercise42InfiniteChainObjective_apply`,
and `exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder`;
the exact log-quotient conversion now compiles as
`exercise42_iteration_count_ge_logQuotientRate_of_sq_geometric_eps_lower_bound`
and
`exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min`.
The concrete gradient is now a genuine `ell^2` oracle too:
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
This search-first step reused mathlib/local `Memℓp.add/sub/const_smul`,
`lp.single`, and `summable_nat_add_iff` to avoid any new sequence-space
primitive.  The regularization decomposition now also compiles through
`exercise42InfiniteBaseChainObjective`,
`exercise42InfiniteBaseChainGradient`,
`exercise42InfiniteBaseChainGradientLp`,
`exercise42InfiniteBaseChainGradientLp_apply`,
`exercise42InfiniteChainObjective_eq_quadraticRegularizedAround`,
`exercise42InfiniteChainGradientLp_eq_regularizedGradient`, and
`exercise42InfiniteChainObjective_firstOrderStrongConvexOn_of_base`, reusing
`quadraticRegularizedAround_firstOrderStrongConvexOn_convex`.  Only the convex
base-chain lower model
`FirstOrderStrongConvexOn Set.univ (exercise42InfiniteBaseChainObjective
(beta - alpha)) (exercise42InfiniteBaseChainGradientLp (beta - alpha)) 0`
remains on this infinite Exercise 4.2 route.  The base-chain edge substrate
now compiles as `exercise42InfiniteBaseChainEdge`,
`exercise42InfiniteBaseChainDirectionEdge`,
`exercise42InfiniteBaseChainEdgeSq_summable`,
`exercise42InfiniteBaseChainDirectionEdgeSq_summable`,
`exercise42InfiniteBaseChainEdgeLp`,
`exercise42InfiniteBaseChainDirectionEdgeLp`,
`exercise42InfiniteBaseChainEdge_mul_direction_summable`,
`exercise42InfiniteBaseChainEdge_add_direction`, and
`exercise42InfiniteBaseChainObjective_eq_edge_tsum`, giving the infinite
counterpart of the finite edge-energy representation before proving the full
direction expansion.  The expansion and lower edge-linear layer now also
compiles as `exercise42InfiniteBaseChainObjective_add_direction`,
`exercise42InfiniteBaseChainObjective_add_direction_ge_edge_linear`, and
`exercise42InfiniteBaseChainObjective_ge_edge_linear`.  The summation-by-parts
bridge and concrete first-order package now also compile as
`exercise42InfiniteBaseChain_edge_direction_sum_range_eq_core_sum_sub_boundary`,
`exercise42InfiniteBaseChain_edge_direction_tsum_eq_core_tsum`,
`inner_exercise42InfiniteBaseChainGradientLp_eq_edgeDirection_tsum`,
`exercise42InfiniteBaseChainObjective_firstOrderConvex`, and
`exercise42InfiniteChainObjective_firstOrderStrongConvexOn`, reusing mathlib
`lp.inner_eq_tsum`, `lp.summable_inner`, `Summable.tendsto_atTop_zero`, and
`tendsto_add_atTop_nat`.  The concrete no-supplied-interface infinite
geometric/log wrappers now compile as
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_concreteGradient`
and
`exercise42InfiniteChainObjective_logQuotientRate_le_near_min_concreteGradient`.
The source-rate wrappers
`exercise42InfiniteChainObjective_sqrtSubOneLogRate_le_near_min_concreteGradient`
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient`
now convert that exact quotient into the textbook's `sqrt(kappa)` lower-bound
shape, reusing the existing Chewi 4.5 log-comparison lemmas.  The literal
source exponent display now compiles as
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_concreteGradient`,
which rewrites `(q^2)^N` to `q^(2N)` for the Exercise 4.2 statement.  The
natural small-accuracy side condition is now
handled by `exercise42InfiniteGeometricInitialScale_pos` and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient_of_eps_le_initialScale`,
which derive the needed log-nonpositive hypothesis from
`eps <= (alpha/2) * ‖x_0-x_*‖^2`.
The newest source-shape wrappers certify the geometric profile as a concrete
global minimizer
(`exercise42InfiniteGeometricMinimizer_isMinOn_concreteGradient`) and rename
the display to `f(x_N)-f_*`
(`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_minValue_concreteGradient`)
under an `hfstar` value identification.  The public rate wrapper
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_fstar_concreteGradient`
now combines the `f_*` near-minimality hypothesis with the already compiled
`sqrt(kappa)` lower-bound statement.  The newest opt-value layer defines
`exercise42InfiniteChainObjectiveMinValue` and proves the named-value lower
bound plus source-display/rate wrappers
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_optValue_concreteGradient`
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_optValue_concreteGradient`.
The Theorem 4.5-facing package now also compiles:
`exercise42InfiniteInitialScale`, `exercise42InfiniteInitialScale_pos`, and
`exercise42InfiniteChainObjective_theorem45_hard_instance_package`.  The
package combines the concrete first-order/smooth oracle, zero-start
gradient-span prefix support, the geometric minimizer, the named optimum value,
and the opt-value `sqrt(kappa)` rate obstruction.  The positive-log source
display now compiles too:
`exercise42InfiniteGeometricMinimizer_proof_irrel` removes dependent
proof-term noise in the geometric minimizer, and
`exercise42InfiniteChainObjective_positiveLogRate_le_near_min_optValue_concreteGradient`
rewrites the rate from `-log(eps/C)` to `log(C/eps)` for the named initial
scale.  Next is either to use this as the source-facing direct Exercise 4.2
hard instance, or to factor the infinite substrate into a pre-`Theorem45`
module if the main Theorem 4.5 file must import it without a cycle.
The newest smoothness bridge proves
`exercise42InfiniteBaseChainDirectionEnergy_le_four_norm_sq`,
`exercise42InfiniteBaseChainObjective_add_direction_inner`,
`exercise42InfiniteBaseChainObjective_add_direction_le_smooth`,
`exercise42InfiniteBaseChainObjective_le_smooth`, and
`exercise42InfiniteChainObjective_le_smooth`, giving the exact two-point
smooth upper inequality for the concrete infinite hard-chain objective.
Continuity is now proved by squeezing the objective gap between the first-order
lower model and the smooth upper model:
`continuous_exercise42InfiniteBaseChainObjective` and
`continuous_exercise42InfiniteChainObjective` compile, as do the full supplied
smoothness wrappers
`exercise42InfiniteBaseChainObjective_smoothWithGradientOn` and
`exercise42InfiniteChainObjective_smoothWithGradientOn`.  The oracle-side
package `exercise42InfiniteChainObjective_oracle_interface_package` now
bundles first-order strong convexity, smoothness, and gradient-span support.
The finite-boundary comparison layer now also compiles:
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
`geometric_boundary_sq_le_finiteGeometricCandidate_coordinateTailSq`.  These
are the reusable finite scalar upper/lower comparisons for the next slack
proof; do not reopen the corrected-node recurrence algebra.
The concrete finite-boundary obstruction now compiles as
`chewi45_gap_ge_geometric_boundary_of_finiteGeometricCandidate` and
`chewi45_not_near_min_of_finiteGeometricCandidate_boundary_lower_bound`,
which discharge the tail lower-bound hypothesis by using the first unknown
coordinate of the corrected finite minimizer.  The next finite route is a
log/slack comparison from this explicit boundary factor; the exact
source-display route still points to a true `l^2` model.
The finite slack/log stepping stone now compiles as
`chewi45_gap_ge_geometric_boundary_floor_of_finiteGeometricCandidate`,
`chewi45_gap_ge_geometric_half_boundary_of_finiteGeometricCandidate`, and
`chewi45_not_near_min_of_finiteGeometricCandidate_half_boundary_lower_bound`.
Reuse these for the finite route: it now suffices to prove the dimension
condition `q^(2*d+2-2*(N+1)) <= 1/2` and then translate the resulting
`(alpha/8) * q^(2*(N+1))` obstruction into the logarithmic iteration lower
bound.
The monotone-exponent bridge now compiles as
`chewi45GeometricRatio_pow_le_half_of_exponent_le`,
`chewi45_half_boundary_condition_of_exponent_le`, and
`chewi45_gap_ge_geometric_half_boundary_of_finiteGeometricCandidate_of_exponent_le`.
So the next finite proof may target any convenient
`M <= 2*d+2-2*(N+1)` with `q^M <= 1/2`, rather than the exact boundary
exponent directly.
The near-minimality wrappers now compile as
`chewi45_not_near_min_of_finiteGeometricCandidate_half_boundary_lower_bound_of_exponent_le`
and
`chewi45_geometric_half_boundary_lower_bound_le_eps_of_near_min_of_exponent_le`.
The positive form should be reused for the next iteration-count conversion:
it packages the finite route as `(alpha/8) * q^(2*(N+1)) <= eps` from any
`eps`-near iterate.
The log-to-half bridge now compiles as
`chewi45GeometricRatio_pow_le_half_of_nat_mul_log_le`,
`chewi45_half_boundary_condition_of_log_exponent_le`, and
`chewi45_geometric_half_boundary_lower_bound_le_eps_of_near_min_of_log_exponent_le`.
This turns the remaining finite dimension condition into the source-shaped
log inequality `(M : Real) * log q <= log (1/2)`.
The scalar log-rate bridge now compiles as
`chewi45_rate_le_iterations_of_log_chain`,
`chewi45_iteration_count_ge_rate_of_geometric_eps_lower_bound`,
`chewi45_iteration_count_ge_rate_of_finiteGeometricCandidate_log_near_min`,
and `chewi45_not_finiteGeometricCandidate_near_min_of_log_rate_lt`.  The
remaining source-shaped work is to choose `d`, `M`, and the concrete rate so
the two supplied log comparisons hold; the finite obstruction itself already
converts those comparisons into `rate <= N`.
The quotient-rate specialization now also compiles:
`chewi45_logQuotientRate_log_comparison`,
`chewi45_iteration_count_ge_logQuotientRate_of_geometric_eps_lower_bound`,
`chewi45_iteration_count_ge_logQuotientRate_of_finiteGeometricCandidate_log_near_min`,
and `chewi45_not_finiteGeometricCandidate_near_min_of_logQuotientRate_lt`.
Thus the direct finite route only still needs the concrete dimension/exponent
half-bound; the canonical rate algebra is closed.
The standard `d = 2N+1` specialization now compiles as
`chewi45_two_mul_add_one_boundary_exponent_eq`,
`chewi45_iteration_count_ge_logQuotientRate_two_mul_add_one`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_logQuotientRate_lt_two_mul_add_one`.
This removes the finite Nat bookkeeping; the direct finite route's remaining
scalar input is the logarithmic half-bound at exponent `2(N+1)`.
The half-boundary rate conversion now compiles as
`chewi45_log_half_bound_of_logQuotient_iteration_lower_bound` and
`chewi45_not_finiteGeometricCandidate_near_min_of_two_logQuotient_rates`,
which packages the direct finite route using two explicit quotient-rate
comparisons on `N`.
The condition-number comparison layer now compiles as
`chewi45GeometricRatio_sub_one`, `chewi45GeometricRatio_inv_sub_one`,
`chewi45GeometricRatio_log_le_neg_two_div_sqrt_add_one`,
`chewi45GeometricRatio_neg_two_div_sqrt_sub_one_le_log`,
`chewi45_logQuotientRate_le_sqrt_add_one_bound`,
`chewi45_sqrt_sub_one_bound_le_logQuotientRate`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_conditionNumber_rates`.
This replaces the raw quotient-rate obstruction by a
`sqrt(kappa) +/- 1` condition-number-shaped obstruction.
The constant-cleanup layer now compiles as
`chewi45_two_le_sqrt_of_four_le`,
`chewi45_sqrt_add_one_le_three_halves_sqrt_of_four_le`,
`chewi45_half_sqrt_le_sqrt_sub_one_of_four_le`,
`chewi45_sqrt_add_one_rate_le_three_halves_sqrt_rate`,
`chewi45_half_sqrt_rate_le_sqrt_sub_one_rate`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_sqrtKappa_rates`,
which packages the direct finite route using pure `sqrt(kappa)` constants
under `4 <= kappa`.
The positive-log presentation layer now compiles as
`chewi45_log_half_eq_neg_log_two`,
`chewi45_neg_log_eps_div_alpha_eighth_eq_log_alpha_eighth_div_eps`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_sqrtKappa_positiveLog_rates`,
so the direct finite obstruction uses `log 2` and
`log ((alpha/8)/eps)` instead of negative logs.
The newest source-constant window wrapper compiles as
`chewi45_not_finiteGeometricCandidate_near_min_of_source_positiveLog_window`,
rewriting those two gates as the cleaner textbook-facing bounds
`3 * sqrt(kappa) * log 2 / 8 - 1 <= N` and
`N < sqrt(kappa) * log ((alpha/8)/eps) / 8 - 1`.
The accompanying gate comparison lemmas
`chewi45_source_positiveLog_half_gate_le_eps_gate`,
`chewi45_source_positiveLog_half_gate_lt_eps_gate_of_kappa_pos`, and
`chewi45_source_positiveLog_half_gate_lt_eps_gate_of_four_le` now compile,
so the large-log assumption can be reused without redoing scalar algebra.
The direct lower-bound theorem
`chewi45_source_positiveLog_rate_le_of_finiteGeometricCandidate_near_min` now
compiles, converting the source-window contradiction into the usable rate
conclusion `sqrt(kappa) * log ((alpha/8)/eps) / 8 - 1 <= N`.
The burn-in disjunction
`chewi45_source_positiveLog_burnin_or_rate_le_of_finiteGeometricCandidate_near_min`
also compiles, so the finite half-boundary gate is now packaged as an
alternative rather than a mandatory input to the rate lower-bound theorem.
The source step
`f_d = f_N` on `V_N` is now packaged as
`lowerBoundChainObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`, and
`lowerBoundChainObjective_gap_ge_of_gradientSpanTrajectory` proves the main
finite-dimensional gap estimate before choosing `d` as a multiple of `N`.
The source-shaped `d = 2N + 1` specialization now compiles as
`lowerBoundChainObjective_gap_ge_two_mul_add_one`, giving the clean
`β / (16 * (N + 1))` lower bound.  The shifted-chain objective is now connected to the exact unshifted
textbook display by `lowerBoundChainTextbookObjective`; its minimizer value is
`-(β / 8) * (1 - 1 / (d + 1))`, and the finite-dimensional plus `d = 2N + 1`
gap estimates have source-objective wrappers.  The textbook `(f_n)_*` step is
also available directly as
`lowerBoundChainTextbookObjective_ge_prefixMin_of_mem_coordinatePrefixSubmodule`.
Chewi's norm-scaled final line before dimension choice now compiles as
`lowerBoundChainTextbookObjective_gap_ge_norm_scaled_of_gradientSpanTrajectory`,
reusing `lowerBoundChainMinimizer_norm_sq_le_dim` and mathlib reciprocal
monotonicity.

Chapter 5 acceleration/conjugate-gradient expansion has now started in
`StatInference/Optimization/ConjugateGradient.lean`.  The compiled surface is:

- `StatInference.Optimization.quadraticObjective`
- `StatInference.Optimization.quadraticGradient`
- `StatInference.Optimization.IsSelfAdjointOperator`
- `StatInference.Optimization.QuadraticFormLowerBound`
- `StatInference.Optimization.QuadraticFormUpperBound`
- `StatInference.Optimization.quadraticGradient_eq_zero_iff`
- `StatInference.Optimization.continuous_quadraticObjective`
- `StatInference.Optimization.quadraticObjective_eq_model_add_quadratic`
- `StatInference.Optimization.quadraticObjective_firstOrderStrongConvexOn`
- `StatInference.Optimization.quadraticObjective_smoothWithGradientOn`
- `StatInference.Optimization.quadraticObjective_oracle_package`
- `StatInference.Optimization.quadraticObjective_isMinOn_of_apply_eq`
- `StatInference.Optimization.aInner`
- `StatInference.Optimization.aNormSq`
- `StatInference.Optimization.aInner_comm`
- `StatInference.Optimization.aNormSq_nonneg_of_lowerBound`
- `StatInference.Optimization.krylovVector`
- `StatInference.Optimization.krylovSubmodule`
- `StatInference.Optimization.cgDirectionSubmodule`
- `StatInference.Optimization.krylovVector_mem_krylovSubmodule`
- `StatInference.Optimization.krylovSubmodule_mono`
- `StatInference.Optimization.continuousLinearMap_apply_mem_krylovSubmodule_succ`
- `StatInference.Optimization.cgDirection_mem_cgDirectionSubmodule`
- `StatInference.Optimization.cgDirectionSubmodule_mono`
- `StatInference.Optimization.continuousLinearMap_apply_mem_cgDirectionSubmodule_succ`
- `StatInference.Optimization.IsCGKrylovRecurrence`
- `StatInference.Optimization.IsCGKrylovRecurrence.krylovVector_mem_cgDirectionSubmodule`
- `StatInference.Optimization.IsCGKrylovRecurrence.cgDirectionSubmodule_eq_krylovSubmodule`
- `StatInference.Optimization.IsOrthogonalToSubmodule`
- `StatInference.Optimization.eq_zero_of_mem_submodule_and_orthogonal`
- `StatInference.Optimization.IsCGResidualExactnessState`
- `StatInference.Optimization.quadraticGradient_eq_zero_of_cgResidualExactnessState`
- `StatInference.Optimization.quadraticObjective_isMinOn_of_cgResidualExactnessState`
- `StatInference.Optimization.IsCGThreeTermRecurrence`
- `StatInference.Optimization.IsCGThreeTermRecurrence.residual_and_direction_mem_krylovSubmodule`
- `StatInference.Optimization.IsCGThreeTermRecurrence.residual_mem_cgDirectionSubmodule`
- `StatInference.Optimization.IsCGThreeTermRecurrence.apply_direction_mem_next`
- `StatInference.Optimization.IsCGThreeTermRecurrence.to_isCGKrylovRecurrence`
- `StatInference.Optimization.IsCGThreeTermRecurrence.cgDirectionSubmodule_eq_krylovSubmodule`
- `StatInference.Optimization.cgLineSearchCoeff`
- `StatInference.Optimization.cgDirectionUpdateCoeff`
- `StatInference.Optimization.cgDirectionUpdateCoeff_denom_ne_zero`
- `StatInference.Optimization.cgLineSearchCoeff_ne_zero`
- `StatInference.Optimization.cgDirectionUpdateCoeff_ne_zero`
- `StatInference.Optimization.IsCGDisplayedIteration`
- `StatInference.Optimization.IsCGDisplayedIteration.to_isCGThreeTermRecurrence`
- `StatInference.Optimization.IsCGDisplayedIteration.to_isCGKrylovRecurrence`
- `StatInference.Optimization.IsCGDisplayedIteration.cgDirectionSubmodule_eq_krylovSubmodule`
- `StatInference.Optimization.residual_succ_mem_cgDirectionSubmodule_of_direction_succ_eq_zero`
- `StatInference.Optimization.residual_succ_eq_zero_of_direction_succ_eq_zero_and_orthogonal`
- `StatInference.Optimization.quadraticObjective_isMinOn_of_direction_succ_eq_zero_and_orthogonal`
- `StatInference.Optimization.quadraticGradient_succ_of_point_step`
- `StatInference.Optimization.residual_succ_eq_quadraticGradient_of_point_and_residual_steps`
- `StatInference.Optimization.residual_eq_quadraticGradient_of_point_and_residual_updates`
- `StatInference.Optimization.IsCGDisplayedIteration.residual_eq_quadraticGradient_of_point_updates`
- `StatInference.Optimization.exists_residual_eq_zero_of_pairwise_orthogonal`
- `StatInference.Optimization.exists_quadraticObjective_isMinOn_of_pairwise_orthogonal_residuals`
- `StatInference.Optimization.IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_pairwise_orthogonal`
- `StatInference.Optimization.IsCGThreeTermRecurrence.pairwise_residual_orthogonal`
- `StatInference.Optimization.IsCGDisplayedIteration.pairwise_residual_orthogonal`
- `StatInference.Optimization.IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_orthogonalToPrevious`
- `StatInference.Optimization.isOrthogonalToSubmodule_cgDirectionSubmodule_of_inner_direction_eq_zero`
- `StatInference.Optimization.orthogonalToPrevious_of_inner_directions_eq_zero`
- `StatInference.Optimization.IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_inner_directions_eq_zero`
- `StatInference.Optimization.inner_residual_succ_direction_eq_zero_of_inner_residual_direction_eq_norm_sq`
- `StatInference.Optimization.IsCGDisplayedIteration.inner_residual_direction_eq_norm_sq`
- `StatInference.Optimization.IsCGDisplayedIteration.inner_residual_succ_direction_self_eq_zero`
- `StatInference.Optimization.IsCGDisplayedIteration.inner_residual_succ_directions_eq_zero_of_aOrthogonal`
- `StatInference.Optimization.IsCGDisplayedIteration.exists_quadraticObjective_isMinOn_of_aOrthogonal`
- `StatInference.Optimization.IsCGDisplayedIteration.quadraticObjective_isMinOn_of_direction_succ_eq_zero_and_aOrthogonal`
- `StatInference.Optimization.IsCGDisplayedIteration.aInner_direction_self_succ_eq_zero_of_orthogonalToPrevious`
- `StatInference.Optimization.IsCGDisplayedIteration.aInner_direction_succ_eq_zero_of_lt_of_orthogonalToPrevious`
- `StatInference.Optimization.IsCGDisplayedIteration.aOrthogonal_and_inner_residual_succ_directions`
- `StatInference.Optimization.IsCGDisplayedIteration.aOrthogonal_directions`
- `StatInference.Optimization.IsCGDisplayedIteration.inner_residual_succ_directions_eq_zero`
- `StatInference.Optimization.IsCGDisplayedIteration.quadraticObjective_isMinOn_of_direction_succ_eq_zero`
- `StatInference.Optimization.IsCGDisplayedIteration.exists_quadraticObjective_isMinOn`

Source anchors are the quadratic display and linear-system minimizer claim at
markdown lines 954-960, Lemma 5.1 at line 1005, Definition 5.2 at line 1015,
Theorem 5.3 at line 1033, and Theorem 5.4 at line 1037.  Search-first result:
mathlib supplies continuous linear maps and inner-product continuity APIs,
`real_inner_comm`, `real_inner_smul_left`, `Function.iterate_succ_apply'`,
`Submodule.span_induction`, `Submodule.span_mono`, scalar inverse algebra via
`smul_smul`/`inv_mul_cancel₀`, coefficient nonzero APIs `div_ne_zero`,
`neg_ne_zero`, `pow_ne_zero`, `norm_ne_zero_iff`, `field_simp`, `ring`,
Nat split APIs `Nat.lt_or_eq_of_le` and `Nat.lt_succ_of_le`, finite-dimensional
bilinear-form APIs `LinearMap.BilinForm.linearIndependent_of_iIsOrtho`,
`LinearIndependent.fintype_card_le_finrank`, `innerₗ`, and submodule
orthogonal complement APIs;
self-adjoint/positive-operator APIs under
`Analysis/InnerProductSpace/Positive.lean` should be searched before adding a
future spectral bridge.  The current local substrate intentionally keeps
Chewi's source hypotheses as supplied symmetry and quadratic-form bounds so it
can reuse the existing `FirstOrderStrongConvexOn`, `SmoothWithGradientOn`, and
minimizer packages immediately.  The three-term recurrence layer already
derives `IsCGKrylovRecurrence` from the source update skeleton, and the
displayed-coefficient layer derives it from the literal residual and direction
formulas.  The finite-dimensional termination layer now proves the zero
direction branch and the orthogonal-residual counting/minimizer wrapper for
Theorem 5.3.  The point-update bridge now derives the residual-gradient
invariant from the displayed point and residual updates and feeds the
finite-dimensional minimizer wrapper.  The orthogonality propagation layer
now reduces pairwise residual orthogonality to the source-shaped invariant
that each new residual is orthogonal to the previous direction span; the
scalar-orthogonality layer reduces that invariant to the generated-direction
equations `inner ℝ (r (n+1)) (p k)=0` for `k≤n`; and the latest line-search
layer proves the same-index equation from the displayed coefficient, then
upgrades an A-conjugacy hypothesis on search directions to all scalar
residual-direction equations.  The zero-direction branch of Theorem 5.3 now
also compiles directly from A-conjugacy, the displayed direction update, and
the residual-gradient bridge.  The latest simultaneous induction proves the
A-conjugacy and residual-direction orthogonality invariants from the displayed
coefficients themselves, giving a finite-dimensional Theorem 5.3-facing
termination wrapper with no external A-conjugacy hypothesis.  Next proof work
should move to the descent/halving package for Theorem 5.4.

The Theorem 5.4 lane now starts in
`StatInference/Optimization/Theorem54.lean`:

- `StatInference.Optimization.chewi54_gradient_sq_sum_bound_of_competitive_step`
- `StatInference.Optimization.chewi54_gradient_sq_sum_le_two_beta_gap`
- `StatInference.Optimization.chewi54_gap_sum_le_inner_gradient_sum`
- `StatInference.Optimization.chewi54_gap_sum_le_norm_gradient_sum`
- `StatInference.Optimization.norm_sq_sum_range_eq_sum_norm_sq_of_pairwise_orthogonal`
- `StatInference.Optimization.norm_sum_range_le_sqrt_sum_norm_sq_of_pairwise_orthogonal`
- `StatInference.Optimization.chewi54_gap_sum_le_sqrt_sum_norm_sq_mul_dist`
- `StatInference.Optimization.chewi54_gap_sum_le_sqrt_product_bound`
- `StatInference.Optimization.chewi54_gap_sum_le_sqrt_product_bound_of_competitive_step`
- `StatInference.Optimization.chewi54_dist_initial_le_sqrt_gap_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi54_gap_sum_le_sqrt_product_bound_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi54_sqrt_product_bound_le_conditioned_gap`
- `StatInference.Optimization.chewi54_gap_sum_le_two_sqrt_condition_mul_gap_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi54_iteration_le_four_sqrt_condition_of_not_halved`
- `StatInference.Optimization.cgAffineSpan`
- `StatInference.Optimization.mem_cgAffineSpan_iff`
- `StatInference.Optimization.cgPoint_sub_initial_mem_cgDirectionSubmodule_of_step`
- `StatInference.Optimization.cgPoint_succ_sub_initial_mem_cgDirectionSubmodule_of_step`
- `StatInference.Optimization.gradientDescentStep_mem_cgAffineSpan_of_mem`
- `StatInference.Optimization.IsCGDisplayedIteration.point_sub_initial_mem_cgDirectionSubmodule`
- `StatInference.Optimization.IsCGDisplayedIteration.point_succ_sub_initial_mem_cgDirectionSubmodule`
- `StatInference.Optimization.IsCGDisplayedIteration.quadraticGradient_mem_cgDirectionSubmodule`
- `StatInference.Optimization.IsCGDisplayedIteration.quadraticGradient_orthogonal_displacement`
- `StatInference.Optimization.IsCGDisplayedIteration.quadraticGradient_pairwise_orthogonal`
- `StatInference.Optimization.chewi54_competitive_step_of_cgAffineMinimizer`
- `StatInference.Optimization.chewi54_functionValue_antitone_of_competitive_step`
- `StatInference.Optimization.chewi54_gap_mono_of_competitive_step`
- `StatInference.Optimization.chewi54_first_orth_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi54_star_lower_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.chewi54_accelerated_bound_of_cgAffineMinimizer`
- `StatInference.Optimization.chewi54_accelerated_bound_of_cgAffineMinimizer_univ`
- `StatInference.Optimization.IsCGDisplayedIteration.chewi54_accelerated_bound_of_cgAffineMinimizer`
- `StatInference.Optimization.firstOrderStrongConvexOn_isMinOn_cgAffineSpan_of_orthogonal`
- `StatInference.Optimization.IsCGDisplayedIteration.isMinOn_cgAffineSpan_of_point_updates`
- `StatInference.Optimization.IsCGDisplayedIteration.chewi54_accelerated_bound_of_point_updates`

This compiles the source descent comparison against the `1 / beta` gradient
step and telescopes the Lemma 3.1 decrease to the finite squared-gradient sum
bound.  The newest layer also proves the summed first-order/orthogonality
inequality, Cauchy-Schwarz wrapper, finite Pythagoras identity for pairwise
orthogonal gradients, strong-convexity radius estimate, and the source
pre-halving product bound, then simplifies it to
`2 * sqrt(beta / alpha) * initial_gap` and proves the restart/halving
iteration-count conversion.  The newest wrapper layer packages the displayed
affine-minimizer/search-span proof into a source-facing CG Theorem 5.4 theorem
and derives the competitive-step, monotone-gap, first-order/orthogonality, and
lower-optimum hypotheses.  The newest displayed-CG bridge discharges the
point-update search-span membership, residual-gradient membership,
displacement orthogonality, and pairwise gradient orthogonality from
`IsCGDisplayedIteration`.  The affine minimization property over
`x_0 + span {p_0, ..., p_n}` is now derived from the same displayed-CG
orthogonality plus the first-order strong-convexity lower model.  The
restart/log endpoint packaging now compiles in `Theorem54.lean` via
`chewi54_halvingBlocks_gap_le`,
`chewi54_halvingBlocks_gap_le_of_power_bound`,
`chewi54_half_pow_mul_le_eps_of_log_ratio_le`, and
`chewi54_halvingBlocks_gap_le_of_log_ratio_le`, reusing
`scalarRecurrence_le_pow` and mathlib's `Real.log_*` APIs.  The integer
block bridge now compiles via `chewi54BlockSize`,
`chewi54_four_sqrt_le_blockSize`,
`chewi54_block_halving_of_accelerated_block_bound`,
`chewi54_block_halving_recurrence_of_accelerated_block_bounds`,
`chewi54_log_rate_of_accelerated_block_bounds`, and
`chewi54_log_rate_of_accelerated_block_bounds_blockSize`.  The next Theorem
5.4 target is to derive the per-block accelerated bound from a
restarted/displayed CG interface, then state the full source-facing
logarithmic CG rate, or source-audit the polynomial/Chebyshev alternative
proof before moving to Theorem 5.8.  The affine-minimizer restarted interface
now compiles as `chewi54_block_bound_of_cgAffineMinimizer_blocks`,
`chewi54_log_rate_of_cgAffineMinimizer_blocks`, and
`chewi54_log_rate_of_cgAffineMinimizer_blocks_blockSize`.  The displayed
restart specialization now compiles as
`chewi54_log_rate_of_displayed_cg_blocks` and
`chewi54_log_rate_of_displayed_cg_blocks_blockSize`, discharging those block
hypotheses from `IsCGDisplayedIteration`-style data.  The next step is a
source-audited final Theorem 5.4 wrapper/report path, or the
polynomial/Chebyshev route before moving to Theorem 5.8.

After the basic convex/smooth/GD surface compiles, broaden in this order:

1. Lower bounds and oracle/gradient-span interfaces, Chapter 4.
2. Acceleration and conjugate gradient, Chapter 5.
3. Non-smooth convex optimization, subgradients, projections, and cutting
   planes, Chapter 6.
4. Frank-Wolfe and proximal methods, Chapters 7-8.
5. Fenchel duality and mirror methods, Chapters 9-10.
6. Alternating minimization and optimal transport case study, Chapter 11.
7. Stochastic optimization and Polyak-Ruppert averaging, Chapter 12.
8. Interior point methods, self-concordance, and matrix background,
   Chapter 13 and Appendix A.

## Source-Audit Gate

Every exact textbook theorem or lemma that is fully proved in Lean must get a
report under `Reports/Optimization_<item-number>_<short_slug>/` with:

1. Lean declaration name, file path, and proof status.
2. Every new definition, lemma, structure, or theorem introduced for that
   proof.
3. Markdown source path and line range.
4. PDF source path and local screenshot path for the corresponding passage.
5. `source_screenshots.md` with the real local screenshot images embedded.
6. A locally compiled `report.pdf`.
7. A gap note saying what broader textbook-order compatibility work remains.

Intermediate proof layers should update this blueprint, the dashboard, or the
current blocker plan, not `Reports/`.
