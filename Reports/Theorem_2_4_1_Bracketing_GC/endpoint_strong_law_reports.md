# Proof Reports: Endpoint Strong-Law Wrappers

Lean file: `StatInference/EmpiricalProcess/EndpointStrongLaw.lean`

## `endpoint_strong_law_ae_real`

This theorem wraps mathlib's real-valued strong law:

```lean
ProbabilityTheory.strong_law_ae_real
```

It converts the mathlib conclusion

```lean
Tendsto (fun n => (sum over range n) / n) atTop (nhds μ[X 0])
```

into the centered endpoint form

```lean
Tendsto (fun n => empirical_average n - μ[X 0]) atTop (nhds 0)
```

No new probability theorem is assumed.

## `finite_endpoint_strong_law_ae_real`

This theorem applies `endpoint_strong_law_ae_real` to every endpoint in a
finite endpoint family using `ae_all_iff`.

## Textbook Cross-Check

| Textbook item | Repository source |
| --- | --- |
| endpoint convergence by the strong law | `Textbooks/Vaart1996/Markdown/Vaart 1996 Weak Convergence and Emperical Process_101-200.md:984` |
| PDF screenshot | `Textbooks/Vaart1996/Screenshots/vdvw_theorem_2_4_1_excerpt_page_137.png` |
| mathlib theorem source | `.lake/packages/mathlib/Mathlib/Probability/StrongLaw.lean`, theorem `ProbabilityTheory.strong_law_ae_real` |

These wrappers are not the full bracketing theorem.  They are the endpoint LLN
component required after a finite bracket family has been constructed.
