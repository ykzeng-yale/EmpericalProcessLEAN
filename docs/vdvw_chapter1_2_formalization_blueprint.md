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

The Chapter 1-2 extraction contains 227 named items after the Chapter 1
re-audit restored the missing Theorem 1.10.4 inventory row:

| Bucket | Count |
| --- | ---: |
| theorem-level items: lemmas, theorems, propositions, corollaries | 157 |
| definitions | 8 |
| examples and addenda | 62 |

This blueprint tracks theorem-level items first.  Definitions are promoted as
primitives whenever a theorem needs them.  Examples and addenda are now
non-blocking: keep already compiled example layers available as reusable
infrastructure, but do not spend main proof time on exact example reports or
domain-heavy example closures unless a later theorem explicitly needs them.

## Prioritization Policy

The inventory below is comprehensive, but it is not a strict implementation
queue.  Chapter 1's weak-convergence, tightness, product-space, Hilbert, and
representation material is fundamental.  It must not be treated as skipped
just because it is not the immediate Chapter 2.4.3 blocker.  Each such item
gets one of three concrete routes:

1. prove a local exact VdV&W statement now if it is self-contained;
2. wrap or specialize an existing pinned mathlib theorem when mathlib already
   contains the classical measure/topology result;
3. record the precise missing primitive when the exact VdV&W arbitrary-map,
   nonmeasurable, perfect-map, or representation layer is not yet in mathlib or
   local code.

Current priority is dependency-driven:

1. keep the already proved Theorem 2.4.1 route verified;
2. finish only the Chapter 1 primitives that are directly needed for outer
   probability, measurable-cover, and empirical-process measurability layers;
3. proceed through Chapter 2 bracketing, covering, measurable-class, and
   symmetrization results in textbook order;
4. maintain a Chapter 1 foundation lane for weak convergence, tightness,
   product-space, stochastic-process, Hilbert, and representation results, with
   mathlib-backed wrappers promoted before any claim that the item is blocked;
5. only mark a Chapter 1 theorem as blocked/later-dependent after recording
   the missing local primitive or the exact mathlib search result.

When a Chapter 1 item is promoted, it has the same standard as every other
theorem: exact Lean statement, no proof holes, local mathlib search first, and
one theorem report only after the exact theorem or lemma is fully proved.

Later-dependent Chapter 1 overview results may be marked as blocked or
later-dependent only in the docs, and temporary `sorry` sketches may be used
only as uncommitted planning artifacts.  Tracked/promoted Lean progress should
remain proof-hole-free.  Self-contained or mathlib-backed Chapter 1 building
blocks for weak convergence, tightness, product spaces, Hilbert/Gaussian
foundations, outer probability, measurable covers, measurability, and
empirical-process bounds should be formalized and proved or wrapped rather than
parked indefinitely.

Examples and addenda should be formalized only when they directly support the
Chapter 1-2 empirical-process theorem line.  After the existing Example 2.3.4
and Example 2.4.2 local layers, example-specific exact reports and remaining
domain-heavy closures are deferred by default.  If an example would require a
large external-domain formalization outside the VdV&W Chapter 1-2 theorem
scope, mark it as `deferred-example` with a concrete reason and the missing
external theory instead of blocking nearby theorem-level progress.

The active frontier blocker is pinned separately in:

```text
docs/vdvw_current_blocker_primitive_plan.md
```

Every proof heartbeat should inspect that file before introducing a new
primitive.  As of 2026-05-02, the example-specific Example 2.4.2
distribution-dependent finite middle partition / quantile cutpoint layer is
parked as a deferred example blocker.  The active main-line frontier is
Theorem 2.4.3 and the theorem-level Chapter 2 bracketing/measurable-class
primitives it requires.

## Existing Lean Coverage Conclusion

Pinned mathlib is the authority for reusable foundations in this repository.
The current pinned dependency is the one in `lake-manifest.json`.

Search-before-defining is mandatory.  Before adding any local definition,
primitive lemma, theorem wrapper, or proof-carrying structure, search local
`StatInference`, pinned `.lake/packages/mathlib/Mathlib`, relevant pinned Lake
support packages, and the local open-source Lean checkouts recorded in
`docs/vdvw_current_blocker_primitive_plan.md`.  If the result affects the
design, record the searched names/patterns, reusable APIs found, missing APIs
that create a blocker, and the reason a new local primitive is still needed.
Do not mark a theorem `blocked-vdvw` until that search has been done.

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
| `foundation-lane` | fundamental Chapter 1 item with a concrete mathlib-wrapper or local-primitive path |
| `blocked-vdvw` | exact VdV&W statement needs a missing arbitrary-map/nonmeasurable/perfect-map/representation primitive |
| `deferred` | audited and intentionally not on the current theorem line, with a recorded reason; not a substitute for mathlib search |
| `deferred-example` | example/addendum intentionally skipped for now because it needs domain-heavy external formalization |

## Definitions To Track As Primitive Dependencies

| Item | Anchor | Current status |
| --- | --- | --- |
| 1.3.3 weak convergence of arbitrary maps | `..._1-100.md:585` | local-layer/mathlib-foundation: measure-level probability-law wrapper `VdVWWeakConvergenceProbabilityMeasures` and bounded-continuous integral characterization proved; exact arbitrary-map outer-expectation definition pending |
| 1.3.7 asymptotic measurability | `..._1-100.md:661` | pending-local |
| 1.9.1 stochastic convergence notation | `..._1-100.md:1292` | local-layer for common-domain outer-probability convergence |
| 1.10.1 convergence in outer probability to a constant | `..._1-100.md:1406` | local-layer |
| 2.1.5 covering numbers | `..._1-100.md:1894` | local-layer: `vdVWCoveringNumber` wraps mathlib `Metric.externalCoveringNumber`, with explicit finite-cover witnesses and closed-ball/open-ball slack documented |
| 2.1.6 bracketing numbers | `..._1-100.md:1895` | local-layer with primitive `l1BracketingNumber` |
| 2.2.3 covering and packing numbers for semimetrics | `..._101-200.md:292` | local-layer: `vdVWSemimetricCoveringNumber`, `vdVWSemimetricPackingNumber`, finite-cover handoff, and mathlib covering-packing inequalities |
| 2.3.3 `P`-measurable class | `..._101-200.md:627` | local-layer: product measure `P^n`, display `(2.3.2)` weighted supremum, completion/null-measurability predicate, countable coordinate-measurable constructor, and deterministic finite-cover supremum bound formalized |

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
| 1.2.1 | Lemma | `..._1-100.md:372` | local-layer: nonnegative outer/inner expectation and cover interfaces, including monotonicity of outer and inner expectation |
| 1.2.2 | Lemma | `..._1-100.md:389` | local-layer: nonnegative sup/add/inf/product, two-sided constant addition equality, finite-measurable addition equality, threshold-indicator, tail-product cover-majorant, two-sided measurable infimum equality cover algebra, and measurable integrable real signed positive/negative bridge |
| 1.2.3 | Lemma | `..._1-100.md:438` | local-layer: outer/inner event probability, event-indicator monotonicity, explicit measurable event-cover existence, arbitrary measurable set cover to event-indicator cover with integral equality, direct `toMeasurable` hull integral equality, complement-set-cover lower cover, direct complement-cover inner-probability equalities, outer-probability/outer-expectation bridge, Markov-style outer-probability bound via supplied measurable cover, inner-expectation indicator equality, and two-sided complement identities |
| 1.2.4 | Lemma | `..._1-100.md:446` | pending-local; self-contained dominated-cover infrastructure, promote after the active 1.2.1-1.2.3 layers |
| 1.2.5 | Lemma | `..._1-100.md:467` | blocked-vdvw: product/perfect-map measurable-cover transfer; mathlib has product and measurable-space foundations but no exact local VdV&W perfect-map wrapper yet |
| 1.2.6 | Lemma | `..._1-100.md:480` | promote-soon; mathlib Fubini foundation exists, pending VdV&W outer wrapper for Chapter 2.3/2.4.3 symmetrization |
| 1.2.7 | Lemma | `..._1-100.md:492` | promote-soon; mathlib Fubini foundation exists, pending VdV&W outer wrapper for product outer expectations |
| 1.3.1 | Lemma | `..._1-100.md:575` | foundation-lane/mathlib-foundation: classical topology/measure lemma, wrap or restate from pinned mathlib before claiming any gap |
| 1.3.2 | Lemma | `..._1-100.md:582` | foundation-lane/mathlib-foundation: classical topology/measure lemma, wrap or restate from pinned mathlib before claiming any gap |
| 1.3.4 | Theorem | `..._1-100.md:606` | local-layer/mathlib-foundation: weak convergence of probability measures via `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` plus Portmanteau closed/open implications wrapped locally; exact arbitrary-map outer-expectation version remains pending |
| 1.3.6 | Theorem | `..._1-100.md:650` | local-layer/mathlib-foundation: continuous map pushforward and `TendstoInDistribution` continuous-composition wrappers proved; arbitrary-map cover layer still pending |
| 1.3.8 | Lemma | `..._1-100.md:678` | blocked-vdvw: Hoffmann-Jørgensen arbitrary-map weak-convergence infrastructure; missing exact local arbitrary-map/asymptotic-measurability primitive |
| 1.3.9 | Theorem | `..._1-100.md:688` | local-layer/mathlib-foundation: probability-measure tightness wrapper, compact-set characterization, and Prokhorov compact-closure wrapper proved over mathlib; exact arbitrary-map/asymptotic-tightness extension remains pending |
| 1.3.10 | Theorem | `..._1-100.md:756` | blocked-vdvw: exact nonmeasurable/arbitrary-map weak-convergence layer missing; measure-level mathlib route still to be wrapped separately |
| 1.3.12 | Lemma | `..._1-100.md:768` | foundation-lane/mathlib-foundation: classical foundation available in pinned mathlib, pending local restatement/wrapper |
| 1.3.13 | Lemma | `..._1-100.md:778` | blocked-vdvw: arbitrary-map/asymptotic-measurability infrastructure missing after mathlib search |
| 1.4.1 | Lemma | `..._1-100.md:848` | foundation-lane/mathlib-foundation: audit found product/Pi Borel-space and finite-coordinate restriction APIs; pending exact VdV&W product-space wrapper |
| 1.4.2 | Lemma | `..._1-100.md:849` | foundation-lane/mathlib-foundation: audit found product-law, projective-limit, and finite-dimensional-law APIs; exact nonnegative Lipschitz product-test uniqueness not found |
| 1.4.3 | Lemma | `..._1-100.md:857` | local-layer/mathlib-foundation: binary and finite product-law weak-convergence wrappers proved as `VdVWWeakConvergenceProbabilityMeasures.prod` and `.pi`; arbitrary-map/asymptotic-tightness extension pending |
| 1.4.4 | Lemma | `..._1-100.md:858` | local-layer/mathlib-foundation: finite-coordinate projection/FDD forward wrapper proved as `VdVWWeakConvergenceProbabilityMeasures.finiteDimensionalRestrict`; converse FDD iff theorem still missing |
| 1.4.5 | Corollary | `..._1-100.md:878` | local-layer/mathlib-foundation: measurable common-domain Slutsky/product convergence wrapper proved; exact VdV&W product/arbitrary-map criterion still pending |
| 1.4.8 | Theorem | `..._1-100.md:910` | foundation-lane/mathlib-foundation: FDD forward direction now wrapped for weak convergence; projective-limit/FDD law equality APIs exist, but no exact weak-convergence iff-over-FDD converse theorem found |
| 1.5.2 | Lemma | `..._1-100.md:932` | foundation-lane: `l_infty(T)`/separability primitive target; mathlib has tightness/Prokhorov but local bounded-function-space API is still needed |
| 1.5.3 | Lemma | `..._1-100.md:933` | foundation-lane: `l_infty(T)`/Donsker tightness primitive target, local bounded-function-space API needed |
| 1.5.4 | Theorem | `..._1-100.md:934` | foundation-lane/mathlib-foundation: tightness theorem target using mathlib `IsTightMeasureSet`/Prokhorov plus local `l_infty(T)` wrappers |
| 1.5.6 | Theorem | `..._1-100.md:958` | foundation-lane: tightness/equicontinuity theorem target, local semimetric process API needed |
| 1.5.7 | Theorem | `..._1-100.md:987` | foundation-lane: pre-Gaussian/Donsker tightness theorem target; mathlib Gaussian foundations exist, local process wrapper needed |
| 1.5.9 | Lemma | `..._1-100.md:1044` | foundation-lane: tightness/equicontinuity wrapper target, local semimetric/process primitive needed |
| 1.6.1 | Theorem | `..._1-100.md:1117` | foundation-lane: stochastic-process tightness target; requires local stochastic-process/l_infty API over mathlib tightness |
| 1.7.1 | Lemma | `..._1-100.md:1156` | local-layer/mathlib-foundation: open-ball and closed-ball sigma-field wrappers, open-ball topological basis, rational open/closed ball bridges, open-ball/closed-ball sigma equality, Borel equality, generator measurability, and separable dense-sequence distance-coordinate measurability iff proved in `BallSigma.lean`; exact arbitrary-map/asymptotic-measurability clauses pending |
| 1.7.2 | Theorem | `..._1-100.md:1157` | local-layer/mathlib-foundation: dense-sequence distance-coordinate criterion and Borel/open-ball/closed-ball measurability equivalences compiled; exact VdV&W arbitrary-map separability/asymptotic-measurability statement still needs local wrapper |
| 1.8.1 | Lemma | `..._1-100.md:1234` | local-layer/mathlib-foundation: `HilbertGaussian.lean` wraps complete inner-product spaces as Hilbert spaces, `L2` Hilbert space, and `L2` inner product |
| 1.8.2 | Lemma | `..._1-100.md:1245` | local-layer/mathlib-foundation: Frechet-Riesz continuous-dual representative and evaluation identity wrapped in `HilbertGaussian.lean` |
| 1.8.3 | Lemma | `..._1-100.md:1246` | local-layer/mathlib-foundation: Gaussian inner-coordinate maps and Gaussian-process coordinate laws wrapped in `HilbertGaussian.lean`; no Brownian-bridge/pre-Gaussian full theorem found |
| 1.8.4 | Theorem | `..._1-100.md:1247` | foundation-lane/mathlib-foundation: Hilbert/Gaussian foundations are wrapped; exact functional-CLT/P-Donsker statement still needs local stochastic-process primitives |
| 1.9.2 | Lemma | `..._1-100.md:1304` | local-layer; scoped convergence-mode building block |
| 1.9.3 | Lemma | `..._1-100.md:1308` | local-layer; scoped convergence-mode building block |
| 1.9.5 | Theorem | `..._1-100.md:1328` | mathlib-foundation, pending scoped VdV&W wrapper when active |
| 1.9.6 | Theorem | `..._1-100.md:1354` | local-layer |
| 1.10.2 | Lemma | `..._1-100.md:1409` | local-layer for measurable common-domain part |
| 1.10.3 | Theorem | `..._1-100.md:1420` | blocked-vdvw: almost-sure representation/Skorokhod route; no exact local or pinned mathlib theorem found yet |
| 1.10.4 | Theorem | `..._1-100.md:1434` | blocked-vdvw: nonmeasurable almost-sure representation theorem; missing arbitrary-map/perfect-map representation primitive |
| 1.10.12 | Proposition | `..._1-100.md:1554` | blocked-vdvw: Borel measurable approximants/representation roadmap; exact local measurable-approximation primitive missing |
| 1.11.1 | Theorem | `..._1-100.md:1630` | foundation-lane/mathlib-foundation: extended continuous-mapping wrapper target over mathlib continuous mapping plus local outer-probability layer |
| 1.11.3 | Theorem | `..._1-100.md:1674` | foundation-lane: refined mapping/integrability theorem target; needs local integrability/tail primitive audit |
| 1.12.1 | Theorem | `..._1-100.md:1706` | foundation-lane: uniformity over bounded equicontinuous test classes, local test-class primitive needed |
| 1.12.2 | Theorem | `..._1-100.md:1718` | foundation-lane: bounded-Lipschitz determining-class theorem target, search/wrap mathlib metric weak-convergence APIs |
| 1.12.4 | Theorem | `..._1-100.md:1751` | foundation-lane/mathlib-foundation: bounded-Lipschitz/Levy-Prokhorov metric wrapper target |
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
| 2.4.3 | Theorem | `..._101-200.md:988` | local-layer; Definition 2.1.5 covering primitive, fixed-sample empirical `L1(P_n)` distance/covering-number interface, nonempty empirical-cover positive-cardinality bridge, random empirical covering-number sequence, outer-probability `o_P^*(n)` entropy wrapper, `F_M` truncated-class/envelope interface, Definition 2.3.3 `P`-measurable primitive, deterministic finite-cover supremum-bound layers, fixed-sample empirical-net inequality `(2.4.4)`, finite-center maximal/Hoeffding-scale handoff layer, deterministic Rademacher-sign specialization, one-center random Rademacher sub-Gaussian bridge, variance-proxy arithmetic, finite-center sub-Gaussian tail/union-bound layer, iid real-valued Rademacher-sign construction, and finite-center supremum integrability layer now available; exact theorem still pending sharp tail-to-Orlicz/maximal expectation bound, specialization to truncated centers, symmetrization/truncation, envelope-tail, and final convergence handoffs |
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

Examples and addenda are tracked separately from the 157 theorem-level items
above, so they do not change the theorem-level dashboard counts.

| Item | Kind | Anchor | Current audit status |
| --- | --- | --- | --- |
| 2.3.4 | Example | `..._101-200.md:630` | deferred-example local-layer: pointwise/countable-subclass predicates, pointwise-to-weighted-sum convergence helpers, value-set/boundedness infrastructure for the real supremum display, bounded pointwise-approximability-to-supremum-equality bridge, deterministic finite-cover supremum bound, and the proof-carrying supremum-equality handoff to `P`-measurability; exact example closure is deferred unless needed by a theorem |
| 2.4.2 | Example | `..._101-200.md:985` | deferred-example local-layer: real half-line indicator bracket membership, endpoint integrability, `L1(P)` width identity, extended-real endpoint indicators/brackets for `-∞`/`∞`, extended-open-cell endpoint identities and width identity, probability-measure CDF/Stieltjes open-cell identity and CDF-increment-to-middle-width handoffs, finite-measure real-tail cutpoint lemma, adjacent-endpoint grid handoff, supplied finite-grid bridges to the primitive bracketing-number witness, one-cell base grid and one-cell adjacent-endpoint base grid for radii above total mass, radius-monotonicity helpers for supplied real/extended/adjacent-endpoint grids, finite-real-endpoint assembly constructor, three-cell endpoint-grid constructor from supplied lower-tail/middle-cell/upper-tail width bounds and CDF increment bounds, bounded-middle CDF partition interface `SuppliedRealMiddleCDFPartition` with adjacent-endpoint strictness and open-cell width handoff, tail-appending endpoint constructor and endpoint-grid existence handoff from a supplied middle partition, reduction from uniform bounded middle partitions to full endpoint-grid existence, primitive-grid existence, and bracketing-number finiteness to the nontrivial range `epsilon <= μ.real univ`, all-positive-radius handoff to the Theorem 2.4.1 `N_[] < ∞` hypothesis, conditional half-line GC corollary from supplied grids, and conditional half-line GC corollary from adjacent endpoint grids; distribution-dependent bounded middle CDF/quantile partition and exact empirical-CDF report are deferred unless needed by a theorem |

## Priority Order

1. Finish Chapter 1.2 arbitrary-map outer expectation/inner probability:
   extended-real compatibility, remaining exact Lemma 1.2.3 clauses beyond
   the nonnegative indicator equality, and Fubini-compatible statements.
2. Promote Chapter 1.3-1.12 foundation wrappers systematically, starting with
   mathlib-backed measure-level weak convergence, Portmanteau, tightness,
   continuous mapping, product laws, convergence in distribution, Hilbert, and
   bounded-Lipschitz metrics.  Mark only the exact VdV&W arbitrary-map or
   representation extensions as blocked when the needed primitive is genuinely
   absent.
3. Promote Chapter 2 primitive infrastructure: covering/packing semimetric
   numbers, `P`-measurable classes, Orlicz norms, and separability wrappers.
   Definition 2.1.5 now has a local covering-number primitive layer,
   Definition 2.2.3 now has semimetric covering/packing wrappers, and
   Definition 2.3.3 now has a deterministic finite-cover supremum bound for
   display `(2.3.2)`; the fixed-sample and random empirical `L1(P_n)`
   covering-number/entropy interfaces, the `F_M` truncated-class/envelope
   interface, the fixed-sample net inequality `(2.4.4)`, the finite-center
   maximal/Hoeffding-scale handoff layer, and the deterministic
   Rademacher-sign specialization and one-center sub-Gaussian bridge are now
   available, and the nonempty empirical-cover positive-cardinality bridge,
   truncated-envelope variance-proxy arithmetic, finite-center sub-Gaussian
   tail/union-bound layer, iid real-valued Rademacher-sign construction, and
   finite-center supremum integrability layer are now compiled.  The next
   frontier is proving or primitive-registering the sharp
   tail-to-Orlicz/maximal expectation conversion used in Theorem 2.4.3,
   specializing it to truncated centers, then symmetrization/truncation and the
   envelope-tail handoff.
4. Defer exact example closures by default.  The Example 2.4.2 endpoint-grid
   and CDF/Stieltjes layers remain available if a theorem needs them, but the
   main line now moves directly to Theorem 2.4.3 and its Chapter 2
   bracketing/measurable-class prerequisites.
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
