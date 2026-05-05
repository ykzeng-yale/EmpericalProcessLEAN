import StatInference.Optimization.CuttingPlane

/-!
# Chewi Chapter 6 ellipsoid-method layer

This module starts the source-shaped route for Chewi Lemma 6.20.  The exact
matrix update, half-space containment, and determinant/volume calculation are
kept as a step certificate for now; the finite shrink consequence and the link
back to the compiled center-of-gravity rate wrapper are proved here.
-/

namespace StatInference
namespace Optimization

open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Source ellipsoid set `{z : <z-c, Q (z-c)> <= 1}`. -/
def ellipsoidSet (center : E) (invShape : E -> E) : Set E :=
  {z | inner ℝ (z - center) (invShape (z - center)) ≤ 1}

/-- Cutting half-space from the ellipsoid method display. -/
def ellipsoidCutHalfspace (p x : E) : Set E :=
  {z | inner ℝ p z ≤ inner ℝ p x}

/--
Displayed center update in Lemma 6.20, with `sigmaP` standing for
`Sigma_n p_n` and `quad` for `<p_n, Sigma_n p_n>`.
-/
noncomputable def ellipsoidCenterUpdate
    (d : ℕ) (x sigmaP : E) (quad : ℝ) : E :=
  x - (((d : ℝ) + 1)⁻¹ * (Real.sqrt quad)⁻¹) • sigmaP

/-- The source volume ratio from Chewi Lemma 6.20. -/
noncomputable def ellipsoidVolumeRatio (d : ℕ) : ℝ :=
  Real.sqrt
    ((((d : ℝ) - 1) / ((d : ℝ) + 1)) *
      ((((d : ℝ) ^ (2 : ℕ)) /
        (((d : ℝ) ^ (2 : ℕ)) - 1)) ^ d))

/-- Nonnegativity of the displayed ellipsoid volume ratio. -/
theorem ellipsoidVolumeRatio_nonneg (d : ℕ) :
    0 ≤ ellipsoidVolumeRatio d :=
  Real.sqrt_nonneg _

/--
Cleared scalar core of the central-cut containment in Chewi Lemma 6.20.

After reducing the current ellipsoid to the unit ball and aligning the cut with
the first coordinate, write a point as `(t, y)` with `t <= 0` and
`t^2 + ‖y‖^2 <= 1`.  The next ellipsoid has center shifted by
`-1 / (d + 1)` in the cut direction, squared radius `d^2 / (d + 1)^2` in that
direction, and squared radius `d^2 / (d^2 - 1)` in the orthogonal directions.
This theorem is the denominator-cleared inequality behind that containment.
-/
theorem chewi620_standard_cut_scalar_containment_cleared
    {d : ℕ} {t r2 : ℝ}
    (hd : 1 < d)
    (hr2_nonneg : 0 ≤ r2)
    (hball : t ^ (2 : ℕ) + r2 ≤ 1)
    (hcut : t ≤ 0) :
    (((d : ℝ) + 1) ^ (2 : ℕ)) *
        (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
      (((d : ℝ) ^ (2 : ℕ)) - 1) * r2 ≤
        (d : ℝ) ^ (2 : ℕ) := by
  have hd_pos_nat : 0 < d := by omega
  have hD_pos : 0 < (d : ℝ) := by exact_mod_cast hd_pos_nat
  have hD1_pos : 0 < (d : ℝ) + 1 := by positivity
  have hD1_ne : (d : ℝ) + 1 ≠ 0 := ne_of_gt hD1_pos
  have hcoef_nonneg : 0 ≤ (d : ℝ) ^ (2 : ℕ) - 1 := by
    have hD_ge_one : 1 ≤ (d : ℝ) := by exact_mod_cast le_of_lt hd
    nlinarith [sq_nonneg ((d : ℝ) - 1)]
  have ht_sq_le_one : t ^ (2 : ℕ) ≤ 1 := by nlinarith
  have ht_ge_neg_one : -1 ≤ t := by
    nlinarith [sq_nonneg (t + 1)]
  have hr2_le : r2 ≤ 1 - t ^ (2 : ℕ) := by nlinarith
  have hbound :
      (((d : ℝ) + 1) ^ (2 : ℕ)) *
          (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
        (((d : ℝ) ^ (2 : ℕ)) - 1) * r2 ≤
      (((d : ℝ) + 1) ^ (2 : ℕ)) *
          (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
        (((d : ℝ) ^ (2 : ℕ)) - 1) * (1 - t ^ (2 : ℕ)) := by
    have hmul :
        (((d : ℝ) ^ (2 : ℕ)) - 1) * r2 ≤
          (((d : ℝ) ^ (2 : ℕ)) - 1) * (1 - t ^ (2 : ℕ)) :=
      mul_le_mul_of_nonneg_left hr2_le hcoef_nonneg
    nlinarith
  have hidentity :
      (((d : ℝ) + 1) ^ (2 : ℕ)) *
          (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
        (((d : ℝ) ^ (2 : ℕ)) - 1) * (1 - t ^ (2 : ℕ)) =
      (d : ℝ) ^ (2 : ℕ) + 2 * (((d : ℝ) + 1) * (t * (t + 1))) := by
    field_simp [hD1_ne]
    ring
  have ht_prod_nonpos : t * (t + 1) ≤ 0 := by nlinarith
  calc
    (((d : ℝ) + 1) ^ (2 : ℕ)) *
        (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
      (((d : ℝ) ^ (2 : ℕ)) - 1) * r2
        ≤ (((d : ℝ) + 1) ^ (2 : ℕ)) *
            (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
          (((d : ℝ) ^ (2 : ℕ)) - 1) * (1 - t ^ (2 : ℕ)) := hbound
    _ = (d : ℝ) ^ (2 : ℕ) +
          2 * (((d : ℝ) + 1) * (t * (t + 1))) := hidentity
    _ ≤ (d : ℝ) ^ (2 : ℕ) := by nlinarith

/--
Normalized central-cut containment inequality in the source denominator form.
This is the scalar theorem to reuse when instantiating the half-space part of
`IsEllipsoidStepCertificate` for Chewi's displayed matrix update.
-/
theorem chewi620_standard_cut_scalar_containment
    {d : ℕ} {t r2 : ℝ}
    (hd : 1 < d)
    (hr2_nonneg : 0 ≤ r2)
    (hball : t ^ (2 : ℕ) + r2 ≤ 1)
    (hcut : t ≤ 0) :
    ((((d : ℝ) + 1) ^ (2 : ℕ)) / ((d : ℝ) ^ (2 : ℕ))) *
        (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
      ((((d : ℝ) ^ (2 : ℕ)) - 1) / ((d : ℝ) ^ (2 : ℕ))) * r2 ≤
        1 := by
  have hd_pos_nat : 0 < d := by omega
  have hD_pos : 0 < (d : ℝ) := by exact_mod_cast hd_pos_nat
  have hD_sq_pos : 0 < (d : ℝ) ^ (2 : ℕ) := sq_pos_of_pos hD_pos
  have hcleared :=
    chewi620_standard_cut_scalar_containment_cleared
      (d := d) (t := t) (r2 := r2) hd hr2_nonneg hball hcut
  rw [div_mul_eq_mul_div, div_mul_eq_mul_div]
  rw [← add_div]
  rwa [div_le_iff₀ hD_sq_pos, one_mul]

/--
Source-shaped certificate for one Lemma 6.20 ellipsoid step: the next
ellipsoid contains the half-space cut and has the displayed volume ratio.
-/
def IsEllipsoidStepCertificate
    (center nextCenter : E) (invShape nextInvShape : E -> E)
    (p : E) (vol volNext ratio : ℝ) : Prop :=
  ellipsoidSet center invShape ∩ ellipsoidCutHalfspace p center ⊆
      ellipsoidSet nextCenter nextInvShape ∧
    volNext ≤ ratio * vol

theorem IsEllipsoidStepCertificate.halfspace_subset
    {center nextCenter : E} {invShape nextInvShape : E -> E}
    {p : E} {vol volNext ratio : ℝ}
    (h : IsEllipsoidStepCertificate center nextCenter invShape nextInvShape
      p vol volNext ratio) :
    ellipsoidSet center invShape ∩ ellipsoidCutHalfspace p center ⊆
      ellipsoidSet nextCenter nextInvShape :=
  h.1

theorem IsEllipsoidStepCertificate.volume_le
    {center nextCenter : E} {invShape nextInvShape : E -> E}
    {p : E} {vol volNext ratio : ℝ}
    (h : IsEllipsoidStepCertificate center nextCenter invShape nextInvShape
      p vol volNext ratio) :
    volNext ≤ ratio * vol :=
  h.2

/-- The localization sets generated by a sequence of ellipsoids. -/
def ellipsoidSets (center : ℕ -> E) (invShape : ℕ -> E -> E) :
    ℕ -> Set E :=
  fun n => ellipsoidSet (center n) (invShape n)

/-- Source-shaped trajectory certificate for Lemma 6.20 ellipsoid updates. -/
def IsEllipsoidCuttingPlaneTrajectory
    (center p : ℕ -> E) (invShape : ℕ -> E -> E)
    (vol : ℕ -> ℝ) (d : ℕ) : Prop :=
  ∀ n, IsEllipsoidStepCertificate
    (center n) (center (n + 1)) (invShape n) (invShape (n + 1))
    (p n) (vol n) (vol (n + 1)) (ellipsoidVolumeRatio d)

theorem IsEllipsoidCuttingPlaneTrajectory.step
    {center p : ℕ -> E} {invShape : ℕ -> E -> E}
    {vol : ℕ -> ℝ} {d n : ℕ}
    (h : IsEllipsoidCuttingPlaneTrajectory center p invShape vol d) :
    IsEllipsoidStepCertificate
      (center n) (center (n + 1)) (invShape n) (invShape (n + 1))
      (p n) (vol n) (vol (n + 1)) (ellipsoidVolumeRatio d) :=
  h n

theorem IsEllipsoidCuttingPlaneTrajectory.hasVolumeShrink
    {center p : ℕ -> E} {invShape : ℕ -> E -> E}
    {vol : ℕ -> ℝ} {d : ℕ}
    (h : IsEllipsoidCuttingPlaneTrajectory center p invShape vol d) :
    HasVolumeShrink vol (ellipsoidVolumeRatio d) := by
  intro n
  exact (h.step (n := n)).volume_le

theorem IsEllipsoidCuttingPlaneTrajectory.halfspace_subset
    {center p : ℕ -> E} {invShape : ℕ -> E -> E}
    {vol : ℕ -> ℝ} {d n : ℕ}
    (h : IsEllipsoidCuttingPlaneTrajectory center p invShape vol d) :
    ellipsoidSets center invShape n ∩ ellipsoidCutHalfspace (p n) (center n) ⊆
      ellipsoidSets center invShape (n + 1) := by
  simpa [ellipsoidSets] using
    (h.step (n := n)).halfspace_subset

/-- Finite product consequence of the Lemma 6.20 volume-ratio certificate. -/
theorem ellipsoidTrajectory_volume_ratio_le_pow
    {center p : ℕ -> E} {invShape : ℕ -> E -> E}
    {vol : ℕ -> ℝ} {d N : ℕ}
    (h : IsEllipsoidCuttingPlaneTrajectory center p invShape vol d)
    (hvol0_pos : 0 < vol 0) :
    vol N / vol 0 ≤ ellipsoidVolumeRatio d ^ N :=
  volumeShrink_ratio_le_pow
    (ellipsoidVolumeRatio_nonneg d) hvol0_pos h.hasVolumeShrink

/--
Lemma 6.20 plugged into the source-shaped Theorem 6.19 wrapper: a verified
ellipsoid volume trajectory gives the finite volume ratio, and the supplied
candidate geometry gives the displayed optimization rate with the ellipsoid
volume factor.
-/
theorem chewi620_volume_ratio_and_gap_bound_of_scaled_candidates
    {C : Set E} {center p : ℕ -> E} {invShape : ℕ -> E -> E}
    {vol : ℕ -> ℝ} {f : E -> ℝ} {xStar : E}
    {N d : ℕ} {D L : ℝ}
    (htraj : IsEllipsoidCuttingPlaneTrajectory center p invShape vol d)
    (hvol0_pos : 0 < vol 0)
    (hconv : ConvexOn ℝ C f)
    (hLip : LipschitzOnWith (Real.toNNReal L) f C)
    (hxStar_mem : xStar ∈ C)
    (hcert :
      IsCuttingPlaneValueCertificate (ellipsoidSets center invShape) f center N)
    (hrate_lt_one :
      centerOfGravityRate (ellipsoidVolumeRatio d) N d < 1)
    (hD_nonneg : 0 ≤ D)
    (hL_nonneg : 0 ≤ L)
    (hcandidates :
      HasScaledOutsideCandidatesAbove C (ellipsoidSets center invShape) xStar N D
        (centerOfGravityRate (ellipsoidVolumeRatio d) N d)) :
    vol N / vol 0 ≤ ellipsoidVolumeRatio d ^ N ∧
      f (center (N - 1)) - f xStar ≤
        D * L * centerOfGravityRate (ellipsoidVolumeRatio d) N d := by
  constructor
  · exact ellipsoidTrajectory_volume_ratio_le_pow htraj hvol0_pos
  · exact
      chewi619_gap_le_display_rate_of_scaled_candidates
        (C := C) (sets := ellipsoidSets center invShape) (f := f)
        (x := center) (xStar := xStar) (N := N) (d := d)
        (D := D) (L := L) (lambda := ellipsoidVolumeRatio d)
        hconv hLip hxStar_mem hcert
        (ellipsoidVolumeRatio_nonneg d) hrate_lt_one
        hD_nonneg hL_nonneg hcandidates

end Optimization
end StatInference
