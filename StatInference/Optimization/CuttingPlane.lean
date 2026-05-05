import StatInference.Optimization.ProjectedSubgradient

/-!
# Chewi Chapter 6 cutting-plane / center-of-gravity layer

This module opens the source-shaped route for Chewi Lemma 6.18 and Theorem
6.19.  The true Grunbaum/centroid geometry is kept as a supplied interface for
now; the finite volume-shrink recurrence and the convex Lipschitz rate algebra
are proved here.
-/

namespace StatInference
namespace Optimization

open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Source-shaped finite volume shrink interface for cutting-plane schemes. -/
def HasVolumeShrink (vol : ℕ -> ℝ) (lambda : ℝ) : Prop :=
  ∀ n, vol (n + 1) ≤ lambda * vol n

/-- Chewi Theorem 6.19 rate factor `lambda ^ (N / d)`. -/
noncomputable def centerOfGravityRate (lambda : ℝ) (N d : ℕ) : ℝ :=
  lambda ^ ((N : ℝ) / (d : ℝ))

/--
A cutting-plane value certificate: points excluded by the `N`th localization
set have value at least the last queried value `x (N - 1)`.
-/
def IsCuttingPlaneValueCertificate
    (sets : ℕ -> Set E) (f : E -> ℝ) (x : ℕ -> E) (N : ℕ) : Prop :=
  ∀ ⦃z⦄, z ∉ sets N -> f (x (N - 1)) ≤ f z

/--
Source-shaped scaled-candidate data from the proof of Theorem 6.19: a point on
`(1 - t) xStar + t C` that has already been cut away, with diameter bound.
-/
def HasScaledOutsideCandidateWithinDiameter
    (C : Set E) (sets : ℕ -> Set E) (xStar : E) (N : ℕ) (D t : ℝ) : Prop :=
  ∃ y z, y ∈ C ∧ z = (1 - t) • xStar + t • y ∧
    z ∉ sets N ∧ dist y xStar ≤ D

/-- Iterating a uniform volume-shrink recurrence gives the finite power bound. -/
theorem volumeShrink_le_pow
    {vol : ℕ -> ℝ} {lambda : ℝ}
    (hlambda_nonneg : 0 ≤ lambda)
    (hshrink : HasVolumeShrink vol lambda) :
    ∀ N, vol N ≤ lambda ^ N * vol 0 := by
  intro N
  induction N with
  | zero =>
      simp
  | succ N ih =>
      calc
        vol (N + 1) ≤ lambda * vol N := hshrink N
        _ ≤ lambda * (lambda ^ N * vol 0) :=
          mul_le_mul_of_nonneg_left ih hlambda_nonneg
        _ = lambda ^ (N + 1) * vol 0 := by
          rw [pow_succ]
          ring

/-- Ratio form of the volume-shrink recurrence. -/
theorem volumeShrink_ratio_le_pow
    {vol : ℕ -> ℝ} {lambda : ℝ} {N : ℕ}
    (hlambda_nonneg : 0 ≤ lambda)
    (hvol0_pos : 0 < vol 0)
    (hshrink : HasVolumeShrink vol lambda) :
    vol N / vol 0 ≤ lambda ^ N := by
  rw [div_le_iff₀ hvol0_pos]
  exact volumeShrink_le_pow hlambda_nonneg hshrink N

/-- Nonnegativity of the source center-of-gravity rate. -/
theorem centerOfGravityRate_nonneg
    {lambda : ℝ} (hlambda_nonneg : 0 ≤ lambda) (N d : ℕ) :
    0 ≤ centerOfGravityRate lambda N d := by
  simpa [centerOfGravityRate] using
    Real.rpow_nonneg hlambda_nonneg ((N : ℝ) / (d : ℝ))

/--
Convexity and Lipschitzness bound the value of a scaled candidate by
`t * D * L`.
-/
theorem convex_scaled_candidate_gap_le_diameter_lipschitz
    {C : Set E} {f : E -> ℝ} {L D t : ℝ} {xStar y z : E}
    (hconv : ConvexOn ℝ C f)
    (hLip : LipschitzOnWith (Real.toNNReal L) f C)
    (hxStar_mem : xStar ∈ C)
    (hy_mem : y ∈ C)
    (hz : z = (1 - t) • xStar + t • y)
    (ht_nonneg : 0 ≤ t)
    (ht_le_one : t ≤ 1)
    (hL_nonneg : 0 ≤ L)
    (hdist : dist y xStar ≤ D) :
    f z - f xStar ≤ t * (D * L) := by
  have hone_minus_nonneg : 0 ≤ 1 - t := by
    nlinarith
  have hconv_bound :
      f z ≤ (1 - t) * f xStar + t * f y := by
    rw [hz]
    simpa [smul_eq_mul] using
      (hconv.2 hxStar_mem hy_mem hone_minus_nonneg ht_nonneg
        (by ring : (1 - t) + t = 1))
  have hLip_upper :
      f y ≤ f xStar + L * dist y xStar := by
    have hraw := hLip.le_add_mul hy_mem hxStar_mem
    simpa [Real.coe_toNNReal L hL_nonneg] using hraw
  have hgap_y : f y - f xStar ≤ D * L := by
    nlinarith
  have hconv_gap :
      f z - f xStar ≤ t * (f y - f xStar) := by
    calc
      f z - f xStar ≤
          ((1 - t) * f xStar + t * f y) - f xStar := by
            exact sub_le_sub_right hconv_bound (f xStar)
      _ = t * (f y - f xStar) := by
            ring
  calc
    f z - f xStar ≤ t * (f y - f xStar) := hconv_gap
    _ ≤ t * (D * L) := by
          exact mul_le_mul_of_nonneg_left hgap_y ht_nonneg

/--
A scaled candidate outside the localization set gives the Chewi 6.19
one-parameter gap bound.
-/
theorem chewi619_scaled_candidate_gap_bound
    {C : Set E} {sets : ℕ -> Set E} {f : E -> ℝ} {x : ℕ -> E}
    {xStar : E} {N : ℕ} {D L t : ℝ}
    (hconv : ConvexOn ℝ C f)
    (hLip : LipschitzOnWith (Real.toNNReal L) f C)
    (hxStar_mem : xStar ∈ C)
    (hcert : IsCuttingPlaneValueCertificate sets f x N)
    (hcandidate : HasScaledOutsideCandidateWithinDiameter C sets xStar N D t)
    (ht_nonneg : 0 ≤ t)
    (ht_le_one : t ≤ 1)
    (hL_nonneg : 0 ≤ L) :
    f (x (N - 1)) - f xStar ≤ t * (D * L) := by
  rcases hcandidate with ⟨y, z, hy_mem, hz, hz_not_mem, hdist⟩
  have hcandidate_gap :=
    convex_scaled_candidate_gap_le_diameter_lipschitz
      (C := C) (f := f) (L := L) (D := D) (t := t)
      (xStar := xStar) (y := y) (z := z)
      hconv hLip hxStar_mem hy_mem hz ht_nonneg ht_le_one hL_nonneg hdist
  have hcut : f (x (N - 1)) ≤ f z := hcert hz_not_mem
  nlinarith

/--
Order-continuity helper for the final "let `t` decrease to `rho`" step in
Theorem 6.19.
-/
theorem le_mul_of_forall_gt_le_mul
    {a rho S : ℝ} (hS_nonneg : 0 ≤ S)
    (h : ∀ t, rho < t -> a ≤ t * S) :
    a ≤ rho * S := by
  by_cases hS_zero : S = 0
  · have hle := h (rho + 1) (by linarith)
    nlinarith
  · have hS_pos : 0 < S :=
      lt_of_le_of_ne hS_nonneg (Ne.symm hS_zero)
    by_contra hnot
    have hlt : rho * S < a := lt_of_not_ge hnot
    let t : ℝ := (rho + a / S) / 2
    have hrho_lt_a_div : rho < a / S := by
      rw [lt_div_iff₀ hS_pos]
      exact hlt
    have ht : rho < t := by
      dsimp [t]
      nlinarith
    have hle := h t ht
    have htS : t * S = (rho * S + a) / 2 := by
      dsimp [t]
      field_simp [hS_pos.ne']
    have htS_lt_a : t * S < a := by
      rw [htS]
      nlinarith
    nlinarith

omit [NormedAddCommGroup E] [InnerProductSpace ℝ E] in
/--
The source limiting step in Chewi Theorem 6.19: if every `t > rho` supplies
the scaled-candidate bound, then the bound holds at `rho`.
-/
theorem chewi619_gap_le_of_eventual_scaled_bound
    {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {N : ℕ}
    {D L rho : ℝ}
    (hDL_nonneg : 0 ≤ D * L)
    (hbound : ∀ t, rho < t ->
      f (x (N - 1)) - f xStar ≤ t * (D * L)) :
    f (x (N - 1)) - f xStar ≤ rho * (D * L) :=
  le_mul_of_forall_gt_le_mul hDL_nonneg hbound

omit [NormedAddCommGroup E] [InnerProductSpace ℝ E] in
/-- Chewi Theorem 6.19 source-rate wrapper with the displayed rate factor. -/
theorem chewi619_gap_le_centerOfGravityRate_of_eventual_scaled_bound
    {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {N d : ℕ}
    {D L lambda : ℝ}
    (hDL_nonneg : 0 ≤ D * L)
    (hbound : ∀ t, centerOfGravityRate lambda N d < t ->
      f (x (N - 1)) - f xStar ≤ t * (D * L)) :
    f (x (N - 1)) - f xStar ≤
      centerOfGravityRate lambda N d * (D * L) :=
  chewi619_gap_le_of_eventual_scaled_bound hDL_nonneg hbound

omit [NormedAddCommGroup E] [InnerProductSpace ℝ E] in
/-- Same wrapper with the textbook product order `D * L * lambda^(N/d)`. -/
theorem chewi619_gap_le_display_rate_of_eventual_scaled_bound
    {f : E -> ℝ} {x : ℕ -> E} {xStar : E} {N d : ℕ}
    {D L lambda : ℝ}
    (hDL_nonneg : 0 ≤ D * L)
    (hbound : ∀ t, centerOfGravityRate lambda N d < t ->
      f (x (N - 1)) - f xStar ≤ t * (D * L)) :
    f (x (N - 1)) - f xStar ≤
      D * L * centerOfGravityRate lambda N d := by
  calc
    f (x (N - 1)) - f xStar ≤
        centerOfGravityRate lambda N d * (D * L) :=
          chewi619_gap_le_centerOfGravityRate_of_eventual_scaled_bound
            hDL_nonneg hbound
    _ = D * L * centerOfGravityRate lambda N d := by
          ring

end Optimization
end StatInference
