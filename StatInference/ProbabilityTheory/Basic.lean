import StatInference.EmpiricalProcess.RealHalfLineGC
import StatInference.ProbabilityMeasure.BorelCantelli
import StatInference.ProbabilityMeasure.GeneratedSigma
import StatInference.ProbabilityMeasure.ProductMeasure
import StatInference.ProbabilityMeasure.StrongLaw
import StatInference.ProbabilityMeasure.WeakConvergence

/-!
# Durrett 2019 probability-theory wrappers

This module starts the Durrett 2019 probability-theory lane.  It packages
source-shaped theorem wrappers over the reusable probability-measure layer, so
later files can track Durrett item numbers without duplicating foundations.
-/

namespace StatInference
namespace ProbabilityTheory

open Filter MeasureTheory

open scoped BigOperators ENNReal Topology Function

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
