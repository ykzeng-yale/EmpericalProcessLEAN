import StatInference.Optimization.StochasticGradient

/-!
# Chewi Chapter 12 averaged SGD algebra

This module starts the ASGD layer after the SMPGD Theorem 12.1 wrappers.  The
first packet formalizes the algebraic decomposition displayed in the proof of
Chewi Theorem 12.3: after unrolling the quadratic recursion, the averaged
iterate separates into the martingale sum with coefficient `A^{-1}` and a
remainder involving `M_k^n - A^{-1}`.
-/

noncomputable section

namespace StatInference
namespace Optimization

open Finset
open scoped BigOperators

/--
Finite-sum algebra behind the ASGD display `(12.5)`: any coefficient family
`M k` splits into a reference linear map `Ainv` plus the residual
`M k - Ainv`.
-/
theorem chewi123_asgd_noise_sum_split
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Ainv : E →L[ℝ] E) (M : ℕ -> E →L[ℝ] E) (xi : ℕ -> E)
    (s : Finset ℕ) :
    (∑ k ∈ s, M k (xi k)) =
      (∑ k ∈ s, Ainv (xi k)) +
        ∑ k ∈ s, (M k - Ainv) (xi k) := by
  rw [← sum_add_distrib]
  refine sum_congr rfl ?_
  intro k hk
  simp

/--
Scaled ASGD averaged-error decomposition.  This is the source algebra after
the unrolled quadratic recursion has supplied

`avgDelta = invN • M0 delta0 - invN • sum_k M_k xi_k`.

With `sqrtN * invN = invSqrtN`, it rewrites the scaled averaged error as the
initial-condition term, the martingale term with coefficient `Ainv`, and the
coefficient-remainder term.
-/
theorem chewi123_asgd_scaled_average_decomposition
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (sqrtN invN invSqrtN : ℝ)
    (hscale : sqrtN * invN = invSqrtN)
    (Ainv M0 : E →L[ℝ] E) (M : ℕ -> E →L[ℝ] E)
    (delta0 : E) (xi : ℕ -> E) (N : ℕ) (avgDelta : E)
    (havg :
      avgDelta =
        invN • M0 delta0 -
          invN • ∑ k ∈ Finset.range N, M k (xi k)) :
    sqrtN • avgDelta =
      invSqrtN • M0 delta0 -
        invSqrtN • ∑ k ∈ Finset.range N, Ainv (xi k) -
          invSqrtN • ∑ k ∈ Finset.range N, (M k - Ainv) (xi k) := by
  rw [havg, smul_sub, smul_smul, smul_smul, hscale]
  rw [chewi123_asgd_noise_sum_split (Ainv := Ainv) (M := M) (xi := xi)
    (s := Finset.range N)]
  rw [smul_add]
  module

/--
Source-shaped specialization of `chewi123_asgd_scaled_average_decomposition`
with the displayed `sqrt N` and `1 / N` scaling.  This is the finite algebraic
form used just before the martingale CLT term is isolated in Chewi Theorem
12.3.
-/
theorem chewi123_asgd_sqrt_average_decomposition
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (Ainv M0 : E →L[ℝ] E) (M : ℕ -> E →L[ℝ] E)
    (delta0 : E) (xi : ℕ -> E) (N : ℕ) (avgDelta : E)
    (hN : 0 < (N : ℝ))
    (havg :
      avgDelta =
        ((N : ℝ)⁻¹) • M0 delta0 -
          ((N : ℝ)⁻¹) • ∑ k ∈ Finset.range N, M k (xi k)) :
    Real.sqrt (N : ℝ) • avgDelta =
      (Real.sqrt (N : ℝ))⁻¹ • M0 delta0 -
        (Real.sqrt (N : ℝ))⁻¹ • ∑ k ∈ Finset.range N, Ainv (xi k) -
          (Real.sqrt (N : ℝ))⁻¹ •
            ∑ k ∈ Finset.range N, (M k - Ainv) (xi k) := by
  refine
    chewi123_asgd_scaled_average_decomposition
      (sqrtN := Real.sqrt (N : ℝ)) (invN := (N : ℝ)⁻¹)
      (invSqrtN := (Real.sqrt (N : ℝ))⁻¹)
      ?_ Ainv M0 M delta0 xi N avgDelta havg
  have hsqrt_pos : 0 < Real.sqrt (N : ℝ) := Real.sqrt_pos.2 hN
  have hsq : (Real.sqrt (N : ℝ)) ^ (2 : ℕ) = (N : ℝ) :=
    Real.sq_sqrt hN.le
  field_simp [hN.ne', hsqrt_pos.ne']
  nlinarith [hsq]

end Optimization
end StatInference
