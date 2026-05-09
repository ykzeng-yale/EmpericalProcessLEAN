import StatInference.Optimization.Basic
import Mathlib.Analysis.Calculus.FDeriv.CompCLM
import Mathlib.Analysis.Calculus.Deriv.ZPow
import Mathlib.Analysis.InnerProductSpace.Calculus
import Mathlib.Analysis.ODE.Gronwall
import Mathlib.Analysis.SpecialFunctions.Log.Deriv
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-!
# Chewi Chapter 13 interior-point methods

This module develops the finite-dimensional interior-point/self-concordance
lane: Chewi Example 13.4 for the logarithmic barrier, the supplied-Hessian
local-norm/Newton substrate, and the Lemma 13.6 Hessian-stability spine.
-/

namespace StatInference
namespace Optimization

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

theorem dualLocalNorm_zero (invHess : E -> E →L[ℝ] E) (x : E) :
    dualLocalNorm invHess x 0 = 0 := by
  simp [dualLocalNorm]

theorem newtonStep_sub
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) :
    newtonStep grad invHess x - x = -invHess x (grad x) := by
  simp [newtonStep]

theorem sub_newtonStep
    (grad : E -> E) (invHess : E -> E →L[ℝ] E) (x : E) :
    x - newtonStep grad invHess x = invHess x (grad x) := by
  simp [newtonStep]

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

/-- Chewi Example 13.4's logarithmic barrier on the positive half-line. -/
noncomputable def negLogBarrier (x : ℝ) : ℝ :=
  - Real.log x

/-- The displayed second derivative of `negLogBarrier`: `x^{-2}`. -/
noncomputable def negLogBarrierSecond (x : ℝ) : ℝ :=
  x ^ (-2 : ℤ)

/-- The displayed third derivative of `negLogBarrier`: `-2 x^{-3}`. -/
noncomputable def negLogBarrierThird (x : ℝ) : ℝ :=
  -2 * x ^ (-3 : ℤ)

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
