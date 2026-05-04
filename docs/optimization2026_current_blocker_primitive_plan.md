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
frontier and the existing Chapter 1/3 bridge frontier.  The current route
should push Chapter 2 main-text theorem layers after the compiled
gradient-flow calculus/exponential-decay batch: discharge the analytic
gradient-flow limit route behind Proposition 2.7(2), instantiate Corollary
2.8's interval-minimum hypothesis from compactness/continuity when useful,
and eventually remove/discharge Theorem 2.4's exposed
interval-integrability assumptions from stronger regularity hypotheses, while
preserving the Chapter 3 theorem spine already compiled through Theorem 3.7.
Search existing mathlib and local `StatInference` APIs
first, prove the next highest-leverage main-text theorem layer, verify with
focused `lake env lean`, targeted `lake build StatInference`, proof-hole and
secret scans, update this route state, and commit/push clean verified
progress.  Skip exercise proofs until the main textbook theorem lane is
covered; exercise statements may be used as supplied interfaces only when they
directly unblock a main-text theorem.

## Current Blocker

The Chewi lane has source materials and a compiled content-based Lean namespace
under `StatInference/Optimization/`, but it does not yet have an exact
source-audited Optimization theorem report.  Main-text Chapter 3 now has a
strong reusable spine through Theorem 3.7's finite-minimum gradient-norm form,
and the Chapter 1 convexity bridge now removes a major supplied-interface
blocker for the whole-space differentiable case:

- Lemma 1.10 minimizer uniqueness under mathlib `StrictConvexOn` compiles in
  `StatInference/Optimization/Minimizer.lean`, reusing
  `StrictConvexOn.eq_of_isMinOn`.
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
  with interval-integrability hypotheses exposed.
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
  `HasGradientAt`, leaving Exercise 3.1 co-coercivity as the only exercise
  interface in that Theorem 3.3 route.

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
display `(3.5)` also compiles as `GradientCocoerciveOn`, and it supplies the
h-scaled Theorem 3.3 co-coercivity condition under `0 < beta`, `0 <= h`, and
`h <= 1 / beta`.  Per the current route decision, exercise proofs are deferred
until after the main textbook lane is covered.  Next choices are main-text
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
interface.

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
`IntervalIntegrable` assumptions from a clean `C²`/regular trajectory surface
instead of passing them explicitly.

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
`IsCompact.exists_isMinOn`, `ContinuousOn.exists_isMinOn'`, and
`isCompact_Icc`.  The next proof step should discharge
`PLGradientFlowLimitRouteToQGOn` from an explicit gradient-flow convergence
and Lyapunov-monotonicity theorem, or instantiate Corollary 2.8's
`IsMinOn` hypothesis from continuity on `[0,t]`.  The latter compactness step
is now done using `isCompact_Icc.exists_isMinOn` and
`ContinuousOn.intervalIntegrable_of_Icc`; future work should not rediscover
that API.

Current Exercise 3.1 co-coercivity interface result: the source display (3.5)
now compiles as `GradientCocoerciveOn`.  The bridge
`GradientCocoerciveOn.stepCocoerciveOn_of_le_inv` converts it to
`GradientStepCocoerciveOn` under the source step-size condition
`h <= 1 / beta`; the proof uses `real_inner_comm`, positivity of the squared
norm, `mul_le_mul_of_nonneg_left`, `mul_le_mul_of_nonneg_right`, `field_simp`,
and `nlinarith`.  Theorem 3.3 now has source-step wrappers from
`FirstOrderStrongConvexOn` plus `GradientCocoerciveOn`.  Deriving (3.5)
itself from convexity plus smoothness or from the shifted-function/descent
lemma is recorded as an exercise-pass task and should not block main-text
formalization.

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
   monotonicity and Exercise 3.1 co-coercivity interfaces, and from actual
   whole-space `StrongConvexOn` plus `HasGradientAt` once co-coercivity is
   supplied.
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
9. Prove the first source-exact report candidate only after the exact theorem
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
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn`
- `StatInference.Optimization.polyakLojasiewiczOn_of_strongConvexOn_univ_hasGradientAt`
- `StatInference.Optimization.polyakLojasiewiczOn_of_firstOrderStrongConvexOn_isMinOn`
- `StatInference.Optimization.QuadraticGrowthWitnessOn.quadraticGrowthOn`
- `StatInference.Optimization.quadraticGrowthWitnessOn_of_plGradientFlowLimitRoute`
- `StatInference.Optimization.quadraticGrowthOn_of_plGradientFlowLimitRoute`
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
- projection lemmas for convex-set, segment inequality, smooth upper model,
  continuity, mathlib-gradient Lipschitzness, and trajectory successor steps.

Next manual goal target: discharge the analytic hypothesis
`PLGradientFlowLimitRouteToQGOn` from the book's gradient-flow convergence and
Lyapunov monotonicity argument.  The Corollary 2.8 compact-minimum and
continuity/integrability bridge is already compiled, so do not spend another
run there unless strengthening the continuity hypotheses materially advances
the analytic route.  Continue deferring exercise proofs except where an
exercise statement is needed as a temporary interface for a main-text theorem.
