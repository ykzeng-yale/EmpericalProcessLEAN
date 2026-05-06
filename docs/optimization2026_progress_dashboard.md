# Optimization 2026 Progress Dashboard

This dashboard tracks the Chewi optimization formalization lane for
`StatInference/`.

## Snapshot

- Source assets: local PDF and Markdown are available under
  `Textbooks/Optimization2026/`.
- Lean namespace started: `StatInference.Optimization`.
- Lean code location: content-based folder `StatInference/Optimization/`.
- First module: `StatInference/Optimization/Basic.lean`, imported by
  `StatInference.lean`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Optimization report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
- Exercise policy: all Optimization textbook exercise statements and exercise
  proofs live in the single module `StatInference/Optimization/Exercises.lean`.
  The main-text theorem lane remains priority; exercise statements can be
  formalized there when useful for reuse, and full exercise proofs can be added
  opportunistically when they are cheap or unlock theorem progress.
- Automation policy: the Optimization heartbeat is currently paused while this
  thread runs under an explicit manual goal.  If reactivated, refresh the live
  prompt from the blocker plan and dashboard before ending any proof run.
- Manual goal policy: the app-level `/goal` objective text cannot be edited
  directly in this tool surface unless the goal is complete.  Until the full
  textbook formalization is complete, use
  `docs/optimization2026_current_blocker_primitive_plan.md` as the live
  replacement goal prompt and avoid replaying completed Theorem 3.4/3.6 setup
  work.
- Current manual frontier after rebasing local `main` onto `origin/main` at
  `038e7e3` (`Add weak convergence asymptotic tightness bridge`) with the verified
  source-volume determinant, scalar `hvolume`, determinant-unit inverse-shape
  reduction, normalized forward/inverse algebra, and forward-shape transport
  reduction packets, plus the local rank-one/displayed-action transport
  support, concrete displayed-to-normalized forward-shape transport,
  displayed-matrices certificate, real Haar/matrix image-volume scaling,
  CFC-root, and displayed-shape positivity packets in
  `StatInference/Optimization/Ellipsoid.lean`:
  `StatInference/Optimization/Theorem510.lean` proves the source-shaped
  discrete AGD rate, and `StatInference/Optimization/ProjectedSubgradient.lean`
  now starts Chapter 6 with compiled finite-valued subgradient/projection/PSD
  interfaces, Lemma 6.12-style projection characterization, Lemma 6.13
  non-expansiveness, Jensen for averaged iterates, the PSD one-step recurrence,
  finite telescoping, and the supplied-interface Theorem 6.14 wrapper
  `chewi614_average_gap_bound`, plus the valid Lipschitz/ray bridge,
  displayed `h = R / sqrt N` corollary, scaled-step recurrence for the
  functional-constraint method, source-shaped functional-constraint PSD
  interface, the two strict case-decrease lemmas, finite strict-decrease
  contradiction, and `chewi616_exists_functionalConstraintSuccess`.
  `StatInference/Optimization/CuttingPlane.lean` now adds the supplied
  volume-shrink/center-of-gravity algebra for Lemma 6.18/Theorem 6.19:
  `HasVolumeShrink`, `centerOfGravityRate`,
  `IsCuttingPlaneValueCertificate`,
  `HasScaledOutsideCandidateWithinDiameter`,
  `HasScaledOutsideCandidatesAbove`, finite shrink and ratio bounds,
  scaled-candidate Lipschitz/diameter bound, candidate-family eventual bound,
  the limiting scalar helper, and final source-rate wrapper
  `chewi619_gap_le_display_rate_of_scaled_candidates`.  The active target is
  now the exact Lemma 6.20 matrix proof; the supplied ellipsoid trajectory and
  rate layer plus normalized scalar central-cut containment, determinant-ratio
  cores, coordinate-free normalized half-space containment, abstract
  affine-transport certificate bridge, the first Euclidean matrix
  quadratic/positive-denominator and normalized-cut algebra bridge, the
  symmetric square-root raw-adjoint/cut bridge, the PosDef
  invertibility/cancellation bridge, the pullback-standard-cut certificate,
  current `Σ⁻¹` identification, displayed center-update declarations,
  `chewi620_matrix_rankOne_collapse`, the displayed forward-shape determinant
  declarations, source-volume determinant ratio, determinant
  positivity/nonzero/unit facts, scalar `hvolume` bridge, determinant-unit
  inverse-shape reduction, normalized forward/inverse cancellation,
  forward-shape transport reductions, rank-one action expansion,
  displayed-shape action expansion, and square-root current/rank-inner
  transport, plus scale-square normalization and the concrete
  displayed-to-normalized forward-shape transport theorem compile in
  `StatInference/Optimization/Ellipsoid.lean`.  The volume-scaling bridge also
  compiles in focused Lean through
  `addHaar_image_linearMap_real`, `addHaar_image_add_left_real`,
  `matrix_toEuclideanLin_det`, `matrixInvShape_image_volume_real`, and
  `matrixInvShape_image_add_volume_real`.  The displayed next-shape certificate
  also compiles through `chewi620_matrixSqrt_quadratic`,
  `chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_sqrt`,
  `chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_sqrt`,
  and `chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`.
  The determinant-volume model bridge now compiles through
  `chewi620_hvolume_of_matrix_image_volume_models` and
  `chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`.
  The translated closed-unit-ball image model and displayed-volume wrapper now
  compile through `ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`,
  `cfcSqrt_det_sq_of_posSemidef`, and
  `chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`.
  The CFC-root instantiation now compiles through
  `cfcSqrt_quadratic_inv_of_posDef` and
  `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`.  The
  displayed-shape positivity packet now compiles through
  `cfcSqrt_inner_matrixInvShape_left`,
  `chewi620_matrix_rankOne_cauchy_schwarz`,
  `chewi620_displayedShapeUpdateCore_isHermitian`,
  `chewi620_displayedShapeUpdate_isHermitian`,
  `chewi620_displayedShapeUpdateCore_quadratic_pos`,
  `chewi620_displayedShapeUpdate_quadratic_pos`,
  `chewi620_displayedShapeUpdate_posDef`, and
  `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt`.  The sequence/rate
  promotion now compiles through `chewi620_displayedMatrices_trajectory_of_cfcSqrt`
  and `chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`.
  The Chapter 6 lower-bound lane now has a focused Lean-verified local packet in
  `StatInference/Optimization/NonsmoothLowerBounds.lean` for the Theorem 6.21
  max-coordinate obstruction: coordinate maximum, hard objective, prefix-subspace
  nonnegativity, gradient-span prefix induction consumer, and final supplied
  gap wrapper compile.  The newest local packet now also compiles the displayed
  constant minimizer, objective value, first-max resisting oracle, oracle
  prefix-support, concrete `gamma^2/(2 alpha d)` obstruction, scalar source
  parameter identity, and the `d = N + 1` source-rate lower bound
  `L * R / (8 * sqrt (N + 1))`.  The latest certification packet proves the
  first-max oracle is a whole-space `IsSubgradientAt`, proves the quadratic and
  max-part subgradient inequalities, and proves the displayed source radius
  facts `‖x_*‖ = R` and `dist 0 x_* <= R` for
  `alpha = gamma / (R * sqrt d)`.  The newest side-condition packet proves the
  coordinate-basis norm, first-max oracle norm bound, whole-space first-order
  convexity certificate, bounded-domain Lipschitz certificate on
  `Metric.closedBall 0 R`, the displayed source constant bound by `L`, and
  source-shaped first-order convexity/Lipschitz wrappers for the concrete
  `d = N + 1` instance.  The next target is literal Theorem 6.21 packaging:
  arbitrary `d > N` embedding only if needed, then the strongly convex Theorem 6.22 and
  feasibility Definition 6.24/Theorem 6.25, while the exact Grünbaum/centroid
  theorem remains a supplied blocker for exact CoGM reporting.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 convexity/smoothness foundations | local-layer/mathlib-foundation | `StatInference/Optimization/Basic.lean`, `StatInference/Optimization/Minimizer.lean`; mathlib `StrongConvexOn`, `ConvexOn`, `StrictConvexOn`, `HasGradientAt` | Initial interfaces for strong convexity, Chewi convexity, smooth upper models, gradient-descent steps, first-order lower models, strong gradient monotonicity, Exercise 3.1 co-coercivity, PL, h-scaled step co-coercivity, mathlib-gradient Lipschitzness, and GD trajectories compile as the intended surface for Definition 1.5, Definition 1.12, Definition 2.5, Proposition 1.6, Exercise 3.1, and Chapter 3. Chewi's segment `StrongConvexOn C f alpha` now bridges both ways with mathlib's root `_root_.StrongConvexOn C alpha f`; parameter downshift compiles for local `StrongConvexOn` via mathlib's root `StrongConvexOn.mono`, and for `FirstOrderStrongConvexOn` by direct lower-model algebra. Nonnegative Chewi strong convexity exposes both Chewi convexity and mathlib `ConvexOn`. Proposition 1.6 now has `(1.3) => (1.4)` on `Set.univ` from segment `StrongConvexOn` plus `HasGradientAt`, and `(1.4) => (1.5)` from `FirstOrderStrongConvexOn` to `StronglyMonotoneGradientOn`. Lemma 1.10 minimizer uniqueness and Corollary 1.11-style gradient-zero characterization wrappers compile in `Minimizer.lean`. Prefer mathlib's `StrongConvexOn`, `ConvexOn`, `StrictConvexOn`, and `gradient` APIs for exact derivative-heavy theorem routes. |
| Chapter 2 gradient flow and PL/QG | local-layer | `StatInference/Optimization/GradientFlow.lean`, `StatInference/Optimization/Theorem27.lean`, `StatInference/Optimization/Theorem28.lean` | Gradient-flow trajectory interface now compiles. Lemma 2.1 derivative identity, gap derivative, and value antitonicity compile from mathlib `HasGradientAt` plus chain rule. Theorem 2.2 has the squared-distance derivative identity, the strong-monotonicity differential inequality, weighted exponential squared-distance contraction, and the literal norm-form contraction from supplied monotonicity, first-order strong convexity, and actual whole-space `StrongConvexOn` plus `HasGradientAt`. Theorem 2.4 now has the interval-integral weighted-forcing step, monotone-gap weighted lower bound, positive-`alpha` denominator convergence, and `alpha = 0` limiting convergence from first-order strong convexity and whole-space `StrongConvexOn` plus `HasGradientAt`; the newest wrappers discharge the exposed interval-integrability assumptions from continuity of the gradient-oracle trajectory on `[0,t]`. Corollary 2.6 has the PL differential inequality and source-shaped exponential function-gap convergence. Proposition 2.7 now has the compiled strong-convexity-to-PL implication plus exact `QuadraticGrowthOn`/witness forms, the algebra from Chewi's gradient-flow limit route to `(QG)`, and bridges from explicit Lyapunov routes down to `(QG)`. The newest bridge compiles component, norm-derivative, nonzero-displacement, continuous-data, and side-condition routes: it uses mathlib `antitoneOn_of_hasDerivWithinAt_nonpos`, `HasDerivWithinAt.norm_sq`/`sqrt`, `ContinuousOn.sqrt`/`norm`, `HasDerivAt.continuousOn`, local `gradientFlow_gap_hasDerivAt`, and the scalar PL sign calculation `plLyapunovDerivativeBound_nonpos`. The latest branch split adds nontrivial-start limit/Lyapunov routes, a nontrivial-start side-condition route to `(QG)`, and now a no-minimizer-hit route which derives positive gap instead of assuming it. Reference-minimizer wrappers now derive the minimizer-value invariant from one attained minimizer, so the nontrivial-start and no-minimizer-hit QG routes no longer need a global `fstar`-value assumption. Corollary 2.8 now compiles through the integrated Lemma 2.1 identity, squared-gradient average bound, interval-minimum square-root form from an `IsMinOn` representative, and a compactness/continuity wrapper that discharges the minimizing-time and integrability hypotheses. Next Chapter 2 target is discharging or sharply packaging the remaining nontrivial-start convergence-to-minimizer, feasible trajectory membership, no-minimizer-hit, and nonzero-displacement side conditions behind Proposition 2.7(2). |
| Chapter 3 smooth gradient descent | local-layer | `gradientDescentStep`, `IsGradientDescentTrajectory`, `DiscreteGronwall.lean`, `GradientDescent.lean`, `Theorem33.lean`, `Theorem34.lean`, `Theorem36.lean`, `Theorem37.lean`, `Exercises.lean` | First deterministic GD trajectory interface is available. Chewi Lemma 3.5 now has zero-based and source-shaped one-based compiled wrappers, Chewi Lemma 3.1 is compiled from the smooth upper-model interface, GD function values are antitone under the descent step-size condition, Theorem 3.3 contraction compiles in squared and norm forms from supplied gradient monotonicity, supplied first-order lower model, and actual whole-space segment `StrongConvexOn` plus `HasGradientAt`; Exercise 3.1 co-coercivity now compiles in whole-space smooth-convex form and supplies Theorem 3.3 wrappers without a separate co-coercivity assumption. The newest Exercise 3.1 wrappers also remove the separate alpha-zero convexity hypothesis: `0 <= alpha` now downshifts `FirstOrderStrongConvexOn` or `StrongConvexOn` to the convex lower model internally. Theorem 3.4 positive-`alpha` plus `alpha = 0` denominator bounds compile from the first-order model and from actual whole-space `StrongConvexOn` plus `HasGradientAt`. Theorem 3.6 PL convergence compiles from the descent lemma plus scalar recurrence, and Theorem 3.7 compiles in existential and finite-minimum gradient-norm forms from the descent lemma plus finite telescoping/average APIs. This lane is stable background; do not route manual goal time back here unless a later theorem needs a dependency. |
| Chapter 4 convex/strongly-convex reductions | local-layer | `StatInference/Optimization/Reductions.lean` | Chewi Lemma 4.2's regularization spine and condition-number wrapper now compile. `quadraticRegularizedAround` and `regularizedGradient` model `f_delta = f + delta / 2 * ‖· - x0‖^2`; regularization shifts first-order lower-model parameter `alpha` to `alpha + delta`, shifts smoothness `beta` to `beta + delta`, and `SmoothWithGradientOn.mono` promotes bounded smoothness constants. Source-shaped value, radius, and complexity hooks compile through `quadraticRegularizedAround_near_min_gap_le_eps_of_radius`, `regularized_minimizer_dist_le_radius_of_base_min_delta`, `regularized_conditionNumber_le`, `lemma42_regularization_complexity_package`, `lemma42_regularization_reduction_package`, and `lemma42_regularization_reduction_package_of_isMinOn`. Search-first result: no local condition-number/regularization layer existed; reused `FirstOrderStrongConvexOn`, `SmoothWithGradientOn`, `norm_add_sq_real`, `real_inner_smul_left`, `sq_le_sq₀`, `div_le_iff₀`, `div_le_div_of_nonneg_right`, `field_simp`, and `mul_le_mul_of_nonneg_left`. Next target is to connect this Lemma 4.2 reduction package with the compiled Theorem 4.4 lower-bound lane to get Theorem 4.5. |
| Chapter 4 lower bounds | local-layer | `StatInference/Optimization/LowerBounds.lean` | Definition 4.3 gradient-span algorithms now compile through `gradientSpanSubmodule`, `affineGradientSpan`, and `IsGradientSpanTrajectory`; the source example "GD is a gradient span algorithm" compiles as `IsGradientDescentTrajectory.isGradientSpanTrajectory` plus source-shaped membership wrappers. The source subspaces `V_n` in Theorem 4.4 now compile as `coordinatePrefixSubmodule` over `EuclideanSpace ℝ (Fin d)`, with monotonicity, eventual top, span-containment, and the abstract induction `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next`. The tridiagonal chain-gradient oracle now compiles as `lowerBoundChainGradient`; `lowerBoundChainGradient_mem_coordinatePrefixSubmodule` proves the displayed support calculation `x ∈ V_k -> grad x ∈ V_{k+1}`, and `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_lowerBoundChainGradient` assembles the zero-start trajectory induction. The displayed minimizer candidate now compiles as `lowerBoundChainMinimizer`, `lowerBoundChainGradient_lowerBoundChainMinimizer` proves the chain-gradient vanishes there, and `lowerBoundChainMinimizer_norm_sq_le_dim` proves the source estimate `‖x_*‖² ≤ d` from coordinate square bounds. The shifted lower-bound quadratic compiles as `lowerBoundChainObjective`, and the exact unshifted source display now compiles as `lowerBoundChainTextbookObjective`; minimizer values, global `IsMinOn` theorems, the direct textbook `(f_N)_*` lower bound, finite-dimensional gap wrappers, the norm-scaled final lower-bound line, and the `d = 2N + 1` source-objective corollary all compile. The objective-gradient algebra now includes zero-boundary direction nodes/edges, exact edge residual subtraction/addition, exact shifted and source-objective quadratic expansions, summation-by-parts from edge work to `inner ℝ (lowerBoundChainGradient beta d x) v`, the uniform direction-energy bound for `β`-smoothness, first-order convex lower-model wrappers, continuity, and `SmoothWithGradientOn Set.univ` wrappers for both shifted and unshifted objectives. This captures `f_d = f_N` on `V_N` as a direct lower bound, proves the finite-dimensional Theorem 4.4 gap, and specializes to the clean `β / (16 * (N + 1))` lower bound. Search-first result: no local Chewi gradient-span/objective layer existed; mathlib `Submodule.span`, `Submodule.subset_span`, `Submodule.span_mono`, `EuclideanSpace.real_norm_sq_eq`, `Finset.sum_le_sum`, `sq_sum_le_card_mul_sum_sq`, `isMinOn_univ_iff`, `Finset.sum_map`, `Finset.sum_le_sum_of_subset_of_nonneg`, `one_div_le_one_div`, finite-type sum constants, `Fin.sum_univ_castSucc`, `Fin.sum_univ_succ`, and `EuclideanSpace`/`PiLp` coordinate-continuity APIs are the reusable foundation. Next Chapter 4 step is exact source-report packaging around Theorem 4.4 or continuing to the strongly-convex lower bound Theorem 4.5 if report packaging is deferred. |
| Chapter 4 strongly-convex lower bound | local-layer | `StatInference/Optimization/Theorem45.lean` | The concrete strongly-convex chain setup for Theorem 4.5 now compiles. `strongLowerBoundChainObjective alpha beta d` regularizes the source lower-bound chain with base smoothness `beta - alpha` around the origin, and `strongLowerBoundChainGradient` is its supplied gradient. Compiled declarations include apply lemmas, `strongLowerBoundChainObjective_firstOrderStrongConvexOn`, `strongLowerBoundChainObjective_smoothWithGradientOn`, `strongLowerBoundChainGradient_mem_coordinatePrefixSubmodule`, `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_strongLowerBoundChainGradient`, and `chewi45_regularized_chain_interface_package`. The gap witness layer adds `coordinateTailSq`, `coordinateTailSq_le_sqdist_of_mem_coordinatePrefixSubmodule`, `strongLowerBoundChainObjective_gap_ge_tailSq_of_gradient_eq_zero`, and `strongLowerBoundChainObjective_gap_ge_tailSq_of_gradientSpanTrajectory`: any zero-gradient minimizer candidate with tail outside `V_N` forces a function-value gap for every gradient-span iterate in `V_N`. The reduction layer instantiates Lemma 4.2 on the concrete Theorem 4.4 lower-bound chain: `lowerBoundChainMinimizer_norm_le_sqrt_dim`, `chewi45_lowerBoundChain_regularization_complexity_package`, `chewi45_lowerBoundChain_regularization_reduction_package`, and `chewi45_lowerBoundChain_regularization_reduction_package_sqrt_dim` compile. The obstruction layer combines regularized-oracle support with the convex prefix lower bound: `lowerBoundChainTextbookObjective_gap_ge_of_mem_coordinatePrefixSubmodule`, `regularizedLowerBoundChainGradient_mem_coordinatePrefixSubmodule`, `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_regularizedLowerBoundChainGradient`, `chewi45_convex_lower_bound_le_eps_of_regularizedGradientSpan_near_min`, `chewi45_two_mul_add_one_lower_bound_le_eps_of_regularizedGradientSpan_near_min`, and `chewi45_not_regularizedGradientSpan_near_min_of_eps_lt_two_mul_add_one_bound` compile. The iteration-count layer converts the obstruction into a lower bound on `N`: `chewi45_iteration_count_ge_of_two_mul_add_one_lower_bound`, `chewi45_iteration_count_ge_of_regularizedGradientSpan_near_min`, and `chewi45_not_regularizedGradientSpan_near_min_of_iteration_count_lt` compile. The source-shaped rate layer adds `chewi45_iteration_count_ge_rate_of_regularizedGradientSpan_near_min`, `chewi45_iteration_count_ge_sqrtKappa_log_rate_of_regularizedGradientSpan_near_min`, and `chewi45_not_regularizedGradientSpan_near_min_of_sqrtKappa_log_rate_lt`, isolating the analytic comparison as `c * sqrt(kappa) * log(ratio) <= beta / (16 * eps) - 1`. The direct Exercise 4.2 layer defines `chewi45GeometricRatio`, proves its nonnegative/positive/less-than-one/power facts, and packages the geometric-tail obstruction as `strongLowerBoundChainObjective_gap_ge_geometric_tail_of_gradientSpanTrajectory`, `chewi45_gap_ge_geometricRatio_tail_of_gradientSpanTrajectory`, and `chewi45_not_near_min_of_geometricRatio_tail_lower_bound`. The geometric-candidate algebra proves `chewi45GeometricRatio_quadratic`, `chewi45GeometricRatio_recurrence`, `chewi45GeometricRatio_pow_recurrence`, defines `strongLowerBoundGeometricCandidate`, and proves `strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_interior`. The newest boundary layer adds `strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_first`, `strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_not_last`, and `strongLowerBoundChainGradient_geometricCandidate_eq_terminal_residual`: under `kappa = beta / alpha`, the geometric vector kills every nonterminal tridiagonal gradient coordinate and leaves exactly `((beta - alpha) / 4) * q^(i+2)` at the terminal coordinate. Search-first result: reused `LowerBounds.lean`'s coordinate formula for `lowerBoundChainGradient`, plus mathlib `Real.sq_sqrt`, `Real.sqrt_pos`, `Real.sqrt_lt_sqrt`, `one_lt_div`, `field_simp`, and `ring_nf`; reused `omega` for finite-coordinate index algebra. Next target is the finite correction or infinite-model step: cancel the terminal residual while preserving the geometric tail lower bound, or move to a true `ℓ²`/infinite sequence model where there is no terminal residual, then convert the geometric obstruction into the logarithmic iteration-count statement. |
| Chapter 5 acceleration and conjugate gradient | local-layer | `StatInference/Optimization/ConjugateGradient.lean`, `StatInference/Optimization/Theorem54.lean`, `StatInference/Optimization/Theorem58.lean`, `StatInference/Optimization/Theorem59.lean`, `StatInference/Optimization/Theorem510.lean` | The Chapter 5 quadratic/CG substrate, Lemma 5.1 Krylov equality, Theorem 5.3 finite-dimensional termination-facing wrappers, and Theorem 5.4 descent/halving/log-rate layers now compile. The latest CG endpoint is the displayed restarted-CG specialization `chewi54_log_rate_of_displayed_cg_blocks_blockSize`. Theorem 5.8 has the AGF trajectory/friction interface, Lyapunov derivative formula, continuity wrappers, monotone-to-rate consumers, and source wrapper `chewi58_gap_le_of_agf_firstOrderConvex`. Theorem 5.9 compiles through the source-shaped exponential gap theorem and `chewi59_gap_le_exp_decay_of_firstOrderStrongConvex_of_isMinOn`. Theorem 5.10 now compiles through the full discrete AGD source-rate chain: `chewi510Lambda`, `chewi510Theta`, `chewi510TrialPoint`, `IsChewi510AGDTrajectory`, lambda positivity/nonzero/recurrence/growth, `chewi510Lambda_ge_nat_half`, telescope alignment, `(3.3)` reuse, rearranged gap bounds, `chewi510_weighted_two_point_bound_telescope`, `chewi510_weighted_sum_bound`, `chewi510_lambda_sq_gap_le_initial_energy`, `chewi510_gap_le_initial_distance_over_lambda_sq`, and final `chewi510_gap_le_two_beta_dist_sq_over_nat_sq`. Search-first result: source `(3.3)` reuses `oneStepRecurrence_of_firstOrderStrongConvexOn`; lambda and telescope algebra reuse local `sum_range_sub_succ`, `norm_add_sq_real`, `Real.sq_sqrt`, `Real.le_sqrt_of_sq_le`, `field_simp`, `module`, `ring`, and `nlinarith`. Next Chapter 5 work is optional source-report packaging or Example 5.11/logistic-regression modeling, not the main active lane. |
| Chapter 6 nonsmooth convex optimization | local-layer | `StatInference/Optimization/ProjectedSubgradient.lean`, `StatInference/Optimization/CuttingPlane.lean`, `StatInference/Optimization/Ellipsoid.lean`, `StatInference/Optimization/NonsmoothLowerBounds.lean` | The Chapter 6 PSD layer now compiles through finite-valued Theorems 6.14 and 6.16 in source-facing supplied-interface form. It defines `IsSubgradientAt`, projection/subgradient trajectories, Jensen/telescoping wrappers, Theorem 6.14 wrappers, and `chewi616_exists_functionalConstraintSuccess`. `CuttingPlane.lean` proves the supplied-interface CoGM Theorem 6.19 spine through `chewi619_gap_le_display_rate_of_scaled_candidates`. `Ellipsoid.lean` proves the supplied Lemma 6.20 ellipsoid trajectory/rate layer, scalar central-cut containment, determinant-ratio core, coordinate-free containment, affine transport, Euclidean matrix/PosDef cancellation, pullback-standard-cut certificate, current `Σ⁻¹` identification, displayed center update, rank-one determinant collapse, source-volume determinant ratio, determinant-unit inverse-shape reduction, normalized forward/inverse cancellation, forward-shape transport reductions, rank-one/displayed-action expansion, square-root current/rank-inner transport, `chewi620_matrixCutScale_mul_self_of_pos`, `chewi620_displayedShapeUpdate_forwardShape_transport_of_sqrt`, displayed next-shape certificate `chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`, local real Haar/matrix image-volume scaling through `addHaar_image_linearMap_real`, `addHaar_image_add_left_real`, `matrix_toEuclideanLin_det`, `matrixInvShape_image_volume_real`, and `matrixInvShape_image_add_volume_real`, the generic determinant-square volume bridge `chewi620_hvolume_of_matrix_image_volume_models` and its displayed-certificate consumer `chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`, plus `ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`, `cfcSqrt_det_sq_of_posSemidef`, `chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`, `cfcSqrt_quadratic_inv_of_posDef`, `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`, `cfcSqrt_inner_matrixInvShape_left`, `chewi620_matrix_rankOne_cauchy_schwarz`, `chewi620_displayedShapeUpdateCore_isHermitian`, `chewi620_displayedShapeUpdate_isHermitian`, `chewi620_displayedShapeUpdateCore_quadratic_pos`, `chewi620_displayedShapeUpdate_quadratic_pos`, `chewi620_displayedShapeUpdate_posDef`, `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt`, `chewi620_displayedMatrices_trajectory_of_cfcSqrt`, and `chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`. `NonsmoothLowerBounds.lean` now advances Theorem 6.21 with `chewi621CoordinateMax`, `chewi621HardObjective`, `chewi621ActiveIndexSet`, `chewi621FirstMaxIndex`, `chewi621CoordinateBasis`, `chewi621CoordinateBasis_inner`, `chewi621Minimizer`, `chewi621CoordinateMax_minimizer`, `chewi621Minimizer_norm_sq`, `chewi621FirstMaxIndex_le_of_mem_coordinatePrefixSubmodule`, `chewi621FirstMaxOracle`, `chewi621_quadratic_subgradient_ineq`, `chewi621_firstMax_subgradient_ineq`, `chewi621FirstMaxOracle_isSubgradientAt_univ`, `chewi621FirstMaxOracle_mem_coordinatePrefixSubmodule_of_mem`, `chewi621HardObjective_minimizer_value`, `chewi621Minimizer_norm_sq_source_alpha`, `chewi621Minimizer_norm_eq_radius_source_alpha`, `chewi621_zero_dist_minimizer_le_radius_source_alpha`, `chewi621_gap_ge_of_gradientSpan_prefix_nonneg`, `chewi621_hardObjective_gap_ge_of_gradientSpan`, `chewi621_gap_ge_minimizer_value_of_firstMaxGradientSpan`, `chewi621_source_parameter_gap_eq`, and `chewi621_gap_ge_source_parameters`. Search-first result: reused local `IsSubgradientAt` from `ProjectedSubgradient.lean`, `coordinatePrefixSubmodule`, `coordinatePrefixSubmodule_eq_top_of_le`, `coordinatePrefixSubmodule_mono`, and `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next` from `LowerBounds.lean`, local Euclidean norm-sum patterns, plus mathlib `Finset.max'`, `Finset.min'`, `EuclideanSpace.real_norm_sq_eq`, `PiLp.toLp_apply`, `PiLp.inner_apply`, `Real.sq_sqrt`, `Real.sqrt_pos`, `field_simp`, and scalar `ring`/`nlinarith`; no direct mathlib/local Chewi nonsmooth lower-bound theorem was found. Current aggressive packet: certify Theorem 6.21's remaining source side conditions around the concrete `d = N + 1` hard instance, especially bounded-domain Lipschitz or arbitrary `d > N` embedding; then move to Theorem 6.22 and Definition 6.24/Theorem 6.25. |
| Chapters 7-11 deterministic algorithms | pending-local | none | Frank-Wolfe, proximal methods, Fenchel duality, mirror methods, and alternating minimization should wait until the Chapter 6 projection/subgradient layer is stable. |
| Chapter 12 stochastic optimization | pending-local | none | Should reuse `StatInference/ProbabilityMeasure` and empirical-process probability wrappers where possible. |
| Chapter 13 and Appendix A | pending-local/mathlib-foundation | none | Matrix, PSD, eigenvalue, operator norm, Newton, self-concordance, and barrier material should reuse mathlib linear algebra and matrix APIs before local definitions. |

## Initial Reuse Audit

High-value mathlib files to search first:

- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Function.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Strong.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Deriv.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/Gradient/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Normed.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Convex/Topology.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/FDeriv/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/FDeriv/MeanValue.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Calculus/ContDiff/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/ODE/DiscreteGronwall.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/ODE/Gronwall.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/InnerProductSpace/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Matrix/Order.lean`
- `.lake/packages/mathlib/Mathlib/Analysis/Matrix/PosDef.lean`
- `.lake/packages/mathlib/Mathlib/LinearAlgebra/Matrix/Symmetric.lean`
- `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/Lipschitz.lean`

High-value local files:

- `StatInference/Asymptotics/Basic.lean`
- `StatInference/EmpiricalProcess/Basic.lean`
- `StatInference/ProbabilityMeasure/Basic.lean`

## Current Active Target

Current active target after the verified local side-condition packet on top of
`9906f2a`: Chapter 6 Theorem 6.21 is the live manual `/goal` frontier.  The
Chapter 6 infrastructure through Theorems 6.14/6.16, the supplied CoGM 6.19
spine, and the supplied Lemma 6.20 ellipsoid trajectory/rate layer should be
treated as stable background.  `NonsmoothLowerBounds.lean` now proves the hard
max-coordinate objective, first-max oracle subgradient correctness, prefix
support, source-rate gap, source-radius facts, source first-order convexity, and
bounded-domain Lipschitz-on-ball facts for the concrete `d = N + 1` instance.
The next theorem packet should either add the literal arbitrary `d > N`
embedding/report wrapper for Theorem 6.21 or move directly to Theorem 6.22 and
Definition 6.24/Theorem 6.25.
This paragraph supersedes older Lemma 6.20 "next manual packet" language below.

Latest proof target after the standard-cut scalar containment,
determinant-ratio, coordinate-free half-space, affine-transport certificate,
matrix normalization, PosDef cancellation, pullback-certificate, current
`Σ⁻¹` identification, and displayed center-update packets:
Chapter 6 nonsmooth
convex optimization.  Theorems 6.14
and 6.16 are now compiled in finite-valued source-facing supplied-interface
forms, `CuttingPlane.lean` now compiles the supplied-interface algebraic spine
plus source-shaped CoGM Theorem 6.19 wrapper
`chewi619_gap_le_display_rate_of_scaled_candidates`, and `Ellipsoid.lean` now
compiles the supplied-interface Lemma 6.20 trajectory/rate layer plus the
normalized central-cut scalar containment, determinant-ratio cores, and
coordinate-free normalized half-space containment, and
`chewi620_affineTransport_stepCertificate_of_quadratic`, plus matrix quadratic,
positive-denominator, normalized-cut algebra helpers for `Matrix.toEuclideanLin`,
the raw symmetric square-root adjoint/cut bridge, the matrix
invertibility/cancellation packet, the pullback-standard-cut certificate
`chewi620_sqrtAffineTransport_stepCertificate_of_pullback`, the current
`Σ⁻¹` ellipsoid identification, and the displayed-center certificate
`chewi620_sqrtAffineTransport_stepCertificate_of_displayedCurrentAndCenter`.
The displayed determinant formula is now in the source volume-ratio shape
`(chewi620DisplayedShapeUpdate d Sigma p).det / Sigma.det =
ellipsoidVolumeRatio d ^ 2`, with determinant positivity/nonzero/unit facts and
the scalar bridge
`chewi620_volume_le_of_sq_le_displayedShapeUpdate_det_ratio` converting a
squared determinant-volume bound into the certificate's `hvolume` hypothesis.
The determinant-unit inverse-shape reduction now also compiles:
`matrixInvShape_mul_inv_cancel_of_det_isUnit`,
`matrixInvShape_inv_mul_cancel_of_det_isUnit`,
`matrixInvShape_eq_inv_of_left_inverse`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_left_inverse`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_left_inverse`.
The normalized algebra core now compiles as
`chewi620StandardCutForwardShape` and
`chewi620_standardCutForwardShape_left_inverse`, proving that the normalized
forward-shape update cancels `chewi620StandardCutInvShape`.
The transport-reduction layer now also compiles:
`chewi620_displayedShapeUpdate_left_inverse_of_standardCutForward_transport`,
`chewi620_pullbackStandardCutInvShape_eq_displayedShapeUpdate_inv_of_forwardShape_transport`,
and
`chewi620_ellipsoidSet_pullbackStandardCut_eq_displayedShapeUpdate_inv_of_forwardShape_transport`.
The next manual goal packet should instantiate mathlib volume-scaling APIs for
the actual ellipsoid affine image using `Measure.addHaar_image_linearMap` /
`Measure.addHaar_preimage_linearEquiv`, translation invariance, and
`LinearMap.det_toLpLin` for `Matrix.toEuclideanLin`; the raw `Real.map_*`
pushforward lemmas scale by `|det|⁻¹`, while set images need the `|det|`
addHaar-image route.  In parallel, prove the concrete matrix transport identity
`matrixInvShape (chewi620DisplayedShapeUpdate d Sigma p) (T.symm x) =
T (chewi620StandardCutForwardShape d u x)` for the normalized cut direction;
the compiled transport and left-inverse reductions then give Chewi's
`Σ_{n+1}^{-1}` set replacement.  If either proof balloons, record the exact
missing matrix/measure API and prove the smallest affine transport,
matrix-coordinate, inverse-shape, or volume-scaling certificate that removes it.

This paragraph overrides any older "next target" language in historical
Chapter 4/5 notes below: the current manual `/goal` target is the rest of
Chapter 6 main text (6.18-6.25), then Chapters 7-13 by theorem-sized module
packets.  Do not reroute to source-report packaging, Theorem 5.4/5.8/5.9/5.10,
or Chapter 4 geometric-lower-bound polishing unless a current Chapter 6 proof
explicitly needs that dependency.

Stable background: the first `ProjectedSubgradient.lean` packet proves the
supplied-interface Theorem 6.14 average-gap bound, including source-shaped
projection characterization, projection non-expansiveness, PSD trajectory,
Jensen averaging, one-step squared-distance recurrence, and finite telescoping.
The CG modules
`StatInference/Optimization/ConjugateGradient.lean` and
`StatInference/Optimization/Theorem54.lean` are stable background: they add
`cgAffineSpan`, the affine-gradient-trial membership lemma, competitive-step
extraction from an affine `IsMinOn`, monotone-gap and first-order/orthogonality
bridges, the source-facing wrappers
`chewi54_accelerated_bound_of_cgAffineMinimizer` and
`chewi54_accelerated_bound_of_cgAffineMinimizer_univ`, plus displayed-CG
bridges for point-update search-span membership, residual-gradient membership,
displacement orthogonality, pairwise gradient orthogonality, and
`IsCGDisplayedIteration.chewi54_accelerated_bound_of_cgAffineMinimizer`; the
affine minimization property is now derived as
`IsCGDisplayedIteration.isMinOn_cgAffineSpan_of_point_updates`, giving
`IsCGDisplayedIteration.chewi54_accelerated_bound_of_point_updates`.
Newest Theorem 5.4 endpoint packaging now compiles in
`StatInference/Optimization/Theorem54.lean`: `chewi54_halvingBlocks_gap_le`
unrolls a block-halving recurrence, `chewi54_halvingBlocks_gap_le_of_power_bound`
packages an abstract accuracy gate, `chewi54_half_pow_mul_le_eps_of_log_ratio_le`
formalizes the log-ratio scalar calculation, and
`chewi54_halvingBlocks_gap_le_of_log_ratio_le` gives the source-facing
logarithmic endpoint.  The newest block bridge adds `chewi54BlockSize`,
`chewi54_four_sqrt_le_blockSize`,
`chewi54_block_halving_of_accelerated_block_bound`,
`chewi54_block_halving_recurrence_of_accelerated_block_bounds`,
`chewi54_log_rate_of_accelerated_block_bounds`, and
`chewi54_log_rate_of_accelerated_block_bounds_blockSize`: accelerated bounds
on each integer block of length at least `4 * sqrt(beta / alpha)` now feed the
compiled logarithmic endpoint.  Search-first reuse: Chapter 3's
`scalarRecurrence_le_pow`, Chapter 4's geometric/log analogues, mathlib
`Nat.le_ceil`, and mathlib `Real.log_pow`, `Real.log_mul`, `Real.log_div`,
`Real.log_inv`, and `Real.log_le_log_iff`.  Next aggressive step: derive the
per-block accelerated bound from a restarted/displayed CG interface, then
state the full source Theorem 5.4 logarithmic rate, or source-audit the
polynomial/Chebyshev alternative before Theorem 5.8.  The shifted
affine-minimizer restart interface now also compiles:
`chewi54_block_bound_of_cgAffineMinimizer_blocks`,
`chewi54_log_rate_of_cgAffineMinimizer_blocks`, and
`chewi54_log_rate_of_cgAffineMinimizer_blocks_blockSize`.  The displayed block
specialization now compiles as `chewi54_log_rate_of_displayed_cg_blocks` and
`chewi54_log_rate_of_displayed_cg_blocks_blockSize`, discharging the per-block
span, residual-gradient, orthogonality, and affine-minimizer assumptions from
`IsCGDisplayedIteration`-style block records.  Next target: source-audit the
exact Theorem 5.4 theorem statement/report path, then either package the final
named source theorem around the displayed block endpoint or move to the
polynomial/Chebyshev route and Theorem 5.8.  Do not replay Chapter 3 GD
convergence or Chapter 4 hard-instance setup unless a Chapter 5 proof
explicitly depends on one of those compiled declarations.

Recently completed Chapter 4 context: The
`StatInference/Optimization/Reductions.lean` module compiles the quadratic
regularization spine: regularized objective/gradient definitions, first-order
strong-convexity and smoothness parameter shifts, the source value chain
`f(x) <= f_delta(x) <= min f_delta + eps / 2`, the epsilon-gap corollary once
the regularization penalty is bounded, the radius-to-penalty bound, the
regularized-minimizer distance estimate, `beta + delta <= 2 beta`, the
condition-number bound `(beta + delta) / delta <= 2 * beta * R^2 / eps`, and
source-shaped reduction packages using either `f xStar <= f xDelta` or
`IsMinOn f Set.univ xStar`.  Do not redo this or the Theorem 3.4/Chapter 4
lower-bound foundation work.  `StatInference/Optimization/Theorem45.lean` now
also compiles the concrete regularized lower-bound chain objective, its
`alpha`-strong-convexity and `beta`-smoothness interfaces, and the prefix
support invariant for gradient-span trajectories.  It also compiles the
tail-energy witness theorem: a zero-gradient minimizer candidate with a
nontrivial tail outside `V_N` gives a certified gap for any gradient-span
iterate.  The latest reduction layer also instantiates Lemma 4.2 on the
concrete lower-bound chain, including the source radius `‖x_*‖ <= sqrt d`,
the condition-number package, and the value-reduction package with
`R = sqrt d`.  The next aggressive step is now the geometric/logarithmic rate
assembly: either close the direct Exercise 4.2 tail lower bound for the
regularized chain or package the Lemma 4.2 + Theorem 4.4 reduction into a
source-shaped Theorem 4.5 statement.  The newest obstruction layer proves that
a regularized gradient-span run reaching `eps / 2` near the regularized
minimum by time `N` forces the convex lower-bound quantity to be at most
`eps`; in the source dimension `d = 2N + 1`, this gives
`beta / (16 * (N + 1)) <= eps`, plus a contradiction wrapper for `eps` below
that threshold.
The newest iteration-count wrappers turn this into
`beta / (16 * eps) - 1 <= N` and a contradiction form for
`N < beta / (16 * eps) - 1`.
The newest source-shaped wrappers now give the same conclusion for any rate,
and in particular for `c * sqrt(kappa) * log(ratio)`, once the comparison with
`beta / (16 * eps) - 1` is supplied.  The direct Exercise 4.2 route now also
has the verified geometric factor and tail-to-gap obstruction:
`chewi45GeometricRatio`, its basic order/power lemmas, and
`chewi45_gap_ge_geometricRatio_tail_of_gradientSpanTrajectory` plus
`chewi45_not_near_min_of_geometricRatio_tail_lower_bound`.  The newest
geometric-candidate layer adds the quadratic/root recurrence for
`chewi45GeometricRatio`, the finite vector
`strongLowerBoundGeometricCandidate`, and the interior zero-gradient theorem
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_interior`.
The latest boundary layer upgrades this to all nonterminal coordinates and
computes the exact terminal residual via
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_first`,
`strongLowerBoundChainGradient_geometricCandidate_eq_zero_of_not_last`, and
`strongLowerBoundChainGradient_geometricCandidate_eq_terminal_residual`.
The finite-correction layer now compiles as
`chewi45GeometricRatio_finiteDenominator_pos`,
`chewi45GeometricRatio_finiteDenominator_ne_zero`,
`strongLowerBoundFiniteGeometricNode`,
`strongLowerBoundFiniteGeometricNode_zero`,
`strongLowerBoundFiniteGeometricNode_last`,
`strongLowerBoundFiniteGeometricCandidate`,
`strongLowerBoundFiniteGeometricCandidate_apply`,
`strongLowerBoundFiniteGeometricNode_recurrence`,
`strongLowerBoundChainGradient_finiteGeometricCandidate_eq_zero`,
`chewi45_gap_ge_geometricRatio_tail_of_finiteGeometricCandidate`, and
`chewi45_not_near_min_of_finiteGeometricCandidate_tail_lower_bound`.  This
settles the finite terminal-residual blocker; the next direct Theorem 4.5
target is the corrected-candidate tail comparison and logarithmic
iteration-count conversion.  The latest tail-scaffold pass adds
`coordinate_sq_le_coordinateTailSq`, `coordinateTailSq_anti_mono`,
`coordinateTailSq_zero_eq_norm_sq`, `norm_zero_sub_sq_eq_coordinateTailSq_zero`,
and
`chewi45_gap_ge_geometricRatio_tail_of_finiteGeometricCandidate_tailSq`.
Route correction: the source Exercise 4.2 is infinite-dimensional, while the
finite corrected truncation needs additional dimension/slack analysis for the
literal `q^(2N)` tail factor.
The newest finite-boundary comparison layer adds
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
are the next reusable tools for either a finite slack lower bound or the
transition to the exact infinite-chain model.
The concrete finite-boundary gap obstruction also now compiles:
`chewi45_gap_ge_geometric_boundary_of_finiteGeometricCandidate` and
`chewi45_not_near_min_of_finiteGeometricCandidate_boundary_lower_bound`.
This removes the supplied tail-comparison hypothesis for a finite slack
statement; next is the log/slack comparison or the exact `l^2` Exercise 4.2
model.
The finite slack/log stepping stone now also compiles:
`chewi45_gap_ge_geometric_boundary_floor_of_finiteGeometricCandidate`,
`chewi45_gap_ge_geometric_half_boundary_of_finiteGeometricCandidate`, and
`chewi45_not_near_min_of_finiteGeometricCandidate_half_boundary_lower_bound`.
The finite route is now narrowed to the dimension condition
`q^(2*d+2-2*(N+1)) <= 1/2` plus the final logarithmic iteration conversion.
The newest exponent-lifting pass adds
`chewi45GeometricRatio_pow_le_half_of_exponent_le`,
`chewi45_half_boundary_condition_of_exponent_le`, and
`chewi45_gap_ge_geometric_half_boundary_of_finiteGeometricCandidate_of_exponent_le`,
so it is enough to prove `q^M <= 1/2` for any smaller available exponent.
The newest near-minimality pass adds
`chewi45_not_near_min_of_finiteGeometricCandidate_half_boundary_lower_bound_of_exponent_le`
and
`chewi45_geometric_half_boundary_lower_bound_le_eps_of_near_min_of_exponent_le`,
so the finite route now has a direct `eps` lower-bound input for the final
iteration/log conversion.
The newest log bridge adds
`chewi45GeometricRatio_pow_le_half_of_nat_mul_log_le`,
`chewi45_half_boundary_condition_of_log_exponent_le`, and
`chewi45_geometric_half_boundary_lower_bound_le_eps_of_near_min_of_log_exponent_le`.
The finite route can now use `(M : Real) * log q <= log (1/2)` directly.
The newest scalar/rate pass adds
`chewi45_rate_le_iterations_of_log_chain`,
`chewi45_iteration_count_ge_rate_of_geometric_eps_lower_bound`,
`chewi45_iteration_count_ge_rate_of_finiteGeometricCandidate_log_near_min`,
and `chewi45_not_finiteGeometricCandidate_near_min_of_log_rate_lt`.  This
closes the algebraic conversion from the finite geometric near-min lower bound
to an iteration lower bound once concrete source choices for `M`, `d`, and
`rate` discharge the two log comparisons.
The newest quotient-rate pass adds
`chewi45_logQuotientRate_log_comparison`,
`chewi45_iteration_count_ge_logQuotientRate_of_geometric_eps_lower_bound`,
`chewi45_iteration_count_ge_logQuotientRate_of_finiteGeometricCandidate_log_near_min`,
and `chewi45_not_finiteGeometricCandidate_near_min_of_logQuotientRate_lt`,
removing the scalar `hrate_log` assumption for the canonical quotient rate.
The newest source-dimension pass adds
`chewi45_two_mul_add_one_boundary_exponent_eq`,
`chewi45_iteration_count_ge_logQuotientRate_two_mul_add_one`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_logQuotientRate_lt_two_mul_add_one`,
specializing the finite direct route to `d = 2N+1` and `M = 2(N+1)`.
The newest half-boundary rate pass adds
`chewi45_log_half_bound_of_logQuotient_iteration_lower_bound` and
`chewi45_not_finiteGeometricCandidate_near_min_of_two_logQuotient_rates`,
so the strongest direct finite obstruction is now phrased by two explicit
quotient-rate inequalities on `N`.
The newest condition-number pass adds
`chewi45GeometricRatio_sub_one`, `chewi45GeometricRatio_inv_sub_one`,
`chewi45GeometricRatio_log_le_neg_two_div_sqrt_add_one`,
`chewi45GeometricRatio_neg_two_div_sqrt_sub_one_le_log`,
`chewi45_logQuotientRate_le_sqrt_add_one_bound`,
`chewi45_sqrt_sub_one_bound_le_logQuotientRate`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_conditionNumber_rates`,
moving the direct finite obstruction from raw quotient rates to
`sqrt(kappa) +/- 1` rate gates.
The newest constant-cleanup pass adds
`chewi45_two_le_sqrt_of_four_le`,
`chewi45_sqrt_add_one_le_three_halves_sqrt_of_four_le`,
`chewi45_half_sqrt_le_sqrt_sub_one_of_four_le`,
`chewi45_sqrt_add_one_rate_le_three_halves_sqrt_rate`,
`chewi45_half_sqrt_rate_le_sqrt_sub_one_rate`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_sqrtKappa_rates`,
so the direct finite obstruction now has pure `sqrt(kappa)` rate gates when
`4 <= kappa`.
The newest positive-log pass adds `chewi45_log_half_eq_neg_log_two`,
`chewi45_neg_log_eps_div_alpha_eighth_eq_log_alpha_eighth_div_eps`, and
`chewi45_not_finiteGeometricCandidate_near_min_of_sqrtKappa_positiveLog_rates`,
giving the direct finite obstruction in `log 2` and
`log ((alpha/8)/eps)` form.
The latest source-constant window pass adds
`chewi45_not_finiteGeometricCandidate_near_min_of_source_positiveLog_window`,
with the gates multiplied out as `3 * sqrt(kappa) * log 2 / 8 - 1 <= N` and
`N < sqrt(kappa) * log ((alpha/8)/eps) / 8 - 1`.
The source-window gate comparison layer now adds
`chewi45_source_positiveLog_half_gate_le_eps_gate`,
`chewi45_source_positiveLog_half_gate_lt_eps_gate_of_kappa_pos`, and
`chewi45_source_positiveLog_half_gate_lt_eps_gate_of_four_le`, isolating the
large-log condition needed for a nonempty Theorem 4.5 source window.
The newest lower-bound form adds
`chewi45_source_positiveLog_rate_le_of_finiteGeometricCandidate_near_min`,
turning the source-window contradiction into the direct conclusion
`sqrt(kappa) * log ((alpha/8)/eps) / 8 - 1 <= N`.
The burn-in-or-rate wrapper
`chewi45_source_positiveLog_burnin_or_rate_le_of_finiteGeometricCandidate_near_min`
now removes the upfront half-gate assumption by proving the disjunction:
either `N` is below the finite half-boundary gate, or the source rate lower
bound holds.

Exercise statement/proof formalizations belong in
`StatInference/Optimization/Exercises.lean`.  The main theorem lane remains
the priority, but cheap or reusable exercise derivations may be added there
opportunistically when they help theorem progress.

Current compiled Chapter 3 spine:

1. Lemma 3.5 discrete Gronwall: zero-based and source-shaped one-based forms.
2. Lemma 3.1 descent lemma from `SmoothWithGradientOn`, including
   source-shaped `h <= 1 / beta` wrapper.
3. Theorem 3.3 contraction layer, including first-order lower-model,
   source-step co-coercivity wrappers, and whole-space Exercise 3.1
   co-coercivity discharge in `Exercises.lean`.
4. Theorem 3.4 function-value convergence supplied-interface assembly,
   recurrence bridge, finite denominator bounds, positive-`alpha` closed
   denominator, and `alpha = 0` limiting wrapper.
5. Theorem 3.6 PL convergence layer.
6. Theorem 3.7 gradient-norm convergence layer in existential and finite-min
   display forms.

Next high-value task: finish the direct Exercise 4.2 minimizer geometry in the
true `ℓ²` model.  The first infinite-chain substrate now compiles in
`StatInference/Optimization/Exercises.lean`:
`exercise42_geometric_l2_term_eq`, `exercise42_geometric_memℓp_two`,
`exercise42InfiniteGeometric`, `exercise42InfiniteGeometric_apply`, and
`exercise42InfiniteGeometric_norm_sq` prove the nonnegative geometric profile
`n |-> q^n` is an `ell^2` element and has squared norm `(1 - q^2)^{-1}` for
`0 <= q < 1`, reusing mathlib `lp`, `Memℓp`, `lp.norm_rpow_eq_tsum`,
`summable_geometric_of_lt_one`, and `tsum_geometric_of_lt_one`.  The exact
infinite tail layer also compiles as `exercise42InfiniteTailSq`,
`exercise42_geometric_l2_tail_term_eq`,
`exercise42InfiniteGeometric_tailSq_eq`,
`exercise42InfiniteGeometric_tailSq_eq_pow_mul_norm_sq`,
`exercise42InfiniteGeometric_tailSq_eq_pow_mul_zero_dist_sq`, and
`exercise42InfiniteGeometric_pow_mul_zero_dist_sq_le_tailSq`, proving the
source-shaped `(q^2)^N` tail-times-zero-distance identity by reusing
`tsum_mul_left` and `tsum_congr`.  The shifted hard-chain minimizer and
infinite gradient layer also compiles: `exercise42InfiniteGeometricMinimizer`,
`exercise42InfiniteGeometricMinimizer_apply`,
`exercise42InfiniteGeometricMinimizer_norm_sq`,
`exercise42InfiniteGeometricMinimizer_tailSq_eq`,
`exercise42InfiniteGeometricMinimizer_tailSq_eq_pow_mul_zero_dist_sq`,
`exercise42InfiniteChainGradient`,
`exercise42InfiniteChainGradient_geometricMinimizer_eq_zero`, and
`exercise42InfiniteChainGradient_geometricMinimizer_eq_zero_of_kappa`.  This
is the exact no-terminal-residual version of the finite corrected-chain
algebra, reusing `lp.coeFn_smul`, `lp.norm_const_smul`, and the compiled
`chewi45GeometricRatio_pow_recurrence`.  The supplied infinite tail-to-gap
interface now compiles as `exercise42InfinitePrefixSupported`,
`exercise42InfinitePrefixSubmodule`,
`mem_exercise42InfinitePrefixSubmodule_iff`,
`exercise42InfinitePrefixSubmodule_mono`,
`gradientSpanSubmodule_le_exercise42InfinitePrefixSubmodule`,
`gradientSpanTrajectory_mem_exercise42InfinitePrefixSubmodule_of_grad_mem_next`,
`exercise42InfiniteTailSq_le_sqdist_of_prefixSupported`,
`exercise42Infinite_gap_ge_tailSq_of_lowerModel`, and
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_lowerModel`,
using `lp.norm_rpow_eq_tsum`, `Summable.sum_add_tsum_nat_add`, and
nonnegative finite-sum decomposition to get the exact
`(alpha/2) * (q^2)^N * ‖0 - x_*‖^2` obstruction from a supplied lower model.
The gradient-span support induction now compiles for the supplied infinite
hard-chain gradient oracle via
`exercise42InfiniteChainGradient_mem_prefixSubmodule_of_apply`,
`exercise42InfiniteGradientSpanTrajectory_mem_prefixSubmodule_of_apply`,
`exercise42InfiniteGradientSpanTrajectory_prefixSupported_of_apply`, and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_lowerModel`.
The first-order lower-model bridge now compiles too:
`exercise42InfiniteGeometricMinimizer_grad_eq_zero_of_apply`,
`exercise42InfiniteGeometricMinimizer_lowerModel_of_firstOrder`,
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_firstOrder`,
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_firstOrder`,
and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometricRatio_tail_of_firstOrder`
remove the ad hoc `hlower` premise once `FirstOrderStrongConvexOn` and the
coordinate gradient formula are available.
The concrete source objective layer now compiles:
`exercise42InfiniteChainEdgeSq_summable`,
`exercise42InfiniteChainObjective`,
`exercise42InfiniteChainObjective_apply`, and
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder`.
The exact infinite log bridge now compiles as
`exercise42_iteration_count_ge_logQuotientRate_of_sq_geometric_eps_lower_bound`
and
`exercise42InfiniteChainObjective_logQuotientRate_le_of_firstOrder_near_min`.
The newest concrete-gradient pass proves that the coordinate hard-chain
gradient is itself an `ell^2` oracle:
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
This removes the supplied coordinate-gradient formula from the direct
infinite Exercise 4.2 route.  The newest regularization bridge adds
`exercise42InfiniteBaseChainObjective`,
`exercise42InfiniteBaseChainGradient`,
`exercise42InfiniteBaseChainGradientLp`,
`exercise42InfiniteBaseChainGradientLp_apply`,
`exercise42InfiniteChainObjective_eq_quadraticRegularizedAround`,
`exercise42InfiniteChainGradientLp_eq_regularizedGradient`, and
`exercise42InfiniteChainObjective_firstOrderStrongConvexOn_of_base`.  Thus the
remaining concrete first-order package is narrowed to the convex base chain
lower model at parameter `0`; the quadratic regularizer is handled by the
existing Lemma 4.2 reduction API.  The newest edge substrate adds
`exercise42InfiniteBaseChainEdge`,
`exercise42InfiniteBaseChainDirectionEdge`,
`exercise42InfiniteBaseChainEdgeSq_summable`,
`exercise42InfiniteBaseChainDirectionEdgeSq_summable`,
`exercise42InfiniteBaseChainEdgeLp`,
`exercise42InfiniteBaseChainDirectionEdgeLp`,
`exercise42InfiniteBaseChainEdge_mul_direction_summable`,
`exercise42InfiniteBaseChainEdge_add_direction`, and
`exercise42InfiniteBaseChainObjective_eq_edge_tsum`, setting up the infinite
analogue of the finite edge-expansion proof.  The newest expansion pass adds
`exercise42InfiniteBaseChainObjective_add_direction`,
`exercise42InfiniteBaseChainObjective_add_direction_ge_edge_linear`, and
`exercise42InfiniteBaseChainObjective_ge_edge_linear`.  The summation-by-parts
and concrete first-order pass now adds
`exercise42InfiniteBaseChain_edge_direction_sum_range_eq_core_sum_sub_boundary`,
`exercise42InfiniteBaseChain_edge_direction_tsum_eq_core_tsum`,
`inner_exercise42InfiniteBaseChainGradientLp_eq_edgeDirection_tsum`,
`exercise42InfiniteBaseChainObjective_firstOrderConvex`, and
`exercise42InfiniteChainObjective_firstOrderStrongConvexOn`; the final
no-supplied-interface infinite Exercise 4.2 wrappers now compile as
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_concreteGradient`
and
`exercise42InfiniteChainObjective_logQuotientRate_le_near_min_concreteGradient`.
Search-first result: reused mathlib `lp.inner_eq_tsum`, `lp.summable_inner`,
`Summable.tendsto_atTop_zero`, `tendsto_add_atTop_nat`, and the finite
`LowerBounds.lean` summation-by-parts pattern.  The newest source-rate pass
adds
`exercise42InfiniteChainObjective_sqrtSubOneLogRate_le_near_min_concreteGradient`
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient`,
reusing the existing Chewi 4.5 log-comparison lemmas to convert the exact
log quotient into the `√κ` lower-bound shape.  The small-accuracy side
condition is now discharged by `exercise42InfiniteGeometricInitialScale_pos`
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_concreteGradient_of_eps_le_initialScale`,
which convert `eps <= (alpha/2) * ‖x_0 - x_*‖^2` into the required
log-nonpositive hypothesis.  The literal source exponent display now compiles
as
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_concreteGradient`,
rewriting `(q^2)^N` to `q^(2N)`.  The newest wrapper
`exercise42InfiniteGeometricMinimizer_isMinOn_concreteGradient` certifies the
geometric profile as a concrete global minimizer, and
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_minValue_concreteGradient`
renames the right side to the textbook `f(x_N)-f_*` shape through an `hfstar`
identification.  The public rate wrapper
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_fstar_concreteGradient`
now accepts the source-shaped hypothesis `f(x_N) <= f_* + eps` and returns the
compiled `sqrt(kappa)` iteration lower bound.  The newest opt-value pass adds
`exercise42InfiniteChainObjectiveMinValue`,
`exercise42InfiniteChainObjectiveMinValue_le_concreteGradient`,
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_pow_two_mul_optValue_concreteGradient`,
and
`exercise42InfiniteChainObjective_sqrtKappaLogRate_le_near_min_optValue_concreteGradient`,
so the public Exercise 4.2 route no longer exposes an `hfstar` equality
hypothesis.  The newest Theorem 4.5-facing package pass adds
`exercise42InfiniteInitialScale`, `exercise42InfiniteInitialScale_pos`, and
`exercise42InfiniteChainObjective_theorem45_hard_instance_package`; the last
one bundles first-order strong convexity, smoothness, gradient-span prefix
support, the concrete geometric minimizer, the named optimum-value lower
bound, and the opt-value `sqrt(kappa)` rate obstruction in one statement.
Search-first result: reused local `IsMinOn`/opt-value/rate wrappers and
mathlib `IsMinOn` support.  The positive-log source display is now also closed
by `exercise42InfiniteGeometricMinimizer_proof_irrel` and
`exercise42InfiniteChainObjective_positiveLogRate_le_near_min_optValue_concreteGradient`,
which rewrite the internal `-log(eps/C)` form into `log(C/eps)` for the named
initial scale.  The next target is factoring the infinite Exercise 4.2
substrate into a pre-`Theorem45` module if direct Theorem 4.5 import is needed,
or using this package immediately as the source-facing hard instance.  The
newest
smoothness bridge adds
`exercise42InfiniteBaseChainDirectionEnergy_le_four_norm_sq`,
`exercise42InfiniteBaseChainObjective_add_direction_inner`,
`exercise42InfiniteBaseChainObjective_add_direction_le_smooth`,
`exercise42InfiniteBaseChainObjective_le_smooth`, and
`exercise42InfiniteChainObjective_le_smooth`; the concrete infinite hard-chain
now has the compiled two-point `beta`-smooth upper inequality.  The continuity
blocker is also closed by `continuous_exercise42InfiniteBaseChainObjective`
and `continuous_exercise42InfiniteChainObjective`, yielding the full supplied
interfaces
`exercise42InfiniteBaseChainObjective_smoothWithGradientOn` and
`exercise42InfiniteChainObjective_smoothWithGradientOn`.  In
parallel, specialize the remaining reduction-route comparison
`c * sqrt(kappa) * log(ratio) <= beta / (16 * eps) - 1` from concrete
condition-number/log hypotheses when it gives a faster Theorem 4.5 assembly.
Search mathlib/local APIs for `Real.log` monotonicity, `Real.exp` inversions,
sqrt/order facts, finite geometric sums, and asymptotic iteration-count
wrappers before adding any local complexity primitive.  Keep any exercise work opportunistic and centralized in
`StatInference/Optimization/Exercises.lean`; the main theorem lane remains the
priority.
