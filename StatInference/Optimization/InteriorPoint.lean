import StatInference.Optimization.Basic
import Mathlib.Analysis.Calculus.FDeriv.CompCLM
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.InnerProductSpace.Rayleigh
import Mathlib.Analysis.ODE.Gronwall
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Topology.Algebra.Module.FiniteDimension

/-!
# Chewi Chapter 13 interior-point methods

This module develops the finite-dimensional interior-point/self-concordance
lane: Chewi Example 13.4 for the logarithmic barrier, the supplied-Hessian
local-norm/Newton substrate, and the Lemma 13.6 Hessian-stability spine.
-/

namespace StatInference
namespace Optimization

open scoped intervalIntegral

section ScalarGronwall

/--
Constant-coefficient scalar Gronwall wrapper used as a reusable stepping stone
for the Chewi Lemma 13.6 segment argument.
-/
theorem scalar_le_exp_of_abs_deriv_le
    {q q' : ℝ -> ℝ} {a b c : ℝ}
    (hqa_nonneg : 0 ≤ q a)
    (hqcont : ContinuousOn q (Set.Icc a b))
    (hq_nonneg : ∀ t, t ∈ Set.Icc a b -> 0 ≤ q t)
    (hqderiv : ∀ t, t ∈ Set.Ico a b ->
      HasDerivWithinAt q (q' t) (Set.Ici t) t)
    (hbound : ∀ t, t ∈ Set.Ico a b -> |q' t| ≤ c * q t) :
    ∀ t, t ∈ Set.Icc a b -> q t ≤ q a * Real.exp (c * (t - a)) := by
  have hgr := norm_le_gronwallBound_of_norm_deriv_right_le
    (f := q) (f' := q') (δ := q a) (K := c) (ε := 0)
    (a := a) (b := b) hqcont hqderiv ?ha ?hbound'
  · intro t ht
    have ht_nonneg : 0 ≤ q t := hq_nonneg t ht
    have ht_norm := hgr t ht
    rw [Real.norm_eq_abs, abs_of_nonneg ht_nonneg] at ht_norm
    rw [gronwallBound_ε0] at ht_norm
    simpa using ht_norm
  · rw [Real.norm_eq_abs, abs_of_nonneg hqa_nonneg]
  · intro t ht
    have htIcc : t ∈ Set.Icc a b := Set.Ico_subset_Icc_self ht
    have hqt_nonneg : 0 ≤ q t := hq_nonneg t htIcc
    have hb := hbound t ht
    simpa [Real.norm_eq_abs, abs_of_nonneg hqt_nonneg] using hb

/--
Variable-coefficient scalar Gronwall upper bound with an explicit
antiderivative.  This is the source shape needed for Chewi Lemma 13.6's
`ψ(t)` estimate once `A'` is the displayed coefficient.
-/
theorem scalar_le_exp_antideriv_of_abs_deriv_le
    {q q' A A' : ℝ -> ℝ} {t : ℝ}
    (hq : ∀ s, HasDerivAt q (q' s) s)
    (hA : ∀ s, HasDerivAt A (A' s) s)
    (hbound : ∀ s, |q' s| ≤ A' s * q s)
    (ht : 0 ≤ t) :
    q t ≤ q 0 * Real.exp (A t - A 0) := by
  let z : ℝ -> ℝ := fun s => Real.exp (-(A s)) * q s
  have hz : ∀ s, HasDerivAt z
      (Real.exp (-(A s)) * (q' s - A' s * q s)) s := by
    intro s
    have hnegA : HasDerivAt (fun r => -(A r)) (-(A' s)) s := (hA s).neg
    have hexp : HasDerivAt (fun r => Real.exp (-(A r)))
        (Real.exp (-(A s)) * (-(A' s))) s := hnegA.exp
    have hmul := hexp.mul (hq s)
    convert hmul using 1
    ring
  have hanti : Antitone z := by
    refine antitone_of_deriv_nonpos ?_ ?_
    · intro s
      exact (hz s).differentiableAt
    · intro s
      have hderiv := (hz s).deriv
      rw [hderiv]
      have hexp_nonneg : 0 ≤ Real.exp (-(A s)) := Real.exp_nonneg _
      have hle : q' s - A' s * q s ≤ 0 := by
        have hb := hbound s
        have hqle : q' s ≤ A' s * q s :=
          le_trans (le_abs_self _) hb
        linarith
      nlinarith
  have hzt := hanti ht
  have hm := mul_le_mul_of_nonneg_left hzt (Real.exp_nonneg (A t))
  calc
    q t = Real.exp (A t) * z t := by
      simp [z, ← mul_assoc, ← Real.exp_add]
    _ ≤ Real.exp (A t) * z 0 := hm
    _ = q 0 * Real.exp (A t - A 0) := by
      simp [z, ← mul_assoc, ← Real.exp_add]
      ring_nf

/--
Variable-coefficient scalar Gronwall lower bound with an explicit
antiderivative.
-/
theorem scalar_exp_neg_antideriv_le_of_abs_deriv_le
    {q q' A A' : ℝ -> ℝ} {t : ℝ}
    (hq : ∀ s, HasDerivAt q (q' s) s)
    (hA : ∀ s, HasDerivAt A (A' s) s)
    (hbound : ∀ s, |q' s| ≤ A' s * q s)
    (ht : 0 ≤ t) :
    q 0 * Real.exp (-(A t - A 0)) ≤ q t := by
  let w : ℝ -> ℝ := fun s => Real.exp (A s) * q s
  have hw : ∀ s, HasDerivAt w
      (Real.exp (A s) * (A' s * q s + q' s)) s := by
    intro s
    have hexp : HasDerivAt (fun r => Real.exp (A r))
        (Real.exp (A s) * A' s) s := (hA s).exp
    have hmul := hexp.mul (hq s)
    convert hmul using 1
    ring
  have hmono : Monotone w := by
    refine monotone_of_deriv_nonneg ?_ ?_
    · intro s
      exact (hw s).differentiableAt
    · intro s
      have hderiv := (hw s).deriv
      rw [hderiv]
      have hexp_nonneg : 0 ≤ Real.exp (A s) := Real.exp_nonneg _
      have hge : 0 ≤ A' s * q s + q' s := by
        have hb := hbound s
        have hnqle : -q' s ≤ A' s * q s := by
          exact le_trans (by simpa using (le_abs_self (-q' s))) hb
        linarith
      nlinarith
  have hwt := hmono ht
  have hm := mul_le_mul_of_nonneg_left hwt (Real.exp_nonneg (-(A t)))
  calc
    q 0 * Real.exp (-(A t - A 0)) = Real.exp (-(A t)) * w 0 := by
      simp [w, ← mul_assoc, ← Real.exp_add]
      ring_nf
    _ ≤ Real.exp (-(A t)) * w t := hm
    _ = q t := by
      simp [w, ← mul_assoc, ← Real.exp_add]

theorem scalar_exp_sandwich_of_abs_deriv_le_antideriv
    {q q' A A' : ℝ -> ℝ} {t : ℝ}
    (hq : ∀ s, HasDerivAt q (q' s) s)
    (hA : ∀ s, HasDerivAt A (A' s) s)
    (hbound : ∀ s, |q' s| ≤ A' s * q s)
    (ht : 0 ≤ t) :
    q 0 * Real.exp (-(A t - A 0)) ≤ q t ∧
      q t ≤ q 0 * Real.exp (A t - A 0) :=
  ⟨scalar_exp_neg_antideriv_le_of_abs_deriv_le hq hA hbound ht,
    scalar_le_exp_antideriv_of_abs_deriv_le hq hA hbound ht⟩

/--
Interval form of the variable-coefficient scalar Gronwall upper bound.  Unlike
the global version, this only needs differentiability on the interior of
`[0,t]`, which is the natural shape for Chewi's Dikin-segment argument.
-/
theorem scalar_le_exp_antideriv_of_abs_deriv_le_on_Icc
    {q q' A A' : ℝ -> ℝ} {t : ℝ}
    (ht : 0 ≤ t)
    (hqcont : ContinuousOn q (Set.Icc (0 : ℝ) t))
    (hAcont : ContinuousOn A (Set.Icc (0 : ℝ) t))
    (hqderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      HasDerivWithinAt q (q' s) (interior (Set.Icc (0 : ℝ) t)) s)
    (hAderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      HasDerivWithinAt A (A' s) (interior (Set.Icc (0 : ℝ) t)) s)
    (hbound : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      |q' s| ≤ A' s * q s) :
    q t ≤ q 0 * Real.exp (A t - A 0) := by
  let D := Set.Icc (0 : ℝ) t
  let z : ℝ -> ℝ := fun s => Real.exp (-(A s)) * q s
  have hzcont : ContinuousOn z D := by
    exact ((Real.continuous_exp.comp_continuousOn hAcont.neg).mul hqcont)
  have hzderiv : ∀ s, s ∈ interior D -> HasDerivWithinAt z
      (Real.exp (-(A s)) * (q' s - A' s * q s)) (interior D) s := by
    intro s hs
    have hnegA : HasDerivWithinAt (fun r => -(A r)) (-(A' s))
        (interior D) s := (hAderiv s hs).neg
    have hexp : HasDerivWithinAt (fun r => Real.exp (-(A r)))
        (Real.exp (-(A s)) * (-(A' s))) (interior D) s := hnegA.exp
    have hmul := hexp.mul (hqderiv s hs)
    convert hmul using 1
    ring
  have hderiv_nonpos : ∀ s, s ∈ interior D ->
      Real.exp (-(A s)) * (q' s - A' s * q s) ≤ 0 := by
    intro s hs
    have hexp_nonneg : 0 ≤ Real.exp (-(A s)) := Real.exp_nonneg _
    have hle : q' s - A' s * q s ≤ 0 := by
      have hb := hbound s hs
      have hqle : q' s ≤ A' s * q s := le_trans (le_abs_self _) hb
      linarith
    nlinarith
  have hanti : AntitoneOn z D :=
    antitoneOn_of_hasDerivWithinAt_nonpos (convex_Icc (0 : ℝ) t)
      hzcont hzderiv hderiv_nonpos
  have hzt := hanti (show (0 : ℝ) ∈ D from ⟨le_rfl, ht⟩)
    (show t ∈ D from ⟨ht, le_rfl⟩) ht
  have hm := mul_le_mul_of_nonneg_left hzt (Real.exp_nonneg (A t))
  calc
    q t = Real.exp (A t) * z t := by
      simp [z, ← mul_assoc, ← Real.exp_add]
    _ ≤ Real.exp (A t) * z 0 := hm
    _ = q 0 * Real.exp (A t - A 0) := by
      simp [z, ← mul_assoc, ← Real.exp_add]
      ring_nf

/-- Interval form of the variable-coefficient scalar Gronwall lower bound. -/
theorem scalar_exp_neg_antideriv_le_of_abs_deriv_le_on_Icc
    {q q' A A' : ℝ -> ℝ} {t : ℝ}
    (ht : 0 ≤ t)
    (hqcont : ContinuousOn q (Set.Icc (0 : ℝ) t))
    (hAcont : ContinuousOn A (Set.Icc (0 : ℝ) t))
    (hqderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      HasDerivWithinAt q (q' s) (interior (Set.Icc (0 : ℝ) t)) s)
    (hAderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      HasDerivWithinAt A (A' s) (interior (Set.Icc (0 : ℝ) t)) s)
    (hbound : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      |q' s| ≤ A' s * q s) :
    q 0 * Real.exp (-(A t - A 0)) ≤ q t := by
  let D := Set.Icc (0 : ℝ) t
  let w : ℝ -> ℝ := fun s => Real.exp (A s) * q s
  have hwcont : ContinuousOn w D := by
    exact ((Real.continuous_exp.comp_continuousOn hAcont).mul hqcont)
  have hwderiv : ∀ s, s ∈ interior D -> HasDerivWithinAt w
      (Real.exp (A s) * (A' s * q s + q' s)) (interior D) s := by
    intro s hs
    have hexp : HasDerivWithinAt (fun r => Real.exp (A r))
        (Real.exp (A s) * A' s) (interior D) s := (hAderiv s hs).exp
    have hmul := hexp.mul (hqderiv s hs)
    convert hmul using 1
    ring
  have hderiv_nonneg : ∀ s, s ∈ interior D ->
      0 ≤ Real.exp (A s) * (A' s * q s + q' s) := by
    intro s hs
    have hexp_nonneg : 0 ≤ Real.exp (A s) := Real.exp_nonneg _
    have hge : 0 ≤ A' s * q s + q' s := by
      have hb := hbound s hs
      have hnqle : -q' s ≤ A' s * q s := by
        exact le_trans (by simpa using (le_abs_self (-q' s))) hb
      linarith
    nlinarith
  have hmono : MonotoneOn w D :=
    monotoneOn_of_hasDerivWithinAt_nonneg (convex_Icc (0 : ℝ) t)
      hwcont hwderiv hderiv_nonneg
  have hwt := hmono (show (0 : ℝ) ∈ D from ⟨le_rfl, ht⟩)
    (show t ∈ D from ⟨ht, le_rfl⟩) ht
  have hm := mul_le_mul_of_nonneg_left hwt (Real.exp_nonneg (-(A t)))
  calc
    q 0 * Real.exp (-(A t - A 0)) = Real.exp (-(A t)) * w 0 := by
      simp [w, ← mul_assoc, ← Real.exp_add]
      ring_nf
    _ ≤ Real.exp (-(A t)) * w t := hm
    _ = q t := by
      simp [w, ← mul_assoc, ← Real.exp_add]

theorem scalar_exp_sandwich_of_abs_deriv_le_antideriv_on_Icc
    {q q' A A' : ℝ -> ℝ} {t : ℝ}
    (ht : 0 ≤ t)
    (hqcont : ContinuousOn q (Set.Icc (0 : ℝ) t))
    (hAcont : ContinuousOn A (Set.Icc (0 : ℝ) t))
    (hqderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      HasDerivWithinAt q (q' s) (interior (Set.Icc (0 : ℝ) t)) s)
    (hAderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      HasDerivWithinAt A (A' s) (interior (Set.Icc (0 : ℝ) t)) s)
    (hbound : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) t) ->
      |q' s| ≤ A' s * q s) :
    q 0 * Real.exp (-(A t - A 0)) ≤ q t ∧
      q t ≤ q 0 * Real.exp (A t - A 0) :=
  ⟨scalar_exp_neg_antideriv_le_of_abs_deriv_le_on_Icc
      ht hqcont hAcont hqderiv hAderiv hbound,
    scalar_le_exp_antideriv_of_abs_deriv_le_on_Icc
      ht hqcont hAcont hqderiv hAderiv hbound⟩

/--
Riccati comparison on `[0,1]`: if `q' ≤ M q^2`, `q(0) ≤ r`, and `q` stays
positive, then `q(t) ≤ r / (1 - M r t)` while the displayed denominator is
positive.  This is the scalar comparison behind Chewi Lemma 13.6's segment
local-norm bound.
-/
theorem scalar_riccati_upper_bound_on_unit_interval
    {q q' : ℝ -> ℝ} {M r : ℝ}
    (hr_pos : 0 < r)
    (hqcont : ContinuousOn q (Set.Icc (0 : ℝ) 1))
    (hq_pos : ∀ s, s ∈ Set.Icc (0 : ℝ) 1 -> 0 < q s)
    (hqderiv : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      HasDerivWithinAt q (q' s) (interior (Set.Icc (0 : ℝ) 1)) s)
    (hderiv_bound : ∀ s, s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      q' s ≤ M * (q s) ^ (2 : ℕ))
    (hq0_le : q 0 ≤ r) :
    ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> 0 < 1 - M * r * t ->
      q t ≤ r / (1 - M * r * t) := by
  let D := Set.Icc (0 : ℝ) 1
  let w : ℝ -> ℝ := fun s => (q s)⁻¹ + M * s
  have hq_ne : ∀ s, s ∈ D -> q s ≠ 0 := by
    intro s hs
    exact (hq_pos s hs).ne'
  have hwcont : ContinuousOn w D := by
    have hinv : ContinuousOn (fun s : ℝ => (q s)⁻¹) D :=
      hqcont.inv₀ hq_ne
    have hlin : ContinuousOn (fun s : ℝ => M * s) D :=
      (continuous_const.mul continuous_id).continuousOn
    simpa [w] using hinv.add hlin
  have hwderiv : ∀ s, s ∈ interior D ->
      HasDerivWithinAt w
        (-q' s / (q s) ^ (2 : ℕ) + M) (interior D) s := by
    intro s hs
    have hqinvd :
        HasDerivWithinAt (fun u : ℝ => (q u)⁻¹)
          (-q' s / (q s) ^ (2 : ℕ)) (interior D) s := by
      exact (hqderiv s hs).inv ((hq_pos s (interior_subset hs)).ne')
    have hlin :
        HasDerivWithinAt (fun u : ℝ => M * u) M (interior D) s := by
      simpa using (hasDerivAt_id s).const_mul M |>.hasDerivWithinAt
    simpa [w] using hqinvd.add hlin
  have hderiv_nonneg : ∀ s, s ∈ interior D ->
      0 ≤ -q' s / (q s) ^ (2 : ℕ) + M := by
    intro s hs
    have hq_s_pos : 0 < q s := hq_pos s (interior_subset hs)
    have hq_sq_pos : 0 < (q s) ^ (2 : ℕ) := sq_pos_of_pos hq_s_pos
    have hdiv : q' s / (q s) ^ (2 : ℕ) ≤ M := by
      exact (div_le_iff₀ hq_sq_pos).2 (hderiv_bound s hs)
    have hneg :
        -q' s / (q s) ^ (2 : ℕ) =
          -(q' s / (q s) ^ (2 : ℕ)) := by
      ring
    rw [hneg]
    linarith
  have hmono : MonotoneOn w D :=
    monotoneOn_of_hasDerivWithinAt_nonneg (convex_Icc (0 : ℝ) 1)
      hwcont hwderiv hderiv_nonneg
  intro t ht hden_pos
  have hzero_mem : (0 : ℝ) ∈ D := ⟨le_rfl, zero_le_one⟩
  have ht_mem : t ∈ D := ht
  have ht_nonneg : 0 ≤ t := ht.1
  have hwt := hmono hzero_mem ht_mem ht_nonneg
  have hwt' : (q 0)⁻¹ ≤ (q t)⁻¹ + M * t := by
    simpa [w] using hwt
  have hq0_pos : 0 < q 0 := hq_pos 0 hzero_mem
  have hqt_pos : 0 < q t := hq_pos t ht
  have hr_inv_le_hq0_inv : r⁻¹ ≤ (q 0)⁻¹ := by
    exact (inv_le_inv₀ hr_pos hq0_pos).2 hq0_le
  have hrecip_step : r⁻¹ ≤ (q t)⁻¹ + M * t :=
    hr_inv_le_hq0_inv.trans hwt'
  have hrecip : (1 - M * r * t) / r ≤ (q t)⁻¹ := by
    have hstep : r⁻¹ - M * t ≤ (q t)⁻¹ := by linarith
    have heq : (1 - M * r * t) / r = r⁻¹ - M * t := by
      field_simp [hr_pos.ne']
    simpa [heq] using hstep
  have hmul := mul_le_mul_of_nonneg_right hrecip hqt_pos.le
  have hmul' : ((1 - M * r * t) / r) * q t ≤ 1 := by
    simpa [mul_comm, hqt_pos.ne'] using hmul
  have htarget_mul : (1 - M * r * t) * q t ≤ r := by
    have hmulr := mul_le_mul_of_nonneg_right hmul' hr_pos.le
    have hleft :
        ((1 - M * r * t) / r) * q t * r =
          (1 - M * r * t) * q t := by
      field_simp [hr_pos.ne']
    calc
      (1 - M * r * t) * q t =
          ((1 - M * r * t) / r) * q t * r := hleft.symm
      _ ≤ 1 * r := hmulr
      _ = r := by ring
  exact (le_div_iff₀ hden_pos).2
    (by simpa [mul_comm, mul_left_comm, mul_assoc] using htarget_mul)

/--
Antiderivative for the scalar coefficient in Chewi Theorem 13.8:
`d/dt (t / (1 - a t) - t) = (1 - a t)^{-2} - 1`.
-/
noncomputable def chewi138DeltaCoefficientPrimitive (a t : ℝ) : ℝ :=
  t / (1 - a * t) - t

theorem chewi138DeltaCoefficientPrimitive_hasDerivAt
    {a t : ℝ} (hden_ne : 1 - a * t ≠ 0) :
    HasDerivAt (fun s : ℝ => chewi138DeltaCoefficientPrimitive a s)
      (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1) t := by
  unfold chewi138DeltaCoefficientPrimitive
  have hnum : HasDerivAt (fun s : ℝ => s) 1 t := hasDerivAt_id t
  have hden : HasDerivAt (fun s : ℝ => 1 - a * s) (-a) t := by
    simpa using (hasDerivAt_const (c := (1 : ℝ)) t).sub ((hasDerivAt_id t).const_mul a)
  have hdiv := hnum.div hden hden_ne
  have hsub := hdiv.sub (hasDerivAt_id t)
  convert hsub using 1
  field_simp [hden_ne]
  ring

/--
The scalar coefficient in Chewi Theorem 13.8 is interval-integrable on `[0,1]`
whenever the denominator stays away from zero at the endpoint.
-/
theorem chewi138_deltaCoefficient_intervalIntegrable {a : ℝ} (ha_lt : a < 1) :
    IntervalIntegrable
      (fun t : ℝ => (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1))
      MeasureTheory.volume (0 : ℝ) 1 := by
  have hden_pos_on : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 -> 0 < 1 - a * t := by
    intro t ht
    have htIcc : t ∈ Set.Icc (0 : ℝ) 1 := by
      simpa [Set.uIcc_of_le zero_le_one] using ht
    have ht_nonneg : 0 ≤ t := htIcc.1
    have ht_le_one : t ≤ 1 := htIcc.2
    have hat_lt : a * t < 1 := by
      by_cases ha_nonneg : 0 ≤ a
      · have hat_le_a : a * t ≤ a * 1 := mul_le_mul_of_nonneg_left ht_le_one ha_nonneg
        nlinarith
      · have ha_neg : a < 0 := lt_of_not_ge ha_nonneg
        have hat_le_zero : a * t ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ha_neg.le ht_nonneg
        nlinarith
    nlinarith
  have hden_ne_on : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 -> 1 - a * t ≠ 0 := by
    intro t ht
    exact (hden_pos_on t ht).ne'
  have hcont_den :
      ContinuousOn (fun t : ℝ => 1 - a * t) (Set.uIcc (0 : ℝ) 1) :=
    (continuous_const.sub (continuous_const.mul continuous_id)).continuousOn
  have hcont_inv :
      ContinuousOn (fun t : ℝ => (1 - a * t)⁻¹) (Set.uIcc (0 : ℝ) 1) :=
    hcont_den.inv₀ hden_ne_on
  have hcont_integrand :
      ContinuousOn (fun t : ℝ => (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1))
        (Set.uIcc (0 : ℝ) 1) :=
    (hcont_inv.pow 2).sub continuous_const.continuousOn
  exact hcont_integrand.intervalIntegrable

/--
Chewi Theorem 13.8 scalar Delta coefficient calculation:
`∫_0^1 ((1 - a t)^{-2} - 1) dt = a / (1 - a)`.
In the theorem proof, `a = M * λ_f(x)`.
-/
theorem chewi138_deltaCoefficient_integral_eq {a : ℝ} (ha_lt : a < 1) :
    (∫ t in (0 : ℝ)..1, (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1)) =
      a / (1 - a) := by
  have hden_pos_on : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 -> 0 < 1 - a * t := by
    intro t ht
    have htIcc : t ∈ Set.Icc (0 : ℝ) 1 := by
      simpa [Set.uIcc_of_le zero_le_one] using ht
    have ht_nonneg : 0 ≤ t := htIcc.1
    have ht_le_one : t ≤ 1 := htIcc.2
    have hat_lt : a * t < 1 := by
      by_cases ha_nonneg : 0 ≤ a
      · have hat_le_a : a * t ≤ a * 1 := mul_le_mul_of_nonneg_left ht_le_one ha_nonneg
        nlinarith
      · have ha_neg : a < 0 := lt_of_not_ge ha_nonneg
        have hat_le_zero : a * t ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ha_neg.le ht_nonneg
        nlinarith
    nlinarith
  have hden_ne_on : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 -> 1 - a * t ≠ 0 := by
    intro t ht
    exact (hden_pos_on t ht).ne'
  have hderiv :
      ∀ t ∈ Set.uIcc (0 : ℝ) 1,
        HasDerivAt (fun s : ℝ => chewi138DeltaCoefficientPrimitive a s)
          (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1) t := by
    intro t ht
    exact chewi138DeltaCoefficientPrimitive_hasDerivAt (hden_ne_on t ht)
  have hcont_den :
      ContinuousOn (fun t : ℝ => 1 - a * t) (Set.uIcc (0 : ℝ) 1) :=
    (continuous_const.sub (continuous_const.mul continuous_id)).continuousOn
  have hcont_inv :
      ContinuousOn (fun t : ℝ => (1 - a * t)⁻¹) (Set.uIcc (0 : ℝ) 1) :=
    hcont_den.inv₀ hden_ne_on
  have hcont_integrand :
      ContinuousOn (fun t : ℝ => (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1))
        (Set.uIcc (0 : ℝ) 1) :=
    (hcont_inv.pow 2).sub continuous_const.continuousOn
  have hint :
      IntervalIntegrable
        (fun t : ℝ => (((1 - a * t)⁻¹) ^ (2 : ℕ) - 1))
        MeasureTheory.volume (0 : ℝ) 1 :=
    hcont_integrand.intervalIntegrable
  have hFTC := intervalIntegral.integral_eq_sub_of_hasDerivAt hderiv hint
  have hden_one_ne : 1 - a ≠ 0 := by nlinarith
  have hprimitive_eval :
      chewi138DeltaCoefficientPrimitive a 1 -
          chewi138DeltaCoefficientPrimitive a 0 =
        a / (1 - a) := by
    simp [chewi138DeltaCoefficientPrimitive]
    field_simp [hden_one_ne]
    ring
  simpa [hprimitive_eval] using hFTC

/--
Chewi Theorem 13.8 scalar Delta coefficient in the source notation
`a = M * lambda`.
-/
theorem chewi138_deltaCoefficient_integral_eq_mul
    {M lambda : ℝ} (hMlambda_lt : M * lambda < 1) :
    (∫ t in (0 : ℝ)..1,
        (((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1)) =
      M * lambda / (1 - M * lambda) := by
  simpa [mul_assoc] using
    chewi138_deltaCoefficient_integral_eq (a := M * lambda) hMlambda_lt

/--
Chewi Theorem 13.8 integrated scalar Delta bound.  A pointwise bound by the
source coefficient integrates to the closed coefficient
`M * lambda / (1 - M * lambda)`.
-/
theorem chewi138_integral_le_deltaCoefficient_mul
    {g : ℝ -> ℝ} {M lambda B : ℝ}
    (hMlambda_lt : M * lambda < 1)
    (hg_int : IntervalIntegrable g MeasureTheory.volume (0 : ℝ) 1)
    (hpoint : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      g t ≤ ((((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1) * B)) :
    (∫ t in (0 : ℝ)..1, g t) ≤
      (M * lambda / (1 - M * lambda)) * B := by
  let coeff : ℝ -> ℝ := fun t => (((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1)
  have hcoeff_int : IntervalIntegrable coeff MeasureTheory.volume (0 : ℝ) 1 := by
    simpa [coeff, mul_assoc] using
      chewi138_deltaCoefficient_intervalIntegrable (a := M * lambda) hMlambda_lt
  have hcoeffB_int :
      IntervalIntegrable (fun t : ℝ => coeff t * B) MeasureTheory.volume (0 : ℝ) 1 :=
    hcoeff_int.mul_const B
  have hmono :
      (∫ t in (0 : ℝ)..1, g t) ≤
        ∫ t in (0 : ℝ)..1, coeff t * B := by
    refine intervalIntegral.integral_mono_on zero_le_one hg_int hcoeffB_int ?_
    intro t ht
    simpa [coeff, mul_assoc] using hpoint t ht
  have hcoeff_eval :
      (∫ t in (0 : ℝ)..1, coeff t) = M * lambda / (1 - M * lambda) := by
    simpa [coeff, mul_assoc] using
      chewi138_deltaCoefficient_integral_eq_mul (M := M) (lambda := lambda) hMlambda_lt
  calc
    (∫ t in (0 : ℝ)..1, g t) ≤
        ∫ t in (0 : ℝ)..1, coeff t * B := hmono
    _ = (∫ t in (0 : ℝ)..1, coeff t) * B := by
      rw [intervalIntegral.integral_mul_const]
    _ = (M * lambda / (1 - M * lambda)) * B := by
      rw [hcoeff_eval]

end ScalarGronwall

section VectorSelfConcordance

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/--
Chewi Definition 13.2, supplied-Hessian local norm:
`||v||_x = sqrt(<v, Hess f(x) v>)`.
-/
noncomputable def localNorm (hess : E -> E →L[ℝ] E) (x v : E) : ℝ :=
  Real.sqrt (inner ℝ v (hess x v))

/--
Chewi Definition 13.2, supplied-inverse-Hessian dual local norm:
`||v*||_x^* = sqrt(<v*, Hess f(x)^{-1} v*>)`.
-/
noncomputable def dualLocalNorm (invHess : E -> E →L[ℝ] E) (x vStar : E) : ℝ :=
  Real.sqrt (inner ℝ vStar (invHess x vStar))

/-- Chewi Definition 13.5, supplied-Hessian Dikin ellipsoid. -/
def dikinEllipsoid (hess : E -> E →L[ℝ] E) (x : E) (r : ℝ) : Set E :=
  {y | localNorm hess x (y - x) < r}

/-- Newton's method update with a supplied inverse-Hessian oracle. -/
noncomputable def newtonStep
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) : E :=
  x - invHess x (grad x)

/-- Chewi Definition 13.7, Newton decrement via the supplied dual local norm. -/
noncomputable def newtonDecrement
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) : ℝ :=
  dualLocalNorm invHess x (grad x)

theorem localNorm_nonneg (hess : E -> E →L[ℝ] E) (x v : E) :
    0 ≤ localNorm hess x v :=
  Real.sqrt_nonneg _

theorem localNorm_pos_of_inner_pos
    {hess : E -> E →L[ℝ] E} {x v : E}
    (hquad_pos : 0 < inner ℝ v (hess x v)) :
    0 < localNorm hess x v := by
  simpa [localNorm] using Real.sqrt_pos.2 hquad_pos

theorem dualLocalNorm_nonneg (invHess : E -> E →L[ℝ] E) (x vStar : E) :
    0 ≤ dualLocalNorm invHess x vStar :=
  Real.sqrt_nonneg _

theorem localNorm_sq_eq_inner
    {hess : E -> E →L[ℝ] E} {x v : E}
    (hquad : 0 ≤ inner ℝ v (hess x v)) :
    (localNorm hess x v) ^ (2 : ℕ) = inner ℝ v (hess x v) := by
  simpa [localNorm] using Real.sq_sqrt hquad

theorem dualLocalNorm_sq_eq_inner
    {invHess : E -> E →L[ℝ] E} {x vStar : E}
    (hquad : 0 ≤ inner ℝ vStar (invHess x vStar)) :
    (dualLocalNorm invHess x vStar) ^ (2 : ℕ) =
      inner ℝ vStar (invHess x vStar) := by
  simpa [dualLocalNorm] using Real.sq_sqrt hquad

theorem localNorm_zero (hess : E -> E →L[ℝ] E) (x : E) :
    localNorm hess x 0 = 0 := by
  simp [localNorm]

/-- Scaling law for the supplied-Hessian local norm by a nonnegative scalar. -/
theorem localNorm_smul_of_nonneg
    {hess : E -> E →L[ℝ] E} {x v : E} {t : ℝ}
    (ht : 0 ≤ t)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w)) :
    localNorm hess x (t • v) = t * localNorm hess x v := by
  have hleft_nonneg : 0 ≤ localNorm hess x (t • v) :=
    localNorm_nonneg hess x (t • v)
  have hright_nonneg : 0 ≤ t * localNorm hess x v :=
    mul_nonneg ht (localNorm_nonneg hess x v)
  have hsq :
      (localNorm hess x (t • v)) ^ (2 : ℕ) =
        (t * localNorm hess x v) ^ (2 : ℕ) := by
    rw [localNorm_sq_eq_inner (hx_nonneg (t • v))]
    rw [mul_pow, localNorm_sq_eq_inner (hx_nonneg v)]
    simp [map_smul, real_inner_smul_left, real_inner_smul_right]
    ring
  exact (sq_eq_sq₀ hleft_nonneg hright_nonneg).mp hsq

theorem dualLocalNorm_zero (invHess : E -> E →L[ℝ] E) (x : E) :
    dualLocalNorm invHess x 0 = 0 := by
  simp [dualLocalNorm]

/--
Nonnegativity of the supplied inverse-Hessian quadratic form from a right
inverse identity and nonnegativity of the Hessian quadratic form.
-/
theorem inverseHessianQuadratic_nonneg_of_hessian_right_inverse
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E} {x : E}
    (hhess_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hright : ∀ v : E, hess x (invHess x v) = v)
    (v : E) :
    0 ≤ inner ℝ v (invHess x v) := by
  have hbase := hhess_nonneg (invHess x v)
  simpa [hright v, real_inner_comm] using hbase

/--
Concrete inverse-local identity: if the supplied inverse-Hessian oracle is a
right inverse for the Hessian at `x`, then the primal local norm of
`invHess x v` equals the dual local norm of `v`.
-/
theorem localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E} {x : E}
    (hhess_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hright : ∀ v : E, hess x (invHess x v) = v)
    (v : E) :
    localNorm hess x (invHess x v) = dualLocalNorm invHess x v := by
  have hinv_nonneg : 0 ≤ inner ℝ v (invHess x v) :=
    inverseHessianQuadratic_nonneg_of_hessian_right_inverse
      (hess := hess) (invHess := invHess) (x := x)
      hhess_nonneg hright v
  refine (sq_eq_sq₀
    (localNorm_nonneg hess x (invHess x v))
    (dualLocalNorm_nonneg invHess x v)).mp ?_
  calc
    (localNorm hess x (invHess x v)) ^ (2 : ℕ) =
        inner ℝ (invHess x v) (hess x (invHess x v)) :=
      localNorm_sq_eq_inner (hhess_nonneg (invHess x v))
    _ = inner ℝ v (invHess x v) := by
      simp [hright v, real_inner_comm]
    _ = (dualLocalNorm invHess x v) ^ (2 : ℕ) :=
      (dualLocalNorm_sq_eq_inner hinv_nonneg).symm

/--
Nonnegativity of the supplied inverse-Hessian quadratic form from the
adjoint-coordinate factorization used in the Theorem 13.8 Rayleigh route.
-/
theorem inverseHessianQuadratic_nonneg_of_adjointCoordFactor
    [CompleteSpace E]
    {invHess : E -> E →L[ℝ] E} {x : E} {coord : E →L[ℝ] E}
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (v : E) :
    0 ≤ inner ℝ v (invHess x v) := by
  rw [hinv_factor v]
  exact sq_nonneg _

theorem newtonStep_sub
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) :
    newtonStep grad invHess x - x = -invHess x (grad x) := by
  simp [newtonStep]

theorem sub_newtonStep
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) :
    x - newtonStep grad invHess x = invHess x (grad x) := by
  simp [newtonStep]

/--
Chewi Definition 13.7, supplied-oracle form of the identity
`λ_f(x) = ||x⁺ - x||_x`.  The only algebraic requirement is the expected
quadratic-form identity for applying the Hessian to its supplied inverse on
the gradient direction.
-/
theorem localNorm_newtonStep_sub_eq_newtonDecrement_of_inner
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E}
    (hinner :
      inner ℝ (invHess x (grad x)) (hess x (invHess x (grad x))) =
        inner ℝ (grad x) (invHess x (grad x))) :
    localNorm hess x (newtonStep grad invHess x - x) =
      newtonDecrement grad invHess x := by
  rw [newtonStep_sub]
  simp [localNorm, dualLocalNorm, newtonDecrement, hinner]

/--
Newton decrement norm identity from a concrete right-inverse identity for the
Hessian at the current point.
-/
theorem localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E}
    (hright : ∀ v : E, hess x (invHess x v) = v) :
    localNorm hess x (newtonStep grad invHess x - x) =
      newtonDecrement grad invHess x := by
  have hinner :
      inner ℝ (invHess x (grad x)) (hess x (invHess x (grad x))) =
        inner ℝ (grad x) (invHess x (grad x)) := by
    simp [hright (grad x), real_inner_comm]
  exact localNorm_newtonStep_sub_eq_newtonDecrement_of_inner
    (hess := hess) (grad := grad) (invHess := invHess) (x := x) hinner

/--
The Dikin-ellipsoid membership consequence of the Newton decrement bound,
using a supplied proof of the Definition 13.7 norm identity.
-/
theorem newtonStep_mem_dikinEllipsoid_of_newtonDecrement_lt
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E} {r : ℝ}
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hlambda : newtonDecrement grad invHess x < r) :
    newtonStep grad invHess x ∈ dikinEllipsoid hess x r := by
  simpa [dikinEllipsoid, hstep_norm] using hlambda

/--
The same Dikin membership consequence, discharging the Definition 13.7 norm
identity from the supplied Hessian/inverse-Hessian quadratic identity.
-/
theorem newtonStep_mem_dikinEllipsoid_of_inner_of_newtonDecrement_lt
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E} {r : ℝ}
    (hinner :
      inner ℝ (invHess x (grad x)) (hess x (invHess x (grad x))) =
        inner ℝ (grad x) (invHess x (grad x)))
    (hlambda : newtonDecrement grad invHess x < r) :
    newtonStep grad invHess x ∈ dikinEllipsoid hess x r :=
  newtonStep_mem_dikinEllipsoid_of_newtonDecrement_lt
    (hess := hess) (grad := grad) (invHess := invHess) (x := x) (r := r)
    (localNorm_newtonStep_sub_eq_newtonDecrement_of_inner
      (hess := hess) (grad := grad) (invHess := invHess) (x := x) hinner)
    hlambda

/--
Newton decrement form of the source condition `x⁺ ∈ Dikin(x, 1/M)` used
before applying Lemma 13.6 to the Newton segment.
-/
theorem newtonStep_mem_dikinEllipsoid_inv_of_mul_newtonDecrement_lt
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E} {M : ℝ}
    (hM_pos : 0 < M)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1) :
    newtonStep grad invHess x ∈ dikinEllipsoid hess x M⁻¹ := by
  apply newtonStep_mem_dikinEllipsoid_of_newtonDecrement_lt
    (hess := hess) (grad := grad) (invHess := invHess) (x := x)
    (r := M⁻¹) hstep_norm
  rw [← one_mul M⁻¹, lt_mul_inv_iff₀ hM_pos]
  simpa [mul_comm] using hMlambda_lt

/--
The same `x⁺ ∈ Dikin(x, 1/M)` gate, with the Definition 13.7 norm identity
discharged from a supplied inverse-Hessian quadratic identity.
-/
theorem newtonStep_mem_dikinEllipsoid_inv_of_inner_of_mul_newtonDecrement_lt
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E} {M : ℝ}
    (hM_pos : 0 < M)
    (hinner :
      inner ℝ (invHess x (grad x)) (hess x (invHess x (grad x))) =
        inner ℝ (grad x) (invHess x (grad x)))
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1) :
    newtonStep grad invHess x ∈ dikinEllipsoid hess x M⁻¹ :=
  newtonStep_mem_dikinEllipsoid_inv_of_mul_newtonDecrement_lt
    (hess := hess) (grad := grad) (invHess := invHess) (x := x) (M := M)
    hM_pos
    (localNorm_newtonStep_sub_eq_newtonDecrement_of_inner
      (hess := hess) (grad := grad) (invHess := invHess) (x := x) hinner)
    hMlambda_lt

/--
Supplied quadratic-form comparison between two Hessian oracles.

This is the algebraic output needed from the analytic self-concordance
argument in Chewi Lemma 13.6: once the Hessian at `y` is sandwiched between
scalar multiples of the Hessian at `x`, local-norm comparison follows by
taking square roots.
-/
structure HessianQuadraticBounds
    (hess : E -> E →L[ℝ] E) (x y : E) (lower upper : ℝ) : Prop where
  lower_bound : ∀ v : E,
    lower * inner ℝ v (hess x v) ≤ inner ℝ v (hess y v)
  upper_bound : ∀ v : E,
    inner ℝ v (hess y v) ≤ upper * inner ℝ v (hess x v)

theorem localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticUpper
    {hess : E -> E →L[ℝ] E} {x y : E} {upper : ℝ}
    (hupper_nonneg : 0 ≤ upper)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hupper : ∀ v : E,
      inner ℝ v (hess y v) ≤ upper * inner ℝ v (hess x v))
    (v : E) :
    localNorm hess y v ≤ Real.sqrt upper * localNorm hess x v := by
  refine (sq_le_sq₀ (localNorm_nonneg hess y v) ?hrhs_nonneg).mp ?hsq
  · exact mul_nonneg (Real.sqrt_nonneg _) (localNorm_nonneg hess x v)
  rw [localNorm_sq_eq_inner (hy_nonneg v)]
  rw [mul_pow, Real.sq_sqrt hupper_nonneg,
    localNorm_sq_eq_inner (hx_nonneg v)]
  exact hupper v

theorem sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticLower
    {hess : E -> E →L[ℝ] E} {x y : E} {lower : ℝ}
    (hlower_nonneg : 0 ≤ lower)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hlower : ∀ v : E,
      lower * inner ℝ v (hess x v) ≤ inner ℝ v (hess y v))
    (v : E) :
    Real.sqrt lower * localNorm hess x v ≤ localNorm hess y v := by
  refine (sq_le_sq₀ ?hlhs_nonneg (localNorm_nonneg hess y v)).mp ?hsq
  · exact mul_nonneg (Real.sqrt_nonneg _) (localNorm_nonneg hess x v)
  rw [mul_pow, Real.sq_sqrt hlower_nonneg,
    localNorm_sq_eq_inner (hx_nonneg v)]
  rw [localNorm_sq_eq_inner (hy_nonneg v)]
  exact hlower v

theorem localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {lower upper : ℝ}
    (hupper_nonneg : 0 ≤ upper)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hbounds : HessianQuadraticBounds hess x y lower upper)
    (v : E) :
    localNorm hess y v ≤ Real.sqrt upper * localNorm hess x v :=
  localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticUpper
    hupper_nonneg hx_nonneg hy_nonneg hbounds.upper_bound v

theorem sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {lower upper : ℝ}
    (hlower_nonneg : 0 ≤ lower)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hbounds : HessianQuadraticBounds hess x y lower upper)
    (v : E) :
    Real.sqrt lower * localNorm hess x v ≤ localNorm hess y v :=
  sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticLower
    hlower_nonneg hx_nonneg hy_nonneg hbounds.lower_bound v

/--
Chewi Lemma 13.6(4), upper local-norm side, after the analytic proof has
supplied the corresponding Hessian quadratic-form upper bound.
-/
theorem localNorm_le_div_one_sub_of_hessianQuadraticUpper
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hupper : ∀ v : E,
      inner ℝ v (hess y v) ≤
        ((1 - M * r)⁻¹) ^ (2 : ℕ) * inner ℝ v (hess x v))
    (v : E) :
    localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  have hupper_nonneg : 0 ≤ ((1 - M * r)⁻¹) ^ (2 : ℕ) := sq_nonneg _
  have hbase :=
    localNorm_le_sqrt_mul_localNorm_of_hessianQuadraticUpper
      (hess := hess) (x := x) (y := y)
      (upper := ((1 - M * r)⁻¹) ^ (2 : ℕ))
      hupper_nonneg hx_nonneg hy_nonneg hupper v
  have hsqrt :
      Real.sqrt (((1 - M * r)⁻¹) ^ (2 : ℕ)) =
        (1 - M * r)⁻¹ := by
    exact Real.sqrt_sq (inv_nonneg.mpr hden_pos.le)
  rw [hsqrt] at hbase
  simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using hbase

/--
Chewi Lemma 13.6(4), lower local-norm side, after the analytic proof has
supplied the corresponding Hessian quadratic-form lower bound.
-/
theorem mul_one_sub_localNorm_le_of_hessianQuadraticLower
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hlower : ∀ v : E,
      (1 - M * r) ^ (2 : ℕ) * inner ℝ v (hess x v) ≤
        inner ℝ v (hess y v))
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  have hlower_nonneg : 0 ≤ (1 - M * r) ^ (2 : ℕ) := sq_nonneg _
  have hbase :=
    sqrt_mul_localNorm_le_localNorm_of_hessianQuadraticLower
      (hess := hess) (x := x) (y := y)
      (lower := (1 - M * r) ^ (2 : ℕ))
      hlower_nonneg hx_nonneg hy_nonneg hlower v
  have hsqrt :
      Real.sqrt ((1 - M * r) ^ (2 : ℕ)) = 1 - M * r := by
    exact Real.sqrt_sq hden_pos.le
  simpa [hsqrt, mul_comm, mul_left_comm, mul_assoc] using hbase

/--
Reverse algebra for Chewi Lemma 13.6: a supplied local-norm upper comparison
implies the corresponding Hessian quadratic-form upper comparison.
-/
theorem hessianQuadraticUpper_of_localNorm_le_div
    {hess : E -> E →L[ℝ] E} {x y : E} {den : ℝ}
    (hden_pos : 0 < den)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hnorm : ∀ v : E, localNorm hess y v ≤ localNorm hess x v / den)
    (v : E) :
    inner ℝ v (hess y v) ≤ den⁻¹ ^ (2 : ℕ) * inner ℝ v (hess x v) := by
  have hrhs_nonneg : 0 ≤ localNorm hess x v / den :=
    div_nonneg (localNorm_nonneg hess x v) hden_pos.le
  have hsq :
      (localNorm hess y v) ^ (2 : ℕ) ≤
        (localNorm hess x v / den) ^ (2 : ℕ) :=
    (sq_le_sq₀ (localNorm_nonneg hess y v) hrhs_nonneg).2 (hnorm v)
  rw [localNorm_sq_eq_inner (hy_nonneg v)] at hsq
  rw [div_pow, localNorm_sq_eq_inner (hx_nonneg v)] at hsq
  have hden_ne : den ≠ 0 := hden_pos.ne'
  calc
    inner ℝ v (hess y v) ≤ inner ℝ v (hess x v) / den ^ (2 : ℕ) := hsq
    _ = den⁻¹ ^ (2 : ℕ) * inner ℝ v (hess x v) := by
      field_simp [hden_ne]

/--
Denominator-shaped version of `hessianQuadraticUpper_of_localNorm_le_div`.
-/
theorem hessianQuadraticUpper_of_localNorm_le_div_one_sub
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hnorm : ∀ v : E,
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r))
    (v : E) :
    inner ℝ v (hess y v) ≤
      ((1 - M * r)⁻¹) ^ (2 : ℕ) * inner ℝ v (hess x v) := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  exact hessianQuadraticUpper_of_localNorm_le_div
    (hess := hess) (x := x) (y := y) (den := 1 - M * r)
    hden_pos hx_nonneg hy_nonneg hnorm v

/--
Reverse algebra for Chewi Lemma 13.6: a supplied local-norm lower comparison
implies the corresponding Hessian quadratic-form lower comparison.
-/
theorem hessianQuadraticLower_of_mul_le_localNorm
    {hess : E -> E →L[ℝ] E} {x y : E} {den : ℝ}
    (hden_nonneg : 0 ≤ den)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hnorm : ∀ v : E, den * localNorm hess x v ≤ localNorm hess y v)
    (v : E) :
    den ^ (2 : ℕ) * inner ℝ v (hess x v) ≤ inner ℝ v (hess y v) := by
  have hlhs_nonneg : 0 ≤ den * localNorm hess x v :=
    mul_nonneg hden_nonneg (localNorm_nonneg hess x v)
  have hsq :
      (den * localNorm hess x v) ^ (2 : ℕ) ≤
        (localNorm hess y v) ^ (2 : ℕ) :=
    (sq_le_sq₀ hlhs_nonneg (localNorm_nonneg hess y v)).2 (hnorm v)
  rw [mul_pow, localNorm_sq_eq_inner (hx_nonneg v),
    localNorm_sq_eq_inner (hy_nonneg v)] at hsq
  simpa [mul_comm, mul_left_comm, mul_assoc] using hsq

/--
Denominator-shaped version of `hessianQuadraticLower_of_mul_le_localNorm`.
-/
theorem hessianQuadraticLower_of_mul_one_sub_localNorm_le
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hnorm : ∀ v : E,
      (1 - M * r) * localNorm hess x v ≤ localNorm hess y v)
    (v : E) :
    (1 - M * r) ^ (2 : ℕ) * inner ℝ v (hess x v) ≤
      inner ℝ v (hess y v) := by
  have hden_nonneg : 0 ≤ 1 - M * r := by nlinarith
  exact hessianQuadraticLower_of_mul_le_localNorm
    (hess := hess) (x := x) (y := y) (den := 1 - M * r)
    hden_nonneg hx_nonneg hy_nonneg hnorm v

/--
Supplied quadratic-form comparison between two inverse-Hessian oracles.  This
is the dual-local-norm analogue of `HessianQuadraticBounds`.
-/
structure InverseHessianQuadraticBounds
    (invHess : E -> E →L[ℝ] E) (x y : E) (lower upper : ℝ) : Prop where
  lower_bound : ∀ v : E,
    lower * inner ℝ v (invHess x v) ≤ inner ℝ v (invHess y v)
  upper_bound : ∀ v : E,
    inner ℝ v (invHess y v) ≤ upper * inner ℝ v (invHess x v)

theorem dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticUpper
    {invHess : E -> E →L[ℝ] E} {x y : E} {upper : ℝ}
    (hupper_nonneg : 0 ≤ upper)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess y v) ≤ upper * inner ℝ v (invHess x v))
    (v : E) :
    dualLocalNorm invHess y v ≤ Real.sqrt upper * dualLocalNorm invHess x v := by
  refine (sq_le_sq₀ (dualLocalNorm_nonneg invHess y v) ?hrhs_nonneg).mp ?hsq
  · exact mul_nonneg (Real.sqrt_nonneg _) (dualLocalNorm_nonneg invHess x v)
  rw [dualLocalNorm_sq_eq_inner (hy_nonneg v)]
  rw [mul_pow, Real.sq_sqrt hupper_nonneg,
    dualLocalNorm_sq_eq_inner (hx_nonneg v)]
  exact hupper v

theorem sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticLower
    {invHess : E -> E →L[ℝ] E} {x y : E} {lower : ℝ}
    (hlower_nonneg : 0 ≤ lower)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hlower : ∀ v : E,
      lower * inner ℝ v (invHess x v) ≤ inner ℝ v (invHess y v))
    (v : E) :
    Real.sqrt lower * dualLocalNorm invHess x v ≤ dualLocalNorm invHess y v := by
  refine (sq_le_sq₀ ?hlhs_nonneg (dualLocalNorm_nonneg invHess y v)).mp ?hsq
  · exact mul_nonneg (Real.sqrt_nonneg _) (dualLocalNorm_nonneg invHess x v)
  rw [mul_pow, Real.sq_sqrt hlower_nonneg,
    dualLocalNorm_sq_eq_inner (hx_nonneg v)]
  rw [dualLocalNorm_sq_eq_inner (hy_nonneg v)]
  exact hlower v

theorem dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticBounds
    {invHess : E -> E →L[ℝ] E} {x y : E} {lower upper : ℝ}
    (hupper_nonneg : 0 ≤ upper)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hbounds : InverseHessianQuadraticBounds invHess x y lower upper)
    (v : E) :
    dualLocalNorm invHess y v ≤ Real.sqrt upper * dualLocalNorm invHess x v :=
  dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticUpper
    hupper_nonneg hx_nonneg hy_nonneg hbounds.upper_bound v

theorem sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticBounds
    {invHess : E -> E →L[ℝ] E} {x y : E} {lower upper : ℝ}
    (hlower_nonneg : 0 ≤ lower)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hbounds : InverseHessianQuadraticBounds invHess x y lower upper)
    (v : E) :
    Real.sqrt lower * dualLocalNorm invHess x v ≤ dualLocalNorm invHess y v :=
  sqrt_mul_dualLocalNorm_le_dualLocalNorm_of_inverseHessianQuadraticLower
    hlower_nonneg hx_nonneg hy_nonneg hbounds.lower_bound v

/--
Dual-local-norm upper transport with the same denominator used in Theorem
13.8, once the inverse-Hessian quadratic upper bound has been supplied.
-/
theorem dualLocalNorm_le_div_one_sub_of_inverseHessianQuadraticUpper
    {invHess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess y v) ≤
        ((1 - M * r)⁻¹) ^ (2 : ℕ) * inner ℝ v (invHess x v))
    (v : E) :
    dualLocalNorm invHess y v ≤
      dualLocalNorm invHess x v / (1 - M * r) := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  have hupper_nonneg : 0 ≤ ((1 - M * r)⁻¹) ^ (2 : ℕ) := sq_nonneg _
  have hbase :=
    dualLocalNorm_le_sqrt_mul_dualLocalNorm_of_inverseHessianQuadraticUpper
      (invHess := invHess) (x := x) (y := y)
      (upper := ((1 - M * r)⁻¹) ^ (2 : ℕ))
      hupper_nonneg hx_nonneg hy_nonneg hupper v
  have hsqrt :
      Real.sqrt (((1 - M * r)⁻¹) ^ (2 : ℕ)) =
        (1 - M * r)⁻¹ := by
    exact Real.sqrt_sq (inv_nonneg.mpr hden_pos.le)
  rw [hsqrt] at hbase
  simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using hbase

/--
Reverse algebra for the dual half of Chewi Lemma 13.6: a supplied dual-local
norm upper comparison implies the corresponding inverse-Hessian quadratic-form
upper comparison.
-/
theorem inverseHessianQuadraticUpper_of_dualLocalNorm_le_div
    {invHess : E -> E →L[ℝ] E} {x y : E} {den : ℝ}
    (hden_pos : 0 < den)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hnorm : ∀ v : E, dualLocalNorm invHess y v ≤
      dualLocalNorm invHess x v / den)
    (v : E) :
    inner ℝ v (invHess y v) ≤
      den⁻¹ ^ (2 : ℕ) * inner ℝ v (invHess x v) := by
  have hrhs_nonneg : 0 ≤ dualLocalNorm invHess x v / den :=
    div_nonneg (dualLocalNorm_nonneg invHess x v) hden_pos.le
  have hsq :
      (dualLocalNorm invHess y v) ^ (2 : ℕ) ≤
        (dualLocalNorm invHess x v / den) ^ (2 : ℕ) :=
    (sq_le_sq₀ (dualLocalNorm_nonneg invHess y v) hrhs_nonneg).2
      (hnorm v)
  rw [dualLocalNorm_sq_eq_inner (hy_nonneg v)] at hsq
  rw [div_pow, dualLocalNorm_sq_eq_inner (hx_nonneg v)] at hsq
  have hden_ne : den ≠ 0 := hden_pos.ne'
  calc
    inner ℝ v (invHess y v) ≤
        inner ℝ v (invHess x v) / den ^ (2 : ℕ) := hsq
    _ = den⁻¹ ^ (2 : ℕ) * inner ℝ v (invHess x v) := by
      field_simp [hden_ne]

/--
Denominator-shaped version of
`inverseHessianQuadraticUpper_of_dualLocalNorm_le_div`.
-/
theorem inverseHessianQuadraticUpper_of_dualLocalNorm_le_div_one_sub
    {invHess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hnorm : ∀ v : E, dualLocalNorm invHess y v ≤
      dualLocalNorm invHess x v / (1 - M * r))
    (v : E) :
    inner ℝ v (invHess y v) ≤
      ((1 - M * r)⁻¹) ^ (2 : ℕ) * inner ℝ v (invHess x v) := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  exact inverseHessianQuadraticUpper_of_dualLocalNorm_le_div
    (invHess := invHess) (x := x) (y := y) (den := 1 - M * r)
    hden_pos hx_nonneg hy_nonneg hnorm v

/--
Dual-local-norm transport from a primal local-norm lower comparison.  This is
the Hilbert-space duality step behind the dual half of Chewi Lemma 13.6, stated
with the exact Cauchy bridge and inverse-local identity as supplied interfaces.
-/
theorem dualLocalNorm_le_div_of_localNorm_lower_and_inverseIdentity
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x y : E} {den : ℝ}
    (hden_pos : 0 < den)
    (hy_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hlower : ∀ w : E, den * localNorm hess x w ≤ localNorm hess y w)
    (hy_inv_local : ∀ v : E,
      localNorm hess y (invHess y v) = dualLocalNorm invHess y v)
    (hx_cauchy : ∀ v w : E,
      inner ℝ v w ≤ dualLocalNorm invHess x v * localNorm hess x w)
    (v : E) :
    dualLocalNorm invHess y v ≤ dualLocalNorm invHess x v / den := by
  let Dy := dualLocalNorm invHess y v
  let Dx := dualLocalNorm invHess x v
  let w := invHess y v
  change Dy ≤ Dx / den
  have hDy_nonneg : 0 ≤ Dy := by
    dsimp [Dy]
    exact dualLocalNorm_nonneg invHess y v
  have hDx_nonneg : 0 ≤ Dx := by
    dsimp [Dx]
    exact dualLocalNorm_nonneg invHess x v
  by_cases hDy_zero : Dy = 0
  · rw [hDy_zero]
    exact div_nonneg hDx_nonneg hden_pos.le
  have hDy_pos : 0 < Dy := lt_of_le_of_ne hDy_nonneg (Ne.symm hDy_zero)
  have hsq : Dy ^ (2 : ℕ) = inner ℝ v w := by
    dsimp [Dy, w]
    exact dualLocalNorm_sq_eq_inner (hy_inv_nonneg v)
  have hlx : localNorm hess x w ≤ localNorm hess y w / den := by
    exact (le_div_iff₀ hden_pos).2 (by simpa [mul_comm] using hlower w)
  have hinner_bound : inner ℝ v w ≤ Dx * (Dy / den) := by
    calc
      inner ℝ v w ≤ Dx * localNorm hess x w := by
        simpa [Dx, w] using hx_cauchy v w
      _ ≤ Dx * (localNorm hess y w / den) := by
        exact mul_le_mul_of_nonneg_left hlx hDx_nonneg
      _ = Dx * (Dy / den) := by
        simp [Dy, w, hy_inv_local v]
  have hsqbound : Dy ^ (2 : ℕ) ≤ Dx * (Dy / den) := by
    calc
      Dy ^ (2 : ℕ) = inner ℝ v w := hsq
      _ ≤ Dx * (Dy / den) := hinner_bound
  have hden_ne : den ≠ 0 := hden_pos.ne'
  have hsqbound' : Dy * Dy ≤ (Dx / den) * Dy := by
    calc
      Dy * Dy = Dy ^ (2 : ℕ) := by ring
      _ ≤ Dx * (Dy / den) := hsqbound
      _ = (Dx / den) * Dy := by
        field_simp [hden_ne]
  exact le_of_mul_le_mul_right hsqbound' hDy_pos

/--
Denominator-shaped version of
`dualLocalNorm_le_div_of_localNorm_lower_and_inverseIdentity`.
-/
theorem dualLocalNorm_le_div_one_sub_of_localNorm_lower_and_inverseIdentity
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hy_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess y v))
    (hlower : ∀ w : E,
      (1 - M * r) * localNorm hess x w ≤ localNorm hess y w)
    (hy_inv_local : ∀ v : E,
      localNorm hess y (invHess y v) = dualLocalNorm invHess y v)
    (hx_cauchy : ∀ v w : E,
      inner ℝ v w ≤ dualLocalNorm invHess x v * localNorm hess x w)
    (v : E) :
    dualLocalNorm invHess y v ≤
      dualLocalNorm invHess x v / (1 - M * r) := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  exact dualLocalNorm_le_div_of_localNorm_lower_and_inverseIdentity
    (hess := hess) (invHess := invHess) (x := x) (y := y)
    (den := 1 - M * r) hden_pos hy_inv_nonneg hlower hy_inv_local
    hx_cauchy v

/--
Mixed primal/dual quadratic-form estimate: if a supplied residual has dual
quadratic form bounded by `coeff^2` times a supplied step's primal quadratic
form, then its dual local norm is bounded by `coeff` times the step local norm.
-/
theorem dualLocalNorm_le_mul_localNorm_of_quadratic_bound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x : E} {residual step : E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hinv_nonneg : 0 ≤ inner ℝ residual (invHess x residual))
    (hhess_nonneg : 0 ≤ inner ℝ step (hess x step))
    (hquad :
      inner ℝ residual (invHess x residual) ≤
        coeff ^ (2 : ℕ) * inner ℝ step (hess x step)) :
    dualLocalNorm invHess x residual ≤ coeff * localNorm hess x step := by
  refine (sq_le_sq₀ (dualLocalNorm_nonneg invHess x residual) ?hrhs_nonneg).mp ?hsq
  · exact mul_nonneg hcoeff_nonneg (localNorm_nonneg hess x step)
  rw [dualLocalNorm_sq_eq_inner hinv_nonneg]
  rw [mul_pow, localNorm_sq_eq_inner hhess_nonneg]
  exact hquad

/--
Source-shaped Delta operator quadratic bound for Chewi Theorem 13.8.  The
operator `delta` represents the integrated Hessian difference
`∫ Hess(z_t) dt - Hess(x)`.
-/
structure HessianDeltaQuadraticBound
    (hess : E -> E →L[ℝ] E) (invHess : E -> E →L[ℝ] E)
    (x : E) (delta : E →L[ℝ] E) (coeff : ℝ) : Prop where
  bound : ∀ step : E,
    inner ℝ (delta step) (invHess x (delta step)) ≤
      coeff ^ (2 : ℕ) * inner ℝ step (hess x step)

/--
Convert a Chewi Theorem 13.8 Delta operator quadratic bound into a dual
local-norm bound for its action on any step.
-/
theorem dualLocalNorm_delta_le_of_hessianDeltaQuadraticBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x : E} {delta : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hinv_nonneg : ∀ step : E,
      0 ≤ inner ℝ (delta step) (invHess x (delta step)))
    (hhess_nonneg : ∀ step : E, 0 ≤ inner ℝ step (hess x step))
    (hdelta : HessianDeltaQuadraticBound hess invHess x delta coeff)
    (step : E) :
    dualLocalNorm invHess x (delta step) ≤
      coeff * localNorm hess x step :=
  dualLocalNorm_le_mul_localNorm_of_quadratic_bound
    (hess := hess) (invHess := invHess) (x := x)
    (residual := delta step) (step := step) (coeff := coeff)
    hcoeff_nonneg (hinv_nonneg step) (hhess_nonneg step) (hdelta.bound step)

/-- Chewi Lemma 13.6's displayed exponential constant for the `ψ(t)` step. -/
noncomputable def chewi136HessianStabilityExponent (M r : ℝ) : ℝ :=
  2 * Real.log ((1 - M * r)⁻¹)

/-- Antiderivative of Chewi Lemma 13.6's variable coefficient. -/
noncomputable def chewi136HessianStabilityPrimitive
    (M r t : ℝ) : ℝ :=
  2 * Real.log ((1 - M * r * t)⁻¹)

theorem chewi136HessianStabilityPrimitive_zero (M r : ℝ) :
    chewi136HessianStabilityPrimitive M r 0 = 0 := by
  simp [chewi136HessianStabilityPrimitive]

theorem chewi136HessianStabilityPrimitive_one (M r : ℝ) :
    chewi136HessianStabilityPrimitive M r 1 =
      chewi136HessianStabilityExponent M r := by
  simp [chewi136HessianStabilityPrimitive, chewi136HessianStabilityExponent]

theorem chewi136HessianStabilityPrimitive_hasDerivAt
    {M r t : ℝ} (hden_ne : 1 - M * r * t ≠ 0) :
    HasDerivAt (fun s : ℝ => chewi136HessianStabilityPrimitive M r s)
      (2 * M * r / (1 - M * r * t)) t := by
  have hu : HasDerivAt (fun s : ℝ => 1 - M * r * s) (-(M * r)) t := by
    have hlin : HasDerivAt (fun s : ℝ => M * r * s) (M * r) t := by
      simpa [mul_assoc] using (hasDerivAt_id t).const_mul (M * r)
    simpa using (hasDerivAt_const t (1 : ℝ)).sub hlin
  have hlog : HasDerivAt (fun s : ℝ => Real.log (1 - M * r * s))
      (-(M * r) / (1 - M * r * t)) t := by
    simpa using hu.log hden_ne
  have hmul := hlog.neg.const_mul 2
  have hcoef : 2 * - (-(M * r) / (1 - M * r * t)) =
      2 * M * r / (1 - M * r * t) := by
    ring
  rw [← hcoef]
  convert hmul using 1
  funext s
  simp [chewi136HessianStabilityPrimitive, Real.log_inv]

theorem chewi136HessianStabilityPrimitive_continuousOn_Icc
    {M r : ℝ} (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) :
    ContinuousOn (fun s : ℝ => chewi136HessianStabilityPrimitive M r s)
      (Set.Icc (0 : ℝ) 1) := by
  have hden_cont : ContinuousOn (fun s : ℝ => 1 - M * r * s)
      (Set.Icc (0 : ℝ) 1) := by
    fun_prop
  have hden_ne : ∀ x ∈ Set.Icc (0 : ℝ) 1, 1 - M * r * x ≠ 0 := by
    intro x hx
    have hmul_le : M * r * x ≤ M * r :=
      mul_le_of_le_one_right hMr_nonneg hx.2
    have hden_pos : 0 < 1 - M * r * x := by nlinarith
    exact hden_pos.ne'
  have hinv_cont : ContinuousOn (fun s : ℝ => (1 - M * r * s)⁻¹)
      (Set.Icc (0 : ℝ) 1) :=
    hden_cont.inv₀ hden_ne
  have hlog_cont : ContinuousOn
      (fun s : ℝ => Real.log ((1 - M * r * s)⁻¹))
      (Set.Icc (0 : ℝ) 1) :=
    hinv_cont.log (by
      intro x hx
      exact inv_ne_zero (hden_ne x hx))
  simpa [chewi136HessianStabilityPrimitive] using hlog_cont.const_mul 2

theorem chewi136HessianStabilityPrimitive_hasDerivWithinAt_Icc
    {M r : ℝ} (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) :
    ∀ s, s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      HasDerivWithinAt
        (fun u : ℝ => chewi136HessianStabilityPrimitive M r u)
        (2 * M * r / (1 - M * r * s))
        (interior (Set.Icc (0 : ℝ) 1)) s := by
  intro s hs
  have hsIoo : s ∈ Set.Ioo (0 : ℝ) 1 := by
    simpa [interior_Icc] using hs
  have hmul_le : M * r * s ≤ M * r :=
    mul_le_of_le_one_right hMr_nonneg hsIoo.2.le
  have hden_pos : 0 < 1 - M * r * s := by nlinarith
  exact (chewi136HessianStabilityPrimitive_hasDerivAt
    (M := M) (r := r) (t := s) hden_pos.ne').hasDerivWithinAt

theorem chewi136_exp_stability_upper
    {M r : ℝ} (hden_pos : 0 < 1 - M * r) :
    Real.exp (chewi136HessianStabilityExponent M r) =
      ((1 - M * r)⁻¹) ^ (2 : ℕ) := by
  have hinv_pos : 0 < (1 - M * r)⁻¹ := inv_pos.mpr hden_pos
  rw [chewi136HessianStabilityExponent]
  rw [show 2 * Real.log ((1 - M * r)⁻¹) =
      Real.log ((1 - M * r)⁻¹) + Real.log ((1 - M * r)⁻¹) by ring]
  rw [Real.exp_add]
  rw [Real.exp_log hinv_pos]
  ring

theorem chewi136_exp_stability_lower
    {M r : ℝ} (hden_pos : 0 < 1 - M * r) :
    Real.exp (-(chewi136HessianStabilityExponent M r)) =
      (1 - M * r) ^ (2 : ℕ) := by
  have hupper := chewi136_exp_stability_upper (M := M) (r := r) hden_pos
  rw [Real.exp_neg, hupper]
  field_simp [hden_pos.ne']

/--
Source-shaped output of Chewi Lemma 13.6's segment `ψ(t)` Gronwall argument.
The hard analytic work is to prove these two endpoint exponential estimates;
the theorems below turn them into the textbook Hessian and local-norm
sandwiches.
-/
structure HessianSegmentExponentialBounds
    (hess : E -> E →L[ℝ] E) (x y : E) (M r : ℝ) : Prop where
  lower_exp : ∀ v : E,
    inner ℝ v (hess x v) *
        Real.exp (-(chewi136HessianStabilityExponent M r)) ≤
      inner ℝ v (hess y v)
  upper_exp : ∀ v : E,
    inner ℝ v (hess y v) ≤
      inner ℝ v (hess x v) *
        Real.exp (chewi136HessianStabilityExponent M r)

/-- Chewi Lemma 13.6 segment point `z_t = (1-t) x + t y`. -/
def hessianSegmentPoint (x y : E) (t : ℝ) : E :=
  (1 - t) • x + t • y

theorem hessianSegmentPoint_zero (x y : E) :
    hessianSegmentPoint x y 0 = x := by
  simp [hessianSegmentPoint]

theorem hessianSegmentPoint_one (x y : E) :
    hessianSegmentPoint x y 1 = y := by
  simp [hessianSegmentPoint]

theorem hessianSegmentPoint_sub_left (x y : E) (t : ℝ) :
    hessianSegmentPoint x y t - x = t • (y - x) := by
  rw [hessianSegmentPoint]
  module

theorem hessianSegmentPoint_eq_lineMap (x y : E) (t : ℝ) :
    hessianSegmentPoint x y t = AffineMap.lineMap x y t := by
  simp [hessianSegmentPoint, AffineMap.lineMap_apply_module]

theorem hessianSegmentPoint_mem_of_convex
    {s : Set E} (hs : Convex ℝ s) {x y : E}
    (hx : x ∈ s) (hy : y ∈ s) {t : ℝ}
    (ht : t ∈ Set.Icc (0 : ℝ) 1) :
    hessianSegmentPoint x y t ∈ s := by
  rw [hessianSegmentPoint_eq_lineMap]
  exact hs.lineMap_mem hx hy ht

theorem hessianSegmentPoint_mem_of_convex_interior
    {s : Set E} (hs : Convex ℝ s) {x y : E}
    (hx : x ∈ s) (hy : y ∈ s) {t : ℝ}
    (ht : t ∈ interior (Set.Icc (0 : ℝ) 1)) :
    hessianSegmentPoint x y t ∈ s :=
  hessianSegmentPoint_mem_of_convex hs hx hy (interior_subset ht)

theorem hessianSegmentPoint_continuous (x y : E) :
    Continuous (hessianSegmentPoint x y) := by
  have hleft : Continuous fun t : ℝ => (1 - t) • x := by
    exact (continuous_const.sub continuous_id).smul continuous_const
  have hright : Continuous fun t : ℝ => t • y := by
    exact continuous_id.smul continuous_const
  simpa [hessianSegmentPoint] using hleft.add hright

theorem hessianSegmentPoint_hasDerivAt (x y : E) (t : ℝ) :
    HasDerivAt (hessianSegmentPoint x y) (y - x) t := by
  have hone_sub : HasDerivAt (fun s : ℝ => 1 - s) (-1) t := by
    simpa using (hasDerivAt_const t (1 : ℝ)).sub (hasDerivAt_id t)
  have hleft : HasDerivAt (fun s : ℝ => (1 - s) • x) (-x) t := by
    simpa using hone_sub.smul_const x
  have hright : HasDerivAt (fun s : ℝ => s • y) y t := by
    simpa using (hasDerivAt_id t).smul_const y
  have hsum := hleft.add hright
  convert hsum using 1
  simp [sub_eq_add_neg, add_comm]

/-- Concrete per-vector `ψ(t) = <v, Hess(z_t) v>` used in Chewi Lemma 13.6. -/
def hessianSegmentPsi
    (hess : E -> E →L[ℝ] E) (x y v : E) (t : ℝ) : ℝ :=
  inner ℝ v (hess (hessianSegmentPoint x y t) v)

theorem hessianSegmentPsi_zero
    (hess : E -> E →L[ℝ] E) (x y v : E) :
    hessianSegmentPsi hess x y v 0 = inner ℝ v (hess x v) := by
  simp [hessianSegmentPsi, hessianSegmentPoint_zero]

theorem hessianSegmentPsi_one
    (hess : E -> E →L[ℝ] E) (x y v : E) :
    hessianSegmentPsi hess x y v 1 = inner ℝ v (hess y v) := by
  simp [hessianSegmentPsi, hessianSegmentPoint_one]

theorem hessianSegmentPsi_continuousOn_of_continuousOn
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s) :
    ∀ v : E, ContinuousOn (hessianSegmentPsi hess x y v)
      (Set.Icc (0 : ℝ) 1) := by
  intro v
  have hz : ContinuousOn
      (fun t : ℝ => hess (hessianSegmentPoint x y t))
      (Set.Icc (0 : ℝ) 1) :=
    hhess.comp (hessianSegmentPoint_continuous x y).continuousOn hseg
  have happly : ContinuousOn
      (fun t : ℝ => hess (hessianSegmentPoint x y t) v)
      (Set.Icc (0 : ℝ) 1) :=
    hz.clm_apply continuousOn_const
  exact continuousOn_const.inner happly

theorem hessianSegmentPsi_continuousOn_of_continuous
    {hess : E -> E →L[ℝ] E} (hhess : Continuous hess)
    (x y : E) :
    ∀ v : E, ContinuousOn (hessianSegmentPsi hess x y v)
      (Set.Icc (0 : ℝ) 1) :=
  hessianSegmentPsi_continuousOn_of_continuousOn
    (hess := hess) (s := Set.univ) (x := x) (y := y)
    hhess.continuousOn (by intro t ht; exact Set.mem_univ _)

theorem hessianSegmentPsi_continuousOn_of_convex_continuousOn
    {hess : E -> E →L[ℝ] E} {s : Set E}
    (hs : Convex ℝ s) {x y : E}
    (hx : x ∈ s) (hy : y ∈ s)
    (hhess : ContinuousOn hess s) :
    ∀ v : E, ContinuousOn (hessianSegmentPsi hess x y v)
      (Set.Icc (0 : ℝ) 1) :=
  hessianSegmentPsi_continuousOn_of_continuousOn
    (hess := hess) (s := s) (x := x) (y := y)
    hhess (by
      intro t ht
      exact hessianSegmentPoint_mem_of_convex hs hx hy ht)

theorem hessianSegmentLocalNorm_continuousOn_of_continuousOn
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s) :
    ContinuousOn
      (fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x))
      (Set.Icc (0 : ℝ) 1) := by
  have hpsi :
      ContinuousOn (hessianSegmentPsi hess x y (y - x))
        (Set.Icc (0 : ℝ) 1) :=
    hessianSegmentPsi_continuousOn_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y)
      hhess hseg (y - x)
  simpa [localNorm, hessianSegmentPsi] using hpsi.sqrt

theorem hessianSegmentLocalNorm_continuousOn_of_convex_continuousOn
    {hess : E -> E →L[ℝ] E} {s : Set E}
    (hs : Convex ℝ s) {x y : E}
    (hx : x ∈ s) (hy : y ∈ s)
    (hhess : ContinuousOn hess s) :
    ContinuousOn
      (fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x))
      (Set.Icc (0 : ℝ) 1) :=
  hessianSegmentLocalNorm_continuousOn_of_continuousOn
    (hess := hess) (s := s) (x := x) (y := y)
    hhess (by
      intro t ht
      exact hessianSegmentPoint_mem_of_convex hs hx hy ht)

theorem hessianSegmentLocalNorm_pos_of_hessian_pos
    {s : Set E} {hess : E -> E →L[ℝ] E}
    (hs : Convex ℝ s) {x y : E}
    (hx : x ∈ s) (hy : y ∈ s)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : y - x ≠ 0) :
    ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x) := by
  intro t ht
  exact localNorm_pos_of_inner_pos
    (hess_pos (hessianSegmentPoint_mem_of_convex hs hx hy ht)
      (y - x) hdiff_ne)

theorem hessianSegmentPsi_hasDerivAt_of_hasFDerivAt
    {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {x y v : E} {t : ℝ}
    (hhess : HasFDerivAt hess
      (hessDeriv (hessianSegmentPoint x y t))
      (hessianSegmentPoint x y t)) :
    HasDerivAt (hessianSegmentPsi hess x y v)
      (inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v)) t := by
  have hseg := hessianSegmentPoint_hasDerivAt x y t
  have hcomp :
      HasDerivAt (fun s : ℝ => hess (hessianSegmentPoint x y s))
        (hessDeriv (hessianSegmentPoint x y t) (y - x)) t := by
    have hcomp' :
        HasDerivAt (hess ∘ hessianSegmentPoint x y)
          (hessDeriv (hessianSegmentPoint x y t) (y - x)) t :=
      hhess.comp_hasDerivAt (x := t) hseg
    simpa [Function.comp_def] using hcomp'
  have happly :
      HasDerivAt
        (fun s : ℝ => hess (hessianSegmentPoint x y s) v)
        ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) t := by
    have hconst : HasDerivAt (fun _ : ℝ => v) 0 t :=
      hasDerivAt_const t v
    have happly := hcomp.clm_apply hconst
    simpa using happly
  have hconst_left : HasDerivAt (fun _ : ℝ => v) 0 t :=
    hasDerivAt_const t v
  have hinner := HasDerivAt.inner (𝕜 := ℝ) hconst_left happly
  simpa [hessianSegmentPsi] using hinner

theorem hessianSegmentPsi_hasDerivWithinAt_of_hasFDerivAt
    {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {x y v : E} {t : ℝ} {u : Set ℝ}
    (hhess : HasFDerivAt hess
      (hessDeriv (hessianSegmentPoint x y t))
      (hessianSegmentPoint x y t)) :
    HasDerivWithinAt (hessianSegmentPsi hess x y v)
      (inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v)) u t :=
  (hessianSegmentPsi_hasDerivAt_of_hasFDerivAt
    (hess := hess) (hessDeriv := hessDeriv)
    (x := x) (y := y) (v := v) (t := t) hhess).hasDerivWithinAt

theorem hessianSegmentLocalNorm_hasDerivWithinAt_of_hasFDerivAt
    {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {x y : E} {t : ℝ} {u : Set ℝ}
    (hlocal_pos :
      0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hhess : HasFDerivAt hess
      (hessDeriv (hessianSegmentPoint x y t))
      (hessianSegmentPoint x y t)) :
    HasDerivWithinAt
      (fun s : ℝ => localNorm hess (hessianSegmentPoint x y s) (y - x))
      (inner ℝ (y - x)
          ((hessDeriv (hessianSegmentPoint x y t) (y - x)) (y - x)) /
        (2 * localNorm hess (hessianSegmentPoint x y t) (y - x)))
      u t := by
  have hpsi :=
    hessianSegmentPsi_hasDerivWithinAt_of_hasFDerivAt
      (hess := hess) (hessDeriv := hessDeriv)
      (x := x) (y := y) (v := y - x) (t := t) (u := u) hhess
  have hpsi_ne : hessianSegmentPsi hess x y (y - x) t ≠ 0 := by
    have hsqrt_pos :
        0 < Real.sqrt (hessianSegmentPsi hess x y (y - x) t) := by
      simpa [localNorm, hessianSegmentPsi] using hlocal_pos
    exact (Real.sqrt_pos.mp hsqrt_pos).ne'
  have hsqrt := hpsi.sqrt hpsi_ne
  simpa [localNorm, hessianSegmentPsi] using hsqrt

/--
Per-vector `ψ(t) = <v, Hess(z_t) v>` certificate for Chewi Lemma 13.6's
Hessian-stability proof.  The remaining analytic self-concordance work is to
provide `psi_deriv_bound` from the third-derivative inequality.
-/
structure HessianSegmentPsiCertificate
    (hess : E -> E →L[ℝ] E) (x y : E) (M r : ℝ)
    (psi psiDeriv : E -> ℝ -> ℝ) : Prop where
  psi_zero : ∀ v : E, psi v 0 = inner ℝ v (hess x v)
  psi_one : ∀ v : E, psi v 1 = inner ℝ v (hess y v)
  psi_continuous : ∀ v : E, ContinuousOn (psi v) (Set.Icc (0 : ℝ) 1)
  psi_hasDerivWithin : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      HasDerivWithinAt (psi v) (psiDeriv v s)
        (interior (Set.Icc (0 : ℝ) 1)) s
  psi_deriv_bound : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      |psiDeriv v s| ≤
        (2 * M * r / (1 - M * r * s)) * psi v s

/--
Concrete version of the `ψ` certificate specialized to
`ψ_v(t) = <v, Hess((1-t)x + t y)v>`.
-/
structure HessianSegmentConcretePsiCertificate
    (hess : E -> E →L[ℝ] E) (x y : E) (M r : ℝ)
    (psiDeriv : E -> ℝ -> ℝ) : Prop where
  psi_continuous : ∀ v : E,
    ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1)
  psi_hasDerivWithin : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      HasDerivWithinAt (hessianSegmentPsi hess x y v) (psiDeriv v s)
        (interior (Set.Icc (0 : ℝ) 1)) s
  psi_deriv_bound : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      |psiDeriv v s| ≤
        (2 * M * r / (1 - M * r * s)) *
          hessianSegmentPsi hess x y v s

/--
Mixed-third oracle for Chewi Lemma 13.6's segment proof:
`ψ_v'(t) = ∇³f(z_t)[y - x, v, v]`.
-/
def hessianSegmentMixedThirdPsiDeriv
    (thirdMixed : E -> E -> E -> ℝ) (x y : E) (v : E) (t : ℝ) : ℝ :=
  thirdMixed (hessianSegmentPoint x y t) (y - x) v

theorem hessianSegmentLocalNorm_hasDerivWithinAt_of_mixedThird
    {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {t : ℝ} {u : Set ℝ}
    (hlocal_pos :
      0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hhess : HasFDerivAt hess
      (hessDeriv (hessianSegmentPoint x y t))
      (hessianSegmentPoint x y t))
    (hmixed :
      inner ℝ (y - x)
          ((hessDeriv (hessianSegmentPoint x y t) (y - x)) (y - x)) =
        hessianSegmentMixedThirdPsiDeriv thirdMixed x y (y - x) t) :
    HasDerivWithinAt
      (fun s : ℝ => localNorm hess (hessianSegmentPoint x y s) (y - x))
      (hessianSegmentMixedThirdPsiDeriv thirdMixed x y (y - x) t /
        (2 * localNorm hess (hessianSegmentPoint x y t) (y - x)))
      u t := by
  have hderiv :=
    hessianSegmentLocalNorm_hasDerivWithinAt_of_hasFDerivAt
      (hess := hess) (hessDeriv := hessDeriv)
      (x := x) (y := y) (t := t) (u := u)
      hlocal_pos hhess
  simpa only [hmixed] using hderiv

/--
Source-shaped mixed-third certificate for the concrete segment `ψ_v(t)`.
This is the next analytic gate after the scalar Gronwall layer: prove the
derivative formula and the displayed self-concordance bound for the supplied
mixed third derivative.
-/
structure HessianSegmentMixedThirdCertificate
    (hess : E -> E →L[ℝ] E) (thirdMixed : E -> E -> E -> ℝ)
    (x y : E) (M r : ℝ) : Prop where
  psi_continuous : ∀ v : E,
    ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1)
  psi_hasDerivWithin : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      HasDerivWithinAt (hessianSegmentPsi hess x y v)
        (hessianSegmentMixedThirdPsiDeriv thirdMixed x y v s)
        (interior (Set.Icc (0 : ℝ) 1)) s
  psi_deriv_bound : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      |hessianSegmentMixedThirdPsiDeriv thirdMixed x y v s| ≤
        (2 * M * r / (1 - M * r * s)) *
          hessianSegmentPsi hess x y v s

/--
More decomposed source gate for Chewi Lemma 13.6.  It separates the
self-concordance mixed-third estimate from the segment local-norm estimate
`||y - x||_{z_s} ≤ r / (1 - M r s)`.
-/
structure HessianSegmentMixedThirdLocalNormCertificate
    (hess : E -> E →L[ℝ] E) (thirdMixed : E -> E -> E -> ℝ)
    (x y : E) (M r : ℝ) : Prop where
  psi_continuous : ∀ v : E,
    ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1)
  psi_hasDerivWithin : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      HasDerivWithinAt (hessianSegmentPsi hess x y v)
        (hessianSegmentMixedThirdPsiDeriv thirdMixed x y v s)
        (interior (Set.Icc (0 : ℝ) 1)) s
  psi_nonneg : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      0 ≤ hessianSegmentPsi hess x y v s
  mixed_third_bound : ∀ v : E, ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      |hessianSegmentMixedThirdPsiDeriv thirdMixed x y v s| ≤
        (2 * M * localNorm hess (hessianSegmentPoint x y s) (y - x)) *
          hessianSegmentPsi hess x y v s
  segment_coeff_bound : ∀ s,
    s ∈ interior (Set.Icc (0 : ℝ) 1) ->
      2 * M * localNorm hess (hessianSegmentPoint x y s) (y - x) ≤
        2 * M * r / (1 - M * r * s)

/--
Mixed-third self-concordance interface used for the Hessian-stability proof:
`|∇³f(x)[u,v,v]| ≤ 2 M ||u||_x ||v||_x^2`.
-/
structure MixedThirdSelfConcordantOn
    (s : Set E) (hess : E -> E →L[ℝ] E)
    (thirdMixed : E -> E -> E -> ℝ) (M : ℝ) : Prop where
  parameter_pos : 0 < M
  hess_nonneg : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
    0 ≤ inner ℝ v (hess x v)
  mixed_third_bound : ∀ ⦃x : E⦄, x ∈ s -> ∀ u v : E,
    |thirdMixed x u v| ≤
      2 * M * localNorm hess x u * (localNorm hess x v) ^ (2 : ℕ)

theorem hessianSegmentLocalNorm_riccatiDerivBound_of_mixedThirdSelfConcordantOn
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M : ℝ} {t : ℝ}
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hz : hessianSegmentPoint x y t ∈ s)
    (hlocal_pos :
      0 < localNorm hess (hessianSegmentPoint x y t) (y - x)) :
    hessianSegmentMixedThirdPsiDeriv thirdMixed x y (y - x) t /
        (2 * localNorm hess (hessianSegmentPoint x y t) (y - x)) ≤
      M * (localNorm hess (hessianSegmentPoint x y t) (y - x)) ^ (2 : ℕ) := by
  have hden_pos :
      0 < 2 * localNorm hess (hessianSegmentPoint x y t) (y - x) := by
    nlinarith
  have hbound := hsc.mixed_third_bound hz (y - x) (y - x)
  have hd_le :
      hessianSegmentMixedThirdPsiDeriv thirdMixed x y (y - x) t ≤
        2 * M * localNorm hess (hessianSegmentPoint x y t) (y - x) *
          (localNorm hess (hessianSegmentPoint x y t) (y - x)) ^ (2 : ℕ) := by
    exact (le_abs_self _).trans (by
      simpa [hessianSegmentMixedThirdPsiDeriv] using hbound)
  rw [div_le_iff₀ hden_pos]
  nlinarith [hd_le]

theorem HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hseg : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        hessianSegmentPoint x y t ∈ s)
    (hpsi_cont : ∀ v : E,
      ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1))
    (hpsi_deriv : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt (hessianSegmentPsi hess x y v)
          (hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hsegment_coeff : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M * localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          2 * M * r / (1 - M * r * t)) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r where
  psi_continuous := hpsi_cont
  psi_hasDerivWithin := hpsi_deriv
  psi_nonneg := by
    intro v t ht
    exact hsc.hess_nonneg (hseg t ht) v
  mixed_third_bound := by
    intro v t ht
    have hz := hseg t ht
    have hquad : 0 ≤ inner ℝ v
        (hess (hessianSegmentPoint x y t) v) :=
      hsc.hess_nonneg hz v
    have hbound := hsc.mixed_third_bound hz (y - x) v
    have hsq :
        (localNorm hess (hessianSegmentPoint x y t) v) ^ (2 : ℕ) =
          hessianSegmentPsi hess x y v t := by
      rw [localNorm_sq_eq_inner hquad]
      rfl
    simpa [hessianSegmentMixedThirdPsiDeriv, hsq, mul_assoc]
      using hbound
  segment_coeff_bound := hsegment_coeff

theorem HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn_of_hasFDerivAt
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hseg : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        hessianSegmentPoint x y t ∈ s)
    (hpsi_cont : ∀ v : E,
      ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1))
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hsegment_coeff : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M * localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          2 * M * r / (1 - M * r * t)) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
  HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn
    (s := s) (hess := hess) (thirdMixed := thirdMixed)
    (x := x) (y := y) (M := M) (r := r)
    hsc hseg hpsi_cont
    (by
      intro v t ht
      have hderiv :=
        hessianSegmentPsi_hasDerivWithinAt_of_hasFDerivAt
          (hess := hess) (hessDeriv := hessDeriv)
          (x := x) (y := y) (v := v) (t := t)
          (u := interior (Set.Icc (0 : ℝ) 1)) (hhess t ht)
      simpa only [hmixed v t ht] using hderiv)
    hsegment_coeff

theorem HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hsegment_coeff : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M * localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          2 * M * r / (1 - M * r * t)) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
  HessianSegmentMixedThirdLocalNormCertificate.of_mixedThirdSelfConcordantOn_of_hasFDerivAt
    (s := s) (hess := hess) (hessDeriv := hessDeriv)
    (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
    hsc
    (by
      intro t ht
      exact hessianSegmentPoint_mem_of_convex_interior hs hx hy ht)
    (hessianSegmentPsi_continuousOn_of_convex_continuousOn hs hx hy hhess_cont)
    hhess hmixed hsegment_coeff

theorem hessianSegmentCoeffBound_of_localNorm_bound
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hsegment_norm : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          r / (1 - M * r * t)) :
    ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        2 * M * localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          2 * M * r / (1 - M * r * t) := by
  intro t ht
  have hcoeff_nonneg : 0 ≤ 2 * M := by nlinarith
  have hmul := mul_le_mul_of_nonneg_left (hsegment_norm t ht) hcoeff_nonneg
  simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using hmul

/--
Segment-local-norm Riccati comparison in the exact shape needed by Chewi
Lemma 13.6.  Once the analytic proof supplies
`d/dt ||y - x||_{z_t} ≤ M ||y - x||_{z_t}^2`, this theorem gives the displayed
bound up to any time whose denominator is positive.
-/
theorem hessianSegmentLocalNorm_le_of_riccati_bound
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    {localNormDeriv : ℝ -> ℝ}
    (hr_pos : 0 < r)
    (hqcont : ContinuousOn
      (fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x))
      (Set.Icc (0 : ℝ) 1))
    (hq_pos : ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hqderiv : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun s : ℝ => localNorm hess (hessianSegmentPoint x y s) (y - x))
          (localNormDeriv t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hderiv_bound : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNormDeriv t ≤
          M * (localNorm hess (hessianSegmentPoint x y t) (y - x)) ^ (2 : ℕ))
    (hzero : localNorm hess x (y - x) ≤ r) :
    ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        0 < 1 - M * r * t ->
          localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
            r / (1 - M * r * t) := by
  have hzero' :
      (fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x)) 0 ≤
        r := by
    simpa [hessianSegmentPoint_zero] using hzero
  have hscalar :=
    scalar_riccati_upper_bound_on_unit_interval
      (q := fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x))
      (q' := localNormDeriv) (M := M) (r := r)
      hr_pos hqcont hq_pos hqderiv hderiv_bound hzero'
  intro t ht hden_pos
  exact hscalar t (interior_subset ht) hden_pos

/--
Source-shaped denominator-positive version of
`hessianSegmentLocalNorm_le_of_riccati_bound`: if `0 ≤ M*r < 1`, every
interior segment time has the positive denominator needed by the Riccati
comparison.
-/
theorem hessianSegmentLocalNorm_le_of_riccati_bound_of_mul_lt
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    {localNormDeriv : ℝ -> ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hr_pos : 0 < r)
    (hqcont : ContinuousOn
      (fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x))
      (Set.Icc (0 : ℝ) 1))
    (hq_pos : ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hqderiv : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun s : ℝ => localNorm hess (hessianSegmentPoint x y s) (y - x))
          (localNormDeriv t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hderiv_bound : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNormDeriv t ≤
          M * (localNorm hess (hessianSegmentPoint x y t) (y - x)) ^ (2 : ℕ))
    (hzero : localNorm hess x (y - x) ≤ r) :
    ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          r / (1 - M * r * t) := by
  intro t ht
  have htIoo : t ∈ Set.Ioo (0 : ℝ) 1 := by
    simpa [interior_Icc] using ht
  have hmul_le : M * r * t ≤ M * r :=
    mul_le_of_le_one_right hMr_nonneg htIoo.2.le
  have hden_pos : 0 < 1 - M * r * t := by nlinarith
  exact hessianSegmentLocalNorm_le_of_riccati_bound
    (hess := hess) (x := x) (y := y) (M := M) (r := r)
    (localNormDeriv := localNormDeriv)
    hr_pos hqcont hq_pos hqderiv hderiv_bound hzero t ht hden_pos

theorem HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hsegment_norm : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          r / (1 - M * r * t)) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
  HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt
    (s := s) (hess := hess) (hessDeriv := hessDeriv)
    (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
    hs hx hy hsc hhess_cont hhess hmixed
    (hessianSegmentCoeffBound_of_localNorm_bound
      (hess := hess) (x := x) (y := y) (M := M) (r := r)
      hsc.parameter_pos.le hsegment_norm)

theorem HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    {localNormDeriv : ℝ -> ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) (hr_pos : 0 < r)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hlocal_pos : ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hlocal_deriv : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun s : ℝ => localNorm hess (hessianSegmentPoint x y s) (y - x))
          (localNormDeriv t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hlocal_deriv_bound : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNormDeriv t ≤
          M * (localNorm hess (hessianSegmentPoint x y t) (y - x)) ^ (2 : ℕ))
    (hzero : localNorm hess x (y - x) ≤ r) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r := by
  have hlocal_cont :
      ContinuousOn
        (fun t : ℝ => localNorm hess (hessianSegmentPoint x y t) (y - x))
        (Set.Icc (0 : ℝ) 1) :=
    hessianSegmentLocalNorm_continuousOn_of_convex_continuousOn
      (hess := hess) (s := s) (x := x) (y := y)
      hs hx hy hhess_cont
  have hsegment_norm :
      ∀ t,
        t ∈ interior (Set.Icc (0 : ℝ) 1) ->
          localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
            r / (1 - M * r * t) :=
    hessianSegmentLocalNorm_le_of_riccati_bound_of_mul_lt
      (hess := hess) (x := x) (y := y) (M := M) (r := r)
      (localNormDeriv := localNormDeriv)
      hMr_nonneg hMr_lt hr_pos hlocal_cont hlocal_pos
      hlocal_deriv hlocal_deriv_bound hzero
  exact
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
      hs hx hy hsc hhess_cont hhess hmixed hsegment_norm

theorem HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) (hr_pos : 0 < r)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hlocal_pos : ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hzero : localNorm hess x (y - x) ≤ r) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r := by
  exact
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
      (localNormDeriv := fun t =>
        hessianSegmentMixedThirdPsiDeriv thirdMixed x y (y - x) t /
          (2 * localNorm hess (hessianSegmentPoint x y t) (y - x)))
      hMr_nonneg hMr_lt hr_pos hs hx hy hsc hhess_cont hhess hmixed
      hlocal_pos
      (by
        intro t ht
        exact hessianSegmentLocalNorm_hasDerivWithinAt_of_mixedThird
          (hess := hess) (hessDeriv := hessDeriv)
          (thirdMixed := thirdMixed) (x := x) (y := y) (t := t)
          (u := interior (Set.Icc (0 : ℝ) 1))
          (hlocal_pos t (interior_subset ht)) (hhess t ht) (hmixed (y - x) t ht))
      (by
        intro t ht
        exact hessianSegmentLocalNorm_riccatiDerivBound_of_mixedThirdSelfConcordantOn
          (s := s) (hess := hess) (thirdMixed := thirdMixed)
          (x := x) (y := y) (M := M) (t := t) hsc
          (hessianSegmentPoint_mem_of_convex_interior hs hx hy ht)
          (hlocal_pos t (interior_subset ht)))
      hzero

theorem HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) (hr_pos : 0 < r)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : y - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hzero : localNorm hess x (y - x) ≤ r) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
  HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm
    (s := s) (hess := hess) (hessDeriv := hessDeriv)
    (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
    hMr_nonneg hMr_lt hr_pos hs hx hy hsc hhess_cont hhess hmixed
    (hessianSegmentLocalNorm_pos_of_hessian_pos
      (hess := hess) (s := s) (x := x) (y := y)
      hs hx hy hess_pos hdiff_ne)
    hzero

theorem HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M : ℝ}
    (hMr_lt : M * localNorm hess x (y - x) < 1)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : y - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t) :
    HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M
      (localNorm hess x (y - x)) := by
  have hr_pos : 0 < localNorm hess x (y - x) :=
    localNorm_pos_of_inner_pos (hess_pos hx (y - x) hdiff_ne)
  have hMr_nonneg : 0 ≤ M * localNorm hess x (y - x) := by
    exact mul_nonneg hsc.parameter_pos.le (localNorm_nonneg hess x (y - x))
  exact
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M)
      (r := localNorm hess x (y - x))
      hMr_nonneg hMr_lt hr_pos hs hx hy hsc hess_pos hdiff_ne
      hhess_cont hhess hmixed le_rfl

theorem HessianSegmentConcretePsiCertificate.toHessianSegmentPsiCertificate
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    {psiDeriv : E -> ℝ -> ℝ}
    (hpsi : HessianSegmentConcretePsiCertificate hess x y M r psiDeriv) :
    HessianSegmentPsiCertificate hess x y M r
      (hessianSegmentPsi hess x y) psiDeriv where
  psi_zero := hessianSegmentPsi_zero hess x y
  psi_one := hessianSegmentPsi_one hess x y
  psi_continuous := hpsi.psi_continuous
  psi_hasDerivWithin := hpsi.psi_hasDerivWithin
  psi_deriv_bound := hpsi.psi_deriv_bound

theorem HessianSegmentMixedThirdCertificate.toHessianSegmentConcretePsiCertificate
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hpsi : HessianSegmentMixedThirdCertificate hess thirdMixed x y M r) :
    HessianSegmentConcretePsiCertificate hess x y M r
      (hessianSegmentMixedThirdPsiDeriv thirdMixed x y) where
  psi_continuous := hpsi.psi_continuous
  psi_hasDerivWithin := hpsi.psi_hasDerivWithin
  psi_deriv_bound := hpsi.psi_deriv_bound

theorem HessianSegmentMixedThirdLocalNormCertificate.toHessianSegmentMixedThirdCertificate
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r) :
    HessianSegmentMixedThirdCertificate hess thirdMixed x y M r where
  psi_continuous := hpsi.psi_continuous
  psi_hasDerivWithin := hpsi.psi_hasDerivWithin
  psi_deriv_bound := by
    intro v s hs
    have hmixed := hpsi.mixed_third_bound v s hs
    have hcoeff := hpsi.segment_coeff_bound s hs
    have hpsi_nonneg := hpsi.psi_nonneg v s hs
    exact hmixed.trans (mul_le_mul_of_nonneg_right hcoeff hpsi_nonneg)

theorem HessianSegmentMixedThirdLocalNormCertificate.toHessianSegmentConcretePsiCertificate
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r) :
    HessianSegmentConcretePsiCertificate hess x y M r
      (hessianSegmentMixedThirdPsiDeriv thirdMixed x y) :=
  hpsi.toHessianSegmentMixedThirdCertificate.toHessianSegmentConcretePsiCertificate

theorem HessianSegmentPsiCertificate.toHessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    {psi psiDeriv : E -> ℝ -> ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hpsi : HessianSegmentPsiCertificate hess x y M r psi psiDeriv) :
    HessianSegmentExponentialBounds hess x y M r where
  lower_exp := by
    intro v
    have hsand :=
      scalar_exp_sandwich_of_abs_deriv_le_antideriv_on_Icc
        (q := psi v) (q' := psiDeriv v)
        (A := fun s : ℝ => chewi136HessianStabilityPrimitive M r s)
        (A' := fun s : ℝ => 2 * M * r / (1 - M * r * s))
        (t := 1) (by norm_num)
        (hpsi.psi_continuous v)
        (chewi136HessianStabilityPrimitive_continuousOn_Icc
          hMr_nonneg hMr_lt)
        (hpsi.psi_hasDerivWithin v)
        (chewi136HessianStabilityPrimitive_hasDerivWithinAt_Icc
          hMr_nonneg hMr_lt)
        (hpsi.psi_deriv_bound v)
    simpa [hpsi.psi_zero v, hpsi.psi_one v,
      chewi136HessianStabilityPrimitive_zero,
      chewi136HessianStabilityPrimitive_one] using hsand.1
  upper_exp := by
    intro v
    have hsand :=
      scalar_exp_sandwich_of_abs_deriv_le_antideriv_on_Icc
        (q := psi v) (q' := psiDeriv v)
        (A := fun s : ℝ => chewi136HessianStabilityPrimitive M r s)
        (A' := fun s : ℝ => 2 * M * r / (1 - M * r * s))
        (t := 1) (by norm_num)
        (hpsi.psi_continuous v)
        (chewi136HessianStabilityPrimitive_continuousOn_Icc
          hMr_nonneg hMr_lt)
        (hpsi.psi_hasDerivWithin v)
        (chewi136HessianStabilityPrimitive_hasDerivWithinAt_Icc
          hMr_nonneg hMr_lt)
        (hpsi.psi_deriv_bound v)
    simpa [hpsi.psi_zero v, hpsi.psi_one v,
      chewi136HessianStabilityPrimitive_zero,
      chewi136HessianStabilityPrimitive_one] using hsand.2

theorem HessianSegmentConcretePsiCertificate.toHessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    {psiDeriv : E -> ℝ -> ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hpsi : HessianSegmentConcretePsiCertificate hess x y M r psiDeriv) :
    HessianSegmentExponentialBounds hess x y M r :=
  hpsi.toHessianSegmentPsiCertificate.toHessianSegmentExponentialBounds
    hMr_nonneg hMr_lt

theorem HessianSegmentMixedThirdCertificate.toHessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hpsi : HessianSegmentMixedThirdCertificate hess thirdMixed x y M r) :
    HessianSegmentExponentialBounds hess x y M r :=
  hpsi.toHessianSegmentConcretePsiCertificate.toHessianSegmentExponentialBounds
    hMr_nonneg hMr_lt

theorem HessianSegmentMixedThirdLocalNormCertificate.toHessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r) :
    HessianSegmentExponentialBounds hess x y M r :=
  hpsi.toHessianSegmentMixedThirdCertificate.toHessianSegmentExponentialBounds
    hMr_nonneg hMr_lt

theorem HessianSegmentExponentialBounds.toHessianQuadraticBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hden_pos : 0 < 1 - M * r)
    (henv : HessianSegmentExponentialBounds hess x y M r) :
    HessianQuadraticBounds hess x y
      ((1 - M * r) ^ (2 : ℕ))
      (((1 - M * r)⁻¹) ^ (2 : ℕ)) where
  lower_bound := by
    intro v
    have h := henv.lower_exp v
    rw [chewi136_exp_stability_lower hden_pos] at h
    simpa [mul_comm, mul_left_comm, mul_assoc] using h
  upper_bound := by
    intro v
    have h := henv.upper_exp v
    rw [chewi136_exp_stability_upper hden_pos] at h
    simpa [mul_comm, mul_left_comm, mul_assoc] using h

theorem localNorm_le_div_one_sub_of_hessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (henv : HessianSegmentExponentialBounds hess x y M r)
    (v : E) :
    localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  have hbounds :=
    henv.toHessianQuadraticBounds (hess := hess) (x := x) (y := y)
      (M := M) (r := r) hden_pos
  exact localNorm_le_div_one_sub_of_hessianQuadraticUpper
    hMr_lt hx_nonneg hy_nonneg hbounds.upper_bound v

theorem mul_one_sub_localNorm_le_of_hessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (henv : HessianSegmentExponentialBounds hess x y M r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v := by
  have hden_pos : 0 < 1 - M * r := by nlinarith
  have hbounds :=
    henv.toHessianQuadraticBounds (hess := hess) (x := x) (y := y)
      (M := M) (r := r) hden_pos
  exact mul_one_sub_localNorm_le_of_hessianQuadraticLower
    hMr_lt hx_nonneg hy_nonneg hbounds.lower_bound v

theorem localNorm_sandwich_of_hessianSegmentExponentialBounds
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (henv : HessianSegmentExponentialBounds hess x y M r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) :=
  ⟨mul_one_sub_localNorm_le_of_hessianSegmentExponentialBounds
      hMr_lt hx_nonneg hy_nonneg henv v,
    localNorm_le_div_one_sub_of_hessianSegmentExponentialBounds
      hMr_lt hx_nonneg hy_nonneg henv v⟩

theorem localNorm_sandwich_of_hessianSegmentConcretePsiCertificate
    {hess : E -> E →L[ℝ] E} {x y : E} {M r : ℝ}
    {psiDeriv : E -> ℝ -> ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hpsi : HessianSegmentConcretePsiCertificate hess x y M r psiDeriv)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have henv :=
    hpsi.toHessianSegmentExponentialBounds hMr_nonneg hMr_lt
  exact localNorm_sandwich_of_hessianSegmentExponentialBounds
    hMr_lt hx_nonneg hy_nonneg henv v

theorem localNorm_sandwich_of_hessianSegmentMixedThirdCertificate
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hpsi : HessianSegmentMixedThirdCertificate hess thirdMixed x y M r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have henv :=
    hpsi.toHessianSegmentExponentialBounds hMr_nonneg hMr_lt
  exact localNorm_sandwich_of_hessianSegmentExponentialBounds
    hMr_lt hx_nonneg hy_nonneg henv v

theorem localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate
    {hess : E -> E →L[ℝ] E} {thirdMixed : E -> E -> E -> ℝ}
    {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess x v))
    (hy_nonneg : ∀ v : E, 0 ≤ inner ℝ v (hess y v))
    (hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  exact localNorm_sandwich_of_hessianSegmentMixedThirdCertificate
    hMr_nonneg hMr_lt hx_nonneg hy_nonneg
    hpsi.toHessianSegmentMixedThirdCertificate v

theorem localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hsegment_norm : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNorm hess (hessianSegmentPoint x y t) (y - x) ≤
          r / (1 - M * r * t))
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_segmentLocalNormBound
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
      hs hx hy hsc hhess_cont hhess hmixed hsegment_norm
  exact localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate
    hMr_nonneg hMr_lt (fun w => hsc.hess_nonneg hx w)
    (fun w => hsc.hess_nonneg hy w) hpsi v

theorem localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    {localNormDeriv : ℝ -> ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) (hr_pos : 0 < r)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hlocal_pos : ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hlocal_deriv : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasDerivWithinAt
          (fun s : ℝ => localNorm hess (hessianSegmentPoint x y s) (y - x))
          (localNormDeriv t)
          (interior (Set.Icc (0 : ℝ) 1)) t)
    (hlocal_deriv_bound : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        localNormDeriv t ≤
          M * (localNorm hess (hessianSegmentPoint x y t) (y - x)) ^ (2 : ℕ))
    (hzero : localNorm hess x (y - x) ≤ r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_riccatiBound
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
      (localNormDeriv := localNormDeriv)
      hMr_nonneg hMr_lt hr_pos hs hx hy hsc hhess_cont hhess hmixed
      hlocal_pos hlocal_deriv hlocal_deriv_bound hzero
  exact localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate
    hMr_nonneg hMr_lt (fun w => hsc.hess_nonneg hx w)
    (fun w => hsc.hess_nonneg hy w) hpsi v

theorem localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) (hr_pos : 0 < r)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hlocal_pos : ∀ t,
      t ∈ Set.Icc (0 : ℝ) 1 ->
        0 < localNorm hess (hessianSegmentPoint x y t) (y - x))
    (hzero : localNorm hess x (y - x) ≤ r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_positiveLocalNorm
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
      hMr_nonneg hMr_lt hr_pos hs hx hy hsc hhess_cont hhess hmixed
      hlocal_pos hzero
  exact localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate
    hMr_nonneg hMr_lt (fun w => hsc.hess_nonneg hx w)
    (fun w => hsc.hess_nonneg hy w) hpsi v

theorem localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M r : ℝ}
    (hMr_nonneg : 0 ≤ M * r) (hMr_lt : M * r < 1) (hr_pos : 0 < r)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : y - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (hzero : localNorm hess x (y - x) ≤ r)
    (v : E) :
    (1 - M * r) * localNorm hess x v ≤ localNorm hess y v ∧
      localNorm hess y v ≤ localNorm hess x v / (1 - M * r) := by
  have hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M r :=
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_of_hessianPositive
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M) (r := r)
      hMr_nonneg hMr_lt hr_pos hs hx hy hsc hess_pos hdiff_ne
      hhess_cont hhess hmixed hzero
  exact localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate
    hMr_nonneg hMr_lt (fun w => hsc.hess_nonneg hx w)
    (fun w => hsc.hess_nonneg hy w) hpsi v

theorem localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M : ℝ}
    (hMr_lt : M * localNorm hess x (y - x) < 1)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : y - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (v : E) :
    (1 - M * localNorm hess x (y - x)) * localNorm hess x v ≤
      localNorm hess y v ∧
        localNorm hess y v ≤
          localNorm hess x v / (1 - M * localNorm hess x (y - x)) := by
  have hMr_nonneg : 0 ≤ M * localNorm hess x (y - x) := by
    exact mul_nonneg hsc.parameter_pos.le (localNorm_nonneg hess x (y - x))
  have hpsi :
      HessianSegmentMixedThirdLocalNormCertificate hess thirdMixed x y M
        (localNorm hess x (y - x)) :=
    HessianSegmentMixedThirdLocalNormCertificate.of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x) (y := y) (M := M)
      hMr_lt hs hx hy hsc hess_pos hdiff_ne hhess_cont hhess hmixed
  exact localNorm_sandwich_of_hessianSegmentMixedThirdLocalNormCertificate
    hMr_nonneg hMr_lt (fun w => hsc.hess_nonneg hx w)
    (fun w => hsc.hess_nonneg hy w) hpsi v

/--
Chewi Lemma 13.6(4), supplied-Hessian/mixed-third source form.  If the segment
is in a convex self-concordant region and `r = ||y - x||_x` satisfies
`M*r < 1`, then the local norms at `x` and `y` are equivalent with the
displayed factors.
-/
theorem chewi136_localNorm_sandwich_sourceRadius
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {x y : E} {M : ℝ}
    (hMr_lt : M * localNorm hess x (y - x) < 1)
    (hs : Convex ℝ s) (hx : x ∈ s) (hy : y ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : y - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x y t))
          (hessianSegmentPoint x y t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v ((hessDeriv (hessianSegmentPoint x y t) (y - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x y v t)
    (v : E) :
    (1 - M * localNorm hess x (y - x)) * localNorm hess x v ≤
      localNorm hess y v ∧
        localNorm hess y v ≤
          localNorm hess x v / (1 - M * localNorm hess x (y - x)) :=
  localNorm_sandwich_of_convex_mixedThirdSelfConcordantOn_of_hasFDerivAt_sourceRadius
    (s := s) (hess := hess) (hessDeriv := hessDeriv)
    (thirdMixed := thirdMixed) (x := x) (y := y) (M := M)
    hMr_lt hs hx hy hsc hess_pos hdiff_ne hhess_cont hhess hmixed v

/--
Newton-step specialization of Chewi Lemma 13.6(4).  Once the Newton decrement
is identified with `||x⁺ - x||_x`, the Lemma 13.6 source-radius hypothesis is
exactly `M * λ_f(x) < 1`.
-/
theorem chewi136_newtonStep_localNorm_sandwich_sourceRadius
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ}
    {grad : E -> E} {invHess : E -> E →L[ℝ] E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hdiff_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        HasFDerivAt hess
          (hessDeriv (hessianSegmentPoint x (newtonStep grad invHess x) t))
          (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hmixed : ∀ v : E, ∀ t,
      t ∈ interior (Set.Icc (0 : ℝ) 1) ->
        inner ℝ v
          ((hessDeriv (hessianSegmentPoint x (newtonStep grad invHess x) t)
            (newtonStep grad invHess x - x)) v) =
          hessianSegmentMixedThirdPsiDeriv thirdMixed x
            (newtonStep grad invHess x) v t)
    (v : E) :
    (1 - M * newtonDecrement grad invHess x) * localNorm hess x v ≤
      localNorm hess (newtonStep grad invHess x) v ∧
        localNorm hess (newtonStep grad invHess x) v ≤
          localNorm hess x v / (1 - M * newtonDecrement grad invHess x) := by
  have hMr_lt :
      M * localNorm hess x (newtonStep grad invHess x - x) < 1 := by
    simpa [hstep_norm] using hMlambda_lt
  have hsand :=
    chewi136_localNorm_sandwich_sourceRadius
      (s := s) (hess := hess) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (x := x)
      (y := newtonStep grad invHess x) (M := M)
      hMr_lt hs hx hstep_mem hsc hess_pos hdiff_ne hhess_cont hhess hmixed v
  simpa [hstep_norm] using hsand

/--
Pointwise Newton-segment specialization of Chewi Lemma 13.6(4).  This is the
source-shaped sandwich needed in Theorem 13.8 for
`z_t = (1-t)x + t x⁺`, with radius `t * lambda_f(x)`.
-/
theorem chewi138_newtonSegment_localNorm_sandwich_sourceRadius
    {s : Set E} {hess : E -> E →L[ℝ] E}
    {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ}
    {grad : E -> E} {invHess : E -> E →L[ℝ] E} {x : E} {M t : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (ht : t ∈ Set.Icc (0 : ℝ) 1)
    (w : E) :
    (1 - M * newtonDecrement grad invHess x * t) * localNorm hess x w ≤
      localNorm hess (hessianSegmentPoint x (newtonStep grad invHess x) t) w ∧
        localNorm hess (hessianSegmentPoint x (newtonStep grad invHess x) t) w ≤
          localNorm hess x w /
            (1 - M * newtonDecrement grad invHess x * t) := by
  let y := newtonStep grad invHess x
  let lam := newtonDecrement grad invHess x
  by_cases ht_zero : t = 0
  · subst t
    simp [hessianSegmentPoint_zero]
  · have ht_pos : 0 < t := by
      have hne : (0 : ℝ) ≠ t := by
        intro h
        exact ht_zero h.symm
      exact lt_of_le_of_ne ht.1 hne
    have ht_nonneg : 0 ≤ t := ht.1
    have ht_le_one : t ≤ 1 := ht.2
    have hlam_nonneg : 0 ≤ lam := by
      dsimp [lam, newtonDecrement]
      exact dualLocalNorm_nonneg invHess x (grad x)
    have hM_nonneg : 0 ≤ M := hsc.parameter_pos.le
    have hy_mem : y ∈ s := by
      simpa [y] using hstep_mem
    have hzt_mem : hessianSegmentPoint x y t ∈ s :=
      hessianSegmentPoint_mem_of_convex hs hx hy_mem ht
    have hzt_norm :
        localNorm hess x (hessianSegmentPoint x y t - x) = t * lam := by
      rw [hessianSegmentPoint_sub_left]
      rw [localNorm_smul_of_nonneg ht_nonneg (fun v => hsc.hess_nonneg hx v)]
      simp [y, lam, hstep_norm]
    have hMt_lt : M * localNorm hess x (hessianSegmentPoint x y t - x) < 1 := by
      rw [hzt_norm]
      have htlam_le : t * lam ≤ lam := by
        simpa using mul_le_mul_of_nonneg_right ht_le_one hlam_nonneg
      have hM_le : M * (t * lam) ≤ M * lam :=
        mul_le_mul_of_nonneg_left htlam_le hM_nonneg
      nlinarith [hMlambda_lt, hM_le]
    have hdiff_ne : hessianSegmentPoint x y t - x ≠ 0 := by
      rw [hessianSegmentPoint_sub_left]
      exact smul_ne_zero ht_zero hstep_ne
    have hsand :=
      chewi136_localNorm_sandwich_sourceRadius
        (s := s) (hess := hess) (hessDeriv := hessDeriv)
        (thirdMixed := thirdMixed) (x := x)
        (y := hessianSegmentPoint x y t) (M := M)
        hMt_lt hs hx hzt_mem hsc hess_pos hdiff_ne hhess_cont
        (by
          intro u hu
          exact hhess (hessianSegmentPoint x (hessianSegmentPoint x y t) u)
            (hessianSegmentPoint_mem_of_convex hs hx hzt_mem
              (interior_subset hu)))
        (by
          intro v u hu
          have hzu : hessianSegmentPoint x (hessianSegmentPoint x y t) u ∈ s :=
            hessianSegmentPoint_mem_of_convex hs hx hzt_mem
              (interior_subset hu)
          simpa [hessianSegmentMixedThirdPsiDeriv] using
            hmixed (hessianSegmentPoint x (hessianSegmentPoint x y t) u)
              hzu (hessianSegmentPoint x y t - x) v)
        w
    have hfactor :
        1 - M * localNorm hess x (hessianSegmentPoint x y t - x) =
          1 - M * lam * t := by
      rw [hzt_norm]
      ring
    constructor
    · simpa [y, lam, hfactor] using hsand.1
    · simpa [y, lam, hfactor] using hsand.2

/--
Chewi Theorem 13.8 Delta step, scalar quadratic-form version.  If the Hessian
along the segment has the pointwise Lemma 13.6 upper coefficient, then the
integrated Hessian difference has the closed Delta coefficient.
-/
theorem chewi138_hessianSegmentDelta_integral_le_of_hessianUpper
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hupper : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      inner ℝ v (hess (hessianSegmentPoint x y t) v) ≤
        (((1 - M * lambda * t)⁻¹) ^ (2 : ℕ)) * inner ℝ v (hess x v)) :
    (∫ t in (0 : ℝ)..1,
        inner ℝ v (hess (hessianSegmentPoint x y t) v) -
          inner ℝ v (hess x v)) ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  let g : ℝ -> ℝ := fun t =>
    inner ℝ v (hess (hessianSegmentPoint x y t) v) - inner ℝ v (hess x v)
  have hpsi_cont :
      ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1) :=
    hessianSegmentPsi_continuousOn_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess_cont hseg v
  have hg_cont : ContinuousOn g (Set.Icc (0 : ℝ) 1) := by
    simpa [g, hessianSegmentPsi] using hpsi_cont.sub continuousOn_const
  have hg_int : IntervalIntegrable g MeasureTheory.volume (0 : ℝ) 1 :=
    hg_cont.intervalIntegrable_of_Icc zero_le_one
  have hbound : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      g t ≤ ((((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1) *
        inner ℝ v (hess x v)) := by
    intro t ht
    calc
      g t ≤
          (((1 - M * lambda * t)⁻¹) ^ (2 : ℕ)) *
              inner ℝ v (hess x v) -
            inner ℝ v (hess x v) := by
        exact sub_le_sub_right (hupper t ht) (inner ℝ v (hess x v))
      _ = ((((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1) *
            inner ℝ v (hess x v)) := by
        ring
  simpa [g] using
    chewi138_integral_le_deltaCoefficient_mul
      (g := g) (M := M) (lambda := lambda) (B := inner ℝ v (hess x v))
      hMlambda_lt hg_int hbound

/--
Chewi Theorem 13.8 Delta step from local-norm control.  This packages the
common route: Lemma 13.6 gives pointwise local-norm control along the segment;
squaring it gives the Hessian upper bound used by the Delta integral estimate.
-/
theorem chewi138_hessianSegmentDelta_integral_le_of_localNormUpper
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x y t) w))
    (hnorm : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      localNorm hess (hessianSegmentPoint x y t) w ≤
        localNorm hess x w / (1 - M * lambda * t)) :
    (∫ t in (0 : ℝ)..1,
        inner ℝ v (hess (hessianSegmentPoint x y t) v) -
          inner ℝ v (hess x v)) ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  refine chewi138_hessianSegmentDelta_integral_le_of_hessianUpper
    (hess := hess) (s := s) (x := x) (y := y) (v := v)
    (M := M) (lambda := lambda) hMlambda_lt hhess_cont hseg ?_
  intro t ht
  have ht_nonneg : 0 ≤ t := ht.1
  have ht_le_one : t ≤ 1 := ht.2
  have hMt_lt : M * lambda * t < 1 := by
    by_cases hMl_nonneg : 0 ≤ M * lambda
    · have hle : M * lambda * t ≤ M * lambda * 1 :=
        mul_le_mul_of_nonneg_left ht_le_one hMl_nonneg
      nlinarith
    · have hMl_neg : M * lambda < 0 := lt_of_not_ge hMl_nonneg
      have hle_zero : M * lambda * t ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg hMl_neg.le ht_nonneg
      nlinarith
  have hden_pos : 0 < 1 - M * lambda * t := by nlinarith
  exact hessianQuadraticUpper_of_localNorm_le_div
    (hess := hess) (x := x) (y := hessianSegmentPoint x y t)
    (den := 1 - M * lambda * t) hden_pos hx_nonneg (hz_nonneg t ht)
    (hnorm t ht) v

/--
Chewi Theorem 13.8 lower Delta step, scalar quadratic-form version.  If the
Hessian along the segment has the pointwise Lemma 13.6 lower coefficient, then
the negative integrated Hessian difference is controlled by the same closed
Delta coefficient used for the upper side.
-/
theorem chewi138_hessianSegmentDelta_integral_neg_le_of_hessianLower
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hlambda_nonneg : 0 ≤ lambda)
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hlower : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      (1 - M * lambda * t) ^ (2 : ℕ) * inner ℝ v (hess x v) ≤
        inner ℝ v (hess (hessianSegmentPoint x y t) v)) :
    - (∫ t in (0 : ℝ)..1,
        inner ℝ v (hess (hessianSegmentPoint x y t) v) -
          inner ℝ v (hess x v)) ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  let base : ℝ := inner ℝ v (hess x v)
  let g : ℝ -> ℝ := fun t =>
    - (inner ℝ v (hess (hessianSegmentPoint x y t) v) - base)
  have hpsi_cont :
      ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1) :=
    hessianSegmentPsi_continuousOn_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess_cont hseg v
  have hg_cont : ContinuousOn g (Set.Icc (0 : ℝ) 1) := by
    simpa [g, hessianSegmentPsi, base] using
      (hpsi_cont.sub continuousOn_const).neg
  have hg_int : IntervalIntegrable g MeasureTheory.volume (0 : ℝ) 1 :=
    hg_cont.intervalIntegrable_of_Icc zero_le_one
  have hpoint : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      g t ≤ ((((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1) * base) := by
    intro t ht
    have ht_nonneg : 0 ≤ t := ht.1
    have ht_le_one : t ≤ 1 := ht.2
    have hMlambda_nonneg : 0 ≤ M * lambda :=
      mul_nonneg hM_nonneg hlambda_nonneg
    have hMt_lt : M * lambda * t < 1 := by
      have hle : M * lambda * t ≤ M * lambda * 1 :=
        mul_le_mul_of_nonneg_left ht_le_one hMlambda_nonneg
      nlinarith
    have hden_pos : 0 < 1 - M * lambda * t := by nlinarith
    have hcoeff_ge :
        1 - (1 - M * lambda * t) ^ (2 : ℕ) ≤
          ((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1 := by
      let den : ℝ := 1 - M * lambda * t
      have hden_pos' : 0 < den := by simpa [den] using hden_pos
      have hsq : 0 ≤ (den - den⁻¹) ^ (2 : ℕ) := sq_nonneg (den - den⁻¹)
      have hden_ne : den ≠ 0 := ne_of_gt hden_pos'
      have hcmp : 1 - den ^ (2 : ℕ) ≤ den⁻¹ ^ (2 : ℕ) - 1 := by
        field_simp [hden_ne] at hsq ⊢
        nlinarith
      simpa [den] using hcmp
    have hbase_nonneg : 0 ≤ base := by
      simpa [base] using hx_nonneg v
    calc
      g t =
          base - inner ℝ v (hess (hessianSegmentPoint x y t) v) := by
            simp [g, base]
      _ ≤ base - (1 - M * lambda * t) ^ (2 : ℕ) * base := by
            exact sub_le_sub_left (hlower t ht) base
      _ = (1 - (1 - M * lambda * t) ^ (2 : ℕ)) * base := by
            ring
      _ ≤ ((((1 - M * lambda * t)⁻¹) ^ (2 : ℕ) - 1) * base) :=
            mul_le_mul_of_nonneg_right hcoeff_ge hbase_nonneg
  have hmain :
      (∫ t in (0 : ℝ)..1, g t) ≤
        (M * lambda / (1 - M * lambda)) * base :=
    chewi138_integral_le_deltaCoefficient_mul
      (g := g) (M := M) (lambda := lambda) (B := base)
      hMlambda_lt hg_int hpoint
  have hneg :
      (∫ t in (0 : ℝ)..1, g t) =
        - (∫ t in (0 : ℝ)..1,
              inner ℝ v (hess (hessianSegmentPoint x y t) v) -
              inner ℝ v (hess x v)) := by
    rw [← intervalIntegral.integral_neg]
  simpa [hneg, base] using hmain

/--
Chewi Theorem 13.8 lower Delta step from local-norm control.  This packages
the lower side of Lemma 13.6 into the negative scalar Delta estimate.
-/
theorem chewi138_hessianSegmentDelta_integral_neg_le_of_localNormLower
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hlambda_nonneg : 0 ≤ lambda)
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x y t) w))
    (hnorm : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      (1 - M * lambda * t) * localNorm hess x w ≤
        localNorm hess (hessianSegmentPoint x y t) w) :
    - (∫ t in (0 : ℝ)..1,
        inner ℝ v (hess (hessianSegmentPoint x y t) v) -
          inner ℝ v (hess x v)) ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  refine chewi138_hessianSegmentDelta_integral_neg_le_of_hessianLower
    (hess := hess) (s := s) (x := x) (y := y) (v := v)
    (M := M) (lambda := lambda) hM_nonneg hlambda_nonneg hMlambda_lt
    hhess_cont hseg hx_nonneg ?_
  intro t ht
  have ht_nonneg : 0 ≤ t := ht.1
  have ht_le_one : t ≤ 1 := ht.2
  have hMlambda_nonneg : 0 ≤ M * lambda :=
    mul_nonneg hM_nonneg hlambda_nonneg
  have hMt_lt : M * lambda * t < 1 := by
    have hle : M * lambda * t ≤ M * lambda * 1 :=
      mul_le_mul_of_nonneg_left ht_le_one hMlambda_nonneg
    nlinarith
  have hden_nonneg : 0 ≤ 1 - M * lambda * t := by nlinarith
  exact hessianQuadraticLower_of_mul_le_localNorm
    (hess := hess) (x := x) (y := hessianSegmentPoint x y t)
    (den := 1 - M * lambda * t)
    hden_nonneg hx_nonneg (hz_nonneg t ht) (hnorm t ht) v

/--
Derivative of the gradient along the Chewi segment.  This is the chain-rule
piece behind the identity
`d/dt ∇f(z_t) = ∇² f(z_t) (y - x)`.
-/
theorem hessianSegmentGradient_hasDerivAt_of_hasFDerivAt
    {grad : E -> E} {hess : E -> E →L[ℝ] E} {x y : E} {t : ℝ}
    (hgrad :
      HasFDerivAt grad (hess (hessianSegmentPoint x y t))
        (hessianSegmentPoint x y t)) :
    HasDerivAt (fun s : ℝ => grad (hessianSegmentPoint x y s))
      (hess (hessianSegmentPoint x y t) (y - x)) t :=
  hgrad.comp_hasDerivAt t (hessianSegmentPoint_hasDerivAt x y t)

/--
Chewi Theorem 13.8 gradient fundamental-theorem identity along the segment:
`∫_0^1 Hess(z_t) (y - x) dt = grad y - grad x`.
-/
theorem hessianSegmentGradient_integral_eq_sub_of_hasFDerivAt
    [CompleteSpace E]
    {grad : E -> E} {hess : E -> E →L[ℝ] E} {x y : E}
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad (hess (hessianSegmentPoint x y t))
        (hessianSegmentPoint x y t))
    (hint : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint x y t) (y - x))
      MeasureTheory.volume (0 : ℝ) 1) :
    (∫ t in (0 : ℝ)..1,
        hess (hessianSegmentPoint x y t) (y - x)) =
      grad y - grad x := by
  have hderiv : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasDerivAt (fun s : ℝ => grad (hessianSegmentPoint x y s))
        (hess (hessianSegmentPoint x y t) (y - x)) t := by
    intro t ht
    exact hessianSegmentGradient_hasDerivAt_of_hasFDerivAt
      (grad := grad) (hess := hess) (x := x) (y := y) (t := t)
      (hgrad t ht)
  have hFTC := intervalIntegral.integral_eq_sub_of_hasDerivAt hderiv hint
  simpa [hessianSegmentPoint_zero, hessianSegmentPoint_one] using hFTC

/--
Chewi Theorem 13.8 integrated Hessian-difference operator
`Delta = ∫_0^1 Hess(z_t) dt - Hess(x)` along the segment from `x` to `y`.
-/
noncomputable def hessianSegmentDelta
    (hess : E -> E →L[ℝ] E) (x y : E) : E →L[ℝ] E :=
  (∫ t in (0 : ℝ)..1, hess (hessianSegmentPoint x y t)) - hess x

/--
Continuity of the Hessian oracle along a Chewi segment gives interval
integrability of the operator-valued Hessian path.
-/
theorem hessianSegmentHessian_intervalIntegrable_of_continuousOn
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s) :
    IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint x y t))
      MeasureTheory.volume (0 : ℝ) 1 := by
  have hz : ContinuousOn
      (fun t : ℝ => hess (hessianSegmentPoint x y t))
      (Set.Icc (0 : ℝ) 1) :=
    hhess.comp (hessianSegmentPoint_continuous x y).continuousOn hseg
  exact hz.intervalIntegrable_of_Icc zero_le_one

/--
Continuity of the Hessian oracle along a Chewi segment gives interval
integrability of every fixed Hessian action along that segment.
-/
theorem hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s) :
    IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint x y t) v)
      MeasureTheory.volume (0 : ℝ) 1 := by
  have hz : ContinuousOn
      (fun t : ℝ => hess (hessianSegmentPoint x y t))
      (Set.Icc (0 : ℝ) 1) :=
    hhess.comp (hessianSegmentPoint_continuous x y).continuousOn hseg
  have happly : ContinuousOn
      (fun t : ℝ => hess (hessianSegmentPoint x y t) v)
      (Set.Icc (0 : ℝ) 1) :=
    hz.clm_apply continuousOn_const
  exact happly.intervalIntegrable_of_Icc zero_le_one

/--
Applying the integrated Hessian-difference operator is the same as integrating
the Hessian actions and subtracting the base Hessian action.
-/
theorem hessianSegmentDelta_apply
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {x y v : E}
    (hint : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint x y t))
      MeasureTheory.volume (0 : ℝ) 1) :
    hessianSegmentDelta hess x y v =
      (∫ t in (0 : ℝ)..1, hess (hessianSegmentPoint x y t) v) -
        hess x v := by
  have happly :
      (∫ t in (0 : ℝ)..1, hess (hessianSegmentPoint x y t) v) =
        (∫ t in (0 : ℝ)..1, hess (hessianSegmentPoint x y t)) v := by
    simpa using
      ((ContinuousLinearMap.apply ℝ E v).intervalIntegral_comp_comm
        (f := fun t : ℝ => hess (hessianSegmentPoint x y t))
        hint)
  simp [hessianSegmentDelta, ← happly]

/--
The interval average of symmetric Hessians along a Chewi segment is symmetric.
This is a concrete bridge toward the Rayleigh route for Theorem 13.8.
-/
theorem hessianSegmentHessian_intervalIntegral_isSymmetric_of_continuousOn
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric) :
    (((∫ t in (0 : ℝ)..1, hess (hessianSegmentPoint x y t)) :
        E →L[ℝ] E) : E →ₗ[ℝ] E).IsSymmetric := by
  let z : ℝ -> E := fun t => hessianSegmentPoint x y t
  have hint_op : IntervalIntegrable
      (fun t : ℝ => hess (z t)) MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess hseg
  intro u v
  change inner ℝ ((∫ t in (0 : ℝ)..1, hess (z t)) u) v =
    inner ℝ u ((∫ t in (0 : ℝ)..1, hess (z t)) v)
  have hint_u : IntervalIntegrable
      (fun t : ℝ => hess (z t) u) MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) (v := u) hhess hseg
  have hint_v : IntervalIntegrable
      (fun t : ℝ => hess (z t) v) MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) (v := v) hhess hseg
  have hleft :
      inner ℝ ((∫ t in (0 : ℝ)..1, hess (z t)) u) v =
        ∫ t in (0 : ℝ)..1, inner ℝ (hess (z t) u) v := by
    rw [ContinuousLinearMap.intervalIntegral_apply hint_op u]
    rw [real_inner_comm]
    have h := ((innerSL ℝ v).intervalIntegral_comp_comm
      (f := fun t : ℝ => hess (z t) u) hint_u)
    simpa [innerSL_apply_apply, real_inner_comm] using h.symm
  have hright :
      inner ℝ u ((∫ t in (0 : ℝ)..1, hess (z t)) v) =
        ∫ t in (0 : ℝ)..1, inner ℝ u (hess (z t) v) := by
    rw [ContinuousLinearMap.intervalIntegral_apply hint_op v]
    have h := ((innerSL ℝ u).intervalIntegral_comp_comm
      (f := fun t : ℝ => hess (z t) v) hint_v)
    simpa [innerSL_apply_apply] using h.symm
  rw [hleft, hright]
  refine intervalIntegral.integral_congr ?_
  intro t ht
  have htIcc : t ∈ Set.Icc (0 : ℝ) 1 := by
    simpa [Set.uIcc_of_le zero_le_one] using ht
  exact hsymm (z t) (hseg t htIcc) u v

/--
The concrete integrated Hessian-difference operator is symmetric whenever the
Hessian oracle is symmetric along the segment.  This discharges the
self-adjointness side of the normalized Rayleigh route before the square-root
coordinate factorization is introduced.
-/
theorem hessianSegmentDelta_isSymmetric_of_continuousOn
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric) :
    (hessianSegmentDelta hess x y : E →ₗ[ℝ] E).IsSymmetric := by
  let z : ℝ -> E := fun t => hessianSegmentPoint x y t
  have hint_symm :
      (((∫ t in (0 : ℝ)..1, hess (z t)) : E →L[ℝ] E) :
        E →ₗ[ℝ] E).IsSymmetric := by
    simpa [z] using
      hessianSegmentHessian_intervalIntegral_isSymmetric_of_continuousOn
        (hess := hess) (s := s) (x := x) (y := y) hhess hseg hsymm
  have hx_mem : x ∈ s := by
    simpa [hessianSegmentPoint_zero] using hseg (0 : ℝ) (by simp)
  have hx_symm : (hess x : E →ₗ[ℝ] E).IsSymmetric := hsymm x hx_mem
  simpa [hessianSegmentDelta, z] using hint_symm.sub hx_symm

/--
The normalized adjoint-conjugate of the concrete Delta operator is symmetric.
This carries the compiled concrete Delta symmetry through a square-root style
coordinate change.
-/
theorem hessianSegmentDelta_adjointConj_isSymmetric_of_continuousOn
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y : E} {coord : E →L[ℝ] E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric) :
    ((((ContinuousLinearMap.adjoint coord).comp
        ((hessianSegmentDelta hess x y).comp coord)) : E →L[ℝ] E) :
      E →ₗ[ℝ] E).IsSymmetric := by
  have hdelta_symm :
      (hessianSegmentDelta hess x y : E →ₗ[ℝ] E).IsSymmetric :=
    hessianSegmentDelta_isSymmetric_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess hseg hsymm
  have hdelta_self : IsSelfAdjoint (hessianSegmentDelta hess x y) :=
    hdelta_symm.isSelfAdjoint
  have hconj : IsSelfAdjoint
      ((ContinuousLinearMap.adjoint coord).comp
        ((hessianSegmentDelta hess x y).comp coord)) :=
    IsSelfAdjoint.adjoint_conj
      (T := hessianSegmentDelta hess x y) (S := coord) hdelta_self
  exact hconj.isSymmetric

/--
The quadratic form of the concrete Delta operator is the scalar integrated
Hessian difference from Chewi's proof.
-/
theorem hessianSegmentDelta_inner_eq_integral_sub_of_continuousOn
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s) :
    inner ℝ v (hessianSegmentDelta hess x y v) =
      ∫ t in (0 : ℝ)..1,
        inner ℝ v (hess (hessianSegmentPoint x y t) v) -
          inner ℝ v (hess x v) := by
  let z : ℝ -> E := fun t => hessianSegmentPoint x y t
  have hint_op : IntervalIntegrable
      (fun t : ℝ => hess (z t)) MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess hseg
  have hint_vec : IntervalIntegrable
      (fun t : ℝ => hess (z t) v) MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) (v := v) hhess hseg
  have hpsi_cont :
      ContinuousOn (hessianSegmentPsi hess x y v) (Set.Icc (0 : ℝ) 1) :=
    hessianSegmentPsi_continuousOn_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess hseg v
  have hint_inner : IntervalIntegrable
      (fun t : ℝ => inner ℝ v (hess (z t) v))
      MeasureTheory.volume (0 : ℝ) 1 := by
    simpa [hessianSegmentPsi, z] using
      hpsi_cont.intervalIntegrable_of_Icc zero_le_one
  have hinner :
      (∫ t in (0 : ℝ)..1, inner ℝ v (hess (z t) v)) =
        inner ℝ v (∫ t in (0 : ℝ)..1, hess (z t) v) := by
    simpa [innerSL_apply_apply, z] using
      ((innerSL ℝ v).intervalIntegral_comp_comm
        (f := fun t : ℝ => hess (z t) v) hint_vec)
  calc
    inner ℝ v (hessianSegmentDelta hess x y v)
        = inner ℝ v
            ((∫ t in (0 : ℝ)..1, hess (z t) v) - hess x v) := by
          have hdelta :=
            hessianSegmentDelta_apply (hess := hess) (x := x) (y := y)
              (v := v) (by simpa [z] using hint_op)
          simpa [z] using congrArg (fun w : E => inner ℝ v w) hdelta
    _ = inner ℝ v (∫ t in (0 : ℝ)..1, hess (z t) v) -
          inner ℝ v (hess x v) := by
        rw [inner_sub_right]
    _ = (∫ t in (0 : ℝ)..1, inner ℝ v (hess (z t) v)) -
          inner ℝ v (hess x v) := by
        rw [hinner]
    _ = (∫ t in (0 : ℝ)..1, inner ℝ v (hess (z t) v)) -
          (∫ t in (0 : ℝ)..1, inner ℝ v (hess x v)) := by
        simp
    _ = ∫ t in (0 : ℝ)..1,
          inner ℝ v (hess (z t) v) - inner ℝ v (hess x v) := by
        rw [intervalIntegral.integral_sub hint_inner intervalIntegrable_const]

/--
Concrete scalar Delta quadratic-form bound from Lemma 13.6-style local-norm
control along the segment.
-/
theorem hessianSegmentDelta_inner_le_of_localNormUpper
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x y t) w))
    (hnorm : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      localNorm hess (hessianSegmentPoint x y t) w ≤
        localNorm hess x w / (1 - M * lambda * t)) :
    inner ℝ v (hessianSegmentDelta hess x y v) ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  rw [hessianSegmentDelta_inner_eq_integral_sub_of_continuousOn
    (hess := hess) (s := s) (x := x) (y := y) (v := v) hhess_cont hseg]
  exact chewi138_hessianSegmentDelta_integral_le_of_localNormUpper
    (hess := hess) (s := s) (x := x) (y := y) (v := v)
    (M := M) (lambda := lambda) hMlambda_lt hhess_cont hseg
    hx_nonneg hz_nonneg hnorm

/--
Concrete scalar lower Delta bound from Lemma 13.6-style local-norm lower
control along the segment.
-/
theorem hessianSegmentDelta_inner_neg_le_of_localNormLower
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hlambda_nonneg : 0 ≤ lambda)
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x y t) w))
    (hnorm : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      (1 - M * lambda * t) * localNorm hess x w ≤
        localNorm hess (hessianSegmentPoint x y t) w) :
    - inner ℝ v (hessianSegmentDelta hess x y v) ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  rw [hessianSegmentDelta_inner_eq_integral_sub_of_continuousOn
    (hess := hess) (s := s) (x := x) (y := y) (v := v) hhess_cont hseg]
  exact chewi138_hessianSegmentDelta_integral_neg_le_of_localNormLower
    (hess := hess) (s := s) (x := x) (y := y) (v := v)
    (M := M) (lambda := lambda) hM_nonneg hlambda_nonneg hMlambda_lt
    hhess_cont hseg hx_nonneg hz_nonneg hnorm

/--
Concrete scalar absolute Delta quadratic-form bound from the two-sided
Lemma 13.6 local-norm sandwich along the segment.
-/
theorem hessianSegmentDelta_abs_inner_le_of_localNormSandwich
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {s : Set E} {x y v : E} {M lambda : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hlambda_nonneg : 0 ≤ lambda)
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x y t) w))
    (hnorm_lower : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      (1 - M * lambda * t) * localNorm hess x w ≤
        localNorm hess (hessianSegmentPoint x y t) w)
    (hnorm_upper : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      localNorm hess (hessianSegmentPoint x y t) w ≤
        localNorm hess x w / (1 - M * lambda * t)) :
    |inner ℝ (hessianSegmentDelta hess x y v) v| ≤
      (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
  have hupper :
      inner ℝ (hessianSegmentDelta hess x y v) v ≤
        (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
    simpa [real_inner_comm] using
      hessianSegmentDelta_inner_le_of_localNormUpper
        (hess := hess) (s := s) (x := x) (y := y) (v := v)
        (M := M) (lambda := lambda) hMlambda_lt hhess_cont hseg
        hx_nonneg hz_nonneg hnorm_upper
  have hlower :
      - inner ℝ (hessianSegmentDelta hess x y v) v ≤
        (M * lambda / (1 - M * lambda)) * inner ℝ v (hess x v) := by
    simpa [real_inner_comm] using
      hessianSegmentDelta_inner_neg_le_of_localNormLower
        (hess := hess) (s := s) (x := x) (y := y) (v := v)
        (M := M) (lambda := lambda) hM_nonneg hlambda_nonneg
        hMlambda_lt hhess_cont hseg hx_nonneg hz_nonneg hnorm_lower
  exact abs_le.2 ⟨by linarith, hupper⟩

/--
Concrete Delta quadratic-bound bridge.  The scalar Delta/order estimates
control `inner step (Delta step)`; a remaining dual-energy/order hypothesis
turns that scalar control into the full dual quadratic form needed by Chewi
Theorem 13.8.
-/
theorem hessianSegmentDelta_quadraticBound_of_localNormUpper_and_dualEnergy
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {s : Set E} {x y : E} {M lambda : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hlambda_nonneg : 0 ≤ lambda)
    (hMlambda_lt : M * lambda < 1)
    (hhess_cont : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x y t ∈ s)
    (hx_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x y t) w))
    (hnorm : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      localNorm hess (hessianSegmentPoint x y t) w ≤
        localNorm hess x w / (1 - M * lambda * t))
    (hdual_energy : ∀ step : E,
      inner ℝ (hessianSegmentDelta hess x y step)
          (invHess x (hessianSegmentDelta hess x y step)) ≤
        (M * lambda / (1 - M * lambda)) *
          inner ℝ step (hessianSegmentDelta hess x y step)) :
    HessianDeltaQuadraticBound hess invHess x
      (hessianSegmentDelta hess x y)
      (M * lambda / (1 - M * lambda)) := by
  refine ⟨?_⟩
  intro step
  let coeff := M * lambda / (1 - M * lambda)
  have hden_pos : 0 < 1 - M * lambda := by nlinarith
  have hcoeff_nonneg : 0 ≤ coeff := by
    exact div_nonneg (mul_nonneg hM_nonneg hlambda_nonneg) hden_pos.le
  have hscalar :
      inner ℝ step (hessianSegmentDelta hess x y step) ≤
        coeff * inner ℝ step (hess x step) := by
    simpa [coeff] using
      hessianSegmentDelta_inner_le_of_localNormUpper
        (hess := hess) (s := s) (x := x) (y := y) (v := step)
        (M := M) (lambda := lambda) hMlambda_lt hhess_cont hseg
        hx_nonneg hz_nonneg hnorm
  calc
    inner ℝ (hessianSegmentDelta hess x y step)
        (invHess x (hessianSegmentDelta hess x y step))
        ≤ coeff * inner ℝ step (hessianSegmentDelta hess x y step) := by
          simpa [coeff] using hdual_energy step
    _ ≤ coeff * (coeff * inner ℝ step (hess x step)) :=
          mul_le_mul_of_nonneg_left hscalar hcoeff_nonneg
    _ = coeff ^ (2 : ℕ) * inner ℝ step (hess x step) := by
          ring

/--
Operator-norm bound from a squared pointwise norm estimate.  This is the
shape produced by normalized Hessian-difference estimates in Chewi
Theorem 13.8.
-/
theorem continuousLinearMap_opNorm_le_of_norm_sq_le
    {A : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hbound : ∀ z : E,
      ‖A z‖ ^ (2 : ℕ) ≤ coeff ^ (2 : ℕ) * ‖z‖ ^ (2 : ℕ)) :
    ‖A‖ ≤ coeff := by
  refine A.opNorm_le_bound hcoeff_nonneg ?_
  intro z
  have hrhs_nonneg : 0 ≤ coeff * ‖z‖ :=
    mul_nonneg hcoeff_nonneg (norm_nonneg _)
  have hsq :
      ‖A z‖ ^ (2 : ℕ) ≤ (coeff * ‖z‖) ^ (2 : ℕ) := by
    simpa [mul_pow] using hbound z
  exact (sq_le_sq₀ (norm_nonneg _) hrhs_nonneg).mp hsq

/--
Operator-norm bound from a unit bilinear estimate.  This is a thin real-space
wrapper around mathlib's `ContinuousLinearMap.opNorm_le_of_re_inner_le`, useful
when the Chewi Theorem 13.8 normalized Hessian-difference estimate is proved as
a bilinear form bound.
-/
theorem continuousLinearMap_opNorm_le_of_unit_inner_le
    {A : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hbound : ∀ u v : E, ‖u‖ = 1 -> ‖v‖ = 1 ->
      inner ℝ (A u) v ≤ coeff) :
    ‖A‖ ≤ coeff :=
  ContinuousLinearMap.opNorm_le_of_re_inner_le
    (T := A) (C := coeff) hcoeff_nonneg (by
      intro u v hu hv
      simpa using hbound u v hu hv)

/--
Operator-norm bound for a symmetric operator from an absolute quadratic-form
estimate.  This wraps mathlib's Rayleigh quotient formula for self-adjoint
operators and matches the usual source shape
`|<A z, z>| <= coeff * ||z||^2`.
-/
theorem continuousLinearMap_opNorm_le_of_isSymmetric_abs_inner_le
    {A : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hsymm : (A : E →ₗ[ℝ] E).IsSymmetric)
    (hbound : ∀ z : E,
      |inner ℝ (A z) z| ≤ coeff * ‖z‖ ^ (2 : ℕ)) :
    ‖A‖ ≤ coeff := by
  rw [ContinuousLinearMap.norm_eq_iSup_rayleighQuotient A hsymm]
  refine ciSup_le ?_
  intro z
  by_cases hz : ‖z‖ = 0
  · have hz0 : z = 0 := norm_eq_zero.mp hz
    simpa [ContinuousLinearMap.rayleighQuotient, hz0] using hcoeff_nonneg
  · have hden_pos : 0 < ‖z‖ ^ (2 : ℕ) := by positivity
    have hdiv : |inner ℝ (A z) z| / ‖z‖ ^ (2 : ℕ) ≤ coeff := by
      rw [div_le_iff₀ hden_pos]
      exact hbound z
    simpa [ContinuousLinearMap.rayleighQuotient,
      ContinuousLinearMap.reApplyInnerSelf_apply, abs_div] using hdiv

/--
Symmetry is preserved by adjoint conjugation for continuous linear maps.  This
is the coordinate-change bridge used by the normalized Rayleigh route.
-/
theorem continuousLinearMap_adjointConj_isSymmetric_of_isSymmetric
    [CompleteSpace E]
    {delta coord : E →L[ℝ] E}
    (hdelta : (delta : E →ₗ[ℝ] E).IsSymmetric) :
    ((((ContinuousLinearMap.adjoint coord).comp (delta.comp coord)) :
        E →L[ℝ] E) : E →ₗ[ℝ] E).IsSymmetric := by
  have hself : IsSelfAdjoint delta := hdelta.isSelfAdjoint
  have hconj : IsSelfAdjoint
      ((ContinuousLinearMap.adjoint coord).comp (delta.comp coord)) :=
    IsSelfAdjoint.adjoint_conj (T := delta) (S := coord) hself
  exact hconj.isSymmetric

/--
Quadratic form of an adjoint-conjugated operator.  This is the exact
coordinate identity behind the normalized Delta Rayleigh quotient in Chewi
Theorem 13.8.
-/
theorem adjointConj_inner_eq_delta_inner
    [CompleteSpace E]
    {delta normalized coord : E →L[ℝ] E}
    (hnormalized_eq :
      normalized = (ContinuousLinearMap.adjoint coord).comp (delta.comp coord))
    (z : E) :
    inner ℝ (normalized z) z = inner ℝ (delta (coord z)) (coord z) := by
  rw [hnormalized_eq]
  simpa using
    (ContinuousLinearMap.adjoint_inner_left coord z (delta (coord z)))

/--
Normalize a concrete Delta absolute quadratic-form bound through the
square-root coordinate map.
-/
theorem normalizedAdjointConj_absQuadBound_of_deltaAbsQuadBound
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {x : E}
    {delta normalized coord sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hnormalized_eq :
      normalized = (ContinuousLinearMap.adjoint coord).comp (delta.comp coord))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hdelta_abs_quad : ∀ w : E,
      |inner ℝ (delta w) w| ≤ coeff * inner ℝ w (hess x w)) :
    ∀ z : E, |inner ℝ (normalized z) z| ≤ coeff * ‖z‖ ^ (2 : ℕ) := by
  intro z
  have hinner_eq :
      inner ℝ (normalized z) z = inner ℝ (delta (coord z)) (coord z) :=
    adjointConj_inner_eq_delta_inner
      (delta := delta) (normalized := normalized) (coord := coord)
      hnormalized_eq z
  have hcoord_quad :
      inner ℝ (coord z) (hess x (coord z)) = ‖z‖ ^ (2 : ℕ) := by
    rw [hhess_eq]
    calc
      inner ℝ (coord z)
          (((ContinuousLinearMap.adjoint sqrtH).comp sqrtH) (coord z))
          = ‖sqrtH (coord z)‖ ^ (2 : ℕ) := by
            simpa using
              (ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right
                sqrtH (coord z)).symm
      _ = ‖z‖ ^ (2 : ℕ) := by rw [hsqrtH_coord z]
  calc
    |inner ℝ (normalized z) z|
        = |inner ℝ (delta (coord z)) (coord z)| := by rw [hinner_eq]
    _ ≤ coeff * inner ℝ (coord z) (hess x (coord z)) :=
        hdelta_abs_quad (coord z)
    _ = coeff * ‖z‖ ^ (2 : ℕ) := by rw [hcoord_quad]

/--
Dual quadratic-form factorization through an adjoint coordinate map.  If
`normalized = coord† delta coord` and `coord sqrtH = id`, then the dual local
quadratic form of `delta step` is the squared norm of
`normalized (sqrtH step)`.
-/
theorem hessianDeltaDualFactor_of_adjointCoord
    [CompleteSpace E]
    {invHess : E -> E →L[ℝ] E} {x : E}
    {delta normalized coord sqrtH : E →L[ℝ] E}
    (hnormalized_eq :
      normalized = (ContinuousLinearMap.adjoint coord).comp (delta.comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ)) :
    ∀ step : E,
      inner ℝ (delta step) (invHess x (delta step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ) := by
  intro step
  calc
    inner ℝ (delta step) (invHess x (delta step))
        = ‖(ContinuousLinearMap.adjoint coord) (delta step)‖ ^ (2 : ℕ) :=
          hinv_factor (delta step)
    _ = ‖normalized (sqrtH step)‖ ^ (2 : ℕ) := by
      rw [hnormalized_eq]
      simp [hcoord_sqrtH step]

/--
Primal Hessian quadratic-form factorization through a square-root coordinate
map.
-/
theorem hessianPrimalFactor_of_adjointSqrt
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {x : E} {sqrtH : E →L[ℝ] E}
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH) :
    ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ) := by
  intro step
  rw [hhess_eq]
  simpa using
    (ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right sqrtH step).symm

/--
An adjoint-square Hessian factorization is symmetric.
-/
theorem hessianSymmetric_of_adjointSqrt
    [CompleteSpace E]
    {H sqrtH : E →L[ℝ] E}
    (hH_eq : H = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH) :
    (H : E →ₗ[ℝ] E).IsSymmetric := by
  intro u v
  rw [hH_eq]
  simp [ContinuousLinearMap.adjoint_inner_left,
    ContinuousLinearMap.adjoint_inner_right]

/--
An adjoint-square factorization by a continuous linear equivalence is positive
definite.
-/
theorem hessianQuadratic_pos_of_adjointSqrtCoord
    [CompleteSpace E]
    {H : E →L[ℝ] E} (sqrtCoord : E ≃L[ℝ] E)
    (hH_eq :
      H =
        (ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
          sqrtCoord.toContinuousLinearMap)
    {v : E} (hv : v ≠ 0) :
    0 < inner ℝ v (H v) := by
  have hmap_ne : sqrtCoord.toContinuousLinearMap v ≠ 0 := by
    intro hmap
    apply hv
    have h := congrArg (fun y : E => sqrtCoord.symm y) hmap
    simpa using h
  rw [hH_eq]
  have hquad :
      inner ℝ v
          (((ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
            sqrtCoord.toContinuousLinearMap) v) =
        ‖sqrtCoord.toContinuousLinearMap v‖ ^ (2 : ℕ) := by
    simpa using
      (ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right
        sqrtCoord.toContinuousLinearMap v).symm
  rw [hquad]
  exact pow_pos (norm_pos_iff.mpr hmap_ne) 2

/--
If `H = S†S` and `H^{-1}` is supplied as `S^{-1}(S^{-1})†`, then the supplied
inverse-Hessian is a right inverse for the Hessian.
-/
theorem hessianRightInverse_of_adjointSqrtCoord_invHess
    [CompleteSpace E]
    {H invH : E →L[ℝ] E} (sqrtCoord : E ≃L[ℝ] E)
    (hH_eq :
      H =
        (ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
          sqrtCoord.toContinuousLinearMap)
    (hinv_eq :
      invH =
        sqrtCoord.symm.toContinuousLinearMap.comp
          (ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap)) :
    ∀ v : E, H (invH v) = v := by
  intro v
  let S : E →L[ℝ] E := sqrtCoord.toContinuousLinearMap
  let C : E →L[ℝ] E := sqrtCoord.symm.toContinuousLinearMap
  rw [hH_eq, hinv_eq]
  apply ext_inner_right ℝ
  intro w
  calc
    inner ℝ
        (((ContinuousLinearMap.adjoint S).comp S)
          ((C.comp (ContinuousLinearMap.adjoint C)) v)) w =
        inner ℝ
          (S ((C.comp (ContinuousLinearMap.adjoint C)) v)) (S w) := by
          simpa [ContinuousLinearMap.comp_apply] using
            (ContinuousLinearMap.adjoint_inner_left S w
              (S ((C.comp (ContinuousLinearMap.adjoint C)) v)))
    _ = inner ℝ ((ContinuousLinearMap.adjoint C) v) (S w) := by
          simp [S, C, ContinuousLinearMap.comp_apply]
    _ = inner ℝ v (C (S w)) := by
          simpa using
            (ContinuousLinearMap.adjoint_inner_left C (S w) v)
    _ = inner ℝ v w := by
          simp [S, C]

/--
Cauchy bridge between the supplied dual and primal local norms from the
square-root coordinate factorization at a point.
-/
theorem dualPrimalCauchy_of_adjointCoordSqrt
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E} {x : E}
    {coord sqrtH : E →L[ℝ] E}
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hx_hess_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (v w : E) :
    inner ℝ v w ≤ dualLocalNorm invHess x v * localNorm hess x w := by
  have hdual_eq :
      dualLocalNorm invHess x v =
        ‖(ContinuousLinearMap.adjoint coord) v‖ := by
    have hsq :
        (dualLocalNorm invHess x v) ^ (2 : ℕ) =
          ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ) := by
      calc
        (dualLocalNorm invHess x v) ^ (2 : ℕ) =
            inner ℝ v (invHess x v) :=
          dualLocalNorm_sq_eq_inner (hx_inv_nonneg v)
        _ = ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ) :=
          hinv_factor v
    exact (sq_eq_sq₀ (dualLocalNorm_nonneg invHess x v)
      (norm_nonneg _)).mp hsq
  have hlocal_eq :
      localNorm hess x w = ‖sqrtH w‖ := by
    have hsq :
        (localNorm hess x w) ^ (2 : ℕ) =
          ‖sqrtH w‖ ^ (2 : ℕ) := by
      calc
        (localNorm hess x w) ^ (2 : ℕ) =
            inner ℝ w (hess x w) :=
          localNorm_sq_eq_inner (hx_hess_nonneg w)
        _ = ‖sqrtH w‖ ^ (2 : ℕ) :=
          hessianPrimalFactor_of_adjointSqrt
            (hess := hess) (x := x) (sqrtH := sqrtH) hhess_eq w
    exact (sq_eq_sq₀ (localNorm_nonneg hess x w) (norm_nonneg _)).mp hsq
  have hinner_eq :
      inner ℝ v w =
        inner ℝ ((ContinuousLinearMap.adjoint coord) v) (sqrtH w) := by
    have hadj :=
      ContinuousLinearMap.adjoint_inner_left coord (sqrtH w) v
    simpa [hcoord_sqrtH w] using hadj.symm
  calc
    inner ℝ v w =
        inner ℝ ((ContinuousLinearMap.adjoint coord) v) (sqrtH w) :=
      hinner_eq
    _ ≤ ‖(ContinuousLinearMap.adjoint coord) v‖ * ‖sqrtH w‖ :=
      real_inner_le_norm _ _
    _ = dualLocalNorm invHess x v * localNorm hess x w := by
      rw [← hdual_eq, ← hlocal_eq]

/--
The dual inverse-Hessian factorization follows from a square-root Hessian
factorization, a right-inverse identity for the inverse-Hessian oracle, and a
coordinate map inverse to the square-root map.
-/
theorem inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E} {x : E}
    {coord sqrtH : E →L[ℝ] E}
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hright : ∀ v : E, hess x (invHess x v) = v)
    (v : E) :
    inner ℝ v (invHess x v) =
      ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ) := by
  let w := invHess x v
  have hv_eq : v = (ContinuousLinearMap.adjoint sqrtH) (sqrtH w) := by
    have h := hright v
    rw [hhess_eq] at h
    simpa [w] using h.symm
  have hadj_eq :
      (ContinuousLinearMap.adjoint coord) v = sqrtH w := by
    apply ext_inner_right ℝ
    intro z
    calc
      inner ℝ ((ContinuousLinearMap.adjoint coord) v) z =
          inner ℝ v (coord z) :=
        ContinuousLinearMap.adjoint_inner_left coord z v
      _ = inner ℝ ((ContinuousLinearMap.adjoint sqrtH) (sqrtH w))
          (coord z) := by rw [hv_eq]
      _ = inner ℝ (sqrtH w) (sqrtH (coord z)) :=
        ContinuousLinearMap.adjoint_inner_left sqrtH (coord z) (sqrtH w)
      _ = inner ℝ (sqrtH w) z := by rw [hsqrtH_coord z]
  calc
    inner ℝ v (invHess x v) = inner ℝ v w := by
      rfl
    _ =
        inner ℝ ((ContinuousLinearMap.adjoint sqrtH) (sqrtH w)) w := by
      rw [hv_eq]
    _ = inner ℝ (sqrtH w) (sqrtH w) :=
      ContinuousLinearMap.adjoint_inner_left sqrtH w (sqrtH w)
    _ = ‖sqrtH w‖ ^ (2 : ℕ) := by
      simp
    _ = ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ) := by
      rw [hadj_eq]

/--
Generic normalized-operator route for Chewi Theorem 13.8.  If a Delta operator
factors through a square-root coordinate system so that the dual quadratic form
is `||A sqrtH(step)||^2`, and the Hessian quadratic form is
`||sqrtH(step)||^2`, then an operator-norm bound on `A` supplies the full
Delta quadratic bound.
-/
theorem hessianDeltaQuadraticBound_of_normalizedOperator
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x : E} {delta normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (delta step) (invHess x (delta step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_op : ‖normalized‖ ≤ coeff) :
    HessianDeltaQuadraticBound hess invHess x delta coeff := by
  refine ⟨?_⟩
  intro step
  have hnorm_bound :
      ‖normalized (sqrtH step)‖ ≤ coeff * ‖sqrtH step‖ := by
    calc
      ‖normalized (sqrtH step)‖ ≤ ‖normalized‖ * ‖sqrtH step‖ :=
        normalized.le_opNorm _
      _ ≤ coeff * ‖sqrtH step‖ :=
        mul_le_mul_of_nonneg_right hnormalized_op (norm_nonneg _)
  have hsq :
      ‖normalized (sqrtH step)‖ ^ (2 : ℕ) ≤
        (coeff * ‖sqrtH step‖) ^ (2 : ℕ) :=
    (sq_le_sq₀ (norm_nonneg _)
      (mul_nonneg hcoeff_nonneg (norm_nonneg _))).2 hnorm_bound
  calc
    inner ℝ (delta step) (invHess x (delta step))
        = ‖normalized (sqrtH step)‖ ^ (2 : ℕ) := hdual_factor step
    _ ≤ (coeff * ‖sqrtH step‖) ^ (2 : ℕ) := hsq
    _ = coeff ^ (2 : ℕ) * inner ℝ step (hess x step) := by
      rw [hhess_factor step]
      ring

/--
Variant of the normalized-operator route using a squared pointwise bound for
the normalized operator.  This is often closer to the source proof before
packaging it as an operator-norm bound.
-/
theorem hessianDeltaQuadraticBound_of_normalizedSquaredBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x : E} {delta normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (delta step) (invHess x (delta step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_sq : ∀ z : E,
      ‖normalized z‖ ^ (2 : ℕ) ≤ coeff ^ (2 : ℕ) * ‖z‖ ^ (2 : ℕ)) :
    HessianDeltaQuadraticBound hess invHess x delta coeff :=
  hessianDeltaQuadraticBound_of_normalizedOperator
    (hess := hess) (invHess := invHess) (x := x)
    (delta := delta) (normalized := normalized) (sqrtH := sqrtH)
    (coeff := coeff) hcoeff_nonneg hdual_factor hhess_factor
    (continuousLinearMap_opNorm_le_of_norm_sq_le hcoeff_nonneg hnormalized_sq)

/--
Variant of the normalized-operator route using a unit bilinear estimate for
the normalized operator.  This packages the mathlib operator-norm bridge in the
same Delta quadratic-bound interface used by Theorem 13.8.
-/
theorem hessianDeltaQuadraticBound_of_normalizedUnitInnerBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x : E} {delta normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (delta step) (invHess x (delta step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_unit_inner : ∀ u v : E, ‖u‖ = 1 -> ‖v‖ = 1 ->
      inner ℝ (normalized u) v ≤ coeff) :
    HessianDeltaQuadraticBound hess invHess x delta coeff :=
  hessianDeltaQuadraticBound_of_normalizedOperator
    (hess := hess) (invHess := invHess) (x := x)
    (delta := delta) (normalized := normalized) (sqrtH := sqrtH)
    (coeff := coeff) hcoeff_nonneg hdual_factor hhess_factor
    (continuousLinearMap_opNorm_le_of_unit_inner_le
      hcoeff_nonneg hnormalized_unit_inner)

/--
Variant of the normalized-operator route using a symmetric quadratic-form
estimate for the normalized operator.  This is the Rayleigh-quotient route to
the operator-norm line in Chewi Theorem 13.8.
-/
theorem hessianDeltaQuadraticBound_of_normalizedSymmetricQuadraticBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x : E} {delta normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (delta step) (invHess x (delta step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_symm : (normalized : E →ₗ[ℝ] E).IsSymmetric)
    (hnormalized_abs_quad : ∀ z : E,
      |inner ℝ (normalized z) z| ≤ coeff * ‖z‖ ^ (2 : ℕ)) :
    HessianDeltaQuadraticBound hess invHess x delta coeff :=
  hessianDeltaQuadraticBound_of_normalizedOperator
    (hess := hess) (invHess := invHess) (x := x)
    (delta := delta) (normalized := normalized) (sqrtH := sqrtH)
    (coeff := coeff) hcoeff_nonneg hdual_factor hhess_factor
    (continuousLinearMap_opNorm_le_of_isSymmetric_abs_inner_le
      hcoeff_nonneg hnormalized_symm hnormalized_abs_quad)

/--
Concrete normalized-operator route for the integrated Hessian-difference
operator in Chewi Theorem 13.8.
-/
theorem hessianSegmentDelta_quadraticBound_of_normalizedOperator
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x y : E} {normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (hessianSegmentDelta hess x y step)
          (invHess x (hessianSegmentDelta hess x y step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_op : ‖normalized‖ ≤ coeff) :
    HessianDeltaQuadraticBound hess invHess x
      (hessianSegmentDelta hess x y) coeff :=
  hessianDeltaQuadraticBound_of_normalizedOperator
    (hess := hess) (invHess := invHess) (x := x)
    (delta := hessianSegmentDelta hess x y)
    (normalized := normalized) (sqrtH := sqrtH) (coeff := coeff)
    hcoeff_nonneg hdual_factor hhess_factor hnormalized_op

/--
Concrete normalized squared-bound route for the integrated Hessian-difference
operator in Chewi Theorem 13.8.
-/
theorem hessianSegmentDelta_quadraticBound_of_normalizedSquaredBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x y : E} {normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (hessianSegmentDelta hess x y step)
          (invHess x (hessianSegmentDelta hess x y step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_sq : ∀ z : E,
      ‖normalized z‖ ^ (2 : ℕ) ≤ coeff ^ (2 : ℕ) * ‖z‖ ^ (2 : ℕ)) :
    HessianDeltaQuadraticBound hess invHess x
      (hessianSegmentDelta hess x y) coeff :=
  hessianDeltaQuadraticBound_of_normalizedSquaredBound
    (hess := hess) (invHess := invHess) (x := x)
    (delta := hessianSegmentDelta hess x y)
    (normalized := normalized) (sqrtH := sqrtH) (coeff := coeff)
    hcoeff_nonneg hdual_factor hhess_factor hnormalized_sq

/--
Concrete normalized unit-bilinear route for the integrated Hessian-difference
operator in Chewi Theorem 13.8.
-/
theorem hessianSegmentDelta_quadraticBound_of_normalizedUnitInnerBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x y : E} {normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (hessianSegmentDelta hess x y step)
          (invHess x (hessianSegmentDelta hess x y step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_unit_inner : ∀ u v : E, ‖u‖ = 1 -> ‖v‖ = 1 ->
      inner ℝ (normalized u) v ≤ coeff) :
    HessianDeltaQuadraticBound hess invHess x
      (hessianSegmentDelta hess x y) coeff :=
  hessianDeltaQuadraticBound_of_normalizedUnitInnerBound
    (hess := hess) (invHess := invHess) (x := x)
    (delta := hessianSegmentDelta hess x y)
    (normalized := normalized) (sqrtH := sqrtH) (coeff := coeff)
    hcoeff_nonneg hdual_factor hhess_factor hnormalized_unit_inner

/--
Concrete normalized symmetric quadratic-form route for the integrated
Hessian-difference operator in Chewi Theorem 13.8.
-/
theorem hessianSegmentDelta_quadraticBound_of_normalizedSymmetricQuadraticBound
    {hess : E -> E →L[ℝ] E} {invHess : E -> E →L[ℝ] E}
    {x y : E} {normalized sqrtH : E →L[ℝ] E} {coeff : ℝ}
    (hcoeff_nonneg : 0 ≤ coeff)
    (hdual_factor : ∀ step : E,
      inner ℝ (hessianSegmentDelta hess x y step)
          (invHess x (hessianSegmentDelta hess x y step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_symm : (normalized : E →ₗ[ℝ] E).IsSymmetric)
    (hnormalized_abs_quad : ∀ z : E,
      |inner ℝ (normalized z) z| ≤ coeff * ‖z‖ ^ (2 : ℕ)) :
    HessianDeltaQuadraticBound hess invHess x
      (hessianSegmentDelta hess x y) coeff :=
  hessianDeltaQuadraticBound_of_normalizedSymmetricQuadraticBound
    (hess := hess) (invHess := invHess) (x := x)
    (delta := hessianSegmentDelta hess x y)
    (normalized := normalized) (sqrtH := sqrtH) (coeff := coeff)
    hcoeff_nonneg hdual_factor hhess_factor hnormalized_symm
    hnormalized_abs_quad

/--
Chewi Theorem 13.8 source residual identity.  If `delta` is the integrated
Hessian-difference operator on the Newton step and Newton's linear equation
holds, then `grad(x+) = delta (x+ - x)`.
-/
theorem chewi138_gradientResidual_eq_deltaStep_of_integral_delta
    [CompleteSpace E]
    {grad : E -> E} {hess : E -> E →L[ℝ] E}
    {invHess : E -> E →L[ℝ] E} {delta : E →L[ℝ] E} {x : E}
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hint : IntervalIntegrable
      (fun t : ℝ =>
        hess (hessianSegmentPoint x (newtonStep grad invHess x) t)
          (newtonStep grad invHess x - x))
      MeasureTheory.volume (0 : ℝ) 1)
    (hdelta_action :
      delta (newtonStep grad invHess x - x) =
        (∫ t in (0 : ℝ)..1,
          hess (hessianSegmentPoint x (newtonStep grad invHess x) t)
            (newtonStep grad invHess x - x)) -
          hess x (newtonStep grad invHess x - x))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0) :
    grad (newtonStep grad invHess x) =
      delta (newtonStep grad invHess x - x) := by
  let y := newtonStep grad invHess x
  let step := y - x
  have hInt :
      (∫ t in (0 : ℝ)..1,
          hess (hessianSegmentPoint x y t) step) =
        grad y - grad x := by
    simpa [y, step] using
      hessianSegmentGradient_integral_eq_sub_of_hasFDerivAt
        (grad := grad) (hess := hess) (x := x) (y := y)
        (by
          intro t ht
          simpa [y] using hgrad t ht)
        (by simpa [y, step] using hint)
  have hhess_step : hess x step = -grad x := by
    simpa [step, y, eq_neg_iff_add_eq_zero, add_comm] using hnewton_linear
  calc
    grad y = (∫ t in (0 : ℝ)..1,
          hess (hessianSegmentPoint x y t) step) - hess x step := by
      rw [hInt, hhess_step]
      simp
    _ = delta step := by
      simpa [y, step] using hdelta_action.symm

/--
Chewi Theorem 13.8 residual identity using the concrete integrated
Hessian-difference operator from the source proof.
-/
theorem chewi138_gradientResidual_eq_hessianSegmentDelta_step
    [CompleteSpace E]
    {grad : E -> E} {hess : E -> E →L[ℝ] E}
    {invHess : E -> E →L[ℝ] E} {s : Set E} {x : E}
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0) :
    grad (newtonStep grad invHess x) =
      hessianSegmentDelta hess x (newtonStep grad invHess x)
        (newtonStep grad invHess x - x) := by
  let y := newtonStep grad invHess x
  let step := y - x
  have hint_vec : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint x y t) step)
      MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_apply_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) (v := step) hhess
      (by simpa [y] using hseg)
  have hint_op : IntervalIntegrable
      (fun t : ℝ => hess (hessianSegmentPoint x y t))
      MeasureTheory.volume (0 : ℝ) 1 :=
    hessianSegmentHessian_intervalIntegrable_of_continuousOn
      (hess := hess) (s := s) (x := x) (y := y) hhess
      (by simpa [y] using hseg)
  exact
    chewi138_gradientResidual_eq_deltaStep_of_integral_delta
      (grad := grad) (hess := hess) (invHess := invHess)
      (delta := hessianSegmentDelta hess x (newtonStep grad invHess x))
      (x := x)
      hgrad
      (by simpa [y, step] using hint_vec)
      (by
        simpa [y, step] using
          hessianSegmentDelta_apply
            (hess := hess) (x := x) (y := y) (v := step) hint_op)
      hnewton_linear

/--
The first norm-transport line in Chewi Theorem 13.8, in supplied-inverse-Hessian
form: after the inverse-Hessian quadratic comparison is available along the
Newton segment, the Newton decrement at `x+` is bounded by the dual local norm
at `x` divided by `1 - M * lambda(x)`.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper
    {grad : E -> E} {invHess : E -> E →L[ℝ] E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hx_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v)) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      dualLocalNorm invHess x (grad (newtonStep grad invHess x)) /
        (1 - M * newtonDecrement grad invHess x) := by
  simpa [newtonDecrement] using
    dualLocalNorm_le_div_one_sub_of_inverseHessianQuadraticUpper
      (invHess := invHess) (x := x) (y := newtonStep grad invHess x)
      (M := M) (r := newtonDecrement grad invHess x)
      hMlambda_lt hx_nonneg hstep_nonneg hupper
      (grad (newtonStep grad invHess x))

/--
Residual estimate in the source shape of Chewi Theorem 13.8.  The remaining
analytic/matrix work in the textbook proof is to supply the quadratic-form
bound for the gradient residual; this theorem converts it into the displayed
dual-local-norm residual bound.
-/
theorem chewi138_gradientResidual_dualLocalNorm_le_of_quadratic_bound
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hinv_nonneg : 0 ≤ inner ℝ (grad (newtonStep grad invHess x))
      (invHess x (grad (newtonStep grad invHess x))))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x)))
    (hquad :
      inner ℝ (grad (newtonStep grad invHess x))
        (invHess x (grad (newtonStep grad invHess x))) ≤
        (M * newtonDecrement grad invHess x /
            (1 - M * newtonDecrement grad invHess x)) ^ (2 : ℕ) *
          inner ℝ (newtonStep grad invHess x - x)
            (hess x (newtonStep grad invHess x - x))) :
    dualLocalNorm invHess x (grad (newtonStep grad invHess x)) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) := by
  let lam := newtonDecrement grad invHess x
  have hden_pos : 0 < 1 - M * lam := by
    dsimp [lam]
    nlinarith
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hcoeff_nonneg : 0 ≤ M * lam / (1 - M * lam) := by
    exact div_nonneg (mul_nonneg hM_nonneg hlam_nonneg) hden_pos.le
  have hbase :
      dualLocalNorm invHess x (grad (newtonStep grad invHess x)) ≤
        (M * lam / (1 - M * lam)) *
          localNorm hess x (newtonStep grad invHess x - x) := by
    exact dualLocalNorm_le_mul_localNorm_of_quadratic_bound
      (hess := hess) (invHess := invHess) (x := x)
      (residual := grad (newtonStep grad invHess x))
      (step := newtonStep grad invHess x - x)
      (coeff := M * lam / (1 - M * lam))
      hcoeff_nonneg hinv_nonneg hstep_hess_nonneg (by simpa [lam] using hquad)
  have hbase' :
      dualLocalNorm invHess x (grad (newtonStep grad invHess x)) ≤
        (M * lam / (1 - M * lam)) * lam := by
    simpa [lam, hstep_norm] using hbase
  have heq :
      (M * lam / (1 - M * lam)) * lam =
        M * lam ^ (2 : ℕ) / (1 - M * lam) := by
    ring
  simpa [lam, heq] using hbase'

/--
Chewi Theorem 13.8 residual estimate from a Delta operator.  This replaces the
raw residual quadratic-form assumption by the source decomposition
`∇f(x⁺) = Delta (x⁺ - x)` plus a Delta operator quadratic bound.
-/
theorem chewi138_gradientResidual_dualLocalNorm_le_of_deltaQuadraticBound
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {delta : E →L[ℝ] E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hresidual :
      grad (newtonStep grad invHess x) =
        delta (newtonStep grad invHess x - x))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x)))
    (hdelta :
      HessianDeltaQuadraticBound hess invHess x delta
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x))) :
    dualLocalNorm invHess x (grad (newtonStep grad invHess x)) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) := by
  have hinv_nonneg : 0 ≤ inner ℝ (grad (newtonStep grad invHess x))
      (invHess x (grad (newtonStep grad invHess x))) := by
    simpa [hresidual] using
      hx_inv_nonneg (delta (newtonStep grad invHess x - x))
  have hquad :
      inner ℝ (grad (newtonStep grad invHess x))
        (invHess x (grad (newtonStep grad invHess x))) ≤
        (M * newtonDecrement grad invHess x /
            (1 - M * newtonDecrement grad invHess x)) ^ (2 : ℕ) *
          inner ℝ (newtonStep grad invHess x - x)
            (hess x (newtonStep grad invHess x - x)) := by
    simpa [hresidual] using hdelta.bound (newtonStep grad invHess x - x)
  exact chewi138_gradientResidual_dualLocalNorm_le_of_quadratic_bound
    (hess := hess) (grad := grad) (invHess := invHess) (x := x) (M := M)
    hM_nonneg hMlambda_lt hstep_norm hinv_nonneg hstep_hess_nonneg hquad

/--
Supplied-interface assembly of Chewi Theorem 13.8.  The dual-transport piece
and the gradient-residual quadratic estimate together give the textbook local
quadratic decrement bound.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_residualQuadraticBound
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x)))
    (hquad :
      inner ℝ (grad (newtonStep grad invHess x))
        (invHess x (grad (newtonStep grad invHess x))) ≤
        (M * newtonDecrement grad invHess x /
            (1 - M * newtonDecrement grad invHess x)) ^ (2 : ℕ) *
          inner ℝ (newtonStep grad invHess x - x)
            (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hden_pos : 0 < 1 - M * lam := by
    dsimp [lam]
    nlinarith
  have htransport :
      newtonDecrement grad invHess (newtonStep grad invHess x) ≤
        dualLocalNorm invHess x (grad (newtonStep grad invHess x)) /
          (1 - M * lam) := by
    simpa [lam] using
      chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper
        (grad := grad) (invHess := invHess) (x := x) (M := M)
        hMlambda_lt hx_inv_nonneg hstep_inv_nonneg hupper
  have hresidual :
      dualLocalNorm invHess x (grad (newtonStep grad invHess x)) ≤
        M * lam ^ (2 : ℕ) / (1 - M * lam) := by
    simpa [lam] using
      chewi138_gradientResidual_dualLocalNorm_le_of_quadratic_bound
        (hess := hess) (grad := grad) (invHess := invHess) (x := x) (M := M)
        hM_nonneg hMlambda_lt hstep_norm (hx_inv_nonneg _)
        hstep_hess_nonneg hquad
  have hdiv := div_le_div_of_nonneg_right hresidual hden_pos.le
  have hden_ne : 1 - M * lam ≠ 0 := ne_of_gt hden_pos
  calc
    newtonDecrement grad invHess (newtonStep grad invHess x)
        ≤ dualLocalNorm invHess x (grad (newtonStep grad invHess x)) /
            (1 - M * lam) := htransport
    _ ≤ (M * lam ^ (2 : ℕ) / (1 - M * lam)) / (1 - M * lam) := hdiv
    _ = M * lam ^ (2 : ℕ) / (1 - M * lam) ^ (2 : ℕ) := by
      field_simp [hden_ne]

/--
Chewi Theorem 13.8 assembly from a Delta operator.  The remaining source work
is now isolated as inverse-Hessian transport plus the Delta operator
quadratic bound and residual identity.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_deltaQuadraticBound
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {delta : E →L[ℝ] E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hresidual :
      grad (newtonStep grad invHess x) =
        delta (newtonStep grad invHess x - x))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x)))
    (hdelta :
      HessianDeltaQuadraticBound hess invHess x delta
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hquad :
      inner ℝ (grad (newtonStep grad invHess x))
        (invHess x (grad (newtonStep grad invHess x))) ≤
        (M * newtonDecrement grad invHess x /
            (1 - M * newtonDecrement grad invHess x)) ^ (2 : ℕ) *
          inner ℝ (newtonStep grad invHess x - x)
            (hess x (newtonStep grad invHess x - x)) := by
    simpa [hresidual] using hdelta.bound (newtonStep grad invHess x - x)
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_residualQuadraticBound
      (hess := hess) (grad := grad) (invHess := invHess) (x := x) (M := M)
      hM_nonneg hMlambda_lt hstep_norm hx_inv_nonneg hstep_inv_nonneg hupper
      hstep_hess_nonneg hquad

/--
Chewi Theorem 13.8 assembly with the concrete integrated Hessian-difference
operator.  This discharges the source residual identity from the gradient FTC;
the remaining source obligations are the inverse-Hessian transport comparison
and the Delta operator quadratic-form bound.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaQuadraticBound
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x)))
    (hdelta :
      HessianDeltaQuadraticBound hess invHess x
        (hessianSegmentDelta hess x (newtonStep grad invHess x))
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hresidual :
      grad (newtonStep grad invHess x) =
        hessianSegmentDelta hess x (newtonStep grad invHess x)
          (newtonStep grad invHess x - x) :=
    chewi138_gradientResidual_eq_hessianSegmentDelta_step
      (grad := grad) (hess := hess) (invHess := invHess)
      (s := s) (x := x) hhess hseg hgrad hnewton_linear
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_deltaQuadraticBound
      (hess := hess) (grad := grad) (invHess := invHess)
      (delta := hessianSegmentDelta hess x (newtonStep grad invHess x))
      (x := x) (M := M)
      hM_nonneg hMlambda_lt hstep_norm hresidual hx_inv_nonneg
      hstep_inv_nonneg hupper hstep_hess_nonneg hdelta

/--
Chewi Theorem 13.8 assembly from concrete Delta scalar/order data.  This
replaces the `HessianDeltaQuadraticBound` input by the local-norm segment upper
bound plus the remaining dual-energy/order comparison.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaEnergy
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hx_hess_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_hess_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t) w))
    (hnorm : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      localNorm hess (hessianSegmentPoint x (newtonStep grad invHess x) t) w ≤
        localNorm hess x w /
          (1 - M * newtonDecrement grad invHess x * t))
    (hdual_energy : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) ≤
        (M * newtonDecrement grad invHess x /
            (1 - M * newtonDecrement grad invHess x)) *
          inner ℝ step
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hdelta :
      HessianDeltaQuadraticBound hess invHess x
        (hessianSegmentDelta hess x (newtonStep grad invHess x))
        (M * lam / (1 - M * lam)) := by
    simpa [lam] using
      hessianSegmentDelta_quadraticBound_of_localNormUpper_and_dualEnergy
        (hess := hess) (invHess := invHess) (s := s) (x := x)
        (y := newtonStep grad invHess x) (M := M) (lambda := lam)
        hM_nonneg hlam_nonneg (by simpa [lam] using hMlambda_lt)
        hhess hseg hx_hess_nonneg hz_hess_nonneg
        (by simpa [lam] using hnorm)
        (by simpa [lam] using hdual_energy)
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaQuadraticBound
      (hess := hess) (grad := grad) (invHess := invHess) (s := s)
      (x := x) (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hgrad hnewton_linear
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg
      (by simpa [lam] using hdelta)

/--
Chewi Theorem 13.8 assembly from the textbook normalized-operator line
`||H(x)^(-1/2) Delta H(x)^(-1/2)||_op <= coeff`.  The factorization
hypotheses identify the supplied `sqrtH` and `normalized` operators with the
source square-root coordinates.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hdual_factor : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_op :
      ‖normalized‖ ≤
        M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hden_pos : 0 < 1 - M * lam := by
    dsimp [lam]
    nlinarith
  have hcoeff_nonneg : 0 ≤ M * lam / (1 - M * lam) :=
    div_nonneg (mul_nonneg hM_nonneg hlam_nonneg) hden_pos.le
  have hdelta :
      HessianDeltaQuadraticBound hess invHess x
        (hessianSegmentDelta hess x (newtonStep grad invHess x))
        (M * lam / (1 - M * lam)) := by
    simpa [lam] using
      hessianSegmentDelta_quadraticBound_of_normalizedOperator
        (hess := hess) (invHess := invHess) (x := x)
        (y := newtonStep grad invHess x)
        (normalized := normalized) (sqrtH := sqrtH)
        (coeff := M * lam / (1 - M * lam))
        hcoeff_nonneg
        (by simpa [lam] using hdual_factor)
        hhess_factor
        (by simpa [lam] using hnormalized_op)
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_concreteDeltaQuadraticBound
      (hess := hess) (grad := grad) (invHess := invHess) (s := s)
      (x := x) (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hgrad hnewton_linear
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg
      (by simpa [lam] using hdelta)

/--
Chewi Theorem 13.8 assembly from a squared pointwise bound on the normalized
Delta operator.  This is the form closest to the displayed source estimate
before converting it to an operator-norm statement.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSquaredConcreteDelta
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hdual_factor : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_sq : ∀ z : E,
      ‖normalized z‖ ^ (2 : ℕ) ≤
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x)) ^ (2 : ℕ) *
            ‖z‖ ^ (2 : ℕ))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hden_pos : 0 < 1 - M * lam := by
    dsimp [lam]
    nlinarith
  have hcoeff_nonneg : 0 ≤ M * lam / (1 - M * lam) :=
    div_nonneg (mul_nonneg hM_nonneg hlam_nonneg) hden_pos.le
  have hnormalized_op :
      ‖normalized‖ ≤ M * lam / (1 - M * lam) :=
    continuousLinearMap_opNorm_le_of_norm_sq_le
      (A := normalized) (coeff := M * lam / (1 - M * lam))
      hcoeff_nonneg (by simpa [lam] using hnormalized_sq)
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (sqrtH := sqrtH) (s := s) (x := x)
      (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hgrad hnewton_linear
      hdual_factor hhess_factor (by simpa [lam] using hnormalized_op)
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg

/--
Chewi Theorem 13.8 assembly from a symmetric quadratic-form estimate on the
normalized Delta operator.  This is the Rayleigh quotient path from the
source-style bound `|<A z,z>| <= coeff * ||z||^2` to the already compiled
operator-norm decrement wrapper.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSymmetricQuadraticConcreteDelta
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hdual_factor : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_symm : (normalized : E →ₗ[ℝ] E).IsSymmetric)
    (hnormalized_abs_quad : ∀ z : E,
      |inner ℝ (normalized z) z| ≤
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x)) * ‖z‖ ^ (2 : ℕ))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hden_pos : 0 < 1 - M * lam := by
    dsimp [lam]
    nlinarith
  have hcoeff_nonneg : 0 ≤ M * lam / (1 - M * lam) :=
    div_nonneg (mul_nonneg hM_nonneg hlam_nonneg) hden_pos.le
  have hnormalized_op :
      ‖normalized‖ ≤ M * lam / (1 - M * lam) :=
    continuousLinearMap_opNorm_le_of_isSymmetric_abs_inner_le
      (A := normalized) (coeff := M * lam / (1 - M * lam))
      hcoeff_nonneg hnormalized_symm
      (by simpa [lam] using hnormalized_abs_quad)
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (sqrtH := sqrtH) (s := s) (x := x)
      (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hgrad hnewton_linear
      hdual_factor hhess_factor (by simpa [lam] using hnormalized_op)
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg

/--
Chewi Theorem 13.8 assembly for a normalized operator identified as an adjoint
conjugate `coord† Delta coord`.  The concrete Delta symmetry is derived from
pointwise Hessian symmetry along the Newton segment, leaving only the
coordinate factorization and absolute quadratic-form estimate as normalized
source obligations.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedAdjointConjSymmetricQuadraticConcreteDelta
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hdual_factor : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hnormalized_abs_quad : ∀ z : E,
      |inner ℝ (normalized z) z| ≤
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x)) * ‖z‖ ^ (2 : ℕ))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hnormalized_symm : (normalized : E →ₗ[ℝ] E).IsSymmetric := by
    rw [hnormalized_eq]
    exact
      hessianSegmentDelta_adjointConj_isSymmetric_of_continuousOn
        (hess := hess) (s := s) (x := x)
        (y := newtonStep grad invHess x) (coord := coord)
        hhess hseg hsymm
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedSymmetricQuadraticConcreteDelta
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (sqrtH := sqrtH) (s := s) (x := x)
      (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hgrad hnewton_linear
      hdual_factor hhess_factor hnormalized_symm hnormalized_abs_quad
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg

/--
Chewi Theorem 13.8 assembly with the dual and primal square-root
factorizations derived from coordinate identities.  This removes the abstract
`hdual_factor` and `hhess_factor` hypotheses from the adjoint-conjugation
Rayleigh route.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hnormalized_abs_quad : ∀ z : E,
      |inner ℝ (normalized z) z| ≤
        (M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x)) * ‖z‖ ^ (2 : ℕ))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hdual_factor : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ) :=
    hessianDeltaDualFactor_of_adjointCoord
      (invHess := invHess) (x := x)
      (delta := hessianSegmentDelta hess x (newtonStep grad invHess x))
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      hnormalized_eq hcoord_sqrtH hinv_factor
  have hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ) :=
    hessianPrimalFactor_of_adjointSqrt
      (hess := hess) (x := x) (sqrtH := sqrtH) hhess_eq
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedAdjointConjSymmetricQuadraticConcreteDelta
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hsymm hgrad
      hnewton_linear hdual_factor hhess_factor hnormalized_eq
      hnormalized_abs_quad hx_inv_nonneg hstep_inv_nonneg hupper
      hstep_hess_nonneg

/--
Chewi Theorem 13.8 assembly where the normalized Rayleigh bound is discharged
from the concrete two-sided local-norm sandwich along the Newton segment.  The
remaining supplied data are the source square-root coordinate identities and
the inverse-Hessian transport comparison.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_localNormSandwich
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_hess_nonneg : ∀ w : E, 0 ≤ inner ℝ w (hess x w))
    (hz_hess_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w (hess (hessianSegmentPoint x
        (newtonStep grad invHess x) t) w))
    (hnorm_lower : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      (1 - M * newtonDecrement grad invHess x * t) *
          localNorm hess x w ≤
        localNorm hess (hessianSegmentPoint x
          (newtonStep grad invHess x) t) w)
    (hnorm_upper : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      localNorm hess (hessianSegmentPoint x
          (newtonStep grad invHess x) t) w ≤
        localNorm hess x w /
          (1 - M * newtonDecrement grad invHess x * t))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hdelta_abs_quad : ∀ w : E,
      |inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) w) w| ≤
        (M * lam / (1 - M * lam)) * inner ℝ w (hess x w) := by
    intro w
    simpa [lam] using
      hessianSegmentDelta_abs_inner_le_of_localNormSandwich
        (hess := hess) (s := s) (x := x)
        (y := newtonStep grad invHess x) (v := w)
        (M := M) (lambda := lam)
        hM_nonneg hlam_nonneg (by simpa [lam] using hMlambda_lt)
        hhess hseg hx_hess_nonneg hz_hess_nonneg
        (by simpa [lam] using hnorm_lower)
        (by simpa [lam] using hnorm_upper)
  have hnormalized_abs_quad : ∀ z : E,
      |inner ℝ (normalized z) z| ≤
        (M * lam / (1 - M * lam)) * ‖z‖ ^ (2 : ℕ) :=
    normalizedAdjointConj_absQuadBound_of_deltaAbsQuadBound
      (hess := hess) (x := x)
      (delta := hessianSegmentDelta hess x (newtonStep grad invHess x))
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (coeff := M * lam / (1 - M * lam))
      hnormalized_eq hhess_eq hsqrtH_coord hdelta_abs_quad
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hsymm hgrad
      hnewton_linear hnormalized_eq hcoord_sqrtH hinv_factor hhess_eq
      (by simpa [lam] using hnormalized_abs_quad)
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg

/--
Chewi Theorem 13.8 assembly where the pointwise Newton-segment local-norm
sandwich is derived from the compiled Lemma 13.6 source-radius theorem.  The
remaining source obligations are the concrete square-root coordinate
identities and the inverse-Hessian transport comparison.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v)) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s := by
    intro t ht
    exact hessianSegmentPoint_mem_of_convex hs hx hstep_mem ht
  have hz_hess_nonneg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      0 ≤ inner ℝ w
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t) w) := by
    intro t ht w
    exact hsc.hess_nonneg (hseg t ht) w
  have hsand : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 -> ∀ w : E,
      (1 - M * newtonDecrement grad invHess x * t) * localNorm hess x w ≤
        localNorm hess (hessianSegmentPoint x
          (newtonStep grad invHess x) t) w ∧
      localNorm hess (hessianSegmentPoint x
          (newtonStep grad invHess x) t) w ≤
        localNorm hess x w /
          (1 - M * newtonDecrement grad invHess x * t) := by
    intro t ht w
    exact
      chewi138_newtonSegment_localNorm_sandwich_sourceRadius
        (s := s) (hess := hess) (hessDeriv := hessDeriv)
        (thirdMixed := thirdMixed) (grad := grad) (invHess := invHess)
        (x := x) (M := M) (t := t)
        hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
        hhess_cont hhess hmixed ht w
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_localNormSandwich
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hsc.parameter_pos.le hMlambda_lt hstep_norm hhess_cont hseg hsymm
      hgrad hnewton_linear hnormalized_eq hcoord_sqrtH hsqrtH_coord
      hinv_factor hhess_eq (fun w => hsc.hess_nonneg hx w)
      hz_hess_nonneg
      (by
        intro t ht w
        exact (hsand t ht w).1)
      (by
        intro t ht w
        exact (hsand t ht w).2)
      hx_inv_nonneg hstep_inv_nonneg hupper
      (hsc.hess_nonneg hx (newtonStep grad invHess x - x))

/--
Chewi Theorem 13.8 source-Newton-segment assembly with the inverse-Hessian
transport supplied in the textbook dual-local-norm shape.  The raw quadratic
upper comparison is recovered by squaring the dual local norm inequality.
-/
theorem chewi138_newtonDecrement_step_le_of_dualLocalNormUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hdual_upper : ∀ v : E,
      dualLocalNorm invHess (newtonStep grad invHess x) v ≤
        dualLocalNorm invHess x v /
          (1 - M * newtonDecrement grad invHess x)) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
      hhess_cont hhess hmixed hsymm hgrad hnewton_linear
      hnormalized_eq hcoord_sqrtH hsqrtH_coord hinv_factor hhess_eq
      hx_inv_nonneg hstep_inv_nonneg
      (by
        intro v
        exact
          inverseHessianQuadraticUpper_of_dualLocalNorm_le_div_one_sub
            (invHess := invHess) (x := x)
            (y := newtonStep grad invHess x) (M := M)
            (r := newtonDecrement grad invHess x)
            hMlambda_lt hx_inv_nonneg hstep_inv_nonneg hdual_upper v)

/--
Chewi Theorem 13.8 source-Newton-segment assembly where the dual-local-norm
transport is derived from the compiled Lemma 13.6 primal lower sandwich plus
supplied Cauchy and inverse-local identities.
-/
theorem chewi138_newtonDecrement_step_le_of_primalLowerDualIdentity_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hstep_inv_local : ∀ v : E,
      localNorm hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) =
        dualLocalNorm invHess (newtonStep grad invHess x) v)
    (hx_cauchy : ∀ v w : E,
      inner ℝ v w ≤ dualLocalNorm invHess x v * localNorm hess x w) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  exact
    chewi138_newtonDecrement_step_le_of_dualLocalNormUpper_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
      hhess_cont hhess hmixed hsymm hgrad hnewton_linear
      hnormalized_eq hcoord_sqrtH hsqrtH_coord hinv_factor hhess_eq
      hx_inv_nonneg hstep_inv_nonneg
      (by
        intro v
        refine
          dualLocalNorm_le_div_one_sub_of_localNorm_lower_and_inverseIdentity
            (hess := hess) (invHess := invHess) (x := x)
            (y := newtonStep grad invHess x) (M := M)
            (r := newtonDecrement grad invHess x)
            hMlambda_lt hstep_inv_nonneg ?hlower hstep_inv_local hx_cauchy v
        intro w
        have hsand :=
          chewi138_newtonSegment_localNorm_sandwich_sourceRadius
            (s := s) (hess := hess) (hessDeriv := hessDeriv)
            (thirdMixed := thirdMixed) (grad := grad) (invHess := invHess)
            (x := x) (M := M) (t := 1)
            hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
            hhess_cont hhess hmixed (by simp) w
        simpa [hessianSegmentPoint_one, mul_assoc] using hsand.1)

/--
Chewi Theorem 13.8 source-Newton-segment assembly where the Cauchy bridge at
`x` is derived from the same square-root coordinate factorization already used
for the normalized Rayleigh line.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseLocal_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hstep_inv_local : ∀ v : E,
      localNorm hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) =
        dualLocalNorm invHess (newtonStep grad invHess x) v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  exact
    chewi138_newtonDecrement_step_le_of_primalLowerDualIdentity_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
      hhess_cont hhess hmixed hsymm hgrad hnewton_linear
      hnormalized_eq hcoord_sqrtH hsqrtH_coord hinv_factor hhess_eq
      hx_inv_nonneg hstep_inv_nonneg hstep_inv_local
      (by
        intro v w
        exact
          dualPrimalCauchy_of_adjointCoordSqrt
            (hess := hess) (invHess := invHess) (x := x)
            (coord := coord) (sqrtH := sqrtH)
            hcoord_sqrtH hinv_factor hhess_eq hx_inv_nonneg
            (fun u => hsc.hess_nonneg hx u) v w)

/--
Chewi Theorem 13.8 source-Newton-segment assembly where the inverse-local
identity at `x+` and inverse-Hessian nonnegativity are derived from the
concrete right-inverse identity `hess(x+) (invHess(x+) v) = v`.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverse_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hstep_right_inverse : ∀ v : E,
      hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v) := by
    intro v
    exact inverseHessianQuadratic_nonneg_of_adjointCoordFactor
      (invHess := invHess) (x := x) (coord := coord) hinv_factor v
  have hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v) := by
    intro v
    exact inverseHessianQuadratic_nonneg_of_hessian_right_inverse
      (hess := hess) (invHess := invHess)
      (x := newtonStep grad invHess x)
      (fun w => hsc.hess_nonneg hstep_mem w) hstep_right_inverse v
  have hstep_inv_local : ∀ v : E,
      localNorm hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) =
        dualLocalNorm invHess (newtonStep grad invHess x) v := by
    intro v
    exact localNorm_invHess_eq_dualLocalNorm_of_hessian_right_inverse
      (hess := hess) (invHess := invHess)
      (x := newtonStep grad invHess x)
      (fun w => hsc.hess_nonneg hstep_mem w) hstep_right_inverse v
  exact
    chewi138_newtonDecrement_step_le_of_inverseLocal_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
      hhess_cont hhess hmixed hsymm hgrad hnewton_linear
      hnormalized_eq hcoord_sqrtH hsqrtH_coord hinv_factor hhess_eq
      hx_inv_nonneg hstep_inv_nonneg hstep_inv_local

/--
Chewi Theorem 13.8 source-Newton-segment assembly where both the Definition
13.7 Newton-decrement norm identity at `x` and the inverse-local identity at
`x+` are derived from concrete right-inverse identities.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hstep_ne : newtonStep grad invHess x - x ≠ 0)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_right_inverse : ∀ v : E, hess x (invHess x v) = v)
    (hstep_right_inverse : ∀ v : E,
      hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x :=
    localNorm_newtonStep_sub_eq_newtonDecrement_of_hessian_right_inverse
      (hess := hess) (grad := grad) (invHess := invHess) (x := x)
      hx_right_inverse
  exact
    chewi138_newtonDecrement_step_le_of_hessianRightInverse_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
      (s := s) (x := x) (M := M)
      hMlambda_lt hstep_norm hs hx hstep_mem hsc hess_pos hstep_ne
      hhess_cont hhess hmixed hsymm hgrad hnewton_linear
      hnormalized_eq hcoord_sqrtH hsqrtH_coord hinv_factor hhess_eq
      hstep_right_inverse

/--
Chewi Theorem 13.8 source-Newton-segment assembly with the zero Newton-step
case handled separately, so the source-facing wrapper no longer requires
`x+ - x ≠ 0`.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment_or_zero
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized coord sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint coord).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp coord))
    (hcoord_sqrtH : ∀ step : E, coord (sqrtH step) = step)
    (hsqrtH_coord : ∀ z : E, sqrtH (coord z) = z)
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint coord) v‖ ^ (2 : ℕ))
    (hhess_eq : hess x = (ContinuousLinearMap.adjoint sqrtH).comp sqrtH)
    (hx_right_inverse : ∀ v : E, hess x (invHess x v) = v)
    (hstep_right_inverse : ∀ v : E,
      hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  by_cases hstep_ne : newtonStep grad invHess x - x ≠ 0
  · exact
      chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment
        (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
        (grad := grad) (invHess := invHess)
        (normalized := normalized) (coord := coord) (sqrtH := sqrtH)
        (s := s) (x := x) (M := M)
        hMlambda_lt hs hx hstep_mem hsc hess_pos hstep_ne
        hhess_cont hhess hmixed hsymm hgrad hnewton_linear
        hnormalized_eq hcoord_sqrtH hsqrtH_coord hinv_factor hhess_eq
        hx_right_inverse hstep_right_inverse
  · have hstep_zero : newtonStep grad invHess x - x = 0 := not_not.mp hstep_ne
    have hstep_eq : newtonStep grad invHess x = x := sub_eq_zero.mp hstep_zero
    have hgrad_zero : grad x = 0 := by
      have hlin := hnewton_linear
      rw [hstep_zero] at hlin
      simpa using hlin
    have hlam_zero : newtonDecrement grad invHess x = 0 := by
      simp [newtonDecrement, hgrad_zero, dualLocalNorm_zero]
    have hleft_zero :
        newtonDecrement grad invHess (newtonStep grad invHess x) = 0 := by
      simp [hstep_eq, newtonDecrement, hgrad_zero, dualLocalNorm_zero]
    simp [hleft_zero, hlam_zero]

/--
Chewi Theorem 13.8 source-Newton-segment assembly with the square-root
coordinate inverse equations derived from one continuous linear equivalence.
The forward map is `sqrtH`, and its inverse is the coordinate map used in the
adjoint-conjugate normalization.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_continuousLinearEquivCoord_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized : E →L[ℝ] E} {sqrtCoord : E ≃L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp
            sqrtCoord.symm.toContinuousLinearMap))
    (hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap) v‖ ^
          (2 : ℕ))
    (hhess_eq :
      hess x =
        (ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
          sqrtCoord.toContinuousLinearMap)
    (hx_right_inverse : ∀ v : E, hess x (invHess x v) = v)
    (hstep_right_inverse : ∀ v : E,
      hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hcoord_sqrtH : ∀ step : E,
      sqrtCoord.symm.toContinuousLinearMap
          (sqrtCoord.toContinuousLinearMap step) = step := by
    intro step
    simp
  have hsqrtH_coord : ∀ z : E,
      sqrtCoord.toContinuousLinearMap
          (sqrtCoord.symm.toContinuousLinearMap z) = z := by
    intro z
    simp
  exact
    chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_factorizedNormalizedAdjointConjSymmetricQuadraticConcreteDelta_of_sourceNewtonSegment_or_zero
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (coord := sqrtCoord.symm.toContinuousLinearMap)
      (sqrtH := sqrtCoord.toContinuousLinearMap) (s := s) (x := x) (M := M)
      hMlambda_lt hs hx hstep_mem hsc hess_pos hhess_cont hhess hmixed
      hsymm hgrad hnewton_linear hnormalized_eq hcoord_sqrtH hsqrtH_coord
      hinv_factor hhess_eq hx_right_inverse hstep_right_inverse

/--
Chewi Theorem 13.8 source-Newton-segment assembly where the inverse-Hessian
dual factorization is derived from the square-root Hessian factorization and
the right-inverse identity at `x`.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_adjointSqrtCoord_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized : E →L[ℝ] E} {sqrtCoord : E ≃L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp
            sqrtCoord.symm.toContinuousLinearMap))
    (hhess_eq :
      hess x =
        (ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
          sqrtCoord.toContinuousLinearMap)
    (hx_right_inverse : ∀ v : E, hess x (invHess x v) = v)
    (hstep_right_inverse : ∀ v : E,
      hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hsqrtH_coord : ∀ z : E,
      sqrtCoord.toContinuousLinearMap
          (sqrtCoord.symm.toContinuousLinearMap z) = z := by
    intro z
    simp
  have hinv_factor : ∀ v : E,
      inner ℝ v (invHess x v) =
        ‖(ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap) v‖ ^
          (2 : ℕ) := by
    intro v
    exact
      inverseHessianQuadratic_eq_adjointCoord_norm_sq_of_adjointSqrt_right_inverse
        (hess := hess) (invHess := invHess) (x := x)
        (coord := sqrtCoord.symm.toContinuousLinearMap)
        (sqrtH := sqrtCoord.toContinuousLinearMap)
        hsqrtH_coord hhess_eq hx_right_inverse v
  exact
    chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_continuousLinearEquivCoord_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (sqrtCoord := sqrtCoord)
      (s := s) (x := x) (M := M)
      hMlambda_lt hs hx hstep_mem hsc hess_pos hhess_cont hhess hmixed
      hsymm hgrad hnewton_linear hnormalized_eq hinv_factor hhess_eq
      hx_right_inverse hstep_right_inverse

/--
Chewi Theorem 13.8 source-Newton-segment assembly with the inverse-Hessian
right-inverse equation supplied uniformly on the feasible set.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoord_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E}
    {normalized : E →L[ℝ] E} {sqrtCoord : E ≃L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hnormalized_eq :
      normalized =
        (ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp
            sqrtCoord.symm.toContinuousLinearMap))
    (hhess_eq :
      hess x =
        (ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
          sqrtCoord.toContinuousLinearMap)
    (hinv_right : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E,
      hess z (invHess z v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hx_right_inverse : ∀ v : E, hess x (invHess x v) = v :=
    hinv_right (z := x) hx
  have hstep_right_inverse : ∀ v : E,
      hess (newtonStep grad invHess x)
          (invHess (newtonStep grad invHess x) v) = v :=
    hinv_right (z := newtonStep grad invHess x) hstep_mem
  exact
    chewi138_newtonDecrement_step_le_of_hessianRightInverses_and_adjointSqrtCoord_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized := normalized) (sqrtCoord := sqrtCoord)
      (s := s) (x := x) (M := M)
      hMlambda_lt hs hx hstep_mem hsc hess_pos hhess_cont hhess hmixed
      hsymm hgrad hnewton_linear hnormalized_eq hhess_eq
      hx_right_inverse hstep_right_inverse

/--
Chewi Theorem 13.8 source-Newton-segment assembly with the normalized Delta
operator chosen definitionally as the adjoint coordinate conjugate.
-/
theorem chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoordDelta_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E} {sqrtCoord : E ≃L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v))
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hhess_eq :
      hess x =
        (ContinuousLinearMap.adjoint sqrtCoord.toContinuousLinearMap).comp
          sqrtCoord.toContinuousLinearMap)
    (hinv_right : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E,
      hess z (invHess z v) = v) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  exact
    chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoord_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess)
      (normalized :=
        (ContinuousLinearMap.adjoint sqrtCoord.symm.toContinuousLinearMap).comp
          ((hessianSegmentDelta hess x (newtonStep grad invHess x)).comp
            sqrtCoord.symm.toContinuousLinearMap))
      (sqrtCoord := sqrtCoord) (s := s) (x := x) (M := M)
      hMlambda_lt hs hx hstep_mem hsc hess_pos hhess_cont hhess hmixed
      hsymm hgrad hnewton_linear rfl hhess_eq hinv_right

/--
Chewi Theorem 13.8 source-Newton-segment assembly from a concrete square-root
coordinate model for the Hessian and inverse Hessian on the feasible set.
-/
theorem chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {hessDeriv : E -> E →L[ℝ] (E →L[ℝ] E)}
    {thirdMixed : E -> E -> E -> ℝ} {grad : E -> E}
    {invHess : E -> E →L[ℝ] E} {sqrtCoord : E -> E ≃L[ℝ] E}
    {s : Set E} {x : E} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hs : Convex ℝ s) (hx : x ∈ s)
    (hstep_mem : newtonStep grad invHess x ∈ s)
    (hsc : MixedThirdSelfConcordantOn s hess thirdMixed M)
    (hhess_cont : ContinuousOn hess s)
    (hhess : ∀ z, z ∈ s -> HasFDerivAt hess (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ s -> ∀ a v : E,
      inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hhess_model : ∀ ⦃z : E⦄, z ∈ s ->
      hess z =
        (ContinuousLinearMap.adjoint (sqrtCoord z).toContinuousLinearMap).comp
          (sqrtCoord z).toContinuousLinearMap)
    (hinv_model : ∀ ⦃z : E⦄, z ∈ s ->
      invHess z =
        (sqrtCoord z).symm.toContinuousLinearMap.comp
          (ContinuousLinearMap.adjoint
            (sqrtCoord z).symm.toContinuousLinearMap)) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  have hess_pos : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E, v ≠ 0 ->
      0 < inner ℝ v (hess z v) := by
    intro z hz v hv
    exact
      hessianQuadratic_pos_of_adjointSqrtCoord
        (H := hess z) (sqrtCoord := sqrtCoord z)
        (hhess_model hz) hv
  have hsymm : ∀ z, z ∈ s -> (hess z : E →ₗ[ℝ] E).IsSymmetric := by
    intro z hz
    exact
      hessianSymmetric_of_adjointSqrt
        (H := hess z) (sqrtH := (sqrtCoord z).toContinuousLinearMap)
        (hhess_model hz)
  have hinv_right : ∀ ⦃z : E⦄, z ∈ s -> ∀ v : E,
      hess z (invHess z v) = v := by
    intro z hz
    exact
      hessianRightInverse_of_adjointSqrtCoord_invHess
        (H := hess z) (invH := invHess z)
        (sqrtCoord := sqrtCoord z)
        (hhess_model hz) (hinv_model hz)
  exact
    chewi138_newtonDecrement_step_le_of_hessianRightInverseOn_and_adjointSqrtCoordDelta_of_sourceNewtonSegment
      (hess := hess) (hessDeriv := hessDeriv) (thirdMixed := thirdMixed)
      (grad := grad) (invHess := invHess) (sqrtCoord := sqrtCoord x)
      (s := s) (x := x) (M := M)
      hMlambda_lt hs hx hstep_mem hsc hess_pos hhess_cont hhess hmixed
      hsymm hgrad hnewton_linear (hhess_model hx) hinv_right

/--
Chewi Theorem 13.8 assembly from a unit bilinear estimate on the normalized
Delta operator.  This leaves the remaining textbook work as the symmetric or
bilinear Hessian-difference estimate, while reusing mathlib for the
operator-norm conversion.
-/
theorem chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedUnitInnerConcreteDelta
    [CompleteSpace E]
    {hess : E -> E →L[ℝ] E} {grad : E -> E} {invHess : E -> E →L[ℝ] E}
    {normalized sqrtH : E →L[ℝ] E} {s : Set E} {x : E} {M : ℝ}
    (hM_nonneg : 0 ≤ M)
    (hMlambda_lt : M * newtonDecrement grad invHess x < 1)
    (hstep_norm :
      localNorm hess x (newtonStep grad invHess x - x) =
        newtonDecrement grad invHess x)
    (hhess : ContinuousOn hess s)
    (hseg : ∀ t, t ∈ Set.Icc (0 : ℝ) 1 ->
      hessianSegmentPoint x (newtonStep grad invHess x) t ∈ s)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (hess (hessianSegmentPoint x (newtonStep grad invHess x) t))
        (hessianSegmentPoint x (newtonStep grad invHess x) t))
    (hnewton_linear :
      grad x + hess x (newtonStep grad invHess x - x) = 0)
    (hdual_factor : ∀ step : E,
      inner ℝ
          (hessianSegmentDelta hess x (newtonStep grad invHess x) step)
          (invHess x
            (hessianSegmentDelta hess x (newtonStep grad invHess x) step)) =
        ‖normalized (sqrtH step)‖ ^ (2 : ℕ))
    (hhess_factor : ∀ step : E,
      inner ℝ step (hess x step) = ‖sqrtH step‖ ^ (2 : ℕ))
    (hnormalized_unit_inner : ∀ u v : E, ‖u‖ = 1 -> ‖v‖ = 1 ->
      inner ℝ (normalized u) v ≤
        M * newtonDecrement grad invHess x /
          (1 - M * newtonDecrement grad invHess x))
    (hx_inv_nonneg : ∀ v : E, 0 ≤ inner ℝ v (invHess x v))
    (hstep_inv_nonneg : ∀ v : E,
      0 ≤ inner ℝ v (invHess (newtonStep grad invHess x) v))
    (hupper : ∀ v : E,
      inner ℝ v (invHess (newtonStep grad invHess x) v) ≤
        ((1 - M * newtonDecrement grad invHess x)⁻¹) ^ (2 : ℕ) *
          inner ℝ v (invHess x v))
    (hstep_hess_nonneg :
      0 ≤ inner ℝ (newtonStep grad invHess x - x)
        (hess x (newtonStep grad invHess x - x))) :
    newtonDecrement grad invHess (newtonStep grad invHess x) ≤
      M * (newtonDecrement grad invHess x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad invHess x) ^ (2 : ℕ) := by
  let lam := newtonDecrement grad invHess x
  have hlam_nonneg : 0 ≤ lam := by
    dsimp [lam, newtonDecrement]
    exact dualLocalNorm_nonneg invHess x (grad x)
  have hden_pos : 0 < 1 - M * lam := by
    dsimp [lam]
    nlinarith
  have hcoeff_nonneg : 0 ≤ M * lam / (1 - M * lam) :=
    div_nonneg (mul_nonneg hM_nonneg hlam_nonneg) hden_pos.le
  have hnormalized_op :
      ‖normalized‖ ≤ M * lam / (1 - M * lam) :=
    continuousLinearMap_opNorm_le_of_unit_inner_le
      (A := normalized) (coeff := M * lam / (1 - M * lam))
      hcoeff_nonneg (by simpa [lam] using hnormalized_unit_inner)
  exact
    chewi138_newtonDecrement_step_le_of_inverseHessianQuadraticUpper_and_normalizedConcreteDelta
      (hess := hess) (grad := grad) (invHess := invHess)
      (normalized := normalized) (sqrtH := sqrtH) (s := s) (x := x)
      (M := M)
      hM_nonneg hMlambda_lt hstep_norm hhess hseg hgrad hnewton_linear
      hdual_factor hhess_factor (by simpa [lam] using hnormalized_op)
      hx_inv_nonneg hstep_inv_nonneg hupper hstep_hess_nonneg

/--
Chewi Definition 13.3, source-shaped self-concordance interface using only the
directional cubic `∇³ f(x)[v,v,v]` and a supplied Hessian oracle.
-/
structure SelfConcordantOn
    (s : Set E) (hess : E -> E →L[ℝ] E) (third : E -> E -> ℝ)
    (M : ℝ) : Prop where
  parameter_pos : 0 < M
  hess_nonneg : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
    0 ≤ inner ℝ v (hess x v)
  third_bound : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
    |third x v| ≤ 2 * M * (localNorm hess x v) ^ (3 : ℕ)

theorem SelfConcordantOn.of_zero_third
    {s : Set E} {hess : E -> E →L[ℝ] E} {M : ℝ}
    (hM : 0 < M)
    (hess_nonneg : ∀ ⦃x : E⦄, x ∈ s -> ∀ v : E,
      0 ≤ inner ℝ v (hess x v)) :
    SelfConcordantOn s hess (fun _ _ => 0) M where
  parameter_pos := hM
  hess_nonneg := hess_nonneg
  third_bound := by
    intro x hx v
    have hnorm_nonneg : 0 ≤ localNorm hess x v :=
      localNorm_nonneg hess x v
    have hrhs_nonneg :
        0 ≤ 2 * M * (localNorm hess x v) ^ (3 : ℕ) := by
      positivity
    simpa using hrhs_nonneg

/--
Source-shaped certificate for the textbook observation after Definition 13.3:
a quadratic model has zero third derivative, hence is self-concordant for any
positive parameter as soon as its supplied Hessian is positive semidefinite on
the working set.
-/
theorem constantHessian_zeroThird_selfConcordantOn
    {s : Set E} {H : E →L[ℝ] E} {M : ℝ}
    (hM : 0 < M)
    (hH_nonneg : ∀ v : E, 0 ≤ inner ℝ v (H v)) :
    SelfConcordantOn s (fun _ => H) (fun _ _ => 0) M :=
  SelfConcordantOn.of_zero_third
    (s := s) (hess := fun _ => H) hM
    (by
      intro x hx v
      exact hH_nonneg v)

end VectorSelfConcordance

/-- Scalar multiplication as a continuous linear map on the real line. -/
noncomputable def realScaleCLM (a : ℝ) : ℝ →L[ℝ] ℝ :=
  a • (1 : ℝ →L[ℝ] ℝ)

@[simp]
theorem realScaleCLM_apply (a x : ℝ) :
    realScaleCLM a x = a * x := by
  simp [realScaleCLM]

/-- Nonzero scalar multiplication as a continuous linear equivalence on `ℝ`. -/
noncomputable def realScaleCLE (a : ℝ) (ha : a ≠ 0) : ℝ ≃L[ℝ] ℝ :=
  ContinuousLinearEquiv.smulLeft (Units.mk0 a ha)

theorem realScaleCLE_toContinuousLinearMap
    (a : ℝ) (ha : a ≠ 0) :
    (realScaleCLE a ha).toContinuousLinearMap = realScaleCLM a := by
  apply ContinuousLinearMap.ext
  intro x
  simp [realScaleCLE, realScaleCLM]

theorem realScaleCLE_symm_toContinuousLinearMap
    (a : ℝ) (ha : a ≠ 0) :
    (realScaleCLE a ha).symm.toContinuousLinearMap = realScaleCLM a⁻¹ := by
  apply ContinuousLinearMap.ext
  intro x
  change (realScaleCLE a ha).symm x = a⁻¹ * x
  rw [ContinuousLinearEquiv.symm_apply_eq]
  change x = a * (a⁻¹ * x)
  field_simp [ha]

theorem realScaleCLM_adjoint (a : ℝ) :
    ContinuousLinearMap.adjoint (realScaleCLM a) = realScaleCLM a := by
  apply ContinuousLinearMap.ext
  intro y
  have h :=
    ContinuousLinearMap.adjoint_inner_left (realScaleCLM a) (1 : ℝ) y
  simpa [realScaleCLM, mul_comm] using h

theorem realScaleCLM_comp (a b : ℝ) :
    (realScaleCLM a).comp (realScaleCLM b) = realScaleCLM (a * b) := by
  apply ContinuousLinearMap.ext
  intro x
  simp [realScaleCLM]
  ring

/-- Chewi Example 13.4's logarithmic barrier on the positive half-line. -/
noncomputable def negLogBarrier (x : ℝ) : ℝ :=
  - Real.log x

/-- The displayed second derivative of `negLogBarrier`: `x^{-2}`. -/
noncomputable def negLogBarrierSecond (x : ℝ) : ℝ :=
  x ^ (-2 : ℤ)

/-- The displayed third derivative of `negLogBarrier`: `-2 x^{-3}`. -/
noncomputable def negLogBarrierThird (x : ℝ) : ℝ :=
  -2 * x ^ (-3 : ℤ)

/-- The one-dimensional Hessian operator for `x ↦ -log x`. -/
noncomputable def negLogHessCLM (x : ℝ) : ℝ →L[ℝ] ℝ :=
  realScaleCLM (negLogBarrierSecond x)

/-- The one-dimensional inverse-Hessian operator for `x ↦ -log x`. -/
noncomputable def negLogInvHessCLM (x : ℝ) : ℝ →L[ℝ] ℝ :=
  realScaleCLM (x ^ (2 : ℕ))

/--
The square-root coordinate for the logarithmic barrier Hessian on `ℝ`.
Away from zero this is scalar multiplication by `x^{-1}`; the zero branch is
irrelevant for the positive-domain model.
-/
noncomputable def negLogSqrtCoord (x : ℝ) : ℝ ≃L[ℝ] ℝ :=
  if h : x ≠ 0 then realScaleCLE x⁻¹ (inv_ne_zero h)
  else ContinuousLinearEquiv.refl ℝ ℝ

/--
One-dimensional local norm generated by a supplied second-derivative oracle.
For `f(x) = -log x`, this is `sqrt(f''(x) v^2) = |v| / x`.
-/
noncomputable def oneDimLocalNorm (second : ℝ -> ℝ) (x v : ℝ) : ℝ :=
  Real.sqrt (second x * v ^ (2 : ℕ))

/--
One-dimensional self-concordance inequality in the source form
`|f'''(x) v^3| <= 2 M ||v||_x^3`.
-/
structure OneDimSelfConcordantOn
    (s : Set ℝ) (second third : ℝ -> ℝ) (M : ℝ) : Prop where
  parameter_pos : 0 < M
  second_nonneg : ∀ ⦃x : ℝ⦄, x ∈ s -> 0 ≤ second x
  inequality : ∀ ⦃x : ℝ⦄, x ∈ s -> ∀ v : ℝ,
    |third x * v ^ (3 : ℕ)| ≤
      2 * M * (oneDimLocalNorm second x v) ^ (3 : ℕ)

theorem negLogBarrier_deriv (x : ℝ) :
    deriv negLogBarrier x = -x⁻¹ := by
  unfold negLogBarrier
  rw [deriv.fun_neg, Real.deriv_log]

theorem inv_sq_eq_zpow_neg_two (x : ℝ) :
    x⁻¹ ^ (2 : ℕ) = x ^ (-2 : ℤ) := by
  change x⁻¹ ^ (2 : ℕ) = (x ^ (2 : ℕ))⁻¹
  exact inv_pow x 2

theorem negLogSqrtCoord_toContinuousLinearMap_of_pos
    {x : ℝ} (hx : 0 < x) :
    (negLogSqrtCoord x).toContinuousLinearMap = realScaleCLM x⁻¹ := by
  simp [negLogSqrtCoord, hx.ne', realScaleCLE_toContinuousLinearMap]

theorem negLogSqrtCoord_symm_toContinuousLinearMap_of_pos
    {x : ℝ} (hx : 0 < x) :
    (negLogSqrtCoord x).symm.toContinuousLinearMap = realScaleCLM x := by
  rw [negLogSqrtCoord]
  simp [hx.ne', realScaleCLE_symm_toContinuousLinearMap]

theorem negLogHessCLM_eq_adjoint_sqrtCoord_of_pos
    {x : ℝ} (hx : 0 < x) :
    negLogHessCLM x =
      (ContinuousLinearMap.adjoint
          (negLogSqrtCoord x).toContinuousLinearMap).comp
        (negLogSqrtCoord x).toContinuousLinearMap := by
  rw [negLogSqrtCoord_toContinuousLinearMap_of_pos hx]
  rw [realScaleCLM_adjoint, realScaleCLM_comp]
  change realScaleCLM (x ^ (-2 : ℤ)) = realScaleCLM (x⁻¹ * x⁻¹)
  congr 1
  rw [← inv_sq_eq_zpow_neg_two x]
  ring

theorem negLogInvHessCLM_eq_sqrtCoord_invModel_of_pos
    {x : ℝ} (hx : 0 < x) :
    negLogInvHessCLM x =
      (negLogSqrtCoord x).symm.toContinuousLinearMap.comp
        (ContinuousLinearMap.adjoint
          (negLogSqrtCoord x).symm.toContinuousLinearMap) := by
  rw [negLogSqrtCoord_symm_toContinuousLinearMap_of_pos hx]
  rw [realScaleCLM_adjoint, realScaleCLM_comp]
  apply ContinuousLinearMap.ext
  intro v
  simp [negLogInvHessCLM, realScaleCLM, pow_two]

theorem negLogHessCLM_sqrtCoord_model_Ioi :
    ∀ ⦃x : ℝ⦄, x ∈ Set.Ioi 0 ->
      negLogHessCLM x =
        (ContinuousLinearMap.adjoint
            (negLogSqrtCoord x).toContinuousLinearMap).comp
          (negLogSqrtCoord x).toContinuousLinearMap := by
  intro x hx
  exact negLogHessCLM_eq_adjoint_sqrtCoord_of_pos hx

theorem negLogInvHessCLM_sqrtCoord_model_Ioi :
    ∀ ⦃x : ℝ⦄, x ∈ Set.Ioi 0 ->
      negLogInvHessCLM x =
        (negLogSqrtCoord x).symm.toContinuousLinearMap.comp
          (ContinuousLinearMap.adjoint
            (negLogSqrtCoord x).symm.toContinuousLinearMap) := by
  intro x hx
  exact negLogInvHessCLM_eq_sqrtCoord_invModel_of_pos hx

theorem negLogBarrier_deriv_sq_div_second_eq_one
    {x : ℝ} (hx : 0 < x) :
    (deriv negLogBarrier x) ^ (2 : ℕ) / negLogBarrierSecond x = 1 := by
  rw [negLogBarrier_deriv]
  dsimp [negLogBarrierSecond]
  rw [← inv_sq_eq_zpow_neg_two x]
  field_simp [hx.ne']

theorem negLogBarrier_dualLocalNorm_deriv_eq_one
    {x : ℝ} (hx : 0 < x) :
    dualLocalNorm negLogInvHessCLM x (deriv negLogBarrier x) = 1 := by
  have hquad :
      inner ℝ (deriv negLogBarrier x)
          (negLogInvHessCLM x (deriv negLogBarrier x)) = 1 := by
    rw [negLogBarrier_deriv]
    simp [negLogInvHessCLM, realScaleCLM]
    field_simp [hx.ne']
  dsimp [dualLocalNorm]
  change Real.sqrt (inner ℝ (deriv negLogBarrier x)
      (negLogInvHessCLM x (deriv negLogBarrier x))) = 1
  rw [hquad]
  norm_num

/-- The positive orthant in finite Euclidean coordinates. -/
def positiveOrthant {d : ℕ} : Set (EuclideanSpace ℝ (Fin d)) :=
  {x | ∀ i : Fin d, 0 < x i}

/-- The finite positive-orthant logarithmic barrier `x ↦ ∑ i, -log (x_i)`. -/
noncomputable def positiveOrthantNegLogBarrier {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) : ℝ :=
  ∑ i : Fin d, negLogBarrier (x i)

/--
The coordinatewise gradient model for the finite product logarithmic barrier
`x ↦ ∑ i, -log (x_i)`.
-/
noncomputable def positiveOrthantNegLogGrad {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) : EuclideanSpace ℝ (Fin d) :=
  WithLp.toLp 2 fun i : Fin d => deriv negLogBarrier (x i)

@[simp] theorem positiveOrthantNegLogGrad_apply {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogGrad x i = deriv negLogBarrier (x i) := by
  simp [positiveOrthantNegLogGrad, PiLp.toLp_apply]

/--
The coordinatewise inverse-Hessian model for the finite product logarithmic
barrier.  On coordinate `i` this applies the scalar inverse Hessian `x_i^2`.
-/
noncomputable def positiveOrthantNegLogInvHessCLM {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => WithLp.toLp 2 fun i : Fin d => (x i) ^ (2 : ℕ) * v i
      map_add' := by
        intro v w
        ext i
        simp [mul_add]
      map_smul' := by
        intro c v
        ext i
        simp
        ring }

@[simp] theorem positiveOrthantNegLogInvHessCLM_apply {d : ℕ}
    (x v : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogInvHessCLM x v i = (x i) ^ (2 : ℕ) * v i := by
  simp [positiveOrthantNegLogInvHessCLM]

/--
The coordinatewise Hessian model for the finite product logarithmic barrier.
On coordinate `i` this applies the scalar Hessian `x_i^{-2}`.
-/
noncomputable def positiveOrthantNegLogHessCLM {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun v => WithLp.toLp 2 fun i : Fin d => (x i) ^ (-2 : ℤ) * v i
      map_add' := by
        intro v w
        ext i
        simp [mul_add]
      map_smul' := by
        intro c v
        ext i
        simp
        ring }

@[simp] theorem positiveOrthantNegLogHessCLM_apply {d : ℕ}
    (x v : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogHessCLM x v i = (x i) ^ (-2 : ℤ) * v i := by
  simp [positiveOrthantNegLogHessCLM]

/-- Diagonal continuous-linear operator built from a finite coordinate vector. -/
noncomputable def positiveOrthantDiagonalCLM {d : ℕ} :
    EuclideanSpace ℝ (Fin d) →L[ℝ]
      (EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d)) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun c =>
        LinearMap.toContinuousLinearMap
          { toFun := fun v => WithLp.toLp 2 fun i : Fin d => c i * v i
            map_add' := by
              intro v w
              ext i
              simp [mul_add]
            map_smul' := by
              intro a v
              ext i
              simp
              ring }
      map_add' := by
        intro c d
        apply ContinuousLinearMap.ext
        intro v
        ext i
        simp [add_mul]
      map_smul' := by
        intro a c
        apply ContinuousLinearMap.ext
        intro v
        ext i
        simp
        ring }

@[simp] theorem positiveOrthantDiagonalCLM_apply {d : ℕ}
    (c v : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantDiagonalCLM c v i = c i * v i := by
  simp [positiveOrthantDiagonalCLM]

/-- Coordinate vector of the finite product logarithmic-barrier Hessian. -/
noncomputable def positiveOrthantNegLogHessCoeff {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) : EuclideanSpace ℝ (Fin d) :=
  WithLp.toLp 2 fun i : Fin d => (x i) ^ (-2 : ℤ)

@[simp] theorem positiveOrthantNegLogHessCoeff_apply {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogHessCoeff x i = (x i) ^ (-2 : ℤ) := by
  simp [positiveOrthantNegLogHessCoeff, PiLp.toLp_apply]

/-- Derivative of the Hessian coefficient vector at a positive-orthant point. -/
noncomputable def positiveOrthantNegLogHessCoeffDerivCLM {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun a => WithLp.toLp 2 fun i : Fin d => negLogBarrierThird (x i) * a i
      map_add' := by
        intro a b
        ext i
        simp [mul_add]
      map_smul' := by
        intro c a
        ext i
        simp
        ring }

@[simp] theorem positiveOrthantNegLogHessCoeffDerivCLM_apply {d : ℕ}
    (x a : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogHessCoeffDerivCLM x a i =
      negLogBarrierThird (x i) * a i := by
  simp [positiveOrthantNegLogHessCoeffDerivCLM]

theorem positiveOrthantNegLogHessCLM_eq_diagonal {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    positiveOrthantNegLogHessCLM x =
      positiveOrthantDiagonalCLM (positiveOrthantNegLogHessCoeff x) := by
  apply ContinuousLinearMap.ext
  intro v
  ext i
  simp

/--
The positive-orthant square-root Hessian coordinate map at a point known to lie
in the positive orthant.
-/
noncomputable def positiveOrthantNegLogSqrtCoordOfMem {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) (hx : x ∈ positiveOrthant (d := d)) :
    EuclideanSpace ℝ (Fin d) ≃L[ℝ] EuclideanSpace ℝ (Fin d) :=
  LinearEquiv.toContinuousLinearEquiv
    { toFun := fun v => WithLp.toLp 2 fun i : Fin d => (x i)⁻¹ * v i
      invFun := fun v => WithLp.toLp 2 fun i : Fin d => x i * v i
      left_inv := by
        intro v
        ext i
        have hxi : x i ≠ 0 := (hx i).ne'
        simp [hxi]
      right_inv := by
        intro v
        ext i
        have hxi : x i ≠ 0 := (hx i).ne'
        simp [hxi]
      map_add' := by
        intro v w
        ext i
        simp [mul_add]
      map_smul' := by
        intro c v
        ext i
        simp
        ring }

/--
A total square-root coordinate oracle for the positive-orthant logarithmic
barrier, using the identity map off the positive orthant.  The model theorems
below only use it on `positiveOrthant`.
-/
noncomputable def positiveOrthantNegLogSqrtCoord {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) ≃L[ℝ] EuclideanSpace ℝ (Fin d) := by
  classical
  exact
    if hx : x ∈ positiveOrthant (d := d) then
      positiveOrthantNegLogSqrtCoordOfMem x hx
    else
      ContinuousLinearEquiv.refl ℝ (EuclideanSpace ℝ (Fin d))

@[simp] theorem positiveOrthantNegLogSqrtCoord_apply_of_mem {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (v : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogSqrtCoord x v i = (x i)⁻¹ * v i := by
  simp [positiveOrthantNegLogSqrtCoord, hx, positiveOrthantNegLogSqrtCoordOfMem]

@[simp] theorem positiveOrthantNegLogSqrtCoord_symm_apply_of_mem {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (v : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    (positiveOrthantNegLogSqrtCoord x).symm v i = x i * v i := by
  simp [positiveOrthantNegLogSqrtCoord, hx, positiveOrthantNegLogSqrtCoordOfMem]

theorem positiveOrthantNegLogSqrtCoord_adjoint_eq_self_of_mem {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    ContinuousLinearMap.adjoint
        (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap =
      (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap := by
  let S : EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
    (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap
  change ContinuousLinearMap.adjoint S = S
  have hself : ∀ v w : EuclideanSpace ℝ (Fin d), inner ℝ (S v) w = inner ℝ v (S w) := by
    intro v w
    rw [PiLp.inner_apply, PiLp.inner_apply]
    simp [RCLike.inner_apply, S, hx]
    refine Finset.sum_congr rfl ?_
    intro i _hi
    ring_nf
  apply ContinuousLinearMap.ext
  intro v
  apply ext_inner_right ℝ
  intro w
  calc
    inner ℝ ((ContinuousLinearMap.adjoint S) v) w = inner ℝ v (S w) := by
      simpa using ContinuousLinearMap.adjoint_inner_left S w v
    _ = inner ℝ (S v) w := (hself v w).symm

theorem positiveOrthantNegLogSqrtCoord_symm_adjoint_eq_self_of_mem {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    ContinuousLinearMap.adjoint
        (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap =
      (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap := by
  let C : EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
    (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap
  change ContinuousLinearMap.adjoint C = C
  have hself : ∀ v w : EuclideanSpace ℝ (Fin d), inner ℝ (C v) w = inner ℝ v (C w) := by
    intro v w
    rw [PiLp.inner_apply, PiLp.inner_apply]
    simp [RCLike.inner_apply, C, hx]
    refine Finset.sum_congr rfl ?_
    intro i _hi
    ring_nf
  apply ContinuousLinearMap.ext
  intro v
  apply ext_inner_right ℝ
  intro w
  calc
    inner ℝ ((ContinuousLinearMap.adjoint C) v) w = inner ℝ v (C w) := by
      simpa using ContinuousLinearMap.adjoint_inner_left C w v
    _ = inner ℝ (C v) w := (hself v w).symm

theorem positiveOrthantNegLogHessCLM_sqrtCoord_model {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    positiveOrthantNegLogHessCLM x =
      (ContinuousLinearMap.adjoint
          (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap).comp
        (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap := by
  have hadj := positiveOrthantNegLogSqrtCoord_adjoint_eq_self_of_mem hx
  rw [hadj]
  apply ContinuousLinearMap.ext
  intro v
  ext i
  simp [hx]
  have hxi : x i ≠ 0 := (hx i).ne'
  field_simp [hxi]

theorem positiveOrthantNegLogInvHessCLM_sqrtCoord_model {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    positiveOrthantNegLogInvHessCLM x =
      (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap.comp
        (ContinuousLinearMap.adjoint
          (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap) := by
  have hadj := positiveOrthantNegLogSqrtCoord_symm_adjoint_eq_self_of_mem hx
  rw [hadj]
  apply ContinuousLinearMap.ext
  intro v
  ext i
  simp [hx]
  ring

theorem positiveOrthantNegLogHessCLM_sqrtCoord_model_positiveOrthant {d : ℕ} :
    ∀ ⦃x : EuclideanSpace ℝ (Fin d)⦄, x ∈ positiveOrthant (d := d) ->
      positiveOrthantNegLogHessCLM x =
        (ContinuousLinearMap.adjoint
            (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap).comp
          (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap := by
  intro x hx
  exact positiveOrthantNegLogHessCLM_sqrtCoord_model hx

theorem positiveOrthantNegLogInvHessCLM_sqrtCoord_model_positiveOrthant {d : ℕ} :
    ∀ ⦃x : EuclideanSpace ℝ (Fin d)⦄, x ∈ positiveOrthant (d := d) ->
      positiveOrthantNegLogInvHessCLM x =
        (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap.comp
          (ContinuousLinearMap.adjoint
            (positiveOrthantNegLogSqrtCoord x).symm.toContinuousLinearMap) := by
  intro x hx
  exact positiveOrthantNegLogInvHessCLM_sqrtCoord_model hx

/--
The coordinatewise mixed third derivative for the finite positive-orthant
logarithmic barrier:
`∑ i, f'''(x_i) u_i v_i^2`.
-/
noncomputable def positiveOrthantNegLogThirdMixed {d : ℕ}
    (x u v : EuclideanSpace ℝ (Fin d)) : ℝ :=
  ∑ i : Fin d, negLogBarrierThird (x i) * u i * (v i) ^ (2 : ℕ)

/--
The coordinatewise Hessian-derivative oracle for the finite positive-orthant
logarithmic barrier.  In direction `a`, coordinate `i` multiplies by
`f'''(x_i) a_i`.
-/
noncomputable def positiveOrthantNegLogHessDerivCLM {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) →L[ℝ]
      (EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d)) :=
  LinearMap.toContinuousLinearMap
    { toFun := fun a =>
        LinearMap.toContinuousLinearMap
          { toFun := fun v =>
              WithLp.toLp 2 fun i : Fin d => negLogBarrierThird (x i) * a i * v i
            map_add' := by
              intro v w
              ext i
              simp [mul_add]
            map_smul' := by
              intro c v
              ext i
              simp
              ring }
      map_add' := by
        intro a b
        apply ContinuousLinearMap.ext
        intro v
        ext i
        simp
        ring
      map_smul' := by
        intro c a
        apply ContinuousLinearMap.ext
        intro v
        ext i
        simp
        ring }

@[simp] theorem positiveOrthantNegLogHessDerivCLM_apply {d : ℕ}
    (x a v : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantNegLogHessDerivCLM x a v i =
      negLogBarrierThird (x i) * a i * v i := by
  simp [positiveOrthantNegLogHessDerivCLM]

theorem positiveOrthantNegLogHessDerivCLM_mixed_inner {d : ℕ}
    (x a v : EuclideanSpace ℝ (Fin d)) :
    inner ℝ v ((positiveOrthantNegLogHessDerivCLM x a) v) =
      positiveOrthantNegLogThirdMixed x a v := by
  rw [PiLp.inner_apply]
  unfold positiveOrthantNegLogThirdMixed
  refine Finset.sum_congr rfl ?_
  intro i _hi
  simp [RCLike.inner_apply]
  ring

theorem positiveOrthantNegLogHessDerivCLM_eq_diagonal_comp {d : ℕ}
    (x : EuclideanSpace ℝ (Fin d)) :
    positiveOrthantNegLogHessDerivCLM x =
      positiveOrthantDiagonalCLM.comp (positiveOrthantNegLogHessCoeffDerivCLM x) := by
  apply ContinuousLinearMap.ext
  intro a
  apply ContinuousLinearMap.ext
  intro v
  ext i
  simp

theorem positiveOrthantNegLogHessCoeff_hasFDerivAt {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    HasFDerivAt positiveOrthantNegLogHessCoeff
      (positiveOrthantNegLogHessCoeffDerivCLM x) x := by
  have hstrict :
      HasStrictFDerivAt positiveOrthantNegLogHessCoeff
        (positiveOrthantNegLogHessCoeffDerivCLM x) x := by
    rw [hasStrictFDerivAt_euclidean]
    intro i
    have hz :
        HasStrictDerivAt (fun t : ℝ => t ^ (-2 : ℤ))
          (negLogBarrierThird (x i)) (x i) := by
      have hbase := hasStrictDerivAt_zpow (-2 : ℤ) (x i) (Or.inl (hx i).ne')
      convert hbase using 1
      simp [negLogBarrierThird]
    have hcoord :
        HasStrictFDerivAt (fun y : EuclideanSpace ℝ (Fin d) => y i)
          (PiLp.proj 2 (fun _ : Fin d => ℝ) i) x :=
      PiLp.hasStrictFDerivAt_apply
        (𝕜 := ℝ) (p := 2) (E := fun _ : Fin d => ℝ) x i
    have hcomp := hz.hasStrictFDerivAt.comp x hcoord
    have hproj :
        (PiLp.proj 2 (fun _ : Fin d => ℝ) i).comp
            (positiveOrthantNegLogHessCoeffDerivCLM x) =
          (ContinuousLinearMap.toSpanSingleton ℝ (negLogBarrierThird (x i))).comp
            (PiLp.proj 2 (fun _ : Fin d => ℝ) i) := by
      apply ContinuousLinearMap.ext
      intro a
      simp
      ring
    simpa [positiveOrthantNegLogHessCoeff, hproj] using hcomp
  exact hstrict.hasFDerivAt

theorem positiveOrthantNegLogHessCLM_hasFDerivAt {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    HasFDerivAt positiveOrthantNegLogHessCLM
      (positiveOrthantNegLogHessDerivCLM x) x := by
  have hcoeff := positiveOrthantNegLogHessCoeff_hasFDerivAt hx
  have hdiag :
      HasFDerivAt
        (fun y : EuclideanSpace ℝ (Fin d) =>
          positiveOrthantDiagonalCLM (positiveOrthantNegLogHessCoeff y))
        (positiveOrthantDiagonalCLM.comp
          (positiveOrthantNegLogHessCoeffDerivCLM x)) x :=
    by
      have hlin :
          HasFDerivAt
            (fun c : EuclideanSpace ℝ (Fin d) => positiveOrthantDiagonalCLM c)
            positiveOrthantDiagonalCLM (positiveOrthantNegLogHessCoeff x) :=
        by
          simpa using
            (positiveOrthantDiagonalCLM (d := d)).hasFDerivAt
              (x := positiveOrthantNegLogHessCoeff x)
      exact hlin.comp x hcoeff
  have hfun :
      (fun y : EuclideanSpace ℝ (Fin d) =>
          positiveOrthantDiagonalCLM (positiveOrthantNegLogHessCoeff y)) =
        positiveOrthantNegLogHessCLM := by
    funext y
    exact (positiveOrthantNegLogHessCLM_eq_diagonal y).symm
  have hderiv :
      positiveOrthantDiagonalCLM.comp (positiveOrthantNegLogHessCoeffDerivCLM x) =
        positiveOrthantNegLogHessDerivCLM x :=
    (positiveOrthantNegLogHessDerivCLM_eq_diagonal_comp x).symm
  simpa [hfun, hderiv] using hdiag

theorem positiveOrthantNegLogHessCLM_quadratic_eq_sum {d : ℕ}
    (x v : EuclideanSpace ℝ (Fin d)) :
    inner ℝ v (positiveOrthantNegLogHessCLM x v) =
      ∑ i : Fin d, (x i) ^ (-2 : ℤ) * (v i) ^ (2 : ℕ) := by
  rw [PiLp.inner_apply]
  simp [RCLike.inner_apply, positiveOrthantNegLogHessCLM]
  refine Finset.sum_congr rfl ?_
  intro i _hi
  ring_nf

theorem positiveOrthantNegLogHessCLM_quadratic_nonneg {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (v : EuclideanSpace ℝ (Fin d)) :
    0 ≤ inner ℝ v (positiveOrthantNegLogHessCLM x v) := by
  have hfactor :=
    hessianPrimalFactor_of_adjointSqrt
      (hess := positiveOrthantNegLogHessCLM) (x := x)
      (sqrtH := (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap)
      (positiveOrthantNegLogHessCLM_sqrtCoord_model hx) v
  rw [hfactor]
  exact sq_nonneg _

theorem positiveOrthantNegLog_localNorm_sq_eq_sum {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (v : EuclideanSpace ℝ (Fin d)) :
    (localNorm positiveOrthantNegLogHessCLM x v) ^ (2 : ℕ) =
      ∑ i : Fin d, (x i) ^ (-2 : ℤ) * (v i) ^ (2 : ℕ) := by
  rw [localNorm_sq_eq_inner (positiveOrthantNegLogHessCLM_quadratic_nonneg hx v)]
  exact positiveOrthantNegLogHessCLM_quadratic_eq_sum x v

/-- Coordinatewise square vector on finite Euclidean coordinates. -/
noncomputable def positiveOrthantSquareVec {d : ℕ}
    (z : EuclideanSpace ℝ (Fin d)) : EuclideanSpace ℝ (Fin d) :=
  WithLp.toLp 2 fun i : Fin d => (z i) ^ (2 : ℕ)

@[simp] theorem positiveOrthantSquareVec_apply {d : ℕ}
    (z : EuclideanSpace ℝ (Fin d)) (i : Fin d) :
    positiveOrthantSquareVec z i = (z i) ^ (2 : ℕ) := by
  simp [positiveOrthantSquareVec, PiLp.toLp_apply]

theorem positiveOrthantSquareVec_norm_le_norm_sq {d : ℕ}
    (z : EuclideanSpace ℝ (Fin d)) :
    ‖positiveOrthantSquareVec z‖ ≤ ‖z‖ ^ (2 : ℕ) := by
  refine (sq_le_sq₀ (norm_nonneg _) (sq_nonneg _)).mp ?_
  rw [EuclideanSpace.real_norm_sq_eq, EuclideanSpace.real_norm_sq_eq]
  have hsum :
      ∑ i ∈ (Finset.univ : Finset (Fin d)),
          ((z i) ^ (2 : ℕ)) ^ (2 : ℕ) ≤
        (∑ i ∈ (Finset.univ : Finset (Fin d)), (z i) ^ (2 : ℕ)) ^ (2 : ℕ) :=
    Finset.sum_sq_le_sq_sum_of_nonneg
      (s := (Finset.univ : Finset (Fin d)))
      (f := fun i : Fin d => (z i) ^ (2 : ℕ))
      (by
        intro i _hi
        exact sq_nonneg (z i))
  simpa using hsum

set_option maxHeartbeats 1000000 in
theorem positiveOrthantNegLog_localNorm_eq_sqrtCoord_norm {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (v : EuclideanSpace ℝ (Fin d)) :
    localNorm positiveOrthantNegLogHessCLM x v =
      ‖(positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap v‖ := by
  let S : EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
    (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap
  have hmodel :
      positiveOrthantNegLogHessCLM x = (ContinuousLinearMap.adjoint S).comp S := by
    simpa [S] using positiveOrthantNegLogHessCLM_sqrtCoord_model hx
  have hquad :
      inner ℝ v (positiveOrthantNegLogHessCLM x v) = ‖S v‖ ^ (2 : ℕ) := by
    rw [hmodel]
    simpa using (ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_right S v).symm
  change Real.sqrt (inner ℝ v (positiveOrthantNegLogHessCLM x v)) = ‖S v‖
  rw [hquad]
  exact Real.sqrt_sq (norm_nonneg (S v))

theorem positiveOrthantNegLogThirdMixed_eq_neg_two_inner_sqrt_squareVec {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (u v : EuclideanSpace ℝ (Fin d)) :
    positiveOrthantNegLogThirdMixed x u v =
      -2 * inner ℝ
        ((positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap u)
        (positiveOrthantSquareVec
          ((positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap v)) := by
  rw [PiLp.inner_apply, Finset.mul_sum]
  unfold positiveOrthantNegLogThirdMixed negLogBarrierThird
  refine Finset.sum_congr rfl ?_
  intro i _hi
  have hxi : x i ≠ 0 := (hx i).ne'
  simp [RCLike.inner_apply, hx]
  field_simp [hxi]

theorem positiveOrthantNegLog_mixedThird_bound {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d))
    (u v : EuclideanSpace ℝ (Fin d)) :
    |positiveOrthantNegLogThirdMixed x u v| ≤
      2 * (1 : ℝ) * localNorm positiveOrthantNegLogHessCLM x u *
        (localNorm positiveOrthantNegLogHessCLM x v) ^ (2 : ℕ) := by
  let S : EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d) :=
    (positiveOrthantNegLogSqrtCoord x).toContinuousLinearMap
  have hthird :
      positiveOrthantNegLogThirdMixed x u v =
        -2 * inner ℝ (S u) (positiveOrthantSquareVec (S v)) := by
    simpa [S] using
      positiveOrthantNegLogThirdMixed_eq_neg_two_inner_sqrt_squareVec hx u v
  have hinner :
      |inner ℝ (S u) (positiveOrthantSquareVec (S v))| ≤
        ‖S u‖ * ‖positiveOrthantSquareVec (S v)‖ :=
    abs_real_inner_le_norm (S u) (positiveOrthantSquareVec (S v))
  have hsquare :
      ‖positiveOrthantSquareVec (S v)‖ ≤ ‖S v‖ ^ (2 : ℕ) :=
    positiveOrthantSquareVec_norm_le_norm_sq (S v)
  have hlocal_u :
      localNorm positiveOrthantNegLogHessCLM x u = ‖S u‖ := by
    simpa [S] using positiveOrthantNegLog_localNorm_eq_sqrtCoord_norm hx u
  have hlocal_v :
      localNorm positiveOrthantNegLogHessCLM x v = ‖S v‖ := by
    simpa [S] using positiveOrthantNegLog_localNorm_eq_sqrtCoord_norm hx v
  calc
    |positiveOrthantNegLogThirdMixed x u v| =
        2 * |inner ℝ (S u) (positiveOrthantSquareVec (S v))| := by
      rw [hthird]
      simp [abs_mul]
    _ ≤ 2 * (‖S u‖ * ‖positiveOrthantSquareVec (S v)‖) := by
      exact mul_le_mul_of_nonneg_left hinner (by norm_num)
    _ ≤ 2 * (‖S u‖ * ‖S v‖ ^ (2 : ℕ)) := by
      exact mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left hsquare (norm_nonneg _)) (by norm_num)
    _ = 2 * (1 : ℝ) * localNorm positiveOrthantNegLogHessCLM x u *
        (localNorm positiveOrthantNegLogHessCLM x v) ^ (2 : ℕ) := by
      rw [hlocal_u, hlocal_v]
      ring

/--
Constructor for the finite positive-orthant product self-concordance
certificate.  The remaining source work is exactly the finite weighted Cauchy
mixed-third estimate in `hbound`; positivity of the barrier parameter and
Hessian quadratic form are discharged here.
-/
theorem positiveOrthantNegLog_mixedThirdSelfConcordantOn_of_bound {d : ℕ}
    (hbound : ∀ ⦃x : EuclideanSpace ℝ (Fin d)⦄,
      x ∈ positiveOrthant (d := d) -> ∀ u v : EuclideanSpace ℝ (Fin d),
        |positiveOrthantNegLogThirdMixed x u v| ≤
          2 * (1 : ℝ) * localNorm positiveOrthantNegLogHessCLM x u *
            (localNorm positiveOrthantNegLogHessCLM x v) ^ (2 : ℕ)) :
    MixedThirdSelfConcordantOn (positiveOrthant (d := d))
      positiveOrthantNegLogHessCLM positiveOrthantNegLogThirdMixed 1 where
  parameter_pos := by norm_num
  hess_nonneg := by
    intro x hx v
    exact positiveOrthantNegLogHessCLM_quadratic_nonneg hx v
  mixed_third_bound := by
    intro x hx u v
    exact hbound hx u v

theorem positiveOrthantNegLog_mixedThirdSelfConcordantOn {d : ℕ} :
    MixedThirdSelfConcordantOn (positiveOrthant (d := d))
  positiveOrthantNegLogHessCLM positiveOrthantNegLogThirdMixed 1 :=
  positiveOrthantNegLog_mixedThirdSelfConcordantOn_of_bound
    (fun _ hx u v => positiveOrthantNegLog_mixedThird_bound hx u v)

theorem convex_positiveOrthant {d : ℕ} : Convex ℝ (positiveOrthant (d := d)) := by
  rw [positiveOrthant]
  intro x hx y hy a b ha hb hab i
  simp
  let m : ℝ := min (x i) (y i)
  have hm_pos : 0 < m := lt_min (hx i) (hy i)
  have hax : a * m ≤ a * x i := mul_le_mul_of_nonneg_left (min_le_left _ _) ha
  have hby : b * m ≤ b * y i := mul_le_mul_of_nonneg_left (min_le_right _ _) hb
  have hm_weight : 0 < (a + b) * m := by
    rw [hab]
    simpa using hm_pos
  nlinarith

/--
Chewi Theorem 13.8 specialized to the finite positive-orthant logarithmic
barrier Hessian/inverse-Hessian model.  The remaining assumptions are the
source Newton-segment differentiability and self-concordance hypotheses; the
diagonal square-root model, Hessian symmetry/positivity, and inverse-Hessian
right-inverse are discharged by the compiled positive-orthant model.
-/
theorem chewi138_positiveOrthant_newtonDecrement_step_le_of_sourceNewtonSegment
    {d : ℕ}
    {hessDeriv : EuclideanSpace ℝ (Fin d) ->
      EuclideanSpace ℝ (Fin d) →L[ℝ]
        (EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d))}
    {thirdMixed : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d) ->
      EuclideanSpace ℝ (Fin d) -> ℝ}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : EuclideanSpace ℝ (Fin d)} {M : ℝ}
    (hMlambda_lt : M * newtonDecrement grad positiveOrthantNegLogInvHessCLM x < 1)
    (hx : x ∈ positiveOrthant (d := d))
    (hstep_mem :
      newtonStep grad positiveOrthantNegLogInvHessCLM x ∈ positiveOrthant (d := d))
    (hsc : MixedThirdSelfConcordantOn (positiveOrthant (d := d))
      positiveOrthantNegLogHessCLM thirdMixed M)
    (hhess_cont : ContinuousOn positiveOrthantNegLogHessCLM (positiveOrthant (d := d)))
    (hhess : ∀ z, z ∈ positiveOrthant (d := d) ->
      HasFDerivAt positiveOrthantNegLogHessCLM (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ positiveOrthant (d := d) ->
      ∀ a v : EuclideanSpace ℝ (Fin d),
        inner ℝ v ((hessDeriv z a) v) = thirdMixed z a v)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (positiveOrthantNegLogHessCLM
          (hessianSegmentPoint x
            (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
        (hessianSegmentPoint x
          (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
    (hnewton_linear :
      grad x + positiveOrthantNegLogHessCLM x
        (newtonStep grad positiveOrthantNegLogInvHessCLM x - x) = 0) :
    newtonDecrement grad positiveOrthantNegLogInvHessCLM
        (newtonStep grad positiveOrthantNegLogInvHessCLM x) ≤
      M * (newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) /
        (1 - M * newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) := by
  exact
    chewi138_newtonDecrement_step_le_of_sqrtCoordFamilyModel_of_sourceNewtonSegment
      (hess := positiveOrthantNegLogHessCLM) (hessDeriv := hessDeriv)
      (thirdMixed := thirdMixed) (grad := grad)
      (invHess := positiveOrthantNegLogInvHessCLM)
      (sqrtCoord := positiveOrthantNegLogSqrtCoord)
      (s := positiveOrthant (d := d)) (x := x) (M := M)
      hMlambda_lt convex_positiveOrthant hx hstep_mem hsc hhess_cont hhess hmixed
      hgrad hnewton_linear
      positiveOrthantNegLogHessCLM_sqrtCoord_model_positiveOrthant
      positiveOrthantNegLogInvHessCLM_sqrtCoord_model_positiveOrthant

/--
Chewi Theorem 13.8 specialized to the finite positive-orthant logarithmic
barrier, with the concrete product self-concordance certificate supplied.
The remaining source hypotheses are the Hessian/gradient differentiability
and Newton-linearization facts along the source Newton segment.
-/
theorem chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment
    {d : ℕ}
    {hessDeriv : EuclideanSpace ℝ (Fin d) ->
      EuclideanSpace ℝ (Fin d) →L[ℝ]
        (EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d))}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : EuclideanSpace ℝ (Fin d)}
    (hlambda_lt : newtonDecrement grad positiveOrthantNegLogInvHessCLM x < 1)
    (hx : x ∈ positiveOrthant (d := d))
    (hstep_mem :
      newtonStep grad positiveOrthantNegLogInvHessCLM x ∈ positiveOrthant (d := d))
    (hhess_cont : ContinuousOn positiveOrthantNegLogHessCLM (positiveOrthant (d := d)))
    (hhess : ∀ z, z ∈ positiveOrthant (d := d) ->
      HasFDerivAt positiveOrthantNegLogHessCLM (hessDeriv z) z)
    (hmixed : ∀ z, z ∈ positiveOrthant (d := d) ->
      ∀ a v : EuclideanSpace ℝ (Fin d),
        inner ℝ v ((hessDeriv z a) v) =
          positiveOrthantNegLogThirdMixed z a v)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (positiveOrthantNegLogHessCLM
          (hessianSegmentPoint x
            (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
        (hessianSegmentPoint x
          (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
    (hnewton_linear :
      grad x + positiveOrthantNegLogHessCLM x
        (newtonStep grad positiveOrthantNegLogInvHessCLM x - x) = 0) :
    newtonDecrement grad positiveOrthantNegLogInvHessCLM
        (newtonStep grad positiveOrthantNegLogInvHessCLM x) ≤
      (newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) /
        (1 - newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) := by
  have hMlambda_lt :
      (1 : ℝ) * newtonDecrement grad positiveOrthantNegLogInvHessCLM x < 1 := by
    simpa using hlambda_lt
  have hbase :=
    chewi138_positiveOrthant_newtonDecrement_step_le_of_sourceNewtonSegment
      (hessDeriv := hessDeriv)
      (thirdMixed := positiveOrthantNegLogThirdMixed)
      (grad := grad) (x := x) (M := (1 : ℝ))
      hMlambda_lt hx hstep_mem
      positiveOrthantNegLog_mixedThirdSelfConcordantOn
      hhess_cont hhess hmixed hgrad hnewton_linear
  simpa using hbase

/--
Chewi Theorem 13.8 specialized further with the concrete Hessian-derivative
oracle for the positive-orthant logarithmic barrier.  This packages the
mixed-third identity, leaving Hessian/gradient differentiability and
Newton-linearization as the source hypotheses.
-/
theorem chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_sourceNewtonSegment
    {d : ℕ}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : EuclideanSpace ℝ (Fin d)}
    (hlambda_lt : newtonDecrement grad positiveOrthantNegLogInvHessCLM x < 1)
    (hx : x ∈ positiveOrthant (d := d))
    (hstep_mem :
      newtonStep grad positiveOrthantNegLogInvHessCLM x ∈ positiveOrthant (d := d))
    (hhess_cont : ContinuousOn positiveOrthantNegLogHessCLM (positiveOrthant (d := d)))
    (hhess : ∀ z, z ∈ positiveOrthant (d := d) ->
      HasFDerivAt positiveOrthantNegLogHessCLM
        (positiveOrthantNegLogHessDerivCLM z) z)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (positiveOrthantNegLogHessCLM
          (hessianSegmentPoint x
            (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
        (hessianSegmentPoint x
          (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
    (hnewton_linear :
      grad x + positiveOrthantNegLogHessCLM x
        (newtonStep grad positiveOrthantNegLogInvHessCLM x - x) = 0) :
    newtonDecrement grad positiveOrthantNegLogInvHessCLM
        (newtonStep grad positiveOrthantNegLogInvHessCLM x) ≤
      (newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) /
        (1 - newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) :=
  chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment
    (hessDeriv := positiveOrthantNegLogHessDerivCLM)
    hlambda_lt hx hstep_mem hhess_cont hhess
    (by
      intro z _hz a v
      exact positiveOrthantNegLogHessDerivCLM_mixed_inner z a v)
    hgrad hnewton_linear

/--
Same concrete positive-orthant Theorem 13.8 wrapper, deriving Hessian
continuity from the supplied pointwise Hessian differentiability.
-/
theorem chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_hasFDeriv_sourceNewtonSegment
    {d : ℕ}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : EuclideanSpace ℝ (Fin d)}
    (hlambda_lt : newtonDecrement grad positiveOrthantNegLogInvHessCLM x < 1)
    (hx : x ∈ positiveOrthant (d := d))
    (hstep_mem :
      newtonStep grad positiveOrthantNegLogInvHessCLM x ∈ positiveOrthant (d := d))
    (hhess : ∀ z, z ∈ positiveOrthant (d := d) ->
      HasFDerivAt positiveOrthantNegLogHessCLM
        (positiveOrthantNegLogHessDerivCLM z) z)
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (positiveOrthantNegLogHessCLM
          (hessianSegmentPoint x
            (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
        (hessianSegmentPoint x
          (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
    (hnewton_linear :
      grad x + positiveOrthantNegLogHessCLM x
        (newtonStep grad positiveOrthantNegLogInvHessCLM x - x) = 0) :
    newtonDecrement grad positiveOrthantNegLogInvHessCLM
        (newtonStep grad positiveOrthantNegLogInvHessCLM x) ≤
      (newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) /
        (1 - newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) :=
  chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_sourceNewtonSegment
    hlambda_lt hx hstep_mem
    (continuousOn_of_forall_continuousAt
      (fun z hz => (hhess z hz).continuousAt))
    hhess hgrad hnewton_linear

/--
Concrete positive-orthant logarithmic-barrier Theorem 13.8 wrapper with the
Hessian differentiability proof discharged from the diagonal coefficient
calculus.  The remaining hypotheses are gradient differentiability along the
Newton segment and the Newton linearization identity.
-/
theorem chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_sourceNewtonSegment_finalHessian
    {d : ℕ}
    {grad : EuclideanSpace ℝ (Fin d) -> EuclideanSpace ℝ (Fin d)}
    {x : EuclideanSpace ℝ (Fin d)}
    (hlambda_lt : newtonDecrement grad positiveOrthantNegLogInvHessCLM x < 1)
    (hx : x ∈ positiveOrthant (d := d))
    (hstep_mem :
      newtonStep grad positiveOrthantNegLogInvHessCLM x ∈ positiveOrthant (d := d))
    (hgrad : ∀ t, t ∈ Set.uIcc (0 : ℝ) 1 ->
      HasFDerivAt grad
        (positiveOrthantNegLogHessCLM
          (hessianSegmentPoint x
            (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
        (hessianSegmentPoint x
          (newtonStep grad positiveOrthantNegLogInvHessCLM x) t))
    (hnewton_linear :
      grad x + positiveOrthantNegLogHessCLM x
        (newtonStep grad positiveOrthantNegLogInvHessCLM x - x) = 0) :
    newtonDecrement grad positiveOrthantNegLogInvHessCLM
        (newtonStep grad positiveOrthantNegLogInvHessCLM x) ≤
      (newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) /
        (1 - newtonDecrement grad positiveOrthantNegLogInvHessCLM x) ^ (2 : ℕ) :=
    chewi138_positiveOrthant_newtonDecrement_step_le_of_logBarrier_hessDeriv_hasFDeriv_sourceNewtonSegment
    hlambda_lt hx hstep_mem
    (fun _ hz => positiveOrthantNegLogHessCLM_hasFDerivAt hz)
    hgrad hnewton_linear

/--
Finite-product version of Chewi Example 13.10: the coordinatewise logarithmic
barrier on the positive orthant has exact dual local norm `sqrt d`, i.e. barrier
parameter `d`.
-/
theorem positiveOrthantNegLog_dualLocalNorm_grad_eq_sqrt_card {d : ℕ}
    {x : EuclideanSpace ℝ (Fin d)} (hx : x ∈ positiveOrthant (d := d)) :
    dualLocalNorm positiveOrthantNegLogInvHessCLM x (positiveOrthantNegLogGrad x) =
      Real.sqrt (d : ℝ) := by
  have hquad :
      inner ℝ (positiveOrthantNegLogGrad x)
          (positiveOrthantNegLogInvHessCLM x (positiveOrthantNegLogGrad x)) =
        (d : ℝ) := by
    rw [PiLp.inner_apply]
    simp only [RCLike.inner_apply, positiveOrthantNegLogGrad_apply,
      positiveOrthantNegLogInvHessCLM_apply]
    trans ∑ i : Fin d, (1 : ℝ)
    · refine Finset.sum_congr rfl ?_
      intro i _hi
      rw [negLogBarrier_deriv]
      have hxi : x i ≠ 0 := (hx i).ne'
      simp
      field_simp [hxi]
    · simp
  dsimp [dualLocalNorm]
  rw [hquad]

theorem negLogBarrier_second_deriv (x : ℝ) :
    deriv^[2] negLogBarrier x = negLogBarrierSecond x := by
  change deriv (deriv negLogBarrier) x = negLogBarrierSecond x
  have hderiv_fun : deriv negLogBarrier = fun x : ℝ => -x⁻¹ := by
    funext y
    exact negLogBarrier_deriv y
  rw [hderiv_fun]
  rw [deriv.fun_neg, deriv_inv]
  simpa [negLogBarrierSecond] using inv_sq_eq_zpow_neg_two x

theorem negLogBarrier_third_deriv (x : ℝ) :
    deriv^[3] negLogBarrier x = negLogBarrierThird x := by
  change deriv (deriv (deriv negLogBarrier)) x = negLogBarrierThird x
  have hsecond_fun :
      deriv (deriv negLogBarrier) = fun x : ℝ => negLogBarrierSecond x := by
    funext y
    exact negLogBarrier_second_deriv y
  rw [hsecond_fun]
  simp only [negLogBarrierSecond]
  rw [deriv_zpow]
  simp [negLogBarrierThird]

theorem negLogBarrier_localNorm_eq_abs_div
    {x v : ℝ} (hx : 0 < x) :
    oneDimLocalNorm negLogBarrierSecond x v = |v| / x := by
  have hx_ne : x ≠ 0 := hx.ne'
  have hrad_nonneg :
      0 ≤ negLogBarrierSecond x * v ^ (2 : ℕ) := by
    simp [negLogBarrierSecond]
    positivity
  have hright_nonneg : 0 ≤ |v| / x :=
    div_nonneg (abs_nonneg v) hx.le
  refine (sq_eq_sq₀ (Real.sqrt_nonneg _) hright_nonneg).mp ?_
  change (Real.sqrt (negLogBarrierSecond x * v ^ (2 : ℕ))) ^ (2 : ℕ) =
    (|v| / x) ^ (2 : ℕ)
  rw [Real.sq_sqrt hrad_nonneg]
  dsimp [negLogBarrierSecond]
  rw [← sq_abs v]
  field_simp [hx_ne]

/--
Chewi Example 13.4, scalar inequality form:
`|-2 x^{-3} v^3| <= 2 (sqrt(x^{-2} v^2))^3`.
-/
theorem negLogBarrier_selfConcordance_ineq
    {x v : ℝ} (hx : 0 < x) :
    |negLogBarrierThird x * v ^ (3 : ℕ)| ≤
      2 * (oneDimLocalNorm negLogBarrierSecond x v) ^ (3 : ℕ) := by
  have hsqrt :
      oneDimLocalNorm negLogBarrierSecond x v = |v| / x :=
    negLogBarrier_localNorm_eq_abs_div hx
  rw [hsqrt]
  dsimp [negLogBarrierThird]
  have hx_ne : x ≠ 0 := hx.ne'
  have hxzpos : 0 < x ^ (-3 : ℤ) := zpow_pos hx _
  have hcoeff : |-2 * x ^ (-3 : ℤ)| = 2 * x ^ (-3 : ℤ) := by
    rw [abs_of_neg]
    · ring
    · nlinarith
  rw [abs_mul, hcoeff, abs_pow]
  field_simp [hx_ne]
  exact le_rfl

/--
Chewi Example 13.4: the logarithmic barrier `x ↦ -log x` is
self-concordant with parameter `1` on the positive half-line.
-/
theorem negLogBarrier_oneDimSelfConcordantOn_Ioi :
    OneDimSelfConcordantOn (Set.Ioi 0)
      negLogBarrierSecond negLogBarrierThird 1 where
  parameter_pos := by norm_num
  second_nonneg := by
    intro x hx
    simp [negLogBarrierSecond]
    positivity
  inequality := by
    intro x hx v
    have hineq :=
      negLogBarrier_selfConcordance_ineq (x := x) (v := v) hx
    simpa [oneDimLocalNorm] using hineq

end Optimization
end StatInference
