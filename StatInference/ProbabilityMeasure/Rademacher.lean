import Mathlib.Probability.HasLawExists
import Mathlib.Probability.IdentDistrib
import Mathlib.Probability.Moments.SubGaussian
import Mathlib.Probability.ProbabilityMassFunction.Integrals

/-!
# Rademacher-sign probability wrappers

This module records reusable probability/measure primitives for iid
Rademacher signs.  The immediate downstream consumer is the empirical-process
symmetrization lane for VdV&W Theorem 2.4.3, but the declarations live under
the content-based Billingsley/ProbabilityMeasure folder because they are basic
probability infrastructure.

These are compiled local wrappers, not yet source-audited exact Billingsley
theorem reports.
-/

namespace StatInference
namespace ProbabilityMeasure

open MeasureTheory ProbabilityTheory

open scoped NNReal

universe u

/-- The fair Bernoulli PMF used to generate textbook Rademacher signs. -/
noncomputable def rademacherBoolPMF : PMF Bool :=
  PMF.bernoulli (1 / 2 : ℝ≥0) (by norm_num)

/-- The Bool-to-real sign map sending the Bernoulli outcome to `±1`. -/
def boolToRademacherSign (b : Bool) : ℝ :=
  cond b (1 : ℝ) (-1)

/-- The probability law of the fair Bernoulli source for Rademacher signs. -/
noncomputable def rademacherBoolLaw : Measure Bool :=
  rademacherBoolPMF.toMeasure

instance : IsProbabilityMeasure rademacherBoolLaw := by
  unfold rademacherBoolLaw rademacherBoolPMF
  infer_instance

/-- The Bool-to-real Rademacher sign map is measurable. -/
theorem measurable_boolToRademacherSign :
    Measurable boolToRademacherSign := by
  fun_prop

/-- The Bool-to-real Rademacher sign has support contained in `{−1, 1}`. -/
theorem boolToRademacherSign_eq_neg_one_or_one (b : Bool) :
    boolToRademacherSign b = -1 ∨ boolToRademacherSign b = 1 := by
  cases b <;> simp [boolToRademacherSign]

/-- The Bool-to-real Rademacher sign is bounded by one in absolute value. -/
theorem abs_boolToRademacherSign_le_one (b : Bool) :
    |boolToRademacherSign b| ≤ 1 := by
  rcases boolToRademacherSign_eq_neg_one_or_one b with hneg | hpos
  · simp [hneg]
  · simp [hpos]

/-- The fair Bool-to-real Rademacher sign has mean zero. -/
theorem integral_boolToRademacherSign_eq_zero :
    ∫ b, boolToRademacherSign b ∂rademacherBoolLaw = 0 := by
  unfold rademacherBoolLaw
  rw [PMF.integral_eq_sum]
  norm_num [rademacherBoolPMF, boolToRademacherSign, PMF.bernoulli_apply]

/-- The pushed-forward real-valued Rademacher PMF on `{−1, 1}`. -/
noncomputable def rademacherPMF : PMF ℝ :=
  PMF.map boolToRademacherSign rademacherBoolPMF

/-- The real-valued Rademacher probability law on `{−1, 1}`. -/
noncomputable def rademacherLaw : Measure ℝ :=
  rademacherPMF.toMeasure

instance : IsProbabilityMeasure rademacherLaw := by
  unfold rademacherLaw rademacherPMF
  infer_instance

/-- The Bool-to-real sign map has the real-valued Rademacher law. -/
theorem boolToRademacherSign_hasLaw :
    HasLaw boolToRademacherSign rademacherLaw rademacherBoolLaw := by
  refine ⟨measurable_boolToRademacherSign.aemeasurable, ?_⟩
  exact PMF.toMeasure_map (p := rademacherBoolPMF)
    (f := boolToRademacherSign) measurable_boolToRademacherSign

/-- The canonical fair Bool-to-real Rademacher sign is sub-Gaussian. -/
theorem boolToRademacherSign_hasSubgaussianMGF :
    HasSubgaussianMGF boolToRademacherSign 1 rademacherBoolLaw := by
  have hmeas : AEMeasurable boolToRademacherSign rademacherBoolLaw :=
    measurable_boolToRademacherSign.aemeasurable
  have hbound : ∀ᵐ b ∂rademacherBoolLaw,
      boolToRademacherSign b ∈ Set.Icc (-1 : ℝ) 1 := by
    exact ae_of_all _ (fun b => by
      cases b <;> simp [boolToRademacherSign])
  have hzero : ∫ b, boolToRademacherSign b ∂rademacherBoolLaw = 0 :=
    integral_boolToRademacherSign_eq_zero
  have h := hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
    (X := boolToRademacherSign) (μ := rademacherBoolLaw)
    (a := (-1 : ℝ)) (b := 1) hmeas hbound hzero
  convert h using 1
  norm_num

/-- The identity map under the real-valued Rademacher law is sub-Gaussian. -/
theorem id_rademacherLaw_hasSubgaussianMGF :
    HasSubgaussianMGF id 1 rademacherLaw := by
  exact boolToRademacherSign_hasSubgaussianMGF.congr_identDistrib
    (boolToRademacherSign_hasLaw.identDistrib HasLaw.id)

/-- A deterministic sign vector supported on `{-1, 1}`. -/
def RademacherSignVector {n : ℕ} (sign : Fin n -> ℝ) : Prop :=
  ∀ i, sign i = -1 ∨ sign i = 1

/-- Rademacher sign vectors are uniformly bounded by one in absolute value. -/
theorem RademacherSignVector.abs_le_one
    {n : ℕ} {sign : Fin n -> ℝ}
    (hsign : RademacherSignVector sign) :
    ∀ i, |sign i| ≤ 1 := by
  intro i
  rcases hsign i with hneg | hpos
  · simp [hneg]
  · simp [hpos]

/--
Existence of finitely many iid real-valued Rademacher signs.

This is the reusable probability-space construction needed for
symmetrization: mathlib supplies iid Bool variables, and this wrapper pushes
them through `boolToRademacherSign`.
-/
theorem exists_iid_rademacherSigns (n : ℕ) :
    ∃ Ω : Type, ∃ _ : MeasurableSpace Ω, ∃ P : Measure Ω,
      ∃ sign : Fin n -> Ω -> ℝ,
        (∀ i, Measurable (sign i)) ∧
        (∀ i, HasLaw (sign i) rademacherLaw P) ∧
        iIndepFun sign P ∧ IsProbabilityMeasure P ∧
        (∀ i, HasSubgaussianMGF (sign i) 1 P) ∧
        (∀ᵐ ω ∂P, RademacherSignVector (fun i => sign i ω)) := by
  obtain ⟨Ω, mΩ, P, boolSign, hmeas, hlaw, hindep, hprob⟩ :=
    ProbabilityTheory.exists_iid (Fin n) rademacherBoolLaw
  letI : MeasurableSpace Ω := mΩ
  let sign : Fin n -> Ω -> ℝ :=
    fun i => boolToRademacherSign ∘ boolSign i
  refine ⟨Ω, mΩ, P, sign, ?_, ?_, ?_, hprob, ?_, ?_⟩
  · intro i
    exact measurable_boolToRademacherSign.comp (hmeas i)
  · intro i
    exact boolToRademacherSign_hasLaw.comp (hlaw i)
  · exact hindep.comp (fun _ => boolToRademacherSign)
      (fun _ => measurable_boolToRademacherSign)
  · intro i
    have hident :
        IdentDistrib boolToRademacherSign (sign i) rademacherBoolLaw P :=
      boolToRademacherSign_hasLaw.identDistrib
        (boolToRademacherSign_hasLaw.comp (hlaw i))
    exact boolToRademacherSign_hasSubgaussianMGF.congr_identDistrib hident
  · exact ae_of_all _ (fun ω i =>
      boolToRademacherSign_eq_neg_one_or_one (boolSign i ω))

end ProbabilityMeasure
end StatInference
