Cambridge Series in Statistical and Probabilistic Mathematics
![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-001.jpg?height=369&width=1030&top_left_y=490&top_left_x=190)
![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-001.jpg?height=369&width=1023&top_left_y=912&top_left_x=197)
![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-001.jpg?height=355&width=1023&top_left_y=1341&top_left_x=197)

## Asymptotic Statistics

A.W. van der Vaart

## Asymptotic Statistics

This book is an introduction to the field of asymptotic statistics. The treatment is both practical and mathematically rigorous. In addition to most of the standard topics of an asymptotics course, including likelihood inference, $M$-estimation, asymptotic efficiency, $U$-statistics, and rank procedures, the book also presents recent research topics such as semiparametric models, the bootstrap, and empirical processes and their applications.

One of the unifying themes is the approximation by limit experiments. This entails mainly the local approximation of the classical i.i.d. set-up with smooth parameters by location experiments involving a single, normally distributed observation. Thus, even the standard subjects of asymptotic statistics are presented in a novel way.

Suitable as a text for a graduate or Master's level statistics course, this book also gives researchers in statistics, probability, and their applications an overview of the latest research in asymptotic statistics.
A.W. van der Vaart is Professor of Statistics in the Department of Mathematics and Computer Science at the Vrije Universiteit, Amsterdam.

## Editorial Board:

R. Gill, Department of Mathematics, Utrecht University B.D. Ripley, Department of Statistics, University of Oxford S. Ross, Department of Industrial Engineering, University of California, Berkeley M. Stein, Department of Statistics, University of Chicago D. Williams, School of Mathematical Sciences, University of Bath

This series of high-quality upper-division textbooks and expository monographs covers all aspects of stochastic applicable mathematics. The topics range from pure and applied statistics to probability theory, operations research, optimization, and mathematical programming. The books contain clear presentations of new developments in the field and also of the state of the art in classical methods. While emphasizing rigorous treatment of theoretical methods, the books also contain applications and discussions of new techniques made possible by advances in computational practice.

Already published

1. Bootstrap Methods and Their Application, by A.C. Davison and D.V. Hinkley
2. Markov Chains, by J. Norris

# Asymptotic Statistics 

A.W. VAN DER VAART

PUBLISHED BY THE PRESS SYNDICATE OF THE UNIVERSITY OF CAMBRIDGE
The Pitt Building, Trumpington Street, Cambridge, United Kingdom

CAMBRIDGE UNIVERSITY PRESS
The Edinburgh Building, Cambridge CB2 2RU, UK http://www.cup.cam.ac.uk
40 West 20th Street, New York, NY 10011-4211, USA http://www.cup.org
10 Stamford Road, Oakleigh, Melbourne 3166, Australia
Ruiz de Alarcón 13, 28014 Madrid, Spain
© Cambridge University Press 1998
This book is in copyright. Subject to statutory exception and to the provisions of relevant collective licensing agreements, no reproduction of any part may take place without the written permission of Cambridge University Press.

First published 1998
First paperback edition 2000

Printed in the United States of America

Typeset in Times Roman 10/12.5 pt in $\mathrm{L}^{\mathrm{A}} \mathrm{T}_{\mathrm{E}} \mathrm{X} 2$ [TB]
A catalog record for this book is available from the British Library
Library of Congress Cataloging in Publication data
Vaart, A.W. van der
Asymtotic statistics / A.W. van der Vaart.
p. $\quad \mathrm{cm}$. -(Cambridge series in statistical and probablistic
mathematics)
Includes bibliographical references.

1. Mathematical statistics - Asymptotic theory. I. Title.
II. Series: cambridge series on statistical and probablistic mathematics.
CA276.V22 1998
519.5-dc21

98-15176

ISBN 0521496039 hardback
ISBN 0521784506 paperback

To Maryse and Marianne

## Contents

Preface ..... page xiii
Notation page ..... XV

1. Introduction ..... 1
1.1. Approximate Statistical Procedures ..... 1
1.2. Asymptotic Optimality Theory ..... 2
1.3. Limitations ..... 3
1.4. The Index $n$ ..... 4
2. Stochastic Convergence ..... 5
2.1. Basic Theory ..... 5
2.2. Stochastic $o$ and $O$ Symbols ..... 12
*2.3. Characteristic Functions ..... 13
*2.4 Almost-Sure Representations ..... 17
*2.5. Convergence of Moments ..... 17
*2.6. Convergence-Determining Classes ..... 18
*2.7. Law of the Iterated Logarithm ..... 19
*2.8. Lindeberg-Feller Theorem ..... 20
*2.9. Convergence in Total Variation ..... 22
Problems ..... 24
3. Delta Method ..... 25
3.1. Basic Result ..... 25
3.2. Variance-Stabilizing Transformations ..... 30
*3.3. Higher-Order Expansions ..... 31
*3.4. Uniform Delta Method ..... 32
*3.5. Moments ..... 33
Problems ..... 34
4. Moment Estimators ..... 35
4.1. Method of Moments ..... 35
*4.2. Exponential Families ..... 37
Problems ..... 40
5. $M$ - and $Z$-Estimators ..... 41
5.1. Introduction ..... 41
5.2. Consistency ..... 44
5.3. Asymptotic Normality ..... 51
*5.4 Estimated Parameters ..... 60
5.5. Maximum Likelihood Estimators ..... 61
*5.6 Classical Conditions ..... 67
*5.7 One-Step Estimators ..... 71
*5.8. Rates of Convergence ..... 75
*5.9. Argmax Theorem ..... 79
Problems ..... 83
6. Contiguity ..... 85
6.1. Likelihood Ratios ..... 85
6.2. Contiguity ..... 87
Problems ..... 91
7. Local Asymptotic Normality ..... 92
7.1. Introduction ..... 92
7.2. Expanding the Likelihood ..... 93
7.3. Convergence to a Normal Experiment ..... 97
7.4. Maximum Likelihood ..... 100
*7.5. Limit Distributions under Alternatives ..... 103
*7.6. Local Asymptotic Normality ..... 103
Problems ..... 106
8. Efficiency of Estimators ..... 108
8.1. Asymptotic Concentration ..... 108
8.2. Relative Efficiency ..... 110
8.3. Lower Bound for Experiments ..... 111
8.4 Estimating Normal Means ..... 112
8.5. Convolution Theorem ..... 115
8.6. Almost-Everywhere Convolution Theorem ..... 115
*8.7 Local Asymptotic Minimax Theorem ..... 117
*8.8. Shrinkage Estimators ..... 119
*8.9. Achieving the Bound ..... 120
*8.10. Large Deviations ..... 122
Problems ..... 123
9. Limits of Experiments ..... 125
9.1. Introduction ..... 125
9.2. Asymptotic Representation Theorem ..... 126
9.3. Asymptotic Normality ..... 127
9.4. Uniform Distribution ..... 129
9.5. Pareto Distribution ..... 130
9.6. Asymptotic Mixed Normality ..... 131
9.7. Heuristics ..... 136
Problems ..... 137
10. Bayes Procedures ..... 138
10.1. Introduction ..... 138
10.2. Bernstein-von Mises Theorem ..... 140
10.3. Point Estimators ..... 146
*10.4. Consistency ..... 149
Problems ..... 152
11. Projections ..... 153
11.1. Projections ..... 153
11.2. Conditional Expectation ..... 155
11.3. Projection onto Sums ..... 157
*11.4. Hoeffding Decomposition ..... 157
Problems ..... 160
12. U-Statistics ..... 161
12.1. One-Sample $U$-Statistics ..... 161
12.2. Two-Sample $U$-statistics ..... 165
*12.3. Degenerate $U$-Statistics ..... 167
Problems ..... 171
13. Rank, Sign, and Permutation Statistics ..... 173
13.1. Rank Statistics ..... 173
13.2. Signed Rank Statistics ..... 181
13.3. Rank Statistics for Independence ..... 184
*13.4. Rank Statistics under Alternatives ..... 184
13.5. Permutation Tests ..... 188
*13.6. Rank Central Limit Theorem ..... 190
Problems ..... 190
14. Relative Efficiency of Tests ..... 192
14.1. Asymptotic Power Functions ..... 192
14.2. Consistency ..... 199
14.3. Asymptotic Relative Efficiency ..... 201
$* 14.4$ Other Relative Efficiencies ..... 202
*14.5. Rescaling Rates ..... 211
Problems ..... 213
15. Efficiency of Tests ..... 215
15.1. Asymptotic Representation Theorem ..... 215
15.2. Testing Normal Means ..... 216
15.3. Local Asymptotic Normality ..... 218
15.4. One-Sample Location ..... 220
15.5. Two-Sample Problems ..... 223
Problems ..... 226
16. Likelihood Ratio Tests ..... 227
16.1. Introduction ..... 227
*16.2. Taylor Expansion ..... 229
16.3. Using Local Asymptotic Normality ..... 231
16.4. Asymptotic Power Functions ..... 236
16.5. Bartlett Correction ..... 238
*16.6. Bahadur Efficiency ..... 238
Problems ..... 241
17. Chi-Square Tests ..... 242
17.1. Quadratic Forms in Normal Vectors ..... 242
17.2. Pearson Statistic ..... 242
17.3. Estimated Parameters ..... 244
17.4. Testing Independence ..... 247
*17.5. Goodness-of-Fit Tests ..... 248
*17.6. Asymptotic Efficiency ..... 251
Problems ..... 253
18. Stochastic Convergence in Metric Spaces ..... 255
18.1. Metric and Normed Spaces ..... 255
18.2. Basic Properties ..... 258
18.3. Bounded Stochastic Processes ..... 260
Problems ..... 263
19. Empirical Processes ..... 265
19.1. Empirical Distribution Functions ..... 265
19.2. Empirical Distributions ..... 269
19.3. Goodness-of-Fit Statistics ..... 277
19.4. Random Functions ..... 279
19.5. Changing Classes ..... 282
19.6. Maximal Inequalities ..... 284
Problems ..... 289
20. Functional Delta Method ..... 291
20.1. von Mises Calculus ..... 291
20.2. Hadamard-Differentiable Functions ..... 296
20.3. Some Examples ..... 298
Problems ..... 303
21. Quantiles and Order Statistics ..... 304
21.1. Weak Consistency ..... 304
21.2. Asymptotic Normality ..... 305
21.3. Median Absolute Deviation ..... 310
21.4. Extreme Values ..... 312
Problems ..... 315
22. L-Statistics ..... 316
22.1. Introduction ..... 316
22.2. Hájek Projection ..... 318
22.3. Delta Method ..... 320
22.4. L-Estimators for Location ..... 323
Problems ..... 324
23. Bootstrap ..... 326
23.1. Introduction ..... 326
23.2. Consistency ..... 329
23.3. Higher-Order Correctness ..... 334
Problems ..... 339
24. Nonparametric Density Estimation ..... 341
24.1 Introduction ..... 341
24.2 Kernel Estimators ..... 341
24.3 Rate Optimality ..... 346
24.4 Estimating a Unimodal Density ..... 349
Problems ..... 356
25. Semiparametric Models ..... 358
25.1 Introduction ..... 358
25.2 Banach and Hilbert Spaces ..... 360
25.3 Tangent Spaces and Information ..... 362
25.4 Efficient Score Functions ..... 368
25.5 Score and Information Operators ..... 371
25.6 Testing ..... 384
*25.7 Efficiency and the Delta Method ..... 386
25.8 Efficient Score Equations ..... 391
25.9 General Estimating Equations ..... 400
25.10 Maximum Likelihood Estimators ..... 402
25.11 Approximately Least-Favorable Submodels ..... 408
25.12 Likelihood Equations ..... 419
Problems ..... 431
References ..... 433
Index ..... 439

## Preface

This book grew out of courses that I gave at various places, including a graduate course in the Statistics Department of Texas A\&M University, Master's level courses for mathematics students specializing in statistics at the Vrije Universiteit Amsterdam, a course in the DEA program (graduate level) of Université de Paris-sud, and courses in the Dutch AIO-netwerk (graduate level).

The mathematical level is mixed. Some parts I have used for second year courses for mathematics students (but they find it tough), other parts I would only recommend for a graduate program. The text is written both for students who know about the technical details of measure theory and probability, but little about statistics, and vice versa. This requires brief explanations of statistical methodology, for instance of what a rank test or the bootstrap is about, and there are similar excursions to introduce mathematical details. Familiarity with (higher-dimensional) calculus is necessary in all of the manuscript. Metric and normed spaces are briefly introduced in Chapter 18, when these concepts become necessary for Chapters 19, 20, 21 and 22, but I do not expect that this would be enough as a first introduction. For Chapter 25 basic knowledge of Hilbert spaces is extremely helpful, although the bare essentials are summarized at the beginning. Measure theory is implicitly assumed in the whole manuscript but can at most places be avoided by skipping proofs, by ignoring the word "measurable" or with a bit of handwaving. Because we deal mostly with i.i.d. observations, the simplest limit theorems from probability theory suffice. These are derived in Chapter 2, but prior exposure is helpful.

Sections, results or proofs that are preceded by asterisks are either of secondary importance or are out of line with the natural order of the chapters. As the chart in Figure 0.1 shows, many of the chapters are independent from one another, and the book can be used for several different courses.

A unifying theme is approximation by a limit experiment. The full theory is not developed (another writing project is on its way), but the material is limited to the "weak topology" on experiments, which in $90 \%$ of the book is exemplified by the case of smooth parameters of the distribution of i.i.d. observations. For this situation the theory can be developed by relatively simple, direct arguments. Limit experiments are used to explain efficiency properties, but also why certain procedures asymptotically take a certain form.

A second major theme is the application of results on abstract empirical processes. These already have benefits for deriving the usual theorems on $M$-estimators for Euclidean parameters but are indispensable if discussing more involved situations, such as $M$-estimators with nuisance parameters, chi-square statistics with data-dependent cells, or semiparametric models. The general theory is summarized in about 30 pages, and it is the applications

![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-015.jpg?height=2849&width=2947&top_left_y=548&top_left_x=1364)
Figure 0.1. Dependence chart. A solid arrow means that a chapter is a prerequisite for a next chapter. A dotted arrow means a natural continuation. Vertical or horizontal position has no independent meaning.

that we focus on. In a sense, it would have been better to place this material (Chapters 18 and 19) earlier in the book, but instead we start with material of more direct statistical relevance and of a less abstract character. A drawback is that a few (starred) proofs point ahead to later chapters.

Almost every chapter ends with a "Notes" section. These are meant to give a rough historical sketch, and to provide entries in the literature for further reading. They certainly do not give sufficient credit to the original contributions by many authors and are not meant to serve as references in this way.

Mathematical statistics obtains its relevance from applications. The subjects of this book have been chosen accordingly. On the other hand, this is a mathematician's book in that we have made some effort to present results in a nice way, without the (unnecessary) lists of "regularity conditions" that are sometimes found in statistics books. Occasionally, this means that the accompanying proof must be more involved. If this means that an idea could go lost, then an informal argument precedes the statement of a result.

This does not mean that I have strived after the greatest possible generality. A simple, clean presentation was the main aim.

Leiden, September 1997
A.W. van der Vaart

## Notation

| $A^{*}$ | adjoint operator |
| :--- | :--- |
| $\mathbb{B}^{*}$ | dual space |
| $C_{b}(T), U C(T), C(T) \ell^{\infty}(T)$ | (bounded, uniformly) continuous functions on $T$ bounded functions on $T$ |
| $\mathcal{L}_{r}(Q), L_{r}(Q)$ | measurable functions whose $r$ th powers are $Q$-integrable |
| $\\|f\\|_{Q, r}$ | norm of $L_{r}(Q)$ |
| $\\|z\\|_{\infty},\\|z\\|_{T}$ | uniform norm |
| lin | linear span |
| $\mathbb{C}, \mathbb{N}, \mathbb{Q}, \mathbb{R}, \mathbb{Z}$ | number fields and sets |
| $\mathrm{E} X, \mathrm{E}^{*} X, \operatorname{var} X, \operatorname{sd} X, \operatorname{Cov} X$ | (outer) expectation, variance, standard deviation, covariance (matrix) of $X$ |
| $\mathbb{P}_{n}, \mathbb{G}_{n}$ | empirical measure and process |
| $\mathbb{G}_{P}$ | $P$-Brownian bridge |
| $N(\mu, \Sigma), t_{n}, \chi_{n}^{2}$ | normal, $t$ and chisquare distribution |
| $z_{\alpha}, \chi_{n, \alpha}^{2}, t_{n, \alpha}$ | upper $\alpha$-quantiles of normal, chisquare and $t$ distributions |
| $\ll$ | absolutely continuous |
| ব, ব $\triangleright$ | contiguous, mutually contiguous |
| $\lesssim$ | smaller than up to a constant |
| $\leadsto$ | convergence in distribution |
| $\xrightarrow{\mathrm{P}}$ | convergence in probability |
| $\xrightarrow{\text { as }}$ | convergence almost surely |
| $N(\varepsilon, T, d), N_{[]}(\varepsilon, T, d)$ | covering and bracketing number |
| $J(\varepsilon, T, d), J_{[]}(\varepsilon, T, d)$ | entropy integral |
| $o_{P}(1), O_{P}(1)$ | stochastic order symbols |

## 1

## Introduction

> Why asymptotic statistics? The use of asymptotic approximations is twofold. First, they enable us to find approximate tests and confidence regions. Second, approximations can be used theoretically to study the quality (efficiency) of statistical procedures.

### 1.1 Approximate Statistical Procedures

To carry out a statistical test, we need to know the critical value for the test statistic. In most cases this means that we must know the distribution of the test statistic under the null hypothesis. Sometimes this is known exactly, but more often only approximations are available. This may be because the distribution of the statistic is analytically intractable, or perhaps the postulated statistical model is considered only an approximation of the true underlying distributions. In both cases the use of an approximate critical value may be fully satisfactory for practical purposes.

Consider for instance the classical $t$-test for location. Given a sample of independent observations $X_{1}, \ldots, X_{n}$, we wish to test a null hypothesis concerning the mean $\mu=\mathrm{E} X$. The $t$-test is based on the quotient of the sample mean $\bar{X}_{n}$ and the sample standard deviation $S_{n}$. If the observations arise from a normal distribution with mean $\mu_{0}$, then the distribution of $\sqrt{n}\left(\bar{X}_{n}-\mu_{0}\right) / S_{n}$ is known exactly: It is a $t$-distribution with $n-1$ degrees of freedom. However, we may have doubts regarding the normality, or we might even believe in a completely different model. If the number of observations is not too small, this does not matter too much. Then we may act as if $\sqrt{n}\left(\bar{X}_{n}-\mu_{0}\right) / S_{n}$ possesses a standard normal distribution. The theoretical justification is the limiting result, as $n \rightarrow \infty$,

$$
\sup _{x}\left|\mathrm{P}_{\mu}\left(\frac{\sqrt{n}\left(\bar{X}_{n}-\mu\right)}{S_{n}} \leq x\right)-\Phi(x)\right| \rightarrow 0,
$$

provided the variables $X_{i}$ have a finite second moment. This variation on the central limit theorem is proved in the next chapter. A "large sample" level $\alpha$ test is to reject $H_{0}: \mu=\mu_{0}$ if $\left|\sqrt{n}\left(\bar{X}_{n}-\mu_{0}\right) / S_{n}\right|$ exceeds the upper $\alpha / 2$ quantile of the standard normal distribution. Table 1.1 gives the significance level of this test if the observations are either normally or exponentially distributed, and $\alpha=0.05$. For $n \geq 20$ the approximation is quite reasonable in the normal case. If the underlying distribution is exponential, then the approximation is less satisfactory, because of the skewness of the exponential distribution.

Table 1.1. Level of the test with critical region $\left|\sqrt{n}\left(\bar{X}_{n}-\mu_{0}\right) / S_{n}\right|>1.96$ if the observations are sampled from the normal or exponential distribution.
| $n$ | Normal | Exponential $^{a}$ |
| ---: | :---: | :---: |
| 5 | 0.122 | 0.19 |
| 10 | 0.082 | 0.14 |
| 15 | 0.070 | 0.11 |
| 20 | 0.065 | 0.10 |
| 25 | 0.062 | 0.09 |
| 50 | 0.056 | 0.07 |
| 100 | 0.053 | 0.06 |


[^0]In many ways the $t$-test is an uninteresting example. There are many other reasonable test statistics for the same problem. Often their null distributions are difficult to calculate. An asymptotic result similar to the one for the $t$-statistic would make them practically applicable at least for large sample sizes. Thus, one aim of asymptotic statistics is to derive the asymptotic distribution of many types of statistics.

There are similar benefits when obtaining confidence intervals. For instance, the given approximation result asserts that $\sqrt{n}\left(\bar{X}_{n}-\mu\right) / S_{n}$ is approximately standard normally distributed if $\mu$ is the true mean, whatever its value. This means that, with probability approximately $1-2 \alpha$,

$$
-z_{\alpha} \leq \frac{\sqrt{n}\left(\bar{X}_{n}-\mu\right)}{S_{n}} \leq z_{\alpha} .
$$

This can be rewritten as the confidence statement $\mu=\bar{X}_{n} \pm z_{\alpha} S_{n} / \sqrt{n}$ in the usual manner. For large $n$ its confidence level should be close to $1-2 \alpha$.

As another example, consider maximum likelihood estimators $\hat{\theta}_{n}$ based on a sample of size $n$ from a density $p_{\theta}$. A major result in asymptotic statistics is that in many situations $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ is asymptotically normally distributed with zero mean and covariance matrix the inverse of the Fisher information matrix $I_{\theta}$. If $Z$ is $k$-variate normally distributed with mean zero and nonsingular covariance matrix $\Sigma$, then the quadratic form $Z^{T} \Sigma^{-1} Z$ possesses a chi-square distribution with $k$ degrees of freedom. Thus, acting as if $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ possesses an $N_{k}\left(0, I_{\theta}^{-1}\right)$ distribution, we find that the ellipsoid

$$
\left\{\theta:\left(\theta-\hat{\theta}_{n}\right)^{T} I_{\hat{\theta}_{n}}\left(\theta-\hat{\theta}_{n}\right) \leq \frac{\chi_{k, \alpha}^{2}}{n}\right\}
$$

is an approximate $1-\alpha$ confidence region, if $\chi_{k, \alpha}^{2}$ is the appropriate critical value from the chi-square distribution. A closely related alternative is the region based on inverting the likelihood ratio test, which is also based on an asymptotic approximation.

### 1.2 Asymptotic Optimality Theory

For a relatively small number of statistical problems there exists an exact, optimal solution. For instance, the Neyman-Pearson theory leads to optimal (uniformly most powerful) tests
in certain exponential family models; the Rao-Blackwell theory allows us to conclude that certain estimators are of minimum variance among the unbiased estimators. An important and fairly general result is the Cramér-Rao bound for the variance of unbiased estimators, but it is often not sharp.

If exact optimality theory does not give results, be it because the problem is untractable or because there exist no "optimal" procedures, then asymptotic optimality theory may help. For instance, to compare two tests we might compare approximations to their power functions. To compare estimators, we might compare asymptotic variances rather than exact variances. A major result in this area is that for smooth parametric models maximum likelihood estimators are asymptotically optimal. This roughly means the following. First, maximum likelihood estimators are asymptotically consistent: The sequence of estimators converges in probability to the true value of the parameter. Second, the rate at which maximum likelihood estimators converge to the true value is the fastest possible, typically $1 / \sqrt{n}$. Third, their asymptotic variance, the variance of the limit distribution of $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$, is minimal; in fact, maximum likelihood estimators "asymptotically attain" the Cramér-Rao bound. Thus asymptotics justify the use of the maximum likelihood method in certain situations. It is of interest here that, even though the method of maximum likelihood often leads to reasonable estimators and has great intuitive appeal, in general it does not lead to best estimators for finite samples. Thus the use of an asymptotic criterion simplifies optimality theory considerably.

By taking limits we can gain much insight in the structure of statistical experiments. It turns out that not only estimators and test statistics are asymptotically normally distributed, but often also the whole sequence of statistical models converges to a model with a normal observation. Our good understanding of the latter "canonical experiment" translates directly into understanding other experiments asymptotically. The mathematical beauty of this theory is an added benefit of asymptotic statistics. Though we shall be mostly concerned with normal limiting theory, this theory applies equally well to other situations.

### 1.3 Limitations

Although asymptotics is both practically useful and of theoretical importance, it should not be taken for more than what it is: approximations. Clearly, a theorem that can be interpreted as saying that a statistical procedure works fine for $n \rightarrow \infty$ is of no use if the number of available observations is $n=5$.

In fact, strictly speaking, most asymptotic results that are currently available are logically useless. This is because most asymptotic results are limit results, rather than approximations consisting of an approximating formula plus an accurate error bound. For instance, to estimate a value $a$, we consider it to be the 25 th element $a=a_{25}$ in a sequence $a_{1}, a_{2}, \ldots$, and next take $\lim _{n \rightarrow \infty} a_{n}$ as an approximation. The accuracy of this procedure depends crucially on the choice of the sequence in which $a_{25}$ is embedded, and it seems impossible to defend the procedure from a logical point of view. This is why there is good asymptotics and bad asymptotics and why two types of asymptotics sometimes lead to conflicting claims.

Fortunately, many limit results of statistics do give reasonable answers. Because it may be theoretically very hard to ascertain that approximation errors are small, one often takes recourse to simulation studies to judge the accuracy of a certain approximation.

Just as care is needed if using asymptotic results for approximations, results on asymptotic optimality must be judged in the right manner. One pitfall is that even though a certain procedure, such as maximum likelihood, is asymptotically optimal, there may be many other procedures that are asymptotically optimal as well. For finite samples these may behave differently and possibly better. Then so-called higher-order asymptotics, which yield better approximations, may be fruitful. See e.g., [7], [52] and [114]. Although we occasionally touch on this subject, we shall mostly be concerned with what is known as "first-order asymptotics."

### 1.4 The Index $\boldsymbol{n}$

In all of the following $n$ is an index that tends to infinity, and asymptotics means taking limits as $n \rightarrow \infty$. In most situations $n$ is the number of observations, so that usually asymptotics is equivalent to "large-sample theory." However, certain abstract results are pure limit theorems that have nothing to do with individual observations. In that case $n$ just plays the role of the index that goes to infinity.

### 1.5 Notation

A symbol index is given on page xv.
For brevity we often use operator notation for evaluation of expectations and have special symbols for the empirical measure and process.

For $P$ a measure on a measurable space $(\mathcal{X}, \mathcal{B})$ and $f: \mathcal{X} \mapsto \mathbb{R}^{k}$ a measurable function, $P f$ denotes the integral $\int f d P$; equivalently, the expectation $\mathrm{E}_{P} f\left(X_{1}\right)$ for $X_{1}$ a random variable distributed according to $P$. When applied to the empirical measure $\mathbb{P}_{n}$ of a sample $X_{1}, \ldots, X_{n}$, the discrete uniform measure on the sample values, this yields

$$
\mathbb{P}_{n} f=\frac{1}{n} \sum_{i=1}^{n} f\left(X_{i}\right)
$$

This formula can also be viewed as simply an abbreviation for the average on the right. The empirical process $\mathbb{G}_{n} f$ is the centered and scaled version of the empirical measure, defined by

$$
\mathbb{G}_{n} f=\sqrt{n}\left(\mathbb{P}_{n} f-P f\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(f\left(X_{i}\right)-\mathrm{E}_{P} f\left(X_{i}\right)\right) .
$$

This is studied in detail in Chapter 19, but is used as an abbreviation throughout the book.

## 2

## Stochastic Convergence

> This chapter provides a review of basic modes of convergence of sequences of stochastic vectors, in particular convergence in distribution and in probability.

### 2.1 Basic Theory

A random vector in $\mathbb{R}^{k}$ is a vector $X=\left(X_{1}, \ldots, X_{k}\right)$ of real random variables. ${ }^{\dagger}$ The distribution function of $X$ is the map $x \mapsto \mathrm{P}(X \leq x)$.

A sequence of random vectors $X_{n}$ is said to converge in distribution to a random vector $X$ if

$$
\mathrm{P}\left(X_{n} \leq x\right) \rightarrow \mathrm{P}(X \leq x),
$$

for every $x$ at which the limit distribution function $x \mapsto \mathrm{P}(X \leq x)$ is continuous. Alternative names are weak convergence and convergence in law. As the last name suggests, the convergence only depends on the induced laws of the vectors and not on the probability spaces on which they are defined. Weak convergence is denoted by $X_{n} \rightsquigarrow X$; if $X$ has distribution $L$, or a distribution with a standard code, such as $N(0,1)$, then also by $X_{n} \rightsquigarrow L$ or $X_{n} \rightsquigarrow N(0,1)$.

Let $d(x, y)$ be a distance function on $\mathbb{R}^{k}$ that generates the usual topology. For instance, the Euclidean distance

$$
d(x, y)=\|x-y\|=\left(\sum_{i=1}^{k}\left(x_{i}-y_{i}\right)^{2}\right)^{1 / 2} .
$$

A sequence of random variables $X_{n}$ is said to converge in probability to $X$ if for all $\varepsilon>0$

$$
\mathrm{P}\left(d\left(X_{n}, X\right)>\varepsilon\right) \rightarrow 0 .
$$

This is denoted by $X_{n} \xrightarrow{\mathrm{P}} X$. In this notation convergence in probability is the same as $d\left(X_{n}, X\right) \xrightarrow{\mathrm{P}} 0$.

[^1]As we shall see, convergence in probability is stronger than convergence in distribution. An even stronger mode of convergence is almost-sure convergence. The sequence $X_{n}$ is said to converge almost surely to $X$ if $d\left(X_{n}, X\right) \rightarrow 0$ with probability one:

$$
\mathrm{P}\left(\lim d\left(X_{n}, X\right)=0\right)=1 .
$$

This is denoted by $X_{n} \xrightarrow{\text { as }} X$. Note that convergence in probability and convergence almost surely only make sense if each of $X_{n}$ and $X$ are defined on the same probability space. For convergence in distribution this is not necessary.
2.1 Example (Classical limit theorems). Let $\bar{Y}_{n}$ be the average of the first $n$ of a sequence of independent, identically distributed random vectors $Y_{1}, Y_{2}, \ldots$ If $\mathrm{E}\left\|Y_{1}\right\|<\infty$, then $\bar{Y}_{n} \xrightarrow{\text { as }} \mathrm{E} Y_{1}$ by the strong law of large numbers. Under the stronger assumption that $\mathrm{E}\left\|Y_{1}\right\|^{2}< \infty$, the central limit theorem asserts that $\sqrt{n}\left(\bar{Y}_{n}-\mathrm{E} Y_{1}\right) \rightsquigarrow N\left(0, \operatorname{Cov} Y_{1}\right)$. The central limit theorem plays an important role in this manuscript. It is proved later in this chapter, first for the case of real variables, and next it is extended to random vectors. The strong law of large numbers appears to be of less interest in statistics. Usually the weak law of large numbers, according to which $\bar{Y}_{n} \xrightarrow{\mathrm{P}} \mathrm{E} Y_{1}$, suffices. This is proved later in this chapter.

The portmanteau lemma gives a number of equivalent descriptions of weak convergence. Most of the characterizations are only useful in proofs. The last one also has intuitive value.
2.2 Lemma (Portmanteau). For any random vectors $X_{n}$ and $X$ the following statements are equivalent.
(i) $\mathrm{P}\left(X_{n} \leq x\right) \rightarrow \mathrm{P}(X \leq x)$ for all continuity points of $x \mapsto \mathrm{P}(X \leq x)$;
(ii) $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for all bounded, continuous functions $f$;
(iii) $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for all bounded, Lipschitz ${ }^{\dagger}$ functions $f$;
(iv) $\liminf \mathrm{E} f\left(X_{n}\right) \geq \mathrm{E} f(X)$ for all nonnegative, continuous functions $f$;
(v) $\liminf \mathrm{P}\left(X_{n} \in G\right) \geq \mathrm{P}(X \in G)$ for every open set $G$;
(vi) $\lim \sup \mathrm{P}\left(X_{n} \in F\right) \leq \mathrm{P}(X \in F)$ for every closed set $F$;
(vii) $\mathrm{P}\left(X_{n} \in B\right) \rightarrow \mathrm{P}(X \in B)$ for all Borel sets $B$ with $\mathrm{P}(X \in \delta B)=0$, where $\delta B=\bar{B}-\stackrel{\circ}{B}$ is the boundary of $B$.

Proof. (i) ⇒ (ii). Assume first that the distribution function of $X$ is continuous. Then condition (i) implies that $\mathrm{P}\left(X_{n} \in I\right) \rightarrow \mathrm{P}(X \in I)$ for every rectangle $I$. Choose a sufficiently large, compact rectangle $I$ with $\mathrm{P}(X \notin I)<\varepsilon$. A continuous function $f$ is uniformly continuous on the compact set $I$. Thus there exists a partition $I=\cup_{j} I_{j}$ into finitely many rectangles $I_{j}$ such that $f$ varies at most $\varepsilon$ on every $I_{j}$. Take a point $x_{j}$ from each $I_{j}$ and define $f_{\varepsilon}=\sum_{j} f\left(x_{j}\right) 1_{I_{j}}$. Then $\left|f-f_{\varepsilon}\right|<\varepsilon$ on $I$, whence if $f$ takes its values in $[-1,1]$,

$$
\begin{aligned}
\left|\mathrm{E} f\left(X_{n}\right)-\mathrm{E} f_{\varepsilon}\left(X_{n}\right)\right| & \leq \varepsilon+\mathrm{P}\left(X_{n} \notin I\right), \\
\left|\mathrm{E} f(X)-\mathrm{E} f_{\varepsilon}(X)\right| & \leq \varepsilon+\mathrm{P}(X \notin I)<2 \varepsilon .
\end{aligned}
$$

[^2]For sufficiently large $n$, the right side of the first equation is smaller than $2 \varepsilon$ as well. We combine this with

$$
\left|\mathrm{E} f_{\varepsilon}\left(X_{n}\right)-\mathrm{E} f_{\varepsilon}(X)\right| \leq \sum_{j}\left|\mathrm{P}\left(X_{n} \in I_{j}\right)-\mathrm{P}\left(X \in I_{j}\right)\right|\left|f\left(x_{j}\right)\right| \rightarrow 0
$$

Together with the triangle inequality the three displays show that $\left|\mathrm{E} f\left(X_{n}\right)-\mathrm{E} f(X)\right|$ is bounded by $5 \varepsilon$ eventually. This being true for every $\varepsilon>0$ implies (ii).

Call a set $B$ a continuity set if its boundary $\delta B$ satisfies $\mathrm{P}(X \in \delta B)=0$. The preceding argument is valid for a general $X$ provided all rectangles $I$ are chosen equal to continuity sets. This is possible, because the collection of discontinuity sets is sparse. Given any collection of pairwise disjoint measurable sets, at most countably many sets can have positive probability. Otherwise the probability of their union would be infinite. Therefore, given any collection of sets $\left\{B_{\alpha}: \alpha \in A\right\}$ with pairwise disjoint boundaries, all except at most countably many sets are continuity sets. In particular, for each $j$ at most countably many sets of the form $\left\{x: x_{j} \leq \alpha\right\}$ are not continuity sets. Conclude that there exist dense subsets $Q_{1}, \ldots, Q_{k}$ of $\mathbb{R}$ such that each rectangle with corners in the set $Q_{1} \times \cdots \times Q_{k}$ is a continuity set. We can choose all rectangles $I$ inside this set.
(iii) ⇒ (v). For every open set $G$ there exists a sequence of Lipschitz functions with $0 \leq f_{m} \uparrow 1_{G}$. For instance $f_{m}(x)=\left(m d\left(x, G^{c}\right)\right) \wedge 1$. For every fixed $m$,

$$
\liminf _{n \rightarrow \infty} \mathrm{P}\left(X_{n} \in G\right) \geq \liminf _{n \rightarrow \infty} \mathrm{E} f_{m}\left(X_{n}\right)=\mathrm{E} f_{m}(X) .
$$

As $m \rightarrow \infty$ the right side increases to $\mathrm{P}(X \in G)$ by the monotone convergence theorem.
(v) ⇔ (vi). Because a set is open if and only if its complement is closed, this follows by taking complements.
(v) + (vi) $\Rightarrow$ (vii). Let $\stackrel{\circ}{B}$ and $\bar{B}$ denote the interior and the closure of a set, respectively. By (iv)

$$
\mathrm{P}(X \in \stackrel{\circ}{B}) \leq \liminf \mathrm{P}\left(X_{n} \in \stackrel{\circ}{B}\right) \leq \limsup \mathrm{P}\left(X_{n} \in \bar{B}\right) \leq \mathrm{P}(X \in \bar{B}),
$$

by (v). If $\mathrm{P}(X \in \delta B)=0$, then left and right side are equal, whence all inequalities are equalities. The probability $\mathrm{P}(X \in B)$ and the $\operatorname{limit} \lim \mathrm{P}\left(X_{n} \in B\right)$ are between the expressions on left and right and hence equal to the common value.
(vii) ⇒ (i). Every cell $(-\infty, x]$ such that $x$ is a continuity point of $x \mapsto \mathrm{P}(X \leq x)$ is a continuity set.

The equivalence (ii) ⇔ (iv) is left as an exercise.

The continuous-mapping theorem is a simple result, but it is extremely useful. If the sequence of random vectors $X_{n}$ converges to $X$ and $g$ is continuous, then $g\left(X_{n}\right)$ converges to $g(X)$. This is true for each of the three modes of stochastic convergence.
2.3 Theorem (Continuous mapping). Let $g: \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ be continuous at every point of a set $C$ such that $\mathrm{P}(X \in C)=1$.
(i) If $X_{n} \rightsquigarrow X$, then $g\left(X_{n}\right) \rightsquigarrow g(X)$;
(ii) If $X_{n} \xrightarrow{\mathrm{P}} X$, then $g\left(X_{n}\right) \xrightarrow{\mathrm{P}} g(X)$;
(iii) If $X_{n} \xrightarrow{\text { as }} X$, then $g\left(X_{n}\right) \xrightarrow{\text { as }} g(X)$.

Proof. (i). The event $\left\{g\left(X_{n}\right) \in F\right\}$ is identical to the event $\left\{X_{n} \in g^{-1}(F)\right\}$. For every closed set $F$,

$$
g^{-1}(F) \subset \overline{g^{-1}(F)} \subset g^{-1}(F) \cup C^{c}
$$

To see the second inclusion, take $x$ in the closure of $g^{-1}(F)$. Thus, there exists a sequence $x_{m}$ with $x_{m} \rightarrow x$ and $g\left(x_{m}\right) \in F$ for every $F$. If $x \in C$, then $g\left(x_{m}\right) \rightarrow g(x)$, which is in $F$ because $F$ is closed; otherwise $x \in C^{c}$. By the portmanteau lemma,

$$
\lim \sup \mathrm{P}\left(g\left(X_{n}\right) \in F\right) \leq \lim \sup \mathrm{P}\left(X_{n} \in \overline{g^{-1}(F)}\right) \leq \mathrm{P}\left(X \in \overline{g^{-1}(F)}\right) .
$$

Because $\mathrm{P}\left(X \in C^{c}\right)=0$, the probability on the right is $\mathrm{P}\left(X \in g^{-1}(F)\right)=\mathrm{P}(g(X) \in F)$. Apply the portmanteau lemma again, in the opposite direction, to conclude that $g\left(X_{n}\right) \rightsquigarrow g(X)$.
(ii). Fix arbitrary $\varepsilon>0$. For each $\delta>0$ let $B_{\delta}$ be the set of $x$ for which there exists $y$ with $d(x, y)<\delta$, but $d(g(x), g(y))>\varepsilon$. If $X \notin B_{\delta}$ and $d\left(g\left(X_{n}\right), g(X)\right)>\varepsilon$, then $d\left(X_{n}, X\right) \geq \delta$. Consequently,

$$
\mathrm{P}\left(d\left(g\left(X_{n}\right), g(X)\right)>\varepsilon\right) \leq \mathrm{P}\left(X \in B_{\delta}\right)+\mathrm{P}\left(d\left(X_{n}, X\right) \geq \delta\right) .
$$

The second term on the right converges to zero as $n \rightarrow \infty$ for every fixed $\delta>0$. Because $B_{\delta} \cap C \downarrow \emptyset$ by continuity of $g$, the first term converges to zero as $\delta \downarrow 0$.

Assertion (iii) is trivial.

Any random vector $X$ is tight: For every $\varepsilon>0$ there exists a constant $M$ such that $\mathrm{P}(\|X\|>M)<\varepsilon$. A set of random vectors $\left\{X_{\alpha}: \alpha \in A\right\}$ is called uniformly tight if $M$ can be chosen the same for every $X_{\alpha}$ : For every $\varepsilon>0$ there exists a constant $M$ such that

$$
\sup _{\alpha} \mathrm{P}\left(\left\|X_{\alpha}\right\|>M\right)<\varepsilon .
$$

Thus, there exists a compact set to which all $X_{\alpha}$ give probability "almost" one. Another name for uniformly tight is bounded in probability. It is not hard to see that every weakly converging sequence $X_{n}$ is uniformly tight. More surprisingly, the converse of this statement is almost true: According to Prohorov's theorem, every uniformly tight sequence contains a weakly converging subsequence. Prohorov's theorem generalizes the Heine-Borel theorem from deterministic sequences $X_{n}$ to random vectors.
2.4 Theorem (Prohorov's theorem). Let $X_{n}$ be random vectors in $\mathbb{R}^{k}$.
(i) If $X_{n} \rightsquigarrow X$ for some $X$, then $\left\{X_{n}: n \in \mathbb{N}\right\}$ is uniformly tight;
(ii) If $X_{n}$ is uniformly tight, then there exists a subsequence with $X_{n_{j}} \rightsquigarrow X$ as $j \rightarrow \infty$, for some $X$.

Proof. (i). Fix a number $M$ such that $\mathrm{P}(\|X\| \geq M)<\varepsilon$. By the portmanteau lemma $\mathrm{P}\left(\left\|X_{n}\right\| \geq M\right)$ exceeds $\mathrm{P}(\|X\| \geq M)$ arbitrarily little for sufficiently large $n$. Thus there exists $N$ such that $\mathrm{P}\left(\left\|X_{n}\right\| \geq M\right)<2 \varepsilon$, for all $n \geq N$. Because each of the finitely many variables $X_{n}$ with $n<N$ is tight, the value of $M$ can be increased, if necessary, to ensure that $\mathrm{P}\left(\left\|X_{n}\right\| \geq M\right)<2 \varepsilon$ for every $n$.
(ii). By Helly's lemma (described subsequently), there exists a subsequence $F_{n_{j}}$ of the sequence of cumulative distribution functions $F_{n}(x)=\mathrm{P}\left(X_{n} \leq x\right)$ that converges weakly to a possibly "defective" distribution function $F$. It suffices to show that $F$ is a proper distribution function: $F(x) \rightarrow 0,1$ if $x_{i} \rightarrow-\infty$ for some $i$, or $x \rightarrow \infty$. By the uniform tightness, there exists $M$ such that $F_{n}(M)>1-\varepsilon$ for all $n$. By making $M$ larger, if necessary, it can be ensured that $M$ is a continuity point of $F$. Then $F(M)=\lim F_{n_{j}}(M) \geq 1-\varepsilon$. Conclude that $F(x) \rightarrow 1$ as $x \rightarrow \infty$. That the limits at $-\infty$ are zero can be seen in a similar manner.

The crux of the proof of Prohorov's theorem is Helly's lemma. This asserts that any given sequence of distribution functions contains a subsequence that converges weakly to a possibly defective distribution function. A defective distribution function is a function that has all the properties of a cumulative distribution function with the exception that it has limits less than 1 at $\infty$ and/or greater than 0 at $-\infty$.
2.5 Lemma (Helly's lemma). Each given sequence $F_{n}$ of cumulative distribution functions on $\mathbb{R}^{k}$ possesses a subsequence $F_{n_{j}}$ with the property that $F_{n_{j}}(x) \rightarrow F(x)$ at each continuity point $x$ of a possibly defective distribution function $F$.

Proof. Let $\mathbb{Q}^{k}=\left\{q_{1}, q_{2}, \ldots\right\}$ be the vectors with rational coordinates, ordered in an arbitrary manner. Because the sequence $F_{n}\left(q_{1}\right)$ is contained in the interval $[0,1]$, it has a converging subsequence. Call the indexing subsequence $\left\{n_{j}^{1}\right\}_{j=1}^{\infty}$ and the limit $G\left(q_{1}\right)$. Next, extract a further subsequence $\left\{n_{j}^{2}\right\} \subset\left\{n_{j}^{1}\right\}$ along which $F_{n}\left(q_{2}\right)$ converges to a limit $G\left(q_{2}\right)$, a further subsequence $\left\{n_{j}^{3}\right\} \subset\left\{n_{j}^{2}\right\}$ along which $F_{n}\left(q_{3}\right)$ converges to a limit $G\left(q_{3}\right), \ldots$, and so forth. The "tail" of the diagonal sequence $n_{j}:=n_{j}^{j}$ belongs to every sequence $n_{j}^{i}$. Hence $F_{n_{j}}\left(q_{i}\right) \rightarrow G\left(q_{i}\right)$ for every $i=1,2, \ldots$. Because each $F_{n}$ is nondecreasing, $G(q) \leq G\left(q^{\prime}\right)$ if $q \leq q^{\prime}$. Define

$$
F(x)=\inf _{q>x} G(q)
$$

Then $F$ is nondecreasing. It is also right-continuous at every point $x$, because for every $\varepsilon>0$ there exists $q>x$ with $G(q)-F(x)<\varepsilon$, which implies $F(y)-F(x)<\varepsilon$ for every $x \leq y \leq q$. Continuity of $F$ at $x$ implies, for every $\varepsilon>0$, the existence of $q<x<q^{\prime}$ such that $G\left(q^{\prime}\right)-G(q)<\varepsilon$. By monotonicity, we have $G(q) \leq F(x) \leq G\left(q^{\prime}\right)$, and

$$
G(q)=\lim F_{n_{j}}(q) \leq \liminf F_{n_{j}}(x) \leq \lim F_{n_{j}}\left(q^{\prime}\right)=G\left(q^{\prime}\right)
$$

Conclude that $\left|\liminf F_{n_{j}}(x)-F(x)\right|<\varepsilon$. Because this is true for every $\varepsilon>0$ and the same result can be obtained for the lim sup, it follows that $F_{n_{j}}(x) \rightarrow F(x)$ at every continuity point of $F$.

In the higher-dimensional case, it must still be shown that the expressions defining masses of cells are nonnegative. For instance, for $k=2, F$ is a (defective) distribution function only if $F(b)+F(a)-F\left(a_{1}, b_{2}\right)-F\left(a_{2}, b_{1}\right) \geq 0$ for every $a \leq b$. In the case that the four corners $a, b,\left(a_{1}, b_{2}\right)$, and $\left(a_{2}, b_{1}\right)$ of the cell are continuity points; this is immediate from the convergence of $F_{n_{j}}$ to $F$ and the fact that each $F_{n}$ is a distribution function. Next, for general cells the property follows by right continuity.
2.6 Example (Markov's inequality). A sequence $X_{n}$ of random variables with $\mathrm{E}\left|X_{n}\right|^{p}= O(1)$ for some $p>0$ is uniformly tight. This follows because by Markov's inequality

$$
\mathrm{P}\left(\left|X_{n}\right|>M\right) \leq \frac{\mathrm{E}\left|X_{n}\right|^{p}}{M^{p}}
$$

The right side can be made arbitrarily small, uniformly in $n$, by choosing sufficiently large M.

Because $\mathrm{E} X_{n}^{2}=\operatorname{var} X_{n}+\left(\mathrm{E} X_{n}\right)^{2}$, an alternative sufficient condition for uniform tightness is $\mathrm{E} X_{n}=O(1)$ and $\operatorname{var} X_{n}=O(1)$. This cannot be reversed.

Consider some of the relationships among the three modes of convergence. Convergence in distribution is weaker than convergence in probability, which is in turn weaker than almost-sure convergence, except if the limit is constant.
2.7 Theorem. Let $X_{n}, X$ and $Y_{n}$ be random vectors. Then
(i) $X_{n} \xrightarrow{\text { as }} X$ implies $X_{n} \xrightarrow{\mathrm{P}} X$;
(ii) $X_{n} \xrightarrow{\mathrm{P}} X$ implies $X_{n} \rightsquigarrow X$;
(iii) $X_{n} \xrightarrow{\mathrm{P}} c$ for a constant $c$ if and only if $X_{n} \leadsto c$;
(iv) if $X_{n} \rightsquigarrow X$ and $d\left(X_{n}, Y_{n}\right) \xrightarrow{\mathrm{P}} 0$, then $Y_{n} \rightsquigarrow X$;
(v) if $X_{n} \rightsquigarrow X$ and $Y_{n} \xrightarrow{\mathrm{P}} c$ for a constant $c$, then $\left(X_{n}, Y_{n}\right) \rightsquigarrow(X, c)$;
(vi) if $X_{n} \xrightarrow{\mathrm{P}} X$ and $Y_{n} \xrightarrow{\mathrm{P}} Y$, then $\left(X_{n}, Y_{n}\right) \xrightarrow{\mathrm{P}}(X, Y)$.

Proof. (i). The sequence of sets $A_{n}=\cup_{m \geq n}\left\{d\left(X_{m}, X\right)>\varepsilon\right\}$ is decreasing for every $\varepsilon>0$ and decreases to the empty set if $X_{n}(\omega) \rightarrow X(\omega)$ for every $\omega$. If $X_{n} \xrightarrow{\text { as }} X$, then $\mathrm{P}\left(d\left(X_{n}, X\right)>\varepsilon\right) \leq \mathrm{P}\left(A_{n}\right) \rightarrow 0$.
(iv). For every $f$ with range $[0,1]$ and Lipschitz norm at most 1 and every $\varepsilon>0$,

$$
\left|\mathrm{E} f\left(X_{n}\right)-\mathrm{E} f\left(Y_{n}\right)\right| \leq \varepsilon \mathrm{E} 1\left\{d\left(X_{n}, Y_{n}\right) \leq \varepsilon\right\}+2 \mathrm{E} 1\left\{d\left(X_{n}, Y_{n}\right)>\varepsilon\right\}
$$

The second term on the right converges to zero as $n \rightarrow \infty$. The first term can be made arbitrarily small by choice of $\varepsilon$. Conclude that the sequences $\mathrm{E} f\left(X_{n}\right)$ and $\mathrm{E} f\left(Y_{n}\right)$ have the same limit. The result follows from the portmanteau lemma.
(ii). Because $d\left(X_{n}, X\right) \xrightarrow{\mathrm{P}} 0$ and trivially $X \rightsquigarrow X$, it follows that $X_{n} \rightsquigarrow X$ by (iv).
(iii). The "only if" part is a special case of (ii). For the converse let ball( $c, \varepsilon$ ) be the open ball of radius $\varepsilon$ around $c$. Then $\mathrm{P}\left(d\left(X_{n}, c\right) \geq \varepsilon\right)=\mathrm{P}\left(X_{n} \in \operatorname{ball}(c, \varepsilon)^{c}\right)$. If $X_{n} \rightsquigarrow c$, then the lim sup of the last probability is bounded by $\mathrm{P}\left(c \in \operatorname{ball}(c, \varepsilon)^{c}\right)=0$, by the portmanteau lemma.
(v). First note that $d\left(\left(X_{n}, Y_{n}\right),\left(X_{n}, c\right)\right)=d\left(Y_{n}, c\right) \xrightarrow{\mathrm{P}} 0$. Thus, according to (iv), it suffices to show that $\left(X_{n}, c\right) \rightsquigarrow(X, c)$. For every continuous, bounded function $(x, y) \mapsto f(x, y)$, the function $x \mapsto f(x, c)$ is continuous and bounded. Thus $\mathrm{E} f\left(X_{n}, c\right) \rightarrow \mathrm{E} f(X, c)$ if $X_{n} \rightsquigarrow X$.
(vi). This follows from $d\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right) \leq d\left(x_{1}, x_{2}\right)+d\left(y_{1}, y_{2}\right)$.

According to the last assertion of the lemma, convergence in probability of a sequence of vectors $X_{n}=\left(X_{n, 1}, \ldots, X_{n, k}\right)$ is equivalent to convergence of every one of the sequences of components $X_{n, i}$ separately. The analogous statement for convergence in distribution
is false: Convergence in distribution of the sequence $X_{n}$ is stronger than convergence of every one of the sequences of components $X_{n, i}$. The point is that the distribution of the components $X_{n, i}$ separately does not determine their joint distribution: They might be independent or dependent in many ways. We speak of joint convergence in distribution versus marginal convergence .

Assertion (v) of the lemma has some useful consequences. If $X_{n} \rightsquigarrow X$ and $Y_{n} \rightsquigarrow c$, then $\left(X_{n}, Y_{n}\right) \rightsquigarrow(X, c)$. Consequently, by the continuous mapping theorem, $g\left(X_{n}, Y_{n}\right) \rightsquigarrow g(X, c)$ for every map $g$ that is continuous at every point in the set $\mathbb{R}^{k} \times\{c\}$ in which the vector ( $X, c$ ) takes its values. Thus, for every $g$ such that

$$
\lim _{x \rightarrow x_{0}, y \rightarrow c} g(x, y)=g\left(x_{0}, c\right), \quad \text { for every } x_{0}
$$

Some particular applications of this principle are known as Slutsky's lemma.
2.8 Lemma (Slutsky). Let $X_{n}, X$ and $Y_{n}$ be random vectors or variables. If $X_{n} \rightsquigarrow X$ and $Y_{n} \rightsquigarrow c$ for a constant $c$, then
(i) $X_{n}+Y_{n} \rightsquigarrow X+c$;
(ii) $Y_{n} X_{n} \rightsquigarrow c X$;
(iii) $Y_{n}^{-1} X_{n} \rightsquigarrow c^{-1} X$ provided $c \neq 0$.

In (i) the "constant" $c$ must be a vector of the same dimension as $X$, and in (ii) it is probably initially understood to be a scalar. However, (ii) is also true if every $Y_{n}$ and $c$ are matrices (which can be identified with vectors, for instance by aligning rows, to give a meaning to the convergence $Y_{n} \rightsquigarrow c$ ), simply because matrix multiplication $(x, y) \mapsto y x$ is a continuous operation. Even (iii) is valid for matrices $Y_{n}$ and $c$ and vectors $X_{n}$ provided $c \neq 0$ is understood as $c$ being invertible, because taking an inverse is also continuous.
2.9 Example ( $t$-statistic). Let $Y_{1}, Y_{2}, \ldots$ be independent, identically distributed random variables with $\mathrm{E} Y_{1}=0$ and $\mathrm{E} Y_{1}^{2}<\infty$. Then the $t$-statistic $\sqrt{n} \bar{Y}_{n} / S_{n}$, where $S_{n}^{2}=(n-$ 1) ${ }^{-1} \sum_{i=1}^{n}\left(Y_{i}-\bar{Y}_{n}\right)^{2}$ is the sample variance, is asymptotically standard normal.

To see this, first note that by two applications of the weak law of large numbers and the continuous-mapping theorem for convergence in probability

$$
S_{n}^{2}=\frac{n}{n-1}\left(\frac{1}{n} \sum_{i=1}^{n} Y_{i}^{2}-\bar{Y}_{n}^{2}\right) \xrightarrow{\mathrm{P}} 1\left(\mathrm{E} Y_{1}^{2}-\left(\mathrm{E} Y_{1}\right)^{2}\right)=\operatorname{var} Y_{1}
$$

Again by the continuous-mapping theorem, $S_{n}$ converges in probability to sd $Y_{1}$. By the central limit theorem $\sqrt{n} \bar{Y}_{n}$ converges in law to the $N\left(0\right.$, var $\left.Y_{1}\right)$ distribution. Finally, Slutsky's lemma gives that the sequence of $t$-statistics converges in distribution to $N\left(0, \operatorname{var} Y_{1}\right) / \operatorname{sd} Y_{1} =N(0,1)$.
2.10 Example (Confidence intervals). Let $T_{n}$ and $S_{n}$ be sequences of estimators satisfying

$$
\sqrt{n}\left(T_{n}-\theta\right) \rightsquigarrow N\left(0, \sigma^{2}\right), \quad S_{n}^{2} \xrightarrow{\mathrm{P}} \sigma^{2},
$$

for certain parameters $\theta$ and $\sigma^{2}$ depending on the underlying distribution, for every distribution in the model. Then $\theta=T_{n} \pm S_{n} / \sqrt{n} z_{\alpha}$ is a confidence interval for $\theta$ of asymptotic
level $1-2 \alpha$. More precisely, we have that the probability that $\theta$ is contained in $\left[T_{n}-\right. \left.S_{n} / \sqrt{n} z_{\alpha}, T_{n}+S_{n} / \sqrt{n} z_{\alpha}\right]$ converges to $1-2 \alpha$.

This is a consequence of the fact that the sequence $\sqrt{n}\left(T_{n}-\theta\right) / S_{n}$ is asymptotically standard normally distributed.

If the limit variable $X$ has a continuous distribution function, then weak convergence $X_{n} \leadsto X$ implies $\mathrm{P}\left(X_{n} \leq x\right) \rightarrow \mathrm{P}(X \leq x)$ for every $x$. The convergence is then even uniform in $x$.
2.11 Lemma. Suppose that $X_{n} \rightsquigarrow X$ for a random vector $X$ with a continuous distribution function. Then $\sup _{x}\left|\mathrm{P}\left(X_{n} \leq x\right)-\mathrm{P}(X \leq x)\right| \rightarrow 0$.

Proof. Let $F_{n}$ and $F$ be the distribution functions of $X_{n}$ and $X$. First consider the onedimensional case. Fix $k \in \mathbb{N}$. By the continuity of $F$ there exist points $-\infty=x_{0}< x_{1}<\cdots<x_{k}=\infty$ with $F\left(x_{i}\right)=i / k$. By monotonicity, we have, for $x_{i-1} \leq x \leq x_{i}$,

$$
\begin{aligned}
F_{n}(x)-F(x) & \leq F_{n}\left(x_{i}\right)-F\left(x_{i-1}\right)=F_{n}\left(x_{i}\right)-F\left(x_{i}\right)+1 / k \\
& \geq F_{n}\left(x_{i-1}\right)-F\left(x_{i}\right)=F_{n}\left(x_{i-1}\right)-F\left(x_{i-1}\right)-1 / k
\end{aligned}
$$

Thus $\left|F_{n}(x)-F(x)\right|$ is bounded above by $\sup _{i}\left|F_{n}\left(x_{i}\right)-F\left(x_{i}\right)\right|+1 / k$, for every $x$. The latter, finite supremum converges to zero as $n \rightarrow \infty$, for each fixed $k$. Because $k$ is arbitrary, the result follows.

In the higher-dimensional case, we follow a similar argument but use hyperrectangles, rather than intervals. We can construct the rectangles by intersecting the $k$ partitions obtained by subdividing each coordinate separately as before.

### 2.2 Stochastic $o$ and $O$ Symbols

It is convenient to have short expressions for terms that converge in probability to zero or are uniformly tight. The notation $o_{P}(1)$ ("small oh-P-one") is short for a sequence of random vectors that converges to zero in probability. The expression $O_{P}(1)$ ("big oh-P-one") denotes a sequence that is bounded in probability. More generally, for a given sequence of random variables $R_{n}$,

$$
\begin{aligned}
& X_{n}=o_{P}\left(R_{n}\right) \quad \text { means } \quad X_{n}=Y_{n} R_{n} \quad \text { and } \quad Y_{n} \xrightarrow{\mathrm{P}} 0 ; \\
& X_{n}=O_{P}\left(R_{n}\right) \quad \text { means } \quad X_{n}=Y_{n} R_{n} \quad \text { and } \quad Y_{n}=O_{P}(1) .
\end{aligned}
$$

This expresses that the sequence $X_{n}$ converges in probability to zero or is bounded in probability at the "rate" $R_{n}$. For deterministic sequences $X_{n}$ and $R_{n}$, the stochastic "oh" symbols reduce to the usual $o$ and $O$ from calculus.

There are many rules of calculus with $o$ and $O$ symbols, which we apply without comment. For instance,

$$
\begin{aligned}
o_{P}(1)+o_{P}(1) & =o_{P}(1) \\
o_{P}(1)+O_{P}(1) & =O_{P}(1) \\
O_{P}(1) o_{P}(1) & =o_{P}(1)
\end{aligned}
$$

$$
\begin{aligned}
\left(1+o_{P}(1)\right)^{-1} & =O_{P}(1) \\
o_{P}\left(R_{n}\right) & =R_{n} o_{P}(1) \\
O_{P}\left(R_{n}\right) & =R_{n} O_{P}(1) \\
o_{P}\left(O_{P}(1)\right) & =o_{P}(1)
\end{aligned}
$$

To see the validity of these rules it suffices to restate them in terms of explicitly named vectors, where each $o_{P}(1)$ and $O_{P}(1)$ should be replaced by a different sequence of vectors that converges to zero or is bounded in probability. In this way the first rule says: If $X_{n} \xrightarrow{\mathrm{P}} 0$ and $Y_{n} \xrightarrow{\mathrm{P}} 0$, then $Z_{n}=X_{n}+Y_{n} \xrightarrow{\mathrm{P}} 0$. This is an example of the continuous-mapping theorem. The third rule is short for the following: If $X_{n}$ is bounded in probability and $Y_{n} \xrightarrow{\mathrm{P}} 0$, then $X_{n} Y_{n} \xrightarrow{\mathrm{P}} 0$. If $X_{n}$ would also converge in distribution, then this would be statement (ii) of Slutsky's lemma (with $c=0$ ). But by Prohorov's theorem, $X_{n}$ converges in distribution "along subsequences" if it is bounded in probability, so that the third rule can still be deduced from Slutsky's lemma by "arguing along subsequences."

Note that both rules are in fact implications and should be read from left to right, even though they are stated with the help of the equality sign. Similarly, although it is true that $o_{P}(1)+o_{P}(1)=2 o_{P}(1)$, writing down this rule does not reflect understanding of the $o_{P}$ symbol.

Two more complicated rules are given by the following lemma.
2.12 Lemma. Let $R$ be a function defined on domain in $\mathbb{R}^{k}$ such that $R(0)=0$. Let $X_{n}$ be a sequence of random vectors with values in the domain of $R$ that converges in probability to zero. Then, for every $p>0$,
(i) if $R(h)=o\left(\|h\|^{p}\right)$ as $h \rightarrow 0$, then $R\left(X_{n}\right)=o_{P}\left(\left\|X_{n}\right\|^{p}\right)$;
(ii) if $R(h)=O\left(\|h\|^{p}\right)$ as $h \rightarrow 0$, then $R\left(X_{n}\right)=O_{P}\left(\left\|X_{n}\right\|^{p}\right)$.

Proof. Define $g(h)$ as $g(h)=R(h) /\|h\|^{p}$ for $h \neq 0$ and $g(0)=0$. Then $R\left(X_{n}\right)= g\left(X_{n}\right)\left\|X_{n}\right\|^{p}$.
(i) Because the function $g$ is continuous at zero by assumption, $g\left(X_{n}\right) \xrightarrow{\mathrm{P}} g(0)=0$ by the continuous-mapping theorem.
(ii) By assumption there exist $M$ and $\delta>0$ such that $|g(h)| \leq M$ whenever $\|h\| \leq \delta$. Thus $\mathrm{P}\left(\left|g\left(X_{n}\right)\right|>M\right) \leq \mathrm{P}\left(\left\|X_{n}\right\|>\delta\right) \rightarrow 0$, and the sequence $g\left(X_{n}\right)$ is tight.

## *2.3 Characteristic Functions

It is sometimes possible to show convergence in distribution of a sequence of random vectors directly from the definition. In other cases "transforms" of probability measures may help. The basic idea is that it suffices to show characterization (ii) of the portmanteau lemma for a small subset of functions $f$ only.

The most important transform is the characteristic function

$$
t \mapsto \mathrm{E} e^{i t^{T} X}, \quad t \in \mathbb{R}^{k}
$$

Each of the functions $x \mapsto e^{i t^{T} x}$ is continuous and bounded. Thus, by the portmanteau lemma, $\mathrm{E} e^{i t^{T} X_{n}} \rightarrow \mathrm{E} e^{i t^{T} X}$ for every $t$ if $X_{n} \rightsquigarrow X$. By Lévy's continuity theorem the
converse is also true: Pointwise convergence of characteristic functions is equivalent to weak convergence.
2.13 Theorem (Lévy's continuity theorem). Let $X_{n}$ and $X$ be random vectors in $\mathbb{R}^{k}$. Then $X_{n} \rightsquigarrow X$ if and only if $\mathrm{E} e^{i t^{T} X_{n}} \rightarrow \mathrm{E} e^{i t^{T} X}$ for every $t \in \mathbb{R}^{k}$. Moreover, if $E e^{i t^{T} X_{n}}$ converges pointwise to a function $\phi(t)$ that is continuous at zero, then $\phi$ is the characteristic function of a random vector $X$ and $X_{n} \rightsquigarrow X$.

Proof. If $X_{n} \rightsquigarrow X$, then $\mathrm{E} h\left(X_{n}\right) \rightarrow \mathrm{E} h(X)$ for every bounded continuous function $h$, in particular for the functions $h(x)=e^{i t^{T} x}$. This gives one direction of the first statement.

For the proof of the last statement, suppose first that we already know that the sequence $X_{n}$ is uniformly tight. Then, according to Prohorov's theorem, every subsequence has a further subsequence that converges in distribution to some vector $Y$. By the preceding paragraph, the characteristic function of $Y$ is the limit of the characteristic functions of the converging subsequence. By assumption, this limit is the function $\phi(t)$. Conclude that every weak limit point $Y$ of a converging subsequence possesses characteristic function $\phi$. Because a characteristic function uniquely determines a distribution (see Lemma 2.15), it follows that the sequence $X_{n}$ has only one weak limit point. It can be checked that a uniformly tight sequence with a unique limit point converges to this limit point, and the proof is complete.

The uniform tightness of the sequence $X_{n}$ can be derived from the continuity of $\phi$ at zero. Because marginal tightness implies joint tightness, it may be assumed without loss of generality that $X_{n}$ is one-dimensional. For every $x$ and $\delta>0$,

$$
1\{|\delta x|>2\} \leq 2\left(1-\frac{\sin \delta x}{\delta x}\right)=\frac{1}{\delta} \int_{-\delta}^{\delta}(1-\cos t x) d t
$$

Replace $x$ by $X_{n}$, take expectations, and use Fubini's theorem to obtain that

$$
\mathrm{P}\left(\left|X_{n}\right|>\frac{2}{\delta}\right) \leq \frac{1}{\delta} \int_{-\delta}^{\delta} \operatorname{Re}\left(1-\mathrm{E} e^{i t X_{n}}\right) d t
$$

By assumption, the integrand in the right side converges pointwise to $\operatorname{Re}(1-\phi(t))$. By the dominated-convergence theorem, the whole expression converges to

$$
\frac{1}{\delta} \int_{-\delta}^{\delta} \operatorname{Re}(1-\phi(t)) d t
$$

Because $\phi$ is continuous at zero, there exists for every $\varepsilon>0$ a $\delta>0$ such that $|1-\phi(t)|<\varepsilon$ for $|t|<\delta$. For this $\delta$ the integral is bounded by $2 \varepsilon$. Conclude that $\mathrm{P}\left(\left|X_{n}\right|>2 / \delta\right) \leq 2 \varepsilon$ for sufficiently large $n$, whence the sequence $X_{n}$ is uniformly tight.
2.14 Example (Normal distribution). The characteristic function of the $N_{k}(\mu, \Sigma)$ distribution is the function

$$
t \mapsto e^{i t^{T} \mu-\frac{1}{2} t^{T} \Sigma t} .
$$

Indeed, if $X$ is $N_{k}(0, I)$ distributed and $\Sigma^{1 / 2}$ is a symmetric square root of $\Sigma$ (hence $\Sigma=\left(\Sigma^{1 / 2}\right)^{2}$ ), then $\Sigma^{1 / 2} X+\mu$ possesses the given normal distribution and

$$
\mathrm{E} e^{z^{T}\left(\Sigma^{1 / 2} X+\mu\right)}=e^{z^{T} \mu} \int e^{\left(\Sigma^{1 / 2} z\right)^{T} x-\frac{1}{2} x^{T} x} d x \frac{1}{(2 \pi)^{k / 2}}=e^{z^{T} \mu+\frac{1}{2} z^{T} \Sigma z}
$$

For real-valued $z$, the last equality follows easily by completing the square in the exponent. Evaluating the integral for complex $z$, such as $z=i t$, requires some skill in complex function theory. One method, which avoids further calculations, is to show that both the left- and righthand sides of the preceding display are analytic functions of $z$. For the right side this is obvious; for the left side we can justify differentiation under the expectation sign by the dominated-convergence theorem. Because the two sides agree on the real axis, they must agree on the complex plane by uniqueness of analytic continuation.
2.15 Lemma. Random vectors $X$ and $Y$ in $\mathbb{R}^{k}$ are equal in distribution if and only if $\mathrm{E} e^{i t^{T} X}=\mathrm{E} e^{i t^{T} Y}$ for every $t \in \mathbb{R}^{k}$.

Proof. By Fubini's theorem and calculations as in the preceding example, for every $\sigma>0$ and $y \in \mathbb{R}^{k}$,

$$
\begin{aligned}
\int e^{-i t^{T} y} e^{-\frac{1}{2} t^{T} t \sigma^{2}} \mathrm{E} e^{i t^{T} X} d t & =\mathrm{E} \int e^{i t^{T}(X-y)} e^{-\frac{1}{2} t^{T} t \sigma^{2}} d t \\
& =\frac{(2 \pi)^{k / 2}}{\sigma^{k}} \mathrm{E} e^{-\frac{1}{2}(X-y)^{T}(X-y) / \sigma^{2}}
\end{aligned}
$$

By the convolution formula for densities, the righthand side is $(2 \pi)^{k}$ times the density $p_{X+\sigma Z}(y)$ of the sum of $X$ and $\sigma Z$ for a standard normal vector $Z$ that is independent of $X$. Conclude that if $X$ and $Y$ have the same characteristic function, then the vectors $X+\sigma Z$ and $Y+\sigma Z$ have the same density and hence are equal in distribution for every $\sigma>0$. By Slutsky's lemma $X+\sigma Z \rightsquigarrow X$ as $\sigma \downarrow 0$, and similarly for $Y$. Thus $X$ and $Y$ are equal in distribution.

The characteristic function of a sum of independent variables equals the product of the characteristic functions of the individual variables. This observation, combined with Lévy's theorem, yields simple proofs of both the law of large numbers and the central limit theorem.
2.16 Proposition (Weak law of large numbers). Let $Y_{1}, \ldots, Y_{n}$ be i.i.d. random variables with characteristic function $\phi$. Then $\bar{Y}_{n} \xrightarrow{\mathrm{P}} \mu$ for a real number $\mu$ if and only if $\phi$ is differentiable at zero with $i \mu=\phi^{\prime}(0)$.

Proof. We only prove that differentiability is sufficient. For the converse, see, for example, [127, p. 52]. Because $\phi(0)=1$, differentiability of $\phi$ at zero means that $\phi(t)=1 +t \phi^{\prime}(0)+o(t)$ as $t \rightarrow 0$. Thus, by Fubini's theorem, for each fixed $t$ and $n \rightarrow \infty$,

$$
\mathrm{E} e^{i t \bar{Y}_{n}}=\phi^{n}\left(\frac{t}{n}\right)=\left(1+\frac{t}{n} i \mu+o\left(\frac{1}{n}\right)\right)^{n} \rightarrow e^{i t \mu} .
$$

The right side is the characteristic function of the constant variable $\mu$. By Lévy's theorem, $\bar{Y}_{n}$ converges in distribution to $\mu$. Convergence in distribution to a constant is the same as convergence in probability.

A sufficient but not necessary condition for $\phi(t)=\mathrm{E} e^{i t Y}$ to be differentiable at zero is that $\mathrm{E}|Y|<\infty$. In that case the dominated convergence theorem allows differentiation
under the expectation sign, and we obtain

$$
\phi^{\prime}(t)=\frac{d}{d t} \mathrm{E} e^{i t Y}=\mathrm{E} i Y e^{i t Y}
$$

In particular, the derivative at zero is $\phi^{\prime}(0)=i \mathrm{E} Y$ and hence $\bar{Y}_{n} \xrightarrow{\mathrm{P}} \mathrm{E} Y_{1}$.
If $\mathrm{E} Y^{2}<\infty$, then the Taylor expansion can be carried a step further and we can obtain a version of the central limit theorem.
2.17 Proposition (Central limit theorem). Let $Y_{1}, \ldots, Y_{n}$ be i.i.d. random variables with $\mathrm{E} Y_{i}=0$ and $\mathrm{E} Y_{i}^{2}=1$. Then the sequence $\sqrt{n} \bar{Y}_{n}$ converges in distribution to the standard normal distribution.

Proof. A second differentiation under the expectation sign shows that $\phi^{\prime \prime}(0)=i^{2} \mathrm{E} Y^{2}$. Because $\phi^{\prime}(0)=i \mathrm{E} Y=0$, we obtain

$$
\mathrm{E} e^{i t \sqrt{n} \bar{Y}_{n}}=\phi^{n}\left(\frac{t}{\sqrt{n}}\right)=\left(1-\frac{1}{2} \frac{t^{2}}{n} \mathrm{E} Y^{2}+o\left(\frac{1}{n}\right)\right)^{n} \rightarrow e^{-\frac{1}{2} t^{2} \mathrm{E} Y^{2}}
$$

The right side is the characteristic function of the normal distribution with mean zero and variance $\mathrm{E} Y^{2}$. The proposition follows from Lévy's continuity theorem.

The characteristic function $t \mapsto \mathrm{E} e^{i t^{T} X}$ of a vector $X$ is determined by the set of all characteristic functions $u \mapsto \mathrm{E} e^{i u\left(t^{T} X\right)}$ of linear combinations $t^{T} X$ of the components of $X$. Therefore, Lévy's continuity theorem implies that weak convergence of vectors is equivalent to weak convergence of linear combinations:

$$
X_{n} \rightsquigarrow X \quad \text { if and only if } \quad t^{T} X_{n} \rightsquigarrow t^{T} X \quad \text { for all } \quad t \in \mathbb{R}^{k} .
$$

This is known as the Cramér-Wold device. It allows to reduce higher-dimensional problems to the one-dimensional case.
2.18 Example (Multivariate central limit theorem). Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. random vectors in $\mathbb{R}^{k}$ with mean vector $\mu=\mathrm{E} Y_{1}$ and covariance matrix $\Sigma=\mathrm{E}\left(Y_{1}-\mu\right)\left(Y_{1}-\mu\right)^{T}$. Then

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(Y_{i}-\mu\right)=\sqrt{n}\left(\bar{Y}_{n}-\mu\right) \rightsquigarrow N_{k}(0, \Sigma) .
$$

(The sum is taken coordinatewise.) By the Cramér-Wold device, this can be proved by finding the limit distribution of the sequences of real variables

$$
t^{T}\left(\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(Y_{i}-\mu\right)\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(t^{T} Y_{i}-t^{T} \mu\right)
$$

Because the random variables $t^{T} Y_{1}-t^{T} \mu, t^{T} Y_{2}-t^{T} \mu, \ldots$ are i.i.d. with zero mean and variance $t^{T} \Sigma t$, this sequence is asymptotically $N_{1}\left(0, t^{T} \Sigma t\right)$-distributed by the univariate central limit theorem. This is exactly the distribution of $t^{T} X$ if $X$ possesses an $N_{k}(0, \Sigma)$ distribution.

## *2.4 Almost-Sure Representations

Convergence in distribution certainly does not imply convergence in probability or almost surely. However, the following theorem shows that a given sequence $X_{n} \rightsquigarrow X$ can always be replaced by a sequence $\tilde{X}_{n} \rightsquigarrow \tilde{X}$ that is, marginally, equal in distribution and converges almost surely. This construction is sometimes useful and has been put to good use by some authors, but we do not use it in this book.
2.19 Theorem (Almost-sure representations). Suppose that the sequence of random vectors $X_{n}$ converges in distribution to a random vector $X_{0}$. Then there exists a probability space $(\tilde{\Omega}, \tilde{\mathcal{U}}, \tilde{P})$ and random vectors $\tilde{X}_{n}$ defined on it such that $\tilde{X}_{n}$ is equal in distribution to $X_{n}$ for every $n \geq 0$ and $\tilde{X}_{n} \rightarrow \tilde{X}_{0}$ almost surely.

Proof. For random variables we can simply define $\tilde{X}_{n}=F_{n}^{-1}(U)$ for $F_{n}$ the distribution function of $X_{n}$ and $U$ an arbitrary random variable with the uniform distribution on $[0,1]$. (The "quantile transformation," see Section 21.1.) The simplest known construction for higher-dimensional vectors is more complicated. See, for example, Theorem 1.10.4 in [146], or [41].

## *2.5 Convergence of Moments

By the portmanteau lemma, weak convergence $X_{n} \leadsto X$ implies that $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for every continuous, bounded function $f$. The condition that $f$ be bounded is not superfluous: It is not difficult to find examples of a sequence $X_{n} \rightsquigarrow X$ and an unbounded, continuous function $f$ for which the convergence fails. In particular, in general convergence in distribution does not imply convergence $\mathrm{E} X_{n}^{p} \rightarrow \mathrm{E} X^{p}$ of moments. However, in many situations such convergence occurs, but it requires more effort to prove it.

A sequence of random variables $Y_{n}$ is called asymptotically uniformly integrable if

$$
\lim _{M \rightarrow \infty} \limsup _{n \rightarrow \infty} \mathrm{E}\left|Y_{n}\right| 1\left\{\left|Y_{n}\right|>M\right\}=0
$$

Uniform integrability is the missing link between convergence in distribution and convergence of moments.
2.20 Theorem. Let $f: \mathbb{R}^{k} \mapsto \mathbb{R}$ be measurable and continuous at every point in a set C. Let $X_{n} \leadsto X$ where $X$ takes its values in $C$. Then $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ if and only if the sequence of random variables $f\left(X_{n}\right)$ is asymptotically uniformly integrable.

Proof. We give the proof only in the most interesting direction. (See, for example, [146] (p. 69) for the other direction.) Suppose that $Y_{n}=f\left(X_{n}\right)$ is asymptotically uniformly integrable. Then we show that $\mathrm{E} Y_{n} \rightarrow \mathrm{E} Y$ for $Y=f(X)$. Assume without loss of generality that $Y_{n}$ is nonnegative; otherwise argue the positive and negative parts separately. By the continuous mapping theorem, $Y_{n} \rightsquigarrow Y$. By the triangle inequality,

$$
\left|\mathrm{E} Y_{n}-\mathrm{E} Y\right| \leq\left|\mathrm{E} Y_{n}-\mathrm{E} Y_{n} \wedge M\right|+\left|\mathrm{E} Y_{n} \wedge M-\mathrm{E} Y \wedge M\right|+|\mathrm{E} Y \wedge M-\mathrm{E} Y| .
$$

Because the function $y \mapsto y \wedge M$ is continuous and bounded on $[0, \infty)$, it follows that the middle term on the right converges to zero as $n \rightarrow \infty$. The first term is bounded above by
$\mathrm{E} Y_{n} 1\left\{Y_{n}>M\right\}$, and converges to zero as $n \rightarrow \infty$ followed by $M \rightarrow \infty$, by the uniform integrability. By the portmanteau lemma (iv), the third term is bounded by the lim inf as $n \rightarrow \infty$ of the first and hence converges to zero as $M \uparrow \infty$.
2.21 Example. Suppose $X_{n}$ is a sequence of random variables such that $X_{n} \leadsto X$ and $\lim \sup \mathrm{E}\left|X_{n}\right|^{p}<\infty$ for some $p$. Then all moments of order strictly less than $p$ converge also: $\mathrm{E} X_{n}^{k} \rightarrow \mathrm{E} X^{k}$ for every $k<p$.

By the preceding theorem, it suffices to prove that the sequence $X_{n}^{k}$ is asymptotically uniformly integrable. By Markov's inequality

$$
\mathrm{E}\left|X_{n}\right|^{k} 1\left\{\left|X_{n}\right|^{k} \geq M\right\} \leq M^{1-p / k} \mathrm{E}\left|X_{n}\right|^{p} .
$$

The limit superior, as $n \rightarrow \infty$ followed by $M \rightarrow \infty$, of the right side is zero if $k<p$.

The moment function $p \mapsto \mathrm{E} X^{p}$ can be considered a transform of probability distributions, just as can the characteristic function. In general, it is not a true transform in that it does determine a distribution uniquely only under additional assumptions. If a limit distribution is uniquely determined by its moments, this transform can still be used to establish weak convergence.
2.22 Theorem. Let $X_{n}$ and $X$ be random variables such that $\mathrm{E} X_{n}^{p} \rightarrow \mathrm{E} X^{p}<\infty$ for every $p \in \mathbb{N}$. If the distribution of $X$ is uniquely determined by its moments, then $X_{n} \leadsto X$.

Proof. Because $\mathrm{E} X_{n}^{2}=O(1)$, the sequence $X_{n}$ is uniformly tight, by Markov's inequality. By Prohorov's theorem, each subsequence has a further subsequence that converges weakly to a limit $Y$. By the preceding example the moments of $Y$ are the limits of the moments of the subsequence. Thus the moments of $Y$ are identical to the moments of $X$. Because, by assumption, there is only one distribution with this set of moments, $X$ and $Y$ are equal in distribution. Conclude that every subsequence of $X_{n}$ has a further subsequence that converges in distribution to $X$. This implies that the whole sequence converges to $X$.
2.23 Example. The normal distribution is uniquely determined by its moments. (See, for example, [123] or [133, p. 293].) Thus $\mathrm{E} X_{n}^{p} \rightarrow 0$ for odd $p$ and $\mathrm{E} X_{n}^{p} \rightarrow(p-1)(p-3) \cdots 1$ for even $p$ implies that $X_{n} \rightsquigarrow N(0,1)$. The converse is false.

## *2.6 Convergence-Determining Classes

A class $\mathcal{F}$ of functions $f: \mathbb{R}^{k} \rightarrow \mathbb{R}$ is called convergence-determining if for every sequence of random vectors $X_{n}$ the convergence $X_{n} \rightsquigarrow X$ is equivalent to $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for every $f \in \mathcal{F}$. By definition the set of all bounded continuous functions is convergencedetermining, but so is the smaller set of all differentiable functions, and many other classes. The set of all indicator functions $1_{(-\infty, t]}$ would be convergence-determining if we would restrict the definition to limits $X$ with continuous distribution functions. We shall have occasion to use the following results. (For proofs see Corollary 1.4.5 and Theorem 1.12.2, for example, in [146].)
2.24 Lemma. On $\mathbb{R}^{k}=\mathbb{R}^{l} \times \mathbb{R}^{m}$ the set of functions $(x, y) \mapsto f(x) g(y)$ with $f$ and $g$ ranging over all bounded, continuous functions on $\mathbb{R}^{l}$ and $\mathbb{R}^{m}$, respectively, is convergencedetermining.
2.25 Lemma. There exists a countable set of continuous functions $f: \mathbb{R}^{k} \mapsto[0,1]$ that is convergence-determining and, moreover, $X_{n} \rightsquigarrow X$ implies that $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ uniformly in $f \in \mathcal{F}$.

## *2.7 Law of the Iterated Logarithm

The law of the iterated logarithm is an intriguing result but appears to be of less interest to statisticians. It can be viewed as a refinement of the strong law of large numbers. If $Y_{1}, Y_{2}, \ldots$ are i.i.d. random variables with mean zero, then $Y_{1}+\cdots+Y_{n}=o(n)$ almost surely by the strong law. The law of the iterated logarithm improves this order to $O(\sqrt{n \log \log n})$, and even gives the proportionality constant.
2.26 Proposition (Law of the iterated logarithm). Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. random variables with mean zero and variance 1 . Then

$$
\limsup _{n \rightarrow \infty} \frac{Y_{1}+\cdots+Y_{n}}{\sqrt{n \log \log n}}=\sqrt{2}, \quad \text { a.s. }
$$

Conversely, if this statement holds for both $Y_{i}$ and $-Y_{i}$, then the variables have mean zero and variance 1.

The law of the iterated logarithm gives an interesting illustration of the difference between almost sure and distributional statements. Under the conditions of the proposition, the sequence $n^{-1 / 2}\left(Y_{1}+\cdots+Y_{n}\right)$ is asymptotically normally distributed by the central limit theorem. The limiting normal distribution is spread out over the whole real line. Apparently division by the factor $\sqrt{\log \log n}$ is exactly right to keep $n^{-1 / 2}\left(Y_{1}+\cdots+Y_{n}\right)$ within a compact interval, eventually.

A simple application of Slutsky's lemma gives

$$
Z_{n}:=\frac{Y_{1}+\cdots+Y_{n}}{\sqrt{n \log \log n}} \xrightarrow{\mathrm{P}} 0 .
$$

Thus $Z_{n}$ is with high probability contained in the interval $(-\varepsilon, \varepsilon)$ eventually, for any $\varepsilon>0$. This appears to contradict the law of the iterated logarithm, which asserts that $Z_{n}$ reaches the interval ( $\sqrt{2}-\varepsilon, \sqrt{2}+\varepsilon$ ) infinitely often with probability one. The explanation is that the set of $\omega$ such that $Z_{n}(\omega)$ is in $(-\varepsilon, \varepsilon)$ or $(\sqrt{2}-\varepsilon, \sqrt{2}+\varepsilon)$ fluctuates with $n$. The convergence in probability shows that at any advanced time a very large fraction of $\omega$ have $Z_{n}(\omega) \in(-\varepsilon, \varepsilon)$. The law of the iterated logarithm shows that for each particular $\omega$ the sequence $Z_{n}(\omega)$ drops in and out of the interval ( $\sqrt{2}-\varepsilon, \sqrt{2}+\varepsilon$ ) infinitely often (and hence out of $(-\varepsilon, \varepsilon))$.

The implications for statistics can be illustrated by considering confidence statements. If $\mu$ and 1 are the true mean and variance of the sample $Y_{1}, Y_{2}, \ldots$, then the probability that

$$
\bar{Y}_{n}-\frac{2}{\sqrt{n}} \leq \mu \leq \bar{Y}_{n}+\frac{2}{\sqrt{n}}
$$

converges to $\Phi(2)-\Phi(-2) \approx 95 \%$. Thus the given interval is an asymptotic confidence interval of level approximately $95 \%$. (The confidence level is exactly $\Phi(2)-\Phi(-2)$ if the observations are normally distributed. This may be assumed in the following; the accuracy of the approximation is not an issue in this discussion.) The point $\mu=0$ is contained in the interval if and only if the variable $Z_{n}$ satisfies

$$
\left|Z_{n}\right| \leq \frac{2}{\sqrt{\log \log n}}
$$

Assume that $\mu=0$ is the true value of the mean, and consider the following argument. By the law of the iterated logarithm, we can be sure that $Z_{n}$ hits the interval ( $\sqrt{2}-\varepsilon, \sqrt{2}+\varepsilon$ ) infinitely often. The expression $2 / \sqrt{\log \log n}$ is close to zero for large $n$. Thus we can be sure that the true value $\mu=0$ is outside the confidence interval infinitely often.

How can we solve the paradox that the usual confidence interval is wrong infinitely often? There appears to be a conceptual problem if it is imagined that a statistician collects data in a sequential manner, computing a confidence interval for every $n$. However, although the frequentist interpretation of a confidence interval is open to the usual criticism, the paradox does not seem to rise within the frequentist framework. In fact, from a frequentist point of view the curious conclusion is reasonable. Imagine 100 statisticians, all of whom set $95 \%$ confidence intervals in the usual manner. They all receive one observation per day and update their confidence intervals daily. Then every day about five of them should have a false interval. It is only fair that as the days go by all of them take turns in being unlucky, and that the same five do not have it wrong all the time. This, indeed, happens according to the law of the iterated logarithm.

The paradox may be partly caused by the feeling that with a growing number of observations, the confidence intervals should become better. In contrast, the usual approach leads to errors with certainty. However, this is only true if the usual approach is applied naively in a sequential set-up. In practice one would do a genuine sequential analysis (including the use of a stopping rule) or change the confidence level with $n$.

There is also another reason that the law of the iterated logarithm is of little practical consequence. The argument in the preceding paragraphs is based on the assumption that $2 / \sqrt{\log \log n}$ is close to zero and is nonsensical if this quantity is larger than $\sqrt{2}$. Thus the argument requires at least $n \geq 1619$, a respectable number of observations.

## *2.8 Lindeberg-Feller Theorem

Central limit theorems are theorems concerning convergence in distribution of sums of random variables. There are versions for dependent observations and nonnormal limit distributions. The Lindeberg-Feller theorem is the simplest extension of the classical central limit theorem and is applicable to independent observations with finite variances.

### 2.27 Proposition (Lindeberg-Feller central limit theorem). For each $n$ let $Y_{n, 1}, \ldots$,

$Y_{n, k_{n}}$ be independent random vectors with finite variances such that

$$
\begin{aligned}
\sum_{i=1}^{k_{n}} \mathrm{E}\left\|Y_{n, i}\right\|^{2} 1\left\{\left\|Y_{n, i}\right\|>\varepsilon\right\} & \rightarrow 0, \quad \text { every } \varepsilon>0 \\
\sum_{i=1}^{k_{n}} \operatorname{Cov} Y_{n, i} & \rightarrow \Sigma .
\end{aligned}
$$

Then the sequence $\sum_{i=1}^{k_{n}}\left(Y_{n, i}-\mathrm{E} Y_{n, i}\right)$ converges in distribution to a normal $N(0, \Sigma)$ distribution.

A result of this type is necessary to treat the asymptotics of, for instance, regression problems with fixed covariates. We illustrate this by the linear regression model. The application is straightforward but notationally a bit involved. Therefore, at other places in the manuscript we find it more convenient to assume that the covariates are a random sample, so that the ordinary central limit theorem applies.
2.28 Example (Linear regression). In the linear regression problem, we observe a vector $Y=X \beta+e$ for a known ( $n \times p$ ) matrix $X$ of full rank, and an (unobserved) error vector $e$ with i.i.d. components with mean zero and variance $\sigma^{2}$. The least squares estimator of $\beta$ is

$$
\hat{\beta}=\left(X^{T} X\right)^{-1} X^{T} Y .
$$

This estimator is unbiased and has covariance matrix $\sigma^{2}\left(X^{T} X\right)^{-1}$. If the error vector $e$ is normally distributed, then $\hat{\beta}$ is exactly normally distributed. Under reasonable conditions on the design matrix, the least squares estimator is asymptotically normally distributed for a large range of error distributions. Here we fix $p$ and let $n$ tend to infinity.

This follows from the representation

$$
\left(X^{T} X\right)^{1 / 2}(\hat{\beta}-\beta)=\left(X^{T} X\right)^{-1 / 2} X^{T} e=\sum_{i=1}^{n} a_{n i} e_{i}
$$

where $a_{n 1}, \ldots, a_{n n}$ are the columns of the $(p \times n)$ matrix $\left(X^{T} X\right)^{-1 / 2} X^{T}=: A$. This sequence is asymptotically normal if the vectors $a_{n 1} e_{1}, \ldots, a_{n n} e_{n}$ satisfy the Lindeberg conditions. The norming matrix $\left(X^{T} X\right)^{1 / 2}$ has been chosen to ensure that the vectors in the display have covariance matrix $\sigma^{2} I$ for every $n$. The remaining condition is

$$
\sum_{i=1}^{n}\left\|a_{n i}\right\|^{2} \mathrm{E} e_{i}^{2} 1\left\{\left\|a_{n i}\right\|\left|e_{i}\right|>\varepsilon\right\} \rightarrow 0
$$

This can be simplified to other conditions in several ways. Because $\sum\left\|a_{n i}\right\|^{2}=\operatorname{trace}\left(A A^{T}\right) =p$, it suffices that max $\mathrm{E} e_{i}^{2} 1\left\{\left\|a_{n i}\right\|\left|e_{i}\right|>\varepsilon\right\} \rightarrow 0$, which is equivalent to

$$
\max _{1 \leq i \leq n}\left\|a_{n i}\right\| \rightarrow 0 .
$$

Alternatively, the expectation $\mathrm{E} e^{2} 1\{a|e|>\varepsilon\}$ can be bounded by $\varepsilon^{-k} \mathrm{E}|e|^{k+2} a^{k}$ and a second set of sufficient conditions is

$$
\sum_{i=1}^{n}\left\|a_{n i}\right\|^{k} \rightarrow 0 ; \quad \mathrm{E}\left|e_{1}\right|^{k}<\infty, \quad(k>2) .
$$

Both sets of conditions are reasonable. Consider for instance the simple linear regression model $Y_{i}=\beta_{0}+\beta_{1} x_{i}+e_{i}$. Then

$$
\left(X^{T} X\right)^{-1 / 2} X^{T}=\frac{1}{\sqrt{n}}\left(\begin{array}{cc}
1 & \bar{x} \\
\bar{x} & \overline{x^{2}}
\end{array}\right)^{-1 / 2}\left(\begin{array}{cccc}
1 & 1 & \cdots & 1 \\
x_{1} & x_{2} & \cdots & x_{n}
\end{array}\right) .
$$

It is reasonable to assume that the sequences $\bar{x}$ and $\overline{x^{2}}$ are bounded. Then the first matrix
on the right behaves like a fixed matrix, and the conditions for asymptotic normality simplify to

$$
\max _{1 \leq i \leq n}\left|x_{i}\right|=o\left(n^{1 / 2}\right) ; \quad \text { or } \quad n^{1-k / 2} \overline{|x|^{k}} \rightarrow 0, \quad \mathrm{E}\left|e_{1}\right|^{k}<\infty
$$

Every reasonable design satisfies these conditions.

## *2.9 Convergence in Total Variation

A sequence of random variables converges in total variation to a variable $X$ if

$$
\sup _{B}\left|\mathrm{P}\left(X_{n} \in B\right)-\mathrm{P}(X \in B)\right| \rightarrow 0,
$$

where the supremum is taken over all measurable sets $B$. In view of the portmanteau lemma, this type of convergence is stronger than convergence in distribution. Not only is it required that the sequence $\mathrm{P}\left(X_{n} \in B\right)$ converges for every Borel set $B$, the convergence must also be uniform in $B$. Such strong convergence occurs less frequently and is often more than necessary, whence the concept is less useful.

A simple sufficient condition for convergence in total variation is pointwise convergence of densities. If $X_{n}$ and $X$ have densities $p_{n}$ and $p$ with respect to a measure $\mu$, then

$$
\sup _{B}\left|\mathrm{P}\left(X_{n} \in B\right)-\mathrm{P}(X \in B)\right|=\frac{1}{2} \int\left|p_{n}-p\right| d \mu .
$$

Thus, convergence in total variation can be established by convergence theorems for integrals from measure theory. The following proposition, which should be compared with the monotone and dominated convergence theorems, is most appropriate.
2.29 Proposition. Suppose that $f_{n}$ and $f$ are arbitrary measurable functions such that $f_{n} \rightarrow f \mu$-almost everywhere (or in $\mu$-measure) and $\limsup \int\left|f_{n}\right|^{p} d \mu \leq \int|f|^{p} d \mu< \infty$, for some $p \geq 1$ and measure $\mu$. Then $\int\left|f_{n}-f\right|^{p} d \mu \rightarrow 0$.

Proof. By the inequality $(a+b)^{p} \leq 2^{p} a^{p}+2^{p} b^{p}$, valid for every $a, b \geq 0$, and the assumption, $0 \leq 2^{p}\left|f_{n}\right|^{p}+2^{p}|f|^{p}-\left|f_{n}-f\right|^{p} \rightarrow 2^{p+1}|f|^{p}$ almost everywhere. By Fatou's lemma,

$$
\begin{aligned}
\int 2^{p+1}|f|^{p} d \mu & \leq \liminf \int\left(2^{p}\left|f_{n}\right|^{p}+2^{p}|f|^{p}-\left|f_{n}-f\right|^{p}\right) d \mu \\
& \leq 2^{p+1} \int|f|^{p} d \mu-\limsup \int\left|f_{n}-f\right|^{p} d \mu
\end{aligned}
$$

by assumption. The proposition follows.
2.30 Corollary (Scheffé). Let $X_{n}$ and $X$ be random vectors with densities $p_{n}$ and $p$ with respect to a measure $\mu$. If $p_{n} \rightarrow p \mu$-almost everywhere, then the sequence $X_{n}$ converges to $X$ in total variation.

The central limit theorem is usually formulated in terms of convergence in distribution. Often it is valid in terms of the total variation distance, in the sense that

$$
\sup _{B}\left|\mathrm{P}\left(Y_{1}+\cdots+Y_{n} \in B\right)-\int_{B} \frac{1}{\sqrt{n} \sigma \sqrt{2 \pi}} e^{-\frac{1}{2}(x-n \mu)^{2} / n \sigma^{2}} d x\right| \rightarrow 0 .
$$

Here $\mu$ and $\sigma^{2}$ are mean and variance of the $Y_{i}$, and the supremum is taken over all Borel sets. An integrable characteristic function, in addition to a finite second moment, suffices.
2.31 Theorem (Central limit theorem in total variation). Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. random variables with finite second moment and characteristic function $\phi$ such that $\int|\phi(t)|^{v} d t< \infty$ for some $v \geq 1$. Then $Y_{1}+\cdots+Y_{n}$ satisfies the central limit theorem in total variation.

Proof. It can be assumed without loss of generality that $\mathrm{E} Y_{1}=0$ and var $Y_{1}=1$. By the inversion formula for characteristic functions (see [47, p.509]), the density $p_{n}$ of $Y_{1}+\cdots+Y_{n} / \sqrt{n}$ can be written

$$
p_{n}(x)=\frac{1}{2 \pi} \int e^{-i t x} \phi\left(\frac{t}{\sqrt{n}}\right)^{n} d t
$$

By the central limit theorem and Lévy's continuity theorem, the integrand converges to $e^{-i t x} \exp \left(-\frac{1}{2} t^{2}\right)$. It will be shown that the integral converges to

$$
\frac{1}{2 \pi} \int e^{-i t x} e^{-\frac{1}{2} t^{2}} d t=\frac{e^{-\frac{1}{2} x^{2}}}{\sqrt{2 \pi}}
$$

Then an application of Scheffé's theorem concludes the proof.
The integral can be split into two parts. First, for every $\varepsilon>0$,

$$
\int_{|t|>\varepsilon \sqrt{n}}\left|e^{-i t x} \phi\left(\frac{t}{\sqrt{n}}\right)^{n}\right| d t \leq \sqrt{n} \sup _{|t|>\varepsilon}|\phi(t)|^{n-v} \int|\phi(t)|^{v} d t
$$

Here $\sup _{|t|>\varepsilon}|\phi(t)|<1$ by the Riemann-Lebesgue lemma and because $\phi$ is the characteristic function of a nonlattice distribution (e.g., [47, pp. 501, 513]). Thus, the first part of the integral converges to zero geometrically fast.

Second, a Taylor expansion yields that $\phi(t)=1-\frac{1}{2} t^{2}+o\left(t^{2}\right)$ as $t \rightarrow 0$, so that there exists $\varepsilon>0$ such that $|\phi(t)| \leq 1-t^{2} / 4$ for every $|t|<\varepsilon$. It follows that

$$
\left|e^{-i t x} \phi\left(\frac{t}{\sqrt{n}}\right)^{n}\right| 1\{|t| \leq \varepsilon \sqrt{n}\} \leq\left(1-\frac{t^{2}}{4 n}\right)^{n} \leq e^{-t^{2} / 4}
$$

The proof can be concluded by applying the dominated convergence theorem to the remaining part of the integral.

## Notes

The results of this chapter can be found in many introductions to probability theory. A standard reference for weak convergence theory is the first chapter of [11]. Another very readable introduction is [41]. The theory of this chapter is extended to random elements with values in general metric spaces in Chapter 18.

## PROBLEMS

1. If $X_{n}$ possesses a $t$-distribution with $n$ degrees of freedom, then $X_{n} \rightsquigarrow N(0,1)$ as $n \rightarrow \infty$. Show this.
2. Does it follow immediately from the result of the previous exercise that $\mathrm{E} X_{n}^{p} \rightarrow \mathrm{E} N(0,1)^{p}$ for every $p \in \mathbb{N}$ ? Is this true?
3. If $X_{n} \leadsto N(0,1)$ and $Y_{n} \xrightarrow{\mathrm{P}} \sigma$, then $X_{n} Y_{n} \leadsto N\left(0, \sigma^{2}\right)$. Show this.
4. In what sense is a chi-square distribution with $n$ degrees of freedom approximately a normal distribution?
5. Find an example of sequences such that $X_{n} \rightsquigarrow X$ and $Y_{n} \rightsquigarrow Y$, but the joint sequence ( $X_{n}, Y_{n}$ ) does not converge in law.
6. If $X_{n}$ and $Y_{n}$ are independent random vectors for every $n$, then $X_{n} \rightsquigarrow X$ and $Y_{n} \rightsquigarrow Y$ imply that $\left(X_{n}, Y_{n}\right) \rightsquigarrow(X, Y)$, where $X$ and $Y$ are independent. Show this.
7. If every $X_{n}$ and $X$ possess discrete distributions supported on the integers, then $X_{n} \rightsquigarrow X$ if and only if $\mathrm{P}\left(X_{n}=x\right) \rightarrow \mathrm{P}(X=x)$ for every integer $x$. Show this.
8. If $\mathrm{P}\left(X_{n}=i / n\right)=1 / n$ for every $i=1,2, \ldots, n$, then $X_{n} \rightsquigarrow X$, but there exist Borel sets with $\mathrm{P}\left(X_{n} \in B\right)=1$ for every $n$, but $\mathrm{P}(X \in B)=0$. Show this.
9. If $\mathrm{P}\left(X_{n}=x_{n}\right)=1$ for numbers $x_{n}$ and $x_{n} \rightarrow x$, then $X_{n} \rightsquigarrow x$. Prove this
(i) by considering distributions functions
(ii) by using Theorem 2.7.
10. State the rule $o_{P}(1)+O_{P}(1)=O_{P}(1)$ in terms of random vectors and show its validity.
11. In what sense is it true that $o_{P}(1)=O_{P}(1)$ ? Is it true that $O_{P}(1)=o_{P}(1)$ ?
12. The rules given by Lemma 2.12 are not simple plug-in rules.
(i) Give an example of a function $R$ with $R(h)=o(\|h\|)$ as $h \rightarrow 0$ and a sequence of random variables $X_{n}$ such that $R\left(X_{n}\right)$ is not equal to $o_{P}\left(X_{n}\right)$.
(ii) Given an example of a function $R$ such $R(h)=O(\|h\|)$ as $h \rightarrow 0$ and a sequence of random variables $X_{n}$ such that $X_{n}=O_{P}(1)$ but $R\left(X_{n}\right)$ is not equal to $O_{P}\left(X_{n}\right)$.
13. Find an example of a sequence of random variables such that $X_{n} \rightsquigarrow 0$, but $\mathrm{E} X_{n} \rightarrow \infty$.
14. Find an example of a sequence of random variables such that $X_{n} \xrightarrow{\mathrm{P}} 0$, but $X_{n}$ does not converge almost surely.
15. Let $X_{1}, \ldots, X_{n}$ be i.i.d. with density $f_{\lambda, a}(x)=\lambda e^{-\lambda(x-a)} 1\{x \geq a\}$. Calculate the maximum likelihood estimator of $\left(\hat{\lambda}_{n}, \hat{a}_{n}\right)$ of $(\lambda, a)$ and show that $\left(\hat{\lambda}_{n}, \hat{a}_{n}\right) \xrightarrow{\mathrm{P}}(\lambda, a)$.
16. Let $X_{1}, \ldots, X_{n}$ be i.i.d. standard normal variables. Show that the vector $U=\left(X_{1}, \ldots, X_{n}\right) / N$, where $N^{2}=\sum_{i=1}^{n} X_{i}^{2}$, is uniformly distributed over the unit sphere $S^{n-1}$ in $\mathbb{R}^{n}$, in the sense that $U$ and $O U$ are identically distributed for every orthogonal transformation $O$ of $\mathbb{R}^{n}$.
17. For each $n$, let $U_{n}$ be uniformly distributed over the unit sphere $S^{n-1}$ in $\mathbb{R}^{n}$. Show that the vectors $\sqrt{n}\left(U_{n, 1}, U_{n, 2}\right)$ converge in distribution to a pair of independent standard normal variables.
18. If $\sqrt{n}\left(T_{n}-\theta\right)$ converges in distribution, then $T_{n}$ converges in probability to $\theta$. Show this.
19. If $\mathrm{E} X_{n} \rightarrow \mu$ and $\operatorname{var} X_{n} \rightarrow 0$, then $X_{n} \xrightarrow{\mathrm{P}} \mu$. Show this.
20. If $\sum_{n=1}^{\infty} \mathrm{P}\left(\left|X_{n}\right|>\varepsilon\right)<\infty$ for every $\varepsilon>0$, then $X_{n}$ converges almost surely to zero. Show this.
21. Use characteristic functions to show that $\operatorname{binomial}(n, \lambda / n) \rightsquigarrow \operatorname{Poisson}(\lambda)$. Why does the central limit theorem not hold?
22. If $X_{1}, \ldots, X_{n}$ are i.i.d. standard Cauchy, then $\bar{X}_{n}$ is standard Cauchy.
(i) Show this by using characteristic functions
(ii) Why does the weak law not hold?
23. Let $X_{1}, \ldots, X_{n}$ be i.i.d. with finite fourth moment. Find constants $a, b$, and $c_{n}$ such that the sequence $c_{n}\left(\bar{X}_{n}-a, \overline{X_{n}^{2}}-b\right)$ converges in distribution, and determine the limit law. Here $\bar{X}_{n}$ and $\overline{X_{n}^{2}}$ are the averages of the $X_{i}$ and the $X_{i}^{2}$, respectively.

## 3

## Delta Method

> The delta method consists of using a Taylor expansion to approximate a random vector of the form $\phi\left(T_{n}\right)$ by the polynomial $\phi(\theta)+\phi^{\prime}(\theta)\left(T_{n}-\right. \theta)+\cdots$ in $T_{n}-\theta$. It is a simple but useful method to deduce the limit law of $\phi\left(T_{n}\right)-\phi(\theta)$ from that of $T_{n}-\theta$. Applications include the nonrobustness of the chi-square test for normal variances and variance stabilizing transformations.

### 3.1 Basic Result

Suppose an estimator $T_{n}$ for a parameter $\theta$ is available, but the quantity of interest is $\phi(\theta)$ for some known function $\phi$. A natural estimator is $\phi\left(T_{n}\right)$. How do the asymptotic properties of $\phi\left(T_{n}\right)$ follow from those of $T_{n}$ ?

A first result is an immediate consequence of the continuous-mapping theorem. If the sequence $T_{n}$ converges in probability to $\theta$ and $\phi$ is continuous at $\theta$, then $\phi\left(T_{n}\right)$ converges in probability to $\phi(\theta)$.

Of greater interest is a similar question concerning limit distributions. In particular, if $\sqrt{n}\left(T_{n}-\theta\right)$ converges weakly to a limit distribution, is the same true for $\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$ ? If $\phi$ is differentiable, then the answer is affirmative. Informally, we have

$$
\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right) \approx \phi^{\prime}(\theta) \sqrt{n}\left(T_{n}-\theta\right) .
$$

If $\sqrt{n}\left(T_{n}-\theta\right) \rightsquigarrow T$ for some variable $T$, then we expect that $\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi^{\prime}(\theta) T$. In particular, if $\sqrt{n}\left(T_{n}-\theta\right)$ is asymptotically normal $N\left(0, \sigma^{2}\right)$, then we expect that $\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$ is asymptotically normal $N\left(0, \phi^{\prime}(\theta)^{2} \sigma^{2}\right)$. This is proved in greater generality in the following theorem.

In the preceding paragraph it is silently understood that $T_{n}$ is real-valued, but we are more interested in considering statistics $\phi\left(T_{n}\right)$ that are formed out of several more basic statistics. Consider the situation that $T_{n}=\left(T_{n, 1}, \ldots, T_{n, k}\right)$ is vector-valued, and that $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ is a given function defined at least on a neighbourhood of $\theta$. Recall that $\phi$ is differentiable at $\theta$ if there exists a linear map (matrix) $\phi_{\theta}^{\prime}: \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ such that

$$
\phi(\theta+h)-\phi(\theta)=\phi_{\theta}^{\prime}(h)+o(\|h\|), \quad h \rightarrow 0 .
$$

All the expressions in this equation are vectors of length $m$, and $\|h\|$ is the Euclidean norm. The linear map $h \mapsto \phi_{\theta}^{\prime}(h)$ is sometimes called a "total derivative," as opposed to
partial derivatives. A sufficient condition for $\phi$ to be (totally) differentiable is that all partial derivatives $\partial \phi_{j}(x) / \partial x_{i}$ exist for $x$ in a neighborhood of $\theta$ and are continuous at $\theta$. (Just existence of the partial derivatives is not enough.) In any case, the total derivative is found from the partial derivatives. If $\phi$ is differentiable, then it is partially differentiable, and the derivative map $h \mapsto \phi_{\theta}^{\prime}(h)$ is matrix multiplication by the matrix

$$
\phi_{\theta}^{\prime}=\left(\begin{array}{ccc}
\frac{\partial \phi_{1}}{\partial x_{1}}(\theta) & \cdots & \frac{\partial \phi_{1}}{\partial x_{k}}(\theta) \\
\vdots & & \vdots \\
\frac{\partial \phi_{m}}{\partial x_{1}}(\theta) & \cdots & \frac{\partial \phi_{m}}{\partial x_{k}}(\theta)
\end{array}\right) .
$$

If the dependence of the derivative $\phi_{\theta}^{\prime}$ on $\theta$ is continuous, then $\phi$ is called continuously differentiable.

It is better to think of a derivative as a linear approximation $h \mapsto \phi_{\theta}^{\prime}(h)$ to the function $h \mapsto \phi(\theta+h)-\phi(\theta)$ than as a set of partial derivatives. Thus the derivative at a point $\theta$ is a linear map. If the range space of $\phi$ is the real line (so that the derivative is a horizontal vector), then the derivative is also called the gradient of the function.

Note that what is usually called the derivative of a function $\phi: \mathbb{R} \mapsto \mathbb{R}$ does not completely correspond to the present derivative. The derivative at a point, usually written $\phi^{\prime}(\theta)$, is written here as $\phi_{\theta}^{\prime}$. Although $\phi^{\prime}(\theta)$ is a number, the second object $\phi_{\theta}^{\prime}$ is identified with the map $h \mapsto \phi_{\theta}^{\prime}(h)=\phi^{\prime}(\theta) h$. Thus in the present terminology the usual derivative function $\theta \mapsto \phi^{\prime}(\theta)$ is a map from $\mathbb{R}$ into the set of linear maps from $\mathbb{R} \mapsto \mathbb{R}$, not a map from $\mathbb{R} \mapsto \mathbb{R}$. Graphically the "affine" approximation $h \mapsto \phi(\theta)+\phi_{\theta}^{\prime}(h)$ is the tangent to the function $\phi$ at $\theta$.
3.1 Theorem. Let $\phi$ : $\mathbb{D}_{\phi} \subset \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ be a map defined on a subset of $\mathbb{R}^{k}$ and differentiable at $\theta$. Let $T_{n}$ be random vectors taking their values in the domain of $\phi$. If $r_{n}\left(T_{n}-\theta\right) \rightsquigarrow T$ for numbers $r_{n} \rightarrow \infty$, then $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$. Moreover, the difference between $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$ and $\phi_{\theta}^{\prime}\left(r_{n}\left(T_{n}-\theta\right)\right)$ converges to zero in probability.

Proof. Because the sequence $r_{n}\left(T_{n}-\theta\right)$ converges in distribution, it is uniformly tight and $T_{n}-\theta$ converges to zero in probability. By the differentiability of $\phi$ the remainder function $R(h)=\phi(\theta+h)-\phi(\theta)-\phi_{\theta}^{\prime}(h)$ satisfies $R(h)=o(\|h\|)$ as $h \rightarrow 0$. Lemma 2.12 allows to replace the fixed $h$ by a random sequence and gives

$$
\phi\left(T_{n}\right)-\phi(\theta)-\phi_{\theta}^{\prime}\left(T_{n}-\theta\right) \equiv R\left(T_{n}-\theta\right)=o_{P}\left(\left\|T_{n}-\theta\right\|\right) .
$$

Multiply this left and right with $r_{n}$, and note that $o_{P}\left(r_{n}\left\|T_{n}-\theta\right\|\right)=o_{P}(1)$ by tightness of the sequence $r_{n}\left(T_{n}-\theta\right)$. This yields the last statement of the theorem. Because matrix multiplication is continuous, $\phi_{\theta}^{\prime}\left(r_{n}\left(T_{n}-\theta\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$ by the continuous-mapping theorem. Apply Slutsky's lemma to conclude that the sequence $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$ has the same weak limit.

A common situation is that $\sqrt{n}\left(T_{n}-\theta\right)$ converges to a multivariate normal distribution $N_{k}(\mu, \Sigma)$. Then the conclusion of the theorem is that the sequence $\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$ converges in law to the $N_{m}\left(\phi_{\theta}^{\prime} \mu, \phi_{\theta}^{\prime} \Sigma\left(\phi_{\theta}^{\prime}\right)^{T}\right)$ distribution.
3.2 Example (Sample variance). The sample variance of $n$ observations $X_{1}, \ldots, X_{n}$ is defined as $S^{2}=n^{-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2}$ and can be written as $\phi\left(\bar{X}, \overline{X^{2}}\right)$ for the function
$\phi(x, y)=y-x^{2}$. (For simplicity of notation, we divide by $n$ rather than $n-1$.) Suppose that $S^{2}$ is based on a sample from a distribution with finite first to fourth moments $\alpha_{1}, \alpha_{2}, \alpha_{3}, \alpha_{4}$. By the multivariate central limit theorem,

$$
\sqrt{n}\left(\left(\frac{\bar{X}}{X^{2}}\right)-\binom{\alpha_{1}}{\alpha_{2}}\right) \rightsquigarrow N_{2}\left(\binom{0}{0},\left(\begin{array}{cc}
\alpha_{2}-\alpha_{1}^{2} & \alpha_{3}-\alpha_{1} \alpha_{2} \\
\alpha_{3}-\alpha_{1} \alpha_{2} & \alpha_{4}-\alpha_{2}^{2}
\end{array}\right)\right) .
$$

The map $\phi$ is differentiable at the point $\theta=\left(\alpha_{1}, \alpha_{2}\right)^{T}$, with derivative $\phi_{\left(\alpha_{1}, \alpha_{2}\right)}^{\prime}=\left(-2 \alpha_{1}, 1\right)$. Thus if the vector $\left(T_{1}, T_{2}\right)^{\prime}$ possesses the normal distribution in the last display, then

$$
\sqrt{n}\left(\phi\left(\bar{X}, \overline{X^{2}}\right)-\phi\left(\alpha_{1}, \alpha_{2}\right)\right) \rightsquigarrow-2 \alpha_{1} T_{1}+T_{2} .
$$

The latter variable is normally distributed with zero mean and a variance that can be expressed in $\alpha_{1}, \ldots, \alpha_{4}$. In case $\alpha_{1}=0$, this variance is simply $\alpha_{4}-\alpha_{2}^{2}$. The general case can be reduced to this case, because $S^{2}$ does not change if the observations $X_{i}$ are replaced by the centered variables $Y_{i}=X_{i}-\alpha_{1}$. Write $\mu_{k}=\mathrm{E} Y_{i}^{k}$ for the central moments of the $X_{i}$. Noting that $S^{2}=\phi\left(\bar{Y}, \overline{Y^{2}}\right)$ and that $\phi\left(\mu_{1}, \mu_{2}\right)=\mu_{2}$ is the variance of the original observations, we obtain

$$
\sqrt{n}\left(S^{2}-\mu_{2}\right) \rightsquigarrow N\left(0, \mu_{4}-\mu_{2}^{2}\right) .
$$

In view of Slutsky's lemma, the same result is valid for the unbiased version $n /(n-1) S^{2}$ of the sample variance, because $\sqrt{n}(n /(n-1)-1) \rightarrow 0$.
3.3 Example (Level of the chi-square test). As an application of the preceding example, consider the chi-square test for testing variance. Normal theory prescribes to reject the null hypothesis $H_{0}: \mu_{2} \leq 1$ for values of $n S^{2}$ exceeding the upper $\alpha$ point $\chi_{n, \alpha}^{2}$ of the $\chi_{n-1}^{2}$ distribution. If the observations are sampled from a normal distribution, then the test has exactly level $\alpha$. Is this still approximately the case if the underlying distribution is not normal? Unfortunately, the answer is negative.

For large values of $n$, this can be seen with the help of the preceding result. The central limit theorem and the preceding example yield the two statements

$$
\frac{\chi_{n-1}^{2}-(n-1)}{\sqrt{2 n-2}} \leadsto N(0,1), \quad \sqrt{n}\left(\frac{S^{2}}{\mu_{2}}-1\right) \rightsquigarrow N(0, \kappa+2),
$$

where $\kappa=\mu_{4} / \mu_{2}^{2}-3$ is the kurtosis of the underlying distribution. The first statement implies that $\left(\chi_{n, \alpha}^{2}-(n-1)\right) / \sqrt{2 n-2)}$ converges to the upper $\alpha$ point $z_{\alpha}$ of the standard normal distribution. Thus the level of the chi-square test satisfies

$$
\mathrm{P}_{\mu_{2}=1}\left(n S^{2}>\chi_{n, \alpha}^{2}\right)=\mathrm{P}\left(\sqrt{n}\left(\frac{S^{2}}{\mu_{2}}-1\right)>\frac{\chi_{n, \alpha}^{2}-n}{\sqrt{n}}\right) \rightarrow 1-\Phi\left(\frac{z_{\alpha} \sqrt{2}}{\sqrt{\kappa+2}}\right) .
$$

The asymptotic level reduces to $1-\Phi\left(\boldsymbol{z}_{\alpha}\right)=\alpha$ if and only if the kurtosis of the underlying distribution is 0 . This is the case for normal distributions. On the other hand, heavy-tailed distributions have a much larger kurtosis. If the kurtosis of the underlying distribution is "close to" infinity, then the asymptotic level is close to $1-\Phi(0)=1 / 2$. We conclude that the level of the chi-square test is nonrobust against departures of normality that affect the value of the kurtosis. At least this is true if the critical values of the test are taken from the chi-square distribution with $(n-1)$ degrees of freedom. If, instead, we would use a

Table 3.1. Level of the test that rejects if $n S^{2} / \mu_{2}$ exceeds the 0.95 quantile of the $\chi_{19}^{2}$ distribution.
| Law | Level |
| :--- | :---: |
| Laplace | 0.12 |
| $0.95 N(0,1)+0.05 N(0,9)$ | 0.12 |


Note: Approximations based on simulation of 10,000 samples.
normal approximation to the distribution of $\sqrt{n}\left(S^{2} / \mu_{2}-1\right)$ the problem would not arise, provided the asymptotic variance $\kappa+2$ is estimated accurately. Table 3.1 gives the level for two distributions with slightly heavier tails than the normal distribution. $\square$

In the preceding example the asymptotic distribution of $\sqrt{n}\left(S^{2}-\sigma^{2}\right)$ was obtained by the delta method. Actually, it can also and more easily be derived by a direct expansion. Write

$$
\sqrt{n}\left(S^{2}-\sigma^{2}\right)=\sqrt{n}\left(\frac{1}{n} \sum_{i=1}^{n}\left(X_{i}-\mu\right)^{2}-\sigma^{2}\right)-\sqrt{n}(\bar{X}-\mu)^{2} .
$$

The second term converges to zero in probability; the first term is asymptotically normal by the central limit theorem. The whole expression is asymptotically normal by Slutsky's lemma.

Thus it is not always a good idea to apply general theorems. However, in many examples the delta method is a good way to package the mechanics of Taylor expansions in a transparent way.
3.4 Example. Consider the joint limit distribution of the sample variance $S^{2}$ and the $t$-statistic $\bar{X} / S$. Again for the limit distribution it does not make a difference whether we use a factor $n$ or $n-1$ to standardize $S^{2}$. For simplicity we use $n$. Then ( $S^{2}, \bar{X} / S$ ) can be written as $\phi\left(\bar{X}, \overline{X^{2}}\right)$ for the map $\phi: \mathbb{R}^{2} \mapsto \mathbb{R}^{2}$ given by

$$
\phi(x, y)=\left(y-x^{2}, \frac{x}{\left(y-x^{2}\right)^{1 / 2}}\right) .
$$

The joint limit distribution of $\sqrt{n}\left(\bar{X}-\alpha_{1}, \overline{X^{2}}-\alpha_{2}\right)$ is derived in the preceding example. The map $\phi$ is differentiable at $\theta=\left(\alpha_{1}, \alpha_{2}\right)$ provided $\sigma^{2}=\alpha_{2}-\alpha_{1}^{2}$ is positive, with derivative

$$
\phi_{\left(\alpha_{1}, \alpha_{2}\right)}^{\prime}=\left(\begin{array}{cc}
-2 \alpha_{1} & 1 \\
\frac{\alpha_{1}^{2}}{\left(\alpha_{2}-\alpha_{1}^{2}\right)^{3 / 2}}+\frac{1}{\left(\alpha_{2}-\alpha_{1}^{2}\right)^{1 / 2}} & \frac{-\alpha_{1}}{2\left(\alpha_{2}-\alpha_{1}^{2}\right)^{3 / 2}}
\end{array}\right) .
$$

It follows that the sequence $\sqrt{n}\left(S^{2}-\sigma^{2}, \bar{X} / S-\alpha_{1} / \sigma\right)$ is asymptotically bivariate normally distributed, with zero mean and covariance matrix,

$$
\phi_{\left(\alpha_{1}, \alpha_{2}\right)}^{\prime}\left(\begin{array}{cc}
\alpha_{2}-\alpha_{1}^{2} & \alpha_{3}-\alpha_{1} \alpha_{2} \\
\alpha_{3}-\alpha_{1} \alpha_{2} & \alpha_{4}-\alpha_{2}^{2}
\end{array}\right)\left(\phi_{\left(\alpha_{1}, \alpha_{2}\right)}^{\prime}\right)^{T} .
$$

It is easy but uninteresting to compute this explicitly. $\square$
3.5 Example (Skewness). The sample skewness of a sample $X_{1}, \ldots, X_{n}$ is defined as

$$
l_{n}=\frac{n^{-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{3}}{\left(n^{-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2}\right)^{3 / 2}}
$$

Not surprisingly it converges in probability to the skewness of the underlying distribution, defined as the quotient $\lambda=\mu_{3} / \sigma^{3}$ of the third central moment and the third power of the standard deviation of one observation. The skewness of a symmetric distribution, such as the normal distribution, equals zero, and the sample skewness may be used to test this aspect of normality of the underlying distribution. For large samples a critical value may be determined from the normal approximation for the sample skewness.

The sample skewness can be written as $\phi\left(\bar{X}, \overline{X^{2}}, \overline{X^{3}}\right)$ for the function $\phi$ given by

$$
\phi(a, b, c)=\frac{c-3 a b+2 a^{3}}{\left(b-a^{2}\right)^{3 / 2}}
$$

The sequence $\sqrt{n}\left(\bar{X}-\alpha_{1}, \overline{X^{2}}-\alpha_{2}, \overline{X^{3}}-\alpha_{3}\right)$ is asymptotically mean-zero normal by the central limit theorem, provided $\mathrm{E} X_{1}^{6}$ is finite. The value $\phi\left(\alpha_{1}, \alpha_{2}, \alpha_{3}\right)$ is exactly the population skewness. The function $\phi$ is differentiable at the point $\left(\alpha_{1}, \alpha_{2}, \alpha_{3}\right)$ and application of the delta method is straightforward. We can save work by noting that the sample skewness is location and scale invariant. With $Y_{i}=\left(X_{i}-\alpha_{1}\right) / \sigma$, the skewness can also be written as $\phi\left(\bar{Y}, \overline{Y^{2}}, \overline{Y^{3}}\right)$. With $\lambda=\mu_{3} / \sigma^{3}$ denoting the skewness of the underlying distribution, the $Y$ s satisfy

$$
\sqrt{n}\left(\begin{array}{c}
\bar{Y} \\
\overline{Y^{2}}-1 \\
\overline{Y^{3}}-\lambda
\end{array}\right) \rightsquigarrow N\left(0,\left(\begin{array}{ccc}
1 & \lambda & \kappa+3 \\
\lambda & \kappa+2 & \mu_{5} / \sigma^{5}-\lambda \\
\kappa+3 & \mu_{5} / \sigma^{5}-\lambda & \mu_{6} / \sigma^{6}-\lambda^{2}
\end{array}\right)\right) .
$$

The derivative of $\phi$ at the point $(0,1, \lambda)$ equals $(-3,-3 \lambda / 2,1)$. Hence, if $T$ possesses the normal distribution in the display, then $\sqrt{n}\left(l_{n}-\lambda\right)$ is asymptotically normal distributed with mean zero and variance equal to $\operatorname{var}\left(-3 T_{1}-3 \lambda T_{2} / 2+T_{3}\right)$. If the underlying distribution is normal, then $\lambda=\mu_{5}=0, \kappa=0$ and $\mu_{6} / \sigma^{6}=15$. In that case the sample skewness is asymptotically $N(0,6)$-distributed.

An approximate level $\alpha$ test for normality based on the sample skewness could be to reject normality if $\sqrt{n}\left|l_{n}\right|>\sqrt{6} z_{\alpha / 2}$. Table 3.2 gives the level of this test for different values of $n$.

Table 3.2. Level of the test that rejects if $\sqrt{n}\left|l_{n}\right| / \sqrt{6}$ exceeds the 0.975 quantile of the normal distribution, in the case that the observations are normally distributed.
| $n$ | Level |
| :--- | :---: |
| 10 | 0.02 |
| 20 | 0.03 |
| 30 | 0.03 |
| 50 | 0.05 |


Note: Approximations based on simulation of 10,000 samples.

### 3.2 Variance-Stabilizing Transformations

Given a sequence of statistics $T_{n}$ with $\sqrt{n}\left(T_{n}-\theta\right) \stackrel{\theta}{\rightsquigarrow} N\left(0, \sigma^{2}(\theta)\right)$ for a range of values of $\theta$, asymptotic confidence intervals for $\theta$ are given by

$$
\left(T_{n}-\boldsymbol{z}_{\alpha} \frac{\sigma(\theta)}{\sqrt{n}}, T_{n}+\boldsymbol{z}_{\alpha} \frac{\sigma(\theta)}{\sqrt{n}}\right) .
$$

These are asymptotically of level $1-2 \alpha$ in that the probability that $\theta$ is covered by the interval converges to $1-2 \alpha$ for every $\theta$. Unfortunately, as stated previously, these intervals are useless, because of their dependence on the unknown $\theta$. One solution is to replace the unknown standard deviations $\sigma(\theta)$ by estimators. If the sequence of estimators is chosen consistent, then the resulting confidence interval still has asymptotic level $1-2 \alpha$. Another approach is to use a variance-stabilizing transformation, which often leads to a better approximation.

The idea is that no problem arises if the asymptotic variances $\sigma^{2}(\theta)$ are independent of $\theta$. Although this fortunate situation is rare, it is often possible to transform the parameter into a different parameter $\eta=\phi(\theta)$, for which this idea can be applied. The natural estimator for $\eta$ is $\phi\left(T_{n}\right)$. If $\phi$ is differentiable, then

$$
\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right) \stackrel{\theta}{\leadsto} N\left(0, \phi^{\prime}(\theta)^{2} \sigma^{2}(\theta)\right) .
$$

For $\phi$ chosen such that $\phi^{\prime}(\theta) \sigma(\theta) \equiv 1$, the asymptotic variance is constant and finding an asymptotic confidence interval for $\eta=\phi(\theta)$ is easy. The solution

$$
\phi(\theta)=\int \frac{1}{\sigma(\theta)} d \theta
$$

is a variance-stabililizing transformation. variance stabililizing transformation. If it is well defined, then it is automatically monotone, so that a confidence interval for $\eta$ can be transformed back into a confidence interval for $\theta$.
3.6 Example (Correlation). Let $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ be a sample from a bivariate normal distribution with correlation coefficient $\rho$. The sample correlation coefficient is defined as

$$
r_{n}=\frac{\sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)\left(Y_{i}-\bar{Y}\right)}{\left\{\sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2} \sum\left(Y_{i}-\bar{Y}\right)^{2}\right\}^{1 / 2}}
$$

With the help of the delta method, it is possible to derive that $\sqrt{n}(r-\rho)$ is asymptotically zero-mean normal, with variance depending on the (mixed) third and fourth moments of $(X, Y)$. This is true for general underlying distributions, provided the fourth moments exist. Under the normality assumption the asymptotic variance can be expressed in the correlation of $X$ and $Y$. Tedious algebra gives

$$
\sqrt{n}\left(r_{n}-\rho\right) \rightsquigarrow N\left(0,\left(1-\rho^{2}\right)^{2}\right) .
$$

It does not work very well to base an asymptotic confidence interval directly on this result.

Table 3.3. Coverage probability of the asymptotic $95 \%$ confidence interval for the correlation coefficient, for two values of $n$ and five different values of the true correlation $\rho$.
| $n$ | $\rho=0$ | $\rho=0.2$ | $\rho=0.4$ | $\rho=0.6$ | $\rho=0.8$ |
| :---: | :---: | :---: | :---: | :---: | :---: |
| 15 | 0.92 | 0.92 | 0.92 | 0.93 | 0.92 |
| 25 | 0.93 | 0.94 | 0.94 | 0.94 | 0.94 |


Note: Approximations based on simulation of 10,000 samples.

![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-048.jpg?height=1675&width=3432&top_left_y=2439&top_left_x=1153)
Figure 3.1. Histogram of 1000 sample correlation coefficients, based on 1000 independent samples of the the bivariate normal distribution with correlation 0.6, and histogram of the arctanh of these values.

The transformation

$$
\phi(\rho)=\int \frac{1}{1-\rho^{2}} d \rho=\frac{1}{2} \log \frac{1+\rho}{1-\rho}=\operatorname{arctanh} \rho
$$

is variance stabilizing. Thus, the sequence $\sqrt{n}(\operatorname{arctanh} r-\operatorname{arctanh} \rho)$ converges to a standard normal distribution for every $\rho$. This leads to the asymptotic confidence interval for the correlation coefficient $\rho$ given by

$$
\left(\tanh \left(\operatorname{arctanh} r-\boldsymbol{z}_{\alpha} / \sqrt{n}\right), \tanh \left(\operatorname{arctanh} r+\boldsymbol{z}_{\alpha} / \sqrt{n}\right)\right) .
$$

Table 3.3 gives an indication of the accuracy of this interval. Besides stabilizing the variance the arctanh transformation has the benefit of symmetrizing the distribution of the sample correlation coefficient (which is perhaps of greater importance), as can be seen in Figure 5.3. $\square$

## *3.3 Higher-Order Expansions

To package a simple idea in a theorem has the danger of obscuring the idea. The delta method is based on a Taylor expansion of order one. Sometimes a problem cannot be exactly forced into the framework described by the theorem, but the principle of a Taylor expansion is still valid.

In the one-dimensional case, a Taylor expansion applied to a statistic $T_{n}$ has the form

$$
\phi\left(T_{n}\right)=\phi(\theta)+\left(T_{n}-\theta\right) \phi^{\prime}(\theta)+\frac{1}{2}\left(T_{n}-\theta\right)^{2} \phi^{\prime \prime}(\theta)+\cdots
$$

Usually the linear term ( $\left.T_{n}-\theta\right) \phi^{\prime}(\theta)$ is of higher order than the remainder, and thus determines the order at which $\phi\left(T_{n}\right)-\phi(\theta)$ converges to zero: the same order as $T_{n}-\theta$. Then the approach of the preceding section gives the limit distribution of $\phi\left(T_{n}\right)-\phi(\theta)$. If $\phi^{\prime}(\theta)=0$, this approach is still valid but not of much interest, because the resulting limit distribution is degenerate at zero. Then it is more informative to multiply the difference $\phi\left(T_{n}\right)-\phi(\theta)$ by a higher rate and obtain a nondegenerate limit distribution. Looking at the Taylor expansion, we see that the linear term disappears if $\phi^{\prime}(\theta)=0$, and we expect that the quadratic term determines the limit behavior of $\phi\left(T_{n}\right)$.
3.7 Example. Suppose that $\sqrt{n} \bar{X}$ converges weakly to a standard normal distribution. Because the derivative of $x \mapsto \cos x$ is zero at $x=0$, the standard delta method of the preceding section yields that $\sqrt{n}(\cos \bar{X}-\cos 0)$ converges weakly to 0 . It should be concluded that $\sqrt{n}$ is not the right norming rate for the random sequence $\cos \bar{X}-1$. A more informative statement is that $-2 n(\cos \bar{X}-1)$ converges in distribution to a chi-square distribution with one degree of freedom. The explanation is that

$$
\cos \bar{X}-\cos 0=(\bar{X}-0) 0+\frac{1}{2}(\bar{X}-0)^{2}(\cos x)_{\mid x=0}^{\prime \prime}+\cdots
$$

That the remainder term is negligible after multiplication with $n$ can be shown along the same lines as the proof of Theorem 3.1. The sequence $n \bar{X}^{2}$ converges in law to a $\chi_{1}^{2}$ distribution by the continuous-mapping theorem; the sequence $-2 n(\cos \bar{X}-1)$ has the same limit, by Slutsky's lemma.

A more complicated situation arises if the statistic $T_{n}$ is higher-dimensional with coordinates of different orders of magnitude. For instance, for a real-valued function $\phi$,

$$
\begin{aligned}
\phi\left(T_{n}\right)-\phi(\theta)= & \sum_{i=1}^{k} \frac{\partial \phi}{\partial x_{i}}(\theta)\left(T_{n, i}-\theta_{i}\right) \\
& +\frac{1}{2} \sum_{i=1}^{k} \sum_{j=1}^{k} \frac{\partial^{2} \phi}{\partial x_{i} \partial x_{j}}(\theta)\left(T_{n, i}-\theta_{i}\right)\left(T_{n, j}-\theta_{j}\right)+\cdots
\end{aligned}
$$

If the sequences $T_{n, i}-\theta_{i}$ are of different order, then it may happen, for instance, that the linear part involving $T_{n, i}-\theta_{i}$ is of the same order as the quadratic part involving $\left(T_{n, j}-\theta_{j}\right)^{2}$. Thus, it is necessary to determine carefully the rate of all terms in the expansion, and to rearrange these in decreasing order of magnitude, before neglecting the "remainder."

## *3.4 Uniform Delta Method

Sometimes we wish to prove the asymptotic normality of a sequence $\sqrt{n}\left(\phi\left(T_{n}\right)-\phi\left(\theta_{n}\right)\right)$ for centering vectors $\theta_{n}$ changing with $n$, rather than a fixed vector. If $\sqrt{n}\left(\theta_{n}-\theta\right) \rightarrow h$ for certain vectors $\theta$ and $h$, then this can be handled easily by decomposing

$$
\sqrt{n}\left(\phi\left(T_{n}\right)-\phi\left(\theta_{n}\right)\right)=\sqrt{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)-\sqrt{n}\left(\phi\left(\theta_{n}\right)-\phi(\theta)\right) .
$$

Several applications of Slutsky's lemma and the delta method yield as limit in law the vector $\phi_{\theta}^{\prime}(T+h)-\phi_{\theta}^{\prime}(h)=\phi_{\theta}^{\prime}(T)$, if $T$ is the limit in distribution of $\sqrt{n}\left(T_{n}-\theta_{n}\right)$. For $\theta_{n} \rightarrow \theta$ at a slower rate, this argument does not work. However, the same result is true under a slightly stronger differentiability assumption on $\phi$.
3.8 Theorem. Let $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ be a map defined and continuously differentiable in a neighborhood of $\theta$. Let $T_{n}$ be random vectors taking their values in the domain of $\phi$. If $r_{n}\left(T_{n}-\theta_{n}\right) \rightsquigarrow T$ for vectors $\theta_{n} \rightarrow \theta$ and numbers $r_{n} \rightarrow \infty$, then $r_{n}\left(\phi\left(T_{n}\right)-\right. \left.\phi\left(\theta_{n}\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$. Moreover, the difference between $r_{n}\left(\phi\left(T_{n}\right)-\phi\left(\theta_{n}\right)\right)$ and $\phi_{\theta}^{\prime}\left(r_{n}\left(T_{n}-\theta_{n}\right)\right)$ converges to zero in probability.

Proof. It suffices to prove the last assertion. Because convergence in probability to zero of vectors is equivalent to convergence to zero of the components separately, it is no loss of generality to assume that $\phi$ is real-valued. For $0 \leq t \leq 1$ and fixed $h$, define $g_{n}(t)= \phi\left(\theta_{n}+t h\right)$. For sufficiently large $n$ and sufficiently small $h$, both $\theta_{n}$ and $\theta_{n}+h$ are in a ball around $\theta$ inside the neighborhood on which $\phi$ is differentiable. Then $g_{n}:[0,1] \mapsto \mathbb{R}$ is continuously differentiable with derivative $g_{n}^{\prime}(t)=\phi_{\theta_{n}+t h}^{\prime}(h)$. By the mean-value theorem, $g_{n}(1)-g_{n}(0)=g_{n}^{\prime}(\xi)$ for some $0 \leq \xi \leq 1$. In other words

$$
R_{n}(h):=\phi\left(\theta_{n}+h\right)-\phi\left(\theta_{n}\right)-\phi_{\theta}^{\prime}(h)=\phi_{\theta_{n}+\xi h}^{\prime}(h)-\phi_{\theta}^{\prime}(h)
$$

By the continuity of the map $\theta \mapsto \phi_{\theta}^{\prime}$, there exists for every $\varepsilon>0$ a $\delta>0$ such that $\left\|\phi_{\zeta}^{\prime}(h)-\phi_{\theta}^{\prime}(h)\right\|<\varepsilon\|h\|$ for every $\|\zeta-\theta\|<\delta$ and every $h$. For sufficiently large $n$ and $\|h\|<\delta / 2$, the vectors $\theta_{n}+\xi h$ are within distance $\delta$ of $\theta$, so that the norm $\left\|R_{n}(h)\right\|$ of the right side of the preceding display is bounded by $\varepsilon\|h\|$. Thus, for any $\eta>0$,

$$
\mathrm{P}\left(r_{n}\left\|R_{n}\left(T_{n}-\theta_{n}\right)\right\|>\eta\right) \leq \mathrm{P}\left(\left\|T_{n}-\theta_{n}\right\| \geq \frac{\delta}{2}\right)+\mathrm{P}\left(r_{n}\left\|T_{n}-\theta_{n}\right\| \varepsilon>\eta\right) .
$$

The first term converges to zero as $n \rightarrow \infty$. The second term can be made arbitrarily small by choosing $\varepsilon$ small.

## *3.5 Moments

So far we have discussed the stability of convergence in distribution under transformations. We can pose the same problem regarding moments: Can an expansion for the moments of $\phi\left(T_{n}\right)-\phi(\theta)$ be derived from a similar expansion for the moments of $T_{n}-\theta$ ? In principle the answer is affirmative, but unlike in the distributional case, in which a simple derivative of $\phi$ is enough, global regularity conditions on $\phi$ are needed to argue that the remainder terms are negligible.

One possible approach is to apply the distributional delta method first, thus yielding the qualitative asymptotic behavior. Next, the convergence of the moments of $\phi\left(T_{n}\right)-\phi(\theta)$ (or a remainder term) is a matter of uniform integrability, in view of Lemma 2.20. If $\phi$ is uniformly Lipschitz, then this uniform integrability follows from the corresponding uniform integrability of $T_{n}-\theta$. If $\phi$ has an unbounded derivative, then the connection between moments of $\phi\left(T_{n}\right)-\phi(\theta)$ and $T_{n}-\theta$ is harder to make, in general.

## Notes

The Delta method belongs to the folklore of statistics. It is not entirely trivial; proofs are sometimes based on the mean-value theorem and then require continuous differentiability in a neighborhood. A generalization to functions on infinite-dimensional spaces is discussed in Chapter 20.

## PROBLEMS

1. Find the joint limit distribution of $\left(\sqrt{n}(\bar{X}-\mu), \sqrt{n}\left(S^{2}-\sigma^{2}\right)\right)$ if $\bar{X}$ and $S^{2}$ are based on a sample of size $n$ from a distribution with finite fourth moment. Under what condition on the underlying distribution are $\sqrt{n}(\bar{X}-\mu)$ and $\sqrt{n}\left(S^{2}-\sigma^{2}\right)$ asymptotically independent?
2. Find the asymptotic distribution of $\sqrt{n}(r-\rho)$ if $r$ is the correlation coefficient of a sample of $n$ bivariate vectors with finite fourth moments. (This is quite a bit of work. It helps to assume that the mean and the variance are equal to 0 and 1 , respectively.)
3. Investigate the asymptotic robustness of the level of the $t$-test for testing the mean that rejects $H_{0}: \mu \leq 0$ if $\sqrt{n} \bar{X} / S$ is larger than the upper $\alpha$ quantile of the $t_{n-1}$ distribution.
4. Find the limit distribution of the sample kurtosis $k_{n}=n^{-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{4} / S^{4}-3$, and design an asymptotic level $\alpha$ test for normality based on $k_{n}$. (Warning: At least 500 observations are needed to make the normal approximation work in this case.)
5. Design an asymptotic level $\alpha$ test for normality based on the sample skewness and kurtosis jointly.
6. Let $X_{1}, \ldots, X_{n}$ be i.i.d. with expectation $\mu$ and variance 1 . Find constants such that $a_{n}\left(\bar{X}_{n}^{2}-b_{n}\right)$ converges in distribution if $\mu=0$ or $\mu \neq 0$.
7. Let $X_{1}, \ldots, X_{n}$ be a random sample from the Poisson distribution with mean $\theta$. Find a variance stabilizing transformation for the sample mean, and construct a confidence interval for $\theta$ based on this.
8. Let $X_{1}, \ldots, X_{n}$ be i.i.d. with expectation 1 and finite variance. Find the limit distribution of $\sqrt{n}\left(\bar{X}_{n}^{-1}-1\right)$. If the random variables are sampled from a density $f$ that is bounded and strictly positive in a neighborhood of zero, show that $E\left|\bar{X}_{n}^{-1}\right|=\infty$ for every $n$. (The density of $\bar{X}_{n}$ is bounded away from zero in a neighborhood of zero for every $n$.)

## 4

## Moment Estimators

The method of moments determines estimators by comparing sample and theoretical moments. Moment estimators are useful for their simplicity, although not always optimal. Maximum likelihood estimators for full exponential families are moment estimators, and their asymptotic normality can be proved by treating them as such.

### 4.1 Method of Moments

Let $X_{1}, \ldots, X_{n}$ be a sample from a distribution $P_{\theta}$ that depends on a parameter $\theta$, ranging over some set $\Theta$. The method of moments consists of estimating $\theta$ by the solution of a system of equations

$$
\frac{1}{n} \sum_{i=1}^{n} f_{j}\left(X_{i}\right)=E_{\theta} f_{j}(X), \quad j=1, \ldots, k,
$$

for given functions $f_{1}, \ldots, f_{k}$. Thus the parameter is chosen such that the sample moments (on the left side) match the theoretical moments. If the parameter is $k$-dimensional one usually tries to match $k$ moments in this manner. The choices $f_{j}(x)=x^{j}$ lead to the method of moments in its simplest form.

Moment estimators are not necessarily the best estimators, but under reasonable conditions they have convergence rate $\sqrt{n}$ and are asymptotically normal. This is a consequence of the delta method. Write the given functions in the vector notation $f=\left(f_{1}, \ldots, f_{k}\right)$, and let $e: \Theta \mapsto \mathbb{R}^{k}$ be the vector-valued expectation $e(\theta)=P_{\theta} f$. Then the moment estimator $\hat{\theta}_{n}$ solves the system of equations

$$
\mathbb{P}_{n} f \equiv \frac{1}{n} \sum_{i=1}^{n} f\left(X_{i}\right)=e(\theta) \equiv P_{\theta} f
$$

For existence of the moment estimator, it is necessary that the vector $\mathbb{P}_{n} f$ be in the range of the function $e$. If $e$ is one-to-one, then the moment estimator is uniquely determined as $\hat{\theta}_{n}=e^{-1}\left(\mathbb{P}_{n} f\right)$ and

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=\sqrt{n}\left(e^{-1}\left(\mathbb{P}_{n} f\right)-e^{-1}\left(P_{\theta_{0}} f\right)\right) .
$$

If $\mathbb{P}_{n} f$ is asymptotically normal and $e^{-1}$ is differentiable, then the right side is asymptotically normal by the delta method.

The derivative of $e^{-1}$ at $e\left(\theta_{0}\right)$ is the inverse $e_{\theta_{0}}^{-1}$ of the derivative of $e$ at $\theta_{0}$. Because the function $e^{-1}$ is often not explicit, it is convenient to ascertain its differentiability from the differentiability of $e$. This is possible by the inverse function theorem. According to this theorem a map that is (continuously) differentiable throughout an open set with nonsingular derivatives is locally one-to-one, is of full rank, and has a differentiable inverse. Thus we obtain the following theorem.
4.1 Theorem. Suppose that $e(\theta)=P_{\theta} f$ is one-to-one on an open set $\Theta \subset \mathbb{R}^{k}$ and continuously differentiable at $\theta_{0}$ with nonsingular derivative $e_{\theta_{0}}^{\prime}$. Moreover, assume that $P_{\theta_{0}}\|f\|^{2}<\infty$. Then moment estimators $\hat{\theta}_{n}$ exist with probability tending to one and satisfy

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right) \stackrel{\theta_{0}}{\hookrightarrow} N\left(0, e_{\theta_{0}}^{\prime-1} P_{\theta_{0}} f f^{T}\left(e_{\theta_{0}}^{\prime-1}\right)^{T}\right) .
$$

Proof. Continuous differentiability at $\theta_{0}$ presumes differentiability in a neighborhood and the continuity of $\theta \mapsto e_{\theta}^{\prime}$ and nonsingularity of $e_{\theta_{0}}^{\prime}$ imply nonsingularity in a neighborhood. Therefore, by the inverse function theorem there exist open neighborhoods $U$ of $\theta_{0}$ and $V$ of $P_{\theta_{0}} f$ such that $e: U \mapsto V$ is a differentiable bijection with a differentiable inverse $e^{-1}: V \mapsto U$. Moment estimators $\hat{\theta}_{n}=e^{-1}\left(\mathbb{P}_{n} f\right)$ exist as soon as $\mathbb{P}_{n} f \in V$, which happens with probability tending to 1 by the law of large numbers.

The central limit theorem guarantees asymptotic normality of the sequence $\sqrt{n}\left(\mathbb{P}_{n} f-\right. \left.P_{\theta_{0}} f\right)$. Next use Theorem 3.1 on the display preceding the statement of the theorem.

For completeness, the following two lemmas constitute, if combined, a proof of the inverse function theorem. If necessary the preceding theorem can be strengthened somewhat by applying the lemmas directly. Furthermore, the first lemma can be easily generalized to infinite-dimensional parameters, such as used in the semiparametric models discussed in Chapter 25.
4.2 Lemma. Let $\Theta \subset \mathbb{R}^{k}$ be arbitrary and let e : $\Theta \mapsto \mathbb{R}^{k}$ be one-to-one and differentiable at a point $\theta_{0}$ with a nonsingular derivative. Then the inverse $e^{-1}$ (defined on the range of $e$ ) is differentiable at $e\left(\theta_{0}\right)$ provided it is continuous at $e\left(\theta_{0}\right)$.

Proof. Write $\eta=e\left(\theta_{0}\right)$ and $\Delta h=e^{-1}(\eta+h)-e^{-1}(\eta)$. Because $e^{-1}$ is continuous at $\eta$, we have that $\Delta h \mapsto 0$ as $h \mapsto 0$. Thus

$$
\eta+h=e e^{-1}(\eta+h)=e\left(\Delta h+\theta_{0}\right)=e\left(\theta_{0}\right)+e_{\theta_{0}}^{\prime}(\Delta h)+o(\|\Delta h\|),
$$

as $h \mapsto 0$, where the last step follows from differentiability of $e$. The displayed equation can be rewritten as $e_{\theta_{0}}^{\prime}(\Delta h)=h+o(\|\Delta h\|)$. By continuity of the inverse of $e_{\theta_{0}}^{\prime}$, this implies that

$$
\Delta h=e_{\theta_{0}}^{\prime-1}(h)+o(\|\Delta h\|) .
$$

In particular, $\|\Delta h\|(1+o(1)) \leq\left\|e_{\theta_{0}}^{\prime-1}(h)\right\|=O(\|h\|)$. Insert this in the displayed equation to obtain the desired result that $\Delta h=e_{\theta_{0}}^{\prime-1}(h)+o(\|h\|)$.
4.3 Lemma. Let e : $\Theta \mapsto \mathbb{R}^{k}$ be defined and differentiable in a neighborhood of a point $\theta_{0}$ and continuously differentiable at $\theta_{0}$ with a nonsingular derivative. Then e maps every
sufficiently small open neighborhood $U$ of $\theta_{0}$ onto an open set $V$ and $e^{-1}: V \mapsto U$ is well defined and continuous.

Proof. By assumption, $e_{\theta}^{\prime} \rightarrow A^{-1}:=e_{\theta_{0}}^{\prime}$ as $\theta \mapsto \theta_{0}$. Thus $\left\|I-A e_{\theta}^{\prime}\right\| \leq \frac{1}{2}$ for every $\theta$ in a sufficiently small neighborhood $U$ of $\theta_{0}$. Fix an arbitrary point $\eta_{1}=e\left(\theta_{1}\right)$ from $V=e(U)$ (where $\theta_{1} \in U$ ). Next find an $\varepsilon>0$ such that $\overline{\operatorname{ball}}\left(\theta_{1}, \varepsilon\right) \subset U$, and fix an arbitrary point $\eta$ with $\left\|\eta-\eta_{1}\right\|<\delta:=\frac{1}{2}\|A\|^{-1} \varepsilon$. It will be shown that $\eta=e(\theta)$ for some point $\theta \in \overline{\operatorname{ball}}\left(\theta_{1}, \varepsilon\right)$. Hence every $\eta \in \operatorname{ball}\left(\eta_{1}, \delta\right)$ has an original in $\overline{\operatorname{ball}}\left(\theta_{1}, \varepsilon\right)$. If $e$ is one-to-one on $U$, so that the original is unique, then it follows that $V$ is open and that $e^{-1}$ is continuous at $\eta_{1}$.

Define a function $\phi(\theta)=\theta+A(\eta-e(\theta))$. Because the norm of the derivative $\phi_{\theta}^{\prime}= I-A e_{\theta}^{\prime}$ is bounded by $\frac{1}{2}$ throughout $U$, the map $\phi$ is a contraction on $U$. Furthermore, if $\left\|\theta-\theta_{1}\right\| \leq \varepsilon$,

$$
\left\|\phi(\theta)-\theta_{1}\right\| \leq\left\|\phi(\theta)-\phi\left(\theta_{1}\right)\right\|+\left\|\phi\left(\theta_{1}\right)-\theta_{1}\right\| \leq \frac{1}{2}\left\|\theta-\theta_{1}\right\|+\|A\|\left\|\eta-\eta_{1}\right\|<\varepsilon .
$$

Consequently, $\phi$ maps $\overline{\text { ball }}\left(\theta_{1}, \varepsilon\right)$ into itself. Because $\phi$ is a contraction, it has a fixed point $\theta \in \overline{\operatorname{ball}}\left(\theta_{1}, \varepsilon\right)$ : a point with $\phi(\theta)=\theta$. By definition of $\phi$ this satisfies $e(\theta)=\eta$.

Any other $\tilde{\theta}$ with $e(\tilde{\theta})=\eta$ is also a fixed point of $\phi$. In that case the difference $\tilde{\theta}-\theta= \phi(\tilde{\theta})-\phi(\theta)$ has norm bounded by $\frac{1}{2}\|\tilde{\theta}-\theta\|$. This can only happen if $\tilde{\theta}=\theta$. Hence $e$ is one-to-one throughout $U$.
4.4 Example. Let $X_{1}, \ldots, X_{n}$ be a random sample from the beta-distribution: The common density is equal to

$$
x \mapsto \frac{\Gamma(\alpha+\beta)}{\Gamma(\alpha) \Gamma(\beta)} x^{\alpha-1}(1-x)^{\beta-1} 1_{0<x<1} .
$$

The moment estimator for $(\alpha, \beta)$ is the solution of the system of equations

$$
\begin{aligned}
& \bar{X}_{n}=E_{\alpha, \beta} X_{1}=\frac{\alpha}{\alpha+\beta} \\
& \overline{X_{n}^{2}}=E_{\alpha, \beta} X_{1}^{2}=\frac{(\alpha+1) \alpha}{(\alpha+\beta+1)(\alpha+\beta)}
\end{aligned}
$$

The righthand side is a smooth and regular function of ( $\alpha, \beta$ ), and the equations can be solved explicitly. Hence, the moment estimators exist and are asymptotically normal.

## *4.2 Exponential Families

Maximum likelihood estimators in full exponential families are moment estimators. This can be exploited to show their asymptotic normality. Actually, as shown in Chapter 5, maximum likelihood estimators in smoothly parametrized models are asymptotically normal in great generality. Therefore the present section is included for the benefit of the simple proof, rather than as an explanation of the limit properties.

Let $X_{1}, \ldots, X_{n}$ be a sample from the $k$-dimensional exponential family with density

$$
p_{\theta}(x)=c(\theta) h(x) e^{\theta^{T} t(x)}
$$

Thus $h$ and $t=\left(t_{1}, \ldots, t_{k}\right)$ are known functions on the sample space, and the family is given in its natural parametrization. The parameter set $\Theta$ must be contained in the natural parameter space for the family. This is the set of $\theta$ for which $p_{\theta}$ can define a probability density. If $\mu$ is the dominating measure, then this is the right side in

$$
\Theta \subset\left\{\theta \in \mathbb{R}^{k}: c(\theta)^{-1} \equiv \int h(x) e^{\theta^{T} t(x)} d \mu(x)<\infty\right\}
$$

It is a standard result (and not hard to see) that the natural parameter space is convex. It is usually open, in which case the family is called "regular." In any case, we assume that the true parameter is an inner point of $\Theta$. Another standard result concerns the smoothness of the function $\theta \mapsto c(\theta)$, or rather of its inverse. (For a proof of the following lemma, see [100, p. 59] or [17, p. 39].)
4.5 Lemma. The function $\theta \mapsto \int h(x) e^{\theta^{T} t(x)} d \mu(x)$ is analytic on the $\operatorname{set}\left\{\theta \in \mathbb{C}^{k}: \operatorname{Re} \theta \in\right. \stackrel{\circ}{\Theta}\}$. Its derivatives can be found by differentiating (repeatedly) under the integral sign:

$$
\frac{\partial^{p} \int h(x) e^{\theta^{T} t(x)} d \mu(x)}{\partial \theta_{1}^{i_{1}} \cdots \partial \theta_{k}^{i_{k}}}=\int h(x) t_{1}(x)^{i_{1}} \cdots t_{k}(x)^{i_{k}} e^{\theta^{T} t(x)} d \mu(x)
$$

for any natural numbers $p$ and $i_{1}+\cdots+i_{k}=p$.
The lemma implies that the $\log$ likelihood $\ell_{\theta}(x)=\log p_{\theta}(x)$ can be differentiated (infinitely often) with respect to $\theta$. The vector of partial derivatives (the score function) satisfies

$$
\dot{\ell}_{\theta}(x)=\frac{\dot{c}}{c}(\theta)+t(x)=t(x)-E_{\theta} t(X)
$$

Here the second equality is an example of the general rule that score functions have zero means. It can formally be established by differentiating the identity $\int p_{\theta} d \mu \equiv 1$ under the integral sign: Combine the lemma and the Leibniz rule to see that

$$
\frac{\partial}{\partial \theta_{i}} \int p_{\theta} d \mu=\int \frac{\partial c(\theta)}{\partial \theta_{i}} h(x) e^{\theta^{T} t(x)} d \mu(x)+\int c(\theta) h(x) t_{i}(x) e^{\theta^{T} t(x)} d \mu(x)
$$

The left side is zero and the equation can be rewritten as $0=\dot{c} / c(\theta)+E_{\theta} t(X)$.
It follows that the likelihood equations $\sum \dot{\ell}_{\theta}\left(X_{i}\right)=0$ reduce to the system of $k$ equations

$$
\frac{1}{n} \sum_{i=1}^{n} t\left(X_{i}\right)=E_{\theta} t(X)
$$

Thus, the maximum likelihood estimators are moment estimators. Their asymptotic properties depend on the function $e(\theta)=E_{\theta} t(X)$, which is very well behaved on the interior of the natural parameter set. By differentiating $E_{\theta} t(X)$ under the expectation sign (which is justified by the lemma), we see that its derivative matrices are given by

$$
e_{\theta}^{\prime}=\operatorname{Cov}_{\theta} t(X)
$$

The exponential family is said to be of full rank if no linear combination $\sum_{j=1}^{k} \lambda_{j} t_{j}(X)$ is constant with probability 1 ; equivalently, if the covariance matrix of $t(X)$ is nonsingular. In
view of the preceding display, this ensures that the derivative $e_{\theta}^{\prime}$ is strictly positive-definite throughout the interior of the natural parameter set. Then $e$ is one-to-one, so that there exists at most one solution to the moment equations. (Cf. Problem 4.6.) In view of the expression for $\dot{\ell}_{\theta}$, the matrix $-n e_{\theta}^{\prime}$ is the second-derivative matrix (Hessian) of the log likelihood $\sum_{i=1}^{n} \ell_{\theta}\left(X_{i}\right)$. Thus, a solution to the moment equations must be a point of maximum of the $\log$ likelihood.

A solution can be shown to exist (within the natural parameter space) with probability 1 if the exponential family is "regular," or more generally "steep" (see [17]); it is then a point of absolute maximum of the likelihood. If the true parameter is in the interior of the parameter set, then a (unique) solution $\hat{\theta}_{n}$ exists with probability tending to 1 as $n \mapsto \infty$, in any case, by Theorem 4.1. Moreover, this theorem shows that the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with covariance matrix

$$
e_{\theta_{0}}^{\prime-1} \operatorname{Cov}_{\theta_{0}} t(X)\left(e_{\theta_{0}}^{-1}\right)^{T}=\left(\operatorname{Cov}_{\theta_{0}} t(X)\right)^{-1} .
$$

So far we have considered an exponential family in standard form. Many examples arise in the form

$$
\begin{equation*}
p_{\theta}(x)=d(\theta) h(x) e^{Q(\theta)^{T} t(x)}, \tag{4.6}
\end{equation*}
$$

where $Q=\left(Q_{1}, \ldots, Q_{k}\right)$ is a vector-valued function. If $Q$ is one-to-one and a maximum likelihood estimator $\hat{\theta}_{n}$ exists, then by the invariance of maximum likelihood estimators under transformations, $Q\left(\hat{\theta}_{n}\right)$ is the maximum likelihood estimator for the natural parameter $Q(\theta)$ as considered before. If the range of $Q$ contains an open ball around $Q\left(\theta_{0}\right)$, then the preceding discussion shows that the sequence $\sqrt{n}\left(Q\left(\hat{\theta}_{n}\right)-Q\left(\theta_{0}\right)\right)$ is asymptotically normal. It requires another application of the delta method to obtain the limit distribution of $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$. As is typical of maximum likelihood estimators, the asymptotic covariance matrix is the inverse of the Fisher information matrix

$$
I_{\theta}=\mathrm{E}_{\theta} \dot{\ell}_{\theta}(X) \dot{\ell}_{\theta}(X)^{T}
$$

4.6 Theorem. Let $\Theta \subset \mathbb{R}^{k}$ be open and let $Q: \Theta \mapsto \mathbb{R}^{k}$ be one-to-one and continuously differentiable throughout $\Theta$ with nonsingular derivatives. Let the (exponential) family of densities $p_{\theta}$ be given by (4.6) and be of full rank. Then the likelihood equations have a unique solution $\hat{\theta}_{n}$ with probability tending to 1 and $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \stackrel{\theta}{\rightsquigarrow} N\left(0, I_{\theta}^{-1}\right)$ for every $\theta$.

Proof. According to the inverse function theorem, the range of $Q$ is open and the inverse map $Q^{-1}$ is differentiable throughout this range. Thus, as discussed previously, the delta method ensures the asymptotic normality. It suffices to calculate the asymptotic covariance matrix. By the preceding discussion this is equal to

$$
Q_{\theta}^{\prime-1}\left(\operatorname{Cov}_{\theta} t(X)\right)^{-1}\left(Q_{\theta}^{\prime-1}\right)^{T} .
$$

By direct calculation, the score function for the model is equal to $\dot{\ell}_{\theta}(x)=\dot{d} / d(\theta)+ \left(Q_{\theta}^{\prime}\right)^{T} t(x)$. As before, the score function has mean zero, so that this can be rewritten as $\dot{\ell}_{\theta}(x)=\left(Q_{\theta}^{\prime}\right)^{T}\left(t(x)-E_{\theta} t(X)\right)$. Thus, the Fisher information matrix equals $I_{\theta}= \left(Q_{\theta}^{\prime}\right)^{T} \operatorname{Cov}_{\theta} t(X) Q_{\theta}^{\prime}$. This is the inverse of the asymptotic covariance matrix given in the preceding display.

Not all exponential families satisfy the conditions of the theorem. For instance, the normal $N\left(\theta, \theta^{2}\right)$ family is an example of a "curved exponential family." The map $Q(\theta)= \left(\theta^{-2}, \theta^{-1}\right)$ (with $t(x)=\left(-x^{2} / 2, x\right)$ ) does not fill up the natural parameter space of the normal location-scale family but only traces out a one-dimensional curve. In such cases the result of the theorem may still hold. In fact, the result is true for most models with "smooth parametrizations," as is seen in Chapter 5. However, the "easy" proof of this section is not valid.

## PROBLEMS

1. Let $X_{1}, \ldots, X_{n}$ be a sample from the uniform distribution on $[-\theta, \theta]$. Find the moment estimator of $\theta$ based on $\overline{X^{2}}$. Is it asymptotically normal? Can you think of an estimator for $\theta$ that converges faster to the parameter?
2. Let $X_{1}, \ldots, X_{n}$ be a sample from a density $p_{\theta}$ and $f$ a function such that $e(\theta)=E_{\theta} f(X)$ is differentiable with $e^{\prime}(\theta)=E_{\theta} \dot{\ell}_{\theta}(X) f(X)$ for $\ell_{\theta}=\log p_{\theta}$.
(i) Show that the asymptotic variance of the moment estimator based on $f$ equals $\operatorname{var}_{\theta}(f) / \operatorname{cov}_{\theta}\left(f, \dot{\ell}_{\theta}\right)^{2}$.
(ii) Show that this is bigger than $I_{\theta}^{-1}$ with equality for all $\theta$ if and only if the moment estimator is the maximum likelihood estimator.
(iii) Show that the latter happens only for exponential family members.
3. To what extent does the result of Theorem 4.1 require that the observations are i.i.d.?
4. Let the observations be a sample of size $n$ from the $N\left(\mu, \sigma^{2}\right)$ distribution. Calculate the Fisher information matrix for the parameter $\theta=\left(\mu, \sigma^{2}\right)$ and its inverse. Check directly that the maximum likelihood estimator is asymptotically normal with zero mean and covariance matrix $I_{\theta}^{-1}$.
5. Establish the formula $e_{\theta}^{\prime}=\operatorname{Cov}_{\theta} t(X)$ by differentiating $e(\theta)=E_{\theta} t(X)$ under the integral sign. (Differentiating under the integral sign is justified by Lemma 4.5, because $E_{\theta} t(X)$ is the first derivative of $c(\theta)^{-1}$.)
6. Suppose a function $e: \Theta \mapsto \mathbb{R}^{k}$ is defined and continuously differentiable on a convex subset $\Theta \subset \mathbb{R}^{k}$ with strictly positive-definite derivative matrix. Then $e$ has at most one zero in $\Theta$. (Consider the function $g(\lambda)=\left(\theta_{1}-\theta_{2}\right)^{T} e\left(\lambda \theta_{1}+(1-\lambda) \theta_{2}\right)$ for given $\theta_{1} \neq \theta_{2}$ and $0 \leq \lambda \leq 1$. If $g(0)=g(1)=0$, then there exists a point $\lambda_{0}$ with $g^{\prime}\left(\lambda_{0}\right)=0$ by the mean-value theorem.)

## 5

## $M$ - and $Z$-Estimators

> This chapter gives an introduction to the consistency and asymptotic normality of M-estimators and Z-estimators. Maximum likelihood estimators are treated as a special case.

### 5.1 Introduction

Suppose that we are interested in a parameter (or "functional") $\theta$ attached to the distribution of observations $X_{1}, \ldots, X_{n}$. A popular method for finding an estimator $\hat{\theta}_{n}=\hat{\theta}_{n}\left(X_{1}, \ldots, X_{n}\right)$ is to maximize a criterion function of the type

$$
\begin{equation*}
\theta \mapsto M_{n}(\theta)=\frac{1}{n} \sum_{i=1}^{n} m_{\theta}\left(X_{i}\right) . \tag{5.1}
\end{equation*}
$$

Here $m_{\theta}: \mathcal{X} \mapsto \overline{\mathbb{R}}$ are known functions. An estimator maximizing $M_{n}(\theta)$ over $\Theta$ is called an $M$-estimator. In this chapter we investigate the asymptotic behavior of sequences of $M$-estimators.

Often the maximizing value is sought by setting a derivative (or the set of partial derivatives in the multidimensional case) equal to zero. Therefore, the name $M$-estimator is also used for estimators satisfying systems of equations of the type

$$
\begin{equation*}
\Psi_{n}(\theta)=\frac{1}{n} \sum_{i=1}^{n} \psi_{\theta}\left(X_{i}\right)=0 . \tag{5.2}
\end{equation*}
$$

Here $\psi_{\theta}$ are known vector-valued maps. For instance, if $\theta$ is $k$-dimensional, then $\psi_{\theta}$ typically has $k$ coordinate functions $\psi_{\theta}=\left(\psi_{\theta, 1}, \ldots, \psi_{\theta, k}\right)$, and (5.2) is shorthand for the system of equations

$$
\sum_{i=1}^{n} \psi_{\theta, j}\left(X_{i}\right)=0, \quad j=1,2, \ldots, k
$$

Even though in many examples $\psi_{\theta, j}$ is the $j$ th partial derivative of some function $m_{\theta}$, this is irrelevant for the following. Equations, such as (5.2), defining an estimator are called estimating equations and need not correspond to a maximization problem. In the latter case it is probably better to call the corresponding estimators $Z$-estimators (for zero), but the use of the name $M$-estimator is widespread.

Sometimes the maximum of the criterion function $M_{n}$ is not taken or the estimating equation does not have an exact solution. Then it is natural to use as estimator a value that almost maximizes the criterion function or is a near zero. This yields approximate $M$-estimators or $Z$-estimators. Estimators that are sufficiently close to being a point of maximum or a zero often have the same asymptotic behavior.

An operator notation for taking expectations simplifies the formulas in this chapter. We write $P$ for the marginal law of the observations $X_{1}, \ldots, X_{n}$, which we assume to be identically distributed. Furthermore, we write $P f$ for the expectation $\mathrm{E} f(X)=\int f d P$ and abbreviate the average $n^{-1} \sum_{i=1}^{n} f\left(X_{i}\right)$ to $\mathbb{P}_{n} f$. Thus $\mathbb{P}_{n}$ is the empirical distribution: the (random) discrete distribution that puts mass $1 / n$ at every of the observations $X_{1}, \ldots, X_{n}$. The criterion functions now take the forms

$$
M_{n}(\theta)=\mathbb{P}_{n} m_{\theta}, \quad \text { and } \quad \Psi_{n}(\theta)=\mathbb{P}_{n} \psi_{\theta} .
$$

We also abbreviate the centered sums $n^{-1 / 2} \sum_{i=1}^{n}\left(f\left(X_{i}\right)-P f\right)$ to $\mathbb{G}_{n} f$, the empirical process at $f$.
5.3 Example (Maximum likelihood estimators). Suppose $X_{1}, \ldots, X_{n}$ have a common density $p_{\theta}$. Then the maximum likelihood estimator maximizes the likelihood $\prod_{i=1}^{n} p_{\theta}\left(X_{i}\right)$, or equivalently the log likelihood

$$
\theta \mapsto \sum_{i=1}^{n} \log p_{\theta}\left(X_{i}\right) .
$$

Thus, a maximum likelihood estimator is an $M$-estimator as in (5.1) with $m_{\theta}=\log p_{\theta}$. If the density is partially differentiable with respect to $\theta$ for each fixed $x$, then the maximum likelihood estimator also solves an equation of type (5.2), with $\psi_{\theta}$ equal to the vector of partial derivatives $\dot{\ell}_{\theta, j}=\partial / \partial \theta_{j} \log p_{\theta}$. The vector-valued function $\dot{\ell}_{\theta}$ is known as the score function of the model.

The definition (5.1) of an $M$-estimator may apply in cases where (5.2) does not. For instance, if $X_{1}, \ldots, X_{n}$ are i.i.d. according to the uniform distribution on $[0, \theta]$, then it makes sense to maximize the log likelihood

$$
\theta \mapsto \sum_{i=1}^{n}\left(\log 1_{[0, \theta]}\left(X_{i}\right)-\log \theta\right) .
$$

(Define $\log 0=-\infty$.) However, this function is not smooth in $\theta$ and there exists no natural version of (5.2). Thus, in this example the definition as the location of a maximum is more fundamental than the definition as a zero.
5.4 Example (Location estimators). Let $X_{1}, \ldots, X_{n}$ be a random sample of real-valued observations and suppose we want to estimate the location of their distribution. "Location" is a vague term; it could be made precise by defining it as the mean or median, or the center of symmetry of the distribution if this happens to be symmetric. Two examples of location estimators are the sample mean and the sample median. Both are $Z$-estimators, because they solve the equations

$$
\sum_{i=1}^{n}\left(X_{i}-\theta\right)=0 ; \quad \text { and } \quad \sum_{i=1}^{n} \operatorname{sign}\left(X_{i}-\theta\right)=0
$$

respectively. ${ }^{\dagger}$ Both estimating equations involve functions of the form $\psi(x-\theta)$ for a function $\psi$ that is monotone and odd around zero. It seems reasonable to study estimators that solve a general equation of the type

$$
\sum_{i=1}^{n} \psi\left(X_{i}-\theta\right)=0 .
$$

We can consider a $Z$-estimator defined by this equation a "location" estimator, because it has the desirable property of location equivariance. If the observations $X_{i}$ are shifted by a fixed amount $\alpha$, then so is the estimate: $\hat{\theta}+\alpha$ solves $\sum_{i=1}^{n} \psi\left(X_{i}+\alpha-\theta\right)=0$ if $\hat{\theta}$ solves the original equation.

Popular examples are the Huber estimators corresponding to the functions

$$
\psi(x)=[x]_{-k}^{k}:= \begin{cases}-k & \text { if } x \leq-k \\ x & \text { if }|x| \leq k \\ k & \text { if } x \geq k\end{cases}
$$

The Huber estimators were motivated by studies in robust statistics concerning the influence of extreme data points on the estimate. The exact values of the largest and smallest observations have very little influence on the value of the median, but a proportional influence on the mean. Therefore, the sample mean is considered nonrobust against outliers. If the extreme observations are thought to be rather unreliable, it is certainly an advantage to limit their influence on the estimate, but the median may be too successful in this respect. Depending on the value of $k$, the Huber estimators behave more like the mean (large $k$ ) or more like the median (small $k$ ) and thus bridge the gap between the nonrobust mean and very robust median.

Another example are the quantiles. A $p$ th sample quantile is roughly a point $\theta$ such that $p n$ observations are less than $\theta$ and $(1-p) n$ observations are greater than $\theta$. The precise definition has to take into account that the value $p n$ may not be an integer. One possibility is to call a pth sample quantile any $\hat{\theta}$ that solves the inequalities

$$
\begin{equation*}
-1<\sum_{i=1}^{n}\left((1-p) 1\left\{X_{i}<\theta\right\}-p 1\left\{X_{i}>\theta\right\}\right)<1 . \tag{5.5}
\end{equation*}
$$

This is an approximate $M$-estimator for $\psi(x)=1-p, 0,-p$ if $x<0, x=0$, or $x>0$, respectively. The "approximate" refers to the inequalities: It is required that the value of the estimating equation be inside the interval $(-1,1)$, rather than exactly zero. This may seem a rather wide tolerance interval for a zero. However, all solutions turn out to have the same asymptotic behavior. In any case, except for special combinations of $p$ and $n$, there is no hope of finding an exact zero, because the criterion function is discontinuous with jumps at the observations. (See Figure 5.1.) If no observations are tied, then all jumps are of size one and at least one solution $\hat{\theta}$ to the inequalities exists. If tied observations are present, it may be necessary to increase the interval $(-1,1)$ to ensure the existence of solutions. Note that the present $\psi$ function is monotone, as in the previous examples, but not symmetric about zero (for $p \neq 1 / 2$ ).

[^3]![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-061.jpg?height=1695&width=3791&top_left_y=534&top_left_x=1068)
Figure 5.1. The functions $\theta \mapsto \Psi_{n}(\theta)$ for the $80 \%$ quantile and the Huber estimator for samples of size 15 from the gamma $(8,1)$ and standard normal distribution, respectively.

All the estimators considered so far can also be defined as a solution of a maximization problem. Mean, median, Huber estimators, and quantiles minimize $\sum_{i=1}^{n} m\left(X_{i}-\theta\right)$ for $m$ equal to $x^{2},|x|, x^{2} 1_{|x| \leq k}+\left(2 k|x|-k^{2}\right) 1_{|x|>k}$ and $(1-p) x^{-}+p x^{+}$, respectively. $\square$

### 5.2 Consistency

If the estimator $\hat{\theta}_{n}$ is used to estimate the parameter $\theta$, then it is certainly desirable that the sequence $\hat{\theta}_{n}$ converges in probability to $\theta$. If this is the case for every possible value of the parameter, then the sequence of estimators is called asymptotically consistent. For instance, the sample mean $\bar{X}_{n}$ is asymptotically consistent for the population mean $\mathrm{E} X$ (provided the population mean exists). This follows from the law of large numbers. Not surprisingly this extends to many other sample characteristics. For instance, the sample median is consistent for the population median, whenever this is well defined. What can be said about $M$-estimators in general? We shall assume that the set of possible parameters is a metric space, and write $d$ for the metric. Then we wish to prove that $d\left(\hat{\theta}_{n}, \theta_{0}\right) \xrightarrow{\mathrm{P}} 0$ for some value $\theta_{0}$, which depends on the underlying distribution of the observations.

Suppose that the $M$-estimator $\hat{\theta}_{n}$ maximizes the random criterion function

$$
\theta \mapsto M_{n}(\theta) .
$$

Clearly, the "asymptotic value" of $\hat{\theta}_{n}$ depends on the asymptotic behavior of the functions $M_{n}$. Under suitable normalization there typically exists a deterministic "asymptotic criterion function" $\theta \mapsto M(\theta)$ such that

$$
\begin{equation*}
M_{n}(\theta) \xrightarrow{\mathrm{P}} M(\theta), \quad \text { every } \theta . \tag{5.6}
\end{equation*}
$$

For instance, if $M_{n}(\theta)$ is an average of the form $\mathbb{P}_{n} m_{\theta}$ as in (5.1), then the law of large numbers gives this result with $M(\theta)=P m_{\theta}$, provided this expectation exists.

It seems reasonable to expect that the maximizer $\hat{\theta}_{n}$ of $M_{n}$ converges to the maximizing value $\theta_{0}$ of $M$. This is what we wish to prove in this section, and we say that $\hat{\theta}_{n}$ is (asymptotically) consistent for $\theta_{0}$. However, the convergence (5.6) is too weak to ensure

![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-062.jpg?height=2307&width=3109&top_left_y=562&top_left_x=1300)
Figure 5.2 Example of a function whose point of maximum is not well separated.

the convergence of $\hat{\theta}_{n}$. Because the value $\hat{\theta}_{n}$ depends on the whole function $\theta \mapsto M_{n}(\theta)$, an appropriate form of "functional convergence" of $M_{n}$ to $M$ is needed, strengthening the pointwise convergence (5.6). There are several possibilities. In this section we first discuss an approach based on uniform convergence of the criterion functions. Admittedly, the assumption of uniform convergence is too strong for some applications and it is sometimes not easy to verify, but the approach illustrates the general idea.

Given an arbitrary random function $\theta \mapsto M_{n}(\theta)$, consider estimators $\hat{\theta}_{n}$ that nearly maximize $M_{n}$, that is,

$$
M_{n}\left(\hat{\theta}_{n}\right) \geq \sup _{\theta} M_{n}(\theta)-o_{P}(1) .
$$

Then certainly $M_{n}\left(\hat{\theta}_{n}\right) \geq M_{n}\left(\theta_{0}\right)-o_{P}(1)$, which turns out to be enough to ensure consistency. It is assumed that the sequence $M_{n}$ converges to a nonrandom map $M: \Theta \mapsto \overline{\mathbb{R}}$. Condition (5.8) of the following theorem requires that this map attains its maximum at a unique point $\theta_{0}$, and only parameters close to $\theta_{0}$ may yield a value of $M(\theta)$ close to the maximum value $M\left(\theta_{0}\right)$. Thus, $\theta_{0}$ should be a well-separated point of maximum of $M$. Figure 5.2 shows a function that does not satisfy this requirement.
5.7 Theorem. Let $M_{n}$ be random functions and let $M$ be a fixed function of $\theta$ such that for every $\varepsilon>0^{\dagger}$

$$
\begin{align*}
& \sup _{\theta \in \Theta}\left|M_{n}(\theta)-M(\theta)\right| \xrightarrow{\mathrm{P}} 0,  \tag{5.8}\\
& \sup _{\theta: d\left(\theta, \theta_{0}\right) \geq \varepsilon} M(\theta)<M\left(\theta_{0}\right) .
\end{align*}
$$

Then any sequence of estimators $\hat{\theta}_{n}$ with $M_{n}\left(\hat{\theta}_{n}\right) \geq M_{n}\left(\theta_{0}\right)-o_{P}(1)$ converges in probability to $\theta_{0}$.

[^4]Proof. By the property of $\hat{\theta}_{n}$, we have $M_{n}\left(\hat{\theta}_{n}\right) \geq M_{n}\left(\theta_{0}\right)-o_{P}(1)$. Because the uniform convergence of $M_{n}$ to $M$ implies the convergence of $M_{n}\left(\theta_{0}\right) \xrightarrow{\mathrm{P}} M\left(\theta_{0}\right)$, the right side equals $M\left(\theta_{0}\right)-o_{P}(1)$. It follows that $M_{n}\left(\hat{\theta}_{n}\right) \geq M\left(\theta_{0}\right)-o_{P}(1)$, whence

$$
\begin{aligned}
M\left(\theta_{0}\right)-M\left(\hat{\theta}_{n}\right) & \leq M_{n}\left(\hat{\theta}_{n}\right)-M\left(\hat{\theta}_{n}\right)+o_{P}(1) \\
& \leq \sup _{\theta}\left|M_{n}-M\right|(\theta)+o_{P}(1) \xrightarrow{\mathrm{P}} 0 .
\end{aligned}
$$

by the first part of assumption (5.8). By the second part of assumption (5.8), there exists for every $\varepsilon>0$ a number $\eta>0$ such that $M(\theta)<M\left(\theta_{0}\right)-\eta$ for every $\theta$ with $d\left(\theta, \theta_{0}\right) \geq \varepsilon$. Thus, the event $\left\{d\left(\hat{\theta}_{n}, \theta_{0}\right) \geq \varepsilon\right\}$ is contained in the event $\left\{M\left(\hat{\theta}_{n}\right)<M\left(\theta_{0}\right)-\eta\right\}$. The probability of the latter event converges to 0 , in view of the preceding display.

Instead of through maximization, an $M$-estimator may be defined as a zero of a criterion function $\theta \mapsto \Psi_{n}(\theta)$. It is again reasonable to assume that the sequence of criterion functions converges to a fixed limit:

$$
\Psi_{n}(\theta) \xrightarrow{\mathrm{P}} \Psi(\theta) .
$$

Then it may be expected that a sequence of (approximate) zeros of $\Psi_{n}$ converges in probability to a zero of $\Psi$. This is true under similar restrictions as in the case of maximizing $M$ estimators. In fact, this can be deduced from the preceding theorem by noting that a zero of $\Psi_{n}$ maximizes the function $\theta \mapsto-\left\|\Psi_{n}(\theta)\right\|$.
5.9 Theorem. Let $\Psi_{n}$ be random vector-valued functions and let $\Psi$ be a fixed vectorvalued function of $\theta$ such that for every $\varepsilon>0$

$$
\begin{gathered}
\sup _{\theta \in \Theta}\left\|\Psi_{n}(\theta)-\Psi(\theta)\right\| \xrightarrow{\mathrm{P}} 0 \\
\inf _{\theta: d\left(\theta, \theta_{0}\right) \geq \varepsilon}\|\Psi(\theta)\|>0=\left\|\Psi\left(\theta_{0}\right)\right\| .
\end{gathered}
$$

Then any sequence of estimators $\hat{\theta}_{n}$ such that $\Psi_{n}\left(\hat{\theta}_{n}\right)=o_{P}(1)$ converges in probability to $\theta_{0}$.

Proof. This follows from the preceding theorem, on applying it to the functions $M_{n}(\theta)= -\left\|\Psi_{n}(\theta)\right\|$ and $M(\theta)=-\|\Psi(\theta)\|$.

The conditions of both theorems consist of a stochastic and a deterministic part. The deterministic condition can be verified by drawing a picture of the graph of the function. A helpful general observation is that, for a compact set $\Theta$ and continuous function $M$ or $\Psi$, uniqueness of $\theta_{0}$ as a maximizer or zero implies the condition. (See Problem 5.27.)

For $M_{n}(\theta)$ or $\Psi_{n}(\theta)$ equal to averages as in (5.1) or (5.2) the uniform convergence required by the stochastic condition is equivalent to the set of functions $\left\{m_{\theta}: \theta \in \Theta\right\}$ or $\left\{\psi_{\theta, j}: \theta \in \Theta, j=1, \ldots, k\right\}$ being Glivenko-Cantelli. Glivenko-Cantelli classes of functions are discussed in Chapter 19. One simple set of sufficient conditions is that $\Theta$ be compact, that the functions $\theta \mapsto m_{\theta}(x)$ or $\theta \mapsto \psi_{\theta}(x)$ are continuous for every $x$, and that they are dominated by an integrable function.

Uniform convergence of the criterion functions as in the preceding theorems is much stronger than needed for consistency. The following lemma is one of the many possibilities to replace the uniformity by other assumptions.
5.10 Lemma. Let $\Theta$ be a subset of the real line and let $\Psi_{n}$ be random functions and $\Psi$ a fixed function of $\theta$ such that $\Psi_{n}(\theta) \rightarrow \Psi(\theta)$ in probability for every $\theta$. Assume that each map $\theta \mapsto \Psi_{n}(\theta)$ is continuous and has exactly one zero $\hat{\theta}_{n}$, or is nondecreasing with $\Psi_{n}\left(\hat{\theta}_{n}\right)=o_{P}(1)$. Let $\theta_{0}$ be a point such that $\Psi\left(\theta_{0}-\varepsilon\right)<0<\Psi\left(\theta_{0}+\varepsilon\right)$ for every $\varepsilon>0$. Then $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$.

Proof. If the map $\theta \mapsto \Psi_{n}(\theta)$ is continuous and has a unique zero at $\hat{\theta}_{n}$, then

$$
\mathrm{P}\left(\Psi_{n}\left(\theta_{0}-\varepsilon\right)<0, \Psi_{n}\left(\theta_{0}+\varepsilon\right)>0\right) \leq \mathrm{P}\left(\theta_{0}-\varepsilon<\hat{\theta}_{n}<\theta_{0}+\varepsilon\right) .
$$

The left side converges to one, because $\Psi_{n}\left(\theta_{0} \pm \varepsilon\right) \rightarrow \Psi\left(\theta_{0} \pm \varepsilon\right)$ in probability. Thus the right side converges to one as well, and $\hat{\theta}_{n}$ is consistent.

If the map$\theta \mapsto \Psi_{n}(\theta)$ is nondecreasing and $\hat{\theta}_{n}$ is a zero, then the same argument is valid. More generally, if $\theta \mapsto \Psi_{n}(\theta)$ is nondecreasing, then $\Psi_{n}\left(\theta_{0}-\varepsilon\right)<-\eta$ and $\hat{\theta}_{n} \leq \theta_{0}-\varepsilon$ imply $\Psi_{n}\left(\hat{\theta}_{n}\right)<-\eta$, which has probability tending to zero for every $\eta>0$ if $\hat{\theta}_{n}$ is a near zero. This and a similar argument applied to the right tail shows that, for every $\varepsilon, \eta>0$,

$$
\mathrm{P}\left(\Psi_{n}\left(\theta_{0}-\varepsilon\right)<-\eta, \Psi_{n}\left(\theta_{0}+\varepsilon\right)>\eta\right) \leq \mathrm{P}\left(\theta_{0}-\varepsilon<\hat{\theta}_{n}<\theta_{0}+\varepsilon\right)+o(1) .
$$

For $2 \eta$ equal to the smallest of the numbers $-\Psi\left(\theta_{0}-\varepsilon\right)$ and $\Psi\left(\theta_{0}+\varepsilon\right)$ the left side still converges to one.
5.11 Example (Median). The sample median $\hat{\theta}_{n}$ is a (near) zero of the map $\theta \mapsto \Psi_{n}(\theta)= n^{-1} \sum_{i=1}^{n} \operatorname{sign}\left(X_{i}-\theta\right)$. By the law of large numbers,

$$
\Psi_{n}(\theta) \xrightarrow{\mathrm{P}} \Psi(\theta)=\mathrm{E} \operatorname{sign}(X-\theta)=\mathrm{P}(X>\theta)-\mathrm{P}(X<\theta),
$$

for every fixed $\theta$. Thus, we expect that the sample median converges in probability to a point $\theta_{0}$ such that $\mathrm{P}\left(X>\theta_{0}\right)=\mathrm{P}\left(X<\theta_{0}\right)$ : a population median.

This can be proved rigorously by applying Theorem 5.7 or 5.9. However, even though the conditions of the theorems are satisfied, they are not entirely trivial to verify. (The uniform convergence of $\Psi_{n}$ to $\Psi$ is proved essentially in Theorem 19.1) In this case it is easier to apply Lemma 5.10. Because the functions $\theta \mapsto \Psi_{n}(\theta)$ are nonincreasing, it follows that $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$ provided that $\Psi\left(\theta_{0}-\varepsilon\right)>0>\Psi\left(\theta_{0}+\varepsilon\right)$ for every $\varepsilon>0$. This is the case if the population median is unique: $\mathrm{P}\left(X<\theta_{0}-\varepsilon\right)<\frac{1}{2}<\mathrm{P}\left(X<\theta_{0}+\varepsilon\right)$ for all $\varepsilon>0$. $\square$

## *5.2.1 Wald's Consistency Proof

Consider the situation that, for a random sample of variables $X_{1}, \ldots, X_{n}$,

$$
M_{n}(\theta)=\mathbb{P}_{n} m_{\theta}=\frac{1}{n} \sum_{i=1}^{n} m_{\theta}\left(X_{i}\right), \quad M(\theta)=P m_{\theta}
$$

In this subsection we consider an alternative set of conditions under which the maximizer $\hat{\theta}_{n}$ of the process $M_{n}$ converges in probability to a point of maximum $\theta_{0}$ of the function $M$. This "classical" approach to consistency was taken by Wald in 1949 for maximum likelihood estimators. It works best if the parameter set $\Theta$ is compact. If not, then the argument must
be complemented by a proof that the estimators are in a compact set eventually or be applied to a suitable compactification of the parameter set.

Assume that the map $\theta \mapsto m_{\theta}(x)$ is upper-semicontinuous for almost all $x$ : For every $\theta$

$$
\begin{equation*}
\limsup _{\theta_{n} \rightarrow \theta} m_{\theta_{n}}(x) \leq m_{\theta}(x), \quad \text { a.s.. } \tag{5.12}
\end{equation*}
$$

(The exceptional set of $x$ may depend on $\theta$.) Furthermore, assume that for every sufficiently small ball $U \subset \Theta$ the function $x \mapsto \sup _{\theta \in U} m_{\theta}(x)$ is measurable and satisfies

$$
\begin{equation*}
P \sup _{\theta \in U} m_{\theta}<\infty . \tag{5.13}
\end{equation*}
$$

Typically, the map $\theta \mapsto P m_{\theta}$ has a unique global maximum at a point $\theta_{0}$, but we shall allow multiple points of maximum, and write $\Theta_{0}$ for the set $\left\{\theta_{0} \in \Theta: P m_{\theta_{0}}=\sup _{\theta} P m_{\theta}\right\}$ of all points at which $M$ attains its global maximum. The set $\Theta_{0}$ is assumed not empty. The maps $m_{\theta}: \mathcal{X} \mapsto \overline{\mathbb{R}}$ are allowed to take the value $-\infty$, but the following theorem assumes implicitly that at least $P m_{\theta_{0}}$ is finite.
5.14 Theorem. Let $\theta \mapsto m_{\theta}(x)$ be upper-semicontinuous for almost all $x$ and let (5.13) be satisfied. Then for any estimators $\hat{\theta}_{n}$ such that $M_{n}\left(\hat{\theta}_{n}\right) \geq M_{n}\left(\theta_{0}\right)-o_{P}(1)$ for some $\theta_{0} \in \Theta_{0}$, for every $\varepsilon>0$ and every compact set $K \subset \Theta$,

$$
\mathrm{P}\left(d\left(\hat{\theta}_{n}, \Theta_{0}\right) \geq \varepsilon \wedge \hat{\theta}_{n} \in K\right) \rightarrow 0
$$

Proof. If the function $\theta \mapsto P m_{\theta}$ is identically $-\infty$, then $\Theta_{0}=\Theta$, and there is nothing to prove. Hence, we may assume that there exists $\theta_{0} \in \Theta_{0}$ such that $P m_{\theta_{0}}>-\infty$, whence $P\left|m_{\theta_{0}}\right|<\infty$ by (5.13).

Fix some $\theta$ and let $U_{l} \downarrow \theta$ be a decreasing sequence of open balls around $\theta$ of diameter converging to zero. Write $m_{U}(x)$ for $\sup _{\theta \in U} m_{\theta}(x)$. The sequence $m_{U_{l}}$ is decreasing and greater than $m_{\theta}$ for every $l$. Combination with (5.12) yields that $m_{U_{l}} \downarrow m_{\theta}$ almost surely. In view of (5.13), we can apply the monotone convergence theorem and obtain that $P m_{U_{l}} \downarrow P m_{\theta}$ (which may be $-\infty$ ).

For $\theta \notin \Theta_{0}$, we have $P m_{\theta}<P m_{\theta_{0}}$. Combine this with the preceding paragraph to see that for every $\theta \notin \Theta_{0}$ there exists an open ball $U_{\theta}$ around $\theta$ with $P m_{U_{\theta}}<P m_{\theta_{0}}$. The set $B=\left\{\theta \in K: d\left(\theta, \Theta_{0}\right) \geq \varepsilon\right\}$ is compact and is covered by the balls $\left\{U_{\theta}: \theta \in B\right\}$. Let $U_{\theta_{1}}, \ldots, U_{\theta_{p}}$ be a finite subcover. Then, by the law of large numbers,

$$
\sup _{\theta \in B} \mathbb{P}_{n} m_{\theta} \leq \sup _{j=1, \ldots, p} \mathbb{P}_{n} m_{U_{\theta_{j}}} \xrightarrow{\text { as }} \sup _{j} P m_{U_{\theta_{j}}}<P m_{\theta_{0}} .
$$

If $\hat{\theta}_{n} \in B$, then $\sup _{\theta \in B} \mathbb{P}_{n} m_{\theta}$ is at least $\mathbb{P}_{n} m_{\hat{\theta}_{n}}$, which by definition of $\hat{\theta}_{n}$ is at least $\mathbb{P}_{n} m_{\theta_{0}}- o_{P}(1)=P m_{\theta_{0}}-o_{P}(1)$, by the law of large numbers. Thus

$$
\left\{\hat{\theta}_{n} \in B\right\} \subset\left\{\sup _{\theta \in B} \mathbb{P}_{n} m_{\theta} \geq P m_{\theta_{0}}-o_{P}(1)\right\}
$$

In view of the preceding display the probability of the event on the right side converges to zero as $n \rightarrow \infty$.

Even in simple examples, condition (5.13) can be restrictive. One possibility for relaxation is to divide the $n$ observations in groups of approximately the same size. Then (5.13)
may be replaced by, for some $k$ and every $k \leq l<2 k$,

$$
\begin{equation*}
P^{l} \sup _{\theta \in U} \sum_{i=1}^{l} m_{\theta}\left(x_{i}\right)<\infty . \tag{5.15}
\end{equation*}
$$

Surprisingly enough, this simple device may help. For instance, under condition (5.13) the preceding theorem does not apply to yield the asymptotic consistency of the maximum likelihood estimator of ( $\mu, \sigma$ ) based on a random sample from the $N\left(\mu, \sigma^{2}\right)$ distribution (unless we restrict the parameter set for $\sigma$ ), but under the relaxed condition it does (with $k=2$ ). (See Problem 5.25.) The proof of the theorem under (5.15) remains almost the same. Divide the $n$ observations in groups of $k$ observations and, possibly, a remainder group of $l$ observations; next, apply the law of large numbers to the approximately $n / k$ group sums.
5.16 Example (Cauchy likelihood). The maximum likelihood estimator for $\theta$ based on a random sample from the Cauchy distribution with location $\theta$ maximizes the map $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ for

$$
m_{\theta}(x)=-\log \left(1+(x-\theta)^{2}\right) .
$$

The natural parameter set $\mathbb{R}$ is not compact, but we can enlarge it to the extended real line, provided that we can define $m_{\theta}$ in a reasonable way for $\theta= \pm \infty$. To have the best chance of satisfying (5.13), we opt for the minimal extension, which in order to satisfy (5.12) is

$$
m_{-\infty}(x)=\limsup _{\theta \mapsto-\infty} m_{\theta}(x)=-\infty ; \quad m_{\infty}(x)=\limsup _{\theta \mapsto \infty} m_{\theta}(x)=-\infty .
$$

These infinite values should not worry us: They are permitted in the preceding theorem. Moreover, because we maximize $\theta \mapsto \mathbb{P}_{n} m_{\theta}$, they ensure that the estimator $\hat{\theta}_{n}$ never takes the values $\pm \infty$, which is excellent.

We apply Wald's theorem with $\Theta=\overline{\mathbb{R}}$, equipped with, for instance, the metric $d\left(\theta_{1}, \theta_{2}\right)= \left|\operatorname{arctg} \theta_{1}-\operatorname{arctg} \theta_{2}\right|$. Because the functions $\theta \mapsto m_{\theta}(x)$ are continuous and nonpositive, the conditions are trivially satisfied. Thus, taking $K=\overline{\mathbb{R}}$, we obtain that $d\left(\hat{\theta}_{n}, \Theta_{0}\right) \xrightarrow{\mathrm{P}} 0$. This conclusion is valid for any underlying distribution $P$ of the observations for which the set $\Theta_{0}$ is nonempty, because so far we have used the Cauchy likelihood only to motivate $m_{\theta}$.

To conclude that the maximum likelihood estimator in a Cauchy location model is consistent, it suffices to show that $\Theta_{0}=\left\{\theta_{0}\right\}$ if $P$ is the Cauchy distribution with center $\theta_{0}$. This follows most easily from the identifiability of this model, as discussed in Lemma 5.35.
5.17 Example (Current status data). Suppose that a "death" that occurs at time $T$ is only observed to have taken place or not at a known "check-up time" $C$. We model the observations as a random sample $X_{1}, \ldots, X_{n}$ from the distribution of $X=(C, 1\{T \leq C\})$, where $T$ and $C$ are independent random variables with completely unknown distribution functions $F$ and $G$, respectively. The purpose is to estimate the "survival distribution" $1-F$.

If $G$ has a density $g$ with respect to Lebesgue measure $\lambda$, then $X=(C, \Delta)$ has a density

$$
p_{F}(c, \delta)=(\delta F(c)+(1-\delta)(1-F)(c)) g(c)
$$

with respect to the product of $\lambda$ and counting measure on the set $\{0,1\}$. A maximum likelihood estimator for $F$ can be defined as the distribution function $\hat{F}$ that maximizes the likelihood

$$
F \mapsto \prod_{i=1}^{n}\left(\Delta_{i} F\left(C_{i}\right)+\left(1-\Delta_{i}\right)(1-F)\left(C_{i}\right)\right)
$$

over all distribution functions on $[0, \infty)$. Because this only involves the numbers $F\left(C_{1}\right)$, $\ldots, F\left(C_{n}\right)$, the maximizer of this expression is not unique, but some thought shows that there is a unique maximizer $\hat{F}$ that concentrates on (a subset of) the observation times $C_{1}, \ldots, C_{n}$. This is commonly used as an estimator.

We can show the consistency of this estimator by Wald's theorem. By its definition $\hat{F}$ maximizes the function $F \mapsto \mathbb{P}_{n} \log p_{F}$, but the consistency proof proceeds in a smoother way by setting

$$
m_{F}=\log \frac{p_{F}}{p_{\left(F+F_{0}\right) / 2}}=\log \frac{2 p_{F}}{p_{F}+p_{F_{0}}}
$$

Because the likelihood is bigger at $\hat{F}$ than it is at $\frac{1}{2} \hat{F}+\frac{1}{2} F_{0}$, it follows that $\mathbb{P}_{n} m_{\hat{F}} \geq 0= \mathbb{P}_{n} m_{F_{0}}$. (It is not claimed that $\hat{F}$ maximizes $F \mapsto \mathbb{P}_{n} m_{F}$; this is not true.)

Condition (5.13) is satisfied trivially, because $m_{F} \leq \log 2$ for every $F$. We can equip the set of all distribution functions with the topology of weak convergence. If we restrict the parameter set to distributions on a compact interval $[0, \tau]$, then the parameter set is compact by Prohorov's theorem. ${ }^{\dagger}$ The map $F \mapsto m_{F}(c, \delta)$ is continuous at $F$, relative to the weak topology, for every ( $c, \delta$ ) such that $c$ is a continuity point of $F$. Under the assumption that $G$ has a density, this includes almost every ( $c, \delta$ ), for every given $F$. Thus, Theorem 5.14 shows that $\hat{F}_{n}$ converges under $F_{0}$ in probability to the set $\mathcal{F}_{0}$ of all distribution functions that maximize the map $F \mapsto P_{F_{0}} m_{F}$, provided $F_{0} \in \mathcal{F}_{0}$. This set always contains $F_{0}$, but it does not necessarily reduce to this single point. For instance, if the density $g$ is zero on an interval [ $a, b$ ], then we receive no information concerning deaths inside the interval $[a, b]$, and there can be no hope that $\hat{F}_{n}$ converges to $F_{0}$ on $[a, b]$. In that case, $F_{0}$ is not "identifiable" on the interval $[a, b]$.

We shall show that $\mathcal{F}_{0}$ is the set of all $F$ such that $F=F_{0}$ almost everywhere according to $G$. Thus, the sequence $\hat{F}_{n}$ is consistent for $F_{0}$ "on the set of time points that have a positive probability of occurring."

Because $p_{F}=p_{F_{0}}$ under $P_{F_{0}}$ if and only if $F=F_{0}$ almost everywhere according to $G$, it suffices to prove that, for every pair of probability densities $p$ and $p_{0}, P_{0} \log 2 p /\left(p+p_{0}\right) \leq 0$ with equality if and only if $p=p_{0}$ almost surely under $P_{0}$. If $P_{0}(p=0)>0$, then $\log 2 p /\left(p+p_{0}\right)=-\infty$ with positive probability and hence, because the function is bounded above, $P_{0} \log 2 p /\left(p+p_{0}\right)=-\infty$. Thus we may assume that $P_{0}(p=0)=0$. Then, with $f(u)=-u \log \left(\frac{1}{2}+\frac{1}{2} u\right)$,

$$
P_{0} \log \frac{2 p}{\left(p+p_{0}\right)}=P f\left(\frac{p_{0}}{p}\right) \leq f\left(P \frac{p_{0}}{p}\right)=f(1)=0,
$$

[^5]by Jensen's inequality and the concavity of $f$, with equality only if $p_{0} / p=1$ almost surely under $P$, and then also under $P_{0}$. This completes the proof. $\square$

### 5.3 Asymptotic Normality

Suppose a sequence of estimators $\hat{\theta}_{n}$ is consistent for a parameter $\theta$ that ranges over an open subset of a Euclidean space. The next question of interest concerns the order at which the discrepancy $\hat{\theta}_{n}-\theta$ converges to zero. The answer depends on the specific situation, but for estimators based on $n$ replications of an experiment the order is often $n^{-1 / 2}$. Then multiplication with the inverse of this rate creates a proper balance, and the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ converges in distribution, most often a normal distribution. This is interesting from a theoretical point of view. It also makes it possible to obtain approximate confidence sets. In this section we derive the asymptotic normality of $M$-estimators.

We can use a characterization of $M$-estimators either by maximization or by solving estimating equations. Consider the second possibility. Let $X_{1}, \ldots, X_{n}$ be a sample from some distribution $P$, and let a random and a "true" criterion function be of the form:

$$
\Psi_{n}(\theta) \equiv \frac{1}{n} \sum_{i=1}^{n} \psi_{\theta}\left(X_{i}\right)=\mathbb{P}_{n} \psi_{\theta}, \quad \Psi(\theta)=P \psi_{\theta}
$$

Assume that the estimator $\hat{\theta}_{n}$ is a zero of $\Psi_{n}$ and converges in probability to a zero $\theta_{0}$ of $\Psi$. Because $\hat{\theta}_{n} \rightarrow \theta_{0}$, it makes sense to expand $\Psi_{n}\left(\hat{\theta}_{n}\right)$ in a Taylor series around $\theta_{0}$. Assume for simplicity that $\theta$ is one-dimensional. Then

$$
0=\Psi_{n}\left(\hat{\theta}_{n}\right)=\Psi_{n}\left(\theta_{0}\right)+\left(\hat{\theta}_{n}-\theta_{0}\right) \dot{\Psi}_{n}\left(\theta_{0}\right)+\frac{1}{2}\left(\hat{\theta}_{n}-\theta_{0}\right)^{2} \ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right),
$$

where $\tilde{\theta}_{n}$ is a point between $\hat{\theta}_{n}$ and $\theta_{0}$. This can be rewritten as

$$
\begin{equation*}
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=\frac{-\sqrt{n} \Psi_{n}\left(\theta_{0}\right)}{\dot{\Psi}_{n}\left(\theta_{0}\right)+\frac{1}{2}\left(\hat{\theta}_{n}-\theta_{0}\right) \ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)} . \tag{5.18}
\end{equation*}
$$

If $P \psi_{\theta_{0}}^{2}$ is finite, then the numerator $-\sqrt{n} \Psi_{n}\left(\theta_{0}\right)=-n^{-1 / 2} \sum \psi_{\theta_{0}}\left(X_{i}\right)$ is asymptotically normal by the central limit theorem. The asymptotic mean and variance are $P \psi_{\theta_{0}}= \Psi\left(\theta_{0}\right)=0$ and $P \psi_{\theta_{0}}^{2}$, respectively. Next consider the denominator. The first term $\dot{\Psi}_{n}\left(\theta_{0}\right)$ is an average and can be analyzed by the law of large numbers: $\dot{\Psi}_{n}\left(\theta_{0}\right) \xrightarrow{\mathrm{P}} P \dot{\psi}_{\theta_{0}}$, provided the expectation exists. The second term in the denominator is a product of $\hat{\theta}_{n}-\theta=o_{P}(1)$ and $\ddot{\psi}_{n}\left(\tilde{\theta}_{n}\right)$ and converges in probability to zero under the reasonable condition that $\ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)$ (which is also an average) is $O_{P}(1)$. Together with Slutsky's lemma, these observations yield

$$
\begin{equation*}
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right) \rightsquigarrow N\left(0, \frac{P \psi_{\theta_{0}}^{2}}{\left(P \dot{\psi}_{\theta_{0}}\right)^{2}}\right) . \tag{5.19}
\end{equation*}
$$

The preceding derivation can be made rigorous by imposing appropriate conditions, often called "regularity conditions." The only real challenge is to show that $\ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)=O_{P}(1)$ (see Problem 5.20 or section 5.6).

The derivation can be extended to higher-dimensional parameters. For a $k$-dimensional parameter, we use $k$ estimating equations. Then the criterion functions are maps $\Psi_{n}: \mathbb{R}^{k} \mapsto$
$\mathbb{R}^{k}$ and the derivatives $\dot{\Psi}_{n}\left(\theta_{0}\right)$ are ( $k \times k$ )-matrices that converge to the ( $k \times k$ ) matrix $P \dot{\psi}_{\theta_{0}}$ with entries $P \partial / \partial \theta_{j} \psi_{\theta_{0}, i}$. The final statement becomes

$$
\begin{equation*}
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right) \rightsquigarrow N_{k}\left(0,\left(P \dot{\psi}_{\theta_{0}}\right)^{-1} P \psi_{\theta_{0}} \psi_{\theta_{0}}^{T}\left(P \dot{\psi}_{\theta_{0}}^{T}\right)^{-1}\right) \tag{5.20}
\end{equation*}
$$

Here the invertibility of the matrix $P \dot{\psi}_{\theta_{0}}$ is a condition.
In the preceding derivation it is implicitly understood that the function $\theta \mapsto \psi_{\theta}(x)$ possesses two continuous derivatives with respect to the parameter, for every $x$. This is true in many examples but fails, for instance, for the function $\psi_{\theta}(x)=\operatorname{sign}(x-\theta)$, which yields the median. Nevertheless, the median is asymptotically normal. That such a simple, but important, example cannot be treated by the preceding approach has motivated much effort to derive the asymptotic normality of $M$-estimators by more refined methods. One result is the following theorem, which assumes less than one derivative (a Lipschitz condition) instead of two derivatives.
5.21 Theorem. For each $\theta$ in an open subset of Euclidean space, let $x \mapsto \psi_{\theta}(x)$ be a measurable vector-valued function such that, for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\theta_{0}$ and a measurable function $\dot{\psi}$ with $P \dot{\psi}^{2}<\infty$,

$$
\left\|\psi_{\theta_{1}}(x)-\psi_{\theta_{2}}(x)\right\| \leq \dot{\psi}(x)\left\|\theta_{1}-\theta_{2}\right\|
$$

Assume that $P\left\|\psi_{\theta_{0}}\right\|^{2}<\infty$ and that the map $\theta \mapsto P \psi_{\theta}$ is differentiable at a zero $\theta_{0}$, with nonsingular derivative matrix $V_{\theta_{0}}$. If $\mathbb{P}_{n} \psi_{\hat{\theta}_{n}}=o_{P}\left(n^{-1 / 2}\right)$, and $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$, then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V_{\theta_{0}}^{-1} \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \psi_{\theta_{0}}\left(X_{i}\right)+o_{P}(1)
$$

In particular, the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with mean zero and covariance matrix $V_{\theta_{0}}^{-1} P \psi_{\theta_{0}} \psi_{\theta_{0}}^{T}\left(V_{\theta_{0}}^{-1}\right)^{T}$.

Proof. For a fixed measurable function $f$, we abbreviate $\sqrt{n}\left(\mathbb{P}_{n}-P\right) f$ to $\mathbb{G}_{n} f$, the empirical process evaluated at $f$. The consistency of $\hat{\theta}_{n}$ and the Lipschitz condition on the maps $\theta \mapsto \psi_{\theta}$ imply that

$$
\begin{equation*}
\mathbb{G}_{n} \psi_{\hat{\theta}_{n}}-\mathbb{G}_{n} \psi_{\theta_{0}} \xrightarrow{\mathrm{P}} 0 . \tag{5.22}
\end{equation*}
$$

For a nonrandom sequence $\hat{\theta}_{n}$ this is immediate from the fact that the means of these variables are zero, while the variances are bounded by $P\left\|\psi_{\theta_{n}}-\psi_{\theta_{0}}\right\|^{2} \leq P \dot{\psi}^{2}\left\|\theta_{n}-\theta_{0}\right\|^{2}$ and hence converge to zero. A proof for estimators $\hat{\theta}_{n}$ under the present mild conditions takes more effort. The appropriate tools are developed in Chapter 19. In Example 19.7 it is seen that the functions $\psi_{\theta}$ form a Donsker class. Next, (5.22) follows from Lemma 19.24. Here we accept the convergence as a fact and give the remainder of the proof.

By the definitions of $\hat{\theta}_{n}$ and $\theta_{0}$, we can rewrite $\mathbb{G}_{n} \psi_{\hat{\theta}_{n}}$ as $\sqrt{n} P\left(\psi_{\theta_{0}}-\psi_{\hat{\theta}_{n}}\right)+o_{P}(1)$. Combining this with the delta method (or Lemma 2.12) and the differentiability of the map $\theta \mapsto P \psi_{\theta}$, we find that

$$
\sqrt{n} V_{\theta_{0}}\left(\theta_{0}-\hat{\theta}_{n}\right)+\sqrt{n} o_{P}\left(\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right)=\mathbb{G}_{n} \psi_{\theta_{0}}+o_{P}(1)
$$

In particular, by the invertibility of the matrix $V_{\theta_{0}}$,

$$
\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\| \leq\left\|V_{\theta_{0}}^{-1}\right\| \sqrt{n}\left\|V_{\theta_{0}}\left(\hat{\theta}_{n}-\theta_{0}\right)\right\|=O_{P}(1)+o_{P}\left(\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right) .
$$

This implies that $\hat{\theta}_{n}$ is $\sqrt{n}$-consistent: The left side is bounded in probability. Inserting this in the previous display, we obtain that $\sqrt{n} V_{\theta_{0}}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\mathbb{G}_{n} \psi_{\theta_{0}}+o_{P}(1)$. We conclude the proof by taking the inverse $V_{\theta_{0}}^{-1}$ left and right. Because matrix multiplication is a continous map, the inverse of the remainder term still converges to zero in probability.

The preceding theorem is a reasonable compromise between simplicity and general applicability, but, unfortunately, it does not cover the sample median. Because the function $\theta \mapsto \operatorname{sign}(x-\theta)$ is not Lipschitz, the Lipschitz condition is apparently still stronger than necessary. Inspection of the proof shows that it is used only to ensure (5.22). It is seen in Lemma 19.24, that (5.22) can be ascertained under the weaker conditions that the collection of functions $x \mapsto \psi_{\theta}(x)$ are a "Donsker class" and that the map $\theta \mapsto \psi_{\theta}$ is continuous in probability. The functions $\operatorname{sign}(x-\theta)$ do satisfy these conditions, but a proof and the definition of a Donsker class are deferred to Chapter 19.

If the functions $\theta \mapsto \psi_{\theta}(x)$ are continuously differentiable, then the natural candidate for $\dot{\psi}(x)$ is $\sup _{\theta}\left\|\dot{\psi}_{\theta}\right\|$, with the supremum taken over a neighborhood of $\theta_{0}$. Then the main condition is that the partial derivatives are "locally dominated" by a square-integrable function: There should exist a square-integrable function $\dot{\psi}$ with $\left\|\dot{\psi}_{\theta}\right\| \leq \dot{\psi}$ for every $\theta$ close to $\theta_{0}$. If $\theta \mapsto \dot{\psi}_{\theta}(x)$ is also continuous at $\theta_{0}$, then the dominated-convergence theorem readily yields that $V_{\theta_{0}}=P \dot{\psi}_{\theta_{0}}$.

The properties of $M$ estimators can typically be obtained under milder conditions by using their characterization as maximizers. The following theorem is in the same spirit as the preceding one but does cover the median. It concerns $M$-estimators defined as maximizers of a criterion function $\theta \mapsto \mathbb{P}_{n} m_{\theta}$, which are assumed to be consistent for a point of maximum $\theta_{0}$ of the function $\theta \mapsto P m_{\theta}$. If the latter function is twice continuously differentiable at $\theta_{0}$, then, of course, it allows a two-term Taylor expansion of the form

$$
P m_{\theta}=P m_{\theta_{0}}+\frac{1}{2}\left(\theta-\theta_{0}\right)^{T} V_{\theta_{0}}\left(\theta-\theta_{0}\right)+o\left(\left\|\theta-\theta_{0}\right\|^{2}\right) .
$$

It is this expansion rather than the differentiability that is needed in the following theorem.
5.23 Theorem. For each $\theta$ in an open subset of Euclidean space let $x \mapsto m_{\theta}(x)$ be a measurable function such that $\theta \mapsto m_{\theta}(x)$ is differentiable at $\theta_{0}$ for $P$-almost every $x^{\dagger}$ with derivative $\dot{m}_{\theta_{0}}(x)$ and such that, for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\theta_{0}$ and a measurable function $\dot{m}$ with $P \dot{m}^{2}<\infty$

$$
\left|m_{\theta_{1}}(x)-m_{\theta_{2}}(x)\right| \leq \dot{m}(x)\left\|\theta_{1}-\theta_{2}\right\| .
$$

Furthermore, assume that the map $\theta \mapsto P m_{\theta}$ admits a second-order Taylor expansion at a point of maximum $\theta_{0}$ with nonsingular symmetric second derivative matrix $V_{\theta_{0}}$. If $\mathbb{P}_{n} m_{\hat{\theta}_{n}} \geq \sup _{\theta} \mathbb{P}_{n} m_{\theta}-o_{P}\left(n^{-1}\right)$ and $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$, then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V_{\theta_{0}}^{-1} \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{m}_{\theta_{0}}\left(X_{i}\right)+o_{P}(1) .
$$

[^6]In particular, the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with mean zero and covariance matrix $V_{\theta_{0}}^{-1} P \dot{m}_{\theta_{0}} \dot{m}_{\theta_{0}}^{T} V_{\theta_{0}}^{-1}$.
*Proof. The Lipschitz property and the differentiability of the maps $\theta \mapsto m_{\theta}$ imply that, for every random sequence $\tilde{h}_{n}$ that is bounded in probability,

$$
\mathbb{G}_{n}\left[\sqrt{n}\left(m_{\theta_{0}+\tilde{h}_{n} / \sqrt{n}}-m_{\theta_{0}}\right)-\tilde{h}_{n}^{T} \dot{m}_{\theta_{0}}\right] \xrightarrow{\mathrm{P}} 0 .
$$

For nonrandom sequences $\tilde{h}_{n}$ this follows, because the variables have zero means, and variances that converge to zero, by the dominated convergence theorem. For general sequences $\tilde{h}_{n}$ this follows from Lemma 19.31.

A second fact that we need and that is proved subsequently is the $\sqrt{n}$-consistency of the sequence $\hat{\theta}_{n}$. By Corollary 5.53, the Lipschitz condition, and the twice differentiability of the map $\theta \mapsto P m_{\theta}$, the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ is bounded in probability.

The remainder of the proof is self-contained. In view of the twice differentiability of the map $\theta \mapsto P m_{\theta}$, the preceding display can be rewritten as

$$
n \mathbb{P}_{n}\left(m_{\theta_{0}+\tilde{h}_{n} / \sqrt{n}}-m_{\theta_{0}}\right)=\frac{1}{2} \tilde{h}_{n}^{T} V_{\theta_{0}} \tilde{h}_{n}+\tilde{h}_{n}^{T} \mathbb{G}_{n} \dot{m}_{\theta_{0}}+o_{P}(1)
$$

Because the sequence $\hat{\theta}_{n}$ is $\sqrt{n}$-consistent, this is valid both for $\tilde{h}_{n}$ equal to $\hat{h}_{n}=\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ and for $\tilde{h}_{n}=-V_{\theta_{0}}^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}$. After simple algebra in the second case, we obtain the equations

$$
\begin{aligned}
n \mathbb{P}_{n}\left(m_{\theta_{0}+\hat{h}_{n} / \sqrt{n}}-m_{\theta_{0}}\right) & =\frac{1}{2} \hat{h}_{n}^{T} V_{\theta_{0}} \hat{h}_{n}+\hat{h}_{n}^{T} \mathbb{G}_{n} \dot{m}_{\theta_{0}}+o_{P}(1), \\
n \mathbb{P}_{n}\left(m_{\theta_{0}-V_{\theta_{0}}^{-1}} \mathbb{G}_{n} \dot{m}_{\theta_{0}} / \sqrt{n}\right. & \left.-m_{\theta_{0}}\right) \\
& =-\frac{1}{2} \mathbb{G}_{n} \dot{m}_{\theta_{0}}^{T} V_{\theta_{0}}^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}+o_{P}(1),
\end{aligned}
$$

By the definition of $\hat{\theta}_{n}$, the left side of the first equation is larger than the left side of the second equation (up to $o_{P}(1)$ ) and hence the same relation is true for the right sides. Take the difference, complete the square, and conclude that

$$
\frac{1}{2}\left(\hat{h}_{n}+V_{\theta_{0}}^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}\right)^{T} V_{\theta_{0}}\left(\hat{h}_{n}+V_{\theta_{0}}^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}\right)+o_{P}(1) \geq 0 .
$$

Because the matrix $V_{\theta_{0}}$ is strictly negative-definite, the quadratic form must converge to zero in probability. The same must be true for $\left\|\hat{h}_{n}+V_{\theta_{0}}^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}\right\|$.

The assertions of the preceding theorems must be in agreement with each other and also with the informal derivation leading to (5.20). If $\theta \mapsto m_{\theta}(x)$ is differentiable, then a maximizer of $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ typically solves $\mathbb{P}_{n} \psi_{\theta}=0$ for $\psi_{\theta}=\dot{m}_{\theta}$. Then the theorems and (5.20) are in agreement provided that

$$
V_{\theta}=\frac{\partial^{2}}{\partial \theta^{2}} P m_{\theta}=\frac{\partial}{\partial \theta} P \psi_{\theta}=P \dot{\psi}_{\theta}=P \ddot{m}_{\theta}
$$

This involves changing the order of differentiation (with respect to $\theta$ ) and integration (with respect to $x$ ), and is usually permitted. However, for instance, the second derivative of $P m_{\theta}$ may exist without $\theta \mapsto m_{\theta}(x)$ being differentiable for all $x$, as is seen in the following example.
5.24 Example (Median). The sample median maximizes the criterion function $\theta \mapsto -\sum_{i=1}^{n}\left|X_{i}-\theta\right|$. Assume that the distribution function $F$ of the observations is differentiable

![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-072.jpg?height=2989&width=3967&top_left_y=562&top_left_x=885)
Figure 5.3. The distribution function of the sample median (dotted curve) and its normal approximation for a sample of size 25 from the Laplace distribution.

at its median $\theta_{0}$ with positive derivative $f\left(\theta_{0}\right)$. Then the sample median is asymptotically normal.

This follows from Theorem 5.23 applied with $m_{\theta}(x)=|x-\theta|-|x|$. As a consequence of the triangle inequality, this function satisfies the Lipschitz condition with $\dot{m}(x) \equiv 1$. Furthermore, the map $\theta \mapsto m_{\theta}(x)$ is differentiable at $\theta_{0}$ except if $x=\theta_{0}$, with $\dot{m}_{\theta_{0}}(x)= -\operatorname{sign}\left(x-\theta_{0}\right)$. By partial integration,

$$
P m_{\theta}=\theta F(0)+\int_{(0, \theta]}(\theta-2 x) d F(x)-\theta(1-F(\theta))=2 \int_{0}^{\theta} F(x) d x-\theta .
$$

If $F$ is sufficiently regular around $\theta_{0}$, then $P m_{\theta}$ is twice differentiable with first derivative $2 F(\theta)-1$ (which vanishes at $\theta_{0}$ ) and second derivative $2 f(\theta)$. More generally, under the minimal condition that $F$ is differentiable at $\theta_{0}$, the function $P m_{\theta}$ has a Taylor expansion $P m_{\theta_{0}}+\frac{1}{2}\left(\theta-\theta_{0}\right)^{2} 2 f\left(\theta_{0}\right)+o\left(\left|\theta-\theta_{0}\right|^{2}\right)$, so that we set $V_{\theta_{0}}=2 f\left(\theta_{0}\right)$. Because $P \dot{m}_{\theta_{0}}^{2} =\mathrm{E} 1=1$, the asymptotic variance of the median is $1 /\left(2 f\left(\theta_{0}\right)\right)^{2}$. Figure 5.3 gives an impression of the accuracy of the approximation. $\square$
5.25 Example (Misspecified model). Suppose an experimenter postulates a model $\left\{p_{\theta}: \theta\right. \in \Theta\}$ for a sample of observations $X_{1}, \ldots, X_{n}$. However, the model is misspecified in that the true underlying distribution does not belong to the model. The experimenter decides to use the postulated model anyway, and obtains an estimate $\hat{\theta}_{n}$ from maximizing the likelihood $\sum \log p_{\theta}\left(X_{i}\right)$. What is the asymptotic behaviour of $\hat{\theta}_{n}$ ?

At first sight, it might appear that $\hat{\theta}_{n}$ would behave erratically due to the use of the wrong model. However, this is not the case. First, we expect that $\hat{\theta}_{n}$ is asymptotically consistent for a value $\theta_{0}$ that maximizes the function $\theta \mapsto P \log p_{\theta}$, where the expectation is taken under the true underlying distribution $P$. The density $p_{\theta_{0}}$ can be viewed as the "projection"
of the true underlying distribution $P$ on the model using the Kullback-Leibler divergence, which is defined as $-P \log \left(p_{\theta} / p\right)$, as a "distance" measure: $p_{\theta_{0}}$ minimizes this quantity over all densities in the model. Second, we expect that $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with mean zero and covariance matrix

$$
V_{\theta_{0}}^{-1} P \dot{\ell}_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{T} V_{\theta_{0}}^{-1} .
$$

Here $\ell_{\theta}=\log p_{\theta}$, and $V_{\theta_{0}}$ is the second derivative matrix of the map $\theta \mapsto P \log p_{\theta}$. The preceding theorem with $m_{\theta}=\log p_{\theta}$ gives sufficient conditions for this to be true.

The asymptotics give insight into the practical value of the experimenter's estimate $\hat{\theta}_{n}$. This depends on the specific situation. However, if the model is not too far off from the truth, then the estimated density $p_{\hat{\theta}_{n}}$ may be a reasonable approximation for the true density.
5.26 Example (Exponential frailty model). Suppose that the observations are a random sample $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ of pairs of survival times. For instance, each $X_{i}$ is the survival time of a "father" and $Y_{i}$ the survival time of a "son." We assume that given an unobservable value $z_{i}$, the survival times $X_{i}$ and $Y_{i}$ are independent and exponentially distributed with parameters $z_{i}$ and $\theta z_{i}$, respectively. The value $z_{i}$ may be different for each observation. The problem is to estimate the ratio $\theta$ of the parameters.

To fit this example into the i.i.d. set-up of this chapter, we assume that the values $z_{1}, \ldots, z_{n}$ are realizations of a random sample $Z_{1}, \ldots, Z_{n}$ from some given distribution (that we do not have to know or parametrize).

One approach is based on the sufficiency of the variable $X_{i}+\theta Y_{i}$ for $z_{i}$ in the case that $\theta$ is known. Given $Z_{i}=z$, this "statistic" possesses the gamma-distribution with shape parameter 2 and scale parameter $z$. Corresponding to this, the conditional density of an observation $(X, Y)$ factorizes, for a given $z$, as $h_{\theta}(x, y) g_{\theta}(x+\theta y \mid z)$, for $g_{\theta}(s \mid z)= z^{2} s e^{-z s}$ the gamma-density and

$$
h_{\theta}(x, y)=\frac{\theta}{x+\theta y} .
$$

Because the density of $X_{i}+\theta Y_{i}$ depends on the unobservable value $z_{i}$, we might wish to discard the factor $g_{\theta}(s \mid z)$ from the likelihood and use the factor $h_{\theta}(x, y)$ only. Unfortunately, this "conditional likelihood" does not behave as an ordinary likelihood, in that the corresponding "conditional likelihood equation," based on the function $\dot{h}_{\theta} / h_{\theta}(x, y)= \partial / \partial \theta \log h_{\theta}(x, y)$, does not have mean zero under $\theta$. The bias can be corrected by conditioning on the sufficient statistic. Let

$$
\psi_{\theta}(X, Y)=2 \theta \frac{\dot{h}_{\theta}}{h_{\theta}}(X, Y)-2 \theta \mathrm{E}_{\theta}\left(\left.\frac{\dot{h}_{\theta}}{h_{\theta}}(X, Y) \right\rvert\, X+\theta Y\right)=\frac{X-\theta Y}{X+\theta Y} .
$$

Next define an estimator $\hat{\theta}_{n}$ as the solution of $\mathbb{P}_{n} \psi_{\theta}=0$.
This works fairly nicely. Because the function $\theta \mapsto \psi_{\theta}(x, y)$ is continuous, and decreases strictly from 1 to -1 on ( $0, \infty$ ) for every $x, y>0$, the equation $\mathbb{P}_{n} \psi_{\theta}=0$ has a unique solution. The sequence of solutions $\hat{\theta}_{n}$ can be seen to be consistent by Lemma 5.10. By straightforward calculation, as $\theta \rightarrow \theta_{0}$,

$$
P_{\theta_{0}} \psi_{\theta}=-\frac{\theta+\theta_{0}}{\theta-\theta_{0}}-\frac{2 \theta \theta_{0}}{\left(\theta-\theta_{0}\right)^{2}} \log \frac{\theta_{0}}{\theta}=\frac{1}{3 \theta_{0}}\left(\theta_{0}-\theta\right)+o\left(\theta_{0}-\theta\right) .
$$

Hence the zero of $\theta \mapsto P_{\theta_{0}} \psi_{\theta}$ is taken uniquely at $\theta=\theta_{0}$. Next, the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ can be shown to be asymptotically normal by Theorem 5.21. In fact, the functions $\dot{\psi}_{\theta}(x, y)$ are uniformly bounded in $x, y>0$ and $\theta$ ranging over compacta in ( $0, \infty$ ), so that, by the mean value theorem, the function $\dot{\psi}$ in this theorem may be taken equal to a constant.

On the other hand, although this estimator is easy to compute, it can be shown that it is not asymptotically optimal. In Chapter 25 on semiparametric models, we discuss estimators with a smaller asymptotic variance.
5.27 Example (Nonlinear least squares). Suppose that we observe a random sample ( $X_{1}$, $\left.Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ from the distribution of a vector ( $X, Y$ ) that follows the regression model

$$
Y=f_{\theta_{0}}(X)+e, \quad \mathrm{E}(e \mid X)=0 .
$$

Here $f_{\theta}$ is a parametric family of regression functions, for instance $f_{\theta}(x)=\theta_{1}+\theta_{2} e^{\theta_{3} x}$, and we aim at estimating the unknown vector $\theta$. (We assume that the independent variables are a random sample in order to fit the example in our i.i.d. notation, but the analysis could be carried out conditionally as well.) The least squares estimator that minimizes

$$
\theta \mapsto \sum_{i=1}^{n}\left(Y_{i}-f_{\theta}\left(X_{i}\right)\right)^{2}
$$

is an $M$-estimator for $m_{\theta}(x, y)=\left(y-f_{\theta}(x)\right)^{2}$ (or rather minus this function). It should be expected to converge to the minimizer of the limit criterion function

$$
\theta \mapsto P m_{\theta}=P\left(f_{\theta_{0}}-f_{\theta}\right)^{2}+\mathrm{E} e^{2} .
$$

Thus the least squares estimator should be consistent if $\theta_{0}$ is identifiable from the model, in the sense that $\theta \neq \theta_{0}$ implies that $f_{\theta}(X) \neq f_{\theta_{0}}(X)$ with positive probability.

For sufficiently regular regression models, we have

$$
P m_{\theta} \approx P\left(\left(\theta-\theta_{0}\right)^{T} \dot{f}_{\theta_{0}}\right)^{2}+\mathrm{E} e^{2} .
$$

This suggests that the conditions of Theorem 5.23 are satisfied with $V_{\theta_{0}}=2 P \dot{f}_{\theta_{0}} \dot{f}_{\theta_{0}}^{T}$ and $\dot{m}_{\theta_{0}}(x, y)=-2\left(y-f_{\theta_{0}}(x)\right) \dot{f}_{\theta_{0}}(x)$. If $e$ and $X$ are independent, then this leads to the asymptotic covariance matrix $V_{\theta_{0}}^{-1} 2 \mathrm{E} e^{2}$.

Besides giving the asymptotic normality of $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$, the preceding theorems give an asymptotic representation

$$
\hat{\theta}_{n}=\theta_{0}+\frac{1}{n} \sum_{i=1}^{n} V_{\theta_{0}}^{-1} \psi_{\theta_{0}}\left(X_{i}\right)+o_{P}\left(\frac{1}{\sqrt{n}}\right)
$$

If we neglect the remainder term, ${ }^{\dagger}$ then this means that $\hat{\theta}_{n}-\theta_{0}$ behaves as the average of the variables $V_{\theta_{0}}^{-1} \psi_{\theta_{0}}\left(X_{i}\right)$. Then the (asymptotic) "influence" of the $n$th observation on the

[^7]value of $\hat{\theta}_{n}$ can be computed as
$$
\begin{aligned}
\hat{\theta}_{n}\left(X_{1}, \ldots, X_{n}\right)-\hat{\theta}_{n-1}\left(X_{1}, \ldots, X_{n-1}\right) & \approx \frac{1}{n} V_{\theta_{0}}^{-1} \psi_{\theta_{0}}\left(X_{n}\right)-\frac{1}{n(n-1)} \sum_{i=1}^{n-1} V_{\theta_{0}}^{-1} \psi_{\theta_{0}}\left(X_{i}\right) \\
& =\frac{1}{n} V_{\theta_{0}}^{-1} \psi_{\theta_{0}}\left(X_{n}\right)+o_{P}\left(\frac{1}{n}\right) .
\end{aligned}
$$

Because the "influence" of an extra observation $x$ is proportional to $V_{\theta}^{-1} \psi_{\theta}(x)$, the function $x \mapsto V_{\theta}^{-1} \psi_{\theta}(x)$ is called the asymptotic influence function of the estimator $\hat{\theta}_{n}$. Influence functions can be defined for many other estimators as well, but the method of $Z$-estimation is particularly convenient to obtain estimators with given influence functions. Because $V_{\theta_{0}}$ is a constant (matrix), any shape of influence function can be obtained by simply choosing the right functions $\psi_{\theta}$.

For the purpose of robust estimation, perhaps the most important aim is to bound the influence of each individual observation. Thus, a $Z$-estimator is called $B$-robust if the function $\psi_{\theta}$ is bounded.
5.28 Example (Robust regression). Consider a random sample of observations ( $X_{1}, Y_{1}$ ), $\ldots,\left(X_{n}, Y_{n}\right)$ following the linear regression model

$$
Y_{i}=\theta_{0}^{T} X_{i}+e_{i},
$$

for i.i.d. errors $e_{1}, \ldots, e_{n}$ that are independent of $X_{1}, \ldots, X_{n}$. The classical estimator for the regression parameter $\theta$ is the least squares estimator, which minimizes $\sum_{i=1}^{n}\left(Y_{i}-\theta^{T} X_{i}\right)^{2}$. Outlying values of $X_{i}$ ("leverage points") or extreme values of ( $X_{i}, Y_{i}$ ) jointly ("influence points") can have an arbitrarily large influence on the value of the least-squares estimator, which therefore is nonrobust. As in the case of location estimators, a more robust estimator for $\theta$ can be obtained by replacing the square by a function $m(x)$ that grows less rapidly as $x \rightarrow \infty$, for instance $m(x)=|x|$ or $m(x)$ equal to the primitive function of Huber's $\psi$. Usually, minimizing an expression of the type $\sum_{i=1}^{n} m\left(Y_{i}-\theta X_{i}\right)$ is equivalent to solving a system of equations

$$
\sum_{i=1}^{n} \psi\left(Y_{i}-\theta^{T} X_{i}\right) X_{i}=0 .
$$

Because $\mathrm{E} \psi\left(Y-\theta_{0}^{T} X\right) X=\mathrm{E} \psi(e) \mathrm{E} X$, we can expect the resulting estimator to be consistent provided $\mathrm{E} \psi(e)=0$. Furthermore, we should expect that, for $V_{\theta_{0}}=\mathrm{E} \psi^{\prime}(e) X X^{T}$,

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=\frac{1}{\sqrt{n}} V_{\theta_{0}}^{-1} \sum_{i=1}^{n} \psi\left(Y_{i}-\theta_{0}^{T} X_{i}\right) X_{i}+o_{P}(1) .
$$

Consequently, even for a bounded function $\psi$, the influence function $(x, y) \mapsto V_{\theta}^{-1} \psi(y- \left.\theta^{T} x\right) x$ may be unbounded, and an extreme value of an $X_{i}$ may still have an arbitrarily large influence on the estimate (asymptotically). Thus, the estimators obtained in this way are protected against influence points but may still suffer from leverage points and hence are only partly robust. To obtain fully robust estimators, we can change the estimating
equations to

$$
\sum_{i=1}^{n} \psi\left(\left(Y_{i}-\theta^{T} X_{i}\right) v\left(X_{i}\right)\right) w\left(X_{i}\right)=0 .
$$

Here we protect against leverage points by choosing $w$ bounded. For more flexibility we have also allowed a weighting factor $v\left(X_{i}\right)$ inside $\psi$. The choices $\psi(x)=x, v(x)=1$ and $w(x)=x$ correspond to the (nonrobust) least-squares estimator.

The solution $\hat{\theta}_{n}$ of our final estimating equation should be expected to be consistent for the solution of

$$
0=\mathrm{E} \psi\left(\left(Y-\theta^{T} X\right) v(X)\right) w(X)=\mathrm{E} \psi\left(\left(e+\theta_{0}^{T} X-\theta^{T} X\right) v(X)\right) w(X)
$$

If the function $\psi$ is odd and the error symmetric, then the true value $\theta_{0}$ will be a solution whenever $e$ is symmetric about zero, because then $\mathrm{E} \psi(e \sigma)=0$ for every $\sigma$.

Precise conditions for the asymptotic normality of $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ can be obtained from Theorems 5.21 and 5.9. The verification of the conditions of Theorem 5.21, which are "local" in nature, is relatively easy, and, if necessary, the Lipschitz condition can be relaxed by using results on empirical processes introduced in Chapter 19 directly. Perhaps proving the consistency of $\hat{\theta}_{n}$ is harder. The biggest technical problem may be to show that $\hat{\theta}_{n}=O_{P}(1)$, so it would help if $\theta$ could a priori be restricted to a bounded set. On the other hand, for bounded functions $\psi$, the case of most interest in the present context, the functions $(x, y) \mapsto \psi\left(\left(y-\theta^{T} x\right) v(x)\right) w(x)$ readily form a Glivenko-Cantelli class when $\theta$ ranges freely, so that verification of the strong uniqueness of $\theta_{0}$ as a zero becomes the main challenge when applying Theorem 5.9. This leads to a combination of conditions on $\psi, v$, $w$, and the distributions of $e$ and $X$.
5.29 Example (Optimal robust estimators). Every sufficiently regular function $\psi$ defines a location estimator $\hat{\theta}_{n}$ through the equation $\sum_{i=1}^{n} \psi\left(X_{i}-\theta\right)=0$. In order to choose among the different estimators, we could compare their asymptotic variances and use the one with the smallest variance under the postulated (or estimated) distribution $P$ of the observations. On the other hand, if we also wish to guard against extreme obervations, then we should find a balance between robustness and asymptotic variance. One possibility is to use the estimator with the smallest asymptotic variance at the postulated, ideal distribution $P$ under the side condition that its influence function be uniformly bounded by some constant $c$. In this example we show that for $P$ the normal distribution, this leads to the Huber estimator.

The $Z$-estimator is consistent for the solution $\theta_{0}$ of the equation $P \psi(\cdot-\theta)=\mathrm{E} \psi\left(X_{1}-\right. \theta)=0$. Suppose that we fix an underlying, ideal $P$ whose "location" $\theta_{0}$ is zero. Then the problem is to find $\psi$ that minimizes the asymptotic variance $P \psi^{2} /\left(P \psi^{\prime}\right)^{2}$ under the two side conditions, for a given constant $c$,

$$
\sup _{x}\left|\frac{\psi(x)}{P \psi^{\prime}}\right| \leq c, \quad \text { and } \quad P \psi=0 .
$$

The problem is homogeneous in $\psi$, and hence we may assume that $P \psi^{\prime}=1$ without loss of generality. Next, minimization of $P \psi^{2}$ under the side conditions $P \psi=0, P \psi^{\prime}=1$ and $\|\psi\|_{\infty} \leq c$ can be achieved by using Lagrange multipliers, as in problem 14.6 This leads to minimizing

$$
P \psi^{2}+\lambda P \psi+\mu\left(P \psi^{\prime}-1\right)=P\left(\psi^{2}+\psi\left(\lambda+\mu\left(p^{\prime} / p\right)\right)-\mu\right)
$$

for fixed "multipliers" $\lambda$ and $\mu$ under the side condition $\|\psi\|_{\infty} \leq c$ with respect to $\psi$. This expectation is minimized by minimizing the integrand pointwise, for every fixed $x$. Thus the minimizing $\psi$ has the property that, for every $x$ separately, $y=\psi(x)$ minimizes the parabola $y^{2}+\lambda y+\mu y\left(p^{\prime} / p\right)(x)$ over $y \in[-c, c]$. This readily gives the solution, with $[y]_{c}^{d}$ the value $y$ truncated to the interval $[c, d]$,

$$
\psi(x)=\left[-\frac{1}{2} \lambda-\frac{1}{2} \mu \frac{p^{\prime}}{p}(x)\right]_{-c}^{c} .
$$

The constants $\lambda$ and $\mu$ can be solved from the side conditions $P \psi=0$ and $P \psi^{\prime}=1$. The normal distribution $P=\Phi$ has location score function $p^{\prime} / p(x)=-x$, and by symmetry it follows that $\lambda=0$ in this case. Then the optimal $\psi$ reduces to Huber's $\psi$ function.

## *5.4 Estimated Parameters

In many situations, the estimating equations for the parameters of interest contain preliminary estimates for "nuisance parameters." For example, many robust location estimators are defined as the solutions of equations of the type

$$
\begin{equation*}
\sum_{i=1}^{n} \psi\left(\frac{X_{i}-\theta}{\hat{\sigma}}\right)=0 \tag{5.30}
\end{equation*}
$$

Here $\hat{\sigma}$ is an initial (robust) estimator of scale, which is meant to stabilize the robustness of the location estimator. For instance, the "cut-off" parameter $k$ in Huber's $\psi$-function determines the amount of robustness of Huber's estimator, but the effect of a particular choice of $k$ on bounding the influence of outlying observations is relative to the range of the observations. If the observations are concentrated in the interval $[-k, k]$, then Huber's $\psi$ yields nothing else but the sample mean, if all observations are outside $[-k, k]$, we get the median. Scaling the observations to a standard scale gives a clear meaning to the value of $k$. The use of the median absolute deviation from the median (see. section 21.3) is often recommended for this purpose.

If the scale estimator is itself a $Z$-estimator, then we can treat the pair $(\hat{\theta}, \hat{\sigma})$ as a $Z$ estimator for a system of equations, and next apply the preceding theorems. More generally, we can apply the following result. In this subsection we allow a condition in terms of Donsker classes, which are discussed in Chapter 19. The proof of the following theorem follows the same steps as the proof of Theorem 5.21.
5.31 Theorem. For each $\theta$ in an open subset of $\mathbb{R}^{k}$ and each $\eta$ in a metric space, let $x \mapsto \psi_{\theta, \eta}(x)$ be an $\mathbb{R}^{k}$-valued measurable function such that the class of functions $\left\{\psi_{\theta, \eta}: \| \theta-\right. \left.\theta_{0} \|<\delta, d\left(\eta, \eta_{o}\right)<\delta\right\}$ is Donsker for some $\delta>0$, and such that $P\left\|\psi_{\theta, \eta}-\psi_{\theta_{0}, \eta_{0}}\right\|^{2} \rightarrow 0$ as $(\theta, \eta) \rightarrow\left(\theta_{0}, \eta_{0}\right)$. Assume that $P \psi_{\theta_{0}, \eta_{0}}=0$, and that the maps $\theta \mapsto P \psi_{\theta, \eta}$ are differentiable at $\theta_{0}$, uniformly in $\eta$ in a neighborhood of $\eta_{0}$ with nonsingular derivative matrices $V_{\theta_{0}, \eta}$ such that $V_{\theta_{0}, \eta} \rightarrow V_{\theta_{0}, \eta_{0}}$. If $\sqrt{n} \mathbb{P}_{n} \psi_{\hat{\theta}_{n}, \hat{\eta}_{n}}=o_{P}(1)$ and $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right) \xrightarrow{\mathrm{P}}\left(\theta_{0}, \eta_{0}\right)$, then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V_{\theta_{0}, \eta_{0}}^{-1} \sqrt{n} P \psi_{\theta_{0}, \hat{\eta}_{n}}-V_{\theta_{0}, \eta_{0}}^{-1} \mathbb{G}_{n} \psi_{\theta_{0}, \eta_{0}}+o_{P}\left(1+\sqrt{n}\left\|P \psi_{\theta_{0}, \hat{\eta}_{n}}\right\|\right)
$$

Under the conditions of this theorem, the limiting distribution of the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\right. \left.\theta_{0}\right)$ depends on the estimator $\hat{\eta}_{n}$ through the "drift" term $\sqrt{n} P \psi_{\theta_{0}, \hat{\eta}_{n}}$. In general, this gives a contribution to the limiting distribution, and $\hat{\eta}_{n}$ must be chosen with care. If $\hat{\eta}_{n}$ is $\sqrt{n}$ consistent and the map $\eta \mapsto P \psi_{\theta_{0}, \eta}$ is differentiable, then the drift term can be analyzed using the delta-method.

It may happen that the drift term is zero. If the parameters $\theta$ and $\eta$ are "orthogonal" in this sense, then the auxiliary estimators $\hat{\eta}_{n}$ may converge at an arbitrarily slow rate and affect the limit distribution of $\hat{\theta}_{n}$ only through their limiting value $\eta_{0}$.
5.32 Example (Symmetric location). Suppose that the distribution of the observations is symmetric about $\theta_{0}$. Let $x \mapsto \psi(x)$ be an antisymmetric function, and consider the $Z$-estimators that solve equation (5.30). Because $P \psi\left(\left(X-\theta_{0}\right) / \sigma\right)=0$ for every $\sigma$, by the symmetry of $P$ and the antisymmetry of $\psi$, the "drift term" due to $\hat{\eta}$ in the preceding theorem is identically zero. The estimator $\hat{\theta}_{n}$ has the same limiting distribution whether we use an arbitrary consistent estimator of a "true scale" $\sigma_{0}$ or $\sigma_{0}$ itself.
5.33 Example (Robust regression). In the linear regression model considered in Example 5.28 , suppose that we choose the weight functions $v$ and $w$ dependent on the data and solve the robust estimator $\hat{\theta}_{n}$ of the regression parameters from

$$
0=\frac{1}{n} \sum_{i=1}^{n} \psi\left(\left(Y_{i}-\theta^{T} X_{i}\right) \hat{v}_{n}\left(X_{i}\right)\right) \hat{w}_{n}\left(X_{i}\right)
$$

This corresponds to defining a nuisance parameter $\eta=(v, w)$ and setting $\psi_{\theta, v, w}(x, y)= \psi\left(\left(y-\theta^{T} x\right) v(x)\right) w(x)$. If the functions $\psi_{\theta, v, w}$ run through a Donsker class (and they easily do), and are continuous in $(\theta, v, w)$, and the map $\theta \mapsto P \psi_{\theta, v, w}$ is differentiable at $\theta_{0}$ uniformly in ( $v, w$ ), then the preceding theorem applies. If $\mathrm{E} \psi(e \sigma)=0$ for every $\sigma$, then $P \psi_{\theta_{0}, v, w}=0$ for any $v$ and $w$, and the limit distribution of $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is the same, whether we use the random weight functions $\left(\hat{v}_{n}, \hat{w}_{n}\right)$ or their limit $\left(v_{0}, w_{0}\right)$ (assuming that this exists).

The purpose of using random weight functions could be, besides stabilizing the robustness, to improve the asymptotic efficiency of $\hat{\theta}_{n}$. The limit ( $v_{0}, w_{0}$ ) typically is not the same for every underlying distribution $P$, and the estimators ( $\hat{v}_{n}, \hat{w}_{n}$ ) can be chosen in such a way that the asymptotic variance is minimal.

### 5.5 Maximum Likelihood Estimators

Maximum likelihood estimators are examples of $M$-estimators. In this section we specialize the consistency and the asymptotic normality results of the preceding sections to this important special case. Our approach reverses the historical order. Maximum likelihood estimators were shown to be asymptotically normal first by Fisher in the 1920s and rigorously by Cramér, among others, in the 1940s. General $M$-estimators were not introduced and studied systematically until the 1960s, when they became essential in the development of robust estimators.

If $X_{1}, \ldots, X_{n}$ are a random sample from a density $p_{\theta}$, then the maximum likelihood estimator $\hat{\theta}_{n}$ maximizes the function $\theta \mapsto \sum \log p_{\theta}\left(X_{i}\right)$, or equivalently, the function

$$
M_{n}(\theta)=\frac{1}{n} \sum_{i=1}^{n} \log \frac{p_{\theta}}{p_{\theta_{0}}}\left(X_{i}\right)=\mathbb{P}_{n} \log \frac{p_{\theta}}{p_{\theta_{0}}}
$$

(Subtraction of the "constant" $\sum \log p_{\theta_{0}}\left(X_{i}\right)$ turns out to be mathematically convenient.) If we agree that $\log 0=-\infty$, then this expression is with probability 1 well defined if $p_{\theta_{0}}$ is the true density. The asymptotic function corresponding to $M_{n}$ is ${ }^{\dagger}$

$$
M(\theta)=\mathrm{E}_{\theta_{0}} \log \frac{p_{\theta}}{p_{\theta_{0}}}(X)=P_{\theta_{0}} \log \frac{p_{\theta}}{p_{\theta_{0}}}
$$

The number $-M(\theta)$ is called the Kullback-Leibler divergence of $p_{\theta}$ and $p_{\theta_{0}}$; it is often considered a measure of "distance" between $p_{\theta}$ and $p_{\theta_{0}}$, although it does not have the properties of a mathematical distance. Based on the results of the previous sections, we may expect the maximum likelihood estimator to converge to a point of maximum of $M(\theta)$. Is the true value $\theta_{0}$ always a point of maximum? The answer is affirmative, and, moreover, the true value is a unique point of maximum if the true measure is identifiable:

$$
\begin{equation*}
P_{\theta} \neq P_{\theta_{0}}, \quad \text { every } \theta \neq \theta_{0} \tag{5.34}
\end{equation*}
$$

This requires that the model for the observations is not the same under the parameters $\theta$ and $\theta_{0}$. Identifiability is a natural and even a necessary condition: If the parameter is not identifiable, then consistent estimators cannot exist.
5.35 Lemma. Let $\left\{p_{\theta}: \theta \in \Theta\right\}$ be a collection of subprobability densities such that (5.34) holds and such that $P_{\theta_{0}}$ is a probability measure. Then $M(\theta)=P_{\theta_{0}} \log p_{\theta} / p_{\theta_{0}}$ attains its maximum uniquely at $\theta_{0}$.

Proof. First note that $M\left(\theta_{0}\right)=P_{\theta_{0}} \log 1=0$. Hence we wish to show that $M(\theta)$ is strictly negative for $\theta \neq \theta_{0}$.

Because $\log x \leq 2(\sqrt{x}-1)$ for every $x \geq 0$, we have, writing $\mu$ for the dominating measure,

$$
\begin{aligned}
P_{\theta_{0}} \log \frac{p_{\theta}}{p_{\theta_{0}}} & \leq 2 P_{\theta_{0}}\left(\sqrt{\frac{p_{\theta}}{p_{\theta_{0}}}}-1\right)=2 \int \sqrt{p_{\theta} p_{\theta_{0}}} d \mu-2 \\
& \leq-\int\left(\sqrt{p_{\theta}}-\sqrt{p_{\theta_{0}}}\right)^{2} d \mu
\end{aligned}
$$

(The last inequality is an equality if $\int p_{\theta} d \mu=1$.) This is always nonpositive, and is zero only if $p_{\theta}$ and $p_{\theta_{0}}$ are equal. By assumption the latter happens only if $\theta=\theta_{0}$.

Thus, under conditions such as in section 5.2 and identifiability, the sequence of maximum likelihood estimators is consistent for the true parameter.

[^8]This conclusion is derived from viewing the maximum likelihood estimator as an $M$ estimator for $m_{\theta}=\log p_{\theta}$. Sometimes it is technically advantageous to use a different starting point. For instance, consider the function

$$
m_{\theta}=\log \frac{p_{\theta}+p_{\theta_{0}}}{2 p_{\theta_{0}}}
$$

By the concavity of the logarithm, the maximum likelihood estimator $\hat{\theta}$ satisfies

$$
\mathbb{P}_{n} m_{\hat{\theta}} \geq \mathbb{P}_{n} \frac{1}{2} \log \frac{p_{\hat{\theta}}}{p_{\theta_{0}}}+\mathbb{P}_{n} \frac{1}{2} \log 1 \geq 0=\mathbb{P}_{n} m_{\theta_{0}}
$$

Even though $\hat{\theta}$ does not maximize $\theta \mapsto \mathbb{P}_{n} m_{\theta}$, this inequality can be used as the starting point for a consistency proof, since Theorem 5.7 requires that $M_{n}(\hat{\theta}) \geq M_{n}\left(\theta_{0}\right)-o_{P}(1)$ only. The true parameter is still identifiable from this criterion function, because, by the preceding lemma, $P_{\theta_{0}} m_{\theta}=0$ implies that $\left(p_{\theta}+p_{\theta_{0}}\right) / 2=p_{\theta_{0}}$, or $p_{\theta}=p_{\theta_{0}}$. A technical advantage is that $m_{\theta} \geq \log (1 / 2)$. For another variation, see Example 5.17.

Consider asymptotic normality. The maximum likelihood estimator solves the likelihood equations

$$
\frac{\partial}{\partial \theta} \sum_{i=1}^{n} \log p_{\theta}\left(X_{i}\right)=0
$$

Hence it is a $Z$-estimator for $\psi_{\theta}$ equal to the score function $\dot{\ell}_{\theta}=\partial / \partial \theta \log p_{\theta}$ of the model. In view of the results of section 5.3, we expect that the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ is, under $\theta$, asymptotically normal with mean zero and covariance matrix

$$
\begin{equation*}
\left(P_{\theta} \ddot{l}_{\theta}\right)^{-1} P_{\theta} \dot{l}_{\theta} \dot{l}_{\theta}^{T}\left(P_{\theta} \ddot{l}_{\theta}^{T}\right)^{-1} \tag{5.36}
\end{equation*}
$$

Under regularity conditions, this reduces to the inverse of the Fisher information matrix

$$
I_{\theta}=P_{\theta} \dot{\ell}_{\theta} \dot{\ell}_{\theta}^{T}
$$

To see this in the case of a one-dimensional parameter, differentiate the identity $\int p_{\theta} d \mu \equiv 1$ twice with respect to $\theta$. Assuming that the order of differentiation and integration can be reversed, we obtain $\int \dot{p}_{\theta} d \mu \equiv \int \ddot{p}_{\theta} d \mu \equiv 0$. Together with the identities

$$
\dot{\ell}_{\theta}=\frac{\dot{p}_{\theta}}{p_{\theta}} ; \quad \ddot{\ell}_{\theta}=\frac{\ddot{p}_{\theta}}{p_{\theta}}-\left(\frac{\dot{p}_{\theta}}{p_{\theta}}\right)^{2}
$$

this implies that $P_{\theta} \dot{\ell}_{\theta}=0$ (scores have mean zero), and $P_{\theta} \ddot{\ell}_{\theta}=-I_{\theta}$ (the curvature of the likelihood is equal to minus the Fisher information). Consequently, (5.36) reduces to $I_{\theta}^{-1}$. The higher-dimensional case follows in the same way, in which we should interpret the identities $P_{\theta} \dot{\ell}_{\theta}=0$ and $P_{\theta} \ddot{\ell}_{\theta}=-I_{\theta}$ as a vector and a matrix identity, respectively.

We conclude that maximum likelihood estimators typically satisfy

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \stackrel{\theta}{\rightsquigarrow} N\left(0, I_{\theta}^{-1}\right) .
$$

This is a very important result, as it implies that maximum likelihood estimators are asymptotically optimal. The convergence in distribution means roughly that the maximum likelihood estimator $\hat{\theta}_{n}$ is $N\left(\theta,\left(n I_{\theta}\right)^{-1}\right)$-distributed for every $\theta$, for large $n$. Hence, it is asymptotically unbiased and asymptotically of variance $\left(n I_{\theta}\right)^{-1}$. According to the Cramér-Rao
theorem, the variance of an unbiased estimator is at least $\left(n I_{\theta}\right)^{-1}$. Thus, we could infer that the maximum likelihood estimator is asymptotically uniformly minimum-variance unbiased, and in this sense optimal. We write "could" because the preceding reasoning is informal and unsatisfying. The asymptotic normality does not warrant any conclusion about the convergence of the moments $\mathrm{E}_{\theta} \hat{\theta}_{n}$ and $\operatorname{var}_{\theta} \hat{\theta}_{n}$; we have not introduced an asymptotic version of the Cramér-Rao theorem; and the Cramér-Rao bound does not make any assertion concerning asymptotic normality. Moreover, the unbiasedness required by the Cramér-Rao theorem is restrictive and can be relaxed considerably in the asymptotic situation.

However, the message that maximum likelihood estimators are asymptotically efficient is correct. We give a precise discussion in Chapter 8. The justification through asymptotics appears to be the only general justification of the method of maximum likelihood. In some form, this result was found by Fisher in the 1920s, but a better and more general insight was only obtained in the period from 1950 through 1970 through the work of Le Cam and others.

In the preceding informal derivations and discussion, it is implicitly understood that the density $p_{\theta}$ possesses at least two derivatives with respect to the parameter. Although this can be relaxed considerably, a certain amount of smoothness of the dependence $\theta \mapsto p_{\theta}$ is essential for the asymptotic normality. Compare the behavior of the maximum likelihood estimators in the case of uniformly distributed observations: They are neither asymptotically normal nor asymptotically optimal.
5.37 Example (Uniform distribution). Let $X_{1}, \ldots, X_{n}$ be a sample from the uniform distribution on $[0, \theta]$. Then the maximum likelihood estimator is the maximum $X_{(n)}$ of the observations. Because the variance of $X_{(n)}$ is of the order $O\left(n^{-2}\right)$, we expect that a suitable norming rate in this case is not $\sqrt{n}$, but $n$. Indeed, for each $x<0$

$$
\mathrm{P}_{\theta}\left(n\left(X_{(n)}-\theta\right) \leq x\right)=\mathrm{P}_{\theta}\left(X_{1} \leq \theta+\frac{x}{n}\right)^{n}=\left(\frac{\theta+x / n}{\theta}\right)^{n} \rightarrow e^{x / \theta} .
$$

Thus, the sequence $-n\left(X_{(n)}-\theta\right)$ converges in distribution to an exponential distribution with mean $\theta$. Consequently, the sequence $\sqrt{n}\left(X_{(n)}-\theta\right)$ converges to zero in probability.

Note that most of the informal operations in the preceding introduction are illegal or not even defined for the uniform distribution, starting with the definition of the likelihood equations. The informal conclusion that the maximum likelihood estimator is asymptotically optimal is also wrong in this case; see section 9.4.

We conclude this section with a theorem that establishes the asymptotic normality of maximum likelihood estimators rigorously. Clearly, the asymptotic normality follows from Theorem 5.23 applied to $m_{\theta}=\log p_{\theta}$, or from Theorem 5.21 applied with $\psi_{\theta}=\dot{\ell}_{\theta}$ equal to the score function of the model. The following result is a minor variation on the first theorem. Its conditions somehow also ensure the relationship $P_{\theta} \ddot{l}_{\theta}=-I_{\theta}$ and the twicedifferentiability of the map $\theta \mapsto P_{\theta_{0}} \log p_{\theta}$, even though the existence of second derivatives is not part of the assumptions. This remarkable phenomenon results from the trivial fact that square roots of probability densities have squares that integrate to 1 . To exploit this, we require the differentiability of the maps $\theta \mapsto \sqrt{p_{\theta}}$, rather than of the maps $\theta \mapsto \log p_{\theta}$. A statistical model ( $P_{\theta}: \theta \in \Theta$ ) is called differentiable in quadratic mean if there exists a
measurable vector-valued function $\dot{\ell}_{\theta_{0}}$ such that, as $\theta \rightarrow \theta_{0}$,

$$
\begin{equation*}
\int\left[\sqrt{p_{\theta}}-\sqrt{p_{\theta_{0}}}-\frac{1}{2}\left(\theta-\theta_{0}\right)^{T} \dot{\ell}_{\theta_{0}} \sqrt{p_{\theta_{0}}}\right]^{2} d \mu=o\left(\left\|\theta-\theta_{0}\right\|^{2}\right) \tag{5.38}
\end{equation*}
$$

This property also plays an important role in asymptotic optimality theory. A discussion, including simple conditions for its validity, is given in Chapter 7. It should be noted that

$$
\frac{\partial}{\partial \theta} \sqrt{p_{\theta}}=\frac{1}{2 \sqrt{p_{\theta}}} \frac{\partial}{\partial \theta} p_{\theta}=\frac{1}{2}\left(\frac{\partial}{\partial \theta} \log p_{\theta}\right) \sqrt{p_{\theta}}
$$

Thus, the function $\dot{\ell}_{\theta_{0}}$ in the integral really is the score function of the model (as the notation suggests), and the expression $I_{\theta_{0}}=P_{\theta_{0}} \dot{\ell}_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{T}$ defines the Fisher information matrix. However, condition (5.38) does not require existence of $\partial / \partial \theta p_{\theta}(x)$ for every $x$.
5.39 Theorem. Suppose that the model ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean at an inner point $\theta_{0}$ of $\Theta \subset \mathbb{R}^{k}$. Furthermore, suppose that there exists a measurable function $\dot{\ell}$ with $P_{\theta_{0}} \dot{\ell}^{2}<\infty$ such that, for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\theta_{0}$,

$$
\left|\log p_{\theta_{1}}(x)-\log p_{\theta_{2}}(x)\right| \leq \dot{\ell}(x)\left\|\theta_{1}-\theta_{2}\right\| .
$$

If the Fisher information matrix $I_{\theta_{0}}$ is nonsingular and $\hat{\theta}_{n}$ is consistent, then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=I_{\theta_{0}}^{-1} \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{\ell}_{\theta_{0}}\left(X_{i}\right)+o_{P_{\theta_{0}}}(1) .
$$

In particular, the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with mean zero and covariance matrix $I_{\theta_{0}}^{-1}$.
*Proof. This theorem is a corollary of Theorem 5.23. We shall show that the conditions of the latter theorem are satisfied for $m_{\theta}=\log p_{\theta}$ and $V_{\theta_{0}}=-I_{\theta_{0}}$.

Fix an arbitrary converging sequence of vectors $h_{n} \rightarrow h$, and set

$$
W_{n}=2\left(\sqrt{\frac{p_{\theta_{0}+h_{n} / \sqrt{n}}}{p_{\theta_{0}}}}-1\right) .
$$

By the differentiability in quadratic mean, the sequence $\sqrt{n} W_{n}$ converges in $L_{2}\left(P_{\theta_{0}}\right)$ to the function $h^{T} \dot{\ell}_{\theta_{0}}$. In particular, it converges in probability, whence by a delta method

$$
\sqrt{n}\left(\log p_{\theta_{0}+h_{n} / \sqrt{n}}-\log p_{\theta_{0}}\right)=2 \sqrt{n} \log \left(1+\frac{1}{2} W_{n}\right) \xrightarrow{\mathrm{P}} h^{T} \dot{\ell}_{\theta_{0}} .
$$

In view of the Lipschitz condition on the map $\theta \mapsto \log p_{\theta}$, we can apply the dominatedconvergence theorem to strengthen this to convergence in $L_{2}\left(P_{\theta_{0}}\right)$. This shows that the map $\theta \mapsto \log p_{\theta}$ is differentiable in probability, as required in Theorem 5.23. (The preceding argument considers only sequences $\theta_{n}$ of the special form $\theta_{0}+h_{n} / \sqrt{n}$ approaching $\theta_{0}$. Because $h_{n}$ can be any converging sequence and $\sqrt{n+1} / \sqrt{n} \rightarrow 1$, these sequences are actually not so special. By re-indexing the result can be seen to be true for any $\theta_{n} \rightarrow \theta_{0}$.)

Next, by computing means (which are zero) and variances, we see that

$$
\mathbb{G}_{n}\left[\sqrt{n}\left(\log p_{\theta_{0}+h_{n} / \sqrt{n}}-\log p_{\theta_{0}}\right)-h^{T} \dot{\ell}_{\theta_{0}}\right] \xrightarrow{\mathrm{P}} 0 .
$$

Equating this result to the expansion given by Theorem 7.2, we see that

$$
n P_{\theta_{0}}\left(\log p_{\theta_{0}+h_{n} / \sqrt{n}}-\log p_{\theta_{0}}\right) \rightarrow-\frac{1}{2} h^{T} I_{\theta_{0}} h .
$$

Hence the map $\theta \mapsto P_{\theta_{0}} \log p_{\theta}$ is twice-differentiable with second derivative matrix $-I_{\theta_{0}}$, or at least permits the corresponding Taylor expansion of order 2.
5.40 Example (Binary regression). Suppose that we observe a random sample ( $X_{1}$, $\left.Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ consisting of $k$-dimensional vectors of "covariates" $X_{i}$, and 0-1 "response variables" $Y_{i}$, following the model

$$
P_{\theta}\left(Y_{i}=1 \mid X_{i}=x\right)=\Psi\left(\theta^{T} x\right) .
$$

Here $\Psi: \mathbb{R} \mapsto[0,1]$ is a known continuously differentiable, monotone function. The choices $\Psi(\theta)=1 /\left(1+e^{-\theta}\right)$ (the logistic distribution function) and $\Psi=\Phi$ (the normal distribution function) correspond to the logit model and probit model, respectively. The maximum likelihood estimator $\hat{\theta}_{n}$ maximizes the (conditional) likelihood function

$$
\theta \mapsto \prod_{i=1}^{n} p_{\theta}\left(Y_{i} \mid X_{i}\right):=\prod_{i=1}^{n} \Psi\left(\theta^{T} X_{i}\right)^{Y_{i}}\left(1-\Psi\left(\theta^{T} X_{i}\right)\right)^{1-Y_{i}}
$$

The consistency and asymptotic normality of $\hat{\theta}_{n}$ can be proved, for instance, by combining Theorems 5.7 and 5.39. (Alternatively, we may follow the classical approach given in section 5.6. The latter is particularly attractive for the logit model, for which the log likelihood is strictly concave in $\theta$, so that the point of maximum is unique.) For identifiability of $\theta$ we must assume that the distribution of the $X_{i}$ is not concentrated on a ( $k-1$ )-dimensional affine subspace of $\mathbb{R}^{k}$. For simplicity we assume that the range of $X_{i}$ is bounded.

The consistency can be proved by applying Theorem 5.7 with $m_{\theta}=\log \left(p_{\theta}+p_{\theta_{0}}\right) / 2$. Because $p_{\theta_{0}}$ is bounded away from 0 (and $\infty$ ), the function $m_{\theta}$ is somewhat better behaved than the function $\log p_{\theta}$.

By Lemma 5.35, the parameter $\theta$ is identifiable from the density $p_{\theta}$. We can redo the proof to see that, with $\lesssim$ meaning "less than up to a constant,"

$$
\begin{aligned}
P_{\theta_{0}}\left(m_{\theta}-m_{\theta_{0}}\right) & \lesssim-\int\left(\left(\frac{1}{2}\left(p_{\theta}+p_{\theta_{0}}\right)\right)^{1 / 2}-p_{\theta_{0}}^{1 / 2}\right)^{2} d \mu \\
& \lesssim-\mathrm{E}\left(\Psi\left(\theta^{T} X\right)-\Psi\left(\theta_{0}^{T} X\right)\right)^{2}
\end{aligned}
$$

This shows that $\theta_{0}$ is the unique point of maximum of $\theta \mapsto P_{\theta_{0}} m_{\theta}$. Furthermore, if $P_{\theta_{0}} m_{\theta_{k}} \rightarrow P_{\theta_{0}} m_{\theta_{0}}$, then $\theta_{k}^{T} X \xrightarrow{\mathrm{P}} \theta_{0}^{T} X$. If the sequence $\theta_{k}$ is also bounded, then $\mathrm{E}\left(\left(\theta_{k}-\theta_{0}\right)^{T} X\right)^{2} \rightarrow 0$, whence $\theta_{k} \mapsto \theta_{0}$ by the nonsingularity of the matrix $\mathrm{E} X X^{T}$. On the other hand, $\left\|\theta_{k}\right\|$ cannot have a diverging subsequence, because in that case $\theta_{k}^{T} /\left\|\theta_{k}\right\| X \xrightarrow{\mathrm{P}} 0$ and hence $\theta_{k} /\left\|\theta_{k}\right\| \rightarrow 0$ by the same argument. This verifies condition (5.8).

Checking the uniform convergence to zero of $\sup _{\theta}\left|\mathbb{P}_{n} m_{\theta}-P m_{\theta}\right|$ is not trivial, but it becomes an easy exercise if we employ the Glivenki-Cantelli theorem, as discussed in Chapter 19. The functions $x \mapsto \Psi\left(\theta^{T} x\right)$ form a VC-class, and the functions $m_{\theta}$ take the form $m_{\theta}(x, y)=\phi\left(\Psi\left(\theta^{T} x\right), y, \Psi\left(\theta_{0}^{T} x\right)\right)$, where the function $\phi(\gamma, y, \eta)$ is Lipschitz in its first argument with Lipschitz constant bounded above by $1 / \eta+1 /(1-\eta)$. This is enough to
ensure that the functions $m_{\theta}$ form a Donsker class and hence certainly a Glivenko-Cantelli class, in view of Example 19.20.

The asymptotic normality of $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ is now a consequence of Theorem 5.39. The score function

$$
\dot{\ell}_{\theta}(y \mid x)=\frac{y-\Psi\left(\theta^{T} x\right)}{\Psi\left(\theta^{T} x\right)(1-\Psi)\left(\theta^{T} x\right)} \Psi^{\prime}\left(\theta^{T} x\right) x
$$

is uniformly bounded in $x, y$ and $\theta$ ranging over compacta, and continuous in $\theta$ for every $x$ and $y$. The Fisher information matrix

$$
I_{\theta}=\mathrm{E} \frac{\Psi^{\prime}\left(\theta^{T} X\right)^{2}}{\Psi\left(\theta^{T} X\right)(1-\Psi)\left(\theta^{T} X\right)} X X^{T}
$$

is continuous in $\theta$, and is bounded below by a multiple of $\mathrm{E} X X^{T}$ and hence is nonsingular. The differentiability in quadratic mean follows by calculus, or by Lemma 7.6.

## *5.6 Classical Conditions

In this section we discuss the "classical conditions" for asymptotic normality of $M$-estimators. These conditions were formulated in the 1930s and 1940s to make the informal derivations of the asymptotic normality of maximum likelihood estimators, for instance by Fisher, mathematically rigorous. Although Theorem 5.23 requires less than a first derivative of the criterion function, the "classical conditions" require existence of third derivatives. It is clear that the classical conditions are too stringent, but they are still of interest, because they are simple, lead to simple proofs, and nevertheless apply to many examples. The classical conditions also ensure existence of $Z$-estimators and have a little to say about their consistency.

We describe the classical approach for general $Z$-estimators and vector-valued parameters. The higher-dimensional case requires more skill in calculus and matrix algebra than is necessary for the one-dimensional case. When simplified to dimension one the arguments do not go much beyond making the informal derivation leading from (5.18) to (5.19) rigorous.

Let the observations $X_{1}, \ldots, X_{n}$ be a sample from a distribution $P$, and consider the estimating equations

$$
\Psi_{n}(\theta)=\frac{1}{n} \sum_{i=1}^{n} \psi_{\theta}\left(X_{i}\right)=\mathbb{P}_{n} \psi_{\theta}, \quad \Psi(\theta)=P \psi_{\theta}
$$

The estimator $\hat{\theta}_{n}$ is a zero of $\Psi_{n}$, and the true value $\theta_{0}$ a zero of $\Psi$. The essential condition of the following theorem is that the second-order partial derivatives of $\psi_{\theta}(x)$ with respect to $\theta$ exist for every $x$ and satisfy

$$
\left|\frac{\partial^{2} \psi_{\theta, h}(x)}{\partial \theta_{i} \theta_{j}}\right| \leq \ddot{\psi}(x),
$$

for some integrable measurable function $\ddot{\psi}$. This should be true at least for every $\theta$ in a neighborhood of $\theta_{0}$.
5.41 Theorem. For each $\theta$ in an open subset of Euclidean space, let $\theta \mapsto \psi_{\theta}(x)$ be twice continuously differentiable for every $x$. Suppose that $P \psi_{\theta_{0}}=0$, that $P\left\|\psi_{\theta_{0}}\right\|^{2}<\infty$ and that the matrix $P \dot{\psi}_{\theta_{0}}$ exists and is nonsingular. Assume that the second-order partial derivatives are dominated by a fixed integrable function $\ddot{\psi}(x)$ for every $\theta$ in a neighborhood of $\theta_{0}$. Then every consistent estimator sequence $\hat{\theta}_{n}$ such that $\Psi_{n}\left(\hat{\theta}_{n}\right)=0$ for every n satisfies

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\left(P \dot{\psi}_{\theta_{0}}\right)^{-1} \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \psi_{\theta_{0}}\left(X_{i}\right)+o_{P}(1)
$$

In particular, the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with mean zero and covariance matrix $\left(P \dot{\psi}_{\theta_{0}}\right)^{-1} P \psi_{\theta_{0}} \psi_{\theta_{0}}^{T}\left(P \dot{\psi}_{\theta_{0}}\right)^{-1}$.

Proof. By Taylor's theorem there exists a (random) vector $\tilde{\theta}_{n}$ on the line segment between $\theta_{0}$ and $\hat{\theta}_{n}$ such that

$$
0=\Psi_{n}\left(\hat{\theta}_{n}\right)=\Psi_{n}\left(\theta_{0}\right)+\dot{\Psi}_{n}\left(\theta_{0}\right)\left(\hat{\theta}_{n}-\theta_{0}\right)+\frac{1}{2}\left(\hat{\theta}_{n}-\theta_{0}\right)^{T} \ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)\left(\hat{\theta}_{n}-\theta_{0}\right) .
$$

The first term on the right $\Psi_{n}\left(\theta_{0}\right)$ is an average of the i.i.d. random vectors $\psi_{\theta_{0}}\left(X_{i}\right)$, which have mean $P \psi_{\theta_{0}}=0$. By the central limit theorem, the sequence $\sqrt{n} \Psi_{n}\left(\theta_{0}\right)$ converges in distribution to a multivariate normal distribution with mean 0 and covariance matrix $P \psi_{\theta_{0}} \psi_{\theta_{0}}^{T}$. The derivative $\dot{\Psi}_{n}\left(\theta_{0}\right)$ in the second term is an average also. By the law of large numbers it converges in probability to the matrix $V=P \dot{\psi}_{\theta_{0}}$. The second derivative $\ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)$ is a $k$-vector of $(k \times k)$ matrices depending on the second-order derivatives $\ddot{\psi}_{\theta}$. By assumption, there exists a ball $B$ around $\theta_{0}$ such that $\ddot{\psi}_{\theta}$ is dominated by $\|\ddot{\psi}\|$ for every $\theta \in B$. The probability of the event $\left\{\hat{\theta}_{n} \in B\right\}$ tends to 1 . On this event

$$
\left\|\ddot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)\right\|=\left\|\frac{1}{n} \sum_{i=1}^{n} \ddot{\psi}_{\tilde{\theta}_{n}}\left(X_{i}\right)\right\| \leq \frac{1}{n} \sum_{i=1}^{n}\left\|\ddot{\psi}\left(X_{i}\right)\right\| .
$$

This is bounded in probability by the law of large numbers. Combination of these facts allows us to rewrite the preceding display as

$$
-\Psi_{n}\left(\theta_{0}\right)=\left(V+o_{P}(1)+\frac{1}{2}\left(\hat{\theta}_{n}-\theta_{0}\right) O_{P}(1)\right)\left(\hat{\theta}_{n}-\theta_{0}\right)=\left(V+o_{P}(1)\right)\left(\hat{\theta}_{n}-\theta_{0}\right)
$$

because the sequence $\left(\hat{\theta}_{n}-\theta_{0}\right) O_{P}(1)=o_{P}(1) O_{P}(1)$ converges to 0 in probability if $\hat{\theta}_{n}$ is consistent for $\theta_{0}$. The probability that the matrix $V_{\theta_{0}}+o_{P}(1)$ is invertible tends to 1 . Multiply the preceding equation by $\sqrt{n}$ and apply $\left(V+o_{P}(1)\right)^{-1}$ left and right to complete the proof.

In the preceding sections, the existence and consistency of solutions $\hat{\theta}_{n}$ of the estimating equations is assumed from the start. The present smoothness conditions actually ensure the existence of solutions. (Again the conditions could be significantly relaxed, as shown in the next proof.) Moreover, provided there exists a consistent estimator sequence at all, it is always possible to select a consistent sequence of solutions.
5.42 Theorem. Under the conditions of the preceding theorem, the probability that the equation $\mathbb{P}_{n} \psi_{\theta}=0$ has at least one root tends to 1 , as $n \rightarrow \infty$, and there exists a sequence of roots $\hat{\theta}_{n}$ such that $\hat{\theta}_{n} \rightarrow \theta_{0}$ in probability. If $\psi_{\theta}=\dot{m}_{\theta}$ is the gradient of some function
$m_{\theta}$ and $\theta_{0}$ is a point of local maximum of $\theta \mapsto P m_{\theta}$, then the sequence $\hat{\theta}_{n}$ can be chosen to be local maxima of the maps $\theta \mapsto \mathbb{P}_{n} m_{\theta}$.

Proof. Integrate the Taylor expansion of $\theta \mapsto \psi_{\theta}(x)$ with respect to $x$ to find that, for a point $\tilde{\theta}=\tilde{\theta}(x)$ on the line segment between $\theta_{0}$ and $\theta$,

$$
P \psi_{\theta}=P \psi_{\theta_{0}}+P \dot{\psi}_{\theta_{0}}\left(\theta-\theta_{0}\right)+\frac{1}{2}\left(\theta-\theta_{0}\right)^{T} P \ddot{\psi}_{\tilde{\theta}}\left(\theta-\theta_{0}\right) .
$$

By the domination condition, $\left\|P \ddot{\psi}_{\tilde{\theta}}\right\|$ is bounded by $P\|\ddot{\psi}\|<\infty$ if $\theta$ is sufficiently close to $\theta_{0}$. Thus, the map $\Psi(\theta)=P \psi_{\theta}$ is differentiable at $\theta_{0}$. By the same argument $\Psi$ is differentiable throughout a small neighborhood of $\theta_{0}$, and by a similar expansion (but now to first order) the derivative $P \dot{\psi}_{\theta}$ can be seen to be continuous throughout this neighborhood. Because $P \dot{\psi}_{\theta_{0}}$ is nonsingular by assumption, we can make the neighborhood still smaller, if necessary, to ensure that the derivative of $\Psi$ is nonsingular throughout the neighborhood. Then, by the inverse function theorem, there exists, for every sufficiently small $\delta>0$, an open neighborhood $G_{\delta}$ of $\theta_{0}$ such that the map $\Psi: \bar{G}_{\delta} \mapsto \overline{\text { ball }}(0, \delta)$ is a homeomorphism. The diameter of $\bar{G}_{\delta}$ is bounded by a multiple of $\delta$, by the mean-value theorem and the fact that the norms of the derivatives $\left(P \dot{\psi}_{\theta}\right)^{-1}$ of the inverse $\Psi^{-1}$ are bounded.

Combining the preceding Taylor expansion with a similar expansion for the sample version $\Psi_{n}(\theta)=\mathbb{P}_{n} \psi_{\theta}$, we see

$$
\sup _{\theta \in \bar{G}_{\delta}}\left\|\Psi_{n}(\theta)-\Psi(\theta)\right\| \leq o_{P}(1)+\delta o_{P}(1)+\delta^{2} O_{P}(1),
$$

where the $o_{P}(1)$ terms and the $O_{P}(1)$ term result from the law of large numbers, and are uniform in small $\delta$. Because $\mathrm{P}\left(o_{P}(1)+\delta o_{P}(1)>\frac{1}{2} \delta\right) \rightarrow 0$ for every $\delta>0$, there exists $\delta_{n} \downarrow 0$ such that $\mathrm{P}\left(o_{P}(1)+\delta_{n} o_{P}(1)>\frac{1}{2} \delta_{n}\right) \rightarrow 0$. If $K_{n, \delta}$ is the event where the left side of the preceding display is bounded above by $\delta$, then $\mathrm{P}\left(K_{n, \delta_{n}}\right) \rightarrow 1$ as $n \rightarrow \infty$.

On the event $K_{n, \delta}$ the map $\theta \mapsto \theta-\Psi_{n} \circ \Psi^{-1}(\theta)$ maps $\overline{\text { ball }}(0, \delta)$ into itself, by the definitions of $\bar{G}_{\delta}$ and $K_{n, \delta}$. Because the map is also continuous, it possesses a fixed-point in $\overline{\operatorname{ball}}(0, \delta)$, by Brouwer's fixed point theorem. This yields a zero of $\Psi_{n}$ in the set $\bar{G}_{\delta}$, whence the first assertion of the theorem.

For the final assertion, first note that the Hessian $P \dot{\psi}_{\theta_{0}}$ of $\theta \mapsto P m_{\theta}$ at $\theta_{0}$ is negativedefinite, by assumption. A Taylor expansion as in the proof of Theorem 5.41 shows that $\mathbb{P}_{n} \dot{\psi}_{\hat{\theta}_{n}}-\mathbb{P}_{n} \dot{\psi}_{\theta_{0}} \xrightarrow{\mathrm{P}} 0$ for every $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$. Hence the Hessian $\mathbb{P}_{n} \dot{\psi}_{\hat{\theta}_{n}}$ of $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ at any consistent zero $\hat{\theta}_{n}$ converges in probability to the negative-definite matrix $P \dot{\psi}_{\theta_{0}}$ and is negative-definite with probability tending to 1 .

The assertion of the theorem that there exists a consistent sequence of roots of the estimating equations is easily misunderstood. It does not guarantee the existence of an asymptotically consistent sequence of estimators. The only claim is that a clairvoyant statistician (with preknowledge of $\theta_{0}$ ) can choose a consistent sequence of roots. In reality, it may be impossible to choose the right solutions based only on the data (and knowledge of the model). In this sense the preceding theorem, a standard result in the literature, looks better than it is.

The situation is not as bad as it seems. One interesting situation is if the solution of the estimating equation is unique for every $n$. Then our solutions must be the same as those of the clairvoyant statistician and hence the sequence of solutions is consistent.

In general, the deficit can be repaired with the help of a preliminary sequence of estimators $\tilde{\theta}_{n}$. If the sequence $\tilde{\theta}_{n}$ is consistent, then it works to choose the root $\hat{\theta}_{n}$ of $\mathbb{P}_{n} \psi_{\theta}=0$ that is closest to $\tilde{\theta}_{n}$. Because $\left\|\hat{\theta}_{n}-\tilde{\theta}_{n}\right\|$ is smaller than the distance $\left\|\hat{\theta}_{n}^{c}-\tilde{\theta}_{n}\right\|$ between the clairvoyant sequence $\hat{\theta}_{n}^{c}$ and $\tilde{\theta}_{n}$, both distances converge to zero in probability. Thus the sequence of closest roots is consistent.

The assertion of the theorem can also be used in a negative direction. The point $\theta_{0}$ in the theorem is required to be a zero of $\theta \mapsto P \psi_{\theta}$, but, apart from that, it may be arbitrary. Thus, the theorem implies at the same time that a malicious statistician can always choose a sequence of roots $\hat{\theta}_{n}$ that converges to any given zero. These may include other points besides the "true" value of $\theta$. Furthermore, inspection of the proof shows that the sequence of roots can also be chosen to jump back and forth between two (or more) zeros. If the function $\theta \mapsto P \psi_{\theta}$ has multiple roots, we must exercise care. We can be sure that certain roots of $\theta \mapsto \mathbb{P}_{n} \psi_{\theta}$ are bad estimators.

Part of the problem here is caused by using estimating equations, rather than maximization to find estimators, which blurs the distinction between points of absolute maximum, local maximum, and even minimum. In the light of the results on consistency in section 5.2, we may expect the location of the point of absolute maximum of $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ to converge to a point of absolute maximum of $\theta \mapsto P m_{\theta}$. As long as this is unique, the absolute maximizers of the criterion function are typically consistent.
5.43 Example (Weibull distribution). Let $X_{1}, \ldots, X_{n}$ be a sample from the Weibull distribution with density

$$
p_{\theta, \sigma}(x)=\frac{\theta}{\sigma} x^{\theta-1} e^{-x^{\theta} / \sigma}, \quad x>0, \theta>0, \sigma>0 .
$$

(Then $\sigma^{1 / \theta}$ is a scale parameter.) The score function is given by the partial derivatives of the $\log$ density with respect to $\theta$ and $\sigma$ :

$$
\dot{\ell}_{\theta, \sigma}(x)=\left(\frac{1}{\theta}+\log x-\frac{x^{\theta}}{\sigma} \log x, w-\frac{1}{\sigma}+\frac{x^{\theta}}{\sigma^{2}}\right) .
$$

The likelihood equations $\sum \dot{\ell}_{\theta, \sigma}\left(x_{i}\right)=0$ reduce to

$$
\sigma=\frac{1}{n} \sum_{i=1}^{n} x_{i}^{\theta} ; \quad \frac{1}{\theta}+\frac{1}{n} \sum_{i=1}^{n} \log x_{i}-\frac{\sum_{i=1}^{n} x_{i}^{\theta} \log x_{i}}{\sum_{i=1}^{n} x_{i}^{\theta}}=0 .
$$

The second equation is strictly decreasing in $\theta$, from $\infty$ at $\theta=0$ to $\overline{\log x}-\log x_{(n)}$ at $\theta=\infty$. Hence a solution exists, and is unique, unless all $x_{i}$ are equal. Provided the higher-order derivatives of the score function exist and can be dominated, the sequence of maximum likelihood estimators ( $\hat{\theta}_{n}, \hat{\sigma}_{n}$ ) is asymptotically normal by Theorems 5.41 and 5.42. There exist four different third-order derivatives, given by

$$
\begin{aligned}
\frac{\partial^{3} \ell_{\theta, \sigma}(x)}{\partial \theta^{3}} & =\frac{2}{\theta^{3}}-\frac{x^{\theta}}{\sigma} \log ^{3} x \\
\frac{\partial^{3} \ell_{\theta, \sigma}(x)}{\partial \theta^{2} \partial \sigma} & =\frac{x^{\theta}}{\sigma^{2}} \log ^{2} x \\
\frac{\partial^{3} \ell_{\theta, \sigma}(x)}{\partial \theta \partial \sigma^{2}} & =-\frac{2 x^{\theta}}{\sigma^{3}} \log x \\
\frac{\partial^{3} \ell_{\theta, \sigma}(x)}{\partial \sigma^{3}} & =-\frac{2}{\sigma^{3}}+\frac{6 x^{\theta}}{\sigma^{4}} .
\end{aligned}
$$

For $\theta$ and $\sigma$ ranging over sufficiently small neighborhoods of $\theta_{0}$ and $\sigma_{0}$, these functions are dominated by a function of the form

$$
M(x)=A\left(1+x^{B}\right)\left(1+|\log x|+\cdots+|\log x|^{3}\right),
$$

for sufficiently large $A$ and $B$. Because the Weibull distribution has an exponentially small tail, the mixed moment $\mathrm{E}_{\theta_{0}, \sigma_{0}} X^{p}|\log X|^{q}$ is finite for every $p, q \geq 0$. Thus, all moments of $\dot{\ell}_{\theta}$ and $\ddot{\ell}_{\theta}$ exist and $M$ is integrable.

## *5.7 One-Step Estimators

The method of $Z$-estimation as discussed so far has two disadvantages. First, it may be hard to find the roots of the estimating equations. Second, for the roots to be consistent, the estimating equation needs to behave well throughout the parameter set. For instance, existence of a second root close to the boundary of the parameter set may cause trouble. The one-step method overcomes these problems by building on and improving a preliminary estimator $\tilde{\theta}_{n}$.

The idea is to solve the estimator from a linear approximation to the original estimating equation $\Psi_{n}(\theta)=0$. Given a preliminary estimator $\tilde{\theta}_{n}$, the one-step estimator is the solution (in $\theta$ ) to

$$
\Psi_{n}\left(\tilde{\theta}_{n}\right)+\dot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)\left(\theta-\tilde{\theta}_{n}\right)=0
$$

This corresponds to replacing $\Psi_{n}(\theta)$ by its tangent at $\tilde{\theta}_{n}$, and is known as the method of Newton-Rhapson in numerical analysis. The solution $\theta=\hat{\theta}_{n}$ is

$$
\hat{\theta}_{n}=\tilde{\theta}_{n}-\dot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)^{-1} \Psi_{n}\left(\tilde{\theta}_{n}\right)
$$

In numerical analysis this procedure is iterated a number of times, taking $\hat{\theta}_{n}$ as the new preliminary guess, and so on. Provided that the starting point $\tilde{\theta}_{n}$ is well chosen, the sequence of solutions converges to a root of $\Psi_{n}$. Our interest here goes in a different direction. We suppose that the preliminary estimator $\tilde{\theta}_{n}$ is already within range $n^{-1 / 2}$ of the true value of $\theta$. Then, as we shall see, just one iteration of the Newton-Rhapson scheme produces an estimator $\hat{\theta}_{n}$ that is as good as the $Z$-estimator defined by $\Psi_{n}$. In fact, it is better in that its consistency is guaranteed, whereas the true $Z$-estimator may be inconsistent or not uniquely defined.

In this way consistency and asymptotic normality are effectively separated, which is useful because these two aims require different properties of the estimating equations. Good initial estimators can be constructed by ad-hoc methods and take care of consistency. Next, these initial estimators can be improved by the one-step method. Thus, for instance, the good properties of maximum likelihood estimation can be retained, even in cases in which the consistency fails.

In this section we impose the following condition on the random criterion functions $\Psi_{n}$. For every constant $M$ and a given nonsingular matrix $\dot{\Psi}_{0}$,

$$
\begin{equation*}
\sup _{\sqrt{n}\left\|\theta-\theta_{0}\right\|<M}\left\|\sqrt{n}\left(\Psi_{n}(\theta)-\Psi_{n}\left(\theta_{0}\right)\right)-\dot{\Psi}_{0} \sqrt{n}\left(\theta-\theta_{0}\right)\right\| \xrightarrow{\mathrm{P}} 0 . \tag{5.44}
\end{equation*}
$$

Condition (5.44) suggests that $\Psi_{n}$ is differentiable at $\theta_{0}$, with derivative tending to $\dot{\Psi}_{0}$, but this is not an assumption. We do not require that a derivative $\dot{\Psi}_{n}$ exists, and introduce
a further refinement of the Newton-Rhapson scheme by replacing $\dot{\Psi}_{n}\left(\tilde{\theta}_{n}\right)$ by arbitrary estimators. Given nonsingular, random matrices $\dot{\Psi}_{n, 0}$ that converge in probability to $\dot{\Psi}_{0}$ define the one-step estimator

$$
\hat{\theta}_{n}=\tilde{\theta}_{n}-\dot{\Psi}_{n, 0}^{-1} \Psi_{n}\left(\tilde{\theta}_{n}\right)
$$

Call an estimator sequence $\tilde{\theta}_{n} \sqrt{n}$-consistent if the sequence $\sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right)$ is uniformly tight. The interpretation is that $\tilde{\theta}_{n}$ already determines the value $\theta_{0}$ within $n^{-1 / 2}$-range.
5.45 Theorem (One-step estimation). Let $\sqrt{n} \Psi_{n}\left(\theta_{0}\right) \rightsquigarrow Z$ and let (5.44) hold. Then the one-step estimator $\hat{\theta}_{n}$, for a given $\sqrt{n}$-consistent estimator sequence $\tilde{\theta}_{n}$ and estimators $\dot{\Psi}_{n, 0} \xrightarrow{\mathrm{P}} \dot{\Psi}_{0}$, satisfies

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\dot{\Psi}_{0}^{-1} \sqrt{n} \Psi_{n}\left(\theta_{0}\right)+o_{P}(1)
$$

5.46 Addendum. For $\Psi_{n}(\theta)=\mathbb{P}_{n} \psi_{\theta}$ condition (5.44) is satisfied under the conditions of Theorem 5.21 with $\dot{\Psi}_{0}=V_{\theta_{0}}$, and under the conditions of Theorem 5.41 with $\dot{\Psi}_{0}=P \dot{\psi}_{\theta_{0}}$.

Proof. The standardized estimator $\dot{\Psi}_{n, 0} \sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ equals

$$
\dot{\Psi}_{n, 0} \sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right)-\sqrt{n}\left(\Psi_{n}\left(\tilde{\theta}_{n}\right)-\Psi_{n}\left(\theta_{0}\right)\right)-\dot{\Psi}_{n, 0}^{-1} \sqrt{n} \Psi_{n}\left(\theta_{0}\right) .
$$

By (5.44) the second term can be replaced by $-\dot{\Psi}_{0} \sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right)+o_{P}(1)$. Thus the expression can be rewritten as

$$
\left(\dot{\Psi}_{n, 0}-\dot{\Psi}_{0}\right) \sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right)-\sqrt{n} \Psi_{n}\left(\theta_{0}\right)+o_{P}(1) .
$$

The first term converges to zero in probability, and the theorem follows after application of Slutsky's lemma.

For a proof of the addendum, see the proofs of the corresponding theorems.
If the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges in distribution, then it is certainly uniformly tight. Consequently, a sequence of one-step estimators is $\sqrt{n}$-consistent and can itself be used as preliminary estimator for a second iteration of the modified Newton-Rhapson algorithm. Presumably, this would give a value closer to a root of $\Psi_{n}$. However, the limit distribution of this "two-step estimator" is the same, so that repeated iteration does not give asymptotic improvement. In practice a multistep method may nevertheless give better results.

We close this section with a discussion of the discretization trick. This device is mostly of theoretical value and has been introduced to relax condition (5.44) to the following. For every nonrandom sequence $\theta_{n}=\theta_{0}+O\left(n^{-1 / 2}\right)$,

$$
\begin{equation*}
\left\|\sqrt{n}\left(\Psi_{n}\left(\theta_{n}\right)-\Psi_{n}\left(\theta_{0}\right)\right)-\dot{\Psi}_{0} \sqrt{n}\left(\theta_{n}-\theta_{0}\right)\right\| \xrightarrow{\mathrm{P}} 0 . \tag{5.47}
\end{equation*}
$$

This new condition is less stringent and much easier to check. It is sufficiently strong if the preliminary estimators $\tilde{\theta}_{n}$ are discretized on grids of mesh width $n^{-1 / 2}$. For instance, $\tilde{\theta}_{n}$ is suitably discretized if all its realizations are points of the grid $n^{-1 / 2} \mathbb{Z}^{k}$ (consisting of the points $n^{-1 / 2}\left(i_{1}, \ldots, i_{k}\right)$ for integers $\left.i_{1}, \ldots, i_{k}\right)$. This is easy to achieve, but perhaps unnatural. Any preliminary estimator sequence $\tilde{\theta}_{n}$ can be discretized by replacing its values
by the closest points of the grid. Because this changes each coordinate by at most $n^{-1 / 2}$, $\sqrt{n}$-consistency of $\tilde{\theta}_{n}$ is retained by discretization.

Define a one-step estimator $\hat{\theta}_{n}$ as before, but now use a discretized version of the preliminary estimator.
5.48 Theorem (Discretized one-step estimation). Let $\sqrt{n} \Psi_{n}\left(\theta_{0}\right) \rightsquigarrow Z$ and let (5.47) hold. Then the one-step estimator $\hat{\theta}_{n}$, for a given $\sqrt{n}$-consistent, discretized estimator sequence $\tilde{\theta}_{n}$ and estimators $\dot{\Psi}_{n, 0} \xrightarrow{\mathrm{P}} \dot{\Psi}_{0}$, satisfies

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\dot{\Psi}_{0}^{-1} \sqrt{n} \Psi_{n}\left(\theta_{0}\right)+o_{P}(1)
$$

5.49 Addendum. For $\Psi_{n}(\theta)=\mathbb{P}_{n} \psi_{\theta}$ and $\mathbb{P}_{n}$ the empirical measure of a random sample from a density $p_{\theta}$ that is differentiable in quadratic mean (5.38), condition (5.47), is satisfied, with $\dot{\Psi}_{0}=-P_{\theta_{0}} \psi_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{T}$, if, as $\theta \rightarrow \theta_{0}$,

$$
\int\left[\psi_{\theta} \sqrt{p_{\theta}}-\psi_{\theta_{0}} \sqrt{p_{\theta_{0}}}\right]^{2} d \mu \rightarrow 0
$$

Proof. The arguments of the previous proof apply, except that it must be shown that

$$
R\left(\tilde{\theta}_{n}\right):=\sqrt{n}\left(\Psi_{n}\left(\tilde{\theta}_{n}\right)-\Psi_{n}\left(\theta_{0}\right)\right)-\dot{\Psi}_{0}^{-1} \sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right)
$$

converges to zero in probability. Fix $\varepsilon>0$. By the $\sqrt{n}$-consistency, there exists $M$ with $\mathrm{P}\left(\sqrt{n}\left\|\tilde{\theta}_{n}-\theta_{0}\right\|>M\right)<\varepsilon$. If $\sqrt{n}\left\|\tilde{\theta}_{n}-\theta_{0}\right\| \leq M$, then $\tilde{\theta}_{n}$ equals one of the values in the set $S_{n}=\left\{\theta \in n^{-1 / 2} \mathbb{Z}^{k}:\left\|\theta-\theta_{0}\right\| \leq n^{-1 / 2} M\right\}$. For each $M$ and $n$ there are only finitely many elements in this set. Moreover, for fixed $M$ the number of elements is bounded independently of $n$. Thus

$$
\begin{aligned}
\mathrm{P}\left(\left\|R\left(\tilde{\theta}_{n}\right)\right\|>\varepsilon\right) & \leq \varepsilon+\sum_{\theta_{n} \in S_{n}} \mathrm{P}\left(\left\|R\left(\theta_{n}\right)\right\|>\varepsilon \wedge \tilde{\theta}_{n}=\theta_{n}\right) \\
& \leq \varepsilon+\sum_{\theta_{n} \in S_{n}} \mathrm{P}\left(\left\|R\left(\theta_{n}\right)\right\|>\varepsilon\right)
\end{aligned}
$$

The maximum of the terms in the sum corresponds to a sequence of nonrandom vectors $\theta_{n}$ with $\theta_{n}=\theta_{0}+O\left(n^{-1 / 2}\right)$. It converges to zero by (5.47). Because the number of terms in the sum is bounded independently of $n$, the sum converges to zero.

For a proof of the addendum, see proposition A. 10 in [139].
If the score function $\dot{\ell}_{\theta}$ of the model also satisfies the conditions of the addendum, then the estimators $\dot{\Psi}_{n, 0}=-P_{\tilde{\theta}_{n}} \psi_{\tilde{\theta}_{n}} \dot{\ell}_{\tilde{\theta}_{n}}^{T}$ are consistent for $\dot{\Psi}_{0}$. This shows that discretized one-step estimation can be carried through under very mild regularity conditions. Note that the addendum requires only continuity of $\theta \mapsto \psi_{\theta}$, whereas (5.47) appears to require differentiability.
5.50 Example (Cauchy distribution). Suppose $X_{1}, \ldots, X_{n}$ are a sample from the Cauchy location family $p_{\theta}(x)=\pi^{-1}\left(1+(x-\theta)^{2}\right)^{-1}$. Then the score function is given by

$$
\dot{\ell}_{\theta}(x)=\frac{2(x-\theta)}{1+(x-\theta)^{2}}
$$

![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-091.jpg?height=3010&width=3988&top_left_y=541&top_left_x=857)
Figure 5.4. Cauchy log likelihood function of a sample of 25 observations, showing three local maxima. The value of the absolute maximum is well-separated from the other maxima, and its location is close to the true value zero of the parameter.

This function behaves like $1 / x$ for $x \rightarrow \pm \infty$ and is bounded in between. The second moment of $\dot{\ell}_{\theta}\left(X_{1}\right)$ therefore exists, unlike the moments of the distribution itself. Because the sample mean possesses the same (Cauchy) distribution as a single observation $X_{1}$, the sample mean is a very inefficient estimator. Instead we could use the median, or another $M$-estimator. However, the asymptotically best estimator should be based on maximum likelihood. We have

$$
\dot{\ell}_{\theta}(x)=\frac{4(x-\theta)\left((x-\theta)^{2}-3\right)}{\left(1+(x-\theta)^{2}\right)^{3}} .
$$

The tails of this function are of the order $1 / x^{3}$, and the function is bounded in between. These bounds are uniform in $\theta$ varying over a compact interval. Thus the conditions of Theorems 5.41 and 5.42 are satisfied. Since the consistency follows from Example 5.16, the sequence of maximum likelihood estimators is asymptotically normal.

The Cauchy likelihood estimator has gained a bad reputation, because the likelihood equation $\sum \dot{\ell}_{\theta}\left(X_{i}\right)=0$ typically has several roots. The number of roots behaves asymptotically as two times a Poisson $(1 / \pi)$ variable plus 1 . (See [126].) Therefore, the one-step (or possibly multi-step method) is often recommended, with, for instance, the median as the initial estimator. Perhaps a better solution is not to use the likelihood equations, but to determine the maximum likelihood estimator by, for instance, visual inspection of a graph of the likelihood function, as in Figure 5.4. This is particularly appropriate because the difficulty of multiple roots does not occur in the two parameter location-scale model. In the model with density $p_{\theta}(x / \sigma) / \sigma$, the maximum likelihood estimator for $(\theta, \sigma)$ is unique. (See [25].) $\square$
5.51 Example (Mixtures). Let $f$ and $g$ be given, positive probability densities on the real line. Consider estimating the parameter $\theta=(\mu, \nu, \sigma, \tau, p)$ based on a random sample from
the mixture density

$$
x \mapsto p f\left(\frac{x-\mu}{\sigma}\right) \frac{1}{\sigma}+(1-p) g\left(\frac{x-\nu}{\tau}\right) \frac{1}{\tau} .
$$

If $f$ and $g$ are sufficiently regular, then this is a smooth five-dimensional parametric model, and the standard theory should apply. Unfortunately, the supremum of the likelihood over the natural parameter space is $\infty$, and there exists no maximum likelihood estimator. This is seen, for instance, from the fact that the likelihood is bigger than

$$
p f\left(\frac{x_{1}-\mu}{\sigma}\right) \frac{1}{\sigma} \prod_{i=2}^{n}(1-p) g\left(\frac{x_{i}-\nu}{\tau}\right) \frac{1}{\tau} .
$$

If we set $\mu=x_{1}$ and next maximize over $\sigma>0$, then we obtain the value $\infty$ whenever $p>0$, irrespective of the values of $\nu$ and $\tau$.

A one-step estimator appears reasonable in this example. In view of the smoothness of the likelihood, the general theory yields the asymptotic efficiency of a one-step estimator if started with an initial $\sqrt{n}$-consistent estimator. Moment estimators could be appropriate initial estimators.

## *5.8 Rates of Convergence

In this section we discuss some results that give the rate of convergence of $M$-estimators. These results are useful as intermediate steps in deriving a limit distribution, but also of interest on their own. Applications include both classical estimators of "regular" parameters and estimators that converge at a slower than $\sqrt{n}$-rate. The main result is simple enough, but its conditions include a maximal inequality, for which results such as in Chapter 19 are needed.

Let $\mathbb{P}_{n}$ be the empirical distribution of a random sample of size $n$ from a distribution $P$, and, for every $\theta$ in a metric space $\Theta$, let $x \mapsto m_{\theta}(x)$ be a measurable function. Let $\hat{\theta}_{n}$ (nearly) maximize the criterion function $\theta \mapsto \mathbb{P}_{n} m_{\theta}$.

The criterion function may be viewed as the sum of the deterministic map $\theta \mapsto P m_{\theta}$ and the random fluctations $\theta \mapsto \mathbb{P}_{n} m_{\theta}-P m_{\theta}$. The rate of convergence of $\hat{\theta}_{n}$ depends on the combined behavior of these maps. If the deterministic map changes rapidly as $\theta$ moves away from the point of maximum and the random fluctuations are small, then $\hat{\theta}_{n}$ has a high rate of convergence. For convenience of notation we measure the fluctuations in terms of the empirical process $\mathbb{G}_{n} m_{\theta}=\sqrt{n}\left(\mathbb{P}_{n} m_{\theta}-P m_{\theta}\right)$.
5.52 Theorem (Rate of convergence). Assume that for fixed constants $C$ and $\alpha>\beta$, for every $n$, and for every sufficiently small $\delta>0$,

$$
\begin{aligned}
\sup _{d\left(\theta, \theta_{0}\right)<\delta} P\left(m_{\theta}-m_{\theta_{0}}\right) & \leq-C \delta^{\alpha}, \\
\mathrm{E}^{*} \sup _{d\left(\theta, \theta_{0}\right)<\delta}\left|\mathbb{G}_{n}\left(m_{\theta}-m_{\theta_{0}}\right)\right| & \leq C \delta^{\beta} .
\end{aligned}
$$

If the sequence $\hat{\theta}_{n}$ satisfies $\mathbb{P}_{n} m_{\hat{\theta}_{n}} \geq \mathbb{P}_{n} m_{\theta_{0}}-O_{P}\left(n^{\alpha /(2 \beta-2 \alpha)}\right)$ and converges in outer probability to $\theta_{0}$, then $n^{1 /(2 \alpha-2 \beta)} d\left(\hat{\theta}_{n}, \theta_{0}\right)=O_{P}^{*}(1)$.

Proof. Set $r_{n}=n^{1 /(2 \alpha-2 \beta)}$ and suppose that $\hat{\theta}_{n}$ maximizes the map $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ up to a variable $R_{n}=O_{P}\left(r_{n}^{-\alpha}\right)$.

For each $n$, the parameter space minus the point $\theta_{0}$ can be partitioned into the "shells" $S_{j, n}=\left\{\theta: 2^{j-1}<r_{n} d\left(\theta, \theta_{0}\right) \leq 2^{j}\right\}$, with $j$ ranging over the integers. If $r_{n} d\left(\hat{\theta}_{n}, \theta_{0}\right)$ is larger than $2^{M}$ for a given integer $M$, then $\hat{\theta}_{n}$ is in one of the shells $S_{j, n}$ with $j \geq M$. In that case the supremum of the map $\theta \mapsto \mathbb{P}_{n} m_{\theta}-\mathbb{P}_{n} m_{\theta_{0}}$ over this shell is at least $-R_{n}$ by the property of $\hat{\theta}_{n}$. Conclude that, for every $\varepsilon>0$,

$$
\begin{aligned}
\mathrm{P}^{*}\left(r_{n} d\left(\hat{\theta}_{n}, \theta_{0}\right)>2^{M}\right) \leq & \sum_{\substack{j \geq M \\
2^{j} \leq \varepsilon r_{n}}} \mathrm{P}^{*}\left(\sup _{\theta \in S_{j, n}}\left(\mathbb{P}_{n} m_{\theta}-\mathbb{P}_{n} m_{\theta_{0}}\right) \geq-\frac{K}{r_{n}^{\alpha}}\right) \\
& +\mathrm{P}^{*}\left(2 d\left(\hat{\theta}_{n}, \theta_{0}\right) \geq \varepsilon\right)+\mathrm{P}\left(r_{n}^{\alpha} R_{n} \geq K\right)
\end{aligned}
$$

If the sequence $\hat{\theta}_{n}$ is consistent for $\theta_{0}$, then the second probability on the right converges to 0 as $n \rightarrow \infty$, for every fixed $\varepsilon>0$. The third probability on the right can be made arbitrarily small by choice of $K$, uniformly in $n$. Choose $\varepsilon>0$ small enough to ensure that the conditions of the theorem hold for every $\delta \leq \varepsilon$. Then for every $j$ involved in the sum, we have

$$
\sup _{\theta \in S_{j, n}} P\left(m_{\theta}-m_{\theta_{0}}\right) \leq-C \frac{2^{(j-1) \alpha}}{r_{n}^{\alpha}} .
$$

For $\frac{1}{2} C 2^{(M-1) \alpha} \geq K$, the series can be bounded in terms of the empirical process $\mathbb{G}_{n}$ by

$$
\sum_{\substack{j \geq M \\ 2^{j} \leq \varepsilon r_{n}}} \mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\left(m_{\theta}-m_{\theta_{0}}\right)\right\|_{S_{j, n}} \geq C \sqrt{n} \frac{2^{(j-1) \alpha}}{2 r_{n}^{\alpha}}\right) \leq \sum_{j \geq M} \frac{\left(2^{j} / r_{n}\right)^{\beta} 2 r_{n}^{\alpha}}{\sqrt{n} 2^{(j-1) \alpha}},
$$

by Markov's inequality and the definition of $r_{n}$. The right side converges to zero for every $M=M_{n} \rightarrow \infty$.

Consider the special case that the parameter $\theta$ is a Euclidean vector. If the map $\theta \mapsto P m_{\theta}$ is twice-differentiable at the point of maximum $\theta_{0}$, then its first derivative at $\theta_{0}$ vanishes and a Taylor expansion of the limit criterion function takes the form

$$
P\left(m_{\theta}-m_{\theta_{0}}\right)=\frac{1}{2}\left(\theta-\theta_{0}\right)^{T} V\left(\theta-\theta_{0}\right)+o\left(\left\|\theta-\theta_{0}\right\|^{2}\right) .
$$

Then the first condition of the theorem holds with $\alpha=2$ provided that the second-derivative matrix $V$ is nonsingular.

The second condition of the theorem is a maximal inequality and is harder to verify. In "regular" cases it is valid with $\beta=1$ and the theorem yields the "usual" rate of convergence $\sqrt{n}$. The theorem also applies to nonstandard situations and yields, for instance, the rate $n^{1 / 3}$ if $\alpha=2$ and $\beta=\frac{1}{2}$. Lemmas 19.34, 19.36 and 19.38 and corollary 19.35 are examples of maximal inequalities that can be appropriate for the present purpose. They give bounds in terms of the entropies of the classes of functions $\left\{m_{\theta}-m_{\theta_{0}}: d\left(\theta, \theta_{0}\right)<\delta\right\}$.

A Lipschitz condition on the maps $\theta \mapsto m_{\theta}$ is one possibility to obtain simple estimates on these entropies and is applicable in many applications. The result of the following corollary is used earlier in this chapter.
5.53 Corollary. For each $\theta$ in an open subset of Euclidean space let $x \mapsto m_{\theta}(x)$ be a measurable function such that, for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\theta_{0}$ and a measurable function $\dot{m}$ such that $P \dot{m}^{2}<\infty$,

$$
\left|m_{\theta_{1}}(x)-m_{\theta_{2}}(x)\right| \leq \dot{m}(x)\left\|\theta_{1}-\theta_{2}\right\| .
$$

Furthermore, suppose that the map $\theta \mapsto P m_{\theta}$ admits a second-order Taylor expansion at the point of maximum $\theta_{0}$ with nonsingular second derivative. If $\mathbb{P}_{n} m_{\hat{\theta}_{n}} \geq \mathbb{P}_{n} m_{\theta_{0}}-O_{P}\left(n^{-1}\right)$, then $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=O_{P}(1)$, provided that $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$.

Proof. By assumption, the first condition of Theorem 5.52 is valid with $\alpha=2$. To see that the second one is valid with $\beta=1$, we apply Corollary 19.35 to the class of functions $\mathcal{F}=\left\{m_{\theta}-m_{\theta_{0}}:\left\|\theta-\theta_{0}\right\|<\delta\right\}$. This class has envelope function $F=\dot{m} \delta$, whence

$$
\mathrm{E}^{*} \sup _{\left\|\theta-\theta_{0}\right\|<\delta}\left|\mathbb{G}_{n}\left(m_{\theta}-m_{\theta_{0}}\right)\right| \lesssim \int_{0}^{\|\dot{m}\|_{P, 2} \delta} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon
$$

The bracketing entropy of the class $\mathcal{F}$ is estimated in Example 19.7. Inserting the upper bound obtained there into the integral, we obtain that the preceding display is bounded above by a multiple of

$$
\int_{0}^{\|\dot{m}\|_{P, 2} \delta} \sqrt{\log \left(\frac{\delta}{\varepsilon}\right)} d \varepsilon
$$

Change the variables in the integral to see that this is a multiple of $\delta$.
Rates of convergence different from $\sqrt{n}$ are quite common for $M$-estimators of infinitedimensional parameters and may also be obtained through the application of Theorem 5.52. See Chapters 24 and 25 for examples. Rates slower than $\sqrt{n}$ may also arise for fairly simple parametric estimates.
5.54 Example (Modal interval). Suppose that we define an estimator $\hat{\theta}_{n}$ of location as the center of an interval of length 2 that contains the largest possible fraction of the observations. This is an $M$-estimator for the functions $m_{\theta}=1_{[\theta-1, \theta+1]}$.

For many underlying distributions the first condition of Theorem 5.52 holds with $\alpha=2$. It suffices that the map $\theta \mapsto P m_{\theta}=P[\theta-1, \theta+1]$ is twice-differentiable and has a proper maximum at some point $\theta_{0}$. Using the maximal inequality Corollary 19.35 (or Lemma 19.38), we can show that the second condition is valid with $\beta=\frac{1}{2}$. Indeed, the bracketing entropy of the intervals in the real line is of the order $\delta / \varepsilon^{2}$, and the envelope function of the class of functions $1_{[\theta-1, \theta+1]}-1_{\left[\theta_{0}-1, \theta_{0}+1\right]}$ as $\theta$ ranges over $\left(\theta_{0}-\delta, \theta_{0}+\delta\right)$ is bounded by $1_{\left[\theta_{0}-1-\delta, \theta_{0}-1+\delta\right]}+1_{\left[\theta_{0}+1-\delta, \theta_{0}+1+\delta\right]}$, whose squared $L_{2}$-norm is bounded by $\|p\|_{\infty} 2 \delta$.

Thus Theorem 5.52 applies with $\alpha=2$ and $\beta=\frac{1}{2}$ and yields the rate of convergence $n^{1 / 3}$. The resulting location estimator is very robust against outliers. However, in view of its slow convergence rate, one should have good reasons to use it.

The use of an interval of length 2 is somewhat awkward. Every other fixed length would give the same result. More interestingly, we can also replace the fixed-length interval by the smallest interval that contains a fixed fraction, for instance $1 / 2$, of the observations. This
still yields a rate of convergence of $n^{1 / 3}$. The intuitive reason for this is that the length of a "shorth" settles down by a $\sqrt{n}$-rate and hence its randomness is asymptotically negligible relative to its center.

The preceding theorem requires the consistency of $\hat{\theta}_{n}$ as a condition. This consistency is implied if the other conditions are valid for every $\delta>0$, not just for small values of $\delta$. This can be seen from the proof or the more general theorem in the next section. Because the conditions are not natural for large values of $\delta$, it is usually better to argue the consistency by other means.

### 5.8.1 Nuisance Parameters

In Chapter 25 we need an extension of Theorem 5.52 that allows for a "smoothing" or "nuisance" parameter. We also take the opportunity to insert a number of other refinements, which are sometimes useful.

Let $x \mapsto m_{\theta, \eta}(x)$ be measurable functions indexed by parameters $(\theta, \eta)$, and consider estimators $\hat{\theta}_{n}$ contained in a set $\Theta_{n}$ that, for a given $\hat{\eta}_{n}$ contained in a set $H_{n}$, maximize the map

$$
\theta \mapsto \mathbb{P}_{n} m_{\theta, \hat{\eta}_{n}} .
$$

The sets $\Theta_{n}$ and $H_{n}$ need not be metric spaces, but instead we measure the discrepancies between $\hat{\theta}_{n}$ and $\theta_{0}$, and $\hat{\eta}_{n}$ and a limiting value $\eta_{0}$, by nonnegative functions $\theta \mapsto d_{\eta}\left(\theta, \theta_{0}\right)$ and $\eta \mapsto d\left(\eta, \eta_{0}\right)$, which may be arbitrary.
5.55 Theorem. Assume that, for arbitrary functions $e_{n}: \Theta_{n} \times H_{n} \mapsto \mathbb{R}$ and $\phi_{n}:(0, \infty) \mapsto \mathbb{R}$ such that $\delta \mapsto \phi_{n}(\delta) / \delta^{\beta}$ is decreasing for some $\beta<2$, every $(\theta, \eta) \in \Theta_{n} \times H_{n}$, and every $\delta>0$,

$$
\begin{aligned}
& P\left(m_{\theta, \eta}-m_{\theta_{0}, \eta}\right)+e_{n}(\theta, \eta) \leq-d_{\eta}^{2}\left(\theta, \theta_{0}\right)+d^{2}\left(\eta, \eta_{0}\right), \\
& \mathrm{E}^{*} \sup _{\substack{d_{\eta}\left(\theta, \theta_{0}\right)<\delta \\
(\theta, \eta) \in H_{n} \times H_{n}}}\left|\mathbb{G}_{n}\left(m_{\theta, \eta}-m_{\theta_{0}, \eta}\right)-\sqrt{n} e_{n}(\theta, \eta)\right| \leq \phi_{n}(\delta) .
\end{aligned}
$$

Let $\delta_{n}>0$ satisfy $\phi_{n}\left(\delta_{n}\right) \leq \sqrt{n} \delta_{n}^{2}$ for every $n$. If $\mathrm{P}\left(\hat{\theta}_{n} \in \Theta_{n}, \hat{\eta}_{n} \in H_{n}\right) \rightarrow 1$ and $\mathbb{P}_{n} m_{\hat{\theta}_{n}, \hat{\eta}_{n}} \geq \mathbb{P}_{n} m_{\theta_{0}, \hat{\eta}_{n}}-O_{P}\left(\delta_{n}^{2}\right)$, then $d_{\hat{\eta}_{n}}\left(\hat{\theta}_{n}, \theta_{0}\right)=O_{P}^{*}\left(\delta_{n}+d\left(\hat{\eta}_{n}, \eta_{0}\right)\right)$.

Proof. For simplicity assume that $\mathbb{P}_{n} m_{\hat{\theta}_{n}, \hat{\eta}_{n}} \geq \mathbb{P}_{n} m_{\theta_{0}, \hat{\eta}_{n}}$, without a tolerance term. For each $n \in \mathbb{N}, j \in \mathbb{Z}$ and $M>0$, let $S_{n, j, M}$ be the set

$$
\left\{(\theta, \eta) \in \Theta_{n} \times H_{n}: 2^{j-1} \delta_{n}<d_{\eta}\left(\theta, \theta_{0}\right) \leq 2^{j} \delta_{n}, d\left(\eta, \eta_{0}\right) \leq 2^{-M} d_{\eta}\left(\theta, \theta_{0}\right)\right\}
$$

Then the intersection of the events $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right) \in \Theta_{n} \times H_{n}$, and $d_{\hat{\eta}_{n}}\left(\hat{\theta}_{n}, \theta_{0}\right) \geq 2^{M}\left(\delta_{n}+d\left(\hat{\eta}_{n}, \eta_{0}\right)\right)$ is contained in the union of the events $\left\{\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right) \in S_{n, j, M}\right\}$ over $j \geq M$. By the definition of $\hat{\theta}_{n}$, the supremum of $\mathbb{P}_{n}\left(m_{\theta, \eta}-m_{\theta_{0}, \eta}\right)$ over the set of parameters $(\theta, \eta) \in S_{n, j, M}$ is nonnegative on the event $\left\{\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right) \in S_{n, j, M}\right\}$. Conclude that

$$
\begin{aligned}
\mathrm{P}^{*}\left(d_{\hat{\eta}_{n}}\left(\hat{\theta}_{n}, \theta_{0}\right)\right. & \left.\geq 2^{M}\left(\delta_{n}+d\left(\hat{\eta}_{n}, \eta_{0}\right)\right),\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right) \in \Theta_{n} \times H_{n}\right) \\
& \leq \sum_{j \geq M} \mathrm{P}^{*}\left(\sup _{(\theta, \eta) \in S_{n, j, M}} \mathbb{P}_{n}\left(m_{\theta, \eta}-m_{\theta_{0}, \eta}\right) \geq 0\right)
\end{aligned}
$$

For every $j,(\theta, \eta) \in S_{n, j, M}$, and every sufficiently large $M$,

$$
\begin{aligned}
P\left(m_{\theta, \eta}-m_{\theta_{0}, \eta}\right)+e_{n}(\theta, \eta) & \leq-d_{\eta}^{2}\left(\theta, \theta_{0}\right)+d^{2}\left(\eta, \eta_{0}\right) \\
& \leq-\left(1-2^{-2 M}\right) d_{\eta}^{2}\left(\theta, \theta_{0}\right) \leq-2^{2 j-4} \delta_{n}^{2} .
\end{aligned}
$$

From here on the proof is the same as the proof of Theorem 5.52, except that we use that $\phi_{n}(c \delta) \leq c^{\beta} \phi_{n}(\delta)$ for every $c>1$, by the assumption on $\phi_{n}$.

## *5.9 Argmax Theorem

The consistency of a sequence of $M$-estimators can be understood as the points of maximum $\hat{\theta}_{n}$ of the criterion functions $\theta \mapsto M_{n}(\theta)$ converging in probability to a point of maximum of the limit criterion function $\theta \mapsto M(\theta)$. So far we have made no attempt to understand the distributional limit properties of a sequence of $M$-estimators in a similar way. This is possible, but it is somewhat more complicated and is perhaps best studied after developing the theory of weak convergence of stochastic processes, as in Chapters 18 and 19.

Because the estimators $\hat{\theta}_{n}$ typically converge to constants, it is necessary to rescale them before studying distributional limit properties. Thus, we start by searching for a sequence of numbers $r_{n} \mapsto \infty$ such that the sequence $\hat{h}_{n}=r_{n}\left(\hat{\theta}_{n}-\theta\right)$ is uniformly tight. The results of the preceding section should be useful. If $\hat{\theta}_{n}$ maximizes the function $\theta \mapsto M_{n}(\theta)$, then the rescaled estimators $\hat{h}_{n}$ are maximizers of the local criterion functions

$$
h \mapsto M_{n}\left(\theta+\frac{h}{r_{n}}\right)-M_{n}\left(\theta_{0}\right) .
$$

Suppose that these, if suitably normed, converge to a limit process $h \mapsto M(h)$. Then the general principle is that the sequence $\hat{h}_{n}$ converges in distribution to the maximizer of this limit process.

For simplicity of notation we shall write the local criterion functions as $h \mapsto M_{n}(h)$. Let $\left\{M_{n}(h): h \in H_{n}\right\}$ be arbitrary stochastic processes indexed by subsets $H_{n}$ of a given metric space. We wish to prove that the argmax-functional is continuous: If $M_{n} \leadsto M$ and $H_{n} \rightarrow H$ in a suitable sense, then the (near) maximizers $\hat{h}_{n}$ of the random maps $h \mapsto M_{n}(h)$ converge in distribution to the maximizer $\hat{h}$ of the limit process $h \mapsto M(h)$. It is easy to find examples in which this is not true, but given the right definitions it is, under some conditions. Given a set $B$, set

$$
M(B)=\sup _{h \in B} M(h) .
$$

Then convergence in distribution of the vectors $\left(M_{n}(A), M_{n}(B)\right)$ for given pairs of sets $A$ and $B$ is an appropriate form of convergence of $M_{n}$ to $M$. The following theorem gives some flexibility in the choice of the indexing sets. We implicitly either assume that the suprema $M_{n}(B)$ are measurable or understand the weak convergence in terms of outer probabilities, as in Chapter 18.

The result we are looking for is not likely to be true if the maximizer of the limit process is not well defined. Exactly as in Theorem 5.7, the maximum should be "well separated." Because in the present case the limit is a stochastic process, we require that every sample path $h \mapsto M(h)$ possesses a well-separated maximum (condition (5.57)).
5.56 Theorem (Argmax theorem). Let $M_{n}$ and $M$ be stochastic processes indexed by subsets $H_{n}$ and $H$ of a given metric space such that, for every pair of a closed set $F$ and a set $K$ in a given collection $\mathcal{K}$,

$$
\left(M_{n}\left(F \cap K \cap H_{n}\right), M_{n}\left(K \cap H_{n}\right)\right) \rightsquigarrow(M(F \cap K \cap H), M(K \cap H)) .
$$

Furthermore, suppose that every sample path of the process $h \mapsto M(h)$ possesses a wellseparated point of maximum $\hat{h}$ in that, for every open set $G$ and every $K \in \mathcal{K}$,

$$
\begin{equation*}
M(\hat{h})>M\left(G^{c} \cap K \cap H\right), \quad \text { if } \hat{h} \in G, \quad \text { a.s.. } \tag{5.57}
\end{equation*}
$$

If $M_{n}\left(\hat{h}_{n}\right) \geq M_{n}\left(H_{n}\right)-o_{P}(1)$ and for every $\varepsilon>0$ there exists $K \in \mathcal{K}$ such that $\sup _{n} \mathrm{P}\left(\hat{h}_{n} \notin\right. K)<\varepsilon$ and $\mathrm{P}(\hat{h} \notin K)<\varepsilon$, then $\hat{h}_{n} \rightsquigarrow \hat{h}$.

Proof. If $\hat{h}_{n} \in F \cap K$, then $M_{n}\left(F \cap K \cap H_{n}\right) \geq M_{n}(B)-o_{P}(1)$ for any set $B$. Hence, for every closed set $F$ and every $K \in \mathcal{K}$,

$$
\begin{aligned}
\mathrm{P}\left(\hat{h}_{n} \in F \cap K\right) & \leq \mathrm{P}\left(M_{n}\left(F \cap K \cap H_{n}\right) \geq M_{n}\left(K \cap H_{n}\right)-o_{P}(1)\right) \\
& \leq \mathrm{P}(M(F \cap K \cap H) \geq M(K \cap H))+o(1),
\end{aligned}
$$

by Slutsky's lemma and the portmanteau lemma. If $\hat{h} \in F^{c}$, then $M(F \cap K \cap H)$ is strictly smaller than $M(\hat{h})$ by (5.57) and hence on the intersection with the event in the far right side $\hat{h}$ cannot be contained in $K \cap H$. It follows that

$$
\limsup \mathrm{P}\left(\hat{h}_{n} \in F \cap K\right) \leq \mathrm{P}(\hat{h} \in F)+\mathrm{P}(\hat{h} \notin K \cap H) .
$$

By assumption we can choose $K$ such that the left and right sides change by less than $\varepsilon$ if we replace $K$ by the whole space. Hence $\hat{h}_{n} \rightsquigarrow \hat{h}$ by the portmanteau lemma.

The theorem works most smoothly if we can take $\mathcal{K}$ to consist only of the whole space. However, then we are close to assuming some sort of global uniform convergence of $M_{n}$ to $M$, and this may not hold or be hard to prove. It is usually more economical in terms of conditions to show that the maximizers $\hat{h}_{n}$ are contained in certain sets $K$, with high probability. Then uniform convergence of $M_{n}$ to $M$ on $K$ is sufficient. The choice of compact sets $K$ corresponds to establishing the uniform tightness of the sequence $\hat{h}_{n}$ before applying the argmax theorem.

If the sample paths of the processes $M_{n}$ are bounded on $K$ and $H_{n}=H$ for every $n$, then the weak convergence of the processes $M_{n}$ viewed as elements of the space $\ell^{\infty}(K)$ implies the convergence condition of the argmax theorem. This follows by the continuous-mapping theorem, because the map

$$
z \mapsto(z(A \cap K), z(B \cap K))
$$

from $\ell^{\infty}(K)$ to $\mathbb{R}^{2}$ is continuous, for every pair of sets $A$ and $B$. The weak convergence in $\ell^{\infty}(K)$ remains sufficient if the sets $H_{n}$ depend on $n$ but converge in a suitable way. Write $H_{n} \rightarrow H$ if $H$ is the set of all $\operatorname{limits} \lim h_{n}$ of converging sequences $h_{n}$ with $h_{n} \in H_{n}$ for every $n$ and, moreover, the limit $h=\lim _{i} h_{n_{i}}$ of every converging sequence $h_{n_{i}}$ with $h_{n_{i}} \in H_{n_{i}}$ for every $i$ is contained in $H$.
5.58 Corollary. Suppose that $M_{n} \rightsquigarrow M$ in $\ell^{\infty}(K)$ for every compact subset $K$ of $\mathbb{R}^{k}$, for a limit process $M$ with continuous sample paths that have unique points of maxima $\hat{h}$. If $H_{n} \rightarrow H, M_{n}\left(\hat{h}_{n}\right) \geq M_{n}\left(H_{n}\right)-o_{P}(1)$, and the sequence $\hat{h}_{n}$ is uniformly tight, then $\hat{h}_{n} \rightsquigarrow \hat{h}$.

Proof. The compactness of $K$ and the continuity of the sample paths $h \mapsto M(h)$ imply that the (unique) points of maximum $\hat{h}$ are automatically well separated in the sense of (5.57). Indeed, if this fails for a given open set $G \ni \hat{h}$ and $K$ (and a given $\omega$ in the underlying probability space), then there exists a sequence $h_{m}$ in $G^{c} \cap K \cap H$ such that $M\left(h_{m}\right) \rightarrow M(\hat{h})$. If $K$ is compact, then this sequence can be chosen convergent. The limit $h_{0}$ must be in the closed set $G^{c}$ and hence cannot be $\hat{h}$. By the continuity of $M$ it also has the property that $M\left(h_{0}\right)=\lim M\left(h_{m}\right)=M(\hat{h})$. This contradicts the assumption that $\hat{h}$ is a unique point of maximum.

If we can show that $\left(M_{n}\left(F \cap H_{n}\right), M_{n}\left(K \cap H_{n}\right)\right)$ converges to the corresponding limit for every compact sets $F \subset K$, then the theorem is a corollary of Theorem 5.56. If $H_{n}=H$ for every $n$, then this convergence is immediate from the weak convergence of $M_{n}$ to $M$ in $\ell^{\infty}(K)$, by the continuous-mapping theorem. For $H_{n}$ changing with $n$ this convergence may fail, and we need to refine the proof of Theorem 5.56. This goes through with minor changes if

$$
\limsup _{n \rightarrow \infty} \mathrm{P}\left(M_{n}\left(F \cap H_{n}\right)-M_{n}\left(\stackrel{\circ}{K} \cap H_{n}\right) \geq x\right) \leq \mathrm{P}(M(F \cap H)-M(\stackrel{\circ}{K} \cap H) \geq x),
$$

for every $x$, every compact set $F$ and every large closed ball $K$. Define functions $g_{n}: \ell^{\infty}(K) \mapsto \mathbb{R}$ by

$$
g_{n}(z)=\sup _{h \in F \cap H_{n}} z(h)-\sup _{h \in \tilde{K} \cap H_{n}} z(h)
$$

and $g$ similarly, but with $H$ replacing $H_{n}$. By an argument as in the proof of Theorem 18.11, the desired result follows if lim sup $g_{n}\left(z_{n}\right) \leq g(z)$ for every sequence $z_{n} \rightarrow z$ in $\ell^{\infty}(K)$ and continuous function $z$. (Then $\limsup \mathrm{P}\left(g_{n}\left(M_{n}\right) \geq x\right) \leq \mathrm{P}(g(M) \geq x)$ for every $x$, for any weakly converging sequence $M_{n} \rightsquigarrow M$ with a limit with continuous sample paths.) This in turn follows if for every precompact set $B \subset K$,

$$
\sup _{h \in \dot{B} \cap H} z(h) \leq \varliminf_{n \rightarrow \infty} \sup _{h \in B \cap H_{n}} z_{n}(h) \leq \sup _{h \in \bar{B} \cap H} z(h) .
$$

To prove the upper inequality, select $h_{n} \in B \cap H_{n}$ such that

$$
\sup _{h \in B \cap H_{n}} z_{n}(h)=z_{n}\left(h_{n}\right)+o(1)=z\left(h_{n}\right)+o(1) .
$$

Because $\bar{B}$ is compact, every subsequence of $h_{n}$ has a converging subsequence. Because $H_{n} \rightarrow H$, the limit $h$ must be in $\bar{B} \cap H$. Because $z\left(h_{n}\right) \rightarrow z(h)$, the upper bound follows.

To prove the lower inequality, select for given $\varepsilon>0$ an element $h \in \stackrel{\circ}{B} \cap H$ such that

$$
\sup _{h \in \dot{B} \cap H} z(h) \leq z(h)+\varepsilon .
$$

Because $H_{n} \rightarrow H$, there exists $h_{n} \in H_{n}$ with $h_{n} \rightarrow h$. This sequence must be in $\stackrel{\circ}{B} \subset B$ eventually, whence $z(h)=\lim z\left(h_{n}\right)=\lim z_{n}\left(h_{n}\right)$ is bounded above by $\lim \inf \sup _{h \in B \cap H_{n}} z_{n}(h)$.

The argmax theorem can also be used to prove consistency, by applying it to the original criterion functions $\theta \mapsto M_{n}(\theta)$. Then the limit process $\theta \mapsto M(\theta)$ is degenerate, and has a fixed point of maximum $\theta_{0}$. Weak convergence becomes convergence in probability, and the theorem now gives conditions for the consistency $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$. Condition (5.57) reduces to the well-separation of $\theta_{0}$, and the convergence

$$
\sup _{\theta \in F \cap K \cap \Theta_{n}} M_{n}(\theta) \xrightarrow{\mathrm{P}} \sup _{\theta \in F \cap K \cap \Theta} M_{n}(\theta)
$$

is, apart from allowing $\Theta_{n}$ to depend on $n$, weaker than the uniform convergence of $M_{n}$ to $M$.

## Notes

In the section on consistency we have given two main results (uniform convergence and Wald's proof) that have proven their value over the years, but there is more to say on this subject. The two approaches can be unified by replacing the uniform convergence by "onesided uniform convergence," which in the case of i.i.d. observations can be established under the conditions of Wald's theorem by a bracketing approach as in Example 19.8 (but then one-sided). Furthermore, the use of special properties, such as convexity of the $\psi$ or $m$ functions, is often helpful. Examples such as Lemma 5.10, or the treatment of maximum likelihood estimators in exponential families in Chapter 4, appear to indicate that no single approach can be satisfactory.

The study of the asymptotic properties of maximum likelihood estimators and other $M$-estimators has a long history. Fisher [48], [50] was a strong advocate of the method of maximum likelihood and noted its asymptotic optimality as early as the 1920s. What we have labelled the classical conditions correspond to the rigorous treatment given by Cramér [27] in his authoritative book. Huber initiated the systematic study of $M$-estimators, with the purpose of developing robust statistical procedures. His paper [78] contains important ideas that are precursors for the application of techniques from the theory of empirical processes by, among others, Pollard, as in [117], [118], and [120]. For one-dimensional parameters these empirical process methods can be avoided by using a maximal inequality based on the $L_{2}$-norm (see, e.g., Theorem 2.2.4 in [146]). Surprisingly, then a Lipschitz condition on the Hellinger distance (an integrated quantity) suffices; see for example, [80] or [94]. For higher-dimensional parameters the results are also not the best possible, but I do not know of any simple better ones.

The books by Huber [79] and by Hampel, Ronchetti, Rousseeuw, and Stahel [73] are good sources for applications of $M$-estimators in robust statistics. These references also discuss the relative efficiency of the different $M$-estimators, which motivates, for instance, the use of Huber's $\psi$-function. In this chapter we have derived Huber's estimator as the solution of the problem of minimizing the asymptotic variance under the side condition of a uniformly bounded influence function. Originally Huber derived it as the solution to the problem of minimizing the maximum asymptotic variance $\sup _{P} \sigma_{P}^{2}$ for $P$ ranging over a contamination neighborhood: $P=(1-\varepsilon) \Phi+\varepsilon Q$ with $Q$ arbitrary. For $M$-estimators these two approaches turn out to be equivalent.

The one-step method can be traced back to numerical schemes for solving the likelihood equations, including Fisher's method of scoring. One-step estimators were introduced for
their asymptotic efficiency by Le Cam in 1956, who later developed them for general locally asymptotically quadratic models, and also introduced the discretization device, (see [93]).

## PROBLEMS

1. Let $X_{1}, \ldots, X_{n}$ be a sample from a density that is strictly positive and symmetric about some point. Show that the Huber $M$-estimator for location is consistent for the symmetry point.
2. Find an expression for the asymptotic variance of the Huber estimator for location if the observations are normally distributed.
3. Define $\psi(x)=1-p, 0, p$ if $x<0,0,>0$. Show that $\mathrm{E} \psi(X-\theta)=0$ implies that $\mathrm{P}(X< \theta) \leq p \leq \mathrm{P}(X \leq \theta)$.
4. Let $X_{1}, \ldots, X_{n}$ be i.i.d. $N\left(\mu, \sigma^{2}\right)$-distributed. Derive the maximum likelihood estimator for ( $\mu, \sigma^{2}$ ) and show that it is asymptotically normal. Calculate the Fisher information matrix for this parameter and its inverse.
5. Let $X_{1}, \ldots, X_{n}$ be i.i.d. Poisson( $\left.1 / \theta\right)$-distributed. Derive the maximum likelihood estimator for $\theta$ and show that it is asymptotically normal.
6. Let $X_{1}, \ldots, X_{n}$ be i.i.d. $N(\theta, \theta)$-distributed. Derive the maximum likelihood estimator for $\theta$ and show that it is asymptotically normal.
7. Find a sequence of fixed (nonrandom) functions $M_{n}: \mathbb{R} \mapsto \mathbb{R}$ that converges pointwise to a limit $M_{0}$ and such that each $M_{n}$ has a unique maximum at a point $\theta_{n}$, but the sequence $\theta_{n}$ does not converge to $\theta_{0}$. Can you also find a sequence $M_{n}$ that converges uniformly?
8. Find a sequence of fixed (nonrandom) functions $M_{n}: \mathbb{R} \mapsto \mathbb{R}$ that converges pointwise but not uniformly to a limit $M_{0}$ such that each $M_{n}$ has a unique maximum at a point $\theta_{n}$ and the sequence $\theta_{n}$ converges to $\theta_{0}$.
9. Let $X_{1}, \ldots, X_{n}$ be i.i.d. observations from a uniform distribution on $[0, \theta]$. Show that the sequence of maximum likelihood estimators is asymptotically consistent. Show that it is not asymptotically normal.
10. Let $X_{1}, \ldots, X_{n}$ be i.i.d. observations from an exponential density $\theta \exp (-\theta x)$. Show that the sequence of maximum likelihood estimators is asymptotically normal.
11. Let $\mathbb{F}_{n}^{-1}(p)$ be a $p$ th sample quantile of a sample from a cumulative distribution $F$ on $\mathbb{R}$ that is differentiable with positive derivative at the population $p$ th-quantile $F^{-1}(p)=\inf \{x: F(x) \geq p\}$. Show that $\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)$ is asymptotically normal with mean zero and variance $p(1-p) / f\left(F^{-1}(p)\right)^{2}$.
12. Derive a minimal condition on the distribution function $F$ that guarantees the consistency of the sample $p$ th quantile.
13. Calculate the asymptotic variance of $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ in Example 5.26.
14. Suppose that we observe a random sample from the distribution of $(X, Y)$ in the following errors-in-variables model:

$$
\begin{aligned}
& X=Z+e \\
& Y_{i}=\alpha+\beta Z+f
\end{aligned}
$$

where ( $e, f$ ) is bivariate normally distributed with mean 0 and covariance matrix $\sigma^{2} I$ and is independent from the unobservable variable $Z$. In analogy to Example 5.26, construct a system of estimating equations for $(\alpha, \beta)$ based on a conditional likelihood, and study the limit properties of the corresponding estimators.
15. In Example 5.27, for what point is the least squares estimator $\hat{\theta}_{n}$ consistent if we drop the condition that $\mathrm{E}(e \mid X)=0$ ? Derive an (implicit) solution in terms of the function $\mathrm{E}(e \mid X)$. Is it necessarily $\theta_{0}$ if $\mathrm{E} e=0$ ?
16. In Example 5.27, consider the asymptotic behavior of the least absolute-value estimator $\hat{\theta}$ that minimizes $\sum_{i=1}^{n}\left|Y_{i}-\phi_{\theta}\left(X_{i}\right)\right|$.
17. Let $X_{1}, \ldots, X_{n}$ be i.i.d. with density $f_{\lambda, a}(x)=\lambda e^{-\lambda(x-a)} 1\{x \geq a\}$, where the parameters $\lambda>0$ and $a \in \mathbb{R}$ are unknown. Calculate the maximum likelihood estimator $\left(\hat{\lambda}_{n}, \hat{a}_{n}\right)$ of $(\lambda, a)$ and derive its asymptotic properties.
18. Let $X$ be Poisson-distributed with density $p_{\theta}(x)=\theta^{x} e^{-\theta} / x!$. Show by direct calculation that $\mathrm{E}_{\theta} \dot{\ell}_{\theta}(X)=0$ and $\mathrm{E}_{\theta} \ddot{\ell}_{\theta}(X)=-\mathrm{E}_{\theta} \dot{\ell}_{\theta}^{2}(X)$. Compare this with the assertions in the introduction. Apparently, differentiation under the integral (sum) is permitted in this case. Is that obvious from results from measure theory or (complex) analysis?
19. Let $X_{1}, \ldots, X_{n}$ be a sample from the $N(\theta, 1)$ distribution, where it is known that $\theta \geq 0$. Show that the maximum likelihood estimator is not asymptotically normal under $\theta=0$. Why does this not contradict the theorems of this chapter?
20. Show that $\left(\tilde{\theta}-\theta_{0}\right) \Psi_{n}\left(\tilde{\theta}_{n}\right)$ in formula (5.18) converges in probability to zero if $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$, and that there exists an integrable function $M$ and $\delta>0$ with $\left|\ddot{\psi}_{\theta}(x)\right| \leq M(x)$ for every $x$ and every $\left\|\theta-\theta_{0}\right\|<\delta$.
21. If $\hat{\theta}_{n}$ maximizes $M_{n}$, then it also maximizes $M_{n}^{+}$. Show that this may be used to relax the conditions of Theorem 5.7 to $\sup _{\theta}\left|M_{n}^{+}-M^{+}\right|(\theta) \rightarrow 0$ in probability (if $M\left(\theta_{0}\right)>0$ ).
22. Suppose that for every $\varepsilon>0$ there exists a set $\Theta_{\varepsilon}$ with $\liminf \mathrm{P}\left(\hat{\theta}_{n} \in \Theta_{\varepsilon}\right) \geq 1-\varepsilon$. Then uniform convergence of $M_{n}$ to $M$ in Theorem 5.7 can be relaxed to uniform convergence on every $\Theta_{\varepsilon}$.
23. Show that Wald's consistency proof yields almost sure convergence of $\hat{\theta}_{n}$, rather than convergence in probability if the parameter space is compact and $M_{n}\left(\hat{\theta}_{n}\right) \geq M_{n}\left(\theta_{0}\right)-o(1)$.
24. Suppose that $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ are i.i.d. and satisfy the linear regression relationship $Y_{i}= \theta^{T} X_{i}+e_{i}$ for (unobservable) errors $e_{1}, \ldots, e_{n}$ independent of $X_{1}, \ldots, X_{n}$. Show that the mean absolute deviation estimator, which minimizes $\sum\left|Y_{i}-\theta X_{i}\right|$, is asymptotically normal under a mild condition on the error distribution.
25. (i) Verify the conditions of Wald's theorem for $m_{\theta}$ the log likelihood function of the $N\left(\mu, \sigma^{2}\right)$ distribution if the parameter set for $\theta=\left(\mu, \sigma^{2}\right)$ is a compact subset of $\mathbb{R} \times \mathbb{R}^{+}$.
(ii) Extend $m_{\theta}$ by continuity to the compactification of $\mathbb{R} \times \mathbb{R}^{+}$. Show that the conditions of Wald's theorem fail at the points $(\mu, 0)$.
(iii) Replace $m_{\theta}$ by the log likelihood function of a pair of two independent observations from the $N\left(\mu, \sigma^{2}\right)$-distribution. Show that Wald's theorem now does apply, also with a compactified parameter set.
26. A distribution on $\mathbb{R}^{k}$ is called ellipsoidally symmetric if it has a density of the form $x \mapsto g\left((x-\mu)^{T} \Sigma^{-1}(x-\mu)\right)$ for a function $g:[0, \infty) \mapsto[0, \infty)$, a vector $\mu$, and a symmetric positive-definite matrix $\Sigma$. Study the $Z$-estimators for location $\hat{\mu}$ that solve an equation of the form

$$
\sum_{i=1}^{n} \psi\left(\left(X_{i}-\mu\right)^{T} \hat{\Sigma}_{n}^{-1}\left(X_{i}-\mu\right)\right),
$$

for given estimators $\hat{\Sigma}_{n}$ and, for instance, Huber's $\psi$-function. Is the asymptotic distribution of $\hat{\Sigma}_{n}$ important?
27. Suppose that $\Theta$ is a compact metric space and $M: \Theta \rightarrow \mathbb{R}$ is continuous. Show that (5.8) is equivalent to the point $\theta_{0}$ being a point of unique global maximum. Can you relax the continuity of $M$ to some form of "semi-continuity"?

## 6

## Contiguity

> "Contiguity" is another name for "asymptotic absolute continuity." Contiguity arguments are a technique to obtain the limit distribution of a sequence of statistics under underlying laws $Q_{n}$ from a limiting distribution under laws $P_{n}$. Typically, the laws $P_{n}$ describe a null distribution under investigation, and the laws $Q_{n}$ correspond to an alternative hypothesis.

### 6.1 Likelihood Ratios

Let $P$ and $Q$ be measures on a measurable space ( $\Omega, \mathcal{A}$ ). Then $Q$ is absolutely continuous with respect to $P$ if $P(A)=0$ implies $Q(A)=0$ for every measurable set $A$; this is denoted by $Q \ll P$. Furthermore, $P$ and $Q$ are orthogonal if $\Omega$ can be partitioned as $\Omega=\Omega_{P} \cup \Omega_{Q}$ with $\Omega_{P} \cap \Omega_{Q}=\emptyset$ and $P\left(\Omega_{Q}\right)=0=Q\left(\Omega_{P}\right)$. Thus $P$ "charges" only $\Omega_{P}$ and $Q$ "lives on" the set $\Omega_{Q}$, which is disjoint with the "support" of $P$. Orthogonality is denoted by $P \perp Q$.

In general, two measures $P$ and $Q$ need be neither absolutely continuous nor orthogonal. The relationship between their supports can best be described in terms of densities. Suppose $P$ and $Q$ possess densities $p$ and $q$ with respect to a measure $\mu$, and consider the sets

$$
\Omega_{P}=\{p>0\}, \quad \Omega_{Q}=\{q>0\} .
$$

See Figure 6.1. Because $P\left(\Omega_{P}^{c}\right)=\int_{p=0} p d \mu=0$, the measure $P$ is supported on the set $\Omega_{P}$. Similarly, $Q$ is supported on $\Omega_{Q}$. The intersection $\Omega_{P} \cap \Omega_{Q}$ receives positive measure from both $P$ and $Q$ provided its measure under $\mu$ is positive. The measure $Q$ can be written as the sum $Q=Q^{a}+Q^{\perp}$ of the measures

$$
\begin{equation*}
Q^{a}(A)=Q(A \cap\{p>0\}) ; \quad Q^{\perp}(A)=Q(A \cap\{p=0\}) . \tag{6.1}
\end{equation*}
$$

As proved in the next lemma, $Q^{a} \ll P$ and $Q^{\perp} \perp P$. Furthermore, for every measurable set $A$

$$
Q^{a}(A)=\int_{A} \frac{q}{p} d P
$$

The decomposition $Q=Q^{a}+Q^{\perp}$ is called the Lebesgue decomposition of $Q$ with respect to $P$. The measures $Q^{a}$ and $Q^{\perp}$ are called the absolutely continuous part and the orthogonal

![](https://cdn.mathpix.com/cropped/1ac15d5e-ff2b-4703-9302-29b7c3b01f66-103.jpg?height=2216&width=3917&top_left_y=604&top_left_x=907)
Figure 6.1. Supports of measures.

part (or singular part) of $Q$ with respect to $P$, respectively. In view of the preceding display, the function $q / p$ is a density of $Q^{a}$ with respect to $P$. It is denoted $d Q / d P$ (not: $d Q^{a} / d P$ ), so that

$$
\frac{d Q}{d P}=\frac{q}{p}, \quad P-\text { a.s. }
$$

As long as we are only interested in the properties of the quotient $q / p$ under $P$-probability, we may leave the quotient undefined for $p=0$. The density $d Q / d P$ is only $P$-almost surely unique by definition. Even though we have used densities to define them, $d Q / d P$ and the Lebesgue decomposition are actually independent of the choice of densities and dominating measure.

In statistics a more common name for a Radon-Nikodym density is likelihood ratio. We shall think of it as a random variable $d Q / d P: \Omega \mapsto[0, \infty)$ and shall study its law under $P$.
6.2 Lemma. Let $P$ and $Q$ be probability measures with densities $p$ and $q$ with respect to a measure $\mu$. Then for the measures $Q^{a}$ and $Q^{\perp}$ defined in (22.30)
(i) $Q=Q^{a}+Q^{\perp}, Q^{a} \ll P, Q^{\perp} \perp P$.
(ii) $Q^{a}(A)=\int_{A}(q / p) d P$ for every measurable set $A$.
(iii) $Q \ll P$ if and only if $Q(p=0)=0$ if and only if $\int(q / p) d P=1$.

Proof. The first statement of (i) is obvious from the definitions of $Q^{a}$ and $Q^{\perp}$. For the second, we note that $P(A)$ can be zero only if $p(x)=0$ for $\mu$-almost all $x \in A$. In this case, $\mu(A \cap\{p>0\})=0$, whence $Q^{a}(A)=Q(A \cap\{p>0\})=0$ by the absolute continuity of $Q$ with respect to $\mu$. The third statement of (i) follows from $P(p=0)=0$ and $Q^{\perp}(p>0)=Q(\emptyset)=0$.

Statement (ii) follows from

$$
Q^{a}(A)=\int_{A \cap\{p>0\}} q d \mu=\int_{A \cap\{p>0\}} \frac{q}{p} p d \mu=\int_{A} \frac{q}{p} d P .
$$

For (iii) we note first that $Q \ll P$ if and only if $Q^{\perp}=0$. By (22.30) the latter happens if and only if $Q(p=0)=0$. This yields the first "if and only if." For the second, we note
that by (ii) the total mass of $Q^{a}$ is equal to $Q^{a}(\Omega)=\int(q / p) d P$. This is 1 if and only if $Q^{a}=Q$.

It is not true in general that $\int f d Q=\int f(d Q / d P) d P$. For this to be true for every measurable function $f$, the measure $Q$ must be absolutely continuous with respect to $P$. On the other hand, for any $P$ and $Q$ and nonnegative $f$,

$$
\int f d Q \geq \int_{p>0} f q d \mu=\int_{p>0} f \frac{q}{p} p d \mu=\int f \frac{d Q}{d P} d P .
$$

This inequality is used freely in the following. The inequality may be strict, because dividing by zero is not permitted. ${ }^{\dagger}$

### 6.2 Contiguity

If a probability measure $Q$ is absolutely continuous with respect to a probability measure $P$, then the $Q$-law of a random vector $X: \Omega \mapsto \mathbb{R}^{k}$ can be calculated from the $P$-law of the pair $(X, d Q / d P)$ through the formula

$$
\mathrm{E}_{Q} f(X)=\mathrm{E}_{P} f(X) \frac{d Q}{d P} .
$$

With $P^{X, V}$ equal to the law of the pair $(X, V)=(X, d Q / d P)$ under $P$, this relationship can also be expressed as

$$
Q(X \in B)=\mathrm{E}_{P} 1_{B}(X) \frac{d Q}{d P}=\int_{B \times \mathbb{R}} v d P^{X, V}(x, v) .
$$

The validity of these formulas depends essentially on the absolute continuity of $Q$ with respect to $P$, because a part of $Q$ that is orthogonal with respect to $P$ cannot be recovered from any $P$-law.

Consider an asymptotic version of the problem. Let $\left(\Omega_{n}, \mathcal{A}_{n}\right)$ be measurable spaces, each equipped with a pair of probability measures $P_{n}$ and $Q_{n}$. Under what conditions can a $Q_{n}$-limit law of random vectors $X_{n}: \Omega_{n} \mapsto \mathbb{R}^{k}$ be obtained from suitable $P_{n}$-limit laws? In view of the above it is necessary that $Q_{n}$ is "asymptotically absolutely continuous" with respect to $P_{n}$ in a suitable sense. The right concept is contiguity.
6.3 Definition. The sequence $Q_{n}$ is contiguous with respect to the sequence $P_{n}$ if $P_{n}\left(A_{n}\right) \rightarrow 0$ implies $Q_{n}\left(A_{n}\right) \rightarrow 0$ for every sequence of measurable sets $A_{n}$. This is denoted $Q_{n} \triangleleft P_{n}$. The sequences $P_{n}$ and $Q_{n}$ are mutually contiguous if both $P_{n} \triangleleft Q_{n}$ and $Q_{n} \triangleleft P_{n}$. This is denoted $P_{n} \triangleleft \triangleright Q_{n}$.

The name "contiguous" is standard, but perhaps conveys a wrong image. "Contiguity" suggests sequences of probability measures living next to each other, but the correct image is "on top of each other" (in the limit).

[^9]Before answering the question of interest, we give two characterizations of contiguity in terms of the asymptotic behavior of the likelihood ratios of $P_{n}$ and $Q_{n}$. The likelihood ratios $d Q_{n} / d P_{n}$ and $d P_{n} / d Q_{n}$ are nonnegative and satisfy

$$
\mathrm{E}_{P_{n}} \frac{d Q_{n}}{d P_{n}} \leq 1 \quad \text { and } \quad \mathrm{E}_{Q_{n}} \frac{d P_{n}}{d Q_{n}} \leq 1 .
$$

Thus, the sequences of likelihood ratios $d Q_{n} / d P_{n}$ and $d P_{n} / d Q_{n}$ are uniformly tight under $P_{n}$ and $Q_{n}$, respectively. By Prohorov's theorem, every subsequence has a further weakly converging subsequence. The next lemma shows that the properties of the limit points determine contiguity. This can be understood in analogy with the nonasymptotic situation. For probability measures $P$ and $Q$, the following three statements are equivalent by (iii) of Lemma 6.2:

$$
Q \ll P, \quad Q\left(\frac{d P}{d Q}=0\right)=0, \quad \mathrm{E}_{P} \frac{d Q}{d P}=1 .
$$

This equivalence persists if the three statements are replaced by their asymptotic counterparts: Sequences $P_{n}$ and $Q_{n}$ satisfy $Q_{n} \triangleleft P_{n}$, if and only if the weak limit points of $d P_{n} / d Q_{n}$ under $Q_{n}$ give mass 0 to 0 , if and only if the weak limit points of $d Q_{n} / d P_{n}$ under $P_{n}$ have mean 1.
6.4 Lemma (Le Cam's first lemma). Let $P_{n}$ and $Q_{n}$ be sequences of probability measures on measurable spaces ( $\Omega_{n}, \mathcal{A}_{n}$ ). Then the following statements are equivalent:
(i) $Q_{n} \triangleleft P_{n}$.
(ii) If $d P_{n} / d Q_{n} \xrightarrow{Q_{n}} U$ along a subsequence, then $\mathrm{P}(U>0)=1$.
(iii) If $d Q_{n} / d P_{n} \stackrel{P_{n}}{\leadsto} V$ along a subsequence, then $\mathrm{E} V=1$.
(iv) For any statistics $T_{n}: \Omega_{n} \mapsto \mathbb{R}^{k}:$ If $T_{n} \xrightarrow{P_{n}} 0$, then $T_{n} \xrightarrow{Q_{n}} 0$.

Proof. The equivalence of (i) and (iv) follows directly from the definition of contiguity: Given statistics $T_{n}$, consider the sets $A_{n}=\left\{\left\|T_{n}\right\|>\varepsilon\right\}$; given sets $A_{n}$, consider the statistics $T_{n}=1_{A_{n}}$.
(i) ⇒ (ii). For simplicity of notation, we write just $\{n\}$ for the given subsequence along which $d P_{n} / d Q_{n} \stackrel{Q_{n}}{\sim} U$. For given $n$, we define the function $g_{n}(\varepsilon)=Q_{n}\left(d P_{n} / d Q_{n}<\right. \varepsilon)-\mathrm{P}(U<\varepsilon)$. By the portmanteau lemma, $\liminf g_{n}(\varepsilon) \geq 0$ for every $\varepsilon>0$. Then, for $\varepsilon_{n} \downarrow 0$ at a sufficiently slow rate, also $\liminf g_{n}\left(\varepsilon_{n}\right) \geq 0$. Thus,

$$
\mathrm{P}(U=0)=\operatorname{limP}\left(U<\varepsilon_{n}\right) \leq \liminf Q_{n}\left(\frac{d P_{n}}{d Q_{n}}<\varepsilon_{n}\right) .
$$

On the other hand,

$$
P_{n}\left(\frac{d P_{n}}{d Q_{n}} \leq \varepsilon_{n} \wedge q_{n}>0\right)=\int_{d P_{n} / d Q_{n} \leq \varepsilon_{n}} \frac{d P_{n}}{d Q_{n}} d Q_{n} \leq \int \varepsilon_{n} d Q_{n} \rightarrow 0
$$

If $Q_{n}$ is contiguous with respect to $P_{n}$, then the $Q_{n}$-probability of the set on the left goes to zero also. But this is the probability on the right in the first display. Combination shows that $\mathrm{P}(U=0)=0$.
(iii) ⇒ (i). If $P_{n}\left(A_{n}\right) \rightarrow 0$, then the sequence $1_{\Omega_{n}-A_{n}}$ converges to 1 in $P_{n}$-probability. By Prohorov's theorem, every subsequence of $\{n\}$ has a further subsequence along which
$\left(d Q_{n} / d P_{n}, 1_{\Omega_{n}-A_{n}}\right) \rightsquigarrow(V, 1)$ under $P_{n}$, for some weak limit $V$. The function $(v, t) \mapsto v t$ is continuous and nonnegative on the set $[0, \infty) \times\{0,1\}$. By the portmanteau lemma

$$
\liminf Q_{n}\left(\Omega_{n}-A_{n}\right) \geq \liminf \int 1_{\Omega_{n}-A_{n}} \frac{d Q_{n}}{d P_{n}} d P_{n} \geq \mathrm{E} 1 \cdot V
$$

Under (iii) the right side equals $\mathrm{EV}=1$. Then the left side is 1 as well and the sequence $Q_{n}\left(A_{n}\right)=1-Q_{n}\left(\Omega_{n}-A_{n}\right)$ converges to zero.
(ii) ⇒ (iii). The probability measures $\mu_{n}=\frac{1}{2}\left(P_{n}+Q_{n}\right)$ dominate both $P_{n}$ and $Q_{n}$, for every $n$. The sum of the densities of $P_{n}$ and $Q_{n}$ with respect to $\mu_{n}$ equals 2 . Hence, each of the densities takes its values in the compact interval $[0,2]$. By Prohorov's theorem every subsequence possesses a further subsequence along which

$$
\frac{d P_{n}}{d Q_{n}} \stackrel{Q_{n}}{\sim} U, \quad \frac{d Q_{n}}{d P_{n}} \stackrel{P_{n}}{\sim} V, \quad W_{n}:=\frac{d P_{n}}{d \mu_{n}} \stackrel{R_{n}}{\sim} W,
$$

for certain random variables $U, V$ and $W$. Every $W_{n}$ has expectation 1 under $\mu_{n}$. In view of the boundedness, the weak convergence of the sequence $W_{n}$ implies convergence of moments, and the limit variable has mean $\mathrm{E} W=1$ as well. For a given bounded, continuous function $f$, define a function $g:[0,2] \mapsto \mathbb{R}$ by $g(w)=f(w /(2-w))(2-w)$ for $0 \leq w<2$ and $g(2)=0$. Then $g$ is bounded and continuous. Because $d P_{n} / d Q_{n}=W_{n} /\left(2-W_{n}\right)$ and $d Q_{n} / d \mu_{n}=2-W_{n}$, the portmanteau lemma yields

$$
\mathrm{E}_{Q_{n}} f\left(\frac{d P_{n}}{d Q_{n}}\right)=\mathrm{E}_{\mu_{n}} f\left(\frac{d P_{n}}{d Q_{n}}\right) \frac{d Q_{n}}{d \mu_{n}}=\mathrm{E}_{\mu_{n}} g\left(W_{n}\right) \rightarrow \mathrm{E} f\left(\frac{W}{2-W}\right)(2-W),
$$

where the integrand in the right side is understood to be $g(2)=0$ if $W=2$. By assumption, the left side converges to $\mathrm{E} f(U)$. Thus $\mathrm{E} f(U)$ equals the right side of the display for every continuous and bounded function $f$. Take a sequence of such functions with $1 \geq f_{m} \downarrow 1_{\{0\}}$, and conclude by the dominated-convergence theorem that

$$
\mathrm{P}(U=0)=\mathrm{E} 1_{\{0\}}(U)=\mathrm{E} 1_{\{0\}}\left(\frac{W}{2-W}\right)(2-W)=2 \mathrm{P}(W=0) .
$$

By a similar argument, $\mathrm{E} f(V)=\mathrm{E} f((2-W) / W) W$ for every continuous and bounded function $f$, where the integrand on the right is understood to be zero if $W=0$. Take a sequence $0 \leq f_{m}(x) \uparrow x$ and conclude by the monotone convergence theorem that

$$
\mathrm{E} V=\mathrm{E}\left(\frac{2-W}{W}\right) W=\mathrm{E}(2-W) 1_{W>0}=2 \mathrm{P}(W>0)-1
$$

Combination of the last two displays shows that $\mathrm{P}(U=0)+\mathrm{E} V=1$.
6.5 Example (Asymptotic log normality). The following special case plays an important role in the asymptotic theory of smooth parametric models. Let $P_{n}$ and $Q_{n}$ be probability measures on arbitrary measurable spaces such that

$$
\frac{d P_{n}}{d Q_{n}} \stackrel{Q_{n}}{\sim} e^{N\left(\mu, \sigma^{2}\right)} .
$$

Then $Q_{n} \triangleleft P_{n}$. Furthermore, $Q_{n} \triangleleft \triangleright P_{n}$ if and only if $\mu=-\frac{1}{2} \sigma^{2}$.
Because the (log normal) variable on the right is positive, the first assertion is immediate from (ii) of the theorem. The second follows from (iii) with the roles of $P_{n}$ and $Q_{n}$ switched, on noting that $E \exp N\left(\mu, \sigma^{2}\right)=1$ if and only if $\mu=-\frac{1}{2} \sigma^{2}$.

A mean equal to minus half times the variance looks peculiar, but we shall see that this situation arises naturally in the study of the asymptotic optimality of statistical procedures.

The following theorem solves the problem of obtaining a $Q_{n}$-limit law from a $P_{n}$-limit law that we posed in the introduction. The result, a version of Le Cam's third lemma, is in perfect analogy with the nonasymptotic situation.
6.6 Theorem. Let $P_{n}$ and $Q_{n}$ be sequences of probability measures on measurable spaces $\left(\Omega_{n}, \mathcal{A}_{n}\right)$, and let $X_{n}: \Omega_{n} \mapsto \mathbb{R}^{k}$ be a sequence of random vectors. Suppose that $Q_{n} \triangleleft P_{n}$ and

$$
\left(X_{n}, \frac{d Q_{n}}{d P_{n}}\right) \stackrel{P_{n}}{\leadsto}(X, V) .
$$

Then $L(B)=\mathrm{E} 1_{B}(X) V$ defines a probability measure, and $X_{n} \stackrel{Q_{n}}{\hookrightarrow} L$.
Proof. Because $V \geq 0$, it follows with the help of the monotone convergence theorem that $L$ defines a measure. By contiguity, $\mathrm{E} V=1$ and hence $L$ is a probability measure. It is immediate from the definition of $L$ that $\int f d L=\mathrm{E} f(X) V$ for every measurable indicator function $f$. Conclude, in steps, that the same is true for every simple function $f$, any nonnegative measurable function, and every integrable function.

If $f$ is continuous and nonnegative, then so is the function $(x, v) \mapsto f(x) v$ on $\mathbb{R}^{k} \times [0, \infty)$. Thus

$$
\liminf \mathrm{E}_{Q_{n}} f\left(X_{n}\right) \geq \liminf \int f\left(X_{n}\right) \frac{d Q_{n}}{d P_{n}} d P_{n} \geq \mathrm{E} f(X) V
$$

by the portmanteau lemma. Apply the portmanteau lemma in the converse direction to conclude the proof that $X_{n} \stackrel{Q_{n}}{\sim} L$.
6.7 Example (Le Cam's third lemma). The name Le Cam's third lemma is often reserved for the following result. If

$$
\left(X_{n}, \log \frac{d Q_{n}}{d P_{n}}\right) \stackrel{P_{n}}{\rightsquigarrow} N_{k+1}\left(\binom{\mu}{-\frac{1}{2} \sigma^{2}},\left(\begin{array}{cc}
\Sigma & \tau \\
\tau^{T} & \sigma^{2}
\end{array}\right)\right)
$$

then

$$
X_{n} \stackrel{Q_{n}}{\leadsto} N_{k}(\mu+\tau, \Sigma) .
$$

In this situation the asymptotic covariance matrices of the sequence $X_{n}$ are the same under $P_{n}$ and $Q_{n}$, but the mean vectors differ by the asymptotic covariance $\tau$ between $X_{n}$ and the log likelihood ratios. ${ }^{\dagger}$

The statement is a special case of the preceding theorem. Let $(X, W)$ have the given $(k+1)$-dimensional normal distribution. By the continuous mapping theorem, the sequence ( $X_{n}, d Q_{n} / d P_{n}$ ) converges in distribution under $P_{n}$ to ( $X, e^{W}$ ). Because $W$ is $N\left(-\frac{1}{2} \sigma^{2}, \sigma^{2}\right)$ distributed, the sequences $P_{n}$ and $Q_{n}$ are mutually contiguous. According to the abstract

[^10]version of Le Cam's third lemma, $X_{n} \xrightarrow{Q_{n}} L$ with $L(B)=\mathrm{E} 1_{B}(X) e^{W}$. The characteristic function of $L$ is $\int e^{i t^{T} x} d L(x)=\mathrm{E} e^{i t^{T} X} e^{W}$. This is the characteristic function of the given normal distribution at the vector $(t,-i)$. Thus
$$
\int e^{i t^{T} x} d L(x)=e^{i t^{T} \mu-\frac{1}{2} \sigma^{2}-\frac{1}{2}\left(t^{T},-i\right)\left(\begin{array}{cc}
\Sigma & \tau \\
\tau^{T} & \sigma^{2}
\end{array}\right)\binom{t}{-i}}=e^{i t^{T}(\mu+\tau)-\frac{1}{2} t^{T} \Sigma t}
$$

The right side is the characteristic function of the $N_{k}(\mu+\tau, \Sigma)$ distribution.

## Notes

The concept and theory of contiguity was developed by Le Cam in [92]. In his paper the results that were later to become known as Le Cam's lemmas are listed as a single theorem. The names "first" and "third" appear to originate from [71]. (The second lemma is on product measures and the first lemma is actually only the implication (iii) ⇒ (i).)

## PROBLEMS

1. Let $P_{n}=N(0,1)$ and $Q_{n}=N\left(\mu_{n}, 1\right)$. Show that the sequences $P_{n}$ and $Q_{n}$ are mutually contiguous if and only if the sequence $\mu_{n}$ is bounded.
2. Let $P_{n}$ and $Q_{n}$ be the distribution of the mean of a sample of size $n$ from the $N(0,1)$ and the $N\left(\theta_{n}, 1\right)$ distribution, respectively. Show that $P_{n} \triangleleft \triangleright Q_{n}$ if and only if $\theta_{n}=O(1 / \sqrt{n})$.
3. Let $P_{n}$ and $Q_{n}$ be the law of a sample of size $n$ from the uniform distribution on $[0,1]$ or $[0,1+1 / n]$, respectively. Show that $P_{n} \triangleleft Q_{n}$. Is it also true that $Q_{n} \triangleleft P_{n}$ ? Use Lemma 6.4 to derive your answers.
4. Suppose that $\left\|P_{n}-Q_{n}\right\| \rightarrow 0$, where $\|\cdot\|$ is the total variation distance $\|P-Q\|=\sup _{A} \mid P(A)- Q(A) \mid$. Show that $P_{n} \triangleleft \triangleright Q_{n}$.
5. Given $\varepsilon>0$ find an example of sequences such that $P_{n} \triangleleft \triangleright Q_{n}$, but $\left\|P_{n}-Q_{n}\right\| \rightarrow 1-\varepsilon$. (The maximum total variation distance between two probability measures is 1 .) This exercise shows that it is wrong to think of contiguous sequences as being close. (Try measures that are supported on just two points.)
6. Give a simple example in which $P_{n} \triangleleft Q_{n}$, but it is not true that $Q_{n} \triangleleft P_{n}$.
7. Show that the constant sequences $\{P\}$ and $\{Q\}$ are contiguous if and only if $P$ and $Q$ are absolutely continuous.
8. If $P \ll Q$, then $Q\left(A_{n}\right) \rightarrow 0$ implies $P\left(A_{n}\right) \rightarrow 0$ for every sequence of measurable sets. How does this follow from Lemma 6.4?

## 7

## Local Asymptotic Normality

> A sequence of statistical models is "locally asymptotically normal" if, asymptotically, their likelihood ratio processes are similar to those for a normal location parameter. Technically, this is if the likelihood ratio processes admit a certain quadratic expansion. An important example in which this arises is repeated sampling from a smooth parametric model. Local asymptotic normality implies convergence of the models to a Gaussian model after a rescaling of the parameter.

### 7.1 Introduction

Suppose we observe a sample $X_{1}, \ldots, X_{n}$ from a distribution $P_{\theta}$ on some measurable space ( $\mathcal{X}, \mathcal{A}$ ) indexed by a parameter $\theta$ that ranges over an open subset $\Theta$ of $\mathbb{R}^{k}$. Then the full observation is a single observation from the product $P_{\theta}^{n}$ of $n$ copies of $P_{\theta}$, and the statistical model is completely described as the collection of probability measures $\left\{P_{\theta}^{n}: \theta \in \Theta\right\}$ on the sample space ( $\mathcal{X}^{n}, \mathcal{A}^{n}$ ). In the context of the present chapter we shall speak of a statistical experiment, rather than of a statistical model. In this chapter it is shown that many statistical experiments can be approximated by Gaussian experiments after a suitable reparametrization.

The reparametrization is centered around a fixed parameter $\theta_{0}$, which should be regarded as known. We define a local parameter $h=\sqrt{n}\left(\theta-\theta_{0}\right)$, rewrite $P_{\theta}^{n}$ as $P_{\theta_{0}+h / \sqrt{n}}^{n}$, and thus obtain an experiment with parameter $h$. In this chapter we show that, for large $n$, the experiments

$$
\left(P_{\theta_{0}+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right) \quad \text { and } \quad\left(N\left(h, I_{\theta_{0}}^{-1}\right): h \in \mathbb{R}^{k}\right)
$$

are similar in statistical properties, whenever the original experiments $\theta \mapsto P_{\theta}$ are "smooth" in the parameter. The second experiment consists of observing a single observation from a normal distribution with mean $h$ and known covariance matrix (equal to the inverse of the Fisher information matrix). This is a simple experiment, which is easy to analyze, whence the approximation yields much information about the asymptotic properties of the original experiments. This information is extracted in several chapters to follow and concerns both asymptotic optimality theory and the behavior of statistical procedures such as the maximum likelihood estimator and the likelihood ratio test.

We have taken the local parameter set equal to $\mathbb{R}^{k}$, which is not correct if the parameter set $\Theta$ is a true subset of $\mathbb{R}^{k}$. If $\theta_{0}$ is an inner point of the original parameter set, then the vector $\theta=\theta_{0}+h / \sqrt{n}$ is a parameter in $\Theta$ for a given $h$, for every sufficiently large $n$, and the local parameter set converges to the whole of $\mathbb{R}^{k}$ as $n \rightarrow \infty$. Then taking the local parameter set equal to $\mathbb{R}^{k}$ does not cause errors. To give a meaning to the results of this chapter, the measure $P_{\theta_{0}+h / \sqrt{n}}$ may be defined arbitrarily if $\theta_{0}+h / \sqrt{n} \notin \Theta$.

### 7.2 Expanding the Likelihood

The convergence of the local experiments is defined and established later in this chapter. First, we discuss the technical tool: a Taylor expansion of the logarithm of the likelihood. Let $p_{\theta}$ be a density of $P_{\theta}$ with respect to some measure $\mu$. Assume for simplicity that the parameter is one-dimensional and that the $\log$ likelihood $\ell_{\theta}(x)=\log p_{\theta}(x)$ is twicedifferentiable with respect to $\theta$, for every $x$, with derivatives $\dot{\ell}_{\theta}(x)$ and $\ddot{\ell}_{\theta}(x)$. Then, for every fixed $x$,

$$
\log \frac{p_{\theta+h}}{p_{\theta}}(x)=h \dot{\ell}_{\theta}(x)+\frac{1}{2} h^{2} \ddot{\ell}_{\theta}(x)+o_{x}\left(h^{2}\right) .
$$

The subscript $x$ in the remainder term is a reminder of the fact that this term depends on $x$ as well as on $h$. It follows that

$$
\log \prod_{i=1}^{n} \frac{p_{\theta+h / \sqrt{n}}}{p_{\theta}}\left(X_{i}\right)=\frac{h}{\sqrt{n}} \sum_{i=1}^{n} \dot{\ell}_{\theta}\left(X_{i}\right)+\frac{1}{2} \frac{h^{2}}{n} \sum_{i=1}^{n} \ddot{\ell}_{\theta}\left(X_{i}\right)+\operatorname{Rem}_{n} .
$$

Here the score has mean zero, $P_{\theta} \dot{\ell}_{\theta}=0$, and $-P_{\theta} \ddot{\ell}_{\theta}=P_{\theta} \dot{\ell}_{\theta}^{2}=I_{\theta}$ equals the Fisher information for $\theta$ (see, e.g., section 5.5). Hence the first term can be rewritten as $h \Delta_{n, \theta}$, where $\Delta_{n, \theta}=n^{-1 / 2} \sum_{i=1}^{n} \dot{\ell}_{\theta}\left(X_{i}\right)$ is asymptotically normal with mean zero and variance $I_{\theta}$, by the central limit theorem. Furthermore, the second term in the expansion is asymptotically equivalent to $-\frac{1}{2} h^{2} I_{\theta}$, by the law of large numbers. The remainder term should behave as $o(1 / n)$ times a sum of $n$ terms and hopefully is asymptotically negligible. Consequently, under suitable conditions we have, for every $h$,

$$
\log \prod_{i=1}^{n} \frac{p_{\theta+h / \sqrt{n}}}{p_{\theta}}\left(X_{i}\right)=h \Delta_{n, \theta}-\frac{1}{2} I_{\theta} h^{2}+o_{P_{\theta}}(1) .
$$

In the next section we see that this is similar in form to the likelihood ratio process of a Gaussian experiment. Because this expansion concerns the likelihood process in a neighborhood of $\theta$, we speak of "local asymptotic normality" of the sequence of models $\left\{P_{\theta}^{n}: \theta \in \Theta\right\}$.

The preceding derivation can be made rigorous under moment or continuity conditions on the second derivative of the log likelihood. Local asymptotic normality was originally deduced in this manner. Surprisingly, it can also be established under a single condition that only involves a first derivative: differentiability of the root density $\theta \mapsto \sqrt{\underline{p}_{\theta}}$ in quadratic mean. This entails the existence of a vector of measurable functions $\dot{\ell}_{\theta}=\left(\dot{\ell}_{\theta, 1}, \ldots, \dot{\ell}_{\theta, k}\right)^{T}$ such that

$$
\begin{equation*}
\int\left[\sqrt{p_{\theta+h}}-\sqrt{p_{\theta}}-\frac{1}{2} h^{T} \dot{\ell}_{\theta} \sqrt{p_{\theta}}\right]^{2} d \mu=o\left(\|h\|^{2}\right), \quad h \rightarrow 0 \tag{7.1}
\end{equation*}
$$

If this condition is satisfied, then the model ( $P_{\theta}: \theta \in \Theta$ ) is called differentiable in quadratic mean at $\theta$.

Usually, $\frac{1}{2} h^{T} \dot{\ell}_{\theta}(x) \sqrt{p_{\theta}(x)}$ is the derivative of the map $h \mapsto \sqrt{p_{\theta+h}(x)}$ at $h=0$ for (almost) every $x$. In this case

$$
\dot{\ell}_{\theta}(x)=2 \frac{1}{\sqrt{p_{\theta}(x)}} \frac{\partial}{\partial \theta} \sqrt{p_{\theta}(x)}=\frac{\partial}{\partial \theta} \log p_{\theta}(x) .
$$

Condition (7.1) does not require differentiability of the map $\theta \mapsto p_{\theta}(x)$ for any single $x$, but rather differentiability in (quadratic) mean. Admittedly, the latter is typically established by pointwise differentiability plus a convergence theorem for integrals. Because the condition is exactly right for its purpose, we establish in the following theorem local asymptotic normality under (7.1). A lemma following the theorem gives easily verifiable conditions in terms of pointwise derivatives.
7.2 Theorem. Suppose that $\Theta$ is an open subset of $\mathbb{R}^{k}$ and that the model ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean at $\theta$. Then $P_{\theta} \dot{\ell}_{\theta}=0$ and the Fisher information matrix $I_{\theta}=P_{\theta} \dot{\ell}_{\theta} \dot{\ell}_{\theta}^{T}$ exists. Furthermore, for every converging sequence $h_{n} \rightarrow h$, as $n \rightarrow \infty$,

$$
\log \prod_{i=1}^{n} \frac{p_{\theta+h_{n} / \sqrt{n}}}{p_{\theta}}\left(X_{i}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} h^{T} \dot{\ell}_{\theta}\left(X_{i}\right)-\frac{1}{2} h^{T} I_{\theta} h+o_{P_{\theta}}(1) .
$$

Proof. Given a converging sequence $h_{n} \rightarrow h$, we use the abbreviations $p_{n}, p$, and $g$ for $p_{\theta+h_{n} / \sqrt{n}}, p_{\theta}$, and $h^{T} \dot{\ell}_{\theta}$, respectively. By (7.1) the sequence $\sqrt{n}\left(\sqrt{p_{n}}-\sqrt{p}\right)$ converges in quadratic mean (i.e., in $L_{2}(\mu)$ ) to $\frac{1}{2} g \sqrt{p}$. This implies that the sequence $\sqrt{p_{n}}$ converges in quadratic mean to $\sqrt{p}$. By the continuity of the inner product,

$$
P g=\int \frac{1}{2} g \sqrt{p} 2 \sqrt{p} d \mu=\lim \int \sqrt{n}\left(\sqrt{p_{n}}-\sqrt{p}\right)\left(\sqrt{p_{n}}+\sqrt{p}\right) d \mu
$$

The right side equals $\sqrt{n}(1-1)=0$ for every $n$, because both probability densities integrate to 1 . Thus $P g=0$.

The random variable $W_{n i}=2\left[\sqrt{p_{n} / p}\left(X_{i}\right)-1\right]$ is with $P$-probability 1 well defined. By (7.1)

$$
\begin{gather*}
\operatorname{var}\left(\sum_{i=1}^{n} W_{n i}-\frac{1}{\sqrt{n}} \sum_{i=1}^{n} g\left(X_{i}\right)\right) \leq \mathrm{E}\left(\sqrt{n} W_{n i}-g\left(X_{i}\right)\right)^{2} \rightarrow 0  \tag{7.3}\\
\mathrm{E} \sum_{i=1}^{n} W_{n i}=2 n\left(\int \sqrt{p_{n}} \sqrt{p} d \mu-1\right)=-n \int\left[\sqrt{p_{n}}-\sqrt{p}\right]^{2} d \mu \rightarrow-\frac{1}{4} P g^{2}
\end{gather*}
$$

Here $P g^{2}=\int g^{2} d P=h^{T} I_{\theta} h$ by the definitions of $g$ and $I_{\theta}$. If both the means and the variances of a sequence of random variables converge to zero, then the sequence converges to zero in probability. Therefore, combining the preceding pair of displayed equations, we find

$$
\begin{equation*}
\sum_{i=1}^{n} W_{n i}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} g\left(X_{i}\right)-\frac{1}{4} P g^{2}+o_{P}(1) \tag{7.4}
\end{equation*}
$$

Next, we express the log likelihood ratio in $\sum_{i=1}^{n} W_{n i}$ through a Taylor expansion of the logarithm. If we write $\log (1+x)=x-\frac{1}{2} x^{2}+x^{2} R(2 x)$, then $R(x) \rightarrow 0$ as $x \rightarrow 0$, and

$$
\begin{align*}
\log \prod_{i=1}^{n} \frac{p_{n}}{p}\left(X_{i}\right) & =2 \sum_{i=1}^{n} \log \left(1+\frac{1}{2} W_{n i}\right) \\
& =\sum_{i=1}^{n} W_{n i}-\frac{1}{4} \sum_{i=1}^{n} W_{n i}^{2}+\frac{1}{2} \sum_{i=1}^{n} W_{n i}^{2} R\left(W_{n i}\right) . \tag{7.5}
\end{align*}
$$

As a consequence of the right side of (7.3), it is possible to write $n W_{n i}^{2}=g^{2}\left(X_{i}\right)+A_{n i}$ for random variables $A_{n i}$ such that $\mathrm{E}\left|A_{n i}\right| \rightarrow 0$. The averages $\bar{A}_{n}$ converge in mean and hence in probability to zero. Combination with the law of large numbers yields

$$
\sum_{i=1}^{n} W_{n i}^{2}={\overline{\left(g^{2}\right)}}_{n}+\bar{A}_{n} \xrightarrow{P} P g^{2}
$$

By the triangle inequality followed by Markov's inequality,

$$
\begin{aligned}
n \mathrm{P}\left(\left|W_{n i}\right|>\varepsilon \sqrt{2}\right) & \leq n \mathrm{P}\left(g^{2}\left(X_{i}\right)>n \varepsilon^{2}\right)+n \mathrm{P}\left(\left|A_{n i}\right|>n \varepsilon^{2}\right) \\
& \leq \varepsilon^{-2} P g^{2}\left\{g^{2}>n \varepsilon^{2}\right\}+\varepsilon^{-2} \mathrm{E}\left|A_{n i}\right| \rightarrow 0
\end{aligned}
$$

The left side is an upper bound for $\mathrm{P}\left(\max _{1 \leq i \leq n}\left|W_{n i}\right|>\varepsilon \sqrt{2}\right)$. Thus the sequence $\max _{1 \leq i \leq n} \left|W_{n i}\right|$ converges to zero in probability. By the property of the function $R$, the sequence $\max _{1 \leq i \leq n}\left|R\left(W_{n i}\right)\right|$ converges in probability to zero as well. The last term on the right in (7.5) is bounded by $\max _{1 \leq i \leq n}\left|R\left(W_{n i}\right)\right| \sum_{i=1}^{n} W_{n i}^{2}$. Thus it is $o_{P}(1) O_{P}(1)$, and converges in probability to zero. Combine to obtain that

$$
\log \prod_{i=1}^{n} \frac{p_{n}}{p}\left(X_{i}\right)=\sum_{i=1}^{n} W_{n i}-\frac{1}{4} P g^{2}+o_{P}(1)
$$

Together with (7.4) this yields the theorem.
To establish the differentiability in quadratic mean of specific models requires a convergence theorem for integrals. Usually one proceeds by showing differentiability of the map $\theta \mapsto p_{\theta}(x)$ for almost every $x$ plus $\mu$-equi-integrability (e.g., domination). The following lemma takes care of most examples.
7.6 Lemma. For every $\theta$ in an open subset of $\mathbb{R}^{k}$ let $p_{\theta}$ be a $\mu$-probability density. Assume that the map $\theta \mapsto s_{\theta}(x)=\sqrt{p_{\theta}(x)}$ is continuously differentiable for every $x$. If the elements of the matrix $I_{\theta}=\int\left(\dot{p}_{\theta} / p_{\theta}\right)\left(\dot{p}_{\theta}^{T} / p_{\theta}\right) p_{\theta} d \mu$ are well defined and continuous in $\theta$, then the map $\theta \mapsto \sqrt{p_{\theta}}$ is differentiable in quadratic mean (7.1) with $\dot{\ell}_{\theta}$ given by $\dot{p}_{\theta} / p_{\theta}$.

Proof. By the chain rule, the map $\theta \mapsto p_{\theta}(x)=s_{\theta}^{2}(x)$ is differentiable for every $x$ with gradient $\dot{p}_{\theta}=2 s_{\theta} \dot{s}_{\theta}$. Because $s_{\theta}$ is nonnegative, its gradient $\dot{s}_{\theta}$ at a point at which $s_{\theta}=0$ must be zero. Conclude that we can write $\dot{s}_{\theta}=\frac{1}{2}\left(\dot{p}_{\theta} / p_{\theta}\right) \sqrt{p_{\theta}}$, where the quotient $\dot{p}_{\theta} / p_{\theta}$ may be defined arbitrarily if $p_{\theta}=0$. By assumption, the map $\theta \mapsto I_{\theta}=4 \int \dot{s}_{\theta} \dot{s}_{\theta}^{T} d \mu$ is continuous.

Because the map $\theta \mapsto s_{\theta}(x)$ is continuously differentiable, the difference $s_{\theta+h}(x)-s_{\theta}(x)$ can be written as the integral $\int_{0}^{1} h^{T} \dot{s}_{\theta+u h}(x) d u$ of its derivative. By Jensen's (or CauchySchwarz's) inequality, the square of this integral is bounded by the integral $\int_{0}^{1}\left(h^{T} \dot{s}_{\theta+u h}(x)\right)^{2}$
$d u$ of the square. Conclude that

$$
\int\left(\frac{s_{\theta+t h_{t}}-s_{\theta}}{t}\right)^{2} d \mu \leq \iint_{0}^{1}\left(h_{t}^{T} \dot{s}_{\theta+u t h_{t}}\right)^{2} d u d \mu=\frac{1}{4} \int_{0}^{1} h_{t}^{T} I_{\theta+u t h_{t}} h_{t} d u
$$

where the last equality follows by Fubini's theorem and the definition of $I_{\theta}$. For $h_{t} \rightarrow h$ the right side converges to $\frac{1}{4} h^{T} I_{\theta} h=\int\left(h^{T} \dot{s}_{\theta}\right)^{2} d \mu$ by the continuity of the map $\theta \mapsto I_{\theta}$.

By the differentiability of the map $\theta \mapsto s_{\theta}(x)$ the integrand in

$$
\int\left[\frac{s_{\theta+t h_{t}}-s_{\theta}}{t}-h^{T} \dot{s}_{\theta}\right]^{2} d \mu
$$

converges pointwise to zero. The result of the preceding paragraph combined with Proposition 2.29 shows that the integral converges to zero.
7.7 Example (Exponential families). The preceding lemma applies to most exponential family models

$$
p_{\theta}(x)=d(\theta) h(x) e^{Q(\theta)^{T} t(x)}
$$

An exponential family model is smooth in its natural parameter (away from the boundary of the natural parameter space). Thus the maps $\theta \mapsto \sqrt{p_{\theta}(x)}$ are continuously differentiable if the maps $\theta \mapsto Q(\theta)$ are continuously differentiable and map the parameter set $\Theta$ into the interior of the natural parameter space. The score function and information matrix equal

$$
\dot{\ell}_{\theta}(x)=Q_{\theta}^{\prime}\left(t(x)-\mathrm{E}_{\theta} t(X)\right), \quad I_{\theta}=Q_{\theta}^{\prime} \operatorname{cov}_{\theta} t(X)\left(Q_{\theta}^{\prime}\right)^{T} .
$$

Thus the asymptotic expansion of the local log likelihood is valid for most exponential families.
7.8 Example (Location models). The preceding lemma also includes all location models $\{f(x-\theta): \theta \in \mathbb{R}\}$ for a positive, continuously differentiable density $f$ with finite Fisher information for location

$$
I_{f}=\int\left(\frac{f^{\prime}}{f}\right)^{2}(x) f(x) d x
$$

The score function $\dot{\ell}_{\theta}(x)$ can be taken equal to $-\left(f^{\prime} / f\right)(x-\theta)$. The Fisher information is equal to $I_{f}$ for every $\theta$ and hence certainly continuous in $\theta$.

By a refinement of the lemma, differentiability in quadratic mean can also be established for slightly irregular shapes, such as the Laplace density $f(x)=\frac{1}{2} e^{-|x|}$. For the Laplace density the map $\theta \mapsto \log f(x-\theta)$ fails to be differentiable at the single point $\theta=x$. At other points the derivative exists and equals $\operatorname{sign}(x-\theta)$. It can be shown that the Laplace location model is differentiable in quadratic mean with score function $\dot{\ell}_{\theta}(x)= \operatorname{sign}(x-\theta)$. This may be proved by writing the difference $\sqrt{f(x-h)}-\sqrt{f(x)}$ as the integral $\int_{0}^{1} \frac{1}{2} h \operatorname{sign}(x-u h) \sqrt{f(x-u h)} d u$ of its derivative, which is possible even though the derivative does not exist everywhere. Next the proof of the preceding lemma applies.
7.9 Counterexample (Uniform distribution). The family of uniform distributions on $[0, \theta]$ is nowhere differentiable in quadratic mean. The reason is that the support of the
uniform distribution depends too much on the parameter. Differentiability in quadratic mean (7.1) does not require that all densities $p_{\theta}$ have the same support. However, restriction of the integral (7.1) to the set $\left\{p_{\theta}=0\right\}$ yields

$$
P_{\theta+h}\left(p_{\theta}=0\right)=\int_{p_{\theta}=0} p_{\theta+h} d \mu=o\left(h^{2}\right)
$$

Thus, under (7.1) the total mass $P_{\theta+h}\left(p_{\theta}=0\right)$ of $P_{\theta+h}$ that is orthogonal to $P_{\theta}$ must "disappear" as $h \rightarrow 0$ at a rate faster than $h^{2}$.

This is not true for the uniform distribution, because, for $h \geq 0$,

$$
P_{\theta+h}\left(p_{\theta}=0\right)=\int_{[0, \theta]^{c}} \frac{1}{\theta+h} 1_{[0, \theta+h]}(x) d x=\frac{h}{\theta+h}
$$

The orthogonal part does converge to zero, but only at the rate $O(h)$.

### 7.3 Convergence to a Normal Experiment

The true meaning of local asymptotic normality is convergence of the local statistical experiments to a normal experiment. In Chapter 9 the notion of convergence of statistical experiments is introduced in general. In this section we bypass this general theory and establish a direct relationship between the local experiments and a normal limit experiment.

The limit experiment is the experiment that consists of observing a single observation $X$ with the $N\left(h, I_{\theta}^{-1}\right)$-distribution. The log likelihood ratio process of this experiment equals

$$
\log \frac{d N\left(h, I_{\theta}^{-1}\right)}{d N\left(0, I_{\theta}^{-1}\right)}(X)=h^{T} I_{\theta} X-\frac{1}{2} h^{T} I_{\theta} h .
$$

The right side is very similar in form to the right side of the expansion of the log likelihood ratio $\log d P_{\theta+h / \sqrt{n}}^{n} / d P_{\theta}^{n}$ given in Theorem 7.2. In view of the similarity, the possibility of a normal approximation is not a complete surprise. The approximation in this section is "local" in nature: We fix $\theta$ and think of

$$
\left(P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right)
$$

as a statistical model with parameter $h$, for "known" $\theta$. We show that this can be approximated by the statistical model $\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{k}\right)$.

A motivation for studying a local approximation is that, usually, asymptotically, the "true" parameter can be known with unlimited precision. The true statistical difficulty is therefore determined by the nature of the measures $P_{\theta}$ for $\theta$ in a small neighbourhood of the true value. In the present situation "small" turns out to be "of size $O(1 / \sqrt{n})$."

A relationship between the models that can be statistically interpreted will be described through the possible (limit) distributions of statistics. For each $n$, let $T_{n}=T_{n}\left(X_{1}, \ldots, X_{n}\right)$ be a statistic in the experiment ( $P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}$ ) with values in a fixed Euclidean space. Suppose that the sequence of statistics $T_{n}$ converges in distribution under every possible (local) parameter:

$$
T_{n} \stackrel{h}{\rightsquigarrow} L_{\theta, h}, \quad \text { every } h .
$$

Here $\stackrel{h}{\rightsquigarrow}$ means convergence in distribution under the parameter $\theta+h / \sqrt{n}$, and $L_{\theta, h}$ may be any probability distribution. According to the following theorem, the distributions $\left\{L_{\theta, h}: h \in \mathbb{R}^{k}\right\}$ are necessarily the distributions of a statistic $T$ in the normal experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{k}\right)$. Thus, every weakly converging sequence of statistics is "matched" by a statistic in the limit experiment. (In the present set-up the vector $\theta$ is considered known and the vector $h$ is the statistical parameter. Consequently, by "statistics" $T_{n}$ and $T$ are understood measurable maps that do not depend on $h$ but may depend on $\theta$.)

This principle of matching estimators is a method to give the convergence of models a statistical interpretation. Most measures of quality of a statistic can be expressed in the distribution of the statistic under different parameters. For instance, if a certain hypothesis is rejected for values of a statistic $T_{n}$ exceeding a number $c$, then the power function $h \mapsto \mathrm{P}_{h}\left(T_{n}>c\right)$ is relevant; alternatively, if $T_{n}$ is an estimator of $h$, then the mean square error $h \mapsto \mathrm{E}_{h}\left(T_{n}-h\right)^{2}$, or a similar quantity, determines the quality of $T_{n}$. Both quality measures depend on the laws of the statistics only. The following theorem asserts that as a function of $h$ the law of a statistic $T_{n}$ can be well approximated by the law of some statistic $T$. Then the quality of the approximating $T$ is the same as the "asymptotic quality" of the sequence $T_{n}$. Investigation of the possible $T$ should reveal the asymptotic performance of possible sequences $T_{n}$. Concrete applications of this principle to testing and estimation are given in later chapters.

A minor technical complication is that it is necessary to allow randomized statistics in the limit experiment. A randomized statistic $T$ based on the observation $X$ is defined as a measurable map $T=T(X, U)$ that depends on $X$ but may also depend on an independent variable $U$ with a uniform distribution on $[0,1]$. Thus, the statistician working in the limit experiment is allowed to base an estimate or test on both the observation and the outcome of an extra experiment that can be run without knowledge of the parameter. In most situations such randomization is not useful, but the following theorem would not be true without it. ${ }^{\dagger}$
7.10 Theorem. Assume that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean (7.1) at the point $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $T_{n}$ be statistics in the experiments ( $P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}$ ) such that the sequence $T_{n}$ converges in distribution under every $h$. Then there exists a randomized statistic $T$ in the experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in\right. \left.\mathbb{R}^{k}\right)$ such that $T_{n} \stackrel{h}{\leadsto} T$ for every $h$.

Proof. For later reference, it is useful to use the abbreviations

$$
P_{n, h}=P_{\theta+h / \sqrt{n}}^{n}, \quad J=I_{\theta}, \quad \Delta_{n}=\frac{1}{\sqrt{n}} \sum \dot{\ell}_{\theta}\left(X_{i}\right) .
$$

By assumption, the marginals of the sequence ( $T_{n}, \Delta_{n}$ ) converge in distribution under $h=0$; hence they are uniformly tight by Prohorov's theorem. Because marginal tightness implies joint tightness, Prohorov's theorem can be applied in the other direction to see the existence of a subsequence of $\{n\}$ along which

$$
\left(T_{n}, \Delta_{n}\right) \stackrel{0}{\rightsquigarrow}(S, \Delta),
$$

${ }^{\dagger}$ It is not important that $U$ is uniformly distributed. Any randomization mechanism that is sufficiently rich will do.


[^0]:    ${ }^{a}$ The third column gives approximations based on 10,000 simulations.

[^1]:    ${ }^{\dagger}$ More formally it is a Borel measurable map from some probability space in $\mathbb{R}^{k}$. Throughout it is implicitly understood that variables $X, g(X)$, and so forth of which we compute expectations or probabilities are measurable maps on some probability space.

[^2]:    ${ }^{\dagger}$ A function is called Lipschitz if there exists a number $L$ such that $|f(x)-f(y)| \leq L d(x, y)$, for every $x$ and $y$. The least such number $L$ is denoted $\|f\|_{\text {lip }}$.

[^3]:    ${ }^{\dagger}$ The sign-function is defined as $\operatorname{sign}(x)=-1,0,1$ if $x<0, x=0$ or $x>0$, respectively. Also $x^{+}$means $x \vee 0=\max (x, 0)$. For the median we assume that there are no tied observations (in the middle).

[^4]:    ${ }^{\dagger}$ Some of the expressions in this display may be nonmeasurable. Then the probability statements are understood in terms of outer measure.

[^5]:    ${ }^{\dagger}$ Alternatively, consider all probability distributions on the compactification $[0, \infty]$ again equipped with the weak topology.

[^6]:    ${ }^{\dagger}$ Alternatively, it suffices that $\theta \mapsto m_{\theta}$ is differentiable at $\theta_{0}$ in $P$-probability.

[^7]:    ${ }^{\dagger}$ To make the following derivation rigorous, more information concerning the remainder term would be necessary.

[^8]:    ${ }^{\dagger}$ Presently we take the expectation $P_{\theta_{0}}$ under the parameter $\theta_{0}$, whereas the derivation in section 5.3 is valid for a generic underlying probability structure and does not conceptually require that the set of parameters $\theta$ indexes a set of underlying distributions.

[^9]:    ${ }^{\dagger}$ The algebraic identify $d Q=(d Q / d P) d P$ is false, because the notation $d Q / d P$ is used as shorthand for $d Q^{a} / d P$ : If we write $d Q / d P$, then we are not implicitly assuming that $Q \ll P$.

[^10]:    ${ }^{\dagger}$ We set $\log 0=-\infty$; because the normal distribution does not charge the point $-\infty$ the assumed asymptotic normality of $\log d Q_{n} / d P_{n}$ includes the assumption that $P_{n}\left(d Q_{n} / d P_{n}=0\right) \rightarrow 0$.

