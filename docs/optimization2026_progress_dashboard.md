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
  `Live Goal Prompt V82` near the top of
  `docs/optimization2026_current_blocker_primitive_plan.md` as the live
  replacement goal prompt.  Older long prompts in that file are archived
  history and must not override the current Chapter 13/Appendix A frontier.
- Collaboration policy: for broad future packets, use isolated `git worktree`
  checkouts per book/lane when several local agents are active, then merge only
  scoped verified work back to shared `main`.
- Efficiency protocol: the Optimization manual goal now uses theorem-sized
  packets, not one-wrapper loops.  Route from the top of
  `docs/optimization2026_current_blocker_primitive_plan.md`; reuse cached
  mathlib/local search notes before repeating broad searches; develop with
  focused `lake env lean` checks; promote with targeted
  `lake build StatInference.Optimization.<Module>`; root-build only after
  root-import or broad cross-module changes; batch final docs, scans, rebase,
  commit, and push once per verified packet.
- Meta-methodology protocol: every theorem packet must update the live docs
  with workflow learning, not just theorem names.  Record what accelerated the
  proof, what caused friction or redundant work, which searches should not be
  repeated, and how the next goal prompt should be shorter and more accurate.
  This Optimization lane is also the live playbook for future statistical
  theory formalization in Lean.
- Current proof worktree: use `/private/tmp/chewi-dual-seminorm` for the
  active Optimization packet so unrelated textbook agents can keep their own
  local state without `.lake` or working-tree interference.
  If that temp worktree disappears, recreate it and run `lake exe cache get`
  before focused builds; otherwise the first build can waste time rebuilding
  mathlib locally.
- Latest Theorem 13.1 frontier: V82 compiles the finite-row central-path
  Newton-decrement recurrence and trajectory wrapper.  New declarations are
  `chewi1316RangeCentralPathValue_newtonDecrement_step_le_of_decrement_lt_one`
  and `chewi1316RangeCentralPathValue_newtonDecrement_succ_le_of_trajectory`
  in `StatInference/Optimization/Theorem131Gradient.lean`.  Search-first reuse
  came from
  `chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment`,
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`,
  `chewi1316RangeCentralPathValue_gradient_hasFDerivAt`, and
  `newton_linear_of_hessian_right_inverse`.  Next blocker: turn the recurrence
  `λ_{k+1} ≤ λ_k^2/(1-λ_k)^2` into trajectory-level decrement control and
  summable budgets, preferably using existing `chewi1316_mainStage_*` scalar
  lemmas.  Methodology note: specialize strong local-norm source theorems
  before attempting bespoke Euclidean Hessian Lipschitz proofs.
- V81 frontier cache: V81 compiles the lower-Hessian supplier and recurrence
  wrapper for the finite-row central-path trajectory.  New declarations are
  `chewi1316RangeCentralPathValue_hlower_of_trajectory_decrementBudget` and
  `chewi1316RangeCentralPathValue_local_quadratic_recurrence_of_trajectory_decrementBudget_lower`
  in `StatInference/Optimization/Theorem131Gradient.lean`.  Search-first reuse
  came from V80's source-radius and Hessian-lower bridges.
- V80 frontier cache: V80 compiles the first quantitative local-norm bridge
  for the central-path recurrence.  New declarations are
  `hessian_lower_half_of_sourceRadius_half_and_source_lower_two` in
  `StatInference/Optimization/InteriorPoint.lean`, plus
  `chewi1316RangeCentralPathValue_sourceRadiusHalf_of_trajectory_decrementBudget`
  and
  `chewi1316RangeCentralPathValue_hessian_lower_half_of_sourceRadiusHalf` in
  `StatInference/Optimization/Theorem131Gradient.lean`.  Search-first reuse
  came from
  `sourceRadius_successor_half_of_newtonSteps_currentLocalNorm_budget_hessian_pos`,
  `localNorm_source_le_two_current_of_sourceRadius_half`, and
  `hessianQuadraticLower_of_mul_le_localNorm`.
- V79 frontier cache: V79 compiles finite-row central-path Newton trajectory
  and invariant wrappers in
  `StatInference/Optimization/Theorem131Gradient.lean`.  New declarations are
  `IsChewi1316RangeCentralPathNewtonTrajectory`,
  `chewi1316RangeCentralPathValue_iterates_mem_of_decrement_lt_one`, and
  `chewi1316RangeCentralPathValue_local_quadratic_recurrence_of_trajectory_decrement`.
  Search-first reuse came from
  `chewi1314_polytopeSlackNegLog_range_newtonStep_mem_of_decrement_lt_one`,
  with V78's convex segment recurrence underneath.
- V78 frontier cache: V78 compiles finite-row central-path wrappers that
  discharge segment feasibility from convexity of the translated
  positive-orthant range set in
  `StatInference/Optimization/Theorem131Gradient.lean`.  New declarations are
  `chewi1316RangeCentralPathValue_feasible_segment_mem`,
  `chewi1316RangeCentralPathValue_local_quadratic_step_of_gradient_ftc_feasible_segment`,
  `chewi1316RangeCentralPathValue_local_quadratic_step_and_half_of_gradient_ftc_feasible_segment`,
  and
  `chewi1316RangeCentralPathValue_local_quadratic_recurrence_of_gradient_ftc_feasible_segment`.
  Search-first reuse came from `convex_barrierAffineRangeSet`,
  `convex_positiveOrthant`, and `hessianSegmentPoint_mem_of_convex`.
- V77 frontier cache: V77 compiles the range-space sequence recurrence layer
  for the finite-row central-path objective.  New declarations are
  `chewi131_local_quadratic_recurrence_of_conditional_step`,
  `chewi131_local_quadratic_recurrence_of_taylor_bound_clm_of_hessian_lower_half`,
  `chewi131_local_quadratic_recurrence_of_conditional_taylor_bound_clm_of_hessian_lower_half`,
  and `chewi1316RangeCentralPathValue_local_quadratic_recurrence_of_gradient_ftc`.
  Search-first reuse came from the existing matrix recurrence induction in
  `Theorem131.lean`, but V77 extracts the induction into a low-assumption
  conditional-step scaffold and specializes it to the central-path value.
- V76 frontier cache: V76 compiles the CLM/range-space inverse-norm and local
  quadratic Newton step layer for the finite-row central-path objective.  New
  declarations are
  `chewi131_inverse_clm_opNorm_le_two_div_alpha_of_hessian_lower_half`,
  `chewi131_local_quadratic_step_of_taylor_bound_clm`,
  `chewi131_local_quadratic_step_of_taylor_bound_clm_of_hessian_lower_half`,
  `chewi131_local_quadratic_step_and_half_of_taylor_bound_clm_of_hessian_lower_half`,
  `chewi1316RangeCentralPathValue_local_quadratic_step_of_gradient_ftc`, and
  `chewi1316RangeCentralPathValue_local_quadratic_step_and_half_of_gradient_ftc`.
  Search-first reuse came from Appendix A's
  `continuousLinearMap_opNorm_right_inverse_le_of_inner_lower`, V75's
  central-path Taylor bound, and
  `chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse`.
- V75 frontier cache: V75 compiles the CLM/range-space Taylor norm layer for
  the finite-row central-path objective.  New declarations are
  `chewi131_taylor_norm_bound_of_gradient_ftc_clm` and
  `chewi1316RangeCentralPathValue_taylor_norm_bound_of_gradient_ftc`.  The
  central-path specialization discharges stationarity, segment derivative,
  Hessian-action integrability, and inverse-Hessian left-inverse obligations
  using V74 plus `continuousLinearMap_left_inverse_of_right_inverse_finiteDim`
  and `chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse`.
- V74 frontier cache: V74 compiles the finite-row central-path
  stationarity and segment-FTC bridge in
  `StatInference/Optimization/Theorem131Gradient.lean`.  New declarations are
  `chewi1316RangeCentralPathValue_gradient_eq_zero_iff`,
  `chewi1316RangeCentralPathValue_gradient_eq_zero_of_centrality`,
  `chewi1316RangeCentralPathValue_centrality_of_gradient_eq_zero`,
  `chewi1316RangeCentralPathSelector_exists_gradient_eq_zero`,
  `chewi1316RangeCentralPathValue_gradient_segment_hasFDerivAt`, and
  `chewi1316RangeCentralPathValue_hessian_segment_intervalIntegrable`.  It
  turns Chewi centrality into the mathlib stationary hypothesis
  `gradient f x* = 0` and packages the segment `HasFDerivAt` and Hessian-action
  integrability assumptions needed by the gradient-FTC local Newton layer.
  Search-first reuse came from V73's `chewi1316RangeCentralPathValue_gradient_eq`
  and `chewi1316RangeCentralPathValue_gradient_hasFDerivAt`, local
  `Chewi1316RangeCentralPathSelector`,
  `chewi1314_polytopeSlackNegLog_rangeHess_continuousOn`, and
  `hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn`.  Next
  blocker: specialize a local Newton/FTC theorem to the finite-row central-path
  value, leaving only the real quantitative assumptions such as feasible
  segments, range inverse-Hessian/right-inverse data, Hessian Lipschitz/close
  bounds, and the Newton update.  Methodology note: once the gradient bridge is
  compiled, convert domain-specific optimality into theorem-facing FTC
  assumptions before spending proof time on quantitative Newton estimates.
- V73 frontier cache: V73 compiles the affine-range and finite-row
  central-path `gradient`/Hessian bridge in
  `StatInference/Optimization/Theorem131Gradient.lean`.  New declarations are
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eq`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_hasFDerivAt`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_fderiv_gradient_eq`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt`,
  `chewi1316RangeCentralPathValue_gradient_eq`,
  `chewi1316RangeCentralPathValue_gradient_hasFDerivAt`,
  `chewi1316RangeCentralPathValue_fderiv_gradient_eq`, and
  `chewi1316RangeCentralPathValue_gradient_eventually_hasFDerivAt`.  Search-first
  reuse came from local `barrierAffineRangeValue_positiveOrthantNegLogBarrier_hasGradientAt`,
  `barrierAffineRangeGrad_hasFDerivAt`, `positiveOrthantNegLogGrad_hasFDerivAt`,
  `barrierAffineRangeSet_positiveOrthant_mem_nhds`,
  `chewi1316RangeCentralPathValue_hasGradientAt`, and
  `centralPathGrad_hasFDerivAt`.  Next blocker: specialize the Chapter 13 local
  Newton/central-path route to this source objective, or discharge the remaining
  stationarity and quantitative Hessian assumptions using the now-available
  mathlib `gradient`/`fderiv` surface.  Methodology note: promote existing
  `HasGradientAt` certificates with `.gradient`, then transfer derivative
  models by `HasFDerivAt.congr_of_eventuallyEq` over the open feasible
  neighborhood instead of rebuilding affine calculus.
- V72 frontier cache: V72 compiles the positive-orthant Hessian matrix adapter
  and a concrete recurrence specialization in
  `StatInference/Optimization/Theorem131Gradient.lean`.  New declarations are
  `positiveOrthantNegLogHessMatrix`,
  `positiveOrthantNegLogHessMatrix_isHermitian`,
  `positiveOrthantNegLogHessMatrix_clm_eq`,
  `positiveOrthantNegLogHessCLM_continuousOn`,
  `positiveOrthantNegLogHessMatrix_continuousOn`,
  `positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix`,
  `positiveOrthantNegLogBarrier_fderiv_gradient_matrix_eq`,
  `positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt_matrix`, and
  `chewi131_local_quadratic_recurrence_positiveOrthantNegLogBarrier_of_radius`.
  Search-first reuse came from V71's positive-orthant gradient/Hessian bridge,
  V65 `chewi131MatrixCLM_isometry`, mathlib `Matrix.mulVec_diagonal`,
  `Matrix.toEuclideanLin`, and `Matrix.toLpLin_apply`.
- V71 frontier cache: V71 compiles the abstract `C^2`-to-bilinear
  Hessian bridge in `StatInference/Optimization/Theorem131Gradient.lean` and
  the concrete positive-orthant `gradient`/Hessian bridge in
  `StatInference/Optimization/InteriorPoint.lean`.  New declarations are
  `chewi131SecondFDerivBilin`,
  `chewi131SecondFDerivBilin_toContinuousLinearMap_eq_fderiv_fderiv`,
  `chewi131SecondFDerivBilin_hasFDerivAt_of_contDiffAt_two`,
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_secondFDerivBilin_of_radius`,
  `positiveOrthantNegLogBarrier_gradient_eq`,
  `positiveOrthantNegLogBarrier_gradient_hasFDerivAt`,
  `positiveOrthantNegLogBarrier_fderiv_gradient_eq`,
  `positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt`, and
  `positiveOrthantNegLogBarrier_fderiv_gradient_eventually_eq`.  Search-first
  reuse came from mathlib `ContinuousMultilinearMap.curryLeft`,
  `continuousMultilinearCurryFin1`, `iteratedFDeriv_two_apply`,
  `ContDiffAt.fderiv_right_succ`, `ContDiffAt.differentiableAt_one`,
  `HasFDerivAt.congr_of_eventuallyEq`, `HasGradientAt.gradient`, and local
  positive-orthant derivative facts.  Next blocker: prove the concrete
  Hessian matrix adapter, either
  `chewi131MatrixCLM (Hfun z) = positiveOrthantNegLogHessCLM z` for the
  positive-orthant barrier or the source bilinear equality
  `InnerProductSpace.continuousLinearMapOfBilin (chewi131SecondFDerivBilin f z)
    = chewi131MatrixCLM (Hfun z)`.
- Latest Appendix A frontier: `StatInference/Optimization/AppendixA.lean` now
  starts the source-facing matrix-order layer and is imported by
  `StatInference.lean`.  Compiled declarations
  `chewiA4_loewnerOrder_iff_quadraticForm_le` and
  `chewiA4_quadraticForm_lt_of_posDef_sub` formalize Chewi Definition A.4's
  Loewner/PSD quadratic-form equivalence and strict positive-definite
  quadratic-form direction; `chewiA5_transpose_mul_self_posSemidef` and
  `chewiA5_dotProduct_mulVec_self_eq_transpose_mul_self_quadratic` start
  Definition A.5 by proving `A^T A` is PSD and packaging
  `||A v||^2 = <v, A^T A v>` in dot-product form.  Search-first reuse came
  from mathlib
  `MatrixOrder`, `Matrix.le_iff`, PSD/PD dot-product APIs, Hermitian
  subtraction, `Matrix.sub_mulVec`, `dotProduct_sub`,
  `Matrix.posSemidef_conjTranspose_mul_self`, `Matrix.dotProduct_mulVec`, and
  `Matrix.vecMul_mulVec`; local search found matrix PSD/operator-norm
  infrastructure in `Ellipsoid.lean` and `InteriorPoint.lean` but no Appendix
  A wrappers.  The V49 layer adds
  `chewiA5_transpose_mul_self_le_scalar_one_iff_dotProduct_bound` and
  `chewiA5_unit_dotProduct_mulVec_self_le_of_transpose_mul_self_le_scalar_one`,
  proving the all-vector and unit-vector `A^T A <= C^2 I` quadratic bound
  forms.  The V50 layer imports mathlib's l2 matrix operator norm and proves
  `chewiA5_l2_opNorm_le_of_transpose_mul_self_le_scalar_one` and
  `chewiA5_transpose_mul_self_le_scalar_one_iff_l2_opNorm_le`, closing
  `A^T A <= C^2 I <-> ||A||_op <= C` for `C >= 0`.  The V51 layer adds
  `chewiA5_l2_opNorm_le_of_abs_quadraticForm_bound` and
  `chewiA5_symmetric_l2_opNorm_le_iff_neg_scalar_one_le_and_le_scalar_one`,
  proving the symmetric-square corollary
  `||A||_op <= C <-> -C I <= A <= C I` for Hermitian/symmetric real matrices
  and `C >= 0`.  Search-first reuse came from mathlib Rayleigh quotient APIs,
  `Matrix.isSymmetric_toEuclideanLin_iff`, `abs_real_inner_le_norm`, Euclidean
  coordinate rewrites, and the existing V48-V50 Loewner/operator-norm bridge.
  The V52 layer adds `chewiA1_spectral_theorem`,
  `chewiA1_mulVec_eigenvectorBasis`,
  `chewiA2_posSemidef_iff_eigenvalues_nonneg`,
  `chewiA2_posDef_iff_eigenvalues_pos`,
  `chewiA3_le_scalar_one_iff_eigenvalues_le`,
  `chewiA3_scalar_one_le_iff_le_eigenvalues`,
  `chewiA3_scalar_bounds_iff_eigenvalues_mem_Icc`,
  `chewiA3_eigenvalues_mem_Icc_iff_quadraticForm_between`,
  `chewiA5_symmetric_l2_opNorm_le_iff_abs_eigenvalues_le`, and
  `chewiA5_symmetric_l2_opNorm_eq_finset_sup_abs_eigenvalues`, closing the
  Appendix A spectral theorem wrappers, PSD/PD eigenvalue criteria, Lemma A.3
  quadratic-form interval statement, and symmetric Definition A.5
  `||A||_op = max_i |lambda_i|` display.  Search-first reuse came from mathlib
  Hermitian spectral theorem/eigenvalue APIs, CFC spectral order scalar-bound
  lemmas, `Matrix.IsHermitian.spectrum_real_eq_range_eigenvalues`, and
  `Finset.sup'`; the CStar norm/spectrum shortcut was not directly available
  for real matrices, so the finite-max proof reuses the arbitrary-`C` iff.
  The V53 layer adds
  `chewiA5_l2_opNorm_eq_sqrt_finset_sup_eigenvalues_transpose_mul_self` and
  `chewiA5_l2_opNorm_eq_sqrt_finset_sup_abs_eigenvalues_transpose_mul_self`,
  closing the rectangular Definition A.5 display
  `||A||_op = sqrt(max_i |lambda_i(A^T A)|)` on nonempty finite domains.
  Search-first reuse found mathlib singular values via `T†T`, but no direct
  rectangular matrix theorem for `A^T A` versus `A A^T`; the proof uses the
  V50 arbitrary-constant op-norm bridge, V52 scalar eigenvalue bounds, PSD
  eigenvalue nonnegativity, and `Finset.sup'`.  The V54 layer adds
  `chewiA5_charpoly_padding_transpose_mul_self_mul_self_transpose`,
  `chewiA5_charpoly_transpose_mul_self_eq_X_pow_mul_self_transpose_of_card_le`,
  `chewiA5_charpoly_mul_self_transpose_eq_X_pow_transpose_mul_self_of_card_le`,
  and `chewiA5_charpoly_transpose_mul_self_eq_mul_self_transpose_of_card_eq`,
  closing the source statement that `A^T A` and `A A^T` have the same
  eigenvalues except zero multiplicity in characteristic-polynomial padding
  form.  Search-first reuse found the exact mathlib rectangular API
  `Matrix.charpoly_mul_comm'` plus `Matrix.charpoly_mul_comm_of_le`; do not
  redo this with determinant blocks or sorted eigenvalue lists unless a later
  theorem requires root-level membership.  The V55 layer adds
  `chewiA5_mul_self_transpose_posSemidef`,
  `chewiA5_l2_opNorm_eq_sqrt_finset_sup_eigenvalues_mul_self_transpose`, and
  `chewiA5_l2_opNorm_eq_sqrt_finset_sup_abs_eigenvalues_mul_self_transpose`,
  closing the source sentence that `||A||_op` is also the square root of the
  largest absolute eigenvalue of `A A^T`.  Search-first reuse came from V53
  applied to `Aᵀ` and mathlib `Matrix.l2_opNorm_conjTranspose`.  The V56
  layer consumes the Appendix A matrix facts in Chewi Theorem 13.1's
  Hessian-perturbation step, adding
  `chewiA5_loewner_lower_of_l2_opNorm_sub_le`,
  `chewiA5_loewner_upper_of_l2_opNorm_sub_le`,
  `chewiA5_loewner_sandwich_of_l2_opNorm_sub_le`,
  `chewiA4_scalar_one_le_scalar_one_of_le`,
  `chewi131_hessian_lower_half_of_l2_opNorm_sub_le`, and
  `chewi131_hessian_lower_half_of_lipschitz_opNorm`.  Search-first reuse came
  from V51's symmetric op-norm/Loewner sandwich, mathlib `add_le_add`,
  `abel`, and `smul_le_smul_of_nonneg_right` under the `MatrixOrder` scoped
  order.  The V57 layer adds
  `chewiA5_posDef_of_pos_scalar_one_le`,
  `chewiA5_symmetric_l2_opNorm_le_of_nonneg_le_scalar_one`,
  `chewi131_inverse_l2_opNorm_le_two_div_alpha_of_inverse_loewner_upper`, and
  `chewi131_inverse_l2_opNorm_le_two_div_alpha_of_hessian_lower_half_and_inverse_loewner_upper`,
  reducing the inverse-norm display to the exact inverse Loewner upper gate
  `H^{-1} <= (2 / alpha) I`.  Search-first result: direct attempts with
  mathlib `CStarAlgebra.inv_le_inv` and
  `CStarAlgebra.rpow_neg_one_le_rpow_neg_one` timed out in this module even
  with a local 1M heartbeat budget.  The V58 layer adds
  `continuousLinearMap_opNorm_right_inverse_le_of_inner_lower`,
  `chewi131_inverse_l2_opNorm_le_two_div_alpha_of_hessian_lower_half`, and
  `chewi131_inverse_loewner_upper_of_hessian_lower_half`, discharging the
  inverse-norm display and the exact inverse Loewner upper gate directly from
  `(alpha / 2) I <= H`.  Search-first reuse came from a read-only mathlib/local
  scout plus `ContinuousLinearMap.opNorm_le_bound`,
  `abs_real_inner_le_norm`, `Matrix.mul_nonsing_inv`,
  `Matrix.toEuclideanLin`, `Matrix.toLpLin_apply`, the local
  quadratic-form/Loewner bridge, and the V51 symmetric norm/order bridge.
  Methodology note: prototype heavy candidate routes in a minimal scratch file;
  if a route times out there too, switch mathematical proof geometry instead
  of replaying the same API attempt in the heavy module.  The V59 layer adds
  the root-imported module `StatInference/Optimization/Theorem131.lean` with
  `chewi131_local_quadratic_step_of_taylor_bound`,
  `chewi131_local_quadratic_step_and_half_of_taylor_bound`, and
  `chewi131_local_quadratic_recurrence_of_taylor_bound`, assembling the source
  local quadratic recurrence and half-contraction from the Taylor/integral
  Newton remainder estimate plus V56/V58.  Methodology note: once Appendix A
  facts become dependencies, keep source-main theorem assembly in a small
  theorem module so the real next blocker is visible.  Next high-impact step is
  to discharge that Taylor/integral Newton remainder estimate with
  mathlib/local FTC and finite-dimensional Hessian-gradient APIs.  The V60
  layer adds `chewi131_taylor_norm_bound_of_integral_remainder`,
  `chewi131_local_quadratic_step_of_integral_remainder`, and
  `chewi131_local_quadratic_recurrence_of_integral_remainder`, proving that a
  source-shaped integral representation plus the pointwise
  `gamma * (1 - t) * ||x - x_star||^2` bound implies the V59 Taylor norm gate
  and hence the local quadratic recurrence.  Search-first reuse came from
  mathlib `intervalIntegral.norm_integral_le_of_norm_le`,
  `intervalIntegral.integral_eq_sub_of_hasDerivAt`,
  `Continuous.intervalIntegrable`, `ContinuousLinearMap.le_opNorm`,
  `Matrix.l2_opNorm_def`, and `intervalIntegral.integral_const_mul`.
  Methodology note: `intervalIntegral.integral_id` appeared in mathlib source
  but was not available as a public imported declaration in this environment,
  so proving `∫_0^1 (1 - t) dt = 1 / 2` by public FTC was faster and should be
  reused for this lane.  The V61 layer adds the root-imported module
  `StatInference/Optimization/Theorem131Taylor.lean` with
  `chewi131_integral_remainder_identity_of_gradient_ftc`,
  `chewi131_integral_remainder_pointwise_bound_of_hessian_lipschitz`,
  `chewi131_taylor_norm_bound_of_gradient_ftc`,
  `chewi131_local_quadratic_step_of_gradient_ftc`, and
  `chewi131_local_quadratic_recurrence_of_gradient_ftc`.  It reuses local
  `InteriorPoint.lean` segment-gradient FTC plus mathlib interval-integral
  subtraction and continuous-linear-map norm/action lemmas to construct the
  V60 integral-remainder data.  The V62 layer adds
  `chewi131MatrixCLM`, `chewi131_matrix_clm_sub_norm_eq`,
  `chewi131_matrix_inverse_action_of_hessian_matrix`,
  `chewi131_hessian_lipschitz_clm_of_matrix_lipschitz`,
  `chewi131_taylor_norm_bound_of_matrix_gradient_ftc`,
  `chewi131_local_quadratic_step_of_matrix_gradient_ftc`, and
  `chewi131_local_quadratic_recurrence_of_matrix_gradient_ftc`, closing the
  matrix/Hessian-oracle bridge consumed by the V61 gradient-FTC layer.  Reuse
  came from `Matrix.l2_opNorm_def`, `Matrix.nonsing_inv_mul`,
  `Matrix.toEuclideanLin`, `Matrix.toLpLin_apply`, `Matrix.mulVec_mulVec`, and
  `LinearMap.map_sub`.  Methodology note: introduce small local abbrevs for
  repeated long mathlib coercions before putting them under norm/subtraction
  goals; it improves both parser reliability and future proof readability.
  Meta-methodology policy: each new proof packet should update the live docs
  with accelerators and friction sources, not just theorem names.  The next
  blocker is the concrete function/Hessian instantiation: identify `H_n` with
  the Hessian matrix/oracle at `x_n`, package the segment Hessian matrices,
  prove segment differentiability/integrability, and derive nonsingularity
  from the half-radius Hessian lower bound when needed.  The V63 layer adds
  `chewi131_hessian_det_isUnit_of_radius`,
  `chewi131_local_quadratic_recurrence_of_conditional_taylor_bound`,
  `chewi131_taylor_norm_bound_of_continuous_matrix_gradient_ftc`,
  `chewi131_local_quadratic_step_of_matrix_gradient_ftc_of_radius`,
  `chewi131_local_quadratic_step_of_continuous_matrix_gradient_ftc_of_radius`,
  `chewi131_local_quadratic_recurrence_of_matrix_gradient_ftc_of_radius`, and
  `chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_ftc_of_radius`.
  It removes the global `∀ k, IsUnit (H k).det` assumption by deriving
  invertibility from the source radius induction, and it derives interval
  integrability for concrete matrix-Hessian wrappers from
  `hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn`.
  V63 scout result: this mathlib pin has no direct named Hessian-matrix API;
  use explicit `HasFDerivAt grad (chewi131MatrixCLM (Hfun z)) z`, `gradient`
  / `HasGradientAt` bridges, and CLM-valued Hessian continuity.  Next blocker:
  specialize the V63 continuous matrix-Hessian wrappers to `grad := gradient f`
  or a source-named gradient oracle.
  The V64 layer adds the root-imported module
  `StatInference/Optimization/Theorem131Gradient.lean`, keeping the heavier
  mathlib `gradient` import out of `Theorem131Taylor.lean`.  It compiles
  `chewi131_taylor_norm_bound_of_continuous_matrix_gradient_fderiv`,
  `chewi131_local_quadratic_step_of_continuous_matrix_gradient_fderiv_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_fderiv_of_radius`,
  specializing the V63 continuous matrix-Hessian recurrence to `gradient f`
  with hypotheses `DifferentiableAt ℝ (gradient f) z` and
  `fderiv ℝ (gradient f) z = chewi131MatrixCLM (Hfun z)`.  Methodology note:
  expensive imports should be isolated in small downstream wrapper modules;
  putting `Mathlib.Analysis.Calculus.Gradient.Basic` directly in
  `Theorem131Taylor.lean` made the focused build take 222s, while the split
  restored the Taylor module to about 40s and the gradient wrapper to about
  7s.  Next blocker: derive the V64 differentiability/Frechet-derivative
  hypotheses from a clean source-level second-derivative interface, or derive
  CLM-valued Hessian continuity from source matrix continuity.
  Build-methodology note: this run confirmed that fresh temp worktrees are too
  expensive when disk is nearly full.  A package-cache symlink to another
  worktree let the focused Optimization builds pass without rebuilding
  mathlib, but the full root build still hit `no space left on device` at
  `8435/8461` after reaching unrelated empirical-process modules.  Future
  proof packets should keep a persistent Chewi worktree, share package
  dependencies rather than copying them, and root-build only with adequate free
  disk or a warm local root cache.
  The V65 layer adds `chewi131MatrixCLM_isometry`,
  `chewi131MatrixCLM_continuous`, `chewi131MatrixCLM_continuousOn_comp`,
  `chewi131_taylor_norm_bound_of_matrix_continuous_gradient_fderiv`,
  `chewi131_local_quadratic_step_of_matrix_continuous_gradient_fderiv_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_fderiv_of_radius`.
  It uses the existing norm identity `chewi131_matrix_clm_sub_norm_eq` to
  prove continuity of the matrix-to-CLM bridge, so source-facing Theorem 13.1
  wrappers now assume `ContinuousOn Hfun s` directly.  Methodology note:
  local exact norm identities can be stronger and faster than broad mathlib
  continuity searches; future agents should reuse this bridge instead of
  re-probing matrix-to-operator continuity.
  The V66 layer adds
  `chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasFDeriv`,
  `chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasFDeriv_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasFDeriv_of_radius`.
  These wrappers consume the source Hessian matrix family directly as
  `HasFDerivAt (gradient f) (chewi131MatrixCLM (Hfun z)) z`, so future theorem
  assembly no longer needs the awkward `DifferentiableAt` plus `fderiv`
  equality split.  Search-first reuse came from the existing V61-V63 Taylor
  bridge's direct `HasFDerivAt` consumer and mathlib's
  `HasStrictFDerivAt.hasFDerivAt`.  Methodology note: expose the lower-level
  consumer API when it is already exactly what the theorem layer needs.
  The V67 layer adds
  `chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasStrictFDeriv`,
  `chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius`.
  These wrappers consume the Hessian matrix family as
  `HasStrictFDerivAt (gradient f) (chewi131MatrixCLM (Hfun z)) z` along the
  source segments and reuse mathlib `HasStrictFDerivAt.hasFDerivAt` to feed
  the V66 Frechet-derivative interface.  Methodology note: when mathlib has
  the exact strengthening-to-consumer bridge, add that bridge once and move
  immediately to proving the stronger source hypothesis.
  The V68 layer adds
  `chewi131_gradient_hasStrictFDerivAt_of_eventually_hasFDerivAt_matrix`,
  `chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_fderiv`,
  `chewi131_taylor_norm_bound_of_continuous_matrix_gradient_eventually_hasFDeriv`,
  `chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius`,
  `chewi131_local_quadratic_step_of_continuous_matrix_gradient_eventually_hasFDeriv_of_radius`,
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_eventually_hasFDeriv_of_radius`.
  These wrappers discharge the V67 strict derivative hypothesis either from
  `ContDiffAt ℝ 1 (gradient f)` plus the Hessian matrix `fderiv` equality, or
  from an eventual local Frechet derivative model plus `Continuous Hfun`.
  Search-first reuse came from mathlib `ContDiffAt.hasStrictFDerivAt`,
  `hasStrictFDerivAt_of_hasFDerivAt_of_continuousAt`, the gradient/toDual
  bridge APIs, and local positive-orthant derivative construction patterns.
  Methodology note: this closes the strict-derivative wrapper layer for
  Theorem 13.1; next work should prove the Hessian identification from `ContDiffAt ℝ 2 f`,
  `iteratedFDeriv`, or concrete barrier derivative data rather than adding
  another theorem surface.
  The V69 layer adds `chewi131_gradient_contDiffAt_one_of_contDiffAt_two`,
  `chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_two_fderiv`,
  `chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_two_fderiv_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_fderiv_of_radius`.
  These wrappers prove the `C^1` regularity of mathlib's `gradient f` from
  pointwise `ContDiffAt ℝ 2 f` by using `ContDiffAt.fderiv_right_succ` and
  composing with `(InnerProductSpace.toDual ℝ _).symm.contDiff`.  Methodology
  note: a focused stdin Lean probe resolved the Riesz/toDual coercions quickly;
  the remaining Theorem 13.1 blocker is now only the Hessian matrix equality
  `fderiv ℝ (gradient f) z = chewi131MatrixCLM (Hfun z)` or a concrete
  barrier instance of that equality.
  The V70 layer adds
  `chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin`,
  `chewi131_fderiv_gradient_eq_of_hasFDerivAt_fderiv_bilin`,
  `chewi131_taylor_norm_bound_of_matrix_continuous_gradient_secondFDerivBilin`,
  `chewi131_local_quadratic_step_of_matrix_continuous_gradient_secondFDerivBilin_of_radius`,
  and
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_secondFDerivBilin_of_radius`.
  These use mathlib's `InnerProductSpace.continuousLinearMapOfBilin` to
  convert a source derivative of the dual-valued map `fderiv ℝ f` into the
  derivative of `gradient f`, then feed the existing Theorem 13.1 Taylor,
  one-step, and recurrence wrappers.  Methodology note: this removes the
  abstract Hessian-identification blocker; next work should instantiate the
  bilinear Hessian family from `iteratedFDeriv` or a concrete barrier model.
  The V71 layer adds `chewi131SecondFDerivBilin`,
  `chewi131SecondFDerivBilin_toContinuousLinearMap_eq_fderiv_fderiv`,
  `chewi131SecondFDerivBilin_hasFDerivAt_of_contDiffAt_two`,
  `chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_secondFDerivBilin_of_radius`,
  `positiveOrthantNegLogBarrier_gradient_eq`,
  `positiveOrthantNegLogBarrier_gradient_hasFDerivAt`,
  `positiveOrthantNegLogBarrier_fderiv_gradient_eq`,
  `positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt`, and
  `positiveOrthantNegLogBarrier_fderiv_gradient_eventually_eq`.  It
  instantiates the V70 bilinear interface from mathlib `iteratedFDeriv` and
  exposes the concrete positive-orthant barrier derivative surface for
  mathlib's `gradient`.  Methodology note: read-only API scouts were highly
  effective here; keep scouts read-only and let the main thread own the proof
  integration to avoid duplicate edits.
  The V72 layer adds `positiveOrthantNegLogHessMatrix`,
  `positiveOrthantNegLogHessMatrix_isHermitian`,
  `positiveOrthantNegLogHessMatrix_clm_eq`,
  `positiveOrthantNegLogHessCLM_continuousOn`,
  `positiveOrthantNegLogHessMatrix_continuousOn`,
  `positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix`,
  `positiveOrthantNegLogBarrier_fderiv_gradient_matrix_eq`,
  `positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt_matrix`, and
  `chewi131_local_quadratic_recurrence_positiveOrthantNegLogBarrier_of_radius`.
  It defines the diagonal matrix Hessian for the positive-orthant log barrier,
  proves its CLM equality with the existing coordinate Hessian, transports
  continuity through `chewi131MatrixCLM_isometry`, and specializes the
  Theorem 13.1 recurrence so derivative/Hermitian/continuity assumptions are
  no longer supplied manually.  Methodology note: use exact CLM equality plus
  isometry transport for matrix-continuity bridges instead of low-level
  coordinate topology when a CLM derivative theorem already exists.
  The V73 layer adds
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eq`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_hasFDerivAt`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_fderiv_gradient_eq`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt`,
  `chewi1316RangeCentralPathValue_gradient_eq`,
  `chewi1316RangeCentralPathValue_gradient_hasFDerivAt`,
  `chewi1316RangeCentralPathValue_fderiv_gradient_eq`, and
  `chewi1316RangeCentralPathValue_gradient_eventually_hasFDerivAt`.  It lifts
  the existing affine-range and central-path `HasGradientAt` certificates to
  mathlib `gradient`, then transfers the derivative model from the local
  coordinate/range gradient through eventual equality on the open feasible
  range neighborhood.  Methodology note: this closes the affine-range gradient
  bridge search; next runs should spend proof time on local Newton recurrence
  specialization or source quantitative assumptions, not on re-deriving this
  calculus interface.
  The V74 layer adds `chewi1316RangeCentralPathValue_gradient_eq_zero_iff`,
  `chewi1316RangeCentralPathValue_gradient_eq_zero_of_centrality`,
  `chewi1316RangeCentralPathValue_centrality_of_gradient_eq_zero`,
  `chewi1316RangeCentralPathSelector_exists_gradient_eq_zero`,
  `chewi1316RangeCentralPathValue_gradient_segment_hasFDerivAt`, and
  `chewi1316RangeCentralPathValue_hessian_segment_intervalIntegrable`.  It
  turns the Chewi centrality equation into the exact mathlib stationarity
  hypothesis and packages the segment derivative and Hessian-action
  integrability facts used by the gradient-FTC Newton route.  Methodology
  note: after compiling a domain-to-`gradient` bridge, immediately add the
  source-facing stationarity and segment wrappers so later recurrence proofs
  can focus on quantitative assumptions rather than rebuilding calculus glue.
  The V75 layer adds `chewi131_taylor_norm_bound_of_gradient_ftc_clm` and
  `chewi1316RangeCentralPathValue_taylor_norm_bound_of_gradient_ftc`.  It
  generalizes the matrix FTC Taylor-bound proof to Hilbert-space CLMs and then
  specializes it to the finite-row central-path value on the translated slack
  range.  Methodology note: this is the preferred path for range-valued
  objectives; use CLM/local-metric estimates before introducing coordinate
  matrices for finite-dimensional subspaces.
- Latest Chapter 13 frontier: the concrete standard main-stage
  range-membership/decrement blocker is closed in
  `StatInference/Optimization/InteriorPoint.lean`.  New reusable declarations
  are
  `chewi1316_polytopeSlackNegLog_range_mainStage_preNewtonDecrement_le_update_bound`,
  `chewi1316_polytopeSlackNegLog_range_mainStage_preNewtonDecrement_lt_one`,
  `chewi1316_polytopeSlackNegLog_range_mainStage_step_mem`,
  `chewi1316_polytopeSlackNegLog_range_mainStage_decrement_le_quarter`,
  `chewi1316_polytopeSlackNegLog_range_mainStage_step_mem_and_decrement_le_quarter`,
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_and_range_decrement_le_quarter`,
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_and_source_decrement_le_quarter`,
  and
  `chewi1316_polytopeSlackNegLog_exists_standardSourceMainStage_objective_gap_le_eps_imp_of_preliminaryInit`.
  The latest V19 packaging layer adds
  `Chewi1316StandardSourceMainStageObjectiveGapAutoHandoff`,
  `chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_of_preliminaryInit`,
  `chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_boundedFeasibleRange_standardPath`,
  `chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_boundedPolytope_standardPath`,
  `chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_boundedClosedPolytope_standardPath`,
  and
  `chewi1316_standardSourceMainStageObjectiveGapAutoHandoff_compactClosedPolytope_standardPath`.
  The V20 terminal count packet adds
  `chewi1316_large_parameter_condition_of_log_le`,
  `chewi1316_exists_large_parameter_condition_of_one_lt`,
  `chewi1316_exists_mainStageIndex_large_parameter_of_pos`, and
  `chewi1316_exists_mainStageIndex_large_parameter`, closing the
  large-parameter stopping/count certificate by reusing
  `chewi1316_exists_nat_mul_pos_ge` and mathlib log monotonicity/power APIs.
  The V21 terminal barrier-step packet adds
  `chewi1316_polytopeSlackNegLog_range_barrier_step_le_of_mem` and
  `chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStage_nextNewton_of_terminal_mem`,
  closing the finite-row range Lemma 13.15 barrier-step terminal certificate
  whenever `center` and `optimum` are feasible range points.
  The V22 lower-model bridge packet adds
  `chewi1316_lowerModel_of_value_gap_and_firstOrder`,
  `chewi1316_lowerModel_of_value_gap_and_firstOrderStrongConvexOn`, and
  `chewi1316_centralPath_lowerModel_of_value_gap_and_firstOrderStrongConvexOn`,
  reducing the Lemma 13.6 terminal lower-model certificate to the genuine
  self-concordant value-growth inequality plus the already compiled
  first-order convex model.  Search-first result: reuse local
  `FirstOrderStrongConvexOn.lower_model`; mathlib convex derivative slope APIs
  do not directly close Chewi's self-concordant value-growth display.
  The V23 consumer packet pushes this split through the §13.16 fixed-parameter,
  large-parameter, main-stage-parameter, and finite-row range endpoints:
  `chewi1316_objective_gap_le_of_value_growth_and_firstOrderStrongConvexOn`,
  `chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_value_growth_and_firstOrderStrongConvexOn`,
  `chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_value_growth_and_firstOrderStrongConvexOn`,
  and
  `chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStage_nextNewton_of_terminal_mem_and_value_growth`.
  The V24 segment-integral lower-model packet adds
  `chewi1316_lowerModel_of_gradient_segment_quadratic_lower`,
  `chewi1316_centralPath_lowerModel_of_gradient_segment_quadratic_lower`,
  `chewi1316_objective_gap_le_of_gradient_segment_quadratic_lower`, and
  `chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_gradient_segment_quadratic_lower`.
  It reuses local segment-gradient FTC infrastructure and mathlib
  interval-integral monotonicity to reduce the lower-model certificate to a
  pointwise Hessian quadratic lower bound along `center -> x`.  Search-first
  result: no direct Chewi value-growth theorem exists in mathlib/local code;
  the next efficient route is to reuse the existing local-norm sandwich and
  Hessian segment comparison lemmas before introducing any new
  self-concordance primitive.
  The V25 weighted segment packet adds the exact textbook Lemma 13.6 kernel
  route used in Theorem 13.16:
  `chewi1316_weightedKernel_intervalIntegrable`,
  `chewi1316_weightedKernel_integral_eq_sq_div_one_add`,
  `chewi1316_lowerModel_of_gradient_segment_weighted_quadratic_lower`,
  `chewi1316_centralPath_lowerModel_of_gradient_segment_weighted_quadratic_lower`,
  `chewi1316_objective_gap_le_of_gradient_segment_weighted_quadratic_lower`,
  `chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_gradient_segment_weighted_quadratic_lower`,
  and
  `chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_gradient_segment_weighted_quadratic_lower`.
  This keeps the stronger V24 constant pointwise lower-bound consumer as a
  reusable supplied-interface theorem.  The V26 Riccati/Hessian packet then
  discharges the source-exact weighted `hquad_lower` gate directly from
  mixed-third self-concordance, adding
  `scalar_riccati_lower_bound_on_unit_interval`,
  `hessianSegmentLocalNorm_riccatiDerivLowerBound_of_mixedThirdSelfConcordantOn`,
  `hessianSegmentLocalNorm_ge_of_riccati_lower_bound`,
  `hessianSegment_quadratic_lower_weighted_of_mixedThirdSelfConcordantOn`,
  `chewi1316_weighted_hessian_quadratic_lower_of_mixedThirdSelfConcordantOn`,
  `chewi1316_lowerModel_of_mixedThirdSelfConcordantOn`, and
  `chewi1316_centralPath_lowerModel_of_mixedThirdSelfConcordantOn`.
  Search-first result: local code had the one-minus upper Riccati/local-norm
  sandwich but not the one-plus lower primitive needed by Chewi's integrated
  kernel, so the packet adds the missing scalar inverse-monotonicity proof and
  reuses existing mixed-third derivative/local-norm APIs.  The V27 consumer
  packet then pushes this discharge through the generic §13.16 objective-gap
  layer, adding `chewi1316_objective_gap_le_of_mixedThirdSelfConcordantOn`,
  `chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_mixedThirdSelfConcordantOn`,
  and
  `chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_mixedThirdSelfConcordantOn`.
  These are the preferred generic endpoints when a caller has mixed-third
  self-concordance and central-path derivative data; do not route through a
  supplied weighted `hquad_lower` premise unless deliberately testing an older
  interface.  The V28 finite-row specialization adds
  `chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStageParameter_large_of_terminal_mem_and_mixedThird`,
  which instantiates the V27 mixed-third endpoint for the slack range,
  discharges the terminal barrier-step certificate from feasibility, and
  removes the supplied `hlower` premise at a terminal range point.  It reuses
  local finite-row range Hessian derivative/mixed-third APIs,
  `hessianSegmentPsi_continuousOn_of_convex_continuousOn`, and
  `centralPathGrad_hasFDerivAt`.  The V29 zero-safe/standard wrapper packet
  adds
  `chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStageParameter_large_of_terminal_mem_and_mixedThird_zeroSafe`
  and
  `chewi1316_polytopeSlackNegLog_exists_standardSourceMainStage_objective_gap_le_eps_imp_of_preliminaryInit_and_terminal_mem_mixedThird`.
  It reuses `chewi1316_central_objective_gap_le` for the `center = x` branch
  and V18
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_and_range_decrement_le_quarter`
  for terminal standard-path feasibility/decrement, so the concrete
  preliminary-to-main-stage wrapper no longer needs supplied `hlower` or a
  manually supplied barrier-step premise.
  The V30 packaging packet adds
  `Chewi1316StandardSourceMainStageObjectiveGapMixedThirdAutoHandoff`,
  `chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_of_preliminaryInit`,
  `chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedFeasibleRange_standardPath`,
  `chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedPolytope_standardPath`,
  `chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_boundedClosedPolytope_standardPath`,
  and
  `chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_compactClosedPolytope_standardPath`.
  This is now the preferred Chapter 13 standard-path handoff when `center` and
  `optimum` are feasible: the call surface has centrality and the
  large-parameter stopping inequality, but no supplied `hlower`,
  barrier-step, membership, or decrement premise.
  The V31 selection packet adds
  `chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_exists_mainStageIndex_objective_gap_le_eps`,
  reusing V20 `chewi1316_exists_mainStageIndex_large_parameter` to choose the
  terminal `Nmain` automatically from positive `eps`, `c0`, and `tMain`.
  The V32 wrapper packet adds the bounded feasible-range, bounded
  source-polytope, bounded closed-polytope, and compact closed-polytope
  `*_exists_mainStageIndex_objective_gap_le_eps` endpoints by composing the
  V30 standard-path constructors with the V31 index selector.  The live
  standard-path call surface now keeps only the terminal centrality premise as
  the real remaining certificate.
  The V33 selector packet adds
  `chewi1316_standardSourceMainStageTSeq_pos`,
  `Chewi1316RangeCentralPathSelector`,
  `chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_centralPathSelector`,
  and the four bounded/closed/compact
  `*_exists_center_mainStageIndex_objective_gap_le_eps_of_centralPathSelector`
  endpoints.  With a selector for positive central-path parameters, these
  endpoints choose both the terminal `Nmain` and its matching central-path
  `center`, then prove the objective gap directly.
  The V34 packet adds `negLogBarrier_hasDerivAt_of_pos`,
  `positiveOrthantNegLogBarrier_hasGradientAt`,
  `Chewi1316RangeCentralPathMinimizerSelector`, and
  `chewi1316_rangeCentralPathSelector_of_minimizerSelector`.  The positive
  orthant barrier value now has a verified mathlib gradient, and any supplied
  global minimizer of a verified central-path value model can be converted into
  the V33 centrality selector by the reused Fermat bridge from
  `Minimizer.lean`.
  The V35 packet adds `barrierAffineRangeValue`,
  `barrierAffineRangeValue_hasGradientAt`,
  `barrierAffineRangeValue_positiveOrthantNegLogBarrier_hasGradientAt`,
  `chewi1316RangeCentralPathValue`,
  `chewi1316RangeCentralPathValue_hasGradientAt`,
  `Chewi1316RangeCentralPathValueMinimizerSelector`, and the bridges from a
  concrete value-minimizer selector to the V34/V33 selector interfaces.  The
  finite-row central-path value now has the exact verified gradient
  `t • aObj + barrierAffineRangeGrad ... positiveOrthantNegLogGrad center`.
  The V36 packet adds reusable local/interior Fermat bridges in
  `Minimizer.lean`, plus
  `Chewi1316RangeCentralPathValueLocalMinimizerSelector`,
  `Chewi1316RangeCentralPathValueDomainMinimizerSelector`, and direct bridges
  from local/domain minimizers of the concrete central-path value to the V33
  central-path selector.  This removes the unrealistic need for a global
  `Set.univ` minimizer when the barrier proof only supplies interior constrained
  optimality.
  The V37 packet adds
  `isOpen_barrierAffineRangeSet`,
  `isOpen_positiveOrthant`,
  `isOpen_barrierAffineRangeSet_positiveOrthant`,
  `barrierAffineRangeSet_positiveOrthant_mem_nhds`,
  `Chewi1316RangeCentralPathValueFeasibleMinimizerSelector`,
  `chewi1316_rangeCentralPathValueDomainMinimizerSelector_of_feasibleMinimizerSelector`,
  and `chewi1316_rangeCentralPathSelector_of_valueFeasibleMinimizerSelector`.
  This closes the positive-slack-range neighborhood blocker from actual
  feasibility and gives the live route a cleaner feasible-minimizer selector
  surface.
  The V38 packet adds
  `chewi1316RangeCentralPathValue_continuousOn`,
  `chewi1316_rangeCentralPathValueFeasibleMinimizerSelector_of_isCompact`, and
  `chewi1316_rangeCentralPathSelector_of_isCompact_feasibleRange`.
  This proves the central-path selector from compactness and nonemptiness of
  the feasible slack range by reusing mathlib `HasGradientAt.continuousOn` and
  `IsCompact.exists_isMinOn`.
  The V39 packet adds
  `chewi1316_rangeCentralPathSelector_of_isCompact_feasibleRange_of_polytopeSlackSet_mem`,
  `Chewi1316StandardSourceMainStageExistsCenterObjectiveGapConclusion`,
  `chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_isCompact_feasibleRange`,
  and the bounded feasible-range, bounded source-polytope, bounded
  closed-polytope, and compact closed-polytope
  `*_exists_center_mainStageIndex_objective_gap_le_eps_of_isCompact_feasibleRange`
  endpoints.  These wrappers discharge nonemptiness from a strict feasible
  source point and no longer expose a raw central-path selector premise.
  The V40 packet adds
  `Chewi1316RangeCentralPathValueCompactSublevelEnvelopeSelector`,
  `chewi1316_rangeCentralPathValueFeasibleMinimizerSelector_of_compactSublevelEnvelopeSelector`,
  `chewi1316_rangeCentralPathSelector_of_compactSublevelEnvelopeSelector`,
  `chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_compactSublevelEnvelopeSelector`,
  and the bounded feasible-range, bounded source-polytope, bounded
  closed-polytope, and compact closed-polytope
  `*_exists_center_mainStageIndex_objective_gap_le_eps_of_compactSublevelEnvelopeSelector`
  endpoints.  Search-first reuse for V40: mathlib
  `IsCompact.exists_isMinOn` and `isMinOn_iff`, plus local
  `chewi1316RangeCentralPathValue_continuousOn` and the V39 endpoint family.
  The selector minimizes on a compact feasible envelope and promotes the result
  to the whole open feasible slack range using the supplied sublevel-containment
  branch.
  The V41 packet adds
  `chewi1316RangeCentralPathClosedFeasibleRange`,
  `Chewi1316RangeCentralPathValueSublevelSlackFloorSelector`, and
  `chewi1316_rangeCentralPathValueCompactSublevelEnvelopeSelector_of_closedFeasibleRangeCompact_and_sublevelSlackFloorSelector`.
  It proves that a compact closed feasible range plus a verified central-path
  sublevel slack-floor certificate gives the V40 compact sublevel-envelope
  selector.  Search-first reuse for V41: mathlib `IsCompact.inter_right`,
  `isClosed_iInter`, `isClosed_Ici.preimage`, and `PiLp.continuous_apply`.
  The V42 packet adds the explicit finite-product log-blowup algebra:
  `negLogBarrier_exp_neg_le_of_le`,
  `negLogBarrier_add_log_nonneg_of_le`,
  `positiveOrthantNegLogBarrier_coordinate_le_barrier_add_card_log_of_coord_le`,
  `Chewi1316RangeCentralPathValueSublevelNegLogUpperSelector`,
  `Chewi1316RangeCentralPathValueSublevelLinearLowerSlackUpperSelector`,
  `chewi1316_rangeCentralPathValue_negLogBarrier_coord_le_of_value_le_of_linear_lower_and_slack_upper`,
  and the selector bridges from linear-lower/slack-upper data to the V41
  slack-floor selector.  Search-first reuse for V42: mathlib
  `Real.exp_le_exp`, `Real.exp_log`, `Real.log_le_log`, `Real.log_nonneg`,
  `Finset.single_le_sum`, and finite-sum algebra.
  The V43 packet completes that compact-bounds discharge:
  `chewi1316_rangeCentralPathValueSublevelLinearLowerSlackUpperSelector_of_closedFeasibleRangeCompact`,
  `chewi1316_rangeCentralPathValueSublevelSlackFloorSelector_of_closedFeasibleRangeCompact`,
  `chewi1316_rangeCentralPathValueCompactSublevelEnvelopeSelector_of_closedFeasibleRangeCompact`,
  `chewi1316_rangeCentralPathSelector_of_closedFeasibleRangeCompact`,
  `chewi1316_rangeCentralPathSelector_of_closedFeasibleRangeCompact_of_polytopeSlackSet_mem`,
  and
  `chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_closedFeasibleRangeCompact`
  compile.  Search-first reuse for V43: mathlib
  `IsCompact.exists_bound_of_continuousOn`, continuity of linear scalars and
  translated slack vectors, `PiLp.norm_apply_le`, `Real.norm_eq_abs`,
  `neg_abs_le`, and local V40/V41/V42 selector bridges.
  The V44 packet completes that source-facing compactness discharge:
  `chewi1316RangeCentralPathClosedFeasibleRange_eq_rangeRestrict_image_closedPolytopeSlackSet`,
  `chewi1316RangeCentralPathClosedFeasibleRange_isCompact_of_closedPolytope_isCompact`,
  the bounded-feasible-range, bounded-source-polytope,
  bounded-closed-polytope, and compact-closed-polytope
  `*_exists_center_mainStageIndex_objective_gap_le_eps_of_closedFeasibleRangeCompact`
  wrappers, and the fully source-facing
  `chewi1316_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_closedPolytopeCompact`.
  Search-first reuse for V44: local closed polytope/source-range membership
  APIs and mathlib compact image transport through
  `ContinuousLinearMap.continuous`.
  The V45 packet derives compactness from bounded closed polytope under
  `[ProperSpace F]` and exposes the bounded-closed source endpoint:
  `chewi1316RangeCentralPathClosedFeasibleRange_isCompact_of_closedPolytope_isBounded`
  and
  `chewi1316_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_closedPolytopeBounded`.
  Prior V16/V17 membership reducers remain available, but the live route should
  now use the V19 auto standard-path handoff instead of passing an external
  `hxseq_mem` or per-step decrement premise.
  The V46 packet adds the no-extra-suffix source-facing compact and bounded
  closed-polytope endpoints:
  `chewi1316_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`
  and
  `chewi1316_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`.
  These should be the stable source surface for the §13.16 report route or any
  later source-numbered alias; do not route future work through the internal
  `_of_closedPolytopeCompact` / `_of_closedPolytopeBounded` names unless the
  proof specifically needs to expose that premise.  Do not re-open supplied
  minimizer, central-path selector, or slack-floor premises.
  The V47 packet adds those source-numbered report-facing aliases:
  `chewi1316_lemma_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`
  and
  `chewi1316_lemma_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`.
  Source anchor search found Lemma 13.16 at markdown lines 4860-4888.  The
  formal report is still gated on local source screenshot/report compilation
  tooling: this environment has `tectonic` but not `pandoc`, `pdftoppm`, or
  `pdfinfo`, so do not create a report folder until those gates can pass.
  Do not repeat
  large-parameter stopping/count, barrier-step from terminal feasibility, or
  the first-order/segment-integral/weighted-kernel/Riccati lower-model bridge
  consumer wrappers, or the generic mixed-third objective-gap consumers.
- Cached Chapter 13 frontier history: the finite-row slack-range §13.16 handoff now
  compiles through source-pullback decrement transport and a point-dependent
  range sqrt-coordinate one-step wrapper.  New reusable declarations are
  `chewi1314_polytopeSlackNegLog_range_selfConcordantBarrierOn`,
  `chewi1316_polytopeSlackNegLog_range_decrement_step_le_eighth_of_nextNewton_sqrtCoordModel`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
  The newest correction weakens both `sqrtCoordModel` wrappers from a fixed
  range equivalence to a domain-wide family `fun z => sqrtCoordRange z`, matching
  the nonconstant logarithmic-barrier Hessian.  The newest source-transport
  packet adds `barrierAffineRange_preliminaryPathGrad_adjoint_rightInverse_eq`,
  `barrierAffineRange_preliminaryPath_newtonStep_rangeRestrict_eq`,
  `chewi1316_polytopeSlackNegLog_rangePreliminaryNextNewtonSteps_of_sourcePullbackPreliminaryNextNewtonSteps`,
  `chewi1316_polytopeSlackNegLog_rangePreDecrementNext_le_of_sourcePullbackPreDecrementNext_le`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
  The source one-step API now also adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_sourceDecrement`.
  The source canonical-lambda packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_canonicalLambda`, so a direct source-coordinate
  `1/4 -> 1/8` proof can feed either the general `c0`/`tailBound` handoff
  or the standard handoff without separate range recurrence or range
  pre-decrement assumptions.  The source `tsum` budget packet adds
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_prefix_le_half_of_tsum`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_canonicalLambda`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants_of_sourceDecrement`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
  These reduce the remaining prefix-budget obligation to a summable majorant
  with total `tsum <= 1 / 2`, deriving nonnegativity from the pre-decrement
  inequality itself.  The geometric budget bridge adds
  `chewi1316_stepBudget_tsum_le_half_of_geometric_majorant` and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_tsum_le_half_of_geometric_majorant`,
  so a pointwise estimate `2 * stepBudget n <= C * q^n` with `0 <= q < 1`
  and `C * (1 - q)⁻¹ <= 1 / 2` now supplies the source `tsum` assumptions.
  The geometric handoff packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_canonicalLambda`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants_of_sourceDecrement`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`,
  so source §13.16 handoffs can now consume the geometric majorant directly.
  The contracting-budget packet adds
  `chewi1316_stepBudget_geometric_majorant_of_doubled_recurrence`,
  `chewi1316_stepBudget_tsum_le_half_of_doubled_recurrence`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_tsum_le_half_of_doubled_recurrence`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_geometricBudget_of_rangePreDecrementNext`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_contractingBudget_of_rangePreDecrementNext`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_canonicalLambda`.
  The standard-consumer packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants_of_sourceDecrement` and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`, so the standard source-decrement and range-sqrt routes also consume the doubled-budget recurrence directly.
  Thus a proof of `2 * stepBudget (n+1) <= q * (2 * stepBudget n)`,
  `0 <= q < 1`, and `(2 * stepBudget 0) * (1 - q)⁻¹ <= 1 / 2`
  feeds the canonical, standard source-decrement, or standard range-sqrt
  §13.16 handoff directly; range-side pre-decrement estimates can also be
  transported to source before consuming the geometric/contracting budget.
  The range sqrt-coordinate gate is now closed by
  `continuousLinearMap_exists_adjointSqrt_of_isPositive_finiteDim` and
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`.  The current
  exact-source gate is now to prove the source next pre-decrement
  decay/total-mass bound, preferably as the doubled-budget
  contraction feeding the source `preDecrementContractingBudget` handoff or as
  the pointwise geometric majorant feeding the source
  `preDecrementGeometricBudget` handoffs.
  The actual-budget base case now compiles as
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_zero_le_standard`:
  for the standard preliminary update and `t_0 = 1`, the real source
  next-pre-decrement budget at index `0` is at most `1 / 200`, using the
  finite-row barrier gradient bound.  The remaining exact-source gate is the
  successor doubled contraction for the actual budget sequence.  The scalar
  initial-total side for `q = 1 / 2` is now compiled through
  `chewi1316_initialTotal_half_le_of_stepBudget_zero_le_standard`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_initialTotal_half_le_standard`, and the preferred endpoint
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_noFactor_standardConstants`.
  The actual selected-tail bridge now compiles as
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
  It sets `stepBudget` to the real next-pre-decrement budget, derives the
  prefix budget from the half-contraction plus the compiled initial-total side,
  and calls the existential selected-tail handoff.  The remaining proof inputs
  for this route are now exactly the actual half contraction and the eventual
  selected successor range-tail estimate.
  The thresholded actual selected-tail bridge now compiles as
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
  It shifts the internally chosen selected successor index past a burn-in
  threshold `Nmin`, so future bounded-polytope estimates may be stated only
  after their invariant has activated.
  The post-threshold range-tail packet now compiles the plain-tail interfaces
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`.
  These are the preferred consumers once geometry proves
  `∀ Nout ≥ Nmin, rangeTailNorm Nout ≤ tailBound`.
  The scaled-to-unscaled tail bridge now adds
  `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_barrier_dualLaws`,
  `dualLocalNorm_le_div_of_abs_mul_dualLocalNorm_le_of_abs_lower`,
  `sourceGrad_dualLocalNorm_le_of_preliminaryPath_sequence_barrier_dualLaws_abs_t_lower`,
  `chewi1316_polytopeSlackNegLog_rangeTailBound_of_sourcePreliminaryPath_abs_t_lower`, and
  `chewi1316_polytopeSlackNegLog_postThresholdRangeTailBound_of_sourcePreliminaryPath_abs_t_lower`.
  It turns the reverse preliminary-path estimate
  `|t_N| * ||grad phi(xbar0)||*_{x_N} <= sqrt m + lambda_N` into the exact
  post-threshold range-tail predicate whenever a valid lower denominator
  `0 < tau_N <= |t_N|` and budget `(sqrt m + Lambda_N) / tau_N <= tailBound`
  are available.  Treat this as a conditional finite-window/moving-denominator
  bridge, not as a revival of the archived false fixed-source scaled-tail
  route.
  The composed post-threshold endpoints now add
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
  They compose the lower-`|t_N|` scaled-tail bridge with the existing
  §13.16 post-threshold consumers, so future proofs can supply the
  lower-denominator/lambda-budget certificate directly instead of rebuilding
  the raw range-tail predicate by hand.
  The canonical-source-decrement endpoints now add
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
  They instantiate `lambda_0 = 1/4`, `lambda_{n+1} = 1/8` internally from
  the source `1/4 -> 1/8` decrement step, leaving future callers with the
  post-threshold lower-denominator budget and `1 <= Nmin`.
  The selected-window lower-denominator packet now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`.
  These reduce the lower-`|t|` input to one selected successor index
  `N+1`, avoiding the stronger post-threshold all-future denominator
  certificate when the actual preliminary `t_N` is decreasing.
  The closed-form denominator packet now adds
  `chewi1316_preliminaryStageParameter_abs_eq_pow_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_postThresholdClosedFormAbsTLowerTail_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_selectedClosedFormAbsTLowerTail_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_postThresholdClosedFormAbsTLowerTail_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_selectedClosedFormAbsTLowerTail_succ_noFactor_standardConstants`.
  Prefix-budget and actual-budget callers can now state tail budgets directly
  with the standard geometric denominator instead of carrying a separate
  `tau <= |t_N|` certificate.
  The selected range source-radius packet now adds
  `chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourceRadiusHalf`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeSourceRadiusHalf_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_selectedRangeSourceRadiusHalf_succ_noFactor_standardConstants`.
  This moves the bounded-polytope route one layer upstream: selected range
  source-radius-half now directly yields the selected tail bound and the
  positive main-stage initialization, with actual-budget prefix summability
  discharged when the half-contraction is available.
  The internal selected-tail packet now adds
  `chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_preDecrementBudget`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalSelectedRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalSelectedRangeTailBound_succ_noFactor_standardConstants`.
  These are the preferred compact conditional consumers when the source
  preliminary recurrence already has a prefix pre-decrement budget or the
  actual half-contraction: range membership, selected radius-half, and the
  selected tail bound are all derived internally.
  The existential compact packet now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalEventualSelectedRangeTailBound_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalEventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
  These choose `M,N` internally as well, leaving only source recurrence,
  prefix budget or actual half-contraction, and `2 * sqrt m <= tailBound` for
  this conditional §13.16 route.
  Route correction: this is conditional infrastructure.  The archived
  positive-orthant obstruction packets already warn that global fixed-source
  radius/summability gates are not the right textbook-scale path for the
  actual decreasing-`t` preliminary recurrence.  Unless a new valid invariant
  proves the actual half contraction, the next serious Chapter 13 work should
  return to the moving-center / bounded-polytope range-tail estimate and use
  the existing range-tail source-start consumers.
  The measured-tail range packet now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_noFactor`,
  which initializes the positive main stage from the actual measured
  slack-range tail norm at a selected preliminary index and the corresponding
  log/count inequalities.  This is the preferred exact selected-index wrapper
  while the stronger moving-center or bounded-polytope invariant is being
  proved.
  The successor selected-index layer now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_succ_noFactor_canonicalLambda`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_succ_noFactor_standardConstants`,
  so downstream work no longer has to carry `lambdaSeq` or scalar
  `c0 = 1/200` plumbing for this measured-tail route.
  The source-facing measured-tail handoff packet now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants`.
  These derive successor range membership and the `1/4 -> 1/8` preliminary
  invariant internally from range/source preliminary Newton data plus the
  prefix pre-decrement budget, leaving the real preferred mathematical target
  as the moving-center / bounded-polytope measured range-tail logarithmic
  bound at a selected successor index.
  The range-feasibility measured-tail packet now adds
  `chewi1316_polytopeSlackNegLog_range_decrement_step_le_eighth_of_nextNewton_sqrtCoordModel_of_rangeMem`,
  `chewi1316_polytopeSlackNegLog_source_decrement_step_le_eighth_of_nextNewton_rangeMem_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_measuredRangeTailLogBound_succ_noFactor_standardConstants`.
  These no-prefix-budget wrappers are the preferred measured-tail consumers
  once a moving-center or bounded-polytope proof supplies feasibility of every
  range-restricted iterate directly; they avoid reviving the archived false
  fixed-source/global-prefix route.  The current exact-source blocker is now
  to prove the actual range-feasibility/moving-center invariant and the
  selected successor measured-tail log estimate.
  The no-prefix selected-tail packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_selectedRangeTailBound_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
  These compose the range-feasibility measured-tail endpoint with the scalar
  tail-log bridge and internal `M,N` selector, so future geometry can target a
  plain eventual selected successor dual-norm bound plus all-iterate range
  feasibility.
  The no-prefix post-threshold packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_postThresholdRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  Thus the next geometry proof can use a post-threshold or `∀ᶠ N in atTop`
  plain range-tail bound directly, together with all-iterate range feasibility.
  The no-prefix slack-ratio packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySlackRatioBound_succ_noFactor_standardConstants`.
  This converts an eventual translated-slack coordinate ratio envelope into
  the no-prefix range-tail initializer, so future moving-center work can
  target coordinate ratios directly without reintroducing a prefix budget.
  The no-prefix source-radius packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySourceRadiusBound_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySourceRadiusHalf_succ_noFactor_standardConstants`.
  This converts an eventual source local-norm radius bound around
  `rangeRestrict xbar0` into the no-prefix slack-ratio/range-tail initializer.
  The highest-leverage remaining proof is now the moving-center or
  bounded-polytope invariant that supplies all-iterate range feasibility and an
  eventual source-radius, preferably radius `1/2`.
  The no-prefix lower-denominator packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
  These let the next moving-center proof provide post-threshold lower
  denominators for `|t_N|` and the `(sqrt m + 1/8) / tau_N` budget instead of
  a raw range-tail bound.
  The selected lower-denominator packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`.
  This is the finite-window version: the denominator certificate is needed
  only at the selected successor index `N+1`.
  The no-prefix closed-form denominator packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_postThresholdClosedFormAbsTLowerTail_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_selectedClosedFormAbsTLowerTail_succ_noFactor_standardConstants`.
  Range-feasibility/moving-center work should now budget directly against
  `(1 - (1/200) / sqrt m)^N` or the selected successor denominator.
  The selected closed-form source-shape wrapper now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_sourceDecrement_selectedClosedFormAbsTLowerTail_internalTailBound_succ_noFactor_standardConstants`.
  It fixes the selected tail expression internally and discharges the
  nonnegativity/reflexive budget proof, leaving only selected count/log
  hypotheses.  This is finite-window infrastructure; because the denominator
  decreases as the preliminary parameter decreases, it should not replace the
  true moving-center/bounded-polytope long-window range-tail proof.
  The selected-tail-bound packet adds `chewi1316_measuredTailLog_le_of_tailBound`
  and the range/source/concrete selected-bound handoffs
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants`.
  Future geometry work can now supply a plain selected successor dual-norm
  bound plus `log (16 * (tailBound + 1)) <= M log 2`; the measured-tail
  logarithmic conversion and source/range transport are compiled.
  The existential selected-tail-bound handoff now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`,
  which chooses `M` and the successor count index internally.  The next exact
  geometry packet should therefore prove an eventual selected successor
  range-tail bound under the count inequality, rather than rebuilding scalar
  `M,N` selection or measured-tail log plumbing.
  The thresholded pre-decrement-budget variant now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`,
  allowing the selected successor range-tail bound to start after a burn-in
  threshold.
  The post-threshold range-tail variant now removes the `M` and count
  parameters from the tail assumption entirely; it only needs a plain tail
  bound for all output indices after `Nmin`.
  The newest filter-eventual adapter packet adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallyRangeTailBound_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  It reuses Mathlib `Filter.eventually_atTop`, consistent with local
  `ASGD.lean` eventual-bound interfaces, so future moving-center or
  bounded-polytope estimates can be supplied directly as `∀ᶠ N in atTop`
  range-tail bounds.
  The newest slack-ratio geometry bridge adds
  `chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_positiveOrthant_sourceGrad`,
  `chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_sqrt_mul_of_slackRatio_le`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallySlackRatioBound_succ_noFactor_standardConstants`.
  This converts an eventual translated-slack coordinate ratio envelope into
  the source §13.16 main-stage initializer.  Reuse came from local
  positive-orthant source-gradient dual norm, Euclidean coordinate-envelope,
  range inverse-Hessian, and dual/primal Cauchy lemmas; no direct Mathlib
  range-restriction result was available.
  The prefix-budget packet now derives the eventual slack-ratio envelope with
  constant `3/2` from the already compiled range source-radius-half invariant:
  `positiveOrthant_ratio_abs_le_one_add_of_localNorm_sub_le`,
  `chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`,
  `chewi1316_polytopeSlackNegLog_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallySlackRatioBound_three_halves_succ_noFactor`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
  The remaining source-side blocker is now the actual preliminary
  pre-decrement budget/decay proof feeding this initializer.
  The actual half-contraction route now reuses that sharper bridge via
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_half_contraction_standard`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
  This packages actual half-contraction into the `3/2` slack-ratio
  initializer.  Search-first result: no relevant Mathlib Newton-decrement
  theorem exists; next proof work should reuse local
  `chewi138_*newtonDecrement_step*` and preliminary-stage decrement wrappers.
  The newest parameter-shift packet adds `polytopeSlackSet_of_rangeRestrict_mem`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_postDecrement_add_delta_sqrt`,
  and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_eighth_add_standard_of_postDecrement_le_eighth`.
  This proves the accurate budget relation
  `B_{n+1} <= postDecrement(t_{n+1}, x_{n+1}) + delta * sqrt(m)`, with the
  standard corollary `B_{n+1} <= 1/8 + 1/200`; it confirms the next proof
  should use a valid additive/finite-window recurrence, not a free raw
  half-contraction.
  The newest quadratic-recurrence packet adds
  `chewi1316_polytopeSlackNegLog_range_postDecrement_le_quadratic_of_nextNewton_sqrtCoordModel`,
  `chewi1316_polytopeSlackNegLog_sourcePostDecrement_le_quadratic_of_nextNewton`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_delta_sqrt`, and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard`.
  This compiles the real actual-budget recurrence
  `B_{n+1} <= B_n^2 / (1 - B_n)^2 + 1 / 200` for standard constants.  Because
  the additive term creates a floor, the conditional half-contraction
  consumers remain useful only behind a separately proved stronger theorem;
  the active route should derive a finite-window/selected-index consequence or
  use the existing moving-center measured-tail handoffs.
  The scalar closure packet adds `real_quadratic_add_standard_le_one_hundredth`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_hundredth_of_quadratic_add_standard`,
  and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_lt_one_of_quadratic_add_standard`.
  This proves every actual next-pre-decrement budget remains below `1 / 100`
  under the verified recurrence, discharging the recurrence's own `< 1` side
  condition while still leaving the finite-window/moving-tail budget as the
  real Chapter 13 blocker.
  The finite-window packaging packet adds
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard_of_nextNewton`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_fifty_of_quadratic_add_standard`,
  and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_twenty_five`.
  These give a side-condition-free recurrence and a verified local-window
  prefix budget for windows with `K+1 <= 25`.  The newest sharpened
  finite-window packet improves the stable scalar invariant to `1/198` via
  `real_quadratic_add_standard_le_one_one_hundred_ninety_eight`, adds
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_ninety_nine_of_quadratic_add_standard`,
  and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_forty_nine`.
  The newest exact-tail wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail_succ_noFactor_standardConstants`
  fixes the finite-window tail budget to the verified internal
  `sqrt(m) * 3/2` bound, removing a redundant caller-supplied `tailBound`
  comparison from source-start uses.
  The newest auto-log-index finite-window packet adds
  `chewi1316_exists_nat_mul_log_two_between` and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail_autoLogIndex_succ_noFactor_standardConstants`.
  It reuses Mathlib `Nat.le_ceil`, `Nat.ceil_lt_add_one`, and
  `Real.log_nonneg` to choose the base-two log index with one `log 2`
  overshoot, so finite-window callers now pass one scalar window inequality
  instead of manually supplying `M`, the log bound, and the count bound.
  The selected-tail auto-index packet generalizes this for future
  moving-center work, adding
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_selectedRangeTailBound_autoLogIndex_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_internalSlackRatioBound_three_halves_autoLogIndex_succ_noFactor_standardConstants`.
  A moving-center or bounded-polytope proof can now provide the selected
  successor dual-norm tail bound plus one overshoot-aware scalar window
  inequality, and avoid manual `M`, count, and log side-condition plumbing.
  The finite-window geometry packet now exposes the actual-path
  bounded-polytope facts directly as
  `chewi1316_polytopeSlackNegLog_rangeRestrict_successor_mem_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine`,
  `chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine`
  and
  `chewi1316_polytopeSlackNegLog_slackRatio_three_halves_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine`.
  The measured-tail log-index packet adds
  `chewi1316_polytopeSlackNegLog_exists_logIndex_measuredRangeTailLog_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail`,
  so the finite-window route can expose an actual selected `M` satisfying both
  the count budget and the measured range-tail logarithmic bound.
  Thus the verified finite-window route has standalone range-feasibility,
  source-radius-half, translated slack-ratio, and measured-tail log-index
  artifacts, not only a downstream selected-tail consumer.
  The local recurrence refactor now adds
  `chewi1316_polytopeSlackNegLog_range_postDecrement_le_quadratic_of_nextNewton_sqrtCoordModel_of_pairMem`
  and
  `chewi1316_polytopeSlackNegLog_sourcePostDecrement_le_quadratic_of_nextNewton_pairMem`,
  pairwise quadratic post-step estimates needing only current/next range
  feasibility.  This begins removing the all-iterate feasibility assumption
  from the honest actual recurrence stack.  The parameter-shift recurrence is
  now localized too, through
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_delta_sqrt_pairMem`
  and
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard_pairMem`.
  The remaining reduction is finite prefix-budget induction: generate the
  pairwise range feasibility locally, then call these recurrence wrappers
  instead of assuming a global `∀ k` range-feasibility invariant.  The
  finite-prefix packet now adds
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard_prefixRange`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_ninety_nine_of_quadratic_add_standard_prefixRange`,
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_forty_nine_prefixRange`, and
  `chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRatio_three_halves_length_le_forty_nine_prefixRange`.
  The `K+1 <= 49` budget and selected range-tail wrapper now consume only
  finite feasibility through `N+1`; the next exact blocker is a simultaneous
  proof that generates that finite feasibility locally.  That blocker is now
  closed for the actual source preliminary path by
  `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard_currentPrefixRange`
  and
  `chewi1316_polytopeSlackNegLog_rangeRestrict_mem_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget`.
  The exact finite-window auto-index initializer now has an initial-range
  version,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_exactSlackRatioTail_autoLogIndex_succ_noFactor_standardConstants_of_initialRange`,
  so callers no longer provide global range feasibility for this route.  The
  next finite-window blocker is the scalar/source-side log window, or else the
  moving-center long-window argument if the finite window cannot satisfy it.
  The scalar obstruction is now formalized as
  `chewi1316_exactSlackRatioTail_logWindow_impossible_of_length_le_forty_nine`:
  for `m > 0` and `N + 1 <= 49`, the exact slack-ratio-tail auto-index window
  is contradictory.  Thus this finite-window endpoint is diagnostic
  infrastructure, not the final §13.16 preliminary-stage route; next work
  should attack the moving-center/long-window range-tail invariant.
  The newest bounded-polytope bridge adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_globalSlackRatioBound_succ_noFactor_standardConstants`.
  It combines the actual-path range-feasibility theorem with the no-prefix
  eventual slack-ratio initializer, so a future geometry proof can provide a
  global feasible-point slack-ratio envelope instead of a finite-window log
  certificate or an actual-budget half-contraction.
  The coordinate-upper-bound bridge now adds
  `chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_slackCoordinateUpperBound`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackCoordinateUpperBound_succ_noFactor_standardConstants`.
  This is the most concrete bounded-polytope entrypoint so far: upper-bound
  each feasible translated slack coordinate and compare those bounds to the
  source slack coordinates.
  The `BddAbove`/`sSup` bridge now adds
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
  plus the compact feasible-range wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSlackCoordinateSup_succ_noFactor_standardConstants`
  and compact-superset/envelope wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetSlackCoordinateSup_succ_noFactor_standardConstants`,
  now strengthened by
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetEnvelopeSlackCoordinateSup_succ_noFactor_standardConstants`
  and the pointwise envelope-upper-bound wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetSlackCoordinateUpperBound_succ_noFactor_standardConstants`,
  plus the closed-ball envelope wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_closedBallSlackCoordinateUpperBound_succ_noFactor_standardConstants`
  and source-centered radius wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceCenteredRadiusBound_succ_noFactor_standardConstants`,
  plus source-local-norm wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceLocalNormBound_succ_noFactor_standardConstants`
  and exact-budget source-local-norm wrapper
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceLocalNormBound_exactBudget_succ_noFactor_standardConstants`.
  The coordinate-relative Dikin bridge now adds
  `chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_coord_abs_le`,
  `chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_relative_abs_sub_le`,
  `chewi1316_polytopeSlackNegLog_sourceLocalNormBound_of_slackCoordAbsBound`,
  `chewi1316_polytopeSlackNegLog_sourceLocalNormBound_of_slackRelativeAbsSubBound`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRelativeAbsSubBound_exactBudget_succ_noFactor_standardConstants`.
  The moving-center relative-slack tail packet now adds
  `positiveOrthant_ratio_abs_le_one_add_of_relative_abs_sub_le`,
  `chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_relative_abs_sub_le`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSlackRelativeAbsSubBound_succ_noFactor_standardConstants`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySlackRelativeAbsSubBound_succ_noFactor_standardConstants`.
  This is the preferred pathwise moving-center interface when geometry gives
  eventual or post-threshold coordinatewise relative slack displacements along
  the actual preliminary iterates: the scalar budget is the sharper
  `sqrt(m) * (1 + rho) <= tailBound`, not the Dikin-detour
  `sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.
  The actual half-contracting source-radius packet now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceRadiusBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceRadiusBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceRadiusHalf_succ_noFactor_standardConstants`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceRadiusHalf_succ_noFactor_standardConstants`.
  This gives the same actual-budget endpoint a direct Dikin/source-radius
  moving-center interface, with generalized budget
  `sqrt(m) * (1 + r) <= tailBound` and half-ball budget
  `sqrt(m) * (3 / 2) <= tailBound`.
  The pathwise coordinate-displacement packet now adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSlackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySlackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`.
  These let future moving-center proofs feed source-slack coordinate
  displacement directly through
  `chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_coord_abs_le`,
  with exact budget `sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.
  The pathwise source-centered radius packet now adds
  `chewi1316_polytopeSlackNegLog_slackCoordAbsSub_le_of_dist_le`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceCenteredRadiusBound_exactBudget_succ_noFactor_standardConstants`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceCenteredRadiusBound_exactBudget_succ_noFactor_standardConstants`.
  These reduce pathwise coordinate control to the moving-center distance
  certificate `dist x_N xbar0 <= R` plus
  `R <= rho * slack_i(xbar0)`, reusing `PiLp.norm_apply_le`.
  The source-slack floor specialization now adds
  `chewi1316_polytopeSlackNegLog_exists_pos_sourceSlackFloor`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`.
  These replace the coordinatewise radius comparison with a single source
  slack floor `sFloor` and scalar side `R <= rho * sFloor`.
  The preferred non-half-contraction actual-budget endpoint now compiles as
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`.
  It feeds the existing source-centered radius initializer with budget
  `B = 1 + rho`, so future geometry only needs a feasible-range radius bound,
  `R <= rho * sFloor`, the finite floor certificate, and
  `sqrt(m) * (1 + rho) <= tailBound`.  The finite floor itself is automatic
  from `hxbar0Range` by Mathlib `Finset.inf'`, `Finset.lt_inf'_iff`, and
  `Finset.inf'_le`.
  The bounded feasible-range specialization now compiles as
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_autoFloor_succ_noFactor_standardConstants`.
  It turns `Bornology.IsBounded` of the translated feasible slack range into a
  source-centered closed-ball radius via Mathlib
  `Bornology.IsBounded.subset_closedBall`, chooses `rho = R / sFloor`, and
  returns existential `sFloor`, `rho`, and `tailBound` with the verified
  main-stage decrement conclusion.
  The bounded range-tail budget packet now exposes the reusable intermediate
  statements:
  `chewi1316_polytopeSlackNegLog_exists_globalSlackRatioBound_of_boundedFeasibleRange`,
  `chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_boundedFeasibleRange`,
  `chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_boundedPolytope`,
  `chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_closedPolytope_isBounded`, and
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedFeasibleRange`.
  These reuse the finite source slack floor and
  `chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_sqrt_mul_of_slackRatio_le`
  to package bounded feasible-range geometry as a global slack-ratio budget,
  a uniform source-gradient range-tail budget, and a filter-eventual actual
  preliminary-path range-tail invariant before calling any final §13.16
  initializer.
  The clean boundedness-to-§13.16 packet now compiles
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedPolytope`,
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_closedPolytope_isBounded`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  These compose the actual-path range-feasibility theorem, the bounded
  range-tail invariant, and the no-prefix `rangeMem_eventuallyRangeTailBound`
  initializer, hiding the internal floor/radius/tail witnesses from ordinary
  §13.16 callers.
  The source-start packet now compiles the converse bridge
  `rangeRestrict_mem_of_polytopeSlackSet` and source-feasible-start variants
  through
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedFeasibleRange_sourceMem`,
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedPolytope_sourceMem`,
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_closedPolytope_isBounded_sourceMem`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  These are the preferred finite-row textbook-facing §13.16 APIs: callers can
  state strict feasibility as `xbar0 ∈ polytopeSlackSet aRow bSlack`.
  The compact source-start packet now compiles compact-envelope variants:
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourceSupersetPolytope_sourceMem`,
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourcePolytope_sourceMem`,
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourceClosurePolytope_sourceMem`,
  `chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactClosedPolytope_sourceMem`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceSupersetPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourcePolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  These route compactness through the existing boundedness lemmas and avoid
  exposing `autoFloor` witnesses to ordinary theorem callers.
  The source-path packaging packet now compiles
  `Chewi1316StandardSourcePreliminaryPath`,
  `Chewi1316StandardSourcePreliminaryPath.rangeRestrict_mem_of_sourceMem`,
  and packaged bounded/compact §13.16 callers:
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  These are the preferred final theorem APIs once the preliminary recurrence
  is packaged as a source path.
  The standard recursive-path packet now compiles
  `chewi1316_standardPreliminaryTSeq`,
  `chewi1316_standardSourcePreliminaryXSeq`,
  `chewi1316_standardSourcePreliminaryPath`, and concrete bounded/compact
  §13.16 callers:
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
  These fix the standard preliminary recursion internally, so final theorem
  callers no longer need raw schedule/recurrence hypotheses or a path object.
  The new preliminary/main-stage handoff packet compiles
  `Chewi1316SourceMainStageObjectiveGapHandoff`,
  `chewi1316_sourceMainStageObjectiveGapHandoff_of_preliminaryInit`,
  `chewi1316_sourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
  `chewi1316_sourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
  `chewi1316_sourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
  and
  `chewi1316_sourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`.
  These are now the active §13.16 bridge from the concrete standard
  preliminary initializer to source-coordinate main-stage objective-gap
  accuracy; remaining work is main-stage assumption packaging, not preliminary
  rework.
  The standard main-stage packet now compiles
  `chewi1316_standardSourceMainStageTSeq`,
  `chewi1316_standardSourceMainStageXSeq`,
  `Chewi1316StandardSourceMainStageObjectiveGapHandoff`,
  `chewi1316_standardSourceMainStageObjectiveGapHandoff_of_sourceMainStageObjectiveGapHandoff`,
  `chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
  `chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
  `chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
  and
  `chewi1316_standardSourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`.
  These fix the standard increasing main-stage schedule and source Newton
  recurrence internally, so subsequent §13.16 work should target the remaining
  analytic certificates rather than path plumbing.
  The membership-reduction packet now compiles
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_of_range_decrement_lt_one`,
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_of_source_decrement_lt_one`,
  `chewi1316_standardSourceMainStage_objective_gap_le_eps_of_source_decrement_lt_one`,
  and
  `chewi1316_standardSourcePreliminaryXSeq_rangeRestrict_mem_of_sourceMem`.
  This reduces the main-stage membership hypothesis to a concrete standard-step
  source decrement `< 1` proof and supplies the standard preliminary
  `hxpre_mem` certificate from strict source feasibility.
  The `lambda <= 1/4` handoff packet now compiles
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_of_range_decrement_le_quarter`,
  `chewi1316_standardSourceMainStage_rangeRestrict_mem_of_source_decrement_le_quarter`,
  and
  `chewi1316_standardSourceMainStage_objective_gap_le_eps_of_source_decrement_le_quarter`.
  This matches the existing self-concordant main-stage invariant theorem and
  removes the strict-inequality conversion from downstream final theorem
  statements.
  The source-space bounded-polytope bridge now compiles as
  `chewi1316_polytopeSlackNegLog_bounded_feasibleRange_of_bounded_polytopeSlackSet`
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_autoFloor_succ_noFactor_standardConstants`.
  It reuses Mathlib `Bornology.IsBounded.image` for `rangeRestrict` and the
  local `polytopeSlackSet_of_rangeRestrict_mem` bridge, so boundedness of the
  original source polytope slack set now feeds the actual §13.16 initializer
  directly.
  The source-facing boundedness packet now compiles
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
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_autoFloor_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_autoFloor_succ_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_autoFloor_succ_noFactor_standardConstants`,
  and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceSupersetPolytope_autoFloor_succ_noFactor_standardConstants`.
  These reuse Mathlib `Metric.isBounded_closedBall`, `IsCompact.isBounded`,
  and `Bornology.IsBounded.subset`, plus `Metric.mem_closedBall`,
  `dist_eq_norm`, `subset_closure`, `isClosed_Iic.preimage`, `innerSL`
  continuity, finite `isClosed_iInter`, and
  `Metric.isCompact_of_isClosed_isBounded`.  The Slater closure packet also
  reuses `mem_closure_iff_seq_limit` and
  `tendsto_one_div_add_atTop_nhds_zero_nat` to prove
  `closure (polytopeSlackSet a b) = closedPolytopeSlackSet a b` from one
  strict feasible point.  This makes closed-ball, distance/norm-radius,
  compact-source, compact-closure, compact-envelope, compact textbook
  closed-polytope, and bounded textbook closed-polytope source assumptions
  direct entrypoints without redoing finite-row closure topology.
  This is the direct entrypoint for compact/bounded feasible-range arguments
  that naturally produce least-upper-bound data; the Mathlib reuse is
  `IsCompact.bddAbove_image`, `BddAbove.mono`, `Set.image_mono`,
  `csSup_le_csSup`, `csSup_le`, `isCompact_closedBall`,
  `PiLp.norm_apply_le`, `Metric.mem_closedBall`, and
  `PiLp.continuous_apply` for coordinates.  Prefer the source-centered
  radius wrapper when the geometry gives a uniform range-subtype radius around
  `(polytopeSlackCLM aRow).rangeRestrict xbar0`; the remaining coordinate
  comparison is just `R <= (B - 1) * slack_i(xbar0)`.  Prefer the
  source-local-norm wrapper when the geometry gives a uniform Dikin radius
  around the source range point; it reuses
  `chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`
  to get slack-ratio budget `1 + r`.  The exact-budget wrapper derives
  nonnegativity from `localNorm_zero` at the source and leaves only
  `sqrt(m) * (1 + r) <= tailBound`.  When geometry is coordinate-relative,
  prove either `||slack_i(y) - slack_i(xbar0)|| <= rho * slack_i(xbar0)` or
  `||slack_i(y) / slack_i(xbar0) - 1|| <= rho`; the new bridge reuses
  `positiveOrthantNegLog_localNorm_le_sqrt_fin_mul_of_coord_abs_le`,
  `positiveOrthant_coord_abs_sub_le_mul_of_relative_abs_sub_le`,
  `barrierAffineRange_localNorm_eq_ambient`, and `Real.norm_eq_abs`, leaving
  only `sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.
  Future selected-index work should reuse the `K+1 <= 49` local-window prefix
  budget, while the global prefix budget remains unsolved.
  The range-Hessian positivity bridge now adds
  `chewi1314_polytopeSlackNegLog_rangeHess_isPositive` and
  `chewi1314_polytopeSlackNegLog_rangeHess_toLinearMap_isPositive`, exposing
  the concrete finite-row range Hessian as a Mathlib positive operator via
  `ContinuousLinearMap.isPositive_iff` and
  `ContinuousLinearMap.isPositive_toLinearMap_iff`.  Search-first spectral result: there was no ready local/mathlib theorem that
  directly constructs the required family from a positive self-adjoint
  continuous linear map, so this lane now uses a local finite-dimensional
  eigenbasis theorem based on Mathlib `LinearMap.IsSymmetric` spectral APIs.
  The inverse-model handoff adds
  `continuousLinearMap_adjointSqrtCoord_inv_eq_of_right_inverse_finiteDim`
  and
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_hess_pointwise`,
  so the range-sqrt selection layer only needs a pointwise Hessian
  square-root factor `H = S†S`; the `invHess = S⁻¹(S⁻¹)†` model follows from
  the compiled range right-inverse identity.  The CLM-to-equivalence adapter
  now adds
  `continuousLinearMap_exists_adjointSqrtCoord_of_adjointSqrt_right_inverse_finiteDim`
  and
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_hessCLM_pointwise`,
  so a continuous-linear-map Hessian factor `H = sqrtH†sqrtH` is enough for
  finite-dimensional invertibility.  The generic local spectral theorem now
  provides that factor from positivity, and the full endpoint
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel` should be reused
  directly.
  The selection wrapper
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_pointwise`
  now compiles, and the source-facing range-sqrt model now compiles as
  `chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`.
  The concrete-consumer packet now instantiates that model inside the
  source-facing standard §13.16 wrappers, adding the no-sqrt-model-assumption
  endpoints
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants`,
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants`, and
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants`.
  The remaining live blocker is the source next-pre-decrement estimate and
  one of the compiled total-mass/geometric/contracting budget interfaces.
  The actual-budget packet names the real source next-pre-decrement sequence
  as `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget` and adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementContractingBudget_noFactor_standardConstants`.
  The selected-tail actual-budget bridge additionally adds
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
  Its thresholded sibling
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`
  and post-threshold sibling
  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`
  are the preferred entrypoints for post-burn-in tail invariants.  The
  preferred next proof targets are now the valid actual doubled contraction
  and a moving-center/bounded-polytope post-threshold range-tail estimate.
  Source-pullback decrement, scalar constants,
  successor membership, source-radius-half, and the exposed range one-step
  invariant are no longer the live gates; range recurrence and range
  pre-decrement are now transported from source-coordinate assumptions.  A
  direct source one-step proof should use the source canonical/standard handoffs
  instead of re-entering the range wrapper stack.
- Archived Chapter 13 context before later §13.16 packets: Chewi Example 13.14's arbitrary finite-row
  logarithmic barrier route is compiled via the concrete range inverse
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeInvHess`, and
  Chewi Lemma 13.15 now has compiled Cauchy-to-square and segment reciprocal
  wrappers.  Reusable declarations include `localNorm_neg`,
  `abs_inner_le_dualLocalNorm_mul_localNorm_of_cauchy`,
  `inner_sq_le_dualLocalNorm_sq_mul_localNorm_sq_of_cauchy`,
  `abs_inner_le_sqrt_mul_localNorm_of_one_sided_cauchy`,
  `inner_sq_le_mul_hessian_of_one_sided_cauchy`,
  `chewi1315_gradient_inner_sq_le_of_cauchy`, and
  `chewi1315_polytopeSlackNegLog_range_gradient_inner_sq_le`, plus
  `scalar_initial_le_of_sq_le_mul_deriv_on_unit_interval`,
  `hessianSegmentGradientInner_hasDerivWithinAt_of_hasFDerivAt`,
  `hessianSegmentGradientInner_continuousOn_of_convex`,
  `chewi1315_segment_inner_le_of_sq_deriv`,
  `chewi1315_gradient_segment_inner_le_of_cauchy`, and
  `chewi1315_gradient_segment_inner_le_of_cauchy_continuousOn`, plus the
  positive-orthant concrete instantiation `positiveOrthantNegLogGrad_continuousOn`
  and `chewi1315_positiveOrthantNegLog_gradient_segment_inner_le`.  The
  newest affine transport packet adds
  `barrierAffinePreimageGrad_hasFDerivAt`,
  `convex_barrierAffineRangeSet`, `barrierAffineRangeGrad_hasFDerivAt`,
  `barrierAffineRangeGrad_continuousOn_of_hasFDerivAt`,
  `chewi1315_polytopeSlackNegLog_range_gradient_segment_inner_le`, and
  `chewi1315_polytopeSlackNegLog_gradient_segment_inner_le`, closing Lemma
  13.15(2) for arbitrary finite-row polytope logarithmic barriers when
  `0 < m`.
- Archived Chapter 13 route log: use the compiled Lemma 13.15 wrappers in the
  path-following decrement recurrence and central-path barrier-parameter
  estimates.  The newest Lemma 13.16 assembly packet adds
  `real_le_div_one_sub_of_sq_div_one_add_le_mul`,
  `chewi1316_localNorm_le_decrement_div_one_sub`,
  `chewi1316_central_objective_gap_le`,
  `chewi1316_objective_gap_to_center_le`, and
  `chewi1316_objective_gap_le`, closing the supplied-interface objective-gap
  estimate from the source proof.  The reciprocal-derivative/sign step,
  affine/range gradient-continuity/differentiability transport, and Lemma
  13.16 algebra are no longer blockers.  Next target: the main-stage update
  invariant for `lambda <= 1/4` under
  `t_{n+1} = (1 + c0 / sqrt nu) * t_n` and one Newton step.  The newest
  main-stage algebra packet adds
  `chewi1316_preNewtonDecrement_le_update_bound`,
  `real_mainStage_newton_fraction_le_quarter`, and
  `chewi1316_mainStage_newtonDecrement_le_quarter`, closing the scalar
  `c0 <= 1/16` post-Newton algebra and the supplied dual-norm-interface
  pre-Newton update bound.  The newest dual-norm interface packet adds
  `dualLocalNorm_eq_adjointCoord_norm_of_factor`,
  `dualLocalNorm_add_le_of_adjointCoordFactor`,
  `dualLocalNorm_smul_of_adjointCoordFactor`,
  `chewi1316_preNewtonDecrement_le_update_bound_of_adjointCoordFactor`, and
  `chewi1316_preNewtonDecrement_le_update_bound_of_adjointSqrt_right_inverse`,
  discharging the triangle/homogeneity gate from the same right-inverse plus
  square-root-coordinate model used in the Theorem 13.8 route.  The newest
  main-stage invariant packet adds
  `chewi1316_preNewtonDecrement_le_update_bound_of_gradientUpdate_adjointSqrt_right_inverse`,
  `chewi1316_mainStage_newtonDecrement_le_quarter_of_gradientUpdate_and_newtonBound`,
  and
  `chewi1316_mainStage_newtonDecrement_le_quarter_of_sqrtCoordFamilyModel_sourceNewtonSegment`.
  It packages the source gradient-update equation, the pre-Newton bound, and
  the compiled Theorem 13.8 Newton-step wrapper into the invariant
  `lambda <= 1/4 -> lambda_next <= 1/4`.  The newest central-path algebra
  packet adds `centralPathGradient_update_eq`,
  `centralPathGradient_update_eq_of_tNext`,
  `chewi1316_preNewtonDecrement_le_update_bound_of_centralPathGradient_adjointSqrt_right_inverse`,
  and
  `chewi1316_mainStage_newtonDecrement_le_quarter_of_centralPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
  This discharges the algebraic `t_next = (1 + delta) * t` gradient-update
  rewrite for objectives with gradient `t • a + grad phi(x)`.  The newest
  positive-orthant central-path packet adds `centralPathGrad`,
  `centralPathGrad_hasFDerivAt`, `newton_linear_of_hessian_right_inverse`,
  `positiveOrthantCentralPathGrad_hasFDerivAt`,
  `positiveOrthantCentralPathGrad_segment_hasFDerivAt`,
  `positiveOrthantCentralPathGrad_newton_linear`, and
  `positiveOrthantNegLog_dualLocalNorm_grad_le_sqrt_card`.  It discharges the
  positive-orthant central-path objective differentiability, segment
  differentiability, Newton linearization, and barrier-gradient norm bound.
  The newest feasible-step packet adds
  `positiveOrthant_mem_of_localNorm_sub_lt_one`,
  `positiveOrthant_mem_of_mem_dikinEllipsoid_one`,
  `positiveOrthant_newtonStep_mem_of_newtonDecrement_lt_one`, and
  `positiveOrthantCentralPathGrad_newtonStep_mem_of_decrement_lt_one`.  It
  proves that positive-orthant Dikin radius-one membership, and hence a
  positive-orthant Newton step with decrement `< 1`, stays feasible.  The
  newest positive-orthant main-stage assembly packet adds
  `chewi1316_positiveOrthant_preNewtonDecrement_le_update_bound`,
  `chewi1316_positiveOrthant_preNewtonDecrement_lt_one`,
  `chewi1316_positiveOrthant_mainStage_step_mem`,
  `chewi1316_positiveOrthant_mainStage_decrement_le_quarter`, and
  `chewi1316_positiveOrthant_mainStage_step_mem_and_decrement_le_quarter`.
  This closes the selected central-path one-step invariant for the finite
  positive orthant.  The newest scalar iteration packet adds
  `chewi1316_mainStageParameter_eq_pow_mul`,
  `chewi1316_mainStageParameter_eq_pow_mul_of_delta`, and
  `chewi1316_mainStageParameter_pos_of_pos`, closing the source closed form
  for multiplicative `t_n` growth.  The newest objective-gap stopping packet
  adds `chewi1316_objectiveGapNumerator_le_two_mul`,
  `chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t`, and
  `chewi1316_objective_gap_le_eps_of_mainStageParameter_large`, proving the
  source stopping rule once the closed-form `t_N` is large enough.  The newest
  preliminary-stage packet adds
  `chewi1316_preliminaryStageParameter_eq_pow_mul_of_delta`,
  `chewi1316_preliminaryStageParameter_pos_of_pos`,
  `centralPathGradient_decrease_eq`,
  `centralPathGradient_decrease_eq_of_tNext`, `preliminaryPathDirection`,
  `preliminaryPathGrad`, endpoint identities and zero-decrement wrappers for
  `t = 1` and `t = 0`, `preliminaryPathGrad_hasFDerivAt`, and
  `preliminaryPathGradient_decrease_eq_of_tNext`.  The latest verified
  preliminary invariant packet adds the decreasing-update pre-Newton bounds and
  source-shaped post-Newton wrappers:
  `chewi1316_preNewtonDecrement_le_decrease_bound`,
  `chewi1316_preNewtonDecrement_le_decrease_bound_of_preliminaryPathGradient_adjointSqrt_right_inverse`,
  `chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_gradientDecrease_and_newtonBound`,
  `chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_sqrtCoordFamilyModel_sourceNewtonSegment`,
  and
  `chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_preliminaryPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
  The exact-center main-stage bridge adds `centralPathGrad_at_analyticalCenter`
  and the four `chewi1316_mainStage_initial_decrement_le_quarter_of_analyticalCenter*`
  wrappers, reducing exact-center initialization to the scaled dual-norm bound
  `|t| * ||a||*_center <= 1/4`.  The latest preliminary-to-main bridge adds
  `barrierGrad_dualLocalNorm_le_of_preliminaryPath`,
  `barrierGrad_dualLocalNorm_le_of_preliminaryPath_adjointCoordFactor`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_barrierGrad_and_objective`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_bound_adjointCoordFactor`,
  converting a final preliminary decrement plus small preliminary/main scaled
  dual-norm budgets into the main-stage `lambda <= 1/4` initialization.
  The finite sequence layer adds `preliminaryPath_decrement_bound_of_step`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm`,
  carrying a preliminary decrement budget sequence by induction and rewriting
  `t_N = (1 - c0 / sqrt nu)^N * tStart`.  The latest log-count packet adds
  `chewi1316_preliminary_budget_le_quarter_of_split`,
  `chewi1316_preliminary_tail_le_of_half_power_log`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_split`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_logTail`.
  This reuses the existing Chapter 5 scalar theorem
  `chewi54_half_pow_mul_le_eps_of_log_ratio_le` instead of reproving the
  logarithmic halving algebra.  The factor-count packet adds
  `chewi1316_preliminary_tail_half_power_bound_of_factor_pow`,
  `chewi1316_preliminary_tail_half_power_bound_of_nonneg_factor_pow`,
  `chewi1316_factor_pow_le_half_pow_of_log_le`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_absFactorPowLogTail`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorPowLogTail`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorLogTail`.
  The count-discharge packet adds
  `chewi1316_factorLog_le_halfLog_of_count`,
  `chewi1316_factor_pow_le_half_pow_of_count`,
  `chewi1316_count_condition_of_sqrt_mul_log_le`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorCountTail`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTail`.
  These reduce the preliminary tail gate to source-shaped scalar inequalities
  on `1 - c0 / sqrt nu`: positivity, the textbook-shaped count
  `M log 2 * sqrt nu <= N c0`, and the remaining
  `tailBase = |tStart| * ||grad phi(xbar0)||*` log budget.  The tail-base
  packet adds `chewi1316_tailBase_log_budget_of_le_pow` and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBound`,
  discharging the log budget from the plain power bound
  `|tStart| * ||grad phi(xbar0)||* <= (1/16) * 2^M`.  The log-choice packet
  adds `chewi1316_tailBase_le_sixteenth_mul_two_pow_of_log_le`,
  `chewi1316_tailBase_le_sixteenth_mul_two_pow_of_bound_log_le`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailLogBound`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound`.
  Thus `M` can now be chosen from a logarithmic upper bound on any convenient
  source tail bound.  The integer-choice layer adds
  `chewi1316_exists_nat_mul_log_two_ge`,
  `chewi1316_exists_nat_mul_pos_ge`,
  `chewi1316_exists_tailBound_log_index`,
  `chewi1316_exists_preliminary_count_index`, and
  `chewi1316_exists_preliminary_tail_log_count_indices`, proving that natural
  indices `M,N` exist for the log-tail and `M log 2 * sqrt nu <= N c0` count
  budgets whenever `tailBound > 0` and `c0 > 0`.  The nonnegative-tail packet
  adds `chewi1316_preliminary_tail_le_of_half_power_tailBase_bound`,
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBound_nonneg`,
  and
  `chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound_nonneg`,
  removing the need to prove the actual preliminary tail base is strictly
  positive.  The positive-main-parameter packet adds
  `chewi1316_exists_pos_abs_mul_le_sixteenth`,
  `chewi1316_exists_positive_mainStageParameter_budget`, and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound_nonneg`,
  discharging the `|tMain| * ||a||* <= 1/16` scalar budget by choosing a small
  positive `tMain`.  The source-start packet adds
  `preliminaryPath_initial_decrement_le_of_start_one_self` and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_factorSqrtCountTailBoundLogBound_nonneg`,
  discharging the preliminary initial decrement from the canonical start
  `tseq 0 = 1`, `xseq 0 = xbar0`.  The measured-tail fallback packet adds
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredTailLogBound`,
  using the automatic positive upper bound
  `||grad phi(xbar0)||*_{x_N} + 1` for the preliminary tail base.  Remaining
  gate: replace this measured fallback with the concrete Chewi/Nesterov bound
  on `||grad phi(xbar0)||*` by a source quantity such as the analytical-center
  distance measure, then finish the strictly-feasible-start discussion.
  The reverse preliminary-gradient packet adds
  `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath`,
  `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_adjointCoordFactor`,
  `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_barrier`,
  `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_adjointCoordFactor`,
  and `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_barrier`.
  These prove the source-side triangle bound
  `|t_N| * ||grad phi(xbar0)||*_{x_N} <= sqrt(nu) + lambda_N` from the
  preliminary residual plus the self-concordant barrier gradient bound, reusing
  the existing adjoint-coordinate dual-norm additivity/homogeneity layer.
  The final-tail initialization packet adds
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_sourceStart_tailBudget`
  and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBudget`.
  These are the direct source-start wrappers for the actual scaled preliminary
  tail budget `|t_N| * ||grad phi(xbar0)||*_{x_N} <= 1/16`, avoiding the older
  measured unscaled-tail fallback when a Chewi/Nesterov estimate controls the
  final scaled tail directly.  The extracted final-tail packet adds
  `chewi1316_preliminary_final_tail_le_sixteenth_of_factorSqrtCountTailBound_nonneg`,
  `chewi1316_preliminary_final_tail_le_sixteenth_of_factorSqrtCountTailBoundLogBound_nonneg`,
  and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBoundLogBound`,
  factoring the count/log scalar algebra into a reusable final-tail budget and
  routing the source-start initialization through the direct final-tail wrapper.
  The uniform-tail packet adds
  `chewi1316_exists_preliminary_final_tail_budget_indices_of_uniformTailBound`
  and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformTailBound`,
  choosing the preliminary log/count indices internally from any positive
  uniform source tail bound and positive `c0`.  The inverse-Hessian transport
  layer adds `chewi1316_uniformTailBound_of_inverseHessianQuadraticUpper` and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_inverseHessianQuadraticUpper`,
  so a source-point dual-norm budget and one uniform quadratic upper comparison
  now produce the uniform source tail bound needed by the initialization
  wrapper.  The local-norm duality layer adds
  `chewi1316_uniformTailBound_of_dualLocalNormUpper`,
  `chewi1316_uniformTailBound_of_localNormLower_and_inverseIdentity`, and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_localNormLower_and_inverseIdentity`,
  so the same source-start initialization can now be driven by the
  self-concordant local-norm lower comparison shape plus inverse-local and
  Cauchy identities.  The segment-stability layer adds
  `chewi1316_uniformTailBound_of_hessianSegmentExponentialBounds_and_inverseIdentity`
  and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_hessianSegmentExponentialBounds_and_inverseIdentity`,
  so compiled Lemma 13.6-style `HessianSegmentExponentialBounds` certificates
  plus a uniform denominator budget now drive the same source-start
  initialization route.  The mixed-third certificate layer adds
  `chewi1316_uniformTailBound_of_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`
  and
  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`,
  so the source-radius `HessianSegmentMixedThirdLocalNormCertificate` sequence
  can now feed preliminary initialization directly.  The source-start successor
  layer adds
	  `chewi1316_sourceTailBound_of_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`,
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_and_inverseIdentity`,
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_and_inverseIdentity`,
	  handling `xseq 0 = xbar0` separately and using source-radius segment
	  certificates only on successor indices.  The newest uniform-radius successor
	  bridge adds
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_and_inverseIdentity`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_and_inverseIdentity`,
	  replacing per-successor denominator work by one global radius bound,
	  `M*radiusBound < 1`, and `den <= 1 - M*radiusBound`.  The newest
	  scalar-budget shrink adds the budget/canonical-denominator consumers
	  `sourceBound_le_tailBound_of_div_budget`,
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_budget_and_inverseIdentity`,
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_and_inverseIdentity`,
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_budget_and_inverseIdentity`,
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_and_inverseIdentity`.
	  The zero-displacement-safe packet adds
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_and_inverseIdentity`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_and_inverseIdentity`,
	  so equal-to-source successors no longer require a nonzero segment
	  certificate.  The global-derivative packet adds
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_globalDeriv_and_inverseIdentity`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_globalDeriv_and_inverseIdentity`,
	  deriving all per-successor segment derivative oracles from a single
	  domain-wide Hessian derivative and mixed-third identity package.  The
	  barrier-interface packet adds
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  `chewi1316_uniformTailBound_of_sourceRadius_successor_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	  These consume `SelfConcordantBarrierOn` directly and expose the common
	  unit-radius-half scalar budget as `2 * sqrt(nu) <= tailBound`.  The
	  source-radius telescope packet adds
	  `localNorm_eq_norm_of_adjointSqrt`,
	  `localNorm_add_le_of_adjointSqrt`,
	  `localNorm_sum_le_sum_localNorm_of_adjointSqrt`,
	  `sequence_sub_initial_eq_sum_steps_of_succ_sub`,
	  `sequence_sub_initial_eq_sum_steps_of_succ_eq_add`,
	  `sourceRadius_le_of_sum_steps_of_adjointSqrt`,
	  `sourceRadius_successor_bound_of_sum_steps_of_adjointSqrt`,
	  `sourceRadius_successor_bound_of_succ_sub_steps_of_adjointSqrt`,
	  `sourceRadius_successor_bound_of_add_steps_of_adjointSqrt`,
	  the corresponding radius-half specializations, and
	  `chewi1316_uniformTailBound_of_add_steps_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	  The existential source-start lift now also compiles as
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_addSteps_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  so the additive step recurrence plus cumulative half-radius budget feeds
	  directly into the positive-main-stage initialization theorem.
	  The direct local-step-sum packet adds
	  `sourceRadius_successor_half_of_add_steps_sumLocalNorm_of_adjointSqrt`,
	  `chewi1316_uniformTailBound_of_add_steps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_addSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  replacing the auxiliary `stepBound` function by the textbook-shaped
	  cumulative budget
	  `sum_{n<=N} ||steps n||_{xbar0} <= 1/2`.
	  The preliminary-Newton packet adds
	  `sourceRadius_successor_half_of_newtonSteps_sumLocalNorm_of_adjointSqrt`,
	  `chewi1316_uniformTailBound_of_preliminaryNewtonSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  so callers can provide the algorithmic recurrence
	  `x_{n+1} = NewtonStep(preliminaryPathGrad(t_n), x_n)` directly.
	  The current-local budget packet now also compiles:
	  `localNorm_source_le_two_current_of_sourceRadius_half`,
	  `sourceLocalNorm_sum_newtonSteps_le_half_of_currentLocalNorm_budget`,
	  `chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	  This inductively transports each current-local Newton displacement to the
	  source metric using Chewi Lemma 13.6 and replaces the raw source-local
	  cumulative hypothesis by `sum_{n<=N} 2 * lambda_n <= 1/2` plus the
	  current-local/Newton-decrement identities.  The right-inverse cleanup adds
	  `chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_hessianRightInverse`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_hessianRightInverse`,
	  deriving both the inverse-local identity and the Newton-step
	  local-norm/decrement identity from
	  `hess(x_n) (invHess(x_n) v) = v`.  The square-root-coordinate family layer
	  now adds
	  `chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`.
	  These derive the source Hessian factorization, inverse-Hessian
	  right-inverse, and dual quadratic factorization from
	  `sqrtCoord N : E ≃L[ℝ] E` plus the representation
	  `invHess(x_n) = sqrtCoord_n.symm ∘ sqrtCoord_n.symm†`.  The
	  non-vacuous successor-index cleanup now adds
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformTailBound_tailLambdaBudget`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	  This records and fixes a route issue in the older existential wrappers:
	  `1/4 <= lambdaSeq 0` plus global `lambdaSeq N <= 1/8` is inconsistent at
	  `N = 0`; the new wrappers select a successor final index and require only
	  `lambdaSeq (N+1) <= 1/8`.  The sharper preliminary-stage invariant packet
	  adds `real_mainStage_newton_fraction_le_eighth`,
	  `chewi1316_mainStage_newtonDecrement_le_eighth`,
	  `chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_gradientDecrease_and_newtonBound`,
	  `chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_sqrtCoordFamilyModel_sourceNewtonSegment`,
	  and
	  `chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_preliminaryPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`,
	  deriving the successor `1/8` budget from the existing Theorem 13.8
	  Newton-step pipeline when `c0 <= 1/200`.  The next-parameter sequence
	  bridge adds
	  `chewi1316_preliminaryPath_decrement_step_le_eighth_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`
	  and
	  `chewi1316_preliminaryPath_lambdaSeq_step_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`,
	  producing the reusable `hdecrement_step` interface for the source update
	  `x_{n+1} = newtonStep (grad f_{t_{n+1}}) x_n` and recording that the
	  old-parameter Newton recurrence is not the exact textbook indexing.
	  The correct-index source-tail packet adds
	  `chewi1316_uniformTailBound_of_preliminaryNextNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	  It reuses the generic source-radius engine with
	  `gradSeq n = grad f_{t_{n+1}}` and separates the pre-Newton displacement
	  `stepBudget` from the residual budget sequence `lambdaSeq`, avoiding the
	  old wrong-index shortcut.
	  The pre-decrement-budget cleanup adds
	  `chewi1316_uniformTailBound_of_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	  and
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	  These derive the local step norm from
	  `lambda_{f_{t_{n+1}}}(x_n)` via the compiled right-inverse
	  local-norm/decrement identity, so raw local-norm bounds are no longer the
	  live interface.
	  The pre-decrement pointwise bridge adds
	  `chewi1316_preliminaryPath_preDecrementNext_le_stepBudget_of_residual_quarter_sqrtCoordFamily`,
	  deriving the next-parameter pre-Newton decrement budget from the old
	  residual `<= 1/4`, the decreasing `t` update, and the
	  square-root-coordinate inverse-Hessian model.  The same run also adds
	  `chewi1316_preDecrementStepBudget_lower_incompatible_with_sourceBudget`,
	  formally showing that this constant-level bound cannot be used as a
	  global source-radius prefix-sum budget when `c0 >= 0`: two steps already
	  contradict the `1/2` source budget.  The live blocker is therefore not
	  another wrapper around this route, but a sharper preliminary
	  radius/telescoping argument or an analytical-center distance bound.
	  The newest correct-index source-start consumer adds
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordModel`.
	  It instantiates the internal residual budget sequence as `1/4` at the
	  source start and `1/8` on successor indices, derives the decrement-step
	  premise from
	  `chewi1316_preliminaryPath_lambdaSeq_step_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`,
	  and derives the source Cauchy/right-inverse data from the domain-wide
	  adjoint-square model.  The remaining live quantitative hypothesis is still
	  the genuinely nontrivial summable next-parameter pre-Newton decrement
	  budget `sum 2 * stepBudget <= 1/2`; the old constant pointwise route is
	  still ruled out by the incompatibility theorem.
	  The concrete positive-orthant source-start consumer now also compiles as
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_preDecrementBudget`.
	  It specializes the correct-index initialization route to the finite
	  positive-orthant logarithmic barrier, reusing the existing sqrt-coordinate
	  model, inverse-Hessian model, self-concordant barrier instance, Hessian
	  differentiability, mixed-third identity, and convex segment membership.
	  No new quantitative shortcut is assumed: the next live gate remains the
	  summable pre-Newton budget or an analytical-center/source-radius estimate
	  strong enough to imply it.
	  The direct analytical-center route now compiles too:
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadiusHalf_barrier_globalDeriv_and_sqrtCoordModel`
	  and
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_sourceRadiusHalf`.
	  This removes the need to package the radius route through a fake
	  summable budget; future work should prove the concrete preliminary-path
	  source-radius-half certificate itself.
	  The newest coordinate-radius packet makes that certificate more concrete:
	  `euclideanSpace_norm_le_sqrt_fin_mul_of_abs_coord_le`,
	  `positiveOrthantNegLog_localNorm_le_sqrt_fin_mul_of_coord_abs_le`,
	  `positiveOrthantNegLog_sourceRadiusHalf_of_coord_abs_le_inv_two_sqrt`,
	  and
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_coordRadiusHalf`
	  reduce the finite positive-orthant source-radius gate to the coordinate
	  inequalities
	  `|xseq (N+1) i - xbar0 i| <= (1/(2*sqrt d))*xbar0 i`.
	  The new scalar recurrence layer
	  `positiveOrthant_preliminaryPathGrad_apply_coord`,
	  `positiveOrthant_preliminaryPath_newtonStep_apply`,
	  `positiveOrthant_coord_abs_sub_le_mul_of_relative_abs_sub_le`,
	  `chewi1316_positiveOrthant_preliminaryNextNewtonStep_coord_eq`,
	  `chewi1316_positiveOrthant_preliminaryNextNewtonStep_relativeCoord_eq`,
	  and
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_relativeCoordRadiusHalf`
	  now reduces the next gate to bounding
	  `|xseq (N+1) i / xbar0 i - 1|` from the scalar recurrence
	  `y_{n+1}=2*y_n-tseq(n+1)*y_n^2`.
	  The obstruction/consequence layer
	  `scalar_sequence_linear_lower_bound_of_step`,
	  `scalar_radius_bound_forces_linear_step_count`, and
	  `chewi1316_relativeCoordRadiusHalf_forces_count_bound_of_linear_growth`
	  proves that if the relative coordinate has linear lower growth
	  `>= c0/sqrt d`, then relative-radius-half implies `(N+1)*c0 <= 1/2`.
	  This is a verified warning that the all-prefix source-radius route should
	  be treated as a finite-window certificate unless a different moving-center
	  argument is supplied.
	  The selected-index source-radius wrapper
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_selectedSourceRadiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`
	  now compiles.  It avoids the suspect global `forall N` hypothesis by
	  taking explicit `M,N` log/count budgets plus only the radius-half
	  certificate at the selected preliminary index, then proving the local
	  source-tail estimate from `SelfConcordantBarrierOn`, global Hessian
	  derivative/mixed-third data, inverse-local identity, source Cauchy, and
	  `2 * sqrt(nu) <= tailBound`.
	  The selected route is now concrete for the finite positive orthant via
	  `chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_selectedSourceRadiusHalf_barrier_globalDeriv_and_sqrtCoordModel`,
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedSourceRadiusHalf`,
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedCoordRadiusHalf`,
	  and
	  `chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedRelativeCoordRadiusHalf`.
	  The remaining positive-orthant radius task is finite-window scalar:
	  prove `|xseq N i / xbar0 i - 1| <= 1/(2*sqrt d)` for the selected
	  positive index `N` and combine it with the explicit log/count budgets.
	  The newest scalar route check adds
	  `scalar_newton_decreasing_parameter_step_lower`,
	  `chewi1316_positiveOrthant_preliminaryNextNewtonStep_relativeCoord_linear_lower`,
	  `chewi1316_selectedRelativeCoordRadiusHalf_forces_count_bound_of_preliminaryNextNewton`,
	  and
	  `chewi1316_selectedRelativeCoordRadiusHalf_and_count_force_logIndex_bound`.
	  These prove for the actual preliminary Newton recurrence that selected
	  relative-radius plus the count budget forces
	  `M * log 2 * sqrt d <= 1/2`.  This is now a verified proof-route
	  obstruction: the selected source-radius certificate cannot support the
	  textbook-scale log/count choice except in a tiny window, so future §13.16
	  work should move to a moving-center/local-metric argument or another
	  source-tail estimate.
	  The moving-coordinate source-tail route now starts with
	  `positiveOrthantNegLog_sourceGrad_dualLocalNorm_eq_norm_relative` and
	  `positiveOrthantNegLog_sourceGrad_tailBudget_of_scaled_relative_le`.
	  These identify the positive-orthant source-gradient dual norm with the
	  Euclidean norm of `x_i / xbar0_i`, and show that the direct final-tail
	  budget follows from scaled relative bounds
	  `|t| * |x_i / xbar0_i| <= 1/(16*sqrt d)`.
	  The newest scaled-relative obstruction packet adds
	  `scalar_newton_decreasing_parameter_product_ge_half`,
	  `chewi1316_positiveOrthant_preliminaryNextNewtonStep_scaled_relative_ge_half`,
	  and
	  `chewi1316_positiveOrthant_scaledRelativeTailBudget_forces_half_le`.
	  For the actual preliminary Newton recurrence with
	  `c0/sqrt d <= 1/200`, it proves
	  `1/2 <= |t_N| * |x_N i / xbar0_i|`, so imposing the direct
	  positive-orthant scaled-tail gate
	  `|t_N| * |x_N i / xbar0_i| <= 1/(16*sqrt d)` forces
	  `1/2 <= 1/(16*sqrt d)`.  Thus the pure positive-orthant scaled-tail
	  certificate is also a diagnostic obstruction rather than the final
	  textbook-scale §13.16 route; the next proof route should use a true
	  moving-center/local-metric certificate or a bounded-polytope source-tail
	  argument.  Search-first result: no existing mathlib/local theorem
	  matched this scalar product invariant; reuse remains the compiled
	  positive-orthant coordinate recurrence plus elementary real algebra.
	  The newest affine/range source-tail transport packet adds
	  `barrierAffinePreimageAdjointDualLocalNorm_rightInverse_eq`,
	  `barrierAffinePreimageSourceGradientDualLocalNorm_rightInverse_eq`,
	  `barrierAffineRangeSourceGradientDualLocalNorm_surjective_eq`,
	  `chewi1314_polytopeSlackNegLog_sourceGrad_dualLocalNorm_rangeInvHess_eq`,
	  and
	  `chewi1314_polytopeSlackNegLog_scaled_sourceGrad_dualLocalNorm_rangeInvHess_eq`.
	  These move the §13.16 source-gradient tail from the original polytope
	  variable space into the finite slack-range inverse-Hessian metric at the
	  current point, so the next bounded-polytope packet can prove the actual
	  source-tail estimate in range/slack coordinates instead of reusing the
	  false positive-orthant source-radius or scaled-tail routes.
	  The newest range-tail consumer packet adds
	  `chewi1314_polytopeSlackNegLog_rangePullInvHess` and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeTailBudget`.
	  It packages the exact §13.16 source-start handoff for finite-row
	  polytope logarithmic barriers: once the closed-form scaled source tail is
	  proved in the slack-range inverse-Hessian metric, positive main-stage
	  initialization follows from the existing source-start theorem.  The live
	  blocker is now the genuine bounded-polytope range-tail estimate, not
	  affine transport or main-stage initialization plumbing.
	  The newest uniform range-tail handoff packet adds
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformRangeTailBound_tailLambdaBudget`.
	  It reuses the scalar log/count index chooser and successor
	  `lambda <= 1/8` route, so a single uniform slack-range source-tail bound
	  now implies the positive main-stage initialization theorem for finite-row
	  polytope logarithmic barriers.  The next proof target is the actual
	  uniform range-tail estimate in bounded-polytope geometry.
	  The newest range-preliminary-Newton packet adds
	  `chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_globalDeriv_and_sqrtCoordFamily`
	  and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	  These instantiate the existing generic correct-index source-tail theorem
	  directly on the finite slack range and assemble it back to positive
	  main-stage initialization.  The direct source-radius handoff packet adds
	  `chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_zeroSafe_globalDeriv_and_inverseIdentity`
	  and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_zeroSafe_globalDeriv_and_inverseIdentity_tailLambdaBudget`.
	  It gives a lighter route to the same finite-row polytope initialization:
	  supply range source-radius-half, source-point Cauchy, successor
	  membership, and the global range Hessian derivative package directly.
	  The source-only square-root packet adds
	  `chewi1314_polytopeSlackNegLog_range_sourceCauchy_of_adjointSqrtCoord`,
	  `chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_zeroSafe_globalDeriv_and_sourceSqrtCoord`, and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_zeroSafe_globalDeriv_and_sourceSqrtCoord_tailLambdaBudget`,
	  discharging source-point Cauchy from a source-only adjoint-square
	  factorization.  The remaining §13.16 work is now concrete range geometry,
	  not scalar log/count or affine transport plumbing.
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
	  This removes the global range Hessian derivative/mixed-third assumptions
	  from the direct source-radius route by transporting the positive-orthant
	  logarithmic-barrier Hessian derivative through the affine slack range.
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
	  This removes the source-point square-root-coordinate/factorization
	  assumption from the direct range source-radius route by proving the
	  needed source Cauchy bridge from strict range Hessian positivity and the
	  concrete range inverse-Hessian right-inverse.
	  The direct dual-seminorm/no-factor packet adds
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
	  This removes the pulled-back inverse-Hessian factorization gate from the
	  direct §13.16 slack-range handoff by deriving final-point
	  triangle/homogeneity from the concrete range right-inverse.
	  Search-first reuse:
	  local
	  `chewi136_localNorm_sandwich_sourceRadius`,
	  `hessianPrimalFactor_of_adjointSqrt`,
	  `localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse`,
	  `localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse`,
	  `hessianRightInverse_of_adjointSqrtCoord_invHess`,
	  `inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse`,
	  `newton_linear_of_hessian_right_inverse`, and mathlib `norm_add_le`,
	  `norm_sum_le`, and `Finset.sum_range_sub`.  The range-successor packet
	  adds `barrierAffineRange_localNorm_eq_ambient`,
	  `barrierAffineRangeSet_mem_of_localNorm_sub_lt_one_positiveOrthant`,
	  `chewi1314_polytopeSlackNegLog_range_newtonStep_mem_of_decrement_lt_one`,
	  `chewi1316_polytopeSlackNegLog_range_successor_mem_of_preliminaryNextNewtonSteps_preDecrementBudget`,
	  `chewi1316_polytopeSlackNegLog_rangeRestrict_successor_mem_of_preliminaryNextNewtonSteps_preDecrementBudget`, and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor_of_preliminaryNextNewtonSteps`.
	  The no-square-root radius packet adds
	  `localNorm_sum_le_sum_localNorm_of_hessian_pos`,
	  `sourceRadius_le_of_sum_steps_of_hessian_pos`,
		  `sourceRadius_successor_half_of_newtonSteps_currentLocalNorm_budget_hessian_pos`,
		  `chewi1316_polytopeSlackNegLog_rangeSourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`,
		  `chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`, and
		  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor_of_preliminaryNextNewtonSteps_preDecrementBudget`.
		  Range source-radius-half and successor membership are now both
		  discharged from the compiled range preliminary-next-Newton recurrence
		  plus summable pre-decrement budget.  The selected finite-window packet
		  adds `scaledPrefixBudget_le_of_selectedPrefixBudget`,
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
			  The sharper finite-window slack-ratio packet adds
			  `chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRatio_three_halves_length_le_twenty_five` and
			  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_twenty_five_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
			  The newest scalar sharpening extends the same slack-ratio route through
			  `chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRatio_three_halves_length_le_forty_nine` and
			  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_length_le_forty_nine_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
			  This consumes the honest actual quadratic finite-window prefix budget
			  under `N + 1 <= 49` all the way to the main-stage initializer, with
			  verified tail constant `sqrt(m) * 3/2`; do not restart the global
			  prefix-budget or half-contraction route.  Next live §13.16 target is the
			  moving-center range-tail/count estimate that removes the short-window
		  restriction, or a valid long-window decay argument for the actual
		  next-pre-decrement sequence.  The canonical scalar packet adds
		  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_canonicalLambda`
		  and
		  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants`,
	  fixing the auxiliary lambda sequence, `c0 = 1/200`, and
	  `tailBound = 2 * sqrt m`.  The range-preliminary transport packet adds
	  `barrierAffinePreimage_preliminaryPathGrad_eq`,
	  `barrierAffineRange_preliminaryPathGrad_dualLocalNorm_surjective_eq`,
	  `chewi1314_polytopeSlackNegLog_preliminaryPath_newtonDecrement_rangePull_eq`,
	  `chewi1316_polytopeSlackNegLog_rangePull_decrement_step_le_eighth_of_range_decrement_step`, and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeDecrement`.
	  The range sqrt-coordinate wrapper adds
	  `chewi1314_polytopeSlackNegLog_range_selfConcordantBarrierOn`,
	  `chewi1316_polytopeSlackNegLog_range_decrement_step_le_eighth_of_nextNewton_sqrtCoordModel`, and
	  `chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
	  The source-pullback preliminary decrement shape and the one-step
	  invariant are no longer live blockers once a point-dependent domain-wide
	  range Hessian/inverse-Hessian sqrt-coordinate family is supplied.  The
	  new source-transport wrappers remove the concrete range recurrence and
	  range pre-decrement gates when the source-coordinate Newton recurrence
	  and source pre-decrement budget are supplied.  The remaining
	  exact-source gates are the summable source next pre-decrement budget and
	  the range sqrt-coordinate family itself (or an equivalent mathlib
	  spectral / positive-operator construction) for the range-sqrt route;
	  the new `...standardConstants_of_sourceDecrement` wrapper can consume a
	  direct source one-step proof without that range-sqrt route.
- Latest sum-rule frontier: Proposition 13.11(1)'s shared-domain sum algebra
  now compiles in supplied-oracle form.  Reusable declarations include
  `barrierInterSet`, `barrierSumHess`, `barrierSumGrad`,
  `barrierSumThirdMixed`, `barrierSumHess_quadratic_eq`,
  `barrierSumLocalNorm_sq_eq`, `barrierSumLocalNorm_left_le`,
  `barrierSumLocalNorm_right_le`, `barrierSumGradient_bound_of_quadratic_le`,
  `MixedThirdSelfConcordantOn.sum`,
  `SelfConcordantBarrierOn.sum_of_gradient_bound`, and
  `chewi1311_sum_selfConcordantBarrierOn_of_gradient_bound`.  The exact
  unsupplied sum rule still needs the summed inverse-Hessian dual-gradient
  comparison; this is now the only exposed gate for that item.
- Sum-gradient gate shrink: the latest packet adds `real_two_term_cauchy_sqrt`,
  `barrierSumGradient_bound_of_component_cauchy`,
  `SelfConcordantBarrierOn.sum_of_component_cauchy`, and
  `chewi1311_sum_selfConcordantBarrierOn_of_component_cauchy`.  The sum-rule
  gradient bound can now be discharged from component Cauchy bridges and the
  summed inverse-local identity rather than being assumed wholesale.
- Sum Cauchy gate shrink: the newest packet adds
  `SelfConcordantBarrierOn.sum_of_adjointCoord_cauchy` and
  `chewi1311_sum_selfConcordantBarrierOn_of_adjointCoord_cauchy`, reusing the
  existing `dualPrimalCauchy_of_adjointCoordSqrt` theorem to discharge the two
  component Cauchy bridges from adjoint square-root coordinate models.  The
  exact unsupplied sum rule is now concentrated on the canonical summed
  inverse-Hessian/inverse-local identity.
- Sum right-inverse gate shrink: the latest packet adds
  `SelfConcordantBarrierOn.sum_of_adjointCoord_right_inverse` and
  `chewi1311_sum_selfConcordantBarrierOn_of_adjointCoord_right_inverse`.
  These wrappers derive the summed inverse-local identity from a right-inverse
  identity for `barrierSumHess`, and derive the component inverse quadratic
  factors from component Hessian right-inverses plus square-root coordinate
  models.  The exact Proposition 13.11(1) blocker is now the model-specific
  construction/proof that the canonical summed inverse-Hessian oracle is a
  right inverse of the summed Hessian.
- Sum inverse-local extraction: the newest packet factors the internal
  right-inverse algebra into
  `barrierSum_invHess_nonneg_and_invLocal_of_right_inverse`,
  `barrierSum_invHess_nonneg_and_invLocal_of_right_inverse_on`,
  `barrierSumHess_right_inverse_of_adjointSqrtCoord`,
  `barrierSumInvHess_quadratic_nonneg_of_adjointSqrtCoord`, and
  `barrierSumLocalNorm_invHess_eq_dualLocalNorm_of_adjointSqrtCoord`.
  Future exact sum work should prove only the canonical summed right-inverse
  or summed adjoint-square equalities, then reuse these extracted gates.
- Sum square-root-equivalence shrink: the newest packet adds
  `SelfConcordantBarrierOn.sum_of_adjointSqrtCoord` and
  `chewi1311_sum_selfConcordantBarrierOn_of_adjointSqrtCoord`.  These derive
  the component and summed Hessian right-inverse hypotheses from explicit
  continuous-linear-equivalence square-root models
  `H = S†S`, `H⁻¹ = S⁻¹(S⁻¹)†`.  The next exact-sum work should instantiate
  or construct the summed square-root equivalence for the concrete barrier
  model rather than re-proving Cauchy or inverse-local identities.
- Sum adjoint-square model package: the newest packet adds
  `BarrierSumAdjointSqrtModel`,
  `BarrierSumAdjointSqrtModel.sum_right_inverse`,
  `BarrierSumAdjointSqrtModel.invHess_nonneg`,
  `BarrierSumAdjointSqrtModel.sum_inv_local`,
  `BarrierSumAdjointSqrtModel.selfConcordantBarrierOn`, and
  `chewi1311_sum_selfConcordantBarrierOn_of_adjointSqrtModel`.
  Exact Proposition 13.11(1) work can now instantiate one certificate object
  carrying the two component barriers, component square-root models, and the
  summed square-root model, instead of threading the long equality list.
- Latest scalar/Example 13.14 frontier: the scalar logarithmic barrier now
  compiles in the same Definition 13.9 supplied-oracle interface as the
  positive-orthant model.  Reusable declarations include
  `negLogBarrierGrad`, `negLogBarrierThirdMixed`,
  `negLogBarrier_localNorm_eq_oneDimLocalNorm`,
  `negLogBarrier_localNorm_eq_abs_div'`,
  `negLogHessCLM_quadratic_nonneg`,
  `negLogInvHessCLM_quadratic_nonneg`,
  `negLogBarrier_mixedThird_bound`,
  `negLogBarrier_mixedThirdSelfConcordantOn_Ioi`,
  `negLogBarrier_selfConcordantBarrierOn_Ioi`, `halfspaceSlackCLM`,
  `halfspaceSlackSet`, `halfspaceSlackRightInverse`,
  `halfspaceSlackCLM_rightInverse`, and
  `chewi1314_halfspaceSlackNegLog_selfConcordantBarrierOn`,
  `polytopeSlackCLM`, `polytopeSlackSet`,
  `polytopeSlackCLM_apply`, `polytopeSlackCLM_add_offset_apply`,
  `mem_polytopeSlackSet_iff_forall_halfspaceSlackSet`,
  `polytopeSlackSet_eq_iInter_halfspaceSlackSet`,
  `polytopeSlackTailOffset`, `polytopeSlackTailOffset_apply`,
  `polytopeSlackSet_succ_eq_barrierInterSet`,
  `mem_barrierAffinePreimageSet_polytopeSlackCLM_iff`,
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_of_rightInverse`, and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_of_surjective`, plus
  the range-slice wrapper
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated` and
  the quadratic-energy consumer
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated_of_gradient_quadratic`
  built from `dualLocalNorm_le_sqrt_of_inner_le`, plus the range-Hessian
  right-inverse consumer
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated_of_hessianRightInverse_and_gradient_quadratic`,
  built from `barrierAffineRangeHess_quadratic_nonneg`, plus the
  positive-orthant base identities
  `positiveOrthantNegLogHessCLM_invHess_right_inverse` and
  `positiveOrthantNegLog_gradient_invHess_inner_eq_card`, plus the
  affine/polytope pullback gradient-energy identities
  `barrierAffinePreimageGradientInvHessRightInverse_quadratic_eq`,
  `chewi1314_polytopeSlackNegLog_gradient_invHessRightInverse_inner_eq_card`,
  and `chewi1314_polytopeSlackNegLog_gradient_invHessSurjective_inner_eq_card`,
  plus the pulled-gradient Hessian right-inverse identities
  `barrierAffinePreimageHess_invHessRightInverse_grad`,
  `chewi1314_polytopeSlackNegLog_hess_invHessRightInverse_grad`, and
  `chewi1314_polytopeSlackNegLog_hess_invHessSurjective_grad`,
  plus the concrete range-slice inverse closure
  `barrierAffineRangeInvHessOfPos`,
  `chewi1314_polytopeSlackNegLog_rangeInvHess`,
  `chewi1314_polytopeSlackNegLog_rangeInvHess_right_inverse`,
  `chewi1314_polytopeSlackNegLog_range_componentCauchy`, and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeInvHess`,
  plus the head/tail induction
  wrappers
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum` and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum_gradient_quadratic`,
  and the square-root-coordinate consumer
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_adjointSqrtCoord`,
  plus the semidefinite-friendly component-Cauchy packet
  `barrierAffinePreimageCauchy_rightInverse`, `negLogBarrier_cauchy_Ioi`,
  `chewi1314_halfspaceSlackNegLog_componentCauchy`, and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy`,
  plus the positive-orthant/vector-slack Cauchy consumers
  `positiveOrthantNegLog_componentCauchy`,
  `chewi1314_polytopeSlackNegLog_componentCauchy_of_rightInverse`, and
  `chewi1314_polytopeSlackNegLog_componentCauchy_of_surjective`, plus the
  full-row-rank/surjective tail-induction consumers
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy`
  and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy`,
  plus the summed-right-inverse gate wrappers
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy_of_sumRightInverse`,
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy_of_sumRightInverse`,
  and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy_of_sumRightInverse`.
  Example 13.14's single row log-barrier route can now use the source-shaped
  theorem for `x ↦ -log (b - inner a x)` when `a ≠ 0`, and the finite-row
  orthant-preimage route is compiled for any slack map with a supplied right
  inverse, surjective linear part, or a supplied inverse-Hessian oracle on the
  slack-map range satisfying a range Hessian right-inverse identity and the
  concrete range-gradient quadratic energy bound.  The fully general row-family
  route is now closed by the concrete range-slice inverse theorem
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeInvHess`, which
  constructs the finite-dimensional range inverse from strict Hessian
  positivity and derives the gradient bound from the positive-orthant Cauchy
  bridge.  Next Chapter 13 work should package/report Example 13.14 or use it
  as a downstream barrier-calculus input, or instantiate the row-decomposition
  induction by providing the summed inverse-Hessian nonnegativity /
  inverse-local identity and the recursive tail component-Cauchy bridge.  For
  full-row-rank tail slack systems, the tail Cauchy bridge is now provided by
  the right-inverse/surjective tail-induction consumers, so the remaining
  source-shaped gate is now the single summed Hessian right-inverse identity
  `barrierSumHess headHess tailHess x (sumInvHess x v) = v`; use the
  full-space adjoint-square route only for genuinely positive-definite
  component models.  The latest route-correction packet adds
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy_of_sumAdjointSqrtCoord`,
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy_of_sumAdjointSqrtCoord`,
  and
  `chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy_of_sumAdjointSqrtCoord`;
  these consume only a summed adjoint-square model for `H_sum`, avoiding the
  false requirement that the rank-deficient head halfspace Hessian have a
  full-space continuous-linear-equivalence square root.
- Latest affine-preimage frontier: Proposition 13.11(3) now compiles in
  supplied-oracle form, for invertible affine maps, as a single
  non-invertible/range certificate object, and for affine maps whose linear
  part has a continuous right inverse.  Reusable declarations include
  `barrierAffinePreimageSet`, `barrierAffinePreimageHess`,
  `barrierAffinePreimageGrad`, `barrierAffinePreimageThirdMixed`,
  `barrierAffinePreimageLocalNorm_eq`,
  `MixedThirdSelfConcordantOn.affinePreimage`,
  `SelfConcordantBarrierOn.affinePreimage_of_gradient_bound`,
  `chewi1311_affinePreimage_selfConcordantBarrierOn_of_gradient_bound`,
  `barrierAffinePreimageInvHessEquiv`,
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
  `chewi1311_affinePreimage_selfConcordantBarrierOn_of_surjective`,
  reusing mathlib's
  `ContinuousLinearMap.exists_rightInverse_of_surjective`.
  The range-restriction packet adds
  `barrierAffinePreimageRangeRestrict_range_eq_top`,
  `SelfConcordantBarrierOn.affinePreimage_rangeRestrict`, and
  `chewi1311_affinePreimage_selfConcordantBarrierOn_rangeRestrict`, so future
  exact source work can move the codomain to `A.range` and reuse the
  surjective theorem instead of manually constructing a right inverse.
  The translated-range packet adds `barrierAffineRangeSet`,
  `barrierAffineRangeHess`, `barrierAffineRangeGrad`,
  `barrierAffineRangeThirdMixed`,
  `barrierAffineRangeSet_preimage_rangeRestrict_eq`,
  `SelfConcordantBarrierOn.affineRange_of_gradient_bound`,
  `SelfConcordantBarrierOn.affinePreimage_rangeTranslated_of_gradient_bound`,
  and
  `chewi1311_affinePreimage_selfConcordantBarrierOn_rangeTranslated`.
  This handles the affine offset `b` by representing `dom f ∩ (b + range A)`
  in coordinates on `A.range`; the remaining exact source work is to provide
  the restricted inverse-Hessian/dual-gradient gates or identify them from a
  concrete model.
  The translated-range collapse packet adds
  `barrierAffineRange_subtype_comp_rangeRestrict`,
  `barrierAffineRange_adjoint_rangeRestrict_subtype`,
  `barrierAffineRange_preimageHess_eq`,
  `barrierAffineRange_preimageGrad_eq`,
  `barrierAffineRange_preimageThirdMixed_eq`,
  `SelfConcordantBarrierOn.affinePreimage_rangeTranslated_source_of_gradient_bound`,
  and
  `chewi1311_affinePreimage_selfConcordantBarrierOn_rangeTranslated_source`.
  The outer domain/Hessian/gradient/third are now exactly the original affine
  preimage oracles; only the transported range-coordinate inverse Hessian
  remains exposed.
  Search-first result: use mathlib adjoint APIs
  `ContinuousLinearMap.adjoint_inner_left/right`,
  `ContinuousLinearMap.adjoint_comp`, and
  `ContinuousLinearEquiv.coe_comp_coe_symm`; no direct Chewi affine barrier
  rule existed locally.  The remaining exact source work is to reduce the
  source condition `dom f ⊆ range 𝒜` to this right-inverse model, most likely
  through a range-subtype, surjective restriction, or pseudoinverse
  construction.
- Latest inf-projection frontier: Proposition 13.11(4) now has a compiled
  supplied-projected-oracle spine.  Reusable declarations include
  `barrierInfProjectionSet`, `barrierInfProjectionPoint`,
  `barrierInfProjectionPoint_mem_set`, `barrierInfProjectionSet_mono`,
  `SelfConcordantBarrierOn.infProjection_of_projected_oracles`, and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_projected_oracles`.
  The honest remaining proof debt is the Schur-complement/envelope theorem
  that constructs projected Hessian, inverse-Hessian, gradient, and third
  derivative oracles from the original product barrier plus minimizer
  first-order conditions.
- Inf-projection Schur layer: the newest packet adds `withLpProdFstCLM`,
  `withLpProdSndCLM`, `withLpProdInlCLM`, `withLpProdInrCLM`, the four Hessian
  block extractors `barrierInfProjectionBlockXX`,
  `barrierInfProjectionBlockXY`, `barrierInfProjectionBlockYX`,
  `barrierInfProjectionBlockYY`, and the Schur-complement projected Hessian
  `barrierInfProjectionSchurHess`.  The next item-4 proof step should connect
  these block definitions to the projected self-concordance certificate rather
  than rebuilding product-coordinate CLM plumbing.
- Inf-projection envelope interface: the latest packet adds
  `barrierInfProjectionGrad`, `barrierInfProjectionVerticalGrad`,
  `BarrierInfProjectionSelectorStationary`, `barrierInfProjectionSchurHessFrom`,
  and `chewi1311_infProjection_selfConcordantBarrierOn_of_schur_oracles`.
  The item-4 target is now source-shaped around a selector with vertical
  first-order optimality, the Schur-complement Hessian assembled from the
  original product Hessian, and supplied projected inverse/third-derivative
  certificates.
- Inf-projection Schur lift bridge: the newest packet adds
  `barrierInfProjectionSchurCorrection`,
  `barrierInfProjectionSchurLift`, its first/second-coordinate simp lemmas,
  `barrierInfProjectionSchurHessFrom_quadratic_nonneg_of_lift_eq`, and
  `BarrierInfProjectionSelectorStationary.schurHessFrom_quadratic_nonneg_of_lift_eq`.
  The newest identity packet closes that completed-square step with
  `barrierInfProjectionSchurLift_hess_fst`,
  `barrierInfProjectionSchurLift_hess_snd_of_Hyy_right_inverse`,
  `barrierInfProjectionSchurHessFrom_quadratic_eq_lift_of_Hyy_right_inverse`,
  `BarrierInfProjectionSelectorStationary.schurHessFrom_quadratic_nonneg_of_Hyy_right_inverse`,
  `BarrierInfProjectionSelectorStationary.schurMixedThirdSelfConcordantOn_of_Hyy_right_inverse`,
  and `chewi1311_infProjection_selfConcordantBarrierOn_of_Hyy_right_inverse`.
  Search-first result: the quadratic identity uses mathlib
  `WithLp.prod_inner_apply` and local block definitions; block symmetry is not
  needed for Hessian nonnegativity, only the `Hyy` right-inverse.  The remaining
  item-4 gates are the projected mixed-third bound, projected inverse
  positivity, and projected dual-gradient bound.
- Inf-projection projected-inverse gate shrink: the newest packet adds
  `BarrierInfProjectionSelectorStationary.projectedInvHess_quadratic_nonneg_of_Hyy_right_inverse`,
  `barrierInfProjectionGrad_bound_of_quadratic_le`, and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_Hyy_projInv_right_inverse`.
  The projected inverse positivity gate is now discharged by a right-inverse
  identity for the Schur Hessian, and the projected dual-gradient bound is
  reduced to the scalar energy estimate
  `<grad, projInvHess grad> <= nu`.  The remaining item-4 gates are now the
  projected mixed-third bound plus construction of the Schur inverse
  right-inverse/scalar energy certificates.
- Inf-projection mixed-third lift shrink: the newest packet adds
  `barrierInfProjectionSchurLift_localNorm_eq_of_Hyy_right_inverse`,
  `BarrierInfProjectionSelectorStationary.schurLift_localNorm_eq_of_Hyy_right_inverse`,
  `BarrierInfProjectionSelectorStationary.schurMixedThird_bound_of_lift_third`,
  `BarrierInfProjectionSelectorStationary.schurMixedThirdSelfConcordantOn_of_lift_third`,
  and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_lift_third_projInv_right_inverse`.
  The projected mixed-third gate is now reduced to the lifted third-derivative
  identity
  `projThird x u v = third (point x) (schurLift x u) (schurLift x v)`.
  The remaining item-4 gates are the projected-third lift identity, Schur
  projected inverse/right-inverse construction, and scalar projected-gradient
  energy certificate.
- Inf-projection projected-full-inverse shrink: the newest packet adds
  `withLpProdInl_fst_add_inr_snd`,
  `barrierInfProjectionBlockXX_add_XY_eq_hess_fst`,
  `barrierInfProjectionBlockYX_add_YY_eq_hess_snd`,
  `barrierInfProjectionProjInvHessFromFullInv`,
  `barrierInfProjectionSchurHessFrom_projInvHessFromFullInv_right_inverse`,
  `BarrierInfProjectionSelectorStationary.projectedFullInv_gradient_quadratic_le`,
  `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_energy`,
  and `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third`.
  The projected inverse is now fixed to the horizontal part of the full
  inverse-Hessian; its Schur right-inverse follows from the full Hessian
  right-inverse and an `Hyy` left-inverse, and the scalar projected-gradient
  energy bound follows from the original barrier gradient bound plus selector
  stationarity.  Outside the finite-dimensional `Hyy` route below, this wrapper
  still exposes the lifted third-derivative identity and two-sided
  `Hyy`/full-Hessian inverse identities.
- Inf-projection finite-dimensional `Hyy` inverse shrink: the newest packet
  adds `continuousLinearMap_left_inverse_of_right_inverse_finiteDim`,
  `barrierInfProjectionBlockYY_left_inverse_of_right_inverse_finiteDim`,
  `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_energy_finiteDimHyy`,
  and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_finiteDimHyy`.
  Search-first result: mathlib's finite-dimensional
  `LinearMap.injective_iff_surjective` proves that a right inverse for an
  endomorphism is also a left inverse.  In the finite-dimensional vertical
  block setting, the `Hyy` left-inverse gate is therefore derived from
  `Hyy` right-invertibility.  The remaining item-4 gates for this wrapper are
  the lifted third-derivative identity, the `Hyy` right-inverse, and the full
  Hessian right-inverse.
- Inf-projection square-root inverse shrink: the newest packet adds
  `continuousLinearMap_right_inverse_of_adjointSqrtCoord_inv` and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_lift_third_adjointSqrtCoord_finiteDimHyy`.
  This reuses the same adjoint-square coordinate model pattern as the sum and
  Newton packets: `H = S†S` and `H⁻¹ = S⁻¹(S⁻¹)†` now derive both the
  `Hyy` right-inverse and the full Hessian right-inverse for the
  finite-dimensional inf-projection wrapper.  The active item-4 gates in this
  route are now the lifted third-derivative identity plus concrete
  square-root model equalities for the vertical block and full Hessian.
- Inf-projection canonical lifted-third shrink: the newest packet adds
  `barrierInfProjectionSchurLiftedThird`,
  `barrierInfProjectionSchurLiftedThird_apply`,
  `BarrierInfProjectionSelectorStationary.schurMixedThirdSelfConcordantOn_liftedThird`,
  and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_fullInv_liftedThird_adjointSqrtCoord_finiteDimHyy`.
  The best finite-dimensional square-root route now fixes the projected
  mixed-third oracle to the lifted product-space third derivative, so it no
  longer asks callers for a separate `hthird_eq` proof.  The exact source
  envelope theorem still needs the differentiability argument showing this
  canonical oracle is the actual third derivative of the inf-projection value
  function.
- Inf-projection adjoint-sqrt envelope certificate: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.selfConcordantBarrierOn`, and
  `chewi1311_infProjection_selfConcordantBarrierOn_of_adjointSqrtEnvelopeModel`.
  The direct source-domain wrapper
  `chewi1311_infProjection_selfConcordantBarrierOn_of_sourceFullSqrt` now
  packages the source full-Hessian/inverse-Hessian square-root route into the
  exact inf-projection `SelfConcordantBarrierOn` conclusion.  The current best
  item-4 route is therefore either this theorem or the reusable
  `BarrierInfProjectionAdjointSqrtEnvelopeModel` certificate when downstream
  local-norm/envelope consumers are also needed.  The next exact source step is
  to construct the certificate inputs from an envelope differentiability
  theorem and concrete square-root models, not to restate the raw assumptions
  in every wrapper.
- Inf-projection first-order envelope calculus: the newest packet adds
  `barrierInfProjectionPointFDeriv`,
  `barrierInfProjectionPoint_hasFDerivAt`, `barrierInfProjectionValue`,
  `barrierInfProjectionPointFDeriv_toDual_comp_of_vertical_grad_eq_zero`,
  `barrierInfProjectionValue_hasGradientAt_of_vertical_grad_eq_zero`, and
  `BarrierInfProjectionSelectorStationary.value_hasGradientAt`.  The selected
  value function now has projected gradient whenever the original barrier has
  the supplied gradient at the graph point, the selector is differentiable, and
  the vertical stationarity condition holds.  The next exact source step is the
  second-derivative Schur-Hessian identity for the selected value function.
- Inf-projection literal-infimum bridge: the newest packet adds
  `barrierInfProjectionFiberValues`, `barrierInfProjectionInfValue`,
  `BarrierInfProjectionSelectorMinimizes`,
  `BarrierInfProjectionSelectorMinimizes.value_eq_infValue`,
  `BarrierInfProjectionSelectorMinimizes.infValue_eq_value`,
  `BarrierInfProjectionSelectorMinimizes.of_vertical_firstOrder_zero`,
  `BarrierInfProjectionSelectorStationary.infValue_hasGradientAt`, and
  `BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt`.  This
  connects the selected-envelope calculus to Chewi's literal
  `x ↦ inf_y f(x, y)` value when the selector minimizes each vertical fiber.
  Search-first reuse: mathlib's `IsLeast.csInf_eq` proves the selected value
  equals the `sInf` of the fiber, and `HasGradientAt.congr_of_eventuallyEq`
  transports the gradient theorem to the literal infimum value.  The selector
  minimization certificate can now also be derived from a vertical
  `FirstOrderStrongConvexOn Set.univ ... 0` lower model plus zero vertical
  gradient, reusing `FirstOrderStrongConvexOn.lower_model`.  Future item-4
  work should assume/prove `BarrierInfProjectionSelectorMinimizes` instead of
  treating `barrierInfProjectionValue` as the final source value.
- Inf-projection local literal-infimum bridge: the newest packet localizes the
  preceding bridge to Chewi's projected domain.  Reusable declarations include
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
  Search-first reuse: this still uses mathlib's `IsLeast.csInf_eq`,
  `HasGradientAt.congr_of_eventuallyEq`, and `IsOpen.mem_nhds`, plus the local
  `FirstOrderStrongConvexOn.lower_model`; no direct mathlib inf-projection
  envelope theorem was found.  Future item-4 source wrappers should prefer
  the `...MinimizesOn`/open-domain versions, avoiding the stronger global
  vertical-minimizer hypothesis unless the source data genuinely proves it.
- Inf-projection literal third-order source package: the newest packet adds
  `BarrierInfProjectionLiteralThirdOrderEnvelopeOn` and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`.
  This package records, in one source-facing certificate, the projected
  `SelfConcordantBarrierOn` oracle, `HasGradientAt` for Chewi's literal
  `x ↦ inf_y f(x, y)` value, `HasFDerivAt` of the projected gradient with the
  Schur Hessian, and the Schur lifted-third derivative certificate.  The
  current item-4 route no longer needs separate consumers to reassemble these
  facts from `selfConcordantBarrierOn`, local minimizer transport, and
  `thirdOrderEnvelopeOn`; the remaining exact work is to construct the
  concrete selector/envelope derivative and square-root model data that feed
  this package.
- Inf-projection literal-package local-norm consumer: the newest packet adds
  `BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius_of_hessianPositive`
  and
  `BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius`.
  Once the literal third-order package and strict projected-Hessian positivity
  are available, the Chewi Lemma 13.6-style projected source-radius local-norm
  sandwich follows directly, with the zero-displacement case handled inside
  the wrapper.  The newest follow-up adds
  `BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius_of_adjointSqrtModel`,
  which discharges that strict positivity from the adjoint-square-root model.
  The one-call source wrapper
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`
  now constructs the literal package and immediately derives the projected
  local-norm sandwich from the same vertical first-order/full-Hessian
  derivative inputs.
  The Schur-certificate route is now also exposed through
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_of_verticalFirstOrder`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn_isOpen_of_verticalFirstOrder`.
  Once a source proof has already built a
  `BarrierInfProjectionSchurHessDerivativeOn` certificate, these wrappers
  construct Chewi's literal third-order package and projected source-radius
  local-norm sandwich without re-threading full product-space Hessian
  derivative data through the consumer.
  The actual full-Hessian derivative obligations are now packaged as
  `BarrierInfProjectionFullHessianDerivativeOn`, with consumers
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivativeOn_isOpen`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_sourceFullHessianDerivative_isOpen`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_fullHessianDerivativeOn_isOpen`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivativeOn_isOpen_of_verticalFirstOrder`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivativeOn_isOpen_of_verticalFirstOrder`.
  Future source proofs should prove this full-Hessian derivative certificate
  once, then route through the packaged consumers instead of passing separate
  `hhess` and `hmixed_full` hypotheses through every theorem.
  The source-domain constructor
  `BarrierInfProjectionFullHessianDerivativeOn.of_source` now builds that
  certificate from original-domain derivative hypotheses
  `∀ z ∈ s, HasFDerivAt hess ... z` and the source mixed-third pairing,
  using selector stationarity to prove selected graph membership.  The
  non-literal third-order envelope wrappers
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_sourceFullHessianDerivative_isOpen`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_sourceFirstSecondFullHessianDerivative_isOpen`
  now expose the reusable `BarrierInfProjectionThirdOrderEnvelopeOn`
  certificate directly from source-domain data, before any vertical minimizer
  or literal-infimum package is needed.  The endpoint wrappers
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_sourceFullHessianDerivative_isOpen_of_verticalFirstOrder`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullHessianDerivative_isOpen_of_verticalFirstOrder`
  are now the preferred route when the source model proves Hessian
  differentiability on the original barrier domain.
  The newest source-derivative lift also adds
  `BarrierInfProjectionSelectorStationary.hasGradientAt_of_source` and
  `BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_of_source`, plus the
  one-call endpoints
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_sourceFullHessianDerivative_isOpen`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_sourceFirstSecondFullHessianDerivative_isOpen_of_verticalFirstOrder`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_sourceFirstSecondFullHessianDerivative_isOpen_of_verticalFirstOrder`.
  Concrete source instances can now state first-order, second-order,
  Schur-derivative, and full-Hessian derivative data uniformly on `s`;
  selector stationarity internalizes all selected-graph derivative
  restrictions.
  The direct local-norm branch now has the matching source-facing endpoints
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_sourceSecondFullHessianDerivative_isOpen_direct`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_sourceFirstSecondFullHessianDerivative_isOpen_envelope`.
  Use the former when only projected local-norm transport is needed and no
  selected-value `f` envelope data should be carried; use the latter when the
  theorem-facing selected-value envelope is already part of the source route.
  The newest theorem-facing source endpoints
  `chewi1311_infProjection_literalThirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondFullHessianDerivative`
  and
  `chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondFullHessianDerivative`
  now combine the source full-square-root model constructor with the
  source-domain first/second/full-Hessian derivative data.  Concrete
  Proposition 13.11(4) instances can therefore feed source-domain square-root,
  gradient, Hessian derivative, mixed-third, selector derivative, and vertical
  inverse-derivative data directly into the literal package or projected
  source-radius local-norm sandwich.
  The direct-transport source endpoint
  `chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtSecondFullHessianDerivative_direct`
  now gives the shorter route when no literal selected-value envelope is
  needed: source full-square-root model plus source `grad`/`hess` derivative
  data and mixed-third pairing directly imply the projected source-radius
  local-norm sandwich.
  The matching Schur-certificate endpoint
  `chewi1311_infProjection_schurHessDerivativeOn_of_sourceFullSqrtSecondFullHessianDerivative`
  now exposes the intermediate `BarrierInfProjectionSchurHessDerivativeOn`
  certificate from the same source full-square-root and derivative data.  Use
  it when the next step needs the certificate itself before selecting either
  the literal-envelope route or the direct local-norm route.
  The sourceFullSqrt Schur-envelope consumers
  `chewi1311_infProjection_thirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
  and
  `chewi1311_infProjection_literalThirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
  now turn an already-built Schur certificate plus source first/second
  differentiability into the reusable third-order envelope or literal infimum
  package.
  The sourceFullSqrt literal Schur local-norm endpoint
  `chewi1311_infProjection_literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
  now combines that Schur-certificate branch with vertical first-order data
  into the literal projected local-norm theorem.
  The sourceFullSqrt Schur local-norm consumer
  `chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtSchurHessDerivativeOn`
  now turns an already-built Schur certificate directly into the projected
  source-radius local-norm sandwich.
  The non-literal third-order envelope endpoint
  `chewi1311_infProjection_thirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondFullHessianDerivative`
  now exposes `BarrierInfProjectionThirdOrderEnvelopeOn` from source
  full-square-root plus source first/second/full-Hessian derivative data,
  without requiring the literal vertical-minimizer package.
  The full-derivative literal one-call endpoint
  `chewi1311_infProjection_literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondFullHessianDerivative`
  now packages vertical first-order, literal infimum, and local-norm transport
  from sourceFullSqrt first/second/full-Hessian derivative data.
  The matching third-order-envelope local-norm consumer
  `chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtThirdOrderEnvelope`
  now routes that reusable envelope certificate directly to the local-norm
  sandwich.
  Future item-4 source instances should therefore focus on constructing the
  literal package and concrete square-root/envelope model, not rebuilding
  segment Schur-derivative, local-norm transport, or projected-Hessian
  positivity arguments.
- Inf-projection second-order Schur-envelope calculus: the newest packet adds
  `barrierInfProjectionPointFDeriv_apply` and
  `barrierInfProjectionGrad_hasFDerivAt_schur`.  The projected gradient now has
  Frechet derivative `barrierInfProjectionSchurHessFrom` whenever the original
  gradient derivative is the supplied product Hessian and the selector
  derivative solves `D selector v = -Hyy^{-1} Hyx v`.
- Inf-projection model inverse/second-order API: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.secondOrderEnvelopeAt_of_sourceFirstSecond_isOpen`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.hyy_right_inverse`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.hyy_left_inverse`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.full_right_inverse`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.grad_hasFDerivAt_schur_of_isOpen`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.secondOrderEnvelopeAt_of_isOpen`.
  Future source instances with an adjoint-square-root envelope model should
  state full-space `sqrtFull` equalities once on `s`, lift them through
  `of_sourceFullSqrt`, state first/second differentiability once on `s`, and
  use these methods instead of re-proving selected-graph square-root
  equalities, source derivative restrictions, `Hyy` inverse identities, or the
  selected-value second-order envelope from raw square-root equalities.
- Inf-projection implicit-selector derivative calculus: the newest packet adds
  `barrierInfProjectionVerticalGrad_hasFDerivAt`,
  `barrierInfProjection_verticalDerivative_eq_zero_of_eventually_eq_zero`,
  `barrierInfProjection_selector_deriv_eq_neg_invHyy_of_vertical_eventuallyEq`,
  and
  `barrierInfProjectionGrad_hasFDerivAt_schur_of_vertical_eventuallyEq`.  Local
  vertical stationarity plus an `Hyy` left inverse now discharges the selector
  derivative equation needed by the Schur-envelope theorem.  Search-first
  reuse: local graph-map/Schur calculus, mathlib `HasFDerivAt.comp`,
  `HasFDerivAt.unique`, `hasFDerivAt_const`, `EventuallyEq`, and
  `add_eq_zero_iff_eq_neg`.  The remaining exact source step is to prove the
  canonical lifted-third oracle is the actual third derivative of the selected
  value and to construct the packaged adjoint-square-root envelope certificate
  from concrete selector/model data.
- Inf-projection local-stationarity source bridge: the newest packet adds
  `BarrierInfProjectionSelectorStationary.verticalGrad_eventually_eq_zero`,
  `BarrierInfProjectionSelectorStationary.verticalGrad_eventually_eq_zero_of_isOpen`,
  `BarrierInfProjectionSelectorStationary.selector_deriv_eq_neg_invHyy_of_mem_nhds`,
  `BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_schur_of_mem_nhds`,
  and
  `BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_schur_of_isOpen`.
  The Schur projected-gradient derivative can now be obtained directly from
  selector stationarity plus a projected-domain neighborhood/open-domain fact;
  future third-derivative/envelope work should not reintroduce raw local
  `EventuallyEq` stationarity assumptions.
- Inf-projection second-order selected-value certificate: the newest packet
  adds `BarrierInfProjectionSecondOrderEnvelopeAt`,
  `BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_mem_nhds`,
  `BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_isOpen`,
  `BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_mem_nhds_finiteDimHyy`,
  and
  `BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_isOpen_finiteDimHyy`.
  The selected value now has a compact local certificate carrying both the
  projected gradient identity and the Schur projected-gradient derivative.  In
  the finite-dimensional `Hyy` route, the wrapper derives the left inverse from
  a right inverse, so the next exact source work should focus on the actual
  third-derivative/lifted-third identity and concrete square-root envelope
  model construction.
- Inf-projection Schur-third derivative bridge: the newest packet adds
  `BarrierInfProjectionSchurHessDerivativeOn`,
  `BarrierInfProjectionSchurHessDerivativeOn.mono_projected`,
  `BarrierInfProjectionSchurHessDerivativeOn.continuousOn`,
  `BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate`,
  and
  `BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex`,
  then strengthens the route with
  `BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_deriv`
  and
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv`.
  The follow-up scalar-segment packet adds
  `BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_scalarPsi`,
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_segmentCertificate`,
  and
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_scalarPsi`.
  The newest continuity-on-domain follow-up adds
  `BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_scalarPsi_continuousOn`
  and
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_scalarPsi_continuousOn`,
  reusing `hessianSegmentPsi_continuousOn_of_convex_continuousOn` so future
  scalar-source work only supplies `ContinuousOn H_schur` on the projected
  domain rather than a per-vector segment-continuity family.
  The newest vector-path derivative packet adds
  `hessianSegmentPsi_hasDerivAt_of_hasDerivAt_apply`,
  `hessianSegmentPsi_hasDerivWithinAt_of_hasDerivWithinAt_apply`,
  `BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_hessApplyDeriv`,
  and
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv`.
  The follow-up extraction names the Frechet-to-applied-vector calculus as
  `hessianSegmentHessApply_hasDerivAt_of_hasFDerivAt` and
  `hessianSegmentHessApply_hasDerivWithinAt_of_hasFDerivAt`.
  The newest Schur-certificate bridge adds
  `BarrierInfProjectionSchurHessDerivativeOn.hessApply_hasDerivWithinAt` and
  `BarrierInfProjectionSchurHessDerivativeOn.hessApply_mixed_inner_eq`, so a
  full `BarrierInfProjectionSchurHessDerivativeOn` certificate now directly
  supplies the applied-vector derivative and its lifted-third pairing.
  The newest scalar-display bridge adds
  `BarrierInfProjectionSchurHessDerivativeOn.hessianSegmentPsi_hasDerivWithinAt_liftedThird`,
  naming the source identity
  `d/dt <v, H_schur(z_t) v> = liftedThird(z_t, y - x, v)` directly from that
  certificate.
  The newest source-radius consumer adds
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply`,
  routing the full Schur derivative certificate through the applied-vector
  scalar segment path and removing the older strict projected-Hessian
  positivity and nonzero-displacement side conditions from that route.
  The newest Schur block-calculus packet adds the fixed block extraction CLMs
  `barrierInfProjectionBlockXXCLM`, `barrierInfProjectionBlockXYCLM`,
  `barrierInfProjectionBlockYXCLM`, `barrierInfProjectionBlockYYCLM`, their
  derivative maps and `barrierInfProjectionBlock*_hasFDerivAt` lemmas, plus
  `barrierInfProjectionSchurHessDeriv`,
  `barrierInfProjectionSchurHess_hasFDerivAt`,
  `BarrierInfProjectionSchurHessDerivativeOn.of_blockDerivatives`, and
  `BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative`.
  Mathlib reuse is now explicit: `HasFDerivAt.comp`,
  `HasFDerivAt.clm_comp`, `HasFDerivAt.sub`, and
  `ContinuousLinearMap.hasFDerivAt` discharge the block/Schur calculus.  The
  remaining exact item-4 source work is the scalar mixed-third pairing identity
  and concrete square-root/envelope model construction, not block derivative
  extraction.
  The newest component-pairing packet adds
  `barrierInfProjectionSchurHessDeriv_inner_eq_of_component_pairing` and
  `BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_componentPairing`.
  This replaces one monolithic `hmixed` proof with three model-facing
  obligations: cross-block pairing, differentiated inverse-Hessian
  cancellation, and the four-term full-Hessian derivative expansion on Schur
  lifts.
  The live inf-projection derivative gate is now even narrower: prove the
  derivative of `t ↦ H_schur(z_t) v` and the paired identity with lifted third;
  the scalar `ψ` derivative follows by the generic inner-product calculus
  bridge.
  Search-first reuse: the bridge reuses the already compiled canonical
  lifted-third self-concordance theorem and the generic
  `HessianSegmentMixedThirdLocalNormCertificate` constructors and sandwich
  consumers.  The exact remaining proof is now weaker than the full
  operator-valued Schur derivative certificate: it can be attacked as the
  scalar segment identity
  `d/dt <v, H_schur(z_t) v> = liftedThird(z_t, y - x, v)` plus the already
  standard segment coefficient bound.  Continuity, strict positivity, and
  local-norm sandwich transport are no longer separate live blockers once the
  scalar `ψ` derivative certificate is supplied.
- Inf-projection cross-block symmetry shrink: the newest packet adds
  `StatInference/Optimization/SchurSymmetry.lean`, root-imported by
  `StatInference.lean`, with reusable product-injection inner-product lemmas
  `withLpProdInlCLM_inner`, `withLpProdInrCLM_inner`,
  `inner_withLpProdInrCLM`, and
  `barrierInfProjectionBlockXY_invHyy_pair_eq_of_hessian_symmetric`.
  This discharges the first component-pairing obligation
  `<v, Hxy Hyy⁻¹ w> = <Hyy⁻¹ Hyx v, w>` from full product-Hessian symmetry
  and the `Hyy` right-inverse.  Search-first reuse: mathlib
  `LinearMap.IsSymmetric`, `WithLp.prod_inner_apply`, and local WithLp block
  extractors/injections are sufficient; future Schur-derivative packets should
  no longer pass this cross-block pairing as a raw assumption.
- Inf-projection inverse-derivative cancellation shrink: the newest packet
  extends `StatInference/Optimization/SchurSymmetry.lean` with
  `barrierInfProjectionBlockXY_invHyyDeriv_pair_eq_neg_of_hessian_symmetric`.
  This discharges the second component-pairing obligation
  `<v, Hxy (D Hyy⁻¹[u] Hyx v)> =
   -<Hyy⁻¹ Hyx v, D Hyy[u] (Hyy⁻¹ Hyx v)>` from the cross-block symmetry
  bridge, an `Hyy` left inverse, and the differentiated inverse identity
  `Hyy (D Hyy⁻¹[u] w) + D Hyy[u] (Hyy⁻¹ w) = 0`.
- Inf-projection lifted-third component shrink: the newest packet extends
  `StatInference/Optimization/SchurSymmetry.lean` with
  `withLpProdInlSubInr_inner_map_sub_self`, the four
  `barrierInfProjectionBlock*Deriv_apply` lemmas,
  `barrierInfProjectionPointFDeriv_eq_schurLift_of_selector_deriv_eq`,
  `barrierInfProjectionSchurLiftedThird_eq_component_expansion_of_pairing`,
  and
  `BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_liftPairing`.
  This removes the raw four-term component-expansion assumption: a
  source-shaped lifted-third pairing now supplies the component obligation.
  Search-first reuse: local `WithLp` block injections/extractors plus mathlib
  `WithLp.prod_inner_apply`, `map_sub`, and `inner_sub_left/right` were enough;
  future work should prove the lifted-third pairing/actual third-derivative
  identity rather than re-supplying component algebra.
- Inf-projection source-facing Schur derivative shrink: the newest packet adds
  `BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse`.
  This combines the cross-block symmetry bridge, inverse-derivative
  cancellation bridge, selector-derivative-to-Schur-lift bridge, and
  lifted-third component expansion into one constructor.  Downstream envelope
  work can now supply the original product-space Hessian derivative
  `HasFDerivAt hess`, Hessian symmetry, `Hyy` two-sided inverse identities,
  selector derivative equation, differentiated inverse equation, and the
  standard full mixed-third identity
  `<b, (D hess(point x)[a]) b> = third(point x,a,b)`.  The next blocker is
  not Schur component algebra; it is constructing these source hypotheses from
  local minimizer/envelope data and concrete square-root/inverse models.
- Inf-projection inverse-identity derivative shrink: the newest packet adds
  `barrierInfProjectionBlockYY_invHyy_deriv_cancel_of_eventually_right_inverse`
  and
  `BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_symmetric_inverse_eventually`.
  The differentiated inverse equation is now derived from the local identity
  `Hyy(y) (Hyy⁻¹(y) w) = w` using mathlib `HasFDerivAt.clm_apply`, plus the
  already compiled `barrierInfProjectionBlockYY_hasFDerivAt`.  The preferred
  inf-projection route should now supply local/eventual `Hyy` right-inverse
  identities rather than a raw derivative-cancellation hypothesis.
- Inf-projection stationary-neighborhood Schur derivative shrink: the newest
  packet adds
  `barrierInfProjectionBlockYY_invHyy_eventually_right_inverse_of_mem_nhds`,
  `BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds`,
  and
  `BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_isOpen`.
  These wrappers derive the eventual `Hyy * Hyy⁻¹ = I` identity from
  neighborhood membership and derive the selector derivative equation from
  `BarrierInfProjectionSelectorStationary.selector_deriv_eq_neg_invHyy_of_mem_nhds`.
  Future source-facing inf-projection work should pass selector stationarity
  plus projected-domain neighborhood/open-domain facts rather than raw
  `hdselector` or raw eventual inverse hypotheses.
- Inf-projection finite-dimensional stationary Schur shrink: the newest packet
  adds
  `BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy`
  and
  `BarrierInfProjectionSelectorStationary.schurHessDerivativeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy`.
  These variants reuse
  `barrierInfProjectionBlockYY_left_inverse_of_right_inverse_finiteDim`, so the
  finite-dimensional vertical-block route only carries the `Hyy` right-inverse
  identity; the left inverse needed by the implicit-selector step is derived
  internally.
- Inf-projection third-order envelope packaging: the newest packet adds
  `BarrierInfProjectionThirdOrderEnvelopeOn` plus accessors for the selected
  value gradient, projected-gradient Schur Hessian derivative, Schur-Hessian
  derivative, and scalar segment `ψ` derivative.  It also adds
  `BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_mem_nhds_finiteDimHyy`
  and
  `BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_fullHessianDerivative_symmetric_inverse_isOpen_finiteDimHyy`,
  then lifts the packaged square-root model through
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivative_mem_nhds`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivative_isOpen`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen`.
  Search-first result: mathlib supplies generic `HasFDerivAt`/inner-product
  calculus and local code supplies the Schur and segment bridges, but there is
  no direct mathlib inf-projection envelope-third theorem; the remaining exact
  source gap is constructing the derivative inputs for the model and connecting
  the lifted Schur oracle to the actual third derivative of the selected value.
- Inf-projection third-order-to-segment bridge: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projectedHessianSegmentMixedThirdLocalNormCertificate_of_fullHessianDerivative_isOpen`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen`.
  These route the packaged adjoint-square envelope model plus full Hessian
  derivative data directly into the projected Lemma 13.6 segment certificate
  and source-radius local-norm sandwich, deriving the Schur derivative and
  `Hyy` right-inverse internally.  Future item-4 work should now supply the
  actual model derivatives and segment coefficient bound to this wrapper
  rather than reopening the Schur derivative/local-norm machinery.
- Inf-projection source-radius shrink: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_hessianPositive`.
  It removes the explicit segment-coefficient hypothesis from the packaged
  adjoint-square route by reusing the existing Riccati source-radius machinery
  behind
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv`.
  The remaining local-norm sandwich gate is now the standard strict projected
  Hessian positivity on the projected domain plus `y - x ≠ 0`, not a manually
  supplied segment coefficient bound.
- Inf-projection strict-positivity shrink: the newest packet adds
  `barrierInfProjectionSchurLift_ne_zero_of_ne`,
  `barrierInfProjectionSchurHessFrom_quadratic_pos_of_fullHessian_pos`,
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projectedSchurHess_quadratic_pos`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_ne`.
  The packaged adjoint-square model now derives strict projected Hessian
  positivity from the full Hessian square-root factorization and the
  completed-square Schur lift identity.  The local-norm sandwich wrapper now
  exposes only the distinct-point side condition `y - x ≠ 0` instead of a
  manually supplied projected Hessian positivity hypothesis.
- Inf-projection zero-displacement shrink: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_sourceRadius`.
  It splits on `y - x = 0`, closes the trivial branch with `localNorm_zero`,
  and otherwise uses the strict-positivity wrapper.  The source-radius
  projected local-norm sandwich gate now exposes no manual segment coefficient,
  no manual projected Hessian positivity, and no distinct-point hypothesis.
- Inf-projection third-order-envelope consumer: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_thirdOrderEnvelope`.
  Once the exact selected-value third-order envelope certificate
  `BarrierInfProjectionThirdOrderEnvelopeOn` is built, this theorem routes it
  directly through the adjoint-square model to the projected source-radius
  local-norm sandwich.  Future work should therefore focus on constructing the
  actual third-order envelope certificate from selector/envelope data, not on
  re-supplying full-Hessian derivative inputs to the sandwich wrapper.
- Inf-projection Schur-certificate envelope adapter: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn_isOpen`.
  Once a `BarrierInfProjectionSchurHessDerivativeOn` certificate is available,
  the adjoint-square model now supplies the selected-value second-order
  envelope and projected local-norm sandwich without reopening raw
  `hhess`/`hinvDeriv`/mixed-full derivative plumbing.  The remaining exact
  inf-projection source step is therefore the genuine construction of the
  Schur derivative certificate and actual lifted-third identity from selector
  stationarity and model derivative data.
- Inf-projection scalar applied-Hessian adapter: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv`.
  The adjoint-square model now also consumes the narrower scalar route where
  callers prove differentiability of
  `t ↦ H_schur(x + t • (y - x)) v` and identify
  `<v, d/dt H_schur(z_t) v>` with the lifted third derivative.  This keeps the
  next exact source target focused on the segment applied-Hessian derivative
  identity, without requiring an operator-valued Schur derivative certificate
  first.
- Inf-projection scalar source-radius shrink: the newest packet adds the
  generic `hessianSegmentLocalNorm_hasDerivWithinAt_of_psi`,
  `HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_scalarPsi_sourceRadius`,
  the projected
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius`,
  and the adjoint-square-model
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius`.
  The scalar applied-Hessian route now derives the Riccati/source-radius segment
  coefficient internally.  Future exact source work should supply projected
  Schur-Hessian continuity plus the segment applied-vector derivative and
  lifted-third pairing; it should not pass a separate `hsegment_coeff`.
- Inf-projection scalar-continuity shrink: the newest packet adds
  `HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_scalarPsi_sourceRadius_of_continuity`,
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_continuity`.
  The scalar source-radius route no longer requires an operator-valued
  `ContinuousOn H_schur` hypothesis.  Future exact source work can provide only
  per-vector `ψ_v` continuity, segment local-norm continuity, the segment
  applied-vector derivative, and the lifted-third pairing identity.
- Inf-projection local-norm-continuity shrink: the newest packet adds
  `hessianSegmentLocalNorm_continuousOn_of_psi`,
  `HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_scalarPsi_sourceRadius_of_psi_continuity`,
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_psi_continuity`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_psi_continuity`.
  The exact source route no longer needs a separate segment local-norm
  continuity hypothesis once per-vector `ψ` continuity is available.
- Inf-projection applied-vector continuity shrink: the newest packet adds
  `hessianSegmentPsi_continuousOn_of_apply_continuousOn`,
  `HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hessApplyDeriv_sourceRadius`,
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_apply_continuity`,
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv_sourceRadius_of_apply_continuity`.
  The preferred source route can now stay at the applied-vector path
  `t ↦ H_schur(z_t) v`: its continuity gives `ψ_v` continuity, and its
  derivative plus the lifted-third pairing gives the local-norm sandwich.
- Inf-projection Schur-derivative applied-continuity shrink: the newest packet
  adds `BarrierInfProjectionSchurHessDerivativeOn.hessApply_continuousOn`,
  `BarrierInfProjectionSchurHessDerivativeOn.hessApply_continuousOn_of_convex`,
  and
  `BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply_sourceRadius`.
  A full Schur derivative certificate now supplies the applied-vector
  continuity, applied-vector derivative, and lifted-third pairing needed by
  the scalar source-radius route.  Future exact source work should construct
  the Schur derivative certificate or actual third-order envelope, not pass a
  separate segment-continuity/local-norm side condition.
- Inf-projection adjoint-square direct Schur consumer: the newest packet adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn`
  and
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_direct`,
  and rewires the third-order/open-domain compatibility wrappers through it.
  The newest theorem-facing envelope consumer also adds
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_envelope`,
  which builds the selected-value third-order envelope from the full-Hessian
  derivative package and then consumes it for the source-radius local-norm
  sandwich.
  The newest envelope-constructor extraction adds
  `BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds`,
  `BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen`,
  `BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_mem_nhds_finiteDimHyy`,
  and
  `BarrierInfProjectionSelectorStationary.thirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_finiteDimHyy`,
  so a supplied Schur-Hessian derivative certificate can be packaged into the
  selected-value third-order envelope either from a supplied `Hyy` left inverse
  or from the finite-dimensional `Hyy` right-inverse route.  The adjoint-square
  adapter now reuses the finite-dimensional open-domain constructor.
  The source-square-root constructor
  `BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt` also lifts
  full Hessian/inverse-Hessian adjoint-square equalities from the original
  source domain to the selected graph; future exact source work should spend
  proof effort on the scalar mixed-third identity and concrete selector model,
  not on restating graph-point `sqrtFull` equations.
  A packaged adjoint-square model plus a Schur derivative certificate now
  proves the projected source-radius local-norm sandwich without selected-value
  `f`, open-domain gradient, or second-order envelope assumptions; source
  full-Hessian derivative data can now first build the Schur certificate and
  use the same direct transport theorem without the older positivity/nonzero
  wrapper route.  When selected-value envelope hypotheses are already in hand,
  use the theorem-facing envelope consumer as the source endpoint.  Use the
  shorter direct route whenever the goal is only Lemma 13.6-style local-norm
  transport.
- Current priority sequence: continue Chewi Proposition 13.11 from the
  compiled product, shared-domain sum, affine-preimage, and inf-projection
  supplied-oracle layers in
  `StatInference/Optimization/InteriorPoint.lean`.  The next bounded choices
  are: close the exact shared-domain sum inverse-Hessian/inverse-local gate,
  extend affine-preimage beyond equivalences through a principled
  surjective/range/pseudoinverse interface, or attack the inf-projection
  actual-third/envelope-certificate construction.
  The older Theorem 13.8/Definition 13.9 substrate remains reusable, but it is
  no longer the active blocker for this lane.
  Do not return to ASGD unless Chapter 13 stalls or the user explicitly
  switches lanes.
- Process audit: the speed bottleneck was not only Lean difficulty; it was
  stale route replay, repeated broad searches, micro-packet commit overhead,
  and shared-worktree/build-artifact contention.  The active protocol is now:
  one bounded search pass, one theorem-sized Lean packet, focused module
  verification, route-doc update only when material, then one final
  fetch/rebase/scan/commit/push gate.
- Manual operating loop: each `/goal` run should orient once from the current
  frontier contract, state one theorem-sized packet before edits, keep the main
  thread on proof integration, use subagents only for explicitly authorized
  read-only scouting or disjoint adjacent files, verify in focused tiers, push
  once after a final rebase, and record a sharp Lean blocker if the endpoint
  cannot close.
- Process upgrade: each manual run now has a required proof packet contract:
  primary theorem endpoint, reuse boundary, edit set, verification gate, and
  failure gate.  Multi-agent work should use explicit ownership: main thread
  for the active proof/integration, read-only scouts for mathlib/local/source
  mapping, at most one disjoint Lean worker, and a verification scout after the
  diff stabilizes.
- Accuracy upgrade: if a manual run starts with a dirty Lean diff, verify or
  precisely block that diff before doing strategy/doc-only work.  No uncompiled
  theorem should be carried across a process update.
- Process correction from the May 8 Chapter 13 pivot: future manual runs should
  enter through the current live prompt in
  `docs/optimization2026_current_blocker_primitive_plan.md`, then move
  directly to the active Lean theorem statement.  The next packet is not a
  route-planning loop and not an already-solved ASGD tower peel; it is the
  Theorem 13.8 square-root/normalized-operator Delta line, especially the
  pointwise squared normalized estimate, using the compiled integrated Delta
  coefficient, concrete Delta action, scalar Delta/order bridge,
  normalized-operator/squared-bound bridges, and gradient-FTC layers.  Broad
  searches, old Chapter 3 routing, ASGD routing, and repeated Git sync loops
  are explicitly out of budget unless they answer that blocker.
- Latest ASGD source-variance route improvement: the active right compensated
  full-inverse product no longer needs the suspicious auxiliary
  `‖1 + projectedCompensatedTaylorErrorFactor‖ ≤ 1` gate.  The new route
  compares the normalized Taylor product directly with the inverse
  compensation product using the already-compiled normalized factor bound, and
  compiles no-factor-bound future-tail/inverse-tail characteristic-function,
  scalar CLT, projected CLT, bridge, and certificate wrappers.  Future ASGD
  work should use the `_no_factor_bound` declarations and treat the older
  factor-bound route as compatibility only.
- Latest ASGD assumption-shrink packet: the newest
  `_of_uniform_bound_no_factor_bound` future-tail/inverse-tail wrappers also
  remove the explicit variance-error row integrability input by reusing
  `projectedCompensationVarianceError_row_norm_integrable_of_uniform_bound`.
  The active ASGD certificate route should now expose only mean-zero plus the
  genuine future-tail proxy/residual convergence assumptions.
- Deterministic future-tail proxy route shrink: the new
  `deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`
  wrappers specialize the predictable proxy route to constant-in-`ω` proxies,
  removing the old normalized-product argument from deterministic proxy
  certificates.  The newest ASGD endpoint packet adds
  `asgd_limit_package_of_deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`.
- Deterministic suffix-proxy source bridge: the newest ASGD packet adds
  `projectedNormalizedTaylorFactor_integrable_of_uniform_bound`,
  `projectedMixedTowerFutureTail_sub_deterministicTailProxy_norm_le`,
  `projectedMixedTowerFutureTail_deterministicTailProxy_l1_le_suffix_error`,
  `projectedMixedTowerFutureTail_deterministicTailProxy_l1_row_sum_le_suffix_error`,
  `projectedMixedTowerFutureTail_deterministicTailProxy_l1_sum_tendsto_zero_of_suffix_error`,
  and
  `projectedMixedTowerFutureTail_deterministicTailProxy_l1_sum_tendsto_zero_of_weighted_factor_error`.
  This closes the generic product-lifting step from weighted one-step
  deterministic proxy errors to row-summed future-tail `L1` approximation.
  The next source blocker is now a concrete deterministic factor proxy
  approximation, not another product/suffix algebra layer.
- Limit-variance proxy endpoint: the newest ASGD packet adds the canonical
  deterministic factor/tail proxy route
  `covariance_limit_self_nonneg`, `chewi127LimitVarianceProxyFactor`,
  `chewi127LimitVarianceProxyFactor_norm_le_one`,
  `projectedLimitVarianceFutureTailProxy`,
  `projectedMixedTowerFutureTail_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_factor_error`,
  and
  `asgd_limit_package_of_limitVarianceProxy_weighted_factor_error_of_uniform_bound_no_factor_bound`.
  The live ASGD blocker is now exactly the weighted one-step error between
  `projectedNormalizedTaylorFactor` and this limit-variance proxy factor.
- Limit-variance proxy split: the newest ASGD packet adds
  `projectedNormalizedTaylorFactor_limitVarianceProxy_weighted_error_tendsto_zero_of_inverse_error_compensated_error`
  and
  `asgd_limit_package_of_limitVarianceProxy_inverse_error_compensated_error_of_uniform_bound_no_factor_bound`.
  This decomposes the weighted normalized-factor proxy error into the
  inverse-compensation-to-limit-variance proxy error plus the already-isolated
  compensated Taylor-error row sum.
- Scalar variance-difference proxy reduction: the newest ASGD packet adds
  `chewi127_complex_exp_sub_exp_norm_le_abs_sub_mul_exp`,
  `projectedInverseLimitVarianceProxyScaledDiffExp`,
  `projectedInverseCompensationFactor_limitVarianceProxy_norm_le_scaled_variance_diff_exp`,
  `projectedInverseCompensationFactor_limitVarianceProxy_weighted_error_tendsto_zero_of_scaled_variance_diff_exp`,
  and
  `asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_compensated_error_of_uniform_bound_no_factor_bound`.
  This reduces the inverse-compensation-to-limit-variance proxy row error to a
  concrete weighted scalar conditional-variance difference exponential bound.
  The live next ASGD target is to discharge that scalar variance-difference
  row convergence from the existing source conditional variance assumptions,
  then feed it into the compensated Taylor-error endpoint.
- Scalar proxy integrability shrink: the newest ASGD packet adds
  `projectedInverseLimitVarianceProxyScaledDiffExp_aestronglyMeasurable`,
  `projectedInverseLimitVarianceProxyScaledDiffExp_nonneg`,
  `projectedInverseLimitVarianceProxyScaledDiffExp_le_of_variance_abs_le`,
  `projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integrable_of_variance_abs_le`,
  `projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integrable_of_uniform_bound`,
  `projectedInverseCompensationFactor_limitVarianceProxy_weighted_error_tendsto_zero_of_scaled_variance_diff_exp_of_uniform_bound`,
  and
  `asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_compensated_error_of_uniform_bound_no_factor_bound_no_scaled_integrability`.
  The integrability side of the scalar proxy row is now solved by uniform
  boundedness.  The remaining convergence side is a real row-wise proxy gate;
  do not conflate it with Chewi's plain averaged covariance convergence.
- Scalar proxy endpoint shrink: the newest ASGD packet adds
  `asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
  This endpoint reuses the existing
  `projectedCompensatedTaylorError_weighted_row_*_of_variance_remainder`
  theorems, so callers provide scalar inverse-proxy convergence plus weighted
  variance-error/Taylor-remainder convergence, not a separate compensated
  Taylor weighted-error assumption.
- Weighted absolute variance-difference bridge: the newest ASGD packet adds
  `projectedInverseLimitVarianceProxyScaledDiffExp_le_const_mul_inv_mul_abs_variance_diff`,
  `projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integral_tendsto_zero_of_weighted_abs_variance_diff`,
  and
  `asgd_limit_package_of_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
  This gives a compiled closure of the scalar proxy lane from an explicit
  row-weighted `L1` absolute variance-difference gate, while preserving the
  warning that Chewi's averaged covariance convergence alone is not this gate.
- Residual-estimate extraction: the newest ASGD packet adds
  `projectedMixedTowerFutureTail_l1_residual_sum_tendsto_zero_of_predictable_l1_approx`,
  `projectedMixedTowerFutureTail_l1_residual_sum_tendsto_zero_of_deterministic_l1_approx`,
  and
  `projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_futureTail_l1_residual_sum`.
  These isolate the actual residual convergence estimates from the mixed-tower
  defect proof, so source proxy estimates can feed the preferred route
  directly.
- Direct future-tail residual route: the new
  `futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound` wrappers turn
  row-summed `L1` predictability of the normalized future tail directly into
  charFun convergence, projected CLT, bridge, and certificate statements.  The
  newest ASGD endpoint packet adds
  `asgd_limit_package_of_futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound`.
- Direct future-multiplier residual route: the new
  `futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound` wrappers
  turn row-summed `L1` predictability of the mixed-tower future multiplier
  directly into charFun convergence, scalar CLT, projected CLT, bridge, and
  certificate statements.  This is now the shortest preferred certificate path
  for the non-false-predictability ASGD tower route.  The newest ASGD endpoint
  packet adds
  `asgd_limit_package_of_futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound`.
- Future-multiplier proxy route: the newest ASGD packet adds
  `projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_predictable_l1_approx`,
  `projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_deterministic_l1_approx`,
  `asgd_limit_package_of_futureMultiplier_predictable_l1_approx_of_uniform_bound_no_factor_bound`,
  and
  `asgd_limit_package_of_futureMultiplier_deterministic_l1_approx_of_uniform_bound_no_factor_bound`.
  The preferred route now accepts an explicit predictable or deterministic
  proxy approximation of the future multiplier, then packages it all the way
  to the ASGD limit theorem.
- Concrete limit-variance future-multiplier proxy: the newest ASGD packet adds
  `projectedLimitVarianceFutureMultiplierProxy`,
  `projectedLimitVarianceFutureMultiplierProxy_aestronglyMeasurable`,
  `projectedLimitVarianceFutureMultiplierProxy_integrable`,
  `projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_factor_error`,
  and
  `asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_factor_error_of_uniform_bound_no_factor_bound`.
  This gives the preferred future-multiplier route a named predictable proxy
  built from the raw prefix and the deterministic limit-variance future tail.
- Concrete proxy source bridges: the latest ASGD packet adds
  `projectedInverseCompensationFactor_limitVarianceProxy_weighted_row_norm_integrable_of_uniform_bound`,
  `projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_inverse_error_compensated_error`,
  `projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp`,
  `projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp_of_uniform_bound`,
  `projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp_weighted_variance_remainder`,
  `projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_abs_variance_diff_weighted_variance_remainder`,
  `asgd_limit_package_of_limitVarianceFutureMultiplierProxy_inverse_error_compensated_error_of_uniform_bound_no_factor_bound`,
  and
  `asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
  This closes the proxy plumbing; remaining progress should attack the true
  source residual/approximation assumptions rather than adding endpoint-only
  wrappers.
- Chapter 4 Exercise 4.2/Theorem 4.5 direct hard-instance polish: the latest
  exercises pass adds
  `exercise42InfiniteChainObjective_not_near_min_of_positiveLogRate_lt_concreteGradient`
  and folds the same contrapositive obstruction into
  `exercise42InfiniteChainObjective_theorem45_hard_instance_package`.  The
  infinite-chain package now states both the positive-log rate lower bound and
  the source-shaped impossibility of `eps`-near optimality below that rate.
- Weighted inverse-tail fallback: the new
  `inverseFutureTail_weighted_variance_remainder_of_uniform_bound_no_factor_bound`
  wrappers compose the existing weighted variance-error/Taylor-remainder
  suffix comparison with inverse-tail residual predictability, producing
  charFun convergence, scalar CLT, projected CLT, bridge, and certificate
  statements without reopening the normalized-product proof.
- New ASGD scalar Lindeberg declarations:
  `chewi127ScalarLindebergSummand`,
  `chewi127ScalarLindebergAverage`,
  `chewi127ScalarLindebergSummand_eventually_ae_eq_zero_of_uniform_bound`,
  `chewi127ScalarLindebergAverage_eventually_ae_eq_zero_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projected_lindeberg_summand_eventually_ae_eq_zero`,
  and
  `Chewi127BoundedMartingaleCLTSource.projected_lindeberg_average_eventually_ae_eq_zero`.
- New ASGD scalar characteristic-function bridge declarations:
  `chewi127ScalarScaledSum_aemeasurable`,
  `chewi127ScalarScaledSum_tendstoInDistribution_of_charFun`, and
  `Chewi127BoundedMartingaleCLTSource.projected_scalar_clt_of_charFun`.  These
  reuse mathlib `ProbabilityMeasure.tendsto_iff_tendsto_charFun` and local
  `vaart1998_sqrt_nat_tendsto_atTop`; the next blocker is proving the actual
  pointwise characteristic-function convergence from the martingale
  conditional mean-zero, conditional variance convergence, and Lindeberg
  layers.
- New ASGD projected Gaussian characteristic target declarations:
  `Chewi127BoundedMartingaleCLTSource.projected_gaussian_hasLaw`,
  `Chewi127BoundedMartingaleCLTSource.projected_gaussian_charFun_eq`, and
  `Chewi127BoundedMartingaleCLTSource.projected_scalar_clt_of_charFun_exp`.
  These reuse mathlib `IsGaussian.eq_gaussianReal`, `charFun_gaussianReal`,
  `variance_map`, and `covarianceBilinDual_self_eq_variance`, plus the source
  covariance identity `limit_covariance`.  The next martingale CLT packet can
  target the explicit limit `exp (-(S_infty L L) t^2 / 2)` directly.
- New ASGD charFun-source certificate declarations:
  `Chewi127BoundedMartingaleCharFunCLTSource`,
  `Chewi127BoundedMartingaleCharFunCLTSource.projected_gaussian_hasLaw`,
  `Chewi127BoundedMartingaleCharFunCLTSource.projected_gaussian_charFun_eq`,
  `Chewi127BoundedMartingaleCharFunCLTSource.projected_scalar_clt`,
  `Chewi127BoundedMartingaleCharFunCLTSource.projected_clt`,
  `Chewi127BoundedMartingaleCharFunCLTSource.toBoundedMartingaleCLTSource`,
  and
  `Chewi127BoundedMartingaleCharFunCLTSource.toMartingaleCLTCertificate`.
  This removes the older supplied `projected_clt` field from the new endpoint
  constructor and replaces it with projected mean-zero plus explicit
  characteristic-function convergence to
  `exp (-(S_infty L L)t^2/2)`.  The remaining hard ASGD scalar CLT proof is now
  exactly the one-step Taylor/product/tower argument that proves that
  characteristic-function convergence field.
- Fresh ASGD scalar martingale CLT scout results: no direct pinned mathlib or
  local martingale CLT was found.  Reuse mathlib conditional-expectation tower
  and pull-out APIs, characteristic-function Taylor expansion APIs, and product
  distance/norm estimates; locally reuse the projected conditional mean-zero,
  projected conditional second-moment, averaged variance convergence,
  bounded-Lindeberg, scalar Lévy, and new charFun-source certificate layers.
- New ASGD Taylor remainder declarations:
  `chewi127_complex_exp_quadratic_remainder_norm_le` and
  `chewi127_complex_exp_I_mul_quadratic_remainder_norm_le`.  These reuse
  mathlib `Complex.norm_exp_sub_sum_le_norm_mul_exp` and give the analytic
  one-step bound `exp(I*u) = 1 + I*u - u^2/2 + remainder`, with the remainder
  norm controlled by `|u|^3 * exp |u|`.  The next scalar martingale CLT packet
  should integrate this through conditional expectation, kill the linear term
  with projected conditional mean-zero, identify the quadratic term with
  projected conditional second moment, and then pass to the finite
  product/tower estimate.
- New ASGD scalar Taylor random-variable declarations:
  `chewi127ScalarCharFunTaylorRemainder`,
  `chewi127ScalarCharFunTaylor_decomposition`,
  `chewi127ScalarCharFunTaylorRemainder_norm_le`,
  `chewi127ScalarCharFunFactor_integrable`,
  `chewi127Scalar_integrable_of_uniform_bound`,
  `chewi127Scalar_sq_integrable_of_uniform_bound`, and
  `chewi127ScalarCharFunTaylorRemainder_integrable_of_uniform_bound`.  These
  are the bounded-increment integrability and pointwise expansion gates needed
  before applying conditional-expectation linearity to the martingale one-step
  characteristic-function expansion.
- New ASGD conditional Taylor declaration:
  `chewi127ScalarCharFun_condExp_taylor_expansion`.  This closes the
  conditional-expectation linearity layer for
  `E[exp(i a X) | m]`; the next ASGD packet should substitute projected
  martingale mean-zero and conditional second-moment identities, retain the
  named conditional remainder, and move to the finite product/tower estimate.
- New ASGD conditional substitution declarations:
  `chewi127ScalarCharFun_condExp_taylor_expansion_of_zero_quadratic`,
  `chewi127ScalarCharFun_condExp_linear_zero_of_condExp_zero`,
  `chewi127ScalarCharFun_condExp_quadratic_eq_of_condExp_square`,
  `chewi127ScalarCharFun_condExp_taylor_expansion_of_condExp_zero_quadratic`,
  `chewi127ScalarCharFun_condExp_taylor_expansion_of_condExp_zero_square`,
  and
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_condExp_taylor_step`.
  These consume the projected martingale mean-zero and conditional second-
  moment identities and leave the finite product/tower characteristic-function
  estimate as the next hard ASGD scalar CLT step.
- New ASGD finite product/tower declarations:
  `chewi127ScalarScaledSum_charFun_eq_integral_prod`,
  `integral_mul_eq_integral_mul_condExp_of_aestronglyMeasurable_left`,
  `chewi127ScalarCharFunFactor`, `chewi127ScalarCharFunProduct`,
  `Chewi127MartingaleDifferenceProcess.projected_charFun_prefix_aestronglyMeasurable`,
  and
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_product_tower_succ`.
  These rewrite the scalar scaled-sum characteristic function as an integral of
  one-step exponential products, provide the complex conditional pull-out step,
  prove the product prefix is filtration-measurable, and compile the first
  recursive tower peel that substitutes the conditional Taylor model for the
  final factor.  The next ASGD packet should accumulate these one-step peels
  into a finite product/error estimate toward `projected_charFun_tendsto_exp`,
  focusing on conditional variance product convergence and accumulated
  remainder control rather than prefix measurability or Taylor substitution.
- New ASGD finite product/error accumulation declarations:
  `StatInference.norm_prod_sub_prod_le_sum_norm_sub` in
  `StatInference/ProbabilityTheory/ProductBounds.lean`,
  `chewi127_norm_prod_sub_prod_le_sum_norm_sub`, and
  `chewi127_product_sub_product_tendsto_zero_of_sum_norm`.  These give the
  deterministic complex product-distance bound and the row-sum-to-zero bridge
  needed after the martingale tower peel.  The next ASGD packet should
  instantiate this bridge with the Chewi tower factors, prove the variance
  product limit, and prove the conditional Taylor-remainder row-sum control;
  it should not re-search or re-prove the finite product estimate.
- New ASGD product-model convergence declarations:
  `StatInference.product_add_error_sub_product_tendsto_zero_of_sum_norm`,
  `StatInference.product_add_error_tendsto_of_product_tendsto`,
  `chewi127_product_with_remainder_tendsto_exp_of_variance_product`,
  `chewi127_charFun_tendsto_exp_of_eventually_eq_product_with_remainder`,
  and
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_product_model`.
  These reduce the hard projected characteristic-function convergence field to
  the actual tower product model, variance-product convergence, and
  conditional Taylor-remainder row-sum control.  The next ASGD packet should
  prove the concrete `hproduct_model` from repeated tower peels, then discharge
  the concrete variance and remainder estimates; it should not re-prove the
  abstract product perturbation bridge.
- New ASGD random expected-product convergence declarations:
  `chewi127_integral_product_sub_product_tendsto_zero_of_integral_sum_norm`,
  `chewi127_integral_product_with_remainder_tendsto_exp_of_variance_product`,
  and
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_random_product_model`.
  These correct the martingale route to allow filtration-dependent conditional
  variance and Taylor-remainder factors.  The next ASGD packet should prove the
  finite tower/telescoping estimate from the tower recursion and then discharge
  the expected row-sum and variance expected-product convergence obligations
  for those random factors.
- New ASGD concrete Chewi tower-factor declarations:
  `Chewi127BoundedMartingaleCLTSource.projectedVarianceFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedRemainderFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedTaylorModelFactor`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_product_tower_succ_scaled`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_product_tower_succ_scaled'`,
  `integral_norm_condExp_le_integral_norm`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_taylor_step_mul`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_taylor_step_mul_scaled`,
  `Chewi127BoundedMartingaleCLTSource.projected_remainder_row_integral_le`,
  `chewi127ScalarCharFunTaylorRemainder_row_integral_le_of_uniform_bound`,
  `chewi127ScalarCharFunTaylorRemainder_row_bound_tendsto_zero`,
  `Chewi127BoundedMartingaleCLTSource.projected_remainder_row_integral_tendsto_zero`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorErrorFactor`,
  `Chewi127BoundedMartingaleCLTSource.one_add_projectedCompensatedTaylorErrorFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorErrorFactor_norm_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorErrorFactor_row_norm_le`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_compensated_taylor_step_mul_scaled`,
  `StatInference.norm_prod_one_add_sub_one_le_sum_norm`,
  `StatInference.product_one_add_tendsto_one_of_sum_norm`,
  `chewi127_integral_product_one_add_tendsto_one_of_integral_sum_norm`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorErrorProduct_integral_tendsto_one`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorError_row_integral_tendsto_zero`,
  `Chewi127BoundedMartingaleCLTSource.projected_conditional_variance_abs_le_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor_norm_le_of_variance_abs_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor_eventually_row_norm_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorError_row_integral_tendsto_zero_of_variance_error`,
  `chewi127_complex_exp_mul_one_sub_sub_one_norm_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationVarianceError_norm_le_of_variance_abs_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationVarianceError_row_integral_tendsto_zero`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorError_row_integral_tendsto_zero_of_source_variance`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor_mul_compensationFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationProduct_eq_exp_averageVariance`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationProduct_integral_eq_exp_averageVariance`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationProduct_tendsto_exp_of_averageVariance_integral`,
  `Chewi127BoundedMartingaleCLTSource.projected_conditional_variance_nonneg_ae`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor_norm_le_one_of_variance_nonneg`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor_norm_le_one_ae`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor_row_norm_le_one_ae`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationFactor_eventually_row_norm_le_one`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationProduct_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedInverseCompensationProduct_integrable`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedInverseDifference_row_integrable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_eq_taylorModel`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_ae_eq_condExp_charFun`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_norm_le_one_ae`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_row_norm_le_one_ae`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_eventually_row_norm_le_one`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorProduct_aestronglyMeasurable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorProduct_integrable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_normalized_taylor_step_mul_scaled`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_normalized_taylor_step_mul_scaled_of_measurable`,
  `Chewi127BoundedMartingaleCLTSource.projected_scalarScaledSum_charFun_eq_integral_product`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_product_tower_succ_normalized_scaled'`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_zero`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_self`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_integral_succ_eq`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_integral_self_eq_zero`,
  `Chewi127BoundedMartingaleCLTSource.projected_scalarScaledSum_charFun_eq_integral_normalized_product_of_mixed_tower`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_normalized_product_model_of_mixed_tower`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower`,
  `Chewi127BoundedMartingaleCLTSource.projected_remainder_row_norm_integrable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_normalized_bound`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_normalized_controls`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_product_controls`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedVarianceFactor_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedRemainderFactor_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorErrorFactor_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor_row_norm_le_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorError_row_norm_integrable_of_variance_error`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationVarianceError_row_norm_integrable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_error_integrability`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_row_integrability`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerMultiplier_integrable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerMultiplier_aestronglyMeasurable_of_future_tail`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_future_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_mixed_tower_of_uniform_integrability_and_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projected_scalar_clt_of_mixed_tower_future_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projected_clt_of_mixed_tower_future_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projected_scalar_clt_of_mixed_tower_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projected_clt_of_mixed_tower_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.toProjectedBridge_of_mixed_tower_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.toMartingaleCLTCertificate_of_mixed_tower_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.asgd_limit_package_of_mixed_tower_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFutureTail_aestronglyMeasurable_of_factorwise`,
  `Chewi127BoundedMartingaleCLTSource.asgd_limit_package_of_factorwise_future_tail_measurability`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_filtration_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorFactor_filtration_aestronglyMeasurable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorProduct_aestronglyMeasurable_of_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedNormalizedTaylorProduct_Ico_terminal_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_terminal_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_integrable_of_uniform_bound`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerStepDefect`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_integral_self_eq_zero_add_defect_sum`,
  `Chewi127BoundedMartingaleCLTSource.projected_scalarScaledSum_charFun_eq_integral_normalized_product_add_mixedTowerDefect_sum`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_normalized_product_model_with_mixedTowerDefect`,
  `Chewi127ConditionalCovarianceProcess.Xi_succ_filtration_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationPrefixProduct`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedRawPrefixProduct`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationPrefixProduct_zero`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedRawPrefixProduct_zero`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor_filtration_aestronglyMeasurable`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationPrefixProduct_aestronglyMeasurable_of_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedRawPrefixProduct_aestronglyMeasurable_of_le`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedRawPrefixProduct_integral_succ_eq`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensationFactor_mul_inverseCompensationFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_eq_compensated_prefix_inverse_tail`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_eq_compensated_prefix_full_inverse_error_tail`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerDefect_sum_eq_compensated_full_inverse_sub_error_product`,
  `integral_mul_condExp_residual_eq_zero_of_aestronglyMeasurable_left`,
  `norm_integral_mul_condExp_residual_le_integral_norm_residual_mul_norm`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawCharFunStepFactor`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerFutureMultiplier`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_succ_eq_futureMultiplier_mul_rawStep`,
  `Chewi127BoundedMartingaleCLTSource.projectedRawPrefixNormalizedTailProduct_eq_futureMultiplier_mul_normalizedStep`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerStepDefect_norm_le_futureMultiplier_residual`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum`,
  `Chewi127BoundedMartingaleCLTSource.projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_futureMultiplier_residual_sum`,
  `Chewi127BoundedMartingaleCLTSource.projectedCompensatedTaylorErrorProduct_integral_tendsto_one_of_source_variance`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_normalized_product_model`,
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_normalized_product_model_of_source_variance`,
  and
  `Chewi127BoundedMartingaleCLTSource.projected_charFun_tendsto_exp_of_concrete_random_product_model`.
  These name the actual row factors with `a = t / sqrt N` and specialize the
  random expected-product bridge to those factors; the primed tower wrapper
  also discharges the characteristic-product integrability side condition.  The
  arbitrary-multiplier tower step is the correct source interface for Chewi's
  compensated iteration, while the row comparison reduces conditional
  Taylor-remainder control to the unconditioned bounded-remainder envelope; the
  concrete row convergence now follows from uniform boundedness and the
  `N * (|t|B/sqrt N)^3 exp(|t|B/sqrt N) -> 0` rate.  The compensated packet
  normalizes the one-step tower output as `A * (1 + error)` and splits that
  error into variance-only second-order error plus the conditional
  Taylor-remainder term.  The product-to-one packet lifts row-sum error control
  to expected products of `1 + error`.  The row-error packet now consumes the
  existing conditional Taylor-remainder row convergence and reduces expected
  compensated row-error convergence to variance-only second-order control plus
  a uniform compensation-factor bound.  The compensation-bound and
  variance-only packets now discharge those analytic row-error terms from
  uniform boundedness of the martingale increments, modulo the displayed
  routine integrability hypotheses.  The normalized-product packet now gives
  the inverse-compensation factor, the normalized one-step peel, source-facing
  product-to-one from bounded martingale variance control, and a final
  normalized-product characteristic-function bridge.  The inverse-compensation
  product algebra now rewrites the product integral to the expectation of
  `exp (-(t^2/2) * average conditional variance)`, and the newest
  bounded-continuous handoff converts averaged-variance convergence in measure
  into both the exponential expectation limit and inverse-compensation product
  convergence.  The newest clamp packet supplies the bounded continuous
  extension, finite-average measurability from the conditional second-moment
  field, and source-facing abs-bound wrappers
  `projectedAverageVariance_exp_integral_tendsto_of_abs_bound` and
  `projectedInverseCompensationProduct_tendsto_exp_of_averageVariance_abs_bound`.
  The latest finite-average packet also proves
  `chewi127AverageConditionalVariance_abs_le_of_row_bound` and
  `projected_average_conditional_variance_abs_le_of_uniform_bound`.  The newest
  variance-limit packet proves
  `tendstoInMeasure_const_abs_le_of_ae_bound`,
  `projected_covariance_limit_abs_le_of_average_bound`,
  `projected_average_and_limit_variance_abs_le_of_uniform_bound`, and
  `projectedInverseCompensationProduct_tendsto_exp_of_uniform_bound`, so the
  inverse-compensation product convergence now follows directly from the source
  uniform bound.  The newest source-facing normalized-product wrapper also
  fills the compensated row-error convergence and inverse-compensation product
  limit in the characteristic-function bridge from existing source variance
  machinery.  The latest natural-multiplier normalized one-step peel hides the
  inverse-compensation cancellation behind the honest `F_n`-measurability of
  the multiplier, and the newest finite-tower packet adds the named raw
  charFun-product start plus the normalized successor peel with prefix
  measurability/integrability discharged.  The newest mixed-product packet
  adds the raw-prefix/normalized-tail induction object, its two endpoint
  lemmas, and the guarded successor integral equality with future-tail
  measurability/integrability explicit.  The latest finite-induction packet
  accumulates those successor equalities, proves the normalized-product model
  from the mixed tower, and packages the resulting source-facing
  characteristic-function convergence theorem.  The next ASGD packet should
  now start from the newest normalized-control wrapper.  This wrapper first
  identifies each normalized Taylor factor a.e. with the conditional
  characteristic function of the next projected martingale increment, then uses
  mathlib `norm_condExp_le`, `condExp_const`, `condExp_congr_ae`, and
  `stronglyMeasurable_condExp` to prove the a.e. norm bound,
  finite-product measurability, and finite-product integrability from the
  source uniform bound.  The inverse-control packet then proves
  conditional-variance nonnegativity for `Xi (k+1) L L` using
  `condExp_nonneg`, bounds every inverse-compensation factor by one a.e. via
  `Complex.norm_exp_ofReal` and `Real.exp_le_one_iff`, proves inverse-product
  measurability/integrability, and discharges the normalized-minus-inverse row
  integrability side condition.  The latest row-integrability packet proves
  a.e.-measurability for the compensation, variance, remainder, and
  compensated-Taylor error factors, derives compensated-error row-sum
  integrability from variance-error row-sum integrability plus source
  boundedness, discharges the variance-error row-sum integrability directly
  from source boundedness, and adds the source-facing mixed-tower row wrapper.
  The latest mixed-tail packet then discharges the mixed multiplier
  integrability from source boundedness, proves the multiplier
  `F_r`-measurability from the precise future-tail product
  `F_r`-measurability condition, and packages both characteristic-function
  convergence and projected scalar CLT wrappers from that condition.  The
  newest certificate packet packages those scalar CLTs into the
  `Chewi127ProjectedMartingaleCLTBridge` interface and the final Chewi 12.7
  martingale CLT certificate through the stored Cramér-Wold bridge.  The
  newest ASGD endpoint packet composes that certificate with the existing
  Chewi 12.3 initial/remainder decomposition theorem, yielding the full ASGD
  distribution/Gaussian/covariance package under the same future-tail gate.
  The newest factorwise-source packet proves the future tail product is
  `F_r`-measurable from factorwise `F_r`-measurability by finite-product
  induction, and exposes a matching full ASGD endpoint theorem for predictable
  or frozen-tail source models.
  The newest forward-measurability packet proves the honest adapted-filtration
  facts: normalized Taylor factors are `F_k`-measurable, the uniform source
  bound discharges the integrability prerequisites, finite products are
  measurable at any later filtration level, and `[r, N)` interval products are
  `F_N`-measurable.  This supports the alternate backward/telescoping
  conditional-multiplier route without claiming future factors are
  `F_r`-measurable.
  The newest mixed-terminal packet adds the matching terminal facts for the
  raw-prefix/normalized-tail split product:
  `projectedRawPrefixNormalizedTailProduct_terminal_aestronglyMeasurable`
  gives `F_N`-measurability for `r <= N`, and
  `projectedRawPrefixNormalizedTailProduct_integrable_of_uniform_bound` proves
  source-level integrability from the unit bound on normalized factors.
  The newest defect packet names the remaining exact obstruction as
  `projectedMixedTowerStepDefect`, telescopes it across the row, derives the
  exact characteristic-function decomposition as normalized-product integral
  plus defect sum, and adds the convergence adapter
  `projected_charFun_tendsto_exp_of_normalized_product_model_with_mixedTowerDefect`.
  The newest adapted compensated-prefix packet adds the compensation prefix and
  compensated raw prefix, proves their natural filtration measurability, and
  proves the forward one-step identity replacing the next raw characteristic
  factor plus current compensation by `1 +` the compensated Taylor error.
  The newest mixed-defect algebra packet rewrites the mixed product through the
  compensated prefix, full inverse-compensation product, and compensated-error
  tail, then rewrites the whole defect sum as the exact weighted difference
  `compensated full prefix * full inverse product` minus
  `full inverse product * all compensated-error factors`.
  The newest conditional-residual packet proves the reusable martingale
  orthogonality primitive for an adapted multiplier against
  `g - E[g | F]`, and the corresponding correlation bound reducing a weighted
  residual integral to the `L1` size of the weight's non-predictable part.
  The newest future-multiplier residual packet names the raw one-step factor
  and mixed future multiplier, rewrites neighboring mixed products at split
  `r`, proves one-step and row-sum defect bounds from the conditional residual
  correlation estimate, and wires residual row-sum convergence into projected
  characteristic-function convergence.
  The newest future-multiplier integrability bridge proves
  `projectedMixedTowerFutureMultiplier_mul_rawStep_integrable`,
  `projectedMixedTowerFutureMultiplier_mul_condRawStep_integrable`,
  `projectedMixedTowerFutureMultiplier_mul_rawStepResidual_integrable`,
  `projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum_of_condResidual_integrable`,
  and
  `projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum_of_condResidual_integrable`.
  This discharges the raw/normalized/raw-residual integrability gates and leaves
  only conditional future-multiplier residual product integrability plus the
  residual row-sum convergence estimate.
  The newest source-integrability bridge proves
  `projectedMixedTowerFutureMultiplier_integrable_of_uniform_bound`,
  `projectedMixedTowerFutureMultiplier_norm_le_one_ae`,
  `projectedMixedTowerFutureMultiplier_condExp_norm_le_one_ae`,
  `projectedRawCharFunStepFactor_integrable`,
  `projectedRawCharFunStepFactor_residual_integrable`,
  `projectedMixedTowerFutureMultiplier_condExp_mul_rawStepResidual_integrable`,
  `projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum_of_source_integrability`,
  and
  `projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum_of_source_integrability`.
  This removes the last integrability gate from the future-multiplier residual
  route.
  The newest residual-reduction bridge proves
  `projectedRawCharFunStepFactor_norm_le_one_ae`,
  `projectedRawCharFunStepFactor_condExp_norm_le_one_ae`,
  `projectedRawCharFunStepFactor_residual_norm_le_two_ae`,
  `projectedFutureMultiplierResidualProduct_integral_le_two_mul_futureResidual_integral`,
  `projectedFutureMultiplierResidualProduct_row_sum_le_two_mul_futureResidual_row_sum`,
  and
  `projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_l1_residual_sum`.
  This reduces the future-multiplier residual product row-sum to twice the
  future-multiplier L1 residual row-sum.
  The newest future-tail reduction proves
  `projectedMixedTowerFutureTail`,
  `projectedMixedTowerFutureTail_integrable_of_uniform_bound`,
  `projectedMixedTowerFutureMultiplier_condExp_eq_rawPrefix_mul_tailCondExp`,
  `projectedMixedTowerFutureMultiplier_residual_norm_le_tail_residual_ae`,
  `projectedMixedTowerFutureMultiplier_l1_residual_le_tail_l1_residual`,
  `projectedMixedTowerFutureMultiplier_l1_residual_row_sum_le_tail_l1_residual_row_sum`,
  and
  `projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_l1_residual_sum`.
  This pulls out the predictable raw prefix and leaves only normalized
  future-tail L1 unpredictability.
  The newest predictable-proxy reduction proves
  `integral_norm_sub_condExp_le_two_mul_integral_norm_sub_of_aestronglyMeasurable`
  `projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_predictable_l1_approx`,
  `projected_charFun_tendsto_exp_of_futureTail_predictable_l1_approx`, and
  `projected_scalar_clt_of_futureTail_predictable_l1_approx`, plus
  `projected_clt_of_futureTail_predictable_l1_approx`,
  `toProjectedBridge_of_futureTail_predictable_l1_approx`, and
  `toMartingaleCLTCertificate_of_futureTail_predictable_l1_approx`.  The
  deterministic-proxy specialization now also proves
  `projected_charFun_tendsto_exp_of_deterministic_futureTail_l1_approx`,
  `projected_scalar_clt_of_deterministic_futureTail_l1_approx`,
  `projected_clt_of_deterministic_futureTail_l1_approx`,
  `toProjectedBridge_of_deterministic_futureTail_l1_approx`, and
  `toMartingaleCLTCertificate_of_deterministic_futureTail_l1_approx`, which
  discharge constant-proxy side conditions and bounded-source square/remainder
  integrability automatically.  The compact no-factor deterministic route now
  also reaches Chewi 12.3 via
  `asgd_limit_package_of_deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`.
  The residual-estimate layer now also exposes the future-tail residual from
  predictable or deterministic proxy approximations, and the future-multiplier
  residual from the future-tail residual.  This turns the remaining blocker
  into constructing an
  `F_r`-measurable future-tail proxy with vanishing row-summed L1 error, with
  characteristic-function, scalar/projected CLT, and vector certificate adapter
  wiring already closed.  Fresh scout result: the natural inverse-compensation
  future tail is the deterministic-core comparison object, but because it is a
  future random product it must be conditionally projected to `F_r` or replaced
  by a genuinely deterministic proxy; raw inverse-tail `F_r` measurability is
  not available from adaptedness alone.  The newest inverse-tail layer proves
  `projectedMixedTowerInverseFutureTail`,
  `projectedMixedTowerInverseFutureTail_integrable`,
  `projectedMixedTowerFutureTail_sub_inverseFutureTail_norm_le`,
  `projectedMixedTowerFutureTail_inverseFutureTail_l1_le_suffix_error`,
  `projectedMixedTowerFutureTail_inverseFutureTail_l1_row_sum_le_suffix_error`,
  `projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_suffix_error`,
  `projectedMixedTowerFutureTail_condExp_inverseFutureTail_l1_sum_tendsto_zero_of_parts`,
  and `projectedMixedTowerDefect_sum_tendsto_zero_of_inverseFutureTail_condExp`.
  The newest weighted-suffix packet adds
  `chewi127_integral_sum_range_sum_Ico_succ_eq_integral_weighted`,
  `projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_difference_error`,
  and
  `projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_compensated_error`,
  reusing mathlib `Finset.sum_Ico_Ico_comm'` for the triangular finite-sum
  regrouping.  The newest weighted compensated-error packet adds
  `projectedCompensatedTaylorErrorFactor_weighted_row_norm_le`,
  `projectedCompensatedTaylorError_weighted_row_integral_tendsto_zero`,
  `projectedCompensatedTaylorError_weighted_row_norm_integrable_of_variance_remainder`,
  `projectedCompensatedTaylorError_weighted_row_integral_tendsto_zero_of_variance_remainder`,
  and
  `projectedMixedTowerFutureTail_inverseFutureTail_l1_sum_tendsto_zero_of_weighted_variance_remainder`.
  The newest same-limit defect packet adds
  `projectedMixedTowerDefect_sum_tendsto_zero_of_compensated_full_inverse_same_limit`
  and
  `projected_charFun_tendsto_exp_of_compensated_full_inverse_same_limit`.
  The newest right-product packet adds
  `projectedCompensatedFullInverseRight_tendsto_exp_of_compensated_error` and
  `projectedCompensatedFullInverseRight_tendsto_exp_of_source_variance`,
  proving the right product in the same-limit gate by comparing
  `∏ inverse_k * ∏ (1 + error_k)` with `∏ inverse_k`.
  The newest route-correction packet adds
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
  wiring the compiled future-tail proxy and inverse-tail residual routes
  directly into the right-product source-variance bridge.
  The newest certificate-consumer packet adds the matching source-variance
  scalar/vector CLT and certificate wrappers through
  `toMartingaleCLTCertificate_of_futureTail_predictable_l1_approx_source_variance`
  and
  `toMartingaleCLTCertificate_of_inverseFutureTail_condExp_source_variance`.
  The newest reduced-source packet adds
  `projectedCompensatedFullInverseRight_tendsto_exp_of_source_variance_of_variance_error`
  and
  `projected_charFun_tendsto_exp_of_compensated_full_inverse_right_source_variance_and_mixedTowerDefect_of_variance_error`,
  eliminating routine right-product, compensated-error, and remainder
  integrability assumptions from that route.
  This shows the left compensated full-inverse product is exactly the target
  projected characteristic function, so it is not an independent same-limit
  input.  The preferred ASGD 12.7 route is now the compiled right-product
  source-variance limit plus row-summed `L1` asymptotic predictability of the
  mixed-tower future multiplier; the certificate and Chewi 12.3 ASGD endpoint
  paths for that residual are already packaged.  Weighted variance/remainder
  convergence and inverse-tail
  conditional residual convergence are now packaged through the stronger
  future-tail fallback certificate route; what remains, if using that path, is
  to prove those weighted source estimates rather than restating the certificate
  plumbing.  Ordinary unweighted row-error convergence is not sufficient for the
  suffix sum because index `k` is counted `k` times.
  Scouts and local proof search agree that the remaining source gap is genuine:
  current adaptedness gives the tail factor at filtration `F_k`, not at the
  earlier `F_r` for `r < k`.  Next target: build and bound a predictable proxy
  for the normalized future tail, not another future-tail measurability wrapper,
  prefix pull-out, integrability adapter, or raw-residual product estimate.
- Archived manual frontier after the Chapter 12 finite sampled rate packet,
  smooth integral-L2 sampled-model endpoint packet, smooth
  Bochner-unbiased growth/star-upper packet, non-smooth source-L2 sampled
  endpoint packet, smooth source variance-bound bridge for Chewi Theorem 12.1
  SMPGD, the non-smooth relative-subgradient growth/star-upper bridge, and the
  final smooth/non-smooth weighted stochastic averaged-iterate wrappers plus
  exact source-displayed stochastic-error RHS bridges and full source-displayed
  averaged-iterate wrappers:
  Chapter 9/10 now has a compiled finite-valued
  Fenchel/Bregman/mirror substrate.  `MirrorDescent.lean` compiles
  `mirrorProximalGradientModel`, `IsMirrorProximalGradientStep`,
  `mirrorProximalGradientModel_le_composite_add_bregman`,
  `composite_le_mirrorProximalGradientModel`,
  `mirrorProximalGradient_oneStep_ineq`,
  `mirrorProximalGradient_descent`, trajectory accessors, the Chapter 10
  scalar recurrence/denominator wrappers
  `weightedSumBound_of_gronwall_negative_forcing_one`,
  `finalGap_le_weighted_denominator_of_one_step`,
  `finalGap_le_geometric_denominator_of_one_step`, `chewi109Lambda`,
  `chewi109Rho`, and the final supplied-interface and trajectory-level
  Theorem 10.9 rate wrappers.  Reuse facts: no direct pinned mathlib
  Bregman/mirror-descent/MPGD theorem was found; local reuse is
  `Bregman.lean`'s relative lower/upper models, the supplied relative-growth
  certificate, `Proximal.lean`'s `compositeObjective`, and Chapter 3
  Gronwall/geometric-weight algebra.  The 10.11 packet adds the nonsmooth
  MPGD one-step bridge from a supplied model lower bound, recurrence
  telescoping, average-gap bound, Jensen averaged-iterate bound, and trajectory
  wrappers, reusing `ProjectedSubgradient.lean`'s finite-average/Jensen APIs.
  The newest local analytic bridge adds `chewi1011_young_lower_bound`,
  `mirrorProximalGradientModel_lower_of_bregman_bounds`,
  `mirrorProximalGradient_nonsmooth_oneStep_ineq_of_bregman_bounds`,
  `chewi1011_average_gap_le_of_trajectory_bregman_bounds`, and
  `chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds`, reducing the
  opaque 10.11 model-lower-bound to the two displayed source estimates
  `D_f <= 2 L r` and `D_phi >= alphaPhi/2 * r^2`.  The newest step-size packet
  adds `chewi1011_stepsize_rhs_bound`,
  `chewi1011_average_gap_le_of_oneStep_stepsize`,
  `chewi1011_iterateAverage_gap_le_of_oneStep_stepsize`,
  `chewi1011_average_gap_le_of_trajectory_bregman_bounds_stepsize`, and
  `chewi1011_iterateAverage_gap_le_of_trajectory_bregman_bounds_stepsize`,
  closing the displayed `h^2 = alphaPhi * R_phi^2 / (2 * L^2 * N)` corollary.
  The newest ordinary Hilbert-norm packet adds
  `bregmanDivergence_le_two_mul_lipschitz_norm`,
  `bregmanDivergence_lower_of_firstOrderStrongConvexOn`,
  `mirrorProximalGradientModel_lower_of_lipschitz_norm`,
  `chewi1011_average_gap_le_of_trajectory_lipschitz_norm`,
  `chewi1011_iterateAverage_gap_le_of_trajectory_lipschitz_norm`,
  `chewi1011_average_gap_le_of_trajectory_lipschitz_norm_stepsize`, and
  `chewi1011_iterateAverage_gap_le_of_trajectory_lipschitz_norm_stepsize`.
  It uses `LipschitzOnWith.le_add_mul`, `abs_real_inner_le_norm`, and
  `FirstOrderStrongConvexOn.lower_model` to produce the source analytic
  estimates for the ordinary norm.  The newest OMD packet adds
  `onlineMirrorDescentModel`, `IsOnlineMirrorDescentStep`,
  `IsOnlineMirrorDescentTrajectory`, trajectory accessors,
  `chewi1013_young_lower_bound`, OMD model lower-bound and Bregman
  nonnegativity helpers, one-step regret, finite comparator telescope,
  trajectory comparator-regret wrappers, the displayed positive step-size
  corollary in the ordinary Hilbert norm, and the source-facing `sInf`
  infimum closure `chewi1013_regret_bound_inf_of_forall_comparator` plus
  `chewi1013_regret_bound_inf_of_trajectory_norm_bound_stepsize`.  This uses
  Mathlib `le_csInf` to turn the fixed-comparator theorem into Chewi's
  displayed `inf_{y in C}` regret form under nonempty `C` and a uniform
  initial Bregman radius.  The new `AlternatingBregman.lean`
  module adds the source-shaped Bregman projection certificate, ABP trajectory,
  monotonicity halves, one-cycle decrease, finite Lemma 11.2 telescope with and
  without terminal term, and the finite-minimum display `(11.1)` in existential
  form.  The new `AlternatingMinimization.lean` module adds the scalar
  Theorem 11.4 post-threshold layer: forward telescope, inverse-gap one-step
  growth, inverse-gap telescope, `gap (n0+M) <= K/M`, epsilon wrapper,
  source denominator `chewi114A = 2 * beta * D^2 * R^2`, source constant
  `chewi114K = 8 * beta * D^2 * R^2`, `chewi114K_eq_four_chewi114A`, the
  source recurrence/half-threshold bridge, Chewi's max recurrence, above-threshold
  halving, finite burn-in threshold consumers, the
  `IsChewi114AMSourceCertificate` and `IsChewi114AMDescentCertificate`
  interfaces, source `K/M`/epsilon wrappers, and the scalar theorem
  `chewi114_source_recurrence_of_descent_energy` turning the two block-descent
  inequalities into the displayed source recurrence, plus below-threshold
  quadratic recurrence, threshold-tail `K/M`/epsilon rates, and
  initial-threshold tail propagation.  The newest focused Lean-verified layer
  imports Chapter 5's logarithmic halving bridge
  `chewi54_half_pow_mul_le_eps_of_log_ratio_le` and adds
  `IsChewi114AMSourceCertificate.exists_threshold_index_of_geometric_burnin`,
  `IsChewi114AMSourceCertificate.exists_tail_gap_le_eps_of_geometric_burnin`,
  `chewi114_half_pow_mul_gap_le_threshold_of_log`,
  `IsChewi114AMSourceCertificate.exists_threshold_index_of_log_burnin`,
  `IsChewi114AMSourceCertificate.exists_tail_gap_le_eps_of_log_burnin`,
  `IsChewi114AMDescentCertificate.exists_threshold_index_of_geometric_burnin`,
  `IsChewi114AMDescentCertificate.exists_tail_gap_le_eps_of_geometric_burnin`,
  `IsChewi114AMDescentCertificate.exists_threshold_index_of_log_burnin`, and
  `IsChewi114AMDescentCertificate.exists_tail_gap_le_eps_of_log_burnin`.
  Chapter 11.4 is now stable substrate.  The active lane is to finish Theorem
  11.5 RAM as a theorem-sized packet: discharge the selected Hopf-Lax/Moreau
  model value from Chewi's source candidate and discharge the remaining
  interpolant admissibility/radius side conditions so the compiled block-model
  plus selected-interpolant certificate assemblers can feed the RAM rate
  wrappers; then move immediately to Sinkhorn 11.7/11.8 and Chapter 12 SMPGD.
  The new root-imported `RandomizedAlternatingMinimization.lean` module starts
  Chewi Theorem 11.5 and compiles the source scalar expected-gap recurrence
  layer: `chewi115StrongFactor`, `chewi115ZeroK`,
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
  `IsChewi115RAMZeroHopfLaxCertificate.gap_le_eps_nonneg`.  The nonnegative
  weak wrappers remove the earlier strict-positive side condition by a
  zero-hit induction, and the Hopf-Lax bridge layer turns Chewi's displayed
  conditional-expectation plus Exercise 9.3 bounds into the strong/weak RAM
  certificates.  The newest block-model layer adds
  `chewi115_uniform_average_le_of_block_model`,
  `chewi115_conditional_gap_upper_of_averaged_model`,
  `chewi115_conditional_gap_upper_of_block_model`, and
  `chewi115_conditional_upper_of_block_model_sequence`, so finite uniform
  block averaging and the source first-order convexity algebra now feed the
  certificate `conditional_upper` field directly.  The newest Exercise 9.3
  interpolation packet adds `chewi93_hopf_lax_strong_gap_bound_of_interpolant`,
  `chewi93_hopf_lax_zero_gap_bound_of_interpolant`,
  `chewi115_strong_hopf_lax_bound_of_chewi93`, and
  `chewi115_strong_hopf_lax_bound_of_interpolant`.  The newest source
  candidate packet adds `chewi93_selected_model_value_le_interpolant`,
  `chewi115_strong_selected_model_value_le_interpolant`, and
  `chewi115_zero_selected_model_value_le_interpolant`, turning Chewi's
  selected Exercise 9.3 test point into the exact `hmodel_interp` displays.
  The newest source
  certificate packet adds `chewi93_hopf_lax_zero_gap_bound_of_radius`,
  `chewi115_zero_hopf_lax_bound_of_interpolant`,
  `chewi115_strong_hopf_lax_certificate_of_interpolants`, and
  `chewi115_zero_hopf_lax_certificate_of_interpolants`, so the remaining 11.5
  work is direct strong/zero RAM assembly from candidate-value hypotheses plus
  radius/admissibility side conditions, not another scalar-recurrence or
  finite-average loop.  The newest
  block-selected assembly packet adds
  `chewi115_strong_hopf_lax_certificate_of_block_model_interpolants` and
  `chewi115_zero_hopf_lax_certificate_of_block_model_interpolants`, combining
  the finite block-model conditional-upper theorem with the selected
  interpolation estimates into the exact RAM Hopf-Lax certificates.  The
  newest direct source-candidate assembly packet adds
  `chewi115_strong_hopf_lax_certificate_of_block_model_source_candidates` and
  `chewi115_zero_hopf_lax_certificate_of_block_model_source_candidates`, so the
  block model plus Chewi's selected Exercise 9.3 test point now produce strong
  and weak RAM Hopf-Lax certificates without an intermediate supplied
  `hmodel_interp`.  The newest displayed-rate packet adds
  `chewi115_strong_rate_of_block_model_source_candidates` and
  `chewi115_zero_rate_of_block_model_source_candidates`, proving the source
  Theorem 11.5 geometric rate and weak `2 * D * R_beta^2 / N` rate directly
  from the block model plus selected source-candidate assumptions.  The newest
  Sinkhorn selector packet in `AlternatingBregman.lean` adds
  `chewi117_exists_sinkhorn_marginal_errors_le_of_abp`, combining the compiled
  Lemma 11.2 finite-minimum wrapper with supplied Pinsker lower bounds to
  produce the selected marginal-error iterate for Theorem 11.7.  The newest
  source-shaped selectors add
  `chewi117_exists_sinkhorn_full_iterate_error_sum_le_of_abp` and
  `chewi117_exists_sinkhorn_half_iterate_error_sum_le_of_abp`, choosing
  respectively the column-correct full iterate `gamma^n` or row-correct half
  iterate `gamma^(n+1/2)` and proving the displayed total marginal-error bound
  from one finite marginal identity plus one Pinsker/KL lower bound.  The
  newest finite Sinkhorn KL packet adds `finiteKL`, `finiteCouplingKL`,
  `rowMarginal`, `columnMarginal`, row/column normalized coupling definitions,
  their marginal identities, generic row/column ratio-to-KL identities, and
  concrete row/column normalization KL identities.  This discharges the
  textbook algebra behind
  `KL(gamma^(n+1/2) || gamma^n) = KL(mu || mu^n)` and the column analogue
  under explicit nonzero support/denominator assumptions.  The newest
  entropic-Bregman packet adds finite coupling mass/entropy/log-gradient
  displays, the scalar entropic Bregman display, the equal-mass
  entropic-Bregman-to-coupling-KL bridge, and direct row/column normalized
  entropic-Bregman-to-marginal-KL identities.  This is the reusable algebraic
  bridge for the Sinkhorn-as-Bregman-projection movement terms; the remaining
  11.8 work is the concrete zero-error recurrence and monotone marginal-KL
  certificate fields.  The newest finite-array endpoint packet adds
  `IsChewi118FiniteSinkhornEntropyCertificate`,
  `IsChewi118FiniteSinkhornEntropyCertificate.last_rowMarginalKL_le`, and
  `chewi118_finiteSinkhorn_last_rowMarginalKL_le_of_entropyCertificate`,
  giving a source-shaped Theorem 11.8 rate directly over curried finite
  coupling arrays using `finiteCouplingEntropyBregman`.  The
  newest finite Sinkhorn 11.8 packet adds `finiteKL_self`,
  row/column marginal mass and nonnegativity lemmas, `sinkhornRowObjective`,
  `sinkhornRowObjective_eq_zero_of_rowMarginal_eq`,
  `sinkhornRowObjective_nonneg_of_nonneg_of_pos_of_mass_eq`, finite
  Gibbs/KL nonnegativity for arrays and couplings, terminal entropic-Bregman
  nonnegativity from positive equal-mass couplings, initial-KL certificate
  constructors, and theorem-facing wrappers ending in
  `chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_entropyRecurrence_pos_initialKL`.
  This now states Chewi Theorem 11.8 in the displayed
  `KL(rowMarginal gamma^N || mu)` orientation with RHS
  `KL(gammaStar || gamma^0) / N`.  Fresh search result: mathlib's
  `InformationTheory.KullbackLeibler` files provide measure-level KL
  machinery, and `Real.self_sub_one_le_mul_log` supplies scalar Gibbs, but no
  plug-in finite Sinkhorn log-sum/data-processing theorem was found.  The new
  data-processing packet now proves that bridge directly via
  `finiteKL_logSum_term_le`, `finiteKL_row_logSum_le`,
  `finiteKL_rowMarginal_le_finiteCouplingKL_of_pos`,
  `finiteKL_rowMarginal_le_finiteCouplingKL_of_rowMarginal_eq_of_pos`, and
  `sinkhornRowObjective_le_finiteCouplingKL_of_rowMarginal_eq_of_pos`, with
  positive row/column marginal helpers for nonempty finite index sets.  The
  new recurrence bridge packet adds row/column normalization positivity,
  `sinkhornRowObjective_columnNormalized_le_entropyBregman`,
  `chewi118_entropy_one_step_of_columnNormalized_projection_decrease`, and
  `chewi118_entropy_one_step_trajectory_of_columnNormalized_projection_decrease`.
  This converts a supplied column-normalization projection decrease into the
  exact Theorem 11.8 one-step recurrence for the concrete row objective.  The
  finite projection certificate packet now adds
  `IsFiniteCouplingEntropyProjectionStep`,
  `finiteCouplingEntropyProjection_two_step_decrease`,
  `chewi118_entropy_one_step_of_finiteEntropyProjectionSteps_columnNormalized`,
  and
  `chewi118_entropy_one_step_trajectory_of_finiteEntropyProjectionSteps_columnNormalized`,
  closing the projection-decrease field at the supplied finite-certificate
  layer.  The newest concrete Sinkhorn normalization packet adds
  `finiteRowMarginalConstraint`, `finiteColumnMarginalConstraint`,
  the row/column log-difference Pythagorean identities,
  `rowNormalizedCoupling_log_sub_log_eq`,
  `columnNormalizedCoupling_log_sub_log_eq`,
  `isFiniteCouplingEntropyProjectionStep_rowNormalized`,
  `isFiniteCouplingEntropyProjectionStep_columnNormalized`,
  `chewi118_entropy_one_step_of_concreteSinkhornNormalizations`, and
  `chewi118_entropy_one_step_trajectory_of_concreteSinkhornNormalizations`.
  This discharges the actual-normalization projection-certificate blocker and
  proves the zero-error Theorem 11.8 one-step recurrence for concrete finite
  row-then-column Sinkhorn cycles.  The newest source-rate wrapper adds
  `chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations`,
  feeding that concrete trajectory equation into the finite-entropy
  last-iterate theorem and deriving initial/terminal equal-mass side
  conditions from the target marginals plus the final column-normalization
  step.  The newest monotonicity adapter adds
  `chewi118_last_le_of_antitone`,
  `chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations_antitone`,
  and
  `chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations_succ_le`,
  so adjacent nonincrease of the displayed row objective is now enough to
  instantiate the concrete Theorem 11.8 rate.  The newest literal KL display
  packet adds
  `chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations`,
  `chewi118_finiteSinkhorn_exists_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations`,
  `chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations_antitone`,
  and
  `chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations_succ_le`,
  restating the concrete Sinkhorn endpoints directly as
  `finiteKL (rowMarginal gamma^N) mu` or a selected successor KL.  The
  remaining Chapter 11 blocker is the source proof of adjacent row-marginal KL
  nonincrease, if exact terminal-iterate reporting is pursued now.
  The newest selected-rate packet adds
  `chewi118_exists_gap_le_of_recurrence`,
  `chewi118_exists_gap_le_of_oneStep`,
  `chewi118_finiteSinkhorn_exists_rowMarginalKL_le_of_entropyRecurrence_initialKL`,
  `chewi118_finiteSinkhorn_exists_rowMarginalKL_le_of_entropyRecurrence_pos_initialKL`,
  `chewi118_finiteSinkhorn_exists_sinkhornRowObjective_le_of_entropyRecurrence_pos_initialKL`,
  and
  `chewi118_finiteSinkhorn_exists_sinkhornRowObjective_le_of_concreteSinkhornNormalizations`.
  Together with the literal KL selected wrapper, this gives a concrete
  no-monotonicity selected-iterate 11.8 rate in the source KL display; the
  monotonicity blocker remains only for exact terminal-iterate reporting.
  The
  current local focused Lean check also verifies
  `chewi118_last_gap_le_of_recurrence` and
  `chewi118_last_gap_le_of_oneStep` in `MirrorDescent.lean`, turning the
  zero-error Bregman recurrence plus monotone objective/KL gaps into Chewi
  Theorem 11.8's last-iterate `D_0 / N` rate.  The newest local
  `AlternatingBregman.lean` packet adds
  `IsChewi118SinkhornMirrorDescentCertificate`,
  `IsChewi118SinkhornMirrorDescentCertificate.last_rowMarginalKL_le`, and
  `chewi118_sinkhorn_last_rowMarginalKL_le_of_mirrorDescent`, isolating the
  concrete finite row-normalization/KL identities as certificate fields and
  proving the source-shaped last `X`-marginal KL rate from them.  The new
  root-imported `StochasticGradient.lean` module opens Chapter 12 with
  `weightedSumBound_of_gronwall_negative_forcing_with_error`,
  `weightedAverageGap_le_of_gronwall_negative_forcing_with_error`, and
  `chewi121_weightedAverageGap_le_of_oneStep`, proving the scalar
  weighted-average consequence used at the end of Chewi Theorem 12.1 for a
  normalized SMPGD recurrence with an additive stochastic error.  The newest
  Chapter 12 source-rate packet adds
  `chewi121_weightedAverageGap_le_of_source_oneStep`,
  `chewi121_weightedAverageGap_le_geometric_of_source_oneStep`,
  `chewi121_smooth_weightedAverageGap_le_of_source_oneStep`, and
  `chewi121_nonsmooth_weightedAverageGap_le_of_source_oneStep`, so the source
  displayed one-step recurrence now feeds the closed geometric denominator and
  the smooth/non-smooth stochastic error floors directly.  The current local
  packet adds `chewi121_source_oneStep_of_model_bounds` and
  `chewi121_weightedAverageGap_le_geometric_of_model_bounds`, turning Chewi's
  three expected `psi_x` model bounds into the displayed SMPGD one-step
  recurrence and then into the closed weighted-average rate.
  Exact 10.13 `sInf` or arbitrary norm/dual-norm packaging is deferred until
  source-report exactness or a later theorem demands it.
- Archived manual frontier after focused Lean verification rebased over pushed
  frontier `4d4601c` (`Add Theorem 2.4.3 coordinate-code selected package`), building
  on `bb0a297` (`Add Chewi theorem 6.25 feasibility instance wrapper`):
  Chapter 6 is a stable compiled main-text spine through the supplied
  Definition 6.24/Theorem 6.25 feasibility-instance/no-interior-success
  package, and Chapter 7 is now open in
  `StatInference/Optimization/FrankWolfe.lean`.  The new Chapter 7 packet
  compiles `LinearOptimizationOracleOn`, `HasDiameterBound`,
  `frankWolfeStep`, `chewi73StepSize`, `IsFrankWolfeTrajectory`,
  feasibility of Frank-Wolfe steps, the one-step source recurrence, the scalar
  Chewi `2/(n+2)` rate induction, the trajectory recurrence, and the supplied
  Theorem 7.3 wrapper `chewi73_gap_le_two_beta_mul_diam_sq_div`.  Search-first
  reuse: local `FirstOrderStrongConvexOn.lower_model`,
  `SmoothWithGradientOn.upper_model`, mathlib `convex_iff_add_mem`, real inner
  product/smul/norm algebra, and scalar `field_simp`/`ring`/`nlinarith`; no
  pre-existing local or mathlib Frank-Wolfe theorem was found.  Next
  aggressive main-text packet: open Chapter 8 `Proximal.lean` for the proximal
  gradient/composite-gradient theorems, while only returning to 6.25 for exact
  source/report packaging.
- Archived manual frontier after rebasing local `main` onto `origin/main` at
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
  `d = N + 1` instance.  The newest local 6.22 packet now also compiles the
  quadratic strong lower-model identity, whole-space first-order
  strong-convexity certificate for the hard family, centered `B(x_*, R)`
  Lipschitz wrapper for 6.21, the 6.22 radius `R = (L/4)/(alpha sqrt(N+1))`,
  `x0 = 0` radius membership, the 6.22 source-rate lower bound
  `L^2/(32 alpha (N+1))`, and the 6.22 strong-convex/Lipschitz source
  certificates.  The newest feasibility packet starts Theorem 6.25 with
  compiled coordinate boxes, strict box interiors, midpoint half-box updates,
  nonzero resisting cut vectors, valid separation certificates for retained
  boxes, query-exclusion from the retained strict box, box nesting, selected
  coordinate width halving, unselected width preservation, Euclidean ball
  containment in boxes, and the short-side obstruction to containing an
  `eps`-ball.  The newest recursive-state packet adds the cyclic coordinate
  schedule, initial cube, recursive lower/upper endpoints, endpoint ordering,
  per-step valid separation, per-step query exclusion, recursive nesting, and
  recursive selected/unselected width update facts.  The newest width/counting
  bridge adds a reusable width abstraction, zero/selected/unselected width
  lemmas, explicit cyclic-hit selection at `j + m*d`, width halving at those
  hit times, and the recursive-box `eps`-ball necessary side-width condition
  plus its short-side contradiction wrapper.  The newest full-cycle packet
  proves no-hit width preservation, before/after-cycle coordinate miss lemmas,
  one-cycle halving for every coordinate, the closed form
  `(2 * R) / 2^m` after `m` cycles, and the corresponding full-cycle
  `eps`-ball obstruction/necessary-width wrappers.  The newest scalar/log
  success-side packet proves multi-step box nesting, midpoint ball containment
  at full cycles from either side-width or radius hypotheses, the logarithmic
  scalar helper `m * log 2 <= log (R / eps) -> eps <= R / 2^m`, full-cycle
  ball containment from that log bound, and the earlier-step wrapper from any
  later full cycle.  It also proves strict-box nesting and excludes every
  previous query from the strict final box.  The newest replay-certificate
  packet packages returned cut vectors as valid final-box separators and
  combines the replay certificate with log-bound `eps`-ball containment.  The
  newest deterministic replay packet adds the prefix-causal query functional,
  finite deterministic run interface, transcript-equality replay theorem, and
  source-shaped deterministic no-success wrapper.  The newest feasibility
  instance packet proves coordinate boxes are closed and convex, upgrades the
  strict coordinate interior obstruction to a topological `interior C`
  obstruction, packages the final post-hoc box as a Definition 6.24-style
  closed convex subset of `[-R,R]^d` containing an `eps`-ball, and adds
  `chewi625_deterministic_run_no_interior_success_of_log_bound`.  The next
  target is exact Theorem 6.25 source/report packaging or the next
  theorem-sized chapter packet; Theorem 6.23 remains source
  context rather than a direct proof target.  The exact
  Grünbaum/centroid theorem remains a
  supplied blocker for exact CoGM reporting.

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
| Chapter 6 nonsmooth convex optimization | local-layer | `StatInference/Optimization/ProjectedSubgradient.lean`, `StatInference/Optimization/CuttingPlane.lean`, `StatInference/Optimization/Ellipsoid.lean`, `StatInference/Optimization/NonsmoothLowerBounds.lean` | The Chapter 6 PSD layer now compiles through finite-valued Theorems 6.14 and 6.16 in source-facing supplied-interface form. It defines `IsSubgradientAt`, projection/subgradient trajectories, Jensen/telescoping wrappers, Theorem 6.14 wrappers, and `chewi616_exists_functionalConstraintSuccess`. `CuttingPlane.lean` proves the supplied-interface CoGM Theorem 6.19 spine through `chewi619_gap_le_display_rate_of_scaled_candidates`. `Ellipsoid.lean` proves the supplied Lemma 6.20 ellipsoid trajectory/rate layer, scalar central-cut containment, determinant-ratio core, coordinate-free containment, affine transport, Euclidean matrix/PosDef cancellation, pullback-standard-cut certificate, current `Σ⁻¹` identification, displayed center update, rank-one determinant collapse, source-volume determinant ratio, determinant-unit inverse-shape reduction, normalized forward/inverse cancellation, forward-shape transport reductions, rank-one/displayed-action expansion, square-root current/rank-inner transport, `chewi620_matrixCutScale_mul_self_of_pos`, `chewi620_displayedShapeUpdate_forwardShape_transport_of_sqrt`, displayed next-shape certificate `chewi620_sqrtAffineTransport_stepCertificate_of_displayedMatrices`, local real Haar/matrix image-volume scaling through `addHaar_image_linearMap_real`, `addHaar_image_add_left_real`, `matrix_toEuclideanLin_det`, `matrixInvShape_image_volume_real`, and `matrixInvShape_image_add_volume_real`, the generic determinant-square volume bridge `chewi620_hvolume_of_matrix_image_volume_models` and its displayed-certificate consumer `chewi620_displayedMatrices_stepCertificate_of_matrix_image_volume_models`, plus `ellipsoidSet_eq_matrix_image_closedBall_of_quadratic`, `cfcSqrt_det_sq_of_posSemidef`, `chewi620_displayedMatrices_stepCertificate_of_squareRoot_image_models`, `cfcSqrt_quadratic_inv_of_posDef`, `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt_posDef`, `cfcSqrt_inner_matrixInvShape_left`, `chewi620_matrix_rankOne_cauchy_schwarz`, `chewi620_displayedShapeUpdateCore_isHermitian`, `chewi620_displayedShapeUpdate_isHermitian`, `chewi620_displayedShapeUpdateCore_quadratic_pos`, `chewi620_displayedShapeUpdate_quadratic_pos`, `chewi620_displayedShapeUpdate_posDef`, `chewi620_displayedMatrices_stepCertificate_of_cfcSqrt`, `chewi620_displayedMatrices_trajectory_of_cfcSqrt`, and `chewi620_displayedMatrices_volume_ratio_and_gap_bound_of_scaled_candidates`. `NonsmoothLowerBounds.lean` now advances Theorems 6.21/6.22 with the max-coordinate hard objective, source minimizer/value, first-max resisting oracle, prefix-support induction, concrete `gamma^2/(2 alpha d)` gap, 6.21 source-rate lower bound, centered `B(x_*, R)` Lipschitz and first-order convex/strong-convex certificates, 6.22 displayed radius and `x0` membership, 6.22 source-rate lower bound `L^2/(32 alpha (N+1))`, and 6.22 source strong-convex/Lipschitz wrappers. It also starts Definition 6.24/Theorem 6.25 with coordinate boxes, strict interiors, midpoint half-box updates, nonzero separating cut vectors, valid retained-box separation, query-exclusion, nesting, recursive cyclic state, selected-coordinate width halving, unselected width preservation, closed-ball containment, short-side no-ball obstruction, full-cycle side-length closed form, full-cycle `eps`-ball obstruction wrappers, scalar/log success-side ball-containment wrappers, deterministic replay, and the final closed-convex feasibility-instance/topological-interior no-success package. Search-first result: reused local `IsSubgradientAt` from `ProjectedSubgradient.lean`, `coordinatePrefixSubmodule`, `coordinatePrefixSubmodule_eq_top_of_le`, `coordinatePrefixSubmodule_mono`, and `gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next` from `LowerBounds.lean`, local Euclidean norm-sum patterns, plus mathlib `Finset.max'`, `Finset.min'`, `EuclideanSpace.real_norm_sq_eq`, `PiLp.toLp_apply`, `PiLp.inner_apply`, `PiLp.dist_apply_le`, `PiLp.norm_apply_le`, `PiLp.continuous_apply`, `Metric.nhds_basis_closedBall`, `isClosed_Ici`, `isClosed_Iic`, `convex_iff_add_mem`, `Real.sq_sqrt`, `Real.sqrt_pos`, `Real.log_div`, `Real.log_pow`, `Real.log_le_log_iff`, `field_simp`, and scalar `ring`/`nlinarith`; no direct mathlib/local Chewi nonsmooth lower-bound or feasibility theorem was found. Current aggressive packet: exact Theorem 6.25 source/report packaging if bounded, otherwise open Chapter 7 Frank-Wolfe; add arbitrary-`d > N` embedding/report wrappers for 6.21/6.22 only if exact theorem reporting requires them. |
| Chapter 7 Frank-Wolfe | local-layer | `StatInference/Optimization/FrankWolfe.lean` | The Chapter 7 lane is now open with a compiled supplied-interface Theorem 7.3 packet. `LinearOptimizationOracleOn` models Chewi's LOO, `HasDiameterBound` packages the diameter hypothesis, `frankWolfeStep` and `IsFrankWolfeTrajectory` model the displayed update with `h_n = 2/(n+2)`, and `chewi73_gap_le_two_beta_mul_diam_sq_div` proves the source rate `f(x_N)-f_* <= 2 beta D^2/(N+1)` from first-order convexity, smoothness, the LOO certificate, diameter bound, and trajectory membership. Search-first result: reused local first-order/smooth upper-model interfaces and mathlib convex-combination/inner-product algebra; no direct Frank-Wolfe theorem was available locally or in mathlib. Next Chapter 7 work is optional Carathéodory/LOO/report packaging; main active lane should move to Chapter 8 unless exact Theorem 7.3 reporting is requested. |
| Chapter 8 proximal methods | local-layer | `StatInference/Optimization/Proximal.lean` | The Chapter 8 lane has compiled supplied-interface Theorem 8.5 and Theorem 8.6/APGD packets. `compositeObjective` packages `F = f + g`, `proximalGradientModel` is the model minimized by PGD, and `IsProximalGradientStep` records the model minimizer/quadratic-growth certificate. The compiled one-step theorem `proximalGradient_oneStep_ineq` proves Chewi inequality `(8.1)`; `chewi85_final_gap_le_geometric_denominator_of_oneStep` reuses Chapter 3 recurrence. The pushed 8.6 additions are `IsChewi86APGDTrajectory`, `proximalGradient_gap_le_inner_form`, `chewi86_weighted_two_point_bound_telescope`, `chewi86_weighted_sum_bound`, and `chewi86_gap_le_two_beta_dist_sq_over_nat_sq`, reusing Chapter 5.10 lambda/telescope algebra. Search-first result: no direct mathlib proximal-gradient/Moreau theorem was found. Next main lane is Chapter 9 Fenchel/Bregman/mirror descent. |
| Chapters 9-11 deterministic algorithms | local-layer-started | `StatInference/Optimization/Fenchel.lean`, `StatInference/Optimization/Bregman.lean`, `StatInference/Optimization/MirrorDescent.lean`, `StatInference/Optimization/AlternatingBregman.lean`, `StatInference/Optimization/AlternatingMinimization.lean`, `StatInference/Optimization/RandomizedAlternatingMinimization.lean` | The finite-valued Chapter 9/10 substrate builds through `StatInference`. `Fenchel.lean` introduces finite-valued conjugate certificates, Fenchel-Young/subgradient equivalences, weak double conjugation, `StrongSubgradientMonotoneOn`, and `fenchelGradient_lipschitz_of_strongSubgradientMonotone` for Lemma 9.12's core estimate. `Bregman.lean` introduces `bregmanDivergence`, `RelativelyStrongConvexOn`, `RelativelySmoothOn`, relative lower/upper model wrappers for Propositions 10.5/10.6, and `RelativelyStrongConvexOn.growth_of_stationary` for Lemma 10.7. `MirrorDescent.lean` now proves the supplied-interface Theorem 10.9 one-step MPGD inequality, descent/trajectory accessors, scalar recurrence/weighted denominator wrappers, the full displayed MPGD rate from `lambda_h`, Theorem 10.11 through the nonsmooth MPGD recurrence, average-gap bound, averaged-iterate/Jensen wrapper, trajectory wrappers, displayed step-size corollaries, and ordinary Hilbert-norm analytic discharge, plus Theorem 10.13 OMD fixed-comparator regret and displayed step-size corollary in ordinary Hilbert norm. `AlternatingBregman.lean` now proves the Chapter 11 ABP projection certificate/trajectory layer, Lemma 11.2 finite telescope, monotonicity chain halves, and display `(11.1)` existential finite-minimum wrapper. `AlternatingMinimization.lean` now proves the scalar Theorem 11.4 post-threshold inverse-gap/telescope layer, source recurrence/half-threshold bridge, max recurrence, above-threshold halving/burn-in consumers, below-threshold quadratic recurrence, threshold-tail and initial-threshold `K/M` rates, log-burn-in threshold existence and epsilon tail endpoints via the reused Chapter 5 log-halving lemma, `IsChewi114AMSourceCertificate`, `IsChewi114AMDescentCertificate`, the block-descent-to-source bridge, and source `K = 8 * beta * D^2 * R^2` wrappers. `RandomizedAlternatingMinimization.lean` now starts Theorem 11.5 with strong and zero-curvature expected-gap certificates: the strong recurrence gives the displayed geometric factor, and the weak recurrence reuses the 11.4 inverse-gap telescope to prove `2 * D * R_beta^2 / N` and epsilon forms, including nonnegative zero-hit wrappers without a strict-positive gap assumption. It also compiles strong and weak Hopf-Lax bridge certificates that convert Chewi's conditional-expectation display plus Exercise 9.3 bounds into those rate certificates, and finite block-model conditional-upper theorems that turn pointwise block smooth model estimates plus source convexity algebra into the certificate `conditional_upper` field. Next lane is the selected Hopf-Lax/Moreau model value and Exercise 9.3 strong/weak source bounds needed for the supplied fields; Sinkhorn 11.7/11.8 follows after that. |
| Chapter 12 stochastic optimization | local-layer-started | `StatInference/Optimization/StochasticGradient.lean` | The Chapter 12 lane now compiles the scalar SMPGD weighted-average/Gronwall spine through `weightedSumBound_of_gronwall_negative_forcing_with_error`, `weightedAverageGap_le_of_gronwall_negative_forcing_with_error`, and `chewi121_weightedAverageGap_le_of_oneStep`, the source displayed one-step and closed-rate wrappers, the expected-model bridge, the expected-lower-model handoff wrappers, the RMS analytic wrappers, the component wrappers `chewi121_smooth_hcore_of_expected_components`, `chewi121_nonsmooth_hcore_of_expected_components`, `chewi121_smooth_weightedAverageGap_le_geometric_of_component_model_bounds`, and `chewi121_nonsmooth_weightedAverageGap_le_geometric_of_component_model_bounds`, the finite-support stochastic-gradient packet through `chewi121_smooth_weightedAverageGap_le_geometric_of_finite_components` and `chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_components`, the Bochner-integral packet through `chewi121_smooth_weightedAverageGap_le_geometric_of_integral_components` and `chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_components`, the smooth L2/Hölder probability packet `chewi121_integral_noise_bound_of_l2_roots`, `chewi121_smooth_hcore_of_integral_l2_noise_components`, and `chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_noise_components`, the sampled-model bridge packet `chewi121_smooth_raw_point_of_sampled_model`, `chewi121_nonsmooth_raw_point_of_sampled_model`, `chewi121_smooth_absorb_of_relativeSmoothOn`, `chewi121_finite_sampled_growth_of_steps`, and `chewi121_finite_sampled_star_upper_of_unbiased`, the finite sampled endpoint packet `chewi121_smooth_hcore_of_finite_sampled_models`, `chewi121_nonsmooth_hcore_of_finite_sampled_models`, `chewi121_smooth_weightedAverageGap_le_geometric_of_finite_sampled_models`, and `chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_sampled_models`, the smooth integral-L2 sampled-model packet `chewi121_smooth_hcore_of_integral_l2_sampled_models` and `chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models`, the smooth Bochner-unbiased packet `chewi121_integral_sampled_growth_of_steps`, `chewi121_integral_sampled_star_upper_of_unbiased`, and `chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_unbiased`, the smooth source variance-bound wrapper `chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_unbiased_of_variance_bound`, the non-smooth source-L2 sampled packet `chewi121_integral_average_le_l2_root_of_probability`, `chewi121_nonsmooth_hcore_of_integral_l2_sampled_models`, and `chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models`, the non-smooth relative-subgradient endpoint, the generic weighted averaged-iterate packet, the final source-shaped smooth/non-smooth averaged-iterate wrappers, and the exact displayed-error-factor bridges `chewi121_smooth_displayed_error_rhs_of_stronger`, `chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_stronger`, `chewi121_nonsmooth_displayed_error_rhs_of_stronger`, and `chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_stronger`; the module is root-imported by `StatInference.lean`. Search-first result: no local SMPGD theorem existed; reuse `DiscreteGronwall.lean`, Chapter 10 MPGD weighted-denominator algebra, local finite averaging/Jensen APIs, local probability/expectation modules, mathlib `ConvexOn.map_centerMass_le`, `eventually_finset_ball`, `integrable_finsetSum`, `integral_finsetSum`, `integral_const_mul`, `integral_mono_ae`, `ContinuousLinearMap.integral_comp_comm`, `integral_inner`, `sum_inner`, `inner_sum`, `integral_mul_le_Lp_mul_Lq_of_nonneg`, `Real.HolderConjugate.two_two.ennrealOfReal`, `Probability.Moments.CovarianceBilinDual`, and Bochner/L2 APIs. Next target is no longer raw finite `ψ_x` algebra, finite growth, finite star-upper averaging, finite sampled smooth/pointwise-bounded non-smooth rate assembly, integral transport, smooth Cauchy-Schwarz noise, smooth sampled source-L2 assembly, smooth Bochner growth/star-upper transport, smooth `(12.1)` variance domination, non-smooth relative-subgradient star-upper discharge, the non-smooth `(12.2)` sampled lower-model/rate endpoint, Jensen transport to the weighted stochastic averaged iterate, final smooth/non-smooth averaged-iterate wrappers, or the displayed `(1 + alphaG * h)` RHS factor; it is the remaining exact source probability discharge and process packaging before ASGD CLT material. |
| Chapter 13 and Appendix A | local-layer-started | `StatInference/Optimization/InteriorPoint.lean` | Chapter 13 is now open with a one-dimensional self-concordance substrate for the logarithmic barrier. `InteriorPoint.lean` defines `negLogBarrier`, the displayed second/third derivative oracles, `oneDimLocalNorm`, and `OneDimSelfConcordantOn`, then proves `negLogBarrier_deriv`, `negLogBarrier_second_deriv`, `negLogBarrier_third_deriv`, `negLogBarrier_localNorm_eq_abs_div`, `negLogBarrier_selfConcordance_ineq`, and `negLogBarrier_oneDimSelfConcordantOn_Ioi`, formalizing Chewi Example 13.4 for `x ↦ -log x` on `ℝ_{>0}`. Search-first result: reuse mathlib `Real.deriv_log`, `deriv_inv`, `deriv_zpow`, `zpow_pos`, `Real.sq_sqrt`, `sq_eq_sq₀`, `inv_pow`, and scalar `field_simp`/`nlinarith`; no local Newton/self-concordance module existed before this packet. Next Chapter 13 step is to lift from the one-dimensional source example to the vector/matrix local-norm interface for Definitions 13.2/13.3 and Lemma 13.6, reusing mathlib linear algebra and existing ellipsoid matrix infrastructure. |

Chapter 13 row update: the newest `InteriorPoint.lean` packet adds the
vector supplied-Hessian layer for Definitions 13.2, 13.5, and 13.7:
`localNorm`, `dualLocalNorm`, `dikinEllipsoid`, `newtonStep`,
`newtonDecrement`, `localNorm_nonneg`, `dualLocalNorm_nonneg`,
`localNorm_sq_eq_inner`, `dualLocalNorm_sq_eq_inner`, `localNorm_zero`,
`dualLocalNorm_zero`, `newtonStep_sub`, `sub_newtonStep`,
`SelfConcordantOn`, `SelfConcordantOn.of_zero_third`, and
`constantHessian_zeroThird_selfConcordantOn`.  This proves the source
observation that quadratic models, represented by zero third derivative and a
positive-semidefinite supplied Hessian, are self-concordant for every positive
parameter.  The latest Lemma 13.6 algebra packet adds
`HessianQuadraticBounds`,
`localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticUpper`,
`sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticLower`,
`localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticBounds`,
`sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticBounds`,
`localNorm_le_div_one_sub_of_hessianQuadraticUpper`, and
`mul_one_sub_localNorm_le_of_hessianQuadraticLower`, giving the source-shaped
local-norm lower/upper consequences once the analytic self-concordance
argument supplies Hessian quadratic-form bounds.  The newest segment-envelope
packet adds `scalar_le_exp_of_abs_deriv_le`,
`chewi136HessianStabilityExponent`, `chewi136_exp_stability_upper`,
`chewi136_exp_stability_lower`, `HessianSegmentExponentialBounds`,
`HessianSegmentExponentialBounds.toHessianQuadraticBounds`,
`localNorm_le_div_one_sub_of_hessianSegmentExponentialBounds`,
`mul_one_sub_localNorm_le_of_hessianSegmentExponentialBounds`, and
`localNorm_sandwich_of_hessianSegmentExponentialBounds`, converting the
Chewi `ψ(t)` Gronwall endpoint estimates into the compiled Hessian and
local-norm sandwiches.  Search-first result: reuse mathlib
`Analysis/ODE/Gronwall`, `gronwallBound`,
`norm_le_gronwallBound_of_norm_deriv_right_le`, `Real.exp_log`,
`Real.exp_neg`, `sq_le_sq₀`, `Real.sq_sqrt`, `Real.sqrt_sq`, and, for later
finite-coordinate work, `ContinuousLinearMap.IsPositive`/matrix `PosSemidef`
APIs; no direct Chewi Lemma 13.6 Hessian-stability theorem exists locally or
in pinned mathlib.  The latest scalar analytic packet adds
`scalar_le_exp_antideriv_of_abs_deriv_le`,
`scalar_exp_neg_antideriv_le_of_abs_deriv_le`,
`scalar_exp_sandwich_of_abs_deriv_le_antideriv`,
`chewi136HessianStabilityPrimitive`,
`chewi136HessianStabilityPrimitive_zero`,
`chewi136HessianStabilityPrimitive_one`, and
`chewi136HessianStabilityPrimitive_hasDerivAt`, giving the variable-coefficient
Gronwall antiderivative calculus for Chewi's displayed `2 M r / (1 - M r t)`
coefficient.  The newest interval/psi bridge adds
`scalar_le_exp_antideriv_of_abs_deriv_le_on_Icc`,
`scalar_exp_neg_antideriv_le_of_abs_deriv_le_on_Icc`,
`scalar_exp_sandwich_of_abs_deriv_le_antideriv_on_Icc`,
`chewi136HessianStabilityPrimitive_continuousOn_Icc`,
`chewi136HessianStabilityPrimitive_hasDerivWithinAt_Icc`,
`HessianSegmentPsiCertificate`, and
`HessianSegmentPsiCertificate.toHessianSegmentExponentialBounds`, so the
per-vector `ψ(t)` certificate now compiles directly to
`HessianSegmentExponentialBounds`.  The latest concrete segment packet adds
`hessianSegmentPoint`, `hessianSegmentPoint_zero`,
`hessianSegmentPoint_one`, `hessianSegmentPsi`, `hessianSegmentPsi_zero`,
`hessianSegmentPsi_one`, `HessianSegmentConcretePsiCertificate`,
`HessianSegmentConcretePsiCertificate.toHessianSegmentPsiCertificate`,
`HessianSegmentConcretePsiCertificate.toHessianSegmentExponentialBounds`, and
`localNorm_sandwich_of_hessianSegmentConcretePsiCertificate`, so concrete
Chewi `z_t`/`ψ_v(t)` certificates now close directly to the local-norm
sandwich.  The newest mixed-third derivative packet adds
`hessianSegmentPoint_hasDerivAt`,
`hessianSegmentPoint_eq_lineMap`,
`hessianSegmentPoint_mem_of_convex`,
`hessianSegmentPoint_mem_of_convex_interior`,
`hessianSegmentPoint_continuous`,
`hessianSegmentPsi_continuousOn_of_continuousOn`,
`hessianSegmentPsi_continuousOn_of_continuous`,
`hessianSegmentPsi_continuousOn_of_convex_continuousOn`,
`hessianSegmentPsi_hasDerivAt_of_hasFDerivAt`,
`hessianSegmentPsi_hasDerivWithinAt_of_hasFDerivAt`,
`hessianSegmentLocalNorm_hasDerivWithinAt_of_hasFDerivAt`,
`hessianSegmentMixedThirdPsiDeriv`,
`hessianSegmentLocalNorm_hasDerivWithinAt_of_mixedThird`,
`localNorm_pos_of_inner_pos`,
`hessianSegmentLocalNorm_continuousOn_of_continuousOn`,
`hessianSegmentLocalNorm_continuousOn_of_convex_continuousOn`,
`hessianSegmentLocalNorm_pos_of_hessian_pos`,
`HessianSegmentMixedThirdCertificate`,
`HessianSegmentMixedThirdLocalNormCertificate`,
`MixedThirdSelfConcordantOn`,
`hessianSegmentLocalNorm_riccatiDerivBound_of_mixedThirdSelfConcordantOn`,
`scalar_riccati_upper_bound_on_unit_interval`,
`hessianSegmentLocalNorm_le_of_riccati_bound`,
`hessianSegmentLocalNorm_le_of_riccati_bound_of_mul_lt`,
`HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn`,
`HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn_of_hasFDerivAt`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt`,
`hessianSegmentCoeffBound_of_localNorm_bound`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive`,
`HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius`,
the mixed-third certificate-to-exponential bridges,
`localNorm_sandwich_of_hessianSegmentMixedThirdCertificate` /
`localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate`, and
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound` /
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound` /
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm` /
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive` /
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius` /
`chewi136_localNorm_sandwich_sourceRadius`, and the first Newton/Dikin
consequence layer
`localNorm_newtonStep_sub_eq_newtonDecrement_of_inner`,
`newtonStep_mem_dikinEllipsoid_of_newtonDecrement_lt`,
`newtonStep_mem_dikinEllipsoid_of_inner_of_newtonDecrement_lt`,
`newtonStep_mem_dikinEllipsoid_inv_of_mul_newtonDecrement_lt`,
`newtonStep_mem_dikinEllipsoid_inv_of_inner_of_mul_newtonDecrement_lt`, and
`chewi136_newtonStep_localNorm_sandwich_sourceRadius`.  The newest
dual-transport packet adds `InverseHessianQuadraticBounds`,
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
`chewi138_deltaCoefficient_integral_eq_mul`.
The newest positivity/source-radius packet derives segment local-norm
positivity from a source-shaped positive-definite Hessian hypothesis and
`y - x ≠ 0`, then proves the named source-radius Lemma 13.6(4) local-norm
sandwich with `r = ||y - x||_x`.  The Newton packet proves the supplied-oracle
Definition 13.7 identity `lambda = ||x+ - x||_x`, converts `M * lambda < 1`
into `x+ in Dikin(x, 1/M)`, and specializes Lemma 13.6 to the Newton segment.
The dual-transport packet proves the supplied-inverse-Hessian comparison needed
for the first displayed inequality in Theorem 13.8.  The assembly packet turns
a supplied Delta/gradient-residual quadratic bound into
`||grad(x+)||_x^* <= M*lambda^2/(1-M*lambda)` and then combines it with dual
transport to prove the final `lambda(x+) <= M*lambda^2/(1-M*lambda)^2`
inequality.  The scalar coefficient packet formalizes the source computation
`int_0^1 ((1 - M*lambda*t)^(-2) - 1) dt = M*lambda/(1-M*lambda)` used in the
Delta/operator-norm estimate.  The newest concrete Delta-action packet adds
`hessianSegmentDelta`,
`hessianSegmentHessian_intervalIntegrable_of_continuousOn`,
`hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn`,
`hessianSegmentDelta_apply`,
`chewi138_gradientResidual_eq_hessianSegmentDelta_step`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaQuadraticBound`,
so the residual route now uses the actual integrated Hessian-difference
operator rather than a supplied Delta action formula.  The newest concrete
Delta scalar/order packet adds
`hessianSegmentDelta_inner_eq_integral_sub_of_continuousOn`,
`hessianSegmentDelta_inner_le_of_localNormUpper`,
`hessianSegmentDelta_quadraticBound_of_localNormUpper_and_dualEnergy`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaEnergy`,
so the final decrement wrapper can consume local-norm segment upper bounds plus
the remaining dual-energy/order comparison instead of a hand-supplied
`HessianDeltaQuadraticBound`.  The newest normalized-operator packet adds
`hessianDeltaQuadraticBound_of_normalizedOperator`,
`hessianSegmentDelta_quadraticBound_of_normalizedOperator`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta`,
matching Chewi's
`||H(x)^(-1/2) Delta H(x)^(-1/2)||_op <= M*lambda/(1-M*lambda)` line.  The
newest normalized squared-bound packet adds
`continuousLinearMap_opNorm_le_of_norm_sq_le`,
`hessianDeltaQuadraticBound_of_normalizedSquaredBound`,
`hessianSegmentDelta_quadraticBound_of_normalizedSquaredBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSquaredConcreteDelta`,
so callers can provide the squared pointwise normalized estimate directly.  The
newest normalized unit-bilinear packet adds
`continuousLinearMap_opNorm_le_of_unit_inner_le`,
`hessianDeltaQuadraticBound_of_normalizedUnitInnerBound`,
`hessianSegmentDelta_quadraticBound_of_normalizedUnitInnerBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedUnitInnerConcreteDelta`,
reusing mathlib's `ContinuousLinearMap.opNorm_le_of_re_inner_le` for the
unit-bilinear-to-op-norm conversion.  The newest normalized
symmetric-quadratic packet adds
`continuousLinearMap_opNorm_le_of_isSymmetric_abs_inner_le`,
`hessianDeltaQuadraticBound_of_normalizedSymmetricQuadraticBound`,
`hessianSegmentDelta_quadraticBound_of_normalizedSymmetricQuadraticBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSymmetricQuadraticConcreteDelta`,
reusing mathlib's `ContinuousLinearMap.norm_eq_iSup_rayleighQuotient` for the
self-adjoint absolute-quadratic-form-to-op-norm conversion.  The newest
concrete Delta symmetry packet adds
`hessianSegmentHessian_intervalIntegral_isSymmetric_of_continuousOn` and
`hessianSegmentDelta_isSymmetric_of_continuousOn`, proving the integrated
Hessian-difference operator is symmetric from pointwise Hessian symmetry along
the segment.  The newest normalized adjoint-conjugation packet adds
`continuousLinearMap_adjointConj_isSymmetric_of_isSymmetric`,
`hessianSegmentDelta_adjointConj_isSymmetric_of_continuousOn`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedAdjointConjSymmetricQuadraticConcreteDelta`,
reusing mathlib's `IsSelfAdjoint.adjoint_conj` so `normalized = coord† Delta
coord` supplies the normalized self-adjointness input.  The newest
coordinate-factorization packet adds
`hessianDeltaDualFactor_of_adjointCoord`,
`hessianPrimalFactor_of_adjointSqrt`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta`,
deriving the Theorem 13.8 dual/primal square-root factors from coordinate
identities.  The newest local-norm-to-Rayleigh packet adds
`hessianQuadraticLower_of_mul_le_localNorm`,
`hessianQuadraticLower_of_mul_one_sub_localNorm_le`,
`chewi138_hessianSegmentDelta_integral_neg_le_of_hessianLower`,
`chewi138_hessianSegmentDelta_integral_neg_le_of_localNormLower`,
`hessianSegmentDelta_inner_neg_le_of_localNormLower`,
`hessianSegmentDelta_abs_inner_le_of_localNormSandwich`,
`adjointConj_inner_eq_delta_inner`,
`normalizedAdjointConj_absQuadBound_of_deltaAbsQuadBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_localNormSandwich`.
This closes the normalized absolute quadratic-form obligation from a
source-shaped two-sided local-norm sandwich plus square-root coordinate
identities.  The newest Newton-segment sandwich packet adds
`localNorm_smul_of_nonneg`, `hessianSegmentPoint_sub_left`, and
`chewi138_newtonSegment_localNorm_sandwich_sourceRadius`, proving the
pointwise `z_t` local-norm sandwich from Lemma 13.6 source-radius.  The newest
source-Newton-segment assembly packet adds
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
feeding that sandwich into the 13.8 Rayleigh decrement wrapper and deriving
segment membership/Hessian nonnegativity from convexity and
`MixedThirdSelfConcordantOn`.  The newest dual-transport packet adds
`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div`,
`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div_one_sub`, and
`chewi138_newtonDecrement_step_le_of_dualLocalNormUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so a Chewi Lemma 13.6-style dual-local-norm upper comparison now supplies the
raw inverse-Hessian quadratic upper comparison automatically.  The newest
duality packet adds
`dualLocalNorm_le_div_of_localNorm_lower_and_inverseIdentity`,
`dualLocalNorm_le_div_one_sub_of_localNorm_lower_and_inverseIdentity`, and
`chewi138_newtonDecrement_step_le_of_primalLowerDualIdentity_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
deriving that dual transport from the compiled Lemma 13.6 primal lower
sandwich, a supplied Cauchy bridge at `x`, and a supplied inverse-local
identity at `x+`.  The newest Cauchy packet adds
`dualPrimalCauchy_of_adjointCoordSqrt` and
`chewi138_newtonDecrement_step_le_of_inverseLocal_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
deriving the Cauchy bridge from the same `coord`/`sqrtH` factorization already
used by the normalized Rayleigh line.  The newest right-inverse packet adds
`inverseHessianQuadratic_nonneg_of_hessian_right_inverse`,
`localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse`,
`inverseHessianQuadratic_nonneg_of_adjointCoordFactor`, and
`chewi138_newtonDecrement_step_le_of_hessianRightInverse_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
deriving inverse-Hessian nonnegativity and the inverse-local identity from the
concrete right-inverse equation.  The newest right-inverse-at-`x` packet adds
`localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse` and
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the Definition 13.7 norm identity is also derived from the concrete
right-inverse equation at `x`.  The live 13.8 blockers are now the concrete
coordinate/square-root identities and right-inverse identities at `x` and `x+`
for the concrete Hessian inverse model.  The newest zero-step packet adds
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment_or_zero`,
which splits off `x+ = x` and proves the decrement bound directly from
Newton's linear equation, so the current source-facing 13.8 wrapper no longer
requires a nonzero Newton step.  The newest continuous-equivalence coordinate
packet adds
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_continuousLinearEquivCoord_of_sourceNewtonSegment`,
deriving `coord sqrtH = id` and `sqrtH coord = id` from one
`sqrtCoord : E ≃L[ℝ] E` with `coord = sqrtCoord.symm.toContinuousLinearMap`
and `sqrtH = sqrtCoord.toContinuousLinearMap`.  The remaining concrete
13.8 model blockers are now the right-inverse identities at `x` and `x+`,
the square-root Hessian factorization `hess x = sqrtH†sqrtH`, and the Delta
normalization identity in that coordinate model.  The newest adjoint/square-
root packet adds
`inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse`
and
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_adjointSqrtCoord_of_sourceNewtonSegment`,
deriving `<v, invHess(x)v> = ||coord†v||^2` from `hess x = sqrtH†sqrtH`,
`hess(x)(invHess(x)v)=v`, and the coordinate equivalence.
The newest right-inverse-on packet adds
`chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoord_of_sourceNewtonSegment`,
so the source-facing 13.8 route now asks for one feasible-set inverse-Hessian
identity `∀ z ∈ s, ∀ v, hess z (invHess z v) = v` instead of separate
right-inverse identities at `x` and `x+`.  It also adds
`chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoordDelta_of_sourceNewtonSegment`,
which takes the normalized Delta operator definitionally as `coord† Delta
coord` and removes the separate normalization-equality hypothesis from the
preferred route.
The newest concrete square-root-family packet adds
`hessianSymmetric_of_adjointSqrt`,
`hessianQuadratic_pos_of_adjointSqrtCoord`,
`hessianRightInverse_of_adjointSqrtCoord_invHess`, and
`chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment`.
Thus `hess z = S_z†S_z` and `invHess z = S_z^{-1}(S_z^{-1})†` now discharge
Hessian symmetry, positive definiteness, the on-set inverse-Hessian
right-inverse identity, and the preferred canonical-Delta 13.8 wrapper.
The newest one-dimensional barrier model packet adds real scalar CLM/CLE
helpers and instantiates Chewi Examples 13.4/13.10 with
`negLogHessCLM`, `negLogInvHessCLM`, `negLogSqrtCoord`,
`negLogHessCLM_sqrtCoord_model_Ioi`, and
`negLogInvHessCLM_sqrtCoord_model_Ioi`; the `-log` Hessian model on `ℝ_{>0}`
now has the square-root/inverse-Hessian equalities required by the compiled
Theorem 13.8 source wrapper.  The newest barrier-parameter packet adds
`negLogBarrier_deriv_sq_div_second_eq_one` and
`negLogBarrier_dualLocalNorm_deriv_eq_one`, closing the Chewi Example 13.10
calculation `f'(x)^2 / f''(x) = 1` and the exact Definition 13.7 dual-local
norm identity `||f'(x)||_x^* = 1` for `x > 0`.  The newest finite-product
barrier packet adds `positiveOrthant`, `positiveOrthantNegLogBarrier`,
`positiveOrthantNegLogGrad`, `positiveOrthantNegLogInvHessCLM`, and
`positiveOrthantNegLog_dualLocalNorm_grad_eq_sqrt_card`, proving the exact
positive-orthant identity `||grad f(x)||_x^* = sqrt d` for the coordinatewise
sum of `-log` barriers and giving the expected barrier parameter `d`.  The
newest positive-orthant square-root model packet adds
`positiveOrthantNegLogHessCLM`, `positiveOrthantNegLogSqrtCoordOfMem`,
`positiveOrthantNegLogSqrtCoord`, the self-adjointness lemmas for the
coordinate and inverse-coordinate maps, and
`positiveOrthantNegLogHessCLM_sqrtCoord_model_positiveOrthant` /
`positiveOrthantNegLogInvHessCLM_sqrtCoord_model_positiveOrthant`, giving the
diagonal finite-product model equalities required by the generic Theorem 13.8
square-root-family wrapper.  The newest positive-orthant 13.8 specialization
packet adds `convex_positiveOrthant` and
`chewi138_positiveOrthant_newtonDecrement_step_le_of_sourceNewtonSegment`,
fixing the barrier Hessian, inverse-Hessian, and square-root coordinate model
inside the generic Newton-decrement convergence wrapper while keeping the
gradient oracle generic for central-path objectives.  The newest mixed-third
preparation packet adds `positiveOrthantNegLogThirdMixed`,
`positiveOrthantNegLogHessCLM_quadratic_eq_sum`,
`positiveOrthantNegLogHessCLM_quadratic_nonneg`,
`positiveOrthantNegLog_localNorm_sq_eq_sum`,
`positiveOrthantSquareVec`, `positiveOrthantSquareVec_norm_le_norm_sq`,
`positiveOrthantNegLog_localNorm_eq_sqrtCoord_norm`,
`positiveOrthantNegLogThirdMixed_eq_neg_two_inner_sqrt_squareVec`,
`positiveOrthantNegLog_mixedThird_bound`, and
`positiveOrthantNegLog_mixedThirdSelfConcordantOn`.  The finite weighted
Cauchy blocker is now closed for the concrete positive-orthant product
barrier.  The follow-up concrete wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment`
now supplies that certificate into Theorem 13.8 with `M = 1` and
`thirdMixed = positiveOrthantNegLogThirdMixed`.  The follow-up Hessian-
derivative packet adds `positiveOrthantNegLogHessDerivCLM`,
`positiveOrthantNegLogHessDerivCLM_mixed_inner`, and
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_sourceNewtonSegment`,
so the mixed-third identity is packaged too.  The additional wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_hasFDeriv_sourceNewtonSegment`
derives Hessian continuity from the same `HasFDerivAt` proof.  Next focus on
the remaining Hessian/gradient differentiability and Newton-linearization
hypotheses, or the Proposition 13.11 barrier-calculus lift.
Search
found no direct mathlib/local theorem for the derivative of
`fun t => inner ℝ v (hess (z_t) v)` or for this exact Riccati comparison; the
compiled route uses `HasFDerivAt.comp_hasDerivAt`, `HasDerivAt.clm_apply`,
`HasDerivAt.inner`, `HasDerivWithinAt.sqrt`, `HasDerivWithinAt.inv`, and
`monotoneOn_of_hasDerivWithinAt_nonneg`.  For the concrete Delta action, reuse
`ContinuousOn.intervalIntegrable_of_Icc` and
`ContinuousLinearMap.intervalIntegral_comp_comm`, `innerSL_apply_apply`,
`intervalIntegral.integral_sub`, `ContinuousLinearMap.le_opNorm`, and
`ContinuousLinearMap.opNorm_le_of_re_inner_le`, plus
`ContinuousLinearMap.norm_eq_iSup_rayleighQuotient`, `real_inner_comm`, and
`LinearMap.IsSymmetric.sub`, `IsSelfAdjoint.adjoint_conj`, and
`ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right`; do not reprove
Bochner interval-integral, inner-product/application commutation, Delta
symmetry from pointwise Hessian symmetry, adjoint-conjugation symmetry,
dual/primal square-root factorization from coordinate identities, or
operator-norm-from-unit-bilinear/Rayleigh estimates.
Faraday's follow-up scout found no
one-shot Hessian-derivative/third-Frechet bridge, but identified
`fderiv_iteratedFDeriv`, `iteratedFDeriv_succ_apply_left/right`,
`iteratedFDeriv_two_apply`, and `ContDiffAt.iteratedFDeriv_comp_perm` as the
right API stack.  Next Chapter 13 work should prove the concrete normalized
Delta factorization plus either the pointwise squared, unit-bilinear, or
self-adjoint absolute-quadratic bound.  On the Rayleigh path, instantiate the
square-root family model and use the compiled
`chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment`;
do not separately pass Hessian positivity, symmetry, right-inverse identities,
or normalized-Delta equalities.

Chapter 12 row update: the non-smooth relative-subgradient packet now also
compiles `IsRelativeSubgradientAt`,
`chewi121_integral_sampled_star_upper_of_relativeSubgradient`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_relativeSubgradient`.
This supersedes the older note that non-smooth growth/star-upper fields remain
supplied for the source-L2 sampled route.  The newest averaged-iterate packet
adds `weightedSampleAverage`,
`integral_weightedSampleAverage_gap_le_of_weighted_gap_bound`, and
`chewi121_weightedSampleAverage_gap_le_geometric_of_weightedAverageGap`, using
mathlib `ConvexOn.map_centerMass_le` and Bochner finite-sum integral APIs to
turn the closed weighted expected-gap rate into the source-shaped rate at a
weighted stochastic averaged iterate.  The newest final-wrapper packet adds
`chewi121_smooth_weightedSampleAverage_gap_le_geometric_of_integral_l2_sampled_models_unbiased_of_variance_bound`
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_geometric_of_integral_l2_sampled_models_relativeSubgradient`,
so the smooth `(12.1)` and non-smooth relative-subgradient endpoints now
conclude directly at the source-shaped averaged iterate.  The newest displayed
RHS packet adds `chewi121_smooth_displayed_error_rhs_of_stronger`,
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_stronger`,
`chewi121_nonsmooth_displayed_error_rhs_of_stronger`, and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_stronger`,
recovering Chewi's exact displayed `(1 + alphaG * h)` stochastic-error factor
from the stronger compiled averaged-iterate bounds.

The newest source-displayed wrapper packet adds
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_integral_l2_sampled_models_unbiased_of_variance_bound`
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_integral_l2_sampled_models_relativeSubgradient`,
so the exact displayed smooth and non-smooth Theorem 12.1 averaged-iterate
rates now compile directly from the source variance-bound and relative
subgradient hypotheses.

The newest process wrapper packet adds
`integral_eq_const_of_condExp_ae_eq_const`,
`integral_eq_const_of_filtration_condExp_ae_eq_const`,
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_filtration_condExp_unbiased_of_variance_bound`,
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_filtration_condExp_relativeSubgradient`.
These wrappers turn filtration-level conditional mean assumptions into the
unconditional unbiasedness and relative-subgradient mean fields consumed by
the exact displayed SMPGD rates.  The active Chapter 12 blocker is now the
ASGD/martingale layer: conditional mean-zero and covariance packaging,
quadratic ASGD decomposition, and then martingale CLT infrastructure.

The ASGD lane is now root-imported through `StatInference/Optimization/ASGD.lean`.
The first packet compiles `chewi123_asgd_noise_sum_split`,
`chewi123_asgd_scaled_average_decomposition`, and
`chewi123_asgd_sqrt_average_decomposition`, isolating the source `(12.5)`
finite-sum split into the martingale term with coefficient `Ainv` and the
remainder term with coefficient `M_k^n - Ainv`.  The next packet compiles
`chewi123_asgd_neg_linear_noise_clt`,
`chewi123_asgd_neg_linear_gaussian_limit`, and
`chewi123_asgd_distribution_limit_of_noise_and_remainders`, reusing mathlib
continuous mapping, Gaussian linear-map closure, and additive Slutsky to prove
that the scaled averaged ASGD error has the `-Ainv`-pushed weak limit once the
martingale CLT term is supplied and the initial/remainder terms are `o_P(1)`.
The newest ASGD packet compiles `Chewi127MartingaleDifferenceProcess`,
`Chewi127ConditionalCovarianceProcess`,
`Chewi127MartingaleCLTCertificate`,
`Chewi127MartingaleDifferenceProcess.integral_next_eq_zero`,
`Chewi127MartingaleCLTCertificate.asgd_distribution_limit`,
`Chewi127MartingaleCLTCertificate.neg_linear_covarianceBilinDual`,
`Chewi127MartingaleCLTCertificate.neg_linear_covarianceTable`, and
`chewi123_asgd_limit_package_of_martingale_certificate`.  This packages Chewi
Theorem 12.7 as a supplied martingale CLT certificate and reuses the Vaart
covarianceBilinDual/table pullback primitives to identify the `-Ainv` pushed
Gaussian covariance.  The newest source-interface packet compiles
`chewi127ScaledNoiseSum`, `chewi127AverageConditionalCovariance`,
`Chewi127AveragedConditionalCovarianceLimit`,
`chewi127_martingaleCLTCertificate_of_scaledNoiseSum`,
`Chewi127MartingaleDifferenceProcess.integral_linear_next_eq_zero`, and
`Chewi127ConditionalCovarianceProcess.integral_Xi_next_eq_integral_second_moment`.
The newest quadratic-ASGD recurrence packet compiles
`chewi123QuadraticStepMap`, `chewi123_quadratic_delta_step`,
`IsChewi123QuadraticASGDTrajectory`,
`IsChewi123QuadraticASGDTrajectory.delta_step`,
`chewi123TransitionProductFrom`,
`chewi123TransitionProductFrom_succ_apply`, `chewi123NoiseCoefficient`,
`chewi123_stepMap_noiseCoefficient_apply`,
`chewi123_quadratic_delta_unroll`,
`IsChewi123QuadraticASGDTrajectory.delta_unroll`,
`chewi123_quadratic_average_delta_unroll_nested`, and
`IsChewi123QuadraticASGDTrajectory.average_delta_unroll_nested`.  This closes
the exact source one-step recurrence, ordered transition product, finite
unrolling, and averaged nested display before `(12.5)`.  The newest
triangular-regrouping packet compiles `chewi123InitialCoefficient`,
`chewi123SourceNoiseCoefficient`, their apply lemmas,
`chewi123_nested_noise_sum_eq_source_indexed`,
`chewi123_source_indexed_nested_noise_sum_eq_source_coefficients`,
`chewi123_nested_noise_sum_eq_source_coefficients`,
`chewi123_quadratic_average_delta_unroll_source_coefficients`,
`chewi123_quadratic_average_delta_source_decomposition`,
`IsChewi123QuadraticASGDTrajectory.average_delta_source_decomposition`,
`chewi123_quadratic_sqrt_average_delta_source_decomposition`, and
`IsChewi123QuadraticASGDTrajectory.sqrt_average_delta_source_decomposition`.
It uses mathlib `Finset.sum_comm'`, `Finset.sum_Ico_eq_sum_range`, and
`ContinuousLinearMap.sum_apply`, and closes the source `M_k^N` regrouping,
the split around `A^{-1}`, and the `sqrt N`-scaled display.  The active
Chapter 12 blocker is now the actual one-dimensional bounded martingale CLT
proof behind the projected CLT field, then final ASGD endpoint wiring.  The
projected martingale-CLT packet compiles `chewi127ScaledProjectedNoiseSum`,
`chewi127ScaledProjectedNoiseSum_eq_apply_scaledNoiseSum`,
`chewi127AverageConditionalVariance`,
`Chewi127AveragedConditionalCovarianceLimit.variance_tendstoInMeasure`,
`chewi127_projected_clt_of_scaledNoiseSum_clt`,
`Chewi127ProjectedMartingaleCLTBridge`,
`Chewi127ProjectedMartingaleCLTBridge.toMartingaleCLTCertificate`,
`Chewi127BoundedMartingaleCLTSource`,
`Chewi127BoundedMartingaleCLTSource.toProjectedBridge`, and
`Chewi127BoundedMartingaleCLTSource.toMartingaleCLTCertificate`.  Search-first
result: no direct pinned mathlib or local Chewi-style bounded martingale CLT
was found; local reuse is the finite-dimensional Cramér-Wold and projected CLT
infrastructure in `StatInference/AsymptoticStatistics/MomentEstimators.lean`,
plus mathlib continuous mapping and local conditional-expectation/covariance
interfaces.  The newest scalar projection side-condition packet adds
`chewi127ScalarScaledSum`,
`chewi127ScaledProjectedNoiseSum_eq_scalarScaledSum`,
the `same_filtration` source field,
`Chewi127MartingaleDifferenceProcess.projected_stronglyAdapted`,
`Chewi127MartingaleDifferenceProcess.projected_integrable`,
`Chewi127MartingaleDifferenceProcess.condExp_linear_next_eq_zero`,
`Chewi127MartingaleDifferenceProcess.projected_uniform_bound`,
`Chewi127ConditionalCovarianceProcess.condExp_projected_square_eq`,
`Chewi127BoundedMartingaleCLTSource.projected_condExp_zero`,
`Chewi127BoundedMartingaleCLTSource.projected_conditional_second_moment`,
`Chewi127BoundedMartingaleCLTSource.projected_variance_tendstoInMeasure`,
`Chewi127BoundedMartingaleCLTSource.projected_uniform_bound`, and
`Chewi127BoundedMartingaleCLTSource.projected_scalar_clt`.  Search-first
result for this layer: mathlib's
`ContinuousLinearMap.comp_condExp_comm`, `condExp_smul`, Lévy/characteristic
function APIs, local Cramér-Wold wrappers, and `ContinuousLinearMap.le_opNorm`
are the relevant reuse; still no direct scalar martingale CLT theorem was
found.

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

Current active target after focused Lean verification of the Chapter 12 SMPGD
rate packets and ASGD scalar characteristic-function substrate:
treat Chapters 3-8, Chapter 9/10 mirror-descent substrate, Chapter 11.2/11.3
ABP telescope, Chapter 11.4 AM, Chapter 11.5 RAM, the 11.7 selector layer,
the 11.8 Sinkhorn/mirror-descent endpoint, and the Chapter 12 SMPGD rate
wrappers as stable infrastructure.  The live manual `/goal` frontier is now
`StatInference/Optimization/ASGD.lean`.  The stable ASGD stack already contains
the variance-side clamp, finite-average measurability, average abs-bound,
covariance-limit abs-bound, inverse-compensation product convergence, guarded
finite mixed-product tower, source-facing future-tail CLT/certificate wrappers,
honest `F_k`/`F_N` normalized-factor measurability, and terminal
measurability/integrability of the raw-prefix/normalized-tail split product,
the explicit mixed-tower defect decomposition/adaptor, and the adapted
compensated-prefix one-step identity
`projectedCompensatedRawPrefixProduct_integral_succ_eq`, plus the exact
mixed-defect compensated algebra identity
`projectedMixedTowerDefect_sum_eq_compensated_full_inverse_sub_error_product`,
and the conditional residual/correlation primitives
`integral_mul_condExp_residual_eq_zero_of_aestronglyMeasurable_left` and
`norm_integral_mul_condExp_residual_le_integral_norm_residual_mul_norm`, plus
the future-multiplier residual bridge
`projected_charFun_tendsto_exp_of_futureMultiplier_residual_sum`, and the
future-multiplier integrability bridge
`projectedMixedTowerFutureMultiplier_mul_rawStep_integrable`,
`projectedMixedTowerFutureMultiplier_mul_condRawStep_integrable`,
`projectedMixedTowerFutureMultiplier_mul_rawStepResidual_integrable`,
`projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum_of_condResidual_integrable`,
and
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum_of_condResidual_integrable`.
The source-integrability bridge also contains
`projectedMixedTowerFutureMultiplier_integrable_of_uniform_bound`,
`projectedMixedTowerFutureMultiplier_norm_le_one_ae`,
`projectedMixedTowerFutureMultiplier_condExp_norm_le_one_ae`,
`projectedRawCharFunStepFactor_integrable`,
`projectedRawCharFunStepFactor_residual_integrable`,
`projectedMixedTowerFutureMultiplier_condExp_mul_rawStepResidual_integrable`,
`projectedMixedTowerDefect_sum_norm_le_futureMultiplier_residual_sum_of_source_integrability`,
and
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_residual_sum_of_source_integrability`.
The residual-reduction bridge also contains
`projectedRawCharFunStepFactor_norm_le_one_ae`,
`projectedRawCharFunStepFactor_condExp_norm_le_one_ae`,
`projectedRawCharFunStepFactor_residual_norm_le_two_ae`,
`projectedFutureMultiplierResidualProduct_integral_le_two_mul_futureResidual_integral`,
`projectedFutureMultiplierResidualProduct_row_sum_le_two_mul_futureResidual_row_sum`,
and
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureMultiplier_l1_residual_sum`.
The future-tail reduction also contains
`projectedMixedTowerFutureTail`,
`projectedMixedTowerFutureTail_integrable_of_uniform_bound`,
`projectedMixedTowerFutureMultiplier_condExp_eq_rawPrefix_mul_tailCondExp`,
`projectedMixedTowerFutureMultiplier_residual_norm_le_tail_residual_ae`,
`projectedMixedTowerFutureMultiplier_l1_residual_le_tail_l1_residual`,
`projectedMixedTowerFutureMultiplier_l1_residual_row_sum_le_tail_l1_residual_row_sum`,
and
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_l1_residual_sum`.
The predictable-proxy bridge also contains
`integral_norm_sub_condExp_le_two_mul_integral_norm_sub_of_aestronglyMeasurable`
and
`projectedMixedTowerDefect_sum_tendsto_zero_of_futureTail_predictable_l1_approx`,
plus the downstream wrappers
`projected_charFun_tendsto_exp_of_futureTail_predictable_l1_approx` and
`projected_scalar_clt_of_futureTail_predictable_l1_approx`, the displayed
projected-noise wrapper
`projected_clt_of_futureTail_predictable_l1_approx`, and the vector
certificate constructors
`toProjectedBridge_of_futureTail_predictable_l1_approx` and
`toMartingaleCLTCertificate_of_futureTail_predictable_l1_approx`.  The
deterministic-proxy specialization also contains
`projected_charFun_tendsto_exp_of_deterministic_futureTail_l1_approx`,
`projected_scalar_clt_of_deterministic_futureTail_l1_approx`,
`projected_clt_of_deterministic_futureTail_l1_approx`,
`toProjectedBridge_of_deterministic_futureTail_l1_approx`, and
`toMartingaleCLTCertificate_of_deterministic_futureTail_l1_approx`.
Next theorem-sized packet: prove the weighted inverse-compensation proxy error
between `S.projectedInverseCompensationFactor L N t k` and
`chewi127LimitVarianceProxyFactor (S.covariance_limit.S_infty L L) N t`;
the compensated Taylor-error side is already isolated by existing
variance/remainder APIs and now plugs into the split endpoint.  The competing
fallback is the inverse-tail conditional-residual route, but the generic suffix
product, triangular weighted-counting algebra, canonical limit-variance proxy,
normalized-factor split, and endpoint plumbing are now closed.  Do not re-open
characteristic-function, scalar CLT, projected CLT, or certificate adapter
wiring unless the proxy theorem changes its interface.
Do not return to old Chapter 3, SMPGD source probability packaging, raw
tower-peel tasks, or already-compiled ASGD integrability/measurability wrappers
unless a regression makes them relevant.
Keep the concrete finite Sinkhorn KL identity layer as the next Chapter 11.8
blocker, but do not let it stall Chapter 12 coverage.
This paragraph supersedes older Chapter 6, Chapter 7, Chapter 8, Chapter 11.4,
and RAM next-target language below.
Fresh search result: reuse local 11.7 selectors and 11.8 wrappers, local
product/marginal probability wrappers, and mathlib
`InformationTheory.KullbackLeibler.Basic`/`ChainRule` plus
`MeasureTheory.Integral.Marginal`; no concrete local Sinkhorn
row/column-normalization KL identity was found yet.  For Chapter 12, no local
SMPGD theorem existed; the scalar/source-rate/model-bound/lower-model/RMS,
component-hcore, finite-support, Bochner-integral, smooth L2/Hölder noise,
finite sampled-model bridge, and finite sampled endpoint packets reuse local
Gronwall/geometric weight infrastructure; the weightedSampleAverage bridge
reuses mathlib Jensen/center-mass and Bochner finite-sum integral APIs.  The
active formal blocker is now the remaining exact sampled probability estimates
and process packaging before ASGD CLT material.

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
Chapter 4/5 notes below: the current manual `/goal` target has closed the main
Chapter 6 theorem packet through Theorem 6.25 source packaging, including
`chewi625_resisting_final_box_source_package_of_log_bound` and
`chewi625_exists_resisting_feasibility_instance_of_log_bound`.  The next
aggressive target is Chapter 7 Frank-Wolfe by theorem-sized module packets,
then Chapters 8-13.  Do not reroute to source-report packaging, Theorem
5.4/5.8/5.9/5.10, or Chapter 4 geometric-lower-bound polishing unless a current
Chapter 7 proof explicitly needs that dependency.

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
bound, the opt-value `sqrt(kappa)` rate lower bound, and the contrapositive
source obstruction ruling out `eps`-near optimality below that positive-log
rate in one statement.  The named standalone obstruction is
`exercise42InfiniteChainObjective_not_near_min_of_positiveLogRate_lt_concreteGradient`.
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
