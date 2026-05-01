# VdV&W Formalization Status Through Theorem 2.4.1

This document records the current Lean base, the textbook anchors through
VdV&W Theorem 2.4.1, and the remaining formalization needed before the repo can
claim the full textbook theorem.

## Current Verified Lean Base

Tracked Lean files are intentionally restricted to the empirical-process core
and minimal deterministic support:

| File | Role |
| --- | --- |
| `StatInference/Asymptotics/Basic.lean` | deterministic deviation/oracle support lemmas |
| `StatInference/EmpiricalProcess/Basic.lean` | empirical-deviation, GC, finite-class interfaces |
| `StatInference/EmpiricalProcess/Average.lean` | finite-sample empirical averages and empirical-risk notation |
| `StatInference/EmpiricalProcess/Finite.lean` | finite-union and finite-class deviation certificates |
| `StatInference/EmpiricalProcess/Preservation.lean` | projection/subclass preservation lemmas |
| `StatInference/EmpiricalProcess/Complexity.lean` | proof-carrying complexity interfaces |
| `StatInference/EmpiricalProcess/Bracketing.lean` | deterministic bracketing inequality and route to GC |
| `StatInference/EmpiricalProcess/EndpointStrongLaw.lean` | endpoint SLLN wrappers from mathlib |

Current verification gate:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

Expected result: build succeeds and the proof-hole scan returns no matches.

## Textbook Anchors

The local markdown/PDF/screenshot assets are ignored by Git but available for
private review in `Textbooks/Vaart1996/`.

| Textbook item | Markdown anchor | Current Lean status |
| --- | --- | --- |
| Definition 2.1.5, covering numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1894` | only abstract proof-carrying interface exists |
| Definition 2.1.6, bracketing numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1895` | not yet formalized as primitive `N_[]` |
| Chapter 2.4 intro | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:963-969` | reflected in roadmap only |
| Theorem 2.4.1 statement | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:970` | deterministic proof layers only |
| Theorem 2.4.1 proof, finite brackets and endpoint inequality | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:972-981` | deterministic bracketing theorem proved |
| Theorem 2.4.1 proof, endpoint SLLN and decreasing radius | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:984` | endpoint SLLN wrapper proved; final construction pending |
| Example 2.4.2, empirical CDF brackets | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:985` | pending example formalization |

Current screenshot anchor:

```text
Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png
```

## What Is Already Proved Toward Theorem 2.4.1

The following are compiled Lean declarations with no proof holes:

| Lean declaration | Textbook proof role |
| --- | --- |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` | formalizes the deterministic bracket comparison step |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds` | packages that comparison across sample sizes |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero` | converts vanishing endpoint and width radii into the current GC interface |
| `FiniteBracketingEndpointRoute` | proof-carrying finite-bracket route |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass` | converts a verified route into `GlivenkoCantelliClass` |
| `endpoint_strong_law_ae_real` | wraps mathlib strong law for one endpoint |
| `finite_endpoint_strong_law_ae_real` | finite endpoint family strong-law handoff |

This is not yet the exact theorem
`N_[](eps, F, L1(P)) < infinity for every eps > 0 -> F is Glivenko-Cantelli`.

## Dependency-Minimal Remaining Work For Theorem 2.4.1

These are the missing primitives and lemmas on the direct proof path.

| Order | Missing item | Textbook source | Lean target shape |
| --- | --- | --- | --- |
| 1 | measurable real function class | Theorem 2.4.1 statement | represent `F : Set (Omega -> Real)` with endpoint/function measurability assumptions |
| 2 | pointwise bracket `[l, u]` | Definition 2.1.6 | `FunctionBracket`, `MemFunctionBracket`, pointwise `l x <= f x <= u x` |
| 3 | epsilon bracket | Definition 2.1.6 | bracket plus width bound `< eps` |
| 4 | `L1(P)` bracket width | Definition 2.1.6 and Theorem 2.4.1 | define width as the integral of `|u x - l x|`, or simplify to the integral of `u x - l x` under pointwise order |
| 5 | finite bracket cover | Definition 2.1.6 | finite indexed family of brackets whose union covers the class |
| 6 | primitive bracketing number `N_[]` | Definition 2.1.6 | minimal finite cardinality or `WithTop Nat` value with existence theorem |
| 7 | finite bracketing hypothesis to cover witness | Theorem 2.4.1 statement | from `N_[](eps, F, L1(P)) < infinity` obtain finite brackets with width `< eps` |
| 8 | population order lemmas | proof lines 972-981 | integrate pointwise bracket inequalities to get `P l <= P f <= P u` |
| 9 | empirical order lemmas | proof lines 972-981 | finite-sample averages preserve pointwise bracket inequalities |
| 10 | endpoint empirical averages | proof line 984 | instantiate endpoint SLLN with `X i omega = u (sample i omega)` and lower endpoints |
| 11 | endpoint convergence to route fields | proof line 984 | produce endpoint radius tending to zero for all finite endpoints |
| 12 | construct `FiniteBracketingEndpointRoute` | proof lines 972-984 | connect primitive bracket cover to the existing deterministic route |
| 13 | decreasing-radius argument | proof line 984 | turn fixed `eps` theorem into exact GC conclusion |
| 14 | final textbook theorem | Theorem 2.4.1 statement | state exact convergence mode and measurability/outer-probability assumptions |

## Full Textbook-Order Work Before 2.4.1

If the goal is literal coverage of every named item before Theorem 2.4.1, the
repo also needs the named material in Sections 2.1-2.3. This is separate from
the dependency-minimal proof of Theorem 2.4.1.

| Section | Named content before 2.4.1 | Current status |
| --- | --- | --- |
| 2.1 | empirical-process examples, covering numbers, bracketing numbers, Donsker overview examples/proposition | only empirical-process interfaces and averages exist |
| 2.2 | Orlicz norm lemmas, covering/packing definition, chaining maximal inequality, Hoeffding/Bernstein inequalities | not formalized locally |
| 2.3 | symmetrization, measurable classes, separability/lifting, Donsker separable modification results | not formalized locally |

Theorem 2.4.1 itself uses Definition 2.1.6 and the real-valued strong law
directly; it does not require the maximal inequalities or symmetrization
machinery from Sections 2.2-2.3.

## Report Requirement

Every newly completed theorem or theorem layer derived from VdV&W must add a
report under `Reports/`. The report must include a side-by-side cross-check:

| Required column | Meaning |
| --- | --- |
| Lean realization | declaration name, file, kind, and exact formal role |
| Textbook markdown anchor | local markdown file and line range; include only a short excerpt or paraphrase in public tracked docs |
| PDF screenshot anchor | local screenshot path for the corresponding textbook passage |
| Status/gap | exact theorem, proved layer, proof-carrying interface, or pending primitive |

Long textbook excerpts and screenshots remain local-only review material and
should not be committed to the public repository.
