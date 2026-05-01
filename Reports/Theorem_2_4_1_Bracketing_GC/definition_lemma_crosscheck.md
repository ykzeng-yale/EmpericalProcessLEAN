# Definition And Lemma Cross-Check For Theorem 2.4.1

This report is the side-by-side audit surface for the currently proved Lean
layers toward VdV&W Theorem 2.4.1.

Source screenshot anchor:

```text
Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png
Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png
```

The screenshot and markdown/PDF files are local-only review assets and are
ignored by Git.

## Cross-Check Table

| Lean realization | Markdown textbook anchor | PDF screenshot anchor | Status and gap |
| --- | --- | --- | --- |
| `EmpiricalDeviationBoundOn`, `StatInference/EmpiricalProcess/Basic.lean`, definition of uniform in-class absolute deviation | Theorem 2.4.1 proof uses the supremum norm of empirical-population deviations, markdown `..._101-200.md:981-984` | `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` | Existing interface; not itself a textbook primitive |
| `EmpiricalDeviationSequenceOn`, `StatInference/EmpiricalProcess/Basic.lean`, sequence of restricted deviation bounds | Same proof passage, sample-size sequence implicit in `P_n`, markdown `..._101-200.md:974-984` | same screenshot | Existing interface; packages sample-size dependence |
| `GlivenkoCantelliClass`, `StatInference/EmpiricalProcess/Basic.lean`, proof-carrying GC interface with vanishing deterministic radius | Theorem conclusion that `F` is Glivenko-Cantelli, markdown `..._101-200.md:970` | same screenshot | Current interface is stronger/different than literal outer-a.s. textbook wording; final theorem still pending |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds`, `StatInference/EmpiricalProcess/Bracketing.lean`, theorem | Bracket comparison inequality after choosing a bracket, markdown `..._101-200.md:972-981` | same screenshot | Proved deterministic core; uses abstract endpoint risks rather than primitive measurable functions |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds`, `StatInference/EmpiricalProcess/Bracketing.lean`, theorem | Same inequality across `n`, markdown `..._101-200.md:974-984` | same screenshot | Proved sequence-level deterministic handoff |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero`, `StatInference/EmpiricalProcess/Bracketing.lean`, construction | Final proof step after endpoint convergence and shrinking width, markdown `..._101-200.md:984` | same screenshot | Proved construction once endpoint and width radii are supplied |
| `FiniteBracketingEndpointRoute`, `StatInference/EmpiricalProcess/Bracketing.lean`, structure | Finite family of brackets chosen from finite bracketing number, markdown `..._101-200.md:972` | same screenshot | Proof-carrying interface; construction from `N_[]` still pending |
| `FiniteBracketingEndpointRoute.finiteBracketMarker`, `StatInference/EmpiricalProcess/Bracketing.lean`, definition | Finitely many brackets, markdown `..._101-200.md:972` | same screenshot | Proved finite-index marker from `[Fintype Bracket]` |
| `FiniteBracketingEndpointRoute.toEmpiricalDeviationSequenceOn`, `StatInference/EmpiricalProcess/Bracketing.lean`, theorem | Uniform deviation bound from finite bracket endpoint control, markdown `..._101-200.md:974-984` | same screenshot | Proved |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass`, `StatInference/EmpiricalProcess/Bracketing.lean`, construction | GC conclusion from route and vanishing radii, markdown `..._101-200.md:984` | same screenshot | Proved route-to-GC conversion |
| `endpoint_strong_law_ae_real`, `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`, theorem | "strong law of large numbers for real variables", markdown `..._101-200.md:984` | same screenshot | Proved wrapper around mathlib SLLN |
| `finite_endpoint_strong_law_ae_real`, `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`, theorem | finitely many endpoint functions, markdown `..._101-200.md:972-984` | same screenshot | Proved finite-family endpoint SLLN |

## Pending Primitive Cross-Checks

These are not yet promoted Lean proofs, so they should not be reported as
complete.

| Pending Lean target | Markdown anchor | Screenshot needed |
| --- | --- | --- |
| primitive function bracket and membership | Definition 2.1.6, `..._1-100.md:1895` | `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png` |
| epsilon bracket and bracketing number `N_[]` | Definition 2.1.6, `..._1-100.md:1895` | `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png` |
| exact `L1(P)` width | Definition 2.1.6 plus Theorem 2.4.1, `..._101-200.md:970-984` | `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png` and `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` |
| final finite-bracketing GC theorem | Theorem 2.4.1, `..._101-200.md:970-984` | `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` |

## Promotion Rule

A row may move from pending to complete only after:

1. the Lean declaration compiles;
2. the proof-hole scan has no `sorry`, `admit`, `axiom`, or `unsafe`;
3. the report gives the declaration, local markdown line range, and local PDF
   screenshot path;
4. the gap note says whether the declaration is the exact textbook theorem or
   a proved layer toward it.
