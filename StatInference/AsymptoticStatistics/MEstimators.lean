import StatInference.AsymptoticStatistics.Basic
import StatInference.EmpiricalProcess.Average
import StatInference.EmpiricalProcess.Basic
import StatInference.EmpiricalProcess.GlivenkoCantelli

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
open scoped BigOperators
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

/--
Build the Theorem 5.7 high-probability certificate from a deterministic
uniform-deviation sequence.  The good event is `Set.univ` at every sample size.
-/
def of_empiricalDeviationSequence_univ
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {deterministicCriterion : ℕ -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (deviation approxError : ℕ -> ℝ)
    (h_deviation :
      EmpiricalDeviationSequence M deterministicCriterion deviation)
    (h_deviation_tendsto : Tendsto deviation atTop (𝓝 0))
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        deterministicCriterion n theta0 ≤
          deterministicCriterion n (thetaHat n omega) + approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    Vaart1998MEstimatorUniformConsistencyCertificate
      Ω Θ P M (fun n _omega theta => deterministicCriterion n theta)
      theta0 thetaHat where
  good := fun _n => Set.univ
  good_measurable := fun _n => MeasurableSet.univ
  good_probability := by
    simp
  deviation := deviation
  approxError := approxError
  deviation_tendsto_zero := h_deviation_tendsto
  approxError_tendsto_zero := h_approx_tendsto
  uniform_deviation_on_good := by
    intro n _omega _hgood theta
    exact h_deviation n theta
  approximate_maximizer_on_good := by
    intro n omega _hgood
    exact h_approx n omega
  separated_maximum := h_separated

/--
Build the Theorem 5.7 certificate from a full-class Glivenko-Cantelli
interface.  This is the direct Chapter 5 handoff from the local empirical
process `GlivenkoCantelliClass` record.
-/
def of_glivenkoCantelliClass_univ
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {deterministicCriterion : ℕ -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (gc :
      GlivenkoCantelliClass (Set.univ : Set Θ) M deterministicCriterion)
    (approxError : ℕ -> ℝ)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        deterministicCriterion n theta0 ≤
          deterministicCriterion n (thetaHat n omega) + approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    Vaart1998MEstimatorUniformConsistencyCertificate
      Ω Θ P M (fun n _omega theta => deterministicCriterion n theta)
      theta0 thetaHat :=
  of_empiricalDeviationSequence_univ
    (deviation := gc.radius) (approxError := approxError)
    gc.toEmpiricalDeviationSequence gc.radius_tendsto_zero
    h_approx h_approx_tendsto h_separated

/--
Build the Theorem 5.7 certificate from a finite-class uniform-convergence
interface on the full parameter class.
-/
def of_finiteClassUniformConvergence_univ
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {deterministicCriterion : ℕ -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (finite_gc :
      FiniteClassUniformConvergence (Set.univ : Set Θ) M deterministicCriterion)
    (approxError : ℕ -> ℝ)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        deterministicCriterion n theta0 ≤
          deterministicCriterion n (thetaHat n omega) + approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    Vaart1998MEstimatorUniformConsistencyCertificate
      Ω Θ P M (fun n _omega theta => deterministicCriterion n theta)
      theta0 thetaHat :=
  of_glivenkoCantelliClass_univ
    finite_gc.toGlivenkoCantelliClass approxError h_approx
    h_approx_tendsto h_separated

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

/--
van der Vaart 1998, Theorem 5.7, GC-source consistency endpoint.

This packages the common deterministic-criterion case: a full-class
Glivenko-Cantelli radius and a vanishing approximate-maximizer error imply
consistency.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_glivenkoCantelliClass_univ
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {deterministicCriterion : ℕ -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (gc :
      GlivenkoCantelliClass (Set.univ : Set Θ) M deterministicCriterion)
    (approxError : ℕ -> ℝ)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        deterministicCriterion n theta0 ≤
          deterministicCriterion n (thetaHat n omega) + approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_7_mEstimator_consistent_of_uniformConsistencyCertificate
    (Vaart1998MEstimatorUniformConsistencyCertificate.of_glivenkoCantelliClass_univ
      gc approxError h_approx h_approx_tendsto h_separated)

/--
van der Vaart 1998, Theorem 5.7, finite-class source endpoint.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_finiteClassUniformConvergence_univ
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {deterministicCriterion : ℕ -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (finite_gc :
      FiniteClassUniformConvergence (Set.univ : Set Θ) M deterministicCriterion)
    (approxError : ℕ -> ℝ)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        deterministicCriterion n theta0 ≤
          deterministicCriterion n (thetaHat n omega) + approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_7_mEstimator_consistent_of_uniformConsistencyCertificate
    (Vaart1998MEstimatorUniformConsistencyCertificate.of_finiteClassUniformConvergence_univ
      finite_gc approxError h_approx h_approx_tendsto h_separated)

/--
van der Vaart 1998, Theorem 5.7, random uniform-error source endpoint.

This is the source-facing form for genuinely random empirical criteria.  A
uniform criterion error and an approximate-maximizer error that both converge
to zero in probability imply consistency under the separated-maximum condition.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_randomUniformErrors
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {Mn : ℕ -> Ω -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        |Mn n omega theta - M theta| ≤ uniformError n omega)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        Mn n omega theta0 ≤
          Mn n omega (thetaHat n omega) + approxError n omega)
    (h_uniform_tendsto : TendstoInMeasure P uniformError atTop 0)
    (h_approx_tendsto : TendstoInMeasure P approxError atTop 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_dist]
  intro epsilon hepsilon
  rcases h_separated epsilon hepsilon with
    ⟨eta, heta_pos, h_separated_eta⟩
  have h_eta_quarter : 0 < eta / 4 := by positivity
  have h_eta_half : 0 < eta / 2 := by positivity
  have h_uniform_tail :
      Tendsto
        (fun n : ℕ =>
          P.real {omega : Ω | eta / 4 ≤ ‖uniformError n omega - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm).mp
      h_uniform_tendsto (eta / 4) h_eta_quarter
  have h_approx_tail :
      Tendsto
        (fun n : ℕ =>
          P.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm).mp
      h_approx_tendsto (eta / 2) h_eta_half
  have h_tail_sum :
      Tendsto
        (fun n : ℕ =>
          P.real {omega : Ω | eta / 4 ≤ ‖uniformError n omega - 0‖} +
            P.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) := by
    simpa using h_uniform_tail.add h_approx_tail
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le ha measureReal_nonneg
  · intro a ha
    filter_upwards [h_tail_sum.eventually_lt_const ha] with n htail_lt
    let uniformTail : Set Ω :=
      {omega : Ω | eta / 4 ≤ ‖uniformError n omega - 0‖}
    let approxTail : Set Ω :=
      {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖}
    have hbad_subset :
        {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ⊆
          uniformTail ∪ approxTail := by
      intro omega hbad
      by_contra hnot
      have hnot_uniform : omega ∉ uniformTail := by
        exact fun hmem => hnot (Or.inl hmem)
      have hnot_approx : omega ∉ approxTail := by
        exact fun hmem => hnot (Or.inr hmem)
      have huniform_norm_lt :
          ‖uniformError n omega - 0‖ < eta / 4 :=
        lt_of_not_ge hnot_uniform
      have happrox_norm_lt :
          ‖approxError n omega - 0‖ < eta / 2 :=
        lt_of_not_ge hnot_approx
      have huniform_lt : uniformError n omega < eta / 4 := by
        have hle_norm :
            uniformError n omega ≤ ‖uniformError n omega - 0‖ := by
          simpa [sub_zero, Real.norm_eq_abs] using
            (le_abs_self (uniformError n omega))
        linarith
      have happrox_lt : approxError n omega < eta / 2 := by
        have hle_norm :
            approxError n omega ≤ ‖approxError n omega - 0‖ := by
          simpa [sub_zero, Real.norm_eq_abs] using
            (le_abs_self (approxError n omega))
        linarith
      have hsmall :
          2 * uniformError n omega + approxError n omega < eta := by
        nlinarith
      have hdist_lt :
          dist (thetaHat n omega) theta0 < epsilon :=
        vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax
          M (Mn n omega) (thetaHat n omega) theta0
          (uniformError n omega) (approxError n omega) epsilon eta
          (h_uniform n omega) (h_approx n omega)
          h_separated_eta hsmall
      exact (not_le_of_gt hdist_lt) hbad
    have hmeasure_le :
        P.real {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ≤
          P.real uniformTail + P.real approxTail :=
      (measureReal_mono hbad_subset).trans (measureReal_union_le _ _)
    exact lt_of_le_of_lt hmeasure_le htail_lt

/--
van der Vaart 1998, Theorem 5.7, VdV&W outer-probability random-error source
endpoint.

The empirical-process lane states many uniform laws in VdV&W
outer-probability language.  This wrapper converts those two outer-probability
error controls into the mathlib convergence-in-measure hypotheses consumed by
the random-uniform-error endpoint above.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_outerProbabilityUniformErrors
    {Ω : Type u} {Θ : Type v} [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {M : Θ -> ℝ} {Mn : ℕ -> Ω -> Θ -> ℝ}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        |Mn n omega theta - M theta| ≤ uniformError n omega)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        Mn n omega theta0 ≤
          Mn n omega (thetaHat n omega) + approxError n omega)
    (h_uniform_outer :
      VdVWConvergesInOuterProbability P uniformError atTop (fun _ : Ω => 0))
    (h_approx_outer :
      VdVWConvergesInOuterProbability P approxError atTop (fun _ : Ω => 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_7_mEstimator_consistent_of_randomUniformErrors
    uniformError approxError h_uniform h_approx
    (tendstoInMeasure_of_vdVWConvergesInOuterProbability h_uniform_outer)
    (tendstoInMeasure_of_vdVWConvergesInOuterProbability h_approx_outer)
    h_separated

/--
van der Vaart 1998, Theorem 5.7, empirical-average criterion endpoint.

This is the sample-average notation layer for criteria of the form
`P_n m_theta`.  A random uniform empirical-average error and a random
approximate-maximizer error that converge to zero in VdV&W outer probability
imply consistency under the separated-maximum condition.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_empiricalAverage_outerProbabilityUniformErrors
    {Ω : Type u} {Observation : Type*} {Θ : Type v}
    [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (loss : Θ -> Observation -> ℝ)
    {M : Θ -> ℝ} {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        |empiricalRiskOfLoss (samples n omega) loss theta - M theta| ≤
          uniformError n omega)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        empiricalRiskOfLoss (samples n omega) loss theta0 ≤
          empiricalRiskOfLoss (samples n omega) loss (thetaHat n omega) +
            approxError n omega)
    (h_uniform_outer :
      VdVWConvergesInOuterProbability P uniformError atTop (fun _ : Ω => 0))
    (h_approx_outer :
      VdVWConvergesInOuterProbability P approxError atTop (fun _ : Ω => 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            M theta ≤ M theta0 - eta) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_7_mEstimator_consistent_of_outerProbabilityUniformErrors
    (M := M)
    (Mn := fun n omega theta =>
      empiricalRiskOfLoss (samples n omega) loss theta)
    (theta0 := theta0) (thetaHat := thetaHat)
    uniformError approxError h_uniform h_approx
    h_uniform_outer h_approx_outer h_separated

/--
van der Vaart 1998, Theorem 5.7, direct VdV&W `P`-Glivenko-Cantelli
empirical-average endpoint.

This consumes the VdV&W outer-probability `P`-GC class predicate as an event
level uniform law.  Future users no longer need to introduce a separate random
uniform-error process when their criterion is the empirical average
`P_n m_theta`.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage
    {Ω : Type u} {Observation : Type*} {Θ : Type v}
    [MeasurableSpace Ω] [MeasurableSpace Observation] [PseudoMetricSpace Θ]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Pobs : Measure Observation}
    (X : ℕ -> Ω -> Observation) (loss : Θ -> Observation -> ℝ)
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (approxError : ℕ -> Ω -> ℝ)
    (h_gc :
      VdVWOuterProbabilityPGlivenkoCantelliClass μ Pobs (Set.univ : Set Θ)
        loss X)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        empiricalAverage (samplePath X omega n) (loss theta0) ≤
          empiricalAverage (samplePath X omega n) (loss (thetaHat n omega)) +
            approxError n omega)
    (h_approx_outer :
      VdVWConvergesInOuterProbability μ approxError atTop (fun _ : Ω => 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            populationRiskOfFunction Pobs (loss theta) ≤
              populationRiskOfFunction Pobs (loss theta0) - eta) :
    TendstoInMeasure μ thetaHat atTop (fun _ : Ω => theta0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_dist]
  intro epsilon hepsilon
  rcases h_separated epsilon hepsilon with
    ⟨eta, heta_pos, h_separated_eta⟩
  have h_eta_quarter : 0 < eta / 4 := by positivity
  have h_eta_half : 0 < eta / 2 := by positivity
  let M : Θ -> ℝ := fun theta => populationRiskOfFunction Pobs (loss theta)
  let empiricalRisk : Ω -> ℕ -> Θ -> ℝ :=
    fun omega n theta => empiricalAverage (samplePath X omega n) (loss theta)
  let gcBad : ℕ -> Set Ω := fun n =>
    {omega : Ω |
      ¬ EmpiricalDeviationBoundOn (Set.univ : Set Θ) M
        (empiricalRisk omega n) (eta / 4)}
  have h_gc_tail_enn :
      Tendsto
        (fun n : ℕ => VdVWOuterProbability μ (gcBad n))
        atTop (𝓝 0) := by
    simpa [VdVWOuterProbabilityPGlivenkoCantelliClass,
      VdVWOuterProbabilityUniformDeviationTendstoZeroOn, M, empiricalRisk,
      gcBad] using h_gc (eta / 4) h_eta_quarter
  have h_gc_tail_real :
      Tendsto (fun n : ℕ => μ.real (gcBad n)) atTop (𝓝 0) := by
    simpa [VdVWOuterProbability, Measure.real] using
      (ENNReal.tendsto_toReal ENNReal.zero_ne_top).comp h_gc_tail_enn
  have h_approx_tail :
      Tendsto
        (fun n : ℕ =>
          μ.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm).mp
      (tendstoInMeasure_of_vdVWConvergesInOuterProbability h_approx_outer)
      (eta / 2) h_eta_half
  have h_tail_sum :
      Tendsto
        (fun n : ℕ =>
          μ.real (gcBad n) +
            μ.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) := by
    simpa using h_gc_tail_real.add h_approx_tail
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le ha measureReal_nonneg
  · intro a ha
    filter_upwards [h_tail_sum.eventually_lt_const ha] with n htail_lt
    let approxTail : Set Ω :=
      {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖}
    have hbad_subset :
        {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ⊆
          gcBad n ∪ approxTail := by
      intro omega hbad
      by_contra hnot
      have hnot_gc : omega ∉ gcBad n := by
        exact fun hmem => hnot (Or.inl hmem)
      have hnot_approx : omega ∉ approxTail := by
        exact fun hmem => hnot (Or.inr hmem)
      have hgc_good :
          EmpiricalDeviationBoundOn (Set.univ : Set Θ) M
            (empiricalRisk omega n) (eta / 4) :=
        of_not_not hnot_gc
      have happrox_norm_lt :
          ‖approxError n omega - 0‖ < eta / 2 :=
        lt_of_not_ge hnot_approx
      have happrox_lt : approxError n omega < eta / 2 := by
        have hle_norm :
            approxError n omega ≤ ‖approxError n omega - 0‖ := by
          simpa [sub_zero, Real.norm_eq_abs] using
            (le_abs_self (approxError n omega))
        linarith
      have hsmall : 2 * (eta / 4) + approxError n omega < eta := by
        nlinarith
      have hdist_lt :
          dist (thetaHat n omega) theta0 < epsilon :=
        vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax
          M (empiricalRisk omega n) (thetaHat n omega) theta0
          (eta / 4) (approxError n omega) epsilon eta
          (fun theta => hgc_good theta trivial)
          (h_approx n omega)
          h_separated_eta hsmall
      exact (not_le_of_gt hdist_lt) hbad
    have hmeasure_le :
        μ.real {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ≤
          μ.real (gcBad n) + μ.real approxTail :=
      (measureReal_mono hbad_subset).trans (measureReal_union_le _ _)
    exact lt_of_le_of_lt hmeasure_le htail_lt

/--
van der Vaart 1998, Theorem 5.7, book-style VdV&W `P`-Glivenko-Cantelli
empirical-average endpoint.

The VdV&W predicate allows either an outer-probability or an outer-a.s. uniform
law.  In the outer-a.s. branch, countability and coordinate a.e.-measurability
convert it to the outer-probability branch before applying the direct
event-level consumer above.
-/
theorem vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWPGlivenkoCantelliClass_empiricalAverage
    {Ω : Type u} {Observation : Type*} {Θ : Type v}
    [MeasurableSpace Ω] [MeasurableSpace Observation] [PseudoMetricSpace Θ]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Pobs : Measure Observation}
    (X : ℕ -> Ω -> Observation) (loss : Θ -> Observation -> ℝ)
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (approxError : ℕ -> Ω -> ℝ)
    (h_gc :
      VdVWPGlivenkoCantelliClass μ Pobs (Set.univ : Set Θ) loss X)
    (h_count : (Set.univ : Set Θ).Countable)
    (h_empirical :
      ∀ sampleSize theta, theta ∈ (Set.univ : Set Θ) ->
        AEMeasurable
          (fun omega =>
            empiricalAverage (samplePath X omega sampleSize) (loss theta))
          μ)
    (h_approx :
      ∀ n : ℕ, ∀ omega : Ω,
        empiricalAverage (samplePath X omega n) (loss theta0) ≤
          empiricalAverage (samplePath X omega n) (loss (thetaHat n omega)) +
            approxError n omega)
    (h_approx_outer :
      VdVWConvergesInOuterProbability μ approxError atTop (fun _ : Ω => 0))
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            populationRiskOfFunction Pobs (loss theta) ≤
              populationRiskOfFunction Pobs (loss theta0) - eta) :
    TendstoInMeasure μ thetaHat atTop (fun _ : Ω => theta0) := by
  rcases h_gc with h_outer | h_outer_as
  · exact
      vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage
        (μ := μ) (Pobs := Pobs) X loss approxError h_outer h_approx
        h_approx_outer h_separated
  · exact
      vaart1998_theorem_5_7_mEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage
        (μ := μ) (Pobs := Pobs) X loss approxError
        (VdVWOuterProbabilityPGlivenkoCantelliClass_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalAverage
          (μ := μ) (P := Pobs) (indexClass := (Set.univ : Set Θ))
          (classFun := loss) (X := X) h_outer_as h_count h_empirical)
        h_approx h_approx_outer h_separated

/--
Norm-criterion uniform deviation used to reduce Z-estimator consistency to
M-estimator consistency.

For Theorem 5.9 we apply Theorem 5.7 to the criterion
`theta ↦ -‖Psi theta‖`.
-/
theorem vaart1998_theorem_5_9_normCriterion_uniformDeviation_of_vectorUniformDeviation
    {E : Type u} [NormedAddCommGroup E] (x y : E) {deviation : ℝ}
    (hxy : ‖x - y‖ ≤ deviation) :
    |(-‖x‖) - (-‖y‖)| ≤ deviation := by
  calc
    |(-‖x‖) - (-‖y‖)| = |-(‖x‖ - ‖y‖)| := by ring_nf
    _ = |‖x‖ - ‖y‖| := by rw [abs_neg]
    _ ≤ ‖x - y‖ := abs_norm_sub_norm_le x y
    _ ≤ deviation := hxy

/--
van der Vaart 1998, Theorem 5.9 deterministic separated-zero wrapper.

Uniform convergence of the estimating functions, an approximate zero, and
separation of the zero of the limit function force the estimator into the
epsilon-neighborhood.
-/
theorem vaart1998_theorem_5_9_dist_lt_of_uniformDeviation_nearZero
    {Θ : Type u} {E : Type v} [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    (Psi : Θ -> E) (Psi_n : Θ -> E) (thetaHat theta0 : Θ)
    (deviation approxError epsilon eta : ℝ)
    (h_uniform : ∀ theta : Θ, ‖Psi_n theta - Psi theta‖ ≤ deviation)
    (h_near_zero : ‖Psi_n thetaHat‖ ≤ approxError)
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ theta : Θ, epsilon ≤ dist theta theta0 -> eta ≤ ‖Psi theta‖)
    (h_small : 2 * deviation + approxError < eta) :
    dist thetaHat theta0 < epsilon := by
  refine
    vaart1998_theorem_5_7_dist_lt_of_uniformDeviation_approxMax
      (fun theta : Θ => -‖Psi theta‖)
      (fun theta : Θ => -‖Psi_n theta‖)
      thetaHat theta0 deviation approxError epsilon eta ?_ ?_ ?_ h_small
  · intro theta
    exact
      vaart1998_theorem_5_9_normCriterion_uniformDeviation_of_vectorUniformDeviation
        (Psi_n theta) (Psi theta) (h_uniform theta)
  · have hright_nonneg : 0 ≤ -‖Psi_n thetaHat‖ + approxError := by
      nlinarith
    have hleft_nonpos : -‖Psi_n theta0‖ ≤ 0 := by
      nlinarith [norm_nonneg (Psi_n theta0)]
    nlinarith
  · intro theta hdist
    have hsep := h_separated theta hdist
    have hzero_norm : ‖Psi theta0‖ = 0 := by
      simp [h_zero]
    nlinarith

/--
High-probability certificate for van der Vaart Theorem 5.9.

The event `good n` carries uniform convergence of the estimating functions and
the near-zero condition for the estimator.  The deterministic limit has a
well-separated zero at `theta0`.
-/
structure Vaart1998ZEstimatorUniformConsistencyCertificate
    (Ω : Type u) (Θ : Type v) (E : Type*) [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    (P : Measure Ω) (Psi : Θ -> E) (Psi_n : ℕ -> Ω -> Θ -> E)
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
      ∀ theta : Θ, ‖Psi_n n omega theta - Psi theta‖ ≤ deviation n
  near_zero_on_good :
    ∀ n : ℕ, ∀ omega : Ω, omega ∈ good n ->
      ‖Psi_n n omega (thetaHat n omega)‖ ≤ approxError n
  zero_at_theta0 : Psi theta0 = 0
  separated_zero :
    ∀ epsilon : ℝ, 0 < epsilon ->
      ∃ eta : ℝ, 0 < eta ∧
        ∀ theta : Θ, epsilon ≤ dist theta theta0 -> eta ≤ ‖Psi theta‖

namespace Vaart1998ZEstimatorUniformConsistencyCertificate

/--
Convert the Theorem 5.9 Z-estimator certificate into the Theorem 5.7
M-estimator certificate for the norm criterion `theta ↦ -‖Psi theta‖`.
-/
def toMEstimatorUniformConsistencyCertificate
    {Ω : Type u} {Θ : Type v} {E : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    {P : Measure Ω} {Psi : Θ -> E} {Psi_n : ℕ -> Ω -> Θ -> E}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (C :
      Vaart1998ZEstimatorUniformConsistencyCertificate
        Ω Θ E P Psi Psi_n theta0 thetaHat) :
    Vaart1998MEstimatorUniformConsistencyCertificate
      Ω Θ P (fun theta : Θ => -‖Psi theta‖)
      (fun n omega theta => -‖Psi_n n omega theta‖) theta0 thetaHat where
  good := C.good
  good_measurable := C.good_measurable
  good_probability := C.good_probability
  deviation := C.deviation
  approxError := C.approxError
  deviation_tendsto_zero := C.deviation_tendsto_zero
  approxError_tendsto_zero := C.approxError_tendsto_zero
  uniform_deviation_on_good := by
    intro n omega hgood theta
    exact
      vaart1998_theorem_5_9_normCriterion_uniformDeviation_of_vectorUniformDeviation
        (Psi_n n omega theta) (Psi theta)
        (C.uniform_deviation_on_good n omega hgood theta)
  approximate_maximizer_on_good := by
    intro n omega hgood
    have hright_nonneg :
        0 ≤ -‖Psi_n n omega (thetaHat n omega)‖ + C.approxError n := by
      nlinarith [C.near_zero_on_good n omega hgood]
    have hleft_nonpos : -‖Psi_n n omega theta0‖ ≤ 0 := by
      nlinarith [norm_nonneg (Psi_n n omega theta0)]
    nlinarith
  separated_maximum := by
    intro epsilon hepsilon
    rcases C.separated_zero epsilon hepsilon with
      ⟨eta, heta_pos, h_separated⟩
    refine ⟨eta, heta_pos, ?_⟩
    intro theta hdist
    have hsep := h_separated theta hdist
    have hzero_norm : ‖Psi theta0‖ = 0 := by
      simp [C.zero_at_theta0]
    nlinarith

/--
Build the Theorem 5.9 high-probability certificate from deterministic uniform
convergence of the estimating functions.  The good event is `Set.univ` at every
sample size.
-/
def of_deterministicUniformDeviation_univ
    {Ω : Type u} {Θ : Type v} {E : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Psi : Θ -> E} {deterministicPsi : ℕ -> Θ -> E}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (deviation approxError : ℕ -> ℝ)
    (h_deviation :
      ∀ n : ℕ, ∀ theta : Θ,
        ‖deterministicPsi n theta - Psi theta‖ ≤ deviation n)
    (h_deviation_tendsto : Tendsto deviation atTop (𝓝 0))
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖deterministicPsi n (thetaHat n omega)‖ ≤ approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖Psi theta‖) :
    Vaart1998ZEstimatorUniformConsistencyCertificate
      Ω Θ E P Psi (fun n _omega theta => deterministicPsi n theta)
      theta0 thetaHat where
  good := fun _n => Set.univ
  good_measurable := fun _n => MeasurableSet.univ
  good_probability := by
    simp
  deviation := deviation
  approxError := approxError
  deviation_tendsto_zero := h_deviation_tendsto
  approxError_tendsto_zero := h_approx_tendsto
  uniform_deviation_on_good := by
    intro n _omega _hgood theta
    exact h_deviation n theta
  near_zero_on_good := by
    intro n omega _hgood
    exact h_near_zero n omega
  zero_at_theta0 := h_zero
  separated_zero := h_separated

end Vaart1998ZEstimatorUniformConsistencyCertificate

/--
van der Vaart 1998, Theorem 5.9, consistency of approximate Z-estimators.

This follows from Theorem 5.7 applied to the criterion
`theta ↦ -‖Psi theta‖`.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_uniformConsistencyCertificate
    {Ω : Type u} {Θ : Type v} {E : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Psi : Θ -> E} {Psi_n : ℕ -> Ω -> Θ -> E}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (C :
      Vaart1998ZEstimatorUniformConsistencyCertificate
        Ω Θ E P Psi Psi_n theta0 thetaHat) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_7_mEstimator_consistent_of_uniformConsistencyCertificate
    C.toMEstimatorUniformConsistencyCertificate

/--
van der Vaart 1998, Theorem 5.9, deterministic-uniform-source endpoint.

This is the source-facing all-good-event specialization for deterministic
estimating-function approximations.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_deterministicUniformDeviation_univ
    {Ω : Type u} {Θ : Type v} {E : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Psi : Θ -> E} {deterministicPsi : ℕ -> Θ -> E}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (deviation approxError : ℕ -> ℝ)
    (h_deviation :
      ∀ n : ℕ, ∀ theta : Θ,
        ‖deterministicPsi n theta - Psi theta‖ ≤ deviation n)
    (h_deviation_tendsto : Tendsto deviation atTop (𝓝 0))
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖deterministicPsi n (thetaHat n omega)‖ ≤ approxError n)
    (h_approx_tendsto : Tendsto approxError atTop (𝓝 0))
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖Psi theta‖) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_9_zEstimator_consistent_of_uniformConsistencyCertificate
    (Vaart1998ZEstimatorUniformConsistencyCertificate.of_deterministicUniformDeviation_univ
      deviation approxError h_deviation h_deviation_tendsto h_near_zero
      h_approx_tendsto h_zero h_separated)

/--
van der Vaart 1998, Theorem 5.9, random uniform-error source endpoint.

Uniform convergence in probability of the estimating functions, together with a
near-zero error that converges to zero in probability, implies consistency under
the separated-zero condition.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_randomUniformErrors
    {Ω : Type u} {Θ : Type v} {E : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Psi : Θ -> E} {Psi_n : ℕ -> Ω -> Θ -> E}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        ‖Psi_n n omega theta - Psi theta‖ ≤ uniformError n omega)
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖Psi_n n omega (thetaHat n omega)‖ ≤ approxError n omega)
    (h_uniform_tendsto : TendstoInMeasure P uniformError atTop 0)
    (h_approx_tendsto : TendstoInMeasure P approxError atTop 0)
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖Psi theta‖) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_dist]
  intro epsilon hepsilon
  rcases h_separated epsilon hepsilon with
    ⟨eta, heta_pos, h_separated_eta⟩
  have h_eta_quarter : 0 < eta / 4 := by positivity
  have h_eta_half : 0 < eta / 2 := by positivity
  have h_uniform_tail :
      Tendsto
        (fun n : ℕ =>
          P.real {omega : Ω | eta / 4 ≤ ‖uniformError n omega - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm).mp
      h_uniform_tendsto (eta / 4) h_eta_quarter
  have h_approx_tail :
      Tendsto
        (fun n : ℕ =>
          P.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm).mp
      h_approx_tendsto (eta / 2) h_eta_half
  have h_tail_sum :
      Tendsto
        (fun n : ℕ =>
          P.real {omega : Ω | eta / 4 ≤ ‖uniformError n omega - 0‖} +
            P.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) := by
    simpa using h_uniform_tail.add h_approx_tail
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le ha measureReal_nonneg
  · intro a ha
    filter_upwards [h_tail_sum.eventually_lt_const ha] with n htail_lt
    let uniformTail : Set Ω :=
      {omega : Ω | eta / 4 ≤ ‖uniformError n omega - 0‖}
    let approxTail : Set Ω :=
      {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖}
    have hbad_subset :
        {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ⊆
          uniformTail ∪ approxTail := by
      intro omega hbad
      by_contra hnot
      have hnot_uniform : omega ∉ uniformTail := by
        exact fun hmem => hnot (Or.inl hmem)
      have hnot_approx : omega ∉ approxTail := by
        exact fun hmem => hnot (Or.inr hmem)
      have huniform_norm_lt :
          ‖uniformError n omega - 0‖ < eta / 4 :=
        lt_of_not_ge hnot_uniform
      have happrox_norm_lt :
          ‖approxError n omega - 0‖ < eta / 2 :=
        lt_of_not_ge hnot_approx
      have huniform_lt : uniformError n omega < eta / 4 := by
        have hle_norm :
            uniformError n omega ≤ ‖uniformError n omega - 0‖ := by
          simpa [sub_zero, Real.norm_eq_abs] using
            (le_abs_self (uniformError n omega))
        linarith
      have happrox_lt : approxError n omega < eta / 2 := by
        have hle_norm :
            approxError n omega ≤ ‖approxError n omega - 0‖ := by
          simpa [sub_zero, Real.norm_eq_abs] using
            (le_abs_self (approxError n omega))
        linarith
      have hsmall :
          2 * uniformError n omega + approxError n omega < eta := by
        nlinarith
      have hdist_lt :
          dist (thetaHat n omega) theta0 < epsilon :=
        vaart1998_theorem_5_9_dist_lt_of_uniformDeviation_nearZero
          Psi (Psi_n n omega) (thetaHat n omega) theta0
          (uniformError n omega) (approxError n omega) epsilon eta
          (h_uniform n omega) (h_near_zero n omega)
          h_zero h_separated_eta hsmall
      exact (not_le_of_gt hdist_lt) hbad
    have hmeasure_le :
        P.real {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ≤
          P.real uniformTail + P.real approxTail :=
      (measureReal_mono hbad_subset).trans (measureReal_union_le _ _)
    exact lt_of_le_of_lt hmeasure_le htail_lt

/--
van der Vaart 1998, Theorem 5.9, VdV&W outer-probability random-error source
endpoint.

This is the estimating-equation analogue of the Theorem 5.7
outer-probability wrapper: empirical-process uniform laws stated in VdV&W
outer-probability form feed directly into Z-estimator consistency.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_outerProbabilityUniformErrors
    {Ω : Type u} {Θ : Type v} {E : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace Θ] [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {Psi : Θ -> E} {Psi_n : ℕ -> Ω -> Θ -> E}
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        ‖Psi_n n omega theta - Psi theta‖ ≤ uniformError n omega)
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖Psi_n n omega (thetaHat n omega)‖ ≤ approxError n omega)
    (h_uniform_outer :
      VdVWConvergesInOuterProbability P uniformError atTop (fun _ : Ω => 0))
    (h_approx_outer :
      VdVWConvergesInOuterProbability P approxError atTop (fun _ : Ω => 0))
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖Psi theta‖) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_9_zEstimator_consistent_of_randomUniformErrors
    uniformError approxError h_uniform h_near_zero
    (tendstoInMeasure_of_vdVWConvergesInOuterProbability h_uniform_outer)
    (tendstoInMeasure_of_vdVWConvergesInOuterProbability h_approx_outer)
    h_zero h_separated

/--
van der Vaart 1998, Theorem 5.9, scalar empirical-average estimating-equation
endpoint.

This packages estimating equations of the form `P_n psi_theta = o_P(1)` in
the real-valued case.  Vector-valued empirical averages can later reuse the
same outer-probability wrapper once their sample-average notation is available.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_empiricalAverage_real_outerProbabilityUniformErrors
    {Ω : Type u} {Observation : Type*} {Θ : Type v}
    [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    {P : Measure Ω} [IsProbabilityMeasure P]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (estimatingFunction : Θ -> Observation -> ℝ)
    {Psi : Θ -> ℝ} {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        ‖empiricalRiskOfLoss (samples n omega) estimatingFunction theta -
          Psi theta‖ ≤ uniformError n omega)
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖empiricalRiskOfLoss (samples n omega) estimatingFunction
          (thetaHat n omega)‖ ≤ approxError n omega)
    (h_uniform_outer :
      VdVWConvergesInOuterProbability P uniformError atTop (fun _ : Ω => 0))
    (h_approx_outer :
      VdVWConvergesInOuterProbability P approxError atTop (fun _ : Ω => 0))
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖Psi theta‖) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_9_zEstimator_consistent_of_outerProbabilityUniformErrors
    (Psi := Psi)
    (Psi_n := fun n omega theta =>
      empiricalRiskOfLoss (samples n omega) estimatingFunction theta)
    (theta0 := theta0) (thetaHat := thetaHat)
    uniformError approxError h_uniform h_near_zero
    h_uniform_outer h_approx_outer h_zero h_separated

/--
van der Vaart 1998, Theorem 5.9, direct VdV&W `P`-Glivenko-Cantelli scalar
empirical-average endpoint.

This consumes the VdV&W outer-probability `P`-GC predicate for the real
estimating-function class itself.  It avoids asking downstream proofs to first
package the uniform estimating-equation error as a random scalar process.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage_real
    {Ω : Type u} {Observation : Type*} {Θ : Type v}
    [MeasurableSpace Ω] [MeasurableSpace Observation] [PseudoMetricSpace Θ]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Pobs : Measure Observation}
    (X : ℕ -> Ω -> Observation)
    (estimatingFunction : Θ -> Observation -> ℝ)
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (approxError : ℕ -> Ω -> ℝ)
    (h_gc :
      VdVWOuterProbabilityPGlivenkoCantelliClass μ Pobs (Set.univ : Set Θ)
        estimatingFunction X)
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖empiricalAverage (samplePath X omega n)
          (estimatingFunction (thetaHat n omega))‖ ≤ approxError n omega)
    (h_approx_outer :
      VdVWConvergesInOuterProbability μ approxError atTop (fun _ : Ω => 0))
    (h_zero :
      populationRiskOfFunction Pobs (estimatingFunction theta0) = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖populationRiskOfFunction Pobs
              (estimatingFunction theta)‖) :
    TendstoInMeasure μ thetaHat atTop (fun _ : Ω => theta0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_dist]
  intro epsilon hepsilon
  rcases h_separated epsilon hepsilon with
    ⟨eta, heta_pos, h_separated_eta⟩
  have h_eta_quarter : 0 < eta / 4 := by positivity
  have h_eta_half : 0 < eta / 2 := by positivity
  let Psi : Θ -> ℝ :=
    fun theta => populationRiskOfFunction Pobs (estimatingFunction theta)
  let empiricalPsi : Ω -> ℕ -> Θ -> ℝ :=
    fun omega n theta =>
      empiricalAverage (samplePath X omega n) (estimatingFunction theta)
  let gcBad : ℕ -> Set Ω := fun n =>
    {omega : Ω |
      ¬ EmpiricalDeviationBoundOn (Set.univ : Set Θ) Psi
        (empiricalPsi omega n) (eta / 4)}
  have h_gc_tail_enn :
      Tendsto
        (fun n : ℕ => VdVWOuterProbability μ (gcBad n))
        atTop (𝓝 0) := by
    simpa [VdVWOuterProbabilityPGlivenkoCantelliClass,
      VdVWOuterProbabilityUniformDeviationTendstoZeroOn, Psi, empiricalPsi,
      gcBad] using h_gc (eta / 4) h_eta_quarter
  have h_gc_tail_real :
      Tendsto (fun n : ℕ => μ.real (gcBad n)) atTop (𝓝 0) := by
    simpa [VdVWOuterProbability, Measure.real] using
      (ENNReal.tendsto_toReal ENNReal.zero_ne_top).comp h_gc_tail_enn
  have h_approx_tail :
      Tendsto
        (fun n : ℕ =>
          μ.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm).mp
      (tendstoInMeasure_of_vdVWConvergesInOuterProbability h_approx_outer)
      (eta / 2) h_eta_half
  have h_tail_sum :
      Tendsto
        (fun n : ℕ =>
          μ.real (gcBad n) +
            μ.real {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖})
        atTop (𝓝 0) := by
    simpa using h_gc_tail_real.add h_approx_tail
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le ha measureReal_nonneg
  · intro a ha
    filter_upwards [h_tail_sum.eventually_lt_const ha] with n htail_lt
    let approxTail : Set Ω :=
      {omega : Ω | eta / 2 ≤ ‖approxError n omega - 0‖}
    have hbad_subset :
        {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ⊆
          gcBad n ∪ approxTail := by
      intro omega hbad
      by_contra hnot
      have hnot_gc : omega ∉ gcBad n := by
        exact fun hmem => hnot (Or.inl hmem)
      have hnot_approx : omega ∉ approxTail := by
        exact fun hmem => hnot (Or.inr hmem)
      have hgc_good :
          EmpiricalDeviationBoundOn (Set.univ : Set Θ) Psi
            (empiricalPsi omega n) (eta / 4) :=
        of_not_not hnot_gc
      have happrox_norm_lt :
          ‖approxError n omega - 0‖ < eta / 2 :=
        lt_of_not_ge hnot_approx
      have happrox_lt : approxError n omega < eta / 2 := by
        have hle_norm :
            approxError n omega ≤ ‖approxError n omega - 0‖ := by
          simpa [sub_zero, Real.norm_eq_abs] using
            (le_abs_self (approxError n omega))
        linarith
      have hsmall : 2 * (eta / 4) + approxError n omega < eta := by
        nlinarith
      have hdist_lt :
          dist (thetaHat n omega) theta0 < epsilon :=
        vaart1998_theorem_5_9_dist_lt_of_uniformDeviation_nearZero
          Psi (empiricalPsi omega n) (thetaHat n omega) theta0
          (eta / 4) (approxError n omega) epsilon eta
          (fun theta => by
            simpa [Real.norm_eq_abs] using hgc_good theta trivial)
          (h_near_zero n omega)
          h_zero h_separated_eta hsmall
      exact (not_le_of_gt hdist_lt) hbad
    have hmeasure_le :
        μ.real {omega : Ω | epsilon ≤ dist (thetaHat n omega) theta0} ≤
          μ.real (gcBad n) + μ.real approxTail :=
      (measureReal_mono hbad_subset).trans (measureReal_union_le _ _)
    exact lt_of_le_of_lt hmeasure_le htail_lt

/--
van der Vaart 1998, Theorem 5.9, book-style VdV&W `P`-Glivenko-Cantelli
scalar empirical-average endpoint.

This is the scalar estimating-equation analogue of the Theorem 5.7 book-style
consumer.  The outer-a.s. branch is converted using the existing VdV&W
countable/a.e.-measurable bridge.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWPGlivenkoCantelliClass_empiricalAverage_real
    {Ω : Type u} {Observation : Type*} {Θ : Type v}
    [MeasurableSpace Ω] [MeasurableSpace Observation] [PseudoMetricSpace Θ]
    {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Pobs : Measure Observation}
    (X : ℕ -> Ω -> Observation)
    (estimatingFunction : Θ -> Observation -> ℝ)
    {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (approxError : ℕ -> Ω -> ℝ)
    (h_gc :
      VdVWPGlivenkoCantelliClass μ Pobs (Set.univ : Set Θ)
        estimatingFunction X)
    (h_count : (Set.univ : Set Θ).Countable)
    (h_empirical :
      ∀ sampleSize theta, theta ∈ (Set.univ : Set Θ) ->
        AEMeasurable
          (fun omega =>
            empiricalAverage (samplePath X omega sampleSize)
              (estimatingFunction theta))
          μ)
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖empiricalAverage (samplePath X omega n)
          (estimatingFunction (thetaHat n omega))‖ ≤ approxError n omega)
    (h_approx_outer :
      VdVWConvergesInOuterProbability μ approxError atTop (fun _ : Ω => 0))
    (h_zero :
      populationRiskOfFunction Pobs (estimatingFunction theta0) = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖populationRiskOfFunction Pobs
              (estimatingFunction theta)‖) :
    TendstoInMeasure μ thetaHat atTop (fun _ : Ω => theta0) := by
  rcases h_gc with h_outer | h_outer_as
  · exact
      vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage_real
        (μ := μ) (Pobs := Pobs) X estimatingFunction approxError
        h_outer h_near_zero h_approx_outer h_zero h_separated
  · exact
      vaart1998_theorem_5_9_zEstimator_consistent_of_vdVWOuterProbabilityPGlivenkoCantelliClass_empiricalAverage_real
        (μ := μ) (Pobs := Pobs) X estimatingFunction approxError
        (VdVWOuterProbabilityPGlivenkoCantelliClass_of_outerAlmostSure_of_countable_of_aemeasurable_empiricalAverage
          (μ := μ) (P := Pobs) (indexClass := (Set.univ : Set Θ))
          (classFun := estimatingFunction) (X := X) h_outer_as h_count
          h_empirical)
        h_near_zero h_approx_outer h_zero h_separated

/--
van der Vaart 1998, Theorem 5.9, vector empirical-average estimating-equation
endpoint.

This is the `P_n psi_theta` notation layer for estimating equations whose
values lie in a real normed vector space.  It reuses the VdV&W
outer-probability random-error wrapper after expanding `P_n` as the
vector-valued empirical average of the estimating function.
-/
theorem vaart1998_theorem_5_9_zEstimator_consistent_of_empiricalAverage_vector_outerProbabilityUniformErrors
    {Ω : Type u} {Observation : Type*} {Θ : Type v} {E : Type*}
    [MeasurableSpace Ω] [PseudoMetricSpace Θ]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    {P : Measure Ω} [IsProbabilityMeasure P]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (estimatingFunction : Θ -> Observation -> E)
    {Psi : Θ -> E} {theta0 : Θ} {thetaHat : ℕ -> Ω -> Θ}
    (uniformError approxError : ℕ -> Ω -> ℝ)
    (h_uniform :
      ∀ n : ℕ, ∀ omega : Ω, ∀ theta : Θ,
        ‖empiricalAverageVector (samples n omega) (estimatingFunction theta) -
          Psi theta‖ ≤ uniformError n omega)
    (h_near_zero :
      ∀ n : ℕ, ∀ omega : Ω,
        ‖empiricalAverageVector (samples n omega)
          (estimatingFunction (thetaHat n omega))‖ ≤ approxError n omega)
    (h_uniform_outer :
      VdVWConvergesInOuterProbability P uniformError atTop (fun _ : Ω => 0))
    (h_approx_outer :
      VdVWConvergesInOuterProbability P approxError atTop (fun _ : Ω => 0))
    (h_zero : Psi theta0 = 0)
    (h_separated :
      ∀ epsilon : ℝ, 0 < epsilon ->
        ∃ eta : ℝ, 0 < eta ∧
          ∀ theta : Θ, epsilon ≤ dist theta theta0 ->
            eta ≤ ‖Psi theta‖) :
    TendstoInMeasure P thetaHat atTop (fun _ : Ω => theta0) :=
  vaart1998_theorem_5_9_zEstimator_consistent_of_outerProbabilityUniformErrors
    (Psi := Psi)
    (Psi_n := fun n omega theta =>
      empiricalAverageVector (samples n omega) (estimatingFunction theta))
    (theta0 := theta0) (thetaHat := thetaHat)
    uniformError approxError h_uniform h_near_zero
    h_uniform_outer h_approx_outer h_zero h_separated

/--
van der Vaart 1998, Theorem 5.41, scalar-small times stochastically bounded
input is negligible.

The derivative LLN part of the Taylor proof uses this probability bookkeeping:
if the derivative matrix error is `o_P(1)` in operator norm and the scaled
estimator is `O_P(1)`, then their product is `o_P(1)`.
-/
theorem vaart1998_tendstoInMeasure_zero_of_norm_le_mul_stochasticBounded
    {Ω E F : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsFiniteMeasure P]
    [SeminormedAddCommGroup E] [SeminormedAddCommGroup F]
    {a : ℕ -> Ω -> ℝ} {X : ℕ -> Ω -> E} {Y : ℕ -> Ω -> F}
    (ha : TendstoInMeasure P a atTop 0)
    (hX : StochasticBounded P X)
    (hbound : ∀ᶠ n in atTop, ∀ ω, ‖Y n ω‖ ≤ ‖a n ω‖ * ‖X n ω‖) :
    TendstoInMeasure P Y atTop 0 := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_norm]
  intro ε hε
  rw [tendsto_order]
  constructor
  · intro b hb
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le hb measureReal_nonneg
  · intro b hb
    have hb_half : 0 < b / 2 := by linarith
    rcases hX (b / 2) hb_half with ⟨M, hMpos, hX_tail⟩
    have hε_div_pos : 0 < ε / M := div_pos hε hMpos
    have ha_tail :
        Tendsto
          (fun n : ℕ => P.real {ω : Ω | ε / M ≤ ‖a n ω - 0‖})
          atTop (𝓝 0) :=
      (MeasureTheory.tendstoInMeasure_iff_measureReal_norm.mp ha)
        (ε / M) hε_div_pos
    have ha_tail_small :
        ∀ᶠ n in atTop,
          P.real {ω : Ω | ε / M ≤ ‖a n ω - 0‖} < b / 2 :=
      ha_tail.eventually_lt_const hb_half
    filter_upwards [hbound, hX_tail, ha_tail_small] with n hbnd hXn han
    have hsubset :
        {ω : Ω | ε ≤ ‖Y n ω - 0‖} ⊆
          {ω : Ω | ε / M ≤ ‖a n ω - 0‖} ∪
            {ω : Ω | M ≤ ‖X n ω‖} := by
      intro ω hω
      by_cases haω : ε / M ≤ ‖a n ω - 0‖
      · exact Or.inl haω
      · right
        by_contra hXω
        have ha_lt : ‖a n ω‖ < ε / M := by
          simpa [sub_zero] using not_le.mp haω
        have hX_lt : ‖X n ω‖ < M := not_le.mp hXω
        have hmul_lt : ‖a n ω‖ * ‖X n ω‖ < ε := by
          have hmul_le :
              ‖a n ω‖ * ‖X n ω‖ ≤ (ε / M) * ‖X n ω‖ :=
            mul_le_mul_of_nonneg_right (le_of_lt ha_lt) (norm_nonneg _)
          have hmul_lt' : (ε / M) * ‖X n ω‖ < (ε / M) * M :=
            mul_lt_mul_of_pos_left hX_lt hε_div_pos
          have hmul_lt'' : ‖a n ω‖ * ‖X n ω‖ < (ε / M) * M :=
            lt_of_le_of_lt hmul_le hmul_lt'
          simpa [div_mul_cancel₀ _ (ne_of_gt hMpos)] using hmul_lt''
        have hY_lt : ‖Y n ω‖ < ε := lt_of_le_of_lt (hbnd ω) hmul_lt
        have hY_big : ε ≤ ‖Y n ω‖ := by
          simpa [sub_zero] using hω
        exact not_lt_of_ge hY_big hY_lt
    have hle :
        P.real {ω : Ω | ε ≤ ‖Y n ω - 0‖} ≤
          P.real {ω : Ω | ε / M ≤ ‖a n ω - 0‖} +
            P.real {ω : Ω | M ≤ ‖X n ω‖} :=
      (measureReal_mono hsubset).trans
        (measureReal_union_le
          {ω : Ω | ε / M ≤ ‖a n ω - 0‖}
          {ω : Ω | M ≤ ‖X n ω‖})
    have hsum_lt :
        P.real {ω : Ω | ε / M ≤ ‖a n ω - 0‖} +
          P.real {ω : Ω | M ≤ ‖X n ω‖} < b := by
      linarith
    exact lt_of_le_of_lt hle hsum_lt

/--
van der Vaart 1998, Theorem 5.41, product of stochastically bounded terms.

This is the `O_P(1) * O_P(1) = O_P(1)` tail bookkeeping needed for the
second-derivative Taylor residual.
-/
theorem vaart1998_stochasticBounded_of_norm_le_mul_stochasticBounded
    {Ω E F : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsFiniteMeasure P]
    [SeminormedAddCommGroup E] [SeminormedAddCommGroup F]
    {a : ℕ -> Ω -> ℝ} {X : ℕ -> Ω -> E} {Y : ℕ -> Ω -> F}
    (ha : StochasticBounded P a)
    (hX : StochasticBounded P X)
    (hbound : ∀ᶠ n in atTop, ∀ ω, ‖Y n ω‖ ≤ ‖a n ω‖ * ‖X n ω‖) :
    StochasticBounded P Y := by
  intro ε hε
  have hhalf_pos : 0 < ε / 2 := by linarith
  rcases ha (ε / 2) hhalf_pos with ⟨A, hApos, ha_tail⟩
  rcases hX (ε / 2) hhalf_pos with ⟨M, hMpos, hX_tail⟩
  refine ⟨A * M, mul_pos hApos hMpos, ?_⟩
  filter_upwards [hbound, ha_tail, hX_tail] with n hbnd han hXn
  have hsubset :
      {ω : Ω | A * M ≤ ‖Y n ω‖} ⊆
        {ω : Ω | A ≤ ‖a n ω‖} ∪
          {ω : Ω | M ≤ ‖X n ω‖} := by
    intro ω hω
    by_cases haω : A ≤ ‖a n ω‖
    · exact Or.inl haω
    · right
      by_contra hXω
      have ha_lt : ‖a n ω‖ < A := not_le.mp haω
      have hX_lt : ‖X n ω‖ < M := not_le.mp hXω
      have hmul_lt : ‖a n ω‖ * ‖X n ω‖ < A * M := by
        have hmul_le :
            ‖a n ω‖ * ‖X n ω‖ ≤ A * ‖X n ω‖ :=
          mul_le_mul_of_nonneg_right (le_of_lt ha_lt) (norm_nonneg _)
        have hmul_lt' : A * ‖X n ω‖ < A * M :=
          mul_lt_mul_of_pos_left hX_lt hApos
        exact lt_of_le_of_lt hmul_le hmul_lt'
      have hY_lt : ‖Y n ω‖ < A * M :=
        lt_of_le_of_lt (hbnd ω) hmul_lt
      exact not_lt_of_ge hω hY_lt
  have hle :
      P.real {ω : Ω | A * M ≤ ‖Y n ω‖} ≤
        P.real {ω : Ω | A ≤ ‖a n ω‖} +
          P.real {ω : Ω | M ≤ ‖X n ω‖} :=
    (measureReal_mono hsubset).trans
      (measureReal_union_le
        {ω : Ω | A ≤ ‖a n ω‖}
        {ω : Ω | M ≤ ‖X n ω‖})
  have hsum_lt :
      P.real {ω : Ω | A ≤ ‖a n ω‖} +
        P.real {ω : Ω | M ≤ ‖X n ω‖} < ε := by
    linarith
  exact lt_of_le_of_lt hle hsum_lt

/--
van der Vaart 1998, Theorem 5.41, derivative LLN residual.

The derivative average satisfies an LLN in operator norm.  Multiplying its
operator error by the scaled estimator, which is `O_P(1)` at this stage of the
Taylor proof, gives the derivative residual required by the separated-residual
handoff.
-/
theorem vaart1998_theorem_5_41_derivativeResidual_tendstoInMeasure_of_opNorm
    {Ω Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsFiniteMeasure P]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    (V : Θ →L[ℝ] Score)
    {scaledEstimator : ℕ -> Ω -> Θ}
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hScaledEstimator : StochasticBounded P scaledEstimator) :
    TendstoInMeasure P
      (fun n ω => (empiricalDerivative n ω - V) (scaledEstimator n ω))
      atTop 0 := by
  refine
    vaart1998_tendstoInMeasure_zero_of_norm_le_mul_stochasticBounded
      (P := P) (a := fun n ω => ‖empiricalDerivative n ω - V‖)
      (X := scaledEstimator)
      (Y := fun n ω => (empiricalDerivative n ω - V) (scaledEstimator n ω))
      hDerivativeLLN hScaledEstimator ?_
  exact Eventually.of_forall fun n ω => by
    have hop :=
      (empiricalDerivative n ω - V).le_opNorm (scaledEstimator n ω)
    simpa [Real.norm_of_nonneg (norm_nonneg (empiricalDerivative n ω - V))]
      using hop

/--
van der Vaart 1998, Theorem 5.41, derivative residual measurability.

The residual `(dotPsi_n(theta0) - P dot psi_theta0) x_n` is a.e. measurable
once the empirical derivative and scaled estimator are a.e. measurable.
-/
theorem vaart1998_theorem_5_41_derivativeResidual_aemeasurable_of_operator
    {Ω Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [BorelSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    (V : Θ →L[ℝ] Score)
    {scaledEstimator : ℕ -> Ω -> Θ}
    (hEmpiricalDerivative_meas : ∀ n, AEMeasurable (empiricalDerivative n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P) :
    ∀ n,
      AEMeasurable
        (fun ω => (empiricalDerivative n ω - V) (scaledEstimator n ω)) P := by
  intro n
  have hDerivative :
      AEMeasurable (fun ω => empiricalDerivative n ω - V) P :=
    (continuous_id.sub continuous_const).measurable.comp_aemeasurable
      (hEmpiricalDerivative_meas n)
  have hEval :
      Measurable fun p : (Θ →L[ℝ] Score) × Θ => p.1 p.2 :=
    (isBoundedBilinearMap_apply (𝕜 := ℝ) (E := Θ) (F := Score)).continuous.measurable
  exact hEval.comp_aemeasurable (hDerivative.prodMk (hScaledEstimator_meas n))

/--
van der Vaart 1998, Theorem 5.41, second-derivative Taylor residual.

The second-derivative average is bounded in probability, the scaled estimator
is `O_P(1)`, and consistency gives the unscaled estimator difference
`o_P(1)`.  The Taylor quadratic term is therefore `o_P(1)`.
-/
theorem vaart1998_theorem_5_41_secondDerivativeResidual_tendstoInMeasure_of_bound
    {Ω Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsFiniteMeasure P]
    [NormedAddCommGroup Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {curvatureBound : ℕ -> Ω -> ℝ}
    {secondResidual : ℕ -> Ω -> Score}
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖)) :
    TendstoInMeasure P secondResidual atTop 0 := by
  let curvatureScaled : ℕ -> Ω -> Θ :=
    fun n ω => curvatureBound n ω • scaledEstimator n ω
  have hCurvatureScaled : StochasticBounded P curvatureScaled := by
    refine
      vaart1998_stochasticBounded_of_norm_le_mul_stochasticBounded
        (P := P) (a := curvatureBound) (X := scaledEstimator)
        (Y := curvatureScaled) hCurvatureBounded hScaledEstimator ?_
    exact Eventually.of_forall fun n ω => by
      simp [curvatureScaled, norm_smul]
  refine
    vaart1998_tendstoInMeasure_zero_of_norm_le_mul_stochasticBounded
      (P := P) (a := fun n ω => ‖delta n ω‖)
      (X := curvatureScaled) (Y := secondResidual) hDelta
      hCurvatureScaled ?_
  filter_upwards [hSecondBound] with n hbnd
  intro ω
  calc
    ‖secondResidual n ω‖
        ≤ ‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖) := hbnd ω
    _ = ‖(‖delta n ω‖ : ℝ)‖ * ‖curvatureScaled n ω‖ := by
        simp [curvatureScaled, norm_smul]

/--
van der Vaart 1998, Theorem 5.41, addition of negligible Score-space
residuals.

The Taylor proof separates the derivative LLN error from the second-derivative
remainder.  This lemma packages the elementary probabilistic step that the sum
of two `o_P(1)` Score-valued residuals is still `o_P(1)`.
-/
theorem vaart1998_theorem_5_41_scoreResidual_add_tendstoInMeasure
    {Ω Score : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsFiniteMeasure P] [NormedAddCommGroup Score]
    {residual₁ residual₂ : ℕ -> Ω -> Score}
    (hResidual₁ : TendstoInMeasure P residual₁ atTop 0)
    (hResidual₂ : TendstoInMeasure P residual₂ atTop 0) :
    TendstoInMeasure P
      (fun (n : ℕ) ω => residual₁ n ω + residual₂ n ω) atTop 0 := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_norm]
  intro ε hε
  have hhalf_pos : 0 < ε / 2 := by linarith
  have htail₁ :
      Tendsto
        (fun n : ℕ => P.real {ω : Ω | ε / 2 ≤ ‖residual₁ n ω - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm.mp hResidual₁)
      (ε / 2) hhalf_pos
  have htail₂ :
      Tendsto
        (fun n : ℕ => P.real {ω : Ω | ε / 2 ≤ ‖residual₂ n ω - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm.mp hResidual₂)
      (ε / 2) hhalf_pos
  have htail_sum :
      Tendsto
        (fun n : ℕ =>
          P.real {ω : Ω | ε / 2 ≤ ‖residual₁ n ω - 0‖} +
            P.real {ω : Ω | ε / 2 ≤ ‖residual₂ n ω - 0‖})
        atTop (𝓝 0) := by
    simpa using htail₁.add htail₂
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
    htail_sum ?_ ?_
  · intro n
    exact measureReal_nonneg
  · intro n
    have hsubset :
        {ω : Ω | ε ≤ ‖(residual₁ n ω + residual₂ n ω) - 0‖} ⊆
          {ω : Ω | ε / 2 ≤ ‖residual₁ n ω - 0‖} ∪
            {ω : Ω | ε / 2 ≤ ‖residual₂ n ω - 0‖} := by
      intro ω hω
      by_cases h₁ : ε / 2 ≤ ‖residual₁ n ω - 0‖
      · exact Or.inl h₁
      · right
        by_contra h₂
        have h₁lt : ‖residual₁ n ω‖ < ε / 2 := by
          simpa [sub_zero] using not_le.mp h₁
        have h₂lt : ‖residual₂ n ω‖ < ε / 2 := by
          have h₂' : ¬ ε / 2 ≤ ‖residual₂ n ω - 0‖ := h₂
          simpa [sub_zero] using not_le.mp h₂'
        have hnorm_le :
            ‖residual₁ n ω + residual₂ n ω‖ ≤
              ‖residual₁ n ω‖ + ‖residual₂ n ω‖ :=
          norm_add_le _ _
        have hnorm_lt : ‖residual₁ n ω + residual₂ n ω‖ < ε := by
          exact lt_of_le_of_lt hnorm_le (by linarith)
        have hbig : ε ≤ ‖residual₁ n ω + residual₂ n ω‖ := by
          simpa [sub_zero] using hω
        exact not_lt_of_ge hbig hnorm_lt
    exact
      (measureReal_mono hsubset).trans
        (measureReal_union_le
          {ω : Ω | ε / 2 ≤ ‖residual₁ n ω - 0‖}
          {ω : Ω | ε / 2 ≤ ‖residual₂ n ω - 0‖})

/--
van der Vaart 1998, Theorem 5.41, inverse-derivative preservation of
negligible score residuals.

The Taylor proof produces a residual in the estimating-equation space.  This
lemma records the deterministic continuous-linear-map step that its image under
`-(P dot psi_theta0)^{-1}` is still `o_P(1)`.
-/
theorem vaart1998_theorem_5_41_inverseDerivative_remainder_tendstoInMeasure
    {Ω Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsFiniteMeasure P]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (Vinv : Score →L[ℝ] Θ)
    {residual : ℕ -> Ω -> Score}
    (hResidual : TendstoInMeasure P residual atTop 0) :
    TendstoInMeasure P
      (fun (n : ℕ) ω => (-Vinv : Score →L[ℝ] Θ) (residual n ω)) atTop
      0 := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_norm]
  intro ε hε
  let L : Score →L[ℝ] Θ := (-Vinv : Score →L[ℝ] Θ)
  let c : ℝ := ‖L‖ + 1
  have hc_pos : 0 < c := by
    have hL_nonneg : 0 ≤ ‖L‖ := norm_nonneg L
    linarith
  have hδ_pos : 0 < ε / c := div_pos hε hc_pos
  have hResidual_tail :
      Tendsto
        (fun n : ℕ => P.real {ω : Ω | ε / c ≤ ‖residual n ω - 0‖})
        atTop (𝓝 0) :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm.mp hResidual)
      (ε / c) hδ_pos
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
    hResidual_tail ?_ ?_
  · intro n
    exact measureReal_nonneg
  · intro n
    refine measureReal_mono ?_
    intro ω hω
    have hω_norm : ε ≤ ‖L (residual n ω)‖ := by
      simpa [L, sub_zero] using hω
    have hL_bound : ‖L (residual n ω)‖ ≤ ‖L‖ * ‖residual n ω‖ :=
      L.le_opNorm (residual n ω)
    have hc_bound : ‖L‖ * ‖residual n ω‖ ≤ c * ‖residual n ω‖ := by
      exact mul_le_mul_of_nonneg_right (by simp [c]) (norm_nonneg _)
    have hε_le : ε ≤ c * ‖residual n ω‖ := by
      exact hω_norm.trans (hL_bound.trans hc_bound)
    have hδ_le : ε / c ≤ ‖residual n ω‖ := by
      exact (div_le_iff₀ hc_pos).2 (by simpa [mul_comm] using hε_le)
    simpa [sub_zero] using hδ_le

/--
van der Vaart 1998, Theorem 5.41, score-linearization handoff for
Z-estimators.

This is the Slutsky/delta-method endpoint of the theorem: if the score term has
a weak limit and the Taylor remainder is `o_P(1)`, then the linearized
estimator expression has the inverse-derivative image as its weak limit.
-/
theorem vaart1998_theorem_5_41_zEstimator_scoreLinearization_handoff
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (Vinv : Score →L[ℝ] Θ)
    {score : ℕ -> Ω -> Score} {Z : Ω' -> Score} {R : ℕ -> Ω -> Θ}
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hR : TendstoInMeasure P R atTop 0)
    (hR_meas : ∀ n, AEMeasurable (R n) P) :
    TendstoInDistribution
      (fun (n : ℕ) ω =>
        (-Vinv : Score →L[ℝ] Θ) (score n ω) + R n ω) atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  exact
    vaart1998_theorem_3_1_delta_method_linearized
      (ι := ℕ) (Ω := Ω) (Ω' := Ω') (E := Score) (F := Θ)
      (P := P) (Q := Q) (W := score) (R := R) (T := Z) (l := atTop)
      (-Vinv : Score →L[ℝ] Θ) hScoreCLT hR hR_meas

/--
van der Vaart 1998, Theorem 5.41, scaled-estimator handoff for Z-estimators.

The Taylor/LLN part of the proof supplies that the scaled estimator is a.s.
equal to the score-linearized expression.  This wrapper transfers the compiled
score-linearization endpoint to that scaled estimator.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (Vinv : Score →L[ℝ] Θ)
    {score : ℕ -> Ω -> Score} {scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Score} {R : ℕ -> Ω -> Θ}
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hLinearization : ∀ n : ℕ,
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (score n ω) + R n ω)
        =ᵐ[P] scaledEstimator n)
    (hR : TendstoInMeasure P R atTop 0)
    (hR_meas : ∀ n, AEMeasurable (R n) P) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hlin :
      TendstoInDistribution
        (fun (n : ℕ) ω =>
          (-Vinv : Score →L[ℝ] Θ) (score n ω) + R n ω) atTop
        (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q :=
    vaart1998_theorem_5_41_zEstimator_scoreLinearization_handoff
      (Vinv := Vinv) hScoreCLT hR hR_meas
  exact hlin.congr hLinearization (ae_of_all _ fun _ => rfl)

/--
van der Vaart 1998, Theorem 5.41, scaled-estimator handoff from a
Score-valued Taylor residual.

After Taylor expansion and root simplification, the source proof aims to show
that the scaled estimator is a.e. equal to
`-(P dot psi_theta0)^{-1} (score_n + residual_n)` with
`residual_n = o_P(1)`.  This wrapper maps that residual through the inverse
derivative and feeds the compiled weak-limit handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreResidual
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (Vinv : Score →L[ℝ] Θ)
    {score residual : ℕ -> Ω -> Score}
    {scaledEstimator : ℕ -> Ω -> Θ} {Z : Ω' -> Score}
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hResidual : TendstoInMeasure P residual atTop 0)
    (hResidual_meas : ∀ n, AEMeasurable (residual n) P)
    (hLinearization : ∀ n : ℕ,
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (score n ω + residual n ω))
        =ᵐ[P] scaledEstimator n) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  let R : ℕ -> Ω -> Θ :=
    fun n ω => (-Vinv : Score →L[ℝ] Θ) (residual n ω)
  have hR : TendstoInMeasure P R atTop 0 :=
    vaart1998_theorem_5_41_inverseDerivative_remainder_tendstoInMeasure
      (P := P) Vinv hResidual
  have hR_meas : ∀ n, AEMeasurable (R n) P := by
    intro n
    exact
      (-Vinv : Score →L[ℝ] Θ).continuous.measurable.comp_aemeasurable
        (hResidual_meas n)
  have hLinearization_split : ∀ n : ℕ,
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (score n ω) + R n ω)
        =ᵐ[P] scaledEstimator n := by
    intro n
    exact (hLinearization n).mono fun ω hω => by
      calc
        (-Vinv : Score →L[ℝ] Θ) (score n ω) + R n ω
            = (-Vinv : Score →L[ℝ] Θ) (score n ω + residual n ω) := by
                simp [R, map_add]
        _ = scaledEstimator n ω := hω
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff
      (P := P) (Q := Q) (Vinv := Vinv) (score := score)
      (scaledEstimator := scaledEstimator) (Z := Z) (R := R)
      hScoreCLT hLinearization_split hR hR_meas

/--
van der Vaart 1998, Theorem 5.41, scaled-estimator handoff from the Taylor
score equation.

The source Taylor expansion naturally yields an equation of the form
`V x_n = -(score_n + residual_n)`, where `V = P dot psi_theta0` and
`x_n = sqrt n (thetaHat_n - theta0)`.  Given a left inverse `Vinv`, this
theorem converts that equation into the inverse-derivative linearization
consumed by the Score-residual handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreEquation
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {score residual : ℕ -> Ω -> Score}
    {scaledEstimator : ℕ -> Ω -> Θ} {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hResidual : TendstoInMeasure P residual atTop 0)
    (hResidual_meas : ∀ n, AEMeasurable (residual n) P)
    (hScoreEquation : ∀ n : ℕ,
      ∀ᵐ ω ∂P, V (scaledEstimator n ω) = -(score n ω + residual n ω)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hLinearization : ∀ n : ℕ,
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (score n ω + residual n ω))
        =ᵐ[P] scaledEstimator n := by
    intro n
    exact (hScoreEquation n).mono fun ω hω => by
      calc
        (-Vinv : Score →L[ℝ] Θ) (score n ω + residual n ω)
            = Vinv (-(score n ω + residual n ω)) := by simp
        _ = Vinv (V (scaledEstimator n ω)) := by rw [← hω]
        _ = scaledEstimator n ω := hLeftInverse _
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreResidual
      (P := P) (Q := Q) (Vinv := Vinv) (score := score)
      (residual := residual) (scaledEstimator := scaledEstimator) (Z := Z)
      hScoreCLT hResidual hResidual_meas hLinearization

/--
van der Vaart 1998, Theorem 5.41, scaled-estimator handoff from the Taylor
zero display.

The Taylor expansion in the text first appears as
`score_n + V x_n + residual_n = 0`.  This theorem performs the final additive
algebra to obtain the score equation consumed by
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreEquation`.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {score residual : ℕ -> Ω -> Score}
    {scaledEstimator : ℕ -> Ω -> Θ} {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hResidual : TendstoInMeasure P residual atTop 0)
    (hResidual_meas : ∀ n, AEMeasurable (residual n) P)
    (hTaylorZero : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + V (scaledEstimator n ω) + residual n ω = 0) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hScoreEquation : ∀ n : ℕ,
      ∀ᵐ ω ∂P, V (scaledEstimator n ω) = -(score n ω + residual n ω) := by
    intro n
    exact (hTaylorZero n).mono fun ω hω => by
      have hsum :
          V (scaledEstimator n ω) + (score n ω + residual n ω) = 0 := by
        simpa [add_assoc, add_comm, add_left_comm] using hω
      exact add_eq_zero_iff_eq_neg.mp hsum
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_scoreEquation
      (P := P) (Q := Q) (V := V) (Vinv := Vinv) (score := score)
      (residual := residual) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hResidual hResidual_meas hScoreEquation

/--
van der Vaart 1998, Theorem 5.41, Taylor-zero handoff with separated
residuals.

This is the form closest to the proof: derivative LLN and the dominated
second-derivative Taylor term produce two negligible Score-valued residuals.
Their sum is then fed into the compiled Taylor-zero bridge.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_twoResiduals
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {score derivativeResidual secondResidual : ℕ -> Ω -> Score}
    {scaledEstimator : ℕ -> Ω -> Θ} {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeResidual : TendstoInMeasure P derivativeResidual atTop 0)
    (hSecondResidual : TendstoInMeasure P secondResidual atTop 0)
    (hDerivativeResidual_meas : ∀ n, AEMeasurable (derivativeResidual n) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hTaylorZero : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + V (scaledEstimator n ω) + derivativeResidual n ω +
          secondResidual n ω = 0) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  let residual : ℕ -> Ω -> Score :=
    fun n ω => derivativeResidual n ω + secondResidual n ω
  have hResidual : TendstoInMeasure P residual atTop 0 :=
    vaart1998_theorem_5_41_scoreResidual_add_tendstoInMeasure
      (P := P) hDerivativeResidual hSecondResidual
  have hResidual_meas : ∀ n, AEMeasurable (residual n) P := by
    intro n
    exact (hDerivativeResidual_meas n).add (hSecondResidual_meas n)
  have hTaylorZero_sum : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + V (scaledEstimator n ω) + residual n ω = 0 := by
    intro n
    exact (hTaylorZero n).mono fun ω hω => by
      simpa [residual, add_assoc, add_comm, add_left_comm] using hω
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero
      (P := P) (Q := Q) (V := V) (Vinv := Vinv) (score := score)
      (residual := residual) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hResidual hResidual_meas hTaylorZero_sum

/--
van der Vaart 1998, Theorem 5.41, Taylor-zero handoff with the derivative LLN
residual discharged.

This is the next source-shaped step after the separated-residual bridge: the
derivative residual is instantiated as
`(dotPsi_n(theta0) - P dot psi_theta0) (sqrt n (thetaHat_n - theta0))`.
Its negligibility follows from convergence in probability of the empirical
derivative in operator norm and stochastic boundedness of the scaled estimator.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_derivativeLLN
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    {score secondResidual : ℕ -> Ω -> Score}
    {scaledEstimator : ℕ -> Ω -> Θ} {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondResidual : TendstoInMeasure P secondResidual atTop 0)
    (hDerivativeResidual_meas : ∀ n,
      AEMeasurable
        (fun ω => (empiricalDerivative n ω - V) (scaledEstimator n ω)) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hTaylorZero : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + V (scaledEstimator n ω) +
          (empiricalDerivative n ω - V) (scaledEstimator n ω) +
          secondResidual n ω = 0) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeResidual :
      TendstoInMeasure P
        (fun n ω => (empiricalDerivative n ω - V) (scaledEstimator n ω))
        atTop 0 :=
    vaart1998_theorem_5_41_derivativeResidual_tendstoInMeasure_of_opNorm
      (P := P) (V := V) hDerivativeLLN hScaledEstimator
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_twoResiduals
      (P := P) (Q := Q) (V := V) (Vinv := Vinv) (score := score)
      (derivativeResidual := fun n ω =>
        (empiricalDerivative n ω - V) (scaledEstimator n ω))
      (secondResidual := secondResidual) (scaledEstimator := scaledEstimator)
      (Z := Z) hLeftInverse hScoreCLT hDerivativeResidual hSecondResidual
      hDerivativeResidual_meas hSecondResidual_meas hTaylorZero

/--
van der Vaart 1998, Theorem 5.41, Taylor-zero handoff with derivative and
second-derivative residual negligibility discharged.

The remaining assumptions are now source-shaped: derivative LLN in operator
norm, consistency of the unscaled estimator difference, stochastic boundedness
of the dominated second-derivative average, stochastic boundedness of the
scaled estimator, the deterministic Taylor bound for the quadratic residual,
and the a.e. Taylor-zero display.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_derivativeLLN_secondDerivativeBound
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {curvatureBound : ℕ -> Ω -> ℝ}
    {score secondResidual : ℕ -> Ω -> Score}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖))
    (hDerivativeResidual_meas : ∀ n,
      AEMeasurable
        (fun ω => (empiricalDerivative n ω - V) (scaledEstimator n ω)) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hTaylorZero : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + V (scaledEstimator n ω) +
          (empiricalDerivative n ω - V) (scaledEstimator n ω) +
          secondResidual n ω = 0) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hSecondResidual :
      TendstoInMeasure P secondResidual atTop 0 :=
    vaart1998_theorem_5_41_secondDerivativeResidual_tendstoInMeasure_of_bound
      (P := P) (delta := delta) (scaledEstimator := scaledEstimator)
      (curvatureBound := curvatureBound) (secondResidual := secondResidual)
      hDelta hCurvatureBounded hScaledEstimator hSecondBound
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_derivativeLLN
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (score := score)
      (secondResidual := secondResidual) (scaledEstimator := scaledEstimator)
      (Z := Z) hLeftInverse hScoreCLT hDerivativeLLN hScaledEstimator
      hSecondResidual hDerivativeResidual_meas hSecondResidual_meas
      hTaylorZero

/--
van der Vaart 1998, Theorem 5.41, source Taylor-equation handoff.

The Taylor display is naturally produced as
`score_n + dotPsi_n(theta0) x_n + secondResidual_n = 0`.  This theorem splits
the empirical derivative into `V + (dotPsi_n(theta0) - V)` and then feeds the
compiled derivative and second-derivative residual handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorEquation_derivativeLLN_secondDerivativeBound
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {curvatureBound : ℕ -> Ω -> ℝ}
    {score secondResidual : ℕ -> Ω -> Score}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖))
    (hDerivativeResidual_meas : ∀ n,
      AEMeasurable
        (fun ω => (empiricalDerivative n ω - V) (scaledEstimator n ω)) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hTaylorEquation : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = 0) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hTaylorZero : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + V (scaledEstimator n ω) +
          (empiricalDerivative n ω - V) (scaledEstimator n ω) +
          secondResidual n ω = 0 := by
    intro n
    exact (hTaylorEquation n).mono fun ω hω => by
      have hsplit :
          V (scaledEstimator n ω) +
            (empiricalDerivative n ω - V) (scaledEstimator n ω) =
            empiricalDerivative n ω (scaledEstimator n ω) := by
        simp [sub_eq_add_neg]
      calc
        score n ω + V (scaledEstimator n ω) +
            (empiricalDerivative n ω - V) (scaledEstimator n ω) +
            secondResidual n ω
            = score n ω +
                (V (scaledEstimator n ω) +
                  (empiricalDerivative n ω - V) (scaledEstimator n ω)) +
                secondResidual n ω := by
                abel
        _ = score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
              secondResidual n ω := by rw [hsplit]
        _ = 0 := hω
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorZero_derivativeLLN_secondDerivativeBound
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (delta := delta)
      (scaledEstimator := scaledEstimator) (curvatureBound := curvatureBound)
      (score := score) (secondResidual := secondResidual) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hCurvatureBounded
      hScaledEstimator hSecondBound hDerivativeResidual_meas
      hSecondResidual_meas hTaylorZero

/--
van der Vaart 1998, Theorem 5.41, source Taylor-equation handoff with
derivative-residual measurability discharged.

The derivative residual measurability field is derived from a.e. measurability
of the empirical derivative operator and the scaled estimator.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorEquation_measurableDerivativeLLN_secondDerivativeBound
    {Ω Ω' Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {curvatureBound : ℕ -> Ω -> ℝ}
    {score secondResidual : ℕ -> Ω -> Score}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖))
    (hEmpiricalDerivative_meas : ∀ n, AEMeasurable (empiricalDerivative n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hTaylorEquation : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = 0) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeResidual_meas : ∀ n,
      AEMeasurable
        (fun ω => (empiricalDerivative n ω - V) (scaledEstimator n ω)) P :=
    vaart1998_theorem_5_41_derivativeResidual_aemeasurable_of_operator
      (P := P) (V := V) (empiricalDerivative := empiricalDerivative)
      (scaledEstimator := scaledEstimator) hEmpiricalDerivative_meas
      hScaledEstimator_meas
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorEquation_derivativeLLN_secondDerivativeBound
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (delta := delta)
      (scaledEstimator := scaledEstimator) (curvatureBound := curvatureBound)
      (score := score) (secondResidual := secondResidual) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hCurvatureBounded
      hScaledEstimator hSecondBound hDerivativeResidual_meas
      hSecondResidual_meas hTaylorEquation

end AsymptoticStatistics
end StatInference
