import StatInference.Optimization.AlternatingMinimization

/-!
# Chewi Chapter 11 randomized alternating minimization

This module starts the supplied-interface scalar rate layer for Chewi Theorem
11.5.  The source proof reduces randomized alternating minimization to two
recurrences for the expected objective gap: a geometric recurrence in the
positive-curvature case and an inverse-gap recurrence in the zero-curvature
case.  The analytic coordinate/Hopf-Lax estimates will feed these interfaces in
later packets.
-/

namespace StatInference
namespace Optimization

noncomputable section

open Finset

/--
The geometric factor in Chewi Theorem 11.5 when
`alphaF + alphaG > 0`.
-/
def chewi115StrongFactor (alphaF alphaG : ℝ) (D : ℕ) : ℝ :=
  1 - (alphaF + alphaG) / ((1 + alphaG) * (D : ℝ))

/--
The zero-curvature denominator in Chewi Theorem 11.5:
`2 * D * R_beta^2`.
-/
def chewi115ZeroK (D : ℕ) (Rbeta : ℝ) : ℝ :=
  2 * (D : ℝ) * Rbeta ^ (2 : ℕ)

/--
Elementary nonnegativity condition for the strong RAM contraction factor.
-/
theorem chewi115StrongFactor_nonneg
    {alphaF alphaG : ℝ} {D : ℕ}
    (hD : 0 < D) (halphaG : -1 < alphaG)
    (hsum_le : alphaF + alphaG ≤ (1 + alphaG) * (D : ℝ)) :
    0 ≤ chewi115StrongFactor alphaF alphaG D := by
  have hD_real : 0 < (D : ℝ) := by exact_mod_cast hD
  have hden_pos : 0 < (1 + alphaG) * (D : ℝ) := by
    exact mul_pos (by nlinarith) hD_real
  rw [chewi115StrongFactor, sub_nonneg]
  rw [div_le_iff₀ hden_pos]
  nlinarith

/-- Positivity of the zero-curvature RAM denominator. -/
theorem chewi115ZeroK_pos {D : ℕ} {Rbeta : ℝ}
    (hD : 0 < D) (hRbeta : 0 < Rbeta) :
    0 < chewi115ZeroK D Rbeta := by
  have hD_real : 0 < (D : ℝ) := by exact_mod_cast hD
  have htwoD : 0 < 2 * (D : ℝ) := mul_pos (by norm_num) hD_real
  have hR_sq : 0 < Rbeta ^ (2 : ℕ) := pow_pos hRbeta _
  simpa [chewi115ZeroK] using mul_pos htwoD hR_sq

/--
Strong RAM supplied scalar recurrence: once the expected gap satisfies the
one-step contraction from Chewi's proof, it contracts geometrically.
-/
theorem chewi115_strong_expected_gap_le_of_recurrence
    {expectedGap : ℕ -> ℝ} {alphaF alphaG : ℝ} {D : ℕ}
    (hfactor_nonneg : 0 ≤ chewi115StrongFactor alphaF alphaG D)
    (hrec : ∀ n,
      expectedGap (n + 1) ≤
        chewi115StrongFactor alphaF alphaG D * expectedGap n) :
    ∀ N,
      expectedGap N ≤
        chewi115StrongFactor alphaF alphaG D ^ N * expectedGap 0 :=
  scalarRecurrence_le_pow hfactor_nonneg hrec

/--
Source-shaped strong RAM gap certificate after taking full expectation in the
positive-curvature case of Chewi Theorem 11.5.
-/
structure IsChewi115RAMStrongGapCertificate
    (expectedGap : ℕ -> ℝ) (alphaF alphaG : ℝ) (D : ℕ) : Prop where
  gap_nonneg : ∀ n, 0 ≤ expectedGap n
  one_step : ∀ n,
    expectedGap (n + 1) ≤
      chewi115StrongFactor alphaF alphaG D * expectedGap n

/-- The strong RAM certificate gives Chewi's geometric expected-gap rate. -/
theorem IsChewi115RAMStrongGapCertificate.gap_le_geometric
    {expectedGap : ℕ -> ℝ} {alphaF alphaG : ℝ} {D : ℕ}
    (hcert : IsChewi115RAMStrongGapCertificate expectedGap alphaF alphaG D)
    (hfactor_nonneg : 0 ≤ chewi115StrongFactor alphaF alphaG D) :
    ∀ N,
      expectedGap N ≤
        chewi115StrongFactor alphaF alphaG D ^ N * expectedGap 0 :=
  chewi115_strong_expected_gap_le_of_recurrence hfactor_nonneg hcert.one_step

/--
Algebraic bridge from Chewi's conditional-expectation/Hopf-Lax display to the
strong RAM one-step recurrence.
-/
theorem chewi115_strong_one_step_of_hopf_lax_gap_bound
    {nextGap gap hopfGap alphaF alphaG : ℝ} {D : ℕ}
    (hD : 0 < D) (halphaG : -1 < alphaG)
    (hcond :
      nextGap ≤
        (((D : ℝ) - 1) / (D : ℝ)) * gap + (1 / (D : ℝ)) * hopfGap)
    (hhopf : hopfGap ≤ ((1 - alphaF) / (1 + alphaG)) * gap) :
    nextGap ≤ chewi115StrongFactor alphaF alphaG D * gap := by
  have hD_real : 0 < (D : ℝ) := by exact_mod_cast hD
  have hden_pos : 0 < 1 + alphaG := by nlinarith
  have hscale :
      (1 / (D : ℝ)) * hopfGap ≤
        (1 / (D : ℝ)) * (((1 - alphaF) / (1 + alphaG)) * gap) :=
    mul_le_mul_of_nonneg_left hhopf (by positivity)
  calc
    nextGap
        ≤ (((D : ℝ) - 1) / (D : ℝ)) * gap + (1 / (D : ℝ)) * hopfGap :=
          hcond
    _ ≤ (((D : ℝ) - 1) / (D : ℝ)) * gap +
          (1 / (D : ℝ)) * (((1 - alphaF) / (1 + alphaG)) * gap) := by
          exact add_le_add le_rfl hscale
    _ = chewi115StrongFactor alphaF alphaG D * gap := by
          rw [chewi115StrongFactor]
          field_simp [hD_real.ne', hden_pos.ne']
          ring

/--
Source-shaped strong RAM bridge certificate: the conditional expectation
upper bound plus the positive-curvature Hopf-Lax estimate from Exercise 9.3.
-/
structure IsChewi115RAMStrongHopfLaxCertificate
    (expectedGap hopfGap : ℕ -> ℝ) (alphaF alphaG : ℝ) (D : ℕ) : Prop where
  gap_nonneg : ∀ n, 0 ≤ expectedGap n
  conditional_upper : ∀ n,
    expectedGap (n + 1) ≤
      (((D : ℝ) - 1) / (D : ℝ)) * expectedGap n +
        (1 / (D : ℝ)) * hopfGap n
  hopf_lax_bound : ∀ n,
    hopfGap n ≤ ((1 - alphaF) / (1 + alphaG)) * expectedGap n

/-- The strong Hopf-Lax bridge supplies the strong RAM gap certificate. -/
theorem IsChewi115RAMStrongHopfLaxCertificate.toGapCertificate
    {expectedGap hopfGap : ℕ -> ℝ} {alphaF alphaG : ℝ} {D : ℕ}
    (hcert :
      IsChewi115RAMStrongHopfLaxCertificate expectedGap hopfGap alphaF alphaG D)
    (hD : 0 < D) (halphaG : -1 < alphaG) :
    IsChewi115RAMStrongGapCertificate expectedGap alphaF alphaG D := by
  refine ⟨hcert.gap_nonneg, ?_⟩
  intro n
  exact chewi115_strong_one_step_of_hopf_lax_gap_bound
    (D := D) (alphaF := alphaF) (alphaG := alphaG)
    hD halphaG (hcert.conditional_upper n) (hcert.hopf_lax_bound n)

/-- Geometric strong RAM rate directly from the source Hopf-Lax bridge. -/
theorem IsChewi115RAMStrongHopfLaxCertificate.gap_le_geometric
    {expectedGap hopfGap : ℕ -> ℝ} {alphaF alphaG : ℝ} {D : ℕ}
    (hcert :
      IsChewi115RAMStrongHopfLaxCertificate expectedGap hopfGap alphaF alphaG D)
    (hD : 0 < D) (halphaG : -1 < alphaG)
    (hfactor_nonneg : 0 ≤ chewi115StrongFactor alphaF alphaG D) :
    ∀ N,
      expectedGap N ≤
        chewi115StrongFactor alphaF alphaG D ^ N * expectedGap 0 :=
  (hcert.toGapCertificate hD halphaG).gap_le_geometric hfactor_nonneg

/--
Finite-uniform block averaging in Chewi's RAM proof.  If every block update is
bounded by its smooth one-block model, then the conditional expectation over a
uniform block is bounded by the averaged model.  The inputs `lin`, `normSq`,
`Gx`, and `Gy` are the source displays after summing the block linear terms,
anisotropic quadratic terms, and blockwise `g` replacements.
-/
theorem chewi115_uniform_average_le_of_block_model
    {D : ℕ} (hD : 0 < D)
    {nextValue Fx lin normSq Gx Gy : ℝ}
    {blockValue gradTerm quadTerm gReplace : Fin D -> ℝ}
    (hnext :
      nextValue ≤
        (1 / (D : ℝ)) * ∑ i : Fin D, blockValue i)
    (hblock : ∀ i : Fin D,
      blockValue i ≤ Fx + gradTerm i + quadTerm i + gReplace i)
    (hgrad_sum : (∑ i : Fin D, gradTerm i) = lin)
    (hquad_sum : (∑ i : Fin D, quadTerm i) = normSq / 2)
    (hg_sum : (∑ i : Fin D, gReplace i) = ((D : ℝ) - 1) * Gx + Gy) :
    nextValue ≤
      Fx + (1 / (D : ℝ)) * lin + (1 / (2 * (D : ℝ))) * normSq +
        (((D : ℝ) - 1) / (D : ℝ)) * Gx + (1 / (D : ℝ)) * Gy := by
  have hD_real : 0 < (D : ℝ) := by exact_mod_cast hD
  have hsum_le :
      (∑ i : Fin D, blockValue i) ≤
        ∑ i : Fin D, (Fx + gradTerm i + quadTerm i + gReplace i) :=
    Finset.sum_le_sum fun i _hi => hblock i
  have hscaled :
      (1 / (D : ℝ)) * (∑ i : Fin D, blockValue i) ≤
        (1 / (D : ℝ)) *
          ∑ i : Fin D, (Fx + gradTerm i + quadTerm i + gReplace i) :=
    mul_le_mul_of_nonneg_left hsum_le (by positivity)
  have hsum_model :
      (∑ i : Fin D, (Fx + gradTerm i + quadTerm i + gReplace i)) =
        (D : ℝ) * Fx + lin + normSq / 2 + (((D : ℝ) - 1) * Gx + Gy) := by
    rw [Finset.sum_add_distrib, Finset.sum_add_distrib, Finset.sum_add_distrib,
      hgrad_sum, hquad_sum, hg_sum]
    simp [Finset.sum_const, nsmul_eq_mul]
  calc
    nextValue
        ≤ (1 / (D : ℝ)) * ∑ i : Fin D, blockValue i := hnext
    _ ≤ (1 / (D : ℝ)) *
          ∑ i : Fin D, (Fx + gradTerm i + quadTerm i + gReplace i) := hscaled
    _ = Fx + (1 / (D : ℝ)) * lin + (1 / (2 * (D : ℝ))) * normSq +
          (((D : ℝ) - 1) / (D : ℝ)) * Gx + (1 / (D : ℝ)) * Gy := by
          rw [hsum_model]
          field_simp [hD_real.ne']
          ring

/--
The averaged model display in Chewi's RAM proof implies the conditional gap
upper bound used by the Hopf-Lax certificates.  The assumptions `hfirst` and
`hmodel` are respectively the source first-order convexity step for `f` and
the selected Hopf-Lax/Moreau model value.
-/
theorem chewi115_conditional_gap_upper_of_averaged_model
    {D : ℕ} (hD : 0 < D)
    {nextValue Fx Gx Fy Gy modelValue fstar lin normSq alphaF : ℝ}
    (havg :
      nextValue ≤
        Fx + (1 / (D : ℝ)) * lin + (1 / (2 * (D : ℝ))) * normSq +
          (((D : ℝ) - 1) / (D : ℝ)) * Gx + (1 / (D : ℝ)) * Gy)
    (hfirst : Fx + lin + (alphaF / 2) * normSq ≤ Fy)
    (hmodel : Fy + Gy + ((1 - alphaF) / 2) * normSq ≤ modelValue) :
    nextValue - fstar ≤
      (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx - fstar) +
        (1 / (D : ℝ)) * (modelValue - fstar) := by
  have hD_real : 0 < (D : ℝ) := by exact_mod_cast hD
  have hfirst_scaled :
      (1 / (D : ℝ)) * (Fx + lin + (alphaF / 2) * normSq) ≤
        (1 / (D : ℝ)) * Fy :=
    mul_le_mul_of_nonneg_left hfirst (by positivity)
  have hmodel_scaled :
      (1 / (D : ℝ)) * (Fy + Gy + ((1 - alphaF) / 2) * normSq) ≤
        (1 / (D : ℝ)) * modelValue :=
    mul_le_mul_of_nonneg_left hmodel (by positivity)
  have hupper :
      nextValue ≤
        (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx) +
          (1 / (D : ℝ)) * modelValue := by
    have hsplit :
        Fx + (1 / (D : ℝ)) * lin + (1 / (2 * (D : ℝ))) * normSq +
            (((D : ℝ) - 1) / (D : ℝ)) * Gx + (1 / (D : ℝ)) * Gy =
          (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx) +
            (1 / (D : ℝ)) * (Fx + lin + (alphaF / 2) * normSq) +
            (1 / (D : ℝ)) * (Gy + ((1 - alphaF) / 2) * normSq) := by
      field_simp [hD_real.ne']
      ring
    have hmodel_scaled' :
        (1 / (D : ℝ)) * Fy +
            (1 / (D : ℝ)) * (Gy + ((1 - alphaF) / 2) * normSq) ≤
          (1 / (D : ℝ)) * modelValue := by
      calc
        (1 / (D : ℝ)) * Fy +
            (1 / (D : ℝ)) * (Gy + ((1 - alphaF) / 2) * normSq)
            = (1 / (D : ℝ)) *
                (Fy + Gy + ((1 - alphaF) / 2) * normSq) := by ring
        _ ≤ (1 / (D : ℝ)) * modelValue := hmodel_scaled
    calc
      nextValue
          ≤ Fx + (1 / (D : ℝ)) * lin + (1 / (2 * (D : ℝ))) * normSq +
              (((D : ℝ) - 1) / (D : ℝ)) * Gx + (1 / (D : ℝ)) * Gy := havg
      _ = (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx) +
            (1 / (D : ℝ)) * (Fx + lin + (alphaF / 2) * normSq) +
            (1 / (D : ℝ)) * (Gy + ((1 - alphaF) / 2) * normSq) := hsplit
      _ ≤ (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx) +
            (1 / (D : ℝ)) * Fy +
            (1 / (D : ℝ)) * (Gy + ((1 - alphaF) / 2) * normSq) := by
          nlinarith [hfirst_scaled]
      _ ≤ (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx) +
            (1 / (D : ℝ)) * modelValue := by
          nlinarith [hmodel_scaled']
  calc
    nextValue - fstar
        ≤ ((((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx) +
            (1 / (D : ℝ)) * modelValue) - fstar := by
          exact sub_le_sub_right hupper fstar
    _ = (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx - fstar) +
          (1 / (D : ℝ)) * (modelValue - fstar) := by
          field_simp [hD_real.ne']
          ring

/--
Source-shaped one-step conditional gap bound from pointwise block models.  This
combines the uniform block averaging, the first-order convexity step, and the
selected Hopf-Lax model value into the exact `conditional_upper` field used by
the RAM certificates.
-/
theorem chewi115_conditional_gap_upper_of_block_model
    {D : ℕ} (hD : 0 < D)
    {nextValue Fx Gx Fy Gy modelValue fstar lin normSq alphaF : ℝ}
    {blockValue gradTerm quadTerm gReplace : Fin D -> ℝ}
    (hnext :
      nextValue ≤
        (1 / (D : ℝ)) * ∑ i : Fin D, blockValue i)
    (hblock : ∀ i : Fin D,
      blockValue i ≤ Fx + gradTerm i + quadTerm i + gReplace i)
    (hgrad_sum : (∑ i : Fin D, gradTerm i) = lin)
    (hquad_sum : (∑ i : Fin D, quadTerm i) = normSq / 2)
    (hg_sum : (∑ i : Fin D, gReplace i) = ((D : ℝ) - 1) * Gx + Gy)
    (hfirst : Fx + lin + (alphaF / 2) * normSq ≤ Fy)
    (hmodel : Fy + Gy + ((1 - alphaF) / 2) * normSq ≤ modelValue) :
    nextValue - fstar ≤
      (((D : ℝ) - 1) / (D : ℝ)) * (Fx + Gx - fstar) +
        (1 / (D : ℝ)) * (modelValue - fstar) :=
  chewi115_conditional_gap_upper_of_averaged_model (D := D) hD
    (chewi115_uniform_average_le_of_block_model (D := D) hD
      hnext hblock hgrad_sum hquad_sum hg_sum)
    hfirst hmodel

/--
Sequence form of the RAM conditional upper bound.  This is the source-facing
handoff from per-iteration block model estimates to the `conditional_upper`
field of the strong and weak Hopf-Lax RAM certificates.
-/
theorem chewi115_conditional_upper_of_block_model_sequence
    {D : ℕ} (hD : 0 < D)
    {expectedGap hopfGap nextValue Fx Gx Fy Gy modelValue lin normSq alphaF :
      ℕ -> ℝ}
    {fstar : ℝ}
    {blockValue gradTerm quadTerm gReplace : ℕ -> Fin D -> ℝ}
    (hgap : ∀ n, expectedGap n = Fx n + Gx n - fstar)
    (hnext_gap : ∀ n, expectedGap (n + 1) = nextValue n - fstar)
    (hhopf_gap : ∀ n, hopfGap n = modelValue n - fstar)
    (hnext :
      ∀ n,
        nextValue n ≤
          (1 / (D : ℝ)) * ∑ i : Fin D, blockValue n i)
    (hblock : ∀ n i,
      blockValue n i ≤
        Fx n + gradTerm n i + quadTerm n i + gReplace n i)
    (hgrad_sum : ∀ n, (∑ i : Fin D, gradTerm n i) = lin n)
    (hquad_sum : ∀ n, (∑ i : Fin D, quadTerm n i) = normSq n / 2)
    (hg_sum : ∀ n,
      (∑ i : Fin D, gReplace n i) = ((D : ℝ) - 1) * Gx n + Gy n)
    (hfirst : ∀ n, Fx n + lin n + (alphaF n / 2) * normSq n ≤ Fy n)
    (hmodel : ∀ n,
      Fy n + Gy n + ((1 - alphaF n) / 2) * normSq n ≤ modelValue n) :
    ∀ n,
      expectedGap (n + 1) ≤
        (((D : ℝ) - 1) / (D : ℝ)) * expectedGap n +
          (1 / (D : ℝ)) * hopfGap n := by
  intro n
  have hstep :=
    chewi115_conditional_gap_upper_of_block_model (D := D) hD
      (nextValue := nextValue n) (Fx := Fx n) (Gx := Gx n)
      (Fy := Fy n) (Gy := Gy n) (modelValue := modelValue n)
      (fstar := fstar) (lin := lin n) (normSq := normSq n)
      (alphaF := alphaF n) (blockValue := blockValue n)
      (gradTerm := gradTerm n) (quadTerm := quadTerm n)
      (gReplace := gReplace n)
      (hnext n) (hblock n) (hgrad_sum n) (hquad_sum n) (hg_sum n)
      (hfirst n) (hmodel n)
  simpa [hgap n, hnext_gap n, hhopf_gap n] using hstep

/--
The Jensen-shaped zero-curvature RAM recurrence is exactly the quadratic
inverse-gap recurrence with denominator `K`.
-/
theorem chewi115_zero_quadratic_recurrence_of_jensen {K g g' : ℝ}
    (hrec : g' ≤ (1 - g / K) * g) :
    g' ≤ g - g ^ (2 : ℕ) / K := by
  calc
    g' ≤ (1 - g / K) * g := hrec
    _ = g - g ^ (2 : ℕ) / K := by ring

/--
Zero-curvature RAM scalar rate from the expected-gap recurrence in Chewi's
proof.  This reuses the inverse-gap telescope from the deterministic AM layer.
-/
theorem chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence
    {expectedGap : ℕ -> ℝ} {K : ℝ} {n0 M : ℕ}
    (hK : 0 < K) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < expectedGap (n0 + m))
    (hrec : ∀ m, m < M ->
      expectedGap (n0 + (m + 1)) ≤
        (1 - expectedGap (n0 + m) / K) * expectedGap (n0 + m)) :
    expectedGap (n0 + M) ≤ K / (M : ℝ) :=
  chewi114_gap_le_K_div_iterations_of_quadratic_descent
    (gap := expectedGap) (K := K) (n0 := n0) (M := M)
    hK hM hpos
    (fun m hm =>
      chewi115_zero_quadratic_recurrence_of_jensen
        (K := K) (g := expectedGap (n0 + m))
        (g' := expectedGap (n0 + (m + 1))) (hrec m hm))

/--
Zero-curvature RAM scalar rate without a strict-positivity side condition.  If
the expected gap ever reaches zero, nonnegativity and the recurrence keep it at
zero; otherwise the positive inverse-gap telescope applies.
-/
theorem chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence_nonneg
    {expectedGap : ℕ -> ℝ} {K : ℝ} {n0 M : ℕ}
    (hK : 0 < K) (hM : M ≠ 0)
    (hnonneg : ∀ m, m ≤ M -> 0 ≤ expectedGap (n0 + m))
    (hrec : ∀ m, m < M ->
      expectedGap (n0 + (m + 1)) ≤
        (1 - expectedGap (n0 + m) / K) * expectedGap (n0 + m)) :
    expectedGap (n0 + M) ≤ K / (M : ℝ) := by
  classical
  by_cases hzero : ∃ m, m ≤ M ∧ expectedGap (n0 + m) = 0
  · rcases hzero with ⟨b, hbM, hbzero⟩
    have hzero_tail :
        ∀ k, b + k ≤ M -> expectedGap (n0 + (b + k)) = 0 := by
      intro k
      induction k with
      | zero =>
          intro _hk
          simpa using hbzero
      | succ k ih =>
          intro hbk
          have hbk_prev : b + k ≤ M := by omega
          have hlt : b + k < M := by omega
          have hprev : expectedGap (n0 + (b + k)) = 0 := ih hbk_prev
          have hstep := hrec (b + k) hlt
          have hstep' :
              expectedGap (n0 + (b + (k + 1))) ≤ 0 := by
            simpa [Nat.add_assoc, hprev] using hstep
          exact le_antisymm hstep' (hnonneg (b + (k + 1)) hbk)
    have hMzero : expectedGap (n0 + M) = 0 := by
      have htail := hzero_tail (M - b) (by omega)
      have hidx : b + (M - b) = M := by omega
      simpa [hidx] using htail
    have hdiv_nonneg : 0 ≤ K / (M : ℝ) := by
      have hM_pos : 0 < (M : ℝ) := by exact_mod_cast Nat.pos_of_ne_zero hM
      positivity
    simpa [hMzero] using hdiv_nonneg
  · have hpos : ∀ m, m ≤ M -> 0 < expectedGap (n0 + m) := by
      intro m hm
      have hne : expectedGap (n0 + m) ≠ 0 := by
        intro hz
        exact hzero ⟨m, hm, hz⟩
      exact lt_of_le_of_ne (hnonneg m hm) (by
        intro h
        exact hne h.symm)
    exact chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence
      (expectedGap := expectedGap) (K := K) (n0 := n0) (M := M)
      hK hM hpos hrec

/--
Source-denominator form of the zero-curvature RAM expected-gap rate:
`E gap_N <= 2 * D * R_beta^2 / N`.
-/
theorem chewi115_zero_expected_gap_le_source_rate_of_recurrence
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta : ℝ}
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < expectedGap (n0 + m))
    (hrec : ∀ m, m < M ->
      expectedGap (n0 + (m + 1)) ≤
        (1 - expectedGap (n0 + m) / chewi115ZeroK D Rbeta) *
          expectedGap (n0 + m)) :
    expectedGap (n0 + M) ≤ chewi115ZeroK D Rbeta / (M : ℝ) :=
  chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence
    (expectedGap := expectedGap) (K := chewi115ZeroK D Rbeta)
    (n0 := n0) (M := M) (chewi115ZeroK_pos hD hRbeta) hM hpos hrec

/--
Source-denominator zero-curvature RAM rate using only nonnegativity of the
expected gap.
-/
theorem chewi115_zero_expected_gap_le_source_rate_of_recurrence_nonneg
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta : ℝ}
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hnonneg : ∀ m, m ≤ M -> 0 ≤ expectedGap (n0 + m))
    (hrec : ∀ m, m < M ->
      expectedGap (n0 + (m + 1)) ≤
        (1 - expectedGap (n0 + m) / chewi115ZeroK D Rbeta) *
          expectedGap (n0 + m)) :
    expectedGap (n0 + M) ≤ chewi115ZeroK D Rbeta / (M : ℝ) :=
  chewi115_zero_expected_gap_le_K_div_iterations_of_recurrence_nonneg
    (expectedGap := expectedGap) (K := chewi115ZeroK D Rbeta)
    (n0 := n0) (M := M) (chewi115ZeroK_pos hD hRbeta) hM hnonneg hrec

/-- Epsilon form of the zero-curvature RAM expected-gap rate. -/
theorem chewi115_zero_expected_gap_le_eps_of_recurrence
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta eps : ℝ}
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < expectedGap (n0 + m))
    (hrec : ∀ m, m < M ->
      expectedGap (n0 + (m + 1)) ≤
        (1 - expectedGap (n0 + m) / chewi115ZeroK D Rbeta) *
          expectedGap (n0 + m))
    (hK_div_le : chewi115ZeroK D Rbeta / (M : ℝ) ≤ eps) :
    expectedGap (n0 + M) ≤ eps :=
  (chewi115_zero_expected_gap_le_source_rate_of_recurrence
    (expectedGap := expectedGap) (D := D) (n0 := n0) (M := M)
    (Rbeta := Rbeta) hD hRbeta hM hpos hrec).trans hK_div_le

/-- Epsilon form using only nonnegativity of the expected gap. -/
theorem chewi115_zero_expected_gap_le_eps_of_recurrence_nonneg
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta eps : ℝ}
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hnonneg : ∀ m, m ≤ M -> 0 ≤ expectedGap (n0 + m))
    (hrec : ∀ m, m < M ->
      expectedGap (n0 + (m + 1)) ≤
        (1 - expectedGap (n0 + m) / chewi115ZeroK D Rbeta) *
          expectedGap (n0 + m))
    (hK_div_le : chewi115ZeroK D Rbeta / (M : ℝ) ≤ eps) :
    expectedGap (n0 + M) ≤ eps :=
  (chewi115_zero_expected_gap_le_source_rate_of_recurrence_nonneg
    (expectedGap := expectedGap) (D := D) (n0 := n0) (M := M)
    (Rbeta := Rbeta) hD hRbeta hM hnonneg hrec).trans hK_div_le

/--
Source-shaped zero-curvature RAM gap certificate after Jensen in Chewi Theorem
11.5.  The `gap_nonneg` field records the expectation gap invariant; the
strict-positivity hypothesis in the rate theorem can later be removed by a
zero-hit induction wrapper.
-/
structure IsChewi115RAMZeroGapCertificate
    (expectedGap : ℕ -> ℝ) (D : ℕ) (Rbeta : ℝ) : Prop where
  gap_nonneg : ∀ n, 0 ≤ expectedGap n
  one_step : ∀ n,
    expectedGap (n + 1) ≤
      (1 - expectedGap n / chewi115ZeroK D Rbeta) * expectedGap n

/-- The zero-curvature RAM certificate gives the source `2 D R_beta^2 / N` rate. -/
theorem IsChewi115RAMZeroGapCertificate.gap_le_source_rate
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta : ℝ}
    (hcert : IsChewi115RAMZeroGapCertificate expectedGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < expectedGap (n0 + m)) :
    expectedGap (n0 + M) ≤ chewi115ZeroK D Rbeta / (M : ℝ) :=
  chewi115_zero_expected_gap_le_source_rate_of_recurrence
    (expectedGap := expectedGap) (D := D) (n0 := n0) (M := M)
    (Rbeta := Rbeta) hD hRbeta hM hpos
    (fun m hm => by
      simpa [Nat.add_assoc] using hcert.one_step (n0 + m))

/--
The zero-curvature RAM certificate gives the source rate without a
strict-positivity side condition.
-/
theorem IsChewi115RAMZeroGapCertificate.gap_le_source_rate_nonneg
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta : ℝ}
    (hcert : IsChewi115RAMZeroGapCertificate expectedGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0) :
    expectedGap (n0 + M) ≤ chewi115ZeroK D Rbeta / (M : ℝ) :=
  chewi115_zero_expected_gap_le_source_rate_of_recurrence_nonneg
    (expectedGap := expectedGap) (D := D) (n0 := n0) (M := M)
    (Rbeta := Rbeta) hD hRbeta hM
    (fun m _hm => hcert.gap_nonneg (n0 + m))
    (fun m hm => by
      simpa [Nat.add_assoc] using hcert.one_step (n0 + m))

/-- Epsilon form of the zero-curvature RAM certificate rate. -/
theorem IsChewi115RAMZeroGapCertificate.gap_le_eps
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta eps : ℝ}
    (hcert : IsChewi115RAMZeroGapCertificate expectedGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hpos : ∀ m, m ≤ M -> 0 < expectedGap (n0 + m))
    (hK_div_le : chewi115ZeroK D Rbeta / (M : ℝ) ≤ eps) :
    expectedGap (n0 + M) ≤ eps :=
  (hcert.gap_le_source_rate hD hRbeta hM hpos).trans hK_div_le

/-- Epsilon form of the nonnegative zero-curvature RAM certificate rate. -/
theorem IsChewi115RAMZeroGapCertificate.gap_le_eps_nonneg
    {expectedGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta eps : ℝ}
    (hcert : IsChewi115RAMZeroGapCertificate expectedGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hK_div_le : chewi115ZeroK D Rbeta / (M : ℝ) ≤ eps) :
    expectedGap (n0 + M) ≤ eps :=
  (hcert.gap_le_source_rate_nonneg hD hRbeta hM).trans hK_div_le

/--
Algebraic bridge from Chewi's conditional-expectation/Hopf-Lax display to the
zero-curvature RAM one-step recurrence.
-/
theorem chewi115_zero_one_step_of_hopf_lax_gap_bound
    {nextGap gap hopfGap Rbeta : ℝ} {D : ℕ}
    (hD : 0 < D) (hRbeta : 0 < Rbeta)
    (hcond :
      nextGap ≤
        (((D : ℝ) - 1) / (D : ℝ)) * gap + (1 / (D : ℝ)) * hopfGap)
    (hhopf : hopfGap ≤ (1 - gap / (2 * Rbeta ^ (2 : ℕ))) * gap) :
    nextGap ≤ (1 - gap / chewi115ZeroK D Rbeta) * gap := by
  have hD_real : 0 < (D : ℝ) := by exact_mod_cast hD
  have hR_sq_pos : 0 < Rbeta ^ (2 : ℕ) := pow_pos hRbeta _
  have hscale :
      (1 / (D : ℝ)) * hopfGap ≤
        (1 / (D : ℝ)) * ((1 - gap / (2 * Rbeta ^ (2 : ℕ))) * gap) :=
    mul_le_mul_of_nonneg_left hhopf (by positivity)
  calc
    nextGap
        ≤ (((D : ℝ) - 1) / (D : ℝ)) * gap + (1 / (D : ℝ)) * hopfGap :=
          hcond
    _ ≤ (((D : ℝ) - 1) / (D : ℝ)) * gap +
          (1 / (D : ℝ)) * ((1 - gap / (2 * Rbeta ^ (2 : ℕ))) * gap) := by
          exact add_le_add le_rfl hscale
    _ = (1 - gap / chewi115ZeroK D Rbeta) * gap := by
          rw [chewi115ZeroK]
          field_simp [hD_real.ne', hR_sq_pos.ne']
          ring

/--
Source-shaped zero-curvature RAM bridge certificate: the conditional
expectation upper bound plus the weak Hopf-Lax/Jensen estimate from the proof
of Theorem 11.5.
-/
structure IsChewi115RAMZeroHopfLaxCertificate
    (expectedGap hopfGap : ℕ -> ℝ) (D : ℕ) (Rbeta : ℝ) : Prop where
  gap_nonneg : ∀ n, 0 ≤ expectedGap n
  conditional_upper : ∀ n,
    expectedGap (n + 1) ≤
      (((D : ℝ) - 1) / (D : ℝ)) * expectedGap n +
        (1 / (D : ℝ)) * hopfGap n
  hopf_lax_bound : ∀ n,
    hopfGap n ≤
      (1 - expectedGap n / (2 * Rbeta ^ (2 : ℕ))) * expectedGap n

/-- The weak Hopf-Lax bridge supplies the zero-curvature RAM gap certificate. -/
theorem IsChewi115RAMZeroHopfLaxCertificate.toGapCertificate
    {expectedGap hopfGap : ℕ -> ℝ} {D : ℕ} {Rbeta : ℝ}
    (hcert : IsChewi115RAMZeroHopfLaxCertificate expectedGap hopfGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) :
    IsChewi115RAMZeroGapCertificate expectedGap D Rbeta := by
  refine ⟨hcert.gap_nonneg, ?_⟩
  intro n
  exact chewi115_zero_one_step_of_hopf_lax_gap_bound
    (D := D) (Rbeta := Rbeta)
    hD hRbeta (hcert.conditional_upper n) (hcert.hopf_lax_bound n)

/-- Source-rate weak RAM bound directly from the weak Hopf-Lax bridge. -/
theorem IsChewi115RAMZeroHopfLaxCertificate.gap_le_source_rate_nonneg
    {expectedGap hopfGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta : ℝ}
    (hcert : IsChewi115RAMZeroHopfLaxCertificate expectedGap hopfGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0) :
    expectedGap (n0 + M) ≤ chewi115ZeroK D Rbeta / (M : ℝ) :=
  (hcert.toGapCertificate hD hRbeta).gap_le_source_rate_nonneg hD hRbeta hM

/-- Epsilon weak RAM bound directly from the weak Hopf-Lax bridge. -/
theorem IsChewi115RAMZeroHopfLaxCertificate.gap_le_eps_nonneg
    {expectedGap hopfGap : ℕ -> ℝ} {D n0 M : ℕ} {Rbeta eps : ℝ}
    (hcert : IsChewi115RAMZeroHopfLaxCertificate expectedGap hopfGap D Rbeta)
    (hD : 0 < D) (hRbeta : 0 < Rbeta) (hM : M ≠ 0)
    (hK_div_le : chewi115ZeroK D Rbeta / (M : ℝ) ≤ eps) :
    expectedGap (n0 + M) ≤ eps :=
  (hcert.gap_le_source_rate_nonneg hD hRbeta hM).trans hK_div_le

end

end Optimization
end StatInference
