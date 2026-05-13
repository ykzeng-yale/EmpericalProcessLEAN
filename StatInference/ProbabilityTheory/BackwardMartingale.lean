import StatInference.EmpiricalProcess.Theorem243
import StatInference.ProbabilityMeasure.StrongLaw
import StatInference.ProbabilityTheory.Martingale

/-!
# Durrett 2019 backwards martingale wrappers

This module packages Durrett Section 4.7 reverse-time martingales around the
shared `ℕᵒᵈ` submartingale convergence primitive developed for the VdV&W
empirical-process lane.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory _root_.ProbabilityTheory

open scoped BigOperators ENNReal Function NNReal ProbabilityTheory Topology

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
Durrett 2019, Theorem 4.7.2, tail measurability of the identified backwards
martingale limit.

The proof uses the canonical real-valued modification
`limsup_n X_{-n}`.  For every fixed reverse time `m`, shifting the tail by
`m` makes the same limsup measurable with respect to `F_{-m}`; measurability
with respect to every `F_{-m}` gives measurability with respect to their
intersection.
-/
theorem durrett2019_theorem_4_7_2_limit_aestronglyMeasurable_tail_of_ae_tendsto
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hX : Martingale X ℱ P)
    (hAe :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω))) :
    AEStronglyMeasurable[⨅ n : ℕ, ℱ (OrderDual.toDual n)] Y P := by
  let Z : Ω -> ℝ := fun ω =>
    limsup (fun n : ℕ => X (OrderDual.toDual n) ω) atTop
  have hZ_meas_each :
      ∀ m : ℕ, Measurable[ℱ (OrderDual.toDual m)] Z := by
    intro m
    have hshift_meas :
        Measurable[ℱ (OrderDual.toDual m)] fun ω =>
          limsup (fun n : ℕ => X (OrderDual.toDual (n + m)) ω) atTop := by
      refine
        Measurable.limsup
          (mδ := ℱ (OrderDual.toDual m))
          (f := fun n : ℕ => fun ω => X (OrderDual.toDual (n + m)) ω)
          ?_
      intro n
      exact
        ((hX.stronglyMeasurable (OrderDual.toDual (n + m))).mono
          (ℱ.mono
            (show OrderDual.toDual (n + m) ≤ OrderDual.toDual m by
              change m ≤ n + m
              exact Nat.le_add_left m n))).measurable
    have hshift_eq :
        (fun ω =>
          limsup
            (fun n : ℕ => X (OrderDual.toDual n + OrderDual.toDual m) ω)
            atTop) = Z := by
      funext ω
      have hseq :
          (fun n : ℕ => X (OrderDual.toDual n + OrderDual.toDual m) ω) =
            fun n : ℕ => X (OrderDual.toDual (n + m)) ω := by
        funext n
        rw [show OrderDual.toDual n + OrderDual.toDual m =
          OrderDual.toDual (n + m) from rfl]
      rw [hseq]
      exact Filter.limsup_nat_add (fun n : ℕ => X (OrderDual.toDual n) ω) m
    simpa [hshift_eq] using hshift_meas
  have hZ_meas_tail :
      Measurable[⨅ n : ℕ, ℱ (OrderDual.toDual n)] Z := by
    intro s hs
    exact
      MeasurableSpace.measurableSet_iInf.mpr
        (fun n => hZ_meas_each n hs)
  have hZ_eq_Y : Z =ᵐ[P] Y := by
    filter_upwards [hAe] with ω hω
    exact hω.limsup_eq
  exact hZ_meas_tail.stronglyMeasurable.aestronglyMeasurable.congr hZ_eq_Y

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

/--
Durrett 2019, Theorem 4.7.2.  A backwards martingale limit is the conditional
expectation of the terminal value with respect to the reverse tail
sigma-field.
-/
theorem durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto_backwards_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    {X : ℕᵒᵈ -> Ω -> ℝ} {Y : Ω -> ℝ}
    (hX : Martingale X ℱ P)
    (hAe :
      ∀ᵐ ω ∂P,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω))) :
    Y =ᵐ[P] P[X (OrderDual.toDual 0) |
      ⨅ n : ℕ, ℱ (OrderDual.toDual n)] := by
  have hY_tail :
      AEStronglyMeasurable[⨅ n : ℕ, ℱ (OrderDual.toDual n)] Y P :=
    durrett2019_theorem_4_7_2_limit_aestronglyMeasurable_tail_of_ae_tendsto
      (P := P) (ℱ := ℱ) (X := X) (Y := Y) hX hAe
  exact
    durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto
      (P := P) (ℱ := ℱ) (X := X) (Y := Y) hX hY_tail hAe

/--
Durrett 2019, Theorem 4.7.3, backwards Lévy setup.  Conditional
expectations along a reverse-time filtration form a backwards martingale.
-/
theorem durrett2019_theorem_4_7_3_backwards_condExp_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    (f : Ω -> ℝ) :
    Martingale (fun n : ℕᵒᵈ => P[f | ℱ n]) ℱ P := by
  exact martingale_condExp f ℱ P

/--
Durrett 2019, Theorem 4.7.3, backwards Lévy theorem in a.s. form.

Conditional expectations along a decreasing filtration converge a.s. to the
conditional expectation on the reverse tail sigma-field.
-/
theorem durrett2019_theorem_4_7_3_condExp_ae_tendsto_tail_condExp
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    (f : Ω -> ℝ) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => P[f | ℱ (OrderDual.toDual n)] ω)
        atTop
        (𝓝 (P[f | ⨅ n : ℕ, ℱ (OrderDual.toDual n)] ω)) := by
  let X : ℕᵒᵈ -> Ω -> ℝ := fun n => P[f | ℱ n]
  have hX : Martingale X ℱ P :=
    durrett2019_theorem_4_7_3_backwards_condExp_martingale
      (P := P) (ℱ := ℱ) f
  have hExists :
      ∀ᵐ ω ∂P, ∃ limit : ℝ,
        Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 limit) :=
    durrett2019_theorem_4_7_1_ae_exists_limit_of_backwards_martingale
      (P := P) (ℱ := ℱ) (X := X) hX
  obtain ⟨Y, _hY_meas, hY_tendsto⟩ :
      ∃ Y : Ω -> ℝ, Measurable Y ∧
        ∀ᵐ ω ∂P,
          Tendsto (fun n : ℕ => X (OrderDual.toDual n) ω) atTop (𝓝 (Y ω)) :=
    measurable_limit_of_tendsto_metrizable_ae
      (μ := P) (f := fun n : ℕ => fun ω => X (OrderDual.toDual n) ω)
      (L := atTop)
      (fun n => StronglyMeasurable.aemeasurable (μ := P)
        ((stronglyMeasurable_condExp (μ := P)
          (m := ℱ (OrderDual.toDual n)) (f := f)).mono
            (ℱ.le (OrderDual.toDual n))))
      hExists
  have hY_eq_terminal_tail :
      Y =ᵐ[P] P[X (OrderDual.toDual 0) |
        ⨅ n : ℕ, ℱ (OrderDual.toDual n)] := by
    simpa [X] using
      (durrett2019_theorem_4_7_2_ae_eq_condExp_tail_of_ae_tendsto_backwards_martingale
        (P := P) (ℱ := ℱ) (X := X) (Y := Y) hX hY_tendsto)
  have htail_le_zero :
      (⨅ n : ℕ, ℱ (OrderDual.toDual n)) ≤ ℱ (OrderDual.toDual 0) := by
    exact iInf_le (fun n : ℕ => ℱ (OrderDual.toDual n)) 0
  have hterminal_tail :
      P[X (OrderDual.toDual 0) |
          ⨅ n : ℕ, ℱ (OrderDual.toDual n)] =ᵐ[P]
        P[f | ⨅ n : ℕ, ℱ (OrderDual.toDual n)] := by
    simpa [X] using
      (condExp_condExp_of_le (μ := P) (f := f)
        htail_le_zero (ℱ.le (OrderDual.toDual 0)))
  have hY_eq_tail :
      Y =ᵐ[P] P[f | ⨅ n : ℕ, ℱ (OrderDual.toDual n)] :=
    hY_eq_terminal_tail.trans hterminal_tail
  filter_upwards [hY_tendsto, hY_eq_tail] with ω hlim hYω
  simpa [X, hYω] using hlim

/--
Durrett 2019, Theorem 4.7.3, backwards Lévy theorem in `L¹` form.
-/
theorem durrett2019_theorem_4_7_3_condExp_eLpNorm_one_tendsto_tail_condExp
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {ℱ : Filtration ℕᵒᵈ mΩ}
    (f : Ω -> ℝ) :
    Tendsto
      (fun n : ℕ =>
        eLpNorm
          (P[f | ℱ (OrderDual.toDual n)] -
            P[f | ⨅ n : ℕ, ℱ (OrderDual.toDual n)])
          1 P)
      atTop (𝓝 0) := by
  let X : ℕᵒᵈ -> Ω -> ℝ := fun n => P[f | ℱ n]
  have hX : Martingale X ℱ P :=
    durrett2019_theorem_4_7_3_backwards_condExp_martingale
      (P := P) (ℱ := ℱ) f
  have hAe :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ => X (OrderDual.toDual n) ω)
          atTop
          (𝓝 (P[f | ⨅ n : ℕ, ℱ (OrderDual.toDual n)] ω)) := by
    simpa [X] using
      (durrett2019_theorem_4_7_3_condExp_ae_tendsto_tail_condExp
        (P := P) (ℱ := ℱ) f)
  simpa [X] using
    (durrett2019_theorem_4_7_1_eLpNorm_one_tendsto_of_ae_tendsto_backwards_martingale
      (P := P) (ℱ := ℱ) (X := X)
      (Y := fun ω => P[f | ⨅ n : ℕ, ℱ (OrderDual.toDual n)] ω) hX hAe)

/--
Durrett 2019, Theorem 4.7.3, textbook decreasing-filtration display form.
-/
theorem durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_tail_condExp
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (f : Ω -> ℝ) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => P[f | 𝒢 n] ω)
        atTop
        (𝓝 (P[f | ⨅ n : ℕ, 𝒢 n] ω)) := by
  simpa [durrett2019_backwardsFiltration] using
    (durrett2019_theorem_4_7_3_condExp_ae_tendsto_tail_condExp
      (P := P) (ℱ := durrett2019_backwardsFiltration 𝒢 h𝒢_mono h𝒢_le) f)

/--
Durrett 2019, Theorem 4.7.3, textbook decreasing-filtration `L¹` display form.
-/
theorem durrett2019_theorem_4_7_3_condExp_nat_eLpNorm_one_tendsto_tail_condExp
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (f : Ω -> ℝ) :
    Tendsto
      (fun n : ℕ =>
        eLpNorm
          (P[f | 𝒢 n] - P[f | ⨅ n : ℕ, 𝒢 n])
          1 P)
      atTop (𝓝 0) := by
  simpa [durrett2019_backwardsFiltration] using
    (durrett2019_theorem_4_7_3_condExp_eLpNorm_one_tendsto_tail_condExp
      (P := P) (ℱ := durrett2019_backwardsFiltration 𝒢 h𝒢_mono h𝒢_le) f)

/--
Durrett 2019, Theorem 4.7.3 consumer.  If the reverse tail conditional
expectation is a.e. constant, the backwards Lévy limit is that constant.
-/
theorem durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_const_of_tail_condExp_ae_eq_const
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (f : Ω -> ℝ) (c : ℝ)
    (hTail : P[f | ⨅ n : ℕ, 𝒢 n] =ᵐ[P] fun _ => c) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => P[f | 𝒢 n] ω)
        atTop
        (𝓝 c) := by
  filter_upwards
    [durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_tail_condExp
      (P := P) (𝒢 := 𝒢) h𝒢_mono h𝒢_le f, hTail] with ω hlim htail
  simpa [htail] using hlim

/--
Durrett 2019, Example 4.7.4 tail-triviality bridge.  If a random variable is
measurable with respect to a sigma-field independent of the reverse tail, then
its reverse-tail conditional expectation is its ordinary expectation.
-/
theorem durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_independent
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {mX : MeasurableSpace Ω}
    {𝒢 : ℕ -> MeasurableSpace Ω} {f : Ω -> ℝ}
    (hmX : mX ≤ mΩ) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hf_meas : StronglyMeasurable[mX] f)
    (hindep : Indep mX (⨅ n : ℕ, 𝒢 n) P) :
    P[f | ⨅ n : ℕ, 𝒢 n] =ᵐ[P] fun _ => ∫ ω, f ω ∂P := by
  have htail_le : (⨅ n : ℕ, 𝒢 n) ≤ mΩ :=
    (iInf_le (fun n : ℕ => 𝒢 n) 0).trans (h𝒢_le 0)
  exact _root_.MeasureTheory.condExp_indep_eq
    (μ := P) (m₁ := mX) (m₂ := ⨅ n : ℕ, 𝒢 n) (m := mΩ)
    (f := f) hmX htail_le hf_meas hindep

/--
Durrett 2019, Example 4.7.4 tail-triviality bridge.  If every event in the
reverse tail sigma-field has probability zero or one, then conditioning any
integrable real random variable on that reverse tail gives its expectation.
-/
theorem durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_tail_zero_or_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {𝒢 : ℕ -> MeasurableSpace Ω} {f : Ω -> ℝ}
    (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hf_int : Integrable f P)
    (hzeroOne :
      ∀ A : Set Ω, MeasurableSet[⨅ n : ℕ, 𝒢 n] A -> P A = 0 ∨ P A = 1) :
    P[f | ⨅ n : ℕ, 𝒢 n] =ᵐ[P] fun _ => ∫ ω, f ω ∂P := by
  let 𝒯 : MeasurableSpace Ω := ⨅ n : ℕ, 𝒢 n
  have htail_le : 𝒯 ≤ mΩ :=
    (iInf_le (fun n : ℕ => 𝒢 n) 0).trans (h𝒢_le 0)
  have hconst :
      (fun _ : Ω => ∫ ω, f ω ∂P) =ᵐ[P] P[f | 𝒯] := by
    refine
      ae_eq_condExp_of_forall_setIntegral_eq
        (μ := P) (m := 𝒯) (m₀ := mΩ)
        (f := f) (g := fun _ : Ω => ∫ ω, f ω ∂P)
        htail_le hf_int ?_ ?_ ?_
    · intro _A _hA hμA
      exact integrableOn_const hμA.ne
    · intro A hA _hμA
      have hA_ambient : @MeasurableSet Ω mΩ A := htail_le A hA
      rcases hzeroOne A hA with hA_zero | hA_one
      · rw [setIntegral_measure_zero (fun _ : Ω => ∫ ω, f ω ∂P) hA_zero,
          setIntegral_measure_zero f hA_zero]
      · have hA_ae : ∀ᵐ ω ∂P, ω ∈ A :=
          (mem_ae_iff_prob_eq_one (μ := P) hA_ambient).2 hA_one
        have hcompl_zero :
            ∀ᵐ ω ∂P, ω ∉ A -> f ω = 0 := by
          filter_upwards [hA_ae] with ω hω hω_not
          exact False.elim (hω_not hω)
        rw [setIntegral_const, measureReal_def, hA_one, ENNReal.toReal_one,
          one_smul, setIntegral_eq_integral_of_ae_compl_eq_zero hcompl_zero]
    · exact stronglyMeasurable_const.aestronglyMeasurable
  exact hconst.symm

/--
Durrett 2019, Example 4.7.4 zero-one support.  If the reverse filtration is
the tail-block filtration generated by an independent sequence of
sigma-fields, then every event in the reverse tail sigma-field has probability
zero or one.
-/
theorem durrett2019_example_4_7_4_tail_zero_or_one_of_iIndep_tailBlocks
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} {s 𝒢 : ℕ -> MeasurableSpace Ω}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s P)
    (h𝒢_tail :
      ∀ n, 𝒢 n = ⨆ i : ℕ, ⨆ _ : i ≥ n, s i) :
    ∀ A : Set Ω, MeasurableSet[⨅ n : ℕ, 𝒢 n] A ->
      P A = 0 ∨ P A = 1 := by
  intro A hA
  refine
    durrett2019_theorem_4_3_8_tail_event_measure_zero_or_one
      (ν := P) (s := s) (A := A) hs_le hs_indep ?_
  refine
    durrett2019_theorem_4_3_8_tail_event_measurable_of_forall_tailBlock_measurable
      (s := s) (A := A) ?_
  intro n
  have hA_each : MeasurableSet[𝒢 n] A :=
    (MeasurableSpace.measurableSet_iInf.mp hA) n
  rw [h𝒢_tail n] at hA_each
  exact hA_each

/--
Durrett 2019, Example 4.7.4 tail-triviality bridge with the zero-one side
discharged by Kolmogorov's zero-one law for independent tail blocks.
-/
theorem durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_iIndep_tailBlocks
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} {s 𝒢 : ℕ -> MeasurableSpace Ω} {f : Ω -> ℝ}
    (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s P)
    (h𝒢_tail :
      ∀ n, 𝒢 n = ⨆ i : ℕ, ⨆ _ : i ≥ n, s i)
    (hf_int : Integrable f P) :
    P[f | ⨅ n : ℕ, 𝒢 n] =ᵐ[P] fun _ => ∫ ω, f ω ∂P := by
  haveI : IsProbabilityMeasure P := hs_indep.isProbabilityMeasure
  exact
    durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_tail_zero_or_one
      (P := P) (𝒢 := 𝒢) (f := f) h𝒢_le hf_int
      (durrett2019_example_4_7_4_tail_zero_or_one_of_iIndep_tailBlocks
        (P := P) (s := s) (𝒢 := 𝒢) hs_le hs_indep h𝒢_tail)

/--
Durrett 2019, Example 4.7.4 route bridge.  A process that is a.e. equal to
reverse-time conditional expectations converges once the reverse tail
conditional expectation is a.e. constant.
-/
theorem durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_const
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (A : ℕ -> Ω -> ℝ) (f : Ω -> ℝ) (c : ℝ)
    (hA :
      ∀ n, A n =ᵐ[P] P[f | 𝒢 n])
    (hTail : P[f | ⨅ n : ℕ, 𝒢 n] =ᵐ[P] fun _ => c) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => A n ω)
        atTop
        (𝓝 c) := by
  have hCond :
      ∀ᵐ ω ∂P,
        Tendsto
          (fun n : ℕ => P[f | 𝒢 n] ω)
          atTop
          (𝓝 c) :=
    durrett2019_theorem_4_7_3_condExp_nat_ae_tendsto_const_of_tail_condExp_ae_eq_const
      (P := P) (𝒢 := 𝒢) h𝒢_mono h𝒢_le f c hTail
  have hA_all :
      ∀ᵐ ω ∂P, ∀ n : ℕ, A n ω = P[f | 𝒢 n] ω :=
    ae_all_iff.2 hA
  filter_upwards [hCond, hA_all] with ω hlim hAω
  exact Tendsto.congr'
    (Eventually.of_forall (fun n : ℕ => (hAω n).symm)) hlim

/--
Durrett 2019, Example 4.7.4 route bridge with the tail-constant side
discharged from a zero-one law for the reverse tail sigma-field.
-/
theorem durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_zero_or_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (A : ℕ -> Ω -> ℝ) (f : Ω -> ℝ)
    (hf_int : Integrable f P)
    (hA : ∀ n, A n =ᵐ[P] P[f | 𝒢 n])
    (hzeroOne :
      ∀ B : Set Ω, MeasurableSet[⨅ n : ℕ, 𝒢 n] B -> P B = 0 ∨ P B = 1) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => A n ω)
        atTop
        (𝓝 (∫ ω, f ω ∂P)) := by
  exact
    durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_const
      (Ω := Ω) (mΩ := mΩ) (P := P) (𝒢 := 𝒢)
      h𝒢_mono h𝒢_le A f (∫ ω, f ω ∂P) hA
      (durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_tail_zero_or_one
        (Ω := Ω) (mΩ := mΩ) (P := P) (𝒢 := 𝒢) (f := f)
        h𝒢_le hf_int hzeroOne)

/--
Durrett 2019, Example 4.7.4 route bridge with the tail-constant side
discharged from independent tail-block sigma-fields.
-/
theorem durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_iIndep_tailBlocks
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} {s 𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s P)
    (h𝒢_tail :
      ∀ n, 𝒢 n = ⨆ i : ℕ, ⨆ _ : i ≥ n, s i)
    (A : ℕ -> Ω -> ℝ) (f : Ω -> ℝ)
    (hf_int : Integrable f P)
    (hA : ∀ n, A n =ᵐ[P] P[f | 𝒢 n]) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => A n ω)
        atTop
        (𝓝 (∫ ω, f ω ∂P)) := by
  haveI : IsProbabilityMeasure P := hs_indep.isProbabilityMeasure
  exact
    durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_zero_or_one
      (Ω := Ω) (mΩ := mΩ) (P := P) (𝒢 := 𝒢)
      h𝒢_mono h𝒢_le A f hf_int hA
      (durrett2019_example_4_7_4_tail_zero_or_one_of_iIndep_tailBlocks
        (P := P) (s := s) (𝒢 := 𝒢) hs_le hs_indep h𝒢_tail)

/--
Durrett 2019, Example 4.7.4 route bridge with the tail-constant side
discharged from independence of the source sigma-field and the reverse tail.
-/
theorem durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_independent
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P] {mX : MeasurableSpace Ω}
    {𝒢 : ℕ -> MeasurableSpace Ω}
    (h𝒢_mono : Antitone 𝒢) (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (A : ℕ -> Ω -> ℝ) (f : Ω -> ℝ)
    (hmX : mX ≤ mΩ)
    (hf_meas : StronglyMeasurable[mX] f)
    (hA : ∀ n, A n =ᵐ[P] P[f | 𝒢 n])
    (hindep : Indep mX (⨅ n : ℕ, 𝒢 n) P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => A n ω)
        atTop
        (𝓝 (∫ ω, f ω ∂P)) := by
  exact
    durrett2019_example_4_7_4_ae_tendsto_of_ae_eq_condExp_nat_and_tail_const
      (Ω := Ω) (mΩ := mΩ) (P := P) (𝒢 := 𝒢)
      h𝒢_mono h𝒢_le A f (∫ ω, f ω ∂P) hA
      (durrett2019_example_4_7_4_tail_condExp_ae_eq_integral_of_independent
        (Ω := Ω) (mΩ := mΩ) (P := P) (mX := mX) (𝒢 := 𝒢) (f := f)
        hmX h𝒢_le hf_meas hindep)

/-- Durrett 2019, Example 4.7.4 prefix sum `S_n`. -/
@[reducible]
def durrett2019_example_4_7_4_prefixSum
    {Ω : Type*} (ξ : ℕ -> Ω -> ℝ) (n : ℕ) : Ω -> ℝ :=
  fun ω => ∑ i ∈ Finset.range n, ξ i ω

/--
Durrett 2019, Example 4.7.4 reverse-average sigma-field
`sigma(S_n, xi_n, xi_{n+1}, ...)` in zero-based Lean indexing.

This is the concrete sigma-field used to feed the prefix-average conditional
expectation bridge below.  It is written as a supremum of comaps so that the
measurability obligations are direct.
-/
@[reducible]
def durrett2019_example_4_7_4_reverseAverageSigma
    {Ω : Type*} (ξ : ℕ -> Ω -> ℝ) (n : ℕ) : MeasurableSpace Ω :=
  MeasurableSpace.comap
      (durrett2019_example_4_7_4_prefixSum ξ n)
      (inferInstance : MeasurableSpace ℝ) ⊔
    ⨆ i : ℕ, ⨆ _ : i ≥ n,
      MeasurableSpace.comap (ξ i) (inferInstance : MeasurableSpace ℝ)

/-- The prefix sum is measurable in Durrett's reverse-average sigma-field. -/
theorem durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma
    {Ω : Type*} {ξ : ℕ -> Ω -> ℝ} (n : ℕ) :
    Measurable[durrett2019_example_4_7_4_reverseAverageSigma ξ n]
      (durrett2019_example_4_7_4_prefixSum ξ n) :=
  Measurable.of_comap_le le_sup_left

/-- The prefix sum is strongly measurable in Durrett's reverse-average sigma-field. -/
theorem durrett2019_example_4_7_4_prefixSum_stronglyMeasurable_reverseAverageSigma
    {Ω : Type*} {ξ : ℕ -> Ω -> ℝ} (n : ℕ) :
    StronglyMeasurable[durrett2019_example_4_7_4_reverseAverageSigma ξ n]
      (durrett2019_example_4_7_4_prefixSum ξ n) :=
  (durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma
    (ξ := ξ) n).stronglyMeasurable

/-- Tail coordinates are measurable in Durrett's reverse-average sigma-field. -/
theorem durrett2019_example_4_7_4_tailCoordinate_measurable_reverseAverageSigma
    {Ω : Type*} {ξ : ℕ -> Ω -> ℝ} {n i : ℕ} (hi : i ≥ n) :
    Measurable[durrett2019_example_4_7_4_reverseAverageSigma ξ n] (ξ i) := by
  refine Measurable.of_comap_le ?_
  have htail :
      MeasurableSpace.comap (ξ i) (inferInstance : MeasurableSpace ℝ) ≤
        (⨆ j : ℕ, ⨆ _ : j ≥ n,
          MeasurableSpace.comap (ξ j) (inferInstance : MeasurableSpace ℝ)) :=
    le_iSup_of_le i (le_iSup_of_le hi le_rfl)
  exact htail.trans le_sup_right

/--
Durrett's reverse-average sigma-field is a sub-sigma-field of the ambient
space whenever the coordinates are ambient-measurable.
-/
theorem durrett2019_example_4_7_4_reverseAverageSigma_le
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ξ : ℕ -> Ω -> ℝ} {n : ℕ}
    (hξ_meas : ∀ i, Measurable (ξ i)) :
    durrett2019_example_4_7_4_reverseAverageSigma ξ n ≤ mΩ := by
  refine sup_le ?_ ?_
  · have hsum_meas :
        Measurable (durrett2019_example_4_7_4_prefixSum ξ n) := by
      dsimp [durrett2019_example_4_7_4_prefixSum]
      exact Finset.measurable_fun_sum (Finset.range n) fun i _hi => hξ_meas i
    exact hsum_meas.comap_le
  · exact iSup_le fun i => iSup_le fun _hi => (hξ_meas i).comap_le

/--
Later prefix sums are measurable with respect to earlier reverse-average
sigma-fields.  Algebraically, `S_m = S_n + sum_{n <= i < m} xi_i`.
-/
theorem durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma_of_le
    {Ω : Type*} {ξ : ℕ -> Ω -> ℝ} {n m : ℕ} (hnm : n ≤ m) :
    Measurable[durrett2019_example_4_7_4_reverseAverageSigma ξ n]
      (durrett2019_example_4_7_4_prefixSum ξ m) := by
  have hprefix :
      Measurable[durrett2019_example_4_7_4_reverseAverageSigma ξ n]
        (durrett2019_example_4_7_4_prefixSum ξ n) :=
    durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma
      (ξ := ξ) n
  have htail :
      Measurable[durrett2019_example_4_7_4_reverseAverageSigma ξ n]
        (fun ω => ∑ i ∈ Finset.Ico n m, ξ i ω) := by
    exact Finset.measurable_fun_sum (Finset.Ico n m) fun i hi =>
      durrett2019_example_4_7_4_tailCoordinate_measurable_reverseAverageSigma
        (ξ := ξ) (n := n) (i := i) (Finset.mem_Ico.mp hi).1
  have hsum := hprefix.add htail
  have hsum_eq :
      (fun ω =>
        durrett2019_example_4_7_4_prefixSum ξ n ω +
          ∑ i ∈ Finset.Ico n m, ξ i ω) =
        durrett2019_example_4_7_4_prefixSum ξ m := by
    ext ω
    exact Finset.sum_range_add_sum_Ico (fun i => ξ i ω) hnm
  rwa [hsum_eq] at hsum

/--
Durrett's concrete reverse-average sigma-fields decrease with `n`.
-/
theorem durrett2019_example_4_7_4_reverseAverageSigma_antitone
    {Ω : Type*} (ξ : ℕ -> Ω -> ℝ) :
    Antitone (fun n : ℕ =>
      durrett2019_example_4_7_4_reverseAverageSigma ξ n) := by
  intro n m hnm
  change
    durrett2019_example_4_7_4_reverseAverageSigma ξ m ≤
      durrett2019_example_4_7_4_reverseAverageSigma ξ n
  dsimp [durrett2019_example_4_7_4_reverseAverageSigma]
  refine sup_le ?_ ?_
  · exact
      (durrett2019_example_4_7_4_prefixSum_measurable_reverseAverageSigma_of_le
        (ξ := ξ) hnm).comap_le
  · refine iSup_le fun i => iSup_le fun hi => ?_
    exact
      (durrett2019_example_4_7_4_tailCoordinate_measurable_reverseAverageSigma
        (ξ := ξ) (n := n) (i := i) (hnm.trans hi)).comap_le

/--
Durrett 2019, Example 4.7.4 conditional-expectation algebra core.  If the
prefix sum is measurable with respect to the reverse sigma-field and the
conditional expectations of all prefix coordinates are the same as that of the
first coordinate, then the conditional expectation of the first coordinate is
the empirical average of the prefix.

The remaining textbook-specific work is to prove the symmetry hypothesis
`hsym` from the concrete sigma-field
`sigma(S_n, xi_{n+1}, xi_{n+2}, ...)`.
-/
theorem durrett2019_example_4_7_4_condExp_first_eq_invNat_prefixAverage
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P]
    {𝒢 : ℕ -> MeasurableSpace Ω} {ξ : ℕ -> Ω -> ℝ} {n : ℕ}
    (hn : 0 < n)
    (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hξ_int : ∀ i ∈ Finset.range n, Integrable (ξ i) P)
    (hsum_meas :
      StronglyMeasurable[𝒢 n] (∑ i ∈ Finset.range n, ξ i))
    (hsym :
      ∀ i ∈ Finset.range n, P[ξ i | 𝒢 n] =ᵐ[P] P[ξ 0 | 𝒢 n]) :
    P[ξ 0 | 𝒢 n] =ᵐ[P]
      fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, ξ i ω := by
  classical
  have hn_ne : (n : ℝ) ≠ 0 := by exact_mod_cast hn.ne'
  have hsum_int :
      Integrable (∑ i ∈ Finset.range n, ξ i) P :=
    integrable_finsetSum' (μ := P) (Finset.range n) hξ_int
  have hcond_sum :
      P[∑ i ∈ Finset.range n, ξ i | 𝒢 n] =ᵐ[P]
        ∑ i ∈ Finset.range n, P[ξ i | 𝒢 n] :=
    condExp_finsetSum (μ := P) (s := Finset.range n)
      (f := ξ) hξ_int (𝒢 n)
  have hcond_sum_meas :
      P[∑ i ∈ Finset.range n, ξ i | 𝒢 n] =ᵐ[P]
        ∑ i ∈ Finset.range n, ξ i := by
    exact
      (condExp_of_stronglyMeasurable (μ := P) (h𝒢_le n)
        hsum_meas hsum_int).eventuallyEq
  have hsym_sum :
      (∑ i ∈ Finset.range n, P[ξ i | 𝒢 n]) =ᵐ[P]
        ∑ i ∈ Finset.range n, P[ξ 0 | 𝒢 n] :=
    eventuallyEq_sum fun i hi => hsym i hi
  have hsum_const :
      (∑ i ∈ Finset.range n, P[ξ 0 | 𝒢 n]) =
        fun ω => (n : ℝ) * P[ξ 0 | 𝒢 n] ω := by
    ext ω
    simp [Finset.sum_apply, Finset.sum_const, nsmul_eq_mul]
  have hprefix_eq_mul :
      (∑ i ∈ Finset.range n, ξ i) =ᵐ[P]
        fun ω => (n : ℝ) * P[ξ 0 | 𝒢 n] ω :=
    hcond_sum_meas.symm.trans
      (hcond_sum.trans (hsym_sum.trans (EventuallyEq.of_eq hsum_const)))
  filter_upwards [hprefix_eq_mul] with ω hω
  have hω' : (n : ℝ) * P[ξ 0 | 𝒢 n] ω =
      ∑ i ∈ Finset.range n, ξ i ω := by
    simpa [Finset.sum_apply] using hω.symm
  calc
    P[ξ 0 | 𝒢 n] ω =
        ((n : ℝ)⁻¹) * ((n : ℝ) * P[ξ 0 | 𝒢 n] ω) := by
          rw [← mul_assoc, inv_mul_cancel₀ hn_ne, one_mul]
    _ = ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, ξ i ω := by
          rw [hω']

/--
Durrett 2019, Example 4.7.4 conditional-expectation algebra core in the
textbook division display `S_n / n`.
-/
theorem durrett2019_example_4_7_4_condExp_first_eq_prefixAverage_div
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P]
    {𝒢 : ℕ -> MeasurableSpace Ω} {ξ : ℕ -> Ω -> ℝ} {n : ℕ}
    (hn : 0 < n)
    (h𝒢_le : ∀ n, 𝒢 n ≤ mΩ)
    (hξ_int : ∀ i ∈ Finset.range n, Integrable (ξ i) P)
    (hsum_meas :
      StronglyMeasurable[𝒢 n] (∑ i ∈ Finset.range n, ξ i))
    (hsym :
      ∀ i ∈ Finset.range n, P[ξ i | 𝒢 n] =ᵐ[P] P[ξ 0 | 𝒢 n]) :
    P[ξ 0 | 𝒢 n] =ᵐ[P]
      fun ω => (∑ i ∈ Finset.range n, ξ i ω) / (n : ℝ) := by
  filter_upwards
    [durrett2019_example_4_7_4_condExp_first_eq_invNat_prefixAverage
      (P := P) (𝒢 := 𝒢) (ξ := ξ) (n := n)
      hn h𝒢_le hξ_int hsum_meas hsym] with ω hω
  simpa [div_eq_mul_inv, mul_comm] using hω

/--
Durrett 2019, Example 4.7.4 conditional-expectation calculation specialized
to the concrete reverse-average sigma-field.  After V291/V292, the only
remaining source-specific input is the finite-prefix symmetry statement
`hsym`.
-/
theorem durrett2019_example_4_7_4_condExp_first_eq_reverseAverageSigma_prefixAverage_div
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {P : Measure Ω} [IsFiniteMeasure P]
    {ξ : ℕ -> Ω -> ℝ} {n : ℕ}
    (hn : 0 < n)
    (hξ_meas : ∀ i, Measurable (ξ i))
    (hξ_int : ∀ i ∈ Finset.range n, Integrable (ξ i) P)
    (hsym :
      ∀ i ∈ Finset.range n,
        P[ξ i | durrett2019_example_4_7_4_reverseAverageSigma ξ n] =ᵐ[P]
          P[ξ 0 | durrett2019_example_4_7_4_reverseAverageSigma ξ n]) :
    P[ξ 0 | durrett2019_example_4_7_4_reverseAverageSigma ξ n] =ᵐ[P]
      fun ω => (∑ i ∈ Finset.range n, ξ i ω) / (n : ℝ) := by
  refine
    durrett2019_example_4_7_4_condExp_first_eq_prefixAverage_div
      (P := P)
      (𝒢 := fun k : ℕ =>
        durrett2019_example_4_7_4_reverseAverageSigma ξ k)
      (ξ := ξ) (n := n) hn
      (fun k =>
        durrett2019_example_4_7_4_reverseAverageSigma_le
          (ξ := ξ) (n := k) hξ_meas)
      hξ_int ?_ hsym
  convert
    (durrett2019_example_4_7_4_prefixSum_stronglyMeasurable_reverseAverageSigma
      (ξ := ξ) n) using 1
  ext ω
  simp [durrett2019_example_4_7_4_prefixSum, Finset.sum_apply]

/--
Durrett 2019, Example 4.7.4, final strong-law endpoint using the compiled
local strong-law primitive.
-/
theorem durrett2019_example_4_7_4_strongLaw_ae_real
    {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    (ξ : ℕ -> Ω -> ℝ)
    (hint : Integrable (ξ 0) P)
    (hindep : Pairwise ((· ⟂ᵢ[P] ·) on ξ))
    (hident : ∀ i, _root_.ProbabilityTheory.IdentDistrib (ξ i) (ξ 0) P P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => (∑ i ∈ Finset.range n, ξ i ω) / n)
        atTop
        (𝓝 (∫ ω, ξ 0 ω ∂P)) := by
  exact StatInference.ProbabilityMeasure.strongLaw_ae_real ξ hint hindep hident

end ProbabilityTheory
end StatInference
