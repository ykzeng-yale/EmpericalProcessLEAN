import StatInference.Optimization.LowerBounds
import StatInference.Optimization.ProjectedSubgradient

/-!
# Chewi Chapter 6 nonsmooth lower-bound layer

This module starts the formalization of Chewi Theorems 6.21-6.25.  The first
packet isolates the reusable obstruction in Theorem 6.21: the resisting
subgradient oracle keeps every gradient-span iterate in the coordinate-prefix
subspace, and the max-coordinate hard objective is nonnegative on that
subspace while its optimum value is negative.
-/

namespace StatInference
namespace Optimization

open scoped InnerProductSpace

/--
The maximum coordinate of a finite Euclidean vector.  Chewi Theorem 6.21 uses
`max_i x[i]` as the nonsmooth part of the hard objective.
-/
noncomputable def chewi621CoordinateMax {d : ℕ} [NeZero d]
    (x : EuclideanSpace ℝ (Fin d)) : ℝ :=
  (Finset.univ.image (fun i : Fin d => x i)).max' (by simp)

/-- The source hard objective `gamma * max_i x[i] + alpha / 2 * ‖x‖²`. -/
noncomputable def chewi621HardObjective {d : ℕ} [NeZero d]
    (alpha gamma : ℝ) (x : EuclideanSpace ℝ (Fin d)) : ℝ :=
  gamma * chewi621CoordinateMax x + (alpha / 2) * ‖x‖ ^ (2 : ℕ)

/-- Indices attaining the maximum coordinate of `x`. -/
noncomputable def chewi621ActiveIndexSet {d : ℕ} [NeZero d]
    (x : EuclideanSpace ℝ (Fin d)) : Finset (Fin d) :=
  Finset.univ.filter fun i : Fin d => x i = chewi621CoordinateMax x

theorem chewi621ActiveIndexSet_nonempty {d : ℕ} [NeZero d]
    (x : EuclideanSpace ℝ (Fin d)) :
    (chewi621ActiveIndexSet (d := d) x).Nonempty := by
  have hmax_mem :
      chewi621CoordinateMax x ∈
        Finset.univ.image (fun i : Fin d => x i) := by
    simpa [chewi621CoordinateMax] using
      (Finset.max'_mem (Finset.univ.image (fun i : Fin d => x i)) (by simp))
  rcases Finset.mem_image.mp hmax_mem with ⟨i, _hi, hxi⟩
  exact ⟨i, by simp [chewi621ActiveIndexSet, hxi]⟩

/--
The resisting oracle uses the first coordinate attaining the maximum.  The
minimum is with respect to the usual order on `Fin d`, matching Chewi's
`min I_*(x)`.
-/
noncomputable def chewi621FirstMaxIndex {d : ℕ} [NeZero d]
    (x : EuclideanSpace ℝ (Fin d)) : Fin d :=
  (chewi621ActiveIndexSet (d := d) x).min'
    (chewi621ActiveIndexSet_nonempty (d := d) x)

theorem chewi621FirstMaxIndex_is_max {d : ℕ} [NeZero d]
    (x : EuclideanSpace ℝ (Fin d)) :
    x (chewi621FirstMaxIndex (d := d) x) = chewi621CoordinateMax x := by
  have hmem :
      chewi621FirstMaxIndex (d := d) x ∈
        chewi621ActiveIndexSet (d := d) x := by
    simpa [chewi621FirstMaxIndex] using
      Finset.min'_mem (chewi621ActiveIndexSet (d := d) x)
        (chewi621ActiveIndexSet_nonempty (d := d) x)
  simpa [chewi621ActiveIndexSet] using hmem

/-- Standard coordinate basis vector in `EuclideanSpace ℝ (Fin d)`. -/
noncomputable def chewi621CoordinateBasis {d : ℕ}
    (i : Fin d) : EuclideanSpace ℝ (Fin d) :=
  WithLp.toLp 2 fun j : Fin d => if j = i then (1 : ℝ) else 0

@[simp] theorem chewi621CoordinateBasis_apply {d : ℕ}
    (i j : Fin d) :
    chewi621CoordinateBasis i j = if j = i then (1 : ℝ) else 0 := by
  simp [chewi621CoordinateBasis, PiLp.toLp_apply]

/-- Coordinate basis vectors extract the corresponding coordinate by inner product. -/
theorem chewi621CoordinateBasis_inner {d : ℕ}
    (i : Fin d) (z : EuclideanSpace ℝ (Fin d)) :
    inner ℝ (chewi621CoordinateBasis i) z = z i := by
  simp [chewi621CoordinateBasis, PiLp.inner_apply, RCLike.inner_apply]

/-- Coordinate basis vectors have unit Euclidean norm. -/
theorem chewi621CoordinateBasis_norm {d : ℕ}
    (i : Fin d) :
    ‖chewi621CoordinateBasis i‖ = 1 := by
  have hinner :
      inner ℝ (chewi621CoordinateBasis i) (chewi621CoordinateBasis i) = 1 := by
    rw [chewi621CoordinateBasis_inner]
    simp
  have hsq :
      ‖chewi621CoordinateBasis i‖ ^ (2 : ℕ) = 1 := by
    rw [← hinner, real_inner_self_eq_norm_sq]
  nlinarith [norm_nonneg (chewi621CoordinateBasis i)]

/--
Chewi's displayed candidate minimizer for Theorem 6.21:
`x_*[k] = -gamma / (alpha * d)`.
-/
noncomputable def chewi621Minimizer {d : ℕ}
    (alpha gamma : ℝ) : EuclideanSpace ℝ (Fin d) :=
  WithLp.toLp 2 fun _i : Fin d => -gamma / (alpha * (d : ℝ))

@[simp] theorem chewi621Minimizer_apply {d : ℕ}
    (alpha gamma : ℝ) (i : Fin d) :
    chewi621Minimizer (d := d) alpha gamma i =
      -gamma / (alpha * (d : ℝ)) := by
  simp [chewi621Minimizer, PiLp.toLp_apply]

/-- The maximum coordinate dominates each coordinate. -/
theorem chewi621CoordinateMax_ge_coord {d : ℕ} [NeZero d]
    (x : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    x i ≤ chewi621CoordinateMax x := by
  have hi_mem :
      x i ∈ Finset.univ.image (fun j : Fin d => x j) := by
    exact Finset.mem_image.mpr ⟨i, by simp, rfl⟩
  simpa [chewi621CoordinateMax] using
    (Finset.le_max'
      (s := Finset.univ.image (fun j : Fin d => x j)) (x i) hi_mem)

/-- The maximum coordinate of Chewi's constant candidate is its coordinate value. -/
theorem chewi621CoordinateMax_minimizer {d : ℕ} [NeZero d]
    (alpha gamma : ℝ) :
    chewi621CoordinateMax (d := d) (chewi621Minimizer (d := d) alpha gamma) =
      -gamma / (alpha * (d : ℝ)) := by
  unfold chewi621CoordinateMax
  rw [Finset.max'_eq_iff]
  constructor
  · exact Finset.mem_image.mpr
      ⟨Classical.choice (inferInstance : Nonempty (Fin d)), by simp, by simp⟩
  · intro y hy
    rcases Finset.mem_image.mp hy with ⟨i, _hi, rfl⟩
    simp

/-- Squared norm of Chewi's constant candidate. -/
theorem chewi621Minimizer_norm_sq {d : ℕ}
    (alpha gamma : ℝ) :
    ‖chewi621Minimizer (d := d) alpha gamma‖ ^ (2 : ℕ) =
      (d : ℝ) * (gamma / (alpha * (d : ℝ))) ^ (2 : ℕ) := by
  rw [EuclideanSpace.real_norm_sq_eq]
  calc
    (∑ i : Fin d, (chewi621Minimizer (d := d) alpha gamma i) ^ (2 : ℕ))
        = ∑ _i : Fin d, (gamma / (alpha * (d : ℝ))) ^ (2 : ℕ) := by
          refine Finset.sum_congr rfl ?_
          intro i _hi
          simp
          ring
    _ = (d : ℝ) * (gamma / (alpha * (d : ℝ))) ^ (2 : ℕ) := by
      simp [Finset.sum_const, nsmul_eq_mul]

/--
If `x ∈ V_k` and `k < d`, then the first maximum coordinate is at most `k`.
Indeed all coordinates from `k` onward vanish, and coordinate `k` is available
as a zero-valued maximizer whenever the first maximizer would otherwise be in
the tail.
-/
theorem chewi621FirstMaxIndex_le_of_mem_coordinatePrefixSubmodule
    {d k : ℕ} [NeZero d] {x : EuclideanSpace ℝ (Fin d)}
    (hkd : k < d) (hx : x ∈ coordinatePrefixSubmodule d k) :
    (chewi621FirstMaxIndex (d := d) x).1 ≤ k := by
  let idx := chewi621FirstMaxIndex (d := d) x
  by_cases hidx_le : idx.1 ≤ k
  · exact hidx_le
  · have hk_le_idx : k ≤ idx.1 := by omega
    have hidx_zero : x idx = 0 := hx idx hk_le_idx
    have hmax_zero : chewi621CoordinateMax x = 0 := by
      simpa [idx, hidx_zero] using
        (chewi621FirstMaxIndex_is_max (d := d) x).symm
    let ik : Fin d := ⟨k, hkd⟩
    have hik_mem : ik ∈ chewi621ActiveIndexSet (d := d) x := by
      have hik_zero : x ik = 0 := hx ik le_rfl
      simp [chewi621ActiveIndexSet, hik_zero, hmax_zero]
    have hidx_le_ik : idx ≤ ik := by
      simpa [idx, chewi621FirstMaxIndex] using
        Finset.min'_le (chewi621ActiveIndexSet (d := d) x) ik hik_mem
    exact hidx_le_ik

/-- Coordinate basis vectors are supported in the corresponding prefix subspace. -/
theorem chewi621CoordinateBasis_mem_coordinatePrefixSubmodule_succ
    {d : ℕ} (i : Fin d) :
    chewi621CoordinateBasis i ∈ coordinatePrefixSubmodule d (i.1 + 1) := by
  intro j hj
  have hne : j ≠ i := by
    intro hji
    have : j.1 = i.1 := congrArg Fin.val hji
    omega
  simp [hne]

/--
The first-max resisting oracle from Chewi Theorem 6.21:
`x ↦ alpha x + gamma e_i`, where `i` is the first maximum coordinate of `x`.
-/
noncomputable def chewi621FirstMaxOracle {d : ℕ} [NeZero d]
    (alpha gamma : ℝ) (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) :=
  alpha • x + gamma • chewi621CoordinateBasis (chewi621FirstMaxIndex (d := d) x)

/--
On a radius-`R` set, Chewi's first-max oracle has norm at most
`gamma + alpha * R`.  This is the bounded-domain replacement for the false
global Lipschitz statement when `alpha > 0`.
-/
theorem chewi621FirstMaxOracle_norm_le_of_norm_le
    {d : ℕ} [NeZero d] {alpha gamma R : ℝ}
    {x : EuclideanSpace ℝ (Fin d)}
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma)
    (hxnorm : ‖x‖ ≤ R) :
    ‖chewi621FirstMaxOracle (d := d) alpha gamma x‖ ≤
      gamma + alpha * R := by
  let e := chewi621CoordinateBasis (chewi621FirstMaxIndex (d := d) x)
  have htri :
      ‖chewi621FirstMaxOracle (d := d) alpha gamma x‖ ≤
        ‖alpha • x‖ + ‖gamma • e‖ := by
    simpa [chewi621FirstMaxOracle, e] using
      norm_add_le (alpha • x) (gamma • e)
  have hnorm_eq :
      ‖alpha • x‖ + ‖gamma • e‖ =
        alpha * ‖x‖ + gamma := by
    rw [norm_smul, norm_smul, Real.norm_of_nonneg halpha_nonneg,
      Real.norm_of_nonneg hgamma_nonneg, chewi621CoordinateBasis_norm]
    ring
  have hscaled : alpha * ‖x‖ ≤ alpha * R :=
    mul_le_mul_of_nonneg_left hxnorm halpha_nonneg
  calc
    ‖chewi621FirstMaxOracle (d := d) alpha gamma x‖ ≤
        ‖alpha • x‖ + ‖gamma • e‖ := htri
    _ = alpha * ‖x‖ + gamma := hnorm_eq
    _ ≤ alpha * R + gamma := by nlinarith
    _ = gamma + alpha * R := by ring

/-- The quadratic part's first-order lower model. -/
theorem chewi621_quadratic_subgradient_ineq {d : ℕ}
    {alpha : ℝ} (halpha_nonneg : 0 ≤ alpha)
    (x y : EuclideanSpace ℝ (Fin d)) :
    (alpha / 2) * ‖x‖ ^ (2 : ℕ) + inner ℝ (alpha • x) (y - x) ≤
      (alpha / 2) * ‖y‖ ^ (2 : ℕ) := by
  have hdecomp : y = x + (y - x) := by
    module
  have hsq_nonneg : 0 ≤ ‖y - x‖ ^ (2 : ℕ) := sq_nonneg _
  rw [hdecomp, norm_add_sq_real, real_inner_smul_left]
  have hdiff : x + (y - x) - x = y - x := by
    module
  rw [hdiff]
  nlinarith [mul_nonneg halpha_nonneg hsq_nonneg]

/-- The quadratic part's exact `alpha`-strong first-order lower model. -/
theorem chewi621_quadratic_strong_subgradient_ineq {d : ℕ}
    (alpha : ℝ) (x y : EuclideanSpace ℝ (Fin d)) :
    (alpha / 2) * ‖x‖ ^ (2 : ℕ) + inner ℝ (alpha • x) (y - x) +
        (alpha / 2) * ‖y - x‖ ^ (2 : ℕ) =
      (alpha / 2) * ‖y‖ ^ (2 : ℕ) := by
  have hdecomp : y = x + (y - x) := by
    module
  rw [hdecomp, norm_add_sq_real, real_inner_smul_left]
  have hdiff : x + (y - x) - x = y - x := by
    module
  rw [hdiff]
  ring

/-- The first-max part's subgradient inequality. -/
theorem chewi621_firstMax_subgradient_ineq {d : ℕ} [NeZero d]
    {gamma : ℝ} (hgamma_nonneg : 0 ≤ gamma)
    (x y : EuclideanSpace ℝ (Fin d)) :
    gamma * chewi621CoordinateMax x +
        inner ℝ (gamma • chewi621CoordinateBasis (chewi621FirstMaxIndex (d := d) x))
          (y - x) ≤
      gamma * chewi621CoordinateMax y := by
  let i := chewi621FirstMaxIndex (d := d) x
  have hmax_x : x i = chewi621CoordinateMax x :=
    chewi621FirstMaxIndex_is_max (d := d) x
  have hcoord_y : y i ≤ chewi621CoordinateMax y :=
    chewi621CoordinateMax_ge_coord y i
  have hbasis :
      inner ℝ (chewi621CoordinateBasis i) (y - x) = y i - x i := by
    rw [chewi621CoordinateBasis_inner]
    rfl
  rw [real_inner_smul_left, hbasis, ← hmax_x]
  nlinarith [mul_le_mul_of_nonneg_left hcoord_y hgamma_nonneg]

/--
The first-max resisting oracle is a valid subgradient of Chewi's hard
max-plus-quadratic objective on the whole space.
-/
theorem chewi621FirstMaxOracle_isSubgradientAt_univ
    {d : ℕ} [NeZero d] {alpha gamma : ℝ}
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma)
    (x : EuclideanSpace ℝ (Fin d)) :
    IsSubgradientAt Set.univ
      (chewi621HardObjective (d := d) alpha gamma)
      (chewi621FirstMaxOracle (d := d) alpha gamma x) x := by
  refine ⟨by simp, ?_⟩
  intro y _hy
  have hmax :=
    chewi621_firstMax_subgradient_ineq
      (d := d) (gamma := gamma) hgamma_nonneg x y
  have hquad :=
    chewi621_quadratic_subgradient_ineq
      (d := d) (alpha := alpha) halpha_nonneg x y
  calc
    chewi621HardObjective (d := d) alpha gamma x +
        inner ℝ (chewi621FirstMaxOracle (d := d) alpha gamma x) (y - x)
        =
      (gamma * chewi621CoordinateMax x +
          inner ℝ
            (gamma • chewi621CoordinateBasis (chewi621FirstMaxIndex (d := d) x))
            (y - x)) +
        ((alpha / 2) * ‖x‖ ^ (2 : ℕ) + inner ℝ (alpha • x) (y - x)) := by
          simp [chewi621HardObjective, chewi621FirstMaxOracle, inner_add_left]
          ring
    _ ≤ gamma * chewi621CoordinateMax y +
        (alpha / 2) * ‖y‖ ^ (2 : ℕ) := add_le_add hmax hquad
    _ = chewi621HardObjective (d := d) alpha gamma y := by
      rfl

/--
First-order convexity certificate for the max-plus-quadratic hard objective.
This packages the everywhere-valid first-max subgradient as the local
`FirstOrderStrongConvexOn ... 0` interface used by earlier theorem layers.
-/
theorem chewi621HardObjective_firstOrderConvexOn_univ
    {d : ℕ} [NeZero d] {alpha gamma : ℝ}
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma) :
    FirstOrderStrongConvexOn Set.univ
      (chewi621HardObjective (d := d) alpha gamma)
      (chewi621FirstMaxOracle (d := d) alpha gamma) 0 := by
  refine ⟨convex_univ, ?_⟩
  intro x _hx y _hy
  have hsub :=
    chewi621FirstMaxOracle_isSubgradientAt_univ
      (d := d) (alpha := alpha) (gamma := gamma)
      halpha_nonneg hgamma_nonneg x
  simpa using hsub.2 (by simp : y ∈ (Set.univ :
    Set (EuclideanSpace ℝ (Fin d))))

/--
First-order strong-convexity certificate for the hard objective.  The max part
is convex via the first-max subgradient; the quadratic part supplies the
`alpha` lower-model correction exactly.
-/
theorem chewi621HardObjective_firstOrderStrongConvexOn_univ
    {d : ℕ} [NeZero d] {alpha gamma : ℝ}
    (hgamma_nonneg : 0 ≤ gamma) :
    FirstOrderStrongConvexOn Set.univ
      (chewi621HardObjective (d := d) alpha gamma)
      (chewi621FirstMaxOracle (d := d) alpha gamma) alpha := by
  refine ⟨convex_univ, ?_⟩
  intro x _hx y _hy
  have hmax :=
    chewi621_firstMax_subgradient_ineq
      (d := d) (gamma := gamma) hgamma_nonneg x y
  have hquad :=
    chewi621_quadratic_strong_subgradient_ineq
      (d := d) alpha x y
  calc
    chewi621HardObjective (d := d) alpha gamma x +
        inner ℝ (chewi621FirstMaxOracle (d := d) alpha gamma x) (y - x) +
          (alpha / 2) * ‖y - x‖ ^ (2 : ℕ)
        =
      (gamma * chewi621CoordinateMax x +
          inner ℝ
            (gamma • chewi621CoordinateBasis (chewi621FirstMaxIndex (d := d) x))
            (y - x)) +
        ((alpha / 2) * ‖x‖ ^ (2 : ℕ) + inner ℝ (alpha • x) (y - x) +
          (alpha / 2) * ‖y - x‖ ^ (2 : ℕ)) := by
          simp [chewi621HardObjective, chewi621FirstMaxOracle, inner_add_left]
          ring
    _ ≤ gamma * chewi621CoordinateMax y +
        (alpha / 2) * ‖y‖ ^ (2 : ℕ) := by
          rw [hquad]
          have hmax' :=
            add_le_add_right hmax ((alpha / 2) * ‖y‖ ^ (2 : ℕ))
          simpa [add_assoc, add_comm, add_left_comm] using hmax'
    _ = chewi621HardObjective (d := d) alpha gamma y := by
      rfl

/--
The support calculation for Chewi's first-max oracle: if an iterate is in
`V_k` and `k < d`, the oracle output lies in `V_{k+1}`.
-/
theorem chewi621FirstMaxOracle_mem_coordinatePrefixSubmodule
    {d k : ℕ} [NeZero d] {alpha gamma : ℝ}
    {x : EuclideanSpace ℝ (Fin d)}
    (hkd : k < d) (hx : x ∈ coordinatePrefixSubmodule d k) :
    chewi621FirstMaxOracle (d := d) alpha gamma x ∈
      coordinatePrefixSubmodule d (k + 1) := by
  let idx := chewi621FirstMaxIndex (d := d) x
  have hidx_le : idx.1 ≤ k :=
    chewi621FirstMaxIndex_le_of_mem_coordinatePrefixSubmodule hkd hx
  have hx_succ : x ∈ coordinatePrefixSubmodule d (k + 1) :=
    coordinatePrefixSubmodule_mono d (Nat.le_succ k) hx
  have hbasis_succ :
      chewi621CoordinateBasis idx ∈ coordinatePrefixSubmodule d (k + 1) :=
    coordinatePrefixSubmodule_mono d (Nat.succ_le_succ hidx_le)
      (chewi621CoordinateBasis_mem_coordinatePrefixSubmodule_succ idx)
  have hx_scaled :
      alpha • x ∈ coordinatePrefixSubmodule d (k + 1) :=
    (coordinatePrefixSubmodule d (k + 1)).smul_mem alpha hx_succ
  have hbasis_scaled :
      gamma • chewi621CoordinateBasis idx ∈ coordinatePrefixSubmodule d (k + 1) :=
    (coordinatePrefixSubmodule d (k + 1)).smul_mem gamma hbasis_succ
  simpa [chewi621FirstMaxOracle, idx] using
    (coordinatePrefixSubmodule d (k + 1)).add_mem hx_scaled hbasis_scaled

/--
The same support calculation without the `k < d` side condition.  Once
`k >= d`, the target prefix subspace is already all of `EuclideanSpace`.
-/
theorem chewi621FirstMaxOracle_mem_coordinatePrefixSubmodule_of_mem
    {d k : ℕ} [NeZero d] {alpha gamma : ℝ}
    {x : EuclideanSpace ℝ (Fin d)}
    (hx : x ∈ coordinatePrefixSubmodule d k) :
    chewi621FirstMaxOracle (d := d) alpha gamma x ∈
      coordinatePrefixSubmodule d (k + 1) := by
  by_cases hkd : k < d
  · exact chewi621FirstMaxOracle_mem_coordinatePrefixSubmodule hkd hx
  · have hdk : d ≤ k + 1 := by omega
    rw [coordinatePrefixSubmodule_eq_top_of_le hdk]
    trivial

/--
The value of the hard objective at Chewi's displayed candidate:
`f(x_*) = -gamma^2 / (2 alpha d)`.
-/
theorem chewi621HardObjective_minimizer_value {d : ℕ} [NeZero d]
    {alpha gamma : ℝ} (halpha : alpha ≠ 0) :
    chewi621HardObjective (d := d) alpha gamma
        (chewi621Minimizer (d := d) alpha gamma) =
      -gamma ^ (2 : ℕ) / (2 * alpha * (d : ℝ)) := by
  have hd : (d : ℝ) ≠ 0 := by exact_mod_cast (NeZero.ne d)
  rw [chewi621HardObjective, chewi621CoordinateMax_minimizer,
    chewi621Minimizer_norm_sq]
  field_simp [halpha, hd]
  ring

/-- Squared norm of Chewi's minimizer under the displayed source choice of `alpha`. -/
theorem chewi621Minimizer_norm_sq_source_alpha {d : ℕ} [NeZero d]
    {R gamma : ℝ} (hR : R ≠ 0) (hgamma : gamma ≠ 0) :
    ‖chewi621Minimizer (d := d)
        (gamma / (R * Real.sqrt (d : ℝ))) gamma‖ ^ (2 : ℕ) =
      R ^ (2 : ℕ) := by
  have hd_nonneg : 0 ≤ (d : ℝ) := by positivity
  have hd_pos : 0 < (d : ℝ) := by
    exact_mod_cast (Nat.pos_of_ne_zero (NeZero.ne d))
  have hsqrt_pos : 0 < Real.sqrt (d : ℝ) := Real.sqrt_pos.2 hd_pos
  have hsqrt_ne : Real.sqrt (d : ℝ) ≠ 0 := ne_of_gt hsqrt_pos
  have hd_ne : (d : ℝ) ≠ 0 := by exact_mod_cast (NeZero.ne d)
  rw [chewi621Minimizer_norm_sq]
  field_simp [hR, hgamma, hsqrt_ne, hd_ne]
  rw [Real.sq_sqrt hd_nonneg]

/-- Chewi's displayed `alpha` makes `‖x_*‖ = R`. -/
theorem chewi621Minimizer_norm_eq_radius_source_alpha {d : ℕ} [NeZero d]
    {R gamma : ℝ} (hR_pos : 0 < R) (hgamma : gamma ≠ 0) :
    ‖chewi621Minimizer (d := d)
        (gamma / (R * Real.sqrt (d : ℝ))) gamma‖ = R := by
  have hsq :=
    chewi621Minimizer_norm_sq_source_alpha
      (d := d) (R := R) (gamma := gamma) (ne_of_gt hR_pos) hgamma
  exact le_antisymm
    ((sq_le_sq₀ (norm_nonneg _) hR_pos.le).mp (le_of_eq hsq))
    ((sq_le_sq₀ hR_pos.le (norm_nonneg _)).mp (le_of_eq hsq.symm))

/--
For the displayed source parameters and `x_0 = 0`, the initial point lies in
the radius-`R` ball around the hard instance minimizer.
-/
theorem chewi621_zero_dist_minimizer_le_radius_source_alpha
    {d : ℕ} [NeZero d] {R gamma : ℝ}
    (hR_pos : 0 < R) (hgamma : gamma ≠ 0) :
    dist (0 : EuclideanSpace ℝ (Fin d))
        (chewi621Minimizer (d := d)
          (gamma / (R * Real.sqrt (d : ℝ))) gamma) ≤ R := by
  rw [dist_eq_norm, zero_sub, norm_neg]
  exact (chewi621Minimizer_norm_eq_radius_source_alpha
    (d := d) (R := R) (gamma := gamma) hR_pos hgamma).le

/--
Bounded-domain Lipschitz certificate for Chewi's hard instance on the ball
`‖x‖ <= R`.  The quadratic term prevents a global Lipschitz theorem for
`alpha > 0`, so Theorem 6.21 should use this radius-local statement.
-/
theorem chewi621HardObjective_lipschitzOnWith_closedBall_zero
    {d : ℕ} [NeZero d] {alpha gamma R : ℝ}
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma) :
    LipschitzOnWith (Real.toNNReal (gamma + alpha * R))
      (chewi621HardObjective (d := d) alpha gamma)
      (Metric.closedBall (0 : EuclideanSpace ℝ (Fin d)) R) := by
  refine LipschitzOnWith.of_le_add_mul' (gamma + alpha * R) ?_
  intro x hx y _hy
  have hxnorm : ‖x‖ ≤ R := by
    simpa [Metric.mem_closedBall, dist_eq_norm] using hx
  let p := chewi621FirstMaxOracle (d := d) alpha gamma x
  have hgap :
      chewi621HardObjective (d := d) alpha gamma x -
          chewi621HardObjective (d := d) alpha gamma y ≤
        inner ℝ p (x - y) := by
    simpa [p] using
      (chewi621FirstMaxOracle_isSubgradientAt_univ
        (d := d) (alpha := alpha) (gamma := gamma)
        halpha_nonneg hgamma_nonneg x).gap_le_inner
        (C := Set.univ) (y := y) (by simp)
  have hinner :
      inner ℝ p (x - y) ≤ ‖p‖ * ‖x - y‖ :=
    real_inner_le_norm p (x - y)
  have hp_norm :
      ‖p‖ ≤ gamma + alpha * R := by
    simpa [p] using
      chewi621FirstMaxOracle_norm_le_of_norm_le
        (d := d) (alpha := alpha) (gamma := gamma) (R := R)
        halpha_nonneg hgamma_nonneg hxnorm
  have hmul :
      ‖p‖ * ‖x - y‖ ≤
        (gamma + alpha * R) * ‖x - y‖ :=
    mul_le_mul_of_nonneg_right hp_norm (norm_nonneg _)
  have hdist : dist x y = ‖x - y‖ := by
    simpa using (dist_eq_norm x y)
  have hgap_dist :
      chewi621HardObjective (d := d) alpha gamma x -
          chewi621HardObjective (d := d) alpha gamma y ≤
        (gamma + alpha * R) * dist x y := by
    calc
      chewi621HardObjective (d := d) alpha gamma x -
          chewi621HardObjective (d := d) alpha gamma y ≤
            inner ℝ p (x - y) := hgap
      _ ≤ ‖p‖ * ‖x - y‖ := hinner
      _ ≤ (gamma + alpha * R) * dist x y := by simpa [hdist] using hmul
  nlinarith

/--
Bounded-domain Lipschitz certificate on a ball with arbitrary center.  This is
the source-shaped form needed for Theorems 6.21 and 6.22, whose local domain is
`B(x_*, R)`.
-/
theorem chewi621HardObjective_lipschitzOnWith_closedBall
    {d : ℕ} [NeZero d] {alpha gamma R : ℝ}
    (center : EuclideanSpace ℝ (Fin d))
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma) :
    LipschitzOnWith (Real.toNNReal (gamma + alpha * (‖center‖ + R)))
      (chewi621HardObjective (d := d) alpha gamma)
      (Metric.closedBall center R) := by
  refine LipschitzOnWith.of_le_add_mul'
    (gamma + alpha * (‖center‖ + R)) ?_
  intro x hx y _hy
  have hxcenter : ‖x - center‖ ≤ R := by
    simpa [Metric.mem_closedBall, dist_eq_norm] using hx
  have hxnorm : ‖x‖ ≤ ‖center‖ + R := by
    have hdecomp : center + (x - center) = x := by
      module
    calc
      ‖x‖ = ‖center + (x - center)‖ := by rw [hdecomp]
      _ ≤ ‖center‖ + ‖x - center‖ := norm_add_le _ _
      _ ≤ ‖center‖ + R := by nlinarith
  let p := chewi621FirstMaxOracle (d := d) alpha gamma x
  have hgap :
      chewi621HardObjective (d := d) alpha gamma x -
          chewi621HardObjective (d := d) alpha gamma y ≤
        inner ℝ p (x - y) := by
    simpa [p] using
      (chewi621FirstMaxOracle_isSubgradientAt_univ
        (d := d) (alpha := alpha) (gamma := gamma)
        halpha_nonneg hgamma_nonneg x).gap_le_inner
        (C := Set.univ) (y := y) (by simp)
  have hinner :
      inner ℝ p (x - y) ≤ ‖p‖ * ‖x - y‖ :=
    real_inner_le_norm p (x - y)
  have hp_norm :
      ‖p‖ ≤ gamma + alpha * (‖center‖ + R) := by
    simpa [p] using
      chewi621FirstMaxOracle_norm_le_of_norm_le
        (d := d) (alpha := alpha) (gamma := gamma)
        (R := ‖center‖ + R) halpha_nonneg hgamma_nonneg hxnorm
  have hmul :
      ‖p‖ * ‖x - y‖ ≤
        (gamma + alpha * (‖center‖ + R)) * ‖x - y‖ :=
    mul_le_mul_of_nonneg_right hp_norm (norm_nonneg _)
  have hdist : dist x y = ‖x - y‖ := by
    simpa using (dist_eq_norm x y)
  have hgap_dist :
      chewi621HardObjective (d := d) alpha gamma x -
          chewi621HardObjective (d := d) alpha gamma y ≤
        (gamma + alpha * (‖center‖ + R)) * dist x y := by
    calc
      chewi621HardObjective (d := d) alpha gamma x -
          chewi621HardObjective (d := d) alpha gamma y ≤
            inner ℝ p (x - y) := hgap
      _ ≤ ‖p‖ * ‖x - y‖ := hinner
      _ ≤ (gamma + alpha * (‖center‖ + R)) * dist x y := by
          simpa [hdist] using hmul
  nlinarith

/-- Chewi's displayed 6.21 parameters have local Lipschitz constant at most `L`. -/
theorem chewi621_source_lipschitz_constant_le
    {N : ℕ} {L R : ℝ} (hL_nonneg : 0 ≤ L) (hR_pos : 0 < R) :
    L / 4 +
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) * R ≤
      L := by
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hR_ne : R ≠ 0 := ne_of_gt hR_pos
  have hsqrt_ne :
      Real.sqrt ((N + 1 : ℕ) : ℝ) ≠ 0 := ne_of_gt hsqrt_pos
  have hsqrt_ge_one :
      1 ≤ Real.sqrt ((N + 1 : ℕ) : ℝ) := by
    rw [Real.one_le_sqrt]
    norm_num
  have hL4_nonneg : 0 ≤ L / 4 := by positivity
  have hterm_eq :
      ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) * R =
        (L / 4) / Real.sqrt ((N + 1 : ℕ) : ℝ) := by
    field_simp [hR_ne, hsqrt_ne]
  have hterm_le :
      (L / 4) / Real.sqrt ((N + 1 : ℕ) : ℝ) ≤ L / 4 := by
    rw [div_le_iff₀ hsqrt_pos]
    nlinarith [mul_le_mul_of_nonneg_left hsqrt_ge_one hL4_nonneg]
  rw [hterm_eq]
  nlinarith

/--
Source-shaped bounded-domain Lipschitz certificate for the concrete
`d = N + 1` Theorem 6.21 hard instance.  On the radius-`R` ball around the
initial point, the hard objective is `L`-Lipschitz for Chewi's displayed
choices `gamma = L/4` and `alpha = (L/4)/(R sqrt(N+1))`.
-/
theorem chewi621HardObjective_lipschitzOnWith_source_closedBall_zero
    {N : ℕ} {L R : ℝ} (hL_nonneg : 0 ≤ L) (hR_pos : 0 < R) :
    LipschitzOnWith (Real.toNNReal L)
      (chewi621HardObjective (d := N + 1)
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4))
      (Metric.closedBall (0 : EuclideanSpace ℝ (Fin (N + 1))) R) := by
  let alpha := (L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))
  let gamma := L / 4
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hden_pos : 0 < R * Real.sqrt ((N + 1 : ℕ) : ℝ) :=
    mul_pos hR_pos hsqrt_pos
  have halpha_nonneg : 0 ≤ alpha := by
    exact div_nonneg (div_nonneg hL_nonneg (by norm_num)) hden_pos.le
  have hgamma_nonneg : 0 ≤ gamma := by
    exact div_nonneg hL_nonneg (by norm_num)
  have hbase :
      LipschitzOnWith (Real.toNNReal (gamma + alpha * R))
        (chewi621HardObjective (d := N + 1) alpha gamma)
        (Metric.closedBall (0 : EuclideanSpace ℝ (Fin (N + 1))) R) :=
    chewi621HardObjective_lipschitzOnWith_closedBall_zero
      (d := N + 1) (alpha := alpha) (gamma := gamma) (R := R)
      halpha_nonneg hgamma_nonneg
  refine LipschitzOnWith.of_le_add_mul' L ?_
  intro x hx y hy
  have hraw := hbase.le_add_mul hx hy
  have hK_nonneg : 0 ≤ gamma + alpha * R := by
    exact add_nonneg hgamma_nonneg (mul_nonneg halpha_nonneg hR_pos.le)
  have hK_le : gamma + alpha * R ≤ L := by
    simpa [alpha, gamma, add_comm, add_left_comm, add_assoc, mul_comm,
      mul_left_comm, mul_assoc] using
      chewi621_source_lipschitz_constant_le
        (N := N) (L := L) (R := R) hL_nonneg hR_pos
  have hcoef :
      (Real.toNNReal (gamma + alpha * R) : ℝ) * dist x y ≤
        L * dist x y := by
    rw [Real.coe_toNNReal _ hK_nonneg]
    exact mul_le_mul_of_nonneg_right hK_le dist_nonneg
  nlinarith

/-- Chewi's displayed 6.21 parameters are `L`-Lipschitz on `B(x_*, R)`. -/
theorem chewi621_source_center_lipschitz_constant_le
    {N : ℕ} {L R : ℝ} (hL_nonneg : 0 ≤ L) (hR_pos : 0 < R) :
    L / 4 +
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) * (R + R) ≤
      L := by
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hR_ne : R ≠ 0 := ne_of_gt hR_pos
  have hsqrt_ne :
      Real.sqrt ((N + 1 : ℕ) : ℝ) ≠ 0 := ne_of_gt hsqrt_pos
  have hsqrt_ge_one :
      1 ≤ Real.sqrt ((N + 1 : ℕ) : ℝ) := by
    rw [Real.one_le_sqrt]
    norm_num
  have hL2_nonneg : 0 ≤ L / 2 := by positivity
  have hterm_eq :
      ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) * (R + R) =
        (L / 2) / Real.sqrt ((N + 1 : ℕ) : ℝ) := by
    field_simp [hR_ne, hsqrt_ne]
    ring
  have hterm_le :
      (L / 2) / Real.sqrt ((N + 1 : ℕ) : ℝ) ≤ L / 2 := by
    rw [div_le_iff₀ hsqrt_pos]
    nlinarith [mul_le_mul_of_nonneg_left hsqrt_ge_one hL2_nonneg]
  rw [hterm_eq]
  nlinarith

/--
Source-shaped centered-domain Lipschitz certificate for Theorem 6.21: Chewi's
hard objective is `L`-Lipschitz on `B(x_*, R)`.
-/
theorem chewi621HardObjective_lipschitzOnWith_source_closedBall_minimizer
    {N : ℕ} {L R : ℝ} (hL_pos : 0 < L) (hR_pos : 0 < R) :
    LipschitzOnWith (Real.toNNReal L)
      (chewi621HardObjective (d := N + 1)
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4))
      (Metric.closedBall
        (chewi621Minimizer (d := N + 1)
          ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4)) R) := by
  let alpha := (L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))
  let gamma := L / 4
  let center : EuclideanSpace ℝ (Fin (N + 1)) :=
    chewi621Minimizer (d := N + 1) alpha gamma
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hden_pos : 0 < R * Real.sqrt ((N + 1 : ℕ) : ℝ) :=
    mul_pos hR_pos hsqrt_pos
  have halpha_nonneg : 0 ≤ alpha :=
    div_nonneg (div_nonneg hL_pos.le (by norm_num)) hden_pos.le
  have hgamma_nonneg : 0 ≤ gamma :=
    div_nonneg hL_pos.le (by norm_num)
  have hcenter_norm : ‖center‖ = R := by
    simpa [center, alpha, gamma] using
      chewi621Minimizer_norm_eq_radius_source_alpha
        (d := N + 1) (R := R) (gamma := L / 4)
        hR_pos (ne_of_gt (by positivity : 0 < L / 4))
  have hbase :
      LipschitzOnWith (Real.toNNReal (gamma + alpha * (‖center‖ + R)))
        (chewi621HardObjective (d := N + 1) alpha gamma)
        (Metric.closedBall center R) :=
    chewi621HardObjective_lipschitzOnWith_closedBall
      (d := N + 1) (alpha := alpha) (gamma := gamma) (R := R)
      center halpha_nonneg hgamma_nonneg
  refine LipschitzOnWith.of_le_add_mul' L ?_
  intro x hx y hy
  have hraw := hbase.le_add_mul hx hy
  have hK_nonneg : 0 ≤ gamma + alpha * (‖center‖ + R) := by
    rw [hcenter_norm]
    positivity
  have hK_le : gamma + alpha * (‖center‖ + R) ≤ L := by
    rw [hcenter_norm]
    simpa [alpha, gamma] using
      chewi621_source_center_lipschitz_constant_le
        (N := N) (L := L) (R := R) hL_pos.le hR_pos
  have hcoef :
      (Real.toNNReal (gamma + alpha * (‖center‖ + R)) : ℝ) * dist x y ≤
        L * dist x y := by
    rw [Real.coe_toNNReal _ hK_nonneg]
    exact mul_le_mul_of_nonneg_right hK_le dist_nonneg
  nlinarith

/--
Source-shaped first-order convexity certificate for the concrete `d = N + 1`
Theorem 6.21 hard instance.
-/
theorem chewi621HardObjective_firstOrderConvexOn_source_univ
    {N : ℕ} {L R : ℝ} (hL_nonneg : 0 ≤ L) (hR_pos : 0 < R) :
    FirstOrderStrongConvexOn Set.univ
      (chewi621HardObjective (d := N + 1)
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4))
      (chewi621FirstMaxOracle (d := N + 1)
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4)) 0 := by
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hden_pos : 0 < R * Real.sqrt ((N + 1 : ℕ) : ℝ) :=
    mul_pos hR_pos hsqrt_pos
  have halpha_nonneg :
      0 ≤ (L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ)) :=
    div_nonneg (div_nonneg hL_nonneg (by norm_num)) hden_pos.le
  have hgamma_nonneg : 0 ≤ L / 4 :=
    div_nonneg hL_nonneg (by norm_num)
  exact
    chewi621HardObjective_firstOrderConvexOn_univ
      (d := N + 1)
      (alpha := (L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ)))
      (gamma := L / 4) halpha_nonneg hgamma_nonneg

/--
If a vector is supported on the first `N` coordinates and `N < d`, its maximum
coordinate is nonnegative: coordinate `N` itself is zero.
-/
theorem chewi621CoordinateMax_nonneg_of_mem_coordinatePrefixSubmodule
    {d N : ℕ} [NeZero d] {x : EuclideanSpace ℝ (Fin d)}
    (hNd : N < d) (hx : x ∈ coordinatePrefixSubmodule d N) :
    0 ≤ chewi621CoordinateMax x := by
  let i : Fin d := ⟨N, hNd⟩
  have hxi : x i = 0 := hx i le_rfl
  have hle := chewi621CoordinateMax_ge_coord x i
  simpa [hxi] using hle

/--
The max-plus-quadratic hard objective is nonnegative on the prefix subspace
`V_N` whenever `N < d`, `gamma >= 0`, and `alpha >= 0`.
-/
theorem chewi621HardObjective_nonneg_of_mem_coordinatePrefixSubmodule
    {d N : ℕ} [NeZero d] {alpha gamma : ℝ}
    {x : EuclideanSpace ℝ (Fin d)}
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma)
    (hNd : N < d) (hx : x ∈ coordinatePrefixSubmodule d N) :
    0 ≤ chewi621HardObjective (d := d) alpha gamma x := by
  have hmax_nonneg :
      0 ≤ gamma * chewi621CoordinateMax x :=
    mul_nonneg hgamma_nonneg
      (chewi621CoordinateMax_nonneg_of_mem_coordinatePrefixSubmodule hNd hx)
  have hquad_nonneg :
      0 ≤ (alpha / 2) * ‖x‖ ^ (2 : ℕ) :=
    mul_nonneg (div_nonneg halpha_nonneg (by norm_num))
      (sq_nonneg ‖x‖)
  dsimp [chewi621HardObjective]
  nlinarith

/--
Chewi Theorem 6.21 obstruction, in reusable supplied-interface form.  A
resisting oracle that expands support by at most one coordinate per query keeps
the `N`th iterate in `V_N`; if all points in `V_N` have nonnegative objective
value and the optimum value is at most `-gap`, the final objective gap is at
least `gap`.
-/
theorem chewi621_gap_ge_of_gradientSpan_prefix_nonneg
    {d N : ℕ}
    {f : EuclideanSpace ℝ (Fin d) -> ℝ}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    {fstar gap : ℝ}
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x)
    (hgrad : ∀ k, x k ∈ coordinatePrefixSubmodule d k ->
      grad (x k) ∈ coordinatePrefixSubmodule d (k + 1))
    (hprefix_nonneg :
      ∀ y, y ∈ coordinatePrefixSubmodule d N -> 0 ≤ f y)
    (hfstar_le : fstar ≤ -gap) :
    gap ≤ f (x N) - fstar := by
  have hxN : x N ∈ coordinatePrefixSubmodule d N :=
    gradientSpanTrajectory_mem_coordinatePrefixSubmodule_of_grad_mem_next
      hx0 hspan hgrad N
  have hfx_nonneg : 0 ≤ f (x N) := hprefix_nonneg (x N) hxN
  nlinarith

/--
Concrete Theorem 6.21 obstruction for Chewi's max-plus-quadratic hard
objective.  This is the compiled endpoint of the first nonsmooth lower-bound
packet; later packets instantiate the source's specific minimizer and
Lipschitz/radius parameter choices.
-/
theorem chewi621_hardObjective_gap_ge_of_gradientSpan
    {d N : ℕ} [NeZero d] {alpha gamma fstar gap : ℝ}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    (halpha_nonneg : 0 ≤ alpha) (hgamma_nonneg : 0 ≤ gamma)
    (hNd : N < d)
    (hx0 : x 0 = 0)
    (hspan : IsGradientSpanTrajectory grad x)
    (hgrad : ∀ k, x k ∈ coordinatePrefixSubmodule d k ->
      grad (x k) ∈ coordinatePrefixSubmodule d (k + 1))
    (hfstar_le : fstar ≤ -gap) :
    gap ≤ chewi621HardObjective (d := d) alpha gamma (x N) - fstar := by
  exact
    chewi621_gap_ge_of_gradientSpan_prefix_nonneg
      (d := d) (N := N)
      (f := chewi621HardObjective (d := d) alpha gamma)
      (grad := grad) (x := x) (fstar := fstar) (gap := gap)
      hx0 hspan hgrad
      (fun y hy =>
        chewi621HardObjective_nonneg_of_mem_coordinatePrefixSubmodule
          halpha_nonneg hgamma_nonneg hNd hy)
      hfstar_le

/--
Chewi Theorem 6.21 obstruction with the concrete first-max resisting oracle and
the displayed candidate optimum value.  This removes the two main supplied
hypotheses from `chewi621_hardObjective_gap_ge_of_gradientSpan`: the oracle
prefix-support and the negative optimum-value calculation.
-/
theorem chewi621_gap_ge_minimizer_value_of_firstMaxGradientSpan
    {d N : ℕ} [NeZero d] {alpha gamma : ℝ}
    {x : ℕ -> EuclideanSpace ℝ (Fin d)}
    (halpha_pos : 0 < alpha) (hgamma_nonneg : 0 ≤ gamma)
    (hNd : N < d)
    (hx0 : x 0 = 0)
    (hspan :
      IsGradientSpanTrajectory
        (chewi621FirstMaxOracle (d := d) alpha gamma) x) :
    gamma ^ (2 : ℕ) / (2 * alpha * (d : ℝ)) ≤
      chewi621HardObjective (d := d) alpha gamma (x N) -
        chewi621HardObjective (d := d) alpha gamma
          (chewi621Minimizer (d := d) alpha gamma) := by
  have hfstar_le :
      chewi621HardObjective (d := d) alpha gamma
          (chewi621Minimizer (d := d) alpha gamma) ≤
        -(gamma ^ (2 : ℕ) / (2 * alpha * (d : ℝ))) := by
    rw [chewi621HardObjective_minimizer_value (d := d)
      (halpha := ne_of_gt halpha_pos)]
    ring_nf
    exact le_rfl
  exact
    chewi621_hardObjective_gap_ge_of_gradientSpan
      (d := d) (N := N) (alpha := alpha) (gamma := gamma)
      (fstar :=
        chewi621HardObjective (d := d) alpha gamma
          (chewi621Minimizer (d := d) alpha gamma))
      (gap := gamma ^ (2 : ℕ) / (2 * alpha * (d : ℝ)))
      (grad := chewi621FirstMaxOracle (d := d) alpha gamma)
      (x := x)
      (le_of_lt halpha_pos) hgamma_nonneg hNd hx0 hspan
      (fun k hxk =>
        chewi621FirstMaxOracle_mem_coordinatePrefixSubmodule_of_mem
          (d := d) (k := k) (alpha := alpha) (gamma := gamma) hxk)
      hfstar_le

/-- Scalar simplification for Chewi's displayed Theorem 6.21 parameters. -/
theorem chewi621_source_parameter_gap_eq
    {N : ℕ} {L R : ℝ} (hL : 0 < L) (hR : 0 < R) :
    (L / 4) ^ (2 : ℕ) /
        (2 * ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) *
          ((N + 1 : ℕ) : ℝ)) =
      L * R / (8 * Real.sqrt ((N + 1 : ℕ) : ℝ)) := by
  have hL_ne : L ≠ 0 := ne_of_gt hL
  have hR_ne : R ≠ 0 := ne_of_gt hR
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hsqrt_ne : Real.sqrt ((N + 1 : ℕ) : ℝ) ≠ 0 := ne_of_gt hsqrt_pos
  have hsucc_nonneg : 0 ≤ ((N + 1 : ℕ) : ℝ) := by positivity
  field_simp [hL_ne, hR_ne, hsqrt_ne]
  rw [Real.sq_sqrt hsucc_nonneg]
  ring

/--
Chewi Theorem 6.21, source-parameter lower bound for the `d = N + 1` hard
instance and the concrete first-max resisting oracle.  This is the exact
finite-dimensional packet before embedding into arbitrary larger dimensions.
-/
theorem chewi621_gap_ge_source_parameters
    {N : ℕ} {L R : ℝ}
    {x : ℕ -> EuclideanSpace ℝ (Fin (N + 1))}
    (hL : 0 < L) (hR : 0 < R)
    (hx0 : x 0 = 0)
    (hspan :
      IsGradientSpanTrajectory
        (chewi621FirstMaxOracle (d := N + 1)
          ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4)) x) :
    L * R / (8 * Real.sqrt ((N + 1 : ℕ) : ℝ)) ≤
      chewi621HardObjective (d := N + 1)
        ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4) (x N) -
        chewi621HardObjective (d := N + 1)
          ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4)
          (chewi621Minimizer (d := N + 1)
            ((L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ))) (L / 4)) := by
  have halpha_pos :
      0 < (L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ)) := by positivity
  have hgamma_nonneg : 0 ≤ L / 4 := by positivity
  have hgap :=
    chewi621_gap_ge_minimizer_value_of_firstMaxGradientSpan
      (d := N + 1) (N := N)
      (alpha := (L / 4) / (R * Real.sqrt ((N + 1 : ℕ) : ℝ)))
      (gamma := L / 4) (x := x)
      halpha_pos hgamma_nonneg (Nat.lt_succ_self N) hx0 hspan
  rw [chewi621_source_parameter_gap_eq hL hR] at hgap
  exact hgap

/-- Scalar simplification for Chewi Theorem 6.22 parameters. -/
theorem chewi622_source_parameter_gap_eq
    {N : ℕ} {alpha L : ℝ} (halpha : alpha ≠ 0) :
    (L / 4) ^ (2 : ℕ) /
        (2 * alpha * ((N + 1 : ℕ) : ℝ)) =
      L ^ (2 : ℕ) / (32 * alpha * ((N + 1 : ℕ) : ℝ)) := by
  have hN : ((N + 1 : ℕ) : ℝ) ≠ 0 := by positivity
  field_simp [halpha, hN]
  ring

/-- Chewi Theorem 6.22's displayed radius for the strongly-convex hard instance. -/
noncomputable def chewi622Radius (N : ℕ) (alpha L : ℝ) : ℝ :=
  (L / 4) / (alpha * Real.sqrt ((N + 1 : ℕ) : ℝ))

theorem chewi622Radius_pos
    {N : ℕ} {alpha L : ℝ} (halpha : 0 < alpha) (hL : 0 < L) :
    0 < chewi622Radius N alpha L := by
  unfold chewi622Radius
  positivity

theorem chewi622_alpha_eq_source_radius
    {N : ℕ} {alpha L : ℝ} (halpha : 0 < alpha) (hL : 0 < L) :
    (L / 4) /
        (chewi622Radius N alpha L * Real.sqrt ((N + 1 : ℕ) : ℝ)) =
      alpha := by
  have halpha_ne : alpha ≠ 0 := ne_of_gt halpha
  have hL_ne : L ≠ 0 := ne_of_gt hL
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hsqrt_ne :
      Real.sqrt ((N + 1 : ℕ) : ℝ) ≠ 0 := ne_of_gt hsqrt_pos
  unfold chewi622Radius
  field_simp [halpha_ne, hL_ne, hsqrt_ne]

theorem chewi622Minimizer_norm_eq_radius
    {N : ℕ} {alpha L : ℝ} (halpha : 0 < alpha) (hL : 0 < L) :
    ‖chewi621Minimizer (d := N + 1) alpha (L / 4)‖ =
      chewi622Radius N alpha L := by
  have hR_pos := chewi622Radius_pos (N := N) halpha hL
  have hgamma_ne : L / 4 ≠ 0 := ne_of_gt (by positivity : 0 < L / 4)
  have hnorm :=
    chewi621Minimizer_norm_eq_radius_source_alpha
      (d := N + 1) (R := chewi622Radius N alpha L) (gamma := L / 4)
      hR_pos hgamma_ne
  rw [chewi622_alpha_eq_source_radius (N := N) halpha hL] at hnorm
  exact hnorm

theorem chewi622_zero_dist_minimizer_le_radius
    {N : ℕ} {alpha L : ℝ} (halpha : 0 < alpha) (hL : 0 < L) :
    dist (0 : EuclideanSpace ℝ (Fin (N + 1)))
        (chewi621Minimizer (d := N + 1) alpha (L / 4)) ≤
      chewi622Radius N alpha L := by
  rw [dist_eq_norm, zero_sub, norm_neg]
  exact (chewi622Minimizer_norm_eq_radius (N := N) halpha hL).le

/-- Chewi's displayed 6.22 parameters are `L`-Lipschitz on `B(x_*, R)`. -/
theorem chewi622_source_lipschitz_constant_le
    {N : ℕ} {alpha L : ℝ} (halpha : 0 < alpha) (hL : 0 < L) :
    L / 4 + alpha * (chewi622Radius N alpha L + chewi622Radius N alpha L) ≤
      L := by
  have halpha_ne : alpha ≠ 0 := ne_of_gt halpha
  have hsqrt_pos : 0 < Real.sqrt ((N + 1 : ℕ) : ℝ) := by positivity
  have hsqrt_ne :
      Real.sqrt ((N + 1 : ℕ) : ℝ) ≠ 0 := ne_of_gt hsqrt_pos
  have hsqrt_ge_one :
      1 ≤ Real.sqrt ((N + 1 : ℕ) : ℝ) := by
    rw [Real.one_le_sqrt]
    norm_num
  have hL2_nonneg : 0 ≤ L / 2 := by positivity
  have hterm_eq :
      alpha * (chewi622Radius N alpha L + chewi622Radius N alpha L) =
        (L / 2) / Real.sqrt ((N + 1 : ℕ) : ℝ) := by
    unfold chewi622Radius
    field_simp [halpha_ne, hsqrt_ne]
    ring
  have hterm_le :
      (L / 2) / Real.sqrt ((N + 1 : ℕ) : ℝ) ≤ L / 2 := by
    rw [div_le_iff₀ hsqrt_pos]
    nlinarith [mul_le_mul_of_nonneg_left hsqrt_ge_one hL2_nonneg]
  rw [hterm_eq]
  nlinarith

/--
Source-shaped centered-domain Lipschitz certificate for Theorem 6.22: the
strongly-convex hard objective is `L`-Lipschitz on `B(x_*, R)`.
-/
theorem chewi622HardObjective_lipschitzOnWith_source_closedBall_minimizer
    {N : ℕ} {alpha L : ℝ} (halpha : 0 < alpha) (hL : 0 < L) :
    LipschitzOnWith (Real.toNNReal L)
      (chewi621HardObjective (d := N + 1) alpha (L / 4))
      (Metric.closedBall
        (chewi621Minimizer (d := N + 1) alpha (L / 4))
        (chewi622Radius N alpha L)) := by
  let center : EuclideanSpace ℝ (Fin (N + 1)) :=
    chewi621Minimizer (d := N + 1) alpha (L / 4)
  let R := chewi622Radius N alpha L
  have hR_pos : 0 < R := by
    simpa [R] using chewi622Radius_pos (N := N) halpha hL
  have hgamma_nonneg : 0 ≤ L / 4 := by positivity
  have hcenter_norm : ‖center‖ = R := by
    simpa [center, R] using
      chewi622Minimizer_norm_eq_radius (N := N) halpha hL
  have hbase :
      LipschitzOnWith (Real.toNNReal (L / 4 + alpha * (‖center‖ + R)))
        (chewi621HardObjective (d := N + 1) alpha (L / 4))
        (Metric.closedBall center R) :=
    chewi621HardObjective_lipschitzOnWith_closedBall
      (d := N + 1) (alpha := alpha) (gamma := L / 4) (R := R)
      center halpha.le hgamma_nonneg
  refine LipschitzOnWith.of_le_add_mul' L ?_
  intro x hx y hy
  have hraw := hbase.le_add_mul hx hy
  have hK_nonneg : 0 ≤ L / 4 + alpha * (‖center‖ + R) := by
    rw [hcenter_norm]
    nlinarith [halpha, hL, hR_pos]
  have hK_le : L / 4 + alpha * (‖center‖ + R) ≤ L := by
    rw [hcenter_norm]
    simpa [R] using
      chewi622_source_lipschitz_constant_le
        (N := N) (alpha := alpha) (L := L) halpha hL
  have hcoef :
      (Real.toNNReal (L / 4 + alpha * (‖center‖ + R)) : ℝ) * dist x y ≤
        L * dist x y := by
    rw [Real.coe_toNNReal _ hK_nonneg]
    exact mul_le_mul_of_nonneg_right hK_le dist_nonneg
  nlinarith

/--
Chewi Theorem 6.22 source-rate lower-bound packet for the concrete
`d = N + 1` hard instance.  The same first-max oracle lower-bound construction
with `gamma = L / 4` yields a strongly-convex nonsmooth obstruction of order
`L^2 / (alpha * N)`.
-/
theorem chewi622_gap_ge_source_parameters
    {N : ℕ} {alpha L : ℝ}
    {x : ℕ -> EuclideanSpace ℝ (Fin (N + 1))}
    (halpha : 0 < alpha) (hL : 0 < L)
    (hx0 : x 0 = 0)
    (hspan :
      IsGradientSpanTrajectory
        (chewi621FirstMaxOracle (d := N + 1) alpha (L / 4)) x) :
    L ^ (2 : ℕ) / (32 * alpha * ((N + 1 : ℕ) : ℝ)) ≤
      chewi621HardObjective (d := N + 1) alpha (L / 4) (x N) -
        chewi621HardObjective (d := N + 1) alpha (L / 4)
          (chewi621Minimizer (d := N + 1) alpha (L / 4)) := by
  have hgamma_nonneg : 0 ≤ L / 4 := by positivity
  have hgap :=
    chewi621_gap_ge_minimizer_value_of_firstMaxGradientSpan
      (d := N + 1) (N := N)
      (alpha := alpha) (gamma := L / 4) (x := x)
      halpha hgamma_nonneg (Nat.lt_succ_self N) hx0 hspan
  rw [chewi622_source_parameter_gap_eq (N := N) (alpha := alpha) (L := L)
    (ne_of_gt halpha)] at hgap
  exact hgap

/--
Source-shaped first-order strong-convexity certificate for the concrete
Theorem 6.22 hard instance.
-/
theorem chewi622HardObjective_firstOrderStrongConvexOn_source_univ
    {N : ℕ} {alpha L : ℝ} (hL_nonneg : 0 ≤ L) :
    FirstOrderStrongConvexOn Set.univ
      (chewi621HardObjective (d := N + 1) alpha (L / 4))
      (chewi621FirstMaxOracle (d := N + 1) alpha (L / 4)) alpha := by
  exact
    chewi621HardObjective_firstOrderStrongConvexOn_univ
      (d := N + 1) (alpha := alpha) (gamma := L / 4)
      (div_nonneg hL_nonneg (by norm_num))

end Optimization
end StatInference
