# Theorem 2.4.1 Bracketing GC Formalization Report

Source theorem: van der Vaart and Wellner, *Weak Convergence and Empirical
Processes*, Theorem 2.4.1.

Current Lean status: partially formalized, proof-complete for the layers listed
below.  The repository does **not** yet claim the full theorem
`N_[](ε, F, L1(P)) < ∞ for every ε > 0 -> F is Glivenko-Cantelli`.

## Proved Lean Layers

| Lean declaration | File | Status |
| --- | --- | --- |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` | `StatInference/EmpiricalProcess/Bracketing.lean` | proved |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds` | `StatInference/EmpiricalProcess/Bracketing.lean` | proved |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero` | `StatInference/EmpiricalProcess/Bracketing.lean` | proof-carrying conversion |
| `FiniteBracketingEndpointRoute` | `StatInference/EmpiricalProcess/Bracketing.lean` | definition |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass` | `StatInference/EmpiricalProcess/Bracketing.lean` | proof-carrying conversion |
| `endpoint_strong_law_ae_real` | `StatInference/EmpiricalProcess/EndpointStrongLaw.lean` | proved from mathlib |
| `finite_endpoint_strong_law_ae_real` | `StatInference/EmpiricalProcess/EndpointStrongLaw.lean` | proved from mathlib |

## Textbook Source Anchors

- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md`, lines 963-984.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png`.

These source assets are local-only review material and are intentionally
excluded from the public Git history.

## Remaining Gap To Full Theorem 2.4.1

The proved Lean code currently supplies:

1. the deterministic bracketing inequality;
2. the sequence-level deterministic handoff;
3. endpoint strong-law wrappers for finitely many real-valued endpoints;
4. a proof-carrying finite-bracketing route into the current GC interface.

The next primitive layers needed for the literal textbook theorem are:

1. define function brackets `[l, u]` over measurable functions;
2. define `L1(P)` bracket width as an integral or `L1` norm;
3. define `N_[](ε, F, L1(P))`;
4. prove that finite bracketing number gives a finite endpoint family;
5. connect empirical averages from actual samples to endpoint empirical risks;
6. combine finite endpoint strong laws with the deterministic bracketing route;
7. choose a decreasing radius sequence to remove the fixed `ε`.
