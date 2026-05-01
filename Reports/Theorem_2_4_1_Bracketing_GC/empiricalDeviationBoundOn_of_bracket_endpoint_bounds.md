# Proof Report: `empiricalDeviationBoundOn_of_bracket_endpoint_bounds`

Lean file: `StatInference/EmpiricalProcess/Bracketing.lean`

Lean declaration:

```lean
theorem empiricalDeviationBoundOn_of_bracket_endpoint_bounds
```

## Mathematical Role

This proves the deterministic inequality behind VdV&W Theorem 2.4.1.  If every
function in the class is bracketed between lower and upper endpoints, endpoint
empirical-population deviations are bounded, and the population bracket width
is bounded, then every in-class empirical-population deviation is bounded.

The Lean theorem proves the absolute-value version, so it includes both the
upper and lower deviation arguments.

## Introduced Objects Used In The Proof

| Object | Source |
| --- | --- |
| `EmpiricalDeviationBoundOn` | existing `StatInference.EmpiricalProcess.Basic` |
| `populationRisk`, `empiricalRisk` | theorem parameters |
| `lowerPopulation`, `upperPopulation` | theorem parameters representing `P l_i`, `P u_i` |
| `lowerEmpirical`, `upperEmpirical` | theorem parameters representing `P_n l_i`, `P_n u_i` |
| `bracketOf` | theorem parameter selecting an enclosing bracket |
| `endpointRadius` | theorem parameter controlling endpoint deviations |
| `widthRadius` | theorem parameter controlling bracket width |

No new axiom or proof hole is introduced.

## Textbook Cross-Check

| Textbook item | Repository source |
| --- | --- |
| finite bracket choice and first inequality | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:972-981` |
| PDF screenshot | `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` |

The Lean theorem generalizes the displayed upper-bound inequality by also
proving the symmetric lower-bound needed for an absolute deviation norm.
