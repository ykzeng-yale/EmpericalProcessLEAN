# Durrett 2019 Probability Theory Formalization Blueprint

This document starts the Durrett 2019 probability-theory lane for the Lean
formalization in `StatInference/`.  The source crosswalk is Richard Durrett,
*Probability: Theory and Examples*, fifth edition, 2019.  The Lean code for
Durrett-specific theorem packaging should live in the content-based folder
`StatInference/ProbabilityTheory/`; reusable lower-level probability-measure
infrastructure should continue to live in `StatInference/ProbabilityMeasure/`.

The lane follows the existing Billingsley and Optimization proof-orchestration
style inside this chat: search first, reuse mathlib and local wrappers
aggressively, prove theorem-sized Lean packets, verify locally, update the
route docs, then sync GitHub.  The goal is full-book coverage over time, but
each in-thread cycle should choose the next largest theorem step that can
actually compile.

## Working Methodology

The fastest reliable pattern in this lane is to maintain an explicit theorem
pipeline map: textbook source hypotheses, product-law/independence support,
pointwise convergence, finite cutpoint aggregation, uniform partition squeeze,
and final textbook displays.  Each proof packet should close the first missing
edge in that pipeline rather than adding another variant of an already covered
display.

Before editing, search exact theorem-name prefixes and source-shape suffixes
(`iIndepFun`, `hasLaw_infinitePi`, `identDistrib`, `pairwise`, `canonical`,
`oneBased`) in both the Durrett file and the local reusable folders.  Add a
route-named wrapper only when it removes repeated source unpacking, exposes a
Durrett display, or gives a later theorem a stable theorem-sized input.

Common drag sources to avoid: stale app-level goal text, re-entering solved
product-display branches, relying on a theorem that appears later in the same
file, and doing a full root build before checking whether another agent moved
`origin/main`.  The preferred verification rhythm is focused Lean first,
module build second, fetch/rebase, root build on the rebased tree, then one
last fetch before commit and push.

## Local Sources

- Markdown chunks:
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_245-366.md`
  - `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_367-490.md`
- PDF anchors:
  - `Textbooks/Durrett2019ProbabilityTheory/PDF/Durrett2019 - Probability Theory and Examples.pdf`
  - matching split PDFs in the same directory.

## In-Thread Goal Maintenance

The current blocker plan contains `Live In-Thread Goal Prompt V534`, the live
`/goal` replacement prompt.  Use it when the app-level objective is older than
the verified route docs; do not create a duplicate goal or recurring
automation.

Current immediate target after V534: stay on Durrett Theorem 2.4.9
Glivenko-Cantelli plus Chapter 2.1 independence/product-law/product-
expectation support.  Theorem 2.4.9 source-entry plumbing through V390 is
compiled; V477 added the nonnegative `lintegral` branch of Theorem 2.1.13; and
V478 adds Durrett Theorem 2.1.12 nonnegative separated product-measure and
independent-pair product-expectation wrappers; V479 adds law-side Theorem
2.1.12 nonnegative and integrable separated-product wrappers from `HasLaw`
hypotheses; V480 adds law-side Theorem 2.1.13 finite/range/Ico
product-expectation and iid power wrappers; V481 adds the measurable law-side
nonnegative `ℝ≥0∞` branch for finite/range/Ico products and iid powers; V482
adds the law-side real nonnegative `ENNReal.ofReal` branch for finite/range/Ico
products and iid powers; V483 adds finite-dimensional infinite-product
restriction and finite-cylinder probability wrappers for Theorem 2.1.11; V484
adds one-based finite-prefix cylinder probability wrappers from iid source
hypotheses; V485 adds `Fin n` finite-prefix product-law `HasLaw` wrappers from
iid source hypotheses and canonical infinite-product coordinates; V486 adds
the general/non-iid finite-prefix product-law and joint infinite-product
extraction wrappers; V487 adds arbitrary finite-index-set product-law and
cylinder probability wrappers from source independence/marginal laws; V488
adds the shifted one-based arbitrary finite-index-set product-law and cylinder
probability wrappers from source independence/marginal laws; V489 adds the
matching shifted one-based arbitrary finite-index-set product-law and cylinder
probability wrappers from joint infinite-product law hypotheses; V490 adds
canonical iid arbitrary finite-index-set product-law and cylinder probability
wrappers for the infinite product coordinate process; V491 adds one-based
finite-prefix cylinder displays from joint infinite-product laws and canonical
coordinates with prefix-indexed cylinder sets; V492 adds reusable
event-independence extraction wrappers from `iIndepFun`, joint
`Measure.infinitePi` laws, and canonical product coordinates; V493 adds
closed/open real half-line event-independence wrappers for the empirical-CDF
and left-limit events used by Theorem 2.4.9; V494 adds matching finite-prefix
closed/open real half-line cylinder probability displays over `Finset.range n`
for source, joint-law, and canonical iid forms; V495 adds matching literal
one-based `{1, ..., n}` half-line cylinder displays over `Finset.Icc 1 n`,
including identical-distribution source wrappers; V496 promotes the closed and
open half-line displays to real-valued CDF and CDF-left-limit finite products.
V497 fills the joint-law, identical-distribution, and canonical range/
shift-range CDF-display variants.  V498 adds finite-cutpoint closed/left
empirical-CDF burn-in wrappers for `iIndepFun`, identical-distribution source,
and pairwise-identically-distributed source hypotheses.  V499 adds the
matching middle-partition-with-tails source wrappers for identical-distribution
and pairwise-identically-distributed hypotheses, including exact one-based
textbook displays.  V500 adds the countable supplied-partition and final
middle-partition outer-a.s. endpoint source wrappers for the same
identical-distribution and pairwise-identically-distributed hypotheses.  V501
adds direct zero-based final middle-partition endpoint wrappers for
`iIndepFun`, joint `Measure.infinitePi` laws, and canonical iid product
samples.  V502 adds the matching route-named one-based empirical-CDF endpoints
from the final middle-partition construction for source, joint-law,
shifted-joint-law, canonical iid, identical-distribution, and
pairwise-identically-distributed source shapes.  V503 promotes pairwise-iid
one-based source extraction to Chapter 2.1 and rewires the 2.4.9 pairwise
one-based consumers to reuse that earlier theorem.  V504 adds the concrete
Theorem 2.1.10 first-variable/tail-product independence wrappers and the
matching Theorem 2.1.13 expectation-factorization and zero-mean corollaries in
zero-based and one-based notation.  V505 adds source-shaped Durrett Theorem
2.1.15 CDF-convolution wrappers for iid, identical-distribution, joint
infinite-product, canonical product-coordinate, one-based, and pairwise
identically-distributed source hypotheses.  V506 adds the matching
source-shaped Durrett Theorem 2.1.16 additive-convolution law wrappers for
iid, identical-distribution, joint infinite-product, canonical
product-coordinate, one-based, and pairwise identically-distributed source
hypotheses.  V507 adds the matching Theorem 2.1.16 left-density and
two-density source wrappers, in both `ℝ≥0∞` and real-valued
`ENNReal.ofReal` density forms, for the same zero-based, one-based,
joint-law, canonical, identical-distribution, and pairwise source shapes.
V508 adds the matching Theorem 2.1.16 density-existence source wrappers from
absolute-continuity of the common law, plus real-density `ENNReal.ofReal`
specializations, for the same source shapes.  V509 adds the matching
Theorem 2.1.16 supplied-density source wrappers from a supplied
convolution-density identity, for the same source shapes.  V510 adds
zero-based Theorem 2.4.9 pointwise empirical-CDF and left empirical-CDF
convergence source wrappers for identical-distribution plus `iIndepFun` and
pairwise-identically-distributed source hypotheses, in raw empirical-function,
range-sum, and exact `n⁻¹ * sum` display forms.  V511 adds the matching
one-based Theorem 2.4.9 pointwise empirical-CDF and left empirical-CDF
convergence source wrappers for `iIndepFun`, joint infinite-product, shifted
joint infinite-product, identical-distribution plus `iIndepFun`, and
pairwise-identically-distributed source hypotheses, in raw empirical-function
and range-sum display forms.  V512 adds the matching one-based
finite-cutpoint burn-in wrappers for the same source shapes plus canonical iid
product samples, in raw shifted empirical-function and range-sum display
forms.  V513 adds the matching one-based bounded middle-partition squeeze
wrappers for source, joint-law, shifted-joint-law, identical-distribution,
pairwise-identically-distributed, and canonical iid source shapes, in raw
shifted empirical-function and range-sum display forms.  V514 adds the
matching one-based global middle-partition-with-tails squeeze wrappers for
source, joint-law, shifted-joint-law, identical-distribution,
pairwise-identically-distributed, and canonical iid source shapes, in raw
shifted empirical-function and range-sum display forms.  V515 adds the
matching arbitrary-tolerance one-based global middle-partition-with-tails
squeeze wrappers for the same source shapes, in raw shifted empirical-function
and range-sum display forms.  V516 adds the matching one-based route-named
`middlePartitionWithTails` outer-a.s. uniform-deviation range-sum endpoints
for source, joint-law, shifted-joint-law, identical-distribution,
pairwise-identically-distributed, and canonical iid source shapes.  V517 adds
the matching zero-based route-named `middlePartitionWithTails` outer-a.s.
uniform-deviation range-sum and exact `n⁻¹ * sum` endpoints for the generic
pairwise route plus source, joint-law, canonical iid, identical-distribution,
and pairwise-identically-distributed source shapes.  V518 adds one-based
Chapter 2.1.10 late-increment/partial-sum-difference independence wrappers and
one-based Chapter 2.1.13 partial-sum-difference mixed-term-zero wrappers for
the Kolmogorov-maximal route, and rewires the one-based first-crossing mixed
term to consume that Chapter 2.1.13 surface directly.  V519 adds one-based
Chapter 2.1.13 range/Ico product-expectation wrappers, zero-factor
corollaries, nonnegative `lintegral` wrappers, real nonnegative
`ENNReal.ofReal` wrappers, and iid law-side range/Ico power displays.  V520
adds the matching one-based law-side range/Ico product-expectation wrappers
for non-iid dependent-type families, the nonnegative and real nonnegative
law-side branches, and the remaining iid law-side nonnegative power displays.
V521 adds literal one-based `Finset.Icc 1 n` Chapter 2.1.13
product-expectation displays for law-side/source-side ordinary products,
nonnegative `lintegral` products, real nonnegative `ENNReal.ofReal` products,
iid law-side powers, and the source-side zero-factor corollary.
V522 adds source-side iid Chapter 2.1.13 power displays under
`IdentDistrib` for finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n`
ordinary, nonnegative, and real nonnegative product expectations.
V523 adds law-side Chapter 2.1.13 zero-factor corollaries for ordinary,
nonnegative, and real nonnegative finite/range/Ico and one-based
range/Ico/`Finset.Icc 1 n` product expectations.
V524 adds source-side Chapter 2.1.13 absolute-value/norm product displays for
finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n` products, plus iid
`IdentDistrib` power collapses for the same shapes.
V525 adds source-side Chapter 2.1.13 finite-product integrability wrappers for
finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n` products of
independent integrable variables, packaging the expectation-exists step after
the norm-product display.
V526 adds source-side iid Chapter 2.1.13 finite-product integrability wrappers
under `IdentDistrib`: one integrable base marginal gives integrability of
finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n` products.
V527 adds source-side Chapter 2.1.13 expectation-exists-and-value wrappers:
finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n` product formulas
now package product integrability together with the product/power expectation
value, including iid `IdentDistrib` variants from one integrable base
marginal.
V528 adds law-side Chapter 2.1.13 expectation-exists-and-value wrappers:
finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n` `HasLaw` product
formulas now package source-space integrability of the composed product
together with the law-side product or iid power expectation value.
V529 adds source-side Chapter 2.1.13 zero-factor expectation-exists wrappers:
finite/range/Ico and one-based range/Ico/`Finset.Icc 1 n` products now package
product integrability together with the vanishing expectation conclusion when
one integrable factor has expectation zero.
V530 adds the matching law-side Chapter 2.1.13 zero-factor
expectation-exists wrappers for finite/range/Ico and one-based range/Ico/
`Finset.Icc 1 n` `HasLaw` products.
V531 adds source-side iid Chapter 2.1.13 zero-factor expectation-exists
wrappers under `IdentDistrib`, reducing product-term vanishing to one
integrable zero-mean base marginal.
V532 adds law-side iid Chapter 2.1.13 zero-factor expectation-exists wrappers
for common-law `HasLaw` products, reducing composed-product vanishing to one
integrable law-side zero-integral function.
V533 adds source-side composed-function Chapter 2.1.13 zero-factor
expectation-exists wrappers for finite/range/Ico and one-based
range/Ico/`Finset.Icc 1 n` products, reducing composed-product vanishing to
source independence, measurability, integrability of the composed factors, and
one zero composed expectation.
V534 adds source-side composed-function Chapter 2.1.13
expectation-exists-and-value wrappers for finite/range/Ico and one-based
range/Ico/`Finset.Icc 1 n` products, reducing composed-product factorization
to source independence, measurability, and integrability of the composed
factors, without `HasLaw` hypotheses.
The
next packet should close only a proved-missing
2.4.9 proof-step or final-display source wrapper not already covered by V500,
or add the next Chapter 2.1 product-law/product-expectation/sum-law wrapper
that directly supports 2.4.9 or the adjacent Kolmogorov-maximal route.
Do not return to scalar-kernel estimates, annulus mass summability, concrete
majorant integrability, display-wrapper plumbing, branch-combination plumbing,
reciprocal-growth conversion, monotone-convergence shell, linear-tail transfer,
layer-cake/counting plumbing, easy growth cleanup, infinite-mean display
polish, tail-series indexing polish, the nonnegative finite-product
expectation wrappers, the nonnegative independent-pair separated
product-expectation wrappers, or the law-side separated product-expectation
wrappers, or the law-side finite-product expectation/power wrappers, including
the law-side real `ENNReal.ofReal` branch, or the finite-dimensional
infinite-product restriction/cylinder wrappers, or the one-based finite-prefix
cylinder source wrappers, or the `Fin n` finite-prefix product-law wrappers,
or the general/non-iid finite-prefix product-law wrappers,
or the arbitrary finite-index-set product-law/cylinder wrappers,
or the finite-cutpoint closed/left empirical-CDF burn-in source wrappers,
or the middle-partition-with-tails source wrappers,
or the countable supplied-partition/final middle-partition endpoint source
wrappers,
or the direct zero-based final middle-partition endpoint source wrappers,
or the route-named one-based empirical-CDF endpoints from the final
middle-partition construction,
or the Theorem 2.1.15 CDF-convolution source wrappers,
or the Theorem 2.1.16 additive-convolution law source wrappers,
or the Theorem 2.1.16 left-density/two-density source wrappers,
or the Theorem 2.1.16 density-existence source wrappers,
or the Theorem 2.1.16 supplied-density source wrappers,
or the zero-based Theorem 2.4.9 pointwise empirical-CDF/left empirical-CDF
identDistrib and pairwise source wrappers,
or the one-based Theorem 2.4.9 pointwise empirical-CDF/left empirical-CDF
raw/range source wrappers,
or the one-based Theorem 2.1.10 late-increment/partial-sum-difference
independence wrappers and one-based Theorem 2.1.13
partial-sum-difference mixed-term-zero wrappers for the Kolmogorov-maximal
route,
or the one-based Theorem 2.1.13 range/Ico product-expectation wrappers,
zero-factor corollaries, nonnegative `lintegral` wrappers, real nonnegative
`ENNReal.ofReal` wrappers, or iid law-side range/Ico power displays,
or the one-based law-side Theorem 2.1.13 range/Ico product-expectation
wrappers for non-iid families, their nonnegative/real-nonnegative branches,
or the remaining iid law-side nonnegative power displays,
or the literal one-based `Finset.Icc 1 n` Theorem 2.1.13
product-expectation displays for law-side/source-side ordinary, nonnegative,
real nonnegative, iid power, and zero-factor branches,
or the source-side iid Theorem 2.1.13 power displays under `IdentDistrib` for
finite/range/Ico and one-based range/Ico/`Icc` ordinary, nonnegative, and real
nonnegative product expectations,
or the law-side Theorem 2.1.13 zero-factor corollaries for ordinary,
nonnegative, and real nonnegative finite/range/Ico and one-based range/Ico/
`Icc` product expectations,
or the one-based Theorem 2.4.9 finite-cutpoint raw/range burn-in wrappers,
or the one-based Theorem 2.4.9 bounded middle-partition raw/range squeeze wrappers,
or the one-based Theorem 2.4.9 global middle-partition-with-tails raw/range
squeeze wrappers,
or the arbitrary-tolerance one-based Theorem 2.4.9 global
middle-partition-with-tails raw/range squeeze wrappers,
or the one-based route-named Theorem 2.4.9 `middlePartitionWithTails`
outer-a.s. uniform-deviation range-sum endpoints,
or the zero-based route-named Theorem 2.4.9 `middlePartitionWithTails`
outer-a.s. uniform-deviation range-sum/exact `n⁻¹ * sum` endpoints,
unless a focused source check exposes a missing handoff.

Current active frontier for this goal cycle: Durrett Theorem 2.4.9
Glivenko-Cantelli and Chapter 2.1 support in
`StatInference/ProbabilityTheory/Basic.lean`.  Historical compiled inventory
from the preceding Chapter 2.5 lane follows for provenance.  V443 advances
Durrett Theorem 2.5.13, the Feller infinite-mean dichotomy.  The V443 bridge
uses the already-compiled scaled sample-tail Borel-Cantelli limsup event to
prove the textbook partial-sum inequality consequence
`max |S_n| |S_{n+1}| >= |X_{n+1}| / 2`, giving a.e. frequently large
one-based normalized partial sums at level `k / 2`.  V444 adds the
deterministic bridge from all positive integer half-thresholds to frequent
largeness above every real bound.  V445 aggregates the fixed-`k` a.e.
statements over the countable positive integer scales and packages the
uniform-in-`k` Durrett source wrapper.  V446 packages the result as the formal
extended-real `limsup_n |S_n| / a_n = +∞` endpoint for the divergent half.
V447 derives the divergent branch's scaled-tail law, measurability, and event
independence from iid source hypotheses.  V448 starts the convergent half by
defining the moving truncation `Y_n = X_n 1_{|X_n| < a_n}` and proving the
finite-tail Borel-Cantelli eventual-equality handoff, including the iid
`IdentDistrib` source wrapper.  V449 transfers a zero normalized-sum endpoint
from the moving truncations back to the original one-based partial sums using
that eventual equality and `a_n -> ∞`.  V450 proves the moving-truncated
endpoint from summable scaled variances of centered moving truncations plus
normalized convergence of the truncated means, reusing the existing Theorem
2.5.11 Kronecker layer.  V451 discharges the scaled-variance assumption down to
the textbook weighted base moving-truncation second-moment summability by
combining variance domination, iid transfer of the truncated-square integral,
and endpoint wrappers feeding the V450 Kronecker assembly.  V452 packages the
arbitrary-normalizer scalar truncated-square kernel and proves that pointwise
ENNReal kernel majorization by an integrable nonnegative majorant gives the
weighted base second-moment summability, with moving/original endpoint
wrappers consuming that scalar bound.  V453 removes the remaining opaque
truncated-mean `Tendsto` assumption by proving the Kronecker-style
mean-normalization bridge from scaled truncated-mean summability, plus
absolute-scaled summability and scalar-kernel endpoint wrappers.  V454 adds
the deterministic textbook prefix-plus-tail mean squeeze and endpoint wrappers
that consume it.  V455 adds the deterministic finite-annulus bridge: ratio
monotonicity moves `(n/a_n)` inside finite annulus sums as `(m/a_m)`, and a
prefix-plus-finite-annulus mean estimate plus weighted tail bound feeds the
V454 mean squeeze and scalar-kernel endpoint wrappers.  V456 reduces this mean
estimate to the base absolute truncated integral: identical distribution now
proves `|E Y_k|` is bounded by the base absolute truncated integral, and that
integral bound feeds the scalar-kernel moving-truncated endpoint wrapper.  V457
discharges the actual finite-annulus partition for that base integral: it
defines the base absolute annulus integral, proves the scalar finite-annulus
cover, proves integrability of the bounded truncated/annulus indicators, and
proves the integrated bound
`baseAbsTruncIntegral k <= a_N + sum_{r=N+1}^n baseAbsAnnulusIntegral r`.
V458 connects this first-moment annulus bridge to Durrett's identity (*) mass
series: the base absolute annulus integral is nonnegative, is bounded by
`a_r` times the annulus probability, and after multiplying by `r / a_r` is
bounded by `r` times that annulus mass; it also adds the direct tail-bound
transfer into the V455 mean bridge.  This set up the subsequent identity(*)
mass-tail summability and source finite-prefix layers.
V459 adds the deterministic summable-tail layer: finite `Icc (N+1) n` tails
are reindexed as shifted range sums, any nonnegative summable sequence
controls those finite tails by its shifted `tsum`, and summability of
`r * P(a_{r-1} <= |X_0| < a_r)` now directly supplies the exact shifted tail
bound for the weighted base absolute annulus integrals.
V460 adds the finite-prefix identity(*) consumer: any nonnegative mass
sequence whose finite prefixes are bounded by finite prefixes of a summable
nonnegative tail sequence is summable, and the source-shaped prefix inequality
for the annulus mass weights now directly supplies both mass-weight
summability and the weighted base annulus integral tail bound.
V461 proves that source-shaped finite-prefix inequality from the monotone
half-open annulus partition: the weighted prefix is converted to a triangular
finite sum, finite annulus unions are disjoint and contained in the
corresponding large-jump tail event, and the resulting source theorem supplies
mass-weight summability and the weighted base annulus tail bound directly.
V462 plugs that source theorem into the convergent-half mean route: the
monotone annulus partition supplies the base truncated-integral bound, finite
base tail summability plus monotone cutoffs prove the truncated means normalize
to zero, and the scalar-kernel moving-truncated/original endpoints now consume
those source hypotheses directly.
V463 packages Durrett's textbook monotonicity of `a_n / n` into the
eventual finite-annulus ratio estimate `(n/a_n) <= (r/a_r)`, and adds
mean, moving-truncated, and original endpoint wrappers that consume the
source-shaped `a_n / n` monotonicity hypothesis directly.
V464 proves the deterministic reciprocal-square tail estimate used in the
variance half of the proof: monotonicity of `a_n / n` gives
`a_n^{-2} <= (m^2/a_m^2) n^{-2}`, finite `Ico` tails are bounded by
`2*m/a_m^2`, and the corresponding shifted tail is summable with `tsum`
bounded by the same constant.
V465 turns that tail estimate into the annulus-wise scalar-kernel bound:
if `x` lies in `[a_{m-1}, a_m)`, then finite partial sums, the real `tsum`,
and the ENNReal `tsum` of Durrett's arbitrary-normalizer truncated-square
kernel are all bounded by `2*m`.
V466 closes the low-prefix gap needed for global majorant packaging: if
`|x| < a_1`, then finite partial sums, the real `tsum`, and the ENNReal
`tsum` of the same scalar kernel are all bounded by `2`, without any annulus
lower-bound hypothesis.
V467 packages the global deterministic cover and source-shaped majorant
handoff: shifted divergence of `a_{n+1}` puts every real point either in the
low prefix or in a half-open annulus; any real `g` dominating `2` on the
prefix and `2*m` on annulus `m` now dominates the scalar kernel `tsum`, feeds
the weighted base second-moment summability handoff, and feeds the
moving/original convergent-half endpoint wrappers under the existing finite
base tail and ratio-monotone hypotheses.
V468 defines the concrete annulus-series majorant
`2 + tsum_m 2*m*1_{a_{m-1} <= |x| < a_m}`, proves its pointwise finite
support and summability when `a_n -> infinity`, proves its nonnegativity and
prefix/annulus domination properties, and adds base-variance plus
moving/original endpoint wrappers where the only remaining majorant-side input
is integrability of this concrete majorant composed with `X_0`.
V469 proves that concrete-majorant integrability from identity(*) mass weights:
each composed annulus term is measurable/integrable, its integral norm is
`2*m` times the half-open annulus mass, the mass-weight series gives summable
integral norms, and a `lintegral_tsum`/`lintegral_ofReal_ne_top_iff_integrable`
argument makes both the annulus series and full concrete majorant integrable.
The concrete-majorant moving/original endpoints now consume finite tail
summability directly, with no external majorant-integrability assumption.
V470 packages the convergent half in the textbook extended-real display:
real convergence of `S_n / a_n` now implies `limsup_n |S_n| / a_n = 0`, and
the V469 concrete-majorant endpoint now feeds the iid one-based partial-sum
source wrapper directly.
V471 assembles the two branch endpoints into a single Feller-dichotomy theorem:
finite real tail summability gives the zero extended-real limsup display, and
divergent ENNReal tail series gives the `+∞` extended-real limsup display,
under the exact iid and growth hypotheses currently consumed by the branch
routes.
V472 removes the easiest remaining explicit growth hypotheses from the
convergent branch and final assembly: monotonicity supplies increment
nonnegativity, `n / a_n -> 0` plus positivity supplies `a_n -> infinity`, and
shifted divergence follows from `a_n -> infinity`.
V473 packages Durrett's textbook source-growth display into the compiled
route: `a_n / n -> infinity` now directly feeds the reciprocal condition
`n / a_n -> 0`, and both the convergent-half display and final Feller
dichotomy have wrappers consuming the textbook growth limit.
V474 separates the infinite-mean growth handoff from its remaining analytic
core: monotone convergence plus non-integrability now force
`a_n / n -> infinity` once the bounded-ratio finite-tail case is shown
integrable, the Feller dichotomy derives that growth only in the finite-tail
branch, and bounded ratios now transfer finite Durrett tail summability to
finite positive linear-grid tail summability.
V475 closes that analytic core: a `Nat.floor` scalar grid-count bound and
`lintegral_tsum` counting bridge prove finite positive linear-grid tail
summability gives `Integrable |X_0|`; bounded-ratio finite Durrett tails now
force integrability; and the infinite-mean source Feller dichotomy consumes
`¬ Integrable |X_0|` without an abstract handoff.
V476 closes the source-display polish for Theorem 2.5.13: the public wrapper
now accepts the textbook infinite-mean display as
`lintegral (ENNReal.ofReal |X_0|) = infinity`, converts unshifted divergent
tail series to the existing one-based divergent branch, and returns the
two-branch extended-real Feller dichotomy directly.
V477 returns the active lane to Durrett Theorem 2.4.9 plus Chapter 2.1 support:
it adds finite/range/Ico nonnegative product-expectation factorization under
`lintegral`, both for `ℝ≥0∞` variables and real nonnegative variables encoded
by `ENNReal.ofReal`.
Do not route back into
solved Theorem 2.5.12 plumbing, the solved Theorem 2.5.13 tail-series
transfer, the solved fixed-`k` Borel-Cantelli partial-sum bridge, the solved
integer-to-real threshold bridge, the solved countable a.e. all-threshold
wrapper, the solved extended-real limsup display, the solved iid
divergent-half scaled-tail plumbing, the solved convergent-half Borel-Cantelli
moving-truncation handoff, or the solved eventual-equality normalized-sum
transfer, the solved moving-truncation Kronecker assembly, or the solved
scaled-variance-to-base-truncated-square handoff, or the solved
scalar-kernel-to-original-endpoint handoff, or the solved
scaled-mean-summability-to-mean-normalization handoff, or the solved
textbook-prefix-plus-tail mean squeeze, the solved finite-annulus ratio/tail
bridge, the solved base-truncated-integral-to-mean bridge, or the solved base
absolute finite-annulus partition/integral bridge, or the solved
annulus-first-moment-to-identity-mass bridge, or the solved
mass-weight-summable-to-shifted-tail-bound bridge, or the solved
finite-prefix-identity(*) consumer, or the solved monotone-annulus
finite-identity bridge, or the solved source mean/original endpoint bridge, or
the solved ratio packaging from Durrett's `a_n / n` monotonicity, or the
solved reciprocal-square p-series/tail estimate, or the solved annulus-wise
scalar-kernel bound, or the solved low-prefix scalar-kernel bound, or the
solved prefix-plus-annulus pointwise majorant and endpoint handoff, or the
solved concrete annulus-series majorant pointwise/endpoint wrappers, or the
solved concrete majorant integrability bridge, or the solved convergent-half
extended-real display wrapper, or the solved two-branch Feller dichotomy
assembly, or the solved easy growth cleanup from monotonicity and
`n / a_n -> 0`, or the solved source-growth wrapper from `a_n / n -> infinity`
to `n / a_n -> 0`, or the solved monotone-convergence contradiction shell, or
the solved bounded-ratio linear-tail transfer, the solved
linear-grid layer-cake/counting bridge, solved infinite-mean source-display
polish, solved tail-series indexing polish, or solved nonnegative finite-
product expectation wrappers.
New compiled anchors through V477:
`durrett2019_theorem_2_1_13_iIndepFun_lintegral_finset_prod_eq_prod_lintegral`,
`durrett2019_theorem_2_1_13_iIndepFun_lintegral_range_prod_eq_prod_lintegral`,
`durrett2019_theorem_2_1_13_iIndepFun_lintegral_Ico_prod_eq_prod_lintegral`,
`durrett2019_theorem_2_1_13_iIndepFun_lintegral_finset_ofReal_prod_eq_prod_lintegral_ofReal`,
`durrett2019_theorem_2_1_13_iIndepFun_lintegral_range_ofReal_prod_eq_prod_lintegral_ofReal`,
`durrett2019_theorem_2_1_13_iIndepFun_lintegral_Ico_ofReal_prod_eq_prod_lintegral_ofReal`,
`durrett2019_theorem_2_5_13_not_integrable_abs_of_lintegral_abs_eq_top`,
`durrett2019_theorem_2_5_13_oneBased_tail_tsum_eq_top_of_tail_tsum_eq_top`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_feller_dichotomy_of_lintegral_abs_eq_top_tail_summable_or_tail_tsum_top_and_ratio_mono`,
`durrett2019_theorem_2_5_13_linear_grid_count_bound`,
`durrett2019_theorem_2_5_13_integrable_abs_of_linear_tail_count_bound`,
`durrett2019_theorem_2_5_13_integrable_abs_of_linear_tail_summable`,
`durrett2019_theorem_2_5_13_integrable_abs_of_bounded_ratio_tail_summable`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_feller_dichotomy_of_not_integrable_abs_tail_summable_or_tail_tsum_top_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ratio_tendsto_atTop_of_not_integrable_abs_of_bounded_ratio_tail_integrable`,
`durrett2019_theorem_2_5_13_linear_tail_measureReal_le_of_ratio_bound`,
`durrett2019_theorem_2_5_13_linear_tail_summable_of_ratio_bound`,
`durrett2019_theorem_2_5_13_linear_tail_tsum_ne_top_of_ratio_bound`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_feller_dichotomy_of_bounded_ratio_tail_integrable`,
`durrett2019_theorem_2_5_13_n_over_a_tendsto_zero_of_ratio_tendsto_atTop`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_eq_zero_of_annulusKernelMajorant_tail_summable_and_ratio_mono_of_ratio_tendsto_atTop`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_feller_dichotomy_of_annulusKernelMajorant_tail_summable_or_tail_tsum_top_and_ratio_mono_of_ratio_tendsto_atTop`,
`durrett2019_theorem_2_5_13_increment_nonneg_of_monotone`,
`durrett2019_theorem_2_5_13_tendsto_atTop_of_n_over_a_tendsto_zero`,
`durrett2019_theorem_2_5_13_shift_atTop_of_atTop`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_eq_zero_of_annulusKernelMajorant_tail_summable_and_ratio_mono_of_n_over_a_tendsto_zero`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_feller_dichotomy_of_annulusKernelMajorant_tail_summable_or_tail_tsum_top_and_ratio_mono_of_n_over_a_tendsto_zero`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_feller_dichotomy_of_annulusKernelMajorant_tail_summable_or_tail_tsum_top_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ereal_limsup_abs_eq_zero_of_tendsto_zero`,
`durrett2019_theorem_2_5_13_ereal_limsup_abs_div_eq_zero_of_tendsto_div_zero`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_eq_zero_of_annulusKernelMajorant_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_measurable_comp`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_integrable_comp`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_integral_comp_eq`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_integral_norm_comp_eq`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_integral_norm_summable_of_mass_weight_summable`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant_series_aestronglyMeasurable_comp`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant_series_integrable_comp_of_mass_weight_summable`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant_integrable_comp_of_mass_weight_summable`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_annulusKernelMajorant_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_annulusKernelMajorant_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_nonneg`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_hasFiniteSupport`,
`durrett2019_theorem_2_5_13_annulusKernelMajorantTerm_summable`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant_nonneg`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant_prefix_bound`,
`durrett2019_theorem_2_5_13_annulusKernelMajorant_annulus_bound`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_ennreal_tsum_le_annulusKernelMajorant_of_ratio_mono`,
`durrett2019_theorem_2_5_13_base_truncated_sq_weighted_summable_of_annulusKernelMajorant_integrable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_annulusKernelMajorant_integrable_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_annulusKernelMajorant_integrable_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_abs_lt_prefix_or_exists_annulus_of_shift_atTop`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_ennreal_tsum_le_majorant_of_ratio_mono`,
`durrett2019_theorem_2_5_13_base_truncated_sq_weighted_summable_of_majorant_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_majorant_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_majorant_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_range_sum_le_prefix_one_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_summable_of_prefix_one_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_tsum_le_prefix_one_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_ennreal_tsum_le_prefix_one_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_nonneg`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_range_sum_le_annulus_index_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_summable_of_annulus_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_tsum_le_annulus_index_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedSqKernel_ennreal_tsum_le_annulus_index_of_ratio_mono`,
`durrett2019_theorem_2_5_13_inv_sq_le_scaled_nat_inv_sq_of_ratio_mono`,
`durrett2019_theorem_2_5_13_inv_sq_Ico_sum_le_ratio_tail_of_ratio_mono`,
`durrett2019_theorem_2_5_13_inv_sq_shift_range_sum_le_ratio_tail_of_ratio_mono`,
`durrett2019_theorem_2_5_13_inv_sq_shift_summable_of_ratio_mono`,
`durrett2019_theorem_2_5_13_inv_sq_shift_tsum_le_ratio_tail_of_ratio_mono`,
`durrett2019_theorem_2_5_13_n_over_a_le_m_over_a_of_ratio_mono`,
`durrett2019_theorem_2_5_13_ratio_eventually_of_ratio_mono`,
`durrett2019_theorem_2_5_13_truncatedMean_normalized_sum_tendsto_zero_of_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_scalar_kernel_bound_tail_summable_and_ratio_mono`,
`durrett2019_theorem_2_5_13_baseAbsTruncIntegral_bound_of_monotone_annulus`,
`durrett2019_theorem_2_5_13_truncatedMean_normalized_sum_tendsto_zero_of_tail_summable_and_monotone`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_tail_summable_and_monotone`,
`durrett2019_theorem_2_5_13_iid_tail_tsum_ne_top_of_real_tail_summable`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_scalar_kernel_bound_tail_summable_and_monotone`,
`durrett2019_theorem_2_5_13_range_nat_mul_eq_triangular_Icc_sum`,
`durrett2019_theorem_2_5_13_baseAbsAnnulus_pairwiseDisjoint`,
`durrett2019_theorem_2_5_13_baseAbsAnnulus_biUnion_subset_tail`,
`durrett2019_theorem_2_5_13_annulus_mass_Icc_tail_le_tail`,
`durrett2019_theorem_2_5_13_mass_weight_prefix_identity_bound_of_monotone`,
`durrett2019_theorem_2_5_13_mass_weight_summable_of_tail_summable_and_monotone`,
`durrett2019_theorem_2_5_13_weighted_baseAbsAnnulus_tail_bound_of_tail_summable_and_monotone`,
`durrett2019_theorem_2_5_13_summable_of_prefix_le_summable_prefix`,
`durrett2019_theorem_2_5_13_mass_weight_summable_of_prefix_identity_bound`,
`durrett2019_theorem_2_5_13_weighted_baseAbsAnnulus_tail_bound_of_prefix_identity_bound`,
`durrett2019_theorem_2_5_13_Icc_succ_tail_sum_eq_range`,
`durrett2019_theorem_2_5_13_Icc_succ_tail_sum_le_tsum_tail_of_summable`,
`durrett2019_theorem_2_5_13_mass_weight_tail_bound_of_summable`,
`durrett2019_theorem_2_5_13_weighted_baseAbsAnnulus_tail_bound_of_mass_weight_summable`,
`durrett2019_theorem_2_5_13_baseAbsAnnulusIntegral_nonneg`,
`durrett2019_theorem_2_5_13_baseAbsAnnulusIntegral_le_cutoff_mul_measureReal`,
`durrett2019_theorem_2_5_13_weighted_baseAbsAnnulusIntegral_le_mass_weight`,
`durrett2019_theorem_2_5_13_weighted_baseAbsAnnulus_tail_bound_of_mass_weight_tail_bound`,
`durrett2019_theorem_2_5_13_baseAbsAnnulusIntegral`,
`durrett2019_theorem_2_5_13_abs_lt_prefix_or_mem_annulus`,
`durrett2019_theorem_2_5_13_abs_trunc_indicator_le_cutoff_add_annulus_sum`,
`durrett2019_theorem_2_5_13_integrable_baseAbsTruncIntegrand`,
`durrett2019_theorem_2_5_13_integrable_baseAbsAnnulusIntegrand`,
`durrett2019_theorem_2_5_13_baseAbsTruncIntegral_le_cutoff_add_annulusIntegral_sum`,
`durrett2019_theorem_2_5_13_baseAbsTruncIntegral`,
`durrett2019_theorem_2_5_13_abs_truncatedMean_le_baseAbsTruncIntegral_of_identDistrib`,
`durrett2019_theorem_2_5_13_prefix_annulus_mean_bound_of_baseAbsTruncIntegral_bound`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_and_baseAbsTruncIntegral_bound`,
`durrett2019_theorem_2_5_13_ratio_mul_annulus_sum_le_weighted_annulus_sum`,
`durrett2019_theorem_2_5_13_textbook_mean_bound_of_prefix_annulus_bound`,
`durrett2019_theorem_2_5_13_truncatedMean_normalized_sum_tendsto_zero_of_prefix_annulus_bound`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_and_prefix_annulus_mean_bound`,
`durrett2019_theorem_2_5_13_mean_normalized_sum_tendsto_zero_of_textbook_tail_bound`,
`durrett2019_theorem_2_5_13_truncatedMean_normalized_sum_tendsto_zero_of_textbook_tail_bound`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_and_textbook_mean_bound`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_scalar_kernel_bound_textbook_mean_bound_and_iid_tail_tsum_ne_top`,
`durrett2019_theorem_2_5_13_truncatedMean_normalized_sum_tendsto_zero_of_scaled_summable`,
`durrett2019_theorem_2_5_13_truncatedMean_scaled_summable_of_abs_scaled_summable`,
`durrett2019_theorem_2_5_13_truncatedMean_normalized_sum_tendsto_zero_of_abs_scaled_summable`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_scaled_summable`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_abs_scaled_summable`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_and_mean_scaled_summable`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_scalar_kernel_bound_mean_abs_scaled_summable_and_iid_tail_tsum_ne_top`,
`durrett2019_theorem_2_5_13_truncatedSqKernel`,
`durrett2019_theorem_2_5_13_base_truncated_sq_weighted_summable_of_kernel_bound`,
`durrett2019_theorem_2_5_13_base_truncated_sq_weighted_summable_of_scalar_kernel_bound`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scalar_kernel_bound_and_mean_tendsto`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_scalar_kernel_bound_mean_tendsto_and_iid_tail_tsum_ne_top`,
`durrett2019_theorem_2_5_13_variance_scaledCenteredTruncated_le_truncated_sq`,
`durrett2019_theorem_2_5_13_integral_truncated_sq_eq_base_truncated_sq_of_identDistrib`,
`durrett2019_theorem_2_5_13_scaled_variance_summable_of_base_truncated_sq_summable`,
`durrett2019_theorem_2_5_13_ae_centered_truncated_oneBased_normalized_sum_tendsto_zero_of_base_truncated_sq_summable`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_13_truncatedMean`,
`durrett2019_theorem_2_5_13_centeredTruncated`,
`durrett2019_theorem_2_5_13_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_13_iIndepFun_centeredTruncated_of_iIndepFun`,
`durrett2019_theorem_2_5_13_integral_centeredTruncated_eq_zero`,
`durrett2019_theorem_2_5_13_ae_centered_truncated_oneBased_normalized_sum_tendsto_zero_of_scaled_variance_summable`,
`durrett2019_theorem_2_5_13_truncated_normalized_sum_tendsto_zero_of_centered_and_mean`,
`durrett2019_theorem_2_5_13_ae_truncated_normalized_sum_tendsto_zero_of_scaled_variance_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_13_normalized_sum_tendsto_zero_of_eventuallyEq`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_truncated_and_eventuallyEq`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_truncated_and_tail_tsum_ne_top`,
`durrett2019_theorem_2_5_13_ae_original_normalized_sum_tendsto_zero_of_truncated_and_iid_tail_tsum_ne_top`,
`durrett2019_theorem_2_5_13_truncated`,
`durrett2019_theorem_2_5_13_truncated_eq_self_of_abs_lt`,
`durrett2019_theorem_2_5_13_truncation_mismatch_subset_tail`,
`durrett2019_theorem_2_5_13_measure_mismatch_le_tail`,
`durrett2019_theorem_2_5_13_oneBased_tsum_mismatch_ne_top_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_13_oneBased_ae_eventuallyEq_truncated_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_13_oneBased_ae_eventuallyEq_truncated_of_iid_tail_tsum_ne_top`,
`durrett2019_theorem_2_5_13_real_scaled_abs_threshold_measurable`,
`durrett2019_theorem_2_5_13_scaled_tail_law_of_identDistrib`,
`durrett2019_theorem_2_5_13_scaled_tail_iIndepSet_of_iIndepFun`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_eq_top_of_iid_tail_tsum_eq_top`,
`durrett2019_theorem_2_5_13_ereal_limsup_eq_top_of_frequently_above_real`,
`durrett2019_theorem_2_5_13_ae_ereal_limsup_oneBased_partial_sum_eq_top_of_tail_tsum_eq_top`,
`durrett2019_theorem_2_5_13_ae_frequently_above_real_of_ae_frequently_nat_halves`,
`durrett2019_theorem_2_5_13_ae_forall_real_frequently_oneBased_partial_sum_large_of_tail_tsum_eq_top`,
`durrett2019_theorem_2_5_13_frequently_above_real_of_frequently_nat_halves`,
`durrett2019_theorem_2_5_13_oneBased_partial_sum_large_frequently_of_mem_scaled_tail_limsup`,
`durrett2019_theorem_2_5_13_ae_frequently_oneBased_partial_sum_large_of_scaled_tail_limsup_ae`,
`durrett2019_theorem_2_5_13_ae_frequently_oneBased_partial_sum_large_of_tail_tsum_eq_top`,
`durrett2019_theorem_2_5_13_not_summable_toReal_of_tsum_eq_top`,
`durrett2019_theorem_2_5_13_tsum_eq_top_of_not_summable_toReal`,
`durrett2019_theorem_2_5_13_scaled_tail_tsum_eq_top_of_oneBased_tail_tsum_eq_top`,
`durrett2019_theorem_2_5_13_borelCantelli_scaled_tail_limsup_eq_one`,
`durrett2019_theorem_2_5_13_subsequence_Icc_sum_eq_range`,
`durrett2019_theorem_2_5_13_summable_of_antitone_subsequence_summable`,
`durrett2019_theorem_2_5_13_not_summable_subsequence_of_not_summable`,
`durrett2019_theorem_2_5_13_block_sums_eq_Ico_tail`,
`durrett2019_theorem_2_5_13_antitone_Ico_tail_sum_le`,
`durrett2019_theorem_2_5_13_inv_mul_Ico_tail_sum_le_subsequence_sum`,
`durrett2019_theorem_2_5_13_scaled_le_of_ratio_mono`,
`durrett2019_theorem_2_5_13_tail_event_subset_scaled_of_ratio_mono`,
`durrett2019_theorem_2_5_13_tail_measure_le_scaled_tail_measure_of_ratio_mono`,
`durrett2019_theorem_2_5_13_antitone_block_sum_le`,
`durrett2019_theorem_2_5_13_antitone_block_sums_le`,
`durrett2019_theorem_2_5_12_textbook_ae_normalized_sum_tendsto_zero_of_finite_p_moment`,
`durrett2019_theorem_2_5_12_scaled_variance_summable_of_base_truncated_sq_summable`,
`durrett2019_theorem_2_5_12_ae_centered_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable`,
`durrett2019_theorem_2_5_12_truncated_normalized_sum_tendsto_zero_of_centered_and_mean`,
`durrett2019_theorem_2_5_12_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_12_centered_endpoint_and_eventuallyEq_of_base_truncated_sq_summable`,
and
`durrett2019_theorem_2_5_12_truncated_endpoint_and_eventuallyEq_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_12_normalized_sum_tendsto_zero_of_eventuallyEq`,
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_truncated_and_eventuallyEq`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_tendsto`,
`durrett2019_theorem_2_5_12_truncatedMean_normalized_sum_tendsto_zero_of_scaled_summable`,
`durrett2019_theorem_2_5_12_truncatedMean_scaled_summable_of_abs_scaled_summable`,
`durrett2019_theorem_2_5_12_truncatedMean_normalized_sum_tendsto_zero_of_abs_scaled_summable`,
`durrett2019_theorem_2_5_12_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_scaled_summable`,
`durrett2019_theorem_2_5_12_ae_truncated_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_abs_scaled_summable`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_mean_abs_scaled_summable`,
`durrett2019_theorem_2_5_12_abs_truncatedMean_le_tail_integral_of_mean_zero`,
`durrett2019_theorem_2_5_12_abs_truncatedMean_le_base_tail_integral_of_identDistrib_mean_zero`,
`durrett2019_theorem_2_5_12_rpow_range_sum_le_one_add_integral`,
`durrett2019_theorem_2_5_12_rpow_range_sum_le_evaluated`,
`durrett2019_theorem_2_5_12_rpow_range_unscaled_bound_ge_one`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_explicit_rpow_bound`, and
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_explicit_rpow_bound_nonneg`,
`durrett2019_theorem_2_5_12_rpow_shifted_tail_sum_le_explicit`,
`durrett2019_theorem_2_5_12_rpow_tail_Ico_sum_le_explicit`,
`durrett2019_theorem_2_5_12_rpow_indicator_range_sum_eq_tail_Ico`,
`durrett2019_theorem_2_5_12_rpow_indicator_tsum_le_explicit`,
`durrett2019_theorem_2_5_12_truncatedSq_unscaled_rpow_indicator_tsum_le_explicit`,
and
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_explicit_rpow_bound`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_explicit_rpow_bound_all`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_explicit_rpow_bound`,
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_explicit_rpow_bound`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_explicit_kernel_bounds`,
`durrett2019_theorem_2_5_12_integrable_of_integrable_abs_rpow`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_finite_p_moment`,
`durrett2019_theorem_2_5_12_truncatedMean_abs_scaled_summable_of_base_tail_scaled_summable`,
and
`durrett2019_theorem_2_5_12_ae_original_normalized_sum_tendsto_zero_of_base_truncated_sq_summable_and_base_tail_scaled_summable`,
`durrett2019_theorem_2_5_12_summable_integral_of_lintegral_tsum_bound`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_kernel_bound`, and
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_kernel_bound`,
`durrett2019_theorem_2_5_12_tailFirstKernel`,
`durrett2019_theorem_2_5_12_scalarTruncated`,
`durrett2019_theorem_2_5_12_truncatedSqKernel`,
`durrett2019_theorem_2_5_12_tailFirstKernel_nonneg`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_nonneg`,
`durrett2019_theorem_2_5_12_tailFirstKernel_ennreal_tsum_le_of_real_tsum_le`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_ennreal_tsum_le_of_real_tsum_le`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_scalar_kernel_bound`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_real_scalar_kernel_bound`,
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_scalar_kernel_bound`,
and
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_real_scalar_kernel_bound`,
`durrett2019_theorem_2_5_12_tailFirstKernel_eventually_eq_zero`,
`durrett2019_theorem_2_5_12_tailFirstKernel_hasFiniteSupport`,
`durrett2019_theorem_2_5_12_tailFirstKernel_summable`,
`durrett2019_theorem_2_5_12_normalizer_sq_inv_summable`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_le_sq_majorant`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_summable`,
`durrett2019_theorem_2_5_12_base_tail_scaled_summable_of_tailFirstKernel_tsum_bound`,
and
`durrett2019_theorem_2_5_12_base_truncated_sq_weighted_summable_of_truncatedSqKernel_tsum_bound`,
`durrett2019_theorem_2_5_12_tailFirstKernel_threshold_iff`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_threshold_iff`,
`durrett2019_theorem_2_5_12_tailFirstKernel_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_eq_nat_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_nat_indicator`,
and
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_of_nat_indicator`,
`durrett2019_theorem_2_5_12_normalizer_inv_eq_rpow_neg`,
`durrett2019_theorem_2_5_12_normalizer_sq_inv_eq_rpow_neg`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_rpow_indicator`,
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_eq_rpow_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_rpow_indicator`,
and
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_of_rpow_indicator`,
`durrett2019_theorem_2_5_12_tailFirst_rpow_indicator_tsum_eq_range_indicator_sum`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_rpow_range_indicator_sum`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_rpow_range_sum`,
`durrett2019_theorem_2_5_12_truncatedSq_rpow_indicator_le_full`,
and
`durrett2019_theorem_2_5_12_truncatedSq_rpow_indicator_summable`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_rpow_range_unscaled_bound`,
`durrett2019_theorem_2_5_12_truncatedSq_unscaled_rpow_indicator_summable`, and
`durrett2019_theorem_2_5_12_truncatedSqKernel_tsum_le_of_unscaled_rpow_indicator`,
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_eq_zero_of_rpow_le_one`, and
`durrett2019_theorem_2_5_12_tailFirstKernel_tsum_le_of_rpow_range_unscaled_bound_ge_one`.
The next source work is the remaining full-theorem coverage, not another
p-series, source-composition, or integrability-removal estimate.

Verified route history below is provenance, not live prompt text.  V425 added
the truncated-mean Kronecker layer reducing normalized mean convergence to
absolute scaled truncated-mean summability.  V424 added
the finite-prefix original-sum transfer from truncated normalized sums under
eventual equality.  V423 added
the variance/mean assembly reducers and left the finite-prefix transfer plus
analytic estimates as the next frontier.  V422
advances Durrett Theorem 2.5.12 Marcinkiewicz-Zygmund rate for `1 < p < 2`: the
V421 normalizer/truncation/Kronecker spine now also has the source
Borel-Cantelli eventual-equality transfer from `X_k` to
`Y_k = X_k 1_{|X_k| <= k^(1/p)}` under iid finite `p`-moment, plus variance
landing pads reducing scaled centered variances to base truncated second
moments.  Compiled anchors through V422:
`durrett2019_theorem_2_5_12_variance_scaledCenteredTruncated_le_truncated_sq`,
`durrett2019_theorem_2_5_12_integral_truncated_sq_eq_base_truncated_sq_of_identDistrib`,
`durrett2019_theorem_2_5_12_truncation_mismatch_subset_power_tail`,
`durrett2019_theorem_2_5_12_measure_mismatch_le_power_tail`,
`durrett2019_theorem_2_5_12_tsum_power_tail_ne_top_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_12_tsum_mismatch_ne_top_of_tsum_power_tail_ne_top`,
and
`durrett2019_theorem_2_5_12_ae_eventuallyEq_truncated_of_integrable_power_identDistrib`.
V421 opens
Durrett Theorem 2.5.12 Marcinkiewicz-Zygmund rate for `1 < p < 2`: the
normalizer `a_n = n^(1/p)`, moving truncation
`Y_k = X_k 1_{|X_k| <= k^(1/p)}`, centered and scaled centered truncations,
measurability, `L^2`, mean-zero, independence, and the Kronecker endpoint from
summable scaled variances all compile.  Compiled anchors through V421:
`durrett2019_theorem_2_5_12_normalizer`,
`durrett2019_theorem_2_5_12_normalizer_pos`,
`durrett2019_theorem_2_5_12_normalizer_ne_zero`,
`durrett2019_theorem_2_5_12_normalizer_increment_nonneg`,
`durrett2019_theorem_2_5_12_normalizer_atTop`,
`durrett2019_theorem_2_5_12_truncated`,
`durrett2019_theorem_2_5_12_centeredTruncated`,
`durrett2019_theorem_2_5_12_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_12_iIndepFun_centeredTruncated_of_iIndepFun`,
`durrett2019_theorem_2_5_12_iIndepFun_scaledCenteredTruncated_of_iIndepFun`,
and
`durrett2019_theorem_2_5_12_ae_centered_truncated_normalized_sum_tendsto_zero_of_scaled_variance_summable`.
V420 closes
the current source-shaped Durrett Theorem 2.5.11 route: exact logarithmic
normalizer, source finite-variance bridge, iid finite-second-moment wrapper,
Cauchy-condensation/p-series comparison, and the final positive-`epsilon`
theorems without an external logarithmic-series summability hypothesis all
compile.  Compiled anchors through V420:
`durrett2019_theorem_2_5_11_logNormalizer`,
`durrett2019_theorem_2_5_11_logNormalizer_pos`,
`durrett2019_theorem_2_5_11_logNormalizer_ne_zero`,
`durrett2019_theorem_2_5_11_logNormalizer_eq_of_two_le`,
`durrett2019_theorem_2_5_11_logNormalizer_le_of_two_le`,
`durrett2019_theorem_2_5_11_logNormalizer_increment_nonneg`,
`durrett2019_theorem_2_5_11_logNormalizer_atTop`,
`durrett2019_theorem_2_5_11_logNormalizer_inv_sq_eq`,
`durrett2019_theorem_2_5_11_logWeight`,
`durrett2019_theorem_2_5_11_logNormalizer_weight_summable`, and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_variance_bound`,
`durrett2019_theorem_2_5_11_memLp_of_identDistrib_zero`,
`durrett2019_theorem_2_5_11_variance_bound_of_identDistrib`, and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_iid_finite_variance`,
`durrett2019_theorem_2_5_11_logWeight_eq_inv_sq`,
`durrett2019_theorem_2_5_11_logWeight_pos`,
`durrett2019_theorem_2_5_11_logWeight_succ_le`,
`durrett2019_theorem_2_5_11_logWeight_summable_of_condensed`,
`durrett2019_theorem_2_5_11_logWeight_summable_of_condensed_pseries_bound`,
and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_iid_finite_variance_condensed`,
`durrett2019_theorem_2_5_11_logWeight_condensed_pseries_bound`,
`durrett2019_theorem_2_5_11_logWeight_summable`,
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_variance_bound_of_pos_epsilon`,
and
`durrett2019_theorem_2_5_11_ae_log_normalized_sum_tendsto_zero_of_iid_finite_variance_of_pos_epsilon`.
V419 packages the Cauchy-condensation and p-series reduction for Theorem 2.5.11's
logarithmic-series proof.  V418
packages the iid finite-second-moment source layer for Theorem 2.5.11.  V417
packages Durrett Theorem 2.5.11's exact logarithmic normalizer layer and the
source-shaped finite-variance bridge.  V416
packages Durrett Theorem 2.5.11's abstract random-series/Kronecker bridge and
variance-bound normalizer reduction.  Compiled anchors:
`durrett2019_theorem_2_5_11_normalized_sum_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_11_ae_normalized_sum_tendsto_zero_of_summable_scaled_variance`,
`durrett2019_theorem_2_5_11_variance_div_le_inv_sq_mul_of_variance_le`,
`durrett2019_theorem_2_5_11_scaled_variance_summable_of_variance_bound`,
and
`durrett2019_theorem_2_5_11_ae_normalized_sum_tendsto_zero_of_variance_bound`.
V415 packages the truncated-to-original transfer and full source-facing
one-based SLLN endpoint for Theorem 2.5.10.  New compiled anchors:
`durrett2019_theorem_2_5_10_truncation_mismatch_subset_tail`,
`durrett2019_theorem_2_5_10_measure_mismatch_le_tail`,
`durrett2019_theorem_2_5_10_tsum_tail_ne_top_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_10_tsum_mismatch_ne_top_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_10_ae_eventuallyEq_truncated_of_integrable_identDistrib`,
`durrett2019_theorem_2_5_10_average_tendsto_of_eventuallyEq`,
and
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_integrable_identDistrib`.
V414
packages the scaled-centered variance-summability layer and the source-facing
truncated-average endpoint.  Compiled anchors:
`durrett2019_theorem_2_5_10_variance_scaledCenteredTruncated_le_truncated_sq`,
`durrett2019_theorem_2_5_10_integral_truncated_sq_eq_base_truncated_sq_of_identDistrib`,
`durrett2019_theorem_2_5_10_integral_base_truncated_sq_eq_abs_truncation_sq`,
`durrett2019_theorem_2_5_10_scaled_variance_summable_of_integrable_identDistrib`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_integrable_identDistrib`.
V413
packages the moving-truncation mean-convergence step.  Compiled anchors:
`durrett2019_theorem_2_5_10_tendsto_integral_fixed_truncation`,
`durrett2019_theorem_2_5_10_integral_truncated_eq_base_truncated_of_identDistrib`,
`durrett2019_theorem_2_5_10_truncatedMean_tendsto_of_integrable_identDistrib`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_scaled_variance_summable`.
V412
packages the moving-truncation setup.  Compiled anchors:
`durrett2019_theorem_2_5_10_truncated`,
`durrett2019_theorem_2_5_10_truncatedMean`,
`durrett2019_theorem_2_5_10_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_10_measurable_truncated`,
`durrett2019_theorem_2_5_10_iIndepFun_truncated_of_iIndepFun`,
`durrett2019_theorem_2_5_10_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_10_measurable_scaledCenteredTruncated`,
`durrett2019_theorem_2_5_10_scaledCenteredTruncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_10_integral_scaledCenteredTruncated_eq_zero`,
`durrett2019_theorem_2_5_10_iIndepFun_scaledCenteredTruncated_of_iIndepFun`,
and
`durrett2019_theorem_2_5_10_ae_truncated_average_tendsto_of_scaled_variance_summable_and_mean_tendsto`.
V411
packages the Kronecker/Cesaro/random-series assembly spine.  Compiled anchors:
`durrett2019_theorem_2_5_10_centered_average_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_10_centered_average_difference_tendsto_zero_of_scaled_series`,
`durrett2019_theorem_2_5_10_mean_average_tendsto_of_tendsto`,
`durrett2019_theorem_2_5_10_average_tendsto_of_scaled_centered_series_and_mean_tendsto`,
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_scaled_centered_series_and_mean_tendsto`,
and
`durrett2019_theorem_2_5_10_ae_average_tendsto_of_scaled_centered_summable_variance_and_mean_tendsto`.
This gives the exact proof skeleton from scaled centered random-series
convergence to a.s. convergence of one-based averages.  Next work should define
and instantiate Durrett's moving truncation `Y_k = X_k 1_{|X_k| <= k}`, prove
the scaled centered hypotheses, prove `E Y_k -> mu`, and transfer from
`T_n/n` back to `S_n/n`.

V410 packages Durrett Theorem 2.5.9 deterministic Kronecker support.  Compiled
anchors:
`durrett2019_theorem_2_5_9_kronecker_summation_by_parts`,
`durrett2019_theorem_2_5_9_kronecker_ratio_eq`,
`durrett2019_theorem_2_5_9_weight_increment_sum_eq`,
`durrett2019_theorem_2_5_9_constant_weighted_tendsto`,
`durrett2019_theorem_2_5_9_weighted_average_eq_constant_add_centered`,
`durrett2019_theorem_2_5_9_weighted_average_tendsto_of_centered_tendsto_zero`,
`durrett2019_theorem_2_5_9_centered_toeplitz_remainder_tendsto_zero`,
`durrett2019_theorem_2_5_9_weighted_average_tendsto_of_nonnegative_increments`,
`durrett2019_theorem_2_5_9_kronecker_ratio_tendsto_zero_of_weighted_tendsto`,
`durrett2019_theorem_2_5_9_kronecker_ratio_tendsto_zero_of_nonnegative_increments`,
and `durrett2019_theorem_2_5_9_normalized_sum_tendsto_zero`.
This gives the Chapter 2 source-facing Kronecker theorem from convergence of
`sum x_n / a_n` to `(sum_{m <= n} x_m) / a_n -> 0`, using mathlib's
telescoping/asymptotics APIs and the local Exercise 4.4.11 deterministic proof
shape.  Next work should instantiate `a_n = n`, get convergence of the scaled
random series from V406-V409, and assemble Durrett Theorem 2.5.10.

V409 packages the source-facing one-based
sufficiency direction of Durrett Theorem 2.5.8.  New compiled anchors:
`durrett2019_theorem_2_5_8_integral_centered_truncated_eq_zero`,
`durrett2019_theorem_2_5_8_variance_centered_truncated_eq_variance`,
`durrett2019_theorem_2_5_8_tsum_tail_ne_top_of_oneBased`, and
`durrett2019_theorem_2_5_8_random_series_converges_ae_of_three_series_sufficiency_oneBased`.
The front-facing sufficiency theorem now takes Durrett's three displayed
one-based assumptions: `sum P(|X_i| > A) < infinity`, convergence of
`sum E Y_i`, and summability of `Var(Y_i)` for
`Y_i = X_i 1_{|X_i| <= A}`, then proves a.s. convergence of `sum X_i`.
The proof applies V406 to the centered truncations `Y_i - E Y_i`, using V408
independence and `L^2` support, and uses `variance_sub_const` to translate
Durrett's condition (iii) from `Var(Y_i)` to the centered variables.  The
necessity direction is deliberately deferred to Durrett Example 3.4.12, as in
the text.  V408 adds
Durrett Theorem 2.5.8 fixed-level truncation and large-jump mismatch support.
Compiled anchors: `durrett2019_theorem_2_5_8_truncated`,
`durrett2019_theorem_2_5_8_measurable_truncationMap`,
`durrett2019_theorem_2_5_8_measurable_truncated`,
`durrett2019_theorem_2_5_8_iIndepFun_truncated_of_iIndepFun`,
`durrett2019_theorem_2_5_8_iIndepFun_centered_truncated_of_iIndepFun`,
`durrett2019_theorem_2_5_8_truncated_eq_self_of_abs_le`,
`durrett2019_theorem_2_5_8_truncated_eq_zero_of_lt_abs`,
`durrett2019_theorem_2_5_8_abs_truncated_le_abs`,
`durrett2019_theorem_2_5_8_norm_truncated_le_abs_bound`,
`durrett2019_theorem_2_5_8_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_8_centered_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_5_8_truncation_mismatch_subset_tail`,
`durrett2019_theorem_2_5_8_measure_mismatch_le_tail`,
`durrett2019_theorem_2_5_8_tsum_mismatch_ne_top_of_tsum_tail_ne_top`,
`durrett2019_theorem_2_5_8_ae_eventuallyEq_truncated_of_tsum_tail_ne_top`,
and
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_truncated_centered_of_realSeriesConverges_of_tsum_tail_ne_top`.
This proves the source scaffold
`Y_i = X_i 1_{|X_i| <= A}`, `{X_i != Y_i} subset {|X_i| > A}`, summable
large-jump probabilities imply eventual equality by Borel-Cantelli, and the
abstract sufficiency assembly from centered truncated convergence plus
deterministic centering convergence to convergence of `sum X_i`.  V407 starts
Durrett Theorem 2.5.8 Kolmogorov three-series sufficiency.  Compiled anchors:
`durrett2019_theorem_2_5_8_realPartialSum`,
`durrett2019_theorem_2_5_8_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_add_of_randomSeriesConverges_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_of_centered_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_ae_centered_of_realSeriesConverges`,
`durrett2019_theorem_2_5_8_randomSeriesConverges_of_eventuallyEq`,
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_ae_eventuallyEq_of_ae_randomSeriesConverges`,
`durrett2019_theorem_2_5_8_ae_eventuallyEq_of_tsum_measure_ne_top`, and
`durrett2019_theorem_2_5_8_ae_randomSeriesConverges_of_tsum_mismatch_ne_top_of_ae_randomSeriesConverges`.
This packages the centered-plus-mean and eventual-equality/Borel-Cantelli
assembly needed for the sufficiency direction.  V406 adds
the exact textbook series-convergence display wrapper for Durrett Theorem
2.5.6.  New compiled anchors:
`durrett2019_theorem_2_5_6_randomSeriesConverges` and
`durrett2019_theorem_2_5_6_random_series_converges_ae_of_summable_variance`.
This matches Durrett's definition that `sum_{n=1}^infty X_n(omega)` converges
iff the one-based partial sums have a finite limit, and restates V405 in that
wording.  V405
packages the a.s. convergence endpoint for Durrett Theorem 2.5.6.  Compiled
anchors:
`durrett2019_theorem_2_5_6_tailBlockSum_add_eq_tailBlockSum_add_tailBlockSum`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_threshold_mono`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_base_mono`,
`durrett2019_theorem_2_5_6_eventually_not_tailPairOscillationEvent_of_not`,
`durrett2019_theorem_2_5_6_measure_iInter_tailPairOscillationEvent_eq_zero_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_ae_exists_not_tailPairOscillationEvent_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_ae_eventually_not_tailPairOscillationEvent_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_exists_tendsto_partialSum_of_grid_not_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_ae_forall_nat_exists_not_tailPairOscillationEvent_of_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_ae_exists_tendsto_partialSum_of_grid_tailPairOscillationEvent_measureReal_tendsto_zero`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_tendsto_zero_of_summable_variance_threshold`,
and
`durrett2019_theorem_2_5_6_random_series_partialSum_converges_ae_of_summable_variance`.
This closes the main source-facing Theorem 2.5.6 random-series convergence
statement for one-based partial sums under independent mean-zero increments
with finite second moments and summable variances.  The proof uses a countable
inverse-natural threshold grid plus `ae_all_iff`; do not replace it with an
uncountable a.e. intersection over all real epsilons.  V404
packages Durrett's pathwise Cauchy endpoint from eventual absence of shifted
tail-pair oscillation events.  Compiled anchors:
`durrett2019_theorem_2_5_6_partialSum`,
`durrett2019_theorem_2_5_6_tailBlockSum`,
`durrett2019_theorem_2_5_6_partialSum_add_eq_partialSum_add_tailBlockSum`,
`durrett2019_theorem_2_5_6_partialSum_sub_eq_tailBlockSum_sub`,
`durrett2019_theorem_2_5_6_tailBlockCauchy`,
`durrett2019_theorem_2_5_6_tailBlock_bound_of_not_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_tailBlockCauchy_of_eventually_not_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_cauchySeq_partialSum_of_tailBlockCauchy`,
`durrett2019_theorem_2_5_6_cauchySeq_partialSum_of_eventually_not_tailPairOscillationEvent`,
and
`durrett2019_theorem_2_5_6_exists_tendsto_partialSum_of_eventually_not_tailPairOscillationEvent`.
This deterministic endpoint reuses mathlib's `Metric.cauchySeq_iff` and
`CauchySeq.tendsto_limUnder`.  V403
packages Durrett's oscillation step in shifted block form.  Compiled
anchors:
`durrett2019_theorem_2_5_6_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_measurableSet_tailPairOscillationEvent`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_subset_tailMaxCrossingEvent_two_mul`,
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_le_tailMaxCrossingEvent`,
and
`durrett2019_theorem_2_5_6_tailPairOscillationEvent_measureReal_tendsto_zero_of_summable_variance`.
This is the formal `P(w_M > 2 eps) <= P(sup_{m >= M} |S_m - S_M| > eps)
-> 0` bridge, represented by shifted tail-block partial sums.  V402 derives
the textbook variance-tail probability limit from one-based summability
of `fun i => Var(X_{i+1})`.  New compiled anchors:
`durrett2019_theorem_2_5_6_sum_range_shift_tendsto_tsum_of_summable`,
`durrett2019_theorem_2_5_6_tsum_tail_tendsto_zero_of_summable`,
`durrett2019_theorem_2_5_6_variance_tail_partial_tendsto_tsum_of_summable`,
`durrett2019_theorem_2_5_6_variance_tsum_tail_tendsto_zero_of_summable`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_summable_variance`,
and
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_tendsto_zero_of_summable_variance`.
The line
`P(sup_{m >= M} |S_m - S_M| > eps) <= eps^{-2} *
sum_{i=M+1}^\infty Var(X_i) -> 0`
is now represented for the shifted tail-maximal event.  V401 lifts
the finite Theorem 2.5.6 block estimate to the increasing-union tail event:
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent`,
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent_mono`,
`durrett2019_theorem_2_5_6_finiteBlockMaxCrossingEvent_add_bound`,
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_tendsto_bounds`,
and
`durrett2019_theorem_2_5_6_tailMaxCrossingEvent_measureReal_le_of_variance_tail_limit`.
The finite-to-infinite probability passage now reuses mathlib's
`tendsto_measure_iUnion_atTop`; do not rebuild countable-union measure
machinery.  V400 adds
the final source-style statement of Kolmogorov's maximal inequality and the
first Theorem 2.5.6 block estimate:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_inequality` and
`durrett2019_theorem_2_5_6_finite_block_kolmogorov_maximal_bound`.  V399 adds
`L^2` source-side reduction for Theorem 2.5.5:
`durrett2019_theorem_2_5_5_partialSum_memLp_two_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_partialSum_sq_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_rangeSum_memLp_two_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_rangeSum_sq_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_firstCrossing_mixed_integrable_of_increment_memLp_two`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_memLp_two_mean_zero`,
and its one-based wrapper.  The front-facing textbook display now only needs
independence, coordinate measurability, finite-range `MemLp X_i 2`, and
finite-range mean zero; partial-square, terminal-square, future-integrability,
and mixed-term integrability obligations are generated internally.  V398 adds
source-facing increment mean-zero wrappers:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_mean_zero`
and
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_of_increment_mean_zero_oneBased`.
These derive terminal partial-sum mean zero from finite-range increment
integrability and mean-zero assumptions before applying the V397 variance
display.  V397
packages the textbook division and variance display from the compiled V396
maximal integral inequality:
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_div_bound`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_div_bound_oneBased`,
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound`, and
`durrett2019_theorem_2_5_5_kolmogorov_maximal_variance_bound_oneBased`.
The source-facing conclusion now has the textbook shape
`P(max_{1 <= k <= n} |S_k| >= x) <= (x^2)^{-1} * Var(S_n)` once the
terminal partial sum is mean-zero.  V396 adds
the terminal-square finite-union bound and core chained maximal integral
inequality:
`durrett2019_theorem_2_5_5_sum_firstCrossing_terminalSq_integrals_le_integral`
and `durrett2019_theorem_2_5_5_kolmogorov_maximal_integral_bound`, plus
one-based wrappers.  V395 adds
the square-expansion upper-comparison layer:
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_add_mixed_le_terminalSq`,
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_integral_le_terminalSq_integral_of_mixed_zero`,
`durrett2019_theorem_2_5_5_firstCrossing_stoppedSq_integral_le_terminalSq_integral`,
and
`durrett2019_theorem_2_5_5_sum_firstCrossing_stoppedSq_integrals_le_sum_terminalSq_integrals`,
plus one-based wrappers.  V394 adds
the maximal-crossing event decomposition and summed first-crossing lower bound:
`durrett2019_theorem_2_5_5_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_firstCrossing_biUnion_eq_maxCrossingEvent`,
`durrett2019_theorem_2_5_5_measureReal_maxCrossingEvent_eq_sum`, and
`durrett2019_theorem_2_5_5_sq_mul_measureReal_maxCrossingEvent_le_sum_firstCrossing_integrals`,
plus one-based wrappers.  V393 adds
the finite first-crossing disjoint-union layer:
`durrett2019_theorem_2_5_5_measurableSet_firstCrossingEvent`,
`durrett2019_theorem_2_5_5_firstCrossing_events_disjoint`,
`durrett2019_theorem_2_5_5_firstCrossing_events_pairwiseDisjoint`,
`durrett2019_theorem_2_5_5_measureReal_firstCrossing_biUnion_eq_sum`, and
the one-based wrappers.  V392 adds
the single first-crossing square/mass lower bound for Durrett Theorem 2.5.5,
showing that each first-crossing event contributes at least `x^2 * P(A_m)` to
the squared partial-sum integral.  V391 starts the
Durrett Theorem 2.5.5 Kolmogorov maximal-inequality proof route by packaging
the first-crossing mixed-term calculation from Theorems 2.1.10 and 2.1.13.
Do not return to Theorem 2.4.9 source-entry plumbing unless search proves a
concrete missing display.  V390 adds the direct
countable supplied-partition and one-based outer-a.s. product-law/canonical
route for Theorem 2.4.9, consuming the compiled Chapter 2.1.11 product-law
and canonical iid packages.  Next work should not rebuild Theorem 2.4.9
source-entry plumbing; either close one remaining source-facing display only
if search proves it is missing, or move to Chapter 2.1.12/2.1.13
product-expectation/Kolmogorov-maximal support.

V389 lifts the
global middle-partition-with-tails uniform-error squeeze in Theorem 2.4.9 to
product-law and canonical source forms, consuming the compiled Chapter 2.1.11
product-law/canonical iid packages and the V388 finite-cutpoint burn-in layer.
Next work should not rebuild the middle/tail uniform-error product-law
consumers; move to the countable supplied-partition route or direct outer-a.s.
empirical-CDF source entries that still lack product-law/canonical wrappers.
V388 lifts the
finite-cutpoint burn-in step in Theorem 2.4.9 to product-law and canonical
source forms.  The new wrappers consume the compiled Chapter 2.1.11
product-law/canonical iid packages and the pointwise empirical-CDF endpoints.
Next work should not rebuild finite-cutpoint product-law consumers; move to
the next global Theorem 2.4.9 middle/tail or outer-a.s. empirical-CDF source
display that still lacks a direct product-law/canonical entry.  V387 adds
canonical iid product-space pointwise displays for both the empirical CDF and the left
empirical CDF, in zero-based and one-based sample notation, by consuming the
compiled Chapter 2.1.11 canonical coordinate iid package on `P^N`.  Next work
should not rebuild these canonical pointwise displays; move to a new
theorem-sized Chapter 2.1/2.4.9 source consumer, preferably one that packages
finite-cutpoint or global empirical-CDF steps from the already compiled
pointwise and product-law endpoints.  V386 adds zero-based
product-law consumers for the pointwise Theorem 2.4.9 empirical CDF and left
empirical CDF proof steps.  They consume
`HasLaw (fun omega => fun i => X i omega) (P^N) mu` through the compiled
Chapter 2.1.11 product-law extraction.  Next work should not rebuild these
pointwise product-law consumers; move to another genuine Chapter 2.1/2.4.9
source wrapper or a missing theorem-sized consumer.  V385 consumes the
shifted infinite-product law bridge in the pointwise Theorem 2.4.9 proof
steps for the one-based empirical CDF and left empirical CDF displays.  Next
work should not rebuild these pointwise shifted joint-law displays; move to
another genuine Chapter 2.1/2.4.9 source wrapper or a missing theorem-sized
consumer.  V384 consumes the V382
shifted infinite-product law bridge in the one-based Durrett 2.4.9 endpoints:
the new `*_of_shift_hasLaw_infinitePi_oneBased` wrappers take a joint law
directly for `fun i => X (i + 1)` and feed the compiled GC/outer
empirical-CDF route.  Next work should not rebuild these shifted-joint-law
endpoints; move to another genuine Chapter 2.1/2.4.9 source display or a
missing theorem-sized consumer.  V383 adds the
Theorem 2.1.10/2.1.13 mixed-term bridge used by the Kolmogorov maximal
inequality proof:
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockFunction_integral_eq_zero`,
`durrett2019_theorem_2_1_13_partialSumDiff_integral_eq_zero_of_integral_Ico_eq_zero`,
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockFunction_integral_eq_zero_of_integral_Ico_eq_zero`,
and
`durrett2019_theorem_2_1_13_partialSumDiff_mul_earlyBlockIndicatorSum_integral_eq_zero`.
Next work should consume this bridge only in a real later source theorem, or
return to the active 2.4.9/Chapter 2.1 source-facing frontier; do not reprove
this mixed-term factorization.  V382 adds the
one-based Theorem 2.1.11 infinite product-law bridge:
`durrett2019_theorem_2_1_11_iid_shift_sequence_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iid_shift_iff_hasLaw_infinitePi`, and
`durrett2019_theorem_2_1_11_iid_shift_hasLaw_infinitePi_of_identDistrib`.
The shifted Durrett process `X (i + 1)` now has direct product-law extraction,
criterion, and standard `X_0` identical-distribution source packaging.  Next
work should consume these wrappers in real source-display endpoints or move to
Chapter 2.1.12/2.1.13 product-expectation support; do not rebuild this
one-based product-law bridge.  V381 routes the
pairwise-identically-distributed empirical-CDF outer-a.s. source entrances
through the V379 textbook middle/tail proof.  The zero-based and one-based
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_*_of_pairwise_identDistrib`
wrappers, including range-sum and inverse-multiply display forms, now consume
the compiled middle/tail route after extracting the common law and pairwise
independence.  Next work should move to a new Durrett source-display wrapper
or Chapter 2.1 product-law support; do not reroute these pairwise
empirical-CDF endpoints again.  V380 rewires the main
source-facing iid and canonical empirical-CDF outer-a.s. endpoints to consume
the V379 textbook middle/tail route directly.  The affected endpoints include
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun`,
its range-sum and inverse-multiply displays, the corresponding one-based
`iIndepFun` displays, and the zero-/one-based canonical iid empirical-CDF
outer-a.s. endpoints.  Next work should move to a new source-entrance wrapper
in Chapter 2.1/2.4.9 or a genuinely missing Durrett display form, not rewire
the same endpoints again.  V379 closes the
countable supplied-partition gap for the V377/V378 textbook middle/tail route:
`durrett2019_theorem_2_4_9_exists_middlePartitionWithTails`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_outerAlmostSureUniformDeviation_of_iIndepFun`.
It uses finite tail cutpoints, arbitrary-law cutpoint chains, and the
canonical `1 / (scale + 1)` countable width sequence to produce the exact
outer-a.s. empirical-CDF uniform-deviation predicate through V378.  Next work
should either make the existing empirical-CDF source endpoints reuse this
textbook middle/tail route where useful, or move to the next missing Chapter
2.1/2.4.9 source-entrance wrapper.  V378 packages the V377
global middle-partition-with-tails squeeze into the countable-scale
uniform-deviation interface:
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_of_iIndepFun`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_almostSureUniformDeviation_of_tendsto_partitions`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_outerAlmostSureUniformDeviation_of_tendsto_partitions`.
This is the correct a.e. route: fixed-tolerance V377 events are not
intersected over all real tolerances; V378 intersects a countable sequence of
supplied middle/tail partitions whose widths tend to zero.  V379 supplies
those partitions for arbitrary real laws and feeds them to V378.  V377 adds the global
middle-partition-with-tails squeeze:
`empiricalDistributionFunction_nonneg`,
`empiricalDistributionFunction_le_one`,
`empiricalLeftDistributionFunction_nonneg`,
`empiricalLeftDistributionFunction_le_one`,
`durrett2019_theorem_2_4_9_middlePartitionWithTails_eventually_uniform_error_lt_two_mul`,
and
`durrett2019_theorem_2_4_9_middlePartitionWithTails_oneBased_inv_mul_uniform_error_lt_two_mul_of_iIndepFun`.
This consumes V376 on `[a,b)`, uses `F_n(c) <= F_n(a-)` on the lower tail, and
uses `F_n(b) <= F_n(c)` plus `1 - F(b) = P((b, infinity))` on the upper tail.
V378 now consumes this fixed-tolerance result, so do not replay the tail
case split or endpoint convergence.  V376 adds the
middle-partition monotonicity squeeze that consumes V375's finite-cutpoint
burn-in:
`durrett2019_theorem_2_4_9_middlePartition_uniform_error_lt_of_cutpoint_errors`,
`durrett2019_theorem_2_4_9_middlePartition_eventually_uniform_error_lt_two_mul`,
and
`durrett2019_theorem_2_4_9_middlePartition_oneBased_inv_mul_uniform_error_lt_two_mul_of_iIndepFun`.
This compiles the displayed cell inequalities in Durrett's proof and gives the
eventual `2 * epsilon` uniform bound on every bounded middle partition.  The
next target should lift this bounded middle-partition squeeze through the
compiled tail/endpoint-grid wrappers, not revisit endpoint convergence or
bracket monotonicity.  V375 adds the
finite-cutpoint simultaneous closed and strict-left error bridge used in the
proof of Durrett Theorem 2.4.9:
`durrett2019_theorem_2_4_9_finite_cutpoints_eventually_closed_left_errors_lt`
and
`durrett2019_theorem_2_4_9_finite_cutpoints_oneBased_inv_mul_closed_left_errors_lt_of_iIndepFun`.
This is the compiled `N_k(omega)` step for finitely many cutpoints after
pointwise convergence of `F_n(x_j)` and `F_n(x_j-)`.  The next target should be
the uniform grid/telescoping squeeze that consumes this finite-cutpoint bridge,
not another pointwise SLLN wrapper.  V374 adds closed-endpoint
pointwise empirical-CDF proof-step wrappers:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_inv_mul_range_sum_tendsto_cdf_ae`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_oneBased_inv_mul_range_sum_tendsto_cdf_ae_canonical_iid`.
V373 adds exact-textbook
`n^{-1} * sum` strict-left empirical-CDF source entrances:
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_inv_mul_range_sum_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_inv_mul_range_sum_tendsto_leftLim_ae_canonical_iid`.
V372 adds the
strict-left empirical-CDF support used in Durrett's proof:
`realOpenHalfLineIndicator_integral_eq_cdf_leftLim`,
`empiricalLeftDistributionFunction`,
`realOpenHalfLine_empiricalAverage_sub_cdfLeftLim_tendsto_zero_ae_of_iid`,
and the Durrett wrappers
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_range_sum_tendsto_leftLim_ae`,
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_tendsto_leftLim_ae_of_iIndepFun`,
and
`durrett2019_theorem_2_4_9_empiricalLeftDistributionFunction_oneBased_range_sum_tendsto_leftLim_ae_of_iIndepFun`.
V371 adds one-based
Theorem 2.4.9 consumers for full infinite-product joint laws
(`*_of_hasLaw_infinitePi_oneBased`), identically distributed coordinates plus
`iIndepFun` (`*_of_iIndepFun_identDistrib_oneBased`), and pairwise-identically
distributed coordinates (`*_of_pairwise_identDistrib_oneBased`), including
`durrett2019_theorem_2_4_9_pairwise_identDistrib_oneBased_source`.  These
cover the six half-line GC / outer-a.s. GC / empirical-CDF / range-sum /
inverse-multiply range-sum endpoints for Durrett's one-based display.  V370
adds
`durrett2019_theorem_2_1_11_iid_shift_oneBased_of_iIndepFun`,
`durrett2019_theorem_2_1_11_iid_shift_hasLaw_infinitePi_of_iIndepFun`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun_oneBased`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun_oneBased`,
the arbitrary-source one-based iid and empirical-CDF wrappers matching
Durrett's `X_1, X_2, ...` and `n^{-1} sum_{m=1}^n` notation without forcing
canonical product-space specialization.  V369 adds
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_coordinates_oneBased`,
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_pairwise_indepFun_oneBased`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased_range_sum`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_oneBased_inv_mul_range_sum`,
the one-based canonical iid product-space and empirical-CDF wrappers matching
Durrett's `X_1, X_2, ...` notation.  V368 adds
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_pairwise_indepFun`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_canonical_iid`,
and
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_canonical_iid`,
the canonical iid product-space pairwise-independence and half-line
Glivenko-Cantelli wrappers.  The canonical empirical-CDF endpoints now consume
these wrappers directly.  V367 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredProduct_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct_explicitMean_sum`,
the vector-source and common-vector-law centered-product normalized-sum
projected characteristic-function wrappers.  V366 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCenteredProduct_explicitMean_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCenteredProduct_sum`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCenteredProduct_sum`,
the vector-source and common-vector-law centered-product normalized-sum CLT
wrappers.  V365 adds
`durrett2019_theorem_3_10_7_finiteCoordinate_explicitMean_normalization_eq_sum`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
the general finite-coordinate and common-vector-law literal normalized-sum CLT
wrappers.  V364 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_sum`,
the zero-mean coordinate-covariance literal normalized-sum source wrappers.
V363 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct_sum`,
the literal centered normalized-sum arbitrary-frequency characteristic-function
display for the canonical product sample.  V362 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
the canonical coordinate-covariance, centered-product, and literal
normalized-sum arbitrary-frequency characteristic-function displays.  V361 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_canonicalProductGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct`,
the canonical product-sample covariance-table and arbitrary-frequency
centered-product bridges.  V360 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_commonVectorLawGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct`,
the common-vector-law covariance-table and arbitrary-frequency centered-product
bridges.  V359 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_vectorGaussianSource_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct`,
the vector-Gaussian-source covariance-table and arbitrary-frequency
centered-product bridges.  V358 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedSummandCLT_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct`,
the projected-summand-CLT source bridges into the covariance-bilinear table and
centered-product Gaussian projected-characteristic routes.  V357 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT_centeredProduct`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct`,
the projected-scalar-CLT source bridges into the covariance-bilinear table and
centered-product Gaussian projected-characteristic routes.  V356 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCovarianceBilinDualTable_tsq`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct`,
the covariance-bilinear table and centered-product source consumers for the
projected-characteristic Durrett Theorem 3.10.7 vector CLT route.  V355 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_centeredProduct`,
the centered Gaussian covariance-table and arbitrary-frequency centered-product
ordinary characteristic-function source variants.  V354 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_covarianceBilinDualTable`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_centeredProductSubMean`,
the covariance-table and arbitrary-frequency centered-product variants of the
nonzero-mean Gaussian projected scalar ordinary characteristic-function route.
V353 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_of_coordinateCovariance`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_charFun_tsq_of_centeredProductSubMean`,
the nonzero-mean Gaussian projected scalar ordinary characteristic-function
displays with the linear mean phase and textbook `t^2` covariance exponent.
V352 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
the literal nonzero-mean normalized-sum characteristic-function displays for
Durrett's `(S_n - n * mu) / sqrt n` normalization.  V351 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct_sum`,
the literal centered normalized-sum characteristic-function display for the
canonical product sample.  V350 adds
`durrett2019_theorem_3_10_7_centeredProduct_eq_of_coordinateCovariance`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance`,
and
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianCenteredProduct`,
the canonical product-sample coordinate-covariance/centered-product bridge into
the textbook `t^2` characteristic-function route.  V349 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_canonicalProductGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianSource_centeredProduct_tsq`,
the canonical product-sample source bridge into the textbook `t^2`
characteristic-function route using existing local product-law support.  V348 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_commonVectorLawGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource_centeredProduct_tsq`,
the common-vector-law source bridge into the textbook `t^2`
characteristic-function route.  V347 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_vectorGaussianSource_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource_centeredProduct_tsq`,
the vector-Gaussian-source bridge into the textbook `t^2`
characteristic-function route.  V346 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedSummandCLT_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT_centeredGaussianCenteredProduct_tsq`,
the projected-summand-CLT source bridge into the textbook `t^2`
characteristic-function route.  V345 adds
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_of_projectedScalarCLT`,
`durrett2019_theorem_3_10_7_projectedCharacteristicFunctions_tsq_of_projectedScalarCLT_centeredProduct`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT_centeredGaussianCenteredProduct_tsq`,
the bridge from projected scalar CLTs to the textbook `t^2`
characteristic-function route.  V344 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_centeredProduct`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCenteredProduct_tsq`,
the centered-product source variant of the textbook `t^2` characteristic-function
endpoint for Durrett Theorem 3.10.7.  V343 adds
`durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul`,
`durrett2019_theorem_3_10_7_covarianceTableQuadratic_smul_complex`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_tsq_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance_tsq`,
the textbook `t^2` Gaussian exponent layer for Durrett Theorem 3.10.7.  V342 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_charFun_of_coordinateCovariance`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions_centeredGaussianCoordinateCovariance`,
Durrett Theorem 3.10.7 projected-characteristic CLT from the centered Gaussian
quadratic exponential and matching coordinate covariance table.  V341 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_projectedCharacteristicFunctions`,
Durrett Theorem 3.10.7 multivariate CLT from projected
characteristic-function convergence.  V340 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution_of_projected_charFun`,
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_of_charFun`,
and
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure_of_charFun`,
Durrett Theorem 3.10.6 Cramér-Wold characteristic-function transport in
random-vector/source form.  V339 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto_of_projected_charFun`
and
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto_of_charFun`,
Durrett Theorem 3.10.6 Cramér-Wold characteristic-function transport wrappers
from all projected characteristic functions to vector-law convergence.  V338
adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_lawTendsto`,
Durrett Theorem 3.10.6 Cramér-Wold in the law-level textbook `theta · x`
form.  V337 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution_constMeasure`,
Durrett Theorem 3.10.6 Cramér-Wold in the textbook `theta · X_n` form for a
fixed source probability space.  V336 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_theta_tendstoInDistribution`,
Durrett Theorem 3.10.6 Cramér-Wold in the textbook `theta · X_n`
random-vector convergence-in-distribution form.  V335 adds
`durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_tendstoInDistribution`,
Durrett Theorem 3.10.6 Cramér-Wold in random-vector
convergence-in-distribution form.  V334 adds
`durrett2019_exercise_3_10_8_multivariateGaussian_of_centeredLinearCombination_law_eq_gaussianReal`,
the standalone centered reverse direction from real Gaussian laws of all finite
linear combinations to multivariate Gaussianity.  V333 adds
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_covarianceBilinDualTable`,
Exercise 3.10.8 centered linear-combination Gaussian-law wrappers from the
covariance table of the Gaussian law.  V332 adds
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
`durrett2019_exercise_3_10_8_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`,
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_coordinateCovariance`,
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_centeredLinearCombination_law_eq_gaussianReal_of_centeredProduct`,
Exercise 3.10.8 centered linear-combination Gaussian-law source wrappers.
V331 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_sum`,
Durrett Theorem 3.10.7 literal centered normalized-sum canonical product
endpoint `S_n / sqrt n => chi`.  V330 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_expectation_display_of_centeredProduct`,
Durrett Theorem 3.10.7 centered literal expectation forms of the Gaussian
theta characteristic-function display.  V329 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_expectation_display_of_centeredProductSubMean`,
Durrett Theorem 3.10.7 literal expectation forms of the nonzero-mean Gaussian
theta characteristic-function display.  V328 adds
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_covarianceBilinDualTable`,
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_coordinateCovariance`,
and
`durrett2019_theorem_3_10_7_gaussianThetaCharacteristic_display_of_centeredProductSubMean`,
Durrett Theorem 3.10.7 nonzero-mean Gaussian theta characteristic-function
displays from covariance-table, scalar coordinate covariance, and
centered-product covariance hypotheses.  V327 adds
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
and
`durrett2019_exercise_3_10_8_multivariateGaussian_iff_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`,
Exercise 3.10.8 source-facing finite linear-combination characterization `iff`
wrappers from scalar coordinate covariance and centered-product covariance
hypotheses.  V326 adds
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_coordinateCovarianceTable`,
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_coordinateCovarianceTable`,
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_of_centeredProductSubMean`,
and
`durrett2019_section_3_10_gaussianCoordinate_iIndepFun_iff_centeredProductSubMean`,
Section 3.10 Gaussian-coordinate independence source wrappers from scalar
covariance tables and centered-product covariance tables.  V325 adds
`durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_coordinateCovariance`
and
`durrett2019_exercise_3_10_8_linearCombination_law_eq_gaussianReal_of_centeredProductSubMean`,
Exercise 3.10.8 forward real-Gaussian law wrappers from scalar coordinate
covariance and centered product source hypotheses.  V324 adds
`durrett2019_theorem_3_10_7_coordinateCovariance_eq_of_centeredProductSubMean`
and
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCenteredProduct_explicitMean_sum`,
the nonzero-mean covariance-definition source bridge and literal normalized-sum
CLT endpoint for Durrett Theorem 3.10.7.  V323 adds
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_coordinateCovariance`
and
`durrett2019_theorem_3_10_7_centeredGaussianThetaCharacteristic_display_of_centeredProduct`,
the Gaussian characteristic-function display from scalar coordinate covariance
and centered product source hypotheses.  V322 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean_sum`,
the literal normalized-sum canonical i.i.d. product endpoint for Durrett
Theorem 3.10.7.  V321 adds
`durrett2019_theorem_3_10_7_multivariateCLT_of_canonicalProductGaussianCoordinateMeanCoordinateCovariance_explicitMean`,
the explicit mean-vector canonical i.i.d. product endpoint for Durrett
Theorem 3.10.7.  V320 adds
`durrett2019_theorem_3_4_10_lindebergFeller_sigmaVariance_of_integrableSq`
and
`durrett2019_theorem_3_4_10_lindebergFeller_sigmaChi_of_integrableSq`, the
positive-variance and literal `S_n => sigma * chi` source endpoints for
Theorem 3.4.10.  V319 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_muSigmaSqrt`, the literal
Durrett `mu, sigma` display for Theorem 3.4.1.  V318 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_sigmaSqrt`, the exact Durrett
`sigma * sqrt n` denominator display.  V317 adds
`durrett2019_theorem_3_4_1_centralLimitTheorem_standardNormal`, the
textbook-normalized positive-variance i.i.d. CLT endpoint.  V316 adds
`durrett2019_theorem_3_4_10_lindebergFeller_unitVariance_of_integrableSq`, the
standard `N(0,1)` source endpoint for Theorem 3.4.10 from row-wise
independence, mean-zero square-integrable rows, variance-sum convergence to
`1`, and Lindeberg's condition.

Chapter 2.1 and Theorem 2.4.9 product/iid/empirical-CDF wrappers are now
support context, not the live route.  Do not revisit them unless a Chapter 3
theorem exposes a precise missing primitive.

Historical Section 4.7 frontier:
Durrett Section 4.7 backwards martingales in
`StatInference/ProbabilityTheory/BackwardMartingale.lean`, with the
reverse-time convergence theorem imported from the compiled VdV&W `N^op`
submartingale primitive in `StatInference.EmpiricalProcess.Theorem243`.
V260-V262 close the Theorem 4.6.1/4.6.2 support layer: conditional-expectation
uniform integrability, dominated-family support, tail criteria, deterministic
tail envelopes, the scalar small-set modulus, and the clean uniform-`L^p`,
`p > 1`, endpoint
`durrett2019_theorem_4_6_2_uniformIntegrable_one_of_eLpNorm_bdd`.  V263 wraps
Mathlib's Vitali theorem and `TendstoInMeasure`/`L¹` APIs in Durrett form.  V264
adds the expectation-convergence `(iii)` layer through
`durrett2019_theorem_4_6_3_tendsto_integral_abs_of_eLpNorm_one_tendsto_zero`
and
`durrett2019_theorem_4_6_3_tendsto_integral_abs_of_tendstoInMeasure_uniformIntegrable`.
V265 starts Theorem 4.6.4 with the source forward implication from
`UniformIntegrable` submartingales to a.s. plus `L¹` convergence, and the
reverse `L¹`-to-`UnifIntegrable` bridge.  V266 upgrades the reverse implication
to full probability `UniformIntegrable` using the finite-prefix boundedness
package from `L¹` convergence.  V267 adds Lemma 4.6.5 as a thin Mathlib
`tendsto_setIntegral_of_L1'` wrapper.  V268 adds Lemma 4.6.6 and Theorem 4.6.7
route wrappers for the martingale conditional-expectation representation.  V269
adds the compact Theorem 4.6.7 display forms for equivalence with an integrable
`L¹` limit and equivalence with representation as conditional expectations of
one integrable random variable.  V270 packages Mathlib's Lévy upward theorem
as Durrett Theorem 4.6.8 in a.s. and `L¹` forms and adds the immediate Theorem
4.6.9 conditional-indicator convergence consequence.  V271 starts Theorem
4.6.10 with the final bridge from the source estimate
`E(|Y_n - Y| | ℱ_n) -> 0` a.s. to the desired varying conditional-expectation
convergence.  V272 adds the tail-envelope source-estimate bridge that reduces
that estimate to eventual fixed-tail conditional bounds plus vanishing limiting
tail conditional expectations.  V273 discharges fixed-tail upward convergence
from Theorem 4.6.8 and adds the final tail-bound bridge consumed by the
concrete `W_N` envelope.  V274 lifts the textbook's eventual pointwise
envelope estimate into the conditional-bound interface and adds a final
wrapper that derives envelope integrability from domination by one integrable
random variable, such as `2Z`.  V275 discharges the limiting conditional
tail-zero side from limiting-sigma-field measurability and a.s. convergence
`W_N -> 0`.  V276 proves the limit-passage from pairwise tail envelopes and
`Y_n -> Y` a.s. to the eventual pointwise limit-error envelope.  V277
introduces the concrete `sSup` tail envelope and final consumers that use it,
including a.e. boundedness and supplied pairwise-bound variants.  V278
discharges the textbook `2Z` domination layer for this concrete envelope. V279
discharges a.s. convergence `W_N -> 0` from `Y_n -> Y` a.s.  V280 discharges
limiting-sigma-field measurability of the concrete `sSup` envelope and adds
the adapted final Theorem 4.6.10 endpoint.  V281 adds Exercise 4.6.7 `L¹`
conditional-expectation convergence.  V282 starts Section 4.7 by adding
`BackwardMartingale.lean`, the decreasing-sigma-field to `ℕᵒᵈ` filtration
bridge, the terminal conditional-expectation representation for backwards
martingales, uniform integrability from the terminal representation, Durrett
Theorem 4.7.1 a.s. convergence via the reused VdV&W order-dual primitive, and
the `L¹` convergence consumer for an identified reverse-time limit.  V283 adds
the reverse-time read uniform-integrability theorem, integrability of any
identified a.s. limit, and the main Theorem 4.7.2
conditional-expectation/set-integral identification assuming tail
measurability.  V284 proves the missing tail measurability using the canonical
`limsup_n X_{-n}` modification and closes the fully source-shaped Theorem 4.7.2
endpoint.  V285 packages backwards Lévy Theorem 4.7.3 in both dual-filtration
and textbook decreasing-filtration display forms, with a.s. and `L¹`
convergence to the conditional expectation on the reverse tail sigma-field.
V286 starts Example 4.7.4 with the tail-constant consumer for V285, the
conditional-expectation process handoff, and a direct strong-law endpoint
reusing `StatInference.ProbabilityMeasure.strongLaw_ae_real`.  V287 discharges
the V286 constant-tail hypothesis from independence of the source sigma-field
and the reverse tail.  V288 discharges the same side from a zero-one law for
the reverse tail sigma-field.  V289 discharges the V288 zero-one side from the
compiled Durrett 4.3.8 Kolmogorov zero-one support for independent tail-block
sigma-fields through
`durrett2019_example_4_7_4_tail_zero_or_one_of_iIndep_tailBlocks`,
`durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_iIndep_tailBlocks`,
and
`durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_iIndep_tailBlocks`.
V290 proves the conditional-expectation algebra core
`durrett2019_example_4_7_4_condExp_first_eq_invNat_prefixAverage` and
`durrett2019_example_4_7_4_condExp_first_eq_prefixAverage_div`: prefix-sum
measurability plus the finite-prefix symmetry input
`E(ξ_i | 𝒢_n) = E(ξ_0 | 𝒢_n)` for all `i < n` imply
`E(ξ_0 | 𝒢_n) = S_n / n`.  V291 defines the concrete zero-based
reverse-average sigma-field
`durrett2019_example_4_7_4_reverseAverageSigma ξ n =
σ(S_n, ξ_n, ξ_{n+1}, ...)` and proves the prefix-sum
measurability/strong-measurability input, tail-coordinate measurability, and
ambient sub-sigma-field fact.  V292 proves the later-prefix measurability
bridge, the antitone/decreasing-family theorem, and the concrete
reverse-average conditional-expectation consumer:
`durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma_of_le`,
`durrett2019_example_4_7_4_reverseAverageSigma_antitone`, and
`durrett2019_example_4_7_4_condExp_first_eq_reverseAverageSigma_prefixAverage_div`.
V293 adds the compiled source handoff
`durrett2019_condExp_eq_of_invariant_measurableEquiv`,
`durrett2019_example_4_7_4_condExp_eq_zero_of_reverseAverage_invariant_equiv`,
and
`durrett2019_example_4_7_4_reverseAverageSigma_prefix_condExp_symmetry`.
V294 adds
`durrett2019_example_4_7_4_reverseAverageGeneratorSet`,
`durrett2019_example_4_7_4_reverseAverageSigma_eq_generateFrom`,
`durrett2019_example_4_7_4_preimage_reverseAverageSigma_eq_of_prefixSum_tail_invariant`,
and
`durrett2019_example_4_7_4_reverseAverageSigma_prefix_condExp_symmetry_of_prefixSum_tail_invariant`.
V295 adds the iid product-space coordinate-swap layer
`durrett2019_example_4_7_4_eval_prefixSum_comp_natPermOfFin`,
`durrett2019_example_4_7_4_eval_tail_comp_natPermOfFin`,
`durrett2019_example_4_7_4_eval_coordinate_eq_zero_comp_prefixSwap`,
`durrett2019_example_4_7_4_eval_condExp_eq_zero_of_prefixSwap`,
`durrett2019_example_4_7_4_eval_prefix_condExp_symmetry_of_prefixSwaps`, and
`durrett2019_example_4_7_4_eval_condExp_first_eq_prefixAverage_div_product`.
V296 adds
`durrett2019_example_4_7_4_eval_integrable_of_integrable_id`,
`durrett2019_example_4_7_4_eval_condExp_first_eq_prefixAverage_div_product_of_integrable_id`,
and `durrett2019_example_4_7_4_eval_strongLaw_ae_real_of_integrable_id`.
V297 adds
`durrett2019_example_4_7_4_ae_tendsto_of_eventually_ae_eq_condExp_nat_and_tail_const`,
`durrett2019_example_4_7_4_ae_tendsto_of_eventually_ae_eq_condExp_nat_and_tail_zero_or_one`,
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_tail_zero_or_one`.
V298 adds
`durrett2019_example_4_7_4_eval_prefixSum_comp_tailFixingPerm`,
`durrett2019_example_4_7_4_eval_tail_comp_tailFixingPerm`,
`durrett2019_example_4_7_4_eval_reverseAverageSigma_le_permutationSymmetric`,
and
`durrett2019_example_4_7_4_eval_reverseAverageTail_le_permutationSymmetricTail`.
V299 adds
`durrett2019_example_4_7_4_eval_reverseAverage_tail_zero_or_one_of_permutationSymmetric_tail`
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_permutationSymmetric_tail_zero_or_one`.
V300 adds reusable VdVW/Hewitt-Savage support:
`preimage_vdVWPermuteNatSequence_eq_of_measurableSet_permutationSymmetricTail`,
`preimage_vdVWPermuteNatSequence_natPermOfFin_eq_of_measurableSet_permutationSymmetricTail`,
`setIntegral_vdVWInfiniteProductMeasure_comp_permuteNatSequence_of_measurableSet_permutationSymmetricTail`,
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_preimage_natPermOfFin_eq`,
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_setIntegral_natPermOfFin_eq`.
V301 adds the self-independence-to-zero-one consumer layer:
`vdVWPermutationSymmetricTail_measure_zero_or_one_of_indep_self`,
`vdVWPermutationSymmetricTail_measure_zero_or_one_all_of_indep_self`,
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_zero_or_one_of_indep_self`,
`durrett2019_example_4_7_4_eval_reverseAverage_tail_zero_or_one_of_permutationSymmetric_tail_indep_self`,
and
`durrett2019_example_4_7_4_eval_prefixAverage_ae_tendsto_of_integrable_id_and_permutationSymmetric_tail_indep_self`.
V302 adds the finite-prefix/future-coordinate-tail independence support:
`durrett2019_theorem_4_3_8_prefixFiltration_le_iSup_coordinateSigma_lt`,
`durrett2019_theorem_4_3_8_prefixCoordinateSigma_indep_tailCoordinateSigma_infinitePi`,
`durrett2019_theorem_4_3_8_prefixFiltration_indep_tailCoordinateSigma_infinitePi`,
and
`durrett2019_example_4_7_4_eval_prefixFiltration_indep_tailCoordinateSigma`.
V303 adds the transported-prefix Hewitt-Savage support:
`vdVWPermutationSymmetricMeasurableSpace_le`,
`vdVWPermutationSymmetricTail_le`,
`durrett2019_example_4_7_4_permuteNatSequence_prefixFiltration_tailCoordinateSigma_measurable`,
`durrett2019_example_4_7_4_preimage_permuteNatSequence_prefixFiltration_tailCoordinateSigma`,
`durrett2019_example_4_7_4_eval_prefixFiltration_indep_permuted_prefix`,
`durrett2019_example_4_7_4_eval_prefix_inter_permuted_prefix_measure_eq_mul`,
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_inter_prefix_eq_inter_permuted_prefix`.
V304 adds the prefix-limit self-independence bridge:
`durrett2019_example_4_7_4_eval_tail_prefix_product_of_permuted_prefix_limit`
and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product_limit`.
V305 adds the prefix symmetric-difference approximation-to-limit bridge:
`durrett2019_example_4_7_4_tendsto_measure_of_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_tendsto_measure_inter_of_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_eval_prefixLimit_of_symmDiff_prefix_approx`, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product_symmDiff_approx`.
V306 adds the finite-prefix approximation basis:
`durrett2019_example_4_7_4_finitePrefixEventSet`,
`durrett2019_example_4_7_4_finitePrefixEventSet_isSetRing`,
`durrett2019_example_4_7_4_finitePrefixEventSet_generateFrom`,
`durrett2019_example_4_7_4_exists_measure_symmDiff_lt_finitePrefixEventSet`,
`durrett2019_example_4_7_4_exists_prefix_symmDiff_tendsto_zero`,
`durrett2019_example_4_7_4_eval_prefixApprox`, and
`durrett2019_example_4_7_4_eval_permutationSymmetricTail_indep_self_of_prefix_product`.
The next proof packet should prove the remaining finite-prefix product formula:
for a permutation-symmetric tail event `A` and each finite-prefix event `D`,
`vdVWInfiniteProductMeasure P (A ∩ D) =
  vdVWInfiniteProductMeasure P A * vdVWInfiniteProductMeasure P D`, using the
V303 transported-prefix equality, a block-moving finite permutation/cutoff, and
V304/V305/V306 to close the self-independence route into V301.
V259 closes the
concrete Example 4.5.8
random-walk terminal-condition packet:
the unit-variance, Rademacher, and canonical Rademacher endpoints now use
finite `∫⁻ ω, ENNReal.ofReal (Real.sqrt ((N ω).untopA : ℝ)) ∂P` rather than
full stopped-time integrability.  V258 closes the main terminal-condition gap between
Theorem 4.5.7 and Example 4.5.8 using `AEMeasurable Ainf P` plus finite
square-root terminal clock.  V257 adds the canonical
infinite iid Rademacher product-space endpoint, with reusable product-coordinate
facts in `StatInference/ProbabilityMeasure/Rademacher.lean` and
`durrett2019_example_4_5_8_canonicalRademacherRandomWalk_terminal_integral_eq_zero`
in `StatInference/ProbabilityTheory/Martingale.lean`.  V256 adds the simple
symmetric random-walk endpoint: Rademacher law mean/second-moment/`L^2` transfer
in `StatInference/ProbabilityMeasure/Rademacher.lean`, the unit variance-clock
display `A_n = n`, the stopped unit-clock display as `(N ω).untopA`, and
`durrett2019_example_4_5_8_stoppedLinearRandomWalk_terminal_integral_eq_zero_of_iIndepFun_rademacher`.
V255 adds the linear-random-walk source bridge
`durrett2019_example_4_5_8_stoppedLinearRandomWalk_terminal_integral_eq_zero_of_iIndepFun_zeroMean_secondMoments`:
the stopped Exercise 4.4.6 square-minus-variance-clock martingale now feeds the
V254 optional-stopping/dominated bridge and concludes `E[S_N] = 0` from
independent mean-zero increments, deterministic second moments, a.s. finite
`N`, and integrability of the stopped variance clock.  V254 adds the stopped-process
specialization
`durrett2019_example_4_5_8_stoppedProcess_integral_limit_eq_zero_of_theorem_4_5_7_source`:
bounded optional stopping for `N ∧ n` now supplies the finite-horizon zero
expectations for `S_{N ∧ n}`, and the V253 dominated/4.5.7 bridge passes the
zero expectation to the terminal limit.  V252 closes the
source-facing infinite-horizon Theorem 4.5.7 endpoint:
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`.
It derives the real-supremum a.e. boundedness from finite `iSup` expectation
via `ae_lt_top` and proves finite `E sqrt(A_infty)` from the integrable
nonnegative terminal clock.  The next cycle should not revisit this endpoint
unless a later source statement requires a different display form.  V251 pushes Theorem 4.5.7
from the V250 finite-horizon estimate to the infinite-horizon monotone
endpoint:
`durrett2019_theorem_4_5_7_lintegral_iSup_runningAbsMax_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`
and the canonical real `runningAbsSup` wrapper
`durrett2019_theorem_4_5_7_runningAbsSup_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal_ae_bddAbove`.
V201 compiles the source
square-minus stopped certificate, finite-terminal threshold cover, countable
event-cover assembly, and monotone-terminal source wrapper for Theorem 4.5.2.
V202 derives the stopped running-maximum boundedness side condition from the
stopped terminal square estimates and adds no-`hBdd` source wrappers through
the monotone-terminal endpoint.  V203 derives stopped predictability of
`A^N` from `IsStronglyPredictable ℱ A` and adds no-manual-predictability
wrappers through the monotone-terminal auto endpoint.  V204 packages the exact
event-facing finite-variance side of Theorem 4.5.2 on an arbitrary event
`FiniteVar`, including the threshold cover, terminal-bound source convergence,
and monotone-terminal source convergence endpoint.  V205 starts Theorem 4.5.3
with
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_transform_tendsto`,
which applies the Exercise 4.4.11 Kronecker theorem to sample-dependent
normalizers.  V205 also proves the reciprocal-transform predictability and
bounds from `IsStronglyPredictable ℱ A`, continuous `f`, and `1 <= f(A_n)`.
V206 proves the scaled-square-summability-to-random-normalizer handoff and the
reciprocal `b_n = f(A_n)` specialization:
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_scaled_summable`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_scaled_summable`.
V207 adds the variance-ratio bridge
`durrett2019_theorem_4_5_3_scaled_summable_of_integral_le_variance_ratio`
and the endpoint
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_variance_ratio_summable`.
V208 adds the first real conditional-variance source primitive:
`durrett2019_theorem_4_5_3_integral_mul_sq_le_of_condExp_square_le`, which
turns an `ℱ_k`-measurable weight `H` and a conditional square bound
`E[Y^2 | ℱ_k] ≤ V` into the weighted integral bound
`∫ H^2 * Y^2 ≤ ∫ H^2 * V`.
V209 instantiates that pull-out core with `H = (f(A_{k+1}))^{-1}`,
`Y = X_{k+1}-X_k`, and `V = A_{k+1}-A_k`, adding
`durrett2019_theorem_4_5_3_reciprocal_comp_integral_le_variance_increment_of_condExp_square_le`
and the source-facing endpoint
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_variance_ratio_summable`.
V210 adds the scalar deterministic interval comparison
`durrett2019_theorem_4_5_3_interval_variance_ratio_le_integral_inv_sq`:
for increasing `f >= 1` on `[a,b]`,
`(b-a) / f(b)^2 ≤ ∫_a^b f(t)^{-2} dt`.
V211 adds the finite pathwise lift
`durrett2019_theorem_4_5_3_finite_sum_variance_ratio_le_integral_clock`,
which telescopes adjacent interval estimates into
`∑_{k<N} (A_{k+1}-A_k) / f(A_{k+1})^2 ≤ ∫_{A_0}^{A_N} f(t)^{-2} dt`.
V212 packages the deterministic infinite-series consequence:
`durrett2019_theorem_4_5_3_variance_ratio_summable_of_integral_clock_bound`
and
`durrett2019_theorem_4_5_3_tsum_variance_ratio_le_of_integral_clock_bound`
turn a uniform finite-clock-integral bound into summability and a total
variance-ratio bound.
V213 lifts V212 through almost-sure random clock certificates:
`durrett2019_theorem_4_5_3_ae_variance_ratio_summable_of_integral_clock_bound`
and
`durrett2019_theorem_4_5_3_ae_tsum_variance_ratio_le_of_integral_clock_bound`
produce a.e. summability and total variance-ratio bounds from a.e. clock
certificates.
V214 adds the finite integrated/Fubini summability bridge:
`durrett2019_theorem_4_5_3_finite_integral_variance_ratio_le_integral_clock`,
`durrett2019_theorem_4_5_3_integral_variance_ratio_summable_of_integral_clock_bound`,
and
`durrett2019_theorem_4_5_3_tsum_integral_variance_ratio_le_of_integral_clock_bound`.
V215 adds
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound`,
the source-facing endpoint that feeds V214 into V209 and derives the endpoint
lower bound `1 <= f(A_n)` from interval lower bounds.  V216 adds
`durrett2019_theorem_4_5_3_clock_interval_le_tail_integral_bound`,
`durrett2019_theorem_4_5_3_integrated_clock_bound_of_tail_integral_bound`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound`,
removing the manual uniform integrated clock-bound input by using the global
tail-integral bound over `[0, ∞)`.  V217 adds
`durrett2019_memLp_mul_of_abs_le_one`,
`durrett2019_theorem_4_5_3_reciprocal_comp_transform_memLp_two_of_process_memLp`,
`durrett2019_theorem_4_5_3_increment_sq_integrable_of_process_memLp`,
`durrett2019_theorem_4_5_3_reciprocal_comp_scaled_sq_integrable_of_process_memLp`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound_of_process_memLp`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp`,
replacing transform `MemLp`, scaled-square integrability, and increment-square
integrability hypotheses by the single source assumption `∀ n, X_n ∈ L^2`.
V218 adds
`durrett2019_integrable_mul_of_abs_le_one`,
`durrett2019_theorem_4_5_3_variance_ratio_integrable_of_clock_integrable`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_integral_clock_bound_of_process_memLp_clock_integrable`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable`,
replacing the explicit variance-ratio integrability hypothesis by the source
assumption `∀ n, Integrable (A n) P`.  The conditional-square inequality alone
does not imply this integrability, because it only lower-bounds the clock
increment.
V219 adds
`durrett2019_theorem_4_5_3_finite_clock_integral_integrable_of_tail_integral_bound`
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock`,
replacing the explicit finite random clock-integrability hypothesis by
measurability through the continuous primitive of `fun t => (f t)⁻¹ ^ 2` and
boundedness from the global tail integral.  The reciprocal-square continuity
hypothesis is intentional: `Continuous f` alone does not rule out zeros of `f`.
V220 adds
`durrett2019_theorem_4_5_3_interval_integrable_of_reciprocal_sq_continuous`,
`durrett2019_theorem_4_5_3_reciprocal_sq_continuous_of_continuous_ne_zero`,
`durrett2019_theorem_4_5_3_reciprocal_comp_normalizer_increment_nonneg`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_interval_mono`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_interval_mono_ne_zero`,
removing the explicit `hf_int`, `hb_increment_nonneg`, and reciprocal-square
continuity assumptions from the source-shaped endpoint.
V221 adds
`durrett2019_theorem_4_5_3_interval_one_le_of_global_one_le`,
`durrett2019_theorem_4_5_3_ne_zero_of_global_one_le`,
`durrett2019_theorem_4_5_3_interval_mono_of_monotone`,
`durrett2019_theorem_4_5_3_reciprocal_comp_atTop_of_clock_atTop`, and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono_atTop`,
replacing per-interval lower bounds, explicit no-zero facts, per-interval
monotonicity, and the shifted random normalizer divergence with global
source-style assumptions on `f` plus a.s. clock divergence.
V222 adds
`durrett2019_theorem_4_5_3_normalizer_atTop_of_integrable_inv_sq` and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono`,
deriving deterministic normalizer divergence from Durrett's exact assumptions
`f >= 1`, monotonicity, and finite `∫_0^∞ f(t)^{-2} dt`.
V223 adds the event-local infinite-clock endpoint:
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_transform_tendsto`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_scaled_summable`,
`durrett2019_theorem_4_5_3_reciprocal_comp_atTop_on_of_clock_atTop_on`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_integral_clock_bound`,
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono_atTop`,
and
`durrett2019_theorem_4_5_3_normalized_process_ae_tendsto_zero_on_of_reciprocal_comp_condExp_tail_integral_bound_of_process_memLp_clock_integrable_auto_clock_global_mono`.
V224 starts Theorem 4.5.5, Second Borel-Cantelli III, with the compiled ratio
and finite-variance endpoint layer:
`durrett2019_theorem_4_5_5_ratio_tendsto_one_of_centered_ratio_tendsto_zero`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_centered_ratio_tendsto_zero`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_process_eq_count_sub_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_normalized`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_of_exists_tendsto`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_on_of_exists_tendsto`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_exists_tendsto`.
V225 identifies the exact one-step martingale increment, the denominator-clock
increment, and the bridge from the Bernoulli conditional-variance estimate to
the source clock inequality consumed by Theorem 4.5.3:
`durrett2019_theorem_4_5_5_martingalePart_process_increment_eq`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_increment_eq`, and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_conditionalProbabilitySum_increment`.
V226 proves the Bernoulli conditional-variance estimate, automatically
discharges its boundedness/integrability side conditions, and packages the
automatic dominated variance-clock endpoint:
`durrett2019_theorem_4_5_5_condExp_centered_indicator_sq_le_of_source`,
`durrett2019_theorem_4_5_5_condExp_centered_borelCantelli_indicator_sq_le`,
`durrett2019_theorem_4_5_5_condExp_centered_borelCantelli_indicator_sq_le_auto`,
and
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_conditionalProbabilitySum_increment_auto`.
V227 adds the `max(A_n,1)` normalizer handoff and the finite/infinite event
cover ratio assembly:
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_of_max_one_normalizer`,
`durrett2019_theorem_4_5_5_normalized_tendsto_zero_on_of_max_one_normalizer`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_martingalePart_max_one_normalized`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_max_one_normalized`.
V228 specializes the infinite-clock side to `f(t)=max t 1`, feeds the V226
Borel-Cantelli variance-clock domination into Theorem 4.5.3, and packages the
finite/infinite ratio assembly that consumes this source result:
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_conditionalProbabilitySum_clock`
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_conditionalProbabilitySum_clock`.
V229 discharges the cheap adapted-event source inputs for this infinite-clock
endpoint:
`durrett2019_theorem_4_5_5_measurableSet_of_adapted`,
`durrett2019_theorem_4_5_5_martingalePart_process_zero`,
`durrett2019_theorem_4_5_5_martingalePart_process_memLp_two`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_predictable`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_integrable`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_zero_nonneg`, and
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock`.
V230 adds the exact textbook tail-integral certificate and auto-tail endpoint
wrappers:
`durrett2019_theorem_4_5_5_max_one_inv_sq_integrableOn_Ici`,
`durrett2019_theorem_4_5_5_integral_max_one_inv_sq_Ici`,
`durrett2019_theorem_4_5_5_integral_max_one_inv_sq_Ici_le_two`,
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock_auto_tail`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_adapted_conditionalProbabilitySum_clock_auto_tail`.
V231 proves the source clock monotonicity in the form Mathlib can honestly
provide:
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_mono_step_ae`,
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_mono_step_ae_on`, and
`durrett2019_theorem_4_5_5_max_one_conditionalProbabilitySum_increment_nonneg_ae`.
V232 introduces and consumes the clipped canonical conditional-probability
clock:
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_increment_eq`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_predictable`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_integrable`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_zero_nonneg`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_mono_step`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_ae_eq_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_ae_eq_conditionalProbabilitySum_all`,
`durrett2019_theorem_4_5_5_nonnegativeConditionalProbabilitySum_atTop_on_of_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_condExp_square_le_nonnegativeConditionalProbabilitySum_increment_auto`,
`durrett2019_theorem_4_5_5_martingalePart_max_one_normalized_on_of_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_finite_or_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`.
The raw conditional-expectation representative no longer needs pointwise
monotonicity in the active Theorem 4.5.5 route.
V233 packages the finite square-clock side:
`durrett2019_martingale_square_sub_predictablePart_martingale`,
`durrett2019_theorem_4_5_5_predictablePart_martingalePart_square_le_conditionalProbabilitySum`,
`durrett2019_theorem_4_5_5_martingalePart_exists_tendsto_on_of_conditionalProbabilitySum_tendsto`,
`durrett2019_theorem_4_5_5_martingalePart_exists_tendsto_on_of_predictablePart_square_tendsto`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_square_clock_finite_or_adapted_conditionalProbabilitySum_clock_canonical_auto_tail`.
The finite branch of the canonical ratio route is now driven by convergence of
the predictable part of the Borel-Cantelli martingale square, via the existing
Theorem 4.5.2 route.
V234 adds the infinite-clock limsup endpoint:
`durrett2019_theorem_4_5_5_conditionalProbabilitySum_atTop_on_limsup_of_adapted`,
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_of_adapted_conditionalProbabilitySum_atTop`,
and
`durrett2019_theorem_4_5_5_ratio_tendsto_one_on_limsup_of_adapted`.
On `limsup B atTop`, denominator divergence is now supplied by the existing
conditional Borel-Cantelli theorem and the canonical Theorem 4.5.3 source route
proves the ratio limit.  The next packet should finish final theorem packaging
or the precise finite/no-limsup complement statement, not another denominator
divergence or raw-clock monotonicity layer.
V235 closes final textbook-facing Theorem 4.5.5 packaging:
`durrett2019_theorem_4_5_5_ratio_tendsto_one_of_adapted_conditionalProbabilitySum_atTop`
and
`durrett2019_theorem_4_5_5_conditional_borel_cantelli_ratio_package_of_adapted`.
The displayed ratio conclusion is now stated almost surely on the raw
conditional-probability divergence event, with Theorem 4.3.4 packaged beside
it as the `limsup B atTop` event identification.
V236 starts Durrett Theorem 4.5.7 with the finite-horizon maximal-probability
layer:
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_sq`,
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_terminal_sq`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_of_terminal_sq_le`,
and
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_of_terminal_sq_le`.
These wrappers consume the existing Kolmogorov/Doob square maximal inequality
and expose the stopped `P(max_{m <= n} |X_{N ∧ m}| > a)` estimate used in the
textbook proof.
V237 adds the stopped terminal-square min-bound layer:
`durrett2019_theorem_4_5_7_stoppedProcess_le_terminal_of_process_le`,
`durrett2019_theorem_4_5_7_min_terminal_integrable_of_terminal_integrable`,
`durrett2019_theorem_4_5_7_stopped_square_integral_le_min_terminal_of_stopped_bounds`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_terminal_integrable`.
V238 adds the source-facing stopped terminal-square wrappers:
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity`,
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_predictablePart_identity_monotone_terminal`,
and
`durrett2019_theorem_4_5_7_firstPredictableAbove_stopped_square_integral_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V239 adds the source-facing stopped maximal-probability wrapper:
`durrett2019_theorem_4_5_7_stopped_runningAbsMax_probability_lt_le_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V240 adds the raw/stopped survival split and source-facing raw finite-horizon
probability bound:
`durrett2019_theorem_4_5_7_runningAbsMax_eq_stopped_of_firstPredictableAbove_eq_top`,
`durrett2019_theorem_4_5_7_runningAbsMax_event_subset_terminal_tail_union_stopped`,
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_stopped`,
and
`durrett2019_theorem_4_5_7_runningAbsMax_probability_lt_le_terminal_tail_add_min_terminal_of_source_square_minus_martingale_monotone_terminal`.
V241 adds the finite-horizon layer-cake handoff:
`durrett2019_theorem_4_5_7_lintegral_le_lintegral_tail_bound_lt` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_terminal_tail_add_min_terminal_lintegral_of_source_square_minus_martingale_monotone_terminal`.
V242 adds the first deterministic RHS bridge:
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral` and
`durrett2019_theorem_4_5_7_terminal_tail_sq_lintegral_eq_sqrt_lintegral_of_integrable`.
V243 adds the second-RHS truncation layer-cake bridge:
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral`,
`durrett2019_theorem_4_5_7_terminal_nonneg_of_initial_zero_monotone_tendsto`,
and
`durrett2019_theorem_4_5_7_min_terminal_lintegral_eq_tail_cut_lintegral_of_source_monotone_terminal`.
V244 adds the weighted second-RHS double-integral handoff:
`durrett2019_theorem_4_5_7_set_lintegral_div_toNNReal_sq`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_tail_cut_double_lintegral_of_source_monotone_terminal`.
V245 adds the source-level Tonelli swap layer:
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_kernel_measurable_of_aemeasurable`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap`,
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_aemeasurable`,
and
`durrett2019_theorem_4_5_7_tail_cut_weighted_double_lintegral_swap_of_integrable`.
V246 adds the square-root weighted-tail layer-cake endpoint:
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_integrable`,
and
`durrett2019_theorem_4_5_7_sqrt_lintegral_eq_half_mul_weighted_tail_lintegral_of_source_monotone_terminal`.
V247 adds the inverse-square calculus and denominator normalization layer:
`durrett2019_theorem_4_5_7_inv_sq_weight_of_toNNReal_sq`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_rpow_neg_two`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_rpow_neg_two`,
`durrett2019_theorem_4_5_7_ofReal_sqrt_inv_eq_rpow_half_sub_one`,
`durrett2019_theorem_4_5_7_lintegral_Ioi_sqrt_toNNReal_sq_inv_eq_tail_weight`,
and
`durrett2019_theorem_4_5_7_const_div_lintegral_Ioi_sqrt_toNNReal_sq`.
V248 adds the fixed-`b` event-split inner-integral layer:
`durrett2019_theorem_4_5_7_lintegral_Ioi_zero_indicator_Ioi_sqrt` and
`durrett2019_theorem_4_5_7_tail_cut_inner_lintegral_eq_tail_weight`.
V249 adds the outer second-RHS assembly:
`durrett2019_theorem_4_5_7_tail_cut_double_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_weighted_tail_lintegral`,
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral`,
and
`durrett2019_theorem_4_5_7_second_rhs_weighted_lintegral_eq_two_sqrt_lintegral_of_source_monotone_terminal`.
V250 adds the finite-horizon endpoint:
`durrett2019_theorem_4_5_7_terminal_tail_sq_measure_aemeasurable` and
`durrett2019_theorem_4_5_7_runningAbsMax_lintegral_le_three_sqrt_lintegral_of_source_square_minus_martingale_monotone_terminal`.
The next theorem-facing target is no longer finite sum/integral exchange,
V214-to-V209 wiring, the tail-integral-to-clock-bound package,
variance-ratio integrability packaging, lower-bound/no-zero/divergence
plumbing, deterministic normalizer-divergence packaging, event-local
random-normalizer packaging, Theorem 4.5.5 ratio algebra, finite-limit
denominator bridges, increment/denominator-clock plumbing, Bernoulli
conditional-variance algebra, max-normalizer denominator handoff,
finite/infinite event-cover ratio assembly, the max-normalizer 4.5.3 source
handoff, raw-clock monotonicity, final Theorem 4.5.5 packaging, stopped
4.5.7 source packaging, the V240 raw/stopped split, or the V241 layer-cake
handoff, the V242 first-RHS bridge, or the V243 truncation layer-cake bridge.
Do not redo the V244 weighted double-integral handoff, the V245
Tonelli/measurability swap layer, the V246 square-root weighted-tail endpoint,
the V247 inverse-square denominator calculus, or the V248 fixed-`b` inner
integral, the V249 second-RHS assembly, or the V250 finite-horizon aggregation.
Move next to the Theorem 4.5.7 finite-horizon-to-supremum monotone limit.  Do
not route back to
Chapter 2.1, Theorem 2.4.9, Theorem 2.2.12, Chapter 3 wrappers, stopped
running-maximum boundedness, stopped predictability, exact Theorem 4.5.2
packaging, deterministic Exercise 4.4.11 normalizers, reciprocal
predictability/bounds, conditional variance pull-out, scalar interval
comparison, finite clock comparison, deterministic summability packaging,
random pathwise summability packaging, integrated finite-sum/Fubini
summability plumbing, V214-to-V209 endpoint wiring,
tail-integral-to-clock-bound packaging, transform `MemLp` packaging,
scaled-square/increment-square integrability packaging, variance-ratio
integrability packaging, finite random clock-integrability packaging, or
interval-integrability/normalizer-increment/reciprocal-square-continuity
packaging, lower-bound/no-zero packaging, normalizer-divergence-from-clock
packaging, deterministic normalizer-divergence packaging, or scaled-summability
handoff wrappers unless a later theorem exposes a precise missing primitive.

Closed Chapter 2 support lives in
`StatInference/ProbabilityTheory/Basic.lean`.  Chapter 2.1 has compiled
independence/product-law wrappers, including Theorem 2.1.10's partial-sum
difference versus early-block statistic/indicator wrappers, Theorem 2.1.12's
source-facing independent-pair expectation formulas, Theorem 2.1.13's
finite-set/range/interval product-expectation and zero-mean-factor consumers,
Theorem 2.2.1's covariance and finite/range variance-sum support,
Theorem 2.1.15's CDF convolution handoff, and Theorem 2.1.16's
convolution-law, density-existence, Fubini/withDensity formula, and
two-density support; Theorem 2.4.9 has the full empirical-CDF
Glivenko-Cantelli route through the arbitrary-law cutpoint-chain construction.
Treat
`durrett2019_theorem_2_1_10_indepFun_lateIncrementSum_earlyBlockFunction`,
`durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockFunction`,
`durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockIndicator`,
`durrett2019_theorem_2_1_12_indepFun_lintegral_pair`,
`durrett2019_theorem_2_1_12_indepFun_integral_pair`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_prod_integral`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_zero_of_integral_eq_zero`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_range_prod_eq_prod_integral`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_range_prod_eq_zero_of_integral_eq_zero`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_Ico_prod_eq_prod_integral`,
`durrett2019_theorem_2_1_13_iIndepFun_integral_Ico_prod_eq_zero_of_integral_eq_zero`,
`durrett2019_theorem_2_2_1_uncorrelated_covariance_eq_zero`,
`durrett2019_theorem_2_2_1_variance_finsetSum_of_uncorrelated`,
`durrett2019_theorem_2_2_1_variance_rangeSum_of_uncorrelated`,
`durrett2019_theorem_2_2_1_iIndepFun_integral_mul_eq_mul_integral`,
`durrett2019_theorem_2_2_1_variance_finsetSum_of_iIndepFun`,
`durrett2019_theorem_2_2_1_variance_rangeSum_of_iIndepFun`,
`durrett2019_theorem_2_1_15_product_cdf_convolution`,
`durrett2019_theorem_2_1_15_indepFun_cdf_convolution`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_conv`,
`durrett2019_theorem_2_1_16_conv_absolutelyContinuous_of_left_density`,
`durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_density`,
`durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_real_density`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_of_supplied_density`,
`durrett2019_theorem_2_1_16_conv_withDensity_left_lintegral`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_lintegral_density`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_real_lintegral_density`,
`durrett2019_theorem_2_1_16_two_density_lintegral_kernel_eq`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_lintegral_density`,
`durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_real_lintegral_density`,
the V507 source-shaped `left_lintegral_density`,
`left_real_lintegral_density`, `two_lintegral_density`, and
`two_real_lintegral_density` families for iid, identical-distribution, joint
infinite-product, canonical product-coordinate, one-based, and
pairwise-identically-distributed source hypotheses,
the V508 source-shaped `sum_law_absolutelyContinuous` and
`sum_law_absolutelyContinuous_left_real_density` families for the same source
hypotheses,
the V509 source-shaped `sum_hasLaw_of_supplied_density` family for the same
source hypotheses,
the V510 zero-based source-shaped Theorem 2.4.9
`empiricalDistributionFunction_*_cdf_ae` and
`empiricalLeftDistributionFunction_*_leftLim_ae` pointwise convergence
families for identical-distribution plus `iIndepFun` and
pairwise-identically-distributed hypotheses,
the V511 one-based source-shaped Theorem 2.4.9
`empiricalDistributionFunction_oneBased_*_cdf_ae` and
`empiricalLeftDistributionFunction_oneBased_*_leftLim_ae` raw/range pointwise
convergence families for source, joint-law, shifted-joint-law,
identical-distribution, and pairwise-identically-distributed hypotheses,
the V512 one-based source-shaped Theorem 2.4.9
`finite_cutpoints_oneBased_*_closed_left_errors_lt` raw/range burn-in families
for source, joint-law, shifted-joint-law, identical-distribution,
pairwise-identically-distributed, and canonical iid source shapes,
the V513 one-based source-shaped Theorem 2.4.9
`middlePartition_oneBased_*_uniform_error_lt_two_mul` raw/range
bounded-squeeze families for source, joint-law, shifted-joint-law,
identical-distribution, pairwise-identically-distributed, and canonical iid
source shapes,
the V514 one-based source-shaped Theorem 2.4.9
`middlePartitionWithTails_oneBased_*_uniform_error_lt_two_mul` raw/range
global-squeeze families for source, joint-law, shifted-joint-law,
identical-distribution, pairwise-identically-distributed, and canonical iid
source shapes,
the V515 arbitrary-tolerance one-based source-shaped Theorem 2.4.9
`middlePartitionWithTails_oneBased_*_uniform_error_lt` raw/range
global-squeeze families for source, joint-law, shifted-joint-law,
identical-distribution, pairwise-identically-distributed, and canonical iid
source shapes,
the V516 one-based route-named Theorem 2.4.9
`middlePartitionWithTails_oneBased_range_sum_outerAlmostSureUniformDeviation`
families for source, joint-law, shifted-joint-law, identical-distribution,
pairwise-identically-distributed, and canonical iid source shapes,
the V517 zero-based route-named Theorem 2.4.9
`middlePartitionWithTails_(range_sum|inv_mul)_outerAlmostSureUniformDeviation`
families for the generic pairwise route plus source, joint-law, canonical iid,
identical-distribution, and pairwise-identically-distributed source shapes,
the V518 one-based Chapter 2.1.10/2.1.13 Kolmogorov-support
late-increment/early-block independence and mixed-term-zero wrappers,
the V519 one-based Chapter 2.1.13 range/Ico product-expectation wrappers,
zero-factor corollaries, nonnegative `lintegral` wrappers, real nonnegative
`ENNReal.ofReal` wrappers, and iid law-side power displays,
the V520 one-based law-side Chapter 2.1.13 range/Ico product-expectation
wrappers for non-iid families, their nonnegative/real-nonnegative branches,
and the remaining iid law-side nonnegative power displays,
the V521 literal one-based `Finset.Icc 1 n` Chapter 2.1.13
product-expectation displays for law-side/source-side ordinary, nonnegative,
real nonnegative, iid power, and zero-factor branches,
the V522 source-side iid Chapter 2.1.13 power displays under `IdentDistrib`
for finite/range/Ico and one-based range/Ico/`Icc` ordinary, nonnegative, and
real nonnegative product expectations,
the V523 law-side Chapter 2.1.13 zero-factor corollaries for ordinary,
nonnegative, and real nonnegative finite/range/Ico and one-based range/Ico/
`Icc` product expectations,
the V524 source-side Chapter 2.1.13 absolute-value/norm product displays and
iid `IdentDistrib` power collapses for finite/range/Ico and one-based
range/Ico/`Icc` products,
the V525 source-side Chapter 2.1.13 finite-product integrability wrappers for
finite/range/Ico and one-based range/Ico/`Icc` products,
the V526 source-side iid Chapter 2.1.13 finite-product integrability wrappers
under `IdentDistrib` for finite/range/Ico and one-based range/Ico/`Icc`
products,
the V527 source-side Chapter 2.1.13 paired expectation-exists-and-value
wrappers for finite/range/Ico and one-based range/Ico/`Icc` products,
including iid `IdentDistrib` power-value variants,
the V528 law-side Chapter 2.1.13 paired expectation-exists-and-value wrappers
for finite/range/Ico and one-based range/Ico/`Icc` products, including iid
law-side power-value variants,
the V529 source-side Chapter 2.1.13 zero-factor expectation-exists wrappers
for finite/range/Ico and one-based range/Ico/`Icc` products,
the V530 law-side Chapter 2.1.13 zero-factor expectation-exists wrappers for
finite/range/Ico and one-based range/Ico/`Icc` products,
the V531 source-side iid Chapter 2.1.13 zero-factor expectation-exists
wrappers under `IdentDistrib` for finite/range/Ico and one-based range/Ico/
`Icc` products,
the V532 law-side iid Chapter 2.1.13 zero-factor expectation-exists wrappers
for finite/range/Ico and one-based range/Ico/`Icc` common-law products,
the V533 source-side composed-function Chapter 2.1.13 zero-factor
expectation-exists wrappers for finite/range/Ico and one-based
range/Ico/`Icc` composed products,
the V534 source-side composed-function Chapter 2.1.13
expectation-exists-and-value wrappers for finite/range/Ico and one-based
range/Ico/`Icc` composed products,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`, and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure` as
closed support.  V307 additionally closes the canonical infinite iid product
source shape and canonical product-space empirical-CDF endpoints:
`durrett2019_theorem_2_1_11_canonical_iid_infinite_product_coordinates`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_canonical_iid`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid`.
V308 additionally closes the exact range-sum display wrappers:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum`
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_range_sum`.
V309 additionally closes the exact `n^{-1} * sum` display wrappers:
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum`
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_canonical_iid_inv_mul_range_sum`.
V310 additionally closes the direct `iIndepFun` source wrappers:
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun`.
V311 additionally closes the infinite-product-law source criterion and
product-law consumers:
`durrett2019_theorem_2_1_11_iid_sequence_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_hasLaw_infinitePi`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_hasLaw_infinitePi`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_hasLaw_infinitePi`.
V312 additionally closes the identical-distribution source bridge and
consumers:
`durrett2019_theorem_2_1_11_hasLaw_of_identDistrib_zero`,
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_iIndepFun_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_iIndepFun_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_iIndepFun_identDistrib`.
V313 additionally closes the pairwise-iid source consumers:
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_of_pairwise_identDistrib`,
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_range_sum_of_pairwise_identDistrib`,
and
`durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure_inv_mul_range_sum_of_pairwise_identDistrib`.
V314 additionally closes the countable product-law wrappers:
`durrett2019_theorem_2_1_11_iIndepFun_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iid_hasLaw_infinitePi`,
`durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_infinitePi`, and
`durrett2019_theorem_2_1_11_iid_iff_hasLaw_infinitePi`.
V315 additionally closes the standard iid source-shape product-law wrappers:
`durrett2019_theorem_2_1_11_iid_hasLaw_infinitePi_of_identDistrib` and
`durrett2019_theorem_2_1_11_iid_iff_hasLaw_infinitePi_of_identDistrib`.
Theorem 2.2.3 now has finite-block variance scaling, the
`C / n` variance bound, the source-facing `E (S_n / n - mu)^2 <= C / n`
display for uncorrelated and independent blocks, the `L^2 -> TendstoInMeasure`
Lemma 2.2.2 specialization, and the average convergence-in-probability
consumer from supplied centered `eLpNorm` convergence.  V185 also compiles the
finite-display-to-limit bridge: a `C / n` centered second-moment bound gives
centered `eLpNorm` convergence, and the uncorrelated and independent source
hypotheses now feed the final `TendstoInMeasure` weak-law endpoints directly.
V186 also compiles the Theorem 2.2.6 normalized variance bridge:
second-moment convergence gives convergence in probability, the normalized
centered square-moment identity is packaged as `Var(S_n) / b_n^2`, and the
source-facing weak-law endpoint follows.  Theorem 2.2.11, the triangular-array
weak law, now has its first source-facing spine: V187 compiles the large-jump
truncation bridge, V188 compiles the truncated-row variance/centering bridge
plus the final assembly from hypotheses (i)/(ii), and V189 compiles
source-side truncation inheritance for measurability, bounded `L^2`, and
row-wise independence, plus the final original-row source wrapper and the first
Theorem 2.2.12 single-sequence specialization.  V191 adds the exact
Theorem 2.2.12 centering/display bridge: the truncated mean `mu_n`, equality of
the triangular centering constant with `n * mu_n` from identical distribution,
and the textbook display `S_n / n - mu_n -> 0` from the compiled
Theorem 2.2.11 numeric hypotheses.  V192 adds row-to-single numeric reductions:
the large-jump row sum is reduced to `n * P(|X_0| > n)`, and the row truncated
second-moment hypothesis is reduced to `E[bar X_{n,0}^2] / n -> 0`.
V193 discharges the large-jump side from Durrett's real-tail assumption
`x * P(|X_0| > x) -> 0`, leaving only the truncated second-moment average to
derive from Lemma 2.2.13.  V194 registers Lemma 2.2.13 in mathlib's `lintegral`
layer-cake form and adds a source-facing second-bound consumer, so a verified
vanishing upper bound for `E[bar X_{n,0}^2] / n` now feeds the final
Theorem 2.2.12 display directly.  V195 proves the tail-average/Cesaro bridge
from Durrett's real-tail source assumption to
`(1/n) * ∫_0^n 2*y*P(|X_0|>y) dy -> 0`.  V196 proves automatic local
integrability of the clipped tail profile and packages the exact tail-average
endpoint wrappers.  V197 adds the truncated-tail event domination support
needed for the final layer-cake comparison.  V198 adds the bridge from a
supplied ordinary truncated-square layer-cake display to the exact
tail-average bound.  V199 adds ordinary square-tail layer-cake support, the
positive square-tail event rewrite, the finite-support conversion from the
radius-layer-cake display over `(0,∞)` to the textbook display over `(0,n]`,
and the direct `(0,∞)` radius-layer-cake consumer.  New V188-V200 declarations
are
`durrett2019_theorem_2_2_11_measurable_truncationMap`,
`durrett2019_theorem_2_2_11_measurable_truncated`,
`durrett2019_theorem_2_2_11_norm_truncated_le_abs_bound`,
`durrett2019_theorem_2_2_11_truncated_memLp_two_of_measurable`,
`durrett2019_theorem_2_2_11_iIndepFun_truncated_of_iIndepFun`,
`durrett2019_theorem_2_2_11_truncatedMeanRowSum`,
`durrett2019_theorem_2_2_11_integral_truncatedRowSum_eq_truncatedMeanRowSum`,
`durrett2019_theorem_2_2_11_truncatedRowSum_memLp_two`,
`durrett2019_theorem_2_2_11_variance_truncatedRowSum_le_secondMomentSum`,
`durrett2019_theorem_2_2_11_variance_div_sq_tendsto_zero_of_truncatedSecondMoment`,
`durrett2019_theorem_2_2_11_tendstoInMeasure_truncatedRowSum_sub_mean_of_truncatedSecondMoment`,
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncated`,
and
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncatedSecondMoment`,
and
`durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_iIndepFun`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_sub_truncatedMean_of_iIndepFun`,
`durrett2019_theorem_2_2_12_truncatedMean`,
`durrett2019_theorem_2_2_12_truncatedMeanRowSum_eq_nat_mul_truncatedMean_of_integral_eq`,
`durrett2019_theorem_2_2_12_integral_truncated_eq_truncatedMean_of_identDistrib`,
`durrett2019_theorem_2_2_12_truncatedMeanRowSum_eq_nat_mul_truncatedMean_of_identDistrib`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun`,
`durrett2019_theorem_2_2_12_tailSum_eq_nat_mul_tailProb_of_identDistrib`,
`durrett2019_theorem_2_2_12_tailSum_tendsto_zero_of_identDistrib`,
`durrett2019_theorem_2_2_12_nat_tail_tendsto_zero_of_real_tail`,
`durrett2019_theorem_2_2_12_integral_truncated_sq_eq_single_of_identDistrib`,
`durrett2019_theorem_2_2_12_truncatedSecondMoment_tendsto_zero_of_single`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_single`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_single_second`,
`durrett2019_lemma_2_2_13_lintegral_rpow_tail_lt`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_eventual_bound`, and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_second_bound`,
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_bounded_tendsto_zero`,
and
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_real_tail`,
`durrett2019_theorem_2_2_12_tail_profile_integrableOn`,
`durrett2019_theorem_2_2_12_tail_average_tendsto_zero_of_real_tail_auto_integrable`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_tail_average_bound`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_tail_average_bound_auto_integrable`,
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_tail_average_bound`,
and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail_and_tail_average_bound_auto_integrable`,
`durrett2019_theorem_2_2_12_abs_truncated_le_abs`,
`durrett2019_theorem_2_2_12_abs_truncated_le_level`,
`durrett2019_theorem_2_2_12_truncated_tail_subset_original`,
`durrett2019_theorem_2_2_12_measureReal_truncated_tail_le_original`,
and
`durrett2019_theorem_2_2_12_measureReal_truncated_tail_eq_zero_of_level_le`,
and
`durrett2019_theorem_2_2_12_tail_average_bound_of_truncated_layercake`,
`durrett2019_theorem_2_2_12_truncated_sq_integrable`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_tail_sq`,
`durrett2019_theorem_2_2_12_sq_tail_event_eq_abs_tail`,
`durrett2019_theorem_2_2_12_measureReal_sq_tail_eq_abs_tail`,
`durrett2019_theorem_2_2_12_truncated_layercake_Ioc_of_Ioi`, and
`durrett2019_theorem_2_2_12_tail_average_bound_of_truncated_layercake_Ioi`.
V200 closes the remaining Theorem 2.2.12 layer-cake support:
`durrett2019_lemma_2_2_13_lintegral_abs_sq_tail_lt`,
`durrett2019_lemma_2_2_13_integral_abs_sq_tail_lt`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius_lintegral`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius`,
`durrett2019_theorem_2_2_12_truncated_sq_layercake_radius_eventually`,
`durrett2019_theorem_2_2_12_tail_average_bound_of_layercake`,
`durrett2019_theorem_2_2_12_single_second_tendsto_zero_of_real_tail`, and
`durrett2019_theorem_2_2_12_tendstoInMeasure_partialSum_div_sub_truncatedMean_of_iIndepFun_of_real_tail`.
Do not repeat 2.1, 2.2.1, 2.2.3 scalar plumbing, 2.2.6, 2.2.12 layer-cake,
2.4.9, the square-tail ordinary layer-cake layer, or the finite-support
`(0,n]` cutdown.  Continue with the next unsaturated textbook spine; use
Chapter 3 weak convergence / characteristic functions / CLT wrappers as the
default unless a later theorem explicitly exposes a missing Chapter 2
primitive.

For each cycle, route from:

1. `docs/durrett2019_probability_theory_current_blocker_primitive_plan.md`;
2. `docs/durrett2019_probability_theory_progress_dashboard.md`;
3. this blueprint;
4. the latest pushed commit and current remote contributions.

Keep the cycle small and source-facing: sync, inspect only the current theorem
anchors and relevant local/GitHub Lean contributions, name the source item,
target declaration, and consumed primitive, implement one theorem-sized Lean
packet, verify, update docs only when the frontier changes, commit, and push.
Use a separate worktree for dirty checkouts, long builds, or disjoint lanes.
Use subagents only when the user explicitly authorizes parallel agent work.

## Status Vocabulary

- `exact-local`: exact textbook item statement is formalized and proved with no
  `sorry`, `admit`, unreviewed `axiom`, or `unsafe`, and a report may be
  prepared.
- `source-wrapper`: compiled Durrett-named theorem wrapper around mathlib or
  existing local code; useful for source crosswalks, but not yet a full theorem
  report unless the statement is exact.
- `local-layer`: compiled supporting primitive that moves toward a source item.
- `mathlib-foundation`: mathlib already has the mathematical theorem/API, but
  no Durrett-exact wrapper/report exists yet.
- `reused-local`: existing `StatInference/ProbabilityMeasure`,
  `EmpiricalProcess`, or `Asymptotics` declaration is the proof authority.
- `pending-local`: not started.
- `deferred-application`: example or optional starred topic temporarily skipped
  because it needs substantial external-domain formalization.

## Book Spine

- Chapter 1: measure theory, probability spaces, distributions, measurable
  maps, integration, expected value, product measures, Fubini.
- Chapter 2: independence, weak laws, Borel-Cantelli, strong laws, random
  series, renewal theory, large deviations.
- Chapter 3: central limit theorems, characteristic functions, CLT variants,
  infinitely divisible laws, limit theorems in `R^d`.
- Chapter 4: conditional expectation and martingales, convergence,
  inequalities, optional stopping, random walk applications.
- Chapter 5: Markov chains, construction, Markov properties, recurrence,
  transience, stationary distributions, convergence theorem.
- Chapter 6: ergodic theorems.
- Chapter 7: Brownian motion and stochastic calculus foundations.
- Chapter 8: Donsker theorem, Brownian-motion limit theory, CLT for dependent
  sequences, law of the iterated logarithm.
- Appendix: extension, uniqueness, Radon-Nikodym, conditional probability,
  Kolmogorov extension, analytic support.

## Priority Lanes

### Lane A: Chapter 2 independence and product laws

Durrett Sections 2.1.1-2.1.3 are the first high-leverage lane.  They connect
generated sigma-field wrappers, mathlib independence APIs, local product
measure wrappers, and later LLN/CLT/martingale proofs.

Source anchors:

- Theorem 2.1.6, pi-lambda theorem:
  `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_1-122.md`
  around the Section 2.1.1 independence proof.
- Theorem 2.1.7, independent pi-systems generate independent sigma-fields.
- Theorem 2.1.8, distribution-function criterion for independence.
- Theorem 2.1.9, independent grouped sigma-fields.
- Theorem 2.1.10, functions of disjoint independent random-variable blocks are
  independent.
- Theorem 2.1.11, independent random variables have product joint law.
- Theorem 2.1.12, expectation/Fubini formula for independent pairs.
- Theorem 2.1.13, expectation of a product of independent variables.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- mathlib `Probability.Independence.Basic`
- mathlib `Probability.Independence.Integration`
- mathlib `Probability.HasLaw`
- mathlib `Probability.Process.FiniteDimensionalLaws`

The first theorem-sized Durrett packet should package theorem statements whose
proof authority is already mathlib/local.  Avoid rebuilding Dynkin-system
foundations unless mathlib lacks the exact generated-independence bridge needed
for Theorems 2.1.7-2.1.10.

### Lane B: Borel-Cantelli and convergence upgrades

Durrett Section 2.3 is immediately reusable and already partly covered by
`StatInference/ProbabilityMeasure/BorelCantelli.lean`.

Source anchors:

- Theorem 2.3.1, first Borel-Cantelli lemma.
- Theorem 2.3.2, convergence in probability iff every subsequence has an a.s.
  convergent further subsequence.
- Theorem 2.3.4, continuous mapping for convergence in probability and bounded
  expectation convergence.
- Theorem 2.3.7, second Borel-Cantelli lemma.
- Theorem 2.3.9, pairwise-independent record-count strong ratio.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- mathlib `Probability.BorelCantelli`
- mathlib convergence-in-measure/probability APIs

Compiled first source wrappers:

- Durrett Theorem 2.3.1 around `measure_limsup_atTop_eq_zero`.
- Durrett Theorem 2.3.7 around `measure_limsup_eq_one`.
- Durrett Theorem 2.4.1 around `strongLaw_ae_real` and
  `centeredStrongLaw_ae_real`.
- Early pi-system uniqueness bridge around
  `probabilityMeasure_ext_of_generate_finite`.
- Durrett Theorem 1.1.1 measure-property wrappers and Theorems 1.3.1/1.3.4
  measurability wrappers.
- Durrett Theorem 2.1.7 generated-pi-system independence, Theorem 2.1.8
  generated-rectangle and real lower-halfline distribution-function criteria,
  Theorem 2.1.9 grouped sigma-field independence, Theorem 2.1.10
  measurable-function preservation/finite disjoint-block/product-coordinate
  independence, 2.1.11 pair and finite-family product laws, 2.1.12
  product/Fubini expectation, and 2.1.13 expectation-factorization wrappers.
- Durrett Theorem 2.1.11 iid notation polish:
  `probability_pi_iid_coordinates_with_joint_law`,
  `durrett2019_theorem_2_1_11_iid_hasLaw_pi`,
  `durrett2019_theorem_2_1_11_iid_iff_hasLaw_pi`, and
  `durrett2019_theorem_2_1_11_canonical_iid_product_coordinates` package the
  common-law finite product and canonical iid product-space source shapes.
- Durrett Theorem 2.4.9 conditional Glivenko-Cantelli handoffs from supplied
  endpoint grids and supplied middle CDF partitions.
- Durrett Theorem 2.4.9 one-cell middle CDF partition base case:
  `SuppliedRealMiddleCDFPartition.oneCell`,
  `exists_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`.
- Durrett Theorem 2.4.9 two-cell split constructor:
  `SuppliedRealMiddleCDFPartition.twoCell`,
  `exists_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`.
- Durrett Theorem 2.4.9 right-append constructor:
  `SuppliedRealMiddleCDFPartition.snocCell`,
  `exists_realMiddleCDFPartition_snocCell_of_exists`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists`.
- Durrett Theorem 2.4.9 finite cutpoint-chain consumer:
  `SuppliedRealMiddleCDFPartitionChain`,
  `exists_realMiddleCDFPartition_of_cutpoint_chain`, and
  `durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain`.
- Durrett Theorem 2.4.9 endpoint-grid-to-cutpoint-chain handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid` and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid`; plus
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_closed_cover_refinement`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement`.
- Durrett Theorem 2.4.9 source-facing empirical distribution-function layer:
  `empiricalDistributionFunction`,
  `RealEmpiricalCDFGlivenkoCantelliClass`, and
  `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`
  package the local `sup_x |F_n(x) - F(x)| -> 0` predicate.
- Durrett Theorem 2.4.9 atom-aware endpoint-grid handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_punctured_cover_refinement`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement`.
- Durrett Theorem 2.4.9 atom-aware open-cover/avoidance handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_avoids_center_refinement`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement`.
- Durrett Theorem 2.4.9 endpoint-center handoff:
  `endpoint_not_mem_adjacent_Ioo_of_strictMono`,
  `SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_endpoint_center_refinement`,
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement`.
- Durrett Theorem 2.4.9 cutpoint-chain splitting handoff:
  `SuppliedRealMiddleCDFPartitionChain.append` and
  `durrett2019_theorem_2_4_9_cutpointChain_append`.
- Durrett Theorem 2.4.9 inserted-subcell punctured-cover handoff:
  `cdf_leftLim_sub_lt_of_Ioo_subset_punctured_cover`,
  `cdf_leftLim_sub_lt_of_subdivision_punctured_cover_subinterval`, and
  `durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`.
- Durrett Theorem 2.4.9 punctured-cover cell-splitting handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_subdivision_punctured_cover_cell`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_subdivision_punctured_cover_cell`.
- Durrett Theorem 2.4.9 strict-subdivision-prefix handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_strict_subdivision_prefix_closed_cover`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`.
- Durrett Theorem 2.4.9 extracted-subdivision-adjacency handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_extracted_subdivision_adjacencies_closed_cover`
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`.
- Durrett Theorem 2.4.9 monotone-subdivision duplicate-skip handoff:
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_closed_cover_to_index`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_closed_cover`,
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`.
- Durrett Theorem 2.4.9 monotone-subdivision endpoint-center handoff:
  `subdivision_value_not_mem_adjacent_Ioo_of_monotone`,
  `cdf_leftLim_sub_lt_of_subdivision_endpoint_center_cover_cell`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_endpoint_center_cover_to_index`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_endpoint_center_cover`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_center_mem_cover`,
  and
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`;
  the Durrett center-range wrapper is
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`.
- Durrett Theorem 2.4.9 arbitrary-law atom-aware local ingredients:
  `exists_realOpenInterval_diff_singleton_measureReal_lt`,
  `exists_finset_realOpenInterval_punctured_cover_Icc_measureReal_lt`,
  `exists_monotone_subdivision_of_finset_realOpenInterval_punctured_cover_Icc`,
  `exists_monotone_subdivision_Icc_punctured_measureReal_lt`,
  `durrett2019_theorem_2_4_9_punctured_small_open_interval`,
  `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`, and
  `durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover`.
- Durrett Theorem 2.4.9 arbitrary-law punctured-subdivision chain and GC
  packages:
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_subdivision_prefix_punctured_cover_to_index`,
  `SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_punctured_cover`,
  `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_punctured_cover`,
  `durrett2019_theorem_2_4_9_cutpointChain`, and
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine`.
- Durrett Theorem 2.4.9 non-atomic local grid ingredient:
  `exists_realOpenInterval_measureReal_lt_of_noAtoms` and
  `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`.
- Durrett Theorem 2.4.9 non-atomic finite compact-cover ingredient:
  `exists_finset_realOpenInterval_cover_Icc_measureReal_lt_of_noAtoms` and
  `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`.
- Durrett Theorem 2.4.9 non-atomic monotone-subdivision ingredient:
  `exists_monotone_subdivision_Icc_measureReal_lt_of_noAtoms` and
  `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`.
- Durrett Theorem 2.4.9 non-atomic cutpoint-chain and GC packages:
  `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms` and
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`.
- Durrett Theorem 2.4.9 cutpoint-chain-to-GC handoff:
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`.
- Durrett Theorem 2.4.9 center-range subdivision-to-GC handoff:
  `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`.

The subsequence and continuous-mapping theorems are higher value but may require
more topological convergence API packaging.

### Lane C: Strong laws and empirical distribution functions

Durrett Section 2.4 is a major downstream target and overlaps with existing
Billingsley/VdV&W infrastructure.

Source anchors:

- Theorem 2.4.1, Etemadi strong law for pairwise independent identically
  distributed integrable variables.
- Lemma 2.4.2, truncation reduction.
- Lemma 2.4.3, variance summability for truncations.
- Lemma 2.4.4, scalar tail-sum bound.
- Theorem 2.4.5, infinite positive mean strong divergence.
- Theorem 2.4.7, renewal-count asymptotic.
- Theorem 2.4.9, Glivenko-Cantelli theorem.

Initial Lean anchors:

- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- mathlib `Probability.StrongLaw`
- mathlib Borel-Cantelli and layer-cake/tail integrals

Mathlib currently supplies a real-valued strong law under pairwise independence
and identical distribution through the local wrapper
`strongLaw_ae_real`.  Durrett Theorem 2.4.1 starts as a source-wrapper over
that theorem; this wrapper now compiles in
`StatInference/ProbabilityTheory/Basic.lean`.  The previous Chapter 2.4 target
was Durrett Theorem 2.4.9, Glivenko-Cantelli for empirical CDFs, by reusing the
existing `RealHalfLineGC.lean` fixed-endpoint and half-line infrastructure and
filling the arbitrary-CDF finite quantile grid/squeezing layer.  The supplied
endpoint-grid and supplied middle-CDF-partition handoffs now compile, and the
one-cell, two-cell, right-append, and finite cutpoint-chain middle-partition
consumers now compile.  A strict endpoint-grid-to-cutpoint-chain handoff, a
closed-cover endpoint-grid refinement handoff, a
non-atomic local small-neighborhood lemma, a non-atomic finite compact-cover
lemma, a non-atomic monotone-subdivision lemma, strict-prefix and extracted-gap
closed-cover handoffs, a monotone-prefix duplicate-skip induction, a non-atomic
cutpoint-chain package, a Durrett-named cutpoint-chain-to-GC handoff, and the
non-atomic half-line Glivenko-Cantelli package also compile.  For arbitrary
laws, punctured local neighborhoods and finite compact punctured covers now
compile, together with the endpoint-grid consumer for open cells that avoid
the selected atom center.  The open-cover/avoidance bridge now reduces the
punctured-cover consumer to ordinary open-cover refinement plus the fact that
the selected center is not inside the open cell.  The arbitrary-distribution
core now avoids a separate global endpoint-insertion construction: each strict
monotone-subdivision cell is split at its selected atom center only when that
center lies inside the cell, finite prefixes are assembled by chain append, and
`durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine` compiles for arbitrary
probability laws on the real line.

### Lane D: Weak convergence, CLT, and characteristic functions

Chapter 3 is the next large probability-theory spine after laws of large
numbers.  Search mathlib and local files for weak convergence, characteristic
functions, normal distribution APIs, and finite-dimensional weak convergence
before formalizing.

Compiled Section 3.2 packets:

- Durrett Theorem 3.2.10, continuous mapping theorem, continuous case.  Reuse
  `MeasureTheory.TendstoInDistribution.continuous_comp` through the local
  `tendstoInDistribution_continuous_comp` wrapper.  The varying-domain and
  common-probability-space forms now compile in
  `StatInference/ProbabilityTheory/Basic.lean`.
- Durrett Theorem 3.2.9, bounded-continuous test functions.  The wrapper
  bridges random-variable laws to local probability-measure weak convergence
  and uses `integral_map` to state the theorem in Durrett's expectation form.
- Durrett Theorem 3.2.11, Portmanteau alternatives.  The compiled wrappers
  cover open-set, closed-set, continuity-set, closed-converse, and open-converse
  forms for `TendstoInDistribution`.
- Durrett Section 3.3, characteristic functions.  The compiled wrappers cover
  law-level notation, Theorem 3.3.1 zero, conjugation, norm bound, continuous
  consequence, affine-map formula, and Theorem 3.3.2 independent-sum product
  law.
- Durrett Theorem 3.3.17, continuity theorem.  The compiled wrappers cover both
  directions of law-level characteristic-function convergence, the tightness
  branch from pointwise convergence to a continuous-at-zero limit, a bundled
  identified-limit form, and random-variable `TendstoInDistribution` wrappers.
- Durrett Theorem 3.3.20, centered unit-variance second-order expansion.  This
  exposes the Taylor estimate used in the i.i.d. CLT proof.
- Durrett Theorem 3.4.1, i.i.d. central limit theorem.  The compiled wrappers
  cover centered unit-variance and variance-Gaussian display forms.
- Durrett Theorem 3.4.10, Lindeberg-Feller for triangular arrays.  The
  compiled bridge covers row-sum notation, row-wise independence, finite-row
  characteristic-function products, product-to-row characteristic-function
  convergence, textbook mean-zero/variance-sum/Lindeberg-tail predicates, the
  explicit `exp(-sigma^2 t^2 / 2)` product-convergence interface, Gaussian
  characteristic-function display, row Gaussian exponential targets, quadratic
  variance coefficients/factors/products, Exercise 3.1.1 triangular-array
  row-sum, max-absolute, absolute-row-sum boundedness, product interfaces, the
  positivity/log-remainder proof route, and the proved source theorem, a
  variance-tail split bridge from Lindeberg to max-row-variance smallness, a
  proof of the textbook variance-tail split from square-integrable rows,
  specialized Exercise 3.1.1 bridges for the quadratic coefficients,
  max-row-variance-to-factor-norm bridges, Lemma 3.4.3 product-difference
  control, the variance-sum-to-row-target convergence bridge, the
  Levy-continuity handoff from a supplied analytic certificate to convergence
  in distribution, a named characteristic/quadratic error row sum, a
  source-shaped finite-row Taylor/Lindeberg bound predicate, a compiled bridge
  from that finite-row bound plus Lindeberg to row-sum error convergence, a
  source-shaped one-factor Taylor/Lindeberg bound predicate, a scalar
  Taylor-bound predicate written with second moments, a scalar expansion-bound
  predicate retaining the linear term, the pointwise truncation split of
  Durrett's minimum term, the pointwise Durrett Lemma 3.3.19 remainder term and
  predicate, the pure scalar minimum-form Taylor estimate, the compiled
  pointwise-to-expectation bridge to the (3.3.3) remainder predicate, and
  compiled constructors from the expansion bound to the scalar Taylor bound,
  one-factor bound, finite-row bound, analytic certificate, direct
  square-integrable analytic certificate, and final convergence-in-distribution
  theorem.

Next packet:

- Chapter 4.4: continue Exercise 4.4.11.  The current frontier is no longer
  Exercise 4.4.6, Exercise 4.4.10, the predictable-transform convergence
  bridge, Abel/Kronecker summation, the Toeplitz split, the centered Toeplitz
  remainder, the normalized increment-sum a.e. endpoint, the zero-initial
  normalized-process display, the bounded-variance summability route, or the
  deterministic reciprocal-normalizer wrapper.  Section 4.5.1 now has the
  finite Doob `L^2` `eLpNorm` bridge, automatic finite-max `L^2` membership,
  ordinary finite second-moment display, monotone iSup `lintegral` handoff, the
  `runningAbsSup` square handoff, the supplied `A∞` source bridge, the
  canonical `E X_n^2 = E A_n` predictable-part identity, the terminal
  monotone-limit handoff, and the conditional-variance finite-sum display for
  Durrett's increasing process.  Next, move to Theorem 4.5.2.
  The
  Section 3.10
  multivariate CLT chain, Gaussian-coordinate independence criterion, Exercise
  3.10.8 linear-combination characterization wrappers, Durrett conditional
  expectation version predicate, mathlib-condExp version wrapper, Example 4.1.3
  self/constant wrappers, Example 4.1.4 independence wrapper, Theorem 4.1.9
  linearity/monotonicity wrappers, Theorem 4.1.10 conditional Jensen, Theorem
  4.1.11 `L¹`/`L²` contraction wrappers, Theorem 4.1.12
  measurability-collapse wrapper, Theorem 4.1.13 tower wrappers, and Theorem
  4.1.14 pull-out wrapper, and Theorem 4.1.15 `condExpL2` projection wrappers
  now compile and should be treated as closed support.  Chapter 4.2
  definition-level martingale wrappers and Example 4.2.1 linear random-walk
  martingale/supermartingale/submartingale and centered-display wrappers now
  compile.  The Example 4.2.2 quadratic martingale source bridge and its
  natural-random-walk instantiation now compile.  Example 4.2.3 product
  martingales now compile for independent integrable mean-one factors, and its
  normalized exponential display/wrapper now compiles from a nonzero common
  exponential moment.  Theorems 4.2.4 and 4.2.5 now compile as all-times and
  strict-index conditional-expectation wrappers, and the generic Theorem 4.2.6
  convex-image submartingale wrapper and `|X_n|^p` consequence now compile
  from conditional Jensen and the `x ↦ |x|^p` convexity wrapper.  Theorem
  4.2.7 increasing-convex transform, positive-part, and minimum-truncation
  wrappers now compile.  Theorem 4.2.8 predictable-transform wrappers now
  compile for submartingales, supermartingales, predictable-process
  entrypoints, and nonnegative martingale transforms.  Theorem 4.2.9
  stopped-process wrappers now compile for submartingales, supermartingales,
  and martingales.  Theorem 4.2.10 upcrossing inequality now compiles in both
  mathlib positive-part form and Durrett's textbook initial-positive-part
  subtraction display.  Theorem 4.2.11 now has direct mathlib L1/eLpNorm
  convergence wrappers: almost-sure existence, convergence to `ℱ.limitProcess`,
  L1 membership, integrability of the limit, martingale specializations, and
  the exact positive-part-boundedness bridge for Durrett's source hypothesis.
  Theorem 4.2.12 now has nonnegative-supermartingale convergence,
  integrable-limit, Fatou expectation, and final expectation-bounded limit
  wrappers.  Theorem 4.3.1 now has stopped-shifted convergence,
  survival-transfer, first-below stopping-time, bounded-increment lower-bound,
  first-below survival convergence, and bounded-below path-event convergence
  support wrappers, plus symmetric bounded-above and one-sided-bounded union
  convergence wrappers, plus the range-form convergence-or-unbounded
  dichotomy wrapper, the threshold-form oscillation wrapper, and the exact
  extended-real liminf/limsup display.  Durrett Theorem 4.3.2 now compiles
  through the Doob-decomposition existence/formula wrapper and canonical plus
  source-facing uniqueness wrappers using mathlib's
  `predictablePart`/`martingalePart` centering API.  Example 4.3.3 and Theorem
  4.3.4 conditional Borel-Cantelli now compile via mathlib
  `Probability.Martingale.BorelCantelli`.  The first Theorem 4.3.5 / Lemma
  4.3.6 RN-derivative packet now compiles: trimmed RN set-integral identity,
  likelihood-ratio martingale, and nonnegative convergence.  The Theorem 4.3.5
  regular/singular decomposition identities also now compile, including the
  source-shaped endpoint from supplied a.e. density and singular-restriction
  hypotheses.  The density-ratio/top-set source assembly also now compiles:
  dominating-measure and `mu + nu` RN ratio bridges, a source-facing `Y/Z`
  bridge, singular-set and `{X = infinity}` endpoints, and the final source
  assembly from `Y = dmu/drho`, `Z = dnu/drho`, `X = Y/Z`, and top-set
  separation.  The integral-representation to RN-derivative bridge also now
  compiles: set-integral representations of `mu` and `nu` against `rho`
  produce the `Y = dmu/drho` and `Z = dnu/drho` hypotheses consumed by the
  assembly.  The generator-extension bridge also now compiles, turning
  generator pi-system plus `univ` set-integral identities into all-measurable
  identities and the final source endpoint.  The bounded-convergence
  generator-production bridge also now compiles, turning eventual
  restricted-density identities for uniformly bounded nonnegative sequence
  densities into the generator/univ identities consumed by the endpoint.  The
  trimmed-RN eventual restricted-density bridge also now compiles, specializing
  that endpoint to the actual trimmed RN derivative sequences.  The natural
  `mu + nu` boundedness bridge also now compiles, discharging the uniform
  bound by `1` for both source sequences.  The real-to-`ENNReal` convergence
  handoff also now compiles, so the `mu + nu` endpoint consumes real-valued
  convergence of the bounded trimmed RN derivative sequences.  The bounded
  real-martingale layer also now compiles, giving limitProcess convergence for
  both natural `mu + nu` trimmed RN `toReal` sequences.  The canonical
  limit-density endpoint also now compiles, feeding finite nonnegative
  `ENNReal` density candidates built from those limit processes into the
  `mu + nu` endpoint.  The canonical-ratio endpoint also now compiles, and the
  denominator and singular-support top-set endpoints now prove both
  `nu {canonicalRatio = infinity} = 0` and
  `mu.singularPart nu {canonicalRatio = infinity}^c = 0` automatically.  The
  full canonical-ratio real identity for Theorem 4.3.5 now compiles.  The first
  Example 4.3.7 finite-partition packet also now compiles: the elementary
  partition likelihood approximation is measurable, equals the cell ratio on
  disjoint cells, and integrates over each cell to the numerator cell mass
  under the finite-cell absolute-continuity condition; its finite-union and
  generator-facing endpoint now also compile.  The first Theorem 4.3.8
  Kakutani finite-product packet also now compiles: finite-coordinate product
  likelihood measurability, rectangle set-integrals under `Measure.pi`, and the
  finite product-law `withDensity` identity.  The infinite-product
  cylinder/restriction handoff also now compiles: pulled-back likelihood
  measurability, finite-coordinate restriction `withDensity`, and cylinder
  set-integral endpoints.  The Hellinger factorization layer now also compiles:
  finite product square-root-power factorization, finite product Hellinger
  integral factorization, and the infinite-cylinder pulled-back Hellinger
  integral endpoint.  The zero-product Fatou layer now also compiles: Hellinger
  integrals tending to zero force the limiting likelihood to vanish a.e., and
  the finite-cylinder source handoff consumes finite Hellinger products
  directly.  The zero-product singularity bridge now also compiles from source
  real-identities plus `X = 0` denominator-a.e., including top-set,
  Hellinger, and cylinder-product handoffs.  The positive-product
  absolute-continuity bridge now also compiles from no-top-mass source
  real-identities, including a two-sided absolute-continuity handoff.  The
  first final branch assemblers now also compile for the zero Hellinger-product
  singular side and the two-sided no-top-mass positive side.  The
  positive-branch eliminator now also compiles: singularity forces the
  likelihood to vanish a.e., so a source dichotomy plus nonzero likelihood or
  null zero-set input yields absolute continuity.  The lintegral-nonzero and
  mass-one consumers now also compile for the positive branch.  The
  finite-cylinder mass-one/integral-convergence handoffs, the
  positive-product L1-to-integral handoff, the pairwise-liminf Cauchy-to-L1
  handoff, the Hellinger-tail-bound positive consumer, and the
  square-root/Cauchy-Schwarz Hellinger L1 bridge, and normalized
  positive-prefix product-tail convergence bridge now also compile.  The
  concrete pointwise/cylinder square-root factorization and concrete cylinder
  Cauchy handoff with the textbook factors also now compile.  The
  `sqrt X_n + sqrt X_m` square-integral estimate and the overlap-to-tail
  algebra handoff for the `sqrt X_n - sqrt X_m` side also now compile.  The
  scalar/cylinder Pythagorean overlap inequality and lower-bound-only overlap
  Cauchy handoff now also compile.  The finite-coordinate product integral,
  exact nested square-root overlap factorization, and finite Hellinger
  tail-product overlap handoff now also compile.  The HasProd/Multipliable
  prefix-tail bridge and standard `Finset.range n` HasProd-to-pairwise-liminf
  handoff now also compile.  The finite tail-product lower bound from positive
  prefix/tail monotonicity and the standard positive-product range consumer
  now also compile.  The source-density one-coordinate Hellinger affinity
  bound `≤ 1`, normalized positive-product tail `≤ 1` bridge, and standard
  source-density positive-product range consumer now also compile.  The
  standard `Finset.range n` source-density `HasProd` positive-product
  absolute-continuity handoff now also compiles.  The a.e.-finite no-top
  source bridge and the standard source-density `HasProd`
  absolute-continuity consumer using it now also compile.  Kolmogorov
  tail-event zero-one support and the zero-set-not-full positive-branch
  eliminator now also compile.  The lower-integral source bridge from tail
  zero set and `∫⁻ X ≠ 0` to zero-set-null and the positive-branch conclusion
  now also compiles.  The every-tail-block measurability bridge into the
  `limsup` tail sigma-field now also compiles, including zero-set-null and
  absolute-continuity consumers from every-tail-block measurability plus
  `∫⁻ X ≠ 0`.  The tail-coordinate sigma-field and finite tail cylinder
  likelihood measurability layer now also compiles, including finite tail
  cylinder zero-set measurability and the zero-set-equality handoff to
  every-tail-coordinate measurability.  The finite-prefix zero-set algebra and
  prefix-cylinder zero-set handoff now also compile.  The prefix/tail
  finite-block and tail-block-limit handoff layer now also compiles, including
  finite tail-block measurability, pointwise tail-block-limit measurability,
  limiting prefix/tail factorization, and the zero-set handoff from tail-block
  limits.  The pointwise finite/nonzero coordinate side-condition bridge now
  also compiles.  The range-limit tail handoff now also compiles: full-prefix
  likelihood convergence supplies the canonical tail-block limit
  `X / prefix_n` and tail-coordinate zero-set handoff under pointwise finite
  and nonzero coordinate densities.  The range-limit positive-branch consumers
  now also compile: coordinate sigma-fields are independent under the
  denominator infinite product law; ENNReal full-prefix convergence supplies
  the `toReal` convergence input for the L1/Cauchy branch; pointwise finite
  coordinate densities supply the pairwise no-top side condition; and
  pointwise full-prefix convergence plus finite/nonzero coordinate densities
  and `∫⁻ X ≠ 0` feed the tail-zero-set positive-branch eliminator.  The
  canonical-ratio handoff into these range-limit consumers now also compiles:
  the canonical `mu + nu` ratio supplies `toReal = dmu/dnu` and
  `nu {canonicalRatio = infinity} = 0` automatically.  Canonical-ratio real
  integrability, the real-valued full-prefix convergence consumer, the
  quotient-limit convergence bridge, the canonical prefix-filtration
  measurability/inclusion support, the trimmed-prefix RN-ratio identity, the
  denominator-limit nonzero bridge, canonical prefix convergence from the
  trimmed-prefix ratio, and the positive Hellinger-product wrapper with that
  convergence supplied also now compile.  The positive-product finite-limit side
  condition is also discharged from the source Hellinger affinity bounds.  The
  canonical product-tail and `tprod` positive-product wrappers also now compile,
  so the positive branch no longer needs an auxiliary tail equality and can use
  `Multipliable` plus the actual infinite Hellinger product, including
  strict-positive product variants.  The first canonical zero/positive product
  criterion wrapper also now compiles: `HasProd h 0` feeds the singular branch,
  while strict product positivity feeds the positive branch.  Canonical
  `mu + nu` limit-density and likelihood-ratio measurability are compiled
  support.  The ENNReal full-prefix convergence upgrade and closed zero/positive
  branch wrapper also now compile.  The textbook `tprod` zero/positive branch
  wrapper now also compiles.  Coordinate finiteness is now discharged from the
  finite-prefix likelihood integral-one identities, and the no-top `tprod`
  branch wrapper now also compiles, and the direct source-identity
  likelihood-mass bridge removes the ambient Kakutani dichotomy from that
  endpoint.  Lemma 4.3.9's normalized conditional-mean martingale bridge also
  now compiles.  Section 4.4 Theorem 4.4.2's nonnegative-submartingale and
  positive-part Doob maximal inequality wrappers also now compile.  The active
  target is the remaining 4.4.2 display, Example 4.4.3 Kolmogorov maximal
  inequality, or Theorem 4.4.4 Lp maximal inequality.  The remaining 4.4.2
  positive-part total-expectation display now also compiles, so the active
  frontier is Example 4.4.3 or Theorem 4.4.4.  Example 4.4.3 now has the
  squared-threshold Kolmogorov maximal wrapper, so the next frontier is the
  exact absolute-max/variance display if cheap, otherwise Theorem 4.4.4.  The
  Example 4.4.3 division and absolute-maximum variance-bound displays now also
  compile.  Theorem 4.4.4's martingale absolute-maximum consequence bridge now
  compiles from a supplied positive-part Lp maximal bound.  The p-th-power
  `lintegral` to `eLpNorm` bridge and martingale source wrapper now also
  compile.  The positive-part layer-cake equality, pointwise Doob layer-cake
  integrand bound, Hölder integral bound, set-integral to restricted-`lintegral`
  bridge, pure `lintegral` Doob integrand bound, and integrated Doob layer-cake
  bound now also compile.  The weighted/Fubini identification now also compiles
  through withDensity and base-measure forms.  The coefficient extraction,
  assembled Doob/Fubini/Hölder endpoint, scalar cancellation lemma, finite
  `lintegral` estimate, finite `eLpNorm` wrapper, generic nonnegative
  layer-cake helper, measurable-comparison Hölder helper, bounded-truncation
  Doob/Fubini/Hölder assembly, finite truncation `lintegral` proof, and
  per-cutoff truncated `lintegral` estimate, monotone-convergence/iSup handoff,
  final positive-part `eLpNorm` wrapper, and final martingale absolute-maximum
  `eLpNorm` wrapper now also compile.  The Theorem 4.4.6 bridge from a uniform
  `L^p` martingale bound to the 4.2.11 almost-sure limit and limit-process
  `MemLp` now also compiles, and the final `L^p` convergence endpoint compiles
  when a single `MemLp` dominating variable is supplied.  The finite
  running-maximum assembly now also compiles from Theorem 4.4.4 bounds and a
  supplied a.s. running-maximum limit.  The canonical running supremum,
  measurability, convergence from a.s. boundedness, and final running-`S`
  assembly now also compile.  The a.s. boundedness bridge from uniform
  finite-maximal `eLpNorm` bounds and the final Theorem 4.4.6 `L^p` convergence
  endpoint now compile.  The Theorem 4.4.7 orthogonality and
  increment-increment wrappers now compile.  The Theorem 4.4.8 conditional
  variance formula now also compiles.  The Example 4.4.9 conditional,
  integrated second-moment recurrence, finite-sum display, shifted
  geometric-sum, uniform second-moment bound, `eLpNorm 2` handoff, `L^2`
  convergence endpoint, expectation handoff, `E X = 1`, and nonzero-limit
  endpoint now also compile.  Exercise 4.4.5's conditional-variance variant now
  also compiles.  Theorem 4.4.1 optional-stopping wrappers, Exercise 4.4.6's
  stopped-variance small-ball handoff, the finite first-exit/small-ball
  assembly, the bounded-increment overshoot/source wrapper, and the
  square-martingale wrapper with automatic stopped integrability, plus the
  deterministic variance-clock and exact-denominator wrappers, now also
  compile.
  Theorem 4.1.16 remains deferred unless a direct kernel API appears.

Support-only dependencies:

- Use Section 3.3 inversion or uniqueness support only when it directly blocks
  the active Chapter 4.1 theorem or a later theorem with a real dependency.
- Treat Section 3.4 Lindeberg-Feller analytic estimates, including the direct
  square-integrable source wrapper and variance-tail split machinery, as closed
  support to consume rather than re-prove.

Chapter 3 source inventory:

- Section 3.2 weak convergence of random variables.
- Theorem 3.2.9, bounded-continuous test functions.
- Theorem 3.2.10, continuous mapping theorem.
- Theorem 3.2.11, Portmanteau alternatives.
- Lemma 3.1.1, scalar exponential limit.
- Theorem 3.1.2, de Moivre-Laplace local limit.
- Section 3.3 characteristic functions and inversion formula.
- Section 3.4 central limit theorems.
- Section 3.10 limit theorems in `R^d`.
- Active frontier: Durrett Chapter 2.5, Theorem 2.5.13 Feller dichotomy
  final packaging.

Source anchors:

- `Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`
  contains Section 3.2 near line 41, Theorem 3.2.9 near line 158, Theorem
  3.2.10 near line 188, Theorem 3.2.11 near line 197, Section 3.3 near line
  411, Theorem 3.3.17 near line 748, Theorem 3.3.20 near line 898, Section
  3.4 near line 1228, Theorem 3.4.1 near line 1234, and Section 3.10 near line
  3643.
- The same Markdown chunk contains Chapter 4.1 conditional expectation:
  Lemma 4.1.1 near line 3894, Theorem 4.1.2 near line 3920, Example 4.1.4
  near line 3969, Example 4.1.5 near line 3982, Theorem 4.1.9 near line 4081,
  Theorem 4.1.13 near line 4183, and Theorem 4.1.14 near line 4196.
- The same Markdown chunk contains Chapter 4.2 martingales near line 4348,
  Example 4.2.1 linear martingales near line 4358, and Example 4.2.2 quadratic
  martingales near line 4378, followed by Example 4.2.3 exponential
  martingales.

Initial Lean reuse anchors:

- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`
- `StatInference/AsymptoticStatistics/MomentEstimators.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/CharacteristicFunction/TaylorExpansion.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/LevyConvergence.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/CharacteristicFunction.lean`
- `.lake/packages/mathlib/Mathlib/Probability/CentralLimitTheorem.lean`

### Lane E: martingales, Markov chains, Brownian motion

These later chapters should be prepared by read-only search first.  They are
valuable, but should not block the active Chapter 4.1 conditional-expectation
lane unless a remote agent has already landed directly reusable support.

Likely anchors:

- Chapter 4: conditional expectation, martingale convergence, optional
  stopping.
- Chapter 5: Markov chain construction, Markov property, recurrence,
  stationary distributions.
- Chapter 7/8: Brownian motion and Donsker theorem.

## Initial Reuse Audit

High-value local files:

- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`
- `StatInference/EmpiricalProcess/WeakConvergence.lean`

High-value mathlib search roots:

- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/PiSystem.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/MeasurableSpace/Pi.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Measure/Prod.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Basic.lean`
- `.lake/packages/mathlib/Mathlib/Probability/Independence/Integration.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLaw.lean`
- `.lake/packages/mathlib/Mathlib/Probability/HasLawExists.lean`
- `.lake/packages/mathlib/Mathlib/Probability/IdentDistrib.lean`
- `.lake/packages/mathlib/Mathlib/Probability/BorelCantelli.lean`
- `.lake/packages/mathlib/Mathlib/Probability/StrongLaw.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInMeasure.lean`
- `.lake/packages/mathlib/Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean`

## Report Gate

No Durrett theorem report should be produced until an exact source statement is
fully proved in Lean, the corresponding source anchor is cross-checked against
the PDF/Markdown, screenshots or source excerpts are captured under the report
policy, and the local report artifact compiles.
