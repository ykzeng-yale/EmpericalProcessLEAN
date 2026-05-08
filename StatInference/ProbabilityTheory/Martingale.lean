import Mathlib.Probability.BorelCantelli
import Mathlib.Probability.Independence.ZeroOne
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
Durrett 2019, Theorem 4.3.5 top-set separation primitive: if `Z`
represents `nu` as a density with respect to `rho`, then a finite numerator
`Y` makes the ratio top set `nu`-null.
-/
theorem durrett2019_theorem_4_3_5_density_ratio_top_set_nu_zero_of_withDensity
    {Ω : Type*} [MeasurableSpace Ω]
    {ν ρ : Measure Ω} {Y Z : Ω -> ℝ≥0∞}
    (hν : ν = ρ.withDensity Z) (hZ : AEMeasurable Z ρ)
    (hYfin : ∀ ω, Y ω ≠ ∞) :
    ν {ω | Y ω / Z ω = ∞} = 0 := by
  rw [hν, withDensity_apply_eq_zero' hZ]
  have hsubset :
      {ω | Z ω ≠ 0} ∩ {ω | Y ω / Z ω = ∞} ⊆ (∅ : Set Ω) := by
    rintro ω ⟨hZω_ne_zero, htopω⟩
    rcases (ENNReal.div_eq_top.mp htopω) with hzero | htop
    · exact False.elim (hZω_ne_zero hzero.2)
    · exact False.elim (hYfin ω htop.1)
  exact measure_mono_null hsubset (measure_empty : ρ (∅ : Set Ω) = 0)

/--
Durrett 2019, Theorem 4.3.5 generator-level top-set separation primitive:
once bounded convergence has proved that `Z` represents `nu`, the ratio top
set is `nu`-null whenever the numerator density is finite.
-/
theorem durrett2019_theorem_4_3_5_density_ratio_top_set_nu_zero_of_generate_finite
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {ν ρ : Measure Ω} [IsFiniteMeasure ν] [SigmaFinite ρ]
    {Y Z : Ω -> ℝ≥0∞} (C : Set (Set Ω))
    (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hνC : ∀ s ∈ C, ν s = ∫⁻ ω in s, Z ω ∂ρ)
    (hνuniv : ν Set.univ = ∫⁻ ω, Z ω ∂ρ)
    (hYfin : ∀ ω, Y ω ≠ ∞) :
    ν {ω | Y ω / Z ω = ∞} = 0 := by
  have hνeq : ν = ρ.withDensity Z :=
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := ν) (ρ := ρ) C hgen hC hνC hνuniv
  exact
    durrett2019_theorem_4_3_5_density_ratio_top_set_nu_zero_of_withDensity
      (ν := ν) (ρ := ρ) (Y := Y) (Z := Z) hνeq hZ hYfin

/--
Durrett 2019, Theorem 4.3.5 ratio support primitive: on the complement of
the ratio top set, the `Y`-density measure is absolutely continuous with
respect to the `Z`-density measure.
-/
theorem
    durrett2019_theorem_4_3_5_density_ratio_compl_top_restrict_absolutelyContinuous
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} {Y Z : Ω -> ℝ≥0∞}
    (hμ : μ = ρ.withDensity Y) (hν : ν = ρ.withDensity Z)
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ) :
    μ.restrict {ω | Y ω / Z ω = ∞}ᶜ ≪ ν := by
  refine Measure.AbsolutelyContinuous.mk fun A hA hνA => ?_
  have hνAρ : ρ ({ω | Z ω ≠ 0} ∩ A) = 0 := by
    rwa [hν, withDensity_apply_eq_zero' hZ] at hνA
  rw [hμ, Measure.restrict_apply hA, withDensity_apply_eq_zero' hY]
  refine measure_mono_null ?_ hνAρ
  rintro ω ⟨hYω_ne_zero, hωA, hω_not_top⟩
  refine ⟨?_, hωA⟩
  intro hZω
  exact hω_not_top (ENNReal.div_eq_top.mpr (Or.inl ⟨hYω_ne_zero, hZω⟩))

/--
Durrett 2019, Theorem 4.3.5 singular-support primitive: if `mu` and `nu` are
represented by densities `Y` and `Z` with respect to a common measure, then the
singular part of `mu` with respect to `nu` is supported on `{Y/Z = infinity}`.
-/
theorem durrett2019_theorem_4_3_5_density_ratio_singularPart_compl_top_zero
    {Ω : Type*} [MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [μ.HaveLebesgueDecomposition ν]
    {Y Z : Ω -> ℝ≥0∞}
    (hμ : μ = ρ.withDensity Y) (hν : ν = ρ.withDensity Z)
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ) :
    μ.singularPart ν {ω | Y ω / Z ω = ∞}ᶜ = 0 := by
  let S : Set Ω := {ω | Y ω / Z ω = ∞}
  have hμ_restrict_ac : μ.restrict Sᶜ ≪ ν :=
    durrett2019_theorem_4_3_5_density_ratio_compl_top_restrict_absolutelyContinuous
      (μ := μ) (ν := ν) (ρ := ρ) (Y := Y) (Z := Z) hμ hν hY hZ
  have hsing_ac : (μ.singularPart ν).restrict Sᶜ ≪ ν := by
    exact
      (Measure.absolutelyContinuous_of_le
        (Measure.restrict_mono_measure (Measure.singularPart_le μ ν) Sᶜ)).trans
        hμ_restrict_ac
  have hsing_ms : (μ.singularPart ν).restrict Sᶜ ⟂ₘ ν :=
    (Measure.mutuallySingular_singularPart μ ν).restrict Sᶜ
  have hzero : (μ.singularPart ν).restrict Sᶜ = 0 :=
    Measure.eq_zero_of_absolutelyContinuous_of_mutuallySingular hsing_ac hsing_ms
  exact Measure.restrict_eq_zero.mp hzero

/--
Durrett 2019, Theorem 4.3.5 generator-level singular-support primitive:
generator set-integral identities for `Y` and `Z` imply the singular part is
supported on `{Y/Z = infinity}`.
-/
theorem
    durrett2019_theorem_4_3_5_density_ratio_singularPart_compl_top_zero_of_generate_finite
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    [μ.HaveLebesgueDecomposition ν]
    {Y Z : Ω -> ℝ≥0∞} (C : Set (Set Ω))
    (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμC : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (hνC : ∀ s ∈ C, ν s = ∫⁻ ω in s, Z ω ∂ρ)
    (hμuniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ)
    (hνuniv : ν Set.univ = ∫⁻ ω, Z ω ∂ρ) :
    μ.singularPart ν {ω | Y ω / Z ω = ∞}ᶜ = 0 := by
  have hμeq : μ = ρ.withDensity Y :=
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := μ) (ρ := ρ) C hgen hC hμC hμuniv
  have hνeq : ν = ρ.withDensity Z :=
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := ν) (ρ := ρ) C hgen hC hνC hνuniv
  exact
    durrett2019_theorem_4_3_5_density_ratio_singularPart_compl_top_zero
      (μ := μ) (ν := ν) (ρ := ρ) (Y := Y) (Z := Z) hμeq hνeq hY hZ

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
Durrett 2019, Theorem 4.3.5 generator-level ratio endpoint with the `nu`-null
top-set obligation discharged from the denominator density representation.
The remaining top-set obligation is the singular-part support statement.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_generate_finite_ratio_mu_top
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    [μ.HaveLebesgueDecomposition ν]
    {Y Z : Ω -> ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (C : Set (Set Ω)) (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμC : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (hνC : ∀ s ∈ C, ν s = ∫⁻ ω in s, Z ω ∂ρ)
    (hμuniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ)
    (hνuniv : ν Set.univ = ∫⁻ ω, Z ω ∂ρ)
    (hYfin : ∀ ω, Y ω ≠ ∞)
    (hμtop : μ.singularPart ν {ω | Y ω / Z ω = ∞}ᶜ = 0) :
    μ.real A =
      ∫ ω in A, (Y ω / Z ω).toReal ∂ν +
        μ.real (A ∩ {ω | Y ω / Z ω = ∞}) := by
  have hνtop : ν {ω | Y ω / Z ω = ∞} = 0 :=
    durrett2019_theorem_4_3_5_density_ratio_top_set_nu_zero_of_generate_finite
      (ν := ν) (ρ := ρ) (Y := Y) (Z := Z) C hZ hgen hC hνC hνuniv hYfin
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_generate_finite_ratio_top_set
      (μ := μ) (ν := ν) (ρ := ρ) (X := fun ω => Y ω / Z ω)
      hA C hY hZ hgen hC hμC hνC hμuniv hνuniv
      Filter.EventuallyEq.rfl hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 generator-level ratio endpoint with both top-set
separation obligations discharged from the common-density representations.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_generate_finite_ratio
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν ρ : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] [SigmaFinite ρ]
    [μ.HaveLebesgueDecomposition ν]
    {Y Z : Ω -> ℝ≥0∞} {A : Set Ω} (hA : MeasurableSet A)
    (C : Set (Set Ω)) (hY : AEMeasurable Y ρ) (hZ : AEMeasurable Z ρ)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμC : ∀ s ∈ C, μ s = ∫⁻ ω in s, Y ω ∂ρ)
    (hνC : ∀ s ∈ C, ν s = ∫⁻ ω in s, Z ω ∂ρ)
    (hμuniv : μ Set.univ = ∫⁻ ω, Y ω ∂ρ)
    (hνuniv : ν Set.univ = ∫⁻ ω, Z ω ∂ρ)
    (hYfin : ∀ ω, Y ω ≠ ∞) :
    μ.real A =
      ∫ ω in A, (Y ω / Z ω).toReal ∂ν +
        μ.real (A ∩ {ω | Y ω / Z ω = ∞}) := by
  have hμtop : μ.singularPart ν {ω | Y ω / Z ω = ∞}ᶜ = 0 :=
    durrett2019_theorem_4_3_5_density_ratio_singularPart_compl_top_zero_of_generate_finite
      (μ := μ) (ν := ν) (ρ := ρ) (Y := Y) (Z := Z) C hY hZ
      hgen hC hμC hνC hμuniv hνuniv
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_generate_finite_ratio_mu_top
      (μ := μ) (ν := ν) (ρ := ρ) hA C hY hZ hgen hC
      hμC hνC hμuniv hνuniv hYfin hμtop

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

/--
Durrett 2019, Theorem 4.3.5 trimmed-density boundedness primitive: if the
trimmed numerator measure is bounded by the trimmed denominator measure, then
the corresponding RN derivative is at most one with respect to the original
denominator measure.
-/
theorem durrett2019_theorem_4_3_5_trimmed_rnDeriv_le_one_of_trim_le
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} {ℱ : Filtration ℕ mΩ} [IsFiniteMeasure ρ] (n : ℕ)
    (hle : μ.trim (ℱ.le n) ≤ ρ.trim (ℱ.le n)) :
    (fun ω => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ≤ᵐ[ρ]
      fun _ => (1 : ℝ≥0∞) :=
  ae_le_of_ae_le_trim (hm := ℱ.le n) (μ := ρ)
    (Measure.rnDeriv_le_one_of_le hle)

/--
Durrett 2019, Theorem 4.3.5: the trimmed RN derivative sequence is uniformly
bounded by one whenever every trimmed numerator is bounded by the corresponding
trimmed denominator.
-/
theorem durrett2019_theorem_4_3_5_trimmed_rnDeriv_sequence_le_one_of_trim_le
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ρ : Measure Ω} {ℱ : Filtration ℕ mΩ} [IsFiniteMeasure ρ]
    (hle : ∀ n, μ.trim (ℱ.le n) ≤ ρ.trim (ℱ.le n)) :
    ∀ n,
      (fun ω => (μ.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ≤ᵐ[ρ]
        fun _ => (1 : ℝ≥0∞) := fun n =>
  durrett2019_theorem_4_3_5_trimmed_rnDeriv_le_one_of_trim_le
    (μ := μ) (ρ := ρ) (ℱ := ℱ) n (hle n)

/--
Durrett 2019, Theorem 4.3.5: using `mu + nu` as the finite dominating measure,
both source RN derivative sequences are bounded by one.
-/
theorem durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_bounds
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} :
    (∀ n,
      (fun ω => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        ≤ᵐ[μ + ν] fun _ => (1 : ℝ≥0∞)) ∧
      (∀ n,
        (fun ω => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
          ≤ᵐ[μ + ν] fun _ => (1 : ℝ≥0∞)) := by
  constructor
  · refine
      durrett2019_theorem_4_3_5_trimmed_rnDeriv_sequence_le_one_of_trim_le
        (μ := μ) (ρ := μ + ν) (ℱ := ℱ) ?_
    intro n
    rw [trim_add]
    exact Measure.le_add_right le_rfl
  · refine
      durrett2019_theorem_4_3_5_trimmed_rnDeriv_sequence_le_one_of_trim_le
        (μ := ν) (ρ := μ + ν) (ℱ := ℱ) ?_
    intro n
    rw [trim_add]
    exact Measure.le_add_left le_rfl

/--
Durrett 2019, Theorem 4.3.5 source endpoint specialized to the natural
dominating measure `mu + nu`.  This discharges the uniform boundedness and
restricted absolute-continuity obligations for the two trimmed RN derivative
sequences; the remaining source obligations are convergence to `Y` and `Z`,
the density ratio, and top-set singular separation.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_trimmed_rnDeriv_limits
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hY : AEMeasurable Y (μ + ν)) (hZ : AEMeasurable Z (μ + ν))
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hYlim : ∀ᵐ ω ∂(μ + ν),
      Tendsto (fun n => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        atTop (𝓝 (Y ω)))
    (hZlim : ∀ᵐ ω ∂(μ + ν),
      Tendsto (fun n => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        atTop (𝓝 (Z ω)))
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  have hμρ : ∀ n, μ.trim (ℱ.le n) ≪ (μ + ν).trim (ℱ.le n) := by
    intro n
    refine Measure.absolutelyContinuous_of_le ?_
    rw [trim_add]
    exact Measure.le_add_right le_rfl
  have hνρ : ∀ n, ν.trim (ℱ.le n) ≪ (μ + ν).trim (ℱ.le n) := by
    intro n
    refine Measure.absolutelyContinuous_of_le ?_
    rw [trim_add]
    exact Measure.le_add_left le_rfl
  obtain ⟨hYbound, hZbound⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_bounds
      (μ := μ) (ν := ν) (ℱ := ℱ)
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_trimmed_rnDeriv_limits_ratio_top_set
      (μ := μ) (ν := ν) (ρ := μ + ν) (ℱ := ℱ) (BY := 1) (BZ := 1)
      hA C hC_meas hY hZ hgen hC hμρ hνρ hYbound (by simp)
      hYlim hZbound (by simp) hZlim hX hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 convergence-transfer primitive: a sequence of
finite `ENNReal` values that is uniformly bounded by one a.e. converges in
`ENNReal` whenever its `toReal` sequence converges to the `toReal` of a finite
limit.
-/
theorem durrett2019_theorem_4_3_5_ae_ennreal_tendsto_of_toReal_tendsto_le_one
    {Ω : Type*} [MeasurableSpace Ω] {ρ : Measure Ω}
    {Yseq : ℕ -> Ω -> ℝ≥0∞} {Y : Ω -> ℝ≥0∞}
    (hbound : ∀ n, Yseq n ≤ᵐ[ρ] fun _ => (1 : ℝ≥0∞))
    (hYfin : ∀ᵐ ω ∂ρ, Y ω ≠ ∞)
    (hlim : ∀ᵐ ω ∂ρ,
      Tendsto (fun n => (Yseq n ω).toReal) atTop (𝓝 ((Y ω).toReal))) :
    ∀ᵐ ω ∂ρ, Tendsto (fun n => Yseq n ω) atTop (𝓝 (Y ω)) := by
  have hbound_all : ∀ᵐ ω ∂ρ, ∀ n, Yseq n ω ≤ (1 : ℝ≥0∞) :=
    ae_all_iff.2 hbound
  filter_upwards [hbound_all, hYfin, hlim] with ω hω_bound hYω hlimω
  have hseq_fin : ∀ n, Yseq n ω ≠ ∞ := fun n =>
    ne_top_of_le_ne_top ENNReal.one_ne_top (hω_bound n)
  exact (ENNReal.tendsto_toReal_iff hseq_fin hYω).mp hlimω

/--
Durrett 2019, Theorem 4.3.5 source endpoint specialized to `mu + nu`, with
the remaining convergence hypotheses stated for the real-valued `toReal`
trimmed RN derivative sequences.  This packages the bounded `ENNReal`
transfer needed before applying bounded martingale convergence APIs.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_trimmed_rnDeriv_toReal_limits
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {X Y Z : Ω -> ℝ≥0∞} {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hY : AEMeasurable Y (μ + ν)) (hZ : AEMeasurable Z (μ + ν))
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hYfin : ∀ᵐ ω ∂(μ + ν), Y ω ≠ ∞)
    (hZfin : ∀ᵐ ω ∂(μ + ν), Z ω ≠ ∞)
    (hYlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop (𝓝 ((Y ω).toReal)))
    (hZlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop (𝓝 ((Z ω).toReal)))
    (hX : X =ᵐ[ν] fun ω => Y ω / Z ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  obtain ⟨hYbound, hZbound⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_bounds
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hYlim : ∀ᵐ ω ∂(μ + ν),
      Tendsto (fun n => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        atTop (𝓝 (Y ω)) :=
    durrett2019_theorem_4_3_5_ae_ennreal_tendsto_of_toReal_tendsto_le_one
      (ρ := μ + ν)
      (Yseq := fun n ω => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
      (Y := Y) hYbound hYfin hYlim_real
  have hZlim : ∀ᵐ ω ∂(μ + ν),
      Tendsto (fun n => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        atTop (𝓝 (Z ω)) :=
    durrett2019_theorem_4_3_5_ae_ennreal_tendsto_of_toReal_tendsto_le_one
      (ρ := μ + ν)
      (Yseq := fun n ω => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
      (Y := Z) hZbound hZfin hZlim_real
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_trimmed_rnDeriv_limits
      (μ := μ) (ν := ν) (ℱ := ℱ)
      hA C hC_meas hY hZ hgen hC hYlim hZlim hX hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 denominator-density representation under the
natural dominating measure `mu + nu`: real convergence of the trimmed
denominator likelihood process identifies the limiting `Z` as the density of
`nu` with respect to `mu + nu`.
-/
theorem
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_nu_withDensity_eq
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} {Z : Ω -> ℝ≥0∞}
    (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hZfin : ∀ᵐ ω ∂(μ + ν), Z ω ≠ ∞)
    (hZlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop (𝓝 ((Z ω).toReal))) :
    ν = (μ + ν).withDensity Z := by
  have hνρ : ∀ n, ν.trim (ℱ.le n) ≪ (μ + ν).trim (ℱ.le n) := by
    intro n
    refine Measure.absolutelyContinuous_of_le ?_
    rw [trim_add]
    exact Measure.le_add_left le_rfl
  obtain ⟨_, hZbound⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_bounds
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hZlim : ∀ᵐ ω ∂(μ + ν),
      Tendsto (fun n => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        atTop (𝓝 (Z ω)) :=
    durrett2019_theorem_4_3_5_ae_ennreal_tendsto_of_toReal_tendsto_le_one
      (ρ := μ + ν)
      (Yseq := fun n ω => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
      (Y := Z) hZbound hZfin hZlim_real
  have hZseq : ∀ n,
      AEMeasurable
        (fun ω => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        (μ + ν) := by
    intro n
    exact
      ((Measure.measurable_rnDeriv (ν.trim (ℱ.le n)) ((μ + ν).trim (ℱ.le n))).mono
        (ℱ.le n) le_rfl).aemeasurable
  obtain ⟨hνCevent, hνuniv_event⟩ :=
    durrett2019_theorem_4_3_5_generator_eventual_trimmed_rnDeriv_setLIntegral
      (μ := ν) (ρ := μ + ν) (ℱ := ℱ) C hC_meas hνρ
  obtain ⟨hνC, hνuniv⟩ :=
    durrett2019_theorem_4_3_5_generator_integrals_of_bounded_convergence
      (μ := ν) (ρ := μ + ν)
      (Yseq := fun n ω => (ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
      (Y := Z) (B := 1) C hZseq hZbound (by simp)
      hZlim hνCevent hνuniv_event
  exact
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := ν) (ρ := μ + ν) C hgen hC hνC hνuniv

/--
Durrett 2019, Theorem 4.3.5 numerator-density representation under the
natural dominating measure `mu + nu`: real convergence of the trimmed
numerator likelihood process identifies the limiting `Y` as the density of
`mu` with respect to `mu + nu`.
-/
theorem
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_mu_withDensity_eq
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} {Y : Ω -> ℝ≥0∞}
    (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hYfin : ∀ᵐ ω ∂(μ + ν), Y ω ≠ ∞)
    (hYlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop (𝓝 ((Y ω).toReal))) :
    μ = (μ + ν).withDensity Y := by
  have hμρ : ∀ n, μ.trim (ℱ.le n) ≪ (μ + ν).trim (ℱ.le n) := by
    intro n
    refine Measure.absolutelyContinuous_of_le ?_
    rw [trim_add]
    exact Measure.le_add_right le_rfl
  obtain ⟨hYbound, _⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_bounds
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hYlim : ∀ᵐ ω ∂(μ + ν),
      Tendsto (fun n => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        atTop (𝓝 (Y ω)) :=
    durrett2019_theorem_4_3_5_ae_ennreal_tendsto_of_toReal_tendsto_le_one
      (ρ := μ + ν)
      (Yseq := fun n ω => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
      (Y := Y) hYbound hYfin hYlim_real
  have hYseq : ∀ n,
      AEMeasurable
        (fun ω => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
        (μ + ν) := by
    intro n
    exact
      ((Measure.measurable_rnDeriv (μ.trim (ℱ.le n)) ((μ + ν).trim (ℱ.le n))).mono
        (ℱ.le n) le_rfl).aemeasurable
  obtain ⟨hμCevent, hμuniv_event⟩ :=
    durrett2019_theorem_4_3_5_generator_eventual_trimmed_rnDeriv_setLIntegral
      (μ := μ) (ρ := μ + ν) (ℱ := ℱ) C hC_meas hμρ
  obtain ⟨hμC, hμuniv⟩ :=
    durrett2019_theorem_4_3_5_generator_integrals_of_bounded_convergence
      (μ := μ) (ρ := μ + ν)
      (Yseq := fun n ω => (μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω)
      (Y := Y) (B := 1) C hYseq hYbound (by simp)
      hYlim hμCevent hμuniv_event
  exact
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := μ) (ρ := μ + ν) C hgen hC hμC hμuniv

/--
Durrett 2019, Theorem 4.3.5 bounded-real bridge: an integrable real function
whose norm is bounded by one a.e. has the L1/eLpNorm bound supplied by the
total mass of the finite measure.
-/
theorem durrett2019_eLpNorm_one_le_measureReal_of_ae_norm_le_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {ρ : Measure Ω} [IsFiniteMeasure ρ] {X : Ω -> ℝ}
    (hX : Integrable X ρ) (hbound : ∀ᵐ ω ∂ρ, ‖X ω‖ ≤ (1 : ℝ)) :
    eLpNorm X 1 ρ ≤ ENNReal.ofReal (ρ.real Set.univ) := by
  have h_integral_bound : ∫ ω, ‖X ω‖ ∂ρ ≤ ρ.real Set.univ := by
    calc
      ∫ ω, ‖X ω‖ ∂ρ ≤ ∫ _ω, (1 : ℝ) ∂ρ :=
        integral_mono_ae hX.norm (integrable_const (1 : ℝ)) hbound
      _ = ρ.real Set.univ := by simp
  have h :=
    durrett2019_eLpNorm_one_le_of_integral_norm_le
      (μ := ρ) hX measureReal_nonneg h_integral_bound
  simpa using h

/--
Durrett 2019, Theorem 4.3.5 bounded-real martingale convergence bridge:
a martingale whose entries are a.e. norm-bounded by one converges almost
surely to mathlib's filtration limit process.
-/
theorem durrett2019_theorem_4_3_5_bounded_martingale_ae_tendsto_limitProcess
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {ρ : Measure Ω} [IsFiniteMeasure ρ] {ℱ : Filtration ℕ mΩ}
    {X : ℕ -> Ω -> ℝ} (hX : Martingale X ℱ ρ)
    (hbound : ∀ n, ∀ᵐ ω ∂ρ, ‖X n ω‖ ≤ (1 : ℝ)) :
    ∀ᵐ ω ∂ρ, Tendsto (fun n => X n ω) atTop (𝓝 (ℱ.limitProcess X ρ ω)) :=
  durrett2019_theorem_4_2_11_martingale_ae_tendsto_limitProcess_of_eLpNorm_bdd
    (R := ⟨ρ.real Set.univ, measureReal_nonneg⟩) hX
    (fun n => by
      simpa [ENNReal.ofReal_eq_coe_nnreal measureReal_nonneg] using
        durrett2019_eLpNorm_one_le_measureReal_of_ae_norm_le_one
          (ρ := ρ) (X := X n) (hX.integrable n) (hbound n))

/--
Durrett 2019, Theorem 4.3.5 `toReal` bound primitive: an `ENNReal` density
bounded by one has real cast with norm bounded by one.
-/
theorem durrett2019_theorem_4_3_5_toReal_norm_le_one_of_ennreal_le_one
    {Ω : Type*} [MeasurableSpace Ω] {ρ : Measure Ω} {Y : Ω -> ℝ≥0∞}
    (hY : Y ≤ᵐ[ρ] fun _ => (1 : ℝ≥0∞)) :
    (fun ω => ‖(Y ω).toReal‖) ≤ᵐ[ρ] fun _ => (1 : ℝ) := by
  filter_upwards [hY] with ω hω
  have hle : (Y ω).toReal ≤ (1 : ℝ) := by
    simpa using ENNReal.toReal_mono ENNReal.one_ne_top hω
  simpa [Real.norm_eq_abs, abs_of_nonneg ENNReal.toReal_nonneg] using hle

/--
Durrett 2019, Theorem 4.3.5 trimmed RN `toReal` convergence bridge: if the
trimmed RN derivative sequence is bounded by one, its real-valued likelihood
ratio martingale converges to the filtration limit process.
-/
theorem
    durrett2019_theorem_4_3_5_trimmed_rnDeriv_toReal_ae_tendsto_limitProcess_of_le_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {η ρ : Measure Ω} [IsFiniteMeasure η] [IsFiniteMeasure ρ]
    {ℱ : Filtration ℕ mΩ}
    (hηρ : ∀ n, η.trim (ℱ.le n) ≪ ρ.trim (ℱ.le n))
    (hbound : ∀ n,
      (fun ω => (η.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω) ≤ᵐ[ρ]
        fun _ => (1 : ℝ≥0∞)) :
    ∀ᵐ ω ∂ρ,
      Tendsto
        (fun n => ((η.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 (ℱ.limitProcess
          (fun n ω => ((η.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω).toReal)
          ρ ω)) := by
  have hM :
      Martingale
        (fun n ω => ((η.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω).toReal)
        ℱ ρ :=
    durrett2019_lemma_4_3_6_trimmed_rnDeriv_martingale
      (μ := η) (ν := ρ) (ℱ := ℱ) hηρ
  have hreal_bound : ∀ n, ∀ᵐ ω ∂ρ,
      ‖((η.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω).toReal‖ ≤ (1 : ℝ) := by
    intro n
    exact
      durrett2019_theorem_4_3_5_toReal_norm_le_one_of_ennreal_le_one
        (ρ := ρ)
        (Y := fun ω => (η.trim (ℱ.le n)).rnDeriv (ρ.trim (ℱ.le n)) ω)
        (hbound n)
  exact
    durrett2019_theorem_4_3_5_bounded_martingale_ae_tendsto_limitProcess
      (ρ := ρ) (ℱ := ℱ) hM hreal_bound

/--
Durrett 2019, Theorem 4.3.5 with the natural dominating measure `mu + nu`:
both real-valued trimmed RN derivative sequences converge to their filtration
limit processes.
-/
theorem
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limitProcess_convergence
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} :
    (∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n => ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 (ℱ.limitProcess
          (fun n ω => ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
          (μ + ν) ω))) ∧
      (∀ᵐ ω ∂(μ + ν),
        Tendsto
          (fun n => ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
          atTop
          (𝓝 (ℱ.limitProcess
            (fun n ω =>
              ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
            (μ + ν) ω))) := by
  have hμρ : ∀ n, μ.trim (ℱ.le n) ≪ (μ + ν).trim (ℱ.le n) := by
    intro n
    refine Measure.absolutelyContinuous_of_le ?_
    rw [trim_add]
    exact Measure.le_add_right le_rfl
  have hνρ : ∀ n, ν.trim (ℱ.le n) ≪ (μ + ν).trim (ℱ.le n) := by
    intro n
    refine Measure.absolutelyContinuous_of_le ?_
    rw [trim_add]
    exact Measure.le_add_left le_rfl
  obtain ⟨hμbound, hνbound⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_bounds
      (μ := μ) (ν := ν) (ℱ := ℱ)
  exact
    ⟨durrett2019_theorem_4_3_5_trimmed_rnDeriv_toReal_ae_tendsto_limitProcess_of_le_one
        (η := μ) (ρ := μ + ν) (ℱ := ℱ) hμρ hμbound,
      durrett2019_theorem_4_3_5_trimmed_rnDeriv_toReal_ae_tendsto_limitProcess_of_le_one
        (η := ν) (ρ := μ + ν) (ℱ := ℱ) hνρ hνbound⟩

/--
Durrett 2019, Theorem 4.3.5 canonical real limit candidate for the numerator
trimmed RN derivatives under the natural dominating measure `mu + nu`.
-/
noncomputable def durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (μ ν : Measure Ω) (ℱ : Filtration ℕ mΩ) : Ω -> ℝ :=
  ℱ.limitProcess
    (fun n ω => ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
    (μ + ν)

/--
Durrett 2019, Theorem 4.3.5 canonical real limit candidate for the denominator
trimmed RN derivatives under the natural dominating measure `mu + nu`.
-/
noncomputable def durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (μ ν : Measure Ω) (ℱ : Filtration ℕ mΩ) : Ω -> ℝ :=
  ℱ.limitProcess
    (fun n ω => ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
    (μ + ν)

/--
Durrett 2019, Theorem 4.3.5 canonical finite `ENNReal` density candidate for
the numerator measure, obtained from the real limit process.
-/
noncomputable def durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (μ ν : Measure Ω) (ℱ : Filtration ℕ mΩ) : Ω -> ℝ≥0∞ :=
  fun ω => ENNReal.ofReal
    (durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω)

/--
Durrett 2019, Theorem 4.3.5 canonical finite `ENNReal` density candidate for
the denominator measure, obtained from the real limit process.
-/
noncomputable def durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (μ ν : Measure Ω) (ℱ : Filtration ℕ mΩ) : Ω -> ℝ≥0∞ :=
  fun ω => ENNReal.ofReal
    (durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω)

/--
Durrett 2019, Theorem 4.3.5 canonical limit-candidate endpoint: the natural
`mu + nu` trimmed RN `toReal` martingale limits are packaged as finite
`ENNReal` density candidates and fed to the source endpoint.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_limitDensities
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {X : Ω -> ℝ≥0∞} {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hX : X =ᵐ[ν] fun ω =>
      durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω /
        durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ.real A = ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}) := by
  obtain ⟨hYlim_lp, hZlim_lp⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limitProcess_convergence
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hYreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hZreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hY :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity] using
      hYreal.ennreal_ofReal
  have hZ :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity] using
      hZreal.ennreal_ofReal
  have hYfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
  have hZfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
  have hYnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hYlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit] using hnonneg
  have hZnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hZlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit] using hnonneg
  have hYlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hYlim_lp, hYnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit, htarget] using hlimω
  have hZlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hZlim_lp, hZnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit, htarget] using hlimω
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_trimmed_rnDeriv_toReal_limits
      (μ := μ) (ν := ν) (ℱ := ℱ)
      (Y := durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
      (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
      hA C hC_meas hY hZ hgen hC hYfin hZfin hYlim_real hZlim_real
      hX hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 canonical likelihood-ratio candidate, built from
the canonical `mu + nu` limit densities.
-/
noncomputable def durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    (μ ν : Measure Ω) (ℱ : Filtration ℕ mΩ) : Ω -> ℝ≥0∞ :=
  fun ω =>
    durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω /
      durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω

/--
Durrett 2019, Theorem 4.3.5 canonical ratio top-set separation on the
denominator side: the top set of the canonical likelihood ratio is `nu`-null.
-/
theorem durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_nu_top_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ}
    (C : Set (Set Ω)) (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C) :
    ν {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞} = 0 := by
  obtain ⟨_, hZlim_lp⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limitProcess_convergence
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hZreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hZ :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity] using
      hZreal.ennreal_ofReal
  have hZfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
  have hZnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hZlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit] using hnonneg
  have hZlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hZlim_lp, hZnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit, htarget] using hlimω
  have hνeq :
      ν =
        (μ + ν).withDensity
          (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ) :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_nu_withDensity_eq
      (μ := μ) (ν := ν) (ℱ := ℱ)
      (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
      C hC_meas hgen hC hZfin hZlim_real
  have hYfin : ∀ ω,
      durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω ≠ ∞ := by
    intro ω
    simp [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
  have hνtop :=
    durrett2019_theorem_4_3_5_density_ratio_top_set_nu_zero_of_withDensity
      (ν := ν) (ρ := μ + ν)
      (Y := durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
      (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
      hνeq hZ hYfin
  simpa [durrett2019_theorem_4_3_5_add_dominating_canonicalRatio] using hνtop

/--
Durrett 2019, Theorem 4.3.5 canonical-ratio endpoint: the canonical
`mu + nu` likelihood ratio is a `toReal` version of `dmu/dnu`.
-/
theorem durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_toReal_ae_rnDeriv
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ}
    (C : Set (Set Ω)) (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C) :
    (fun ω => (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω).toReal)
      =ᵐ[ν] fun ω => (μ.rnDeriv ν ω).toReal := by
  obtain ⟨hYlim_lp, hZlim_lp⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limitProcess_convergence
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hYreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hZreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hY :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity] using
      hYreal.ennreal_ofReal
  have hZ :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity] using
      hZreal.ennreal_ofReal
  have hYfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
  have hZfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
  have hYnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hYlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit] using hnonneg
  have hZnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hZlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit] using hnonneg
  have hYlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hYlim_lp, hYnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit, htarget] using hlimω
  have hZlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hZlim_lp, hZnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit, htarget] using hlimω
  have hYeq :
      durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ
        =ᵐ[ν] fun ω => μ.rnDeriv (μ + ν) ω := by
    have hwith :
        μ =
          (μ + ν).withDensity
            (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ) :=
      durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_mu_withDensity_eq
        (μ := μ) (ν := ν) (ℱ := ℱ)
        (Y := durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
        C hC_meas hgen hC hYfin hYlim_real
    have hρ :
        durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ
          =ᵐ[μ + ν] fun ω => μ.rnDeriv (μ + ν) ω := by
      have hderiv :
          μ.rnDeriv (μ + ν)
            =ᵐ[μ + ν]
              durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ := by
        have hderiv' :=
          Measure.rnDeriv_withDensity₀ (μ + ν) hY
        rwa [← hwith] at hderiv'
      exact hderiv.symm
    exact (Measure.absolutelyContinuous_of_le (Measure.le_add_left le_rfl)) hρ
  have hZeq :
      durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ
        =ᵐ[ν] fun ω => ν.rnDeriv (μ + ν) ω := by
    have hwith :
        ν =
          (μ + ν).withDensity
            (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ) :=
      durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_nu_withDensity_eq
        (μ := μ) (ν := ν) (ℱ := ℱ)
        (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
        C hC_meas hgen hC hZfin hZlim_real
    have hρ :
        durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ
          =ᵐ[μ + ν] fun ω => ν.rnDeriv (μ + ν) ω := by
      have hderiv :
          ν.rnDeriv (μ + ν)
            =ᵐ[μ + ν]
              durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ := by
        have hderiv' :=
          Measure.rnDeriv_withDensity₀ (μ + ν) hZ
        rwa [← hwith] at hderiv'
      exact hderiv.symm
    exact (Measure.absolutelyContinuous_of_le (Measure.le_add_left le_rfl)) hρ
  exact
    durrett2019_theorem_4_3_5_density_ratio_toReal_ae_of_ae_eq
      (μ := μ) (ν := ν) (ρ := μ + ν)
      (Y := durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
      (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
      (Measure.absolutelyContinuous_of_le (Measure.le_add_right le_rfl))
      (Measure.absolutelyContinuous_of_le (Measure.le_add_left le_rfl))
      hYeq hZeq

/--
Durrett 2019, Theorem 4.3.5 canonical ratio singular-support endpoint: the
singular part of `mu` with respect to `nu` is supported on the top set of the
canonical likelihood ratio.
-/
theorem
    durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_singularPart_compl_top_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    (C : Set (Set Ω)) (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C) :
    μ.singularPart ν
      {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞}ᶜ = 0 := by
  obtain ⟨hYlim_lp, hZlim_lp⟩ :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limitProcess_convergence
      (μ := μ) (ν := ν) (ℱ := ℱ)
  have hYreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hZreal :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ)
        (μ + ν) := by
    change AEMeasurable
      (ℱ.limitProcess
        (fun n ω => ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (μ + ν)) (μ + ν)
    exact
      (Filtration.stronglyMeasurable_limit_process'
        (f := fun n ω =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        (ℱ := ℱ) (μ := μ + ν)).aemeasurable
  have hY :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity] using
      hYreal.ennreal_ofReal
  have hZ :
      AEMeasurable
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
        (μ + ν) := by
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity] using
      hZreal.ennreal_ofReal
  have hYfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
  have hZfin : ∀ᵐ ω ∂(μ + ν),
      durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω ≠ ∞ := by
    filter_upwards with ω
    simp [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
  have hYnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hYlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit] using hnonneg
  have hZnonneg : ∀ᵐ ω ∂(μ + ν),
      0 ≤ durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
    filter_upwards [hZlim_lp] with ω hlimω
    have hnonneg :=
      le_of_tendsto_of_tendsto' tendsto_const_nhds hlimω
        (fun n => ENNReal.toReal_nonneg)
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit] using hnonneg
  have hYlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((μ.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hYlim_lp, hYnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_mu_toRealLimit, htarget] using hlimω
  have hZlim_real : ∀ᵐ ω ∂(μ + ν),
      Tendsto
        (fun n =>
          ((ν.trim (ℱ.le n)).rnDeriv ((μ + ν).trim (ℱ.le n)) ω).toReal)
        atTop
        (𝓝 ((durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal)) := by
    filter_upwards [hZlim_lp, hZnonneg] with ω hlimω hnonnegω
    have htarget :
        (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ ω).toReal =
          durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit μ ν ℱ ω := by
      rw [durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity]
      exact ENNReal.toReal_ofReal hnonnegω
    simpa [durrett2019_theorem_4_3_5_add_dominating_nu_toRealLimit, htarget] using hlimω
  have hμeq :
      μ =
        (μ + ν).withDensity
          (durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ) :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_mu_withDensity_eq
      (μ := μ) (ν := ν) (ℱ := ℱ)
      (Y := durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
      C hC_meas hgen hC hYfin hYlim_real
  have hνeq :
      ν =
        (μ + ν).withDensity
          (durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ) :=
    durrett2019_theorem_4_3_5_add_dominating_trimmed_rnDeriv_toReal_limit_nu_withDensity_eq
      (μ := μ) (ν := ν) (ℱ := ℱ)
      (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
      C hC_meas hgen hC hZfin hZlim_real
  have hμtop :=
    durrett2019_theorem_4_3_5_density_ratio_singularPart_compl_top_zero
      (μ := μ) (ν := ν) (ρ := μ + ν)
      (Y := durrett2019_theorem_4_3_5_add_dominating_mu_limitDensity μ ν ℱ)
      (Z := durrett2019_theorem_4_3_5_add_dominating_nu_limitDensity μ ν ℱ)
      hμeq hνeq hY hZ
  simpa [durrett2019_theorem_4_3_5_add_dominating_canonicalRatio] using hμtop

/--
Durrett 2019, Theorem 4.3.5 canonical-ratio endpoint: the `X = Y / Z`
source obligation is discharged by choosing the canonical ratio of the
canonical `mu + nu` limit densities.  The remaining source obligations are the
top-set singular separation hypotheses for this canonical ratio.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_canonicalRatio
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμtop : μ.singularPart ν
      {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞}ᶜ = 0)
    (hνtop : ν
      {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞} = 0) :
    μ.real A =
      ∫ ω in A,
        (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω).toReal ∂ν +
        μ.real
          (A ∩ {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞}) := by
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_limitDensities
      (μ := μ) (ν := ν) (ℱ := ℱ)
      (X := durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ)
      hA C hC_meas hgen hC
      Filter.EventuallyEq.rfl
      hμtop hνtop

/--
Durrett 2019, Theorem 4.3.5 canonical-ratio endpoint with the `nu`-null top
set discharged automatically.  The only remaining top-set source obligation is
the singular-part support statement for the canonical ratio.
-/
theorem
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_canonicalRatio_mu_top
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hμtop : μ.singularPart ν
      {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞}ᶜ = 0) :
    μ.real A =
      ∫ ω in A,
        (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω).toReal ∂ν +
        μ.real
          (A ∩ {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞}) := by
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_canonicalRatio
      (μ := μ) (ν := ν) (ℱ := ℱ) hA C hC_meas hgen hC hμtop
      (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_nu_top_zero
        (μ := μ) (ν := ν) (ℱ := ℱ) C hC_meas hgen hC)

/--
Durrett 2019, Theorem 4.3.5 canonical-ratio endpoint with both top-set
separation obligations discharged.  This is the source-facing likelihood-ratio
decomposition produced from the canonical `mu + nu` limiting densities.
-/
theorem durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_canonicalRatio_full
    {Ω : Type*} [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {ℱ : Filtration ℕ mΩ} [μ.HaveLebesgueDecomposition ν]
    {A : Set Ω}
    (hA : MeasurableSet A) (C : Set (Set Ω))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C) :
    μ.real A =
      ∫ ω in A,
        (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω).toReal ∂ν +
        μ.real
          (A ∩ {ω | durrett2019_theorem_4_3_5_add_dominating_canonicalRatio μ ν ℱ ω = ∞}) := by
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_add_dominating_canonicalRatio_mu_top
      (μ := μ) (ν := ν) (ℱ := ℱ) hA C hC_meas hgen hC
      (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_singularPart_compl_top_zero
        (μ := μ) (ν := ν) (ℱ := ℱ) C hC_meas hgen hC)

/-! ## Durrett, Example 4.3.7 -/

/--
Durrett 2019, Example 4.3.7 finite-partition likelihood approximation:
on each partition cell `cell k`, use the elementary ratio
`mu (cell k) / nu (cell k)`.
-/
noncomputable def durrett2019_example_4_3_7_finitePartitionLikelihood
    {κ Ω : Type*} [Fintype κ] [MeasurableSpace Ω]
    (μ ν : Measure Ω) (cell : κ -> Set Ω) : Ω -> ℝ≥0∞ :=
  fun ω => ∑ k, (cell k).indicator (fun _ => μ (cell k) / ν (cell k)) ω

/--
Durrett 2019, Example 4.3.7: the finite-partition likelihood approximation is
measurable when all cells are measurable.
-/
theorem durrett2019_example_4_3_7_finitePartitionLikelihood_measurable
    {κ Ω : Type*} [Fintype κ] [MeasurableSpace Ω]
    {μ ν : Measure Ω} {cell : κ -> Set Ω}
    (hcell : ∀ k, MeasurableSet (cell k)) :
    Measurable (durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell) := by
  classical
  refine Finset.measurable_fun_sum Finset.univ fun k _ => ?_
  exact measurable_const.indicator (hcell k)

/--
Durrett 2019, Example 4.3.7: on a disjoint partition cell, the elementary
likelihood approximation is the corresponding cell ratio.
-/
theorem durrett2019_example_4_3_7_finitePartitionLikelihood_eq_on_cell
    {κ Ω : Type*} [Fintype κ] [DecidableEq κ] [MeasurableSpace Ω]
    {μ ν : Measure Ω} {cell : κ -> Set Ω}
    (hdisj : Pairwise (fun i j => Disjoint (cell i) (cell j))) {k : κ} {ω : Ω}
    (hω : ω ∈ cell k) :
    durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell ω =
      μ (cell k) / ν (cell k) := by
  classical
  unfold durrett2019_example_4_3_7_finitePartitionLikelihood
  rw [Finset.sum_eq_single k]
  · simp [hω]
  · intro j _ hjk
    have hωj : ω ∉ cell j := by
      intro hmem
      have hbot : ω ∈ (∅ : Set Ω) := by
        exact (hdisj hjk).le_bot ⟨hmem, hω⟩
      exact hbot.elim
    simp [hωj]
  · intro hk
    exact False.elim (hk (Finset.mem_univ k))

/--
Durrett 2019, Example 4.3.7: on each finite partition cell, the elementary
likelihood approximation integrates back to the numerator cell mass.  The
hypothesis `nu (cell k) = 0 -> mu (cell k) = 0` is the finite-cell form of
`mu_n << nu_n` in the textbook example.
-/
theorem durrett2019_example_4_3_7_finitePartitionLikelihood_setLIntegral_cell
    {κ Ω : Type*} [Fintype κ] [DecidableEq κ] [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure ν] {cell : κ -> Set Ω}
    (hcell : ∀ k, MeasurableSet (cell k))
    (hdisj : Pairwise (fun i j => Disjoint (cell i) (cell j)))
    (hzero : ∀ k, ν (cell k) = 0 -> μ (cell k) = 0) (k : κ) :
    ∫⁻ ω in cell k,
        durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell ω ∂ν =
      μ (cell k) := by
  classical
  rw [setLIntegral_congr_fun (hcell k)
      (fun ω hω =>
        durrett2019_example_4_3_7_finitePartitionLikelihood_eq_on_cell
          (μ := μ) (ν := ν) (cell := cell) hdisj hω),
    setLIntegral_const]
  by_cases hνzero : ν (cell k) = 0
  · simp [hνzero, hzero k hνzero]
  · exact ENNReal.div_mul_cancel hνzero (measure_ne_top ν (cell k))

/--
Durrett 2019, Example 4.3.7: the elementary finite-partition likelihood
approximation has the correct set integral on every finite union of partition
cells.
-/
theorem durrett2019_example_4_3_7_finitePartitionLikelihood_setLIntegral_cellUnion
    {κ Ω : Type*} [Fintype κ] [DecidableEq κ] [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure ν] {cell : κ -> Set Ω}
    (hcell : ∀ k, MeasurableSet (cell k))
    (hdisj : Pairwise (fun i j => Disjoint (cell i) (cell j)))
    (hzero : ∀ k, ν (cell k) = 0 -> μ (cell k) = 0) (S : Finset κ) :
    ∫⁻ ω in ⋃ k ∈ S, cell k,
        durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell ω ∂ν =
      μ (⋃ k ∈ S, cell k) := by
  classical
  have hSdisj : Set.PairwiseDisjoint (↑S) cell := by
    intro i _hi j _hj hij
    exact hdisj hij
  rw [lintegral_biUnion_finset hSdisj (fun k _ => hcell k),
    measure_biUnion_finset hSdisj (fun k _ => hcell k)]
  exact Finset.sum_congr rfl fun k _ =>
    durrett2019_example_4_3_7_finitePartitionLikelihood_setLIntegral_cell
      (μ := μ) (ν := ν) (cell := cell) hcell hdisj hzero k

/--
Durrett 2019, Example 4.3.7: if the finite cells cover the whole space, then
the elementary finite-partition likelihood approximation has the correct
universe integral.
-/
theorem durrett2019_example_4_3_7_finitePartitionLikelihood_lintegral_univ
    {κ Ω : Type*} [Fintype κ] [DecidableEq κ] [MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure ν] {cell : κ -> Set Ω}
    (hcell : ∀ k, MeasurableSet (cell k))
    (hdisj : Pairwise (fun i j => Disjoint (cell i) (cell j)))
    (hcover : (⋃ k, cell k) = Set.univ)
    (hzero : ∀ k, ν (cell k) = 0 -> μ (cell k) = 0) :
    ∫⁻ ω, durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell ω ∂ν =
      μ Set.univ := by
  classical
  simpa [hcover] using
    (durrett2019_example_4_3_7_finitePartitionLikelihood_setLIntegral_cellUnion
      (μ := μ) (ν := ν) (cell := cell) hcell hdisj hzero Finset.univ)

/--
Durrett 2019, Example 4.3.7 generator-facing endpoint: if a finite
partition-generated pi-system consists of finite unions of the cells, then the
elementary partition likelihood approximation represents `mu` as a density
with respect to `nu`.
-/
theorem durrett2019_example_4_3_7_finitePartitionLikelihood_withDensity_eq_of_generator
    {κ Ω : Type*} [Fintype κ] [DecidableEq κ] [mΩ : MeasurableSpace Ω]
    {μ ν : Measure Ω} [IsFiniteMeasure μ] [IsFiniteMeasure ν] {cell : κ -> Set Ω}
    (C : Set (Set Ω))
    (hcell : ∀ k, MeasurableSet (cell k))
    (hdisj : Pairwise (fun i j => Disjoint (cell i) (cell j)))
    (hcover : (⋃ k, cell k) = Set.univ)
    (hzero : ∀ k, ν (cell k) = 0 -> μ (cell k) = 0)
    (hgen : mΩ = MeasurableSpace.generateFrom C) (hC : IsPiSystem C)
    (hC_union : ∀ s ∈ C, ∃ S : Finset κ, s = ⋃ k ∈ S, cell k) :
    μ = ν.withDensity (durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell) := by
  classical
  refine
    durrett2019_theorem_4_3_5_withDensity_eq_of_generate_finite
      (μ := μ) (ρ := ν)
      (Y := durrett2019_example_4_3_7_finitePartitionLikelihood μ ν cell)
      C hgen hC ?_ ?_
  · intro s hs
    rcases hC_union s hs with ⟨S, rfl⟩
    exact
      (durrett2019_example_4_3_7_finitePartitionLikelihood_setLIntegral_cellUnion
        (μ := μ) (ν := ν) (cell := cell) hcell hdisj hzero S).symm
  · exact
      (durrett2019_example_4_3_7_finitePartitionLikelihood_lintegral_univ
        (μ := μ) (ν := ν) (cell := cell) hcell hdisj hcover hzero).symm

/-! ## Durrett, Theorem 4.3.8 -/

/--
Durrett 2019, Theorem 4.3.8: the finite-coordinate likelihood ratio used in
Kakutani's product-measure dichotomy.

For finitely many coordinates, the textbook expression is the product of the
one-coordinate densities.
-/
noncomputable def durrett2019_theorem_4_3_8_finiteProductLikelihood
    {ι S : Type*} [Fintype ι] (q : ι -> S -> ℝ≥0∞) (x : ι -> S) : ℝ≥0∞ :=
  ∏ i, q i (x i)

/--
Durrett 2019, Theorem 4.3.8 finite-coordinate support: the finite product
likelihood is measurable when the one-coordinate densities are measurable.
-/
theorem durrett2019_theorem_4_3_8_finiteProductLikelihood_measurable
    {ι S : Type*} [Fintype ι] [MeasurableSpace S] {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) :
    Measurable (durrett2019_theorem_4_3_8_finiteProductLikelihood q) := by
  classical
  unfold durrett2019_theorem_4_3_8_finiteProductLikelihood
  exact Finset.measurable_prod Finset.univ fun i _ =>
    (hq i).comp (measurable_pi_apply i)

/--
Durrett 2019, Theorem 4.3.8 finite-coordinate support: on a measurable
rectangle, integrating the finite product likelihood against the denominator
product law factors into the one-coordinate density integrals.
-/
theorem durrett2019_theorem_4_3_8_finiteProductLikelihood_setLIntegral_rectangle
    {ι S : Type*} [Fintype ι] [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {q : ι -> S -> ℝ≥0∞} (hq : ∀ i, Measurable (q i))
    (A : ι -> Set S) (hA : ∀ i, MeasurableSet (A i)) :
    ∫⁻ x in Set.pi Set.univ A,
        durrett2019_theorem_4_3_8_finiteProductLikelihood q x ∂Measure.pi ν =
      ∏ i, ∫⁻ y in A i, q i y ∂ν i := by
  classical
  let X : ι -> (ι -> S) -> ℝ≥0∞ :=
    fun i x => (A i).indicator (q i) (x i)
  have hX_meas : ∀ i, Measurable (X i) := by
    intro i
    exact ((hq i).indicator (hA i)).comp (measurable_pi_apply i)
  have hX_indep :
      _root_.ProbabilityTheory.iIndepFun X (Measure.pi ν) := by
    have h :=
      _root_.ProbabilityTheory.iIndepFun_pi
        (μ := ν) (X := fun i y => (A i).indicator (q i) y)
        (fun i => ((hq i).indicator (hA i)).aemeasurable)
    simpa [X, Function.comp_def] using h
  have hrect :
      MeasurableSet (Set.pi (Set.univ : Set ι) A) :=
    MeasurableSet.pi Set.countable_univ fun i _ => hA i
  have hpoint :
      (fun x : ι -> S =>
          (Set.pi Set.univ A).indicator
            (durrett2019_theorem_4_3_8_finiteProductLikelihood q) x) =
        fun x => ∏ i, X i x := by
    funext x
    by_cases hx : x ∈ Set.pi Set.univ A
    · have hxA : ∀ i, x i ∈ A i := by
        intro i
        exact hx i trivial
      simp [X, hx, hxA, durrett2019_theorem_4_3_8_finiteProductLikelihood]
    · have hxA : ∃ i, x i ∉ A i := by
        by_contra hnone
        apply hx
        intro i _hi
        exact not_not.mp (not_exists.mp hnone i)
      rcases hxA with ⟨i, hi⟩
      have hzero : ∏ j, X j x = 0 := by
        refine Finset.prod_eq_zero (Finset.mem_univ i) ?_
        simp [X, hi]
      simp [hx, hzero]
  calc
    ∫⁻ x in Set.pi Set.univ A,
        durrett2019_theorem_4_3_8_finiteProductLikelihood q x ∂Measure.pi ν
        = ∫⁻ x,
            (Set.pi Set.univ A).indicator
              (durrett2019_theorem_4_3_8_finiteProductLikelihood q) x ∂Measure.pi ν := by
          rw [lintegral_indicator hrect]
    _ = ∫⁻ x, ∏ i, X i x ∂Measure.pi ν := by
          rw [hpoint]
    _ = ∏ i, ∫⁻ x, X i x ∂Measure.pi ν := by
          simpa using
            (_root_.ProbabilityTheory.lintegral_prod_eq_prod_lintegral_of_indepFun
              (μ := Measure.pi ν) (s := Finset.univ) (X := X) hX_indep hX_meas)
    _ = ∏ i, ∫⁻ y in A i, q i y ∂ν i := by
          refine Finset.prod_congr rfl ?_
          intro i _hi
          rw [show (∫⁻ x, X i x ∂Measure.pi ν) =
              ∫⁻ y, (A i).indicator (q i) y ∂ν i from
            (measurePreserving_eval (ν) i).lintegral_comp ((hq i).indicator (hA i))]
          rw [lintegral_indicator (hA i)]

/--
Durrett 2019, Theorem 4.3.8 finite-coordinate support: finite product laws have
the product of the one-coordinate densities as their likelihood ratio.
-/
theorem durrett2019_theorem_4_3_8_finiteProduct_withDensity_eq
    {ι S : Type*} [Fintype ι] [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, SigmaFinite (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)] {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i)) :
    Measure.pi μ =
      (Measure.pi ν).withDensity
        (durrett2019_theorem_4_3_8_finiteProductLikelihood q) := by
  classical
  refine Measure.pi_eq (μ := μ) ?_
  intro A hA
  rw [withDensity_apply _ (MeasurableSet.pi Set.countable_univ fun i _ => hA i)]
  rw [durrett2019_theorem_4_3_8_finiteProductLikelihood_setLIntegral_rectangle
    (ν := ν) (q := q) hq A hA]
  refine Finset.prod_congr rfl ?_
  intro i _hi
  rw [hμ i, withDensity_apply _ (hA i)]

/--
Durrett 2019, Theorem 4.3.8 one-coordinate Hellinger support: if `q` is the
Radon-Nikodym density of a probability measure with respect to another
probability measure, then the Hellinger affinity `∫ sqrt q dν` is at most one.
-/
theorem durrett2019_theorem_4_3_8_oneCoordinate_hellingerAffinity_le_one
    {S : Type*} [MeasurableSpace S] {μ ν : Measure S}
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    {q : S -> ℝ≥0∞} (hq : Measurable q)
    (hμ : μ = ν.withDensity q) :
    (∫⁻ y, (q y) ^ ((1 : ℝ) / 2) ∂ν) ≤ 1 := by
  have hq_int : ∫⁻ y, q y ∂ν = 1 := by
    calc
      ∫⁻ y, q y ∂ν = ν.withDensity q Set.univ := by
        rw [withDensity_apply _ MeasurableSet.univ]
        simp
      _ = μ Set.univ := by rw [← hμ]
      _ = 1 := measure_univ
  have hholder :
      ∫⁻ y, (q y) ^ ((1 : ℝ) / 2) ∂ν ≤
        (∫⁻ y, q y ∂ν) ^ ((1 : ℝ) / 2) *
          (∫⁻ _ : S, (1 : ℝ≥0∞) ∂ν) ^ ((1 : ℝ) / 2) := by
    have h :=
      ENNReal.lintegral_mul_norm_pow_le
        (μ := ν) (f := q) (g := fun _ : S => (1 : ℝ≥0∞))
        hq.aemeasurable measurable_const.aemeasurable
        (by norm_num : 0 ≤ ((1 : ℝ) / 2))
        (by norm_num : 0 ≤ ((1 : ℝ) / 2))
        (by norm_num : ((1 : ℝ) / 2) + ((1 : ℝ) / 2) = 1)
    simpa using h
  simpa [hq_int, measure_univ] using hholder

/--
Durrett 2019, Theorem 4.3.8 one-coordinate Hellinger support: sequence-shaped
version of the Hellinger affinity bound for product measures.
-/
theorem durrett2019_theorem_4_3_8_oneCoordinate_hellingerAffinities_le_one
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i)) :
    ∀ i, (∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) ≤ 1 := by
  intro i
  exact
    durrett2019_theorem_4_3_8_oneCoordinate_hellingerAffinity_le_one
      (μ := μ i) (ν := ν i) (q := q i) (hq i) (hμ i)

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: the square-root power of the
finite-coordinate likelihood is the product of the square-root powers of the
one-coordinate likelihoods.
-/
theorem durrett2019_theorem_4_3_8_finiteProductLikelihood_rpow_half
    {ι S : Type*} [Fintype ι] {q : ι -> S -> ℝ≥0∞} (x : ι -> S) :
    (durrett2019_theorem_4_3_8_finiteProductLikelihood q x) ^ ((1 : ℝ) / 2) =
      ∏ i, (q i (x i)) ^ ((1 : ℝ) / 2) := by
  classical
  unfold durrett2019_theorem_4_3_8_finiteProductLikelihood
  simpa using
    (ENNReal.prod_rpow_of_nonneg
      (s := Finset.univ) (f := fun i => q i (x i))
      (r := (1 : ℝ) / 2) (by norm_num : 0 ≤ (1 : ℝ) / 2)).symm

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: the square-root power of the
finite-coordinate likelihood is measurable.
-/
theorem durrett2019_theorem_4_3_8_finiteProductLikelihood_rpow_half_measurable
    {ι S : Type*} [Fintype ι] [MeasurableSpace S] {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) :
    Measurable fun x =>
      (durrett2019_theorem_4_3_8_finiteProductLikelihood q x) ^ ((1 : ℝ) / 2) := by
  exact
    ENNReal.continuous_rpow_const.measurable.comp
      (durrett2019_theorem_4_3_8_finiteProductLikelihood_measurable hq)

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: the finite-coordinate Hellinger
integral factors into the one-coordinate Hellinger integrals.
-/
theorem durrett2019_theorem_4_3_8_finiteProductLikelihood_rpow_half_lintegral
    {ι S : Type*} [Fintype ι] [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {q : ι -> S -> ℝ≥0∞} (hq : ∀ i, Measurable (q i)) :
    ∫⁻ x,
        (durrett2019_theorem_4_3_8_finiteProductLikelihood q x) ^ ((1 : ℝ) / 2)
          ∂Measure.pi ν =
      ∏ i, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i := by
  classical
  let X : ι -> (ι -> S) -> ℝ≥0∞ :=
    fun i x => (q i (x i)) ^ ((1 : ℝ) / 2)
  have hX_meas : ∀ i, Measurable (X i) := by
    intro i
    exact
      (ENNReal.continuous_rpow_const.measurable.comp (hq i)).comp
        (measurable_pi_apply i)
  have hX_indep :
      _root_.ProbabilityTheory.iIndepFun X (Measure.pi ν) := by
    have h :=
      _root_.ProbabilityTheory.iIndepFun_pi
        (μ := ν) (X := fun i y => (q i y) ^ ((1 : ℝ) / 2))
        (fun i =>
          (ENNReal.continuous_rpow_const.measurable.comp (hq i)).aemeasurable)
    simpa [X, Function.comp_def] using h
  have hpoint :
      (fun x : ι -> S =>
          (durrett2019_theorem_4_3_8_finiteProductLikelihood q x) ^ ((1 : ℝ) / 2)) =
        fun x => ∏ i, X i x := by
    funext x
    rw [durrett2019_theorem_4_3_8_finiteProductLikelihood_rpow_half (q := q) x]
  calc
    ∫⁻ x,
        (durrett2019_theorem_4_3_8_finiteProductLikelihood q x) ^ ((1 : ℝ) / 2)
          ∂Measure.pi ν
        = ∫⁻ x, ∏ i, X i x ∂Measure.pi ν := by
          rw [hpoint]
    _ = ∏ i, ∫⁻ x, X i x ∂Measure.pi ν := by
          simpa using
            (_root_.ProbabilityTheory.lintegral_prod_eq_prod_lintegral_of_indepFun
              (μ := Measure.pi ν) (s := Finset.univ) (X := X) hX_indep hX_meas)
    _ = ∏ i, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i := by
          refine Finset.prod_congr rfl ?_
          intro i _hi
          rw [show (∫⁻ x, X i x ∂Measure.pi ν) =
              ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i from
            (measurePreserving_eval (ν) i).lintegral_comp
              (ENNReal.continuous_rpow_const.measurable.comp (hq i))]

/--
Durrett 2019, Theorem 4.3.8: the finite-coordinate likelihood pulled back to
an infinite product space.
-/
noncomputable def durrett2019_theorem_4_3_8_cylinderLikelihood
    {ι S : Type*} (I : Finset ι) (q : ι -> S -> ℝ≥0∞) (x : ι -> S) : ℝ≥0∞ :=
  durrett2019_theorem_4_3_8_finiteProductLikelihood (fun i : I => q i) (I.restrict x)

/--
Durrett 2019, Theorem 4.3.8 cylinder support: the pulled-back
finite-coordinate likelihood is the ordinary finite product over the chosen
coordinates.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod
    {ι S : Type*} (I : Finset ι) (q : ι -> S -> ℝ≥0∞) (x : ι -> S) :
    durrett2019_theorem_4_3_8_cylinderLikelihood I q x =
      ∏ i ∈ I, q i (x i) := by
  classical
  unfold durrett2019_theorem_4_3_8_cylinderLikelihood
  unfold durrett2019_theorem_4_3_8_finiteProductLikelihood
  simp

/--
Durrett 2019, Theorem 4.3.8 cylinder support: the finite-coordinate likelihood
pulled back to the infinite product space is measurable.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_measurable
    {ι S : Type*} [MeasurableSpace S] (I : Finset ι) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) :
    Measurable (durrett2019_theorem_4_3_8_cylinderLikelihood I q) := by
  classical
  unfold durrett2019_theorem_4_3_8_cylinderLikelihood
  exact
    (durrett2019_theorem_4_3_8_finiteProductLikelihood_measurable
      (q := fun i : I => q i) fun i => hq i).comp (Finset.measurable_restrict I)

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: the sigma-field generated
by the `i`th coordinate on sequence space.
-/
@[reducible] def durrett2019_theorem_4_3_8_coordinateSigma
    (S : Type*) [MeasurableSpace S] (i : ℕ) :
    MeasurableSpace (ℕ -> S) :=
  MeasurableSpace.comap (fun x : ℕ -> S => x i) inferInstance

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: the future sigma-field
generated by all coordinates from `n` onward.
-/
@[reducible] def durrett2019_theorem_4_3_8_tailCoordinateSigma
    (S : Type*) [MeasurableSpace S] (n : ℕ) :
    MeasurableSpace (ℕ -> S) :=
  ⨆ i : ℕ, ⨆ _ : i ≥ n, durrett2019_theorem_4_3_8_coordinateSigma S i

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: each one-coordinate
sigma-field is a sub-sigma-field of the product sigma-field.
-/
theorem durrett2019_theorem_4_3_8_coordinateSigma_le
    {S : Type*} [MeasurableSpace S] (i : ℕ) :
    durrett2019_theorem_4_3_8_coordinateSigma S i ≤
      (inferInstance : MeasurableSpace (ℕ -> S)) :=
  (measurable_pi_apply i).comap_le

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: under the denominator
infinite product law, the coordinate sigma-fields are independent.
-/
theorem durrett2019_theorem_4_3_8_coordinateSigma_iIndep_infinitePi
    {S : Type*} [MeasurableSpace S]
    {ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (ν i)] :
    _root_.ProbabilityTheory.iIndep
      (fun i => durrett2019_theorem_4_3_8_coordinateSigma S i)
      (Measure.infinitePi ν) := by
  have hfun :
      _root_.ProbabilityTheory.iIndepFun
        (fun i (x : ℕ -> S) => x i) (Measure.infinitePi ν) := by
    simpa using
      (_root_.ProbabilityTheory.iIndepFun_infinitePi
        (P := ν) (X := fun _ (s : S) => s) (fun _ => measurable_id))
  simpa [durrett2019_theorem_4_3_8_coordinateSigma] using hfun.iIndep

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: every coordinate in the
tail is measurable from the corresponding tail-coordinate sigma-field.
-/
theorem durrett2019_theorem_4_3_8_coordinate_tailCoordinateSigma_measurable
    {S : Type*} [MeasurableSpace S] {n i : ℕ} (hi : i ≥ n) :
    Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
      (fun x : ℕ -> S => x i) := by
  have hcoord :
      Measurable[durrett2019_theorem_4_3_8_coordinateSigma S i]
        (fun x : ℕ -> S => x i) :=
    comap_measurable (fun x : ℕ -> S => x i)
  exact Measurable.iSup' i (Measurable.iSup' hi hcoord)

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: a finite cylinder
likelihood using only coordinates from `n` onward is measurable from the tail
sigma-field beginning at `n`.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_tailCoordinateSigma_measurable
    {S : Type*} [MeasurableSpace S] {I : Finset ℕ} {q : ℕ -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) {n : ℕ} (hI : ∀ i ∈ I, i ≥ n) :
    Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
      (durrett2019_theorem_4_3_8_cylinderLikelihood I q) := by
  classical
  have hprod :
      Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        (fun x : ℕ -> S => ∏ i ∈ I, q i (x i)) := by
    exact Finset.measurable_fun_prod I fun i hi =>
      (hq i).comp
        (durrett2019_theorem_4_3_8_coordinate_tailCoordinateSigma_measurable
          (S := S) (n := n) (i := i) (hI i hi))
  have hfun :
      durrett2019_theorem_4_3_8_cylinderLikelihood I q =
        fun x : ℕ -> S => ∏ i ∈ I, q i (x i) := by
    funext x
    exact durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod I q x
  rwa [hfun]

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: the zero set of a finite
tail cylinder likelihood is measurable from the corresponding tail
sigma-field.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_zeroSet_tailCoordinateSigma_measurable
    {S : Type*} [MeasurableSpace S] {I : Finset ℕ} {q : ℕ -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) {n : ℕ} (hI : ∀ i ∈ I, i ≥ n) :
    MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
      {x : ℕ -> S | durrett2019_theorem_4_3_8_cylinderLikelihood I q x = 0} :=
  measurableSet_eq_fun
    (durrett2019_theorem_4_3_8_cylinderLikelihood_tailCoordinateSigma_measurable
      (S := S) (I := I) (q := q) hq (n := n) hI)
    measurable_const

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: if the limiting
likelihood zero set agrees, for every starting index, with the zero set of a
tail-coordinate measurable candidate, then it is measurable from every tail
coordinate sigma-field.
-/
theorem durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_forall_zeroSet_eq
    {S : Type*} [MeasurableSpace S] {X : (ℕ -> S) -> ℝ≥0∞}
    {Y : ℕ -> (ℕ -> S) -> ℝ≥0∞}
    (hY : ∀ n, Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n] (Y n))
    (hzero : ∀ n, {x : ℕ -> S | X x = 0} = {x | Y n x = 0}) :
    ∀ n,
      MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        {x : ℕ -> S | X x = 0} := by
  intro n
  rw [hzero n]
  exact measurableSet_eq_fun (hY n) measurable_const

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: multiplying a
tail-coordinate candidate by a pointwise nonzero finite-prefix factor does not
change its zero set.
-/
theorem durrett2019_theorem_4_3_8_zeroSet_eq_of_prefix_mul
    {Ω : Type*} {X Y C : Ω -> ℝ≥0∞}
    (hfactor : ∀ ω, X ω = C ω * Y ω)
    (hC_ne_zero : ∀ ω, C ω ≠ 0) :
    {ω | X ω = 0} = {ω | Y ω = 0} := by
  ext ω
  constructor
  · intro hXzero
    have hmul : C ω * Y ω = 0 := by
      simpa [hfactor ω] using hXzero
    rcases (mul_eq_zero.mp hmul) with hC | hY
    · exact False.elim ((hC_ne_zero ω) hC)
    · exact hY
  · intro hYzero
    have hYzero' : Y ω = 0 := hYzero
    change X ω = 0
    rw [hfactor ω, hYzero', mul_zero]

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: a finite cylinder
likelihood is nonzero whenever each coordinate density used in it is nonzero.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_ne_zero
    {ι S : Type*} {I : Finset ι} {q : ι -> S -> ℝ≥0∞} {x : ι -> S}
    (hq_ne_zero : ∀ i ∈ I, q i (x i) ≠ 0) :
    durrett2019_theorem_4_3_8_cylinderLikelihood I q x ≠ 0 := by
  rw [durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod]
  exact Finset.prod_ne_zero_iff.2 hq_ne_zero

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: a finite cylinder
likelihood is finite whenever each coordinate density used in it is finite.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_ne_top
    {ι S : Type*} {I : Finset ι} {q : ι -> S -> ℝ≥0∞} {x : ι -> S}
    (hq_ne_top : ∀ i ∈ I, q i (x i) ≠ ∞) :
    durrett2019_theorem_4_3_8_cylinderLikelihood I q x ≠ ∞ := by
  rw [durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod]
  exact ENNReal.prod_ne_top hq_ne_top

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: the standard finite
prefix likelihood is finite under pointwise coordinate finiteness.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_top_of_forall_ne_top
    {S : Type*} {q : ℕ -> S -> ℝ≥0∞}
    (hq_ne_top : ∀ i s, q i s ≠ ∞) :
    ∀ (n : ℕ) (x : ℕ -> S),
      durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ := by
  intro n x
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_ne_top
      (I := Finset.range n) (q := q) (x := x) fun i _hi =>
        hq_ne_top i (x i)

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: the standard finite
prefix likelihood is nonzero under pointwise coordinate nonzero hypotheses.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_zero_of_forall_ne_zero
    {S : Type*} {q : ℕ -> S -> ℝ≥0∞}
    (hq_ne_zero : ∀ i s, q i s ≠ 0) :
    ∀ (n : ℕ) (x : ℕ -> S),
      durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ 0 := by
  intro n x
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_ne_zero
      (I := Finset.range n) (q := q) (x := x) fun i _hi =>
        hq_ne_zero i (x i)

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support: if a limiting likelihood
factors into a pointwise nonzero finite-prefix term and a tail-coordinate
measurable candidate, then its zero set is measurable from every tail
coordinate sigma-field.
-/
theorem durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_prefix_mul
    {S : Type*} [MeasurableSpace S] {X : (ℕ -> S) -> ℝ≥0∞}
    {Y C : ℕ -> (ℕ -> S) -> ℝ≥0∞}
    (hY : ∀ n, Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n] (Y n))
    (hfactor : ∀ n x, X x = C n x * Y n x)
    (hC_ne_zero : ∀ n x, C n x ≠ 0) :
    ∀ n,
      MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        {x : ℕ -> S | X x = 0} :=
  durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_forall_zeroSet_eq
    (S := S) (X := X) (Y := Y) hY fun n =>
      durrett2019_theorem_4_3_8_zeroSet_eq_of_prefix_mul
        (X := X) (Y := Y n) (C := C n) (hfactor n) (hC_ne_zero n)

/--
Durrett 2019, Theorem 4.3.8 tail-coordinate support specialized to the usual
finite-prefix cylinder likelihood factor.
-/
theorem durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_prefixCylinder_mul
    {S : Type*} [MeasurableSpace S] {q : ℕ -> S -> ℝ≥0∞}
    {X : (ℕ -> S) -> ℝ≥0∞} {Y : ℕ -> (ℕ -> S) -> ℝ≥0∞}
    (hY : ∀ n, Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n] (Y n))
    (hfactor :
      ∀ (n : ℕ) (x : ℕ -> S),
        X x =
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x *
            Y n x)
    (hq_ne_zero :
      ∀ (n : ℕ) (x : ℕ -> S) (i : ℕ),
        i ∈ Finset.range n -> q i (x i) ≠ 0) :
    ∀ n,
      MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        {x : ℕ -> S | X x = 0} :=
  durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_prefix_mul
    (S := S) (X := X) (Y := Y)
    (C := fun n x => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
    hY hfactor fun n x =>
      durrett2019_theorem_4_3_8_cylinderLikelihood_ne_zero
        (I := Finset.range n) (q := q) (x := x) fun i hi =>
          hq_ne_zero n x i hi

/--
Durrett 2019, Theorem 4.3.8 prefix/tail support: a longer finite prefix
likelihood factors into the old prefix likelihood and the finite tail block.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_prefix_tail_factorization
    {S : Type*} {q : ℕ -> S -> ℝ≥0∞} (x : ℕ -> S) {n m : ℕ} (hnm : n ≤ m) :
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x =
      durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x *
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x := by
  rw [durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod,
    durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod,
    durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod]
  exact (Finset.prod_range_mul_prod_Ico (fun i => q i (x i)) hnm).symm

/--
Durrett 2019, Theorem 4.3.8 prefix/tail support: a finite tail-block
likelihood is measurable from the tail-coordinate sigma-field beginning at the
block's left endpoint.
-/
theorem durrett2019_theorem_4_3_8_tailBlockLikelihood_tailCoordinateSigma_measurable
    {S : Type*} [MeasurableSpace S] {q : ℕ -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) (n m : ℕ) :
    Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
      (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q) :=
  durrett2019_theorem_4_3_8_cylinderLikelihood_tailCoordinateSigma_measurable
    (S := S) (I := Finset.Ico n m) (q := q) hq (n := n) fun _i hi =>
      (Finset.mem_Ico.mp hi).1

/--
Durrett 2019, Theorem 4.3.8 prefix/tail support: a pointwise limit of finite
tail-block likelihoods is measurable from the corresponding tail-coordinate
sigma-field.
-/
theorem durrett2019_theorem_4_3_8_tailBlockLikelihood_limit_tailCoordinateSigma_measurable
    {S : Type*} [MeasurableSpace S] {q : ℕ -> S -> ℝ≥0∞}
    {Y : (ℕ -> S) -> ℝ≥0∞} (hq : ∀ i, Measurable (q i)) (n : ℕ)
    (hYlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x)
          atTop (𝓝 (Y x))) :
    Measurable[durrett2019_theorem_4_3_8_tailCoordinateSigma S n] Y := by
  exact
    @measurable_of_tendsto_metrizable (ℕ -> S) ℝ≥0∞
      (durrett2019_theorem_4_3_8_tailCoordinateSigma S n) _ _ _ _
      (f := fun m x =>
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x)
      (g := Y)
      (fun m =>
        durrett2019_theorem_4_3_8_tailBlockLikelihood_tailCoordinateSigma_measurable
          (S := S) (q := q) hq n m)
      (tendsto_pi_nhds.2 hYlim)

/--
Durrett 2019, Theorem 4.3.8 prefix/tail support: if the full finite-prefix
likelihoods converge to `X` and each finite tail-block likelihood converges to
`Y n`, then `X` factors as the finite prefix likelihood times the `n`th tail
limit.
-/
theorem durrett2019_theorem_4_3_8_likelihoodLimit_eq_prefixCylinder_mul_tailBlockLimit
    {S : Type*} {q : ℕ -> S -> ℝ≥0∞} {X : (ℕ -> S) -> ℝ≥0∞}
    {Y : ℕ -> (ℕ -> S) -> ℝ≥0∞}
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x)
          atTop (𝓝 (X x)))
    (hYlim :
      ∀ (n : ℕ) (x : ℕ -> S),
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x)
          atTop (𝓝 (Y n x)))
    (hprefix_ne_top :
      ∀ (n : ℕ) (x : ℕ -> S),
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞) :
    ∀ (n : ℕ) (x : ℕ -> S),
      X x =
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x *
          Y n x := by
  intro n x
  let C : ℝ≥0∞ :=
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x
  let tail : ℕ -> ℝ≥0∞ := fun m =>
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x
  let full : ℕ -> ℝ≥0∞ := fun m =>
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x
  have hprodlim : Tendsto (fun m => C * tail m) atTop (𝓝 (C * Y n x)) :=
    ENNReal.Tendsto.const_mul (hYlim n x) (Or.inr (by simpa [C] using hprefix_ne_top n x))
  have hprod_eq_full : (fun m => C * tail m) =ᶠ[atTop] full := by
    filter_upwards [eventually_ge_atTop n] with m hnm
    dsimp [C, tail, full]
    exact
      (durrett2019_theorem_4_3_8_cylinderLikelihood_range_prefix_tail_factorization
          (q := q) x hnm).symm
  exact tendsto_nhds_unique (hXlim x) (hprodlim.congr' hprod_eq_full)

/--
Durrett 2019, Theorem 4.3.8 source-convergence support: if the full finite
prefix likelihoods converge to `X`, then after a fixed finite nonzero prefix
is divided out, the corresponding finite tail-block likelihoods converge to
`X / prefix`.
-/
theorem durrett2019_theorem_4_3_8_tailBlockLikelihood_tendsto_div_of_range_tendsto
    {S : Type*} {q : ℕ -> S -> ℝ≥0∞} {X : (ℕ -> S) -> ℝ≥0∞}
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x)
          atTop (𝓝 (X x)))
    (hprefix_ne_zero :
      ∀ (n : ℕ) (x : ℕ -> S),
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ 0)
    (hprefix_ne_top :
      ∀ (n : ℕ) (x : ℕ -> S),
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞) :
    ∀ (n : ℕ) (x : ℕ -> S),
      Tendsto
        (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x)
        atTop
        (𝓝
          (X x /
            durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)) := by
  intro n x
  let C : ℝ≥0∞ :=
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x
  let tail : ℕ -> ℝ≥0∞ := fun m =>
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x
  let full : ℕ -> ℝ≥0∞ := fun m =>
    durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x
  have hC0 : C ≠ 0 := by
    simpa [C] using hprefix_ne_zero n x
  have hCtop : C ≠ ∞ := by
    simpa [C] using hprefix_ne_top n x
  have hdivlim : Tendsto (fun m => full m / C) atTop (𝓝 (X x / C)) :=
    ENNReal.Tendsto.div_const (hXlim x) (Or.inr hC0)
  have hdiv_eq_tail : (fun m => full m / C) =ᶠ[atTop] tail := by
    filter_upwards [eventually_ge_atTop n] with m hnm
    dsimp [C, tail, full]
    rw [durrett2019_theorem_4_3_8_cylinderLikelihood_range_prefix_tail_factorization
      (q := q) x hnm]
    rw [mul_comm, ENNReal.mul_div_cancel_right hC0 hCtop]
  simpa [C, tail] using hdivlim.congr' hdiv_eq_tail

/--
Durrett 2019, Theorem 4.3.8 prefix/tail support: pointwise convergence of the
full prefixes and every finite tail block supplies the tail-coordinate
measurable zero-set handoff for the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_tailBlockLimits
    {S : Type*} [MeasurableSpace S] {q : ℕ -> S -> ℝ≥0∞}
    {X : (ℕ -> S) -> ℝ≥0∞} {Y : ℕ -> (ℕ -> S) -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x)
          atTop (𝓝 (X x)))
    (hYlim :
      ∀ (n : ℕ) (x : ℕ -> S),
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x)
          atTop (𝓝 (Y n x)))
    (hprefix_ne_top :
      ∀ (n : ℕ) (x : ℕ -> S),
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞)
    (hq_ne_zero :
      ∀ (n : ℕ) (x : ℕ -> S) (i : ℕ),
        i ∈ Finset.range n -> q i (x i) ≠ 0) :
    ∀ n,
      MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        {x : ℕ -> S | X x = 0} :=
  durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_prefixCylinder_mul
    (S := S) (q := q) (X := X) (Y := Y)
    (fun n =>
      durrett2019_theorem_4_3_8_tailBlockLikelihood_limit_tailCoordinateSigma_measurable
        (S := S) (q := q) (Y := Y n) hq n (hYlim n))
    (durrett2019_theorem_4_3_8_likelihoodLimit_eq_prefixCylinder_mul_tailBlockLimit
      (q := q) (X := X) (Y := Y) hXlim hYlim hprefix_ne_top)
    hq_ne_zero

/--
Durrett 2019, Theorem 4.3.8 source-facing tail-block support: pointwise
finite and nonzero coordinate densities discharge the finite-prefix no-top and
nonzero side conditions in the tail-block zero-set handoff.
-/
theorem durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_tailBlockLimits_finite_nonzero
    {S : Type*} [MeasurableSpace S] {q : ℕ -> S -> ℝ≥0∞}
    {X : (ℕ -> S) -> ℝ≥0∞} {Y : ℕ -> (ℕ -> S) -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x)
          atTop (𝓝 (X x)))
    (hYlim :
      ∀ (n : ℕ) (x : ℕ -> S),
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.Ico n m) q x)
          atTop (𝓝 (Y n x)))
    (hq_ne_top : ∀ i s, q i s ≠ ∞)
    (hq_ne_zero : ∀ i s, q i s ≠ 0) :
    ∀ n,
      MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        {x : ℕ -> S | X x = 0} :=
  durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_tailBlockLimits
    (S := S) (q := q) (X := X) (Y := Y) hq hXlim hYlim
    (durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_top_of_forall_ne_top
      (q := q) hq_ne_top)
    fun _n x i _hi => hq_ne_zero i (x i)

/--
Durrett 2019, Theorem 4.3.8 source-facing tail-block support: under pointwise
finite and nonzero coordinate densities, convergence of the full finite-prefix
likelihoods supplies the canonical tail-block limit candidate
`X / prefix_n` and the tail-coordinate zero-set handoff.
-/
theorem durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_rangeLimit_finite_nonzero
    {S : Type*} [MeasurableSpace S] {q : ℕ -> S -> ℝ≥0∞}
    {X : (ℕ -> S) -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun m => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x)
          atTop (𝓝 (X x)))
    (hq_ne_top : ∀ i s, q i s ≠ ∞)
    (hq_ne_zero : ∀ i s, q i s ≠ 0) :
    ∀ n,
      MeasurableSet[durrett2019_theorem_4_3_8_tailCoordinateSigma S n]
        {x : ℕ -> S | X x = 0} :=
  durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_tailBlockLimits_finite_nonzero
    (S := S) (q := q) (X := X)
    (Y := fun n x =>
      X x / durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
    hq hXlim
    (durrett2019_theorem_4_3_8_tailBlockLikelihood_tendsto_div_of_range_tendsto
      (q := q) (X := X) hXlim
      (durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_zero_of_forall_ne_zero
        (q := q) hq_ne_zero)
      (durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_top_of_forall_ne_top
        (q := q) hq_ne_top))
    hq_ne_top hq_ne_zero

/--
Durrett 2019, Theorem 4.3.8 source-convergence support: ENNReal convergence
of the standard finite-prefix likelihoods to an a.e. finite limit gives the
real-valued convergence input used by the positive-product L1 branch.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_toReal_tendsto_of_range_tendsto
    {S : Type*} [MeasurableSpace S] {ρ : Measure (ℕ -> S)}
    {q : ℕ -> S -> ℝ≥0∞} {X : (ℕ -> S) -> ℝ≥0∞}
    (hXfinite : ∀ᵐ x ∂ρ, X x ≠ ∞)
    (hXlim :
      ∀ᵐ x ∂ρ,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
          atTop (𝓝 (X x))) :
    ∀ᵐ x ∂ρ,
      Tendsto
        (fun n =>
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x).toReal)
        atTop (𝓝 ((X x).toReal)) := by
  filter_upwards [hXfinite, hXlim] with x hXx hlimx
  exact (ENNReal.tendsto_toReal hXx).comp hlimx

/--
Durrett 2019, Theorem 4.3.8 cylinder support: restricting an infinite product
law to finitely many coordinates gives the finite product likelihood ratio.
-/
theorem durrett2019_theorem_4_3_8_infiniteProduct_map_restrict_withDensity_eq
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)] (I : Finset ι) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i)) :
    (Measure.infinitePi μ).map I.restrict =
      ((Measure.infinitePi ν).map I.restrict).withDensity
        (durrett2019_theorem_4_3_8_finiteProductLikelihood (fun i : I => q i)) := by
  classical
  rw [Measure.infinitePi_map_restrict (μ := μ) (I := I),
    Measure.infinitePi_map_restrict (μ := ν) (I := I)]
  exact
    durrett2019_theorem_4_3_8_finiteProduct_withDensity_eq
      (μ := fun i : I => μ i) (ν := fun i : I => ν i)
      (q := fun i : I => q i) (fun i => hq i) (fun i => hμ i)

/--
Durrett 2019, Theorem 4.3.8 cylinder support: on a measurable cylinder, the
pulled-back finite-coordinate likelihood integrates to the numerator product
measure of that cylinder.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_setLIntegral_cylinder
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)] (I : Finset ι) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {A : Set (I -> S)} (hA : MeasurableSet A) :
    ∫⁻ x in cylinder I A,
        durrett2019_theorem_4_3_8_cylinderLikelihood I q x ∂Measure.infinitePi ν =
      Measure.infinitePi μ (cylinder I A) := by
  classical
  let fI : (I -> S) -> ℝ≥0∞ :=
    durrett2019_theorem_4_3_8_finiteProductLikelihood (fun i : I => q i)
  have hfI_meas : Measurable fI :=
    durrett2019_theorem_4_3_8_finiteProductLikelihood_measurable
      (q := fun i : I => q i) fun i => hq i
  have hfinite :
      ∫⁻ y in A, fI y ∂Measure.pi (fun i : I => ν i) =
        Measure.pi (fun i : I => μ i) A := by
    have hwith :
        Measure.pi (fun i : I => μ i) =
          (Measure.pi (fun i : I => ν i)).withDensity fI :=
      durrett2019_theorem_4_3_8_finiteProduct_withDensity_eq
        (μ := fun i : I => μ i) (ν := fun i : I => ν i)
        (q := fun i : I => q i) (fun i => hq i) (fun i => hμ i)
    rw [hwith, withDensity_apply _ hA]
  calc
    ∫⁻ x in cylinder I A,
        durrett2019_theorem_4_3_8_cylinderLikelihood I q x ∂Measure.infinitePi ν
        = ∫⁻ x,
            (A.indicator fI) (I.restrict x) ∂Measure.infinitePi ν := by
          rw [← lintegral_indicator (MeasurableSet.cylinder I hA)]
          refine lintegral_congr fun x => ?_
          by_cases hx : I.restrict x ∈ A
          · simp [fI, durrett2019_theorem_4_3_8_cylinderLikelihood, cylinder, hx]
          · simp [fI, cylinder, hx]
    _ = ∫⁻ y, A.indicator fI y ∂Measure.pi (fun i : I => ν i) := by
          exact lintegral_restrict_infinitePi
            (μ := ν) (s := I) (hfI_meas.indicator hA)
    _ = ∫⁻ y in A, fI y ∂Measure.pi (fun i : I => ν i) := by
          rw [lintegral_indicator hA]
    _ = Measure.pi (fun i : I => μ i) A := hfinite
    _ = Measure.infinitePi μ (cylinder I A) := by
          rw [Measure.infinitePi_cylinder (μ := μ) (s := I) hA]

/--
Durrett 2019, Theorem 4.3.8 cylinder support: each finite-coordinate
likelihood pulled back to sequence space has denominator integral one.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)] (I : Finset ι) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i)) :
    ∫⁻ x,
        durrett2019_theorem_4_3_8_cylinderLikelihood I q x ∂Measure.infinitePi ν = 1 := by
  have h :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_setLIntegral_cylinder
      (μ := μ) (ν := ν) I hq hμ (A := Set.univ) MeasurableSet.univ
  simpa [cylinder_univ] using h

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: the square-root power of the
pulled-back cylinder likelihood is measurable.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable
    {ι S : Type*} [MeasurableSpace S] (I : Finset ι) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) :
    Measurable fun x =>
      (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^ ((1 : ℝ) / 2) := by
  exact
    ENNReal.continuous_rpow_const.measurable.comp
      (durrett2019_theorem_4_3_8_cylinderLikelihood_measurable I hq)

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: pointwise square-root
factorization for a pulled-back cylinder likelihood.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_finset_prod
    {ι S : Type*} (I : Finset ι) (q : ι -> S -> ℝ≥0∞) (x : ι -> S) :
    (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^ ((1 : ℝ) / 2) =
      ∏ i ∈ I, (q i (x i)) ^ ((1 : ℝ) / 2) := by
  classical
  rw [durrett2019_theorem_4_3_8_cylinderLikelihood_eq_finset_prod]
  simpa using
    (ENNReal.prod_rpow_of_nonneg
      (s := I) (f := fun i => q i (x i))
      (r := (1 : ℝ) / 2) (by norm_num : 0 ≤ (1 : ℝ) / 2)).symm

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: integrating the square-root
power of a pulled-back finite-coordinate likelihood against the infinite
denominator product law factors into the one-coordinate Hellinger integrals.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_lintegral
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    (I : Finset ι) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) :
    ∫⁻ x,
        (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^ ((1 : ℝ) / 2)
          ∂Measure.infinitePi ν =
      ∏ i : I, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i := by
  classical
  let fI : (I -> S) -> ℝ≥0∞ :=
    fun y =>
      (durrett2019_theorem_4_3_8_finiteProductLikelihood (fun i : I => q i) y) ^
        ((1 : ℝ) / 2)
  have hfI_meas : Measurable fI :=
    durrett2019_theorem_4_3_8_finiteProductLikelihood_rpow_half_measurable
      (q := fun i : I => q i) fun i => hq i
  calc
    ∫⁻ x,
        (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^ ((1 : ℝ) / 2)
          ∂Measure.infinitePi ν
        = ∫⁻ x, fI (I.restrict x) ∂Measure.infinitePi ν := by
          rfl
    _ = ∫⁻ y, fI y ∂Measure.pi (fun i : I => ν i) := by
          exact lintegral_restrict_infinitePi
            (μ := ν) (s := I) hfI_meas
    _ = ∏ i : I, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i := by
          exact
            durrett2019_theorem_4_3_8_finiteProductLikelihood_rpow_half_lintegral
              (ν := fun i : I => ν i) (q := fun i : I => q i) fun i => hq i

/--
Durrett 2019, Theorem 4.3.8 finite-coordinate product support: integrating a
finite product of coordinate functions over an infinite product probability
space factors into the product of the one-coordinate integrals.
-/
theorem durrett2019_theorem_4_3_8_cylinderCoordinateProduct_lintegral
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    (I : Finset ι) {f : ι -> S -> ℝ≥0∞}
    (hf : ∀ i, Measurable (f i)) :
    ∫⁻ x, (∏ i ∈ I, f i (x i)) ∂Measure.infinitePi ν =
      ∏ i ∈ I, ∫⁻ y, f i y ∂ν i := by
  classical
  let X : ι -> (ι -> S) -> ℝ≥0∞ := fun i x => f i (x i)
  have hX_meas : ∀ i, Measurable (X i) := by
    intro i
    exact (hf i).comp (measurable_pi_apply i)
  have hX_indep :
      _root_.ProbabilityTheory.iIndepFun X (Measure.infinitePi ν) := by
    simpa [X] using
      (_root_.ProbabilityTheory.iIndepFun_infinitePi
        (P := ν) (X := f) hf)
  calc
    ∫⁻ x, (∏ i ∈ I, f i (x i)) ∂Measure.infinitePi ν
        = ∫⁻ x, ∏ i ∈ I, X i x ∂Measure.infinitePi ν := by
          rfl
    _ = ∏ i ∈ I, ∫⁻ x, X i x ∂Measure.infinitePi ν := by
          simpa using
            (_root_.ProbabilityTheory.lintegral_prod_eq_prod_lintegral_of_indepFun
              (μ := Measure.infinitePi ν) (s := I) (X := X) hX_indep hX_meas)
    _ = ∏ i ∈ I, ∫⁻ y, f i y ∂ν i := by
          refine Finset.prod_congr rfl ?_
          intro i _hi
          exact
            (measurePreserving_eval_infinitePi (μ := ν) i).lintegral_comp (hf i)

/--
Durrett 2019, Theorem 4.3.8 Hellinger support: for nested finite coordinate
sets, the overlap of two square-root cylinder likelihoods is exactly the
finite Hellinger tail product over the new coordinates.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_sqrt_overlap_lintegral_of_subset
    {ι S : Type*} [DecidableEq ι] [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {I J : Finset ι} (hIJ : I ⊆ J) {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i)) :
    ∫⁻ x,
        (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^
            ((1 : ℝ) / 2) *
          (durrett2019_theorem_4_3_8_cylinderLikelihood J q x) ^
            ((1 : ℝ) / 2)
        ∂Measure.infinitePi ν =
      (J \ I).prod (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) := by
  classical
  let h : ι -> ℝ≥0∞ := fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i
  let f : ι -> S -> ℝ≥0∞ := fun i y =>
    if i ∈ I then q i y else (q i y) ^ ((1 : ℝ) / 2)
  have hf : ∀ i, Measurable (f i) := by
    intro i
    dsimp [f]
    split_ifs
    · exact hq i
    · exact ENNReal.continuous_rpow_const.measurable.comp (hq i)
  have hq_int : ∀ i, ∫⁻ y, q i y ∂ν i = 1 := by
    intro i
    calc
      ∫⁻ y, q i y ∂ν i = (ν i).withDensity (q i) Set.univ := by
        rw [withDensity_apply _ MeasurableSet.univ]
        simp
      _ = μ i Set.univ := by rw [← hμ i]
      _ = 1 := measure_univ
  have hpoint :
      (fun x : ι -> S =>
          (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^
              ((1 : ℝ) / 2) *
            (durrett2019_theorem_4_3_8_cylinderLikelihood J q x) ^
              ((1 : ℝ) / 2)) =
        fun x => ∏ i ∈ J, f i (x i) := by
    funext x
    let r : ι -> ℝ≥0∞ := fun i => (q i (x i)) ^ ((1 : ℝ) / 2)
    have hr_sq : ∀ i, r i * r i = q i (x i) := by
      intro i
      dsimp [r]
      rw [← pow_two]
      rw [← ENNReal.rpow_two]
      simpa [one_div] using
        (ENNReal.rpow_inv_rpow (by norm_num : (2 : ℝ) ≠ 0) (q i (x i)))
    rw [durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_finset_prod,
      durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_finset_prod]
    change (∏ i ∈ I, r i) * (∏ i ∈ J, r i) = ∏ i ∈ J, f i (x i)
    calc
      (∏ i ∈ I, r i) * (∏ i ∈ J, r i)
          = (J \ I).prod r * ((∏ i ∈ I, r i) * ∏ i ∈ I, r i) := by
            rw [← Finset.prod_sdiff hIJ]
            ac_rfl
      _ = (J \ I).prod r * (∏ i ∈ I, r i * r i) := by
            rw [Finset.prod_mul_distrib]
      _ = (J \ I).prod r * (∏ i ∈ I, q i (x i)) := by
            congr 1
            exact Finset.prod_congr rfl fun i _hi => hr_sq i
      _ = (J \ I).prod (fun i => f i (x i)) * (∏ i ∈ I, f i (x i)) := by
            have htail_prod :
                (J \ I).prod r = (J \ I).prod (fun i => f i (x i)) := by
              refine Finset.prod_congr rfl ?_
              intro i hi
              have hi_not : i ∉ I := (Finset.mem_sdiff.mp hi).2
              simp [f, r, hi_not]
            have hprefix_prod :
                (∏ i ∈ I, q i (x i)) = ∏ i ∈ I, f i (x i) := by
              refine Finset.prod_congr rfl ?_
              intro i hi
              simp [f, hi]
            rw [htail_prod, hprefix_prod]
      _ = ∏ i ∈ J, f i (x i) := by
            rw [Finset.prod_sdiff hIJ]
  calc
    ∫⁻ x,
        (durrett2019_theorem_4_3_8_cylinderLikelihood I q x) ^
            ((1 : ℝ) / 2) *
          (durrett2019_theorem_4_3_8_cylinderLikelihood J q x) ^
            ((1 : ℝ) / 2)
        ∂Measure.infinitePi ν
        = ∫⁻ x, ∏ i ∈ J, f i (x i) ∂Measure.infinitePi ν := by
          rw [hpoint]
    _ = ∏ i ∈ J, ∫⁻ y, f i y ∂ν i := by
          exact
            durrett2019_theorem_4_3_8_cylinderCoordinateProduct_lintegral
              (ν := ν) J hf
    _ = (J \ I).prod (fun i => ∫⁻ y, f i y ∂ν i) *
          (∏ i ∈ I, ∫⁻ y, f i y ∂ν i) := by
          rw [Finset.prod_sdiff hIJ]
    _ = (J \ I).prod h * (∏ _i ∈ I, (1 : ℝ≥0∞)) := by
          have htail_prod :
              (J \ I).prod (fun i => ∫⁻ y, f i y ∂ν i) = (J \ I).prod h := by
            refine Finset.prod_congr rfl ?_
            intro i hi
            have hi_not : i ∉ I := (Finset.mem_sdiff.mp hi).2
            simp [f, h, hi_not]
          have hprefix_prod :
              (∏ i ∈ I, ∫⁻ y, f i y ∂ν i) = ∏ _i ∈ I, (1 : ℝ≥0∞) := by
            refine Finset.prod_congr rfl ?_
            intro i hi
            simp [f, hi, hq_int i]
          rw [htail_prod, hprefix_prod]
    _ = (J \ I).prod (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) := by
          simp [h]

/--
Durrett 2019, Theorem 4.3.8 zero-product support: if the finite likelihoods
converge almost surely and their Hellinger integrals tend to zero, then the
limiting likelihood vanishes almost surely.

This packages the Fatou step in the textbook proof of the singular side of
Kakutani's dichotomy.
-/
theorem durrett2019_theorem_4_3_8_ae_eq_zero_of_hellinger_lintegral_tendsto_zero
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {Xseq : ℕ -> Ω -> ℝ≥0∞} {X : Ω -> ℝ≥0∞}
    (hXseq : ∀ n, Measurable (Xseq n)) (hX : Measurable X)
    (hlim : ∀ᵐ ω ∂ν, Tendsto (fun n => Xseq n ω) atTop (𝓝 (X ω)))
    (hhellinger :
      Tendsto (fun n => ∫⁻ ω, (Xseq n ω) ^ ((1 : ℝ) / 2) ∂ν) atTop (𝓝 0)) :
    X =ᵐ[ν] 0 := by
  let half : ℝ := (1 : ℝ) / 2
  have hhalf_pos : 0 < half := by
    norm_num [half]
  have hhalf_nonneg : 0 ≤ half := le_of_lt hhalf_pos
  have hlim_half :
      ∀ᵐ ω ∂ν, Tendsto (fun n => (Xseq n ω) ^ half) atTop (𝓝 ((X ω) ^ half)) := by
    filter_upwards [hlim] with ω hω
    exact ENNReal.continuous_rpow_const.continuousAt.tendsto.comp hω
  have hfatou :
      ∫⁻ ω, (X ω) ^ half ∂ν ≤
        Filter.liminf (fun n => ∫⁻ ω, (Xseq n ω) ^ half ∂ν) atTop := by
    calc
      ∫⁻ ω, (X ω) ^ half ∂ν
          = ∫⁻ ω, Filter.liminf (fun n => (Xseq n ω) ^ half) atTop ∂ν := by
              apply lintegral_congr_ae
              filter_upwards [hlim_half] with ω hω
              exact hω.liminf_eq.symm
      _ ≤ Filter.liminf (fun n => ∫⁻ ω, (Xseq n ω) ^ half ∂ν) atTop := by
          exact MeasureTheory.lintegral_liminf_le fun n =>
            ENNReal.continuous_rpow_const.measurable.comp (hXseq n)
  have hliminf_zero :
      Filter.liminf (fun n => ∫⁻ ω, (Xseq n ω) ^ half ∂ν) atTop = 0 := by
    simpa [half] using hhellinger.liminf_eq
  have hlintegral_zero : ∫⁻ ω, (X ω) ^ half ∂ν = 0 := by
    refine le_antisymm ?_ bot_le
    simpa [hliminf_zero] using hfatou
  have hpow_zero : (fun ω => (X ω) ^ half) =ᵐ[ν] 0 := by
    exact
      (MeasureTheory.lintegral_eq_zero_iff
        (ENNReal.continuous_rpow_const.measurable.comp hX)).1 hlintegral_zero
  filter_upwards [hpow_zero] with ω hω
  rcases (ENNReal.rpow_eq_zero_iff.mp hω) with hzero | htop
  · exact hzero.1
  · exact False.elim ((not_lt.mpr hhalf_nonneg) htop.2)

/--
Durrett 2019, Theorem 4.3.8 zero-product source handoff: for finite-coordinate
cylinder likelihoods, convergence of the finite Hellinger products to zero
forces the limiting likelihood to vanish almost surely.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_ae_eq_zero_of_hellinger_products_tendsto_zero
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) {X : (ι -> S) -> ℝ≥0∞}
    (hX : Measurable X)
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
          atTop (𝓝 (X x)))
    (hhellinger :
      Tendsto
        (fun n => ∏ i : Iseq n, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)
        atTop (𝓝 0)) :
    X =ᵐ[Measure.infinitePi ν] 0 := by
  refine
    durrett2019_theorem_4_3_8_ae_eq_zero_of_hellinger_lintegral_tendsto_zero
      (ν := Measure.infinitePi ν)
      (Xseq := fun n x => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
      (X := X)
      (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood_measurable (Iseq n) hq)
      hX hlim ?_
  have hfun :
      (fun n =>
          ∫⁻ x,
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
              ((1 : ℝ) / 2) ∂Measure.infinitePi ν) =
        fun n => ∏ i : Iseq n, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i := by
    funext n
    exact
      durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_lintegral
        (ν := ν) (Iseq n) hq
  rw [hfun]
  exact hhellinger

/--
Durrett 2019, Theorem 4.3.8 zero-product singularity support: if the
Theorem 4.3.5 source identity is available for a limiting likelihood `X`,
and `X` vanishes denominator-almost surely, then the numerator and denominator
measures are mutually singular.
-/
theorem durrett2019_theorem_4_3_8_mutuallySingular_of_source_real_identity_zero
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] {X : Ω -> ℝ≥0∞} (hX : Measurable X)
    (hXzero : X =ᵐ[ν] 0)
    (hidentity :
      ∀ {A : Set Ω}, MeasurableSet A ->
        μ.real A =
          ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}))
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ ⟂ₘ ν := by
  let T : Set Ω := {ω | X ω = ∞}
  let S : Set Ω := Tᶜ
  have hT : MeasurableSet T := by
    dsimp [T]
    exact measurableSet_eq_fun hX measurable_const
  have htoReal_zero :
      (fun ω => (X ω).toReal) =ᵐ[ν] (fun _ : Ω => (0 : ℝ)) := by
    filter_upwards [hXzero] with ω hω
    simp [hω]
  have hintegral_zero :
      ∫ ω in S, (X ω).toReal ∂ν = 0 := by
    have hcongr :
        ∫ ω in S, (X ω).toReal ∂ν =
          ∫ ω in S, (fun _ : Ω => (0 : ℝ)) ω ∂ν := by
      exact setIntegral_congr_ae hT.compl
        (htoReal_zero.mono fun ω hω _ => hω)
    rw [hcongr]
    simp
  have hμS_real : μ.real S = 0 := by
    have hid := hidentity hT.compl
    rw [hintegral_zero] at hid
    simpa [S, T] using hid
  have hμS : μ S = 0 :=
    (measureReal_eq_zero_iff (μ := μ) (s := S) (measure_ne_top μ S)).1 hμS_real
  refine Measure.MutuallySingular.mk (s := S) (t := T) hμS hνtop ?_
  intro ω _
  by_cases hω : ω ∈ T
  · exact Or.inr hω
  · exact Or.inl hω

/--
Durrett 2019, Theorem 4.3.8 zero-product singularity handoff from the
Radon-Nikodym/top-set identity packaged in Theorem 4.3.5.
-/
theorem durrett2019_theorem_4_3_8_mutuallySingular_of_top_set_identity_zero
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] [IsFiniteMeasure ν] [μ.HaveLebesgueDecomposition ν]
    {X : Ω -> ℝ≥0∞} (hX : Measurable X) (hXzero : X =ᵐ[ν] 0)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hμtop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ ⟂ₘ ν := by
  refine
    durrett2019_theorem_4_3_8_mutuallySingular_of_source_real_identity_zero
      (μ := μ) (ν := ν) (X := X) hX hXzero ?_ hνtop
  intro A hA
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_top_set
      (μ := μ) (ν := ν) (X := X) hA hXrn hμtop hνtop

/--
Durrett 2019, Theorem 4.3.8 zero-product singularity handoff: the Fatou
Hellinger endpoint plus a source real-identity yields mutual singularity.
-/
theorem durrett2019_theorem_4_3_8_mutuallySingular_of_hellinger_lintegral_tendsto_zero
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] {Xseq : ℕ -> Ω -> ℝ≥0∞} {X : Ω -> ℝ≥0∞}
    (hXseq : ∀ n, Measurable (Xseq n)) (hX : Measurable X)
    (hlim : ∀ᵐ ω ∂ν, Tendsto (fun n => Xseq n ω) atTop (𝓝 (X ω)))
    (hhellinger :
      Tendsto (fun n => ∫⁻ ω, (Xseq n ω) ^ ((1 : ℝ) / 2) ∂ν) atTop (𝓝 0))
    (hidentity :
      ∀ {A : Set Ω}, MeasurableSet A ->
        μ.real A =
          ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}))
    (hνtop : ν {ω | X ω = ∞} = 0) :
    μ ⟂ₘ ν := by
  have hXzero :
      X =ᵐ[ν] 0 :=
    durrett2019_theorem_4_3_8_ae_eq_zero_of_hellinger_lintegral_tendsto_zero
      (ν := ν) (Xseq := Xseq) (X := X) hXseq hX hlim hhellinger
  exact
    durrett2019_theorem_4_3_8_mutuallySingular_of_source_real_identity_zero
      (μ := μ) (ν := ν) (X := X) hX hXzero hidentity hνtop

/--
Durrett 2019, Theorem 4.3.8 zero-product cylinder handoff: finite-coordinate
Hellinger products tending to zero plus a source real-identity for the limiting
likelihood yields mutual singularity.
-/
theorem durrett2019_theorem_4_3_8_mutuallySingular_of_cylinderLikelihood_hellinger_products_tendsto_zero
    {ι S : Type*} [MeasurableSpace S]
    {μ : Measure (ι -> S)} [IsFiniteMeasure μ]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) {X : (ι -> S) -> ℝ≥0∞}
    (hX : Measurable X)
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
          atTop (𝓝 (X x)))
    (hhellinger :
      Tendsto
        (fun n => ∏ i : Iseq n, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)
        atTop (𝓝 0))
    (hidentity :
      ∀ {A : Set (ι -> S)}, MeasurableSet A ->
        μ.real A =
          ∫ x in A, (X x).toReal ∂Measure.infinitePi ν +
            μ.real (A ∩ {x | X x = ∞}))
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0) :
    μ ⟂ₘ Measure.infinitePi ν := by
  have hXzero :
      X =ᵐ[Measure.infinitePi ν] 0 :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_ae_eq_zero_of_hellinger_products_tendsto_zero
      (ν := ν) (Iseq := Iseq) (q := q) hq hX hlim hhellinger
  exact
    durrett2019_theorem_4_3_8_mutuallySingular_of_source_real_identity_zero
      (μ := μ) (ν := Measure.infinitePi ν) (X := X) hX hXzero hidentity hνtop

/--
Durrett 2019, Theorem 4.3.8 positive-product absolute-continuity support: if
the Theorem 4.3.5 source identity has no numerator mass on the infinite-density
top set, then the numerator measure is absolutely continuous with respect to
the denominator measure.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_source_real_identity_no_top_mass
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] {X : Ω -> ℝ≥0∞}
    (hidentity :
      ∀ {A : Set Ω}, MeasurableSet A ->
        μ.real A =
          ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}))
    (hμtop : μ {ω | X ω = ∞} = 0) :
    μ ≪ ν := by
  refine Measure.AbsolutelyContinuous.mk fun A hA hνA => ?_
  have hintegral_zero :
      ∫ ω in A, (X ω).toReal ∂ν = 0 :=
    setIntegral_measure_zero (fun ω => (X ω).toReal) hνA
  have hμA_top : μ (A ∩ {ω | X ω = ∞}) = 0 :=
    measure_mono_null Set.inter_subset_right hμtop
  have hμA_top_real : μ.real (A ∩ {ω | X ω = ∞}) = 0 :=
    (measureReal_eq_zero_iff
      (μ := μ) (s := A ∩ {ω | X ω = ∞}) (measure_ne_top μ _)).2 hμA_top
  have hμA_real : μ.real A = 0 := by
    have hid := hidentity hA
    rw [hintegral_zero, hμA_top_real] at hid
    simpa using hid
  exact (measureReal_eq_zero_iff (μ := μ) (s := A) (measure_ne_top μ A)).1 hμA_real

/--
Durrett 2019, Theorem 4.3.8 positive-product absolute-continuity handoff from
the Radon-Nikodym/top-set identity packaged in Theorem 4.3.5.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_top_set_identity_no_top_mass
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] [IsFiniteMeasure ν] [μ.HaveLebesgueDecomposition ν]
    {X : Ω -> ℝ≥0∞}
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hμsingTop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hμtop : μ {ω | X ω = ∞} = 0) :
    μ ≪ ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_source_real_identity_no_top_mass
      (μ := μ) (ν := ν) (X := X) ?_ hμtop
  intro A hA
  exact
    durrett2019_theorem_4_3_5_source_real_identity_of_top_set
      (μ := μ) (ν := ν) (X := X) hA hXrn hμsingTop hνtop

/--
Durrett 2019, Theorem 4.3.8 positive-product equivalence support: paired
source real-identities with no mass on either infinite-density top set give
absolute continuity in both directions.
-/
theorem durrett2019_theorem_4_3_8_mutuallyAbsolutelyContinuous_of_source_real_identities_no_top_mass
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    {X : Ω -> ℝ≥0∞} {Y : Ω -> ℝ≥0∞}
    (hμidentity :
      ∀ {A : Set Ω}, MeasurableSet A ->
        μ.real A =
          ∫ ω in A, (X ω).toReal ∂ν + μ.real (A ∩ {ω | X ω = ∞}))
    (hνidentity :
      ∀ {A : Set Ω}, MeasurableSet A ->
        ν.real A =
          ∫ ω in A, (Y ω).toReal ∂μ + ν.real (A ∩ {ω | Y ω = ∞}))
    (hμtop : μ {ω | X ω = ∞} = 0)
    (hνtop : ν {ω | Y ω = ∞} = 0) :
    μ ≪ ν ∧ ν ≪ μ := by
  exact
    ⟨durrett2019_theorem_4_3_8_absolutelyContinuous_of_source_real_identity_no_top_mass
        (μ := μ) (ν := ν) (X := X) hμidentity hμtop,
      durrett2019_theorem_4_3_8_absolutelyContinuous_of_source_real_identity_no_top_mass
        (μ := ν) (ν := μ) (X := Y) hνidentity hνtop⟩

/--
Durrett 2019, Theorem 4.3.8 zero-product final assembly: finite-coordinate
Hellinger products tending to zero, the cylinder likelihood convergence, and
the Theorem 4.3.5 top-set identity imply mutual singularity.
-/
theorem durrett2019_theorem_4_3_8_mutuallySingular_of_cylinderLikelihood_hellinger_products_tendsto_zero_top_set_identity
    {ι S : Type*} [MeasurableSpace S]
    {μ : Measure (ι -> S)} [IsFiniteMeasure μ]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    [μ.HaveLebesgueDecomposition (Measure.infinitePi ν)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) {X : (ι -> S) -> ℝ≥0∞}
    (hX : Measurable X)
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
          atTop (𝓝 (X x)))
    (hhellinger :
      Tendsto
        (fun n => ∏ i : Iseq n, ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)
        atTop (𝓝 0))
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => (μ.rnDeriv (Measure.infinitePi ν) x).toReal)
    (hμsingTop :
      μ.singularPart (Measure.infinitePi ν) {x | X x = ∞}ᶜ = 0)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0) :
    μ ⟂ₘ Measure.infinitePi ν := by
  exact
    durrett2019_theorem_4_3_8_mutuallySingular_of_cylinderLikelihood_hellinger_products_tendsto_zero
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) hq hX hlim hhellinger
      (by
        intro A hA
        exact
          durrett2019_theorem_4_3_5_source_real_identity_of_top_set
            (μ := μ) (ν := Measure.infinitePi ν) (X := X) hA hXrn hμsingTop hνtop)
      hνtop

/--
Durrett 2019, Theorem 4.3.8 positive-product final assembly: paired top-set
Radon-Nikodym identities, with no numerator mass on either infinite-density
top set, give absolute continuity in both directions.
-/
theorem durrett2019_theorem_4_3_8_mutuallyAbsolutelyContinuous_of_top_set_identities_no_top_mass
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    [μ.HaveLebesgueDecomposition ν] [ν.HaveLebesgueDecomposition μ]
    {X Y : Ω -> ℝ≥0∞}
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hYrn :
      (fun ω => (Y ω).toReal) =ᵐ[μ]
        fun ω => (ν.rnDeriv μ ω).toReal)
    (hμsingTop : μ.singularPart ν {ω | X ω = ∞}ᶜ = 0)
    (hνXtop : ν {ω | X ω = ∞} = 0)
    (hνsingTop : ν.singularPart μ {ω | Y ω = ∞}ᶜ = 0)
    (hμYtop : μ {ω | Y ω = ∞} = 0)
    (hμXtop : μ {ω | X ω = ∞} = 0)
    (hνYtop : ν {ω | Y ω = ∞} = 0) :
    μ ≪ ν ∧ ν ≪ μ := by
  refine
    durrett2019_theorem_4_3_8_mutuallyAbsolutelyContinuous_of_source_real_identities_no_top_mass
      (μ := μ) (ν := ν) (X := X) (Y := Y) ?_ ?_ hμXtop hνYtop
  · intro A hA
    exact
      durrett2019_theorem_4_3_5_source_real_identity_of_top_set
        (μ := μ) (ν := ν) (X := X) hA hXrn hμsingTop hνXtop
  · intro A hA
    exact
      durrett2019_theorem_4_3_5_source_real_identity_of_top_set
        (μ := ν) (ν := μ) (X := Y) hA hYrn hνsingTop hμYtop

/--
Durrett 2019, Theorem 4.3.8 positive-branch support: on the source likelihood
identified with the Radon-Nikodym derivative, mutual singularity forces the
limiting likelihood to vanish denominator-almost surely.
-/
theorem durrett2019_theorem_4_3_8_ae_eq_zero_of_mutuallySingular_likelihood
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hμν : μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0) :
    X =ᵐ[ν] 0 := by
  have hreal_zero :
      (fun ω => (X ω).toReal) =ᵐ[ν] fun _ : Ω => (0 : ℝ) := by
    filter_upwards [hXrn, hμν.rnDeriv_ae_eq_zero] with ω hx hrn
    calc
      (X ω).toReal = (μ.rnDeriv ν ω).toReal := hx
      _ = ((0 : Ω -> ℝ≥0∞) ω).toReal := by rw [hrn]
      _ = 0 := by simp
  have hfinite : ∀ᵐ ω ∂ν, ω ∉ {ω | X ω = ∞} :=
    measure_eq_zero_iff_ae_notMem.mp hνtop
  filter_upwards [hreal_zero, hfinite] with ω hreal hneTop
  rcases (ENNReal.toReal_eq_zero_iff (X ω)).1 hreal with hzero | htop
  · exact hzero
  · exact False.elim (hneTop htop)

/--
Durrett 2019, Theorem 4.3.8 positive-branch support: if the denominator measure
is nonzero and the zero set of the limiting likelihood is null, then the
likelihood is not almost surely zero.
-/
theorem durrett2019_theorem_4_3_8_not_ae_eq_zero_of_zero_set_null
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω} [NeZero ν]
    {X : Ω -> ℝ≥0∞} (hzeroSet : ν {ω | X ω = 0} = 0) :
    ¬ X =ᵐ[ν] 0 := by
  intro hXzero
  have hnonzero : ν {ω | X ω ≠ 0} = 0 := by
    simpa [Set.compl_setOf] using (mem_ae_iff.mp hXzero)
  have huniv : ν Set.univ = 0 := by
    refine measure_mono_null ?_ (measure_union_null hzeroSet hnonzero)
    intro ω _
    by_cases hω : X ω = 0
    · exact Or.inl hω
    · exact Or.inr hω
  exact (NeZero.ne (ν Set.univ)) huniv

/--
Durrett 2019, Theorem 4.3.8 positive-branch support: a limiting likelihood
with nonzero lower integral cannot vanish almost surely.
-/
theorem durrett2019_theorem_4_3_8_not_ae_eq_zero_of_lintegral_ne_zero
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    ¬ X =ᵐ[ν] 0 := by
  intro hXzero
  exact hInt (lintegral_eq_zero_of_ae_eq_zero hXzero)

/--
Durrett 2019, Theorem 4.3.8 positive-branch support: an a.e. finite limiting
likelihood has null infinite-density top set.
-/
theorem durrett2019_theorem_4_3_8_top_set_null_of_ae_ne_top
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hXfinite : ∀ᵐ ω ∂ν, X ω ≠ ∞) :
    ν {ω | X ω = ∞} = 0 :=
  measure_eq_zero_iff_ae_notMem.2 <|
    hXfinite.mono fun _ hne htop => hne htop

/--
Durrett 2019, Theorem 4.3.8 tail-event support: Kolmogorov's zero-one law for
events in the tail sigma-field of an independent sequence of sigma-fields.
-/
theorem durrett2019_theorem_4_3_8_tail_event_measure_zero_or_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {A : Set Ω}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hA_tail : MeasurableSet[limsup s atTop] A) :
    ν A = 0 ∨ ν A = 1 :=
  _root_.ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop
    (s := s) (m0 := mΩ) (μ := ν) hs_le hs_indep hA_tail

/--
Durrett 2019, Theorem 4.3.8 tail-event support: an event that is measurable
from every tail block is measurable in the `limsup` tail sigma-field.
-/
theorem durrett2019_theorem_4_3_8_tail_event_measurable_of_forall_tailBlock_measurable
    {Ω : Type*} {s : ℕ -> MeasurableSpace Ω} {A : Set Ω}
    (hA_tailBlock : ∀ n, MeasurableSet[⨆ i : ℕ, ⨆ _ : i ≥ n, s i] A) :
    MeasurableSet[limsup s atTop] A := by
  rw [limsup_eq_iInf_iSup_of_nat]
  exact (MeasurableSpace.measurableSet_iInf).2 hA_tailBlock

/--
Durrett 2019, Theorem 4.3.8 tail-event support specialized to the zero set of
the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_tail_zero_set_measurable_of_forall_tailBlock_measurable
    {Ω : Type*} {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hzero_tailBlock :
      ∀ n, MeasurableSet[⨆ i : ℕ, ⨆ _ : i ≥ n, s i] {ω | X ω = 0}) :
    MeasurableSet[limsup s atTop] {ω | X ω = 0} :=
  durrett2019_theorem_4_3_8_tail_event_measurable_of_forall_tailBlock_measurable
    (s := s) (A := {ω | X ω = 0}) hzero_tailBlock

/--
Durrett 2019, Theorem 4.3.8 tail-event support: if the zero set of the limiting
likelihood is a tail event and is not full under the denominator measure, then
it is null.
-/
theorem durrett2019_theorem_4_3_8_tail_zero_set_null_of_measure_ne_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hzero_ne_one : ν {ω | X ω = 0} ≠ 1) :
    ν {ω | X ω = 0} = 0 := by
  rcases
      durrett2019_theorem_4_3_8_tail_event_measure_zero_or_one
        (ν := ν) (s := s) (A := {ω | X ω = 0}) hs_le hs_indep hzero_tail with
    hzero | hfull
  · exact hzero
  · exact False.elim (hzero_ne_one hfull)

/--
Durrett 2019, Theorem 4.3.8 tail-event support: a nonzero lower integral
prevents the tail zero set of the limiting likelihood from having full
denominator probability.
-/
theorem durrett2019_theorem_4_3_8_tail_zero_set_measure_ne_one_of_lintegral_ne_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    ν {ω | X ω = 0} ≠ 1 := by
  haveI : IsProbabilityMeasure ν := hs_indep.isProbabilityMeasure
  have hzero_meas : MeasurableSet {ω | X ω = 0} :=
    (limsup_le_iSup.trans (iSup_le hs_le)) _ hzero_tail
  intro hfull
  have hzero_ae : X =ᵐ[ν] 0 :=
    (mem_ae_iff_prob_eq_one hzero_meas).2 hfull
  exact hInt (lintegral_eq_zero_of_ae_eq_zero hzero_ae)

/--
Durrett 2019, Theorem 4.3.8 tail-event support: if the zero set is a tail
event and the limiting likelihood has nonzero lower integral, then the zero
set is null.
-/
theorem durrett2019_theorem_4_3_8_tail_zero_set_null_of_lintegral_ne_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    ν {ω | X ω = 0} = 0 :=
  durrett2019_theorem_4_3_8_tail_zero_set_null_of_measure_ne_one
    (ν := ν) (s := s) (X := X) hs_le hs_indep hzero_tail
    (durrett2019_theorem_4_3_8_tail_zero_set_measure_ne_one_of_lintegral_ne_zero
      (ν := ν) (s := s) (X := X) hs_le hs_indep hzero_tail hInt)

/--
Durrett 2019, Theorem 4.3.8 tail-event support: every-tail-block
measurability plus a nonzero lower integral gives a null zero set.
-/
theorem durrett2019_theorem_4_3_8_tail_zero_set_null_of_tailBlock_measurable_lintegral_ne_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tailBlock :
      ∀ n, MeasurableSet[⨆ i : ℕ, ⨆ _ : i ≥ n, s i] {ω | X ω = 0})
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    ν {ω | X ω = 0} = 0 :=
  durrett2019_theorem_4_3_8_tail_zero_set_null_of_lintegral_ne_zero
    (ν := ν) (s := s) (X := X) hs_le hs_indep
    (durrett2019_theorem_4_3_8_tail_zero_set_measurable_of_forall_tailBlock_measurable
      (s := s) (X := X) hzero_tailBlock)
    hInt

/--
Durrett 2019, Theorem 4.3.8 positive-branch support: a non-full tail zero set
rules out an a.e. zero limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_not_ae_eq_zero_of_tail_zero_set_measure_ne_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hzero_ne_one : ν {ω | X ω = 0} ≠ 1) :
    ¬ X =ᵐ[ν] 0 := by
  haveI : IsProbabilityMeasure ν := hs_indep.isProbabilityMeasure
  exact
    durrett2019_theorem_4_3_8_not_ae_eq_zero_of_zero_set_null
      (ν := ν) (X := X)
      (durrett2019_theorem_4_3_8_tail_zero_set_null_of_measure_ne_one
        (ν := ν) (s := s) (X := X) hs_le hs_indep hzero_tail hzero_ne_one)

/--
Durrett 2019, Theorem 4.3.8 positive-branch support: a tail zero set and
nonzero lower integral rule out an a.e. zero limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_not_ae_eq_zero_of_tail_zero_set_lintegral_ne_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    ¬ X =ᵐ[ν] 0 := by
  haveI : IsProbabilityMeasure ν := hs_indep.isProbabilityMeasure
  exact
    durrett2019_theorem_4_3_8_not_ae_eq_zero_of_zero_set_null
      (ν := ν) (X := X)
      (durrett2019_theorem_4_3_8_tail_zero_set_null_of_lintegral_ne_zero
        (ν := ν) (s := s) (X := X) hs_le hs_indep hzero_tail hInt)

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator: if an external
tail-event or L1 argument has ruled out `X = 0` denominator-a.e., then a
source dichotomy `mu << nu or mu singular nu` collapses to absolute continuity.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_not_ae_zero
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hnotZero : ¬ X =ᵐ[ν] 0) :
    μ ≪ ν := by
  rcases hbranch with hμν | hsing
  · exact hμν
  · exact False.elim
      (hnotZero
        (durrett2019_theorem_4_3_8_ae_eq_zero_of_mutuallySingular_likelihood
          (μ := μ) (ν := ν) (X := X) hsing hXrn hνtop))

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator specialized to a null
zero set for the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_zero_set_null
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω} [NeZero ν]
    {X : Ω -> ℝ≥0∞} (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hzeroSet : ν {ω | X ω = 0} = 0) :
    μ ≪ ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_not_ae_zero
    (μ := μ) (ν := ν) (X := X) hbranch hXrn hνtop
    (durrett2019_theorem_4_3_8_not_ae_eq_zero_of_zero_set_null
      (ν := ν) (X := X) hzeroSet)

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator specialized to a
non-full tail zero set for the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_tail_zero_set_measure_ne_one
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hzero_ne_one : ν {ω | X ω = 0} ≠ 1) :
    μ ≪ ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_not_ae_zero
    (μ := μ) (ν := ν) (X := X) hbranch hXrn hνtop
    (durrett2019_theorem_4_3_8_not_ae_eq_zero_of_tail_zero_set_measure_ne_one
      (ν := ν) (s := s) (X := X) hs_le hs_indep hzero_tail hzero_ne_one)

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator specialized to a tail
zero set and nonzero lower integral of the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_tail_zero_set_lintegral_ne_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tail : MeasurableSet[limsup s atTop] {ω | X ω = 0})
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    μ ≪ ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_not_ae_zero
    (μ := μ) (ν := ν) (X := X) hbranch hXrn hνtop
    (durrett2019_theorem_4_3_8_not_ae_eq_zero_of_tail_zero_set_lintegral_ne_zero
      (ν := ν) (s := s) (X := X) hs_le hs_indep hzero_tail hInt)

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator specialized to zero
sets measurable from every tail block and nonzero lower integral.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_tailBlock_zero_set_lintegral_ne_zero
    {Ω : Type*} [mΩ : MeasurableSpace Ω] {μ ν : Measure Ω}
    {s : ℕ -> MeasurableSpace Ω} {X : Ω -> ℝ≥0∞}
    (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hs_le : ∀ n, s n ≤ mΩ)
    (hs_indep : _root_.ProbabilityTheory.iIndep s ν)
    (hzero_tailBlock :
      ∀ n, MeasurableSet[⨆ i : ℕ, ⨆ _ : i ≥ n, s i] {ω | X ω = 0})
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    μ ≪ ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_tail_zero_set_lintegral_ne_zero
    (μ := μ) (ν := ν) (s := s) (X := X)
    hbranch hXrn hνtop hs_le hs_indep
    (durrett2019_theorem_4_3_8_tail_zero_set_measurable_of_forall_tailBlock_measurable
      (s := s) (X := X) hzero_tailBlock)
    hInt

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator specialized to a
nonzero lower integral of the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_lintegral_ne_zero
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hInt : (∫⁻ ω, X ω ∂ν) ≠ 0) :
    μ ≪ ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_not_ae_zero
    (μ := μ) (ν := ν) (X := X) hbranch hXrn hνtop
    (durrett2019_theorem_4_3_8_not_ae_eq_zero_of_lintegral_ne_zero
      (ν := ν) (X := X) hInt)

/--
Durrett 2019, Theorem 4.3.8 positive-branch eliminator specialized to the
likelihood-limit mass-one input produced by the L1 convergence part of the
textbook proof.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_lintegral_eq_one
    {Ω : Type*} [MeasurableSpace Ω] {μ ν : Measure Ω}
    {X : Ω -> ℝ≥0∞} (hbranch : μ ≪ ν ∨ μ ⟂ₘ ν)
    (hXrn :
      (fun ω => (X ω).toReal) =ᵐ[ν]
        fun ω => (μ.rnDeriv ν ω).toReal)
    (hνtop : ν {ω | X ω = ∞} = 0)
    (hInt : ∫⁻ ω, X ω ∂ν = 1) :
    μ ≪ ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_lintegral_ne_zero
      (μ := μ) (ν := ν) (X := X) hbranch hXrn hνtop ?_
  simp [hInt]

/--
Durrett 2019, Theorem 4.3.8 positive-product mass handoff: if the denominator
integrals of the finite cylinder likelihoods converge to the lower integral of
the limiting likelihood, then that limiting likelihood has mass one.
-/
theorem durrett2019_theorem_4_3_8_lintegral_eq_one_of_cylinderLikelihood_lintegral_tendsto
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hIntTendsto :
      Tendsto
        (fun n =>
          ∫⁻ x,
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x
              ∂Measure.infinitePi ν)
        atTop (𝓝 (∫⁻ x, X x ∂Measure.infinitePi ν))) :
    ∫⁻ x, X x ∂Measure.infinitePi ν = 1 := by
  have hconst :
      (fun n =>
          ∫⁻ x,
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x
              ∂Measure.infinitePi ν) =
        fun _ : ℕ => (1 : ℝ≥0∞) := by
    funext n
    exact
      durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
        (μ := μ) (ν := ν) (Iseq n) hq hμ
  have hlim :
      Tendsto (fun _ : ℕ => (1 : ℝ≥0∞)) atTop
        (𝓝 (∫⁻ x, X x ∂Measure.infinitePi ν)) := by
    simpa [hconst] using hIntTendsto
  exact tendsto_nhds_unique hlim tendsto_const_nhds

/--
Durrett 2019, Theorem 4.3.8 positive-product L1 bridge: real-valued L1
convergence of finite nonnegative likelihoods implies convergence of their
lower integrals.
-/
theorem durrett2019_theorem_4_3_8_lintegral_tendsto_of_toReal_L1
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {Xseq : ℕ -> Ω -> ℝ≥0∞} {X : Ω -> ℝ≥0∞}
    (hXseq : ∀ n, AEMeasurable (Xseq n) ν)
    (hXseqInt : ∀ n, ∫⁻ ω, Xseq n ω ∂ν ≠ ∞)
    (hXfinite : ∀ᵐ ω ∂ν, X ω ≠ ∞)
    (hXint : Integrable (fun ω => (X ω).toReal) ν)
    (hL1 :
      Tendsto
        (fun n => ∫⁻ ω, ‖(Xseq n ω).toReal - (X ω).toReal‖ₑ ∂ν)
        atTop (𝓝 0)) :
    Tendsto (fun n => ∫⁻ ω, Xseq n ω ∂ν)
      atTop (𝓝 (∫⁻ ω, X ω ∂ν)) := by
  have hseqIntReal :
      ∀ n, Integrable (fun ω => (Xseq n ω).toReal) ν := fun n =>
    integrable_toReal_of_lintegral_ne_top (hXseq n) (hXseqInt n)
  have hreal :
      Tendsto (fun n => ∫ ω, (Xseq n ω).toReal ∂ν)
        atTop (𝓝 (∫ ω, (X ω).toReal ∂ν)) := by
    refine
      tendsto_integral_of_L1 (μ := ν) (f := fun ω => (X ω).toReal)
        hXint ?_ hL1
    exact Eventually.of_forall hseqIntReal
  have hseq_eq :
      (fun n => ∫⁻ ω, Xseq n ω ∂ν) =
        fun n => ENNReal.ofReal (∫ ω, (Xseq n ω).toReal ∂ν) := by
    funext n
    have hfinite : ∀ᵐ ω ∂ν, Xseq n ω ≠ ∞ :=
      (ae_lt_top' (hXseq n) (hXseqInt n)).mono fun ω hω => hω.ne
    symm
    rw [ofReal_integral_eq_lintegral_ofReal (hseqIntReal n)
      (Eventually.of_forall fun ω => ENNReal.toReal_nonneg)]
    exact lintegral_congr_ae <|
      hfinite.mono fun ω hω => ENNReal.ofReal_toReal hω
  have htarget_eq :
      ∫⁻ ω, X ω ∂ν = ENNReal.ofReal (∫ ω, (X ω).toReal ∂ν) := by
    symm
    rw [ofReal_integral_eq_lintegral_ofReal hXint
      (Eventually.of_forall fun ω => ENNReal.toReal_nonneg)]
    exact lintegral_congr_ae <|
      hXfinite.mono fun ω hω => ENNReal.ofReal_toReal hω
  simpa [hseq_eq, htarget_eq] using ENNReal.tendsto_ofReal hreal

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: if the finite
likelihoods converge pointwise to the limiting likelihood and the pairwise
L1 distances have vanishing tail `liminf`, then the finite likelihoods
converge to the limit in L1.
-/
theorem durrett2019_theorem_4_3_8_toReal_L1_of_pairwise_liminf
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {Xseq : ℕ -> Ω -> ℝ≥0∞} {X : Ω -> ℝ≥0∞}
    (hpairMeas :
      ∀ n m,
        AEMeasurable
          (fun ω => ‖(Xseq n ω).toReal - (Xseq m ω).toReal‖ₑ) ν)
    (hlim :
      ∀ᵐ ω ∂ν,
        Tendsto (fun m => (Xseq m ω).toReal) atTop (𝓝 ((X ω).toReal)))
    (hpair :
      Tendsto
        (fun n =>
          Filter.liminf
            (fun m => ∫⁻ ω, ‖(Xseq n ω).toReal - (Xseq m ω).toReal‖ₑ ∂ν)
            atTop)
        atTop (𝓝 0)) :
    Tendsto (fun n => ∫⁻ ω, ‖(Xseq n ω).toReal - (X ω).toReal‖ₑ ∂ν)
      atTop (𝓝 0) := by
  have hle :
      ∀ n,
        ∫⁻ ω, ‖(Xseq n ω).toReal - (X ω).toReal‖ₑ ∂ν ≤
          Filter.liminf
            (fun m => ∫⁻ ω, ‖(Xseq n ω).toReal - (Xseq m ω).toReal‖ₑ ∂ν)
            atTop := by
    intro n
    have hlim_norm :
        ∀ᵐ ω ∂ν,
          Tendsto
            (fun m => ‖(Xseq n ω).toReal - (Xseq m ω).toReal‖ₑ) atTop
            (𝓝 ‖(Xseq n ω).toReal - (X ω).toReal‖ₑ) := by
      filter_upwards [hlim] with ω hω
      exact (tendsto_const_nhds.sub hω).enorm
    calc
      ∫⁻ ω, ‖(Xseq n ω).toReal - (X ω).toReal‖ₑ ∂ν
          = ∫⁻ ω,
              Filter.liminf
                (fun m => ‖(Xseq n ω).toReal - (Xseq m ω).toReal‖ₑ) atTop ∂ν := by
              apply lintegral_congr_ae
              filter_upwards [hlim_norm] with ω hω
              exact hω.liminf_eq.symm
      _ ≤ Filter.liminf
            (fun m => ∫⁻ ω, ‖(Xseq n ω).toReal - (Xseq m ω).toReal‖ₑ ∂ν)
            atTop := by
          exact MeasureTheory.lintegral_liminf_le' fun m => hpairMeas n m
  exact
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hpair
      (fun _ => zero_le) hle

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: the textbook
Hellinger-tail L1 bound.  If `tail n` is the Hellinger affinity product after
time `n`, the proof bounds the L1 tail by `sqrt (8 * (1 - tail n))`.
-/
noncomputable def durrett2019_theorem_4_3_8_hellingerTailL1Bound
    (tail : ℕ -> ℝ≥0∞) (n : ℕ) : ℝ≥0∞ :=
  (8 * (1 - tail n)) ^ ((1 : ℝ) / 2)

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: pointwise
square-root factorization of the finite likelihood L1 distance.  This is the
algebraic identity `|u - v| = |sqrt u - sqrt v| * (sqrt u + sqrt v)`,
written in the `ℝ≥0∞` shape consumed by the Hellinger Cauchy-Schwarz bridge.
-/
theorem durrett2019_theorem_4_3_8_toReal_likelihood_sqrt_factorization
    (a b : ℝ≥0∞) (ha : a ≠ ∞) (hb : b ≠ ∞) :
    ‖a.toReal - b.toReal‖ₑ ≤
      (a ^ ((1 : ℝ) / 2) + b ^ ((1 : ℝ) / 2)) *
        ‖(a ^ ((1 : ℝ) / 2)).toReal -
          (b ^ ((1 : ℝ) / 2)).toReal‖ₑ := by
  let A : ℝ := (a ^ ((1 : ℝ) / 2)).toReal
  let B : ℝ := (b ^ ((1 : ℝ) / 2)).toReal
  have ha_half_ne_top : a ^ ((1 : ℝ) / 2) ≠ ∞ :=
    ENNReal.rpow_ne_top_of_nonneg (by norm_num : 0 ≤ ((1 : ℝ) / 2)) ha
  have hb_half_ne_top : b ^ ((1 : ℝ) / 2) ≠ ∞ :=
    ENNReal.rpow_ne_top_of_nonneg (by norm_num : 0 ≤ ((1 : ℝ) / 2)) hb
  have hsum_ne_top :
      a ^ ((1 : ℝ) / 2) + b ^ ((1 : ℝ) / 2) ≠ ∞ := by
    rw [ENNReal.add_ne_top]
    exact ⟨ha_half_ne_top, hb_half_ne_top⟩
  have hA_sq : A ^ 2 = a.toReal := by
    dsimp [A]
    rw [← ENNReal.toReal_rpow]
    rw [← Real.sqrt_eq_rpow]
    exact Real.sq_sqrt ENNReal.toReal_nonneg
  have hB_sq : B ^ 2 = b.toReal := by
    dsimp [B]
    rw [← ENNReal.toReal_rpow]
    rw [← Real.sqrt_eq_rpow]
    exact Real.sq_sqrt ENNReal.toReal_nonneg
  have hsum_toReal :
      (a ^ ((1 : ℝ) / 2) + b ^ ((1 : ℝ) / 2)).toReal = A + B := by
    rw [ENNReal.toReal_add ha_half_ne_top hb_half_ne_top]
  have hnonneg_sum : 0 ≤ A + B := by
    positivity
  apply le_of_eq
  calc
    ‖a.toReal - b.toReal‖ₑ
        = ENNReal.ofReal |a.toReal - b.toReal| := by
          rw [← ofReal_norm_eq_enorm (a.toReal - b.toReal), Real.norm_eq_abs]
    _ = ENNReal.ofReal ((A + B) * |A - B|) := by
          congr 1
          rw [← hA_sq, ← hB_sq, sq_sub_sq, abs_mul]
          rw [abs_of_nonneg hnonneg_sum]
    _ = ENNReal.ofReal (A + B) * ENNReal.ofReal |A - B| := by
          rw [ENNReal.ofReal_mul hnonneg_sum]
    _ = (a ^ ((1 : ℝ) / 2) + b ^ ((1 : ℝ) / 2)) *
          ‖(a ^ ((1 : ℝ) / 2)).toReal -
            (b ^ ((1 : ℝ) / 2)).toReal‖ₑ := by
          rw [← hsum_toReal, ENNReal.ofReal_toReal hsum_ne_top]
          rw [← ofReal_norm_eq_enorm (A - B), Real.norm_eq_abs]

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: a source-shaped
Cauchy-Schwarz bridge for the square-root likelihood argument.  A pointwise
factorization of an L1 distance by two nonnegative factors, together with a
product bound on their square integrals, gives the square-root L1 bound.
-/
theorem durrett2019_theorem_4_3_8_lintegral_le_sqrt_of_cauchySchwarz_product_bound
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {D F G : Ω -> ℝ≥0∞} {C : ℝ≥0∞}
    (hD : ∀ᵐ ω ∂ν, D ω ≤ F ω * G ω)
    (hF : AEMeasurable F ν) (hG : AEMeasurable G ν)
    (hprod :
      (∫⁻ ω, F ω ^ (2 : ℝ) ∂ν) *
          (∫⁻ ω, G ω ^ (2 : ℝ) ∂ν) ≤ C) :
    ∫⁻ ω, D ω ∂ν ≤ C ^ ((1 : ℝ) / 2) := by
  have hholder :
      ∫⁻ ω, F ω * G ω ∂ν ≤
        (∫⁻ ω, F ω ^ (2 : ℝ) ∂ν) ^ ((1 : ℝ) / 2) *
          (∫⁻ ω, G ω ^ (2 : ℝ) ∂ν) ^ ((1 : ℝ) / 2) := by
    simpa [Pi.mul_apply] using
      (ENNReal.lintegral_mul_le_Lp_mul_Lq ν Real.HolderConjugate.two_two
        hF hG)
  have hsqrt :
      (∫⁻ ω, F ω ^ (2 : ℝ) ∂ν) ^ ((1 : ℝ) / 2) *
          (∫⁻ ω, G ω ^ (2 : ℝ) ∂ν) ^ ((1 : ℝ) / 2) ≤
        C ^ ((1 : ℝ) / 2) := by
    rw [← ENNReal.mul_rpow_of_nonneg
      (∫⁻ ω, F ω ^ (2 : ℝ) ∂ν)
      (∫⁻ ω, G ω ^ (2 : ℝ) ∂ν)
      (by norm_num : 0 ≤ ((1 : ℝ) / 2))]
    exact ENNReal.rpow_le_rpow hprod (by norm_num : 0 ≤ ((1 : ℝ) / 2))
  exact (lintegral_mono_ae hD).trans (hholder.trans hsqrt)

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: the textbook
square-root estimate.  The factors corresponding to `Y_m + Y_n` and
`Y_m - Y_n` have square integrals bounded by `4` and `2 * (1 - tail n)`,
so Cauchy-Schwarz gives `sqrt (8 * (1 - tail n))`.
-/
theorem durrett2019_theorem_4_3_8_lintegral_le_hellingerTailL1Bound_of_square_bounds
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {D F G : Ω -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} (n : ℕ)
    (hD : ∀ᵐ ω ∂ν, D ω ≤ F ω * G ω)
    (hF : AEMeasurable F ν) (hG : AEMeasurable G ν)
    (hF_sq : ∫⁻ ω, F ω ^ (2 : ℝ) ∂ν ≤ (4 : ℝ≥0∞))
    (hG_sq : ∫⁻ ω, G ω ^ (2 : ℝ) ∂ν ≤ (2 : ℝ≥0∞) * (1 - tail n)) :
    ∫⁻ ω, D ω ∂ν ≤
      durrett2019_theorem_4_3_8_hellingerTailL1Bound tail n := by
  refine
    durrett2019_theorem_4_3_8_lintegral_le_sqrt_of_cauchySchwarz_product_bound
      (ν := ν) (D := D) (F := F) (G := G)
      (C := (8 : ℝ≥0∞) * (1 - tail n)) hD hF hG ?_
  calc
    (∫⁻ ω, F ω ^ (2 : ℝ) ∂ν) *
        (∫⁻ ω, G ω ^ (2 : ℝ) ∂ν)
        ≤ (4 : ℝ≥0∞) * ((2 : ℝ≥0∞) * (1 - tail n)) :=
          mul_le_mul' hF_sq hG_sq
    _ = (8 : ℝ≥0∞) * (1 - tail n) := by
          rw [← mul_assoc]
          norm_num

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: an eventual
version of the square-root Cauchy-Schwarz estimate, shaped exactly as the
compiled Hellinger-tail consumer expects.
-/
theorem durrett2019_theorem_4_3_8_eventual_hellingerTail_bound_of_squareRoot_cauchySchwarz
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {D F G : ℕ -> ℕ -> Ω -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞}
    (hD :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ ω ∂ν, D n m ω ≤ F n m ω * G n m ω)
    (hF : ∀ n m, AEMeasurable (F n m) ν)
    (hG : ∀ n m, AEMeasurable (G n m) ν)
    (hF_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ ω, F n m ω ^ (2 : ℝ) ∂ν ≤ (4 : ℝ≥0∞))
    (hG_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ ω, G n m ω ^ (2 : ℝ) ∂ν ≤
          (2 : ℝ≥0∞) * (1 - tail n)) :
    ∀ n, ∀ᶠ m in atTop,
      ∫⁻ ω, D n m ω ∂ν ≤
        durrett2019_theorem_4_3_8_hellingerTailL1Bound tail n := by
  intro n
  filter_upwards [hD n, hF_sq n, hG_sq n] with m hDnm hFnm hGnm
  exact
    durrett2019_theorem_4_3_8_lintegral_le_hellingerTailL1Bound_of_square_bounds
      (ν := ν) (D := D n m) (F := F n m) (G := G n m)
      (tail := tail) n hDnm (hF n m) (hG n m) hFnm hGnm

/--
Durrett 2019, Theorem 4.3.8 positive-product support: if the finite prefix
Hellinger products converge to a positive finite product `P`, then the
normalized product tail `P / prefix n` tends to one.  This isolates the
analytic tail step used by the positive infinite-product branch.
-/
theorem durrett2019_theorem_4_3_8_hellingerTail_tendsto_one_of_prefix_tendsto
    {pref tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hpref : Tendsto pref atTop (𝓝 P))
    (htail_eq : ∀ᶠ n in atTop, tail n = P / pref n) :
    Tendsto tail atTop (𝓝 1) := by
  have hinv :
      Tendsto (fun n => (pref n)⁻¹) atTop (𝓝 P⁻¹) :=
    tendsto_inv_iff.2 hpref
  have hratio :
      Tendsto (fun n => P / pref n) atTop (𝓝 (P / P)) := by
    simpa [div_eq_mul_inv] using
      (ENNReal.Tendsto.const_mul (a := P) hinv (Or.inr hPtop))
  have hratio_one :
      Tendsto (fun n => P / pref n) atTop (𝓝 1) := by
    simpa [ENNReal.div_self hP0 hPtop] using hratio
  exact hratio_one.congr' (htail_eq.mono fun n hn => hn.symm)

/--
Durrett 2019, Theorem 4.3.8 positive-product support: a `HasProd`
statement for the one-coordinate Hellinger affinities supplies the prefix
convergence required by the normalized tail bridge.
-/
theorem durrett2019_theorem_4_3_8_hellingerTail_tendsto_one_of_hasProd
    {h tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod : HasProd h P)
    (htail_eq :
      ∀ᶠ n in atTop, tail n = P / (∏ i ∈ Finset.range n, h i)) :
    Tendsto tail atTop (𝓝 1) := by
  exact
    durrett2019_theorem_4_3_8_hellingerTail_tendsto_one_of_prefix_tendsto
      (pref := fun n => ∏ i ∈ Finset.range n, h i)
      (tail := tail) (P := P) hP0 hPtop hprod.tendsto_prod_nat htail_eq

/--
Durrett 2019, Theorem 4.3.8 positive-product support: the same tail
convergence bridge phrased with the actual infinite product value `∏' i, h i`.
-/
theorem durrett2019_theorem_4_3_8_hellingerTail_tendsto_one_of_multipliable
    {h tail : ℕ -> ℝ≥0∞}
    (hmult : Multipliable h)
    (hP0 : (∏' i, h i) ≠ 0) (hPtop : (∏' i, h i) ≠ ∞)
    (htail_eq :
      ∀ᶠ n in atTop, tail n = (∏' i, h i) / (∏ i ∈ Finset.range n, h i)) :
    Tendsto tail atTop (𝓝 1) := by
  exact
    durrett2019_theorem_4_3_8_hellingerTail_tendsto_one_of_hasProd
      (h := h) (tail := tail) (P := ∏' i, h i) hP0 hPtop hmult.hasProd
      htail_eq

/--
Durrett 2019, Theorem 4.3.8 positive-product support: if all one-coordinate
Hellinger affinities are at most one, then every finite prefix product
dominates their `HasProd` limit.
-/
theorem durrett2019_theorem_4_3_8_prefixProduct_limit_le_prefix_of_hasProd_le_one
    {h : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hprod : HasProd h P) (hle_one : ∀ i, h i ≤ 1) :
    ∀ n, P ≤ ∏ i ∈ Finset.range n, h i := by
  intro n
  refine le_of_tendsto hprod.tendsto_prod_nat ?_
  filter_upwards [eventually_ge_atTop n] with m hnm
  exact
    Finset.prod_le_prod_of_subset_of_le_one
      (Finset.range_subset_range.2 hnm)
      (fun _ _ => bot_le)
      (fun i _ _ => hle_one i)

/--
Durrett 2019, Theorem 4.3.8 positive-product support: the positive infinite
product branch makes every finite prefix product nonzero.
-/
theorem durrett2019_theorem_4_3_8_prefixProduct_ne_zero_of_positive_limit
    {h : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hP0 : P ≠ 0)
    (hP_le_prefix : ∀ n, P ≤ ∏ i ∈ Finset.range n, h i) :
    ∀ n, (∏ i ∈ Finset.range n, h i) ≠ 0 := by
  intro n hzero
  have hP_le_zero : P ≤ 0 := by
    simpa [hzero] using hP_le_prefix n
  exact hP0 (le_antisymm hP_le_zero bot_le)

/--
Durrett 2019, Theorem 4.3.8 positive-product support: finite prefix products
of one-coordinate Hellinger affinities bounded by one are finite.
-/
theorem durrett2019_theorem_4_3_8_prefixProduct_ne_top_of_le_one
    {h : ℕ -> ℝ≥0∞} (hle_one : ∀ i, h i ≤ 1) :
    ∀ n, (∏ i ∈ Finset.range n, h i) ≠ ∞ := by
  intro n
  exact
    ne_top_of_le_ne_top (by norm_num : (1 : ℝ≥0∞) ≠ ∞)
      (Finset.prod_le_one (fun _ _ => bot_le) (fun i _ => hle_one i))

/--
Durrett 2019, Theorem 4.3.8 positive-product support: if a normalized
infinite Hellinger tail is `P / prefix n`, and `P` is below every finite
prefix, then it is bounded by every later finite tail product.
-/
theorem durrett2019_theorem_4_3_8_range_tailProduct_lower_bound_of_prefix_lower_bound
    {h tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hP_le_prefix : ∀ m, P ≤ ∏ i ∈ Finset.range m, h i)
    (hprefix_ne_zero : ∀ n, (∏ i ∈ Finset.range n, h i) ≠ 0)
    (hprefix_ne_top : ∀ n, (∏ i ∈ Finset.range n, h i) ≠ ∞)
    (htail_eq :
      ∀ n, tail n = P / (∏ i ∈ Finset.range n, h i)) :
    ∀ n, ∀ᶠ m in atTop,
      tail n ≤ (Finset.range m \ Finset.range n).prod h := by
  intro n
  filter_upwards [eventually_ge_atTop n] with m hnm
  rw [htail_eq n]
  have hsubset : Finset.range n ⊆ Finset.range m :=
    Finset.range_subset_range.2 hnm
  have hmul :
      P ≤ (Finset.range m \ Finset.range n).prod h *
          (∏ i ∈ Finset.range n, h i) := by
    rw [Finset.prod_sdiff hsubset]
    exact hP_le_prefix m
  exact
    (ENNReal.div_le_iff_le_mul
      (Or.inl (hprefix_ne_zero n)) (Or.inl (hprefix_ne_top n))).2 hmul

/--
Durrett 2019, Theorem 4.3.8 positive-product support: a positive `HasProd`
limit and coordinate affinities bounded by one automatically supply the finite
tail-product lower bound for the normalized Hellinger tail.
-/
theorem durrett2019_theorem_4_3_8_range_tailProduct_lower_bound_of_hasProd_le_one
    {h tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hP0 : P ≠ 0)
    (hprod : HasProd h P) (hle_one : ∀ i, h i ≤ 1)
    (htail_eq :
      ∀ n, tail n = P / (∏ i ∈ Finset.range n, h i)) :
    ∀ n, ∀ᶠ m in atTop,
      tail n ≤ (Finset.range m \ Finset.range n).prod h := by
  have hP_le_prefix :
      ∀ n, P ≤ ∏ i ∈ Finset.range n, h i :=
    durrett2019_theorem_4_3_8_prefixProduct_limit_le_prefix_of_hasProd_le_one
      hprod hle_one
  exact
    durrett2019_theorem_4_3_8_range_tailProduct_lower_bound_of_prefix_lower_bound
      (h := h) (tail := tail) (P := P) hP_le_prefix
      (durrett2019_theorem_4_3_8_prefixProduct_ne_zero_of_positive_limit hP0
        hP_le_prefix)
      (durrett2019_theorem_4_3_8_prefixProduct_ne_top_of_le_one hle_one)
      htail_eq

/--
Durrett 2019, Theorem 4.3.8 positive-product support: the normalized
Hellinger tail `P / prefix n` is automatically bounded by one when the
coordinate affinities are at most one and the infinite product is positive.
-/
theorem durrett2019_theorem_4_3_8_hellingerTail_le_one_of_hasProd_le_one
    {h tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hP0 : P ≠ 0)
    (hprod : HasProd h P) (hle_one : ∀ i, h i ≤ 1)
    (htail_eq :
      ∀ n, tail n = P / (∏ i ∈ Finset.range n, h i)) :
    ∀ n, tail n ≤ 1 := by
  have hP_le_prefix :
      ∀ n, P ≤ ∏ i ∈ Finset.range n, h i :=
    durrett2019_theorem_4_3_8_prefixProduct_limit_le_prefix_of_hasProd_le_one
      hprod hle_one
  have hprefix_ne_zero :
      ∀ n, (∏ i ∈ Finset.range n, h i) ≠ 0 :=
    durrett2019_theorem_4_3_8_prefixProduct_ne_zero_of_positive_limit hP0
      hP_le_prefix
  have hprefix_ne_top :
      ∀ n, (∏ i ∈ Finset.range n, h i) ≠ ∞ :=
    durrett2019_theorem_4_3_8_prefixProduct_ne_top_of_le_one hle_one
  intro n
  rw [htail_eq n]
  exact
    (ENNReal.div_le_iff_le_mul
      (Or.inl (hprefix_ne_zero n)) (Or.inl (hprefix_ne_top n))).2
      (by simpa [one_mul] using hP_le_prefix n)

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: if the Hellinger
tail affinities tend to one, then the textbook Hellinger-tail L1 bound tends
to zero.
-/
theorem durrett2019_theorem_4_3_8_hellingerTailL1Bound_tendsto_zero
    {tail : ℕ -> ℝ≥0∞}
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1)) :
    Tendsto (durrett2019_theorem_4_3_8_hellingerTailL1Bound tail) atTop
      (𝓝 0) := by
  have hsub :
      Tendsto (fun n => (1 : ℝ≥0∞) - tail n) atTop (𝓝 0) := by
    exact
      (ENNReal.tendsto_const_sub_nhds_zero_iff ENNReal.one_ne_top htail_le).2
        htail
  have hmul :
      Tendsto (fun n => (8 : ℝ≥0∞) * (1 - tail n)) atTop (𝓝 0) := by
    simpa using
      (ENNReal.Tendsto.const_mul (a := (8 : ℝ≥0∞)) hsub
        (Or.inr (by norm_num : (8 : ℝ≥0∞) ≠ ∞)))
  have hrpow :
      Tendsto
        (fun n => ((8 : ℝ≥0∞) * (1 - tail n)) ^ ((1 : ℝ) / 2))
        atTop (𝓝 (0 ^ ((1 : ℝ) / 2) : ℝ≥0∞)) :=
    (ENNReal.continuous_rpow_const.tendsto _).comp hmul
  change
    Tendsto
      (fun n => ((8 : ℝ≥0∞) * (1 - tail n)) ^ ((1 : ℝ) / 2))
      atTop (𝓝 0)
  simpa using hrpow

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: any eventual
tail bound tending to zero implies the pairwise `liminf` L1 condition consumed
by the positive branch.
-/
theorem durrett2019_theorem_4_3_8_pairwise_liminf_of_eventual_lintegral_le
    {D : ℕ -> ℕ -> ℝ≥0∞} {B : ℕ -> ℝ≥0∞}
    (hB : Tendsto B atTop (𝓝 0))
    (hbound : ∀ n, ∀ᶠ m in atTop, D n m ≤ B n) :
    Tendsto (fun n => Filter.liminf (D n) atTop) atTop (𝓝 0) := by
  have hle :
      ∀ n, Filter.liminf (D n) atTop ≤ B n := by
    intro n
    exact Filter.liminf_le_of_frequently_le' (hbound n).frequently
  exact
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hB
      (fun _ => zero_le) hle

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: if pairwise L1
tails are eventually bounded by the Hellinger-tail expression and the
Hellinger tail affinities tend to one, then the pairwise `liminf` condition
holds.
-/
theorem durrett2019_theorem_4_3_8_pairwise_liminf_of_hellingerTail_bound
    {D : ℕ -> ℕ -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞}
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hbound :
      ∀ n, ∀ᶠ m in atTop,
        D n m ≤ durrett2019_theorem_4_3_8_hellingerTailL1Bound tail n) :
    Tendsto (fun n => Filter.liminf (D n) atTop) atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_pairwise_liminf_of_eventual_lintegral_le
      (D := D)
      (B := durrett2019_theorem_4_3_8_hellingerTailL1Bound tail)
      ?_ ?_
  · exact
      durrett2019_theorem_4_3_8_hellingerTailL1Bound_tendsto_zero
        htail_le htail
  · exact hbound

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder handoff: L1 convergence
of the finite cylinder likelihoods to the limiting likelihood supplies the
finite-cylinder integral-convergence input used by the mass-one bridge.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_tendsto_of_toReal_L1
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hXfinite : ∀ᵐ x ∂Measure.infinitePi ν, X x ≠ ∞)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hL1 :
      Tendsto
        (fun n =>
          ∫⁻ x,
            ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
              (X x).toReal‖ₑ ∂Measure.infinitePi ν)
        atTop (𝓝 0)) :
    Tendsto
      (fun n =>
        ∫⁻ x,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x
            ∂Measure.infinitePi ν)
      atTop (𝓝 (∫⁻ x, X x ∂Measure.infinitePi ν)) := by
  refine
    durrett2019_theorem_4_3_8_lintegral_tendsto_of_toReal_L1
      (ν := Measure.infinitePi ν)
      (Xseq := fun n x => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
      (X := X)
      (fun n => (durrett2019_theorem_4_3_8_cylinderLikelihood_measurable (Iseq n) hq).aemeasurable)
      ?_ hXfinite hXint hL1
  intro n
  rw [durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
    (μ := μ) (ν := ν) (Iseq n) hq hμ]
  simp

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff:
pairwise L1 tail control of finite cylinder likelihoods plus pointwise
convergence to the limiting likelihood gives the L1 convergence input consumed
by the positive branch.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_toReal_L1_of_pairwise_liminf
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i)) {X : (ι -> S) -> ℝ≥0∞}
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal)
          atTop (𝓝 ((X x).toReal)))
    (hpair :
      Tendsto
        (fun n =>
          Filter.liminf
            (fun m =>
              ∫⁻ x,
                ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                  (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
                ∂Measure.infinitePi ν)
            atTop)
        atTop (𝓝 0)) :
    Tendsto
      (fun n =>
        ∫⁻ x,
          ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
            (X x).toReal‖ₑ ∂Measure.infinitePi ν)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_toReal_L1_of_pairwise_liminf
      (ν := Measure.infinitePi ν)
      (Xseq := fun n x => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
      (X := X) ?_ hlim hpair
  intro n m
  exact
    (((durrett2019_theorem_4_3_8_cylinderLikelihood_measurable (Iseq n) hq).ennreal_toReal.sub
        (durrett2019_theorem_4_3_8_cylinderLikelihood_measurable (Iseq m) hq).ennreal_toReal).enorm).aemeasurable

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff:
Hellinger-tail L1 bounds for finite cylinder likelihoods imply the pairwise
`liminf` hypothesis consumed by the L1 convergence bridge.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_hellingerTail_bound
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (tail : ℕ -> ℝ≥0∞)
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hbound :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x,
          ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
          ∂Measure.infinitePi ν ≤
            durrett2019_theorem_4_3_8_hellingerTailL1Bound tail n) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  exact
    durrett2019_theorem_4_3_8_pairwise_liminf_of_hellingerTail_bound
      (D := fun n m =>
        ∫⁻ x,
          ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
          ∂Measure.infinitePi ν)
      (tail := tail) htail_le htail hbound

/--
Durrett 2019, Theorem 4.3.8 positive-product Cauchy support: the abstract
square-root Cauchy-Schwarz estimates imply the pairwise `liminf` condition
consumed by the L1 convergence bridge.
-/
theorem durrett2019_theorem_4_3_8_pairwise_liminf_of_squareRoot_cauchySchwarz
    {Ω : Type*} [MeasurableSpace Ω] {ν : Measure Ω}
    {D F G : ℕ -> ℕ -> Ω -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞}
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hD :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ ω ∂ν, D n m ω ≤ F n m ω * G n m ω)
    (hF : ∀ n m, AEMeasurable (F n m) ν)
    (hG : ∀ n m, AEMeasurable (G n m) ν)
    (hF_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ ω, F n m ω ^ (2 : ℝ) ∂ν ≤ (4 : ℝ≥0∞))
    (hG_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ ω, G n m ω ^ (2 : ℝ) ∂ν ≤
          (2 : ℝ≥0∞) * (1 - tail n)) :
    Tendsto
      (fun n =>
        Filter.liminf (fun m => ∫⁻ ω, D n m ω ∂ν) atTop)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_pairwise_liminf_of_hellingerTail_bound
      (D := fun n m => ∫⁻ ω, D n m ω ∂ν)
      (tail := tail) htail_le htail ?_
  exact
    durrett2019_theorem_4_3_8_eventual_hellingerTail_bound_of_squareRoot_cauchySchwarz
      (ν := ν) (D := D) (F := F) (G := G) hD hF hG hF_sq hG_sq

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff:
source square-root estimates for finite cylinder likelihoods imply the
pairwise `liminf` hypothesis consumed by the L1 convergence bridge.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_squareRoot_cauchySchwarz
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {F G : ℕ -> ℕ -> (ι -> S) -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞}
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hD :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ ≤
              F n m x * G n m x)
    (hF : ∀ n m, AEMeasurable (F n m) (Measure.infinitePi ν))
    (hG : ∀ n m, AEMeasurable (G n m) (Measure.infinitePi ν))
    (hF_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x, F n m x ^ (2 : ℝ) ∂Measure.infinitePi ν ≤ (4 : ℝ≥0∞))
    (hG_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x, G n m x ^ (2 : ℝ) ∂Measure.infinitePi ν ≤
          (2 : ℝ≥0∞) * (1 - tail n)) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  exact
    durrett2019_theorem_4_3_8_pairwise_liminf_of_squareRoot_cauchySchwarz
      (ν := Measure.infinitePi ν)
      (D := fun n m x =>
        ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ)
      (F := F) (G := G) (tail := tail)
      htail_le htail hD hF hG hF_sq hG_sq

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy support: the
pointwise square-root factorization specialized to finite cylinder likelihoods.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_squareRoot_factorization_ae
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞) :
    ∀ n, ∀ᶠ m in atTop,
      ∀ᵐ x ∂Measure.infinitePi ν,
        ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ ≤
            ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2) +
              (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)) *
              ‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                    ((1 : ℝ) / 2)).toReal -
                ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                    ((1 : ℝ) / 2)).toReal‖ₑ := by
  intro n
  filter_upwards [hfinite n] with m hm
  exact hm.mono fun x hx =>
    durrett2019_theorem_4_3_8_toReal_likelihood_sqrt_factorization
      (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x)
      (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x)
      hx.1 hx.2

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff with the
textbook square-root factors fixed concretely as `sqrt X_n + sqrt X_m` and
`sqrt X_n - sqrt X_m`.  The remaining hypotheses are exactly the two
square-integral estimates that the product Hellinger computation supplies.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_concrete_squareRoot_cauchySchwarz
    {ι S : Type*} [MeasurableSpace S]
    {ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {tail : ℕ -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞)
    (hF_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x,
          (((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2) +
              (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)) ^ (2 : ℝ))
          ∂Measure.infinitePi ν ≤ (4 : ℝ≥0∞))
    (hG_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x,
          (‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2)).toReal -
              ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)).toReal‖ₑ ^ (2 : ℝ))
          ∂Measure.infinitePi ν ≤ (2 : ℝ≥0∞) * (1 - tail n)) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_squareRoot_cauchySchwarz
      (ν := ν) (Iseq := Iseq) (q := q)
      (F := fun n m x =>
        (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
            ((1 : ℝ) / 2) +
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
            ((1 : ℝ) / 2))
      (G := fun n m x =>
        ‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
              ((1 : ℝ) / 2)).toReal -
          ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
              ((1 : ℝ) / 2)).toReal‖ₑ)
      (tail := tail) htail_le htail ?_ ?_ ?_ hF_sq hG_sq
  · exact
      durrett2019_theorem_4_3_8_cylinderLikelihood_squareRoot_factorization_ae
        (ν := ν) (Iseq := Iseq) (q := q) hfinite
  · intro n m
    exact
      ((durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable
            (Iseq n) hq).add
        (durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable
            (Iseq m) hq)).aemeasurable
  · intro n m
    exact
      (((durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable
            (Iseq n) hq).ennreal_toReal.sub
          (durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable
            (Iseq m) hq).ennreal_toReal).enorm).aemeasurable

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy support: the
square integral of the textbook factor `sqrt X_n + sqrt X_m` is bounded by
`4`.  This uses only the mass-one identities for the two finite cylinder
likelihoods and the elementary inequality `(u + v)^2 <= 2 * (u^2 + v^2)`.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_sqrtSum_sq_lintegral_le_four
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i)) (n m : ℕ) :
    ∫⁻ x,
      (((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
            ((1 : ℝ) / 2) +
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
            ((1 : ℝ) / 2)) ^ (2 : ℝ))
      ∂Measure.infinitePi ν ≤ (4 : ℝ≥0∞) := by
  let Xn : (ι -> S) -> ℝ≥0∞ := fun x =>
    (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^ ((1 : ℝ) / 2)
  let Xm : (ι -> S) -> ℝ≥0∞ := fun x =>
    (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^ ((1 : ℝ) / 2)
  have hXn_meas : Measurable Xn :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable (Iseq n) hq
  have hXm_meas : Measurable Xm :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable (Iseq m) hq
  have hXn_sq : (fun x => Xn x ^ (2 : ℝ)) =
      fun x => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x := by
    funext x
    dsimp [Xn]
    simpa [one_div] using
      (ENNReal.rpow_inv_rpow (by norm_num : (2 : ℝ) ≠ 0)
        (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x))
  have hXm_sq : (fun x => Xm x ^ (2 : ℝ)) =
      fun x => durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x := by
    funext x
    dsimp [Xm]
    simpa [one_div] using
      (ENNReal.rpow_inv_rpow (by norm_num : (2 : ℝ) ≠ 0)
        (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x))
  have hXn_int : ∫⁻ x, Xn x ^ (2 : ℝ) ∂Measure.infinitePi ν = 1 := by
    rw [hXn_sq]
    exact durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
      (μ := μ) (ν := ν) (Iseq n) hq hμ
  have hXm_int : ∫⁻ x, Xm x ^ (2 : ℝ) ∂Measure.infinitePi ν = 1 := by
    rw [hXm_sq]
    exact durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
      (μ := μ) (ν := ν) (Iseq m) hq hμ
  calc
    ∫⁻ x, (Xn x + Xm x) ^ (2 : ℝ) ∂Measure.infinitePi ν
        ≤ ∫⁻ x, (2 : ℝ≥0∞) * (Xn x ^ (2 : ℝ) + Xm x ^ (2 : ℝ))
            ∂Measure.infinitePi ν := by
          exact lintegral_mono fun x => by
            calc
              (Xn x + Xm x) ^ (2 : ℝ) ≤
                  (2 : ℝ≥0∞) ^ ((2 : ℝ) - 1) *
                    (Xn x ^ (2 : ℝ) + Xm x ^ (2 : ℝ)) :=
                ENNReal.rpow_add_le_mul_rpow_add_rpow (Xn x) (Xm x)
                  (by norm_num : (1 : ℝ) ≤ (2 : ℝ))
              _ = (2 : ℝ≥0∞) * (Xn x ^ (2 : ℝ) + Xm x ^ (2 : ℝ)) := by
                norm_num
    _ = (2 : ℝ≥0∞) *
          ∫⁻ x, (Xn x ^ (2 : ℝ) + Xm x ^ (2 : ℝ)) ∂Measure.infinitePi ν := by
          rw [lintegral_const_mul' _ _ (by norm_num : (2 : ℝ≥0∞) ≠ ∞)]
    _ = (2 : ℝ≥0∞) *
          ((∫⁻ x, Xn x ^ (2 : ℝ) ∂Measure.infinitePi ν) +
            ∫⁻ x, Xm x ^ (2 : ℝ) ∂Measure.infinitePi ν) := by
          rw [lintegral_add_left (hXn_meas.pow_const (2 : ℝ))]
    _ = (4 : ℝ≥0∞) := by
          rw [hXn_int, hXm_int]
          norm_num

/--
Durrett 2019, Theorem 4.3.8 positive-product Hellinger support: the scalar
Pythagorean identity behind the finite cylinder overlap estimate.  For finite
`a` and `b`, the square-root difference plus twice the square-root overlap is
exactly `a + b`.
-/
theorem durrett2019_theorem_4_3_8_sqrtDiff_sq_add_two_mul_eq_add
    {a b : ℝ≥0∞} (ha : a ≠ ∞) (hb : b ≠ ∞) :
    (‖(a ^ ((1 : ℝ) / 2)).toReal -
        (b ^ ((1 : ℝ) / 2)).toReal‖ₑ ^ (2 : ℝ)) +
      (2 : ℝ≥0∞) *
        (a ^ ((1 : ℝ) / 2) * b ^ ((1 : ℝ) / 2)) = a + b := by
  let A : ℝ := (a ^ ((1 : ℝ) / 2)).toReal
  let B : ℝ := (b ^ ((1 : ℝ) / 2)).toReal
  have hA_nonneg : 0 ≤ A := by
    dsimp [A]
    exact ENNReal.toReal_nonneg
  have hB_nonneg : 0 ≤ B := by
    dsimp [B]
    exact ENNReal.toReal_nonneg
  have ha_half_ne_top : a ^ ((1 : ℝ) / 2) ≠ ∞ :=
    ENNReal.rpow_ne_top_of_nonneg (by norm_num : 0 ≤ ((1 : ℝ) / 2)) ha
  have hb_half_ne_top : b ^ ((1 : ℝ) / 2) ≠ ∞ :=
    ENNReal.rpow_ne_top_of_nonneg (by norm_num : 0 ≤ ((1 : ℝ) / 2)) hb
  have hA_sq : A ^ 2 = a.toReal := by
    dsimp [A]
    rw [← ENNReal.toReal_rpow]
    rw [← Real.sqrt_eq_rpow]
    exact Real.sq_sqrt ENNReal.toReal_nonneg
  have hB_sq : B ^ 2 = b.toReal := by
    dsimp [B]
    rw [← ENNReal.toReal_rpow]
    rw [← Real.sqrt_eq_rpow]
    exact Real.sq_sqrt ENNReal.toReal_nonneg
  have hA_sq_ofReal : ENNReal.ofReal (A ^ 2) = a := by
    rw [hA_sq, ENNReal.ofReal_toReal ha]
  have hB_sq_ofReal : ENNReal.ofReal (B ^ 2) = b := by
    rw [hB_sq, ENNReal.ofReal_toReal hb]
  have hdiff_sq :
      ‖A - B‖ₑ ^ (2 : ℝ) = ENNReal.ofReal ((A - B) ^ 2) := by
    rw [ENNReal.rpow_two]
    rw [← ofReal_norm_eq_enorm (A - B), Real.norm_eq_abs]
    rw [← ENNReal.ofReal_pow (abs_nonneg (A - B)) 2]
    congr 1
    simp
  have hoverlap :
      (2 : ℝ≥0∞) *
          (a ^ ((1 : ℝ) / 2) * b ^ ((1 : ℝ) / 2)) =
        ENNReal.ofReal (2 * (A * B)) := by
    have hA_half : a ^ ((1 : ℝ) / 2) = ENNReal.ofReal A :=
      (ENNReal.ofReal_toReal ha_half_ne_top).symm
    have hB_half : b ^ ((1 : ℝ) / 2) = ENNReal.ofReal B :=
      (ENNReal.ofReal_toReal hb_half_ne_top).symm
    rw [hA_half, hB_half, ← ENNReal.ofReal_mul hA_nonneg]
    rw [show (2 : ℝ≥0∞) = ENNReal.ofReal (2 : ℝ) by norm_num]
    rw [← ENNReal.ofReal_mul (by norm_num : 0 ≤ (2 : ℝ))]
  change
    ‖A - B‖ₑ ^ (2 : ℝ) +
      (2 : ℝ≥0∞) *
        (a ^ ((1 : ℝ) / 2) * b ^ ((1 : ℝ) / 2)) = a + b
  calc
    ‖A - B‖ₑ ^ (2 : ℝ) +
        (2 : ℝ≥0∞) *
          (a ^ ((1 : ℝ) / 2) * b ^ ((1 : ℝ) / 2))
        = ENNReal.ofReal ((A - B) ^ 2) +
            ENNReal.ofReal (2 * (A * B)) := by
          rw [hdiff_sq, hoverlap]
    _ = ENNReal.ofReal (((A - B) ^ 2) + 2 * (A * B)) := by
          rw [ENNReal.ofReal_add (sq_nonneg _) (by positivity)]
    _ = ENNReal.ofReal (A ^ 2 + B ^ 2) := by
          congr 1
          ring
    _ = ENNReal.ofReal (A ^ 2) + ENNReal.ofReal (B ^ 2) := by
          rw [ENNReal.ofReal_add (sq_nonneg A) (sq_nonneg B)]
    _ = a + b := by
          rw [hA_sq_ofReal, hB_sq_ofReal]

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder overlap support: the
concrete Pythagorean inequality
`diffSq + 2 * overlap <= 2`.  This integrates the scalar identity against the
infinite product denominator measure and uses the two finite-likelihood
mass-one identities.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_sqrtDiff_sq_add_two_overlap_le_two
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞) :
    ∀ n, ∀ᶠ m in atTop,
      (∫⁻ x,
        (‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
              ((1 : ℝ) / 2)).toReal -
            ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
              ((1 : ℝ) / 2)).toReal‖ₑ ^ (2 : ℝ))
        ∂Measure.infinitePi ν) +
          (2 : ℝ≥0∞) *
            (∫⁻ x,
              (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                  ((1 : ℝ) / 2) *
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                  ((1 : ℝ) / 2)
              ∂Measure.infinitePi ν) ≤ (2 : ℝ≥0∞) := by
  intro n
  filter_upwards [hfinite n] with m hm
  let Xn : (ι -> S) -> ℝ≥0∞ := fun x =>
    durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x
  let Xm : (ι -> S) -> ℝ≥0∞ := fun x =>
    durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x
  let Rn : (ι -> S) -> ℝ≥0∞ := fun x => Xn x ^ ((1 : ℝ) / 2)
  let Rm : (ι -> S) -> ℝ≥0∞ := fun x => Xm x ^ ((1 : ℝ) / 2)
  have hXn_meas : Measurable Xn :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_measurable (Iseq n) hq
  have hXm_meas : Measurable Xm :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_measurable (Iseq m) hq
  have hRn_meas : Measurable Rn :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable (Iseq n) hq
  have hRm_meas : Measurable Rm :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_rpow_half_measurable (Iseq m) hq
  have hdiff_meas :
      AEMeasurable
        (fun x => ‖(Rn x).toReal - (Rm x).toReal‖ₑ ^ (2 : ℝ))
        (Measure.infinitePi ν) :=
    (((hRn_meas.ennreal_toReal.sub hRm_meas.ennreal_toReal).enorm).pow_const
      (2 : ℝ)).aemeasurable
  have hpoint :
      ∀ᵐ x ∂Measure.infinitePi ν,
        (‖(Rn x).toReal - (Rm x).toReal‖ₑ ^ (2 : ℝ)) +
            (2 : ℝ≥0∞) * (Rn x * Rm x) ≤ Xn x + Xm x := by
    filter_upwards [hm] with x hx
    exact
      le_of_eq
        (durrett2019_theorem_4_3_8_sqrtDiff_sq_add_two_mul_eq_add
          (a := Xn x) (b := Xm x) hx.1 hx.2)
  have hXn_int : ∫⁻ x, Xn x ∂Measure.infinitePi ν = 1 :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
      (μ := μ) (ν := ν) (Iseq n) hq hμ
  have hXm_int : ∫⁻ x, Xm x ∂Measure.infinitePi ν = 1 :=
    durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_eq_one
      (μ := μ) (ν := ν) (Iseq m) hq hμ
  change
      (∫⁻ x, ‖(Rn x).toReal - (Rm x).toReal‖ₑ ^ (2 : ℝ)
          ∂Measure.infinitePi ν) +
        (2 : ℝ≥0∞) *
          (∫⁻ x, Rn x * Rm x ∂Measure.infinitePi ν) ≤
        (2 : ℝ≥0∞)
  calc
    (∫⁻ x, ‖(Rn x).toReal - (Rm x).toReal‖ₑ ^ (2 : ℝ)
        ∂Measure.infinitePi ν) +
        (2 : ℝ≥0∞) *
          (∫⁻ x, Rn x * Rm x ∂Measure.infinitePi ν)
        = (∫⁻ x, ‖(Rn x).toReal - (Rm x).toReal‖ₑ ^ (2 : ℝ)
            ∂Measure.infinitePi ν) +
            (∫⁻ x, (2 : ℝ≥0∞) * (Rn x * Rm x)
              ∂Measure.infinitePi ν) := by
          rw [lintegral_const_mul' _ _ (by norm_num : (2 : ℝ≥0∞) ≠ ∞)]
    _ = ∫⁻ x,
          (‖(Rn x).toReal - (Rm x).toReal‖ₑ ^ (2 : ℝ)) +
            (2 : ℝ≥0∞) * (Rn x * Rm x)
          ∂Measure.infinitePi ν := by
          rw [lintegral_add_left' hdiff_meas]
    _ ≤ ∫⁻ x, Xn x + Xm x ∂Measure.infinitePi ν :=
          lintegral_mono_ae hpoint
    _ = (∫⁻ x, Xn x ∂Measure.infinitePi ν) +
          ∫⁻ x, Xm x ∂Measure.infinitePi ν := by
          rw [lintegral_add_left hXn_meas]
    _ = (2 : ℝ≥0∞) := by
          rw [hXn_int, hXm_int]
          norm_num

/--
Durrett 2019, Theorem 4.3.8 positive-product Hellinger support: scalar
tail-subtraction algebra for the remaining square-difference estimate.  If a
candidate overlap dominates the tail affinity and the square difference plus
twice that overlap is at most `2`, then the square difference has the textbook
bound `2 * (1 - tail)`.
-/
theorem durrett2019_theorem_4_3_8_sqrtDiff_square_bound_of_overlap
    {D overlap tail : ℝ≥0∞}
    (htail_le : tail ≤ 1)
    (hoverlap : tail ≤ overlap)
    (hadd : D + (2 : ℝ≥0∞) * overlap ≤ (2 : ℝ≥0∞)) :
    D ≤ (2 : ℝ≥0∞) * (1 - tail) := by
  have htail_ne_top : tail ≠ ∞ :=
    ne_top_of_le_ne_top (by norm_num : (1 : ℝ≥0∞) ≠ ∞) htail_le
  have htwo_tail_ne_top : (2 : ℝ≥0∞) * tail ≠ ∞ :=
    ENNReal.mul_ne_top (by norm_num : (2 : ℝ≥0∞) ≠ ∞) htail_ne_top
  have htwo_tail_le : (2 : ℝ≥0∞) * tail ≤ (2 : ℝ≥0∞) * overlap := by
    gcongr
  have hadd_tail : D + (2 : ℝ≥0∞) * tail ≤ (2 : ℝ≥0∞) :=
    (add_le_add_right htwo_tail_le D).trans hadd
  have hD_sub : D ≤ (2 : ℝ≥0∞) - (2 : ℝ≥0∞) * tail :=
    ENNReal.le_sub_of_add_le_right htwo_tail_ne_top hadd_tail
  have hsub_eq :
      (2 : ℝ≥0∞) - (2 : ℝ≥0∞) * tail =
        (2 : ℝ≥0∞) * (1 - tail) := by
    symm
    rw [ENNReal.mul_sub]
    · norm_num
    · intro _ _
      norm_num
  simpa [hsub_eq] using hD_sub

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff after the
`sqrt X_n + sqrt X_m` square-integral estimate has been discharged.  The only
remaining analytic input is the Hellinger-tail square estimate for
`sqrt X_n - sqrt X_m`.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_sqrtDiff_square_bound
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {tail : ℕ -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞)
    (hG_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x,
          (‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2)).toReal -
              ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)).toReal‖ₑ ^ (2 : ℝ))
          ∂Measure.infinitePi ν ≤ (2 : ℝ≥0∞) * (1 - tail n)) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_concrete_squareRoot_cauchySchwarz
      (ν := ν) (Iseq := Iseq) (q := q) (tail := tail)
      hq htail_le htail hfinite ?_ hG_sq
  intro n
  exact Filter.Eventually.of_forall fun m =>
    durrett2019_theorem_4_3_8_cylinderLikelihood_sqrtSum_sq_lintegral_le_four
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) hq hμ n m

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff from a
Hellinger-overlap estimate.  It remains to prove that the concrete square
difference plus twice the concrete overlap is at most `2`, and that the
overlap dominates the tail affinity; this theorem performs the final
`2 * (1 - tail)` conversion and feeds the compiled Cauchy consumer.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_sqrtDiff_overlap_bound
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {tail : ℕ -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞)
    (hoverlap :
      ∀ n, ∀ᶠ m in atTop,
        tail n ≤
          ∫⁻ x,
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2) *
              (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)
            ∂Measure.infinitePi ν)
    (hadd :
      ∀ n, ∀ᶠ m in atTop,
        (∫⁻ x,
          (‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2)).toReal -
              ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)).toReal‖ₑ ^ (2 : ℝ))
          ∂Measure.infinitePi ν) +
            (2 : ℝ≥0∞) *
              (∫⁻ x,
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                    ((1 : ℝ) / 2) *
                  (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                    ((1 : ℝ) / 2)
                ∂Measure.infinitePi ν) ≤ (2 : ℝ≥0∞)) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_sqrtDiff_square_bound
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) (tail := tail)
      hq hμ htail_le htail hfinite ?_
  intro n
  filter_upwards [hoverlap n, hadd n] with m hoverlap_nm hadd_nm
  exact
    durrett2019_theorem_4_3_8_sqrtDiff_square_bound_of_overlap
      (D :=
        ∫⁻ x,
          (‖((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2)).toReal -
              ((durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)).toReal‖ₑ ^ (2 : ℝ))
          ∂Measure.infinitePi ν)
      (overlap :=
        ∫⁻ x,
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
              ((1 : ℝ) / 2) *
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
              ((1 : ℝ) / 2)
          ∂Measure.infinitePi ν)
      (tail := tail n) (htail_le n) hoverlap_nm hadd_nm

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff after the
concrete Pythagorean overlap inequality has been discharged.  The remaining
analytic input is now only the lower bound saying that the concrete overlap
dominates the Hellinger tail affinity.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_overlap_lower_bound
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {tail : ℕ -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞)
    (hoverlap :
      ∀ n, ∀ᶠ m in atTop,
        tail n ≤
          ∫⁻ x,
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
                ((1 : ℝ) / 2) *
              (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
                ((1 : ℝ) / 2)
            ∂Measure.infinitePi ν) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_sqrtDiff_overlap_bound
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) (tail := tail)
      hq hμ htail_le htail hfinite hoverlap
      (durrett2019_theorem_4_3_8_cylinderLikelihood_sqrtDiff_sq_add_two_overlap_le_two
        (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) hq hμ hfinite)

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder overlap support: for an
eventually nested finite-coordinate exhaustion, a finite Hellinger tail-product
lower bound supplies the concrete square-root overlap lower bound.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_overlap_lower_bound_of_tailProduct
    {ι S : Type*} [DecidableEq ι] [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {tail : ℕ -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (hsubset : ∀ n, ∀ᶠ m in atTop, Iseq n ⊆ Iseq m)
    (htail_prod :
      ∀ n, ∀ᶠ m in atTop,
        tail n ≤
          (Iseq m \ Iseq n).prod
            (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)) :
    ∀ n, ∀ᶠ m in atTop,
      tail n ≤
        ∫⁻ x,
          (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x) ^
              ((1 : ℝ) / 2) *
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x) ^
              ((1 : ℝ) / 2)
          ∂Measure.infinitePi ν := by
  intro n
  filter_upwards [hsubset n, htail_prod n] with m hnm htail_nm
  rw [durrett2019_theorem_4_3_8_cylinderLikelihood_sqrt_overlap_lintegral_of_subset
    (μ := μ) (ν := ν) (I := Iseq n) (J := Iseq m) hnm hq hμ]
  exact htail_nm

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff from
finite Hellinger tail products.  This removes the abstract overlap lower-bound
assumption once the coordinate exhaustion is eventually nested and the finite
tail products dominate the affinity tail.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_tailProduct_lower_bound
    {ι S : Type*} [DecidableEq ι] [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    {tail : ℕ -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x ≠ ∞)
    (hsubset : ∀ n, ∀ᶠ m in atTop, Iseq n ⊆ Iseq m)
    (htail_prod :
      ∀ n, ∀ᶠ m in atTop,
        tail n ≤
          (Iseq m \ Iseq n).prod
            (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_overlap_lower_bound
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) (tail := tail)
      hq hμ htail_le htail hfinite
      (durrett2019_theorem_4_3_8_cylinderLikelihood_overlap_lower_bound_of_tailProduct
        (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) (tail := tail)
        hq hμ hsubset htail_prod)

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff for the
standard prefix exhaustion of `ℕ`: a `HasProd` statement for the
one-coordinate Hellinger affinities supplies `tail -> 1`, while finite
tail-product lower bounds supply the concrete overlap estimates.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_liminf_of_hasProd_tailProduct
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (htail_le : ∀ n, tail n ≤ 1)
    (htail_eq :
      ∀ᶠ n in atTop,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x ≠ ∞)
    (htail_prod :
      ∀ n, ∀ᶠ m in atTop,
        tail n ≤
          (Finset.range m \ Finset.range n).prod
            (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_tailProduct_lower_bound
      (μ := μ) (ν := ν) (Iseq := fun n => Finset.range n) (q := q) (tail := tail)
      hq hμ htail_le ?_ hfinite ?_ htail_prod
  · exact
      durrett2019_theorem_4_3_8_hellingerTail_tendsto_one_of_hasProd
        (h := fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)
        (tail := tail) (P := P) hP0 hPtop hprod htail_eq
  · intro n
    filter_upwards [eventually_ge_atTop n] with m hnm
    exact Finset.range_subset_range.2 hnm

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff for the
standard prefix exhaustion of `ℕ`: if the one-coordinate Hellinger affinities
have a positive finite product and are bounded by one, then the normalized
infinite tail automatically supplies the finite tail-product lower bounds.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_liminf_of_hasProd_le_one
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (hhellinger_le_one :
      ∀ i, (∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) ≤ 1)
    (htail_le : ∀ n, tail n ≤ 1)
    (htail_eq :
      ∀ n,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x ≠ ∞) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_liminf_of_hasProd_tailProduct
      (μ := μ) (ν := ν) (q := q) (tail := tail) (P := P)
      hq hμ hP0 hPtop hprod htail_le ?_ hfinite ?_
  · exact Filter.Eventually.of_forall htail_eq
  · exact
      durrett2019_theorem_4_3_8_range_tailProduct_lower_bound_of_hasProd_le_one
        (h := fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i)
        (tail := tail) (P := P) hP0 hprod hhellinger_le_one htail_eq

/--
Durrett 2019, Theorem 4.3.8 positive-product cylinder Cauchy handoff for the
standard prefix exhaustion of `ℕ`: the source density hypotheses themselves
provide both one-coordinate Hellinger affinity bounds and the normalized
tail bound consumed by the positive-product range Cauchy wrapper.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_liminf_of_hasProd_density
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (htail_eq :
      ∀ n,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x ≠ ∞) :
    Tendsto
      (fun n =>
        Filter.liminf
          (fun m =>
            ∫⁻ x,
              ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x).toReal -
                (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x).toReal‖ₑ
              ∂Measure.infinitePi ν)
          atTop)
      atTop (𝓝 0) := by
  let h : ℕ -> ℝ≥0∞ :=
    fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i
  have hhellinger_le_one : ∀ i, h i ≤ 1 :=
    durrett2019_theorem_4_3_8_oneCoordinate_hellingerAffinities_le_one
      (μ := μ) (ν := ν) (q := q) hq hμ
  have htail_le : ∀ n, tail n ≤ 1 :=
    durrett2019_theorem_4_3_8_hellingerTail_le_one_of_hasProd_le_one
      (h := h) (tail := tail) (P := P) hP0 hprod hhellinger_le_one htail_eq
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_liminf_of_hasProd_le_one
      (μ := μ) (ν := ν) (q := q) (tail := tail) (P := P)
      hq hμ hP0 hPtop hprod hhellinger_le_one htail_le htail_eq hfinite

/--
Durrett 2019, Theorem 4.3.8 source no-top support: pointwise finite
coordinate densities discharge the pairwise finite-cylinder no-top condition
used by the positive-product Cauchy branch.
-/
theorem durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_ne_top_of_forall_ne_top
    {S : Type*} [MeasurableSpace S]
    {ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞}
    (hq_ne_top : ∀ i s, q i s ≠ ∞) :
    ∀ n, ∀ᶠ m in atTop,
      ∀ᵐ x ∂Measure.infinitePi ν,
        durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ ∧
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x ≠ ∞ := by
  intro n
  exact Filter.Eventually.of_forall fun m =>
    Filter.Eventually.of_forall fun x =>
      ⟨durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_top_of_forall_ne_top
          (q := q) hq_ne_top n x,
        durrett2019_theorem_4_3_8_cylinderLikelihood_range_ne_top_of_forall_ne_top
          (q := q) hq_ne_top m x⟩

/--
Durrett 2019, Theorem 4.3.8 positive-product handoff: convergence of the
finite cylinder-likelihood integrals to the limiting likelihood mass supplies
the mass-one input consumed by the positive-branch eliminator.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_lintegral_tendsto
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hIntTendsto :
      Tendsto
        (fun n =>
          ∫⁻ x,
            durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x
              ∂Measure.infinitePi ν)
        atTop (𝓝 (∫⁻ x, X x ∂Measure.infinitePi ν))) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_lintegral_eq_one
      (μ := Measure.infinitePi μ) (ν := Measure.infinitePi ν) (X := X)
      hbranch hXrn hνtop ?_
  exact
    durrett2019_theorem_4_3_8_lintegral_eq_one_of_cylinderLikelihood_lintegral_tendsto
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) hq hμ hIntTendsto

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff: once the external
positive-product estimate proves L1 convergence of the finite cylinder
likelihoods to the limiting likelihood, the source dichotomy collapses to the
absolute-continuity branch.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_toReal_L1
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hL1 :
      Tendsto
        (fun n =>
          ∫⁻ x,
            ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
              (X x).toReal‖ₑ ∂Measure.infinitePi ν)
        atTop (𝓝 0)) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_lintegral_tendsto
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) hq hμ hbranch hXrn hνtop ?_
  refine
    durrett2019_theorem_4_3_8_cylinderLikelihood_lintegral_tendsto_of_toReal_L1
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q) hq hμ ?_ hXint hL1
  exact measure_eq_zero_iff_ae_notMem.mp hνtop

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff from the Cauchy
estimate: pairwise L1 tail control and pointwise convergence give the L1 input
that selects the absolute-continuity branch of Kakutani's dichotomy.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_pairwise_liminf
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal)
          atTop (𝓝 ((X x).toReal)))
    (hpair :
      Tendsto
        (fun n =>
          Filter.liminf
            (fun m =>
              ∫⁻ x,
                ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
                  (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
                ∂Measure.infinitePi ν)
            atTop)
        atTop (𝓝 0)) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_toReal_L1
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q)
      hq hμ hbranch hXrn hνtop hXint ?_
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_toReal_L1_of_pairwise_liminf
      (ν := ν) (Iseq := Iseq) (q := q) hq hlim hpair

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff for the standard
prefix exhaustion of `ℕ`: a positive finite product of the one-coordinate
Hellinger affinities, together with the source density hypotheses and the
finite-cylinder convergence data, selects the absolute-continuity branch.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_range_hasProd_density
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ℕ -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n =>
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x).toReal)
          atTop (𝓝 ((X x).toReal)))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (htail_eq :
      ∀ n,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x ≠ ∞) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_pairwise_liminf
      (μ := μ) (ν := ν) (Iseq := fun n => Finset.range n) (q := q)
      hq hμ hbranch hXrn hνtop hXint hlim ?_
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_liminf_of_hasProd_density
      (μ := μ) (ν := ν) (q := q) (tail := tail) (P := P)
      hq hμ hP0 hPtop hprod htail_eq hfinite

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff for the standard
prefix exhaustion of `ℕ`, with the no-top obligation supplied in the usual
source form as a.e. finiteness of the limiting likelihood.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_range_hasProd_density_ae_ne_top
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ℕ -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hXfinite : ∀ᵐ x ∂Measure.infinitePi ν, X x ≠ ∞)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n =>
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x).toReal)
          atTop (𝓝 ((X x).toReal)))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (htail_eq :
      ∀ n,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hfinite :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x ≠ ∞ ∧
            durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range m) q x ≠ ∞) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_range_hasProd_density
    (μ := μ) (ν := ν) (q := q) (tail := tail) (P := P)
    hq hμ hbranch hXrn
    (durrett2019_theorem_4_3_8_top_set_null_of_ae_ne_top
      (ν := Measure.infinitePi ν) (X := X) hXfinite)
    hXint hlim hP0 hPtop hprod htail_eq hfinite

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff for the standard
prefix exhaustion of `ℕ`: the source-shaped ENNReal convergence of the finite
prefix likelihoods supplies the real-valued convergence input, while pointwise
finite coordinate densities discharge the finite-cylinder no-top side
condition.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_range_hasProd_density_range_tendsto
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ℕ -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hXfinite : ∀ᵐ x ∂Measure.infinitePi ν, X x ≠ ∞)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hXlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
          atTop (𝓝 (X x)))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (htail_eq :
      ∀ n,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hq_ne_top : ∀ i s, q i s ≠ ∞) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν :=
  durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_range_hasProd_density_ae_ne_top
    (μ := μ) (ν := ν) (q := q) (tail := tail) (P := P)
    hq hμ hbranch hXrn hXfinite hXint
    (durrett2019_theorem_4_3_8_cylinderLikelihood_toReal_tendsto_of_range_tendsto
      (ρ := Measure.infinitePi ν) (q := q) (X := X) hXfinite hXlim)
    hP0 hPtop hprod htail_eq
    (durrett2019_theorem_4_3_8_cylinderLikelihood_range_pairwise_ne_top_of_forall_ne_top
      (ν := ν) (q := q) hq_ne_top)

/--
Durrett 2019, Theorem 4.3.8 canonical-ratio positive-product handoff: the
canonical `mu + nu` likelihood ratio supplies the RN-density and top-null
inputs, so the remaining source obligations are the full-prefix likelihood
convergence, real integrability, and positive Hellinger product data.
-/
theorem
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_canonicalRatio_range_hasProd_density_range_tendsto
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞} {P : ℝ≥0∞}
    {ℱ : Filtration ℕ (inferInstance : MeasurableSpace (ℕ -> S))}
    (C : Set (Set (ℕ -> S)))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : (inferInstance : MeasurableSpace (ℕ -> S)) = MeasurableSpace.generateFrom C)
    (hC : IsPiSystem C)
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXint :
      Integrable
        (fun x =>
          (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
            (Measure.infinitePi μ) (Measure.infinitePi ν) ℱ x).toReal)
        (Measure.infinitePi ν))
    (hXlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
          atTop
          (𝓝
            (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
              (Measure.infinitePi μ) (Measure.infinitePi ν) ℱ x)))
    (hP0 : P ≠ 0) (hPtop : P ≠ ∞)
    (hprod :
      HasProd (fun i => ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i) P)
    (htail_eq :
      ∀ n,
        tail n =
          P / (∏ i ∈ Finset.range n,
            ∫⁻ y, (q i y) ^ ((1 : ℝ) / 2) ∂ν i))
    (hq_ne_top : ∀ i s, q i s ≠ ∞) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  let X : (ℕ -> S) -> ℝ≥0∞ :=
    durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
      (Measure.infinitePi μ) (Measure.infinitePi ν) ℱ
  have hνtop : Measure.infinitePi ν {x | X x = ∞} = 0 :=
    durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_nu_top_zero
      (μ := Measure.infinitePi μ) (ν := Measure.infinitePi ν) (ℱ := ℱ)
      C hC_meas hgen hC
  have hXfinite : ∀ᵐ x ∂Measure.infinitePi ν, X x ≠ ∞ := by
    exact
      (measure_eq_zero_iff_ae_notMem.mp hνtop).mono
        (fun _ hx htop => hx htop)
  exact
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_range_hasProd_density_range_tendsto
      (μ := μ) (ν := ν) (q := q) (tail := tail) (P := P) (X := X)
      hq hμ hbranch
      (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_toReal_ae_rnDeriv
        (μ := Measure.infinitePi μ) (ν := Measure.infinitePi ν) (ℱ := ℱ)
        C hC_meas hgen hC)
      hXfinite hXint hXlim hP0 hPtop hprod htail_eq hq_ne_top

/--
Durrett 2019, Theorem 4.3.8 positive-branch final handoff: once full-prefix
likelihoods converge to `X`, pointwise finite/nonzero coordinate densities make
the zero set of `X` a tail event; a nonzero lower integral then selects the
absolute-continuity branch from a supplied Kakutani dichotomy.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_rangeLimit_lintegral_ne_zero_finite_nonzero
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞} {X : (ℕ -> S) -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
          atTop (𝓝 (X x)))
    (hq_ne_top : ∀ i s, q i s ≠ ∞)
    (hq_ne_zero : ∀ i s, q i s ≠ 0)
    (hInt : (∫⁻ x, X x ∂Measure.infinitePi ν) ≠ 0) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_tailBlock_zero_set_lintegral_ne_zero
      (μ := Measure.infinitePi μ) (ν := Measure.infinitePi ν)
      (s := fun i => durrett2019_theorem_4_3_8_coordinateSigma S i)
      (X := X) hbranch hXrn hνtop ?_ ?_ ?_ hInt
  · intro n
    exact durrett2019_theorem_4_3_8_coordinateSigma_le (S := S) n
  · exact durrett2019_theorem_4_3_8_coordinateSigma_iIndep_infinitePi
      (S := S) (ν := ν)
  · intro n
    simpa [durrett2019_theorem_4_3_8_tailCoordinateSigma] using
      durrett2019_theorem_4_3_8_tailCoordinate_zero_set_measurable_of_rangeLimit_finite_nonzero
        (S := S) (q := q) (X := X) hq hXlim hq_ne_top hq_ne_zero n

/--
Durrett 2019, Theorem 4.3.8 canonical-ratio positive-branch handoff: with the
canonical `mu + nu` likelihood ratio as the limiting likelihood, Chapter 4.3.5
supplies the RN-density and top-null inputs automatically.
-/
theorem
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_canonicalRatio_rangeLimit_lintegral_ne_zero_finite_nonzero
    {S : Type*} [MeasurableSpace S]
    {μ ν : ℕ -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {q : ℕ -> S -> ℝ≥0∞}
    {ℱ : Filtration ℕ (inferInstance : MeasurableSpace (ℕ -> S))}
    (C : Set (Set (ℕ -> S)))
    (hC_meas : ∀ s ∈ C, ∃ m, MeasurableSet[ℱ m] s)
    (hgen : (inferInstance : MeasurableSpace (ℕ -> S)) = MeasurableSpace.generateFrom C)
    (hC : IsPiSystem C)
    (hq : ∀ i, Measurable (q i))
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXlim :
      ∀ x : ℕ -> S,
        Tendsto
          (fun n => durrett2019_theorem_4_3_8_cylinderLikelihood (Finset.range n) q x)
          atTop
          (𝓝
            (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
              (Measure.infinitePi μ) (Measure.infinitePi ν) ℱ x)))
    (hq_ne_top : ∀ i s, q i s ≠ ∞)
    (hq_ne_zero : ∀ i s, q i s ≠ 0)
    (hInt :
      (∫⁻ x,
        durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
          (Measure.infinitePi μ) (Measure.infinitePi ν) ℱ x ∂Measure.infinitePi ν) ≠ 0) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  let X : (ℕ -> S) -> ℝ≥0∞ :=
    durrett2019_theorem_4_3_5_add_dominating_canonicalRatio
      (Measure.infinitePi μ) (Measure.infinitePi ν) ℱ
  exact
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_rangeLimit_lintegral_ne_zero_finite_nonzero
      (μ := μ) (ν := ν) (q := q) (X := X)
      hq hbranch
      (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_toReal_ae_rnDeriv
        (μ := Measure.infinitePi μ) (ν := Measure.infinitePi ν) (ℱ := ℱ)
        C hC_meas hgen hC)
      (durrett2019_theorem_4_3_5_add_dominating_canonicalRatio_nu_top_zero
        (μ := Measure.infinitePi μ) (ν := Measure.infinitePi ν) (ℱ := ℱ)
        C hC_meas hgen hC)
      hXlim hq_ne_top hq_ne_zero hInt

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff from the Hellinger
tail estimate: if the textbook Hellinger-tail L1 bound is available and the
tail affinities tend to one, the source dichotomy selects absolute continuity.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_hellingerTail_bound
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal)
          atTop (𝓝 ((X x).toReal)))
    (tail : ℕ -> ℝ≥0∞)
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hbound :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x,
          ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ
          ∂Measure.infinitePi ν ≤
            durrett2019_theorem_4_3_8_hellingerTailL1Bound tail n) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_pairwise_liminf
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q)
      hq hμ hbranch hXrn hνtop hXint hlim ?_
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_hellingerTail_bound
      (ν := ν) (Iseq := Iseq) (q := q) tail htail_le htail hbound

/--
Durrett 2019, Theorem 4.3.8 positive-product final handoff from the textbook
square-root Cauchy-Schwarz estimate: once the source proof supplies the
pointwise square-root factorization and the two square-integral bounds, the
Kakutani dichotomy selects the absolute-continuity branch.
-/
theorem durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_squareRoot_cauchySchwarz
    {ι S : Type*} [MeasurableSpace S]
    {μ ν : ι -> Measure S} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)]
    {Iseq : ℕ -> Finset ι} {q : ι -> S -> ℝ≥0∞}
    (hq : ∀ i, Measurable (q i))
    (hμ : ∀ i, μ i = (ν i).withDensity (q i))
    {X : (ι -> S) -> ℝ≥0∞}
    (hbranch :
      Measure.infinitePi μ ≪ Measure.infinitePi ν ∨
        Measure.infinitePi μ ⟂ₘ Measure.infinitePi ν)
    (hXrn :
      (fun x => (X x).toReal) =ᵐ[Measure.infinitePi ν]
        fun x => ((Measure.infinitePi μ).rnDeriv (Measure.infinitePi ν) x).toReal)
    (hνtop : Measure.infinitePi ν {x | X x = ∞} = 0)
    (hXint : Integrable (fun x => (X x).toReal) (Measure.infinitePi ν))
    (hlim :
      ∀ᵐ x ∂Measure.infinitePi ν,
        Tendsto
          (fun n => (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal)
          atTop (𝓝 ((X x).toReal)))
    {F G : ℕ -> ℕ -> (ι -> S) -> ℝ≥0∞} {tail : ℕ -> ℝ≥0∞}
    (htail_le : ∀ n, tail n ≤ 1)
    (htail : Tendsto tail atTop (𝓝 1))
    (hD :
      ∀ n, ∀ᶠ m in atTop,
        ∀ᵐ x ∂Measure.infinitePi ν,
          ‖(durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq n) q x).toReal -
            (durrett2019_theorem_4_3_8_cylinderLikelihood (Iseq m) q x).toReal‖ₑ ≤
              F n m x * G n m x)
    (hF : ∀ n m, AEMeasurable (F n m) (Measure.infinitePi ν))
    (hG : ∀ n m, AEMeasurable (G n m) (Measure.infinitePi ν))
    (hF_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x, F n m x ^ (2 : ℝ) ∂Measure.infinitePi ν ≤ (4 : ℝ≥0∞))
    (hG_sq :
      ∀ n, ∀ᶠ m in atTop,
        ∫⁻ x, G n m x ^ (2 : ℝ) ∂Measure.infinitePi ν ≤
          (2 : ℝ≥0∞) * (1 - tail n)) :
    Measure.infinitePi μ ≪ Measure.infinitePi ν := by
  refine
    durrett2019_theorem_4_3_8_absolutelyContinuous_of_dichotomy_cylinderLikelihood_pairwise_liminf
      (μ := μ) (ν := ν) (Iseq := Iseq) (q := q)
      hq hμ hbranch hXrn hνtop hXint hlim ?_
  exact
    durrett2019_theorem_4_3_8_cylinderLikelihood_pairwise_liminf_of_squareRoot_cauchySchwarz
      (ν := ν) (Iseq := Iseq) (q := q) (F := F) (G := G) (tail := tail)
      htail_le htail hD hF hG hF_sq hG_sq

end ProbabilityTheory
end StatInference
