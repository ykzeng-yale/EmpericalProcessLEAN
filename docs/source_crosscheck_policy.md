# Source Cross-Check Policy

Every promoted theorem report should include three synchronized views:

1. Lean declaration and proof status.
2. Markdown textbook line references.
3. PDF screenshot path for the corresponding textbook passage.

Reports should distinguish:

- exact formalization of a textbook theorem;
- proved theorem layer used by a textbook proof;
- proof-carrying interface;
- pending primitive definition or lemma.

Do not mark a theorem as the full textbook result until all primitives used in
the textbook statement have Lean definitions and the theorem compiles from
those definitions without `sorry`, `admit`, unreviewed `axiom`, or `unsafe`.
