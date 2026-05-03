import Mathlib.Topology.MetricSpace.CoveringNumbers
import StatInference.EmpiricalProcess.Average

/-!
# Primitive covering numbers

This module records the VdV&W Definition 2.1.5 covering-number layer using the
pinned mathlib covering-number API.

Mathlib's `Metric.externalCoveringNumber` is the closest existing primitive to
the textbook convention: the cover centers live in the ambient space and need
not belong to the target class.  Mathlib uses closed extended-metric balls
(`edist x y ≤ ε`).  Textbook displays often use open norm balls
(`‖x - y‖ < ε`), so exact textbook statements can insert the usual slack in
the radius when that distinction matters.
-/

namespace StatInference

open EMetric Metric Set
open scoped ENNReal NNReal

universe u v

/--
VdV&W-style external covering number.

For a target set `target` in a pseudo-emetric ambient space, this is the
minimal cardinality, in `ℕ∞`, of a cover by closed balls of radius `epsilon`.
The centers are arbitrary ambient points, matching the textbook convention that
centers need not belong to the class being covered.
-/
noncomputable def vdVWCoveringNumber {Space : Type u} [PseudoEMetricSpace Space]
    (epsilon : ℝ≥0) (target : Set Space) : ℕ∞ :=
  Metric.externalCoveringNumber epsilon target

/-- A finite closed-ball cover with an explicit cardinality. -/
structure FiniteMetricCoverAtCard {Space : Type u} [PseudoEMetricSpace Space]
    (target : Set Space) (epsilon : ℝ≥0) (cardinality : ℕ) where
  center : Fin cardinality -> Space
  centerOf : ∀ x, x ∈ target -> Fin cardinality
  edist_le :
    ∀ x hx,
      edist x (center (centerOf x hx)) ≤ epsilon

namespace FiniteMetricCoverAtCard

/-- The finite set of centers supplied by an explicit-cardinality cover. -/
def centerSet {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) : Set Space :=
  Set.range cover.center

/-- The supplied center set is finite. -/
theorem finite_centerSet {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) :
    cover.centerSet.Finite :=
  Set.finite_range cover.center

/-- The supplied center set is a mathlib closed-ball cover. -/
theorem isCover_centerSet {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) :
    Metric.IsCover epsilon target cover.centerSet := by
  intro x hx
  exact ⟨cover.center (cover.centerOf x hx), ⟨cover.centerOf x hx, rfl⟩,
    cover.edist_le x hx⟩

/--
An explicit finite VdV&W cover makes the mathlib external covering number
finite.
-/
theorem vdVWCoveringNumber_lt_top {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0} {cardinality : ℕ}
    (cover : FiniteMetricCoverAtCard target epsilon cardinality) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  unfold vdVWCoveringNumber
  exact lt_of_le_of_lt
    (Metric.IsCover.externalCoveringNumber_le_encard cover.isCover_centerSet)
    cover.finite_centerSet.encard_lt_top

end FiniteMetricCoverAtCard

/--
Finite covering-number hypothesis in witness form: there exists a finite
closed-ball cover at the given radius.
-/
def HasFiniteMetricCover {Space : Type u} [PseudoEMetricSpace Space]
    (target : Set Space) (epsilon : ℝ≥0) : Prop :=
  ∃ cardinality : ℕ,
    Nonempty (FiniteMetricCoverAtCard target epsilon cardinality)

/-- A finite-cover witness makes the VdV&W covering number finite. -/
theorem vdVWCoveringNumber_lt_top_of_hasFiniteMetricCover
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0}
    (hfinite : HasFiniteMetricCover target epsilon) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  rcases hfinite with ⟨cardinality, hcover⟩
  exact hcover.elim fun cover => cover.vdVWCoveringNumber_lt_top

/-- A finite target set has finite VdV&W covering number at every radius. -/
theorem vdVWCoveringNumber_lt_top_of_finite
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} (epsilon : ℝ≥0)
    (htarget : target.Finite) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  unfold vdVWCoveringNumber
  exact lt_of_le_of_lt
    (Metric.externalCoveringNumber_le_encard_self target)
    htarget.encard_lt_top

/-- A totally bounded target has finite VdV&W covering number at every positive radius. -/
theorem vdVWCoveringNumber_lt_top_of_totallyBounded
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon : ℝ≥0}
    (hepsilon : epsilon ≠ 0) (htarget : TotallyBounded target) :
    vdVWCoveringNumber epsilon target < ⊤ := by
  rcases Metric.exists_finite_isCover_of_totallyBounded hepsilon htarget with
    ⟨centers, _hcenters_subset, hcenters_finite, hcover⟩
  unfold vdVWCoveringNumber
  exact lt_of_le_of_lt
    (Metric.IsCover.externalCoveringNumber_le_encard hcover)
    hcenters_finite.encard_lt_top

/-- Larger radii cannot increase the external covering number. -/
theorem vdVWCoveringNumber_anti
    {Space : Type u} [PseudoEMetricSpace Space]
    {target : Set Space} {epsilon delta : ℝ≥0}
    (h : epsilon ≤ delta) :
    vdVWCoveringNumber delta target ≤ vdVWCoveringNumber epsilon target := by
  exact Metric.externalCoveringNumber_anti h

/-- Covering a subset is no harder than covering the larger set. -/
theorem vdVWCoveringNumber_mono_set
    {Space : Type u} [PseudoEMetricSpace Space]
    {target larger : Set Space} {epsilon : ℝ≥0}
    (hsubset : target ⊆ larger) :
    vdVWCoveringNumber epsilon target ≤ vdVWCoveringNumber epsilon larger := by
  exact Metric.externalCoveringNumber_mono_set hsubset

/-!
## Deterministic empirical `L1(P_n)` covering numbers

Theorem 2.4.3 uses the random covering number
`N(epsilon, F_M, L1(P_n))`.  The definitions in this section provide the
fixed-sample surface: once a random sample path is fixed, `P_n` is just the
finite empirical average over that sample.
-/

/-- Empirical `L1(P_n)` distance between two real-valued functions on a fixed sample. -/
noncomputable def empiricalL1Distance {Observation : Type u} {n : ℕ}
    (sample : SampleAt Observation n)
    (f g : Observation -> ℝ) : ℝ :=
  empiricalAverage sample fun observation => |f observation - g observation|

/-- Empirical `L1(P_n)` distance is measurable in the sample for measurable endpoints. -/
theorem measurable_empiricalL1Distance_of_measurable
    {Observation : Type u} [MeasurableSpace Observation] {n : ℕ}
    {f g : Observation -> ℝ}
    (hf : Measurable f) (hg : Measurable g) :
    Measurable fun sample : SampleAt Observation n =>
      empiricalL1Distance sample f g := by
  unfold empiricalL1Distance empiricalAverage
  exact
    (Finset.measurable_fun_sum Finset.univ fun i _hi =>
      continuous_abs.measurable.comp
        ((hf.comp (measurable_pi_apply i)).sub
          (hg.comp (measurable_pi_apply i)))).div_const (n : ℝ)

/-- Empirical `L1(P_n)` distances are nonnegative. -/
theorem empiricalL1Distance_nonneg {Observation : Type u} {n : ℕ}
    (sample : SampleAt Observation n)
    (f g : Observation -> ℝ) :
    0 ≤ empiricalL1Distance sample f g := by
  unfold empiricalL1Distance empiricalAverage
  exact div_nonneg
    (Finset.sum_nonneg fun i _hi => abs_nonneg (f (sample i) - g (sample i)))
    (Nat.cast_nonneg n)

/-- The empirical `L1(P_n)` distance from a function to itself is zero. -/
theorem empiricalL1Distance_self {Observation : Type u} {n : ℕ}
    (sample : SampleAt Observation n)
    (f : Observation -> ℝ) :
    empiricalL1Distance sample f f = 0 := by
  simp [empiricalL1Distance, empiricalAverage]

/-- Empirical `L1(P_n)` distance is symmetric. -/
theorem empiricalL1Distance_comm {Observation : Type u} {n : ℕ}
    (sample : SampleAt Observation n)
    (f g : Observation -> ℝ) :
    empiricalL1Distance sample f g =
      empiricalL1Distance sample g f := by
  unfold empiricalL1Distance empiricalAverage
  congr 1
  exact Finset.sum_congr rfl fun i _hi => abs_sub_comm (f (sample i)) (g (sample i))

/-- Empirical `L1(P_n)` distance satisfies the triangle inequality. -/
theorem empiricalL1Distance_triangle {Observation : Type u} {n : ℕ}
    (sample : SampleAt Observation n)
    (f g h : Observation -> ℝ) :
    empiricalL1Distance sample f h ≤
      empiricalL1Distance sample f g + empiricalL1Distance sample g h := by
  unfold empiricalL1Distance empiricalAverage
  have hsum :
      (∑ i : Fin n, |f (sample i) - h (sample i)|) ≤
        ∑ i : Fin n,
          (|f (sample i) - g (sample i)| +
            |g (sample i) - h (sample i)|) := by
    exact Finset.sum_le_sum fun i _hi => by
      have hdecomp :
          f (sample i) - h (sample i) =
            (f (sample i) - g (sample i)) +
              (g (sample i) - h (sample i)) := by
        ring
      rw [hdecomp]
      exact abs_add_le _ _
  calc
    (∑ i : Fin n, |f (sample i) - h (sample i)|) / (n : ℝ)
        ≤
      (∑ i : Fin n,
          (|f (sample i) - g (sample i)| +
            |g (sample i) - h (sample i)|)) / (n : ℝ) :=
        div_le_div_of_nonneg_right hsum (Nat.cast_nonneg n)
    _ =
      (∑ i : Fin n, |f (sample i) - g (sample i)|) / (n : ℝ) +
        (∑ i : Fin n, |g (sample i) - h (sample i)|) / (n : ℝ) := by
        rw [Finset.sum_add_distrib]
        ring

/--
An explicit finite empirical `L1(P_n)` net over a class.

Centers are required to belong to the target class, matching the finite net
`G ⊂ F_M` used in the proof of VdV&W Theorem 2.4.3.
-/
structure FiniteEmpiricalL1CoverAtCard {Observation : Type u} {Index : Type v}
    {n : ℕ} (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (epsilon : ℝ) (cardinality : ℕ) where
  center : Fin cardinality -> Index
  center_mem : ∀ centerIndex, center centerIndex ∈ indexClass
  centerOf : ∀ index, index ∈ indexClass -> Fin cardinality
  dist_le :
    ∀ index hindex,
      empiricalL1Distance sample (classFun index)
        (classFun (center (centerOf index hindex))) ≤ epsilon

namespace FiniteEmpiricalL1CoverAtCard

/-- The finite center set of a supplied empirical `L1(P_n)` net. -/
def centerSet {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality) :
    Set Index :=
  Set.range cover.center

/-- The supplied empirical-net center set is finite. -/
theorem finite_centerSet {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality) :
    cover.centerSet.Finite :=
  Set.finite_range cover.center

/-- The supplied empirical-net centers lie in the target class. -/
theorem centerSet_subset {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality) :
    cover.centerSet ⊆ indexClass := by
  intro index hindex
  rcases hindex with ⟨centerIndex, rfl⟩
  exact cover.center_mem centerIndex

/-- Every target index has a supplied empirical-net center within `epsilon`. -/
theorem exists_center {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    {index : Index} (hindex : index ∈ indexClass) :
    ∃ center, center ∈ cover.centerSet ∧ center ∈ indexClass ∧
      empiricalL1Distance sample (classFun index) (classFun center) ≤ epsilon := by
  refine ⟨cover.center (cover.centerOf index hindex), ?_, ?_, ?_⟩
  · exact ⟨cover.centerOf index hindex, rfl⟩
  · exact cover.center_mem (cover.centerOf index hindex)
  · exact cover.dist_le index hindex

/--
A supplied empirical cover of a nonempty class has positive cardinality.

This packages the `centerOf` field as the positivity bridge needed by
finite-center maximal and tail bounds that use a nonempty `Fin cardinality`
index type.
-/
theorem cardinality_pos_of_nonempty {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    (hindexClass : ∃ index, index ∈ indexClass) :
    0 < cardinality := by
  rcases hindexClass with ⟨index, hindex⟩
  exact lt_of_le_of_lt (Nat.zero_le _) (cover.centerOf index hindex).isLt

/--
Pad a supplied empirical cover to any larger cardinality.

The extra slots are filled with an arbitrary class member, so this is only
available for nonempty classes.  This bridges least-cardinality `Nat.find`
covers to externally supplied cardinality bounds.
-/
noncomputable def pad_cardinality {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality largerCardinality : ℕ}
    (cover :
      FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)
    (hindexClass : ∃ index, index ∈ indexClass)
    (hle : cardinality ≤ largerCardinality) :
    FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
      largerCardinality := by
  classical
  let baseIndex : Index := hindexClass.choose
  have hbaseIndex : baseIndex ∈ indexClass := hindexClass.choose_spec
  refine
    { center := fun centerIndex =>
        if hlt : (centerIndex : ℕ) < cardinality then
          cover.center ⟨centerIndex, hlt⟩
        else
          baseIndex
      center_mem := ?_
      centerOf := fun index hindex => Fin.castLE hle (cover.centerOf index hindex)
      dist_le := ?_ }
  · intro centerIndex
    by_cases hlt : (centerIndex : ℕ) < cardinality
    · simp [hlt, cover.center_mem]
    · simp [hlt, hbaseIndex]
  · intro index hindex
    have hlt :
        ((Fin.castLE hle (cover.centerOf index hindex) :
          Fin largerCardinality) : ℕ) < cardinality := by
      exact (cover.centerOf index hindex).isLt
    simpa [hlt] using cover.dist_le index hindex

end FiniteEmpiricalL1CoverAtCard

/-- Finite empirical `L1(P_n)` covering hypothesis in witness form. -/
def HasFiniteEmpiricalL1Cover {Observation : Type u} {Index : Type v}
    {n : ℕ} (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (epsilon : ℝ) : Prop :=
  ∃ cardinality : ℕ,
    Nonempty
      (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon cardinality)

/-- The least supplied finite empirical `L1(P_n)` cover cardinality. -/
noncomputable def finiteEmpiricalL1CoveringNumberCard
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon) : ℕ :=
  by
    classical
    exact Nat.find hfinite

/-- The least finite empirical-cover cardinality is invariant under sample equality. -/
theorem finiteEmpiricalL1CoveringNumberCard_congr_sample
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample sample' : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hsample : sample = sample')
    (hfinite :
      HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon)
    (hfinite' :
      HasFiniteEmpiricalL1Cover sample' indexClass classFun epsilon) :
    finiteEmpiricalL1CoveringNumberCard hfinite =
      finiteEmpiricalL1CoveringNumberCard hfinite' := by
  subst hsample
  simp [finiteEmpiricalL1CoveringNumberCard]

/--
The deterministic empirical `L1(P_n)` covering number.

If a finite empirical `epsilon`-net exists, this is the least supplied
cardinality, coerced to `ℕ∞`; otherwise it is `⊤`.
-/
noncomputable def empiricalL1CoveringNumber
    {Observation : Type u} {Index : Type v} {n : ℕ}
    (sample : SampleAt Observation n)
    (indexClass : Set Index) (classFun : Index -> Observation -> ℝ)
    (epsilon : ℝ) : ℕ∞ :=
  by
    classical
    exact
      if hfinite :
          HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon then
        (finiteEmpiricalL1CoveringNumberCard hfinite : ℕ∞)
      else
        ⊤

/-- In the finite case, the empirical covering number is the `Nat.find` cardinality. -/
theorem empiricalL1CoveringNumber_eq_find
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon) :
    empiricalL1CoveringNumber sample indexClass classFun epsilon =
      (finiteEmpiricalL1CoveringNumberCard hfinite : ℕ∞) := by
  classical
  simp [empiricalL1CoveringNumber, hfinite]

/--
The least finite empirical-cover cardinality is bounded by any supplied finite
upper bound on the numeric empirical covering number.
-/
theorem finiteEmpiricalL1CoveringNumberCard_le_of_empiricalL1CoveringNumber_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (hfinite :
      HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon)
    (hcovering_le :
      empiricalL1CoveringNumber sample indexClass classFun epsilon ≤
        (cardinality : ℕ∞)) :
    finiteEmpiricalL1CoveringNumberCard hfinite ≤ cardinality := by
  have hfind_le_card_enat :
      (finiteEmpiricalL1CoveringNumberCard hfinite : ℕ∞) ≤
        (cardinality : ℕ∞) := by
    rwa [empiricalL1CoveringNumber_eq_find hfinite] at hcovering_le
  exact_mod_cast hfind_le_card_enat

/-- The minimizing empirical cover cardinality has an explicit supplied cover. -/
theorem empiricalL1CoveringNumber_find_spec
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon) :
    Nonempty
      (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
        (finiteEmpiricalL1CoveringNumberCard hfinite)) :=
  by
    classical
    simpa [finiteEmpiricalL1CoveringNumberCard] using Nat.find_spec hfinite

/-- A finite empirical-cover witness makes the numeric covering number finite. -/
theorem empiricalL1CoveringNumber_lt_top_of_hasFinite
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon) :
    empiricalL1CoveringNumber sample indexClass classFun epsilon < ⊤ := by
  rw [empiricalL1CoveringNumber_eq_find hfinite]
  exact WithTop.coe_lt_top (finiteEmpiricalL1CoveringNumberCard hfinite)

/-- If the numeric empirical covering number is finite, a finite witness exists. -/
theorem hasFinite_of_empiricalL1CoveringNumber_lt_top
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite_number :
      empiricalL1CoveringNumber sample indexClass classFun epsilon < ⊤) :
    HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon := by
  by_contra hnot
  have htop :
      empiricalL1CoveringNumber sample indexClass classFun epsilon = ⊤ := by
    classical
    simp [empiricalL1CoveringNumber, hnot]
  rw [htop] at hfinite_number
  exact (lt_irrefl (⊤ : ℕ∞)) hfinite_number

/--
Witness-free characterization of a fixed-cardinality empirical `L1(P_n)` cover.

This removes the proof-carrying `centerOf` field from measurable event
arguments: a cover exists iff there is a finite center map whose centers lie in
the class and every class member is within `epsilon` of one of those centers.
-/
theorem nonempty_finiteEmpiricalL1CoverAtCard_iff_exists_centers
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ} :
    Nonempty
        (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
          cardinality) ↔
      ∃ center : Fin cardinality -> Index,
        (∀ centerIndex, center centerIndex ∈ indexClass) ∧
          ∀ index, index ∈ indexClass ->
            ∃ centerIndex,
              empiricalL1Distance sample (classFun index)
                (classFun (center centerIndex)) ≤ epsilon := by
  constructor
  · rintro ⟨cover⟩
    exact
      ⟨cover.center, cover.center_mem, fun index hindex =>
        ⟨cover.centerOf index hindex, cover.dist_le index hindex⟩⟩
  · rintro ⟨center, hcenter_mem, hcover⟩
    classical
    let centerOf : ∀ index, index ∈ indexClass -> Fin cardinality :=
      fun index hindex => Classical.choose (hcover index hindex)
    have hdist :
        ∀ index hindex,
          empiricalL1Distance sample (classFun index)
              (classFun (center (centerOf index hindex))) ≤
            epsilon :=
      fun index hindex => Classical.choose_spec (hcover index hindex)
    exact
      ⟨{ center := center
         center_mem := hcenter_mem
         centerOf := centerOf
         dist_le := hdist }⟩

/--
Fixed-cardinality cover-existence events are measurable for countable classes
once every pairwise empirical distance process is measurable.

This is the countable-center selection primitive feeding
`measurable_empiricalL1CoveringNumber_of_cover_event_measurable` and
`measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable`.
-/
theorem measurableSet_finiteEmpiricalL1CoverAtCard_of_countable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    [Countable Index] {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (cardinality : ℕ)
    (hdist :
      ∀ index, index ∈ indexClass ->
        ∀ center, center ∈ indexClass ->
          Measurable fun sample : SampleAt Observation n =>
            empiricalL1Distance sample (classFun index) (classFun center)) :
    MeasurableSet
      {sample : SampleAt Observation n |
        Nonempty
          (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
            cardinality)} := by
  classical
  let centerEvent : (Fin cardinality -> Index) -> Set (SampleAt Observation n) :=
    fun center =>
      {sample : SampleAt Observation n |
        (∀ centerIndex, center centerIndex ∈ indexClass) ∧
          ∀ index, index ∈ indexClass ->
            ∃ centerIndex,
              empiricalL1Distance sample (classFun index)
                (classFun (center centerIndex)) ≤ epsilon}
  have hcenterEvent_measurable :
      ∀ center, MeasurableSet (centerEvent center) := by
    intro center
    by_cases hcenter_mem : ∀ centerIndex, center centerIndex ∈ indexClass
    · have hcover_measurable :
          MeasurableSet
            (⋂ index : Index,
              {sample : SampleAt Observation n |
                index ∈ indexClass ->
                  ∃ centerIndex,
                    empiricalL1Distance sample (classFun index)
                      (classFun (center centerIndex)) ≤ epsilon}) := by
        refine MeasurableSet.iInter fun index => ?_
        by_cases hindex : index ∈ indexClass
        · have hset :
              {sample : SampleAt Observation n |
                index ∈ indexClass ->
                  ∃ centerIndex,
                    empiricalL1Distance sample (classFun index)
                      (classFun (center centerIndex)) ≤ epsilon} =
              ⋃ centerIndex : Fin cardinality,
                {sample : SampleAt Observation n |
                  empiricalL1Distance sample (classFun index)
                    (classFun (center centerIndex)) ≤ epsilon} := by
            ext sample
            simp [hindex]
          rw [hset]
          exact
            MeasurableSet.iUnion fun centerIndex =>
              measurableSet_le
                (hdist index hindex (center centerIndex)
                  (hcenter_mem centerIndex))
                measurable_const
        · have hset :
              {sample : SampleAt Observation n |
                index ∈ indexClass ->
                  ∃ centerIndex,
                    empiricalL1Distance sample (classFun index)
                      (classFun (center centerIndex)) ≤ epsilon} =
              Set.univ := by
            ext sample
            simp [hindex]
          rw [hset]
          exact MeasurableSet.univ
      have hcenterEvent_eq :
          centerEvent center =
            ⋂ index : Index,
              {sample : SampleAt Observation n |
                index ∈ indexClass ->
                  ∃ centerIndex,
                    empiricalL1Distance sample (classFun index)
                      (classFun (center centerIndex)) ≤ epsilon} := by
        ext sample
        simp [centerEvent, hcenter_mem, Set.mem_iInter]
      rw [hcenterEvent_eq]
      exact hcover_measurable
    · have hcenterEvent_eq : centerEvent center = Set.univᶜ := by
        ext sample
        simp [centerEvent, hcenter_mem]
      rw [hcenterEvent_eq]
      exact MeasurableSet.univ.compl
  have htarget_eq :
      {sample : SampleAt Observation n |
        Nonempty
          (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
            cardinality)} =
        ⋃ center : Fin cardinality -> Index, centerEvent center := by
    ext sample
    simp [centerEvent,
      nonempty_finiteEmpiricalL1CoverAtCard_iff_exists_centers]
  rw [htarget_eq]
  exact MeasurableSet.iUnion hcenterEvent_measurable

/--
Fixed-cardinality cover-existence events are measurable for countable classes of
measurable functions.
-/
theorem measurableSet_finiteEmpiricalL1CoverAtCard_of_countable_of_measurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    [Countable Index] {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (cardinality : ℕ)
    (hclass : ∀ index, index ∈ indexClass -> Measurable (classFun index)) :
    MeasurableSet
      {sample : SampleAt Observation n |
        Nonempty
          (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
            cardinality)} :=
  measurableSet_finiteEmpiricalL1CoverAtCard_of_countable cardinality
    (fun index hindex center hcenter =>
      measurable_empiricalL1Distance_of_measurable
        (hclass index hindex) (hclass center hcenter))

/--
Measurability of the empirical `L1(P_n)` covering number from measurable
fixed-cardinality cover-existence events.

This isolates the genuine selection/measurability work.  For arbitrary
uncountable index classes, measurability of the cover-existence event is not
automatic; countable or finite center-selection hypotheses can be proved
separately and then fed through this lemma.
-/
theorem measurable_empiricalL1CoveringNumber_of_cover_event_measurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hcover :
      ∀ cardinality : ℕ,
        MeasurableSet
          {sample : SampleAt Observation n |
            Nonempty
              (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                cardinality)}) :
    Measurable fun sample : SampleAt Observation n =>
      empiricalL1CoveringNumber sample indexClass classFun epsilon := by
  classical
  rw [ENat.measurable_iff]
  intro cardinality
  let coverEvent : ℕ -> Set (SampleAt Observation n) :=
    fun k =>
      {sample : SampleAt Observation n |
        Nonempty
          (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon k)}
  have hcoverEvent : ∀ k, MeasurableSet (coverEvent k) := by
    intro k
    simpa [coverEvent] using hcover k
  have hpreimage :
      (fun sample : SampleAt Observation n =>
        empiricalL1CoveringNumber sample indexClass classFun epsilon) ⁻¹'
          {(cardinality : ℕ∞)} =
        coverEvent cardinality ∩
          {sample : SampleAt Observation n |
            ∀ smaller < cardinality,
              ¬Nonempty
                (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                  smaller)} := by
    ext sample
    simp only [Set.mem_preimage, Set.mem_singleton_iff, Set.mem_inter_iff,
      Set.mem_setOf_eq, coverEvent]
    constructor
    · intro hnumber
      have hfinite :
          HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon := by
        exact
          hasFinite_of_empiricalL1CoveringNumber_lt_top
            (by
              rw [hnumber]
              exact WithTop.coe_lt_top cardinality)
      have hfind_eq :
          finiteEmpiricalL1CoveringNumberCard hfinite = cardinality := by
        have hnumber_find :
            (finiteEmpiricalL1CoveringNumberCard hfinite : ℕ∞) =
              (cardinality : ℕ∞) := by
          simpa [empiricalL1CoveringNumber_eq_find hfinite] using hnumber
        exact WithTop.coe_injective hnumber_find
      have hfind_characterization :
          Nonempty
              (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                cardinality) ∧
            ∀ smaller < cardinality,
              ¬Nonempty
                (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                  smaller) := by
        simpa [finiteEmpiricalL1CoveringNumberCard] using
          (Nat.find_eq_iff hfinite).1 hfind_eq
      exact ⟨hfind_characterization.1, hfind_characterization.2⟩
    · rintro ⟨hcover_cardinality, hminimal⟩
      have hfinite :
          HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon :=
        ⟨cardinality, hcover_cardinality⟩
      have hfind_eq :
          finiteEmpiricalL1CoveringNumberCard hfinite = cardinality := by
        simpa [finiteEmpiricalL1CoveringNumberCard] using
          (Nat.find_eq_iff hfinite).2 ⟨hcover_cardinality, hminimal⟩
      rw [empiricalL1CoveringNumber_eq_find hfinite, hfind_eq]
  rw [hpreimage]
  refine (hcoverEvent cardinality).inter ?_
  have hminimal_measurable :
      MeasurableSet
        (⋂ smaller : ℕ,
          {sample : SampleAt Observation n |
            smaller < cardinality ->
              ¬Nonempty
                (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                  smaller)}) := by
    refine MeasurableSet.iInter fun smaller => ?_
    by_cases hlt : smaller < cardinality
    · have hset :
          {sample : SampleAt Observation n |
            smaller < cardinality ->
              ¬Nonempty
                (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                  smaller)} = (coverEvent smaller)ᶜ := by
        ext sample
        simp [coverEvent, hlt]
      rw [hset]
      exact (hcoverEvent smaller).compl
    · have hset :
          {sample : SampleAt Observation n |
            smaller < cardinality ->
              ¬Nonempty
                (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                  smaller)} = Set.univ := by
        ext sample
        simp [hlt]
      rw [hset]
      exact MeasurableSet.univ
  convert hminimal_measurable using 1
  ext sample
  simp [Set.mem_iInter]

/--
Measurability of the least finite empirical-cover cardinality from
fixed-cardinality cover-existence events.

This is the finite-valued companion to
`measurable_empiricalL1CoveringNumber_of_cover_event_measurable`: once every
sample has a finite empirical cover, the `Nat.find` cardinality itself is a
measurable `ℕ`-valued random variable.
-/
theorem measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      ∀ sample : SampleAt Observation n,
        HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon)
    (hcover :
      ∀ cardinality : ℕ,
        MeasurableSet
          {sample : SampleAt Observation n |
            Nonempty
              (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
                cardinality)}) :
    Measurable fun sample : SampleAt Observation n =>
      finiteEmpiricalL1CoveringNumberCard (hfinite sample) := by
  classical
  unfold finiteEmpiricalL1CoveringNumberCard
  exact
    measurable_find
      (p := fun sample cardinality =>
        Nonempty
          (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
            cardinality))
      hfinite hcover

/--
For countable classes, pairwise empirical-distance measurability makes the
empirical `L1(P_n)` covering number measurable.
-/
theorem measurable_empiricalL1CoveringNumber_of_countable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    [Countable Index] {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hdist :
      ∀ index center,
        Measurable fun sample : SampleAt Observation n =>
          empiricalL1Distance sample (classFun index) (classFun center)) :
    Measurable fun sample : SampleAt Observation n =>
      empiricalL1CoveringNumber sample indexClass classFun epsilon := by
  exact
    measurable_empiricalL1CoveringNumber_of_cover_event_measurable
      (fun cardinality =>
        measurableSet_finiteEmpiricalL1CoverAtCard_of_countable cardinality
          (fun index _hindex center _hcenter => hdist index center))

/--
The empirical `L1(P_n)` covering number is measurable for countable classes of
measurable functions.
-/
theorem measurable_empiricalL1CoveringNumber_of_countable_of_measurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    [Countable Index] {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hclass : ∀ index, index ∈ indexClass -> Measurable (classFun index)) :
    Measurable fun sample : SampleAt Observation n =>
      empiricalL1CoveringNumber sample indexClass classFun epsilon :=
  measurable_empiricalL1CoveringNumber_of_cover_event_measurable
    (fun cardinality =>
      measurableSet_finiteEmpiricalL1CoverAtCard_of_countable cardinality
        (fun index hindex center hcenter =>
          measurable_empiricalL1Distance_of_measurable
            (hclass index hindex) (hclass center hcenter)))

/--
For countable classes with finite empirical covers, pairwise empirical-distance
measurability makes the least finite cover cardinality measurable.
-/
theorem measurable_finiteEmpiricalL1CoveringNumberCard_of_countable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    [Countable Index] {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      ∀ sample : SampleAt Observation n,
        HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon)
    (hdist :
      ∀ index center,
        Measurable fun sample : SampleAt Observation n =>
          empiricalL1Distance sample (classFun index) (classFun center)) :
    Measurable fun sample : SampleAt Observation n =>
      finiteEmpiricalL1CoveringNumberCard (hfinite sample) := by
  exact
    measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable
      hfinite
      (fun cardinality =>
        measurableSet_finiteEmpiricalL1CoverAtCard_of_countable cardinality
          (fun index _hindex center _hcenter => hdist index center))

/--
The least finite empirical-cover cardinality is measurable for countable classes
of measurable functions, once every sample has a finite empirical cover.
-/
theorem measurable_finiteEmpiricalL1CoveringNumberCard_of_countable_of_measurable
    {Observation : Type u} {Index : Type v} [MeasurableSpace Observation]
    [Countable Index] {n : ℕ} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    (hfinite :
      ∀ sample : SampleAt Observation n,
        HasFiniteEmpiricalL1Cover sample indexClass classFun epsilon)
    (hclass : ∀ index, index ∈ indexClass -> Measurable (classFun index)) :
    Measurable fun sample : SampleAt Observation n =>
      finiteEmpiricalL1CoveringNumberCard (hfinite sample) :=
  measurable_finiteEmpiricalL1CoveringNumberCard_of_cover_event_measurable
    hfinite
    (fun cardinality =>
      measurableSet_finiteEmpiricalL1CoverAtCard_of_countable cardinality
        (fun index hindex center hcenter =>
          measurable_empiricalL1Distance_of_measurable
            (hclass index hindex) (hclass center hcenter)))

/--
A finite upper bound on the numeric empirical covering number produces an
explicit empirical-cover witness at that supplied cardinality.

This is the cardinality handoff needed when the entropy hypothesis bounds
`N(epsilon, F, L1(P_n))` by a finite deterministic or random cardinality.
-/
theorem exists_finiteEmpiricalL1CoverAtCard_of_empiricalL1CoveringNumber_le
    {Observation : Type u} {Index : Type v} {n : ℕ}
    {sample : SampleAt Observation n} {indexClass : Set Index}
    {classFun : Index -> Observation -> ℝ} {epsilon : ℝ}
    {cardinality : ℕ}
    (hcovering_le :
      empiricalL1CoveringNumber sample indexClass classFun epsilon ≤
        (cardinality : ℕ∞))
    (hindexClass : ∃ index, index ∈ indexClass) :
    Nonempty
      (FiniteEmpiricalL1CoverAtCard sample indexClass classFun epsilon
        cardinality) := by
  have hfinite_number :
      empiricalL1CoveringNumber sample indexClass classFun epsilon < ⊤ :=
    lt_of_le_of_lt hcovering_le (WithTop.coe_lt_top cardinality)
  let hfinite :=
    hasFinite_of_empiricalL1CoveringNumber_lt_top hfinite_number
  have hfind_cover := empiricalL1CoveringNumber_find_spec hfinite
  have hfind_le_card_enat :
      (finiteEmpiricalL1CoveringNumberCard hfinite : ℕ∞) ≤
        (cardinality : ℕ∞) := by
    rwa [empiricalL1CoveringNumber_eq_find hfinite] at hcovering_le
  have hfind_le_card :
      finiteEmpiricalL1CoveringNumberCard hfinite ≤ cardinality := by
    exact
      finiteEmpiricalL1CoveringNumberCard_le_of_empiricalL1CoveringNumber_le
        hfinite hcovering_le
  exact
    hfind_cover.elim fun cover =>
      ⟨cover.pad_cardinality hindexClass hfind_le_card⟩

/-- The external covering number is bounded by the internal mathlib covering number. -/
theorem vdVWCoveringNumber_le_internalCoveringNumber
    {Space : Type u} [PseudoEMetricSpace Space]
    (epsilon : ℝ≥0) (target : Set Space) :
    vdVWCoveringNumber epsilon target ≤ Metric.coveringNumber epsilon target := by
  exact Metric.externalCoveringNumber_le_coveringNumber epsilon target

/--
The packing number at doubled radius is bounded by the VdV&W external covering
number.  This is the first local bridge toward VdV&W Definition 2.2.3.
-/
theorem packingNumber_two_mul_le_vdVWCoveringNumber
    {Space : Type u} [PseudoEMetricSpace Space]
    (epsilon : ℝ≥0) (target : Set Space) :
    Metric.packingNumber (2 * epsilon) target ≤
      vdVWCoveringNumber epsilon target := by
  exact Metric.packingNumber_two_mul_le_externalCoveringNumber epsilon target

/-!
## Semimetric-space covering and packing numbers

VdV&W Definition 2.2.3 applies the same covering-number idea to an arbitrary
semimetric index space `(T, d)`, using all of `T` as the target.  In Lean we
represent the semimetric by a `PseudoEMetricSpace` instance and cover
`Set.univ`.
-/

/-- VdV&W semimetric covering number `N(epsilon, d)` for the whole index space. -/
noncomputable def vdVWSemimetricCoveringNumber
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) : ℕ∞ :=
  vdVWCoveringNumber epsilon (Set.univ : Set Space)

/-- VdV&W semimetric packing number `D(epsilon, d)` for the whole index space. -/
noncomputable def vdVWSemimetricPackingNumber
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) : ℕ∞ :=
  Metric.packingNumber epsilon (Set.univ : Set Space)

/-- A finite cover of the whole semimetric space at a fixed radius. -/
abbrev HasFiniteSemimetricCover
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) : Prop :=
  HasFiniteMetricCover (Set.univ : Set Space) epsilon

/-- A finite whole-space cover makes `N(epsilon, d)` finite. -/
theorem vdVWSemimetricCoveringNumber_lt_top_of_hasFiniteCover
    {Space : Type u} [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hfinite : HasFiniteSemimetricCover Space epsilon) :
    vdVWSemimetricCoveringNumber Space epsilon < ⊤ :=
  vdVWCoveringNumber_lt_top_of_hasFiniteMetricCover hfinite

/-- A finite type has finite semimetric covering number at every radius. -/
theorem vdVWSemimetricCoveringNumber_lt_top_of_finite
    (Space : Type u) [PseudoEMetricSpace Space] [Finite Space]
    (epsilon : ℝ≥0) :
    vdVWSemimetricCoveringNumber Space epsilon < ⊤ :=
  vdVWCoveringNumber_lt_top_of_finite epsilon (Set.toFinite Set.univ)

/-- A totally bounded semimetric space has finite covering number at every positive radius. -/
theorem vdVWSemimetricCoveringNumber_lt_top_of_totallyBounded
    (Space : Type u) [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hepsilon : epsilon ≠ 0)
    (hspace : TotallyBounded (Set.univ : Set Space)) :
    vdVWSemimetricCoveringNumber Space epsilon < ⊤ :=
  vdVWCoveringNumber_lt_top_of_totallyBounded hepsilon hspace

/--
VdV&W's first covering-packing comparison, in mathlib's closed-ball
convention: `N(epsilon, d) <= D(epsilon, d)`.
-/
theorem vdVWSemimetricCoveringNumber_le_packingNumber
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) :
    vdVWSemimetricCoveringNumber Space epsilon ≤
      vdVWSemimetricPackingNumber Space epsilon := by
  unfold vdVWSemimetricCoveringNumber vdVWSemimetricPackingNumber
  exact
    (Metric.externalCoveringNumber_le_coveringNumber epsilon
      (Set.univ : Set Space)).trans
      (Metric.coveringNumber_le_packingNumber epsilon (Set.univ : Set Space))

/--
VdV&W's second covering-packing comparison, in mathlib's closed-ball
convention: `D(epsilon, d) <= N(epsilon / 2, d)`.
-/
theorem vdVWSemimetricPackingNumber_le_coveringNumber_half
    (Space : Type u) [PseudoEMetricSpace Space] (epsilon : ℝ≥0) :
    vdVWSemimetricPackingNumber Space epsilon ≤
      vdVWSemimetricCoveringNumber Space (epsilon / 2) := by
  simpa [vdVWSemimetricPackingNumber, vdVWSemimetricCoveringNumber,
    vdVWCoveringNumber, show (2 : ℝ≥0) * (epsilon / 2) = epsilon by ring] using
    Metric.packingNumber_two_mul_le_externalCoveringNumber (epsilon / 2)
      (Set.univ : Set Space)

/--
Finiteness of the semimetric covering number at half radius implies finiteness
of the packing number at the original radius.
-/
theorem vdVWSemimetricPackingNumber_lt_top_of_coveringNumber_half_lt_top
    (Space : Type u) [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hcover :
      vdVWSemimetricCoveringNumber Space (epsilon / 2) < ⊤) :
    vdVWSemimetricPackingNumber Space epsilon < ⊤ :=
  lt_of_le_of_lt
    (vdVWSemimetricPackingNumber_le_coveringNumber_half Space epsilon)
    hcover

/--
If all positive-radius semimetric covering numbers are finite, then all
positive-radius semimetric packing numbers are finite.
-/
theorem vdVWSemimetricPackingNumber_lt_top_forall_of_coveringNumber_lt_top_forall
    (Space : Type u) [PseudoEMetricSpace Space]
    (hcover :
      ∀ epsilon : ℝ≥0, epsilon ≠ 0 ->
        vdVWSemimetricCoveringNumber Space epsilon < ⊤) :
    ∀ epsilon : ℝ≥0, epsilon ≠ 0 ->
      vdVWSemimetricPackingNumber Space epsilon < ⊤ := by
  intro epsilon hepsilon
  exact
    vdVWSemimetricPackingNumber_lt_top_of_coveringNumber_half_lt_top Space
      (hcover (epsilon / 2) (by positivity))

/-- A totally bounded semimetric space has finite packing number at every positive radius. -/
theorem vdVWSemimetricPackingNumber_lt_top_of_totallyBounded
    (Space : Type u) [PseudoEMetricSpace Space] {epsilon : ℝ≥0}
    (hepsilon : epsilon ≠ 0)
    (hspace : TotallyBounded (Set.univ : Set Space)) :
    vdVWSemimetricPackingNumber Space epsilon < ⊤ :=
  vdVWSemimetricPackingNumber_lt_top_of_coveringNumber_half_lt_top Space
    (vdVWSemimetricCoveringNumber_lt_top_of_totallyBounded Space
      (by positivity) hspace)

end StatInference
