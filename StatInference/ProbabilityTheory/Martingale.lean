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

end ProbabilityTheory
end StatInference
