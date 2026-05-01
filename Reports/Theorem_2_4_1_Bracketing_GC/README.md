# Theorem 2.4.1 Bracketing GC Formalization Report

Source theorem: van der Vaart and Wellner, *Weak Convergence and Empirical
Processes*, Theorem 2.4.1.

Current Lean status: partially formalized, proof-complete for the layers listed
below.  The repository does **not** yet claim the full theorem
in VdV&W's exact outer-probability terminology, but it now proves the
dependency-minimal theorem from primitive `N_[]` finiteness to a named
almost-sure pathwise Glivenko-Cantelli wrapper in the local interface.

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
| `samplePath`, `endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid` | `StatInference/EmpiricalProcess/EndpointSamples.lean` | iid sample-path endpoint SLLN bridge |
| `FiniteL1BracketCover.endpoint_tendsto_ae_of_iid`, `FiniteL1BracketCover.exists_endpointRadius_ae_of_iid` | `StatInference/EmpiricalProcess/EndpointSamples.lean` | fixed-cover iid endpoint convergence bridge |
| `FunctionBracket`, `MemFunctionBracket`, `l1BracketWidth`, `IsL1EpsilonBracket` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive bracketing definitions |
| `FiniteBracketCover`, `FiniteL1BracketCover` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | finite primitive cover definitions |
| `FiniteL1BracketCoverAtCard`, `HasFiniteL1BracketingNumber` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | explicit-cardinality finite bracketing witness |
| `l1BracketingNumber`, `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive numeric `N_[]` and finite-cover bridge |
| `finiteEndpointRadius`, `exists_endpointRadius_of_finite_endpoint_tendsto` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | finite endpoint convergence to one vanishing endpoint radius |
| `FiniteL1BracketCover.endpointRadius`, `FiniteL1BracketCover.exists_endpointRadius_of_endpoint_tendsto` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive-cover endpoint-radius bridge |
| `FiniteL1BracketCover.empiricalDeviationBoundOn_of_endpoint_bounds` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive cover-to-deviation theorem |
| `FiniteL1BracketCover.toFiniteBracketingEndpointRoute` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive cover-to-route construction |
| `PrimitiveFiniteBracketingGCRoute.ofFiniteCoversAndEndpointTendsto`, `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | epsilon/eventual deterministic bracketing layer from finite covers and endpoint convergence |
| `CountablePrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | `StatInference/EmpiricalProcess/BracketingCountable.lean` | countable decreasing finite-cover route |
| `uniformDeviationTendstoZeroOn_ae_of_iid_countable_covers` | `StatInference/EmpiricalProcess/EndpointSamples.lean` | iid countable-cover almost-sure uniform convergence layer |
| `uniformDeviationTendstoZeroOn_ae_of_iid_l1BracketingNumber_lt_top` | `StatInference/EmpiricalProcess/EndpointSamples.lean` | primitive `N_[]` to a.s. pathwise uniform convergence theorem |
| `AlmostSureUniformDeviationTendstoZeroOn`, `VdVWAlmostSureGlivenkoCantelliClass` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | local almost-sure pathwise GC wrapper definitions |
| `almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top`, `vdVWAlmostSureGlivenkoCantelliClass_of_iid_l1BracketingNumber_lt_top` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | primitive `N_[]` theorem packaged as local a.s. pathwise Glivenko-Cantelli conclusion |

Detailed side-by-side audit table:

```text
Reports/Theorem_2_4_1_Bracketing_GC/definition_lemma_crosscheck.md
```

## Textbook Source Anchors

- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md`, lines 963-984.
- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md`, lines 1828-1834 for the GC definition.
- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md`, line 1895 for Definition 2.1.6.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png`.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_gc_definition_pdf_page_96.png`.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png`.

These source assets are local-only review material and are intentionally
excluded from the public Git history.

## Remaining Gap To Full Theorem 2.4.1

The proved Lean code currently supplies:

1. the deterministic bracketing inequality;
2. the sequence-level deterministic handoff;
3. endpoint strong-law wrappers for finitely many real-valued endpoints;
4. primitive function brackets, `L1(P)` width, epsilon brackets, and finite
   primitive cover witnesses;
5. primitive cover-to-deviation and primitive cover-to-route constructors;
6. iid sample-path endpoint convergence for a fixed finite bracket cover;
7. endpoint convergence to one finite endpoint-radius sequence;
8. a proof-carrying finite-bracketing route into the current GC interface;
9. countable/decreasing finite-cover assembly with iid endpoint SLLNs;
10. cover selection from primitive `l1BracketingNumber ε < ⊤` at the sequence
    of radii `1 / (n + 1)`;
11. a local almost-sure pathwise GC wrapper for the primitive `N_[]` theorem.

The remaining primitive layer for the literal textbook wording is:

1. define VdV&W-style outer probability, measurable covers, and outer-a.s.
   convergence for possibly nonmeasurable empirical-process suprema, then
   connect the local ordinary a.s. pathwise theorem to that exact wrapper.
