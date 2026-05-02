# VdV&W Formalization Status Through Theorem 2.4.1

This document records the current Lean base, the textbook anchors through
VdV&W Theorem 2.4.1, and the remaining formalization needed before the repo can
claim the full textbook theorem.

The comprehensive named-item inventory for every Chapter 1 and Chapter 2 item
through Theorem 2.4.1 is maintained in:

```text
docs/vdvw_pre_2_4_1_named_item_inventory.md
```

## Current Verified Lean Base

Tracked Lean files are intentionally restricted to the empirical-process core
and minimal deterministic support:

| File | Role |
| --- | --- |
| `StatInference/Asymptotics/Basic.lean` | deterministic deviation/oracle support lemmas |
| `StatInference/EmpiricalProcess/Basic.lean` | empirical-deviation, GC, finite-class interfaces |
| `StatInference/EmpiricalProcess/Average.lean` | finite-sample empirical averages and empirical-risk notation |
| `StatInference/EmpiricalProcess/Finite.lean` | finite-union and finite-class deviation certificates |
| `StatInference/EmpiricalProcess/Preservation.lean` | projection/subclass preservation lemmas |
| `StatInference/EmpiricalProcess/Complexity.lean` | proof-carrying complexity interfaces |
| `StatInference/EmpiricalProcess/Bracketing.lean` | deterministic bracketing inequality and route to GC |
| `StatInference/EmpiricalProcess/BracketingPrimitive.lean` | primitive brackets, `L1(P)` width, finite covers, and primitive cover-to-route theorems |
| `StatInference/EmpiricalProcess/BracketingCountable.lean` | countable decreasing finite-cover route |
| `StatInference/EmpiricalProcess/EndpointStrongLaw.lean` | endpoint SLLN wrappers from mathlib |
| `StatInference/EmpiricalProcess/EndpointSamples.lean` | iid sample-path endpoint SLLN bridge for finite bracket covers |
| `StatInference/EmpiricalProcess/GlivenkoCantelli.lean` | generic outer-probability convergence primitives and local/outer GC wrappers for the primitive bracketing theorem |

Old local non-empirical-process theorem experiments are not part of this clean
repo.  The current tracked Lean library has no `sorry`, `admit`, `axiom`, or
`unsafe` in `StatInference`.

Current verification gate:

```bash
lake build
rg -n "\\bsorry\\b|\\badmit\\b|\\baxiom\\b|unsafe" . -g '*.lean' -g '!.lake/**'
```

Expected result: build succeeds and the proof-hole scan returns no matches.

## Textbook Anchors

The local markdown/PDF/screenshot assets are ignored by Git but available for
private review in `Textbooks/Vaart1996/`.

The full inventory through Theorem 2.4.1 contains 102 named items: 70 in
Chapter 1, 31 in Chapter 2 before Theorem 2.4.1, and Theorem 2.4.1 itself.
The table below is only the active direct-proof anchor subset.

| Textbook item | Markdown anchor | Current Lean status |
| --- | --- | --- |
| Definition 1.10.1, convergence in outer probability to a constant | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1406` | generic constant-limit and common-domain outer-probability primitives formalized; uniform-deviation predicates and conditional tail-continuity bridge formalized |
| GC definition for uniform LLN | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1828-1834` | book-style predicate formalized with outer-probability and outer-a.s. branches |
| Definition 2.1.5, covering numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1894` | only abstract proof-carrying interface exists |
| Definition 2.1.6, bracketing numbers | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_1-100.md:1895` | primitive bracket, epsilon-bracket, finite-cover, and numeric `N_[]` layers formalized |
| Chapter 2.4 intro | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:963-969` | reflected in roadmap only |
| Theorem 2.4.1 statement | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:970` | proved as `vdVW_theorem_2_4_1_glivenkoCantelli` via the outer-a.s. branch |
| Theorem 2.4.1 proof, finite brackets and endpoint inequality | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:972-981` | deterministic bracketing theorem proved |
| Theorem 2.4.1 proof, endpoint SLLN and decreasing radius | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:984` | endpoint SLLN wrapper, iid sample-path bridge, finite endpoint-radius bridge, and countable/decreasing-scale assembly proved |
| Example 2.4.2, empirical CDF brackets | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:985` | pending example formalization |

Current screenshot anchors:

```text
Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png
Textbooks/Vaart1996/Screenshots/vdvw_definition_1_10_1_pdf_page_72.png
Textbooks/Vaart1996/Screenshots/vdvw_gc_definition_pdf_page_96.png
Textbooks/Vaart1996/Screenshots/vdvw_definition_2_1_6_pdf_page_98.png
```

## What Is Already Proved Toward Theorem 2.4.1

The following are compiled Lean declarations with no proof holes:

| Lean declaration | Textbook proof role |
| --- | --- |
| `empiricalDeviationBoundOn_of_bracket_endpoint_bounds` | formalizes the deterministic bracket comparison step |
| `empiricalDeviationSequenceOn_of_bracket_endpoint_bounds` | packages that comparison across sample sizes |
| `bracketingGlivenkoCantelliClass_of_endpoint_and_width_tendsto_zero` | converts vanishing endpoint and width radii into the current GC interface |
| `FiniteBracketingEndpointRoute` | proof-carrying finite-bracket route |
| `FiniteBracketingEndpointRoute.toGlivenkoCantelliClass` | converts a verified route into `GlivenkoCantelliClass` |
| `endpoint_strong_law_ae_real` | wraps mathlib strong law for one endpoint |
| `finite_endpoint_strong_law_ae_real` | finite endpoint family strong-law handoff |
| `samplePath`, `empiricalAverage_samplePath_eq_range_sum` | deterministic sample path from an observation process and its range-sum rewrite |
| `endpoint_empiricalAverage_sub_population_tendsto_zero_ae_of_iid` | iid endpoint empirical average converges almost surely to the population integral |
| `FiniteL1BracketCover.endpoint_tendsto_ae_of_iid`, `FiniteL1BracketCover.exists_endpointRadius_ae_of_iid` | fixed finite bracket cover gets endpoint convergence and endpoint-radius fields almost surely |
| `FunctionBracket`, `MemFunctionBracket`, `l1BracketWidth`, `IsL1EpsilonBracket` | primitive Definition 2.1.6 bracket vocabulary |
| `FiniteBracketCover`, `FiniteL1BracketCover` | finite primitive cover witnesses with integrability and width evidence |
| `FiniteL1BracketCoverAtCard`, `HasFiniteL1BracketingNumber` | explicit-cardinality finite bracketing witness layer |
| `l1BracketingNumber`, `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` | primitive numeric `N_[] : ℕ∞` and finite-cover bridge |
| `finiteEndpointRadius`, `exists_endpointRadius_of_finite_endpoint_tendsto` | finite endpoint convergence produces one vanishing endpoint-radius sequence |
| `FiniteL1BracketCover.endpointRadius`, `FiniteL1BracketCover.exists_endpointRadius_of_endpoint_tendsto` | primitive-cover endpoint-radius bridge |
| `FiniteL1BracketCover.empiricalDeviationBoundOn_of_endpoint_bounds` | one-sample primitive-cover deviation bound |
| `FiniteL1BracketCover.empiricalDeviationSequenceOn_of_endpoint_bounds` | sequence-level primitive-cover deviation bound |
| `FiniteL1BracketCover.toFiniteBracketingEndpointRoute` | primitive cover constructor into the existing finite endpoint route |
| `PrimitiveFiniteBracketingGCRoute.ofFiniteCoversAndEndpointTendsto` | route constructor from finite covers and endpoint convergence |
| `PrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | epsilon/eventual deterministic route from primitive finite covers |
| `CountablePrimitiveFiniteBracketingGCRoute.uniformDeviationTendstoZeroOn` | countable decreasing-cover deterministic route |
| `uniformDeviationTendstoZeroOn_ae_of_iid_countable_covers` | iid observations plus countably many finite covers imply a.s. pathwise uniform deviation convergence |
| `uniformDeviationTendstoZeroOn_ae_of_iid_l1BracketingNumber_lt_top` | primitive `N_[]` finiteness at every positive radius implies a.s. pathwise uniform deviation convergence |
| `AlmostSureUniformDeviationTendstoZeroOn` | names the ordinary a.s. pathwise uniform LLN convergence mode used by the local GC wrapper |
| `VdVWAlmostSureGlivenkoCantelliClass` | packages iid law/independence assumptions and the local GC conclusion |
| `almostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top` | converts primitive `N_[]` finiteness into the named a.s. convergence wrapper |
| `vdVWAlmostSureGlivenkoCantelliClass_of_iid_l1BracketingNumber_lt_top` | packages the primitive bracketing theorem as a local a.s. pathwise Glivenko-Cantelli conclusion |
| `VdVWOuterProbability`, `VdVWOuterAlmostSure` | formalize outer probability of arbitrary events and outer-a.s. truth using mathlib's outer-measure semantics for `Measure` |
| `VdVWConvergesInOuterProbabilityConst`, `VdVWConvergesInOuterProbability` | generic VdV&W outer-probability convergence primitives for varying-space constant limits and common-domain limits |
| `vdVWConvergesInOuterProbability_of_tendstoInMeasure` | bridge from mathlib `TendstoInMeasure` to the common-domain VdV&W outer-probability predicate |
| `VdVWOuterAlmostSureUniformDeviationTendstoZeroOn`, `VdVWOuterAlmostSurePGlivenkoCantelliClass` | exact outer-a.s. uniform LLN and `P`-Glivenko-Cantelli predicates |
| `vdVWOuterAlmostSureUniformDeviationTendstoZeroOn_of_iid_l1BracketingNumber_lt_top` | converts primitive `N_[]` finiteness into outer-a.s. uniform deviation convergence |
| `vdVW_theorem_2_4_1_outerAlmostSureGlivenkoCantelli` | VdV&W Theorem 2.4.1 in the outer-a.s. convergence mode |
| `VdVWOuterProbabilityUniformDeviationTendstoZeroOn`, `VdVWOuterProbabilityPGlivenkoCantelliClass` | outer-probability convergence-mode predicates |
| `VdVWOuterProbabilityUniformDeviationTailTendstoZeroOn`, `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_tail` | tail-event sufficient condition for the direct outer-probability branch |
| `VdVWUniformDeviationBadEvent`, `VdVWUniformDeviationBadTailEvent`, `VdVWUniformDeviationBadInfinitelyOftenEvent` | bad-event vocabulary for fixed sample sizes, future tails, and infinitely-often failures |
| `vdVWUniformDeviationBadInfinitelyOften_subset_not_tendsto` | infinitely many fixed-tolerance failures imply pathwise uniform convergence fails |
| `VdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn` | tail outer-probabilities converge to the outer probability of the bad-limsup event |
| `vdVWOuterProbabilityUniformDeviationTailTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup` | outer-a.s. convergence plus tail-limsup continuity gives vanishing future-tail outer probabilities |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_tail_tendsto_limsup` | same hypotheses give the direct outer-probability convergence branch |
| `vdVWOuterProbabilityUniformDeviationTailTendstoLimsupOn_of_isFiniteMeasure_of_nullMeasurable_badEvent` | finite-measure continuity from above gives the tail-limsup condition from fixed bad-event null measurability |
| `vdVWOuterProbabilityUniformDeviationTendstoZeroOn_of_outerAlmostSure_of_isFiniteMeasure_of_nullMeasurable_badEvent` | outer-a.s. convergence implies direct outer-probability convergence under fixed bad-event null measurability |
| `vdVW_theorem_2_4_1_outerProbabilityGlivenkoCantelli_of_nullMeasurable_badEvent` | VdV&W Theorem 2.4.1 in the direct outer-probability mode under the null-measurable bad-event bridge |
| `VdVWPGlivenkoCantelliClass` | book-style GC predicate: outer probability or outer almost surely |
| `vdVW_theorem_2_4_1_glivenkoCantelli` | VdV&W Theorem 2.4.1 packaged into the book-style GC predicate |

This is now the dependency-minimal finite-bracketing theorem in the local
pathwise, outer-a.s., and book-style GC interfaces.  The final book-style
predicate is proved through the outer-a.s. branch used by the textbook proof.
A tail-event sufficient condition for the direct outer-probability branch is
also proved.  The repo now additionally proves a conditional conversion from
outer-a.s. convergence to the direct outer-probability branch, assuming the
future-tail outer probabilities converge to the outer probability of the
bad-infinitely-often event.  It also proves that this tail-continuity condition
follows from fixed bad-event null measurability and finite sample-space measure,
using mathlib's continuity from above.  Deriving fixed bad-event
null-measurability from concrete function-class/sample-process measurability
remains future compatibility work with broader Chapter 1 arbitrary-map
machinery.

## Dependency-Minimal Remaining Work For Theorem 2.4.1

These are the missing primitives and lemmas on the direct proof path.

| Order | Missing item | Textbook source | Lean target shape |
| --- | --- | --- | --- |
| 1 | measurable real function class | Theorem 2.4.1 statement | represent `F : Set (Omega -> Real)` with endpoint/function measurability assumptions |
| 2 | pointwise bracket `[l, u]` | Definition 2.1.6 | done: `FunctionBracket`, `MemFunctionBracket` |
| 3 | epsilon bracket | Definition 2.1.6 | done: `IsL1EpsilonBracket` |
| 4 | `L1(P)` bracket width | Definition 2.1.6 and Theorem 2.4.1 | done: `l1BracketWidth` as integral of `abs (u - l)` |
| 5 | finite bracket cover | Definition 2.1.6 | done: `FiniteBracketCover`, `FiniteL1BracketCover` |
| 6 | primitive bracketing number `N_[]` | Definition 2.1.6 | done: `l1BracketingNumber : ℕ∞` with finite case from least `Nat.find` cardinality |
| 7 | finite bracketing hypothesis to cover witness | Theorem 2.4.1 statement | done: `exists_finiteL1BracketCover_of_l1BracketingNumber_lt_top` |
| 8 | population order lemmas | proof lines 972-981 | done using mathlib `integral_mono` |
| 9 | empirical order lemmas | proof lines 972-981 | done using finite sums |
| 10 | endpoint empirical averages | proof line 984 | done for fixed finite covers: `EndpointSamples.lean` connects iid samples to endpoint empirical averages |
| 11 | endpoint convergence to route fields | proof line 984 | done: `finiteEndpointRadius`, `FiniteL1BracketCover.endpointRadius`, and route constructor from endpoint convergence |
| 12 | construct `FiniteBracketingEndpointRoute` | proof lines 972-984 | done from primitive finite `L1(P)` cover plus endpoint/width assumptions |
| 13 | decreasing-radius argument | proof line 984 | done for the dependency-minimal deterministic and iid countable-cover routes |
| 14 | final textbook theorem | Theorem 2.4.1 statement | done as book-style GC predicate: `vdVW_theorem_2_4_1_glivenkoCantelli`; direct outer-probability theorem also proved under fixed bad-event null-measurability and finite-measure assumptions |

## Full Textbook-Order Work Before 2.4.1

If the goal is literal coverage of every named item before Theorem 2.4.1, the
repo also needs the named material in Chapter 1 and Sections 2.1-2.3. This is
separate from the dependency-minimal proof of Theorem 2.4.1.

| Section | Named content before 2.4.1 | Current status |
| --- | --- | --- |
| 1.2 | outer probabilities, measurable covers, outer/inner Fubini | not formalized locally; mathlib measure/Fubini foundations reusable but VdV&W outer layer missing |
| 1.3 | weak convergence of arbitrary maps, asymptotic measurability/tightness, Portmanteau/Prohorov | mathlib measure-level weak convergence and Portmanteau/Prokhorov foundations exist; VdV&W arbitrary-map wrappers pending |
| 1.4 | product weak convergence, asymptotic independence, Slutsky | not formalized locally |
| 1.5-1.7 | `l_infty(T)`, tightness/equicontinuity, separability, ball measurability, Suslin examples | not formalized locally |
| 1.8 | Hilbert-space weak convergence material | not formalized locally |
| 1.9-1.12 | convergence in outer probability, extended continuous mapping, uniform integrability, bounded Lipschitz metric | not formalized locally |
| 2.1 | empirical-process examples, covering numbers, bracketing numbers, Donsker overview examples/proposition | only empirical-process interfaces and averages exist |
| 2.2 | Orlicz norm lemmas, covering/packing definition, chaining maximal inequality, Hoeffding/Bernstein inequalities | not formalized locally |
| 2.3 | symmetrization, measurable classes, separability/lifting, Donsker separable modification results | not formalized locally |

Theorem 2.4.1 itself uses Definition 2.1.6 and the real-valued strong law
directly; it does not require the maximal inequalities or symmetrization
machinery from Sections 2.2-2.3.

Pinned mathlib already supplies large parts of the mathematical foundation:
measure theory, probability measures, integration, product/Fubini theorems,
`L1`/`Lp` infrastructure, weak convergence of measures, Portmanteau-related
results, Prokhorov-related files, iid/independence primitives, and a real strong
law.  It does not appear to contain VdV&W's empirical-process-specific
bracketing-number Glivenko-Cantelli theorem.  The exact outer-a.s. event
semantics needed for Theorem 2.4.1 are now represented locally using
mathlib's outer-measure semantics for `Measure`; the broader Chapter 1
outer-probability and arbitrary-map formalism is still pending.

## Report Requirement

Every newly completed theorem or theorem layer derived from VdV&W must add a
report under `Reports/`. The report must include a side-by-side cross-check:

| Required column | Meaning |
| --- | --- |
| Lean realization | declaration name, file, kind, and exact formal role |
| Textbook markdown anchor | local markdown file and line range; include only a short excerpt or paraphrase in public tracked docs |
| PDF screenshot anchor | local screenshot path for the corresponding textbook passage |
| Status/gap | exact theorem, proved layer, proof-carrying interface, or pending primitive |

Long textbook excerpts and screenshots remain local-only review material and
should not be committed to the public repository.
