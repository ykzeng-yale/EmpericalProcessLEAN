# Reports

This directory holds source-audit reports for promoted VdV&W formalization
work.

Use one report folder per textbook theorem when the exact theorem is promoted.
Use one report folder per theorem layer only when the layer is intentionally
promoted before the exact theorem.  When the exact theorem is later proved,
the exact theorem report must link back to the layer report instead of
duplicating it silently.

Required folder shape:

```text
Reports/VdVW_<item-number>_<short_slug>/
  README.md
  crosswalk.md
  definition_lemma_crosscheck.md
```

Each report must include:

- Lean declaration name, file path, kind, and proof status.
- Every new local definition, lemma, structure, or theorem introduced beyond
  mathlib for that proof.
- Local markdown path and line range for the corresponding textbook passage.
- Local PDF screenshot path for the corresponding passage.
- Dependency list separating reused mathlib declarations from local
  declarations.
- Gap note saying whether the result is exact textbook formalization,
  a theorem layer, a proof-carrying interface, or still pending.

Promotion gate:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

Both commands must pass before a report marks a theorem as proved.

Local textbook assets under `Textbooks/Vaart1996/` are review anchors only and
must not be committed to public Git history.
