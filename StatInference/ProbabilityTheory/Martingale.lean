import Mathlib.Probability.Martingale.Basic
import StatInference.ProbabilityTheory.ConditionalExpectation

/-!
# Durrett 2019 martingale wrappers

This module starts the Durrett Chapter 4.2 martingale layer.  The wrappers keep
Durrett's adapted/integrable/conditional-expectation formulation close to
mathlib's `Martingale`, `Submartingale`, and `Supermartingale` API.
-/

namespace StatInference
namespace ProbabilityTheory

open MeasureTheory

open scoped MeasureTheory ProbabilityTheory

/-! ## Durrett, Section 4.2 -/

/--
Durrett 2019, Section 4.2: a martingale is adapted to its filtration.
-/
theorem durrett2019_section_4_2_martingale_stronglyAdapted
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Martingale X ℱ μ) :
    StronglyAdapted ℱ X :=
  hX.stronglyAdapted

/--
Durrett 2019, Section 4.2: each martingale time is integrable.
-/
theorem durrett2019_section_4_2_martingale_integrable
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Martingale X ℱ μ) (i : ι) :
    Integrable (X i) μ :=
  hX.integrable i

/--
Durrett 2019, Section 4.2: the conditional-expectation identity for
martingales.
-/
theorem durrett2019_section_4_2_martingale_condExp_ae_eq
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Martingale X ℱ μ) {i j : ι} (hij : i ≤ j) :
    μ[X j | ℱ i] =ᵐ[μ] X i :=
  hX.condExp_ae_eq hij

/--
Durrett 2019, Section 4.2: the one-step conditional-expectation identity.
-/
theorem durrett2019_section_4_2_martingale_condExp_succ_ae_eq
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Martingale X ℱ μ) (n : ℕ) :
    μ[X (n + 1) | ℱ n] =ᵐ[μ] X n :=
  hX.condExp_ae_eq n.le_succ

/--
Durrett 2019, Section 4.2: a submartingale is adapted to its filtration.
-/
theorem durrett2019_section_4_2_submartingale_stronglyAdapted
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Submartingale X ℱ μ) :
    StronglyAdapted ℱ X :=
  hX.stronglyAdapted

/--
Durrett 2019, Section 4.2: each submartingale time is integrable.
-/
theorem durrett2019_section_4_2_submartingale_integrable
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Submartingale X ℱ μ) (i : ι) :
    Integrable (X i) μ :=
  hX.integrable i

/--
Durrett 2019, Section 4.2: the conditional-expectation inequality for
submartingales.
-/
theorem durrett2019_section_4_2_submartingale_ae_le_condExp
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Submartingale X ℱ μ) {i j : ι} (hij : i ≤ j) :
    X i ≤ᵐ[μ] μ[X j | ℱ i] :=
  hX.ae_le_condExp hij

/--
Durrett 2019, Section 4.2: the one-step submartingale inequality.
-/
theorem durrett2019_section_4_2_submartingale_succ_ae_le_condExp
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Submartingale X ℱ μ) (n : ℕ) :
    X n ≤ᵐ[μ] μ[X (n + 1) | ℱ n] :=
  hX.ae_le_condExp n.le_succ

/--
Durrett 2019, Section 4.2: a supermartingale is adapted to its filtration.
-/
theorem durrett2019_section_4_2_supermartingale_stronglyAdapted
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Supermartingale X ℱ μ) :
    StronglyAdapted ℱ X :=
  hX.stronglyAdapted

/--
Durrett 2019, Section 4.2: each supermartingale time is integrable.
-/
theorem durrett2019_section_4_2_supermartingale_integrable
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Supermartingale X ℱ μ) (i : ι) :
    Integrable (X i) μ :=
  hX.integrable i

/--
Durrett 2019, Section 4.2: the conditional-expectation inequality for
supermartingales.
-/
theorem durrett2019_section_4_2_supermartingale_condExp_ae_le
    {Ω E ι : Type*} [Preorder ι] [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ι mΩ} {X : ι -> Ω -> E}
    (hX : Supermartingale X ℱ μ) {i j : ι} (hij : i ≤ j) :
    μ[X j | ℱ i] ≤ᵐ[μ] X i :=
  hX.condExp_ae_le hij

/--
Durrett 2019, Section 4.2: the one-step supermartingale inequality.
-/
theorem durrett2019_section_4_2_supermartingale_condExp_succ_ae_le
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Supermartingale X ℱ μ) (n : ℕ) :
    μ[X (n + 1) | ℱ n] ≤ᵐ[μ] X n :=
  hX.condExp_ae_le n.le_succ

/--
Durrett 2019, Section 4.2, one-step construction for real martingales.

This is Durrett's definition in constructor form: adaptedness, integrability,
and `E(X_{n+1} | F_n) = X_n` imply the all-times mathlib martingale.
-/
theorem durrett2019_section_4_2_real_martingale_nat_of_condExp_succ
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ}
    (hAdapted : StronglyAdapted ℱ X)
    (hIntegrable : ∀ n, Integrable (X n) μ)
    (hCond : ∀ n, μ[X (n + 1) | ℱ n] =ᵐ[μ] X n) :
    Martingale X ℱ μ :=
  martingale_nat hAdapted hIntegrable fun n => (hCond n).symm

/--
Durrett 2019, Section 4.2, one-step construction for real submartingales.
-/
theorem durrett2019_section_4_2_real_submartingale_nat_of_condExp_succ
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ}
    (hAdapted : StronglyAdapted ℱ X)
    (hIntegrable : ∀ n, Integrable (X n) μ)
    (hCond : ∀ n, X n ≤ᵐ[μ] μ[X (n + 1) | ℱ n]) :
    Submartingale X ℱ μ :=
  submartingale_nat hAdapted hIntegrable hCond

/--
Durrett 2019, Section 4.2, one-step construction for real supermartingales.
-/
theorem durrett2019_section_4_2_real_supermartingale_nat_of_condExp_succ
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ}
    (hAdapted : StronglyAdapted ℱ X)
    (hIntegrable : ∀ n, Integrable (X n) μ)
    (hCond : ∀ n, μ[X (n + 1) | ℱ n] ≤ᵐ[μ] X n) :
    Supermartingale X ℱ μ :=
  supermartingale_nat hAdapted hIntegrable hCond

end ProbabilityTheory
end StatInference
