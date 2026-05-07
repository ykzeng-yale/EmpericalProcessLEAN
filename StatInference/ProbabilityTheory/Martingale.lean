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

end ProbabilityTheory
end StatInference
