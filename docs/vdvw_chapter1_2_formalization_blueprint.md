# VdV&W Chapter 1-2 Formalization Blueprint

This is the working blueprint for moving beyond Theorem 2.4.1 toward a
source-audited Lean formalization of Chapters 1 and 2 of van der Vaart and
Wellner, *Weak Convergence and Empirical Processes*.

The public repository must remain a Lean library plus audit metadata.  The
textbook markdown, PDF, and selected screenshots under `Textbooks/Vaart1996/`
are intentionally tracked source-audit anchors, per user request; generated
report PDFs remain untracked build artifacts.

## Audit Scope

Local extraction source:

```text
Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md
Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md
Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_201-300.md
```

The Chapter 1-2 extraction contains 226 named items:

| Bucket | Count |
| --- | ---: |
| theorem-level items: lemmas, theorems, propositions, corollaries | 156 |
| definitions | 8 |
| examples and addenda | 62 |

This blueprint tracks theorem-level items first.  Definitions are promoted as
primitives whenever a theorem needs them.  Examples should receive reports
after the theorem infrastructure they use is compiled.

## Prioritization Policy

The inventory below is comprehensive, but it is not a strict implementation
queue.  Some Chapter 1 results are global weak-convergence or whole-book
infrastructure theorems.  Those items should be audited and reused from
mathlib when possible, but they do not block the current empirical-process
main line unless a later VdV&W theorem depends on their exact arbitrary-map
form.

Current priority is dependency-driven:

1. keep the already proved Theorem 2.4.1 route verified;
2. finish only the Chapter 1 primitives that are directly needed for outer
   probability, measurable-cover, and empirical-process measurability layers;
3. proceed through Chapter 2 bracketing, covering, measurable-class, and
   symmetrization results in textbook order;
4. defer broad Chapter 1 weak-convergence, tightness, product-space, and
   stochastic-process theorems until they become necessary for Donsker-level
   results or another concrete theorem target.

When a deferred Chapter 1 item is needed, it should be promoted with the same
standard as every other theorem: exact Lean statement, no proof holes, local
mathlib search first, and one theorem report only after the exact theorem or
lemma is fully proved.

## Existing Lean Coverage Conclusion

Pinned mathlib is the authority for reusable foundations in this repository.
The current pinned dependency is the one in `lake-manifest.json`.

Targeted search of pinned mathlib found reusable foundations for:

| VdV&W need | Pinned mathlib foundation |
| --- | --- |
| measure and outer-measure semantics | `MeasureTheory.Measure.*`, `toMeasurable`, null-measurability |
| products and Fubini | `MeasureTheory.Integral.Prod`, product measures |
| weak convergence of measures | `MeasureTheory.Measure.Portmanteau`, `MeasureTheory.Measure.Prokhorov`, `LevyProkhorovMetric` |
| convergence in probability/distribution | `TendstoInMeasure`, `TendstoInDistribution`, continuous mapping, Slutsky-style lemmas |
| probability spaces and laws | `ProbabilityMeasure`, `IsProbabilityMeasure`, `HasLaw`, `IdentDistrib`, independence APIs |
| strong laws and Borel-Cantelli | `ProbabilityTheory.strong_law_ae_real`, first/second Borel-Cantelli files |
| CLT foundations | `Probability.CentralLimitTheorem` |
| tail inequalities | sub-Gaussian and Hoeffding infrastructure in `Probability.Moments.SubGaussian` |
| `L_p`/integrability | `MemLp`, `eLpNorm`, Bochner/Lebesgue integrals |
| VC combinatorics | `Combinatorics.SetFamily.Shatter` and `Finset.vcDim` |

Targeted search did not find exact Lean statements for VdV&W-specific
empirical-process objects such as:

```text
Glivenko-Cantelli class
Donsker class
bracketing number theorem
entropy with bracketing
outer expectation of arbitrary maps in the VdV&W sense
asymptotic measurability/tightness of arbitrary maps
measurable classes in the VdV&W empirical-process sense
symmetrization/maximal inequalities for empirical-process suprema
```

Therefore the status convention is:

| Status | Meaning |
| --- | --- |
| `local-exact` | exact textbook theorem statement is compiled locally from local primitives |
| `local-layer` | compiled local theorem layer exists, but the exact textbook theorem still has pending compatibility primitives |
| `mathlib-foundation` | mathlib has major reusable foundations, but not the exact VdV&W theorem |
| `pending-local` | no exact local proof yet; build local primitives and proof |

## Definitions To Track As Primitive Dependencies

| Item | Anchor | Current status |
| --- | --- | --- |
| 1.3.3 weak convergence of arbitrary maps | `..._1-100.md:585` | pending-local; mathlib has measure-level weak convergence |
| 1.3.7 asymptotic measurability | `..._1-100.md:661` | pending-local |
| 1.9.1 stochastic convergence notation | `..._1-100.md:1292` | local-layer for common-domain outer-probability convergence |
| 1.10.1 convergence in outer probability to a constant | `..._1-100.md:1406` | local-layer |
| 2.1.5 covering numbers | `..._1-100.md:1894` | local-layer: `vdVWCoveringNumber` wraps mathlib `Metric.externalCoveringNumber`, with explicit finite-cover witnesses and closed-ball/open-ball slack documented |
| 2.1.6 bracketing numbers | `..._1-100.md:1895` | local-layer with primitive `l1BracketingNumber` |
| 2.2.3 covering and packing numbers for semimetrics | `..._101-200.md:292` | local-layer: `vdVWSemimetricCoveringNumber`, `vdVWSemimetricPackingNumber`, finite-cover handoff, and mathlib covering-packing inequalities |
| 2.3.3 `P`-measurable class | `..._101-200.md:627` | local-layer: product measure `P^n`, display `(2.3.2)` weighted supremum, completion/null-measurability predicate, and countable coordinate-measurable constructor formalized |

## Report Contract For Every Promoted Theorem

Every theorem-level item must have exactly one theorem report folder once its
exact textbook statement is fully formalized in Lean.  Intermediate proof
layers and intentionally scoped compatibility wrappers should update this
blueprint or another status document, not `Reports/`.

Recommended folder naming:

```text
Reports/VdVW_<item-number>_<short_slug>/
```

Each folder must contain:

| File | Required content |
| --- | --- |
| `README.md` | theorem status, exact-statement classification, verification command |
| `crosswalk.md` | Lean realization vs markdown anchor vs PDF screenshot anchor |
| `definition_lemma_crosscheck.md` | every new local definition/lemma/structure/theorem introduced beyond mathlib |

Quality gate before marking a theorem `local-exact`:

1. the final theorem declaration compiles with local Lake;
2. no tracked Lean source contains `sorry`, `admit`, `axiom`, or `unsafe`;
3. the theorem statement uses primitive definitions that correspond to the
   textbook statement;
4. every new local primitive has a cross-check row;
5. the report includes local markdown line range and local PDF screenshot path;
6. reused mathlib declarations are listed as dependencies, not re-proved.

## Theorem-Level Gap Inventory

The table below lists every Chapter 1-2 lemma/theorem/proposition/corollary
extracted from the local markdown.  It intentionally avoids long textbook
quotes; the anchor is the authoritative local source location.

| Item | Kind | Anchor | Current audit status |
| --- | --- | --- | --- |
| 1.2.1 | Lemma | `..._1-100.md:372` | local-layer: nonnegative outer/inner expectation and cover interfaces |
| 1.2.2 | Lemma | `..._1-100.md:389` | local-layer: nonnegative sup/add/inf/product, two-sided constant addition equality, finite-measurable addition equality, threshold-indicator, and two-sided measurable infimum equality cover algebra |
| 1.2.3 | Lemma | `..._1-100.md:438` | local-layer: outer/inner event probability, explicit measurable event-cover existence, arbitrary measurable set cover to event-indicator cover with integral equality, direct `toMeasurable` hull integral equality, complement-set-cover lower cover, direct complement-cover inner-probability equalities, outer-probability/outer-expectation bridge, inner-expectation indicator equality, and two-sided complement identities |
| 1.2.4 | Lemma | `..._1-100.md:446` | pending-local |
| 1.2.5 | Lemma | `..._1-100.md:467` | mathlib-foundation |
| 1.2.6 | Lemma | `..._1-100.md:480` | mathlib-foundation, pending VdV&W outer wrapper |
| 1.2.7 | Lemma | `..._1-100.md:492` | mathlib-foundation, pending VdV&W outer wrapper |
| 1.3.1 | Lemma | `..._1-100.md:575` | mathlib-foundation |
| 1.3.2 | Lemma | `..._1-100.md:582` | mathlib-foundation |
| 1.3.4 | Theorem | `..._1-100.md:606` | mathlib-foundation, pending arbitrary-map wrapper |
| 1.3.6 | Theorem | `..._1-100.md:650` | mathlib-foundation, pending arbitrary-map wrapper |
| 1.3.8 | Lemma | `..._1-100.md:678` | pending-local |
| 1.3.9 | Theorem | `..._1-100.md:688` | mathlib-foundation, pending arbitrary-map wrapper |
| 1.3.10 | Theorem | `..._1-100.md:756` | pending-local |
| 1.3.12 | Lemma | `..._1-100.md:768` | mathlib-foundation |
| 1.3.13 | Lemma | `..._1-100.md:778` | pending-local |
| 1.4.1 | Lemma | `..._1-100.md:848` | mathlib-foundation |
| 1.4.2 | Lemma | `..._1-100.md:849` | mathlib-foundation, pending local wrapper |
| 1.4.3 | Lemma | `..._1-100.md:857` | pending-local |
| 1.4.4 | Lemma | `..._1-100.md:858` | pending-local |
| 1.4.5 | Corollary | `..._1-100.md:878` | pending-local |
| 1.4.8 | Theorem | `..._1-100.md:910` | pending-local |
| 1.5.2 | Lemma | `..._1-100.md:932` | pending-local |
| 1.5.3 | Lemma | `..._1-100.md:933` | pending-local |
| 1.5.4 | Theorem | `..._1-100.md:934` | pending-local |
| 1.5.6 | Theorem | `..._1-100.md:958` | pending-local |
| 1.5.7 | Theorem | `..._1-100.md:987` | pending-local |
| 1.5.9 | Lemma | `..._1-100.md:1044` | pending-local |
| 1.6.1 | Theorem | `..._1-100.md:1117` | pending-local |
| 1.7.1 | Lemma | `..._1-100.md:1156` | pending-local |
| 1.7.2 | Theorem | `..._1-100.md:1157` | pending-local |
| 1.8.1 | Lemma | `..._1-100.md:1234` | mathlib-foundation, pending VdV&W wrapper |
| 1.8.2 | Lemma | `..._1-100.md:1245` | pending-local |
| 1.8.3 | Lemma | `..._1-100.md:1246` | mathlib-foundation, pending local wrapper |
| 1.8.4 | Theorem | `..._1-100.md:1247` | mathlib-foundation, pending local wrapper |
| 1.9.2 | Lemma | `..._1-100.md:1304` | local-layer |
| 1.9.3 | Lemma | `..._1-100.md:1308` | local-layer |
| 1.9.5 | Theorem | `..._1-100.md:1328` | mathlib-foundation, pending VdV&W wrapper |
| 1.9.6 | Theorem | `..._1-100.md:1354` | local-layer |
| 1.10.2 | Lemma | `..._1-100.md:1409` | local-layer for measurable common-domain part |
| 1.10.3 | Theorem | `..._1-100.md:1420` | pending-local |
| 1.10.12 | Proposition | `..._1-100.md:1554` | pending-local |
| 1.11.1 | Theorem | `..._1-100.md:1630` | mathlib-foundation, pending VdV&W wrapper |
| 1.11.3 | Theorem | `..._1-100.md:1674` | pending-local |
| 1.12.1 | Theorem | `..._1-100.md:1706` | pending-local |
| 1.12.2 | Theorem | `..._1-100.md:1718` | pending-local |
| 1.12.4 | Theorem | `..._1-100.md:1751` | mathlib-foundation, pending local wrapper |
| 2.1.11 | Proposition | `..._101-200.md:169` | pending-local |
| 2.2.1 | Lemma | `..._101-200.md:229` | pending-local |
| 2.2.2 | Lemma | `..._101-200.md:246` | pending-local |
| 2.2.4 | Theorem | `..._101-200.md:301` | pending-local |
| 2.2.5 | Corollary | `..._101-200.md:314` | pending-local |
| 2.2.7 | Lemma | `..._101-200.md:372` | mathlib-foundation, pending exact Rademacher form |
| 2.2.8 | Corollary | `..._101-200.md:405` | pending-local |
| 2.2.9 | Lemma | `..._101-200.md:429` | pending-local |
| 2.2.10 | Lemma | `..._101-200.md:438` | pending-local |
| 2.2.11 | Lemma | `..._101-200.md:466` | mathlib-foundation, pending exact Bernstein form |
| 2.3.1 | Lemma | `..._101-200.md:572` | pending-local |
| 2.3.6 | Lemma | `..._101-200.md:650` | pending-local |
| 2.3.7 | Lemma | `..._101-200.md:672` | pending-local |
| 2.3.9 | Lemma | `..._101-200.md:717` | pending-local |
| 2.3.11 | Lemma | `..._101-200.md:762` | pending-local |
| 2.3.12 | Corollary | `..._101-200.md:780` | pending-local |
| 2.3.13 | Corollary | `..._101-200.md:784` | pending-local |
| 2.3.14 | Lemma | `..._101-200.md:807` | pending-local |
| 2.3.15 | Theorem | `..._101-200.md:818` | pending-local |
| 2.3.16 | Proposition | `..._101-200.md:857` | pending-local |
| 2.3.17 | Theorem | `..._101-200.md:882` | pending-local |
| 2.4.1 | Theorem | `..._101-200.md:970` | local-exact |
| 2.4.3 | Theorem | `..._101-200.md:988` | pending-local; Definition 2.1.5 covering primitive and Definition 2.3.3 `P`-measurable primitive layers now available |
| 2.4.5 | Lemma | `..._101-200.md:1022` | pending-local |
| 2.5.2 | Theorem | `..._101-200.md:1106` | pending-local |
| 2.5.6 | Theorem | `..._101-200.md:1204` | pending-local |
| 2.6.2 | Lemma | `..._101-200.md:1358` | mathlib-foundation, pending VdV&W wrapper |
| 2.6.3 | Corollary | `..._101-200.md:1369` | mathlib-foundation, pending VdV&W wrapper |
| 2.6.4 | Theorem | `..._101-200.md:1378` | pending-local |
| 2.6.6 | Lemma | `..._101-200.md:1450` | pending-local |
| 2.6.7 | Theorem | `..._101-200.md:1490` | pending-local |
| 2.6.9 | Theorem | `..._101-200.md:1533` | pending-local |
| 2.6.11 | Lemma | `..._101-200.md:1604` | pending-local |
| 2.6.12 | Corollary | `..._101-200.md:1623` | pending-local |
| 2.6.13 | Lemma | `..._101-200.md:1634` | pending-local |
| 2.6.14 | Theorem | `..._101-200.md:1645` | pending-local |
| 2.6.15 | Lemma | `..._101-200.md:1652` | pending-local |
| 2.6.16 | Lemma | `..._101-200.md:1667` | pending-local |
| 2.6.17 | Lemma | `..._101-200.md:1670` | pending-local |
| 2.6.18 | Lemma | `..._101-200.md:1685` | pending-local |
| 2.6.19 | Lemma | `..._101-200.md:1713` | pending-local |
| 2.6.20 | Lemma | `..._101-200.md:1714` | pending-local |
| 2.6.22 | Lemma | `..._101-200.md:1720` | pending-local |
| 2.7.1 | Theorem | `..._101-200.md:1859` | pending-local |
| 2.7.2 | Corollary | `..._101-200.md:1927` | pending-local |
| 2.7.3 | Corollary | `..._101-200.md:1939` | pending-local |
| 2.7.4 | Corollary | `..._101-200.md:1956` | pending-local |
| 2.7.5 | Theorem | `..._101-200.md:2000` | pending-local |
| 2.7.8 | Lemma | `..._101-200.md:2129` | pending-local |
| 2.7.9 | Corollary | `..._101-200.md:2140` | pending-local |
| 2.7.11 | Theorem | `..._101-200.md:2186` | pending-local |
| 2.8.1 | Theorem | `..._101-200.md:2227` | pending-local |
| 2.8.2 | Theorem | `..._101-200.md:2309` | pending-local |
| 2.8.3 | Theorem | `..._101-200.md:2370` | pending-local |
| 2.8.4 | Theorem | `..._101-200.md:2407` | pending-local |
| 2.8.7 | Lemma | `..._101-200.md:2471` | pending-local |
| 2.8.8 | Lemma | `..._101-200.md:2472` | pending-local |
| 2.8.9 | Theorem | `..._101-200.md:2485` | pending-local |
| 2.8.10 | Theorem | `..._101-200.md:2486` | pending-local |
| 2.9.1 | Lemma | `..._101-200.md:2537` | pending-local |
| 2.9.2 | Theorem | `..._101-200.md:2613` | pending-local |
| 2.9.3 | Corollary | `..._101-200.md:2638` | pending-local |
| 2.9.4 | Corollary | `..._101-200.md:2650` | pending-local |
| 2.9.5 | Lemma | `..._101-200.md:2659` | pending-local |
| 2.9.6 | Theorem | `..._101-200.md:2684` | pending-local |
| 2.9.7 | Theorem | `..._101-200.md:2729` | pending-local |
| 2.9.8 | Lemma | `..._101-200.md:2770` | pending-local |
| 2.9.9 | Corollary | `..._101-200.md:2777` | pending-local |
| 2.10.1 | Theorem | `..._201-300.md:117` | pending-local |
| 2.10.2 | Theorem | `..._201-300.md:118` | pending-local |
| 2.10.3 | Theorem | `..._201-300.md:119` | pending-local |
| 2.10.6 | Theorem | `..._201-300.md:153` | pending-local |
| 2.10.13 | Corollary | `..._201-300.md:179` | pending-local |
| 2.10.14 | Lemma | `..._201-300.md:198` | pending-local |
| 2.10.15 | Lemma | `..._201-300.md:223` | pending-local |
| 2.10.16 | Lemma | `..._201-300.md:240` | pending-local |
| 2.10.20 | Theorem | `..._201-300.md:354` | pending-local |
| 2.10.24 | Theorem | `..._201-300.md:411` | pending-local |
| 2.11.1 | Theorem | `..._201-300.md:523` | pending-local |
| 2.11.6 | Lemma | `..._201-300.md:635` | pending-local |
| 2.11.9 | Theorem | `..._201-300.md:692` | pending-local |
| 2.11.11 | Theorem | `..._201-300.md:740` | pending-local |
| 2.11.12 | Corollary | `..._201-300.md:757` | pending-local |
| 2.11.17 | Lemma | `..._201-300.md:849` | pending-local |
| 2.11.22 | Theorem | `..._201-300.md:1008` | pending-local |
| 2.11.23 | Theorem | `..._201-300.md:1015` | pending-local |
| 2.12.1 | Theorem | `..._201-300.md:1178` | pending-local |
| 2.12.6 | Theorem | `..._201-300.md:1258` | pending-local |
| 2.13.1 | Theorem | `..._201-300.md:1343` | pending-local |
| 2.13.2 | Theorem | `..._201-300.md:1365` | pending-local |
| 2.13.6 | Theorem | `..._201-300.md:1478` | pending-local |
| 2.14.1 | Theorem | `..._201-300.md:1554` | pending-local |
| 2.14.2 | Theorem | `..._201-300.md:1585` | pending-local |
| 2.14.3 | Lemma | `..._201-300.md:1615` | pending-local |
| 2.14.5 | Theorem | `..._201-300.md:1731` | pending-local |
| 2.14.9 | Theorem | `..._201-300.md:1818` | pending-local |
| 2.14.10 | Theorem | `..._201-300.md:1825` | pending-local |
| 2.14.13 | Theorem | `..._201-300.md:1862` | pending-local |
| 2.14.14 | Theorem | `..._201-300.md:1878` | pending-local |
| 2.14.16 | Theorem | `..._201-300.md:1907` | pending-local |
| 2.14.17 | Theorem | `..._201-300.md:1914` | pending-local |
| 2.14.18 | Lemma | `..._201-300.md:1930` | pending-local |
| 2.14.19 | Lemma | `..._201-300.md:1941` | pending-local |
| 2.14.24 | Theorem | `..._201-300.md:2159` | pending-local |
| 2.14.25 | Theorem | `..._201-300.md:2172` | pending-local |
| 2.14.26 | Lemma | `..._201-300.md:2231` | pending-local |
| 2.14.27 | Theorem | `..._201-300.md:2262` | pending-local |
| 2.14.28 | Lemma | `..._201-300.md:2289` | pending-local |
| 2.14.32 | Lemma | `..._201-300.md:2491` | pending-local |

## Examples And Addenda Frontier

Examples and addenda are tracked separately from the 156 theorem-level items
above, so they do not change the theorem-level dashboard counts.

| Item | Kind | Anchor | Current audit status |
| --- | --- | --- | --- |
| 2.3.4 | Example | `..._101-200.md:630` | local-layer: pointwise/countable-subclass predicates, pointwise-to-weighted-sum convergence helpers, and the proof-carrying supremum-equality handoff to `P`-measurability; pending exact theorem that the textbook pointwise convergence hypothesis implies equality of all weighted suprema `(2.3.2)` |
| 2.4.2 | Example | `..._101-200.md:985` | local-layer: real half-line indicator bracket membership, endpoint integrability, `L1(P)` width identity, extended-real endpoint indicators/brackets for `-∞`/`∞`, extended-open-cell endpoint identities and width identity, adjacent-endpoint grid handoff, supplied finite-grid bridges to the primitive bracketing-number witness, one-cell base grid for radii above total mass, all-positive-radius handoff to the Theorem 2.4.1 `N_[] < ∞` hypothesis, conditional half-line GC corollary from supplied grids, and conditional half-line GC corollary from adjacent endpoint grids; pending distribution-dependent grid existence and exact empirical-CDF example report |

## Priority Order

1. Finish Chapter 1.2 arbitrary-map outer expectation/inner probability:
   extended-real compatibility, remaining exact Lemma 1.2.3 clauses beyond
   the nonnegative indicator equality, and Fubini-compatible statements.
2. Finish Chapter 1.3-1.10 arbitrary-map weak convergence wrappers by
   bridging to mathlib Portmanteau, Prokhorov, `TendstoInMeasure`, and
   `TendstoInDistribution`.
3. Promote Chapter 2 primitive infrastructure: covering/packing semimetric
   numbers, `P`-measurable classes, Orlicz norms, and separability wrappers.
   Definition 2.1.5 now has a local covering-number primitive layer, and
   Definition 2.2.3 now has semimetric covering/packing wrappers; the next
   covering frontier is entropy/logarithm wrappers and the random `L1(P_n)`
   specialization needed by Theorem 2.4.3.
4. Continue Example 2.4.2 from the extended-real supplied-grid bridge and
   conditional GC handoff to the distribution-dependent grid existence theorem
   and exact empirical-CDF example report, then move to Theorem 2.4.3.
5. Formalize Sections 2.2-2.3 inequalities and symmetrization before using
   them for later entropy/Donsker results.
6. Formalize VC/entropy Sections 2.5-2.8 using mathlib shattering foundations
   plus local empirical-process definitions.
7. Formalize multiplier, permanence, bracketing CLT, functional Donsker, and
   maximal inequality sections 2.9-2.14.

## Automation Checklist

Every heartbeat or continuation run for this blueprint should:

1. inspect git status, recent declarations, reports, and this blueprint;
2. identify the next pending item by priority, not only by file locality;
3. search pinned mathlib before introducing a primitive;
4. implement one concrete Lean proof step or document a precise blocker;
5. run the smallest relevant `lake env lean ...` check after Lean edits;
6. run `lake build` after substantive promoted theorem edits;
7. scan tracked Lean sources for `sorry`, `admit`, `axiom`, and `unsafe`;
8. create or update a theorem report only when an exact textbook theorem or
   lemma is fully proved; otherwise update blueprint/status docs only;
9. keep credentials out of Git; treat generated report PDFs as local-only
   artifacts while allowing the requested textbook source anchors under
   `Textbooks/Vaart1996/`.
