# Source Cross-Check Policy

Every promoted theorem report should include three synchronized views:

1. Lean declaration and proof status.
2. Markdown textbook line references.
3. PDF screenshot path for the corresponding textbook passage.

For VdV&W-derived theorem work, reports should use a side-by-side table with:

- Lean realization: declaration name, file, kind, and formal role.
- Markdown anchor: local markdown file and line range, with only a short public
  excerpt or paraphrase.
- PDF anchor: local screenshot path for the corresponding textbook passage.
- Status/gap: exact theorem, proved layer, proof-carrying interface, or pending
  primitive.

Reports should distinguish:

- exact formalization of a textbook theorem;
- proved theorem layer used by a textbook proof;
- proof-carrying interface;
- pending primitive definition or lemma.

Use exactly one report folder for each exact textbook theorem once it is
promoted.  If intermediate theorem layers are promoted first, they may have
their own report folders, but the later exact-theorem report must link to those
layer reports and must not silently duplicate or replace them.

Do not mark a theorem as the full textbook result until all primitives used in
the textbook statement have Lean definitions and the theorem compiles from
those definitions without `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.

Do not commit long quoted textbook excerpts into reports or docs.  The requested
textbook markdown/PDF/screenshot source anchors under `Textbooks/Vaart1996/`
may be tracked, while generated report PDFs remain local artifacts unless
explicitly reviewed for publication.
