import StatInference.EmpiricalProcess.Theorem243
import StatInference.ProbabilityTheory.Martingale

/-!
# Durrett 2019 backwards martingale wrappers

This module packages Durrett Section 4.7 reverse-time martingales around the
shared `ℕᵒᵈ` submartingale convergence primitive developed for the VdV&W
empirical-process lane.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory

open scoped ENNReal MeasureTheory NNReal ProbabilityTheory Topology

/-! ## Durrett, Section 4.7 -/

/--
Durrett 2019, Section 4.7: a decreasing natural family of sigma-fields,
read as an increasing filtration on the dual natural order.
-/
abbrev durrett2019_backwardsFiltration
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (𝒢 : ℕ -> MeasurableSpace Ω) (h𝒢_mono : Antitone 𝒢)
    (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ) :
    Filtration ℕᵒᵈ mΩ where
  seq n := 𝒢 (OrderDual.ofDual n)
  mono' := by
    intro n m hnm
    exact h𝒢_mono (show OrderDual.ofDual m ≤ OrderDual.ofDual n from hnm)
  le' n := h𝒢_le (OrderDual.ofDual n)

/-- Display form of `durrett2019_backwardsFiltration`. -/
theorem durrett2019_backwardsFiltration_apply
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (𝒢 : ℕ -> MeasurableSpace Ω) (h𝒢_mono : Antitone 𝒢)
    (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ) (n : ℕᵒᵈ) :
    durrett2019_backwardsFiltration 𝒢 h𝒢_mono h𝒢_le n =
      𝒢 (OrderDual.ofDual n) :=
  rfl

/--
Durrett 2019, Section 4.7: the textbook backwards martingale data, indexed by
ordinary `n` as `X_{-n}`, is a mathlib martingale over the dual natural order.
-/
theorem durrett2019_backwards_martingale_of_condExp_nat
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} {𝒢 : ℕ -> MeasurableSpace Ω} {X : ℕ -> Ω -> ℝ}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hX_meas : ∀ n, StronglyMeasurable[𝒢 n] (X n))
    (hX_cond :
      ∀ {m n : ℕ}, m ≤ n -> P[X m | 𝒢 n] =ᵐ[P] X n) :
    Martingale
      (fun n : ℕᵒᵈ => X (OrderDual.ofDual n))
      (durrett2019_backwardsFiltration 𝒢 h𝒢_mono h𝒢_le) P := by
  refine ⟨?_, ?_⟩
  · intro n
    exact hX_meas (OrderDual.ofDual n)
  · intro n m hnm
    exact hX_cond (show OrderDual.ofDual m ≤ OrderDual.ofDual n from hnm)

/--
Durrett 2019, Theorem 4.7.1 source identity: a backwards martingale is the
conditional expectation of its terminal value at every reverse time.
-/
theorem durrett2019_theorem_4_7_1_backwards_martingale_ae_eq_condExp_terminal
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} (hX : Martingale X ℱ P) (n : ℕ) :
    X (OrderDual.toDual n) =ᵐ[P]
      P[X (OrderDual.toDual 0) | ℱ (OrderDual.toDual n)] := by
  exact
    (hX.condExp_ae_eq
      (show OrderDual.toDual n ≤ OrderDual.toDual 0 by
        change (0 : ℕ) ≤ n
        exact Nat.zero_le n)).symm

/--
Durrett 2019, Theorem 4.7.1 uniform-integrability input.  The backwards
martingale representation by conditional expectations of the terminal value
implies uniform integrability.
-/
theorem durrett2019_theorem_4_7_1_uniformIntegrable_of_backwards_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} (hX : Martingale X ℱ P) :
    UniformIntegrable X 1 P := by
  have hterminal_int : Integrable (X (OrderDual.toDual 0)) P :=
    hX.integrable (OrderDual.toDual 0)
  have hcond_ui :
      UniformIntegrable
        (fun n : ℕᵒᵈ => P[X (OrderDual.toDual 0) | ℱ n]) 1 P :=
    hterminal_int.uniformIntegrable_condExp (fun n => ℱ.le n)
  refine hcond_ui.ae_eq ?_
  intro n
  exact
    hX.condExp_ae_eq
      (show n ≤ OrderDual.toDual 0 by
        change (0 : ℕ) ≤ OrderDual.ofDual n
        exact Nat.zero_le (OrderDual.ofDual n))

/--
Durrett 2019, Theorem 4.7.1, a.s. reverse-time convergence for an
`L¹`-bounded `ℕᵒᵈ` submartingale.  This is the shared VdV&W order-dual
convergence theorem, exposed with Durrett naming.
-/
theorem durrett2019_theorem_4_7_1_ae_exists_limit_of_eLpNorm_one_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {R : ℝ≥0}
    (hX : Submartingale X ℱ P)
    (hbdd : ∀ n : ℕᵒᵈ, eLpNorm (X n) 1 P ≤ (R : ℝ≥0∞)) :
    ∀ᵐ ω ∂P, ∃ limit : ℝ,
      Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 limit) :=
  (StatInference.VdVWOrderDualSubmartingaleConvergenceHandoff.proved
    (Ω := Ω) (μ := P)) hX hbdd

/--
Durrett 2019, Theorem 4.7.1, a.s. existence of the backwards martingale limit.
-/
theorem durrett2019_theorem_4_7_1_ae_exists_limit_of_backwards_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} (hX : Martingale X ℱ P) :
    ∀ᵐ ω ∂P, ∃ limit : ℝ,
      Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 limit) := by
  have hUI :=
    durrett2019_theorem_4_7_1_uniformIntegrable_of_backwards_martingale
      (P := P) (ℱ := ℱ) (X := X) hX
  obtain ⟨R, hR⟩ := hUI.2.2
  exact
    durrett2019_theorem_4_7_1_ae_exists_limit_of_eLpNorm_one_bdd
      (P := P) (ℱ := ℱ) (X := X) (R := R) hX.submartingale hR

/--
Durrett 2019, Theorem 4.7.1, `L¹` convergence consumer.  Once the reverse-time
limit is identified as `Y`, uniform integrability upgrades a.s. convergence to
`L¹` convergence.
-/
theorem durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_uniformIntegrable
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P]
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hAe :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω)))
    (hUI : UniformIntegrable (fun n : ℕ => X (OrderDual.toDual n)) 1 P) :
    Tendsto
      (fun n : ℕ => eLpNorm (X (OrderDual.toDual n) - Y) 1 P)
      atTop (𝓝 0) := by
  have hprob :
      TendstoInMeasure P
        (fun n : ℕ => X (OrderDual.toDual n)) atTop Y :=
    tendstoInMeasure_of_tendsto_ae
      (μ := P) (f := fun n : ℕ => X (OrderDual.toDual n)) (g := Y)
      (fun n => hUI.aestronglyMeasurable n) hAe
  exact
    durrett2019_theorem_4_6_3_eLpNorm_one_tendsto_zero_of_tendstoInMeasure_uniformIntegrable
      (P := P) (X := fun n : ℕ => X (OrderDual.toDual n)) (Y := Y)
      hprob hUI

/--
Durrett 2019, Theorem 4.7.1, read a backwards martingale along ordinary
natural time.  The reverse-time process is uniformly integrable.
-/
theorem durrett2019_theorem_4_7_1_read_uniformIntegrable_of_backwards_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} (hX : Martingale X ℱ P) :
    UniformIntegrable (fun n : ℕ => X (OrderDual.toDual n)) 1 P := by
  have hterminal_int : Integrable (X (OrderDual.toDual 0)) P :=
    hX.integrable (OrderDual.toDual 0)
  have hcond_ui :
      UniformIntegrable
        (fun n : ℕ => P[X (OrderDual.toDual 0) | ℱ (OrderDual.toDual n)])
        1 P :=
    hterminal_int.uniformIntegrable_condExp (fun n => ℱ.le (OrderDual.toDual n))
  refine hcond_ui.ae_eq ?_
  intro n
  exact
    hX.condExp_ae_eq
      (show OrderDual.toDual n ≤ OrderDual.toDual 0 by
        change (0 : ℕ) ≤ n
        exact Nat.zero_le n)

/--
Durrett 2019, Theorem 4.7.1, integrability of an identified reverse-time
limit.  This is the integrability input needed for the tail conditional
expectation identification in Theorem 4.7.2.
-/
theorem durrett2019_theorem_4_7_1_integrable_limit_of_ae_tendsto_backwards_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hX : Martingale X ℱ P)
    (hAe :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω))) :
    Integrable Y P := by
  have hread_ui :
      UniformIntegrable (fun n : ℕ => X (OrderDual.toDual n)) 1 P :=
    durrett2019_theorem_4_7_1_read_uniformIntegrable_of_backwards_martingale
      (P := P) (ℱ := ℱ) (X := X) hX
  exact hread_ui.integrable_of_ae_tendsto hAe

/--
Durrett 2019, Theorem 4.7.1, `L¹` convergence for a backwards martingale once
the reverse-time a.s. limit has been identified.
-/
theorem durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_backwards_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hX : Martingale X ℱ P)
    (hAe :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω))) :
    Tendsto
      (fun n : ℕ => eLpNorm (X (OrderDual.toDual n) - Y) 1 P)
      atTop (𝓝 0) := by
  have hread_ui :
      UniformIntegrable (fun n : ℕ => X (OrderDual.toDual n)) 1 P := by
    exact
      durrett2019_theorem_4_7_1_read_uniformIntegrable_of_backwards_martingale
        (P := P) (ℱ := ℱ) (X := X) hX
  exact
    durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_uniformIntegrable
      (P := P) (X := X) (Y := Y) hAe hread_ui

/--
Durrett 2019, Theorem 4.7.2, conditional-expectation identification of a
reverse-time `L¹` limit.  If the limit is measurable with respect to the tail
sigma-field, then the martingale set-integral identities identify it as
`E[X_0 | F_{-\infty}]`.
-/
theorem durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_L1_tendsto
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hX : Martingale X ℱ P)
    (hY_int : Integrable Y P)
    (hY_tail :
      AEStronglyMeasurable[⨅ n : ℕ, ℱ (OrderDual.toDual n)] Y P)
    (hL1 :
      Tendsto
        (fun n : ℕ => eLpNorm (X (OrderDual.toDual n) - Y) 1 P)
        atTop (𝓝 0)) :
    Y =ᵐ[P] P[X (OrderDual.toDual 0) |
      ⨅ n : ℕ, ℱ (OrderDual.toDual n)] := by
  let ℱtail : MeasurableSpace Ω := ⨅ n : ℕ, ℱ (OrderDual.toDual n)
  have htail_le : ℱtail ≤ mΩ := by
    exact
      (iInf_le (fun n : ℕ => ℱ (OrderDual.toDual n)) 0).trans
        (ℱ.le (OrderDual.toDual 0))
  haveI : SigmaFinite (P.trim htail_le) := inferInstance
  refine
    ae_eq_condExp_of_forall_setIntegral_eq
      (μ := P) (m := ℱtail) (m₀ := mΩ)
      (f := X (OrderDual.toDual 0)) (g := Y)
      htail_le (hX.integrable (OrderDual.toDual 0)) ?_ ?_ ?_
  · intro _s _hs _hμs
    exact hY_int.integrableOn
  · intro s hs _hμs
    have hs_each :
        ∀ n : ℕ, MeasurableSet[ℱ (OrderDual.toDual n)] s := by
      simpa [ℱtail] using (MeasurableSpace.measurableSet_iInf.mp hs)
    have htend :
        Tendsto
          (fun n : ℕ => ∫ ω in s, X (OrderDual.toDual n) ω ∂P)
          atTop (𝓝 (∫ ω in s, Y ω ∂P)) :=
      durrett2019_lemma_4_6_5_tendsto_setIntegral_of_eLpNorm_one_tendsto_zero
        (mΩ := mΩ) (P := P)
        (X := fun n : ℕ => X (OrderDual.toDual n)) (Y := Y)
        (fun n => hX.integrable (OrderDual.toDual n)) hY_int hL1 s
    have hsame :
        ∀ n : ℕ,
          ∫ ω in s, X (OrderDual.toDual n) ω ∂P =
            ∫ ω in s, X (OrderDual.toDual 0) ω ∂P := by
      intro n
      exact
        hX.setIntegral_eq
          (show OrderDual.toDual n ≤ OrderDual.toDual 0 by
            change (0 : ℕ) ≤ n
            exact Nat.zero_le n)
          (hs_each n)
    have hconst :
        Tendsto
          (fun n : ℕ => ∫ ω in s, X (OrderDual.toDual n) ω ∂P)
          atTop (𝓝 (∫ ω in s, X (OrderDual.toDual 0) ω ∂P)) := by
      have hevent :
          ∀ᶠ n in atTop,
            ∫ ω in s, X (OrderDual.toDual 0) ω ∂P =
              ∫ ω in s, X (OrderDual.toDual n) ω ∂P :=
        Eventually.of_forall fun n => (hsame n).symm
      exact tendsto_const_nhds.congr' hevent
    exact tendsto_nhds_unique htend hconst
  · simpa [ℱtail] using hY_tail

/--
Durrett 2019, Theorem 4.7.2, source-shaped conditional-expectation
identification.  Once a backwards martingale has an a.s. reverse-time limit
which is tail measurable, the limit is the conditional expectation of the
terminal value with respect to the tail sigma-field.
-/
theorem durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hX : Martingale X ℱ P)
    (hY_tail :
      AEStronglyMeasurable[⨅ n : ℕ, ℱ (OrderDual.toDual n)] Y P)
    (hAe :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω))) :
    Y =ᵐ[P] P[X (OrderDual.toDual 0) |
      ⨅ n : ℕ, ℱ (OrderDual.toDual n)] := by
  have hY_int :
      Integrable Y P :=
    durrett2019_theorem_4_7_1_integrable_limit_of_ae_tendsto_backwards_martingale
      (P := P) (ℱ := ℱ) (X := X) (Y := Y) hX hAe
  have hL1 :
      Tendsto
        (fun n : ℕ => eLpNorm (X (OrderDual.toDual n) - Y) 1 P)
        atTop (𝓝 0) :=
    durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_backwards_martingale
      (P := P) (ℱ := ℱ) (X := X) (Y := Y) hX hAe
  exact
    durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_L1_tendsto
      (P := P) (ℱ := ℱ) (X := X) (Y := Y) hX hY_int hY_tail hL1

end ProbabilityTheory
end StatInference
