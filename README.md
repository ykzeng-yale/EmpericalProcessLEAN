# EmpericalProcessLEAN

Public repository:

```text
https://github.com/ykzeng-yale/EmpericalProcessLEAN
```

Local working copy:

```text
/Users/yukang/Desktop/AI for Math/EmpericalProcessLEAN
```

This is the clean Lean/textbook workspace for progressively formalizing
empirical process theory from van der Vaart and Wellner, *Weak Convergence and
Empirical Processes*.

The long-run target is a source-audited, bottom-up Lean library for the
empirical-process results needed in theoretical statistics and theoretical ML:
Glivenko-Cantelli classes, bracketing, finite approximation, empirical
deviation bounds, Donsker-level interfaces, and downstream consistency
theorems.  We rely on mathlib for foundational mathematics such as real
analysis, topology, measure theory, probability, filters, finite sums, and
available limit theorems.  We do not treat the empirical-process-specific
theory as an assumption: any missing definition, lemma, or theorem needed for
the VdV&W route should be built and proved locally.

## Scope

This repository is intentionally limited to:

- Lean library files for empirical process formalization and the minimal local
  support lemmas imported by that formalization.
- Local-source manifests for the VdV&W markdown/PDF/screenshot materials.
- Theorem proof reports that cross-check fully proved textbook theorem/lemma
  declarations against textbook markdown and PDF screenshots.
- Build files for a reproducible Lean/mathlib environment.

This repository intentionally excludes:

- agent orchestration code;
- training, RL, DPO, GRPO, or benchmark-generation pipelines;
- AXLE wrappers, API keys, or external prover-service glue;
- `AI-Statistician` application code, tests, and blueprint machinery;
- old local non-empirical-process theorem-development modules from estimator,
  causal, semiparametric, benchmark, or example directions;
- agent secrets, generated model-training artifacts, and unrelated theorem
  development files.

The textbook PDF, markdown conversion, and selected screenshots live under
`Textbooks/Vaart1996/` as source-audit anchors because the user explicitly
requested that these public textbook assets be included.  Generated report PDFs
remain local build artifacts and are ignored by Git.

## Repository Layout

```text
StatInference/
  Asymptotics/          minimal deterministic support lemmas
  EmpiricalProcess/     active VdV&W formalization layer
Reports/
  Theorem_2_4_1_Bracketing_GC/
  VdVW_<item-number>_<short_slug>/
Textbooks/
  Vaart1996/
docs/
lakefile.lean
lake-manifest.json
lean-toolchain
```

The active development area is currently:

```text
StatInference/EmpiricalProcess/
```

The active theorem report is:

```text
Reports/Theorem_2_4_1_Bracketing_GC/
```

The current status and remaining-work ledger through Theorem 2.4.1 is:

```text
docs/vdvw_to_2_4_1_formalization_status.md
```

The comprehensive inventory of every named VdV&W item through Theorem 2.4.1,
including the pinned mathlib reuse audit, is:

```text
docs/vdvw_pre_2_4_1_named_item_inventory.md
```

The Chapter 1-2 theorem-level blueprint and gap audit is:

```text
docs/vdvw_chapter1_2_formalization_blueprint.md
```

The visual progress dashboard for Chapter 1-2 is:

```text
docs/vdvw_chapter1_2_progress_dashboard.md
```

## Lean And Mathlib Base

The project uses Lean through Lake.

- Lean toolchain: `leanprover/lean4:v4.30.0-rc2`.
- Primary dependency: `mathlib`.
- The pinned mathlib revision is recorded in `lake-manifest.json`.

Current mathlib foundations used or expected:

- real ordered algebra and inequalities;
- filters and `Tendsto`;
- topology;
- measure theory and integration;
- probability measures;
- finite types and finite sums;
- available strong-law infrastructure.

There is not currently a ready-made mathlib theorem in this repository that
states VdV&W Theorem 2.4.1 directly as a bracketing-number Glivenko-Cantelli
theorem.  The missing empirical-process-specific layer is being built locally.
The local inventory currently tracks 7993 pinned mathlib Lean files, including
1870 files under `MeasureTheory`, `Probability`, `Topology`, and `Analysis`.

## Source Audit Policy

Every exact textbook theorem or lemma that is fully proved in Lean must have a
report under `Reports/`.  Intermediate proof layers and compatibility wrappers
are tracked in `docs/` or the active blueprint until the exact textbook item is
complete.  Each report should include:

1. Lean declaration name, file path, and proof status.
2. Every new definition, lemma, structure, or theorem introduced for that
   proof.
3. Local markdown source path and line range from the textbook extraction.
4. Local PDF source path and local screenshot path for the corresponding
   textbook passage.
5. `source_screenshots.md` with the real local screenshot images embedded for
   visual review.
6. A locally compiled `report.pdf` generated from the report markdown and the
   embedded screenshots.  This artifact is ignored by Git because it contains
   textbook-derived images.
7. A gap note saying what broader textbook-order compatibility work remains.

The source material is tracked under:

```text
Textbooks/Vaart1996/Markdown/
Textbooks/Vaart1996/PDF/
Textbooks/Vaart1996/Screenshots/
```

These paths are intentional source-audit anchors for cross-checking Lean
formalizations against the textbook.  Compiled report PDFs that embed
screenshots remain generated artifacts and are ignored by Git.

## Current Formalization Target

The first major target, VdV&W Theorem 2.4.1, is now proved in the local
book-style Glivenko-Cantelli predicate:

```text
finite L1(P) bracketing numbers at every positive radius
  -> the function class is Glivenko-Cantelli
```

The current target is now broader: progressively formalize Chapter 1 and
Chapter 2 theorem-level results, using mathlib foundations where available and
building VdV&W-specific empirical-process primitives locally when not
available.

The completed Theorem 2.4.1 proof has the following formalization shape:

1. Fix a positive bracket radius.
2. Choose finitely many brackets covering the class.
3. For each function in the class, compare its empirical-population deviation
   against the deviation of the bracket endpoints plus the bracket width.
4. Use the strong law for the finitely many endpoint functions.
5. Repeat the lower-bound argument.
6. Let the bracket radius decrease to zero.

The repository proves source-audited theorem layers used by this proof and the
final primitive theorem from the bracketing number `N_[]`.

The full textbook-order target through Theorem 2.4.1 is larger than the direct
proof path: Chapter 1's weak-convergence and outer-probability foundations,
then Sections 2.1-2.3, then the 2.4.1 bracketing theorem.  The direct route to
2.4.1 will reuse mathlib foundations first and build only the missing
empirical-process primitives locally.

## Current Proved Layers

All promoted Lean code currently builds with no `sorry`, `admit`, `axiom`, or
`unsafe` in the `StatInference` sources.

Proved declarations toward VdV&W Theorem 2.4.1:

- `empiricalDeviationBoundOn_of_bracket_endpoint_bounds`
  in `StatInference/EmpiricalProcess/Bracketing.lean`.
- `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds`
  in `StatInference/EmpiricalProcess/Bracketing.lean`.
- `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero`
  in `StatInference/EmpiricalProcess/Bracketing.lean`.
- `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass`
  in `StatInference/EmpiricalProcess/Bracketing.lean`.
- `FunctionBracket`, `MemFunctionBracket`, `l1BracketWidth`, and
  `IsL1EpsilonBracket`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `FiniteBracketCover`, `FiniteL1BracketCover`, and
  `FiniteL1BracketCover.toFiniteBracketingEndpointRoute`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `FiniteL1BracketCoverAtCard` and `HasFiniteL1BracketingNumber`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `l1BracketingNumber` and
  `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `finiteEndpointRadius`, `exists_endpointRadius_of_finite_endpoint_tendsto`,
  `FiniteL1BracketCover.endpointRadius`, and
  `FiniteL1BracketCover.exists_endpointRadius_of_endpoint_tendsto`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `PrimitiveFiniteBracketingGCRoute.ofFiniteCoversAndEndpointTendsto` and
  `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `CountablePrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn`
  in `StatInference/EmpiricalProcess/BracketingCountable.lean`.
- `endpoint_strong_law_ae_real`
  in `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`.
- `finite_endpoint_strong_law_ae_real`
  in `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`.
- `samplePath`, `endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid`,
  `FiniteL1BracketCover.exists_endpointRadius_ae_of_iid`, and
  `uniformDeviationTendstoZeroOn_ae_of_iid_countable_covers`,
  `uniformDeviationTendstoZeroOn_ae_of_iid_l1BracketingNumber_lt_top`
  in `StatInference/EmpiricalProcess/EndpointSamples.lean`.
- `VdVWOuterProbability`, `VdVWOuterAlmostSure`,
  `VdVWConvergesInOuterProbabilityConst`,
  `vdVWConvergesInOuterProbability_iff_tendstoInMeasure`,
  `tendstoInDistribution_of_vdVWConvergesInOuterProbability`, and
  `vdVW_theorem_2_4_1_glivenkoCantelli`
  in `StatInference/EmpiricalProcess/GlivenkoCantelli.lean`.
- `VdVWOuterProbability_eq_outerExpectation_eventIndicator` and
  `VdVWOuterAlmostSure_iff_outerExpectation_exceptional_eq_zero`
  in `StatInference/EmpiricalProcess/OuterProbabilityExpectation.lean`.
- `VdVWMeasurableMajorant`, `VdVWOuterExpectation`,
  `VdVWMeasurableCover`, `VdVWOuterExpectation_eq_lintegral_cover`,
  `VdVWMeasurableCover.addOfMeasurableLeft`,
  `VdVWMeasurableCover.addOfMeasurableRight`,
  `VdVWOuterExpectation_eq_lintegral_add_cover_of_left_measurable_finite`,
  `VdVWOuterExpectation_eq_lintegral_add_cover_of_right_measurable_finite`,
  `VdVWOuterExpectation_eventIndicator_eq_measure`, and
  `VdVWMeasurableSetCover.exists_measurableSet_superset_measure_eq`,
  `VdVWMeasurableSetCover.toEventIndicatorCover`,
  `VdVWMeasurableSetCover.complToEventIndicatorLowerCover`,
  `VdVWInnerExpectation_eq_lintegral_eventIndicator_complSetCover`,
  `lintegral_eventIndicator_complSetCover_eq_innerProbability`,
  `VdVWOuterExpectation_eq_lintegral_eventIndicator_setCover`,
  `lintegral_eventIndicator_setCover_eq_measure`,
  `lintegral_eventIndicator_toMeasurable_eq_measure`,
  `measure_compl_toMeasurable_compl_eq_innerProbability`,
  `measure_compl_setCover_eq_innerProbability`,
  `VdVWEventIndicator_setCover_add_compl`,
  `VdVWMeasurableCover.eventIndicatorOfToMeasurable`,
  `VdVWInnerExpectation_eventIndicator_add_outerExpectation_compl`, and
  `VdVWInnerExpectation_eventIndicator_add_outerExpectation_compl_eq_one`
  in `StatInference/EmpiricalProcess/OuterExpectation.lean`.
- `realHalfLineIndicator`, `realOpenHalfLineIndicator`,
  `realHalfLineBracket`, `realHalfLineBracket_mem_indicator_of_le_lt`,
  `integrable_realHalfLineIndicator`,
  `integrable_realOpenHalfLineIndicator`,
  `abs_realHalfLineBracket_endpoint_gap_eq_indicator_Ioo`, and
  `realHalfLineBracket_l1Width_eq_measureReal_Ioo`,
  `SuppliedRealHalfLineGrid.toFiniteL1BracketCoverAtCard`,
  `SuppliedRealHalfLineGrid.hasFiniteL1BracketingNumber`, and
  `SuppliedRealHalfLineGrid.l1BracketingNumber_lt_top`,
  `eRealClosedHalfLineIndicator`,
  `eRealOpenHalfLineIndicator`,
  `eRealHalfLineBracket`,
  `eRealOpenCell`,
  `measurableSet_eRealOpenCell`,
  `eRealOpenCell_coe_coe`,
  `eRealOpenCell_bot_coe`,
  `eRealOpenCell_coe_top`,
  `eRealOpenCell_bot_top`,
  `measureReal_eRealOpenCell_coe_coe`,
  `measureReal_eRealOpenCell_bot_coe`,
  `measureReal_eRealOpenCell_coe_top`,
  `measureReal_eRealOpenCell_bot_top`,
  `eRealHalfLineBracket_mem_realIndicator_of_le_lt`,
  `abs_eRealHalfLineBracket_endpoint_gap_eq_indicator_openCell`,
  `eRealHalfLineBracket_l1Width_eq_measureReal_openCell`,
  `SuppliedERealHalfLineEndpointGrid`,
  `SuppliedERealHalfLineEndpointGrid.toSuppliedERealHalfLineGrid`,
  `SuppliedERealHalfLineEndpointGrid.hasFiniteL1BracketingNumber`,
  `SuppliedERealHalfLineEndpointGrid.l1BracketingNumber_lt_top`,
  `SuppliedERealHalfLineEndpointGrid.l1BracketingNumber_lt_top_forall`,
  `SuppliedERealHalfLineEndpointGrid.exists_suppliedERealHalfLineGrid_of_forall`,
  `SuppliedERealHalfLineGrid.singleCell`,
  `SuppliedERealHalfLineGrid.exists_singleCell_of_measureReal_univ_lt`,
  `SuppliedERealHalfLineGrid.toFiniteL1BracketCoverAtCard`,
  `SuppliedERealHalfLineGrid.hasFiniteL1BracketingNumber`, and
  `SuppliedERealHalfLineGrid.l1BracketingNumber_lt_top`,
  `SuppliedERealHalfLineGrid.l1BracketingNumber_lt_top_of_measureReal_univ_lt`,
  `SuppliedERealHalfLineGrid.l1BracketingNumber_lt_top_forall`
  in `StatInference/EmpiricalProcess/RealHalfLine.lean`.
- `vdVW_realHalfLine_outerAlmostSureGlivenkoCantelli_of_suppliedERealHalfLineGrids`,
  `vdVW_realHalfLine_glivenkoCantelli_of_suppliedERealHalfLineGrids`,
  `vdVW_realHalfLine_outerAlmostSureGlivenkoCantelli_of_suppliedERealHalfLineEndpointGrids`,
  and `vdVW_realHalfLine_glivenkoCantelli_of_suppliedERealHalfLineEndpointGrids`
  in `StatInference/EmpiricalProcess/RealHalfLineGC.lean`.

These prove the deterministic bracket-comparison route, the finite endpoint
strong-law wrapper, the fixed-cover iid sample-path endpoint bridge, and the
endpoint-convergence-to-radius bridge, including a countable decreasing-cover
route, the primitive `N_[]` hypothesis theorem, VdV&W-style outer probability
and outer-a.s. wrappers, and the book-style Theorem 2.4.1 predicate.  The
new Example 2.4.2 layer proves the pointwise and `L1(P)` facts for real
half-line indicator brackets, adds `EReal` endpoint brackets for `-∞`/`∞`,
proves the extended-open-cell width identity, and connects supplied finite
real or extended-real grids to the primitive bracketing-number witness,
including the all-positive-radius handoff needed by Theorem 2.4.1 and the
conditional half-line Glivenko-Cantelli corollary from supplied grids;
it also proves the adjacent-endpoint grid handoff, the endpoint-grid
conditional GC corollary, and the one-cell base case for radii above the total
mass.
Construction of the general distribution-dependent grid is still pending.
They are real Lean proofs, not placeholders.

## Current Chapter 1-2 Gap

The remaining project gap is no longer the direct proof of Theorem 2.4.1.  The
remaining gap is comprehensive Chapter 1-2 coverage:

1. exact Chapter 1 arbitrary-map outer expectation, inner probability,
   measurable cover, and Fubini-compatible machinery;
2. exact arbitrary-map weak-convergence wrappers around mathlib Portmanteau,
   Prokhorov, convergence-in-measure, convergence-in-distribution, continuous
   mapping, and Slutsky foundations;
3. Chapter 2 covering/packing, Orlicz, symmetrization, measurable-class,
   entropy, VC, Donsker, multiplier, bracketing CLT, and maximal-inequality
   theorems;
4. one source-audited report per fully proved exact textbook theorem or lemma.

The active blueprint for this is
`docs/vdvw_chapter1_2_formalization_blueprint.md`.

## Progressive VdV&W Formalization Roadmap

The intended path is not to translate the whole book linearly in one pass.  The
working strategy is bottom-up and theorem-driven:

### Stage A: Core empirical process interfaces

- empirical averages and empirical measures;
- population expectations/risks;
- uniform empirical deviations;
- Glivenko-Cantelli class interfaces;
- finite endpoint and finite-class reductions.

### Stage B: Bracketing GC route

- brackets and bracket membership;
- `L1(P)` bracket widths;
- bracketing numbers;
- VdV&W Theorem 2.4.1;
- examples such as indicator intervals and other finite-bracketing classes.

### Stage C: Entropy and maximal-inequality route

- covering numbers and entropy interfaces, starting from
  `vdVWCoveringNumber` and semimetric covering/packing wrappers around
  mathlib external covering and packing numbers;
- symmetrization;
- maximal inequalities;
- random entropy GC theorem;
- reusable finite approximation lemmas.

### Stage D: Donsker-level interfaces

- empirical-process weak convergence interfaces;
- stochastic equicontinuity;
- bracketing entropy Donsker theorem;
- covering entropy Donsker theorem;
- measurable/separable variants where needed.

Downstream estimator, semiparametric, or causal applications are intentionally
out of the current public Lean tree until the empirical-process backbone is
strong enough to support them cleanly.

Each stage should produce Lean declarations.  Theorem reports are created only
when an exact textbook theorem or lemma is complete.  A theorem is only
"promoted" when it compiles, is free of proof holes, and has a source
crosswalk.

## Promotion Gate

A theorem or lemma is promoted only if:

- `lake build` succeeds;
- the declaration has no `sorry`, `admit`, `axiom`, or `unsafe`;
- introduced assumptions are explicit and non-vacuous where possible;
- the theorem is linked to a markdown/PDF source anchor when it is textbook
  derived;
- intermediate theorem layers are recorded in status docs until absorbed into
  an exact theorem/lemma report.

## Verification

Run:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" StatInference StatInference.lean
```

Current expected result:

```text
Build completed successfully.
```

The proof-hole scan should return no matches.

## Current Status Summary

- Repository created and pushed to GitHub.
- Agent/training/AXLE machinery removed from scope.
- Vaart markdown/PDF/screenshot assets are tracked under `Textbooks/Vaart1996/`
  as source-audit anchors.
- Lean library currently builds.
- Current source-audited focus has expanded to Chapter 1-2 theorem-level
  formalization.
- The Chapter 1-2 blueprint lists all 156 theorem-level items extracted from
  the local markdown and classifies current coverage.
- Deterministic bracketing inequality, primitive bracket/finite-cover layer,
  primitive cover-to-route bridge, and finite endpoint strong-law wrappers are
  proved.
- The direct dependency-minimal Theorem 2.4.1 route from primitive `N_[]`
  definitions is proved;
  the next targets are Chapter 1 arbitrary-map infrastructure,
  distribution-dependent grid construction for Example 2.4.2, the exact
  empirical-CDF example report, and the next Chapter 2 GC/bracketing results.
