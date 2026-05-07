import StatInference.AsymptoticStatistics.Basic

/-!
# van der Vaart 1998 Chapter 5 M-estimator consistency

This module starts the Chapter 5 lane for M- and Z-estimators.  The first
packet packages the deterministic core of Theorem 5.7 and a high-probability
certificate form of the resulting consistency statement.
-/

noncomputable section

namespace StatInference
namespace AsymptoticStatistics

open Filter MeasureTheory
open scoped Topology

universe u v

/--
van der Vaart 1998, Theorem 5.7 deterministic gap bound.

If a random criterion `Mn` is uniformly within `deviation` of its deterministic
limit `M`, and `thetaHat` is an `approxError`-approximate maximizer relative to
`theta0`, then the population criterion gap at `thetaHat` is controlled by the
usual `2 * deviation + approxError` oracle term.
-/
theorem vaart1998_theorem_5_7_populationCriterion_gap_le_of_uniformDeviation_approxMax
    {Θ : Type u} (M Mn : Θ -> ℝ) (thetaHat theta0 : Θ)
    (deviation approxError : ℝ)
    (h_uniform : ∀ theta : Θ, |Mn theta - M theta| ≤ deviation)
    (h_approx : Mn theta0 ≤ Mn thetaHat + approxError) :
    M theta0 - M thetaHat ≤ 2 * deviation + approxError := by
  have htheta0 : M theta0 ≤ Mn theta0 + deviation := by
    have h := (abs_le.mp (h_uniform theta0)).1
    nlinarith
  have hhat : Mn thetaHat ≤ M thetaHat + deviation := by
    have h := (abs_le.mp (h_uniform thetaHat)).2
    nlinarith
  nlinarith

/--
Separated-maximum form of Theorem 5.7.

Once the oracle term is smaller than the separation gap, the approximate
maximizer cannot lie outside the prescribed distance ball.
-/
theorem vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax
    {Θ : Type u} [PseudoMetricSpace Θ]
    (M Mn : Θ -> ℝ) (thetaHat theta0 : Θ)
    (deviation approxError epsilon eta : ℝ)
    (h_uniform : ∀ theta : Θ, |Mn theta - M theta| ≤ deviation)
    (h_approx : Mn theta0 ≤ Mn thetaHat + approxError)
    (h_separated :
      ∀ theta : Θ, epsilon ≤ dist theta theta0 -> M theta ≤ M theta0 - eta)
    (h_small : 2 * deviation + approxError < eta) :
    dist thetaHat theta0 < epsilon := by
  by_contra hnot
  have hbad : epsilon ≤ dist thetaHat theta0 := le_of_not_gt hnot
  have hgap :=
    vaart1998_theorem_5_7_populationCriterion_gap_le_of_uniformDeviation_approxMax
      M Mn thetaHat theta0 deviation approxError h_uniform h_approx
  have hsep_hat := h_separated thetaHat hbad
  have heta_le_gap : eta ≤ M theta0 - M thetaHat := by
    nlinarith
  exact (not_lt_of_ge heta_le_gap) (lt_of_le_of_lt hgap h_small)

/--
High-probability certificate for van der Vaart Theorem 5.7.

The event `good n` carries the uniform criterion approximation and the
approximate-maximizer inequality.  Its probability tends to one, while the
deterministic deviation and approximation radii tend to zero.
-/
structure Vaart1998MEstimatorUniformConsistencyCertificate
    (Ω : Type u) (Θ : Type v) [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    (P : Measure Ω) (M : Θ -> ℝ) (Mn : ℕ -> Ω -> Θ -> ℝ)
    (theta0 : Θ) (thetaHat : ℕ -> Ω -> Θ) where
  good : ℕ -> Set Ω
  good_measurable : ∀ n : ℕ, MeasurableSet (good n)
  good_probability : Tendsto (fun n : ℕ => P.real (good n)) atTop (𝓝 1)
  deviation : ℕ -> ℝ
  approxError : ℕ -> ℝ
  deviation_tendsto_zero : Tendsto deviation atTop (𝓝 0)
  approxError_tendsto_zero : Tendsto approxError atTop (𝓝 0)
  uniform_deviation_on_good :
    ∀ n : ℕ, ∀ omega : Ω, omega ∈ good n ->
      ∀ theta : Θ, |Mn n omega theta - M theta| ≤ deviation n
  approximate_maximizer_on_good :
    ∀ n : ℕ, ∀ omega : Ω, omega ∈ good n ->
      Mn n omega theta0 ≤ Mn n omega (thetaHat n omega) + approxError n
  separated_maximum :
    ∀ epsilon : ℝ, 0 < epsilon ->
      ∃ eta : ℝ, 0 < eta ∧
        ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
          M theta ≤ M theta0 - eta

namespace Vaart1998MEstimatorUniformConsistencyCertificate

theorem oracleBound_tendsto_zero
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} {M : Θ -> ℝ} {Mn : ℕ -> Ω -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (C :
      Vaart1998MEstimatorUniformConsistencyCertificate
        Ω Θ P M Mn theta0 thetaHat) :
    Tendsto (fun n : ℕ => 2 * C.deviation n + C.approxError n)
      atTop (𝓝 0) :=
  oracle_bound_tendsto_zero C.approxError C.deviation
    C.deviation_tendsto_zero C.approxError_tendsto_zero

end Vaart1998MEstimatorUniformConsistencyCertificate

/--
van der Vaart 1998, Theorem 5.7, consistency of approximate M-estimators.

This is the convergence-in-probability handoff from a uniform-consistency
certificate and a well-separated population maximum.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_uniformConsistencyCertificate
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {Mn : ℕ -> Ω -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (C :
      Vaart1998MEstimatorUniformConsistencyCertificate
        Ω Θ P M Mn theta0 thetaHat) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_dist]
  intro epsilon hepsilon
  rcases C.separated_maximum epsilon hepsilon with
    ⟨eta, heta_pos, h_separated⟩
  have hbound_tendsto :=
    C.oracleBound_tendsto_zero
  have hsmall :
      ∀ᶠ n : ℕ in atTop, 2 * C.deviation n + C.approxError n < eta :=
    hbound_tendsto.eventually_lt_const heta_pos
  have hcompl_tendsto :
      Tendsto (fun n : ℕ => P.real ((C.good n)ᶜ)) atTop (𝓝 0) := by
    have hsub :
        Tendsto (fun n : ℕ => (1 : ℝ) - P.real (C.good n))
          atTop (𝓝 0) := by
      have hconst : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 1) :=
        tendsto_const_nhds
      simpa using (hconst.sub C.good_probability)
    refine hsub.congr' ?_
    exact Eventually.of_forall fun n : ℕ => by
      have hsum :
          P.real (C.good n) + P.real ((C.good n)ᶜ) = 1 :=
        probReal_add_probReal_compl (μ := P) (C.good_measurable n)
      linarith
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le ha measureReal_nonneg
  · intro a ha
    filter_upwards [hsmall, hcompl_tendsto.eventually_lt_const ha] with n hsmall_n hcompl_n
    have hbad_subset :
        {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ⊆
          (C.good n)ᶜ := by
      intro omega hbad hgood
      have hdist_lt :
          dist (thetaHat n omega) theta0 < epsilon :=
        vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax
          M (Mn n omega) (thetaHat n omega) theta0
          (C.deviation n) (C.approxError n) epsilon eta
          (C.uniform_deviation_on_good n omega hgood)
          (C.approximate_maximizer_on_good n omega hgood)
          h_separated hsmall_n
      exact (not_le_of_gt hdist_lt) hbad
    exact lt_of_le_of_lt (measureReal_mono hbad_subset) hcompl_n

end AsymptoticStatistics
end StatInference
