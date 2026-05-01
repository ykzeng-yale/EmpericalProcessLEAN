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
| `FunctionBracket`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, primitive bracket endpoint structure | Definition 2.1.6 bracket `[l, u]`, markdown `..._1-100.md:1895` | `Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png` | Proved/compiled primitive object layer; not the final theorem |
| `FunctionBracket.Mem`, `MemFunctionBracket`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, pointwise bracket-membership predicate | Definition 2.1.6 functions satisfying `l <= f <= u`, markdown `..._1-100.md:1895` | same Definition 2.1.6 screenshot | Proved/compiled primitive membership layer |
| `FunctionBracket.lowerIntegral`, `FunctionBracket.upperIntegral`, `populationRiskOfFunction`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, population integral definitions | Theorem 2.4.1 proof uses `P f`, `P l`, and `P u`, markdown `..._101-200.md:970-981` | theorem screenshot | Proved/compiled integral vocabulary using mathlib Bochner integral |
| `FunctionBracket.l1Width`, `l1BracketWidth`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, `L1(P)` bracket width as the integral of `abs (u - l)` | Definition 2.1.6 epsilon bracket width, markdown `..._1-100.md:1895`; Theorem 2.4.1 `L1(P)` hypothesis, markdown `..._101-200.md:970` | Definition 2.1.6 and theorem screenshots | Proved/compiled width primitive; minimal bracketing number still pending |
| `IsL1EpsilonBracket`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, predicate for width `< epsilon` | Definition 2.1.6 epsilon bracket, markdown `..._1-100.md:1895` | Definition 2.1.6 screenshot | Proved/compiled epsilon-bracket primitive |
| `FunctionBracket.lowerIntegral_le_integral_of_mem`, `FunctionBracket.integral_le_upperIntegral_of_mem`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, population monotonicity lemmas | Theorem 2.4.1 proof compares bracket endpoint expectations with member expectations, markdown `..._101-200.md:972-981` | theorem screenshot | Proved using mathlib `integral_mono` with explicit integrability assumptions |
| `FunctionBracket.population_gap_le_l1Width_of_mem`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, population endpoint gap bounded by `L1(P)` width | Theorem 2.4.1 proof uses bracket width to control `P(u-l)`, markdown `..._101-200.md:972-981` | both screenshots | Proved using mathlib `integral_sub` and pointwise bracket order |
| `FunctionBracket.empiricalAverage_mono`, `FunctionBracket.lowerEmpirical_le_empiricalAverage_of_mem`, `FunctionBracket.empiricalAverage_le_upperEmpirical_of_mem`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, empirical finite-sum monotonicity lemmas | Theorem 2.4.1 proof compares `P_n l`, `P_n f`, `P_n u`, markdown `..._101-200.md:972-981` | theorem screenshot | Proved using finite sums and nonnegative division by sample size |
| `FiniteBracketCover`, `FiniteBracketCover.exists_mem`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, finite chosen bracket cover | Definition 2.1.6 cover by finitely many brackets, markdown `..._1-100.md:1895`; proof finite bracket choice, markdown `..._101-200.md:972` | both screenshots | Proved/compiled finite-cover witness layer |
| `FiniteL1BracketCover`, `FiniteL1BracketCover.lowerPopulation`, `upperPopulation`, `lowerEmpirical`, `upperEmpirical`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, finite `L1(P)` cover with integrable endpoints | Definition 2.1.6 finite epsilon brackets and Theorem 2.4.1 `L1(P)` setting | both screenshots | Proved/compiled finite `L1(P)` cover layer; bracketing number value still pending |
| `FiniteL1BracketCoverAtCard`, `HasFiniteL1BracketingNumber`, `exists_finiteL1BracketCover_of_hasFiniteL1BracketingNumber`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, explicit-cardinality finite bracketing witness | Definition 2.1.6 minimum number of epsilon brackets, markdown `..._1-100.md:1895`; Theorem 2.4.1 finite bracketing hypothesis, markdown `..._101-200.md:970-972` | both screenshots | Proved/compiled finite-witness layer behind `N_[]` |
| `finiteL1BracketingNumberCard`, `l1BracketingNumber`, `l1BracketingNumber_eq_find`, `l1BracketingNumber_find_spec`, `l1BracketingNumber_lt_top_of_hasFinite`, `hasFinite_of_l1BracketingNumber_lt_top`, `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, numeric bracketing number and finiteness bridge | Definition 2.1.6 bracketing number `N_[]`, markdown `..._1-100.md:1895`; Theorem 2.4.1 hypothesis `N_[] < infinity`, markdown `..._101-200.md:970` | both screenshots | Proved/compiled primitive numeric `N_[]` as `ℕ∞`; entropy/logarithm not formalized |
| `finiteEndpointRadius`, `finiteEndpointRadius_tendsto_zero`, `upper_endpoint_error_le_finiteEndpointRadius`, `lower_endpoint_error_le_finiteEndpointRadius`, `exists_endpointRadius_of_finite_endpoint_tendsto`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, finite endpoint-radius bridge | Theorem 2.4.1 endpoint SLLN handoff and finite bracket family, markdown `..._101-200.md:972-984` | theorem screenshot | Proved generic finite-family bridge: endpoint convergence for each bracket endpoint gives one vanishing radius controlling all endpoint errors |
| `FiniteL1BracketCover.endpointRadius`, `FiniteL1BracketCover.endpointRadius_tendsto_zero_of_endpoint_tendsto`, `FiniteL1BracketCover.upper_endpoint_error_le_endpointRadius`, `FiniteL1BracketCover.lower_endpoint_error_le_endpointRadius`, `FiniteL1BracketCover.exists_endpointRadius_of_endpoint_tendsto`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, primitive-cover endpoint-radius bridge | Theorem 2.4.1 proof uses the finite cover endpoints and the law of large numbers, markdown `..._101-200.md:972-984` | theorem screenshot | Proved cover-specific bridge from endpoint convergence to endpoint-bound route fields |
| `FiniteL1BracketCover.empiricalDeviationBoundOn_of_endpoint_bounds`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, one-sample primitive cover-to-deviation theorem | Deterministic bracket inequality in proof, markdown `..._101-200.md:972-981` | theorem screenshot | Proved by instantiating `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` with primitive brackets |
| `FiniteL1BracketCover.empiricalDeviationSequenceOn_of_endpoint_bounds`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, sequence-level primitive cover-to-deviation theorem | Same inequality across `n`, markdown `..._101-200.md:974-984` | theorem screenshot | Proved sequence-level primitive handoff |
| `FiniteL1BracketCover.toFiniteBracketingEndpointRoute`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, constructor into existing route | Finite bracket cover plus endpoint control used in proof, markdown `..._101-200.md:972-984` | theorem screenshot | Proved connector from primitive cover to `FiniteBracketingEndpointRoute` |
| `UniformDeviationTendstoZeroOn`, `PrimitiveFiniteBracketingGCRoute`, `PrimitiveFiniteBracketingGCRoute.ofFiniteCoversAndEndpointTendsto`, `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn`, `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn_ofFiniteCoversAndEndpointTendsto`, `StatInference/EmpiricalProcess/BracketingPrimitive.lean`, epsilon/eventual deterministic bracketing route | Final epsilon argument in proof after fixed finite cover and endpoint convergence, markdown `..._101-200.md:984` | theorem screenshot | Proved pathwise deterministic epsilon/eventual layer from finite covers and endpoint convergence; still not the full outer-a.s. textbook theorem from `N_[]` |

## Pending Primitive Cross-Checks

These are not yet promoted Lean proofs, so they should not be reported as
complete.

| Pending Lean target | Markdown anchor | Screenshot needed |
| --- | --- | --- |
| construct endpoint convergence assumptions from actual iid samples and mathlib SLLN for each finite cover | Theorem 2.4.1 proof endpoint SLLN, `..._101-200.md:984` | theorem screenshot |
| final finite-bracketing GC theorem | Theorem 2.4.1, `..._101-200.md:970-984` | `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` |

## Promotion Rule

A row may move from pending to complete only after:

1. the Lean declaration compiles;
2. the proof-hole scan has no `sorry`, `admit`, `axiom`, or `unsafe`;
3. the report gives the declaration, local markdown line range, and local PDF
   screenshot path;
4. the gap note says whether the declaration is the exact textbook theorem or
   a proved layer toward it.
