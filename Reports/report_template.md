# Theorem Proof Report Template

Use one report folder per exact textbook theorem or lemma after it is fully
proved in Lean.  Do not create a formal report for an intermediate layer.

## Lean Declaration

- Name:
- File:
- Kind: definition / lemma / theorem / structure
- Proof status: proved / construction / interface / pending

## Textbook Source

- Textbook:
- Markdown path and line range:
- PDF path:
- Screenshot path:
- Compiled PDF path: `report.pdf` local-only, ignored by Git

## Natural-Language Meaning

Describe the intended mathematical statement in reviewer-friendly language.

## Lean Objects Introduced

| Object | Kind | Mathematical meaning | Textbook counterpart |
| --- | --- | --- | --- |

## Side-By-Side Source Cross-Check

| Lean realization | Markdown textbook anchor | PDF screenshot anchor | Status and gap |
| --- | --- | --- | --- |

## Embedded Screenshot Page

Create `source_screenshots.md` in the same report folder and embed the exact
local screenshots used for the cross-check, for example:

```markdown
# Source Screenshots

![Theorem screenshot](<Textbooks/Vaart1996/Screenshots/example.png>)
```

Then compile the local PDF:

```bash
scripts/compile_report_pdf.sh Reports/VdVW_<item-number>_<short_slug>
```

The generated `report.pdf` must visually include the real textbook screenshot
images.  It is intentionally ignored by Git.

## Dependencies

| Dependency | Source | Role |
| --- | --- | --- |

## Gap Notes

State why the Lean theorem is exactly the textbook theorem and list any broader
textbook-order compatibility work that remains outside this theorem.
