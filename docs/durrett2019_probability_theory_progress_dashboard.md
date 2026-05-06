# Durrett 2019 Probability Theory Progress Dashboard

This dashboard tracks the Durrett probability-theory lane for `StatInference/`.
It is separate from the Billingsley probability-measure support lane, but it
must reuse Billingsley/local probability primitives whenever possible.

## Snapshot

- Source assets: local PDF and four Markdown chunks are available under
  `Textbooks/Durrett2019ProbabilityTheory/`.
- Lean namespace started: `StatInference.ProbabilityTheory`.
- Lean code location: content-based folder `StatInference/ProbabilityTheory/`.
- First module: `StatInference/ProbabilityTheory/Basic.lean`, imported by
  `StatInference.lean`.
- Reusable foundation location: `StatInference/ProbabilityMeasure/`.
- Formal theorem reports: none yet.
- Proof-hole policy: no Durrett report until the exact textbook statement
  compiles with no `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
- Automation policy: the Durrett automation runs every 15 minutes and should
  refresh its live prompt after each verified proof step, blocker refinement,
  merge, or route change.

## Current Active Target

Current verified Durrett Lean frontier: `StatInference/ProbabilityTheory/Basic.lean`
compiles and root-imports the new namespace.  Compiled declarations:

- `durrett2019_theorem_2_3_1_borelCantelli_first`;
- `durrett2019_theorem_2_3_1_eventually_notMem`;
- `durrett2019_theorem_2_3_7_borelCantelli_second`;
- `durrett2019_theorem_2_4_1_strongLaw_ae_real`;
- `durrett2019_theorem_2_4_1_centeredStrongLaw_ae_real`;
- `durrett2019_piSystem_probability_ext`.
- `durrett2019_theorem_1_1_1_monotonicity`;
- `durrett2019_theorem_1_1_1_subadditivity`;
- `durrett2019_theorem_1_1_1_continuity_from_below`;
- `durrett2019_theorem_1_1_1_tendsto_measure_from_below`;
- `durrett2019_theorem_1_1_1_continuity_from_above`;
- `durrett2019_theorem_1_1_1_tendsto_measure_from_above`;
- `durrett2019_theorem_1_3_1_measurable_of_generator_preimages`;
- `durrett2019_theorem_1_3_4_measurable_comp`.

The first aggressive full-theorem target is now Durrett Theorem 2.4.9,
Glivenko-Cantelli for empirical CDFs, cross-listed with the later empirical
distribution-function spine.  The source scout identified this as the best
large target because the repo already has fixed-endpoint empirical-CDF and
half-line GC support in `StatInference/EmpiricalProcess/RealHalfLineGC.lean`.

Immediate proof route:

1. inspect and reuse `realHalfLineIndicator_integral_eq_cdf`,
   `realHalfLine_empiricalAverage_sub_cdf_tendsto_zero_ae_of_iid`, and nearby
   grid/squeezing handoffs;
2. formalize the missing finite quantile/endpoint grid construction for an
   arbitrary distribution function, or record the exact missing API if blocked;
3. package the empirical CDF statement as the first Durrett Theorem 2.4.9
   wrapper once the uniform squeezing proof compiles;
4. in parallel, search mathlib/local APIs for generated-independence bridges
   needed for
   Theorems 2.1.7-2.1.13;
5. promote the strongest cheap independence/product-law wrappers into the
   Durrett namespace.

The route should not duplicate raw measure theory from Chapter 1 unless an
exact source theorem needs a missing local theorem.  Chapter 1 is currently
mostly mathlib-foundation plus Billingsley reusable support.

## Coverage By Lane

| Lane | Status | Current Lean anchor | Notes |
| --- | --- | --- | --- |
| Chapter 1 measure/probability foundations | source-wrapper/reused-local | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/GeneratedSigma.lean`; `Tail.lean`; `ProductMeasure.lean` | Durrett wrappers for Theorem 1.1.1 measure properties and Theorems 1.3.1/1.3.4 measurability facts now compile over mathlib/local generator APIs. |
| Chapter 2.1 independence/product laws | pending-local | `StatInference/ProbabilityMeasure/ProductMeasure.lean`; mathlib independence APIs | Highest-value new theorem lane after Borel-Cantelli wrappers. Search before editing: `iIndep`, `IndepFun`, `Independent`, `HasLaw`, product measure, finite `Pi` law wrappers. |
| Chapter 2.3 Borel-Cantelli | source-wrapper | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/BorelCantelli.lean` | Durrett wrappers for Theorems 2.3.1 and 2.3.7 compile over existing local Borel-Cantelli wrappers. |
| Chapter 2.4 SLLN and empirical CDF | source-wrapper/local-layer | `StatInference/ProbabilityTheory/Basic.lean`; `StatInference/ProbabilityMeasure/StrongLaw.lean`; `StatInference/EmpiricalProcess/RealHalfLineGC.lean` | Durrett Theorem 2.4.1 source wrappers compile over the local strong-law wrappers. Theorem 2.4.9 Glivenko-Cantelli is the current aggressive target. |
| Chapter 3 CLT/characteristic functions | pending-local | none | Needs mathlib API search for characteristic functions, normal laws, weak convergence, and scalar asymptotics. |
| Chapter 4 martingales | pending-local | none | Search mathlib martingale/conditional expectation APIs first. |
| Chapter 5 Markov chains | pending-local | none | Likely requires new local abstractions for transition kernels and hitting times. |
| Chapters 6-8 ergodic/Brownian/Donsker | pending-local | none | Defer until early probability spine is stable or remote agents land reusable support. |

## Initial Source Inventory

Source anchors already identified in
`Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`:

- Chapter 1 starts at the "Chapter 1 / Measure Theory" heading.
- Theorem 1.1.1: monotonicity, subadditivity, continuity from below, and
  continuity from above for measures.
- Theorem 1.2.1: distribution-function properties.
- Theorem 1.3.1: measurability from generator preimages.
- Theorem 1.6.4: Chebyshev inequality.
- Theorem 2.1.6: pi-lambda theorem.
- Theorem 2.1.7: independent pi-systems generate independent sigma-fields.
- Theorem 2.1.10: functions of disjoint independent blocks are independent.
- Theorem 2.1.11: independent variables have product joint law.
- Theorem 2.1.12: independent-pair expectation/Fubini formula.
- Theorem 2.1.13: expectation of product of independent variables.
- Theorem 2.3.1: first Borel-Cantelli.
- Theorem 2.3.7: second Borel-Cantelli.
- Theorem 2.4.1: Etemadi strong law.
- Theorem 2.4.9: Glivenko-Cantelli theorem.

## Verification Gate

Every Lean packet should pass:

- focused `lake env lean StatInference/ProbabilityTheory/<module>.lean`;
- targeted `lake build StatInference.ProbabilityTheory.<module>` when promoted;
- root `lake build StatInference` before push if root imports changed;
- proof-hole scan over the touched Lean lane;
- changed-file secret scan;
- `git diff --check`.

## Current Next Run Contract

The next automation run should not just reread the source.  It should either:

- advance Durrett Theorem 2.4.9 by proving the missing arbitrary-CDF finite-grid
  or empirical-CDF squeezing layer; or
- if that blocks, prove and verify the smallest independence/product-law wrapper
  needed for Theorems 2.1.7-2.1.13 and record the exact GC blocker.
