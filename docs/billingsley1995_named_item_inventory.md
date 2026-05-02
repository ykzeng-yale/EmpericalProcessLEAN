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
| Sections 3/10-14 generated sigma-fields, pi-lambda, extension/uniqueness, and measurable maps | `_1-121.md:1318,1476,1488`; `_122-242.md:1799,1804,1809,1924,2020,2033,2296,2329,2470,2564,2583` | local-layer/mathlib-foundation | `StatInference/ProbabilityMeasure/GeneratedSigma.lean` wraps mathlib generated measurable spaces, pi-systems, and measure extensionality; exact Billingsley theorem reports remain pending |
| Section 4 Borel-Cantelli and zero-one laws | `_1-121.md` near Section 4 start | local-wrapper/mathlib-foundation | first and second Borel-Cantelli wrappers over mathlib are available; exact Billingsley Theorems 4.3/4.4 reports, source screenshots, and zero-one-law coverage remain pending |
| Theorem 6.1 simple strong law and Section 22 iid strong law | `_1-121.md:2946-2953`; `_243-363.md:1810,1820,1884` | local-wrapper/mathlib-foundation | `StatInference/ProbabilityMeasure/StrongLaw.lean` wraps `ProbabilityTheory.strong_law_ae_real` for Billingsley source crosswalks and endpoint/empirical-average support; exact Billingsley theorem reports remain pending |
| Sections 15-16 integration and limit theorems | `_122-242.md` near Section 16 start | priority-local | tail/UI wrappers for VdV&W Theorem 2.4.3 |
| Section 18 product measure/Fubini | `_243-363.md` near Section 18 start | priority-local | finite-product Fubini wrappers for symmetrization |
| Section 20 random variables/distributions | `_243-363.md` near Section 20 start | local-wrapper candidate | distribution and convergence-in-probability wrappers |
| Theorem 20.6 empirical CDF Glivenko-Cantelli | `_243-363.md` near Theorem 20.6 | priority-local | connect half-line endpoint SLLN to Billingsley statement |
| Section 22 sums of independent random variables | `_243-363.md` near Section 22 start | priority-local | Rademacher iid/sign and finite maximal inequality lane |
| Section 25 weak convergence | `_243-363.md` near Section 25 start | local-wrapper | `StatInference/ProbabilityMeasure/WeakConvergence.lean` |
| Theorem 25.8 Portmanteau-style equivalences | `_243-363.md` near Theorem 25.8 | local-wrapper candidate | extend current one-way/open-closed/test-function wrappers to exact theorem |
| Theorem 25.10 tightness/subsequence compactness on `R` | `_243-363.md` near Theorem 25.10 | mathlib-foundation | Prokhorov/tightness wrapper; real-line exactness pending |
| Sections 36-38 process laws and separability | `_485-608.md` Sections 36-38 | local-wrapper | `StatInference/ProbabilityMeasure/FiniteDimensional.lean`; broader separability interfaces pending |

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
