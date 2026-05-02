# Billingsley 1995 Named Item Inventory

This is a seed inventory for Billingsley, *Probability and Measure* (1995).
It focuses first on items that can support the empirical-process route.  A full
chapter-by-chapter extraction should extend this file rather than creating
parallel inventories.

## Source Map

- Table of contents:
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_1-121.md`
- Sections 1-9:
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_1-121.md`
- Sections 10-19:
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_122-242.md`
  and the start of
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_243-363.md`
- Sections 20-25:
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_243-363.md`
- Sections 26-35:
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_364-484.md`
- Sections 36-38 and back matter:
  `Textbooks/Billingsley1995/Markdown/Billingsley Probabilty and Measure_485-608.md`

## High-Leverage Anchors

| Item | Source anchor | Status | Lean target |
| --- | --- | --- | --- |
| Section 3 extension/pi-lambda/monotone-class machinery | `_1-121.md` near Section 3 start | mathlib-foundation | future Billingsley pi-lambda wrappers over `MeasureTheory.PiSystem` |
| Section 4 Borel-Cantelli and zero-one laws | `_1-121.md` near Section 4 start | mathlib-foundation | future wrappers over mathlib Borel-Cantelli APIs |
| Theorem 6.1 simple strong law | `_1-121.md` near Theorem 6.1 | mathlib-foundation | possible wrapper over `ProbabilityTheory.strong_law_ae_real` |
| Sections 15-16 integration and limit theorems | `_122-242.md` near Section 16 start | priority-local | tail/UI wrappers for VdV&W Theorem 2.4.3 |
| Section 18 product measure/Fubini | `_243-363.md` near Section 18 start | priority-local | finite-product Fubini wrappers for symmetrization |
| Section 20 random variables/distributions | `_243-363.md` near Section 20 start | local-wrapper candidate | distribution and convergence-in-probability wrappers |
| Theorem 20.6 empirical CDF Glivenko-Cantelli | `_243-363.md` near Theorem 20.6 | priority-local | connect half-line endpoint SLLN to Billingsley statement |
| Section 22 sums of independent random variables | `_243-363.md` near Section 22 start | priority-local | Rademacher iid/sign and finite maximal inequality lane |
| Section 25 weak convergence | `_243-363.md` near Section 25 start | local-wrapper | `StatInference/Billingsley/WeakConvergence.lean` |
| Theorem 25.8 Portmanteau-style equivalences | `_243-363.md` near Theorem 25.8 | local-wrapper candidate | extend current one-way/open-closed/test-function wrappers to exact theorem |
| Theorem 25.10 tightness/subsequence compactness on `R` | `_243-363.md` near Theorem 25.10 | mathlib-foundation | Prokhorov/tightness wrapper; real-line exactness pending |
| Sections 36-38 process laws and separability | `_485-608.md` Sections 36-38 | local-wrapper | `StatInference/Billingsley/FiniteDimensional.lean`; broader separability interfaces pending |

## Deferred Examples And Applications

The following are in long-run scope but should not block the empirical-process
foundation route:

- number-theoretic normal-number examples,
- gambling systems,
- finite Markov-chain worked examples,
- Fourier-series applications,
- Brownian motion path irregularity and reflection examples,
- characteristic-function applications beyond nearby theorem needs,
- martingale applications not needed by current empirical-process targets.

## Inventory Expansion Protocol

For each new named item, record:

1. Billingsley item number and local source path.
2. One-line paraphrase of the statement, avoiding long textbook quotations.
3. Status vocabulary from the blueprint.
4. Existing mathlib or local declarations searched.
5. Proposed Lean declaration name and target file.

Exact reports should be created only after the Lean statement and proof compile.
