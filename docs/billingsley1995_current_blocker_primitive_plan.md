# Billingsley 1995 Current Blocker And Primitive Plan

This file is the active blocker register for the Billingsley lane.  It should be
checked at the start of each automation run before selecting a proof target.

## Adaptive Automation Prompt Rule

The recurring Billingsley/probability-measure heartbeat is part of the proof
state.  Every automation run should finish by checking whether its live prompt
is stale relative to this file, the dashboard, and the latest verified commit.
If the run proves a Lean declaration, narrows a blocker, merges another
agent's work, changes the next atomic target, or records a material mathlib or
local-code search result, update the automation prompt before ending the run.

The refreshed prompt should name:

- the latest pushed commit and the exact new declarations or blocker
  refinement;
- a primary theorem/proof target plus the highest-value parallel support
  targets, with dependency order after them;
- the search-first scope: pinned mathlib, local `StatInference`, and existing
  `StatInference/ProbabilityMeasure` wrappers;
- the verification gate: focused `lake env lean`, targeted `lake build` for
  promoted theorem layers, proof-hole scan, and secret scan;
- the report gate: no Billingsley report without an exact source-matched
  theorem/lemma, screenshots, and local report compilation.

Do not update the prompt for wording-only churn.  Do update it whenever the old
prompt would send the next heartbeat toward a solved target, omit a newly
proved dependency, or hide the current blocker.

## Throughput Policy

The Billingsley heartbeat should be aggressive proof work, not a one-wrapper
drip feed.  Each run should try to close a primary theorem/proof target and, in
parallel, prepare adjacent support that can be checked independently: mathlib
API discovery, local dependency reuse, source anchors, verification/report
policy, and one bounded Lean/doc worker when safe.  A small primitive is
acceptable only when it is the fastest verified dependency for the active proof
route or when the exact theorem target is blocked and the blocker is recorded
precisely.

## Current Blocker

The Billingsley lane now has source materials and compiled content-based Lean
modules under `StatInference/ProbabilityMeasure/`, but it does not yet have an
exact source-audited Billingsley theorem report.
The blocker is selecting a theorem whose statement can be made both:

- faithful to the textbook source; and
- immediately useful to the empirical-process route.

The best current candidate family is Section 25 weak convergence and
Portmanteau/tightness wrappers, while Section 16/18 support should stay
dependency-driven by the current VdV&W Theorem 2.4.3 route.  As of the latest
merged empirical-process progress, the log-radius-to-Hoeffding scale comparison
is proved.  The active VdV&W blockers are now the theorem-specific
symmetrization/truncation layer, the outer envelope-tail handoff, and
entropy-to-convergence/final assembly.  Billingsley support should only add
reusable probability/measure wrappers if those steps need tail, product/Fubini,
independent-copy, or outer-expectation infrastructure.

## Search-First Record

Pinned mathlib searches found reusable APIs in:

- `MeasureTheory.Measure.ProbabilityMeasure`
- `MeasureTheory.Measure.Portmanteau`
- `MeasureTheory.Measure.Tight`
- `MeasureTheory.Measure.Prokhorov`
- `MeasureTheory.Measure.LevyProkhorovMetric`
- `MeasureTheory.Function.ConvergenceInMeasure`
- `MeasureTheory.Function.ConvergenceInDistribution`
- `MeasureTheory.Integral.Layercake`
- `MeasureTheory.Integral.Lebesgue.Markov`
- `MeasureTheory.PiSystem`
- `MeasureTheory.Measure.Typeclasses.Finite`
- `MeasureTheory.MeasurableSpace.Pi`
- `MeasureTheory.Measure.Prod`
- `MeasureTheory.Constructions.Pi`
- `Probability.ProductMeasure`
- `Probability.Process.FiniteDimensionalLaws`
- `Probability.StrongLaw`
- `Probability.BorelCantelli`
- `Probability.Independence.Basic`
- `Probability.Independence.Integration`
- `Probability.HasLawExists`
- `Probability.IdentDistrib`
- `Probability.Moments.SubGaussian`
- `Probability.ProbabilityMassFunction.Integrals`

Local searches found reusable APIs in:

- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/OuterExpectation.lean`
- `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`
- `StatInference/EmpiricalProcess/Theorem243.lean`
- `StatInference/EmpiricalProcess/BallSigma.lean`
- `StatInference/EmpiricalProcess/RealHalfLine.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/Rademacher.lean`

## Primitive Sequence

1. Keep the Section 25 Billingsley weak-convergence wrappers compiling,
   including the bounded-continuous criterion, open/closed Portmanteau
   directions, continuity-set convergence, closed-set converse, and pi-system
   convergence criterion.
2. Keep the finite-dimensional process-law, product/Fubini, and
   Borel-Cantelli/generated-sigma/strong-law wrappers compiling.
3. Add a precise Section 25 theorem candidate to the inventory:
   bounded-continuous test functions, open/closed Portmanteau directions,
   continuous mapping, or tightness/Prokhorov.
4. If an exact Section 25 theorem requires only packaging existing APIs, create
   the exact theorem declaration first, then the report.
5. In parallel, push Section 16/18 support for VdV&W Theorem 2.4.3:
   envelope-tail, truncation-error, layer-cake/tail-integral,
   finite-product/Fubini, iid Rademacher signs, and independent-copy wrappers.
   The content-based
   Section 16 wrapper layer has started in
   `StatInference/ProbabilityMeasure/Tail.lean`; it packages mathlib
   layer-cake, tail-integral monotonicity, split-at-radius, and Markov APIs for
   downstream empirical-process use. `StatInference/EmpiricalProcess/Theorem243.lean`
   now consumes these generic wrappers for its finite-center expected-supremum
   tail layer while keeping VdV&W-specific outer-expectation/truncation
   handoffs local to the empirical-process files. This is support
   infrastructure, not a source-exact Billingsley Sections 15-16 report. The
   content-based Section 18
   wrapper layer has started in
   `StatInference/ProbabilityMeasure/ProductMeasure.lean`; it now includes
   product-coordinate marginal projection and separated product-expectation
   identities for binary product probability spaces, plus
   `probability_prod_independent_self_copies`, which packages the two product
   coordinates as independent copies with common law `P`. The remaining work is
   to specialize these wrappers to the exact finite-product/independent-copy
   shapes used by symmetrization.  The reusable Rademacher-sign layer has started in
   `StatInference/ProbabilityMeasure/Rademacher.lean`; it packages the fair
   Bool law, real sign map, real Rademacher law, zero mean, sub-Gaussian
   one-dimensional law, deterministic sign vectors, and finite iid sign
   existence.
6. Defer examples requiring unrelated number theory, Markov chains, martingales,
   Brownian path theory, or Fourier analysis unless a concrete theorem needs
   them.

## Next Exact Lean Edit

After the weak-convergence naming layer, the next high-value proof step is one
of:

- integrate the generic
  `StatInference/ProbabilityMeasure/Rademacher.lean` iid/sign-vector layer into
  the VdV&W Theorem 2.4.3 symmetrization route, replacing theorem-local
  duplication only when the refactor is small and Lean verifies; or
- a Billingsley Section 25 exact theorem candidate wrapping an already proved
  mathlib/local weak-convergence implication, with Theorem 25.8
  bounded-continuous and continuity-set directions as the current best
  source-audited candidate; or
- the empirical-distribution support wrapper in
  `StatInference/EmpiricalProcess/RealHalfLineGC.lean`, now available as a
  local support layer: `realHalfLineIndicator_integral_eq_cdf` identifies the
  closed half-line indicator integral with `ProbabilityTheory.cdf`, and
  `realHalfLine_empiricalAverage_sub_cdf_tendsto_zero_ae_of_iid` repackages
  the endpoint empirical-average SLLN as pointwise empirical-CDF convergence
  for a fixed endpoint. The fixed-endpoint
  convergence-in-probability/`TendstoInMeasure` wrapper and the corresponding
  VdV&W outer-probability wrapper record the same fixed-endpoint consequence in
  probability. This is not a source-exact formalization of Billingsley Theorem
  20.6; the remaining exact Theorem 20.6 route is the uniform-in-`x` statement,
  likely via the finite-grid route; or
- the next Section 16 tail-control specialization needed by
  `StatInference/EmpiricalProcess/Theorem243.lean`, using the compiled
  `StatInference/ProbabilityMeasure/Tail.lean` layer-cake/tail wrappers where
  the statement is reusable, and keeping VdV&W-specific outer-expectation
  handoffs in the empirical-process files; or
- the next Section 18 independent-copy specialization using
  `probability_integral_prod_fst`, `probability_integral_prod_snd`, and
  `probability_integral_prod_mul`, plus
  `probability_prod_independent_self_copies`, to erase unused product
  coordinates and expose ghost-copy independence in the symmetrization route.

The deciding rule is dependency value: if Theorem 2.4.3 is blocked on a tail,
Fubini, independent-copy, or outer-expectation primitive, prefer that over a
cosmetic Billingsley report.  Otherwise, select a narrow Section 25 theorem
candidate whose proof is already mostly present in mathlib/local wrappers and
move it toward an exact source-audited Billingsley statement.
