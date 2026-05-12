# External SLT Reuse Audit

This note tracks the integration check for
<https://github.com/YuanheZ/lean-stat-learning-theory> against the current
`StatInference` empirical-process formalization.

Inspected 2026-05-12 from GitHub web/raw pages because shell `git clone` failed
with local DNS resolution for `github.com`.  The repository README describes an
SLT library with Gaussian Lipschitz concentration, Dudley's entropy integral,
finite covering-number bounds, and least-squares regression endpoints.  The raw
Lean file headers state Apache 2.0 licensing, although the repository root did
not expose a `LICENSE` file in the web listing inspected here; any future code
copy must preserve headers and re-check the license file once shell cloning
works.

## Compatibility

- External repo toolchain: `leanprover/lean4:v4.27.0-rc1`.
- Current repo toolchain: `leanprover/lean4:v4.30.0-rc2`.
- External mathlib manifest pins mathlib `d68c4dc09f5e000d3c968adae8def120a0758729`
  through `master`.
- Current repo manifest pins mathlib
  `49f10344339f99fda2d3bb0aa1455bfa6801fd93`.

The version gap is large enough that direct file import is not a safe first
step.  Integration should port only theorem-facing ideas into existing local
interfaces, using current mathlib names.

## External Inventory

- `SLT/CoveringNumber.lean` defines custom `IsENet`, custom
  `coveringNumber : WithTop Nat`, custom `IsPacking`, custom `packingNumber`,
  total-bounded finite-net existence, maximal-packing-to-covering lemmas, and
  finite-dimensional Euclidean/l1-ball covering-number bounds.
- `SLT/MetricEntropy.lean` defines metric entropy, square-root entropy, Dudley
  integrands, and entropy integrals.
- `SLT/Chaining.lean` defines dyadic scales, `DyadicNets`,
  `GoodDyadicNets`, nearest-net projections, and chaining approximation
  infrastructure.
- `SLT/SubGaussian.lean` defines `IsSubGaussianProcess`, one- and two-sided
  sub-Gaussian tail bounds, Gaussian-tail integral support, first-moment
  bounds, and finite-maximal bounds.
- `SLT/Dudley.lean` proves a Dudley entropy-integral bound for sub-Gaussian
  processes.
- Additional modules cover Gaussian Poincare/log-Sobolev/Lipschitz
  concentration, Efron-Stein, and least-squares regression.

## Current Local Coverage

- Current mathlib already provides `Metric.coveringNumber`,
  `Metric.packingNumber`, maximal separated sets, and
  `Metric.coveringNumber_le_packingNumber` in
  `.lake/packages/mathlib/Mathlib/Topology/MetricSpace/CoveringNumbers.lean`.
- `StatInference/EmpiricalProcess/CoveringPrimitive.lean` already builds the
  VdV&W-specific empirical `L1(P_n)` pseudometric wrapper
  `EmpiricalL1Index`, proof-carrying finite empirical covers, finite empirical
  packings, and adapters between local empirical cover cardinalities and
  mathlib `Metric.coveringNumber`/`Metric.packingNumber`.
- `StatInference/EmpiricalProcess/Theorem243.lean` already has the finite-center
  Rademacher/Hoeffding sub-Gaussian bridge, finite-center expected supremum
  bounds, selected-cover cardinality plumbing, and source-facing
  covering/packing lower-bound entry points for the VdV&W Theorem 2.4.3 route.
- `StatInference/ProbabilityMeasure/Rademacher.lean` already imports current
  mathlib `Mathlib.Probability.Moments.SubGaussian` for the Rademacher lane.

## Reuse Decision

Do not import the external `SLT/CoveringNumber.lean` API wholesale.  Its custom
`coveringNumber`/`packingNumber` names and `WithTop Nat` codomain duplicate
current mathlib's `Metric.coveringNumber`/`Metric.packingNumber` API and would
increase adapter burden for VdV&W.  The local code has already standardized on
mathlib `ENNReal`/`ENat`-style metric covering numbers plus VdVW-specific
empirical wrappers.

Do reuse external proof patterns in targeted ports:

- dyadic-net/chaining structures can inform a future Dudley or entropy-integral
  module, but they are downstream of the current VdVW Theorem 2.4.3
  finite-cover source gap;
- finite-maximal sub-Gaussian proof patterns are already mostly covered by the
  local Theorem 2.4.3 finite-center maximal layer, but external soft-max and
  Chernoff lemmas are useful comparison references;
- Euclidean and l1-ball covering-number bounds can be ported later as separate
  theorem-facing examples after aligning them with current mathlib
  `Metric.coveringNumber`;
- any copied theorem body must be moved into a small local module with preserved
  attribution, modernized imports, and a dedicated compile check.

## Immediate Integration Target

For the active VdV&W branch, the highest-value integration is not a wholesale
SLT import.  It is to keep using current mathlib covering/packing numbers and
local `EmpiricalL1Index` adapters, then port only the external dyadic/Dudley
layer when the Chapter 2 dependency order reaches entropy-integral bounds.
The current source frontier remains the selected-cover Rademacher bad-fiber
lower bound and selected lower-growth/tail control from entropy or packing
assumptions.
