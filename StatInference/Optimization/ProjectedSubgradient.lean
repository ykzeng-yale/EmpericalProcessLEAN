import StatInference.Optimization.Theorem37

/-!
# Chewi Chapter 6 projected subgradient descent layer

This module starts the finite-valued, source-shaped route for Chewi Chapter 6.
It records subgradients, projection characterizations, projected subgradient
steps, and the first supplied-interface convergence theorem for projected
subgradient descent (Theorem 6.14).
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Chewi Definition 6.8, finite-valued subgradient form on a constraint set. -/
def IsSubgradientAt (C : Set E) (f : E -> ℝ) (p x : E) : Prop :=
  x ∈ C ∧ ∀ ⦃y⦄, y ∈ C -> f x + inner ℝ p (y - x) ≤ f y

theorem IsSubgradientAt.mem {C : Set E} {f : E -> ℝ} {p x : E}
    (h : IsSubgradientAt C f p x) :
    x ∈ C :=
  h.1

/-- The subgradient inequality in the source orientation
`f(x)-f(y) <= <p,x-y>`. -/
theorem IsSubgradientAt.gap_le_inner
    {C : Set E} {f : E -> ℝ} {p x y : E}
    (h : IsSubgradientAt C f p x) (hy : y ∈ C) :
    f x - f y ≤ inner ℝ p (x - y) := by
  have hsub := h.2 hy
  have hinner :
      inner ℝ p (y - x) = -inner ℝ p (x - y) := by
    rw [← neg_sub x y, inner_neg_right]
  nlinarith

/--
Chewi Lemma 6.12 characterization interface for a projection onto `C`.

The source inequality is
`<Π_C(x)-x, x' - Π_C(x)> >= 0` for every `x' ∈ C`.
-/
def ProjectionCharacterizationOn (C : Set E) (proj : E -> E) : Prop :=
  (∀ z, proj z ∈ C) ∧
    ∀ z, ∀ ⦃y⦄, y ∈ C -> 0 ≤ inner ℝ (proj z - z) (y - proj z)

theorem ProjectionCharacterizationOn.mem
    {C : Set E} {proj : E -> E}
    (h : ProjectionCharacterizationOn C proj) (z : E) :
    proj z ∈ C :=
  h.1 z

theorem ProjectionCharacterizationOn.characterization
    {C : Set E} {proj : E -> E}
    (h : ProjectionCharacterizationOn C proj) (z : E)
    {y : E} (hy : y ∈ C) :
    0 ≤ inner ℝ (proj z - z) (y - proj z) :=
  h.2 z hy

/-- Chewi Lemma 6.12 implies contraction to every feasible comparison point. -/
theorem ProjectionCharacterizationOn.dist_to_set_le
    {C : Set E} {proj : E -> E}
    (h : ProjectionCharacterizationOn C proj) (z : E)
    {y : E} (hy : y ∈ C) :
    ‖proj z - y‖ ≤ ‖z - y‖ := by
  have hchar := h.characterization z hy
  have hinner_nonneg :
      0 ≤ inner ℝ (z - proj z) (proj z - y) := by
    have hz : z - proj z = -(proj z - z) := by
      module
    have hy' : proj z - y = -(y - proj z) := by
      module
    rw [hz, hy', inner_neg_left, inner_neg_right, neg_neg]
    exact hchar
  have hdecomp :
      z - y = (z - proj z) + (proj z - y) := by
    module
  have hsq :
      ‖proj z - y‖ ^ (2 : ℕ) ≤ ‖z - y‖ ^ (2 : ℕ) := by
    rw [hdecomp, norm_add_sq_real]
    nlinarith [sq_nonneg (‖z - proj z‖), hinner_nonneg]
  exact (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mp hsq

/-- Feasible points are fixed by any map satisfying the projection characterization. -/
theorem ProjectionCharacterizationOn.fixed
    {C : Set E} {proj : E -> E}
    (h : ProjectionCharacterizationOn C proj) {z : E} (hz : z ∈ C) :
    proj z = z := by
  have hdist := h.dist_to_set_le z hz
  have hzero : ‖proj z - z‖ = 0 := by
    have : ‖proj z - z‖ ≤ 0 := by
      simpa using hdist
    exact le_antisymm this (norm_nonneg _)
  exact sub_eq_zero.mp (norm_eq_zero.mp hzero)

/-- Chewi Lemma 6.13: a convex-set projection is non-expansive. -/
theorem ProjectionCharacterizationOn.nonexpansive
    {C : Set E} {proj : E -> E}
    (h : ProjectionCharacterizationOn C proj) (x y : E) :
    ‖proj y - proj x‖ ≤ ‖y - x‖ := by
  let a : E := proj x
  let b : E := proj y
  let d : E := b - a
  have hxchar : 0 ≤ inner ℝ (a - x) d := by
    simpa [a, b, d] using h.characterization x (h.mem y)
  have hychar : 0 ≤ -inner ℝ (b - y) d := by
    have hraw := h.characterization y (h.mem x)
    have hneg : a - b = -d := by
      dsimp [d]
      module
    simpa [a, b, hneg, inner_neg_right] using hraw
  have hsum_nonneg :
      0 ≤ inner ℝ (a - x) d - inner ℝ (b - y) d := by
    nlinarith
  have halg :
      inner ℝ (a - x) d - inner ℝ (b - y) d =
        inner ℝ (y - x) d - ‖d‖ ^ (2 : ℕ) := by
    have hv : (a - x) - (b - y) = (y - x) - d := by
      dsimp [d]
      module
    calc
      inner ℝ (a - x) d - inner ℝ (b - y) d =
          inner ℝ ((a - x) - (b - y)) d := by
            rw [← inner_sub_left]
      _ = inner ℝ ((y - x) - d) d := by
            rw [hv]
      _ = inner ℝ (y - x) d - inner ℝ d d := by
            rw [inner_sub_left]
      _ = inner ℝ (y - x) d - ‖d‖ ^ (2 : ℕ) := by
            rw [real_inner_self_eq_norm_sq]
  have hsq_inner' : ‖d‖ ^ (2 : ℕ) ≤ inner ℝ (y - x) d := by
    nlinarith
  have hsq_inner : ‖d‖ ^ (2 : ℕ) ≤ inner ℝ d (y - x) := by
    simpa [real_inner_comm] using hsq_inner'
  have hcs : inner ℝ d (y - x) ≤ ‖d‖ * ‖y - x‖ :=
    real_inner_le_norm d (y - x)
  have hsq_norm : ‖d‖ ^ (2 : ℕ) ≤ ‖d‖ * ‖y - x‖ :=
    hsq_inner.trans hcs
  by_cases hd : ‖d‖ = 0
  · have hdvec : d = 0 := norm_eq_zero.mp hd
    simp [a, b, d, hdvec]
  · have hdpos : 0 < ‖d‖ :=
      lt_of_le_of_ne (norm_nonneg _) (Ne.symm hd)
    have hnorm_le : ‖d‖ ≤ ‖y - x‖ := by
      nlinarith
    simpa [a, b, d] using hnorm_le

/-- Projection oracle surface used by the PSD proof. -/
def ProjectionOracleOn (C : Set E) (proj : E -> E) : Prop :=
  (∀ z, proj z ∈ C) ∧ ∀ z, ∀ ⦃y⦄, y ∈ C -> ‖proj z - y‖ ≤ ‖z - y‖

omit [InnerProductSpace ℝ E] in
theorem ProjectionOracleOn.mem {C : Set E} {proj : E -> E}
    (h : ProjectionOracleOn C proj) (z : E) :
    proj z ∈ C :=
  h.1 z

omit [InnerProductSpace ℝ E] in
theorem ProjectionOracleOn.dist_to_set_le {C : Set E} {proj : E -> E}
    (h : ProjectionOracleOn C proj) (z : E) {y : E} (hy : y ∈ C) :
    ‖proj z - y‖ ≤ ‖z - y‖ :=
  h.2 z hy

theorem ProjectionCharacterizationOn.toProjectionOracleOn
    {C : Set E} {proj : E -> E}
    (h : ProjectionCharacterizationOn C proj) :
    ProjectionOracleOn C proj :=
  ⟨h.mem, h.dist_to_set_le⟩

/-- Normalized subgradient direction used in the source PSD display. -/
noncomputable def normalizedSubgradient (p : E) : E :=
  (‖p‖⁻¹ : ℝ) • p

theorem normalizedSubgradient_norm {p : E} (hp : p ≠ 0) :
    ‖normalizedSubgradient p‖ = 1 := by
  simpa [normalizedSubgradient] using (norm_smul_inv_norm (𝕜 := ℝ) hp)

/-- Chewi's projected subgradient update. -/
noncomputable def projectedSubgradientStep
    (proj : E -> E) (h : ℝ) (p x : E) : E :=
  proj (x - h • normalizedSubgradient p)

/-- Source-shaped projected subgradient trajectory interface. -/
def IsProjectedSubgradientTrajectory
    (C : Set E) (proj : E -> E) (f : E -> ℝ) (h : ℝ)
    (x p : ℕ -> E) : Prop :=
  (∀ n, x n ∈ C) ∧
    (∀ n, IsSubgradientAt C f (p n) (x n)) ∧
      ∀ n, x (n + 1) = projectedSubgradientStep proj h (p n) (x n)

theorem IsProjectedSubgradientTrajectory.mem
    {C : Set E} {proj : E -> E} {f : E -> ℝ} {h : ℝ}
    {x p : ℕ -> E}
    (ht : IsProjectedSubgradientTrajectory C proj f h x p) (n : ℕ) :
    x n ∈ C :=
  ht.1 n

theorem IsProjectedSubgradientTrajectory.subgradient
    {C : Set E} {proj : E -> E} {f : E -> ℝ} {h : ℝ}
    {x p : ℕ -> E}
    (ht : IsProjectedSubgradientTrajectory C proj f h x p) (n : ℕ) :
    IsSubgradientAt C f (p n) (x n) :=
  ht.2.1 n

theorem IsProjectedSubgradientTrajectory.step
    {C : Set E} {proj : E -> E} {f : E -> ℝ} {h : ℝ}
    {x p : ℕ -> E}
    (ht : IsProjectedSubgradientTrajectory C proj f h x p) (n : ℕ) :
    x (n + 1) = projectedSubgradientStep proj h (p n) (x n) :=
  ht.2.2 n

/-- The source averaged iterate `N⁻¹ ∑_{n<N} x_n`. -/
noncomputable def iterateAverage (x : ℕ -> E) (N : ℕ) : E :=
  (1 / (N : ℝ)) • ∑ n ∈ Finset.range N, x n

theorem convex_value_iterateAverage_le_average
    {C : Set E} {f : E -> ℝ} {x : ℕ -> E} {N : ℕ}
    (hconv : ConvexOn ℝ C f)
    (hmem : ∀ n, n < N -> x n ∈ C)
    (hN : N ≠ 0) :
    f (iterateAverage x N) ≤
      (1 / (N : ℝ)) * ∑ n ∈ Finset.range N, f (x n) := by
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  have hweights :
      (∑ n ∈ Finset.range N, (1 / (N : ℝ))) = 1 := by
    simp [Finset.sum_const, Finset.card_range, nsmul_eq_mul, hN_pos.ne']
  have hjen :=
    hconv.map_sum_le
      (t := Finset.range N) (w := fun _ : ℕ => 1 / (N : ℝ))
      (p := x)
      (fun n _hn => by positivity)
      hweights
      (fun n hn => hmem n (Finset.mem_range.mp hn))
  simpa [iterateAverage, Finset.smul_sum, Finset.mul_sum] using hjen

theorem convex_value_iterateAverage_sub_le_average_gap
    {C : Set E} {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {N : ℕ}
    (hconv : ConvexOn ℝ C f)
    (hmem : ∀ n, n < N -> x n ∈ C)
    (hN : N ≠ 0) :
    f (iterateAverage x N) - f xStar ≤
      (1 / (N : ℝ)) *
        ∑ n ∈ Finset.range N, (f (x n) - f xStar) := by
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  have hjen :=
    convex_value_iterateAverage_le_average
      (C := C) (f := f) (x := x) (N := N) hconv hmem hN
  have hrewrite :
      (1 / (N : ℝ)) * (∑ n ∈ Finset.range N, f (x n)) - f xStar =
        (1 / (N : ℝ)) *
          ∑ n ∈ Finset.range N, (f (x n) - f xStar) := by
    rw [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_range]
    simp [nsmul_eq_mul]
    field_simp [hN_pos.ne']
  nlinarith

/--
One PSD step gives the Chewi Theorem 6.14 squared-distance recurrence.
-/
theorem projectedSubgradient_sqdist_recurrence
    {C : Set E} {proj : E -> E} {f : E -> ℝ} {h L : ℝ}
    {x p xStar : E}
    (hproj : ProjectionOracleOn C proj)
    (hsub : IsSubgradientAt C f p x)
    (hxStar_mem : xStar ∈ C)
    (hmin : f xStar ≤ f x)
    (hp_ne : p ≠ 0)
    (hp_norm_le : ‖p‖ ≤ L)
    (hh_nonneg : 0 ≤ h) :
    ‖projectedSubgradientStep proj h p x - xStar‖ ^ (2 : ℕ) ≤
      ‖x - xStar‖ ^ (2 : ℕ) -
        (2 * h / L) * (f x - f xStar) + h ^ (2 : ℕ) := by
  let u : E := normalizedSubgradient p
  have hproj_dist :
      ‖projectedSubgradientStep proj h p x - xStar‖ ≤
        ‖x - h • u - xStar‖ := by
    simpa [projectedSubgradientStep, u] using
      hproj.dist_to_set_le (x - h • normalizedSubgradient p) hxStar_mem
  have hproj_sq :
      ‖projectedSubgradientStep proj h p x - xStar‖ ^ (2 : ℕ) ≤
        ‖x - h • u - xStar‖ ^ (2 : ℕ) :=
    (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mpr hproj_dist
  have hu_norm : ‖u‖ = 1 := by
    simpa [u] using normalizedSubgradient_norm (p := p) hp_ne
  have hexpand :
      ‖x - h • u - xStar‖ ^ (2 : ℕ) =
        ‖x - xStar‖ ^ (2 : ℕ) -
          2 * h * inner ℝ u (x - xStar) + h ^ (2 : ℕ) := by
    have hdecomp : x - h • u - xStar = (x - xStar) - h • u := by
      module
    rw [hdecomp, norm_sub_sq_real, real_inner_smul_right, norm_smul,
      Real.norm_eq_abs, abs_of_nonneg hh_nonneg, hu_norm]
    rw [real_inner_comm (x - xStar) u]
    ring
  have hgap_inner :
      f x - f xStar ≤ inner ℝ p (x - xStar) :=
    hsub.gap_le_inner hxStar_mem
  have hgap_nonneg : 0 ≤ f x - f xStar := by
    nlinarith
  have hp_norm_pos : 0 < ‖p‖ := norm_pos_iff.mpr hp_ne
  have hinv_le : 1 / L ≤ 1 / ‖p‖ :=
    one_div_le_one_div_of_le hp_norm_pos hp_norm_le
  have hinner_nonneg : 0 ≤ inner ℝ p (x - xStar) :=
    hgap_nonneg.trans hgap_inner
  have hscaled_gap :
      (f x - f xStar) / L ≤ inner ℝ u (x - xStar) := by
    have hleft :
        (1 / L) * (f x - f xStar) ≤
          (1 / ‖p‖) * (f x - f xStar) :=
      mul_le_mul_of_nonneg_right hinv_le hgap_nonneg
    have hright :
        (1 / ‖p‖) * (f x - f xStar) ≤
          (1 / ‖p‖) * inner ℝ p (x - xStar) :=
      mul_le_mul_of_nonneg_left hgap_inner (by positivity)
    have hu_inner :
        inner ℝ u (x - xStar) =
          (1 / ‖p‖) * inner ℝ p (x - xStar) := by
      simp [u, normalizedSubgradient, one_div, real_inner_smul_left]
    calc
      (f x - f xStar) / L
          = (1 / L) * (f x - f xStar) := by ring
      _ ≤ (1 / ‖p‖) * inner ℝ p (x - xStar) := hleft.trans hright
      _ = inner ℝ u (x - xStar) := hu_inner.symm
  have hscaled_mul :
      (2 * h / L) * (f x - f xStar) ≤
        2 * h * inner ℝ u (x - xStar) := by
    have hcoef_nonneg : 0 ≤ 2 * h := by nlinarith
    have hmul := mul_le_mul_of_nonneg_left hscaled_gap hcoef_nonneg
    calc
      (2 * h / L) * (f x - f xStar)
          = 2 * h * ((f x - f xStar) / L) := by ring
      _ ≤ 2 * h * inner ℝ u (x - xStar) := hmul
  calc
    ‖projectedSubgradientStep proj h p x - xStar‖ ^ (2 : ℕ)
        ≤ ‖x - h • u - xStar‖ ^ (2 : ℕ) := hproj_sq
    _ =
        ‖x - xStar‖ ^ (2 : ℕ) -
          2 * h * inner ℝ u (x - xStar) + h ^ (2 : ℕ) := hexpand
    _ ≤
        ‖x - xStar‖ ^ (2 : ℕ) -
          (2 * h / L) * (f x - f xStar) + h ^ (2 : ℕ) := by
        nlinarith

/--
Finite-sum form of the PSD recurrence used in Chewi Theorem 6.14.
-/
theorem projectedSubgradient_gap_average_bound_of_recurrence
    {gap distSq : ℕ -> ℝ} {L h : ℝ} {N : ℕ}
    (hL_pos : 0 < L)
    (hh_pos : 0 < h)
    (hN : N ≠ 0)
    (hdistN_nonneg : 0 ≤ distSq N)
    (hrec : ∀ n, n < N ->
      distSq (n + 1) ≤ distSq n - (2 * h / L) * gap n + h ^ (2 : ℕ)) :
    (1 / (N : ℝ)) * (∑ n ∈ Finset.range N, gap n) ≤
      L / (2 * (N : ℝ) * h) * distSq 0 + L * h / 2 := by
  have hN_pos_nat : 0 < N := Nat.pos_of_ne_zero hN
  have hN_pos : 0 < (N : ℝ) := by
    exact_mod_cast hN_pos_nat
  let A : ℝ := 2 * h / L
  have hA_pos : 0 < A := by
    dsimp [A]
    positivity
  have hstep : ∀ n, n < N ->
      A * gap n ≤ distSq n - distSq (n + 1) + h ^ (2 : ℕ) := by
    intro n hn
    have hr := hrec n hn
    dsimp [A]
    nlinarith
  have hsum_step :
      A * (∑ n ∈ Finset.range N, gap n) ≤
        ∑ n ∈ Finset.range N,
          (distSq n - distSq (n + 1) + h ^ (2 : ℕ)) := by
    rw [Finset.mul_sum]
    exact Finset.sum_le_sum fun n hn => hstep n (Finset.mem_range.mp hn)
  have htel :
      (∑ n ∈ Finset.range N,
          (distSq n - distSq (n + 1) + h ^ (2 : ℕ))) =
        distSq 0 - distSq N + (N : ℝ) * h ^ (2 : ℕ) := by
    rw [Finset.sum_add_distrib, sum_range_sub_succ]
    simp [Finset.sum_const, Finset.card_range, nsmul_eq_mul]
  have hsum_bound :
      A * (∑ n ∈ Finset.range N, gap n) ≤
        distSq 0 + (N : ℝ) * h ^ (2 : ℕ) := by
    nlinarith
  have hS_le :
      (∑ n ∈ Finset.range N, gap n) ≤
        (L / (2 * h)) * (distSq 0 + (N : ℝ) * h ^ (2 : ℕ)) := by
    have hdiv :
        (∑ n ∈ Finset.range N, gap n) ≤
          (distSq 0 + (N : ℝ) * h ^ (2 : ℕ)) / A :=
      (le_div_iff₀ hA_pos).mpr (by simpa [mul_comm] using hsum_bound)
    have hrewrite :
        (distSq 0 + (N : ℝ) * h ^ (2 : ℕ)) / A =
          (L / (2 * h)) * (distSq 0 + (N : ℝ) * h ^ (2 : ℕ)) := by
      dsimp [A]
      field_simp [hL_pos.ne', hh_pos.ne']
    simpa [hrewrite] using hdiv
  have havg :=
    mul_le_mul_of_nonneg_left hS_le (by positivity : 0 ≤ 1 / (N : ℝ))
  calc
    (1 / (N : ℝ)) * (∑ n ∈ Finset.range N, gap n)
        ≤
          (1 / (N : ℝ)) *
            ((L / (2 * h)) *
              (distSq 0 + (N : ℝ) * h ^ (2 : ℕ))) := havg
    _ =
        L / (2 * (N : ℝ) * h) * distSq 0 + L * h / 2 := by
        field_simp [hN_pos.ne', hh_pos.ne']

/--
Chewi Theorem 6.14, supplied-interface finite-valued PSD average-gap bound.

The source uses Lipschitzness through the bound `‖pₙ‖ <= L`; a later bridge can
derive this hypothesis from a suitable Lipschitz/subdifferential theorem.
-/
theorem chewi614_average_gap_bound
    {C : Set E} {proj : E -> E} {f : E -> ℝ}
    {h L : ℝ} {x p : ℕ -> E} {xStar : E} {N : ℕ}
    (hconv : ConvexOn ℝ C f)
    (hproj : ProjectionOracleOn C proj)
    (htraj : IsProjectedSubgradientTrajectory C proj f h x p)
    (hxStar_mem : xStar ∈ C)
    (hmin : ∀ ⦃z⦄, z ∈ C -> f xStar ≤ f z)
    (hp_ne : ∀ n, n < N -> p n ≠ 0)
    (hp_norm_le : ∀ n, n < N -> ‖p n‖ ≤ L)
    (hh_pos : 0 < h)
    (hL_pos : 0 < L)
    (hN : N ≠ 0) :
    f (iterateAverage x N) - f xStar ≤
      L / (2 * (N : ℝ) * h) * ‖x 0 - xStar‖ ^ (2 : ℕ) + L * h / 2 := by
  let gap : ℕ -> ℝ := fun n => f (x n) - f xStar
  let distSq : ℕ -> ℝ := fun n => ‖x n - xStar‖ ^ (2 : ℕ)
  have hrec : ∀ n, n < N ->
      distSq (n + 1) ≤ distSq n - (2 * h / L) * gap n + h ^ (2 : ℕ) := by
    intro n hn
    have hstep :=
      projectedSubgradient_sqdist_recurrence
        (C := C) (proj := proj) (f := f) (h := h) (L := L)
        (x := x n) (p := p n) (xStar := xStar)
        hproj (htraj.subgradient n) hxStar_mem (hmin (htraj.mem n))
        (hp_ne n hn) (hp_norm_le n hn) hh_pos.le
    simpa [distSq, gap, htraj.step n] using hstep
  have hsum_bound :
      (1 / (N : ℝ)) * (∑ n ∈ Finset.range N, gap n) ≤
        L / (2 * (N : ℝ) * h) * distSq 0 + L * h / 2 :=
    projectedSubgradient_gap_average_bound_of_recurrence
      (gap := gap) (distSq := distSq) hL_pos hh_pos hN (sq_nonneg _) hrec
  have hconv_gap :
      f (iterateAverage x N) - f xStar ≤
        (1 / (N : ℝ)) *
          ∑ n ∈ Finset.range N, (f (x n) - f xStar) :=
    convex_value_iterateAverage_sub_le_average_gap
      (C := C) (f := f) (x := x) (xStar := xStar) (N := N)
      hconv (fun n _hn => htraj.mem n) hN
  exact hconv_gap.trans (by simpa [gap, distSq] using hsum_bound)

end Optimization
end StatInference
