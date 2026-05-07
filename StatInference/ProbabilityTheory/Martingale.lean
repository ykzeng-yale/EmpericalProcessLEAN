import Mathlib.Probability.BorelCantelli
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

open Filter MeasureTheory

open scoped BigOperators MeasureTheory ProbabilityTheory

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

end ProbabilityTheory
end StatInference
