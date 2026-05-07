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

end AsymptoticStatistics
end StatInference
