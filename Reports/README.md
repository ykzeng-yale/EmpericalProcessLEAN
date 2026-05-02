# Reports

This directory holds source-audit reports for promoted VdV&W formalization
work.

Use one report folder per textbook theorem or lemma only after the exact
statement has been fully formalized in Lean: all primitives in the textbook
statement have Lean counterparts, every local definition/lemma needed by the
proof is included, the final theorem compiles, and the proof-hole scan is
clean.

Intermediate proof layers, proof-carrying interfaces, and partial compatibility
wrappers should be tracked in `docs/` or the active blueprint, not as formal
theorem reports.  When the exact theorem is later proved, its report should
include those intermediate declarations in the dependency/cross-check table.

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
- Gap note saying whether the result is exact textbook formalization and what
  broader textbook-order compatibility work remains.

Promotion gate:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

Both commands must pass before a report marks a theorem as proved.

Local textbook assets under `Textbooks/Vaart1996/` are review anchors only and
must not be committed to public Git history.
