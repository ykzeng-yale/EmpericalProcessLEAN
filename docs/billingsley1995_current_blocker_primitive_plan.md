# Billingsley 1995 Current Blocker And Primitive Plan

This file is the active blocker register for the Billingsley lane.  It should be
checked at the start of each automation run before selecting a proof target.

## Current Blocker

The Billingsley lane now has source materials and compiled content-based Lean
modules under `StatInference/ProbabilityMeasure/`, but it does not yet have an
exact source-audited Billingsley theorem report.
The blocker is selecting a theorem whose statement can be made both:

- faithful to the textbook source; and
- immediately useful to the empirical-process route.

The best current candidate family is Section 25 weak convergence and
Portmanteau/tightness wrappers, followed by Section 16 tail-control lemmas for
VdV&W Theorem 2.4.3.

## Search-First Record

Pinned mathlib searches found reusable APIs in:

- `MeasureTheory.Measure.ProbabilityMeasure`
- `MeasureTheory.Measure.Portmanteau`
- `MeasureTheory.Measure.Tight`
- `MeasureTheory.Measure.Prokhorov`
- `MeasureTheory.Measure.LevyProkhorovMetric`
- `MeasureTheory.Function.ConvergenceInMeasure`
- `MeasureTheory.Function.ConvergenceInDistribution`
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

## Primitive Sequence

1. Keep the Section 25 Billingsley weak-convergence wrappers compiling.
2. Keep the finite-dimensional process-law, product/Fubini, and
   Borel-Cantelli/generated-sigma/strong-law wrappers compiling.
3. Add a precise Section 25 theorem candidate to the inventory:
   bounded-continuous test functions, open/closed Portmanteau directions,
   continuous mapping, or tightness/Prokhorov.
4. If an exact Section 25 theorem requires only packaging existing APIs, create
   the exact theorem declaration first, then the report.
5. In parallel, push Section 16/18 support for VdV&W Theorem 2.4.3:
   envelope-tail, truncation-error, finite-product/Fubini, and independent-copy
   wrappers.  The content-based Section 18 wrapper layer has started in
   `StatInference/ProbabilityMeasure/ProductMeasure.lean`; the remaining work
   is to specialize it to the exact finite-product/independent-copy shapes used
   by symmetrization.
6. Defer examples requiring unrelated number theory, Markov chains, martingales,
   Brownian path theory, or Fourier analysis unless a concrete theorem needs
   them.

## Next Exact Lean Edit

After the weak-convergence naming layer, the next high-value proof step is one
of:

- a Billingsley Section 25 exact theorem candidate wrapping an already proved
  mathlib/local weak-convergence implication; or
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
- a Section 16 tail-control primitive in the empirical-process files that
  directly unlocks `StatInference/EmpiricalProcess/Theorem243.lean`.

The deciding rule is dependency value: if Theorem 2.4.3 is blocked on a tail or
Fubini primitive, prefer that over a cosmetic Billingsley report.
