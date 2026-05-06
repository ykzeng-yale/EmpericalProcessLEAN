import StatInference.Optimization.LowerBounds

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

end Optimization
end StatInference
