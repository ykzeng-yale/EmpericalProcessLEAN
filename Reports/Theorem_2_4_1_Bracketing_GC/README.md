# Theorem 2.4.1 Bracketing GC Formalization Report

Source theorem: van der Vaart and Wellner, *Weak Convergence and Empirical
Processes*, Theorem 2.4.1.

Current Lean status: proof-complete for VdV&W Theorem 2.4.1 in the
outer-almost-sure convergence mode.  The repository proves the
dependency-minimal theorem from primitive `N_[]` finiteness to an explicit
outer-a.s. `P`-Glivenko-Cantelli conclusion.  The separate outer-probability
convergence mode and the full Chapter 1 arbitrary-map machinery remain future
compatibility work.

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
| `VdVWOuterProbability`, `VdVWOuterAlmostSure`, `VdVWOuterAlmostSureUniformDeviationTendstoZeroOn`, `VdVWOuterAlmostSurePGlivenkoCantelliClass` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | explicit VdV&W outer-a.s. convergence-mode primitives |
| `VdVWConvergesInOuterProbabilityConst`, `VdVWConvergesInOuterProbability`, `vdVWConvergesInOuterProbability_of_tendstoInMeasure` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | generic Definition 1.10.1 outer-probability convergence primitives and mathlib bridge |
| `vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top`, `vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | exact Theorem 2.4.1 conclusion in the outer-a.s. mode |
| `VdVWOuterProbabilityUniformDeviationTendstoZeroOn`, `VdVWOuterProbabilityPGlivenkoCantelliClass`, `VdVWPGlivenkoCantelliClass` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | book-style GC predicate with outer-probability or outer-a.s. branches |
| `VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_tail` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | tail-event sufficient condition for the direct outer-probability branch |
| `VdVWUniformDeviationBadEvent`, `VdVWUniformDeviationBadTailEvent`, `VdVWUniformDeviationBadInfinitelyOftenEvent`, `vdVWUniformDeviationBadInfinitelyOften_subset_not_tendsto` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | bad-event vocabulary and limsup-to-failure implication |
| `VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn`, `vdVWOuterProbabilityUniformDeviationTailTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | conditional route from outer-a.s. convergence to direct outer-probability convergence under tail-continuity |
| `vdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn_of_isFiniteMeasure_of_nullMeasurable_badEvent`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_isFiniteMeasure_of_nullMeasurable_badEvent` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | derives the direct outer-probability branch from outer-a.s. convergence under finite-measure and fixed-bad-event null-measurability assumptions |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_nullMeasurable_badEvent` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | Theorem 2.4.1 in the direct outer-probability mode under the null-measurable bad-event bridge |
| `vdVWUniformDeviationBadEvent_nullMeasurableSet_of_countable_of_coordinate`, `vdVWUniformDeviationBadEvent_nullMeasurableSet_of_countable_of_aemeasurable_coordinate` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | derives fixed bad-event null measurability from countable-index coordinate measurability |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_countable_of_aemeasurable_coordinate`, `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_countable_of_aemeasurable_coordinate` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | direct outer-probability Theorem 2.4.1 for countable classes with coordinate a.e.-measurable deviations |
| `vdVW_theorem_2_4_1_glivenkoCantelli` | `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | Theorem 2.4.1 packaged into the book-style GC predicate through the outer-a.s. branch |

Detailed side-by-side audit table:

```text
Reports/Theorem_2_4_1_Bracketing_GC/definition_lemma_crosscheck.md
```

## Textbook Source Anchors

- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md`, lines 963-984.
- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md`, lines 1828-1834 for the GC definition.
- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md`, line 1406 for Definition 1.10.1.
- Markdown: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md`, line 1895 for Definition 2.1.6.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png`.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_gc_definition_pdf_page_96.png`.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_definition_1_10_1_pdf_page_72.png`.
- PDF screenshot: `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png`.

These source assets are local-only review material and are intentionally
excluded from the public Git history.

## Remaining Compatibility Work

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
11. a local almost-sure pathwise GC wrapper for the primitive `N_[]` theorem;
12. generic outer-probability convergence primitives matching Definition
    1.10.1, plus a bridge from mathlib `TendstoInMeasure`;
13. an explicit outer-a.s. `P`-Glivenko-Cantelli theorem matching the
    convergence mode used in the proof of Theorem 2.4.1;
14. a book-style `P`-Glivenko-Cantelli predicate whose branches are outer
    probability and outer-a.s., with Theorem 2.4.1 proved through the
    outer-a.s. branch;
15. a tail-event bridge proving that vanishing outer probability of future
    bad-event tails implies one-time outer-probability convergence;
16. a conditional route from outer-a.s. convergence to the direct
    outer-probability branch, assuming tail outer probabilities converge to
    the outer probability of the bad-infinitely-often event;
17. a proof that fixed bad-event null measurability plus finite sample-space
    measure gives the needed tail-continuity condition by mathlib continuity
    from above;
18. a direct outer-probability version of Theorem 2.4.1 under that
    null-measurable bad-event bridge;
19. a countable-class bridge deriving fixed bad-event null measurability from
    coordinate a.e.-measurability;
20. a direct outer-probability version of Theorem 2.4.1 for countable classes
    with coordinate a.e.-measurable empirical deviations.

The remaining compatibility layers are not needed for the outer-a.s. proof of
Theorem 2.4.1, but they are needed for broader Chapter 1 coverage:

1. deriving coordinate a.e.-measurability from concrete measurability
   assumptions on the empirical process and function class;
2. VdV&W measurable covers, outer expectation, and arbitrary-map convergence
   infrastructure for full textbook-order formalization.
