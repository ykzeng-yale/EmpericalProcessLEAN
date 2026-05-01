# EmpericalProcessLEAN

This repository is the Lean formalization workspace for empirical process
theory from van der Vaart and Wellner, *Weak Convergence and Empirical
Processes*.  The local working copy is intended to live at:

```text
/Users/yukang/Desktop/AI for Math/EmpericalProcessLEAN
```

The GitHub remote is:

```text
https://github.com/ykzeng-yale/EmpericalProcessLEAN
```

The project goal is progressive, source-audited formalization of the textbook:
each promoted theorem should compile in Lean and be accompanied by a report
that lets a human reviewer compare the Lean statement with the original
markdown extraction and the corresponding PDF screenshot.

## Scope

This is intentionally a Lean/textbook repository only.

Included:

- Lean library files needed for the formalization work.
- local-only VdV&W source anchors for markdown, PDF, and theorem screenshots;
- theorem proof reports with Lean/textbook/PDF cross-checks.

Excluded:

- agent orchestration code;
- training, RL, or benchmark-generation pipelines;
- AXLE wrappers, API keys, or external prover-service glue;
- `AI-Statistician` application code, tests, and blueprint machinery.
- copyrighted textbook PDF/markdown/screenshot assets from the public Git
  history.  They may exist in the local working tree for review, but are
  ignored by Git.

## Repository Layout

- `StatInference/`: Lean library.  The active development area is
  `StatInference/EmpiricalProcess/`.
- `StatInference.lean`: top-level Lean import file.
- `Textbooks/Vaart1996/`: local-source manifest and ignored local assets.
  The markdown conversion, PDF files, and theorem screenshots are used for
  human review locally but are not committed to the public repository.
- `Reports/`: one report folder per fully proved theorem or proved theorem
  layer.
- `docs/source_crosscheck_policy.md`: policy for theorem reports.

## Open-Source Lean Base

The project uses Lean and mathlib through Lake.

- Lean toolchain: `leanprover/lean4:v4.30.0-rc2`.
- Primary dependency: `mathlib` from
  `https://github.com/leanprover-community/mathlib4.git`.
- The pinned mathlib revision is recorded in `lake-manifest.json`.

Current status: mathlib supplies the general foundations we need for the next
steps: real analysis, topology, filters, measure theory, probability, finite
types, sums, and the strong law wrapper used in
`StatInference/EmpiricalProcess/EndpointStrongLaw.lean`.

There is not currently a ready-made mathlib theorem in this repository that
states VdV&W Theorem 2.4.1 directly as
`N_[](ε, F, L1(P)) < ∞` for every positive `ε` implies
Glivenko-Cantelli.  The missing empirical-process-specific primitives are
being built locally in `StatInference/EmpiricalProcess/`.

## Current Formalization Target

The active target is VdV&W Theorem 2.4.1:

> finite `L1(P)` bracketing numbers for every positive radius imply that the
> class is Glivenko-Cantelli.

Current Lean status: the repository proves theorem layers used by the textbook
proof, but does not yet claim the full textbook theorem from primitive
`N_[]` definitions.

Proved layers, with no `sorry`:

- `empiricalDeviationBoundOn_of_bracket_endpoint_bounds`
  in `StatInference/EmpiricalProcess/Bracketing.lean`;
- `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds`
  in `StatInference/EmpiricalProcess/Bracketing.lean`;
- `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero`
  in `StatInference/EmpiricalProcess/Bracketing.lean`;
- `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass`
  in `StatInference/EmpiricalProcess/Bracketing.lean`;
- `endpoint_strong_law_ae_real`
  in `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`;
- `finite_endpoint_strong_law_ae_real`
  in `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`.

Remaining work before marking Theorem 2.4.1 fully formalized:

- define function brackets `[l, u]` over measurable functions;
- define `L1(P)` bracket width using mathlib integrals or `L1` norms;
- define the finite bracketing number `N_[](ε, F, L1(P))`;
- prove that finite bracketing number gives a finite endpoint family;
- connect empirical averages from actual samples to endpoint empirical risks;
- combine finite endpoint strong laws with the deterministic bracketing route;
- package the final theorem in the exact textbook shape, with explicit
  convergence mode and measurability assumptions.

## Theorem Report Rule

Every newly promoted theorem or theorem layer gets a report folder under
`Reports/`.  Each report must contain:

- Lean declaration name, file path, and proof status;
- every new definition, lemma, structure, or theorem introduced for the proof;
- local markdown source path and line range from the textbook extraction;
- local PDF source path and local screenshot path for the corresponding
  textbook passage;
- a gap note saying whether this is the exact textbook theorem or a proved
  layer used toward it.

The active report is:

```text
Reports/Theorem_2_4_1_Bracketing_GC/
```

## Verification

Run:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" StatInference StatInference.lean
```

Expected status for promoted Lean sources:

- `lake build` completes successfully;
- the proof-hole scan returns no matches.
