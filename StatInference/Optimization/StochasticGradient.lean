import StatInference.Optimization.MirrorDescent

/-!
# Chewi Chapter 12 stochastic gradient methods

This module opens the Chapter 12 lane.  The first packet proves the scalar
weighted-average consequence used at the end of Chewi Theorem 12.1 for SMPGD:
a Gronwall recurrence with a negative gap forcing and an additive stochastic
error gives the displayed weighted average bound.
-/

namespace StatInference
namespace Optimization

open Finset
open scoped InnerProductSpace

/--
Weighted-sum consequence of a discrete Gronwall recurrence with an additive
stochastic error term.

This is the scalar spine behind the final averaging step in Chewi Theorem 12.1.
-/
theorem weightedSumBound_of_gronwall_negative_forcing_with_error
    {A rho err : ℝ} (hA : 0 ≤ A) (u gap : ℕ -> ℝ) (N : ℕ)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1) + err) :
    rho *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      A ^ N * u 0 +
        err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
  let B : ℕ -> ℝ := fun n => -rho * gap (n + 1) + err
  have hrec' : ∀ n, n < N -> u (n + 1) ≤ A * u n + B n := by
    intro n hn
    simpa [B, sub_eq_add_neg, add_assoc] using hrec n hn
  have hgr :=
    discreteGronwall_sum_le hA u B N hrec'
  have hrhs_nonneg :
      0 ≤ A ^ N * u 0 +
        ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n :=
    huN_nonneg.trans hgr
  have hsum :
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n) =
        -rho *
          (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) +
            err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
    calc
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * B n)
          =
            ∑ n ∈ Finset.range N,
              ((-rho) * (A ^ (N - 1 - n) * gap (n + 1)) +
                err * A ^ (N - 1 - n)) := by
              refine Finset.sum_congr rfl ?_
              intro n hn
              simp [B]
              ring
      _ =
            (-rho) *
              (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) +
                err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
              rw [Finset.sum_add_distrib, Finset.mul_sum, Finset.mul_sum]
  have hnonneg :
      0 ≤ A ^ N * u 0 -
          rho *
            (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) +
          err * (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) := by
    simpa [hsum, sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hrhs_nonneg
  nlinarith

/--
Weighted-average version of
`weightedSumBound_of_gronwall_negative_forcing_with_error`.
-/
theorem weightedAverageGap_le_of_gronwall_negative_forcing_with_error
    {A rho err : ℝ} (hA : 0 ≤ A) (hrho : 0 < rho)
    (u gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (huN_nonneg : 0 ≤ u N)
    (hrec : ∀ n, n < N ->
      u (n + 1) ≤ A * u n - rho * gap (n + 1) + err) :
    (1 / (∑ n ∈ Finset.range N, A ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      (A ^ N * u 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) +
        err / rho := by
  let weights : ℝ := ∑ n ∈ Finset.range N, A ^ (N - 1 - n)
  let weightedGap : ℝ :=
    ∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)
  have hweights_pos : 0 < weights := by
    simpa [weights] using geometricWeights_sum_pos (A := A) hA hN
  have hden_pos : 0 < rho * weights := mul_pos hrho hweights_pos
  have hsum :=
    weightedSumBound_of_gronwall_negative_forcing_with_error
      (A := A) (rho := rho) (err := err) hA u gap N huN_nonneg hrec
  have hsum' : rho * weightedGap ≤ A ^ N * u 0 + err * weights := by
    simpa [weights, weightedGap] using hsum
  calc
    (1 / weights) * weightedGap
        = (rho * weightedGap) / (rho * weights) := by
            field_simp [hrho.ne', hweights_pos.ne']
    _ ≤ (A ^ N * u 0 + err * weights) / (rho * weights) := by
            exact div_le_div_of_nonneg_right hsum' hden_pos.le
    _ = (A ^ N * u 0) / (rho * weights) + err / rho := by
            field_simp [hrho.ne', hweights_pos.ne']

/--
Chewi Theorem 12.1 scalar SMPGD averaging step.  Once the stochastic one-step
estimate has been proved in the normalized form
`u_{n+1} <= A u_n - rho * gap_{n+1} + err`, the suitably weighted average of
the expected gaps is bounded by the initial Bregman term plus the stochastic
error floor.
-/
theorem chewi121_weightedAverageGap_le_of_oneStep
    {A rho err : ℝ} (hA : 0 ≤ A) (hrho : 0 < rho)
    (D gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hone_step : ∀ n, n < N ->
      D (n + 1) ≤ A * D n - rho * gap (n + 1) + err) :
    (1 / (∑ n ∈ Finset.range N, A ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N, A ^ (N - 1 - n) * gap (n + 1)) ≤
      (A ^ N * D 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) +
        err / rho :=
  weightedAverageGap_le_of_gronwall_negative_forcing_with_error
    (A := A) (rho := rho) (err := err) hA hrho D gap hN hD_N_nonneg hone_step

/--
Chewi Theorem 12.1 normalized source one-step wrapper.  The displayed SMPGD
one-step estimate has a prefactor `1 + alphaG * h` on the next Bregman term;
dividing by this prefactor feeds the scalar weighted-average theorem.
-/
theorem chewi121_weightedAverageGap_le_of_source_oneStep
    {alphaF alphaG h err : ℝ}
    (hh : 0 < h) (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_nonneg : 0 ≤ chewi109Lambda alphaF alphaG h)
    (D gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hone_step : ∀ n, n < N ->
      (1 + alphaG * h) * D (n + 1) ≤
        (1 - alphaF * h) * D n - h * gap (n + 1) + err) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      ((chewi109Lambda alphaF alphaG h) ^ N * D 0) /
          (chewi109Rho alphaG h *
            ∑ n ∈ Finset.range N,
              (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n)) +
        err / h := by
  let A : ℝ := chewi109Lambda alphaF alphaG h
  let rho : ℝ := chewi109Rho alphaG h
  have hrho_pos : 0 < rho := by
    dsimp [rho, chewi109Rho]
    exact div_pos hh hden_pos
  have hrec : ∀ n, n < N ->
      D (n + 1) ≤ A * D n - rho * gap (n + 1) + err / (1 + alphaG * h) := by
    intro n hn
    have hstep := hone_step n hn
    have hdiv :
        D (n + 1) ≤
          ((1 - alphaF * h) * D n - h * gap (n + 1) + err) /
            (1 + alphaG * h) := by
      have hstep' :
          D (n + 1) * (1 + alphaG * h) ≤
            (1 - alphaF * h) * D n - h * gap (n + 1) + err := by
        simpa [mul_comm, mul_left_comm, mul_assoc] using hstep
      exact (le_div_iff₀ hden_pos).2 hstep'
    calc
      D (n + 1) ≤
          ((1 - alphaF * h) * D n - h * gap (n + 1) + err) /
            (1 + alphaG * h) := hdiv
      _ = A * D n - rho * gap (n + 1) + err / (1 + alphaG * h) := by
          dsimp [A, rho, chewi109Lambda, chewi109Rho]
          field_simp [hden_pos.ne']
  have hmain :=
    chewi121_weightedAverageGap_le_of_oneStep
      (A := A) (rho := rho) (err := err / (1 + alphaG * h))
      (by simpa [A] using hlambda_nonneg) hrho_pos D gap hN hD_N_nonneg hrec
  have herr :
      (err / (1 + alphaG * h)) / rho = err / h := by
    dsimp [rho, chewi109Rho]
    field_simp [hh.ne', hden_pos.ne']
  simpa [A, rho, herr] using hmain

/--
Chewi Theorem 12.1 one-step algebra from the three expected model bounds in
the proof: relative growth of `psi_x`, the upper bound on `E psi_x(y)`, and
the lower bound on `E psi_x(x+)` up to a stochastic error floor.
-/
theorem chewi121_source_oneStep_of_model_bounds
    {alphaF alphaG h Dcur Dnext Fstar gap psiNext psiStar modelError : ℝ}
    (hh : 0 < h)
    (hgrowth : (alphaG + 1 / h) * Dnext + psiNext ≤ psiStar)
    (hstar_upper : psiStar ≤ Fstar + ((1 - alphaF * h) / h) * Dcur)
    (hnext_lower : Fstar + gap - modelError ≤ psiNext) :
    (1 + alphaG * h) * Dnext ≤
      (1 - alphaF * h) * Dcur - h * gap + h * modelError := by
  have hmodel :
      (alphaG + 1 / h) * Dnext + (Fstar + gap - modelError) ≤
        Fstar + ((1 - alphaF * h) / h) * Dcur := by
    calc
      (alphaG + 1 / h) * Dnext + (Fstar + gap - modelError)
          ≤ (alphaG + 1 / h) * Dnext + psiNext := by
              nlinarith
      _ ≤ psiStar := hgrowth
      _ ≤ Fstar + ((1 - alphaF * h) / h) * Dcur := hstar_upper
  have hmul :
      (1 + alphaG * h) * Dnext + h * Fstar + h * gap - h * modelError ≤
        h * Fstar + (1 - alphaF * h) * Dcur := by
    have hleft :
        h * ((alphaG + 1 / h) * Dnext + (Fstar + gap - modelError)) =
          (1 + alphaG * h) * Dnext + h * Fstar + h * gap -
            h * modelError := by
      field_simp [hh.ne']
      ring
    have hright :
        h * (Fstar + ((1 - alphaF * h) / h) * Dcur) =
          h * Fstar + (1 - alphaF * h) * Dcur := by
      field_simp [hh.ne']
    calc
      (1 + alphaG * h) * Dnext + h * Fstar + h * gap - h * modelError
          = h * ((alphaG + 1 / h) * Dnext + (Fstar + gap - modelError)) :=
              hleft.symm
      _ ≤ h * (Fstar + ((1 - alphaF * h) / h) * Dcur) :=
              mul_le_mul_of_nonneg_left hmodel hh.le
      _ = h * Fstar + (1 - alphaF * h) * Dcur := hright
  nlinarith

/--
Chewi Theorem 12.1 weighted-average bound in the closed geometric-denominator
form, from the displayed source one-step recurrence.
-/
theorem chewi121_weightedAverageGap_le_geometric_of_source_oneStep
    {alphaF alphaG h err : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hone_step : ∀ n, n < N ->
      (1 + alphaG * h) * D (n + 1) ≤
        (1 - alphaF * h) * D n - h * gap (n + 1) + err) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        err / h := by
  let A : ℝ := chewi109Lambda alphaF alphaG h
  let rho : ℝ := chewi109Rho alphaG h
  have hrho_pos : 0 < rho := by
    dsimp [rho, chewi109Rho]
    exact div_pos hh hden_pos
  have hA_eq : A = 1 - (alphaF + alphaG) * rho := by
    have hden_ne_comm : 1 + h * alphaG ≠ 0 := by
      nlinarith [hden_pos]
    dsimp [A, rho, chewi109Lambda, chewi109Rho]
    field_simp [hden_pos.ne', hden_ne_comm]
    ring
  have hA_lt_one : A < 1 := by
    rw [hA_eq]
    have hmul_pos : 0 < (alphaF + alphaG) * rho := mul_pos htotal_pos hrho_pos
    nlinarith
  have hA_ne_one : A ≠ 1 := ne_of_lt hA_lt_one
  have hA_pow_pos : 0 < A ^ N := pow_pos (by simpa [A] using hlambda_pos) N
  have hA_pow_ne : A ^ N ≠ 0 := hA_pow_pos.ne'
  have hA_pow_lt_one : A ^ N < 1 :=
    pow_lt_one₀ (by positivity) hA_lt_one hN
  have hone_sub_pow_ne : 1 - A ^ N ≠ 0 := by
    nlinarith
  have hfinite :=
    chewi121_weightedAverageGap_le_of_source_oneStep
      (alphaF := alphaF) (alphaG := alphaG) (h := h) (err := err)
      hh hden_pos hlambda_pos.le D gap hN hD_N_nonneg hone_step
  have hsum :
      (∑ n ∈ Finset.range N, A ^ (N - 1 - n)) =
        (1 - A ^ N) / (1 - A) :=
    geometricWeights_sum_eq_div hA_ne_one N
  have hone_sub_A : 1 - A = (alphaF + alphaG) * rho := by
    rw [hA_eq]
    ring
  have hfirst :
      (A ^ N * D 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) =
        (alphaF + alphaG) / ((A ^ N)⁻¹ - 1) * D 0 := by
    rw [hsum, hone_sub_A]
    field_simp [htotal_pos.ne', hrho_pos.ne', hA_pow_ne, hone_sub_pow_ne]
  have hrhs :
      (A ^ N * D 0) /
          (rho * ∑ n ∈ Finset.range N, A ^ (N - 1 - n)) + err / h =
        (alphaF + alphaG) / ((A ^ N)⁻¹ - 1) * D 0 + err / h := by
    rw [hfirst]
  simpa [A, rho] using hfinite.trans_eq hrhs

/--
Chewi Theorem 12.1 source-rate theorem from expected model bounds.  This
packages the proof skeleton before the smooth/non-smooth stochastic estimates
discharge `modelError`.
-/
theorem chewi121_weightedAverageGap_le_geometric_of_model_bounds
    {alphaF alphaG h modelError Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hnext_lower : ∀ n, n < N ->
      Fstar + gap (n + 1) - modelError ≤ psiNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        modelError := by
  have hone_step : ∀ n, n < N ->
      (1 + alphaG * h) * D (n + 1) ≤
        (1 - alphaF * h) * D n - h * gap (n + 1) + h * modelError := by
    intro n hn
    exact
      chewi121_source_oneStep_of_model_bounds
        (alphaF := alphaF) (alphaG := alphaG) (h := h)
        (Dcur := D n) (Dnext := D (n + 1)) (Fstar := Fstar)
        (gap := gap (n + 1)) (psiNext := psiNext n)
        (psiStar := psiStar n) (modelError := modelError)
        hh (hgrowth n hn) (hstar_upper n hn) (hnext_lower n hn)
  have hmain :=
    chewi121_weightedAverageGap_le_geometric_of_source_oneStep
      (alphaF := alphaF) (alphaG := alphaG) (h := h)
      (err := h * modelError)
      htotal_pos hh hden_pos hlambda_pos D gap hN hD_N_nonneg hone_step
  have herr : h * modelError / h = modelError := by
    field_simp [hh.ne']
  simpa [herr] using hmain

/--
Smooth-case bridge from the stochastic lower model for `E psi_x(x+)` to the
exact `F_* + gap - error <= E psi_x(x+)` field consumed by the model-bound
recurrence.
-/
theorem chewi121_smooth_next_lower_of_expected_model_error
    {Fstar gap expectedNext psiNext sigma dim alphaPhi h : ℝ}
    (hmodel_lower :
      expectedNext - sigma ^ (2 : ℕ) * dim * h / alphaPhi ≤ psiNext)
    (hgap_sum : Fstar + gap = expectedNext) :
    Fstar + gap - sigma ^ (2 : ℕ) * dim * h / alphaPhi ≤ psiNext := by
  simpa [hgap_sum] using hmodel_lower

/--
Non-smooth-case bridge from the stochastic lower model for `E psi_x(x+)` to
the exact `F_* + gap - error <= E psi_x(x+)` field consumed by the model-bound
recurrence.
-/
theorem chewi121_nonsmooth_next_lower_of_expected_model_error
    {Fstar gap expectedNext psiNext L alphaPhi h : ℝ}
    (hmodel_lower :
      expectedNext - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤ psiNext)
    (hgap_sum : Fstar + gap = expectedNext) :
    Fstar + gap - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤ psiNext := by
  simpa [hgap_sum] using hmodel_lower

/--
Smooth-case completing-square estimate in Chewi Theorem 12.1:
the mirror strong-convexity quadratic with coefficient `alphaPhi/(4h)`
absorbs the Cauchy-Schwarz/RMS noise term at cost `varianceRms^2 h /
alphaPhi`.
-/
theorem chewi121_smooth_young_lower_bound
    {alphaPhi h varianceRms stepRms : ℝ}
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi) :
    -(varianceRms ^ (2 : ℕ) * h / alphaPhi) ≤
      (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
        varianceRms * stepRms := by
  have hden : 0 < 4 * h * alphaPhi := by positivity
  have hsquare : 0 ≤
      (alphaPhi * stepRms - 2 * varianceRms * h) ^ (2 : ℕ) :=
    sq_nonneg _
  have hnonneg :
      0 ≤
        (alphaPhi * stepRms - 2 * varianceRms * h) ^ (2 : ℕ) /
          (4 * h * alphaPhi) :=
    div_nonneg hsquare hden.le
  have hidentity :
      (alphaPhi * stepRms - 2 * varianceRms * h) ^ (2 : ℕ) /
          (4 * h * alphaPhi) =
        (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
          varianceRms * stepRms +
            varianceRms ^ (2 : ℕ) * h / alphaPhi := by
    field_simp [hh.ne', halphaPhi.ne']
    ring
  rw [hidentity] at hnonneg
  nlinarith

/--
Smooth expected-model lower estimate from Chewi's RMS proof state.  The
probability layer should provide `hcore` by relative smoothness, mirror
strong convexity, and Cauchy-Schwarz, plus `hvariance` from the variance
assumption `(12.1)`.
-/
theorem chewi121_smooth_expected_model_lower_of_rms_bound
    {alphaPhi sigma dim h varianceRms stepRms expectedNext psiNext : ℝ}
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hvariance : varianceRms ^ (2 : ℕ) ≤ sigma ^ (2 : ℕ) * dim)
    (hcore :
      expectedNext + (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
          varianceRms * stepRms ≤ psiNext) :
    expectedNext - sigma ^ (2 : ℕ) * dim * h / alphaPhi ≤ psiNext := by
  have hyoung :=
    chewi121_smooth_young_lower_bound
      (alphaPhi := alphaPhi) (h := h) (varianceRms := varianceRms)
      (stepRms := stepRms) hh halphaPhi
  have hlocal_lower :
      expectedNext - varianceRms ^ (2 : ℕ) * h / alphaPhi ≤
        expectedNext + (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
          varianceRms * stepRms := by
    nlinarith
  have hscale_nonneg : 0 ≤ h / alphaPhi :=
    div_nonneg hh.le halphaPhi.le
  have herror :
      varianceRms ^ (2 : ℕ) * h / alphaPhi ≤
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
    have hscaled :
        varianceRms ^ (2 : ℕ) * (h / alphaPhi) ≤
          (sigma ^ (2 : ℕ) * dim) * (h / alphaPhi) :=
      mul_le_mul_of_nonneg_right hvariance hscale_nonneg
    calc
      varianceRms ^ (2 : ℕ) * h / alphaPhi =
          varianceRms ^ (2 : ℕ) * (h / alphaPhi) := by ring
      _ ≤ (sigma ^ (2 : ℕ) * dim) * (h / alphaPhi) := hscaled
      _ = sigma ^ (2 : ℕ) * dim * h / alphaPhi := by ring
  exact (sub_le_sub_left herror expectedNext).trans (hlocal_lower.trans hcore)

/--
Non-smooth expected-model lower estimate from Chewi's bounded-gradient RMS
proof state, reusing the Chapter 10.11 completing-square inequality.
-/
theorem chewi121_nonsmooth_expected_model_lower_of_rms_bound
    {alphaPhi L h stepRms expectedNext psiNext : ℝ}
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hcore :
      expectedNext + (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) -
          (2 * L) * stepRms ≤ psiNext) :
    expectedNext - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤ psiNext := by
  have hyoung :=
    chewi1011_young_lower_bound
      (L := L) (alphaPhi := alphaPhi) (h := h) (r := stepRms)
      hh halphaPhi
  have hlocal_lower :
      expectedNext - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤
        expectedNext + (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) -
          (2 * L) * stepRms := by
    nlinarith
  exact hlocal_lower.trans hcore

/--
Smooth-case `hcore` estimate from the expected model components in Chewi's
proof.  The later Bochner layer should supply `hraw`, the smooth absorption
`D_f <= (1/(2h)) D_phi`, the mirror strong-convexity lower bound, and the
Cauchy-Schwarz noise estimate.
-/
theorem chewi121_smooth_hcore_of_expected_components
    {alphaPhi h expectedNext psiNext DfAvg DphiAvg noiseTerm varianceRms
      stepRms : ℝ}
    (hh : 0 < h)
    (hraw :
      expectedNext - DfAvg + (1 / h) * DphiAvg - noiseTerm ≤ psiNext)
    (hdf_absorb : DfAvg ≤ (1 / (2 * h)) * DphiAvg)
    (hphi_lower :
      (alphaPhi / 2) * stepRms ^ (2 : ℕ) ≤ DphiAvg)
    (hnoise : noiseTerm ≤ varianceRms * stepRms) :
    expectedNext + (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
        varianceRms * stepRms ≤ psiNext := by
  have hscale_nonneg : 0 ≤ 1 / (2 * h) := by positivity
  have hphi_scaled :
      (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) ≤
        (1 / (2 * h)) * DphiAvg := by
    have hmul := mul_le_mul_of_nonneg_left hphi_lower hscale_nonneg
    calc
      (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) =
          (1 / (2 * h)) * ((alphaPhi / 2) * stepRms ^ (2 : ℕ)) := by
            field_simp [hh.ne']
            ring
      _ ≤ (1 / (2 * h)) * DphiAvg := hmul
  have hquad_model :
      (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) ≤
        -DfAvg + (1 / h) * DphiAvg := by
    calc
      (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) ≤
          (1 / (2 * h)) * DphiAvg := hphi_scaled
      _ = -(1 / (2 * h)) * DphiAvg + (1 / h) * DphiAvg := by
            field_simp [hh.ne']
            ring
      _ ≤ -DfAvg + (1 / h) * DphiAvg := by
            nlinarith
  have hleft :
      expectedNext + (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
          varianceRms * stepRms ≤
        expectedNext - DfAvg + (1 / h) * DphiAvg - noiseTerm := by
    nlinarith
  exact hleft.trans hraw

/--
Non-smooth-case `hcore` estimate from Chewi's expected model components.  The
two linear terms correspond to Lipschitzness of `f` and the bounded stochastic
gradient term.
-/
theorem chewi121_nonsmooth_hcore_of_expected_components
    {alphaPhi L h expectedNext psiNext DphiAvg lipTerm gradTerm stepRms : ℝ}
    (hh : 0 < h)
    (hraw :
      expectedNext - lipTerm - gradTerm + (1 / h) * DphiAvg ≤ psiNext)
    (hphi_lower :
      (alphaPhi / 2) * stepRms ^ (2 : ℕ) ≤ DphiAvg)
    (hlip : lipTerm ≤ L * stepRms)
    (hgrad : gradTerm ≤ L * stepRms) :
    expectedNext + (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) -
        (2 * L) * stepRms ≤ psiNext := by
  have hscale_nonneg : 0 ≤ 1 / h := by positivity
  have hphi_scaled :
      (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) ≤
        (1 / h) * DphiAvg := by
    have hmul := mul_le_mul_of_nonneg_left hphi_lower hscale_nonneg
    calc
      (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) =
          (1 / h) * ((alphaPhi / 2) * stepRms ^ (2 : ℕ)) := by
            field_simp [hh.ne']
      _ ≤ (1 / h) * DphiAvg := hmul
  have hleft :
      expectedNext + (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) -
          (2 * L) * stepRms ≤
        expectedNext - lipTerm - gradTerm + (1 / h) * DphiAvg := by
    nlinarith
  exact hleft.trans hraw

/--
Finite-support smooth raw expected-model bound.  This is the finite-probability
analogue of the first equality/inequality in Chewi's smooth SMPGD lower-bound
display, after the pointwise model inequality has been proved for every sampled
stochastic gradient.
-/
theorem chewi121_smooth_finite_raw_component_bound
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w Fplus Df Dphi noise psi : ι -> ℝ} {h psiNext : ℝ}
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hpoint : ∀ i ∈ s,
      Fplus i - Df i + (1 / h) * Dphi i - noise i ≤ psi i)
    (hpsi : (∑ i ∈ s, w i * psi i) ≤ psiNext) :
    (∑ i ∈ s, w i * Fplus i) - (∑ i ∈ s, w i * Df i) +
        (1 / h) * (∑ i ∈ s, w i * Dphi i) -
          (∑ i ∈ s, w i * noise i) ≤ psiNext := by
  have hsum :
      (∑ i ∈ s, w i *
        (Fplus i - Df i + (1 / h) * Dphi i - noise i)) ≤
        ∑ i ∈ s, w i * psi i := by
    refine Finset.sum_le_sum ?_
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i hi) (hw_nonneg i hi)
  have hsum_eq :
      (∑ i ∈ s, w i *
        (Fplus i - Df i + (1 / h) * Dphi i - noise i)) =
        (∑ i ∈ s, w i * Fplus i) - (∑ i ∈ s, w i * Df i) +
          (1 / h) * (∑ i ∈ s, w i * Dphi i) -
            (∑ i ∈ s, w i * noise i) := by
    calc
      (∑ i ∈ s, w i *
        (Fplus i - Df i + (1 / h) * Dphi i - noise i))
          =
        ∑ i ∈ s,
          (w i * Fplus i - w i * Df i +
            (1 / h) * (w i * Dphi i) - w i * noise i) := by
            refine Finset.sum_congr rfl ?_
            intro i hi
            ring
      _ =
        (∑ i ∈ s, w i * Fplus i) - (∑ i ∈ s, w i * Df i) +
          (1 / h) * (∑ i ∈ s, w i * Dphi i) -
            (∑ i ∈ s, w i * noise i) := by
            rw [Finset.sum_sub_distrib, Finset.sum_add_distrib,
              Finset.sum_sub_distrib, Finset.mul_sum]
  exact hsum_eq ▸ hsum.trans hpsi

/--
Finite-support lifting of the smooth relative-smoothness absorption
`D_f <= (1/(2h)) D_phi`.
-/
theorem chewi121_smooth_finite_absorb_component_bound
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w Df Dphi : ι -> ℝ} {h : ℝ}
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hpoint : ∀ i ∈ s, Df i ≤ (1 / (2 * h)) * Dphi i) :
    (∑ i ∈ s, w i * Df i) ≤
      (1 / (2 * h)) * (∑ i ∈ s, w i * Dphi i) := by
  have hsum :
      (∑ i ∈ s, w i * Df i) ≤
        ∑ i ∈ s, w i * ((1 / (2 * h)) * Dphi i) := by
    refine Finset.sum_le_sum ?_
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i hi) (hw_nonneg i hi)
  have hsum_eq :
      (∑ i ∈ s, w i * ((1 / (2 * h)) * Dphi i)) =
        (1 / (2 * h)) * (∑ i ∈ s, w i * Dphi i) := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl ?_
    intro i hi
    ring
  exact hsum.trans_eq hsum_eq

/--
Finite-support lifting of the mirror strong-convexity lower bound
`D_phi >= alpha_phi / 2 * ||x+ - x||^2`.
-/
theorem chewi121_finite_mirror_lower_component_bound
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w Dphi stepSq : ι -> ℝ} {alphaPhi stepRms : ℝ}
    (halphaPhi_nonneg : 0 ≤ alphaPhi)
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hstepRms_sq :
      stepRms ^ (2 : ℕ) ≤ ∑ i ∈ s, w i * stepSq i)
    (hpoint : ∀ i ∈ s, (alphaPhi / 2) * stepSq i ≤ Dphi i) :
    (alphaPhi / 2) * stepRms ^ (2 : ℕ) ≤
      ∑ i ∈ s, w i * Dphi i := by
  have hcoef_nonneg : 0 ≤ alphaPhi / 2 := by positivity
  have hsum :
      (∑ i ∈ s, w i * ((alphaPhi / 2) * stepSq i)) ≤
        ∑ i ∈ s, w i * Dphi i := by
    refine Finset.sum_le_sum ?_
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i hi) (hw_nonneg i hi)
  have hsum_eq :
      (∑ i ∈ s, w i * ((alphaPhi / 2) * stepSq i)) =
        (alphaPhi / 2) * (∑ i ∈ s, w i * stepSq i) := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl ?_
    intro i hi
    ring
  calc
    (alphaPhi / 2) * stepRms ^ (2 : ℕ) ≤
        (alphaPhi / 2) * (∑ i ∈ s, w i * stepSq i) :=
          mul_le_mul_of_nonneg_left hstepRms_sq hcoef_nonneg
    _ = ∑ i ∈ s, w i * ((alphaPhi / 2) * stepSq i) := hsum_eq.symm
    _ ≤ ∑ i ∈ s, w i * Dphi i := hsum

/-- Finite-support non-smooth raw expected-model bound. -/
theorem chewi121_nonsmooth_finite_raw_component_bound
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w Fplus lip grad Dphi psi : ι -> ℝ} {h psiNext : ℝ}
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hpoint : ∀ i ∈ s,
      Fplus i - lip i - grad i + (1 / h) * Dphi i ≤ psi i)
    (hpsi : (∑ i ∈ s, w i * psi i) ≤ psiNext) :
    (∑ i ∈ s, w i * Fplus i) - (∑ i ∈ s, w i * lip i) -
        (∑ i ∈ s, w i * grad i) +
          (1 / h) * (∑ i ∈ s, w i * Dphi i) ≤ psiNext := by
  have hsum :
      (∑ i ∈ s, w i *
        (Fplus i - lip i - grad i + (1 / h) * Dphi i)) ≤
        ∑ i ∈ s, w i * psi i := by
    refine Finset.sum_le_sum ?_
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i hi) (hw_nonneg i hi)
  have hsum_eq :
      (∑ i ∈ s, w i *
        (Fplus i - lip i - grad i + (1 / h) * Dphi i)) =
        (∑ i ∈ s, w i * Fplus i) - (∑ i ∈ s, w i * lip i) -
          (∑ i ∈ s, w i * grad i) +
            (1 / h) * (∑ i ∈ s, w i * Dphi i) := by
    calc
      (∑ i ∈ s, w i *
        (Fplus i - lip i - grad i + (1 / h) * Dphi i))
          =
        ∑ i ∈ s,
          (w i * Fplus i - w i * lip i - w i * grad i +
            (1 / h) * (w i * Dphi i)) := by
            refine Finset.sum_congr rfl ?_
            intro i hi
            ring
      _ =
        (∑ i ∈ s, w i * Fplus i) - (∑ i ∈ s, w i * lip i) -
          (∑ i ∈ s, w i * grad i) +
            (1 / h) * (∑ i ∈ s, w i * Dphi i) := by
            rw [Finset.sum_add_distrib, Finset.sum_sub_distrib,
              Finset.sum_sub_distrib, Finset.mul_sum]
  exact hsum_eq ▸ hsum.trans hpsi

/--
Finite-support lifting for one linear non-smooth term, e.g. the Lipschitz term
or the stochastic-gradient term.
-/
theorem chewi121_finite_linear_component_bound
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w term stepNorm : ι -> ℝ} {L stepRms : ℝ}
    (hL_nonneg : 0 ≤ L)
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hstep_avg : (∑ i ∈ s, w i * stepNorm i) ≤ stepRms)
    (hpoint : ∀ i ∈ s, term i ≤ L * stepNorm i) :
    (∑ i ∈ s, w i * term i) ≤ L * stepRms := by
  have hsum :
      (∑ i ∈ s, w i * term i) ≤
        ∑ i ∈ s, w i * (L * stepNorm i) := by
    refine Finset.sum_le_sum ?_
    intro i hi
    exact mul_le_mul_of_nonneg_left (hpoint i hi) (hw_nonneg i hi)
  have hsum_eq :
      (∑ i ∈ s, w i * (L * stepNorm i)) =
        L * (∑ i ∈ s, w i * stepNorm i) := by
    rw [Finset.mul_sum]
    refine Finset.sum_congr rfl ?_
    intro i hi
    ring
  calc
    (∑ i ∈ s, w i * term i) ≤ ∑ i ∈ s, w i * (L * stepNorm i) := hsum
    _ = L * (∑ i ∈ s, w i * stepNorm i) := hsum_eq
    _ ≤ L * stepRms := mul_le_mul_of_nonneg_left hstep_avg hL_nonneg

/--
Finite-support smooth `hcore` theorem.  The hypotheses are exactly the
per-sample model inequality, relative-smoothness absorption, mirror lower
bound, and a supplied finite Cauchy-Schwarz noise estimate.
-/
theorem chewi121_smooth_hcore_of_finite_components
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w Fplus Df Dphi noise psi stepSq : ι -> ℝ}
    {alphaPhi h psiNext varianceRms stepRms : ℝ}
    (hh : 0 < h) (halphaPhi_nonneg : 0 ≤ alphaPhi)
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hraw_point : ∀ i ∈ s,
      Fplus i - Df i + (1 / h) * Dphi i - noise i ≤ psi i)
    (hpsi : (∑ i ∈ s, w i * psi i) ≤ psiNext)
    (hdf_point : ∀ i ∈ s, Df i ≤ (1 / (2 * h)) * Dphi i)
    (hstepRms_sq :
      stepRms ^ (2 : ℕ) ≤ ∑ i ∈ s, w i * stepSq i)
    (hphi_point : ∀ i ∈ s, (alphaPhi / 2) * stepSq i ≤ Dphi i)
    (hnoise : (∑ i ∈ s, w i * noise i) ≤ varianceRms * stepRms) :
    (∑ i ∈ s, w i * Fplus i) +
        (alphaPhi / (4 * h)) * stepRms ^ (2 : ℕ) -
          varianceRms * stepRms ≤ psiNext := by
  have hraw :=
    chewi121_smooth_finite_raw_component_bound
      (s := s) (w := w) (Fplus := Fplus) (Df := Df) (Dphi := Dphi)
      (noise := noise) (psi := psi) (h := h) (psiNext := psiNext)
      hw_nonneg hraw_point hpsi
  have hdf_absorb :=
    chewi121_smooth_finite_absorb_component_bound
      (s := s) (w := w) (Df := Df) (Dphi := Dphi) (h := h)
      hw_nonneg hdf_point
  have hphi_lower :=
    chewi121_finite_mirror_lower_component_bound
      (s := s) (w := w) (Dphi := Dphi) (stepSq := stepSq)
      (alphaPhi := alphaPhi) (stepRms := stepRms)
      halphaPhi_nonneg hw_nonneg hstepRms_sq hphi_point
  exact
    chewi121_smooth_hcore_of_expected_components
      (alphaPhi := alphaPhi) (h := h)
      (expectedNext := ∑ i ∈ s, w i * Fplus i) (psiNext := psiNext)
      (DfAvg := ∑ i ∈ s, w i * Df i)
      (DphiAvg := ∑ i ∈ s, w i * Dphi i)
      (noiseTerm := ∑ i ∈ s, w i * noise i)
      (varianceRms := varianceRms) (stepRms := stepRms)
      hh hraw hdf_absorb hphi_lower hnoise

/--
Finite-support non-smooth `hcore` theorem.  This packages the pointwise
Lipschitz and stochastic-gradient linear estimates into the scalar
component-hcore theorem.
-/
theorem chewi121_nonsmooth_hcore_of_finite_components
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {w Fplus lip grad Dphi psi stepSq stepNorm : ι -> ℝ}
    {alphaPhi L h psiNext stepRms : ℝ}
    (hh : 0 < h) (halphaPhi_nonneg : 0 ≤ alphaPhi) (hL_nonneg : 0 ≤ L)
    (hw_nonneg : ∀ i ∈ s, 0 ≤ w i)
    (hraw_point : ∀ i ∈ s,
      Fplus i - lip i - grad i + (1 / h) * Dphi i ≤ psi i)
    (hpsi : (∑ i ∈ s, w i * psi i) ≤ psiNext)
    (hstepRms_sq :
      stepRms ^ (2 : ℕ) ≤ ∑ i ∈ s, w i * stepSq i)
    (hphi_point : ∀ i ∈ s, (alphaPhi / 2) * stepSq i ≤ Dphi i)
    (hstep_avg : (∑ i ∈ s, w i * stepNorm i) ≤ stepRms)
    (hlip_point : ∀ i ∈ s, lip i ≤ L * stepNorm i)
    (hgrad_point : ∀ i ∈ s, grad i ≤ L * stepNorm i) :
    (∑ i ∈ s, w i * Fplus i) +
        (alphaPhi / (2 * h)) * stepRms ^ (2 : ℕ) -
          (2 * L) * stepRms ≤ psiNext := by
  have hraw :=
    chewi121_nonsmooth_finite_raw_component_bound
      (s := s) (w := w) (Fplus := Fplus) (lip := lip) (grad := grad)
      (Dphi := Dphi) (psi := psi) (h := h) (psiNext := psiNext)
      hw_nonneg hraw_point hpsi
  have hphi_lower :=
    chewi121_finite_mirror_lower_component_bound
      (s := s) (w := w) (Dphi := Dphi) (stepSq := stepSq)
      (alphaPhi := alphaPhi) (stepRms := stepRms)
      halphaPhi_nonneg hw_nonneg hstepRms_sq hphi_point
  have hlip :=
    chewi121_finite_linear_component_bound
      (s := s) (w := w) (term := lip) (stepNorm := stepNorm)
      (L := L) (stepRms := stepRms)
      hL_nonneg hw_nonneg hstep_avg hlip_point
  have hgrad :=
    chewi121_finite_linear_component_bound
      (s := s) (w := w) (term := grad) (stepNorm := stepNorm)
      (L := L) (stepRms := stepRms)
      hL_nonneg hw_nonneg hstep_avg hgrad_point
  exact
    chewi121_nonsmooth_hcore_of_expected_components
      (alphaPhi := alphaPhi) (L := L) (h := h)
      (expectedNext := ∑ i ∈ s, w i * Fplus i) (psiNext := psiNext)
      (DphiAvg := ∑ i ∈ s, w i * Dphi i)
      (lipTerm := ∑ i ∈ s, w i * lip i)
      (gradTerm := ∑ i ∈ s, w i * grad i)
      (stepRms := stepRms)
      hh hraw hphi_lower hlip hgrad

/--
Smooth-case Chewi Theorem 12.1 rate from the expected model bounds plus the
source stochastic lower-bound estimate for `E psi_x(x+)`.
-/
theorem chewi121_smooth_weightedAverageGap_le_geometric_of_model_bounds
    {alphaF alphaG alphaPhi sigma dim h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar expectedNext : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hmodel_lower : ∀ n, n < N ->
      expectedNext n - sigma ^ (2 : ℕ) * dim * h / alphaPhi ≤ psiNext n)
    (hgap_sum : ∀ n, n < N -> Fstar + gap (n + 1) = expectedNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
  have hnext_lower : ∀ n, n < N ->
      Fstar + gap (n + 1) -
          sigma ^ (2 : ℕ) * dim * h / alphaPhi ≤ psiNext n := by
    intro n hn
    exact
      chewi121_smooth_next_lower_of_expected_model_error
        (Fstar := Fstar) (gap := gap (n + 1))
        (expectedNext := expectedNext n) (psiNext := psiNext n)
        (sigma := sigma) (dim := dim) (alphaPhi := alphaPhi) (h := h)
        (hmodel_lower n hn) (hgap_sum n hn)
  exact
    chewi121_weightedAverageGap_le_geometric_of_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (h := h)
      (modelError := sigma ^ (2 : ℕ) * dim * h / alphaPhi) (Fstar := Fstar)
      htotal_pos hh hden_pos hlambda_pos D gap psiNext psiStar hN
      hD_N_nonneg hgrowth hstar_upper hnext_lower

/--
Non-smooth-case Chewi Theorem 12.1 rate from the expected model bounds plus
the source stochastic lower-bound estimate for `E psi_x(x+)`.
-/
theorem chewi121_nonsmooth_weightedAverageGap_le_geometric_of_model_bounds
    {alphaF alphaG alphaPhi L h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar expectedNext : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hmodel_lower : ∀ n, n < N ->
      expectedNext n - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤ psiNext n)
    (hgap_sum : ∀ n, n < N -> Fstar + gap (n + 1) = expectedNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  have hnext_lower : ∀ n, n < N ->
      Fstar + gap (n + 1) - 2 * L ^ (2 : ℕ) * h / alphaPhi ≤ psiNext n := by
    intro n hn
    exact
      chewi121_nonsmooth_next_lower_of_expected_model_error
        (Fstar := Fstar) (gap := gap (n + 1))
        (expectedNext := expectedNext n) (psiNext := psiNext n)
        (L := L) (alphaPhi := alphaPhi) (h := h)
        (hmodel_lower n hn) (hgap_sum n hn)
  exact
    chewi121_weightedAverageGap_le_geometric_of_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (h := h)
      (modelError := 2 * L ^ (2 : ℕ) * h / alphaPhi) (Fstar := Fstar)
      htotal_pos hh hden_pos hlambda_pos D gap psiNext psiStar hN
      hD_N_nonneg hgrowth hstar_upper hnext_lower

/--
Smooth-case Chewi Theorem 12.1 rate from the expected model bounds plus the
RMS variance lower-bound proof state.
-/
theorem chewi121_smooth_weightedAverageGap_le_geometric_of_rms_model_bounds
    {alphaF alphaG alphaPhi sigma dim h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar expectedNext varianceRms stepRms : ℕ -> ℝ)
    {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hvariance : ∀ n, n < N ->
      varianceRms n ^ (2 : ℕ) ≤ sigma ^ (2 : ℕ) * dim)
    (hnext_core : ∀ n, n < N ->
      expectedNext n + (alphaPhi / (4 * h)) * stepRms n ^ (2 : ℕ) -
          varianceRms n * stepRms n ≤ psiNext n)
    (hgap_sum : ∀ n, n < N -> Fstar + gap (n + 1) = expectedNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
  refine
    chewi121_smooth_weightedAverageGap_le_geometric_of_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (alphaPhi := alphaPhi)
      (sigma := sigma) (dim := dim) (h := h) (Fstar := Fstar)
      htotal_pos hh hden_pos hlambda_pos D gap psiNext psiStar expectedNext
      hN hD_N_nonneg hgrowth hstar_upper ?_ hgap_sum
  intro n hn
  exact
    chewi121_smooth_expected_model_lower_of_rms_bound
      (alphaPhi := alphaPhi) (sigma := sigma) (dim := dim) (h := h)
      (varianceRms := varianceRms n) (stepRms := stepRms n)
      (expectedNext := expectedNext n) (psiNext := psiNext n)
      hh halphaPhi (hvariance n hn) (hnext_core n hn)

/--
Non-smooth-case Chewi Theorem 12.1 rate from the expected model bounds plus
the bounded-gradient RMS lower-bound proof state.
-/
theorem chewi121_nonsmooth_weightedAverageGap_le_geometric_of_rms_model_bounds
    {alphaF alphaG alphaPhi L h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar expectedNext stepRms : ℕ -> ℝ) {N : ℕ}
    (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hnext_core : ∀ n, n < N ->
      expectedNext n + (alphaPhi / (2 * h)) * stepRms n ^ (2 : ℕ) -
          (2 * L) * stepRms n ≤ psiNext n)
    (hgap_sum : ∀ n, n < N -> Fstar + gap (n + 1) = expectedNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  refine
    chewi121_nonsmooth_weightedAverageGap_le_geometric_of_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (alphaPhi := alphaPhi)
      (L := L) (h := h) (Fstar := Fstar)
      htotal_pos hh hden_pos hlambda_pos D gap psiNext psiStar expectedNext
      hN hD_N_nonneg hgrowth hstar_upper ?_ hgap_sum
  intro n hn
  exact
    chewi121_nonsmooth_expected_model_lower_of_rms_bound
      (alphaPhi := alphaPhi) (L := L) (h := h)
      (stepRms := stepRms n) (expectedNext := expectedNext n)
      (psiNext := psiNext n)
      hh halphaPhi (hnext_core n hn)

/--
Finite-support smooth Chewi Theorem 12.1 rate.  This is the finite
stochastic-gradient theorem obtained by combining the per-sample component
model bounds with the already verified SMPGD Gronwall/rate layer.
-/
theorem chewi121_smooth_weightedAverageGap_le_geometric_of_finite_components
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {alphaF alphaG alphaPhi sigma dim h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar varianceRms stepRms : ℕ -> ℝ)
    (w Fplus Df Dphi noise psi stepSq : ℕ -> ι -> ℝ)
    {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hw_nonneg : ∀ n, n < N -> ∀ i ∈ s, 0 ≤ w n i)
    (hraw_point : ∀ n, n < N -> ∀ i ∈ s,
      Fplus n i - Df n i + (1 / h) * Dphi n i - noise n i ≤ psi n i)
    (hpsi : ∀ n, n < N ->
      (∑ i ∈ s, w n i * psi n i) ≤ psiNext n)
    (hdf_point : ∀ n, n < N -> ∀ i ∈ s,
      Df n i ≤ (1 / (2 * h)) * Dphi n i)
    (hstepRms_sq : ∀ n, n < N ->
      stepRms n ^ (2 : ℕ) ≤ ∑ i ∈ s, w n i * stepSq n i)
    (hphi_point : ∀ n, n < N -> ∀ i ∈ s,
      (alphaPhi / 2) * stepSq n i ≤ Dphi n i)
    (hnoise : ∀ n, n < N ->
      (∑ i ∈ s, w n i * noise n i) ≤ varianceRms n * stepRms n)
    (hvariance : ∀ n, n < N ->
      varianceRms n ^ (2 : ℕ) ≤ sigma ^ (2 : ℕ) * dim)
    (hgap_sum : ∀ n, n < N ->
      Fstar + gap (n + 1) = ∑ i ∈ s, w n i * Fplus n i) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
  refine
    chewi121_smooth_weightedAverageGap_le_geometric_of_rms_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (alphaPhi := alphaPhi)
      (sigma := sigma) (dim := dim) (h := h) (Fstar := Fstar)
      htotal_pos hh halphaPhi hden_pos hlambda_pos D gap psiNext psiStar
      (fun n => ∑ i ∈ s, w n i * Fplus n i) varianceRms stepRms
      hN hD_N_nonneg hgrowth hstar_upper hvariance ?_ hgap_sum
  intro n hn
  exact
    chewi121_smooth_hcore_of_finite_components
      (s := s) (w := w n) (Fplus := Fplus n) (Df := Df n)
      (Dphi := Dphi n) (noise := noise n) (psi := psi n)
      (stepSq := stepSq n) (alphaPhi := alphaPhi) (h := h)
      (psiNext := psiNext n) (varianceRms := varianceRms n)
      (stepRms := stepRms n)
      hh halphaPhi.le (hw_nonneg n hn) (hraw_point n hn) (hpsi n hn)
      (hdf_point n hn) (hstepRms_sq n hn) (hphi_point n hn) (hnoise n hn)

/-- Finite-support non-smooth Chewi Theorem 12.1 rate. -/
theorem chewi121_nonsmooth_weightedAverageGap_le_geometric_of_finite_components
    {ι : Type*} [DecidableEq ι] (s : Finset ι)
    {alphaF alphaG alphaPhi L h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi) (hL_nonneg : 0 ≤ L)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar stepRms : ℕ -> ℝ)
    (w Fplus lip grad Dphi psi stepSq stepNorm : ℕ -> ι -> ℝ)
    {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hw_nonneg : ∀ n, n < N -> ∀ i ∈ s, 0 ≤ w n i)
    (hraw_point : ∀ n, n < N -> ∀ i ∈ s,
      Fplus n i - lip n i - grad n i + (1 / h) * Dphi n i ≤ psi n i)
    (hpsi : ∀ n, n < N ->
      (∑ i ∈ s, w n i * psi n i) ≤ psiNext n)
    (hstepRms_sq : ∀ n, n < N ->
      stepRms n ^ (2 : ℕ) ≤ ∑ i ∈ s, w n i * stepSq n i)
    (hphi_point : ∀ n, n < N -> ∀ i ∈ s,
      (alphaPhi / 2) * stepSq n i ≤ Dphi n i)
    (hstep_avg : ∀ n, n < N ->
      (∑ i ∈ s, w n i * stepNorm n i) ≤ stepRms n)
    (hlip_point : ∀ n, n < N -> ∀ i ∈ s,
      lip n i ≤ L * stepNorm n i)
    (hgrad_point : ∀ n, n < N -> ∀ i ∈ s,
      grad n i ≤ L * stepNorm n i)
    (hgap_sum : ∀ n, n < N ->
      Fstar + gap (n + 1) = ∑ i ∈ s, w n i * Fplus n i) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  refine
    chewi121_nonsmooth_weightedAverageGap_le_geometric_of_rms_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (alphaPhi := alphaPhi)
      (L := L) (h := h) (Fstar := Fstar)
      htotal_pos hh halphaPhi hden_pos hlambda_pos D gap psiNext psiStar
      (fun n => ∑ i ∈ s, w n i * Fplus n i) stepRms
      hN hD_N_nonneg hgrowth hstar_upper ?_ hgap_sum
  intro n hn
  exact
    chewi121_nonsmooth_hcore_of_finite_components
      (s := s) (w := w n) (Fplus := Fplus n) (lip := lip n)
      (grad := grad n) (Dphi := Dphi n) (psi := psi n)
      (stepSq := stepSq n) (stepNorm := stepNorm n)
      (alphaPhi := alphaPhi) (L := L) (h := h)
      (psiNext := psiNext n) (stepRms := stepRms n)
      hh halphaPhi.le hL_nonneg (hw_nonneg n hn) (hraw_point n hn)
      (hpsi n hn) (hstepRms_sq n hn) (hphi_point n hn)
      (hstep_avg n hn) (hlip_point n hn) (hgrad_point n hn)

/--
Smooth-case Chewi Theorem 12.1 rate from expected model components: this is
the theorem-facing wrapper just before the full Bochner stochastic-gradient
discharge.
-/
theorem chewi121_smooth_weightedAverageGap_le_geometric_of_component_model_bounds
    {alphaF alphaG alphaPhi sigma dim h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar expectedNext DfAvg DphiAvg noiseTerm varianceRms
      stepRms : ℕ -> ℝ)
    {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hraw : ∀ n, n < N ->
      expectedNext n - DfAvg n + (1 / h) * DphiAvg n - noiseTerm n ≤
        psiNext n)
    (hdf_absorb : ∀ n, n < N ->
      DfAvg n ≤ (1 / (2 * h)) * DphiAvg n)
    (hphi_lower : ∀ n, n < N ->
      (alphaPhi / 2) * stepRms n ^ (2 : ℕ) ≤ DphiAvg n)
    (hnoise : ∀ n, n < N -> noiseTerm n ≤ varianceRms n * stepRms n)
    (hvariance : ∀ n, n < N ->
      varianceRms n ^ (2 : ℕ) ≤ sigma ^ (2 : ℕ) * dim)
    (hgap_sum : ∀ n, n < N -> Fstar + gap (n + 1) = expectedNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
  refine
    chewi121_smooth_weightedAverageGap_le_geometric_of_rms_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (alphaPhi := alphaPhi)
      (sigma := sigma) (dim := dim) (h := h) (Fstar := Fstar)
      htotal_pos hh halphaPhi hden_pos hlambda_pos D gap psiNext psiStar
      expectedNext varianceRms stepRms hN hD_N_nonneg hgrowth hstar_upper
      hvariance ?_ hgap_sum
  intro n hn
  exact
    chewi121_smooth_hcore_of_expected_components
      (alphaPhi := alphaPhi) (h := h) (expectedNext := expectedNext n)
      (psiNext := psiNext n) (DfAvg := DfAvg n) (DphiAvg := DphiAvg n)
      (noiseTerm := noiseTerm n) (varianceRms := varianceRms n)
      (stepRms := stepRms n)
      hh (hraw n hn) (hdf_absorb n hn) (hphi_lower n hn) (hnoise n hn)

/--
Non-smooth-case Chewi Theorem 12.1 rate from expected model components.
-/
theorem chewi121_nonsmooth_weightedAverageGap_le_geometric_of_component_model_bounds
    {alphaF alphaG alphaPhi L h Fstar : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap psiNext psiStar expectedNext DphiAvg lipTerm gradTerm stepRms :
      ℕ -> ℝ)
    {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hgrowth : ∀ n, n < N ->
      (alphaG + 1 / h) * D (n + 1) + psiNext n ≤ psiStar n)
    (hstar_upper : ∀ n, n < N ->
      psiStar n ≤ Fstar + ((1 - alphaF * h) / h) * D n)
    (hraw : ∀ n, n < N ->
      expectedNext n - lipTerm n - gradTerm n + (1 / h) * DphiAvg n ≤
        psiNext n)
    (hphi_lower : ∀ n, n < N ->
      (alphaPhi / 2) * stepRms n ^ (2 : ℕ) ≤ DphiAvg n)
    (hlip : ∀ n, n < N -> lipTerm n ≤ L * stepRms n)
    (hgrad : ∀ n, n < N -> gradTerm n ≤ L * stepRms n)
    (hgap_sum : ∀ n, n < N -> Fstar + gap (n + 1) = expectedNext n) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  refine
    chewi121_nonsmooth_weightedAverageGap_le_geometric_of_rms_model_bounds
      (alphaF := alphaF) (alphaG := alphaG) (alphaPhi := alphaPhi)
      (L := L) (h := h) (Fstar := Fstar)
      htotal_pos hh halphaPhi hden_pos hlambda_pos D gap psiNext psiStar
      expectedNext stepRms hN hD_N_nonneg hgrowth hstar_upper ?_ hgap_sum
  intro n hn
  exact
    chewi121_nonsmooth_hcore_of_expected_components
      (alphaPhi := alphaPhi) (L := L) (h := h)
      (expectedNext := expectedNext n) (psiNext := psiNext n)
      (DphiAvg := DphiAvg n) (lipTerm := lipTerm n)
      (gradTerm := gradTerm n) (stepRms := stepRms n)
      hh (hraw n hn) (hphi_lower n hn) (hlip n hn) (hgrad n hn)

/--
Chewi Theorem 12.1 smooth-case scalar rate, after the stochastic/proximal
one-step estimate has supplied the variance error
`sigma^2 * dim * h^2 / alphaPhi`.
-/
theorem chewi121_smooth_weightedAverageGap_le_of_source_oneStep
    {alphaF alphaG alphaPhi sigma dim h : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hone_step : ∀ n, n < N ->
      (1 + alphaG * h) * D (n + 1) ≤
        (1 - alphaF * h) * D n - h * gap (n + 1) +
          sigma ^ (2 : ℕ) * dim * h ^ (2 : ℕ) / alphaPhi) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
  have hmain :=
    chewi121_weightedAverageGap_le_geometric_of_source_oneStep
      (alphaF := alphaF) (alphaG := alphaG) (h := h)
      (err := sigma ^ (2 : ℕ) * dim * h ^ (2 : ℕ) / alphaPhi)
      htotal_pos hh hden_pos hlambda_pos D gap hN hD_N_nonneg hone_step
  have herr :
      (sigma ^ (2 : ℕ) * dim * h ^ (2 : ℕ) / alphaPhi) / h =
        sigma ^ (2 : ℕ) * dim * h / alphaPhi := by
    field_simp [hh.ne', halphaPhi.ne']
  simpa [herr] using hmain

/--
Chewi Theorem 12.1 non-smooth-case scalar rate, after the stochastic/proximal
one-step estimate has supplied the bounded-gradient error
`2 * L^2 * h^2 / alphaPhi`.
-/
theorem chewi121_nonsmooth_weightedAverageGap_le_of_source_oneStep
    {alphaF alphaG alphaPhi L h : ℝ}
    (htotal_pos : 0 < alphaF + alphaG)
    (hh : 0 < h) (halphaPhi : 0 < alphaPhi)
    (hden_pos : 0 < 1 + alphaG * h)
    (hlambda_pos : 0 < chewi109Lambda alphaF alphaG h)
    (D gap : ℕ -> ℝ) {N : ℕ} (hN : N ≠ 0)
    (hD_N_nonneg : 0 ≤ D N)
    (hone_step : ∀ n, n < N ->
      (1 + alphaG * h) * D (n + 1) ≤
        (1 - alphaF * h) * D n - h * gap (n + 1) +
          2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi) :
    (1 / (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n))) *
        (∑ n ∈ Finset.range N,
          (chewi109Lambda alphaF alphaG h) ^ (N - 1 - n) * gap (n + 1)) ≤
      (alphaF + alphaG) /
          (((chewi109Lambda alphaF alphaG h) ^ N)⁻¹ - 1) * D 0 +
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
  have hmain :=
    chewi121_weightedAverageGap_le_geometric_of_source_oneStep
      (alphaF := alphaF) (alphaG := alphaG) (h := h)
      (err := 2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi)
      htotal_pos hh hden_pos hlambda_pos D gap hN hD_N_nonneg hone_step
  have herr :
      (2 * L ^ (2 : ℕ) * h ^ (2 : ℕ) / alphaPhi) / h =
        2 * L ^ (2 : ℕ) * h / alphaPhi := by
    field_simp [hh.ne', halphaPhi.ne']
  simpa [herr] using hmain

end Optimization
end StatInference
