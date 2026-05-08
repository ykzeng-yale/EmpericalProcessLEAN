# Durrett 2019 Current Blocker And Primitive Plan

This file is the active blocker register for the Durrett probability-theory
lane.  It should be checked at the start of each in-thread goal cycle before
choosing a proof target.

## Live In-Thread Goal Prompt V96

Use this prompt as the live Durrett `/goal` whenever the app-level goal text is
older than the verified route docs:

Continue Durrett 2019 Probability Theory formalization in Lean from latest
synced `main`.  Active lane only: Durrett Chapter 4.3 martingale applications in
`StatInference/ProbabilityTheory/Martingale.lean`.  Treat compiled Chapter 2,
Chapter 3, Chapter 4.1 through Theorem 4.1.15, Examples 4.2.1-4.2.3, and
Theorems 4.2.4-4.2.12 as closed dependencies, including the exact
positive-part-boundedness source bridge for Theorem 4.2.11 and the Fatou
expectation inequality `E X ≤ E X_0` for Theorem 4.2.12.  Theorem 4.1.16
remains deferred unless a future targeted kernel search finds a direct
source-shaped API.

Current compiled Chapter 4.2 support: Durrett-facing martingale,
submartingale, and supermartingale wrappers; Examples 4.2.1-4.2.3, including
quadratic, product, and normalized exponential martingales; Theorems
4.2.4/4.2.5 conditional-expectation wrappers; Theorem 4.2.6 convex-image and
`|X_n|^p` consequences; and Theorem 4.2.7 increasing-convex, positive-part,
and minimum-truncation consequences; and Theorem 4.2.8 predictable-transform
wrappers for submartingales, supermartingales, and nonnegative martingale
transforms; and Theorem 4.2.9 stopped-process wrappers for submartingales,
supermartingales, and martingales; and Theorem 4.2.10 upcrossing inequality
wrappers, including the textbook initial-positive-part subtraction display;
and Theorem 4.2.11 direct L1/eLpNorm convergence wrappers:
almost-sure existence, convergence to `ℱ.limitProcess`, L1 membership,
integrability of the limit, martingale specializations, and source-facing
positive-part-boundedness wrappers matching Durrett's `sup_n E X_n^+ < ∞`
hypothesis through a compiled `eLpNorm` bridge; and Theorem 4.2.12
nonnegative-supermartingale convergence, integrable-limit, Fatou expectation
bridge, and final existential source wrapper.  The first Theorem 4.3.1 support
packet now compiles: a shifted nonnegative stopped martingale converges almost
surely, and that stopped convergence transfers back to the original martingale
on the survival event `{N = ⊤}`.  The first-below instantiation also now
compiles: `N = inf {n : X_n ≤ -K}` is packaged as a stopping time, bounded
increments prove `0 ≤ X_{n ∧ N} + K + M`, and this feeds the stopped-shifted
bridge to get convergence on `{N = ⊤}`.  The bounded-below path bridge now
compiles by intersecting the first-below survival statements over countably
many natural thresholds.  The symmetric bounded-above bridge also now compiles
by applying the bounded-below bridge to the negated martingale, and the
one-sided-bounded union bridge is packaged.  The range-form event
classification now compiles: almost surely, either the martingale converges to
a finite real limit or its range is unbounded both below and above.  The
threshold-form oscillation wrapper also now compiles: on the nonconvergent
side, the path visits below and above every real threshold.  The exact
extended-real display for Theorem 4.3.1 also now compiles: almost surely, the
martingale either converges to a finite real limit or has `EReal` `liminf = ⊥`
and `EReal` `limsup = ⊤`, matching Durrett's `-∞/+∞` statement.  The
existence and formula part of Theorem 4.3.2 also now compiles by reusing
mathlib's `Mathlib.Probability.Martingale.Centering` API:
`X = martingalePart X + predictablePart X`, the martingale part is a
martingale, and the predictable part is predictable, increasing, starts at
zero, and has Durrett's finite-sum formula.
The uniqueness side of Theorem 4.3.2 also now compiles: any martingale plus
predictable zero-start decomposition of a process agrees with the canonical
`martingalePart`/`predictablePart` pair almost surely at each fixed time, and
two such decompositions of the same process agree almost surely at each fixed
time.
Example 4.3.3 and Theorem 4.3.4 also now compile via mathlib's generalized
Borel-Cantelli API: the counting-process martingale part is a martingale, the
martingale and predictable finite-sum formulas are packaged, the one-step
counting-process difference bound is exposed, and the conditional
Borel-Cantelli limsup/divergent-conditional-sum equivalence is source-facing.
The first Theorem 4.3.5 / Lemma 4.3.6 Radon-Nikodym packet also now compiles:
trimmed RN derivatives integrate over `ℱ n`-events to the original measure,
equal restricted set integrals imply the martingale property, the
likelihood-ratio process `d μ_n / d ν_n` is a martingale under the restricted
absolute-continuity hypotheses, and its nonnegative convergence follows from
Theorem 4.2.12.  The regular/singular decomposition layer of Theorem 4.3.5
also now compiles: the measure identity
`mu = nu.withDensity (mu.rnDeriv nu) + mu.singularPart nu`, the real-integral
identity with `(mu.rnDeriv nu).toReal`, and the source-shaped endpoint from a
supplied a.e. density identification plus a supplied singular-part restriction
are packaged.  The density-ratio/top-set source assembly also now compiles:
RN derivatives through any dominating measure `rho`, the special `mu + nu`
ratio, the source-shaped `Y/Z` ratio from a.e. identifications of `Y` and `Z`,
the singular-set endpoint, the `{X = infinity}` endpoint, and the final
source assembly from `Y = dmu/drho`, `Z = dnu/drho`, `X = Y/Z`, and top-set
separation.  The integral-representation identification layer also now
compiles: if a candidate `Y` represents `mu` by set integrals against `rho`,
then `Y = dmu/drho` a.e.; paired `Y`/`Z` integral representations transfer
these identities to `nu`-a.e.; and those representations feed the existing
ratio/top-set source assembly.  The generator-extension layer also now
compiles: finite-measure equality on a generating pi-system plus `univ`
extends to a `withDensity` identity, then to all measurable set-integral
identities, RN-derivative identification, paired `Y`/`Z` handoff, and the
ratio/top-set source endpoint.  The bounded-convergence generator-production
layer also now compiles: a uniformly bounded nonnegative density sequence with
an a.e. limit sends eventual restricted-density set-integral identities to
generator/univ identities, and the source endpoint consumes those identities
directly for `Y` and `Z`.  The trimmed-RN source sequence layer also now
compiles: if `s` is visible in some `ℱ m`, then all later trimmed RN
derivatives integrate over `s` to the original measure, and the source endpoint
is specialized to the actual trimmed RN derivative sequences.  The natural
dominating-measure boundedness layer also now compiles: for `rho = mu + nu`,
both trimmed RN derivative sequences are bounded by `1`, and the final source
endpoint is specialized to this bound automatically.  The real-convergence
handoff layer also now compiles: a one-bounded finite `ENNReal` sequence whose
`toReal` values converge to a finite target converges in `ENNReal`, and the
`mu + nu` source endpoint now accepts real-valued convergence hypotheses for
the two trimmed RN derivative sequences.  The bounded real-martingale layer
also now compiles: a real martingale with entries norm-bounded by `1` has the
L1/eLpNorm bound required by Theorem 4.2.11, and both natural
`mu + nu` trimmed RN `toReal` sequences converge to their filtration limit
processes.  The canonical limit-density endpoint also now compiles: those real
limit processes are packaged as finite nonnegative `ENNReal` density
candidates, shown a.e. measurable and finite, and fed to the existing
`mu + nu` `toReal` source endpoint.  The canonical-ratio endpoint also now
compiles: choosing `X` as the ratio of the two canonical limit densities
discharges the `X = Y / Z` source obligation automatically.  The denominator
and singular-support top-set layers also now compile: common-density
representations prove `nu {Y/Z = infinity} = 0`, absolute continuity of
`mu.restrict {Y/Z = infinity}^c` with respect to `nu`, and hence
`mu.singularPart nu {Y/Z = infinity}^c = 0`; the generator-level and canonical
`mu + nu` endpoints now discharge both top-set obligations automatically.  The
full canonical-ratio real identity for Theorem 4.3.5 now compiles.  The first
Example 4.3.7 finite-partition packet also now compiles: the elementary
partition likelihood approximation is defined, proved measurable, proved equal
to the cell ratio on each disjoint cell, and shown to integrate over each cell
to the numerator cell mass under the textbook finite-cell absolute-continuity
condition; its finite-union and generator-facing endpoint now also compile,
so finite unions of cells have the correct set integral and a pi-system
generator made of such finite unions yields
`mu = nu.withDensity finitePartitionLikelihood`.  The first Theorem 4.3.8
Kakutani finite-product packet also now compiles: the finite-coordinate
likelihood is defined as the product of one-coordinate densities, proved
measurable, proved to have the correct set integral on measurable rectangles
under `Measure.pi`, and packaged as a finite product-law `withDensity`
identity.  The infinite-product cylinder/restriction handoff for Theorem 4.3.8
also now compiles: the finite product likelihood pulled back to an infinite
product space is measurable, finite-coordinate restrictions of
`Measure.infinitePi` have the finite product likelihood as a `withDensity`
ratio, and the pulled-back likelihood integrates over measurable cylinders to
the numerator infinite-product measure of the cylinder.  The Hellinger
factorization layer also now compiles: the square-root power of the finite
product likelihood is the product of the one-coordinate square-root powers, the
finite-coordinate Hellinger integral factors under `Measure.pi`, and the same
factorization is pulled back to finite-coordinate cylinders under
`Measure.infinitePi`.  The zero-product Fatou layer also now compiles: if the
finite likelihoods converge a.e. and their Hellinger integrals tend to zero,
then the limiting likelihood is zero a.e.; the source-facing cylinder
likelihood handoff consumes finite Hellinger products directly.  The
zero-product singularity bridge also now compiles: a Theorem 4.3.5 source
real-identity plus `X = 0` denominator-a.e. gives mutual singularity, with
top-set and Hellinger/cylinder-product handoffs.  The positive-product
absolute-continuity bridge also now compiles: a source real-identity with no
numerator mass on the infinite-density top set gives `mu << nu`, and paired
source real-identities give absolute continuity in both directions.  The first
final branch assemblers also now compile: zero Hellinger-products plus the
top-set identity give mutual singularity, and paired top-set identities with no
top-set numerator mass give absolute continuity in both directions.  The
positive-branch eliminator now also compiles: mutual singularity forces the
limiting likelihood to vanish a.e.; hence a source dichotomy plus a nonzero
likelihood input, or a null zero-set input, collapses to `mu << nu`.  The
positive mass consumers also now compile: nonzero `lintegral` of the limiting
likelihood, or the mass-one input `lintegral X = 1`, feeds the same
absolute-continuity conclusion.  The finite cylinder-likelihood mass handoff
also now compiles: every pulled-back finite likelihood integrates to one, and
convergence of these integrals to the limiting likelihood mass gives the
mass-one input consumed by the positive branch.  The positive-product L1
handoff now also compiles: real-valued L1 convergence of finite cylinder
likelihoods to the limiting likelihood gives the finite-cylinder integral
convergence input, and hence collapses the source dichotomy to the
absolute-continuity branch.  The positive-product Cauchy support now also
compiles: pairwise L1 tail `liminf` control plus pointwise convergence of the
cylinder likelihoods to the limiting likelihood gives the L1 convergence input
and hence the same absolute-continuity conclusion.  The Hellinger-tail bound
consumer layer also now compiles: the textbook bound
`sqrt (8 * (1 - tail n))` tends to zero when the tail Hellinger affinities tend
to one, eventual L1 bounds by this expression imply the compiled
pairwise-`liminf` hypothesis, and the final cylinder positive branch consumes
this Hellinger-tail bound directly.  The scalar finite square-root
Pythagorean identity, concrete cylinder `diffSq + 2 * overlap <= 2`
estimate, and lower-bound-only overlap Cauchy handoff now also compile.  The
finite-coordinate product integral, exact nested square-root overlap
factorization, and finite Hellinger tail-product to concrete overlap lower
bound handoff now also compile.  The HasProd/Multipliable prefix-tail
instantiation now also compiles, including the standard `Finset.range n`
exhaustion handoff that feeds the finite tail-product Cauchy consumer.  The
finite tail-product lower bound from positive prefix/tail monotonicity now
also compiles, including the final standard `Finset.range n` positive-product
pairwise-liminf consumer from `HasProd`, `P ≠ 0`, `P ≠ ∞`, and
one-coordinate Hellinger affinities bounded by one.  The source-density
one-coordinate Hellinger affinity bound `≤ 1` now also compiles, along with
the normalized positive-product tail bound `tail n ≤ 1` and a standard
positive-product range pairwise-liminf consumer that derives both facts
directly from `μ i = (ν i).withDensity (q i)`.  The standard
`Finset.range n` positive-product absolute-continuity handoff now also
compiles from the source-density `HasProd` hypotheses, finite-cylinder
convergence data, and the supplied dichotomy/top-set inputs.  The a.e.-finite
no-top source bridge now also compiles, including a standard
`Finset.range n` source-density `HasProd` absolute-continuity handoff that
takes `X ≠ ∞` a.e. instead of a prepackaged top-set-null hypothesis.
Kolmogorov tail-event zero-one support for independent sigma-fields now also
compiles, including zero-set-not-full to zero-set-null and the corresponding
positive-branch dichotomy eliminator.
The lower-integral source bridge now also compiles: a tail zero set plus
`∫⁻ X ≠ 0` automatically gives zero-set-not-full, zero-set-null, not-a.e.-zero,
and the positive-branch dichotomy conclusion.  The every-tail-block
measurability bridge now also compiles: if an event, and in particular the
limiting-likelihood zero set, is measurable from every tail block
`⨆ i ≥ n, s i`, then it is measurable in the `limsup` tail sigma-field; this
feeds the lower-integral zero-set-null and absolute-continuity consumers.
The tail-coordinate support layer now also compiles: coordinate sigma-fields
and tail-coordinate sigma-fields on sequence space are packaged, every
tail-coordinate map is measurable from its tail sigma-field, finite cylinder
likelihoods using only coordinates from `n` onward have tail-coordinate
measurability, their zero sets are tail-coordinate measurable, and a
zero-set equality with tail-coordinate measurable candidates gives
every-tail-coordinate measurability for a limiting likelihood.  The
finite-prefix zero-set algebra layer now also compiles: if
`X = C * Y` pointwise and the finite-prefix factor `C` is nonzero, then
`{X = 0} = {Y = 0}`; finite cylinder likelihoods are nonzero under the
source coordinate-density nonzero hypotheses; and the prefix-cylinder
factorization handoff turns a tail-coordinate measurable `Y` into
every-tail-coordinate measurability of `{X = 0}`.  The prefix/tail finite-block
limit layer now also compiles: `range m` cylinder likelihoods factor into
`range n` prefixes times `Ico n m` tail blocks; finite tail-block likelihoods
and their pointwise limits are tail-coordinate measurable; convergence of full
prefixes and tail blocks gives the limiting prefix/tail factorization under
the finite-prefix no-top side condition; and the resulting tail-block-limit
zero-set handoff feeds the compiled every-tail-coordinate measurability
consumer.  The side-condition source layer now also compiles: pointwise finite
coordinate densities give finite prefix likelihoods, and pointwise finite plus
nonzero coordinate densities feed the tail-block zero-set handoff directly.

Next theorem-sized packet: treat the Example 4.3.7 finite partition generator
layer, the Theorem 4.3.8 finite-product likelihood/`withDensity` layer, and the
infinite-product cylinder/restriction and Hellinger factorization handoffs as
closed support, and treat the zero-product Fatou endpoint, singularity bridge,
positive-product absolute-continuity bridge, and final branch assemblers as
compiled support, together with the positive-branch eliminator.
Also treat the lintegral-nonzero and mass-one positive-branch consumers as
compiled support, along with the finite-cylinder mass-one and
integral-convergence handoffs, the positive-product L1-to-integral handoff,
the pairwise-liminf Cauchy-to-L1 handoff, the Hellinger-tail-bound consumer
into the positive branch, the square-root/Cauchy-Schwarz Hellinger L1 bridge
into that consumer, and the normalized positive-prefix product-tail convergence
bridge.  Also treat the concrete pointwise and cylinder likelihood square-root
factorization layer, together with the concrete cylinder Cauchy handoff using
the textbook factors `sqrt X_n + sqrt X_m` and `sqrt X_n - sqrt X_m`, as
compiled support.  Also treat the square-integral estimate for
`sqrt X_n + sqrt X_m`, and the resulting concrete Cauchy wrapper that only
requires the `sqrt X_n - sqrt X_m` square estimate, as compiled support.
Also treat the scalar/cylinder Pythagorean overlap layer proving
`diffSq + 2 * overlap <= 2`, the overlap-to-tail algebra bridge converting
that inequality and `tail <= overlap` into `diffSq <= 2 * (1 - tail)`,
together with the concrete cylinder overlap handoff and lower-bound-only
cylinder Cauchy handoff, as compiled support.  Also treat the
finite-coordinate product integral, exact nested square-root overlap
factorization, and finite Hellinger tail-product overlap handoff as compiled
support.  Also treat the HasProd/Multipliable prefix-tail bridge and the
standard `Finset.range n` HasProd-to-pairwise-liminf handoff as compiled
support.  Also treat the finite tail-product lower bound from positive
prefix/tail monotonicity and the standard positive-product range consumer as
compiled support.  Also treat the source-density one-coordinate Hellinger
affinity bound, the normalized positive-product tail `≤ 1` bridge, and the
standard source-density positive-product range consumer as compiled support.
Also treat the standard `Finset.range n` source-density `HasProd`
positive-product absolute-continuity handoff as compiled support.
Also treat the a.e.-finite no-top source bridge and its standard
`Finset.range n` source-density `HasProd` absolute-continuity consumer as
compiled support.
Also treat the Kolmogorov tail-event zero-one support, the zero-set-not-full
to zero-set-null bridge, and the corresponding positive-branch dichotomy
eliminator as compiled support.
Also treat the lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0`
to zero-set-not-full, zero-set-null, not-a.e.-zero, and absolute continuity as
compiled support.
Also treat the every-tail-block measurability bridge into `limsup` tail
measurability, plus its zero-set-null and absolute-continuity consumers, as
compiled support.
Also treat the tail-coordinate sigma-field layer, finite tail cylinder
likelihood measurability, finite tail cylinder zero-set measurability, and the
zero-set-equality handoff to every-tail-coordinate measurability as compiled
support.
Also treat the finite-prefix zero-set algebra layer, finite cylinder
likelihood nonzero bridge, and prefix-cylinder factorization handoff to
every-tail-coordinate measurability as compiled support.
Also treat the finite prefix/tail cylinder-likelihood factorization, finite
tail-block likelihood measurability, pointwise tail-block-limit measurability,
limiting prefix/tail factorization, and tail-block-limit zero-set handoff as
compiled support.
Also treat the pointwise coordinate finite/nonzero side-condition bridge into
the tail-block zero-set handoff as compiled support.
Also treat the range-limit tail handoff as compiled support: pointwise
convergence of the standard full-prefix likelihoods, together with pointwise
finite and nonzero coordinate densities, supplies the canonical tail-block
limit candidate `X / prefix_n` and hence the tail-coordinate zero-set
measurability handoff.
Also treat the range-limit positive-branch consumers as compiled support:
under the denominator infinite product law, coordinate sigma-fields are
independent; ENNReal full-prefix convergence to an a.e. finite limit supplies
the real-valued convergence input for the L1/Cauchy branch; pointwise finite
coordinate densities discharge the pairwise no-top side condition; and
pointwise full-prefix convergence plus finite/nonzero coordinate densities and
`∫⁻ X ≠ 0` feed the tail-zero-set positive-branch eliminator.
Also treat the canonical-ratio handoff into the range-limit positive branch as
compiled support: the canonical `mu + nu` ratio now supplies
`toReal = dmu/dnu` and the denominator top-set null input automatically for
both the Hellinger-product/L1 consumer and the lower-integral/nonzero consumer.
Move to the remaining Kakutani criterion assembly:
search local/mathlib APIs for infinite products (`tprod`, `HasProd`,
`Multipliable`) and logarithm/tail-measurability support.  Add only
source-shaped wrappers that prove the standard full-prefix likelihood
convergence to the canonical `mu + nu` ratio, discharge the real-integrability
or nonzero-lower-integral input for that canonical ratio, or directly feed the
infinite-product
criterion hypotheses consumed by the compiled branch assemblers and
eliminator.  Do
not redo the already compiled RN martingale/convergence
bridge, regular/singular decomposition identity, density-ratio bridge, top-set
endpoint assembly, integral-representation to RN-derivative bridge,
generator-extension bridge, bounded-convergence generator-production bridge,
trimmed-RN eventual restricted-density bridge, `mu + nu` boundedness bridge,
real-to-`ENNReal` convergence-transfer bridge, bounded real-martingale
limitProcess convergence bridge, canonical limit-density endpoint, canonical
ratio endpoint, denominator-side top-set null endpoint, singular-support
top-set endpoint, full canonical-ratio real identity, canonical
`toReal = dmu/dnu` endpoint, canonical 4.3.8 positive-branch consumers, any Example 4.3.7
finite-partition likelihood, finite-union, or generator endpoint, the
finite-product likelihood/rectangle/`withDensity` layer, infinite-product
cylinder/restriction handoff, Hellinger factorization layer, zero-product Fatou
endpoint, zero-product singularity bridge, positive-product
absolute-continuity bridge, final branch assembler, or positive-branch
eliminator, lintegral-nonzero consumer, mass-one consumer, or finite-cylinder
mass handoff, or positive-product L1-to-integral handoff for Theorem 4.3.8.
Do not redo the pairwise-liminf Cauchy-to-L1 handoff.
Do not redo the Hellinger-tail-bound consumer layer.
Do not redo the square-root/Cauchy-Schwarz Hellinger L1 bridge.
Do not redo the normalized positive-prefix product-tail convergence bridge.
Do not redo the concrete pointwise or cylinder square-root factorization layer,
or the concrete cylinder Cauchy handoff.
Do not redo the `sqrt X_n + sqrt X_m` square-integral estimate.
Do not redo the overlap-to-tail `2 * (1 - tail)` algebra bridge.
Do not redo the concrete Pythagorean overlap inequality or lower-bound-only
overlap Cauchy handoff.
Do not redo the finite-coordinate product integral, exact nested overlap
factorization, or finite Hellinger tail-product overlap handoff.
Do not redo the HasProd/Multipliable prefix-tail bridge or the standard
`Finset.range n` HasProd-to-pairwise-liminf handoff.
Do not redo the every-tail-block measurability bridge into the `limsup` tail
sigma-field.
Do not redo the tail-coordinate sigma-field layer or finite tail cylinder
likelihood measurability layer.
Do not redo the finite-prefix zero-set algebra or prefix-cylinder zero-set
handoff layer.
Do not redo the finite prefix/tail cylinder-likelihood factorization,
tail-block-limit measurability, or tail-block-limit zero-set handoff layer.
Do not redo the pointwise finite/nonzero coordinate side-condition bridge.
Do not redo the range-limit tail handoff or the range-limit positive-branch
consumer wrappers.
Do not redo the finite tail-product lower bound from positive prefix/tail
monotonicity or the standard positive-product range consumer.
Do not redo the source-density one-coordinate Hellinger affinity `≤ 1` bound,
the normalized positive-product tail `≤ 1` bridge, or the standard
source-density positive-product range consumer.
Do not redo the standard `Finset.range n` source-density `HasProd`
positive-product absolute-continuity handoff.
Do not redo the a.e.-finite no-top bridge or the standard source-density
`HasProd` absolute-continuity consumer that uses it.
Do not redo the Kolmogorov tail-event zero-one support or the zero-set-not-full
positive-branch eliminator.
Do not redo the lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0`
to the positive-branch conclusion.
Defer Polya urn as a
model-specific construction unless a direct existing primitive is found.

Loop: fetch/rebase, read only the needed Durrett/source/API anchors, implement
one theorem-sized wrapper or bridge, run focused Lean, targeted build, diff
check, proof-hole scan, secret scan, and root build only when imports changed;
update route docs only if the frontier changes; commit and push.  Do not
route back to Chapter 2, Chapter 3, or solved Chapter 4.1 starter wrappers
unless the current theorem exposes a real dependency.  No automations or
subagents unless the user asks in the current turn.  Use a worktree only for
dirty, long, or disjoint local work.  Chat with the user bilingually; keep all
files, code, comments, docs, and commit messages in English.

## Minimal Operating Contract

- Treat other agents' commits as reusable context: fetch once at the start and
  once before push, then rebase or fast-forward if needed.
- Use the local Durrett Markdown/PDF anchors only for the theorem currently
  being packaged.
- Prefer a compiled theorem-sized bridge or wrapper over broad exploration.
- Use an isolated worktree only for dirty checkouts, long builds, or explicitly
  authorized disjoint lanes.
- Do not create recurring automations or spawn subagents unless the user asks
  for them in the current turn.

## Current Blocker

The Durrett source assets are present locally, and the Durrett-specific Lean
namespace now has a compiled starter module:

- `StatInference/ProbabilityTheory/Basic.lean`
- root import from `StatInference.lean`
- `durrett2019_theorem_2_3_1_borelCantelli_first`
- `durrett2019_theorem_2_3_1_eventually_notMem`
- `durrett2019_theorem_2_3_7_borelCantelli_second`
- `durrett2019_theorem_2_4_1_strongLaw_ae_real`
- `durrett2019_theorem_2_4_1_centeredStrongLaw_ae_real`
- `durrett2019_piSystem_probability_ext`
- `durrett2019_theorem_1_1_1_monotonicity`
- `durrett2019_theorem_1_1_1_subadditivity`
- `durrett2019_theorem_1_1_1_continuity_from_below`
- `durrett2019_theorem_1_1_1_tendsto_measure_from_below`
- `durrett2019_theorem_1_1_1_continuity_from_above`
- `durrett2019_theorem_1_1_1_tendsto_measure_from_above`
- `durrett2019_theorem_1_3_1_measurable_of_generator_preimages`
- `durrett2019_theorem_1_3_4_measurable_comp`
- `durrett2019_theorem_2_1_7_iIndep_generatedSigma_of_iIndepSets`
- `durrett2019_theorem_2_1_7_indep_generatedSigma_of_indepSets`
- `durrett2019_theorem_2_1_8_iIndepFun_of_generator_rectangles`
- `durrett2019_theorem_2_1_8_iIndepFun_real_of_Iic_rectangles`
- `durrett2019_theorem_2_1_9_indep_iSup_of_disjoint`
- `durrett2019_theorem_2_1_10_iIndepFun_comp`
- `durrett2019_theorem_2_1_10_indepFun_finset_blocks`
- `durrett2019_theorem_2_1_10_indepFun_finset_block_functions`
- `durrett2019_theorem_2_1_10_indepFun_comp`
- `durrett2019_theorem_2_1_10_product_coordinate_functions_independent`
- `durrett2019_theorem_2_1_11_indepFun_hasLaw_prod`
- `durrett2019_theorem_2_1_11_iIndepFun_hasLaw_pi`
- `durrett2019_theorem_2_1_11_iid_hasLaw_pi`
- `durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi`
- `durrett2019_theorem_2_1_11_iid_iff_hasLaw_pi`
- `durrett2019_theorem_2_1_11_canonical_iid_product_coordinates`
- `durrett2019_theorem_2_1_12_product_integral`
- `durrett2019_theorem_2_1_12_product_integral_mul`
- `durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral`
- `durrett2019_theorem_2_1_13_iIndepFun_integral_prod_eq_prod_integral`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_supplied_endpoint_grids`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists`
- `durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement`
- `durrett2019_theorem_2_4_9_cutpointChain_append`
- `durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval`
- `durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix`
- `durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover`
- `durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover`
- `durrett2019_theorem_2_4_9_punctured_small_open_interval`
- `durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover`
- `durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover`
- `durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms`
- `durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms`
- `durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms`
- `durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover`
- `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms`
- `empiricalDistributionFunction`
- `empiricalDistributionFunction_eq_sum_div`
- `empiricalDistributionFunction_samplePath_eq_range_sum`
- `populationRisk_realHalfLineIndicator_eq_cdf`
- `RealEmpiricalCDFGlivenkoCantelliClass`
- `realEmpiricalCDFGlivenkoCantelliClass_of_realHalfLine`
- `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`
- `durrett2019_theorem_3_2_9_tendstoInDistribution_iff_forall_boundedContinuous_integral`
- `durrett2019_theorem_3_2_10_continuous_mapping`
- `durrett2019_theorem_3_2_10_continuous_mapping_common_probability_space`
- `durrett2019_theorem_3_2_11_portmanteau_open_of_tendstoInDistribution`
- `durrett2019_theorem_3_2_11_portmanteau_closed_of_tendstoInDistribution`
- `durrett2019_theorem_3_2_11_portmanteau_continuity_set_of_tendstoInDistribution`
- `durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_closed_limsup_le`
- `durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_open_le_liminf`
- `durrett2019_characteristicFunction`
- `durrett2019_theorem_3_3_1_characteristicFunction_zero`
- `durrett2019_theorem_3_3_1_characteristicFunction_neg`
- `durrett2019_theorem_3_3_1_characteristicFunction_norm_le_one`
- `durrett2019_theorem_3_3_1_characteristicFunction_continuous`
- `durrett2019_theorem_3_3_1_characteristicFunction_affine_map`
- `durrett2019_theorem_3_3_2_characteristicFunction_independent_sum`
- `durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_weakConvergence`
- `durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_17_weakConvergence_iff_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_17_tight_of_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_17_tight_and_weakConvergence_of_characteristicFunction_limit`
- `durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_tendstoInDistribution`
- `durrett2019_theorem_3_3_17_tendstoInDistribution_of_characteristicFunction_tendsto`
- `durrett2019_theorem_3_3_20_characteristicFunction_secondOrder_centered_unitVariance`
- `durrett2019_theorem_3_4_1_centralLimitTheorem_centered_unitVariance`
- `durrett2019_theorem_3_4_1_centralLimitTheorem_varianceGaussian`
- `durrett2019_lindebergFellerRowSum`
- `durrett2019_lindebergFellerRowIndependent`
- `durrett2019_lindebergFellerMeanZero`
- `durrett2019_lindebergFellerVarianceRowSum`
- `durrett2019_lindebergFellerVarianceSumConvergence`
- `durrett2019_lindebergFellerTailSecondMomentRowSum`
- `durrett2019_lindebergFellerCondition`
- `durrett2019_lindebergFellerVarianceSplitByTailRowSum`
- `durrett2019_lindebergFeller_oneFactorVariance_le_cutoff_sq_add_tailSecondMoment`
- `durrett2019_lindebergFellerVarianceSplitByTailRowSum_of_integrableSq`
- `durrett2019_lindebergFellerCharacteristicProduct`
- `durrett2019_lindebergFellerRowGaussianExpTarget`
- `durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto`
- `durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero`
- `durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded`
- `durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem`
- `durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive_of_maxAbsTendstoZero`
- `durrett2019_real_abs_log_one_add_sub_self_le`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs_of_maxAbsTendstoZero`
- `durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero_of_relativeToAbs_and_absRowSumBounded`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp_of_logRemainder`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_of_logRemainder`
- `durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate`
- `durrett2019_lindebergFellerQuadraticVarianceCoefficient`
- `durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_rowSum_tendsto`
- `durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_absRowSumBounded_of_varianceSum`
- `durrett2019_lindebergFellerQuadraticVarianceFactor`
- `durrett2019_lindebergFellerQuadraticVarianceFactor_eq_one_add_coefficient`
- `durrett2019_lindebergFellerQuadraticVarianceProduct`
- `durrett2019_lindebergFellerQuadraticVarianceProduct_eq_exercise311Product`
- `durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall_and_exercise311`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit_and_exercise311`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit`
- `durrett2019_theorem_3_4_10_quadraticVarianceProduct_tendsto_exp_of_exercise311`
- `durrett2019_norm_prod_sub_prod_le_sum_norm_sub`
- `durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder`
- `durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_cubic_of_abs_le_two`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_quadratic_of_two_le_abs`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_scalar`
- `durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le`
- `durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound_of_scalar`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_pointwiseTaylorRemainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_integrableSq`
- `durrett2019_lindebergFeller_min_taylor_remainder_le_split`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_remainderBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_oneFactorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_taylorBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_expansionBound`
- `durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_remainderBound`
- `durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne`
- `durrett2019_lindebergFellerVarianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_varianceRowsEventuallySmall_of_lindeberg_and_varianceSplitByTailRowSum`
- `durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_maxAbsTendstoZero_of_varianceRowsEventuallySmall`
- `durrett2019_lindebergFellerQuadraticVarianceScaledEventuallyLeTwo`
- `durrett2019_theorem_3_4_10_scaledVarianceEventuallyLeTwo_of_varianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_scaledVarianceEventuallyLeTwo`
- `durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_varianceRowsEventuallySmall`
- `durrett2019_theorem_3_4_10_characteristicProductApproximationToQuadraticVarianceProduct_of_errorRowSum`
- `durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp`
- `durrett2019_lindebergFellerProductApproximationToRowGaussianExp`
- `durrett2019_lindebergFellerGaussianProductConvergence`
- `durrett2019_lindebergFellerGaussianProductConvergenceExp`
- `Durrett2019LindebergFellerAnalyticCertificate`
- `durrett2019_theorem_3_4_10_gaussian_characteristicFunction_eq_exp`
- `durrett2019_theorem_3_4_10_gaussianProductConvergence_of_exp_tendsto`
- `Durrett2019LindebergFellerAnalyticCertificate.gaussianProductConvergence`
- `durrett2019_theorem_3_4_10_rowGaussianExpTarget_tendsto_of_varianceSum`
- `durrett2019_theorem_3_4_10_product_tendsto_exp_of_varianceSum_and_rowGaussianApprox`
- `durrett2019_theorem_3_4_10_productApproximationToRowGaussianExp_of_quadraticVarianceProductApproximations`
- `durrett2019_theorem_3_4_10_quadraticVarianceProductApproximationToRowGaussianExp_of_varianceSum_and_exercise311`
- `Durrett2019LindebergFellerAnalyticCertificate.of_productApproximationToRowGaussianExp`
- `Durrett2019LindebergFellerAnalyticCertificate.of_quadraticVarianceProductApproximations`
- `Durrett2019LindebergFellerAnalyticCertificate.of_characteristicQuadraticApproximation_and_exercise311`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit_and_exercise311`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_oneFactorBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_taylorBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_expansionBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_remainderBound_integrableSq`
- `Durrett2019LindebergFellerAnalyticCertificate.of_integrableSq`
- `durrett2019_theorem_3_4_10_characteristicFunction_rowSum_eq_product`
- `durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_of_product_tendsto`
- `durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_exp_of_product_tendsto_exp`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_characteristicFunction_product_tendsto`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_analyticCertificate`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit_and_exercise311`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_oneFactorBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_taylorBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_expansionBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_remainderBound_integrableSq`
- `durrett2019_theorem_3_4_10_lindebergFeller_of_integrableSq`
- `durrett2019_theorem_3_10_6_cramerWold_finiteCoordinate_lawTendsto`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedScalarCLT`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_projectedSummandCLT`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_vectorGaussianSource`
- `durrett2019_theorem_3_10_7_multivariateCLT_of_commonVectorLawGaussianSource`
- `durrett2019_section_4_1_IsConditionalExpectationVersion`
- `durrett2019_section_4_1_condExp_isConditionalExpectationVersion`
- `durrett2019_example_4_1_3_self_isConditionalExpectationVersion`
- `durrett2019_example_4_1_3_condExp_eq_of_stronglyMeasurable`
- `durrett2019_example_4_1_3_condExp_const`
- `durrett2019_example_4_1_4_condExp_eq_integral_of_independent`
- `durrett2019_theorem_4_1_9_condExp_linear`
- `durrett2019_theorem_4_1_9_condExp_mono_real`
- `durrett2019_theorem_4_1_12_condExp_eq_of_larger_condExp_stronglyMeasurable`
- `durrett2019_theorem_4_1_13_condExp_tower_larger_of_smaller`
- `durrett2019_theorem_4_1_13_condExp_tower_smaller_of_larger`
- `durrett2019_theorem_4_1_14_condExp_mul_of_stronglyMeasurable_left`
- `durrett2019_theorem_4_1_10_conditional_jensen_real`
- `durrett2019_theorem_4_1_11_condExp_L1_contraction_real`
- `durrett2019_theorem_4_1_11_condExp_L2_contraction`
- `durrett2019_theorem_4_1_11_condExp_memLp_two`
- `durrett2019_theorem_4_1_15_condExpL2_residual_inner_eq_zero`
- `durrett2019_theorem_4_1_15_condExpL2_minimal_norm_le`
- `durrett2019_theorem_4_1_15_condExpL2_ae_eq_condExp`

Existing reusable probability-measure modules cover much of the early-book
substrate:

- generated sigma-fields and pi-system/extensionality wrappers;
- product measure and independent-copy/Fubini wrappers;
- first and second Borel-Cantelli wrappers;
- real-valued strong-law wrappers;
- tail/layer-cake/Markov/dominated-convergence wrappers;
- weak convergence and finite-dimensional law wrappers;
- empirical-process fixed-endpoint empirical-CDF support.

The immediate blocker is now Chapter 4.2 martingales.  The prior large Chapter
2, Chapter 3, and Chapter 4.1 targets are closed as source wrappers:

- Durrett Theorem 2.4.9 now has the arbitrary-law half-line GC handoff and the
  source-facing empirical distribution-function wrapper
  `durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli`.
- Durrett Chapter 2.1 now has generated-independence, finite disjoint-block,
  finite product-law, iid common-law product, iid criterion, and canonical iid
  product-coordinate wrappers.

Do not spend the next cycle on center insertion, EDF notation, Chapter 2.1
polish, Lindeberg-Feller estimates, Section 3.10 vector-limit polish, or
Chapter 4.1 conditional-expectation repackaging unless the active Chapter 4.2
theorem exposes an exact missing dependency.

Current aggressive target: continue the Chapter 4.2 martingale spine beyond the
compiled Example 4.2.1 linear random-walk martingale/supermartingale/
submartingale and centered-display wrappers and the compiled Example 4.2.2
quadratic source/natural-random-walk bridges and Example 4.2.3 product
martingale and normalized-exponential bridges.  The following Chapter 3,
Chapter 4.1, and Chapter 4.2 packets now compile:

- Durrett Theorem 3.2.9 bounded-continuous test characterization, including
  the `integral_map` bridge from map-law integrals to textbook expectations
  `E g(X_i)`.
- Durrett Theorem 3.2.10 continuous mapping theorem, continuous case, over the
  local `tendstoInDistribution_continuous_comp` wrapper.
- Durrett Theorem 3.2.11 Portmanteau open-set, closed-set, continuity-set, and
  open/closed converse wrappers for `TendstoInDistribution`.
- Durrett Theorem 3.3.1 characteristic-function zero, conjugation, norm bound,
  continuity consequence, and affine-map wrappers.
- Durrett Theorem 3.3.2 independent-sum product law for characteristic
  functions.
- Durrett Theorem 3.3.17 characteristic-function continuity theorem in
  law-level and random-variable forms, plus the tightness statement from
  pointwise convergence to a limit continuous at zero.
- Durrett Theorem 3.3.20 centered unit-variance second-order characteristic
  function expansion at zero.
- Durrett Theorem 3.4.1 i.i.d. central limit theorem wrappers, both centered
  unit-variance and variance-Gaussian display forms.
- Durrett Theorem 3.4.10 now has triangular-array row-sum notation, row-wise
  independence, textbook mean-zero/variance-sum/Lindeberg-tail predicates, the
  explicit `exp(-sigma^2 t^2 / 2)` product-convergence interface, the Gaussian
  characteristic-function display, the row characteristic-function product
  formula, Exercise 3.1.1 triangular-array row-sum, max-absolute, absolute
  row-sum boundedness, source theorem, and product interfaces, quadratic
  variance coefficients/factors/products, the specialized Exercise 3.1.1
  row-sum, max-coefficient, absolute-row-sum, and product-convergence bridges,
  max-row-variance smallness, the variance-tail split bridge from Lindeberg to
  max-smallness, scaled variance bridges into quadratic-factor unit-norm
  control, Durrett Lemma 3.4.3
  product-difference control, row Gaussian exponential targets, the
  variance-sum-to-row-target convergence bridge, source-facing bridges from
  one-factor Taylor error row sums and Exercise 3.1.1 quadratic-product
  conclusions to convergence in distribution, source-facing bridges that
  replace the supplied variance-tail split with square-integrable row
  assumptions, a named characteristic/quadratic error row sum, a source-shaped
  finite-row Taylor/Lindeberg bound predicate, a source-shaped one-factor
  Taylor/Lindeberg bound predicate, a scalar Taylor-bound predicate written
  with second moments, a scalar expansion-bound predicate that retains the
  linear `i t E X` term, the pointwise truncation split
  `durrett2019_lindebergFeller_min_taylor_remainder_le_split`, and compiled
  bridges from the expansion bound through mean-zero cancellation and variance
  rewriting to the scalar Taylor bound, one-factor bound, finite-row bound,
  row-sum error convergence, analytic certificate, and final
  convergence-in-distribution constructor.
- Durrett Section 3.10 now has compiled Cramér-Wold, multivariate CLT,
  Gaussian-coordinate independence, and Exercise 3.10.8 linear-combination
  Gaussian-characterization wrappers in
  `StatInference/ProbabilityTheory/Multivariate.lean`.
- Durrett Chapter 4.1 now has the conditional-expectation starter module in
  `StatInference/ProbabilityTheory/ConditionalExpectation.lean`, including
  the source version predicate, the mathlib `condExp` version wrapper, Example
  4.1.3 self/constant wrappers, and Example 4.1.4 independence wrapper
  `durrett2019_example_4_1_4_condExp_eq_integral_of_independent`, plus
  Theorem 4.1.9 linearity/monotonicity, Theorem 4.1.12 measurability collapse,
  Theorem 4.1.13 tower, Theorem 4.1.14 pull-out, Theorem 4.1.10 conditional
  Jensen, and Theorem 4.1.11 `L¹`/`L²` contraction wrappers.
  Durrett Theorem 4.1.15 now has `condExpL2` residual orthogonality,
  minimization, and ordinary-`condExp` agreement wrappers.

The next likely packet should treat Theorem 4.3.5 / Lemma 4.3.6 as closed
support after the compiled likelihood-ratio martingale/convergence bridge,
regular/singular decomposition identity, density-ratio/top-set assembly,
integral-representation to RN-derivative bridge, generator-extension bridge,
bounded-convergence generator-production bridge, trimmed-RN eventual
restricted-density bridge, `mu + nu` boundedness bridge, canonical ratio,
denominator-side top-set null endpoint, singular-support top-set endpoint, and
full canonical-ratio real identity, plus the Example 4.3.7 finite-partition
likelihood, finite-union, and generator-facing endpoint, plus the Theorem 4.3.8
finite-product likelihood measurability, rectangle set-integral, and
finite-product `withDensity` endpoint, plus the infinite-product
cylinder-likelihood measurability, finite-coordinate restriction `withDensity`,
cylinder set-integral endpoint, and finite/cylinder Hellinger factorization
endpoints, plus the zero-product Fatou endpoint, cylinder Hellinger-product
handoff, zero-product singularity bridge, positive-product
absolute-continuity bridge, final zero/positive branch assemblers, and
positive-branch eliminator plus lintegral-nonzero/mass-one consumers.  Move
The finite-cylinder mass-one/integral-convergence handoffs, positive-product
L1-to-integral handoff, pairwise-liminf Cauchy-to-L1 handoff,
Hellinger-tail-bound positive consumer, square-root/Cauchy-Schwarz Hellinger
L1 bridge, and normalized positive-prefix product-tail convergence bridge also
now compile.  The concrete pointwise/cylinder square-root factorization,
concrete cylinder Cauchy handoff with the textbook factors, the
`sqrt X_n + sqrt X_m` square-integral estimate, and the overlap-to-tail
`2 * (1 - tail)` algebra bridge also now compile.  The concrete Pythagorean
overlap inequality and lower-bound-only overlap Cauchy handoff now also
compile.  The finite-coordinate product integral, exact nested square-root
overlap factorization, and finite Hellinger tail-product overlap handoff now
also compile.  The HasProd/Multipliable prefix-tail bridge and the standard
`Finset.range n` HasProd-to-pairwise-liminf handoff now also compile.  The
finite tail-product lower bound from positive prefix/tail monotonicity and the
standard positive-product range consumer now also compile.  The source-density
one-coordinate Hellinger affinity bound `≤ 1`, normalized positive-product
tail `≤ 1` bridge, and standard source-density positive-product range consumer
now also compile.  The standard `Finset.range n` source-density `HasProd`
positive-product absolute-continuity handoff now also compiles.  The
a.e.-finite no-top source bridge and the standard source-density `HasProd`
absolute-continuity consumer using it now also compile.  Kolmogorov tail-event
zero-one support and the zero-set-not-full positive-branch eliminator now also
compile.  The lower-integral source bridge from tail zero set and `∫⁻ X ≠ 0`
to zero-set-null and the positive-branch conclusion now also compiles.  The
every-tail-block measurability bridge into the `limsup` tail sigma-field now
also compiles, including zero-set-null and absolute-continuity consumers from
every-tail-block measurability plus `∫⁻ X ≠ 0`.  The tail-coordinate
sigma-field and finite tail cylinder likelihood measurability layer now also
compiles, including finite tail cylinder zero-set measurability and the
zero-set-equality handoff to every-tail-coordinate measurability.  The
finite-prefix zero-set algebra and prefix-cylinder zero-set handoff now also
compile.  The prefix/tail finite-block and tail-block-limit handoff layer now
also compiles.  The pointwise finite/nonzero coordinate side-condition bridge
now also compiles.  The range-limit tail handoff now also compiles: convergence
of the full finite-prefix likelihoods supplies the canonical tail-block limit
`X / prefix_n` and the tail-coordinate zero-set handoff under pointwise finite
and nonzero coordinate densities.  The range-limit positive-branch consumers
now also compile: coordinate sigma-fields are independent under the denominator
infinite product law; ENNReal full-prefix convergence supplies the `toReal`
convergence input for the L1/Cauchy branch; pointwise finite coordinate
densities supply the pairwise no-top side condition; and pointwise full-prefix
convergence plus finite/nonzero coordinate densities and `∫⁻ X ≠ 0` feed the
tail-zero-set positive-branch eliminator.  The canonical-ratio handoff into
these range-limit consumers now also compiles, so `toReal = dmu/dnu` and
`nu {canonicalRatio = infinity} = 0` no longer need to be supplied as open
inputs.  Move forward to proving standard full-prefix likelihood convergence
to the canonical `mu + nu` ratio and discharging the canonical ratio
integrability or nonzero-lower-integral/product inputs needed to finish the
remaining Kakutani criterion assembly.
Keep Theorem 4.1.16 deferred unless a
targeted kernel search finds a direct source-shaped API.

High-value Chapter 3 source anchors are in
`Textbooks/Durrett2019ProbabilityTheory/Markdown/Durrett2019 - Probability Theory and Examples_123-244.md`:

- Section 3.2 Weak Convergence starts near line 41.
- Theorem 3.2.9 appears near line 158.
- Theorem 3.2.10 appears near line 188.
- Theorem 3.2.11 appears near line 197.
- Section 3.3 Characteristic Functions starts near line 411.
- Theorem 3.3.1 appears near line 425.
- Theorem 3.3.2 appears near line 451.
- Theorem 3.3.17 appears near line 748.
- Theorem 3.3.20 appears near line 898.
- Section 3.4 Central Limit Theorems starts near line 1228.
- Theorem 3.4.1 appears near line 1234.
- Theorem 3.4.10 Lindeberg-Feller for triangular arrays appears near
  lines 1413-1465.
- Section 3.10 multivariate weak convergence starts near line 3643.
- Theorems 3.10.1, 3.10.5, 3.10.6, and 3.10.7 appear near lines
  3647, 3778, 3784, and 3789.
- Section 4.1 conditional expectation starts near line 3894 in the same
  Markdown chunk.  Example 4.1.4 appears near line 3969, Example 4.1.5 near
  line 3982, Theorem 4.1.9 near line 4081, Theorem 4.1.13 near line 4183, and
  Theorem 4.1.14 near line 4196.

Do not start with raw Chapter 1 extension theorem formalization, Stieltjes
measure construction, or appendix foundations unless an exact Durrett theorem
route forces it.  Those are low-throughput because mathlib already contains
the foundational measure theory and local Billingsley wrappers provide source
crosswalk support.

## Search-First Record

Local reuse anchors:

- `StatInference/ProbabilityMeasure/BorelCantelli.lean`
- `StatInference/ProbabilityMeasure/StrongLaw.lean`
- `StatInference/ProbabilityMeasure/ProductMeasure.lean`
- `StatInference/ProbabilityMeasure/GeneratedSigma.lean`
- `StatInference/ProbabilityMeasure/Tail.lean`
- `StatInference/ProbabilityMeasure/FiniteDimensional.lean`
- `StatInference/ProbabilityMeasure/WeakConvergence.lean`
- `StatInference/EmpiricalProcess/RealHalfLineGC.lean`
- `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`

Pinned mathlib search scope:

- `Mathlib.Probability.BorelCantelli`
- `Mathlib.Probability.StrongLaw`
- `Mathlib.Probability.Independence.Basic`
- `Mathlib.Probability.Independence.Integration`
- `Mathlib.Probability.HasLaw`
- `Mathlib.Probability.HasLawExists`
- `Mathlib.Probability.IdentDistrib`
- `Mathlib.MeasureTheory.PiSystem`
- `Mathlib.MeasureTheory.Measure.ProbabilityMeasure`
- `Mathlib.MeasureTheory.Measure.Prod`
- `Mathlib.MeasureTheory.MeasurableSpace.Pi`
- `Mathlib.MeasureTheory.Function.ConvergenceInMeasure`
- `Mathlib.MeasureTheory.Function.ConvergenceInDistribution`
- `Mathlib.MeasureTheory.Measure.CharacteristicFunction.Basic`
- `Mathlib.MeasureTheory.Measure.CharacteristicFunction.TaylorExpansion`
- `Mathlib.MeasureTheory.Measure.LevyConvergence`
- `Mathlib.Probability.Independence.CharacteristicFunction`
- `Mathlib.Probability.CentralLimitTheorem`

## Primitive Sequence

1. Create `StatInference/ProbabilityTheory/Basic.lean` and root-import it from
   `StatInference.lean`.  Done in the first Durrett packet.
2. Add a Durrett namespace wrapper module for Chapter 2 if the lane grows:
   `StatInference/ProbabilityTheory/Chapter2.lean`, or keep `Basic.lean` as a
   compact starter until there are enough declarations to split.
3. Prove Durrett Theorem 2.3.1 and Theorem 2.3.7 wrappers by delegating to
   local `ProbabilityMeasure` wrappers.  Done in the first Durrett packet.
4. Prove a Durrett Theorem 2.4.1 wrapper by delegating to
   `ProbabilityMeasure.strongLaw_ae_real`; record clearly that this is a
   mathlib-backed stronger-hypothesis/source-wrapper route, not the full
   Etemadi proof package.  Done in the first Durrett packet.
5. Attack Durrett Theorem 2.4.9 Glivenko-Cantelli:
   inspect `RealHalfLineGC.lean`, prove the arbitrary-distribution middle CDF
   partition constructor, then feed
   `durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions`.
   Done through the arbitrary-law half-line theorem and the source-facing
   empirical distribution-function wrapper.
6. Search and package independence/product-law wrappers for Theorems 2.1.7,
   2.1.10, 2.1.11, 2.1.12, and 2.1.13.  Reuse finite-`Pi` and product measure
   wrappers from `ProbabilityMeasure/ProductMeasure.lean` wherever possible.
   Generated pi-system independence, generated-rectangle independence
   criterion, real lower-halfline distribution-function criterion, grouped
   sigma-field independence, measurable-function preservation, finite
   disjoint-block functions, product-coordinate independence, pair and finite
   product-law, iid same-law product law, canonical iid product-coordinate
   source wrapper, and expectation-factorization wrappers now compile;
   remaining Chapter 2.1 work is optional only when a later theorem requires a
   sharper source shape.
7. After Chapter 2 has a stable theorem spine, start Chapter 3 by searching
   weak-convergence, characteristic-function, normal-law, convolution, and
   finite-dimensional limit APIs.  Durrett Theorems 3.2.9, 3.2.10
   continuous case, and 3.2.11 now compile as source-facing weak-convergence
   wrappers.  Durrett Theorem 3.3.1 characteristic-function zero, conjugation,
   norm bound, continuity consequence, and affine-map wrappers, plus Theorem
   3.3.2 independent-sum product law, Theorem 3.3.17 characteristic-function
   continuity theorem, Theorem 3.3.20 centered second-order expansion, and
   Theorem 3.4.1 i.i.d. CLT wrappers now compile over mathlib
   characteristic-function, Lévy-convergence, Taylor, and CLT APIs.  Next search
   Lindeberg-Feller, triangular-array, and multivariate CLT routes before adding
   new primitives.

## Current In-Thread Goal Prompt Seed

Use `Live In-Thread Goal Prompt V96` at the top of this file.  Historical route
notes below this point are inventory, not instructions for the next proof
packet.
