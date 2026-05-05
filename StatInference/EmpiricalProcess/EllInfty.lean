import Mathlib.Analysis.Normed.Lp.LpEquiv
import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.MeasureTheory.Function.StronglyMeasurable.Basic

/-!
# VdV&W `ell_infty(T)` process-space wrappers

This file records the first local `ell_infty(T)` substrate for the Chapter 1
empirical-process foundations.  The implementation reuses pinned mathlib's
`lp (fun _ : T => ℝ) ∞`, whose elements are bounded real-valued functions on
`T`.  These declarations are foundation wrappers only: they do not assert
VdV&W separability, asymptotic tightness, or the finite-dimensional converse.
-/

namespace StatInference

open MeasureTheory
open scoped ENNReal

noncomputable section

/-- VdV&W local name for `ell_infty(T)`, the bounded real-valued functions on `T`. -/
abbrev VdVWEllInfty (T : Type*) : Type _ :=
  lp (fun _ : T => ℝ) ∞

namespace VdVWEllInfty

variable {T Ω : Type*}

/-- Membership in the mathlib `ℓ^∞` predicate is exactly boundedness of the norm range. -/
theorem memLp_infty_iff {f : T -> ℝ} :
    Memℓp f (∞ : ℝ≥0∞) ↔ BddAbove (Set.range fun t => ‖f t‖) :=
  memℓp_infty_iff

/-- Build an `ell_infty(T)` element from a bounded real-valued function. -/
def ofBounded (f : T -> ℝ) (hf : BddAbove (Set.range fun t => ‖f t‖)) :
    VdVWEllInfty T :=
  ⟨f, memℓp_infty hf⟩

@[simp]
theorem ofBounded_apply (f : T -> ℝ) (hf : BddAbove (Set.range fun t => ‖f t‖)) (t : T) :
    ofBounded f hf t = f t :=
  rfl

/-- Every `ell_infty(T)` element is bounded as an ordinary function. -/
theorem bddAbove_range_norm (x : VdVWEllInfty T) :
    BddAbove (Set.range fun t => ‖x t‖) :=
  (lp.memℓp x).bddAbove

/-- The `ell_infty` norm is the supremum of coordinate norms. -/
theorem norm_eq_ciSup (x : VdVWEllInfty T) :
    ‖x‖ = ⨆ t, ‖x t‖ :=
  lp.norm_eq_ciSup x

/-- Coordinate evaluations are bounded by the `ell_infty` norm. -/
theorem norm_apply_le_norm (x : VdVWEllInfty T) (t : T) :
    ‖x t‖ ≤ ‖x‖ :=
  lp.norm_apply_le_norm ENNReal.top_ne_zero x t

/-- A pointwise uniform coordinate bound controls the `ell_infty` norm. -/
theorem norm_le_of_forall_le {x : VdVWEllInfty T} {C : ℝ}
    (hC : 0 ≤ C) (hx : ∀ t, ‖x t‖ ≤ C) :
    ‖x‖ ≤ C :=
  lp.norm_le_of_forall_le hC hx

/-- Coordinate evaluation as a continuous linear map on `ell_infty(T)`. -/
def evalCLM (t : T) : VdVWEllInfty T →L[ℝ] ℝ :=
  lp.evalCLM ℝ (fun _ : T => ℝ) (∞ : ℝ≥0∞) t

@[simp]
theorem evalCLM_apply (t : T) (x : VdVWEllInfty T) :
    evalCLM t x = x t :=
  rfl

/--
A sample-indexed process has bounded sample paths when every realized path is
an element of `ell_infty(T)`.
-/
def IsBoundedSamplePath (X : Ω -> T -> ℝ) : Prop :=
  ∀ ω, BddAbove (Set.range fun t => ‖X ω t‖)

/-- Turn a process with bounded sample paths into an `ell_infty(T)`-valued map. -/
def processMap (X : Ω -> T -> ℝ) (hX : IsBoundedSamplePath X) :
    Ω -> VdVWEllInfty T :=
  fun ω => ofBounded (X ω) (hX ω)

@[simp]
theorem processMap_apply (X : Ω -> T -> ℝ) (hX : IsBoundedSamplePath X) (ω : Ω) (t : T) :
    processMap X hX ω t = X ω t :=
  rfl

/-- Measurability of an `ell_infty(T)`-valued process implies coordinate measurability. -/
theorem measurable_coordinate_of_measurable_ellInfty [MeasurableSpace Ω]
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    {X : Ω -> VdVWEllInfty T} (hX : Measurable X) (t : T) :
    Measurable fun ω => X ω t :=
  (evalCLM t).continuous.measurable.comp hX

/-- A strongly measurable `ell_infty(T)`-valued process has strongly measurable coordinates. -/
theorem stronglyMeasurable_coordinate_of_stronglyMeasurable_ellInfty [MeasurableSpace Ω]
    {X : Ω -> VdVWEllInfty T} (hX : StronglyMeasurable X) (t : T) :
    StronglyMeasurable fun ω => X ω t :=
  (evalCLM t).continuous.comp_stronglyMeasurable hX

/-- Finite-dimensional coordinate restriction from `ell_infty(T)` to `I -> ℝ`. -/
def finiteRestrict (I : Finset T) (x : VdVWEllInfty T) : I -> ℝ :=
  fun t => x t

@[simp]
theorem finiteRestrict_apply (I : Finset T) (x : VdVWEllInfty T) (t : I) :
    finiteRestrict I x t = x t :=
  rfl

/-- The finite-dimensional coordinate restriction is continuous. -/
theorem continuous_finiteRestrict (I : Finset T) :
    Continuous (finiteRestrict (T := T) I) := by
  exact continuous_pi fun t => (evalCLM (T := T) t).continuous

/-- The finite-dimensional coordinate restriction is measurable for the Borel structure. -/
theorem measurable_finiteRestrict
    (I : Finset T)
    [MeasurableSpace (VdVWEllInfty T)] [BorelSpace (VdVWEllInfty T)]
    [MeasurableSpace (I -> ℝ)] [BorelSpace (I -> ℝ)] :
    Measurable (finiteRestrict (T := T) I) :=
  (continuous_finiteRestrict (T := T) I).measurable

/--
For finite index sets, `ell_infty(T)` is linearly homeomorphic to the ordinary
finite product `T -> ℝ`.
-/
def finiteContinuousLinearEquiv [Fintype T] :
    VdVWEllInfty T ≃L[ℝ] (T -> ℝ) :=
  (lpPiLpₗᵢ (fun _ : T => ℝ) ℝ).toContinuousLinearEquiv.trans
    (PiLp.continuousLinearEquiv (∞ : ℝ≥0∞) ℝ (fun _ : T => ℝ))

@[simp]
theorem finiteContinuousLinearEquiv_apply [Fintype T] (x : VdVWEllInfty T) :
    finiteContinuousLinearEquiv (T := T) x = x :=
  rfl

@[simp]
theorem finiteContinuousLinearEquiv_symm_apply [Fintype T] (f : T -> ℝ) (t : T) :
    (finiteContinuousLinearEquiv (T := T)).symm f t = f t :=
  rfl

end VdVWEllInfty

end

end StatInference
