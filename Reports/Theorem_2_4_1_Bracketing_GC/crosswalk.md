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

## Screenshot

The screenshot path above is local-only review material and is intentionally
excluded from the public Git history.
