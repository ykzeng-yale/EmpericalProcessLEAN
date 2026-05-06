import StatInference.EmpiricalProcess.RealHalfLineGC
import StatInference.ProbabilityMeasure.BorelCantelli
import StatInference.ProbabilityMeasure.GeneratedSigma
import StatInference.ProbabilityMeasure.ProductMeasure
import StatInference.ProbabilityMeasure.StrongLaw

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

universe u v w

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
