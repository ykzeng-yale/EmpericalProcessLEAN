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
