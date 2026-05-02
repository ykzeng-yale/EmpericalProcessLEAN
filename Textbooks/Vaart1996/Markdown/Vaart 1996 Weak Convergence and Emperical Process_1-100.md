Springer Series in Statistics

Aad W. van der Vaart Jon A. Wellner

## Weak Convergence and Empirical Processes

With Applications to Statistics

## Springer Series in Statistics

## Advisors:

P. Bickel, P. Diggle, S. Fienberg, K. Krickeberg, I. Olkin, N. Wermuth, S. Zeger

## Springer Series in Statistics

Andersen/Borgan/Gill/Keiding: Statistical Models Based on Counting Processes.
Andrews/Herzberg: Data: A Collection of Problems from Many Fields for the Student and Research Worker.
Anscombe: Computing in Statistical Science through APL.
Berger: Statistical Decision Theory and Bayesian Analysis, 2nd edition.
Bolfarine/Zacks: Prediction Theory for Finite Populations.
Brémaud: Point Processes and Queues: Martingale Dynamics.
Brockwell/Davis: Time Series: Theory and Methods, 2nd edition.
Daley/Vere-Jones: An Introduction to the Theory of Point Processes.
Dzhaparidze: Parameter Estimation and Hypothesis Testing in Spectral Analysis of Stationary Time Series.
Fahrmeir/Tutz: Multivariate Statistical Modelling Based on Generalized Linear Models.
Farrell: Multivariate Calculation.
Federer: Statistical Design and Analysis for Intercropping Experiments.
Fienberg/Hoaglin/Kruskal/Tanur (Eds.): A Statistical Model: Frederick Mosteller's Contributions to Statistics, Science and Public Policy.
Fisher/Sen: The Collected Works of Wassily Hoeffding.
Good: Permutation Tests: A Practical Guide to Resampling Methods for Testing Hypotheses.
Goodman/Kruskal: Measures of Association for Cross Classifications.
Grandell: Aspects of Risk Theory.
Hall: The Bootstrap and Edgeworth Expansion.
Härdle: Smoothing Techniques: With Implementation in S.
Hartigan: Bayes Theory.
Heyer: Theory of Statistical Experiments.
Jolliffe: Principal Component Analysis.
Kolen/Brennan: Test Equating: Methods and Practices.
Kotz/Johnson (Eds.): Breakthroughs in Statistics Volume I.
Kotz/Johnson (Eds.): Breakthroughs in Statistics Volume II.
Kres: Statistical Tables for Multivariate Analysis.
Le Cam: Asymptotic Methods in Statistical Decision Theory.
Le Cam/Yang: Asymptotics in Statistics: Some Basic Concepts.
Longford: Models for Uncertainty in Educational Testing.
Manoukian: Modern Concepts and Theorems of Mathematical Statistics.
Miller, Jr.: Simultaneous Statistical Inference, 2nd edition.
Mosteller/Wallace: Applied Bayesian and Classical Inference: The Case of The Federalist Papers.
Pollard: Convergence of Stochastic Processes.
Pratt/Gibbons: Concepts of Nonparametric Theory.

# Weak Convergence and Empirical Processes 

## With Applications to Statistics

Aad W. van der Vaart
Department of Mathematics
and Computer Science
Free University
De Boelelaan 1081a
1081 HV Amsterdam
The Netherlands
aad@cs.vu.nl

Jon A. Wellner
University of Washington
Statistics
Box 354322
Seattle, WA 98195-4322
jaw@stat.washington.edu
With one illustration.
Library of Congress Cataloging-in-Publication Data
Vaart, A.W. van der.
Weak convergence and empirical processes / by Aad van der Vaart and Jon A. Wellner.
p. cm. - (Springer series in statistics)

Includes bibliographical references and indexes.
ISBN 978-1-4757-2547-6 ISBN 978-1-4757-2545-2 (eBook)
DOI 10.1007/978-1-4757-2545-2

1. Stochastic processes. 2. Convergence. 3. Distribution

| (Probability theory) 4. Sampling (Statistics) | I. Wellner, Jon A., |
| :--- | :--- |
| $1945-$ II. Title. | III. Series. |
| QA274.V33 1996 |  |
| $519.2-$ dc20 | $95-49099$ |

Printed on acid-free paper.
© 1996 by Springer Science+Business Media New York
Originally published by Springer-Verlag New York, Inc. in 1996
Softcover reprint of the hardcover 1st edition 1996
All rights reserved. This work may not be translated or copied in whole or in part without the written permission of the publisher Springer Science+Business Media, LLC , except for brief excerpts in connection with reviews or scholarly analysis. Use in connection with any form of information storage and retrieval, electronic adaptation, computer software, or by similar or dissimilar methodology now known or hereafter developed is forbidden.
The use of general descriptive names, trade names, trademarks, etc., in this publication, even if the former are not especially identified, is not to be taken as a sign that such names, as understood by the Trade Marks and Merchandise Marks Act, may accordingly be used freely by anyone.

Production managed by Frank Ganz; manufacturing supervised by Jacqui Ashri.
Photocomposed pages prepared from the author's TeX files.

To Maryse
To Cynthia

## Preface

This book tries to do three things. The first goal is to give an exposition of certain modes of stochastic convergence, in particular convergence in distribution. The classical theory of this subject was developed mostly in the 1950s and is well summarized in Billingsley (1968). During the last 15 years, the need for a more general theory allowing random elements that are not Borel measurable has become well established, particularly in developing the theory of empirical processes. Part 1 of the book, Stochastic Convergence, gives an exposition of such a theory following the ideas of J. Hoffmann-Jørgensen and R. M. Dudley.

A second goal is to use the weak convergence theory background developed in Part 1 to present an account of major components of the modern theory of empirical processes indexed by classes of sets and functions. The weak convergence theory developed in Part 1 is important for this, simply because the empirical processes studied in Part 2, Empirical Processes, are naturally viewed as taking values in nonseparable Banach spaces, even in the most elementary cases, and are typically not Borel measurable. Much of the theory presented in Part 2 has previously been scattered in the journal literature and has, as a result, been accessible only to a relatively small number of specialists. In view of the importance of this theory for statistics, we hope that the presentation given here will make this theory more accessible to statisticians as well as to probabilists interested in statistical applications.

Our third goal is to illustrate the usefulness of modern weak convergence theory and modern empirical process theory for statistics by a wide
variety of applications. On the one hand, as is also clear through the work of David Pollard, the theory of empirical processes provides a collection of extremely powerful tools for proving many of the main limit theorems of asymptotic statistics. On the other hand, the empirical distribution indexed by a collection of sets or functions is an object of independent statistical interest; for instance, as a measure of goodness of fit. The topics included in Part 3 of the book, Statistical Applications, range from rates of convergence in semiparametric estimation, to the functional delta-method, bootstrap, permutation empirical processes, and the convolution theorem. We have not aimed at giving an exhaustive coverage of the statistical background or related literature in presenting these applications. The choices made reflect our personal interests and research efforts over the past few years, so the reader should understand that many equally interesting applications and further research directions are not covered here. For instance, we expect significant progress in semiparametric theory through the use of empirical processes in the next few years. Wellner (1992) reviews various applications of empirical process methods through 1992.

This project began with a joint effort to develop some results in the Hoffmann-Jørgensen theory (namely Prohorov's Theorem 1.3.9) needed to prove the convolution and asymptotic minimax theorem for estimators with values in nonseparable Banach spaces (see Chapter 3.11). That effort was successful, but it resulted in a manuscript that was too awkward for publication in a journal. The generality offered by the new weak convergence theory and the many applications of general empirical process theory in statistics led us to explore the area further. The result, several years later, is this book.

Along the way we have learned much from the main contributors to empirical process theory, from colleagues, and from friends. In particular, we owe thanks to Lucien Birgé, R. M. Dudley, Peter Gaenssler, Sara van de Geer, Richard Gill, Evarist Giné, Piet Groeneboom, Lucien Le Cam, Michel Ledoux, Pascal Massart, Susan Murphy, David Pollard, Michel Talagrand, and Joel Zinn, for advice, corrections, discussions, clarifications, inspiration, preprints, and help.

The authors presented preliminary versions of various parts of the manuscript in courses at the Free University, Amsterdam, and the University of Washington to patient and sharp-eyed groups of students, including Jian Huang, Marianne Jonker, Brad McNeney, Jinko Graham, Jens Praestgaard, and Anne Sheehy. We owe them as well as Franz Strobl, Klaus Ziegler, and Lutz Duembgen thanks for picking up errors and points needing clarification.

The authors have been partially supported in their research efforts over the period of work on this book (1988-1995) by grants from the National Science Foundation, NIAID, NWO, NATO, CNRS, Stieltjes Institute, and Free University Amsterdam (which funded several visits of the second author to that fair city). Our thanks also go to our editor at Springer, Martin

Gilchrist, and to the staff at Springer-Verlag for their efficient job in turning the $\mathrm{T}_{\mathrm{E}} \mathrm{X}$ manuscript into a published book.

Amsterdam and Seattle
August 1995

## Reading Guide

This book consists of three parts and an appendix. Part 1 is an exposition of (mostly) three modes of convergence of stochastic variables with values in metric spaces: convergence in distribution, convergence in probability, and almost sure convergence. A new aspect of this part, as compared to existing literature, is the fact that the stochastic variables are not assumed measurable with respect to the Borel $\sigma$-field. Part 1 is also useful in collecting a large number of results that have thus far not been available in book form in sufficient generality. In particular this concerns the systematic treatment of convergence in distribution in spaces of bounded functions equipped with the supremum metric. Most subjects treated in Part 1 are used in the two later parts of the book, but Chapters 1.2, 1.3, 1.5, 1.9, and 1.10 probably form the core of this part, and should be read in this order. Part 1 begins with a thorough introduction.

Part 2 is mostly concerned with the empirical measure and empirical process of a sample of observations, indexed by a class of functions. These are the maps $f \mapsto \sum_{i=1}^{n} f\left(X_{i}\right)$ and $f \mapsto n^{-1 / 2} \sum_{i=1}^{n}\left(f\left(X_{i}\right)-P f\right)$ whose domain is a class $\mathcal{F}$ of measurable functions. The main results in this part are contained in Chapters 2.4 and 2.5 and concern the uniform law of large numbers (Glivenko-Cantelli theorem) and uniform central limit theorem (Donsker theorem), respectively. Chapters 2.6, 2.7, and 2.10 contain many examples of classes that satisfy the conditions of the theorems in these chapters. Chapter 2.1 is an introduction and Chapters 2.2 and 2.3 are necessary preparation for the main results of Part 2. Again, many of the results from the other chapters reappear later in the book but need not be studied in sequential order.

Part 3 consists of 11 chapters, which in principle can be read independently. This part shows the wide range of applications of the results obtained in the earlier parts in statistics, ranging from parametric and nonparametric estimation to the bootstrap, the functional delta-method, and Kolmogorov-Smirnov statistics. Every chapter assumes familiarity of the basic notation of Parts 1 and 2, but no section requires knowledge of more than a few sections of Part 2. Chapter 3.1 gives an overview of this part.

The material presented in the three parts is self-contained to a reasonable extent. The appendix covers a number of auxiliary subjects that are used to develop some of the material in the three main Parts. Some results are presented with proof and some without, to serve as an easy reference.

Most of the chapters contain a number of "problems and complements" at the end. A number of these are real, textbook-style problems, but a lot of this material is meant as a supplement to the main text. Some problems present technical details, while other problems concern additional results of interest. We should warn the reader that the density of errors in these problem sections is probably higher than in the main text. Many problems and complements have not been double-checked.

## Contents

Preface ..... vii
Reading Guide ..... xi

1. Stochastic Convergence ..... 1
1.1. Introduction ..... 2
1.2. Outer Integrals and Measurable Majorants ..... 6
1.3. Weak Convergence ..... 16
1.4. Product Spaces ..... 29
1.5. Spaces of Bounded Functions ..... 34
1.6. Spaces of Locally Bounded Functions ..... 43
1.7. The Ball Sigma-Field and Measurability of Suprema ..... 45
1.8. Hilbert Spaces ..... 49
1.9. Convergence: Almost Surely and in Probability ..... 52
1.10. Convergence: Weak, Almost Uniform, and in Probability ..... 57
1.11. Refinements ..... 67
1.12. Uniformity and Metrization ..... 71
Notes ..... 75
2. Empirical Processes ..... 79
2.1. Introduction ..... 80
2.1.1. Overview of Chapters 2.3-2.14 ..... 83
2.1.2. Asymptotic Equicontinuity ..... 89
2.1.3. Maximal Inequalities ..... 90
*2.1.4. The Central Limit Theorem in Banach Spaces ..... 91
2.2. Maximal Inequalities and Covering Numbers ..... 95
2.2.1. Sub-Gaussian Inequalities ..... 100
2.2.2. Bernstein's Inequality ..... 102
*2.2.3. Tightness Under an Increment Bound ..... 104
2.3. Symmetrization and Measurability ..... 107
2.3.1. Symmetrization ..... 107
*2.3.2. More Symmetrization ..... 111
*2.3.3. Separable Versions ..... 115
2.4. Glivenko-Cantelli Theorems ..... 122
2.5. Donsker Theorems ..... 127
2.5.1. Uniform Entropy ..... 127
2.5.2. Bracketing ..... 129
2.6. Uniform Entropy Numbers ..... 134
26.1. VC-Classes of Sets ..... 134
2.6.2. VC-Classes of Functions ..... 140
2.6.3. Convex Hulls and VC-Hull Classes ..... 142
2.6.4. VC-Major Classes ..... 145
2.6.5. Examples and Permanence Properties ..... 146
2.7. Bracketing Numbers ..... 154
2.7.1. Smooth Functions and Sets ..... 154
2.7.2. Monotone Functions ..... 159
2.7.3. Closed Convex Sets and Convex Functions ..... 162
2.7.4. Classes That Are Lipschitz in a Parameter ..... 164
2.8. Uniformity in the Underlying Distribution ..... 166
2.8.1. Glivenko-Cantelli Theorems ..... 166
2.8.2 Donsker Theorems ..... 168
2.8.3. Central Limit Theorem Under Sequences ..... 173
2.9. Multiplier Central Limit Theorems ..... 176
2.10. Permanence of the Donsker Property ..... 190
2.10.1. Closures and Convex Hulls ..... 190
2.10.2. Lipschitz Transformations ..... 192
2.10.3. Permanence of the Uniform Entropy Bound ..... 198
2.10.4. Partitions of the Sample Space ..... 200
2.11. The Central Limit Theorem for Processes ..... 205
2.11.1. Random Entropy ..... 205
2.11.2. Bracketing ..... 210
2.11.3. Classes of Functions Changing with $n$ ..... 220
2.12. Partial-Sum Processes ..... 225
2.12.1. The Sequential Empirical Process ..... 225
2.12.2. Partial-Sum Processes on Lattices ..... 228
2.13. Other Donsker Classes ..... 232
2.13.1. Sequences ..... 232
2.13.2. Elliptical Classes ..... 233
2.13.3. Classes of Sets ..... 236
2.14. Tail Bounds ..... 238
2.14.1. Finite Entropy Integrals ..... 238
2.14.2. Uniformly Bounded Classes ..... 245
2.14.3. Deviations from the Mean ..... 254
2.14.4. Proof of Theorem 2.14.13 ..... 257
Notes ..... 269
3. Statistical Applications ..... 277
3.1. Introduction ..... 278
3.2. M-Estimators ..... 284
3.2.1. The Argmax Theorem ..... 285
3.2.2. Rate of Convergence ..... 289
3.2.3. Examples ..... 294
3.2.4. Linearization ..... 300
3.3. Z-Estimators ..... 309
3.4. Rates of Convergence ..... 321
3.4.1. Maximum Likelihood ..... 326
3.4.2. Concave Parametrizations ..... 330
3.4.3. Least Squares Regression ..... 331
3.4.4. Least-Absolute-Deviation Regression ..... 336
3.5. Random Sample Size, Poissonization and Kac Processes ..... 339
3.5.1. Random Sample Size ..... 339
3.5.2. Poissonization ..... 341
3.6. The Bootstrap ..... 345
3.6.1. The Empirical Bootstrap ..... 345
3.6.2. The Exchangeable Bootstrap ..... 353
3.7. The Two-Sample Problem ..... 360
3.7.1. Permutation Empirical Processes ..... 362
3.7.2. Two-Sample Bootstrap ..... 365
3.8. Independence Empirical Processes ..... 367
3.9. The Delta-Method ..... 372
3.9.1. Main Result ..... 372
3.9.2. Gaussian Limits ..... 376
3.9.3. The Delta-Method for the Bootstrap ..... 377
3.9.4. Examples of the Delta-Method ..... 381
3.10. Contiguity ..... 401
3.10.1. The Empirical Process ..... 406
3.10.2. Change-Point Alternatives ..... 408
3.11. Convolution and Minimax Theorems ..... 412
3.11.1. Efficiency of the Empirical Distribution ..... 420
Notes ..... 423
A. Appendix ..... 429
A.1. Inequalities ..... 430
A.2. Gaussian Processes ..... 437
A.2.1. Inequalities and Gaussian Comparison ..... 437
A.2.2. Exponential Bounds ..... 442
A.2.3. Majorizing Measures ..... 445
A.2.4. Further Results ..... 447
A.3. Rademacher Processes ..... 449
A.4. Isoperimetric Inequalities for Product Measures ..... 451
A.5. Some Limit Theorems ..... 456
A.6. More Inequalities ..... 459
A.6.1. Binomial Random Variables ..... 459
A.6.2. Multinomial Random Vectors ..... 462
A.6.3. Rademacher Sums ..... 463
Notes ..... 465
References ..... 467
Author Index ..... 487
Subject Index ..... 493
List of Symbols ..... 506

PART 1
Stochastic Convergence

## 1.1

## Introduction

The first goal in this book is to give an exposition of the modern weak convergence theory suitable for the study of empirical processes.

Let $(\mathbb{D}, d)$ be a metric space, and let $\left\{P_{n}\right\}$ and $P$ be Borel probability measures on $(\mathbb{D}, \mathcal{D})$, where $\mathcal{D}$ is the Borel $\sigma$-field on $\mathbb{D}$, the smallest $\sigma$-field containing all the open sets. Then the sequence $P_{n}$ converges weakly to $P$, which we write as $P_{n} \rightsquigarrow P$, if and only if

$$
\begin{equation*}
\int_{\mathbb{D}} f d P_{n} \rightarrow \int_{\mathbb{D}} f d P, \quad \text { for all } f \in C_{b}(\mathbb{D}) \tag{1.1.1}
\end{equation*}
$$

Here $C_{b}(\mathbb{D})$ denotes the set of all bounded, continuous, real functions on $\mathbb{D}$. Equivalently, if $X_{n}$ and $X$ are $\mathbb{D}$-valued random variables with distributions $P_{n}$ and $P$ respectively, then $X_{n} \rightsquigarrow X$ if and only if

$$
\begin{equation*}
\operatorname{E} f\left(X_{n}\right) \rightarrow \operatorname{E} f(X), \quad \text { for all } f \in C_{b}(\mathbb{D}) . \tag{1.1.2}
\end{equation*}
$$

These definitions yield the classical theory of weak convergence as treated in Billingsley (1968) and which has proved very useful in probability theory and statistics. The basic elements of this theory include the portmanteau theorem, continuous mapping theorems, Prohorov's theorem, tools for establishing tightness and uniform tightness, and weak convergence results for product spaces.

The classical theory requires that $P_{n}$ is defined, for each $n$, on the Borel $\sigma$-field $\mathcal{D}$, or, equivalently, that $X_{n}$ is a Borel measurable map for each $n$. If ( $\Omega_{n}, \mathcal{A}_{n}, \mathrm{P}_{n}$ ) are the underlying probability spaces on which the maps $X_{n}$ are defined, this means that $X_{n}^{-1}(D) \in \mathcal{A}_{n}$ for every Borel set
$D$. This required measurability usually holds when $\mathbb{D}$ is a separable metric space such as $\mathbb{R}^{k}$ or $C[0,1]$ with the supremum metric and sometimes even when $\mathbb{D}$ is nonseparable (for example, in the case of partial-sum processes).

However, this apparently modest requirement can and does easily fail when the metric space $\mathbb{D}$ is not separable. For example, this occurs when $\mathbb{D}$ is the Skorohod space $D[0,1]$ of all right-continuous functions on $[0,1]$ with left limits is endowed with the metric induced by the supremum norm or for the space $\ell^{\infty}(\mathcal{F})$ of all bounded functions from a set $\mathcal{F}$ to $\mathbb{R}$ equipped with the supremum norm $\|z\|_{\mathcal{F}}=\sup _{f \in \mathcal{F}}|z(f)|$.

The classical example of this difficulty comes from empirical process theory. Suppose that for each $n$ the random variables $\xi_{1}, \ldots, \xi_{n}$ are the independent, uniformly distributed variables, defined as the coordinate projections on the product probability space $([0,1], \mathcal{B}, \lambda)^{n}$, where $\lambda$ denotes Lebesgue measure on $[0,1]$ and $\mathcal{B}$ the Borel $\sigma$-field. The empirical distribution function $\mathbb{F}_{n}$ is the random function

$$
\mathbb{F}_{n}(t)=\frac{1}{n} \sum_{i=1}^{n} 1_{[0, t]}\left(\xi_{i}\right), \quad 0 \leq t \leq 1 ;
$$

and the uniform empirical process $X_{n}$ is

$$
X_{n}(t)=\sqrt{n}\left(\mathbb{F}_{n}(t)-t\right), \quad 0 \leq t \leq 1 .
$$

Both $\mathbb{F}_{n}$ and $X_{n}$ can be viewed as maps from $[0,1]^{n}$ into $D[0,1]$, but neither $\mathbb{F}_{n}$ nor $X_{n}$ is a Borel measurable map if $D[0,1]$ is endowed with the supremum norm. It turns out that the Borel $\sigma$-field $\mathcal{D}$ is so large in this case that the inclusion $X_{n}^{-1}(\mathcal{D}) \subset \mathcal{B}^{n}$ fails to hold (cf. Problem 1.7.3). This failure was pointed out by Chibisov (1965) and is nicely explained by Billingsley (1968); see Billingsley's Chapter 18, pages $150-153$. Thus, the basic definitions (1.1.1) and (1.1.2) of weak convergence cannot be used for $X_{n}$ viewed as a random function with values in ( $D[0,1],\|\cdot\|_{\infty}$ ), even though this is a very natural and useful space in which to view the processes $X_{n}$, and even though the natural limiting process $X$, a Brownian bridge process on $[0,1]$, can be taken to be a Borel measurable map (which takes its values in the separable subspace $C[0,1]$ ).

Through the late 1960s, several different approaches were suggested to deal with this difficulty. Skorokhod (1956) and Billingsley (1968) endowed $D[0,1]$ with the Skorokhod metric (or a modification) under which $D[0,1]$ is separable (and complete) and the classical theory could be applied without difficulties. Dudley (1966, 1967a) developed an alternative weak convergence theory based on the smaller ball $\sigma$-field generated by the $\|\cdot\|_{\infty}$-open balls in $D[0,1]$. Pyke and Shorack (1968) proposed yet another definition of weak convergence requiring convergence of the integrals only for those functions $f \in C_{b}(\mathbb{D})$ for which $f\left(X_{n}\right)$ is a measurable map from ( $\Omega_{n}, \mathcal{A}_{n}$ ) into $\mathbb{R}$. While Dudley's proposition successfully handles the uniform empirical process and many simple extensions, it cannot handle the general empirical process and certain aspects of large sample theory in statistics.

The key idea put forward more recently by J. Hoffmann-Jørgensen is to drop the requirement of Borel measurability of each $X_{n}$, meanwhile upholding the requirement (1.1.2), where the expectations are now to be interpreted as outer expectations and the $X_{n}$ may be arbitrary (possibly nonmeasurable) maps. Provided the limiting variable $X$ is Borel measurable, a fruitful theory of weak convergence is still possible. This chapter is a systematic exposition of this theory, and it also investigates the relationships with other modes of stochastic convergence such as convergence in probability and almost sure convergence, which can also be extended to nonmeasurable maps.

The first job is to define outer integrals and the basic techniques related to these integrals. If $T$ is an arbitrary (not necessarily measurable) map from a probability space ( $\Omega, \mathcal{A}, P$ ) to the extended real line $\overline{\mathbb{R}}$, then the outer integral of $T$ with respect to $P$ is defined as

$$
\mathrm{E}^{*} T=\inf \{\mathrm{E} U: U \geq T, U: \Omega \mapsto \overline{\mathbb{R}} \text { measurable and } \mathrm{E} U \text { exists }\} .
$$

It is useful to know that the infimum is achieved in a strong sense: if $\mathrm{E}^{*} T< \infty$, then $\mathrm{E}^{*} T=\mathrm{E} T^{*}$, where $T^{*}$ is a "smallest measurable function above $T$. "

In terms of outer integrals, weak convergence of arbitrary, possibly nonmeasurable, maps $X_{n}$ from underlying probability spaces ( $\Omega_{n}, \mathcal{A}_{n}, P_{n}$ ) to a metric space $\mathbb{D}$ is defined as follows. The sequence $X_{n}$ converges weakly to a Borel measurable map $X$, and we write $X_{n} \rightsquigarrow X$, if

$$
\begin{equation*}
\mathrm{E}^{*} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X), \quad \text { for every } f \in C_{b}(\mathbb{D}) . \tag{1.1.3}
\end{equation*}
$$

This part develops the weak convergence theory connected with this definition, more or less in parallel to the classical theory, including a portmanteau theorem, continuous mapping theorems, Prohorov's theorem, tightness and basic tools for establishing tightness, and weak convergence on product spaces.

Because of several important applications of nets of processes in statistics, we have formulated the theory in terms of nets $\left\{X_{\alpha}\right\}_{\alpha \in A}$ with $A$ a directed set rather than just for sequences. Recall that a directed set $A$ is a set equipped with a partial order $\leq$ with the further property that every pair $\alpha_{1}, \alpha_{2}$ has a "successor" $\alpha_{3}$ (satisfying $\alpha_{3} \geq \alpha_{1}$ and $\alpha_{3} \geq \alpha_{2}$ ). For a sequence, the directed set is the set of natural numbers with the usual ordering, and all results for nets are valid for sequences in particular.

Once the basic elements of the theory are available, Part 1 develops further connections and relationships. Because spaces of uniformly bounded functions are important for empirical process theory, Chapter 1.5 develops conditions for weak convergence in these spaces. For example, Theorem 1.5.4 asserts that asymptotic tightness together with weak convergence of the finite-dimensional distributions suffices for weak convergence. This
resembles the classical theorem for convergence in $C[0,1]$, as in Billingsley (1968), but the present formulation is considerably more general and flexible.

The relationship between the present theory and measurability with respect to the ball $\sigma$-field is explored in Chapter 1.7. Chapter 1.8 develops the theory for the special case of a Hilbert space.

Just as it is useful to develop a theory of weak convergence for nonmeasurable maps, it is useful to extend the notions of "convergence in probability" and "convergence almost surely." The appropriate analogues are developed and investigated in Chapter 1.9, including the corresponding continuous mapping theorems. Chapter 1.10 gives relationships and connections between these stronger convergence concepts and weak convergence as defined in (1.1.3). In particular, this section contains an analogue of the Skorokhod-Dudley-Wichura almost sure representation theorem for nonmeasurable maps.

The main result of Chapter 1.11 is the "extended continuous mapping theorem," which applies to a sequence of functions $g_{n}$ rather than to a fixed continuous function $g$. Chapter 1.12 explores uniformity of the convergence (1.1.3) in $f$ for appropriate subsets $\mathcal{F}$ of $C_{b}(\mathbb{D})$ and uses this to metrize weak convergence under the additional condition that the limit $X$ is separable.

Much of the theory of stochastic convergence for nonmeasurable maps follows the same lines as the classical theory. Some of the key differences between the present theory and the classical theory that emerge in the course of Part 1 are as follows:
(i) The notion of (uniform) tightness of sequences needs modification.
(ii) The "direct half" of Prohorov's theorem (asymptotic tightness implies relative compactness) must be modified by the addition of the requirement of asymptotic measurability.
(iii) Almost sure convergence or even convergence everywhere is meaningless without some (asymptotic) measurability.
(iv) There is no general version of Fubini's theorem (but see Lemmas 1.2.6 and 1.2.7).
In spite of these differences and slight difficulties resulting from sacrificing measurability of the converging random quantities, the weak convergence theory outlined in Part 1 parallels the classical theory to a remarkable degree and will prove valuable in dealing with empirical processes, which are studied in Part 2, and asymptotic statistical theory, which is treated in Part 3.

## 1.2

## Outer Integrals and Measurable Majorants

Let $(\Omega, \mathcal{A}, P)$ be an arbitrary probability space and $T: \Omega \mapsto \overline{\mathbb{R}}$ an arbitrary map. The outer integral of $T$ with respect to $P$ is defined as

$$
\mathrm{E}^{*} T=\inf \{\mathrm{E} U: U \geq T, U: \Omega \mapsto \overline{\mathbb{R}} \text { measurable and } \mathrm{E} U \text { exists }\} .
$$

Here, as usual, $\mathrm{E} U$ is understood to exist if at least one of $\mathrm{E} U^{+}$or $\mathrm{E} U^{-}$is finite. The outer probability of an arbitrary subset $B$ of $\Omega$ is

$$
P^{*}(B)=\inf \{P(A): A \supset B, A \in \mathcal{A}\} .
$$

Note that the functions $U$ in the definition of outer integral are allowed to take the value $\infty$, so that the infimum is never empty.

Inner integral and inner probability can be defined in a similar fashion - their definition should be obvious. Equivalently, they can be defined by $\mathrm{E}_{*} T=-\mathrm{E}^{*}(-T)$ and $P_{*}(B)=1-P^{*}(\Omega-B)$, respectively.

A very useful fact is that the infima in the definitions of the outer integral and probability are always achieved. This even happens for an essentially minimal $U$ and $A$ as in the definitions (provided $\mathrm{E}^{*} T<\infty$ ), which will be denoted $T^{*}$ and $B^{*}$. For outer integrals, this is contained in the following lemma; for outer probabilities, a proof is deferred to Lemma 1.2.3.
1.2.1 Lemma (Measurable cover function). For any map $T: \Omega \mapsto \overline{\mathbb{R}}$, there exists a measurable function $T^{*}: \Omega \mapsto \overline{\mathbb{R}}$ with
(i) $T^{*} \geq T$;
(ii) $T^{*} \leq U$ a.s., for every measurable $U: \Omega \mapsto \overline{\mathbb{R}}$ with $U \geq T$ a.s.

For any $T^{*}$ satisfying these requirements, it holds that $\mathrm{E}^{*} T=\mathrm{E} T^{*}$, provided $\mathrm{E} T^{*}$ exists. The latter is certainly true if $\mathrm{E}^{*} T<\infty$.

Proof. Choose a measurable sequence $U_{m} \geq T$ with $\mathrm{E} \arctan U_{m} \downarrow \mathrm{E}^{*} \arctan T$, and set

$$
T^{*}(\omega)=\lim _{m \rightarrow \infty} \inf _{1 \leq k \leq m} U_{k}(\omega)
$$

This defines a measurable function $T^{*}$ taking values in the extended real line, with $T^{*} \geq T$, and by monotone convergence $\mathrm{E} \arctan T^{*}=\mathrm{E}^{*} \arctan T$. Every measurable $U \geq T$ satisfies $\arctan U \wedge T^{*} \geq \arctan T$, so that $\mathrm{E} \arctan U \wedge T^{*} \geq \mathrm{E}^{*} \arctan T=\mathrm{E} \arctan T^{*}$. But the integrand on the left side is trivially pointwise smaller than the integrand on the right side. Since they have the same expectation, they must be equal: $\arctan U \wedge T^{*}= \arctan T^{*}$ a.s. This implies $T^{*} \leq U$ a.s.

If $\mathrm{E} T^{*}$ exists, then it is larger than $\mathrm{E}^{*} T$ by (i) and smaller by (ii). Hence $\mathrm{E} T^{*}=\mathrm{E}^{*} T$. If $\mathrm{E}^{*} T<\infty$, then there exists a measurable $U \geq T$ with $\mathrm{E} U^{+}<\infty$. Then $\mathrm{E}\left(T^{*}\right)^{+} \leq \mathrm{E} U^{+}$and $\mathrm{E} T^{*}$ exists.

The function $T^{*}$ is called a minimal measurable majorant of $T$, or also a measurable cover or envelope function. It is unique only up to $P$ null sets but, somewhat abusing notation, we write $T^{*}$ for any member of its equivalence class of a.s. equal functions. Its expectation does not always exist, so some care is needed when applying the identity $\mathrm{E}^{*} T=$ ET* (Problem 1.2.2). A maximal measurable minorant is defined by $T_{*}= -(-T)^{*}$ and satisfies the obvious relations. Some of the properties of these functions are collected in the following lemma. It is tedious, but useful. The same is true for the other results in this section; perhaps it is better to skip them at first reading.
1.2.2 Lemma. The following statements are true a.s. for arbitrary maps $S, T: \Omega \mapsto \overline{\mathbb{R}}$, provided the statement is well-defined:
(i) $(S+T)^{*} \leq S^{*}+T^{*}$, with equality if $S$ is measurable;
(ii) $(S-T)^{*} \geq S^{*}-T^{*}$;
(iii) $\left|S^{*}-T^{*}\right| \leq|S-T|^{*}$;
(iv) If $S$ is measurable, then $(S T)^{*}=S 1_{S>0} T^{*}+S 1_{S<0} T_{*}$;
(v) $(S T)^{*} \leq S^{*} T^{*} 1_{S^{*}>0, T^{*}>0}+S^{*} T_{*} 1_{S^{*}<0, T_{*}>0}+S_{*} T^{*} 1_{S_{*}>0, T^{*}<0}+ S_{*} T_{*} 1_{S_{*}<0, T_{*}<0}$;
(vi) $\left(1_{T>c}\right)^{*}=1_{T^{*}>c}$ for any $c \in \mathbb{R}$;
(vii) $|T|^{*}=T^{*} \vee(-T)^{*}=T^{*} \vee\left(-T_{*}\right)=\left|T^{*}\right| \vee\left|T_{*}\right|$;
(viii) $(S \vee T)^{*}=S^{*} \vee T^{*}$;
(ix) $(S \wedge T)^{*} \leq S^{*} \wedge T^{*}$ with equality if $S$ is measurable.

Moreover, $P^{*}(T>c)=P\left(T^{*}>c\right)$ for any $c \in \mathbb{R}$.
Proof. Every inequality in this proof means inequality a.s. The inequality in (i) is trivial. If $S$ is measurable and $U \geq S+T$ and is measurable,
then $U-S \geq T$ and is measurable, so $U-S \geq T^{*}$, which shows that $(S+T)^{*}=S+T^{*}$. Statement (ii) is a rearrangement and relabeling of (i). Next, (iii) follows from $S^{*}-T^{*} \leq(S-T)^{*} \leq|S-T|^{*}$.

In (iv) it is trivial that the left side is smaller than the right side. Suppose $U \geq S T$ and is measurable. Then the following string of implications holds:

$$
\begin{aligned}
U 1_{S>0} & \geq S T 1_{S>0} \\
U / S 1_{S>0} & \geq T 1_{S>0} \\
U / S 1_{S>0}+T^{*} 1_{S \leq 0} & \geq T, \\
U / S 1_{S>0}+T^{*} 1_{S \leq 0} & \geq T^{*} \\
U / S 1_{S>0} & \geq T^{*} 1_{S>0} \\
U 1_{S>0} & \geq S T^{*} 1_{S>0}
\end{aligned}
$$

Furthermore, since the starting inequality can also be written $U \geq (-S)(-T)$, we also have

$$
U 1_{-S>0} \geq(-S)(-T)^{*} 1_{-S>0} .
$$

Adding the last two displayed inequalities to the trivial one $U 1_{S=0} \geq 0$ yields $U \geq S 1_{S>0} T^{*}+S 1_{S<0} T_{*}$. This concludes the proof of (iv).

To obtain (v), first write $S T \leq S^{*} T 1_{T>0}+S_{*} T 1_{T<0}$. Next use (iv) repeatedly, together with a number of simple inequalities, such as $\left(T 1_{T>0}\right)^{*} \leq T^{*} 1_{T^{*}>0}$.

In (vi) it is trivial that $\left(1_{T>c}\right)^{*} \leq 1_{T^{*}>c}$. Suppose $U \geq 1_{T>c}$ and is measurable. Then $S=T^{*} 1_{U \geq 1}+\left(T^{*} \wedge c\right) 1_{U<1} \geq T$ and is measurable. Thus $S \geq T^{*}$, whence $T^{*} \leq c$ if $U<1$. So $1_{T^{*}>c} \leq U$.

It is immediate in (vii) that the functions are nondecreasing from left to right. Furthermore, $\left|T^{*}\right| \leq|T|^{*}$ follows from (iii) applied with $S=0$, while $\left|T_{*}\right|=\left|(-T)^{*}\right| \leq|-T|^{*}$ by a second application of (iii).

In (viii) it is clear that $S^{*} \vee T^{*}$ is a measurable majorant of $S \vee T$. This gives one-half of the equality. The other half follows from this: if $U \geq S$ and $U \geq T$ and is measurable, then $U$ is greater than or equal to the measurable majorants of $S$ and $T$, and hence $U \geq S^{*} \vee T^{*}$.

The first part of (ix) is trivial. To obtain the second part, first note that $(S \wedge T)^{*} \leq S \wedge T^{*}$. Next, if $U \geq S \wedge T$ and is measurable, then $U 1_{U<S} \geq T 1_{U<S}$. Hence $U 1_{U<S} \geq\left(T 1_{U<S}\right)^{*}=T^{*} 1_{U<S}$, so that $U \geq T^{*} \wedge S$.

To obtain the last assertion of the theorem, write $P\left(T^{*}>c\right) \geq P^{*}(T> c) \geq \mathrm{E}^{*} 1_{T>c}=\mathrm{E} 1_{T^{*}>c}=P\left(T^{*}>c\right)$, where the inequalities are immediate consequences of the definitions and the equality follows from (vi).

The following lemma shows that outer probabilities are special cases of outer integrals. Furthermore, just as for outer integrals, the supremum in their definition is achieved, by measurable sets that we denote by $B^{*}$.
1.2.3 Lemma. For any subset $B$ of $\Omega$,
(i) $P^{*}(B)=\mathrm{E}^{*} 1_{B} ; P_{*}(B)=\mathrm{E}\left(1_{B}\right)_{*}$;
(ii) there exists a measurable set $B^{*} \supset B$ with $P\left(B^{*}\right)=P^{*}(B)$; for any such $B^{*}$, it holds that $1_{B^{*}}=\left(1_{B}\right)^{*}$;
(iii) $\left(1_{B}\right)^{*}+\left(1_{\Omega-B}\right)_{*}=1$.

Proof. From the definitions it is immediate that $P^{*}(B) \geq \mathrm{E}^{*} 1_{B}$. Next with $A=\left\{1_{B}^{*} \geq 1\right\}$, one has $\mathrm{E}^{*} 1_{B}=\mathrm{E} 1_{B}^{*} \geq P(A) \geq P^{*}(B)$, where the inequalities are direct consequences of the definitions. Combination yields that all the inequalities are in fact equalities. This shows the first part of (i) and (ii). The second part of (i) follows from $P_{*}(B)=1-P^{*}(\Omega-B)= 1-\mathrm{E}\left(1-1_{B}\right)^{*}=1-\mathrm{E}\left(1-\left(1_{B}\right)_{*}\right)$. The second part of (ii) follows from the trivial inequality $1_{B^{*}} \geq\left(1_{B}\right)^{*}$ if $B^{*} \supset B$ and $\mathrm{E} 1_{B^{*}}=P\left(B^{*}\right)=\mathrm{E}\left(1_{B}\right)^{*}$. To obtain (iii), write $\left(1_{\Omega-B}\right)_{*}=\left(1-1_{B}\right)_{*}=1-\left(1_{B}\right)^{*}$. .

Though we didn't let this show up in the notation, the minimal cover function $T^{*}$ depends on the underlying probability measure $P$. Suppose we have a set $\mathcal{P}$ of probability measures. Is it possible to find one function that is a minimal measurable cover function for every $P \in \mathcal{P}$ at the same time? If $\mathcal{P}$ is dominated (by a $\sigma$-finite measure), the answer is affirmative.
1.2.4 Lemma. Let $\mathcal{P}$ be a dominated set of probability measures on $(\Omega, \mathcal{A})$. Then there exists a measurable function $T^{*}: \Omega \mapsto \overline{\mathbb{R}}$ with
(i) $T^{*} \geq T$;
(ii) $T^{*} \leq U P$-a.s., for every measurable $U: \Omega \mapsto \overline{\mathbb{R}}$ with $U \geq T P$-a.s., for every $P \in \mathcal{P}$.

Proof. Let $P_{0}$ be a probability measure that dominates $\mathcal{P}$. Take $T^{*}$ equal to the minimal measurable cover function that satisfies (i) and (ii) for $\mathcal{P}= \left\{P_{0}\right\}$. Given an arbitrary $P \ll P_{0}$, there is a decomposition $\Omega=\Omega^{a}+\Omega^{\perp}$ of $\Omega$ into disjoint, measurable sets with $P\left(\Omega^{\perp}\right)=0$ and $P_{0}$ absolutely continuous with respect to $P$ on $\Omega^{a}$. (Take densities $p$ and $p_{0}$, and set $\Omega^{a}=\left\{p>0, p_{0}>0\right\}$ and $\Omega^{\perp}=\left\{p=0\right.$, or $\left.p_{0}=0\right\}$.) If $U \geq T, P$-a.s., and is measurable, then $U 1_{\Omega^{a}} \geq T 1_{\Omega^{a}}, P_{0}$-a.s., and is measurable. Hence $U 1_{\Omega^{a}} \geq\left(T 1_{\Omega^{a}}\right)^{* P_{0}}=T^{*} 1_{\Omega^{a}}, P_{0}$-a.s. Since $\mathcal{P}$ is dominated by $P_{0}$, this then also holds $P$-a.s., but then also $U \geq T^{*}, P$-a.s., because $P\left(\Omega^{\perp}\right)=0$.

Consider what happens to a minimal measurable cover if a map $T: \Omega \mapsto \mathbb{R}$ is composed with a measurable map $\phi: \tilde{\Omega} \mapsto \Omega$ defined on some probability space to form

$$
T \circ \phi:(\tilde{\Omega}, \tilde{\mathcal{A}}, \tilde{P}) \stackrel{\phi}{\mapsto}\left(\Omega, \mathcal{A}, \tilde{P} \circ \phi^{-1}\right) \stackrel{T}{\mapsto} \mathbb{R} .
$$

Let $T^{*}$ be the minimal measurable cover of $T$ for $\tilde{P} \circ \phi^{-1}$. Since $T^{*} \circ \phi \geq T \circ \phi$
and is measurable, trivially $(T \circ \phi)^{*} \leq T^{*} \circ \phi$. The map $\phi$ is called perfect ${ }^{\dagger}$ if $(T \circ \phi)^{*}=T^{*} \circ \phi$, for every bounded $T: \Omega \mapsto \mathbb{R}$. It is exactly the property that ensures that

$$
\mathrm{E}^{*} T \circ \phi=\int^{*} T d \tilde{P} \circ \phi^{-1}, \quad \text { for every bounded } T: \Omega \mapsto \mathbb{R}
$$

In particular, $\mathrm{P}^{*}(\phi \in A)=\left(\tilde{P} \circ \phi^{-1}\right)^{*}(A)$ for every set $A \subset \Omega$.
Perfect maps do exist. An example that will be encountered frequently results from the following. Suppose a map $T$ is defined on a product probability space ( $\Omega_{1} \times \Omega_{2}, \mathcal{A}_{1} \times \mathcal{A}_{2}, P_{1} \times P_{2}$ ), but really depends only on the first coordinate of $\omega=\left(\omega_{1}, \omega_{2}\right)$. Then $T^{*}$ (for $P_{1} \times P_{2}$ ) can be computed (for $P_{1}$ ) after just ignoring $\Omega_{2}$ and thinking of $T$ as a map on $\Omega_{1}$. More formally, suppose $T=T_{1} \circ \pi_{1}$, where $\pi_{1}$ is the projection on the first coordinate. Then the next lemma shows that $T^{*}=T_{1}^{*} \circ \pi_{1}$.
1.2.5 Lemma. A coordinate projection on a product probability space (with product measure) is perfect.

Proof. Let $\pi_{1}:\left(\Omega_{1} \times \Omega_{2}, \mathcal{A}_{1} \times \mathcal{A}_{2}, P_{1} \times P_{2}\right) \mapsto \Omega_{1}$ be the projection on the first coordinate and $T: \Omega_{1} \mapsto \mathbb{R}$ be bounded, but arbitrary otherwise. Let $T^{*}$ be the least measurable cover of $T$ for $\left(P_{1} \times P_{2}\right) \circ \pi_{1}^{-1}=P_{1}$. Trivially $\left(T \circ \pi_{1}\right)^{*} \leq T^{*} \circ \pi_{1}$. Suppose $U \geq T \circ \pi_{1}, P_{1} \times P_{2}$-a.s. and is measurable (where $U: \Omega_{1} \times \Omega_{2} \mapsto \mathbb{R}$ ). Then, by Fubini's theorem, for $P_{2}$-almost all $\omega_{2}$ : $U\left(\omega_{1}, \omega_{2}\right) \geq T\left(\omega_{1}\right)$ for $P_{1}$-almost all $\omega_{1}$. Since for $\omega_{2}$ fixed, $U$ is a measurable function of $\omega_{1}$, for $P_{2}$-almost all $\omega_{2}: U\left(\omega_{1}, \omega_{2}\right) \geq T^{*}\left(\omega_{1}\right)$ for $P_{1}$-almost all $\omega_{1}$. By Fubini's theorem, the jointly measurable set $\left\{\left(\omega_{1}, \omega_{2}\right): U<T^{*} \circ \pi_{1}\right\}$ is $P_{1} \times P_{2}$-null.

Now we must consider Fubini's theorem. Unfortunately, measurability plays an important role in this result, and there is no general Fubini's theorem for outer expectations. This is the main reason why certain arguments work only under measurability assumptions.

Fubini's theorem is valid as a string of inequalities: repeated outer expectations are always less than joint outer integrals. This can only be formulated in a somewhat awkward notation. Let $T$ be a real-valued map defined on a product space ( $\Omega_{1} \times \Omega_{2}, \mathcal{A}_{1} \times \mathcal{A}_{2}, P_{1} \times P_{2}$ ). Then write $\mathrm{E}^{*} T$ for the outer expectation as before, and write $\mathrm{E}_{1}^{*} \mathrm{E}_{2}^{*} T$ for the outer expectations

[^0]taken in turn: define for every $\omega_{1}$ :
$$
\left(\mathrm{E}_{2}^{*} T\right)\left(\omega_{1}\right)=\inf \int U\left(\omega_{2}\right) d P_{2}\left(\omega_{2}\right)
$$
where the infimum is taken over all measurable functions $U: \Omega_{2} \mapsto \overline{\mathbb{R}}$ with $U\left(\omega_{2}\right) \geq T\left(\omega_{1}, \omega_{2}\right)$ for every $\omega_{2}$ and such that $\int U d P_{2}$ exists. Next $\mathrm{E}_{1}^{*} \mathrm{E}_{2}^{*} T$ is the outer integral of the function $\mathrm{E}_{2}^{*} T: \Omega_{1} \mapsto \overline{\mathbb{R}}$. Repeated inner expectations are defined analogously.
1.2.6 Lemma (Fubini's theorem). Let $T$ be defined on a product probability space. Then $\mathrm{E}_{*} T \leq \mathrm{E}_{1 *} \mathrm{E}_{2 *} T \leq \mathrm{E}_{1}^{*} \mathrm{E}_{2}^{*} T \leq \mathrm{E}^{*} T$.

Proof. For the inequality on the far right, it may be assumed that $\mathrm{E}^{*} T<\infty$, so that $\mathrm{E}^{*} T=\mathrm{E} T^{*}$ and $\left(T^{*}\right)^{+}$is integrable. Since $T^{*}$ is jointly measurable for the product $\sigma$-field, the map $\omega_{2} \mapsto T^{*}\left(\omega_{1}, \omega_{2}\right)$ is a measurable majorant of $\omega_{2} \mapsto T\left(\omega_{1}, \omega_{2}\right)$ for $P_{1}$-almost all $\omega_{1}$. Hence $\int T^{*}\left(\omega_{1}, \omega_{2}\right) d P_{2}\left(\omega_{2}\right) \geq\left(\mathrm{E}_{2}^{*} T\right)\left(\omega_{1}\right)$ for almost every $\omega_{1}$. Here the left side is defined as the difference

$$
\int\left(T^{*}\right)^{+}\left(\omega_{1}, \omega_{2}\right) d P_{2}\left(\omega_{2}\right)-\int\left(T^{*}\right)^{-}\left(\omega_{1}, \omega_{2}\right) d P_{2}\left(\omega_{2}\right)
$$

in which the first term is finite for almost every $\omega_{1}$ and the second is possibly infinite. By Fubini's theorem, both terms are measurable functions of $\omega_{1}$. It follows that the difference is a measurable majorant of the map $\omega_{1} \mapsto \left(\mathrm{E}_{2}^{*} T\right)\left(\omega_{1}\right)$, and its integral with respect to $P_{1}$ is an upper bound for $\mathrm{E}_{1}^{*} \mathrm{E}_{2}^{*} T$, provided it exists. Since the first term of the difference is integrable, the integral of the difference exists and is the difference of the integrals. Next by Fubini's theorem, the double integrals in both terms can be replaced by a joint integral, which yields $\mathrm{E}\left(T^{*}\right)^{+}-\mathrm{E}\left(T^{*}\right)^{-} \geq \mathrm{E}_{1}^{*} \mathrm{E}_{2}^{*} T$.

Finish the proof by considering $-T$.
If a function $T$ on Euclidean space is continuous, then it is measurable and Fubini's theorem holds. In the case that $T$ is continuous in only one argument but not necessarily measurable, it may still be possible to write the joint outer expectation as a repeated outer expectation (in one of the two possible orders). Consider a map $T$ on a product probability space as before. Write $T^{2 *}$ for any map such that for every $\omega_{1}$ the map $\omega_{2} \mapsto T^{2 *}\left(\omega_{1}, \omega_{2}\right)$ is a measurable cover function for $\omega_{2} \mapsto T\left(\omega_{1}, \omega_{2}\right)$ (for $P_{2}$ ).
1.2.7 Lemma (Fubini's theorem). Let ( $\Omega_{1}, \mathcal{A}_{1}$ ) be a separable metric space equipped with its Borel $\sigma$-field. Suppose the map $T: \Omega_{1} \times \Omega_{2} \mapsto \mathbb{R}$ is defined on a product probability space and satisfies $\left|T\left(\omega_{1}, \omega_{2}\right)-T\left(\omega_{1}^{\prime}, \omega_{2}\right)\right| \leq d\left(\omega_{1}, \omega_{1}^{\prime}\right) H\left(\omega_{2}\right)$, for a function $H$ with $P_{2}^{*} H<\infty$ and for every sufficiently small $d\left(\omega_{1}, \omega_{1}^{\prime}\right)$. Then $\mathrm{E}^{*} T=\mathrm{E}_{1} \mathrm{E}_{2}^{*} T$ whenever the left side is finite.

Proof. For every $n$, partition $\Omega_{1}=\cup_{j=1}^{\infty} A_{n, j}$ into measurable sets of diameter at most $1 / n$. Choose an arbitrary point $a_{n, j}$ from each set $A_{n, j}$ and define the discretization

$$
T_{n}\left(\omega_{1}, \omega_{2}\right)=\sum_{j} 1_{A_{n, j}}\left(\omega_{1}\right) T\left(a_{n, j}, \omega_{2}\right) .
$$

Then

$$
T_{n}^{*}\left(\omega_{1}, \omega_{2}\right)=\sum_{j} 1_{A_{n, j}}\left(\omega_{1}\right) T^{2 *}\left(a_{n, j}, \omega_{2}\right)
$$

Indeed, it is certainly true that $T_{n}^{*}$ is jointly measurable and dominates $T_{n}$. If $U \geq T_{n}$ and is jointly measurable, then $U\left(\omega_{1}, \omega_{2}\right) \geq T\left(a_{n, j}, \omega_{2}\right)$ for every $\omega_{1} \in A_{n, j}$ and every $\omega_{2}$, whence $U\left(\omega_{1}, \cdot\right) \geq T_{n}^{2 *}\left(a_{n, j}, \cdot\right)$ almost surely for every $\omega_{1} \in A_{n, j}$. In view of Fubini's theorem this shows that the jointly measurable set $\left\{\left(\omega_{1}, \omega_{2}\right): U\left(\omega_{1}, \omega_{2}\right)<T_{n}^{*}\left(\omega_{1}, \omega_{2}\right)\right\}$ is $P_{1} \times P_{2}$-null.

Next $\left|T_{n}^{*}-T^{*}\right| \leq\left|T_{n}-T\right|^{*} \leq 1 / n H^{*}$. Take the expectation on the left and right, and let $n \rightarrow \infty$, to conclude that

$$
\mathrm{E}^{*} T=\lim \mathrm{E}^{*} T_{n}=\lim \sum_{j} P_{1}\left(A_{n, j}\right) \mathrm{E}_{2} T^{2 *}\left(a_{n, j}, \cdot\right)
$$

Since the map $\omega_{1} \mapsto \mathrm{E}_{2} T^{2 *}\left(\omega_{1}, \cdot\right)=\left(\mathrm{E}_{2}^{*} T\right)\left(\omega_{1}\right)$ is continuous, it follows that the right side of the preceding display is equal to $\mathrm{E}_{1} \mathrm{E}_{2}^{*} T$.

The preceding lemma applies in particular to countable $\Omega_{1}$ with discrete topology, in which case the continuity condition is automatic. In this case we also have that any versions $T^{2 *}\left(\omega_{1}, \cdot\right)$ (determined independently for different values of $\omega_{1}$ ) automatically yield a measurable cover $T^{*}\left(\omega_{1}, \omega_{2}\right)=T^{2 *}\left(\omega_{1}, \omega_{2}\right)$ for $T$. This follows since $T \leq T^{2^{*}} \leq T^{*}$ always and for countable, discrete $\Omega_{1}$, any version $T^{2 *}$ is automatically jointly measurable.

We note that under the conditions of the preceding theorem, it need not be true that $\mathrm{E}^{*} T=\mathrm{E}_{2}^{*} \mathrm{E}_{1} T$.

## Problems and Complements

1. (Essential infima) Let ( $\Omega, \mathcal{A}, P$ ) be a probability space and $\mathcal{U}$ an arbitrary set of measurable functions $U: \Omega \mapsto \overline{\mathbb{R}}$. Show that there exists a measurable function $U_{*}: \Omega \mapsto \overline{\mathbb{R}}$ with
(i) $U_{*} \leq U$ for every $U \in \mathcal{U}$;
(ii) $U_{*} \geq V$ a.s., for every measurable $V$ with $V \leq U$ a.s. for every $U \in \mathcal{U}$.

Such a function $U_{*}$ is called the essential infimum of $\mathcal{U}$. Show that for a map $T: \Omega \mapsto \overline{\mathbb{R}}$, the minimal measurable cover $T^{*}$ is the essential infimum of the set of all measurable $U \geq T$.
2. ( $\mathrm{E}^{*} T$ is not always $\left.\mathrm{E} T^{*}\right)$ Let $(\Omega, \mathcal{A}, P)$ be $\mathbb{R}$ with the $\sigma$-field generated by $[0, \infty)$ and the Borel sets in $(-\infty, 0)$ and $P$ equal to the Cauchy measure. The map $T: \Omega \mapsto \mathbb{R}$ defined by $T(\omega)=\omega$ has $\mathrm{E}^{*} T=\infty$, but $\mathrm{E} T^{*}$ does not exist.
3. (Monotone convergence) Let $T_{n}, T: \Omega \mapsto \mathbb{R}$ be maps on a probability space with $T_{n} \uparrow T$ pointwise on a set of probability one. Then $T_{n}^{*} \uparrow T^{*}$ almost surely. If the maps are bounded from below, then $\mathrm{E}^{*} T_{n} \uparrow \mathrm{E}^{*} T$. For a decreasing sequence $T_{n}$, similar results are true for the lower starred versions, but not for the upper starred objects.
[Hint: Since $T_{n}^{*} \leq T^{*}$ for every $n$, certainly $\liminf T_{n}^{*} \leq \limsup T_{n}^{*} \leq T^{*}$. Conversely, $\liminf T_{n}^{*} \geq \liminf T_{n}=T$ and is a measurable function. If $\mathrm{E}^{*} T_{n}<\infty$ for every $n$, then $\mathrm{E}^{*} T_{n}=\mathrm{E} T_{n}^{*} \uparrow \mathrm{E} T^{*}$ by the monotone convergence theorem for measurable maps; consequently, $\mathrm{E} T^{*}$ exists and equals $\mathrm{E}^{*} T$. If $\mathrm{E}^{*} T_{n}=\infty$ for some $n$, then it is infinite for every larger $n$ and also $\mathrm{E}^{*} T=\infty$ from its definition.]
4. (Dominated convergence) The "naive" dominated convergence theorem fails for outer integrals; in fact, on $\Omega=[0,1]$ with the uniform measure on the Borel sets, there exist maps $T_{n}$ with $T_{n} \downarrow 0$ everywhere and $\left|T_{n}\right| \leq 1$ for every $n$, such that $\mathrm{E}^{*} T_{n}=1$ for every $n$. However, if almost sure convergence is strengthened to $\left|T_{n}-T\right|^{*} \xrightarrow{\text { as }} 0$ and $\left|T_{n}\right| \leq S$ for every $n$ and $S$ with $\mathrm{E}^{*} S<\infty$, then $\mathrm{E}^{*} T_{n} \rightarrow \mathrm{E}^{*} T$.
[Hint: If $T_{n} \rightarrow T$ almost surely and $\left|T_{n}\right| \leq S$ for every $n$, then $\left|T_{n}-T\right|^{*} \leq 2 S^{*}$. If $\left|T_{n}-T\right|^{*} \xrightarrow{\text { as }} 0$ and $\mathrm{E} S^{*}<\infty$, then $\mathrm{E}\left|T_{n}-T\right|^{*} \rightarrow 0$, which implies the result.]
5. Let $S, T: \Omega \mapsto \overline{\mathbb{R}}$ be arbitrary. Then $\left|S^{*}-T_{*}\right| \leq|S-T|^{*}+\left(S^{*}-S_{*}\right) \wedge\left(T^{*}-T_{*}\right)$. Also, $|S-T|^{*} \leq\left(S^{*}-T_{*}\right) \vee\left(T^{*}-S_{*}\right) \leq|S-T|^{*}+\left(S^{*}-S_{*}\right) \wedge\left(T^{*}-T_{*}\right)$.
6. It can happen that $(S \wedge T)^{*}<S^{*} \wedge T^{*}$ with probability 1.
[Hint: There exist subsets of $[0,1]$ with $\lambda_{*}(B)=0$ and $\lambda^{*}(B)=1$.]
7. For arbitrary $T: \Omega \mapsto \mathbb{R}$, one has $\mathrm{P}\left(T^{*} \leq c\right)=\mathrm{P}_{*}(T \leq c)$ for every $c$. It can happen that $1=\mathrm{P}^{*}(T \leq c)>\mathrm{P}\left(T^{*} \leq c\right)=0$.
8. Let $T: \Omega \mapsto \mathbb{R}$ be an arbitrary map defined on a probability space. If $g: \mathbb{R} \mapsto \mathbb{R}$ is nondecreasing and left-continuous on an interval $(a, b]$ that contains the range of both $T$ and $T^{*}$, then $g(T)^{*}=g\left(T^{*}\right)$. If $g$ is nonincreasing and rightcontinuous, then $g(T)_{*}=g\left(T_{*}\right)$. The continuity conditions can be replaced by the condition that $g$ is one-to-one, is measurable, and has a measurable inverse.
[Hint: That the left side is smaller than the right side is immediate from $g\left(T^{*}\right) \geq g(T)$. Suppose $g\left(T^{*}\right) \geq U \geq g(T)$ almost surely for a measurable $U$. The "inverse" $g^{-1}(u)=\sup \{x: g(x) \leq u\}$ satisfies $g(x) \leq u$ if and only if $x \leq g^{-1}(u)$. Consequently, $g^{-1}(U) \geq T$ almost surely. Since it is also measurable, $g^{-1}(U) \geq T^{*}$. This implies $U \geq g\left(T^{*}\right)$ almost surely. The second statement follows from the first applied to the function $x \mapsto-g(-x)$.]
9. Let $T_{i}: \Omega_{i} \mapsto \mathbb{R}$ be maps defined on probability spaces ( $\Omega_{i}, \mathcal{A}_{i}, P_{i}$ ) and define $\left(T_{1}, T_{2}\right)$ on $\Omega_{1} \times \Omega_{2}$ by $\left(\omega_{1}, \omega_{2}\right) \mapsto\left(T_{1}\left(\omega_{1}\right), T_{2}\left(\omega_{2}\right)\right)$. Let $g: \mathbb{R}^{2} \mapsto \mathbb{R}$ be coordinatewise nondecreasing and left-continuous on an interval $(a, \infty]$ that contains the range of $\left(T_{1}, T_{2}\right)$. Then $g\left(T_{1}, T_{2}\right)^{*}=g\left(T_{1}^{*}, T_{2}^{*}\right)$, where the first measurable cover is computed for $P_{1} \times P_{2}$ on the product $\sigma$-field $\mathcal{A}_{1} \times \mathcal{A}_{2}$ and the $T_{i}^{*}$ on the right each for the corresponding $P_{i}$. In particular, for "independent" $T_{1}$ and $T_{2}$ as above:
(i) $\left(T_{1}+T_{2}\right)^{*}=T_{1}^{*}+T_{2}^{*}$;
(ii) $\left(T_{1} T_{2}\right)^{*}=T_{1}^{*} T_{2}^{*}$ if $T_{1} \geq 0$ and $T_{2} \geq 0$ everywhere.
[Hint: It is clear that the left side is smaller than the right side. If $U \geq g\left(T_{1}, T_{2}\right)$ almost surely and is measurable, then, by Fubini's theorem, for $P_{1}$ almost all $\omega_{1}$, one has $U\left(\omega_{1}, \omega_{2}\right) \geq g\left(T_{1}\left(\omega_{1}\right), T_{2}\left(\omega_{2}\right)\right)$ for $P_{2}$-almost all $\omega_{2}$. For every $\omega_{1}$ for which this holds, it follows that $U\left(\omega_{1}, \omega_{2}\right) \geq g\left(T_{1}\left(\omega_{1}\right), T_{2}^{*}\left(\omega_{2}\right)\right)$ for $P_{2}$-almost all $\omega_{2}$ by the previous exercise. Now reverse the roles of $\omega_{1}$ and $\omega_{2}$.]
10. ( $P$-completion) The $P$-completion of a probability space ( $\Omega, \mathcal{A}, P$ ) is the triple $(\Omega, \tilde{\mathcal{A}}, \tilde{P})$, where $\tilde{\mathcal{A}}$ consists of all sets $A \cup N($ and also $A-N)$ with $A \in \mathcal{A}$ and $N$ a subset of $\Omega$ with $P^{*}(N)=0$, and $\tilde{P}(A \cup N)=P(A)$. An equivalent description is that $\tilde{\mathcal{A}}$ is the collection of all sets with equal inner and outer probabilities under $P$, and $\tilde{P}$ maps each of these sets in this common value of $P^{*}$ and $P_{*}$. A completion is a probability space, and for every measurable map $\tilde{U}:(\Omega, \tilde{\mathcal{A}}) \mapsto \mathbb{R}$, there is a measurable map $U:(\Omega, \mathcal{A}) \mapsto \mathbb{R}$ with $P^{*}(U \neq \tilde{U})=0$.
[Hint: For the construction of $U$, first assume that $\tilde{U}=\sum a_{i} 1_{\tilde{A}_{i}}$ with $\tilde{A}_{i} \in \tilde{\mathcal{A}}$. Take sets $A_{i} \in \mathcal{A}$ with $\tilde{A}_{i}=A_{i} \cup N_{i}$ and $P^{*}\left(N_{i}\right)=0$. Then $U=\sum a_{i} 1_{A_{i}}$ satisfies the requirements. Then a nonnegative $\tilde{U}$ can be approximated pointwise from below by a sequence $\tilde{U}_{n}$ of the form just considered. Construct $U_{n}$ for every $n$, and set $U=\liminf U_{n}$. A general $\tilde{U}$ can be split into its positive and negative parts.]
11. A minimal measurable cover $T^{*}$ of a map $T:(\Omega, \mathcal{A}, P) \mapsto \overline{\mathbb{R}}$ is also (a version of) a minimal measurable cover for $T$ as a map on the $P$-completion of $(\Omega, \mathcal{A}, P)$.
[Hint: If $\tilde{T}^{* c}$ is a minimal measurable cover for the completion, then there is measurable function $T^{* c}:(\Omega, \mathcal{A}) \mapsto \mathbb{R}$ with $T^{* c}=\tilde{T}^{* c}$, almost surely. Check that $T^{* c}$ is a version of $T^{*}$. So $T^{*}=T^{* c}=\tilde{T}^{* c}$, almost surely.]
12. Let ( $\Omega_{i}, \tilde{\mathcal{A}}_{i}, \tilde{P}_{i}$ ) be the completions of probability spaces ( $\Omega_{i}, \mathcal{A}_{i}, P_{i}$ ), and let the probability space $\left(\Omega_{1} \times \Omega_{2}, \mathcal{A}_{1} \times \mathcal{A}_{2}, P_{1} \times P_{2}\right)$ be the completion of their product. Then $\tilde{\mathcal{A}}_{1} \times \Omega_{2} \subset \mathcal{A}_{1} \times \mathcal{A}_{2}$ and $P_{1} \widetilde{\times P_{2}}\left(A_{1} \times \Omega_{2}\right)=\tilde{P}_{1}\left(A_{1}\right)$. Moreover, a map $T: \Omega_{1} \times \Omega_{2} \mapsto \mathbb{R}$ of the form $T\left(\omega_{1},{\underset{\sim}{\omega}}_{2}\right)=T_{1}\left(\omega_{1}\right)$ is measurable for $\mathcal{A}_{1} \times \mathcal{A}_{2}$ if and only if $T_{1}$ is measurable for $\tilde{\mathcal{A}}_{1}$. Finally, $T^{*}=T_{1}^{*}$, where the first is computed for $P_{1} \times P_{2}$ on $\mathcal{A}_{1} \times \mathcal{A}_{2}$ and the second for $P_{1}$ on $\mathcal{A}_{1}$.
13. (Outer measure) A real function $\mu^{*}$ defined on the collection of all subsets of a set $\Omega$ is called an outer measure if $\mu^{*}(\emptyset)=0, \mu^{*}\left(B_{1}\right) \leq \mu^{*}\left(B_{2}\right)$ if $B_{1} \subset B_{2}$ and $\mu^{*}\left(\cup_{n=1}^{\infty} B_{n}\right) \leq \sum_{n=1}^{\infty} \mu^{*}\left(B_{n}\right)$. A subset $B$ of $\Omega$ is said to be $\mu^{*}$ measurable if for every subset $C$ one has $\mu^{*}(C)=\mu^{*}(C \cap B)+\mu^{*}(C \cap \Omega-B)$.
(According to a fundamental result of measure theory, the $\mu^{*}$-measurable sets form a $\sigma$-field and the restriction of $\mu^{*}$ to this $\sigma$-field is a complete measure.) The outer probability $P^{*}$ defined in the present section is an outer measure and the $P^{*}$-measurable sets are exactly the sets with $P^{*}(B)=P_{*}(B)$; they are also the sets in the $P$-completion of $\mathcal{A}$.
[Hint: If $B$ is $P^{*}$-measurable, then the outer measure rule applied to $C=B^{*}$ yields $P\left(B^{*}\right)=P\left(B^{*}\right)+P^{*}\left(B^{*}-B\right)$.]
14. For any $\varepsilon \in[0,1]$, there exists a set $B \subset[0,1]$ with $\lambda_{*}(B)=0$ and $\lambda^{*}(B)=\varepsilon$, where $\lambda$ is Lebesgue measure. Hence there exist subsets $A$ and $B$ of $[0,1]$ with $A \cap B=\emptyset$ and $\lambda^{*}(A)=\lambda^{*}(B)=1$.
15. For any sets $A$ and $B$,
(i) $(A \cup B)^{*}=A^{*} \cup B^{*} ; \quad(A \cap B)_{*}=A_{*} \cap B_{*}$;
(ii) $(A \cap B)^{*} \subset A^{*} \cap B^{*} ; \quad(A \cup B)_{*} \supset A_{*} \cup B_{*}$.

For sets $A$ and $B$ with $A \cap B=\emptyset$,
(iii) $P_{*}(A)+P_{*}(B) \leq P_{*}(A \cup B) \leq P^{*}(A \cup B) \leq P^{*}(A)+P^{*}(B)$.

The last two equalities in (iii) are always valid. The inclusions in (ii) cannot be replaced by equalities, in general, but they are equalities if one of the two sets is measurable.
16. (Trace measure) Let ( $\Omega, \mathcal{A}, P$ ) be a probability space and $B$ a subset of $\Omega$, possibly not measurable. The equality $P_{B}(A \cap B)=P\left(A \cap B^{*}\right)$ defines a measure on the trace $\sigma$-field $\mathcal{A} \cap B$ with the property $P_{B}(C)=P^{*}(C)$ for every $C \in \mathcal{A} \cap B$. It is a probability measure if and only if $P^{*}(B)=1$.
[Hint: If $A_{1}$ and $A_{2}$ are measurable sets with $A_{1} \cap B=A_{2} \cap B$, then their symmetric difference is measurable and disjoint with $B$, so it is also disjoint with (a version of) $B^{*}$. Thus $P\left(A_{1} \cap B^{*}\right)=P\left(A_{2} \cap B^{*}\right)$ and $P_{B}$ is well defined. It is clearly a measure. Next use that $A \cap B^{*}=(A \cap B)^{*}$ for measurable $A$.]
17. Let ( $\Omega, \mathcal{A}, P$ ) be a probability space and $B \notin \mathcal{A}$. For every constant $p$ with $P_{*}(B) \leq p \leq P^{*}(B)$ there exists an extension $\tilde{P}$ of $P$ to a $\sigma$-field that contains $\mathcal{A}$ and $B$ with the further property that $\tilde{P}(B)=p$.
[Hint: Take the $\sigma$-field equal to the collection of sets of the form $(A \cup B) \cup (A \cap \Omega-B)$. For $p=P^{*}(B)$, define $\tilde{P}(A)=P_{B}(A \cap B)+P\left(A \cap\left(\Omega-B^{*}\right)\right)$, where $P_{B}$ is the trace of $P$ on $\mathcal{A} \cap B$. For $p=P_{*}(B)$, define $\tilde{P}(A)=P(A \cap \left.B_{*}\right)+P_{\Omega-B}(A \cap(\Omega-B))$. For general $p$, take a linear combination.]
18. Let $L$ be a finite Borel measure on a metric space $\mathbb{D}$, and let $\mathbb{D}_{0} \subset \mathbb{D}$ be an arbitrary subset. If $G_{n}$ is a sequence of relatively open subsets of $\mathbb{D}_{0}$ with $\lim \sup G_{n}=\emptyset$, then $L^{*}\left(G_{n}\right) \rightarrow 0$. "Relatively open" could just as well be "relatively Borel."
[Hint: Consider the Borel measure $L_{\mathbb{D}_{0}}(B)=L\left(B \cap \mathbb{D}_{0}^{*}\right)$ on $\mathbb{D}_{0}$.]
19. For $i=1,2$, let $\phi_{i}:\left(\Omega_{i}, \mathcal{U}_{i}, P_{i}\right) \mapsto(\mathcal{X}, \mathcal{A})$ be measurable maps such that the induced measures $P_{1} \circ \phi_{1}^{-1}=P_{2} \circ \phi_{2}^{-1}$ are the same (on $\mathcal{A}$ ). Then it is not necessarily true that $\mathrm{E}^{*} T \circ \phi_{1}=\mathrm{E}^{*} T \circ \phi_{2}$ for every $T: \mathcal{X} \mapsto[0,1]$.
[Hint: Take $\mathcal{X}=\Omega_{1}=\Omega_{2}$ and both maps $\phi_{i}$ the identity. Take $\mathcal{A}=\mathcal{U}_{1}$ and $\mathcal{U}_{2}$ the smallest $\sigma$-field generated by $\mathcal{U}_{1}$ and a nonmeasurable set $B$. Take $T=1_{B}$.]

## 1.3

## Weak Convergence

In this section $\mathbb{D}$ and $\mathbb{E}$ are metric spaces with metrics $d$ and $e$, respectively. The set of all continuous, bounded functions $f: \mathbb{D} \mapsto \mathbb{R}$ is denoted $C_{b}(\mathbb{D})$.

The Borel $\sigma$-field on $\mathbb{D}$ is the smallest $\sigma$-field containing the open sets. A function between two topological spaces is continuous if and only if the inverse image of every open set is open. Hence a continuous function is Borel measurable. This is always true; for a metric space $\mathbb{D}$, the case we consider throughout, there is also a converse.
1.3.1 Lemma. The Borel $\sigma$-field on a metric space $\mathbb{D}$ is the smallest $\sigma$-field making all elements of $C_{b}(\mathbb{D})$ measurable (with respect to the Borel sets on $\mathbb{R}$ ).

Proof. A closed set $F$ in $\mathbb{D}$ is the null set $\{x: f(x)=0\}$ of the continuous, bounded function $x \mapsto f(x)=d(x, F) \wedge 1$. Hence it is contained in the $\sigma$-field generated by $C_{b}(\mathbb{D})$. Since the closed sets generate the Borel $\sigma$-field, all Borel sets must be contained in the $\sigma$-field generated by $C_{b}(\mathbb{D})$. The reverse inclusion was argued previously.

A finite Borel measure is simply a finite measure on the Borel sets. ${ }^{\ddagger}$ A Borel probability measure $L$ is tight if for every $\varepsilon>0$ there exists a compact set $K$ with $L(K) \geq 1-\varepsilon$. A Borel measurable map $X: \Omega \mapsto \mathbb{D}$ is called tight if its law $\mathcal{L}(X)=P \circ X^{-1}$ is tight. This is equivalent

[^1]to there being a $\sigma$-compact set (a countable union of compacts) that has probability 1 under $L$ or $X$. If there is a separable, measurable set with probability 1 , then $L$ or $X$ is called separable. Since a $\sigma$-compact set in a metric space is separable, separability is slightly weaker than tightness. The following lemma shows that the two properties are the same if the metric space is complete. So the difference can be made to disappear by completing the space. ${ }^{b}$ Actually, every separable Borel probability measure on a metric space is pre-tight: for every $\varepsilon>0$, there exists a totally bounded, measurable set with probability at least $1-\varepsilon . .^{\sharp}$ This concept is usually not considered, because it depends on the metric, while both separability and tightness depend on the topology only. Another topological property of a Borel probability measure is Polishness: $L$ is Polish if it gives mass 1 to a Polish set. ${ }^{\dagger}$
1.3.2 Lemma. A Borel probability measure on a metric space is pre-tight if and only if it is separable. On a complete metric space separability, pretightness and tightness are equivalent. Any Polish Borel probability measure is tight.

Proof. A pre-tight measure concentrates on a countable union of totally bounded sets; a totally bounded set is separable - so a pre-tight measure is certainly separable. Conversely, let $\mathbb{D}_{0}$ be the closure of a separable set with probability 1 . Take a sequence $x_{m}$ that is dense in $\mathbb{D}_{0}$. For every $\delta>0$, the balls of radius $\delta$ around the $x_{m}$ cover $\mathbb{D}_{0}$. Thus their union has mass 1 ; the union of some finitely many of them has mass at least $1-\varepsilon$. Conclude that for every $j$ there exist finitely many balls of radius $1 / j$ whose union $G_{j}$ has mass at least $1-\varepsilon / 2^{j}$. The intersection $\cap_{j=1}^{\infty} G_{j}$ is totally bounded and has mass at least $1-\varepsilon$. This concludes the proof of the first assertion. The second is a consequence of the fact that a set is compact if and only if it is totally bounded and complete.
1.3.3 Definition. Let ( $\Omega_{\alpha}, \mathcal{A}_{\alpha}, P_{\alpha}$ ) be a net of probability spaces and $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ arbitrary maps. The net $X_{\alpha}$ converges weakly to a Borel measure $L$ if

$$
\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \int f d L, \quad \text { for every } f \in C_{b}(\mathbb{D})
$$

[^2]This is denoted by $X_{\alpha} \rightsquigarrow L$. If $X$ has a Borel law $L$, we also say that $X_{\alpha}$ converges weakly to $X$ and write $X_{\alpha} \rightsquigarrow X$. Throughout, it will be silently understood that the statements $X_{\alpha} \rightsquigarrow L$ or $X_{\alpha} \rightsquigarrow X$ include that $L$ is a Borel measure and $X$ Borel measurable, or in the latter case $X$ can at least be chosen Borel measurable. The names "convergence in distribution", "convergence in law," and "weak star convergence" are sometimes used instead of "weak convergence." In the present context, these terms are equivalent.

A closely related concept is weak convergence of Borel measures. A net $L_{\alpha}$ of Borel measures on $\mathbb{D}$ is said to converge weakly to $L$ if

$$
\int f d L_{\alpha} \rightarrow \int f d L, \quad \text { for every } f \in C_{b}(\mathbb{D})
$$

This is denoted $L_{\alpha} \rightsquigarrow L$. In the special case that every $X_{\alpha}$ is Borel measurable, weak convergence is equivalent to weak convergence of their induced laws: $X_{\alpha} \rightsquigarrow L$ if and only if $P_{\alpha} \circ X_{\alpha}^{-1} \rightsquigarrow L$. In general, such a reduction to induced laws is impossible. Instead, the definition must be based on outer expectations.

The measurable spaces ( $\Omega_{\alpha}, \mathcal{A}_{\alpha}, P_{\alpha}$ ) are of crucial importance because they determine the outer expectations. They may be different for each $\alpha$, though in everything that is to follow it is not a loss of generality to take them all equal - the case of different spaces can be reduced to that of a single $\Omega$ through suitable "canonical representations."

In any case, we write $\mathrm{P}^{*}$ and $\mathrm{E}^{*}$ without an index $\alpha$ to denote "general" probability and expectation, unless this would cause confusion. This index $\alpha$, of course, is understood to run through a directed set $A$. Some results are special to sequences; in this case $\alpha$ will be changed to $n$, and it is silently understood that the directed set is formed by the natural numbers.

The portmanteau theorem gives equivalent ways of describing weak convergence. Characterization (vi) has intuitive meaning: weak convergence means convergence of probabilities of certain (but not all) sets. The other characterizations are mainly useful as technical tools.
1.3.4 Theorem (Portmanteau). The following statements are equivalent:
(i) $X_{\alpha} \rightsquigarrow L$;
(ii) $\lim \inf \mathrm{P}_{*}\left(X_{\alpha} \in G\right) \geq L(G)$ for every open $G$;
(iii) $\limsup \mathrm{P}^{*}\left(X_{\alpha} \in F\right) \leq L(F)$ for every closed $F$;
(iv) $\liminf \mathrm{E}_{*} f\left(X_{\alpha}\right) \geq \int f d L$ for every lower semicontinuous $f$ that is bounded below $;^{\ddagger}$
(v) $\limsup \mathrm{E}^{*} f\left(X_{\alpha}\right) \leq \int f d L$ for every upper semicontinuous $f$ that is bounded above;

[^3](vi) $\lim \mathrm{P}^{*}\left(X_{\alpha} \in B\right)=\lim \mathrm{P}_{*}\left(X_{\alpha} \in B\right)=L(B)$ for every Borel set $B$ with $L(\delta B)=0$; ${ }^{\text {b }}$
(vii) $\liminf \mathrm{E}_{*} f\left(X_{\alpha}\right) \geq \int f d L$ for every bounded, Lipschitz continuous, nonnegative $f$.

Proof. The equivalence of (ii) and (iii) follows by taking complements; the equivalence of (iv) and (v) by replacing $f$ by $-f$. The implication (i) ⇒ (vii) is trivial.
(vii) ⇒ (ii). Suppose (vii) holds. For every open $G$, there exists a sequence of Lipschitz continuous functions with $0 \leq f_{m} \uparrow 1_{G}$. For instance, $f_{m}(x)=m d(x, \mathbb{D}-G) \wedge 1$. For every fixed $m$, $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in G\right) \geq \liminf \mathrm{E}_{*} f_{m}\left(X_{\alpha}\right) \geq \int f_{m} d L$. Letting $m \rightarrow \infty$ yields (ii).
(ii) ⇒ (iv). Let (ii) hold and $f$ be lower semicontinuous with $f \geq 0$. Define the sequence $f_{m}$ by $f_{m}=\sum_{i=1}^{m^{2}}(1 / m) 1_{G_{i}}$, where $G_{i}=\{x: f(x)> i / m\}$; this is $f$ truncated to $i / m$ if $i / m<f(x) \leq(i+1) / m \leq m$ and truncated to $m$ if $f(x)>m$. Thus $f_{m} \leq f$ and $\left|f_{m}-f\right|(x) \leq 1 / m$ whenever $f(x) \leq m$. Fix $m$. Since every $G_{i}$ is open

$$
\liminf \mathrm{E}_{*} f\left(X_{\alpha}\right) \geq \liminf \mathrm{E}_{*} f_{m}\left(X_{\alpha}\right) \geq \sum_{i=1}^{m^{2}} \frac{1}{m} \mathrm{P}\left(X \in G_{i}\right)=\int f_{m} d L
$$

Letting $m \rightarrow \infty$ yields the assertion of (iv) for nonnegative, lower semicontinuous $f$. Add and subtract a constant to complete the proof.

Since a continuous function is both upper and lower semicontinuous, (v) implies (i). It remains to show the equivalence of (vi) and the others.
(ii) ⇒ (vi). If (ii) and (iii) hold, then

$$
L(\operatorname{int} B) \leq \liminf \mathrm{P}_{*}\left(X_{\alpha} \in \operatorname{int} B\right) \leq \limsup \mathrm{P}^{*}\left(X_{\alpha} \in \bar{B}\right) \leq L(\bar{B}) .
$$

When $L(\delta B)=0$, all inequalities in the previous display are equalities. This yields (vi).
(vi) ⇒ (iii). Suppose (vi) holds, and let $F$ be closed. Write $F^{\varepsilon}= \{x: d(x, F)<\varepsilon\}$. The sets $\delta F^{\varepsilon}$ are disjoint for different values of $\varepsilon>0$, so that at most countably many of them can have nonzero $L$-measure. Choose a sequence $\varepsilon_{m} \downarrow 0$ with $L\left(\delta F^{\varepsilon_{m}}\right)=0$ for every $m$. For fixed $m$,

$$
\limsup \mathrm{P}^{*}\left(X_{\alpha} \in F\right) \leq \limsup \mathrm{P}^{*}\left(X_{\alpha} \in \overline{F^{\varepsilon_{m}}}\right)=L\left(\overline{F^{\varepsilon_{m}}}\right)
$$

Letting $m \rightarrow \infty$ yields (iii).

[^4]1.3.5 Example. When $\mathbb{D}=\mathbb{R}^{k}$, the Borel $\sigma$-field is the usual $\sigma$-field generated by the cells $(a, b]$ and every Borel measure is tight. Every Borel measure $L$ is uniquely determined by its cumulative distribution function $L(x)=L((-\infty, x])$. In addition to the characterizations of the portmanteau theorem, weak convergence $X_{\alpha} \rightsquigarrow L$ is equivalent to
(viii) $\lim \mathrm{P}^{*}\left(X_{\alpha} \leq x\right)=\lim \mathrm{P}_{*}\left(X_{\alpha} \leq x\right)=L(x)$ for all continuity points $x$ of $L$;
and, for measurable $X_{\alpha}$, also to
(ix) $\lim \mathrm{E} e^{i t^{\prime} X_{\alpha}}=\int e^{i t^{\prime} x} d L(x)$ for every $t \in \mathbb{R}^{k}$.

The proofs are omitted. They can be based on Prohorov's theorem combined with the fact that a probability distribution on $\mathbb{R}^{k}$ is uniquely determined by its cumulative distribution function or characteristic function.

It is immediate from the definition that $X_{\alpha} \rightsquigarrow X$ implies $g\left(X_{\alpha}\right) \rightsquigarrow g(X)$ for every continuous $g$. This is actually already true under only the condition that $g$ is continuous almost surely under $X$. The continuous mapping theorem is not a very deep result, but it is what makes the concept of weak convergence successful.
1.3.6 Theorem (Continuous mapping). Let $g: \mathbb{D} \mapsto \mathbb{E}$ be continuous at every point of a set $\mathbb{D}_{0} \subset \mathbb{D}$. If $X_{\alpha} \rightsquigarrow X$ and $X$ takes its values in $\mathbb{D}_{0}$, then $g\left(X_{\alpha}\right) \rightsquigarrow g(X)$.

Proof. The set $D_{g}$ of all points at which $g$ is discontinuous can be written as $D_{g}=\cup_{m=1}^{\infty} \cap_{k=1}^{\infty} G_{k}^{m}$, where $G_{k}^{m}$ is the set of all $x$ for which there are $y$ and $z$ within the open ball of radius $1 / k$ around $x$ with $e(g(y), g(z))>1 / m$. Every $G_{k}^{m}$ is open, so $D_{g}$ is a Borel set. For every closed $F$, it holds that

$$
\overline{g^{-1}(F)} \subset g^{-1}(F) \cup D_{g}
$$

Since $g$ is continuous on the range of the limit variable, $g(X)$ can be chosen Borel measurable. By the portmanteau theorem, $\limsup \mathrm{P}^{*}\left(g\left(X_{\alpha}\right) \in F\right) \leq \lim \sup \mathrm{P}^{*}\left(X_{\alpha} \in \overline{g^{-1}(F)}\right) \leq \mathrm{P}\left(X \in \overline{g^{-1}(F)}\right)$. Since the set of discontinuities has probability zero under $X$, the last expression equals $\mathrm{P}(g(X) \in F)$. Finally, apply the portmanteau theorem again.

Next to the continuous mapping theorem, Prohorov's theorem is the most important theorem on weak convergence. To formulate the result, two new concepts are needed.
1.3.7 Definition. The net of maps $X_{\alpha}$ is asymptotically measurable if and only if

$$
\mathrm{E}^{*} f\left(X_{\alpha}\right)-\mathrm{E}_{*} f\left(X_{\alpha}\right) \rightarrow 0, \quad \text { for every } f \in C_{b}(\mathbb{D}) .
$$

The net $X_{\alpha}$ is asymptotically tight if for every $\varepsilon>0$ there exists a compact set $K$ such that

$$
\liminf \mathrm{P}_{*}\left(X_{\alpha} \in K^{\delta}\right) \geq 1-\varepsilon, \quad \text { for every } \delta>0 .
$$

Here $K^{\delta}=\{y \in \mathbb{D}: d(y, K)<\delta\}$ is the " $\delta$-enlargement" around $K$.
The $\delta$ in the definition of tightness may seem a bit overdone. It is not - asymptotic tightness as defined is essentially weaker than the same condition but with $K$ instead of $K^{\delta}$. This is caused by a second difference with the classical concept of uniform tightness ${ }^{\sharp}$ : the (enlarged) compacts need to contain mass $1-\varepsilon$ only in the limit.

On the other hand, nothing is gained in simple cases: for Borel measurable maps in a Polish space, asymptotic tightness and uniform tightness are the same (Problem 1.3.9). It may also be noted that, although $K^{\delta}$ is dependent on the metric, the property of asymptotic tightness depends on the topology only (Problem 1.3.6). One nice consequence of the present tightness concept is that weak convergence usually implies asymptotic measurability and tightness.

### 1.3.8 Lemma.

(i) If $X_{\alpha} \rightsquigarrow X$, then $X_{\alpha}$ is asymptotically measurable.
(ii) If $X_{\alpha} \rightsquigarrow X$, then $X_{\alpha}$ is asymptotically tight if and only if $X$ is tight.

Proof. (i). This follows upon applying the definition of weak convergence to both $f$ and $-f$.
(ii). Fix $\varepsilon>0$. If $X$ is tight, then there is a compact $K$ with $\mathrm{P}(X \in K)>1-\varepsilon$. By the portmanteau theorem, $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in K^{\delta}\right) \geq \mathrm{P}(X \in K^{\delta}$ ), which is larger than $1-\varepsilon$ for every $\delta>0$. Conversely, if $X_{\alpha}$ is tight, then there is a compact $K$ with $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in K^{\delta}\right) \geq 1-\varepsilon$. By the portmanteau theorem, $\mathrm{P}\left(X \in \overline{K^{\delta}}\right) \geq 1-\varepsilon$. Let $\delta \downarrow 0$.

The next version of Prohorov's theorem may be considered a converse of the previous lemma. It comes in two parts, one for nets and one for sequences, neither one of which implies the other. The sequence case is the deepest of the two.

### 1.3.9 Theorem (Prohorov's theorem).

(i) If the net $X_{\alpha}$ is asymptotically tight and asymptotically measurable, then it has a subnet $X_{\alpha(\beta)}$ that converges in law to a tight Borel law.
(ii) If the sequence $X_{n}$ is asymptotically tight and asymptotically measurable, then it has a subsequence $X_{n_{j}}$ that converges weakly to a tight Borel law.

[^5]Proof. (i). Consider $\left(\mathrm{E}^{*} f\left(X_{\alpha}\right)\right)_{f \in C_{b}(\mathbb{D})}$ as a net in the product space

$$
\prod_{f \in C_{b}(\mathbb{D})}\left[-\|f\|_{\infty},\|f\|_{\infty}\right] .
$$

By Tychonov's theorem, this space is compact in the product topology. Hence the given net has a converging subnet. This is equivalent to the existence of constants $L(f) \in\left[-\|f\|_{\infty},\|f\|_{\infty}\right]$ such that

$$
\mathrm{E}^{*} f\left(X_{\alpha(\beta)}\right) \rightarrow L(f), \quad \text { for every } f \in C_{b}(\mathbb{D}) .
$$

It suffices to show that the functional $L: C_{b}(\mathbb{D}) \mapsto \mathbb{R}$ is representable by a Borel probability measure $L$ in the sense that $L(f)=\int f d L$ for every $f \in C_{b}(\mathbb{D})$.

Because of the asymptotic measurability, the numbers $L(f)$ are also the limits of the corresponding inner expectations $\mathrm{E}_{*} f\left(X_{\alpha}\right)$. Consequently,

$$
\begin{aligned}
L\left(f_{1}+f_{2}\right) & \leq \lim \left(\mathrm{E}^{*} f_{1}\left(X_{\alpha(\beta)}\right)+\mathrm{E}^{*} f_{2}\left(X_{\alpha(\beta)}\right)\right) \\
& =L\left(f_{1}\right)+L\left(f_{2}\right) \\
& =\lim \left(\mathrm{E}_{*} f_{1}\left(X_{\alpha(\beta)}\right)+\mathrm{E}_{*} f_{2}\left(X_{\alpha(\beta)}\right)\right) \leq L\left(f_{1}+f_{2}\right)
\end{aligned}
$$

Thus $L: C_{b}(\mathbb{D}) \mapsto \mathbb{R}$ is additive. By a similar argument, it follows that $L(\lambda f)=\lambda L(f)$ for every $\lambda \in \mathbb{R}$. So $L$ is even linear. Trivially, it is positive: if $f \geq 0$, then $L(f) \geq 0$.

Finally, $L$ also has another property of an integral: if $f_{m} \downarrow 0$ pointwise, then $L\left(f_{m}\right) \downarrow 0$. Indeed, fix $\varepsilon>0$. There is a compact $K$ such that $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in K^{\delta}\right) \geq 1-\varepsilon$ for every $\delta>0$. By Dini's theorem, $f_{m} \downarrow 0$ uniformly on compacts. Hence for sufficiently large $m$, it holds that $\left|f_{m}(x)\right| \leq \varepsilon$ for every $x \in K$. Fix an $m$ for which this holds. By an easy argument using the compactness of $K$, there exists a $\delta>0$ such that $\left|f_{m}(x)\right| \leq 2 \varepsilon$ for every $x \in K^{\delta}$. One has that $\left(1_{X_{\alpha} \in K^{\delta}}\right)_{*}=1_{A_{\alpha}}$ for a measurable set $A_{\alpha} \subset\left\{X_{\alpha} \in K^{\delta}\right\}$. Hence

$$
L\left(f_{m}\right)=\lim \mathrm{E} f_{m}\left(X_{\alpha}\right)^{*}\left(\left(1_{X_{\alpha} \in K^{\delta}}\right)_{*}+\left(1_{X_{\alpha} \notin K^{\delta}}\right)^{*}\right) \leq 2 \varepsilon+\left\|f_{1}\right\|_{\infty} \varepsilon
$$

It has been shown that $L$ has all the properties of an abstract integral. By the Daniell-Stone theorem ${ }^{\dagger}, L$ is representable by a Borel probability measure $L$. This concludes the proof of (i).
(ii). The proof of (ii) is the same as for (i) except in the first part, where for (ii) it has to be shown that there is a subsequence, rather than a subnet, along which outer expectations converge. This is achieved in the following manner.

For $m \in \mathbb{N}$, let $K_{m}$ be a compact with $\liminf \mathrm{P}_{*}\left(X_{n} \in K_{m}^{\delta}\right) \geq 1-1 / m$ for every $\delta>0$. Since $K_{m}$ is compact, the space $C_{b}\left(K_{m}\right)$, and hence also

[^6]its unit ball $\left\{f \in C_{b}\left(K_{m}\right):|f(x)| \leq 1\right.$ for every $\left.x \in K_{m}\right\}$, is separable. According to Tietze's extension theorem ${ }^{\ddagger}$, every continuous function defined on a closed subset of a normal space with values in $[-1,1]$ can be extended to a continuous function on the whole space with values in $[-1,1]$. Hence every $f$ in the unit ball of $C_{b}\left(K_{m}\right)$ can be extended to an $f$ in the unit ball of $C_{b}(\mathbb{D})$. Combination of these facts yields that there exists a countable subset of the unit ball of $C_{b}(\mathbb{D})$ of which the restrictions to $K_{m}$ are dense in the unit ball of $C_{b}\left(K_{m}\right)$.

Pick such a countable set for every $m$, and let $\mathcal{F}$ be the countably many functions obtained this way. For a fixed, bounded $f$, there clearly is a subsequence $X_{n_{j}}$ such that $\mathrm{E}^{*} f\left(X_{n_{j}}\right)$ converges to some number. By a diagonalization argument, obtain a subsequence such that

$$
\mathrm{E}^{*} f\left(X_{n_{j}}\right) \rightarrow L(f), \quad \text { for every } f \in \mathcal{F}
$$

for numbers $L(f) \in[-1,1]$.
Next let $f \in C_{b}(\mathbb{D})$ take values in $[-1,1]$, but be arbitrary otherwise. Fix $\varepsilon>0$ and $m$. There exists $f_{m} \in \mathcal{F}$ with $\left|f(x)-f_{m}(x)\right| \leq \varepsilon$, for every $x \in K_{m}$. Then, as before, there exists $\delta>0$ such that $\left|f(x)-f_{m}(x)\right| \leq 2 \varepsilon$, for every $x \in K_{m}^{\delta}$. Then

$$
\begin{aligned}
& \left|\mathrm{E}^{*} f\left(X_{n}\right)-\mathrm{E}^{*} f_{m}\left(X_{n}\right)\right| \\
& \quad \leq \mathrm{E}\left|f\left(X_{n}\right)-f_{m}\left(X_{n}\right)\right|^{*}\left(1_{X_{n} \in K_{m}^{\delta}}\right)_{*}+2 \mathrm{P}^{*}\left(X_{n} \notin K_{m}^{\delta}\right) \leq 2 \varepsilon+2 / m,
\end{aligned}
$$

for sufficiently large $n$. Conclude that the sequence $\mathrm{E}^{*} f\left(X_{n_{j}}\right)$ has the property that, for every $\eta>0$, there is a converging subsequence of numbers that is eventually within distance $\eta$. This implies that $\mathrm{E}^{*} f\left(X_{n_{j}}\right)$ itself converges to a limit.

Complete the proof as under (i).
Of course, under the conditions of Prohorov's theorem - that $X_{\alpha}$ is asymptotically tight and measurable - the seemingly stronger conclusion is true that every subnet of $X_{\alpha}$ has a further subnet that converges to a tight Borel law. A net with this property is called relatively compact. Relatively compact sequences are defined analogously, with subnets replaced by subsequences. The converse of this stronger form of Prohorov's theorem is false: a relatively compact net or sequence is not necessarily asymptotically tight. However, if, in addition, all limit points concentrate on a fixed Polish space, then a relatively compact net is asymptotically tight (Problem 1.12.4). Thus for Borel measures on Polish spaces the concepts "relatively compact," "asymptotically tight," and "uniformly tight" are all equivalent.

The next theorem is trivial but important. In many applications there are several possible spaces $\mathbb{D}$ in which one could consider weak convergence.

[^7]For instance, a net of positive real-valued maps can be considered as maps in $\mathbb{R}^{+}$, in $\mathbb{R}$, or even in $\mathbb{R}^{2}$. Less trivial examples arise with infinite-dimensional spaces. It wouldn't be nice if our choice of $\mathbb{D}$ influenced the conclusion too much. Fortunately, as long as the topology is not changed, this is not the case.
1.3.10 Theorem. Let $\mathbb{D}_{0} \subset \mathbb{D}$ be arbitrary, and let $X$ and $X_{\alpha}$ take their values in $\mathbb{D}_{0}$. Then $X_{\alpha} \rightsquigarrow X$ as maps in $\mathbb{D}_{0}$ if and only if $X_{\alpha} \rightsquigarrow X$ as maps in $\mathbb{D}$. Here $\mathbb{D}_{0}$ and $\mathbb{D}$ are equipped with the same metric.

Proof. Because a set $G_{0}$ in $\mathbb{D}_{0}$ is open if and only if it is of the form $G \cap \mathbb{D}_{0}$ for an open set $G$ in $\mathbb{D}$, this is an easy corollary of (ii) of the portmanteau theorem.
1.3.11 Example (Weak convergence of discrete measures). Let $X$ and every $X_{\alpha}$ be maps taking their values in a countable subset $S \subset \mathbb{D}$ of isolated points. (Every $s \in S$ has an open neighbourhood that contains no other points of $S$.) Then $X_{\alpha} \rightsquigarrow X$ if and only if $X$ is Borel measurable and $\mathrm{P}_{*}\left(X_{\alpha}=s\right) \rightarrow \mathrm{P}(X=s)$ for every $s \in S$. In this case, both $\mathrm{P}^{*}\left(X_{\alpha} \in B\right)$ and $\mathrm{P}_{*}\left(X_{\alpha} \in B\right)$ converge to $\mathrm{P}(X \in B)$ for every Borel set $B \subset \mathbb{D}$.

Indeed, in view of the previous theorem, it may be assumed without loss of generality that $S=\mathbb{D}$. Then every set $B \subset \mathbb{D}$ is open and closed at the same time and therefore has empty boundary. If $X_{\alpha} \rightsquigarrow X$, then outer and inner probabilities of every set converge by the portmanteau theorem. Conversely, suppose inner measures of one-point sets converge. Let $G$ be arbitrary. For any finite subset $K$ of $G$, one has $\mathrm{P}_{*}\left(X_{\alpha} \in K\right) \geq \sum_{s \in K} \mathrm{P}_{*}\left(X_{\alpha}=s\right) \rightarrow \mathrm{P}(X \in K)$. Conclude that $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in G\right) \geq \mathrm{P}(X \in G)$ for every $G$, in particular open ones, so that $X_{\alpha} \rightsquigarrow X$ by the portmanteau theorem.

The condition that the points of $S$ are isolated cannot be omitted. It is crucial in the above that both $X$ and every $X_{\alpha}$ take their values in $S$.

As a consequence of the previous theorem, a net that converges weakly to a separable limit is asymptotically tight when seen as maps into the completion of $\mathbb{D}$. There are no known examples of nonseparable Borel measures. Thus, there is no great loss of generality in considering only those weakly convergent nets that are asymptotically tight. (It is actually known that, starting from the usual axioms of mathematics, including the axiom of choice, it is impossible to construct nonseparable Borel measures - the axiom that nonseparable Borel measures do not exist can be added to the Zermelo-Fränkel system without creating inconsistencies. It is apparently unknown whether nonseparable Borel measures can consistently exist.)

A question that has been ignored so far is whether weak limits are unique - they are. A Borel measure is uniquely defined by the expectations it gives to the elements of $C_{b}(\mathbb{D})$. Tight Borel measures are already determined by the expectations of relatively small subclasses of $C_{b}(\mathbb{D})$.
1.3.12 Lemma. Let $L_{1}$ and $L_{2}$ be finite Borel measures on $\mathbb{D}$.
(i) If $\int f d L_{1}=\int f d L_{2}$ for every $f \in C_{b}(\mathbb{D})$, then $L_{1}=L_{2}$.

Let $L_{1}$ and $L_{2}$ be tight Borel probability measures on $\mathbb{D}$.
(ii) If $\int f d L_{1}=\int f d L_{2}$ for every $f$ in a vector lattice ${ }^{b} \mathcal{F} \subset C_{b}(\mathbb{D})$ that contains the constant functions and separates points of $\mathbb{D}$, then $L_{1}= L_{2}$.

Proof. (i). For every open $G$, there exists a sequence of continuous functions with $0 \leq f_{m} \uparrow 1_{G}$ (compare the proof of the portmanteau theorem). By monotone convergence, $L_{1}(G)=L_{2}(G)$ for every open $G$. Since $L_{1}(\mathbb{D})= L_{2}(\mathbb{D})$, the collection of Borel sets for which $L_{1}(B)=L_{2}(B)$ is a $\sigma$-field.
(ii). Fix $\varepsilon>0$. Take a compact $K$ such that $L_{1}(K) \wedge L_{2}(K) \geq 1-\varepsilon$. According to a version of the Stone-Weierstrass theorem ${ }^{\sharp}$, a vector lattice $\mathcal{F} \subset C_{b}(K)$ that contains the constant functions and separates points of $K$ is uniformly dense in $C_{b}(K)$. Given $g \in C_{b}(\mathbb{D})$ with $0 \leq g \leq 1$, take $f \in \mathcal{F}$ with $|g(x)-f(x)| \leq \varepsilon$ for every $x \in K$. Then $\left|\int g d L_{1}-\int g d L_{2}\right| \leq \left|\int(f \wedge 1)^{+} d L_{1}-\int(f \wedge 1)^{+} d L_{2}\right|+4 \varepsilon$, which equals $4 \varepsilon$ because $(f \wedge 1)^{+} \in \mathcal{F}$. Conclude that $\int g d L_{1}=\int g d L_{2}$. By adding and multiplying with scalars, obtain the same result for every $g \in C_{b}(\mathbb{D})$.

Requiring only asymptotic measurability of a net $X_{\alpha}$, as opposed to Borel measurability of every $X_{\alpha}$, extends the applicability of weak convergence considerably. However, asymptotic measurability is hard to establish directly. The most promising method seems to be to prove measurability into some smaller $\sigma$-field plus some additional property. For asymptotically tight nets, the situation is nice - asymptotic tightness plus only a little bit of measurability gives asymptotic measurability. The next lemma is an abstract version of this result. Interesting special cases are discussed in the next sections.
1.3.13 Lemma. Let the net $X_{\alpha}$ be asymptotically tight, and suppose $\mathrm{E}^{*} f\left(X_{\alpha}\right)-\mathrm{E}_{*} f\left(X_{\alpha}\right) \rightarrow 0$ for every $f$ in a subalgebra $\mathcal{F}$ of $C_{b}(\mathbb{D})$ that separates points of $\mathbb{D} .^{\dagger}$ Then the net $X_{\alpha}$ is asymptotically measurable.

Proof. Fix $\varepsilon>0$ and a compact $K$ such that $\limsup \mathrm{P}^{*}\left(X_{\alpha} \notin K^{\delta}\right) \leq \varepsilon$ for every $\delta>0$. Assume without loss of generality that $\mathcal{F}$ contains the constant functions. By the Stone-Weierstrass theorem, the restrictions of the functions in $\mathcal{F}$ to $K$ are uniformly dense in $C_{b}(K)$. Hence given $f \in$

[^8]$C_{b}(\mathbb{D})$, there exists $g \in \mathcal{F}$ with $|f(x)-g(x)| \leq \varepsilon / 4$ for every $x \in K$. Using the compactness of $K$, it is easily seen that there is a $\delta>0$ such that $|f(x)-g(x)| \leq \varepsilon / 3$ for every $x \in K^{\delta}$. Let $\left\{X_{\alpha} \in K^{\delta}\right\}_{*}$ be a measurable set contained in $\left\{X_{\alpha} \in K^{\delta}\right\}$ and with the same inner measure. Then $\mathrm{P}\left(\Omega_{\alpha}-\right. \left.\left\{X_{\alpha} \in K^{\delta}\right\}_{*}\right)=\mathrm{P}^{*}\left(X_{\alpha} \notin K^{\delta}\right)$ and, for large $\alpha$,
$$
\begin{aligned}
\mathrm{P}\left(\mid f\left(X_{\alpha}\right)^{*}\right. & \left.-f\left(X_{\alpha}\right)_{*} \mid>\varepsilon\right) \\
& \leq \mathrm{P}\left(\left|f\left(X_{\alpha}\right)^{*}-f\left(X_{\alpha}\right)_{*}\right|>\varepsilon \cap\left\{X_{\alpha} \in K^{\delta}\right\}_{*}\right)+2 \varepsilon \\
& \leq \mathrm{P}\left(\left|g\left(X_{\alpha}\right)^{*}-g\left(X_{\alpha}\right)_{*}\right|>\varepsilon / 3\right)+2 \varepsilon
\end{aligned}
$$

Hence $f\left(X_{\alpha}\right)^{*}-f\left(X_{\alpha}\right)_{*} \rightarrow 0$ in probability. By dominated convergence, $\mathrm{E}\left(f\left(X_{\alpha}\right)^{*}-f\left(X_{\alpha}\right)_{*}\right) \rightarrow 0$.

## Problems and Complements

1. (Regularity of Borel measures) Every Borel probability measure $L$ on a metric space is outer regular: for every Borel set $B$,

$$
L(B)=\sup _{\substack{F \subset B \\ F \text { closed }}} L(F)=\inf _{\substack{G \supset B \\ G \text { open }}} L(G)
$$

A Borel probability measure $L$ is called inner regular if, for every Borel set B,

$$
L(B)=\sup _{\substack{K \subset B \\ K \text { compact }}} L(K)
$$

A Borel probability measure on a metric space is inner regular if and only if it is tight. In particular, every Borel probability measure on a Polish space is inner regular. An inner regular measure is sometimes called a Radon measure. The first equation is also true with " $F$ closed" replaced by " $F$ totally bounded". (More generally, every finite Borel measure on a Suslin space is regular.)
[Hint: The collection of all Borel sets $B$ for which the first equation is valid can be seen to be a $\sigma$-field. It includes all open and closed sets.]
2. The metrics $d(x, y)=|x-y|$ and $e(x, y)=|\arctan x-\arctan y|$ generate the same topology on $\mathbb{R}$. However, $\mathbb{R}$ is complete for $d$, but incomplete for $e$. The completion of $\mathbb{R}$ under $e$ is the extended real line $[-\infty, \infty]$. The real line is totally bounded for $e$, but not for $d$.
3. The Baire $\sigma$-field on a topological space $\mathbb{D}$ (not necessarily metrizable) is the smallest $\sigma$-field for which all continuous (bounded) functions $f: \mathbb{D} \mapsto \mathbb{R}$ are measurable. It is the smallest $\sigma$-field containing all open $F_{\sigma}$-sets and/or closed $G_{\delta}$-sets.
[Hint: Bauer (1981), page 206.]
4. (Canonical representation) Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be an arbitrary collection of maps indexed by $\alpha \in A$ and defined on probability spaces ( $\Omega_{\alpha}, \mathcal{A}_{\alpha}, P_{\alpha}$ ). Let $(\Omega, \mathcal{A}, P)$ be the product of these probability spaces, and define $\tilde{X}_{\alpha}: \Omega \mapsto \mathbb{D}$ by $\tilde{X}_{\alpha}=X_{\alpha} \circ \pi_{\alpha}$, where $\pi_{\alpha}: \Omega \mapsto \Omega_{\alpha}$ is the projection on the $\alpha$-th coordinate. Then $\mathrm{E}^{*} f\left(\tilde{X}_{\alpha}\right)=\mathrm{E}^{*} f\left(X_{\alpha}\right)$ for every bounded $f: \mathbb{D} \mapsto \mathbb{R}$. Consequently, whenever one has to do with maps $X_{\alpha}$ and is interested only in their "laws," it is no loss of generality to assume that the maps are defined on a single probability space.
5. Let $d$ and $e$ be metrics on the same set $\mathbb{D}$ with the following property: if $x_{n} \rightarrow x$ for $e$ and a limit $x \in \mathbb{D}_{0}$, then $x_{n} \rightarrow x$ for $d$; for every sequence $x_{n}$ and a given subset $\mathbb{D}_{0}$ of $\mathbb{D}$. Then $X_{\alpha} \rightsquigarrow X$ for $e$, where $X$ takes its values in $\mathbb{D}_{0}$, implies the same for $d$.
[Hint: Apply the continuous mapping theorem to the identity map from $(\mathbb{D}, e)$ to $(\mathbb{D}, d)$.]
6. A net $X_{\alpha}$ is asymptotically tight if and only if, for every $\varepsilon>0$, there exists a compact set $K$ with $\liminf P_{*}\left(X_{\alpha} \in G\right) \geq 1-\varepsilon$ for every open $G \supset K$.
[Hint: For every open $G \supset K$ where $K$ is compact, there is a $\delta>0$ with $G \supset K^{\delta} \supset K$. If there were not such a $\delta$, then there would be a sequence $x_{n}$ with $d\left(x_{n}, K\right) \rightarrow 0$ and $x_{n} \notin G$ for every $n$. By compactness of $K$, a subsequence would converge; the limit would be both in $K$ and not in $G$.]
7. Let $X_{\alpha}$ be maps in $\mathbb{D}$ and $g: \mathbb{D} \mapsto \mathbb{E}$ continuous.
(i) If $X_{\alpha}$ is asymptotically tight, then $g\left(X_{\alpha}\right)$ is asymptotically tight.
(ii) If $X_{\alpha}$ is asymptotically measurable, then $g\left(X_{\alpha}\right)$ is asymptotically measurable.
Is full continuity of $g$ necessary?
[Hint: The function $x \mapsto e(g(x), g(K))$ is continuous and identically zero on $K$. For a compact $K$, there exists for every $\varepsilon>0$ a $\delta>0$ with $e(g(x), g(K))< \varepsilon$ whenever $d(x, K)<\delta$.]
8. If $X_{\alpha} \leadsto X$ and $X$ is separable, then $X_{\alpha}$ is asymptotically pre-tight: for every $\varepsilon>0$, there exists a totally bounded measurable set $K$ with $\liminf P_{*}\left(X_{\alpha} \in K^{\delta}\right) \geq 1-\varepsilon$ for every $\delta>0$. Asymptotic pre-tightness cannot replace asymptotic tightness in Prohorov's theorem: a net that is measurable and asymptotically pre-tight is not necessarily relatively compact.
[Hint: For a counterexample, let $X_{n}$ be maps in the rationals $\mathbb{D}=\mathbb{Q}$ with $P\left(X_{n}=i / n\right)=1 /(n+1)$, for $i=0,1, \ldots, n$.]
9. (Asymptotic and uniform tightness of a sequence) According to the "classical" definition, a sequence of Borel measurable maps $X_{n}$ is uniformly tight if, for every $\varepsilon>0$, there exists a compact $K$ with $\mathrm{P}\left(X_{n} \in K\right) \geq 1-\varepsilon$ for every $n$. A sequence $X_{n}$ is uniformly tight if and only if it is asymptotically tight and each element $X_{n}$ is tight. In particular, for Borel measurable sequences in a Polish space, uniform tightness and asymptotic tightness are the same.
[Hint: Fix $\varepsilon>0$. Take a compact $K_{0}$ with $\liminf \mathrm{P}\left(X_{n} \in K_{0}^{\delta}\right) \geq 1-\varepsilon$ for every $\delta>0$. Choose $n_{1}<n_{2}<\cdots$ such that $\mathrm{P}\left(X_{n} \in K_{0}^{1 / m}\right) \geq 1-2 \varepsilon$
for $n \geq n_{m}$. For $n_{m}<n \leq n_{m+1}$, choose a compact $K_{n}$ with $\mathrm{P}\left(X_{n} \in\right. \left.K_{0}^{1 / m}-K_{n}\right)<\varepsilon$. Now $K=\cup_{n=0}^{\infty} K_{n}$ is compact and $\mathrm{P}\left(X_{n} \in K\right) \geq 1-3 \varepsilon$ for every $n$.]
10. A relatively compact sequence of Borel measures on a metric space is not necessarily asymptotically tight.
[Hint: For every rational $q$, let $L_{q}$ be the measure on $\ell^{\infty}(\mathbb{Q})$ with $L_{q}\{0\}=L_{q}\left\{z_{q}\right\}=1 / 2$, where 0 is the function that is identically zero and $z_{q}$ is the function that is zero except at the point $q$, where it is 1. (So $L_{q}$ is a two-point measure.) Take a sequence $\left\{q_{n}: n=1,2, \ldots\right\}$ of rational numbers that reaches every rational number infinitely often, e.g. $0,1,-1,0,1 / 2,-1 / 2,1,-1,3 / 2,-3 / 2,2,-2,0,1 / 3, \ldots$. Then the sequence $L_{q_{n}}$ has all measures $L_{q}$ as weak limit points, and it is relatively compact. If the sequence were asymptotically tight, then it would be uniformly tight (in the old sense), because every $L_{q}$ is tight. But there is no compact $K$ with $L_{q}(K)>3 / 4$ for every $q$. Indeed, $K$ would have to contain both 0 and $z_{q}$ for every $q$, which is impossible, since $\left\|z_{q}-z_{r}\right\|=1$ for every pair of distinct rationals $q, r$.]
11. Define $X_{n}$ as $Z_{n}(2 \log (n+1))^{-1 / 2}$ for i.i.d. standard normal variables $Z_{n}$. Then $\left(X_{1}, X_{2}, \ldots\right)$ takes its values with probability 1 in $\ell_{\infty}$, but it does not induce a tight Borel law on this space.
[Hint: By Anderson's lemma, every tight, Borel measurable centered Gaussian variable $X$ satisfies $\mathrm{P}(\|X-x\| \leq \varepsilon) \leq \mathrm{P}(\|X\| \leq \varepsilon)$ for every $x$. Conclude from this that $\mathrm{P}(\|X\| \leq \varepsilon)$ is positive for every $\varepsilon>0$. For the given process, this probability is zero for $\varepsilon<1$. (Instead of Anderson's lemma, one may use the inequality $\mathrm{P}(\|X-x\| \leq \varepsilon)^{2} \leq \mathrm{P}(\|X\| \leq \varepsilon \sqrt{2})$, which can be established easily by rewriting the left side as $\mathrm{P}(\|X-x\| \leq \varepsilon,\|Y-x\| \leq \varepsilon)$ for an independent copy $Y$ of $X$.)]

## 1.4

## Product Spaces

Let $\mathbb{D}$ and $\mathbb{E}$ be metric spaces with metrics $d$ and $e$. Then the Cartesian product $\mathbb{D} \times \mathbb{E}$ is a metric space for any of the metrics

$$
\begin{aligned}
& c\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)=d\left(x_{1}, x_{2}\right) \vee e\left(y_{1}, y_{2}\right) \\
& c\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)=\sqrt{d\left(x_{1}, x_{2}\right)^{2}+e\left(y_{1}, y_{2}\right)^{2}} \\
& c\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)=d\left(x_{1}, x_{2}\right)+e\left(y_{1}, y_{2}\right)
\end{aligned}
$$

These generate the same topology, the product topology.
On the product space $\mathbb{D} \times \mathbb{E}$, there are two natural $\sigma$-fields: the product of the Borel $\sigma$-fields and the Borel $\sigma$-field for the product topology. In general, these are not the same. The reason is that a product topology is built up from arbitrary unions of (open) cylinders $G_{1} \times G_{2}$, whereas the product $\sigma$-field is generated through countable set-theoretic operations on these sets. A separable metric space has a countable base for its topology. Not surprisingly, for separable spaces the two $\sigma$-fields are the same.
1.4.1 Lemma. If $\mathbb{D}$ and $\mathbb{E}$ are separable, then the product of the Borel $\sigma$-fields equals the Borel $\sigma$-field for the product topology on $\mathbb{D} \times \mathbb{E}$.
1.4.2 Lemma. A separable Borel probability measure $L$ on $\mathbb{D} \times \mathbb{E}$ is uniquely determined by the numbers $\int f(x) g(y) d L(x, y)$, where $f$ and $g$ range over the nonnegative Lipschitz functions in $C_{b}(\mathbb{D})$ and $C_{b}(\mathbb{E})$, respectively.

Proofs. Since $\mathbb{D}$ and $\mathbb{E}$ are separable (and metric), it is possible to find countable bases $\mathcal{G}_{1}$ and $\mathcal{G}_{2}$ for the open sets of their topologies. A set in
$\mathbb{D} \times \mathbb{E}$ is open if and only if it is the union of sets of the from $G_{1} \times G_{2}$ with $G_{1} \in \mathcal{G}_{1}$ and $G_{2} \in \mathcal{G}_{2}$. Since there are only countably many sets of the latter type, a set is open in the product topology if and only if it is a countable union of sets of the form $G_{1} \times G_{2}$, where $G_{1}$ and $G_{2}$ are open. Thus the Borel $\sigma$-field is generated by the sets $G_{1} \times G_{2}$, where $G_{1}$ and $G_{2}$ are open. But so is the product of the Borel $\sigma$-fields.

For the proof of the second lemma, conclude first that the given integrals determine the probabilities $L\left(G_{1} \times G_{2}\right)$ for every pair of open $G_{1}$ and $G_{2}$, because the indicator of $G_{1} \times G_{2}$ is the monotone limit from below of a sequence of functions of the form $f_{m}(x) g_{m}(y)$, with $f_{m}$ and $g_{m}$ Lipschitz continuous and $0 \leq f_{m} \leq 1_{G_{1}}$ and $0 \leq g_{m} \leq 1_{G_{2}}$. The open product sets generate the trace of the Borel $\sigma$-field on any separable subset of $\mathbb{D} \times \mathbb{E}$ by the first lemma. They also form an intersection stable collection of sets. So the trace of $L$ on any separable subset is uniquely determined (by a monotone class theorem).

Given $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ and $Y_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{E}$, one can form the joint variable $\left(X_{\alpha}, Y_{\alpha}\right): \Omega_{\alpha} \mapsto \mathbb{D} \times \mathbb{E}$. If both components are Borel measurable, then ( $X_{\alpha}, Y_{\alpha}$ ) is measurable in the product of the Borel $\sigma$-fields, but not necessarily in the Borel $\sigma$-field of the product. This is an inconvenience, since we would want to use the second one in the weak convergence theory in the product space. The problem disappears if the metric spaces are separable. Furthermore, in the general case, asymptotic measurability is retained under tightness.
1.4.3 Lemma. Nets $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ and $Y_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{E}$ are asymptotically tight if and only if the same is true for $\left(X_{\alpha}, Y_{\alpha}\right): \Omega_{\alpha} \mapsto \mathbb{D} \times \mathbb{E}$.
1.4.4 Lemma. Asymptotically tight nets $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ and $Y_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{E}$ are asymptotically measurable if and only if the same is true for $\left(X_{\alpha}, Y_{\alpha}\right): \Omega_{\alpha} \mapsto \mathbb{D} \times \mathbb{E}$.

Proofs. A set of the form $K_{1} \times K_{2}$ is compact if and only if $K_{1}$ and $K_{2}$ are compact. Second, if $K \subset \mathbb{D} \times \mathbb{E}$ is compact, then it is contained in $\pi_{1} K \times \pi_{2} K$, where $\pi_{i} K$ are the projections on the first and second coordinates and are compact. Third, for the first of the three mentioned product metrics, it holds that $\left(K_{1} \times K_{2}\right)^{\delta}=K_{1}^{\delta} \times K_{2}^{\delta}$. It is now easy to see that asymptotic tightness of both marginals is equivalent to asymptotic tightness of the joint maps.

Asymptotic measurability of the joint maps trivially implies asymptotic measurability of the marginals (Problem 1.3.7).

Finally, assume ( $X_{\alpha}, Y_{\alpha}$ ) is asymptotically tight and $X_{\alpha}$ and $Y_{\alpha}$ are asymptotically measurable. Let $f \in C_{b}(\mathbb{D})$ and $g \in C_{b}(\mathbb{E})$ take values in
the interval $[-1,1]$. Then

$$
\begin{aligned}
& \left(f\left(X_{\alpha}\right) g\left(X_{\alpha}\right)\right)^{*}-\left(f\left(X_{\alpha}\right) g\left(X_{\alpha}\right)\right)_{*} \\
& \quad \leq\left(1+f\left(X_{\alpha}\right)\right)^{*}\left(1+g\left(X_{\alpha}\right)\right)^{*}-\left(1+f\left(X_{\alpha}\right)\right)_{*}-\left(1+g\left(X_{\alpha}\right)\right)_{*}+1 \\
& \quad-\left(1+f\left(X_{\alpha}\right)\right)_{*}\left(1+g\left(X_{\alpha}\right)\right)_{*}+\left(1+f\left(X_{\alpha}\right)\right)^{*}+\left(1+g\left(X_{\alpha}\right)\right)^{*}-1
\end{aligned}
$$

This converges to zero in probability, because each of the four terms in the bottom line asymptotically cancels the corresponding term in the second line of the display. By similar reasoning it follows that $h\left(X_{\alpha}, Y_{\alpha}\right)$ is asymptotically measurable for every $h$ of the form $h(x, y)=\sum_{i=1}^{m} f_{i}(x) g_{i}(y)$ with $f_{i} \in C_{b}(\mathbb{D})$ and $g_{i} \in C_{b}(\mathbb{E})$. This set of functions $h$ forms an algebra and separates points of $\mathbb{D} \times \mathbb{E}$. Thus ( $X_{\alpha}, Y_{\alpha}$ ) is asymptotically measurable by Lemma 1.3.13.

A useful corollary is that for weak convergence of vectors $\left(X_{\alpha}, Y_{\alpha}\right)$, it suffices to consider expressions of the type $\mathrm{E}^{*} f\left(X_{\alpha}\right) g\left(Y_{\alpha}\right)$.
1.4.5 Corollary. Let $\left(X_{\alpha}, Y_{\alpha}\right): \Omega_{\alpha} \mapsto \mathbb{D} \times \mathbb{E}$ be an arbitrary net with $\mathrm{E}^{*} f\left(X_{\alpha}\right) g\left(Y_{\alpha}\right) \rightarrow \int f(x) g(y) d L(x, y)$ for all bounded, nonnegative Lipschitz functions $f: \mathbb{D} \mapsto \mathbb{R}$ and $g: \mathbb{E} \mapsto \mathbb{R}$ and a separable Borel measure $L$ on $\mathbb{D} \times \mathbb{E}$. Then $\left(X_{\alpha}, Y_{\alpha}\right) \rightsquigarrow L$.

Proof. Since $g$ and $f$ can be taken equal to 1 , it follows that the nets $X_{\alpha}$ and $Y_{\alpha}$ converge marginally in distribution. Thus the nets $X_{\alpha}$ and $Y_{\alpha}$ are asymptotically tight and asymptotically measurable in the completions of $\mathbb{D}$ and $\mathbb{E}$, respectively. The joint maps $\left(X_{\alpha}, Y_{\alpha}\right)$ are asymptotically tight in $\mathbb{D} \times \mathbb{E}$. By Prohorov's theorem, every subnet has a further weakly converging subnet. Every weak limit point gives the same expectation to the function $(x, y) \mapsto f(x) g(y)$ as $L$. Thus $L$ is the only limit point.

It is not hard to find an example of weakly convergent nets $X_{\alpha}$ and $Y_{\alpha}$ with tight limits for which the joint maps $\left(X_{\alpha}, Y_{\alpha}\right)$ do not converge weakly. However, the previous result and Prohorov's theorem show that ( $X_{\alpha}, Y_{\alpha}$ ) is at least relatively compact. Under special conditions there is only one limit point and the joint maps do converge weakly. The next two examples consider the case of independent coordinates and the case that one coordinate is asymptotically degenerate.
1.4.6 Example. Call $X_{\alpha}$ and $Y_{\alpha}$ asymptotically independent if

$$
\mathrm{E}^{*} f\left(X_{\alpha}\right) g\left(Y_{\alpha}\right)-\mathrm{E}^{*} f\left(X_{\alpha}\right) \mathrm{E}^{*} g\left(Y_{\alpha}\right) \rightarrow 0
$$

for all bounded, nonnegative, Lipschitz functions $f$ and $g$ on $\mathbb{D}$ and $\mathbb{E}$, respectively. If $X_{\alpha}$ and $Y_{\alpha}$ are asymptotically independent and $X_{\alpha} \rightsquigarrow L_{1}$ and $Y_{\alpha} \rightsquigarrow L_{2}$ for separable $L_{i}$, then $\left(X_{\alpha}, Y_{\alpha}\right) \rightsquigarrow L_{1} \otimes L_{2}$.

To see this, assume without loss of generality that $\mathbb{D}$ and $\mathbb{E}$ are complete, so that the marginals of $\left(X_{\alpha}, Y_{\alpha}\right)$ are asymptotically tight. By Prohorov's theorem the net of joint variables ( $X_{\alpha}, Y_{\alpha}$ ) is relatively compact. Every limit point $L$ must have $\int f(x) g(y) d L(x, y)=\int f d L_{1} \int g d L_{2}$. These numbers uniquely identify the (one) limit point.
1.4.7 Example (Slutsky's lemma). If $X_{\alpha} \rightsquigarrow X$ and $Y_{\alpha} \rightsquigarrow c$ with $X$ separable and $c$ a constant, then $\left(X_{\alpha}, Y_{\alpha}\right) \rightsquigarrow(X, c)$.

Again assume without loss of generality that $X$ is tight. Then the net ( $X_{\alpha}, Y_{\alpha}$ ) is asymptotically tight and asymptotically measurable. The limit points have marginals $X$ and $c$ and so are uniquely determined as ( $X, c$ ). (Now that the result has been obtained, it is easy to see that this is actually a special case of the previous example: since $X$ and $c$ are independent, $X_{\alpha}$ and $Y_{\alpha}$ are asymptotically independent.)

If $X_{\alpha}$ and $Y_{\alpha}$ take their values in a fixed topological vector space, the previous result can be combined with the continuous mapping theorem to obtain Slutsky's theorem: if $X_{\alpha} \rightsquigarrow X$ and $Y_{\alpha} \rightsquigarrow c$ with $X$ separable and $c$ a constant, then $X_{\alpha}+Y_{\alpha} \rightsquigarrow X+c$. Similarly, under the same conditions, $X_{\alpha} Y_{\alpha} \rightsquigarrow c X$ in the case $Y_{\alpha}$ are scalars; and provided $c>0, X_{\alpha} / Y_{\alpha} \rightsquigarrow X / c$ also.

The results of this section easily extend to products of finitely many metric spaces. They can also be extended to countable products, with slightly more effort. If $\mathbb{D}_{i}$ is a metric space with metric $d_{i}$ for every natural number $i$, then the Cartesian product $\mathbb{D}_{1} \times \mathbb{D}_{2} \times \cdots$ can be metrized by the metrics

$$
\begin{aligned}
& d\left(\left(x_{1}, x_{2}, \ldots\right),\left(z_{1}, z_{2}, \ldots\right)\right)=\sup _{i} \frac{1}{i}\left(d_{i}\left(x_{i}, z_{i}\right) \wedge 1\right), \\
& d\left(\left(x_{1}, x_{2}, \ldots\right),\left(z_{1}, z_{2}, \ldots\right)\right)=\sum_{i} 2^{-i}\left(d_{i}\left(x_{i}, z_{i}\right) \wedge 1\right) .
\end{aligned}
$$

These generate the same topology; the product topology. The results of this section hold for $\mathbb{D}_{1} \times \mathbb{D}_{2} \times \cdots$. In particular, coordinatewise asymptotic tightness is the same as joint asymptotic tightness, and given asymptotic tightness, coordinatewise asymptotic measurability is the same as joint asymptotic measurability.

For weak convergence, a countable product yields hardly anything new over finite products. A map $X: \Omega \mapsto \mathbb{D}_{1} \times \mathbb{D}_{2} \times \cdots$ is separable if and only if every of its coordinates is, and weak convergence to a separable limit is equivalent to weak convergence of every finite set of coordinates. Write $X_{i}$ for the $i$ th coordinate of $X$ : $X(\omega)=\left(X_{1}(\omega), X_{2}(\omega), \ldots\right)$.
1.4.8 Theorem. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}_{1} \times \mathbb{D}_{2} \times \cdots$ be an arbitrary net and $X$ separable. Then $X_{\alpha} \rightsquigarrow X$ if and only if $\left(X_{\alpha, 1}, \ldots, X_{\alpha, m}\right) \rightsquigarrow\left(X_{1}, \ldots, X_{m}\right)$, for every $m \in \mathbb{N}$.

Proof. If $X_{\alpha} \rightsquigarrow X$, then all marginals converge by the continuous mapping theorem. For the converse, assume without loss of generality that every $\mathbb{D}_{i}$ is complete. If $X_{\alpha, i} \rightsquigarrow X_{i}$ with $X_{i}$ separable, then $X_{\alpha, i}$ is asymptotically tight and asymptotically measurable. By a straightforward argument, conclude that the vector $X_{\alpha}$ is asymptotically tight in the product space. Moreover, by a similar argument as for Lemma 1.4.3, obtain that $h\left(X_{\alpha}\right)$ is asymptotically measurable for every $h$ in the linear span of the functions of the form $f_{1}\left(x_{1}\right) f_{2}\left(x_{2}\right) \cdots f_{m}\left(x_{m}\right)$, where $f_{i}$ ranges over $C_{b}\left(\mathbb{D}_{i}\right)$ and $m \in \mathbb{N}$. This set of $h$ forms a subalgebra of $C_{b}\left(\mathbb{D}_{1} \times \mathbb{D}_{2} \times \cdots\right)$ and separates points of the product. By Lemma 1.3.13, the net $X_{\alpha}$ is asymptotically measurable. Apply Prohorov's theorem to see that it is relatively compact. Every limit point $L$ has the same finite-dimensional marginal distributions as $X$, so that the numbers $\int f_{1}\left(x_{1}\right) \cdots f_{m}\left(x_{m}\right) d L\left(x_{1}, x_{2}, \ldots\right)$ are uniquely determined. These determine $L$ completely.

## 1.5

## Spaces of Bounded Functions

Let $T$ be an arbitrary set. The space $\ell^{\infty}(T)$ is defined as the set of all uniformly bounded, real functions on $T$ : all functions $z: T \mapsto \mathbb{R}$ such that

$$
\|z\|_{T}:=\sup _{t \in T}|z(t)|<\infty
$$

It is a metric space with respect to the uniform distance $d\left(z_{1}, z_{2}\right)=\| z_{1}- z_{2} \|_{T}$.

The space $\ell^{\infty}(T)$, or a suitable subspace of it, is a natural space for stochastic processes with bounded sample paths. A stochastic process is simply an indexed collection $\{X(t): t \in T\}$ of random variables defined on the same probability space: every $X(t): \Omega \mapsto \mathbb{R}$ is a measurable map. If every sample path $t \mapsto X(t, \omega)$ is bounded, then a stochastic process yields a map $X: \Omega \mapsto \ell^{\infty}(T)$. Sometimes the sample paths have additional properties, such as measurability or continuity, and it may be fruitful to consider $X$ as a map into a subspace of $\ell^{\infty}(T)$. If in either case the uniform metric is used, this does not make a difference for weak convergence of a net; but for measurability it can. Here is one example of this situation; more examples are discussed in the next section.
1.5.1 Example (Continuous functions). Let $T$ be a compact semimetric space; for instance, a compact interval in the real line, or the extended real line $[-\infty, \infty]$ with the metric $\rho(s, t)=|\arctan s-\arctan t|$. The set $C(T)$ of all continuous functions $z: T \mapsto \mathbb{R}$ is a separable, complete subspace of $\ell^{\infty}(T)$. The Borel $\sigma$-field of $C(T)$ equals the $\sigma$-field generated by the coordinate projections $z \mapsto z(t)$, the projection $\sigma$-field (Problem 1.7.1).

Thus a map $X: \Omega \mapsto C(T)$ is Borel measurable if and only if it is a stochastic process.

In most cases a map $X: \Omega \mapsto \ell^{\infty}(T)$ is a stochastic process. The small amount of measurability this gives may already be enough for asymptotic measurability. The special role played by the marginals $\left(X\left(t_{1}\right), \ldots, X\left(t_{k}\right)\right)$, which are considered as maps into $\mathbb{R}^{k}$, is underlined by the following three results. Weak convergence in $\ell^{\infty}(T)$ can be characterized as asymptotic tightness plus convergence of marginals.
1.5.2 Lemma. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(T)$ be asymptotically tight. Then it is asymptotically measurable if and only if $X_{\alpha}(t)$ is asymptotically measurable for every $t \in T$.
1.5.3 Lemma. Let $X$ and $Y$ be tight Borel measurable maps into $\ell^{\infty}(T)$. Then $X$ and $Y$ are equal in Borel law if and only if all corresponding marginals of $X$ and $Y$ are equal in law.
1.5.4 Theorem. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(T)$ be arbitrary. Then $X_{\alpha}$ converges weakly to a tight limit if and only if $X_{\alpha}$ is asymptotically tight and the marginals $\left(X_{\alpha}\left(t_{1}\right), \ldots, X_{\alpha}\left(t_{k}\right)\right)$ converge weakly to a limit for every finite subset $t_{1}, \ldots, t_{k}$ of $T$. If $X_{\alpha}$ is asymptotically tight and its marginals converge weakly to the marginals $\left(X\left(t_{1}\right), \ldots, X\left(t_{k}\right)\right)$ of a stochastic process $X$, then there is a version of $X$ with uniformly bounded sample paths and $X_{\alpha} \rightsquigarrow X$.

Proofs. For the proof of both lemmas, consider the collection $\mathcal{F}$ of all functions $f: \ell^{\infty}(T) \mapsto \mathbb{R}$ of the form

$$
f(z)=g\left(z\left(t_{1}\right), \ldots, z\left(t_{k}\right)\right), \quad g \in C_{b}\left(\mathbb{R}^{k}\right), t_{1}, \ldots, t_{k} \in T, k \in \mathbb{N} .
$$

This forms an algebra and a vector lattice, contains the constant functions, and separates points of $\ell^{\infty}(T)$. Therefore, the lemmas are corollaries of Lemmas 1.3.13 and 1.3.12, respectively.

If $X_{\alpha}$ is asymptotically tight and the marginals converge, then $X_{\alpha}$ is asymptotically measurable by the first lemma. By Prohorov's theorem, $X_{\alpha}$ is relatively compact. To prove weak convergence, it suffices to show that all limit points are the same. This follows from marginal convergence and the second lemma.

Marginal convergence can be established by any of the well-known methods for proving weak convergence on Euclidean space. Tightness can be given a more concrete form, either through finite approximation or (essentially) with the help of the Arzelà-Ascoli theorem. Finite approximation leads to the simpler of the two characterizations, but the second approach
is perhaps of more interest, because it connects tightness to (asymptotic, uniform, equi-) continuity of the sample paths $t \mapsto X_{\alpha}(t)$.

The idea of finite approximation is that for any $\varepsilon>0$ the index set $T$ can be partitioned into finitely many subsets $T_{i}$ such that (asymptotically) the variation of the sample paths $t \mapsto X_{\alpha}(t)$ is less than $\varepsilon$ on every one of the sets $T_{i}$. More precisely, it is assumed that for every $\varepsilon, \eta>0$, there exists a partition $T=\cup_{i=1}^{k} T_{i}$ such that

$$
\begin{equation*}
\limsup _{\alpha} \mathrm{P}^{*}\left(\sup _{i} \sup _{s, t \in T_{i}}\left|X_{\alpha}(s)-X_{\alpha}(t)\right|>\varepsilon\right)<\eta . \tag{1.5.5}
\end{equation*}
$$

Clearly, under this condition the asymptotic behavior of the process can be described within error margin $\varepsilon, \eta$ by the behavior of the marginal $\left(X_{\alpha}\left(t_{1}\right), \ldots, X_{\alpha}\left(t_{k}\right)\right)$ for arbitrary fixed points $t_{i} \in T_{i}$. If the process can thus be reduced to a finite set of coordinates for any $\varepsilon, \eta>0$ and the nets of marginal distributions are tight, then the net $X_{\alpha}$ is asymptotically tight.
1.5.6 Theorem. A net $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(T)$ is asymptotically tight if and only if $X_{\alpha}(t)$ is asymptotically tight in $\mathbb{R}$ for every $t$ and, for all $\varepsilon, \eta>0$, there exists a finite partition $T=\cup_{i=1}^{k} T_{i}$ such that (1.5.5) holds.

Proof. The necessity of the conditions follows easily from the next theorem. For instance, take the partition equal to (disjointified) balls of radius $\delta$ for a semimetric on $T$ as in the next theorem. We prove sufficiency.

For any partition, as in the condition of the theorem, the norm $\left\|X_{\alpha}\right\|_{T}$ is bounded by $\max _{i}\left|X_{\alpha}\left(t_{i}\right)\right|+\varepsilon$, with inner probability at least $1-\eta$, if $t_{i} \in T_{i}$ for each $i$. Since a maximum of finitely many tight nets of real variables is tight, it follows that the net $\left\|X_{\alpha}\right\|_{T}$ is asymptotically tight in $\mathbb{R}$.

Fix $\zeta>0$ and a sequence $\varepsilon_{m} \downarrow 0$. Take a constant $M$ such that $\limsup \mathrm{P}^{*}\left(\left\|X_{\alpha}\right\|_{T}>M\right)<\zeta$, and for each $\varepsilon=\varepsilon_{m}$ and $\eta=2^{-m} \zeta$, take a partition $T=\cup_{i=1}^{k} T_{i}$ as in (1.5.5). For the moment $m$ is fixed and we do not let it appear in the notation. Let $z_{1}, \ldots, z_{p}$ be the set of all functions in $\ell^{\infty}(T)$ that are constant on each $T_{i}$ and take on only the values $0, \pm \varepsilon_{m}, \ldots, \pm\left\lfloor M / \varepsilon_{m}\right\rfloor \varepsilon_{m}$. (It is easy to express $p$ in terms of the other constants, but it is only relevant that it is finite.) Let $K_{m}$ be the union of the $p$ closed balls of radius $\varepsilon_{m}$ around the $z_{i}$. Then, by construction, the two conditions

$$
\left\|X_{\alpha}\right\|_{T} \leq M \quad \text { and } \quad \sup _{i} \sup _{s, t \in T_{i}}\left|X_{\alpha}(s)-X_{\alpha}(t)\right| \leq \varepsilon_{m}
$$

imply that $X_{\alpha} \in K_{m}$. This is true for each fixed $m$.
Let $K=\cap_{m=1}^{\infty} K_{m}$. Then $K$ is closed and totally bounded (by construction of the $K_{m}$ and because $\varepsilon_{m} \downarrow 0$ ) and hence compact. Furthermore, for every $\delta>0$, there is an $m$ with $K^{\delta} \supset \cap_{i=1}^{m} K_{i}$. If not, then there would be a sequence $z_{m}$ not in $K^{\delta}$, but with $z_{m} \in \cap_{i=1}^{m} K_{i}$ for every $m$. This
would have a subsequence contained in one of the balls making up $K_{1}$, a further subsequence eventually contained in one of the balls making up $K_{2}$, and so on. The "diagonal" sequence, formed by taking the first of the first subsequence, the second of the second subsequence and so on, would eventually be contained in a ball of radius $\varepsilon_{m}$ for every $m$; hence Cauchy. Its limit would be in $K$, contradicting the fact that $d\left(z_{m}, K\right) \geq \delta$ for every $m$.

Conclude that if $X_{\alpha}$ is not in $K^{\delta}$, then it is not in $\cap_{i=1}^{m} K_{i}$ for some fixed $m$. Then

$$
\lim \sup \mathrm{P}^{*}\left(X_{\alpha} \notin K^{\delta}\right) \leq \lim \sup \mathrm{P}^{*}\left(X_{\alpha} \notin \bigcap_{i=1}^{m} K_{i}\right) \leq \zeta+\sum_{i=1}^{m} \zeta 2^{-m}<2 \zeta
$$

This concludes the proof of the theorem.
The second type of characterization of asymptotic tightness is deeper and relates the concept to asymptotic continuity of the sample paths. Suppose $\rho$ is a semimetric on $T$. A net $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(T)$ is asymptotically uniformly $\rho$-equicontinuous in probability if for every $\varepsilon, \eta>0$ there exists a $\delta>0$ such that

$$
\limsup _{\alpha} \mathrm{P}^{*}\left(\sup _{\rho(s, t)<\delta}\left|X_{\alpha}(s)-X_{\alpha}(t)\right|>\varepsilon\right)<\eta
$$

1.5.7 Theorem. A net $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(T)$ is asymptotically tight if and only if $X_{\alpha}(t)$ is asymptotically tight in $\mathbb{R}$ for every $t$ and there exists a semimetric $\rho$ on $T$ such that ( $T, \rho$ ) is totally bounded and $X_{\alpha}$ is asymptotically uniformly $\rho$-equicontinuous in probability.
1.5.8 Addendum. If, moreover, $X_{\alpha} \leadsto X$, then almost all paths $t \mapsto X(t, \omega)$ are uniformly $\rho$-continuous; and the semimetric $\rho$ can without loss of generality be taken equal to any semimetric $\rho$ for which this is true and $(T, \rho)$ is totally bounded.

Proof. ⇐. The sufficiency follows from the previous theorem. First take $\delta>0$ sufficiently small so that the last displayed inequality is valid. Since $T$ is totally bounded, it can be covered with finitely many balls of radius $\delta$. Construct a partition of $T$ by disjointifying these balls.
$\Rightarrow$. If $X_{\alpha}$ is asymptotically tight, then $g\left(X_{\alpha}\right)$ is asymptotically tight for every continuous map $g$; in particular, for each coordinate projection.

Let $K_{1} \subset K_{2} \subset \cdots$ be compacts with $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in K_{m}^{\varepsilon}\right) \geq 1-1 / m$ for every $\varepsilon>0$. For every fixed $m$, define a semimetric $\rho_{m}$ on $T$ by

$$
\rho_{m}(s, t)=\sup _{z \in K_{m}}|z(s)-z(t)|, \quad s, t \in T
$$

Then ( $T, \rho_{m}$ ) is totally bounded. Indeed, cover $K_{m}$ by finitely many balls of (arbitrarily small) radius $\eta$, centered at $z_{1}, \ldots, z_{k}$. Partition $\mathbb{R}^{k}$ into cubes of
edge $\eta$, and for every cube pick at most one $t \in T$ such that $\left(z_{1}(t), \ldots, z_{k}(t)\right)$ is in the cube. Since $z_{1}, \ldots, z_{k}$ are uniformly bounded, this gives finitely many points $t_{1}, \ldots, t_{p}$. Now the balls $\left\{t: \rho_{m}\left(t, t_{i}\right)<3 \eta\right\}$ cover $T: t$ is in the ball around $t_{i}$ for which $\left(z_{1}(t), \ldots, z_{k}(t)\right)$ and $\left(z_{1}\left(t_{i}\right), \ldots, z_{k}\left(t_{i}\right)\right)$ fall in the same cube. This follows because $\rho_{m}\left(t, t_{i}\right)$ can be bounded by $2 \sup _{z \in K_{m}} \inf _{i}\left\|z-z_{i}\right\|_{T}+\sup _{j}\left|z_{j}\left(t_{i}\right)-z_{j}(t)\right|$.

Next set

$$
\rho(s, t)=\sum_{m=1}^{\infty} 2^{-m}\left(\rho_{m}(s, t) \wedge 1\right)
$$

Fix $\eta>0$. Take a natural number $m$ with $2^{-m}<\eta$. Cover $T$ with finitely many $\rho_{m}$-balls of radius $\eta$. Let $t_{1}, \ldots, t_{p}$ be their centers. Since $\rho_{1} \leq \rho_{2} \leq \cdots$, there is for every $t$ a $t_{i}$ with $\rho\left(t, t_{i}\right) \leq \sum_{k=1}^{m} 2^{-k} \rho_{k}\left(t, t_{i}\right)+2^{-m}<2 \eta$. Thus ( $T, \rho$ ) is totally bounded for $\rho$, too.

It is clear from the definitions that $|z(s)-z(t)| \leq \rho_{m}(s, t)$ for every $z \in K_{m}$ and that $\rho_{m}(s, t) \wedge 1 \leq 2^{m} \rho(s, t)$. Also, if $\left\|z_{0}-z\right\|_{T}<\varepsilon$ for $z \in K_{m}$, then $\left|z_{0}(s)-z_{0}(t)\right|<2 \varepsilon+|z(s)-z(t)|$ for any pair $s$, t. Deduce that

$$
K_{m}^{\varepsilon} \subset\left\{z: \sup _{\rho(s, t)<2^{-m} \varepsilon}|z(s)-z(t)| \leq 3 \varepsilon\right\}
$$

Thus for given $\varepsilon$ and $m$, and for $\delta<2^{-m} \varepsilon$,

$$
\liminf \mathrm{P}_{*}\left(\sup _{\rho(s, t)<\delta}\left|X_{\alpha}(s)-X_{\alpha}(t)\right| \leq 3 \varepsilon\right) \geq 1-\frac{1}{m}
$$

Finally, we prove the addendum. If $X_{\alpha} \rightsquigarrow X$, then with notation as in the second part of the proof, $\mathrm{P}\left(X \in K_{m}\right) \geq 1-1 / m$; hence $X$ concentrates on $\cup_{m=1}^{\infty} K_{m}$. The elements of $K_{m}$ are uniformly $\rho_{m}$-equicontinuous and hence also uniformly $\rho$-continuous. This yields the first statement.

The set of uniformly continuous functions on a totally bounded, semimetric space is complete and separable, so a map $X$ that takes its values in this set is tight. Next if $X_{\alpha} \rightsquigarrow X$ and $X$ is tight, then $X_{\alpha}$ is asymptotically tight and the compacts for asymptotical tightness can be chosen equal to the compacts for tightness of $X$. If $X$ has uniformly continuous paths, then the latter compacts can be chosen within the space of uniformly continuous functions. Since a compact is totally bounded, every one of the compacts is necessarily uniformly equicontinuous. Combination of these facts proves the second statement of the addendum.

Asymptotic uniform $\rho$-equicontinuity is a fairly complicated concept. Nevertheless, it is what must be shown for weak convergence. For particular problems, reasonable methods are available; for instance, methods based on the Markov property or the chaining method. In Part 2 we develop such methods for empirical processes.

At a general level, a few things can be said about which semimetric to use to establish asymptotic equicontinuity of a net $X_{\alpha}$. Note that in
principle the index set $T$ need not have a semimetric on it when it comes to us. Furthermore, if it does, this semimetric may not be the right one to use. The next few results of this section are somewhat technical, but they lead to the important result that for Gaussian limits one can always use a certain variance metric.

A possible limit $X$ of a net $X_{\alpha}$ can be identified from marginal convergence. Next, according to the addendum, we should look for a semimetric $\rho$ that makes $T$ totally bounded and the paths of $X$ uniformly continuous. It can be shown that if any semimetric does this at all, the semimetric

$$
\rho_{0}(s, t)=\mathrm{E} \arctan |X(s)-X(t)|
$$

should do the job (Problem 1.5.2). However, $\rho_{0}$ may not be the most convenient semimetric with which to work. Sometimes there is an obvious semimetric $\rho$ to try. Alternatively, consider the family of semimetrics

$$
\rho_{p}(s, t)=\left(\mathrm{E}|X(s)-X(t)|^{p}\right)^{1 /(p \vee 1)} \quad(0<p<\infty)
$$

None of these will always qualify; in fact, the expectations need not even be finite. Furthermore, these semimetrics are special in that they make the process $t \mapsto X(t)$ continuous in $p$ th mean. It turns out that the latter is exactly what makes them work or not: if there is a semimetric $\rho$ for which $T$ is totally bounded, the paths of $X$ are uniformly $\rho$-continuous, and also the process $t \mapsto X(t)$ is uniformly $\rho$-continuous in $p$ th mean, then and only then can $\rho_{p}$ be used without loss of generality when showing tightness. Here uniform continuity in $p$ th mean with respect to $\rho$ means that $\mathrm{E}\left|X\left(s_{n}\right)-X\left(t_{n}\right)\right|^{p} \rightarrow 0$ whenever $\rho\left(s_{n}, t_{n}\right) \rightarrow 0$.
1.5.9 Lemma. Let $X$ be a tight, Borel measurable map into $\ell^{\infty}(T)$. Then there is a semimetric on $T$ for which almost all paths of $X$ are uniformly continuous and $T$ is totally bounded. Moreover, for any fixed $p>0$, the following statements are equivalent:
(i) for the semimetric $\rho_{p}$, the set $T$ is totally bounded and almost all paths of $X$ are uniformly $\rho_{p}$-continuous;
(ii) for every semimetric $\rho$ for which almost all paths of $X$ are uniformly $\rho$ continuous, the map $t \mapsto X(t)$ is uniformly $\rho$-continuous in pth mean;
(iii) there is a semimetric $\rho$ for which $T$ is totally bounded, the map $t \mapsto X(t)$ is uniformly $\rho$-continuous in pth mean, and almost all paths of $X$ are uniformly $\rho$-continuous.
In particular, if $T$ is compact for a semimetric $\rho$ such that the map $t \mapsto \mathrm{E}|X(t)|^{p}$ and almost all sample paths are $\rho$-continuous, then (i) holds.

Proof. Since $X \rightsquigarrow X$ and is asymptotically tight, the first statement is a special case of the addendum to the previous theorem.
(i) ⇒ (ii). Suppose that for sequences $s_{n}$ and $t_{n}$ in $T, \rho\left(s_{n}, t_{n}\right) \rightarrow$ 0 , but there is an $\varepsilon$ with $\mathrm{E}\left|X\left(s_{n}\right)-X\left(t_{n}\right)\right|^{p} \geq \varepsilon>0$ for every $n$. By
total boundedness of $T$ under $\rho_{p}$, there exist subsequences $s_{n^{\prime}}$ and $t_{n^{\prime}}$ that converge with respect to $\rho_{p}$ to limits $s$ and $t$ in the $\rho_{p}$-completion of $T$. These subsequences are Cauchy, which by definition of $\rho_{p}$ is the same as $X\left(s_{n^{\prime}}\right)$ and $X\left(t_{n^{\prime}}\right)$ being Cauchy in the $L_{p}$-metric. Let $X(s)$ and $X(t)$ be their $L_{p}$-limits. Since almost all sample paths of $X$ are uniformly $\rho_{p}$-continuous, $X\left(s_{n^{\prime}}\right)$ and $X\left(t_{n^{\prime}}\right)$ converge almost surely also; the almost sure limits must equal the $L_{p}$-limits $X(s)$ and $X(t)$. Because almost all sample paths of $X$ are also uniformly continuous with respect to $\rho(!)$ and $\rho\left(s_{n}, t_{n}\right) \rightarrow 0$ by assumption, $X\left(s_{n}\right)-X\left(t_{n}\right) \rightarrow 0$ almost surely. Conclude that $X(s)= X(t)$ almost surely, so that the two constructed subsequences have the same $L_{p}$-limits. It follows that $\mathrm{E}\left|X\left(s_{n^{\prime}}\right)-X\left(t_{n^{\prime}}\right)\right|^{p} \rightarrow 0$, contradicting the assumption.
(ii) ⇒ (iii). By the first statement, there always exists a semimetric for which $T$ is totally bounded and $X$ is almost surely uniformly continuous. If (ii) holds, then $t \mapsto X(t)$ is uniformly continuous in $p$ th mean for this semimetric. Hence we obtain a semimetric as in (iii).
(iii) ⇒ (i). Since the map $t \mapsto X(t)$ is uniformly $\rho$-continuous in $p$ th mean, there exists for every $\varepsilon>0$ a $\delta>0$ with $\rho_{p}(s, t)<\varepsilon$ whenever $\rho(s, t)<\delta$. Thus the total boundedness of $T$ for $\rho$ implies the same for $\rho_{p}$. Now assume for simplicity that all paths of $X$ are uniformly $\rho$-continuous. Every uniformly continuous function defined on a subset of a semimetric space has a unique extension to a continuous function on the closure of its domain. Therefore all sample paths of $X$ can be extended to continuous functions on ( $\bar{T}, \rho$ ), where $\bar{T}$ is the $\rho$-completion of $T$, which is compact.

If a path $t \mapsto X(t, \omega)$ is not uniformly $\rho_{p}$-continuous, then there exist $\varepsilon>0$ and sequences $s_{n}$ and $t_{n}$ with $\rho_{p}\left(s_{n}, t_{n}\right) \rightarrow 0$ and $\mid X\left(s_{n}, \omega\right)- X\left(t_{n}, \omega\right) \mid \geq \varepsilon$ for every $n$. These have subsequences that converge with respect to $\rho$ to limits $s$ and $t$ in $\bar{T}$. Consequently, first $X\left(s_{n^{\prime}}, \omega\right)-X\left(t_{n^{\prime}}, \omega\right) \rightarrow X(s, \omega)-X(t, \omega)$. Second, the subsequences converge to $s$ and $t$ under $\rho_{p}$, too, so $\rho_{p}(s, t)=0$. Conclude that the path $t \mapsto X(t, \omega)$ is uniformly $\rho_{p}$-continuous for every $\omega$ for which there do not exist $s, t \in \bar{T}$ with $\rho_{p}(s, t)=0$, but $X(s, \omega) \neq X(t, \omega)$. Let $N$ be the exceptional set of $\omega$ for which there do exist such $s, t$. Take a countable, $\rho$-dense subset $A$ of $\left\{(s, t) \in \bar{T} \times \bar{T}: \rho_{p}(s, t)=0\right\}$. Since $t \mapsto X(t, \omega)$ is $\rho$-continuous, $N$ is also the set of all $\omega$ such that there exist $(s, t) \in A$ with $X(s, \omega) \neq X(t, \omega)$. From the definition of $\rho_{p}$, it is clear that for every fixed $(s, t) \in A$, it holds that $X(s, \omega)=X(t, \omega)$ for almost every $\omega$. Conclude that $N$ is a nullset. Hence, almost all paths of $X$ are uniformly $\rho_{p}$-continuous.

For the last remark of the lemma, it suffices to note that $X\left(t_{n}\right) \rightarrow X(t)$ almost surely and $\mathrm{E}\left|X\left(t_{n}\right)\right|^{p} \rightarrow \mathrm{E}|X(t)|^{p}$ implies that $X\left(t_{n}\right) \rightarrow X(t)$ in $p$ th mean.
1.5.10 Example. A stochastic process $X$ is called Gaussian if each of its finite-dimensional marginals $\left(X\left(t_{1}\right), \ldots, X\left(t_{k}\right)\right)$ has a multivariate normal distribution on Euclidean space.

Let $X$ be a Gaussian process with "intrinsic" semimetrics $\rho_{p}$, and let $X_{\alpha}$ be a net of random elements with values in $\ell^{\infty}(T)$. Then there exists a version of $X$ which is a tight Borel measurable map into $\ell^{\infty}(T)$, and $X_{\alpha}$ converges weakly to $X$ if and only if for some $p$ (and then for all $p$ ):

- the marginals of $X_{\alpha}$ converge weakly to the corresponding marginals of $X$;
- $X_{\alpha}$ is asymptotically equicontinuous in probability with respect to $\rho_{p}$;
- $T$ is totally bounded for $\rho_{p}$.

The second moment metric $\rho_{2}$ is often the easiest with which to work.
The sufficiency of the three conditions is immediate from the preceding theorems and is not special to Gaussian processes. In fact, for the sufficiency, the semimetric $\rho_{p}$ can be replaced by any other semimetric. The extra information is that for Gaussian processes one can always use any of the intrinsic semimetrics. This necessity is not immediate from the previous results but can be derived as follows. In view of the addendum to Theorem 1.5.7, it is certainly enough to show that
A Gaussian process $X$ in $\ell^{\infty}(T)$ is tight if and only if ( $T, \rho_{p}$ ) is totally bounded and almost all paths $t \mapsto X(t, \omega)$ are uniformly $\rho_{p}$-continuous for some $p$ (and then for all $p$ ).
For any tight $X$, there is a semimetric $\rho$ that makes $T$ totally bounded and almost all paths of $X$ uniformly continuous. The assertion would follow by (iii) of the previous lemma if the map $t \mapsto X(t)$ is uniformly $\rho$-continuous in $p$ th mean for a Gaussian process. This is automatically the case.

If a Gaussian process in $\ell^{\infty}(T)$ has uniformly continuous paths with respect to a semimetric $\rho$ that makes $T$ totally bounded, then the map $t \mapsto X(t)$ is uniformly $\rho$-continuous in pth mean.
Indeed, if $\rho\left(s_{n}, t_{n}\right) \rightarrow 0$, then $X\left(s_{n}\right)-X\left(t_{n}\right) \rightarrow 0$ almost surely, hence weakly. Since all the random variables are normal, this can only happen if the mean and variance of $X\left(s_{n}\right)-X\left(t_{n}\right)$ converge to zero. (Use characteristic functions.) For a normal variable, the $p$ th absolute moment is a continuous function of the first two moments.

## Problems and Complements

1. (Arzelà-Ascoli) Let $(T, \rho)$ be a totally bounded, semimetric space and $K \subset \ell^{\infty}(T)$. Suppose that for some $\varepsilon, \delta>0$ and every $z \in K:|z(s)-z(t)|<\varepsilon$ whenever $\rho(s, t)<\delta$. Moreover, suppose $\{z(t): z \in K\}$ is bounded for every $t$. Then
(i) $K$ is uniformly bounded;
(ii) $K$ can be covered with finitely many balls of radius $2 \varepsilon$ with centres in $\mathrm{UC}(T, \rho)$.
Deduce the Arzelà-Ascoli theorem: a uniformly bounded, uniformly $\rho$ equicontinuous subset of $\ell^{\infty}(T)$ is totally bounded.
[Hint: For (ii) choose a $\delta / 2$-net $t_{1}, \ldots, t_{p}$ on $T$. Let $d$ be the distance between the closest pair of $t_{i}$. Define functions

$$
\begin{aligned}
\beta_{i}(t) & =\left(1-\delta^{-1} \rho\left(t, t_{i}\right)\right)^{+} \\
\alpha_{i}(t) & =1-\left(1-d^{-1} \rho\left(t, t_{i}\right)\right)^{+} \\
w_{i}(t) & =\frac{\beta_{i}(t) \prod_{j \neq i} \alpha_{j}(t)}{\sum_{i} \beta_{i}(t) \prod_{j \neq i} \alpha_{j}(t)}
\end{aligned}
$$

Then each $w_{i}$ is defined and continuous on the $\rho$-completion of $T$, the $w_{i}$ sum up to $1, w_{i}\left(t_{i}\right)=1$, and $w_{i}$ can be nonzero only at $t$ with $\rho\left(t, t_{i}\right)<\delta$ that do not equal one of the other $t_{j}$. (The $\alpha_{i}$ are just there to take care of the latter.) For any $u \in \mathbb{R}^{p}$, define a function $z_{u}(t)=\sum_{i} w_{i}(t) u_{i}$. This is uniformly continuous with $z_{u}\left(t_{i}\right)=u_{i}$ for every $i$. Let $S=\{0, \varepsilon,-\varepsilon, \ldots, k \varepsilon,-k \varepsilon\}$ where $k$ is chosen such that $k \varepsilon$ is larger than a uniform bound on $K$. Then $\left\{z_{u}: u \in\right. \left.S^{p}\right\}$ is a $2 \varepsilon$-net over $K$ : a given $z$ is in the $2 \varepsilon$-ball around $z_{u}$ for which $\left|u_{i}-z\left(t_{i}\right)\right|<\varepsilon$ for every $i$. This is true because, for every fixed $t$, the number $z_{u}(t)$ is a convex combination of values $u_{i}$ with $w_{i}(t) \neq 0$; hence $i$ with $\rho\left(t, t_{i}\right)<\delta$. For every such $i:\left|z(t)-u_{i}\right|<\left|z(t)-z\left(t_{i}\right)\right|+\varepsilon<2 \varepsilon$.]
2. Let $(T, \rho)$ be a totally bounded, semimetric space and $X$ a map into $\ell^{\infty}(T)$ with uniformly $\rho$-continuous paths. Then $T$ is totally bounded for the semimetric

$$
\rho_{0}(s, t)=\mathrm{E} \arctan |X(s)-X(t)| .
$$

Furthermore, almost all paths of $X$ are uniformly continuous with respect to $\rho_{0}$.
3. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(S)$ and $Y_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}(T)$ be asymptotically tight nets such that
$\left(X_{\alpha}\left(s_{1}\right), \ldots, X_{\alpha}\left(s_{k}\right), Y_{\alpha}\left(t_{1}\right), \ldots, Y_{\alpha}\left(t_{l}\right)\right) \leadsto\left(X\left(s_{1}\right), \ldots, X\left(s_{k}\right), Y\left(t_{1}\right), \ldots, Y\left(t_{l}\right)\right)$,
for stochastic processes $X$ and $Y$. Then there exist versions of $X$ and $Y$ with bounded sample paths and $\left(X_{\alpha}, Y_{\alpha}\right) \rightsquigarrow(X, Y)$ in $\ell^{\infty}(S) \times \ell^{\infty}(T)$.
[Hint: The net $\left(X_{\alpha}, Y_{\alpha}\right)$ can be identified with a net in $\ell^{\infty}(S \cup T)$, where $S \cup T$ is the formal union of $S$ and $T$, counting every element of $S$ different from every element of $T$. This identification is an isometry.]

## 1.6

## Spaces of Locally Bounded Functions

Let $T_{1} \subset T_{2} \subset \cdots$ be arbitrary sets and $T=\cup_{i=1}^{\infty} T_{i}$. The space $\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$ is defined as the set of all functions $z: T \mapsto \mathbb{R}$ that are uniformly bounded on every $T_{i}$ (but not necessarily on $T$ ). This is a complete metric space with respect to the metric

$$
d\left(z_{1}, z_{2}\right)=\sum_{i=1}^{\infty}\left(\left\|z_{1}-z_{2}\right\|_{T_{i}} \wedge 1\right) 2^{-i}
$$

A sequence converges in this metric if it converges uniformly on each $T_{i}$. In the case that $T_{i}$ equals the interval $[-i, i] \subset \mathbb{R}^{d}$, the metric $d$ induces the topology of uniform convergence on compacta.

The space $\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$ is of interest in applications, but its weak convergence theory is uneventful. Weak convergence of a net is equivalent to convergence of each of the restrictions to $T_{i}$.
1.6.1 Theorem. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$ be arbitrary maps. Then the net $X_{\alpha}$ converges weakly to a tight limit if and only if every of the nets of restrictions $X_{\alpha \mid T_{i}}: \Omega \mapsto \ell^{\infty}\left(T_{i}\right)$ converges weakly ( $i \in \mathbb{N}$ ) to a tight limit.

Proof. The necessity of the weak convergence of all restrictions follows from the continuous mapping theorem. For the sufficiency part of the theorem, fix $\varepsilon>0$ and take for each $i$ a compact $K_{i} \subset \ell^{\infty}\left(T_{i}\right)$ such that

$$
\limsup \mathrm{P}^{*}\left(X_{\alpha \mid T_{i}} \notin K_{i}^{\delta}\right)<\frac{\varepsilon}{2^{i}}, \quad \text { for every } \delta>0
$$

Define $K$ as the set of all $z: T \mapsto \mathbb{R}$ such that $z_{\mid T_{i}-T_{i-1}}$ is contained in $\left(K_{i}\right)_{\mid T_{i}-T_{i-1}}$ for every $i$. A diagonal argument shows that $K$ is compact in $\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$. Furthermore, if $z_{\mid T_{i}} \in K_{i}^{\delta}$ for every $i$, then $z \in K^{\delta}$. Conclude that

$$
\limsup \mathrm{P}^{*}\left(X_{\alpha} \notin K^{\delta}\right)<\varepsilon, \quad \text { for every } \delta>0 .
$$

It follows that the net $X_{\alpha}$ is asymptotically tight in $\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$.
Let $\mathcal{F}$ be the set of all continuous functions $f: \ell^{\infty}\left(T_{1}, T_{2}, \ldots\right) \mapsto \mathbb{R}$ of the form $f(z)=g\left(z\left(t_{1}\right), \ldots, z\left(t_{k}\right)\right)$ with $g \in C_{b}\left(\mathbb{R}^{k}\right), t_{1}, \ldots, t_{k} \in T$, and $k \in \mathbb{N}$. Then $\mathcal{F}$ is an algebra that separates points and contains the constant functions. Since the net $f\left(X_{\alpha}\right)$ is asymptotically measurable for every $f \in \mathcal{F}$, Lemma 1.3.13 implies that $X_{\alpha}$ is asymptotically measurable in $\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$.

Apply Prohorov's theorem to see that every subnet has a further weakly converging subnet with a tight limit. There is only one limit point, in view of the marginal convergence of the net and Lemma 1.3.12.

Given the preceding theorem, convergence in distribution in the space $\ell^{\infty}\left(T_{1}, T_{2}, \ldots\right)$ can be proved by showing weak convergence of all marginals $\left(X_{\alpha}\left(t_{1}\right), \ldots, X_{\alpha}\left(t_{k}\right)\right)$ plus asymptotic equicontinuity on every $T_{i}$. For a given semimetric $\rho$ on $T$, the latter takes the following form: for all $\varepsilon>0$, $\eta>0$, and $i$, there exists $\delta>0$ such that

$$
\limsup _{\alpha} \mathrm{P}^{*}\left(\sup _{\substack{\rho(s, t)<\delta \\ s, t \in T_{i}}}\left|X_{\alpha}(s)-X_{\alpha}(t)\right|>\varepsilon\right)<\eta
$$

Under this condition, the limit process necessarily has uniformly $\rho$ continuous sample paths on each $T_{i}$. In particular, it has continuous sample paths on $T$. For a Gaussian limit, this is necessarily the case for the standard deviation metric.

## Problems and Complements

1. (Convex processes) Let $X_{\alpha}$ be a net of stochastic processes indexed by a convex, open subset $C$ of $\mathbb{R}^{k}$ such that every sample path $t \mapsto X_{\alpha}(t)$ is convex (on $C$ ). If the net $X_{\alpha}$ converges marginally in distribution to a limit, then it converges in distribution to a tight limit in the space $\ell^{\infty}\left(K_{1}, K_{2}, \ldots\right)$ for any sequence of compact sets $K_{1} \subset K_{2} \subset \cdots \subset C$.
[Hint: For every compact $K \subset C$ there exists an $\varepsilon>0$ such that $K^{\varepsilon} \subset K^{2 \varepsilon} \subset C$. If $x_{\alpha}: C \mapsto \mathbb{R}$ is a net of (deterministic) convex functions such that $x_{\alpha}(t)$ is bounded for every $t \in C$, then the net is automatically uniformly bounded over $K^{\varepsilon}$ (Problem 2.7.5). Conclude that the net $\left\|X_{\alpha}\right\|_{K^{\varepsilon}}$ is asymptotically tight. A bounded, convex function $x$ on $K^{\varepsilon}$ is automatically Lipschitz on $K$ with Lipschitz constant $(2 / \varepsilon)\|x\|_{K^{\varepsilon}}$ (Problem 2.7.4). Conclude that the net $X_{\alpha}$ is asymptotically equicontinuous in $\ell^{\infty}(K)$.]

## 1.7

## The Ball Sigma-Field and Measurability of Suprema

The ball $\sigma$-field on $\mathbb{D}$ is the smallest $\sigma$-field containing all the open (and/or closed) balls in $\mathbb{D}$. In general, this is smaller than the Borel $\sigma$-field, although the two $\sigma$-fields are equal for separable spaces (Problems 1.7.3 and 1.7.4). For some nonseparable spaces, it is even fairly common that maps are ball measurable even though they are not Borel measurable. Thus one may wonder about the possibility of a weak convergence theory for ball measurable maps. It turns out that the set of ball measurable $f \in C_{b}(\mathbb{D})$ is rich enough to make this fruitful, but at the same time it is so rich that the theory is a special case of the theory that we have discussed so far.

However, establishing ball measurability is a good way to take care of the measurability part of weak convergence. Since maps of the form $x \mapsto d(x, s)$ generate the ball $\sigma$-field, a map $X$ in $\mathbb{D}$ is ball measurable if and only if the map $\omega \mapsto d(X(\omega), s)$ is measurable for every $s \in \mathbb{D}$. A more common situation is that the maps $d(X(\omega), s)$ are measurable for a subset of $s$. This may yield enough measurability for weak convergence too.
1.7.1 Lemma. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be asymptotically tight. Then it is asymptotically measurable if and only if $f\left(X_{\alpha}\right)$ is asymptotically measurable for every ball measurable $f \in C_{b}(\mathbb{D})$.
1.7.2 Theorem. Let $X$ be separable and Borel measurable. Then
(i) $X_{\alpha} \rightsquigarrow X$ if and only if $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$ for all ball measurable $f \in C_{b}(\mathbb{D})$;
(ii) $X_{\alpha} \rightsquigarrow X$ if and only if there exists a sequence $s_{i}$ such that $\left(d\left(X_{\alpha}, s_{1}\right), d\left(X_{\alpha}, s_{2}\right), \ldots\right) \leadsto\left(d\left(X, s_{1}\right), d\left(X, s_{2}\right), \ldots\right)$ in $\mathbb{R}^{\infty}$ and with closure satisfying $\mathrm{P}\left(X \in \overline{\left\{s_{1}, s_{2}, \ldots\right\}}\right)=1$.

Proofs. The set of all ball measurable $f \in C_{b}(\mathbb{D})$ forms an algebra and separates points of $\mathbb{D}$. So the lemma is a special case of Lemma 1.3.13.

The "only if" parts of the theorem are trivial. Furthermore, the "if" part of (ii) is stronger than that of (i). It suffices to show that $X_{\alpha} \rightsquigarrow X$ if the condition on the right side in (ii) holds.

Let $\mathcal{F}$ be the collection of functions of the form

$$
f(x)=\left(1-p d\left(x, s_{i}\right)\right)^{+}, \quad p \in \mathbb{Q}^{+}, \quad i \in \mathbb{N} .
$$

Then for any open $G$,

$$
1_{G}(x)=\sup \left\{f(x): 0 \leq f \leq 1_{G}, f \in \mathcal{F}\right\}, \quad \text { for every } x \in \overline{s_{1}, s_{2}, \ldots}
$$

Place the countably many elements of $\mathcal{F}$ with $0 \leq f \leq 1_{G}$ in a sequence, and let $f_{m}$ be the maximum of the first $m$ functions. Then $0 \leq f_{m} \leq 1_{G}$ and $f_{m} \uparrow f$ on a set of probability 1 under $X$. Hence first, for fixed $m$, $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in G\right) \geq \liminf \mathrm{E}_{*} f_{m}\left(X_{\alpha}\right)=\mathrm{E} f_{m}(X)$. Next, letting $m \rightarrow \infty$ completes the proof in view of the portmanteau theorem.
1.7.3 Example (Cadlag functions). The space $D[a, b]$ is the set of all cadlag functions on an interval $[a, b] \subset \overline{\mathbb{R}}$ : functions $z:[a, b] \mapsto \mathbb{R}$ that are continuous from the right and have limits from the left everywhere. The ball $\sigma$-field for the uniform norm equals the $\sigma$-field generated by the coordinate projections (Problem 1.7.2). This means that a map $X: \Omega \mapsto D[a, b]$ is ball measurable if and only if $X(t): \Omega \mapsto \mathbb{R}$ is measurable for every $t \in[a, b]$, a rather weak requirement.
1.7.4 Example (Pointwise separable processes). The same idea applied to a more general situation leads to the following. Let $\mathcal{H}$ be a uniformly bounded class of functions $h: \mathcal{X} \mapsto \mathbb{R}$ defined on some measurable space $(\mathcal{X}, \mathcal{B})$, with the property that there is a countable subcollection $\mathcal{H}_{0} \subset \mathcal{H}$ such that every $h \in \mathcal{H}$ is the pointwise limit of a sequence $h_{m}$ in $\mathcal{H}_{0}$ : $h_{m}(x) \rightarrow h(x)$ for every $x$. Let $D(\mathcal{H})$ be the subspace of $\ell^{\infty}(\mathcal{H})$ of all $z$ with the property

$$
z\left(h_{m}\right) \rightarrow z(h), \quad \text { if } h_{m} \rightarrow h \quad \text { pointwise }
$$

for every sequence $h_{m}$ in $\mathcal{H}_{0}$. Then the ball $\sigma$-field for the uniform norm is contained in the $\sigma$-field generated by the coordinate projections $z \mapsto z(h)$, $h \in \mathcal{H}$. Thus every stochastic process $X: \Omega \mapsto D(\mathcal{H})$ is ball measurable. Remember that $X$ is called a stochastic process if every coordinate $X(h)$ is a measurable map into $\mathbb{R}$.

A finite signed measure $P$ on ( $\mathcal{X}, \mathcal{B}$ ) induces an element $h \mapsto P h= \int h d P$ of $D(\mathcal{H})$. So any stochastic process $X$ for which every $X(\omega)$ has the character of a signed measure can be viewed a ball measurable map into $D(\mathcal{H})$. An example is the empirical measure $\mathbb{P}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{X_{i}}$ of a sample $X_{1}, \ldots, X_{n}$ of random elements in ( $\mathcal{X}, \mathcal{B}$ ); another is the empirical process $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$.

The condition on $\mathcal{H}$ is met, for instance, by the set of all indicator functions of closed or open ellipsoids, rectangles, and half-spaces in a Euclidean space.
1.7.5 Example (Measurable processes with Suslin index set). Let $T$ be a metric space equipped with its Borel $\sigma$-field. A map $X: \Omega \mapsto \mathbb{R}^{T}$ is a measurable stochastic process if $X: \Omega \times T \mapsto \mathbb{R}$ is jointly measurable for the product of $\mathcal{A}$ and the Borel sets of $T$. This is a little stronger than measurability of every coordinate $X(t)$.
If $T$ is a Borel subset of a Polish space and $X: \Omega \mapsto \ell^{\infty}(T)$ is a measurable process, then $d(X, z)=\|X-z\|_{T}$ is measurable for the $P$-completion of $(\Omega, \mathcal{A})$ for every measurable $z$. Consequently, every measurable process $X$ with bounded sample paths is a ball measurable map into $\ell_{m}^{\infty}(T)$, the subspace of all measurable $z \in \ell^{\infty}(T)$, at least if ( $\Omega, \mathcal{A}, P$ ) is complete.

The claim follows from the theorem on measurable projections. The set $\left\{\omega:\|X(\omega)-z\|_{T}>c\right\}$ is the projection on $\Omega$ of the product measurable set $\{(\omega, t):|X(t, \omega)-z(t)|>c\}$. Projections are not always measurable, but under the stated conditions the present one is. ${ }^{\ddagger}$

At closer inspection the argument actually yields more. Suppose $\mathbf{S}$ is a Suslin topological space ${ }^{\mathrm{b}}$ and let $\phi: \mathbf{S} \mapsto T$ be an arbitrary map. Then any $X: \Omega \mapsto \ell^{\infty}(T)$ for which $(s, \omega) \mapsto X(\phi(s), \omega)$ is jointly measurable has a measurable supremum $\sup _{t \in \phi(\mathbf{S})}|X(t)|$.

## Problems and Complements

1. Let $T$ be a compact semimetric space with dense subset $S$. The Borel $\sigma$ field on $C(T)$ is the smallest $\sigma$-field making all projections $z \mapsto z(s), s \in S$, measurable.
[Hint: The closed ball around $z_{0}$ of radius $r$ equals $\cup_{s \in S_{0}}\left\{z:\left|z(s)-z_{0}(s)\right| \leq\right. r\}$, where $S_{0}$ is a countable dense subset of $S$. So every closed and consequently every open ball is projection measurable. For a separable metric space, the ball $\sigma$-field and Borel $\sigma$-field are the same.]

[^9]2. The ball $\sigma$-field on $D[a, b]$ with respect to the uniform metric equals the $\sigma$-field generated by the coordinate projections.
[Hint: The set $\{z: z(t)>c\}$ is the union of the balls of radius $n$ around $z_{n, c}=c+\left(n+n^{-1}\right) 1_{\left[t, t+n^{-1}\right)}$.]
3. Equip $D[0,1]$ with the uniform metric, and define $X:[0,1] \mapsto \mathbb{D}$ by $X(\omega)= 1_{[\omega, 1]}$ (the empirical process based on one observation $\omega$ ). If [ 0,1 ] is equipped with the Borel $\sigma$-field, then $X$ is ball measurable, but not Borel measurable.
[Hint: Let $B_{s}$ be the open ball of radius $1 / 2$ in $\mathbb{D}$ around the function $1_{[s, 1]}$. Since an open ball is open, so is the union $G=\cup_{s \in S} B_{s}$, for any $S \subset[0,1]$. Now $X(\omega) \in B_{s}$ if and only if $\omega=s$. Thus $\{X \in G\}=S$. The conclusion is that $X$ is Borel measurable if and only if every subset of $[0,1]$ is a Borel set.]
4. (Properties of the ball $\sigma$-field)
(i) For a separable, semimetric space, the ball $\sigma$-field equals the Borel $\sigma$ field.
(ii) Every closed, separable set is ball measurable.
(iii) If $K$ is compact, then $K^{\delta}$ is ball measurable.
(iv) Every separable probability measure on the ball $\sigma$-field has a unique extension to the Borel $\sigma$-field.
[Hint: If the sequence $s_{i}$ is dense in a closed $F$, then $F^{\delta}=\cup_{i=1}^{\infty} B\left(s_{i}, \delta\right)$, where $B(s, \delta)$ is the ball of radius $\delta$ around $s$. Since a compact set is closed and separable, (iii) follows. For (ii) note that $F=\cap_{m=1}^{\infty} F^{1 / m}$; (i) is a consequence of (ii). For (iv) let $S$ be a closed, separable set with $L\left(\mathbb{D}_{0}\right)=1$. For every Borel set $B$, the set $B \cap \mathbb{D}_{0}$ is a Borel set contained in $\mathbb{D}_{0}$, hence is contained in the ball $\sigma$-field on $\mathbb{D}_{0}$ by (i), but then also in the ball $\sigma$-field on $\mathbb{D}$. Define the extension by $\tilde{L}(B)=L\left(B \cap \mathbb{D}_{0}\right)$.]
5. (Completely regular points) Pollard (1984) calls a point $x$ in a metric space $\mathbb{D}$ equipped with a $\sigma$-field $\mathcal{A}$ completely regular if, for every open neighborhood $G$ of $x$, there is a measurable, uniformly continuous $f: \mathbb{D} \mapsto \mathbb{R}$ with $0 \leq f \leq 1_{G}$ and $f(x)=1$. If $X$ is an $\mathcal{A}$-measurable map that takes all its values in a separable set of completely regular points, then it is Borel measurable. If, moreover, $X_{\alpha}$ are arbitrary maps with $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$ for every $\mathcal{A}$-measurable, uniformly continuous $f$, then $X_{\alpha} \rightsquigarrow X$. Since every point is completely regular for the ball $\sigma$-field, this extends the results obtained in the section about the ball $\sigma$-field.
[Hint: Pollard (1984), page 88, Exercises [14]--[16].]

## 1.8

## Hilbert Spaces

Let $\mathbb{H}$ be a (real) Hilbert space with inner product $\langle\cdot, \cdot\rangle$ and complete orthonormal system $\left\{e_{j}: j \in J\right\}$. Thus $\left\langle e_{i}, e_{j}\right\rangle$ equals 0 or 1 if $i \neq j$ or $i=j$, respectively, and every $x \in \mathbb{H}$ can be written as

$$
x=\sum_{j}\left\langle x, e_{j}\right\rangle e_{j} .
$$

The sum contains at most countably many nonzero terms, because only countably many inner products $\left\langle x, e_{j}\right\rangle$ are nonzero for every $x$. The series converges unconditionally and $\|x\|^{2}=\sum_{j}\left\langle x, e_{j}\right\rangle^{2}$. The orthogonal projection of $x$ into the linear span of a subset $\left\{e_{i}: i \in I\right\}$ of the base equals $\sum_{i \in I}\left\langle x, e_{i}\right\rangle e_{i}$; the square distance of $x$ to this linear span equals $\sum_{j \notin I}\left\langle x, e_{j}\right\rangle^{2}$.

Call a net $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{H}$ asymptotically finite-dimensional if, for all $\delta, \varepsilon>0$, there exists a finite subset $\left\{e_{i}: i \in I\right\}$ of the orthonormal base such that

$$
\limsup _{\alpha} \mathrm{P}^{*}\left(\sum_{j \notin I}\left\langle X_{\alpha}, e_{j}\right\rangle^{2}>\delta\right)<\varepsilon .
$$

Compact sets in a Banach space can be characterized by being bounded and being contained in the $\delta$-shell of a finite-dimensional subspace, for every $\delta$. This leads to the following characterization of asymptotic tightness of a sequence of random maps.
1.8.1 Lemma. A net of random maps $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{H}$ is asymptotically tight if and only if it is asymptotically finite-dimensional and the nets $\left\langle X_{\alpha}, e_{j}\right\rangle$ are asymptotically tight for every $j$.

Proof. The set $K=\left\{\sum_{i \in I} a_{i} e_{i}: a \in \mathbb{R}^{I}, \max \left|a_{i}\right| \leq k\right\}$ is compact for every finite set $I$ and constant $k$. For every fixed $\delta$,

$$
\mathrm{P}^{*}\left(X_{\alpha} \notin K^{\delta}\right) \leq \mathrm{P}^{*}\left(\max _{i \in I}\left|\left\langle X_{\alpha}, e_{i}\right\rangle\right|>k\right)+\mathrm{P}^{*}\left(\sum_{j \notin I}\left\langle X_{\alpha}, e_{j}\right\rangle^{2} \geq \delta^{2}\right) .
$$

If the net $X_{\alpha}$ is asymptotically finite-dimensional, then the last probability can be made arbitrarily small by the choice of $I$. Next, the first probability on the right can be made arbitrarily small by the choice of $k$.

Conversely, suppose that the net $X_{\alpha}$ is asymptotically tight. Then every net $\left\langle X_{\alpha}, h\right\rangle$ is asymptotically tight by continuity of the inner product. Given $\varepsilon>0$, let $K$ be a compact set such that $\limsup _{\alpha} \mathrm{P}^{*}\left(X_{\alpha} \notin K^{\delta}\right)<\varepsilon$, for every $\delta>0$. Since $K$ is compact, there exists a finite set $I$ such that $K \subset \operatorname{lin}\left(e_{i}: i \in I\right)^{\delta}$. Then every $x \in K^{\delta}$ is at a distance of at most $2 \delta$ from $\operatorname{lin}\left(e_{i}: i \in I\right)$; the square of this distance equals $\sum_{j \notin I}\left\langle x, e_{j}\right\rangle^{2}$. Conclude that $\sum_{j \notin I}\left\langle X_{\alpha}, e_{j}\right\rangle^{2} \geq 4 \delta^{2}$ implies that $X_{\alpha} \notin K^{\delta}$. Hence the net $X_{\alpha}$ is asymptotically finite-dimensional.
1.8.2 Lemma. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{H}$ be asymptotically tight. Then it is asymptotically measurable if and only if $\left\langle X_{\alpha}, e_{j}\right\rangle$ is asymptotically measurable for every $j$.
1.8.3 Lemma. Tight Borel measurable random elements $X$ and $Y$ in $\mathbb{H}$ are equal in distribution if and only if the random variables $\langle X, h\rangle$ and $\langle Y, h\rangle$ are equal in distribution for every $h \in \mathbb{H}$.
1.8.4 Theorem. A net of random maps $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{H}$ converges in distribution to a tight Borel measurable random variable $X$ if and only if it is asymptotically finite-dimensional and the net $\left\langle X_{\alpha}, h\right\rangle$ converges in distribution to $\langle X, h\rangle$ for every $h \in \mathbb{H}$.

Proofs. For the lemmas, consider the collection $\mathcal{F}$ of all functions $f: \mathbb{H} \mapsto \mathbb{R}$ of the form

$$
f(x)=g\left(\left\langle x, e_{j_{1}}\right\rangle, \ldots,\left\langle x, e_{j_{k}}\right\rangle\right), \quad g \in C_{b}\left(\mathbb{R}^{k}\right), \quad j_{1}, \ldots, j_{k} \in J, \quad k \in \mathbb{N} .
$$

This collection forms an algebra and a vector lattice and separates points of $\mathbb{H}$. Therefore, the lemmas are consequences of Lemmas 1.3.13 and 1.3.12, respectively.

The theorem follows from combination of the lemmas with Prohorov's theorem.
1.8.5 Example (Central limit theorem). If $X_{1}, X_{2}, \ldots$ are i.i.d. Borel measurable random elements in a separable Hilbert space $\mathbb{H}$ with mean zero (i.e., $\mathrm{E}\left\langle X_{1}, h\right\rangle=0$ for every $h$ ), and $\mathrm{E}\left\|X_{1}\right\|^{2}<\infty$, then the sequence
$n^{-1 / 2} \sum_{i=1}^{n} X_{i}$ converges in distribution to a Gaussian variable $G$. The distribution of $G$ is determined by the distribution of its marginals $\langle G, h\rangle$, which are $N\left(0, \mathrm{E}\langle X, h\rangle^{2}\right)$ distributed for every $h \in \mathbb{H}$.

This follows from the theorem. The sequence $\left\langle n^{-1 / 2} \sum_{i=1}^{n} X_{i}, h\right\rangle$ converges in distribution to a normal distribution by the central limit theorem for real-valued random variables. Second, if $e_{1}, e_{2}, \ldots$ is an orthonormal base for $\mathbb{H}$, then

$$
\mathrm{E} \sum_{j>J}\left\langle n^{-1 / 2} \sum_{i=1}^{n} X_{i}, e_{j}\right\rangle^{2}=\mathrm{E} \sum_{j>J}\left\langle X_{1}, e_{j}\right\rangle^{2} \rightarrow 0, \quad J \rightarrow \infty
$$

by dominated convergence, because the series on the right is bounded by $\left\|X_{1}\right\|^{2}$, by Bessel's inequality. Thus the sequence $n^{-1 / 2} \sum_{i=1}^{n} X_{i}$ is asymptotically finite-dimensional.
1.8.6 Example (Anderson-Darling statistic). Let $X_{1}, X_{2}, \ldots$ be realvalued random variables with cumulative distribution function $F$. The random functions

$$
Z_{i}(t)=\frac{1\left\{X_{i} \leq t\right\}-F(t)}{\sqrt{F(t)(1-F)(t)}}
$$

are contained in $L_{2}(\mathbb{R}, \mu)$, and $\mathrm{E}\left\|Z_{1}\right\|_{2}^{2}=\mu(\mathbb{R})<\infty$ for every finite measure $\mu$. Conclude that the sequence $n^{-1 / 2} \sum_{i=1}^{n} Z_{i}$ converges in distribution to a Gaussian variable $G$ in $L_{2}(\mathbb{R}, \mu)$. One consequence is the weak convergence of the sequence of $L_{2}(\mu)$-norms

$$
\int \frac{n\left(\mathbb{F}_{n}-F\right)^{2}(t)}{F(t)(1-F)(t)} d \mu(t) \rightsquigarrow \int G^{2}(t) d \mu(t)
$$

where $\mathbb{F}_{n}$ is the empirical distribution function of $X_{1}, \ldots, X_{n}$. The choice $\mu=F$ yields the Anderson-Darling statistic.

## Problems and Complements

1. If $K$ is compact, then for every $\delta>0$ there exists a finite set $I$ with $K \subset \operatorname{lin}\left(e_{i}: i \in I\right)^{\delta}$.
[Hint: If not then for every finite subset $I$ there exists $x_{I} \in K$ at distance at least $\delta$ from $\operatorname{lin}\left(e_{i}: i \in I\right)$. Direct the finite subsets by inclusion. The net has a converging subnet. Its limit point $x$ has distance at least $\delta$ to every finitedimensional space $\operatorname{lin}\left(e_{i}: i \in I\right)$. Thus $\sum_{j \notin I}\left\langle x, e_{j}\right\rangle^{2} \geq \delta^{2}$ for every finite set I.]

## 1.9

## Convergence: Almost Surely and in Probability

For nets of maps defined on a single, fixed probability space ( $\Omega, \mathcal{A}, P$ ), convergence almost surely and in probability are frequently used modes of stochastic convergence, stronger than weak convergence. In this section we consider their nonmeasurable extensions together with the concept of almost uniform convergence, which is equivalent to outer almost sure convergence for sequences, but stronger and more useful for general nets.
1.9.1 Definition. Let $X_{\alpha}, X: \Omega \mapsto \mathbb{D}$ be arbitrary maps.
(i) $X_{\alpha}$ converges in outer probability to $X$ if $d\left(X_{\alpha}, X\right)^{*} \rightarrow 0$ in probability; this means that $P\left(d\left(X_{\alpha}, X\right)^{*}>\varepsilon\right)=P^{*}\left(d\left(X_{\alpha}, X\right)>\varepsilon\right) \rightarrow 0$, for every $\varepsilon>0$, and is denoted by $X_{\alpha} \xrightarrow{\mathrm{P} *} X$.
(ii) $X_{\alpha}$ converges almost uniformly to $X$ if, for every $\varepsilon>0$, there exists a measurable set $A$ with $P(A) \geq 1-\varepsilon$ and $d\left(X_{\alpha}, X\right) \rightarrow 0$ uniformly on $A$; this is denoted $X_{\alpha} \xrightarrow{\text { au }} X$.
(iii) $X_{\alpha}$ converges outer almost surely to $X$ if $d\left(X_{\alpha}, X\right)^{*} \rightarrow 0$ almost surely for some versions of $d\left(X_{\alpha}, X\right)^{*}$; this is denoted $X_{\alpha} \xrightarrow{\text { as* }} X$.
(iv) $X_{\alpha}$ converges almost surely to $X$ if $P_{*}\left(\lim d\left(X_{\alpha}, X\right)=0\right)=1$; this is denoted $X_{\alpha} \xrightarrow{\text { as }} X$.

The first three concepts in this list are the most important. The fourth is tricky - it does not behave as one might expect, in general. In fact, for nonmeasurable sequences, even convergence everywhere (which is stronger than (iv)) does not imply any of the other three forms of convergence. This is one of those phenomena that remind us that measurability, though often
present, should not be taken too lightly. The counterexample given below isn't even very complicated, though contrived, perhaps.

For sequences the second and third modes of convergence are equivalent, but for general nets the third loses much of its value. First, there is the nuisance that for general nets outer almost sure convergence depends on the versions of the minimal measurable covers one uses. Second, even for measurable nets $X_{\alpha}$, outer almost sure convergence is rather weak. For instance, it does not imply convergence in probability. For these reasons we consider (iii) and (iv) for sequences only. The Problems and Complements section gives more details about the general implications between the four forms of convergence. In the following text, we use the notation $X_{\alpha}$ for a general net and $X_{n}$ for a sequence, without further mention.

For sequences things are partly as they should be. Outer almost sure convergence (iii) is stronger than convergence in outer probability. Equivalence of almost uniform and outer almost sure convergence, part (iii) of the following lemma, is known as Egorov's theorem.
1.9.2 Lemma. Let $X$ be Borel measurable. Then
(i) $X_{n} \xrightarrow{\text { as* }} X$ implies $X_{n} \xrightarrow{\mathrm{P} *} X$;
(ii) $X_{n} \xrightarrow{\mathrm{P} *} X$ if and only if every subsequence $X_{n^{\prime}}$ has a further subsequence $X_{n^{\prime \prime}}$ with $X_{n^{\prime \prime}} \xrightarrow{\text { as* }} X$;
(iii) $X_{n} \xrightarrow{\text { as* }} X$ if and only if $X_{n} \xrightarrow{\text { au }} X$.
1.9.3 Lemma. Let $X$ be Borel measurable. Then
(i) $X_{\alpha} \xrightarrow{\text { au }} X$ if and only if $\sup _{\beta \geq \alpha} d\left(X_{\beta}, X\right)^{*} \xrightarrow{\mathrm{P}} 0$ if and only if $\sup _{\beta \geq \alpha} d\left(X_{\beta}, X\right) \xrightarrow{\mathrm{P} *} 0 ;$
(ii) $X_{\alpha} \xrightarrow{\text { au }} X$ implies $X_{\alpha} \xrightarrow{\text { P* }} X$.

Proofs. (iii). Suppose $X_{n}$ converges outer almost surely to $X$. Fix $\varepsilon>0$. Set $A_{n}^{k}=\left\{\sup _{m \geq n} d\left(X_{m}, X\right)^{*}>1 / k\right\}$. Then, for every fixed $k$, it holds that $P\left(A_{n}^{k}\right) \downarrow 0$ as $n \rightarrow \infty$. Choose $n_{k}$ with $P\left(A_{n_{k}}^{k}\right) \leq \varepsilon / 2^{k}$, and set $A=\Omega-\cup_{k=1}^{\infty} A_{n_{k}}^{k}$. Then $P(A) \geq 1-\varepsilon$ and $d\left(X_{n}, X\right)^{*} \leq 1 / k$, for $n \geq n_{k}$ and $\omega \in A$. Thus $X_{n}$ converges to $X$ almost uniformly. Conversely, suppose $X_{n}$ converges almost uniformly to $X$. Fix $\varepsilon>0$, and let $A$ be as in the definition of almost uniform convergence. Fix $\eta>0$. Then $d\left(X_{n}, X\right)^{*} 1_{A}= \left(d\left(X_{n}, X\right) 1_{A}\right)^{*} \leq \eta$ for sufficiently large $n$, since $\eta$ is a measurable function and $\eta \geq d\left(X_{n}, X\right) 1_{A}$ for sufficiently large $n$. Thus $d\left(X_{n}, X\right)^{*} \rightarrow 0$ for almost all $\omega \in A$.

Next consider the second lemma first.
(i). It is easy to see that the first statement implies the second, which implies the third. For the converse, fix $\varepsilon>0$. Take $\alpha_{k}$ such that $P^{*}\left(\sup _{\beta \geq \alpha_{k}} d\left(X_{\beta}, X\right)>1 / k\right) \leq \varepsilon / 2^{k}$. Call the set within brackets $A_{k}$, and set $A=\Omega-\cup_{k=1}^{\infty} A_{k}^{*}$. Then $P(A) \geq 1-\varepsilon$, and for every $\omega \in A$ and $\alpha \geq \alpha_{k}$, it holds that $d\left(X_{\alpha}, X\right) \leq 1 / k$.
(ii). This is an immediate consequence of (i).

Finally, consider the first lemma again. Part (i) follows from a combination of the other statements. For (ii) suppose $X_{n} \xrightarrow{\mathrm{P} *} X$. Take $n_{1}<n_{2}<\cdots$ such that $P\left(d\left(X_{n_{j}}, X\right)^{*}>1 / j\right)<2^{-j}$. Then $P\left(d\left(X_{n_{j}}, X\right)^{*}>1 / j\right.$, i.o. $)=$ 0 , by the Borel-Cantelli lemma. Thus $d\left(X_{n_{j}}, X\right) \leq 1 / j$ eventually, for almost every $\omega$. The converse is trivial in view of (i).
1.9.4 Counterexample. $X_{n}(\omega) \rightarrow 0$ for every $\omega$ does not imply $X_{n} \xrightarrow{\text { as* }} 0$. Let $(\Omega, \mathcal{A}, \lambda)$ be $[0,1]$ with Borel sets and Lebesgue measure. There exists a decreasing sequence of sets $B_{n}$, with $\cap_{n=1}^{\infty} B_{n}=\emptyset$, but $\lambda^{*}\left(B_{n}\right)=1$ for every $n$. Thus $1_{B_{n}}(\omega) \rightarrow 0$ for every $\omega$, but $\left|1_{B_{n}}-0\right|^{*}=1_{B_{n}^{*}}=1$ for every $n$, so that $1_{B_{n}}$ certainly doesn't converge to zero almost uniformly.

One construction of the sequence $B_{n}$ is as follows. ${ }^{\sharp}$ A set $H \subset \mathbb{R}$ is called a Hamel base for $\mathbb{R}$ over $\mathbb{Q}$ if every element of $\mathbb{R}$ can be expressed as a finite linear combination $\sum_{i=1}^{k} q_{i} h_{i}$, where $q_{i} \in \mathbb{Q}, h_{i} \in H$, and $k \in \mathbb{N}$. Such a base exists by Zorn's lemma (which is equivalent to the axiom of choice). Any such Hamel base $H$ is an uncountable set. Cut one such Hamel base $H$ into countably many disjoint, nonempty subsets (this is possible by the axiom of choice), and let $H_{n}$ be the union of the first $n$ cuts. Thus $H_{n} \uparrow$ and $H=\cup_{n=1}^{\infty} H_{n}$. Let $C_{n}$ be the subspace of $\mathbb{R}$ spanned by $H_{n}$ : all finite linear combinations $\sum_{i=i}^{k} q_{i} h_{i}$ with $q_{i} \in \mathbb{Q}$ and $h_{i} \in H_{n}$. Then $C_{n} \uparrow$ and $\mathbb{R}=\cup_{n=1}^{\infty} C_{n}$.

Let $K$ be an arbitrary compact set. Then either $\lambda(K)=0$ or $K-K$ contains an interval $(-\delta, \delta)$ for some $\delta>0$. Indeed, if $\lambda(K)>0$, then for $\delta>0$ sufficiently small, $\lambda\left(K^{\delta}\right)<2 \lambda(K)$. If $(-\delta, \delta)$ is not contained in $K-K$, then there is an $|x|<\delta$ for which the sets $K$ and $K+x$ are disjoint. But this is impossible, since it would imply $2 \lambda(K)=\lambda(K \cup K+x) \leq \lambda\left(K^{\delta}\right)$.

Now suppose that $K$ is a compact set contained in $C_{n}$. Then $K-K \subset C_{n}=C_{n}-C_{n}$. Since $C_{n}$ does not contain an interval, it can be inferred that $\lambda(K)=0$. Together with the inner regularity of Lebesgue measure, this implies $\lambda_{*}\left(C_{n}\right)=0$. Finally, set $B_{n}=[0,1]-C_{n}$.

There is a continuous mapping theorem for convergence in outer probability and almost uniform convergence under exactly the same conditions as for weak convergence.
1.9.5 Theorem (Continuous mapping). Let $g: \mathbb{D} \mapsto \mathbb{E}$ be continuous at every point of a Borel set $\mathbb{D}_{0} \subset \mathbb{D}$. Let $X$ be Borel measurable with $\mathrm{P}\left(X \in \mathbb{D}_{0}\right)=1$. Then
(i) $X_{\alpha} \xrightarrow{\mathrm{P} *} X$ implies that $g\left(X_{\alpha}\right) \xrightarrow{\mathrm{P} *} g(X)$;
(ii) $X_{\alpha} \xrightarrow{\text { au }} X$ implies that $g\left(X_{\alpha}\right) \xrightarrow{\text { au }} g(X)$.

Proof. (i). Fix $\varepsilon>0$. Let $B_{k}$ be the set of all $x$ for which there exist $y$ and $z$ within the open ball of radius $1 / k$ around $x$ with $e(g(y), g(z))>\varepsilon$. Then

[^10]$B_{k}$ is open and the sequence $B_{k}$ is decreasing. Moreover, $\mathrm{P}\left(X \in B_{k}\right) \downarrow 0$, since every point in $\cap_{k=1}^{\infty} B_{k}$ is a point of discontinuity of $g$. Now, for every fixed $k$,
$$
\begin{aligned}
\mathrm{P}^{*}\left(e\left(g\left(X_{\alpha}\right), g(X)\right)>\varepsilon\right) & \leq \mathrm{P}^{*}\left(X \in B_{k} \text { or } d\left(X_{\alpha}, X\right) \geq 1 / k\right) \\
& \rightarrow \mathrm{P}^{*}\left(X \in B_{k}\right)
\end{aligned}
$$

Finally, let $k \rightarrow \infty$.
(ii). Add a supremum in the proof of (i) twice to obtain that $\sup _{\beta \geq \alpha} d\left(X_{\beta}, X\right) \xrightarrow{\mathrm{P} *} 0$ implies that $\sup _{\beta \geq \alpha} e\left(g\left(X_{\beta}\right), g(X)\right) \xrightarrow{\mathrm{P} *} 0$. This is equivalent to the statement of (ii).

It was shown by counterexample that convergence almost surely does not imply convergence outer almost surely or in outer probability. The problem is a possible lack of measurability. Since convergence almost surely is so easy to work with, it is of interest to know how much measurability is sufficient to remove the difference. A trivial but useful result is that $X_{n} \xrightarrow{\text { as }} X$ together with measurability of $d\left(X_{n}, X\right)$ implies $X_{n} \xrightarrow{\text { as* }} X$. The next theorem gives an exact answer to the problem, although, admittedly, it may often not be more useful than the trivial sufficient condition just mentioned.

What is needed is some sort of asymptotic measurability of $X_{n}$. Asymptotic measurability as introduced before is slightly too weak. Call $X_{n}$ strongly asymptotically measurable if

$$
f\left(X_{n}\right)^{*}-f\left(X_{n}\right)_{*} \xrightarrow{\text { as }} 0, \quad \text { for every } f \in C_{b}(\mathbb{D}) .
$$

This is stronger than (ordinary) asymptotic measurability: the latter requires convergence in probability rather than almost sure convergence. Of course, both are implied by measurability for every $n$. It can be shown that $X_{n} \xrightarrow{\text { as }} X$ together with asymptotic measurability implies $X_{n} \xrightarrow{\text { P* }} X$ (Problem 1.9.1). For the stronger conclusion that $X_{n} \xrightarrow{\text { as* }} X$, strong asymptotic measurability is necessary. Perhaps the best part of the next theorem is (iv), which implies that almost sure convergence plus ball measurability implies almost uniform convergence.
1.9.6 Theorem. Let $X$ be Borel measurable and separable. Then the following statements are equivalent:
(i) $X_{n} \xrightarrow{\text { as* }} X$;
(ii) $X_{n} \xrightarrow{\text { as }} X$ and $d\left(X_{n}, X\right)^{*}-d\left(X_{n}, X\right)_{*} \xrightarrow{\text { as }} 0$;
(iii) $X_{n} \xrightarrow{\text { as }} X$ and $X_{n}$ is strongly asymptotically measurable;
(iv) $X_{n} \xrightarrow{\text { as }} X$ and $d\left(X_{n}, s\right)$ is strongly asymptotically measurable for every $s$ in a set $S$ with $\mathrm{P}(X \in \bar{S})=1$.
In particular, if $X_{n} \xrightarrow{\text { as }} X$ and every $X_{n}$ and $X$ is ball measurable, then $X_{n} \xrightarrow{\text { as* }} X$.

Proof. The equivalence of (i) and (ii) is easy to see.
(i) ⇒ (iii) ⇒ (iv). If (i) holds, then trivially $X_{n} \xrightarrow{\text { as }} X$. Furthermore, by the continuous mapping theorem $f\left(X_{n}\right) \xrightarrow{\text { as* }} f(X)$, for every continuous $f$. Consequently

$$
\begin{aligned}
f\left(X_{n}\right)^{*}-f\left(X_{n}\right)_{*} & =\left(f\left(X_{n}\right)-f(X)\right)^{*}-\left(f\left(X_{n}\right)-f(X)\right)_{*} \\
& \leq 2\left|f\left(X_{n}\right)-f(X)\right|^{*} \xrightarrow{\text { as }} 0 .
\end{aligned}
$$

Thus (iii) holds. Next, (iv) is immediate from the fact that the function $x \mapsto f(d(x, s))$ is contained in $C_{b}(\mathbb{D})$ for every bounded, continuous function $f$ on $\mathbb{R}$ and $s \in \mathbb{D}$.
(iv) ⇒ (i). Assume without loss of generality that $S$ is countable and that $\mathbb{D}$ is complete. Let $f_{1}, f_{2}, \ldots$ be the set of functions $x \mapsto(1- m d(x, s))^{+}$, where $m \in \mathbb{N}$ and $s \in S$. Define a semimetric on $\mathbb{D}$ by

$$
e(x, y)=\sup _{j \in \mathbb{N}} \frac{1}{j}\left|f_{j}(x)-f_{j}(y)\right| .
$$

A sequence $x_{n}$ in $\mathbb{D}$ converges to a point $x \in \bar{S}$ if and only if $f_{j}\left(x_{n}\right) \rightarrow f_{j}(x)$ for every $j$; equivalently, if and only if $e\left(x_{n}, x\right) \rightarrow 0$. Conclude that, for every compact $K \subset \bar{S}$, there is for every $\varepsilon>0$ a $\delta>0$ such that, for every $x \in K$ and $y \in \mathbb{D}, e(y, x)<\delta$ implies $d(y, x)<\varepsilon$.

Fix $j$. If the first assertion of (iv) holds, then $f_{j}\left(X_{n}\right) \xrightarrow{\text { as }} f_{j}(X)$. Under the second assertion,

$$
\left(f_{j}\left(X_{n}\right)-f_{j}(X)\right)^{*}-\left(f_{j}\left(X_{n}\right)-f_{j}(X)\right)_{*}=f_{j}\left(X_{n}\right)^{*}-f_{j}\left(X_{n}\right)_{*} \xrightarrow{\text { as* }} 0 \text {. }
$$

Combination yields that $\left|f_{j}\left(X_{n}\right)-f_{j}(X)\right| \xrightarrow{\text { as* }} 0$. By Egorov's theorem, there is a measurable set $A_{j}$ with $P\left(\Omega-A_{j}\right)<\varepsilon / 2^{j}$ and $f_{j}\left(X_{n}\right)-f_{j}(X) \rightarrow 0$ uniformly on $A_{j}$. The set $A=\cap_{j=1}^{\infty} A_{j}$ has $P(\Omega-A)<\varepsilon$ and $e\left(X_{n}, X\right) \rightarrow 0$ uniformly on $A$.

Take a compact $K$ with $P(X \in K) \geq 1-\varepsilon$. Then $B=A \cap\{X \in K\}$ has $P(\Omega-B)<2 \varepsilon$ and $d\left(X_{n}, X\right) \rightarrow 0$ uniformly on $B$. Thus $X_{n} \xrightarrow{\text { as* }} X$.

## Problems and Complements

1. Let $X$ be Borel measurable and separable. Then the following statements are equivalent:
(i) $X_{n} \xrightarrow{\text { as }} X$ and $d\left(X_{n}, X\right)$ is asymptotically measurable;
(ii) $X_{n} \xrightarrow{\text { as }} X$ and $X_{n}$ is asymptotically measurable;
(iii) $X_{n} \xrightarrow{\text { as }} X$ and $d\left(X_{n}, s\right)$ is asymptotically measurable for all $s$ in a set $S$ with $\mathrm{P}(X \in \bar{S})=1$.
Furthermore, the statements imply
(iv) $X_{n} \xrightarrow{\mathrm{P} *} X$.

It is possible to give this a fancier formulation by introducing the notion of convergence in probability (different from convergence in outer probability). Say that $X_{n} \xrightarrow{\mathrm{P}} X$ if every subsequence $X_{n^{\prime}}$ has a further subsequence with $X_{n^{\prime \prime}} \xrightarrow{\text { as }} X$. If, in (i) - (iii), $X_{n} \xrightarrow{\text { as }} X$ is replaced by $X_{n} \xrightarrow{\mathrm{P}} X$, then (i) - (iv) are equivalent.

### 1.10

## Convergence: Weak, Almost Uniform, and in Probability

Consider the relationships between the convergence concepts introduced in the previous section and weak convergence. First we shall be a bit formal and note that convergence in probability to a constant can be defined for maps with different domains ( $\Omega_{\alpha}, \mathcal{A}_{\alpha}, P_{\alpha}$ ) too, so that it is not covered by Definition 1.9.1 in the preceding section.
1.10.1 Definition. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be an arbitrary net of maps and $c \in \mathbb{D}$. Then $X_{\alpha}$ converges in outer probability to $c$ if $\mathrm{P}^{*}\left(d\left(X_{\alpha}, c\right)>\varepsilon\right) \rightarrow 0$, for every $\varepsilon>0$. This is denoted $X_{\alpha} \xrightarrow{\mathrm{P} *} c$.

In general, convergence in outer probability is stronger than weak convergence, though they are equivalent if the limit is constant.
1.10.2 Lemma. Let $X_{\alpha}, Y_{\alpha}$ be arbitrary maps and $X$ Borel measurable.
(i) If $X_{\alpha} \rightsquigarrow X$ and $d\left(X_{\alpha}, Y_{\alpha}\right) \xrightarrow{P *} 0$, then $Y_{\alpha} \leadsto X$.
(ii) If $X_{\alpha} \xrightarrow{\mathrm{P} *} X$, then $X_{\alpha} \leadsto X$.
(iii) $X_{\alpha} \xrightarrow{\mathrm{P} *} c$ if and only if $X_{\alpha} \leadsto c$.

Proof. (i). Let $F$ be closed. Then, for every fixed $\varepsilon>0$, it holds that $\limsup \mathrm{P}^{*}\left(Y_{\alpha} \in F\right)=\limsup \mathrm{P}^{*}\left(Y_{\alpha} \in F \wedge d\left(X_{\alpha}, Y_{\alpha}\right)^{*} \leq \varepsilon\right) \leq \limsup \mathrm{P}^{*}\left(X_{\alpha} \in \overline{F^{\varepsilon}}\right) \leq \mathrm{P}\left(X \in \overline{F^{\varepsilon}}\right)$. Letting $\varepsilon \downarrow 0$ completes the proof.
(ii). Clearly, $X \leadsto X$ and $d\left(X, X_{\alpha}\right) \xrightarrow{\mathrm{P} *} 0$. Apply (i).
(iii). One direction follows from (ii). For the other, note that $\mathrm{P}^{*}\left(d\left(X_{\alpha}, c\right)>\varepsilon\right)=\mathrm{P}^{*}\left(X_{\alpha} \notin B(c, \varepsilon)\right)$, where $B(c, \varepsilon)$ is the ball of radius $\varepsilon$
around $c$. By the portmanteau theorem, the limsup of this is smaller then or equal to $\mathrm{P}(c \notin B(c, \varepsilon))=0$.

The second assertion of the previous lemma can certainly not be inverted: weakly convergent maps need not even be defined on the same probability space. However, according to the almost sure representation theorem, for every weakly convergent net there is an almost surely convergent net (defined on some probability space) that is the "same" as far as laws are concerned. The nonmeasurable version of this result sounds somewhat more complicated than the measurable version; so it is worth considering the case of measurable maps first. For every $\alpha$, let $\mathcal{D}_{\alpha}$ be a $\sigma$-field on $\mathbb{D}$, not larger than the Borel $\sigma$-field. For convenience of notation, the limit variable will be written as $X_{\infty}$ rather than $X$ and a statement that is valid "for every $\alpha$ " will be understood to apply to $\alpha=\infty$ too.
1.10.3 Theorem (a.s. representations). Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be $\mathcal{D}_{\alpha}$ measurable maps. If $X_{\alpha} \rightsquigarrow X_{\infty}$ and $X_{\infty}$ is separable, then there exist $\mathcal{D}_{\alpha}$ measurable maps $\tilde{X}_{\alpha}: \tilde{\Omega} \mapsto \mathbb{D}$ defined on some probability space $(\tilde{\Omega}, \tilde{\mathcal{A}}, \tilde{P})$ with
(i) $\tilde{X}_{\alpha} \xrightarrow{\text { au }} \tilde{X}_{\infty}$;
(ii) $\tilde{X}_{\alpha}$ and $X_{\alpha}$ are equal in law on $\mathcal{D}_{\alpha}$ for every $\alpha$.

Usually this theorem will be applied with every $\mathcal{D}_{\alpha}$ equal to the Borel or ball $\sigma$-field. In any case, the smaller the $\mathcal{D}_{\alpha}$ are, the weaker the result. In the extreme case that the $\mathcal{D}_{\alpha}$ are the trivial $\sigma$-fields, the theorem is still true, but it yields "representations" $\tilde{X}_{\alpha}$ with no relationship to the original $X_{\alpha}$ whatsoever. Thus it is worthwhile to pursue a stronger formulation for nonmeasurable maps. The problem is to generalize the statement that every pair $\tilde{X}_{\alpha}$ and $X_{\alpha}$ are equal in law. In the initial formulation, equality in law will be interpreted in the sense that

$$
\mathrm{E}^{*} f\left(\tilde{X}_{\alpha}\right)=\mathrm{E}^{*} f\left(X_{\alpha}\right), \quad \text { for every bounded } f: \mathbb{D} \mapsto \mathbb{R}
$$

In particular, $\mathrm{P}^{*}\left(\tilde{X}_{\alpha} \in B\right)=\mathrm{P}^{*}\left(X_{\alpha} \in B\right)$ for every set $B$, and the same for inner probabilities. If $(\tilde{\Omega}, \tilde{\mathcal{A}}, \tilde{P})$ is complete (which may be assumed without loss of generality), this implies that the laws of $\tilde{X}_{\alpha}$ and $X_{\alpha}$ are the same on the maximal $\sigma$-field $\left\{B \subset \mathbb{D}: X_{\alpha}^{-1}(B) \in \mathcal{A}_{\alpha}\right\}$ for which they are defined, that is, for which $X_{\alpha}$ is measurable (Problem 1.2.10). However, in general, equality of the outer expectations says a lot more than just equality in law.

The following nonmeasurable representation theorem holds for sequences but not nets in general. Call a directed set nontrivial if it permits a net of strictly positive numbers $\delta_{\alpha}$ with $\delta_{\alpha} \rightarrow 0$. Of course, the set of natural numbers with the usual ordering is nontrivial. ${ }^{\dagger}$

[^11]1.10.4 Theorem (a.s. representations). Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be an arbitrary net indexed by a nontrivial directed set, and let $X_{\infty}$ be Borel measurable and separable. If $X_{\alpha} \rightsquigarrow X_{\infty}$, then there exists a probability space $(\tilde{\Omega}, \tilde{\mathcal{A}}, \tilde{P})$ and maps $\tilde{X}_{\alpha}: \tilde{\Omega} \mapsto \mathbb{D}$ with
(i) $\tilde{X}_{\alpha} \xrightarrow{\text { au }} \tilde{X}_{\infty}$;
(ii) $\mathrm{E}^{*} f\left(\tilde{X}_{\alpha}\right)=\mathrm{E}^{*} f\left(X_{\alpha}\right)$, for every bounded $f: \mathbb{D} \mapsto \mathbb{R}$ and every $\alpha$.
1.10.5 Addendum. In addition to (i) and (ii), $\tilde{X}_{\alpha}$ can be chosen according to the following diagram:
![](https://cdn.mathpix.com/cropped/bb2a681b-54b6-4ce4-8c2f-a3f7c0f2d98d-074.jpg?height=158&width=387&top_left_y=657&top_left_x=636)
with the maps $\phi_{\alpha}$ measurable and perfect, and $P_{\alpha}=\tilde{P} \circ \phi_{\alpha}^{-1}$.
The perfectness of $\phi_{\alpha}$ asserted by the addendum improves part (ii) of the theorem. However, the main interest of the addendum is the implication that every $\tilde{X}_{\alpha}$ can be forced to take no other values than the original $X_{\alpha}$. Thus $\tilde{X}_{\alpha}$ and $X_{\alpha}$ also share other properties, which may not be directly expressible in terms of their "laws."
1.10.6 Example. Consider the empirical process $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ indexed by a set of functions $\mathcal{H}$ on a measurable space $(\mathcal{X}, \mathcal{B})$. Under suitable conditions this converges weakly when seen as maps into $\ell^{\infty}(\mathcal{H})$. Of course, every realization $\mathbb{G}_{n}(\omega)$ can also be seen as a signed measure on ( $\mathcal{X}, \mathcal{B}$ ). According to the addendum, it is possible to construct the representations $\tilde{\mathbb{G}}_{n}$ as maps into $\ell^{\infty}(\mathcal{H})$ in such a way that the double interpretation - as a bounded function and a signed measure - is retained.

Proofs. If the directed set is trivial, then $X_{\alpha} \rightsquigarrow X_{\infty}$ for a separable $X$ can happen only if $X_{\alpha}$ is Borel measurable (for the completion of the underlying probability space) and equal in law to $X_{\infty}$ eventually (Problem 1.10.6). In that case, the measurable version of the theorem is trivial. For nontrivial directed sets, the nonmeasurable version implies the measurable version. For $\tilde{X}_{\alpha}$ as in the addendum,

$$
\mathrm{E}^{*} f\left(\tilde{X}_{\alpha}\right)=\int^{*} f \circ X_{\alpha} \circ \phi_{\alpha} d \tilde{P}=\int^{*} f \circ X_{\alpha} d \tilde{P} \circ \phi_{\alpha}^{-1}=\mathrm{E}^{*} f\left(X_{\alpha}\right)
$$

for every bounded $f$, where perfectness of $\phi_{\alpha}$ is used in the second equality. Thus it is enough to construct $\tilde{X}_{\alpha}$ as in the addendum that also satisfy (i).

[^12]The construction consists of five steps. Call a set $B \subset \mathbb{D}$ a continuity set if $\mathrm{P}\left(X_{\infty} \in \delta B\right)=0$.
(i). For every $\varepsilon>0$, there exists a partition of $\mathbb{D}$ into finitely many disjoint continuity sets

$$
B_{0}^{(\varepsilon)}, B_{1}^{(\varepsilon)}, \ldots, B_{k_{\varepsilon}}^{(\varepsilon)}
$$

with the properties $P\left(X_{\infty} \in B_{0}^{(\varepsilon)}\right)<\varepsilon^{2}$ and $\operatorname{diam} B_{i}^{(\varepsilon)}<\varepsilon$ for $i= 1,2, \ldots, k_{\varepsilon}$.

Indeed, let the sequence $s_{1}, s_{2}, \ldots$ be dense in a set with probability 1 under $X_{\infty}$. Every open ball $B\left(s_{i}, r\right)$ is a discontinuity set for at most countably many values of $r$. Take $\varepsilon / 3<r_{i}<\varepsilon / 2$ such that $B\left(s_{i}, r_{i}\right)$ is a continuity set. For $i \geq 1$ set $B_{i}^{(\varepsilon)}=B\left(s_{i}, r_{i}\right)-\cup_{j<i} B\left(s_{j}, r_{j}\right)$. Since the boundary of a finite intersection is contained in the union of the boundaries, every $B_{i}^{(\varepsilon)}$ is a continuity set. Moreover, the union of all $B_{i}^{(\varepsilon)}$ has probability 1 under $X_{\infty}$. Take $k_{\varepsilon}$ sufficiently large, and set $B_{0}^{(\varepsilon)}=\mathbb{D}-\cup_{i=1}^{k_{\varepsilon}} B_{i}^{(\varepsilon)}$.
(ii). There exists a net $\varepsilon_{\alpha} \rightarrow 0$ taking values $1 / m$ with $m \in \mathbb{N}$ only, and

$$
\begin{equation*}
P_{*}\left(X_{\alpha} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}\right) \geq\left(1-\varepsilon_{\alpha}\right) P_{\infty}\left(X_{\infty} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}\right), \quad i=1, \ldots, k_{\varepsilon_{\alpha}}, \tag{1.10.7}
\end{equation*}
$$

for all sufficiently large $\alpha$, say $\alpha \geq \alpha_{1}$.
Indeed, for every fixed $\varepsilon>0$ and every $i$, one has $P_{*}\left(X_{\alpha} \in B_{i}^{(\varepsilon)}\right) \rightarrow P_{\infty}\left(X_{\infty} \in B_{i}^{(\varepsilon)}\right)$, by the portmanteau theorem. Let $\alpha_{m}$ be such that, for $\alpha \geq \alpha_{m}$ and $i=1, \ldots, k_{1 / m}$,

$$
\begin{equation*}
P_{*}\left(X_{\alpha} \in B_{i}^{(1 / m)}\right) \geq\left(1-\frac{1}{m}\right) P_{\infty}\left(X_{\infty} \in B_{i}^{(1 / m)}\right) . \tag{1.10.8}
\end{equation*}
$$

Assume without loss of generality that $\alpha_{1} \leq \alpha_{2} \leq \cdots$. Set

$$
\eta_{\alpha}=\inf \left\{\frac{1}{m}: \alpha \geq \alpha_{m}, m \in \mathbb{N}\right\}
$$

where the infimum over the empty set is 2 . For $\alpha \geq \alpha_{m}$, it holds that $\eta_{\alpha} \leq 1 / m$; hence $\eta_{\alpha} \rightarrow 0$. This net qualifies for $\varepsilon_{\alpha}$ in case it is never zero. In general, $\varepsilon_{\alpha}$ will be defined as $\eta_{\alpha}$ kept away from zero. For a fixed $\alpha \geq \alpha_{1}$, either $\eta_{\alpha}=1 / m$, in which case $\alpha \geq \alpha_{m}$, or $\eta_{\alpha}=0$, in which case $\alpha \geq \alpha_{m}$ for every $m$. In the first case, (1.10.8) holds for $1 / m=\eta_{\alpha}$; in the second, (1.10.8) holds for every $1 / m, m \in \mathbb{N}$. Let $\delta_{\alpha}$ be an arbitrary net with $\delta_{\alpha} \rightarrow 0$ and taking values $1 / m$ with $m \in \mathbb{N}$ only. Set $\varepsilon_{\alpha}=\eta_{\alpha}$ if $\eta_{\alpha}>0$ and $\varepsilon_{\alpha}=\delta_{\alpha}$ if $\eta_{\alpha}=0$.
(iii). To simplify notation, assume that (1.5.5) holds for every $\alpha$ and is positive (throw away the beginning of the net). For $i=1, \ldots, k_{\varepsilon_{\alpha}}$, let $A_{i}^{\alpha}$ be a measurable set contained in $\left\{X_{\alpha} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}\right\}$ with the same (inner)
probability. Set $A_{0}^{\alpha}=\Omega_{\alpha}-\cup_{i=1}^{k_{\varepsilon_{\alpha}}} A_{i}^{\alpha}$. Define

$$
\begin{aligned}
& \tilde{\Omega}=\Omega_{\infty} \times \prod_{\alpha}\left[\Omega_{\alpha} \times \prod_{i=0}^{k_{\varepsilon_{\alpha}}} A_{i}^{\alpha}\right] \times[0,1] \\
& \tilde{\mathcal{A}}=\mathcal{A}_{\infty} \times \prod_{\alpha}\left[\mathcal{A}_{\alpha} \times \prod_{i=0}^{k_{\varepsilon_{\alpha}}} \mathcal{A}_{\alpha} \cap A_{i}^{\alpha}\right] \times \mathcal{B}_{o} \\
& \tilde{P}=P_{\infty} \times \prod_{\alpha}\left[\mu_{\alpha} \times \prod_{i=0}^{k_{\varepsilon_{\alpha}}} P_{\alpha}\left(\cdot \mid A_{i}^{\alpha}\right)\right] \times \lambda
\end{aligned}
$$

Here $P_{\alpha}\left(\cdot \mid A_{i}^{\alpha}\right)$ is the conditional $P_{\alpha}$-measure given that $A_{i}^{\alpha}$ and $\mathcal{B}_{o}$ and $\lambda$ are the Borel sets and Lebesgue measure on $[0,1]$, respectively. Furthermore, $\mu_{\alpha}$ is the probability measure defined by

$$
\begin{equation*}
\mu_{\alpha}(A)=\varepsilon_{\alpha}^{-1} \sum_{i=0}^{k_{\varepsilon_{\alpha}}} P_{\alpha}\left(A \mid A_{i}^{\alpha}\right)\left[P_{\alpha}\left(A_{i}^{\alpha}\right)-\left(1-\varepsilon_{\alpha}\right) P_{\infty}\left(X_{\infty} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}\right)\right] \tag{1.10.9}
\end{equation*}
$$

Write an element $\tilde{\omega}$ of $\tilde{\Omega}$ as

$$
\tilde{\omega}=\left(\omega_{\infty}, \ldots, \omega_{\alpha}, \omega_{\alpha 0}, \omega_{\alpha 1}, \ldots, \omega_{\alpha k_{\varepsilon_{\alpha}}}, \ldots, \xi\right) .
$$

Define

$$
\begin{aligned}
\phi_{\infty}(\tilde{\omega}) & =\omega_{\infty}, \\
\phi_{\alpha}(\tilde{\omega}) & = \begin{cases}\omega_{\alpha}, & \text { if } \xi>1-\varepsilon_{\alpha}, \\
\omega_{\alpha i}, & \text { if } \xi \leq 1-\varepsilon_{\alpha} \text { and } X_{\infty}\left(\omega_{\infty}\right) \in B_{i}^{\left(\varepsilon_{\alpha}\right)} .\end{cases}
\end{aligned}
$$

Thus if $X_{\infty}$ falls in $B_{i}^{\left(\varepsilon_{\alpha}\right)}$, "choose" $\phi_{\alpha}$ with probability $1-\varepsilon_{\alpha}$ in $A_{i}^{\alpha}$ (so that $X_{\alpha} \circ \phi_{\alpha} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}$, close to $X_{\infty}$ for $i \geq 1$ ) according to the conditional distribution $P_{\alpha}\left(\cdot \mid A_{i}^{\alpha}\right)$. Next, the mass $\varepsilon_{\alpha}$ is used to correct this "discretization" so as to ensure that $\tilde{P} \circ \phi_{\alpha}^{-1}=P_{\alpha}$. If $\phi_{\alpha}$ is chosen with probability $\varepsilon_{\alpha}$, according to a law $\mu_{\alpha}$, then

$$
\tilde{P}\left(\phi_{\alpha} \in A\right)=\left(1-\varepsilon_{\alpha}\right) \sum_{i=0}^{k_{\varepsilon_{\alpha}}} \tilde{P}\left(\omega_{\alpha, i} \in A \wedge X_{\infty}\left(\omega_{\infty}\right) \in B_{i}^{\left(\varepsilon_{\alpha}\right)}\right)+\varepsilon_{\alpha} \mu_{\alpha}(A)
$$

Elementary algebra shows that to make this equal to $P_{\alpha}(A)$, the measure $\mu_{\alpha}$ must be defined by (1.10.9). Because of (1.10.7), this is possible.
(iv). It is clear from the construction that $d\left(\tilde{X}_{\alpha}, \tilde{X}_{\infty}\right) \leq \varepsilon_{\alpha}$, for every $\tilde{\omega}$, with $X_{\infty}\left(\omega_{\infty}\right) \notin B_{0}^{\left(\varepsilon_{\alpha}\right)}$ and $\xi \leq 1-\varepsilon_{\alpha}$. Set $A_{k}=\cup_{m \geq k}\left\{\tilde{\omega}: X_{\infty}\left(\omega_{\infty}\right) \in\right. B_{0}^{(1 / m)}$ or $\left.\xi>1-1 / k\right\}$. For every $\varepsilon>0$, there exists a $k$ such that $\tilde{P}\left(A_{k}\right) \leq \varepsilon$. For $\underset{\sim}{\tilde{\omega}} \in \tilde{\Omega}-A_{k}$ and $\alpha$ such that $\varepsilon_{\alpha} \leq 1 / k$, it holds that $d\left(\tilde{X}_{\alpha}, \tilde{X}_{\infty}\right) \leq \varepsilon_{\alpha}$. Thus $\tilde{X}_{\alpha}$ converges to $\tilde{X}_{\infty}$ almost uniformly.
(v). Let $T: \Omega_{\alpha} \mapsto \mathbb{R}$ be bounded, and let $T^{*}$ be its minimal measurable cover for $P_{\alpha}$. Write

$$
T \circ \phi_{\alpha}=1_{\pi_{\xi} \leq 1-\varepsilon_{\alpha}} \sum_{i=0}^{k_{\varepsilon_{\alpha}}} T_{\mid A_{i}^{\alpha}} \circ \pi_{\alpha, i} 1_{X_{\infty} \circ \pi_{\infty} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}}+1_{\pi_{\xi}>1-\varepsilon_{\alpha}} T \circ \pi_{\alpha},
$$

where $\pi_{\xi}: \tilde{\Omega} \mapsto[0,1], \pi_{\alpha, i}: \tilde{\Omega} \mapsto A_{i}^{\alpha}$, and $\pi_{\alpha}: \tilde{\Omega} \mapsto \Omega_{\alpha}$ are the coordinate projections. Then the minimal measurable cover of $T \circ \phi_{\alpha}$ for $\tilde{P}$ can be computed as

$$
\begin{aligned}
\left(T \circ \phi_{\alpha}\right)^{*}= & 1_{\pi_{\xi} \leq 1-\varepsilon_{\alpha}} \sum_{i=0}^{k_{\varepsilon_{\alpha}}}\left(T_{\mid A_{i}^{\alpha}} \circ \pi_{\alpha, i}\right)^{*} 1_{X_{\infty} \circ \pi_{\infty} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}} \\
& \quad+1_{\pi_{\xi}>1-\varepsilon_{\alpha}}\left(T \circ \pi_{\alpha}\right)^{*} \\
= & 1_{\pi_{\xi} \leq 1-\varepsilon_{\alpha}} \sum_{i=0}^{k_{\varepsilon_{\alpha}}}\left(T_{\mid A_{i}^{\alpha}}\right)^{* P\left(\cdot \mid A_{i}^{\alpha}\right)} \circ \pi_{\alpha, i} 1_{X_{\infty} \circ \pi_{\infty} \in B_{i}^{\left(\varepsilon_{\alpha}\right)}} \\
& \quad+1_{\pi_{\xi}>1-\varepsilon_{\alpha}} T^{* \mu_{\alpha}} \circ \pi_{\alpha}
\end{aligned}
$$

since coordinate projections are perfect. Because $P_{\alpha}$ and $P\left(\cdot \mid A_{i}^{\alpha}\right)$ or $\mu_{\alpha}$ are equivalent on the spaces where they are defined, the measurable covers in the last formula can just as well be computed under $P_{\alpha}$, whence $\left(T \circ \phi_{\alpha}\right)^{*}= T^{*} \circ \phi_{\alpha}$.

A typical use of the almost sure representation theorem is to extend convergence theorems for expectations of almost surely convergent nets to weakly convergent nets.
1.10.10 Example. Let $f, g: \mathbb{D} \mapsto \mathbb{R}$ be continuous and satisfy $|f| \leq g$. If $X_{n} \rightsquigarrow X$ and $\mathrm{E}^{*} g\left(X_{n}\right) \rightarrow \mathrm{E} g(X)<\infty$, then $\mathrm{E}^{*} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$.

To see this, let $\tilde{X}_{n} \xrightarrow{\text { as* }} \tilde{X}$ be almost sure representations. By the continuous mapping theorem for outer almost sure convergence, $f\left(\tilde{X}_{n}\right) \xrightarrow{\text { as* }} f(\tilde{X})$ and $g\left(\tilde{X}_{n}\right) \xrightarrow{\text { as* }} g(\tilde{X})$. The latter gives $g\left(\tilde{X}_{n}\right)^{*} \xrightarrow{\text { as }} g(\tilde{X})$. Combined with convergence of expectations, $\mathrm{E} g\left(\tilde{X}_{n}\right)^{*} \rightarrow \mathrm{E} g(\tilde{X})$, it yields $\mathrm{E}\left|g\left(\tilde{X}_{n}\right)^{*}-g(\tilde{X})\right| \rightarrow$ 0 , by a well-known convergence lemma. Thus the sequence $g\left(\tilde{X}_{n}\right)^{*}$ is uniformly integrable. Since $0 \leq\left|f\left(\tilde{X}_{n}\right)\right|^{*} \leq g\left(\tilde{X}_{n}\right)^{*}$, the same is true for the sequence $f\left(\tilde{X}_{n}\right)^{*}$, whence $\operatorname{E} f\left(\tilde{X}_{n}\right)^{*} \rightarrow \operatorname{E} f(\tilde{X})$.
1.10.11 Example. A particular case of the previous example is the following. Let $L_{n}$ be a sequence of Borel measures. For a continuous positive function $g$, consider the measures $M_{n}(B)=\int_{B} g d L_{n}$. If $L_{n} \leadsto L_{\infty}$ and $\int g d L_{n} \rightarrow \int g d L_{\infty}$, then $M_{n} \rightsquigarrow M_{\infty}$. A closer look reveals that $g$ need be continuous almost everywhere under the limit $L_{\infty}$ only.

Certain results are easier to prove for measurable maps. The following proposition can often be used to turn a result for measurable maps into a general one.
1.10.12 Proposition. Let $X_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ be arbitrary. If $X_{\alpha} \leadsto X$ and $X$ is separable, then there exist Borel measurable $Y_{\alpha}: \Omega_{\alpha} \mapsto \mathbb{D}$ with $d\left(X_{\alpha}, Y_{\alpha}\right) \xrightarrow{\mathrm{P} *} 0$.

Proof. As explained in the proof of the almost sure representation theorem, there exist for every $\varepsilon>0$ finitely many $X$-continuity sets $B_{0}^{(\varepsilon)}, B_{1}^{(\varepsilon)}, \ldots, B_{k_{\varepsilon}}^{(\varepsilon)}$ such that $P\left(X \in B_{0}^{(\varepsilon)}\right)<\varepsilon$ and $\operatorname{diam} B_{i}^{(\varepsilon)}<\varepsilon$ for $i=1,2, \ldots, k_{\varepsilon}$. Choose a point $x_{i}^{(\varepsilon)}$ from every $B_{i}^{(\varepsilon)}$, and define

$$
Y_{\alpha}^{(\varepsilon)}= \begin{cases}x_{i}^{(\varepsilon)}, & \text { on }\left\{X_{\alpha} \in B_{i}^{(\varepsilon)}\right\}_{*}, \quad i=1, \ldots, k_{\varepsilon} \\ x_{0}^{(\varepsilon)}, & \text { on } \Omega_{\alpha}-\cup_{i=1}^{k_{\varepsilon}}\left\{X_{\alpha} \in B_{i}^{(\varepsilon)}\right\}_{*}\end{cases}
$$

Then each $Y_{\alpha}^{(\varepsilon)}$ is measurable, and

$$
\begin{aligned}
\mathrm{P}^{*}\left(d\left(Y_{\alpha}^{(\varepsilon)}, X_{\alpha}\right)>\varepsilon\right) \leq \sum_{i=1}^{k_{\varepsilon}} \mathrm{P}( & \left.\left\{X_{\alpha} \in B_{i}^{(\varepsilon)}\right\}^{*}-\left\{X_{\alpha} \in B_{i}^{(\varepsilon)}\right\}_{*}\right) \\
& +\mathrm{P}^{*}\left(X_{\alpha} \in B_{0}^{(\varepsilon)}\right) \rightarrow \mathrm{P}\left(X \in B_{0}^{(\varepsilon)}\right)<\varepsilon .
\end{aligned}
$$

Assume for the moment that there exists a net $\delta_{\alpha} \rightarrow 0$ taking values $1 / m$, $m \in \mathbb{N}$ only. Let $R(\alpha, \varepsilon)$ be the probability on the left side in the last displayed equation. For $m \in \mathbb{N}$, there exists $\alpha_{m}$ such that, for all $\alpha \geq \alpha_{m}$,

$$
R\left(\alpha, \frac{1}{m}\right)<\frac{2}{m}
$$

Choose the $\alpha_{m}$ increasing: $\alpha_{1} \leq \alpha_{2} \leq \cdots$. Set

$$
\eta_{\alpha}=\inf \left\{\frac{1}{m}: \alpha \geq \alpha_{m}\right\}
$$

where the infimum over the empty set is 2 . Then $\eta_{\alpha} \rightarrow 0$. Moreover, for $\alpha \geq \alpha_{1}$, either $\eta_{\alpha}=1 / m$ for some $m$, in which case $\alpha \geq \alpha_{m}$, or $\eta_{\alpha}=0$. In the first case, $R(\alpha, 1 / m)<2 / m$; while in the second case, $R(\alpha, 1 / m)< 2 / m$, for every $m$. Define $\varepsilon_{\alpha}$ to be $\eta_{\alpha}$ if $\eta_{\alpha}>0$ and $\delta_{\alpha}$ if $\eta_{\alpha}=0$. Then $R\left(\alpha, \varepsilon_{\alpha}\right)<2 \varepsilon_{\alpha}$, for every $\alpha$. Consequently, $d\left(Y_{\alpha}^{\left(\varepsilon_{\alpha}\right)}, X_{\alpha}\right) \xrightarrow{\mathrm{P} *} 0$.

Finally, if there does not exist a net $\delta_{\alpha}$ as assumed, then necessarily $X_{\alpha}$ is Borel measurable for the completion of ( $\Omega_{\alpha}, \mathcal{A}_{\alpha}, P_{\alpha}$ ) and is equal in law to $X$ for all sufficiently large $\alpha$. By a standard argument, there exists a Borel measurable map $Y_{\alpha}:\left(\Omega_{\alpha}, \mathcal{A}_{\alpha}\right) \mapsto \mathbb{D}$ with $\mathrm{P}_{*}\left(X_{\alpha}=Y_{\alpha}\right)=1$ for such $\alpha$ (Problem 1.2.10).

## Problems and Complements

1. Let $X_{n}$ and $X$ be maps into $\mathbb{R}$ with $X$ Borel measurable.
(i) $X_{n} \xrightarrow{\text { as* }} X$ if and only if $X_{n}^{*} \xrightarrow{\text { as }} X$ and $X_{n *} \xrightarrow{\text { as }} X$.
(ii) $X_{n} \rightsquigarrow X$ if and only if $X_{n}^{*} \rightsquigarrow X$ and $X_{n *} \rightsquigarrow X$.
[Hint: For (i) use $\left|X_{n}-X\right|^{*}=\left|X_{n}^{*}-X\right| \vee\left|X_{n *}-X\right|$. For (ii) suppose $X_{n} \rightsquigarrow X$. Let $\tilde{X}_{n}=X_{n} \circ \phi_{n} \xrightarrow{\text { as* }} \tilde{X}$ be almost sure representations. By (i) $\tilde{X}_{n}^{*} \xrightarrow{\text { as }} \tilde{X}$, whence $\tilde{X}_{n}^{*} \rightsquigarrow \tilde{X}$. For perfect $\phi_{n}$, one has $\tilde{X}_{n}^{*}=X_{n}^{*} \circ \phi_{n}$, and it follows that $\mathrm{E} f\left(\tilde{X}_{n}^{*}\right)=\mathrm{E} f\left(X_{n}^{*}\right)$, for every measurable $f$. So $X_{n}^{*} \rightsquigarrow X$. By considering the negatives of the functions, obtain $X_{n *} \rightsquigarrow X$. The converse follows from $\mathrm{P}\left(X_{n}^{*} \leq x\right) \leq \mathrm{P}^{*}\left(X_{n} \leq x\right) \leq \mathrm{P}\left(X_{n^{*}} \leq x\right)$, for every $x$.]
2. Let ( $\Omega_{n}, \mathcal{A}_{n}, P_{n}$ ) be the product of $n$ copies of a probability space ( $\Omega, \mathcal{A}, P$ ). Let $X: \Omega \mapsto \mathbb{R}$ be a fixed map, let $X_{i}=X$ for every $i$, and let $S_{n}: \Omega_{n} \mapsto \mathbb{R}$ be defined by $S_{n}\left(\omega_{1}, \ldots, \omega_{n}\right)=\sum_{i=1}^{n} X_{i}\left(\omega_{i}\right)$. Then the central limit theorem $S_{n} / \sqrt{n} \leadsto N(0,1)$ can hold only if $X$ is measurable for the $P$-completion of $\mathcal{A}$. Similarly, the law of large numbers $S_{n} / n \rightsquigarrow 0$ can hold only if $X$ is $P$-completion measurable.
[Hint: If $S_{n} / \sqrt{n} \leadsto N(0,1)$, then $\left(S_{n} / \sqrt{n}\right)^{*}$ converges weakly to the same limit. Since $S_{n}^{*}=\sum_{i=1}^{n} X_{i}^{*}$, this implies that the central limit theorem holds for the measurable maps $X_{i}^{*}$. This implies $\mathrm{E} X_{i}^{*}=0$ (and $\mathrm{E}\left(X_{i}^{*}\right)^{2}=1$ ). By an analogous argument, $\mathrm{E} X_{i *}=0$. Finally, $\mathrm{E}\left(X_{i}^{*}-X_{i *}\right)=0$ implies $X_{i}^{*}=X_{i *}$ almost surely.]
3. The following statements are not true:
(i) $X_{\alpha}$ measurable and $X_{\alpha} \xrightarrow{\text { as* }} 0$ imply $X_{\alpha} \xrightarrow{\mathrm{P}^{*}} 0$ (for general nets);
(ii) $X_{\alpha} \xrightarrow{\text { as* }} 0$ implies that $X_{\alpha}$ is asymptotically measurable (for general nets);
(iii) $X_{n} \xrightarrow{\text { as }} 0$ and $X_{n}$ is asymptotically measurable imply $X_{n} \xrightarrow{\text { as* }} X$.
[Hint: Let $A$ be the collection of all finite subsets of [ 0,1 ], directed through inclusion: $\alpha_{1} \leq \alpha_{2}$ if and only if $\alpha_{1} \subset \alpha_{2}$. Let $P$ be Lebesgue measure on the Borel sets of [ 0,1 ]. For (i) define $X_{\alpha}:[0,1] \mapsto[0,1]$ by $X_{\alpha}=1_{[0,1]-\alpha}$. Then $X_{\alpha}$ is Borel measurable, and $X_{\alpha}(\omega) \rightarrow 0$ for every $\omega$. However, $P\left(X_{\alpha}=1\right)=1$ for every $\alpha$, so $X_{\alpha}$ does not converge to zero in probability; in fact, $X_{\alpha} \xrightarrow{\text { P* }} 1$. Note that the dominated convergence theorem fails too, since $\mathrm{E} X_{\alpha}=1$ for every $\alpha$. For (ii) let $B$ be a subset of $[0,1]$ with $P_{*}(B)<P^{*}(B)$. Define $X_{\alpha}= 1_{[0,1]-\alpha} 1_{B}$. Then $\left|X_{\alpha}\right|^{*}=1_{[0,1]-\alpha}\left(1_{B}\right)^{*} \xrightarrow{\text { as } *} 0$, while $\mathrm{E}\left(X_{\alpha}\right)^{*}-\mathrm{E}\left(X_{\alpha}\right)_{*}= \mathrm{E}\left(1_{B}\right)^{*}-\mathrm{E}\left(1_{B}\right)_{*}$ does not converge to 0 . Finally, for (iii), let $I_{n}$ be the $n$th interval in the sequence $[0,1],[0,1 / 2],[1 / 2,1],[0,1 / 4], \ldots$ For $B_{n}$ as in Example 1.9.4, take $X_{n}=1_{I_{n}} 1_{B_{n}}$. Then $d\left(X_{n}, 0\right)^{*}=X_{n}^{*}=1_{I_{n}}$ converges to zero in probability and weakly, but not almost surely.]
4. For $\alpha$ running through a directed set, consider the statements
(i) $X_{\alpha} \xrightarrow{\text { au }} X$;
(ii) $\sup _{\beta \geq \alpha} d\left(X_{\beta}, X\right)^{*} \xrightarrow{\mathrm{P} *} 0$;
(iii) $X_{\alpha} \xrightarrow{\text { as* }} X$;
(iv) $X_{\alpha} \xrightarrow{\mathrm{P} *} X$.

The following implications are always true:
![](https://cdn.mathpix.com/cropped/bb2a681b-54b6-4ce4-8c2f-a3f7c0f2d98d-079.jpg?height=129&width=243&top_left_y=2020&top_left_x=623)

There is a counterexample to every implication that is not indicated in the diagram.
5. There exist directed sets that cannot index a net of strictly positive numbers that converges to zero. Equivalently, there exist directed sets $A$ such that, if $\left\{\delta_{\alpha}: \alpha \in A\right\}$ is a net of real numbers with $\delta_{\alpha} \rightarrow 0$, then $\delta_{\alpha}=0$ eventually.
[Hint: A trivial example is obtained by taking $A$ equal to a partially ordered set with a largest element; for instance, $A=\{1,2, \ldots, n\}$ with usual order, or $A=[0,1]$ with reversed natural order. For a nontrivial example, take $A$ equal to an uncountable, well-ordered set for which every section $\left\{\alpha: \alpha<\alpha_{0}\right\}$ is countable. Such sets exist provided one assumes the axiom of choice (and the well-ordering theorem), though it is hard to give a description of one. (See Munkres (1975), page 66.) If $\delta_{\alpha}$ is indexed by such a set and converges to zero without being zero eventually, then $\varepsilon_{\alpha}=\sup _{\beta \geq \alpha}\left|\delta_{\beta}\right|$ is strictly positive and converges monotonically to zero. By the well-ordering, each set $S_{i}= \left\{\alpha: \varepsilon_{\alpha} \leq 1 / i\right\}$ has a smallest element $\alpha_{i}$. Since the net $\varepsilon_{\alpha}$ is decreasing, it follows that $S_{i}=\left\{\alpha: \alpha \geq \alpha_{i}\right\}$. Since each $\varepsilon_{\alpha}$ is positive, there is for each $\alpha$ an $i$ with $\varepsilon_{\alpha}>1 / i$, that is, $\alpha<\alpha_{i}$. Then $A$ is covered by the sets $\left\{\alpha<\alpha_{i}\right\}$, but these are only countably many sets, each with countably many elements.]
6. Let $X_{\alpha}$ be maps indexed by a directed set that is trivial defined on complete probability spaces.
(i) If $X_{\alpha} \rightsquigarrow X$ and $X$ is separable, then $X_{\alpha}$ is Borel measurable and equal in law to $X$ eventually.
(ii) If $X_{\alpha} \xrightarrow{\text { au }} X$, then $\mathrm{P}_{*}\left(X_{\alpha}=X\right)=1$ eventually.
[Hint: For (i) use metrization of weak convergence to reduce $X_{\alpha} \rightsquigarrow X$ to convergence of a set of numbers. For (ii) set $\delta_{\alpha}=\mathrm{P}^{*}\left(d\left(X_{\alpha}, X\right)>0\right)$. Then $\delta_{\alpha} \rightarrow 0$. Indeed, for every $\varepsilon>0$ there is a set $B$ with $\sup _{\omega \in B} d\left(X_{\alpha}, X\right) \rightarrow 0$ and $\mathrm{P}(B)>1-\varepsilon$. Since the directed set is trivial, the supremum is zero for all sufficiently large $\alpha$, whence $\delta_{\alpha} \leq \varepsilon$ eventually. Finally, $\delta_{\alpha} \rightarrow 0$ and trivialness imply $\delta_{\alpha}=0$ eventually.]
7. Any directed set that is trivial indexes a weakly convergent net $X_{\alpha} \leadsto X_{\infty}$ with values in $\mathbb{R}$ for which there is no almost uniform representation: there is no net $\tilde{X}_{\alpha}$ and a $\tilde{X}_{\infty}$ with $\tilde{X}_{\alpha} \xrightarrow{\text { au }} \tilde{X}_{\infty}$ and $\mathrm{E}^{*} f\left(X_{\alpha}\right)=\mathrm{E}^{*} f\left(\tilde{X}_{\alpha}\right)$ for every $\alpha$ and bounded $f$.
[Hint: Take a Borel measure on $\mathbb{R}$ that can be extended in two different ways to a $\sigma$-field $\mathbb{D}$ that is strictly larger than the Borel sets. (Every $L$ for which there is a (nonmeasurable) set $B$ with $L^{*}(B)>L_{*}(B)$ does the job.) Let $L_{1}$ and $L_{2}$ be the extensions. Take $\left(\Omega_{\infty}, \mathcal{A}_{\infty}, P_{\infty}\right)=\left(\mathbb{R}, \mathbb{D}, L_{1}\right)$ and $\left(\Omega, \mathcal{A}_{\alpha}, P_{\alpha}\right)=\left(\mathbb{R}, \mathbb{D}, L_{2}\right)$ for every other $\alpha$; let both $X_{\alpha}$ and $X_{\infty}$ be the identity map. The almost uniform representations would be $\mathbb{D}$-measurable maps into $\mathbb{R} ; \tilde{X}_{\infty}$ would have law $L_{1}$, while the other $\tilde{X}_{\alpha}$ would have law $L_{2}$. But according to Problem 1.10.6, also $\tilde{X}_{\infty}=\tilde{X}_{\alpha}$ almost surely.]
8. Let $X_{n}$ and $X$ be Borel measurable elements in a metric space. For a fixed Borel set, define $Y_{n}$ to be $X_{n}$ if $X \in B$ and to be $X$ if $X \notin B$.
(i) If $X_{n} \xrightarrow{\mathrm{P}} X$, then $Y_{n} \xrightarrow{\mathrm{P}} X$.
(ii) If $X_{n} \leadsto X$, then not necessarily $Y_{n} \leadsto X$.
[Hint: For (ii) take $X$ distributed as $N(0,1), X_{n}=-X$, and $B=[0, \infty)$. Then $Y_{n}$ is nonnegative with probability 1.]

### 1.11

## Refinements

The continuous mapping theorems for the three modes of stochastic convergence considered so far can be refined to cover maps $g_{n}\left(X_{n}\right)$, rather than $g\left(X_{n}\right)$, for a fixed $g$. Then the $g_{n}$ should have a property that might be called asymptotic equicontinuity almost everywhere under the limit measure.

For simplicity, it will be assumed that the limit measure is separable, though this is not necessary for (iii) and can be replaced by other conditions for (i) and (ii) (Problem 1.11.1).
1.11.1 Theorem (Extended continuous mapping). Let $\mathbb{D}_{n} \subset \mathbb{D}$ and $g_{n}: \mathbb{D}_{n} \mapsto \mathbb{E}$ satisfy the following statements: if $x_{n} \rightarrow x$ with $x_{n} \in \mathbb{D}_{n}$ for every $n$ and $x \in \mathbb{D}_{0}$, then $g_{n}\left(x_{n}\right) \rightarrow g(x)$, where $\mathbb{D}_{0} \subset \mathbb{D}$ and $g: \mathbb{D}_{0} \mapsto \mathbb{E}$. Let $X_{n}$ be maps with values in $\mathbb{D}_{n}$, let $X$ be Borel measurable and separable, and take values in $\mathbb{D}_{0}$. Then
(i) $X_{n} \rightsquigarrow X$ implies that $g_{n}\left(X_{n}\right) \rightsquigarrow g(X)$;
(ii) $X_{n} \xrightarrow{\mathrm{P} *} X$ implies that $g_{n}\left(X_{n}\right) \xrightarrow{\mathrm{P} *} g(X)$;
(iii) $X_{n} \xrightarrow{\text { as* }} X$ implies that $g_{n}\left(X_{n}\right) \xrightarrow{\text { as* }} g(X)$.

Proof. Assume the weakest of the three assumptions: the one in (i) that $X_{n} \rightsquigarrow X$. Let $\mathbb{D}_{\infty}$ be the set of all $x$ for which there exists a sequence $x_{n}$ with $x_{n} \in \mathbb{D}_{n}$ and $x_{n} \rightarrow x$. First, $\mathrm{P}_{*}\left(X \in \mathbb{D}_{\infty}\right)=1$; second, the restriction of $g$ to $\mathbb{D}_{0} \cap \mathbb{D}_{\infty}$ is continuous; and third, if some subsequence satisfies $x_{n^{\prime}} \rightarrow x$ with $x_{n^{\prime}} \in \mathbb{D}_{n^{\prime}}$ for every $n^{\prime}$ and $x \in \mathbb{D}_{0} \cap \mathbb{D}_{\infty}$, then $g_{n^{\prime}}\left(x_{n^{\prime}}\right) \rightarrow g(x)$.

To see the first, invoke the almost sure representation theorem. If $\tilde{X}_{n} \xrightarrow{\text { as* }} \tilde{X}$ are representing versions, then the range of $\tilde{X}$ is contained in
$\mathbb{D}_{\infty}$ up to a null set, so $\mathrm{P}_{*}\left(X \in \mathbb{D}_{\infty}\right)=\mathrm{P}_{*}\left(\tilde{X} \in \mathbb{D}_{\infty}\right)=1$. For the third, let the subsequence $x_{n^{\prime}}$ be given. Since its limit $x$ is in $\mathbb{D}_{\infty}$, there is a sequence $y_{n} \rightarrow x$ with $y_{n} \in \mathbb{D}_{n}$ for every $n$. Fill out the subsequence $x_{n^{\prime}}$ to a whole sequence by putting $x_{n}=y_{n}$ if $n \notin\left\{n^{\prime}\right\}$. Then, by assumption, $g_{n}\left(x_{n}\right) \rightarrow g(x)$ along the whole sequence, so also along the subsequence. To prove the second, let $x_{m} \rightarrow x$ in $\mathbb{D}_{0} \cap \mathbb{D}_{\infty}$. For every $m$, there is a sequence $y_{m, n} \in \mathbb{D}_{n}$ with $y_{m, n} \rightarrow x_{m}$ as $n \rightarrow \infty$. Since $x_{m} \in \mathbb{D}_{0}$, then also $g_{n}\left(y_{m, n}\right) \rightarrow g\left(x_{m}\right)$. For every $m$, take $n_{m}$ such that both $\left|y_{m, n_{m}}-x_{m}\right|<1 / m$ and $\left|g_{n_{m}}\left(y_{m, n_{m}}\right)-g\left(x_{m}\right)\right|<1 / m$ and such that $n_{m}$ is increasing with $m$. Then $y_{m, n_{m}} \rightarrow x$, so $g_{n_{m}}\left(y_{m, n_{m}}\right) \rightarrow g(x)$. This implies $g\left(x_{m}\right) \rightarrow g(x)$.

For simplicity of notation, now write $\mathbb{D}_{0}$ for $\mathbb{D}_{0} \cap \mathbb{D}_{\infty}$. The limit variable $X$ may, without loss of generality, be assumed to take its values in $\mathbb{D}_{0}$. By the continuity property of $g$, the map $g(X)$ is then Borel measurable.
(i). Let $F$ be closed. Then

$$
\bigcap_{n=1}^{\infty} \overline{\bigcup_{m=n}^{\infty} g_{m}^{-1}(F)} \subset g^{-1}(F) \cup\left(\mathbb{D}-\mathbb{D}_{0}\right)
$$

Indeed, suppose $x$ is in the left side. Then for every $n$ there is $m_{n} \geq n$ and $x_{m_{n}} \in g_{m_{n}}^{-1}(F)$, with $d\left(x_{m_{n}}, x\right)<1 / n$. Thus there exists $x_{m_{n}^{\prime}} \in \mathbb{D}_{m_{n}^{\prime}}$, with $m_{n}^{\prime} \rightarrow \infty$ and $x_{m_{n}^{\prime}} \rightarrow x$. Then either $g_{m_{n}^{\prime}}\left(x_{m_{n}^{\prime}}\right) \rightarrow g(x)$ or $x \notin \mathbb{D}_{0}$. Because $F$ is closed, this implies $g(x) \in F$ or $x \notin \mathbb{D}_{0}$.

Now, for every fixed $k$, by the portmanteau theorem,

$$
\begin{aligned}
\limsup \mathrm{P}^{*}\left(g_{n}\left(X_{n}\right) \in F\right) & \leq \limsup \mathrm{P}^{*}\left(X_{n} \in \overline{\bigcup_{m=k}^{\infty} g_{m}^{-1}(F)}\right) \\
& \leq \mathrm{P}\left(X \in \overline{\bigcup_{m=k}^{\infty} g_{m}^{-1}(F)}\right)
\end{aligned}
$$

As $k \rightarrow \infty$, the last probability converges to $\mathrm{P}\left(X \in \bigcap_{k=1}^{\infty} \overline{\bigcup_{m=k}^{\infty} g_{m}^{-1}(F)}\right)$, which is smaller than or equal to $\mathrm{P}(g(X) \in F)$.
(ii). Fix $\varepsilon>0$. Choose $\delta_{n} \downarrow 0$ with $\mathrm{P}^{*}\left(d\left(X_{n}, X\right) \geq \delta_{n}\right) \rightarrow 0$. Let $B_{n}$ be the set of all $x$ for which there is $y \in \mathbb{D}_{n}$, with $d(y, x)<\delta_{n}$ and $e\left(g_{n}(y), g(x)\right)>\varepsilon$. Suppose $x \in B_{n}$ infinitely often. Then there is a sequence $x_{n_{m}} \in \mathbb{D}_{n_{m}}$, with $x_{n_{m}} \rightarrow x$ and $e\left(g_{n_{m}}\left(x_{n_{m}}\right), g(x)\right)>\varepsilon$, for every $m$. So $x \notin \mathbb{D}_{0}$. Conclude that $\lim \sup B_{n} \cap \mathbb{D}_{0}=\emptyset$. From the continuity of $g$, it is not hard to see that $B_{n} \cap \mathbb{D}_{0}$ is relatively open in $\mathbb{D}_{0}$ and hence relatively Borel. Consequently, $\mathrm{P}^{*}\left(X \in B_{n}\right) \rightarrow 0$ (Problem 1.2.18). Now

$$
\mathrm{P}^{*}\left(e\left(g_{n}\left(X_{n}\right), g(X)\right)>\varepsilon\right) \leq \mathrm{P}^{*}\left(X \in B_{n} \text { or } d\left(X_{n}, X\right) \geq \delta_{n}\right) \rightarrow 0 \text {. }
$$

(iii). It suffices to prove that $\sup _{m \geq n} e\left(g_{m}\left(X_{m}\right), g(X)\right) \xrightarrow{\mathrm{P} *} 0$. Choose $\delta_{n} \downarrow 0$ such that $\mathrm{P}^{*}\left(\sup _{m \geq n} d\left(X_{m}, X\right) \geq \delta_{n}\right) \rightarrow 0$. Define $B_{n}$ as the set of all $x$ such that there exists $m \geq n$ and $y \in \mathbb{D}_{m}$ with $d(y, x)<\delta_{n}$ and $e\left(g_{m}(y), g(x)\right)>\varepsilon$. Finish the proof along the lines of the proof of (ii).
1.11.2 Counterexample. One might think that in part (iii) of the previous theorem it is enough that $g_{n}\left(X_{n}(\omega)\right) \rightarrow g(X(\omega))$ for every $\omega \in \Omega$. This is not so. Take $\Omega_{n}=[0,1]$ with Borel sets and Lebesgue measure. Furthermore, set $X_{n}(\omega)=X(\omega)=\omega$, and let $g_{n}(\omega)=1_{B_{n}}(\omega)$ as in Example 1.9.4. Then $g_{n}\left(X_{n}(\omega)\right) \rightarrow 0$ for every $\omega$, but $\left|g_{n}\left(X_{n}\right)\right|^{*}=1$ for every $n$, so that $g_{n}\left(X_{n}\right)$ definitely does not converge to zero almost uniformly.

It is not difficult to find examples of weakly convergent nets $X_{\alpha} \rightsquigarrow X$ and unbounded continuous functions $f$ such that $\mathrm{E}^{*} f\left(X_{\alpha}\right)$ does not converge to $\mathrm{E} f(X)$. However, in many situations, such convergence for unbounded functions actually does hold true. Call a net of real-valued maps $X_{\alpha}$ asymptotically uniformly integrable if

$$
\lim _{M \rightarrow \infty} \lim \sup \mathrm{E}^{*}\left|X_{\alpha}\right|\left\{\left|X_{\alpha}\right|>M\right\}=0 .
$$

1.11.3 Theorem. Let $f: \mathbb{D} \mapsto \mathbb{R}$ be continuous at every point in a set $\mathbb{D}_{0}$. Let $X_{\alpha} \rightsquigarrow X$, where $X$ takes its values in $\mathbb{D}_{0}$.
(i) If $f\left(X_{\alpha}\right)$ is asymptotically uniformly integrable, then $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \operatorname{E} f(X)$.
(ii) If $\limsup \mathrm{E}^{*}\left|f\left(X_{\alpha}\right)\right| \leq \mathrm{E}|f(X)|<\infty$, then $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$.

Proof. For $M>0$, write $f^{M}$ for $f$ truncated to $[-M, M]$, that is, $f^{M}(x)=(f(x) \vee(-M)) \wedge M$. By the continuous mapping theorem, $f^{M}\left(X_{\alpha}\right) \rightsquigarrow f^{M}(X)$ as maps into the interval $[-M, M]$, for every fixed $M$. Since the identity function is bounded and continuous on this interval, one has $\mathrm{E}^{*} f^{M}\left(X_{\alpha}\right) \rightarrow \mathrm{E} f^{M}(X)$; similarly for $\left|f^{M}\right|$.

First consider (ii). If $y^{M}$ is an arbitrary real number $y$ truncated to $[-M, M]$, then $\left|y-y^{M}\right|=|y|-\left|y^{M}\right|$. Consequently, for every $M>0$,

$$
\begin{aligned}
\limsup \left|\mathrm{E}^{*} f\left(X_{\alpha}\right)-\mathrm{E}^{*} f^{M}\left(X_{\alpha}\right)\right| & \leq \limsup \mathrm{E}^{*}\left(\left|f\left(X_{\alpha}\right)\right|-\left|f^{M}\left(X_{\alpha}\right)\right|\right) \\
& \leq \mathrm{E}|f(X)|-\mathrm{E}\left|f^{M}(X)\right|
\end{aligned}
$$

Fix $M$ such that the right side is smaller than $\varepsilon>0$ and also $\mid \mathrm{E} f^{M}(X)- \mathrm{E} f(X) \mid<\varepsilon$. Then the net $\mathrm{E}^{*} f\left(X_{\alpha}\right)$ is eventually within distance $\varepsilon$ of $\mathrm{E} f^{M}(X)$, and so within distance $2 \varepsilon$ of $\mathrm{E} f(X)$.

For (i) note first that $\left.\left|\mathrm{E}^{*}\right| f\right|^{M}\left(X_{\alpha}\right)-\mathrm{E}^{*}|f|\left(X_{\alpha}\right) \mid$ is bounded above by $2 \mathrm{E}^{*}\left|f\left(X_{\alpha}\right)\right|\left\{\left|f\left(X_{\alpha}\right)\right|>M\right\}$. Fix some $\varepsilon>0$. For any $M$ such that $\limsup \mathrm{E}^{*}\left|f\left(X_{\alpha}\right)\right|\left\{\left|f\left(X_{\alpha}\right)\right|>M\right\}<\varepsilon$, the net $\mathrm{E}^{*}|f|\left(X_{\alpha}\right)$ is eventually within distance $2 \varepsilon$ of $\mathrm{E}|f|^{M}(X)$. This happens for all sufficiently large $M$. By monotone convergence, $\mathrm{E}|f|^{M}(X) \rightarrow \mathrm{E}|f|(X)$ as $M \rightarrow \infty$. So $\mathrm{E}^{*}|f|\left(X_{\alpha}\right) \rightarrow \mathrm{E}|f|(X)$. The asymptotic uniform integrability implies that the limit is finite. Finally, apply (ii) to obtain (i).
1.11.4 Example. If $X_{\alpha} \leadsto X$ in $\mathbb{R}$ and $\limsup \mathrm{E}^{*}\left|X_{\alpha}\right|^{p}<\infty$, then $\mathrm{E}^{*} X_{\alpha}^{q} \rightarrow \mathrm{E} X^{q}$ for every $q<p$ for which the statement makes sense. It suffices to note that $X_{\alpha}^{q}$ is asymptotically uniformly integrable, since $\limsup \mathrm{E}^{*}\left|X_{\alpha}\right|^{q}\left\{\left|X_{\alpha}\right|>M\right\} \leq M^{q-p} \limsup \mathrm{E}^{*}\left|X_{\alpha}\right|^{p}<\infty$.
1.11.5 Example. If $X_{\alpha} \rightsquigarrow X$ in $\mathbb{R}^{k}$ and every $X_{\alpha}$ has a multivariate Gaussian distribution, then $\mathrm{E}\left\|X_{\alpha}\right\|^{p} \rightarrow \mathrm{E}\|X\|^{p}$ for every $p>0$ and every norm on $\mathbb{R}^{k}$. The reason is that a Gaussian net can converge weakly only if the nets of means and covariances converge. Thus lim sup $\mathrm{E}^{*}\left\|X_{\alpha}\right\|^{p}<\infty$, for every $p>0$.
1.11.6 Example. If $\left|X_{\alpha}\right| \leq Z_{\alpha}$ for every $\alpha$ and $Z_{\alpha}$ is asymptotically uniformly integrable, then $X_{\alpha}$ is asymptotically uniformly integrable. In particular, the following dominated convergence theorem holds: if $X_{\alpha} \rightsquigarrow X$ in $\mathbb{R}$ and $\left|X_{\alpha}\right| \leq Z$ for every $\alpha$ and some $Z$ with $E^{*} Z<\infty$, then $\mathrm{E}^{*} X_{\alpha} \rightarrow \mathrm{E} X$.

## Problems and Complements

1. Separability of $X$ in the refined continuous mapping theorem 1.11.1 can be omitted from the conditions for (iii). If every $\mathbb{D}_{n}$ contains $\mathbb{D}_{0}$, it is not necessary for (i) and (ii) either. Furthermore, suppose the condition on $g_{n}: \mathbb{D}_{n} \mapsto \mathbb{E}$ is strengthened as follows: for every subsequence $n^{\prime}$, if $x_{n^{\prime}} \rightarrow x$ with $x_{n^{\prime}} \in \mathbb{D}_{n^{\prime}}$ and $x \in \mathbb{D}_{0}$, then $g_{n^{\prime}}\left(x_{n^{\prime}}\right) \rightarrow g(x)$. Then separability can be dropped for (ii) and replaced by the condition that $g(X)$ is Borel measurable for (i).
[Hint: The proof as given uses separability only to ensure that the set $\mathbb{D}_{\infty}$ has inner measure 1 under the limit. For (iii) this is always true. If $\mathbb{D}_{n}$ contains $\mathbb{D}_{0}$ for every $n$, then $\mathbb{D}_{\infty}$ trivially contains $\mathbb{D}_{0}$ and so always has inner measure 1. For (ii) the set $\mathbb{D}_{\infty}$ can be replaced by the set of all $x$ for which there is a subsequence $x_{n^{\prime}} \in \mathbb{D}_{n^{\prime}}$ with $x_{n^{\prime}} \rightarrow x$. Then the restriction of $g$ to $\mathbb{D}_{\infty} \cap \mathbb{D}_{0}$ is still continuous. Furthermore, since there is a subsequence such that $X_{n^{\prime}} \xrightarrow{\text { as* }} X$, the inner measure of $\mathbb{D}_{\infty}$ under $X$ is 1 and the proof applies as it stands. Finally, the proof of (i) does not use separability, but only the conditions as given.]

### 1.12

## Uniformity and Metrization

In principle, weak convergence is the pointwise convergence of "operators" $X_{\alpha}$ or $L_{\alpha}$ on the space $C_{b}(\mathbb{D})$. However, there is automatically uniform convergence over certain subsets. These subsets can be fairly big: equicontinuity and boundedness suffice. On the other hand, there also exist small (countable) subsets such that pointwise convergence on such a subset is automatically uniform, and equivalent to pointwise convergence on the whole of $C_{b}(\mathbb{D})$, i.e. weak convergence. For separable $\mathbb{D}$, it is even possible to pick such a countable subset that works for every $X_{\alpha}$ at the same time.
1.12.1 Theorem. Let $\mathcal{F} \subset C_{b}(\mathbb{D})$ be bounded and equicontinuous at every point $x$ in a set $\mathbb{D}_{0}$. If $X_{\alpha} \rightsquigarrow X$ where the limit $X$ is separable and takes its values in $\mathbb{D}_{0}$, then $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$ uniformly in $f \in \mathcal{F}$.

Proof. Add all Lipschitz functions with $|f(x)-f(y)| \leq d(x, y)$ that are bounded by 1 to $\mathcal{F}$. Then $\mathcal{F}$ is still bounded and equicontinuous on $\mathbb{D}_{0}$, and a new metric can be defined on $\mathbb{D}$ through

$$
e(x, y)=\sup _{f \in \mathcal{F}}|f(x)-f(y)|
$$

With respect to this metric, the class $\mathcal{F}$ is uniformly equicontinuous on the whole of $\mathbb{D}$. Also, as a consequence of the original equicontinuity, if $x_{n} \rightarrow x \in \mathbb{D}_{0}$ with respect to $d$, then $x_{n}$ converges with respect to $e$ to the same limit. Thus global continuity of $f: \mathbb{D} \mapsto \mathbb{R}$ with respect to $e$ implies continuity of $f$ with respect to $d$ at every $x \in \mathbb{D}_{0}$. If $f$ is also bounded, then $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$ by the continuous mapping theorem. Thus $X_{\alpha} \rightsquigarrow X$
also for $e$. Conclude that it is no loss of generality to assume that the original set $\mathcal{F}$ is uniformly equicontinuous on the whole of $\mathbb{D}$.

Viewed as maps into the completion $\overline{\mathbb{D}}$ of $\mathbb{D}$, the $X_{\alpha}$ satisfy $X_{\alpha} \rightsquigarrow X$ and form an asymptotically tight net. Fix $\varepsilon>0$. Let $K \subset \overline{\mathbb{D}}$ be a compact set with $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in K^{\delta}\right) \geq 1-\varepsilon$ for every $\delta>0$. Since it is uniformly continuous, every element of $\mathcal{F}$ can be extended to an element of $C_{b}(\overline{\mathbb{D}})$. The set of restrictions $\mathcal{F}_{K}$ to $K$ is totally bounded in $C_{b}(K)$ by the ArzelàAscoli theorem. Take finitely many balls of radius $\varepsilon>0$ in $C_{b}(K)$ that cover and intersect $\mathcal{F}_{K}$. Let $f_{1}, \ldots, f_{m}$ be the centers of the balls. By Tietze's theorem ${ }^{\ddagger}$, each $f_{i}$ can be extended to an element of $C_{b}(\overline{\mathbb{D}})$ of the same norm. Abusing notation, call the extensions $f_{1}, \ldots, f_{m}$ too. For sufficiently large $\alpha$, it is certainly true that $\left|\mathrm{E}^{*} f_{i}\left(X_{\alpha}\right)-\mathrm{E} f_{i}(X)\right|<\varepsilon$ for every $i$. For any $f \in \mathcal{F}$, there is an $f_{i}$ and $\delta>0$ with $\left|f(x)-f_{i}(x)\right|<\varepsilon$ for all $x \in K^{\delta}$. Then for sufficiently large $\alpha$, one has $\left|\mathrm{E}^{*} f\left(X_{\alpha}\right)-\mathrm{E} f(X)\right|<3 \varepsilon+4 \varepsilon M$ if $M-\varepsilon$ is bigger than the uniform bound on $\mathcal{F}$.
1.12.2 Theorem. For every separable subset $\mathbb{D}_{0} \subset \mathbb{D}$, there is a countable, uniformly equicontinuous, and bounded collection $\mathcal{F} \subset C_{b}(\mathbb{D})$ such that the following statements are equivalent for every Borel measurable $X$ with $\mathrm{P}\left(X \in \mathbb{D}_{0}\right)=1$ :
(i) $X_{\alpha} \leadsto X$;
(ii) $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$ for every $f \in \mathcal{F}$;
(iii) $\mathrm{E}^{*} f\left(X_{\alpha}\right) \rightarrow \mathrm{E} f(X)$ uniformly in $f \in \mathcal{F}$.
1.12.3 Addendum. The collection $\mathcal{F}$ can be taken equal to the set of functions of the form

$$
f(x)=q\left(1-p_{1} d\left(x, s_{1}\right)\right)^{+} \vee \cdots \vee\left(1-p_{k} d\left(x, s_{k}\right)\right)^{+}
$$

where $k \in \mathbb{N} ; s_{1}, \ldots, s_{k}$ range over a countable, dense subset of $\mathbb{D}_{0} ; q \in \mathbb{Q}$; and each $p_{i} \in \mathbb{Q}^{+}$, with $|q| \leq 1$ and $|q|\left(p_{1} \vee \cdots \vee p_{k}\right) \leq 1$.

Proof. The collection $\mathcal{F}$ as suggested in the addendum is uniformly bounded, and every $f \in \mathcal{F}$ is Lipschitz continuous with Lipschitz constant smaller than 1. By Theorem 1.12.1, statement (i) implies (iii), which trivially implies (ii). Assume (ii), and let $G$ be open. Let $S$ be a countable, dense subset of $\mathbb{D}_{0}$. Then

$$
1_{G}(y)=\sup \left\{f(y): 0 \leq f \leq 1_{G}, f(x)=(1-p d(x, s))^{+}, p \in \mathbb{Q}^{+}, s \in S\right\}
$$

for every $y \in \mathbb{D}_{0}$. Order the countably many functions in this supremum in a sequence, and let $f_{m}$ be the maximum of the first $m$ functions. Then $0 \leq f_{m} \uparrow 1_{G}$ on $\mathbb{D}_{0}$. Now, for fixed $m$, it holds that $\liminf \mathrm{P}_{*}\left(X_{\alpha} \in G\right) \geq \liminf \mathrm{E}_{*} f_{m}\left(X_{\alpha}\right)=\mathrm{E} f_{m}(X)$, because every $f_{m}$ is a multiple of a function in $\mathcal{F}$. Letting $m \rightarrow \infty$ completes the proof.

[^13]A consequence of the previous results is that weak convergence to separable limits is "metrizable." Let $\mathrm{BL}_{1}$ be the set of all real functions on $\mathbb{D}$ with a Lipschitz norm bounded by 1 : for instance, all $f$ with $\|f\|_{\infty} \leq 1$ and $|f(x)-f(y)| \leq d(x, y)$, for every $x, y$. Then $X_{\alpha} \rightsquigarrow X$, where $X$ is Borel measurable and separable if and only if

$$
\sup _{f \in \mathrm{BL}_{1}}\left|\mathrm{E}^{*} f\left(X_{\alpha}\right)-\mathrm{E} f(X)\right| \rightarrow 0
$$

In particular, weak convergence of separable Borel measures on a metric space is metrizable; for instance, by the metric

$$
d_{\mathrm{BL}}\left(L_{1}, L_{2}\right)=\sup _{f \in \mathrm{BL}_{1}}\left|\int f d L_{1}-\int f d L_{2}\right|
$$

This is called the bounded Lipschitz metric. ${ }^{b}$
1.12.4 Theorem. Weak convergence of separable Borel probability measures on a metric space $\mathbb{D}$ corresponds to a topology that is metrizable by the bounded Lipschitz metric. The set of all separable Borel probability measures is complete under this metric if and only if $\mathbb{D}$ is complete. This set is separable for the weak topology if and only if $\mathbb{D}$ is separable.

Proof. A Cauchy sequence is always totally bounded. A set of separable Borel measures on a complete metric space that is totally bounded for the bounded Lipschitz metric is relatively compact for the weak topology (Problem 1.12.1). This means that every sequence has a converging subsequence. A Cauchy sequence with a converging subsequence converges itself.

## Problems and Complements

1. (Uniform tightness and weak compactness of a set of Borel measures) Call a set $\mathcal{L}$ of Borel probability measures on a metric space uniformly tight if, for every $\varepsilon>0$, there exists a compact $K$ with $L(K) \geq 1-\varepsilon$ for every $L \in K$. The following statements are equivalent for a collection of separable Borel measures on a complete metric space:
(i) $\mathcal{L}$ is totally bounded for the bounded Lipschitz metric;
(ii) $\mathcal{L}$ is uniformly tight;
(iii) $\mathcal{L}$ is relatively compact.

In (iii) relatively compact may be taken to mean either that every net in $\mathcal{L}$ has a weakly convergent subnet or that every sequence in $\mathcal{L}$ has a weakly convergent subsequence. Thus $\mathcal{L}$ is compact for the weak topology if and only it is uniformly tight and contains all its limit points.

[^14][Hint: Prohorov's theorem implies that the second statement implies the third. Relative compactness implies total boundedness for any semimetric space. It suffices to show that (i) implies (ii). For any Borel set $B$, the function $f(x)=\left(1-\varepsilon^{-1} d(x, B)\right)^{+}$has Lipschitz constant $\varepsilon^{-1}$ and is sandwiched between $1_{B}$ and $1_{B^{\varepsilon}}$. Deduce that, for any probability measures $L$ and $L^{\prime}$, $L^{\prime}\left(B^{\varepsilon}\right) \geq L(B)-\varepsilon^{-1} d_{\mathrm{BL}}\left(L, L^{\prime}\right)$. Fix $\delta>0$. Take a finite set $\mathcal{L}_{0} \subset \mathcal{L}$ of measures with $\mathcal{L} \subset \mathcal{L}_{0}^{\delta^{2}}$. For every $L_{0} \in \mathcal{L}_{0}$, take a compact with probability at least $1-\delta$. Let $F$ be the union of the compacts, and take a finite set $G$ with $F \subset G^{\delta}$. Then, for every $L \in \mathcal{L}, L\left(G^{2 \delta}\right) \geq L_{0}\left(G^{\delta}\right)-\delta^{-1} d_{\mathrm{BL}}\left(L, L_{0}\right)$, which is at least $1-2 \delta$ for some $L_{0}$. Take $K$ equal to the closure of $\cap_{m=1}^{\infty} G^{\varepsilon 2^{-m}}$. Then $K$ is totally bounded and complete, hence compact, with $L(K) \geq 1-\varepsilon$.]
2. (Completeness of the bounded Lipschitz metric) The set of all separable Borel probability measures on a complete metric space is complete for the bounded Lipschitz metric.
[Hint: A Cauchy sequence is always totally bounded. According to Problem 1.12.1, a totally bounded set for the bounded Lipschitz metric is relatively compact. A Cauchy sequence with a converging subsequence converges itself.]
3. A collection of separable Borel measures $\mathcal{L}$ on a complete metric space is compact for the weak topology if and only if it is uniformly tight and contains the limit of every converging sequence in $\mathcal{L}$.
4. (A converse of Prohorov's theorem) Let the net $X_{\alpha}$ be relatively compact with all limit points concentrating on a fixed Polish subset $\mathbb{D}_{0} \subset \mathbb{D}$. Then $X_{\alpha}$ is asymptotically tight.
[Hint: Use "metrizability" of weak convergence to a separable limit to see that the set of all limit points is compact for the weak topology. (The proof is the same as for the proposition that the set of limit points of a relatively compact net in a metric space is compact.) Next use Problem 1.12.1.]
5. (Lipschitz functions) For a Lipschitz function $f: \mathbb{D} \mapsto \mathbb{R}$, define $\|f\|_{l}= \sup \{|f(x)-f(y)| / d(x, y): d(x, y) \neq 0\}$. This is equal to the smallest $c$ for which $|f(x)-f(y)| \leq c d(x, y)$, for every $x, y$. The expressions $\|f\|_{\infty}+\|f\|_{l}$ and $\|f\|_{\infty} \vee\|f\|_{l}$ define norms on the set of all Lipschitz functions on $\mathbb{D}$. They are equivalent and make the Lipschitz functions into a Banach space.

## 1 <br> Notes

1.2. Outer integrals and measurability are well known in probability theory. The minimal measurable cover is also the essential infimum of the collection of functions in the definition of $\mathrm{E}^{*} T$; see, e.g., Chow and Teicher (1978), page 190. Measurable cover or envelope functions were studied by Blumberg (1935) and then again independently by Eames and May (1967). Many parts of Lemma 1.2.2 are contained in May (1973), Dudley and Philipp (1983), Dudley (1984), and Dudley (1985). Perfect functions were introduced by Hoffmann-Jørgensen (1984, 1991).
1.3. Convergence in distribution of random variables in Euclidean spaces is an old concept. The study of weak convergence on abstract spaces started in the late 1940s and early 1950s with the study of the empirical process and the partial sum process by Doob (1949) and Donsker (1951, 1952). Prohorov (1956), Le Cam (1957), and Skorokhod (1956) gave a general theory for separable metric spaces. Billingsley (1968) and Parthasarathy (1967) have become standard references. The measurability problems were first ignored and then were solved through the introduction of "Skorokhod's" topology on $D[0,1]$. The more elegant solution to work with measurability in the ball $\sigma$-field was introduced by Dudley (1966). His stronger version of Prohorov's theorem and characterization of tightness for nonseparable spaces was crucial for a more general development of weak convergence of the empirical process. Apparently, it went largely unnoticed until Gaenssler (1983) and Pollard (1984) showed the importance of the theory.

The more general approach to drop measurability altogether and work
with outer integrals, which we follow here, is due to Hoffmann-Jørgensen (1984), Chapter 7; see Hoffmann-Jørgensen (1991). Hoffmann-Jørgensen's approach was developed further in a series of papers by Andersen (1985) and Andersen and Dobrić $(1987,1988)$. We have restricted our treatment to the weak convergence of measures on metric spaces. For various aspects of weak convergence theory on general topological spaces (which is the framework frequently chosen by physicists and probabilists studying interacting particle systems), see Le Cam (1957), Varadarajan (1961), Smolyanov and Fomin (1976), and Mitoma (1983).
1.4. The results in this section are classical in the case of measurable random elements, but were apparently first proved in the nonmeasurable setting by Van der Vaart and Wellner (1989).
1.5. Theorem 1.5.7 was given by Andersen and Dobrić (1987); see their Theorem 2.12, page 167. They built on results of Dudley (1984, 1985) and Hoffmann-Jørgensen (1984). Lemma 1.5.9 originated with Dudley (1966, 1973). The first published proof is apparently that of Andersen and Dobrić (1987), Theorem 3.2, page 169.
1.6. For the function spaces $C[0, \infty)$ and $D[0, \infty)$, results similar to those in this section were obtained by Stone (1963), Whitt (1970), Lindvall (1973), and Kim and Pollard (1990).
1.7. The failure of measurability of the uniform empirical process as a process in $D[0,1]$ with the uniform metric and Borel $\sigma$-field (Problem 1.7.3) was pointed out by Chibisov (1965); see Billingsley (1968), Section 18, pages 150-153, for a discussion. Dudley (1966, 1967a) initiated the study of weak convergence based on the ball $\sigma$-field. This theory was studied further by Wichura (1968), Gaenssler (1983), and Pollard (1984). Dudley (1978a, 1984) applied the theory of analytic sets to establish measurability properties in empirical process theory and introduced the concept of a class of functions that is "image-admissible-Suslin via a Suslin measurable space." For a general introduction to the theory of analytic sets, including a proof of the projection theorem and references to the literature, see Cohn (1980), Chapter 8. For a thorough treatment, see also Hoffmann-Jørgensen (1970).
1.8. The basic result of this section goes back at least to Prohorov (1956); see his Theorem 1.13, page 171. For related results and further development, see Parthasarathy (1967), Chapter 6. For an application to tests of independence for directional data, see Jupp and Spurr (1985).

The characterization of tightness as approximate finite-dimensionality plus boundedness can be extended to general Banach spaces. See, for instance, Araujo and Giné (1980).
1.9. This section, including most of Lemma 1.9.3 and the Counterexample 1.9.4, is based on Dudley (1985). The continuous mapping theorem 1.9.5 extends the corresponding theorem in the classical theory. For a study of continuous functions for limit theorems in $C[0,1], D[0,1], C[0, \infty)$, and $D[0, \infty)$, see Whitt (1980). Theorem 1.9.6 is new.
1.10. A precursor of the "Skorokhod construction" theorem 1.10.3 is due to Hammersley (1952). Hammersley showed that if a sequence of random variables converges in distribution, then there is a construction of a sequence of random variables and a limit random variable with the same distributions on a common probability space for which convergence in probability holds. Constructions of almost surely convergent versions of processes that converge weakly apparently began with Skorokhod (1956) for processes with values in a complete separable metric space. Dudley (1968) removed completeness as a hypothesis, and Wichura (1970) proved a Skorokhod type result without separability. The first constructions were based on embedding in Brownian motion. The potential uses of such constructions in statistics were made clear by Pyke (1969, 1970). Billingsley (1971) gave a nice proof of Skorokhod's theorem for complete and separable spaces. Theorem 1.10.4 extends these results within the framework of the Hoffmann-Jørgensen weak convergence theory, with almost sure convergence replaced by outer almost sure convergence. For sequences, the theorem is due to Dudley (1985), who shows that $\tilde{\Omega}$ can be taken equal to the product of the $\Omega_{\alpha}$ and one copy of [ 0,1 ], which is more economical than the space that is constructed here. Proposition 1.10.12 is due to Le Cam (1989). Exercise 1.10.2 is from Dudley (1984); see Theorem 3.3.1, page 25. Dudley and Philipp (1983) use a strong approximation approach to convergence of general empirical processes in order to avoid measurability difficulties.
1.11. The extended continuous mapping theorem 1.11.1 originated with Prohorov (1956) and continued with H. Rubin [see Anderson (1963) and Billingsley (1968), page 34, and Topsoe (1967a, 1967b)]. The current extension to nonmeasurable random elements in Theorem 1.11.1 is used by Wellner (1989) in connection with the delta-method for Hadamard differentiable functions.
1.12. The metrization of convergence of laws began with Lévy; he provided a metric for convergence of laws on the real line; see Gnedenko and Kolmogorov (1954), Chapter 2, for a treatment of the Lévy metric. Prohorov (1956) defined a generalization, now called the Prohorov metric, and showed that it metrized weak convergence of distributions on complete, separable metric spaces. See Dudley (1989), Section 11.3, for a summary of this and other metrics. Uniformity of weak convergence over classes of functions was investigated by Ranga Rao (1962) and Topsoe (1967a). Fortet and Mourier (1953) introduced the bounded Lipschitz metric $d_{\mathrm{BL}}$, and Dudley (1966,
1968) studied it further. That weak convergence in the Hoffmann-Jørgensen theory to a Borel measurable, separable limit is equivalent to convergence of the bounded Lipschitz distance was proved independently by Dudley (1990) and Van der Vaart and Wellner (1989).

PART 2
Empirical Processes

## 2.1

## Introduction

This part is concerned with convergence of a particular type of random map: the empirical process. The empirical measure $\mathbb{P}_{n}$ of a sample of random elements $X_{1}, \ldots, X_{n}$ on a measurable space ( $\mathcal{X}, \mathcal{A}$ ) is the discrete random measure given by $\mathbb{P}_{n}(C)=n^{-1} \#\left(1 \leq i \leq n: X_{i} \in C\right)$. Alternatively (if points are measurable), it can be described as the random measure that puts mass $1 / n$ at each observation. We shall frequently write the empirical measure as the linear combination $\mathbb{P}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{X_{i}}$ of the dirac measures at the observations.

Given a collection $\mathcal{F}$ of measurable functions $f: \mathcal{X} \rightarrow \mathbb{R}$, the empirical measure induces a map from $\mathcal{F}$ to $\mathbb{R}$ given by

$$
f \mapsto \mathbb{P}_{n} f .
$$

Here, we use the abbreviation $Q f=\int f d Q$ for a given measurable function $f$ and signed measure $Q$. Let $P$ be the common distribution of the $X_{i}$. The centered and scaled version of the given map is the $\mathcal{F}$-indexed empirical process $\mathbb{G}_{n}$ given by

$$
f \mapsto \mathbb{G}_{n} f=\sqrt{n}\left(\mathbb{P}_{n}-P\right) f=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(f\left(X_{i}\right)-P f\right)
$$

Frequently the signed measure $\mathbb{G}_{n}=n^{-1 / 2} \sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right)$ will be identified with the empirical process.

For a given function $f$, it follows from the law of large numbers and the central limit theorem that

$$
\begin{aligned}
& \mathbb{P}_{n} f \xrightarrow{\text { as }} P f \\
& \mathbb{G}_{n} f \leadsto N\left(0, P(f-P f)^{2}\right),
\end{aligned}
$$

provided $P f$ exists and $P f^{2}<\infty$, respectively. This part is concerned with making these two statements uniform in $f$ varying over a class $\mathcal{F}$.

Classical empirical process theory concerns the special cases when the sample space $\mathcal{X}$ is the unit interval in $[0,1]$, the real line $\mathbb{R}$, or $\mathbb{R}^{d}$ and the indexing collection $\mathcal{F}$ is taken to be the set of indicators of left half-lines in $\mathbb{R}$ or lower-left orthants in $\mathbb{R}^{d}$. In this part we are concerned with empirical measures and processes indexed by these classes of functions $\mathcal{F}$, but also many others, including indicators of half-spaces, balls, ellipsoids, and other sets in $\mathbb{R}^{d}$, classes of smooth functions from $\mathbb{R}^{d}$ to $\mathbb{R}$, and monotone functions.

With the notation $\|Q\|_{\mathcal{F}}=\sup \{|Q f|: f \in \mathcal{F}\}$, the uniform version of the law of large numbers becomes

$$
\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}} \rightarrow 0
$$

where the convergence is in outer probability or is outer almost surely. A class $\mathcal{F}$ for which this is true is called a Glivenko-Cantelli class, or also $P$-Glivenko-Cantelli class to bring out the dependence on the underlying measure $P$.

In order to discuss a uniform version of the central limit theorem, it is assumed that

$$
\sup _{f \in \mathcal{F}}|f(x)-P f|<\infty, \quad \text { for every } x
$$

Under this condition the empirical process $\left\{\mathbb{G}_{n} f: f \in \mathcal{F}\right\}$ can be viewed as a map into $\ell^{\infty}(\mathcal{F})$. Consequently, it makes sense to investigate conditions under which

$$
\begin{equation*}
\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right) \rightsquigarrow \mathbb{G}, \quad \text { in } \ell^{\infty}(\mathcal{F}), \tag{2.1.1}
\end{equation*}
$$

where the limit $\mathbb{G}$ is a tight Borel measurable element in $\ell^{\infty}(\mathcal{F})$. A class $\mathcal{F}$ for which this is the true is called a Donsker class, or $P$-Donsker class to be more complete.

The nature of the limit process $\mathbb{G}$ follows from consideration of its marginal distributions. The marginals $\mathbb{G}_{n} f$ converge if and only if the functions $f$ are square-integrable. In that case the multivariate central limit theorem yields that for any finite set $f_{1}, \ldots, f_{k}$ of functions

$$
\left(\mathbb{G}_{n} f_{1}, \ldots, \mathbb{G}_{n} f_{k}\right) \rightsquigarrow N_{k}(0, \Sigma),
$$

where the $k \times k$-matrix $\Sigma$ has $(i, j)$ th element $P\left(f_{i}-P f_{i}\right)\left(f_{j}-P f_{j}\right)$. Since convergence in $\ell^{\infty}(\mathcal{F})$ implies marginal convergence, it follows that the
limit process $\{\mathbb{G} f: f \in \mathcal{F}\}$ must be a zero-mean Gaussian process with covariance function

$$
\begin{equation*}
\mathrm{E} \mathbb{G} f_{1} \mathbb{G} f_{2}=P\left(f_{1}-P f_{1}\right)\left(f_{2}-P f_{2}\right)=P f_{1} f_{2}-P f_{1} P f_{2} \tag{2.1.2}
\end{equation*}
$$

According to Lemma 1.5.3, this and tightness completely determine the distribution of $\mathbb{G}$ in $\ell^{\infty}(\mathcal{F})$. It is called the $P$-Brownian bridge.

An application of Slutsky's lemma shows that every Donsker class is a Glivenko-Cantelli class in probability. In fact, this is also true with "in probability" replaced by "almost surely." Conversely, not every GlivenkoCantelli class is Donsker, but the collection of all Donsker classes contains many members of interest. Many classes are also universally Donsker, which is defined as $P$-Donsker for every probability measure $P$ on the sample space.
2.1.3 Example (Empirical distribution function). Let $X_{1}, \ldots, X_{n}$ be i.i.d. random elements in $\mathbb{R}^{d}$, and let $\mathcal{F}$ be the collection of all indicator functions of lower rectangles $\left\{1\{(-\infty, t]\}: t \in \overline{\mathbb{R}}^{d}\right\}$. The empirical measure indexed by $\mathcal{F}$ can be identified with the empirical distribution function

$$
t \mapsto \mathbb{P}_{n} 1\{(-\infty, t]\}=\frac{1}{n} \sum_{i=1}^{n} 1\left\{X_{i} \leq t\right\}
$$

In this case, it is natural to identify $f=1\{(-\infty, t]\}$ with $t \in \overline{\mathbb{R}}^{d}$ and the space $\ell^{\infty}(\mathcal{F})$ with the space $\ell^{\infty}\left(\overline{\mathbb{R}}^{d}\right)$. Of course, the sample paths of the empirical distribution function are all contained in a much smaller space (such as a $D[-\infty, \infty]$ ), but as long as this space is equipped with the supremum metric, this is irrelevant for the central limit theorem.

It is known from classical results (for the line by Donsker) that the class of lower rectangles is Donsker for any underlying law $P$ of $X_{1}, \ldots, X_{n}$. These classical results are a simple consequence of the results of this part. Moreover, with no additional effort, analogous results are obtained for the empirical process indexed by the collection of closed balls, rectangles, halfspaces, and ellipsoids, as well as many collections of functions.
2.1.4 Example (Empirical process indexed by sets). Let $\mathcal{C}$ be a collection of measurable sets in the sample space ( $\mathcal{X}, \mathcal{A}$ ), and take the class of functions $\mathcal{F}$ equal to the set of indicator functions of sets in $\mathcal{C}$. This leads to the empirical distribution indexed by sets

$$
C \mapsto \mathbb{P}_{n}(C)=\frac{1}{n} \#\left(X_{i} \in C\right)
$$

In this case, it is convenient to make the identification $C \leftrightarrow 1\{C\}$, both in notation and in terminology. Hence $\mathcal{C}$ is called a Glivenko-Cantelli class if $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{C}}$ converges to zero in outer probability or outer almost surely, and $\mathcal{C}$ is a Donsker class if $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges weakly to a tight limit in $\ell^{\infty}(\mathcal{C})$.

An unfortunate technicality of the preceding definitions of GlivenkoCantelli and Donsker classes is that they depend on the underlying probability space on which $X_{1}, X_{2}, \ldots$ are defined, because this determines the outer expectations. In this book, unless specified otherwise, this technicality is resolved by always assuming that $X_{1}, X_{2}, \ldots$ are defined canonically. Thus the underlying probability space is the product space ( $\mathcal{X}^{\infty}, \mathcal{B}^{\infty}, P^{\infty}$ ), and $X_{i}$ is the projection onto the $i$ th coordinate. ${ }^{\dagger}$

### 2.1.1 Overview of Chapters 2.3-2.14

Whether a given class $\mathcal{F}$ is a Glivenko-Cantelli or Donsker class depends on the size of the class. A finite class of square integrable functions is always Donsker, while at the other extreme the class of all square integrable, uniformly bounded functions is almost never Donsker. A relatively simple way to measure the size of a class $\mathcal{F}$ is to use entropy numbers. The $\varepsilon$-entropy of $\mathcal{F}$ is essentially the logarithm of the number of "balls" or "brackets" of size $\varepsilon$ needed to cover $\mathcal{F}$. From this informal definition, it is already clear that the entropy numbers increase as $\varepsilon$ decreases to zero. Simple sufficient conditions for a class to be Glivenko-Cantelli or Donsker can be given in terms of the rate of increase as $\varepsilon$ tends to zero. The main results on GlivenkoCantelli classes are given in Chapter 2.4, and the main results on Donsker classes are given in Chapter 2.5. These chapters are the core of Part 2.

For an informal description of the main results, we first define entropy with and without bracketing. Let $(\mathcal{F},\|\cdot\|)$ be a subset of a normed space of real functions $f: \mathcal{X} \mapsto \mathbb{R}$ on some set. We are mostly thinking of $L_{r}(Q)$ spaces for probability measures $Q$.
2.1.5 Definition (Covering numbers). The covering number $N(\varepsilon, \mathcal{F},\|\cdot\|)$ is the minimal number of balls $\{g:\|g-f\|<\varepsilon\}$ of radius $\varepsilon$ needed to cover the set $\mathcal{F}$. The centers of the balls need not belong to $\mathcal{F}$, but they should have finite norms. The entropy (without bracketing) is the logarithm of the covering number.
2.1.6 Definition (Bracketing numbers). Given two functions $l$ and $u$, the bracket $[l, u]$ is the set of all functions $f$ with $l \leq f \leq u$. An $\varepsilon$-bracket is a bracket $[l, u]$ with $\|u-l\|<\varepsilon$. The bracketing number $N_{[]}(\varepsilon, \mathcal{F},\|\cdot\|)$ is the minimum number of $\varepsilon$-brackets needed to cover $\mathcal{F}$. The entropy with bracketing is the logarithm of the bracketing number. In the definition of the bracketing number, the upper and lower bounds $u$ and $l$ of the brackets need not belong to $\mathcal{F}$ themselves but are assumed to have finite norms.

The norms that will be of interest later, such as the $L_{r}(Q)$-norms, all possess the (Riesz) property: for a pair of functions, if $|f| \leq|g|$, then

[^15]$\|f\| \leq\|g\|$. For such norms, if $f$ is in the $2 \varepsilon$-bracket $[l, u]$, then it is in the ball of radius $\varepsilon$ around $(l+u) / 2$. Thus covering and bracketing numbers are related by
$$
N(\varepsilon, \mathcal{F},\|\cdot\|) \leq N_{[]}(2 \varepsilon, \mathcal{F},\|\cdot\|)
$$

In general, there is no converse inequality, so that bracketing numbers may be bigger than covering numbers. (A notable exception is the uniform norm, for which the previous inequality is an identity.) However, sufficient conditions for the theorems of interest in terms of bracketing numbers can often be stated using only a single norm on $\mathcal{F}$, while sufficient conditions in terms of entropy numbers usually involve many norms. This is intuitively obvious since brackets control a function $f(x)$ pointwise in its argument $x$, rather than in norm. As a consequence, sufficient conditions in terms of bracketing numbers or covering numbers are unrelated in general. Both are of interest.

We shall write $N\left(\varepsilon, \mathcal{F}, L_{r}(Q)\right)$ for covering numbers relative to the $L_{r}(Q)$-norm

$$
\|f\|_{Q, r}=\left(\int|f|^{r}\right)^{1 / r}
$$

This is similar for bracketing numbers. An envelope function of a class $\mathcal{F}$ is any function $x \mapsto F(x)$ such that $|f(x)| \leq F(x)$, for every $x$ and $f$. The minimal envelope function is $x \mapsto \sup _{f}|f(x)|$. It will usually be assumed that this function is finite for every $x$. The uniform entropy numbers (relative to $L_{r}$ ) are defined as

$$
\sup _{Q} \log N\left(\varepsilon\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right)
$$

where the supremum is over all probability measures $Q$ on $(\mathcal{X}, \mathcal{A})$, with $0<Q F^{r}<\infty .^{\ddagger}$

In Chapter 2.4, two Glivenko-Cantelli theorems are given, based on entropy with and without bracketing, respectively. The first theorem asserts that $\mathcal{F}$ is $P$-Glivenko-Cantelli if

$$
N_{[]}\left(\varepsilon, \mathcal{F}, L_{1}(P)\right)<\infty, \quad \text { for every } \varepsilon>0
$$

The proof of this theorem is elementary and extends the usual proof of the classical Glivenko-Cantelli theorem for the empirical distribution function. The second theorem is more complicated but has a simple corollary involving the uniform covering numbers. A class $\mathcal{F}$ is $P$-Glivenko-Cantelli if it is $P$-measurable with envelope $F$ such that $P^{*} F<\infty$ and satisfies

$$
\sup _{Q} N\left(\varepsilon\|F\|_{Q, 1}, \mathcal{F}, L_{1}(Q)\right)<\infty, \quad \text { for every } \varepsilon>0
$$

The second theorem requires the assumption that $\mathcal{F}$ is a " $P$-measurable class," a concept that is defined in Definition 2.3.3. The presence of this

[^16]measurability hypothesis is a consequence of the way uniform entropy is used to control suprema via "randomization by Rademacher random variables" (or "symmetrization") together with the lack of a general version of Fubini's theorem for outer integrals. This same type of additional measurability hypothesis also enters in the corresponding Donsker theorems with uniform entropy hypotheses. Without these hypotheses, the theorems are false, but on the other hand it requires some effort to construct a class for which the hypotheses fail. Thus, in applications, this type of measurability will hardly ever play a role.

The method of symmetrization is discussed in Chapter 2.3 together with measurability conditions. This section is a necessary preparation for the uniform entropy Glivenko-Cantelli and Donsker theorems in Chapters 2.4 and 2.5. The theorems that are proved with bracketing do not use symmetrization and do not need measurability hypotheses.

One of the two Donsker theorems proved in Chapter 2.5 uses bracketing entropy. A slightly simpler version of this theorem asserts that a class $\mathcal{F}$ of functions is $P$-Donsker under an integrability condition on the $L_{2}(P)$ entropy with bracketing. A class $\mathcal{F}$ of measurable functions is $P$-Donsker if

$$
\int_{0}^{\infty} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon<\infty
$$

The other Donsker theorem in this chapter asserts that a class $\mathcal{F}$ of functions is $P$-Donsker under a similar condition on uniform entropy numbers. If $\mathcal{F}$ is class of functions such that

$$
\begin{equation*}
\int_{0}^{\infty} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon<\infty \tag{2.1.7}
\end{equation*}
$$

then $\mathcal{F}$ is $P$-Donsker for every probability measure $P$ such that $P^{*} F^{2}<\infty$ for some envelope function $F$ and for which certain measurability hypotheses are satisfied. The integral conditions both measure the rate at which the entropy grows as $\varepsilon$ decreases to zero. Note that the entropies are zero for large $\varepsilon$ (if $\mathcal{F}$ is bounded), so that convergence of the integrals at $\infty$ is automatic.

Once the main Glivenko-Cantelli theorems and Donsker theorems are in hand, the following question arises: how can we verify the hypotheses on uniform entropy numbers and bracketing numbers? Tools and techniques for this purpose are developed in Chapter 2.6 for uniform entropy numbers and in Chapter 2.7 for bracketing numbers.

One of the starting points for controlling uniform covering numbers is the notion of a Vapnik-Cervonenkis class of sets, or simply VC-class. Say that a collection $\mathcal{C}$ of subsets of the sample space $\mathcal{X}$ picks out a certain subset of the finite set $\left\{x_{1}, \ldots, x_{n}\right\} \subset \mathcal{X}$ if it can be written as $\left\{x_{1}, \ldots, x_{n}\right\} \cap C$ for some $C \in \mathcal{C}$. The collection $\mathcal{C}$ is said to shatter $\left\{x_{1}, \ldots, x_{n}\right\}$ if $\mathcal{C}$ picks out each of its $2^{n}$ subsets. The VC-index $V(\mathcal{C})$ of $\mathcal{C}$ is the smallest $n$ for which no set of size $n$ is shattered by $\mathcal{C}$. A collection $\mathcal{C}$ of measurable


[^0]:    ${ }^{\dagger}$ There is some clash of terminology here. A probability space ( $\Omega, \mathcal{A}, P$ ) is called perfect if for every Borel measurable map $\phi: \Omega \mapsto \mathbb{R}$, the collection of sets $\left\{B: \phi^{-1}(B) \in \mathcal{A}\right\}$ is contained in the $P \circ \phi^{-1}$-completion of the Borel sets. (So the biggest $\sigma$-field on $\mathbb{R}$ for which $\phi$ is measurable is contained in the Borel $\sigma$-field up to differences in $P \circ \phi^{-1}$-null sets.) Dudley (1985) calls a $\phi$ for which the condition is satisfied quasi-perfect, so that a probability space is perfect if every Borel measurable real function on it is quasi-perfect. Any perfect function is quasi-perfect, but not the other way around.

    Note that perfectness of $\phi$ depends on ( $\tilde{\Omega}, \tilde{A}, \tilde{P}$ ) as well as on $\phi$ and $(\Omega, \mathcal{A})$.

[^1]:    ${ }^{\ddagger}$ A general Borel measure is a measure $\mu$ on the Borel sets with $\mu(K)<\infty$ for every compact set $K$.

[^2]:    ${ }^{\mathrm{b}}$ Every metric space $\mathbb{D}$ has a completion: a complete metric space of which a dense subset can be isometrically identified with $\mathbb{D}$.
    \# A subset of a semi-metric space is totally bounded if for every $\varepsilon>0$ it can be covered with finitely many balls of radius $\varepsilon$. This is equivalent to the completion of the space being compact. Also, a subset of a semimetric space is compact if and only if it is totally bounded and complete. Every totally bounded space is separable. For every semimetric space, there is a totally bounded semimetric that generates the same topology.
    ${ }^{\dagger}$ A topological space is called Polish if it is separable and there exists a metric that generates the topology for which the space is complete. Any separable, complete metric space is Polish; so is any open subset of a Polish space. A metric space is Polish if and only if it is a $G_{\delta}$-subset of its completion (a countable intersection of open sets). Concrete examples of Polish spaces are $\mathbb{R},(0,1),[0,1)$, and $\mathbb{R}-\mathbb{Q}$.

[^3]:    ‡ A function $f$ on $\mathbb{D}$ is called upper semicontinuous if $\{f \geq c\}$ is closed for every $c$, or equivalently $\limsup \sup _{y \rightarrow y_{0}} f(y) \leq f\left(y_{0}\right)$ for every $y_{0}$. A function $f$ is lower semicontinuous if $-f$ is upper semicontinuous.

[^4]:    ${ }^{\mathrm{b}}$ The set $\delta B$ is the boundary of $B$, the closure minus the interior. A set $B$ with $L(\delta B)=0$ is often called an $L$-continuity set.

[^5]:    \# A collection of Borel measurable maps $X_{\alpha}$ is called uniformly tight if, for every $\varepsilon>0$, there is a compact $K$ with $\mathrm{P}\left(X_{\alpha} \in K\right) \geq 1-\varepsilon$ for every $\alpha$.

[^6]:    ${ }^{\dagger}$ Bauer (1981), Theorem 7.1.4, or Dudley (1989), Theorem 4.5.2.

[^7]:    ${ }^{\ddagger}$ Jameson (1974), Theorem 12.4.

[^8]:    ${ }^{\mathrm{b}}$ A vector lattice $\mathcal{F} \subset C_{b}(\mathbb{D})$ is a vector space that is closed under taking positive parts: if $f \in \mathcal{F}$, then $f^{+}=f \vee 0 \in \mathcal{F}$. Then automatically $f \vee g \in \mathcal{F}$ and $f \wedge g \in \mathcal{F}$ for every $f, g \in \mathcal{F}$. A set of functions on $\mathbb{D}$ separates points of $\mathbb{D}$ if, for every pair $x \neq y \in \mathbb{D}$, there is $f \in \mathcal{F}$ with $f(x) \neq f(y)$.
    \# Jameson (1974), p. 263.
    ${ }^{\dagger}$ An algebra $\mathcal{F} \subset C_{b}(\mathbb{D})$ is a vector space that is closed under taking products: if $f, g \in \mathcal{F}$, then $f g \in \mathcal{F}$.

[^9]:    ‡ If $(\Omega, \mathcal{A})$ is a measurable space and $Y$ a Polish space, then the projection on $\Omega$ of any product measurable subset of $\Omega \times Y$ (a set contained in the product $\sigma$-field of $\mathcal{A}$ and the Borel sets of $Y$ ) is universally measurable; that is, it is contained in the $P$-completion of $\mathcal{A}$ for every probability measure $P$ on ( $\Omega, \mathcal{A}$ ) (Cohn (1980), p. 281).
    ${ }^{b}$ A (Hausdorff) topological space is called Suslin if it is the continuous image of a Polish space. A subset of a Polish space is called analytic if it is Suslin for the relative topology. Every Borel subset of a Polish space is analytic/Suslin. See Cohn (1980), page 292.

[^10]:    ${ }^{\#}$ Cohn (1980).

[^11]:    ${ }^{\dagger}$ There do exist directed sets that are trivial; for each of them there is a net $X_{\alpha}$ for which the theorem fails (Problem 1.10.7). On the other hand, for such a directed set $X_{\alpha} \leadsto X_{\infty}$ with

[^12]:    $X_{\infty}$ separable is only possible for $X_{\alpha}$ eventually Borel measurable and equal in law to $X_{\infty}$ (Problem 1.10.6). So only rather trivial cases have to be excluded from the present formulation of the almost sure representation theorem. The reason that these have to be excluded is that (ii) says things about the relation between $\tilde{X}_{\alpha}$ and $X_{\alpha}$ that go beyond their Borel laws.

[^13]:    ${ }^{\ddagger}$ Jameson (1974), Theorem 12.4.

[^14]:    ${ }^{b}$ The class $\mathrm{BL}_{1}$ is the unit ball in the space $\mathrm{BL}(\mathbb{D})$ of bounded Lipschitz functions on $\mathbb{D}$ if this is equipped with the norm $\|f\|_{\text {BL }}$ equal to the maximum of $\|f\|_{\infty}$ and $\inf \{c:|f(x)-f(y)| \leq c d(x, y)$ for every $x, y\}$. Taking a sum instead of a maximum in the definition of $\|f\|_{\mathrm{BL}}$ leads to a slightly different bounded Lipschitz metric on the set of measures.

[^15]:    ${ }^{\dagger}$ Since the empirical measure depends only on the first $n$ coordinates, and the projection of $\mathcal{X}^{\infty}$ onto $\mathcal{X}^{n}$ is a perfect map, any outer expectation $\mathrm{E}^{*} h\left(\mathbb{P}_{n}\right)$ may be evaluated equivalently, assuming that $X_{1}, \ldots, X_{n}$ are defined on $\mathcal{X}^{n}$ or on $\mathcal{X}^{\infty}$.

[^16]:    ‡ Alternatively, the supremum could be taken over all discrete probability measures. This yields the same results.

