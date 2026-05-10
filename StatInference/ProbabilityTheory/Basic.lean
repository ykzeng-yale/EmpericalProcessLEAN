import StatInference.EmpiricalProcess.RealHalfLineGC
import StatInference.ProbabilityMeasure.BorelCantelli
import StatInference.ProbabilityMeasure.GeneratedSigma
import StatInference.ProbabilityMeasure.ProductMeasure
import StatInference.ProbabilityMeasure.StrongLaw
import StatInference.ProbabilityMeasure.WeakConvergence
import Mathlib.MeasureTheory.Measure.LevyConvergence
import Mathlib.MeasureTheory.Measure.CharacteristicFunction.TaylorExpansion
import Mathlib.Probability.CentralLimitTheorem
import Mathlib.Probability.Independence.CharacteristicFunction

/-!
# Durrett 2019 probability-theory wrappers

This module starts the Durrett 2019 probability-theory lane.  It packages
source-shaped theorem wrappers over the reusable probability-measure layer, so
later files can track Durrett item numbers without duplicating foundations.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory

open scoped BigOperators BoundedContinuousFunction ENNReal Topology Function ProbabilityTheory

universe u v w x

/-! ## Durrett, Theorem 1.1.1 -/

/-- Durrett 2019, Theorem 1.1.1(i), monotonicity of a measure. -/
theorem durrett2019_theorem_1_1_1_monotonicity
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω} {A B : Set Ω}
    (hAB : A ⊆ B) :
    μ A ≤ μ B := by
  exact measure_mono hAB

/-- Durrett 2019, Theorem 1.1.1(ii), countable subadditivity. -/
theorem durrett2019_theorem_1_1_1_subadditivity
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {A : Set Ω} {Aseq : ℕ -> Set Ω}
    (hA : A ⊆ ⋃ n, Aseq n) :
    μ A ≤ ∑' n, μ (Aseq n) := by
  exact (measure_mono hA).trans (measure_iUnion_le Aseq)

/-- Durrett 2019, Theorem 1.1.1(iii), continuity from below. -/
theorem durrett2019_theorem_1_1_1_continuity_from_below
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : Monotone A) :
    μ (⋃ n, A n) = ⨆ n, μ (A n) := by
  exact hA.measure_iUnion

/--
Durrett 2019, Theorem 1.1.1(iii), limit form for an increasing sequence whose
union is `A`.
-/
theorem durrett2019_theorem_1_1_1_tendsto_measure_from_below
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Aseq : ℕ -> Set Ω} {A : Set Ω}
    (hAseq : Monotone Aseq) (hA : (⋃ n, Aseq n) = A) :
    Tendsto (fun n => μ (Aseq n)) atTop (𝓝 (μ A)) := by
  simpa [Function.comp_def, hA] using
    (tendsto_measure_iUnion_atTop (μ := μ) hAseq)

/-- Durrett 2019, Theorem 1.1.1(iv), continuity from above. -/
theorem durrett2019_theorem_1_1_1_continuity_from_above
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : Antitone A) (hA_meas : ∀ n, MeasurableSet (A n))
    (hA0_finite : μ (A 0) ≠ ∞) :
    μ (⋂ n, A n) = ⨅ n, μ (A n) := by
  exact hA.measure_iInter (fun n => (hA_meas n).nullMeasurableSet) ⟨0, hA0_finite⟩

/--
Durrett 2019, Theorem 1.1.1(iv), limit form for a decreasing sequence whose
intersection is `A`.
-/
theorem durrett2019_theorem_1_1_1_tendsto_measure_from_above
    {Ω : Type u} [MeasurableSpace Ω] {μ : Measure Ω}
    {Aseq : ℕ -> Set Ω} {A : Set Ω}
    (hAseq : Antitone Aseq) (hAseq_meas : ∀ n, MeasurableSet (Aseq n))
    (hA0_finite : μ (Aseq 0) ≠ ∞) (hA : (⋂ n, Aseq n) = A) :
    Tendsto (fun n => μ (Aseq n)) atTop (𝓝 (μ A)) := by
  simpa [Function.comp_def, hA] using
    (tendsto_measure_iInter_atTop (μ := μ)
      (fun n => (hAseq_meas n).nullMeasurableSet) hAseq ⟨0, hA0_finite⟩)

/-! ## Durrett, Section 1.3 -/

/--
Durrett 2019, Theorem 1.3.1: measurability into a generated sigma-field is
checked on the generators.
-/
theorem durrett2019_theorem_1_3_1_measurable_of_generator_preimages
    {Ω : Type u} [MeasurableSpace Ω] {S : Type v} {C : Set (Set S)}
    {X : Ω -> S}
    (hX : ∀ A ∈ C, MeasurableSet (X ⁻¹' A)) :
    @Measurable Ω S _ (StatInference.ProbabilityMeasure.GeneratedSigma S C) X := by
  exact StatInference.ProbabilityMeasure.measurable_generatedSigma hX

/-- Durrett 2019, Theorem 1.3.4: composition of measurable maps is measurable. -/
theorem durrett2019_theorem_1_3_4_measurable_comp
    {Ω : Type u} [MeasurableSpace Ω]
    {S : Type v} [MeasurableSpace S]
    {T : Type*} [MeasurableSpace T]
    {X : Ω -> S} {f : S -> T}
    (hf : Measurable f) (hX : Measurable X) :
    Measurable (fun ω => f (X ω)) := by
  exact hf.comp hX

/-! ## Durrett, Section 2.1 -/

/--
Durrett 2019, Theorem 2.1.7, indexed pi-system form.

Independent pi-systems generate independent sigma-fields.  The generator
measurability hypotheses record that each generated sigma-field sits below the
ambient measurable space on which `P` is defined.
-/
theorem durrett2019_theorem_2_1_7_iIndep_generatedSigma_of_iIndepSets
    {Ω : Type u} [mΩ : MeasurableSpace Ω] {ι : Type v} {P : Measure Ω}
    {C : ι -> Set (Set Ω)}
    (hC_meas : ∀ i s, s ∈ C i -> MeasurableSet s)
    (hC_pi : ∀ i, IsPiSystem (C i))
    (hC_indep : _root_.ProbabilityTheory.iIndepSets C P) :
    _root_.ProbabilityTheory.iIndep
      (fun i => StatInference.ProbabilityMeasure.GeneratedSigma Ω (C i)) P := by
  exact _root_.ProbabilityTheory.iIndepSets.iIndep
    (m := fun i => StatInference.ProbabilityMeasure.GeneratedSigma Ω (C i))
    (μ := P)
    (fun i => StatInference.ProbabilityMeasure.generatedSigma_le (hC_meas i))
    C hC_pi (fun i => rfl) hC_indep

/--
Durrett 2019, Theorem 2.1.7, two-pi-system form.

This is the two-sigma-field version used repeatedly before product laws:
independence checked on two generating pi-systems extends to the generated
sigma-fields.
-/
theorem durrett2019_theorem_2_1_7_indep_generatedSigma_of_indepSets
    {Ω : Type u} [mΩ : MeasurableSpace Ω] {P : Measure Ω}
    [IsZeroOrProbabilityMeasure P]
    {C D : Set (Set Ω)}
    (hC_meas : ∀ s, s ∈ C -> MeasurableSet s)
    (hD_meas : ∀ s, s ∈ D -> MeasurableSet s)
    (hC_pi : IsPiSystem C) (hD_pi : IsPiSystem D)
    (hCD_indep : _root_.ProbabilityTheory.IndepSets C D P) :
    _root_.ProbabilityTheory.Indep
      (StatInference.ProbabilityMeasure.GeneratedSigma Ω C)
      (StatInference.ProbabilityMeasure.GeneratedSigma Ω D) P := by
  exact _root_.ProbabilityTheory.IndepSets.indep'
    hC_meas hD_meas hC_pi hD_pi hCD_indep

/--
Durrett 2019, Theorem 2.1.8, generated-pi-system rectangle criterion.

To prove a finite family of random variables is independent, it suffices to
check the finite-intersection product rule on pi-systems that generate the
codomain sigma-fields.  Durrett's real distribution-function criterion is the
special case where the generators are lower half-lines.
-/
theorem durrett2019_theorem_2_1_8_iIndepFun_of_generator_rectangles
    {Ω : Type u} [mΩ : MeasurableSpace Ω] {ι : Type v} [Fintype ι]
    {P : Measure Ω}
    {S : ι -> Type w} [∀ i, MeasurableSpace (S i)]
    {X : ∀ i, Ω -> S i} {C : ∀ i, Set (Set (S i))}
    (hX_meas : ∀ i, Measurable (X i))
    (hC_pi : ∀ i, IsPiSystem (C i))
    (hC_generate : ∀ i, (inferInstance : MeasurableSpace (S i)) =
      MeasurableSpace.generateFrom (C i))
    (hrect :
      ∀ (F : Finset ι) (A : ∀ i, Set (S i)),
        (∀ i, i ∈ F -> A i ∈ C i) ->
          P (⋂ i ∈ F, X i ⁻¹' A i) =
            ∏ i ∈ F, P (X i ⁻¹' A i)) :
    _root_.ProbabilityTheory.iIndepFun (μ := P) X := by
  classical
  let D : ι -> Set (Set Ω) := fun i => Set.preimage (X i) '' C i
  have hD_pi : ∀ i, IsPiSystem (D i) := by
    intro i
    rintro _ ⟨A, hA, rfl⟩ _ ⟨B, hB, rfl⟩ hnon
    have hAB_nonempty : (A ∩ B).Nonempty := by
      rcases hnon with ⟨ω, hωA, hωB⟩
      exact ⟨X i ω, hωA, hωB⟩
    refine ⟨A ∩ B, hC_pi i A hA B hB hAB_nonempty, ?_⟩
    ext ω
    simp only [Set.mem_preimage, Set.mem_inter_iff]
  have hD_indep : _root_.ProbabilityTheory.iIndepSets D P := by
    rw [_root_.ProbabilityTheory.iIndepSets_iff]
    intro F f hf
    let A : ∀ i, Set (S i) := fun i =>
      if hi : i ∈ F then Classical.choose (hf i hi) else Set.univ
    have hA_mem : ∀ i, i ∈ F -> A i ∈ C i := by
      intro i hi
      dsimp [A]
      rw [dif_pos hi]
      exact (Classical.choose_spec (hf i hi)).1
    have hA_eq : ∀ i, i ∈ F -> X i ⁻¹' A i = f i := by
      intro i hi
      dsimp [A]
      rw [dif_pos hi]
      exact (Classical.choose_spec (hf i hi)).2
    calc
      P (⋂ i ∈ F, f i) = P (⋂ i ∈ F, X i ⁻¹' A i) := by
        congr 1
        ext ω
        simp only [Set.mem_iInter]
        constructor
        · intro h i hi
          rw [hA_eq i hi]
          exact h i hi
        · intro h i hi
          rw [← hA_eq i hi]
          exact h i hi
      _ = ∏ i ∈ F, P (X i ⁻¹' A i) := hrect F A hA_mem
      _ = ∏ i ∈ F, P (f i) := by
        refine Finset.prod_congr rfl ?_
        intro i hi
        rw [hA_eq i hi]
  have hD_generate : ∀ i,
      MeasurableSpace.comap (X i) (inferInstance : MeasurableSpace (S i)) =
        MeasurableSpace.generateFrom (D i) := by
    intro i
    rw [hC_generate i, MeasurableSpace.comap_generateFrom]
  have hind : _root_.ProbabilityTheory.iIndep
      (fun i => MeasurableSpace.comap (X i)
        (inferInstance : MeasurableSpace (S i))) P := by
    exact _root_.ProbabilityTheory.iIndepSets.iIndep
      (m := fun i => MeasurableSpace.comap (X i)
        (inferInstance : MeasurableSpace (S i)))
      (μ := P) (fun i => (hX_meas i).comap_le)
      D hD_pi hD_generate hD_indep
  exact (_root_.ProbabilityTheory.iIndepFun_iff_iIndep
    (fun i => (inferInstance : MeasurableSpace (S i))) X P).2 hind

/--
Durrett 2019, Theorem 2.1.8, real distribution-function form.

For a finite family of real random variables, it is enough to check
factorization on all lower half-line events `{X i ≤ x i}`.
-/
theorem durrett2019_theorem_2_1_8_iIndepFun_real_of_Iic_rectangles
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} [Fintype ι]
    {P : Measure Ω} {X : ι -> Ω -> ℝ}
    (hX_meas : ∀ i, Measurable (X i))
    (hrect :
      ∀ (F : Finset ι) (x : ι -> ℝ),
        P (⋂ i ∈ F, X i ⁻¹' Set.Iic (x i)) =
          ∏ i ∈ F, P (X i ⁻¹' Set.Iic (x i))) :
    _root_.ProbabilityTheory.iIndepFun (μ := P) X := by
  classical
  refine durrett2019_theorem_2_1_8_iIndepFun_of_generator_rectangles
    (P := P) (S := fun _ : ι => ℝ) (X := X)
    (C := fun _ : ι => Set.range Set.Iic) hX_meas
    (fun _ => isPiSystem_Iic) (fun _ => ?_) ?_
  · simpa using (borel_eq_generateFrom_Iic ℝ)
  · intro F A hA
    let x : ι -> ℝ :=
      fun i => if hi : i ∈ F then Classical.choose (hA i hi) else 0
    have hA_eq : ∀ i, i ∈ F -> A i = Set.Iic (x i) := by
      intro i hi
      dsimp [x]
      rw [dif_pos hi]
      exact (Classical.choose_spec (hA i hi)).symm
    calc
      P (⋂ i ∈ F, X i ⁻¹' A i) =
          P (⋂ i ∈ F, X i ⁻¹' Set.Iic (x i)) := by
        congr 1
        ext ω
        simp only [Set.mem_iInter]
        constructor
        · intro h i hi
          rw [← hA_eq i hi]
          exact h i hi
        · intro h i hi
          rw [hA_eq i hi]
          exact h i hi
      _ = ∏ i ∈ F, P (X i ⁻¹' Set.Iic (x i)) := hrect F x
      _ = ∏ i ∈ F, P (X i ⁻¹' A i) := by
        refine Finset.prod_congr rfl ?_
        intro i hi
        rw [hA_eq i hi]

/--
Durrett 2019, Theorem 2.1.9, grouped sigma-field form.

If a family of sigma-fields is independent, then the sigma-fields generated by
two disjoint subfamilies are independent.
-/
theorem durrett2019_theorem_2_1_9_indep_iSup_of_disjoint
    {Ω : Type u} [mΩ : MeasurableSpace Ω] {ι : Type v} {P : Measure Ω}
    {m : ι -> MeasurableSpace Ω}
    (hm_le : ∀ i, m i ≤ mΩ)
    (hm_indep : _root_.ProbabilityTheory.iIndep m P)
    {S T : Set ι} (hST : Disjoint S T) :
    _root_.ProbabilityTheory.Indep (⨆ i ∈ S, m i) (⨆ i ∈ T, m i) P := by
  exact _root_.ProbabilityTheory.indep_iSup_of_disjoint hm_le hm_indep hST

/--
Durrett 2019, Theorem 2.1.10, indexed measurable-function form.

Measurable functions of an independent family remain independent.
-/
theorem durrett2019_theorem_2_1_10_iIndepFun_comp
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} {P : Measure Ω}
    {S : ι -> Type*} {T : ι -> Type*}
    [∀ i, MeasurableSpace (S i)] [∀ i, MeasurableSpace (T i)]
    {X : ∀ i, Ω -> S i}
    (hX : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    {f : ∀ i, S i -> T i}
    (hf : ∀ i, Measurable (f i)) :
    _root_.ProbabilityTheory.iIndepFun (μ := P) (fun i => f i ∘ X i) := by
  exact hX.comp f hf

/--
Durrett 2019, Theorem 2.1.10, finite disjoint-block vector form.

For independent random variables, the coordinate vector on one finite block is
independent of the coordinate vector on a disjoint finite block.
-/
theorem durrett2019_theorem_2_1_10_indepFun_finset_blocks
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} {P : Measure Ω}
    {S : ι -> Type*} [∀ i, MeasurableSpace (S i)]
    {X : ∀ i, Ω -> S i}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_meas : ∀ i, Measurable (X i))
    (I J : Finset ι) (hIJ : Disjoint I J) :
    _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω (i : I) => X i ω) (fun ω (j : J) => X j ω) := by
  exact hX_indep.indepFun_finset I J hIJ hX_meas

/--
Durrett 2019, Theorem 2.1.10, finite disjoint-block function form.

Measurable functions of two disjoint finite blocks of an independent family are
independent.
-/
theorem durrett2019_theorem_2_1_10_indepFun_finset_block_functions
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} {P : Measure Ω}
    {S : ι -> Type*} [∀ i, MeasurableSpace (S i)]
    {U : Type w} {V : Type*} [MeasurableSpace U] [MeasurableSpace V]
    {X : ∀ i, Ω -> S i}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_meas : ∀ i, Measurable (X i))
    (I J : Finset ι) (hIJ : Disjoint I J)
    {φ : ((i : I) -> S i) -> U} {ψ : ((j : J) -> S j) -> V}
    (hφ : Measurable φ) (hψ : Measurable ψ) :
    _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω => φ (fun i : I => X i ω))
      (fun ω => ψ (fun j : J => X j ω)) := by
  have hblocks : _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω (i : I) => X i ω) (fun ω (j : J) => X j ω) :=
    hX_indep.indepFun_finset I J hIJ hX_meas
  simpa [Function.comp_def] using hblocks.comp hφ hψ

/--
Durrett 2019, Theorem 2.1.10, partial-sum increment versus early-block
statistic form.

If `X_0, X_1, ...` are independent, then the sum over the later block
`{m, ..., n - 1}` is independent of every measurable statistic of the early
block `{0, ..., m - 1}`.
-/
theorem durrett2019_theorem_2_1_10_indepFun_lateIncrementSum_earlyBlockFunction
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {T : Type v} [MeasurableSpace T]
    {X : ℕ -> Ω -> ℝ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_meas : ∀ i, Measurable (X i))
    {m n : ℕ}
    {ψ : ((i : Finset.range m) -> ℝ) -> T} (hψ : Measurable ψ) :
    _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω => ∑ k ∈ Finset.Ico m n, X k ω)
      (fun ω => ψ (fun i : Finset.range m => X i ω)) := by
  have hdisj : Disjoint (Finset.Ico m n) (Finset.range m) := by
    rw [Finset.disjoint_left]
    intro k hkI hkR
    exact (Nat.not_lt_of_ge (Finset.mem_Ico.mp hkI).1) (Finset.mem_range.mp hkR)
  have hsum :
      Measurable (fun z : ((i : Finset.Ico m n) -> ℝ) => ∑ i, z i) := by
    exact Finset.univ.measurable_fun_sum fun i _ => measurable_pi_apply i
  have hblocks :=
    durrett2019_theorem_2_1_10_indepFun_finset_block_functions
      (P := P) (S := fun _ : ℕ => ℝ) (X := X)
      hX_indep hX_meas (Finset.Ico m n) (Finset.range m) hdisj
      (φ := fun z : ((i : Finset.Ico m n) -> ℝ) => ∑ i, z i)
      (ψ := ψ) hsum hψ
  convert hblocks using 1
  ext ω
  simpa using
    (Finset.sum_attach (Finset.Ico m n) (fun k : ℕ => X k ω)).symm

/--
Durrett 2019, Theorem 2.1.10, partial-sum difference versus early-block
statistic form.

This is the source display `S_n - S_m` used after Theorem 2.1.10.
-/
theorem durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockFunction
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {T : Type v} [MeasurableSpace T]
    {X : ℕ -> Ω -> ℝ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_meas : ∀ i, Measurable (X i))
    {m n : ℕ} (hmn : m ≤ n)
    {ψ : ((i : Finset.range m) -> ℝ) -> T} (hψ : Measurable ψ) :
    _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω => (∑ k ∈ Finset.range n, X k ω) -
        ∑ k ∈ Finset.range m, X k ω)
      (fun ω => ψ (fun i : Finset.range m => X i ω)) := by
  have hinc :=
    durrett2019_theorem_2_1_10_indepFun_lateIncrementSum_earlyBlockFunction
      (P := P) (X := X) (m := m) (n := n) hX_indep hX_meas hψ
  have hleft :
      (fun ω => (∑ k ∈ Finset.range n, X k ω) -
        ∑ k ∈ Finset.range m, X k ω) =
        fun ω => ∑ k ∈ Finset.Ico m n, X k ω := by
    ext ω
    exact (Finset.sum_Ico_eq_sub (fun k => X k ω) hmn).symm
  simpa [hleft] using hinc

/--
Durrett 2019, Theorem 2.1.10, partial-sum difference independent of an
early-block event indicator.

The measurable set `A` may encode events such as the maximum of the first `m`
partial sums crossing a threshold.
-/
theorem durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockIndicator
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> Ω -> ℝ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_meas : ∀ i, Measurable (X i))
    {m n : ℕ} (hmn : m ≤ n)
    {A : Set ((i : Finset.range m) -> ℝ)} (hA : MeasurableSet A) :
    _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω => (∑ k ∈ Finset.range n, X k ω) -
        ∑ k ∈ Finset.range m, X k ω)
      (fun ω =>
        Set.indicator A (fun _ : ((i : Finset.range m) -> ℝ) => (1 : ℝ))
          (fun i : Finset.range m => X i ω)) := by
  exact
    durrett2019_theorem_2_1_10_indepFun_partialSumDiff_earlyBlockFunction
      (P := P) (X := X) hX_indep hX_meas hmn
      (ψ := Set.indicator A
        (fun _ : ((i : Finset.range m) -> ℝ) => (1 : ℝ)))
      (measurable_const.indicator hA)

/--
Durrett 2019, Theorem 2.1.10, two-variable measurable-function form.

Measurable functions of two independent random variables are independent.
-/
theorem durrett2019_theorem_2_1_10_indepFun_comp
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {S : Type v} {T : Type w} {U : Type*} {V : Type*}
    [MeasurableSpace S] [MeasurableSpace T]
    [MeasurableSpace U] [MeasurableSpace V]
    {X : Ω -> S} {Y : Ω -> T}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    {f : S -> U} {g : T -> V}
    (hf : Measurable f) (hg : Measurable g) :
    _root_.ProbabilityTheory.IndepFun (μ := P)
      (fun ω => f (X ω)) (fun ω => g (Y ω)) := by
  simpa [Function.comp_def] using hXY.comp hf hg

/--
Durrett 2019, Theorem 2.1.10, product-coordinate function form.

Measurable functions of the two coordinates on a product probability space are
independent.  This is the concrete product-space version of the grouped
independence theorem.
-/
theorem durrett2019_theorem_2_1_10_product_coordinate_functions_independent
    {S : Type u} [MeasurableSpace S]
    {T : Type v} [MeasurableSpace T]
    {U : Type*} [MeasurableSpace U]
    {V : Type*} [MeasurableSpace V]
    (ν : MeasureTheory.ProbabilityMeasure S)
    (κ : MeasureTheory.ProbabilityMeasure T)
    {X : S -> U} {Y : T -> V}
    (hX : Measurable X) (hY : Measurable Y) :
    _root_.ProbabilityTheory.IndepFun
      (μ := ((ν : Measure S).prod (κ : Measure T)))
      (fun z : S × T => X z.1) (fun z : S × T => Y z.2) := by
  exact
    (StatInference.ProbabilityMeasure.probability_prod_independent_mapped_copies_with_joint_law
      ν κ hX hY).2.2.2

/--
Durrett 2019, Theorem 2.1.11 product-law form.

Independent random variables with marginal laws `ν` and `κ` have joint law
`ν.prod κ`.
-/
theorem durrett2019_theorem_2_1_11_indepFun_hasLaw_prod
    {Ω : Type u} [MeasurableSpace Ω]
    {S : Type v} [MeasurableSpace S]
    {T : Type*} [MeasurableSpace T]
    {P : Measure Ω} [IsFiniteMeasure P] {ν : Measure S} {κ : Measure T}
    {X : Ω -> S} {Y : Ω -> T}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X ν P)
    (hY : _root_.ProbabilityTheory.HasLaw Y κ P) :
    _root_.ProbabilityTheory.HasLaw (fun ω => (X ω, Y ω)) (ν.prod κ) P := by
  exact hXY.hasLaw_prod hX hY

/--
Durrett 2019, Theorem 2.1.11 finite-family product-law form.

Independent random variables with marginal laws `ν i` have joint law
`Measure.pi ν`.
-/
theorem durrett2019_theorem_2_1_11_iIndepFun_hasLaw_pi
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} [Fintype ι]
    {P : Measure Ω}
    {S : ι -> Type*} [∀ i, MeasurableSpace (S i)]
    {X : ∀ i, Ω -> S i} {ν : ∀ i, Measure (S i)}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_law : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) (ν i) P) :
    _root_.ProbabilityTheory.HasLaw (fun ω i => X i ω) (Measure.pi ν) P := by
  exact hX_indep.hasLaw_pi hX_law

/--
Durrett 2019, Theorem 2.1.11, iid finite-family product-law form.

Independent random variables with a common marginal law `ν` have joint law
`ν × ... × ν`.
-/
theorem durrett2019_theorem_2_1_11_iid_hasLaw_pi
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} [Fintype ι]
    {P : Measure Ω}
    {S : Type*} [MeasurableSpace S]
    {X : ι -> Ω -> S} {ν : Measure S}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (μ := P) X)
    (hX_law : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) ν P) :
    _root_.ProbabilityTheory.HasLaw (fun ω i => X i ω)
      (Measure.pi fun _ : ι => ν) P := by
  exact durrett2019_theorem_2_1_11_iIndepFun_hasLaw_pi
    (P := P) (S := fun _ : ι => S) (X := X)
    (ν := fun _ : ι => ν) hX_indep hX_law

/--
Durrett 2019, Theorem 2.1.11 finite-family product-law criterion.

For a finite family on a probability space, independence is equivalent to the
joint law being the finite product of the marginal laws.
-/
theorem durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} [Fintype ι]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {S : ι -> Type*} [∀ i, MeasurableSpace (S i)]
    {X : ∀ i, Ω -> S i} {ν : ∀ i, Measure (S i)}
    (hX_law : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) (ν i) P) :
    _root_.ProbabilityTheory.iIndepFun (μ := P) X ↔
      _root_.ProbabilityTheory.HasLaw (fun ω i => X i ω) (Measure.pi ν) P := by
  exact _root_.ProbabilityTheory.iIndepFun_iff_hasLaw_pi_pi hX_law

/--
Durrett 2019, Theorem 2.1.11, iid finite-family product-law criterion.

For a finite family with common law `ν`, independence is equivalent to the
joint law being the finite product `ν × ... × ν`.
-/
theorem durrett2019_theorem_2_1_11_iid_iff_hasLaw_pi
    {Ω : Type u} [MeasurableSpace Ω] {ι : Type v} [Fintype ι]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {S : Type*} [MeasurableSpace S]
    {X : ι -> Ω -> S} {ν : Measure S}
    (hX_law : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) ν P) :
    _root_.ProbabilityTheory.iIndepFun (μ := P) X ↔
      _root_.ProbabilityTheory.HasLaw (fun ω i => X i ω)
        (Measure.pi fun _ : ι => ν) P := by
  exact durrett2019_theorem_2_1_11_iIndepFun_iff_hasLaw_pi
    (P := P) (S := fun _ : ι => S) (X := X)
    (ν := fun _ : ι => ν) hX_law

/--
Durrett 2019, Theorem 2.1.11, canonical iid product-space coordinates.

On the finite product probability space `ν × ... × ν`, the coordinate
projections are independent, have common law `ν`, and have joint product law.
-/
theorem durrett2019_theorem_2_1_11_canonical_iid_product_coordinates
    {ι : Type v} [Fintype ι]
    {S : Type u} [MeasurableSpace S]
    (ν : MeasureTheory.ProbabilityMeasure S) :
    (∀ i,
      _root_.ProbabilityTheory.HasLaw
        (fun sample : (ι -> S) => sample i) (ν : Measure S)
        (Measure.pi fun _ : ι => (ν : Measure S))) ∧
      _root_.ProbabilityTheory.iIndepFun
        (fun i => fun sample : (ι -> S) => sample i)
        (Measure.pi fun _ : ι => (ν : Measure S)) ∧
      _root_.ProbabilityTheory.HasLaw
        (fun sample : (ι -> S) => sample)
        (Measure.pi fun _ : ι => (ν : Measure S))
        (Measure.pi fun _ : ι => (ν : Measure S)) :=
  StatInference.ProbabilityMeasure.probability_pi_iid_coordinates_with_joint_law ν

/--
Durrett 2019, Theorem 2.1.12 product-measure/Fubini form.

This is the reusable product-measure integral identity behind the independent
pair expectation formula.
-/
theorem durrett2019_theorem_2_1_12_product_integral
    {S : Type u} [MeasurableSpace S]
    {T : Type v} [MeasurableSpace T]
    {E : Type w} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {ν : Measure S} {κ : Measure T} [SFinite ν] [SFinite κ]
    (f : S × T -> E) (hf : Integrable f (ν.prod κ)) :
    ∫ z, f z ∂ν.prod κ = ∫ x, ∫ y, f (x, y) ∂κ ∂ν := by
  exact StatInference.ProbabilityMeasure.integral_prod f hf

/--
Durrett 2019, Theorem 2.1.12, nonnegative independent-pair expectation form.

The joint law of `(X, Y)` is `μ.prod ν`, so Tonelli gives the iterated
integral display in Durrett's statement.
-/
theorem durrett2019_theorem_2_1_12_indepFun_lintegral_pair
    {Ω : Type u} [MeasurableSpace Ω]
    {S : Type v} [MeasurableSpace S]
    {T : Type w} [MeasurableSpace T]
    {P : Measure Ω} [IsFiniteMeasure P]
    {μ : Measure S} {ν : Measure T} [SFinite ν]
    {X : Ω -> S} {Y : Ω -> T}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X μ P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P)
    {h : S × T -> ℝ≥0∞} (hh : AEMeasurable h (μ.prod ν)) :
    ∫⁻ ω, h (X ω, Y ω) ∂P =
      ∫⁻ x, ∫⁻ y, h (x, y) ∂ν ∂μ := by
  have hpair :
      _root_.ProbabilityTheory.HasLaw (fun ω => (X ω, Y ω)) (μ.prod ν) P :=
    hXY.hasLaw_prod hX hY
  calc
    ∫⁻ ω, h (X ω, Y ω) ∂P =
        ∫⁻ z, h z ∂μ.prod ν := by
      simpa [Function.comp_def] using hpair.lintegral_comp hh
    _ = ∫⁻ x, ∫⁻ y, h (x, y) ∂ν ∂μ :=
      StatInference.ProbabilityMeasure.lintegral_prod hh

/--
Durrett 2019, Theorem 2.1.12, integrable independent-pair expectation form.

This is the Bochner-integral version of the displayed formula
`E h(X,Y) = ∫∫ h(x,y) μ(dx) ν(dy)`.
-/
theorem durrett2019_theorem_2_1_12_indepFun_integral_pair
    {Ω : Type u} [MeasurableSpace Ω]
    {S : Type v} [MeasurableSpace S]
    {T : Type w} [MeasurableSpace T]
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {P : Measure Ω} [IsFiniteMeasure P]
    {μ : Measure S} {ν : Measure T} [SFinite μ] [SFinite ν]
    {X : Ω -> S} {Y : Ω -> T}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X μ P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P)
    {h : S × T -> E} (hh : Integrable h (μ.prod ν)) :
    ∫ ω, h (X ω, Y ω) ∂P =
      ∫ x, ∫ y, h (x, y) ∂ν ∂μ := by
  have hpair :
      _root_.ProbabilityTheory.HasLaw (fun ω => (X ω, Y ω)) (μ.prod ν) P :=
    hXY.hasLaw_prod hX hY
  calc
    ∫ ω, h (X ω, Y ω) ∂P =
        ∫ z, h z ∂μ.prod ν := by
      simpa [Function.comp_def] using
        hpair.integral_comp hh.aestronglyMeasurable
    _ = ∫ x, ∫ y, h (x, y) ∂ν ∂μ :=
      durrett2019_theorem_2_1_12_product_integral h hh

/--
Durrett 2019, Theorem 2.1.12, separated product-expectation form.
-/
theorem durrett2019_theorem_2_1_12_product_integral_mul
    {S : Type u} [MeasurableSpace S]
    {T : Type v} [MeasurableSpace T]
    {𝕜 : Type*} [RCLike 𝕜]
    (ν : MeasureTheory.ProbabilityMeasure S)
    (κ : MeasureTheory.ProbabilityMeasure T)
    (f : S -> 𝕜) (g : T -> 𝕜) :
    ∫ z, f z.1 * g z.2 ∂((ν : Measure S).prod (κ : Measure T)) =
      (∫ x, f x ∂(ν : Measure S)) * ∫ y, g y ∂(κ : Measure T) := by
  exact StatInference.ProbabilityMeasure.probability_integral_prod_mul
    ν κ f g

/--
Durrett 2019, Theorem 2.1.13, two-variable expectation factorization.
-/
theorem durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral
    {Ω : Type u} {𝕜 : Type v} [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X Y : Ω -> 𝕜}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : AEStronglyMeasurable X P)
    (hY : AEStronglyMeasurable Y P) :
    ∫ ω, X ω * Y ω ∂P = (∫ ω, X ω ∂P) * ∫ ω, Y ω ∂P := by
  exact StatInference.ProbabilityMeasure.indepFun_integral_mul_eq_mul_integral
    hXY hX hY

/--
Durrett 2019, Theorem 2.1.13, finite-family expectation factorization.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_prod_eq_prod_integral
    {Ω : Type u} {𝕜 : Type v} {ι : Type w}
    [RCLike 𝕜] [Fintype ι] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ι -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P) :
    ∫ ω, ∏ i, X i ω ∂P = ∏ i, ∫ ω, X i ω ∂P := by
  exact StatInference.ProbabilityMeasure.iIndepFun_integral_prod_eq_prod_integral
    hX mX

/--
Durrett 2019, Theorem 2.1.13, finite-subfamily expectation factorization.

This is the finite-set consumer form used when products are taken only over a
selected block of independent random variables.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_prod_integral
    {Ω : Type u} {𝕜 : Type v} {ι : Type w}
    [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ι -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P)
    (s : Finset ι) :
    ∫ ω, ∏ i ∈ s, X i ω ∂P = ∏ i ∈ s, ∫ ω, X i ω ∂P := by
  have hrestrict : _root_.ProbabilityTheory.iIndepFun (s.restrict X) P :=
    hX.restrict s
  have hmeas : ∀ i : s, AEStronglyMeasurable (s.restrict X i) P := fun i =>
    mX i
  have hfactor :=
    durrett2019_theorem_2_1_13_iIndepFun_integral_prod_eq_prod_integral
      (P := P) (X := s.restrict X) hrestrict hmeas
  calc
    ∫ ω, ∏ i ∈ s, X i ω ∂P =
        ∫ ω, ∏ i ∈ s.attach, X i ω ∂P := by
      congr with ω
      simpa using (Finset.prod_attach s (fun i : ι => X i ω)).symm
    _ = ∏ i ∈ s.attach, ∫ ω, X i ω ∂P := by
      simpa [Finset.restrict] using hfactor
    _ = ∏ i ∈ s, ∫ ω, X i ω ∂P := by
      simpa using (Finset.prod_attach s (fun i : ι => ∫ ω, X i ω ∂P))

/--
Durrett 2019, Theorem 2.1.13, zero-mean finite-product corollary.

If one factor in a finite independent product has expectation zero, then the
expectation of the whole product is zero.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_zero_of_integral_eq_zero
    {Ω : Type u} {𝕜 : Type v} {ι : Type w}
    [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ι -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P)
    {s : Finset ι} {i : ι} (hi : i ∈ s)
    (hzero : ∫ ω, X i ω ∂P = 0) :
    ∫ ω, ∏ j ∈ s, X j ω ∂P = 0 := by
  rw [durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_prod_integral
    (P := P) (X := X) hX mX s]
  exact Finset.prod_eq_zero hi hzero

/--
Durrett 2019, Theorem 2.1.13, initial-range product expectation
factorization.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_range_prod_eq_prod_integral
    {Ω : Type u} {𝕜 : Type v}
    [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ℕ -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P)
    (n : ℕ) :
    ∫ ω, ∏ i ∈ Finset.range n, X i ω ∂P =
      ∏ i ∈ Finset.range n, ∫ ω, X i ω ∂P :=
  durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_prod_integral
    (P := P) (X := X) hX mX (Finset.range n)

/--
Durrett 2019, Theorem 2.1.13, zero-mean initial-range product corollary.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_range_prod_eq_zero_of_integral_eq_zero
    {Ω : Type u} {𝕜 : Type v}
    [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ℕ -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P)
    {n i : ℕ} (hi : i ∈ Finset.range n)
    (hzero : ∫ ω, X i ω ∂P = 0) :
    ∫ ω, ∏ j ∈ Finset.range n, X j ω ∂P = 0 :=
  durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_zero_of_integral_eq_zero
    (P := P) (X := X) hX mX hi hzero

/--
Durrett 2019, Theorem 2.1.13, interval-block expectation factorization.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_Ico_prod_eq_prod_integral
    {Ω : Type u} {𝕜 : Type v}
    [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ℕ -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P)
    (m n : ℕ) :
    ∫ ω, ∏ i ∈ Finset.Ico m n, X i ω ∂P =
      ∏ i ∈ Finset.Ico m n, ∫ ω, X i ω ∂P :=
  durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_prod_integral
    (P := P) (X := X) hX mX (Finset.Ico m n)

/--
Durrett 2019, Theorem 2.1.13, zero-mean interval-block corollary.
-/
theorem durrett2019_theorem_2_1_13_iIndepFun_integral_Ico_prod_eq_zero_of_integral_eq_zero
    {Ω : Type u} {𝕜 : Type v}
    [RCLike 𝕜] [MeasurableSpace Ω]
    {P : Measure Ω} {X : ℕ -> Ω -> 𝕜}
    (hX : _root_.ProbabilityTheory.iIndepFun X P)
    (mX : ∀ i, AEStronglyMeasurable (X i) P)
    {m n i : ℕ} (hi : i ∈ Finset.Ico m n)
    (hzero : ∫ ω, X i ω ∂P = 0) :
    ∫ ω, ∏ j ∈ Finset.Ico m n, X j ω ∂P = 0 :=
  durrett2019_theorem_2_1_13_iIndepFun_integral_finset_prod_eq_zero_of_integral_eq_zero
    (P := P) (X := X) hX mX hi hzero

/--
Durrett 2019, Theorem 2.1.15, product-space CDF convolution form.

For independent coordinates with laws `μ` and `ν`, the distribution function
of the coordinate sum is the integral of the shifted first-coordinate CDF
against the second-coordinate law.
-/
theorem durrett2019_theorem_2_1_15_product_cdf_convolution
    {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (z : ℝ) :
    (μ.prod ν).real {p : ℝ × ℝ | p.1 + p.2 ≤ z} =
      ∫ y, ProbabilityTheory.cdf μ (z - y) ∂ν := by
  let s : Set (ℝ × ℝ) := {p : ℝ × ℝ | p.1 + p.2 ≤ z}
  have hs : MeasurableSet s := by
    dsimp [s]
    exact measurableSet_le (measurable_fst.add measurable_snd) measurable_const
  have hint :
      Integrable (fun p : ℝ × ℝ => s.indicator (fun _ => (1 : ℝ)) p)
        (μ.prod ν) :=
    (integrable_const (1 : ℝ)).indicator hs
  calc
    (μ.prod ν).real s =
        ∫ p, s.indicator (fun _ : ℝ × ℝ => (1 : ℝ)) p ∂μ.prod ν := by
      simpa using (integral_indicator_one (μ := μ.prod ν) hs).symm
    _ = ∫ y, ∫ x, s.indicator (fun _ : ℝ × ℝ => (1 : ℝ)) (x, y) ∂μ ∂ν :=
      MeasureTheory.integral_prod_symm _ hint
    _ = ∫ y, ProbabilityTheory.cdf μ (z - y) ∂ν := by
      refine integral_congr_ae ?_
      exact Eventually.of_forall fun y => by
        have hfun :
            (fun x : ℝ => s.indicator (fun _ : ℝ × ℝ => (1 : ℝ)) (x, y)) =
              fun x : ℝ => (Set.Iic (z - y)).indicator (fun _ : ℝ => (1 : ℝ)) x := by
          funext x
          have hiff : (x, y) ∈ s ↔ x ∈ Set.Iic (z - y) := by
            dsimp [s, Set.Iic]
            constructor <;> intro h <;> linarith
          by_cases hsxy : (x, y) ∈ s
          · have hx : x ∈ Set.Iic (z - y) := hiff.mp hsxy
            simp [Set.indicator_of_mem, hsxy, hx]
          · have hx : x ∉ Set.Iic (z - y) := fun hx => hsxy (hiff.mpr hx)
            simp [Set.indicator_of_notMem, hsxy, hx]
        calc
          ∫ x, s.indicator (fun _ : ℝ × ℝ => (1 : ℝ)) (x, y) ∂μ =
              ∫ x, (Set.Iic (z - y)).indicator (fun _ : ℝ => (1 : ℝ)) x ∂μ := by
            rw [hfun]
          _ = μ.real (Set.Iic (z - y)) := by
            simp
          _ = ProbabilityTheory.cdf μ (z - y) := by
            rw [ProbabilityTheory.cdf_eq_real]

/--
Durrett 2019, Theorem 2.1.15, independent-random-variable CDF convolution
form.

This is the source-facing version of Durrett's formula
`P(X + Y ≤ z) = ∫ F(z - y) dG(y)`, where `F` is the CDF of the law of `X`
and `G` is the law of `Y`.
-/
theorem durrett2019_theorem_2_1_15_indepFun_cdf_convolution
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    {X Y : Ω -> ℝ}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X μ P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P)
    (z : ℝ) :
    P.real {ω | X ω + Y ω ≤ z} =
      ∫ y, ProbabilityTheory.cdf μ (z - y) ∂ν := by
  letI : IsFiniteMeasure P := hX.isFiniteMeasure
  let S : Set (ℝ × ℝ) := {p : ℝ × ℝ | p.1 + p.2 ≤ z}
  have hS : MeasurableSet S := by
    dsimp [S]
    exact measurableSet_le (measurable_fst.add measurable_snd) measurable_const
  have hpair :
      _root_.ProbabilityTheory.HasLaw (fun ω => (X ω, Y ω)) (μ.prod ν) P :=
    hXY.hasLaw_prod hX hY
  have hpre :
      (fun ω => (X ω, Y ω)) ⁻¹' S = {ω | X ω + Y ω ≤ z} := by
    rfl
  calc
    P.real {ω | X ω + Y ω ≤ z} =
        (μ.prod ν).real S := by
      rw [← hpair.map_eq]
      rw [MeasureTheory.map_measureReal_apply_of_aemeasurable
        hpair.aemeasurable hS]
      rw [hpre]
    _ = ∫ y, ProbabilityTheory.cdf μ (z - y) ∂ν :=
      durrett2019_theorem_2_1_15_product_cdf_convolution (μ := μ) (ν := ν) z

/--
Durrett 2019, Theorem 2.1.16, first law-level handoff.

For independent real-valued random variables, the law of `X + Y` is the
additive convolution of the two laws.
-/
theorem durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_conv
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {μ ν : Measure ℝ} [SigmaFinite μ] [SigmaFinite ν]
    {X Y : Ω -> ℝ}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X μ P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P) :
    _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
      (MeasureTheory.Measure.conv μ ν) P := by
  simpa [MeasureTheory.Measure.conv] using
    _root_.ProbabilityTheory.IndepFun.hasLaw_fun_add hX hY hXY

/--
Durrett 2019, Theorem 2.1.16, absolute-continuity consequence of the
convolution law.

If the first summand law has a density with respect to Lebesgue measure, then
the convolution law also has a density.
-/
theorem durrett2019_theorem_2_1_16_conv_absolutelyContinuous_of_left_density
    {μ ν : Measure ℝ} [SigmaFinite μ] [SigmaFinite ν]
    (hμ : μ ≪ volume) :
    MeasureTheory.Measure.conv μ ν ≪ volume := by
  have hswap : MeasureTheory.Measure.conv ν μ ≪ volume :=
    MeasureTheory.Measure.conv_absolutelyContinuous (μ := ν) (ν := μ)
      (ρ := volume) hμ
  rw [MeasureTheory.Measure.conv_comm ν μ] at hswap
  exact hswap

/--
Durrett 2019, Theorem 2.1.16, source-facing density-existence handoff.

If `X` has a density and `Y` is independent of `X`, then the law of `X + Y`
is absolutely continuous with respect to Lebesgue measure.
-/
theorem durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {μ ν : Measure ℝ} [SigmaFinite μ] [SigmaFinite ν]
    {X Y : Ω -> ℝ}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X μ P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P)
    (hμ : μ ≪ volume) :
    Measure.map (fun ω => X ω + Y ω) P ≪ volume := by
  have hsum :
      _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
        (MeasureTheory.Measure.conv μ ν) P :=
    durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_conv
      (P := P) (μ := μ) (ν := ν) hXY hX hY
  rw [hsum.map_eq]
  exact durrett2019_theorem_2_1_16_conv_absolutelyContinuous_of_left_density
    (μ := μ) (ν := ν) hμ

/--
Durrett 2019, Theorem 2.1.16, real-density source version.

This packages the textbook phrase "`X` has density `f`" as the law
`volume.withDensity (fun x => ENNReal.ofReal (f x))`.
-/
theorem durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_real_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {ν : Measure ℝ} [SigmaFinite ν] {f : ℝ -> ℝ}
    {X Y : Ω -> ℝ}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X
      (volume.withDensity fun x => ENNReal.ofReal (f x)) P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P) :
    Measure.map (fun ω => X ω + Y ω) P ≪ volume :=
  durrett2019_theorem_2_1_16_sum_law_absolutelyContinuous_of_left_density
    (P := P) (μ := volume.withDensity fun x => ENNReal.ofReal (f x))
    (ν := ν) hXY hX hY
    (MeasureTheory.withDensity_absolutelyContinuous volume
      (fun x => ENNReal.ofReal (f x)))

/--
Durrett 2019, Theorem 2.1.16, supplied-density-formula handoff.

Once the Fubini calculation identifies the convolution measure with a supplied
density `h`, the independent sum immediately has that density.
-/
theorem durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_of_supplied_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {μ ν : Measure ℝ} [SigmaFinite μ] [SigmaFinite ν]
    {h : ℝ -> ℝ} {X Y : Ω -> ℝ}
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X μ P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P)
    (hdensity :
      MeasureTheory.Measure.conv μ ν =
        volume.withDensity (fun x => ENNReal.ofReal (h x))) :
    _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
      (volume.withDensity fun x => ENNReal.ofReal (h x)) P := by
  have hsum :
      _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
        (MeasureTheory.Measure.conv μ ν) P :=
    durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_conv
      (P := P) (μ := μ) (ν := ν) hXY hX hY
  simpa [hdensity] using hsum

/--
Durrett 2019, Theorem 2.1.16, measure-level Fubini density formula.

If the first law has density `f`, then its additive convolution with an
arbitrary s-finite measure `ν` has density
`x ↦ ∫⁻ y, f (x - y) ∂ν`.
-/
theorem durrett2019_theorem_2_1_16_conv_withDensity_left_lintegral
    {f : ℝ -> ℝ≥0∞} (hf : Measurable f)
    (ν : Measure ℝ) [SFinite ν] :
    MeasureTheory.Measure.conv (volume.withDensity f) ν =
      volume.withDensity (fun x => ∫⁻ y, f (x - y) ∂ν) := by
  refine Measure.ext_of_lintegral _ ?_
  intro φ hφ
  have hinner_meas :
      AEMeasurable (fun x : ℝ => ∫⁻ y, φ (x + y) ∂ν) volume := by
    exact
      (Measurable.lintegral_prod_right
        (show Measurable (Function.uncurry fun x y : ℝ => φ (x + y)) from
          hφ.comp (measurable_fst.add measurable_snd))).aemeasurable
  have hkernel_meas :
      AEMeasurable (fun x : ℝ => ∫⁻ y, f (x - y) ∂ν) volume := by
    exact
      (Measurable.lintegral_prod_right
        (show Measurable (Function.uncurry fun x y : ℝ => f (x - y)) from
          hf.comp (measurable_fst.sub measurable_snd))).aemeasurable
  have hprod_meas :
      AEMeasurable (Function.uncurry fun x y : ℝ => f x * φ (x + y))
        (volume.prod ν) := by
    exact
      ((hf.comp measurable_fst).mul
        (hφ.comp (measurable_fst.add measurable_snd))).aemeasurable
  have hsubprod_meas :
      AEMeasurable (Function.uncurry fun x y : ℝ => f (x - y) * φ x)
        (volume.prod ν) := by
    exact
      ((hf.comp (measurable_fst.sub measurable_snd)).mul
        (hφ.comp measurable_fst)).aemeasurable
  have hchange (y : ℝ) :
      ∫⁻ x, f x * φ (x + y) ∂volume =
        ∫⁻ x, f (x - y) * φ x ∂volume := by
    have h :=
      (lintegral_add_right_eq_self
        (μ := volume) (fun x : ℝ => f (x - y) * φ x) y)
    simpa [add_sub_cancel_right] using h
  calc
    ∫⁻ z, φ z ∂MeasureTheory.Measure.conv (volume.withDensity f) ν =
        ∫⁻ x, ∫⁻ y, φ (x + y) ∂ν ∂volume.withDensity f := by
      rw [MeasureTheory.Measure.lintegral_conv hφ]
    _ = ∫⁻ x, f x * (∫⁻ y, φ (x + y) ∂ν) ∂volume := by
      rw [lintegral_withDensity_eq_lintegral_mul₀ hf.aemeasurable hinner_meas]
      simp [Pi.mul_apply]
    _ = ∫⁻ x, ∫⁻ y, f x * φ (x + y) ∂ν ∂volume := by
      refine lintegral_congr fun x => ?_
      rw [lintegral_const_mul'' (f x) (by fun_prop)]
    _ = ∫⁻ y, ∫⁻ x, f x * φ (x + y) ∂volume ∂ν := by
      rw [lintegral_lintegral_swap hprod_meas]
    _ = ∫⁻ y, ∫⁻ x, f (x - y) * φ x ∂volume ∂ν := by
      refine lintegral_congr hchange
    _ = ∫⁻ x, ∫⁻ y, f (x - y) * φ x ∂ν ∂volume := by
      rw [lintegral_lintegral_swap hsubprod_meas]
    _ = ∫⁻ x, (∫⁻ y, f (x - y) ∂ν) * φ x ∂volume := by
      refine lintegral_congr fun x => ?_
      rw [lintegral_mul_const'' (φ x) (by fun_prop)]
    _ = ∫⁻ z, φ z ∂volume.withDensity (fun x => ∫⁻ y, f (x - y) ∂ν) := by
      rw [lintegral_withDensity_eq_lintegral_mul₀ hkernel_meas hφ.aemeasurable]
      simp [Pi.mul_apply]

/--
Durrett 2019, Theorem 2.1.16, independent-sum density formula in
`ℝ≥0∞` form.
-/
theorem durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_lintegral_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {ν : Measure ℝ} [SigmaFinite ν] {f : ℝ -> ℝ≥0∞}
    [SigmaFinite (volume.withDensity f)]
    {X Y : Ω -> ℝ}
    (hf : Measurable f)
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X (volume.withDensity f) P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P) :
    _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
      (volume.withDensity fun x => ∫⁻ y, f (x - y) ∂ν) P := by
  have hsum :
      _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
        (MeasureTheory.Measure.conv (volume.withDensity f) ν) P :=
    durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_conv
      (P := P) (μ := volume.withDensity f) (ν := ν) hXY hX hY
  simpa [durrett2019_theorem_2_1_16_conv_withDensity_left_lintegral
    (f := f) hf ν] using hsum

/--
Durrett 2019, Theorem 2.1.16, independent-sum density formula for a
real-valued nonnegative density encoded by `ENNReal.ofReal`.
-/
theorem durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_real_lintegral_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {ν : Measure ℝ} [SigmaFinite ν] {f : ℝ -> ℝ}
    {X Y : Ω -> ℝ}
    (hf : Measurable f)
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X
      (volume.withDensity fun x => ENNReal.ofReal (f x)) P)
    (hY : _root_.ProbabilityTheory.HasLaw Y ν P) :
    _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
      (volume.withDensity fun x =>
        ∫⁻ y, ENNReal.ofReal (f (x - y)) ∂ν) P :=
  durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_lintegral_density
    (P := P) (ν := ν) (f := fun x => ENNReal.ofReal (f x))
    hf.ennreal_ofReal hXY hX hY

/--
Durrett 2019, Theorem 2.1.16, two-density kernel display.

When `Y` also has density `g`, integration with respect to `dG` becomes the
Lebesgue integral of `g y * f (x - y)`.
-/
theorem durrett2019_theorem_2_1_16_two_density_lintegral_kernel_eq
    {f g : ℝ -> ℝ≥0∞} (hf : Measurable f) (hg : Measurable g) (x : ℝ) :
    (∫⁻ y, f (x - y) ∂volume.withDensity g) =
      ∫⁻ y, g y * f (x - y) ∂volume := by
  have hkernel :
      AEMeasurable (fun y : ℝ => f (x - y)) volume :=
    (hf.comp (measurable_const.sub measurable_id)).aemeasurable
  rw [lintegral_withDensity_eq_lintegral_mul₀ hg.aemeasurable hkernel]
  simp [Pi.mul_apply]

/--
Durrett 2019, Theorem 2.1.16, independent-sum two-density formula in
`ℝ≥0∞` form.
-/
theorem durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_lintegral_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {f g : ℝ -> ℝ≥0∞}
    [SigmaFinite (volume.withDensity f)] [SigmaFinite (volume.withDensity g)]
    {X Y : Ω -> ℝ}
    (hf : Measurable f) (hg : Measurable g)
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X (volume.withDensity f) P)
    (hY : _root_.ProbabilityTheory.HasLaw Y (volume.withDensity g) P) :
    _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
      (volume.withDensity fun x => ∫⁻ y, g y * f (x - y) ∂volume) P := by
  have hsum :
      _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
        (volume.withDensity fun x =>
          ∫⁻ y, f (x - y) ∂volume.withDensity g) P :=
    durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_left_lintegral_density
      (P := P) (ν := volume.withDensity g) (f := f)
      hf hXY hX hY
  have hdensity :
      (fun x : ℝ => ∫⁻ y, f (x - y) ∂volume.withDensity g) =ᵐ[volume]
        fun x => ∫⁻ y, g y * f (x - y) ∂volume :=
    ae_of_all _ fun x =>
      durrett2019_theorem_2_1_16_two_density_lintegral_kernel_eq
        (f := f) (g := g) hf hg x
  have hmeasure :
      volume.withDensity (fun x => ∫⁻ y, f (x - y) ∂volume.withDensity g) =
        volume.withDensity (fun x => ∫⁻ y, g y * f (x - y) ∂volume) :=
    withDensity_congr_ae hdensity
  simpa [hmeasure] using hsum

/--
Durrett 2019, Theorem 2.1.16, independent-sum two-density formula for
real-valued nonnegative densities encoded by `ENNReal.ofReal`.
-/
theorem durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_real_lintegral_density
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {f g : ℝ -> ℝ} {X Y : Ω -> ℝ}
    (hf : Measurable f) (hg : Measurable g)
    (hXY : _root_.ProbabilityTheory.IndepFun (μ := P) X Y)
    (hX : _root_.ProbabilityTheory.HasLaw X
      (volume.withDensity fun x => ENNReal.ofReal (f x)) P)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (volume.withDensity fun x => ENNReal.ofReal (g x)) P) :
    _root_.ProbabilityTheory.HasLaw (fun ω => X ω + Y ω)
      (volume.withDensity fun x =>
        ∫⁻ y, ENNReal.ofReal (g y) * ENNReal.ofReal (f (x - y)) ∂volume) P :=
  durrett2019_theorem_2_1_16_indepFun_sum_hasLaw_two_lintegral_density
    (P := P) (f := fun x => ENNReal.ofReal (f x))
    (g := fun x => ENNReal.ofReal (g x))
    hf.ennreal_ofReal hg.ennreal_ofReal hXY hX hY

/-! ## Durrett, Section 2.2 -/

/--
Durrett 2019, Theorem 2.2.1, uncorrelated-pair covariance bridge.

The textbook definition of uncorrelatedness is
`E (X * Y) = E X * E Y`; mathlib's variance algebra is organized around
covariance, so this packages the translation.
-/
theorem durrett2019_theorem_2_2_1_uncorrelated_covariance_eq_zero
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X Y : Ω -> ℝ}
    (hX : MemLp X 2 P) (hY : MemLp Y 2 P)
    (huncorr : ∫ ω, X ω * Y ω ∂P = (∫ ω, X ω ∂P) * ∫ ω, Y ω ∂P) :
    _root_.ProbabilityTheory.covariance X Y P = 0 := by
  rw [_root_.ProbabilityTheory.covariance_eq_sub hX hY]
  simp [Pi.mul_apply, huncorr]

/--
Durrett 2019, Theorem 2.2.1, finite-sum variance formula for uncorrelated
families.

This is the source theorem `var (X_1 + ... + X_n) = sum_i var X_i`,
written for an arbitrary finite index set.
-/
theorem durrett2019_theorem_2_2_1_variance_finsetSum_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {ι : Type v} {X : ι -> Ω -> ℝ} {s : Finset ι}
    (hX : ∀ i ∈ s, MemLp (X i) 2 P)
    (huncorr :
      ∀ ⦃i : ι⦄, i ∈ s -> ∀ ⦃j : ι⦄, j ∈ s -> i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P) :
    _root_.ProbabilityTheory.variance (fun ω => ∑ i ∈ s, X i ω) P =
      ∑ i ∈ s, _root_.ProbabilityTheory.variance (X i) P := by
  have hsumfun : (fun ω => ∑ i ∈ s, X i ω) = (∑ i ∈ s, X i) := by
    ext ω
    simp [Finset.sum_apply]
  rw [hsumfun]
  rw [_root_.ProbabilityTheory.variance_sum' hX]
  refine Finset.sum_congr rfl fun i hi => ?_
  rw [← _root_.ProbabilityTheory.covariance_self (hX i hi).aemeasurable]
  refine Finset.sum_eq_single_of_mem i hi fun j hj hji => ?_
  exact durrett2019_theorem_2_2_1_uncorrelated_covariance_eq_zero
    (P := P) (X := X i) (Y := X j) (hX i hi) (hX j hj)
    (huncorr hi hj hji.symm)

/--
Durrett 2019, Theorem 2.2.1, initial-range variance formula for uncorrelated
families.
-/
theorem durrett2019_theorem_2_2_1_variance_rangeSum_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ}
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P)
    (huncorr :
      ∀ ⦃i : ℕ⦄, i ∈ Finset.range n -> ∀ ⦃j : ℕ⦄, j ∈ Finset.range n ->
        i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P) :
    _root_.ProbabilityTheory.variance (fun ω => ∑ i ∈ Finset.range n, X i ω) P =
      ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P :=
  durrett2019_theorem_2_2_1_variance_finsetSum_of_uncorrelated
    (P := P) (X := X) hX huncorr

/--
Durrett 2019, Theorem 2.2.1 support: independent square-integrable variables
are uncorrelated.
-/
theorem durrett2019_theorem_2_2_1_iIndepFun_integral_mul_eq_mul_integral
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {ι : Type v} {X : ι -> Ω -> ℝ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX_meas : ∀ i, AEStronglyMeasurable (X i) P)
    {i j : ι} (hij : i ≠ j) :
    ∫ ω, X i ω * X j ω ∂P =
      (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P :=
  durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral
    (P := P) (X := X i) (Y := X j) (hX_indep.indepFun hij)
    (hX_meas i) (hX_meas j)

/--
Durrett 2019, Theorem 2.2.1, finite-sum variance formula for independent
families.

This is the immediate independent-family specialization of the uncorrelated
variance formula.
-/
theorem durrett2019_theorem_2_2_1_variance_finsetSum_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {ι : Type v} {X : ι -> Ω -> ℝ} {s : Finset ι}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i ∈ s, MemLp (X i) 2 P) :
    _root_.ProbabilityTheory.variance (fun ω => ∑ i ∈ s, X i ω) P =
      ∑ i ∈ s, _root_.ProbabilityTheory.variance (X i) P := by
  refine durrett2019_theorem_2_2_1_variance_finsetSum_of_uncorrelated
    (P := P) (X := X) hX ?_
  intro i hi j hj hij
  exact durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral
    (P := P) (X := X i) (Y := X j) (hX_indep.indepFun hij)
    (hX i hi).aestronglyMeasurable (hX j hj).aestronglyMeasurable

/--
Durrett 2019, Theorem 2.2.1, initial-range variance formula for independent
families.
-/
theorem durrett2019_theorem_2_2_1_variance_rangeSum_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P) :
    _root_.ProbabilityTheory.variance (fun ω => ∑ i ∈ Finset.range n, X i ω) P =
      ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P :=
  durrett2019_theorem_2_2_1_variance_finsetSum_of_iIndepFun
    (P := P) (X := X) (s := Finset.range n) hX_indep hX

/--
Durrett 2019, Theorem 2.2.3 support: the variance scaling identity for the
sample average of an uncorrelated initial block.
-/
theorem durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_eq_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ}
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P)
    (huncorr :
      ∀ ⦃i : ℕ⦄, i ∈ Finset.range n -> ∀ ⦃j : ℕ⦄, j ∈ Finset.range n ->
        i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P) :
    _root_.ProbabilityTheory.variance
        (fun ω => (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω) P =
      ((n : ℝ)⁻¹) ^ 2 *
        ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P := by
  rw [_root_.ProbabilityTheory.variance_const_mul]
  rw [durrett2019_theorem_2_2_1_variance_rangeSum_of_uncorrelated
    (P := P) (X := X) hX huncorr]

/--
Durrett 2019, Theorem 2.2.3 support: if each variance in an uncorrelated
initial block is bounded by `C`, then `Var(S_n / n) <= C / n`.
-/
theorem durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_le_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ} {C : ℝ}
    (hn : 0 < n)
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P)
    (huncorr :
      ∀ ⦃i : ℕ⦄, i ∈ Finset.range n -> ∀ ⦃j : ℕ⦄, j ∈ Finset.range n ->
        i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P)
    (hvar : ∀ i ∈ Finset.range n,
      _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    _root_.ProbabilityTheory.variance
        (fun ω => (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω) P ≤
      C / n := by
  rw [durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_eq_of_uncorrelated
    (P := P) (X := X) hX huncorr]
  have hsum :
      ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P ≤
        (n : ℝ) * C := by
    calc
      ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P ≤
          ∑ i ∈ Finset.range n, C := by
            exact Finset.sum_le_sum fun i hi => hvar i hi
      _ = (n : ℝ) * C := by
            simp [Finset.sum_const, nsmul_eq_mul]
  calc
    ((n : ℝ)⁻¹) ^ 2 *
        ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P ≤
        ((n : ℝ)⁻¹) ^ 2 * ((n : ℝ) * C) := by
          exact mul_le_mul_of_nonneg_left hsum (sq_nonneg _)
    _ = C / n := by
          field_simp [Nat.cast_ne_zero.mpr hn.ne']

/--
Durrett 2019, Theorem 2.2.3 support: the variance scaling identity for the
sample average of an independent initial block.
-/
theorem durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_eq_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P) :
    _root_.ProbabilityTheory.variance
        (fun ω => (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω) P =
      ((n : ℝ)⁻¹) ^ 2 *
        ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P := by
  rw [_root_.ProbabilityTheory.variance_const_mul]
  rw [durrett2019_theorem_2_2_1_variance_rangeSum_of_iIndepFun
    (P := P) (X := X) hX_indep hX]

/--
Durrett 2019, Theorem 2.2.3 support: independent-family version of the
variance bound for `S_n / n`.
-/
theorem durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_le_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ} {C : ℝ}
    (hn : 0 < n)
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P)
    (hvar : ∀ i ∈ Finset.range n,
      _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    _root_.ProbabilityTheory.variance
        (fun ω => (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω) P ≤
      C / n := by
  rw [durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_eq_of_iIndepFun
    (P := P) (X := X) hX_indep hX]
  have hsum :
      ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P ≤
        (n : ℝ) * C := by
    calc
      ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P ≤
          ∑ i ∈ Finset.range n, C := by
            exact Finset.sum_le_sum fun i hi => hvar i hi
      _ = (n : ℝ) * C := by
            simp [Finset.sum_const, nsmul_eq_mul]
  calc
    ((n : ℝ)⁻¹) ^ 2 *
        ∑ i ∈ Finset.range n, _root_.ProbabilityTheory.variance (X i) P ≤
        ((n : ℝ)⁻¹) ^ 2 * ((n : ℝ) * C) := by
          exact mul_le_mul_of_nonneg_left hsum (sq_nonneg _)
    _ = C / n := by
          field_simp [Nat.cast_ne_zero.mpr hn.ne']

/--
Durrett 2019, Theorem 2.2.3 support: if every summand in an initial block has
mean `mu`, then the sample average has mean `mu`.
-/
theorem durrett2019_theorem_2_2_3_integral_invNatMul_rangeSum_eq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> Ω -> ℝ} {n : ℕ} {mu : ℝ}
    (hn : 0 < n)
    (hX_int : ∀ i ∈ Finset.range n, Integrable (X i) P)
    (hmean : ∀ i ∈ Finset.range n, ∫ ω, X i ω ∂P = mu) :
    ∫ ω, (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω ∂P = mu := by
  rw [integral_const_mul]
  rw [integral_finsetSum (Finset.range n) hX_int]
  have hsum :
      ∑ i ∈ Finset.range n, ∫ ω, X i ω ∂P = (n : ℝ) * mu := by
    calc
      ∑ i ∈ Finset.range n, ∫ ω, X i ω ∂P =
          ∑ i ∈ Finset.range n, mu := by
            exact Finset.sum_congr rfl fun i hi => hmean i hi
      _ = (n : ℝ) * mu := by
            simp [Finset.sum_const, nsmul_eq_mul]
  rw [hsum]
  field_simp [Nat.cast_ne_zero.mpr hn.ne']

/--
Durrett 2019, Theorem 2.2.3, source-facing `L^2` display from the
uncorrelated variance bound:
`E (S_n / n - mu)^2 <= C / n`.
-/
theorem durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ} {mu C : ℝ}
    (hn : 0 < n)
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P)
    (huncorr :
      ∀ ⦃i : ℕ⦄, i ∈ Finset.range n -> ∀ ⦃j : ℕ⦄, j ∈ Finset.range n ->
        i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P)
    (hmean : ∀ i ∈ Finset.range n, ∫ ω, X i ω ∂P = mu)
    (hvar : ∀ i ∈ Finset.range n,
      _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    ∫ ω, ((n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω - mu) ^ 2 ∂P ≤
      C / n := by
  let Y : Ω -> ℝ := fun ω => (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω
  have hY_mem : MemLp Y 2 P := by
    have hsum : MemLp (fun ω => ∑ i ∈ Finset.range n, X i ω) 2 P := by
      have hsumfun :
          (fun ω => ∑ i ∈ Finset.range n, X i ω) =
            (∑ i ∈ Finset.range n, X i) := by
        ext ω
        simp [Finset.sum_apply]
      rw [hsumfun]
      exact memLp_finsetSum' (Finset.range n) hX
    simpa [Y] using hsum.const_mul ((n : ℝ)⁻¹)
  have hY_mean : ∫ ω, Y ω ∂P = mu := by
    simpa [Y] using
      durrett2019_theorem_2_2_3_integral_invNatMul_rangeSum_eq
        (P := P) (X := X) (n := n) (mu := mu) hn
        (fun i hi => (hX i hi).integrable one_le_two) hmean
  have hY_var :
      _root_.ProbabilityTheory.variance Y P =
        ∫ ω, (Y ω - mu) ^ 2 ∂P := by
    rw [_root_.ProbabilityTheory.variance_eq_integral hY_mem.aemeasurable, hY_mean]
  have hbound :
      _root_.ProbabilityTheory.variance Y P ≤ C / n := by
    simpa [Y] using
      durrett2019_theorem_2_2_3_variance_invNatMul_rangeSum_le_of_uncorrelated
        (P := P) (X := X) (n := n) (C := C) hn hX huncorr hvar
  simpa [Y] using hY_var.symm.trans_le hbound

/--
Durrett 2019, Theorem 2.2.3, independent-family specialization of the
source-facing `L^2` display.
-/
theorem durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ} {mu C : ℝ}
    (hn : 0 < n)
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) 2 P)
    (hmean : ∀ i ∈ Finset.range n, ∫ ω, X i ω ∂P = mu)
    (hvar : ∀ i ∈ Finset.range n,
      _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    ∫ ω, ((n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, X i ω - mu) ^ 2 ∂P ≤
      C / n := by
  refine durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_uncorrelated
    (P := P) (X := X) (n := n) (mu := mu) (C := C) hn hX ?_ hmean hvar
  intro i hi j hj hij
  exact durrett2019_theorem_2_1_13_indepFun_integral_mul_eq_mul_integral
    (P := P) (X := X i) (Y := X j) (hX_indep.indepFun hij)
    (hX i hi).aestronglyMeasurable (hX j hj).aestronglyMeasurable

/--
Durrett 2019, Lemma 2.2.2, `L^2` specialization: convergence in `L^2`
implies convergence in probability, encoded by mathlib's `TendstoInMeasure`.
-/
theorem durrett2019_lemma_2_2_2_tendstoInMeasure_of_tendsto_eLpNorm_two
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : ℕ -> Ω -> ℝ}
    (hZ_meas : ∀ n, AEStronglyMeasurable (Z n) P)
    (hZ : Tendsto (fun n => eLpNorm (Z n) 2 P) atTop (𝓝 0)) :
    TendstoInMeasure P Z atTop (fun _ => 0) := by
  refine tendstoInMeasure_of_tendsto_eLpNorm (μ := P) (p := 2) (f := Z)
    (g := fun _ => 0) (by norm_num) hZ_meas ?_ ?_
  · exact aestronglyMeasurable_const
  · have hEq : (fun n => eLpNorm (Z n - fun x => 0) 2 P) =
        fun n => eLpNorm (Z n) 2 P := by
      ext n
      congr with x
      simp
    rw [hEq]
    exact hZ

/--
Durrett 2019, Theorem 2.2.3 support: once the centered averages converge to
zero in `L^2`, the sample averages converge to `mu` in probability.
-/
theorem durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_tendsto_eLpNorm_centered
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> Ω -> ℝ} {mu : ℝ}
    (havg_meas : ∀ (n : ℕ), AEStronglyMeasurable
      (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω) P)
    (hL2 : Tendsto
      (fun (n : ℕ) =>
        eLpNorm (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu) 2 P)
      atTop (𝓝 0)) :
    TendstoInMeasure P
      (fun (n : ℕ) ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω) atTop
      (fun _ => mu) := by
  refine tendstoInMeasure_of_tendsto_eLpNorm (μ := P) (p := 2)
    (f := fun (n : ℕ) ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω)
    (g := fun _ => mu) (by norm_num) havg_meas ?_ ?_
  · exact aestronglyMeasurable_const
  · simpa [Pi.sub_apply] using hL2

/--
Durrett 2019, Theorem 2.2.3 support: an ordinary second-moment bound controls
the real `L^2` seminorm.
-/
theorem durrett2019_theorem_2_2_3_lpNorm_two_le_sqrt_of_integral_sq_le
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : Ω -> ℝ} {B : ℝ}
    (hZ_meas : AEStronglyMeasurable Z P)
    (hbound : ∫ ω, (Z ω) ^ 2 ∂P ≤ B) :
    lpNorm Z (2 : ℝ≥0∞) P ≤ Real.sqrt B := by
  rw [MeasureTheory.lpNorm_eq_integral_norm_rpow_toReal (μ := P) (f := Z)
    (p := (2 : ℝ≥0∞)) (by norm_num) (by norm_num) hZ_meas]
  norm_num [Real.norm_eq_abs, sq_abs]
  rw [← Real.sqrt_eq_rpow]
  exact Real.sqrt_le_sqrt hbound

/--
Durrett 2019, Theorem 2.2.3 support: an ordinary second-moment bound controls
mathlib's extended `eLpNorm · 2`.
-/
theorem durrett2019_theorem_2_2_3_eLpNorm_two_le_sqrt_of_integral_sq_le
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : Ω -> ℝ} {B : ℝ}
    (hZ : MemLp Z (2 : ℝ≥0∞) P)
    (hbound : ∫ ω, (Z ω) ^ 2 ∂P ≤ B) :
    eLpNorm Z (2 : ℝ≥0∞) P ≤ ENNReal.ofReal (Real.sqrt B) := by
  rw [← MeasureTheory.ofReal_lpNorm hZ]
  exact ENNReal.ofReal_le_ofReal
    (durrett2019_theorem_2_2_3_lpNorm_two_le_sqrt_of_integral_sq_le
      (P := P) (Z := Z) hZ.aestronglyMeasurable hbound)

/--
Durrett 2019, Theorem 2.2.3 support: if the ordinary second moments are
eventually bounded by `C / n`, then the `L^2` seminorms converge to zero.
-/
theorem durrett2019_theorem_2_2_3_tendsto_eLpNorm_two_zero_of_integral_sq_le_const_div
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : ℕ -> Ω -> ℝ} {C : ℝ}
    (hZ : ∀ n, MemLp (Z n) (2 : ℝ≥0∞) P)
    (hbound : ∀ᶠ n in atTop, ∫ ω, (Z n ω) ^ 2 ∂P ≤ C / n) :
    Tendsto (fun n => eLpNorm (Z n) (2 : ℝ≥0∞) P) atTop (𝓝 0) := by
  have hdiv : Tendsto (fun n : ℕ => C / n) atTop (𝓝 (0 : ℝ)) :=
    tendsto_const_div_atTop_nhds_zero_nat C
  have hsqrtReal :
      Tendsto (fun n : ℕ => Real.sqrt (C / n)) atTop (𝓝 (0 : ℝ)) := by
    simpa only [Function.comp_apply, Real.sqrt_zero] using
      (Real.continuous_sqrt.continuousAt.tendsto.comp hdiv)
  have hsqrtENN :
      Tendsto (fun n : ℕ => ENNReal.ofReal (Real.sqrt (C / n))) atTop
        (𝓝 (0 : ℝ≥0∞)) := by
    simpa [ENNReal.ofReal_zero] using ENNReal.tendsto_ofReal hsqrtReal
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds
    hsqrtENN ?_ ?_
  · exact Eventually.of_forall fun n => by
      change (⊥ : ℝ≥0∞) ≤ eLpNorm (Z n) (2 : ℝ≥0∞) P
      exact bot_le
  · filter_upwards [hbound] with n hn
    exact durrett2019_theorem_2_2_3_eLpNorm_two_le_sqrt_of_integral_sq_le
      (P := P) (Z := Z n) (B := C / n) (hZ n) hn

/--
Durrett 2019, Lemma 2.2.2 support: ordinary second moments converging to zero
force the corresponding `L^2` seminorms to converge to zero.
-/
theorem durrett2019_lemma_2_2_2_tendsto_eLpNorm_two_zero_of_integral_sq_tendsto_zero
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : ℕ -> Ω -> ℝ}
    (hZ : ∀ n, MemLp (Z n) (2 : ℝ≥0∞) P)
    (hsq : Tendsto (fun n => ∫ ω, (Z n ω) ^ 2 ∂P) atTop (𝓝 (0 : ℝ))) :
    Tendsto (fun n => eLpNorm (Z n) (2 : ℝ≥0∞) P) atTop (𝓝 0) := by
  have hsqrtReal :
      Tendsto (fun n : ℕ => Real.sqrt (∫ ω, (Z n ω) ^ 2 ∂P)) atTop
        (𝓝 (0 : ℝ)) := by
    simpa only [Function.comp_apply, Real.sqrt_zero] using
      (Real.continuous_sqrt.continuousAt.tendsto.comp hsq)
  have hsqrtENN :
      Tendsto (fun n : ℕ =>
        ENNReal.ofReal (Real.sqrt (∫ ω, (Z n ω) ^ 2 ∂P))) atTop
        (𝓝 (0 : ℝ≥0∞)) := by
    simpa [ENNReal.ofReal_zero] using ENNReal.tendsto_ofReal hsqrtReal
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds
    hsqrtENN ?_ ?_
  · exact Eventually.of_forall fun n => by
      change (⊥ : ℝ≥0∞) ≤ eLpNorm (Z n) (2 : ℝ≥0∞) P
      exact bot_le
  · exact Eventually.of_forall fun n => by
      exact durrett2019_theorem_2_2_3_eLpNorm_two_le_sqrt_of_integral_sq_le
        (P := P) (Z := Z n) (B := ∫ ω, (Z n ω) ^ 2 ∂P) (hZ n) le_rfl

/--
Durrett 2019, Lemma 2.2.2 support: ordinary second moments converging to zero
give convergence in probability.
-/
theorem durrett2019_lemma_2_2_2_tendstoInMeasure_of_integral_sq_tendsto_zero
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {Z : ℕ -> Ω -> ℝ}
    (hZ : ∀ n, MemLp (Z n) (2 : ℝ≥0∞) P)
    (hsq : Tendsto (fun n => ∫ ω, (Z n ω) ^ 2 ∂P) atTop (𝓝 (0 : ℝ))) :
    TendstoInMeasure P Z atTop (fun _ => 0) :=
  durrett2019_lemma_2_2_2_tendstoInMeasure_of_tendsto_eLpNorm_two
    (P := P) (Z := Z) (fun n => (hZ n).aestronglyMeasurable)
    (durrett2019_lemma_2_2_2_tendsto_eLpNorm_two_zero_of_integral_sq_tendsto_zero
      (P := P) (Z := Z) hZ hsq)

/--
Durrett 2019, Theorem 2.2.3 support: finite sample averages of `L^2` variables
are in `L^2`.
-/
theorem durrett2019_theorem_2_2_3_average_memLp_two
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> Ω -> ℝ} {n : ℕ}
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) (2 : ℝ≥0∞) P) :
    MemLp (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω)
      (2 : ℝ≥0∞) P := by
  have hsum : MemLp (fun ω => ∑ i ∈ Finset.range n, X i ω)
      (2 : ℝ≥0∞) P := by
    have hsumfun :
        (fun ω => ∑ i ∈ Finset.range n, X i ω) =
          (∑ i ∈ Finset.range n, X i) := by
      ext ω
      simp [Finset.sum_apply]
    rw [hsumfun]
    exact memLp_finsetSum' (Finset.range n) hX
  simpa using hsum.const_mul ((n : ℝ)⁻¹)

/--
Durrett 2019, Theorem 2.2.3 support: centered finite sample averages of `L^2`
variables are in `L^2`.
-/
theorem durrett2019_theorem_2_2_3_centered_average_memLp_two
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsFiniteMeasure P]
    {X : ℕ -> Ω -> ℝ} {n : ℕ} {mu : ℝ}
    (hX : ∀ i ∈ Finset.range n, MemLp (X i) (2 : ℝ≥0∞) P) :
    MemLp (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu)
      (2 : ℝ≥0∞) P := by
  exact (durrett2019_theorem_2_2_3_average_memLp_two
    (P := P) (X := X) (n := n) hX).sub (memLp_const mu)

/--
Durrett 2019, Theorem 2.2.3 support: the `C / n` second-moment display for
centered averages gives the needed `L^2` convergence.
-/
theorem durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_integral_sq_bound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> Ω -> ℝ} {mu C : ℝ}
    (havg_centered : ∀ n : ℕ, MemLp
      (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu)
      (2 : ℝ≥0∞) P)
    (hbound : ∀ᶠ n : ℕ in atTop,
      ∫ ω, (((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu) ^ 2 ∂P ≤
        C / n) :
    Tendsto
      (fun n : ℕ =>
        eLpNorm (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu)
          (2 : ℝ≥0∞) P)
      atTop (𝓝 0) :=
  durrett2019_theorem_2_2_3_tendsto_eLpNorm_two_zero_of_integral_sq_le_const_div
    (P := P)
    (Z := fun n ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu)
    havg_centered hbound

/--
Durrett 2019, Theorem 2.2.3: uncorrelated variables with common mean and
uniformly bounded variance have centered sample averages converging to zero in
`L^2`.
-/
theorem durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {mu C : ℝ}
    (hX : ∀ i, MemLp (X i) (2 : ℝ≥0∞) P)
    (huncorr :
      ∀ ⦃i : ℕ⦄, ∀ ⦃j : ℕ⦄, i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P)
    (hmean : ∀ i, ∫ ω, X i ω ∂P = mu)
    (hvar : ∀ i, _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    Tendsto
      (fun n : ℕ =>
        eLpNorm (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu)
          (2 : ℝ≥0∞) P)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_integral_sq_bound
      (P := P) (X := X) (mu := mu) (C := C) ?_ ?_
  · intro n
    exact durrett2019_theorem_2_2_3_centered_average_memLp_two
      (P := P) (X := X) (n := n) (mu := mu) (fun i _ => hX i)
  · filter_upwards [eventually_gt_atTop (0 : ℕ)] with n hn
    exact durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_uncorrelated
      (P := P) (X := X) (n := n) (mu := mu) (C := C) hn
      (fun i _ => hX i)
      (by
        intro i _ j _ hij
        exact huncorr hij)
      (fun i _ => hmean i)
      (fun i _ => hvar i)

/--
Durrett 2019, Theorem 2.2.3: independent variables with common mean and
uniformly bounded variance have centered sample averages converging to zero in
`L^2`.
-/
theorem durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {mu C : ℝ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i, MemLp (X i) (2 : ℝ≥0∞) P)
    (hmean : ∀ i, ∫ ω, X i ω ∂P = mu)
    (hvar : ∀ i, _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    Tendsto
      (fun n : ℕ =>
        eLpNorm (fun ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω - mu)
          (2 : ℝ≥0∞) P)
      atTop (𝓝 0) := by
  refine
    durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_integral_sq_bound
      (P := P) (X := X) (mu := mu) (C := C) ?_ ?_
  · intro n
    exact durrett2019_theorem_2_2_3_centered_average_memLp_two
      (P := P) (X := X) (n := n) (mu := mu) (fun i _ => hX i)
  · filter_upwards [eventually_gt_atTop (0 : ℕ)] with n hn
    exact durrett2019_theorem_2_2_3_integral_sq_centered_average_le_of_iIndepFun
      (P := P) (X := X) (n := n) (mu := mu) (C := C) hn
      hX_indep
      (fun i _ => hX i)
      (fun i _ => hmean i)
      (fun i _ => hvar i)

/--
Durrett 2019, Theorem 2.2.3: uncorrelated variables with common mean and
uniformly bounded variance satisfy the weak law in probability.
-/
theorem durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_uncorrelated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {mu C : ℝ}
    (hX : ∀ i, MemLp (X i) (2 : ℝ≥0∞) P)
    (huncorr :
      ∀ ⦃i : ℕ⦄, ∀ ⦃j : ℕ⦄, i ≠ j ->
        ∫ ω, X i ω * X j ω ∂P =
          (∫ ω, X i ω ∂P) * ∫ ω, X j ω ∂P)
    (hmean : ∀ i, ∫ ω, X i ω ∂P = mu)
    (hvar : ∀ i, _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    TendstoInMeasure P
      (fun (n : ℕ) ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω) atTop
      (fun _ => mu) := by
  refine durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_tendsto_eLpNorm_centered
    (P := P) (X := X) (mu := mu) ?_ ?_
  · intro n
    exact (durrett2019_theorem_2_2_3_average_memLp_two
      (P := P) (X := X) (n := n) (fun i _ => hX i)).aestronglyMeasurable
  · exact durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_uncorrelated
      (P := P) (X := X) (mu := mu) (C := C) hX huncorr hmean hvar

/--
Durrett 2019, Theorem 2.2.3: independent variables with common mean and
uniformly bounded variance satisfy the weak law in probability.
-/
theorem durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> Ω -> ℝ} {mu C : ℝ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun X P)
    (hX : ∀ i, MemLp (X i) (2 : ℝ≥0∞) P)
    (hmean : ∀ i, ∫ ω, X i ω ∂P = mu)
    (hvar : ∀ i, _root_.ProbabilityTheory.variance (X i) P ≤ C) :
    TendstoInMeasure P
      (fun (n : ℕ) ω => ((n : ℝ)⁻¹) * ∑ i ∈ Finset.range n, X i ω) atTop
      (fun _ => mu) := by
  refine durrett2019_theorem_2_2_3_tendstoInMeasure_average_of_tendsto_eLpNorm_centered
    (P := P) (X := X) (mu := mu) ?_ ?_
  · intro n
    exact (durrett2019_theorem_2_2_3_average_memLp_two
      (P := P) (X := X) (n := n) (fun i _ => hX i)).aestronglyMeasurable
  · exact durrett2019_theorem_2_2_3_tendsto_eLpNorm_centered_average_of_iIndepFun
      (P := P) (X := X) (mu := mu) (C := C) hX_indep hX hmean hvar

/--
Durrett 2019, Theorem 2.2.6 support: the normalized centered square moment is
the variance divided by the square normalizer.
-/
theorem durrett2019_theorem_2_2_6_integral_sq_centered_div_eq_variance_div_sq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {S : ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (hS : ∀ n, MemLp (S n) (2 : ℝ≥0∞) P) (n : ℕ) :
    ∫ ω, ((S n ω - ∫ x, S n x ∂P) / b n) ^ 2 ∂P =
      _root_.ProbabilityTheory.variance (S n) P / (b n) ^ 2 := by
  have hfun :
      (fun ω => ((S n ω - ∫ x, S n x ∂P) / b n) ^ 2) =
        fun ω => ((b n)⁻¹) ^ 2 * (S n ω - ∫ x, S n x ∂P) ^ 2 := by
    ext ω
    ring
  rw [hfun]
  rw [integral_const_mul]
  rw [← _root_.ProbabilityTheory.variance_eq_integral (hS n).aemeasurable]
  by_cases hb : b n = 0
  · simp [hb]
  · field_simp [hb]

/--
Durrett 2019, Theorem 2.2.6: if `Var(S_n) / b_n^2 -> 0`, then the normalized
centered variables `(S_n - E S_n) / b_n` converge to zero in probability.
-/
theorem durrett2019_theorem_2_2_6_tendstoInMeasure_centered_div_of_variance_div_sq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {S : ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (hS : ∀ n, MemLp (S n) (2 : ℝ≥0∞) P)
    (hvar : Tendsto
      (fun n : ℕ => _root_.ProbabilityTheory.variance (S n) P / (b n) ^ 2)
      atTop (𝓝 (0 : ℝ))) :
    TendstoInMeasure P
      (fun n ω => (S n ω - ∫ x, S n x ∂P) / b n) atTop (fun _ => 0) := by
  let Z : ℕ -> Ω -> ℝ := fun n ω => (S n ω - ∫ x, S n x ∂P) / b n
  have hZ_mem : ∀ n, MemLp (Z n) (2 : ℝ≥0∞) P := by
    intro n
    have hcenter : MemLp (fun ω => S n ω - ∫ x, S n x ∂P) (2 : ℝ≥0∞) P :=
      (hS n).sub (memLp_const _)
    simpa [Z, div_eq_mul_inv, mul_comm] using hcenter.const_mul ((b n)⁻¹)
  have hsq : Tendsto (fun n : ℕ => ∫ ω, (Z n ω) ^ 2 ∂P) atTop
      (𝓝 (0 : ℝ)) := by
    exact hvar.congr' (Eventually.of_forall fun n =>
      (durrett2019_theorem_2_2_6_integral_sq_centered_div_eq_variance_div_sq
        (P := P) (S := S) (b := b) hS n).symm)
  exact durrett2019_lemma_2_2_2_tendstoInMeasure_of_integral_sq_tendsto_zero
    (P := P) (Z := Z) hZ_mem hsq

/--
Durrett 2019, Theorem 2.2.11, triangular-array truncation notation.

The textbook writes `bar X_{n,k} = X_{n,k} 1_{|X_{n,k}| <= b_n}`.  The Lean
row index is zero-based, so row `n` contains `k in Finset.range n`.
-/
noncomputable def durrett2019_theorem_2_2_11_truncated
    {Ω : Type u} (X : ℕ -> ℕ -> Ω -> ℝ) (b : ℕ -> ℝ)
    (n k : ℕ) : Ω -> ℝ :=
  Set.indicator {ω : Ω | |X n k ω| ≤ b n} (fun ω : Ω => X n k ω)

/--
Durrett 2019, Theorem 2.2.11 support: the truncation map on real values is
measurable.
-/
theorem durrett2019_theorem_2_2_11_measurable_truncationMap
    {c : ℝ} :
    Measurable (fun x : ℝ => Set.indicator {y : ℝ | |y| ≤ c} (fun y => y) x) := by
  exact measurable_id.indicator (measurableSet_le measurable_abs measurable_const)

/--
Durrett 2019, Theorem 2.2.11 support: each truncated array entry is measurable
when the original entry is.
-/
theorem durrett2019_theorem_2_2_11_measurable_truncated
    {Ω : Type u} [MeasurableSpace Ω]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n k : ℕ}
    (hX : Measurable (X n k)) :
    Measurable (durrett2019_theorem_2_2_11_truncated X b n k) := by
  have hcomp :
      Measurable
        ((fun x : ℝ => Set.indicator {y : ℝ | |y| ≤ b n} (fun y => y) x) ∘
          X n k) :=
    durrett2019_theorem_2_2_11_measurable_truncationMap.comp hX
  simpa [durrett2019_theorem_2_2_11_truncated, Function.comp_def] using hcomp

/--
Durrett 2019, Theorem 2.2.11 support: the truncated entry is bounded by the
absolute value of its truncation level.
-/
theorem durrett2019_theorem_2_2_11_norm_truncated_le_abs_bound
    {Ω : Type u} {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n k : ℕ}
    (ω : Ω) :
    ‖durrett2019_theorem_2_2_11_truncated X b n k ω‖ ≤ |b n| := by
  by_cases hsmall : |X n k ω| ≤ b n
  · have hbn_nonneg : 0 ≤ b n := le_trans (abs_nonneg _) hsmall
    simp [durrett2019_theorem_2_2_11_truncated, hsmall, Real.norm_eq_abs,
      abs_of_nonneg hbn_nonneg]
  · simp [durrett2019_theorem_2_2_11_truncated, hsmall]

/--
Durrett 2019, Theorem 2.2.11 support: measurable truncated entries are in
`L^2` on finite measure spaces.
-/
theorem durrett2019_theorem_2_2_11_truncated_memLp_two_of_measurable
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsFiniteMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n k : ℕ}
    (hX : Measurable (X n k)) :
    MemLp (durrett2019_theorem_2_2_11_truncated X b n k) (2 : ℝ≥0∞) P := by
  exact MemLp.of_bound
    (durrett2019_theorem_2_2_11_measurable_truncated
      (X := X) (b := b) (n := n) (k := k) hX).aestronglyMeasurable
    |b n| (Eventually.of_forall fun ω =>
      durrett2019_theorem_2_2_11_norm_truncated_le_abs_bound
        (X := X) (b := b) (n := n) (k := k) ω)

/--
Durrett 2019, Theorem 2.2.11 support: row-wise independence is preserved by
the truncation operation.
-/
theorem durrett2019_theorem_2_2_11_iIndepFun_truncated_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n : ℕ}
    (hX_indep : _root_.ProbabilityTheory.iIndepFun (fun k : ℕ => X n k) P) :
    _root_.ProbabilityTheory.iIndepFun
      (fun k : ℕ => durrett2019_theorem_2_2_11_truncated X b n k) P := by
  have hcomp :=
    durrett2019_theorem_2_1_10_iIndepFun_comp
      (P := P) (X := fun k : ℕ => X n k) hX_indep
      (f := fun _ : ℕ =>
        fun x : ℝ => Set.indicator {y : ℝ | |y| ≤ b n} (fun y => y) x)
      (fun _ => durrett2019_theorem_2_2_11_measurable_truncationMap)
  simpa [durrett2019_theorem_2_2_11_truncated, Function.comp_def] using hcomp

/--
Durrett 2019, Theorem 2.2.11, triangular-array row sum `S_n`.
-/
noncomputable def durrett2019_theorem_2_2_11_rowSum
    {Ω : Type u} (X : ℕ -> ℕ -> Ω -> ℝ) (n : ℕ) (ω : Ω) : ℝ :=
  ∑ k ∈ Finset.range n, X n k ω

/--
Durrett 2019, Theorem 2.2.11, truncated row sum `bar S_n`.
-/
noncomputable def durrett2019_theorem_2_2_11_truncatedRowSum
    {Ω : Type u} (X : ℕ -> ℕ -> Ω -> ℝ) (b : ℕ -> ℝ)
    (n : ℕ) (ω : Ω) : ℝ :=
  ∑ k ∈ Finset.range n, durrett2019_theorem_2_2_11_truncated X b n k ω

/--
Durrett 2019, Theorem 2.2.11 support: if no entry in a row exceeds its
truncation level, then the original and truncated row sums agree.
-/
theorem durrett2019_theorem_2_2_11_rowSum_eq_truncatedRowSum_of_all_small
    {Ω : Type u} {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    {n : ℕ} {ω : Ω}
    (hsmall : ∀ k ∈ Finset.range n, |X n k ω| ≤ b n) :
    durrett2019_theorem_2_2_11_rowSum X n ω =
      durrett2019_theorem_2_2_11_truncatedRowSum X b n ω := by
  unfold durrett2019_theorem_2_2_11_rowSum
    durrett2019_theorem_2_2_11_truncatedRowSum
  refine Finset.sum_congr rfl ?_
  intro k hk
  simp [durrett2019_theorem_2_2_11_truncated, hsmall k hk]

/--
Durrett 2019, Theorem 2.2.11 support: the event where `S_n` differs from
`bar S_n` is contained in the union of large-jump events.
-/
theorem durrett2019_theorem_2_2_11_rowSum_ne_truncatedRowSum_subset_tailUnion
    {Ω : Type u} {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n : ℕ} :
    {ω : Ω |
      durrett2019_theorem_2_2_11_rowSum X n ω ≠
        durrett2019_theorem_2_2_11_truncatedRowSum X b n ω} ⊆
      ⋃ k ∈ Finset.range n, {ω : Ω | b n < |X n k ω|} := by
  intro ω hne
  by_contra hnotmem
  have hsmall : ∀ k ∈ Finset.range n, |X n k ω| ≤ b n := by
    intro k hk
    exact le_of_not_gt (by
      intro hlt
      exact hnotmem (by
        exact Set.mem_iUnion.2 ⟨k, Set.mem_iUnion.2 ⟨hk, hlt⟩⟩))
  exact hne
    (durrett2019_theorem_2_2_11_rowSum_eq_truncatedRowSum_of_all_small
      (X := X) (b := b) hsmall)

/--
Durrett 2019, Theorem 2.2.11 support: union bound for the probability that
`S_n` and `bar S_n` differ.
-/
theorem durrett2019_theorem_2_2_11_probReal_rowSum_ne_truncatedRowSum_le_tailSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsFiniteMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n : ℕ} :
    P.real {ω : Ω |
      durrett2019_theorem_2_2_11_rowSum X n ω ≠
        durrett2019_theorem_2_2_11_truncatedRowSum X b n ω} ≤
      ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|} := by
  calc
    P.real {ω : Ω |
        durrett2019_theorem_2_2_11_rowSum X n ω ≠
          durrett2019_theorem_2_2_11_truncatedRowSum X b n ω} ≤
        P.real (⋃ k ∈ Finset.range n, {ω : Ω | b n < |X n k ω|}) := by
      exact measureReal_mono
        (durrett2019_theorem_2_2_11_rowSum_ne_truncatedRowSum_subset_tailUnion
          (X := X) (b := b) (n := n))
        (measure_ne_top P _)
    _ ≤ ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|} := by
      simpa using
        (measureReal_biUnion_finset_le (μ := P) (s := Finset.range n)
          (f := fun k => {ω : Ω | b n < |X n k ω|}))

/--
Durrett 2019, Theorem 2.2.11 support: hypothesis (i), the vanishing large-jump
probability sum, makes the difference `S_n - bar S_n` converge to zero in
probability.
-/
theorem durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_truncatedRowSum_of_tailSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (htail : Tendsto
      (fun n : ℕ => ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|})
      atTop (𝓝 (0 : ℝ))) :
    TendstoInMeasure P
      (fun n ω =>
        durrett2019_theorem_2_2_11_rowSum X n ω -
          durrett2019_theorem_2_2_11_truncatedRowSum X b n ω)
      atTop (fun _ => 0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_norm]
  intro ε hε
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds htail
    (fun _ => measureReal_nonneg) ?_
  intro n
  calc
    P.real {ω : Ω |
        ε ≤ ‖durrett2019_theorem_2_2_11_rowSum X n ω -
          durrett2019_theorem_2_2_11_truncatedRowSum X b n ω - 0‖} ≤
        P.real {ω : Ω |
          durrett2019_theorem_2_2_11_rowSum X n ω ≠
            durrett2019_theorem_2_2_11_truncatedRowSum X b n ω} := by
      refine measureReal_mono ?_ (measure_ne_top P _)
      intro ω hω heq
      have hnorm :
          ‖durrett2019_theorem_2_2_11_rowSum X n ω -
            durrett2019_theorem_2_2_11_truncatedRowSum X b n ω - 0‖ = 0 := by
        simp [heq]
      have hle_zero : ε ≤ 0 := by
        rw [← hnorm]
        exact hω
      exact (not_le_of_gt hε) hle_zero
    _ ≤ ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|} :=
      durrett2019_theorem_2_2_11_probReal_rowSum_ne_truncatedRowSum_le_tailSum
        (P := P) (X := X) (b := b) (n := n)

/--
Durrett 2019, Theorem 2.2.11, centering constant
`a_n = sum_k E bar X_{n,k}`.
-/
noncomputable def durrett2019_theorem_2_2_11_truncatedMeanRowSum
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (b : ℕ -> ℝ) (n : ℕ) : ℝ :=
  ∑ k ∈ Finset.range n,
    ∫ ω, durrett2019_theorem_2_2_11_truncated X b n k ω ∂P

/--
Durrett 2019, Theorem 2.2.11 support: the mean of the truncated row sum is
`a_n`.
-/
theorem durrett2019_theorem_2_2_11_integral_truncatedRowSum_eq_truncatedMeanRowSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n : ℕ}
    (htrunc_int : ∀ k ∈ Finset.range n,
      Integrable (durrett2019_theorem_2_2_11_truncated X b n k) P) :
    ∫ ω, durrett2019_theorem_2_2_11_truncatedRowSum X b n ω ∂P =
      durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n := by
  unfold durrett2019_theorem_2_2_11_truncatedRowSum
    durrett2019_theorem_2_2_11_truncatedMeanRowSum
  rw [integral_finsetSum (Finset.range n)]
  exact htrunc_int

/--
Durrett 2019, Theorem 2.2.11 support: finite truncated rows are in `L^2` when
their entries are.
-/
theorem durrett2019_theorem_2_2_11_truncatedRowSum_memLp_two
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n : ℕ}
    (htrunc_mem : ∀ k ∈ Finset.range n,
      MemLp (durrett2019_theorem_2_2_11_truncated X b n k) (2 : ℝ≥0∞) P) :
    MemLp (durrett2019_theorem_2_2_11_truncatedRowSum X b n)
      (2 : ℝ≥0∞) P := by
  have hsum : MemLp (fun ω => ∑ k ∈ Finset.range n,
      durrett2019_theorem_2_2_11_truncated X b n k ω) (2 : ℝ≥0∞) P := by
    have hsumfun :
        (fun ω => ∑ k ∈ Finset.range n,
          durrett2019_theorem_2_2_11_truncated X b n k ω) =
          (∑ k ∈ Finset.range n,
            durrett2019_theorem_2_2_11_truncated X b n k) := by
      ext ω
      simp [Finset.sum_apply]
    rw [hsumfun]
    exact memLp_finsetSum' (Finset.range n) htrunc_mem
  simpa [durrett2019_theorem_2_2_11_truncatedRowSum] using hsum

/--
Durrett 2019, Theorem 2.2.11 support: for an independent truncated row,
`Var(bar S_n)` is bounded by the summed second moments.
-/
theorem durrett2019_theorem_2_2_11_variance_truncatedRowSum_le_secondMomentSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ} {n : ℕ}
    (htrunc_indep : _root_.ProbabilityTheory.iIndepFun
      (fun k : ℕ => durrett2019_theorem_2_2_11_truncated X b n k) P)
    (htrunc_mem : ∀ k ∈ Finset.range n,
      MemLp (durrett2019_theorem_2_2_11_truncated X b n k) (2 : ℝ≥0∞) P) :
    _root_.ProbabilityTheory.variance
        (durrett2019_theorem_2_2_11_truncatedRowSum X b n) P ≤
      ∑ k ∈ Finset.range n,
        ∫ ω, (durrett2019_theorem_2_2_11_truncated X b n k ω) ^ 2 ∂P := by
  calc
    _root_.ProbabilityTheory.variance
        (durrett2019_theorem_2_2_11_truncatedRowSum X b n) P =
      ∑ k ∈ Finset.range n,
        _root_.ProbabilityTheory.variance
          (durrett2019_theorem_2_2_11_truncated X b n k) P := by
        simpa [durrett2019_theorem_2_2_11_truncatedRowSum] using
          durrett2019_theorem_2_2_1_variance_rangeSum_of_iIndepFun
            (P := P)
            (X := fun k : ℕ => durrett2019_theorem_2_2_11_truncated X b n k)
            (n := n) htrunc_indep htrunc_mem
    _ ≤ ∑ k ∈ Finset.range n,
        ∫ ω, (durrett2019_theorem_2_2_11_truncated X b n k ω) ^ 2 ∂P := by
      exact Finset.sum_le_sum fun k hk =>
        _root_.ProbabilityTheory.variance_le_expectation_sq
          (μ := P) (X := durrett2019_theorem_2_2_11_truncated X b n k)
          (htrunc_mem k hk).aestronglyMeasurable

/--
Durrett 2019, Theorem 2.2.11 support: hypothesis (ii) implies the normalized
variance condition for the truncated row sums.
-/
theorem durrett2019_theorem_2_2_11_variance_div_sq_tendsto_zero_of_truncatedSecondMoment
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (htrunc_indep : ∀ n : ℕ, _root_.ProbabilityTheory.iIndepFun
      (fun k : ℕ => durrett2019_theorem_2_2_11_truncated X b n k) P)
    (htrunc_mem : ∀ n k : ℕ,
      MemLp (durrett2019_theorem_2_2_11_truncated X b n k) (2 : ℝ≥0∞) P)
    (hsecond : Tendsto
      (fun n : ℕ =>
        (∑ k ∈ Finset.range n,
          ∫ ω, (durrett2019_theorem_2_2_11_truncated X b n k ω) ^ 2 ∂P) /
            (b n) ^ 2)
      atTop (𝓝 (0 : ℝ))) :
    Tendsto
      (fun n : ℕ => _root_.ProbabilityTheory.variance
        (durrett2019_theorem_2_2_11_truncatedRowSum X b n) P / (b n) ^ 2)
      atTop (𝓝 (0 : ℝ)) := by
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds
    hsecond ?_ ?_
  · exact Eventually.of_forall fun n =>
      div_nonneg (_root_.ProbabilityTheory.variance_nonneg _ _) (sq_nonneg _)
  · exact Eventually.of_forall fun n => by
      exact div_le_div_of_nonneg_right
        (durrett2019_theorem_2_2_11_variance_truncatedRowSum_le_secondMomentSum
          (P := P) (X := X) (b := b) (n := n)
          (htrunc_indep n) (fun k _ => htrunc_mem n k))
        (sq_nonneg _)

/--
Durrett 2019, Theorem 2.2.11 support: hypothesis (ii), together with row-wise
independence of the truncated variables, gives
`(bar S_n - a_n) / b_n -> 0` in probability.
-/
theorem durrett2019_theorem_2_2_11_tendstoInMeasure_truncatedRowSum_sub_mean_of_truncatedSecondMoment
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (htrunc_indep : ∀ n : ℕ, _root_.ProbabilityTheory.iIndepFun
      (fun k : ℕ => durrett2019_theorem_2_2_11_truncated X b n k) P)
    (htrunc_mem : ∀ n k : ℕ,
      MemLp (durrett2019_theorem_2_2_11_truncated X b n k) (2 : ℝ≥0∞) P)
    (hsecond : Tendsto
      (fun n : ℕ =>
        (∑ k ∈ Finset.range n,
          ∫ ω, (durrett2019_theorem_2_2_11_truncated X b n k ω) ^ 2 ∂P) /
            (b n) ^ 2)
      atTop (𝓝 (0 : ℝ))) :
    TendstoInMeasure P
      (fun n ω =>
        (durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
          durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n)
      atTop (fun _ => 0) := by
  have hrow_mem : ∀ n : ℕ,
      MemLp (durrett2019_theorem_2_2_11_truncatedRowSum X b n)
        (2 : ℝ≥0∞) P := by
    intro n
    exact durrett2019_theorem_2_2_11_truncatedRowSum_memLp_two
      (P := P) (X := X) (b := b) (n := n) (fun k _ => htrunc_mem n k)
  have hconv :=
    durrett2019_theorem_2_2_6_tendstoInMeasure_centered_div_of_variance_div_sq
      (P := P) (S := fun n =>
        durrett2019_theorem_2_2_11_truncatedRowSum X b n)
      (b := b) hrow_mem
      (durrett2019_theorem_2_2_11_variance_div_sq_tendsto_zero_of_truncatedSecondMoment
        (P := P) (X := X) (b := b) htrunc_indep htrunc_mem hsecond)
  simpa [durrett2019_theorem_2_2_11_integral_truncatedRowSum_eq_truncatedMeanRowSum
      (P := P) (X := X) (b := b)
      (fun k _ => (htrunc_mem _ k).integrable one_le_two)] using hconv

/--
Durrett 2019, Theorem 2.2.11 support: combine the large-jump replacement step
with convergence of the centered truncated row sums.
-/
theorem durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncated
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (htail : Tendsto
      (fun n : ℕ => ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|})
      atTop (𝓝 (0 : ℝ)))
    (htrunc : TendstoInMeasure P
      (fun n ω =>
        (durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
          durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n)
      atTop (fun _ => 0)) :
    TendstoInMeasure P
      (fun n ω =>
        (durrett2019_theorem_2_2_11_rowSum X n ω -
          durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n)
      atTop (fun _ => 0) := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_norm]
  intro ε hε
  have htrunc_event :=
    (MeasureTheory.tendstoInMeasure_iff_measureReal_norm.mp htrunc) ε hε
  have hsum : Tendsto
      (fun n : ℕ =>
        (∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|}) +
          P.real {ω : Ω |
            ε ≤ ‖(durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
              durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n - 0‖})
      atTop (𝓝 (0 + 0 : ℝ)) :=
    htail.add htrunc_event
  have hsum_zero : Tendsto
      (fun n : ℕ =>
        (∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|}) +
          P.real {ω : Ω |
            ε ≤ ‖(durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
              durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n - 0‖})
      atTop (𝓝 (0 : ℝ)) := by
    simpa using hsum
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hsum_zero
    (fun _ => measureReal_nonneg) ?_
  intro n
  calc
    P.real {ω : Ω |
        ε ≤ ‖(durrett2019_theorem_2_2_11_rowSum X n ω -
          durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n - 0‖} ≤
        P.real
          ({ω : Ω |
            durrett2019_theorem_2_2_11_rowSum X n ω ≠
              durrett2019_theorem_2_2_11_truncatedRowSum X b n ω} ∪
            {ω : Ω |
              ε ≤ ‖(durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
                durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n - 0‖}) := by
      refine measureReal_mono ?_ (measure_ne_top P _)
      intro ω hω
      by_cases hbad : durrett2019_theorem_2_2_11_rowSum X n ω ≠
          durrett2019_theorem_2_2_11_truncatedRowSum X b n ω
      · exact Or.inl hbad
      · right
        have heq : durrett2019_theorem_2_2_11_rowSum X n ω =
            durrett2019_theorem_2_2_11_truncatedRowSum X b n ω :=
          not_not.mp hbad
        simpa [heq] using hω
    _ ≤ P.real {ω : Ω |
            durrett2019_theorem_2_2_11_rowSum X n ω ≠
              durrett2019_theorem_2_2_11_truncatedRowSum X b n ω} +
          P.real {ω : Ω |
            ε ≤ ‖(durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
              durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n - 0‖} :=
      measureReal_union_le _ _
    _ ≤ (∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|}) +
          P.real {ω : Ω |
            ε ≤ ‖(durrett2019_theorem_2_2_11_truncatedRowSum X b n ω -
              durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n - 0‖} := by
      exact add_le_add
        (durrett2019_theorem_2_2_11_probReal_rowSum_ne_truncatedRowSum_le_tailSum
          (P := P) (X := X) (b := b) (n := n)) le_rfl

/--
Durrett 2019, Theorem 2.2.11 support: hypotheses (i) and (ii), with row-wise
independence and square-integrability for the truncated variables, imply the
centered triangular-row weak-law conclusion.
-/
theorem durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncatedSecondMoment
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (htail : Tendsto
      (fun n : ℕ => ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|})
      atTop (𝓝 (0 : ℝ)))
    (htrunc_indep : ∀ n : ℕ, _root_.ProbabilityTheory.iIndepFun
      (fun k : ℕ => durrett2019_theorem_2_2_11_truncated X b n k) P)
    (htrunc_mem : ∀ n k : ℕ,
      MemLp (durrett2019_theorem_2_2_11_truncated X b n k) (2 : ℝ≥0∞) P)
    (hsecond : Tendsto
      (fun n : ℕ =>
        (∑ k ∈ Finset.range n,
          ∫ ω, (durrett2019_theorem_2_2_11_truncated X b n k ω) ^ 2 ∂P) /
            (b n) ^ 2)
      atTop (𝓝 (0 : ℝ))) :
    TendstoInMeasure P
      (fun n ω =>
        (durrett2019_theorem_2_2_11_rowSum X n ω -
          durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n)
      atTop (fun _ => 0) :=
  durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncated
    (P := P) (X := X) (b := b) htail
    (durrett2019_theorem_2_2_11_tendstoInMeasure_truncatedRowSum_sub_mean_of_truncatedSecondMoment
      (P := P) (X := X) (b := b) htrunc_indep htrunc_mem hsecond)

/--
Durrett 2019, Theorem 2.2.11 source-facing bridge: original row-wise
independence and measurability discharge the truncated-row independence and
`L^2` side conditions in the compiled triangular-array weak-law assembly.
-/
theorem durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_iIndepFun
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {b : ℕ -> ℝ}
    (htail : Tendsto
      (fun n : ℕ => ∑ k ∈ Finset.range n, P.real {ω : Ω | b n < |X n k ω|})
      atTop (𝓝 (0 : ℝ)))
    (hX_indep : ∀ n : ℕ, _root_.ProbabilityTheory.iIndepFun
      (fun k : ℕ => X n k) P)
    (hX_meas : ∀ n k : ℕ, Measurable (X n k))
    (hsecond : Tendsto
      (fun n : ℕ =>
        (∑ k ∈ Finset.range n,
          ∫ ω, (durrett2019_theorem_2_2_11_truncated X b n k ω) ^ 2 ∂P) /
            (b n) ^ 2)
      atTop (𝓝 (0 : ℝ))) :
    TendstoInMeasure P
      (fun n ω =>
        (durrett2019_theorem_2_2_11_rowSum X n ω -
          durrett2019_theorem_2_2_11_truncatedMeanRowSum P X b n) / b n)
      atTop (fun _ => 0) :=
  durrett2019_theorem_2_2_11_tendstoInMeasure_rowSum_sub_mean_of_tailSum_and_truncatedSecondMoment
    (P := P) (X := X) (b := b) htail
    (fun n =>
      durrett2019_theorem_2_2_11_iIndepFun_truncated_of_iIndepFun
        (P := P) (X := X) (b := b) (n := n) (hX_indep n))
    (fun n k =>
      durrett2019_theorem_2_2_11_truncated_memLp_two_of_measurable
        (P := P) (X := X) (b := b) (n := n) (k := k) (hX_meas n k))
    hsecond

/-! ## Durrett, Section 2.3 -/

/--
Durrett 2019, Theorem 2.3.1, first Borel-Cantelli lemma.

If the sum of the probabilities of events is finite, then the limsup event has
probability zero.
-/
theorem durrett2019_theorem_2_3_1_borelCantelli_first
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : (∑' n, P (A n)) ≠ ∞) :
    P (limsup A atTop) = 0 := by
  exact StatInference.ProbabilityMeasure.measure_limsup_atTop_eq_zero hA

/--
Durrett 2019, Theorem 2.3.1, eventual-membership form.

Under the first Borel-Cantelli summability hypothesis, almost every point lies
in only finitely many of the events.
-/
theorem durrett2019_theorem_2_3_1_eventually_notMem
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA : (∑' n, P (A n)) ≠ ∞) :
    ∀ᵐ ω ∂P, ∀ᶠ n in atTop, ω ∉ A n := by
  exact StatInference.ProbabilityMeasure.ae_eventually_notMem hA

/--
Durrett 2019, Theorem 2.3.7, second Borel-Cantelli lemma.

For independent measurable events, divergent total probability forces the
limsup event to have probability one.
-/
theorem durrett2019_theorem_2_3_7_borelCantelli_second
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {A : ℕ -> Set Ω}
    (hA_meas : ∀ n, MeasurableSet (A n))
    (hA_indep : _root_.ProbabilityTheory.iIndepSet A P)
    (hA_sum : (∑' n, P (A n)) = ∞) :
    P (limsup A atTop) = 1 := by
  exact StatInference.ProbabilityMeasure.measure_limsup_eq_one
    hA_meas hA_indep hA_sum

/--
Durrett 2019, Theorem 2.4.1, strong law of large numbers, mathlib-backed
real-valued source wrapper.

This wrapper records the currently compiled local route to the strong law:
integrable identically distributed real-valued variables with pairwise
independence have empirical averages converging almost surely to the common
mean.  Durrett's Etemadi proof gives a source proof for pairwise independent
identically distributed variables; this declaration uses the existing local
`ProbabilityMeasure.strongLaw_ae_real` proof authority.
-/
theorem durrett2019_theorem_2_4_1_strongLaw_ae_real
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    (X : ℕ -> Ω -> ℝ)
    (hX_integrable : Integrable (X 0) P)
    (hX_indep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := P)) on X))
    (hX_ident : ∀ i, _root_.ProbabilityTheory.IdentDistrib (X i) (X 0) P P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ => (∑ i ∈ Finset.range n, X i ω) / n)
        atTop (𝓝 (∫ ω, X 0 ω ∂P)) := by
  exact StatInference.ProbabilityMeasure.strongLaw_ae_real
    X hX_integrable hX_indep hX_ident

/--
Durrett 2019, Theorem 2.4.1, centered empirical-average form.

This is the zero-limit version that later empirical-distribution and
Glivenko-Cantelli wrappers consume.
-/
theorem durrett2019_theorem_2_4_1_centeredStrongLaw_ae_real
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    (X : ℕ -> Ω -> ℝ)
    (hX_integrable : Integrable (X 0) P)
    (hX_indep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := P)) on X))
    (hX_ident : ∀ i, _root_.ProbabilityTheory.IdentDistrib (X i) (X 0) P P) :
    ∀ᵐ ω ∂P,
      Tendsto
        (fun n : ℕ =>
          (∑ i ∈ Finset.range n, X i ω) / n - ∫ ω, X 0 ω ∂P)
        atTop (𝓝 0) := by
  exact StatInference.ProbabilityMeasure.centeredStrongLaw_ae_real
    X hX_integrable hX_indep hX_ident

/--
Durrett 2019, Theorem 2.4.9, conditional half-line Glivenko-Cantelli handoff.

This packages the current verified route: once finite adjacent extended-real
endpoint grids exist at every positive `L1(P)` radius, the empirical CDF
half-line class is Glivenko-Cantelli for iid real observations.
-/
theorem durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_supplied_endpoint_grids
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X))
    (endpointGridExists :
      ∀ epsilon, 0 < epsilon ->
        ∃ cellCount, Nonempty
          (SuppliedERealHalfLineEndpointGrid P epsilon cellCount)) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X := by
  exact
    StatInference.vdVW_realHalfLine_glivenkoCantelli_of_suppliedERealHalfLineEndpointGrids
      X hLaw hindep endpointGridExists

/--
Durrett 2019, Theorem 2.4.9 middle-partition base case.

If a bounded interval already has CDF left-limit increment below the requested
radius, the one-cell middle partition `[a, b]` is a supplied middle CDF
partition.
-/
theorem durrett2019_theorem_2_4_9_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt
    {P : Measure ℝ} {epsilon a b : ℝ} (hab : a < b)
    (hinc :
      Function.leftLim (ProbabilityTheory.cdf P) b -
        ProbabilityTheory.cdf P a < epsilon) :
    ∃ middleCells, Nonempty
      (SuppliedRealMiddleCDFPartition P epsilon a b middleCells) :=
  exists_realMiddleCDFPartition_oneCell_of_cdf_leftLim_sub_lt hab hinc

/--
Durrett 2019, Theorem 2.4.9 middle-partition split step.

If a strict interior cutpoint splits a bounded interval into two pieces whose
CDF left-limit increments are below the requested radius, the endpoint list
`[a, c, b]` is a supplied middle CDF partition.
-/
theorem durrett2019_theorem_2_4_9_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt
    {P : Measure ℝ} {epsilon a c b : ℝ} (hac : a < c) (hcb : c < b)
    (hleft :
      Function.leftLim (ProbabilityTheory.cdf P) c -
        ProbabilityTheory.cdf P a < epsilon)
    (hright :
      Function.leftLim (ProbabilityTheory.cdf P) b -
        ProbabilityTheory.cdf P c < epsilon) :
    ∃ middleCells, Nonempty
      (SuppliedRealMiddleCDFPartition P epsilon a b middleCells) :=
  exists_realMiddleCDFPartition_twoCell_of_cdf_leftLim_sub_lt hac hcb hleft hright

/--
Durrett 2019, Theorem 2.4.9 middle-partition right-append step.

Once a supplied middle partition has been built up to a cutpoint `c`, a final
small CDF-increment cell `(c, b)` extends it to a supplied partition of
`[a, b]`.
-/
theorem durrett2019_theorem_2_4_9_realMiddleCDFPartition_snocCell_of_exists
    {P : Measure ℝ} {epsilon a c b : ℝ}
    (partitionExists :
      ∃ middleCells, Nonempty
        (SuppliedRealMiddleCDFPartition P epsilon a c middleCells))
    (hcb : c < b)
    (hinc :
      Function.leftLim (ProbabilityTheory.cdf P) b -
        ProbabilityTheory.cdf P c < epsilon) :
    ∃ nextCells, Nonempty
      (SuppliedRealMiddleCDFPartition P epsilon a b nextCells) :=
  exists_realMiddleCDFPartition_snocCell_of_exists partitionExists hcb hinc

/--
Durrett 2019, Theorem 2.4.9 middle-partition cutpoint-chain package.

A finite chain of strict cutpoints with small adjacent CDF left-limit
increments gives the supplied middle CDF partition needed by the
middle-partition-to-GC handoff.
-/
theorem durrett2019_theorem_2_4_9_realMiddleCDFPartition_of_cutpoint_chain
    {P : Measure ℝ} {epsilon a b : ℝ}
    (chain : SuppliedRealMiddleCDFPartitionChain P epsilon a b) :
    ∃ middleCells, Nonempty
      (SuppliedRealMiddleCDFPartition P epsilon a b middleCells) :=
  exists_realMiddleCDFPartition_of_cutpoint_chain chain

/--
Durrett 2019, Theorem 2.4.9 endpoint-grid-to-cutpoint-chain package.

After the source proof has chosen finitely many strict real endpoints with
small adjacent CDF left-limit increments, this wrapper packages them as the
cutpoint chain consumed by the middle-partition and GC handoffs.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid
    {P : Measure ℝ} {epsilon : ℝ} {cells : ℕ}
    (endpoint : Fin (cells + 2) -> ℝ)
    (hstrict : StrictMono endpoint)
    (hinc : ∀ cell : Fin (cells + 1),
      Function.leftLim (ProbabilityTheory.cdf P) (endpoint (Fin.succ cell)) -
        ProbabilityTheory.cdf P (endpoint (Fin.castSucc cell)) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon (endpoint 0)
      (endpoint (Fin.last (cells + 1))) :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_endpointGrid
    endpoint hstrict hinc

/--
Durrett 2019, Theorem 2.4.9 endpoint-grid refinement package.

Once the source proof has extracted a strict finite endpoint sequence from the
monotone subdivision, it is enough to show each closed adjacent cell lies in
one of the finite small-measure cover intervals.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_closed_cover_refinement
    {P : Measure ℝ} [IsProbabilityMeasure P] {epsilon : ℝ} {cells : ℕ}
    (endpoint : Fin (cells + 2) -> ℝ)
    (hstrict : StrictMono endpoint)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ cell : Fin (cells + 1),
      ∃ x ∈ centers,
        Set.Icc (endpoint (Fin.castSucc cell)) (endpoint (Fin.succ cell)) ⊆
          Set.Ioo (l x) (r x) ∧
        P.real (Set.Ioo (l x) (r x)) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon (endpoint 0)
      (endpoint (Fin.last (cells + 1))) :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_closed_cover_refinement
    endpoint hstrict hrefine

/--
Durrett 2019, Theorem 2.4.9 atom-aware endpoint-grid refinement package.

Once the source proof has extracted strict endpoints whose open adjacent cells
avoid the selected atom center inside a small punctured neighborhood, this
wrapper packages them as the cutpoint chain consumed by the GC handoff.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_punctured_cover_refinement
    {P : Measure ℝ} [IsProbabilityMeasure P] {epsilon : ℝ} {cells : ℕ}
    (endpoint : Fin (cells + 2) -> ℝ)
    (hstrict : StrictMono endpoint)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ cell : Fin (cells + 1),
      ∃ x ∈ centers,
        Set.Ioo (endpoint (Fin.castSucc cell)) (endpoint (Fin.succ cell)) ⊆
          Set.Ioo (l x) (r x) \ {x} ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon (endpoint 0)
      (endpoint (Fin.last (cells + 1))) :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_punctured_cover_refinement
    endpoint hstrict hrefine

/--
Durrett 2019, Theorem 2.4.9 atom-aware open-cover/avoidance package.

For a strict endpoint grid, it is enough to prove each open adjacent cell lies
inside one selected finite cover interval and avoids that interval's selected
center.  The punctured-cover handoff then gives the cutpoint chain.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_avoids_center_refinement
    {P : Measure ℝ} [IsProbabilityMeasure P] {epsilon : ℝ} {cells : ℕ}
    (endpoint : Fin (cells + 2) -> ℝ)
    (hstrict : StrictMono endpoint)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ cell : Fin (cells + 1),
      ∃ x ∈ centers,
        Set.Ioo (endpoint (Fin.castSucc cell)) (endpoint (Fin.succ cell)) ⊆
          Set.Ioo (l x) (r x) ∧
        x ∉ Set.Ioo (endpoint (Fin.castSucc cell)) (endpoint (Fin.succ cell)) ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon (endpoint 0)
      (endpoint (Fin.last (cells + 1))) :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_avoids_center_refinement
    endpoint hstrict hrefine

/--
Durrett 2019, Theorem 2.4.9 endpoint-center open-cover package.

If the selected center for each open adjacent cell is itself one of the strict
grid endpoints, then the center-avoidance condition is automatic and the
atom-aware open-cover handoff gives the cutpoint chain.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_endpointGrid_open_cover_endpoint_center_refinement
    {P : Measure ℝ} [IsProbabilityMeasure P] {epsilon : ℝ} {cells : ℕ}
    (endpoint : Fin (cells + 2) -> ℝ)
    (hstrict : StrictMono endpoint)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ cell : Fin (cells + 1),
      ∃ x ∈ centers, ∃ point : Fin (cells + 2),
        endpoint point = x ∧
        Set.Ioo (endpoint (Fin.castSucc cell)) (endpoint (Fin.succ cell)) ⊆
          Set.Ioo (l x) (r x) ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon (endpoint 0)
      (endpoint (Fin.last (cells + 1))) :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_endpointGrid_open_cover_endpoint_center_refinement
    endpoint hstrict hrefine

/--
Durrett 2019, Theorem 2.4.9 cutpoint-chain concatenation package.

This is the finite splitting primitive used by the arbitrary-law route: chains
proved on adjacent subintervals can be assembled into one chain on the whole
interval.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_append
    {P : Measure ℝ} {epsilon a b c : ℝ}
    (left : SuppliedRealMiddleCDFPartitionChain P epsilon a b)
    (right : SuppliedRealMiddleCDFPartitionChain P epsilon b c) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a c :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.append left right

/--
Durrett 2019, Theorem 2.4.9 punctured-cover subinterval CDF-increment bridge.

After a finite atom center has been inserted as a cutpoint, each strict
subinterval of the original subdivision cell inherits the original punctured
cover assignment and has small CDF left-limit increment once it avoids the
selected center.
-/
theorem durrett2019_theorem_2_4_9_cdfIncrement_of_subdivision_punctured_cover_subinterval
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b u v : ℝ} {t : ℕ -> Set.Icc a b} {n : ℕ}
    (huv : u < v)
    (hleft : (t n : ℝ) ≤ u)
    (hright : v ≤ (t (n + 1) : ℝ))
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine :
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        x ∉ Set.Ioo u v ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    Function.leftLim (ProbabilityTheory.cdf P) v -
      ProbabilityTheory.cdf P u < epsilon :=
  _root_.StatInference.cdf_leftLim_sub_lt_of_subdivision_punctured_cover_subinterval
    huv hleft hright hrefine

/--
Durrett 2019, Theorem 2.4.9 punctured-cover cell-splitting package.

One strict subdivision cell whose closed cell refines a selected punctured-cover
neighborhood already supplies a cutpoint chain: split at the selected center if
that center lies inside the cell, otherwise use the cell directly.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_subdivision_punctured_cover_cell
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {t : ℕ -> Set.Icc a b} {n : ℕ}
    (hlt : (t n : ℝ) < (t (n + 1) : ℝ))
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine :
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon (t n) (t (n + 1)) :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_subdivision_punctured_cover_cell
    hlt hrefine

/--
Durrett 2019, Theorem 2.4.9 strict-subdivision-prefix package.

After repeated values have been erased from the monotone subdivision, a strict
finite prefix ending at the right endpoint produces the cutpoint chain directly
from the inherited closed-cover assignments.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_strict_subdivision_prefix
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {cells : ℕ}
    {t : ℕ -> Set.Icc a b}
    (ht0 : (t 0 : ℝ) = a)
    (htlast : (t (cells + 1) : ℝ) = b)
    (hstrictStep : ∀ n ≤ cells, (t n : ℝ) < (t (n + 1) : ℝ))
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ n ≤ cells,
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x)) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_strict_subdivision_prefix_closed_cover
    ht0 htlast hstrictStep hrefine

/--
Durrett 2019, Theorem 2.4.9 extracted-subdivision-adjacency package.

After duplicate erasure has produced strict endpoints, it remains enough to
record which original adjacent subdivision cell realizes each strict gap. The
small closed-cover assignment for that original cell then gives the cutpoint
chain.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_extracted_subdivision_adjacencies
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {cells : ℕ}
    {t : ℕ -> Set.Icc a b}
    (endpoint : Fin (cells + 2) -> ℝ)
    (hzero : endpoint 0 = a)
    (hlast : endpoint (Fin.last (cells + 1)) = b)
    (hstrict : StrictMono endpoint)
    (origin : Fin (cells + 1) -> ℕ)
    (hleft : ∀ cell : Fin (cells + 1),
      endpoint (Fin.castSucc cell) = (t (origin cell) : ℝ))
    (hright : ∀ cell : Fin (cells + 1),
      endpoint (Fin.succ cell) = (t (origin cell + 1) : ℝ))
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ n,
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x)) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_extracted_subdivision_adjacencies_closed_cover
    endpoint hzero hlast hstrict origin hleft hright hrefine

/--
Durrett 2019, Theorem 2.4.9 monotone-subdivision package.

A monotone subdivision that is eventually constant at the right endpoint
directly produces the cutpoint chain: repeated adjacent values are skipped and
strict jumps are appended as CDF-increment cells.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {t : ℕ -> Set.Icc a b}
    (ht0 : (t 0 : ℝ) = a)
    (hmono : Monotone t)
    (heventually : ∃ m, ∀ n ≥ m, (t n : ℝ) = b)
    (hab : a < b)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ n,
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x)) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_closed_cover
    ht0 (fun i j hij => by simpa using hmono hij) heventually hab hrefine

/--
Durrett 2019, Theorem 2.4.9 endpoint-center monotone-subdivision package.

This atom-aware variant uses punctured finite-cover cells.  It is enough that
the selected center for each subdivision cell is itself a value of the monotone
subdivision; monotonicity then keeps that center out of the adjacent open cell.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_endpoint_center_cover
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {t : ℕ -> Set.Icc a b}
    (ht0 : (t 0 : ℝ) = a)
    (hmono : Monotone t)
    (heventually : ∃ m, ∀ n ≥ m, (t n : ℝ) = b)
    (hab : a < b)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ n,
      ∃ x ∈ centers, ∃ k : ℕ,
        (t k : ℝ) = x ∧
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_endpoint_center_cover
    ht0 (fun i j hij => by simpa using hmono hij) heventually hab hrefine

/--
Durrett 2019, Theorem 2.4.9 center-range monotone-subdivision package.

If every selected finite-cover center occurs somewhere in the monotone
subdivision, then the endpoint-center monotone-subdivision handoff can consume
ordinary cell refinement assignments into punctured cover neighborhoods.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {t : ℕ -> Set.Icc a b}
    (ht0 : (t 0 : ℝ) = a)
    (hmono : Monotone t)
    (heventually : ∃ m, ∀ n ≥ m, (t n : ℝ) = b)
    (hab : a < b)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hcenter : ∀ x ∈ centers, ∃ k : ℕ, (t k : ℝ) = x)
    (hrefine : ∀ n,
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_center_mem_cover
    ht0 (fun i j hij => by simpa using hmono hij) heventually hab hcenter hrefine

/--
Durrett 2019, Theorem 2.4.9 punctured-cover monotone-subdivision package.

This is the arbitrary-law chain handoff: a monotone subdivision with finite
punctured-cover assignments gives the cutpoint chain directly by splitting each
strict adjacent cell at its selected atom center when needed.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_punctured_cover
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} {t : ℕ -> Set.Icc a b}
    (ht0 : (t 0 : ℝ) = a)
    (hmono : Monotone t)
    (heventually : ∃ m, ∀ n ≥ m, (t n : ℝ) = b)
    (hab : a < b)
    {centers : Finset ℝ} {l r : ℝ -> ℝ}
    (hrefine : ∀ n,
      ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b :=
  _root_.StatInference.SuppliedRealMiddleCDFPartitionChain.of_monotone_eventually_constant_subdivision_punctured_cover
    ht0 (fun i j hij => by simpa using hmono hij) heventually hab hrefine

/--
Durrett 2019, Theorem 2.4.9 atom-aware local grid ingredient.

For locally finite real measures, every point has an open neighborhood whose
punctured version has small real measure.  This isolates the possible atom at
the center and is the local input for arbitrary-law endpoint selection.
-/
theorem durrett2019_theorem_2_4_9_punctured_small_open_interval
    {P : Measure ℝ} [IsFiniteMeasureOnCompacts P]
    {epsilon x : ℝ} (hepsilon : 0 < epsilon) :
    ∃ l r : ℝ, l < x ∧ x < r ∧ P.real (Set.Ioo l r \ {x}) < epsilon :=
  exists_realOpenInterval_diff_singleton_measureReal_lt P hepsilon

/--
Durrett 2019, Theorem 2.4.9 atom-aware compact-cover ingredient.

Every compact interval is covered by finitely many open neighborhoods whose
punctured versions have small real measure.  The selected centers are the
candidate atom endpoints for the arbitrary-distribution grid.
-/
theorem durrett2019_theorem_2_4_9_finite_punctured_open_interval_cover
    {P : Measure ℝ} [IsFiniteMeasureOnCompacts P]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) :
    ∃ centers : Finset ℝ, ∃ l r : ℝ -> ℝ,
      (∀ x ∈ centers, x ∈ Set.Icc a b) ∧
      (∀ x ∈ centers,
        l x < x ∧ x < r x ∧ P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) ∧
      Set.Icc a b ⊆ ⋃ x ∈ centers, Set.Ioo (l x) (r x) :=
  exists_finset_realOpenInterval_punctured_cover_Icc_measureReal_lt P hepsilon

/--
Durrett 2019, Theorem 2.4.9 atom-aware monotone-subdivision ingredient.

The finite punctured compact cover can be refined into a monotone subdivision
of the compact interval.  This packages the arbitrary-law compactness and
Lebesgue-number step; the remaining center-insertion step must prove the
selected centers occur as subdivision values.
-/
theorem durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover
    {P : Measure ℝ} [IsFiniteMeasureOnCompacts P]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) (hab : a ≤ b) :
    ∃ centers : Finset ℝ, ∃ l r : ℝ -> ℝ, ∃ t : ℕ -> Set.Icc a b,
      (∀ x ∈ centers, x ∈ Set.Icc a b) ∧
      (∀ x ∈ centers,
        l x < x ∧ x < r x ∧ P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) ∧
      (t 0 : ℝ) = a ∧
      Monotone t ∧
      (∃ m, ∀ n ≥ m, (t n : ℝ) = b) ∧
      ∀ n, ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon :=
  exists_monotone_subdivision_Icc_punctured_measureReal_lt P hepsilon hab

/--
Durrett 2019, Theorem 2.4.9 arbitrary-law cutpoint-chain package.

Finite punctured compact covers and the punctured-cover monotone-subdivision
chain handoff supply the finite cutpoint chain on every strict bounded
interval.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain
    {P : Measure ℝ} [IsProbabilityMeasure P]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) (hab : a < b) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b := by
  rcases durrett2019_theorem_2_4_9_monotone_subdivision_punctured_cover
      (P := P) hepsilon hab.le with
    ⟨centers, l, r, t, _hcenters, _hsmall, ht0, hmono, heventually, hrefine⟩
  exact
    durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_punctured_cover
      ht0 hmono heventually hab hrefine

/--
Durrett 2019, Theorem 2.4.9 non-atomic local grid ingredient.

For non-atomic locally finite real measures, every point has an open
neighborhood whose real measure is below any positive radius.  This is the
local compactness/continuity ingredient used by the finite endpoint-grid
construction before atom handling is added.
-/
theorem durrett2019_theorem_2_4_9_small_open_interval_of_noAtoms
    {P : Measure ℝ} [IsFiniteMeasureOnCompacts P] [NoAtoms P]
    {epsilon x : ℝ} (hepsilon : 0 < epsilon) :
    ∃ l r : ℝ, l < x ∧ x < r ∧ P.real (Set.Ioo l r) < epsilon :=
  exists_realOpenInterval_measureReal_lt_of_noAtoms P hepsilon

/--
Durrett 2019, Theorem 2.4.9 non-atomic compact-cover ingredient.

For non-atomic locally finite real measures, every compact interval is covered
by finitely many open intervals whose real measures are below any positive
radius.  The next endpoint-grid packet will order the selected endpoints.
-/
theorem durrett2019_theorem_2_4_9_finite_open_interval_cover_of_noAtoms
    {P : Measure ℝ} [IsFiniteMeasureOnCompacts P] [NoAtoms P]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) :
    ∃ centers : Finset ℝ, ∃ l r : ℝ -> ℝ,
      (∀ x ∈ centers, x ∈ Set.Icc a b) ∧
      (∀ x ∈ centers,
        l x < x ∧ x < r x ∧ P.real (Set.Ioo (l x) (r x)) < epsilon) ∧
      Set.Icc a b ⊆ ⋃ x ∈ centers, Set.Ioo (l x) (r x) :=
  exists_finset_realOpenInterval_cover_Icc_measureReal_lt_of_noAtoms P hepsilon

/--
Durrett 2019, Theorem 2.4.9 non-atomic monotone-subdivision ingredient.

The non-atomic compact cover can be refined into a monotone subdivision of the
compact interval.  The remaining endpoint-grid packet removes repeated
subdivision points and packages the strict real endpoint sequence.
-/
theorem durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms
    {P : Measure ℝ} [IsFiniteMeasureOnCompacts P] [NoAtoms P]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) (hab : a ≤ b) :
    ∃ centers : Finset ℝ, ∃ l r : ℝ -> ℝ, ∃ t : ℕ -> Set.Icc a b,
      (∀ x ∈ centers, x ∈ Set.Icc a b) ∧
      (∀ x ∈ centers,
        l x < x ∧ x < r x ∧ P.real (Set.Ioo (l x) (r x)) < epsilon) ∧
      (t 0 : ℝ) = a ∧
      Monotone t ∧
      (∃ m, ∀ n ≥ m, (t n : ℝ) = b) ∧
      ∀ n, ∃ x ∈ centers,
        Set.Icc (t n) (t (n + 1)) ⊆
          {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
        P.real (Set.Ioo (l x) (r x)) < epsilon :=
  exists_monotone_subdivision_Icc_measureReal_lt_of_noAtoms P hepsilon hab

/--
Durrett 2019, Theorem 2.4.9 non-atomic cutpoint-chain package.

For non-atomic locally finite probability measures, the compact-cover
subdivision route supplies a finite cutpoint chain on every strict bounded
interval.
-/
theorem durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms
    {P : Measure ℝ} [IsProbabilityMeasure P]
    [IsFiniteMeasureOnCompacts P] [NoAtoms P]
    {epsilon a b : ℝ} (hepsilon : 0 < epsilon) (hab : a < b) :
    SuppliedRealMiddleCDFPartitionChain P epsilon a b := by
  rcases durrett2019_theorem_2_4_9_monotone_subdivision_of_noAtoms
      (P := P) hepsilon hab.le with
    ⟨centers, l, r, t, _hcenters, _hsmall, ht0, hmono, heventually, hrefine⟩
  exact durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision
    ht0 hmono heventually hab hrefine

/--
Durrett 2019, Theorem 2.4.9, middle-partition-to-GC package.

This isolates the remaining arbitrary-distribution primitive: for every
bounded interval `[a, b]` and positive radius, construct a finite middle CDF
partition with small left-limit CDF increments. The existing tail and endpoint
assembly layer then proves the half-line Glivenko-Cantelli predicate.
-/
theorem durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X))
    (middlePartitionExists :
      ∀ {epsilon a b : ℝ}, 0 < epsilon -> a < b ->
        ∃ middleCells, Nonempty
          (SuppliedRealMiddleCDFPartition P epsilon a b middleCells)) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X := by
  exact
    durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_supplied_endpoint_grids
      X hLaw hindep
      (SuppliedERealHalfLineEndpointGrid.exists_forall_of_forall_realMiddleCDFPartition
        P middlePartitionExists)

/--
Durrett 2019, Theorem 2.4.9, cutpoint-chain-to-GC package.

This is the current sharp handoff for the source proof: once every bounded
interval admits a finite chain of strict cutpoints with small adjacent CDF
left-limit increments, the empirical CDF half-line class is
Glivenko-Cantelli.
-/
theorem durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X))
    (cutpointChainExists :
      ∀ {epsilon a b : ℝ}, 0 < epsilon -> a < b ->
        SuppliedRealMiddleCDFPartitionChain P epsilon a b) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X := by
  exact
    durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_middle_cdf_partitions
      X hLaw hindep
      (fun hepsilon hab =>
        exists_realMiddleCDFPartition_of_cutpoint_chain
          (cutpointChainExists hepsilon hab))

/--
Durrett 2019, Theorem 2.4.9, center-range subdivision-to-GC package.

This is the sharp arbitrary-law handoff after the atom-aware bridge: it is
enough to construct, on every bounded interval and positive radius, a monotone
subdivision that is eventually constant at the right endpoint, whose values
include every selected finite-cover center, and whose adjacent cells refine
the corresponding punctured open neighborhoods.
-/
theorem durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_monotone_subdivision_center_mem_cover
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X))
    (subdivisionExists :
      ∀ {epsilon a b : ℝ}, 0 < epsilon -> a < b ->
        ∃ t : ℕ -> Set.Icc a b, ∃ centers : Finset ℝ, ∃ l r : ℝ -> ℝ,
          (t 0 : ℝ) = a ∧
          Monotone t ∧
          (∃ m, ∀ n ≥ m, (t n : ℝ) = b) ∧
          (∀ x ∈ centers, ∃ k : ℕ, (t k : ℝ) = x) ∧
          ∀ n,
            ∃ x ∈ centers,
              Set.Icc (t n) (t (n + 1)) ⊆
                {y : Set.Icc a b | (y : ℝ) ∈ Set.Ioo (l x) (r x)} ∧
              P.real (Set.Ioo (l x) (r x) \ {x}) < epsilon) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X :=
  durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains
    X hLaw hindep
    (fun hepsilon hab => by
      rcases subdivisionExists hepsilon hab with
        ⟨t, centers, l, r, ht0, hmono, heventually, hcenter, hrefine⟩
      exact
        durrett2019_theorem_2_4_9_cutpointChain_of_monotone_subdivision_center_mem_cover
          ht0 hmono heventually hab hcenter hrefine)

/--
Durrett 2019, Theorem 2.4.9, Glivenko-Cantelli theorem for empirical
distribution functions on the real line.

The arbitrary-law proof uses finite punctured compact covers to handle atoms,
splits each finite subdivision cell at its selected atom center when needed,
and feeds the resulting finite cutpoint chains into the half-line empirical-CDF
Glivenko-Cantelli handoff.
-/
theorem durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X)) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X :=
  durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains
    X hLaw hindep
    (fun hepsilon hab =>
      durrett2019_theorem_2_4_9_cutpointChain hepsilon hab)

/--
Durrett 2019, Theorem 2.4.9, outer-almost-sure half-line
Glivenko-Cantelli theorem.

This strengthens the book-style `or` endpoint to the exact a.s. branch stated
by Durrett: the arbitrary-law cutpoint-chain construction feeds the
outer-a.s. empirical-CDF handoff directly.
-/
theorem durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X)) :
    VdVWOuterAlmostSurePGlivenkoCantelliClass μ P Set.univ
      realHalfLineIndicator X := by
  exact
    StatInference.vdVW_realHalfLine_outerAlmostSureGlivenkoCantelli_of_suppliedERealHalfLineEndpointGrids
      X hLaw hindep
      (SuppliedERealHalfLineEndpointGrid.exists_forall_of_forall_realMiddleCDFPartition
        P
        (fun hepsilon hab =>
          exists_realMiddleCDFPartition_of_cutpoint_chain
            (durrett2019_theorem_2_4_9_cutpointChain hepsilon hab)))

/--
Durrett 2019, Theorem 2.4.9, source-facing empirical distribution-function
form.

In Durrett's notation, if `F_n(x) = n^{-1} * sum_{m <= n} 1{X_m <= x}` and
`F(x) = P((-infty, x])`, then the local uniform-deviation predicate states
`sup_x |F_n(x) - F(x)| -> 0` in the book-style outer probability or outer
almost-sure sense.
-/
theorem durrett2019_theorem_2_4_9_empiricalDistributionFunction_glivenkoCantelli
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X)) :
    _root_.StatInference.RealEmpiricalCDFGlivenkoCantelliClass μ P X :=
  _root_.StatInference.realEmpiricalCDFGlivenkoCantelliClass_of_realHalfLine
    (durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine X hLaw hindep)

/--
Durrett 2019, Theorem 2.4.9, source-facing empirical distribution-function
form in the exact outer-a.s. branch.

This is the direct Lean counterpart of `sup_x |F_n(x) - F(x)| -> 0 a.s.` in
Durrett's empirical-distribution notation.
-/
theorem durrett2019_theorem_2_4_9_empiricalDistributionFunction_outerAlmostSure
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X)) :
    VdVWOuterAlmostSureUniformDeviationTendstoZeroOn μ Set.univ
      (fun c => ProbabilityTheory.cdf P c)
      (fun ω sampleSize c =>
        empiricalDistributionFunction (samplePath X ω sampleSize) c) := by
  have hhalf :
      VdVWOuterAlmostSurePGlivenkoCantelliClass μ P Set.univ
        realHalfLineIndicator X :=
    durrett2019_theorem_2_4_9_outerAlmostSureGlivenkoCantelli_halfLine
      X hLaw hindep
  simpa [VdVWOuterAlmostSurePGlivenkoCantelliClass,
    empiricalDistributionFunction, populationRiskOfFunction,
    realHalfLineIndicator_integral_eq_cdf] using hhalf

/--
Durrett 2019, Theorem 2.4.9, non-atomic half-line
Glivenko-Cantelli package.

For non-atomic locally finite probability laws on the real line, the verified
compact-cover and monotone-subdivision route supplies the cutpoint chains
needed by the empirical-CDF Glivenko-Cantelli handoff.
-/
theorem durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_noAtoms
    {Ω : Type u} [MeasurableSpace Ω]
    {μ : Measure Ω} {P : Measure ℝ} [IsProbabilityMeasure P]
    [IsFiniteMeasureOnCompacts P] [NoAtoms P]
    (X : ℕ -> Ω -> ℝ)
    (hLaw : ∀ i, _root_.ProbabilityTheory.HasLaw (X i) P μ)
    (hindep : Pairwise ((_root_.ProbabilityTheory.IndepFun (μ := μ)) on X)) :
    VdVWPGlivenkoCantelliClass μ P Set.univ realHalfLineIndicator X :=
  durrett2019_theorem_2_4_9_glivenkoCantelli_halfLine_of_cutpoint_chains
    X hLaw hindep
    (fun hepsilon hab =>
      durrett2019_theorem_2_4_9_cutpointChain_of_noAtoms hepsilon hab)

/-! ## Durrett, Section 3.2 -/

/--
Durrett 2019, Theorem 3.2.9, bounded-continuous test-function
characterization of convergence in distribution.

The statement includes the a.e.-measurability fields carried by mathlib's
`TendstoInDistribution`; the test-function clause is Durrett's
`E g(X_i) -> E g(Z)` formulation for every bounded continuous real-valued
function `g`.
-/
theorem durrett2019_theorem_3_2_9_tendstoInDistribution_iff_forall_boundedContinuous_integral
    {ι : Type u} {E : Type v} {Ω : ι -> Type x} {Ω' : Type x}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι} :
    TendstoInDistribution X l Z μ μ' ↔
      (∀ i, AEMeasurable (X i) (μ i)) ∧
        AEMeasurable Z μ' ∧
          ∀ g : E →ᵇ ℝ,
            Tendsto (fun i => ∫ ω, g (X i ω) ∂(μ i)) l
              (𝓝 (∫ ω, g (Z ω) ∂μ')) := by
  constructor
  · intro h
    refine ⟨h.forall_aemeasurable, h.aemeasurable_limit, ?_⟩
    intro g
    have htest :=
      (StatInference.ProbabilityMeasure.weakConvergence_iff_forall_integral_tendsto.mp
        h.tendsto) g
    have hsource_map :
        (fun i => ∫ s, g s ∂((μ i).map (X i))) =
          fun i => ∫ ω, g (X i ω) ∂(μ i) := by
      funext i
      exact integral_map (h.forall_aemeasurable i)
        g.continuous.measurable.aestronglyMeasurable
    have htarget_map :
        (∫ s, g s ∂(μ'.map Z)) = ∫ ω, g (Z ω) ∂μ' :=
      integral_map h.aemeasurable_limit
        g.continuous.measurable.aestronglyMeasurable
    simpa [hsource_map, htarget_map] using htest
  · rintro ⟨hX, hZ, htest⟩
    refine
      { forall_aemeasurable := hX
        aemeasurable_limit := hZ
        tendsto := ?_ }
    exact
      (StatInference.ProbabilityMeasure.weakConvergence_iff_forall_integral_tendsto
        (μs := fun i =>
          ⟨(μ i).map (X i), Measure.isProbabilityMeasure_map (hX i)⟩)
        (μ := ⟨μ'.map Z, Measure.isProbabilityMeasure_map hZ⟩)).mpr
        (fun g => by
          have hsource_map :
              (fun i => ∫ s, g s ∂((μ i).map (X i))) =
                fun i => ∫ ω, g (X i ω) ∂(μ i) := by
            funext i
            exact integral_map (hX i)
              g.continuous.measurable.aestronglyMeasurable
          have htarget_map :
              (∫ s, g s ∂(μ'.map Z)) = ∫ ω, g (Z ω) ∂μ' :=
            integral_map hZ g.continuous.measurable.aestronglyMeasurable
          simpa [hsource_map, htarget_map] using htest g)

/--
Durrett 2019, Theorem 3.2.10, continuous mapping theorem, continuous case.

The textbook states a sharper measurable-map theorem under the condition that
the limit law gives zero mass to the discontinuity set of `g`.  This compiled
source wrapper records the continuous-map specialization, where that
discontinuity condition is automatic, and delegates to the local
weak-convergence layer.
-/
theorem durrett2019_theorem_3_2_10_continuous_mapping
    {ι : Type u} {E : Type v} {F : Type w} {Ω : ι -> Type x}
    {Ω' : Type x} {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [TopologicalSpace F] [MeasurableSpace F] [BorelSpace F]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    {g : E -> F}
    (h : TendstoInDistribution X l Z μ μ')
    (hg : Continuous g) :
    TendstoInDistribution (fun i => g ∘ X i) l (g ∘ Z) μ μ' :=
  StatInference.ProbabilityMeasure.tendstoInDistribution_continuous_comp h hg

/--
Durrett 2019, Theorem 3.2.10, common-probability-space continuous mapping
form.

This is the common sequence-of-random-variables shape used in the text:
if `X_i` converges in distribution to `Z` under the same probability measure
and `g` is continuous, then `g (X_i)` converges in distribution to `g Z`.
-/
theorem durrett2019_theorem_3_2_10_continuous_mapping_common_probability_space
    {ι : Type u} {Ω : Type x} {E : Type v} {F : Type w}
    [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [TopologicalSpace F] [MeasurableSpace F] [BorelSpace F]
    {X : ι -> Ω -> E} {Z : Ω -> E} {l : Filter ι}
    {g : E -> F}
    (h : TendstoInDistribution X l Z (fun _ => μ) μ)
    (hg : Continuous g) :
    TendstoInDistribution (fun i => g ∘ X i) l (g ∘ Z) (fun _ => μ) μ :=
  durrett2019_theorem_3_2_10_continuous_mapping h hg

/--
Durrett 2019, Theorem 3.2.11, Portmanteau open-set implication.

If `X_i` converges in distribution to `Z`, then every open set has the
Durrett lower-semicontinuity inequality for the laws of the random variables.
-/
theorem durrett2019_theorem_3_2_11_portmanteau_open_of_tendstoInDistribution
    {ι : Type u} {E : Type v} {Ω : ι -> Type x} {Ω' : Type x}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [HasOuterApproxClosed E]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    (h : TendstoInDistribution X l Z μ μ')
    {G : Set E} (hG : IsOpen G) :
    (μ'.map Z) G ≤ l.liminf (fun i => (μ i).map (X i) G) :=
  StatInference.ProbabilityMeasure.WeakConvergenceProbabilityMeasures.le_liminf_measure_open
    (h := h.tendsto) hG

/--
Durrett 2019, Theorem 3.2.11, Portmanteau closed-set implication.

If `X_i` converges in distribution to `Z`, then every closed set has the
Durrett upper-semicontinuity inequality for the laws of the random variables.
-/
theorem durrett2019_theorem_3_2_11_portmanteau_closed_of_tendstoInDistribution
    {ι : Type u} {E : Type v} {Ω : ι -> Type x} {Ω' : Type x}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [HasOuterApproxClosed E]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    (h : TendstoInDistribution X l Z μ μ')
    {K : Set E} (hK : IsClosed K) :
    l.limsup (fun i => (μ i).map (X i) K) ≤ (μ'.map Z) K :=
  StatInference.ProbabilityMeasure.WeakConvergenceProbabilityMeasures.limsup_measure_closed_le
    (h := h.tendsto) hK

/--
Durrett 2019, Theorem 3.2.11, Portmanteau continuity-set implication.

If the limit law gives zero mass to the frontier of `A`, then the probabilities
of `A` under the laws of `X_i` converge to the probability of `A` under the
law of `Z`.
-/
theorem durrett2019_theorem_3_2_11_portmanteau_continuity_set_of_tendstoInDistribution
    {ι : Type u} {E : Type v} {Ω : ι -> Type x} {Ω' : Type x}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [HasOuterApproxClosed E]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    (h : TendstoInDistribution X l Z μ μ')
    {A : Set E} (hA : (μ'.map Z) (frontier A) = 0) :
    Tendsto (fun i => (μ i).map (X i) A) l
      (𝓝 ((μ'.map Z) A)) :=
  StatInference.ProbabilityMeasure.WeakConvergenceProbabilityMeasures.tendsto_measure_of_null_frontier
    (h := h.tendsto) hA

/--
Durrett 2019, Theorem 3.2.11, closed-set Portmanteau converse.

For countably generated index filters, the closed-set limsup inequality for
the laws of the random variables implies convergence in distribution.
-/
theorem durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_closed_limsup_le
    {ι : Type u} {E : Type v} {Ω : ι -> Type x} {Ω' : Type x}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    [l.IsCountablyGenerated]
    (hX : ∀ i, AEMeasurable (X i) (μ i))
    (hZ : AEMeasurable Z μ')
    (hclosed : ∀ K : Set E, IsClosed K ->
      l.limsup (fun i => (μ i).map (X i) K) ≤ (μ'.map Z) K) :
    TendstoInDistribution X l Z μ μ' where
  forall_aemeasurable := hX
  aemeasurable_limit := hZ
  tendsto := by
    exact
      StatInference.ProbabilityMeasure.weakConvergence_of_forall_isClosed_limsup_measure_le
        (μs := fun i =>
          ⟨(μ i).map (X i), Measure.isProbabilityMeasure_map (hX i)⟩)
        (μ := ⟨μ'.map Z, Measure.isProbabilityMeasure_map hZ⟩)
        hclosed

/--
Durrett 2019, Theorem 3.2.11, open-set Portmanteau converse.

For countably generated index filters, the open-set liminf inequality for the
laws of the random variables implies convergence in distribution.
-/
theorem durrett2019_theorem_3_2_11_tendstoInDistribution_of_forall_open_le_liminf
    {ι : Type u} {E : Type v} {Ω : ι -> Type x} {Ω' : Type x}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    [l.IsCountablyGenerated]
    (hX : ∀ i, AEMeasurable (X i) (μ i))
    (hZ : AEMeasurable Z μ')
    (hopen : ∀ G : Set E, IsOpen G ->
      (μ'.map Z) G ≤ l.liminf (fun i => (μ i).map (X i) G)) :
    TendstoInDistribution X l Z μ μ' where
  forall_aemeasurable := hX
  aemeasurable_limit := hZ
  tendsto := by
    exact
      StatInference.vdVWWeakConvergenceProbabilityMeasures_of_forall_isOpen_measure_le_liminf
        (μs := fun i =>
          ⟨(μ i).map (X i), Measure.isProbabilityMeasure_map (hX i)⟩)
        (μ := ⟨μ'.map Z, Measure.isProbabilityMeasure_map hZ⟩)
        hopen

/-! ## Durrett, Section 3.3 -/

/--
Durrett 2019, Section 3.3.1, characteristic function notation.

For a real probability law `μ`, this is Durrett's
`φ(t) = E exp(i t X)` written at the law level.
-/
noncomputable def durrett2019_characteristicFunction (μ : Measure ℝ) (t : ℝ) : ℂ :=
  MeasureTheory.charFun μ t

/-- Durrett 2019, Theorem 3.3.1(a), `φ(0) = 1`. -/
theorem durrett2019_theorem_3_3_1_characteristicFunction_zero
    {μ : Measure ℝ} [IsProbabilityMeasure μ] :
    durrett2019_characteristicFunction μ 0 = 1 := by
  simp [durrett2019_characteristicFunction]

/-- Durrett 2019, Theorem 3.3.1(b), `φ(-t) = conj (φ t)`. -/
theorem durrett2019_theorem_3_3_1_characteristicFunction_neg
    {μ : Measure ℝ} (t : ℝ) :
    durrett2019_characteristicFunction μ (-t) =
      star (durrett2019_characteristicFunction μ t) := by
  simp [durrett2019_characteristicFunction]

/-- Durrett 2019, Theorem 3.3.1(c), `|φ(t)| <= 1`. -/
theorem durrett2019_theorem_3_3_1_characteristicFunction_norm_le_one
    {μ : Measure ℝ} [IsProbabilityMeasure μ] (t : ℝ) :
    ‖durrett2019_characteristicFunction μ t‖ ≤ 1 := by
  simpa [durrett2019_characteristicFunction] using
    (MeasureTheory.norm_charFun_le_one (μ := μ) t)

/--
Durrett 2019, Theorem 3.3.1(d), continuity of characteristic functions.

The textbook proves uniform continuity.  This wrapper records the compiled
continuous consequence supplied by mathlib's characteristic-function API.
-/
theorem durrett2019_theorem_3_3_1_characteristicFunction_continuous
    {μ : Measure ℝ} [IsProbabilityMeasure μ] :
    Continuous (durrett2019_characteristicFunction μ) := by
  simpa [durrett2019_characteristicFunction] using
    (MeasureTheory.continuous_charFun (μ := μ))

/--
Durrett 2019, Theorem 3.3.1(e), affine transform formula.

At the law level, the characteristic function of `a X + b` is
`φ(a t) * exp(i t b)`.
-/
theorem durrett2019_theorem_3_3_1_characteristicFunction_affine_map
    {μ : Measure ℝ} [IsProbabilityMeasure μ] (a b t : ℝ) :
    durrett2019_characteristicFunction (μ.map (fun x => a * x + b)) t =
      durrett2019_characteristicFunction μ (a * t) *
        Complex.exp (t * (b * Complex.I)) := by
  have hmap :
      μ.map (fun x => a * x + b) =
        (μ.map (fun x => a * x)).map (fun x => x + b) := by
    symm
    simpa [Function.comp_def] using
      (AEMeasurable.map_map_of_aemeasurable
        (μ := μ) (f := fun x : ℝ => a * x) (g := fun x : ℝ => x + b)
        (by fun_prop) (by fun_prop))
  rw [hmap]
  simp [durrett2019_characteristicFunction, MeasureTheory.charFun_map_add_const,
    MeasureTheory.charFun_map_mul, mul_assoc]

/--
Durrett 2019, Theorem 3.3.2, independent-sum product law for characteristic
functions.

If `X` and `Y` are independent real random variables, the characteristic
function of `X + Y` is the product of the characteristic functions.
-/
theorem durrett2019_theorem_3_3_2_characteristicFunction_independent_sum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X Y : Ω -> ℝ}
    (hX : AEMeasurable X P) (hY : AEMeasurable Y P)
    (hXY : _root_.ProbabilityTheory.IndepFun X Y P) (t : ℝ) :
    durrett2019_characteristicFunction (P.map (fun ω => X ω + Y ω)) t =
      durrett2019_characteristicFunction (P.map X) t *
        durrett2019_characteristicFunction (P.map Y) t := by
  have hfun :=
    _root_.ProbabilityTheory.IndepFun.charFun_map_fun_add_eq_mul
      (P := P) (X := X) (Y := Y) hX hY hXY
  simpa [durrett2019_characteristicFunction, Pi.mul_apply] using congrFun hfun t

/--
Durrett 2019, Theorem 3.3.17(i), characteristic-function convergence from weak
convergence of real probability laws.
-/
theorem durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_weakConvergence
    {μs : ℕ -> MeasureTheory.ProbabilityMeasure ℝ}
    {μ : MeasureTheory.ProbabilityMeasure ℝ}
    (h : Tendsto μs atTop (𝓝 μ)) :
    ∀ t : ℝ,
      Tendsto
        (fun n : ℕ => durrett2019_characteristicFunction ((μs n : Measure ℝ)) t)
        atTop
        (𝓝 (durrett2019_characteristicFunction ((μ : Measure ℝ)) t)) := by
  intro t
  simpa [durrett2019_characteristicFunction] using
    (MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun.mp h t)

/--
Durrett 2019, Theorem 3.3.17(ii), weak convergence from pointwise convergence
of characteristic functions to the characteristic function of a real probability
law.
-/
theorem durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto
    {μs : ℕ -> MeasureTheory.ProbabilityMeasure ℝ}
    {μ : MeasureTheory.ProbabilityMeasure ℝ}
    (hchar : ∀ t : ℝ,
      Tendsto
        (fun n : ℕ => durrett2019_characteristicFunction ((μs n : Measure ℝ)) t)
        atTop
        (𝓝 (durrett2019_characteristicFunction ((μ : Measure ℝ)) t))) :
    Tendsto μs atTop (𝓝 μ) := by
  refine MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun.mpr ?_
  intro t
  simpa [durrett2019_characteristicFunction] using hchar t

/--
Durrett 2019, Theorem 3.3.17, law-level Lévy continuity theorem for real
probability laws.
-/
theorem durrett2019_theorem_3_3_17_weakConvergence_iff_characteristicFunction_tendsto
    {μs : ℕ -> MeasureTheory.ProbabilityMeasure ℝ}
    {μ : MeasureTheory.ProbabilityMeasure ℝ} :
    Tendsto μs atTop (𝓝 μ) ↔
      ∀ t : ℝ,
        Tendsto
          (fun n : ℕ => durrett2019_characteristicFunction ((μs n : Measure ℝ)) t)
          atTop
          (𝓝 (durrett2019_characteristicFunction ((μ : Measure ℝ)) t)) :=
  ⟨durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_weakConvergence,
    durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto⟩

/--
Durrett 2019, Theorem 3.3.17(ii), tightness from pointwise characteristic
function convergence to a limit continuous at zero.
-/
theorem durrett2019_theorem_3_3_17_tight_of_characteristicFunction_tendsto
    {μs : ℕ -> Measure ℝ} [∀ n, IsProbabilityMeasure (μs n)]
    {φ : ℝ -> ℂ} (hφ : ContinuousAt φ 0)
    (hchar : ∀ t : ℝ,
      Tendsto (fun n : ℕ => durrett2019_characteristicFunction (μs n) t)
        atTop (𝓝 (φ t))) :
    IsTightMeasureSet (Set.range μs) := by
  refine MeasureTheory.isTightMeasureSet_of_tendsto_charFun (μ := μs) (f := φ) hφ ?_
  intro t
  simpa [durrett2019_characteristicFunction] using hchar t

/--
Durrett 2019, Theorem 3.3.17(ii), bundled real-law form: if characteristic
functions converge to a continuous-at-zero limit already identified as the
characteristic function of `μ`, then the laws are tight and converge weakly to
`μ`.
-/
theorem durrett2019_theorem_3_3_17_tight_and_weakConvergence_of_characteristicFunction_limit
    {μs : ℕ -> MeasureTheory.ProbabilityMeasure ℝ}
    {μ : MeasureTheory.ProbabilityMeasure ℝ}
    {φ : ℝ -> ℂ} (hφ : ContinuousAt φ 0)
    (hchar : ∀ t : ℝ,
      Tendsto
        (fun n : ℕ => durrett2019_characteristicFunction ((μs n : Measure ℝ)) t)
        atTop (𝓝 (φ t)))
    (hμ : ∀ t : ℝ, durrett2019_characteristicFunction ((μ : Measure ℝ)) t = φ t) :
    IsTightMeasureSet
        (Set.range (fun n : ℕ => ((μs n : MeasureTheory.ProbabilityMeasure ℝ) : Measure ℝ))) ∧
      Tendsto μs atTop (𝓝 μ) := by
  refine ⟨?_, ?_⟩
  · refine durrett2019_theorem_3_3_17_tight_of_characteristicFunction_tendsto
      (μs := fun n : ℕ => ((μs n : MeasureTheory.ProbabilityMeasure ℝ) : Measure ℝ))
      hφ ?_
    intro t
    simpa using hchar t
  · refine durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto ?_
    intro t
    simpa [hμ t] using hchar t

/--
Durrett 2019, Theorem 3.3.17(i), random-variable form: convergence in
distribution implies pointwise convergence of the characteristic functions of
the laws.
-/
theorem durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_tendstoInDistribution
    {Ω : ℕ -> Type u} {Ω' : Type v}
    {mΩ : (n : ℕ) -> MeasurableSpace (Ω n)}
    {μ : (n : ℕ) -> @Measure (Ω n) (mΩ n)}
    [∀ n, IsProbabilityMeasure (μ n)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    {X : (n : ℕ) -> Ω n -> ℝ} {Z : Ω' -> ℝ}
    (h : TendstoInDistribution X atTop Z μ μ') :
    ∀ t : ℝ,
      Tendsto
        (fun n : ℕ => durrett2019_characteristicFunction ((μ n).map (X n)) t)
        atTop
        (𝓝 (durrett2019_characteristicFunction (μ'.map Z) t)) := by
  intro t
  have hconv :=
    durrett2019_theorem_3_3_17_characteristicFunction_tendsto_of_weakConvergence
      (μs := fun n : ℕ =>
        ⟨(μ n).map (X n), Measure.isProbabilityMeasure_map (h.forall_aemeasurable n)⟩)
      (μ := ⟨μ'.map Z, Measure.isProbabilityMeasure_map h.aemeasurable_limit⟩)
      h.tendsto
  simpa using hconv t

/--
Durrett 2019, Theorem 3.3.17(ii), random-variable form: pointwise convergence
of the characteristic functions of the laws implies convergence in distribution.
-/
theorem durrett2019_theorem_3_3_17_tendstoInDistribution_of_characteristicFunction_tendsto
    {Ω : ℕ -> Type u} {Ω' : Type v}
    {mΩ : (n : ℕ) -> MeasurableSpace (Ω n)}
    {μ : (n : ℕ) -> @Measure (Ω n) (mΩ n)}
    [∀ n, IsProbabilityMeasure (μ n)]
    {mΩ' : MeasurableSpace Ω'} {μ' : @Measure Ω' mΩ'}
    [IsProbabilityMeasure μ']
    {X : (n : ℕ) -> Ω n -> ℝ} {Z : Ω' -> ℝ}
    (hX : ∀ n, AEMeasurable (X n) (μ n))
    (hZ : AEMeasurable Z μ')
    (hchar : ∀ t : ℝ,
      Tendsto
        (fun n : ℕ => durrett2019_characteristicFunction ((μ n).map (X n)) t)
        atTop
        (𝓝 (durrett2019_characteristicFunction (μ'.map Z) t))) :
    TendstoInDistribution X atTop Z μ μ' where
  forall_aemeasurable := hX
  aemeasurable_limit := hZ
  tendsto := by
    refine
      durrett2019_theorem_3_3_17_weakConvergence_of_characteristicFunction_tendsto
        (μs := fun n : ℕ =>
          ⟨(μ n).map (X n), Measure.isProbabilityMeasure_map (hX n)⟩)
        (μ := ⟨μ'.map Z, Measure.isProbabilityMeasure_map hZ⟩) ?_
    intro t
    simpa using hchar t

/--
Durrett 2019, Theorem 3.3.20, centered unit-variance second-order expansion of
the characteristic function at zero.

This is the source-shaped Taylor estimate used in the proof of the i.i.d.
central limit theorem.
-/
theorem durrett2019_theorem_3_3_20_characteristicFunction_secondOrder_centered_unitVariance
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : Ω -> ℝ} (hX : AEMeasurable X P)
    (h0 : (∫ ω, X ω ∂P) = 0) (h1 : (∫ ω, (X ω) ^ 2 ∂P) = 1) :
    (fun t : ℝ => durrett2019_characteristicFunction (P.map X) t - (1 - t ^ 2 / 2))
      =o[𝓝 0] fun t : ℝ => t ^ 2 := by
  simpa [durrett2019_characteristicFunction] using
    (MeasureTheory.taylor_charFun_two (P := P) (X := X) hX h0 h1)

/-! ## Durrett, Section 3.4 -/

/--
Durrett 2019, Theorem 3.4.1, centered unit-variance i.i.d. central limit
theorem.
-/
theorem durrett2019_theorem_3_4_1_centralLimitTheorem_centered_unitVariance
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> Ω -> ℝ} {Y : Ω' -> ℝ}
    (hY : _root_.ProbabilityTheory.HasLaw Y (_root_.ProbabilityTheory.gaussianReal 0 1) P')
    (h0 : (∫ ω, X 0 ω ∂P) = 0) (h1 : (∫ ω, (X 0 ω) ^ 2 ∂P) = 1)
    (hindep : _root_.ProbabilityTheory.iIndepFun X P)
    (hident : ∀ i : ℕ, _root_.ProbabilityTheory.IdentDistrib (X i) (X 0) P P) :
    TendstoInDistribution
      (fun (n : ℕ) ω => (√(n : ℝ))⁻¹ * ∑ k ∈ Finset.range n, X k ω)
      atTop Y (fun _ => P) P' :=
  _root_.ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum
    hY h0 h1 hindep hident

/--
Durrett 2019, Theorem 3.4.1, variance-display i.i.d. central limit theorem.

This is mathlib's unstandardized form: the centered sum divided by `sqrt n`
converges to the centered Gaussian law with the common variance.
-/
theorem durrett2019_theorem_3_4_1_centralLimitTheorem_varianceGaussian
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> Ω -> ℝ} {Y : Ω' -> ℝ}
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0
        (_root_.ProbabilityTheory.variance (X 0) P).toNNReal) P')
    (hX : MemLp (X 0) 2 P)
    (hindep : _root_.ProbabilityTheory.iIndepFun X P)
    (hident : ∀ i : ℕ, _root_.ProbabilityTheory.IdentDistrib (X i) (X 0) P P) :
    TendstoInDistribution
      (fun (n : ℕ) ω =>
        (√(n : ℝ))⁻¹ * (∑ k ∈ Finset.range n, X k ω -
          (n : ℝ) * ∫ ω, X 0 ω ∂P))
      atTop Y (fun _ => P) P' :=
  _root_.ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
    hY hX hindep hident

/--
Durrett 2019, Theorem 3.4.10, triangular-array row sum notation.

The textbook indexes row `n` by `1 <= m <= n`; this Lean wrapper uses the
zero-based row `m in Finset.range n`.
-/
def durrett2019_lindebergFellerRowSum
    {Ω : Type u} (X : ℕ -> ℕ -> Ω -> ℝ) (n : ℕ) (ω : Ω) : ℝ :=
  ∑ m ∈ Finset.range n, X n m ω

/--
Durrett 2019, Theorem 3.4.10, row-wise finite independence for a triangular
array.
-/
def durrett2019_lindebergFellerRowIndependent
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ n : ℕ,
    _root_.ProbabilityTheory.iIndepFun
      ((Finset.range n).restrict (fun m : ℕ => X n m)) P

/--
Durrett 2019, Theorem 3.4.10, row-wise mean-zero assumption.
-/
def durrett2019_lindebergFellerMeanZero
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ n m : ℕ, ∫ ω, X n m ω ∂P = 0

/--
Durrett 2019, Theorem 3.4.10, sum of the row variances.
-/
noncomputable def durrett2019_lindebergFellerVarianceRowSum
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (n : ℕ) : ℝ :=
  ∑ m ∈ Finset.range n, _root_.ProbabilityTheory.variance (X n m) P

/--
Durrett 2019, Theorem 3.4.10, variance-sum convergence hypothesis.
-/
def durrett2019_lindebergFellerVarianceSumConvergence
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (varianceLimit : ℝ) : Prop :=
  Tendsto
    (fun n : ℕ => durrett2019_lindebergFellerVarianceRowSum P X n)
    atTop (𝓝 varianceLimit)

/--
Durrett 2019, Theorem 3.4.10, one row's Lindeberg truncated second-moment sum
at threshold `epsilon`.
-/
noncomputable def durrett2019_lindebergFellerTailSecondMomentRowSum
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (epsilon : ℝ) (n : ℕ) : ℝ :=
  ∑ m ∈ Finset.range n,
    ∫ ω,
      Set.indicator {ω' : Ω | epsilon < |X n m ω'|}
        (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P

/--
Durrett 2019, Theorem 3.4.10, Lindeberg condition.
-/
def durrett2019_lindebergFellerCondition
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ epsilon : ℝ, 0 < epsilon ->
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerTailSecondMomentRowSum P X epsilon n)
      atTop (𝓝 0)

/--
Durrett 2019, Theorem 3.4.10, source-shaped variance split used to derive
`sup_m sigma_{n,m}^2 -> 0` from the Lindeberg condition.

The textbook obtains this from
`sigma_{n,m}^2 <= epsilon^2 + E(|X_{n,m}|^2; |X_{n,m}| > epsilon)`.
Here the one-factor tail term is bounded by the row tail sum, so the statement
is packaged at the exact level needed by the row-smallness argument.
-/
def durrett2019_lindebergFellerVarianceSplitByTailRowSum
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ cutoff : ℝ, 0 < cutoff ->
    ∀ n m : ℕ, m ∈ Finset.range n ->
      _root_.ProbabilityTheory.variance (X n m) P ≤
        cutoff ^ 2 +
          durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n

/--
Durrett 2019, Theorem 3.4.10, one-factor variance-tail inequality.

This is the textbook estimate
`sigma_{n,m}^2 <= epsilon^2 + E(|X_{n,m}|^2; |X_{n,m}| > epsilon)` in a
single-random-variable form.  The proof uses the general bound
`Var X <= E[X^2]`, so it does not need the mean-zero hypothesis.
-/
theorem durrett2019_lindebergFeller_oneFactorVariance_le_cutoff_sq_add_tailSecondMoment
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : Ω -> ℝ}
    (hX : AEMeasurable X P)
    (hX2 : Integrable (fun ω => X ω ^ 2) P)
    {cutoff : ℝ} (_hcutoff : 0 < cutoff) :
    _root_.ProbabilityTheory.variance X P ≤
      cutoff ^ 2 +
        ∫ ω,
          Set.indicator {ω' : Ω | cutoff < |X ω'|}
            (fun ω' : Ω => X ω' ^ 2) ω ∂P := by
  let tailSet : Set Ω := {ω : Ω | cutoff < |X ω|}
  let tailFun : Ω -> ℝ := Set.indicator tailSet (fun ω : Ω => X ω ^ 2)
  have htail_null : NullMeasurableSet tailSet P := by
    dsimp [tailSet]
    exact
      nullMeasurableSet_lt
        (aemeasurable_const : AEMeasurable (fun _ : Ω => cutoff) P)
        (continuous_abs.measurable.comp_aemeasurable hX)
  have htail_integrable : Integrable tailFun P := by
    dsimp [tailFun]
    exact hX2.indicator₀ htail_null
  have hrhs_integrable :
      Integrable (fun ω : Ω => cutoff ^ 2 + tailFun ω) P :=
    (integrable_const (cutoff ^ 2)).add htail_integrable
  have hvariance_le_second :
      _root_.ProbabilityTheory.variance X P ≤ ∫ ω, X ω ^ 2 ∂P := by
    simpa [Pi.pow_apply] using
      (_root_.ProbabilityTheory.variance_le_expectation_sq
        (μ := P) hX.aestronglyMeasurable)
  have hpoint :
      ∀ ω : Ω, X ω ^ 2 ≤ cutoff ^ 2 + tailFun ω := by
    intro ω
    by_cases htail : cutoff < |X ω|
    · simpa [tailFun, tailSet, htail] using
        (le_add_of_nonneg_left (sq_nonneg cutoff) :
          X ω ^ 2 ≤ cutoff ^ 2 + X ω ^ 2)
    · have habs_le : |X ω| ≤ cutoff := le_of_not_gt htail
      have hsquare_le : X ω ^ 2 ≤ cutoff ^ 2 := by
        have hpow := pow_le_pow_left₀ (abs_nonneg (X ω)) habs_le 2
        simpa [sq_abs] using hpow
      simpa [tailFun, tailSet, htail] using hsquare_le
  have hintegral_le :
      (∫ ω, X ω ^ 2 ∂P) ≤
        ∫ ω, cutoff ^ 2 + tailFun ω ∂P := by
    exact integral_mono hX2 hrhs_integrable hpoint
  calc
    _root_.ProbabilityTheory.variance X P ≤ ∫ ω, X ω ^ 2 ∂P :=
      hvariance_le_second
    _ ≤ ∫ ω, cutoff ^ 2 + tailFun ω ∂P :=
      hintegral_le
    _ = cutoff ^ 2 + ∫ ω, tailFun ω ∂P := by
      rw [integral_add (integrable_const (cutoff ^ 2)) htail_integrable]
      simp

/--
Durrett 2019, Theorem 3.4.10, the textbook variance-tail estimate packaged at
the row-sum level used by the Lindeberg-Feller proof.
-/
theorem durrett2019_lindebergFellerVarianceSplitByTailRowSum_of_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => X n m ω ^ 2) P) :
    durrett2019_lindebergFellerVarianceSplitByTailRowSum P X := by
  intro cutoff hcutoff n m hm
  have hfactor :
      _root_.ProbabilityTheory.variance (X n m) P ≤
        cutoff ^ 2 +
          ∫ ω,
            Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
              (fun ω' : Ω => X n m ω' ^ 2) ω ∂P :=
    durrett2019_lindebergFeller_oneFactorVariance_le_cutoff_sq_add_tailSecondMoment
      (P := P) (X := X n m) (hX n m) (hX2 n m) hcutoff
  have htail_le_rowsum :
      (∫ ω,
        Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
          (fun ω' : Ω => X n m ω' ^ 2) ω ∂P) ≤
        durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n := by
    exact
      Finset.single_le_sum
        (f := fun k : ℕ =>
          ∫ ω,
            Set.indicator {ω' : Ω | cutoff < |X n k ω'|}
              (fun ω' : Ω => X n k ω' ^ 2) ω ∂P)
        (fun k _hk =>
          integral_nonneg fun ω => by
            by_cases htail : cutoff < |X n k ω|
            · simpa [htail] using (sq_nonneg (X n k ω))
            · simp [htail])
        hm
  exact hfactor.trans (add_le_add le_rfl htail_le_rowsum)

/--
Durrett 2019, Theorem 3.4.10, finite row product of characteristic functions.
-/
noncomputable def durrett2019_lindebergFellerCharacteristicProduct
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n : ℕ) : ℂ :=
  ∏ m ∈ Finset.range n,
    durrett2019_characteristicFunction (P.map (X n m)) t

/--
Durrett 2019, Theorem 3.4.10, row Gaussian exponential target obtained from
the finite row variance sum.
-/
noncomputable def durrett2019_lindebergFellerRowGaussianExpTarget
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n : ℕ) : ℂ :=
  Complex.exp
    (-(durrett2019_lindebergFellerVarianceRowSum P X n * t ^ 2 / 2 : ℝ))

/--
Durrett 2019, Exercise 3.1.1, row-sum convergence hypothesis for a real
triangular array `c_{n,m}`.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto
    (c : ℕ -> ℕ -> ℝ) (lambda : ℝ) : Prop :=
  Tendsto
    (fun n : ℕ => ∑ m ∈ Finset.range n, c n m)
    atTop (𝓝 lambda)

/--
Durrett 2019, Exercise 3.1.1, the max row coefficient hypothesis
`max_{m <= n} |c_{n,m}| -> 0`, expressed without choosing a finite maximum.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero
    (c : ℕ -> ℕ -> ℝ) : Prop :=
  ∀ epsilon : ℝ, 0 < epsilon ->
    ∀ᶠ n : ℕ in atTop,
      ∀ m ∈ Finset.range n, |c n m| < epsilon

/--
Durrett 2019, Exercise 3.1.1, the uniform absolute row-sum boundedness
hypothesis `sup_n sum_m |c_{n,m}| < infinity`.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded
    (c : ℕ -> ℕ -> ℝ) : Prop :=
  ∃ bound : ℝ, ∀ n : ℕ, ∑ m ∈ Finset.range n, |c n m| ≤ bound

/--
Durrett 2019, Exercise 3.1.1, eventual positivity of the product factors.

This is the positivity side condition used by the logarithmic proof route.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive
    (c : ℕ -> ℕ -> ℝ) : Prop :=
  ∀ᶠ n : ℕ in atTop,
    ∀ m ∈ Finset.range n, 0 < 1 + c n m

/--
Durrett 2019, Exercise 3.1.1, logarithmic remainder convergence:
`sum_m (log (1 + c_{n,m}) - c_{n,m}) -> 0`.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero
    (c : ℕ -> ℕ -> ℝ) : Prop :=
  Tendsto
    (fun n : ℕ =>
      ∑ m ∈ Finset.range n, (Real.log (1 + c n m) - c n m))
    atTop (𝓝 0)

/--
Durrett 2019, Exercise 3.1.1, row-wise relative logarithmic remainder control.

This isolates the calculus estimate needed for the logarithmic proof route:
eventually each `log (1 + c_{n,m}) - c_{n,m}` is at most a small multiple of
`|c_{n,m}|`.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs
    (c : ℕ -> ℕ -> ℝ) : Prop :=
  ∀ epsilon : ℝ, 0 < epsilon ->
    ∀ᶠ n : ℕ in atTop,
      ∀ m ∈ Finset.range n,
        |Real.log (1 + c n m) - c n m| ≤ epsilon * |c n m|

/--
Durrett 2019, Exercise 3.1.1, product-convergence conclusion for a real
triangular array `c_{n,m}`:
`prod_m (1 + c_{n,m}) -> exp(lambda)`.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp
    (c : ℕ -> ℕ -> ℝ) (lambda : ℝ) : Prop :=
  Tendsto
    (fun n : ℕ => ∏ m ∈ Finset.range n, (1 + ((c n m : ℝ) : ℂ)))
    atTop (𝓝 (Complex.exp (lambda : ℂ)))

/--
Durrett 2019, Exercise 3.1.1, source theorem schema for real triangular-array
products.
-/
def durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem : Prop :=
  ∀ (c : ℕ -> ℕ -> ℝ) (lambda : ℝ),
    durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero c ->
    durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto c lambda ->
    durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded c ->
    durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp c lambda

/--
Durrett 2019, Exercise 3.1.1, max-smallness makes the product factors
eventually positive.
-/
theorem durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive_of_maxAbsTendstoZero
    {c : ℕ -> ℕ -> ℝ}
    (hmax :
      durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero c) :
    durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive
      c := by
  filter_upwards [hmax 1 (by norm_num)] with n hn m hm
  have hneg : -1 < c n m := (abs_lt.mp (hn m hm)).1
  nlinarith

/--
Scalar logarithmic remainder estimate used in Durrett 2019, Exercise 3.1.1.
-/
theorem durrett2019_real_abs_log_one_add_sub_self_le
    {x : ℝ} (hx : |x| < 1) :
    |Real.log (1 + x) - x| ≤ |x| ^ 2 / (1 - |x|) := by
  have h :=
    Real.abs_log_sub_add_sum_range_le (x := -x) (by simpa using hx) 1
  simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using h

/--
Durrett 2019, Exercise 3.1.1, max-smallness supplies the row-wise relative
logarithmic remainder control.
-/
theorem durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs_of_maxAbsTendstoZero
    {c : ℕ -> ℕ -> ℝ}
    (hmax :
      durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero c) :
    durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs
      c := by
  intro epsilon hepsilon
  let delta : ℝ := min (1 / 2) (epsilon / 2)
  have hdelta_pos : 0 < delta := by
    dsimp [delta]
    exact lt_min (by norm_num) (div_pos hepsilon (by norm_num))
  filter_upwards [hmax delta hdelta_pos] with n hn m hm
  let a : ℝ := |c n m|
  have ha_nonneg : 0 ≤ a := by
    dsimp [a]
    exact abs_nonneg (c n m)
  have ha_delta : a < delta := by
    dsimp [a]
    exact hn m hm
  have ha_half : a < 1 / 2 := by
    exact ha_delta.trans_le (min_le_left (1 / 2) (epsilon / 2))
  have ha_eps_half : a < epsilon / 2 := by
    exact ha_delta.trans_le (min_le_right (1 / 2) (epsilon / 2))
  have ha_one : a < 1 := by
    nlinarith
  have hlog :
      |Real.log (1 + c n m) - c n m| ≤ a ^ 2 / (1 - a) := by
    simpa [a] using
      (durrett2019_real_abs_log_one_add_sub_self_le
        (x := c n m) (by simpa [a] using ha_one))
  have hden_pos : 0 < 1 - a := by
    nlinarith
  have hfrac : a ^ 2 / (1 - a) ≤ 2 * a ^ 2 := by
    rw [div_le_iff₀ hden_pos]
    nlinarith [sq_nonneg a]
  have hquad : 2 * a ^ 2 ≤ epsilon * a := by
    nlinarith [ha_nonneg, ha_eps_half]
  exact hlog.trans (hfrac.trans (by simpa [a] using hquad))

/--
Durrett 2019, Exercise 3.1.1, relative logarithmic row control plus uniform
absolute row-sum boundedness implies the logarithmic remainder row sum tends
to zero.
-/
theorem durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero_of_relativeToAbs_and_absRowSumBounded
    {c : ℕ -> ℕ -> ℝ}
    (hrelative :
      durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs
        c)
    (habs :
      durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded c) :
    durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero
      c := by
  rcases habs with ⟨bound, hbound⟩
  have hbound_nonneg : 0 ≤ bound := by
    simpa using hbound 0
  rw [durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero,
    tendsto_zero_iff_abs_tendsto_zero, tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun n => lt_of_lt_of_le ha (abs_nonneg _)
  · intro a ha
    let eta : ℝ := a / (bound + 1)
    have hden_pos : 0 < bound + 1 := by
      nlinarith
    have heta_pos : 0 < eta := by
      dsimp [eta]
      exact div_pos ha hden_pos
    filter_upwards [hrelative eta heta_pos] with n hn
    have hsum_abs :
        |∑ m ∈ Finset.range n, (Real.log (1 + c n m) - c n m)| ≤
          ∑ m ∈ Finset.range n, |Real.log (1 + c n m) - c n m| :=
      Finset.abs_sum_le_sum_abs _ _
    have hterm_sum :
        ∑ m ∈ Finset.range n, |Real.log (1 + c n m) - c n m| ≤
          eta * ∑ m ∈ Finset.range n, |c n m| := by
      calc
        ∑ m ∈ Finset.range n, |Real.log (1 + c n m) - c n m| ≤
            ∑ m ∈ Finset.range n, eta * |c n m| := by
              exact Finset.sum_le_sum fun m hm => hn m hm
        _ = eta * ∑ m ∈ Finset.range n, |c n m| := by
              simp [Finset.mul_sum]
    have hrow_bound :
        eta * ∑ m ∈ Finset.range n, |c n m| ≤ eta * bound :=
      mul_le_mul_of_nonneg_left (hbound n) (le_of_lt heta_pos)
    have heta_bound : eta * bound < a := by
      have hlt : eta * bound < eta * (bound + 1) := by
        exact mul_lt_mul_of_pos_left (by nlinarith) heta_pos
      have heq : eta * (bound + 1) = a := by
        dsimp [eta]
        field_simp [hden_pos.ne']
      nlinarith
    exact lt_of_le_of_lt (hsum_abs.trans (hterm_sum.trans hrow_bound)) heta_bound

/--
Durrett 2019, Exercise 3.1.1, logarithmic proof bridge.

Once the factors are eventually positive and the logarithmic remainders
`log (1 + c_{n,m}) - c_{n,m}` have row sum tending to zero, the real
triangular-array product converges to `exp(lambda)`.
-/
theorem durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp_of_logRemainder
    {c : ℕ -> ℕ -> ℝ} {lambda : ℝ}
    (hpositive :
      durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive c)
    (hrow :
      durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto c lambda)
    (hlog :
      durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero c) :
    durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp
      c lambda := by
  have hlogsum :
      Tendsto
        (fun n : ℕ => ∑ m ∈ Finset.range n, Real.log (1 + c n m))
        atTop (𝓝 lambda) := by
    have hsum := hlog.add hrow
    have hsum_eq :
        (fun n : ℕ =>
          (∑ m ∈ Finset.range n, (Real.log (1 + c n m) - c n m)) +
            ∑ m ∈ Finset.range n, c n m) =
        (fun n : ℕ => ∑ m ∈ Finset.range n, Real.log (1 + c n m)) := by
      funext n
      rw [← Finset.sum_add_distrib]
      refine Finset.sum_congr rfl ?_
      intro m hm
      ring
    simpa [durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero,
      durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto,
      zero_add, hsum_eq] using hsum
  have hcomplex :
      Tendsto
        (fun n : ℕ =>
          ((∑ m ∈ Finset.range n, Real.log (1 + c n m) : ℝ) : ℂ))
        atTop
        (𝓝 (lambda : ℂ)) := by
    exact (Complex.continuous_ofReal.tendsto _).comp hlogsum
  have hexp := hcomplex.cexp
  refine hexp.congr' ?_
  filter_upwards [hpositive] with n hn
  have hprod_real :
      (∏ m ∈ Finset.range n, (1 + c n m)) =
        Real.exp (∑ m ∈ Finset.range n, Real.log (1 + c n m)) := by
    rw [Real.exp_sum]
    refine Finset.prod_congr rfl ?_
    intro m hm
    exact (Real.exp_log (hn m hm)).symm
  have hprod_complex :
      (∏ m ∈ Finset.range n, ((1 + c n m : ℝ) : ℂ)) =
        (Real.exp (∑ m ∈ Finset.range n, Real.log (1 + c n m)) : ℂ) := by
    simpa using congrArg (fun x : ℝ => (x : ℂ)) hprod_real
  have hprod_eq :
      ∏ m ∈ Finset.range n, (1 + ((c n m : ℝ) : ℂ)) =
        Complex.exp
          ((∑ m ∈ Finset.range n, Real.log (1 + c n m) : ℝ) : ℂ) := by
    calc
      ∏ m ∈ Finset.range n, (1 + ((c n m : ℝ) : ℂ))
          = ∏ m ∈ Finset.range n, ((1 + c n m : ℝ) : ℂ) := by
            simp
      _ = (Real.exp (∑ m ∈ Finset.range n, Real.log (1 + c n m)) : ℂ) := by
            exact hprod_complex
      _ = Complex.exp
            ((∑ m ∈ Finset.range n, Real.log (1 + c n m) : ℝ) : ℂ) := by
            rw [Complex.ofReal_exp]
  exact hprod_eq.symm

/--
Durrett 2019, Exercise 3.1.1, source theorem handoff through the logarithmic
remainder route.
-/
theorem durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_of_logRemainder
    (hlogRoute :
      ∀ c : ℕ -> ℕ -> ℝ,
        durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero c ->
        durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded c ->
        durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive c ∧
          durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero c) :
    durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem := by
  intro c lambda hmax hrow habs
  rcases hlogRoute c hmax habs with ⟨hpositive, hlog⟩
  exact
    durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp_of_logRemainder
      hpositive hrow hlog

/--
Durrett 2019, Exercise 3.1.1, real triangular-array product theorem.
-/
theorem durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate :
    durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem := by
  intro c lambda hmax hrow habs
  exact
    durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp_of_logRemainder
      (durrett2019_exercise_3_1_1_realTriangularArrayFactorsEventuallyPositive_of_maxAbsTendstoZero
        hmax)
      hrow
      (durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderTendstoZero_of_relativeToAbs_and_absRowSumBounded
        (durrett2019_exercise_3_1_1_realTriangularArrayLogRemainderRelativeToAbs_of_maxAbsTendstoZero
          hmax)
        habs)

/--
Durrett 2019, Theorem 3.4.10, the Exercise 3.1.1 coefficient
`c_{n,m} = -t^2 sigma_{n,m}^2 / 2`.
-/
noncomputable def durrett2019_lindebergFellerQuadraticVarianceCoefficient
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n m : ℕ) : ℝ :=
  -(_root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2)

/--
Durrett 2019, Theorem 3.4.10, Exercise 3.1.1 row-sum convergence for
`c_{n,m} = -t^2 sigma_{n,m}^2 / 2`, obtained from the variance-sum hypothesis.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_rowSum_tendsto
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (t : ℝ) :
    durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto
      (durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t)
      (-(varianceLimit * t ^ 2 / 2)) := by
  have hscaled :
      Tendsto
        (fun n : ℕ =>
          -(durrett2019_lindebergFellerVarianceRowSum P X n * (t ^ 2 / 2)))
        atTop
        (𝓝 (-(varianceLimit * (t ^ 2 / 2)))) := by
    exact (hvariance.mul tendsto_const_nhds).neg
  simpa [durrett2019_exercise_3_1_1_realTriangularArrayRowSumTendsto,
    durrett2019_lindebergFellerQuadraticVarianceCoefficient,
    durrett2019_lindebergFellerVarianceRowSum, Finset.sum_mul, Finset.mul_sum,
    div_eq_mul_inv, mul_assoc, mul_comm, mul_left_comm] using hscaled

/--
Durrett 2019, Theorem 3.4.10, variance-sum convergence gives the Exercise
3.1.1 uniform absolute row-sum bound for
`c_{n,m} = -t^2 sigma_{n,m}^2 / 2`.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_absRowSumBounded_of_varianceSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (t : ℝ) :
    durrett2019_exercise_3_1_1_realTriangularArrayAbsRowSumBounded
      (durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t) := by
  rcases hvariance.bddAbove_range with ⟨bound, hbound⟩
  refine ⟨(t ^ 2 / 2) * bound, ?_⟩
  intro n
  have hscale_nonneg : 0 ≤ t ^ 2 / 2 := by
    exact div_nonneg (sq_nonneg t) (by norm_num)
  have hrow_le :
      durrett2019_lindebergFellerVarianceRowSum P X n ≤ bound :=
    hbound ⟨n, rfl⟩
  have hsum_eq :
      ∑ m ∈ Finset.range n,
          |durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t n m| =
        (t ^ 2 / 2) * durrett2019_lindebergFellerVarianceRowSum P X n := by
    calc
      ∑ m ∈ Finset.range n,
          |durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t n m|
          =
        ∑ m ∈ Finset.range n,
          _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 := by
          refine Finset.sum_congr rfl ?_
          intro m hm
          rw [durrett2019_lindebergFellerQuadraticVarianceCoefficient, abs_neg]
          exact abs_of_nonneg
            (div_nonneg
              (mul_nonneg
                (_root_.ProbabilityTheory.variance_nonneg (X n m) P)
                (sq_nonneg t))
              (by norm_num))
      _ = (t ^ 2 / 2) * durrett2019_lindebergFellerVarianceRowSum P X n := by
          simp [durrett2019_lindebergFellerVarianceRowSum, div_eq_mul_inv,
            Finset.mul_sum, mul_assoc, mul_comm, mul_left_comm]
  rw [hsum_eq]
  exact mul_le_mul_of_nonneg_left hrow_le hscale_nonneg

/--
Durrett 2019, Theorem 3.4.10, quadratic variance factor
`1 - sigma_{n,m}^2 t^2 / 2` appearing after the characteristic-function Taylor
replacement.
-/
noncomputable def durrett2019_lindebergFellerQuadraticVarianceFactor
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n m : ℕ) : ℂ :=
  1 - ((_root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 : ℝ) : ℂ)

/--
Durrett 2019, Theorem 3.4.10, the quadratic variance factor is exactly
`1 + c_{n,m}` for the Exercise 3.1.1 coefficient.
-/
theorem durrett2019_lindebergFellerQuadraticVarianceFactor_eq_one_add_coefficient
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n m : ℕ) :
    durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m =
      1 +
        ((durrett2019_lindebergFellerQuadraticVarianceCoefficient
          P X t n m : ℝ) : ℂ) := by
  simp [durrett2019_lindebergFellerQuadraticVarianceFactor,
    durrett2019_lindebergFellerQuadraticVarianceCoefficient, sub_eq_add_neg]

/--
Durrett 2019, Theorem 3.4.10, finite product of the quadratic variance factors
over one triangular-array row.
-/
noncomputable def durrett2019_lindebergFellerQuadraticVarianceProduct
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n : ℕ) : ℂ :=
  ∏ m ∈ Finset.range n,
    durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m

/--
Durrett 2019, Theorem 3.4.10, rewrite the quadratic variance product in the
exact Exercise 3.1.1 form `prod_m (1 + c_{n,m})`.
-/
theorem durrett2019_lindebergFellerQuadraticVarianceProduct_eq_exercise311Product
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n : ℕ) :
    durrett2019_lindebergFellerQuadraticVarianceProduct P X t n =
      ∏ m ∈ Finset.range n,
        (1 +
          ((durrett2019_lindebergFellerQuadraticVarianceCoefficient
            P X t n m : ℝ) : ℂ)) := by
  simp [durrett2019_lindebergFellerQuadraticVarianceProduct,
    durrett2019_lindebergFellerQuadraticVarianceFactor_eq_one_add_coefficient]

/--
Durrett 2019, Theorem 3.4.10, Exercise 3.1.1 product conclusion specialized
to the quadratic variance coefficients.
-/
def durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (varianceLimit : ℝ) : Prop :=
  ∀ t : ℝ,
    durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp
      (durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t)
      (-(varianceLimit * t ^ 2 / 2))

/--
Durrett 2019, Theorem 3.4.10, turn the Exercise 3.1.1 product conclusion into
convergence of the quadratic variance product to the Gaussian exponential.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceProduct_tendsto_exp_of_exercise311
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hexercise :
      durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
        P X varianceLimit)
    (t : ℝ) :
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerQuadraticVarianceProduct P X t n)
      atTop
      (𝓝 (Complex.exp (-(varianceLimit * t ^ 2 / 2 : ℝ)))) := by
  simpa [durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp,
    durrett2019_exercise_3_1_1_realTriangularArrayProductTendstoExp,
    durrett2019_lindebergFellerQuadraticVarianceProduct_eq_exercise311Product]
    using hexercise t

/--
Durrett 2019, Lemma 3.4.3 with `theta = 1`: if two finite families of complex
numbers are bounded by one in norm, then the norm of the difference of their
products is bounded by the sum of the one-factor differences.
-/
theorem durrett2019_norm_prod_sub_prod_le_sum_norm_sub
    {ι : Type v} [DecidableEq ι] (s : Finset ι) (z w : ι -> ℂ)
    (hz : ∀ i ∈ s, ‖z i‖ ≤ 1) (hw : ∀ i ∈ s, ‖w i‖ ≤ 1) :
    ‖(∏ i ∈ s, z i) - ∏ i ∈ s, w i‖ ≤
      ∑ i ∈ s, ‖z i - w i‖ := by
  classical
  revert hz hw
  refine Finset.induction_on s ?base ?step
  · intro _hz _hw
    simp
  · intro a s ha ih hz hw
    have hz_s : ∀ i ∈ s, ‖z i‖ ≤ 1 := by
      intro i hi
      exact hz i (Finset.mem_insert_of_mem hi)
    have hw_s : ∀ i ∈ s, ‖w i‖ ≤ 1 := by
      intro i hi
      exact hw i (Finset.mem_insert_of_mem hi)
    have hw_a : ‖w a‖ ≤ 1 := hw a (Finset.mem_insert_self a s)
    have hprod_z_s : ‖∏ i ∈ s, z i‖ ≤ 1 := by
      exact (Finset.norm_prod_le s z).trans
        (Finset.prod_le_one (fun i _hi => norm_nonneg (z i)) hz_s)
    have hfirst :
        ‖(z a - w a) * (∏ i ∈ s, z i)‖ ≤ ‖z a - w a‖ := by
      rw [norm_mul]
      nlinarith [hprod_z_s, norm_nonneg (z a - w a)]
    have hsecond :
        ‖w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)‖ ≤
          ∑ i ∈ s, ‖z i - w i‖ := by
      rw [norm_mul]
      have hmul :
          ‖w a‖ * ‖(∏ i ∈ s, z i) - ∏ i ∈ s, w i‖ ≤
            ‖(∏ i ∈ s, z i) - ∏ i ∈ s, w i‖ := by
        nlinarith [hw_a, norm_nonneg ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)]
      exact hmul.trans (ih hz_s hw_s)
    have hrewrite :
        z a * (∏ i ∈ s, z i) - w a * (∏ i ∈ s, w i) =
          (z a - w a) * (∏ i ∈ s, z i) +
            w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i) := by
      ring
    calc
      ‖(∏ i ∈ insert a s, z i) - ∏ i ∈ insert a s, w i‖
          = ‖z a * (∏ i ∈ s, z i) - w a * (∏ i ∈ s, w i)‖ := by
            simp [Finset.prod_insert ha]
      _ = ‖(z a - w a) * (∏ i ∈ s, z i) +
            w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)‖ := by
            rw [hrewrite]
      _ ≤ ‖(z a - w a) * (∏ i ∈ s, z i)‖ +
            ‖w a * ((∏ i ∈ s, z i) - ∏ i ∈ s, w i)‖ :=
            norm_add_le _ _
      _ ≤ ‖z a - w a‖ + ∑ i ∈ s, ‖z i - w i‖ :=
            add_le_add hfirst hsecond
      _ = ∑ i ∈ insert a s, ‖z i - w i‖ := by
            simp [Finset.sum_insert ha]

/--
Durrett 2019, Theorem 3.4.10, characteristic-product approximation by the
quadratic variance product.

This isolates the Taylor/Lindeberg part of the proof.
-/
def durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ,
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerCharacteristicProduct P X t n -
          durrett2019_lindebergFellerQuadraticVarianceProduct P X t n)
      atTop (𝓝 0)

/--
Durrett 2019, Theorem 3.4.10, the row sum of one-factor errors in the
Taylor/Lindeberg replacement step.
-/
noncomputable def durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (t : ℝ) (n : ℕ) : ℝ :=
  ∑ m ∈ Finset.range n,
    ‖durrett2019_characteristicFunction (P.map (X n m)) t -
      durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m‖

/--
Durrett 2019, Theorem 3.4.10, the row sum of one-factor errors tends to zero.
-/
def durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ,
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum
          P X t n)
      atTop (𝓝 0)

/--
Durrett 2019, Theorem 3.4.10, source-shaped finite-row Taylor/Lindeberg bound.

For each fixed `t` and truncation level `cutoff`, this is the summed form of
the displayed estimate
`|z_{n,m} - w_{n,m}| <= cutoff |t|^3 E X_{n,m}^2
  + 2 t^2 E(X_{n,m}^2; |X_{n,m}| > cutoff)`.
The variance row sum is used for the first term, matching the mean-zero
Lindeberg-Feller hypotheses.
-/
def durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t cutoff : ℝ, 0 < cutoff ->
    ∀ n : ℕ,
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum
          P X t n ≤
        cutoff * |t| ^ 3 *
            durrett2019_lindebergFellerVarianceRowSum P X n +
          (2 * t ^ 2) *
            durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n

/--
Durrett 2019, Theorem 3.4.10, one-factor Taylor/Lindeberg bound.

This is the scalar estimate for a fixed triangular-array entry.  It is the
remaining source-shaped consequence of Durrett's characteristic-function
Taylor bound (3.3.3).  The row theorem below sums this one-factor estimate over
`m`.
-/
def durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t cutoff : ℝ, 0 < cutoff ->
    ∀ n m : ℕ,
      ‖durrett2019_characteristicFunction (P.map (X n m)) t -
        durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m‖ ≤
        cutoff * |t| ^ 3 *
            _root_.ProbabilityTheory.variance (X n m) P +
          (2 * t ^ 2) *
            ∫ ω,
              Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P

/--
Durrett 2019, Theorem 3.4.10, scalar Taylor/Lindeberg bound before rewriting
the second moment as a variance.

This is the exact one-factor estimate obtained from Durrett's characteristic
function Taylor inequality (3.3.3), after splitting the minimum at
`|X_{n,m}| <= cutoff`.
-/
def durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t cutoff : ℝ, 0 < cutoff ->
    ∀ n m : ℕ,
      ‖durrett2019_characteristicFunction (P.map (X n m)) t -
        (1 - (((∫ ω, (X n m ω) ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ))‖ ≤
        cutoff * |t| ^ 3 * (∫ ω, (X n m ω) ^ 2 ∂P) +
          (2 * t ^ 2) *
            ∫ ω,
              Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P

/--
Durrett 2019, Theorem 3.4.10, scalar Taylor/Lindeberg bound before using the
mean-zero hypothesis.

This is the split form of the characteristic-function Taylor estimate (3.3.3)
with the linear term `i t E X_{n,m}` still present.
-/
def durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t cutoff : ℝ, 0 < cutoff ->
    ∀ n m : ℕ,
      ‖durrett2019_characteristicFunction (P.map (X n m)) t -
        (1 + (((∫ ω, X n m ω ∂P) * t : ℝ) : ℂ) * Complex.I -
          (((∫ ω, (X n m ω) ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ))‖ ≤
        cutoff * |t| ^ 3 * (∫ ω, (X n m ω) ^ 2 ∂P) +
          (2 * t ^ 2) *
            ∫ ω,
              Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P

/--
Durrett 2019, formula (3.3.3), specialized to the quadratic characteristic
function Taylor expansion used in Theorem 3.4.10.
-/
def durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ, ∀ n m : ℕ,
    ‖durrett2019_characteristicFunction (P.map (X n m)) t -
      (1 + (((∫ ω, X n m ω ∂P) * t : ℝ) : ℂ) * Complex.I -
        (((∫ ω, (X n m ω) ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ))‖ ≤
      ∫ ω, min (|t * X n m ω| ^ 3) (2 * |t * X n m ω| ^ 2) ∂P

/--
Durrett 2019, Lemma 3.3.19 with `n = 2`, written as a pointwise quadratic
Taylor remainder for the characteristic-function factor.
-/
noncomputable def durrett2019_quadraticCharacteristicTaylorPointwiseRemainder
    (t x : ℝ) : ℂ :=
  Complex.exp (((t * x : ℝ) : ℂ) * Complex.I) -
    (1 + (((x * t : ℝ) : ℂ) * Complex.I) -
      (((x ^ 2 * t ^ 2 / 2 : ℝ) : ℂ)))

/--
Durrett 2019, Lemma 3.3.19, pointwise source shape used before taking
expectations in formula (3.3.3).
-/
def durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound
    {Ω : Type u} (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ, ∀ n m : ℕ, ∀ ω : Ω,
    ‖durrett2019_quadraticCharacteristicTaylorPointwiseRemainder
        t (X n m ω)‖ ≤
      min (|t * X n m ω| ^ 3) (2 * |t * X n m ω| ^ 2)

/--
Durrett 2019, Lemma 3.3.19 with `n = 2`, cubic side of the scalar
characteristic-function Taylor remainder estimate.
-/
theorem durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_cubic_of_abs_le_two
    (u : ℝ) (hu : |u| ≤ 2) :
    ‖Complex.exp (((u : ℝ) : ℂ) * Complex.I) -
        (1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)))‖ ≤
      |u| ^ 3 := by
  let z : ℂ := ((u : ℝ) : ℂ) * Complex.I
  have hnorm : ‖z‖ = |u| := by
    simp [z, Real.norm_eq_abs]
  have hz : ‖z‖ / (Nat.succ 3 : ℝ) ≤ 1 / 2 := by
    rw [hnorm]
    norm_num
    nlinarith
  have hbound := Complex.exp_bound' (x := z) (n := 3) hz
  have hsum :
      (∑ m ∈ Finset.range 3, z ^ m / (m.factorial : ℂ)) =
        1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)) := by
    have hsq : z ^ 2 / (2 : ℂ) = -(((u ^ 2 / 2 : ℝ) : ℂ)) := by
      simp [z, mul_pow, Complex.I_sq]
      ring_nf
    simp [Finset.sum_range_succ, Nat.factorial, z, hsq, sub_eq_add_neg]
  have hmain :
      ‖Complex.exp (((u : ℝ) : ℂ) * Complex.I) -
          (1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)))‖ ≤
        |u| ^ 3 / 3 := by
    calc
      ‖Complex.exp (((u : ℝ) : ℂ) * Complex.I) -
          (1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)) )‖
          = ‖Complex.exp z - ∑ m ∈ Finset.range 3, z ^ m / (m.factorial : ℂ)‖ := by
            rw [hsum]
      _ ≤ ‖z‖ ^ 3 / (Nat.factorial 3 : ℝ) * 2 := hbound
      _ = |u| ^ 3 / 3 := by
            rw [hnorm]
            ring_nf
  have hnonneg : 0 ≤ |u| ^ 3 := by
    positivity
  nlinarith

/--
Durrett 2019, Lemma 3.3.19 with `n = 2`, quadratic side of the scalar
characteristic-function Taylor remainder estimate.
-/
theorem durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_quadratic_of_two_le_abs
    (u : ℝ) (hu : 2 ≤ |u|) :
    ‖Complex.exp (((u : ℝ) : ℂ) * Complex.I) -
        (1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)))‖ ≤
      2 * |u| ^ 2 := by
  let e : ℂ := Complex.exp (((u : ℝ) : ℂ) * Complex.I)
  let b : ℂ := (((u : ℝ) : ℂ) * Complex.I)
  let c : ℂ := (((u ^ 2 / 2 : ℝ) : ℂ))
  have he_sub_one : ‖e - 1‖ ≤ 2 := by
    calc
      ‖e - 1‖ ≤ ‖e‖ + ‖(1 : ℂ)‖ := norm_sub_le e 1
      _ = 2 := by
        simp [e, Complex.norm_exp_ofReal_mul_I]
        norm_num
  have hb_norm : ‖b‖ = |u| := by
    simp [b, Real.norm_eq_abs]
  have hc_norm : ‖c‖ = u ^ 2 / 2 := by
    simp [c]
  have hsub : ‖(e - 1) - b‖ ≤ ‖e - 1‖ + ‖b‖ :=
    norm_sub_le (e - 1) b
  calc
    ‖Complex.exp (((u : ℝ) : ℂ) * Complex.I) -
        (1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)))‖
        = ‖(e - 1) - b + c‖ := by
          simp [e, b, c]
          ring_nf
    _ ≤ ‖(e - 1) - b‖ + ‖c‖ := norm_add_le _ _
    _ ≤ (‖e - 1‖ + ‖b‖) + ‖c‖ := by
          simpa [add_comm, add_left_comm, add_assoc] using add_le_add_right hsub ‖c‖
    _ ≤ (2 + |u|) + (u ^ 2 / 2) := by
          rw [hb_norm, hc_norm]
          gcongr
    _ ≤ 2 * |u| ^ 2 := by
          have habs_nonneg : 0 ≤ |u| := abs_nonneg u
          have hu2 : 0 ≤ u ^ 2 := sq_nonneg u
          have habs_sq : |u| ^ 2 = u ^ 2 := by
            rw [sq_abs]
          nlinarith

/--
Durrett 2019, Lemma 3.3.19 with `n = 2`, scalar minimum-form estimate for the
quadratic characteristic-function Taylor remainder.
-/
theorem durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_scalar
    (u : ℝ) :
    ‖Complex.exp (((u : ℝ) : ℂ) * Complex.I) -
        (1 + (((u : ℝ) : ℂ) * Complex.I) - (((u ^ 2 / 2 : ℝ) : ℂ)))‖ ≤
      min (|u| ^ 3) (2 * |u| ^ 2) := by
  by_cases hu : |u| ≤ 2
  · have hleft : |u| ^ 3 ≤ 2 * |u| ^ 2 := by
      calc
        |u| ^ 3 = |u| ^ 2 * |u| := by
          ring
        _ ≤ |u| ^ 2 * 2 := by
          gcongr
        _ = 2 * |u| ^ 2 := by
          ring
    rw [min_eq_left hleft]
    exact
      durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_cubic_of_abs_le_two
        u hu
  · have hge : 2 ≤ |u| := le_of_lt (lt_of_not_ge hu)
    have hright : 2 * |u| ^ 2 ≤ |u| ^ 3 := by
      calc
        2 * |u| ^ 2 ≤ |u| * |u| ^ 2 := by
          gcongr
        _ = |u| ^ 3 := by
          ring
    rw [min_eq_right hright]
    exact
      durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_quadratic_of_two_le_abs
        u hge

/--
Durrett 2019, Lemma 3.3.19 with `n = 2`, written in the variables used by the
Lindeberg-Feller row factors.
-/
theorem durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le
    (t x : ℝ) :
    ‖durrett2019_quadraticCharacteristicTaylorPointwiseRemainder t x‖ ≤
      min (|t * x| ^ 3) (2 * |t * x| ^ 2) := by
  have h := durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le_scalar
    (t * x)
  simpa [durrett2019_quadraticCharacteristicTaylorPointwiseRemainder, mul_comm,
    mul_left_comm, mul_assoc, sq] using h

/--
Durrett 2019, Lemma 3.3.19 with `n = 2`, source-facing triangular-array
pointwise predicate.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound_of_scalar
    {Ω : Type u} {X : ℕ -> ℕ -> Ω -> ℝ} :
    durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound
      X := by
  intro t n m ω
  exact durrett2019_quadraticCharacteristicTaylorPointwiseRemainder_norm_le
    t (X n m ω)

/--
Durrett 2019, formula (3.3.3): the pointwise Lemma 3.3.19 quadratic remainder
bound implies the integrated characteristic-function Taylor remainder bound.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_pointwiseTaylorRemainderBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P)
    (hpoint :
      durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound
        X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
      P X := by
  intro t n m
  let Xnm : Ω -> ℝ := X n m
  let linear : Ω -> ℂ := fun ω =>
    (((Xnm ω * t : ℝ) : ℂ) * Complex.I)
  let quadratic : Ω -> ℂ := fun ω =>
    (((Xnm ω ^ 2 * t ^ 2 / 2 : ℝ) : ℂ))
  let model : Ω -> ℂ := fun ω => 1 + linear ω - quadratic ω
  let remainder : Ω -> ℂ := fun ω =>
    durrett2019_quadraticCharacteristicTaylorPointwiseRemainder t (Xnm ω)
  let bound : Ω -> ℝ := fun ω =>
    min (|t * Xnm ω| ^ 3) (2 * |t * Xnm ω| ^ 2)
  have hXnm : AEMeasurable Xnm P := hX n m
  have hXnm2 : Integrable (fun ω => (Xnm ω) ^ 2) P := hX2 n m
  have hXnm_memLp : MemLp Xnm 2 P :=
    (memLp_two_iff_integrable_sq hXnm.aestronglyMeasurable).2 hXnm2
  have hXnm_int : Integrable Xnm P :=
    hXnm_memLp.integrable one_le_two
  have hExp_int :
      Integrable
        (fun ω : Ω => Complex.exp (((t * Xnm ω : ℝ) : ℂ) * Complex.I)) P := by
    refine (integrable_const (1 : ℝ)).mono' (by fun_prop) ?_
    exact Eventually.of_forall fun ω => by
      rw [Complex.norm_exp]
      simp
  have hlinear_int :
      Integrable linear P := by
    dsimp [linear]
    exact (hXnm_int.mul_const t).ofReal.mul_const Complex.I
  have hquadratic_real_int :
      Integrable (fun ω : Ω => Xnm ω ^ 2 * t ^ 2 / 2) P := by
    simpa [div_eq_mul_inv, mul_assoc] using
      hXnm2.mul_const (t ^ 2 / 2)
  have hquadratic_int :
      Integrable quadratic P := by
    dsimp [quadratic]
    exact hquadratic_real_int.ofReal
  have hmodel_int : Integrable model P := by
    dsimp [model]
    exact (integrable_const (1 : ℂ)).add hlinear_int |>.sub hquadratic_int
  have hdom_int :
      Integrable (fun ω : Ω => 2 * t ^ 2 * Xnm ω ^ 2) P := by
    simpa using hXnm2.const_mul (2 * t ^ 2)
  have hbound_int : Integrable bound P := by
    refine hdom_int.mono_nonneg (by fun_prop)
      (Eventually.of_forall fun ω => ?_)
      (Eventually.of_forall fun ω => ?_)
    · exact le_min (by positivity) (by positivity)
    · calc
        min (|t * Xnm ω| ^ 3) (2 * |t * Xnm ω| ^ 2)
            ≤ 2 * |t * Xnm ω| ^ 2 := min_le_right _ _
        _ = 2 * t ^ 2 * Xnm ω ^ 2 := by
          rw [abs_mul, mul_pow, sq_abs, sq_abs]
          ring
  have hnorm_le : ∀ᵐ ω ∂P, ‖remainder ω‖ ≤ bound ω := by
    exact Eventually.of_forall fun ω => by
      simpa [remainder, bound, Xnm] using hpoint t n m ω
  have hnorm_integral_le :
      ‖∫ ω, remainder ω ∂P‖ ≤ ∫ ω, bound ω ∂P :=
    norm_integral_le_of_norm_le hbound_int hnorm_le
  have hchar_eq :
      durrett2019_characteristicFunction (P.map (X n m)) t =
        ∫ ω, Complex.exp (((t * Xnm ω : ℝ) : ℂ) * Complex.I) ∂P := by
    rw [durrett2019_characteristicFunction, MeasureTheory.charFun_apply_real]
    rw [integral_map hXnm (by fun_prop)]
    exact integral_congr_ae <| Eventually.of_forall fun ω => by
      simp [Complex.ofReal_mul, mul_assoc]
  have hlinear_integral_eq :
      (∫ ω, linear ω ∂P) =
        (((∫ ω, Xnm ω ∂P) * t : ℝ) : ℂ) * Complex.I := by
    dsimp [linear]
    calc
      (∫ ω, (((Xnm ω * t : ℝ) : ℂ) * Complex.I) ∂P) =
          (∫ ω, ((Xnm ω * t : ℝ) : ℂ) ∂P) * Complex.I := by
            simpa using
              (integral_mul_const (μ := P) (r := Complex.I)
                (f := fun ω : Ω => ((Xnm ω * t : ℝ) : ℂ)))
      _ = (((∫ ω, Xnm ω * t ∂P : ℝ) : ℂ) * Complex.I) := by
            norm_cast
      _ = (((∫ ω, Xnm ω ∂P) * t : ℝ) : ℂ) * Complex.I := by
            rw [integral_mul_const]
  have hquadratic_integral_eq :
      (∫ ω, quadratic ω ∂P) =
        (((∫ ω, Xnm ω ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ) := by
    dsimp [quadratic]
    calc
      (∫ ω, (((Xnm ω ^ 2 * t ^ 2 / 2 : ℝ) : ℂ)) ∂P) =
          ((∫ ω, Xnm ω ^ 2 * t ^ 2 / 2 ∂P : ℝ) : ℂ) := by
            norm_cast
      _ = ((∫ ω, Xnm ω ^ 2 * (t ^ 2 / 2) ∂P : ℝ) : ℂ) := by
            congr 1
            refine integral_congr_ae <| Eventually.of_forall fun ω => by ring
      _ = (((∫ ω, Xnm ω ^ 2 ∂P) * (t ^ 2 / 2) : ℝ) : ℂ) := by
            rw [integral_mul_const]
      _ = (((∫ ω, Xnm ω ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ) := by
            ring_nf
  have hmodel_integral_eq :
      (∫ ω, model ω ∂P) =
        1 + (((∫ ω, Xnm ω ∂P) * t : ℝ) : ℂ) * Complex.I -
          (((∫ ω, Xnm ω ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ) := by
    calc
      (∫ ω, model ω ∂P) =
          ∫ ω, ((1 : ℂ) + linear ω) - quadratic ω ∂P := by
            rfl
      _ =
          (∫ ω, (1 : ℂ) + linear ω ∂P) -
            ∫ ω, quadratic ω ∂P := by
            simpa using
              (integral_sub ((integrable_const (1 : ℂ)).add hlinear_int)
                hquadratic_int)
      _ =
          ((∫ ω, (1 : ℂ) ∂P) +
              ∫ ω, linear ω ∂P) -
            ∫ ω, quadratic ω ∂P := by
            rw [integral_add (integrable_const (1 : ℂ)) hlinear_int]
      _ =
          1 + (((∫ ω, Xnm ω ∂P) * t : ℝ) : ℂ) * Complex.I -
            (((∫ ω, Xnm ω ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ) := by
            rw [hlinear_integral_eq, hquadratic_integral_eq]
            simp
  calc
    ‖durrett2019_characteristicFunction (P.map (X n m)) t -
        (1 + (((∫ ω, X n m ω ∂P) * t : ℝ) : ℂ) * Complex.I -
          (((∫ ω, (X n m ω) ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ))‖
        = ‖∫ ω, remainder ω ∂P‖ := by
          rw [hchar_eq, ← hmodel_integral_eq]
          rw [← integral_sub hExp_int hmodel_int]
          rfl
    _ ≤ ∫ ω, bound ω ∂P := hnorm_integral_le
    _ = ∫ ω, min (|t * X n m ω| ^ 3)
            (2 * |t * X n m ω| ^ 2) ∂P := by
          rfl

/--
Durrett 2019, formula (3.3.3): the integrated one-factor
characteristic-function Taylor remainder bound follows from square-integrable
rows and the scalar Lemma 3.3.19 estimate.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_pointwiseTaylorRemainderBound
    (P := P) (X := X) hX hX2
    durrett2019_lindebergFellerCharacteristicQuadraticPointwiseTaylorRemainderBound_of_scalar

/--
Durrett 2019, Theorem 3.4.10, pointwise truncation split for the scalar
Taylor remainder in (3.3.3).
-/
theorem durrett2019_lindebergFeller_min_taylor_remainder_le_split
    (t cutoff x : ℝ) (hcutoff : 0 < cutoff) :
    min (|t * x| ^ 3) (2 * |t * x| ^ 2) ≤
      cutoff * |t| ^ 3 * x ^ 2 +
        2 * t ^ 2 * (if cutoff < |x| then x ^ 2 else 0) := by
  by_cases hx : cutoff < |x|
  · have hfirst_nonneg : 0 ≤ cutoff * |t| ^ 3 * x ^ 2 := by
      positivity
    calc
      min (|t * x| ^ 3) (2 * |t * x| ^ 2) ≤ 2 * |t * x| ^ 2 :=
        min_le_right _ _
      _ = 2 * t ^ 2 * x ^ 2 := by
        rw [abs_mul, mul_pow, sq_abs, sq_abs]
        ring
      _ ≤ cutoff * |t| ^ 3 * x ^ 2 + 2 * t ^ 2 * x ^ 2 :=
        le_add_of_nonneg_left hfirst_nonneg
      _ = cutoff * |t| ^ 3 * x ^ 2 +
            2 * t ^ 2 * (if cutoff < |x| then x ^ 2 else 0) := by
        simp [hx]
  · have hx_le : |x| ≤ cutoff := le_of_not_gt hx
    have hx_cube_le : |x| ^ 3 ≤ cutoff * x ^ 2 := by
      calc
        |x| ^ 3 = |x| * |x| ^ 2 := by ring
        _ = |x| * x ^ 2 := by rw [sq_abs]
        _ ≤ cutoff * x ^ 2 :=
          mul_le_mul_of_nonneg_right hx_le (sq_nonneg x)
    have hfirst_le : |t * x| ^ 3 ≤ cutoff * |t| ^ 3 * x ^ 2 := by
      calc
        |t * x| ^ 3 = |t| ^ 3 * |x| ^ 3 := by
          rw [abs_mul, mul_pow]
        _ ≤ |t| ^ 3 * (cutoff * x ^ 2) :=
          mul_le_mul_of_nonneg_left hx_cube_le (by positivity)
        _ = cutoff * |t| ^ 3 * x ^ 2 := by ring
    calc
      min (|t * x| ^ 3) (2 * |t * x| ^ 2) ≤ |t * x| ^ 3 :=
        min_le_left _ _
      _ ≤ cutoff * |t| ^ 3 * x ^ 2 := hfirst_le
      _ = cutoff * |t| ^ 3 * x ^ 2 +
            2 * t ^ 2 * (if cutoff < |x| then x ^ 2 else 0) := by
        simp [hx]

/--
Durrett 2019, Theorem 3.4.10, the integrated Taylor remainder estimate (3.3.3)
implies the split scalar Taylor/Lindeberg expansion bound.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound_of_remainderBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
      P X := by
  intro t cutoff hcutoff n m
  let tailSet : Set Ω := {ω : Ω | cutoff < |X n m ω|}
  let tailFun : Ω -> ℝ :=
    Set.indicator tailSet (fun ω : Ω => (X n m ω) ^ 2)
  let splitFun : Ω -> ℝ :=
    fun ω : Ω =>
      cutoff * |t| ^ 3 * (X n m ω) ^ 2 + 2 * t ^ 2 * tailFun ω
  have htail_null : NullMeasurableSet tailSet P := by
    dsimp [tailSet]
    exact
      nullMeasurableSet_lt
        (aemeasurable_const : AEMeasurable (fun _ : Ω => cutoff) P)
        (continuous_abs.measurable.comp_aemeasurable (hX n m))
  have htail_integrable : Integrable tailFun P := by
    dsimp [tailFun]
    exact (hX2 n m).indicator₀ htail_null
  have hsq_scaled_integrable :
      Integrable (fun ω : Ω =>
        cutoff * |t| ^ 3 * (X n m ω) ^ 2) P := by
    simpa using
      (hX2 n m).const_mul (cutoff * |t| ^ 3)
  have htail_scaled_integrable :
      Integrable (fun ω : Ω => 2 * t ^ 2 * tailFun ω) P := by
    simpa using
      htail_integrable.const_mul (2 * t ^ 2)
  have hsplit_integrable : Integrable splitFun P := by
    dsimp [splitFun]
    exact hsq_scaled_integrable.add htail_scaled_integrable
  have hmin_nonneg :
      0 ≤ᵐ[P] (fun ω : Ω =>
        min (|t * X n m ω| ^ 3) (2 * |t * X n m ω| ^ 2)) := by
    exact Eventually.of_forall fun ω =>
      le_min (by positivity) (by positivity)
  have hpoint :
      (fun ω : Ω =>
        min (|t * X n m ω| ^ 3) (2 * |t * X n m ω| ^ 2)) ≤ᵐ[P]
          splitFun := by
    exact Eventually.of_forall fun ω => by
      have hsplit :=
        durrett2019_lindebergFeller_min_taylor_remainder_le_split
          t cutoff (X n m ω) hcutoff
      by_cases htail : cutoff < |X n m ω|
      · simpa [splitFun, tailFun, tailSet, htail, mul_assoc] using hsplit
      · simpa [splitFun, tailFun, tailSet, htail, mul_assoc] using hsplit
  have hintegral_split_le :
      (∫ ω, min (|t * X n m ω| ^ 3)
            (2 * |t * X n m ω| ^ 2) ∂P) ≤
        ∫ ω, splitFun ω ∂P :=
    integral_mono_of_nonneg hmin_nonneg hsplit_integrable hpoint
  have hsplit_integral_eq :
      (∫ ω, splitFun ω ∂P) =
        cutoff * |t| ^ 3 * (∫ ω, (X n m ω) ^ 2 ∂P) +
          (2 * t ^ 2) *
            ∫ ω,
              Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P := by
    dsimp [splitFun]
    rw [integral_add hsq_scaled_integrable htail_scaled_integrable]
    rw [integral_const_mul, integral_const_mul]
  calc
    ‖durrett2019_characteristicFunction (P.map (X n m)) t -
        (1 + (((∫ ω, X n m ω ∂P) * t : ℝ) : ℂ) * Complex.I -
          (((∫ ω, (X n m ω) ^ 2 ∂P) * t ^ 2 / 2 : ℝ) : ℂ))‖
        ≤ ∫ ω, min (|t * X n m ω| ^ 3)
            (2 * |t * X n m ω| ^ 2) ∂P :=
          hremainder t n m
    _ ≤ ∫ ω, splitFun ω ∂P :=
          hintegral_split_le
    _ = cutoff * |t| ^ 3 * (∫ ω, (X n m ω) ^ 2 ∂P) +
          (2 * t ^ 2) *
            ∫ ω,
              Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P :=
          hsplit_integral_eq

/--
Durrett 2019, Theorem 3.4.10, mean-zero rows remove the linear term from the
scalar Taylor/Lindeberg expansion bound.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_expansionBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hexpansion :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
      P X := by
  intro t cutoff hcutoff n m
  simpa [hmean_zero n m] using hexpansion t cutoff hcutoff n m

/--
Durrett 2019, Theorem 3.4.10, Durrett's Taylor remainder estimate (3.3.3)
gives the mean-zero scalar Taylor/Lindeberg bound.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_remainderBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_expansionBound
    (P := P) (X := X) hmean_zero
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound_of_remainderBound
      (P := P) (X := X) hX hX2 hremainder)

/--
Durrett 2019, Theorem 3.4.10, mean-zero rows turn the scalar Taylor/Lindeberg
bound written with second moments into the variance-based one-factor bound.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_taylorBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (htaylor :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
      P X := by
  intro t cutoff hcutoff n m
  have hvariance_eq :
      _root_.ProbabilityTheory.variance (X n m) P =
        ∫ ω, (X n m ω) ^ 2 ∂P :=
    _root_.ProbabilityTheory.variance_of_integral_eq_zero
      (μ := P) (X := X n m) (hX n m) (hmean_zero n m)
  simpa [durrett2019_lindebergFellerQuadraticVarianceFactor, hvariance_eq] using
    htaylor t cutoff hcutoff n m

/--
Durrett 2019, Theorem 3.4.10, the scalar Taylor expansion bound gives the
variance-based one-factor bound after mean-zero cancellation.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_expansionBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hexpansion :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_taylorBound
    (P := P) (X := X) hX hmean_zero
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound_of_expansionBound
      (P := P) (X := X) hmean_zero hexpansion)

/--
Durrett 2019, Theorem 3.4.10, Durrett's Taylor remainder estimate (3.3.3)
gives the variance-based one-factor bound after mean-zero cancellation.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_remainderBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_expansionBound
    (P := P) (X := X) hX hmean_zero
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound_of_remainderBound
      (P := P) (X := X) hX hX2 hremainder)

/--
Durrett 2019, Theorem 3.4.10, summing the one-factor Taylor/Lindeberg bound
gives the finite-row bound used by the Lindeberg-Feller convergence argument.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hone :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
      P X := by
  intro t cutoff hcutoff n
  have hsum_le :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum
          P X t n ≤
        ∑ m ∈ Finset.range n,
          (cutoff * |t| ^ 3 *
              _root_.ProbabilityTheory.variance (X n m) P +
            (2 * t ^ 2) *
              ∫ ω,
                Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                  (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P) := by
    dsimp [durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum]
    exact Finset.sum_le_sum fun m _hm => hone t cutoff hcutoff n m
  calc
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum P X t n
        ≤
          ∑ m ∈ Finset.range n,
            (cutoff * |t| ^ 3 *
                _root_.ProbabilityTheory.variance (X n m) P +
              (2 * t ^ 2) *
                ∫ ω,
                  Set.indicator {ω' : Ω | cutoff < |X n m ω'|}
                    (fun ω' : Ω => (X n m ω') ^ 2) ω ∂P) :=
          hsum_le
    _ =
        cutoff * |t| ^ 3 *
            durrett2019_lindebergFellerVarianceRowSum P X n +
          (2 * t ^ 2) *
            durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n := by
          simp [durrett2019_lindebergFellerVarianceRowSum,
            durrett2019_lindebergFellerTailSecondMomentRowSum,
            Finset.sum_add_distrib, Finset.mul_sum, mul_assoc, mul_comm]

/--
Durrett 2019, Theorem 3.4.10, the scalar Taylor/Lindeberg bound gives the
finite-row bound after mean-zero rows rewrite second moments as variances.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (htaylor :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
    (P := P) (X := X)
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_taylorBound
      (P := P) (X := X) hX hmean_zero htaylor)

/--
Durrett 2019, Theorem 3.4.10, the scalar Taylor expansion bound gives the
finite-row bound after mean-zero cancellation.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hexpansion :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
    (P := P) (X := X)
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_expansionBound
      (P := P) (X := X) hX hmean_zero hexpansion)

/--
Durrett 2019, Theorem 3.4.10, Durrett's Taylor remainder estimate (3.3.3)
gives the finite-row Taylor/Lindeberg bound after mean-zero cancellation.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_remainderBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
    (P := P) (X := X)
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound_of_remainderBound
      (P := P) (X := X) hX hX2 hmean_zero hremainder)

/--
Durrett 2019, Theorem 3.4.10, the finite-row Taylor/Lindeberg estimate implies
the row-sum error convergence used by Lemma 3.4.3.

This formalizes the textbook step: sum the one-factor bound, use variance-sum
convergence and the Lindeberg condition, then let the truncation level be
arbitrarily small.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hrowBound :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
      P X := by
  intro t
  rcases hvariance.bddAbove_range with ⟨varianceBound, hvarianceBound⟩
  have hvarianceBound_nonneg : 0 ≤ varianceBound := by
    have h0 :
        durrett2019_lindebergFellerVarianceRowSum P X 0 ≤ varianceBound :=
      hvarianceBound ⟨0, rfl⟩
    simpa [durrett2019_lindebergFellerVarianceRowSum] using h0
  let B : ℝ := varianceBound + 1
  have hB_pos : 0 < B := by
    dsimp [B]
    linarith
  have hrow_le_B :
      ∀ n : ℕ, durrett2019_lindebergFellerVarianceRowSum P X n ≤ B := by
    intro n
    exact (hvarianceBound ⟨n, rfl⟩).trans (by dsimp [B]; linarith)
  by_cases ht : t = 0
  · refine squeeze_zero'
      (Eventually.of_forall fun n : ℕ => by
        dsimp [durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum]
        exact Finset.sum_nonneg fun m _hm => norm_nonneg _)
      ?_ tendsto_const_nhds
    filter_upwards with n
    have hrow := hrowBound 0 1 zero_lt_one n
    simpa [ht] using hrow
  · let A : ℝ := |t| ^ 3
    have hA_pos : 0 < A := by
      dsimp [A]
      exact pow_pos (abs_pos.mpr ht) 3
    let scale : ℝ := 2 * t ^ 2
    have hscale_pos : 0 < scale := by
      have ht_sq_pos : 0 < t ^ 2 := sq_pos_of_ne_zero ht
      dsimp [scale]
      nlinarith
    rw [tendsto_order]
    constructor
    · intro a ha
      exact Eventually.of_forall fun n : ℕ =>
        lt_of_lt_of_le ha
          (by
            dsimp [durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum]
            exact Finset.sum_nonneg fun m _hm => norm_nonneg _)
    · intro a ha
      let cutoff : ℝ := a / (4 * A * B)
      have hden_pos : 0 < 4 * A * B := by
        positivity
      have hcutoff_pos : 0 < cutoff := div_pos ha hden_pos
      have hfirst_le :
          ∀ n : ℕ,
            cutoff * A * durrett2019_lindebergFellerVarianceRowSum P X n ≤
              a / 4 := by
        intro n
        have hcoef_nonneg : 0 ≤ cutoff * A :=
          mul_nonneg hcutoff_pos.le hA_pos.le
        have hle_B :
            cutoff * A *
                durrett2019_lindebergFellerVarianceRowSum P X n ≤
              cutoff * A * B :=
          mul_le_mul_of_nonneg_left (hrow_le_B n) hcoef_nonneg
        have hcutoff_AB_eq : cutoff * A * B = a / 4 := by
          have hAB_ne : A * B ≠ 0 :=
            mul_ne_zero hA_pos.ne' hB_pos.ne'
          calc
            cutoff * A * B = a * (A * B) / (4 * (A * B)) := by
              dsimp [cutoff]
              rw [div_mul_eq_mul_div, div_mul_eq_mul_div]
              ring
            _ = a / 4 := by
              rw [mul_div_mul_right _ _ hAB_ne]
        exact hle_B.trans_eq hcutoff_AB_eq
      have htail_eventually :
          ∀ᶠ n : ℕ in atTop,
            durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n <
              a / (4 * scale) := by
        have htarget_pos : 0 < a / (4 * scale) :=
          div_pos ha (mul_pos (by norm_num) hscale_pos)
        exact (hlindeberg cutoff hcutoff_pos).eventually_lt_const htarget_pos
      filter_upwards [htail_eventually] with n htail_lt
      have hrow := hrowBound t cutoff hcutoff_pos n
      have htail_scaled_lt :
          scale *
              durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n <
            a / 4 := by
        calc
          scale *
              durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n <
            scale * (a / (4 * scale)) :=
              mul_lt_mul_of_pos_left htail_lt hscale_pos
          _ = a / 4 := by
              calc
                scale * (a / (4 * scale)) =
                    a * scale / (4 * scale) := by
                  rw [mul_comm, div_mul_eq_mul_div]
                _ = a / 4 := by
                  rw [mul_div_mul_right _ _ hscale_pos.ne']
      calc
        durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSum P X t n
            ≤ cutoff * |t| ^ 3 *
                  durrett2019_lindebergFellerVarianceRowSum P X n +
                (2 * t ^ 2) *
                  durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n :=
              hrow
        _ = cutoff * A *
                durrett2019_lindebergFellerVarianceRowSum P X n +
              scale *
                durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n := by
              simp [A, scale]
        _ < a := by
              nlinarith [hfirst_le n, htail_scaled_lt]

/--
Durrett 2019, Theorem 3.4.10, the one-factor Taylor/Lindeberg bound implies
the row-sum error convergence used by Lemma 3.4.3.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_oneFactorBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hone :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
      (P := P) (X := X) hone)

/--
Durrett 2019, Theorem 3.4.10, the scalar Taylor/Lindeberg bound implies the
row-sum error convergence used by Lemma 3.4.3.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_taylorBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (htaylor :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound
      (P := P) (X := X) hX hmean_zero htaylor)

/--
Durrett 2019, Theorem 3.4.10, the scalar Taylor expansion bound implies the
row-sum error convergence used by Lemma 3.4.3.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_expansionBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hexpansion :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound
      (P := P) (X := X) hX hmean_zero hexpansion)

/--
Durrett 2019, Theorem 3.4.10, Durrett's Taylor remainder estimate (3.3.3)
implies the row-sum error convergence used by Lemma 3.4.3.
-/
theorem durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_remainderBound
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m : ℕ, AEMeasurable (X n m) P)
    (hX2 : ∀ n m : ℕ, Integrable (fun ω => (X n m ω) ^ 2) P)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X) :
    durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
      P X :=
  durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_remainderBound
      (P := P) (X := X) hX hX2 hmean_zero hremainder)

/--
Durrett 2019, Theorem 3.4.10, eventual unit-norm control for the quadratic
variance factors.  The textbook obtains this from
`sup_m sigma_{n,m}^2 -> 0`.
-/
def durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ,
    ∀ᶠ n : ℕ in atTop,
      ∀ m ∈ Finset.range n,
        ‖durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m‖ ≤ 1

/--
Durrett 2019, Theorem 3.4.10, row-wise max-smallness of variances:
`sup_m sigma_{n,m}^2 -> 0`, expressed without choosing a finite-row maximum.
-/
def durrett2019_lindebergFellerVarianceRowsEventuallySmall
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ epsilon : ℝ, 0 < epsilon ->
    ∀ᶠ n : ℕ in atTop,
      ∀ m ∈ Finset.range n,
        _root_.ProbabilityTheory.variance (X n m) P < epsilon

/--
Durrett 2019, Theorem 3.4.10, the Lindeberg condition implies row-wise
max-smallness of the variances once the textbook variance-tail split is
available.
-/
theorem durrett2019_theorem_3_4_10_varianceRowsEventuallySmall_of_lindeberg_and_varianceSplitByTailRowSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X) :
    durrett2019_lindebergFellerVarianceRowsEventuallySmall P X := by
  intro epsilon hepsilon
  let cutoff : ℝ := min 1 (epsilon / 4)
  have hcutoff_pos : 0 < cutoff := by
    dsimp [cutoff]
    exact lt_min zero_lt_one (div_pos hepsilon (by norm_num))
  have hcutoff_sq_le : cutoff ^ 2 ≤ epsilon / 4 := by
    have hcutoff_nonneg : 0 ≤ cutoff := le_of_lt hcutoff_pos
    have hcutoff_le_one : cutoff ≤ 1 := by
      dsimp [cutoff]
      exact min_le_left 1 (epsilon / 4)
    have hcutoff_le_eps4 : cutoff ≤ epsilon / 4 := by
      dsimp [cutoff]
      exact min_le_right 1 (epsilon / 4)
    have hsq_le_cutoff : cutoff ^ 2 ≤ cutoff := by
      calc
        cutoff ^ 2 = cutoff * cutoff := by ring
        _ ≤ cutoff * 1 := mul_le_mul_of_nonneg_left hcutoff_le_one hcutoff_nonneg
        _ = cutoff := by ring
    exact hsq_le_cutoff.trans hcutoff_le_eps4
  have htail_eventually :
      ∀ᶠ n : ℕ in atTop,
        durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n <
          3 * epsilon / 4 := by
    have htarget_pos : 0 < 3 * epsilon / 4 := by
      nlinarith
    exact (hlindeberg cutoff hcutoff_pos).eventually_lt_const htarget_pos
  filter_upwards [htail_eventually] with n htail_lt m hm
  have hvariance_le :
      _root_.ProbabilityTheory.variance (X n m) P ≤
        cutoff ^ 2 +
          durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n :=
    hsplit cutoff hcutoff_pos n m hm
  have hsum_lt :
      cutoff ^ 2 +
          durrett2019_lindebergFellerTailSecondMomentRowSum P X cutoff n <
        epsilon := by
    nlinarith
  exact lt_of_le_of_lt hvariance_le hsum_lt

/--
Durrett 2019, Theorem 3.4.10, max-smallness of row variances gives the
Exercise 3.1.1 max-coefficient hypothesis for
`c_{n,m} = -t^2 sigma_{n,m}^2 / 2`.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_maxAbsTendstoZero_of_varianceRowsEventuallySmall
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hsmall : durrett2019_lindebergFellerVarianceRowsEventuallySmall P X)
    (t : ℝ) :
    durrett2019_exercise_3_1_1_realTriangularArrayMaxAbsTendstoZero
      (durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t) := by
  intro epsilon hepsilon
  by_cases ht : t = 0
  · filter_upwards with n m hm
    simp [durrett2019_lindebergFellerQuadraticVarianceCoefficient, ht, hepsilon]
  · have ht_sq_pos : 0 < t ^ 2 := sq_pos_of_ne_zero ht
    have hthreshold_pos : 0 < 2 * epsilon / t ^ 2 := by
      exact div_pos (mul_pos (by norm_num) hepsilon) ht_sq_pos
    filter_upwards [hsmall (2 * epsilon / t ^ 2) hthreshold_pos] with n hn m hm
    have hv_lt :
        _root_.ProbabilityTheory.variance (X n m) P < 2 * epsilon / t ^ 2 :=
      hn m hm
    have hscale_pos : 0 < t ^ 2 / 2 := div_pos ht_sq_pos (by norm_num)
    have hmul := mul_lt_mul_of_pos_right hv_lt hscale_pos
    have hcoeff_abs :
        |durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t n m| =
          _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 := by
      rw [durrett2019_lindebergFellerQuadraticVarianceCoefficient, abs_neg]
      exact abs_of_nonneg
        (div_nonneg
          (mul_nonneg
            (_root_.ProbabilityTheory.variance_nonneg (X n m) P)
            (sq_nonneg t))
          (by norm_num))
    rw [hcoeff_abs]
    have hright : (2 * epsilon / t ^ 2) * (t ^ 2 / 2) = epsilon := by
      field_simp [ht_sq_pos.ne']
    nlinarith

/--
Durrett 2019, Theorem 3.4.10, apply Exercise 3.1.1 to the quadratic variance
coefficients.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall_and_exercise311
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hexercise311 :
      durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hsmall : durrett2019_lindebergFellerVarianceRowsEventuallySmall P X) :
    durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
      P X varianceLimit := by
  intro t
  exact hexercise311
    (durrett2019_lindebergFellerQuadraticVarianceCoefficient P X t)
    (-(varianceLimit * t ^ 2 / 2))
    (durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_maxAbsTendstoZero_of_varianceRowsEventuallySmall
      (P := P) (X := X) hsmall t)
    (durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_rowSum_tendsto
      (P := P) (X := X) (varianceLimit := varianceLimit) hvariance t)
    (durrett2019_theorem_3_4_10_quadraticVarianceCoefficient_absRowSumBounded_of_varianceSum
      (P := P) (X := X) (varianceLimit := varianceLimit) hvariance t)

/--
Durrett 2019, Theorem 3.4.10, apply the proved Exercise 3.1.1 theorem to the
quadratic variance coefficients.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hsmall : durrett2019_lindebergFellerVarianceRowsEventuallySmall P X) :
    durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
      P X varianceLimit :=
  durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall_and_exercise311
    (P := P) (X := X) (varianceLimit := varianceLimit)
    durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate
    hvariance hsmall

/--
Durrett 2019, Theorem 3.4.10, apply Exercise 3.1.1 to the quadratic variance
coefficients using the Lindeberg route to max-row-variance smallness.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit_and_exercise311
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hexercise311 :
      durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X) :
    durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
      P X varianceLimit :=
  durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_varianceRowsEventuallySmall_and_exercise311
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hexercise311 hvariance
    (durrett2019_theorem_3_4_10_varianceRowsEventuallySmall_of_lindeberg_and_varianceSplitByTailRowSum
      hlindeberg hsplit)

/--
Durrett 2019, Theorem 3.4.10, apply the proved Exercise 3.1.1 theorem to the
quadratic variance coefficients using the Lindeberg route to max-row-variance
smallness.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X) :
    durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
      P X varianceLimit :=
  durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit_and_exercise311
    (P := P) (X := X) (varianceLimit := varianceLimit)
    durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate
    hvariance hlindeberg hsplit

/--
Durrett 2019, Theorem 3.4.10, scaled variance condition sufficient for
`|1 - t^2 sigma_{n,m}^2 / 2| <= 1`.
-/
def durrett2019_lindebergFellerQuadraticVarianceScaledEventuallyLeTwo
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ,
    ∀ᶠ n : ℕ in atTop,
      ∀ m ∈ Finset.range n,
        _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 ≤ 2

/--
Durrett 2019, Theorem 3.4.10, max-smallness of row variances implies the
scaled variance condition needed by Lemma 3.4.3.
-/
theorem durrett2019_theorem_3_4_10_scaledVarianceEventuallyLeTwo_of_varianceRowsEventuallySmall
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hsmall : durrett2019_lindebergFellerVarianceRowsEventuallySmall P X) :
    durrett2019_lindebergFellerQuadraticVarianceScaledEventuallyLeTwo P X := by
  intro t
  by_cases ht : t = 0
  · filter_upwards with n m hm
    simp [ht]
  · have ht_sq_pos : 0 < t ^ 2 := sq_pos_of_ne_zero ht
    have hthreshold_pos : 0 < 4 / t ^ 2 := by
      exact div_pos (by norm_num) ht_sq_pos
    filter_upwards [hsmall (4 / t ^ 2) hthreshold_pos] with n hn m hm
    have hv_lt :
        _root_.ProbabilityTheory.variance (X n m) P < 4 / t ^ 2 :=
      hn m hm
    have hmul :=
      mul_lt_mul_of_pos_right hv_lt ht_sq_pos
    have hright : (4 / t ^ 2) * t ^ 2 = 4 := by
      field_simp [ht_sq_pos.ne']
    nlinarith

/--
Durrett 2019, Theorem 3.4.10, scaled variance control gives eventual
unit-norm control for the quadratic variance factors.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_scaledVarianceEventuallyLeTwo
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hscaled :
      durrett2019_lindebergFellerQuadraticVarianceScaledEventuallyLeTwo
        P X) :
    durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne
      P X := by
  intro t
  filter_upwards [hscaled t] with n hn m hm
  have hscaled_nm :
      _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 ≤ 2 :=
    hn m hm
  have hnonneg :
      0 ≤ _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 := by
    exact div_nonneg
      (mul_nonneg (_root_.ProbabilityTheory.variance_nonneg (X n m) P) (sq_nonneg t))
      (by norm_num)
  have habs :
      |1 - _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2| ≤ 1 := by
    rw [abs_le]
    constructor <;> nlinarith
  have hfactor :
      durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m =
        ((1 - _root_.ProbabilityTheory.variance (X n m) P * t ^ 2 / 2 : ℝ) : ℂ) := by
    simp [durrett2019_lindebergFellerQuadraticVarianceFactor]
  rw [hfactor]
  rw [Complex.norm_real, Real.norm_eq_abs]
  exact habs

/--
Durrett 2019, Theorem 3.4.10, max-smallness of row variances gives eventual
unit-norm control for the quadratic variance factors.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_varianceRowsEventuallySmall
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hsmall : durrett2019_lindebergFellerVarianceRowsEventuallySmall P X) :
    durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne
      P X :=
  durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_scaledVarianceEventuallyLeTwo
    (durrett2019_theorem_3_4_10_scaledVarianceEventuallyLeTwo_of_varianceRowsEventuallySmall
      hsmall)

/--
Durrett 2019, Theorem 3.4.10, Lemma 3.4.3 bridge: row-sum control of
one-factor Taylor/Lindeberg errors implies the characteristic-product to
quadratic-product approximation.
-/
theorem durrett2019_theorem_3_4_10_characteristicProductApproximationToQuadraticVarianceProduct_of_errorRowSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hfactor :
      durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne
        P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X) :
    durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct
      P X := by
  intro t
  rw [tendsto_zero_iff_norm_tendsto_zero]
  refine squeeze_zero' (Eventually.of_forall fun _ => norm_nonneg _) ?_ (herror t)
  filter_upwards [hfactor t] with n hfactor_n
  exact
    durrett2019_norm_prod_sub_prod_le_sum_norm_sub
      (Finset.range n)
      (fun m : ℕ => durrett2019_characteristicFunction (P.map (X n m)) t)
      (fun m : ℕ => durrett2019_lindebergFellerQuadraticVarianceFactor P X t n m)
      (by
        intro m _hm
        haveI : IsProbabilityMeasure (P.map (X n m)) :=
          Measure.isProbabilityMeasure_map (hX n m)
        exact durrett2019_theorem_3_3_1_characteristicFunction_norm_le_one
          (μ := P.map (X n m)) t)
      hfactor_n

/--
Durrett 2019, Theorem 3.4.10, quadratic variance product approximation by the
row Gaussian exponential target.

This isolates the elementary finite-product-to-exponential part of the proof.
-/
def durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ,
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerQuadraticVarianceProduct P X t n -
          durrett2019_lindebergFellerRowGaussianExpTarget P X t n)
      atTop (𝓝 0)

/--
Durrett 2019, Theorem 3.4.10, the remaining product approximation after
separating the variance-sum convergence step.

This is the precise analytic blocker left by the textbook Lindeberg argument:
Taylor expansion and the Lindeberg tail bound should show that each row's
characteristic-function product is asymptotic to the row Gaussian exponential
target built from the row variance sum.
-/
def durrett2019_lindebergFellerProductApproximationToRowGaussianExp
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) : Prop :=
  ∀ t : ℝ,
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerCharacteristicProduct P X t n -
          durrett2019_lindebergFellerRowGaussianExpTarget P X t n)
      atTop (𝓝 0)

/--
Durrett 2019, Theorem 3.4.10, characteristic-function convergence obligation
after the Lindeberg estimates have reduced the proof to a product limit.
-/
def durrett2019_lindebergFellerGaussianProductConvergence
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (varianceLimit : ℝ) : Prop :=
  ∀ t : ℝ,
    Tendsto
      (fun n : ℕ =>
        ∏ m ∈ Finset.range n,
          durrett2019_characteristicFunction (P.map (X n m)) t)
      atTop
      (𝓝 (durrett2019_characteristicFunction
        (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) t))

/--
Durrett 2019, Theorem 3.4.10, explicit characteristic-function product limit
used in the textbook proof:
`prod_m phi_{n,m}(t) -> exp(-sigma^2 t^2 / 2)`.
-/
def durrett2019_lindebergFellerGaussianProductConvergenceExp
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (varianceLimit : ℝ) : Prop :=
  ∀ t : ℝ,
    Tendsto
      (fun n : ℕ =>
        ∏ m ∈ Finset.range n,
          durrett2019_characteristicFunction (P.map (X n m)) t)
      atTop
      (𝓝 (Complex.exp (-(varianceLimit * t ^ 2 / 2 : ℝ))))

/--
Durrett 2019, Theorem 3.4.10, analytic certificate shape.

The first three fields are the textbook hypotheses.  The final field is the
remaining analytic estimate: those hypotheses imply the characteristic-product
limit `exp(-sigma^2 t^2 / 2)`.
-/
structure Durrett2019LindebergFellerAnalyticCertificate
    {Ω : Type u} [MeasurableSpace Ω] (P : Measure Ω)
    (X : ℕ -> ℕ -> Ω -> ℝ) (varianceLimit : ℝ) : Prop where
  variance_pos : 0 < varianceLimit
  mean_zero : durrett2019_lindebergFellerMeanZero P X
  variance_sum :
    durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit
  lindeberg : durrett2019_lindebergFellerCondition P X
  product_tendsto_exp :
    durrett2019_lindebergFellerGaussianProductConvergenceExp P X varianceLimit

/--
Durrett 2019, Theorem 3.4.10, the Gaussian characteristic function in the
explicit display used by the Lindeberg-Feller proof.
-/
theorem durrett2019_theorem_3_4_10_gaussian_characteristicFunction_eq_exp
    {varianceLimit : ℝ} (hvariance_nonneg : 0 ≤ varianceLimit) (t : ℝ) :
    durrett2019_characteristicFunction
        (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) t =
      Complex.exp (-(varianceLimit * t ^ 2 / 2 : ℝ)) := by
  rw [durrett2019_characteristicFunction,
    _root_.ProbabilityTheory.charFun_gaussianReal]
  rw [Real.coe_toNNReal _ hvariance_nonneg]
  simp

/--
Durrett 2019, Theorem 3.4.10, convert the textbook explicit product limit
`exp(-sigma^2 t^2 / 2)` into the Gaussian-law characteristic-function limit.
-/
theorem durrett2019_theorem_3_4_10_gaussianProductConvergence_of_exp_tendsto
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance_nonneg : 0 ≤ varianceLimit)
    (hexp :
      durrett2019_lindebergFellerGaussianProductConvergenceExp
        P X varianceLimit) :
    durrett2019_lindebergFellerGaussianProductConvergence
      P X varianceLimit := by
  intro t
  simpa [durrett2019_theorem_3_4_10_gaussian_characteristicFunction_eq_exp
      hvariance_nonneg t] using hexp t

/--
Durrett 2019, Theorem 3.4.10, a full analytic certificate supplies the Gaussian
characteristic-product convergence consumed by the Lévy bridge.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.gaussianProductConvergence
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (C :
      Durrett2019LindebergFellerAnalyticCertificate
        P X varianceLimit) :
    durrett2019_lindebergFellerGaussianProductConvergence
      P X varianceLimit :=
  durrett2019_theorem_3_4_10_gaussianProductConvergence_of_exp_tendsto
    C.variance_pos.le C.product_tendsto_exp

/--
Durrett 2019, Theorem 3.4.10, variance-sum convergence gives convergence of
the row Gaussian exponential targets.
-/
theorem durrett2019_theorem_3_4_10_rowGaussianExpTarget_tendsto_of_varianceSum
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (t : ℝ) :
    Tendsto
      (fun n : ℕ =>
        durrett2019_lindebergFellerRowGaussianExpTarget P X t n)
      atTop
      (𝓝 (Complex.exp (-(varianceLimit * t ^ 2 / 2 : ℝ)))) := by
  have hreal :
      Tendsto
        (fun n : ℕ =>
          -(durrett2019_lindebergFellerVarianceRowSum P X n * (t ^ 2 / 2)))
        atTop
        (𝓝 (-(varianceLimit * (t ^ 2 / 2)))) := by
    exact (hvariance.mul tendsto_const_nhds).neg
  have hcomplex :
      Tendsto
        (fun n : ℕ =>
          ((-(durrett2019_lindebergFellerVarianceRowSum P X n *
              (t ^ 2 / 2)) : ℝ) : ℂ))
        atTop
        (𝓝 (((-(varianceLimit * (t ^ 2 / 2)) : ℝ) : ℂ))) := by
    exact (Complex.continuous_ofReal.tendsto _).comp hreal
  have hexp := hcomplex.cexp
  simpa [durrett2019_lindebergFellerRowGaussianExpTarget, div_eq_mul_inv,
    mul_assoc, mul_comm, mul_left_comm] using hexp

/--
Durrett 2019, Theorem 3.4.10, product approximation to the row Gaussian
exponential target plus variance-sum convergence gives the textbook explicit
Gaussian product limit.
-/
theorem durrett2019_theorem_3_4_10_product_tendsto_exp_of_varianceSum_and_rowGaussianApprox
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (happrox :
      durrett2019_lindebergFellerProductApproximationToRowGaussianExp P X) :
    durrett2019_lindebergFellerGaussianProductConvergenceExp
      P X varianceLimit := by
  intro t
  have htarget :=
    durrett2019_theorem_3_4_10_rowGaussianExpTarget_tendsto_of_varianceSum
      (P := P) (X := X) (varianceLimit := varianceLimit) hvariance t
  have hsum := (happrox t).add htarget
  simpa [durrett2019_lindebergFellerCharacteristicProduct,
    durrett2019_lindebergFellerProductApproximationToRowGaussianExp,
    sub_add_cancel] using hsum

/--
Durrett 2019, Theorem 3.4.10, assemble the row-product approximation from the
two textbook analytic pieces: Taylor/Lindeberg replacement by the quadratic
variance product, and finite-product-to-exponential replacement by the row
Gaussian target.
-/
theorem durrett2019_theorem_3_4_10_productApproximationToRowGaussianExp_of_quadraticVarianceProductApproximations
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hchar_quad :
      durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct
        P X)
    (hquad_exp :
      durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp
        P X) :
    durrett2019_lindebergFellerProductApproximationToRowGaussianExp P X := by
  intro t
  have hsum := (hchar_quad t).add (hquad_exp t)
  simpa [durrett2019_lindebergFellerProductApproximationToRowGaussianExp,
    durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct,
    durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp,
    sub_eq_add_neg, add_assoc, add_comm, add_left_comm] using hsum

/--
Durrett 2019, Theorem 3.4.10, assemble the quadratic-product-to-row-Gaussian
approximation from variance-sum convergence and the Exercise 3.1.1 product
conclusion for `c_{n,m} = -t^2 sigma_{n,m}^2 / 2`.
-/
theorem durrett2019_theorem_3_4_10_quadraticVarianceProductApproximationToRowGaussianExp_of_varianceSum_and_exercise311
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hexercise :
      durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
        P X varianceLimit) :
    durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp
      P X := by
  intro t
  have hprod :=
    durrett2019_theorem_3_4_10_quadraticVarianceProduct_tendsto_exp_of_exercise311
      (P := P) (X := X) (varianceLimit := varianceLimit) hexercise t
  have htarget :=
    durrett2019_theorem_3_4_10_rowGaussianExpTarget_tendsto_of_varianceSum
      (P := P) (X := X) (varianceLimit := varianceLimit) hvariance t
  simpa [durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp]
    using hprod.sub htarget

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate once the
remaining row-product approximation has been proved.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_productApproximationToRowGaussianExp
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (happrox :
      durrett2019_lindebergFellerProductApproximationToRowGaussianExp P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit where
  variance_pos := hvariance_pos
  mean_zero := hmean_zero
  variance_sum := hvariance
  lindeberg := hlindeberg
  product_tendsto_exp :=
    durrett2019_theorem_3_4_10_product_tendsto_exp_of_varianceSum_and_rowGaussianApprox
      hvariance happrox

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from the
quadratic-product split of the remaining product approximation.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_quadraticVarianceProductApproximations
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hchar_quad :
      durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct
        P X)
    (hquad_exp :
      durrett2019_lindebergFellerQuadraticVarianceProductApproximationToRowGaussianExp
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_productApproximationToRowGaussianExp
    hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_theorem_3_4_10_productApproximationToRowGaussianExp_of_quadraticVarianceProductApproximations
      hchar_quad hquad_exp)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from the
Taylor/Lindeberg characteristic-to-quadratic approximation and the Exercise
3.1.1 quadratic-product conclusion.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_characteristicQuadraticApproximation_and_exercise311
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hchar_quad :
      durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct
        P X)
    (hexercise :
      durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
        P X varianceLimit) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_quadraticVarianceProductApproximations
    hvariance_pos hmean_zero hvariance hlindeberg hchar_quad
    (durrett2019_theorem_3_4_10_quadraticVarianceProductApproximationToRowGaussianExp_of_varianceSum_and_exercise311
      hvariance hexercise)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from a supplied
one-factor Taylor/Lindeberg row-sum estimate, the variance-tail split, and
Exercise 3.1.1 for real triangular arrays.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit_and_exercise311
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X)
    (hexercise311 :
      durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit := by
  have hsmall :
      durrett2019_lindebergFellerVarianceRowsEventuallySmall P X :=
    durrett2019_theorem_3_4_10_varianceRowsEventuallySmall_of_lindeberg_and_varianceSplitByTailRowSum
      hlindeberg hsplit
  have hfactor :
      durrett2019_lindebergFellerQuadraticVarianceFactorsEventuallyNormLeOne
        P X :=
    durrett2019_theorem_3_4_10_quadraticVarianceFactorsEventuallyNormLeOne_of_varianceRowsEventuallySmall
      hsmall
  have hchar_quad :
      durrett2019_lindebergFellerCharacteristicProductApproximationToQuadraticVarianceProduct
        P X :=
    durrett2019_theorem_3_4_10_characteristicProductApproximationToQuadraticVarianceProduct_of_errorRowSum
      (P := P) (X := X) hX hfactor herror
  have hexercise :
      durrett2019_lindebergFellerQuadraticVarianceProductConvergenceExp
        P X varianceLimit :=
    durrett2019_theorem_3_4_10_quadraticVarianceProductConvergenceExp_of_varianceSum_lindeberg_varianceSplit_and_exercise311
      (P := P) (X := X) (varianceLimit := varianceLimit)
      hexercise311 hvariance hlindeberg hsplit
  exact
    Durrett2019LindebergFellerAnalyticCertificate.of_characteristicQuadraticApproximation_and_exercise311
      hvariance_pos hmean_zero hvariance hlindeberg hchar_quad hexercise

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from a supplied
one-factor Taylor/Lindeberg row-sum estimate after Exercise 3.1.1 has been
proved.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit_and_exercise311
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hvariance_pos hmean_zero hvariance hlindeberg hsplit herror
    durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate after both
Exercise 3.1.1 and the textbook variance-tail split have been proved from
square-integrable triangular-array rows.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerVarianceSplitByTailRowSum_of_integrableSq
      (P := P) (X := X) hX hX2)
    herror

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from the
finite-row Taylor/Lindeberg bound and square-integrable rows.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hrowBound :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_integrableSq
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hX2 hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero_of_rowBound
      (P := P) (X := X) (varianceLimit := varianceLimit)
      hvariance hlindeberg hrowBound)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from the
one-factor Taylor/Lindeberg bound and square-integrable rows.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_oneFactorBound_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hone :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hX2 hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
      (P := P) (X := X) hone)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from the
scalar Taylor/Lindeberg bound and square-integrable rows.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_taylorBound_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (htaylor :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hX2 hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound
      (P := P) (X := X) hX hmean_zero htaylor)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from the
scalar Taylor expansion bound and square-integrable rows.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_expansionBound_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hexpansion :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hX2 hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound
      (P := P) (X := X) hX hmean_zero hexpansion)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate from Durrett's
Taylor remainder estimate (3.3.3) and square-integrable rows.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_remainderBound_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hX2 hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_remainderBound
      (P := P) (X := X) hX hX2 hmean_zero hremainder)

/--
Durrett 2019, Theorem 3.4.10, assemble the analytic certificate directly from
square-integrable rows.  The scalar characteristic-function Taylor estimate is
supplied by Lemma 3.3.19 above.
-/
theorem Durrett2019LindebergFellerAnalyticCertificate.of_integrableSq
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X) :
    Durrett2019LindebergFellerAnalyticCertificate
      P X varianceLimit :=
  Durrett2019LindebergFellerAnalyticCertificate.of_remainderBound_integrableSq
    (P := P) (X := X) (varianceLimit := varianceLimit)
    hX hX2 hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_integrableSq
      (P := P) (X := X) hX hX2)

/--
Durrett 2019, Theorem 3.4.10 proof bridge: row-wise independence gives the
product formula for the characteristic function of each triangular-array row
sum.
-/
theorem durrett2019_theorem_3_4_10_characteristicFunction_rowSum_eq_product
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (n : ℕ) (t : ℝ) :
    durrett2019_characteristicFunction
        (P.map (durrett2019_lindebergFellerRowSum X n)) t =
      ∏ m ∈ Finset.range n,
        durrett2019_characteristicFunction (P.map (X n m)) t := by
  have hfun :=
    _root_.ProbabilityTheory.iIndepFun.charFun_map_fun_finsetSum_eq_prod
      (P := P) (X := fun m : ℕ => X n m) (s := Finset.range n)
      (fun m _hm => hX n m) (hindep n)
  simpa [durrett2019_characteristicFunction, durrett2019_lindebergFellerRowSum,
    Pi.mul_apply] using congrFun hfun t

/--
Durrett 2019, Theorem 3.4.10 proof bridge: a supplied product convergence
estimate gives convergence of the row-sum characteristic functions.
-/
theorem durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_of_product_tendsto
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hprod : durrett2019_lindebergFellerGaussianProductConvergence P X varianceLimit) :
    ∀ t : ℝ,
      Tendsto
        (fun n : ℕ =>
          durrett2019_characteristicFunction
            (P.map (durrett2019_lindebergFellerRowSum X n)) t)
        atTop
        (𝓝 (durrett2019_characteristicFunction
          (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) t)) := by
  intro t
  simpa [durrett2019_theorem_3_4_10_characteristicFunction_rowSum_eq_product
      (P := P) (X := X) hX hindep] using hprod t

/--
Durrett 2019, Theorem 3.4.10 proof bridge with the textbook's explicit
Gaussian characteristic-function display.
-/
theorem durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_exp_of_product_tendsto_exp
    {Ω : Type u} [MeasurableSpace Ω] {P : Measure Ω}
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hexp :
      durrett2019_lindebergFellerGaussianProductConvergenceExp
        P X varianceLimit) :
    ∀ t : ℝ,
      Tendsto
        (fun n : ℕ =>
          durrett2019_characteristicFunction
            (P.map (durrett2019_lindebergFellerRowSum X n)) t)
        atTop
        (𝓝 (Complex.exp (-(varianceLimit * t ^ 2 / 2 : ℝ)))) := by
  intro t
  simpa [durrett2019_theorem_3_4_10_characteristicFunction_rowSum_eq_product
      (P := P) (X := X) hX hindep] using hexp t

/--
Durrett 2019, Theorem 3.4.10, Lindeberg-Feller source bridge.

Once the Lindeberg-Feller estimates have supplied the row-wise characteristic
function product convergence to the Gaussian limit, Lévy's continuity theorem
gives convergence in distribution of the triangular-array row sums.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_characteristicFunction_product_tendsto
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hprod : durrett2019_lindebergFellerGaussianProductConvergence P X varianceLimit)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' := by
  refine
    durrett2019_theorem_3_3_17_tendstoInDistribution_of_characteristicFunction_tendsto
      (X := fun n => durrett2019_lindebergFellerRowSum X n) (Z := Y)
      ?_ hY.aemeasurable ?_
  · intro n
    unfold durrett2019_lindebergFellerRowSum
    exact Finset.aemeasurable_fun_sum _ fun m _hm => hX n m
  · intro t
    have hrow :=
      durrett2019_theorem_3_4_10_rowSum_characteristicFunction_tendsto_of_product_tendsto
        (P := P) (X := X) (varianceLimit := varianceLimit) hX hindep hprod t
    simpa [hY.map_eq] using hrow

/--
Durrett 2019, Theorem 3.4.10, source-facing bridge from the analytic
Lindeberg-Feller certificate to convergence in distribution.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_analyticCertificate
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (C :
      Durrett2019LindebergFellerAnalyticCertificate
        P X varianceLimit)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_characteristicFunction_product_tendsto
    hX hindep C.gaussianProductConvergence hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from the
current primitive frontier: row-wise independence, the one-factor
Taylor/Lindeberg error row sum, the variance-tail split, and Exercise 3.1.1.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit_and_exercise311
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X)
    (hexercise311 :
      durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_analyticCertificate
    hX hindep
    (Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_varianceSplit_and_exercise311
      (P := P) (X := X) (varianceLimit := varianceLimit)
      hX hvariance_pos hmean_zero hvariance hlindeberg hsplit herror
      hexercise311)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from
row-wise independence, a supplied one-factor Taylor/Lindeberg error row sum,
and the variance-tail split after Exercise 3.1.1 has been proved.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hsplit : durrett2019_lindebergFellerVarianceSplitByTailRowSum P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_varianceSplit_and_exercise311
    (P := P) (P' := P') (X := X) (varianceLimit := varianceLimit) (Y := Y)
    hX hindep hvariance_pos hmean_zero hvariance hlindeberg hsplit herror
    durrett2019_exercise_3_1_1_realTriangularArrayProductTheorem_from_logEstimate
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from a
supplied one-factor Taylor/Lindeberg characteristic-function error row-sum
estimate after the variance-tail split has been proved from square-integrable
rows.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSum_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (herror :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumTendstoZero
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_analyticCertificate
    hX hindep
    (Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSum_integrableSq
      (P := P) (X := X) (varianceLimit := varianceLimit)
      hX hX2 hvariance_pos hmean_zero hvariance hlindeberg herror)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from the
finite-row Taylor/Lindeberg bound and square-integrable rows.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hrowBound :
      durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_analyticCertificate
    hX hindep
    (Durrett2019LindebergFellerAnalyticCertificate.of_errorRowSumBound_integrableSq
      (P := P) (X := X) (varianceLimit := varianceLimit)
      hX hX2 hvariance_pos hmean_zero hvariance hlindeberg hrowBound)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from the
one-factor Taylor/Lindeberg bound and square-integrable rows.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_oneFactorBound_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hone :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorBound
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq
    hX hX2 hindep hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_oneFactorBound
      (P := P) (X := X) hone)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from the
scalar Taylor/Lindeberg bound and square-integrable rows.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_taylorBound_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (htaylor :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorBound
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq
    hX hX2 hindep hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_taylorBound
      (P := P) (X := X) hX hmean_zero htaylor)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from the
scalar Taylor expansion bound and square-integrable rows.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_expansionBound_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hexpansion :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorExpansionBound
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq
    hX hX2 hindep hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_expansionBound
      (P := P) (X := X) hX hmean_zero hexpansion)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from
Durrett's Taylor remainder estimate (3.3.3) and square-integrable rows.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_remainderBound_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hremainder :
      durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound
        P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_errorRowSumBound_integrableSq
    hX hX2 hindep hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticErrorRowSumBound_of_remainderBound
      (P := P) (X := X) hX hX2 hmean_zero hremainder)
    hY

/--
Durrett 2019, Theorem 3.4.10, source-facing Lindeberg-Feller bridge from
square-integrable rows, Lindeberg's condition, variance convergence, and the
scalar Lemma 3.3.19 Taylor estimate.
-/
theorem durrett2019_theorem_3_4_10_lindebergFeller_of_integrableSq
    {Ω Ω' : Type u} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure P']
    {X : ℕ -> ℕ -> Ω -> ℝ} {varianceLimit : ℝ} {Y : Ω' -> ℝ}
    (hX : ∀ n m, AEMeasurable (X n m) P)
    (hX2 : ∀ n m, Integrable (fun ω => X n m ω ^ 2) P)
    (hindep : durrett2019_lindebergFellerRowIndependent P X)
    (hvariance_pos : 0 < varianceLimit)
    (hmean_zero : durrett2019_lindebergFellerMeanZero P X)
    (hvariance :
      durrett2019_lindebergFellerVarianceSumConvergence P X varianceLimit)
    (hlindeberg : durrett2019_lindebergFellerCondition P X)
    (hY : _root_.ProbabilityTheory.HasLaw Y
      (_root_.ProbabilityTheory.gaussianReal 0 varianceLimit.toNNReal) P') :
    TendstoInDistribution
      (fun n => durrett2019_lindebergFellerRowSum X n)
      atTop Y (fun _ => P) P' :=
  durrett2019_theorem_3_4_10_lindebergFeller_of_remainderBound_integrableSq
    hX hX2 hindep hvariance_pos hmean_zero hvariance hlindeberg
    (durrett2019_lindebergFellerCharacteristicQuadraticOneFactorTaylorRemainderBound_of_integrableSq
      (P := P) (X := X) hX hX2)
    hY

/--
Durrett early-chapter pi-system uniqueness shape.

Probability laws agreeing on a pi-system that generates the measurable space
agree everywhere.  This is a Chapter 1/2 source-crosswalk bridge used before
the product-law and independence wrappers.
-/
theorem durrett2019_piSystem_probability_ext
    {Ω : Type u} [mΩ : MeasurableSpace Ω]
    (μ ν : MeasureTheory.ProbabilityMeasure Ω)
    (C : Set (Set Ω)) (hΩ : mΩ = StatInference.ProbabilityMeasure.GeneratedSigma Ω C)
    (hC : IsPiSystem C)
    (hμν : ∀ s ∈ C, μ s = ν s) :
    μ = ν := by
  exact StatInference.ProbabilityMeasure.probabilityMeasure_ext_of_generate_finite
    μ ν C hΩ hC hμν

end ProbabilityTheory
end StatInference
