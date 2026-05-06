import StatInference.Asymptotics.Basic
import StatInference.ProbabilityMeasure.WeakConvergence
import Mathlib.Probability.CentralLimitTheorem

/-!
# van der Vaart 1998 asymptotic statistics interfaces

This module starts the source-shaped Lean lane for A. W. van der Vaart,
*Asymptotic Statistics* (1998).  The first layer packages Chapter 2
stochastic-convergence theorems and the Chapter 3 delta-method handoff over
mathlib/local convergence APIs.

The intent is to reuse `MeasureTheory.TendstoInDistribution`,
`MeasureTheory.TendstoInMeasure`, local weak-convergence wrappers, and existing
probability/empirical-process infrastructure rather than introduce parallel
foundations.
-/

noncomputable section

namespace StatInference
namespace AsymptoticStatistics

open Filter MeasureTheory ProbabilityTheory
open scoped BigOperators Real Topology

universe u v w x y

/-- van der Vaart Chapter 2 notation: convergence in probability is mathlib
`TendstoInMeasure` along `atTop`. -/
abbrev ConvergesInProbability
    {Ω E : Type*} [MeasurableSpace Ω] [EDist E]
    (P : Measure Ω) (X : ℕ -> Ω -> E) (Z : Ω -> E) : Prop :=
  TendstoInMeasure P X atTop Z

/-- van der Vaart Chapter 2 notation: convergence in distribution is weak
convergence of laws of random variables. -/
abbrev ConvergesInDistribution
    {Ω Ω' E : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    (P : Measure Ω) (Q : Measure Ω') [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (X : ℕ -> Ω -> E) (Z : Ω' -> E) : Prop :=
  TendstoInDistribution X atTop Z (fun _ => P) Q

/-- van der Vaart Chapter 2 stochastic `o_P(1)`: convergence in probability
to zero. -/
abbrev StochasticLittleO
    {Ω E : Type*} [MeasurableSpace Ω] [SeminormedAddCommGroup E]
    (P : Measure Ω) (X : ℕ -> Ω -> E) : Prop :=
  TendstoInMeasure P X atTop 0

/-- van der Vaart Chapter 2 stochastic boundedness, `O_P(1)`, in the common
tail-probability form. -/
def StochasticBounded
    {Ω E : Type*} [MeasurableSpace Ω] [SeminormedAddCommGroup E]
    (P : Measure Ω) (X : ℕ -> Ω -> E) : Prop :=
  ∀ ε : ℝ, 0 < ε ->
    ∃ M : ℝ, 0 < M ∧
      ∀ᶠ n in atTop, P.real {ω | M ≤ ‖X n ω‖} < ε

/--
van der Vaart 1998, Theorem 2.3, continuous mapping theorem.

This source wrapper keeps the theorem in the Vaart namespace while delegating
the proof to mathlib's convergence-in-distribution API.
-/
theorem vaart1998_theorem_2_3_continuous_mapping
    {ι : Type u} {E : Type v} {F : Type w}
    {Ω : ι -> Type x} {Ω' : Type y}
    {mΩ : (i : ι) -> MeasurableSpace (Ω i)}
    {μ : (i : ι) -> @Measure (Ω i) (mΩ i)}
    [∀ i, IsProbabilityMeasure (μ i)]
    [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    [TopologicalSpace E] [MeasurableSpace E] [OpensMeasurableSpace E]
    [TopologicalSpace F] [MeasurableSpace F] [BorelSpace F]
    {X : (i : ι) -> Ω i -> E} {Z : Ω' -> E} {l : Filter ι}
    {g : E -> F}
    (hX : TendstoInDistribution X l Z μ μ') (hg : Continuous g) :
    TendstoInDistribution (fun i => g ∘ X i) l (g ∘ Z) μ μ' :=
  TendstoInDistribution.continuous_comp hg hX

/--
van der Vaart 1998, Lemma 2.8, Slutsky theorem, product form.
-/
theorem vaart1998_lemma_2_8_slutsky_product
    {ι : Type u} {E : Type v} {E' : Type w}
    {Ω : Type x} {Ω' : Type y}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace E] [SeminormedAddCommGroup E]
    [SecondCountableTopology E] [BorelSpace E] [OpensMeasurableSpace E]
    [MeasurableSpace E'] [SeminormedAddCommGroup E']
    [SecondCountableTopology E'] [BorelSpace E']
    {X : ι -> Ω -> E} {Y : ι -> Ω -> E'} {Z : Ω' -> E}
    {l : Filter ι} [l.IsCountablyGenerated] {c : E'}
    (hXZ : TendstoInDistribution X l Z (fun _ => P) Q)
    (hY : TendstoInMeasure P Y l (fun _ => c))
    (hY_meas : ∀ i, AEMeasurable (Y i) P) :
    TendstoInDistribution (fun i ω => (X i ω, Y i ω)) l
      (fun ω => (Z ω, c)) (fun _ => P) Q :=
  hXZ.prodMk_of_tendstoInMeasure_const X Y Z hY hY_meas

/--
van der Vaart 1998, Lemma 2.8, Slutsky theorem through a continuous map.
-/
theorem vaart1998_lemma_2_8_slutsky_continuous
    {ι : Type u} {E : Type v} {E' : Type w} {F : Type x}
    {Ω : Type y} {Ω' : Type*}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace E] [SeminormedAddCommGroup E]
    [SecondCountableTopology E] [BorelSpace E] [OpensMeasurableSpace E]
    [MeasurableSpace E'] [SeminormedAddCommGroup E']
    [SecondCountableTopology E'] [BorelSpace E']
    [TopologicalSpace F] [MeasurableSpace F] [BorelSpace F]
    {X : ι -> Ω -> E} {Y : ι -> Ω -> E'} {Z : Ω' -> E}
    {l : Filter ι} [l.IsCountablyGenerated] {c : E'}
    {g : E × E' -> F}
    (hXZ : TendstoInDistribution X l Z (fun _ => P) Q)
    (hY : TendstoInMeasure P Y l (fun _ => c))
    (hY_meas : ∀ i, AEMeasurable (Y i) P)
    (hg : Continuous g) :
    TendstoInDistribution (fun n ω => g (X n ω, Y n ω)) l
      (fun ω => g (Z ω, c)) (fun _ => P) Q :=
  hXZ.continuous_comp_prodMk_of_tendstoInMeasure_const
    (g := g) hg hY hY_meas

/--
van der Vaart 1998, Lemma 2.8, additive Slutsky form.
-/
theorem vaart1998_lemma_2_8_slutsky_add
    {ι : Type u} {E : Type v} {Ω : Type w} {Ω' : Type x}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [MeasurableSpace E] [SeminormedAddCommGroup E]
    [SecondCountableTopology E] [BorelSpace E] [OpensMeasurableSpace E]
    {X Y : ι -> Ω -> E} {Z : Ω' -> E} {l : Filter ι}
    [l.IsCountablyGenerated] {c : E}
    (hXZ : TendstoInDistribution X l Z (fun _ => P) Q)
    (hY : TendstoInMeasure P Y l (fun _ => c))
    (hY_meas : ∀ i, AEMeasurable (Y i) P) :
    TendstoInDistribution (fun n => X n + Y n) l
      (fun ω => Z ω + c) (fun _ => P) Q :=
  hXZ.add_of_tendstoInMeasure_const hY hY_meas

/--
van der Vaart 1998, Proposition 2.17, iid centered unit-variance CLT.

This is the standard real-valued mathlib CLT repackaged with the Vaart source
numbering.
-/
theorem vaart1998_proposition_2_17_clt_iid_centered_unit_variance
    {Ω Ω' : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']
    {P : Measure Ω} {Q : Measure Ω'} [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {X : ℕ -> Ω -> ℝ} {Y : Ω' -> ℝ}
    (hY : HasLaw Y (gaussianReal 0 1) Q)
    (h0 : P[X 0] = 0) (h1 : P[X 0 ^ 2] = 1)
    (hindep : iIndepFun X P)
    (hident : ∀ i : ℕ, IdentDistrib (X i) (X 0) P P) :
    TendstoInDistribution
      (fun (n : ℕ) ω => (√(n : ℝ))⁻¹ * ∑ k ∈ Finset.range n, X k ω)
      atTop Y (fun _ => P) Q :=
  ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum
    hY h0 h1 hindep hident

/--
If a random sequence is uniformly dominated by a deterministic sequence
converging to zero, then it is `o_P(1)`.

This small bridge is useful for Chapter 2 stochastic-o notation and for later
delta-method remainder packages.
-/
theorem vaart1998_stochastic_littleO_of_uniform_norm_bound
    {Ω E : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [SeminormedAddCommGroup E]
    {X : ℕ -> Ω -> E} {a : ℕ -> ℝ}
    (ha : Tendsto a atTop (𝓝 0))
    (hbound : ∀ᶠ n in atTop, ∀ ω, ‖X n ω‖ ≤ a n) :
    StochasticLittleO P X := by
  rw [StochasticLittleO, MeasureTheory.tendstoInMeasure_iff_norm]
  intro ε hε
  refine (tendsto_congr' ?_).mpr tendsto_const_nhds
  filter_upwards [hbound, ha.eventually_lt_const hε] with n hb hlt
  have hset : {ω | ε ≤ ‖X n ω‖} = (∅ : Set Ω) := by
    ext ω
    simp only [Set.mem_setOf_eq, Set.mem_empty_iff_false, iff_false]
    have hnorm_lt : ‖X n ω‖ < ε := lt_of_le_of_lt (hb ω) hlt
    exact not_le_of_gt hnorm_lt
  simp [hset]

/--
Localization criterion for stochastic `o_P(1)`.

If every fixed deviation event for `X` is eventually contained in a tail event
for a tight/localizing statistic `W`, and those `W` tails can be made uniformly
small, then `X` converges to zero in probability.  This is the probability
bookkeeping used by the delta method after differentiability supplies the local
remainder inequality.
-/
theorem vaart1998_tendstoInMeasure_zero_of_eventually_subset_tight
    {ι Ω E F : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsFiniteMeasure P]
    [SeminormedAddCommGroup E] [SeminormedAddCommGroup F]
    {X : ι -> Ω -> E} {W : ι -> Ω -> F} {l : Filter ι}
    (hlocal : ∀ ε : ℝ, 0 < ε -> ∀ M : ℝ, 0 < M ->
      ∀ᶠ i in l, {ω | ε ≤ ‖X i ω‖} ⊆ {ω | M ≤ ‖W i ω‖})
    (hW_tight : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ i in l, P.real {ω | M ≤ ‖W i ω‖} < ε) :
    TendstoInMeasure P X l 0 := by
  rw [MeasureTheory.tendstoInMeasure_iff_measureReal_norm]
  intro ε hε
  rw [tendsto_order]
  constructor
  · intro a ha
    exact Eventually.of_forall fun _ =>
      lt_of_lt_of_le ha measureReal_nonneg
  · intro a ha
    rcases hW_tight a ha with ⟨M, hMpos, hW_tail⟩
    filter_upwards [hlocal ε hε M hMpos, hW_tail] with i hsubset htail
    have hle :
        P.real {ω | ε ≤ ‖X i ω - 0‖} ≤
          P.real {ω | M ≤ ‖W i ω‖} := by
      refine measureReal_mono ?_
      intro ω hω
      exact hsubset (by simpa using hω)
    exact lt_of_le_of_lt hle htail

/--
van der Vaart 1998, Theorem 3.1 deterministic differentiability display.

This is the source line
`phi(theta + h) - phi(theta) = phi'_theta h + o(||h||)`,
packaged from mathlib's Fréchet derivative API.
-/
theorem vaart1998_hasFDerivAt_delta_remainder_isLittleO
    {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    {phi : E -> F} {theta : E} {L : E →L[ℝ] F}
    (hphi : HasFDerivAt phi L theta) :
    (fun h : E => phi (theta + h) - phi theta - L h) =o[𝓝 0] fun h => h := by
  exact (hasFDerivAt_iff_isLittleO_nhds_zero.mp hphi)

/--
van der Vaart 1998, Theorem 3.1, delta method, supplied-linearization
certificate form.

The analytic differentiability proof will later produce the decomposition
`output = L (scaled input) + remainder`; this theorem already closes the
probabilistic handoff from a linearized distributional limit plus an
`o_P(1)` remainder.
-/
theorem vaart1998_theorem_3_1_delta_method_linearized
    {ι : Type u} {Ω : Type v} {Ω' : Type w} {E : Type x} {F : Type y}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    [MeasurableSpace F] [SecondCountableTopology F] [BorelSpace F]
    [OpensMeasurableSpace F]
    {W : ι -> Ω -> E} {R : ι -> Ω -> F} {T : Ω' -> E}
    {l : Filter ι} [l.IsCountablyGenerated]
    (L : E →L[ℝ] F)
    (hW : TendstoInDistribution W l T (fun _ => P) Q)
    (hR : TendstoInMeasure P R l 0)
    (hR_meas : ∀ i, AEMeasurable (R i) P) :
    TendstoInDistribution (fun n ω => L (W n ω) + R n ω) l
      (fun ω => L (T ω)) (fun _ => P) Q := by
  have hLW :
      TendstoInDistribution (fun n => (fun x => L x) ∘ W n) l
        ((fun x => L x) ∘ T) (fun _ => P) Q :=
    TendstoInDistribution.continuous_comp (g := fun x => L x)
      L.continuous hW
  have hsum :
      TendstoInDistribution
        (fun n => ((fun x => L x) ∘ W n) + R n) l
        (fun ω => ((fun x => L x) ∘ T) ω + (0 : F))
        (fun _ => P) Q :=
    hLW.add_of_tendstoInMeasure_const (c := (0 : F)) hR hR_meas
  simpa [Function.comp_def] using hsum

/--
van der Vaart 1998, Theorem 3.1, source-shaped delta-method handoff.

If the linear statistic `r_n • (T_n - theta)` converges in distribution and the
scaled differentiability remainder is `o_P(1)`, then
`r_n • (phi(T_n) - phi(theta))` has the derivative-pushforward weak limit.
The next layer should discharge the supplied remainder field from
`vaart1998_hasFDerivAt_delta_remainder_isLittleO` plus tightness.
-/
theorem vaart1998_theorem_3_1_delta_method_of_scaled_remainder
    {ι : Type u} {Ω : Type v} {Ω' : Type w} {E : Type x} {F : Type y}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    [MeasurableSpace F] [SecondCountableTopology F] [BorelSpace F]
    [OpensMeasurableSpace F]
    {Tn : ι -> Ω -> E} {T : Ω' -> E} {phi : E -> F} {theta : E}
    {r : ι -> ℝ} {l : Filter ι} [l.IsCountablyGenerated]
    (L : E →L[ℝ] F)
    (hW : TendstoInDistribution
      (fun n ω => r n • (Tn n ω - theta)) l T (fun _ => P) Q)
    (hR : TendstoInMeasure P
      (fun n ω => r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta)))
      l 0)
    (hR_meas : ∀ n, AEMeasurable
      (fun ω => r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta))) P) :
    TendstoInDistribution
      (fun n ω => r n • (phi (Tn n ω) - phi theta)) l
      (fun ω => L (T ω)) (fun _ => P) Q := by
  have hlin :
      TendstoInDistribution
        (fun n ω =>
          L (r n • (Tn n ω - theta)) +
            r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta))) l
        (fun ω => L (T ω)) (fun _ => P) Q :=
    vaart1998_theorem_3_1_delta_method_linearized
      (L := L) hW hR hR_meas
  refine hlin.congr (fun n => ?_) (ae_of_all _ fun _ => rfl)
  exact ae_of_all _ fun ω => by
    change L (r n • (Tn n ω - theta)) +
        r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta)) =
      r n • (phi (Tn n ω) - phi theta)
    rw [map_smul]
    simp [sub_eq_add_neg, add_assoc, add_left_comm]

/--
van der Vaart 1998, Theorem 3.1, delta method with a tight scaled statistic and
a local remainder certificate.

This packages the standard proof step: once the differentiability remainder is
localized so that its large-deviation event is controlled by the tail of
`r_n • (T_n - theta)`, stochastic boundedness/tightness of that scaled statistic
turns the remainder into `o_P(1)`.  The result then feeds the compiled
scaled-remainder delta handoff.
-/
theorem vaart1998_theorem_3_1_delta_method_of_localization_tight
    {ι : Type u} {Ω : Type v} {Ω' : Type w} {E : Type x} {F : Type y}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    [MeasurableSpace F] [SecondCountableTopology F] [BorelSpace F]
    [OpensMeasurableSpace F]
    {Tn : ι -> Ω -> E} {T : Ω' -> E} {phi : E -> F} {theta : E}
    {r : ι -> ℝ} {l : Filter ι} [l.IsCountablyGenerated]
    (L : E →L[ℝ] F)
    (hW : TendstoInDistribution
      (fun n ω => r n • (Tn n ω - theta)) l T (fun _ => P) Q)
    (hR_local : ∀ ε : ℝ, 0 < ε -> ∀ M : ℝ, 0 < M ->
      ∀ᶠ n in l,
        {ω |
          ε ≤ ‖r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta))‖} ⊆
        {ω | M ≤ ‖r n • (Tn n ω - theta)‖})
    (hW_tight : ∀ ε : ℝ, 0 < ε ->
      ∃ M : ℝ, 0 < M ∧
        ∀ᶠ n in l, P.real {ω | M ≤ ‖r n • (Tn n ω - theta)‖} < ε)
    (hR_meas : ∀ n, AEMeasurable
      (fun ω => r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta))) P) :
    TendstoInDistribution
      (fun n ω => r n • (phi (Tn n ω) - phi theta)) l
      (fun ω => L (T ω)) (fun _ => P) Q := by
  have hR : TendstoInMeasure P
      (fun n ω => r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta)))
      l 0 :=
    vaart1998_tendstoInMeasure_zero_of_eventually_subset_tight
      (P := P) (X := fun n ω =>
        r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta)))
      (W := fun n ω => r n • (Tn n ω - theta))
      hR_local hW_tight
  exact vaart1998_theorem_3_1_delta_method_of_scaled_remainder
    (L := L) hW hR hR_meas

/--
van der Vaart 1998, Theorem 3.1, sequence form with an `O_P(1)` scaled
statistic.

For ordinary sequences, the real-tail tightness field in
`vaart1998_theorem_3_1_delta_method_of_localization_tight` is exactly the local
`StochasticBounded` predicate.
-/
theorem vaart1998_theorem_3_1_delta_method_of_localization_stochasticBounded
    {Ω : Type v} {Ω' : Type w} {E : Type x} {F : Type y}
    [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    [MeasurableSpace Ω'] {Q : Measure Ω'} [IsProbabilityMeasure Q]
    [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] [SecondCountableTopology E] [BorelSpace E]
    [OpensMeasurableSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F]
    [MeasurableSpace F] [SecondCountableTopology F] [BorelSpace F]
    [OpensMeasurableSpace F]
    {Tn : ℕ -> Ω -> E} {T : Ω' -> E} {phi : E -> F} {theta : E}
    {r : ℕ -> ℝ}
    (L : E →L[ℝ] F)
    (hW : TendstoInDistribution
      (fun n ω => r n • (Tn n ω - theta)) atTop T (fun _ => P) Q)
    (hR_local : ∀ ε : ℝ, 0 < ε -> ∀ M : ℝ, 0 < M ->
      ∀ᶠ n in atTop,
        {ω |
          ε ≤ ‖r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta))‖} ⊆
        {ω | M ≤ ‖r n • (Tn n ω - theta)‖})
    (hW_OP : StochasticBounded P
      (fun n ω => r n • (Tn n ω - theta)))
    (hR_meas : ∀ n, AEMeasurable
      (fun ω => r n • (phi (Tn n ω) - phi theta - L (Tn n ω - theta))) P) :
    TendstoInDistribution
      (fun n ω => r n • (phi (Tn n ω) - phi theta)) atTop
      (fun ω => L (T ω)) (fun _ => P) Q :=
  vaart1998_theorem_3_1_delta_method_of_localization_tight
    (L := L) hW hR_local hW_OP hR_meas

end AsymptoticStatistics
end StatInference
