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
