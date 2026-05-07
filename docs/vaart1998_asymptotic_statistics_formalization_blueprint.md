# van der Vaart 1998 Formalization Blueprint

This blueprint tracks the intended Lean route for A. W. van der Vaart,
*Asymptotic Statistics* (1998), under `StatInference/AsymptoticStatistics`.

## Design Principles

1. Reuse mathlib and local `StatInference` convergence/probability APIs first.
2. Keep Vaart files source-shaped: theorem names should carry chapter/item
   numbers when the source has them.
3. Use supplied-interface certificates for statistical theorems whose analytic
   or empirical-process hypotheses are large; then progressively discharge the
   certificate fields.
4. Keep textbook reports gated: no report until an exact source statement is
   fully proved in Lean and source evidence from Markdown/PDF is captured.
5. Coordinate with the VdV&W empirical-process lane; do not duplicate GC,
   Donsker, bracketing, covering, or outer-probability foundations.

## Chapter Map

### Chapters 1-3

Start with notation and core stochastic convergence:

- `P f`, empirical averages, empirical process notation;
- convergence in distribution, probability, and almost surely;
- Portmanteau, continuous mapping, Prohorov/tightness, Slutsky;
- stochastic `o_P` and `O_P`;
- CLT and WLLN wrappers;
- finite-dimensional delta method and uniform delta method.

### Chapters 4-5

Build estimator theory from the Chapter 2-3 spine:

- moment-estimator existence/consistency/asymptotic normality;
- M-estimator consistency via uniform convergence or Wald-style compactness;
- Z-estimator asymptotic normality via linearization;
- M-estimator rates and argmax theorem.

Use `EmpiricalProcess.GlivenkoCantelli`, `Theorem243`, and Donsker-facing local
interfaces whenever the book invokes Chapter 19.

### Chapters 6-10

Introduce statistical-experiment infrastructure:

- contiguity as a sequence-of-measures property;
- Le Cam first/third lemma wrappers;
- differentiability in quadratic mean and LAN structures;
- convolution/minimax efficiency via source-shaped experiment certificates;
- Bayes/Bernstein-von Mises after LAN and weak-convergence-on-experiments are
  stable.

### Chapters 11-17

Formalize classical statistics after the convergence spine is stable:

- Hilbert projection and conditional expectation wrappers;
- Hoeffding decompositions and U-statistics;
- rank/sign/permutation statistics;
- asymptotic power and relative efficiency of tests;
- likelihood-ratio and chi-square tests.

### Chapters 18-25

Treat these as the advanced empirical-process/functional-analysis layer:

- metric-space stochastic convergence and bounded stochastic processes;
- empirical distributions, random functions, maximal inequalities;
- functional delta method and Hadamard differentiability;
- quantiles/order statistics, L-statistics, bootstrap;
- density estimation and semiparametric tangent/information theory.

These chapters should aggressively reuse the VdV&W lane, especially
`EmpiricalProcess.WeakConvergence`, `GlivenkoCantelli`, `Theorem243`,
`Complexity`, and `HilbertGaussian`.

## First Source Anchors

- Section 1.5 expectation and empirical notation:
  `Textbooks/VaartAsymStat1998/Markdown/VanDerVaart_Asymptotic_Statistics_1-115.md`
  lines 388-400.
- Section 2.1 convergence definitions and first source theorems:
  lines 412-620.
- Theorem 2.3 continuous mapping:
  line 491.
- Lemma 2.8 Slutsky:
  line 593.
- Proposition 2.17 CLT:
  line 763.
- Theorem 3.1 delta method:
  line 1103.
- Chapter 4.1 method of moments:
  lines 1387-1418.

## Current Module Plan

Initial modules:

- `Basic.lean`: Chapter 2 stochastic convergence wrappers and Chapter 3
  supplied-linearization delta bridge, the `HasFDerivAt` deterministic
  remainder display, the scaled-remainder delta handoff, and the
  tight-localization bridge for the stochastic delta remainder.  It also now
  contains the VdV&W tight-law-range to real-tail bridge, the Chapter 2
  theorem that convergence in distribution implies `O_P(1)`, and Chapter 3
  delta wrappers that derive scaled-statistic stochastic boundedness from
  distributional convergence.  The scaled-ball local-remainder certificate is
  now discharged from `HasFDerivAt` plus `r_n -> ∞`, yielding the compact
  sequence wrapper
  `vaart1998_theorem_3_1_delta_method_of_hasFDerivAt_distribution`.  The
  technical scaled-remainder a.e.-measurability field is now also packaged
  from `T_n` and `phi ∘ T_n`, with a measurable-`phi` convenience wrapper.
  The newest Chapter 2 support layer wraps mathlib's theorem that almost-sure
  convergence implies convergence in probability as
  `vaart1998_tendstoInMeasure_of_tendsto_ae`, so strong-law outputs can feed
  later estimator-localization proofs.
- `DeltaMethod.lean`: full finite-dimensional delta method and uniform delta
  method, starting with source reports and uniform variants rather than the
  now-compiled scalar scaled-ball and measurability certificates.
- `MomentEstimators.lean`: Chapter 4 method-of-moments wrappers.  The first
  compiled packet provides `Vaart1998MomentLocalInverseCertificate` and the
  Theorem 4.1 CLT-to-delta handoff for a supplied empirical-moment CLT and
  differentiable/measurable local inverse, including the textbook `sqrt n`
  specialization.  The second packet adds
  `Vaart1998MomentLocalRangeCertificate`,
  `Vaart1998MomentEstimatorLocalRangeProbabilityCertificate`, and deterministic
  solve/uniqueness/local-domain wrappers.  The third packet connects
  `HasStrictFDerivAt.localInverse` and `HasStrictFDerivAt.to_localInverse` to
  the local inverse and local range certificates, with global measurability of
  the chosen local inverse still explicit.  The current packet exposes the
  actual open source and target neighborhoods from
  `HasStrictFDerivAt.toOpenPartialHomeomorph`, builds an open-neighborhood
  local range certificate from them, and proves that convergence in probability
  of empirical moments to the true moment implies local-range probability
  tending to one for any open local range containing the true moment.  The
  newest layer assembles these ingredients into the Chapter 4.1 local
  existence conclusion: the local inverse candidate solves the moment equation
  with probability tending to one, including a strict-derivative plus
  convergence-in-probability wrapper.  The current handoff layer also accepts
  almost-sure empirical-moment convergence directly, producing the local-range
  probability certificate and strict-derivative solved-with-probability
  conclusion through `vaart1998_tendstoInMeasure_of_tendsto_ae`.  The newest
  layer discharges the finite-coordinate real LLN route from
  `ProbabilityMeasure.finite_centeredStrongLaw_ae_real` and `tendsto_pi_nhds`:
  coordinatewise iid strong laws now yield vector empirical-moment convergence
  a.s., convergence in probability, and the strict-derivative
  solved-with-probability local existence conclusion.  The latest assembler
  theorem combines this finite-coordinate local existence layer with the
  supplied empirical-moment CLT and the Chapter 3 delta method, returning both
  Vaart Theorem 4.1 conclusions in one source-shaped statement.  The current
  measurable-coordinate wrapper derives vector empirical-moment measurability
  and a.e.-strong measurability from coordinate measurability, so the clean
  finite-coordinate source wrapper no longer exposes the internal `hstrong`
  and `hmeas` fields.  The latest Gaussian-limit wrapper uses mathlib's
  `HasGaussianLaw.map_fun` to propagate a supplied Gaussian empirical-moment
  limit through the inverse derivative, so the estimator limit is now certified
  Gaussian.  The newest covariance-display layer records the coordinate-free
  pullback formula for all continuous linear coordinates, matching the
  finite-dimensional `Dinv * Sigma * Dinv^T` statement without prematurely
  committing to a concrete matrix representation.  The current bridge connects
  that coordinate covariance functional to mathlib's `covarianceBilinDual`
  under square-integrable-law hypotheses and proves the inverse-derivative
  pushed-law covariance bilinear form is the pullback of the original one.  The
  newest side-condition layer proves a.e. measurability and `MemLp` propagate
  through the continuous linear inverse derivative, so the covarianceBilinDual
  pullback now needs only the original square-integrable limit law.  The
  current source wrapper packages that canonical covarianceBilinDual pullback
  together with local existence, delta-method convergence, and Gaussianity in
  the measurable finite-coordinate Theorem 4.1 statement.  The newest
  local-inverse measurability layer proves the inverse of the open partial
  homeomorphism is a.e.-measurable on its open target/local moment range and
  for measures concentrated on that range.  The current handoff layer composes
  this localized local inverse with empirical moments and adds Chapter 4.1
  delta-method wrappers that consume a.e.-measurability of the composed local
  inverse directly.  The newest finite-coordinate source layer pushes that
  interface through the strong-law, measurable-coordinate, and supplied
  Gaussian-limit Theorem 4.1 assemblers: these wrappers now either take
  composed local-inverse a.e.-measurability directly or derive it from
  per-`n` a.e. localization in the open moment range.  The current covariance
  layer pushes the same localized interface through the covariance-display and
  covarianceBilinDual wrappers, so the canonical covariance route no longer
  needs global local-inverse measurability when a.e. target localization is
  available.  The current CLT-interface layer names the finite-coordinate
  empirical and population moment vectors, packages the supplied multivariate
  empirical-moment CLT/Gaussian/MemLp facts as
  `Vaart1998FiniteCoordinateEmpiricalMomentCLTCertificate`, and proves that
  this certificate feeds the localized covarianceBilinDual Theorem 4.1 source
  wrapper.  The Cramér-Wold-facing layer names the projected vector CLT family,
  proves that a vector CLT certificate gives every projection by the continuous
  mapping theorem, and records
  `Vaart1998FiniteCoordinateCramerWoldCLTBridge` as the exact remaining
  implication from all scalar projection CLTs to vector convergence.  The
  newest bridge separates the real-valued centered-average scalar CLT family
  from that projected vector family: projected empirical/population scalar
  moments and the continuous-linear centered scaling identity now feed
  `vaart1998_finiteCoordinateProjectedEmpiricalMomentCLT_of_projectedScalarCLT`
  and
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT`.  The
  newest law-level handoff names the scaled centered finite-coordinate vector,
  proves its measurability/a.e.-measurability wrappers from coordinate
  measurability, and turns law-level weak convergence of that vector into the
  exact empirical-moment `TendstoInDistribution` field through
  `vaart1998_finiteCoordinateEmpiricalMomentCLT_of_law_tendsto` and
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_lawTendsto`.
  The newest projected-law layer names the vector laws, proves that projected
  random-variable CLTs imply projected convergence of those laws, and repackages
  the remaining Cramér-Wold step as the pure law implication consumed by
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_projectedLaw`.
  The newest covariance-table layer turns the coordinate-free covarianceBilinDual
  pullback into finite entrywise covariance tables through
  `vaart1998_covarianceTable`,
  `vaart1998_covarianceBilinDual_inverseDerivative_table_apply_of_memLp`, and
  the finite-coordinate evaluation table
  `vaart1998_finiteCoordinateCovarianceTable`.  Its current consumer endpoint,
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cltCertificate_real`,
  returns those finite table entries directly from the supplied multivariate
  empirical-moment CLT certificate, and
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_cramerWoldBridge_real`
  now feeds the same table endpoint directly from a finite-coordinate
  Cramér-Wold bridge.  The characteristic-function handoff
  `vaart1998_finiteCoordinateProjectedLawConvergence_charFunDual` now shows
  that projected law convergence gives pointwise convergence of `charFunDual`
  for every continuous linear functional.  The finite-dimensional
  Cramér-Wold theorem is now compiled as
  `vaart1998_finiteCoordinateProjectedLawConvergence_lawTendsto`, using a
  `EuclideanSpace`/`PiLp 2` transfer and Lévy's characteristic-function
  theorem, and
  `vaart1998_finiteCoordinateCramerWoldCLTBridge_of_projectedScalarCLT_finiteDimensional`
  feeds that theorem into the Cramér-Wold bridge.  The newest endpoint
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedScalarCLT_real`
  lets Vaart Theorem 4.1 consume projected scalar CLTs directly.
  The projected summand layer now defines
  `vaart1998_finiteCoordinateProjectedSample`, proves the average and
  sum-centered normalization identities, records
  `vaart1998_finiteCoordinateProjectedSummandCLT`, and exposes
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_projectedSummandCLT_real`.
  The newest source theorem
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT` instantiates
  that projected-summand interface from mathlib's one-dimensional CLT once the
  tested summand mean, `MemLp`, `iIndepFun`, `IdentDistrib`, and Gaussian
  `HasLaw` fields are available.  The integrable-mean wrapper
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_integrableMean`
  now discharges the tested mean field from finite-coordinate integrability and
  `vaart1998_finiteCoordinateProjectedSample_integral_eq_populationMoment`.
  The vector-source wrapper
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_vectorSource`
  transports finite-coordinate sample-vector `MemLp`, `iIndepFun`, and
  `IdentDistrib` fields through every continuous linear projection.  The
  vector-Gaussian source wrapper
  `vaart1998_finiteCoordinateProjectedSummandCLT_of_mathlibCLT_vectorGaussianSource`
  also derives the projected scalar Gaussian `HasLaw` fields from a
  finite-coordinate `HasGaussianLaw` limit, zero projected mean, and
  covarianceBilinDual variance identification.  The endpoint
  `vaart1998_theorem_4_1_finiteCoordinateMeasurable_sqrt_exists_delta_gaussianLimit_covarianceTable_of_vectorGaussianSource_real`
  consumes those vector-Gaussian source fields directly at the covariance-table
  Theorem 4.1 boundary.
- `Estimators.lean`: Chapter 5 M/Z-estimator consistency and asymptotic
  normality certificates.
- `Contiguity.lean`: Chapter 6 definitions and Le Cam lemmas.
- `LAN.lean`: Chapter 7 DQM/LAN structures and MLE consequences.

Split later chapters only when proof volume justifies it.
