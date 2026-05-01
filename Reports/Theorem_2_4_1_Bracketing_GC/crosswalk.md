# Crosswalk: Textbook Text To Lean Objects

This file is for human review.  Each Lean definition or theorem is mapped to
the closest textbook step, the markdown source, and the PDF screenshot.

## Source Locations

| Source | Location |
| --- | --- |
| Markdown theorem statement | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:970` |
| Markdown finite bracket choice | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:972` |
| Markdown upper deviation inequality | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:974-981` |
| Markdown endpoint SLLN sentence | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:984` |
| PDF screenshot | `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` |
| Markdown bracketing definition | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1895` |
| Definition 2.1.6 PDF screenshot | `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png` |

## Lean Crosswalk

| Lean object | Kind | Textbook counterpart | Review status |
| --- | --- | --- | --- |
| `EmpiricalDeviationBoundOn` | existing definition | uniform bound over in-class deviations | existing interface, not a textbook primitive |
| `EmpiricalDeviationSequenceOn` | existing definition | sequence of uniform deviation bounds | existing interface, not a textbook primitive |
| `GlivenkoCantelliClass` | existing structure | GC conclusion with a vanishing deterministic radius | stronger proof-carrying interface than the outer-a.s. textbook wording |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` | theorem | bracket inequality bounding both positive and negative deviations | matches the proof's bracket comparison step, with absolute value added |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds` | theorem | same bracket inequality across sample sizes | sequence-level packaging |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero` | definition/theorem-style construction | deterministic final handoff once endpoint and width radii vanish | not the full finite-bracketing-number theorem |
| `FiniteBracketingEndpointRoute` | structure | finite bracket family plus endpoint bounds | proof-carrying route, not claimed as automatically derived |
| `FiniteBracketingEndpointRoute.finiteBracketMarker` | definition | finite family of brackets | confirms the bracket index type is finite |
| `FiniteBracketingEndpointRoute.toEmpiricalDeviationSequenceOn` | theorem | finite bracketing gives uniform deviation bound | uses deterministic theorem above |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass` | construction | route to GC conclusion | requires endpoint and width convergence fields |
| `FiniteBracketingEndpointRoute.deviation` | theorem | pointwise use of the route's deviation radius | exported convenience theorem |
| `endpoint_strong_law_ae_real` | theorem | strong law for one endpoint | wraps mathlib `ProbabilityTheory.strong_law_ae_real` |
| `finite_endpoint_strong_law_ae_real` | theorem | finite endpoint family SLLN | finite conjunction of endpoint SLLNs |
| `FunctionBracket` | primitive structure | bracket `[l, u]` from Definition 2.1.6 | exact primitive layer |
| `FunctionBracket.Mem` / `MemFunctionBracket` | primitive predicate | functions lying between bracket endpoints | exact primitive membership layer |
| `FunctionBracket.lowerIntegral` / `FunctionBracket.upperIntegral` / `populationRiskOfFunction` | noncomputable definitions | population expectations of members and endpoints | primitive integral vocabulary |
| `FunctionBracket.l1Width` / `l1BracketWidth` | noncomputable definition | `L1(P)` bracket width as integral of `abs (u - l)` | exact width primitive |
| `IsL1EpsilonBracket` | primitive predicate | epsilon bracket with `L1(P)` width less than epsilon | exact epsilon-bracket primitive |
| `FunctionBracket.lowerIntegral_le_integral_of_mem` / `FunctionBracket.integral_le_upperIntegral_of_mem` | theorems | endpoint expectation inequalities from bracket membership | proved using mathlib `integral_mono` |
| `FunctionBracket.population_gap_le_l1Width_of_mem` | theorem | population endpoint gap controlled by bracket width | proved using mathlib integral algebra |
| `FunctionBracket.empiricalAverage_mono` and endpoint empirical monotonicity lemmas | theorems | empirical endpoint inequalities from bracket membership | proved using finite sums |
| `FiniteBracketCover` | primitive structure | finitely many brackets covering `F` | finite-cover primitive |
| `FiniteL1BracketCover` | primitive structure | finite bracket cover with `L1(P)` width and integrability evidence | finite `L1(P)` cover primitive |
| `FiniteL1BracketCoverAtCard` | primitive structure | finite epsilon-bracket cover with explicit cardinality | witness layer behind bracketing number |
| `HasFiniteL1BracketingNumber` | primitive proposition | existence of a finite number of epsilon brackets | finite `N_[]` witness form |
| `finiteL1BracketingNumberCard` / `l1BracketingNumber` | noncomputable definitions | minimal numeric bracketing number, with infinite value when no finite cover exists | primitive numeric `N_[]` layer |
| `hasFinite_of_l1BracketingNumber_lt_top` / `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` | theorems | finite numeric `N_[]` gives a finite bracket cover | proved bridge from theorem hypothesis to cover witness |
| `exists_finiteL1BracketCover_of_hasFiniteL1BracketingNumber` | theorem | finite bracketing-number witness gives a finite cover | proved witness-to-cover bridge |
| `FiniteL1BracketCover.empiricalDeviationBoundOn_of_endpoint_bounds` | theorem | primitive cover gives one-sample bracket deviation bound | proved bridge to deterministic bracket theorem |
| `FiniteL1BracketCover.empiricalDeviationSequenceOn_of_endpoint_bounds` | theorem | primitive cover gives sequence-level deviation bound | proved bridge |
| `FiniteL1BracketCover.toFiniteBracketingEndpointRoute` | construction | primitive cover becomes existing finite endpoint route | proved bridge to existing route |
| `UniformDeviationTendstoZeroOn` / `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | definition/theorem | epsilon/eventual deterministic bracketing argument | proved layer; final `N_[]` theorem pending |

## Screenshot

The screenshot path above is local-only review material and is intentionally
excluded from the public Git history.
