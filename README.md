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
- Theorem proof reports that cross-check Lean declarations against textbook
  markdown and PDF screenshots.
- Build files for a reproducible Lean/mathlib environment.

This repository intentionally excludes:

- agent orchestration code;
- training, RL, DPO, GRPO, or benchmark-generation pipelines;
- AXLE wrappers, API keys, or external prover-service glue;
- `AI-Statistician` application code, tests, and blueprint machinery;
- old local non-empirical-process theorem-development modules from estimator,
  causal, semiparametric, benchmark, or example directions;
- copyrighted textbook PDF/markdown/screenshot assets from the public Git
  history.

The actual textbook PDF, markdown conversion, and screenshots may exist in the
local working tree for private review, but they are ignored by Git.

## Repository Layout

```text
StatInference/
  Asymptotics/          minimal deterministic support lemmas
  EmpiricalProcess/     active VdV&W formalization layer
Reports/
  Theorem_2_4_1_Bracketing_GC/
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

Every promoted theorem or theorem layer must have a report under `Reports/`.
Each report should include:

1. Lean declaration name, file path, and proof status.
2. Every new definition, lemma, structure, or theorem introduced for that
   proof.
3. Local markdown source path and line range from the textbook extraction.
4. Local PDF source path and local screenshot path for the corresponding
   textbook passage.
5. A gap note saying whether the Lean declaration is the exact textbook theorem
   or a proved layer toward it.

The source material is local-only:

```text
Textbooks/Vaart1996/Markdown/
Textbooks/Vaart1996/PDF/
Textbooks/Vaart1996/Screenshots/
```

These paths are intentionally ignored by Git so the public repository remains a
Lean library plus source-audit metadata, not a redistribution of the textbook.

## Current Formalization Target

The current target is VdV&W Theorem 2.4.1:

```text
finite L1(P) bracketing numbers at every positive radius
  -> the function class is Glivenko-Cantelli
```

The textbook proof has the following formalization shape:

1. Fix a positive bracket radius.
2. Choose finitely many brackets covering the class.
3. For each function in the class, compare its empirical-population deviation
   against the deviation of the bracket endpoints plus the bracket width.
4. Use the strong law for the finitely many endpoint functions.
5. Repeat the lower-bound argument.
6. Let the bracket radius decrease to zero.

The repository currently proves source-audited theorem layers used by this
proof.  It does not yet claim the final primitive theorem from the bracketing
number `N_[]`.

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
- `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn`
  in `StatInference/EmpiricalProcess/BracketingPrimitive.lean`.
- `endpoint_strong_law_ae_real`
  in `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`.
- `finite_endpoint_strong_law_ae_real`
  in `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`.

These prove the deterministic bracket-comparison route and the finite endpoint
strong-law route.  They are real Lean proofs, not placeholders, but they are
still theorem layers rather than the complete textbook theorem stated from
primitive bracketing numbers.

## Remaining Gap For Theorem 2.4.1

Before marking VdV&W Theorem 2.4.1 fully formalized, the repository still needs
the following remaining layers:

1. Connect actual iid sample processes to endpoint empirical averages.
2. Combine finite endpoint strong laws with the primitive bracketing route.
3. State and prove the final theorem in the exact VdV&W shape, with explicit
   convergence mode and measurability/integrability assumptions.

The next Lean work should focus on item 1 first.  That is now the missing
probabilistic bridge between mathlib's endpoint strong law and the currently
proved primitive finite-cover route.

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

- covering numbers and entropy interfaces;
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

Each stage should produce Lean declarations plus theorem reports.  A theorem is
only "promoted" when it compiles, is free of proof holes, and has a source
crosswalk.

## Promotion Gate

A theorem or lemma is promoted only if:

- `lake build` succeeds;
- the declaration has no `sorry`, `admit`, `axiom`, or `unsafe`;
- introduced assumptions are explicit and non-vacuous where possible;
- the theorem is linked to a markdown/PDF source anchor when it is textbook
  derived;
- the report distinguishes exact textbook formalization from intermediate
  formal proof layers.

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
- Local Vaart markdown/PDF/screenshot assets are available for private review
  but ignored by Git.
- Lean library currently builds.
- Current source-audited focus is VdV&W Theorem 2.4.1.
- The comprehensive pre-2.4.1 inventory now covers Chapter 1 and Chapter 2
  through the theorem, not only Section 2.
- Deterministic bracketing inequality, primitive bracket/finite-cover layer,
  primitive cover-to-route bridge, and finite endpoint strong-law wrappers are
  proved.
- The full theorem from primitive `N_[]` definitions remains the next target.
