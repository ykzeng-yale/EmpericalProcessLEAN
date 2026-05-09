import Mathlib.Analysis.Calculus.ContDiff.Defs
import Mathlib.Analysis.Calculus.Deriv.MeanValue
import StatInference.AsymptoticStatistics.Basic
import StatInference.AsymptoticStatistics.MomentEstimators
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
Finite-sample dominated empirical vector average.

If a vector-valued statistic is pointwise bounded in norm by a nonnegative
envelope, then the norm of its empirical average is bounded by the scalar
empirical average of the envelope.
-/
theorem vaart1998_empiricalAverageVector_norm_le_empiricalAverage_envelope
    {Observation E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    {n : ℕ} (sample : SampleAt Observation n)
    (statistic : Observation -> E)
    (envelope : Observation -> ℝ)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hBound : ∀ x, ‖statistic x‖ ≤ envelope x) :
    ‖empiricalAverageVector sample statistic‖ ≤
      ‖empiricalAverage sample envelope‖ := by
  by_cases hn : n = 0
  · subst n
    simp [empiricalAverageVector, empiricalAverage]
  · have hn_nat_pos : 0 < n := Nat.pos_of_ne_zero hn
    have hn_pos : 0 < (n : ℝ) := by exact_mod_cast hn_nat_pos
    have hinv_nonneg : 0 ≤ ((n : ℝ)⁻¹) :=
      inv_nonneg.mpr (le_of_lt hn_pos)
    have hsum_norm_le :
        ‖∑ i : Fin n, statistic (sample i)‖ ≤
          ∑ i : Fin n, ‖statistic (sample i)‖ :=
      norm_sum_le _ _
    have hsum_bound :
        (∑ i : Fin n, ‖statistic (sample i)‖) ≤
          ∑ i : Fin n, envelope (sample i) :=
      Finset.sum_le_sum fun i _hi => hBound (sample i)
    have hvector_bound :
        ‖empiricalAverageVector sample statistic‖ ≤
          (n : ℝ)⁻¹ * ∑ i : Fin n, envelope (sample i) := by
      rw [empiricalAverageVector_eq_inv_smul_sum, norm_smul,
        Real.norm_of_nonneg hinv_nonneg]
      exact
        mul_le_mul_of_nonneg_left (hsum_norm_le.trans hsum_bound)
          hinv_nonneg
    have hsum_nonneg :
        0 ≤ ∑ i : Fin n, envelope (sample i) :=
      Finset.sum_nonneg fun i _hi => hEnvelope_nonneg (sample i)
    have havg_nonneg : 0 ≤ empiricalAverage sample envelope := by
      rw [empiricalAverage_eq_sum_div]
      exact div_nonneg hsum_nonneg (le_of_lt hn_pos)
    calc
      ‖empiricalAverageVector sample statistic‖
          ≤ (n : ℝ)⁻¹ * ∑ i : Fin n, envelope (sample i) := hvector_bound
      _ = ‖empiricalAverage sample envelope‖ := by
          rw [Real.norm_of_nonneg havg_nonneg,
            empiricalAverage_eq_sum_div, div_eq_mul_inv, mul_comm]

/--
van der Vaart 1998, Theorem 5.41, finite-sample dominated Hessian average.

If each selected second-derivative action is bounded in operator norm by a
nonnegative envelope, then the operator norm of its empirical average is
bounded by the scalar empirical average of the envelope.  This packages the
source proof line
`‖n⁻¹ sum ddotPsi_i‖ <= n⁻¹ sum envelope_i`.
-/
theorem vaart1998_theorem_5_41_empiricalSecondDerivativeAction_opNorm_le_empiricalEnvelope
    {Observation Score Θ : Type*}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    {n : ℕ} (sample : SampleAt Observation n)
    (secondDerivative : Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (envelope : Observation -> ℝ)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hBound : ∀ x, ‖secondDerivative x‖ ≤ envelope x) :
    ‖empiricalAverageVector sample secondDerivative‖ ≤
      ‖empiricalAverage sample envelope‖ :=
  vaart1998_empiricalAverageVector_norm_le_empiricalAverage_envelope
    (sample := sample) (statistic := secondDerivative) (envelope := envelope)
    hEnvelope_nonneg hBound

/--
van der Vaart 1998, Theorem 5.41, empirical second-derivative action
operator-norm bound.

This is the sequence-level source wrapper for the dominated Hessian average:
the empirical average of selected second derivatives is bounded by the
empirical average of the fixed envelope, exactly in the form consumed by the
current quadratic Taylor handoff.
-/
theorem vaart1998_theorem_5_41_curvatureOpBound_of_empiricalSecondDerivative_envelope
    {Ω Observation Score Θ : Type*}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (secondDerivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (envelope : Observation -> ℝ)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x) :
    ∀ᶠ n in atTop, ∀ ω,
      ‖empiricalAverageVector (samples n ω) (secondDerivative n ω)‖ ≤
        ‖empiricalAverage (samples n ω) envelope‖ := by
  filter_upwards [hBound] with n hBound_n
  intro ω
  exact
    vaart1998_theorem_5_41_empiricalSecondDerivativeAction_opNorm_le_empiricalEnvelope
      (sample := samples n ω) (secondDerivative := secondDerivative n ω)
      (envelope := envelope) hEnvelope_nonneg (hBound_n ω)

/--
Empirical averages commute with applying a continuous linear operator-valued
statistic.
-/
theorem vaart1998_empiricalAverageVector_clm_apply
    {Observation E F : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    {n : ℕ} (sample : SampleAt Observation n)
    (statistic : Observation -> E →L[ℝ] F) (x : E) :
    (empiricalAverageVector sample statistic) x =
      empiricalAverageVector sample (fun z => statistic z x) := by
  simp [empiricalAverageVector]

/--
Empirical averages commute with applying a bilinear continuous-linear-map
statistic to two arguments.
-/
theorem vaart1998_empiricalAverageVector_bilinear_apply
    {Observation E F G : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    [NormedAddCommGroup G] [NormedSpace ℝ G]
    {n : ℕ} (sample : SampleAt Observation n)
    (statistic : Observation -> E →L[ℝ] F →L[ℝ] G) (x : E) (y : F) :
    (empiricalAverageVector sample statistic) x y =
      empiricalAverageVector sample (fun z => statistic z x y) := by
  rw [vaart1998_empiricalAverageVector_clm_apply
    (sample := sample) (statistic := statistic) (x := x)]
  rw [vaart1998_empiricalAverageVector_clm_apply
    (sample := sample) (statistic := fun z => statistic z x) (x := y)]

/--
A.e.-measurability of a vector-valued empirical average from a.e.-measurability
of each realized summand.

This is the basic finite-sample measurability bridge used for Vaart 5.41
empirical derivative and empirical Hessian averages.
-/
theorem vaart1998_empiricalAverageVector_aemeasurable_of_summands
    {Ω Observation E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [MeasurableSpace E]
    [MeasurableAdd₂ E] [MeasurableConstSMul ℝ E]
    {n : ℕ} (samples : Ω -> SampleAt Observation n)
    (statistic : Ω -> Observation -> E)
    (hSummands : ∀ i : Fin n,
      AEMeasurable (fun ω => statistic ω (samples ω i)) P) :
    AEMeasurable
      (fun ω => empiricalAverageVector (samples ω) (statistic ω)) P := by
  have hsum :
      AEMeasurable
        (fun ω => ∑ i : Fin n, statistic ω (samples ω i)) P :=
    Finset.aemeasurable_fun_sum Finset.univ fun i _hi => hSummands i
  simpa [empiricalAverageVector] using hsum.const_smul ((n : ℝ)⁻¹)

/--
van der Vaart 1998, Theorem 5.41, empirical derivative a.e.-measurability from
sampled derivative-map a.e.-measurability.

This discharges the empirical derivative measurability field in the current
source endpoint from finite-sample summand measurability.
-/
theorem vaart1998_theorem_5_41_empiricalDerivative_aemeasurable_of_summands
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Θ)
    (hSummands : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P) :
    ∀ n : ℕ,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P := by
  intro n
  exact
    vaart1998_empiricalAverageVector_aemeasurable_of_summands
      (P := P) (samples := samples n)
      (statistic := fun ω x => derivativeAt n ω x (theta0 n ω))
      (hSummands n)

/--
van der Vaart 1998, Theorem 5.41, empirical second-derivative action
a.e.-measurability from sampled second-derivative a.e.-measurability.

This is the Hessian analogue of the empirical derivative measurability bridge.
-/
theorem vaart1998_theorem_5_41_empiricalSecondDerivativeAction_aemeasurable_of_summands
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (hSummands : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P) :
    ∀ n : ℕ,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P := by
  intro n
  exact
    vaart1998_empiricalAverageVector_aemeasurable_of_summands
      (P := P) (samples := samples n)
      (statistic := fun ω x => secondDerivative n ω x)
      (hSummands n)

/--
van der Vaart 1998, Theorem 5.41, empirical quadratic Taylor display from
pointwise Taylor identities.

If every sampled observation satisfies the selected second-order Taylor
identity, then the empirical averages satisfy the literal quadratic Taylor
display consumed by the current source handoff.
-/
theorem vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise
    {Observation Score Θ : Type*}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    {n : ℕ} (sample : SampleAt Observation n)
    (scoreAtTheta0 estimatingAtEstimator : Observation -> Score)
    (derivative : Observation -> Θ →L[ℝ] Score)
    (secondDerivative : Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (delta scaledEstimator : Θ)
    (hPointwise : ∀ i : Fin n,
      scoreAtTheta0 (sample i) + derivative (sample i) scaledEstimator +
        (1 / 2 : ℝ) •
          secondDerivative (sample i) delta scaledEstimator =
        estimatingAtEstimator (sample i)) :
    empiricalAverageVector sample scoreAtTheta0 +
        (empiricalAverageVector sample derivative) scaledEstimator +
        (1 / 2 : ℝ) •
          (empiricalAverageVector sample secondDerivative) delta scaledEstimator =
      empiricalAverageVector sample estimatingAtEstimator := by
  rw [vaart1998_empiricalAverageVector_clm_apply
    (sample := sample) (statistic := derivative) (x := scaledEstimator)]
  rw [vaart1998_empiricalAverageVector_bilinear_apply
    (sample := sample) (statistic := secondDerivative)
    (x := delta) (y := scaledEstimator)]
  have hsum :
      ∑ i : Fin n,
          (n : ℝ)⁻¹ •
            (scoreAtTheta0 (sample i) +
              derivative (sample i) scaledEstimator +
              (1 / 2 : ℝ) •
                secondDerivative (sample i) delta scaledEstimator) =
        ∑ i : Fin n,
          (n : ℝ)⁻¹ • estimatingAtEstimator (sample i) := by
    exact Finset.sum_congr rfl fun i _hi => by rw [hPointwise i]
  simpa [empiricalAverageVector, Finset.sum_add_distrib, Finset.smul_sum, smul_add,
    smul_smul, mul_comm, mul_left_comm, mul_assoc] using hsum

/--
van der Vaart 1998, Theorem 5.41, a.e. empirical quadratic Taylor display from
pointwise Taylor identities.

This is the random-sequence version of
`vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise`.
-/
theorem vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise_ae
    {Ω Observation Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scoreAtTheta0 estimatingAtEstimator : ℕ -> Ω -> Observation -> Score)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Score)
    (secondDerivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (delta scaledEstimator : ℕ -> Ω -> Θ)
    (hPointwise : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (scaledEstimator n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (scaledEstimator n ω) =
          estimatingAtEstimator n ω (samples n ω i)) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω) +
            (empiricalAverageVector (samples n ω) (derivative n ω))
              (scaledEstimator n ω) +
            (1 / 2 : ℝ) •
              (empiricalAverageVector (samples n ω) (secondDerivative n ω))
                (delta n ω) (scaledEstimator n ω) =
          empiricalAverageVector (samples n ω)
            (estimatingAtEstimator n ω) := by
  intro n
  exact (hPointwise n).mono fun ω hω =>
    vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise
      (sample := samples n ω)
      (scoreAtTheta0 := scoreAtTheta0 n ω)
      (estimatingAtEstimator := estimatingAtEstimator n ω)
      (derivative := derivative n ω)
      (secondDerivative := secondDerivative n ω)
      (delta := delta n ω) (scaledEstimator := scaledEstimator n ω) hω

/--
van der Vaart 1998, Theorem 5.41, scalar selected second-order Taylor bridge.

This is the one-dimensional analytic core behind the raw pointwise Taylor
identity.  A Cauchy mean-value argument applied to the residual
`f x - f a - fderiv a * (x - a)` and the quadratic gauge `(x - a)^2`
turns a first-order Taylor formula for the derivative into a selected
second-order Taylor formula for `f`.
-/
theorem vaart1998_theorem_5_41_scalar_selectedSecondOrderTaylor_of_derivativeTaylor
    (f fderiv fsecond : ℝ -> ℝ) {a b : ℝ}
    (hab : a < b)
    (hfc : ContinuousOn f (Set.Icc a b))
    (hff' : ∀ x ∈ Set.Ioo a b, HasDerivAt f (fderiv x) x)
    (hfderiv_taylor : ∀ x ∈ Set.Ioo a b,
      fderiv x - fderiv a = fsecond x * (x - a)) :
    ∃ c ∈ Set.Ioo a b,
      f a + fderiv a * (b - a) +
          (1 / 2 : ℝ) * fsecond c * (b - a) ^ 2 =
        f b := by
  let residual : ℝ -> ℝ := fun x => f x - f a - fderiv a * (x - a)
  let quadratic : ℝ -> ℝ := fun x => (x - a) ^ 2
  have hres_cont : ContinuousOn residual (Set.Icc a b) := by
    have hlinear : ContinuousOn (fun x : ℝ => fderiv a * (x - a)) (Set.Icc a b) :=
      continuousOn_const.mul (continuousOn_id.sub continuousOn_const)
    exact (hfc.sub continuousOn_const).sub hlinear
  have hquad_cont : ContinuousOn quadratic (Set.Icc a b) := by
    exact (continuousOn_id.sub continuousOn_const).pow 2
  have hres_deriv : ∀ x ∈ Set.Ioo a b,
      HasDerivAt residual (fderiv x - fderiv a) x := by
    intro x hx
    have hlinear_deriv :
        HasDerivAt (fun y : ℝ => fderiv a * (y - a)) (fderiv a) x := by
      have hsub : HasDerivAt (fun y : ℝ => y - a) 1 x :=
        (hasDerivAt_id x).sub_const a
      simpa using hsub.const_mul (fderiv a)
    simpa [residual] using ((hff' x hx).sub_const (f a)).sub hlinear_deriv
  have hquad_deriv : ∀ x ∈ Set.Ioo a b,
      HasDerivAt quadratic (2 * (x - a)) x := by
    intro x _hx
    have hsub : HasDerivAt (fun y : ℝ => y - a) 1 x :=
      (hasDerivAt_id x).sub_const a
    simpa [quadratic, pow_one, two_mul, mul_comm, mul_left_comm, mul_assoc] using
      hsub.pow 2
  obtain ⟨c, hc, hmvt⟩ :=
    exists_ratio_hasDerivAt_eq_ratio_slope
      quadratic (fun x : ℝ => 2 * (x - a)) hab hquad_cont hquad_deriv
      residual (fun x : ℝ => fderiv x - fderiv a) hres_cont hres_deriv
  have hcpos : 0 < c - a := sub_pos.mpr hc.1
  have hmvt' :
      residual b * (2 * (c - a)) =
        (b - a) ^ 2 * (fsecond c * (c - a)) := by
    simpa [residual, quadratic, hfderiv_taylor c hc, pow_two,
      mul_comm, mul_left_comm, mul_assoc] using hmvt
  have hres_two : residual b * 2 = (b - a) ^ 2 * fsecond c := by
    nlinarith
  have hres_half : residual b = (1 / 2 : ℝ) * fsecond c * (b - a) ^ 2 := by
    nlinarith
  refine ⟨c, hc, ?_⟩
  dsimp [residual] at hres_half
  nlinarith

/--
van der Vaart 1998, Theorem 5.41, coordinate path selected Taylor bridge.

Applying the scalar Cauchy-MVT Taylor bridge to every coordinate path produces
coordinatewise selected intermediate points and the raw Taylor identities with
the selected scalar second-derivative values.
-/
theorem vaart1998_theorem_5_41_coordinate_selectedSecondAction_exists_of_scalarPathDerivativeTaylor
    {Coord Θ : Type*}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (pathValue pathDerivative pathSecond : Coord -> ℝ -> ℝ)
    (rawAtTheta0 rawAtEstimator : Coord -> ℝ)
    (derivative : Θ →L[ℝ] (Coord -> ℝ))
    (delta : Θ)
    (hValue0 : ∀ j : Coord, pathValue j 0 = rawAtTheta0 j)
    (hValue1 : ∀ j : Coord, pathValue j 1 = rawAtEstimator j)
    (hDerivative0 : ∀ j : Coord, pathDerivative j 0 = derivative delta j)
    (hContinuous : ∀ j : Coord,
      ContinuousOn (pathValue j) (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ j : Coord, ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      HasDerivAt (pathValue j) (pathDerivative j x) x)
    (hDerivativeTaylor : ∀ j : Coord, ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      pathDerivative j x - pathDerivative j 0 =
        pathSecond j x * (x - 0)) :
    ∃ selected : Coord -> ℝ,
      (∀ j : Coord, selected j ∈ Set.Ioo (0 : ℝ) 1) ∧
        ∀ j : Coord,
          rawAtTheta0 j + derivative delta j +
              (1 / 2 : ℝ) * pathSecond j (selected j) =
            rawAtEstimator j := by
  classical
  have hExists : ∀ j : Coord,
      ∃ c ∈ Set.Ioo (0 : ℝ) 1,
        rawAtTheta0 j + derivative delta j +
            (1 / 2 : ℝ) * pathSecond j c =
          rawAtEstimator j := by
    intro j
    obtain ⟨c, hc, hTaylor⟩ :=
      vaart1998_theorem_5_41_scalar_selectedSecondOrderTaylor_of_derivativeTaylor
        (pathValue j) (pathDerivative j) (pathSecond j)
        (a := 0) (b := 1) zero_lt_one
        (hContinuous j) (hDerivative j) (hDerivativeTaylor j)
    refine ⟨c, hc, ?_⟩
    simpa [hValue0 j, hValue1 j, hDerivative0 j, sub_zero,
      pow_two, mul_comm, mul_left_comm, mul_assoc] using hTaylor
  refine ⟨fun j => Classical.choose (hExists j), ?_, ?_⟩
  · intro j
    exact (Classical.choose_spec (hExists j)).1
  · intro j
    exact (Classical.choose_spec (hExists j)).2

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled coordinate path selected
Taylor bridge.

This random-sample wrapper prepares the coordinate raw Taylor hypotheses used
by the finite-coordinate empirical-average endpoint.  It produces the selected
coordinate intermediate points for each sampled observation.
-/
theorem vaart1998_theorem_5_41_coordinate_selectedSecondAction_exists_ae_of_scalarPathDerivativeTaylor
    {Ω Observation Coord Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (pathValue pathDerivative pathSecond :
      ℕ -> Ω -> Observation -> Coord -> ℝ -> ℝ)
    (rawAtTheta0 rawAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (delta : ℕ -> Ω -> Θ)
    (hValue0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathValue n ω (samples n ω i) j 0 =
          rawAtTheta0 n ω (samples n ω i) j)
    (hValue1 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathValue n ω (samples n ω i) j 1 =
          rawAtEstimator n ω (samples n ω i) j)
    (hDerivative0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathDerivative n ω (samples n ω i) j 0 =
          derivative n ω (samples n ω i) (delta n ω) j)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn (pathValue n ω (samples n ω i) j)
          (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt (pathValue n ω (samples n ω i) j)
            (pathDerivative n ω (samples n ω i) j x) x)
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathDerivative n ω (samples n ω i) j x -
              pathDerivative n ω (samples n ω i) j 0 =
            pathSecond n ω (samples n ω i) j x * (x - 0)) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∃ selected : Coord -> ℝ,
          (∀ j : Coord, selected j ∈ Set.Ioo (0 : ℝ) 1) ∧
            ∀ j : Coord,
              rawAtTheta0 n ω (samples n ω i) j +
                  derivative n ω (samples n ω i) (delta n ω) j +
                  (1 / 2 : ℝ) *
                    pathSecond n ω (samples n ω i) j (selected j) =
                rawAtEstimator n ω (samples n ω i) j := by
  intro n
  filter_upwards [hValue0 n, hValue1 n, hDerivative0 n, hContinuous n,
    hDerivative n, hDerivativeTaylor n] with
    ω hValue0ω hValue1ω hDerivative0ω hContinuousω hDerivativeω hTaylorω
  intro i
  exact
    vaart1998_theorem_5_41_coordinate_selectedSecondAction_exists_of_scalarPathDerivativeTaylor
      (pathValue := fun j t => pathValue n ω (samples n ω i) j t)
      (pathDerivative := fun j t => pathDerivative n ω (samples n ω i) j t)
      (pathSecond := fun j t => pathSecond n ω (samples n ω i) j t)
      (rawAtTheta0 := rawAtTheta0 n ω (samples n ω i))
      (rawAtEstimator := rawAtEstimator n ω (samples n ω i))
      (derivative := derivative n ω (samples n ω i))
      (delta := delta n ω)
      (hValue0ω i) (hValue1ω i) (hDerivative0ω i)
      (hContinuousω i) (hDerivativeω i) (hTaylorω i)

/--
van der Vaart 1998, Theorem 5.41, coordinate raw Taylor bridge from scalar
path Taylor and endpoint second-derivative actions.

The scalar Cauchy-MVT path theorem produces coordinatewise selected
intermediate points.  If every selected path second-derivative value agrees
with the endpoint bilinear `secondDerivative` action along the segment, this
lemma converts the selected path display into the coordinate raw Taylor
hypotheses consumed by the finite-coordinate endpoint.
-/
theorem vaart1998_theorem_5_41_coordinate_rawTaylor_of_scalarPathDerivativeTaylor_secondDerivativeAction
    {Coord Θ : Type*}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (pathValue pathDerivative pathSecond : Coord -> ℝ -> ℝ)
    (rawAtTheta0 rawAtEstimator : Coord -> ℝ)
    (derivative : Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative : Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (delta : Θ)
    (hValue0 : ∀ j : Coord, pathValue j 0 = rawAtTheta0 j)
    (hValue1 : ∀ j : Coord, pathValue j 1 = rawAtEstimator j)
    (hDerivative0 : ∀ j : Coord, pathDerivative j 0 = derivative delta j)
    (hContinuous : ∀ j : Coord,
      ContinuousOn (pathValue j) (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ j : Coord, ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      HasDerivAt (pathValue j) (pathDerivative j x) x)
    (hDerivativeTaylor : ∀ j : Coord, ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      pathDerivative j x - pathDerivative j 0 =
        pathSecond j x * (x - 0))
    (hSecondAction : ∀ j : Coord, ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      pathSecond j x = secondDerivative delta delta j) :
    ∀ j : Coord,
      rawAtTheta0 j + derivative delta j +
          (1 / 2 : ℝ) * secondDerivative delta delta j =
        rawAtEstimator j := by
  obtain ⟨selected, hselected_mem, hselected_taylor⟩ :=
    vaart1998_theorem_5_41_coordinate_selectedSecondAction_exists_of_scalarPathDerivativeTaylor
      (pathValue := pathValue) (pathDerivative := pathDerivative)
      (pathSecond := pathSecond) (rawAtTheta0 := rawAtTheta0)
      (rawAtEstimator := rawAtEstimator) (derivative := derivative)
      (delta := delta) hValue0 hValue1 hDerivative0 hContinuous
      hDerivative hDerivativeTaylor
  intro j
  have hsecond :
      pathSecond j (selected j) = secondDerivative delta delta j :=
    hSecondAction j (selected j) (hselected_mem j)
  simpa [hsecond] using hselected_taylor j

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled coordinate raw Taylor bridge
from scalar path Taylor and endpoint second-derivative actions.

This wrapper removes the selected path second-derivative values from the
random-source assumptions and produces the coordinate raw Taylor hypothesis
needed by
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinateRawTaylor_envelope`.
-/
theorem vaart1998_theorem_5_41_coordinate_rawTaylor_ae_of_scalarPathDerivativeTaylor_secondDerivativeAction
    {Ω Observation Coord Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (pathValue pathDerivative pathSecond :
      ℕ -> Ω -> Observation -> Coord -> ℝ -> ℝ)
    (rawAtTheta0 rawAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (delta : ℕ -> Ω -> Θ)
    (hValue0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathValue n ω (samples n ω i) j 0 =
          rawAtTheta0 n ω (samples n ω i) j)
    (hValue1 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathValue n ω (samples n ω i) j 1 =
          rawAtEstimator n ω (samples n ω i) j)
    (hDerivative0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathDerivative n ω (samples n ω i) j 0 =
          derivative n ω (samples n ω i) (delta n ω) j)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn (pathValue n ω (samples n ω i) j)
          (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt (pathValue n ω (samples n ω i) j)
            (pathDerivative n ω (samples n ω i) j x) x)
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathDerivative n ω (samples n ω i) j x -
              pathDerivative n ω (samples n ω i) j 0 =
            pathSecond n ω (samples n ω i) j x * (x - 0))
    (hSecondAction : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathSecond n ω (samples n ω i) j x =
            secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω) j) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        rawAtTheta0 n ω (samples n ω i) j +
            derivative n ω (samples n ω i) (delta n ω) j +
            (1 / 2 : ℝ) *
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) j =
          rawAtEstimator n ω (samples n ω i) j := by
  intro n
  filter_upwards [hValue0 n, hValue1 n, hDerivative0 n, hContinuous n,
    hDerivative n, hDerivativeTaylor n, hSecondAction n] with
    ω hValue0ω hValue1ω hDerivative0ω hContinuousω hDerivativeω hTaylorω
      hSecondω
  intro i
  exact
    vaart1998_theorem_5_41_coordinate_rawTaylor_of_scalarPathDerivativeTaylor_secondDerivativeAction
      (pathValue := fun j t => pathValue n ω (samples n ω i) j t)
      (pathDerivative := fun j t => pathDerivative n ω (samples n ω i) j t)
      (pathSecond := fun j t => pathSecond n ω (samples n ω i) j t)
      (rawAtTheta0 := rawAtTheta0 n ω (samples n ω i))
      (rawAtEstimator := rawAtEstimator n ω (samples n ω i))
      (derivative := derivative n ω (samples n ω i))
      (secondDerivative := secondDerivative n ω (samples n ω i))
      (delta := delta n ω)
      (hValue0ω i) (hValue1ω i) (hDerivative0ω i)
      (hContinuousω i) (hDerivativeω i) (hTaylorω i) (hSecondω i)

/--
van der Vaart 1998, Theorem 5.41, coordinatewise raw Taylor assembly.

For finite-dimensional real estimating equations, the selected second
derivative may be chosen coordinate by coordinate.  This lemma turns those
coordinate scalar Taylor identities into the vector-valued raw Taylor identity
consumed by the source endpoint.
-/
theorem vaart1998_theorem_5_41_pi_rawTaylor_of_coordinate_rawTaylor
    {Coord Θ : Type*}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (rawAtTheta0 rawAtEstimator : Coord -> ℝ)
    (derivative : Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative : Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (delta : Θ)
    (hCoordTaylor : ∀ j : Coord,
      rawAtTheta0 j + derivative delta j +
          (1 / 2 : ℝ) * secondDerivative delta delta j =
        rawAtEstimator j) :
    rawAtTheta0 + derivative delta +
        (1 / 2 : ℝ) • secondDerivative delta delta =
      rawAtEstimator := by
  funext j
  simpa [Pi.add_apply, Pi.smul_apply] using hCoordTaylor j

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled coordinatewise raw Taylor
assembly.

This is the random-sample version of
`vaart1998_theorem_5_41_pi_rawTaylor_of_coordinate_rawTaylor`.
-/
theorem vaart1998_theorem_5_41_pi_rawTaylor_ae_of_coordinate_rawTaylor
    {Ω Observation Coord Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (rawAtTheta0 rawAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (delta : ℕ -> Ω -> Θ)
    (hCoordTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        rawAtTheta0 n ω (samples n ω i) j +
            derivative n ω (samples n ω i) (delta n ω) j +
            (1 / 2 : ℝ) *
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) j =
          rawAtEstimator n ω (samples n ω i) j) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        rawAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (delta n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) =
          rawAtEstimator n ω (samples n ω i) := by
  intro n
  exact (hCoordTaylor n).mono fun ω hω i =>
    vaart1998_theorem_5_41_pi_rawTaylor_of_coordinate_rawTaylor
      (rawAtTheta0 := rawAtTheta0 n ω (samples n ω i))
      (rawAtEstimator := rawAtEstimator n ω (samples n ω i))
      (derivative := derivative n ω (samples n ω i))
      (secondDerivative := secondDerivative n ω (samples n ω i))
      (delta := delta n ω) (hω i)

/--
van der Vaart 1998, Theorem 5.41, scaled single-observation Taylor identity.

The textbook proves the selected Taylor identity before multiplying by the
normalizing rate.  This lemma turns the raw identity
`rawAtTheta0 + derivative delta + 1 / 2 • secondDerivative delta delta =
rawAtEstimator` into the scaled form consumed by the empirical-average
handoff, assuming the score, estimating equation, and estimator increment have
all been scaled by the same scalar.
-/
theorem vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_of_unscaled_selectedTaylor
    {Score Θ : Type*}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (scale : ℝ)
    (rawAtTheta0 rawAtEstimator scoreAtTheta0 estimatingAtEstimator : Score)
    (derivative : Θ →L[ℝ] Score)
    (secondDerivative : Θ →L[ℝ] Θ →L[ℝ] Score)
    (delta scaledEstimator : Θ)
    (hScore_scaled : scoreAtTheta0 = scale • rawAtTheta0)
    (hEstimator_scaled : estimatingAtEstimator = scale • rawAtEstimator)
    (hScaledEstimator : scaledEstimator = scale • delta)
    (hRawTaylor :
      rawAtTheta0 + derivative delta +
          (1 / 2 : ℝ) • secondDerivative delta delta =
        rawAtEstimator) :
    scoreAtTheta0 + derivative scaledEstimator +
        (1 / 2 : ℝ) • secondDerivative delta scaledEstimator =
      estimatingAtEstimator := by
  subst scoreAtTheta0
  subst estimatingAtEstimator
  subst scaledEstimator
  simpa [smul_add, smul_smul, mul_comm, mul_left_comm, mul_assoc] using
    congrArg (fun z : Score => scale • z) hRawTaylor

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled scaled Taylor identities from
raw selected Taylor identities.

This is the sampled random-sequence version of
`vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_of_unscaled_selectedTaylor`.
It is designed to feed
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_pointwiseTaylor_envelope`.
-/
theorem vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_ae_of_unscaled_selectedTaylor
    {Ω Observation Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (rawAtTheta0 rawAtEstimator scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Score)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Score)
    (secondDerivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (delta scaledEstimator : ℕ -> Ω -> Θ)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • rawAtTheta0 n ω (samples n ω i))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • rawAtEstimator n ω (samples n ω i))
    (hScaledEstimator : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hRawTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        rawAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (delta n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i) (delta n ω) (delta n ω) =
          rawAtEstimator n ω (samples n ω i)) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (scaledEstimator n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (scaledEstimator n ω) =
          estimatingAtEstimator n ω (samples n ω i) := by
  intro n
  filter_upwards [hScore_scaled n, hEstimator_scaled n, hScaledEstimator n,
    hRawTaylor n] with ω hScore hEstimator hScaled hTaylor
  intro i
  exact
    vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_of_unscaled_selectedTaylor
      (scale := scale n ω)
      (rawAtTheta0 := rawAtTheta0 n ω (samples n ω i))
      (rawAtEstimator := rawAtEstimator n ω (samples n ω i))
      (scoreAtTheta0 := scoreAtTheta0 n ω (samples n ω i))
      (estimatingAtEstimator := estimatingAtEstimator n ω (samples n ω i))
      (derivative := derivative n ω (samples n ω i))
      (secondDerivative := secondDerivative n ω (samples n ω i))
      (delta := delta n ω) (scaledEstimator := scaledEstimator n ω)
      (hScore i) (hEstimator i) hScaled (hTaylor i)

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
van der Vaart 1998, Theorem 5.41, quadratic second-derivative residual
measurability.

The source Taylor term
`(1 / 2) • ddotPsi_n(tildeTheta_n) delta_n scaledEstimator_n` is a.e.
measurable once the selected second-derivative action, the unscaled estimator
difference, and the scaled estimator are a.e. measurable.
-/
theorem vaart1998_theorem_5_41_secondDerivativeResidual_aemeasurable_of_operator
    {Ω Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [BorelSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    {secondDerivativeAction : ℕ -> Ω -> Θ →L[ℝ] Θ →L[ℝ] Score}
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    (hSecondDerivativeAction_meas :
      ∀ n, AEMeasurable (secondDerivativeAction n) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P) :
    ∀ n,
      AEMeasurable
        (fun ω =>
          (1 / 2 : ℝ) •
            secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω)) P := by
  intro n
  have hFirstEval :
      Measurable
        fun p : (Θ →L[ℝ] Θ →L[ℝ] Score) × Θ => p.1 p.2 :=
    (isBoundedBilinearMap_apply
      (𝕜 := ℝ) (E := Θ) (F := Θ →L[ℝ] Score)).continuous.measurable
  have hActionDelta :
      AEMeasurable
        (fun ω => secondDerivativeAction n ω (delta n ω)) P :=
    hFirstEval.comp_aemeasurable
      ((hSecondDerivativeAction_meas n).prodMk (hDelta_meas n))
  have hSecondEval :
      Measurable fun p : (Θ →L[ℝ] Score) × Θ => p.1 p.2 :=
    (isBoundedBilinearMap_apply (𝕜 := ℝ) (E := Θ) (F := Score)).continuous.measurable
  exact
    (hSecondEval.comp_aemeasurable
      (hActionDelta.prodMk (hScaledEstimator_meas n))).const_smul (1 / 2 : ℝ)

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
van der Vaart 1998, Theorem 5.41, absorption of the `1 / 2` Taylor factor in
the second-derivative residual bound.

The textbook Taylor residual has a factor `1 / 2`; the probabilistic handoff
only needs the coarser product bound.
-/
theorem vaart1998_theorem_5_41_secondDerivativeResidual_bound_of_half_bound
    {Ω Score Θ : Type*} [MeasurableSpace Ω]
    [NormedAddCommGroup Score]
    [NormedAddCommGroup Θ]
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {curvatureBound : ℕ -> Ω -> ℝ}
    {secondResidual : ℕ -> Ω -> Score}
    (hSecondHalfBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        (1 / 2 : ℝ) *
          (‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖))) :
    ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖) := by
  filter_upwards [hSecondHalfBound] with n hbnd
  intro ω
  let product : ℝ :=
    ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖)
  have hproduct_nonneg : 0 ≤ product := by
    exact mul_nonneg (norm_nonneg _) (mul_nonneg (norm_nonneg _) (norm_nonneg _))
  calc
    ‖secondResidual n ω‖
        ≤ (1 / 2 : ℝ) * product := by simpa [product] using hbnd ω
    _ ≤ 1 * product := by
        exact mul_le_mul_of_nonneg_right (by norm_num : (1 / 2 : ℝ) ≤ 1)
          hproduct_nonneg
    _ = product := by simp

/--
van der Vaart 1998, Theorem 5.41, second-derivative Taylor residual with the
source `1 / 2` factor.
-/
theorem vaart1998_theorem_5_41_secondDerivativeResidual_tendstoInMeasure_of_half_bound
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
    (hSecondHalfBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        (1 / 2 : ℝ) *
          (‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖))) :
    TendstoInMeasure P secondResidual atTop 0 :=
  vaart1998_theorem_5_41_secondDerivativeResidual_tendstoInMeasure_of_bound
    (P := P) (delta := delta) (scaledEstimator := scaledEstimator)
    (curvatureBound := curvatureBound) (secondResidual := secondResidual)
    hDelta hCurvatureBounded hScaledEstimator
    (vaart1998_theorem_5_41_secondDerivativeResidual_bound_of_half_bound
      (delta := delta) (scaledEstimator := scaledEstimator)
      (curvatureBound := curvatureBound) (secondResidual := secondResidual)
      hSecondHalfBound)

/--
van der Vaart 1998, Theorem 5.41, source half-bound from a quadratic
second-derivative form.

The Taylor residual is a `1 / 2` multiple of the second derivative applied to
the unscaled and scaled estimator differences.  A dominated operator-norm
bound on that bilinear second derivative gives the source half-bound consumed
by the current Theorem 5.41 handoff.
-/
theorem vaart1998_theorem_5_41_secondDerivativeResidual_half_bound_of_bilinear_opNorm_bound
    {Ω Score Θ : Type*} [MeasurableSpace Ω]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {curvatureBound : ℕ -> Ω -> ℝ}
    {secondDerivativeAction : ℕ -> Ω -> Θ →L[ℝ] Θ →L[ℝ] Score}
    {secondResidual : ℕ -> Ω -> Score}
    (hSecondResidual_eq : ∀ᶠ n in atTop, ∀ ω,
      secondResidual n ω =
        (1 / 2 : ℝ) •
          secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω))
    (hCurvatureOpBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondDerivativeAction n ω‖ ≤ ‖curvatureBound n ω‖) :
    ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        (1 / 2 : ℝ) *
          (‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖)) := by
  filter_upwards [hSecondResidual_eq, hCurvatureOpBound] with n heq hop
  intro ω
  have hhalf_norm : ‖(1 / 2 : ℝ)‖ = (1 / 2 : ℝ) := by norm_num
  have hquadratic_le :
      ‖secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω)‖ ≤
        ‖curvatureBound n ω‖ * ‖delta n ω‖ *
          ‖scaledEstimator n ω‖ := by
    have hop_delta :
        ‖secondDerivativeAction n ω‖ * ‖delta n ω‖ ≤
          ‖curvatureBound n ω‖ * ‖delta n ω‖ :=
      mul_le_mul_of_nonneg_right (hop ω) (norm_nonneg _)
    have hop_delta_scaled :
        ‖secondDerivativeAction n ω‖ * ‖delta n ω‖ *
            ‖scaledEstimator n ω‖ ≤
          ‖curvatureBound n ω‖ * ‖delta n ω‖ *
            ‖scaledEstimator n ω‖ :=
      mul_le_mul_of_nonneg_right hop_delta (norm_nonneg _)
    exact
      (secondDerivativeAction n ω).le_opNorm₂
        (delta n ω) (scaledEstimator n ω) |>.trans hop_delta_scaled
  calc
    ‖secondResidual n ω‖
        = (1 / 2 : ℝ) *
            ‖secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω)‖ := by
            rw [heq ω, norm_smul, hhalf_norm]
    _ ≤ (1 / 2 : ℝ) *
          (‖curvatureBound n ω‖ * ‖delta n ω‖ *
            ‖scaledEstimator n ω‖) :=
        mul_le_mul_of_nonneg_left hquadratic_le (by norm_num)
    _ = (1 / 2 : ℝ) *
          (‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖)) := by
        ring

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
van der Vaart 1998, Theorem 5.41, Taylor equation from root and Taylor
expansion.

The source proof first has the root equation
`Psi_n(thetaHat_n) = 0` and the Taylor display identifying
`Psi_n(thetaHat_n)` with the score, derivative term, and second residual.
This lemma packages their a.e. combination into the exact Taylor equation
consumed by the asymptotic-normality handoff.
-/
theorem vaart1998_theorem_5_41_taylorEquation_of_root_taylorExpansion
    {Ω Score Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    {score estimatingEquationAtEstimator secondResidual : ℕ -> Ω -> Score}
    {empiricalDerivative : ℕ -> Ω -> Θ →L[ℝ] Score}
    {scaledEstimator : ℕ -> Ω -> Θ}
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P, estimatingEquationAtEstimator n ω = 0)
    (hTaylorExpansion : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = estimatingEquationAtEstimator n ω) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = 0 := by
  intro n
  filter_upwards [hTaylorExpansion n, hRoot n] with ω hTaylor hRoot
  exact hTaylor.trans hRoot

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

/--
van der Vaart 1998, Theorem 5.41, source root-and-Taylor-expansion handoff.

This wrapper consumes the textbook source fields `Psi_n(thetaHat_n) = 0` and
the Taylor expansion of `Psi_n(thetaHat_n)`, then feeds the resulting Taylor
equation into the compiled derivative-LLN and second-derivative-residual
handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeBound
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
    {score estimatingEquationAtEstimator secondResidual : ℕ -> Ω -> Score}
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
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P, estimatingEquationAtEstimator n ω = 0)
    (hTaylorExpansion : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = estimatingEquationAtEstimator n ω) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hTaylorEquation : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = 0 :=
    vaart1998_theorem_5_41_taylorEquation_of_root_taylorExpansion
      (P := P) (score := score)
      (estimatingEquationAtEstimator := estimatingEquationAtEstimator)
      (secondResidual := secondResidual)
      (empiricalDerivative := empiricalDerivative)
      (scaledEstimator := scaledEstimator) hRoot hTaylorExpansion
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_taylorEquation_measurableDerivativeLLN_secondDerivativeBound
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (delta := delta)
      (scaledEstimator := scaledEstimator) (curvatureBound := curvatureBound)
      (score := score) (secondResidual := secondResidual) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hCurvatureBounded
      hScaledEstimator hSecondBound hEmpiricalDerivative_meas
      hScaledEstimator_meas hSecondResidual_meas hTaylorEquation

/--
van der Vaart 1998, Theorem 5.41, source root-and-Taylor-expansion handoff
with the textbook `1 / 2` second-derivative residual factor.

This is the same endpoint as
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeBound`,
but it accepts the direct Taylor-theorem half-bound.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeHalfBound
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
    {score estimatingEquationAtEstimator secondResidual : ℕ -> Ω -> Score}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondHalfBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        (1 / 2 : ℝ) *
          (‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖)))
    (hEmpiricalDerivative_meas : ∀ n, AEMeasurable (empiricalDerivative n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P, estimatingEquationAtEstimator n ω = 0)
    (hTaylorExpansion : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = estimatingEquationAtEstimator n ω) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hSecondBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        ‖delta n ω‖ * (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖) :=
    vaart1998_theorem_5_41_secondDerivativeResidual_bound_of_half_bound
      (delta := delta) (scaledEstimator := scaledEstimator)
      (curvatureBound := curvatureBound) (secondResidual := secondResidual)
      hSecondHalfBound
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeBound
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (delta := delta)
      (scaledEstimator := scaledEstimator) (curvatureBound := curvatureBound)
      (score := score)
      (estimatingEquationAtEstimator := estimatingEquationAtEstimator)
      (secondResidual := secondResidual) (Z := Z) hLeftInverse hScoreCLT
      hDerivativeLLN hDelta hCurvatureBounded hScaledEstimator hSecondBound
      hEmpiricalDerivative_meas hScaledEstimator_meas hSecondResidual_meas
      hRoot hTaylorExpansion

/--
van der Vaart 1998, Theorem 5.41, source root-and-Taylor-expansion handoff
from a quadratic second-derivative residual.

This source-facing wrapper accepts the Taylor residual as the `1 / 2` multiple
of a bilinear second-derivative action, together with the dominated
operator-norm bound for that action.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeQuadraticBound
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
    {secondDerivativeAction : ℕ -> Ω -> Θ →L[ℝ] Θ →L[ℝ] Score}
    {score estimatingEquationAtEstimator secondResidual : ℕ -> Ω -> Score}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hSecondResidual_eq : ∀ᶠ n in atTop, ∀ ω,
      secondResidual n ω =
        (1 / 2 : ℝ) •
          secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω))
    (hCurvatureOpBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondDerivativeAction n ω‖ ≤ ‖curvatureBound n ω‖)
    (hEmpiricalDerivative_meas : ∀ n, AEMeasurable (empiricalDerivative n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P, estimatingEquationAtEstimator n ω = 0)
    (hTaylorExpansion : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          secondResidual n ω = estimatingEquationAtEstimator n ω) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hSecondHalfBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondResidual n ω‖ ≤
        (1 / 2 : ℝ) *
          (‖delta n ω‖ *
            (‖curvatureBound n ω‖ * ‖scaledEstimator n ω‖)) :=
    vaart1998_theorem_5_41_secondDerivativeResidual_half_bound_of_bilinear_opNorm_bound
      (delta := delta) (scaledEstimator := scaledEstimator)
      (curvatureBound := curvatureBound)
      (secondDerivativeAction := secondDerivativeAction)
      (secondResidual := secondResidual) hSecondResidual_eq hCurvatureOpBound
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeHalfBound
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (delta := delta)
      (scaledEstimator := scaledEstimator) (curvatureBound := curvatureBound)
      (score := score)
      (estimatingEquationAtEstimator := estimatingEquationAtEstimator)
      (secondResidual := secondResidual) (Z := Z) hLeftInverse hScoreCLT
      hDerivativeLLN hDelta hCurvatureBounded hScaledEstimator
      hSecondHalfBound hEmpiricalDerivative_meas hScaledEstimator_meas
      hSecondResidual_meas hRoot hTaylorExpansion

/--
van der Vaart 1998, Theorem 5.41, source handoff from the literal quadratic
Taylor expansion.

This wrapper removes the auxiliary `secondResidual` object from the source
interface.  It consumes the Taylor display exactly as it appears in the proof,
with the quadratic term
`(1 / 2) • ddotPsi_n(tildeTheta_n) delta_n scaledEstimator_n`, derives the
residual identity and residual measurability, and then feeds the compiled
quadratic-bound handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_quadraticTaylorExpansion_measurableDerivativeLLN
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
    {secondDerivativeAction : ℕ -> Ω -> Θ →L[ℝ] Θ →L[ℝ] Score}
    {score estimatingEquationAtEstimator : ℕ -> Ω -> Score}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT : TendstoInDistribution score atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω => ‖empiricalDerivative n ω - V‖) atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hCurvatureBounded : StochasticBounded P curvatureBound)
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hCurvatureOpBound : ∀ᶠ n in atTop, ∀ ω,
      ‖secondDerivativeAction n ω‖ ≤ ‖curvatureBound n ω‖)
    (hEmpiricalDerivative_meas : ∀ n, AEMeasurable (empiricalDerivative n) P)
    (hSecondDerivativeAction_meas :
      ∀ n, AEMeasurable (secondDerivativeAction n) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P, estimatingEquationAtEstimator n ω = 0)
    (hTaylorExpansion : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        score n ω + empiricalDerivative n ω (scaledEstimator n ω) +
          (1 / 2 : ℝ) •
            secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω) =
          estimatingEquationAtEstimator n ω) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  let secondResidual : ℕ -> Ω -> Score :=
    fun n ω =>
      (1 / 2 : ℝ) •
        secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω)
  have hSecondResidual_eq : ∀ᶠ n in atTop, ∀ ω,
      secondResidual n ω =
        (1 / 2 : ℝ) •
          secondDerivativeAction n ω (delta n ω) (scaledEstimator n ω) :=
    Eventually.of_forall fun _ _ => rfl
  have hSecondResidual_meas : ∀ n, AEMeasurable (secondResidual n) P :=
    vaart1998_theorem_5_41_secondDerivativeResidual_aemeasurable_of_operator
      (P := P) (secondDerivativeAction := secondDerivativeAction)
      (delta := delta) (scaledEstimator := scaledEstimator)
      hSecondDerivativeAction_meas hDelta_meas hScaledEstimator_meas
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_taylorExpansion_measurableDerivativeLLN_secondDerivativeQuadraticBound
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := empiricalDerivative) (delta := delta)
      (scaledEstimator := scaledEstimator) (curvatureBound := curvatureBound)
      (secondDerivativeAction := secondDerivativeAction)
      (score := score)
      (estimatingEquationAtEstimator := estimatingEquationAtEstimator)
      (secondResidual := secondResidual) (Z := Z) hLeftInverse hScoreCLT
      hDerivativeLLN hDelta hCurvatureBounded hScaledEstimator
      hSecondResidual_eq hCurvatureOpBound hEmpiricalDerivative_meas
      hScaledEstimator_meas hSecondResidual_meas hRoot hTaylorExpansion

/--
van der Vaart 1998, Theorem 5.41, empirical-average source handoff from
pointwise Taylor identities and an envelope bound.

This wrapper instantiates the source objects in the literal quadratic Taylor
handoff as empirical averages: score, empirical derivative, selected
second-derivative action, estimating equation at the estimator, and scalar
curvature envelope.  The remaining source obligation is the per-observation
selected second-order Taylor identity.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_pointwiseTaylor_envelope
    {Ω Ω' Observation Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scoreAtTheta0 estimatingAtEstimator : ℕ -> Ω -> Observation -> Score)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Score)
    (secondDerivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (envelope : Observation -> ℝ)
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hPointwiseTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (scaledEstimator n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (scaledEstimator n ω) =
          estimatingAtEstimator n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hCurvatureOpBound : ∀ᶠ n in atTop, ∀ ω,
      ‖empiricalAverageVector (samples n ω) (secondDerivative n ω)‖ ≤
        ‖empiricalAverage (samples n ω) envelope‖ :=
    vaart1998_theorem_5_41_curvatureOpBound_of_empiricalSecondDerivative_envelope
      (samples := samples) (secondDerivative := secondDerivative)
      (envelope := envelope) hEnvelope_nonneg hEnvelopeBound
  have hTaylorExpansion : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω) +
            (empiricalAverageVector (samples n ω) (derivative n ω))
              (scaledEstimator n ω) +
            (1 / 2 : ℝ) •
              (empiricalAverageVector (samples n ω) (secondDerivative n ω))
                (delta n ω) (scaledEstimator n ω) =
          empiricalAverageVector (samples n ω)
            (estimatingAtEstimator n ω) :=
    vaart1998_theorem_5_41_empirical_quadraticTaylorExpansion_of_pointwise_ae
      (P := P) (samples := samples)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (delta := delta) (scaledEstimator := scaledEstimator)
      hPointwiseTaylor
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_root_quadraticTaylorExpansion_measurableDerivativeLLN
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (empiricalDerivative := fun n ω =>
        empiricalAverageVector (samples n ω) (derivative n ω))
      (delta := delta) (scaledEstimator := scaledEstimator)
      (curvatureBound := fun n ω =>
        empiricalAverage (samples n ω) envelope)
      (secondDerivativeAction := fun n ω =>
        empiricalAverageVector (samples n ω) (secondDerivative n ω))
      (score := fun n ω =>
        empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
      (estimatingEquationAtEstimator := fun n ω =>
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω))
      (Z := Z) hLeftInverse hScoreCLT hDerivativeLLN hDelta
      hCurvatureBounded hScaledEstimator hCurvatureOpBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hTaylorExpansion

/--
van der Vaart 1998, Theorem 5.41, empirical-average source handoff from raw
per-observation Taylor identities.

This is the next source-facing wrapper after the empirical-average endpoint:
it accepts the unscaled single-observation Taylor theorem and the common
normalizing scalar that turns `delta` into the scaled estimator.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_unscaledPointwiseTaylor_envelope
    {Ω Ω' Observation Score Θ : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup Score] [NormedSpace ℝ Score]
    [MeasurableSpace Score] [SecondCountableTopology Score] [BorelSpace Score]
    [OpensMeasurableSpace Score]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] Score) (Vinv : Score →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (rawAtTheta0 rawAtEstimator scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Score)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Score)
    (secondDerivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] Score)
    (envelope : Observation -> ℝ)
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Score}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • rawAtTheta0 n ω (samples n ω i))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • rawAtEstimator n ω (samples n ω i))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hRawTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        rawAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (delta n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i) (delta n ω) (delta n ω) =
          rawAtEstimator n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : Score →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hPointwiseTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (scaledEstimator n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (scaledEstimator n ω) =
          estimatingAtEstimator n ω (samples n ω i) :=
    vaart1998_theorem_5_41_pointwise_scaledTaylorIdentity_ae_of_unscaled_selectedTaylor
      (P := P) (samples := samples) (scale := scale)
      (rawAtTheta0 := rawAtTheta0) (rawAtEstimator := rawAtEstimator)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (delta := delta) (scaledEstimator := scaledEstimator)
      hScore_scaled hEstimator_scaled hScaledEstimator_eq hRawTaylor
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_pointwiseTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (delta := delta)
      (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hPointwiseTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from coordinatewise raw Taylor identities.

This wrapper specializes the raw pointwise Taylor endpoint to
`Coord -> ℝ` score vectors.  The remaining Taylor obligation is now
coordinatewise scalar, matching the selected-point form supplied by the scalar
Cauchy-MVT bridge.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinateRawTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (rawAtTheta0 rawAtEstimator scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • rawAtTheta0 n ω (samples n ω i))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • rawAtEstimator n ω (samples n ω i))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hCoordinateRawTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        rawAtTheta0 n ω (samples n ω i) j +
            derivative n ω (samples n ω i) (delta n ω) j +
            (1 / 2 : ℝ) *
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) j =
          rawAtEstimator n ω (samples n ω i) j) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hRawTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        rawAtTheta0 n ω (samples n ω i) +
            derivative n ω (samples n ω i) (delta n ω) +
            (1 / 2 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) =
          rawAtEstimator n ω (samples n ω i) :=
    vaart1998_theorem_5_41_pi_rawTaylor_ae_of_coordinate_rawTaylor
      (P := P) (samples := samples)
      (rawAtTheta0 := rawAtTheta0) (rawAtEstimator := rawAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (delta := delta) hCoordinateRawTaylor
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_unscaledPointwiseTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (rawAtTheta0 := rawAtTheta0) (rawAtEstimator := rawAtEstimator)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (delta := delta)
      (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hRawTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from scalar path Taylor hypotheses.

This wrapper is the source-facing version of the coordinate raw Taylor
endpoint.  It first turns scalar path Taylor hypotheses plus the endpoint
second-derivative action identification into coordinate raw Taylor identities,
then feeds those identities into
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinateRawTaylor_envelope`.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinatePathTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (pathValue pathDerivative pathSecond :
      ℕ -> Ω -> Observation -> Coord -> ℝ -> ℝ)
    (rawAtTheta0 rawAtEstimator scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • rawAtTheta0 n ω (samples n ω i))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • rawAtEstimator n ω (samples n ω i))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hValue0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathValue n ω (samples n ω i) j 0 =
          rawAtTheta0 n ω (samples n ω i) j)
    (hValue1 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathValue n ω (samples n ω i) j 1 =
          rawAtEstimator n ω (samples n ω i) j)
    (hDerivative0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathDerivative n ω (samples n ω i) j 0 =
          derivative n ω (samples n ω i) (delta n ω) j)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn (pathValue n ω (samples n ω i) j)
          (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt (pathValue n ω (samples n ω i) j)
            (pathDerivative n ω (samples n ω i) j x) x)
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathDerivative n ω (samples n ω i) j x -
              pathDerivative n ω (samples n ω i) j 0 =
            pathSecond n ω (samples n ω i) j x * (x - 0))
    (hSecondAction : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathSecond n ω (samples n ω i) j x =
            secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω) j) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hCoordinateRawTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        rawAtTheta0 n ω (samples n ω i) j +
            derivative n ω (samples n ω i) (delta n ω) j +
            (1 / 2 : ℝ) *
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) j =
          rawAtEstimator n ω (samples n ω i) j :=
    vaart1998_theorem_5_41_coordinate_rawTaylor_ae_of_scalarPathDerivativeTaylor_secondDerivativeAction
      (P := P) (samples := samples)
      (pathValue := pathValue) (pathDerivative := pathDerivative)
      (pathSecond := pathSecond)
      (rawAtTheta0 := rawAtTheta0) (rawAtEstimator := rawAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (delta := delta) hValue0 hValue1 hDerivative0 hContinuous
      hDerivative hDerivativeTaylor hSecondAction
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinateRawTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (rawAtTheta0 := rawAtTheta0) (rawAtEstimator := rawAtEstimator)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (delta := delta)
      (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hCoordinateRawTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from actual estimating-map coordinate paths.

This wrapper instantiates the abstract scalar path values in
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinatePathTaylor_envelope`
with the textbook segment
`t ↦ estimatingMap (theta0 + t • delta)`.  The remaining assumptions are the
one-dimensional path differentiability/Taylor hypotheses along that segment
and the endpoint identification `theta0 + delta = estimator`.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapPathTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (pathDerivative pathSecond :
      ℕ -> Ω -> Observation -> Coord -> ℝ -> ℝ)
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hDerivative0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        pathDerivative n ω (samples n ω i) j 0 =
          derivative n ω (samples n ω i) (delta n ω) j)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) j)
          (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt
            (fun t : ℝ =>
              estimatingMap n ω (samples n ω i)
                (theta0 n ω + t • delta n ω) j)
            (pathDerivative n ω (samples n ω i) j x) x)
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathDerivative n ω (samples n ω i) j x -
              pathDerivative n ω (samples n ω i) j 0 =
            pathSecond n ω (samples n ω i) j x * (x - 0))
    (hSecondAction : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          pathSecond n ω (samples n ω i) j x =
            secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω) j) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hValue0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        estimatingMap n ω (samples n ω i)
            (theta0 n ω + (0 : ℝ) • delta n ω) j =
          estimatingMap n ω (samples n ω i) (theta0 n ω) j := by
    intro n
    exact Filter.Eventually.of_forall fun ω i j => by
      simp
  have hValue1 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        estimatingMap n ω (samples n ω i)
            (theta0 n ω + (1 : ℝ) • delta n ω) j =
          estimatingMap n ω (samples n ω i) (estimator n ω) j := by
    intro n
    exact (hEstimator_segment n).mono fun ω hω i j => by
      simp [one_smul, hω]
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_coordinatePathTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (pathValue := fun n ω x j t =>
        estimatingMap n ω x (theta0 n ω + t • delta n ω) j)
      (pathDerivative := pathDerivative) (pathSecond := pathSecond)
      (rawAtTheta0 := fun n ω x =>
        estimatingMap n ω x (theta0 n ω))
      (rawAtEstimator := fun n ω x =>
        estimatingMap n ω x (estimator n ω))
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (delta := delta)
      (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hValue0 hValue1 hDerivative0 hContinuous
      hDerivative hDerivativeTaylor hSecondAction

/--
van der Vaart 1998, Theorem 5.41, coordinate derivative of an actual
estimating-map path from a Frechet derivative.

For the textbook segment `t ↦ theta0 + t • delta`, a Frechet derivative of the
estimating map gives the one-dimensional derivative of every coordinate path
by the chain rule and coordinate projection.
-/
theorem vaart1998_theorem_5_41_estimatingMap_coordinate_path_hasDerivAt_of_hasFDerivAt
    {Coord Θ : Type*} [Fintype Coord]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (estimatingMap : Θ -> Coord -> ℝ)
    (derivativeAt : Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : Θ) (j : Coord) (t : ℝ)
    (hFDeriv :
      HasFDerivAt estimatingMap (derivativeAt (theta0 + t • delta))
        (theta0 + t • delta)) :
    HasDerivAt
      (fun s : ℝ => estimatingMap (theta0 + s • delta) j)
      (derivativeAt (theta0 + t • delta) delta j) t := by
  let path : ℝ -> Θ := fun s => theta0 + s • delta
  have hpath : HasDerivAt path delta t := by
    have hsmul : HasDerivAt (fun s : ℝ => s • delta) delta t := by
      simpa using (hasDerivAt_id t).smul_const delta
    simpa [path] using hsmul.const_add theta0
  have hcomp :
      HasDerivAt (fun s : ℝ => estimatingMap (theta0 + s • delta))
        (derivativeAt (theta0 + t • delta) delta) t := by
    have hFDeriv_path :
        HasFDerivAt estimatingMap (derivativeAt (path t)) (path t) := by
      simpa [path] using hFDeriv
    have hcomp_path :
        HasDerivAt (estimatingMap ∘ path)
          (derivativeAt (path t) delta) t :=
      HasFDerivAt.comp_hasDerivAt
        (𝕜 := ℝ) (F := Θ) (E := Coord -> ℝ)
        (f := path) (f' := delta) (l := estimatingMap)
        (l' := derivativeAt (path t)) t hFDeriv_path hpath
    simpa [path, Function.comp_def] using
      hcomp_path
  have hproj :
      HasFDerivAt (fun y : Coord -> ℝ => y j)
        (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j)
        (estimatingMap (theta0 + t • delta)) := by
    simpa using
      (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j).hasFDerivAt
  have hproj_path :
      HasFDerivAt (fun y : Coord -> ℝ => y j)
        (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j)
        ((fun s : ℝ => estimatingMap (theta0 + s • delta)) t) := by
    simpa using hproj
  have hcoord_path :
      HasDerivAt
        ((fun y : Coord -> ℝ => y j) ∘
          (fun s : ℝ => estimatingMap (theta0 + s • delta)))
        ((ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j)
          (derivativeAt (theta0 + t • delta) delta)) t :=
    HasFDerivAt.comp_hasDerivAt
      (𝕜 := ℝ) (F := Coord -> ℝ) (E := ℝ)
      (f := fun s : ℝ => estimatingMap (theta0 + s • delta))
      (f' := derivativeAt (theta0 + t • delta) delta)
      (l := fun y : Coord -> ℝ => y j)
      (l' := ContinuousLinearMap.proj j) t hproj_path hcomp
  simpa [Function.comp_def] using
    hcoord_path

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled coordinate path derivatives
from Frechet derivatives of the estimating map.

This random wrapper discharges the one-dimensional derivative assumptions for
actual estimating-map coordinate paths from pointwise Frechet derivative
hypotheses along the textbook segment.
-/
theorem vaart1998_theorem_5_41_estimatingMap_coordinate_path_hasDerivAt_ae_of_hasFDerivAt
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : ℕ -> Ω -> Θ)
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω)) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt
            (fun t : ℝ =>
              estimatingMap n ω (samples n ω i)
                (theta0 n ω + t • delta n ω) j)
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω) (delta n ω) j) x := by
  intro n
  exact (hFDeriv n).mono fun ω hω i j x hx =>
    vaart1998_theorem_5_41_estimatingMap_coordinate_path_hasDerivAt_of_hasFDerivAt
      (estimatingMap := estimatingMap n ω (samples n ω i))
      (derivativeAt := derivativeAt n ω (samples n ω i))
      (theta0 := theta0 n ω) (delta := delta n ω) (j := j) (t := x)
      (hω i x hx)

/--
van der Vaart 1998, Theorem 5.41, estimating-map source regularity from
open-set `C^1` smoothness.

Open-set `ContDiffOn ℝ 1` gives continuity of the actual textbook path and
Frechet derivatives along the open segment, after identifying mathlib's
`fderiv` with the selected derivative map.
-/
theorem vaart1998_theorem_5_41_estimatingMap_source_regular_of_contDiffOn_open
    {Coord Θ : Type*} [Fintype Coord]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (estimatingMap : Θ -> Coord -> ℝ)
    (derivativeAt : Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : Θ) (sourceSet : Set Θ)
    (hOpen : IsOpen sourceSet)
    (hSegmentSubset :
      ((fun t : ℝ => theta0 + t • delta) '' Set.Icc (0 : ℝ) 1) ⊆
        sourceSet)
    (hContDiffEstimatingMap : ContDiffOn ℝ 1 estimatingMap sourceSet)
    (hDerivativeAt_eq_fderiv : ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      fderiv ℝ estimatingMap (theta0 + x • delta) =
        derivativeAt (theta0 + x • delta)) :
    ContinuousOn (fun t : ℝ => estimatingMap (theta0 + t • delta))
        (Set.Icc (0 : ℝ) 1) ∧
    ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      HasFDerivAt estimatingMap
        (derivativeAt (theta0 + x • delta))
        (theta0 + x • delta) := by
  let path : ℝ -> Θ := fun t => theta0 + t • delta
  have hpath : ContinuousOn path (Set.Icc (0 : ℝ) 1) := by
    have hsmul : ContinuousOn (fun t : ℝ => t • delta) (Set.Icc (0 : ℝ) 1) :=
      continuousOn_id.smul continuousOn_const
    simpa [path] using hsmul.const_add theta0
  have hcontSource :
      ContinuousOn estimatingMap
        ((fun t : ℝ => theta0 + t • delta) '' Set.Icc (0 : ℝ) 1) :=
    hContDiffEstimatingMap.continuousOn.mono hSegmentSubset
  refine ⟨?_, ?_⟩
  · simpa [path, Function.comp_def] using hcontSource.comp hpath
      (by
        intro t ht
        exact ⟨t, ht, rfl⟩)
  · intro x hx
    have hxmem : theta0 + x • delta ∈ sourceSet := by
      exact hSegmentSubset ⟨x, ⟨le_of_lt hx.1, le_of_lt hx.2⟩, rfl⟩
    have hdiffOn : DifferentiableOn ℝ estimatingMap sourceSet :=
      hContDiffEstimatingMap.differentiableOn_one
    have hderiv :
        HasFDerivAt estimatingMap
          (fderiv ℝ estimatingMap (theta0 + x • delta))
          (theta0 + x • delta) :=
      hdiffOn.hasFDerivAt (hOpen.mem_nhds hxmem)
    simpa [hDerivativeAt_eq_fderiv x hx] using hderiv

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled estimating-map source
regularity from open-set `C^1` smoothness.

This packages the remaining estimating-map smoothness assumptions consumed by
the current finite-coordinate empirical-average endpoint.
-/
theorem vaart1998_theorem_5_41_estimatingMap_source_regular_ae_of_contDiffOn_open
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (theta0 delta : ℕ -> Ω -> Θ)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω)) :
    (∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω))
          (Set.Icc (0 : ℝ) 1)) ∧
    (∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω)) := by
  refine ⟨?_, ?_⟩
  · intro n
    filter_upwards [hOpen n, hSegmentSubset n, hContDiffEstimatingMap n,
      hDerivativeAt_eq_fderiv n] with ω hopen hsubset hcont hderiv
    intro i
    exact
      (vaart1998_theorem_5_41_estimatingMap_source_regular_of_contDiffOn_open
        (estimatingMap := estimatingMap n ω (samples n ω i))
        (derivativeAt := derivativeAt n ω (samples n ω i))
        (theta0 := theta0 n ω) (delta := delta n ω)
        (sourceSet := sourceSet n ω (samples n ω i))
        (hOpen := hopen i) (hSegmentSubset := hsubset i)
        (hContDiffEstimatingMap := hcont i)
        (hDerivativeAt_eq_fderiv := hderiv i)).1
  · intro n
    filter_upwards [hOpen n, hSegmentSubset n, hContDiffEstimatingMap n,
      hDerivativeAt_eq_fderiv n] with ω hopen hsubset hcont hderiv
    intro i x hx
    exact
      (vaart1998_theorem_5_41_estimatingMap_source_regular_of_contDiffOn_open
        (estimatingMap := estimatingMap n ω (samples n ω i))
        (derivativeAt := derivativeAt n ω (samples n ω i))
        (theta0 := theta0 n ω) (delta := delta n ω)
        (sourceSet := sourceSet n ω (samples n ω i))
        (hOpen := hopen i) (hSegmentSubset := hsubset i)
        (hContDiffEstimatingMap := hcont i)
        (hDerivativeAt_eq_fderiv := hderiv i)).2 x hx

/--
van der Vaart 1998, Theorem 5.41, derivative-path continuity from source
continuity of the Frechet derivative on the segment image.

This turns continuity of `theta ↦ derivativeAt theta` on the textbook segment
into continuity of `t ↦ derivativeAt (theta0 + t • delta) delta`.
-/
theorem vaart1998_theorem_5_41_derivativeAt_path_continuousOn_of_continuousOn_segment
    {Coord Θ : Type*} [Fintype Coord]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (derivativeAt : Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : Θ)
    (hContinuousDerivativeAt :
      ContinuousOn derivativeAt
        ((fun t : ℝ => theta0 + t • delta) '' Set.Icc (0 : ℝ) 1)) :
    ContinuousOn
      (fun t : ℝ => derivativeAt (theta0 + t • delta) delta)
      (Set.Icc (0 : ℝ) 1) := by
  let path : ℝ -> Θ := fun t => theta0 + t • delta
  have hpath : ContinuousOn path (Set.Icc (0 : ℝ) 1) := by
    have hsmul : ContinuousOn (fun t : ℝ => t • delta) (Set.Icc (0 : ℝ) 1) :=
      continuousOn_id.smul continuousOn_const
    simpa [path] using hsmul.const_add theta0
  have hcomp : ContinuousOn (fun t : ℝ => derivativeAt (path t))
      (Set.Icc (0 : ℝ) 1) := by
    simpa [Function.comp_def] using hContinuousDerivativeAt.comp hpath
      (by
        intro t ht
        exact ⟨t, ht, rfl⟩)
  simpa [path] using hcomp.clm_apply continuousOn_const

/--
van der Vaart 1998, Theorem 5.41, derivative-path `HasDerivAt` from the
Frechet derivative of `theta ↦ derivativeAt theta`.

Composing the Frechet derivative of `derivativeAt` with the segment
`theta0 + t • delta`, then applying the resulting CLM-valued path to the
constant vector `delta`, gives the selected second-derivative action.
-/
theorem vaart1998_theorem_5_41_derivativeAt_path_hasDerivAt_of_hasFDerivAt
    {Coord Θ : Type*} [Fintype Coord]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (derivativeAt : Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative : Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : Θ) (t : ℝ)
    (hFDerivDerivativeAt :
      HasFDerivAt derivativeAt secondDerivative (theta0 + t • delta)) :
    HasDerivAt
      (fun s : ℝ => derivativeAt (theta0 + s • delta) delta)
      (secondDerivative delta delta) t := by
  let path : ℝ -> Θ := fun s => theta0 + s • delta
  have hpath : HasDerivAt path delta t := by
    have hsmul : HasDerivAt (fun s : ℝ => s • delta) delta t := by
      simpa using (hasDerivAt_id t).smul_const delta
    simpa [path] using hsmul.const_add theta0
  have hcomp :
      HasDerivAt (fun s : ℝ => derivativeAt (theta0 + s • delta))
        (secondDerivative delta) t := by
    have hcomp_path :
        HasDerivAt (derivativeAt ∘ path) (secondDerivative delta) t :=
      HasFDerivAt.comp_hasDerivAt
        (𝕜 := ℝ) (F := Θ) (E := Θ →L[ℝ] (Coord -> ℝ))
        (f := path) (f' := delta) (l := derivativeAt)
        (l' := secondDerivative) t
        (by simpa [path] using hFDerivDerivativeAt) hpath
    simpa [path, Function.comp_def] using hcomp_path
  have hconst : HasDerivAt (fun _ : ℝ => delta) 0 t :=
    hasDerivAt_const t delta
  have happly := hcomp.clm_apply hconst
  simpa using happly

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled derivative-path regularity from
source second-derivative regularity.

This packages the two source regularity fields needed by the current
Theorem 5.41 endpoint: continuity of the Frechet derivative on the segment
image and a Frechet derivative for `theta ↦ derivativeAt theta` along the open
segment.
-/
theorem vaart1998_theorem_5_41_derivativeAt_path_regular_ae_of_hasFDerivAt
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : ℕ -> Ω -> Θ)
    (hContinuousDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn (derivativeAt n ω (samples n ω i))
          ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1))
    (hFDerivDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (derivativeAt n ω (samples n ω i))
            (secondDerivative n ω (samples n ω i))
            (theta0 n ω + x • delta n ω)) :
    (∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) (delta n ω))
          (Set.Icc (0 : ℝ) 1)) ∧
    (∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt
            (fun t : ℝ =>
              derivativeAt n ω (samples n ω i)
                (theta0 n ω + t • delta n ω) (delta n ω))
            (secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω)) x) := by
  refine ⟨?_, ?_⟩
  · intro n
    exact (hContinuousDerivativeAt n).mono fun ω hω i =>
      vaart1998_theorem_5_41_derivativeAt_path_continuousOn_of_continuousOn_segment
        (derivativeAt := derivativeAt n ω (samples n ω i))
        (theta0 := theta0 n ω) (delta := delta n ω) (hω i)
  · intro n
    exact (hFDerivDerivativeAt n).mono fun ω hω i x hx =>
      vaart1998_theorem_5_41_derivativeAt_path_hasDerivAt_of_hasFDerivAt
        (derivativeAt := derivativeAt n ω (samples n ω i))
        (secondDerivative := secondDerivative n ω (samples n ω i))
        (theta0 := theta0 n ω) (delta := delta n ω) (t := x)
        (hω i x hx)

/--
van der Vaart 1998, Theorem 5.41, source second-derivative regularity from
`C^1` smoothness of the derivative map on an open neighborhood.

This is the shortest source-level wrapper feeding the current endpoint:
open-set `ContDiffOn ℝ 1` gives continuity on the segment and pointwise
Frechet derivatives on the open segment, after identifying mathlib's `fderiv`
with the selected second derivative.
-/
theorem vaart1998_theorem_5_41_derivativeAt_source_regular_of_contDiffOn_open
    {Coord Θ : Type*} [Fintype Coord]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (derivativeAt : Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative : Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : Θ) (sourceSet : Set Θ)
    (hOpen : IsOpen sourceSet)
    (hSegmentSubset :
      ((fun t : ℝ => theta0 + t • delta) '' Set.Icc (0 : ℝ) 1) ⊆
        sourceSet)
    (hContDiffDerivativeAt : ContDiffOn ℝ 1 derivativeAt sourceSet)
    (hSecondDerivative_eq_fderiv : ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      fderiv ℝ derivativeAt (theta0 + x • delta) = secondDerivative) :
    ContinuousOn derivativeAt
      ((fun t : ℝ => theta0 + t • delta) '' Set.Icc (0 : ℝ) 1) ∧
    ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      HasFDerivAt derivativeAt secondDerivative (theta0 + x • delta) := by
  refine ⟨hContDiffDerivativeAt.continuousOn.mono hSegmentSubset, ?_⟩
  intro x hx
  have hxmem : theta0 + x • delta ∈ sourceSet := by
    exact hSegmentSubset ⟨x, ⟨le_of_lt hx.1, le_of_lt hx.2⟩, rfl⟩
  have hdiffOn : DifferentiableOn ℝ derivativeAt sourceSet :=
    hContDiffDerivativeAt.differentiableOn_one
  have hderiv :
      HasFDerivAt derivativeAt
        (fderiv ℝ derivativeAt (theta0 + x • delta))
        (theta0 + x • delta) :=
    hdiffOn.hasFDerivAt (hOpen.mem_nhds hxmem)
  simpa [hSecondDerivative_eq_fderiv x hx] using hderiv

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled source regularity from
open-set `C^1` smoothness of the derivative map.

This packages the textbook smoothness side condition into exactly the two
source regularity fields consumed by
`...Theta0SecondDerivativeRegularity_envelope`.
-/
theorem vaart1998_theorem_5_41_derivativeAt_source_regular_ae_of_contDiffOn_open
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (theta0 delta : ℕ -> Ω -> Θ)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    (∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn (derivativeAt n ω (samples n ω i))
          ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1)) ∧
    (∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (derivativeAt n ω (samples n ω i))
            (secondDerivative n ω (samples n ω i))
            (theta0 n ω + x • delta n ω)) := by
  refine ⟨?_, ?_⟩
  · intro n
    filter_upwards [hOpen n, hSegmentSubset n, hContDiffDerivativeAt n,
      hSecondDerivative_eq_fderiv n] with ω hopen hsubset hcont hsecond
    intro i
    exact
      (vaart1998_theorem_5_41_derivativeAt_source_regular_of_contDiffOn_open
        (derivativeAt := derivativeAt n ω (samples n ω i))
        (secondDerivative := secondDerivative n ω (samples n ω i))
        (theta0 := theta0 n ω) (delta := delta n ω)
        (sourceSet := sourceSet n ω (samples n ω i))
        (hOpen := hopen i) (hSegmentSubset := hsubset i)
        (hContDiffDerivativeAt := hcont i)
        (hSecondDerivative_eq_fderiv := hsecond i)).1
  · intro n
    filter_upwards [hOpen n, hSegmentSubset n, hContDiffDerivativeAt n,
      hSecondDerivative_eq_fderiv n] with ω hopen hsubset hcont hsecond
    intro i x hx
    exact
      (vaart1998_theorem_5_41_derivativeAt_source_regular_of_contDiffOn_open
        (derivativeAt := derivativeAt n ω (samples n ω i))
        (secondDerivative := secondDerivative n ω (samples n ω i))
        (theta0 := theta0 n ω) (delta := delta n ω)
        (sourceSet := sourceSet n ω (samples n ω i))
        (hOpen := hopen i) (hSegmentSubset := hsubset i)
        (hContDiffDerivativeAt := hcont i)
        (hSecondDerivative_eq_fderiv := hsecond i)).2 x hx

/--
van der Vaart 1998, Theorem 5.41, vector derivative Taylor bridge from a
constant second-derivative action.

If the path `t ↦ derivativePath t` has constant derivative `secondAction` on
`(0, 1)` and is continuous on `[0, 1]`, then the vector derivative increment
has the source Taylor form used by the finite-coordinate Z-estimator handoff.
-/
theorem vaart1998_theorem_5_41_vector_derivativeTaylor_of_constant_secondDerivativeAction
    {Coord : Type*} [Fintype Coord]
    (derivativePath : ℝ -> Coord -> ℝ) (secondAction : Coord -> ℝ)
    (hContinuous : ContinuousOn derivativePath (Set.Icc (0 : ℝ) 1))
    (hDerivative : ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      HasDerivAt derivativePath secondAction x) :
    ∀ x ∈ Set.Ioo (0 : ℝ) 1,
      derivativePath x - derivativePath 0 = (x - 0 : ℝ) • secondAction := by
  intro x hx
  ext j
  have hx01 : 0 < x := hx.1
  have hx1 : x < 1 := hx.2
  have hxle1 : x ≤ 1 := le_of_lt hx1
  have hsubset : Set.Icc (0 : ℝ) x ⊆ Set.Icc (0 : ℝ) 1 := by
    intro y hy
    exact ⟨hy.1, le_trans hy.2 hxle1⟩
  have hcont_coord :
      ContinuousOn (fun t : ℝ => derivativePath t j)
        (Set.Icc (0 : ℝ) x) := by
    simpa [Function.comp_def] using
      (continuous_apply j).comp_continuousOn (hContinuous.mono hsubset)
  have hderiv_coord : ∀ y ∈ Set.Ioo (0 : ℝ) x,
      HasDerivAt (fun t : ℝ => derivativePath t j) (secondAction j) y := by
    intro y hy
    have hy01 : y ∈ Set.Ioo (0 : ℝ) 1 := ⟨hy.1, lt_trans hy.2 hx1⟩
    have hproj :
        HasFDerivAt (fun z : Coord -> ℝ => z j)
          (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j)
          (derivativePath y) := by
      simpa using
        (ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j).hasFDerivAt
    have hcoord :
        HasDerivAt
          ((fun z : Coord -> ℝ => z j) ∘ derivativePath)
          ((ContinuousLinearMap.proj (R := ℝ) (φ := fun _ : Coord => ℝ) j)
            secondAction) y :=
      HasFDerivAt.comp_hasDerivAt
        (𝕜 := ℝ) (F := Coord -> ℝ) (E := ℝ)
        (f := derivativePath) (f' := secondAction)
        (l := fun z : Coord -> ℝ => z j)
        (l' := ContinuousLinearMap.proj j) y hproj (hDerivative y hy01)
    simpa [Function.comp_def] using hcoord
  obtain ⟨c, _hc, hslope⟩ :=
    exists_hasDerivAt_eq_slope
      (fun t : ℝ => derivativePath t j) (fun _ : ℝ => secondAction j)
      hx01 hcont_coord hderiv_coord
  have hxne : x - 0 ≠ 0 := sub_ne_zero.mpr hx01.ne'
  have hmul : (x - 0 : ℝ) * secondAction j =
      derivativePath x j - derivativePath 0 j := by
    rw [hslope]
    field_simp [hxne]
  simpa [Pi.sub_apply, Pi.smul_apply, smul_eq_mul, mul_comm] using hmul.symm

/--
van der Vaart 1998, Theorem 5.41, a.e. sampled vector derivative Taylor bridge
from a constant second-derivative action.

This random-sample wrapper turns path continuity and a path derivative equal to
the selected second-derivative action into the vector Taylor identity consumed
by the current finite-coordinate empirical-average endpoint.
-/
theorem vaart1998_theorem_5_41_vector_derivativeTaylor_ae_of_constant_secondDerivativeAction
    {Ω Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (theta0 delta : ℕ -> Ω -> Θ)
    (hContinuousDerivativePath : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) (delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hSecondDerivativePath : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt
            (fun t : ℝ =>
              derivativeAt n ω (samples n ω i)
                (theta0 n ω + t • delta n ω) (delta n ω))
            (secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω)) x) :
    ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) =
            (x - 0 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) := by
  intro n
  filter_upwards [hContinuousDerivativePath n, hSecondDerivativePath n] with
    ω hcontω hderivω
  intro i x hx
  have hTaylor :=
    vaart1998_theorem_5_41_vector_derivativeTaylor_of_constant_secondDerivativeAction
      (derivativePath := fun t : ℝ =>
        derivativeAt n ω (samples n ω i)
          (theta0 n ω + t • delta n ω) (delta n ω))
      (secondAction :=
        secondDerivative n ω (samples n ω i) (delta n ω) (delta n ω))
      (hcontω i) (hderivω i)
      x hx
  simpa using hTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from Frechet derivatives along the actual estimating-map path.

Compared with
`vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapPathTaylor_envelope`,
this wrapper discharges the one-dimensional derivative hypotheses by the
Frechet-chain-rule bridge above.  The remaining Taylor-source assumptions are
continuity of the coordinate paths, the derivative-at-zero identification, and
the scalar derivative Taylor display against the selected second-derivative
action.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivPathTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hDerivative0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        derivativeAt n ω (samples n ω i) (theta0 n ω)
            (delta n ω) j =
          derivative n ω (samples n ω i) (delta n ω) j)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) j)
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) j -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) j =
            secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω) j * (x - 0)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hPathDerivative :
      ∀ n : ℕ,
        ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
          ∀ x ∈ Set.Ioo (0 : ℝ) 1,
            HasDerivAt
              (fun t : ℝ =>
                estimatingMap n ω (samples n ω i)
                  (theta0 n ω + t • delta n ω) j)
              (derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) j) x :=
    vaart1998_theorem_5_41_estimatingMap_coordinate_path_hasDerivAt_ae_of_hasFDerivAt
      (P := P) (samples := samples) (estimatingMap := estimatingMap)
      (derivativeAt := derivativeAt) (theta0 := theta0)
      (delta := delta) hFDeriv
  have hDerivative0_path : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        derivativeAt n ω (samples n ω i)
            (theta0 n ω + (0 : ℝ) • delta n ω)
            (delta n ω) j =
          derivative n ω (samples n ω i) (delta n ω) j := by
    intro n
    exact (hDerivative0 n).mono fun ω hω i j => by
      simpa using hω i j
  have hDerivativeTaylor_path : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) j -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω + (0 : ℝ) • delta n ω) (delta n ω) j =
            secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω) j * (x - 0) := by
    intro n
    exact (hDerivativeTaylor n).mono fun ω hω i j x hx => by
      simpa using hω i j x hx
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapPathTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap)
      (pathDerivative := fun n ω x j t =>
        derivativeAt n ω x (theta0 n ω + t • delta n ω)
          (delta n ω) j)
      (pathSecond := fun n ω x j _ =>
        secondDerivative n ω x (delta n ω) (delta n ω) j)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hDerivative0_path hContinuous
      hPathDerivative hDerivativeTaylor_path
      (by
        intro n
        exact Filter.Eventually.of_forall fun ω i j x hx => rfl)

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from vector Taylor hypotheses for the Frechet derivative.

This wrapper replaces the remaining coordinate derivative-at-zero and scalar
derivative Taylor assumptions by source-shaped vector hypotheses:
`derivativeAt theta0 = derivative` and a vector Taylor identity for
`derivativeAt (theta0 + x • delta) delta`.  Componentwise scalar obligations
are recovered by evaluation at each finite coordinate.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivVectorTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hDerivativeAt0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        derivativeAt n ω (samples n ω i) (theta0 n ω) =
          derivative n ω (samples n ω i))
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) j)
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) =
            (x - 0 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivative0_coord : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        derivativeAt n ω (samples n ω i) (theta0 n ω)
            (delta n ω) j =
          derivative n ω (samples n ω i) (delta n ω) j := by
    intro n
    exact (hDerivativeAt0 n).mono fun ω hω i j => by
      simp [hω i]
  have hDerivativeTaylor_coord : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) j -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) j =
            secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω) j * (x - 0) := by
    intro n
    exact (hDerivativeTaylor n).mono fun ω hω i j x hx => by
      have hcomp := congrFun (hω i x hx) j
      simpa [Pi.sub_apply, Pi.smul_apply, mul_comm, mul_left_comm, mul_assoc]
        using hcomp
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivPathTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hDerivative0_coord hContinuous
      hFDeriv hDerivativeTaylor_coord

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from vector continuity and vector Taylor hypotheses.

This wrapper replaces coordinate-path continuity by continuity of the full
finite-coordinate estimating-map path.  Coordinate continuity is recovered by
composing with the continuous coordinate projection.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivVectorContinuityTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (derivative : ℕ -> Ω -> Observation -> Θ →L[ℝ] (Coord -> ℝ))
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω) (derivative n ω) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω => empiricalAverageVector (samples n ω) (derivative n ω)) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hDerivativeAt0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        derivativeAt n ω (samples n ω i) (theta0 n ω) =
          derivative n ω (samples n ω i))
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) =
            (x - 0 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hContinuous_coord : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ j : Coord,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) j)
          (Set.Icc (0 : ℝ) 1) := by
    intro n
    exact (hContinuous n).mono fun ω hω i j => by
      simpa [Function.comp_def] using
        (continuous_apply j).comp_continuousOn (hω i)
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivVectorTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := derivative) (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hDerivativeAt0 hContinuous_coord
      hFDeriv hDerivativeTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff with the empirical derivative specialized to `derivativeAt theta0`.

This wrapper removes the explicit source hypothesis
`derivativeAt theta0 = derivative` by taking the empirical derivative itself
to be the Frechet derivative at `theta0`.  The remaining Taylor-source
obligation is the vector derivative Taylor identity along the segment.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0FDerivVectorTaylor_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) =
            (x - 0 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeAt0 : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        derivativeAt n ω (samples n ω i) (theta0 n ω) =
          (fun x => derivativeAt n ω x (theta0 n ω)) (samples n ω i) := by
    intro n
    exact Filter.Eventually.of_forall fun ω i => rfl
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapFDerivVectorContinuityTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (derivative := fun n ω x => derivativeAt n ω x (theta0 n ω))
      (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hDerivativeAt0 hContinuous
      hFDeriv hDerivativeTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from a theta0 Frechet derivative and a constant second-derivative path.

This wrapper discharges the vector derivative Taylor identity by applying the
one-dimensional mean-value bridge to the vector path
`t ↦ derivativeAt (theta0 + t • delta) delta`, with derivative equal to the
selected second-derivative action.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativePath_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hContinuousDerivativePath : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + t • delta n ω) (delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hSecondDerivativePath : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasDerivAt
            (fun t : ℝ =>
              derivativeAt n ω (samples n ω i)
                (theta0 n ω + t • delta n ω) (delta n ω))
            (secondDerivative n ω (samples n ω i)
              (delta n ω) (delta n ω)) x) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeTaylor : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          derivativeAt n ω (samples n ω i)
                (theta0 n ω + x • delta n ω) (delta n ω) -
              derivativeAt n ω (samples n ω i)
                (theta0 n ω) (delta n ω) =
            (x - 0 : ℝ) •
              secondDerivative n ω (samples n ω i)
                (delta n ω) (delta n ω) :=
    vaart1998_theorem_5_41_vector_derivativeTaylor_ae_of_constant_secondDerivativeAction
      (P := P) (samples := samples) (derivativeAt := derivativeAt)
      (secondDerivative := secondDerivative) (theta0 := theta0)
      (delta := delta) hContinuousDerivativePath hSecondDerivativePath
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0FDerivVectorTaylor_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hContinuous hFDeriv
      hDerivativeTaylor

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from theta0 Frechet derivative and source second-derivative regularity.

This wrapper derives the derivative-path continuity and path derivative
assumptions from source regularity of `theta ↦ derivativeAt theta` on the
segment, then feeds the compiled second-derivative path handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativeRegularity_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hContinuousDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn (derivativeAt n ω (samples n ω i))
          ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1))
    (hFDerivDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (derivativeAt n ω (samples n ω i))
            (secondDerivative n ω (samples n ω i))
            (theta0 n ω + x • delta n ω)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hRegular :=
    vaart1998_theorem_5_41_derivativeAt_path_regular_ae_of_hasFDerivAt
      (P := P) (samples := samples) (derivativeAt := derivativeAt)
      (secondDerivative := secondDerivative) (theta0 := theta0)
      (delta := delta) hContinuousDerivativeAt hFDerivDerivativeAt
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativePath_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hContinuous hFDeriv
      hRegular.1 hRegular.2

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from open-set `C^1` smoothness of the derivative map.

This wrapper is the current source-level smoothness endpoint: the derivative
map is `ContDiffOn ℝ 1` on an open set containing the textbook segment, and
its mathlib `fderiv` is identified with the selected second-derivative action.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativeContDiff_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hContinuous : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContinuousOn
          (fun t : ℝ =>
            estimatingMap n ω (samples n ω i)
              (theta0 n ω + t • delta n ω))
          (Set.Icc (0 : ℝ) 1))
    (hFDeriv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          HasFDerivAt (estimatingMap n ω (samples n ω i))
            (derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
            (theta0 n ω + x • delta n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hSource :=
    vaart1998_theorem_5_41_derivativeAt_source_regular_ae_of_contDiffOn_open
      (P := P) (samples := samples) (derivativeAt := derivativeAt)
      (secondDerivative := secondDerivative) (sourceSet := sourceSet)
      (theta0 := theta0) (delta := delta)
      hOpen hSegmentSubset hContDiffDerivativeAt hSecondDerivative_eq_fderiv
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativeRegularity_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hContinuous hFDeriv
      hSource.1 hSource.2

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from open-set `C^1` smoothness of both the estimating map and the
derivative map.

This wrapper discharges the remaining estimating-map path-continuity and
Frechet-derivative fields before applying the derivative-map `ContDiffOn`
endpoint above.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hEmpiricalDerivative_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hSecondDerivativeAction_meas : ∀ n,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω) (secondDerivative n ω)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hEstimatingSource :=
    vaart1998_theorem_5_41_estimatingMap_source_regular_ae_of_contDiffOn_open
      (P := P) (samples := samples) (estimatingMap := estimatingMap)
      (derivativeAt := derivativeAt) (sourceSet := sourceSet)
      (theta0 := theta0) (delta := delta)
      hOpen hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapTheta0SecondDerivativeContDiff_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hEstimatingSource.1
      hEstimatingSource.2 hOpen hSegmentSubset hContDiffDerivativeAt
      hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from sampled empirical-derivative and Hessian a.e.-measurability.

This removes two statistical-side measurability hypotheses from the current
ContDiff endpoint: it is enough to know that every realized derivative and
second-derivative summand is a.e.-measurable.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hEmpiricalDerivative_meas :
      ∀ n,
        AEMeasurable
          (fun ω =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω))) P :=
    vaart1998_theorem_5_41_empiricalDerivative_aemeasurable_of_summands
      (P := P) (samples := samples) (derivativeAt := derivativeAt)
      (theta0 := theta0) hDerivativeAtTheta0_summand_meas
  have hSecondDerivativeAction_meas :
      ∀ n,
        AEMeasurable
          (fun ω =>
            empiricalAverageVector (samples n ω) (secondDerivative n ω)) P :=
    vaart1998_theorem_5_41_empiricalSecondDerivativeAction_aemeasurable_of_summands
      (P := P) (samples := samples) (secondDerivative := secondDerivative)
      hSecondDerivative_summand_meas
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hEmpiricalDerivative_meas hSecondDerivativeAction_meas hDelta_meas
      hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hOpen hSegmentSubset
      hContDiffEstimatingMap hDerivativeAt_eq_fderiv hContDiffDerivativeAt
      hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from convergence in probability of the empirical envelope average.

This replaces the stochastic-boundedness assumption on the empirical envelope
average by the source-shaped statement that it converges in probability to a
finite real population value.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0)
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hCurvatureBounded :
      StochasticBounded P
        (fun n ω => empiricalAverage (samples n ω) envelope) :=
    vaart1998_stochasticBounded_of_tendstoInMeasure_const
      envelopeMean hEnvelopeAverage_tendsto
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hCurvatureBounded hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hDelta_meas hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hOpen hSegmentSubset
      hContDiffEstimatingMap hDerivativeAt_eq_fderiv hContDiffDerivativeAt
      hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from an operator-valued derivative LLN.

This replaces the scalar norm-residual derivative LLN by convergence in
probability of the empirical derivative average itself to the population
operator `V`.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeTendsto_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivative_tendsto :
      TendstoInMeasure P
        (fun n ω =>
          empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
        atTop (fun _ : Ω => V))
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeLLN :
      TendstoInMeasure P
        (fun n ω =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop 0 :=
    vaart1998_tendstoInMeasure_norm_sub_const_zero_of_tendstoInMeasure_const
      (P := P)
      (X := fun n ω =>
        empiricalAverageVector (samples n ω)
          (fun x => derivativeAt n ω x (theta0 n ω)))
      V hDerivative_tendsto
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatingMapContDiffTheta0SecondDerivativeContDiff_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeLLN hDelta hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hDelta_meas hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hOpen hSegmentSubset
      hContDiffEstimatingMap hDerivativeAt_eq_fderiv hContDiffDerivativeAt
      hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate empirical-average source
handoff from an almost-sure empirical derivative law.

This is the strong-law-to-probability bridge for the operator-valued empirical
derivative average; a future iid/operator LLN can target the a.e. convergence
field directly.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeAE_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V))
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivative_tendsto :
      TendstoInMeasure P
        (fun n ω =>
          empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
        atTop (fun _ : Ω => V) :=
    vaart1998_tendstoInMeasure_of_tendsto_ae
      hDerivativeAverage_strongMeas hDerivativeAverage_ae
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeTendsto_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivative_tendsto hDelta hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hDelta_meas hScaledEstimator_meas hRoot hScore_scaled hEstimator_scaled
      hScaledEstimator_eq hEstimator_segment hOpen hSegmentSubset
      hContDiffEstimatingMap hDerivativeAt_eq_fderiv hContDiffDerivativeAt
      hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, score CLT handoff from the raw scaled
estimating map.

The textbook score is the normalized estimating map at `theta0`.  This bridge
uses the sampled scaling identity to transfer a CLT for that raw scaled
empirical average into the score-CLT field consumed by the Z-estimator theorem.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V))
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hScoreCLT :
      TendstoInDistribution
        (fun n ω => empiricalAverageVector (samples n ω) (scoreAtTheta0 n ω))
        atTop Z (fun _ => P) Q := by
    refine TendstoInDistribution.congr ?_ Filter.EventuallyEq.rfl hRawScoreCLT
    intro n
    exact (hScore_scaled n).mono fun ω hω => by
      simp [empiricalAverageVector, hω]
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hDelta hEnvelope_nonneg hEnvelopeAverage_tendsto
      hScaledEstimator hEnvelopeBound hDerivativeAtTheta0_summand_meas
      hSecondDerivative_summand_meas hDelta_meas hScaledEstimator_meas hRoot
      hScore_scaled hEstimator_scaled hScaledEstimator_eq hEstimator_segment
      hOpen hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, root handoff from the raw estimating
equation.

The source theorem usually states that the empirical estimating equation is
zero at the estimator before applying the common normalization.  This bridge
uses the sampled estimator-scaling identity to produce the scaled root field
consumed by the current Z-estimator endpoint.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V))
    (hDelta : TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω)
    (hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω)
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω) = 0 := by
    intro n
    filter_upwards [hRawRoot n, hEstimator_scaled n] with ω hRaw hEstimator
    calc
      empiricalAverageVector (samples n ω) (estimatingAtEstimator n ω)
          = empiricalAverageVector (samples n ω)
              (fun x => scale n ω • estimatingMap n ω x (estimator n ω)) := by
            simp [empiricalAverageVector, hEstimator]
      _ = scale n ω • empiricalAverageVector (samples n ω)
              (fun x => estimatingMap n ω x (estimator n ω)) := by
            simp [empiricalAverageVector, Finset.smul_sum, smul_smul,
              mul_comm]
      _ = 0 := by
            simp [hRaw]
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hDelta hEnvelope_nonneg hEnvelopeAverage_tendsto
      hScaledEstimator hEnvelopeBound hDerivativeAtTheta0_summand_meas
      hSecondDerivative_summand_meas hDelta_meas hScaledEstimator_meas hRoot
      hScore_scaled hEstimator_scaled hScaledEstimator_eq hEstimator_segment
      hOpen hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, estimator-increment source handoff.

This wrapper replaces the independent `delta` consistency and endpoint segment
assumptions by the source-shaped identity `delta = estimator - theta0`, and it
replaces the scaled-estimator identity by the corresponding direct expression
in the estimator increment.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSub_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hDelta_meas : ∀ n, AEMeasurable (delta n) P)
    (hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDelta :
      TendstoInMeasure P (fun n ω => ‖delta n ω‖) atTop 0 :=
    hEstimator_consistency.congr (fun n =>
      (hDelta_eq_sub n).mono fun ω hω => by
        rw [← hω]) Filter.EventuallyEq.rfl
  have hScaledEstimator_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, scaledEstimator n ω = scale n ω • delta n ω := by
    intro n
    filter_upwards [hScaledEstimator_eq_sub n, hDelta_eq_sub n] with ω hscaled hdelta
    simpa [hdelta] using hscaled
  have hEstimator_segment : ∀ n : ℕ,
      ∀ᵐ ω ∂P, theta0 n ω + delta n ω = estimator n ω := by
    intro n
    exact (hDelta_eq_sub n).mono fun ω hdelta => by
      rw [hdelta]
      abel
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hDelta hEnvelope_nonneg hEnvelopeAverage_tendsto
      hScaledEstimator hEnvelopeBound hDerivativeAtTheta0_summand_meas
      hSecondDerivative_summand_meas hDelta_meas hScaledEstimator_meas
      hRawRoot hScore_scaled hEstimator_scaled hScaledEstimator_eq
      hEstimator_segment hOpen hSegmentSubset hContDiffEstimatingMap
      hDerivativeAt_eq_fderiv hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, estimator-increment measurability handoff.

This wrapper derives the a.e.-measurability of `delta` and `scaledEstimator`
from measurability of the estimator, the base point, and the normalization
scale, plus the source-shaped increment identities.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDelta_meas : ∀ n, AEMeasurable (delta n) P := by
    intro n
    exact ((hEstimator_meas n).sub (hTheta0_meas n)).congr
      ((hDelta_eq_sub n).mono fun ω hω => hω.symm)
  have hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P := by
    intro n
    exact ((hScale_meas n).smul ((hEstimator_meas n).sub (hTheta0_meas n))).congr
      ((hScaledEstimator_eq_sub n).mono fun ω hω => hω.symm)
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSub_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hDelta_meas hScaledEstimator_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, scaled-estimator law tails from `O_P(1)`.

The current source-facing Theorem 5.41 wrappers consume law tails for
`P.map scaledEstimator_n`.  If the scaled estimator is already known to be
`O_P(1)`, and its usual display
`scaledEstimator_n = scale_n • (estimator_n - theta0_n)` supplies
a.e.-measurability, then the Chapter 2 stochastic-boundedness/law-tail bridge
provides that exact field.
-/
theorem vaart1998_theorem_5_41_scaledEstimator_lawTail_of_stochasticBounded_estimatorSubMeas
    {Ω Θ : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [BorelSpace Θ] [MeasurableSub₂ Θ]
    [MeasurableSMul₂ ℝ Θ]
    (scale : ℕ -> Ω -> ℝ)
    {theta0 estimator scaledEstimator : ℕ -> Ω -> Θ}
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hScaledEstimator : StochasticBounded P scaledEstimator) :
    ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε := by
  have hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P := by
    intro n
    exact ((hScale_meas n).smul ((hEstimator_meas n).sub (hTheta0_meas n))).congr
      ((hScaledEstimator_eq_sub n).mono fun ω hω => hω.symm)
  exact
    vaart1998_law_real_norm_tail_of_stochasticBounded
      hScaledEstimator_meas hScaledEstimator

/--
van der Vaart 1998, Theorem 5.41, scaled-estimator tightness handoff from
law tails.

This wrapper replaces the opaque `O_P(1)` hypothesis for the scaled estimator
by the Chapter 2 law-tail criterion for the laws `P.map scaledEstimator_n`.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hScaledEstimator_meas : ∀ n, AEMeasurable (scaledEstimator n) P := by
    intro n
    exact ((hScale_meas n).smul ((hEstimator_meas n).sub (hTheta0_meas n))).congr
      ((hScaledEstimator_eq_sub n).mono fun ω hω => hω.symm)
  have hScaledEstimator : StochasticBounded P scaledEstimator :=
    vaart1998_stochasticBounded_of_law_real_norm_tail
      hScaledEstimator_meas hScaledEstimator_lawTail
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, derivative-norm handoff with an explicit
`O_P(1)` scaled estimator.

This is the tightness-facing companion to the law-tail wrapper below.  When the
scaled estimator is already packaged as `StochasticBounded`, the
operator-norm derivative residual source directly feeds the compiled
Z-estimator handoff, without restating the intermediate law-tail criterion.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V) := by
    filter_upwards [hDerivativeAverage_norm_ae] with ω hω
    exact (tendsto_iff_norm_sub_tendsto_zero).2 hω
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, derivative strong-law handoff from the
operator-norm residual.

This wrapper exposes the exact source target for a future empirical derivative
strong law: almost-sure convergence of the operator-norm residual
`‖dotPsi_n(theta0) - V‖` to zero.  It converts that residual statement into the
operator-valued a.s. convergence field consumed by the current endpoint.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeAverage_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)))
          atTop (𝓝 V) := by
    filter_upwards [hDerivativeAverage_norm_ae] with ω hω
    exact (tendsto_iff_norm_sub_tendsto_zero).2 hω
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_derivativeAE_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, canonical product score CLT source.

For canonical iid score samples on `ℕ -> Coord -> ℝ`, the product-measure
source lemmas supply the common vector law and infinite-product sequence law.
Thus a Gaussian limit whose covariance agrees with the common score law gives
the projected-summand CLT consumed by the raw-score handoff.
-/
theorem vaart1998_theorem_5_41_canonicalProductScore_projectedSummandCLT_of_vectorLawGaussianSource
    {Ω' Coord : Type*} [Fintype Coord] [MeasurableSpace Ω']
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    {scoreLaw : Measure (Coord -> ℝ)} [IsProbabilityMeasure scoreLaw]
    {Z : Ω' -> Coord -> ℝ}
    (hcoordinate_meas : ∀ coordinate,
      Measurable (fun sampleVector : Coord -> ℝ => sampleVector coordinate))
    (hscoreLaw_coordinate_memLp : ∀ coordinate,
      MemLp (fun sampleVector : Coord -> ℝ => sampleVector coordinate) 2
        scoreLaw)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance_scoreLaw : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance L scoreLaw) :
    vaart1998_finiteCoordinateProjectedSummandCLT
      (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
      (fun coordinate i sample => sample i coordinate) Z := by
  have hcanonicalCoordinateSource :=
    vaart1998_finiteCoordinateCanonicalSample_coordinateSource
      (ν := scoreLaw) hcoordinate_meas hscoreLaw_coordinate_memLp
  have hcanonicalVectorSource :=
    vaart1998_finiteCoordinateCanonicalSampleVector_commonVectorLawSource
      (ν := scoreLaw)
  exact
    vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_commonVectorLawGaussianSource
      (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
      (X := fun coordinate i sample => sample i coordinate) (Z := Z)
      (ν := scoreLaw)
      (hX_coordinate_memLp := hcanonicalCoordinateSource.1)
      (hZ_gaussian := hZ_gaussian) (hZ_memLp := hZ_memLp)
      (hZ_mean := hZ_mean)
      (hZ_covariance :=
        vaart1998_finiteCoordinateCanonicalSample_covariance_eq_projectedVariance
          (Q := Q) (ν := scoreLaw) (Z := Z) hZ_covariance_scoreLaw)
      (hX_vector_law := hcanonicalVectorSource.1)
      (hX_sequence_law := hcanonicalVectorSource.2)

/--
van der Vaart 1998, Theorem 5.41, canonical product finite-vector score CLT.

This is the Cramér-Wold endpoint corresponding to the preceding canonical
product score source.  It produces the finite-coordinate scaled centered
empirical moment CLT used to transfer a raw score display into the
Z-estimator handoff.
-/
theorem vaart1998_theorem_5_41_canonicalProductScore_finiteVectorCLT_of_vectorLawGaussianSource
    {Ω' Coord : Type*} [Fintype Coord] [MeasurableSpace Ω']
    {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    {scoreLaw : Measure (Coord -> ℝ)} [IsProbabilityMeasure scoreLaw]
    {Z : Ω' -> Coord -> ℝ}
    (hcoordinate_meas : ∀ coordinate,
      Measurable (fun sampleVector : Coord -> ℝ => sampleVector coordinate))
    (hscoreLaw_coordinate_memLp : ∀ coordinate,
      MemLp (fun sampleVector : Coord -> ℝ => sampleVector coordinate) 2
        scoreLaw)
    (hZ_aemeas : AEMeasurable Z Q)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance_scoreLaw : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance L scoreLaw) :
    TendstoInDistribution
      (fun n sample =>
        vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          (Measure.infinitePi (fun _ : ℕ => scoreLaw))
          (fun coordinate i sample => sample i coordinate) n sample)
      atTop Z (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q := by
  have hcanonicalCoordinateSource :=
    vaart1998_finiteCoordinateCanonicalSample_coordinateSource
      (ν := scoreLaw) hcoordinate_meas hscoreLaw_coordinate_memLp
  have hProjectedSummandCLT :
      vaart1998_finiteCoordinateProjectedSummandCLT
        (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
        (fun coordinate i sample => sample i coordinate) Z :=
    vaart1998_theorem_5_41_canonicalProductScore_projectedSummandCLT_of_vectorLawGaussianSource
      (Q := Q) (scoreLaw := scoreLaw) (Z := Z)
      hcoordinate_meas hscoreLaw_coordinate_memLp hZ_gaussian hZ_memLp
      hZ_mean hZ_covariance_scoreLaw
  have hProjectedScalarCLT :
      vaart1998_finiteCoordinateProjectedScalarCLT
        (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
        (fun coordinate i sample => sample i coordinate) Z :=
    vaart1998_finiteCoordinateProjectedScalarCLT_of_projectedSummandCLT
      (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
      hProjectedSummandCLT
  let B :=
    vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional
      (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
      (fun coordinate i sample => sample i coordinate) Z
      hcanonicalCoordinateSource.2 hZ_aemeas hProjectedScalarCLT
  simpa [B, vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment] using
    B.cramerWold_vector_clt B.projected_clt

/--
van der Vaart 1998, Theorem 5.41, raw score CLT from canonical product scores.

If the raw scaled estimating-map average agrees a.e. with the canonical
finite-coordinate scaled centered empirical moment, then the canonical product
score CLT gives the raw score CLT required by the Z-estimator handoff.
-/
theorem vaart1998_theorem_5_41_rawScoreCLT_of_canonicalProductScore_finiteCoordinate_eq
    {Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    {scoreLaw : Measure (Coord -> ℝ)} [IsProbabilityMeasure scoreLaw]
    (samples :
      ∀ n : ℕ, (ℕ -> Coord -> ℝ) -> SampleAt Observation n)
    (scale : ℕ -> (ℕ -> Coord -> ℝ) -> ℝ)
    (estimatingMap :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Θ -> Coord -> ℝ)
    (theta0 : ℕ -> (ℕ -> Coord -> ℝ) -> Θ)
    {Z : Ω' -> Coord -> ℝ}
    (hcoordinate_meas : ∀ coordinate,
      Measurable (fun sampleVector : Coord -> ℝ => sampleVector coordinate))
    (hscoreLaw_coordinate_memLp : ∀ coordinate,
      MemLp (fun sampleVector : Coord -> ℝ => sampleVector coordinate) 2
        scoreLaw)
    (hZ_aemeas : AEMeasurable Z Q)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance_scoreLaw : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance L scoreLaw)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun sample =>
        empiricalAverageVector (samples n sample)
          (fun x => scale n sample • estimatingMap n sample x (theta0 n sample))) =ᵐ[
            Measure.infinitePi (fun _ : ℕ => scoreLaw)]
        fun sample => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          (Measure.infinitePi (fun _ : ℕ => scoreLaw))
          (fun coordinate i sample => sample i coordinate) n sample) :
    TendstoInDistribution
      (fun n sample =>
        empiricalAverageVector (samples n sample)
          (fun x => scale n sample • estimatingMap n sample x (theta0 n sample)))
      atTop Z (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q := by
  have hFiniteScoreCLT :
      TendstoInDistribution
        (fun n sample =>
          vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
            (Measure.infinitePi (fun _ : ℕ => scoreLaw))
            (fun coordinate i sample => sample i coordinate) n sample)
        atTop Z (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q :=
    vaart1998_theorem_5_41_canonicalProductScore_finiteVectorCLT_of_vectorLawGaussianSource
      (Q := Q) (scoreLaw := scoreLaw) (Z := Z)
      hcoordinate_meas hscoreLaw_coordinate_memLp hZ_aemeas hZ_gaussian
      hZ_memLp hZ_mean hZ_covariance_scoreLaw
  refine TendstoInDistribution.congr ?_ Filter.EventuallyEq.rfl hFiniteScoreCLT
  intro n
  exact (hRawScore_eq_finiteCoordinate n).symm

/--
van der Vaart 1998, Theorem 5.41, Z-estimator handoff with canonical raw
score CLT source.

This wrapper plugs the canonical product raw-score CLT directly into the
compiled derivative-norm Theorem 5.41 handoff.  It keeps the derivative and
tightness fields explicit while discharging the score CLT source from the
canonical iid score law and the raw-score a.e. representation.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_canonicalProductRawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    {scoreLaw : Measure (Coord -> ℝ)} [IsProbabilityMeasure scoreLaw]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples :
      ∀ n : ℕ, (ℕ -> Coord -> ℝ) -> SampleAt Observation n)
    (scale : ℕ -> (ℕ -> Coord -> ℝ) -> ℝ)
    (estimatingMap :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Θ ->
        Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation ->
        Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator :
      ℕ -> (ℕ -> Coord -> ℝ) -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hcoordinate_meas : ∀ coordinate,
      Measurable (fun sampleVector : Coord -> ℝ => sampleVector coordinate))
    (hscoreLaw_coordinate_memLp : ∀ coordinate,
      MemLp (fun sampleVector : Coord -> ℝ => sampleVector coordinate) 2
        scoreLaw)
    (hZ_aemeas : AEMeasurable Z Q)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance_scoreLaw : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance L scoreLaw)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun sample =>
        empiricalAverageVector (samples n sample)
          (fun x => scale n sample • estimatingMap n sample x (theta0 n sample))) =ᵐ[
            Measure.infinitePi (fun _ : ℕ => scoreLaw)]
        fun sample => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          (Measure.infinitePi (fun _ : ℕ => scoreLaw))
          (fun coordinate i sample => sample i coordinate) n sample)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun sample =>
          empiricalAverageVector (samples n sample)
            (fun x => derivativeAt n sample x (theta0 n sample)))
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hDerivativeAverage_norm_ae :
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n sample)
                (fun x => derivativeAt n sample x (theta0 n sample)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure (Measure.infinitePi (fun _ : ℕ => scoreLaw))
        (fun n sample => ‖estimator n sample - theta0 n sample‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure (Measure.infinitePi (fun _ : ℕ => scoreLaw))
        (fun n sample => empiricalAverage (samples n sample) envelope)
        atTop (fun _ : ℕ -> Coord -> ℝ => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          ((Measure.infinitePi (fun _ : ℕ => scoreLaw)).map
              (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ sample x,
      ‖secondDerivative n sample x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun sample => derivativeAt n sample (samples n sample i)
          (theta0 n sample))
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun sample => secondDerivative n sample (samples n sample i))
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hTheta0_meas : ∀ n,
      AEMeasurable (theta0 n) (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hEstimator_meas : ∀ n,
      AEMeasurable (estimator n)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hScale_meas : ∀ n,
      AEMeasurable (scale n) (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        empiricalAverageVector (samples n sample)
          (fun x => estimatingMap n sample x (estimator n sample)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        scoreAtTheta0 n sample (samples n sample i) =
          scale n sample • estimatingMap n sample
            (samples n sample i) (theta0 n sample))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        estimatingAtEstimator n sample (samples n sample i) =
          scale n sample • estimatingMap n sample
            (samples n sample i) (estimator n sample))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        delta n sample = estimator n sample - theta0 n sample)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        scaledEstimator n sample =
          scale n sample • (estimator n sample - theta0 n sample))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        IsOpen (sourceSet n sample (samples n sample i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ((fun t : ℝ => theta0 n sample + t • delta n sample) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n sample (samples n sample i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n sample (samples n sample i))
          (sourceSet n sample (samples n sample i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n sample (samples n sample i))
              (theta0 n sample + x • delta n sample) =
            derivativeAt n sample (samples n sample i)
              (theta0 n sample + x • delta n sample))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n sample (samples n sample i))
          (sourceSet n sample (samples n sample i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n sample (samples n sample i))
              (theta0 n sample + x • delta n sample) =
            secondDerivative n sample (samples n sample i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω))
      (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q := by
  have hRawScoreCLT :
      TendstoInDistribution
        (fun n sample =>
          empiricalAverageVector (samples n sample)
            (fun x => scale n sample • estimatingMap n sample x (theta0 n sample)))
        atTop Z (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q :=
    vaart1998_theorem_5_41_rawScoreCLT_of_canonicalProductScore_finiteCoordinate_eq
      (Q := Q) (scoreLaw := scoreLaw) (samples := samples)
      (scale := scale) (estimatingMap := estimatingMap)
      (theta0 := theta0) (Z := Z)
      hcoordinate_meas hscoreLaw_coordinate_memLp hZ_aemeas hZ_gaussian
      hZ_memLp hZ_mean hZ_covariance_scoreLaw hRawScore_eq_finiteCoordinate
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope
      (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
      (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, canonical raw score handoff with an explicit
`O_P(1)` scaled estimator.

This is the canonical-product companion to the direct `O_P(1)` endpoint above.
The iid canonical score law supplies the raw-score CLT, while tightness is kept
as the textbook `StochasticBounded` hypothesis on the scaled estimator instead
of being expanded into a law-tail display.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_canonicalProductRawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    {scoreLaw : Measure (Coord -> ℝ)} [IsProbabilityMeasure scoreLaw]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples :
      ∀ n : ℕ, (ℕ -> Coord -> ℝ) -> SampleAt Observation n)
    (scale : ℕ -> (ℕ -> Coord -> ℝ) -> ℝ)
    (estimatingMap :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Θ ->
        Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> (ℕ -> Coord -> ℝ) -> Observation ->
        Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> (ℕ -> Coord -> ℝ) -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    {theta0 estimator delta scaledEstimator :
      ℕ -> (ℕ -> Coord -> ℝ) -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hcoordinate_meas : ∀ coordinate,
      Measurable (fun sampleVector : Coord -> ℝ => sampleVector coordinate))
    (hscoreLaw_coordinate_memLp : ∀ coordinate,
      MemLp (fun sampleVector : Coord -> ℝ => sampleVector coordinate) 2
        scoreLaw)
    (hZ_aemeas : AEMeasurable Z Q)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance_scoreLaw : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance L scoreLaw)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun sample =>
        empiricalAverageVector (samples n sample)
          (fun x => scale n sample • estimatingMap n sample x (theta0 n sample))) =ᵐ[
            Measure.infinitePi (fun _ : ℕ => scoreLaw)]
        fun sample => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          (Measure.infinitePi (fun _ : ℕ => scoreLaw))
          (fun coordinate i sample => sample i coordinate) n sample)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun sample =>
          empiricalAverageVector (samples n sample)
            (fun x => derivativeAt n sample x (theta0 n sample)))
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hDerivativeAverage_norm_ae :
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n sample)
                (fun x => derivativeAt n sample x (theta0 n sample)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure (Measure.infinitePi (fun _ : ℕ => scoreLaw))
        (fun n sample => ‖estimator n sample - theta0 n sample‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure (Measure.infinitePi (fun _ : ℕ => scoreLaw))
        (fun n sample => empiricalAverage (samples n sample) envelope)
        atTop (fun _ : ℕ -> Coord -> ℝ => envelopeMean))
    (hScaledEstimator :
      StochasticBounded (Measure.infinitePi (fun _ : ℕ => scoreLaw))
        scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ sample x,
      ‖secondDerivative n sample x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun sample => derivativeAt n sample (samples n sample i)
          (theta0 n sample))
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun sample => secondDerivative n sample (samples n sample i))
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hTheta0_meas : ∀ n,
      AEMeasurable (theta0 n) (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hEstimator_meas : ∀ n,
      AEMeasurable (estimator n)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hScale_meas : ∀ n,
      AEMeasurable (scale n) (Measure.infinitePi (fun _ : ℕ => scoreLaw)))
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        empiricalAverageVector (samples n sample)
          (fun x => estimatingMap n sample x (estimator n sample)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        scoreAtTheta0 n sample (samples n sample i) =
          scale n sample • estimatingMap n sample
            (samples n sample i) (theta0 n sample))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        estimatingAtEstimator n sample (samples n sample i) =
          scale n sample • estimatingMap n sample
            (samples n sample i) (estimator n sample))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        delta n sample = estimator n sample - theta0 n sample)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw),
        scaledEstimator n sample =
          scale n sample • (estimator n sample - theta0 n sample))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        IsOpen (sourceSet n sample (samples n sample i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ((fun t : ℝ => theta0 n sample + t • delta n sample) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n sample (samples n sample i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n sample (samples n sample i))
          (sourceSet n sample (samples n sample i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n sample (samples n sample i))
              (theta0 n sample + x • delta n sample) =
            derivativeAt n sample (samples n sample i)
              (theta0 n sample + x • delta n sample))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n sample (samples n sample i))
          (sourceSet n sample (samples n sample i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ sample ∂Measure.infinitePi (fun _ : ℕ => scoreLaw), ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n sample (samples n sample i))
              (theta0 n sample + x • delta n sample) =
            secondDerivative n sample (samples n sample i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω))
      (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q := by
  have hRawScoreCLT :
      TendstoInDistribution
        (fun n sample =>
          empiricalAverageVector (samples n sample)
            (fun x => scale n sample • estimatingMap n sample x (theta0 n sample)))
        atTop Z (fun _ => Measure.infinitePi (fun _ : ℕ => scoreLaw)) Q :=
    vaart1998_theorem_5_41_rawScoreCLT_of_canonicalProductScore_finiteCoordinate_eq
      (Q := Q) (scoreLaw := scoreLaw) (samples := samples)
      (scale := scale) (estimatingMap := estimatingMap)
      (theta0 := theta0) (Z := Z)
      hcoordinate_meas hscoreLaw_coordinate_memLp hZ_aemeas hZ_gaussian
      hZ_memLp hZ_mean hZ_covariance_scoreLaw hRawScore_eq_finiteCoordinate
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope
      (P := Measure.infinitePi (fun _ : ℕ => scoreLaw)) (Q := Q)
      (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, raw score CLT handoff from the
finite-coordinate projected-summand CLT.

This wrapper connects the Chapter 5.41 raw score field to the reusable
finite-coordinate Cramér-Wold/CLT lane from Chapter 4: once the raw scaled
estimating-map average is identified a.e. with a scaled centered
finite-coordinate empirical moment, projected summand CLTs produce the raw
score CLT consumed by the current endpoint.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_projectedSummandCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hProjectedSummandCLT :
      vaart1998_finiteCoordinateProjectedSummandCLT
        (P := P) (Q := Q) scoreSummand Z)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hProjectedScalarCLT :
      vaart1998_finiteCoordinateProjectedScalarCLT
        (P := P) (Q := Q) scoreSummand Z :=
    vaart1998_finiteCoordinateProjectedScalarCLT_of_projectedSummandCLT
      (P := P) (Q := Q) hProjectedSummandCLT
  let B :=
    vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional
      (P := P) (Q := Q) scoreSummand Z hScoreSummand_meas hZ_aemeas
      hProjectedScalarCLT
  have hFiniteScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
            P scoreSummand n ω)
        atTop Z (fun _ => P) Q := by
    simpa [B, vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment] using
      B.cramerWold_vector_clt B.projected_clt
  have hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q := by
    refine TendstoInDistribution.congr ?_ Filter.EventuallyEq.rfl hFiniteScoreCLT
    intro n
    exact (hRawScore_eq_finiteCoordinate n).symm
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, projected-summand score CLT handoff with an
explicit `O_P(1)` scaled estimator.

This is the projected-summand companion to the direct `O_P(1)` endpoint.  It
first turns the finite-coordinate projected-summand CLT into the raw scaled
score CLT, then applies the derivative-norm handoff while keeping tightness as
the direct `StochasticBounded` hypothesis on the scaled estimator.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_projectedSummandCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hProjectedSummandCLT :
      vaart1998_finiteCoordinateProjectedSummandCLT
        (P := P) (Q := Q) scoreSummand Z)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hProjectedScalarCLT :
      vaart1998_finiteCoordinateProjectedScalarCLT
        (P := P) (Q := Q) scoreSummand Z :=
    vaart1998_finiteCoordinateProjectedScalarCLT_of_projectedSummandCLT
      (P := P) (Q := Q) hProjectedSummandCLT
  let B :=
    vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional
      (P := P) (Q := Q) scoreSummand Z hScoreSummand_meas hZ_aemeas
      hProjectedScalarCLT
  have hFiniteScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
            P scoreSummand n ω)
        atTop Z (fun _ => P) Q := by
    simpa [B, vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment] using
      B.cramerWold_vector_clt B.projected_clt
  have hRawScoreCLT :
      TendstoInDistribution
        (fun n ω =>
          empiricalAverageVector (samples n ω)
            (fun x => scale n ω • estimatingMap n ω x (theta0 n ω)))
        atTop Z (fun _ => P) Q := by
    refine TendstoInDistribution.congr ?_ Filter.EventuallyEq.rfl hFiniteScoreCLT
    intro n
    exact (hRawScore_eq_finiteCoordinate n).symm
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_rawScoreCLT_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hRawScoreCLT hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, score CLT source handoff from common
finite-coordinate vector laws.

This wrapper replaces the abstract projected-summand CLT input by the concrete
finite-coordinate source fields already packaged in the Chapter 4 CLT lane:
coordinate `L^2` score summands, a centered Gaussian limit with matching
projected covariance, and a common-vector-law/infinite-product sample source.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hProjectedSummandCLT :
      vaart1998_finiteCoordinateProjectedSummandCLT
        (P := P) (Q := Q) scoreSummand Z :=
    vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_commonVectorLawGaussianSource
      (P := P) (Q := Q) (X := scoreSummand) (Z := Z)
      (ν := scoreLaw)
      (hX_coordinate_memLp := hScoreSummand_coordinate_memLp)
      (hZ_gaussian := hZ_gaussian) (hZ_memLp := hZ_memLp)
      (hZ_mean := hZ_mean) (hZ_covariance := hZ_covariance)
      (hX_vector_law := hScore_vector_law)
      (hX_sequence_law := hScore_sequence_law)
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_projectedSummandCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas hProjectedSummandCLT
      hRawScore_eq_finiteCoordinate hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, common-vector-law score CLT handoff with an
explicit `O_P(1)` scaled estimator.

This is the direct-OP companion to the common-vector-law source wrapper above.
The Chapter 4 CLT source fields produce the finite-coordinate projected
summand CLT, and the projected `O_P(1)` handoff consumes the scaled-estimator
`StochasticBounded` hypothesis without expanding it into law tails.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hProjectedSummandCLT :
      vaart1998_finiteCoordinateProjectedSummandCLT
        (P := P) (Q := Q) scoreSummand Z :=
    vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_coordinateMemLp_commonVectorLawGaussianSource
      (P := P) (Q := Q) (X := scoreSummand) (Z := Z)
      (ν := scoreLaw)
      (hX_coordinate_memLp := hScoreSummand_coordinate_memLp)
      (hZ_gaussian := hZ_gaussian) (hZ_memLp := hZ_memLp)
      (hZ_mean := hZ_mean) (hZ_covariance := hZ_covariance)
      (hX_vector_law := hScore_vector_law)
      (hX_sequence_law := hScore_sequence_law)
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_projectedSummandCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas hProjectedSummandCLT
      hRawScore_eq_finiteCoordinate hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, raw-score representation as a scaled
centered finite-coordinate empirical moment.

If the finite-coordinate score summands have zero population mean and the raw
scaled estimating-map summands agree a.e. with `sqrt n` times those summands,
then the raw score average is exactly the scaled centered empirical moment
used by the Cramér-Wold CLT lane.
-/
theorem vaart1998_theorem_5_41_rawScore_eq_finiteCoordinateScaledCentered_of_summand_eq
    {Ω Observation Coord Θ : Type*} [Fintype Coord] [MeasurableSpace Ω]
    {P : Measure Ω}
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (theta0 : ℕ -> Ω -> Θ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω) :
    ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω := by
  intro n
  filter_upwards [hSummand_eq n] with ω hω
  funext coordinate
  have hsum :
      (∑ i : Fin n,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate) =
        ∑ i : Fin n, √(n : ℝ) * scoreSummand coordinate i.val ω := by
    exact Finset.sum_congr rfl fun i _hi => hω i coordinate
  have hsum_range :
      (∑ i : Fin n, scoreSummand coordinate i.val ω) =
        ∑ i ∈ Finset.range n, scoreSummand coordinate i ω := by
    simpa using
      (Fin.sum_univ_eq_sum_range
        (fun i : ℕ => scoreSummand coordinate i ω) n)
  calc
    (empiricalAverageVector (samples n ω)
        (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) coordinate
        = ((n : ℝ)⁻¹) *
            (∑ i : Fin n,
              (scale n ω • estimatingMap n ω (samples n ω i)
                (theta0 n ω)) coordinate) := by
          simp only [empiricalAverageVector, Pi.smul_apply, Finset.sum_apply,
            smul_eq_mul]
    _ = ((n : ℝ)⁻¹) *
          (∑ i : Fin n, √(n : ℝ) * scoreSummand coordinate i.val ω) := by
          rw [hsum]
    _ = √(n : ℝ) *
          ((∑ i ∈ Finset.range n, scoreSummand coordinate i ω) / (n : ℝ) -
            ∫ sample, scoreSummand coordinate 0 sample ∂P) := by
          rw [hScoreMean_zero coordinate, ← Finset.mul_sum, hsum_range]
          ring
    _ = (vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω) coordinate := by
          simp [vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment,
            vaart1998_finiteCoordinateEmpiricalMoment,
            vaart1998_finiteCoordinatePopulationMoment,
            hScoreMean_zero coordinate, div_eq_mul_inv, mul_comm,
            mul_left_comm]

/--
van der Vaart 1998, Theorem 5.41, derivative operator-norm residual from an
eventual a.s. error bound.

This is the source target for an iid/operator strong law: it is enough to
construct an a.s. error bound tending to zero and eventually dominating the
operator-norm empirical derivative residual.
-/
theorem vaart1998_theorem_5_41_derivativeAverage_norm_tendsto_ae_of_eventual_bound
    {Ω Observation Coord Θ : Type*} [Fintype Coord] [MeasurableSpace Ω]
    {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ))
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Θ)
    (derivativeErrorBound : ℕ -> Ω -> ℝ)
    (hDerivativeErrorBound_ae :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => derivativeErrorBound n ω) atTop (𝓝 0))
    (hDerivativeAverage_norm_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖ ≤
            derivativeErrorBound n ω) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ =>
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
        atTop (𝓝 0) := by
  filter_upwards [hDerivativeErrorBound_ae, hDerivativeAverage_norm_le] with
    ω hbound hle
  exact squeeze_zero' (Eventually.of_forall fun _ => norm_nonneg _) hle hbound

/--
van der Vaart 1998, Theorem 5.41, finite-entry derivative error bound from
the real-valued strong law.

For finitely many real derivative entries, coordinatewise iid centered strong
laws imply that the sum of absolute centered empirical derivative-entry errors
tends to zero almost surely.  This is the finite-dimensional source layer for
the derivative error bound used by the operator-norm residual handoff.
-/
theorem vaart1998_theorem_5_41_derivativeErrorBound_tendsto_ae_of_finiteCenteredStrongLaw
    {Entry Ω : Type*} [Fintype Entry] [MeasurableSpace Ω] {P : Measure Ω}
    (derivativeEntry : Entry -> ℕ -> Ω -> ℝ)
    (hDerivativeEntry_integrable :
      ∀ entry, Integrable (derivativeEntry entry 0) P)
    (hDerivativeEntry_indep :
      ∀ entry, Pairwise fun i j =>
        _root_.ProbabilityTheory.IndepFun
          (derivativeEntry entry i) (derivativeEntry entry j) P)
    (hDerivativeEntry_ident :
      ∀ entry i,
        _root_.ProbabilityTheory.IdentDistrib
          (derivativeEntry entry i) (derivativeEntry entry 0) P P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ =>
          ∑ entry : Entry,
            |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
              ∫ sample, derivativeEntry entry 0 sample ∂P|)
        atTop (𝓝 0) := by
  have hcenter :=
    StatInference.ProbabilityMeasure.finite_centeredStrongLaw_ae_real
      derivativeEntry hDerivativeEntry_integrable hDerivativeEntry_indep
      hDerivativeEntry_ident
  filter_upwards [hcenter] with ω hω
  have hterm : ∀ entry : Entry,
      Tendsto
        (fun n : ℕ =>
          |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
            ∫ sample, derivativeEntry entry 0 sample ∂P|)
        atTop (𝓝 0) := by
    intro entry
    simpa using (hω entry).abs
  simpa using tendsto_finsetSum Finset.univ fun entry _hentry => hterm entry

/--
van der Vaart 1998, Theorem 5.41, derivative operator-norm domination from an
action bound.

If the empirical derivative residual is bounded on every nonzero direction by
the finite-entry error bound times the direction norm, then its operator norm is
bounded by the same finite-entry error bound.  This is the operator-norm
handoff between scalar derivative-entry algebra and the derivative LLN source
field.
-/
theorem vaart1998_theorem_5_41_derivativeAverage_norm_le_finiteEntryBound_of_action_bound
    {Entry Ω Observation Coord Θ : Type*} [Fintype Entry] [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ))
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Θ)
    (derivativeEntry : Entry -> ℕ -> Ω -> ℝ)
    (hDerivativeAverage_action_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ∀ x : Θ, ‖x‖ ≠ 0 ->
            ‖(empiricalAverageVector (samples n ω)
                (fun y => derivativeAt n ω y (theta0 n ω)) - V) x‖ ≤
              (∑ entry : Entry,
                |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                  ∫ sample, derivativeEntry entry 0 sample ∂P|) * ‖x‖) :
    ∀ᵐ ω ∂P,
      ∀ᶠ n in atTop,
        ‖empiricalAverageVector (samples n ω)
            (fun y => derivativeAt n ω y (theta0 n ω)) - V‖ ≤
          ∑ entry : Entry,
            |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
              ∫ sample, derivativeEntry entry 0 sample ∂P| := by
  filter_upwards [hDerivativeAverage_action_le] with ω hω
  filter_upwards [hω] with n hn
  have hbound_nonneg :
      0 ≤
        ∑ entry : Entry,
          |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
            ∫ sample, derivativeEntry entry 0 sample ∂P| :=
    Finset.sum_nonneg fun entry _hentry => abs_nonneg _
  exact
    (empiricalAverageVector (samples n ω)
        (fun y => derivativeAt n ω y (theta0 n ω)) - V).opNorm_le_bound'
      hbound_nonneg hn

/--
van der Vaart 1998, Theorem 5.41, derivative action bound from coordinate
scalar bounds.

For finite-dimensional score spaces `Coord -> ℝ`, it is enough to bound each
coordinate of the empirical derivative residual action by the same
finite-entry scalar error times `‖x‖`.  The product-space sup norm then gives
the vector action bound consumed by the operator-norm handoff.
-/
theorem vaart1998_theorem_5_41_derivativeAverage_action_le_finiteEntryBound_of_coordinate_bound
    {Entry Ω Observation Coord Θ : Type*} [Fintype Entry] [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ))
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Θ)
    (derivativeEntry : Entry -> ℕ -> Ω -> ℝ)
    (hDerivativeAverage_coordinate_action_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ∀ x : Θ, ‖x‖ ≠ 0 -> ∀ coordinate : Coord,
            |((empiricalAverageVector (samples n ω)
                (fun y => derivativeAt n ω y (theta0 n ω)) - V) x)
                  coordinate| ≤
              (∑ entry : Entry,
                |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                  ∫ sample, derivativeEntry entry 0 sample ∂P|) * ‖x‖) :
    ∀ᵐ ω ∂P,
      ∀ᶠ n in atTop,
        ∀ x : Θ, ‖x‖ ≠ 0 ->
          ‖(empiricalAverageVector (samples n ω)
              (fun y => derivativeAt n ω y (theta0 n ω)) - V) x‖ ≤
            (∑ entry : Entry,
              |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry 0 sample ∂P|) * ‖x‖ := by
  filter_upwards [hDerivativeAverage_coordinate_action_le] with ω hω
  filter_upwards [hω] with n hn
  intro x hx
  have hbound_nonneg :
      0 ≤
        (∑ entry : Entry,
          |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
            ∫ sample, derivativeEntry entry 0 sample ∂P|) * ‖x‖ := by
    exact mul_nonneg
      (Finset.sum_nonneg fun entry _hentry => abs_nonneg _)
      (norm_nonneg x)
  refine (pi_norm_le_iff_of_nonneg hbound_nonneg).mpr ?_
  intro coordinate
  simpa [Real.norm_eq_abs] using hn x hx coordinate

/--
van der Vaart 1998, Theorem 5.41, coordinate derivative action bound from a
weighted finite-entry representation.

If every coordinate of the empirical derivative residual action is a finite
weighted sum of centered derivative-entry errors, and each scalar weight is
bounded by the direction norm, then that coordinate is bounded by the total
finite-entry error times the direction norm.  This is the scalar algebra layer
feeding the coordinate-bound derivative handoff.
-/
theorem vaart1998_theorem_5_41_derivativeAverage_coordinate_action_le_finiteEntryBound_of_weighted_entry_representation
    {Entry Ω Observation Coord Θ : Type*} [Fintype Entry] [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    (V : Θ →L[ℝ] (Coord -> ℝ))
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Θ)
    (derivativeEntry : Entry -> ℕ -> Ω -> ℝ)
    (entryWeight : Coord -> Entry -> Θ -> ℝ)
    (hEntryWeight_abs_le :
      ∀ coordinate entry x, |entryWeight coordinate entry x| ≤ ‖x‖)
    (hCoordinate_action_eq :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ∀ x : Θ, ∀ coordinate : Coord,
            ((empiricalAverageVector (samples n ω)
                (fun y => derivativeAt n ω y (theta0 n ω)) - V) x)
                  coordinate =
              ∑ entry : Entry,
                entryWeight coordinate entry x *
                  ((∑ i ∈ Finset.range n, derivativeEntry entry i ω) /
                      (n : ℝ) -
                    ∫ sample, derivativeEntry entry 0 sample ∂P)) :
    ∀ᵐ ω ∂P,
      ∀ᶠ n in atTop,
        ∀ x : Θ, ‖x‖ ≠ 0 -> ∀ coordinate : Coord,
          |((empiricalAverageVector (samples n ω)
              (fun y => derivativeAt n ω y (theta0 n ω)) - V) x)
                coordinate| ≤
            (∑ entry : Entry,
              |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry 0 sample ∂P|) * ‖x‖ := by
  filter_upwards [hCoordinate_action_eq] with ω hω
  filter_upwards [hω] with n hn
  intro x _hx coordinate
  let entryError : Entry -> ℝ := fun entry =>
    (∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
      ∫ sample, derivativeEntry entry 0 sample ∂P
  calc
    |((empiricalAverageVector (samples n ω)
        (fun y => derivativeAt n ω y (theta0 n ω)) - V) x) coordinate|
        = |∑ entry : Entry,
            entryWeight coordinate entry x * entryError entry| := by
          rw [hn x coordinate]
    _ ≤ ∑ entry : Entry,
          |entryWeight coordinate entry x * entryError entry| :=
          Finset.abs_sum_le_sum_abs
            (fun entry : Entry =>
              entryWeight coordinate entry x * entryError entry) Finset.univ
    _ ≤ ∑ entry : Entry, ‖x‖ * |entryError entry| := by
          exact Finset.sum_le_sum fun entry _hentry => by
            rw [abs_mul]
            exact mul_le_mul_of_nonneg_right
              (hEntryWeight_abs_le coordinate entry x) (abs_nonneg _)
    _ = (∑ entry : Entry, |entryError entry|) * ‖x‖ := by
          rw [← Finset.mul_sum, mul_comm]

/--
van der Vaart 1998, Theorem 5.41, finite-coordinate derivative action bound
from a matrix-entry representation.

For a finite-dimensional parameter space `Param -> ℝ`, a coordinate residual
represented as the row-wise finite sum
`∑ param, x param * entryError (coordinate, param)` is bounded by the full
finite derivative-entry table times `‖x‖`.  The only weight estimate needed is
the product-norm coordinate bound `|x param| ≤ ‖x‖`.
-/
theorem vaart1998_theorem_5_41_derivativeAverage_coordinate_action_le_finiteEntryBound_of_matrix_entry_representation
    {Param Ω Observation Coord : Type*} [Fintype Param] [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    (V : (Param -> ℝ) →L[ℝ] (Coord -> ℝ))
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> (Param -> ℝ) ->
        (Param -> ℝ) →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Param -> ℝ)
    (derivativeEntry : Coord -> Param -> ℕ -> Ω -> ℝ)
    (hCoordinate_action_eq :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ∀ x : Param -> ℝ, ∀ coordinate : Coord,
            ((empiricalAverageVector (samples n ω)
                (fun y => derivativeAt n ω y (theta0 n ω)) - V) x)
                  coordinate =
              ∑ param : Param,
                x param *
                  ((∑ i ∈ Finset.range n,
                        derivativeEntry coordinate param i ω) / (n : ℝ) -
                    ∫ sample, derivativeEntry coordinate param 0 sample ∂P)) :
    ∀ᵐ ω ∂P,
      ∀ᶠ n in atTop,
        ∀ x : Param -> ℝ, ‖x‖ ≠ 0 -> ∀ coordinate : Coord,
          |((empiricalAverageVector (samples n ω)
              (fun y => derivativeAt n ω y (theta0 n ω)) - V) x)
                coordinate| ≤
            (∑ entry : Coord × Param,
              |(∑ i ∈ Finset.range n,
                    derivativeEntry entry.1 entry.2 i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry.1 entry.2 0 sample ∂P|) *
              ‖x‖ := by
  filter_upwards [hCoordinate_action_eq] with ω hω
  filter_upwards [hω] with n hn
  intro x _hx coordinate
  let entryError : Coord × Param -> ℝ := fun entry =>
    (∑ i ∈ Finset.range n, derivativeEntry entry.1 entry.2 i ω) / (n : ℝ) -
      ∫ sample, derivativeEntry entry.1 entry.2 0 sample ∂P
  let rowError : Param -> ℝ := fun param => entryError (coordinate, param)
  have hrow_le_table :
      (∑ param : Param, |rowError param|) ≤
        ∑ entry : Coord × Param, |entryError entry| := by
    have hrow_le_table' :
        (∑ param : Param, |entryError (coordinate, param)|) ≤
          ∑ coordinate' : Coord,
            ∑ param : Param, |entryError (coordinate', param)| := by
      exact Finset.single_le_sum
        (fun coordinate' _hcoordinate' =>
          Finset.sum_nonneg fun param _hparam =>
            abs_nonneg (entryError (coordinate', param)))
        (Finset.mem_univ coordinate)
    simpa [rowError, Fintype.sum_prod_type] using hrow_le_table'
  calc
    |((empiricalAverageVector (samples n ω)
        (fun y => derivativeAt n ω y (theta0 n ω)) - V) x) coordinate|
        = |∑ param : Param, x param * rowError param| := by
          rw [hn x coordinate]
    _ ≤ ∑ param : Param, |x param * rowError param| :=
          Finset.abs_sum_le_sum_abs
            (fun param : Param => x param * rowError param) Finset.univ
    _ ≤ ∑ param : Param, ‖x‖ * |rowError param| := by
          exact Finset.sum_le_sum fun param _hparam => by
            rw [abs_mul]
            exact mul_le_mul_of_nonneg_right
              (by simpa [Real.norm_eq_abs] using norm_le_pi_norm x param)
              (abs_nonneg _)
    _ = ‖x‖ * ∑ param : Param, |rowError param| := by
          rw [Finset.mul_sum]
    _ ≤ ‖x‖ * (∑ entry : Coord × Param, |entryError entry|) := by
          exact mul_le_mul_of_nonneg_left hrow_le_table (norm_nonneg x)
    _ = (∑ entry : Coord × Param, |entryError entry|) * ‖x‖ := by
          rw [mul_comm]

/--
van der Vaart 1998, Theorem 5.41, score CLT handoff with the raw-score
finite-coordinate representation discharged.

This wrapper keeps the common-vector-law score CLT source fields from the
current endpoint and replaces the abstract raw-score representation by the
source-shaped zero-mean and a.e. `sqrt n` score-summand identity.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scoreSummandRepresentation_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω :=
    vaart1998_theorem_5_41_rawScore_eq_finiteCoordinateScaledCentered_of_summand_eq
      (P := P) (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (theta0 := theta0)
      (scoreSummand := scoreSummand) hScoreMean_zero hSummand_eq
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas
      hScoreSummand_coordinate_memLp hZ_gaussian hZ_memLp hZ_mean
      hZ_covariance hScore_vector_law hScore_sequence_law
      hRawScore_eq_finiteCoordinate hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, score CLT handoff with the raw-score
finite-coordinate representation and explicit `O_P(1)` tightness.

This direct-OP wrapper keeps the common-vector-law score CLT source fields and
discharges the raw-score representation from the zero-mean score summands plus
the a.e. `sqrt n` score-summand identity.  It then feeds the
`StochasticBounded` scaled-estimator hypothesis into the common-vector
`O_P(1)` handoff.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scoreSummandRepresentation_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω)
    (hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P)
    (hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0))
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hRawScore_eq_finiteCoordinate : ∀ n : ℕ,
      (fun ω =>
        empiricalAverageVector (samples n ω)
          (fun x => scale n ω • estimatingMap n ω x (theta0 n ω))) =ᵐ[P]
        fun ω => vaart1998_finiteCoordinateScaledCenteredEmpiricalMoment
          P scoreSummand n ω :=
    vaart1998_theorem_5_41_rawScore_eq_finiteCoordinateScaledCentered_of_summand_eq
      (P := P) (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (theta0 := theta0)
      (scoreSummand := scoreSummand) hScoreMean_zero hSummand_eq
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas
      hScoreSummand_coordinate_memLp hZ_gaussian hZ_memLp hZ_mean
      hZ_covariance hScore_vector_law hScore_sequence_law
      hRawScore_eq_finiteCoordinate hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, derivative-bound source handoff.

This wrapper keeps the current common-vector-law score source and raw-score
summand representation, but replaces the empirical derivative average
strong-measurability and operator-norm residual fields by sampled derivative
summand measurability plus an a.s. error bound tending to zero.  A future
iid/operator strong law can now target that bound directly.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [SecondCountableTopology (Θ →L[ℝ] (Coord -> ℝ))]
    [OpensMeasurableSpace (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    (derivativeErrorBound : ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω)
    (hDerivativeErrorBound_ae :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => derivativeErrorBound n ω) atTop (𝓝 0))
    (hDerivativeAverage_norm_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖ ≤
            derivativeErrorBound n ω)
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeAverage_aemeas : ∀ n : ℕ,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P :=
    vaart1998_theorem_5_41_empiricalDerivative_aemeasurable_of_summands
      (P := P) (samples := samples) (derivativeAt := derivativeAt)
      (theta0 := theta0) hDerivativeAtTheta0_summand_meas
  have hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P := by
    intro n
    exact (hDerivativeAverage_aemeas n).aestronglyMeasurable
  have hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0) :=
    vaart1998_theorem_5_41_derivativeAverage_norm_tendsto_ae_of_eventual_bound
      (P := P) (V := V) (samples := samples)
      (derivativeAt := derivativeAt) (theta0 := theta0)
      (derivativeErrorBound := derivativeErrorBound)
      hDerivativeErrorBound_ae hDerivativeAverage_norm_le
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scoreSummandRepresentation_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas
      hScoreSummand_coordinate_memLp hZ_gaussian hZ_memLp hZ_mean
      hZ_covariance hScore_vector_law hScore_sequence_law
      hScoreMean_zero hSummand_eq hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, derivative-bound source handoff with
explicit `O_P(1)` tightness.

This is the direct-OP companion to the derivative-bound wrapper above.  The
sampled derivative summand measurability and a.s. derivative-error bound still
produce the empirical derivative strong-measurability and operator-norm
residual fields, but the final Z-estimator endpoint consumes the
`StochasticBounded` scaled-estimator hypothesis directly.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Θ : Type*} [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [SecondCountableTopology (Θ →L[ℝ] (Coord -> ℝ))]
    [OpensMeasurableSpace (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    (derivativeErrorBound : ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω)
    (hDerivativeErrorBound_ae :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => derivativeErrorBound n ω) atTop (𝓝 0))
    (hDerivativeAverage_norm_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖ ≤
            derivativeErrorBound n ω)
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator : StochasticBounded P scaledEstimator)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeAverage_aemeas : ∀ n : ℕ,
      AEMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P :=
    vaart1998_theorem_5_41_empiricalDerivative_aemeasurable_of_summands
      (P := P) (samples := samples) (derivativeAt := derivativeAt)
      (theta0 := theta0) hDerivativeAtTheta0_summand_meas
  have hDerivativeAverage_strongMeas : ∀ n : ℕ,
      AEStronglyMeasurable
        (fun ω =>
          empiricalAverageVector (samples n ω)
            (fun x => derivativeAt n ω x (theta0 n ω))) P := by
    intro n
    exact (hDerivativeAverage_aemeas n).aestronglyMeasurable
  have hDerivativeAverage_norm_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ‖empiricalAverageVector (samples n ω)
                (fun x => derivativeAt n ω x (theta0 n ω)) - V‖)
          atTop (𝓝 0) :=
    vaart1998_theorem_5_41_derivativeAverage_norm_tendsto_ae_of_eventual_bound
      (P := P) (V := V) (samples := samples)
      (derivativeAt := derivativeAt) (theta0 := theta0)
      (derivativeErrorBound := derivativeErrorBound)
      hDerivativeErrorBound_ae hDerivativeAverage_norm_le
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_scoreSummandRepresentation_commonVectorLawScoreCLT_derivativeNormAE_scaledEstimatorOP_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas
      hScoreSummand_coordinate_memLp hZ_gaussian hZ_memLp hZ_mean
      hZ_covariance hScore_vector_law hScore_sequence_law
      hScoreMean_zero hSummand_eq hDerivativeAverage_strongMeas
      hDerivativeAverage_norm_ae hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, finite-entry derivative strong-law bound
handoff.

This wrapper instantiates the derivative error bound by the finite sum of
absolute centered empirical derivative-entry errors and proves its a.s.
convergence to zero from coordinatewise real strong laws.  The only remaining
operator-specific derivative source field is the domination of the
operator-norm residual by that finite-entry error bound.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_finiteDerivativeStrongLawBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Entry Θ : Type*} [Fintype Coord] [Fintype Entry]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [SecondCountableTopology (Θ →L[ℝ] (Coord -> ℝ))]
    [OpensMeasurableSpace (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    (derivativeEntry : Entry -> ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω)
    (hDerivativeEntry_integrable :
      ∀ entry, Integrable (derivativeEntry entry 0) P)
    (hDerivativeEntry_indep :
      ∀ entry, Pairwise fun i j =>
        _root_.ProbabilityTheory.IndepFun
          (derivativeEntry entry i) (derivativeEntry entry j) P)
    (hDerivativeEntry_ident :
      ∀ entry i,
        _root_.ProbabilityTheory.IdentDistrib
          (derivativeEntry entry i) (derivativeEntry entry 0) P P)
    (hDerivativeAverage_norm_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ‖empiricalAverageVector (samples n ω)
              (fun x => derivativeAt n ω x (theta0 n ω)) - V‖ ≤
            ∑ entry : Entry,
              |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry 0 sample ∂P|)
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeErrorBound_ae :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ =>
            ∑ entry : Entry,
              |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry 0 sample ∂P|)
          atTop (𝓝 0) :=
    vaart1998_theorem_5_41_derivativeErrorBound_tendsto_ae_of_finiteCenteredStrongLaw
      (P := P) derivativeEntry hDerivativeEntry_integrable
      hDerivativeEntry_indep hDerivativeEntry_ident
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_derivativeBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand)
      (derivativeErrorBound := fun n ω =>
        ∑ entry : Entry,
          |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
            ∫ sample, derivativeEntry entry 0 sample ∂P|)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas
      hScoreSummand_coordinate_memLp hZ_gaussian hZ_memLp hZ_mean
      hZ_covariance hScore_vector_law hScore_sequence_law
      hScoreMean_zero hSummand_eq hDerivativeErrorBound_ae
      hDerivativeAverage_norm_le hEstimator_consistency hEnvelope_nonneg
      hEnvelopeAverage_tendsto hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

/--
van der Vaart 1998, Theorem 5.41, finite-entry derivative action-bound
handoff.

This endpoint replaces the operator-norm domination hypothesis in the
finite-entry strong-law handoff by a source-shaped action bound on every
nonzero direction.  The theorem packages the standard operator-norm step, so
the remaining derivative source work can focus on scalar finite-entry algebra.
-/
theorem vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_finiteDerivativeActionBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
    {Ω Ω' Observation Coord Entry Θ : Type*} [Fintype Coord] [Fintype Entry]
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [PseudoMetricSpace (Coord -> ℝ)]
    [SecondCountableTopology (Coord -> ℝ)] [BorelSpace (Coord -> ℝ)]
    [OpensMeasurableSpace (Coord -> ℝ)] [CompleteSpace (Coord -> ℝ)]
    [NormedAddCommGroup Θ] [NormedSpace ℝ Θ]
    [MeasurableSpace Θ] [SecondCountableTopology Θ] [BorelSpace Θ]
    [OpensMeasurableSpace Θ] [MeasurableSub₂ Θ] [MeasurableSMul₂ ℝ Θ]
    [SecondCountableTopology (Θ →L[ℝ] (Coord -> ℝ))]
    [OpensMeasurableSpace (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableAdd₂ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    [MeasurableConstSMul ℝ (Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))]
    (V : Θ →L[ℝ] (Coord -> ℝ)) (Vinv : (Coord -> ℝ) →L[ℝ] Θ)
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (scale : ℕ -> Ω -> ℝ)
    (estimatingMap : ℕ -> Ω -> Observation -> Θ -> Coord -> ℝ)
    (derivativeAt :
      ℕ -> Ω -> Observation -> Θ -> Θ →L[ℝ] (Coord -> ℝ))
    (scoreAtTheta0 estimatingAtEstimator :
      ℕ -> Ω -> Observation -> Coord -> ℝ)
    (secondDerivative :
      ℕ -> Ω -> Observation -> Θ →L[ℝ] Θ →L[ℝ] (Coord -> ℝ))
    (sourceSet : ℕ -> Ω -> Observation -> Set Θ)
    (envelope : Observation -> ℝ)
    (envelopeMean : ℝ)
    (scoreSummand : Coord -> ℕ -> Ω -> ℝ)
    (derivativeEntry : Entry -> ℕ -> Ω -> ℝ)
    {scoreLaw : Measure (Coord -> ℝ)}
    {theta0 estimator delta scaledEstimator : ℕ -> Ω -> Θ}
    {Z : Ω' -> Coord -> ℝ}
    (hLeftInverse : ∀ x : Θ, Vinv (V x) = x)
    (hScoreSummand_meas : ∀ coordinate i, Measurable (scoreSummand coordinate i))
    (hZ_aemeas : AEMeasurable Z Q)
    (hScoreSummand_coordinate_memLp :
      ∀ coordinate, MemLp (scoreSummand coordinate 0) 2 P)
    (hZ_gaussian : _root_.ProbabilityTheory.HasGaussianLaw Z Q)
    (hZ_memLp : MemLp id 2 (Q.map Z))
    (hZ_mean : ∀ L : StrongDual ℝ (Coord -> ℝ),
      (∫ ω, L (Z ω) ∂Q) = 0)
    (hZ_covariance : ∀ L : StrongDual ℝ (Coord -> ℝ),
      _root_.ProbabilityTheory.covarianceBilinDual (Q.map Z) L L =
        _root_.ProbabilityTheory.variance
          (vaart1998_finiteCoordinateProjectedSample L scoreSummand 0) P)
    (hScore_vector_law : ∀ i : ℕ,
      _root_.ProbabilityTheory.HasLaw
        (vaart1998_finiteCoordinateSampleVector scoreSummand i) scoreLaw P)
    (hScore_sequence_law :
      _root_.ProbabilityTheory.HasLaw
        (fun ω i => vaart1998_finiteCoordinateSampleVector scoreSummand i ω)
        (Measure.infinitePi (fun _ : ℕ => scoreLaw)) P)
    (hScoreMean_zero : ∀ coordinate : Coord,
      (∫ ω, scoreSummand coordinate 0 ω ∂P) = 0)
    (hSummand_eq : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n, ∀ coordinate : Coord,
        (scale n ω • estimatingMap n ω (samples n ω i)
          (theta0 n ω)) coordinate =
          √(n : ℝ) * scoreSummand coordinate i.val ω)
    (hDerivativeEntry_integrable :
      ∀ entry, Integrable (derivativeEntry entry 0) P)
    (hDerivativeEntry_indep :
      ∀ entry, Pairwise fun i j =>
        _root_.ProbabilityTheory.IndepFun
          (derivativeEntry entry i) (derivativeEntry entry j) P)
    (hDerivativeEntry_ident :
      ∀ entry i,
        _root_.ProbabilityTheory.IdentDistrib
          (derivativeEntry entry i) (derivativeEntry entry 0) P P)
    (hDerivativeAverage_action_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ∀ x : Θ, ‖x‖ ≠ 0 ->
            ‖(empiricalAverageVector (samples n ω)
                (fun y => derivativeAt n ω y (theta0 n ω)) - V) x‖ ≤
              (∑ entry : Entry,
                |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                  ∫ sample, derivativeEntry entry 0 sample ∂P|) * ‖x‖)
    (hEstimator_consistency :
      TendstoInMeasure P
        (fun n ω => ‖estimator n ω - theta0 n ω‖) atTop 0)
    (hEnvelope_nonneg : ∀ x, 0 ≤ envelope x)
    (hEnvelopeAverage_tendsto :
      TendstoInMeasure P
        (fun n ω => empiricalAverage (samples n ω) envelope)
        atTop (fun _ : Ω => envelopeMean))
    (hScaledEstimator_lawTail : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in atTop,
          (P.map (scaledEstimator n)).real {x : Θ | M ≤ ‖x‖} < ε)
    (hEnvelopeBound : ∀ᶠ n in atTop, ∀ ω x,
      ‖secondDerivative n ω x‖ ≤ envelope x)
    (hDerivativeAtTheta0_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => derivativeAt n ω (samples n ω i) (theta0 n ω)) P)
    (hSecondDerivative_summand_meas : ∀ n : ℕ, ∀ i : Fin n,
      AEMeasurable
        (fun ω => secondDerivative n ω (samples n ω i)) P)
    (hTheta0_meas : ∀ n, AEMeasurable (theta0 n) P)
    (hEstimator_meas : ∀ n, AEMeasurable (estimator n) P)
    (hScale_meas : ∀ n, AEMeasurable (scale n) P)
    (hRawRoot : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        empiricalAverageVector (samples n ω)
          (fun x => estimatingMap n ω x (estimator n ω)) = 0)
    (hScore_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        scoreAtTheta0 n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i) (theta0 n ω))
    (hEstimator_scaled : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        estimatingAtEstimator n ω (samples n ω i) =
          scale n ω • estimatingMap n ω (samples n ω i)
            (estimator n ω))
    (hDelta_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P, delta n ω = estimator n ω - theta0 n ω)
    (hScaledEstimator_eq_sub : ∀ n : ℕ,
      ∀ᵐ ω ∂P,
        scaledEstimator n ω =
          scale n ω • (estimator n ω - theta0 n ω))
    (hOpen : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        IsOpen (sourceSet n ω (samples n ω i)))
    (hSegmentSubset : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ((fun t : ℝ => theta0 n ω + t • delta n ω) ''
            Set.Icc (0 : ℝ) 1) ⊆
          sourceSet n ω (samples n ω i))
    (hContDiffEstimatingMap : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (estimatingMap n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hDerivativeAt_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (estimatingMap n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            derivativeAt n ω (samples n ω i)
              (theta0 n ω + x • delta n ω))
    (hContDiffDerivativeAt : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ContDiffOn ℝ 1 (derivativeAt n ω (samples n ω i))
          (sourceSet n ω (samples n ω i)))
    (hSecondDerivative_eq_fderiv : ∀ n : ℕ,
      ∀ᵐ ω ∂P, ∀ i : Fin n,
        ∀ x ∈ Set.Ioo (0 : ℝ) 1,
          fderiv ℝ (derivativeAt n ω (samples n ω i))
              (theta0 n ω + x • delta n ω) =
            secondDerivative n ω (samples n ω i)) :
    TendstoInDistribution scaledEstimator atTop
      (fun ω => (-Vinv : (Coord -> ℝ) →L[ℝ] Θ) (Z ω)) (fun _ => P) Q := by
  have hDerivativeAverage_norm_le :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ‖empiricalAverageVector (samples n ω)
              (fun y => derivativeAt n ω y (theta0 n ω)) - V‖ ≤
            ∑ entry : Entry,
              |(∑ i ∈ Finset.range n, derivativeEntry entry i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry 0 sample ∂P| :=
    vaart1998_theorem_5_41_derivativeAverage_norm_le_finiteEntryBound_of_action_bound
      (P := P) (V := V) (samples := samples)
      (derivativeAt := derivativeAt) (theta0 := theta0)
      (derivativeEntry := derivativeEntry) hDerivativeAverage_action_le
  exact
    vaart1998_theorem_5_41_zEstimator_scaledEstimator_handoff_of_empiricalAverage_finiteDerivativeStrongLawBound_scoreSummandRepresentation_commonVectorLawScoreCLT_scaledEstimatorLawTail_estimatorSubMeas_rawRoot_envelopeTendsto_summandMeasurable_envelope
      (P := P) (Q := Q) (V := V) (Vinv := Vinv)
      (samples := samples) (scale := scale)
      (estimatingMap := estimatingMap) (derivativeAt := derivativeAt)
      (scoreAtTheta0 := scoreAtTheta0)
      (estimatingAtEstimator := estimatingAtEstimator)
      (secondDerivative := secondDerivative)
      (sourceSet := sourceSet)
      (envelope := envelope) (envelopeMean := envelopeMean)
      (scoreSummand := scoreSummand) (derivativeEntry := derivativeEntry)
      (theta0 := theta0) (estimator := estimator)
      (delta := delta) (scaledEstimator := scaledEstimator) (Z := Z)
      hLeftInverse hScoreSummand_meas hZ_aemeas
      hScoreSummand_coordinate_memLp hZ_gaussian hZ_memLp hZ_mean
      hZ_covariance hScore_vector_law hScore_sequence_law
      hScoreMean_zero hSummand_eq hDerivativeEntry_integrable
      hDerivativeEntry_indep hDerivativeEntry_ident hDerivativeAverage_norm_le
      hEstimator_consistency hEnvelope_nonneg hEnvelopeAverage_tendsto
      hScaledEstimator_lawTail hEnvelopeBound
      hDerivativeAtTheta0_summand_meas hSecondDerivative_summand_meas
      hTheta0_meas hEstimator_meas hScale_meas hRawRoot hScore_scaled
      hEstimator_scaled hDelta_eq_sub hScaledEstimator_eq_sub hOpen
      hSegmentSubset hContDiffEstimatingMap hDerivativeAt_eq_fderiv
      hContDiffDerivativeAt hSecondDerivative_eq_fderiv

set_option maxHeartbeats 800000

/--
van der Vaart 1998, Theorem 5.41, finite-parameter matrix-entry derivative
action-bound handoff.

For finite-dimensional parameter spaces `Param -> ℝ`, the row-wise matrix-entry
representation of the empirical derivative residual gives the full vector
action bound consumed by the current finite-derivative endpoint.  This composes
the matrix-entry coordinate source lemma with the finite-product
coordinate-to-action norm bound.
-/
theorem vaart1998_theorem_5_41_derivativeAverage_action_le_finiteEntryBound_of_matrix_entry_representation
    {Param Ω Observation Coord : Type*} [Fintype Param] [Fintype Coord]
    [MeasurableSpace Ω] {P : Measure Ω}
    (V : (Param -> ℝ) →L[ℝ] (Coord -> ℝ))
    (samples : ∀ n : ℕ, Ω -> SampleAt Observation n)
    (derivativeAt :
      ℕ -> Ω -> Observation -> (Param -> ℝ) ->
        (Param -> ℝ) →L[ℝ] (Coord -> ℝ))
    (theta0 : ℕ -> Ω -> Param -> ℝ)
    (derivativeEntry : Coord -> Param -> ℕ -> Ω -> ℝ)
    (hCoordinate_action_eq :
      ∀ᵐ ω ∂P,
        ∀ᶠ n in atTop,
          ∀ x : Param -> ℝ, ∀ coordinate : Coord,
            ((empiricalAverageVector (samples n ω)
                (fun y => derivativeAt n ω y (theta0 n ω)) - V) x)
                  coordinate =
              ∑ param : Param,
                x param *
                  ((∑ i ∈ Finset.range n,
                        derivativeEntry coordinate param i ω) / (n : ℝ) -
                    ∫ sample, derivativeEntry coordinate param 0 sample ∂P)) :
    ∀ᵐ ω ∂P,
      ∀ᶠ n in atTop,
        ∀ x : Param -> ℝ, ‖x‖ ≠ 0 ->
          ‖(empiricalAverageVector (samples n ω)
              (fun y => derivativeAt n ω y (theta0 n ω)) - V) x‖ ≤
            (∑ entry : Coord × Param,
              |(∑ i ∈ Finset.range n,
                    derivativeEntry entry.1 entry.2 i ω) / (n : ℝ) -
                ∫ sample, derivativeEntry entry.1 entry.2 0 sample ∂P|) *
              ‖x‖ := by
  have hCoordinate_action_le :=
    vaart1998_theorem_5_41_derivativeAverage_coordinate_action_le_finiteEntryBound_of_matrix_entry_representation
      (Param := Param) (Ω := Ω) (Observation := Observation) (Coord := Coord)
      (P := P) (V := V) (samples := samples)
      (derivativeAt := derivativeAt) (theta0 := theta0)
      (derivativeEntry := derivativeEntry) hCoordinate_action_eq
  exact
    vaart1998_theorem_5_41_derivativeAverage_action_le_finiteEntryBound_of_coordinate_bound
      (Entry := Coord × Param) (Ω := Ω) (Observation := Observation)
      (Coord := Coord) (Θ := Param -> ℝ) (P := P) (V := V)
      (samples := samples)
      (derivativeAt := derivativeAt) (theta0 := theta0)
      (derivativeEntry := fun entry n ω =>
        derivativeEntry entry.1 entry.2 n ω)
      hCoordinate_action_le

end AsymptoticStatistics
end StatInference
