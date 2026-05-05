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
Nonnegativity of the source square-root argument in Chewi Lemma 6.20's volume
ratio display.
-/
theorem chewi620_ellipsoidVolumeRatio_source_nonneg
    {d : ℕ} (hd : 1 < d) :
    0 ≤
      (((d : ℝ) - 1) / ((d : ℝ) + 1)) *
        ((((d : ℝ) ^ (2 : ℕ)) /
          (((d : ℝ) ^ (2 : ℕ)) - 1)) ^ d) := by
  have hD_gt_one : 1 < (d : ℝ) := by exact_mod_cast hd
  have hleft_nonneg : 0 ≤ ((d : ℝ) - 1) / ((d : ℝ) + 1) := by
    exact div_nonneg (by linarith) (by positivity)
  have hden_pos : 0 < (d : ℝ) ^ (2 : ℕ) - 1 := by
    nlinarith [sq_pos_of_pos (show 0 < (d : ℝ) - 1 by linarith)]
  have hbase_nonneg :
      0 ≤ ((d : ℝ) ^ (2 : ℕ)) /
        (((d : ℝ) ^ (2 : ℕ)) - 1) :=
    div_nonneg (sq_nonneg (d : ℝ)) hden_pos.le
  exact mul_nonneg hleft_nonneg (pow_nonneg hbase_nonneg d)

/--
Scalar determinant algebra for the normalized standard-cut ellipsoid.

In coordinates where the current ellipsoid is the unit ball and the cut is the
first coordinate half-space, the next ellipsoid has squared axis factor
`d^2 / (d + 1)^2` in the cut direction and
`d^2 / (d^2 - 1)` in each of the remaining `d - 1` directions.  Their product
is exactly Chewi's displayed square-root argument.
-/
theorem chewi620_standardCut_detRatio_eq_source
    {d : ℕ} (hd : 1 < d) :
    (((d : ℝ) ^ (2 : ℕ)) / (((d : ℝ) + 1) ^ (2 : ℕ))) *
        ((((d : ℝ) ^ (2 : ℕ)) /
          (((d : ℝ) ^ (2 : ℕ)) - 1)) ^ (d - 1)) =
      (((d : ℝ) - 1) / ((d : ℝ) + 1)) *
        ((((d : ℝ) ^ (2 : ℕ)) /
          (((d : ℝ) ^ (2 : ℕ)) - 1)) ^ d) := by
  have hD_gt_one : 1 < (d : ℝ) := by exact_mod_cast hd
  have hD1_ne : (d : ℝ) + 1 ≠ 0 := by positivity
  have hDsq_minus_ne : (d : ℝ) ^ (2 : ℕ) - 1 ≠ 0 := by
    nlinarith [sq_pos_of_pos (show 0 < (d : ℝ) - 1 by linarith)]
  let q : ℝ :=
    ((d : ℝ) ^ (2 : ℕ)) /
      (((d : ℝ) ^ (2 : ℕ)) - 1)
  have hpow :
      q ^ d = q ^ (d - 1) * q := by
    calc
      q ^ d = q ^ ((d - 1) + 1) := by
        congr 1
        omega
      _ = q ^ (d - 1) * q := by
        rw [pow_succ]
  have hcoef :
      ((d : ℝ) ^ (2 : ℕ)) / (((d : ℝ) + 1) ^ (2 : ℕ)) =
        (((d : ℝ) - 1) / ((d : ℝ) + 1)) * q := by
    dsimp [q]
    field_simp [hD1_ne, hDsq_minus_ne]
    ring
  change
    (((d : ℝ) ^ (2 : ℕ)) / (((d : ℝ) + 1) ^ (2 : ℕ))) *
        q ^ (d - 1) =
      (((d : ℝ) - 1) / ((d : ℝ) + 1)) * q ^ d
  rw [hpow, hcoef]
  ring

/--
Chewi Lemma 6.20's displayed `ellipsoidVolumeRatio` is the square root of the
standard-cut determinant ratio.
-/
theorem chewi620_ellipsoidVolumeRatio_sq_eq_standardCut_detRatio
    {d : ℕ} (hd : 1 < d) :
    ellipsoidVolumeRatio d ^ (2 : ℕ) =
      (((d : ℝ) ^ (2 : ℕ)) / (((d : ℝ) + 1) ^ (2 : ℕ))) *
        ((((d : ℝ) ^ (2 : ℕ)) /
          (((d : ℝ) ^ (2 : ℕ)) - 1)) ^ (d - 1)) := by
  rw [ellipsoidVolumeRatio]
  rw [Real.sq_sqrt (chewi620_ellipsoidVolumeRatio_source_nonneg hd)]
  exact (chewi620_standardCut_detRatio_eq_source (d := d) hd).symm

/-- Center of the normalized standard central-cut ellipsoid. -/
noncomputable def chewi620StandardCutCenter (d : ℕ) (u : E) : E :=
  -(((d : ℝ) + 1)⁻¹) • u

/--
Inverse-shape operator for the normalized standard central-cut ellipsoid.  The
direction `u` is the cut direction; the theorem below assumes `‖u‖ = 1`.
-/
noncomputable def chewi620StandardCutInvShape (d : ℕ) (u : E) (z : E) : E :=
  (((((d : ℝ) + 1) ^ (2 : ℕ)) / ((d : ℝ) ^ (2 : ℕ))) *
      inner ℝ u z) • u +
    ((((d : ℝ) ^ (2 : ℕ) - 1) / ((d : ℝ) ^ (2 : ℕ))) •
      (z - (inner ℝ u z) • u))

/--
Pythagoras for the decomposition into a unit direction and its orthogonal
residual.  This is the coordinate-free replacement for writing
`‖z‖² = t² + ‖y‖²` in the normalized Lemma 6.20 proof.
-/
theorem chewi620_norm_sq_eq_inner_sq_add_orthogonal_sq
    {u z : E} (hu_norm : ‖u‖ = 1) :
    ‖z‖ ^ (2 : ℕ) =
      (inner ℝ u z) ^ (2 : ℕ) +
        ‖z - (inner ℝ u z) • u‖ ^ (2 : ℕ) := by
  let t : ℝ := inner ℝ u z
  have hres :
      ‖z - t • u‖ ^ (2 : ℕ) =
        ‖z‖ ^ (2 : ℕ) - t ^ (2 : ℕ) := by
    rw [norm_sub_sq_real, real_inner_smul_right, norm_smul, hu_norm, mul_one,
      Real.norm_eq_abs, sq_abs]
    have hzu : inner ℝ z u = t := by
      dsimp [t]
      rw [real_inner_comm]
    rw [hzu]
    ring
  change
    ‖z‖ ^ (2 : ℕ) =
      t ^ (2 : ℕ) + ‖z - t • u‖ ^ (2 : ℕ)
  nlinarith

/-- Quadratic form of the normalized standard-cut inverse shape. -/
theorem chewi620_standardCutInvShape_quadratic
    {d : ℕ} {u z : E} (hu_norm : ‖u‖ = 1) :
    inner ℝ z (chewi620StandardCutInvShape d u z) =
      ((((d : ℝ) + 1) ^ (2 : ℕ)) / ((d : ℝ) ^ (2 : ℕ))) *
          (inner ℝ u z) ^ (2 : ℕ) +
        ((((d : ℝ) ^ (2 : ℕ) - 1) / ((d : ℝ) ^ (2 : ℕ))) *
          ‖z - (inner ℝ u z) • u‖ ^ (2 : ℕ)) := by
  let t : ℝ := inner ℝ u z
  let q : E := z - t • u
  let a : ℝ := (((d : ℝ) + 1) ^ (2 : ℕ)) / ((d : ℝ) ^ (2 : ℕ))
  let b : ℝ := (((d : ℝ) ^ (2 : ℕ) - 1) / ((d : ℝ) ^ (2 : ℕ)))
  have huu : inner ℝ u u = 1 := by
    rw [real_inner_self_eq_norm_sq, hu_norm]
    norm_num
  have horth_uq : inner ℝ u q = 0 := by
    dsimp [q, t]
    rw [inner_sub_right, real_inner_smul_right, huu]
    ring
  have horth_qu : inner ℝ q u = 0 := by
    simpa [real_inner_comm q u] using horth_uq
  have hz_decomp : z = t • u + q := by
    dsimp [q, t]
    module
  change inner ℝ z (((a * t) • u) + b • q) =
      a * t ^ (2 : ℕ) + b * ‖q‖ ^ (2 : ℕ)
  rw [hz_decomp]
  simp [inner_add_left, inner_add_right, inner_smul_left, inner_smul_right,
    horth_uq, horth_qu, hu_norm]
  ring

/--
Coordinate-free normalized half-space containment for Chewi Lemma 6.20.  This
is the affine-normalized version of the ellipsoid update before inserting a
concrete matrix square-root/change-of-variables for `Σ_n`.
-/
theorem chewi620_standardCut_halfspace_subset
    {d : ℕ} {u : E} (hd : 1 < d) (hu_norm : ‖u‖ = 1) :
    ellipsoidSet (0 : E) (fun z => z) ∩
        ellipsoidCutHalfspace u (0 : E) ⊆
      ellipsoidSet (chewi620StandardCutCenter d u)
        (chewi620StandardCutInvShape d u) := by
  intro z hz
  let t : ℝ := inner ℝ u z
  let r2 : ℝ := ‖z - t • u‖ ^ (2 : ℕ)
  have hz_ball : ‖z‖ ^ (2 : ℕ) ≤ 1 := by
    simpa [ellipsoidSet, real_inner_self_eq_norm_sq] using hz.1
  have hz_cut : t ≤ 0 := by
    simpa [ellipsoidCutHalfspace, t] using hz.2
  have hr2_nonneg : 0 ≤ r2 := sq_nonneg _
  have hpyth :
      ‖z‖ ^ (2 : ℕ) = t ^ (2 : ℕ) + r2 := by
    simpa [t, r2] using
      chewi620_norm_sq_eq_inner_sq_add_orthogonal_sq
        (u := u) (z := z) hu_norm
  have hball : t ^ (2 : ℕ) + r2 ≤ 1 := by
    nlinarith
  have hscalar :
      ((((d : ℝ) + 1) ^ (2 : ℕ)) / ((d : ℝ) ^ (2 : ℕ))) *
          (t + (((d : ℝ) + 1)⁻¹)) ^ (2 : ℕ) +
        ((((d : ℝ) ^ (2 : ℕ)) - 1) / ((d : ℝ) ^ (2 : ℕ))) * r2 ≤
          1 :=
    chewi620_standard_cut_scalar_containment
      (d := d) (t := t) (r2 := r2) hd hr2_nonneg hball hz_cut
  have hcenter_sub :
      z - chewi620StandardCutCenter d u =
        z + (((d : ℝ) + 1)⁻¹) • u := by
    simp [chewi620StandardCutCenter, sub_eq_add_neg]
  have hinner_shift :
      inner ℝ u (z - chewi620StandardCutCenter d u) =
        t + (((d : ℝ) + 1)⁻¹) := by
    rw [hcenter_sub]
    simp [t, inner_add_right, real_inner_smul_right, hu_norm]
  have horth_shift :
      (z - chewi620StandardCutCenter d u) -
          inner ℝ u (z - chewi620StandardCutCenter d u) • u =
        z - t • u := by
    rw [hinner_shift, hcenter_sub]
    module
  have hquad :=
    chewi620_standardCutInvShape_quadratic
      (d := d) (u := u) (z := z - chewi620StandardCutCenter d u) hu_norm
  change
    inner ℝ (z - chewi620StandardCutCenter d u)
        (chewi620StandardCutInvShape d u
          (z - chewi620StandardCutCenter d u)) ≤ 1
  rw [hquad, horth_shift, hinner_shift]
  simpa [r2] using hscalar

/--
Affine transport of the normalized half-space containment in Chewi Lemma 6.20.

The map `toStd` is the still-supplied normalization sending the current
ellipsoid to the unit ball and the current cut to the normalized cut direction
`u`.  This theorem isolates the exact matrix work left for the displayed
`Σ_n` update: prove the three quadratic/cut identities below, then the
containment part of the ellipsoid step follows from
`chewi620_standardCut_halfspace_subset`.
-/
theorem chewi620_affineTransport_halfspace_subset_of_quadratic
    {d : ℕ} {center nextCenter : E} {invShape nextInvShape : E -> E}
    {p u : E} {toStd : E -> E} {scale : ℝ}
    (hd : 1 < d) (hu_norm : ‖u‖ = 1) (hscale_pos : 0 < scale)
    (hcurrent :
      ∀ z,
        inner ℝ (z - center) (invShape (z - center)) =
          ‖toStd (z - center)‖ ^ (2 : ℕ))
    (hcut :
      ∀ z,
        inner ℝ u (toStd (z - center)) =
          scale * (inner ℝ p z - inner ℝ p center))
    (hnext :
      ∀ z,
        inner ℝ (z - nextCenter) (nextInvShape (z - nextCenter)) =
          inner ℝ
            (toStd (z - center) - chewi620StandardCutCenter d u)
            (chewi620StandardCutInvShape d u
              (toStd (z - center) - chewi620StandardCutCenter d u))) :
    ellipsoidSet center invShape ∩ ellipsoidCutHalfspace p center ⊆
      ellipsoidSet nextCenter nextInvShape := by
  intro z hz
  have hz_ball_sq : ‖toStd (z - center)‖ ^ (2 : ℕ) ≤ 1 := by
    have hz_current := hz.1
    change inner ℝ (z - center) (invShape (z - center)) ≤ 1 at hz_current
    rwa [hcurrent z] at hz_current
  have hz_ball :
      toStd (z - center) ∈ ellipsoidSet (0 : E) (fun w => w) := by
    simpa [ellipsoidSet, real_inner_self_eq_norm_sq] using hz_ball_sq
  have hdiff_nonpos : inner ℝ p z - inner ℝ p center ≤ 0 := by
    have hz_cut_original := hz.2
    change inner ℝ p z ≤ inner ℝ p center at hz_cut_original
    exact sub_nonpos.mpr hz_cut_original
  have hz_cut :
      toStd (z - center) ∈ ellipsoidCutHalfspace u (0 : E) := by
    have hscaled_nonpos :
        scale * (inner ℝ p z - inner ℝ p center) ≤ 0 :=
      mul_nonpos_of_nonneg_of_nonpos hscale_pos.le hdiff_nonpos
    change inner ℝ u (toStd (z - center)) ≤ inner ℝ u (0 : E)
    rw [hcut z]
    simpa using hscaled_nonpos
  have hz_std :
      toStd (z - center) ∈
        ellipsoidSet (chewi620StandardCutCenter d u)
          (chewi620StandardCutInvShape d u) :=
    (chewi620_standardCut_halfspace_subset
      (d := d) (u := u) hd hu_norm) ⟨hz_ball, hz_cut⟩
  simpa [ellipsoidSet, hnext z] using hz_std

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

/--
Affine-transport instantiation of the full supplied ellipsoid-step certificate.
The remaining volume hypothesis is exactly the determinant/measure-scaling
part of Chewi Lemma 6.20; the containment part is discharged by
`chewi620_affineTransport_halfspace_subset_of_quadratic`.
-/
theorem chewi620_affineTransport_stepCertificate_of_quadratic
    {d : ℕ} {center nextCenter : E} {invShape nextInvShape : E -> E}
    {p u : E} {toStd : E -> E} {scale vol volNext : ℝ}
    (hd : 1 < d) (hu_norm : ‖u‖ = 1) (hscale_pos : 0 < scale)
    (hcurrent :
      ∀ z,
        inner ℝ (z - center) (invShape (z - center)) =
          ‖toStd (z - center)‖ ^ (2 : ℕ))
    (hcut :
      ∀ z,
        inner ℝ u (toStd (z - center)) =
          scale * (inner ℝ p z - inner ℝ p center))
    (hnext :
      ∀ z,
        inner ℝ (z - nextCenter) (nextInvShape (z - nextCenter)) =
          inner ℝ
            (toStd (z - center) - chewi620StandardCutCenter d u)
            (chewi620StandardCutInvShape d u
              (toStd (z - center) - chewi620StandardCutCenter d u)))
    (hvolume : volNext ≤ ellipsoidVolumeRatio d * vol) :
    IsEllipsoidStepCertificate center nextCenter invShape nextInvShape
      p vol volNext (ellipsoidVolumeRatio d) := by
  exact ⟨
    chewi620_affineTransport_halfspace_subset_of_quadratic
      (d := d) (center := center) (nextCenter := nextCenter)
      (invShape := invShape) (nextInvShape := nextInvShape)
      (p := p) (u := u) (toStd := toStd) (scale := scale)
      hd hu_norm hscale_pos hcurrent hcut hnext,
    hvolume⟩

/--
Raw adjoint identity for the square-root normalization in Chewi Lemma 6.20.

When `T` is the symmetric square-root factor `Σ^{1/2}`, its inverse
`T.symm` is the normalization map `Σ^{-1/2}`.  This proves the source identity
`<Σ^{1/2}p, Σ^{-1/2}(z-center)> = <p,z> - <p,center>` from symmetry and
inverse cancellation alone.
-/
theorem chewi620_rawAdjointIdentity_of_symmetric_inverse
    {T : E ≃ₗ[ℝ] E}
    (hT_symm : T.IsSymmetric)
    (p center z : E) :
    inner ℝ (T p) (T.symm (z - center)) =
      inner ℝ p z - inner ℝ p center := by
  calc
    inner ℝ (T p) (T.symm (z - center)) =
        inner ℝ p (T (T.symm (z - center))) := by
      simpa using hT_symm p (T.symm (z - center))
    _ = inner ℝ p (z - center) := by
      simp
    _ = inner ℝ p z - inner ℝ p center := by
      rw [inner_sub_right]

/--
Current inverse-shape obtained by pulling back the unit-ball quadratic through
the normalization map `T.symm`, intended as `Σ^{-1/2} ∘ Σ^{-1/2}`.
-/
noncomputable def chewi620PullbackIdentityInvShape
    (T : E ≃ₗ[ℝ] E) (y : E) : E :=
  T.symm (T.symm y)

/--
Next inverse-shape obtained by pulling back the normalized standard-cut
inverse-shape through the normalization map `T.symm`.
-/
noncomputable def chewi620PullbackStandardCutInvShape
    (d : ℕ) (u : E) (T : E ≃ₗ[ℝ] E) (y : E) : E :=
  T.symm (chewi620StandardCutInvShape d u (T.symm y))

/-- Quadratic form for the current pullback inverse-shape. -/
theorem chewi620_pullbackIdentityInvShape_quadratic
    {T : E ≃ₗ[ℝ] E} (hT_symm : T.IsSymmetric) (y : E) :
    inner ℝ y (chewi620PullbackIdentityInvShape T y) =
      ‖T.symm y‖ ^ (2 : ℕ) := by
  have hsymm_inv : T.symm.IsSymmetric := hT_symm.toLinearMap_symm
  calc
    inner ℝ y (chewi620PullbackIdentityInvShape T y) =
        inner ℝ (T.symm y) (T.symm y) := by
      exact (hsymm_inv y (T.symm y)).symm
    _ = ‖T.symm y‖ ^ (2 : ℕ) := by
      rw [real_inner_self_eq_norm_sq]

/-- Quadratic form for the next standard-cut pullback inverse-shape. -/
theorem chewi620_pullbackStandardCutInvShape_quadratic
    {d : ℕ} {u : E} {T : E ≃ₗ[ℝ] E}
    (hT_symm : T.IsSymmetric) (y : E) :
    inner ℝ y (chewi620PullbackStandardCutInvShape d u T y) =
      inner ℝ (T.symm y)
        (chewi620StandardCutInvShape d u (T.symm y)) := by
  have hsymm_inv : T.symm.IsSymmetric := hT_symm.toLinearMap_symm
  exact (hsymm_inv y (chewi620StandardCutInvShape d u (T.symm y))).symm

/--
The pulled-back next inverse-shape supplies the `hnext` identity in the affine
transport certificate, once the original-space center is the image of the
normalized standard-cut center.
-/
theorem chewi620_pullbackStandardCutInvShape_hnext
    {d : ℕ} {u center nextCenter z : E} {T : E ≃ₗ[ℝ] E}
    (hT_symm : T.IsSymmetric)
    (hcenter :
      nextCenter - center = T (chewi620StandardCutCenter d u)) :
    inner ℝ (z - nextCenter)
        (chewi620PullbackStandardCutInvShape d u T (z - nextCenter)) =
      inner ℝ
        (T.symm (z - center) - chewi620StandardCutCenter d u)
        (chewi620StandardCutInvShape d u
          (T.symm (z - center) - chewi620StandardCutCenter d u)) := by
  have hstd :
      T.symm (z - nextCenter) =
        T.symm (z - center) - chewi620StandardCutCenter d u := by
    calc
      T.symm (z - nextCenter) =
          T.symm ((z - center) - (nextCenter - center)) := by
        congr 1
        module
      _ = T.symm (z - center) - T.symm (nextCenter - center) := by
        simp
      _ = T.symm (z - center) - chewi620StandardCutCenter d u := by
        rw [hcenter]
        simp
  rw [chewi620_pullbackStandardCutInvShape_quadratic hT_symm]
  rw [hstd]

section EuclideanMatrix

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/--
Matrix-backed inverse-shape operator on Euclidean coordinate space.  This is
the concrete finite-dimensional representation used by Chewi's displayed
`Σ_n^{-1}` and `Σ_{n+1}^{-1}` quadratic forms.
-/
noncomputable def matrixInvShape (A : Matrix ι ι ℝ) :
    EuclideanSpace ℝ ι -> EuclideanSpace ℝ ι :=
  fun z => A.toEuclideanLin z

@[simp]
theorem matrixInvShape_apply (A : Matrix ι ι ℝ) (z : EuclideanSpace ℝ ι) :
    matrixInvShape A z = A.toEuclideanLin z :=
  rfl

/--
Coordinate expression for the quadratic form induced by a matrix-backed
inverse shape.  This is the reusable bridge from `ellipsoidSet`'s inner-product
surface to mathlib's `dotProduct`/`mulVec` matrix API.
-/
theorem matrixInvShape_quadratic_eq_dotProduct
    (A : Matrix ι ι ℝ) (z : EuclideanSpace ℝ ι) :
    inner ℝ z (matrixInvShape A z) = z.ofLp ⬝ᵥ A.mulVec z.ofLp := by
  simp [matrixInvShape, EuclideanSpace.inner_eq_star_dotProduct,
    Matrix.toEuclideanLin, Matrix.toLpLin_apply, dotProduct_comm]

/-- Positive-semidefinite matrices give nonnegative ellipsoid quadratic forms. -/
theorem matrixInvShape_quadratic_nonneg_of_posSemidef
    {A : Matrix ι ι ℝ} (hA : A.PosSemidef) (z : EuclideanSpace ℝ ι) :
    0 ≤ inner ℝ z (matrixInvShape A z) := by
  rw [matrixInvShape_quadratic_eq_dotProduct]
  simpa using hA.dotProduct_mulVec_nonneg z.ofLp

/-- Positive-definite matrices give positive quadratic forms away from zero. -/
theorem matrixInvShape_quadratic_pos_of_posDef
    {A : Matrix ι ι ℝ} (hA : A.PosDef)
    {z : EuclideanSpace ℝ ι} (hz : z ≠ 0) :
    0 < inner ℝ z (matrixInvShape A z) := by
  rw [matrixInvShape_quadratic_eq_dotProduct]
  have hz_ofLp : z.ofLp ≠ 0 := by
    intro hz0
    apply hz
    ext i
    exact congrFun hz0 i
  simpa using hA.dotProduct_mulVec_pos hz_ofLp

/--
Composition law for matrix-backed inverse-shape operators.  This is the
Euclidean-space version of `(A * B) z = A (B z)`.
-/
theorem matrixInvShape_mul
    (A B : Matrix ι ι ℝ) (z : EuclideanSpace ℝ ι) :
    matrixInvShape (A * B) z = matrixInvShape A (matrixInvShape B z) := by
  ext i
  simp [matrixInvShape, Matrix.toEuclideanLin, Matrix.toLpLin_apply,
    Matrix.mulVec_mulVec]

/-- Positive-definite matrices have positive determinant. -/
theorem chewi620_matrixPosDef_det_pos
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    0 < Sigma.det :=
  hSigma.det_pos

/-- Positive-definite matrices have nonzero determinant. -/
theorem chewi620_matrixPosDef_det_ne_zero
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma.det ≠ 0 :=
  ne_of_gt (chewi620_matrixPosDef_det_pos hSigma)

/-- Positive-definite matrices have a unit determinant, the key nonsingular-inverse hypothesis. -/
theorem chewi620_matrixPosDef_det_isUnit
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    IsUnit Sigma.det :=
  (Matrix.isUnit_iff_isUnit_det (A := Sigma)).mp hSigma.isUnit

/-- The nonsingular inverse of a positive-definite matrix is positive definite. -/
theorem chewi620_matrixPosDef_inv
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma⁻¹.PosDef :=
  hSigma.inv

/-- Right inverse cancellation for a positive-definite matrix. -/
theorem chewi620_matrixPosDef_mul_inv
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma * Sigma⁻¹ = 1 :=
  Matrix.mul_nonsing_inv Sigma (chewi620_matrixPosDef_det_isUnit hSigma)

/-- Left inverse cancellation for a positive-definite matrix. -/
theorem chewi620_matrixPosDef_inv_mul
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma⁻¹ * Sigma = 1 :=
  Matrix.nonsing_inv_mul Sigma (chewi620_matrixPosDef_det_isUnit hSigma)

/-- Right cancellation through the nonsingular inverse of a positive-definite matrix. -/
theorem chewi620_matrixPosDef_mul_inv_cancel_right
    {Sigma B : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    B * Sigma * Sigma⁻¹ = B :=
  Matrix.mul_nonsing_inv_cancel_right Sigma B
    (chewi620_matrixPosDef_det_isUnit hSigma)

/-- Left cancellation through the nonsingular inverse of a positive-definite matrix. -/
theorem chewi620_matrixPosDef_inv_mul_cancel_left
    {Sigma B : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma⁻¹ * (Sigma * B) = B :=
  Matrix.nonsing_inv_mul_cancel_left Sigma B
    (chewi620_matrixPosDef_det_isUnit hSigma)

/-- Determinant product identity for the nonsingular inverse of a positive-definite matrix. -/
theorem chewi620_matrixPosDef_det_inv_mul_det
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma⁻¹.det * Sigma.det = 1 :=
  Matrix.det_nonsing_inv_mul_det Sigma
    (chewi620_matrixPosDef_det_isUnit hSigma)

/-- The nonsingular inverse of the nonsingular inverse returns a positive-definite matrix. -/
theorem chewi620_matrixPosDef_inv_inv
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef) :
    Sigma⁻¹⁻¹ = Sigma :=
  Matrix.nonsing_inv_nonsing_inv Sigma
    (chewi620_matrixPosDef_det_isUnit hSigma)

/-- Matrix-backed shape cancellation `Σ (Σ⁻¹ z) = z`. -/
theorem matrixInvShape_mul_inv_cancel
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    (z : EuclideanSpace ℝ ι) :
    matrixInvShape Sigma (matrixInvShape Sigma⁻¹ z) = z := by
  rw [← matrixInvShape_mul]
  rw [chewi620_matrixPosDef_mul_inv hSigma]
  simp [matrixInvShape]

/-- Matrix-backed shape cancellation `Σ⁻¹ (Σ z) = z`. -/
theorem matrixInvShape_inv_mul_cancel
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    (z : EuclideanSpace ℝ ι) :
    matrixInvShape Sigma⁻¹ (matrixInvShape Sigma z) = z := by
  rw [← matrixInvShape_mul]
  rw [chewi620_matrixPosDef_inv_mul hSigma]
  simp [matrixInvShape]

/--
If a linear equivalence `T` squares to Chewi's forward shape matrix `Σ`, then
the current pullback inverse-shape is the displayed `Σ⁻¹` inverse shape.
-/
theorem chewi620_pullbackIdentityInvShape_eq_matrixInvShape_inv
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_sq : ∀ y, T (T y) = matrixInvShape Sigma y)
    (y : EuclideanSpace ℝ ι) :
    chewi620PullbackIdentityInvShape T y = matrixInvShape Sigma⁻¹ y := by
  let v : EuclideanSpace ℝ ι := chewi620PullbackIdentityInvShape T y
  have hvT : T (T v) = y := by
    simp [v, chewi620PullbackIdentityInvShape]
  have hvSigma : matrixInvShape Sigma v = y := by
    rw [← hT_sq v]
    exact hvT
  calc
    chewi620PullbackIdentityInvShape T y = v := rfl
    _ = matrixInvShape Sigma⁻¹ (matrixInvShape Sigma v) := by
      exact (matrixInvShape_inv_mul_cancel hSigma v).symm
    _ = matrixInvShape Sigma⁻¹ y := by
      rw [hvSigma]

/--
Set-level version of the current-shape pullback identity.  This identifies the
affine-normalized current ellipsoid with Chewi's displayed
`<x-c, Σ⁻¹(x-c)> <= 1` ellipsoid.
-/
theorem chewi620_ellipsoidSet_pullbackIdentity_eq_matrixInvShape_inv
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_sq : ∀ y, T (T y) = matrixInvShape Sigma y)
    (center : EuclideanSpace ℝ ι) :
    ellipsoidSet center (chewi620PullbackIdentityInvShape T) =
      ellipsoidSet center (matrixInvShape Sigma⁻¹) := by
  ext z
  simp [ellipsoidSet,
    chewi620_pullbackIdentityInvShape_eq_matrixInvShape_inv
      (Sigma := Sigma) hSigma hT_sq (z - center)]

/--
Rank-one collapse for Chewi's displayed ellipsoid update:
`(Σp)^T Σ⁻¹ (Σp) = <p, Σp>`.
-/
theorem chewi620_matrix_rankOne_collapse
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    (p : EuclideanSpace ℝ ι) :
    Sigma.mulVec p.ofLp ⬝ᵥ (Sigma⁻¹.mulVec (Sigma.mulVec p.ofLp)) =
      inner ℝ p (matrixInvShape Sigma p) := by
  have hcancel :
      Sigma⁻¹.mulVec (Sigma.mulVec p.ofLp) = p.ofLp := by
    rw [Matrix.mulVec_mulVec]
    rw [chewi620_matrixPosDef_inv_mul hSigma]
    simp
  rw [hcancel, matrixInvShape_quadratic_eq_dotProduct]
  exact dotProduct_comm (Sigma.mulVec p.ofLp) p.ofLp

/--
Positive denominator for Chewi's normalized ellipsoid cut direction when the
forward shape matrix is positive definite and the cut vector is nonzero.
-/
theorem chewi620_matrix_cut_sqrt_inv_pos_of_posDef
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {p : EuclideanSpace ℝ ι} (hp : p ≠ 0) :
    0 < (Real.sqrt (inner ℝ p (matrixInvShape Sigma p)))⁻¹ := by
  exact inv_pos.mpr
    (Real.sqrt_pos.mpr
      (matrixInvShape_quadratic_pos_of_posDef hSigma hp))

/--
The positive scalar used to normalize Chewi's cut direction:
`1 / sqrt(<p, Sigma p>)`.
-/
noncomputable def chewi620MatrixCutScale
    (Sigma : Matrix ι ι ℝ) (p : EuclideanSpace ℝ ι) : ℝ :=
  (Real.sqrt (inner ℝ p (matrixInvShape Sigma p)))⁻¹

/--
The normalized cut direction obtained from a supplied square-root factor
`sigmaHalfP`, intended to be `Σ_n^{1/2} p_n`.
-/
noncomputable def chewi620MatrixNormalizedCutDirection
    (Sigma : Matrix ι ι ℝ) (p sigmaHalfP : EuclideanSpace ℝ ι) :
    EuclideanSpace ℝ ι :=
  chewi620MatrixCutScale Sigma p • sigmaHalfP

/--
If the supplied square-root factor has squared norm `<p, Sigma p>`, then the
Chewi-normalized cut direction has unit norm.
-/
theorem chewi620_matrixNormalizedCutDirection_norm_of_posDef
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {p sigmaHalfP : EuclideanSpace ℝ ι} (hp : p ≠ 0)
    (hsigmaHalfP_norm :
      ‖sigmaHalfP‖ ^ (2 : ℕ) = inner ℝ p (matrixInvShape Sigma p)) :
    ‖chewi620MatrixNormalizedCutDirection Sigma p sigmaHalfP‖ = 1 := by
  have hquad_pos : 0 < inner ℝ p (matrixInvShape Sigma p) :=
    matrixInvShape_quadratic_pos_of_posDef hSigma hp
  have hsqrt_pos : 0 < Real.sqrt (inner ℝ p (matrixInvShape Sigma p)) :=
    Real.sqrt_pos.mpr hquad_pos
  have hscale_pos : 0 < chewi620MatrixCutScale Sigma p :=
    inv_pos.mpr hsqrt_pos
  have hsigmaHalfP_norm_eq_sqrt :
      Real.sqrt (inner ℝ p (matrixInvShape Sigma p)) = ‖sigmaHalfP‖ := by
    exact (Real.sqrt_eq_iff_eq_sq hquad_pos.le
      (norm_nonneg sigmaHalfP)).2 hsigmaHalfP_norm.symm
  rw [chewi620MatrixNormalizedCutDirection, norm_smul, Real.norm_eq_abs,
    abs_of_pos hscale_pos, ← hsigmaHalfP_norm_eq_sqrt]
  exact inv_mul_cancel₀ (ne_of_gt hsqrt_pos)

/--
Cut-normalization identity for Chewi Lemma 6.20.  The remaining matrix
square-root work is exactly the supplied raw identity
`<Σ^{1/2}p, Σ^{-1/2}(z-center)> = <p,z> - <p,center>`; this theorem turns it
into the `hcut` hypothesis required by
`chewi620_affineTransport_stepCertificate_of_quadratic`.
-/
theorem chewi620_matrixNormalizedCutDirection_inner_toStd
    {Sigma : Matrix ι ι ℝ} {p sigmaHalfP center : EuclideanSpace ℝ ι}
    {toStd : EuclideanSpace ℝ ι -> EuclideanSpace ℝ ι}
    (hraw :
      ∀ z,
        inner ℝ sigmaHalfP (toStd (z - center)) =
          inner ℝ p z - inner ℝ p center)
    (z : EuclideanSpace ℝ ι) :
    inner ℝ (chewi620MatrixNormalizedCutDirection Sigma p sigmaHalfP)
        (toStd (z - center)) =
      chewi620MatrixCutScale Sigma p *
        (inner ℝ p z - inner ℝ p center) := by
  rw [chewi620MatrixNormalizedCutDirection, inner_smul_left, hraw]
  simp

/--
Unit-norm wrapper for the normalized cut direction when the supplied vector is
the image of `p` under a square-root factor of the forward shape matrix.
-/
theorem chewi620_matrixSqrt_normalizedCutDirection_norm_of_posDef
    {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    {p : EuclideanSpace ℝ ι} (hp : p ≠ 0)
    (hT_quadratic :
      ‖T p‖ ^ (2 : ℕ) = inner ℝ p (matrixInvShape Sigma p)) :
    ‖chewi620MatrixNormalizedCutDirection Sigma p (T p)‖ = 1 :=
  chewi620_matrixNormalizedCutDirection_norm_of_posDef
    (Sigma := Sigma) hSigma hp hT_quadratic

/--
The symmetric square-root raw-adjoint identity gives the `hcut` hypothesis
needed by `chewi620_affineTransport_stepCertificate_of_quadratic`.
-/
theorem chewi620_matrixSqrt_normalizedCutDirection_inner_toStd
    {Sigma : Matrix ι ι ℝ}
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_symm : T.IsSymmetric)
    (p center z : EuclideanSpace ℝ ι) :
    inner ℝ (chewi620MatrixNormalizedCutDirection Sigma p (T p))
        (T.symm (z - center)) =
      chewi620MatrixCutScale Sigma p *
        (inner ℝ p z - inner ℝ p center) :=
  chewi620_matrixNormalizedCutDirection_inner_toStd
    (Sigma := Sigma) (p := p) (sigmaHalfP := T p) (center := center)
    (toStd := fun y => T.symm y)
    (fun w =>
      chewi620_rawAdjointIdentity_of_symmetric_inverse
        (T := T) hT_symm p center w)
    z

/--
The square-root hypothesis turns Chewi's normalized standard-cut center into
the displayed original-space center update
`x - (d+1)⁻¹ Σp / sqrt(<p, Σp>)`.
-/
theorem chewi620_matrixSqrt_centerUpdate_hcenter
    {d : ℕ} {Sigma : Matrix ι ι ℝ}
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_sq : ∀ y, T (T y) = matrixInvShape Sigma y)
    (center p : EuclideanSpace ℝ ι) :
    ellipsoidCenterUpdate d center (matrixInvShape Sigma p)
        (inner ℝ p (matrixInvShape Sigma p)) - center =
      T (chewi620StandardCutCenter d
        (chewi620MatrixNormalizedCutDirection Sigma p (T p))) := by
  simp [ellipsoidCenterUpdate, chewi620StandardCutCenter,
    chewi620MatrixNormalizedCutDirection, chewi620MatrixCutScale, hT_sq]
  module

/--
Square-root affine-transport certificate for Chewi Lemma 6.20 with the next
inverse-shape represented as the pullback of the normalized standard-cut
inverse-shape.  This discharges the current-ellipsoid, cut, and next-ellipsoid
quadratic identities; the remaining supplied hypothesis is the determinant/
volume calculation.
-/
theorem chewi620_sqrtAffineTransport_stepCertificate_of_pullback
    {d : ℕ} {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_symm : T.IsSymmetric)
    {center nextCenter p : EuclideanSpace ℝ ι}
    (hd : 1 < d) (hp : p ≠ 0)
    (hT_quadratic :
      ‖T p‖ ^ (2 : ℕ) = inner ℝ p (matrixInvShape Sigma p))
    (hcenter :
      nextCenter - center =
        T (chewi620StandardCutCenter d
          (chewi620MatrixNormalizedCutDirection Sigma p (T p))))
    {vol volNext : ℝ}
    (hvolume : volNext ≤ ellipsoidVolumeRatio d * vol) :
    IsEllipsoidStepCertificate center nextCenter
      (chewi620PullbackIdentityInvShape T)
      (chewi620PullbackStandardCutInvShape d
        (chewi620MatrixNormalizedCutDirection Sigma p (T p)) T)
      p vol volNext (ellipsoidVolumeRatio d) := by
  refine
    chewi620_affineTransport_stepCertificate_of_quadratic
      (d := d) (center := center) (nextCenter := nextCenter)
      (invShape := chewi620PullbackIdentityInvShape T)
      (nextInvShape := chewi620PullbackStandardCutInvShape d
        (chewi620MatrixNormalizedCutDirection Sigma p (T p)) T)
      (p := p)
      (u := chewi620MatrixNormalizedCutDirection Sigma p (T p))
      (toStd := fun y => T.symm y)
      (scale := chewi620MatrixCutScale Sigma p)
      hd
      (chewi620_matrixSqrt_normalizedCutDirection_norm_of_posDef
        (Sigma := Sigma) hSigma hp hT_quadratic)
      (chewi620_matrix_cut_sqrt_inv_pos_of_posDef
        (Sigma := Sigma) hSigma hp)
      ?_ ?_ ?_ hvolume
  · intro z
    exact chewi620_pullbackIdentityInvShape_quadratic
      (T := T) hT_symm (z - center)
  · intro z
    exact chewi620_matrixSqrt_normalizedCutDirection_inner_toStd
      (Sigma := Sigma) (T := T) hT_symm p center z
  · intro z
    exact chewi620_pullbackStandardCutInvShape_hnext
      (d := d)
      (u := chewi620MatrixNormalizedCutDirection Sigma p (T p))
      (center := center) (nextCenter := nextCenter)
      (z := z) (T := T) hT_symm hcenter

/--
Square-root affine-transport certificate with Chewi's displayed center update
inserted.  The remaining supplied hypothesis is now only the determinant/volume
calculation and the matrix identification of the next inverse shape.
-/
theorem chewi620_sqrtAffineTransport_stepCertificate_of_displayedCenter
    {d : ℕ} {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_symm : T.IsSymmetric)
    {center p : EuclideanSpace ℝ ι}
    (hd : 1 < d) (hp : p ≠ 0)
    (hT_sq : ∀ y, T (T y) = matrixInvShape Sigma y)
    {vol volNext : ℝ}
    (hvolume : volNext ≤ ellipsoidVolumeRatio d * vol) :
    IsEllipsoidStepCertificate center
      (ellipsoidCenterUpdate d center (matrixInvShape Sigma p)
        (inner ℝ p (matrixInvShape Sigma p)))
      (chewi620PullbackIdentityInvShape T)
      (chewi620PullbackStandardCutInvShape d
        (chewi620MatrixNormalizedCutDirection Sigma p (T p)) T)
      p vol volNext (ellipsoidVolumeRatio d) := by
  refine
    chewi620_sqrtAffineTransport_stepCertificate_of_pullback
      (Sigma := Sigma) hSigma (T := T) hT_symm
      (center := center)
      (nextCenter := ellipsoidCenterUpdate d center (matrixInvShape Sigma p)
        (inner ℝ p (matrixInvShape Sigma p)))
      (p := p) hd hp ?_ ?_ hvolume
  · calc
      ‖T p‖ ^ (2 : ℕ) = inner ℝ (T p) (T p) := by
        rw [real_inner_self_eq_norm_sq]
      _ = inner ℝ p (T (T p)) := by
        exact hT_symm p (T p)
      _ = inner ℝ p (matrixInvShape Sigma p) := by
        rw [hT_sq p]
  · exact chewi620_matrixSqrt_centerUpdate_hcenter
      (Sigma := Sigma) (T := T) hT_sq center p

/--
Chewi Lemma 6.20 certificate with the current ellipsoid written in the
source's displayed matrix form `Σ⁻¹` and the center update written in the
source's displayed form.  The next inverse shape is still the pullback of the
standard-cut inverse shape; identifying it with the displayed `Σ_{n+1}^{-1}`
matrix update is the next matrix-algebra blocker.
-/
theorem chewi620_sqrtAffineTransport_stepCertificate_of_displayedCurrentAndCenter
    {d : ℕ} {Sigma : Matrix ι ι ℝ} (hSigma : Sigma.PosDef)
    {T : EuclideanSpace ℝ ι ≃ₗ[ℝ] EuclideanSpace ℝ ι}
    (hT_symm : T.IsSymmetric)
    {center p : EuclideanSpace ℝ ι}
    (hd : 1 < d) (hp : p ≠ 0)
    (hT_sq : ∀ y, T (T y) = matrixInvShape Sigma y)
    {vol volNext : ℝ}
    (hvolume : volNext ≤ ellipsoidVolumeRatio d * vol) :
    IsEllipsoidStepCertificate center
      (ellipsoidCenterUpdate d center (matrixInvShape Sigma p)
        (inner ℝ p (matrixInvShape Sigma p)))
      (matrixInvShape Sigma⁻¹)
      (chewi620PullbackStandardCutInvShape d
        (chewi620MatrixNormalizedCutDirection Sigma p (T p)) T)
      p vol volNext (ellipsoidVolumeRatio d) := by
  have hcert :=
    chewi620_sqrtAffineTransport_stepCertificate_of_displayedCenter
      (Sigma := Sigma) hSigma (T := T) hT_symm
      (center := center) (p := p) hd hp hT_sq hvolume
  have hset :
      ellipsoidSet center (chewi620PullbackIdentityInvShape T) =
        ellipsoidSet center (matrixInvShape Sigma⁻¹) :=
    chewi620_ellipsoidSet_pullbackIdentity_eq_matrixInvShape_inv
      (Sigma := Sigma) hSigma hT_sq center
  simpa [IsEllipsoidStepCertificate, hset] using hcert

end EuclideanMatrix

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
