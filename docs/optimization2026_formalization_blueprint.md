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

## Current Route Pointer

For live manual `/goal` work, use `Live Goal Prompt V76` near the top of
`docs/optimization2026_current_blocker_primitive_plan.md` and the snapshot section of
`docs/optimization2026_progress_dashboard.md`.  Later historical frontier
paragraphs in this blueprint are retained for source crosswalk and dependency
context only; they must not override the current Chapter 13/Appendix A
interior-point/matrix-order route.  If a run starts with a dirty Lean diff,
compile or record the precise blocker for that diff before changing strategy
docs.  The current speed rule is to move from that live prompt directly into
one endpoint-moving Lean theorem, with only one bounded API search for the
active blocker.  Each packet must also update the meta-methodology log:
record proof accelerators, friction sources, repeated searches to avoid, and
the shortest accurate next prompt.  This is part of building a reusable
formalization workflow for future statistical theory development in Lean.

Current V76 live route: the §13.16 Lean endpoint surface is source-facing and
report-blocked only by missing local PDF/screenshot tooling, while active proof
work has moved through Appendix A matrix infrastructure into Theorem 13.1's
range-space local Newton-convergence step.  V76 adds the reusable CLM
inverse-norm and local quadratic step wrappers
`chewi131_inverse_clm_opNorm_le_two_div_alpha_of_hessian_lower_half`,
`chewi131_local_quadratic_step_of_taylor_bound_clm`,
`chewi131_local_quadratic_step_of_taylor_bound_clm_of_hessian_lower_half`,
`chewi131_local_quadratic_step_and_half_of_taylor_bound_clm_of_hessian_lower_half`,
`chewi1316RangeCentralPathValue_local_quadratic_step_of_gradient_ftc`, and
`chewi1316RangeCentralPathValue_local_quadratic_step_and_half_of_gradient_ftc`.
The next live target is a sequence recurrence for the finite-row central-path
Newton iterates or a discharge of the concrete Hessian lower/Lipschitz and
feasible-segment assumptions exposed by those pointwise step theorems.  Do not
repeat the inverse-norm or range-coordinate search unless a specific
self-concordance/local-norm blocker requires it.

Historical route cache: the module
`StatInference/Optimization/AppendixA.lean` compiles and is root-imported,
with `chewiA4_loewnerOrder_iff_quadraticForm_le` and
`chewiA4_quadraticForm_lt_of_posDef_sub` formalizing Definition A.4's
Loewner/PSD quadratic-form bridge via mathlib `MatrixOrder` and PSD/PD
dot-product APIs.  It also starts Definition A.5 with
`chewiA5_transpose_mul_self_posSemidef` and
`chewiA5_dotProduct_mulVec_self_eq_transpose_mul_self_quadratic`, proving the
PSD and quadratic-form substrate for `A^T A`.  The V49 layer adds
`chewiA5_transpose_mul_self_le_scalar_one_iff_dotProduct_bound` and
`chewiA5_unit_dotProduct_mulVec_self_le_of_transpose_mul_self_le_scalar_one`,
so the source all-vector/unit-vector `A^T A <= C^2 I` bound is now compiled.
The V50 layer adds `chewiA5_l2_opNorm_le_of_transpose_mul_self_le_scalar_one`
and `chewiA5_transpose_mul_self_le_scalar_one_iff_l2_opNorm_le`, giving the
rectangular real-matrix equivalence `A^T A <= C^2 I <-> ||A||_op <= C` for
`C >= 0`.  The V51 layer adds
`chewiA5_l2_opNorm_le_of_abs_quadraticForm_bound` and
`chewiA5_symmetric_l2_opNorm_le_iff_neg_scalar_one_le_and_le_scalar_one`,
proving the symmetric-square corollary
`||A||_op <= C <-> -C I <= A <= C I` for Hermitian/symmetric real matrices and
`C >= 0`.  Search-first reuse came from mathlib Rayleigh quotient APIs,
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
Appendix A spectral theorem wrappers, PSD/PD eigenvalue criteria, source
Lemma A.3 quadratic-form interval statement, and symmetric Definition A.5
`||A||_op = max_i |lambda_i|` display.  Search-first reuse came from mathlib
Hermitian spectral theorem/eigenvalue APIs, CFC spectral order scalar-bound
lemmas, `Matrix.IsHermitian.spectrum_real_eq_range_eigenvalues`, and
`Finset.sup'`; the CStar norm/spectrum shortcut was not directly available
for real matrices, so the finite-max proof reuses the arbitrary-`C` iff.  The
V53 layer adds
`chewiA5_l2_opNorm_eq_sqrt_finset_sup_eigenvalues_transpose_mul_self` and
`chewiA5_l2_opNorm_eq_sqrt_finset_sup_abs_eigenvalues_transpose_mul_self`,
closing the rectangular Definition A.5 display
`||A||_op = sqrt(max_i |lambda_i(A^T A)|)` on nonempty finite domains.
Search-first reuse found mathlib singular values via `T†T`, but no direct
rectangular matrix theorem for `A^T A` versus `A A^T`; the proof uses the V50
arbitrary-constant op-norm bridge, V52 scalar eigenvalue bounds, PSD eigenvalue
nonnegativity, `Real.sq_sqrt`, `Real.sqrt_le_sqrt`, and `Finset.sup'`.  The
V54 layer adds
`chewiA5_charpoly_padding_transpose_mul_self_mul_self_transpose`,
`chewiA5_charpoly_transpose_mul_self_eq_X_pow_mul_self_transpose_of_card_le`,
`chewiA5_charpoly_mul_self_transpose_eq_X_pow_transpose_mul_self_of_card_le`,
and `chewiA5_charpoly_transpose_mul_self_eq_mul_self_transpose_of_card_eq`,
using mathlib's exact rectangular APIs `Matrix.charpoly_mul_comm'` and
`Matrix.charpoly_mul_comm_of_le` to formalize the source claim that `A^T A`
and `A A^T` have the same eigenvalues except zero multiplicity.  The V55 layer
adds `chewiA5_mul_self_transpose_posSemidef`,
`chewiA5_l2_opNorm_eq_sqrt_finset_sup_eigenvalues_mul_self_transpose`, and
`chewiA5_l2_opNorm_eq_sqrt_finset_sup_abs_eigenvalues_mul_self_transpose`,
using V53 on `Aᵀ` plus mathlib `Matrix.l2_opNorm_conjTranspose` to close the
source sentence that the same operator norm is also the square root of the
largest absolute eigenvalue of `A A^T`.  The V56 layer consumes the V51
symmetric op-norm/Loewner sandwich in Theorem 13.1's Hessian perturbation
display, adding `chewiA5_loewner_lower_of_l2_opNorm_sub_le`,
`chewiA5_loewner_upper_of_l2_opNorm_sub_le`,
`chewiA5_loewner_sandwich_of_l2_opNorm_sub_le`,
`chewiA4_scalar_one_le_scalar_one_of_le`,
`chewi131_hessian_lower_half_of_l2_opNorm_sub_le`, and
`chewi131_hessian_lower_half_of_lipschitz_opNorm`.  Search-first reuse came
from V51, mathlib `add_le_add`, `abel`, and
`smul_le_smul_of_nonneg_right` under `MatrixOrder`.  The V57 layer adds
`chewiA5_posDef_of_pos_scalar_one_le`,
`chewiA5_symmetric_l2_opNorm_le_of_nonneg_le_scalar_one`,
`chewi131_inverse_l2_opNorm_le_two_div_alpha_of_inverse_loewner_upper`, and
`chewi131_inverse_l2_opNorm_le_two_div_alpha_of_hessian_lower_half_and_inverse_loewner_upper`,
so the inverse-norm display now follows from the exact supplied inverse
Loewner upper gate `H^{-1} <= (2 / alpha) I`; positive-definiteness and
nonnegativity of the inverse are discharged from the half-radius Hessian lower
bound.  Search-first result: direct attempts using mathlib
`CStarAlgebra.inv_le_inv` and `CStarAlgebra.rpow_neg_one_le_rpow_neg_one`
timed out in `AppendixA.lean` even with a local 1M heartbeat budget.  The V58
layer adds `continuousLinearMap_opNorm_right_inverse_le_of_inner_lower`,
`chewi131_inverse_l2_opNorm_le_two_div_alpha_of_hessian_lower_half`, and
`chewi131_inverse_loewner_upper_of_hessian_lower_half`, discharging the
inverse-norm display and exact inverse Loewner upper gate from
`(alpha / 2) I <= H` by a direct vector-coercivity argument.  Search-first
reuse came from `ContinuousLinearMap.opNorm_le_bound`,
`abs_real_inner_le_norm`, `Matrix.mul_nonsing_inv`, `Matrix.toEuclideanLin`,
`Matrix.toLpLin_apply`, the local quadratic-form/Loewner bridge, and the V51
symmetric norm/order bridge.  Methodology note: when an elegant high-level API
route times out, test it in a minimal scratch file; if it still times out,
switch proof geometry instead of repeating the same route.  The V59 layer adds
the root-imported module `StatInference/Optimization/Theorem131.lean` with
`chewi131_local_quadratic_step_of_taylor_bound`,
`chewi131_local_quadratic_step_and_half_of_taylor_bound`, and
`chewi131_local_quadratic_recurrence_of_taylor_bound`, assembling the source
local quadratic recurrence and half-contraction from the Taylor/integral
Newton remainder estimate plus V56/V58.  Methodology note: keep source-main
theorem assembly in a small theorem module once Appendix A facts become
dependencies.  Next source-shaped work is to discharge the Taylor/integral
Newton remainder estimate with mathlib/local FTC and finite-dimensional
Hessian-gradient APIs.  The V60 layer adds
`chewi131_taylor_norm_bound_of_integral_remainder`,
`chewi131_local_quadratic_step_of_integral_remainder`, and
`chewi131_local_quadratic_recurrence_of_integral_remainder`, replacing the
supplied Taylor norm gate by the source-shaped assumptions
`x_{n+1} - x_star = H_n^{-1} ∫_0^1 r_n(t) dt` and
`||r_n(t)|| <= gamma (1 - t) ||x_n - x_star||^2`.  It reuses mathlib interval
integral norm bounds, public FTC, continuous interval integrability, and
matrix l2 operator-norm coercions.  Methodology note: when a plausible
mathlib shortcut is visible in source but unavailable as a public imported
declaration, record that immediately and use a public theorem route; here the
public FTC proof of `∫_0^1 (1 - t) dt = 1 / 2` avoided spending another
packet on `intervalIntegral.integral_id`.  The V61 layer adds the
root-imported module `StatInference/Optimization/Theorem131Taylor.lean` with
`chewi131_integral_remainder_identity_of_gradient_ftc`,
`chewi131_integral_remainder_pointwise_bound_of_hessian_lipschitz`,
`chewi131_taylor_norm_bound_of_gradient_ftc`,
`chewi131_local_quadratic_step_of_gradient_ftc`, and
`chewi131_local_quadratic_recurrence_of_gradient_ftc`, reusing
`InteriorPoint.lean`'s segment-gradient FTC theorem to produce the V60
integral-remainder representation and bound from gradient/Hessian data.  The
V62 layer adds `chewi131MatrixCLM`,
`chewi131_matrix_clm_sub_norm_eq`,
`chewi131_matrix_inverse_action_of_hessian_matrix`,
`chewi131_hessian_lipschitz_clm_of_matrix_lipschitz`,
`chewi131_taylor_norm_bound_of_matrix_gradient_ftc`,
`chewi131_local_quadratic_step_of_matrix_gradient_ftc`, and
`chewi131_local_quadratic_recurrence_of_matrix_gradient_ftc`, closing the
finite-dimensional matrix bridge from Hessian matrices to the continuous
linear map oracle consumed by V61.  Reuse came from `Matrix.l2_opNorm_def`,
`Matrix.nonsing_inv_mul`, `Matrix.toEuclideanLin`,
`Matrix.toLpLin_apply`, `Matrix.mulVec_mulVec`, and `LinearMap.map_sub`.
Methodology note: small local abbrevs for repeated mathlib coercions are an
efficiency tool, not cosmetic churn; they avoid parser/elaboration friction
and make later route reuse clearer.  The remaining Theorem 13.1 proof route is
now concrete function instantiation: identify `H_n` with the Hessian
matrix/oracle at `x_n`, package the segment Hessian matrices, prove the
segment differentiability/integrability hypotheses, and derive nonsingularity
from the half-radius Hessian lower bound when needed.  The V63 layer adds
`chewi131_hessian_det_isUnit_of_radius`,
`chewi131_local_quadratic_recurrence_of_conditional_taylor_bound`,
`chewi131_taylor_norm_bound_of_continuous_matrix_gradient_ftc`,
`chewi131_local_quadratic_step_of_matrix_gradient_ftc_of_radius`,
`chewi131_local_quadratic_step_of_continuous_matrix_gradient_ftc_of_radius`,
`chewi131_local_quadratic_recurrence_of_matrix_gradient_ftc_of_radius`, and
`chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_ftc_of_radius`.
It removes the global Hessian-invertibility premise by deriving determinant
invertibility from the local-radius Hessian lower bound inside the recurrence
induction, and it adds theorem-facing concrete matrix-Hessian wrappers with
`z ↦ chewi131MatrixCLM (Hfun z)` as the Hessian oracle.  Search-first result:
the pinned mathlib has no direct named Hessian-matrix wrapper, so the active
route should use explicit `HasFDerivAt grad (chewi131MatrixCLM (Hfun z)) z`
or `gradient`/`HasGradientAt` bridges plus CLM-valued continuity.  Next source
step: specialize these wrappers to `grad := gradient f` or a source-named
gradient oracle and package the clean differentiability hypothesis.
The V64 layer adds the root-imported module
`StatInference/Optimization/Theorem131Gradient.lean`, keeping
`Mathlib.Analysis.Calculus.Gradient.Basic` out of the hot Taylor bridge and
specializing the V63 continuous matrix-Hessian recurrence to mathlib
`gradient f`.  Compiled declarations are
`chewi131_taylor_norm_bound_of_continuous_matrix_gradient_fderiv`,
`chewi131_local_quadratic_step_of_continuous_matrix_gradient_fderiv_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_fderiv_of_radius`.
The new hypotheses are exactly the remaining source-instantiation surface:
`DifferentiableAt ℝ (gradient f) z` and
`fderiv ℝ (gradient f) z = chewi131MatrixCLM (Hfun z)` along the source
segments, plus CLM-valued Hessian continuity.  Methodology note: isolate
expensive imports in downstream wrapper modules; adding `Gradient.Basic`
directly to `Theorem131Taylor.lean` made the focused build take 222s, while
the split restored the Taylor build to about 40s and the gradient wrapper to
about 7s.  Next source step: derive the V64 differentiability/Frechet-
derivative hypotheses from a clean second-derivative interface, or derive
CLM-valued Hessian continuity from source matrix continuity.
Build-methodology note: root verification in a fresh temp worktree can be
blocked by disk even after the active Optimization modules compile.  In this
run, sharing another worktree's `.lake/packages` cache avoided package
rebuilds and verified the focused Theorem 13.1 modules, but
`lake build StatInference` filled the disk at `8435/8461` on unrelated
empirical-process modules.  Future broad verification should use a persistent
Chewi worktree with a warm local `.lake/build`, or clear enough disk before a
root build.
The V65 layer proves the matrix-to-CLM bridge is an isometry/continuous map
and adds source-facing matrix-continuity consumers:
`chewi131MatrixCLM_isometry`, `chewi131MatrixCLM_continuous`,
`chewi131MatrixCLM_continuousOn_comp`,
`chewi131_taylor_norm_bound_of_matrix_continuous_gradient_fderiv`,
`chewi131_local_quadratic_step_of_matrix_continuous_gradient_fderiv_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_fderiv_of_radius`.
The remaining Theorem 13.1 route no longer needs a hand-supplied
`ContinuousOn (fun z => chewi131MatrixCLM (Hfun z)) s`; it can use the
source-shaped `ContinuousOn Hfun s`.  Methodology note: when a local norm
transport identity is exact, use it to prove continuity/isometry directly
instead of searching broadly for a specialized matrix-to-operator continuity
API.
The V66 layer adds
`chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasFDeriv`,
`chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasFDeriv_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasFDeriv_of_radius`,
so the active Theorem 13.1 surface now consumes the Hessian matrix family
directly as `HasFDerivAt (gradient f) (chewi131MatrixCLM (Hfun z)) z` along
the source segments.  This removes the V64 split into `DifferentiableAt` plus
`fderiv` equality from the preferred route.  Methodology note: prefer the
direct lower-level consumer API when it is already compiled and source-shaped;
the next useful packet should derive this direct `HasFDerivAt` fact from
`HasStrictFDerivAt`, concrete Hessian derivative lemmas, or a clean
ContDiff/iteratedFDeriv interface.
The V67 layer adds
`chewi131_taylor_norm_bound_of_matrix_continuous_gradient_hasStrictFDeriv`,
`chewi131_local_quadratic_step_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_hasStrictFDeriv_of_radius`,
so the active Theorem 13.1 surface can consume the Hessian matrix family as
`HasStrictFDerivAt (gradient f) (chewi131MatrixCLM (Hfun z)) z` along source
segments.  Search-first reuse came from mathlib
`HasStrictFDerivAt.hasFDerivAt` and the existing V66 direct Frechet consumer.
Methodology note: exact mathlib strengthening/coercion APIs should be used to
avoid maintaining multiple awkward theorem surfaces; the next useful packet is
to derive the strict hypothesis from concrete Hessian derivative proofs or a
clean `ContDiff`/`iteratedFDeriv` source interface.
The V68 layer adds
`chewi131_gradient_hasStrictFDerivAt_of_eventually_hasFDerivAt_matrix`,
`chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_fderiv`,
`chewi131_taylor_norm_bound_of_continuous_matrix_gradient_eventually_hasFDeriv`,
`chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius`,
`chewi131_local_quadratic_step_of_continuous_matrix_gradient_eventually_hasFDeriv_of_radius`,
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_fderiv_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_continuous_matrix_gradient_eventually_hasFDeriv_of_radius`.
These two surfaces discharge the V67 strict derivative hypothesis from either
`ContDiffAt ℝ 1 (gradient f)` plus the Hessian matrix `fderiv` equality, or
an eventual Frechet-derivative model plus `Continuous Hfun`.  Search-first
reuse came from mathlib `ContDiffAt.hasStrictFDerivAt`,
`hasStrictFDerivAt_of_hasFDerivAt_of_continuousAt`,
`HasStrictFDerivAt.hasFDerivAt`, and local positive-orthant coordinate
derivative patterns.  Methodology note: the next useful packet should not add
another wrapper layer; it should prove the Hessian identification from
`ContDiffAt ℝ 2 f`/`iteratedFDeriv` or concrete barrier derivative data.
The V69 layer adds `chewi131_gradient_contDiffAt_one_of_contDiffAt_two`,
`chewi131_taylor_norm_bound_of_matrix_continuous_gradient_contDiffAt_two_fderiv`,
`chewi131_local_quadratic_step_of_matrix_continuous_gradient_contDiffAt_two_fderiv_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_fderiv_of_radius`.
It proves that pointwise `ContDiffAt ℝ 2 f` supplies the needed
`ContDiffAt ℝ 1 (gradient f)` by composing `fderiv ℝ f` with the Riesz
isometry `(InnerProductSpace.toDual ℝ _).symm`.  Search-first reuse came from
mathlib `ContDiffAt.fderiv_right_succ`, `LinearIsometryEquiv.contDiff`, and
the gradient definition as `(toDual ℝ _).symm (fderiv ℝ f x)`.  Methodology
note: stdin Lean probes are the right tool for semilinear/coercion questions;
the remaining proof work is the Hessian matrix equality, not gradient
regularity.
The V70 layer adds
`chewi131_gradient_hasFDerivAt_of_hasFDerivAt_fderiv_bilin`,
`chewi131_fderiv_gradient_eq_of_hasFDerivAt_fderiv_bilin`,
`chewi131_taylor_norm_bound_of_matrix_continuous_gradient_secondFDerivBilin`,
`chewi131_local_quadratic_step_of_matrix_continuous_gradient_secondFDerivBilin_of_radius`,
and
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_secondFDerivBilin_of_radius`.
It uses `InnerProductSpace.continuousLinearMapOfBilin` to Riesz-dualize a
source derivative of the dual-valued map `fderiv ℝ f`, proving the derivative
of `gradient f` in exactly the form consumed by the Theorem 13.1 Taylor,
one-step, and recurrence wrappers.  Methodology note: prefer this existing
Hilbert-space API over custom semilinear coercion lemmas; the next proof
packet should instantiate the bilinear Hessian from `iteratedFDeriv` or a
concrete barrier Hessian model.
The V71 layer adds `chewi131SecondFDerivBilin`,
`chewi131SecondFDerivBilin_toContinuousLinearMap_eq_fderiv_fderiv`,
`chewi131SecondFDerivBilin_hasFDerivAt_of_contDiffAt_two`,
`chewi131_local_quadratic_recurrence_of_matrix_continuous_gradient_contDiffAt_two_secondFDerivBilin_of_radius`,
`positiveOrthantNegLogBarrier_gradient_eq`,
`positiveOrthantNegLogBarrier_gradient_hasFDerivAt`,
`positiveOrthantNegLogBarrier_fderiv_gradient_eq`,
`positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt`, and
`positiveOrthantNegLogBarrier_fderiv_gradient_eventually_eq`.  It uses
mathlib `ContinuousMultilinearMap.curryLeft`,
`continuousMultilinearCurryFin1`, `iteratedFDeriv_two_apply`,
`ContDiffAt.fderiv_right_succ`, `ContDiffAt.differentiableAt_one`, and
`HasFDerivAt.congr_of_eventuallyEq`, plus local
`positiveOrthantNegLogBarrier_hasGradientAt` and
`positiveOrthantNegLogGrad_hasFDerivAt`.  The next source step is the
concrete Hessian matrix adapter from the positive-orthant diagonal Hessian or
from a source Hessian matrix family into `chewi131MatrixCLM`.
The V72 layer adds `positiveOrthantNegLogHessMatrix`,
`positiveOrthantNegLogHessMatrix_isHermitian`,
`positiveOrthantNegLogHessMatrix_clm_eq`,
`positiveOrthantNegLogHessCLM_continuousOn`,
`positiveOrthantNegLogHessMatrix_continuousOn`,
`positiveOrthantNegLogBarrier_gradient_hasFDerivAt_matrix`,
`positiveOrthantNegLogBarrier_fderiv_gradient_matrix_eq`,
`positiveOrthantNegLogBarrier_gradient_eventually_hasFDerivAt_matrix`, and
`chewi131_local_quadratic_recurrence_positiveOrthantNegLogBarrier_of_radius`.
It proves the positive-orthant diagonal Hessian matrix adapter and a
source-facing recurrence specialization that discharges derivative,
Hermitian, and continuity hypotheses.  The remaining source work is the
quantitative local Newton data for the actual constrained/affine objective:
stationarity, Newton update identity, Hessian closeness/Lipschitz bounds, and
the lower spectral bound.

Historical Chapter 13 route summary retained for dependencies: the concrete
standard preliminary stage now hands off to a concrete standard source
main-stage recursion through `Chewi1316StandardSourceMainStageObjectiveGapHandoff`
and the bounded/compact
`chewi1316_standardSourceMainStageObjectiveGapHandoff_*_standardPath`
endpoints.  The current V18 route closes concrete main-stage range membership
and decrement preservation via
`chewi1316_polytopeSlackNegLog_range_mainStage_step_mem_and_decrement_le_quarter`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_and_source_decrement_le_quarter`,
and
`chewi1316_polytopeSlackNegLog_exists_standardSourceMainStage_objective_gap_le_eps_imp_of_preliminaryInit`.
Next work should upgrade this automatic standard-main-stage wrapper into the
bounded/closed/compact standard-path endpoints by proving the terminal
centrality, barrier-step/lower-model, and large-parameter stopping certificates.
Do not redo preliminary initialization, source/range Newton transport, standard
recursions, or the V18 membership/decrement induction.
The V19 packaging layer adds
`Chewi1316StandardSourceMainStageObjectiveGapAutoHandoff` and its
bounded/closed/compact `*_standardPath` endpoints, so future work should go
straight to the terminal certificates consumed by that handoff.
The V20 terminal count packet adds
`chewi1316_large_parameter_condition_of_log_le`,
`chewi1316_exists_large_parameter_condition_of_one_lt`,
`chewi1316_exists_mainStageIndex_large_parameter_of_pos`, and
`chewi1316_exists_mainStageIndex_large_parameter`, so large-parameter
stopping/count is closed.  The V21 barrier-step packet adds
`chewi1316_polytopeSlackNegLog_range_barrier_step_le_of_mem` and
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStage_nextNewton_of_terminal_mem`,
so finite-row terminal barrier-step is closed from feasibility of `center` and
`optimum`.  The V22 lower-model bridge packet adds
`chewi1316_lowerModel_of_value_gap_and_firstOrder`,
`chewi1316_lowerModel_of_value_gap_and_firstOrderStrongConvexOn`, and
`chewi1316_centralPath_lowerModel_of_value_gap_and_firstOrderStrongConvexOn`,
so the Lemma 13.6 lower-model route now reuses the local first-order convex
model and leaves only the genuine self-concordant value-growth certificate.
The V23 consumer packet pushes this split through the fixed-parameter,
large-parameter, main-stage-parameter, and finite-row range endpoints via
`chewi1316_objective_gap_le_of_value_growth_and_firstOrderStrongConvexOn`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_value_growth_and_firstOrderStrongConvexOn`,
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_value_growth_and_firstOrderStrongConvexOn`,
and
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStage_nextNewton_of_terminal_mem_and_value_growth`.
The V24 segment-integral packet adds
`chewi1316_lowerModel_of_gradient_segment_quadratic_lower`,
`chewi1316_centralPath_lowerModel_of_gradient_segment_quadratic_lower`,
`chewi1316_objective_gap_le_of_gradient_segment_quadratic_lower`, and
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_gradient_segment_quadratic_lower`,
so the lower-model route can also be discharged from pointwise Hessian
quadratic lower control along the segment from the central-path point to the
terminal iterate.  It reuses local segment-gradient FTC lemmas plus mathlib
interval-integral monotonicity.  The remaining §13.16 terminal work is
central-path optimality at the selected parameter, self-concordant
value-growth for the V23 consumers, or segment Hessian quadratic lower control
for the V24 consumers.
The V25 packet adds the source-exact weighted Lemma 13.6 route:
`chewi1316_weightedKernel_intervalIntegrable`,
`chewi1316_weightedKernel_integral_eq_sq_div_one_add`,
`chewi1316_lowerModel_of_gradient_segment_weighted_quadratic_lower`,
`chewi1316_centralPath_lowerModel_of_gradient_segment_weighted_quadratic_lower`,
`chewi1316_objective_gap_le_of_gradient_segment_weighted_quadratic_lower`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_gradient_segment_weighted_quadratic_lower`,
and
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_gradient_segment_weighted_quadratic_lower`.
The V26 Riccati/Hessian packet discharges that source-exact weighted
`hquad_lower` gate from mixed-third self-concordance, adding
`scalar_riccati_lower_bound_on_unit_interval`,
`hessianSegmentLocalNorm_riccatiDerivLowerBound_of_mixedThirdSelfConcordantOn`,
`hessianSegmentLocalNorm_ge_of_riccati_lower_bound`,
`hessianSegment_quadratic_lower_weighted_of_mixedThirdSelfConcordantOn`,
`chewi1316_weighted_hessian_quadratic_lower_of_mixedThirdSelfConcordantOn`,
`chewi1316_lowerModel_of_mixedThirdSelfConcordantOn`, and
`chewi1316_centralPath_lowerModel_of_mixedThirdSelfConcordantOn`.  Search
first result: local code had one-minus upper Riccati/local-norm sandwich APIs,
but no one-plus lower primitive matching Chewi's `r^2/(1+r t)^2` kernel; the
new scalar inverse-monotonicity lemma is the reusable missing piece.  Next
terminal §13.16 work should feed the new central-path weighted lower-model
theorem into the existing objective-gap consumers by proving the remaining
centrality/selected-parameter hypotheses, not by redoing the weighted kernel
or Riccati lower layer.
The V27 consumer packet adds
`chewi1316_objective_gap_le_of_mixedThirdSelfConcordantOn`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t_of_mixedThirdSelfConcordantOn`,
and
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large_of_mixedThirdSelfConcordantOn`,
so the generic §13.16 objective-gap layer now consumes mixed-third
self-concordance directly rather than a supplied weighted `hquad_lower`
premise.  The V28 finite-row specialization adds
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStageParameter_large_of_terminal_mem_and_mixedThird`,
which instantiates the V27 endpoint for the slack range, discharges the
terminal barrier-step certificate from feasibility, and removes the supplied
`hlower` premise at a terminal range point.  The V29 packet adds the zero-safe
terminal endpoint
`chewi1316_polytopeSlackNegLog_range_objective_gap_le_eps_of_mainStageParameter_large_of_terminal_mem_and_mixedThird_zeroSafe`
and the standard-main-stage wrapper
`chewi1316_polytopeSlackNegLog_exists_standardSourceMainStage_objective_gap_le_eps_imp_of_preliminaryInit_and_terminal_mem_mixedThird`.
It reuses `chewi1316_central_objective_gap_le` for the `center = x` branch and
V18 standard-path terminal feasibility/decrement, so the concrete standard
preliminary-to-main route no longer needs supplied `hlower` or barrier-step
premises.  The V30 packet packages this route into
`Chewi1316StandardSourceMainStageObjectiveGapMixedThirdAutoHandoff` and its
bounded feasible-range, bounded source-polytope, bounded closed-polytope, and
compact closed-polytope standard-path constructors.  The V31 packet adds
`chewi1316_standardSourceMainStageObjectiveGapMixedThirdAutoHandoff_exists_mainStageIndex_objective_gap_le_eps`,
which reuses V20 `chewi1316_exists_mainStageIndex_large_parameter` to choose
the terminal `Nmain` automatically.  The V32 packet lifts this consumer through
the bounded feasible-range, bounded source-polytope, bounded closed-polytope,
and compact closed-polytope standard-path endpoints.  The V33 packet adds
`chewi1316_standardSourceMainStageTSeq_pos`,
`Chewi1316RangeCentralPathSelector`, a preliminary-initializer selector
consumer, and four bounded/closed/compact selector endpoints; a positive-parameter
selector now chooses the terminal center and discharges centrality in the final
objective-gap statement.  The V34 packet adds
`negLogBarrier_hasDerivAt_of_pos`,
`positiveOrthantNegLogBarrier_hasGradientAt`,
`Chewi1316RangeCentralPathMinimizerSelector`, and
`chewi1316_rangeCentralPathSelector_of_minimizerSelector`.  Search-first reuse:
the scalar/vector barrier gradient uses mathlib `Real.hasDerivAt_log`,
`HasDerivAt.comp_hasFDerivAt`, `PiLp.hasFDerivAt_apply`,
`HasFDerivAt.fun_sum`, and `hasGradientAt_iff_hasFDerivAt`; the selector
bridge reuses the local Fermat theorem
`gradient_eq_zero_of_isMinOn_univ_hasGradientAt`.  The V35 packet adds
`barrierAffineRangeValue`, `barrierAffineRangeValue_hasGradientAt`,
`barrierAffineRangeValue_positiveOrthantNegLogBarrier_hasGradientAt`,
`chewi1316RangeCentralPathValue`,
`chewi1316RangeCentralPathValue_hasGradientAt`,
`Chewi1316RangeCentralPathValueMinimizerSelector`, and the value-minimizer to
central-selector bridges.  Search-first reuse for V35: mathlib linear-map
derivatives, `HasFDerivAt.const_smul`/`add`/`comp`, `hasGradientAt_iff_hasFDerivAt`,
and `ContinuousLinearMap.adjoint_inner_left`, plus the V34 positive-orthant
barrier gradient.  The V36 packet adds the local Fermat bridge
`gradient_eq_zero_of_isLocalMin_hasGradientAt`, the interior constrained bridge
`gradient_eq_zero_of_isMinOn_hasGradientAt_of_mem_nhds`, local/domain
central-path value minimizer selectors, and direct bridges from those selectors
to `Chewi1316RangeCentralPathSelector`.  Search-first reuse for V36: mathlib
`IsMinOn.isLocalMin`, `IsLocalMinOn.isLocalMin`, and
`IsLocalMin.hasFDerivAt_eq_zero`.  The V37 packet adds
`isOpen_barrierAffineRangeSet`,
`isOpen_positiveOrthant`,
`isOpen_barrierAffineRangeSet_positiveOrthant`,
`barrierAffineRangeSet_positiveOrthant_mem_nhds`,
`Chewi1316RangeCentralPathValueFeasibleMinimizerSelector`,
`chewi1316_rangeCentralPathValueDomainMinimizerSelector_of_feasibleMinimizerSelector`,
and `chewi1316_rangeCentralPathSelector_of_valueFeasibleMinimizerSelector`.
Search-first reuse for V37: mathlib `IsOpen.preimage`,
`isOpen_iInter_of_finite`, `isOpen_lt`, `PiLp.continuous_apply`, and
`IsOpen.mem_nhds`, plus the local translated slack-coordinate continuity
pattern.  The V38 packet adds
`chewi1316RangeCentralPathValue_continuousOn`,
`chewi1316_rangeCentralPathValueFeasibleMinimizerSelector_of_isCompact`, and
`chewi1316_rangeCentralPathSelector_of_isCompact_feasibleRange`.  Search-first
reuse for V38: mathlib `HasGradientAt.continuousOn` and
`IsCompact.exists_isMinOn`.  Next finite-row work should discharge the compact
and nonempty feasible-range hypotheses in source-facing forms, then formalize
the compact sublevel/envelope barrier-blowup proof for the open positive range.
The V39 packet adds the strict-feasible-source nonempty selector bridge,
`Chewi1316StandardSourceMainStageExistsCenterObjectiveGapConclusion`, the
generic preliminary-initializer compact-feasible-range endpoint, and four
bounded/closed/compact standard-path compact-feasible-range endpoint wrappers.
Search-first reuse for V39: local `rangeRestrict_mem_of_polytopeSlackSet` and
mathlib `IsCompact.isBounded`.
The V40 packet adds the compact sublevel-envelope selector interface
`Chewi1316RangeCentralPathValueCompactSublevelEnvelopeSelector`, proves
`chewi1316_rangeCentralPathValueFeasibleMinimizerSelector_of_compactSublevelEnvelopeSelector`
by minimizing on a compact envelope and using sublevel containment, then feeds
it through
`chewi1316_rangeCentralPathSelector_of_compactSublevelEnvelopeSelector`,
`chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_compactSublevelEnvelopeSelector`,
and the bounded/closed/compact
`*_exists_center_mainStageIndex_objective_gap_le_eps_of_compactSublevelEnvelopeSelector`
endpoints.  Search-first reuse for V40: mathlib `IsCompact.exists_isMinOn` and
`isMinOn_iff`, plus local `chewi1316RangeCentralPathValue_continuousOn` and
the V39 endpoint family.  Next finite-row work should prove the actual compact
sublevel-envelope selector from logarithmic-barrier blow-up at the boundary:
derive a positive slack floor on bounded closed feasible sublevels, build the
compact envelope, and plug that selector into the V40 endpoints.
The V41 packet adds `chewi1316RangeCentralPathClosedFeasibleRange`,
`Chewi1316RangeCentralPathValueSublevelSlackFloorSelector`, and
`chewi1316_rangeCentralPathValueCompactSublevelEnvelopeSelector_of_closedFeasibleRangeCompact_and_sublevelSlackFloorSelector`.
It uses mathlib compact-intersection and closed finite-coordinate halfspace
APIs to prove that a compact closed feasible range plus a verified sublevel
slack-floor certificate already gives the V40 compact-envelope selector.  The
remaining finite-row central-path existence work is now the analytic
barrier-blowup proof of that slack-floor selector: lower-bound the linear
objective on the compact closed feasible range and use `-log` blow-up at zero
to force every sublevel coordinate to stay uniformly positive.
The V42 packet proves the finite-product algebra for that blow-up step:
`negLogBarrier_exp_neg_le_of_le`,
`positiveOrthantNegLogBarrier_coordinate_le_barrier_add_card_log_of_coord_le`,
`Chewi1316RangeCentralPathValueSublevelNegLogUpperSelector`,
`Chewi1316RangeCentralPathValueSublevelLinearLowerSlackUpperSelector`, and the
bridges from a linear lower bound plus a uniform slack upper bound to the V41
slack-floor selector.  The next route is no longer raw log blow-up; it is the
compact-bounds discharge of
`Chewi1316RangeCentralPathValueSublevelLinearLowerSlackUpperSelector`, reusing
compact minimization for the linear term and the existing finite-coordinate
boundedness APIs for translated slacks.
The V43 packet completes that compact-bounds route and composes it through the
§13.16 endpoint:
`chewi1316_rangeCentralPathValueSublevelLinearLowerSlackUpperSelector_of_closedFeasibleRangeCompact`,
`chewi1316_rangeCentralPathValueSublevelSlackFloorSelector_of_closedFeasibleRangeCompact`,
`chewi1316_rangeCentralPathValueCompactSublevelEnvelopeSelector_of_closedFeasibleRangeCompact`,
`chewi1316_rangeCentralPathSelector_of_closedFeasibleRangeCompact`,
`chewi1316_rangeCentralPathSelector_of_closedFeasibleRangeCompact_of_polytopeSlackSet_mem`,
and
`chewi1316_standardSourceMainStage_exists_center_mainStageIndex_objective_gap_le_eps_of_preliminaryInit_and_closedFeasibleRangeCompact`.
Search-first reuse: mathlib `IsCompact.exists_bound_of_continuousOn`, standard
continuity combinators for linear scalars and translated slack vectors,
`PiLp.norm_apply_le`, `Real.norm_eq_abs`, `neg_abs_le`, local
`rangeRestrict_mem_of_polytopeSlackSet`, and the V40/V41/V42 selector bridges.
The next source-facing route is to push this through the named standard-path
wrappers and prove closed-feasible-range compactness from the existing
closed/compact source hypotheses, rather than reintroducing supplied minimizer
or slack-floor assumptions.
The V44 packet completes that source-facing route:
`chewi1316RangeCentralPathClosedFeasibleRange_eq_rangeRestrict_image_closedPolytopeSlackSet`,
`chewi1316RangeCentralPathClosedFeasibleRange_isCompact_of_closedPolytope_isCompact`,
the bounded-feasible/source/closed-source
`*_exists_center_mainStageIndex_objective_gap_le_eps_of_closedFeasibleRangeCompact`
wrappers, and
`chewi1316_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_closedPolytopeCompact`.
It reuses local closed-polytope membership bridges and mathlib compact image
transport, so future Chapter 13 work should route through this compact
closed-polytope endpoint instead of exposing selector or slack-floor premises.
The V45 packet further promotes this route from compact closed polytope to
bounded closed polytope under `[ProperSpace F]`:
`chewi1316RangeCentralPathClosedFeasibleRange_isCompact_of_closedPolytope_isBounded`
and
`chewi1316_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps_of_closedPolytopeBounded`.
It reuses the existing proper-space Heine-Borel bridge
`chewi1316_polytopeSlackNegLog_closedPolytope_isCompact_of_isBounded`; this is
the internal boundedness-to-compactness step for bounded closed polytopes.
The V46 packet then hides those internal premise-suffix endpoints behind the
no-extra-suffix source-facing declarations
`chewi1316_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`
and
`chewi1316_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`.
Use these V46 names as the preferred §13.16 report/source surface, adding only
a thin source-numbered alias if the report crosswalk needs one.
The V47 packet adds exactly that report-facing alias layer:
`chewi1316_lemma_standardSourceMainStage_compactClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`
and
`chewi1316_lemma_standardSourceMainStage_boundedClosedPolytope_exists_center_mainStageIndex_objective_gap_le_eps`.
The source-report path is now blocked only on report artifacts, not Lean proof
debt: Lemma 13.16 is anchored at markdown lines 4860-4888, but the current
local environment lacks `pandoc`, `pdftoppm`, and `pdfinfo`, so the screenshot
and `scripts/compile_report_pdf.sh` gates must be satisfied before creating
`Reports/Optimization_13_16_.../`.

Cached predecessor route: the finite-row slack-range §13.16 handoff also
compiles through source-pullback preliminary decrement transport and the
point-dependent range sqrt-coordinate one-step wrapper.  Reusable declarations
include `chewi1314_polytopeSlackNegLog_range_selfConcordantBarrierOn`,
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
The source one-step API now also adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants_of_sourceDecrement`.
The source canonical-lambda packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_canonicalLambda`, so a direct source-coordinate `1/4 -> 1/8`
decrement proof can feed either the general `c0`/`tailBound` handoff or the
standard handoff without separate range recurrence or range pre-decrement
assumptions.  The source `tsum` budget packet adds
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_prefix_le_half_of_tsum`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_canonicalLambda`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants_of_sourceDecrement`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementTsumBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
The prefix budget can now be proved from a summable majorant with total
`tsum <= 1 / 2`, with nonnegativity derived from the pre-decrement inequality.
The geometric budget bridge adds
`chewi1316_stepBudget_tsum_le_half_of_geometric_majorant` and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_tsum_le_half_of_geometric_majorant`,
so the common estimate `2 * stepBudget n <= C * q^n`, `0 <= q < 1`,
`C * (1 - q)⁻¹ <= 1 / 2` is now enough to feed those handoffs.  The geometric
handoff packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_canonicalLambda`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants_of_sourceDecrement`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementGeometricBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`,
so source §13.16 handoffs can consume the geometric majorant directly.
The contracting-budget packet adds
`chewi1316_stepBudget_geometric_majorant_of_doubled_recurrence`,
`chewi1316_stepBudget_tsum_le_half_of_doubled_recurrence`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_tsum_le_half_of_doubled_recurrence`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_geometricBudget_of_rangePreDecrementNext`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNext_contractingBudget_of_rangePreDecrementNext`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_canonicalLambda`.
The standard-consumer packet adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants_of_sourceDecrement` and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementContractingBudget_noFactor_standardConstants_of_rangeSqrtCoordModel`.
Thus the next preliminary-path decay proof can feed the canonical source
handoff, the standard source-decrement handoff, or the standard range-sqrt
handoff directly from `2 * stepBudget (n+1) <= q * (2 * stepBudget n)`,
`0 <= q < 1`, and `(2 * stepBudget 0) * (1 - q)⁻¹ <= 1 / 2`, without
reproving scalar recurrence, geometric-majorant, or `tsum` algebra.
The range sqrt-coordinate gate is now closed by
`continuousLinearMap_exists_adjointSqrt_of_isPositive_finiteDim` and
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`.  The active
theorem-sized target is to prove the source next pre-decrement decay /
total-mass bound feeding either the source
`preDecrementContractingBudget` handoff or the source
`preDecrementGeometricBudget` handoffs.
The actual-budget base estimate now compiles as
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_zero_le_standard`:
under the standard preliminary update with `t_0 = 1`, the actual source
next-pre-decrement budget at index `0` is bounded by `1 / 200` using the
finite-row barrier gradient bound and local-norm homogeneity.  The next
source-facing theorem-sized target is therefore only the actual successor
doubled contraction.  The scalar `q = 1 / 2` wrapper is now compiled through
`chewi1316_initialTotal_half_le_of_stepBudget_zero_le_standard`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_initialTotal_half_le_standard`, and the preferred source endpoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_noFactor_standardConstants`.
The actual selected-tail bridge now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
It combines the actual-budget half contraction with the existential
selected-tail handoff, deriving the prefix budget internally from the compiled
`tsum` machinery.  Downstream Chapter 13 work should focus on the actual
contraction proof and the moving-center/bounded-polytope selected range-tail
bound rather than redoing prefix-budget summability.
The thresholded actual selected-tail bridge now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`;
its generic pre-decrement-budget sibling is
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_thresholdedEventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
These wrappers let the selected range-tail invariant start after a burn-in
threshold `Nmin`, matching the expected moving-center/bounded-polytope proof
shape.
The post-threshold range-tail wrappers now compile as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdRangeTailBound_succ_noFactor_standardConstants`.
These are the cleanest consumers for the next geometric packet: prove a plain
range-tail bound for every output index after `Nmin`, independent of the
selected logarithmic count parameters.
The scaled-to-unscaled tail bridge now compiles as
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_barrier_dualLaws`,
`dualLocalNorm_le_div_of_abs_mul_dualLocalNorm_le_of_abs_lower`,
`sourceGrad_dualLocalNorm_le_of_preliminaryPath_sequence_barrier_dualLaws_abs_t_lower`,
`chewi1316_polytopeSlackNegLog_rangeTailBound_of_sourcePreliminaryPath_abs_t_lower`, and
`chewi1316_polytopeSlackNegLog_postThresholdRangeTailBound_of_sourcePreliminaryPath_abs_t_lower`.
It converts the reusable reverse preliminary-path bound into the exact
post-threshold range-tail predicate via a valid lower bound on `|t_N|`,
`lambda_N` control, and the existing source/range dual-local norm transport.
This is useful for finite-window or moving-denominator certificates, but it
must not be used as a global fixed-source scaled-tail shortcut for the
decreasing-`t` path.
The composed post-threshold consumers now compile as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
They are the direct caller-facing route when a future finite-window or
moving-center proof supplies `0 < tau_N <= |t_N|`, lambda control, and the
resulting tail budget.
The source-decrement variants now compile as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_postThresholdAbsTLowerTail_succ_noFactor_standardConstants`.
These instantiate the canonical preliminary lambda schedule internally from
the source one-step decrement estimate, so the next proof layer can focus on
the lower-denominator/window certificate.
The selected-window lower-denominator variants now compile as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_sourceDecrement_selectedAbsTLowerTail_succ_noFactor_standardConstants`.
They are the source-facing finite-window alternative to the post-threshold
lower-`|t|` route, requiring the denominator and tail-budget certificate only
at the selected successor index.
The selected range source-radius packet now compiles as
`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourceRadiusHalf`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeSourceRadiusHalf_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_selectedRangeSourceRadiusHalf_succ_noFactor_standardConstants`.
This packages the finite-window bounded-polytope tail route: selected
range source-radius-half gives the selected slack-range tail bound, and the
actual-budget endpoint additionally consumes the real half-contraction budget.
The internal selected-tail packet now compiles as
`chewi1316_polytopeSlackNegLog_selectedRangeTailBound_of_sourcePreliminaryNextNewtonSteps_preDecrementBudget`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalSelectedRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalSelectedRangeTailBound_succ_noFactor_standardConstants`.
It derives successor range membership, selected source-radius-half, and the
selected tail bound from the source preliminary recurrence plus prefix budget,
or from the actual half-contraction after the existing budget machinery.
The existential compact packet now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalEventualSelectedRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalEventualSelectedRangeTailBound_succ_noFactor_standardConstants`.
It also chooses the logarithmic/count indices, so explicit selected `M,N`
plumbing is closed for this conditional route.
This endpoint should be treated as conditional infrastructure.  Earlier
verified positive-orthant obstruction packets show that the bare actual
decreasing-`t` preliminary recurrence is not expected to satisfy the old
fixed-source global radius/summability route at textbook scale.  The preferred
route is therefore still the moving-center / bounded-polytope range-tail
estimate, with the half-contraction endpoint used only if a separate valid
invariant supplies that contraction.
The newest measured-tail wrapper,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_noFactor`,
uses the actual measured slack-range tail norm at the selected preliminary
index and the log/count hypotheses to initialize the positive main stage.  This
is the source-shaped bridge to use while developing the stronger
moving-center/bounded-polytope tail invariant.
The successor selected-index wrappers
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_succ_noFactor_canonicalLambda`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredRangeTailLogBound_succ_noFactor_standardConstants`
remove the auxiliary lambda-sequence and standard-constant bookkeeping from
this measured-tail route.
The source-facing measured-tail wrappers now add
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_measuredRangeTailLogBound_succ_noFactor_standardConstants`.
These wrappers derive successor feasibility and the preliminary one-step
decrement invariant from source/range Newton data plus a prefix pre-decrement
budget before invoking the measured-tail consumer.  They should be used as
conditional infrastructure; the preferred full §13.16 proof still needs the
moving-center / bounded-polytope measured range-tail logarithmic estimate
without reviving the archived fixed-source global-radius route.
The selected-tail-bound packet adds `chewi1316_measuredTailLog_le_of_tailBound`
and the three selected-bound handoffs ending in
`...rangePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`,
`...sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants_of_rangeSqrtCoordModel`, and
`...sourcePreliminaryNextNewtonSteps_preDecrementBudget_selectedRangeTailBound_succ_noFactor_standardConstants`.
This makes the next geometric target source-shaped: prove a selected successor
dual-norm bound by moving-center/bounded-polytope reasoning, then discharge
only the scalar log/count side before applying the compiled handoff.
The existential selected-tail-bound endpoint
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventualSelectedRangeTailBound_succ_noFactor_standardConstants`
now chooses `M` and the successor count index internally.  The remaining
source-shaped geometry obligation is an eventual selected successor bound
under that count inequality.
The filter-eventual adapter layer now adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallyRangeTailBound_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These reuse Mathlib `Filter.eventually_atTop` to turn a `∀ᶠ N in atTop`
range-tail estimate into the existing post-threshold §13.16 handoff, matching
the natural output shape of later moving-center/bounded-polytope asymptotic
arguments.
The latest source-shaped geometry bridge further reduces the remaining input
to an eventual translated-slack coordinate ratio bound.  Reuse
`chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_positiveOrthant_sourceGrad`,
`chewi1314_polytopeSlackNegLog_range_sourceGrad_dualLocalNorm_le_sqrt_mul_of_slackRatio_le`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallySlackRatioBound_succ_noFactor_standardConstants`.
The proof relies on local positive-orthant source-gradient norm evaluation,
finite Euclidean coordinate-envelope bounds, and the existing range
inverse-Hessian/Cauchy stack; there is no direct Mathlib range-restriction
lemma to import.  The next exact target should therefore prove the eventual
slack-ratio envelope from bounded-polytope or moving-center invariants.
The finite-row Slater closure packet now adds
`polytopeSlackSet_segment_source_mem_of_closed_mem_of_mem`,
`closedPolytopeSlackSet_subset_closure_polytopeSlackSet_of_mem`, and
`closure_polytopeSlackSet_eq_closedPolytopeSlackSet_of_mem`.
It proves that one strict feasible source point makes the strict logarithmic
barrier domain dense in the textbook closed polytope, reusing Mathlib
`mem_closure_iff_seq_limit`, `tendsto_one_div_add_atTop_nhds_zero_nat`,
`closure_minimal`, and real inner-product linearity.  Future compact-closure
or bounded-closed-polytope arguments should reuse this identity instead of
reproving open-segment approximations; the next live proof target remains the
actual moving-center/measured range-tail estimate, not the invalid bare
half-contraction route.
The no-prefix counterpart now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySlackRatioBound_succ_noFactor_standardConstants`.
Use it when the moving-center proof supplies all-iterate range feasibility
directly; it avoids routing coordinate-ratio estimates through the archived
global prefix-budget gate.
The actual-path bounded-polytope wrapper now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_globalSlackRatioBound_succ_noFactor_standardConstants`.
It discharges all-iterate range feasibility internally from the actual
preliminary Newton path and reduces the remaining geometry obligation to a
global source-relative slack-ratio bound over feasible range points.  This is
the preferred long-window entrypoint when boundedness of the feasible range
polytope is available.
The bounded feasible-range budget layer now also compiles the reusable
intermediate facts
`chewi1316_polytopeSlackNegLog_exists_globalSlackRatioBound_of_boundedFeasibleRange`,
`chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_boundedFeasibleRange`,
`chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_boundedPolytope`,
`chewi1316_polytopeSlackNegLog_exists_uniformRangeTailBound_of_closedPolytope_isBounded`, and
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedFeasibleRange`.
These use Mathlib `Bornology.IsBounded.subset_closedBall` plus the local
source slack floor to choose `rho`, `B`, and `tailBound` automatically, and
then reuse the compiled slack-ratio-to-dual-local-norm bridge.  Future
bounded-polytope range-tail work should consume these declarations directly
instead of rebuilding the scalar budget inside final theorem wrappers.
The clean boundedness-to-§13.16 layer then adds
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedPolytope`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_closedPolytope_isBounded`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
These are the preferred caller-facing boundedness endpoints because they hide
the internal floor/radius witnesses while still reusing the no-prefix
`rangeMem_eventuallyRangeTailBound` initializer and actual-path feasibility
transport.
The source-start layer adds `rangeRestrict_mem_of_polytopeSlackSet` and the
source-feasible-start variants
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedFeasibleRange_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_boundedPolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_closedPolytope_isBounded_sourceMem`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
They should be preferred when matching textbook assumptions, since the
starting-point hypothesis is the source-domain statement
`xbar0 ∈ polytopeSlackSet aRow bSlack`.
The compact source-start layer adds the compact/envelope variants
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourceSupersetPolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourcePolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactSourceClosurePolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_actualPreDecrementBudget_eventuallyRangeTailBound_of_compactClosedPolytope_sourceMem`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceSupersetPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourcePolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_sourceMem_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
Use these when the textbook route supplies compactness of a source envelope,
the strict source polytope, the source closure, or the closed feasible
polytope; they reuse existing compact-to-bounded lemmas before calling the
source-start boundedness endpoints.
The source-path packaging layer adds
`Chewi1316StandardSourcePreliminaryPath`,
`Chewi1316StandardSourcePreliminaryPath.rangeRestrict_mem_of_sourceMem`, and
source-path packaged bounded/compact §13.16 endpoints:
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSourceClosurePolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_sourcePath_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
Use this layer for final source-shaped textbook wrappers instead of exposing
the four raw path hypotheses.
The standard recursive-path layer adds
`chewi1316_standardPreliminaryTSeq`,
`chewi1316_standardSourcePreliminaryXSeq`,
`chewi1316_standardSourcePreliminaryPath`, and concrete standard-path
bounded/compact §13.16 endpoints:
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedFeasibleRange_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_boundedClosedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactClosedPolytope_standardPath_eventuallyRangeTailBound_succ_noFactor_standardConstants`.
Use this concrete layer when formalizing the omitted preliminary-stage
algorithm itself; it fixes Chewi's decreasing preliminary schedule and Newton
recursion internally.
The preliminary/main-stage handoff layer now compiles as
`Chewi1316SourceMainStageObjectiveGapHandoff`,
`chewi1316_sourceMainStageObjectiveGapHandoff_of_preliminaryInit`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
`chewi1316_sourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
and
`chewi1316_sourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`.
This is the preferred final-accuracy target for §13.16: it composes the
standard preliminary recursion with the source-coordinate main-stage
objective-gap theorem by using the adjoint pullback of the range objective, so
future work should focus on packaging/discharging the remaining main-stage
centrality, barrier-step, lower-model, membership, and stopping-condition
assumptions.
The concrete standard-main-stage packet now compiles as
`chewi1316_standardSourceMainStageTSeq`,
`chewi1316_standardSourceMainStageXSeq`,
`Chewi1316StandardSourceMainStageObjectiveGapHandoff`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_of_sourceMainStageObjectiveGapHandoff`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedFeasibleRange_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedPolytope_standardPath`,
`chewi1316_standardSourceMainStageObjectiveGapHandoff_boundedClosedPolytope_standardPath`,
and
`chewi1316_standardSourceMainStageObjectiveGapHandoff_compactClosedPolytope_standardPath`.
Use this as the current §13.16 final-accuracy interface: the preliminary
selection and standard increasing main-stage Newton recursion are fixed
internally, leaving range membership and terminal analytic certificates as the
remaining proof work.
The main-stage membership reduction packet now compiles
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_range_decrement_lt_one`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_source_decrement_lt_one`,
`chewi1316_standardSourceMainStage_objective_gap_le_eps_of_source_decrement_lt_one`,
and
`chewi1316_standardSourcePreliminaryXSeq_rangeRestrict_mem_of_sourceMem`.
Use this layer to replace all-iterate membership hypotheses by a per-step
source decrement `< 1` proof for the concrete standard main-stage sequence.
The `lambda <= 1/4` packaging layer now compiles
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_range_decrement_le_quarter`,
`chewi1316_standardSourceMainStage_rangeRestrict_mem_of_source_decrement_le_quarter`,
and
`chewi1316_standardSourceMainStage_objective_gap_le_eps_of_source_decrement_le_quarter`.
Use this layer as the active §13.16 final-handoff interface while proving the
paired membership/decrement induction for the concrete standard main-stage
sequence.
The coordinate-upper-bound specialization now compiles as
`chewi1316_polytopeSlackNegLog_globalSlackRatioBound_of_slackCoordinateUpperBound`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackCoordinateUpperBound_succ_noFactor_standardConstants`.
Use this when the bounded-polytope proof naturally gives finite coordinate
upper bounds for feasible translated slacks; only the coordinate comparison to
the source slacks remains.
The least-upper-bound version now compiles as
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
with compact feasible-range specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSlackCoordinateSup_succ_noFactor_standardConstants`
and compact-superset specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetSlackCoordinateSup_succ_noFactor_standardConstants`,
plus compact envelope-sup specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetEnvelopeSlackCoordinateSup_succ_noFactor_standardConstants`
and pointwise compact-envelope upper-bound specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_compactSupersetSlackCoordinateUpperBound_succ_noFactor_standardConstants`,
with closed-ball envelope specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_closedBallSlackCoordinateUpperBound_succ_noFactor_standardConstants`
and source-centered radius specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceCenteredRadiusBound_succ_noFactor_standardConstants`,
plus source-local-norm specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceLocalNormBound_succ_noFactor_standardConstants`
and exact-budget source-local-norm specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_sourceLocalNormBound_exactBudget_succ_noFactor_standardConstants`.
The coordinate-relative source-local-norm handoff now adds
`chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_coord_abs_le`,
`chewi1314_polytopeSlackNegLog_range_sourceLocalNorm_le_sqrt_fin_mul_of_relative_abs_sub_le`,
`chewi1316_polytopeSlackNegLog_sourceLocalNormBound_of_slackCoordAbsBound`,
`chewi1316_polytopeSlackNegLog_sourceLocalNormBound_of_slackRelativeAbsSubBound`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementBudget_slackRelativeAbsSubBound_exactBudget_succ_noFactor_standardConstants`.
The moving-center relative-slack tail handoff now adds
`positiveOrthant_ratio_abs_le_one_add_of_relative_abs_sub_le`,
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_relative_abs_sub_le`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSlackRelativeAbsSubBound_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySlackRelativeAbsSubBound_succ_noFactor_standardConstants`.
Use it when the bounded-polytope or moving-center proof supplies only
eventual/pathwise relative slack displacement along the preliminary iterates;
the required scalar tail budget is directly
`sqrt(m) * (1 + rho) <= tailBound`.
The actual half-contracting source-radius handoff now adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceRadiusBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceRadiusBound_succ_noFactor_standardConstants`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceRadiusHalf_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceRadiusHalf_succ_noFactor_standardConstants`.
Use these when the moving-center proof gives an eventual/pathwise Dikin
source-local-norm bound along the actual preliminary iterates; the scalar
budget is `sqrt(m) * (1 + r) <= tailBound`, with half-ball specialization
`sqrt(m) * (3 / 2) <= tailBound`.
The pathwise coordinate-displacement handoff now adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSlackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySlackCoordAbsBound_exactBudget_succ_noFactor_standardConstants`.
Use these when geometry naturally gives source-slack coordinate displacement
along the preliminary iterates; they reuse the coordinate-to-Dikin bridge and
require the exact budget `sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.
The pathwise source-centered radius handoff now adds
`chewi1316_polytopeSlackNegLog_slackCoordAbsSub_le_of_dist_le`,
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceCenteredRadiusBound_exactBudget_succ_noFactor_standardConstants`,
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceCenteredRadiusBound_exactBudget_succ_noFactor_standardConstants`.
Use these when geometry naturally gives a range-subtype moving-center distance
bound `dist x_N xbar0 <= R`; the remaining coordinate comparison is
`R <= rho * slack_i(xbar0)`.
The source-slack floor specialization now adds
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_postThresholdSourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_eventuallySourceCenteredRadiusFloorBound_exactBudget_succ_noFactor_standardConstants`.
Use these when the geometry produces a single source slack lower bound
`sFloor <= slack_i(xbar0)` and `R <= rho * sFloor`.
Use this when the bounded-polytope proof supplies `BddAbove` coordinate images
or compactness facts.  Prefer the compact-superset form when the strict
positive-orthant feasible set is open but contained in a compact
closure/envelope; prefer the envelope-sup specialization when the natural
geometry bounds the compact envelope coordinate suprema rather than the
feasible coordinate suprema, and prefer the pointwise envelope-upper-bound
specialization when the geometry gives explicit coordinate bounds on the
compact envelope.  Prefer the closed-ball specialization when the natural
boundedness certificate is `feasible <= closedBall center R`; it derives
coordinate upper bounds `slack_i(center) + R` by `PiLp.norm_apply_le`.  Prefer
the source-centered radius specialization when the radius center is exactly
`(polytopeSlackCLM aRow).rangeRestrict xbar0`; it feeds the closed-ball bridge
via `Metric.mem_closedBall` and leaves only the scalar comparison
`R <= (B - 1) * slack_i(xbar0)`.  Prefer the source-local-norm specialization
when the boundedness certificate is a uniform Dikin radius around the source
range point; it reuses
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`
and the exact-budget specialization leaves only
`sqrt(m) * (1 + r) <= tailBound`, deriving nonnegativity from
`localNorm_zero` at the source.  The compact bridge reuses Mathlib
`IsCompact.bddAbove_image`, `BddAbove.mono`, `Set.image_mono`,
`csSup_le_csSup`, `csSup_le`, `isCompact_closedBall`, `PiLp.norm_apply_le`,
`Metric.mem_closedBall`, and coordinate continuity from `PiLp.continuous_apply`.
When geometry gives coordinate-relative bounds instead of an abstract Dikin
radius, use the new coordinate wrappers: prove either
`||slack_i(y) - slack_i(xbar0)|| <= rho * slack_i(xbar0)` or
`||slack_i(y) / slack_i(xbar0) - 1|| <= rho`; the verified bridge reuses
`positiveOrthantNegLog_localNorm_le_sqrt_fin_mul_of_coord_abs_le`,
`positiveOrthant_coord_abs_sub_le_mul_of_relative_abs_sub_le`,
`barrierAffineRange_localNorm_eq_ambient`, and `Real.norm_eq_abs`, and leaves
only `sqrt(m) * (1 + sqrt(m) * rho) <= tailBound`.  The remaining scalar
comparison is against the compact envelope coordinate `sSup`, the explicit
envelope coordinate upper bounds, or this coordinate-relative `rho` budget.
The no-prefix source-radius counterpart now compiles as
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySourceRadiusBound_succ_noFactor_standardConstants`
and the half-radius specialization
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_rangeMem_eventuallySourceRadiusHalf_succ_noFactor_standardConstants`.
Use these when the moving-center proof naturally outputs an eventual local
source-radius certificate around `rangeRestrict xbar0`; they reuse the local
slack-ratio bridge and should be preferred over rebuilding coordinate-ratio
plumbing.
The prefix-budget route now supplies that envelope with constant `3/2`:
`positiveOrthant_ratio_abs_le_one_add_of_localNorm_sub_le`,
`chewi1314_polytopeSlackNegLog_range_slackRatio_le_one_add_of_sourceLocalNorm_le`,
`chewi1316_polytopeSlackNegLog_sourcePreliminaryNextNewtonSteps_preDecrementBudget_eventuallySlackRatioBound_three_halves_succ_noFactor`, and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_preDecrementBudget_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
This reuses the compiled range source-radius-half theorem and Mathlib
`eventually_ge_atTop`, so downstream work should attack the actual
pre-decrement budget/decay proof rather than reopening the slack-ratio bridge.
The actual-budget consumer now has the same sharp route:
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_half_contraction_standard`
and
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementHalfContractingBudget_internalSlackRatioBound_three_halves_succ_noFactor_standardConstants`.
This reduces the actual preliminary endpoint to the doubled half-contraction
of `chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget` plus the
scalar tail budget `sqrt(m) * 3/2 <= tailBound`.  Search-first contraction
result: Mathlib does not provide the needed optimizer-decrement theorem; use
the local `chewi138_*newtonDecrement_step*` and preliminary-stage decrement
wrappers as the next proof ingredients.
The parameter-shift budget layer now records the correct next-pre-decrement
shape: `polytopeSlackSet_of_rangeRestrict_mem`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_postDecrement_add_delta_sqrt`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_eighth_add_standard_of_postDecrement_le_eighth`.
The actual next-pre-decrement budget at `t_{n+2}` is controlled by the
post-step decrement at `t_{n+1}` plus the parameter-shift cost
`delta * sqrt(m)`, giving `1/8 + 1/200` under standard constants.
The actual-budget recurrence is now source-verified through
`chewi1316_polytopeSlackNegLog_range_postDecrement_le_quadratic_of_nextNewton_sqrtCoordModel`,
`chewi1316_polytopeSlackNegLog_sourcePostDecrement_le_quadratic_of_nextNewton`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_delta_sqrt`, and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard`.
Thus the correct scalar shape is
`B_{n+1} <= B_n^2 / (1 - B_n)^2 + 1 / 200` for the standard preliminary
schedule, not a raw half-contraction.  Downstream §13.16 work should now use
this verified additive recurrence to derive a finite-window/selected-index
certificate, or route through the moving-center measured-tail wrappers; do not
feed the conditional half-contraction consumers unless a separate theorem
really proves that stronger assumption.
The scalar closure layer now adds `real_quadratic_add_standard_le_one_hundredth`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_hundredth_of_quadratic_add_standard`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_lt_one_of_quadratic_add_standard`.
So the actual budget recurrence is self-iterable and keeps every `B_n` below
`1 / 100`; this closes the recurring `< 1` side condition for future finite
window arguments, but it deliberately does not claim the nonexistent
summable/half-contraction budget.
The finite-window packaging layer now adds
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_succ_le_quadratic_add_standard_of_nextNewton`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_fifty_of_quadratic_add_standard`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_twenty_five`.
The newest scalar sharpening adds
`real_quadratic_add_standard_le_one_one_hundred_ninety_eight`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_le_one_one_hundred_ninety_eight_of_quadratic_add_standard`,
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_length_div_ninety_nine_of_quadratic_add_standard`,
and
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget_prefix_le_half_of_length_le_forty_nine`.
This gives downstream wrappers a side-condition-free actual recurrence and a
larger finite-window prefix budget from the uniform `1/198` estimate.  Treat the
`K+1 <= 49` prefix result as finite-window infrastructure only, not as the
global prefix budget consumed by the conditional half-contraction endpoints.
The newest range-Hessian positivity bridge adds
`chewi1314_polytopeSlackNegLog_rangeHess_isPositive` and
`chewi1314_polytopeSlackNegLog_rangeHess_toLinearMap_isPositive`, exposing the
concrete finite-row range Hessian as a Mathlib positive operator via
`ContinuousLinearMap.isPositive_iff` and
`ContinuousLinearMap.isPositive_toLinearMap_iff`.  Search-first spectral
result: no ready local/mathlib theorem directly returned the required
positive-operator square-root family, so this lane now uses a local
finite-dimensional eigenbasis theorem based on Mathlib
`LinearMap.IsSymmetric` spectral APIs.  The inverse-model handoff
`continuousLinearMap_adjointSqrtCoord_inv_eq_of_right_inverse_finiteDim`
derives `invHess = S⁻¹(S⁻¹)†` from the compiled right-inverse identity.  The
CLM-to-equivalence adapter
`continuousLinearMap_exists_adjointSqrtCoord_of_adjointSqrt_right_inverse_finiteDim`
and range wrapper
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_hessCLM_pointwise`
now reduce a CLM Hessian factor `H = sqrtH†sqrtH` to the exact range model.
The new generic local spectral theorem provides that factor from positivity,
and the full range-sqrt endpoint should be reused directly.
The selection wrapper
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel_of_pointwise` now
packages pointwise feasible square-root witnesses into the domain-wide family;
the source-facing endpoint is
`chewi1314_polytopeSlackNegLog_exists_rangeSqrtCoordModel`.
The concrete-consumer packet now instantiates that endpoint in the
source-facing standard §13.16 wrappers, so callers can use the no-sqrt-model
endpoints ending in
`preDecrementBudget_noFactor_standardConstants`,
`preDecrementTsumBudget_noFactor_standardConstants`,
`preDecrementGeometricBudget_noFactor_standardConstants`, and
`preDecrementContractingBudget_noFactor_standardConstants` for
`sourcePreliminaryNextNewtonSteps`.  Thus the active proof obligation has
shrunk to the source next-pre-decrement estimate plus one compiled budget
interface.
The actual source next-pre-decrement sequence is now named
`chewi1316_polytopeSlackNegLog_sourcePreDecrementNextBudget`, and the preferred
contracting endpoint is
`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourcePreliminaryNextNewtonSteps_actualPreDecrementContractingBudget_noFactor_standardConstants`.
Do
not route the next packet back to source-pullback
decrement, scalar constants, successor membership, source-radius-half, or the
range one-step invariant; those are already behind compiled wrappers.  Do not
chase a separate range recurrence when the source-coordinate Newton recurrence
is available, because it now transports automatically.  If the next route
proves the one-step decrement directly in source coordinates, use the source
canonical/standard handoffs instead of the range-sqrt wrapper.

Archived route context below: the Chapter 13 lane
now has Chewi Lemma 13.15(1) and Lemma 13.15(2) compiled for the arbitrary
finite-row polytope logarithmic barrier route.  The newest reusable transport
declarations are `barrierAffinePreimageGrad_hasFDerivAt`,
`convex_barrierAffineRangeSet`, `barrierAffineRangeGrad_hasFDerivAt`,
`barrierAffineRangeGrad_continuousOn_of_hasFDerivAt`,
`chewi1315_polytopeSlackNegLog_range_gradient_segment_inner_le`, and the
source-space endpoint
`chewi1315_polytopeSlackNegLog_gradient_segment_inner_le`.  The next proof
packet should use these compiled Lemma 13.15 wrappers in the path-following
decrement recurrence and central-path barrier-parameter estimates; do not
reroute to earlier 13.6, 13.8, product/sum, or positive-orthant setup unless a
new downstream proof directly needs those already verified declarations.
The follow-up Lemma 13.16 assembly now compiles through
`real_le_div_one_sub_of_sq_div_one_add_le_mul`,
`chewi1316_localNorm_le_decrement_div_one_sub`,
`chewi1316_central_objective_gap_le`,
`chewi1316_objective_gap_to_center_le`, and
`chewi1316_objective_gap_le`, giving the source objective-gap estimate from
supplied central-path optimality and Lemma 13.6/13.15 inputs.  The generic
main-stage sequence route is now compiled: it preserves `lambda <= 1/4` along
the increasing-parameter Newton path and feeds that invariant to the
closed-form objective-gap stopping rule.  The next live route is the
finite-row/source-pullback specialization that composes this accuracy consumer
with the concrete standard preliminary initializer.
The newest main-stage algebra layer adds
`chewi1316_preNewtonDecrement_le_update_bound`,
`real_mainStage_newton_fraction_le_quarter`, and
`chewi1316_mainStage_newtonDecrement_le_quarter`.  It proves the source
`c0 <= 1/16` post-Newton algebra and the pre-Newton update bound from a
supplied dual-local-norm triangle/homogeneity interface.  The newest
dual-norm interface layer adds `dualLocalNorm_eq_adjointCoord_norm_of_factor`,
`dualLocalNorm_add_le_of_adjointCoordFactor`,
`dualLocalNorm_smul_of_adjointCoordFactor`,
`chewi1316_preNewtonDecrement_le_update_bound_of_adjointCoordFactor`, and
`chewi1316_preNewtonDecrement_le_update_bound_of_adjointSqrt_right_inverse`,
discharging that interface from the existing inverse-Hessian right-inverse and
square-root-coordinate models.  The newest main-stage invariant layer adds
`chewi1316_preNewtonDecrement_le_update_bound_of_gradientUpdate_adjointSqrt_right_inverse`,
`chewi1316_mainStage_newtonDecrement_le_quarter_of_gradientUpdate_and_newtonBound`,
and
`chewi1316_mainStage_newtonDecrement_le_quarter_of_sqrtCoordFamilyModel_sourceNewtonSegment`.
It packages the source gradient-update equality, the pre-Newton bound, and the
compiled Theorem 13.8 Newton-step wrapper into the invariant
`lambda <= 1/4 -> lambda_next <= 1/4`.  The newest central-path algebra layer
adds `centralPathGradient_update_eq`, `centralPathGradient_update_eq_of_tNext`,
`chewi1316_preNewtonDecrement_le_update_bound_of_centralPathGradient_adjointSqrt_right_inverse`,
and
`chewi1316_mainStage_newtonDecrement_le_quarter_of_centralPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
This discharges the algebraic `t_next = (1 + delta) * t` gradient-update
rewrite for objectives with gradient `t • a + grad phi(x)`.  The newest
positive-orthant central-path layer adds `centralPathGrad`,
`centralPathGrad_hasFDerivAt`, `newton_linear_of_hessian_right_inverse`,
`positiveOrthantCentralPathGrad_hasFDerivAt`,
`positiveOrthantCentralPathGrad_segment_hasFDerivAt`,
`positiveOrthantCentralPathGrad_newton_linear`, and
`positiveOrthantNegLog_dualLocalNorm_grad_le_sqrt_card`.  It discharges the
positive-orthant central-path objective differentiability, segment
differentiability, Newton linearization, and barrier-gradient norm bound.  The
newest feasible-step layer adds
`positiveOrthant_mem_of_localNorm_sub_lt_one`,
`positiveOrthant_mem_of_mem_dikinEllipsoid_one`,
`positiveOrthant_newtonStep_mem_of_newtonDecrement_lt_one`, and
`positiveOrthantCentralPathGrad_newtonStep_mem_of_decrement_lt_one`, proving
that Dikin radius-one positive-orthant Newton steps stay feasible.  The newest
positive-orthant main-stage assembly layer adds
`chewi1316_positiveOrthant_preNewtonDecrement_le_update_bound`,
`chewi1316_positiveOrthant_preNewtonDecrement_lt_one`,
`chewi1316_positiveOrthant_mainStage_step_mem`,
`chewi1316_positiveOrthant_mainStage_decrement_le_quarter`, and
`chewi1316_positiveOrthant_mainStage_step_mem_and_decrement_le_quarter`,
closing the selected central-path one-step invariant for the finite positive
orthant.  The newest scalar iteration layer adds
`chewi1316_mainStageParameter_eq_pow_mul`,
`chewi1316_mainStageParameter_eq_pow_mul_of_delta`, and
`chewi1316_mainStageParameter_pos_of_pos`, proving the source closed form for
the multiplicative `t_n` update.  The newest objective-gap stopping layer adds
`chewi1316_objectiveGapNumerator_le_two_mul`,
`chewi1316_objective_gap_le_eps_of_le_quarter_and_large_t`, and
`chewi1316_objective_gap_le_eps_of_mainStageParameter_large`, combining the
closed-form `t_n` growth with the compiled objective-gap bound.  The newest
generic main-stage sequence layer adds
`chewi1316_mainStage_decrement_step_le_quarter_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`,
`chewi1316_mainStage_decrement_le_quarter_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`,
and
`chewi1316_objective_gap_le_eps_of_mainStage_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`.
It is the preferred bridge from a preliminary `tMain`/`x0` initializer and
supplied Newton path data to an `eps` objective-gap theorem; future §13.16
finite-row work should instantiate this layer rather than re-proving the
main-stage recurrence.
The newest
preliminary-stage layer adds
`chewi1316_preliminaryStageParameter_eq_pow_mul_of_delta`,
`chewi1316_preliminaryStageParameter_pos_of_pos`,
`centralPathGradient_decrease_eq`,
`centralPathGradient_decrease_eq_of_tNext`, `preliminaryPathDirection`,
`preliminaryPathGrad`, endpoint identities and zero-decrement wrappers for
`t = 1` and `t = 0`, `preliminaryPathGrad_hasFDerivAt`, and
`preliminaryPathGradient_decrease_eq_of_tNext`.  The newest verified
preliminary invariant layer adds the decreasing-update pre-Newton bounds and
post-Newton wrappers
`chewi1316_preNewtonDecrement_le_decrease_bound`,
`chewi1316_preNewtonDecrement_le_decrease_bound_of_preliminaryPathGradient_adjointSqrt_right_inverse`,
`chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_gradientDecrease_and_newtonBound`,
`chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_sqrtCoordFamilyModel_sourceNewtonSegment`,
and
`chewi1316_preliminaryStage_newtonDecrement_le_quarter_of_preliminaryPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`.
The exact-center main-stage bridge adds `centralPathGrad_at_analyticalCenter`
and the four
`chewi1316_mainStage_initial_decrement_le_quarter_of_analyticalCenter*` wrappers,
reducing exact-center initialization to `|t| * ||a||*_center <= 1/4`.  The
newest preliminary-to-main bridge adds
`barrierGrad_dualLocalNorm_le_of_preliminaryPath`,
`barrierGrad_dualLocalNorm_le_of_preliminaryPath_adjointCoordFactor`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_barrierGrad_and_objective`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_bound_adjointCoordFactor`,
turning a final preliminary decrement plus small preliminary/main scaled
dual-norm budgets into the main-stage `lambda <= 1/4` initialization.  The
finite sequence layer adds `preliminaryPath_decrement_bound_of_step`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm`,
carrying a preliminary decrement budget sequence by induction and rewriting
`t_N = (1 - c0 / sqrt nu)^N * tStart`.  The log-count split layer adds
`chewi1316_preliminary_budget_le_quarter_of_split`,
`chewi1316_preliminary_tail_le_of_half_power_log`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_split`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_logTail`,
reusing `chewi54_half_pow_mul_le_eps_of_log_ratio_le` for the half-power/log
tail calculation.  The factor-count layer adds
`chewi1316_preliminary_tail_half_power_bound_of_factor_pow`,
`chewi1316_preliminary_tail_half_power_bound_of_nonneg_factor_pow`,
`chewi1316_factor_pow_le_half_pow_of_log_le`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_absFactorPowLogTail`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorPowLogTail`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorLogTail`.
The count-discharge layer adds `chewi1316_factorLog_le_halfLog_of_count`,
`chewi1316_factor_pow_le_half_pow_of_count`,
`chewi1316_count_condition_of_sqrt_mul_log_le`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorCountTail`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTail`.
The tail-base layer adds `chewi1316_tailBase_log_budget_of_le_pow` and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBound`.
The log-choice layer adds `chewi1316_tailBase_le_sixteenth_mul_two_pow_of_log_le`,
`chewi1316_tailBase_le_sixteenth_mul_two_pow_of_bound_log_le`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailLogBound`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound`.
The integer-choice layer adds `chewi1316_exists_nat_mul_log_two_ge`,
`chewi1316_exists_nat_mul_pos_ge`,
`chewi1316_exists_tailBound_log_index`,
`chewi1316_exists_preliminary_count_index`, and
`chewi1316_exists_preliminary_tail_log_count_indices`.
The nonnegative-tail layer adds
`chewi1316_preliminary_tail_le_of_half_power_tailBase_bound`,
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBound_nonneg`,
and
`chewi1316_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound_nonneg`.
The positive-main-parameter layer adds
`chewi1316_exists_pos_abs_mul_le_sixteenth`,
`chewi1316_exists_positive_mainStageParameter_budget`, and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_factorSqrtCountTailBoundLogBound_nonneg`.
The source-start layer adds `preliminaryPath_initial_decrement_le_of_start_one_self`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_factorSqrtCountTailBoundLogBound_nonneg`.
The measured-tail fallback layer adds
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_measuredTailLogBound`,
using `||grad phi(xbar0)||*_{x_N} + 1` as an automatic positive preliminary tail
upper bound.  The next live route is to replace this fallback with the concrete
Chewi/Nesterov source upper bound for the preliminary tail base matching the
reverse path-following argument cited to Nesterov §5.3.5, then the
strictly-feasible-start discussion.
The reverse preliminary-gradient layer adds
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath`,
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_adjointCoordFactor`,
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_barrier`,
`sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_adjointCoordFactor`,
and `sourceGrad_dualLocalNorm_scaled_le_of_preliminaryPath_sequence_barrier`,
which package the estimate
`|t_N| * ||grad phi(xbar0)||*_{x_N} <= sqrt(nu) + lambda_N` from the
preliminary residual and barrier gradient bound.
The final-tail initialization layer adds
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_sourceStart_tailBudget`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBudget`,
which directly consume the scaled final preliminary tail budget and choose a
positive main-stage parameter.  The extracted final-tail layer adds
`chewi1316_preliminary_final_tail_le_sixteenth_of_factorSqrtCountTailBound_nonneg`,
`chewi1316_preliminary_final_tail_le_sixteenth_of_factorSqrtCountTailBoundLogBound_nonneg`,
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBoundLogBound`,
separating the count/log scalar tail budget from the source-start
initialization wrapper.  The uniform-tail layer adds
`chewi1316_exists_preliminary_final_tail_budget_indices_of_uniformTailBound`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformTailBound`,
choosing the preliminary log/count indices internally from a positive uniform
tail bound.  The inverse-Hessian transport layer adds
`chewi1316_uniformTailBound_of_inverseHessianQuadraticUpper` and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_inverseHessianQuadraticUpper`,
reducing the live analytical-center/source-tail gate to a source-point
dual-norm budget plus a uniform quadratic upper comparison between
`invHess (xseq N)` and `invHess xbar0`.  The local-norm duality layer adds
`chewi1316_uniformTailBound_of_dualLocalNormUpper`,
`chewi1316_uniformTailBound_of_localNormLower_and_inverseIdentity`, and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_localNormLower_and_inverseIdentity`,
so the live gate can also be discharged in the primal self-concordant
local-norm lower-comparison shape once the inverse-local and Cauchy bridges are
available.  The segment-stability layer adds
`chewi1316_uniformTailBound_of_hessianSegmentExponentialBounds_and_inverseIdentity`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_hessianSegmentExponentialBounds_and_inverseIdentity`,
so a sequence of `HessianSegmentExponentialBounds` certificates plus a uniform
denominator budget now suffices to trigger the source-start initialization
pipeline.  The mixed-third certificate layer adds
`chewi1316_uniformTailBound_of_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`
and
`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`,
so the source-radius `HessianSegmentMixedThirdLocalNormCertificate` sequence can
now feed the same pipeline directly.  The source-start successor layer adds
	`chewi1316_sourceTailBound_of_hessianSegmentMixedThirdLocalNormCertificate_and_inverseIdentity`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_and_inverseIdentity`, and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_and_inverseIdentity`,
	so the actual preliminary shape `xseq 0 = xbar0` can be handled without asking
	for a nonzero source-radius certificate at the zeroth index.  The latest
	uniform-radius successor packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_and_inverseIdentity`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_and_inverseIdentity`,
	so future exact-source work should target a single successor radius bound and
	scalar denominator budget rather than repeated per-index denominator proofs.
	The latest budget/canonical-denominator packet adds
	`sourceBound_le_tailBound_of_div_budget`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_budget_and_inverseIdentity`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_and_inverseIdentity`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_budget_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_and_inverseIdentity`.
	This removes the separate source-point tail side condition; the preferred
	exact-source target is now a global radius estimate and the single scalar
	budget `sourceBound / (1 - M*radiusBound) <= tailBound`.  The newest
	zero-safe packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_and_inverseIdentity`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_and_inverseIdentity`,
	so exact-source callers no longer need a nonzero-displacement proof for
	successors that are exactly `xbar0`.
	The global-derivative packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_globalDeriv_and_inverseIdentity`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_globalDeriv_and_inverseIdentity`,
	so the exact-source route now consumes one domain-wide Hessian derivative
	and mixed-third identity package instead of per-successor segment identities.
	The barrier-interface packet adds
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	`chewi1316_uniformTailBound_of_sourceRadius_successor_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusBound_canonicalDen_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadius_successor_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	These route exact-source initialization through `SelfConcordantBarrierOn`,
	so the source gradient bound becomes `sqrt(nu)` and the common
	unit-parameter/radius-half scalar budget becomes `2 * sqrt(nu) <= tailBound`.
	The source-radius telescope packet adds the square-root-coordinate local-norm
	identity/triangle/finite-sum lemmas, the vector telescopes
	`sequence_sub_initial_eq_sum_steps_of_succ_sub` and
	`sequence_sub_initial_eq_sum_steps_of_succ_eq_add`, the source-radius
	sum-step wrappers, their radius-half specializations, and
	`chewi1316_uniformTailBound_of_add_steps_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	The source-start existential lift
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_addSteps_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`
	now consumes the same additive-step radius-half data and returns the
	positive main-stage initialization conclusion.
	The direct local-step-sum packet adds
	`sourceRadius_successor_half_of_add_steps_sumLocalNorm_of_adjointSqrt`,
	`chewi1316_uniformTailBound_of_add_steps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_addSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	so callers can use the natural cumulative source-local budget
	`sum_{n<=N} ||steps n||_{xbar0} <= 1/2` directly.
	The preliminary-Newton packet adds
	`sourceRadius_successor_half_of_newtonSteps_sumLocalNorm_of_adjointSqrt`,
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_sumLocalNorm_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	so the exact-source route can consume the algorithmic recurrence
	`x_{n+1} = NewtonStep(preliminaryPathGrad(t_n), x_n)` directly.
	The current-local budget packet adds
	`localNorm_source_le_two_current_of_sourceRadius_half`,
	`sourceLocalNorm_sum_newtonSteps_le_half_of_currentLocalNorm_budget`,
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`,
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	It inductively uses Chewi Lemma 13.6 to compare the source metric to the
	current metric and replaces the raw source-local cumulative step budget by
	`sum_{n<=N} 2 * lambda_n <= 1/2` plus current-local/Newton-decrement
	identities.  The right-inverse cleanup adds
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_hessianRightInverse`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_hessianRightInverse`,
	deriving both inverse-local and step-norm identities from
	`hess(x_n) (invHess(x_n) v) = v`.  The square-root-coordinate family layer
	adds
	`chewi1316_uniformTailBound_of_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`,
	deriving the source Hessian factorization, inverse-Hessian right-inverse,
	and dual quadratic factorization from
	`hess(x_n) = sqrtCoord_n† sqrtCoord_n` and
	`invHess(x_n) = sqrtCoord_n.symm sqrtCoord_n.symm†`.  The non-vacuous
	successor-index cleanup adds
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformTailBound_tailLambdaBudget`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	This fixes the route issue that the older existential wrappers require both
	`1/4 <= lambdaSeq 0` and global `lambdaSeq N <= 1/8`; the new route chooses
	a successor final index and only asks for `lambdaSeq (N+1) <= 1/8`.  The
	sharper preliminary-stage invariant packet adds
	`real_mainStage_newton_fraction_le_eighth`,
	`chewi1316_mainStage_newtonDecrement_le_eighth`,
	`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_gradientDecrease_and_newtonBound`,
	`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_sqrtCoordFamilyModel_sourceNewtonSegment`,
	and
	`chewi1316_preliminaryStage_newtonDecrement_le_eighth_of_preliminaryPathGradient_sqrtCoordFamilyModel_sourceNewtonSegment`,
	so the successor `1/8` budget can be proved from the existing Theorem 13.8
	Newton-step route under `c0 <= 1/200`.
	The next-parameter sequence bridge adds
	`chewi1316_preliminaryPath_decrement_step_le_eighth_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`
	and
	`chewi1316_preliminaryPath_lambdaSeq_step_of_nextNewton_sqrtCoordFamilyModel_sourceNewtonSegment`,
	turning the pointwise invariant into the reusable sequence
	`hdecrement_step` interface for the textbook recurrence
	`x_{n+1} = newtonStep (grad f_{t_{n+1}}) x_n`.
	This records the indexing correction: old wrappers using
	`grad f_{t_n}` for the Newton step are not the exact preliminary
	path-following source shape.
	The correct-index source-tail layer adds
	`chewi1316_uniformTailBound_of_preliminaryNextNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_currentLocalNormBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	It reuses the generic source-radius proof with
	`gradSeq n = grad f_{t_{n+1}}` and keeps a separate `stepBudget` for the
	pre-Newton displacement norms, so downstream work must prove that budget
	or use a sharper analytical-center radius argument.
	The pre-decrement-budget cleanup adds
	`chewi1316_uniformTailBound_of_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	It derives the step local-norm bound from
	`lambda_{f_{t_{n+1}}}(x_n)` using the right-inverse Newton
	local-norm/decrement identity, leaving the summed pre-Newton decrement
	budget as the sharper downstream scalar gate.
	The pre-decrement pointwise bridge adds
	`chewi1316_preliminaryPath_preDecrementNext_le_stepBudget_of_residual_quarter_sqrtCoordFamily`,
	which derives the next-parameter pre-Newton decrement budget from the old
	residual invariant, decreasing `t` update, and square-root-coordinate
	inverse-Hessian model.  The route check
	`chewi1316_preDecrementStepBudget_lower_incompatible_with_sourceBudget`
	shows this constant-level budget cannot satisfy the global source-radius
	prefix-sum interface when `c0 >= 0`; two steps already exceed the `1/2`
	source budget.  The blueprint should now prefer a sharper preliminary
	radius/telescoping argument or an analytical-center distance bound instead
	of wrapping this constant budget route further.  The correct-index
	source-start consumer
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_barrier_globalDeriv_and_sqrtCoordModel`
	now internally supplies the piecewise residual budget sequence (`1/4` at
	index zero, `1/8` after that), the next-Newton decrement-step premise, the
	sequence square-root data, Hessian strict positivity, and the source Cauchy
	bridge from the domain-wide adjoint-square model.  Future packets should
	target the remaining summable next-parameter pre-Newton budget, not
	re-thread those interface assumptions.
	The positive-orthant instantiation
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_preDecrementBudget`
	now removes the concrete finite-product barrier side conditions for this
	correct-index route by reusing the compiled positive-orthant
	sqrt-coordinate models, self-concordant barrier theorem, Hessian derivative,
	mixed-third identity, and convex segment membership.  The unresolved
	blueprint item remains the real quantitative source budget, not the
	concrete barrier plumbing.
	The direct radius-half packet
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_sourceRadiusHalf_barrier_globalDeriv_and_sqrtCoordModel`
	and the concrete finite-product wrapper
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_sourceRadiusHalf`
	now make the analytical-center alternative first-class.  They reuse the
	tail-lambda source-start wrapper, avoiding the impossible global
	`lambdaSeq <= 1/8` condition at index zero, and leave only the actual
	source-radius-half certificate for the preliminary path.
	The finite positive-orthant coordinate-radius interface is now available:
	`euclideanSpace_norm_le_sqrt_fin_mul_of_abs_coord_le`,
	`positiveOrthantNegLog_localNorm_le_sqrt_fin_mul_of_coord_abs_le`,
	`positiveOrthantNegLog_sourceRadiusHalf_of_coord_abs_le_inv_two_sqrt`,
	and
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_coordRadiusHalf`.
	Use it to replace the abstract source-radius-half premise by coordinate
	relative displacement bounds along the preliminary path.
	The scalar relative-coordinate route is now first-class:
	`positiveOrthant_preliminaryPathGrad_apply_coord`,
	`positiveOrthant_preliminaryPath_newtonStep_apply`,
	`positiveOrthant_coord_abs_sub_le_mul_of_relative_abs_sub_le`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_coord_eq`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_relativeCoord_eq`,
	and
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_relativeCoordRadiusHalf`
	show that it is enough to prove the scalar relative-radius invariant for
	`y_n(i)=xseq n i/xbar0 i` under
	`y_{n+1}=2*y_n-tseq(n+1)*y_n^2`.
	The scalar obstruction layer
	`scalar_sequence_linear_lower_bound_of_step`,
	`scalar_radius_bound_forces_linear_step_count`, and
	`chewi1316_relativeCoordRadiusHalf_forces_count_bound_of_linear_growth`
	now records that any proof combining relative-radius-half with per-step
	lower growth `c0/sqrt d` can only cover prefixes satisfying
	`(N+1)*c0 <= 1/2`.  Use this to avoid chasing a false global
	source-radius proof; the likely next blueprint correction is a finite-window
	initialization certificate or a moving-center/local-metric radius argument.
	The finite-window correction now has a compiled source-start wrapper:
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_selectedSourceRadiusHalf_zeroSafe_barrier_globalDeriv_and_inverseIdentity`.
	It keeps the Chewi log/count choices explicit, asks only for a selected
	`xseq N` source-radius-half certificate, and derives the source-tail bound
	from the barrier gradient estimate plus the local self-concordant Hessian
	transport.  Future exact-source §13.16 work should discharge this selected
	radius certificate for the concrete preliminary path or replace it with a
	moving-center certificate; it should not reintroduce the all-prefix
	source-radius premise.
	The selected correction is now lifted to the square-root-coordinate and
	finite positive-orthant layers:
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_selectedSourceRadiusHalf_barrier_globalDeriv_and_sqrtCoordModel`,
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedSourceRadiusHalf`,
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedCoordRadiusHalf`,
	and
	`chewi1316_positiveOrthant_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryNextNewtonSteps_selectedRelativeCoordRadiusHalf`.
	The next exact-source §13.16 target should be the selected scalar recurrence
	bound `|xseq N i / xbar0 i - 1| <= 1/(2*sqrt d)` for a positive chosen
	index `N` satisfying the existing log/count budgets.
	The newest scalar route check proves this target is not the right
	textbook-scale route without an additional small-window assumption:
	`scalar_newton_decreasing_parameter_step_lower`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_relativeCoord_linear_lower`,
	`chewi1316_selectedRelativeCoordRadiusHalf_forces_count_bound_of_preliminaryNextNewton`,
	and
	`chewi1316_selectedRelativeCoordRadiusHalf_and_count_force_logIndex_bound`
	show that the actual recurrence plus selected radius and count budget
	implies `M * log 2 * sqrt d <= 1/2`.  The next §13.16 proof packet should
	therefore seek a moving-center/local-metric certificate or a different
	source-tail estimate, not another all-prefix or selected source-radius
	wrapper for the same analytical center.
	The moving-coordinate route is now concretely exposed:
	`positiveOrthantNegLog_sourceGrad_dualLocalNorm_eq_norm_relative` gives the
	exact source-gradient dual norm as `||x_i/xbar0_i||_2`, and
	`positiveOrthantNegLog_sourceGrad_tailBudget_of_scaled_relative_le` reduces
	the direct source-start final-tail budget to
	`|t| * |x_i/xbar0_i| <= 1/(16*sqrt d)` for every coordinate.  This is the
	preferred diagnostic interface for positive-orthant experiments.  The newest
	scaled-relative obstruction packet adds
	`scalar_newton_decreasing_parameter_product_ge_half`,
	`chewi1316_positiveOrthant_preliminaryNextNewtonStep_scaled_relative_ge_half`,
	and
	`chewi1316_positiveOrthant_scaledRelativeTailBudget_forces_half_le`,
	proving that the actual preliminary Newton recurrence with
	`c0/sqrt d <= 1/200` keeps
	`1/2 <= |t_N| * |x_N i/xbar0_i|`.  Hence the direct positive-orthant
	scaled-tail budget forces `1/2 <= 1/(16*sqrt d)` and is not a
	textbook-scale final route by itself.
	The affine/range source-tail transport packet adds
	`barrierAffinePreimageAdjointDualLocalNorm_rightInverse_eq`,
	`barrierAffinePreimageSourceGradientDualLocalNorm_rightInverse_eq`,
	`barrierAffineRangeSourceGradientDualLocalNorm_surjective_eq`,
	`chewi1314_polytopeSlackNegLog_sourceGrad_dualLocalNorm_rangeInvHess_eq`,
	and
	`chewi1314_polytopeSlackNegLog_scaled_sourceGrad_dualLocalNorm_rangeInvHess_eq`,
	moving the remaining §13.16 source-gradient tail into finite slack-range
	coordinates for bounded-polytope estimates.
	The range-tail consumer packet adds
	`chewi1314_polytopeSlackNegLog_rangePullInvHess` and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeTailBudget`,
	so the final §13.16 initialization now follows from a single closed-form
	scaled source-tail bound in the slack-range metric.
	The uniform range-tail handoff packet adds
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_uniformRangeTailBound_tailLambdaBudget`,
	choosing the scalar log/count indices internally and using the successor
	final-decrement budget.  This reduces the remaining finite-row polytope
	§13.16 gate to proving the uniform slack-range source-tail estimate itself.
	The range-preliminary-Newton packet adds
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_preliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_globalDeriv_and_sqrtCoordFamily`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_radiusHalf_zeroSafe_globalDeriv_and_sqrtCoordFamily_tailLambdaBudget`.
	It applies the generic preliminary-next-Newton source-tail theorem on the
	slack range and assembles the result to the source-start initialization.
	The direct source-radius handoff packet adds
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_zeroSafe_globalDeriv_and_inverseIdentity`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_zeroSafe_globalDeriv_and_inverseIdentity_tailLambdaBudget`.
	The source-only square-root packet adds
	`chewi1314_polytopeSlackNegLog_range_sourceCauchy_of_adjointSqrtCoord`,
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf_zeroSafe_globalDeriv_and_sourceSqrtCoord`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_zeroSafe_globalDeriv_and_sourceSqrtCoord_tailLambdaBudget`.
	The range Hessian-derivative handoff packet adds
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
	from the direct source-radius route by reusing the positive-orthant
	logarithmic-barrier Hessian derivative package through affine/range
	transport.
	The direct Cauchy/right-inverse packet adds
	`hessianCauchy_sq_of_quadratic_pos`,
	`dualPrimalCauchy_of_hessian_right_inverse_pos`,
	`barrierAffinePreimageHess_symmetric`,
	`barrierAffineRangeHess_symmetric`,
	`positiveOrthantNegLogHessCLM_symmetric`,
	`chewi1314_polytopeSlackNegLog_rangeHess_symmetric`,
	`chewi1314_polytopeSlackNegLog_range_sourceCauchy`,
	`chewi1316_polytopeSlackNegLog_uniformRangeTailBound_of_sourceRadiusHalf`,
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget`,
	removing the source-point square-root-coordinate/factorization assumption
	from the direct source-radius route.
	The direct dual-seminorm/no-factor packet adds
	`dualLocalNorm_add_le_of_hessian_right_inverse_pos`,
	`dualLocalNorm_smul_of_hessian_right_inverse`,
	`chewi1314_polytopeSlackNegLog_rangePullInvHess_dualLocalNorm_add_le`,
	`chewi1314_polytopeSlackNegLog_rangePullInvHess_dualLocalNorm_smul`,
	`chewi1316_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_tailBudget_dualLaws`,
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeTailBudget_noFactor`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor`.
	This removes the pulled-back inverse-Hessian factorization gate from the
	direct finite-row §13.16 slack-range handoff.
	The range-successor packet adds
	`barrierAffineRange_localNorm_eq_ambient`,
	`barrierAffineRangeSet_mem_of_localNorm_sub_lt_one_positiveOrthant`,
	`chewi1314_polytopeSlackNegLog_range_newtonStep_mem_of_decrement_lt_one`,
	`chewi1316_polytopeSlackNegLog_range_successor_mem_of_preliminaryNextNewtonSteps_preDecrementBudget`,
	`chewi1316_polytopeSlackNegLog_rangeRestrict_successor_mem_of_preliminaryNextNewtonSteps_preDecrementBudget`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor_of_preliminaryNextNewtonSteps`.
	It derives successor range membership from range local-norm Dikin
	membership plus the summable next pre-decrement budget.
	The no-square-root radius packet adds
	`localNorm_sum_le_sum_localNorm_of_hessian_pos`,
	`sourceRadius_le_of_sum_steps_of_hessian_pos`,
	`sourceRadius_successor_half_of_newtonSteps_currentLocalNorm_budget_hessian_pos`,
	`chewi1316_polytopeSlackNegLog_rangeSourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`,
	`chewi1316_polytopeSlackNegLog_rangeRestrict_sourceRadiusHalf_of_preliminaryNextNewtonSteps_preDecrementBudget_noFactor`, and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangeSourceRadiusHalf_tailLambdaBudget_noFactor_of_preliminaryNextNewtonSteps_preDecrementBudget`.
	It derives range source-radius-half from the same range preliminary Newton
	recurrence plus summable next pre-decrement budget, without an adjoint-square
	coordinate model.
	The canonical scalar packet adds
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_canonicalLambda`
	and
	`chewi1316_polytopeSlackNegLog_exists_positive_mainStage_initial_decrement_le_quarter_of_preliminaryPath_sequence_closedForm_sourceStart_rangePreliminaryNextNewtonSteps_preDecrementBudget_noFactor_standardConstants`.
	It fixes the auxiliary lambda sequence, `c0 = 1/200`, and
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
	It lets the direct standard-constant handoff consume the preliminary
	one-step invariant through a domain-wide range Hessian/inverse-Hessian
	sqrt-coordinate family, so source-pullback decrement transport and the
	range one-step `1/4 -> 1/8` invariant are no longer separate exact-source
	gates.  Source-transport wrappers now also remove the concrete range
	recurrence and range pre-decrement gates when the source-coordinate Newton
	recurrence and source pre-decrement budget are supplied.  The source
	one-step API can consume a direct source-coordinate decrement proof
	without the range-sqrt wrapper.  The next exact-source gate is now to
	prove source pre-decrement summability and, for the range-sqrt route, the
	range sqrt-coordinate family itself (or an equivalent mathlib spectral /
	positive-operator construction).
	Search-first reuse: local
	`chewi136_localNorm_sandwich_sourceRadius`,
	`hessianPrimalFactor_of_adjointSqrt`,
	`localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse`,
	`localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse`,
	`hessianRightInverse_of_adjointSqrtCoord_invHess`,
	`inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse`,
	and mathlib `norm_add_le`, `norm_sum_le`, and `Finset.sum_range_sub`.  The next
	exact-source §13.16 gate is no longer a raw `hradius_half`, custom
	`lambdaSeq`, scalar tail-budget choice, source-pullback decrement
	transport, exposed range one-step invariant, or separate range recurrence;
	it is the scalar summability budget `sum 2*lambda_n <= 1/2` for the
	source next pre-decrement plus either a direct source-coordinate one-step
	proof or the point-dependent range sqrt-coordinate family route.

Older route context: `StatInference/Optimization/InteriorPoint.lean` supports
Chewi Lemma 13.6.  Reuse the compiled scalar Gronwall, concrete segment
`ψ_v(t)`, mixed-third certificate, Frechet-Hessian derivative, and local-norm
sandwich declarations.  The newest source wrapper also includes the scalar
Riccati comparison from `q' <= M*q^2` to
`q(t) <= r / (1 - M*r*t)` and the specialized segment-local-norm wrapper for
`q(t)=||y-x||_{z_t}`.  The latest derivative packet proves the `sqrt(ψ)`
local-norm derivative formula and derives
`d/dt ||y-x||_{z_t} <= M ||y-x||_{z_t}^2` from the mixed-third
self-concordance interface.  The latest positivity/source-radius packet
derives local-norm positivity from a positive-definite Hessian hypothesis and
proves the named Lemma 13.6(4) source-radius local-norm sandwich
`chewi136_localNorm_sandwich_sourceRadius` with `r = ||y-x||_x`.  The next
Newton/Dikin packet proves the supplied-oracle Definition 13.7 norm identity,
the `x+ in Dikin(x,1/M)` gate from `M*lambda < 1`, and the Newton-step
specialization of the Lemma 13.6 local-norm sandwich.  The next proof target is
therefore dual-local-norm transport plus the real
third-derivative-to-`MixedThirdSelfConcordantOn` bridge and Theorem 13.8
gradient-residual/Delta bound.  The latest dual-transport packet proves the
supplied-inverse-Hessian comparison layer and the first displayed inequality in
Theorem 13.8.  The latest assembly packet proves the final Theorem 13.8
decrement algebra from a supplied inverse-Hessian comparison plus a supplied
Delta/gradient-residual quadratic bound.  The newest scalar packet formalizes
the Delta coefficient integral
`int_0^1 ((1 - M*lambda*t)^(-2) - 1) dt = M*lambda/(1-M*lambda)`.  The current
Theorem 13.8 route has advanced through the normalized Rayleigh/adjoint
conjugation line, including the continuous-linear-equivalence coordinate
wrapper, square-root inverse-quadratic identity, zero-step split, and the
on-set right-inverse wrapper
`chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoord_of_sourceNewtonSegment`.
The preferred route is now its canonical normalized-Delta successor
`chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoordDelta_of_sourceNewtonSegment`,
which defines the normalized operator as `coord† Delta coord` internally.
The newest concrete model wrapper
`chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment`
derives Hessian positivity, Hessian symmetry, the inverse-Hessian right-inverse
identity, and the canonical normalized-Delta route from the source equalities
`hess z = S_z†S_z` and `invHess z = S_z^{-1}(S_z^{-1})†`.  The next genuine
source-model work now starts from the compiled `-log` positive-domain model:
`negLogHessCLM_sqrtCoord_model_Ioi` and
`negLogInvHessCLM_sqrtCoord_model_Ioi` instantiate the square-root/inverse-
Hessian equalities for Chewi Examples 13.4/13.10, and
`negLogBarrier_deriv_sq_div_second_eq_one` /
`negLogBarrier_dualLocalNorm_deriv_eq_one` compile the exact Example 13.10
barrier-parameter identity `||f'(x)||_x^* = 1` for `x > 0`.  The finite
positive-orthant product now also compiles through `positiveOrthant`,
`positiveOrthantNegLogBarrier`, `positiveOrthantNegLogGrad`,
`positiveOrthantNegLogInvHessCLM`, and
`positiveOrthantNegLog_dualLocalNorm_grad_eq_sqrt_card`, giving the
expected product barrier parameter `d`.  The same positive-orthant product now
has compiled diagonal Hessian/inverse-Hessian square-root model equalities via
`positiveOrthantNegLogHessCLM`,
`positiveOrthantNegLogHessCLM_sqrtCoord_model_positiveOrthant`, and
`positiveOrthantNegLogInvHessCLM_sqrtCoord_model_positiveOrthant`.  It also
has the source-facing Theorem 13.8 specialization
`chewi138_positiveOrthant_newtonDecrement_step_le_of_sourceNewtonSegment`, so
future positive-orthant Newton work should provide the remaining
self-concordance/differentiability/Newton-linearization inputs to that wrapper.
The easy self-concordance infrastructure now compiles through
`positiveOrthantNegLogThirdMixed`,
`positiveOrthantNegLogHessCLM_quadratic_nonneg`,
`positiveOrthantNegLog_localNorm_sq_eq_sum`,
`positiveOrthantSquareVec_norm_le_norm_sq`,
`positiveOrthantNegLogThirdMixed_eq_neg_two_inner_sqrt_squareVec`,
`positiveOrthantNegLog_mixedThird_bound`, and
`positiveOrthantNegLog_mixedThirdSelfConcordantOn`; the finite weighted
Cauchy mixed-third inequality for the concrete oracle is closed.
The concrete Theorem 13.8 wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment`
also compiles with `M = 1` and `thirdMixed = positiveOrthantNegLogThirdMixed`,
and the Hessian-derivative wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_sourceNewtonSegment`
packages `positiveOrthantNegLogHessDerivCLM_mixed_inner`.  The wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_hasFDeriv_sourceNewtonSegment`
also derives Hessian continuity from the supplied Hessian differentiability
proof.  The concrete wrapper
`chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier` now discharges
the positive-orthant Hessian differentiability, gradient differentiability,
Newton-step feasibility, and Newton linearization hypotheses.  Definition 13.9
is represented by the supplied-oracle interface `SelfConcordantBarrierOn`, and
`positiveOrthantNegLog_selfConcordantBarrierOn` packages the finite
positive-orthant logarithmic barrier as a `d`-self-concordant barrier.  The
scalar `-log` barrier is also now packaged in the supplied-oracle interface by
`negLogBarrier_mixedThirdSelfConcordantOn_Ioi` and
`negLogBarrier_selfConcordantBarrierOn_Ioi`; Example 13.14's single-halfspace
affine-preimage endpoint is available as
`chewi1314_affineNegLog_selfConcordantBarrierOn_of_rightInverse` and
`chewi1314_affineNegLog_selfConcordantBarrierOn_of_surjective`.  The
source-shaped row-slack endpoint
`chewi1314_halfspaceSlackNegLog_selfConcordantBarrierOn` now packages the
single row barrier `x ↦ -log (b - inner a x)` on
`halfspaceSlackSet a b`, using `halfspaceSlackCLM_rightInverse` for
nonzero rows.  The finite-row slack map `polytopeSlackCLM` and domain
`polytopeSlackSet` now compile, with
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_of_rightInverse` and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_of_surjective` proving
the positive-orthant preimage barrier whenever the slack map has a supplied
right inverse or is surjective.  The range-slice theorem
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated` now
removes that source-level front door once the inverse-Hessian oracle on
`(polytopeSlackCLM a).range` satisfies nonnegativity and the barrier-gradient
bound.  The consumer
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated_of_gradient_quadratic`
now reduces that bound to the concrete energy inequality
`inner grad (invHessRange grad) <= m`.  The newest range-right-inverse
consumer
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeTranslated_of_hessianRightInverse_and_gradient_quadratic`
also discharges inverse-Hessian nonnegativity from the single identity that
`invHessRange` is a right inverse of `barrierAffineRangeHess`.  The
positive-orthant base identities
`positiveOrthantNegLogHessCLM_invHess_right_inverse` and
`positiveOrthantNegLog_gradient_invHess_inner_eq_card` now expose the exact
full-space right-inverse and gradient-energy facts for later range-restriction
work.  The affine/polytope pullback identities
`barrierAffinePreimageGradientInvHessRightInverse_quadratic_eq`,
`chewi1314_polytopeSlackNegLog_gradient_invHessRightInverse_inner_eq_card`,
and `chewi1314_polytopeSlackNegLog_gradient_invHessSurjective_inner_eq_card`
now transfer the exact gradient energy to full-row-rank/surjective slack-map
pullbacks.  The affine pulled-gradient packet
`barrierAffinePreimageRightInverse_adjoint`,
`barrierAffinePreimageHess_invHessRightInverse_grad`,
`chewi1314_polytopeSlackNegLog_hess_invHessRightInverse_grad`, and
`chewi1314_polytopeSlackNegLog_hess_invHessSurjective_grad` now transfers the
matching Hessian right-inverse identity on the pulled barrier gradient.  This
should be used as the concrete gradient-local inverse gate for full-row-rank
or surjective slack-map pullbacks.  The range-slice inverse packet
`dualLocalNorm_le_sqrt_of_cauchy_and_hessian_right_inverse`,
`continuousLinearMap_range_eq_top_of_quadratic_pos`,
`barrierAffineRangeInvHessOfPos`,
`positiveOrthantNegLogHessCLM_quadratic_pos`,
`chewi1314_polytopeSlackNegLog_rangeInvHess`,
`chewi1314_polytopeSlackNegLog_range_componentCauchy`, and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_rangeInvHess` now
closes the arbitrary finite-row Example 13.14 route without a surjectivity
hypothesis.  The proof inverts the positive-definite Hessian on the finite
slack-map range and obtains the barrier-gradient bound from Cauchy plus the
right-inverse identity, avoiding the previously exposed range-gradient energy
oracle.  The Chewi Lemma 13.15(1) packet
`localNorm_neg`, `abs_inner_le_dualLocalNorm_mul_localNorm_of_cauchy`,
`inner_sq_le_dualLocalNorm_sq_mul_localNorm_sq_of_cauchy`,
`abs_inner_le_sqrt_mul_localNorm_of_one_sided_cauchy`,
`inner_sq_le_mul_hessian_of_one_sided_cauchy`,
`chewi1315_gradient_inner_sq_le_of_cauchy`, and
`chewi1315_polytopeSlackNegLog_range_gradient_inner_sq_le` now turns the
compiled Cauchy bridges into the source squared gradient inequality, both in
supplied-oracle form and for the concrete finite-row range log barrier.  The
Lemma 13.15(2) packet
`scalar_initial_le_of_sq_le_mul_deriv_on_unit_interval`,
`hessianSegmentGradientInner_hasDerivWithinAt_of_hasFDerivAt`,
`hessianSegmentGradientInner_continuousOn_of_convex`,
`chewi1315_segment_inner_le_of_sq_deriv`,
`chewi1315_gradient_segment_inner_le_of_cauchy`, and
`chewi1315_gradient_segment_inner_le_of_cauchy_continuousOn` now formalizes
Chewi's reciprocal-derivative/sign argument and turns the squared gradient
inequality plus the segment gradient derivative into
`<grad f(x), y-x> <= nu`.  The concrete positive-orthant consumer
`positiveOrthantNegLogGrad_continuousOn` and
`chewi1315_positiveOrthantNegLog_gradient_segment_inner_le` now instantiate
that theorem for the finite product logarithmic barrier with parameter `d`.
The next Chapter 13 theorem-sized target should transport this through the
affine/range finite-row log-barrier route or use it in the path-following
decrement recurrence.  The
row-decomposition lemmas
`polytopeSlackCLM_apply`, `polytopeSlackCLM_add_offset_apply`,
`mem_polytopeSlackSet_iff_forall_halfspaceSlackSet`, and
`polytopeSlackSet_eq_iInter_halfspaceSlackSet` now expose the finite-row
intersection route for sum-rule workers; `polytopeSlackTailOffset` and
`polytopeSlackSet_succ_eq_barrierInterSet` now provide the head/tail induction
shape over `Fin (m+1)`.  The induction wrappers
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum` and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_sum_gradient_quadratic`
now combine a nonzero head row with a recursively supplied tail barrier via
the compiled binary sum rule.  The square-root-coordinate wrapper
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_adjointSqrtCoord`
now routes the same induction step through the existing
`chewi1311_sum_selfConcordantBarrierOn_of_adjointSqrtCoord` API.  The
component-Cauchy packet
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_componentCauchy`
now gives the more useful arbitrary-halfspace induction route, using
`chewi1314_halfspaceSlackNegLog_componentCauchy` for the rank-deficient head
row.  The vector-slack packet
`chewi1314_polytopeSlackNegLog_componentCauchy_of_rightInverse` /
`chewi1314_polytopeSlackNegLog_componentCauchy_of_surjective` now supplies the
tail Cauchy bridge whenever the finite slack map has a supplied right inverse
or is surjective, reusing `positiveOrthantNegLog_componentCauchy`.  The
source-shaped tail-induction consumers
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_rightInverse_componentCauchy`
and
`chewi1314_polytopeSlackNegLog_selfConcordantBarrierOn_succ_of_tail_surjective_componentCauchy`
now discharge both the recursive tail barrier and tail Cauchy bridge for
full-row-rank/surjective tail slack maps.  The `_of_sumRightInverse` wrappers
for the same component-Cauchy induction route now reduce the remaining
head/tail finite-row induction gate to the single summed Hessian right-inverse
identity `barrierSumHess headHess tailHess x (sumInvHess x v) = v`.  The
new `_of_sumAdjointSqrtCoord` wrappers derive that identity from only the
summed adjoint-square model `H_sum = S†S`,
`H_sum^{-1} = S^{-1}(S^{-1})†`, which is the correct route for arbitrary
ambient halfspaces because a single row Hessian is generally rank-deficient.
Next
construct the concrete range oracle/right-inverse/energy bound for the fully
general polytope barrier, or provide that summed right-inverse identity for the
head/tail finite-row induction; all segment
membership, `ψ`
continuity, local-norm continuity/positivity, Riccati comparison, derivative
inequality, coefficient scaling, final sandwich assembly, first Newton/Dikin
membership, and inverse-Hessian transport wrappers are now compiled.  Do not
return to ASGD or generic process-prompt edits unless the user explicitly
switches lanes.

Latest Proposition 13.11 update: the product-separable supplied-oracle barrier
rule is now compiled as `chewi1311_product_selfConcordantBarrierOn`, with the
general method `SelfConcordantBarrierOn.product` and the supporting
`MixedThirdSelfConcordantOn.product` theorem.  The formalization uses the L2
product carrier `WithLp 2 (E₁ × E₂)` from
`Mathlib.Analysis.InnerProductSpace.ProdL2`; this is the cached search result
for future product work.  The next barrier-calculus targets should build on
this packet instead of reconstructing product local-norm algebra.

The shared-domain sum case has also advanced through its reusable algebraic
core.  Use `MixedThirdSelfConcordantOn.sum` for the exact summed Hessian
self-concordance proof and
`chewi1311_sum_selfConcordantBarrierOn_of_gradient_bound` for the current
source-facing supplied-oracle wrapper.  The helper
`barrierSumGradient_bound_of_quadratic_le` converts a quadratic bound for the
summed inverse-Hessian oracle into the Definition 13.9 dual local-norm bound.
The remaining proof debt for the fully unsupplied Proposition 13.11(1) rule is
to prove that quadratic comparison for the canonical inverse of the summed
Hessian; until then, do not duplicate the now-compiled sum local-norm or
mixed-third algebra.
The new component-Cauchy wrapper
`chewi1311_sum_selfConcordantBarrierOn_of_component_cauchy` further reduces
the sum-rule gradient-bound gate: it combines the component barrier gradient
bounds, component Cauchy bridges, a two-term real Cauchy-Schwarz helper, and
the summed inverse-local identity to produce the Definition 13.9 bound for
`barrierSumGrad`.
The follow-on adjoint-coordinate Cauchy wrapper
`chewi1311_sum_selfConcordantBarrierOn_of_adjointCoord_cauchy` now discharges
the component Cauchy bridges from explicit adjoint square-root coordinate
models, reusing `dualPrimalCauchy_of_adjointCoordSqrt`.  Thus the remaining
exact sum-rule proof debt is the canonical summed inverse-Hessian /
inverse-local identity for `barrierSumHess`, not another Cauchy proof.
The next wrapper
`chewi1311_sum_selfConcordantBarrierOn_of_adjointCoord_right_inverse` derives
that inverse-local identity from a right-inverse identity for `barrierSumHess`
and derives the component inverse quadratic factors from component Hessian
right-inverses plus the same square-root coordinate models.  The unsupplied
sum rule is now reduced to proving the model-specific canonical summed
inverse-Hessian oracle is a right inverse of the summed Hessian.
The stronger square-root-equivalence wrapper
`chewi1311_sum_selfConcordantBarrierOn_of_adjointSqrtCoord` derives those
right-inverse hypotheses from explicit continuous-linear-equivalence
square-root models for the component and summed Hessians.  For future concrete
barriers, the expected endpoint is to provide `H = S†S` and
`H⁻¹ = S⁻¹(S⁻¹)†` for the summed Hessian, then invoke this wrapper directly.

The affine-preimage case has a compiled supplied-oracle spine and an
invertible-affine corollary.  Use `barrierAffinePreimageSet`,
`barrierAffinePreimageHess`, `barrierAffinePreimageGrad`,
`barrierAffinePreimageThirdMixed`, `barrierAffinePreimageLocalNorm_eq`,
`MixedThirdSelfConcordantOn.affinePreimage`,
`SelfConcordantBarrierOn.affinePreimage_of_gradient_bound`, and
`chewi1311_affinePreimage_selfConcordantBarrierOn_of_gradient_bound` for the
general supplied gate; use `barrierAffinePreimageInvHessEquiv` and
`chewi1311_affinePreimage_selfConcordantBarrierOn_equiv` when the affine
linear part is a continuous linear equivalence.  Search-first result: mathlib
adjoint transport is enough here via `ContinuousLinearMap.adjoint_inner_left`,
`ContinuousLinearMap.adjoint_inner_right`,
`ContinuousLinearMap.adjoint_comp`, and
`ContinuousLinearEquiv.coe_comp_coe_symm`.  The fully source-shaped
non-invertible statement still needs a careful range/surjective or
pseudoinverse interface; do not silently replace Chewi's `dom f ⊆ range 𝒜`
assumption with injectivity.

The inf-projection case now has a compiled supplied-projected-oracle spine:
`barrierInfProjectionSet`, `barrierInfProjectionPoint`,
`SelfConcordantBarrierOn.infProjection_of_projected_oracles`, and
`chewi1311_infProjection_selfConcordantBarrierOn_of_projected_oracles`.
This opens Proposition 13.11(4) without hiding the hard part.  The remaining
formalization task is to prove the Schur-complement/envelope certificate that
turns a product-domain barrier and minimizer first-order conditions into the
projected Hessian, inverse-Hessian, gradient, and mixed-third oracles.
The supporting Schur layer now includes WithLp product coordinate CLMs,
Hessian block extractors, and `barrierInfProjectionSchurHess` for the standard
`Hxx - Hxy Hyy⁻¹ Hyx` projected Hessian formula.
The projected-envelope interface also fixes the standard envelope gradient and
selector first-order condition through `barrierInfProjectionGrad`,
`barrierInfProjectionVerticalGrad`, `BarrierInfProjectionSelectorStationary`,
`barrierInfProjectionSchurHessFrom`, and
`chewi1311_infProjection_selfConcordantBarrierOn_of_schur_oracles`.
The literal-infimum layer now names Chewi's actual value
`x ↦ inf_y f(x, y)` via `barrierInfProjectionFiberValues` and
`barrierInfProjectionInfValue`, packages selector attainment as
`BarrierInfProjectionSelectorMinimizes`, and proves
`BarrierInfProjectionSelectorMinimizes.value_eq_infValue`,
`BarrierInfProjectionSelectorMinimizes.of_vertical_firstOrder_zero`,
`BarrierInfProjectionSelectorStationary.infValue_hasGradientAt`, and
`BarrierInfProjectionThirdOrderEnvelopeOn.infValue_hasGradientAt`.  Reuse this
bridge when stating source-facing item-4 envelope theorems; do not treat the
selected value `barrierInfProjectionValue` as the literal infimum unless the
selector-minimizes certificate has been supplied.  Search-first reuse:
mathlib's `IsLeast.csInf_eq` proves the fiber `sInf` equality, and
`HasGradientAt.congr_of_eventuallyEq` transfers the selected-envelope
gradient; the vertical-minimizer constructor reuses
`FirstOrderStrongConvexOn.lower_model`.
The localized literal-infimum layer now also compiles with
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
This is the preferred source-facing item-4 route: local vertical lower-model
data on the projected domain, plus selector stationarity and open-domain
membership, is enough to transfer the selected-envelope theorem to the literal
infimum.  Do not require global vertical-fiber minimization unless a later
concrete source model actually supplies it.
The literal third-order package now compiles as
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn`, with constructor
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`.
It bundles the projected barrier oracle, literal-infimum gradient theorem,
projected-gradient Schur-Hessian derivative, and lifted-third derivative
certificate.  This is the intended source-facing target for item 13.11(4)
while the formalization remains in supplied-oracle form.
The literal package now also has source-facing local-norm consumers:
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius_of_hessianPositive`
and
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius`.
These turn the package plus strict projected-Hessian positivity into the
Chewi Lemma 13.6-style projected source-radius local-norm sandwich, including
the zero-displacement case.  For future Proposition 13.11(4) source instances,
the live work is the concrete package/positivity construction rather than
another Schur-derivative or local-norm transport wrapper.
The adjoint-square-root consumer
`BarrierInfProjectionLiteralThirdOrderEnvelopeOn.projected_localNorm_sandwich_sourceRadius_of_adjointSqrtModel`
now removes the separate positivity obligation whenever the source instance
has the packaged square-root envelope model.  The preferred exact item-4 route
is package construction plus the concrete square-root/envelope model, with
projected positivity discharged by this wrapper.
The source one-call theorem
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivative_isOpen_of_verticalFirstOrder`
now builds the literal package and obtains the projected local-norm sandwich
from the source vertical first-order and full-Hessian derivative hypotheses.
Use it as the first consumer when proving a concrete Proposition 13.11(4)
instance.
When the source proof already has the Schur derivative certificate, prefer the
shorter Schur-certificate route:
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_schurHessDerivativeOn_isOpen_of_verticalFirstOrder`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_schurHessDerivativeOn_isOpen_of_verticalFirstOrder`.
These wrappers build the literal `inf_y` package and local-norm sandwich from
the Schur certificate plus vertical first-order/open-domain gradient data,
without requiring the caller to supply or rederive the full-Hessian derivative
package.
The full-Hessian derivative source side is now represented by
`BarrierInfProjectionFullHessianDerivativeOn`, which bundles Frechet
differentiability of the product-space Hessian along the selected graph with
the scalar mixed-third pairing identity.  Its consumers
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_fullHessianDerivativeOn_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_sourceFullHessianDerivative_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_fullHessianDerivativeOn_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_fullHessianDerivativeOn_isOpen_of_verticalFirstOrder`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_fullHessianDerivativeOn_isOpen_of_verticalFirstOrder`
are the preferred route for concrete item-4 source models that naturally prove
the original Hessian derivative before the projected Schur derivative.
When that derivative is available on the original barrier domain `s`, use
`BarrierInfProjectionFullHessianDerivativeOn.of_source`: selector stationarity
proves the selected graph point belongs to `s`.  The source-domain endpoint
wrappers
`BarrierInfProjectionAdjointSqrtEnvelopeModel.schurHessDerivativeOn_of_sourceFullHessianDerivative_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_sourceFullHessianDerivative_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.thirdOrderEnvelopeOn_of_sourceFirstSecondFullHessianDerivative_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_sourceFullHessianDerivative_isOpen_of_verticalFirstOrder`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullHessianDerivative_isOpen_of_verticalFirstOrder`
avoid manually restating the selected-graph Hessian derivative certificate.
Use the non-literal wrappers when the reusable `BarrierInfProjectionThirdOrderEnvelopeOn`
certificate is needed before the literal vertical-minimizer package.
The theorem-facing source-square-root wrappers
`chewi1311_infProjection_thirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondFullHessianDerivative`,
`chewi1311_infProjection_literalThirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondFullHessianDerivative`
and
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondFullHessianDerivative`
now assemble the source full-square-root model, source-domain first/second/full
derivative data, and projected-domain vertical `Hyy` model into the literal
inf-projection package or projected source-radius local-norm sandwich.  The
non-literal third-order wrapper is the preferred branch point when the concrete
source proof needs `BarrierInfProjectionThirdOrderEnvelopeOn` before adding
literal vertical-minimizer hypotheses.
If that reusable certificate is already available, route it to the local-norm
sandwich with
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtThirdOrderEnvelope`
rather than replaying the derivative hypotheses.
The direct transport wrapper
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtSecondFullHessianDerivative_direct`
is the shortest theorem-facing route when the next consumer only needs the
projected local-norm sandwich and not the literal selected-value envelope.
The companion Schur-certificate wrapper
`chewi1311_infProjection_schurHessDerivativeOn_of_sourceFullSqrtSecondFullHessianDerivative`
exposes the intermediate `BarrierInfProjectionSchurHessDerivativeOn`
certificate from source full-square-root, source `grad`/`hess` derivative,
mixed-third, selector-derivative, and vertical inverse-derivative hypotheses.
Use this wrapper when the source instance needs to branch into multiple
consumers from the same Schur derivative certificate.
For those branches, use
`chewi1311_infProjection_thirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
to obtain the reusable selected-value envelope and
`chewi1311_infProjection_literalThirdOrderEnvelopeOn_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
to obtain the literal infimum package from the same Schur certificate.
Use
`chewi1311_infProjection_literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondSchurHessDerivativeOn`
when the exact theorem also needs the literal source-radius local-norm
conclusion from that Schur-certificate branch.
When the Schur certificate is already present and the target is local-norm
transport, use
`chewi1311_infProjection_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtSchurHessDerivativeOn`.
If the source model also proves first- and second-order differentiability on
`s`, use
`BarrierInfProjectionSelectorStationary.hasGradientAt_of_source`,
`BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_of_source`, or the
one-call source endpoints
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literalThirdOrderEnvelopeOn_of_sourceFirstSecondFullHessianDerivative_isOpen_of_verticalFirstOrder`
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.literal_projected_localNorm_sandwich_sourceRadius_of_sourceFirstSecondFullHessianDerivative_isOpen_of_verticalFirstOrder`.
The theorem-facing sourceFullSqrt version of the latter is
`chewi1311_infProjection_literal_projected_localNorm_sandwich_sourceRadius_of_sourceFullSqrtFirstSecondFullHessianDerivative`.
These are the shortest verified routes from original-domain derivative data to
the literal envelope package and Chewi source-radius local-norm sandwich.
For local-norm transport without selected-value envelope data, use
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_sourceSecondFullHessianDerivative_isOpen_direct`.
For the theorem-facing selected-value envelope route, use
`BarrierInfProjectionAdjointSqrtEnvelopeModel.projected_localNorm_sandwich_sourceRadius_of_sourceFirstSecondFullHessianDerivative_isOpen_envelope`.
The current second-order envelope layer also derives the Schur projected
gradient derivative from local vertical stationarity: reuse
`barrierInfProjectionGrad_hasFDerivAt_schur_of_vertical_eventuallyEq` after
proving that the vertical residual is locally zero and providing the relevant
`Hyy` left inverse.  The remaining exact inf-projection calculus work is no
longer the selector derivative equation.  The preferred next gate is now the
scalar segment form of the actual third-derivative identity,
`d/dt <v, H_schur(z_t) v> = liftedThird(z_t, y - x, v)`.
The adjoint-square-root model now exposes
`BarrierInfProjectionAdjointSqrtEnvelopeModel.of_sourceFullSqrt`,
`chewi1311_infProjection_selfConcordantBarrierOn_of_sourceFullSqrt`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.secondOrderEnvelopeAt_of_sourceFirstSecond_isOpen`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.hyy_right_inverse`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.hyy_left_inverse`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.full_right_inverse`,
`BarrierInfProjectionAdjointSqrtEnvelopeModel.grad_hasFDerivAt_schur_of_isOpen`,
and
`BarrierInfProjectionAdjointSqrtEnvelopeModel.secondOrderEnvelopeAt_of_isOpen`.
Use these when constructing concrete Proposition 13.11(4) instances; full-space
`sqrtFull` equalities can now be stated once on `s`, lifted to selected graph
points, and consumed directly for the inf-projection
`SelfConcordantBarrierOn` theorem; source first/second differentiability data
can likewise be stated once on `s` and consumed for the selected second-order
envelope.  Do not rebuild selected-graph full-Hessian square-root equalities,
source derivative restrictions, `Hyy` inverse identities, or selected
second-order envelopes by hand.
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_scalarPsi`
and
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_scalarPsi`
feed that source-shaped derivative directly into the Lemma 13.6 local-norm
sandwich without first proving a full operator-valued Frechet derivative for
the Schur Hessian.  Prefer the continuity-on-domain variants
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex_scalarPsi_continuousOn`
and
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_scalarPsi_continuousOn`
when `ContinuousOn H_schur` is available, since they discharge all per-vector
segment continuity obligations automatically.  The newest vector-path
derivative bridge also provides
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_hessApplyDeriv`,
so the next exact proof can work at the applied-Hessian level:
differentiate `t ↦ H_schur(z_t) v`, prove the pairing with `v` is the lifted
third derivative, and let the generic `ψ` derivative bridge finish the scalar
calculus.  The generic extraction
`hessianSegmentHessApply_hasDerivWithinAt_of_hasFDerivAt` also lets any future
full Frechet Schur-Hessian derivative route produce the same applied-vector
gate directly.  The Schur-certificate bridge now packages this for
`BarrierInfProjectionSchurHessDerivativeOn` itself through
`BarrierInfProjectionSchurHessDerivativeOn.hessApply_hasDerivWithinAt` and
`BarrierInfProjectionSchurHessDerivativeOn.hessApply_mixed_inner_eq`, and the
scalar-display theorem
`BarrierInfProjectionSchurHessDerivativeOn.hessianSegmentPsi_hasDerivWithinAt_liftedThird`
names the source derivative identity directly; the consumer
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv_apply`
then removes the older strict positivity and nonzero-displacement side
conditions from the full-Schur-derivative source-radius route.  The remaining
exact envelope task is to construct such a Schur derivative certificate from
concrete selector and Hessian square-root/envelope models.
The Schur block-calculus layer now supplies that certificate from concrete
derivative data: use `barrierInfProjectionBlockXXCLM`,
`barrierInfProjectionBlockXYCLM`, `barrierInfProjectionBlockYXCLM`,
`barrierInfProjectionBlockYYCLM`, the matching
`barrierInfProjectionBlock*_hasFDerivAt` lemmas,
`barrierInfProjectionSchurHessDeriv`,
`barrierInfProjectionSchurHess_hasFDerivAt`, and especially
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative`.  The
calculus is now reduced to full product-Hessian differentiability along the
selected graph, selector differentiability, `invHyy` differentiability, and
the scalar mixed-third pairing identity.  Do not rebuild block extraction or
the Schur product rule in future inf-projection packets.
The scalar mixed-third pairing now has a component interface:
`barrierInfProjectionSchurHessDeriv_inner_eq_of_component_pairing` and
`BarrierInfProjectionSchurHessDerivativeOn.of_fullHessianDerivative_componentPairing`.
Use it to reduce the exact source proof to cross-block pairing, the
differentiated inverse identity for `Hyy⁻¹`, and the four-term full-Hessian
third-derivative expansion on Schur lifts.
The local stationarity source bridge now also compiles through
`BarrierInfProjectionSelectorStationary.verticalGrad_eventually_eq_zero`,
`BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_schur_of_mem_nhds`,
and `BarrierInfProjectionSelectorStationary.grad_hasFDerivAt_schur_of_isOpen`,
so future envelope layers should discharge local vertical stationarity from
the selector certificate plus neighborhood/open projected-domain hypotheses
instead of exposing raw `EventuallyEq` assumptions.
The selected-value second-order envelope is now packaged in
`BarrierInfProjectionSecondOrderEnvelopeAt` and source constructors
`BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_mem_nhds`,
`BarrierInfProjectionSelectorStationary.secondOrderEnvelopeAt_of_isOpen`, and
their finite-dimensional `Hyy` right-inverse variants.  This is the reusable
entry point for proving the actual third derivative of the selected value:
start from this certificate rather than recombining the first- and
second-order envelope identities.
The actual-third route is further narrowed by
`BarrierInfProjectionSchurHessDerivativeOn` and the projected Hessian-segment
bridges
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate`
/
`BarrierInfProjectionSelectorStationary.projectedHessianSegmentMixedThirdLocalNormCertificate_of_convex`.
The latest strengthening also derives Schur-Hessian continuity from the
certificate via `BarrierInfProjectionSchurHessDerivativeOn.continuousOn` and
adds
`BarrierInfProjectionSelectorStationary.projected_localNorm_sandwich_sourceRadius_of_schurDeriv`.
Thus the remaining analytic work is the Schur Hessian derivative identity; the
generic mixed-third segment machinery and projected local-norm sandwich are now
reused after that identity is supplied.

As of the current ASGD source-variance packet, route new characteristic-
function work through the normalized Taylor product no-factor-bound wrappers
in `StatInference/Optimization/ASGD.lean`.  The older right-product path with a
separate `‖1 + error‖ ≤ 1` assumption is retained only for compatibility.
Prefer the newest `_of_uniform_bound_no_factor_bound` ASGD wrappers: they also
hide the variance-error row integrability behind the bounded-source package,
so the live theorem route can focus on the actual future-tail proxy/residual
conditions.
For deterministic tail-core approximations, use the corresponding
`deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound` wrappers
so callers do not need to pass a normalized-product limit separately.  Its
Chewi 12.3 endpoint wrapper is
`asgd_limit_package_of_deterministic_futureTail_l1_approx_of_uniform_bound_no_factor_bound`.
For source construction of a deterministic tail-core approximation, first use
the new deterministic suffix-proxy bridge:
`projectedMixedTowerFutureTail_deterministicTailProxy_l1_sum_tendsto_zero_of_weighted_factor_error`.
It reduces row-summed future-tail `L1` approximation to a weighted one-step
factor error against unit-ball deterministic complex factors, reusing the
existing finite product and triangular suffix-sum APIs.
For the canonical Gaussian factor choice, use
`chewi127LimitVarianceProxyFactor` and
`projectedLimitVarianceFutureTailProxy`; the endpoint
`asgd_limit_package_of_limitVarianceProxy_weighted_factor_error_of_uniform_bound_no_factor_bound`
reduces the Chewi 12.3 ASGD package to the weighted one-step error against
that limit-variance proxy.
The split endpoint
`asgd_limit_package_of_limitVarianceProxy_inverse_error_compensated_error_of_uniform_bound_no_factor_bound`
further reduces that weighted one-step error to inverse-compensation proxy
error plus compensated Taylor-error control.
The scalar proxy reduction endpoint
`asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_compensated_error_of_uniform_bound_no_factor_bound`
further reduces inverse-compensation proxy error to the weighted row
convergence of `projectedInverseLimitVarianceProxyScaledDiffExp`, using the
compiled exponential comparison
`projectedInverseCompensationFactor_limitVarianceProxy_norm_le_scaled_variance_diff_exp`.
The next source-discharge step is therefore a scalar conditional-variance
difference estimate, not more complex product algebra.
The integrability side of that scalar proxy row is now discharged by
`projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integrable_of_uniform_bound`,
and the endpoint
`asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_compensated_error_of_uniform_bound_no_factor_bound_no_scaled_integrability`
uses it directly.  The convergence side remains a genuine row-wise condition;
when working from only Chewi's averaged covariance assumption, prefer the
compensated full-inverse/product route rather than an unjustified absolute
one-step proxy comparison.
The scalar-proxy endpoint
`asgd_limit_package_of_limitVarianceProxy_scaled_variance_diff_exp_weighted_variance_remainder_of_uniform_bound_no_factor_bound`
also reuses the weighted compensated-error theorem from the variance-error and
Taylor-remainder rows, so that route no longer exposes a separate compensated
Taylor weighted-error assumption.
The stronger absolute-row closure of this lane is now compiled too:
`projectedInverseLimitVarianceProxyScaledDiffExp_le_const_mul_inv_mul_abs_variance_diff`,
`projectedInverseLimitVarianceProxyScaledDiffExp_weighted_row_integral_tendsto_zero_of_weighted_abs_variance_diff`,
and
`asgd_limit_package_of_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
Use it only when the source layer provides an explicit weighted `L1` absolute
variance-difference estimate.  It is not a replacement for the compensated
full-inverse/product route under Chewi's plain averaged covariance convergence.
The residual layer now exposes
`projectedMixedTowerFutureTail_l1_residual_sum_tendsto_zero_of_predictable_l1_approx`,
`projectedMixedTowerFutureTail_l1_residual_sum_tendsto_zero_of_deterministic_l1_approx`,
and
`projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_futureTail_l1_residual_sum`,
so proxy approximations can be promoted directly into the preferred residual
routes.
For direct asymptotic predictability estimates, use
`futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound`; it packages the
future-tail residual into the ASGD certificate route without a proxy.  Its
Chewi 12.3 endpoint wrapper is
`asgd_limit_package_of_futureTail_l1_residual_sum_of_uniform_bound_no_factor_bound`.
For the shortest preferred ASGD martingale route, use
`futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound`; it
packages row-summed `L1` predictability of the mixed-tower future multiplier
directly into the charFun/CLT/bridge/certificate stack.  Its Chewi 12.3
endpoint wrapper is
`asgd_limit_package_of_futureMultiplier_l1_residual_sum_of_uniform_bound_no_factor_bound`.
The preferred route now also has direct proxy interfaces:
`projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_predictable_l1_approx`,
`projectedMixedTowerFutureMultiplier_l1_residual_sum_tendsto_zero_of_deterministic_l1_approx`,
`asgd_limit_package_of_futureMultiplier_predictable_l1_approx_of_uniform_bound_no_factor_bound`,
and
`asgd_limit_package_of_futureMultiplier_deterministic_l1_approx_of_uniform_bound_no_factor_bound`.
Use these when a source argument naturally freezes or predicts the mixed-tower
future multiplier before estimating the raw conditional residual.
The canonical concrete proxy for this route is now also compiled:
`projectedLimitVarianceFutureMultiplierProxy`, together with
`projectedLimitVarianceFutureMultiplierProxy_aestronglyMeasurable`,
`projectedLimitVarianceFutureMultiplierProxy_integrable`,
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_weighted_factor_error`,
and
`asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_factor_error_of_uniform_bound_no_factor_bound`.
It is the raw prefix multiplied by the deterministic limit-variance future
tail proxy.  The concrete proxy route now also consumes the inverse-error,
scalar variance-difference exponential, weighted variance-remainder, and
explicit weighted absolute variance-difference lanes through
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_inverse_error_compensated_error`,
`projectedMixedTowerFutureMultiplier_limitVarianceProxy_l1_sum_tendsto_zero_of_scaled_variance_diff_exp_weighted_variance_remainder`,
and
`asgd_limit_package_of_limitVarianceFutureMultiplierProxy_weighted_abs_variance_diff_weighted_variance_remainder_of_uniform_bound_no_factor_bound`.
The next blueprint target is therefore not more endpoint packaging; it is a
source proof of the remaining row-summed future-multiplier residual/proxy
condition under Chewi's actual averaged covariance assumptions.
For the stronger weighted suffix route, use
`inverseFutureTail_weighted_variance_remainder_of_uniform_bound_no_factor_bound`;
it packages weighted variance-error/Taylor-remainder convergence and the
inverse-tail residual into the same charFun/CLT/bridge/certificate stack.

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
the current frontier contract near the top of
`docs/optimization2026_current_blocker_primitive_plan.md` carries the live
replacement prompt for manual runs.  Archived long prompts in that file are
historical route context, not the current target selector.

Manual goal execution now follows a theorem-packet protocol.  Use the isolated
Optimization worktree for broad packets, search cached mathlib/local results
before inventing primitives, keep the main thread on the active proof while
scouts handle disjoint read-only questions when explicitly authorized, verify
with focused Lean/module builds during development, and batch route-doc
updates, scans, final rebase, commit, and push once per verified packet.  The
current active sequence after the ASGD scalar projection data packet is to
discharge the actual future-multiplier, future-tail, or inverse-tail residual
estimates for the one-dimensional bounded martingale CLT, assemble the source
ASGD endpoint, then move to the concrete Sinkhorn KL identity layer if ASGD
stalls.

Historical manual frontier after focused Lean verification of Chapter 7
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

Current manual goal frontier after the Chapter 12 finite sampled rate packet,
smooth integral-L2 sampled-model endpoint packet, smooth Bochner-unbiased
growth/star-upper packet, non-smooth source-L2 sampled endpoint packet, smooth
source variance-bound bridge for Chewi Theorem 12.1 SMPGD, the non-smooth
relative-subgradient growth/star-upper bridge, the final smooth/non-smooth
weighted stochastic averaged-iterate wrappers, and the exact source-displayed
stochastic-error RHS bridges plus full source-displayed smooth/non-smooth
averaged-iterate wrappers, filtration-level conditional-mean wrappers, and the
first ASGD quadratic-decomposition algebra packet:
Theorem 8.5/8.6 PGD/APGD and the Chapter 9 Fenchel/Bregman substrate are now
stable dependencies, not active routing targets.
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
`chewi1013_regret_bound_of_trajectory_norm_bound_stepsize`.  The newest
infimum closure adds `chewi1013_regret_bound_inf_of_forall_comparator` and
`chewi1013_regret_bound_inf_of_trajectory_norm_bound_stepsize`, reusing
Mathlib `le_csInf` to produce Chewi's displayed `inf_{y in C}` online-regret
bound from the fixed-comparator theorem.  The newest
Chapter 11 ABP packet compiles `IsBregmanProjectionStep`,
`IsAlternatingBregmanProjectionTrajectory`, trajectory membership accessors,
the two monotonicity halves, the combined monotonicity wrapper,
`alternatingBregmanProjection_cycle_decrease`,
`chewi112_finite_sum_with_terminal_le`, `chewi112_finite_sum_le`, and
`chewi113_exists_small_abp_cycle_gap`.
Search-first result: mathlib has no direct Bregman/mirror-descent/MPGD theorem
in the pinned tree; the relevant reuse is local `Bregman.lean`,
`Proximal.lean`, Chapter 3 geometric-weight/Gronwall APIs,
`ProjectedSubgradient.lean` finite-average/Jensen APIs,
`LipschitzOnWith.le_add_mul`, `abs_real_inner_le_norm`, and
`FirstOrderStrongConvexOn.lower_model`; Chapter 11 ABP reuses
`bregmanDivergence` and `sum_range_sub_succ`, with no direct mathlib/local ABP
theorem found.  `AlternatingMinimization.lean` now compiles the scalar
Theorem 11.4 post-threshold inverse-gap/telescope layer and source
recurrence/half-threshold bridge: `sum_range_succ_sub`,
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
`IsChewi114AMSourceCertificate`, its max-recurrence, halving, geometric
burn-in, threshold, tail-rate, and epsilon consumers,
`chewi114_source_recurrence_of_descent_energy`,
`IsChewi114AMDescentCertificate`,
`IsChewi114AMDescentCertificate.sourceCertificate`,
`IsChewi114AMDescentCertificate.max_recurrence`,
`IsChewi114AMDescentCertificate.gap_le_source_K_div_iterations_of_tail_half`,
`IsChewi114AMDescentCertificate.gap_le_eps_of_tail_half`,
below-threshold quadratic recurrence theorems, threshold-tail `K/M`/epsilon
theorems, and initial-threshold propagation/rate theorems for both source and
descent certificates.  The newest local layer imports
`StatInference.Optimization.Theorem54` and reuses
`chewi54_half_pow_mul_le_eps_of_log_ratio_le` to compile
`chewi114_half_pow_mul_gap_le_threshold_of_log`,
`IsChewi114AMSourceCertificate.exists_threshold_index_of_geometric_burnin`,
`IsChewi114AMSourceCertificate.exists_tail_gap_le_eps_of_geometric_burnin`,
`IsChewi114AMSourceCertificate.exists_threshold_index_of_log_burnin`,
`IsChewi114AMSourceCertificate.exists_tail_gap_le_eps_of_log_burnin`,
`IsChewi114AMDescentCertificate.exists_threshold_index_of_geometric_burnin`,
`IsChewi114AMDescentCertificate.exists_tail_gap_le_eps_of_geometric_burnin`,
`IsChewi114AMDescentCertificate.exists_threshold_index_of_log_burnin`, and
`IsChewi114AMDescentCertificate.exists_tail_gap_le_eps_of_log_burnin`.
Chapter 11.4 is now stable substrate rather than the active target.  The
active route is to finish Theorem 11.5 RAM as a theorem-sized packet: discharge
the selected Hopf-Lax/Moreau model value from Chewi's source candidate and the
remaining interpolant admissibility/radius side conditions needed by the
compiled block-model plus selected-interpolant certificate assemblers, and then
move immediately to Sinkhorn Theorems 11.7/11.8 from ABP/mirror-descent supplied
interfaces and Chapter 12 SMPGD before the ASGD CLT.  Generalize 10.11/10.13
to a custom arbitrary norm/dual-norm interface or add an exact `sInf` wrapper
only when source-report packaging or a later theorem demands it.  In parallel,
continue Chapter 13 from the new `InteriorPoint.lean` one-dimensional
self-concordance substrate: it already formalizes Chewi Example 13.4 for
`x ↦ -log x` on `ℝ_{>0}` via the displayed first/second/third derivatives,
local norm identity, and parameter-`1` self-concordance inequality.  It now
also contains the vector supplied-Hessian local norm, dual local norm, Dikin
ellipsoid, Newton step/decrement, generic `SelfConcordantOn`, and zero-third
derivative certificate proving that positive-semidefinite quadratic models are
self-concordant.  The newest Chapter 13 packet adds the Lemma 13.6
local-norm comparison algebra from supplied Hessian quadratic-form bounds:
`HessianQuadraticBounds`,
`localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticUpper`,
`sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticLower`,
`localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticBounds`,
`sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticBounds`,
`localNorm_le_div_one_sub_of_hessianQuadraticUpper`, and
`mul_one_sub_localNorm_le_of_hessianQuadraticLower`.  The follow-up packet
adds the segment exponential-envelope bridge for the `ψ(t)` proof:
`scalar_le_exp_of_abs_deriv_le`, `chewi136HessianStabilityExponent`,
`chewi136_exp_stability_upper`, `chewi136_exp_stability_lower`,
`HessianSegmentExponentialBounds`,
`HessianSegmentExponentialBounds.toHessianQuadraticBounds`,
`localNorm_le_div_one_sub_of_hessianSegmentExponentialBounds`,
`mul_one_sub_localNorm_le_of_hessianSegmentExponentialBounds`, and
`localNorm_sandwich_of_hessianSegmentExponentialBounds`.  Search-first
result: mathlib supplies constant-coefficient continuous Gronwall
(`Analysis/ODE/Gronwall`, `gronwallBound`,
`norm_le_gronwallBound_of_norm_deriv_right_le`) and the required
square-root/log/exponential algebra (`sq_le_sq₀`, `Real.sq_sqrt`,
`Real.sqrt_sq`, `Real.exp_log`, `Real.exp_neg`) plus operator/matrix
positivity APIs, but no Chewi self-concordance Hessian-stability theorem.  The
newest scalar analytic packet adds the variable-antiderivative Gronwall
wrappers `scalar_le_exp_antideriv_of_abs_deriv_le`,
`scalar_exp_neg_antideriv_le_of_abs_deriv_le`, and
`scalar_exp_sandwich_of_abs_deriv_le_antideriv`, plus
`chewi136HessianStabilityPrimitive`,
`chewi136HessianStabilityPrimitive_zero`,
`chewi136HessianStabilityPrimitive_one`, and
`chewi136HessianStabilityPrimitive_hasDerivAt`, proving the calculus for the
displayed coefficient `2 M r / (1 - M r t)`.  The next Chapter 13 packet
adds the interval/psi bridge
`scalar_le_exp_antideriv_of_abs_deriv_le_on_Icc`,
`scalar_exp_neg_antideriv_le_of_abs_deriv_le_on_Icc`,
`scalar_exp_sandwich_of_abs_deriv_le_antideriv_on_Icc`,
`chewi136HessianStabilityPrimitive_continuousOn_Icc`,
`chewi136HessianStabilityPrimitive_hasDerivWithinAt_Icc`,
`HessianSegmentPsiCertificate`, and
`HessianSegmentPsiCertificate.toHessianSegmentExponentialBounds`, proving that
the per-vector `ψ(t)` continuity, derivative, endpoint, and derivative-bound
certificate implies `HessianSegmentExponentialBounds`.  The concrete segment
packet adds `hessianSegmentPoint`, `hessianSegmentPoint_zero`,
`hessianSegmentPoint_one`, `hessianSegmentPsi`, `hessianSegmentPsi_zero`,
`hessianSegmentPsi_one`, `HessianSegmentConcretePsiCertificate`,
`HessianSegmentConcretePsiCertificate.toHessianSegmentPsiCertificate`,
`HessianSegmentConcretePsiCertificate.toHessianSegmentExponentialBounds`, and
`localNorm_sandwich_of_hessianSegmentConcretePsiCertificate`, giving a direct
route from Chewi's actual `z_t`/`ψ_v(t)` certificate to the local-norm
sandwich.  The newest mixed-third packet adds
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
the mixed-third exponential-bound bridges, and the mixed-third local-norm
sandwich consumers, including the convex/source wrapper
`localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius`
and the named source theorem `chewi136_localNorm_sandwich_sourceRadius`.
The newest Newton packet adds
`localNorm_newtonStep_sub_eq_newtonDecrement_of_inner`,
`newtonStep_mem_dikinEllipsoid_of_newtonDecrement_lt`,
`newtonStep_mem_dikinEllipsoid_of_inner_of_newtonDecrement_lt`,
`newtonStep_mem_dikinEllipsoid_inv_of_mul_newtonDecrement_lt`,
`newtonStep_mem_dikinEllipsoid_inv_of_inner_of_mul_newtonDecrement_lt`, and
`chewi136_newtonStep_localNorm_sandwich_sourceRadius`.
The newest dual packet adds `InverseHessianQuadraticBounds`,
`dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticUpper`,
`sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticLower`,
`dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticBounds`,
`sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticBounds`,
`dualLocalNorm_le_div_one_sub_of_inverseHessianQuadraticUpper`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper`.
The newest assembly packet adds
`dualLocalNorm_le_mul_localNorm_of_quadratic_bound`,
`chewi138_gradientResidual_dualLocalNorm_le_of_quadratic_bound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_residualQuadraticBound`.
The newest scalar Delta-coefficient packet adds
`chewi138DeltaCoefficientPrimitive`,
`chewi138DeltaCoefficientPrimitive_hasDerivAt`,
`chewi138_deltaCoefficient_integral_eq`, and
`chewi138_deltaCoefficient_integral_eq_mul`.
The newest integrated Delta-bound packet adds
`chewi138_deltaCoefficient_intervalIntegrable` and
`chewi138_integral_le_deltaCoefficient_mul`, turning a pointwise
coefficient-times-`B` residual bound on `[0,1]` into the closed coefficient
`(M * lambda / (1 - M * lambda)) * B`.  The newest Delta source packet adds
`hessianQuadraticUpper_of_localNorm_le_div`,
`hessianQuadraticUpper_of_localNorm_le_div_one_sub`,
`chewi138_hessianSegmentDelta_integral_le_of_hessianUpper`, and
`chewi138_hessianSegmentDelta_integral_le_of_localNormUpper`, converting
Lemma 13.6-style pointwise local-norm control along the segment into the
integrated scalar Hessian-difference bound in Theorem 13.8.  The newest
Delta-operator residual packet adds `HessianDeltaQuadraticBound`,
`dualLocalNorm_delta_le_of_hessianDeltaQuadraticBound`,
`chewi138_gradientResidual_dualLocalNorm_le_of_deltaQuadraticBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_deltaQuadraticBound`,
replacing the raw residual quadratic-form hypothesis by the source
decomposition `grad x+ = Delta (x+ - x)` plus a Delta operator quadratic
bound.  The newest gradient-residual FTC packet adds
`hessianSegmentGradient_hasDerivAt_of_hasFDerivAt`,
`hessianSegmentGradient_integral_eq_sub_of_hasFDerivAt`, and
`chewi138_gradientResidual_eq_deltaStep_of_integral_delta`, proving the source
identity `grad x+ = Delta (x+ - x)` from the segment gradient FTC, a supplied
Delta action formula, and Newton's linear equation.  The newest concrete
Delta-action packet adds `hessianSegmentDelta`,
`hessianSegmentHessian_intervalIntegrable_of_continuousOn`,
`hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn`,
`hessianSegmentDelta_apply`,
`chewi138_gradientResidual_eq_hessianSegmentDelta_step`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaQuadraticBound`,
using `ContinuousLinearMap.intervalIntegral_comp_comm` to commute application
through the operator-valued interval integral.  The newest concrete Delta
scalar/order packet adds
`hessianSegmentDelta_inner_eq_integral_sub_of_continuousOn`,
`hessianSegmentDelta_inner_le_of_localNormUpper`,
`hessianSegmentDelta_quadraticBound_of_localNormUpper_and_dualEnergy`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaEnergy`,
using `innerSL_apply_apply` and `intervalIntegral.integral_sub` to identify
`inner v (Delta v)` with the scalar integrated Hessian-difference estimate.
The newest normalized-operator packet adds
`hessianDeltaQuadraticBound_of_normalizedOperator`,
`hessianSegmentDelta_quadraticBound_of_normalizedOperator`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta`,
using `ContinuousLinearMap.le_opNorm` to formalize Chewi's
`||H(x)^(-1/2) Delta H(x)^(-1/2)||_op` route.  The newest normalized
squared-bound packet adds `continuousLinearMap_opNorm_le_of_norm_sq_le`,
`hessianDeltaQuadraticBound_of_normalizedSquaredBound`,
`hessianSegmentDelta_quadraticBound_of_normalizedSquaredBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSquaredConcreteDelta`,
so the next Chapter 13 packet can prove the concrete square-root factorization
and pointwise squared normalized Delta estimate directly.  The newest
normalized unit-bilinear packet adds
`continuousLinearMap_opNorm_le_of_unit_inner_le`,
`hessianDeltaQuadraticBound_of_normalizedUnitInnerBound`,
`hessianSegmentDelta_quadraticBound_of_normalizedUnitInnerBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedUnitInnerConcreteDelta`,
reusing mathlib's `ContinuousLinearMap.opNorm_le_of_re_inner_le` as an
alternate bridge from a unit bilinear Hessian-difference estimate to the same
Theorem 13.8 decrement wrapper.  The newest normalized symmetric-quadratic
packet adds `continuousLinearMap_opNorm_le_of_isSymmetric_abs_inner_le`,
`hessianDeltaQuadraticBound_of_normalizedSymmetricQuadraticBound`,
`hessianSegmentDelta_quadraticBound_of_normalizedSymmetricQuadraticBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSymmetricQuadraticConcreteDelta`,
reusing mathlib's `ContinuousLinearMap.norm_eq_iSup_rayleighQuotient` as the
self-adjoint Rayleigh bridge from source-style absolute quadratic-form
estimates to the same Theorem 13.8 decrement wrapper.  The newest concrete
Delta symmetry packet adds
`hessianSegmentHessian_intervalIntegral_isSymmetric_of_continuousOn` and
`hessianSegmentDelta_isSymmetric_of_continuousOn`, proving the unnormalized
integrated Hessian-difference operator is self-adjoint from pointwise Hessian
symmetry along the segment.  The newest normalized adjoint-conjugation packet
adds `continuousLinearMap_adjointConj_isSymmetric_of_isSymmetric`,
`hessianSegmentDelta_adjointConj_isSymmetric_of_continuousOn`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedAdjointConjSymmetricQuadraticConcreteDelta`,
reusing mathlib's `IsSelfAdjoint.adjoint_conj` so the source identity
`normalized = coord† Delta coord` discharges normalized self-adjointness.  The
newest coordinate-factorization packet adds
`hessianDeltaDualFactor_of_adjointCoord`,
`hessianPrimalFactor_of_adjointSqrt`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta`,
deriving the dual/primal square-root factors from coordinate identities and
mathlib's `ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right`.  The
newest local-norm-to-Rayleigh packet adds
`hessianQuadraticLower_of_mul_le_localNorm`,
`hessianQuadraticLower_of_mul_one_sub_localNorm_le`,
`chewi138_hessianSegmentDelta_integral_neg_le_of_hessianLower`,
`chewi138_hessianSegmentDelta_integral_neg_le_of_localNormLower`,
`hessianSegmentDelta_inner_neg_le_of_localNormLower`,
`hessianSegmentDelta_abs_inner_le_of_localNormSandwich`,
`adjointConj_inner_eq_delta_inner`,
`normalizedAdjointConj_absQuadBound_of_deltaAbsQuadBound`, and
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_localNormSandwich`,
so the source two-sided local-norm sandwich now supplies the normalized
absolute Rayleigh bound.  The newest Newton-segment sandwich packet adds
`localNorm_smul_of_nonneg`, `hessianSegmentPoint_sub_left`, and
`chewi138_newtonSegment_localNorm_sandwich_sourceRadius`, so the pointwise
`z_t` sandwich assumptions required by that wrapper are compiled from Lemma
13.6 source-radius.  The newest source-Newton-segment assembly packet adds
`chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the Rayleigh decrement route no longer asks callers to provide pointwise
local-norm sandwich hypotheses.  The newest dual-transport packet adds
`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div`,
`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div_one_sub`, and
`chewi138_newtonDecrement_step_le_of_dualLocalNormUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the route now asks for the Chewi source-shaped dual-local-norm comparison
instead of a raw inverse-Hessian quadratic upper comparison.  The newest
duality packet adds
`dualLocalNorm_le_div_of_localNorm_lower_and_inverseIdentity`,
`dualLocalNorm_le_div_one_sub_of_localNorm_lower_and_inverseIdentity`, and
`chewi138_newtonDecrement_step_le_of_primalLowerDualIdentity_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the dual comparison is now derived from Lemma 13.6 primal lower transport
once the concrete model supplies the Cauchy bridge and inverse-local identity.
The newest Cauchy packet adds `dualPrimalCauchy_of_adjointCoordSqrt` and
`chewi138_newtonDecrement_step_le_of_inverseLocal_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the Cauchy bridge is derived from the same square-root coordinate
factorization as the normalized Rayleigh line.  The newest right-inverse packet
adds `inverseHessianQuadratic_nonneg_of_hessian_right_inverse`,
`localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse`,
`inverseHessianQuadratic_nonneg_of_adjointCoordFactor`, and
`chewi138_newtonDecrement_step_le_of_hessianRightInverse_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the inverse-local identity is now derived from the concrete right-inverse
equation.  The newest right-inverse-at-`x` packet adds
`localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse` and
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment`,
so the Definition 13.7 Newton-decrement norm identity is also derived from a
concrete right-inverse equation.  The newest zero-step packet adds
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment_or_zero`,
so the source-facing 13.8 wrapper no longer needs a global nonzero-step
assumption.  The newest continuous-equivalence coordinate packet adds
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_continuousLinearEquivCoord_of_sourceNewtonSegment`,
so the inverse coordinate equations are derived from a single
`sqrtCoord : E ≃L[ℝ] E`.  The newest adjoint/square-root packet adds
`inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse`
and
`chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_adjointSqrtCoord_of_sourceNewtonSegment`,
so the inverse-Hessian dual factorization is derived from
`hess x = sqrtH†sqrtH`, the right-inverse identity at `x`, and the coordinate
equivalence.  After that, derive the right-inverse, square-root Hessian, and
Delta-normalization identities from concrete matrix/order hypotheses and
remove the remaining mixed-third supplied source interface through the real
third-derivative representation bridge to `MixedThirdSelfConcordantOn`.
The new `RandomizedAlternatingMinimization.lean` module is imported by
`StatInference.lean` and compiles the scalar expected-gap layer for Theorem
11.5: `chewi115StrongFactor`, `chewi115ZeroK`,
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
`IsChewi115RAMZeroHopfLaxCertificate.gap_le_eps_nonneg`.  Search-first reuse:
no local RAM theorem existed; the strong case reuses `scalarRecurrence_le_pow`,
while the zero-curvature case reuses the compiled Chapter 11.4 inverse-gap
telescope.  The nonnegative wrappers remove the earlier strict-positive
side-condition by a zero-hit induction.  The Hopf-Lax bridge layer packages
Chewi's conditional-expectation display and Exercise 9.3 bounds into the
compiled strong/weak RAM certificates without adding full probability
infrastructure.  The block-model conditional-upper layer adds
`chewi115_uniform_average_le_of_block_model`,
`chewi115_conditional_gap_upper_of_averaged_model`,
`chewi115_conditional_gap_upper_of_block_model`, and
`chewi115_conditional_upper_of_block_model_sequence`, so the finite uniform
block expectation and source convexity algebra now feed the certificate
`conditional_upper` field directly.  The Exercise 9.3 interpolation packet adds
`chewi93_hopf_lax_strong_gap_bound_of_interpolant`,
`chewi93_hopf_lax_zero_gap_bound_of_interpolant`,
`chewi115_strong_hopf_lax_bound_of_chewi93`, and
`chewi115_strong_hopf_lax_bound_of_interpolant`, proving the scalar
positive-curvature cancellation, zero-curvature optimized-interpolant algebra,
and source factor rewrite needed by Theorem 11.5.  The newest source
candidate packet adds `chewi93_selected_model_value_le_interpolant`,
`chewi115_strong_selected_model_value_le_interpolant`, and
`chewi115_zero_selected_model_value_le_interpolant`, turning Chewi's selected
Exercise 9.3 test point into the exact strong/zero `hmodel_interp` displays.
The newest source
certificate packet adds `chewi93_hopf_lax_zero_gap_bound_of_radius`,
`chewi115_zero_hopf_lax_bound_of_interpolant`,
`chewi115_strong_hopf_lax_certificate_of_interpolants`, and
`chewi115_zero_hopf_lax_certificate_of_interpolants`, so both strong and weak
`hopf_lax_bound` fields can be built directly from source interpolant bounds.
The newest block-selected assembly packet adds
`chewi115_strong_hopf_lax_certificate_of_block_model_interpolants` and
`chewi115_zero_hopf_lax_certificate_of_block_model_interpolants`, combining the
finite block-model conditional-upper theorem with selected interpolation
estimates into the exact RAM Hopf-Lax certificates.  The newest direct
source-candidate assembly packet adds
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
the selected marginal-error iterate for Theorem 11.7.  The newest
source-shaped selectors add
`chewi117_exists_sinkhorn_full_iterate_error_sum_le_of_abp` and
`chewi117_exists_sinkhorn_half_iterate_error_sum_le_of_abp`, choosing
respectively the column-correct full iterate `gamma^n` or row-correct half
iterate `gamma^(n+1/2)` and proving the displayed total marginal-error bound
from one finite marginal identity plus one Pinsker/KL lower bound.  The
current local focused Lean check adds `chewi118_last_gap_le_of_recurrence` and
`chewi118_last_gap_le_of_oneStep` in `MirrorDescent.lean`, so the active lane
has now promoted this last-iterate wrapper to
`IsChewi118SinkhornMirrorDescentCertificate`,
`IsChewi118SinkhornMirrorDescentCertificate.last_rowMarginalKL_le`, and
`chewi118_sinkhorn_last_rowMarginalKL_le_of_mirrorDescent` in
`AlternatingBregman.lean`.  The concrete finite Sinkhorn endpoint has now been
instantiated through the row/column normalization identities and zero-error
entropy recurrence.  The newest literal KL display packet adds
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations`,
`chewi118_finiteSinkhorn_exists_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations`,
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations_antitone`,
and
`chewi118_finiteSinkhorn_last_rowMarginal_finiteKL_le_of_concreteSinkhornNormalizations_succ_le`,
so the source-facing rate is available directly for
`finiteKL (rowMarginal gamma^N) mu` or a selected successor KL.  The active
remaining terminal-iterate layer is the source proof of monotone row-marginal
KL gaps for the concrete Sinkhorn trajectory, not RAM scalar recurrence, block
averaging, 11.7 selector algebra, or the 11.8 endpoint algebra.  The newest
monotonicity adapter also exposes
`chewi118_finiteSinkhorn_last_sinkhornRowObjective_le_of_concreteSinkhornNormalizations_succ_le`,
so an adjacent nonincrease proof for the displayed row objective is sufficient
for the concrete finite Sinkhorn rate wrapper.
Chapter 12 packet creates root-imported
`StatInference/Optimization/StochasticGradient.lean` and compiles
`weightedSumBound_of_gronwall_negative_forcing_with_error`,
`weightedAverageGap_le_of_gronwall_negative_forcing_with_error`, and
`chewi121_weightedAverageGap_le_of_oneStep`, proving the scalar
weighted-average consequence at the end of Chewi Theorem 12.1.  The newest
source-rate packet adds `chewi121_weightedAverageGap_le_of_source_oneStep`,
`chewi121_weightedAverageGap_le_geometric_of_source_oneStep`,
`chewi121_smooth_weightedAverageGap_le_of_source_oneStep`, and
`chewi121_nonsmooth_weightedAverageGap_le_of_source_oneStep`, so the displayed
SMPGD recurrence now feeds the closed geometric denominator and the
smooth/non-smooth stochastic error floors directly.  The current local packet
adds `chewi121_source_oneStep_of_model_bounds` and
`chewi121_weightedAverageGap_le_geometric_of_model_bounds`, turning Chewi's
three expected `psi_x` bounds into the displayed SMPGD one-step recurrence and
then into the closed weighted-average rate.  The newest expected-lower-model
handoff packet adds `chewi121_smooth_next_lower_of_expected_model_error`,
`chewi121_nonsmooth_next_lower_of_expected_model_error`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_model_bounds`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_model_bounds`, so the
smooth and non-smooth source expected lower estimates can now feed the closed
rates directly.  The newest RMS analytic packet adds
`chewi121_smooth_young_lower_bound`,
`chewi121_smooth_expected_model_lower_of_rms_bound`,
`chewi121_nonsmooth_expected_model_lower_of_rms_bound`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_rms_model_bounds`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_rms_model_bounds`,
formalizing the scalar Young/Cauchy-Schwarz handoff in Chewi's smooth and
non-smooth lower estimates.  The current focused component packet adds
`chewi121_smooth_hcore_of_expected_components`,
`chewi121_nonsmooth_hcore_of_expected_components`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_component_model_bounds`,
and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_component_model_bounds`,
so deterministic component-to-rate assembly is verified.  The current
finite-support stochastic-gradient packet adds
`chewi121_smooth_finite_raw_component_bound`,
`chewi121_smooth_finite_absorb_component_bound`,
`chewi121_finite_mirror_lower_component_bound`,
`chewi121_nonsmooth_finite_raw_component_bound`,
`chewi121_finite_linear_component_bound`,
`chewi121_smooth_hcore_of_finite_components`,
`chewi121_nonsmooth_hcore_of_finite_components`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_finite_components`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_components`,
giving a finite-distribution version of the Chapter 12 SMPGD rate from
per-sample component inequalities.  The newest Bochner-integral packet adds
`chewi121_smooth_integral_raw_component_bound`,
`chewi121_smooth_integral_absorb_component_bound`,
`chewi121_integral_mirror_lower_component_bound`,
`chewi121_nonsmooth_integral_raw_component_bound`,
`chewi121_integral_linear_component_bound`,
`chewi121_smooth_hcore_of_integral_components`,
`chewi121_nonsmooth_hcore_of_integral_components`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_components`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_components`,
giving the general expectation route from supplied integrability and a.e.
component inequalities to the final Chapter 12 SMPGD weighted-average rates.
The newest smooth L2/Hölder probability packet adds
`chewi121_integral_noise_bound_of_l2_roots`,
`chewi121_smooth_hcore_of_integral_l2_noise_components`, and
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_noise_components`,
so Chewi's smooth Cauchy-Schwarz/RMS noise estimate now feeds the final
Chapter 12 weighted-average rate directly.  The newest sampled-model bridge
packet adds `chewi121_smooth_raw_point_of_sampled_model`,
`chewi121_nonsmooth_raw_point_of_sampled_model`,
`chewi121_smooth_absorb_of_relativeSmoothOn`,
`chewi121_finite_sampled_growth_of_steps`, and
`chewi121_finite_sampled_star_upper_of_unbiased`, so the finite sampled
`ψ_x` raw/growth/star-upper algebra is no longer an opaque assumption.  The
newest finite sampled endpoint packet adds
`chewi121_smooth_hcore_of_finite_sampled_models`,
`chewi121_nonsmooth_hcore_of_finite_sampled_models`,
`chewi121_smooth_weightedAverageGap_le_geometric_of_finite_sampled_models`,
and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_sampled_models`,
so the finite smooth route and the stronger pointwise-bounded non-smooth route
now discharge model growth, star-upper averaging, and sampled lower-model
fields directly.  The smooth integral-L2 sampled-model packet adds
`chewi121_smooth_hcore_of_integral_l2_sampled_models` and
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models`,
closing the smooth sampled source-L2 route to the final weighted-average rate.
The smooth Bochner-unbiased packet adds
`chewi121_integral_sampled_growth_of_steps`,
`chewi121_integral_sampled_star_upper_of_unbiased`, and
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_unbiased`,
so a.e. sampled MPGD growth and Bochner-unbiased star upper now feed the
smooth integral-L2 sampled weighted-average rate directly.
The smooth source variance-bound packet adds
`chewi121_smooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_unbiased_of_variance_bound`,
specializing the RMS variance level to `sqrt (sigma^2 * dim)` and discharging
the scalar domination field directly from Chewi's displayed `(12.1)` root
variance bound.
The non-smooth source-L2 sampled packet adds
`chewi121_integral_average_le_l2_root_of_probability`,
`chewi121_nonsmooth_hcore_of_integral_l2_sampled_models`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models`,
so Chewi's `(12.2)` sampled-gradient L2 route now feeds the non-smooth
weighted-average rate.  The non-smooth relative-subgradient packet adds
`IsRelativeSubgradientAt`,
`chewi121_integral_sampled_star_upper_of_relativeSubgradient`, and
`chewi121_nonsmooth_weightedAverageGap_le_geometric_of_integral_l2_sampled_models_relativeSubgradient`,
so a.e. sampled MPGD growth and the source condition that the mean sampled
oracle is a relative subgradient now discharge the non-smooth growth/star
upper fields.
The weighted stochastic averaged-iterate packet adds `weightedSampleAverage`,
`integral_weightedSampleAverage_gap_le_of_weighted_gap_bound`, and
`chewi121_weightedSampleAverage_gap_le_geometric_of_weightedAverageGap`, using
mathlib `ConvexOn.map_centerMass_le` and Bochner finite-sum integral APIs to
move from the closed weighted expected-gap rate to the source-shaped objective
gap at the weighted stochastic averaged iterate.
The final source-shaped wrapper packet adds
`chewi121_smooth_weightedSampleAverage_gap_le_geometric_of_integral_l2_sampled_models_unbiased_of_variance_bound`
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_geometric_of_integral_l2_sampled_models_relativeSubgradient`,
so the smooth `(12.1)` and non-smooth relative-subgradient routes now conclude
directly at the stochastic weighted averaged iterate.
The displayed RHS bridge packet adds
`chewi121_smooth_displayed_error_rhs_of_stronger`,
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_stronger`,
`chewi121_nonsmooth_displayed_error_rhs_of_stronger`, and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_stronger`, so
Chewi's exact displayed `(1 + alphaG * h)` stochastic-error factor is available
from the stronger compiled averaged-iterate bounds.
The full source-displayed wrapper packet adds
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_integral_l2_sampled_models_unbiased_of_variance_bound`
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_integral_l2_sampled_models_relativeSubgradient`,
so the exact displayed smooth and non-smooth Chewi Theorem 12.1 averaged-rate
statements now compile directly from the source variance-bound and relative
subgradient hypotheses.
The filtration/process wrapper packet adds
`integral_eq_const_of_condExp_ae_eq_const`,
`integral_eq_const_of_filtration_condExp_ae_eq_const`,
`chewi121_smooth_weightedSampleAverage_gap_le_displayed_of_filtration_condExp_unbiased_of_variance_bound`,
and
`chewi121_nonsmooth_weightedSampleAverage_gap_le_displayed_of_filtration_condExp_relativeSubgradient`,
so conditional mean assumptions now discharge the unconditional mean fields in
the exact displayed SMPGD rates.  The active Chapter 12 lane is now the ASGD
martingale layer: conditional mean-zero and covariance packaging, quadratic
ASGD decomposition, and then martingale CLT infrastructure.
The root-imported `StatInference/Optimization/ASGD.lean` module now compiles
`chewi123_asgd_noise_sum_split`,
`chewi123_asgd_scaled_average_decomposition`, and
`chewi123_asgd_sqrt_average_decomposition`, giving the source `(12.5)`
finite-sum split needed before the martingale CLT handoff.  It also now
compiles `chewi123_asgd_neg_linear_noise_clt`,
`chewi123_asgd_neg_linear_gaussian_limit`, and
`chewi123_asgd_distribution_limit_of_noise_and_remainders`, reusing mathlib's
continuous-mapping theorem, Gaussian linear-map closure, and Slutsky additive
handoff to turn Chewi's martingale CLT term plus two `o_P(1)` remainders into
the scaled averaged-iterate weak limit.  The next packet compiles
`Chewi127MartingaleDifferenceProcess`,
`Chewi127ConditionalCovarianceProcess`,
`Chewi127MartingaleCLTCertificate`,
`Chewi127MartingaleDifferenceProcess.integral_next_eq_zero`,
`Chewi127MartingaleCLTCertificate.asgd_distribution_limit`,
`Chewi127MartingaleCLTCertificate.neg_linear_covarianceBilinDual`,
`Chewi127MartingaleCLTCertificate.neg_linear_covarianceTable`, and
`chewi123_asgd_limit_package_of_martingale_certificate`, reusing the Vaart
covarianceBilinDual/table pullback primitives for the Chewi `-A^{-1}` pushed
Gaussian limit.  The next packet compiles `chewi127ScaledNoiseSum`,
`chewi127AverageConditionalCovariance`,
`Chewi127AveragedConditionalCovarianceLimit`,
`chewi127_martingaleCLTCertificate_of_scaledNoiseSum`,
`Chewi127MartingaleDifferenceProcess.integral_linear_next_eq_zero`, and
`Chewi127ConditionalCovarianceProcess.integral_Xi_next_eq_integral_second_moment`.
These definitions and integral identities are the exact source interfaces for
`n^{-1/2} sum xi_k` and `n^{-1} sum Xi_k`.  The newest recurrence packet adds
the source quadratic-ASGD update interface, ordered transition products,
noise coefficients, finite pointwise unrolling, and averaged nested unrolling:
`chewi123QuadraticStepMap`, `chewi123_quadratic_delta_step`,
`IsChewi123QuadraticASGDTrajectory.delta_step`,
`chewi123_quadratic_delta_unroll`, and
`chewi123_quadratic_average_delta_unroll_nested` are now compiled.  The newest
triangular-regrouping packet adds `chewi123InitialCoefficient`,
`chewi123SourceNoiseCoefficient`,
`chewi123_nested_noise_sum_eq_source_coefficients`,
`chewi123_quadratic_average_delta_unroll_source_coefficients`,
`chewi123_quadratic_average_delta_source_decomposition`, and
`chewi123_quadratic_sqrt_average_delta_source_decomposition`, so Chewi's
`M_k^n` source coefficients, split around `A^{-1}`, and `sqrt n` display are
now compiled.  The projected martingale-CLT bridge packet adds
`chewi127ScaledProjectedNoiseSum`,
`chewi127ScaledProjectedNoiseSum_eq_apply_scaledNoiseSum`,
`chewi127AverageConditionalVariance`,
`Chewi127AveragedConditionalCovarianceLimit.variance_tendstoInMeasure`,
`chewi127_projected_clt_of_scaledNoiseSum_clt`,
`Chewi127ProjectedMartingaleCLTBridge`,
`Chewi127ProjectedMartingaleCLTBridge.toMartingaleCLTCertificate`,
`Chewi127BoundedMartingaleCLTSource`,
`Chewi127BoundedMartingaleCLTSource.toProjectedBridge`, and
`Chewi127BoundedMartingaleCLTSource.toMartingaleCLTCertificate`.  The scalar
projection data packet adds `chewi127ScalarScaledSum`,
`chewi127ScaledProjectedNoiseSum_eq_scalarScaledSum`, the source
`same_filtration` field,
`Chewi127MartingaleDifferenceProcess.projected_stronglyAdapted`,
`Chewi127MartingaleDifferenceProcess.projected_integrable`,
`Chewi127MartingaleDifferenceProcess.condExp_linear_next_eq_zero`,
`Chewi127MartingaleDifferenceProcess.projected_uniform_bound`,
`Chewi127ConditionalCovarianceProcess.condExp_projected_square_eq`,
`Chewi127BoundedMartingaleCLTSource.projected_condExp_zero`,
`Chewi127BoundedMartingaleCLTSource.projected_conditional_second_moment`,
`Chewi127BoundedMartingaleCLTSource.projected_variance_tendstoInMeasure`,
`Chewi127BoundedMartingaleCLTSource.projected_uniform_bound`, and
`Chewi127BoundedMartingaleCLTSource.projected_scalar_clt`.  The next ASGD
target is the actual one-dimensional bounded martingale CLT proof behind the
`projected_clt` field, then the exact endpoint handoff to Theorem 12.7/12.3.

Historical manual frontier after focused Lean and promoted module build of
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
the opt-value `sqrt(kappa)` rate lower bound, and the source-shaped
contrapositive obstruction
`exercise42InfiniteChainObjective_not_near_min_of_positiveLogRate_lt_concreteGradient`.
The positive-log source
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
