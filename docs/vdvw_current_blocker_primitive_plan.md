# VdV&W Current Blocker Primitive Plan

Status date: 2026-05-02.

This file pins down the active blocker and the primitive Lean declarations
needed to close it.  It is not a theorem report.  A formal report is created
only after the exact textbook item is fully proved with no proof holes.

## Active Blocker

Current main-line target: Theorem 2.4.3 and the Chapter 2
bracketing/measurable-class primitives it needs.

Policy update: exact example closures are deferred by default.  The Example
2.4.2 empirical-CDF quantile-grid blocker below is preserved because it has a
large compiled local layer and may be useful later, but it should not block the
main theorem-line queue unless a later theorem explicitly needs this exact
example.

Chapter 1 weak-convergence, tightness, product-space, stochastic-process, and
Hilbert results are fundamental foundation-lane work, not a skip bucket.  For
each such item, first search pinned mathlib and local Lean code, then either
wrap/prove the mathlib-backed statement or record the precise missing VdV&W
primitive.  Only exact arbitrary-map, nonmeasurable, perfect-map, or
representation statements with no available local/mathlib theorem should be
marked `blocked-vdvw`.  Do not add committed `sorry` placeholders for any of
these items; promoted Lean statements must be proof-hole-free.

Current correction layer: `StatInference/EmpiricalProcess/WeakConvergence.lean`
now compiles mathlib-backed VdV&W-local wrappers for measure-level weak
convergence, bounded-continuous integral characterization, continuous mapping,
and measurable common-domain Slutsky/product convergence.  This closes the
"mathlib exists but not named locally" part for those Chapter 1 foundations;
the exact arbitrary-map/nonmeasurable outer-expectation extensions remain
separate blockers.

## Active Main-Line Primitive Sequence

Textbook anchor: `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and
Emperical Process_101-200.md:988`.

Theorem 2.4.3 should be developed through theorem-level primitives, not through
additional example closures:

1. Statement interfaces for the theorem: `P`-measurable class, envelope,
   truncated class `F_M = {x | f x * 1{F x <= M}}`, outer integrability
   `P^* F < ∞`, and the random empirical `L1(P_n)` covering-number condition
   `log N(epsilon, F_M, L1(P_n)) = o_P^*(n)`.

   Status: first fixed-sample empirical covering interface is implemented in
   `StatInference/EmpiricalProcess/CoveringPrimitive.lean`:

   ```lean
   empiricalL1Distance
   empiricalL1Distance_nonneg
   empiricalL1Distance_self
   empiricalL1Distance_comm
   empiricalL1Distance_triangle
   FiniteEmpiricalL1CoverAtCard
   FiniteEmpiricalL1CoverAtCard.centerSet
   FiniteEmpiricalL1CoverAtCard.finite_centerSet
   FiniteEmpiricalL1CoverAtCard.centerSet_subset
   FiniteEmpiricalL1CoverAtCard.exists_center
   HasFiniteEmpiricalL1Cover
   finiteEmpiricalL1CoveringNumberCard
   empiricalL1CoveringNumber
   empiricalL1CoveringNumber_eq_find
   empiricalL1CoveringNumber_find_spec
   empiricalL1CoveringNumber_lt_top_of_hasFinite
   hasFinite_of_empiricalL1CoveringNumber_lt_top
   ```

   The random-sample/path and stochastic-little-o interface is implemented in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   VdVWOuterProbabilityLittleOAtTop
   VdVWOuterProbabilityLittleO_n
   vdVWRandomEmpiricalL1CoveringNumber
   VdVWRandomEmpiricalL1CoveringNumberLeCardinality
   vdVWLogEmpiricalL1CoveringCardinality
   vdVWLogEmpiricalL1CoveringCardinality_nonneg
   VdVWTheorem243EmpiricalEntropyCondition
   VdVWTheorem243EmpiricalEntropyConditionForAllEpsilon
   ```

   The truncated-class/envelope interface is implemented in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   VdVWClassEnvelope
   vdVWTruncatedClassFun
   vdVWTruncatedClassFun_eq_of_envelope_le
   vdVWTruncatedClassFun_eq_zero_of_lt_envelope
   abs_vdVWTruncatedClassFun_le_abs
   abs_vdVWTruncatedClassFun_le_envelope
   abs_vdVWTruncatedClassFun_le_M
   measurable_vdVWTruncatedClassFun
   VdVWClassCoordinateMeasurable.truncate
   VdVWTheorem243TruncatedEntropyCondition
   VdVWTheorem243TruncatedEntropyConditionForAllEpsilonM
   ```

   Remaining Step 1 work: add the outer-integrability/envelope-tail handoff
   `P^* F{F > M}` when the proof reaches the symmetrization/truncation layer.
2. Deterministic fixed-sample net inequality `(2.4.4)` for a finite empirical
   `L1(P_n)` net.

   Status: implemented as a compiled local layer in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   abs_vdVWWeightedSampleSum_sub_le_empiricalL1Distance_of_abs_weight_le
   vdVWWeightedClassSupremum_le_upper_add_of_finiteEmpiricalL1CoverAtCard
   ```

   The proof reuses the Definition 2.3.3 weighted-supremum infrastructure and
   the fixed-sample `FiniteEmpiricalL1CoverAtCard` primitive.  It searches and
   uses pinned mathlib finite-sum APIs including `Finset.abs_sum_le_sum_abs`,
   `Finset.sum_sub_distrib`, `Finset.sum_le_sum`, and `Finset.mul_sum`.
3. Finite-center maximal-inequality handoff for `(2.4.4)`.

   Status: implemented as a compiled local layer in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   vdVWFiniteCenterWeightedSupremum
   vdVWFiniteCenterWeightedSupremum_nonneg
   abs_vdVWWeightedSampleSum_center_le_finiteCenterWeightedSupremum
   vdVWWeightedClassSupremum_le_finiteCenterWeightedSupremum_add_of_finiteEmpiricalL1CoverAtCard
   vdVWTheorem243FiniteNetMaximalUpper
   vdVWTheorem243FiniteNetMaximalUpper_nonneg
   VdVWTheorem243FiniteCenterMaximalBound
   vdVWWeightedClassSupremum_le_finiteNetMaximalUpper_add_of_finiteEmpiricalL1CoverAtCard
   vdVWTheorem243HoeffdingCenterScale
   vdVWTheorem243HoeffdingCenterScale_nonneg
   vdVWTheorem243FiniteNetHoeffdingUpper
   vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_finiteEmpiricalL1CoverAtCard
   ```

   This closes the deterministic bridge from a finite empirical net to the
   book-shaped `sqrt(1 + log #G)` maximal-expression, assuming the
   finite-center maximal bound.  It deliberately does not prove the
   probabilistic Orlicz/Hoeffding bound yet.
4. Orlicz/Hoeffding maximal-inequality layer: prove the finite-center maximal
   bound above from Rademacher signs, Hoeffding/sub-Gaussian tails, and the
   Lemma 2.2.2 `psi_2` maximal inequality.  Search pinned mathlib for
   `SubGaussian`, `Hoeffding`, `Orlicz`, `eLpNorm`, and finite supremum
   inequalities before introducing local primitives.

   Status: the deterministic fixed-Rademacher-sign specialization is now
   implemented as a compiled local layer in
   `StatInference/EmpiricalProcess/Theorem243.lean`:

   ```lean
   VdVWRademacherSignVector
   VdVWRademacherSignVector.abs_le_one
   vdVWRademacherWeights
   abs_vdVWRademacherWeights_le_inv_card
   abs_vdVWRademacherWeights_le_inv_card_of_signVector
   VdVWTheorem243RademacherFiniteCenterHoeffdingBound
   vdVWWeightedClassSupremum_le_finiteNetHoeffdingUpper_add_of_rademacherSignVector
   ```

   This closes the deterministic passage from fixed signs `epsilon_i` to the
   existing finite-net/Hoeffding-scale handoff.  It deliberately does not yet
   construct iid Rademacher signs or prove the `psi_2`/Hoeffding maximal
   predicate probabilistically.
5. Symmetrization/truncation layer: formalize or bridge Lemma 2.3.1,
   Fubini-compatible outer expectation, and the envelope-tail bound
   `P^* F{F > M}`.

   Status: the Chapter 1.2 nonnegative tail-product cover-majorant bridge is
   implemented as
   `VdVWOuterExpectation_tailProduct_le_lintegral_tail_cover`.  This is a
   reusable outer-expectation layer for envelope tails.  The companion
   Markov-style outer-probability bridge
   `VdVWOuterProbability_lt_le_outerExpectation_div_cover` is also compiled.
   The full Theorem 2.4.3 symmetrization/truncation argument and real-valued
   `P^* F{F > M}` convergence handoff remain pending.
6. Final convergence handoff: from the random entropy condition to convergence
   in outer mean, then use the stated martingale/Lemma 2.4.5 route for almost
   sure convergence.  Do not report Theorem 2.4.3 until these components are
   exact and compile without proof holes.

Next exact edit: construct or primitive-register the iid Rademacher probability
space/sign process and prove the probabilistic finite-center
Orlicz/Hoeffding maximal bound
`VdVWTheorem243RademacherFiniteCenterHoeffdingBound`, reusing pinned mathlib
`PMF.bernoulli`, `exists_hasLaw_indepFun`, `HasSubgaussianMGF`, Hoeffding,
`eLpNorm`, and finite-union/maximal APIs where possible.

## Parked Example-Specific Blocker

Deferred target: Example 2.4.2, empirical CDF half-line class.

The proved local layer already turns supplied extended-real endpoint grids into
finite `L1(P)` bracketing-number witnesses and then into the conditional
half-line Glivenko-Cantelli result.  The remaining blocker is:

```text
Build the distribution-dependent finite middle partition / quantile cutpoints
for a probability measure on R, then append finite lower and upper tails to
obtain an unconditional SuppliedERealHalfLineEndpointGrid.
```

## Reuse Audit

Pinned/local Lean sources searched before adding new primitives:

| Source | Local path | Useful APIs found |
| --- | --- | --- |
| pinned mathlib | `.lake/packages/mathlib/Mathlib` | `Metric.externalCoveringNumber`, `Metric.coveringNumber`, `Metric.IsCover`, `externalCoveringNumber_mono_set`, `Set.indicator`, `Measurable.indicator`, `measurableSet_le`, `Asymptotics.IsLittleO`, `MeasureTheory.TendstoInMeasure`, `Real.log`, `Real.log_nonneg`, `Real.log_natCast_nonneg`, `Real.sqrt`, `Real.sqrt_nonneg`, `ENat.toNat`, `ENat.map`, `WithTop.untopD`, `PMF.bernoulli`, `ProbabilityTheory.exists_hasLaw_indepFun`, `Kernel.HasSubgaussianMGF`, `HasSubgaussianMGF`, `hasSubgaussianMGF_of_mem_Icc`, `hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero`, `measure_sum_range_ge_le_of_iIndepFun`, `measure_sum_ge_le_of_iIndepFun`, `measure_sum_ge_le_of_hasCondSubgaussianMGF`, `eLpNorm`, `eLpNorm_one_eq_lintegral_enorm`, `eLpNorm_add_le`, `eLpNorm_sum_le`, plus previous Example 2.4.2 APIs: `ProbabilityTheory.cdf`, `ProbabilityTheory.measure_cdf`, `ProbabilityTheory.cdf_eq_real`, `ProbabilityTheory.tendsto_cdf_atBot`, `ProbabilityTheory.tendsto_cdf_atTop`, `StieltjesFunction.measure_Ioo`, `measure_Iio`, `measure_Ioi`, `tendsto_measure_Iic_atTop`, `tendsto_measure_Ici_atBot`, `Measure.real`, `measureReal_mono`, `Fin.cases`, `Fin.lastCases`, `Fin.snoc`, `Fin.cons`, `Fin.eq_castSucc_or_eq_last` |
| pinned packages | `.lake/packages/{aesop,batteries,proofwidgets,LeanSearchClient,Qq,Cli,plausible,importGraph}` | tactic/support libraries, no empirical-CDF bracketing theorem and no VdV&W-style Orlicz maximal theorem found |
| local AI-Statistician checkout | `/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician` | older/high-level Rademacher and empirical-process certificate interfaces only; no exact VdV&W half-line quantile grid theorem and no reusable Theorem 2.4.3 Orlicz/Hoeffding proof |
| local empirical blueprint worktree | `/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician/.worktrees/empirical-blueprint` | high-level empirical-process certificates; no reusable measure-theoretic quantile grid proof, iid Rademacher construction, or finite-center maximal proof |
| local Aristotle download | `/Users/yukang/Downloads/2ee0bdf3-d67d-4ce3-ac7e-b87dfe7f9455_aristotle` | no relevant empirical-process/CDF partition layer found |

No direct open-source Lean theorem was found that states VdV&W Example 2.4.2
or the needed finite CDF-increment partition for arbitrary real probability
measures.  Reuse should therefore keep leaning on pinned mathlib's CDF,
Stieltjes, measure, and `Fin` tuple APIs.

## Local Lean Source Access

The project has local searchable access to the pinned Lake dependency store
through `.lake/packages`, including `mathlib`, `aesop`, `batteries`,
`proofwidgets`, `LeanSearchClient`, `Qq`, `Cli`, `plausible`, and
`importGraph`.  The package revisions are fixed by `lake-manifest.json`, so
proof work should treat those local checkouts as the authoritative API surface.

The current audit also checked nearby local open-source Lean workspaces under
`/Users/yukang/Desktop` and `/Users/yukang/Downloads`, including the
AI-Statistician checkout, its empirical-blueprint worktree, and the local
Aristotle download.  A broader `/Users/yukang` filesystem search can hit macOS
protected directories, but the targeted Lean source locations relevant to this
project are readable and searchable with `rg`/`find -L`.

Before adding a primitive for this blocker, search at least:

```text
.lake/packages/mathlib/Mathlib
.lake/packages/batteries/Batteries
/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician
/Users/yukang/Desktop/AI for Math/Codex/AI-Statistician/.worktrees/empirical-blueprint
/Users/yukang/Downloads/2ee0bdf3-d67d-4ce3-ac7e-b87dfe7f9455_aristotle
```

Record any useful APIs found here before re-proving a shared measure-theory,
CDF, finite-index, or integration lemma locally.

## Primitive Lemma Sequence

### 1. Tail-Appending Endpoint Constructor

Status: implemented as a compiled local primitive in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declarations:

```lean
SuppliedERealHalfLineEndpointGrid.endpointWithRealTails
SuppliedERealHalfLineEndpointGrid.ofMiddleCDFPartitionWithTails
```

The implemented constructor appends `⊥` and `⊤` around the existing real
compact-core grid:

```lean
noncomputable def SuppliedERealHalfLineEndpointGrid.withRealTails
    {μ : Measure ℝ} {epsilon : ℝ} {middleCells : ℕ}
    (endpoint : Fin (middleCells + 1) -> ℝ)
    (hendpoint_strictMono : StrictMono endpoint)
    (hleftTail : μ.real (Set.Iio (endpoint 0)) < epsilon)
    (hrightTail : μ.real (Set.Ioi (endpoint (Fin.last middleCells))) < epsilon)
    (bracketOfMiddle : ℝ -> Fin middleCells)
    (left_le_middle : ...)
    (middle_lt_right : ...)
    (middle_width_lt : ∀ cell, μ.real (Set.Ioo ... ...) < epsilon) :
    SuppliedERealHalfLineEndpointGrid μ epsilon (middleCells + 2)
```

Preferred API route: use `Fin.cons` for the lower `⊥` endpoint and `Fin.snoc`
for the upper `⊤` endpoint; use `Fin.cases`, `Fin.lastCases`,
`Fin.snoc_castSucc`, `Fin.snoc_last`, and `Fin.succ_last` for simplification.
The compiled proof uses this route, plus `Fin.castSucc_succ` for the middle
and upper-tail adjacent endpoint simplifications.

### 2. Bounded Middle Partition Interface

Status: implemented as a compiled local primitive in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declarations:

```lean
SuppliedRealMiddleCDFPartition
SuppliedRealMiddleCDFPartition.endpoint_left_lt_right
SuppliedRealMiddleCDFPartition.cell_width_lt
```

This proof-carrying interface is not yet quantile existence:

```lean
structure SuppliedRealMiddleCDFPartition
    (μ : Measure ℝ) (epsilon a b : ℝ) (middleCells : ℕ) where
  endpoint : Fin (middleCells + 1) -> ℝ
  strictMono : StrictMono endpoint
  left_eq : endpoint 0 = a
  right_eq : endpoint (Fin.last middleCells) = b
  bracketOf : ∀ c : ℝ, a ≤ c -> c < b -> Fin middleCells
  left_le : ...
  lt_right : ...
  cdf_increment_lt :
    ∀ cell,
      Function.leftLim (ProbabilityTheory.cdf μ) (endpoint (Fin.succ cell)) -
        ProbabilityTheory.cdf μ (endpoint (Fin.castSucc cell)) < epsilon
```

Then use the already proved
`measureReal_Ioo_lt_of_cdf_leftLim_sub_lt` to get the middle `L1(P)` widths.
The compiled theorem `SuppliedRealMiddleCDFPartition.cell_width_lt` performs
that handoff.

### 3. Middle Partition To Endpoint Grid

Status: implemented as a compiled local theorem in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declaration:

```lean
SuppliedERealHalfLineEndpointGrid.exists_endpointGrid_of_realMiddleCDFPartition
```

This combines the partition interface with finite tail cutpoints:

```lean
theorem exists_endpointGrid_of_realMiddleCDFPartition
    (μ : Measure ℝ) [IsProbabilityMeasure μ] {epsilon a b : ℝ}
    (hleftTail : μ.real (Set.Iio a) < epsilon)
    (hrightTail : μ.real (Set.Ioi b) < epsilon)
    (partition : SuppliedRealMiddleCDFPartition μ epsilon a b middleCells) :
    ∃ cellCount, Nonempty
      (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)
```

This is the clean bridge from quantile work to the existing bracketing-number
and GC handoffs.

### 4. Quantile / Cutpoint Existence

Prove the actual distribution-dependent finite partition theorem:

```lean
theorem exists_realMiddleCDFPartition
    (μ : Measure ℝ) [IsProbabilityMeasure μ]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) (hab : a < b) :
    ∃ middleCells, Nonempty
      (SuppliedRealMiddleCDFPartition μ epsilon a b middleCells)
```

Likely proof route:

1. Use `ProbabilityTheory.cdf` monotonicity and boundedness in `[0,1]`.
2. Choose `N : ℕ` with `1 / (N + 1 : ℝ) < epsilon`.
3. Define cut levels in CDF space and choose real cutpoints by `sInf` of
   level sets `{x | level ≤ cdf μ x}` or an equivalent proof-carrying
   primitive.
4. Use monotonicity and `Function.leftLim` to prove adjacent open-cell
   increments are below `epsilon`.
5. Keep atoms safe by using open cells and the Stieltjes `leftLim` identity.

This is the only hard mathematical blocker left for Example 2.4.2.

### 5. Unconditional Example 2.4.2 Handoff

Status: partially implemented as a compiled reduction theorem in
`StatInference/EmpiricalProcess/RealHalfLine.lean`.

Declaration:

```lean
SuppliedERealHalfLineEndpointGrid.exists_forall_of_forall_realMiddleCDFPartition
```

This theorem proves that finite tail cutpoints plus bounded middle partition
existence on every strict bounded interval imply full endpoint-grid existence
for every positive radius.  The remaining missing theorem is therefore exactly
the middle partition existence theorem in Step 4.

After Step 4, the final endpoint-grid statement is:

```lean
theorem exists_suppliedERealHalfLineEndpointGrid_probability
    (μ : Measure ℝ) [IsProbabilityMeasure μ] :
    ∀ epsilon, 0 < epsilon ->
      ∃ cellCount, Nonempty
        (SuppliedERealHalfLineEndpointGrid μ epsilon cellCount)
```

Then the existing declarations already give:

```lean
SuppliedERealHalfLineEndpointGrid.l1BracketingNumber_lt_top_forall
vdVW_realHalfLine_glivenkoCantelli_of_suppliedERealHalfLineEndpointGrids
```

That closes the Lean side needed for the exact Example 2.4.2 theorem report.

## Automation Rule

Every heartbeat should check this file before choosing a new primitive.  If a
mathlib or local-code search finds a reusable theorem for one of the steps
above, update this file and reuse that theorem rather than duplicating it.
