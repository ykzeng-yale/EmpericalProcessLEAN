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

## Manual Goal Prompt

The active app-level `/goal` text is immutable in the current tool surface
except for marking the goal complete.  Since the full textbook formalization is
not complete, this document is the live replacement prompt for manual goal
runs.

Current manual objective: aggressively formalize and prove the main theorem
content of Sinho Chewi's Optimization 2026 notes in Lean under
`StatInference/Optimization`, continuing from the Chapter 2 gradient-flow
frontier, the existing Chapter 1/3 bridge frontier, and the new Chapter 4
gradient-span lower-bound foundation.  The current route should push Chapter 2
main-text theorem layers after the compiled gradient-flow
calculus/exponential-decay batch and push Chapter 4 from Definition 4.3 toward
Theorem 4.4: discharge the analytic gradient-flow limit route behind
Proposition 2.7(2), instantiate Corollary 2.8's interval-minimum hypothesis
from compactness/continuity when useful, and build the finite-dimensional
Euclidean/tridiagonal quadratic lower-bound construction for gradient-span
algorithms, while preserving the Chapter 3 theorem spine already compiled
through Theorem 3.7.
Search existing mathlib and local `StatInference` APIs
first, prove the next highest-leverage main-text theorem layer, verify with
focused `lake env lean`, targeted `lake build StatInference`, proof-hole and
secret scans, update this route state, and commit/push clean verified
progress.  Keep main-text theorem coverage as the priority; exercise
statements and exercise proofs may still be formalized opportunistically when
they are cheap, reusable, or directly unblock a main-text theorem.  All
Optimization textbook exercise statements and exercise proofs should live in
the single module
`StatInference/Optimization/Exercises.lean`, so the main theorem modules stay
focused while the later exercise sweep remains source-trackable.

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
`exercise42InfiniteGeometricMinimizer_lowerModel_of_firstOrder`,
`exercise42InfiniteGeometricMinimizer_gap_ge_geometric_tail_of_firstOrder`,
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometric_tail_of_firstOrder`,
and
`exercise42InfiniteGradientSpanTrajectory_gap_ge_geometricRatio_tail_of_firstOrder`
combine `FirstOrderStrongConvexOn`, the Chewi hard-chain coordinate gradient,
and the support induction into the exact geometric function-gap obstruction.
The concrete source objective layer now compiles:
`exercise42InfiniteChainEdgeSq_summable`,
`exercise42InfiniteChainObjective`,
`exercise42InfiniteChainObjective_apply`, and
`exercise42InfiniteChainObjective_gap_ge_geometricRatio_tail_of_firstOrder`.
The source display
`((beta-alpha)/8) * (x[0]^2 + tsum (x[n]-x[n+1])^2 - 2*x[0]) +
(alpha/2)*‖x‖^2` is now a reusable Lean objective on `ell^2`.
Next direct Exercise 4.2 step: prove/supply the concrete objective's
`FirstOrderStrongConvexOn` package with the compiled coordinate gradient, then
convert the compiled geometric obstruction into the source logarithmic
iteration lower bound without finite-boundary slack.
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
