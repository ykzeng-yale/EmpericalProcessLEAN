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

end

end Optimization
end StatInference
