import Mathlib.Probability.BorelCantelli
import Mathlib.Probability.Martingale.Basic
import Mathlib.Probability.Martingale.Centering
import Mathlib.Probability.Martingale.Convergence
import Mathlib.Probability.Martingale.OptionalStopping
import Mathlib.Probability.Martingale.Upcrossing
import Mathlib.MeasureTheory.Integral.Lebesgue.DominatedConvergence
import StatInference.ProbabilityTheory.ConditionalExpectation

/-!
# Durrett 2019 martingale wrappers

This module starts the Durrett Chapter 4.2 martingale layer.  The wrappers keep
Durrett's adapted/integrable/conditional-expectation formulation close to
mathlib's `Martingale`, `Submartingale`, and `Supermartingale` API.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory

open scoped BigOperators ENNReal MeasureTheory NNReal ProbabilityTheory Topology

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

/--
Durrett 2019, Theorem 4.2.4: for a supermartingale, conditional expectations
are decreasing across all later times.
-/
theorem durrett2019_theorem_4_2_4_supermartingale_condExp_ae_le
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Supermartingale X ℱ μ) {m n : ℕ} (hmn : m ≤ n) :
    μ[X n | ℱ m] ≤ᵐ[μ] X m :=
  durrett2019_section_4_2_supermartingale_condExp_ae_le hX hmn

/--
Durrett 2019, Theorem 4.2.4, source-facing strict-index form:
if `n > m`, then `E(X_n | F_m) ≤ X_m`.
-/
theorem durrett2019_theorem_4_2_4_supermartingale_condExp_strict_ae_le
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Supermartingale X ℱ μ) {m n : ℕ} (hmn : m < n) :
    μ[X n | ℱ m] ≤ᵐ[μ] X m :=
  durrett2019_theorem_4_2_4_supermartingale_condExp_ae_le hX hmn.le

/--
Durrett 2019, Theorem 4.2.5(i): for a submartingale, conditional expectations
are increasing across all later times.
-/
theorem durrett2019_theorem_4_2_5_submartingale_ae_le_condExp
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Submartingale X ℱ μ) {m n : ℕ} (hmn : m ≤ n) :
    X m ≤ᵐ[μ] μ[X n | ℱ m] :=
  durrett2019_section_4_2_submartingale_ae_le_condExp hX hmn

/--
Durrett 2019, Theorem 4.2.5(i), source-facing strict-index form:
if `n > m`, then `E(X_n | F_m) ≥ X_m`.
-/
theorem durrett2019_theorem_4_2_5_submartingale_strict_ae_le_condExp
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E] [Preorder E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Submartingale X ℱ μ) {m n : ℕ} (hmn : m < n) :
    X m ≤ᵐ[μ] μ[X n | ℱ m] :=
  durrett2019_theorem_4_2_5_submartingale_ae_le_condExp hX hmn.le

/--
Durrett 2019, Theorem 4.2.5(ii): for a martingale, conditional expectations
are constant across all later times.
-/
theorem durrett2019_theorem_4_2_5_martingale_condExp_ae_eq
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Martingale X ℱ μ) {m n : ℕ} (hmn : m ≤ n) :
    μ[X n | ℱ m] =ᵐ[μ] X m :=
  durrett2019_section_4_2_martingale_condExp_ae_eq hX hmn

/--
Durrett 2019, Theorem 4.2.5(ii), source-facing strict-index form:
if `n > m`, then `E(X_n | F_m) = X_m`.
-/
theorem durrett2019_theorem_4_2_5_martingale_condExp_strict_ae_eq
    {Ω E : Type*} [mΩ : MeasurableSpace Ω]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} {X : ℕ -> Ω -> E}
    (hX : Martingale X ℱ μ) {m n : ℕ} (hmn : m < n) :
    μ[X n | ℱ m] =ᵐ[μ] X m :=
  durrett2019_theorem_4_2_5_martingale_condExp_ae_eq hX hmn.le

/--
Durrett 2019, Theorem 4.2.6: applying an integrable convex real function to a
real-valued martingale gives a submartingale.
-/
theorem durrett2019_theorem_4_2_6_convex_comp_submartingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} {φ : ℝ -> ℝ}
    (hX : Martingale X ℱ μ)
    (hφ_cvx : ConvexOn ℝ Set.univ φ)
    (hφX_int : ∀ n, Integrable (φ ∘ X n) μ) :
    Submartingale (fun n => φ ∘ X n) ℱ μ := by
  have hφ_cont : Continuous φ := by
    rw [← continuousOn_univ]
    exact hφ_cvx.continuousOn isOpen_univ
  refine durrett2019_section_4_2_real_submartingale_nat_of_condExp_succ
    (X := fun n => φ ∘ X n) ?_ hφX_int ?_
  · intro n
    exact hφ_cont.comp_stronglyMeasurable (hX.stronglyMeasurable n)
  · intro n
    have hJensen :
        φ ∘ μ[X (n + 1) | ℱ n] ≤ᵐ[μ] μ[φ ∘ X (n + 1) | ℱ n] :=
      durrett2019_theorem_4_1_10_conditional_jensen_real
        (μ := μ) (m := ℱ n) (X := X (n + 1)) (φ := φ)
        (ℱ.le n) hφ_cvx (hX.integrable (n + 1)) (hφX_int (n + 1))
    have hLeft :
        φ ∘ μ[X (n + 1) | ℱ n] =ᵐ[μ] φ ∘ X n :=
      (hX.condExp_ae_eq n.le_succ).mono fun ω hω => by
        simp [hω]
    exact hLeft.symm.le.trans hJensen

/--
Durrett 2019, Theorem 4.2.6 consequence: for `p ≥ 1`, the function
`x ↦ |x|^p` is convex.
-/
theorem durrett2019_theorem_4_2_6_abs_rpow_convex {p : ℝ} (hp : 1 ≤ p) :
    ConvexOn ℝ Set.univ (fun x : ℝ => |x| ^ p) := by
  have hp_nonneg : 0 ≤ p := zero_le_one.trans hp
  have habs_image : (fun x : ℝ => |x|) '' Set.univ = Set.Ici 0 := by
    ext y
    constructor
    · rintro ⟨x, -, rfl⟩
      exact abs_nonneg x
    · intro hy
      exact ⟨y, trivial, abs_of_nonneg hy⟩
  have hpow :
      ConvexOn ℝ ((fun x : ℝ => |x|) '' Set.univ) (fun x : ℝ => x ^ p) := by
    simpa [habs_image] using convexOn_rpow hp
  have hpow_mono :
      MonotoneOn (fun x : ℝ => x ^ p) ((fun x : ℝ => |x|) '' Set.univ) := by
    simpa [habs_image] using Real.monotoneOn_rpow_Ici_of_exponent_nonneg hp_nonneg
  have habs : ConvexOn ℝ Set.univ (fun x : ℝ => |x|) := by
    simpa [Real.norm_eq_abs] using
      (convexOn_univ_norm : ConvexOn ℝ Set.univ (norm : ℝ -> ℝ))
  simpa [Function.comp_def] using hpow.comp habs hpow_mono

/--
Durrett 2019, Theorem 4.2.6 consequence: if `p ≥ 1` and `|X_n|^p` is
integrable for every `n`, then `|X_n|^p` is a submartingale.
-/
theorem durrett2019_theorem_4_2_6_abs_rpow_submartingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} {p : ℝ}
    (hX : Martingale X ℱ μ) (hp : 1 ≤ p)
    (h_abs_int : ∀ n, Integrable (fun ω => |X n ω| ^ p) μ) :
    Submartingale (fun n ω => |X n ω| ^ p) ℱ μ := by
  have hφ_int :
      ∀ n, Integrable ((fun x : ℝ => |x| ^ p) ∘ X n) μ := by
    simpa [Function.comp_def] using h_abs_int
  simpa [Function.comp_def] using
    durrett2019_theorem_4_2_6_convex_comp_submartingale
      (μ := μ) (ℱ := ℱ) (X := X) (φ := fun x : ℝ => |x| ^ p)
      hX (durrett2019_theorem_4_2_6_abs_rpow_convex hp) hφ_int

/--
Durrett 2019, Theorem 4.2.7: applying an integrable increasing convex real
function to a real-valued submartingale gives a submartingale.
-/
theorem durrett2019_theorem_4_2_7_increasing_convex_comp_submartingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} {φ : ℝ -> ℝ}
    (hX : Submartingale X ℱ μ)
    (hφ_cvx : ConvexOn ℝ Set.univ φ)
    (hφ_mono : Monotone φ)
    (hφX_int : ∀ n, Integrable (φ ∘ X n) μ) :
    Submartingale (fun n => φ ∘ X n) ℱ μ := by
  have hφ_cont : Continuous φ := by
    rw [← continuousOn_univ]
    exact hφ_cvx.continuousOn isOpen_univ
  refine durrett2019_section_4_2_real_submartingale_nat_of_condExp_succ
    (X := fun n => φ ∘ X n) ?_ hφX_int ?_
  · intro n
    exact hφ_cont.comp_stronglyMeasurable (hX.stronglyMeasurable n)
  · intro n
    have hMono :
        φ ∘ X n ≤ᵐ[μ] φ ∘ μ[X (n + 1) | ℱ n] :=
      (hX.ae_le_condExp n.le_succ).mono fun ω hω => by
        exact hφ_mono hω
    have hJensen :
        φ ∘ μ[X (n + 1) | ℱ n] ≤ᵐ[μ] μ[φ ∘ X (n + 1) | ℱ n] :=
      durrett2019_theorem_4_1_10_conditional_jensen_real
        (μ := μ) (m := ℱ n) (X := X (n + 1)) (φ := φ)
        (ℱ.le n) hφ_cvx (hX.integrable (n + 1)) (hφX_int (n + 1))
    exact hMono.trans hJensen

/--
Durrett 2019, Theorem 4.2.7 consequence: the positive part
`(X_n - a)^+` of a real submartingale shifted by a level is a submartingale.
-/
theorem durrett2019_theorem_4_2_7_positivePart_submartingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ) (a : ℝ) :
    Submartingale (fun n ω => max (X n ω - a) 0) ℱ μ := by
  have hφ_cvx : ConvexOn ℝ (Set.univ : Set ℝ) (fun x : ℝ => max (x - a) 0) := by
    have hline : ConvexOn ℝ (Set.univ : Set ℝ) (fun x : ℝ => x - a) := by
      have hid : ConvexOn ℝ (Set.univ : Set ℝ) (fun x : ℝ => x) := by
        simpa [id] using
          (convexOn_id (𝕜 := ℝ) (s := (Set.univ : Set ℝ))
            (convex_univ : Convex ℝ (Set.univ : Set ℝ)))
      simpa [Pi.add_apply, sub_eq_add_neg] using hid.add_const (-a)
    have hzero : ConvexOn ℝ (Set.univ : Set ℝ) (fun _ : ℝ => (0 : ℝ)) :=
      convexOn_const (𝕜 := ℝ) (s := (Set.univ : Set ℝ)) (0 : ℝ)
        (convex_univ : Convex ℝ (Set.univ : Set ℝ))
    simpa [Pi.sup_apply] using hline.sup hzero
  have hφ_mono : Monotone (fun x : ℝ => max (x - a) 0) := by
    intro x y hxy
    exact max_le_max (sub_le_sub_right hxy a) le_rfl
  have hφX_int : ∀ n,
      Integrable ((fun x : ℝ => max (x - a) 0) ∘ X n) μ := by
    intro n
    have hshift : Integrable (fun ω => X n ω - a) μ := by
      simpa using (hX.integrable n).sub (integrable_const (μ := μ) a)
    simpa [Function.comp_def] using hshift.pos_part
  simpa [Function.comp_def] using
    durrett2019_theorem_4_2_7_increasing_convex_comp_submartingale
      (μ := μ) (ℱ := ℱ) (X := X)
      (φ := fun x : ℝ => max (x - a) 0) hX hφ_cvx hφ_mono hφX_int

/--
Durrett 2019, Theorem 4.2.7 consequence: truncating a real supermartingale
from above at a level gives a supermartingale.
-/
theorem durrett2019_theorem_4_2_7_min_supermartingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Supermartingale X ℱ μ) (a : ℝ) :
    Supermartingale (fun n ω => min (X n ω) a) ℱ μ := by
  have hneg : Submartingale (fun n ω => -X n ω) ℱ μ := by
    simpa using hX.neg
  have hconst :
      Submartingale (fun _ : ℕ => fun _ : Ω => (-a : ℝ)) ℱ μ :=
    (martingale_const ℱ μ (-a)).submartingale
  have hsup :
      Submartingale
        ((fun n ω => -X n ω) ⊔ (fun _ : ℕ => fun _ : Ω => (-a : ℝ)))
        ℱ μ :=
    hneg.sup hconst
  have hmax_neg : Supermartingale (fun n ω => -max (-X n ω) (-a)) ℱ μ := by
    simpa [Pi.sup_apply] using hsup.neg
  simpa [max_neg_neg] using hmax_neg

/--
Durrett 2019, Section 4.2: the discrete stochastic transform
`(H · X)_n = ∑_{m=1}^n H_m (X_m - X_{m-1})`, indexed as a `Finset.range`
sum.
-/
def durrett2019_stochasticTransform {Ω : Type*} (H X : ℕ -> Ω -> ℝ) :
    ℕ -> Ω -> ℝ :=
  fun n => ∑ k ∈ Finset.range n, H (k + 1) * (X (k + 1) - X k)

/--
Durrett 2019, Theorem 4.2.8 submartingale variant: a nonnegative bounded
predictable transform of a submartingale is a submartingale.
-/
theorem durrett2019_theorem_4_2_8_submartingale_transform
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {H X : ℕ -> Ω -> ℝ} {R : ℝ}
    (hX : Submartingale X ℱ μ)
    (hH_pred : StronglyAdapted ℱ (fun n => H (n + 1)))
    (hH_bdd : ∀ n ω, H n ω ≤ R)
    (hH_nonneg : ∀ n ω, 0 ≤ H n ω) :
    Submartingale (durrett2019_stochasticTransform H X) ℱ μ := by
  simpa [durrett2019_stochasticTransform] using
    hX.sum_mul_sub' hH_pred hH_bdd hH_nonneg

/--
Durrett 2019, Theorem 4.2.8 submartingale variant, using mathlib's
discrete predictable-process predicate.
-/
theorem durrett2019_theorem_4_2_8_submartingale_transform_of_predictable
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {H X : ℕ -> Ω -> ℝ} {R : ℝ}
    (hX : Submartingale X ℱ μ)
    (hH_pred : IsStronglyPredictable ℱ H)
    (hH_bdd : ∀ n ω, H n ω ≤ R)
    (hH_nonneg : ∀ n ω, 0 ≤ H n ω) :
    Submartingale (durrett2019_stochasticTransform H X) ℱ μ :=
  durrett2019_theorem_4_2_8_submartingale_transform
    hX hH_pred.measurable_add_one hH_bdd hH_nonneg

/--
Durrett 2019, Theorem 4.2.8: a nonnegative bounded predictable transform of a
supermartingale is a supermartingale.
-/
theorem durrett2019_theorem_4_2_8_supermartingale_transform
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {H X : ℕ -> Ω -> ℝ} {R : ℝ}
    (hX : Supermartingale X ℱ μ)
    (hH_pred : StronglyAdapted ℱ (fun n => H (n + 1)))
    (hH_bdd : ∀ n ω, H n ω ≤ R)
    (hH_nonneg : ∀ n ω, 0 ≤ H n ω) :
    Supermartingale (durrett2019_stochasticTransform H X) ℱ μ := by
  have hnegX : Submartingale (fun n ω => -X n ω) ℱ μ := by
    simpa using hX.neg
  have hsub_raw :
      Submartingale
        (fun n =>
          ∑ k ∈ Finset.range n,
            H (k + 1) * ((fun n ω => -X n ω) (k + 1) - (fun n ω => -X n ω) k))
        ℱ μ :=
    hnegX.sum_mul_sub' hH_pred hH_bdd hH_nonneg
  have hsub_neg :
      Submartingale (-(durrett2019_stochasticTransform H X)) ℱ μ := by
    convert hsub_raw using 2
    ext n
    simp only [durrett2019_stochasticTransform, sub_eq_add_neg, Finset.sum_apply,
      Pi.neg_apply, Pi.mul_apply, Pi.add_apply]
    rw [← Finset.sum_neg_distrib]
    refine Finset.sum_congr rfl fun k _ => ?_
    ring
  simpa using hsub_neg.neg

/--
Durrett 2019, Theorem 4.2.8, using mathlib's discrete predictable-process
predicate.
-/
theorem durrett2019_theorem_4_2_8_supermartingale_transform_of_predictable
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {H X : ℕ -> Ω -> ℝ} {R : ℝ}
    (hX : Supermartingale X ℱ μ)
    (hH_pred : IsStronglyPredictable ℱ H)
    (hH_bdd : ∀ n ω, H n ω ≤ R)
    (hH_nonneg : ∀ n ω, 0 ≤ H n ω) :
    Supermartingale (durrett2019_stochasticTransform H X) ℱ μ :=
  durrett2019_theorem_4_2_8_supermartingale_transform
    hX hH_pred.measurable_add_one hH_bdd hH_nonneg

/--
Durrett 2019, Theorem 4.2.8 martingale consequence for nonnegative bounded
predictable transforms.
-/
theorem durrett2019_theorem_4_2_8_martingale_transform_nonnegative
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {H X : ℕ -> Ω -> ℝ} {R : ℝ}
    (hX : Martingale X ℱ μ)
    (hH_pred : StronglyAdapted ℱ (fun n => H (n + 1)))
    (hH_bdd : ∀ n ω, H n ω ≤ R)
    (hH_nonneg : ∀ n ω, 0 ≤ H n ω) :
    Martingale (durrett2019_stochasticTransform H X) ℱ μ :=
  (martingale_iff (f := durrett2019_stochasticTransform H X) (ℱ := ℱ) (μ := μ)).2
    ⟨durrett2019_theorem_4_2_8_supermartingale_transform
        hX.supermartingale hH_pred hH_bdd hH_nonneg,
      durrett2019_theorem_4_2_8_submartingale_transform
        hX.submartingale hH_pred hH_bdd hH_nonneg⟩

/--
Durrett 2019, Theorem 4.2.8 martingale consequence for nonnegative bounded
predictable transforms, using mathlib's discrete predictable-process predicate.
-/
theorem durrett2019_theorem_4_2_8_martingale_transform_nonnegative_of_predictable
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {H X : ℕ -> Ω -> ℝ} {R : ℝ}
    (hX : Martingale X ℱ μ)
    (hH_pred : IsStronglyPredictable ℱ H)
    (hH_bdd : ∀ n ω, H n ω ≤ R)
    (hH_nonneg : ∀ n ω, 0 ≤ H n ω) :
    Martingale (durrett2019_stochasticTransform H X) ℱ μ :=
  durrett2019_theorem_4_2_8_martingale_transform_nonnegative
    hX hH_pred.measurable_add_one hH_bdd hH_nonneg

/--
Durrett 2019, Theorem 4.2.9 submartingale variant: stopping a submartingale
at a stopping time preserves the submartingale property.
-/
theorem durrett2019_theorem_4_2_9_submartingale_stoppedProcess
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {N : Ω -> ℕ∞}
    (hX : Submartingale X ℱ μ) (hN : IsStoppingTime ℱ N) :
    Submartingale (stoppedProcess X N) ℱ μ :=
  hX.stoppedProcess hN

/--
Durrett 2019, Theorem 4.2.9: stopping a supermartingale at a stopping time
preserves the supermartingale property.
-/
theorem durrett2019_theorem_4_2_9_supermartingale_stoppedProcess
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {N : Ω -> ℕ∞}
    (hX : Supermartingale X ℱ μ) (hN : IsStoppingTime ℱ N) :
    Supermartingale (stoppedProcess X N) ℱ μ := by
  have hneg : Submartingale (fun n ω => -X n ω) ℱ μ := by
    simpa using hX.neg
  have hstopped_neg : Submartingale (stoppedProcess (fun n ω => -X n ω) N) ℱ μ :=
    hneg.stoppedProcess hN
  have hneg_stopped : Submartingale (-(stoppedProcess X N)) ℱ μ := by
    convert hstopped_neg using 2
  simpa using hneg_stopped.neg

/--
Durrett 2019, Theorem 4.2.9 martingale variant: stopping a martingale at a
stopping time preserves the martingale property.
-/
theorem durrett2019_theorem_4_2_9_martingale_stoppedProcess
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {N : Ω -> ℕ∞}
    (hX : Martingale X ℱ μ) (hN : IsStoppingTime ℱ N) :
    Martingale (stoppedProcess X N) ℱ μ :=
  (martingale_iff (f := stoppedProcess X N) (ℱ := ℱ) (μ := μ)).2
    ⟨durrett2019_theorem_4_2_9_supermartingale_stoppedProcess
        hX.supermartingale hN,
      durrett2019_theorem_4_2_9_submartingale_stoppedProcess
        hX.submartingale hN⟩

/--
Durrett 2019, Theorem 4.2.10: Doob's upcrossing inequality in the compiled
mathlib positive-part form.
-/
theorem durrett2019_theorem_4_2_10_upcrossing_inequality
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    (a b : ℝ) (n : ℕ) :
    (b - a) * ∫ ω, (upcrossingsBefore a b X n ω : ℝ) ∂μ ≤
      ∫ ω, (X n ω - a)⁺ ∂μ := by
  simpa using hX.mul_integral_upcrossingsBefore_le_integral_pos_part a b n

/--
Durrett 2019, Theorem 4.2.10, textbook display: for `a < b`, the upcrossing
bound can be written with the initial positive-part term subtracted.
-/
theorem durrett2019_theorem_4_2_10_upcrossing_inequality_sub_initial
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {a b : ℝ} (hab : a < b) (n : ℕ) :
    (b - a) * ∫ ω, (upcrossingsBefore a b X n ω : ℝ) ∂μ ≤
      (∫ ω, (X n ω - a)⁺ ∂μ) - ∫ ω, (X 0 ω - a)⁺ ∂μ := by
  let Y : ℕ -> Ω -> ℝ := fun n ω => (X n ω - a)⁺
  have hY : Submartingale Y ℱ μ := by
    have hshift : Submartingale (X - fun _ _ => a) ℱ μ :=
      hX.sub_martingale (martingale_const ℱ μ a)
    simpa [Y, Pi.sub_apply] using hshift.pos
  have hfirst :
      (b - a) * ∫ ω, (upcrossingsBefore a b X n ω : ℝ) ∂μ ≤
        ∫ ω, (∑ k ∈ Finset.range n,
          upcrossingStrat 0 (b - a) Y n k * (Y (k + 1) - Y k)) ω ∂μ := by
    rw [← integral_const_mul]
    refine integral_mono_of_nonneg ?_ ((hY.sum_upcrossingStrat_mul 0 (b - a) n).integrable n) ?_
    · exact Eventually.of_forall fun ω => mul_nonneg (sub_nonneg.2 hab.le) (Nat.cast_nonneg _)
    · filter_upwards with ω
      have hpos : 0 < b - a := sub_pos.2 hab
      have hpoint :=
        mul_upcrossingsBefore_le (f := Y) (a := 0) (b := b - a) (N := n) (ω := ω)
          (posPart_nonneg _) hpos
      rw [upcrossingsBefore_pos_eq (f := X) (N := n) (ω := ω) hab] at hpoint
      simpa [sub_zero, Finset.sum_apply, Pi.mul_apply, Pi.sub_apply] using hpoint
  exact hfirst.trans (hY.sum_mul_upcrossingStrat_le (a := 0) (b := b - a) (N := n) (n := n))

/--
L1 bridge used by Durrett 2019, Theorem 4.2.11: a Bochner bound on
`∫ ‖X‖` gives the corresponding `eLpNorm · 1` bound consumed by mathlib's
martingale convergence theorem.
-/
theorem durrett2019_eLpNorm_one_le_of_integral_norm_le
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {X : Ω -> ℝ} (hX : Integrable X μ)
    {C : ℝ} (hC_nonneg : 0 ≤ C) (hC : ∫ ω, ‖X ω‖ ∂μ ≤ C) :
    eLpNorm X 1 μ ≤ ENNReal.ofReal C := by
  rw [eLpNorm_one_eq_lintegral_enorm]
  refine (ENNReal.le_ofReal_iff_toReal_le ?_ hC_nonneg).2 ?_
  · exact (hasFiniteIntegral_iff_enorm.mp hX.2).ne
  · rwa [← integral_norm_eq_lintegral_enorm hX.1]

/--
Durrett 2019, Theorem 4.2.11 bridge: for a submartingale, a uniform bound on
the positive-part expectations gives the L1/eLpNorm boundedness hypothesis
used by mathlib's almost-sure convergence theorem.

The estimate is Durrett's proof algebra:
`E X_n ≥ E X_0` and `|x| = 2 x^+ - x`, hence
`E |X_n| ≤ 2 B - E X_0` when `E X_n^+ ≤ B`.
-/
theorem durrett2019_theorem_4_2_11_eLpNorm_bdd_of_integral_posPart_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {B : ℝ} (hB : ∀ n, ∫ ω, (X n ω)⁺ ∂μ ≤ B) :
    ∀ n, eLpNorm (X n) 1 μ ≤
      ENNReal.ofReal (2 * B - ∫ ω, X 0 ω ∂μ) := by
  intro n
  have h_integral_mono : ∫ ω, X 0 ω ∂μ ≤ ∫ ω, X n ω ∂μ := by
    have hle : X 0 ≤ᵐ[μ] μ[X n | ℱ 0] :=
      hX.ae_le_condExp (Nat.zero_le n)
    have hmono := integral_mono_ae (hX.integrable 0) integrable_condExp hle
    simpa [integral_condExp (ℱ.le 0)] using hmono
  have hpos_int : Integrable (fun ω => (X n ω)⁺) μ := by
    simpa using (hX.integrable n).pos_part
  have hnorm_eq :
      ∫ ω, ‖X n ω‖ ∂μ =
        2 * ∫ ω, (X n ω)⁺ ∂μ - ∫ ω, X n ω ∂μ := by
    have hpoint : (fun ω => ‖X n ω‖) =
        fun ω => 2 * (X n ω)⁺ - X n ω := by
      ext ω
      have h := add_abs_eq_two_nsmul_posPart (X n ω)
      have h' : X n ω + |X n ω| = 2 * (X n ω)⁺ := by
        simpa [two_nsmul] using h
      rw [Real.norm_eq_abs]
      linarith
    rw [hpoint]
    rw [integral_sub (hpos_int.const_mul 2) (hX.integrable n)]
    rw [integral_const_mul]
  have hnorm_bound :
      ∫ ω, ‖X n ω‖ ∂μ ≤ 2 * B - ∫ ω, X 0 ω ∂μ := by
    rw [hnorm_eq]
    nlinarith [hB n, h_integral_mono]
  have hC_nonneg : 0 ≤ 2 * B - ∫ ω, X 0 ω ∂μ :=
    (integral_nonneg fun ω => norm_nonneg (X n ω)).trans hnorm_bound
  exact durrett2019_eLpNorm_one_le_of_integral_norm_le (hX.integrable n) hC_nonneg hnorm_bound

/--
Durrett 2019, Theorem 4.2.11, L1-bounded source form: an L1-bounded
submartingale has an almost-sure finite limit.

Durrett states the hypothesis using `sup_n E X_n^+ < ∞`.  This wrapper records
the compiled mathlib convergence theorem under its direct `eLpNorm`-bounded
hypothesis; the positive-part bridge is a separate source-facing algebra layer.
-/
theorem durrett2019_theorem_4_2_11_submartingale_exists_ae_tendsto_of_eLpNorm_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {R : ℝ≥0} (hR : ∀ n, eLpNorm (X n) 1 μ ≤ R) :
    ∀ᵐ ω ∂μ, ∃ x : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 x) :=
  hX.exists_ae_tendsto_of_bdd hR

/--
Durrett 2019, Theorem 4.2.11, canonical limit-process form: the almost-sure
limit can be chosen as mathlib's filtration limit process.
-/
theorem durrett2019_theorem_4_2_11_submartingale_ae_tendsto_limitProcess_of_eLpNorm_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {R : ℝ≥0} (hR : ∀ n, eLpNorm (X n) 1 μ ≤ R) :
    ∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (ℱ.limitProcess X μ ω)) :=
  hX.ae_tendsto_limitProcess hR

/--
Durrett 2019, Theorem 4.2.11: the canonical almost-sure limit is L1.
-/
theorem durrett2019_theorem_4_2_11_submartingale_limitProcess_memLp_one_of_eLpNorm_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {R : ℝ≥0} (hR : ∀ n, eLpNorm (X n) 1 μ ≤ R) :
    MemLp (ℱ.limitProcess X μ) 1 μ :=
  hX.memLp_limitProcess hR

/--
Durrett 2019, Theorem 4.2.11: the canonical almost-sure limit is integrable.
-/
theorem durrett2019_theorem_4_2_11_submartingale_limitProcess_integrable_of_eLpNorm_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {R : ℝ≥0} (hR : ∀ n, eLpNorm (X n) 1 μ ≤ R) :
    Integrable (ℱ.limitProcess X μ) μ :=
  (durrett2019_theorem_4_2_11_submartingale_limitProcess_memLp_one_of_eLpNorm_bdd
    hX hR).integrable le_rfl

/--
Durrett 2019, Theorem 4.2.11 martingale consequence: an L1-bounded martingale
converges almost surely to its filtration limit process.
-/
theorem durrett2019_theorem_4_2_11_martingale_ae_tendsto_limitProcess_of_eLpNorm_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Martingale X ℱ μ)
    {R : ℝ≥0} (hR : ∀ n, eLpNorm (X n) 1 μ ≤ R) :
    ∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (ℱ.limitProcess X μ ω)) :=
  durrett2019_theorem_4_2_11_submartingale_ae_tendsto_limitProcess_of_eLpNorm_bdd
    hX.submartingale hR

/--
Durrett 2019, Theorem 4.2.11 martingale consequence: the canonical martingale
limit is integrable under the same L1-boundedness hypothesis.
-/
theorem durrett2019_theorem_4_2_11_martingale_limitProcess_integrable_of_eLpNorm_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Martingale X ℱ μ)
    {R : ℝ≥0} (hR : ∀ n, eLpNorm (X n) 1 μ ≤ R) :
    Integrable (ℱ.limitProcess X μ) μ :=
  durrett2019_theorem_4_2_11_submartingale_limitProcess_integrable_of_eLpNorm_bdd
    hX.submartingale hR

/--
Durrett 2019, Theorem 4.2.11, source positive-part form: if a submartingale
has uniformly bounded positive-part expectations, then it has an almost-sure
finite limit.
-/
theorem durrett2019_theorem_4_2_11_submartingale_exists_ae_tendsto_of_integral_posPart_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {B : ℝ} (hB : ∀ n, ∫ ω, (X n ω)⁺ ∂μ ≤ B) :
    ∀ᵐ ω ∂μ, ∃ x : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 x) :=
  hX.exists_ae_tendsto_of_bdd
    (durrett2019_theorem_4_2_11_eLpNorm_bdd_of_integral_posPart_bdd hX hB)

/--
Durrett 2019, Theorem 4.2.11, source positive-part form with the canonical
mathlib limit process.
-/
theorem durrett2019_theorem_4_2_11_submartingale_ae_tendsto_limitProcess_of_integral_posPart_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {B : ℝ} (hB : ∀ n, ∫ ω, (X n ω)⁺ ∂μ ≤ B) :
    ∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (ℱ.limitProcess X μ ω)) :=
  hX.ae_tendsto_limitProcess
    (durrett2019_theorem_4_2_11_eLpNorm_bdd_of_integral_posPart_bdd hX hB)

/--
Durrett 2019, Theorem 4.2.11, source positive-part form: the canonical
almost-sure limit is integrable.
-/
theorem durrett2019_theorem_4_2_11_submartingale_limitProcess_integrable_of_integral_posPart_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ)
    {B : ℝ} (hB : ∀ n, ∫ ω, (X n ω)⁺ ∂μ ≤ B) :
    Integrable (ℱ.limitProcess X μ) μ :=
  (hX.memLp_limitProcess
    (durrett2019_theorem_4_2_11_eLpNorm_bdd_of_integral_posPart_bdd hX hB)).integrable le_rfl

/--
Durrett 2019, Theorem 4.2.11 martingale consequence, source positive-part
form: a martingale with uniformly bounded positive-part expectations converges
almost surely to its filtration limit process.
-/
theorem durrett2019_theorem_4_2_11_martingale_ae_tendsto_limitProcess_of_integral_posPart_bdd
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Martingale X ℱ μ)
    {B : ℝ} (hB : ∀ n, ∫ ω, (X n ω)⁺ ∂μ ≤ B) :
    ∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (ℱ.limitProcess X μ ω)) :=
  durrett2019_theorem_4_2_11_submartingale_ae_tendsto_limitProcess_of_integral_posPart_bdd
    hX.submartingale hB

/--
Durrett 2019, Theorem 4.2.12 support: if `X` is nonnegative, then the
positive part of `-X` has zero expectation at every time.
-/
theorem durrett2019_theorem_4_2_12_neg_posPart_integral_le_zero_of_nonneg
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ -> Ω -> ℝ}
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] X n) :
    ∀ n, ∫ ω, (-(X n ω))⁺ ∂μ ≤ 0 := by
  intro n
  have hzero : (fun ω => (-(X n ω))⁺) =ᵐ[μ] fun _ => (0 : ℝ) := by
    filter_upwards [h_nonneg n] with ω hω
    exact posPart_eq_zero.2 (neg_nonpos.2 hω)
  rw [integral_congr_ae hzero, integral_zero]

/--
Durrett 2019, Theorem 4.2.12, convergence component: a nonnegative
supermartingale converges almost surely to a finite real limit.
-/
theorem durrett2019_theorem_4_2_12_nonnegative_supermartingale_exists_ae_tendsto
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Supermartingale X ℱ μ)
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] X n) :
    ∀ᵐ ω ∂μ, ∃ x : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 x) := by
  let Y : ℕ -> Ω -> ℝ := fun n ω => -X n ω
  have hY : Submartingale Y ℱ μ := by
    simpa [Y] using hX.neg
  have hB : ∀ n, ∫ ω, (Y n ω)⁺ ∂μ ≤ 0 := by
    simpa [Y] using
      (durrett2019_theorem_4_2_12_neg_posPart_integral_le_zero_of_nonneg
        (X := X) h_nonneg)
  have hconv :
      ∀ᵐ ω ∂μ, ∃ y : ℝ, Tendsto (fun n => Y n ω) atTop (𝓝 y) :=
    durrett2019_theorem_4_2_11_submartingale_exists_ae_tendsto_of_integral_posPart_bdd
      hY hB
  filter_upwards [hconv] with ω hω
  rcases hω with ⟨y, hy⟩
  exact ⟨-y, by simpa [Y] using hy.neg⟩

/--
Durrett 2019, Theorem 4.2.12, integrable-limit component: a nonnegative
supermartingale has an integrable almost-sure limit, chosen as the negative of
the limit process of the negated submartingale.

The remaining source-display inequality `E X ≤ E X_0` is a separate Fatou
bridge.
-/
theorem durrett2019_theorem_4_2_12_nonnegative_supermartingale_exists_integrable_limit
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Supermartingale X ℱ μ)
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] X n) :
    ∃ Z : Ω -> ℝ, Integrable Z μ ∧
      ∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (Z ω)) := by
  let Y : ℕ -> Ω -> ℝ := fun n ω => -X n ω
  have hY : Submartingale Y ℱ μ := by
    simpa [Y] using hX.neg
  have hB : ∀ n, ∫ ω, (Y n ω)⁺ ∂μ ≤ 0 := by
    simpa [Y] using
      (durrett2019_theorem_4_2_12_neg_posPart_integral_le_zero_of_nonneg
        (X := X) h_nonneg)
  refine ⟨fun ω => -ℱ.limitProcess Y μ ω, ?_, ?_⟩
  · exact
      (durrett2019_theorem_4_2_11_submartingale_limitProcess_integrable_of_integral_posPart_bdd
        hY hB).neg
  · have hconv :
        ∀ᵐ ω ∂μ, Tendsto (fun n => Y n ω) atTop (𝓝 (ℱ.limitProcess Y μ ω)) :=
      durrett2019_theorem_4_2_11_submartingale_ae_tendsto_limitProcess_of_integral_posPart_bdd
        hY hB
    filter_upwards [hconv] with ω hω
    simpa [Y] using hω.neg

/--
Durrett 2019, Theorem 4.2.12, Fatou expectation bridge: any integrable
almost-sure limit of a nonnegative supermartingale has expectation bounded by
the initial expectation.
-/
theorem durrett2019_theorem_4_2_12_nonnegative_supermartingale_limit_integral_le_initial
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Supermartingale X ℱ μ)
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] X n)
    {Z : Ω -> ℝ} (hZ_int : Integrable Z μ)
    (hZ_lim : ∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (Z ω))) :
    ∫ ω, Z ω ∂μ ≤ ∫ ω, X 0 ω ∂μ := by
  have h_all_nonneg : ∀ᵐ ω ∂μ, ∀ n, 0 ≤ X n ω := ae_all_iff.2 h_nonneg
  have hZ_nonneg : 0 ≤ᵐ[μ] Z := by
    filter_upwards [hZ_lim, h_all_nonneg] with ω hlimω hnonnegω
    exact ge_of_tendsto' hlimω (fun n => hnonnegω n)
  have h_super_integral_le : ∀ n, ∫ ω, X n ω ∂μ ≤ ∫ ω, X 0 ω ∂μ := by
    intro n
    have hle : μ[X n | ℱ 0] ≤ᵐ[μ] X 0 :=
      hX.condExp_ae_le (Nat.zero_le n)
    have hmono := integral_mono_ae integrable_condExp (hX.integrable 0) hle
    simpa [integral_condExp (ℱ.le 0)] using hmono
  have hX0_integral_nonneg : 0 ≤ ∫ ω, X 0 ω ∂μ :=
    integral_nonneg_of_ae (h_nonneg 0)
  have hlintegral_le : ∀ n,
      ∫⁻ ω, ENNReal.ofReal (X n ω) ∂μ ≤
        ENNReal.ofReal (∫ ω, X 0 ω ∂μ) := by
    intro n
    rw [← ofReal_integral_eq_lintegral_ofReal (hX.integrable n) (h_nonneg n)]
    exact ENNReal.ofReal_le_ofReal (h_super_integral_le n)
  have hfatou :
      ∫⁻ ω, ENNReal.ofReal (Z ω) ∂μ ≤
        liminf (fun n => ∫⁻ ω, ENNReal.ofReal (X n ω) ∂μ) atTop := by
    calc
      ∫⁻ ω, ENNReal.ofReal (Z ω) ∂μ
          = ∫⁻ ω, liminf (fun n => ENNReal.ofReal (X n ω)) atTop ∂μ := by
              apply lintegral_congr_ae
              filter_upwards [hZ_lim] with ω hlimω
              have hlim_ofReal :
                  Tendsto (fun n => ENNReal.ofReal (X n ω)) atTop
                    (𝓝 (ENNReal.ofReal (Z ω))) :=
                ENNReal.continuous_ofReal.continuousAt.tendsto.comp hlimω
              exact hlim_ofReal.liminf_eq.symm
      _ ≤ liminf (fun n => ∫⁻ ω, ENNReal.ofReal (X n ω) ∂μ) atTop :=
          lintegral_liminf_le' fun n =>
            (hX.integrable n).aestronglyMeasurable.aemeasurable.ennreal_ofReal
  have hliminf_le :
      liminf (fun n => ∫⁻ ω, ENNReal.ofReal (X n ω) ∂μ) atTop ≤
        ENNReal.ofReal (∫ ω, X 0 ω ∂μ) :=
    Filter.liminf_le_of_frequently_le' (Frequently.of_forall hlintegral_le)
  have hofReal :
      ENNReal.ofReal (∫ ω, Z ω ∂μ) ≤
        ENNReal.ofReal (∫ ω, X 0 ω ∂μ) := by
    rw [ofReal_integral_eq_lintegral_ofReal hZ_int hZ_nonneg]
    exact hfatou.trans hliminf_le
  exact (ENNReal.ofReal_le_ofReal_iff hX0_integral_nonneg).1 hofReal

/--
Durrett 2019, Theorem 4.2.12: a nonnegative supermartingale has an integrable
almost-sure limit whose expectation is bounded by the initial expectation.
-/
theorem durrett2019_theorem_4_2_12_nonnegative_supermartingale_exists_integrable_limit_integral_le_initial
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Supermartingale X ℱ μ)
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] X n) :
    ∃ Z : Ω -> ℝ, Integrable Z μ ∧
      (∀ᵐ ω ∂μ, Tendsto (fun n => X n ω) atTop (𝓝 (Z ω))) ∧
      ∫ ω, Z ω ∂μ ≤ ∫ ω, X 0 ω ∂μ := by
  rcases
    durrett2019_theorem_4_2_12_nonnegative_supermartingale_exists_integrable_limit
      hX h_nonneg with
    ⟨Z, hZ_int, hZ_lim⟩
  exact
    ⟨Z, hZ_int, hZ_lim,
      durrett2019_theorem_4_2_12_nonnegative_supermartingale_limit_integral_le_initial
        hX h_nonneg hZ_int hZ_lim⟩

/-! ## Durrett, Example 4.2.1 -/

/--
Durrett 2019, Example 4.2.1, the linear random walk
`S_n = S_0 + ξ_1 + ... + ξ_n`.

The Lean sequence `ξ` is zero-indexed, so the textbook increment `ξ_i` is
represented by `ξ i` and the finite sum uses `ξ (k + 1)`.
-/
def durrett2019_example_4_2_1_linearRandomWalk
    {Ω : Type*} (s0 : ℝ) (ξ : ℕ -> Ω -> ℝ) : ℕ -> Ω -> ℝ :=
  fun n ω => s0 + ∑ k ∈ Finset.range n, ξ (k + 1) ω

/--
Durrett 2019, Example 4.2.1: centered increments `ξ_i - μ`.
-/
def durrett2019_example_4_2_1_centeredIncrement
    {Ω : Type*} (drift : ℝ) (ξ : ℕ -> Ω -> ℝ) : ℕ -> Ω -> ℝ :=
  fun n ω => ξ n ω - drift

@[simp]
theorem durrett2019_example_4_2_1_linearRandomWalk_zero
    {Ω : Type*} (s0 : ℝ) (ξ : ℕ -> Ω -> ℝ) :
    durrett2019_example_4_2_1_linearRandomWalk s0 ξ 0 = fun _ => s0 := by
  ext ω
  simp [durrett2019_example_4_2_1_linearRandomWalk]

/--
Durrett 2019, Example 4.2.1, random-walk increment identity:
`S_{n+1} = S_n + ξ_{n+1}`.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_succ
    {Ω : Type*} (s0 : ℝ) (ξ : ℕ -> Ω -> ℝ) (n : ℕ) :
    durrett2019_example_4_2_1_linearRandomWalk s0 ξ (n + 1) =
      durrett2019_example_4_2_1_linearRandomWalk s0 ξ n + ξ (n + 1) := by
  ext ω
  simp [durrett2019_example_4_2_1_linearRandomWalk, Finset.sum_range_succ,
    add_assoc]

/--
Durrett 2019, Example 4.2.1: random walks built from centered increments have
the textbook display `S_n - n * μ`.
-/
theorem durrett2019_example_4_2_1_centeredLinearRandomWalk_eq_sub_mul
    {Ω : Type*} (s0 drift : ℝ) (ξ : ℕ -> Ω -> ℝ) (n : ℕ) :
    durrett2019_example_4_2_1_linearRandomWalk s0
        (durrett2019_example_4_2_1_centeredIncrement drift ξ) n =
      fun ω =>
        durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω - (n : ℝ) * drift := by
  ext ω
  simp [durrett2019_example_4_2_1_linearRandomWalk,
    durrett2019_example_4_2_1_centeredIncrement, Finset.sum_sub_distrib,
    Finset.sum_const, nsmul_eq_mul]
  ring

/--
Durrett 2019, Example 4.2.1: the linear random walk is adapted to the natural
filtration of its increments.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_stronglyAdapted_natural
    {Ω : Type*} [mΩ : MeasurableSpace Ω] (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n)) :
    StronglyAdapted (Filtration.natural ξ hξ_sm)
      (durrett2019_example_4_2_1_linearRandomWalk s0 ξ) := by
  intro n
  refine stronglyMeasurable_const.add ?_
  refine Finset.stronglyMeasurable_fun_sum _ fun k hk => ?_
  exact
    (Filtration.stronglyAdapted_natural (u := ξ) hξ_sm).stronglyMeasurable_le
      (Nat.succ_le_of_lt (Finset.mem_range.mp hk))

/--
Durrett 2019, Example 4.2.1: finite random-walk sums are integrable when each
increment is integrable.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_integrable
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsFiniteMeasure μ]
    (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ} (hξ_int : ∀ n, Integrable (ξ n) μ) :
    ∀ n, Integrable (durrett2019_example_4_2_1_linearRandomWalk s0 ξ n) μ := by
  intro n
  refine (integrable_const (α := Ω) (μ := μ) s0).add ?_
  exact integrable_finsetSum _ fun k _hk => hξ_int (k + 1)

/--
Durrett 2019, Example 4.2.1: finite random-walk sums are square-integrable
when each increment is square-integrable.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_memLp_two
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsFiniteMeasure μ]
    (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ} (hξ_memLp_two : ∀ n, MemLp (ξ n) 2 μ) :
    ∀ n, MemLp (durrett2019_example_4_2_1_linearRandomWalk s0 ξ n) 2 μ := by
  intro n
  simpa [durrett2019_example_4_2_1_linearRandomWalk] using
    (memLp_const (α := Ω) (μ := μ) s0).add
      (memLp_finsetSum (Finset.range n) fun k _hk => hξ_memLp_two (k + 1))

/--
Durrett 2019, Example 4.2.1: centered increments are strongly measurable.
-/
theorem durrett2019_example_4_2_1_centeredIncrement_stronglyMeasurable
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n)) (drift : ℝ) :
    ∀ n, StronglyMeasurable
      (durrett2019_example_4_2_1_centeredIncrement drift ξ n) :=
  fun n => (hξ_sm n).sub stronglyMeasurable_const

/--
Durrett 2019, Example 4.2.1: centered increments are integrable.
-/
theorem durrett2019_example_4_2_1_centeredIncrement_integrable
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsFiniteMeasure μ]
    {ξ : ℕ -> Ω -> ℝ} (hξ_int : ∀ n, Integrable (ξ n) μ) (drift : ℝ) :
    ∀ n, Integrable
      (durrett2019_example_4_2_1_centeredIncrement drift ξ n) μ :=
  fun n => (hξ_int n).sub (integrable_const drift)

/--
Durrett 2019, Example 4.2.1: measurable coordinatewise centering preserves
independence of increments.
-/
theorem durrett2019_example_4_2_1_centeredIncrement_iIndepFun
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω}
    {ξ : ℕ -> Ω -> ℝ} (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (drift : ℝ) :
    _root_.ProbabilityTheory.iIndepFun
      (durrett2019_example_4_2_1_centeredIncrement drift ξ) μ := by
  simpa [durrett2019_example_4_2_1_centeredIncrement, Function.comp_def] using
    (durrett2019_theorem_2_1_10_iIndepFun_comp
      (P := μ) (X := ξ) hξ_indep
      (f := fun _ : ℕ => fun x : ℝ => x - drift)
      (fun _ => measurable_id.sub measurable_const))

/--
Durrett 2019, Example 4.2.1: centered increments have mean zero when the
original increments have common mean `drift`.
-/
theorem durrett2019_example_4_2_1_centeredIncrement_integral_eq_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ξ : ℕ -> Ω -> ℝ} (hξ_int : ∀ n, Integrable (ξ n) μ)
    {drift : ℝ} (hξ_mean : ∀ n, (∫ ω, ξ n ω ∂μ) = drift) (n : ℕ) :
    (∫ ω, durrett2019_example_4_2_1_centeredIncrement drift ξ n ω ∂μ) = 0 := by
  calc
    (∫ ω, durrett2019_example_4_2_1_centeredIncrement drift ξ n ω ∂μ)
        = (∫ ω, ξ n ω ∂μ) - ∫ _ω : Ω, drift ∂μ := by
          simp [durrett2019_example_4_2_1_centeredIncrement,
            integral_sub (hξ_int n) (integrable_const drift)]
    _ = drift - drift := by
      simp [hξ_mean n, integral_const, probReal_univ]
    _ = 0 := sub_self drift

/--
Durrett 2019, Example 4.2.1, independence-to-conditional-expectation bridge
for the next increment and the natural filtration of the past.
-/
theorem durrett2019_example_4_2_1_increment_condExp_natural_ae_eq_integral_of_iIndepFun
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ) (n : ℕ) :
    μ[ξ (n + 1) | Filtration.natural ξ hξ_sm n] =ᵐ[μ]
      fun _ => ∫ ω, ξ (n + 1) ω ∂μ :=
  _root_.ProbabilityTheory.iIndepFun.condExp_natural_ae_eq_of_lt
    hξ_sm hξ_indep n.lt_succ_self

/--
Durrett 2019, Example 4.2.1, the source calculation:
`E(S_{n+1} | F_n) = S_n + E ξ_{n+1}`.
-/
theorem durrett2019_example_4_2_1_condExp_succ_eq_past_add_incrementMean
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {S η : ℕ -> Ω -> ℝ}
    (hS_adapted : StronglyAdapted ℱ S)
    (hS_int : ∀ n, Integrable (S n) μ)
    (hη_int : ∀ n, Integrable (η n) μ)
    (hStep : ∀ n, S (n + 1) =ᵐ[μ] S n + η (n + 1))
    (hη_cond : ∀ n, μ[η (n + 1) | ℱ n] =ᵐ[μ]
      fun _ => ∫ ω, η (n + 1) ω ∂μ) (n : ℕ) :
    μ[S (n + 1) | ℱ n] =ᵐ[μ]
      fun ω => S n ω + ∫ ω', η (n + 1) ω' ∂μ := by
  refine (condExp_congr_ae (hStep n)).trans ?_
  refine (condExp_add (hS_int n) (hη_int (n + 1)) (ℱ n)).trans ?_
  have hPast : μ[S n | ℱ n] = S n :=
    condExp_of_stronglyMeasurable (ℱ.le n) (hS_adapted n) (hS_int n)
  rw [hPast]
  exact EventuallyEq.rfl.add (hη_cond n)

/--
Durrett 2019, Example 4.2.1, natural-filtration random-walk calculation:
`E(S_{n+1} | F_n) = S_n + E ξ_{n+1}`.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_condExp_succ_eq_past_add_mean
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_int : ∀ n, Integrable (ξ n) μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ) (n : ℕ) :
    μ[durrett2019_example_4_2_1_linearRandomWalk s0 ξ (n + 1) |
        Filtration.natural ξ hξ_sm n] =ᵐ[μ]
      fun ω =>
        durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω +
          ∫ ω', ξ (n + 1) ω' ∂μ := by
  refine durrett2019_example_4_2_1_condExp_succ_eq_past_add_incrementMean
    (S := durrett2019_example_4_2_1_linearRandomWalk s0 ξ) (η := ξ)
    (ℱ := Filtration.natural ξ hξ_sm)
    (durrett2019_example_4_2_1_linearRandomWalk_stronglyAdapted_natural
      (s0 := s0) hξ_sm)
    (durrett2019_example_4_2_1_linearRandomWalk_integrable
      (μ := μ) (s0 := s0) hξ_int)
    hξ_int
    (fun n =>
      EventuallyEq.of_eq
        (durrett2019_example_4_2_1_linearRandomWalk_succ s0 ξ n))
    (fun n =>
      durrett2019_example_4_2_1_increment_condExp_natural_ae_eq_integral_of_iIndepFun
        hξ_sm hξ_indep n)
    n

/--
Durrett 2019, Example 4.2.1, linear martingale.

If the increments are independent and have mean zero, the random walk is a
martingale with respect to the natural filtration.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_martingale_of_iIndepFun_zeroMean
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_int : ∀ n, Integrable (ξ n) μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (hξ_mean_zero : ∀ n, (∫ ω, ξ n ω ∂μ) = 0) :
    Martingale
      (durrett2019_example_4_2_1_linearRandomWalk s0 ξ)
      (Filtration.natural ξ hξ_sm) μ := by
  refine durrett2019_section_4_2_real_martingale_nat_of_condExp_succ
    (durrett2019_example_4_2_1_linearRandomWalk_stronglyAdapted_natural
      (s0 := s0) hξ_sm)
    (durrett2019_example_4_2_1_linearRandomWalk_integrable
      (μ := μ) (s0 := s0) hξ_int)
    ?_
  intro n
  filter_upwards
    [durrett2019_example_4_2_1_linearRandomWalk_condExp_succ_eq_past_add_mean
      (μ := μ) (s0 := s0) hξ_sm hξ_int hξ_indep n] with ω hω
  simpa [hξ_mean_zero (n + 1)] using hω

/--
Durrett 2019, Example 4.2.1, unfavorable-game supermartingale case.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_supermartingale_of_iIndepFun_nonposMean
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_int : ∀ n, Integrable (ξ n) μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (hξ_mean_nonpos : ∀ n, (∫ ω, ξ n ω ∂μ) ≤ 0) :
    Supermartingale
      (durrett2019_example_4_2_1_linearRandomWalk s0 ξ)
      (Filtration.natural ξ hξ_sm) μ := by
  refine durrett2019_section_4_2_real_supermartingale_nat_of_condExp_succ
    (durrett2019_example_4_2_1_linearRandomWalk_stronglyAdapted_natural
      (s0 := s0) hξ_sm)
    (durrett2019_example_4_2_1_linearRandomWalk_integrable
      (μ := μ) (s0 := s0) hξ_int)
    ?_
  intro n
  filter_upwards
    [durrett2019_example_4_2_1_linearRandomWalk_condExp_succ_eq_past_add_mean
      (μ := μ) (s0 := s0) hξ_sm hξ_int hξ_indep n] with ω hω
  rw [hω]
  exact add_le_of_nonpos_right (hξ_mean_nonpos (n + 1))

/--
Durrett 2019, Example 4.2.1, favorable-game submartingale case.
-/
theorem durrett2019_example_4_2_1_linearRandomWalk_submartingale_of_iIndepFun_nonnegMean
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    (s0 : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_int : ∀ n, Integrable (ξ n) μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (hξ_mean_nonneg : ∀ n, 0 ≤ (∫ ω, ξ n ω ∂μ)) :
    Submartingale
      (durrett2019_example_4_2_1_linearRandomWalk s0 ξ)
      (Filtration.natural ξ hξ_sm) μ := by
  refine durrett2019_section_4_2_real_submartingale_nat_of_condExp_succ
    (durrett2019_example_4_2_1_linearRandomWalk_stronglyAdapted_natural
      (s0 := s0) hξ_sm)
    (durrett2019_example_4_2_1_linearRandomWalk_integrable
      (μ := μ) (s0 := s0) hξ_int)
    ?_
  intro n
  filter_upwards
    [durrett2019_example_4_2_1_linearRandomWalk_condExp_succ_eq_past_add_mean
      (μ := μ) (s0 := s0) hξ_sm hξ_int hξ_indep n] with ω hω
  rw [hω]
  exact le_add_of_nonneg_right (hξ_mean_nonneg (n + 1))

/--
Durrett 2019, Example 4.2.1, centered random-walk martingale.

Applying the zero-mean linear martingale result to `ξ_i - μ` gives the textbook
display `S_n - n * μ`, recorded by
`durrett2019_example_4_2_1_centeredLinearRandomWalk_eq_sub_mul`.
-/
theorem durrett2019_example_4_2_1_centeredLinearRandomWalk_martingale_of_iIndepFun_commonMean
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    (s0 drift : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_int : ∀ n, Integrable (ξ n) μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (hξ_mean : ∀ n, (∫ ω, ξ n ω ∂μ) = drift) :
    Martingale
      (durrett2019_example_4_2_1_linearRandomWalk s0
        (durrett2019_example_4_2_1_centeredIncrement drift ξ))
      (Filtration.natural
        (durrett2019_example_4_2_1_centeredIncrement drift ξ)
        (durrett2019_example_4_2_1_centeredIncrement_stronglyMeasurable
          hξ_sm drift)) μ := by
  refine
    durrett2019_example_4_2_1_linearRandomWalk_martingale_of_iIndepFun_zeroMean
      (s0 := s0)
      (ξ := durrett2019_example_4_2_1_centeredIncrement drift ξ)
      (durrett2019_example_4_2_1_centeredIncrement_stronglyMeasurable
        hξ_sm drift)
      (durrett2019_example_4_2_1_centeredIncrement_integrable
        (μ := μ) hξ_int drift)
      (durrett2019_example_4_2_1_centeredIncrement_iIndepFun
        (μ := μ) hξ_indep drift)
      ?_
  intro n
  exact durrett2019_example_4_2_1_centeredIncrement_integral_eq_zero
    (μ := μ) hξ_int hξ_mean n

/-! ## Durrett, Example 4.2.2 -/

/--
Durrett 2019, Example 4.2.2, the quadratic martingale candidate
`S_n^2 - n * σ^2`.
-/
def durrett2019_example_4_2_2_quadraticMartingaleProcess
    {Ω : Type*} (sigmaSq : ℝ) (S : ℕ -> Ω -> ℝ) : ℕ -> Ω -> ℝ :=
  fun n ω => S n ω ^ 2 - (n : ℝ) * sigmaSq

/--
Durrett 2019, Example 4.2.2: the quadratic martingale candidate is adapted
when the underlying process is adapted.
-/
theorem durrett2019_example_4_2_2_quadraticMartingaleProcess_stronglyAdapted
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ℱ : Filtration ℕ mΩ}
    {S : ℕ -> Ω -> ℝ} (hS_adapted : StronglyAdapted ℱ S) (sigmaSq : ℝ) :
    StronglyAdapted ℱ
      (durrett2019_example_4_2_2_quadraticMartingaleProcess sigmaSq S) := by
  intro n
  exact ((hS_adapted n).pow 2).sub stronglyMeasurable_const

/--
Durrett 2019, Example 4.2.2: integrability of the quadratic martingale
candidate follows from square integrability of `S_n`.
-/
theorem durrett2019_example_4_2_2_quadraticMartingaleProcess_integrable
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsFiniteMeasure μ]
    {S : ℕ -> Ω -> ℝ} (sigmaSq : ℝ)
    (hS_sq_int : ∀ n, Integrable (fun ω => S n ω ^ 2) μ) :
    ∀ n, Integrable
      (durrett2019_example_4_2_2_quadraticMartingaleProcess sigmaSq S n) μ :=
  fun n => (hS_sq_int n).sub (integrable_const ((n : ℝ) * sigmaSq))

/--
Durrett 2019, Example 4.2.2: random-walk square expansion
`S_{n+1}^2 = S_n^2 + 2 S_n ξ_{n+1} + ξ_{n+1}^2`.
-/
theorem durrett2019_example_4_2_2_linearRandomWalk_square_succ
    {Ω : Type*} (s0 : ℝ) (ξ : ℕ -> Ω -> ℝ) (n : ℕ) :
    (fun ω => durrett2019_example_4_2_1_linearRandomWalk s0 ξ (n + 1) ω ^ 2) =
      fun ω =>
        durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω ^ 2 +
          2 *
            (durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω *
              ξ (n + 1) ω) +
          ξ (n + 1) ω ^ 2 := by
  ext ω
  rw [durrett2019_example_4_2_1_linearRandomWalk_succ]
  change
    (durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω +
        ξ (n + 1) ω) ^ 2 =
      durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω ^ 2 +
          2 *
            (durrett2019_example_4_2_1_linearRandomWalk s0 ξ n ω *
              ξ (n + 1) ω) +
        ξ (n + 1) ω ^ 2
  ring_nf

/--
Durrett 2019, Example 4.2.2: the square of an independent future increment is
independent of the natural filtration of the past, so its conditional
expectation is its ordinary expectation.
-/
theorem durrett2019_example_4_2_2_incrementSquare_condExp_natural_ae_eq_integral_of_iIndepFun
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ) (n : ℕ) :
    μ[(fun ω => ξ (n + 1) ω ^ 2) | Filtration.natural ξ hξ_sm n] =ᵐ[μ]
      fun _ => ∫ ω, ξ (n + 1) ω ^ 2 ∂μ := by
  have hbase_indep :
      _root_.ProbabilityTheory.Indep
        (MeasurableSpace.comap (ξ (n + 1)) (borel ℝ))
        (Filtration.natural ξ hξ_sm n) μ :=
    _root_.ProbabilityTheory.iIndepFun.indep_comap_natural_of_lt
      hξ_sm hξ_indep n.lt_succ_self
  have hsq_comap_le :
      MeasurableSpace.comap (fun ω : Ω => ξ (n + 1) ω ^ 2) (borel ℝ) ≤
        MeasurableSpace.comap (ξ (n + 1)) (borel ℝ) := by
    rw [show (fun ω : Ω => ξ (n + 1) ω ^ 2) =
        (fun x : ℝ => x ^ 2) ∘ ξ (n + 1) by rfl]
    rw [← MeasurableSpace.comap_comp]
    exact MeasurableSpace.comap_mono (measurable_id.pow_const 2).comap_le
  have hsq_indep :
      _root_.ProbabilityTheory.Indep
        (MeasurableSpace.comap (fun ω : Ω => ξ (n + 1) ω ^ 2) (borel ℝ))
        (Filtration.natural ξ hξ_sm n) μ :=
    _root_.ProbabilityTheory.indep_of_indep_of_le_left hbase_indep hsq_comap_le
  simpa using
    (_root_.MeasureTheory.condExp_indep_eq (μ := μ)
      (m₁ := MeasurableSpace.comap (fun ω : Ω => ξ (n + 1) ω ^ 2) (borel ℝ))
      (m₂ := Filtration.natural ξ hξ_sm n)
      (f := fun ω : Ω => ξ (n + 1) ω ^ 2)
      (by exact (hξ_sm (n + 1)).pow 2 |>.measurable.comap_le)
      (Filtration.le _ _)
      (comap_measurable (fun ω : Ω => ξ (n + 1) ω ^ 2)).stronglyMeasurable
      hsq_indep)

/--
Durrett 2019, Example 4.2.2, source conditional-expectation calculation.

This packages the textbook computation after expanding
`S_{n+1}^2`: the adapted term pulls out, the centered cross term vanishes, and
the conditional second moment contributes `σ^2`.
-/
theorem durrett2019_example_4_2_2_quadraticMartingaleProcess_condExp_succ_eq
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {S eta : ℕ -> Ω -> ℝ} {sigmaSq : ℝ}
    (hS_adapted : StronglyAdapted ℱ S)
    (hS_sq_int : ∀ n, Integrable (fun ω => S n ω ^ 2) μ)
    (heta_int : ∀ n, Integrable (eta n) μ)
    (heta_sq_int : ∀ n, Integrable (fun ω => eta n ω ^ 2) μ)
    (hcross_int : ∀ n, Integrable (fun ω => S n ω * eta (n + 1) ω) μ)
    (hStepSq : ∀ n,
      (fun ω => S (n + 1) ω ^ 2) =ᵐ[μ]
        fun ω =>
          S n ω ^ 2 + 2 * (S n ω * eta (n + 1) ω) +
            eta (n + 1) ω ^ 2)
    (heta_cond_zero : ∀ n, μ[eta (n + 1) | ℱ n] =ᵐ[μ] 0)
    (heta_sq_cond_sigma : ∀ n, μ[(fun ω => eta (n + 1) ω ^ 2) | ℱ n] =ᵐ[μ]
      fun _ => sigmaSq)
    (n : ℕ) :
    μ[durrett2019_example_4_2_2_quadraticMartingaleProcess sigmaSq S (n + 1) |
        ℱ n] =ᵐ[μ]
      durrett2019_example_4_2_2_quadraticMartingaleProcess sigmaSq S n := by
  have htwo_cross_int :
      Integrable (fun ω => 2 * (S n ω * eta (n + 1) ω)) μ :=
    (hcross_int n).const_mul 2
  have hPastSq :
      μ[(fun ω => S n ω ^ 2) | ℱ n] = fun ω => S n ω ^ 2 :=
    condExp_of_stronglyMeasurable (ℱ.le n) ((hS_adapted n).pow 2)
      (hS_sq_int n)
  have hTwoCross :
      μ[(fun ω => 2 * (S n ω * eta (n + 1) ω)) | ℱ n] =ᵐ[μ]
        fun ω => 2 * μ[(fun ω => S n ω * eta (n + 1) ω) | ℱ n] ω := by
    filter_upwards
      [condExp_ofNat (μ := μ) (m := ℱ n) 2
        (fun ω => S n ω * eta (n + 1) ω)] with ω hω
    simpa using hω
  have hPullCross :
      μ[(fun ω => S n ω * eta (n + 1) ω) | ℱ n] =ᵐ[μ]
        fun ω => S n ω * μ[eta (n + 1) | ℱ n] ω := by
    filter_upwards
      [condExp_mul_of_stronglyMeasurable_left (hS_adapted n)
        (hcross_int n) (heta_int (n + 1))] with ω hω
    simpa [Pi.mul_apply] using hω
  have hSquareCond :
      μ[(fun ω => S (n + 1) ω ^ 2) | ℱ n] =ᵐ[μ]
        fun ω => S n ω ^ 2 + sigmaSq := by
    refine (condExp_congr_ae (hStepSq n)).trans ?_
    filter_upwards
      [condExp_add ((hS_sq_int n).add htwo_cross_int)
        (heta_sq_int (n + 1)) (ℱ n),
       condExp_add (hS_sq_int n) htwo_cross_int (ℱ n),
       hTwoCross,
       hPullCross,
       heta_cond_zero n,
       heta_sq_cond_sigma n,
       EventuallyEq.of_eq hPastSq] with
      ω hAddAll hAddPast hTwo hPull hZero hSq hPast
    change
      μ[((fun ω => S n ω ^ 2) +
          fun ω => 2 * (S n ω * eta (n + 1) ω)) +
          fun ω => eta (n + 1) ω ^ 2 | ℱ n] ω =
        S n ω ^ 2 + sigmaSq
    rw [hAddAll]
    simp only [Pi.add_apply]
    rw [hAddPast]
    simp only [Pi.add_apply]
    rw [hTwo, hPull, hZero, hSq, hPast]
    simp only [Pi.zero_apply]
    ring_nf
  have hConst :
      μ[(fun _ : Ω => (((n + 1 : ℕ) : ℝ) * sigmaSq)) | ℱ n] =
        fun _ => (((n + 1 : ℕ) : ℝ) * sigmaSq) :=
    condExp_const (μ := μ) (ℱ.le n) (((n + 1 : ℕ) : ℝ) * sigmaSq)
  unfold durrett2019_example_4_2_2_quadraticMartingaleProcess
  change
    μ[(fun ω => S (n + 1) ω ^ 2 - (((n + 1 : ℕ) : ℝ) * sigmaSq)) | ℱ n] =ᵐ[μ]
      fun ω => S n ω ^ 2 - (n : ℝ) * sigmaSq
  refine
    (condExp_sub (hS_sq_int (n + 1))
      (integrable_const (((n + 1 : ℕ) : ℝ) * sigmaSq)) (ℱ n)).trans ?_
  filter_upwards [hSquareCond, EventuallyEq.of_eq hConst] with ω hSq hConstEq
  simp only [Pi.sub_apply]
  rw [hSq, hConstEq]
  rw [Nat.cast_add, Nat.cast_one]
  ring

/--
Durrett 2019, Example 4.2.2, source theorem-sized bridge.

If the textbook one-step square expansion, centered cross-term condition, and
conditional second-moment condition are available, then
`S_n^2 - n * σ^2` is a martingale.
-/
theorem durrett2019_example_4_2_2_quadraticMartingaleProcess_martingale_of_source
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {S eta : ℕ -> Ω -> ℝ} {sigmaSq : ℝ}
    (hS_adapted : StronglyAdapted ℱ S)
    (hS_sq_int : ∀ n, Integrable (fun ω => S n ω ^ 2) μ)
    (heta_int : ∀ n, Integrable (eta n) μ)
    (heta_sq_int : ∀ n, Integrable (fun ω => eta n ω ^ 2) μ)
    (hcross_int : ∀ n, Integrable (fun ω => S n ω * eta (n + 1) ω) μ)
    (hStepSq : ∀ n,
      (fun ω => S (n + 1) ω ^ 2) =ᵐ[μ]
        fun ω =>
          S n ω ^ 2 + 2 * (S n ω * eta (n + 1) ω) +
            eta (n + 1) ω ^ 2)
    (heta_cond_zero : ∀ n, μ[eta (n + 1) | ℱ n] =ᵐ[μ] 0)
    (heta_sq_cond_sigma : ∀ n, μ[(fun ω => eta (n + 1) ω ^ 2) | ℱ n] =ᵐ[μ]
      fun _ => sigmaSq) :
    Martingale
      (durrett2019_example_4_2_2_quadraticMartingaleProcess sigmaSq S)
      ℱ μ := by
  refine durrett2019_section_4_2_real_martingale_nat_of_condExp_succ
    (durrett2019_example_4_2_2_quadraticMartingaleProcess_stronglyAdapted
      hS_adapted sigmaSq)
    (durrett2019_example_4_2_2_quadraticMartingaleProcess_integrable
      (μ := μ) sigmaSq hS_sq_int)
    ?_
  intro n
  exact durrett2019_example_4_2_2_quadraticMartingaleProcess_condExp_succ_eq
    (μ := μ) (ℱ := ℱ) hS_adapted hS_sq_int heta_int heta_sq_int
    hcross_int hStepSq heta_cond_zero heta_sq_cond_sigma n

/--
Durrett 2019, Example 4.2.2: the natural-filtration quadratic martingale for
independent mean-zero increments with common second moment `σ^2`.
-/
theorem durrett2019_example_4_2_2_linearRandomWalk_quadraticMartingale_of_iIndepFun_zeroMean_commonSecondMoment
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    (s0 sigmaSq : ℝ) {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_memLp_two : ∀ n, MemLp (ξ n) 2 μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (hξ_mean_zero : ∀ n, (∫ ω, ξ n ω ∂μ) = 0)
    (hξ_second_moment : ∀ n, (∫ ω, ξ n ω ^ 2 ∂μ) = sigmaSq) :
    Martingale
      (durrett2019_example_4_2_2_quadraticMartingaleProcess sigmaSq
        (durrett2019_example_4_2_1_linearRandomWalk s0 ξ))
      (Filtration.natural ξ hξ_sm) μ := by
  have hξ_int : ∀ n, Integrable (ξ n) μ :=
    fun n => (hξ_memLp_two n).integrable one_le_two
  have hS_memLp_two :
      ∀ n,
        MemLp (durrett2019_example_4_2_1_linearRandomWalk s0 ξ n) 2 μ :=
    durrett2019_example_4_2_1_linearRandomWalk_memLp_two
      (μ := μ) (s0 := s0) hξ_memLp_two
  refine durrett2019_example_4_2_2_quadraticMartingaleProcess_martingale_of_source
    (S := durrett2019_example_4_2_1_linearRandomWalk s0 ξ) (eta := ξ)
    (ℱ := Filtration.natural ξ hξ_sm)
    (durrett2019_example_4_2_1_linearRandomWalk_stronglyAdapted_natural
      (s0 := s0) hξ_sm)
    (fun n => (hS_memLp_two n).integrable_sq)
    hξ_int
    (fun n => (hξ_memLp_two n).integrable_sq)
    (fun n => MemLp.integrable_mul (hS_memLp_two n) (hξ_memLp_two (n + 1)))
    (fun n =>
      EventuallyEq.of_eq
        (durrett2019_example_4_2_2_linearRandomWalk_square_succ s0 ξ n))
    ?_
    ?_
  · intro n
    filter_upwards
      [durrett2019_example_4_2_1_increment_condExp_natural_ae_eq_integral_of_iIndepFun
        (μ := μ) hξ_sm hξ_indep n] with ω hω
    simpa [hξ_mean_zero (n + 1)] using hω
  · intro n
    filter_upwards
      [durrett2019_example_4_2_2_incrementSquare_condExp_natural_ae_eq_integral_of_iIndepFun
        (μ := μ) hξ_sm hξ_indep n] with ω hω
    simpa [hξ_second_moment (n + 1)] using hω

/-! ## Durrett, Example 4.2.3 -/

/--
Durrett 2019, Example 4.2.3, the product martingale candidate
`M_n = Y_1 * ... * Y_n`.

The Lean sequence `Y` is zero-indexed, so the textbook factor `Y_i` is
represented by `Y i` and the finite product uses `Y (k + 1)`.
-/
def durrett2019_example_4_2_3_productProcess
    {Ω : Type*} (Y : ℕ -> Ω -> ℝ) : ℕ -> Ω -> ℝ :=
  fun n => ∏ k ∈ Finset.range n, Y (k + 1)

@[simp]
theorem durrett2019_example_4_2_3_productProcess_zero
    {Ω : Type*} (Y : ℕ -> Ω -> ℝ) :
    durrett2019_example_4_2_3_productProcess Y 0 = fun _ => 1 := by
  ext ω
  simp [durrett2019_example_4_2_3_productProcess]

/--
Durrett 2019, Example 4.2.3: product-process one-step identity
`M_{n+1} = M_n * Y_{n+1}`.
-/
theorem durrett2019_example_4_2_3_productProcess_succ
    {Ω : Type*} (Y : ℕ -> Ω -> ℝ) (n : ℕ) :
    durrett2019_example_4_2_3_productProcess Y (n + 1) =
      durrett2019_example_4_2_3_productProcess Y n * Y (n + 1) := by
  ext ω
  simp [durrett2019_example_4_2_3_productProcess, Finset.prod_range_succ]

/--
Durrett 2019, Example 4.2.3: the finite product is adapted to the natural
filtration of its factors.
-/
theorem durrett2019_example_4_2_3_productProcess_stronglyAdapted_natural
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {Y : ℕ -> Ω -> ℝ}
    (hY_sm : ∀ n, StronglyMeasurable (Y n)) :
    StronglyAdapted (Filtration.natural Y hY_sm)
      (durrett2019_example_4_2_3_productProcess Y) := by
  intro n
  change StronglyMeasurable[Filtration.natural Y hY_sm n]
    (∏ k ∈ Finset.range n, Y (k + 1))
  refine Finset.stronglyMeasurable_prod (s := Finset.range n)
    (f := fun k => Y (k + 1)) fun k hk => ?_
  exact
    (Filtration.stronglyAdapted_natural (u := Y) hY_sm).stronglyMeasurable_le
      (Nat.succ_le_of_lt (Finset.mem_range.mp hk))

/--
Durrett 2019, Example 4.2.3: finite products of independent integrable factors
are integrable.
-/
theorem durrett2019_example_4_2_3_productProcess_integrable_of_iIndepFun
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Y : ℕ -> Ω -> ℝ}
    (hY_sm : ∀ n, StronglyMeasurable (Y n))
    (hY_int : ∀ n, Integrable (Y n) μ)
    (hY_indep : _root_.ProbabilityTheory.iIndepFun Y μ) :
    ∀ n, Integrable (durrett2019_example_4_2_3_productProcess Y n) μ := by
  have hY_shift_indep :
      _root_.ProbabilityTheory.iIndepFun (fun k => Y (k + 1)) μ :=
    _root_.ProbabilityTheory.iIndepFun.precomp Nat.succ_injective hY_indep
  intro n
  induction n with
  | zero =>
      simp
  | succ n ih =>
      have hpast_future :
          _root_.ProbabilityTheory.IndepFun
            (durrett2019_example_4_2_3_productProcess Y n) (Y (n + 1)) μ := by
        simpa [durrett2019_example_4_2_3_productProcess] using
          hY_shift_indep.indepFun_prod_range_succ
            (fun k => (hY_sm (k + 1)).measurable) n
      have hmul_int :
          Integrable
            (durrett2019_example_4_2_3_productProcess Y n * Y (n + 1)) μ :=
        hpast_future.integrable_mul ih (hY_int (n + 1))
      simpa [durrett2019_example_4_2_3_productProcess_succ] using hmul_int

/--
Durrett 2019, Example 4.2.3, source conditional-expectation calculation:
`E(M_{n+1} | F_n) = M_n * E(Y_{n+1} | F_n)`.
-/
theorem durrett2019_example_4_2_3_productProcess_condExp_succ_eq_past_mul_incrementMean
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {M Y : ℕ -> Ω -> ℝ}
    (hM_adapted : StronglyAdapted ℱ M)
    (hY_int : ∀ n, Integrable (Y n) μ)
    (hMY_int : ∀ n, Integrable (M n * Y (n + 1)) μ)
    (hStep : ∀ n, M (n + 1) =ᵐ[μ] M n * Y (n + 1))
    (hY_cond : ∀ n, μ[Y (n + 1) | ℱ n] =ᵐ[μ]
      fun _ => ∫ ω, Y (n + 1) ω ∂μ) (n : ℕ) :
    μ[M (n + 1) | ℱ n] =ᵐ[μ]
      fun ω => M n ω * ∫ ω', Y (n + 1) ω' ∂μ := by
  refine (condExp_congr_ae (hStep n)).trans ?_
  refine (condExp_mul_of_stronglyMeasurable_left
    (hM_adapted n) (hMY_int n) (hY_int (n + 1))).trans ?_
  simpa [Pi.mul_apply] using EventuallyEq.rfl.mul (hY_cond n)

/--
Durrett 2019, Example 4.2.3: the product process is a martingale when the
factors are independent, integrable, and have mean one.
-/
theorem durrett2019_example_4_2_3_productProcess_martingale_of_iIndepFun_meanOne
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {Y : ℕ -> Ω -> ℝ}
    (hY_sm : ∀ n, StronglyMeasurable (Y n))
    (hY_int : ∀ n, Integrable (Y n) μ)
    (hY_indep : _root_.ProbabilityTheory.iIndepFun Y μ)
    (hY_mean_one : ∀ n, (∫ ω, Y n ω ∂μ) = 1) :
    Martingale
      (durrett2019_example_4_2_3_productProcess Y)
      (Filtration.natural Y hY_sm) μ := by
  have hM_int :
      ∀ n, Integrable (durrett2019_example_4_2_3_productProcess Y n) μ :=
    durrett2019_example_4_2_3_productProcess_integrable_of_iIndepFun
      (μ := μ) hY_sm hY_int hY_indep
  have hY_shift_indep :
      _root_.ProbabilityTheory.iIndepFun (fun k => Y (k + 1)) μ :=
    _root_.ProbabilityTheory.iIndepFun.precomp Nat.succ_injective hY_indep
  refine durrett2019_section_4_2_real_martingale_nat_of_condExp_succ
    (durrett2019_example_4_2_3_productProcess_stronglyAdapted_natural hY_sm)
    hM_int
    ?_
  intro n
  have hMY_int :
      ∀ n, Integrable
        (durrett2019_example_4_2_3_productProcess Y n * Y (n + 1)) μ :=
    fun n => by
      have hpast_future_n :
          _root_.ProbabilityTheory.IndepFun
            (durrett2019_example_4_2_3_productProcess Y n) (Y (n + 1)) μ := by
        simpa [durrett2019_example_4_2_3_productProcess] using
          hY_shift_indep.indepFun_prod_range_succ
            (fun k => (hY_sm (k + 1)).measurable) n
      exact hpast_future_n.integrable_mul (hM_int n) (hY_int (n + 1))
  filter_upwards
    [durrett2019_example_4_2_3_productProcess_condExp_succ_eq_past_mul_incrementMean
      (μ := μ) (ℱ := Filtration.natural Y hY_sm)
      (M := durrett2019_example_4_2_3_productProcess Y) (Y := Y)
      (durrett2019_example_4_2_3_productProcess_stronglyAdapted_natural hY_sm)
      hY_int
      hMY_int
      (fun n =>
        EventuallyEq.of_eq
          (durrett2019_example_4_2_3_productProcess_succ Y n))
      (fun n =>
        durrett2019_example_4_2_1_increment_condExp_natural_ae_eq_integral_of_iIndepFun
          (μ := μ) hY_sm hY_indep n)
      n] with ω hω
  simpa [hY_mean_one (n + 1)] using hω

/--
Durrett 2019, Example 4.2.3, normalized exponential factor
`Y_i = exp(θ ξ_i) / φ(θ)`.
-/
noncomputable def durrett2019_example_4_2_3_normalizedExponentialFactor
    {Ω : Type*} (theta phi : ℝ) (ξ : ℕ -> Ω -> ℝ) : ℕ -> Ω -> ℝ :=
  fun n ω => Real.exp (theta * ξ n ω) / phi

/--
Durrett 2019, Example 4.2.3: normalized exponential factors are strongly
measurable when the increments are.
-/
theorem durrett2019_example_4_2_3_normalizedExponentialFactor_stronglyMeasurable
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ξ : ℕ -> Ω -> ℝ}
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n)) (theta phi : ℝ) :
    ∀ n, StronglyMeasurable
      (durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ n) := by
  intro n
  exact ((((hξ_sm n).const_mul theta).measurable.exp).stronglyMeasurable).div
    stronglyMeasurable_const

/--
Durrett 2019, Example 4.2.3: coordinatewise measurable normalization preserves
independence of the exponential factors.
-/
theorem durrett2019_example_4_2_3_normalizedExponentialFactor_iIndepFun
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω}
    {ξ : ℕ -> Ω -> ℝ} (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (theta phi : ℝ) :
    _root_.ProbabilityTheory.iIndepFun
      (durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ) μ := by
  simpa [durrett2019_example_4_2_3_normalizedExponentialFactor,
    Function.comp_def] using
    (durrett2019_theorem_2_1_10_iIndepFun_comp
      (P := μ) (X := ξ) hξ_indep
      (f := fun _ : ℕ => fun x : ℝ => Real.exp (theta * x) / phi)
      (fun _ => (Real.measurable_exp.comp (measurable_const.mul measurable_id)).div_const phi))

/--
Durrett 2019, Example 4.2.3: integrability of normalized exponential factors
from integrability of the exponential moments.
-/
theorem durrett2019_example_4_2_3_normalizedExponentialFactor_integrable
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω}
    {ξ : ℕ -> Ω -> ℝ} (theta phi : ℝ)
    (hξ_exp_int : ∀ n, Integrable (fun ω => Real.exp (theta * ξ n ω)) μ) :
    ∀ n, Integrable
      (durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ n) μ :=
  fun n => (hξ_exp_int n).div_const phi

/--
Durrett 2019, Example 4.2.3: if the common exponential moment is `φ`, then
the normalized factors have mean one.
-/
theorem durrett2019_example_4_2_3_normalizedExponentialFactor_integral_eq_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ξ : ℕ -> Ω -> ℝ} {theta phi : ℝ} (hphi_ne : phi ≠ 0)
    (hξ_exp_moment : ∀ n, (∫ ω, Real.exp (theta * ξ n ω) ∂μ) = phi) :
    ∀ n,
      (∫ ω,
        durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ n ω ∂μ) = 1 := by
  intro n
  change (∫ ω, Real.exp (theta * ξ n ω) / phi ∂μ) = 1
  rw [integral_div]
  rw [hξ_exp_moment n]
  exact div_self hphi_ne

/--
Durrett 2019, Example 4.2.3: finite-product display
`∏ exp(θ ξ_i) / φ = exp(θ S_n) / φ^n`.

Here `S_n` is the zero-initial random walk `ξ_1 + ... + ξ_n`.
-/
theorem durrett2019_example_4_2_3_normalizedExponentialProduct_eq_exp_linearRandomWalk
    {Ω : Type*} (theta phi : ℝ) (ξ : ℕ -> Ω -> ℝ) (n : ℕ) :
    durrett2019_example_4_2_3_productProcess
        (durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ) n =
      fun ω =>
        Real.exp
          (theta * durrett2019_example_4_2_1_linearRandomWalk 0 ξ n ω) /
          phi ^ n := by
  ext ω
  simp [durrett2019_example_4_2_3_productProcess,
    durrett2019_example_4_2_3_normalizedExponentialFactor,
    durrett2019_example_4_2_1_linearRandomWalk, Finset.prod_div_distrib,
    Finset.prod_const, Real.exp_sum, Finset.mul_sum]

/--
Durrett 2019, Example 4.2.3, normalized exponential martingale.

If the increments are independent and the exponential moment at `θ` is the
nonzero common value `φ`, then the normalized exponential factors form the
product martingale whose display is
`exp(θ S_n) / φ^n`.
-/
theorem durrett2019_example_4_2_3_normalizedExponentialProduct_martingale_of_iIndepFun
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ξ : ℕ -> Ω -> ℝ} {theta phi : ℝ}
    (hphi_ne : phi ≠ 0)
    (hξ_sm : ∀ n, StronglyMeasurable (ξ n))
    (hξ_exp_int : ∀ n, Integrable (fun ω => Real.exp (theta * ξ n ω)) μ)
    (hξ_indep : _root_.ProbabilityTheory.iIndepFun ξ μ)
    (hξ_exp_moment : ∀ n, (∫ ω, Real.exp (theta * ξ n ω) ∂μ) = phi) :
    Martingale
      (durrett2019_example_4_2_3_productProcess
        (durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ))
      (Filtration.natural
        (durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ)
        (durrett2019_example_4_2_3_normalizedExponentialFactor_stronglyMeasurable
          hξ_sm theta phi)) μ := by
  refine durrett2019_example_4_2_3_productProcess_martingale_of_iIndepFun_meanOne
    (Y := durrett2019_example_4_2_3_normalizedExponentialFactor theta phi ξ)
    (durrett2019_example_4_2_3_normalizedExponentialFactor_stronglyMeasurable
      hξ_sm theta phi)
    (durrett2019_example_4_2_3_normalizedExponentialFactor_integrable
      (μ := μ) theta phi hξ_exp_int)
    (durrett2019_example_4_2_3_normalizedExponentialFactor_iIndepFun
      (μ := μ) hξ_indep theta phi)
    ?_
  exact durrett2019_example_4_2_3_normalizedExponentialFactor_integral_eq_one
    (μ := μ) hphi_ne hξ_exp_moment

/-! ## Durrett, Section 4.3 -/

/--
Durrett 2019, Theorem 4.3.1 support: the first time the martingale falls
below `-K`.
-/
noncomputable def durrett2019_theorem_4_3_1_firstBelow
    {Ω : Type*} (X : ℕ -> Ω -> ℝ) (K : ℝ) : Ω -> ℕ∞ :=
  hittingAfter X (Set.Iic (-K)) 0

/--
Durrett 2019, Theorem 4.3.1 support: the first-below time is a stopping time
for an adapted process.
-/
theorem durrett2019_theorem_4_3_1_firstBelow_isStoppingTime
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (K : ℝ) (hX_adapted : StronglyAdapted ℱ X) :
    IsStoppingTime ℱ (durrett2019_theorem_4_3_1_firstBelow X K) :=
  hX_adapted.adapted.isStoppingTime_hittingAfter measurableSet_Iic

/--
Durrett 2019, Theorem 4.3.1 support: for the first time `N` at which
`X_N ≤ -K`, bounded increments imply the stopped process is bounded below by
`-K - M`, equivalently `X_{n ∧ N} + K + M ≥ 0`.
-/
theorem durrett2019_theorem_4_3_1_firstBelow_stopped_shift_nonneg
    {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : ℕ -> Ω -> ℝ} {K M : ℝ}
    (hK_nonneg : 0 ≤ K) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ n, 0 ≤ᵐ[μ] fun ω =>
      stoppedProcess X (durrett2019_theorem_4_3_1_firstBelow X K) n ω + (K + M) := by
  intro n
  filter_upwards [hX0, hinc] with ω hX0ω hincω
  change (0 : ℝ) ≤
    stoppedProcess X (durrett2019_theorem_4_3_1_firstBelow X K) n ω + (K + M)
  rw [durrett2019_theorem_4_3_1_firstBelow, stoppedProcess]
  by_cases h_zero :
      (min (n : ℕ∞) (hittingAfter X (Set.Iic (-K)) 0 ω)).untopA = 0
  · change (0 : ℝ) ≤
      X ((min (n : ℕ∞) (hittingAfter X (Set.Iic (-K)) 0 ω)).untopA) ω + (K + M)
    rw [h_zero, hX0ω]
    linarith
  · obtain ⟨k, hk⟩ := Nat.exists_eq_add_one_of_ne_zero h_zero
    change (0 : ℝ) ≤
      X ((min (n : ℕ∞) (hittingAfter X (Set.Iic (-K)) 0 ω)).untopA) ω + (K + M)
    rw [hk]
    have hk_lt_min :
        (k : ℕ∞) < min (n : ℕ∞) (hittingAfter X (Set.Iic (-K)) 0 ω) := by
      have h_top : min (n : ℕ∞) (hittingAfter X (Set.Iic (-K)) 0 ω) ≠ ⊤ :=
        ne_top_of_le_ne_top (by simp) (min_le_left _ _)
      lift min (n : ℕ∞) (hittingAfter X (Set.Iic (-K)) 0 ω) to ℕ using h_top with p
      simp only [untopD_coe_enat, Nat.cast_lt, gt_iff_lt] at *
      omega
    have hk_lt_hit : (k : ℕ∞) < hittingAfter X (Set.Iic (-K)) 0 ω :=
      hk_lt_min.trans_le (min_le_right _ _)
    have hprev_not : X k ω ∉ Set.Iic (-K) :=
      notMem_of_lt_hittingAfter hk_lt_hit (Nat.zero_le k)
    have hprev_gt : -K < X k ω := by
      simpa [Set.mem_Iic, not_le] using hprev_not
    have hdiff_ge : -M ≤ X (k + 1) ω - X k ω :=
      (abs_le.mp (hincω k)).1
    linarith

/--
Durrett 2019, Theorem 4.3.1 support: if a stopped martingale becomes
nonnegative after adding a constant, then the stopped process converges almost
surely.

This packages the proof step where Durrett applies Theorem 4.2.12 to
`X_{n ∧ N} + K + M`.
-/
theorem durrett2019_theorem_4_3_1_stopped_shifted_exists_ae_tendsto
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {N : Ω -> ℕ∞} {c : ℝ}
    (hX : Martingale X ℱ μ) (hN : IsStoppingTime ℱ N)
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] fun ω => stoppedProcess X N n ω + c) :
    ∀ᵐ ω ∂μ, ∃ z : ℝ,
      Tendsto (fun n => stoppedProcess X N n ω) atTop (𝓝 z) := by
  have hstopped : Martingale (stoppedProcess X N) ℱ μ :=
    durrett2019_theorem_4_2_9_martingale_stoppedProcess hX hN
  have hshift : Martingale (fun n ω => stoppedProcess X N n ω + c) ℱ μ := by
    simpa [Pi.add_apply] using hstopped.add (martingale_const ℱ μ c)
  have hconv :
      ∀ᵐ ω ∂μ, ∃ z : ℝ,
        Tendsto (fun n => stoppedProcess X N n ω + c) atTop (𝓝 z) :=
    durrett2019_theorem_4_2_12_nonnegative_supermartingale_exists_ae_tendsto
      hshift.supermartingale h_nonneg
  filter_upwards [hconv] with ω hω
  rcases hω with ⟨z, hz⟩
  refine ⟨z - c, ?_⟩
  simpa [sub_eq_add_neg, add_assoc] using hz.sub_const c

/--
Durrett 2019, Theorem 4.3.1 support: convergence of a stopped process transfers
to the original process on the event that the stopping time never occurs.
-/
theorem durrett2019_theorem_4_3_1_stopped_tendsto_on_survival
    {Ω : Type*} [MeasurableSpace Ω] {X : ℕ -> Ω -> ℝ} {N : Ω -> ℕ∞} {μ : Measure Ω}
    (hconv : ∀ᵐ ω ∂μ, ∃ z : ℝ,
      Tendsto (fun n => stoppedProcess X N n ω) atTop (𝓝 z)) :
    ∀ᵐ ω ∂μ, N ω = ⊤ ->
      ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) := by
  filter_upwards [hconv] with ω hω hN_top
  rcases hω with ⟨z, hz⟩
  refine ⟨z, ?_⟩
  have heq : (fun n => stoppedProcess X N n ω) = fun n => X n ω := by
    funext n
    exact stoppedProcess_eq_of_le (by rw [hN_top]; exact le_top)
  simpa [heq] using hz

/--
Durrett 2019, Theorem 4.3.1 stopped-below bridge: a nonnegative shifted
stopped martingale converges on the event that the stopping time is infinite.
-/
theorem durrett2019_theorem_4_3_1_stopped_shifted_tendsto_on_survival
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {N : Ω -> ℕ∞} {c : ℝ}
    (hX : Martingale X ℱ μ) (hN : IsStoppingTime ℱ N)
    (h_nonneg : ∀ n, 0 ≤ᵐ[μ] fun ω => stoppedProcess X N n ω + c) :
    ∀ᵐ ω ∂μ, N ω = ⊤ ->
      ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) :=
  durrett2019_theorem_4_3_1_stopped_tendsto_on_survival
    (durrett2019_theorem_4_3_1_stopped_shifted_exists_ae_tendsto
      hX hN h_nonneg)

/--
Durrett 2019, Theorem 4.3.1 first-below instantiation: if `X_0 = 0` and the
increments are bounded by `M`, then applying Theorem 4.2.12 to
`X_{n ∧ N} + K + M` gives convergence on the event that the first-below time
`N = inf {n : X_n ≤ -K}` is infinite.
-/
theorem durrett2019_theorem_4_3_1_firstBelow_tendsto_on_survival
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {K M : ℝ}
    (hX : Martingale X ℱ μ) (hK_nonneg : 0 ≤ K) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ, durrett2019_theorem_4_3_1_firstBelow X K ω = ⊤ ->
      ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) :=
  durrett2019_theorem_4_3_1_stopped_shifted_tendsto_on_survival
    (N := durrett2019_theorem_4_3_1_firstBelow X K) (c := K + M)
    hX
    (durrett2019_theorem_4_3_1_firstBelow_isStoppingTime K hX.stronglyAdapted)
    (durrett2019_theorem_4_3_1_firstBelow_stopped_shift_nonneg
      hK_nonneg hM_nonneg hX0 hinc)

/--
Durrett 2019, Theorem 4.3.1 support: if a path stays strictly above `-K`,
then the first-below stopping time is infinite.
-/
theorem durrett2019_theorem_4_3_1_firstBelow_eq_top_of_forall_neg_lt
    {Ω : Type*} {X : ℕ -> Ω -> ℝ} {K : ℝ} {ω : Ω}
    (h_above : ∀ n, -K < X n ω) :
    durrett2019_theorem_4_3_1_firstBelow X K ω = ⊤ := by
  rw [durrett2019_theorem_4_3_1_firstBelow]
  exact hittingAfter_eq_top_iff.mpr fun j _hj => by
    simpa [Set.mem_Iic, not_le] using h_above j

/--
Durrett 2019, Theorem 4.3.1 bounded-below bridge: if `X_0 = 0` and the
increments are bounded, then `X_n` converges on every path whose range is
bounded below.

This packages Durrett's step "letting `K -> ∞`, the limit exists on
`{liminf X_n > -∞}`" in the countable-threshold form used by Lean.
-/
theorem durrett2019_theorem_4_3_1_tendsto_on_bddBelow_range
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {M : ℝ}
    (hX : Martingale X ℱ μ) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ, BddBelow (Set.range fun n => X n ω) ->
      ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) := by
  have hsurv_all :
      ∀ᵐ ω ∂μ, ∀ k : ℕ,
        durrett2019_theorem_4_3_1_firstBelow X (k : ℝ) ω = ⊤ ->
          ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) := by
    rw [ae_all_iff]
    intro k
    exact
      durrett2019_theorem_4_3_1_firstBelow_tendsto_on_survival
        (X := X) (K := (k : ℝ)) (M := M) hX (by positivity)
        hM_nonneg hX0 hinc
  filter_upwards [hsurv_all] with ω hsurvω hbdd
  rcases hbdd with ⟨b, hb⟩
  obtain ⟨k, hk⟩ := exists_nat_gt (-b)
  have hneg_lt_b : -(k : ℝ) < b := by
    linarith
  have h_above : ∀ n, -(k : ℝ) < X n ω := by
    intro n
    exact hneg_lt_b.trans_le (hb ⟨n, rfl⟩)
  exact hsurvω k
    (durrett2019_theorem_4_3_1_firstBelow_eq_top_of_forall_neg_lt h_above)

/--
Durrett 2019, Theorem 4.3.1 bounded-above bridge: applying the bounded-below
bridge to the negated martingale gives convergence on every path whose range is
bounded above.
-/
theorem durrett2019_theorem_4_3_1_tendsto_on_bddAbove_range
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {M : ℝ}
    (hX : Martingale X ℱ μ) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ, BddAbove (Set.range fun n => X n ω) ->
      ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) := by
  have hneg0 : ∀ᵐ ω ∂μ, (-X) 0 ω = 0 := by
    filter_upwards [hX0] with ω hω
    simp [hω]
  have hneginc : ∀ᵐ ω ∂μ, ∀ i, |(-X) (i + 1) ω - (-X) i ω| ≤ M := by
    filter_upwards [hinc] with ω hω i
    have hstep : (-X) (i + 1) ω - (-X) i ω = -(X (i + 1) ω - X i ω) := by
      simp only [Pi.neg_apply]
      ring
    rw [hstep, abs_neg]
    exact hω i
  have hneg_conv :
      ∀ᵐ ω ∂μ, BddBelow (Set.range fun n => (-X) n ω) ->
        ∃ z : ℝ, Tendsto (fun n => (-X) n ω) atTop (𝓝 z) :=
    durrett2019_theorem_4_3_1_tendsto_on_bddBelow_range
      (X := -X) (M := M) hX.neg hM_nonneg hneg0 hneginc
  filter_upwards [hneg_conv] with ω hconvω hbddAbove
  have hbddBelow_neg : BddBelow (Set.range fun n => (-X) n ω) := by
    rcases hbddAbove with ⟨b, hb⟩
    refine ⟨-b, ?_⟩
    rintro _ ⟨n, rfl⟩
    exact neg_le_neg (hb ⟨n, rfl⟩)
  rcases hconvω hbddBelow_neg with ⟨z, hz⟩
  exact ⟨-z, by simpa [Pi.neg_apply] using hz.neg⟩

/--
Durrett 2019, Theorem 4.3.1 one-sided-bounded bridge: a bounded-increment
martingale with `X_0 = 0` converges on paths that are bounded below or bounded
above.
-/
theorem durrett2019_theorem_4_3_1_tendsto_on_bddBelow_or_bddAbove_range
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {M : ℝ}
    (hX : Martingale X ℱ μ) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ,
      (BddBelow (Set.range fun n => X n ω) ∨ BddAbove (Set.range fun n => X n ω)) ->
        ∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z) := by
  have hbelow :=
    durrett2019_theorem_4_3_1_tendsto_on_bddBelow_range
      (X := X) (M := M) hX hM_nonneg hX0 hinc
  have habove :=
    durrett2019_theorem_4_3_1_tendsto_on_bddAbove_range
      (X := X) (M := M) hX hM_nonneg hX0 hinc
  filter_upwards [hbelow, habove] with ω hbelowω haboveω hbounded
  rcases hbounded with hbounded | hbounded
  · exact hbelowω hbounded
  · exact haboveω hbounded

/--
Durrett 2019, Theorem 4.3.1 range-form dichotomy: a bounded-increment
martingale with `X_0 = 0` either converges to a finite real limit, or its range
is unbounded both below and above.

This is the Lean range-form backbone for Durrett's event
`C ∪ D`, before rewriting the unbounded-range side as the textbook
`liminf = -∞` and `limsup = +∞` display.
-/
theorem durrett2019_theorem_4_3_1_converges_or_unbounded_range
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {M : ℝ}
    (hX : Martingale X ℱ μ) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ,
      (∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z)) ∨
        (¬ BddBelow (Set.range fun n => X n ω) ∧
          ¬ BddAbove (Set.range fun n => X n ω)) := by
  have honeSided :=
    durrett2019_theorem_4_3_1_tendsto_on_bddBelow_or_bddAbove_range
      (X := X) (M := M) hX hM_nonneg hX0 hinc
  filter_upwards [honeSided] with ω honeSidedω
  by_cases hbounded :
      BddBelow (Set.range fun n => X n ω) ∨ BddAbove (Set.range fun n => X n ω)
  · exact Or.inl (honeSidedω hbounded)
  · exact Or.inr
      ⟨fun hbelow => hbounded (Or.inl hbelow),
        fun habove => hbounded (Or.inr habove)⟩

/--
Durrett 2019, Theorem 4.3.1 threshold-form oscillation: a bounded-increment
martingale with `X_0 = 0` either converges to a finite real limit, or it visits
below and above every real threshold.

This is the order-threshold form behind Durrett's
`liminf X_n = -∞` and `limsup X_n = +∞` display.
-/
theorem durrett2019_theorem_4_3_1_converges_or_crosses_all_thresholds
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {M : ℝ}
    (hX : Martingale X ℱ μ) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ,
      (∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z)) ∨
        ((∀ a : ℝ, ∃ n : ℕ, X n ω < a) ∧
          ∀ a : ℝ, ∃ n : ℕ, a < X n ω) := by
  have hrange :=
    durrett2019_theorem_4_3_1_converges_or_unbounded_range
      (X := X) (M := M) hX hM_nonneg hX0 hinc
  filter_upwards [hrange] with ω hω
  rcases hω with hconv | ⟨hnotBelow, hnotAbove⟩
  · exact Or.inl hconv
  · right
    constructor
    · intro a
      rcases (not_bddBelow_iff.mp hnotBelow a) with ⟨y, hy_mem, hy_lt⟩
      rcases hy_mem with ⟨n, rfl⟩
      exact ⟨n, hy_lt⟩
    · intro a
      rcases (not_bddAbove_iff.mp hnotAbove a) with ⟨y, hy_mem, hy_lt⟩
      rcases hy_mem with ⟨n, rfl⟩
      exact ⟨n, hy_lt⟩

/--
If the range of a real sequence is not bounded below, then every real lower
threshold is crossed arbitrarily late.
-/
theorem durrett2019_frequently_lt_atTop_of_not_bddBelow_range
    {u : ℕ -> ℝ} (h : ¬ BddBelow (Set.range u)) (a : ℝ) :
    ∃ᶠ n in atTop, u n < a := by
  rw [frequently_atTop]
  intro N
  by_contra hN
  push Not at hN
  have htail : ∀ n, N ≤ n -> a ≤ u n := fun n hn => hN n hn
  have hprefixFinite : (Set.Iio N : Set ℕ).Finite := Set.finite_Iio N
  have hprefix : BddBelow (u '' Set.Iio N) := hprefixFinite.image u |>.bddBelow
  rcases hprefix with ⟨b, hb⟩
  have hall : BddBelow (Set.range u) := by
    refine ⟨min a b, ?_⟩
    rintro y ⟨n, rfl⟩
    by_cases hn : n < N
    · exact (min_le_right _ _).trans (hb ⟨n, hn, rfl⟩)
    · exact (min_le_left _ _).trans (htail n (le_of_not_gt hn))
  exact h hall

/--
If the range of a real sequence is not bounded above, then every real upper
threshold is crossed arbitrarily late.
-/
theorem durrett2019_frequently_atTop_lt_of_not_bddAbove_range
    {u : ℕ -> ℝ} (h : ¬ BddAbove (Set.range u)) (a : ℝ) :
    ∃ᶠ n in atTop, a < u n := by
  rw [frequently_atTop]
  intro N
  by_contra hN
  push Not at hN
  have htail : ∀ n, N ≤ n -> u n ≤ a := fun n hn => hN n hn
  have hprefixFinite : (Set.Iio N : Set ℕ).Finite := Set.finite_Iio N
  have hprefix : BddAbove (u '' Set.Iio N) := hprefixFinite.image u |>.bddAbove
  rcases hprefix with ⟨b, hb⟩
  have hall : BddAbove (Set.range u) := by
    refine ⟨max a b, ?_⟩
    rintro y ⟨n, rfl⟩
    by_cases hn : n < N
    · exact (hb ⟨n, hn, rfl⟩).trans (le_max_right _ _)
    · exact (htail n (le_of_not_gt hn)).trans (le_max_left _ _)
  exact h hall

/--
Arbitrarily late crossings below and above every real threshold are exactly the
extended-real `liminf = -∞` and `limsup = +∞` display used in Durrett.
-/
theorem durrett2019_ereal_liminf_limsup_of_frequently_crosses
    {u : ℕ -> ℝ}
    (hbelow : ∀ a : ℝ, ∃ᶠ n in atTop, u n < a)
    (habove : ∀ a : ℝ, ∃ᶠ n in atTop, a < u n) :
    liminf (fun n => (u n : EReal)) atTop = ⊥ ∧
      limsup (fun n => (u n : EReal)) atTop = ⊤ := by
  constructor
  · exact (EReal.eq_bot_iff_forall_lt _).2 fun y => by
      have hle :
          liminf (fun n => (u n : EReal)) atTop ≤ ((y - 1 : ℝ) : EReal) := by
        exact Filter.liminf_le_of_frequently_le' ((hbelow (y - 1)).mono fun n hn => by
          exact EReal.coe_le_coe_iff.mpr hn.le)
      have hlt : ((y - 1 : ℝ) : EReal) < (y : EReal) :=
        EReal.coe_lt_coe_iff.mpr (sub_one_lt y)
      exact lt_of_le_of_lt hle hlt
  · exact (EReal.eq_top_iff_forall_lt _).2 fun y => by
      have hle :
          ((y + 1 : ℝ) : EReal) ≤ limsup (fun n => (u n : EReal)) atTop := by
        exact Filter.le_limsup_of_frequently_le' ((habove (y + 1)).mono fun n hn => by
          exact EReal.coe_le_coe_iff.mpr hn.le)
      have hlt : (y : EReal) < ((y + 1 : ℝ) : EReal) :=
        EReal.coe_lt_coe_iff.mpr (lt_add_one y)
      exact lt_of_lt_of_le hlt hle

/--
Durrett 2019, Theorem 4.3.1 extended-real liminf/limsup display: a
bounded-increment martingale with `X_0 = 0` either converges to a finite real
limit, or its extended-real `liminf` is `-∞` and its extended-real `limsup` is
`+∞`.
-/
theorem durrett2019_theorem_4_3_1_converges_or_ereal_liminf_limsup
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} {M : ℝ}
    (hX : Martingale X ℱ μ) (hM_nonneg : 0 ≤ M)
    (hX0 : ∀ᵐ ω ∂μ, X 0 ω = 0)
    (hinc : ∀ᵐ ω ∂μ, ∀ i, |X (i + 1) ω - X i ω| ≤ M) :
    ∀ᵐ ω ∂μ,
      (∃ z : ℝ, Tendsto (fun n => X n ω) atTop (𝓝 z)) ∨
        (liminf (fun n => (X n ω : EReal)) atTop = ⊥ ∧
          limsup (fun n => (X n ω : EReal)) atTop = ⊤) := by
  have hrange :=
    durrett2019_theorem_4_3_1_converges_or_unbounded_range
      (X := X) (M := M) hX hM_nonneg hX0 hinc
  filter_upwards [hrange] with ω hω
  rcases hω with hconv | ⟨hnotBelow, hnotAbove⟩
  · exact Or.inl hconv
  · right
    exact
      durrett2019_ereal_liminf_limsup_of_frequently_crosses
        (u := fun n => X n ω)
        (fun a => durrett2019_frequently_lt_atTop_of_not_bddBelow_range hnotBelow a)
        (fun a => durrett2019_frequently_atTop_lt_of_not_bddAbove_range hnotAbove a)

/-! ### Durrett, Theorem 4.3.2 -/

/--
Durrett 2019, Theorem 4.3.2, Doob decomposition, existence and formula part.
Any real-valued submartingale decomposes as a martingale plus a predictable
increasing process starting at zero.  The predictable part is displayed in the
textbook finite-sum form.

The uniqueness part is left to the next wrapper, using mathlib's
`martingalePart_add_ae_eq` and `predictablePart_add_ae_eq`.
-/
theorem durrett2019_theorem_4_3_2_doob_decomposition
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {X : ℕ -> Ω -> ℝ} (hX : Submartingale X ℱ μ) :
    ∃ M A : ℕ -> Ω -> ℝ,
      Martingale M ℱ μ ∧
        IsStronglyPredictable ℱ A ∧
        (∀ᵐ ω ∂μ, Monotone fun n => A n ω) ∧
        A 0 = 0 ∧
        M + A = X ∧
        (∀ n, A n = fun ω => ∑ i ∈ Finset.range n, μ[X (i + 1) - X i | ℱ i] ω) := by
  refine
    ⟨martingalePart X ℱ μ, predictablePart X ℱ μ,
      martingale_martingalePart hX.stronglyAdapted hX.integrable,
      isPredictable_predictablePart, hX.monotone_predictablePart,
      predictablePart_zero, martingalePart_add_predictablePart ℱ μ X, ?_⟩
  intro n
  ext ω
  simp [predictablePart]

/--
Durrett 2019, Theorem 4.3.2, uniqueness against the canonical
`martingalePart`/`predictablePart` decomposition.  Any martingale plus
predictable zero-start decomposition of `X` agrees with the canonical parts
almost surely at each fixed time.
-/
theorem durrett2019_theorem_4_3_2_doob_decomposition_canonical_unique
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {X M A : ℕ -> Ω -> ℝ}
    (hM : Martingale M ℱ μ) (hA : IsStronglyPredictable ℱ A)
    (hA0 : A 0 = 0) (hAint : ∀ n, Integrable (A n) μ)
    (hdecomp : M + A = X) :
    ∀ n,
      martingalePart X ℱ μ n =ᵐ[μ] M n ∧
        predictablePart X ℱ μ n =ᵐ[μ] A n := by
  intro n
  constructor
  · have h := martingalePart_add_ae_eq (f := M) (g := A) hM
      (fun n => hA.measurable_add_one n) hA0 hAint n
    rwa [hdecomp] at h
  · have h := predictablePart_add_ae_eq (f := M) (g := A) hM
      (fun n => hA.measurable_add_one n) hA0 hAint n
    rwa [hdecomp] at h

/--
Durrett 2019, Theorem 4.3.2, source-facing uniqueness: two martingale plus
predictable zero-start decompositions of the same process agree almost surely
at each fixed time.
-/
theorem durrett2019_theorem_4_3_2_doob_decomposition_unique
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} [SigmaFiniteFiltration μ ℱ]
    {X M₁ A₁ M₂ A₂ : ℕ -> Ω -> ℝ}
    (hM₁ : Martingale M₁ ℱ μ) (hA₁ : IsStronglyPredictable ℱ A₁)
    (hA₁0 : A₁ 0 = 0) (hA₁int : ∀ n, Integrable (A₁ n) μ)
    (hdecomp₁ : M₁ + A₁ = X)
    (hM₂ : Martingale M₂ ℱ μ) (hA₂ : IsStronglyPredictable ℱ A₂)
    (hA₂0 : A₂ 0 = 0) (hA₂int : ∀ n, Integrable (A₂ n) μ)
    (hdecomp₂ : M₂ + A₂ = X) :
    ∀ n, M₁ n =ᵐ[μ] M₂ n ∧ A₁ n =ᵐ[μ] A₂ n := by
  have h₁ :=
    durrett2019_theorem_4_3_2_doob_decomposition_canonical_unique
      (X := X) hM₁ hA₁ hA₁0 hA₁int hdecomp₁
  have h₂ :=
    durrett2019_theorem_4_3_2_doob_decomposition_canonical_unique
      (X := X) hM₂ hA₂ hA₂0 hA₂int hdecomp₂
  intro n
  constructor
  · exact (h₁ n).1.symm.trans (h₂ n).1
  · exact (h₁ n).2.symm.trans (h₂ n).2

/--
Durrett 2019, Example 4.3.3: the martingale part of the counting process for
events `B n` is a martingale.
-/
theorem durrett2019_example_4_3_3_borel_cantelli_process_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {B : ℕ -> Set Ω}
    (hB : ∀ n, MeasurableSet[ℱ n] (B n)) :
    Martingale (martingalePart (MeasureTheory.BorelCantelli.process B) ℱ μ) ℱ μ :=
  martingale_martingalePart
    (MeasureTheory.BorelCantelli.stronglyAdapted_process (ℱ := ℱ) hB)
    (MeasureTheory.BorelCantelli.integrable_process (ℱ := ℱ) μ hB)

/--
Durrett 2019, Example 4.3.3: finite-sum display for the martingale part
`M_n = ∑_{k<n} (1_{B_{k+1}} - E(1_{B_{k+1}} | ℱ_k))`.
-/
theorem durrett2019_example_4_3_3_borel_cantelli_martingale_formula
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} (B : ℕ -> Set Ω) (n : ℕ) :
    martingalePart (MeasureTheory.BorelCantelli.process B) ℱ μ n =
      ∑ k ∈ Finset.range n,
        ((B (k + 1)).indicator (1 : Ω -> ℝ) -
          μ[(B (k + 1)).indicator (1 : Ω -> ℝ) | ℱ k]) :=
  MeasureTheory.BorelCantelli.martingalePart_process_ae_eq ℱ μ B n

/--
Durrett 2019, Example 4.3.3: finite-sum display for the predictable part,
the cumulative conditional probabilities.
-/
theorem durrett2019_example_4_3_3_borel_cantelli_predictable_formula
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} {ℱ : Filtration ℕ mΩ} (B : ℕ -> Set Ω) (n : ℕ) :
    predictablePart (MeasureTheory.BorelCantelli.process B) ℱ μ n =
      ∑ k ∈ Finset.range n,
        μ[(B (k + 1)).indicator (1 : Ω -> ℝ) | ℱ k] :=
  MeasureTheory.BorelCantelli.predictablePart_process_ae_eq ℱ μ B n

/--
Durrett 2019, Example 4.3.3: the event-counting process has one-step
increments bounded by one.
-/
theorem durrett2019_example_4_3_3_borel_cantelli_process_difference_le
    {Ω : Type*} [MeasurableSpace Ω] (B : ℕ -> Set Ω) (ω : Ω) (n : ℕ) :
    |MeasureTheory.BorelCantelli.process B (n + 1) ω -
      MeasureTheory.BorelCantelli.process B n ω| ≤ (1 : ℝ≥0) :=
  MeasureTheory.BorelCantelli.process_difference_le B ω n

/--
Durrett 2019, Theorem 4.3.4: conditional Borel-Cantelli.  The event that
`B n` occurs infinitely often agrees a.e. with divergence of the cumulative
conditional probabilities.
-/
theorem durrett2019_theorem_4_3_4_conditional_borel_cantelli
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ : Measure Ω} [IsFiniteMeasure μ] {ℱ : Filtration ℕ mΩ}
    {B : ℕ -> Set Ω}
    (hB : ∀ n, MeasurableSet[ℱ n] (B n)) :
    ∀ᵐ ω ∂μ, ω ∈ limsup B atTop ↔
      Tendsto (fun n => ∑ k ∈ Finset.range n,
        (μ[(B (k + 1)).indicator (1 : Ω -> ℝ) | ℱ k]) ω) atTop atTop :=
  MeasureTheory.ae_mem_limsup_atTop_iff μ hB

/--
Durrett 2019, Theorem 4.3.5 setup: for the restrictions of two measures to
`ℱ n`, the real-valued Radon-Nikodym derivative integrates over `ℱ n`-events to
the original measure of the event.
-/
theorem durrett2019_theorem_4_3_5_trimmed_rnDeriv_setIntegral_toReal
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} {ℱ : Filtration ℕ mΩ} (n : ℕ)
    [SigmaFinite (μ.trim (ℱ.le n))] [SigmaFinite (ν.trim (ℱ.le n))]
    (hμν : μ.trim (ℱ.le n) ≪ ν.trim (ℱ.le n))
    {A : Set Ω} (hA : MeasurableSet[ℱ n] A) :
    ∫ ω in A, ((μ.trim (ℱ.le n)).rnDeriv (ν.trim (ℱ.le n)) ω).toReal ∂ν =
      μ.real A := by
  rw [setIntegral_trim (ℱ.le n)]
  · rw [Measure.setIntegral_toReal_rnDeriv hμν A]
    simp [Measure.real, trim_measurableSet_eq (ℱ.le n) hA]
  · exact
      (Measurable.ennreal_toReal
        (Measure.measurable_rnDeriv (μ.trim (ℱ.le n)) (ν.trim (ℱ.le n)))).stronglyMeasurable
  · exact hA

/--
Durrett 2019, Lemma 4.3.6 proof pattern: a real adapted integrable process is a
martingale when every `ℱ n`-event has the same integral against `X n` as against
a fixed finite measure.
-/
theorem durrett2019_lemma_4_3_6_martingale_of_setIntegral_real_eq
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure ν] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ}
    (hX : StronglyAdapted ℱ X) (hXint : ∀ n, Integrable (X n) ν)
    (hXμ : ∀ n, ∀ A : Set Ω, MeasurableSet[ℱ n] A ->
      ∫ ω in A, X n ω ∂ν = μ.real A) :
    Martingale X ℱ ν := by
  refine martingale_of_setIntegral_eq_succ hX hXint ?_
  intro n A hA
  calc
    ∫ ω in A, X n ω ∂ν = μ.real A := hXμ n A hA
    _ = ∫ ω in A, X (n + 1) ω ∂ν :=
      (hXμ (n + 1) A (ℱ.mono n.le_succ A hA)).symm

/--
Durrett 2019, Lemma 4.3.6: the likelihood-ratio process
`X n = d μ_n / d ν_n`, where `μ_n` and `ν_n` are the restrictions to `ℱ n`,
is a martingale with respect to `ν`.
-/
theorem durrett2019_lemma_4_3_6_trimmed_rnDeriv_martingale
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ}
    (hμν : ∀ n, μ.trim (ℱ.le n) ≪ ν.trim (ℱ.le n)) :
    Martingale
      (fun n ω => ((μ.trim (ℱ.le n)).rnDeriv (ν.trim (ℱ.le n)) ω).toReal) ℱ ν := by
  refine durrett2019_lemma_4_3_6_martingale_of_setIntegral_real_eq (μ := μ) (ν := ν) ?_ ?_ ?_
  · intro n
    exact
      (Measurable.ennreal_toReal
        (Measure.measurable_rnDeriv (μ.trim (ℱ.le n)) (ν.trim (ℱ.le n)))).stronglyMeasurable
  · intro n
    exact integrable_of_integrable_trim (ℱ.le n)
      (Measure.integrable_toReal_rnDeriv (μ := μ.trim (ℱ.le n)) (ν := ν.trim (ℱ.le n)))
  · intro n A hA
    exact durrett2019_theorem_4_3_5_trimmed_rnDeriv_setIntegral_toReal n (hμν n) hA

/--
Durrett 2019, Theorem 4.3.5 proof step: the restricted Radon-Nikodym
likelihood-ratio martingale is nonnegative, hence converges almost surely to a
finite real limit under `ν`.
-/
theorem durrett2019_theorem_4_3_5_trimmed_rnDeriv_exists_ae_tendsto
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ}
    (hμν : ∀ n, μ.trim (ℱ.le n) ≪ ν.trim (ℱ.le n)) :
    ∀ᵐ ω ∂ν, ∃ x : ℝ,
      Tendsto (fun n => ((μ.trim (ℱ.le n)).rnDeriv (ν.trim (ℱ.le n)) ω).toReal)
        atTop (𝓝 x) := by
  have hM :=
    durrett2019_lemma_4_3_6_trimmed_rnDeriv_martingale
      (μ := μ) (ν := ν) (ℱ := ℱ) hμν
  have h_nonneg : ∀ n, 0 ≤ᵐ[ν]
      fun ω => ((μ.trim (ℱ.le n)).rnDeriv (ν.trim (ℱ.le n)) ω).toReal := by
    intro n
    exact Eventually.of_forall fun _ => ENNReal.toReal_nonneg
  exact
    durrett2019_theorem_4_2_12_nonnegative_supermartingale_exists_ae_tendsto
      hM.supermartingale h_nonneg

/--
Durrett 2019, Theorem 4.3.5 regular/singular measure identity, in mathlib's
Lebesgue-decomposition form.
-/
theorem durrett2019_theorem_4_3_5_rnDeriv_singularPart_measure_identity
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν : Measure Ω} [μ.HaveLebesgueDecomposition ν] (A : Set Ω) :
    μ A = (ν.withDensity (μ.rnDeriv ν)) A + (μ.singularPart ν) A := by
  have h := congrArg (fun η : Measure Ω => η A) (Measure.rnDeriv_add_singularPart μ ν)
  simpa [Pi.add_apply] using h.symm

/--
Durrett 2019, Theorem 4.3.5 regular/singular identity in real-integral form:
the regular part is the integral of the real-valued Radon-Nikodym derivative,
and the remaining term is mathlib's singular part.
-/
theorem durrett2019_theorem_4_3_5_rnDeriv_singularPart_real_identity
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    [μ.HaveLebesgueDecomposition ν] (A : Set Ω) :
    μ.real A =
      ∫ ω in A, (μ.rnDeriv ν ω).toReal ∂ν + (μ.singularPart ν).real A := by
  have hdec :
      μ A = (ν.withDensity (μ.rnDeriv ν)) A + (μ.singularPart ν) A :=
    durrett2019_theorem_4_3_5_rnDeriv_singularPart_measure_identity A
  have hreg_ne_top : (ν.withDensity (μ.rnDeriv ν)) A ≠ ∞ :=
    ne_top_of_le_ne_top (measure_ne_top μ A) (Measure.withDensity_rnDeriv_le μ ν A)
  have hsing_ne_top : (μ.singularPart ν) A ≠ ∞ :=
    ne_top_of_le_ne_top (measure_ne_top μ A) (Measure.singularPart_le μ ν A)
  calc
    μ.real A =
        ((ν.withDensity (μ.rnDeriv ν)) A + (μ.singularPart ν) A).toReal := by
      rw [Measure.real, hdec]
    _ = (ν.withDensity (μ.rnDeriv ν)).real A + (μ.singularPart ν).real A := by
      rw [ENNReal.toReal_add hreg_ne_top hsing_ne_top, Measure.real, Measure.real]
    _ = ∫ ω in A, (μ.rnDeriv ν ω).toReal ∂ν + (μ.singularPart ν).real A := by
      rw [Measure.setIntegral_toReal_rnDeriv_eq_withDensity]

/--
Durrett 2019, Theorem 4.3.5 source-shaped endpoint: once the regular density
has been identified a.e. with `X` and the singular part has been identified as
restriction to a set `S`, the textbook identity follows for every measurable
event `A`.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_singularPart_eq_restrict
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    [μ.HaveLebesgueDecomposition ν]
    {X : Ω -> ℝ} {S A : Set Ω} (hA : MeasurableSet A)
    (hX : X =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal)
    (hS : μ.singularPart ν = μ.restrict S) :
    μ.real A = ∫ ω in A, X ω ∂ν + μ.real (A ∩ S) := by
  have hbase :=
    durrett2019_theorem_4_3_5_rnDeriv_singularPart_real_identity
      (μ := μ) (ν := ν) A
  have hint :
      ∫ ω in A, (μ.rnDeriv ν ω).toReal ∂ν = ∫ ω in A, X ω ∂ν :=
    setIntegral_congr_ae hA (hX.symm.mono fun _ hx _ => hx)
  have hsing : (μ.singularPart ν).real A = μ.real (A ∩ S) := by
    rw [hS]
    change ((μ.restrict S) A).toReal = (μ (A ∩ S)).toReal
    rw [Measure.restrict_apply hA]
  rw [hbase, hint, hsing]

/--
Durrett 2019, Theorem 4.3.5 density-ratio bridge: if a measure `rho`
dominates both `mu` and `nu`, the real-valued RN density `dmu/dnu` agrees
`nu`-a.e. with the ratio `(dmu/drho) / (dnu/drho)`.
-/
theorem durrett2019_theorem_4_3_5_rnDeriv_density_ratio_toReal_ae
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [SigmaFinite μ] [SigmaFinite ν] [SigmaFinite ρ]
    (hμ : μ ≪ ρ) (hν : ν ≪ ρ) :
    (fun ω => (μ.rnDeriv ρ ω / ν.rnDeriv ρ ω).toReal)
      =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal := by
  have h := Measure.rnDeriv_eq_div (μ := μ) (ν := ν) (ξ := ρ) hμ hν
  filter_upwards [h] with ω hω
  simp [hω]

/--
Durrett 2019, Theorem 4.3.5 density-ratio bridge specialized to the dominating
measure `mu + nu`.
-/
theorem durrett2019_theorem_4_3_5_rnDeriv_add_density_ratio_toReal_ae
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν : Measure Ω} [SigmaFinite μ] [SigmaFinite ν] :
    (fun ω => (μ.rnDeriv (μ + ν) ω / ν.rnDeriv (μ + ν) ω).toReal)
      =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal := by
  have h := Measure.rnDeriv_eq_div_rnDeriv_add μ ν
  filter_upwards [h] with ω hω
  simp [hω]

/--
Durrett 2019, Theorem 4.3.5 source-shaped density-ratio bridge: once the
textbook limits `Y` and `Z` have been identified with `dmu/drho` and
`dnu/drho`, their ratio gives the real RN density `dmu/dnu`, `nu`-a.e.
-/
theorem durrett2019_theorem_4_3_5_density_ratio_toReal_ae_of_ae_eq
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [SigmaFinite μ] [SigmaFinite ν] [SigmaFinite ρ]
    {Y Z : Ω -> ℝ≥0∞} (hμ : μ ≪ ρ) (hν : ν ≪ ρ)
    (hY : Y =ᵐ[ν] fun ω => μ.rnDeriv ρ ω)
    (hZ : Z =ᵐ[ν] fun ω => ν.rnDeriv ρ ω) :
    (fun ω => (Y ω / Z ω).toReal) =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal := by
  have h := Measure.rnDeriv_eq_div (μ := μ) (ν := ν) (ξ := ρ) hμ hν
  filter_upwards [hY, hZ, h] with ω hYω hZω hω
  rw [hYω, hZω]
  exact congrArg ENNReal.toReal hω.symm

/--
Durrett 2019, Theorem 4.3.5 endpoint with a supplied singular set: the
separation conditions that identify `S` as the singular support imply the
source-shaped real-integral identity.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_singular_set
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    [μ.HaveLebesgueDecomposition ν]
    {X : Ω -> ℝ} {S A : Set Ω} (hA : MeasurableSet A)
    (hX : X =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal)
    (hμS : μ.singularPart ν Sᶜ = 0) (hνS : ν S = 0) :
    μ.real A = ∫ ω in A, X ω ∂ν + μ.real (A ∩ S) :=
  durrett2019_theorem_4_3_5_source_real_identity_of_singularPart_eq_restrict
    (μ := μ) (ν := ν) hA hX (Measure.singularPart_eq_restrict hμS hνS)

/--
Durrett 2019, Theorem 4.3.5 endpoint with the textbook singular event
`{X = infinity}` represented by an `ENNReal`-valued limit.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_top_set
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    [μ.HaveLebesgueDecomposition ν]
    {X : Ω -> ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (hX : (fun ω => (X ω).toReal) =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) :=
  durrett2019_theorem_4_3_5_source_real_identity_of_singularPart_eq_restrict
    (μ := μ) (ν := ν) hA hX (Measure.singularPart_eq_restrict hμtop hνtop)

/--
Durrett 2019, Theorem 4.3.5 source assembly: after the proof has identified
`Y = dmu/drho`, `Z = dnu/drho`, `X = Y/Z`, and the singular support
`{X = infinity}`, the textbook real-integral identity follows.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_density_ratio_top_set
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (hμ : μ ≪ ρ) (hν : ν ≪ ρ)
    (hY : Y =ᵐ[ν] fun ω => μ.rnDeriv ρ ω)
    (hZ : Z =ᵐ[ν] fun ω => ν.rnDeriv ρ ω)
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  have hratio :
      (fun ω => (Y ω / Z ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal :=
    durrett2019_theorem_4_3_5_density_ratio_toReal_ae_of_ae_eq
      (μ := μ) (ν := ν) (ρ := ρ) hμ hν hY hZ
  have hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal := by
    filter_upwards [hX, hratio] with ω hXω hratioω
    rw [hXω]
    exact hratioω
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_top_set
      (μ := μ) (ν := ν) hA hXrn hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 RN-identification bridge: if a candidate density
represents `mu` by set integrals against `rho`, then it is the
Radon-Nikodym derivative `dmu/drho`, `rho`-a.e.
-/
theorem durrett2019_theorem_4_3_5_rnDeriv_ae_eq_of_forall_setLIntegral
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ρ : Measure Ω} [SigmaFinite ρ] {Y : Ω -> ℝ≥0∞}
    (hY : AEMeasurable Y ρ)
    (hrepr : ∀ A : Set Ω, MeasurableSet A -> μ A = ∫⁻ ω in A, Y ω ∂ρ) :
    Y =ᵐ[ρ] fun ω => μ.rnDeriv ρ ω := by
  have hμ : μ = ρ.withDensity Y := by
    ext A hA
    rw [hrepr A hA, withDensity_apply _ hA]
  have hderiv : μ.rnDeriv ρ =ᵐ[ρ] Y := by
    rw [hμ]
    exact Measure.rnDeriv_withDensity₀ ρ hY
  exact hderiv.symm

/--
Durrett 2019, Theorem 4.3.5 paired RN-identification bridge: integral
representations of `mu` and `nu` against the same dominating measure `rho`
produce the `nu`-a.e. `Y` and `Z` derivative identifications consumed by the
density-ratio source assembly.
-/
theorem durrett2019_theorem_4_3_5_density_pair_ae_eq_under_nu_of_forall_setLIntegral
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [SigmaFinite ρ]
    {Y Z : Ω -> ℝ≥0∞}
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hμrepr : ∀ A : Set Ω, MeasurableSet A -> μ A = ∫⁻ ω in A, Y ω ∂ρ)
    (hνrepr : ∀ A : Set Ω, MeasurableSet A -> ν A = ∫⁻ ω in A, Z ω ∂ρ) :
    (Y =ᵐ[ν] fun ω => μ.rnDeriv ρ ω) ∧
      (Z =ᵐ[ν] fun ω => ν.rnDeriv ρ ω) := by
  have hνeq : ν = ρ.withDensity Z := by
    ext A hA
    rw [hνrepr A hA, withDensity_apply _ hA]
  have hνρ : ν ≪ ρ := by
    rw [hνeq]
    exact withDensity_absolutelyContinuous ρ Z
  have hYρ : Y =ᵐ[ρ] fun ω => μ.rnDeriv ρ ω :=
    durrett2019_theorem_4_3_5_rnDeriv_ae_eq_of_forall_setLIntegral
      (μ := μ) (ρ := ρ) hY hμrepr
  have hZρ : Z =ᵐ[ρ] fun ω => ν.rnDeriv ρ ω :=
    durrett2019_theorem_4_3_5_rnDeriv_ae_eq_of_forall_setLIntegral
      (μ := ν) (ρ := ρ) hZ hνrepr
  exact ⟨hνρ hYρ, hνρ hZρ⟩

/--
Durrett 2019, Theorem 4.3.5 source assembly from integral density
identifications: once bounded-convergence/generator work has produced the
set-integral identities for `Y` and `Z`, the ratio and singular-top hypotheses
imply the textbook identity.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_density_integrals_ratio_top_set
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hμrepr : ∀ B : Set Ω, MeasurableSet B -> μ B = ∫⁻ ω in B, Y ω ∂ρ)
    (hνrepr : ∀ B : Set Ω, MeasurableSet B -> ν B = ∫⁻ ω in B, Z ω ∂ρ)
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  have hμeq : μ = ρ.withDensity Y := by
    ext B hB
    rw [hμrepr B hB, withDensity_apply _ hB]
  have hνeq : ν = ρ.withDensity Z := by
    ext B hB
    rw [hνrepr B hB, withDensity_apply _ hB]
  have hμρ : μ ≪ ρ := by
    rw [hμeq]
    exact withDensity_absolutelyContinuous ρ Y
  have hνρ : ν ≪ ρ := by
    rw [hνeq]
    exact withDensity_absolutelyContinuous ρ Z
  obtain ⟨hYν, hZν⟩ :=
    durrett2019_theorem_4_3_5_density_pair_ae_eq_under_nu_of_forall_setLIntegral
      (μ := μ) (ν := ν) (ρ := ρ) hY hZ hμrepr hνrepr
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_density_ratio_top_set
      (μ := μ) (ν := ν) (ρ := ρ) hA hμρ hνρ hYν hZν hX hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 generator-extension bridge: if a candidate density
has the correct set integrals on a generating pi-system and on `univ`, then it
represents the whole finite measure as a `withDensity`.
-/
theorem durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} [IsFiniteMeasure μ] [SigmaFinite ρ]
    {Y : Ω -> ℝ≥0∞} (C : Set (Set Ω))
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hCeq : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (huniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ) :
    μ = ρ.withDensity Y := by
  refine ext_of_generate_finite C hgen hC ?_ ?_
  · intro s hs
    have hs_meas : MeasurableSet s :=
      hgen ▸ MeasurableSpace.measurableSet_generateFrom hs
    rw [hCeq s hs, withDensity_apply _ hs_meas]
  · rw [huniv, withDensity_apply _ MeasurableSet.univ]
    simp

/--
Durrett 2019, Theorem 4.3.5 generator-to-all-sets bridge: the pi-system
identities from the bounded-convergence argument extend to every measurable
set.
-/
theorem durrett2019_theorem_4_3_5_forall_setLIntegral_of_generate_finite
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} [IsFiniteMeasure μ] [SigmaFinite ρ]
    {Y : Ω -> ℝ≥0∞} (C : Set (Set Ω))
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hCeq : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (huniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ) :
    ∀ A : Set Ω, MeasurableSet A -> μ A = ∫⁻ ω in A, Y ω ∂ρ := by
  have heq : μ = ρ.withDensity Y :=
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := μ) (ρ := ρ) C hgen hC hCeq huniv
  intro A hA
  rw [heq, withDensity_apply _ hA]

/--
Durrett 2019, Theorem 4.3.5 generator-level RN-identification bridge: after
bounded convergence proves the set-integral identities on the generating class,
the candidate limit is identified with `dmu/drho`.
-/
theorem durrett2019_theorem_4_3_5_rnDeriv_ae_eq_of_generate_finite
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} [IsFiniteMeasure μ] [SigmaFinite ρ]
    {Y : Ω -> ℝ≥0∞} (C : Set (Set Ω))
    (hY : AEMeasurable Y ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hCeq : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (huniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ) :
    Y =ᵐ[ρ] fun ω => μ.rnDeriv ρ ω :=
  durrett2019_theorem_4_3_5_rnDeriv_ae_eq_of_forall_setLIntegral
    (μ := μ) (ρ := ρ) hY
    (durrett2019_theorem_4_3_5_forall_setLIntegral_of_generate_finite
      (μ := μ) (ρ := ρ) C hgen hC hCeq huniv)

/--
Durrett 2019, Theorem 4.3.5 paired generator-level RN-identification bridge
for the `Y` and `Z` limits.
-/
theorem durrett2019_theorem_4_3_5_density_pair_ae_eq_under_nu_of_generate_finite
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    {Y Z : Ω -> ℝ≥0∞} (C : Set (Set Ω))
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμC : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (hνC : ∀ s ∈ C, ν s = ∫⁻ ω in s, Z ω ∂ρ)
    (hμuniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ)
    (hνuniv : ν Set.univ = ∫⁻ ω, Z ω ∂ρ) :
    (Y =ᵐ[ν] fun ω => μ.rnDeriv ρ ω) ∧
      (Z =ᵐ[ν] fun ω => ν.rnDeriv ρ ω) :=
  durrett2019_theorem_4_3_5_density_pair_ae_eq_under_nu_of_forall_setLIntegral
    (μ := μ) (ν := ν) (ρ := ρ) hY hZ
    (durrett2019_theorem_4_3_5_forall_setLIntegral_of_generate_finite
      (μ := μ) (ρ := ρ) C hgen hC hμC hμuniv)
    (durrett2019_theorem_4_3_5_forall_setLIntegral_of_generate_finite
      (μ := ν) (ρ := ρ) C hgen hC hνC hνuniv)

/--
Durrett 2019, Theorem 4.3.5 source endpoint from generator-level integral
identities: once the bounded-convergence proof supplies the identities on a
generating pi-system, the ratio/top-set assumptions imply the textbook formula.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_generate_finite_ratio_top_set
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (C : Set (Set Ω)) (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμC : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (hνC : ∀ s ∈ C, ν s = ∫⁻ ω in s, Z ω ∂ρ)
    (hμuniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ)
    (hνuniv : ν Set.univ = ∫⁻ ω, Z ω ∂ρ)
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) :=
  durrett2019_theorem_4_3_5_source_real_identity_of_density_integrals_ratio_top_set
    (μ := μ) (ν := ν) (ρ := ρ) hA hY hZ
    (durrett2019_theorem_4_3_5_forall_setLIntegral_of_generate_finite
      (μ := μ) (ρ := ρ) C hgen hC hμC hμuniv)
    (durrett2019_theorem_4_3_5_forall_setLIntegral_of_generate_finite
      (μ := ν) (ρ := ρ) C hgen hC hνC hνuniv)
    hX hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 bounded-convergence primitive: a uniformly
bounded nonnegative density sequence that converges almost surely has
convergent set `lintegral`s on every event.
-/
theorem durrett2019_theorem_4_3_5_setLIntegral_tendsto_of_bounded_convergence
    {Ω : Type*} [MeasurableSpace Ω] {ρ : Measure Ω} [IsFiniteMeasure ρ]
    {Yseq : ℕ -> Ω -> ℝ≥0∞} {Y : Ω -> ℝ≥0∞} {B : ℝ≥0∞}
    (hYseq : ∀ n, AEMeasurable (Yseq n) ρ)
    (hbound : ∀ n, Yseq n ≤ᵐ[ρ] fun _ => B) (hB : B ≠ ∞)
    (hlim : ∀ᵐ ω ∂ρ, Tendsto (fun n => Yseq n ω) atTop (𝓝 (Y ω)))
    (s : Set Ω) :
    Tendsto (fun n => ∫⁻ ω in s, Yseq n ω ∂ρ) atTop
      (𝓝 (∫⁻ ω in s, Y ω ∂ρ)) := by
  have hfin : ∫⁻ ω, (fun _ : Ω => B) ω ∂(ρ.restrict s) ≠ ∞ := by
    rw [lintegral_const]
    exact ENNReal.mul_ne_top hB (measure_ne_top (ρ.restrict s) Set.univ)
  exact
    tendsto_lintegral_of_dominated_convergence'
      (μ := ρ.restrict s) (F := Yseq) (f := Y) (fun _ : Ω => B)
      (fun n => (hYseq n).mono_measure Measure.restrict_le_self)
      (fun n => ae_restrict_of_ae (hbound n)) hfin
      (ae_restrict_of_ae hlim)

/--
Durrett 2019, Theorem 4.3.5 bounded-convergence identity step: if the
restricted-density integral is eventually equal to a finite measure value, the
limit density has that set integral.
-/
theorem durrett2019_theorem_4_3_5_set_integral_identity_of_bounded_convergence
    {Ω : Type*} [MeasurableSpace Ω] {μ ρ : Measure Ω} [IsFiniteMeasure ρ]
    {Yseq : ℕ -> Ω -> ℝ≥0∞} {Y : Ω -> ℝ≥0∞} {B : ℝ≥0∞} {s : Set Ω}
    (hYseq : ∀ n, AEMeasurable (Yseq n) ρ)
    (hbound : ∀ n, Yseq n ≤ᵐ[ρ] fun _ => B) (hB : B ≠ ∞)
    (hlim : ∀ᵐ ω ∂ρ, Tendsto (fun n => Yseq n ω) atTop (𝓝 (Y ω)))
    (hevent : ∀ᶠ n in atTop, μ s = ∫⁻ ω in s, Yseq n ω ∂ρ) :
    μ s = ∫⁻ ω in s, Y ω ∂ρ := by
  have htend :
      Tendsto (fun n => ∫⁻ ω in s, Yseq n ω ∂ρ) atTop
        (𝓝 (∫⁻ ω in s, Y ω ∂ρ)) :=
    durrett2019_theorem_4_3_5_setLIntegral_tendsto_of_bounded_convergence
      (ρ := ρ) hYseq hbound hB hlim s
  exact tendsto_nhds_unique (tendsto_const_nhds.congr' hevent) htend

/--
Durrett 2019, Theorem 4.3.5 generator production bridge: Durrett's bounded
convergence computation supplies the generator-class and `univ` set-integral
identities for a limiting density.
-/
theorem durrett2019_theorem_4_3_5_generator_integrals_of_bounded_convergence
    {Ω : Type*} [MeasurableSpace Ω] {μ ρ : Measure Ω} [IsFiniteMeasure ρ]
    {Yseq : ℕ -> Ω -> ℝ≥0∞} {Y : Ω -> ℝ≥0∞} {B : ℝ≥0∞}
    (C : Set (Set Ω))
    (hYseq : ∀ n, AEMeasurable (Yseq n) ρ)
    (hbound : ∀ n, Yseq n ≤ᵐ[ρ] fun _ => B) (hB : B ≠ ∞)
    (hlim : ∀ᵐ ω ∂ρ, Tendsto (fun n => Yseq n ω) atTop (𝓝 (Y ω)))
    (hCevent : ∀ s ∈ C, ∀ᶠ n in atTop, μ s = ∫⁻ ω in s, Yseq n ω ∂ρ)
    (huniv_event : ∀ᶠ n in atTop, μ Set.univ = ∫⁻ ω, Yseq n ω ∂ρ) :
    (∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ) ∧
      μ Set.univ = ∫⁻ ω, Y ω ∂ρ := by
  refine ⟨?_, ?_⟩
  · intro s hs
    exact
      durrett2019_theorem_4_3_5_set_integral_identity_of_bounded_convergence
        (μ := μ) (ρ := ρ) (Yseq := Yseq) (Y := Y) (B := B) (s := s)
        hYseq hbound hB hlim (hCevent s hs)
  · have huniv_set :
        ∀ᶠ n in atTop, μ Set.univ = ∫⁻ ω in Set.univ, Yseq n ω ∂ρ :=
      huniv_event.mono fun n hn => by
        simpa [setLIntegral_univ] using hn
    have h :=
      durrett2019_theorem_4_3_5_set_integral_identity_of_bounded_convergence
        (μ := μ) (ρ := ρ) (Yseq := Yseq) (Y := Y) (B := B) (s := Set.univ)
        hYseq hbound hB hlim huniv_set
    simpa [setLIntegral_univ] using h

/--
Durrett 2019, Theorem 4.3.5 source endpoint with the bounded-convergence
generator step included.  The remaining source obligations are the eventual
restricted-density identities for `Yseq` and `Zseq`, the ratio `X = Y / Z`,
and the top-set singular separation.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_bounded_convergence_ratio_top_set
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [IsFiniteMeasure ρ]
    [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {Yseq Zseq : ℕ -> Ω -> ℝ≥0∞}
    {BY BZ : ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (C : Set (Set Ω)) (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hYseq : ∀ n, AEMeasurable (Yseq n) ρ)
    (hYbound : ∀ n, Yseq n ≤ᵐ[ρ] fun _ => BY) (hBY : BY ≠ ∞)
    (hYlim : ∀ᵐ ω ∂ρ, Tendsto (fun n => Yseq n ω) atTop (𝓝 (Y ω)))
    (hZseq : ∀ n, AEMeasurable (Zseq n) ρ)
    (hZbound : ∀ n, Zseq n ≤ᵐ[ρ] fun _ => BZ) (hBZ : BZ ≠ ∞)
    (hZlim : ∀ᵐ ω ∂ρ, Tendsto (fun n => Zseq n ω) atTop (𝓝 (Z ω)))
    (hμCevent : ∀ s ∈ C, ∀ᶠ n in atTop, μ s = ∫⁻ ω in s, Yseq n ω ∂ρ)
    (hνCevent : ∀ s ∈ C, ∀ᶠ n in atTop, ν s = ∫⁻ ω in s, Zseq n ω ∂ρ)
    (hμuniv_event : ∀ᶠ n in atTop, μ Set.univ = ∫⁻ ω, Yseq n ω ∂ρ)
    (hνuniv_event : ∀ᶠ n in atTop, ν Set.univ = ∫⁻ ω, Zseq n ω ∂ρ)
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  obtain ⟨hμC, hμuniv⟩ :=
    durrett2019_theorem_4_3_5_generator_integrals_of_bounded_convergence
      (μ := μ) (ρ := ρ) (Yseq := Yseq) (Y := Y) (B := BY) C
      hYseq hYbound hBY hYlim hμCevent hμuniv_event
  obtain ⟨hνC, hνuniv⟩ :=
    durrett2019_theorem_4_3_5_generator_integrals_of_bounded_convergence
      (μ := ν) (ρ := ρ) (Yseq := Zseq) (Y := Z) (B := BZ) C
      hZseq hZbound hBZ hZlim hνCevent hνuniv_event
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_generate_finite_ratio_top_set
      (μ := μ) (ν := ν) (ρ := ρ) hA C hY hZ hgen hC hμC hνC
      hμuniv hνuniv hX hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 restricted-density identity in `lintegral` form:
the RN derivative of the trimmed measures integrates over an `ℱ n`-event to
the original measure of that event.
-/
theorem durrett2019_theorem_4_3_5_trimmed_rnDeriv_setLIntegral
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} {ℱ : Filtration ℕ mΩ} (n : ℕ)
    [SigmaFinite (μ.trim (ℱ.le n))] [SigmaFinite (ρ.trim (ℱ.le n))]
    (hμρ : μ.trim (ℱ.le n) ≪ ρ.trim (ℱ.le n))
    {A : Set Ω} (hA : MeasurableSet[ℱ n] A) :
    μ A =
      ∫⁻ ω in A, (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω ∂ρ := by
  have hf :
      Measurable[ℱ n]
        (fun ω => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) :=
    Measure.measurable_rnDeriv (μ.trim (ℱ.le n)) (ρ.trim (ℱ.le n))
  calc
    μ A = (μ.trim (ℱ.le n)) A := by
      rw [trim_measurableSet_eq (ℱ.le n) hA]
    _ = ∫⁻ ω in A, (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω
          ∂(ρ.trim (ℱ.le n)) := by
      exact (Measure.setLIntegral_rnDeriv hμρ A).symm
    _ = ∫⁻ ω in A, (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω ∂ρ :=
      setLIntegral_trim (ℱ.le n) hf hA

/--
Durrett 2019, Theorem 4.3.5 eventual restricted-density identity: if an event
is visible at time `m`, then all later trimmed RN derivatives integrate to the
same original measure value.
-/
theorem durrett2019_theorem_4_3_5_eventually_trimmed_rnDeriv_setLIntegral
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} {ℱ : Filtration ℕ mΩ}
    [IsFiniteMeasure μ] [IsFiniteMeasure ρ]
    (hμρ : ∀ n, μ.trim (ℱ.le n) ≪ ρ.trim (ℱ.le n))
    {A : Set Ω} {m : ℕ} (hA : MeasurableSet[ℱ m] A) :
    ∀ᶠ n in atTop,
      μ A =
        ∫⁻ ω in A, (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω ∂ρ := by
  filter_upwards [eventually_ge_atTop m] with n hmn
  exact
    durrett2019_theorem_4_3_5_trimmed_rnDeriv_setLIntegral
      (μ := μ) (ρ := ρ) (ℱ := ℱ) n (hμρ n)
      (ℱ.mono hmn A hA)

/--
Durrett 2019, Theorem 4.3.5 generator-class eventual restricted-density
identities.  This packages the source observation
`A ∈ ℱ_m ⊆ ℱ_n` for all later `n`.
-/
theorem durrett2019_theorem_4_3_5_generator_eventual_trimmed_rnDeriv_setLIntegral
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} {ℱ : Filtration ℕ mΩ}
    [IsFiniteMeasure μ] [IsFiniteMeasure ρ]
    (C : Set (Set Ω)) (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hμρ : ∀ n, μ.trim (ℱ.le n) ≪ ρ.trim (ℱ.le n)) :
    (∀ s ∈ C,
      ∀ᶠ n in atTop,
        μ s =
          ∫⁻ ω in s, (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω ∂ρ) ∧
      (∀ᶠ n in atTop,
        μ Set.univ =
          ∫⁻ ω, (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω ∂ρ) := by
  refine ⟨?_, ?_⟩
  · intro s hs
    rcases hC_meas s hs with ⟨m, hsm⟩
    exact
      durrett2019_theorem_4_3_5_eventually_trimmed_rnDeriv_setLIntegral
        (μ := μ) (ρ := ρ) (ℱ := ℱ) hμρ hsm
  · refine (eventually_ge_atTop 0).mono ?_
    intro n _
    have h :=
      durrett2019_theorem_4_3_5_trimmed_rnDeriv_setLIntegral
        (μ := μ) (ρ := ρ) (ℱ := ℱ) n (hμρ n)
        (A := Set.univ) MeasurableSet.univ
    simpa [setLIntegral_univ] using h

/--
Durrett 2019, Theorem 4.3.5 source endpoint specialized to the trimmed RN
derivative sequences used in the proof.  The generator-event identities are
now discharged from `A ∈ ℱ_m`; remaining source obligations are the bounded
convergence hypotheses, the density ratio, and top-set singular separation.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_trimmed_rnDeriv_limits_ratio_top_set
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [IsFiniteMeasure ρ]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {BY BZ : ℝ≥0∞} {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμρ : ∀ n, μ.trim (ℱ.le n) ≪ ρ.trim (ℱ.le n))
    (hνρ : ∀ n, ν.trim (ℱ.le n) ≪ ρ.trim (ℱ.le n))
    (hYbound : ∀ n,
      (fun ω => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ≤ᵐ[ρ] fun _ => BY)
    (hBY : BY ≠ ∞)
    (hYlim : ∀ᵐ ω ∂ρ,
      Tendsto (fun n => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω)
        atTop (𝓝 (Y ω)))
    (hZbound : ∀ n,
      (fun ω => (ν.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ≤ᵐ[ρ] fun _ => BZ)
    (hBZ : BZ ≠ ∞)
    (hZlim : ∀ᵐ ω ∂ρ,
      Tendsto (fun n => (ν.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω)
        atTop (𝓝 (Z ω)))
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  have hYseq : ∀ n,
      AEMeasurable
        (fun ω => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ρ := by
    intro n
    exact
      ((Measure.measurable_rnDeriv (μ.trim (ℱ.le n)) (ρ.trim (ℱ.le n))).mono
        (ℱ.le n) le_rfl).aemeasurable
  have hZseq : ∀ n,
      AEMeasurable
        (fun ω => (ν.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ρ := by
    intro n
    exact
      ((Measure.measurable_rnDeriv (ν.trim (ℱ.le n)) (ρ.trim (ℱ.le n))).mono
        (ℱ.le n) le_rfl).aemeasurable
  obtain ⟨hμCevent, hμuniv_event⟩ :=
    durrett2019_theorem_4_3_5_generator_eventual_trimmed_rnDeriv_setLIntegral
      (μ := μ) (ρ := ρ) (ℱ := ℱ) C hC_meas hμρ
  obtain ⟨hνCevent, hνuniv_event⟩ :=
    durrett2019_theorem_4_3_5_generator_eventual_trimmed_rnDeriv_setLIntegral
      (μ := ν) (ρ := ρ) (ℱ := ℱ) C hC_meas hνρ
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_bounded_convergence_ratio_top_set
      (μ := μ) (ν := ν) (ρ := ρ)
      (Yseq := fun n ω => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω)
      (Zseq := fun n ω => (ν.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω)
      hA C hY hZ hgen hC
      hYseq hYbound hBY hYlim hZseq hZbound hBZ hZlim
      hμCevent hνCevent hμuniv_event hνuniv_event hX hμtop hνtop

end ProbabilityTheory
end StatInference
