In view of the Borel-Cantelli lemma, Lemma 2.9.8 gives the inequality $\limsup \left(S_{2^{n}}-6 \mathrm{E} S_{2^{n}}\right) / 2^{n / 2} \leq 0$ almost surely. The first assertion of the corollary follows. Next

$$
\begin{aligned}
\underset{n}{\operatorname{Esup}} \frac{S_{2^{n}}-6 \mathrm{E} S_{2^{n}}}{2^{n / 2}} & \leq \int_{0}^{\infty} \sum_{n} \mathrm{P}\left(S_{2^{n}}-6 \mathrm{E} S_{2^{n}}>t 2^{n / 2}\right) d t \\
& \lesssim \int_{0}^{\infty}\left(\frac{\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}}{t^{2}} \wedge 1\right) d t
\end{aligned}
$$

This is bounded by the square root of $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}$. The second assertion now follows similarly from the monotonicity of the variables $S_{n}$.

## Problems and Complements

1. For any random variable $\xi$ and $r>2$, one has $(1 / 2)\|\xi\|_{2} \leq\|\xi\|_{2,1} \leq r /(r-$ 2) $\|\xi\|_{r}$.
2. For any pair of random variables $\xi$ and $\eta$, one has $\|\xi+\eta\|_{2,1}^{2} \leq 4\|\xi\|_{2,1}^{2}+ 4\|\eta\|_{2,1}^{2}$.
3. In the situation of Lemma 2.9.1, if the variables $\xi_{i}$ are symmetric and possess bounded range contained in $[-M, M]$, then $\mathrm{E}^{*}\left\|\sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \leq M \mathrm{E}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i} Z_{i}\right\|_{\mathcal{F}}$.
[Hint: Use the contraction principle, Proposition A.1.10.]
4. If $X_{1}, X_{2}, \ldots$ are i.i.d. random variables with $\limsup \left|X_{n}\right| / \sqrt{n}<\infty$ almost surely, then $\mathrm{E} X_{1}^{2}<\infty$.
[Hint: By the Kolmogorov 0-1 law, $\limsup \left|X_{n}\right| / \sqrt{n}$ is constant. Thus, there exists a constant $M$ with $\mathrm{P}\left(\lim \sup \left\{\left|X_{n}\right|>M \sqrt{n}\right\}\right)=1$. By the BorelCantelli lemma, $\sum \mathrm{P}\left(\left|X_{n}\right|^{2}>n M^{2}\right)<\infty$.]
5. Let $\mathcal{F}$ be Donsker with $\|P\|_{\mathcal{F}}<\infty$. Let $\xi_{1}, \ldots, \xi_{n}$ be i.i.d. random variables with mean $\mu$, variance $\sigma^{2}$, and $\left\|\xi_{i}\right\|_{2,1}<\infty$, independent of $X_{1}, \ldots, X_{n}$. Let $N_{n}$ be Poisson-distributed with mean $n$ and independent of the $\xi_{i}$ and $X_{i}$. Then the sequence $n^{-1 / 2} \sum_{i=1}^{N_{n}} \xi_{i} \delta_{X_{i}}-\sqrt{n} \mu P$ converges in distribution in $\ell^{\infty}(\mathcal{F})$ to $\left(\sigma^{2}+\mu^{2}\right)^{1 / 2}$ times a Brownian motion process.
6. If $Z_{[1]}, \ldots, Z_{[n]}$ are the reversed order statistics of an i.i.d. sample $Z_{1}, \ldots, Z_{n}$, then $\mathrm{P}\left(Z_{[k]}>x\right) \leq\binom{ n}{k} \mathrm{P}\left(Z_{1}>x\right)^{k}$ for every $x$.
[Hint: Note that $\mathrm{P}\left(Z_{[k]}>x\right) \leq\binom{ n}{k} \mathrm{P}\left(Z_{1}>x, \ldots, Z_{k}>x\right)$.]
7. (Alternative proof of Corollary 2.9.9) Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. stochastic processes with sample paths in $\ell^{\infty}(\mathcal{F})$ and $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}<\infty$. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. random variables with mean zero, independent of $Z_{1}, Z_{2}, \ldots$ Then there exists a constant $K$ with

$$
\limsup _{n \rightarrow \infty} \mathrm{E}_{\xi}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*} \leq K \limsup _{n \rightarrow \infty} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}
$$

Here the star on the left side denotes a measurable majorant with respect to the variables $\left(\xi_{1}, \ldots, \xi_{n}, Z_{1}, \ldots, Z_{n}\right)$ jointly.
[Hint: Without loss of generality, assume that $\mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \leq 1 / 2$, for every $n$, and $\mathrm{E}\left|\xi_{1}\right|=1$. Since $\mathrm{E} \xi=0$, the random variables $\mathrm{E}_{\xi}\left\|\sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*}$ are nondecreasing in $n$ by Jensen's inequality. Therefore, it suffices to consider the limsup along the subsequence indexed by $2^{n}$. Since $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}<\infty$,

$$
\sum_{n=1}^{\infty} \mathrm{P}\left(\max _{1 \leq i \leq 2^{n}}\left\|Z_{i}\right\|_{\mathcal{F}}^{*}>2^{n / 2}\right) \leq \sum_{n=1}^{\infty} 2^{n} \mathrm{P}\left(\left\|Z_{1}\right\|_{\mathcal{F}}^{*}>2^{n / 2}\right)<\infty .
$$

It follows by the Borel-Cantelli lemma that each variable $\left\|Z_{i}\right\|_{\mathcal{F}}^{*}$, for $1 \leq i \leq 2^{n}$, is bounded by $2^{n / 2}$ eventually, almost surely. Consequently, if $\tilde{Z}_{i}=Z_{i} 1\left\{\left\|Z_{i}\right\|_{\mathcal{F}}^{*} \leq 2^{n / 2}\right\}$, then the variables $\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*}$ and $\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}$ are equal eventually, almost surely. (We abuse notation, since $Z_{i}$ depends on $n$.) It suffices to show that the random variable $\limsup 2^{-n / 2} \mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}$ is bounded by some fixed number almost surely. By the Borel-Cantelli lemma, this is certainly the case if

$$
\sum_{n=1}^{\infty} \mathrm{P}\left(\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}>52^{n / 2}\right)<\infty .
$$

The probabilities in this series can be replaced by their squares at the cost of decreasing 5 to 2 . Indeed, the random variables $S_{k, l}=\mathrm{E}_{\xi}\left\|\sum_{i=k}^{l} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}$ are monotonely decreasing in $k$ and increasing in $l$. Let $T$ be the first $l$ such that $S_{1, l}>22^{n / 2}$. Then $T \leq 2^{n}$ if and only if $S_{1,2^{n}}>22^{n / 2}$. Furthermore, if $T=k$ and $S_{1,2^{n}}>52^{n / 2}$, then $S_{k+1,2^{n}}>22^{n / 2}$, because $S_{k, k}=\left\|\tilde{Z}_{k}\right\|_{\mathcal{F}}^{*} \leq 2^{n / 2}$. Thus

$$
\begin{aligned}
\mathrm{P}\left(S_{1,2^{n}}>52^{n / 2}\right) & \leq \sum_{k=1}^{2^{n}} \mathrm{P}\left(T=k, S_{1,2^{n}}>52^{n / 2}\right) \\
& \leq \sum_{k=1}^{2^{n}} \mathrm{P}\left(T=k, S_{k+1,2^{n}}>22^{n / 2}\right) \\
& \leq \sum_{k=1}^{2^{n}} \mathrm{P}(T=k) \max _{1 \leq k \leq 2^{n}} \mathrm{P}\left(S_{k, 2^{n}}>22^{n / 2}\right) \\
& \leq \mathrm{P}\left(S_{1,2^{n}}>22^{n / 2}\right)^{2}
\end{aligned}
$$

In view of the contraction principle stated in Proposition A.1.10, we have $\mathrm{E}^{*}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}} \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{2^{n}} \xi_{i} Z_{i}\right\|_{\mathcal{F}} \leq 2^{n / 2}$. Conclude that it suffices to
prove that

$$
\begin{equation*}
\sum_{n=1}^{\infty} \mathrm{P}\left(\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}-\mathrm{E}^{*}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}>2^{n / 2}\right)^{2}<\infty \tag{2.9.10}
\end{equation*}
$$

Let $\mathrm{E}^{i}$ denote conditional expectation with respect to the $\sigma$-field generated by $Z_{1}, \ldots, Z_{i}$. More precisely, let $\mathrm{E}^{0}$ denote unconditional expectation, and if $Z_{i}$ is the projection on the $i$ th coordinate of the product measurable space ( $\mathcal{X}^{\infty} \times \mathcal{Z}, \mathcal{A}^{\infty} \times \mathcal{C}$ ), let $\mathrm{E}^{i}$ denote conditional expectation given $\mathcal{A}^{i} \times \mathcal{X}^{\infty-i} \times \mathcal{C}$. Set

$$
D_{i}=\left(\mathrm{E}^{i}-\mathrm{E}^{i-1}\right)\left(\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}\right)=\left(\mathrm{E}^{i}-\mathrm{E}^{i-1}\right)\left(C_{i}\right)
$$

where

$$
C_{i}=\mathrm{E}_{\xi}\left\|\sum_{j=1}^{2^{n}} \xi_{j} \tilde{Z}_{j}\right\|_{\mathcal{F}}^{*}-\mathrm{E}_{\xi}\left\|\sum_{j=1, j \neq i}^{2^{n}} \xi_{j} \tilde{Z}_{j}\right\|_{\mathcal{F}}^{*}
$$

The random variables inside the probabilities in (2.9.10) can be written as the (telescoping) sums $\sum_{i=1}^{2^{n}} D_{i}$. By the triangle inequality, $\left|D_{i}\right| \leq 2 C_{i} \leq 2\left\|\tilde{Z}_{i}\right\|^{*}$. Furthermore, in view of Problem 2.9.9, the expectation of $C_{i}$ can be bounded by $\mathrm{E} C_{i} \leq 2^{-n} \mathrm{E}^{*}\left\|\sum_{j=1}^{2^{n}} \xi_{j} \tilde{Z}_{j}\right\|_{\mathcal{F}} \leq 2^{-n / 2}$. The random variables $D_{1}, \ldots, D_{2^{n}}$ are uncorrelated and have mean zero. By Chebyshev's inequality, (2.9.10) is bounded by

$$
\sum_{n=1}^{\infty}\left(2^{-n} \sum_{i=1}^{2^{n}} \mathrm{E} D_{i}^{2}\right)^{2} \leq \sum_{n=1}^{\infty} \max _{1 \leq i \leq 2^{n}} \mathrm{E}\left|D_{i}\right|^{3} \mathrm{E}\left|D_{i}\right| \lesssim \sum_{n=1}^{\infty} 2^{-n / 2} \mathrm{E}^{*}\left\|\tilde{Z}_{1}\right\|_{\mathcal{F}}^{3}
$$

Substitute $\mathrm{E}^{*}\left\|\tilde{Z}_{1}\right\|_{\mathcal{F}}^{3}=\sum_{k=-\infty}^{n} \mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{3}\left\{2^{(k-1) / 2}<\left\|Z_{1}\right\|_{\mathcal{F}}^{*} \leq 2^{k / 2}\right\}$; next bound one factor of $\left\|Z_{1}\right\|_{\mathcal{F}}^{3}$ by $2^{k / 2}$; and, finally, change the order of summation to bound the previous display by

$$
\sum_{k=-\infty}^{\infty} \sum_{n=k}^{\infty} \mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}\left\{2^{(k-1) / 2}<\left\|Z_{1}\right\|_{\mathcal{F}}^{*} \leq 2^{k / 2}\right\} 2^{k / 2-n / 2}
$$

This equals $\mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2} \sqrt{2} /(\sqrt{2}-1)$. The proof is complete.]
8. (Alternative proof of Corollary 2.9.9) Let $Z_{1}, Z_{2}, \ldots$ be i.i.d. stochastic processes with sample paths in $\ell^{\infty}(\mathcal{F})$. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. random variables with mean zero, independent of $Z_{1}, Z_{2}, \ldots$. Suppose $M= \sup _{n} \mathrm{E}^{*}\left\|n^{-1 / 2} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}<\infty$. Then there exists a universal constant $K$ with

$$
\mathrm{P}\left(\sup _{n \geq 1} \mathrm{E}_{\xi}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*}>\sqrt{2}(2 M+3 t)\right) \leq K\left(\frac{2}{t^{2}}+\frac{M}{t^{3}}\right) \mathrm{E}^{*}\left\|Z_{1}\right\|_{\mathcal{F}}^{2}
$$

for every $t>0$. Here the star on the left side denotes a measurable majorant with respect to $\left(\xi_{1}, \ldots, \xi_{n}, Z_{1}, \ldots, Z_{n}\right)$ jointly.
[Hint: The supremum over all $n \geq 1$ inside the probability can be replaced by
$\sqrt{2}$ times the supremum over the numbers $2^{n}$. Set $\tilde{Z}_{i}=Z_{i} 1\left\{\left\|Z_{i}\right\|_{\mathcal{F}}^{*} \leq t 2^{n / 2}\right\}$. The given probability is bounded by

$$
\begin{aligned}
& \sum_{n} \mathrm{P}\left(\max _{1 \leq i \leq 2^{n}}\left\|Z_{i}\right\|_{\mathcal{F}}^{*}>t 2^{n / 2}\right)+\sum_{n} \mathrm{P}\left(\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}>2^{n / 2}(2 M+3 t)\right) \\
& \quad \leq \sum_{n} 2^{n} \mathrm{P}\left(\left\|Z_{1}\right\|_{\mathcal{F}}^{*}>t 2^{n / 2}\right)+\sum_{n} \mathrm{P}\left(\mathrm{E}_{\xi}\left\|\sum_{i=1}^{2^{n}} \xi_{i} \tilde{Z}_{i}\right\|_{\mathcal{F}}^{*}>2^{n / 2}(M+t)\right)^{2} .
\end{aligned}
$$

Here the square probability is obtained by the same argument as before, but with $T$ equal to the first $l$ such that $S_{1, l}>2^{n / 2}(M+t)$. The proof can be finished as before.]
9. Given i.i.d. stochastic processes $Z_{1}, Z_{2}, \ldots$ with sample paths in $\ell^{\infty}(\mathcal{F})$, define $S_{n}=\sum_{i=1}^{n} Z_{i}$. Then $\mathrm{E}^{*}\left\|S_{n}\right\|_{\mathcal{F}}-\mathrm{E}^{*}\left\|S_{n-1}\right\|_{\mathcal{F}} \leq n^{-1} \mathrm{E}^{*}\left\|S_{n}\right\|_{\mathcal{F}}$.
[Hint: The inequality is equivalent to $\mathrm{E}^{*}\left\|S_{n} / n\right\|_{\mathcal{F}} \leq \mathrm{E}^{*}\left\|S_{n-1} /(n-1)\right\|_{\mathcal{F}}$. The sequence $\left\|S_{n} / n\right\|_{\mathcal{F}}^{*}$ forms a reversed submartingale with respect to the filtration $\Sigma_{n}$ generated by the symmetric $\sigma$-fields, as in Lemma 2.4.5.]

### 2.10

## Permanence of the Donsker Property

In this chapter we consider a number of operations that preserve the Donsker property and allow the formation of many new Donsker classes from given examples. For instance, unions, convex hulls, and certain closures of Donsker classes are Donsker. The main result of this chapter concerns Lipschitz transformations of Donsker classes and is discussed in Section 2.10.2. Section 2.10.3 covers the preservation of the uniform-entropy condition, and in Section 2.10.4 new Donsker classes are formed through union of sample spaces.

### 2.10.1 Closures and Convex Hulls

Given a class $\mathcal{F}$ of measurable functions, let $\overline{\mathcal{F}}$ denote the set of all $f: \mathcal{X} \mapsto \mathbb{R}$ for which there exists a sequence $f_{m}$ in $\mathcal{F}$ with $f_{m} \rightarrow f$ both pointwise and in $L_{2}(P)$. Let sconv $\mathcal{F}$ denote the set of convex combinations $\sum_{i=1}^{\infty} \lambda_{i} f_{i}$ of functions $f_{i}$ in $\mathcal{F}$ where $\sum\left|\lambda_{i}\right| \leq 1$ and the series converges both pointwise and in $L_{2}(P) .^{\mathrm{b}}$
2.10.1 Theorem. If $\mathcal{F}$ is Donsker and $\mathcal{G} \subset \mathcal{F}$, then $\mathcal{G}$ is Donsker.
2.10.2 Theorem. If $\mathcal{F}$ is Donsker, then $\overline{\mathcal{F}}$ is Donsker.
2.10.3 Theorem. If $\mathcal{F}$ is Donsker, then sconv $\mathcal{F}$ is Donsker.

[^0]Proofs. The first two results are immediate consequences of the characterization of weak convergence in $\ell^{\infty}(\mathcal{F})$ as marginal convergence plus asymptotic equicontinuity. In both cases the modulus of continuity does not increase when passing from $\mathcal{F}$ to the new class.

For the third result, let $\left\{\psi_{i}\right\}$ be an orthonormal base of a subspace of $L_{2}(P)$ that contains $\mathcal{F}$, and let $Z_{1}, Z_{2}, \ldots$ be i.i.d. standard normally distributed random variables. Since $\mathcal{F}$ is pre-Gaussian, the series $\sum_{i=1}^{\infty}\left(P(f-P f) \psi_{i}\right) Z_{i}$ is uniformly convergent in $\ell^{\infty}(\mathcal{F})$ and represents a tight Brownian bridge process (Problem 2.10.1). Thus the sequence of partial sums $\mathbb{G}_{k}=\sum_{i=1}^{k}\left(P(f-P f) \psi_{i}\right) Z_{i}$ satisfies

$$
\left\|\mathbb{G}_{k}-\mathbb{G}_{l}\right\|_{\text {sconv } \mathcal{F}}=\left\|\mathbb{G}_{k}-\mathbb{G}_{l}\right\|_{\mathcal{F}} \rightarrow 0, \quad \text { a.s. }
$$

as $k, l \rightarrow \infty$. It follows that the sequence of partial sums forms a Cauchy sequence in $\ell^{\infty}(\operatorname{sconv} \mathcal{F})$ almost surely and hence converges almost surely to a limit $\mathbb{G}$. Since each of the partial sums is linear and $\rho_{P}$-uniformly continuous on sconv $\mathcal{F}$, so is the limit $\mathbb{G}$, with probability 1 . This proves that the symmetric convex hull of $\mathcal{F}$ is pre-Gaussian.

According to the almost sure representation theorem, Theorem 1.10.4, there exists a probability space $(\Omega, \mathcal{U}, \mathrm{P})$ and perfect maps $\phi_{n}: \Omega \mapsto \mathcal{X}^{n}$ and $\phi$ such that

$$
\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(f\left(\phi_{n}(\omega)_{i}\right)-P f\right)-\mathbb{G}(f, \phi(\omega))\right\|_{\mathcal{F}} \xrightarrow{\text { as } *} 0
$$

The norm does not increase if $\mathcal{F}$ is replaced by $\operatorname{sconv} \mathcal{F}$. Thus there exists a version of the empirical process that converges outer almost surely in $\ell^{\infty}(\operatorname{sconv} \mathcal{F})$ to a process with uniformly continuous sample paths. This implies that sconv $\mathcal{F}$ is Donsker. (Note that by perfectness of $\phi_{n}$, $\mathrm{E} h^{*}\left(\left\{\mathbb{G}_{n} f: f \in \operatorname{sconv} \mathcal{F}\right\}\right)=\left(P^{n}\right)^{*} h\left(\left\{\mathbb{G}_{n} f: f \in \operatorname{sconv} \mathcal{F}\right\}\right)$ for every function $h$ on $\ell^{\infty}(\operatorname{sconv} \mathcal{F})$.)
2.10.4 Example. The class of all functions $x \mapsto \mu(-\infty, x]$ with $\mu$ ranging over all signed measures on $\mathbb{R}^{k}$ with total variation bounded by 1 is universally Donsker.

This can be deduced by applying the preceding results several times. The given class is in the convex hull of the set of cumulative distribution functions of probability measures. In view of the classical Glivenko-Cantelli theorem, any cumulative distribution function is the uniform limit of a sequence of finitely discrete cumulative distribution functions. The class of functions $x \mapsto \sum_{i} p_{i} 1\left\{t_{i} \leq x\right\}$, with $p_{i} \geq 0$ and $\sum p_{i}=1$, is in the convex hull of the class of indicator functions of cells $[t, \infty)$. This is VapnikCervonenkis and suitably measurable, hence universally Donsker.

### 2.10.2 Lipschitz Transformations

For given classes $\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}$ of real functions defined on some set $\mathcal{X}$ and a fixed $\operatorname{map} \phi: \mathbb{R}^{k} \mapsto \mathbb{R}$, let $\phi \circ\left(\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}\right)$ denote the class of functions $x \mapsto \phi\left(f_{1}(x), \ldots, f_{k}(x)\right)$ as $f=\left(f_{1}, \ldots, f_{k}\right)$ ranges over $\mathcal{F}_{1} \times \cdots \times \mathcal{F}_{k}$. It will be shown that the Donsker property is preserved if $\phi$ satisfies

$$
\begin{equation*}
|\phi \circ f(x)-\phi \circ g(x)|^{2} \leq \sum_{l=1}^{k}\left(f_{l}(x)-g_{l}(x)\right)^{2} \tag{2.10.5}
\end{equation*}
$$

for every $f, g \in \mathcal{F}_{1} \times \cdots \times \mathcal{F}_{k}$ and $x$. This is certainly the case for Lipschitz functions $\phi$.
2.10.6 Theorem. Let $\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}$ be Donsker classes with $\|P\|_{\mathcal{F}_{i}}<\infty$ for each $i$. Let $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}$ satisfy (2.10.5). Then the class $\phi \circ\left(\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}\right)$ is Donsker, provided $\phi \circ\left(f_{1}, \ldots, f_{k}\right)$ is square integrable for at least one $\left(f_{1}, \ldots, f_{k}\right)$.
2.10.7 Example. If $\mathcal{F}$ and $\mathcal{G}$ are Donsker classes and $\|P\|_{\mathcal{F} \cup \mathcal{G}}<\infty$, then the pairwise infima $\mathcal{F} \wedge \mathcal{G}$, the pairwise suprema $\mathcal{F} \vee \mathcal{G}$, and pairwise sums $\mathcal{F}+\mathcal{G}$ are Donsker classes.

Since $\mathcal{F} \cup \mathcal{G}$ is contained in the sum of $\mathcal{F} \cup\{0\}$ and $\mathcal{G} \cup\{0\}$, the union of $\mathcal{F}$ and $\mathcal{G}$ is Donsker as well.
2.10.8 Example. If $\mathcal{F}$ and $\mathcal{G}$ are uniformly bounded Donsker classes, then the pairwise products $\mathcal{F} \cdot \mathcal{G}$ form a Donsker class. The function $\phi(f, g)=f g$ is Lipschitz on bounded subsets of $\mathbb{R}^{2}$, but not on the whole plane. The condition that $\mathcal{F}$ and $\mathcal{G}$ be uniformly bounded cannot be omitted in general. (In fact, the envelope function of the product of two Donsker classes need not be weak $L_{2}$.)
2.10.9 Example. If $\mathcal{F}$ is Donsker with $\|P\|_{\mathcal{F}}<\infty$ and $f \geq \delta$ for some constant $\delta>0$ for every $f \in \mathcal{F}$, then $1 / \mathcal{F}=\{1 / f: f \in \mathcal{F}\}$ is Donsker.
2.10.10 Example. If $\mathcal{F}$ is a Donsker class with $\|P\|_{\mathcal{F}}<\infty$ and $g$, a uniformly bounded, measurable function, then $\mathcal{F} \cdot g$ is Donsker. Although the function $\phi(f, g)=f g$ is not Lipschitz on the domain of interest, we have

$$
\left|\phi\left(f_{1}(x), g(x)\right)-\phi\left(f_{2}(x), g(x)\right)\right| \leq\|g\|_{\infty}\left|f_{1}(x)-f_{2}(x)\right|
$$

for all $x$. Thus, condition (2.10.5) is satisfied and the theorem applies.
2.10.11 Example. If $\mathcal{F}$ is Donsker with integrable envelope function $F$, then the class $\mathcal{F}_{\leq M}=\left\{f 1\left\{F \leq M^{\prime}\right\}: f \in \mathcal{F}, M^{\prime} \leq M\right\}$ is Donsker. Indeed, the class of sets $\{F \leq M\}$ is linearly indexed by inclusion, so that it is VC. Furthermore, the function $\phi(f, g)=f g$ is Lipschitz on the set $\{(f, 0): f \in \mathbb{R}\} \cup\{(f, 1):|f| \leq M\}$.

Consequently, the class $\mathcal{F}^{M}=\{f 1\{F>M\}: f \in \mathcal{F}\}$ is Donsker because it is contained in $\mathcal{F}-\mathcal{F}_{\leq M}$.

Many transformations of interest are Lipschitz, but not uniformly so. Consider a map $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}$ such that

$$
\begin{equation*}
|\phi \circ f(x)-\phi \circ g(x)|^{2} \leq \sum_{l=1}^{k} L_{\alpha, l}^{2}(x)\left(f_{l}(x)-g_{l}(x)\right)^{2} \tag{2.10.12}
\end{equation*}
$$

for given measurable functions $L_{\alpha, 1}, \ldots, L_{\alpha, k}$ and every $f, g \in \mathcal{F}_{1} \times \cdots \times \mathcal{F}_{k}$ and $x$. Then the class $\phi \circ\left(\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}\right)$ is Donsker if each of the classes $L_{\alpha, i} \mathcal{F}_{i}$, consisting of the functions $x \mapsto L_{\alpha, i}(x) f(x)$ with $f$ ranging over $\mathcal{F}_{i}$, is Donsker. By Example 2.10.10, the class $g \mathcal{F}$ is Donsker whenever $g$ is bounded and $\mathcal{F}$ is Donsker, but this is not useful to generalize the preceding theorem. Typically, it is possible to relax the requirement that $g$ is bounded at the cost of more stringent conditions on $\mathcal{F}$. For instance, in the next subsection it is shown that $g \mathcal{F}$ is Donsker for every combination of a Donsker class $\mathcal{F}$ that satisfies the uniform entropy condition and for a function $g$ such that $P g^{2} F^{2}<\infty$.
2.10.13 Corollary. Let $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}$ satisfy (2.10.12). Let each of the classes $L_{\alpha, i} \mathcal{F}_{i}$ be Donsker with $\|P\|_{L_{\alpha, i} \mathcal{F}_{i}}<\infty$. Then the class $\phi \circ\left(\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}\right)$ is Donsker, provided $\phi \circ\left(f_{1}, \ldots, f_{k}\right)$ is square integrable for at least one $\left(f_{1}, \ldots, f_{k}\right)$.

Proof. Without loss of generality, assume that each of the functions $L_{\alpha, i}$ is positive. For $f \in L_{\alpha} \mathcal{F}=L_{\alpha, 1} \mathcal{F}_{1} \times \cdots \times L_{\alpha, k} \mathcal{F}_{k}$, define $\psi(f)=\phi\left(f / L_{\alpha}\right)$. Then $\psi$ is uniformly Lipschitz in the sense of (2.10.5). By the preceding theorem, $\psi\left(L_{\alpha} \mathcal{F}\right)=\phi(\mathcal{F})$ is Donsker.

The main tool in the proof of Theorem 2.10.6 is "Gaussianization." Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. random variables with a standard normal distribution independent of $X_{1}, X_{2}, \ldots$. By Chapter 2.9, the (conditional as well as unconditional) asymptotic behavior of the empirical process is related to the behavior of the processes

$$
\mathbb{Z}_{n}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} \delta_{X_{i}}
$$

Given fixed values $X_{1}, \ldots, X_{n}$, the process $\left\{\mathbb{Z}_{n}(f): f \in L_{2}(P)\right\}$ is Gaussian with zero mean and standard deviation metric

$$
\sigma_{\xi}\left(\mathbb{Z}_{n}(f)-\mathbb{Z}_{n}(g)\right)=\left(\frac{1}{n} \sum_{i=1}^{n}\left(f\left(X_{i}\right)-g\left(X_{i}\right)\right)^{2}\right)^{1 / 2}
$$

equal to the $L_{2}\left(\mathbb{P}_{n}\right)$ semimetric. This observation permits the use of several comparison principles for Gaussian processes, including Slepian's lemma, Proposition A.2.6

Three lemmas precede the proof of Theorem 2.10.6. The first is a comparison principle of independent interest.
2.10.14 Lemma. Let $\mathcal{F}$ be a Donsker class with $\|P\|_{\mathcal{F}}<\infty$. Then the class $\mathcal{F}^{2}=\left\{f^{2}: f \in \mathcal{F}\right\}$ is Glivenko-Cantelli in probability: $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}^{2}}^{*} \xrightarrow{\mathrm{P}} 0$. If, in addition, $P^{*} F^{2}<\infty$ for some envelope function $F$, then $\mathcal{F}^{2}$ is also Glivenko-Cantelli almost surely and in mean.

Proof. Let $\xi_{1}, \xi_{2}, \ldots$ be i.i.d. random variables with a standard normal distribution independent of $X_{1}, X_{2}, \ldots$. Given fixed values $X_{1}, \ldots, X_{n}$ the stochastic process $\mathbb{Z}_{n}(f)=n^{-1 / 2} \sum_{i=1}^{n} \xi_{i} f\left(X_{i}\right)$ is a Gaussian process with zero mean and variance $\operatorname{var}_{\xi}\left(\mathbb{Z}_{n}(f)\right)=\mathbb{P}_{n} f^{2}$. Thus

$$
\left\|\mathbb{P}_{n} f^{2}\right\|_{\mathcal{F}}^{1 / 2}=\sqrt{\frac{\pi}{2}}\left\|\mathrm{E}_{\xi}\left|\mathbb{Z}_{n}(f)\right|\right\|_{\mathcal{F}} \leq \sqrt{\frac{\pi}{2}} \mathrm{E}_{\xi}\left\|\mathbb{Z}_{n}\right\|_{\mathcal{F}}
$$

Since $\mathcal{F}$ is Donsker and $\|P\|_{\mathcal{F}}<\infty$, the sequence $\mathbb{Z}_{n}$ converges (unconditionally) to a tight Gaussian process $\mathbb{Z}$ by the unconditional multiplier theorem, Theorem 2.9.2. By Lemma 2.3.11, this implies that $\mathrm{E}^{*}\left\|\mathbb{Z}_{n}\right\|_{\mathcal{F}}=O(1)$. Conclude that for every $\varepsilon>0$ there exist constants $M$ and $N$ such that with inner probability at least $1-\varepsilon: \mathbb{P}_{n} f^{2} \leq M$ for every $f \in \mathcal{F}$ and every $n \geq N$. Since $\mathcal{F}$ is bounded in $L_{2}(P)$, one can also ensure that $P f^{2} \leq M$ for every $f \in \mathcal{F}$.

For fixed $M$ and any $\sigma^{2}, \tau^{2} \leq M$, the bounded Lipschitz distance between the normal distributions $N\left(0, \sigma^{2}\right)$ and $N\left(0, \tau^{2}\right)$ is bounded below by $K\left|\sigma^{2}-\tau^{2}\right|$ for a constant $K$ depending on $M$ only (Problem 2.10.2). Conclude that with inner probability at least $1-\varepsilon$ and $n \geq N$,

$$
K\left|\mathbb{P}_{n} f^{2}-P f^{2}\right| \leq \sup _{h \in \mathrm{BL}_{1}(\mathbb{R})}\left|\mathrm{E}_{\xi} h\left(\mathbb{Z}_{n}(f)\right)-\mathrm{E} h(\mathbb{Z}(f))\right|
$$

The right side is bounded by the bounded Lipschitz distance between the processes $\mathbb{Z}_{n}$ and $\mathbb{Z}$. Conclude that with inner probability at least $1-\varepsilon$,

$$
K\left\|\mathbb{P}_{n} f^{2}-P f^{2}\right\|_{\mathcal{F}} \leq \sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{\xi} h\left(\mathbb{Z}_{n}\right)-\mathrm{E} h(\mathbb{Z})\right|
$$

The right side converges to zero in outer probability by the conditional multiplier theorem, Theorem 2.9.6.

Under the condition $P^{*} F^{2}<\infty$, the submartingale argument in the proof of Theorem 2.4.3 (based on Lemma 2.4.5) applies and shows that the convergence in probability can be strengthened to convergence in mean and almost surely.
2.10.15 Lemma. If $\mathcal{F}$ is pre-Gaussian, then $\varepsilon^{2} \log N\left(\varepsilon, \mathcal{F}, \rho_{P}\right) \rightarrow 0$ as $\varepsilon \rightarrow$ 0 . If, in addition, $\|P\|_{\mathcal{F}}<\infty$, then also $\varepsilon^{2} \log N\left(\varepsilon, \mathcal{F}, L_{2}(P)\right) \rightarrow 0$.

Proof. For any partition $\mathcal{F}=\cup_{i=1}^{m} \mathcal{F}_{i}$ and $\varepsilon>0$, one has $N\left(\varepsilon, \mathcal{F}, \rho_{P}\right) \leq \sum_{i=1}^{m} N\left(\varepsilon, \mathcal{F}_{i}, \rho_{P}\right)$. Bound the sum by $m$ times the maximum of its terms, and take logarithms to obtain

$$
\varepsilon \sqrt{\log N\left(\varepsilon, \mathcal{F}, \rho_{P}\right)} \leq \varepsilon \sqrt{\log m}+\varepsilon \max _{i \leq m} \sqrt{\log N\left(\varepsilon, \mathcal{F}_{i}, \rho_{P}\right)}
$$

For fixed $\delta>0$, choose a partition into $m=N\left(\delta, \mathcal{F}, \rho_{P}\right)$ sets of diameter at most $\delta$. Take an arbitrary element $f_{i}$ from each partitioning set. Let $\mathbb{G}$ be a separable Brownian bridge process. According to Sudakov's inequality A.2.5, $\varepsilon \sqrt{\log N\left(\varepsilon, \mathcal{G}, \rho_{P}\right)} \leq 3 \mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{G}}$ for any set of functions $\mathcal{G}$ and $\varepsilon$. Since $N\left(\varepsilon, \mathcal{F}_{i}, \rho_{P}\right)=N\left(\varepsilon, \mathcal{F}_{i}-f_{i}, \rho_{P}\right)$, the preceding display can be bounded by

$$
\frac{3 \varepsilon}{\delta} \mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}}+3 \max _{i \leq m} \mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}_{i}-f_{i}} \leq \frac{3 \varepsilon}{\delta} \mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}}+3 \mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}_{\delta}},
$$

where $\mathcal{F}_{\delta}=\left\{f-g: \rho_{P}(f-g)<\delta, f, g \in \mathcal{F}\right\}$. Since $\mathcal{F}$ is pre-Gaussian, $\mathbb{G}$ can be chosen bounded and uniformly continuous. This implies that $\mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}}<\infty$ and $\mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}_{\delta}} \rightarrow 0$ as $\delta \rightarrow 0$. Thus, the first term on the right is finite and converges to zero as $\varepsilon \downarrow 0$. The second term can be made arbitrarily small by choosing $\delta$ sufficiently small.

The second assertion of the lemma is proved in a similar way, now using a Brownian motion process $\mathbb{G}+\xi P$ (where $\xi$ is standard normally distributed and is independent of $\mathbb{G}$ ) instead of $\mathbb{G}$ (cf. Problem 2.1.4).
2.10.16 Lemma. Let $Z_{1}, \ldots, Z_{m}$ be separable, mean-zero Gaussian processes indexed by arbitrary sets $T_{i}$. Then

$$
\mathrm{E} \max _{1 \leq i \leq m}\left\|Z_{i}\right\|_{T_{i}} \leq K\left(\max _{1 \leq i \leq m} \mathrm{E}\left\|Z_{i}\right\|_{T_{i}}+\sqrt{\log m} \max _{1 \leq i \leq m}\left\|\sigma\left(Z_{i, t}\right)\right\|_{T_{i}}\right),
$$

for a universal constant $K$.

Proof. Without loss of generality, assume that $m \geq 2$. Set $\sigma_{i}=\left\|\sigma\left(Z_{i, t}\right)\right\|_{T_{i}}$ and $Y_{i}=\left\|Z_{i, t}\right\|_{T_{i}}$. By Borell's inequality A.2.1,

$$
\begin{equation*}
\mathrm{P}\left(\left|Y_{i}-M_{i}\right|>x\right) \leq e^{-\frac{1}{2} x^{2} / \sigma_{i}^{2}} \tag{2.10.17}
\end{equation*}
$$

where $M_{i}$ is a median of the random variable $Y_{i}$. By Lemma 2.2.1, the variable $Y_{i}-M_{i}$ has Orlicz norm $\left\|Y_{i}-M_{i}\right\|_{\psi_{2}}$ bounded by a multiple of $\sigma_{i}$. In view of the triangle inequality,

$$
\mathrm{E} \max _{i}\left\|Z_{i}\right\|_{T_{i}} \leq \mathrm{E} \max _{i}\left|Y_{i}-M_{i}\right|+\max _{i} M_{i} \lesssim \sqrt{\log m} \max _{i} \sigma_{i}+\max _{i} M_{i},
$$

by Lemma 2.2.2. Integration of (2.10.17) (or another application of the inequality $\left.\left\|Y_{i}-M_{i}\right\|_{\psi_{2}} \lesssim \sigma_{i}\right)$ yields $\mathrm{E}\left|Y_{i}-M_{i}\right| \lesssim \sigma_{i}$. The lemma follows upon using this inequality to bound $\max _{i} M_{i}$ in the last displayed equation.

Proof of Theorem 2.10.6. The square integrability of $\phi \circ\left(f_{1}, \ldots, f_{k}\right)$ for one element of $\mathcal{F}_{1} \times \cdots \times \mathcal{F}_{k}$ and the Lipschitz condition imply square integrability of every function of this type. This ensures marginal convergence.

Let $\xi_{1}, \xi_{2}, \ldots, \xi_{n}$ be i.i.d. random variables with a standard normal distribution, independent of $X_{1}, \ldots, X_{n}$. Given fixed values $X_{1}, \ldots, X_{n}$, the process

$$
H_{n}(f)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} \phi \circ f\left(X_{i}\right), \quad f=\left(f_{1}, \ldots, f_{k}\right),
$$

is zero-mean Gaussian with "intrinsic" semimetric $\sigma_{\xi}\left(H_{n}(f)-H_{n}(g)\right)$ equal to the $L_{2}\left(\mathbb{P}_{n}\right)$ semimetric $\|\phi \circ f-\phi \circ g\|_{n}$. Because each $\mathcal{F}_{l}$ is Donsker and each $\|P\|_{\mathcal{F}_{l}}<\infty$, the set $\mathcal{F}=\mathcal{F}_{1} \times \cdots \times \mathcal{F}_{k}$ is totally bounded in the product space $L_{2}(P)^{k}$. For given $\delta>0$, let $\mathcal{F}=\cup_{j=1}^{m} \mathcal{H}_{j}$ be a partition of $\mathcal{F}$ into sets of diameter less than $\delta$ with respect to the supremum product metric. The number of sets in the partition can be chosen as $m \leq \prod_{l=1}^{k} N\left(\delta, \mathcal{F}_{l}, L_{2}(P)\right)$. Choose an arbitrary element $h_{j}$ from each $\mathcal{H}_{j}$. Given the same $X_{1}, \ldots, X_{n}$ as before, the processes $\left\{H_{n}(f)-H_{n}\left(h_{j}\right): f \in \mathcal{H}_{j}\right\}$ possess the same intrinsic semimetric as $H_{n}$. By the preceding lemma,

$$
\begin{align*}
\mathrm{E}_{\xi} \sup _{j}\left\|H_{n}-H_{n}\left(h_{j}\right)\right\|_{\mathcal{H}_{j}} & \lesssim \max _{j \leq m} \mathrm{E}_{\xi}\left\|H_{n}-H_{n}\left(h_{j}\right)\right\|_{\mathcal{H}_{j}} \\
& +\sqrt{\log m} \max _{j \leq m} \sup _{f \in \mathcal{H}_{j}}\left\|\phi \circ f-\phi \circ h_{j}\right\|_{n} . \tag{2.10.18}
\end{align*}
$$

For each $l$, let $\xi_{l 1}, \ldots, \xi_{l n}$ be i.i.d. random variables with a standard normal distribution, chosen independently for different $l$. Define $G_{n}(f)= \sum_{l=1}^{k} n^{-1 / 2} \sum_{i=1}^{n} \xi_{l i} f_{l}\left(X_{i}\right)$. In view of (2.10.5),

$$
\operatorname{var}_{\xi}\left(H_{n}(f)-H_{n}(g)\right) \leq \sum_{l=1}^{k} \frac{1}{n} \sum_{i=1}^{n}\left(f_{l}-g_{l}\right)^{2}\left(X_{i}\right)=\operatorname{var}_{\xi}\left(G_{n}(f)-G_{n}(g)\right) .
$$

By Slepian's lemma A.2.6, the expectation $\mathrm{E}_{\xi}\left\|H_{n}-H_{n}\left(h_{j}\right)\right\|_{\mathcal{H}_{j}}$ is bounded above by two times the same expression, but with $G_{n}$ instead of $H_{n}$. Make
this substitution in the right side of (2.10.18), and conclude that the left side of (2.10.18) is bounded up to a constant by

$$
\mathrm{E}_{\xi} \sup _{e_{P}(f, h)<\delta}\left|G_{n}(f)-G_{n}(h)\right|+\sqrt{\log m} \sup _{e_{P}(f, h)<\delta}\|f-h\|_{n} .
$$

(Here $e_{P}$ and $\|f-g\|_{n}$ denote product metrics corresponding to $\|\cdot\|_{P, 2}$ and $\|\cdot\|_{n}$.) Since each of the classes $\mathcal{F}_{l}$ is Donsker and satisfies $\|P\|_{\mathcal{F}_{l}}<\infty$, the sequence $G_{n}$ is asymptotically equicontinuous with respect to $e_{P}$. (See Theorem 2.9.2 and Problem 2.1.2.) Hence the outer expectation of the first term converges to zero as $n \rightarrow \infty$ followed by $\delta \downarrow 0$. For the second term, note that the classes $\mathcal{F}_{l}-\mathcal{F}_{l}$ are Donsker by Theorem 2.10.3, so that their squares $\left(\mathcal{F}_{l}-\mathcal{F}_{l}\right)^{2}$ are Glivenko-Cantelli in probability, by Lemma 2.10.14. Thus, as $n \rightarrow \infty$,

$$
\begin{aligned}
\sqrt{\log m} \sup _{e_{P}(f, h)<\delta}\|f-h\|_{n} & \xrightarrow{\mathrm{P} *} \sqrt{\log m} \sup _{e_{P}(f, h)<\delta} e_{P}(f, h) \\
& \leq \sum_{l=1}^{k} \sqrt{\log N\left(\delta, \mathcal{F}_{l}, L_{2}(P)\right)} \delta .
\end{aligned}
$$

This converges to zero as $\delta \downarrow 0$, by Lemma 2.10.15. Combination of the preceding displays gives that the left side of (2.10.18) converges to zero in probability as $n \rightarrow \infty$ and next as $\delta \downarrow 0$.

Suppose that the processes $H_{n}$ are separable, so that the variables $\left\|H_{n}-H_{n}\left(h_{j}\right)\right\|_{\mathcal{H}_{j}}$ are measurable. Then it can be concluded that for all positive numbers $\varepsilon$ and $\eta$ there exists a finite partition $\mathcal{F}=\cup_{j=1}^{m} \mathcal{H}_{j}$ such that

$$
\limsup _{n \rightarrow \infty} \mathrm{P}\left(\sup _{j}\left\|H_{n}-H_{n}\left(h_{j}\right)\right\|_{\mathcal{H}_{j}}>\varepsilon\right)<\eta .
$$

This implies that the sequence $H_{n}$ is asymptotically tight in $\ell^{\infty}(\mathcal{F})$, by Theorem 1.5.6.

Define a map $T: \phi \circ \mathcal{F} \mapsto \mathcal{F}$ by assigning to each function $g \in \phi \circ \mathcal{F}$ a unique (but arbitrary) vector $f=T g \in \mathcal{F}$ such that $\phi(f)=g$. The map $z \mapsto z \circ T$ from $\ell^{\infty}(\mathcal{F})$ to $\ell^{\infty}(\phi \circ \mathcal{F})$ is (Lipschitz) continuous. Hence, by the continuous mapping theorem, the sequence of multiplier empirical processes $\mathbb{G}_{n}^{\prime}=H_{n} \circ T$ converges weakly to a tight limit in $\ell^{\infty}(\phi \circ \mathcal{F})$.

Since $\|P\|_{\phi \circ \mathcal{F}}<\infty$, it follows that the sequence of processes $n^{-1 / 2} \sum_{i=1}^{n} \xi_{i}\left(\delta_{X_{i}}-P\right)$ converges weakly to a tight limit as well. By Theorem 2.9.2, the same is true for the sequence of empirical processes $\mathbb{G}_{n}$.

Finally, we remove the assumption that the processes $H_{n}$ are separable. According to Chapter 2.3.3, there exist pointwise-separable versions $\tilde{\mathcal{F}}_{l}$ of the classes $\mathcal{F}_{l}$. Almost every value $\tilde{f}_{l}(x)$ is the limit of a sequence $\tilde{g}_{m, l}(x)$ with each $\tilde{g}_{m, l}$ contained in a countable "separant' of $\tilde{\mathcal{F}}_{l}$. Each element $\tilde{g}_{l}$ of the separant is almost surely equal to an element $g_{l}$ of the original class $\mathcal{F}_{l}$. It follows that, perhaps possibly on a null set of $x$, the function $\phi$ is defined at each vector $\tilde{f}(x)$ or can be extended to this vector by continuity.

The extended function satisfies (2.10.5) on $\tilde{\mathcal{F}} \cup \mathcal{F}$ except perhaps for $x$ in a fixed null set. Then the class of functions $\phi \circ \tilde{\mathcal{F}}$ is (essentially) well defined and is a pointwise-separable version of $\phi \circ \mathcal{F}$. By the preceding argument, $\phi \circ \tilde{\mathcal{F}}$ is Donsker. By (2.10.5),

$$
\sqrt{n}\left\|\mathbb{P}_{n} \phi(f)-\mathbb{P}_{n} \phi(\tilde{f})\right\|_{\mathcal{F}} \lesssim \sum_{l=1}^{k} \sqrt{n}\left\|\mathbb{P}_{n}\left|f_{l}-\tilde{f}_{l}\right|\right\|_{\mathcal{F}_{l}}
$$

According to Theorem 2.3.15, this converges to zero in probability. Thus $\phi \circ \mathcal{F}$ is Donsker also.

### 2.10.3 Permanence of the Uniform Entropy Bound

The main theorem of the preceding subsection combines the minimal condition that the classes $\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}$ are Donsker with the strong condition that $\phi$ is uniformly Lipschitz. It may be expected that stronger assumptions on the classes $\mathcal{F}_{i}$ combined with weaker conditions on $\phi$ will yield the same conclusion that the class $\phi\left(\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}\right)$ is Donsker. Obviously, a concrete formulation of this principle is useful only if it is sufficiently simple, because otherwise it is preferable to deal with the class $\phi\left(\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}\right)$ directly. Uniform entropy, integral-type conditions allow such a simple statement.

Let $\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}$ be classes of measurable functions and $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}$ a given map that is Lipschitz of orders $\alpha_{1}, \ldots, \alpha_{k} \in(0,1]$ in the sense that

$$
\begin{equation*}
|\phi \circ f(x)-\phi \circ g(x)|^{2} \leq \sum_{i=1}^{k} L_{\alpha, i}^{2}(x)\left|f_{i}-g_{i}\right|^{2 \alpha_{i}}(x) \tag{2.10.19}
\end{equation*}
$$

for all $f=\left(f_{1}, \ldots, f_{k}\right)$ and $g=\left(g_{1}, \ldots, g_{k}\right)$ in $\mathcal{F}=\mathcal{F}_{1} \times \cdots \times \mathcal{F}_{k}$ and for every $x$. In the special case that $k=1$, we can set

$$
L_{\alpha}=\sup _{f, g} \frac{|\phi(f)-\phi(g)|}{|f-g|^{\alpha}}
$$

This relaxes condition (2.10.5) in two ways: the functions $L_{\alpha, i}$ need not be bounded, and a lower-order Lipschitz condition suffices. In the following theorem, the first weakening of (2.10.5) is compensated by a moment condition on $L_{\alpha}$; the second by a strengthening of the entropy condition on the $\mathcal{F}_{i}$.

If $\mathcal{F}_{i}$ has envelope function $F_{i}$, then for every pair $f$ and $f_{0}$ in $\mathcal{F}$,

$$
\left|\phi \circ f-\phi \circ f_{0}\right|^{2} \leq 4 \sum_{i=1}^{k} L_{\alpha, i}^{2} F_{i}^{2 \alpha_{i}}
$$

Thus, the function $2\left(\sum_{i=1}^{k} L_{\alpha, i}^{2} F_{i}^{2 \alpha_{i}}\right)^{1 / 2}$, which will be denoted $2 L_{\alpha} \cdot F^{\alpha}$, is an envelope function of the class $\phi(\mathcal{F})-\phi\left(f_{0}\right)$. We use this function to standardize the entropy numbers of the class $\phi \circ \mathcal{F}$.
2.10.20 Theorem. Let $\mathcal{F}_{1}, \ldots, \mathcal{F}_{k}$ be classes of measurable functions with measurable envelopes $F_{i}$, and let $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}$ be a map that satisfies (2.10.19). Then, for every $\delta>0$,

$$
\begin{aligned}
\int_{0}^{\delta} \sup _{Q} \sqrt{\log N} & \left(\varepsilon\left\|L_{\alpha} \cdot F^{\alpha}\right\|_{Q, 2}, \phi(\mathcal{F}), L_{2}(Q)\right) \\
\leq & \sum_{i=1}^{k} \int_{0}^{\delta^{1 / \alpha_{i}}} \sup _{Q} \sqrt{\log N\left(\varepsilon\left\|F_{i}\right\|_{Q, 2 \alpha_{i}}, \mathcal{F}_{i}, L_{2 \alpha_{i}}(Q)\right)} \frac{d \varepsilon}{\varepsilon^{1-\alpha_{i}}}
\end{aligned}
$$

Here the supremum is taken over all finitely discrete probability measures $Q$. Consequently, if the right side is finite and $P^{*}\left(L_{\alpha} \cdot F^{\alpha}\right)^{2}<\infty$, then the class $\phi(\mathcal{F})$ is Donsker provided its members are square integrable and the class is suitably measurable.

Proof. For a given finitely discrete probability measure $Q$, define measures $R_{i}$ by $d R_{i}=L_{\alpha, i}^{2} d Q$. Then

$$
\|\phi \circ f-\phi \circ g\|_{Q, 2}^{2} \leq \sum R_{i}\left|f_{i}-g_{i}\right|^{2 \alpha_{i}} .
$$

For each $i$, construct a minimal $\varepsilon^{1 / \alpha_{i}}\left\|F_{i}\right\|_{R_{i}, 2 \alpha_{i}}$-net $\mathcal{G}_{i}$ for $\mathcal{F}_{i}$ with respect to the $L_{2 \alpha_{i}}\left(R_{i}\right)$-norm. Then the set of points $\phi\left(g_{1}, \ldots, g_{k}\right)$ with $\left(g_{1}, \ldots, g_{k}\right)$ ranging over all possible combinations of $g_{i}$ from $\mathcal{G}_{i}$ forms a net for $\phi(\mathcal{F})$ of $L_{2}(Q)$-size bounded by the square root of

$$
\sum \varepsilon^{2}\left\|F_{i}\right\|_{R_{i}, 2 \alpha_{i}}^{2 \alpha_{i}}=\varepsilon^{2} Q \sum L_{\alpha, i}^{2} F_{i}^{2 \alpha_{i}}
$$

This equals $\varepsilon^{2}\left\|L_{\alpha} \cdot F^{\alpha}\right\|_{Q, 2}^{2}$. Conclude that

$$
N\left(\varepsilon\left\|L_{\alpha} \cdot F^{\alpha}\right\|_{Q, 2}, \phi(\mathcal{F}), L_{2}(Q)\right) \leq \prod_{i=1}^{k} N\left(\varepsilon^{1 / \alpha_{i}}\left\|F_{i}\right\|_{R_{i}, 2 \alpha_{i}}, \mathcal{F}_{i}, L_{2 \alpha_{i}}\left(R_{i}\right)\right) .
$$

Since expressions of the type $N\left(\varepsilon\|F\|_{c R, r}, \mathcal{F}, L_{r}(c R)\right)$ are constant in $c$, the bound is also valid with $R_{i}$ replaced by the probability measure $R_{i} / R_{i} 1$.

If $Q$ ranges over all finitely discrete measures, then each of the $R_{i}$ runs through finitely discrete measures. Substitute the bound of the preceding display in the left side of the theorem, and next make a change of variables $\varepsilon^{1 / \alpha_{i}} \mapsto \varepsilon$ to conclude the proof.
2.10.21 Example. If $\mathcal{F}$ satisfies the uniform entropy condition and $P^{*} F^{2 k}<\infty$ for $k>1$, then $\mathcal{F}^{k}$ is Donsker if suitably measurable. In comparison with Theorem 2.10.6, this result has traded a stronger entropy condition for a weaker (almost optimal) condition on the envelope function: Theorem 2.10.6 shows that $\mathcal{F}^{k}$ is Donsker if $\mathcal{F}$ is Donsker and uniformly bounded.

The present result follows since $\left|f^{k}-g^{k}\right| \leq|f-g|(2 F)^{k-1}$, so that (2.10.19) applies with $\alpha=1$ and $L=(2 F)^{k-1}$.
2.10.22 Example. Let the functions in $\mathcal{F}$ be nonnegative with lower envelope function $\underline{F}$, and consider the class $\sqrt{\mathcal{F}}$. If $\mathcal{F}$ satisfies the uniformentropy condition and $P^{*} F^{2} / \underline{F}<\infty$, then $\sqrt{\mathcal{F}}$ is Donsker if suitably measurable. This follows since $|\sqrt{f}-\sqrt{g}| \leq|f-g| / \sqrt{\underline{F}}$.

The conclusion that $\sqrt{\mathcal{F}}$ is Donsker can also be obtained under other combinations of moment and entropy conditions. First, Theorem 2.10.6 shows that $\sqrt{\mathcal{F}}$ is Donsker if $\mathcal{F}$ is Donsker and $\underline{F} \geq \delta>0$. This combines a stronger assumption on the lower envelope with a weaker entropy condition. Second, the present theorem can be applied with a different Lipschitz order. For $1 / 2 \leq \alpha \leq 1$,

$$
\frac{|\sqrt{f}-\sqrt{g}|}{|f-g|^{\alpha}}=\frac{|\sqrt{f}-\sqrt{g}|^{1-\alpha}}{|\sqrt{f}+\sqrt{g}|^{\alpha}} \leq(2 \sqrt{\underline{F}})^{1-2 \alpha}
$$

Thus, a suitably measurable class $\sqrt{\mathcal{F}}$ is Donsker if, for some $\alpha \geq 1 / 2$, the upper and lower envelopes of $\mathcal{F}$ satisfy $P^{*} F^{2 \alpha} \underline{F}^{1-2 \alpha}<\infty$ and, in addition, $\mathcal{F}$ satisfies

$$
\int_{0}^{\infty} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2 \alpha}, \mathcal{F}, L_{2 \alpha}(Q)\right)} \frac{d \varepsilon}{\varepsilon^{1-\alpha}}<\infty
$$

It appears that finiteness of the integral is more restrictive than a finite uniform $L_{2}$-entropy integral (though the supremum in the integrand is increasing in $\alpha$ ). For polynomial classes $\mathcal{F}$ and more generally classes with uniform $L_{1}$-entropy of the order $(1 / \varepsilon)^{r}$ with $r<1$, the integral is certainly finite for $\alpha=1 / 2$. For such classes, the class $\sqrt{\mathcal{F}}$ is Donsker provided its envelope $\sqrt{F}$ is square integrable.
2.10.23 Example. Let $\mathcal{F}$ and $\mathcal{G}$ satisfy the uniform-entropy condition and be suitably measurable. Then $\mathcal{F} \mathcal{G}$ is Donsker provided the envelopes $F$ and $G$ satisfy $P^{*} F^{2} G^{2}<\infty$.

This follows from the theorem with $L_{\alpha}=(G, F)$ and Lipschitz orders $\alpha=(1,1)$.

### 2.10.4 Partitions of the Sample Space

Let $\mathcal{X}=\cup_{j=1}^{\infty} \mathcal{X}_{j}$ be a partition of $\mathcal{X}$ into measurable sets, and let $\mathcal{F}_{j}$ be the class of functions $f 1_{\mathcal{X}_{j}}$ when $f$ ranges over $\mathcal{F}$. If the class $\mathcal{F}$ is Donsker, then each class $\mathcal{F}_{j}$ is Donsker. This follows from Theorem 2.10.6, because a restriction is a contraction in the sense that $\left|\left(f 1_{\mathcal{X}_{j}}\right)(x)-\left(g 1_{\mathcal{X}_{j}}\right)(x)\right| \leq |f(x)-g(x)|$ for every $x$. Consider the converse of this statement. While the sum of infinitely many Donsker classes need not be Donsker, it is clear that if each $\mathcal{F}_{j}$ is Donsker and the classes $\mathcal{F}_{j}$ become suitably small as $j \rightarrow \infty$, then $\mathcal{F}$ is Donsker.
2.10.24 Theorem. For each $j$, let the $\mathcal{F}_{j}$, the restriction of $\mathcal{F}$ to $\mathcal{X}_{j}$, be Donsker and satisfy

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{j}} \leq C c_{j},
$$

for a constant $C$ not depending on $j$ or $n$. If $\sum_{j=1}^{\infty} c_{j}<\infty$ and $P^{*} F<\infty$ for some envelope function, then the class $\mathcal{F}$ is Donsker.

Proof. We can assume without loss of generality that the class $\mathcal{F}$ contains the constant function 1.

Since $\mathcal{F}_{j}$ is Donsker, the sequence of empirical processes indexed by $\mathcal{F}_{j}$ converges in distribution in $\ell^{\infty}\left(\mathcal{F}_{j}\right)$ to a tight brownian bridge $\mathbb{H}_{j}$ for each $j$. This implies that $\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{j}} \rightarrow \mathrm{E}\left\|\mathbb{H}_{j}\right\|_{\mathcal{F}_{j}}$. Thus, $\mathrm{E}\left\|\mathbb{H}_{j}\right\|_{\mathcal{F}_{j}} \leq C c_{j}$. Let $Z_{j}$ be a standard normal variable independent of $\mathbb{H}_{j}$, constructed on the same probability space. Since $\sup _{f \in \mathcal{F}_{j}}|P f|<\infty$, the process $f \mapsto \mathbb{Z}_{j}(f)= \mathbb{H}_{j}(f)+Z_{j} P f$ is well defined on $\mathcal{F}_{j}$ and takes its values in $\ell^{\infty}\left(\mathcal{F}_{j}\right)$. We can construct these processes for different $j$ as independent random elements on a single probability space. Then the series $\mathbb{Z}(f)=\sum_{j=1}^{\infty} \mathbb{Z}_{j}\left(f 1_{\mathcal{X}_{j}}\right)$ converges in second mean for every $f$, and satisfies $\mathrm{E} \mathbb{Z}(f) \mathbb{Z}(g)=P f g$, for every $f$ and $g$. Thus, the series defines a version of a brownian motion process. Since each of the processes $\left\{\mathbb{Z}_{j}\left(f 1_{\mathcal{X}_{j}}\right): f \in \mathcal{F}\right\}$ has bounded and uniformly continuous sample paths with respect to the $L_{2}(P)$-seminorm, so have the partial sums $\mathbb{Z}_{\leq k}=\left\{\sum_{j=1}^{k} \mathbb{Z}_{j}\left(f 1_{\mathcal{X}_{j}}\right): f \in \mathcal{F}\right\}$. Furthermore,

$$
\begin{aligned}
\mathrm{E} \sup _{f \in \mathcal{F}}\left|\sum_{j>k} \mathbb{Z}_{j}\left(f 1_{\mathcal{X}_{j}}\right)\right| & \leq \sum_{j>k}\left(\mathrm{E}\left\|\mathbb{H}_{j}\right\|_{\mathcal{F}_{j}}+\mathrm{E}\left|Z_{j}\right| P^{*} F 1_{\mathcal{X}_{j}}\right) \\
& \leq C \sum_{j>k} c_{j}+\sqrt{\frac{2}{\pi}} P^{*} F 1_{\cup_{j>k} \mathcal{X}_{j}}
\end{aligned}
$$

This converges to zero as $k \rightarrow \infty$. Thus the series $\mathbb{Z}(f)=\sum_{j=1}^{\infty} \mathbb{Z}_{j}\left(f 1_{\mathcal{X}_{j}}\right)$ converges in mean in the space $\ell^{\infty}(\mathcal{F})$. By the Ito-Nisio theorem, it also converges almost surely. Conclude that almost all sample paths of the process $\mathbb{Z}$ are bounded and uniformly continuous. Since $\mathrm{E}\|\mathbb{Z}\|_{\mathcal{F}}<\infty$, the class $\mathcal{F}$ is totally bounded in $L_{2}(P)$, by Sudakov's inequality. Hence $\mathbb{Z}$ is a tight version of a brownian motion process indexed by $\mathcal{F}$. The process $\mathbb{G}(f)=\mathbb{Z}(f)-\mathbb{Z}(1) P f$ defines a tight brownian bridge process indexed by $\mathcal{F}$. We have proved that $\mathcal{F}$ is pre-Gaussian.

For each $k$ set $\mathbb{G}_{n, \leq k}(f)=\mathbb{G}_{n}\left(f 1_{\cup_{j \leq k} \mathcal{X}_{j}}\right)$. The continuity modulus of the process $\left\{\mathbb{G}_{n, \leq k}(f) ; f \in \mathcal{F}\right\}$ is bounded by the continuity modulus of the empirical process indexed by the sum class $\sum_{j \leq k} \mathcal{F}_{j}$. Since the sum of finitely many Donsker classes is Donsker we can conclude that the sequence $\left(\mathbb{G}_{n, \leq k}\right)_{n=1}^{\infty}$ is asymptotically tight in $\ell^{\infty}(\mathcal{F})$. Considering the marginal distributions, we can conclude that the sequence converges in distribution to

$$
\mathbb{G}_{\leq k}(f)=\mathbb{Z}_{\leq k}(f)-d_{k} \mathbb{Z}_{\leq k}(1) P f 1_{\cup_{j \leq k} \mathcal{X}_{j}}
$$

as $n \rightarrow \infty$ for each fixed $k$, for $d_{k}$ a solution to the equation $d^{2} P\left(\cup_{j \leq k} \mathcal{X}_{j}\right)- 2 d=-1$.

As $k \rightarrow \infty$, the sequence $\mathbb{G}_{\leq k}$ converges almost surely, whence in distribution to $\mathbb{G}$ in $\ell^{\infty}(\mathcal{F})$. Since weak convergence to a tight limit is metrizable, and the array $\mathbb{G}_{n, \leq k}$ converges along every row to limits that converge to $\mathbb{G}$, there exist integers $k_{n} \rightarrow \infty$ such that the sequence $\mathbb{G}_{n, \leq k_{n}}$ converges in distribution to $\mathbb{G}$. We also have that the sequence $\mathbb{G}_{n}-\mathbb{G}_{n, \leq k_{n}}$ converges in outer probability to zero, since

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}-\mathbb{G}_{n, \leq k_{n}}\right\|_{\mathcal{F}} \leq C \sum_{j>k_{n}} c_{j} \rightarrow 0
$$

An application of Slutsky's lemma completes the proof.
Methods to obtain maximal inequalities for the $L_{1}$-norm are discussed in Section 2.14.1. We give three applications of the preceding theorem.
2.10.25 Example (Smooth functions). Let $\mathbb{R}^{d}=\cup_{j=1}^{\infty} \mathcal{X}_{j}$ be a partition of $\mathbb{R}^{d}$ into uniformly bounded, convex sets with nonempty interior. Consider the class $\mathcal{F}$ of functions such that the class $\mathcal{F}_{j}$ of restrictions is contained in $C_{M_{j}}^{\alpha}\left(\mathcal{X}_{j}\right)$ for each $j$ for given constants $M_{j}$.

If $\alpha>d / 2$ and $\sum_{j=1}^{\infty} M_{j} P\left(\mathcal{X}_{j}\right)^{1 / 2}<\infty$, then the class $\mathcal{F}$ is $P$-Donsker.
2.10.26 Example (Closed convex sets). Let $\mathbb{R}^{2}=\cup_{j=1}^{\infty} \mathcal{X}_{j}$ be a partition into squares of fixed size. Let $\mathcal{C}$ be the class of closed convex subsets of $\mathbb{R}^{2}$.

Then $\mathcal{C}$ is $P$-Donsker for every probability measure $P$ with a density $p$ such that $\sum\|p\|_{\mathcal{X}_{j}}^{1 / 2}<\infty$. In particular, this is the case if $\left(1+|x y|^{2+\delta}\right) p(x, y)$ is bounded for some $\delta>0$.
2.10.27 Example (Monotone functions). Consider the class $\mathcal{F}$ of all nondecreasing functions $f: \mathbb{R} \rightarrow \mathbb{R}$, such that $0 \leq f \leq F$, for a given nondecreasing function $F$. This class is Donsker provided $\|F\|_{2,1}<\infty$.

To see this, first reduce the problem to the case of uniform $[0,1]$ observations by the quantile transformation. If $P^{-1}$ is the quantile function corresponding to the underlying measure $P$, then the class $\mathcal{F} \circ P^{-1}$ is Donsker with respect to the uniform measure if and only if $\mathcal{F}$ is $P$-Donsker. The class $\mathcal{G}=\mathcal{F} \circ P^{-1}$ consists of monotone functions $g:[0,1] \rightarrow \mathbb{R}$, with $0 \leq g \leq F \circ P^{-1}$. Furthermore,

$$
\int_{0}^{1} \frac{F \circ P^{-1}}{\sqrt{1-u}} d u \leq \int \frac{F(x)}{\sqrt{1-P(-\infty, x]}} d P(x)
$$

By partial integration the latter can be shown to be finite if and only if $\|F\|_{2,1}$ is finite. For simplicity of notation assume now that $P$ is the uniform measure.

Use the theorem with the partition into the intervals $\mathcal{X}_{j}=\left(x_{j}, x_{j+1}\right]$, with $x_{j}=1-2^{-j}$ for each integer $j \geq 0$. The condition of the theorem involves the series

$$
\sum_{j=0}^{\infty}\left\|F_{j}\right\|_{P, 2}=\sum_{j=1}^{\infty} \frac{F\left(1-2^{-j}\right)}{\sqrt{1-\left(1-2^{-j}\right)}} 2^{-j} \leq 2 \int_{0}^{1} \frac{F(u)}{\sqrt{1-u}} d u .
$$

The result follows by the quantile transformation.

## Problems and Complements

1. Let $\left\{\psi_{i}\right\}$ be an orthonormal base of a subspace of $L_{2}(P)$ that contains $\mathcal{F}$ and the constant functions, and let $Z_{1}, Z_{2}, \ldots$ be i.i.d. standard normally distributed random variables. If $\mathcal{F}$ is $P$-pre-Gaussian, then the series $\sum_{i=1}^{\infty} Z_{i}\left(P(f-P f) \psi_{i}\right)$ is almost surely convergent in $\ell^{\infty}(\mathcal{F})$ and represents a tight Brownian bridge process.
[Hint: The series converges in second mean for every single $f$, and the limit process (series) $\left\{\mathbb{G}(f): f \in L_{2}(P)\right\}$ is a well-defined stochastic process that is continuous in second mean with respect to $\rho_{P}$. Since $\mathcal{F}$ is separable, the latter implies that $\{\mathbb{G}(f): f \in \mathcal{F}\}$ is a separable process. A separable version of a uniformly continuous process is automatically uniformly continuous. Thus, $\{\mathbb{G}(f): f \in \mathcal{F}\}$ defines a tight Brownian bridge.

Let $\mathbb{G}_{n}$ be the $n$th partial sum of the series, and set $\mathcal{F}_{\delta}=\{f-g: f, g \in \left.\mathcal{F}, \rho_{P}(f-g)<\delta\right\}$. By Jensen's inequality, $\mathrm{E}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{\delta}} \leq \mathrm{E}\|\mathbb{G}\|_{\mathcal{F}_{\delta}}$. Since $\mathcal{F}$ is pre-Gaussian, the right side converges to zero as $\delta \downarrow 0$. Hence the sequence $\mathbb{G}_{n}$ is uniformly tight in $\ell^{\infty}(\mathcal{F})$. Since $\mathbb{G}_{n}-\mathbb{G} \rightsquigarrow 0$ marginally, it follows that $\mathbb{G}_{n}-\mathbb{G} \rightsquigarrow 0$ in $\ell^{\infty}(\mathcal{F})$. By the Itô-Nisio theorem A.1.3, it converges almost surely also.]
2. The bounded Lipschitz distance between the normal distributions $N\left(0, \sigma^{2}\right)$ and $N\left(0, \tau^{2}\right)$ on the line is bounded below by $|\sigma-\tau| g\left(1 \wedge \tau^{-1} \wedge \sigma^{-1}\right)$ for $g(t)=t^{2} \phi(t)$ and $\phi$ the standard normal density.
[Hint: For $0 \leq c \leq 1$, the function $h(x)=(c-|x|) \vee 0$ is contained in $\mathrm{BL}_{1}(\mathbb{R})$. For $\sigma<\tau$, the integral $\left|\int(h(x \sigma)-h(x \tau)) \pi(x) d x\right|$ is bounded below by $\phi(c / \tau)$ times $\int_{-c / \tau}^{c / \tau}(h(x \sigma)-h(x \tau)) d x=(\tau-\sigma)(c / \tau)^{2}$. Take $c=\tau \wedge 1$.]
3. For any class $\mathcal{F}$ of functions with envelope function $F$ and $0<r<s<\infty$,

$$
\sup _{Q} N\left(2 \varepsilon\|F\|_{Q, s}, \mathcal{F}, L_{s}(Q)\right) \leq \sup _{Q} N\left(2 \varepsilon^{r / s}\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right)
$$

if the supremum is taken over all finitely discrete measures.
[Hint: If $d R=(2 F)^{s-r} d Q$, then $\|f-g\|_{Q, s} \leq\|f-g\|_{R, r}^{r / s}$.]
4. Fcr any class $\mathcal{F}$ of functions with strictly positive envelope function $F$, the expression $\sup _{Q} N\left(\varepsilon\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right)$, where the supremum is taken over all finitely discrete measures, is nondecreasing in $0<r<\infty$. (Here $L_{r}(Q)$ is equipped with $\left(Q|f|^{r}\right)^{1 / r}$ even though this is not a norm for $r<1$.)
[Hint: Given $r<s$ and $Q$ define $d R=F^{r-s} d Q$. Then $Q|f-g|^{r} \leq \| f- g\left\|_{R, s}^{r}\right\| F \|_{R, s}^{s-r}$, by Hölder's inequality, with $(p, q)=(s / r, s /(s-r))$.]
5. The expression $N\left(\varepsilon\|a F\|_{b Q, r}, a \mathcal{F}, L_{r}(b Q)\right)$ is constant in $a$ and $b$.
6. If $\mathcal{F}$ is $P$-pre-Gaussian and $A$ : $L_{2}(P) \mapsto L_{2}(P)$ is continuous, then the class $\{A f: f \in \mathcal{F}\}$ is $P$-pre-Gaussian.
7. If $\mathcal{F}$ is $P$-Donsker and $A$ : $\mathcal{L}_{2}(P) \mapsto \mathcal{L}_{2}(P)$ is an orthogonal projection, then the class $\{A f: f \in \mathcal{F}\}$ is not necessarily $P$-Donsker.
8. If both $\mathcal{F}$ and $\mathcal{G}$ are Donsker, then the class $\mathcal{F} \cdot \mathcal{G}$ of products $x \mapsto f(x) g(x)$ is Glivenko-Cantelli in probability.

### 2.11

## The Central Limit Theorem for Processes

So far we have focused on limit theorems and inequalities for the empirical process of independent and identically distributed random variables. Most of the methods of proof apply more generally. In this chapter we indicate some extensions to the case of independent but not identically distributed processes.

We consider the general situation of sums of independent stochastic processes $\left\{Z_{n i}(f): f \in \mathcal{F}\right\}$ with bounded sample paths indexed by an arbitrary set $\mathcal{F}$.

### 2.11.1 Random Entropy

For each $n$, let $Z_{n 1}, \ldots, Z_{n m_{n}}$ be independent stochastic processes indexed by a common (arbitrary) semimetric space $(\mathcal{F}, \rho)$. As usual, for computation of outer expectations, the independence is understood in the sense that the processes are defined on a product probability space $\prod_{i=1}^{m_{n}}\left(\mathcal{X}_{n i}, \mathcal{A}_{n i}, P_{n i}\right)$ with each $Z_{n i}(f)=Z_{n i}(f, x)$ depending only on the $i$ th coordinate of $x= \left(x_{1}, \ldots, x_{m_{n}}\right)$. In the first theorem it is assumed that every one of the maps

$$
\begin{aligned}
& \left(x_{1}, \ldots, x_{m_{n}}\right) \mapsto \sup _{\rho(f, g)<\delta}\left|\sum_{i=1}^{m_{n}} e_{i}\left(Z_{n i}(f)-Z_{n i}(g)\right)\right| \\
& \left(x_{1}, \ldots, x_{m_{n}}\right) \mapsto \sup _{\rho(f, g)<\delta}\left|\sum_{i=1}^{m_{n}} e_{i}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2}\right|
\end{aligned}
$$

is measurable, for every $\delta>0$, every vector $\left(e_{1}, \ldots, e_{m_{n}}\right) \in\{-1,0,1\}^{m_{n}}$, and every natural number $n$. (Measurability for the completion of the probability spaces $\prod_{i=1}^{m_{n}}\left(\mathcal{X}_{n i}, \mathcal{A}_{n i}, P_{n i}\right)$ suffices.)

Define a random semimetric by

$$
d_{n}^{2}(f, g)=\sum_{i=1}^{m_{n}}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2}
$$

The simplest result on marginal convergence of the processes $\sum_{i=1}^{m_{n}} Z_{n i}$ is the Lindeberg central limit theorem. The following theorem gives a uniform central limit theorem under a Lindeberg condition on norms combined with a condition on entropies with respect to the random semimetric $d_{n}$, a "random entropy condition."
2.11.1 Theorem. For each $n$, let $Z_{n 1}, \ldots, Z_{n, m_{n}}$ be independent stochastic processes indexed by a totally bounded semimetric space $(\mathcal{F}, \rho)$. Assume that the sums $\sum_{i=1}^{m_{n}} e_{i} Z_{n i}$ are measurable as indicated and that

$$
\begin{aligned}
& \sum_{i=1}^{m_{n}} \mathrm{E}^{*}\left\|Z_{n i}\right\|_{\mathcal{F}}^{2}\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}>\eta\right\} \rightarrow 0, \text { for every } \eta>0, \\
& \sup _{\rho(f, g)<\delta_{n}} \sum_{i=1}^{m_{n}} \mathrm{E}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2} \rightarrow 0, \text { for every } \delta_{n} \downarrow 0, \\
&2) \int_{0}^{\delta_{n}} \sqrt{\log N\left(\varepsilon, \mathcal{F}, d_{n}\right)} d \varepsilon \xrightarrow{\mathrm{P} *} 0, \\
& \text { for every } \delta_{n} \downarrow 0 .
\end{aligned}
$$

Then the sequence $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)$ is asymptotically $\rho$-equicontinuous. It converges in distribution in $\ell^{\infty}(\mathcal{F})$ provided the sequence of covariance functions converges pointwise on $\mathcal{F} \times \mathcal{F}$.

Proof. The Lindeberg condition for norms implies the Lindeberg condition for marginals. Together with the assumption that the covariance function converges, this gives marginal weak convergence (to a Gaussian process).

Set $Z_{n i}^{o}=Z_{n i}-\mathrm{E} Z_{n i}$, and let $\delta_{n} \downarrow 0$ be arbitrary. For fixed $t$ and sufficiently large $n$ Chebyshev's inequality and the second condition give the bound $\mathrm{P}\left(\left|\sum_{i=1}^{m_{n}} Z_{n i}^{o}(f)-Z_{n i}^{o}(g)\right|>t / 2\right) \leq 1 / 2$ for every pair $f, g$ with $\rho(f, g)<\delta_{n}$. By the symmetrization lemma, Lemma 2.3.7, for sufficiently large $n$,

$$
\begin{aligned}
& \mathrm{P}^{*}\left(\sup _{\rho(f, g)<\delta_{n}}\left|\sum_{i=1}^{m_{n}} Z_{n i}^{o}(f)-Z_{n i}^{o}(g)\right|>t\right) \\
& \quad \leq 4 \mathrm{P}\left(\sup _{\rho(f, g)<\delta_{n}}\left|\sum_{i=1}^{m_{n}} \varepsilon_{i}\left(Z_{n i}(f)-Z_{n i}(g)\right)\right|>\frac{t}{4}\right) .
\end{aligned}
$$

For fixed values of the processes $Z_{n 1}, \ldots, Z_{n m_{n}}$, define the subset $A_{n} \subset \mathbb{R}^{m_{n}}$ as the set of all vectors $\left(Z_{n 1}(f)-Z_{n 1}(g), \ldots, Z_{n m_{n}}(f)-Z_{n m_{n}}(g)\right)$ when the pairs ( $f, g$ ) range over the set $\left\{(f, g) \in \mathcal{F} \times \mathcal{F}: \rho(f, g)<\delta_{n}\right\}$. By Hoeffding's
inequality, Lemma 2.2.7, the stochastic process $\left\{\sum \varepsilon_{i} a_{i}: a \in A_{n}\right\}$ is subGaussian for the Euclidean metric on $A_{n}$. By Theorem 2.2.8,

$$
\mathrm{E}_{\varepsilon} \sup _{\rho(f, g)<\delta_{n}}\left|\sum_{i=1}^{m_{n}} \varepsilon_{i}\left(Z_{n i}(f)-Z_{n i}(g)\right)\right| \lesssim \int_{0}^{\infty} \sqrt{\log N\left(\varepsilon, A_{n},\|\cdot\|\right)} d \varepsilon
$$

where $\|\cdot\|$ is the Euclidean norm. The integrand can be bounded using the inequality $N\left(\varepsilon, A_{n},\|\cdot\|\right) \leq N^{2}\left(\varepsilon / 2, \mathcal{F}, d_{n}\right)$. Furthermore, if

$$
\theta_{n}^{2}=\sup _{a \in A_{n}} \sum_{i=1}^{m_{n}} a_{i}^{2}=\left\|\sum_{i=1}^{m_{n}} a_{i}^{2}\right\|_{A_{n}}
$$

then, for $\varepsilon>\theta_{n}$, the set $A_{n}$ fits in the ball of radius $\varepsilon$ around the origin and the integrand vanishes. Conclude from this and the entropy condition (2.11.2) that the integral converges to zero in outer probability if $\theta_{n} \rightarrow 0$ in probability. Under the measurability assumption, this implies the asymptotic equicontinuity of the sequence $\sum_{i=1}^{m_{n}} Z_{n i}^{o}$.

By the Lindeberg condition, there exists a sequence of numbers $\eta_{n} \downarrow 0$ such that $\mathrm{E}^{*}\left\|\sum a_{i}^{2}\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}^{*}>\eta_{n}\right\}\right\|_{A_{n}}$ converges to zero. Thus, for showing that $\theta_{n} \xrightarrow{\mathrm{P} *} 0$, it is not a loss of generality to assume that each $Z_{n i}$ satisfies $\left\|Z_{n i}\right\|_{\mathcal{F}} \leq \eta_{n}$. Fix $Z_{n 1}, \ldots, Z_{n m_{n}}$, and take an $\varepsilon$-net $B_{n}$ for $A_{n}$ for the Euclidean norm. For every $a \in A_{n}$, there exists $b \in B_{n}$ with
$\left|\sum \varepsilon_{i} a_{i}^{2}\right|=\left|\sum \varepsilon_{i}\left(a_{i}-b_{i}\right)^{2}+2 \sum \varepsilon_{i}\left(a_{i}-b_{i}\right) b_{i}+\sum \varepsilon_{i} b_{i}^{2}\right| \leq \varepsilon^{2}+2 \varepsilon\|b\|+\left|\sum \varepsilon_{i} b_{i}^{2}\right|$.
By Hoeffding's inequality, Lemma 2.2.7, the variable $\sum \varepsilon_{i} b_{i}^{2}$ has Orlicz norm for $\psi_{2}$ bounded by a multiple of $\left(\sum b_{i}^{4}\right)^{1 / 2} \leq \eta_{n}\left(\sum b_{i}^{2}\right)^{1 / 2}$. Apply Lemma 2.2.2 to the third term on the right, and replace suprema over $B_{n}$ by suprema over $A_{n}$ to obtain

$$
\mathrm{E}_{\varepsilon}\left\|\sum \varepsilon_{i} a_{i}^{2}\right\|_{A_{n}} \lesssim \varepsilon^{2}+2 \varepsilon\left\|\sum a_{i}^{2}\right\|_{A_{n}}^{1 / 2}+\sqrt{1+\log \left|B_{n}\right|} \eta_{n}\left\|\sum a_{i}^{2}\right\|_{A_{n}}^{1 / 2} .
$$

The size of the $\varepsilon$-net can be chosen $\left|B_{n}\right| \leq N^{2}\left(\varepsilon / 2, \mathcal{F}, d_{n}\right)$. By the entropy condition (2.11.2), this variable is bounded in probability (Problem 2.11.1). Conclude that for some constant $K$,

$$
\begin{aligned}
& \mathrm{P}\left(\left\|\sum \varepsilon_{i} a_{i}^{2}\right\|_{A_{n}}>t\right) \\
& \quad \leq \mathrm{P}^{*}\left(\left|B_{n}\right|>M\right)+\frac{K}{t}\left[\varepsilon^{2}+\left(\varepsilon+\eta_{n} \sqrt{\log M}\right) \mathrm{E}\left\|\sum a_{i}^{2}\right\|_{A_{n}}^{1 / 2}\right]
\end{aligned}
$$

For $M$ and $t$ sufficiently large, the right side is smaller than $1-v_{1}$ for the constant $v_{1}$ in Hoffmann-Jørgensen's Proposition A.1.5. More precisely, this can be achieved for $M$ such that $\mathrm{P}^{*}\left(\left|B_{n}\right|>M\right) \leq\left(1-v_{1}\right) / 2$ and $t$ equal to $\left(1-v_{1}\right) / 2$ times the numerator of the second term. Then $t$ is bigger than the $v_{1}$-quantile of the variable $\left\|\sum \varepsilon_{i} a_{i}^{2}\right\|_{A_{n}}$. Thus, Proposition A.1.5 yields

$$
\begin{aligned}
\mathrm{E}\left\|\sum \varepsilon_{i} a_{i}^{2}\right\|_{A_{n}} & \lesssim \mathrm{E}\left\|\max a_{i}^{2}\right\|_{A_{n}}+t \\
& \lesssim \eta_{n}^{2}+\varepsilon^{2}+\left(\varepsilon+\eta_{n} \sqrt{\log M}\right)\left(\mathrm{E}\left\|\sum a_{i}^{2}\right\|_{A_{n}}\right)^{1 / 2}
\end{aligned}
$$

By the second assumption of the theorem, $\left\|\sum \mathrm{E} a_{i}^{2}\right\|_{A_{n}} \rightarrow 0$. Combine this with Lemma 2.3.6 to see that

$$
\mathrm{E}\left\|\sum a_{i}^{2}\right\|_{A_{n}} \leq \mathrm{E}\left\|\sum \varepsilon_{i} a_{i}^{2}\right\|_{A_{n}}+o(1) \leq \zeta+\zeta\left(\mathrm{E}\left\|\sum a_{i}^{2}\right\|_{A_{n}}\right)^{1 / 2}
$$

for $\zeta>\varepsilon^{2} \vee \varepsilon$ and sufficiently large $n$. The inequality $c \leq \zeta+\zeta \sqrt{c}$ for a nonnegative number $c$ implies that $c \leq\left(\zeta+\sqrt{\zeta^{2}+4 \zeta}\right)^{2}$. Apply this to $c=\mathrm{E}\left\|\sum a_{i}^{2}\right\|_{A_{n}}$ and conclude that $\mathrm{E}\left\|\sum a_{i}^{2}\right\|_{A_{n}} \rightarrow 0$ as $n$ tends to infinity.
2.11.3 Example (I.i.d. observations). The empirical process of a sample $X_{1}, \ldots, X_{n}$ studied in the earlier sections of this part can be recovered by setting $Z_{n i}(f)=n^{-1 / 2} f\left(X_{i}\right)$. In this situation, $\mathcal{F}$ is a class of measurable functions on the sample space.

Theorem 2.11.1 implies that the class $\mathcal{F}$ is Donsker if it is suitably measurable, is totally bounded in $L_{2}(P)$, possesses a square-integrable envelope, and satisfies for every sequence $\delta_{n} \downarrow 0$

$$
\int_{0}^{\delta_{n}} \sqrt{\log N\left(\varepsilon, \mathcal{F}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon \xrightarrow{\mathbf{P}} 0
$$

The latter random-entropy condition is certainly satisfied if $\mathcal{F}$ satisfies the uniform-entropy condition (2.5.1) and the envelope function is squareintegrable. Thus, Theorem 2.11.1 is a generalization of Theorem 2.5.2.
2.11.4 Example (Truncation). The Lindeberg condition on the norms is certainly not necessary for the central limit theorem. In combination with truncation, the preceding theorem applies to more general processes. Consider stochastic processes $Z_{n 1}, \ldots, Z_{n m_{n}}$ such that

$$
\sum_{i=1}^{m_{n}} \mathrm{P}^{*}\left(\left\|Z_{n i}\right\|_{\mathcal{F}}>\eta\right) \rightarrow 0, \quad \text { for every } \eta>0
$$

Then the truncated processes $Z_{n i, \eta}(f)=Z_{n i}(f) 1\left\{\left\|Z_{n i}\right\|_{\mathcal{F}} \leq \eta\right\}$ satisfy

$$
\sum_{i=1}^{m_{n}} Z_{n i}-\sum_{i=1}^{m_{n}} Z_{n i, \eta} \xrightarrow{\mathrm{P} *} 0, \quad \text { in } \ell^{\infty}(\mathcal{F})
$$

Since this is true for every $\eta>0$, it is also true for every sequence $\eta_{n} \downarrow 0$ that converges to zero sufficiently slowly. The processes $Z_{n i, \eta_{n}}$ certainly satisfy the Lindeberg condition. If they (or the centered processes $\left.Z_{n i, \eta_{n}}-\mathrm{E} Z_{n i, \eta_{n}}\right)$ also satisfy the other conditions of the theorem, then the sequence $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i, \eta_{n}}\right)$ converges weakly in $\ell^{\infty}(\mathcal{F})$. The random semimetrics $d_{n}$ decrease by the truncation. Hence the conditions for the truncated processes are weaker than those for the original processes.

### 2.11.1.1 Measurelike Processes

The preceding theorem is valid for arbitrary index sets $\mathcal{F}$. Consider the special case that $\mathcal{F}$ is a set of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ on a measurable space $(\mathcal{X}, \mathcal{A})$ that satisfies a uniform-entropy condition:

$$
\begin{equation*}
\int_{0}^{\infty} \sup _{Q \in \mathcal{Q}} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon<\infty . \tag{2.11.5}
\end{equation*}
$$

Then the preceding theorem readily yields a central limit theorem for processes with increments that are bounded by a (random) $L_{2}$-metric on $\mathcal{F}$. Call the processes $Z_{n i}$ measurelike with respect to (random) measures $\mu_{n i}$ if

$$
\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2} \leq \int(f-g)^{2} d \mu_{n i}, \quad \text { every } f, g \in \mathcal{F}
$$

For measurelike processes, the random semimetric $d_{n}$ is bounded by the $L_{2}\left(\sum \mu_{n i}\right)$-semimetric, and the entropy condition (2.11.2) can be related to the uniform-entropy condition.
2.11.6 Lemma. Let $\mathcal{F}$ be a class of measurable functions with envelope function $F$. Let $Z_{n 1}, \ldots, Z_{n m_{n}}$ be measurelike processes indexed by $\mathcal{F}$. If $\mathcal{F}$ satisfies the uniform-entropy condition (2.11.5) for a set $\mathcal{Q}$ that contains the measures $\mu_{n i}$ and $\sum_{i=1}^{m_{n}} \mu_{n i} F^{2}=O_{P}^{*}(1)$, then the entropy condition (2.11.2) is satisfied.

Proof. Set $\mu_{n}=\sum_{i=1}^{m_{n}} \mu_{n i}$. Since $d_{n}$ is bounded by the $L_{2}\left(\mu_{n}\right)$-semimetric, we have

$$
\begin{aligned}
& \int_{0}^{\delta_{n}} \sqrt{\log N\left(\varepsilon, \mathcal{F}, d_{n}\right)} d \varepsilon \\
& \quad \leq \int_{0}^{\delta_{n} /\|F\|_{\mu_{n}}} \sqrt{\log N\left(\varepsilon\|F\|_{\mu_{n}}, \mathcal{F}, L_{2}\left(\mu_{n}\right)\right)} d \varepsilon\|F\|_{\mu_{n}}
\end{aligned}
$$

on the set where $\|F\|_{\mu_{n}}^{2}=\mu_{n} F^{2}$ is finite. Abbreviate

$$
J(\delta)=\int_{0}^{\delta} \sup _{Q} \sqrt{\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon .
$$

On the set where $\|F\|_{\mu_{n}}>\eta$, the right side of the next-to-last displayed equation is bounded by $J\left(\delta_{n} / \eta\right) O_{P}(1)$. This converges to zero in probability for every $\eta>0$. On the set where $\|F\|_{\mu_{n}} \leq \eta$, we have the bound $J(\infty) \eta$. This can be made arbitrarily small by the choice of $\eta$. Thus, the entropy condition (2.11.2) is satisfied.
2.11.7 Example. Suppose the independent processes $Z_{n 1}, \ldots, Z_{n m_{n}}$ are measurelike. Let $\mathcal{F}$ satisfy the uniform-entropy condition. Assume that, for some probability measure $P$ with $P^{*} F^{2}<\infty$,

$$
\begin{aligned}
\mathrm{E}^{*} \sum_{i=1}^{m_{n}} \mu_{n i} F^{2}\left\{\mu_{n i} F^{2}>\eta\right\} & \rightarrow 0, \quad \text { for every } \eta>0, \\
\sup _{\|f-g\|_{P, 2}<\delta_{n}} \mathrm{E}^{*} \sum_{i=1}^{m_{n}} \mu_{n i}(f-g)^{2} & \rightarrow 0, \quad \text { for every } \delta_{n} \downarrow 0, \\
\sum_{i=1}^{m_{n}} \mu_{n i} F^{2} & =O_{P}^{*}(1) .
\end{aligned}
$$

Then the preceding lemma verifies the entropy condition (2.11.2), while the first two conditions of the display ensure the other conditions of Theorem 2.11.1. Note that $\left\|Z_{n i}\right\|_{\mathcal{F}} \leq\left|Z_{n i}(f)\right|+4 \mu_{n i} F^{2}$ for any $f$.

Thus, the sequence $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)$ converges in $\ell^{\infty}(\mathcal{F})$ provided that the sequence of covariance functions converges pointwise and that measurability conditions are met.
2.11.8 Example (Weighted empirical processes). For each $n$, let $X_{n 1}, \ldots, X_{n m_{n}}$ be independent random elements in a measurable space $(\mathcal{X}, \mathcal{A})$. Let $X_{n i}$ have law $P_{n i}$ and let $P_{n i} f$ exist for each element $f$ of a class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$. Given a triangular array of constants $c_{n i}$, consider the weighted empirical process $\mathbb{G}_{n}(f)= \sum_{i=1}^{m_{n}} c_{n i}\left(f\left(X_{n i}\right)-P_{n i} f\right)$. Suppose $\mathcal{F}$ satisfies the uniform-entropy condition and that

$$
\begin{array}{r}
\max _{1 \leq i \leq m_{n}}\left|c_{n i}\right| \rightarrow 0 \\
\sum_{i=1}^{m_{n}} c_{n i}^{2} P_{n i} \leq P
\end{array}
$$

for a probability measure $P$ with $P^{*} F^{2}<\infty$.
Then under measurability conditions, the sequence $\mathbb{G}_{n}$ converges weakly to a Gaussian process in $\ell^{\infty}(\mathcal{F})$, provided the sequence converges marginally. Furthermore, there is a version of the limit process with uniformly continuous sample paths with respect to the $L_{2}(P)$-semimetric.

This follows from the preceding example applied to the processes $Z_{n i}= c_{n i} \delta_{X_{n i}}$, which are measurelike for the measures $\mu_{n i}=c_{n i}^{2} \delta_{X_{n i}}$.

### 2.11.2 Bracketing

For each $n$, let $Z_{n 1}, \ldots, Z_{n m_{n}}$ be independent stochastic processes indexed by a common index set $\mathcal{F}$. In this chapter we aim at generalizations of the bracketing central limit theorem, Theorem 2.5.6, in two directions: we
prove a version for the non-i.i.d. case, and we also weaken the entropy conditions to conditions involving the existence of either majorizing measures or certain Gaussian processes.

For the first generalization, define, for every $n$, the bracketing number $N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}^{n}\right)$ as the minimal number of sets $N_{\varepsilon}$ in a partition $\mathcal{F}=\cup_{j=1}^{N_{\varepsilon}} \mathcal{F}_{\varepsilon j}^{n}$ of the index set into sets $\mathcal{F}_{\varepsilon j}^{n}$ such that, for every partitioning set $\mathcal{F}_{\varepsilon j}^{n}$

$$
\sum_{i=1}^{m_{n}} \mathrm{E}^{*} \sup _{f, g \in \mathcal{F}_{\varepsilon j}^{n}}\left|Z_{n i}(f)-Z_{n i}(g)\right|^{2} \leq \varepsilon^{2}
$$

Note that the partitions are allowed to depend on $n$.
2.11.9 Theorem (Bracketing central limit theorem). For each $n$, let $Z_{n 1}, \ldots, Z_{n, m_{n}}$ be independent stochastic processes with finite second moments indexed by a totally bounded semimetric space $(\mathcal{F}, \rho)$. Suppose

$$
\begin{aligned}
\sum_{i=1}^{m_{n}} \mathrm{E}^{*}\left\|Z_{n i}\right\|_{\mathcal{F}}\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}>\eta\right\} \rightarrow 0, & \text { for every } \eta>0, \\
\sup _{\rho(f, g)<\delta_{n}} \sum_{i=1}^{m_{n}} \mathrm{E}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2} \rightarrow 0, & \text { for every } \delta_{n} \downarrow 0, \\
\int_{0}^{\delta_{n}} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}^{n}\right)} d \varepsilon \rightarrow 0, & \text { for every } \delta_{n} \downarrow 0 .
\end{aligned}
$$

Then the sequence $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)$ is asymptotically tight in $\ell^{\infty}(\mathcal{F})$ and converges in distribution provided it converges marginally. If the partitions can be chosen independent of $n$, then the middle of the displayed conditions is unnecessary.

A central limit theorem for the empirical process of i.i.d. observations can be recovered from the preceding theorem by setting $Z_{n i}(f)= n^{-1 / 2} f\left(X_{i}\right)$. Then the bracketing numbers in the theorem may be reduced to $N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)$. The resulting theorem is weaker than the bracketing central limit theorem, Theorem 2.5.6, in that the latter theorem uses a combination of $L_{2}(P)$ - and $L_{2, \infty}(P)$-entropies. In the present theorem the $L_{2}$-entropies may also be replaced by smaller numbers: the preceding theorem remains true if $N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}^{n}\right)$ is replaced by the minimal number of sets $N_{\varepsilon}$ in a partition $\mathcal{F}=\cup_{j=1}^{N_{\varepsilon}} \mathcal{F}_{\varepsilon j}^{n}$ of the index set in sets $\mathcal{F}_{\varepsilon j}^{n}$ such that, for every $j$ and every $n$,

$$
\begin{gathered}
\sup _{f, g \in \mathcal{F}_{\varepsilon j}^{n}} \sum_{i=1}^{m_{n}} \mathrm{E}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2} \leq \varepsilon^{2}, \\
\sup _{t>0} \sum_{i=1}^{m_{n}} t^{2} \mathrm{P}^{*}\left(\sup _{f, g \in \mathcal{F}_{\varepsilon j}^{n}}\left|Z_{n i}(f)-Z_{n i}(g)\right|>t\right) \leq \varepsilon^{2} .
\end{gathered}
$$

These bracketing numbers appear to be rather hard to work with.

Another refinement of the theorem is to replace its entropy assumption by a majorizing measure condition. This entails the existence of partitions $\mathcal{F}=\cup_{j} \mathcal{F}_{\varepsilon j}^{n}$ as before and discrete probability measures $\mu_{n}$ on $\mathcal{F}$ such that

$$
\begin{equation*}
\sup _{f} \int_{0}^{\delta_{n}} \sqrt{\log \frac{1}{\mu_{n}\left(\mathcal{F}_{\varepsilon}^{n} f\right)}} d \varepsilon \rightarrow 0, \quad \text { for every } \delta_{n} \downarrow 0 \tag{2.11.10}
\end{equation*}
$$

Here $\mathcal{F}_{\varepsilon}^{n} f$ is defined as the partitioning set at level $\varepsilon$ to which $f$ belongs. This majorizing measure condition is a weakening of finiteness of the entropy integral. Entropies correspond to certain uniform majorizing measures; the majorizing measure criterion permits one to measure the size of $\mathcal{F}$ in a nonuniform way. ${ }^{\sharp}$

Majorizing measures are also hard to work with. The resulting central limit theorem can be expressed more elegantly in terms of the existence of Gaussian semimetrics. For simplicity, we utilize only a single semimetric, although it may be fruitful to allow the semimetric to depend on $n$. Call a semimetric $\rho$ Gaussian if it is the standard deviation semimetric

$$
\rho(f, g)=\left(\mathrm{E}(G(f)-G(g))^{2}\right)^{1 / 2}
$$

of a tight, zero-mean, Gaussian random element $G$ in $\ell^{\infty}(\mathcal{F})$. The connection with majorizing measures is the characterization of continuity of Gaussian processes by majorizing measures. See Appendix A.2.3 for a discussion. In this chapter this deep characterization is used only in the proof of the following theorem to translate its condition into the majorizing measure condition (2.11.10). The proof itself is next based on the existence of the majorizing measure.

Call a semimetric $\rho$ Gaussian-dominated if it is bounded above (on $\mathcal{F} \times \mathcal{F}$ ) by a Gaussian semimetric. Any semimetric $\rho$ such that

$$
\int_{0}^{\infty} \sqrt{\log N(\varepsilon, \mathcal{F}, \rho)} d \varepsilon<\infty
$$

is Gaussian-dominated (see Problem 2.11.4).
2.11.11 Theorem (Bracketing by Gaussian hypotheses). For each $n$, let $Z_{n 1}, \ldots, Z_{n, m_{n}}$ be independent stochastic processes indexed by an arbitrary index set $\mathcal{F}$. Suppose that there exists a Gaussian-dominated semimetric $\rho$ on $\mathcal{F}$ such that

$$
\begin{aligned}
& \sum_{i=1}^{m_{n}} \mathrm{E}^{*}\left\|Z_{n i}\right\|_{\mathcal{F}}\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}>\eta\right\} \rightarrow 0, \quad \text { for every } \eta>0 \\
& \sum_{i=1}^{m_{n}} \mathrm{E}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2} \leq \rho^{2}(f, g), \quad \text { for every } f, g,
\end{aligned}
$$

[^1]$$
\sup _{t>0} \sum_{i=1}^{m_{n}} t^{2} \mathrm{P}^{*}\left(\sup _{f, g \in B(\varepsilon)}\left|Z_{n i}(f)-Z_{n i}(g)\right|>t\right) \leq \varepsilon^{2},
$$
for every $\rho$-ball $B(\varepsilon) \subset \mathcal{F}$ of radius less than $\varepsilon$ and for every $n$. Then the sequence $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)$ is asymptotically tight in $\ell^{\infty}(\mathcal{F})$. It converges in distribution provided it converges marginally.

The specialization of the preceding theorem to the case of i.i.d. observations is of interest because of the use of a Gaussian semimetric instead of entropy integrals. For instance, the theorem contains the classical ChibisovO'Reilly theorem on the weighted empirical distribution function on the real line (see Example 2.11.15).

To recover the i.i.d. case, let $X_{1}, \ldots, X_{n}$ be a random sample in a measurable space $(\mathcal{X}, \mathcal{A})$. For a class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$, set $Z_{n i}(f)=f\left(X_{i}\right) / \sqrt{n}$. Recall that $\|f\|_{P, 2, \infty}$ is the weak $L_{2}$-pseudonorm, defined as the square root of $\sup _{t>0} t^{2} P(|f|>t)$.
2.11.12 Corollary. Let $\mathcal{F}$ be a pre-Gaussian class of measurable functions whose envelope function possesses a weak second moment. Suppose there exists a Gaussian-dominated semimetric $\rho$ on $\mathcal{F}$ such that, for every $\varepsilon>0$,

$$
\left\|\sup _{f, g \in B(\varepsilon)}|f-g|\right\|_{P, 2, \infty} \leq \varepsilon,
$$

for every $\rho$-ball $B(\varepsilon) \subset \mathcal{F}$ of radius $\varepsilon$. Then $\mathcal{F}$ is $P$-Donsker.
Proof. Since $\mathcal{F}$ is $P$-pre-Gaussian and $\|P\|_{\mathcal{F}} \leq P^{*} F<\infty$, there exists a tight version of Brownian motion. This means that the $L_{2}(P)$ semimetric $e_{P}$ is Gaussian. The semimetric $d=\sqrt{e_{P}^{2}+\rho^{2}}$ is the standard deviation metric of the sum of Brownian motion and an independent copy of the process corresponding to $\rho$. Thus, this semimetric is Gaussian also. The conditions of the preceding theorem are satisfied for $d$ playing the role of $\rho$. ■
2.11.13 Example (Jain-Marcus theorem). For each natural number $n$, let $Z_{n 1}, \ldots, Z_{n, m_{n}}$ be independent stochastic processes indexed by an arbitrary index set $\mathcal{F}$ such that

$$
\left|Z_{n i}(f)-Z_{n i}(g)\right| \leq M_{n i} \rho(f, g), \quad \text { for every } f, g
$$

for independent random variables $M_{n 1}, \ldots, M_{n, m_{n}}$ and a semimetric $\rho$ such that

$$
\begin{gathered}
\int_{0}^{\infty} \sqrt{\log N(\varepsilon, \mathcal{F}, \rho)} d \varepsilon<\infty \\
\sum_{i=1}^{m_{n}} E M_{n i}^{2}=O(1)
\end{gathered}
$$

If the triangular array of norms $\left\|Z_{n i}\right\|_{\mathcal{F}}$ satisfies the Lindeberg condition, then the sequence $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)$ converges in distribution in $\ell^{\infty}(\mathcal{F})$ to a tight Gaussian process provided the sequence of covariance functions converges pointwise on $\mathcal{F} \times \mathcal{F}$.

This follows from Theorems 2.11.9 and 2.11.11. The entropy condition implies that $\rho$ is Gaussian-dominated.

In view of the preceding discussion, the conditions may be relaxed in two ways: the $L_{2}$-norm can be partly replaced by the weak $L_{2}$-norm, and the entropy criterion can be replaced by the majorizing measure criterion.
2.11.14 Example. Let $Z, Z_{1}, Z_{2}, \ldots$ be i.i.d. stochastic processes indexed by the unit interval $\mathcal{F}=[0,1] \subset \mathbb{R}$, with $\|Z\|_{\mathcal{F}} \leq 1$, such that

$$
\mathrm{E}|Z(f)-Z(g)| \leq K|f-g|,
$$

for some constant $K$. Then the sequence $n^{-1 / 2} \sum_{i=1}^{n}\left(Z_{i}-\mathrm{E} Z_{i}\right)$ converges in distribution to a tight Gaussian process in $\ell^{\infty}[0,1]$. Note that the condition bounds the mean of the increments, not the increments themselves as required by the Jain-Marcus theorem. On the other hand, the index set must be a compact interval in the real line and the processes uniformly bounded.

The result can be deduced from Theorem 2.11.11. For every interval $[a, a+\varepsilon]$,
$\sup _{a<f \leq g<a+\varepsilon}|Z(f)-Z(g)| \leq \lim _{n \rightarrow \infty} \sum_{k=1}^{2^{n}}\left|Z\left(a+\varepsilon k 2^{-n}\right)-Z\left(a+\varepsilon(k-1) 2^{-n}\right)\right|$.
(The process is separable, with any dense subset of $[0,1]$ as the separant, because it is continuous in probability; the sums on the right side are increasing in $n$ and bound dyadic increments.) The right-hand side has mean bounded by $K \varepsilon$. Since the processes are bounded by 1

$$
\mathrm{E} \sup _{a<f \leq g<a+\varepsilon}|Z(f)-Z(g)|^{2} \leq 2 K \varepsilon .
$$

Every set of diameter $\varepsilon$ for the semimetric $\rho(f, g)=|f-g|^{1 / 2}$ is contained in an interval $\left[a, a+\varepsilon^{2}\right]$. Conclude that the the condition of Theorem 2.11.11 is up to a constant satisfied for this semimetric. This semimetric is Gaussiandominated, because it has a finite entropy integral.
2.11.15 Example (Weighted empirical distribution function). Let $X_{1}, X_{2}, \ldots$ be i.i.d. random variables with the uniform distribution $P$ on $[0,1] \subset \mathbb{R}$. For a fixed function $q:(0,1 / 2] \mapsto \mathbb{R}^{+}$, consider the class of functions

$$
\mathcal{F}=\left\{\frac{1_{(0, t]}}{q(t)}: 0<t \leq \frac{1}{2}\right\} .
$$

For simplicity, assume that the function $1 / q$ is decreasing. The empirical process indexed by this class is the classical weighted empirical process
(restricted to $0<t \leq 1 / 2$ for convenience). According to the ChibisovO'Reilly theorem ${ }^{\dagger}$ the following statements are equivalent:
(i) $\mathcal{F}$ is Donsker;
(ii) $\mathcal{F}$ is pre-Gaussian and $1 / q(t)=o(1 / \sqrt{t})$;
(iii) $\int_{0}^{1 / 2} t^{-1} \exp \left(-\varepsilon q^{2}(t) / t\right) d t<\infty$, for every $\varepsilon>0$.

The equivalence of (ii) and (iii) can be argued from properties of Brownian motion. Here we deduce that (ii) implies (i) from Theorem 2.11.11.

In view of the second condition of (ii), the envelope function $F= (1 / q) 1_{(0,1 / 2]}$ has a weak second moment and $\|P\|_{\mathcal{F}}=\sup \{t / q(t): 0<t \leq 1 / 2\}$ is finite. Hence the pre-Gaussianness implies the existence of a tight version of Brownian motion; its standard deviation metric is Gaussian. Since for $s<t$,

$$
\frac{1_{(0, s]}}{q(s)}-\frac{1_{(0, t]}}{q(t)}=\frac{1_{(s, t]}}{q(t)}+\left(\frac{1}{q(t)}-\frac{1}{q(s)}\right) 1_{(0, s]}
$$

the square of this metric equals

$$
\rho^{2}(s, t)=\frac{t-s}{q^{2}(t)}+\left|\frac{1}{q(t)}-\frac{1}{q(s)}\right|^{2} s, \quad s \leq t
$$

If $\rho(s, t)<\varepsilon$, then both terms on the right are bounded by $\varepsilon^{2}$. Conclude that for every fixed $s$,

$$
\sup _{\substack{s<t \\ \rho(s, t)<\varepsilon}}\left|\frac{1_{(0, s]}}{q(s)}-\frac{1_{(0, t)}}{q(t)}\right| \leq \sup _{t>s} \frac{\varepsilon 1_{(s, t]}}{\sqrt{t-s}}+\frac{\varepsilon 1_{(0, s]}}{\sqrt{s}}=\frac{\varepsilon 1_{(s, 1]}}{\sqrt{\cdot-s}}+\frac{\varepsilon 1_{(0, s]}}{\sqrt{s}} .
$$

The $L_{2, \infty}(P)$-norm of the function $x \mapsto 1_{(s, 1]} / \sqrt{x-s}$ equals 1 for every $s$. It follows that the $L_{2, \infty}(P)$-norm of the left side of the preceding display is bounded by a multiple of $\varepsilon$.
2.11.16 Example (Monotone processes). Let $Z$ be a stochastic process indexed by an interval $[a, b] \subset \overline{\mathbb{R}}$, whose sample paths $t \mapsto Z(t)$ are nondecreasing. If $\mathrm{E} Z^{2}(a)<\infty$ and $\mathrm{E} Z^{2}(b)<\infty$, then $Z$ satisfies the central limit theorem in $\ell^{\infty}[a, b]$. More precisely, if $Z_{1}, Z_{2}, \ldots$ are i.i.d. copies of $Z$, then the sequence $n^{-1 / 2} \sum_{i=1}^{n}\left(Z_{i}-\mathrm{E} Z_{i}\right)$ converges in $\ell^{\infty}[a, b]$ to a tight Gaussian process.

We shall derive this from Theorem 2.11.9. The condition that $Z(a)$ and $Z(b)$ have finite second moments is necessary for the convergence of the processes evaluated at $a$ and $b$, respectively. If we would be interested in the convergence of the processes in $\ell^{\infty}(a, b)$, then the square integrability could be relaxed considerably, as is clear from the preceding example.

Since we can replace $Z(t)$ by $Z(t)-Z(a)$, we may assume that $Z(a)=0$. The envelope function of $Z$ is $\|Z\|=Z(b)$ and is square integrable by assumption. It suffices to verify the entropy condition of Theorem 2.11.9, where we shall choose the partitions independent of $n$. Define

[^2]$F(t)=\mathrm{E} Z(t) Z(b)$. This function is right-continuous with left limits, and is nondecreasing from $F(a)=0$ to $F(b)=\mathrm{E} Z^{2}(b)$. Given $\varepsilon>0$ choose a partition $a=t_{0}<t_{1}<\cdots<t_{N}=b$ such that $F\left(t_{i}-\right)-F\left(t_{i}\right)<\varepsilon^{2}$ for every $i$. Then, for every $i$,
$$
\mathrm{E} \sup _{t_{i-1} \leq s, t<t_{i}}|Z(s)-Z(t)|^{2} \leq \mathrm{E}\left(Z\left(t_{i}-\right)-Z\left(t_{i-1}\right)\right) Z(b)<\varepsilon^{2} .
$$

The number of points in the partition can be chosen smaller than a constant times $1 / \varepsilon^{2}$. (Make sure that the points where $F$ jumps more than $\varepsilon^{2}$ are among $t_{0}, \ldots, t_{N}$.) Thus the entropy condition of Theorem 2.11.9 is satisfied easily for the partition $[a, b]=\cup\left(t_{i-1}, t_{i}\right] \cup\{a\}$.

The proof of the theorems is based on Bernstein's inequality combined with a chaining argument that utilizes majorizing measures. The following lemma is used to control the finite suprema over the links at a fixed level in the chain.
2.11.17 Lemma. Let $X$ be an arbitrary random variable such that

$$
\mathrm{P}(|X|>x) \leq 2 e^{-\frac{1}{2} \frac{x^{2}}{b+a x}}
$$

for every $x>0$. Then there exists a universal constant $K$ such that

$$
\mathrm{E}|X| 1_{A} \leq K\left(a \log \frac{1}{\mu}+\sqrt{b} \sqrt{\log \frac{1}{\mu}}\right)(\mu+\mathrm{P}(A)),
$$

for every measurable set $A$ and every constant $0<\mu<e^{-1}$.
Proof. The condition implies the upper bound $2 \exp \left(-x^{2} /(4 b)\right)$ on $P(|X|> x)$, for every $x \leq b / a$, and the upper bound $2 \exp (-x /(4 a))$, for all other positive $x$. Consequently, the same upper bounds hold for all $x>0$ for the probabilities $\mathrm{P}(|X| 1\{|X| \leq b / a\}>x)$ and $\mathrm{P}(|X| 1\{|X|>b / a\}>x)$, respectively. By Lemma 2.2.1, this implies that the Orlicz norms $\| X 1\{|X| \leq b / a\} \|_{\psi_{2}}$ and $\|X 1\{|X|>b / a\}\|_{\psi_{1}}$ are up to constants bounded by $\sqrt{b}$ and $a$, respectively. For any random variable $Y$, Jensen's inequality yields for any convex, increasing, nonnegative function $\psi$,

$$
\begin{aligned}
\mathrm{E}|Y| 1_{A} & \leq \psi^{-1}\left(\mathrm{E} \psi\left(\frac{|Y|}{\|Y\|_{\psi}}\right) \frac{1_{A}}{\mathrm{P}(A)}\right)\|Y\|_{\psi} \mathrm{P}(A) \\
& \leq \psi^{-1}\left(\frac{1}{\mathrm{P}(A)}\right)\|Y\|_{\psi} \mathrm{P}(A)
\end{aligned}
$$

Apply this to the random variables $|X| 1\{|X| \leq b / a\}$ and $|X| 1\{|X|>b / a\}$ separately and use the triangle inequality to find that

$$
\mathrm{E}|X| 1_{A} \lesssim \psi_{2}^{-1}\left(\frac{1}{\mathrm{P}(A)}\right) \sqrt{b} \mathrm{P}(A)+\psi_{1}^{-1}\left(\frac{1}{\mathrm{P}(A)}\right) a \mathrm{P}(A)
$$

Finally, apply the inequality $p \log ^{k}(1+1 / p) \lesssim(p+\mu) \log ^{k}(1 / \mu)$, which is valid for small $\mu>0$ and $k=1 / 2,1$.

Proof of Theorems 2.11.9 and 2.11.11. There exists a sequence of numbers $\eta_{n} \downarrow 0$ such that $\sum \mathrm{E}^{*}\left\|Z_{n i}\right\|_{\mathcal{F}}\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}>\eta_{n}\right\} \rightarrow 0$. Therefore, it is no loss of generality to assume that $\left\|Z_{n i}\right\|_{\mathcal{F}} \leq \eta_{n}$ for every $i$ and $n$. Otherwise, replace $Z_{n i}$ by $Z_{n i} 1\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}^{*} \leq \eta_{n}\right\}$; the conditions of the theorems remain valid, and the difference between the centered sums and the centered truncated sums converges to zero.

Under the conditions of the theorems, there exists for every $n$ a sequence of nested partitions $\mathcal{F}=\cup_{j} \mathcal{F}_{q j}^{n}$ and discrete subprobability measures $\mu_{n}$ on $\mathcal{F}$ such that, for every $j$ and $n$,

$$
\begin{gather*}
\lim _{q_{0} \rightarrow \infty} \limsup _{n \rightarrow \infty} \sup _{f} \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{\mu_{n}\left(\mathcal{F}_{q}^{n} f\right)}}=0  \tag{2.11.18}\\
\sup _{f, g \in \mathcal{F}_{q j}^{n}} \sum_{i=1}^{m_{n}} \mathrm{E}\left(Z_{n i}(f)-Z_{n i}(g)\right)^{2} \leq 2^{-2 q} \\
\sup _{t>0} \sum_{i=1}^{m_{n}} t^{2} \mathrm{P}^{*}\left(\sup _{f, g \in \mathcal{F}_{q j}^{n}}\left|Z_{n i}(f)-Z_{n i}(g)\right|>t\right) \leq 2^{-2 q}
\end{gather*}
$$

Here $\mathcal{F}_{q}^{n} f$ is the set in the $q$ th partition to which $f$ belongs. Under the conditions of Theorem 2.11.9, this is true with $1 / \mu_{n}\left(\mathcal{F}_{q}^{n} f\right)$ replaced by the number $N_{q}^{n}$ of sets in the $q$-th partition. The measures $\mu_{n}$ can then be constructed as $\mu_{n}=\sum_{q} 2^{-q} \mu_{n, q}$, where $\mu_{n, q}\left(\mathcal{F}_{q}^{n} f\right)=\left(N_{q}^{n}\right)^{-1}$, for every $f$ and $q$. (Alternatively, the expression $1 / \mu_{n}\left(\mathcal{F}_{q}^{n} f\right)$ can be replaced by $N_{q}^{n}$ throughout the proof.) Under the conditions of Theorem 2.11.11, a single measure $\mu=\mu_{n}$ can be derived from a majorizing measure corresponding to the Gaussian semimetric $\rho$. The existence of this measure is indicated in Proposition A.2.17. The construction of a sequence of partitions (in sets of $\rho$-diameter at most $2^{-q}$ ) is carried out in Lemma A.2.19. In the following, it is not a loss of generality to assume that $\mu_{n}\left(\mathcal{F}_{q}^{n} f\right) \leq 1 / 4$ for every $q$ and $f$. Most of the argument is carried out for a fixed $n$; this index will be suppressed in the notation.

The remainder of the proof is similar to the proof of Theorem 2.5.6, except that Lemma 2.11.17 is substituted for Lemma 2.2.10 in the chaining argument, which now uses majorizing measures. Choose an element $f_{q j}$ from each partitioning set $\mathcal{F}_{q j}$ and define

$$
\begin{aligned}
\pi_{q} f & =f_{q j} \\
\left(\Delta_{q} f\right)_{n i} & =\sup _{f, g \in \mathcal{F}_{q j}}\left|Z_{n i}(f)-Z_{n i}(g)\right|, \quad \text { if } f \in \mathcal{F}_{q j} \\
a_{q} f & =2^{-q} / \sqrt{\log \frac{1}{\mu\left(\mathcal{F}_{q+1} f\right)}}
\end{aligned}
$$

Next, for $q>q_{0}$, define indicator functions

$$
\begin{aligned}
\left(A_{q-1} f\right)_{n i} & =1\left\{\left(\Delta_{q_{0}} f\right)_{n i} \leq a_{q_{0}} f, \ldots,\left(\Delta_{q-1} f\right)_{n i} \leq a_{q-1} f\right\} \\
\left(B_{q} f\right)_{n i} & =1\left\{\left(\Delta_{q_{0}} f\right)_{n i} \leq a_{q_{0}} f, \ldots,\left(\Delta_{q-1} f\right)_{n i} \leq a_{q-1} f,\left(\Delta_{q} f\right)_{n i}>a_{q} f\right\} \\
\left(B_{q_{0}} f\right)_{n i} & =1\left\{\left(\Delta_{q_{0}} f\right)_{n i}>a_{q_{0}} f\right\}
\end{aligned}
$$

The indicator functions $A_{q} f$ and $B_{q} f$ are constant in $f$ on each of the partitioning sets $\mathcal{F}_{q j}$ at level $q$, because the partitions are nested. Now decompose:

$$
\begin{align*}
& Z_{n i}(f)-Z_{n i}\left(\pi_{q_{0}} f\right)=\left(Z_{n i}(f)-Z_{n i}\left(\pi_{q_{0}} f\right)\right)\left(B_{q_{0}} f\right)_{n i} \\
& \quad+\sum_{q_{0}+1}^{\infty}\left(Z_{n i}(f)-Z_{n i}\left(\pi_{q} f\right)\right)\left(B_{q} f\right)_{n i}  \tag{2.11.19}\\
& \quad+\sum_{q_{0}+1}^{\infty}\left(Z_{n i}\left(\pi_{q} f\right)-Z_{n i}\left(\pi_{q-1} f\right)\right)\left(A_{q-1} f\right)_{n i}
\end{align*}
$$

Center each term at zero expectation; take the sum over $i$; and, finally, take the supremum over $f$ for all three terms on the right separately. It will be shown that the resulting expressions converge to zero in mean as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$, whence the centered processes $Z_{n i}^{o}$ satisfy

$$
\begin{equation*}
\lim _{q_{0} \rightarrow \infty} \limsup _{n \rightarrow \infty} \mathrm{E}^{*}\left\|\sum_{i=1}^{m_{n}}\left(Z_{n i}^{o}(f)-Z_{n i}^{o}\left(\pi_{q_{0}}^{n} f\right)\right)\right\|_{\mathcal{F}}=0 \tag{2.11.20}
\end{equation*}
$$

In view of Theorem 1.5.6, this gives a complete proof in the case that the partitions do not depend on $n$. The case that the partitions depend on $n$ requires an additional argument, given at the end of this proof.

Since $\left(\Delta_{q} f\right)_{n i} \leq 2 \eta_{n}$, the first term in (2.11.19) is zero as soon as $2 \eta_{n} \leq \inf _{f} a_{q_{0}} f$. For every fixed $q_{0}$, this is true for sufficiently large $n$, because, by assumption (2.11.18), $\inf _{f} a_{q} f$ (which depends on $n$ ) is bounded away from zero as $n \rightarrow \infty$ for every fixed $q_{0}$.

By the nesting of the partitions, $\left(\Delta_{q} f\right)_{n i} \leq\left(\Delta_{q-1} f\right)_{n i}$, which is bounded by $a_{q-1} f$ on the set where $\left(B_{n} q f\right)_{n i}=1$. It follows that

$$
\begin{aligned}
\left|Z_{n i}(f)-Z_{n i}\left(\pi_{q} f\right)\right|\left(B_{q} f\right)_{n i} & \leq\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i} \leq a_{q-1} f, \\
\operatorname{var}\left(\sum_{i=1}^{m_{n}}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}\right) & \left.\leq \sum_{i=1}^{m_{n}} a_{q-1} f \mathrm{E}\left(\Delta_{q} f\right)_{n i}\left\{\Delta_{q} f\right)_{n i}>a_{q} f\right\} \\
& \leq 2 \frac{a_{q-1} f}{a_{q} f} 2^{-2 q},
\end{aligned}
$$

by Problem 2.5.6. Combination with Bernstein's inequality 2.2.9 shows that the random variable $\sum_{i=1}^{m_{n}}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}$ centered at its expectation satisfies the condition of Lemma 2.11.17 with $b=2\left(a_{q-1} f / a_{q} f\right) 2^{-2 q}$ and
$a=2 a_{q-1} f$. Thus, the lemma implies that, for every $f$ and measurable set A,

$$
\begin{aligned}
& \mathrm{E}\left|\sum_{i=1}^{m_{n}}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}-\mathrm{E}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}\right| 1_{A} \\
& \quad \lesssim\left(a_{q-1} f \log \frac{1}{\mu\left(\mathcal{F}_{q} f\right)}+\sqrt{\frac{a_{q-1} f}{a_{q} f}} 2^{-q} \sqrt{\log \frac{1}{\mu\left(\mathcal{F}_{q} f\right)}}\right)\left(\mathrm{P}(A)+\mu\left(\mathcal{F}_{q} f\right)\right) \\
& \quad \lesssim 2^{-q} \sqrt{\log \frac{1}{\mu\left(\mathcal{F}_{q} f\right)}}\left(\mathrm{P}(A)+\mu\left(\mathcal{F}_{q} f\right)\right)
\end{aligned}
$$

since $\mu\left(\mathcal{F}_{q+1} f\right) \leq \mu\left(\mathcal{F}_{q} f\right)$. For each $q$, let $\Omega=\cup_{j} \Omega_{q j}$ be a partition of the underlying probability space such that the maximum $\left\|\sum_{i=1}^{m_{n}}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}-\mathrm{E}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}\right\|_{\mathcal{F}}$ is achieved at $f_{q j}$ on the set $\Omega_{q j}$. For every $q$, there are as many sets $\Omega_{q j}$ as there are sets $\mathcal{F}_{q j}$ in the $q$ th partition. Then

$$
\begin{aligned}
& \left.\mathrm{E} \| \sum_{q>q_{0}} \sum_{i=1}^{m_{n}}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}-\mathrm{E}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i}\right) \|_{\mathcal{F}} \\
& \quad \leq \sum_{q>q_{0}} \sum_{j} \mathrm{E}\left|\sum_{i=1}^{m_{n}}\left(\Delta_{q} f_{q j}\right)_{n i}\left(B_{q} f_{q j}\right)_{n i}-\mathrm{E}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f_{q j}\right)_{n i}\right| 1_{\Omega_{q j}} \\
& \quad \leq \sum_{j} \sup _{f} \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{\mu\left(\mathcal{F}_{q} f\right)}}\left(\mathrm{P}\left(\Omega_{q j}\right)+\mu\left(\mathcal{F}_{q} f_{q j}\right)\right) \\
& \quad \leq 2 \sup _{f} \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{\mu\left(\mathcal{F}_{q} f\right)}} .
\end{aligned}
$$

This converges to zero as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$ and takes care of the second term resulting from the decomposition (2.11.19), apart from the centering. The centering is bounded by

$$
\begin{aligned}
\sum_{q>q_{0}} \sum_{i=1}^{m_{n}} \mathrm{E}\left(\Delta_{q} f\right)_{n i}\left(B_{q} f\right)_{n i} & \leq \sum_{q>q_{0}} \sum_{i=1}^{m_{n}} \mathrm{E}\left(\Delta_{q} f\right)_{n i}\left\{\left(\Delta_{q} f\right)_{n i}>a_{q} f\right\} \\
& \leq \sup _{f} \sup _{t>0} \sum_{q>q_{0}} \frac{2^{-2 q}}{a_{q} f} \lesssim \sup _{f} \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{\mu\left(\mathcal{F}_{q} f\right)}}
\end{aligned}
$$

This concludes the proof that the second term in the decomposition resulting from (2.11.19) converges to zero as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$.

The third term can be handled in a similar manner. The proof of (2.11.20) is complete.

Finally, if the partitions depend on $n$, then the discrepancies at the ends of the chains must be analyzed separately. If the $q_{0}$ th partition consists of
$N_{q_{0}}^{n}$ sets, then the combination of Bernstein's inequality and Lemma 2.2.10 yields
$\mathrm{E} \sup _{\rho(f, g)<\delta_{n}}\left|\sum_{i=1}^{m_{n}} Z_{n i}^{o}\left(\pi_{q_{0}}^{n} f\right)-Z_{n i}^{o}\left(\pi_{q_{0}}^{n} g\right)\right| \lesssim \log N_{q_{0}}^{n} \eta_{n}+\sqrt{\log N_{q_{0}}^{n}}\left(2^{-q_{0}}+\delta_{n}\right)$.
The entropy condition of Theorem 2.11.9 implies that $2^{-q_{0}} \log N_{q_{0}}^{n} \rightarrow 0$ as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$. Hence the expression in the display converges to zero as $n \rightarrow \infty$ followed by $q_{0} \rightarrow \infty$. Combine this with (2.11.20) to see that the sequence $\sum_{i=1}^{m_{n}} Z_{n i}^{o}$ is asymptotically equicontinuous with respect to $\rho$. Finally, Theorem 1.5.7 shows that the sequence is asymptotically tight.

### 2.11.3 Classes of Functions Changing with $n$

Let $X_{1}, X_{2}, \ldots$ be a sequence of independent random elements with common law $P$ on a measurable space ( $\mathcal{X}, \mathcal{A}$ ), and let $x \mapsto f_{n, t}(x)$ be functions from $\mathcal{X}$ to $\mathbb{R}$ indexed by $n \in \mathbb{N}$ and a fixed, totally bounded semimetric space $(T, \rho)$. We wish to derive conditions for the stochastic processes

$$
\left\{n^{-1 / 2} \sum_{i=1}^{n}\left(f_{n, t}\left(X_{i}\right)-P f_{n, t}\right): t \in T\right\}
$$

to converge in distribution in the space $\ell^{\infty}(T)$. These are the empirical processes $\left\{\mathbb{G}_{n} f_{n, t}: t \in T\right\}$ indexed by classes of functions $\mathcal{F}_{n}=\left\{f_{n, t}: t \in T\right\}$ changing with $n$.

This situation fits in the general set-up of this section upon setting $Z_{n i}(t)=f_{n, t}\left(X_{i}\right) / \sqrt{n}$.

Given envelope functions $F_{n}$, assume that

$$
\begin{array}{rlrl}
P^{*} F_{n}^{2} & =O(1), & & \\
P^{*} F_{n}^{2}\left\{F_{n}>\eta \sqrt{n}\right\} & \rightarrow 0, & \text { for every } \eta>0  \tag{2.11.21}\\
\sup _{\rho(s, t)<\delta_{n}} P\left(f_{n, s}-f_{n, t}\right)^{2} & \rightarrow 0, & \text { for every } \delta_{n} \downarrow 0
\end{array}
$$

Then the central limit theorem holds under an entropy condition. The following theorems impose a uniform-entropy condition and a bracketing entropy condition, respectively.
2.11.22 Theorem. For each $n$, let $\mathcal{F}_{n}=\left\{f_{n, t}: t \in T\right\}$ be a class of measurable functions indexed by a totally bounded semimetric space ( $T, \rho$ ) such that the classes $\mathcal{F}_{n, \delta}=\left\{f_{n, s}-f_{n, t}: \rho(s, t)<\delta\right\}$ and $\mathcal{F}_{n, \delta}^{2}$ are $P$-measurable for every $\delta>0$. Suppose (2.11.21) holds, as well as

$$
\sup _{Q} \int_{0}^{\delta_{n}} \sqrt{\log N\left(\varepsilon\left\|F_{n}\right\|_{Q, 2}, \mathcal{F}_{n}, L_{2}(Q)\right)} d \varepsilon \rightarrow 0, \quad \text { for every } \delta_{n} \downarrow 0
$$

Then the sequence $\left\{\mathbb{G}_{n} f_{n, t}: t \in T\right\}$ is asymptotically tight in $\ell^{\infty}(T)$ and converges in distribution to a Gaussian process provided the sequence of covariance functions $P f_{n, s} f_{n, t}-P f_{n, s} P f_{n, t}$ converges pointwise on $T \times T$.
2.11.23 Theorem. For each $n$, let $\mathcal{F}_{n}=\left\{f_{n, t}: t \in T\right\}$ be a class of measurable functions indexed by a totally bounded semimetric space ( $T, \rho$ ). Suppose (2.11.21) holds, as well as

$$
\int_{0}^{\delta_{n}} \sqrt{\log N_{[]}\left(\varepsilon\left\|F_{n}\right\|_{P, 2}, \mathcal{F}_{n}, L_{2}(P)\right)} d \varepsilon \rightarrow 0, \quad \text { for every } \delta_{n} \downarrow 0
$$

Then the sequence $\left\{\mathbb{G}_{n} f_{n, t}: t \in T\right\}$ is asymptotically tight in $\ell^{\infty}(T)$ and converges in distribution to a tight Gaussian process provided the sequence of covariance functions $P f_{n, s} f_{n, t}-P f_{n, s} P f_{n, t}$ converges pointwise on $T \times T$.

Proofs. The random distance given in Theorem 2.11.1 reduces to

$$
d_{n}^{2}(s, t)=\frac{1}{n} \sum_{i=1}^{n}\left(f_{n, s}-f_{n, t}\right)^{2}\left(X_{i}\right)=\mathbb{P}_{n}\left(f_{n, s}-f_{n, t}\right)^{2}
$$

It follows that $N\left(\varepsilon, T, d_{n}\right)=N\left(\varepsilon, \mathcal{F}_{n}, L_{2}\left(\mathbb{P}_{n}\right)\right)$, for every $\varepsilon>0$. If $F_{n}$ is replaced by $F_{n} \vee 1$, then the conditions of the theorem still hold. Hence, assume without loss of generality that $F_{n} \geq 1$. Insert the bound on the covering numbers and next make a change of variables to bound the entropy integral (2.11.2) by

$$
\int_{0}^{\delta_{n}} \sqrt{\log N\left(\varepsilon\left\|F_{n}\right\|_{\mathbb{P}_{n}, 2}, \mathcal{F}_{n}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon\left\|F_{n}\right\|_{\mathbb{P}_{n}, 2}
$$

This converges to zero in probability for every $\delta_{n} \downarrow 0$. Apply Theorem 2.11.1 to obtain the first theorem.

The second theorem is an immediate consequence of Theorem 2.11.9.
2.11.24 Example. The uniform-entropy condition of the first theorem is certainly satisfied if, for each $n$, the set of functions $\mathcal{F}_{n}=\left\{f_{n, t}: t \in T\right\}$ is a VC-class with VC-index bounded by some constant independent of $n$.

## Problems and Complements

1. The random entropy condition (2.11.2) implies that the sequence $N\left(\varepsilon, \mathcal{F}, d_{n}\right)$ is bounded in probability for every $\varepsilon>0$.
[Hint: For every $\delta_{n} \leq \varepsilon$,

$$
\mathrm{P}\left(N\left(\varepsilon, \mathcal{F}, d_{n}\right) \geq M_{n}\right) \leq \mathrm{P}\left(\int_{0}^{\delta_{n}} \sqrt{\log N\left(\varepsilon, \mathcal{F}, d_{n}\right)} d \varepsilon \geq \delta_{n} \sqrt{\log M_{n}}\right)
$$

Given $M_{n} \rightarrow \infty$, choose $\delta_{n} \downarrow 0$ such that $\delta_{n} \sqrt{\log M_{n}}$ is bounded away from zero.]
2. Let $\mathcal{F}=\cup_{j} \mathcal{F}_{q j}$ be a sequence $(q \in \mathbb{N})$ of nested partitions of an arbitrary set $\mathcal{F}$. Take arbitrary $f_{q j} \in \mathcal{F}_{q j}$ for every partitioning set, and define $\pi_{q} f=f_{q j}$ and $\mathcal{F}_{q} f=\mathcal{F}_{q j}$ if $f \in \mathcal{F}_{q j}$. Let $\rho(f, g)$ be $2^{-q_{0}}$ for the first value $q_{0}$ (counting from 1) such that $f$ and $g$ do not belong to the same partitioning set at level $q_{0}$. (Set $\rho(f, g)=0$ if $f$ and $g$ are never separated.) Then $\rho$ defines a semimetric on $\mathcal{F}$ inducing open balls

$$
B\left(f, 2^{-q}\right)=\mathcal{F}_{q} f, \quad \text { for every } q
$$

Furthermore, if $G(f)=\sum_{q} 2^{-q} \xi_{q, \pi_{q} f}$ for i.i.d. standard normal variables $\xi_{q, f_{q j}}$, then

$$
\operatorname{var}(G(f)-G(g))=\frac{8}{3} \rho^{2}(f, g)
$$

for every $f, g$.
[Hint: We have $\rho(f, g)<2^{-q}$ if and only if $f$ and $g$ are in the same partitioning set at level $q$ if and only if $\mathcal{F}_{q} f=\mathcal{F}_{q} g$. Of course, $g \in \mathcal{F}_{q} g$ for every g.]
3. In the situation of the preceding problem, let the number $N_{q}$ of partitioning sets $\mathcal{F}_{q j}$ at level $q$ satisfy

$$
\sum_{q} 2^{-q} \sqrt{\log N_{q}}<\infty
$$

Then the entropy numbers for the semimetric $\rho$ satisfy

$$
\int_{0}^{\infty} \sqrt{\log N(\varepsilon, \mathcal{F}, \rho)} d \varepsilon<\infty
$$

Conclude that the Gaussian process $G$ defined in the preceding problem has a version with bounded, uniformly $\rho$-continuous sample paths. Hence $\rho$ is a Gaussian semimetric.
[Hint: The convergence of the integral is immediate from the fact that $N\left(2^{-q}, \mathcal{F}, \rho\right)=N_{q}$. The continuity follows from Corollary 2.2.8 and Problem 2.2.17. Also see Appendix A.2.3.]
4. Any semimetric $d$ on an arbitrary set $\mathcal{F}$ such that $\int_{0}^{\infty} \sqrt{\log N(\varepsilon, \mathcal{F}, d)} d \varepsilon<\infty$ is Gaussian-dominated.
[Hint: Construct a sequence of nested partitions of $\mathcal{F}=\cup_{j} \mathcal{F}_{q j}$ in sets of $\delta$ diameter at most $2^{-q}$ for each $q$. The number $N_{q}$ of sets in the $q$ th partition
can be chosen such that $\sum_{q} 2^{-q} \sqrt{\log N_{q}}<\infty$. As in the preceding problems, the semimetric $\rho$ defined from this sequence of partitions is Gaussian by the preceding problem and has the property that each ball $B_{\rho}\left(f, 2^{-q}\right)$ equals a partitioning set; hence these balls have $d$-diameter at most $2^{-q}$ for every $q$. The latter implies that $d \leq 2 \rho$.]
5. Any semimetric $d$ on an arbitrary set $\mathcal{F}$ for which there exists a Borel probability measure $\mu$ with

$$
\limsup _{\delta \downarrow 0} \int_{f}^{\delta} \sqrt{\log 1 / \mu(B(f, \varepsilon))} d \varepsilon=0
$$

is Gaussian-dominated. Here $B(f, \varepsilon)$ is the $d$-ball of radius $\varepsilon$.
[Hint: By Lemma A.2.19, there exists a sequence of nested partitions of $\mathcal{F}=\cup_{i} \mathcal{F}_{q i}$ in sets of $\delta$-diameter at most $2^{-q}$ for each $q$ and a Borel probability measure $m$ such that

$$
\lim _{q_{0} \rightarrow \infty} \sup _{f} \sum_{q>q_{0}} 2^{-q} \sqrt{\log \frac{1}{m\left(\mathcal{F}_{q} f\right)}}=0 .
$$

As in the preceding problems, the semimetric $\rho$ defined from this sequence of partitions has the property that each ball $B_{\rho}\left(f, 2^{-q}\right)$ equals a partitioning set. Hence

$$
\limsup _{\delta \downarrow 0} \int_{f}^{\delta} \sqrt{\log 1 / m\left(B_{\rho}(f, \varepsilon)\right)} d \varepsilon=0
$$

where $B_{\rho}(f, \varepsilon)$ is a ball with respect to $\rho$. By Proposition A.2.17, the Gaussian process $G$ defined in the first problem has a version with bounded, uniformly $\rho$-continuous sample paths. The inequalities $\operatorname{diam} B\left(f, 2^{-q}\right) \leq 2^{-q}$ imply that $d \leq 2 \rho$.]
6. Let $\mathcal{F}$ be a class of measurable functions such that

$$
\int \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2, \infty}(P)\right)} d \varepsilon
$$

is finite. Then there exists a Gaussian semimetric $\rho$ on $\mathcal{F}$ such that

$$
\left\|\sup _{f, g \in B(\varepsilon)}|f-g|\right\|_{P, 2, \infty} \leq \varepsilon,
$$

for every $\rho$-ball $B(\varepsilon) \subset \mathcal{F}$ of radius $\varepsilon$.
[Hint: The finiteness of the integral implies the existence of a sequence of partitions of $\mathcal{F}$, as in the preceding problems, with the further property

$$
\left\|\sup _{f, g \in \mathcal{F}_{q j}}|f-g|\right\|_{P, 2, \infty} \leq 2^{-q} .
$$

The semimetric $\rho$ in the preceding problems is Gaussian, and every ball of radius $2^{-q}$ coincides with a partitioning set. Thus the inequality is valid for $\varepsilon=2^{-q}$ and hence up to a constant 2 for every $\varepsilon$. Change the metric to remove the 2.]
7. Corollary 2.11.12 is a refinement of Theorem 2.5.6.
8. If the Lindeberg condition on norms in Theorems 2.11.1 and 2.11.9 is replaced by the two assumptions

$$
\begin{array}{r}
\sup _{f}\left|\sum_{i=1}^{m_{n}} \mathrm{E} Z_{n i}(f)\left\{\left\|Z_{n i}\right\|_{\mathcal{F}}^{*}>\eta\right\}\right| \rightarrow 0 \\
\sum_{i=1}^{m_{n}} \mathrm{P}^{*}\left(\left\|Z_{n i}\right\|_{\mathcal{F}}>\eta\right) \rightarrow 0
\end{array}
$$

then the conclusion that the sequence of processes $\sum_{i=1}^{m_{n}}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)$ is asymptotically tight is still valid.

### 2.12

## Partial-Sum Processes

The name "Donsker class of functions" was chosen in honor of Donsker's theorem on weak convergence of the empirical distribution function. A second famous theorem by Donsker concerns the partial-sum process

$$
\mathbb{Z}_{n}(s)=\frac{1}{\sqrt{n}} \sum_{i=1}^{\lfloor n s\rfloor} Y_{i}=\frac{1}{\sqrt{n}} \sum_{i=1}^{k} Y_{i}, \quad \frac{k}{n} \leq s<\frac{k+1}{n}
$$

for i.i.d. random variables $Y_{1}, \ldots, Y_{n}$ with zero mean and variance 1. Donsker essentially proved that the sequence of processes $\left\{\mathbb{Z}_{n}(t): 0 \leq t \leq 1\right\}$ converges in distribution in the space $\ell^{\infty}[0,1]$ to a standard Brownian motion process [Donsker (1951)].

In this chapter we discuss generalizations of this result in two directions. The first is to replace the $Y_{i}$ 's by processes $\left\{f\left(X_{i}\right): f \in \mathcal{F}\right\}$ and consider convergence in $\ell^{\infty}([0,1] \times \mathcal{F})$. The second is to consider real variables on a lattice. Partial sums are then obtained by intersecting the lattice with sets in a given collection.

### 2.12.1 The Sequential Empirical Process

Let $X_{1}, \ldots, X_{n}$ be i.i.d. random elements with law $P$ in the measurable space $(\mathcal{X}, \mathcal{A})$, and let $\mathcal{F}$ be a collection of square-integrable, measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$. The sequential empirical process is defined as

$$
\mathbb{Z}_{n}(s, f)=\frac{1}{\sqrt{n}} \sum_{i=1}^{\lfloor n s\rfloor}\left(f\left(X_{i}\right)-P f\right)=\sqrt{\frac{\lfloor n s\rfloor}{n}} \mathbb{G}_{\lfloor n s\rfloor}(f)
$$

where $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ is the empirical process indexed by $\mathcal{F}$. The index $(s, f)$ ranges over $[0,1] \times \mathcal{F}$. The covariance function of $\mathbb{Z}_{n}$ is given by

$$
\operatorname{cov}\left(\mathbb{Z}_{n}(s, f), \mathbb{Z}_{n}(t, g)\right)=\frac{\lfloor n s\rfloor \wedge\lfloor n t\rfloor}{n}(P f g-P f P g)
$$

By the multivariate central limit theorem, the marginals of the sequence of processes $\left\{\mathbb{Z}_{n}(s, f):(s, f) \in[0,1] \times \mathcal{F}\right\}$ converge to the marginals of a Gaussian process $\mathbb{Z}$. The latter is known as the Kiefer-Müller process; it has mean zero and covariance function

$$
\operatorname{cov}(\mathbb{Z}(s, f), \mathbb{Z}(t, g))=(s \wedge t)(P f g-P f P g)
$$

The aim of this section is to show that the weak convergence $\mathbb{Z}_{n} \leadsto \mathbb{Z}$ is uniform with respect to the semimetric of $\ell^{\infty}([0,1] \times \mathcal{F})$ for every Donsker class of functions $\mathcal{F}$. More precisely, for every such $\mathcal{F}$, the sequence $\mathbb{Z}_{n}$ is asymptotically tight and there exists a tight, Borel measurable version of the Kiefer-Müller process $\mathbb{Z}$.

In accordance with the general results on Gaussian processes, tightness and measurability of the limit process $\mathbb{Z}$ are equivalent to the existence of a version of with all sample paths $(s, f) \mapsto \mathbb{Z}(s, f)$ uniformly bounded and uniformly continuous with respect to the semimetric whose square is given by

$$
\mathrm{E}(\mathbb{Z}(s, f)-\mathbb{Z}(t, g))^{2}=|s-t|\left[\rho_{P}^{2}(f) 1_{s>t}+\rho_{P}^{2}(g) 1_{s \leq t}\right]+(s \wedge t) \rho_{P}^{2}(f-g)
$$

This intrinsic semimetric is somewhat complicated. However, it is up to a constant bounded (on $[0,1] \times \mathcal{F}$ ) by the natural semimetric $|s-t|+\rho_{P}(f- g$ ) if $\mathcal{F}$ is bounded for $\rho_{P}$; in particular, if $\mathcal{F}$ is a Donsker class. By the addendum of Theorem 1.5.7, asymptotic equicontinuity with respect to the intrinsic semimetric is equivalent to asymptotic equicontinuity with respect to the natural semimetric whenever $[0,1] \times \mathcal{F}$ is totally bounded under the natural semimetric, particularly if $\mathcal{F}$ is a Donsker class.

Call $\mathcal{F}$ a functional Donsker class if and only if the sequence $\mathbb{Z}_{n}$ converges in distribution in $\ell^{\infty}([0,1] \times \mathcal{F})$ to a tight limit. Then the result can be expressed as follows.
2.12.1 Theorem. A class of measurable functions is functionally Donsker if and only if it is Donsker.

Proof. The empirical process $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ can be recovered from the sequential process as $\mathbb{G}_{n}(f)=\mathbb{Z}_{n}(1, f)$. Since a restriction map is continuous, a class is certainly Donsker if it is functionally Donsker.

For the converse, it suffices to establish the asymptotic equicontinuity of the sequence $\mathbb{Z}_{n}$. With the usual notation, $\mathcal{F}_{\delta}=\left\{f-g: f, g \in \mathcal{F}, \rho_{P}(f-\right.$
$g)<\delta\}$, the triangle inequality yields

$$
\begin{align*}
& \quad \sup _{|s-t|+\rho_{P}(f, g)<\delta}\left|\mathbb{Z}_{n}(s, f)-\mathbb{Z}_{n}(t, g)\right| \\
& \quad \leq \sup _{|s-t|<\delta}\left\|\mathbb{Z}_{n}(s, f)-\mathbb{Z}_{n}(t, f)\right\|_{\mathcal{F}}+\sup _{0 \leq t \leq 1}\left\|\mathbb{Z}_{n}(t, f)\right\|_{\mathcal{F}_{\delta}} \tag{2.12.2}
\end{align*}
$$

In the second term on the right the parameter $t$ may be restricted to the points $k / n$ with $k$ ranging over $1,2, \ldots, n$. Thus, this term is equal to $\max _{k \leq n}\left\|\sqrt{k / n} \mathbb{G}_{k}\right\|_{\mathcal{F}_{\delta}}$. By Ottaviani's inequality A.1.1,

$$
\mathrm{P}^{*}\left(\max _{k \leq n} \sqrt{k / n}\left\|\mathbb{G}_{k}\right\|_{\mathcal{F}_{\delta}}>2 \varepsilon\right) \leq \frac{\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{\delta}}>\varepsilon\right)}{1-\max _{k \leq n} \mathrm{P}^{*}\left(\sqrt{k / n}\left\|\mathbb{G}_{k}\right\|_{\mathcal{F}_{\delta}}>\varepsilon\right)}
$$

If the class $\mathcal{F}$ is Donsker, then the sequence $\mathbb{G}_{n}$ is asymptotically equicontinuous. Thus, the numerator converges to zero as $n \rightarrow \infty$ followed by $\delta \downarrow 0$. The terms of the maximum in the denominator indexed by $k \leq n_{0}$ can be controlled with the help of the inequality $\sqrt{k}\left\|\mathbb{G}_{k}\right\|_{\mathcal{F}_{\delta}} \leq 2 \sum_{i=1}^{n_{0}} F\left(X_{i}\right)+2 n_{0} P^{*} F$ for an envelope function $F$. For sufficiently large $n_{0}$, the terms indexed by $k>n_{0}$ are bounded away from 1 by the asymptotic equicontinuity of $\mathbb{G}_{n}$. Conclude that the denominator is bounded away from zero. Hence the second term on the right in (2.12.2) converges to zero in probability as $n \rightarrow \infty$ followed by $\delta \downarrow 0$.

To prove the same for the first term on the right in (2.12.2), it suffices to prove convergence to zero of

$$
\mathrm{P}^{*}\left(\max _{0 \leq j \delta \leq 1} \sup _{j \delta \leq s \leq(j+1) \delta}\left\|\mathbb{Z}_{n}(s, f)-\mathbb{Z}_{n}(j \delta, f)\right\|_{\mathcal{F}}>2 \varepsilon\right)
$$

By the stationarity of the increments of $\mathbb{Z}_{n}$ in $s$, the at most $\lceil 1 / \delta\rceil$ terms in the maximum are identically distributed. Thus, the probability can be bounded by

$$
\left\lceil\frac{1}{\delta}\right\rceil \mathrm{P}^{*}\left(\sup _{0 \leq s \leq \delta}\left\|\mathbb{Z}_{n}(s, f)\right\|_{\mathcal{F}}>2 \varepsilon\right)
$$

Again replace the continuous index $s$ by a discrete one and conclude from Ottaviani's inequality that the preceding display is not smaller than

$$
\left\lceil\frac{1}{\delta}\right\rceil \mathrm{P}^{*}\left(\max _{k \leq n \delta} \sqrt{k / n}\left\|\mathbb{G}_{k}\right\|_{\mathcal{F}}>2 \varepsilon\right) \leq \frac{\lceil 1 / \delta\rceil \mathrm{P}^{*}\left(\sqrt{\lfloor n \delta\rfloor / n}\left\|\mathbb{G}_{\lfloor n \delta\rfloor}\right\|_{\mathcal{F}}>\varepsilon\right)}{1-\max _{k \leq n \delta} \mathrm{P}^{*}\left(\sqrt{k / n}\left\|\mathbb{G}_{k}\right\|_{\mathcal{F}}>\varepsilon\right)}
$$

By the portmanteau theorem, the limsup as $n \rightarrow \infty$ of the probability in the numerator is bounded by $\mathrm{P}\left(\|\mathbb{G}\|_{\mathcal{F}} \geq \varepsilon / \delta^{1 / 2}\right)$. Since the norm $\left\|\|_{\mathcal{G}}\right.$ of a Brownian bridge has moments of all orders (cf. Proposition A.2.3), the latter probability converges to zero faster than any power of $\delta$ as $\delta \downarrow 0$. Conclude that the numerator converges to zero as $n \rightarrow \infty$ followed by $\delta \downarrow 0$. By a similar argument as before, but now also using the fact that $\mathrm{P}\left(\|\mathbb{G}\|_{\mathcal{F}}>\varepsilon\right)<1$ for every $\varepsilon>0$ (cf. Problem A.2.5), the denominator remains bounded away from zero.

### 2.12.2 Partial-Sum Processes on Lattices

For each positive integer $n$, let $Y_{n 1}, \ldots, Y_{n m_{n}}$ be independent, real-valued random variables, and let $Q_{n 1}, \ldots, Q_{n m_{n}}$ be deterministic probability measures on a measurable space $(\mathcal{X}, \mathcal{A})$. Given a collection $\mathcal{C}$ of measurable subsets of $\mathcal{X}$, consider the stochastic process

$$
\mathbb{S}_{n}(C)=\sum_{i=1}^{m_{n}} Y_{n i} Q_{n i}(C)
$$

Thus, $\mathbb{S}_{n}$ is a randomly weighted sum of the measures $Q_{n i}$. Both the classical partial-sum process and its smoothed version are of this type.
2.12.3 Example. Let $\mathcal{X}=[0,1]$ be the unit interval in the real line and $\mathcal{C}$ the collection of cells $[0, s]$ with $0 \leq s \leq 1$. If $Q_{n i}$ is the Dirac measure at the point $i / n$ (for $1 \leq i \leq n$ ), then

$$
\mathbb{S}_{n}([0, s])=\sum_{i / n \leq s} Y_{n i}=\sum_{i=1}^{k} Y_{n i}, \quad \text { if } \quad \frac{k}{n} \leq s<\frac{k+1}{n}
$$

The choice $Y_{n i}=Y_{i} / \sqrt{n}$ for an i.i.d. sequence $Y_{1}, Y_{2}, \ldots$ gives the classical partial-sum process.
2.12.4 Example. Let $\mathcal{X}=[0,1]$ be the unit interval in the real line and $\mathcal{C}$ the collection of cells $[0, s]$ with $0 \leq s \leq 1$. If $Q_{n i}$ is the uniform measure on the interval $[i / n,(i+1) / n)$, then

$$
\mathbb{S}_{n}([0, s])=\sum_{i=1}^{k} Y_{n i}+\frac{s-k / n}{1 / n} Y_{n, k+1}, \quad \text { if } \quad \frac{k}{n} \leq s<\frac{k+1}{n}
$$

This is a linear interpolation of the partial-sum process in the previous example.
2.12.5 Example. If each $Q_{n i}$ equals the Dirac measure at some point $x_{n i} \in \mathcal{X}$, then the general process reduces to

$$
\mathbb{S}_{n}(C)=\sum_{i: x_{n i} \in C} Y_{n i}
$$

This may be visualized as random weights $Y_{n i}$ being located at fixed points $x_{n i}$. Each set $C$ is charged with the sum of the weights that it carries.

The process $\mathbb{S}_{n}=\sum Y_{n i} Q_{n i}$ is the sum of the independent processes $Z_{n i}=Y_{n i} Q_{n i}$. Since

$$
\left(Z_{n i}(C)-Z_{n i}(D)\right)^{2} \leq Y_{n i}^{2} Q_{n i}(C \triangle D)
$$

the processes $Z_{n i}$ are measurelike with respect to the measures $\mu_{n i}= Y_{n i}^{2} Q_{n i}$. Thus for a collection $\mathcal{C}$ that satisfies the uniform-entropy condition, Theorem 2.11.1 combined with Lemma 2.11.6 readily yields a central limit theorem for the sequence $\mathbb{S}_{n}$. This is true in particular for VC-classes of sets.
2.12.6 Theorem. For each $n$, let $Q_{n 1}, \ldots, Q_{n m_{n}}$ be deterministic probability measures on some measurable space, and let $Y_{n 1}, \ldots, Y_{n m_{n}}$ be independent, real-valued random variables with mean zero, satisfying

$$
\begin{gathered}
\sum_{i=1}^{m_{n}} \mathrm{E} Y_{n i}^{2}=O(1) \\
\sum_{i=1}^{m_{n}} \mathrm{E} Y_{n i}^{2}\left\{\left|Y_{n i}\right|>\eta\right\} \rightarrow 0, \quad \text { for every } \eta>0
\end{gathered}
$$

Let $\mathcal{C}$ be a class of measurable sets that satisfies the uniform-entropy condition, and assume that for some probability measure $Q$, (2.12.7)

$$
\sup _{Q(C \Delta D)<\delta_{n}} \sum_{i=1}^{m_{n}} \mathrm{E} Y_{n i}^{2}\left(Q_{n i}(C)-Q_{n i}(D)\right)^{2} \rightarrow 0, \quad \text { for every } \delta_{n} \downarrow 0
$$

Finally, suppose that the covariance function $\mathrm{ES}_{n}(C) \mathbb{S}_{n}(D)$ converges pointwise on $\mathcal{C} \times \mathcal{C}$. Then the sequence $\mathbb{S}_{n}=\sum_{i=1}^{m_{n}} Y_{n i} Q_{n i}$ converges weakly in $\ell^{\infty}(\mathcal{C})$ to a tight Gaussian process with uniformly continuous sample paths with respect to the semimetric $Q(C \triangle D)$.

Proof. Apply Theorem 2.11.1 with $Z_{n i}=Y_{n i} Q_{n i}$ and $\rho$ the $L_{1}(Q)$ semimetric. Then $\left\|Z_{n i}\right\|_{\mathcal{F}}$ can be taken equal to $\left|Y_{n i}\right|$.

The entropy condition (2.11.2) is satisfied in view of Lemma 2.11.6. Since $\mathcal{C}$ satisfies the uniform-entropy condition, it is totally bounded under the $L_{1}(Q)$-semimetric (for any probability measure $Q$ ).

The measurability conditions listed before Theorem 2.11.1 are satisfied, because the suprema can be replaced by countable suprema. Indeed, since $\mathcal{C}$ satisfies the uniform-entropy condition, it is totally bounded and hence separable in $L_{1}\left(\sum_{i=1}^{m_{n}} Q_{n i}+Q\right)$. Thus, there exists a countable subcollection that contains, for every $C \in \mathcal{C}$, a sequence $C_{k}$ with $\left(\sum_{i=1}^{m_{n}} Q_{n i}+Q\right)\left(C_{k} \triangle C\right) \rightarrow 0$ as $k \rightarrow \infty$ (and $n$ fixed). For this sequence, $\mathbb{S}_{n}(C)=\lim _{k \rightarrow \infty} \mathbb{S}_{n}\left(C_{k}\right)$. Similar arguments applied to the multiplier processes show that the suprema that are assumed measurable in Theorem 2.11.1 can be replaced by countable suprema.

The theorem follows from Theorem 2.11.1.
The covariance function of the process $\mathbb{S}_{n}$ is given by

$$
\mathrm{ES}_{n}(C) \mathbb{S}_{n}(D)=\sum_{i=1}^{m_{n}} \mathrm{EY}_{n i}^{2} Q_{n i}(C) Q_{n i}(D)
$$

In the special case that each $Q_{n i}$ is a Dirac measure, we have the equality $Q_{n i}(C) Q_{n i}(D)=Q_{n i}(C \cap D)$ for every pair of sets, and the covariance function reduces to $Q_{n}(C \cap D)$ for the measure

$$
Q_{n}=\sum_{i=1}^{m_{n}} \mathrm{E} Y_{n i}^{2} Q_{n i}
$$

Then pointwise convergence of $Q_{n}$ to a limit on the collection of sets $\{C \cap D: C, D \in \mathcal{C}\}$ verifies convergence of the sequence of covariance functions.

For any measures $Q_{n i}$, the sum on the left side of (2.12.7) is bounded by $Q_{n}(C \triangle D)$. Thus, consideration of the measures $Q_{n}$ can also be helpful for verification of the other, more involved, condition of the theorem. A simple sufficient condition for (2.12.7) is that $Q_{n}$ converges uniformly to $Q$ on the collection of sets $\{C \triangle D: C, D \in \mathcal{C}\}$. This puts further restrictions on the class $\mathcal{C}$. A simple further sufficient condition is that the sequence $Q_{n}$ converges weakly to $Q$ and, for every $\varepsilon>0$, the collection $\mathcal{C}$ can be covered by finitely many brackets $\left[C_{l}, C^{u}\right]$ of size $Q\left(C^{u}-C_{l}\right)<\varepsilon$ and having $P$-continuity sets $C_{l}$ and $C^{u}$ as boundaries (Problem 2.12.1).
2.12.8 Example. Let $\mathcal{X}=[0,1]^{d}$ be the unit cube and $\mathcal{C}$ the collection of all cells $[0, t]$ with $0 \leq t \leq 1$. Let the collection of measures $Q_{n i}$ be the $n^{d}$ Dirac measures located at nodes of the regular grid consisting of the $n^{d}$ points $\{1 / n, 2 / n, \ldots, 1\}^{d}$. This gives a higher-dimensional version of the classical partial-sum process. If $Y_{n i}=Y_{i} / n^{d / 2}$ for an i.i.d. mean-zero sequence $Y_{1}, Y_{2}, \ldots$ with unit variance, then the measure $Q_{n}$ reduces to

$$
Q_{n}=\frac{1}{n^{d}} \sum_{i=1}^{n^{d}} Q_{n i}
$$

This is the discrete uniform measure on the grid points. The sequence $Q_{n}$ converges weakly to Lebesgue measure, and the collection of cells $[0, t]$ satisfies the bracketing condition for Lebesgue measure. Thus, (2.12.7) is satisfied for $Q$ equal to Lebesgue measure, and the sequence of covariance functions converges. The limiting Gaussian process has covariance function $\mathrm{ES}(C) \mathbb{S}(D)=\lambda(C \cap D)$ for Lebesgue measure $\lambda$ (a standard Brownian sheet).
2.12.9 Example. Let $\mathcal{X}=[0,1]^{d}$ be the unit cube and $\mathcal{C}$ a VC-class. Partition $[0,1]^{d}$ into $n^{d}$ cubes of volume $n^{-d}$, and let the collection $Q_{n i}$ be the set of uniform probability measures on the cubes. This gives a smoothed version of the partial-sum process in higher dimensions. If each of the $Y_{n i}$ has variance $n^{-d / 2}$, then the measure $Q_{n}$ reduces to Lebesgue measure. Thus (2.12.7) is satisfied for $Q$ equal to Lebesgue measure.

If the cubes in the partition are denoted $C_{n i}$, then the covariance function can be written

$$
\frac{1}{n^{d}} \sum_{i=1}^{n^{d}} \frac{\lambda\left(C_{n i} \cap C\right)}{\lambda\left(C_{n i}\right)} \frac{\lambda\left(C_{n i} \cap D\right)}{\lambda\left(C_{n i}\right)}=\mathrm{EE}\left(1_{C}(U) \mid \mathcal{A}_{n}\right) \mathrm{E}\left(1_{D}(U) \mid \mathcal{A}_{n}\right),
$$

where $U$ is the identity map on $[0,1]^{d}$ equipped with Lebesgue measure and $\mathcal{A}_{n}$ is the $\sigma$-field generated by the partition. For $n \rightarrow \infty$, the sequence $\mathrm{E}\left(1_{C}(U) \mid \mathcal{A}_{n}\right)$ converges in probability to $1_{C}(U)$ for every set $C$. (This
follows from a martingale convergence theorem or a direct argument: it is clear that $\mathrm{E}\left(h \mid \mathcal{A}_{n}\right) \rightarrow h$ in quadratic mean for every continuous function $h$; each indicator function $1_{C}$ can be approximated arbitrarily closely by a continuous function.) Thus, the sequence of covariance functions converges to the limit $\mathrm{E} 1_{C}(U) 1_{D}(U)=\lambda(C \cap D)$.

## Problems and Complements

1. Suppose the sequence of Borel measures $Q_{n}$ converges weakly to a probability measure $Q$. Let $\mathcal{C}$ be a collection of Borel sets that for every $\varepsilon>0$ can be covered with finitely many brackets $\left[C_{l}, C^{u}\right]$ of size $Q\left(C^{u}-C_{l}\right)<\varepsilon$ and consisting of $Q$-continuity sets $C_{l}$ and $C^{u}$. Then $Q_{n} \rightarrow Q$ uniformly in $C \in \mathcal{C} \triangle \mathcal{C}$ and $C \in \mathcal{C} \cap \mathcal{C}$.
[Hint: The following problem is helpful. Compare the proof of Theorem 2.4.1.]
2. If $\mathcal{C}$ has the bracketing property as in the preceding problem, then so do the collections $\mathcal{C} \triangle \mathcal{C}$ and $\mathcal{C} \cap \mathcal{C}$.
3. If $Z_{n i}(s, f)=f\left(X_{i}\right) 1\{i / n \leq t\}$, then the sequential empirical process can be written $\mathbb{Z}_{n}=n^{-1 / 2}\left(\sum_{i=1}^{n} Z_{n i}-\mathrm{E} Z_{n i}\right)$. Next the results of Chapter 2.11 can be used to deduce that the sequence $\mathbb{Z}_{n}$ converges in distribution. Compare the result with the present chapter.
4. (Time reversal) If $\mathbb{Z}$ is a Kiefer-Müller process indexed by $[1, \infty) \times \mathcal{F}$, then the process $(t, f) \mapsto t \mathbb{Z}(1 / t, f)$ is a Kiefer-Müller process indexed by $(0,1] \times \mathcal{F}$.
5. If $\mathbb{Z}_{n}$ is the sequential empirical process, then the sequence of processes $(t, f) \mapsto \mathbb{Z}_{n}(t, f) /(t \vee 1)$ converges weakly in $\ell^{\infty}\left(\mathbb{R}^{+} \times \mathcal{F}\right)$.
[Hint: The process equals $\sqrt{n}(\lfloor n t\rfloor / n(t \vee 1))\left(\mathbb{P}_{\lfloor n t\rfloor}-P\right)$. Use the reverse martingale property of $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}^{*}$ given in Lemma 2.4.5.]
6. Combination of the preceding problems yields that $\sup _{m \geq n} \sqrt{n}\left\|\mathbb{P}_{m}-P\right\|_{\mathcal{F}}$ converges weakly to $\sup _{0 \leq t \leq 1}\|\mathbb{Z}(t, f)\|_{\mathcal{F}}$. This generalizes results of Müller (1968). See Hjort and Fenstad (1992), Section 4, for applications of this result.
7. A standard Brownian sheet $S$ indexed by $\mathbb{R}^{+} \times[0,1]$ is a zero-mean Gaussian process with continuous sample paths and covariance function

$$
\operatorname{cov}(\mathbb{S}(s, u), \mathbb{S}(t, v))=(s \wedge t)(u \wedge v)
$$

Then the process $\mathbb{S}(s, u)-u \mathbb{S}(s, 1)$ is a classical Kiefer-Müller process (a Kiefer-Müller process for $\mathcal{X}=[0,1]$ with uniform measure and $\mathcal{F}$ the collection of indicators of cells $[0, u]$ ).
8. With $\mathbb{S}$ a standard Brownian sheet, consider the processes $\mathbb{S}(s, u)-s u \mathbb{S}(1,1)$ and $\mathbb{S}(s, u)-u \mathbb{S}(s, 1)-v \mathbb{S}(1, u)+u s \mathbb{S}(1,1)$. On which sides of the unit square are these processes zero almost surely? (The second process appears in connection with tests for independence; see Chapter 3.8 and Appendix A.2.2.)

### 2.13

## Other Donsker Classes

In this section we consider some Donsker classes of interest, that do not fit well in the framework of the preceding chapters.

### 2.13.1 Sequences

A countable class of functions may be shown to be Donsker by any of the criteria we have discussed so far. A very simple sufficient condition is that the sequence converges to zero sufficiently fast.
2.13.1 Theorem (Sequences). Any sequence $\left\{f_{i}\right\}$ of square-integrable, measurable functions with the property $\sum_{i=1}^{\infty} P\left(f_{i}-P f_{i}\right)^{2}<\infty$ is $P$ Donsker.

Proof. For a fixed natural number $m$, define a partition $\left\{f_{i}\right\}=\cup_{i=1}^{m+1} \mathcal{F}_{i}$ by letting $\mathcal{F}_{i}$ consist of the single function $f_{i}$ for $i \leq m$ and $\mathcal{F}_{m+1}= \left\{f_{m+1}, f_{m+2}, \ldots\right\}$. Since the variation over the first $m$ sets in the partition is zero,

$$
\begin{aligned}
\mathrm{P}\left(\sup _{i} \sup _{f, g \in \mathcal{F}_{i}}\left|\mathbb{G}_{n}(f-g)\right|>\varepsilon\right) & \leq \mathrm{P}\left(\sup _{f \in \mathcal{F}_{m+1}}\left|\mathbb{G}_{n} f\right|>\frac{\varepsilon}{2}\right) \\
& \leq \frac{4}{\varepsilon^{2}} \sum_{i=m+1}^{\infty} P\left(f_{i}-P f_{i}\right)^{2}<\infty
\end{aligned}
$$

by Chebyshev's inequality. For sufficiently large $m$, this is smaller than any prescribed $\eta>0$. The result follows from Theorem 1.5.6.

### 2.13.2 Elliptical Classes

The preceding theorem may be combined with Theorem 2.10.3 to conclude that the class

$$
\left\{\sum_{i=1}^{\infty} c_{i} f_{i}: \sum\left|c_{i}\right| \leq 1, \text { and the series converges pointwise }\right\}
$$

is Donsker for any given sequence $f_{i}$ with $\sum_{i=1}^{\infty} P f_{i}^{2}<\infty$. Under the additional condition that the functions $f_{i}$ are orthogonal, this can be improved.
2.13.2 Theorem (Elliptical classes). Let $\left\{f_{i}\right\}$ be a sequence of measurable functions such that $P f_{i} f_{j}=0$ for every $i \neq j$ and $\sum_{i=1}^{\infty} P f_{i}^{2}<\infty$. Then the class of all pointwise converging series $\sum_{i=1}^{\infty} c_{i} f_{i}$, such that $\sum_{i=1}^{\infty} c_{i}^{2} \leq 1$, is $P$-Donsker.

Proof. By the condition on $c$, each of the series $\sum_{i=1}^{\infty} c_{i} f_{i}$ converges pointwise as well as in $L_{2}(P)$. The class $\mathcal{F}$ of all these series is totally bounded in $L_{2}(P)$, because it is bounded and can be approximated arbitrarily closely by a finite-dimensional set, since

$$
P\left(\sum_{i>m} c_{i} f_{i}\right)^{2}=\sum_{i>m} c_{i}^{2} P f_{i}^{2} \leq \max _{i>m} P f_{i}^{2} \rightarrow 0, \quad m \rightarrow \infty
$$

It suffices to show that the sequence of empirical processes $\mathbb{G}_{n}$ indexed by $\mathcal{F}$ is asymptotically equicontinuous with respect to the $L_{2}(P)$-seminorm. For $f=\sum c_{i} f_{i}, g=\sum d_{i} f_{i}$, and any natural number $k$,

$$
\begin{aligned}
& \left|\mathbb{G}_{n}(f)-\mathbb{G}_{n}(g)\right|^{2}=\left|\sum_{i=1}^{\infty}\left(c_{i}-d_{i}\right) \mathbb{G}_{n}\left(f_{i}\right)\right|^{2} \\
& \quad \leq 2 \sum_{i=1}^{k}\left(c_{i}-d_{i}\right)^{2} P f_{i}^{2} \sum_{i=1}^{k} \frac{\mathbb{G}_{n}^{2}\left(f_{i}\right)}{P f_{i}^{2}}+2 \sum_{i=k+1}^{\infty}\left(c_{i}-d_{i}\right)^{2} \sum_{i=k+1}^{\infty} \mathbb{G}_{n}^{2}\left(f_{i}\right)
\end{aligned}
$$

In view of the assumption that $\|c-d\|_{2} \leq\|c\|_{2}+\|d\|_{2} \leq 2$, this expression is bounded by

$$
2\|f-g\|_{P, 2}^{2} \sum_{i=1}^{k} \frac{\mathbb{G}_{n}^{2}\left(f_{i}\right)}{P f_{i}^{2}}+8 \sum_{i=k+1}^{\infty} \mathbb{G}_{n}^{2}\left(f_{i}\right) .
$$

Take the supremum over all pairs of series $f$ and $g$ with $\|f-g\|_{P, 2}<\delta$. Since $\mathrm{EG}_{n}^{2}\left(f_{i}\right) \leq P f_{i}^{2}$, the expectation of this supremum is bounded by $2 \delta^{2} k+8 \sum_{i=k+1}^{\infty} P f_{i}^{2}$. This expression can be made arbitrarily small by first choosing $k$ large and next $\delta$ small.

In terms of an orthonormal sequence $\left\{\psi_{i}\right\}$ in $\mathcal{L}_{2}(P)$, the preceding theorem can be stated in the following manner. For a given sequence of numbers $b_{i}$, the elliptical class

$$
\mathcal{F}=\left\{\sum_{i=1}^{\infty} c_{i} \psi_{i}: \sum \frac{c_{i}^{2}}{b_{i}^{2}} \leq 1 \text { and the series converges pointwise }\right\}
$$

is $P$-Donsker if $\sum_{i=1}^{\infty} b_{i}^{2}<\infty$. The latter condition is also known to be necessary. In fact, it is already necessary for the class to be pre-Gaussian. ${ }^{\ddagger}$ The pointwise convergence of the series forming $\mathcal{F}$ appears not to be automatic. In view of the Cauchy-Schwarz inequality, a simple sufficient condition for absolute convergence at $x$ is that $\sum \psi_{i}(x)^{2} b_{i}^{2}<\infty$.

Elliptical classes are of some interest, because some well-known test statistics, including the Cramér-von Mises and the Anderson-Darling statistic, arise as the (generalized) Kolmogorov-Smirnov statistic $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ indexed by an elliptical class. This is shown in the examples ahead. The KolmogorovSmirnov statistics corresponding to an elliptical class can be represented as a series of uncorrelated variables. Indeed, for $\mathcal{F}$ equal to the class of functions in the previous display,

$$
\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}=\sup _{f}\left|\sum_{i=1}^{\infty} c_{i} \mathbb{G}_{n}\left(\psi_{i}\right)\right|^{2}=\sum_{i=1}^{\infty} b_{i}^{2} \mathbb{G}_{n}^{2}\left(\psi_{i}\right),
$$

in view of the Cauchy-Schwarz inequality. If the $\psi_{i}$ are uncorrelated and of unit variance, then the sequence $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$ is asymptotically distributed as $\sum b_{i}^{2} Z_{i}^{2}$ for an i.i.d. sequence $Z_{1}, Z_{2}, \ldots$ of standard normal variables. This follows from the series representation for $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$; it can also be obtained from the fact that $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$ converges in distribution to the square norm of a Brownian bridge $\mathbb{G}$ and a series representation for $\|\mathbb{G}\|_{\mathcal{F}}^{2}$, which can be obtained in an analogous manner.
2.13.3 Example (Cramér-von Mises). Let $\mathbb{P}_{n}$ be the empirical distribution of an i.i.d. sample of size $n$ from the uniform distribution on the unit interval $[0,1] \subset \mathbb{R}$. Write $\mathbb{G}_{n}(t)=\sqrt{n}\left(\mathbb{P}_{n}-P\right)[0, t]$ for the classical empirical process ( $t \in[0,1]$ ). Let $\mathcal{F}$ be the class of functions

$$
\mathcal{F}=\left\{\sum_{j=1}^{\infty} c_{j} \sqrt{2} \cos \pi j t: \sum c_{j}^{2} \pi^{2} j^{2} \leq 1\right\} .
$$

Since the cosines are bounded, the series defining the elements of $\mathcal{F}$ are uniformly convergent in this case. The classical Cramér-von Mises statistic equals the square of the Kolmogorov-Smirnov statistic over the elliptical class $\mathcal{F}$ :

$$
\int_{0}^{1} \mathbb{G}_{n}^{2}(t) d t=\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}
$$

[^3]To see this, note that the Cramér-von Mises statistic is the square of the $L_{2}[0,1]$-norm of the function $t \mapsto \mathbb{G}_{n}(t)$. Since the functions $\{\sqrt{2} \sin \pi j t: j= 1,2, \ldots\}$ form an orthonormal base of $L_{2}[0,1]$, Parseval's formula yields

$$
\int_{0}^{1} \mathbb{G}_{n}^{2}(t) d t=\sum_{j=1}^{\infty}\left[\int_{0}^{1} \mathbb{G}_{n}(t) \sqrt{2} \sin (\pi j t) d t\right]^{2}=\sum_{j=1}^{\infty} \frac{1}{\pi^{2} j^{2}} \mathbb{G}_{n}^{2}(\sqrt{2} \cos \pi j t)
$$

(Note that $-\int \mathbb{G}_{n} f^{\prime}=\int f d \mathbb{G}_{n}=\mathbb{G}_{n} f$ by the definitions of $t \mapsto \mathbb{G}_{n}(t)$ and $\mathbb{G}_{n} f$.) The functions $\{\sqrt{2} \cos \pi j t: j=1,2, \ldots\}$ form an orthonormal system in $L_{2}[0,1]$, so that the result follows from the general series representation of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$ for elliptical classes.
2.13.4 Example (Watson). In the situation of the preceding example, let $\mathcal{F}$ be the elliptical class

$$
\left\{\sum_{j=1}^{\infty}\left(c_{2 j-1} \sqrt{2} \cos 2 \pi j t+c_{2 j} \sqrt{2} \sin 2 \pi j t\right): \sum\left(c_{2 j-1}^{2}+c_{2 j}^{2}\right) \pi^{2} j^{2} \leq 1\right\} .
$$

The series are again uniformly convergent. The Watson statistic equals the square of the Kolmogorov-Smirnov statistic over the elliptical class $\mathcal{F}$ :

$$
\int_{0}^{1}\left[\mathbb{G}_{n}(t)-\int \mathbb{G}_{n}(s) d s\right]^{2} d t=\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}
$$

This can be seen by a similar argument. The Watson statistic is the square of the $L_{2}[0,1]$-norm of the projection of the function $t \mapsto \mathbb{G}_{n}(t)$ on the meanzero functions. The functions $\{\sqrt{2} \sin 2 \pi j t, \sqrt{2} \cos 2 \pi j t: j=1,2, \ldots\}$ form an orthonormal base of the mean-zero functions. Application of Parseval's formula followed by partial integration as in the preceding example yields the result.
2.13.5 Example (Anderson-Darling). In the situation of the preceding example, let $\mathcal{F}$ be the elliptical class

$$
\left\{\sum_{j=1}^{\infty} c_{j} \sqrt{2} p_{j}(2 t-1): \sum c_{j}^{2} j(j+1) \leq 1 \text { and pointwise convergence }\right\}
$$

where the functions $p_{0}(u)=(1 / 2) \sqrt{2}, p_{1}(u)=(1 / 2) \sqrt{6} u, p_{2}(u)= (1 / 4) \sqrt{10}\left(3 u^{2}-1\right), p_{3}(u)=(1 / 4) \sqrt{14}\left(5 u^{3}-3 u\right), \ldots$ are the orthonormalized Legendre polynomials in $L_{2}[-1,1]$. (This is the orthonormal system obtained by applying the Gram-Schmidt procedure to the functions $\left.1, u, u^{2}, \ldots.\right)$ The Anderson-Darling statistic equals the square of the Kolmogorov-Smirnov statistic over the elliptical class $\mathcal{F}$ :

$$
\int_{0}^{1} \frac{\mathbb{G}_{n}^{2}(t)}{t(1-t)} d t=\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}
$$

The argument is slightly more involved than in the preceding examples, but it is based on the same idea. The normalized Legendre polynomials satisfy the differential equations $p_{j}^{\prime \prime}(u)\left(1-u^{2}\right)-2 u p_{j}^{\prime}(u)=-j(j+1) p_{j}(u)$ for $u \in [-1,1]$ (Problem 2.13.1). By a change of variables and partial integration, it can be deduced that

$$
\begin{aligned}
& 2 \int_{0}^{1} p_{i}^{\prime}(2 t-1) p_{j}^{\prime}(2 t-1) t(1-t) d t \\
& \quad=-\frac{1}{4} \int_{-1}^{1} p_{i}(u)\left[p_{j}^{\prime \prime}(u)\left(1-u^{2}\right)-2 u p_{j}^{\prime}(u)\right] d u \\
& \quad=\frac{1}{4} j(j+1) \delta_{i j}
\end{aligned}
$$

It follows that the functions $2 \sqrt{2} p_{i}^{\prime}(2 t-1) \sqrt{t(1-t)} / \sqrt{j(j+1)}$ with $j$ ranging over $\{1,2, \ldots\}$ form an orthonormal base of $L_{2}[0,1]$. By Parseval's formula, the Anderson-Darling statistic equals

$$
\sum_{j=1}^{\infty}\left[\int_{0}^{1} \mathbb{G}_{n}(t) p_{i}^{\prime}(2 t-1) d t\right]^{2} \frac{8}{j(j+1)}=\sum_{j=1}^{\infty} \frac{2}{j(j+1)} \mathbb{G}_{n}^{2}\left(p_{j}(2 t-1)\right)
$$

This equals $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$ by the general series representation of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$ for elliptical classes.

### 2.13.3 Classes of Sets

The preceding chapters give a wide variety of relatively easy-to-apply sufficient conditions for the Donsker property. They have little to say about necessary conditions beyond the most abstract level or in concrete cases. For classes of sets, simple necessary conditions, up to measurability, are known.

Recall from Chapter 2.6 that for a given collection $\mathcal{C}$ of sets and given points, $\Delta_{n}\left(\mathcal{C}, X_{1}, \ldots, X_{n}\right)$ denotes the number of subsets of $\left\{X_{1}, \ldots, X_{n}\right\}$ picked out by $\mathcal{C}$. Also define $K_{n}\left(\mathcal{C}, X_{1}, \ldots, X_{n}\right)$ to be the cardinality of a maximal subset of $\left\{X_{1}, \ldots, X_{n}\right\}$ shattered by $\mathcal{C}$ :

$$
K_{n}\left(\mathcal{C}, X_{1}, \ldots, X_{n}\right)=\max \left\{\# A: \Delta_{n}(\mathcal{C}, A)=2^{\# A}\right\}
$$

where $A$ ranges over all possible subsets of $\left\{X_{1}, \ldots, X_{n}\right\}$.
2.13.6 Theorem. For every pointwise-separable collection of measurable sets, the following statements are equivalent:
(i) $\log \Delta_{n}\left(\mathcal{C}, X_{1}, \ldots, X_{n}\right)=o_{P}^{*}(\sqrt{n})$ and $\mathcal{C}$ is $P$-pre-Gaussian;
(ii) $K_{n}\left(\mathcal{C}, X_{1}, \ldots, X_{n}\right)=o_{P}^{*}(\sqrt{n})$ and $\mathcal{C}$ is $P$-pre-Gaussian;
(iii) $\mathcal{C}$ is $P$-Donsker;
(iv) $\log N\left(\varepsilon n^{-1 / 2}, \mathcal{C}, L_{1}\left(\mathbb{P}_{n}\right)\right)=o_{P}^{*}(\sqrt{n})$ for every $\varepsilon>0$ and $\mathcal{C}$ is $P$-preGaussian.

Proof. Giné and Zinn (1984) and Talagrand (1988).

## Problems and Complements

1. The Legendre polynomials on $[-1,1]$ satisfy the differential equation

$$
p_{j}^{\prime \prime}(u)\left(1-u^{2}\right)-2 u p_{j}^{\prime}(u)=-j(j+1) p_{j}(u) .
$$

[Hint: It suffices to prove the same relationship for the polynomials $p_{j}(u)$ defined as $u^{j}$ minus the projection of $u^{j}$ on the linear space spanned by $1, u, \ldots, u^{j-1}$. The left side of the differential equation is a polynomial of degree $j$ with leading term $-j(j+1) u^{j}$. By definition, the right side has the same property. It suffices to show that the left side is orthogonal to the functions $1, u, \ldots, u^{j-1}$. By partial integration,

$$
\begin{aligned}
\int p_{j}^{\prime}(u) 2 u u^{k} d u & =2 p_{j}(1) \pm 2 p_{j}(-1)-\int p_{j}(u) 2(k+1) u^{k} d u \\
& =2 p_{j}(1) \pm 2 p_{j}(-1)
\end{aligned}
$$

where $\pm$ is + if $k<j$ is even and - otherwise. By using partial integration twice, this can be seen to be equal to $\int p_{j}^{\prime \prime}(u)\left(1-u^{2}\right) u^{k} d u$.]
2. The representation of the Watson statistic as the Kolmogorov-Smirnov statistic of an elliptic class is not unique. Consider the class

$$
\mathcal{F}=\left\{\sum_{j=1}^{\infty} c_{j} \sqrt{2} \sin \pi j t: \Sigma c_{j}^{2} \pi^{2} j^{2} \leq 1\right\} .
$$

Then the Watson statistic equals $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{2}$. (The terms in the accompanying series representation are not asymptotically independent; hence this representation is of less interest.)
[Hint: The functions $\{\sqrt{2} \cos \pi j t: j=1,2, \ldots\}$ form an orthonormal base of the mean-zero functions in $L_{2}[0,1]$.]

### 2.14

## Tail Bounds

In this chapter we derive moment and tail bounds for the supremum $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ of the empirical process. Throughout this chapter, $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ denotes the empirical process of an i.i.d. sample $X_{1}, \ldots, X_{n}$ from a probability measure $P$, defined as the coordinate projections of a product probability space ( $\mathcal{X}^{\infty}, \mathcal{A}^{\infty}, P^{\infty}$ ).

In the first subsection we consider classes of functions such that either the uniform-entropy integral or the bracketing integral converges. Then both $L_{p}$-moments and $\psi_{p}$-moments can be bounded by a multiple of the entropy integral times the corresponding moment of the envelope function. In view of general results that bound the higher order $L_{p}$ and the $\psi_{p}$-norms in terms of the $L_{1}$-norm, the main job is to derive upper bounds for the expectation $\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$. We derive such bounds also with a view toward statistical applications in Part 3.

Bounds on moments imply rates of decrease for the tail probabilities $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ as $t \rightarrow \infty$. For uniformly bounded classes $\mathcal{F}$, the tails of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ are exponentially small. In Section 2.14.2, we derive exponential bounds that give the correct constant in the exponent for such classes.

Section 2.14.3 is concerned with the related problem of bounding deviation probabilities of the type $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C\left(\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}+t\right)\right)$ for a universal constant $C$. Here the choice $C=1$ would be desirable, but it is unattainable by the present methods. However, even with unknown $C$, the bounds appear to be of interest, in particular because they are valid without any conditions on the size of $\mathcal{F}$.

Most of the tail bounds are uniform in $n$.

### 2.14.1 Finite Entropy Integrals

In this subsection we derive bounds on moments and tail probabilities of $\left\|\mathrm{G}_{n}\right\|_{\mathcal{F}}$ for classes $\mathcal{F}$ that possess a finite uniform-entropy or bracketing entropy integral. Such classes permit tail bounds of the order $\exp \left(-C t^{p}\right)$ or $t^{-p}$, uniformly in $n$, depending on the envelope function $F$. While the methods used are too simple to obtain sharp bounds, at least the powers of $t$ in the bounds appear correct.

The tail bounds will be implicitly expressed in terms of Orlicz norms. By Markov's inequality, a finite $L_{p}$-norm $\|X\|_{p}$ yields a polynomial bound

$$
\mathrm{P}(|X|>t) \leq \frac{1}{t^{p}}\|X\|_{p}^{p}
$$

Alternatively, a bound on the Orlicz norm $\|X\|_{\psi_{p}}$ for $\psi_{p}(x)=\exp x^{p}-1$ and $p \geq 1$ leads to an exponential bound

$$
\mathrm{P}(|X|>t) \leq 2 e^{-t^{p} /\|X\|_{\psi_{p}}^{p}}
$$

It is useful to employ also exponential Orlicz norms for $0<p<1$. The fact that the functions $x \mapsto \exp x^{p}-1$ are convex only on the interval ( $c_{p}, \infty$ ) for $c_{p}=(1 / p-1)^{1 / p}$ leads to the inconvenience that $\|\cdot\|_{\psi_{p}}$ (if defined exactly as before) does not satisfy the triangle inequality. The usual solution is to define $\psi_{p}(x)$ as $\exp x^{p}-1$ for $x \geq c_{p}$ and to be linear and continuous on ( $0, c_{p}$ ). Since we are interested in using these norms to measure tail probabilities, the particular adaptation of the definition of $\psi_{p}$ is not important.

In Theorem 2.14.5 (ahead), it is shown that a general Orlicz norm of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$ is bounded by its $L_{1}$-norm plus the corresponding Orlicz norm of the envelope function $F$. In the first results, we therefore focus on bounding the $L_{1}$-norm, or the $L_{p}$-norm if this does not complicate the result.

The first result is for classes satisfying a uniform-entropy bound. Set

$$
J(\delta, \mathcal{F})=\sup _{Q} \int_{0}^{\delta} \sqrt{1+\log N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon
$$

where the supremum is taken over all discrete probability measures $Q$ with $\|F\|_{Q, 2}>0$. Certainly $J(1, \mathcal{F})<\infty$ if $\mathcal{F}$ satisfies the uniform-entropy condition (2.5.1). For Vapnik-Cervonenkis classes $\mathcal{F}$, the function $J(\delta, \mathcal{F})$ is of the order $O(\delta \sqrt{\log (1 / \delta)})$ as $\delta \downarrow 0$.
2.14.1 Theorem. Let $\mathcal{F}$ be a $P$-measurable class of measurable functions with measurable envelope function $F$. Then

$$
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, p} \lesssim\left\|J\left(\theta_{n}, \mathcal{F}\right)\right\| F\left\|_{n}\right\|_{P, p} \lesssim J(1, \mathcal{F})\|F\|_{P, 2 \vee p}, \quad 1 \leq p
$$

Here $\theta_{n}=\| \| f\left\|_{n}\right\|_{\mathcal{F}}^{*} /\|F\|_{n}$, where $\|\cdot\|_{n}$ is the $L_{2}\left(\mathbb{P}_{n}\right)$-seminorm and the inequalities are valid up to constants depending only on the $p$ involved in the statement.

Proof. Set $\mathbb{G}_{n}^{o}=n^{-1 / 2} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)$ for the symmetrized empirical process. In view of the symmetrization lemma, Lemma 2.3.1, Orlicz norms of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$ are bounded by two times the corresponding Orlicz norms of $\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}$.

Given $X_{1}, \ldots, X_{n}$, the process $\mathbb{G}_{n}^{o}$ is sub-Gaussian for the $L_{2}\left(\mathbb{P}_{n}\right)$ seminorm $\|\cdot\|_{n}$ by Hoeffding's inequality. The value $\eta_{n}=\| \| f\left\|_{n}\right\|_{\mathcal{F}}$ is an upper bound for the radius of $\mathcal{F} \cup\{0\}$ with respect to this norm. The maximal inequality Theorem 2.2.4 gives

$$
\left\|\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}\right\|_{\psi_{2} \mid X} \lesssim \int_{0}^{\eta_{n}} \sqrt{1+\log N\left(\varepsilon, \mathcal{F}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon
$$

where $\|\cdot\|_{\psi_{2} \mid X}$ is the conditional Orlicz norm for $\psi_{2}$, given $X_{1}, X_{2}, \ldots$. Make a change of variable and bound the random entropy by a supremum to see that the right side is bounded by $J\left(\theta_{n}, \mathcal{F}\right)\|F\|_{n}$. Every $L_{p}$-norm is bounded by a multiple of the $\psi_{2}$-Orlicz norm. Hence

$$
\mathrm{E}_{\varepsilon}\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}^{p} \lesssim J\left(\theta_{n}, \mathcal{F}\right)^{p}\|F\|_{n}^{p}
$$

Take the expectation over $X_{1}, \ldots, X_{n}$ to obtain the left inequality of the theorem. Since $\theta_{n} \leq 1$, the right side of the preceding display is bounded by $J(1, \mathcal{F})^{p}\|F\|_{n}^{p}$. For $p \geq 2$, this is further bounded by $J(1, \mathcal{F})^{p} n^{-1} \sum F^{p}\left(X_{i}\right)$, by Jensen's inequality. This gives the inequality on the right side of the theorem.

For a given norm $\|\cdot\|$, define a bracketing integral of a class of functions $\mathcal{F}$ as

$$
J_{[]}(\delta, \mathcal{F},\|\cdot\|)=\int_{0}^{\delta} \sqrt{1+\log N_{[]}(\varepsilon\|F\|, \mathcal{F},\|\cdot\|)} d \varepsilon
$$

The basic bracketing maximal inequality uses the $L_{2}(P)$-norm.
2.14.2 Theorem. Let $\mathcal{F}$ be a class of measurable functions with measurable envelope function $F$. For a given $\eta>0$, set

$$
a(\eta)=\eta\|F\|_{P, 2} / \sqrt{1+\log N_{[]}\left(\eta\|F\|_{P, 2}, \mathcal{F}, L_{2}(P)\right)}
$$

Then for every $\eta>0$,

$$
\begin{aligned}
&\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, 1} \lesssim J_{[]}\left(\eta, \mathcal{F}, L_{2}(P)\right)\|F\|_{P, 2}+\sqrt{n} P F\{F>\sqrt{n} a(\eta)\} \\
&+\| \| f\left\|_{P, 2}\right\|_{\mathcal{F}} \sqrt{1+\log N_{[]}\left(\eta\|F\|_{P, 2}, \mathcal{F}, L_{2}(P)\right)}
\end{aligned}
$$

Consequently, if $\|f\|_{P, 2}<\delta\|F\|_{P, 2}$ for every $f$ in the class $\mathcal{F}$, then

$$
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, 1} \lesssim J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)\|F\|_{P, 2}+\sqrt{n} P F\{F>\sqrt{n} a(\delta)\} .
$$

In particular, for any class $\mathcal{F}$,

$$
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, 1} \lesssim J_{[]}\left(1, \mathcal{F}, L_{2}(P)\right)\|F\|_{P, 2}
$$

The constants in the inequalities are universal.

In some applications it is useful to use a stronger norm than the $L_{2}$ norm. Then the bracketing integral is larger, but the stronger norm gives better control over the links left over at the end of the chains by the chaining argument. In the preceding theorem, these are bounded in a rather crude manner. The following lemma is more complicated, but will be useful.
2.14.3 Lemma. Let $\mathcal{F}$ be an arbitrary class of measurable functions and $\|\cdot\|$ a norm that dominates the $L_{2}(P)$-norm. Then, for every $\delta>3 \gamma \geq 0$, there exist deterministic functions $e_{n}: \mathcal{F} \mapsto \mathbb{R}$ with $\left\|e_{n}\right\|_{\mathcal{F}} \leq 8 \gamma \sqrt{n}$ such that

$$
\begin{aligned}
\left\|\sup _{f}\left(\mathbb{G}_{n}-e_{n}\right)^{+*}\right\|_{P, p} \lesssim & \int_{\gamma}^{\delta} \sqrt{1+\log N_{[]}(\varepsilon, \mathcal{F},\|\cdot\|)} d \varepsilon \\
& +\left\|\sup _{i}\left|\mathbb{G}_{n} f_{i}\right|\right\|_{P, p}+\left\|\sup _{i}\left|\mathbb{G}_{n} \sup _{f \in \mathcal{F}_{i}}\right| f-f_{i} \mid\right\|^{*} \|_{P, p}
\end{aligned}
$$

for a minimal partition $\mathcal{F}=\cup_{i=1}^{m} \mathcal{F}_{i}$ into sets of $\|\cdot\|$-diameter at most $\delta$ and any choice of $f_{i} \in \mathcal{F}_{i}$. The constants in the inequalities are universal.

Proofs. For the proof of the lemma, fix integers $q_{0}$ and $q_{2}$ such that $2^{-q_{0}}< \delta \leq 2^{-q_{0}+1}$ and $2^{-q_{2}-2}<\gamma \leq 2^{-q_{2}-1}$. For $q \geq q_{0}$, construct a nested sequence of partitions $\mathcal{F}=\cup_{i=1}^{N_{q}} \mathcal{F}_{q i}$ such that the $q_{0}$ th partition is the partition given in the statement of the lemma and for, each $q>q_{0}$,

$$
\left\|\left(\sup _{f, g \in \mathcal{F}_{q i}}|f-g|\right)^{*}\right\|<2^{-q} .
$$

By the choice of $q_{0}$ the number of sets in the $q_{0}$ th partition satisfies $N_{q_{0}} \leq N_{[]}\left(2^{-q_{0}}, \mathcal{F},\|\cdot\|\right)$ and the preceding display is valid for $q=q_{0}$ up to a factor 2. The number $N_{q}$ of subsets in the $q$ th partition can be chosen to satisfy

$$
\log N_{q} \leq \sum_{r=q_{0}}^{q} \log N_{[]}\left(2^{-r}, \mathcal{F},\|\cdot\|\right) .
$$

Now adopt the same notation as in the proof of Theorem 2.5.6 (except define $a_{q}$ with $1+\log$ rather than $\log$ ) and decompose, pointwise in $x$ (which is suppressed in the notation),

$$
\begin{aligned}
f-\pi_{q_{0}} f=( & \left.f-\pi_{q_{0}} f\right) B_{q_{0}} f+\sum_{q_{0}+1}^{q_{2}}\left(f-\pi_{q} f\right) B_{q} f \\
& +\sum_{q_{0}+1}^{q_{2}}\left(\pi_{q} f-\pi_{q-1} f\right) A_{q-1} f+\left(f-\pi_{q_{2}} f\right) A_{q_{2}} f
\end{aligned}
$$

See the proof of Theorem 2.5.6 for the notation and motivation.

Apply the empirical process $\mathbb{G}_{n}$ to each of the three terms separately and take suprema over $f \in \mathcal{F}$. The $L_{p}(P)$-norm of the first term resulting from this procedure can be bounded by

$$
\left\|\left\|\mathbb{G}_{n}\left(f-\pi_{q_{0}} f\right) B_{q_{0}} f\right\|_{\mathcal{F}}^{*}\right\|_{P, p} \lesssim\| \| \mathbb{G}_{n} \Delta_{q_{0}} f\left\|_{\mathcal{F}}^{*}\right\|_{P, p}+\sqrt{n}\left\|P \Delta_{q_{0}} f B_{q_{0}} f\right\|_{\mathcal{F}}
$$

The first term on the right arises as the last term in the upper bound of the lemma. The second term on the right can be bounded by

$$
\begin{aligned}
a_{q_{0}}^{-1} P \Delta_{q_{0}}^{2} f & \lesssim \delta \sqrt{1+\log N_{[]}(\delta / 2, \mathcal{F},\|\cdot\|)} \\
& \lesssim \int_{\delta / 3}^{\delta} \sqrt{1+\log N_{[]}(\varepsilon, \mathcal{F},\|\cdot\|)} d \varepsilon
\end{aligned}
$$

This is bounded by the right side of the lemma.
The second and third terms in the decomposition can be bounded in exactly the same manner as in the proof of Theorem 2.5.6, where it may be noted that Lemma 2.2.10 bounds the $\psi_{1}$-norm, hence every $L_{p}$-norm up to a constant. This shows that inequality (2.5.5) is also valid with the $L_{p}$-norm of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ on the left. Thus the second and third terms give contributions to the $L_{p}(P)$-norm of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$ bounded up to a constant by

$$
\sum_{q_{0}+1}^{q_{2}+1} 2^{-q} \sqrt{1+\log N_{q}} \lesssim \int_{2^{-q_{2}-1}}^{2^{-q_{0}}} \sqrt{1+\log N_{[]}(\varepsilon, \mathcal{F},\|\cdot\|)} d \varepsilon
$$

This is bounded by the right side of the lemma.
For the final term, define $e_{n}(f)=2 \sqrt{n} P \Delta_{q_{2}} f$. Then $\mathbb{G}_{n}(f- \left.\pi_{q_{2}} f\right) A_{q_{2}} f-e_{n}(f)$ is bounded above by $\mathbb{G}_{n} \Delta_{q_{2}} f A_{q_{2}} f$, and the fourth term in the decomposition shifted by $e_{n}$ yields

$$
\begin{gathered}
\left\|\sup _{f}\left(\mathbb{G}_{n}\left(f-\pi_{q_{2}} f\right) A_{q_{2}} f-e_{n}(f)\right)^{+*}\right\|_{P, p} \leq\| \| \mathbb{G}_{n} \Delta_{q_{2}} f A_{q_{2}} f\left\|_{\mathcal{F}}^{*}\right\|_{P, p} \\
\lesssim a_{q_{2}-1}\left(1+\log N_{q_{2}}\right)+2^{-q_{2}} \sqrt{1+\log N_{q_{2}}}
\end{gathered}
$$

This is bounded by the contribution of the second and third parts of the decomposition. This concludes the proof of the lemma.

For the proof the theorem, apply the preceding argument with the $L_{2}(P)$-norm substituted for $\|\cdot\|$ and $q_{2}=\infty$. Then the fourth term in the decomposition of $f-\pi_{q_{0}} f$ vanishes, and the contributions of the second and third terms to $\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ can be bounded as before. The first term yields the contribution

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\left(f-\pi_{q_{0}} f\right) B_{q_{0}} f\right\|_{\mathcal{F}} \lesssim \sqrt{n} P^{*} F\left\{2 F>\sqrt{n} a_{q_{0}}\right\}
$$

For $\delta=8 \eta\|F\|_{P, 2}$, the right side is bounded by $\sqrt{n} P^{*} F\{F>\sqrt{n} a(\eta)\}$. Finally,

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n} \pi_{q_{0}} f\right\|_{\mathcal{F}} \lesssim \mathrm{E}^{*}\left\|\mathbb{G}_{n} \pi_{q_{0}} f\{F \leq \sqrt{n} a(\eta)\}\right\|_{\mathcal{F}}+\sqrt{n} P^{*} F\{F>\sqrt{n} a(\eta)\}
$$

Each function $\pi_{q_{0}} f 1\{F \leq \sqrt{n} a(\eta)\}$ is uniformly bounded by $\sqrt{n} a(\eta)$. Inequality (2.5.5) yields a bound for the first term on the left equal to a multiple of

$$
\left(1+\log N_{q_{0}}\right) a(\eta)+\sqrt{1+\log N_{q_{0}}}\| \| f\left\|_{P, 2}\right\|_{\mathcal{F}} .
$$

The first term is bounded by a multiple of $J_{[]}\left(\eta, \mathcal{F}, L_{2}(P)\right)\|F\|_{P, 2}$. The second arises as the last term in the first inequality of the theorem.

For the second inequality of the theorem, it suffices to note that the integrand in the bracketing integral is decreasing so that

$$
\delta \sqrt{1+\log N_{[]}\left(\delta\|F\|_{P, 2}, \mathcal{F}, L_{2}(P)\right)} \leq J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right) .
$$

For the final inequality of the theorem, choose $\delta=2$ in the second. Since the class $\mathcal{F}$ fits in the single bracket $[-F, F]$, it follows that $a(2)=2\|F\|_{P, 2}$. $\square$
2.14.4 Example (Alternative proofs of the Donsker theorems). The proofs of the preceding maximal inequalities are modelled after the proofs of the uniform-entropy central limit theorem and the bracketing central limit theorem. The inequalities are sufficiently strong to yield short proofs of these results.

First consider the central limit theorem under the conditions of Theorem 2.5.2. Under the uniform-entropy bound (2.5.1), the entropy integral $J(\delta, \mathcal{F})$ is uniformly bounded and $J(\delta, \mathcal{F}) \rightarrow 0$ as $\delta \downarrow 0$. The entropy integral of the class $\mathcal{F}-\mathcal{F}$ (with envelope $2 F$ ) is bounded by a multiple of $J(\delta, \mathcal{F})$. Application of the $L_{1}$-inequality of Theorem 2.14.1 followed by the Cauchy-Schwarz inequality yields, with $\theta_{n}^{2}=\left\|\mathbb{P}_{n} f^{2}\right\|_{\mathcal{F}_{\delta}}^{*} / \mathbb{P}_{n} F^{2}$,

$$
\mathrm{E}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{\delta}} \lesssim \mathrm{E}^{*} J\left(\theta_{n}, \mathcal{F}\right)\|F\|_{n} \leq\left(\mathrm{E}^{*} J^{2}\left(\theta_{n}, \mathcal{F}\right) P F^{2}\right)^{1 / 2}
$$

The sequence of empirical processes indexed by $\mathcal{F}$ is asymptotically tight if the right side converges to zero as $n \rightarrow \infty$ followed by $\delta \downarrow 0$. In view of the dominated convergence theorem, this is true if $\theta_{n} \rightarrow 0$ in probability.

Without loss of generality, assume that $F \geq 1$, so that $\theta_{n}^{2} \leq\left\|\mathbb{P}_{n} f^{2}\right\|_{\mathcal{F}_{\delta}}$. The desired conclusion follows if $\left\|\mathbb{P}_{n} f^{2}-P f^{2}\right\|_{\mathcal{F}_{\delta}}$ converges in probability to zero. This is certainly the case if the class $\mathcal{G}=(\mathcal{F}-\mathcal{F})^{2}$ is GlivenkoCantelli in probability. Let $\mathcal{G}_{M}$ be the functions $g 1\{F \leq M\}$ when $g$ ranges over $\mathcal{G}$. Since $N\left(4 \varepsilon M\|F\|_{Q, 2}, \mathcal{G}_{M}, L_{2}(Q)\right) \leq N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)^{2}$, the entropy integral of $\mathcal{G}_{M}$ with envelope $4 M F(!)$ is bounded by a multiple of $J(\delta, \mathcal{F})$. A second application of Theorem 2.14.1 gives

$$
\mathrm{E}^{*}\left\|\mathbb{P}_{n} f^{2}-P f^{2}\right\|_{\mathcal{F}-\mathcal{F}} \lesssim \frac{1}{\sqrt{n}} J(1, \mathcal{F}) M\left(P F^{2}\right)^{1 / 2}+P F^{2}\{F>M\}
$$

for every $M$. This converges to zero as $n \rightarrow \infty$ followed by $M \rightarrow \infty$.
Next, consider the simplified version of the bracketing central limit Theorem 2.5.6, which asserts that $\mathcal{F}$ is Donsker if the bracketing integral
$J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)$ is finite. This theorem is a corollary from the second maximal inequality given by Theorem 2.14.2, which shows that $\mathrm{E}^{*}\|\mathbb{G}\|_{\mathcal{F}_{\delta}} \rightarrow 0$ as $n \rightarrow \infty$ followed by $\delta \downarrow 0$.

The preceding maximal inequalities can be extended to other Orlicz norms. In fact, Orlicz norms of sums of independent processes can in general be bounded by their $L_{1}$-norm plus a maximum or sum of Orlicz norms of the individual terms. Thus, bounds on $\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ can be turned into bounds on more general Orlicz norms of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$.
2.14.5 Theorem. Let $\mathcal{F}$ be a class of measurable functions with measurable envelope function $F$. Then

$$
\begin{aligned}
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, p} & \lesssim\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, 1}+n^{-1 / 2+1 / p}\|F\|_{P, p} \\
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, \psi_{p}} & \lesssim\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, 1}+n^{-1 / 2}(1+\log n)^{1 / p}\|F\|_{P, \psi_{p}} \\
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, \psi_{p}} & \lesssim\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, 1}+n^{-1 / 2+1 / q}\|F\|_{P, \psi_{p}} \\
& (1<p \leq 2)
\end{aligned}
$$

Here $1 / p+1 / q=1$ and the constants in the inequalities $\lesssim$ depend only on the type of norm involved in the statement.

Proof. Specialization of Proposition A.1.6 to the present situation gives the inequalities

$$
\begin{aligned}
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, p} \lesssim\| \| \mathbb{G}_{n}\left\|_{\mathcal{F}}^{*}\right\|_{P, 1}+n^{-1 / 2}\left\|\max _{1 \leq i \leq n} F\left(X_{i}\right)\right\|_{P, p} & (p \geq 1) \\
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, \psi_{p}} \lesssim\| \| \mathbb{G}_{n}\left\|_{\mathcal{F}}^{*}\right\|_{P, 1}+n^{-1 / 2}\left\|\max _{1 \leq i \leq n} F\left(X_{i}\right)\right\|_{P, \psi_{p}} & (0<p \leq 1)
\end{aligned}
$$

Next, Lemma 2.2.2 can be used to further bound the maxima appearing on the right. This gives the first two lines of the theorem. The third line is immediate from Proposition A.1.6.

To obtain tail bounds for the random variable $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$, the last theorem may be combined with the bounds on $\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ given by the preceding theorems. While the last theorem is valid for any class $\mathcal{F}$ of functions, the bounds on $\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ rely on the finiteness of an entropy integral. If either the uniform-entropy integral or the bracketing entropy integral of the class $\mathcal{F}$ is finite, then

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim\|F\|_{P, 2}
$$

where the constant depends on the entropy integral. The $L_{2}(P)$-norm of the envelope function can in turn be bounded by an exponential Orlicz norm. Combination with the last theorem shows that

$$
\left\|\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}\right\|_{P, \psi_{p}} \lesssim\|F\|_{P, \psi_{p}} \quad(0<p \leq 2)
$$

Conclude that $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$ has tails of the order $\exp \left(-C t^{p}\right)$ for some $0<p \leq 2$, whenever the envelope function $F$ has tails of this order. Similar reasoning
can be applied using the $L_{p}(P)$-norms. It may be noted that, for large $n$ and $0<p<2$, the size of the $\psi_{p}$-norm of $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}$ is mostly determined by the entropy integral and the $L_{2}$-norm of the envelope: according to the preceding theorem, the $\psi_{p}$-norm of the envelope enters the upper bound multiplied by a factor that converges to zero as $n \rightarrow \infty$.

To see some of the strength of the preceding theorems, it is instructive to apply them to a class $\mathcal{F}$ consisting of a single function $f$. Then $J(\delta,\{f\})=\delta$ and the envelope function is $|f|$. For $\mathcal{F}=\{f\}$, Theorem 2.14.1 gives

$$
\left\|\mathbb{G}_{n} f\right\|_{P, p} \lesssim\left\|\left(\frac{1}{n} \sum_{i=1}^{n} f^{2}\left(X_{i}\right)\right)^{1 / 2}\right\|_{P, p} \leq\|f\|_{P, p}, \quad p \geq 2 .
$$

This is the upper half of the Marcinkiewicz-Zygmund inequality. ${ }^{b}$ Theorem 2.14.5 yields a tightening of the inequality between the far left and the right sides. More interestingly, it gives bounds for the exponential Orlicz norms

$$
\begin{array}{ll}
\left\|\mathbb{G}_{n} f\right\|_{P, \psi_{p}} \lesssim\|f\|_{P, 2}+n^{-1 / 2}(1+\log n)^{1 / p}\|f\|_{P, \psi_{p}} & (0<p \leq 1), \\
\left\|\mathbb{G}_{n} f\right\|_{P, \psi_{p}} \lesssim\|f\|_{P, 2}+n^{-1 / 2+1 / q}\|f\|_{P, \psi_{p}} & (1<p \leq 2) .
\end{array}
$$

The last line for $p=q=2$ shows that the random variable $\mathbb{G}_{n} f$ is subGaussian whenever $\|f\|_{P, \psi_{2}}$ is finite. Apart from a universal constant, this generalizes Hoeffding's inequality, which makes the same statement for uniformly bounded functions $f$. Hoeffding's inequality for linear combinations of Rademacher variables is given by Lemma 2.2.7 and is the essential ingredient in the proof of Theorem 2.14.1.

### 2.14.2 Uniformly Bounded Classes

In this subsection we refine the tail bounds on $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ in the case of uniformly bounded classes $\mathcal{F}$. We present both Hoeffding- and Bernsteintype bounds. Throughout this subsection it is assumed that $0 \leq f \leq 1$ for every $f \in \mathcal{F}$. Without further mention, it is also assumed that $X_{1}, X_{2}, \ldots$ are defined as the coordinate projections on a product space ( $\mathcal{X}^{\infty}, \mathcal{A}^{\infty}, P^{\infty}$ ) and that the class $\mathcal{F}$ is pointwise separable.

The first theorem is valid for classes $\mathcal{F}$ with polynomial covering numbers or polynomial bracketing numbers: for some constants $V$ and $K$,

$$
\begin{equation*}
\sup _{Q} N\left(\varepsilon, \mathcal{F}, L_{2}(Q)\right) \leq\left(\frac{K}{\varepsilon}\right)^{V}, \quad \text { for every } 0<\varepsilon<K, \tag{2.14.6}
\end{equation*}
$$

or

$$
\begin{equation*}
N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right) \leq\left(\frac{K}{\varepsilon}\right)^{V}, \quad \text { for every } 0<\varepsilon<K . \tag{2.14.7}
\end{equation*}
$$

[^4]In the first inequality, the supremum is taken over all probability measures $Q$. In particular, the theorem is valid for Vapnik-Cervonenkis classes: according to Theorem 2.6.7, a VC-class of index $V(\mathcal{F})$ with envelope function $F=1$ satisfies (2.14.6) for $V=2 V(\mathcal{F})-2$ and a constant $K$ that depends on $V$ only.

The second theorem applies to classes such that, for some constants $0<W<2$ and $K$,

$$
\begin{equation*}
\sup _{Q} \log N\left(\varepsilon, \mathcal{F}, L_{2}(Q)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{W}, \quad \text { for every } \varepsilon>0 \tag{2.14.8}
\end{equation*}
$$

for some $0<W<2$ and constant $K$. Again the supremum is taken over all probability measures $Q$.
2.14.9 Theorem. Let $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto[0,1]$ that satisfies (2.14.6) or (2.14.7). Then, for every $t>0$,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right) \leq\left(\frac{D t}{\sqrt{V}}\right)^{V} e^{-2 t^{2}}
$$

for a constant $D$ that depends on $K$ only.
2.14.10 Theorem. Let $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto[0,1]$ that satisfies (2.14.8). Then, for every $\delta>0$ and $t>0$,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right) \leq C e^{D t^{U+\delta}} e^{-2 t^{2}}
$$

where $U=W(6-W) /(2+W)$ and the constants $C$ and $D$ depend on $K$, $W$, and $\delta$ only.

We note that the exponent $U$ in the second theorem increases from 0 to 2 as $W$ increases from 0 to 2 .

While the constant 2 in the exponential $e^{-2 t^{2}}$ in Theorem 2.14.9 is sharp, the power of the additional term is not. For instance, the empirical distribution function on the line satisfies the exponential bound $D e^{-2 t^{2}}$, whereas the bound obtained from Theorem 2.14.9 is of the form $D t^{2} e^{-2 t^{2}}$, since (2.14.6) holds with $V=2$ in this case. We shall consider two improvements for $\mathcal{F}$ equal to a class of indicators of sets.

The exponential bounds for the suprema $\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ are based on exponential bounds for the individual variables $\mathbb{G}_{n} f$. For sets $C$ with probability bounded away from zero and one, an improved exponential bound can be derived from the exponential bound of Talagrand for the tail of a binomial random variable

$$
\mathrm{P}\left(\left|\mathbb{G}_{n}(C)\right|>t\right) \leq \frac{K}{t} e^{-2 t^{2}}, \quad \text { for every } t>0
$$

(see Proposition A.6.4). This suggests that it might be possible to improve on Theorem 2.14.9 in the case of sets. In fact, this improvement is possible. We replace (2.14.6) and (2.14.7) by their corresponding $L_{1}$ versions.

Suppose that $\mathcal{C}$ is a class of sets such that, for given constants $K$ and $V$, either

$$
\begin{equation*}
\sup _{Q} N\left(\varepsilon, \mathcal{C}, L_{1}(Q)\right) \leq\left(\frac{K}{\varepsilon}\right)^{V}, \quad \text { for every } 0<\varepsilon<K, \tag{2.14.11}
\end{equation*}
$$

or

$$
\begin{equation*}
N_{[]}\left(\varepsilon, \mathcal{C}, L_{1}(P)\right) \leq\left(\frac{K}{\varepsilon}\right)^{V}, \quad \text { for every } 0<\varepsilon<K . \tag{2.14.12}
\end{equation*}
$$

The supremum is taken over all probability measures $Q$. We note that the present $V$ is $1 / 2$ times the exponent $V$ in conditions (2.14.6) and (2.14.7).
2.14.13 Theorem. Let $\mathcal{C}$ be a class of sets that satisfies (2.14.11) or (2.14.12). Then

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) \leq \frac{D}{t}\left(\frac{D K t^{2}}{V}\right)^{V} e^{-2 t^{2}}
$$

for every $t>0$ and a constant $D$ that depends on $K$ only.
Considering the special case of the empirical distribution function on the line once again, we see that Theorem 2.14.13 still does not yield the known exponential bound $D e^{-2 t^{2}}$. Since the collection of left half-lines satisfies (2.14.11) with $V=1$, Theorem 2.14.13 yields a bound of the form Dt $e^{-2 t^{2}}$.

To obtain the "correct" power of $t$ in the bounds requires consideration of the size of the sets in a neighborhood of the collection $\{C \in \mathcal{C}: P(C)= 1 / 2\}$ for which the variance of $\mathbb{G}_{n} C$ is maximal. To this end, define

$$
\mathcal{C}_{\delta}=\{C \in \mathcal{C}:|P(C)-1 / 2| \leq \delta\} .
$$

It is the dimensionality of such neighborhoods that really governs which power of $t$ is possible. The following theorem gives a refinement of Theorem 2.14.13 to clarify this dependence.
2.14.14 Theorem. Let $\mathcal{C}$ be a class of sets that satisfies either (2.14.11) or (2.14.12), and suppose moreover that

$$
\begin{equation*}
N\left(\varepsilon, \mathcal{C}_{\delta}, L_{1}(P)\right) \leq K^{\prime} \delta^{W} \varepsilon^{-V^{\prime}}, \quad \text { for every } \delta \geq \varepsilon>0 \tag{2.14.15}
\end{equation*}
$$

for some constant $K^{\prime}$. Then

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) \leq D t^{2 V^{\prime}-2 W} e^{-2 t^{2}}
$$

for every $t>K \sqrt{W}$ and a constant $D$ that depends on $K, K^{\prime}, W, V$, and $V^{\prime}$ only.

For $\mathcal{C}$ equal to the collection of left half-lines in $\mathbb{R}$, inequality (2.14.15) holds with $V^{\prime}=1$ and $W=1$ (at worst) for any probability measure $P$.

Hence Theorem 2.14.14 gives a bound of the form $D e^{-2 t^{2}}$ in agreement with the bound of Dvoretzky, Kiefer, and Wolfowitz (1956).

When $P$ is uniform on $[0,1]^{d}$ and $\mathcal{C}$ is the collection of lower-left subrectangles of $[0,1]^{d},(2.14 .15)$ holds with $V^{\prime}=d, W=1$, and the bound given by Theorem 2.14.14 is of the form $D t^{2(d-1)} e^{-2 t^{2}}$. However, this bound is not uniform in $P$. See Smith and Dudley (1992) and Adler and Brown (1986).

The preceding theorems give tail bounds in terms of entropy and envelope but do not show the dependence on the variances of the functions in $\mathcal{F}$. In many applications, especially when an entire collection $\mathcal{F}$ is replaced by a subcollection, as in the study of oscillation moduli, it is useful to introduce the maximal variance

$$
\sigma_{\mathcal{F}}^{2}=\left\|P(f-P f)^{2}\right\|_{\mathcal{F}}
$$

into the bound. If every $f$ takes its values in the interval $[0,1]$, this variance is maximally $1 / 4$. Thus a bound of the order $\exp -(1 / 2) t^{2} / \sigma_{\mathcal{F}}{ }^{2}$ could be better than the bounds given by the preceding theorems. This bound is valid in the limit as $n \rightarrow \infty$, but for finite sample size a correction is necessary.
2.14.16 Theorem. Let $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto[0,1]$ that satisfies (2.14.6). Then for every $\sigma_{\mathcal{F}}^{2} \leq \sigma^{2} \leq 1$ and every $\delta>0$,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right) \leq C\left(\frac{1}{\sigma}\right)^{2 V}\left(1 \vee \frac{t}{\sigma}\right)^{3 V+\delta} e^{-\frac{1}{2} \frac{t^{2}}{\sigma^{2}+(3+t) / \sqrt{n}}}
$$

for every $t>0$ and a constant $C$ that depends on $K, V$, and $\delta$ only.
2.14.17 Theorem. Let $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto[0,1]$ that satisfies (2.14.8). Then for every $\sigma_{\mathcal{F}}^{2} \leq \sigma^{2} \leq 1$, every $\delta>0,0< p(1-u)<2$, and $0<u<1$,
$\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right) \leq C e^{D\left(\frac{1}{\sigma}\right)^{W}}\left(\frac{t}{\sigma}\right)^{p(1-u)+\delta}+5\left(\frac{t}{\sigma}\right)^{2 u} e^{-\frac{1}{2} \frac{t^{2}}{\sigma^{2}+\left(3(t / \sigma)^{u}+t\right) / \sqrt{n}}}$,
for every $t>0$, where $p=W(6-W) /(2-W)$ and the constants $C$ and $D$ depend on $K, W$, and $\delta$ only.

We do not include proofs of all of Theorems 2.14.9-2.14.17. Theorems 2.14.10, 2.14.16, and 2.14.17 are proved completely in this subsection. For Theorem 2.14.9, we give a proof assuming (2.14.6), but with the power of $t$ in the theorem equal to $3 V+\delta$ instead of $V$. After developing more tools needed to prove the tighter bounds in the following subsection, we give a complete proof of Theorem 2.14.13 under the assumption (2.14.11) in Subsection 2.14.4. For complete proofs of Theorems 2.14.9, 2.14.13, and 2.14.14, we refer the interested reader to Talagrand (1994).

The proofs of the tail bounds stated in Theorems 2.14.10, 2.14.16, and 2.14.17 rely on two key lemmas. The first lemma bounds the tail probability
of interest by a corresponding tail probability for sampling $n$ observations without replacement from the empirical measure based on a sample of size $N=m n$ (with large $m$ chosen dependent on $t$ in the proof). This lemma may be considered an alternative to the symmetrization inequalities involving Rademacher variables derived previously: the present bound is more complicated, but it appears to be more economic.

Sampling without replacement can be described in terms of a random permutation. Let $\left(R_{1}, \ldots, R_{N}\right)$ be uniformly distributed on the set of permutations of $\{1, \ldots, N\}$, and let $X_{1}, \ldots, X_{N}$ be an independent i.i.d. sample from $P$. Define $n^{\prime}=N-n$ and

$$
\tilde{\mathbb{P}}_{n, N}=\frac{1}{n} \sum_{i=1}^{n} \delta_{X_{R_{i}}} ; \quad \mathbb{P}_{N}=\frac{1}{N} \sum_{i=1}^{N} \delta_{X_{i}} .
$$

Then the tail probabilities of the empirical process of $n$ observations can be bounded by the tail probabilities of $\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}$.
2.14.18 Lemma. For all $0<a<1$, any $\sigma^{2} \geq\left\|P(f-P f)^{2}\right\|_{\mathcal{F}}$, and every $t>0$,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}>t\right) \leq\left[1-\frac{\sigma^{2}}{(1-a)^{2} t^{2} n^{\prime}}\right]^{-1} \mathrm{P}^{*}\left(\left\|\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right\|_{\mathcal{F}}>t a \frac{n^{\prime}}{N}\right)
$$

Proof. See Devroye (1982) and Shorack and Wellner (1986), pages 829830.

The motivation for this step is the availability of several relatively sharp bounds for the tail probabilities of the mean of a sample of size $n$ without replacement. In the proof of the main results, these are applied conditionally on the sample $X_{1}, \ldots, X_{N}$. For given real numbers $c_{1}, \ldots, c_{N}$, set
$\bar{c}_{N}=\frac{1}{N} \sum_{i=1}^{N} c_{i} ; \quad \sigma_{N}^{2}=\frac{1}{N} \sum_{i=1}^{N}\left(c_{i}-\bar{c}_{N}\right)^{2} ; \quad \Delta_{N}=\max _{1 \leq i \leq N} c_{i}-\min _{1 \leq i \leq N} c_{i}$.
The following lemma collects four exponential bounds on the tail probabilities of a mean of a sample without replacement.
2.14.19 Lemma. Let $U_{1}, \ldots, U_{n}$ be a random sample without replacement from the real numbers $\left\{c_{1}, \ldots, c_{N}\right\}$. Then for every $t>0$,

$$
\mathrm{P}\left(\left|\bar{U}_{n}-\bar{c}_{N}\right|>t\right) \leq \begin{cases}2 \exp \left(-\frac{2 n t^{2}}{\Delta_{N}^{2}}\right) & \text { (Hoeffding), } \\ 2 \exp \left(-\frac{2 n t^{2}}{(1-(n-1) / N) \Delta_{N}^{2}}\right) & \text { (Serfling), } \\ 2 \exp \left(-\frac{n t^{2}}{2 \sigma_{N}^{2}+t \Delta_{N}}\right) & \text { (Hoeffding-Bernstein), } \\ 2 \exp \left(-\frac{n t^{2}}{m \sigma_{N}^{2}}\right) & \text { if } N=m n \quad \text { (Massart). }\end{cases}
$$

Proof. For a proof of the first three inequalities, see Shorack and Wellner (1986). We prove the fourth.

The sample without replacement can be generated in two steps. First, partition the set of points $\left\{c_{1}, \ldots, c_{N}\right\}$ randomly into $n$ subsets $J_{1}, \ldots, J_{n}$ of $m$ elements each. Next, randomly choose one element of each subset. Let $E_{2}$ denote expectation with respect to the second step only, treating the partition obtained in the first step as fixed. Given the partition, the variables $U_{1}, \ldots, U_{n}$ are independent with means $\bar{c}_{1}, \ldots, \bar{c}_{n}$ equal to the averages over the $c_{i}$ in each partitioning set. The average of these averages is the grand average $\bar{c}_{N}$. Thus

$$
\mathrm{E}_{2} e^{s\left(\bar{U}_{n}-\bar{c}_{N}\right)}=\prod_{i=1}^{n} \mathrm{E}_{2} e^{s\left(U_{i}-\bar{c}_{i}\right) / n} \leq \prod_{i=1}^{n} e^{s^{2} \Delta_{i}^{2} / 8 n^{2}}
$$

by Hoeffding's inequality (Problem 2.14.2), where the numbers $\Delta_{i}= \max _{j \in J_{i}} c_{j}-\min _{j \in J_{i}} c_{j}$ are the ranges of the partitioning sets. Since $\Delta_{i}^{2} \leq 2 \sum_{j \in J_{i}}\left(c_{j}-\bar{c}_{N}\right)^{2}$, the sum of the $\Delta_{i}^{2}$ is bounded by $2 N \sigma_{N}^{2}$. Conclude that, for every $s$,

$$
\mathrm{P}\left(\bar{U}_{n}-\bar{c}_{N}>t\right) \leq e^{-s t} \mathrm{EE}_{2} e^{s\left(\bar{U}_{n}-\bar{c}_{N}\right)} \leq e^{-s t+s^{2} m \sigma_{N}^{2} / 4 n}
$$

The choice $s=2 n t / m \sigma_{N}^{2}$ yields an upper bound equal to half the upper bound given by the lemma. The probability $\mathrm{P}\left(-\bar{U}_{n}+\bar{c}_{N}>t\right)$ can be bounded similarly.

Proof of Theorems 2.14.9, 2.14.10, 2.14.16, and 2.14.17. (Recall that Theorem 2.14.9 will only be proved with $3 V+\delta$ instead of $V$.) It suffices to prove the inequalities for sufficiently large $t$, since their validity for small $t$ can be ensured by choice of the constant $C$. Here "sufficiently large" means larger than some value depending only on $K, V, W$, and $\delta$ as in the statements of the theorems.

For a given $N=m n$ and a sequence of positive constants $\varepsilon_{q} \downarrow 0$, take a minimal $\varepsilon_{q}$-net for $\mathcal{F}$ for the $L_{2}\left(\mathbb{P}_{N}\right)$-semimetric. For each $f$, let $\pi_{q} f$ be a closest element in this net. Fix $q_{0}$. The series

$$
\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right) \pi_{q_{0}} f+\sum_{q>q_{0}}\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right)\left(\pi_{q}-\pi_{q-1}\right) f
$$

is convergent with limit $\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right) f$. To see this, note first that the $q$ th partial sum of the series telescopes out to $\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right) \pi_{q} f$. Since $\tilde{\mathbb{P}}_{n, N} f \leq m \mathbb{P}_{N} f$ for every nonnegative $f$, we have

$$
\left|\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right)\left(f-\pi_{q} f\right)\right|^{2} \leq 2\left(\tilde{\mathbb{P}}_{n, N}+\mathbb{P}_{N}\right)\left(f-\pi_{q} f\right)^{2} \leq 2(m+1) \varepsilon_{q}^{2} \rightarrow 0
$$

and the conclusion follows. The triangle inequality can now be applied to obtain

$$
\left\|\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right\|_{\mathcal{F}} \leq\left\|\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right) \pi_{q_{0}} f\right\|_{\mathcal{F}}+\sum_{q>q_{0}}\left\|\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right)\left(\pi_{q}-\pi_{q-1}\right) f\right\|_{\mathcal{F}}
$$

If the $\varepsilon_{q}$-net has $N_{q}$ elements, then the suprema are over at most $N_{q_{0}}$ in the first term on the right and $N_{q} N_{q-1}$ elements in each of the terms of the series, respectively. Conclude that for any positive numbers $\eta_{q}$ and $b$ with $\sum_{q>q_{0}} \eta_{q}+b \leq 1$ :

$$
\begin{align*}
& \mathrm{P}_{R}\left(\left\|\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right\|_{\mathcal{F}}>t\right) \\
& \quad \leq N_{q_{0}}\left\|\mathrm{P}_{R}\left(\left|\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right) \pi_{q_{0}} f\right|>t b\right)\right\|_{\mathcal{F}}  \tag{2.14.20}\\
& \quad+\sum_{q>q_{0}} N_{q}^{2}\left\|\mathrm{P}_{R}\left(\left|\left(\tilde{\mathbb{P}}_{n, N}-\mathbb{P}_{N}\right)\left(\pi_{q}-\pi_{q-1}\right) f\right|>t \eta_{q}\right)\right\|_{\mathcal{F}} .
\end{align*}
$$

The probabilities on the right will be bounded with the help of the various exponential bounds of Lemma 2.14.19. Lemma 2.14.18 turns the resulting upper bounds into bounds on the tails of the distribution of $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}$. For appropriate choices of tuning constants, this gives the desired results. In all four cases the second term on the right is negligible with respect to the first.

For the proofs of Theorems 2.14.9 and 2.14.10 (with $3 V+\delta$ instead of $V$ ), use Hoeffding's inequality on the first term in the right of (2.14.20) and Massart's inequality on each of the terms of the series. Thus, (2.14.20) is bounded by

$$
\begin{equation*}
N_{q_{0}} 2 \exp \left(-2 n t^{2} b^{2}\right)+\sum_{q>q_{0}} N_{q}^{2} \exp \left(\frac{-n t^{2} \eta_{q}^{2}}{m 4 \varepsilon_{q-1}^{2}}\right) . \tag{2.14.21}
\end{equation*}
$$

Note that $\mathbb{P}_{N}\left(\pi_{q} f-\pi_{q-1} f\right)^{2} \leq 2 \varepsilon_{q}^{2}+2 \varepsilon_{q-1}^{2}$ is bounded by $4 \varepsilon_{q-1}^{2}$.
For the proof of Theorem 2.14.9, choose $\alpha$ large and

$$
\begin{aligned}
a & =1-t^{-2} ; \quad b=1-t^{-2} ; \quad m=\left\lfloor t^{2}\right\rfloor ; \quad q_{0}=2+\left\lfloor t^{2 /(\alpha-1)}\right\rfloor ; \\
\sqrt{m} \varepsilon_{q} & =q^{-\alpha-1} ; \quad \eta_{q}=(q-1)^{-\alpha} .
\end{aligned}
$$

Combination of Lemma 2.14.18 and (2.14.6) with (2.14.20) and (2.14.21) yields as upper bound for $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ a constant times

$$
\begin{aligned}
\left(1-\frac{n}{4(1-a)^{2} t^{2} n^{\prime}}\right. & )^{-1}\left[\left(t q_{0}^{\alpha+1}\right)^{V} 2 \exp \left(-2 t^{2} b^{2} a^{2} n^{\prime 2} / N^{2}\right)\right. \\
& \left.+\sum_{q>q_{0}}\left(t q^{\alpha+1}\right)^{2 V} 2 \exp \left(-\frac{1}{4} t^{2}(q-1)^{2} a^{2} n^{\prime 2} / N^{2}\right)\right] .
\end{aligned}
$$

For sufficiently large $t$, the leading multiplicative factor outside the square brackets is bounded by 2 . The quotient $n^{\prime} / n=1-1 / m$ is bounded below by $1-2 t^{-2}$. Furthermore, the series is bounded by its $q_{0}$ th term. To see this, write it as $\sum_{q>q_{0}} \exp (-\psi(q))$ for $\psi(q)=(1 / 4) t^{2}(q-1)^{2} a^{2} n^{\prime 2} / N^{2}-$
$2 V(\alpha+1) \log q$ and apply Problem 2.14.3. Thus, for sufficiently large $t$, the last display is up to a constant bounded by

$$
\begin{aligned}
t^{V}\left(3+t^{\frac{2}{\alpha-1}}\right)^{V(\alpha+1)} & \exp \left(-2 t^{2}\left(1-t^{-2}\right)^{6}\right) \\
& +t^{2 V}\left(2+t^{2}\right)^{2 V(\alpha+1)} \exp \left(-\frac{1}{4} t^{2} t^{\frac{4}{\alpha-1}}\left(1-2 t^{-2}\right)^{4}\right)
\end{aligned}
$$

the second term being an upper bound for the $q_{0}$ th term of the series. For large $t$, the second term is certainly bounded by $e^{-2 t^{2}}$. For sufficiently large $\alpha$, the first term is bounded by a multiple of $(1 \vee t)^{3 V+\delta} e^{-2 t^{2}}$. This concludes the proof of the first theorem.

For the proof of Theorem 2.14.10, choose $\alpha$ large and

$$
\begin{array}{rlrlrl}
a & =1-t^{-2} ; & b & =1-t^{-r} ; & m & =\left\lfloor t^{2}\right\rfloor ; \\
\sqrt{m} \varepsilon_{q} & =q^{-\alpha-\beta} ; & \eta_{q} & =(q-1)^{-\alpha} ; & \beta & =\frac{W \alpha}{2-W} ; \\
2-r & =W+W r \frac{\alpha+\beta}{\alpha-1} .
\end{array}
$$

Combination of Lemma 2.14.18 and (2.14.8) with (2.14.20) and (2.14.21) yields that the probability $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ is bounded by a constant times (2.14.22)

$$
\begin{aligned}
(1- & \left.\frac{n}{4(1-a)^{2} t^{2} n^{\prime}}\right)^{-1}\left[\exp K\left(t q_{0}^{\alpha+\beta}\right)^{W} 2 \exp \left(-2 t^{2} a^{2} b^{2} n^{\prime 2} / N^{2}\right)\right. \\
& \left.+\sum_{q>q_{0}} \exp 2 K\left(t q^{\alpha+\beta}\right)^{W} 2 \exp \left(-\frac{1}{4} t^{2}(q-1)^{2 \beta} a^{2} n^{\prime 2} / N^{2}\right)\right]
\end{aligned}
$$

The multiplicative factor on the left is bounded by 2 for sufficiently large $t$. The first term inside the square brackets is bounded by

$$
2 \exp \left(K t^{W}\left(2+t^{r /(\alpha-1)}\right)^{(\alpha+\beta) W}-2 t^{2}\left(1-2 t^{-r}\right)^{6}\right)
$$

Since $2 t^{2}\left(1-2 t^{-r}\right)^{6} \geq 2 t^{2}-24 t^{2-r}$, this is further bounded by

$$
2 \exp \left(D t^{W+W r \frac{\alpha+\beta}{\alpha-1}}+24 t^{2-r}-2 t^{2}\right)
$$

The constant $r$ has been chosen so that the first two terms are both of the order $t^{2-r}$. For $\alpha \rightarrow \infty$ (and hence $\beta \rightarrow \infty$ !), the exponent $2-r$ decreases to $U$ as in the statement of the theorem.

The constant $\beta$ has been chosen so that $2 \beta=W(\alpha+\beta)$, whence the series in (2.14.22) can be written in the form $\sum_{q>q_{0}} e^{-\psi(q)}$ for a function of the form $\psi(q)=c(q-1)^{2 \beta}-d q^{2 \beta}$. For sufficiently large $t$, we have $c>d$ and $\psi$ is increasing and convex for $q \geq q_{0}$. Then Problem 2.14.3 applies and the series is bounded by its $q_{0}$ th term. This is of much lower order than $e^{-2 t^{2}}$. The second theorem is proved.

For the proofs of Theorems 2.14.16 and 2.14.17, we replace the first term of the bound (2.14.21) for (2.14.20) by a bound based on the HoeffdingBernstein inequality. On the set $C_{n}$ where $\mathbb{P}_{N}\left(f-\mathbb{P}_{N} f\right)^{2}$ is bounded by
$P(f-P f)^{2}+s$ for every $f$, the right side of (2.14.20) is bounded by

$$
\begin{equation*}
N_{q_{0}} 2 \exp \left(-\frac{n t^{2} b^{2}}{2\left(\sigma^{2}+s\right)+t b}\right)+\sum_{q>q_{0}} N_{q}^{2} \exp \left(-\frac{n t^{2} \eta_{q}^{2}}{m 4 \varepsilon_{q-1}^{2}}\right) . \tag{2.14.23}
\end{equation*}
$$

For the proof of Theorem 2.14.16, choose $\alpha$ large and

$$
\begin{array}{rlrl}
a & =1-(t / \sigma)^{-2} ; & b & =1-(t / \sigma)^{-2} ; \\
q_{0} & =2+\left\lfloor(t / \sigma)^{2 /(\alpha-1)}\right\rfloor ; \\
\sqrt{m} \varepsilon_{q} & =\sigma q^{-\alpha-1} ; & & m=\left\lfloor(t / \sigma)^{2}\right\rfloor \\
& \eta_{q} & =(q-1)^{-\alpha} ; & \sqrt{2 N} s \\
& =3 t / \sigma .
\end{array}
$$

Combination of Lemma 2.14.18 and (2.14.6) with (2.14.20) and (2.14.23) yields as upper bound for $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ a constant times

$$
\begin{aligned}
& \left(1-\frac{n \sigma^{2}}{(1-a)^{2} t^{2} n^{\prime}}\right)^{-1}\left[\left(\frac{t}{\sigma} \frac{q_{0}^{\alpha+1}}{\sigma}\right)^{V} 2 \exp \left(-\frac{t^{2} b^{2} a^{2} n^{\prime 2} / N^{2}}{2\left(\sigma^{2}+s\right)+t b a n^{\prime} / N \sqrt{n}}\right)\right. \\
& \left.\quad+\sum_{q>q_{0}}\left(\frac{t}{\sigma} \frac{q^{\alpha+1}}{\sigma}\right)^{2 V} 2 \exp \left(-\frac{1}{4} \frac{t^{2}}{\sigma^{2}}(q-1)^{2} a^{2} \frac{n^{\prime 2}}{N^{2}}\right)\right]+\mathrm{P}^{*}\left(C_{n}\right)
\end{aligned}
$$

Once again the multiplicative factor is bounded and the series is bounded by its $q_{0}$ th term. If $t$ is sufficiently large, then so is $t / \sigma \geq t, m \geq(1 / 2)(t / \sigma)^{2}$, and $s \leq 3 / \sqrt{n}$. The preceding expression is up to a constant bounded by

$$
\begin{gathered}
\left(\frac{1}{\sigma} \frac{t}{\sigma}\right)^{V}\left(2+\left(\frac{t}{\sigma}\right)^{2 /(\alpha-1)}\right)^{V(\alpha+1)} \exp \left(-\frac{1}{2} \frac{t^{2}\left(1-2 \sigma^{2} / t^{2}\right)^{6}}{\sigma^{2}+(3+t) / \sqrt{n}}\right) \\
+\frac{\exp \left(-\frac{1}{2} t^{2} / \sigma^{2}\right)}{\sigma^{2 V}}+\mathrm{P}^{*}\left(C_{n}\right)
\end{gathered}
$$

The first two terms are bounded as desired. The last term can be bounded with the help of Theorems 2.14.9 and 2.14.10. Since each $|f|$ is bounded by 1,

$$
s 1\left\{C_{n}\right\} \leq\left\|\mathbb{P}_{N}\left(f-\mathbb{P}_{N}\right)^{2}-P(f-P f)^{2}\right\|_{\mathcal{F}} \leq\left\|\mathbb{P}_{N}-P\right\|_{\mathcal{F}^{2}}+2\left\|\mathbb{P}_{N}-P\right\|_{\mathcal{F}}
$$

The covering numbers $N\left(\varepsilon, \mathcal{F}^{2}, L_{2}(Q)\right)$ of the squares are bounded by $N\left(\varepsilon / 2, \mathcal{F}, L_{2}(Q)\right)$. Thus, under (2.14.8) the probability $\mathrm{P}^{*}\left(C_{n}\right)$ is bounded by $\psi(s \sqrt{N} / 3) \exp \left(-2 N s^{2} / 9\right)$ for a function $\psi$ of the form $\psi(s)=e^{D s^{U}}$ for some $U<2$. For the present choice of $s$, this is bounded by a multiple of $\exp \left(-t^{2} /\left(2 \sigma^{2}\right)\right)$. This concludes the proof of the third theorem.

For the proof of Theorem 2.14.17, choose $\alpha$ large and

$$
\begin{aligned}
a & =1-(t / \sigma)^{-r} ; & b & =1-(t / \sigma)^{-r} ; \\
q_{0} & =2+\left\lfloor(t / \sigma)^{r /(\alpha-1)}\right\rfloor ; & \beta & =\frac{W \alpha}{2-W} ; \\
\sqrt{m} \varepsilon_{q} & =\sigma q^{-\alpha-\beta} ; & \eta_{q} & \left.=(t / \sigma)^{r}\right\rfloor ; \\
& =(q-1)^{-\alpha} ; & \sqrt{2 N} s & =3 t / \sigma .
\end{aligned}
$$

Combination of Lemma 2.14.18 and (2.14.6) with (2.14.20) and (2.14.23) yields as upper bound for $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ a constant times

$$
\begin{aligned}
& \left(1-\frac{n \sigma^{2}}{(1-a)^{2} t^{2} n^{\prime}}\right)^{-1}\left[\mathrm{P}^{*}\left(C_{n}\right)\right. \\
& +\exp K\left(\left(\frac{t}{\sigma}\right)^{r / 2}\left(\frac{q_{0}^{\alpha+\beta}}{\sigma}\right)\right)^{W} 2 \exp \left(-\frac{t^{2} b^{2} a^{2} n^{\prime 2} / N^{2}}{2\left(\sigma^{2}+s\right)+t b a n^{\prime} / N \sqrt{n}}\right) \\
& \left.+\sum_{q>q_{0}} \exp 2 K\left(\left(\frac{t}{\sigma}\right)^{r / 2}\left(\frac{q^{\alpha+\beta}}{\sigma}\right)^{W}\right) 2 \exp \left(-\frac{1}{4} \frac{t^{2}}{\sigma^{2}}(q-1)^{2 \beta} a^{2} \frac{n^{\prime 2}}{N^{2}}\right)\right]
\end{aligned}
$$

Since $(\alpha+\beta) W=2 \beta$, the series can be written in the form $\sum_{q>q_{0}} e^{-\psi(q)}$ for a function of the form $\psi(q)=c(q-1)^{2 \beta}-d q^{2 \beta}$. The constants $c$ and $d$ depend on $t$. Elementary calculations show that $\psi$ is convex and increasing for $q \geq q_{0}$ if $t^{2-W r / 2} \geq C \sigma^{2-W r / 2-W}$ for a constant $C$ depending only on $K$. This is certainly the case for large $t$ if $2-W r / 2-W \geq 0$. In that case the series can be bounded by its $q_{0}$ th term. By similar arguments as before, the preceding display can be bounded by a multiple of

$$
\begin{aligned}
& \exp \left(D\left(\frac{1}{\sigma}\right)^{W}\left(\frac{t}{\sigma}\right)^{\frac{W r}{2}+W r \frac{\alpha+\beta}{\alpha-1}}+5\left(\frac{t}{\sigma}\right)^{2-r}-\frac{\frac{1}{2} t^{2}}{\sigma^{2}+3\left((t / \sigma)^{1-r / 2}+t\right) / \sqrt{n}}\right) \\
& \quad+\exp \left(2 D\left(\frac{1}{\sigma}\right)^{W}\left(\frac{t}{\sigma}\right)^{\frac{W r}{2}+W r \frac{\alpha+\beta}{\alpha-1}}-\frac{1}{4}\left(\frac{t}{\sigma}\right)^{2+\frac{2 \beta r}{\alpha-1}}\left(1-2\left(\frac{\sigma}{t}\right)^{r}\right)^{4}\right)
\end{aligned}
$$

For $\alpha \rightarrow \infty$, the exponent

$$
\frac{W r}{2}+W r \frac{\alpha+\beta}{\alpha-1}=\frac{W r}{2}+\frac{2 W r}{2-W} \frac{\alpha}{\alpha-1}
$$

converges to $r p / 2=(1-u) p$. The upper bound is valid if $2-W r / 2-W \geq 0$, which is certainly the case if $r p / 2<2$.

### 2.14.3 Deviations from the Mean

Borell's inequality Proposition A.2.1 gives an exponential bound for probabilities of deviations from the mean for suprema of separable Gaussian processes, which is valid without conditions. This also suggests for empirical processes to split a tail bound in a bound on the mean $\mu_{n}=\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ and a bound on deviations from the mean. Entropy conditions might come in for bounding the mean, but would hopefully not play a role in bounding the probabilities of deviations from the mean.

The following theorem is valid for any class of uniformly bounded functions. The size of the class enters only through the $L_{1}$-norms $\mu_{n}= \mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$. For a Donsker class $\mathcal{F}$, the sequence $\mu_{n}$ converges to the expectation of the norm of a Brownian bridge process. For each fixed $n$, it can be bounded in terms of entropy integrals. The following theorem is even useful for classes of functions such that $\mu_{n} \rightarrow \infty$. Set $\bar{\mu}_{n}=\mu_{n} \vee n^{-1 / 2}$.
2.14.24 Theorem. There exist universal constants $C$ and $D$ such that, for every class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto[0,1]$ such that $\mathcal{F}$ and $\mathcal{F}^{2}$ are $P$-measurable,

$$
\begin{aligned}
& \mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C t\right) \\
& \quad \leq \begin{cases}D \exp -\frac{t^{2} \sqrt{n}}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}}, & \mu_{n} \leq t \leq \bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2} \\
D \exp -t \sqrt{n}\left(\log \frac{e t}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}}\right)^{1 / 2}, & t \geq \bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}\end{cases}
\end{aligned}
$$

The theorem obtains a simpler appearance by stating it directly in terms of deviations from the mean. In the following corollary, the bound is also written in a similar form as in Bernstein's inequality: of the order $\exp \left(-C t^{2} / \sigma_{\mathcal{F}}^{2}\right)$ for $t$ close to zero and $\exp (-t C \sqrt{n} / M)$ for large $t$.

The constants resulting from the proof below are not sharp. In analogy with Borell's inequality, one might conjecture that in the following theorem the constant $C=1$ would work, but at the present time this has not been established.
2.14.25 Theorem. There exist universal constants $C$ and $D$ such that, for every class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto[-M, M]$ such that $\mathcal{F}$ and $\mathcal{F}^{2}$ are $P$-measurable,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C\left(\mu_{n}+t\right)\right) \leq \exp -D\left(\frac{t^{2}}{\sigma_{\mathcal{F}}^{2}} \wedge \frac{t \sqrt{n}}{M}\right)
$$

Proofs. Without loss of generality, assume that $P f=0$ for every $f \in \mathcal{F}$. Otherwise replace $f$ by $f-P f$, which takes its values in $[-1,1]$. For $C \geq 4$ and $t \geq \mu_{n}$, the probability $\mathrm{P}\left(\left|\mathbb{G}_{n}(f)\right|<C t / 2\right)$ is at least $1 / 2$ in view of Markov's inequality, for every $f$. Let $\mathbb{G}_{n}^{o}=n^{-1 / 2} \sum_{i=1}^{n} \varepsilon_{i} f\left(X_{i}\right)$ be the symmetrized empirical process. By Lemma 2.3.7,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C t\right) \leq 4 \mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}>\frac{C t}{4}\right)
$$

The probability on the right can be further bounded by

$$
\begin{aligned}
& \mathrm{E}_{X}^{*} \mathrm{P}_{\varepsilon}\left(\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}-\mathrm{E}_{\varepsilon}\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}>\frac{C t}{8},\left\|n \mathbb{P}_{n} f^{2}\right\|_{\mathcal{F}} \leq v\right) \\
& \quad+\mathrm{P}\left(\mathrm{E}_{\varepsilon}\left\|\mathbb{G}_{n}^{o}\right\|_{\mathcal{F}}>C t / 8\right)+\mathrm{P}^{*}\left(\left\|n \mathbb{P}_{n} f^{2}\right\|_{\mathcal{F}}>v\right)
\end{aligned}
$$

The proof proceeds by application of Proposition A.3.1 to the conditional probability in the first term and Lemma A.4.3 to the second and third terms. In view of Lemma 2.3.6, the means of the variables in the second and third terms can be bounded as follows:

$$
\begin{aligned}
\mathrm{EE}_{\varepsilon}\left\|\sqrt{n} \mathbb{G}_{n}^{o}\right\|_{\mathcal{F}} & \leq 2 \sqrt{n} \mu_{n} \\
\mathrm{E}^{*}\left\|n \mathbb{P}_{n} f^{2}\right\|_{\mathcal{F}} & \leq n \sigma_{\mathcal{F}}^{2}+2 \mathrm{E}^{*}\left\|\mathbb{P}_{n}^{o} f^{2}\right\|_{\mathcal{F}} \leq n \sigma_{\mathcal{F}}^{2}+16 \sqrt{n} \mu_{n}
\end{aligned}
$$

where the last inequality follows by Proposition A.3.2 applied with $\phi_{i}(x)= x^{2} / 2$. Conclude that the left side of the theorem is bounded up to a constant by

$$
e^{\frac{-C^{2} t^{2} n}{576 v}}+e^{-\frac{C t \sqrt{n}}{16} \log \frac{C t \sqrt{n}}{192 \sqrt{n} \bar{\mu}_{n}}}+e^{-\frac{1}{2} v \log \frac{v}{192\left(n \sigma_{\mathcal{F}}^{2}+\bar{\mu}_{n} \sqrt{n}\right)}}
$$

For $0<t<n^{-1 / 2}$, the bound of the theorem is trivial for large enough $D$. For $t>n^{-1 / 2}$ in the range $\left[\mu_{n}, \bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}\right)$, choose $v= 192 e\left(n \sigma_{\mathcal{F}}^{2}+\sqrt{n} \bar{\mu}_{n}\right)$; for $t$ in the range $\left[\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}, \infty\right)$, choose $v= 192 e \sqrt{n} t / \sqrt{\log e t /\left(\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}\right)}$ to complete the proof of the first theorem.

For the proof of the second theorem, it is no loss of generality to assume that $M=1$ and that the functions $f$ take their values in the unit interval. Replace $t$ by $\bar{\mu}_{n}+t$ in the first theorem. We have

$$
\frac{\left(\bar{\mu}_{n}+t\right)^{2}}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}} \geq \frac{2 \bar{\mu}_{n} t+t^{2}}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}} \geq \frac{t^{2}}{\sqrt{n} \sigma_{\mathcal{F}}^{2}}, \quad t \leq 2 \sqrt{n} \sigma_{\mathcal{F}}^{2}
$$

Furthermore, the second branch of the inequality is always smaller than $D \exp -t \sqrt{n}$. Conclude that there exist constants $C$ and $K$ such that

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C\left(\bar{\mu}_{n}+t\right)\right) \leq K \exp -\left(\frac{t^{2}}{\sigma_{\mathcal{F}}^{2}} \wedge t \sqrt{n}\right) .
$$

We can finish the proof by "moving" the constant $K$ into the exponent and replacing $\bar{\mu}_{n}$ by $\mu_{n}$. For $t$ larger than $L\left(\sigma_{\mathcal{F}} \vee n^{-1 / 2}\right)$ for a sufficiently large constant $L$ depending on $K$, the constant $K$ can be bounded above by the expression $\exp \left[\left(t^{2} / \sigma_{\mathcal{F}}^{2} \wedge t \sqrt{n}\right) / 2\right]$. On the other hand, for $t$ smaller than $L\left(\sigma_{\mathcal{F}} \vee n^{-1 / 2}\right)$, the upper bound given on the right side of the theorem is bounded away from zero and is larger than the probability on the left side for sufficiently large $C$, because by Markov's inequality

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C\left(\bar{\mu}_{n}+t\right)\right) \leq \frac{\mu_{n}}{C\left(\bar{\mu}_{n}+t\right)} \leq \frac{1}{C}, \quad t>0
$$

This concludes the proof if $\bar{\mu}_{n}=\mu_{n}$. For $t>2 n^{-1 / 2}$, we have $\bar{\mu}_{n}+t / 2< \mu_{n}+t$, and the left side of the theorem is bounded by $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>C\left(\bar{\mu}_{n}+\right.\right. t / 2)$ ), to which we can apply the bound as obtained previously. For $t \leq 2 n^{-1 / 2}$, the right side of the theorem is bounded away from zero and we can apply the same argument as before.

The following corollary is an example of how the preceding theorems can be applied. It can be regarded as a uniform version of Kiefer's inequality for a binomial variable, Corollary A.6.3. It will be one of the key tools used in the proof of Theorem 2.14.13. Set $\mu_{n}=\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ and $\bar{\mu}_{n}=\mu_{n} \vee n^{-1 / 2}$.
2.14.26 Lemma (Uniform small variance exponential bound). There exist universal constants $D, K_{0}$, and $\sigma_{0}$ such that, for every class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto[0,1]$ with $\sigma_{\mathcal{F}}^{2} \leq \sigma_{0}^{2}$ and $K_{0} \bar{\mu}_{n} \leq \sqrt{n}$ and such that $\mathcal{F}$ and $\mathcal{F}^{2}$ are $P$-measurable,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right) \leq D \exp \left(-11 t^{2}\right), \quad \text { for every } t \geq K_{0} \bar{\mu}_{n} .
$$

Proof. Since $|f(x)-P f| \leq 1$ for all $x$, the probability on the left side of the above display is zero for all $t \geq \sqrt{n}$. Hence any nonnegative bound will be trivially true for $t>\sqrt{n}$, and we may restrict attention to $t \leq \sqrt{n}$.

For $\sigma_{\mathcal{F}}^{2} \leq \sigma_{0}^{2}$ and $K_{0} \bar{\mu}_{n} \leq \sqrt{n}$, we have

$$
\frac{t^{2} \sqrt{n}}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}} \geq \frac{t^{2}}{K_{0}^{-1}+\sigma_{0}^{2}}
$$

This shows that the first expression on the right in Theorem 2.14.24 is bounded by $\exp -11 C^{2} t^{2}$ for every $t$ if $K_{0}^{-1}+\sigma_{0}^{2}$ is chosen sufficiently small. To bound the second expression, fix $\varepsilon>0$. For $\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2} \leq t \leq \varepsilon \sqrt{n}$, we have

$$
t \sqrt{n}\left(\log \frac{e t}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}}\right)^{1 / 2} \geq \frac{t^{2}}{\varepsilon}(\log e)^{1 / 2},
$$

while for $\varepsilon \sqrt{n} \leq t \leq \sqrt{n}, K_{0} \bar{\mu}_{n} \leq \sqrt{n}$, and $\sigma_{\mathcal{F}}^{2} \leq \sigma_{0}^{2}$,

$$
t \sqrt{n}\left(\log \frac{e t}{\bar{\mu}_{n}+\sqrt{n} \sigma_{\mathcal{F}}^{2}}\right)^{1 / 2} \geq t^{2}\left(\log \frac{e \varepsilon}{K_{0}^{-1}+\sigma_{0}^{2}}\right)^{1 / 2} .
$$

Choose sufficiently small $\varepsilon$ and next sufficiently small $K_{0}^{-1}+\sigma_{0}^{2}$ to bound the right-hand sides of the last two displays by $11 C^{2} t^{2}$. Finally, also choose $K_{0} \geq C$ to ensure that the present $t \geq K_{0} \bar{\mu}_{n}$ is in the range of $t$ that is permitted in Theorem 2.14.24.

### 2.14.4 Proof of Theorem 2.14.13

A first step in the direction of the proof of Theorem 2.14.13 is the following "basic inequality," which controls the supremum of the empirical process $\mathbb{G}_{n}$ over any class $\mathcal{C}$ containing a set $C_{0}$ with $\sigma_{0}^{2} \leq \mathrm{P}\left(C_{0}\right) \leq 1-\sigma_{0}^{2}$ for the constant $\sigma_{0}^{2}$ in Lemma 2.14.26.
2.14.27 Theorem. Let $\mathcal{C}$ be a separable class of measurable subsets of $\mathcal{X}$. Suppose that $C_{0} \in \mathcal{C}$ has $\sigma_{0}^{2} \leq P\left(C_{0}\right) \leq 1-\sigma_{0}^{2}$ where $\sigma_{0}^{2}$ is the constant determined in Lemma 2.14.26. Let $\mu_{n}^{0}=\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{C} \triangle C_{0}}, \bar{\mu}_{n}^{0}=\mu_{n}^{0} \vee n^{-1 / 2}$, and $a=\sup _{C \in \mathcal{C}} P\left(C \triangle C_{0}\right)$. Then, for $t \geq 4 / \sigma_{0}^{2}$,

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) \leq \frac{K}{t} e^{-2 t^{2}} \exp \left(K a t^{2}+K \bar{\mu}_{n}^{0} t-\frac{t^{4}}{4 n}\right) .
$$

To prove this theorem, define variables $W_{1}, W_{2}$, and $W=W_{1}+W_{2}$ through

$$
\begin{aligned}
& W_{1}=n \mathbb{P}_{n}\left(C_{0}\right)\left\|\frac{\mathbb{P}_{n}\left(C_{0}-C\right)}{\mathbb{P}_{n}\left(C_{0}\right)}-\frac{P\left(C_{0}-C\right)}{P\left(C_{0}\right)}\right\|_{\mathcal{C}}, \\
& W_{2}=n \mathbb{P}_{n}\left(C_{0}^{c}\right)\left\|\frac{\mathbb{P}_{n}\left(C-C_{0}\right)}{\mathbb{P}_{n}\left(C_{0}^{c}\right)}-\frac{P\left(C-C_{0}\right)}{P\left(C_{0}^{c}\right)}\right\|_{\mathcal{C}} .
\end{aligned}
$$

Also, define a collection of functions by

$$
\varphi_{r}(t)=\frac{t^{2}}{r} 1\{t \leq r\}+t\left(\log \left(\frac{e t}{r}\right)\right)^{1 / 2} 1\{t \geq r\} .
$$

Theorem 2.14.24 can be reformulated in terms of these functions and asserts that there exist universal constants $C, D$ such that with $S=\sqrt{n} \bar{\mu}_{n}+n \sigma_{\mathcal{F}}^{2}$

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right) \leq D \exp -\varphi_{S}\left(\frac{t \sqrt{n}}{C}\right), \quad t \geq C \mu_{n}
$$

2.14.28 Lemma. With the notation of Theorem 2.14.27, $S=n a+\sqrt{n} \bar{\mu}_{n}^{0}$, $h(u)=2 u^{2}+(1 / 4) u^{4}$, and $\varphi(w)=\varphi_{S}(w / C) 1\left\{w \geq C \sqrt{n} \mu_{n}\right\}$,

$$
n\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{C}} \leq n\left|\mathbb{P}_{n}\left(C_{0}\right)-P\left(C_{0}\right)\right|\left(1+\frac{2 a}{\sigma_{0}^{2}}\right)+W \equiv n U\left(1+\frac{2 a}{\sigma_{0}^{2}}\right)+W,
$$

where for all $w \geq 0, u>t>0$,

$$
\mathrm{P}^{*}(U \geq t, W \geq w) \leq \frac{K}{\sqrt{n} u} \exp (-n h(u)-\varphi(w)+5 n u(u-t))
$$

Proof. For any set $C \in \mathcal{C}$, we can decompose

$$
\mathbb{P}_{n}(C)=\mathbb{P}_{n}\left(C_{0}\right)+\mathbb{P}_{n}\left(C-C_{0}\right)-\mathbb{P}_{n}\left(C_{0}-C\right),
$$

and similarly with $\mathbb{P}_{n}$ replaced by $P$. Consequently, the difference $\mid \mathbb{P}_{n}(C)- P(C) \mid$ can be bounded by a sum of three terms. The first term directly yields a term that involves $U$. The second term can be bounded by

$$
\left|\mathbb{P}_{n}\left(C_{0}^{c}\right)\right|\left|\frac{\mathbb{P}_{n}\left(C-C_{0}\right)}{\mathbb{P}_{n}\left(C_{0}^{c}\right)}-\frac{P\left(C-C_{0}\right)}{P\left(C_{0}^{c}\right)}\right|+\left|\mathbb{P}_{n}\left(C_{0}^{c}\right)\right|\left|\frac{P\left(C-C_{0}\right)}{P\left(C_{0}^{c}\right)}-\frac{P\left(C-C_{0}\right)}{\mathbb{P}_{n}\left(C_{0}^{c}\right)}\right|
$$

This is bounded by $1 / n$ times $W_{2}+U a / \sigma_{0}^{2}$. The third term can be handled similarly.

Now consider the exponential bound. Since $n U$ is distributed as the absolute deviation from the mean of a binomial $\left(n, P\left(C_{0}\right)\right)$ variable, Talagrand's inequality for the binomial tail (Proposition A.6.4) yields

$$
\mathrm{P}(U \geq t) \leq \frac{2 K}{\sqrt{n} u} \exp (-n h(u)) \exp 5 n u(u-t)
$$

For $I \subset\{1, \ldots, n\}$, let $\Omega_{I}$ be the set such that $X_{i} \in C_{0}$ for $i \in I$ and $X_{i} \notin C_{0}$ otherwise. Define $P_{1}$ on $\Omega_{I}$ by $P_{1}(A)=P\left(A \cap C_{0}\right) / P\left(C_{0}\right)$. Then for
$\# I=k$, conditionally on $\Omega_{I}, W_{1}$ has the same distribution as $\sqrt{k}\left\|\mathbb{G}_{k}^{Y}\right\|_{\mathcal{C}_{1}}$ where $Y_{1}, \ldots, Y_{k}$ are i.i.d. $P_{1}$ and $\mathcal{C}_{1}=\left\{C_{0}-C: C \in \mathcal{C}\right\}$. Similarly, if we define $P_{2}$ on $\Omega_{I}$ by $P_{2}(A)=P\left(A \cap C_{0}^{c}\right) / P\left(C_{0}^{c}\right)$, then conditionally on $\Omega_{I}$, $W_{2}$ has the same distribution as $\sqrt{n-k}\left\|\mathbb{G}_{n-k}^{Z}\right\|_{\mathcal{C}_{2}}$, where $Z_{1}, \ldots, Z_{n-k}$ are i.i.d. $P_{2}$ and $\mathcal{C}_{2}=\left\{C-C_{0}: C \in \mathcal{C}\right\}$. Also, note that for any class $\mathcal{F}$ of functions,

$$
\sqrt{k} \mathrm{E}^{*}\left\|\mathbb{G}_{k}^{Y}\right\|_{\mathcal{F}} \leq K \sqrt{n} \mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}
$$

for an absolute constant $K$ (Problem 2.14.6). A similar inequality is valid for $\sqrt{n-k} \mathrm{E}^{*}\left\|\mathbb{G}_{n-k}^{Z}\right\|_{\mathcal{F}}$. By Theorem 2.14.24 applied twice conditionally on $\Omega_{I}$, for $w \geq 2 C K \sqrt{n} \mu_{n}^{0}$,

$$
\mathrm{P}^{*}\left(W \geq w \mid \Omega_{I}\right) \leq 2 D \exp -\varphi_{S^{\prime}}\left(\frac{w}{2 C}\right) \leq 2 D \exp -\varphi_{S}\left(\frac{w}{K}\right),
$$

with

$$
\begin{aligned}
S^{\prime}= & {\left[\sqrt{k} \mathrm{E}^{*}\left\|\mathbb{G}_{k}^{Y}\right\|_{\mathcal{C}_{1}} \vee 1+k\left\|P_{1}\left(f-P_{1} f\right)^{2}\right\|_{\mathcal{C}_{1}}\right] } \\
& \vee\left[\sqrt{n-k} \mathrm{E}^{*}\left\|\mathbb{G}_{n-k}^{Z}\right\|_{\mathcal{C}_{2}} \vee 1+(n-k)\left\|P_{2}\left(f-P_{2} f\right)^{2}\right\|_{\mathcal{C}_{2}}\right] \\
\leq & K \sqrt{n} \bar{\mu}_{n}^{0}+n \frac{a}{\sigma_{0}^{2}} \\
\leq & K^{\prime}\left(n a+\sqrt{n} \bar{\mu}_{n}^{0}\right) \equiv K^{\prime} S
\end{aligned}
$$

Therefore, it follows that, for $u>t>0$ and $w>0$,

$$
\begin{aligned}
\mathrm{P}^{*}(U \geq t, W \geq w) & \left.=\mathrm{E}^{*}\left[\sum_{I} 1\left\{\Omega_{I}\right\} 1 U \geq t\right\} \mathrm{P}^{*}\left(W \geq w \mid \Omega_{I}\right)\right] \\
& \leq 2 D \exp -\varphi_{S}(w / K) \mathrm{P}(U \geq t) \\
& \leq \frac{2 D K}{\sqrt{n} u} \exp (-n h(u)-\varphi(w)+5 n u(u-t)) .
\end{aligned}
$$

This concludes the proof. $\square$

Proof of Theorem 2.14.27. Consider the function $\varphi$ defined in Lemma 2.14.28 and note that $\varphi(t) / t$ increases. Define $u$ by

$$
u\left(1+2 \frac{a}{\sigma_{0}^{2}}\right)=\frac{t}{\sqrt{n}}
$$

Then $u \leq 1$ since $t \leq \sqrt{n}$ yields

$$
u=\frac{t / \sqrt{n}}{1+2 a / \sigma_{0}^{2}} \leq \frac{1}{1+2 a / \sigma_{0}^{2}} \leq 1
$$

Let $d \geq 1 / u$ be the smallest number satisfying $\varphi(d) / d \geq 11 u$. Suppose that $n U\left(1+2 a / \sigma_{0}^{2}\right)+W \geq t \sqrt{n}$. Let $l \geq 0$ be the smallest integer such that

$$
n U\left(1+2 a / \sigma_{0}^{2}\right) \geq t \sqrt{n}-(l+1) d .
$$

Then if $l>0$,

$$
n U\left(1+2 a / \sigma_{0}^{2}\right) \leq t \sqrt{n}-l d
$$

so $W \geq l d$. Thus, since $W \geq 0$, we can find $l \geq 0$ such that

$$
W \geq l d \quad \text { and } \quad U \geq u-\frac{(l+1) d}{n}
$$

In other words,

$$
\left\{n U\left(1+\frac{2 a}{\sigma_{0}^{2}}\right)+W \geq t \sqrt{n}\right\} \subset \bigcup_{l=1}^{\infty}\left\{W \geq l d, U \geq u-\frac{(l+1) d}{n}\right\}
$$

By Lemma 2.14.28, this implies that

$$
\begin{aligned}
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) & \leq \sum_{l=0}^{\infty} \mathrm{P}\left(U \geq u-\frac{(l+1) d}{n}, W \geq l d\right) \\
& \leq \frac{K}{\sqrt{n} u} \sum_{l=0}^{\infty} \exp \left(-n h(u)-\varphi(l d)+5 n u(l+1) \frac{d}{n}\right) \\
& =\frac{K}{\sqrt{n} u} \exp (-n h(u)) \sum_{l=0}^{\infty} \exp (5 u(l+1) d-\varphi(l d))
\end{aligned}
$$

For $l \geq 1$,

$$
\varphi(l d) \geq l \varphi(d) \geq l \cdot 11 u d \geq 5 u(l+1) d+l u d
$$

Hence $5 u(l+1) d-\varphi(l d) \leq-l u d \leq-l$ and

$$
\sum_{l=1}^{\infty} e^{5 u(l+1) d-\varphi(l d)} \leq \sum_{l=1}^{\infty} e^{-l} \equiv K
$$

Thus

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) \leq \frac{K}{\sqrt{n} u} e^{-n h(u)} e^{5 u d}
$$

It remains to bound $u d$ and $u$ in terms of $t$.
By Problem 2.14.5 with $t=K(C) u \sqrt{S}$, it follows that $d \leq d_{0} \equiv K(C) u S$. Since $d \geq 1 / u$ and $d \geq C \sqrt{n} \mu_{n}^{0}$, we deduce that that $d \leq \max \left\{1 / u, C \sqrt{n} \mu_{n}^{0}, K(C) u S\right\}$, or

$$
u d \leq \max \left\{1, C \sqrt{n} \mu_{n}^{0} u, K(C) u^{2} S\right\}
$$

Hence, using $t / \sqrt{n} \leq 1$,

$$
u d \leq K\left\{1+\mu_{n}^{0} t+n^{-1} t^{2} S\right\} \leq \tilde{K}\left\{1+\bar{\mu}_{n}^{0} t+a t^{2}\right\}
$$

Finally, we bound $h(u)$. By convexity of $h$, we have $h^{\prime}(u) \leq 5 u$ and

$$
\frac{t}{\sqrt{n}}-u=\frac{t}{\sqrt{n}}\left(1-\frac{1}{1+2 a / \sigma_{0}^{2}}\right)
$$

It follows that

$$
\begin{aligned}
h(u) & \geq h\left(\frac{t}{\sqrt{n}}\right)+\left(u-\frac{t}{\sqrt{n}}\right) h^{\prime}\left(\frac{t}{\sqrt{n}}\right) \\
& \geq h\left(\frac{t}{\sqrt{n}}\right)-5 \frac{t}{\sqrt{n}}\left(\frac{t}{\sqrt{n}}-u\right) \\
& =h\left(\frac{t}{\sqrt{n}}\right)-5 \frac{t^{2}}{n} \frac{2 a / \sigma_{0}^{2}}{1+2 a / \sigma_{0}^{2}} .
\end{aligned}
$$

Putting this together yields the claimed inequality. $\square$

We are now ready to start the proof of Theorem 2.14.13. We first decompose $\mathcal{C}$ as $\mathcal{C}=\mathcal{C}_{0} \cup \mathcal{C}_{1}$, where

$$
\mathcal{C}_{0}=\left\{C \in \mathcal{C}: P(C) \leq \sigma_{0}^{2} \text { or } P(C) \geq 1-\sigma_{0}^{2}\right\}
$$

and $\mathcal{C}_{1}=\mathcal{C}-\mathcal{C}_{0}$. Then $\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}=\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{0}} \vee\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{1}}$ so that

$$
\begin{equation*}
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) \leq \mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{0}}>t\right)+\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{1}}>t\right) . \tag{2.14.29}
\end{equation*}
$$

The first term is bounded by $C t^{-1} e^{-2 t^{2}}$ for $t \geq \tilde{K} \sqrt{V \log K}$ by Lemma 2.14.26 (cf. Problem 2.14.9). Thus, it suffices to bound the second term in (2.14.29), where $\sigma_{0}^{2} \leq P(C) \leq 1-\sigma_{0}^{2}$ for all $C \in \mathcal{C}_{1}$. Without loss of generality, we may assume that these inequalities hold for all $C \in \mathcal{C}$, and relabel $\mathcal{C}_{1}$ as $\mathcal{C}$.

To prove the desired inequality for the supremum over $\mathcal{C}_{1}$, we partition and then apply Theorem 2.14.27. The strategy is to decompose $\mathcal{C}_{1}$ into pieces $\mathcal{D}_{j}, j=1, \ldots, M$, satisfying

$$
a_{j} \equiv \sup _{C \in \mathcal{D}_{j}} P(C) \leq a \equiv \frac{V}{t^{2}} .
$$

Next, Theorem 2.14.27 is applied to each $\mathcal{D}_{j}$ separately. The main work is to further bound

$$
\begin{equation*}
\mu_{n} \equiv \max _{1 \leq j \leq M} \mu_{n j}^{0}, \tag{2.14.30}
\end{equation*}
$$

where

$$
\begin{equation*}
\mu_{n j}^{0} \equiv \mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{D}_{j} \Delta D_{j}}, \quad j=1, \ldots, M . \tag{2.14.31}
\end{equation*}
$$

Here $D_{j}$ is an arbitrary fixed element of $\mathcal{D}_{j}$ for each $j \leq M$. To bound $\mu_{n}$, we will use the following partitioning lemma.
2.14.32 Lemma (Partitioning). Let ( $T, \rho$ ) be a metric space, and let $p, q$ be nonnegative integers with $p<q$. Consider a partition $\mathcal{P}_{q}$ of $T$ such that each set of $\mathcal{P}_{q}$ has diameter $\leq 4^{-q}$, and suppose that $k_{l}, p \leq l \leq q$, are given positive integers. Then there is an increasing sequence $\left\{\mathcal{P}_{l}\right\}_{p \leq l \leq q}$ of partitions of $T$ with the following properties:
(i) each set of $\mathcal{P}_{l}$ has diameter less than or equal to $4^{-l+1}$;
(ii) each atom of $\mathcal{P}_{l}$ contains at most $k_{l}$ atoms of $\mathcal{P}_{l+1}$;
(iii) for all $l<q, \# \mathcal{P}_{l} \leq N\left(4^{-l}, T, \rho\right)+\# \mathcal{P}_{l+1} / k_{l}$;
(iv) for $m \geq l$ and $T_{i} \in \mathcal{P}_{l}, N\left(4^{-m}, T_{i}, \rho\right) \leq \prod_{j=l+1}^{m} k_{j}$.

If $N\left(4^{-l}, T, \rho\right) \leq\left(K 4^{l}\right)^{V}$ for $l \geq p, \# \mathcal{P}_{q} \leq\left(K 4^{l}\right)^{V}$, and if $k_{l} \geq 2 \cdot 4^{V}$ for all $l$, then

$$
\# \mathcal{P}_{l} \leq 2\left(K 4^{l}\right)^{V} \quad \text { for } \quad p \leq l \leq q .
$$

Proof. The construction proceeds by decreasing induction on $l$. Given $\mathcal{P}_{l+1}$, we will construct $\mathcal{P}_{l}$.

Set $N=N\left(4^{-l}, T, \rho\right)$. Consider points $\left\{t_{i}\right\}_{1 \leq i \leq N}$ of $T$ so that each point of $T$ is within $\rho$-distance $4^{-l}$ of at least one $t_{i}, i=1, \ldots, N$. Define

$$
A_{i}=\cup\left\{T_{l+1, j}: T_{l+1, j} \cap B\left(t_{i}, 4^{-l}\right) \neq \emptyset, T_{l+1, j} \in \mathcal{P}_{l+1}\right\} .
$$

Since each set $T_{l+1, j}$ has diameter $\leq 4^{-l}, A_{i}$ has diameter at most $2 \cdot 4^{-l}+ 2 \cdot 4^{-l}=4^{-l+1}$. Now disjointify the sets $\left\{A_{i}\right\}$ by defining $C_{i}=A_{i}-\cup_{j<i} A_{j}$ for every $i=1, \ldots, N$. The collection $\left\{C_{i}\right\}$ forms a partition $\mathcal{Q}$ of $T$ that is coarser than $\mathcal{P}_{l+1}$. Certain elements of $\mathcal{Q}$ might contain more than $\kappa_{l}$ elements of $\mathcal{P}_{l+1}$; partition any such element of $\mathcal{Q}$ into sets all of which except one contain exactly $k_{l}$ elements of $\mathcal{P}_{l+1}$ and one being the union of at most $k_{l}$ sets of $\mathcal{P}_{l+1}$. This constructs $\mathcal{P}_{l}$ satisfying (i) and (ii); (iii) follows easily from the construction.

To prove the last assertion, note that by (iii) and the hypotheses we have

$$
\# \mathcal{P}_{l} \leq\left(K 4^{l}\right)^{V}+\frac{\# \mathcal{P}_{l+1}}{2 \cdot 4^{V}}
$$

Induction then yields the claim.
Now we return to the proof of Theorem 2.14.13. Given $a=V / t^{2}$, let $p$ be the smallest integer such that $4^{-p+1} \leq a$. Let $q \geq p$; the value of $q$ will be determined later in the proof. The partitions $\{\mathcal{P}\}_{l=p}^{q}$ of $T=\mathcal{C}_{1}$ given by Lemma 2.14 .32 will be constructed with $k_{l}=\left\lfloor 3 \cdot 4^{V}\right\rfloor \geq 2 \cdot 4^{V}$. Thus

$$
M=\# \mathcal{P}_{p} \leq 2\left(\frac{K t^{2}}{V}\right)^{V}
$$

Consider the atoms $\left\{\mathcal{D}_{j}\right\}_{j=1}^{M}$ of $\mathcal{P}_{p}$. To bound $\mu_{n}$, we first show that if $3(q-p) V \leq n 4^{-q}$, then

$$
\begin{align*}
\mu_{n} \leq \tilde{K} & {\left[\sqrt{V}\left(\sqrt{4^{-p}}+\sqrt{q 4^{-q}}+\sqrt{4^{-q} \log K}\right)\right.} \\
& \left.+n^{-1 / 2}(q V+V \log K)\right] \tag{2.14.33}
\end{align*}
$$

To prove (2.14.33), first recall (2.14.30) and (2.14.31). By a chaining argument based on the partitions $\mathcal{P}_{l}$, we find that

$$
\begin{equation*}
\mu_{n j}^{0} \leq \sum_{p<l \leq q} \mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{l}}+\mathrm{E}^{*} \sup _{1 \leq k \leq m}\left\|\mathbb{G}_{n}\right\|_{\mathcal{G}_{k}} \tag{2.14.34}
\end{equation*}
$$

Here each $f \in \mathcal{F}_{l}$ is of the form $1_{C}-1_{C^{\prime}}$ where $P\left(C \triangle C^{\prime}\right) \leq 4^{-l+1}=a_{l}$ and $\# \mathcal{F}_{l} \leq\left(3 \cdot 4^{V}\right)^{l-p}$. Moreover, for some fixed sets $C_{1}, \ldots, C_{k}$ in $\mathcal{C}_{1}$,

$$
\begin{aligned}
& \mathcal{C}_{k}=\left\{C \in \mathcal{C}_{1}: P\left(C \Delta C_{k}\right) \leq 4^{-q+1}\right\}, \\
& \mathcal{G}_{k}=\left\{1_{C}-1_{C_{k}}: C \in \mathcal{C}_{k}\right\}, \quad k=1, \ldots, m,
\end{aligned}
$$

and $m \leq\left(3 \cdot 4^{V}\right)^{q-p}$. To bound the terms involving a supremum over $\mathcal{F}_{l}$, we use Theorem 2.14.24 (in the form given in the proof of Lemma 2.14.26; or even Bernstein's inequality) to show that for $f \in \mathcal{F}_{l}$,

$$
\mathrm{P}\left(\left|\sqrt{n} \mathbb{G}_{n}\right| \geq t\right) \leq \exp -\varphi_{S}(t / C) \quad \text { for } \quad t \geq D
$$

with $C$ as in Theorem 2.14.24, $D \leq K \sqrt{n a_{l}}$, and $S \leq n a_{l}+\sqrt{n a_{l}}$. Since $V \geq 1$, we have $\log \# \mathcal{F}_{l} \leq 3(l-p) V$. Hence if

$$
\log \# \mathcal{F}_{l} \leq 3(l-p) V \leq n a_{l} \leq n a_{l}+\sqrt{n a_{l}} \equiv S
$$

and $n a_{l} \geq 1$ (so that $\sqrt{n a_{l}} \leq n a_{l}$ ), then we have (see Exercise 2.14.10)

$$
\begin{align*}
\mathrm{E}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}_{l}} & \leq K\left(\sqrt{n a_{l}}+\sqrt{n a_{l}} \sqrt{\log \# \mathcal{F}_{l}}\right)  \tag{2.14.35}\\
& \leq K \sqrt{n a_{l}} \sqrt{(l-p) V} .
\end{align*}
$$

Hence the contribution of the first term of (2.14.34) is bounded by a constant times $\sqrt{V} \sum_{l \geq p+1} 2^{-l} \sqrt{l-p} \leq K \sqrt{V 4^{-p}}$.

To bound the term involving suprema over $\mathcal{G}_{k}$, let $a_{q}=4^{-q+1}$, and note that

$$
\left\|\sum_{i=1}^{n} \varepsilon_{i}\left(1_{C}\left(X_{i}\right)-1_{C_{k}}\left(X_{i}\right)\right)\right\|_{\mathcal{C}_{k}} \sim\left\|\sum_{i=1}^{n} \varepsilon_{i} 1_{C \Delta C_{k}}\left(X_{i}\right)\right\|_{\mathcal{C}_{k}} .
$$

Hence by Lemma 2.3.6, Theorem 2.14.24, and Problem 2.14.8, the variables

$$
Z_{k}=\left\|\sum_{i=1}^{n}\left(1_{C}-1_{C_{k}}\right)\left(X_{i}\right)-n\left(P(C)-P\left(C_{k}\right)\right)\right\|_{\mathcal{C}_{k}}
$$

satisfy the bound of Problem 2.14.10 with $C$ as in Theorem 2.14.24, $r= n a_{q}+D$, and

$$
D=K \sqrt{n V}\left[\left(a_{q}+\frac{V}{n} \log \frac{K}{a_{q}}\right) \log \frac{K}{a_{q}}\right]^{1 / 2} .
$$

Thus, by Exercise 2.14.10, it follows that

$$
\begin{aligned}
\mathrm{E}^{*} \sup _{1 \leq k \leq m}\left\|\mathbb{G}_{n}\right\|_{\mathcal{G}_{k}} & \leq \frac{K}{\sqrt{n}}\left[D+C \sqrt{\left(n a_{q}+D\right)(q-p) V}\right] \\
& \leq K\left[\frac{D}{\sqrt{n}}+\sqrt{V(q-p) \frac{D}{\sqrt{n}}}+\sqrt{V(q-p) a_{q}}\right]
\end{aligned}
$$

provided that $3(q-p) V \leq n a_{q}+D$. Since $a_{q} \leq 4 \cdot 4^{p-q}$, we have $\log \left(K / a_{q}\right) \geq (q-p) / K_{0}$, and hence

$$
V(q-p) \vee \sqrt{V(q-p) a_{q}} \leq K_{1} \frac{D}{\sqrt{n}}
$$

Therefore, it follows that

$$
\begin{align*}
\mathrm{E}^{*} \sup _{1 \leq k \leq m}\left\|\mathbb{G}_{n}\right\|_{\mathcal{G}_{k}} \leq & K_{2} \frac{D}{\sqrt{n}} \\
\leq & K_{3}\left[\sqrt{V q 4^{-q}}+\sqrt{V 4^{-q} \log K}\right.  \tag{2.14.36}\\
& \left.+n^{-1 / 2}(V q+V \log K)\right]
\end{align*}
$$

Combining the inequalities (2.14.35) and (2.14.36) with (2.14.34) completes the proof of (2.14.33).

Now we need to choose $q \geq p$ so that

$$
\begin{equation*}
3(q-p) \leq n 4^{-q} \tag{2.14.37}
\end{equation*}
$$

and also bound the sum of the second and third terms in the exponential in the conclusion of Theorem 2.14.27. Namely, after using (2.14.33) and $4^{-p} \leq V / t^{2}$, we need to bound

$$
Q=\tilde{K} t\left[\sqrt{V q 4^{-q}}+\sqrt{V 4^{-q} \log K}+n^{-1 / 2}(V q+V \log K)\right]-\frac{t^{4}}{4 n}
$$

To do this, let $q$ be the largest integer so that (2.14.37) holds. Then

$$
3(q-p) 4^{q-p} \leq \frac{n}{V} 4^{-p} \leq \frac{n}{V} \frac{V}{t^{2}}=\frac{n}{t^{2}}
$$

and hence $q-p \leq K_{4} \log \left(K_{4} n / t^{2}\right)$ for some constant $K_{4}$. Furthermore, by the definition of $q$,

$$
n 4^{-q-1} \leq 3(q+1-p) V \leq 3 q V
$$

and hence, using $\sqrt{q \log K} \leq 2(q+\log K)$, it follows that

$$
\begin{aligned}
Q & \leq \tilde{K} \frac{t}{\sqrt{n}}\left[2 V q+\sqrt{3 V^{2} q \log K}+V \log K\right]-\frac{t^{4}}{4 n} \\
& \leq K_{5} \frac{t V}{\sqrt{n}}[q+\log K]-\frac{t^{4}}{4 n} \\
& =K_{5} \frac{t V}{\sqrt{n}} q-\frac{t^{4}}{8 n}+K_{5} \frac{t V}{\sqrt{n}} \log K-\frac{t^{4}}{8 n} \\
& \equiv Q_{1}+Q_{2}
\end{aligned}
$$

But from the definition of $p$ it follows that $4^{-(p-1)+1} \geq V / t^{2}$ and hence $4^{-p} \geq V / 16 t^{2}$ or $p \leq K_{6} \log \left(16 t^{2} / V\right)$. Then, by writing $q=p+(q-p)$, it follows that, for $t \geq \tilde{K} \sqrt{V \log K}$, we have

$$
q \leq K_{6} \log \left(\frac{16 t^{2}}{V}\right)+K_{4} \log \left(\frac{K_{4} n}{t^{2}}\right) \leq K_{7} \log \left(\frac{K_{7} n}{V}\right)
$$

and this yields

$$
\begin{aligned}
Q_{1} & \leq K_{8} \frac{t V}{\sqrt{n}} \log \left(\frac{K_{7} n}{V}\right)-\frac{t^{4}}{8 n} \leq \sup _{0 \leq t \leq \sqrt{n}} K_{8} \frac{t V}{\sqrt{n}} \log \left(\frac{K_{7} n}{V}\right)-\frac{t^{4}}{8 n} \\
& \leq K_{9} V .
\end{aligned}
$$

Furthermore, if $t \leq \sqrt{n} / \log K$, then $Q_{2} \leq K_{5} V$, while

$$
\sup _{n \geq 1} Q_{2} \leq K_{10} \frac{V^{2}}{t^{2}}(\log K)^{2}
$$

so that $Q \leq K_{11} V$ if $t \leq \sqrt{n} / \log K$, and

$$
Q \leq K_{12}\left[V+\frac{V^{2}}{t^{2}}(\log K)^{2}\right]
$$

in any case. Thus, it follows from Theorem 2.14.27 and our choices for $a$, $p$, and $q$ that

$$
\begin{aligned}
\mathrm{P}^{*} & \left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}_{1}} \geq t\right) \leq \mathrm{P}^{*}\left(\max _{1 \leq j \leq M}\left\|\mathbb{G}_{n}\right\|_{\mathcal{D}_{j}} \geq t\right) \\
& \leq \sum_{j=1}^{M} \mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{D}_{j}} \geq t\right) \\
& \leq M \frac{K}{t} e^{-2 t^{2}} \exp \left(K a t^{2}+K \mu_{n} t-\frac{t^{4}}{4 n}\right) \\
& \leq 2\left(\frac{K t^{2}}{V}\right)^{V} \frac{K}{t} e^{-2 t^{2}} \exp \left(K V+K_{12} V+K_{12} \frac{V^{2}}{t^{2}}(\log K)^{2}\right) \\
& \leq K_{13}\left(\frac{K t^{2}}{V}\right)^{V} \frac{1}{t} e^{-2 t^{2}} \exp \left(3 K_{14} V\right) \\
& \leq \frac{D}{t}\left(\frac{D K t^{2}}{V}\right)^{V} e^{-2 t^{2}}
\end{aligned}
$$

if $t \geq \sqrt{V} \log K$ or $n \geq t^{2}(\log K)^{2}$. Choosing $D=D(K)$ so large that the last bound $\geq 1$ for $t \leq \sqrt{V} \log K$ and combining with (2.14.29) completes the proof of Theorem 2.14.13 when (2.14.11) holds.

## Problems and Complements

1. (Alternative definition of $\|\cdot\|_{\psi_{p}}$ for small $p$ ) For $0<p<1$, define

$$
\psi_{p}(x)=e^{-c_{p}^{p}}\left(e^{x^{p}}-1\right) ; \quad \tilde{\psi}_{p}(x)=\left(\psi_{p}(x)-\psi_{p}\left(c_{p}\right)\right) 1\left\{x \geq c_{p}\right\}
$$

Then $\tilde{\psi}_{p}$ is convex and there exists a constant $C_{p}$ such that $\|X\|_{\tilde{\psi}_{p}} \leq \|X\|_{\psi_{p}} \leq C_{p}\|X\|_{\tilde{\psi}_{p}}$. Thus $\|X\|_{\tilde{\psi}_{p}}$ defines a true Orlicz norm and can be used interchangeably with $\|X\|_{\psi_{p}}$ up to constants. A bound on the latter pseudonorm leads to the tail bound

$$
\mathrm{P}(|X|>t) \leq\left(1+e^{c_{p}^{p}}\right) e^{-t^{p} /\|X\|_{\psi_{p}}^{p}}
$$

[Hint: Note that $\tilde{\psi}_{p} \leq \psi_{p} \leq \tilde{\psi}_{p}+\psi_{p}\left(c_{p}\right)$. Also $\mathrm{E} \tilde{\psi}_{p}(Y / C) \leq \mathrm{E} \tilde{\psi}_{p}(Y) / C$ for every $C>1$ and $Y$ by the convexity of $\psi_{p}$.]
2. (Hoeffding's inequality) If the random variable $X$ has zero mean and takes its values in the interval $[u, v]$, then $\mathrm{E} \exp (s X) \leq \exp \left(s^{2}(v-u)^{2} / 8\right)$ for every $s \in \mathbb{R}$.
3. If $\psi:\left[q_{0}, \infty\right) \mapsto \mathbb{R}$ is convex and increasing, then

$$
\sum_{q>q_{0}} \exp -\psi(q) \leq \psi^{\prime}\left(q_{0}\right)^{-1} \exp -\psi\left(q_{0}\right) .
$$

Here $\psi^{\prime}$ is the right derivative of $\psi$.
[Hint: The tail series can be bounded by $\psi^{\prime}\left(q_{0}\right)^{-1} \int_{q_{0}}^{\infty} \exp -\psi(x) d \psi(x)$.]
4. Let $\mathcal{F}$ be a class of measurable functions $f: \mathcal{X} \mapsto[l, u]$ satisfying one of the following two conditions:

$$
\begin{aligned}
\sup _{Q} N\left(\varepsilon(u-l), \mathcal{F}, L_{2}(Q)\right) & \leq\left(\frac{K}{\varepsilon}\right)^{V} \\
\sup _{Q} \log N\left(\varepsilon(u-l), \mathcal{F}, L_{2}(Q)\right) & \leq K\left(\frac{1}{\varepsilon}\right)^{W}
\end{aligned}
$$

for every $\varepsilon>0$, where the supremum is taken over all discrete probability measures $Q$. Then the tail probabilities $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}>t\right)$ can be bounded as in the theorems, but with $t$ replaced by $t /(u-l)$.
5. For the function $\varphi_{r}$ as in Lemma 2.14.26, there is an absolute constant $K= K(C)$ such that for all $t \leq K(C) \sqrt{r}$,

$$
\varphi_{r}\left(\frac{K(C) \sqrt{r} t}{C}\right) \geq 11 t^{2}
$$

[Hint: Consider the two regions $K(C) \sqrt{r} t \geq r C$ and $K(C) \sqrt{r} t \leq r C$. On the first region, $11 C^{2} \exp \left(11 C^{2}-1\right)$ works for $K^{2}(C)$, while $11 C^{2}$ works for the second region. Hence $K^{2}(C)$ can be chosen to be the larger of these two constants.]
6. Let $Y_{1}, \ldots, Y_{k}$ and $X_{1}, \ldots, X_{n}$ be i.i.d. samples from $P_{1}$ and $P$, respectively, that are related by $P_{1}(C)=P\left(C \cap C_{0}\right) / P\left(C_{0}\right)$. If $\sigma_{0}^{2} \leq P\left(C_{0}\right) \leq 1-\sigma_{0}^{2}$, then for any class of functions $\mathcal{F}$

$$
\mathrm{E}^{*}\left\|\sum_{i=1}^{k}\left(f\left(Y_{i}\right)-P_{1} f\right)\right\|_{\mathcal{F}} \leq K \mathrm{E}^{*}\left\|\sum_{i=1}^{n}\left(f\left(X_{i}\right)-P f\right)\right\|_{\mathcal{F}},
$$

for a constant $K$ that depends only on $\sigma_{0}^{2}$.
7. Suppose that $x_{1}, \ldots, x_{n}$ are points in a set $\mathcal{X}$ and $\varepsilon_{1}, \ldots, \varepsilon_{n}$ i.i.d. Rademacher variables. If $\mathcal{C}$ is a class of subsets of $\mathcal{X}$ satisfying (2.14.11), then there exists a constant $\tilde{K}$ such that, with $N=\left\|\sum_{i=1}^{n} 1_{C}\left(x_{i}\right)\right\|_{\mathcal{C}}$,

$$
\mathrm{E}\left\|\sum_{i=1}^{n} \varepsilon_{i} 1_{C}\left(x_{i}\right)\right\|_{\mathcal{C}} \leq \tilde{K} \sqrt{N V \log (K n / N)}
$$

[Hint: Use Corollary 2.2.8 with $d(C, D)=\sqrt{n\left\|1_{C}-1_{D}\right\|_{L_{1}\left(Q_{n}\right)}}$, where $Q_{n}$ is the empirical measure on the points $x_{i}$. The diameter of $\mathcal{C}$ for $d$ is at most $\sqrt{2 N}$.]
8. Suppose that $X_{1}, \ldots, X_{n}$ are i.i.d. random elements with distribution $P$ on ( $\mathcal{X}, \mathcal{A}$ ), and let $\varepsilon_{1}, \ldots, \varepsilon_{n}$ i.i.d. Rademacher variables. If $\mathcal{C}$ is a measurable class of measurable subsets of $\mathcal{X}$ satisfying (2.14.11), then there exists a constant $\tilde{K}$ such that, with $a=\sup _{C \in \mathcal{C}} P(C)$,

$$
\mathrm{E}^{*}\left\|\sum_{i=1}^{n} 1_{C}\left(X_{i}\right)\right\|_{\mathcal{C}} \leq 2 n a+\tilde{K} V \log \frac{K}{a}
$$

and

$$
\mathrm{E}^{*}\left\|\sum_{i=1}^{n} \varepsilon_{i} 1_{C}\left(X_{i}\right)\right\|_{\mathcal{C}} \leq \tilde{K} \sqrt{V n}\left[\left(a+\frac{V}{n} \log \frac{V}{a}\right) \log \frac{K}{a}\right]^{1 / 2}
$$

9. Suppose that $\mathcal{C}$ is a class of sets satisfying (2.14.11) and $\sup _{C \in \mathcal{C}} P(C) \leq \sigma_{0}^{2}$. Then for some constants $D$ and $\tilde{K}$

$$
\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}}>t\right) \leq\left(\frac{D}{t}\right) e^{-2 t^{2}}
$$

for all $t \geq \tilde{K} \sqrt{V \log K}$ and $n \geq 1$.
[Hint: Use Lemma 2.14.26 and the second result proved in Exercise 2.14.8.]
10. Suppose that $Z_{1}, \ldots, Z_{m}$ are random variables satisfying

$$
\mathrm{P}\left(\left|Z_{j}\right| \geq t\right) \leq \exp -\varphi_{r}(t / C)
$$

for all $t \geq D$, where $\varphi_{r}(t)$ is the function defined in the proof of Lemma 2.14.26. Then there exists a constant such that, for $\log m \leq r$,

$$
\mathrm{E} \max _{1 \leq j \leq m}\left|Z_{j}\right| \leq K(D+C \sqrt{r \log m})
$$

[Hint: Recall the proof of Lemma 2.2.2; compute the left side as the integral $\int_{0}^{\infty} \mathrm{P}\left(\max _{1 \leq j \leq m}\left|Z_{j}\right|>t\right) d t$; and split the region of integration at $\tau \equiv D \vee C \sqrt{r \log m}$.]
11. Suppose that $\mathcal{C}$ is a class of subsets of a given set $C_{0}$ satisfying (2.14.12). There exists a constant $K_{1}$ such that if $P\left(C_{0}\right)=d \in(0,1)$, then

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{C}} \leq K_{1} \sqrt{V d \log \left(\frac{K}{d}\right)}
$$

[Hint: Relate $N_{[]}\left(\varepsilon, \mathcal{C}, L_{1}(P)\right)$ to $N_{[]}\left(\varepsilon, \mathcal{C}, L_{2}(P)\right)$, and then use Theorem 2.14.2; compare with Exercise 2.14.7.]

## 2 <br> Notes

2.2. The maximal inequality Theorem 2.2 .4 uses the special properties of the Orlicz norm only through the application of Lemma 2.2.2. Hence an identical result can be proved using other norms provided the analogue of the lemma is available. For instance, Ledoux and Talagrand (1991) show that the lemma holds for weak $L_{p}$-norms with $\psi$ taken equal to $x^{p}$. Second, it may be remarked that often the full strength of Theorem 2.2.4 is not needed and the weakened version of this theorem, where the Orlicz norm on the left is replaced by $\operatorname{Esup}_{s, t}\left|X_{s}-X_{t}\right|$, suffices. This weakened version can be proved along exactly the same lines, provided a similarly weakened version of Lemma 2.2.2 is available. The latter is contained in Problem 2.2.8 for any Orlicz norm, a result due to Pisier (1983).

The use of "entropy" in the study of the continuity of Gaussian processes goes back to Dudley (1967b) and Sudakov (1969). Dudley (1967b) credits V. Strassen with the idea and basic results, but see the review of Sudakov (1976) by Dudley (1978b). Strassen and Dudley (1969) apparently made the first use of entropy in connection with empirical processes. The use of entropy in maximal inequalities will probably persist because of its simplicity. However, it is known that entropy inequalities are not sharp in all cases, while a stronger tool, majorizing measures, gives sharp results, at least for Gaussian processes. See Ledoux and Talagrand (1991) and Appendix A.2.3 for an exposition.

The original papers by Bernstein are apparently unavailable. Bennett (1962) discusses the history of Bernstein's inequality, provides proofs, and compares Bernstein's inequality to a number of other inequalities.
2.3. The method of symmetrization goes back to Kahane (1968) and Hoffmann-Jørgensen (1973, 1976). The construction of separable versions using liftings is adapted from Talagrand (1987a).
2.4. Generalizations of the classical Glivenko (1933) and Cantelli (1933) theorem for sets under a bracketing condition were first obtained by Blum (1955) and Dehardt (1971). Dudley (1984) gives Theorem 2.4.1 in its present formulation. Vapnik and Červonenkis $(1968,1971,1981)$ give generalizations with conditions in terms of the logarithm of the $L_{1}$-covering numbers. Pollard (1982) formulates the reverse submartingale property of $\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}$. Measurability difficulties regarding the choice of filtration are pointed out by Strobl (1992). For more on Glivenko-Cantelli theorems, see Chapter 2.8 and Dudley, Giné, and Zinn (1991).
2.5. The first uniform entropy central limit theorems were due to Pollard (1982) and Kolčinskii (1981) following path-breaking work by Dudley (1978a), who, among other things, established the uniform central limit theorem for the empirical process indexed by a (suitably measurable) VCclass of sets. Bracketing empirical central limit theorems were obtained by Dudley (1978a, 1984), Ossiander (1987) and Andersen, Giné, Ossiander, and Zinn (1988). Ossiander (1987) obtained the result under the assumption that the $L_{2}(P)$-bracketing integral is finite. The result presented in this section is more general than this, but less general than the theorems obtained by Andersen et al. These authors relax finiteness of the two integrals to continuous majorizing measure conditions on $L_{2}(P)$-balls and $L_{2, \infty}(P)$-brackets, respectively. See Chapter 2.11 for a statement.

The chaining argument in the proof of Theorem 2.5.6 may be refined so that it is not necessary to construct a nested sequence of partitions. See Pollard (1989a). The present organization and notation of the chaining argument is borrowed from Arcones and Giné (1993), who chain by exponential bounds for probabilities. The use of means in combination with Lemma 2.2.10 in the proof is new.
2.6. The study of VC-classes apparently originated in Vapnik and Cervonenkis (1971), who were motivated by problems in pattern recognition. See also Vapnik and Cervonenkis (1981) and Vapnik (1982). Sauer's lemma and its generalizations can be found in Sauer (1972) and Frankl (1983). Theorem 2.6.4 is due to Haussler (1995), who improved an earlier result of Dudley (1978a). Our rendering of the proof owes its origins to conversations with David Pollard. Pollard (1984) showed how to obtain the result about functions from the bound for sets.

The behavior of entropies under the formation of convex hulls as described in Theorem 2.6.9 is an extension of results of Dudley (1987), who obtained the bound up to an additional $\delta$, and Ball and Pajor (1990), who obtained the bound under the assumption that $\mathcal{F}$ is a sequence of functions decreasing at the rate $\left\|f_{i}\right\|_{Q, 2} \leq i^{-1 / V}$. The present formulation and
its induction proof are new. Lemma 2.6.11 is given by Pisier (1981) but is apparently due to B. Maurey.

Many results in Section 2.6.5 are due to Assouad (1981, 1983), Pollard (1984), and Dudley (1984). Assouad $(1981,1983)$ gives explicit bounds for the VC-indices of many of the classes in Lemma 2.6.17and formulates a number of results concerning "dual density," which we have not included here (see especially Assouad (1983), pages 245-247). Lemma 2.6.22 and Example 2.6.23 improve upon an example of Dudley (1985), who shows that the class of functions $x \mapsto t^{k-1} F(x) 1\{F(x) \geq t\}$ is VC-hull. We learned Exercise 2.6.21 from A. Quiroz: see Quiroz, Nakamura, and Perez (1995).

Notable among the results not included in this section are those of Stengle and Yukich (1989) and Pisier (1984). Stengle and Yukich show how new VC classes can be generated by "semialgebraic sets." Pisier (1984) links up VC theory with probability in Banach spaces by showing that a class of sets is VC if and only if a certain operator is type-2. See Ledoux and Talagrand (1991) for an exposition.
2.7. Bounds on entropies for classes of smooth functions are obtained by Kolmogorov and Tikhomirov (1961), Lorentz (1966), and Birman and Solomjak (1967). Dudley (1984), Chapter 7, gives a useful introduction to this literature. We adapted the proof of the bound for entropy with bracketing for monotone functions on $\mathbb{R}$ from Van de Geer (1991), who adapts techniques from Birman and Solomjak (1967). The results for convex sets are due to Bronštein (1976), who improved on results of Dudley (1974). These bounds were first exploited in the context of empirical processes by Bolthausen (1978). Van der Vaart (1994b) gives improvements of Corollary 2.7.4 and shows that the classes of functions considered there are $P$-Glivenko-Cantelli if and only if $\sum M_{j} P\left(I_{j}\right)<\infty$. He also shows that the bracketing integral converges if the constants $M_{j} P\left(I_{j}\right)^{1 / 2}$ are regularly varying at infinity and $\sum M_{j} P\left(I_{j}\right)^{1 / 2}<\infty$. Giné and Zinn (1986b) first proved that the class $C_{1}^{1}(\mathbb{R})$ is Donsker under the latter condition. Van der Vaart (1993) generalized their result to the classes of Corollary 2.7.4 in general.

For more recent work on entropy numbers, see Carl and Stephani (1990) and Ball and Pajor (1990) and the references stated therein. These authors study the entropy of the image of the unit ball under a (compact) operator $T$ between Banach spaces. More precisely, they study entropy numbers denoted $\varepsilon_{n}(T)$ and $e_{n}(T)$, which as functions of $n$ are roughly the inverses of the covering numbers and entropy numbers as in the present manuscript. For instance, $e_{n}(T)$ is defined as the smallest $\varepsilon$ such that the image $T(U)$ can be covered by $2^{n-1}$ balls of radius $\varepsilon$.
2.8. Theorem 2.8.1 is due to Dudley, Giné, and Zinn (1991), who give a complete treatment of the conditions under which a class of functions is universal or uniform Glivenko-Cantelli.

The development of uniform in $P$ Glivenko-Cantelli and Donsker theorems began with the work of Dvoretzky, Kiefer, and Wolfowitz (1956), Kiefer and Wolfowitz (1959), and Kiefer (1961). The exponential bounds developed in these papers yield uniform in $P$-Glivenko-Cantelli theorems for the classical empirical distribution function of random variables in $\mathbb{R}^{d}$. Moreover, these authors essentially establish the uniform Donsker property for the classical distribution function in the course of proving the asymptotic minimaxity of the empirical distribution function as an estimator of the true distribution function. Uniformity in $P$ is implicit in the work of Vapnik and Cervonenkis (1971) on the Glivenko-Cantelli theorems. The introduction of uniform entropy conditions by Pollard (1982) and Kolčinskii (1981) continued this development. Massart (1986), Theorem 5.10, page 4.11, establishes rates of convergence for weak-approximation versions of Theorem 2.8.3 under growth rate hypotheses on the uniform entropy and additional hypotheses on the envelope function of the class. (It is plausible that his rates are in fact uniform over the collection $\mathcal{P}$ for which the moment hypotheses on $\mathcal{F}$ hold uniformly.) Dudley (1987) unifies and extends results for the "universal Donsker property," which entail that $\mathcal{F}$ is Donsker for all probability measures $P$ on the sample space. A universal Donsker class $\mathcal{F}$ is essentially bounded: $\sup _{f} \operatorname{diam} f<\infty$ (where $\operatorname{diam} f=\sup _{x, y} f(x)-f(y)$ ). For classes with this property, Giné and Zinn (1991) use Gaussian comparison methods to characterize classes that are uniformly Donsker in all possible underlying measures.

Theorem 2.8.2 is contained in Sheehy and Wellner (1992) along with other equivalences; the present proof is new.
2.9. The multiplier central limit, Theorem 2.9.2, is implicit in Giné and Zinn (1984) and is stated explicitly in Giné and Zinn (1986a), who attribute the multiplier inequality to Pisier and Fernique. Alexander (1985), solving a problem posed by Hoffmann-Jørgensen, shows that no "universal multiplier moment" exists: there is no function $\psi: \mathbb{R}^{2} \mapsto \mathbb{R}$ so that $\xi Z$ satisfies the central limit theorem whenever $\mathrm{E} \xi Z=0$, $\mathrm{E} \psi(|\xi|,\|Z\|)<\infty$ and $Z$ satisfies the central limit theorem, for independent real- and Banach-space-valued random elements $\xi$ and $Z$. On the other hand, Ledoux and Talagrand (1986) show that the $L_{2,1}$-hypothesis on the multipliers $\xi_{i}$ cannot be relaxed in the sense that, for every $\xi$ with $\|\xi\|_{2,1}=\infty$, there exists a Banach space valued $Z$ that satisfies the central limit theorem, but $\xi Z$ does not satisfy the central limit theorem. Ledoux and Talagrand (1986) and Ledoux and Talagrand (1991), Proposition 10.4 on page 279, give a different proof of the basic multiplier inequality.

The almost sure conditional multiplier central limit theorem is due to Ledoux and Talagrand (1988), with contributions by J. Zinn. The present proof, based on isoperimetric methods, is adapted from Ledoux and Talagrand (1991), Theorem 10.14, on page 293. The proof using martingale
difference methods originating in Yurinskii (1974), given in the "Problems and Complements" section, is taken from Ledoux and Talagrand (1988).
2.10. Alexander (1987c) gives Theorem 2.10.1 and derives that $\mathcal{F}+\mathcal{G}$ and $\mathcal{F} \cup \mathcal{G}$ are Donsker if $\mathcal{F}$ and $\mathcal{G}$ are Donsker from his more general Proposition 2.6. Theorem 2.10.2 and Theorem 2.10.3 are due to Dudley (1985).

Versions of Theorem 2.10.6 are established by Giné and Zinn (1986a) (one-dimensional $\phi$ under measurability conditions) and Talagrand (1987a) (uniformly bounded classes). Lemma 2.10.14 is established by Giné and Zinn (1986a); the proof given here is new. Section 2.10.4 is based on Van der Vaart (1993). The result of Example 2.10.25 specialized to the class $C_{1}^{1}(\mathbb{R})$ was first obtained by Giné and Zinn (1986b) by a different method. Pollard (1990), Section 5, gives a variety of results similar to those in Section 2.10.3.
2.11. The limit theory in this section has its antecedents in Koul (1970), Shorack $(1973,1979)$, and Van Zuijlen (1978). Also see Shorack and Beirlant (1986), Marcus and Zinn (1984), and Shorack and Wellner (1986), Section 3.3, pages 108-109.

The first subsection, based on random and uniform-entropy, follows Alexander (1987b), but with a simplified proof for the main Theorem 2.11.1. See Alexander's paper for a discussion of the minimal moment conditions on the envelope within the context of this theorem. The improvement over Theorem 2.5.2 in the i.i.d. case was already obtained by Giné and Zinn (1984). Pollard (1990) develops a combinatorial theory for the non-i.i.d. case paralleling the VC-theory of Chapter 2.6.

The bracketing central limit theorem, Theorem 2.11.11, and its corollary are due to Andersen, Giné, Ossiander, and Zinn (1988), building on Ossiander (1987) and work on majorizing measures and Gaussian processes due to Fernique (1974) and Talagrand (1987c). Theorem 2.11.9 does not seem to be a corollary of their result, but appears to be the natural generalization of Ossiander's result to the case of non-i.i.d. observations. The proof of Theorem 2.11.11 shows that the theorem remains true if the single majorizing measure, which is guaranteed to exist by the assumption of Gaussian domination, is replaced by certain sequences of majorizing measures (depending on $n$ ). The proof given here is greatly simplified in comparison to the original proof.

Jain and Marcus proved their theorem, as given here, in Jain and Marcus (1975). Example 2.11.14 is taken from Giné and Zinn (1986a). Dudley (1985), Section 6, gives the first satisfactory integration of the famous "Chibisov-O'Reilly theorem" treated in Example 2.11.15 with modern empirical process theory.
2.12. Partial-sum processes have a long and honorable history in probability theory and statistics, with rapid development of the classical theory
occurring in the late 1940s and early 1950s. The classical work of Erdös and Kac (1946), Doob (1949), and Donsker $(1951,1952)$ was beautifully summarized by Billingsley (1968).

Study of the partial-sum or sequential empirical process seems to have begun with the work of Müller (1968) on the distributional invariance principle for the Glivenko-Cantelli theorem, Pyke (1968) on random-samplesize limit theorems for empirical processes, and Kiefer (1969) on embedding questions. The Hungarian school's work on embedding theorems in the 1970s was followed by embedding theorems (explicit construction) for general empirical processes in Dudley and Philipp (1983). The present form seems to have been first stated by Sheehy and Wellner (1992), along with other equivalences of Dudley and Philipp (1983) and Dudley (1984). The present proof is analogous to the proof by Billingsley (1968) of a classical partial-sum convergence theorem: Theorem 10.1, pages 68-70.

The subsection on partial-sum processes on lattices follows Alexander and Pyke (1986), Bass and Pyke (1985), and Pyke (1983).
2.13. Theorem 2.13.1 is taken from Dudley (1984), who also shows that, in a certain sense, the condition that the sequence converges is sharp. Giné and Zinn (1986a) give further results for sequences of functions bounded in uniform norm.

Dudley (1987) notes that the square of the supremum of the empirical process over an elliptical class $\mathcal{F}$ equals a weighted sum of the squares of the empirical process acting on the basis functions defining the elliptical class, and he points out the practical importance of such classes.

The equivalence of (iii) and (iv) in Theorem 2.13.6 is due to Giné and Zinn (1984); the equivalence of (i), (ii), and (iii) was proved by Talagrand (1988).
2.14. Bounds for expectations of suprema of Gaussian processes were developed by Dudley (1967b). In the case of empirical processes, Pollard (1989b) was apparently the first to recognize the usefulness of moment bounds for suprema of the form given in Theorems 2.14.1 and 2.14.2; also see Pollard (1990) and Kim and Pollard (1990). Ledoux and Talagrand (1991) systematically developed the use of Orlicz norms; see their Notation and Chapters 6 and 11. Theorem 2.14.5 is a straightforward consequence of the general domination of Orlicz norms of sums of independent random elements by $L_{1}$-norms plus the Orlicz norm of maximal summand proved by Talagrand (1989); see Ledoux and Talagrand (1991), Chapter 6.

Dvoretzky, Kiefer, and Wolfowitz (1956) proved the first exponential bound for the supremum distance between the empirical distribution function and the true distribution function in the case of $\mathcal{X}=\mathbb{R}$. Massart (1990) found the best constant $D$ multiplying the exponential for this classical case. Related bounds for the more difficult case $\mathcal{X}=\mathbb{R}^{k}$ were established by Kiefer (1961). Vapnik and Cervonenkis (1971) proved exponential bounds
of the same form as those given in Theorem 2.14.13, but with no powers of $t$ in front and the constant $D$ depending on (and increasing with) $n$. Alexander (1984) gives bounds of the same type as those in Theorems 2.14.9, 2.14.13, and 2.14.16 and also has sharper bounds than the bound given in 2.14.16.

Theorems 2.14.9, 2.14.13, and 2.14.14 are due to Talagrand (1994), while Theorems 2.14.10, 2.14.16, and 2.14.17 are from Massart (1986). For still more bounds, see Smith and Dudley (1992) and Adler and Brown (1986).

The developments in Subsection 2.14.3 and Exercises 2.14.5-2.14.11 are based on Talagrand (1994) with one exception: the reformulation of Theorem 2.14.24 given in Theorem 2.14.25 is due to Birgé and Massart (1994).

## PART 3

## Statistical Applications

## 3.1

## Introduction

The empirical process methods and techniques developed in Part 2 have many applications in statistics. The present part illustrates this in some detail by applications ranging from $M$-estimation (limit theory and rates of convergence in infinite-dimensional applications), bootstrapping, permutation tests, tests of independence, the functional delta-method, and contiguity theory.

In agreement with its importance in statistics, a treatment of $M$ estimators opens this part. In Chapter 3.2 we consider estimators $\hat{\theta}_{n}$ defined as the value of $\theta$ maximizing (or nearly maximizing) a random criterion function $\theta \mapsto \mathbb{M}_{n}(\theta)$. A number of results are formulated for general, abstract criterion functions, but we are particularly interested in "empirical criterion functions" of the form $\mathbb{M}_{n}(\theta)=\mathbb{P}_{n} m_{\theta}$.

The limiting distribution of such $M$-estimators may be derived either from a continuous mapping theorem for the argmax functional or from a linearization argument. In both approaches it appears useful to split the derivation into three steps:

- establish consistency;
- establish a rate of convergence;
- derive the limiting distribution.

The most successful methods in the first step are the (generalized) method of Wald (which we do not discuss) and a method based on uniform convergence of the criterion functions. The latter method, when applied with a empirical criterion function, boils down to proving that certain classes of functions are Glivenko-Cantelli and is discussed briefly.

Rates of convergence are discussed in some detail and generality in Chapter 3.4, but in Chapter 3.2 we present a preliminary approach, which appears to be useful for the study of $M$-estimators of Euclidean parameters. When applied to empirical criterion functions of the form $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ this approach is based on controlling the entropy of the classes of functions $\left\{m_{\theta}-m_{\theta_{0}}:\left\|\theta-\theta_{0}\right\|<\delta\right\}$ (for small $\delta$ ) and expresses the rate of convergence in terms of the $L_{2}$-norms of the envelope functions of these classes.

The argmax continuous mapping theorem asserts that given a sequence of criterion functions $\mathbb{M}_{n}$ converging (in an appropriate distributional sense) to a limit $\mathbb{M}$, the point of maximum, or argmax, of $\mathbb{M}_{n}$, which is the $M$ estimator, converges in distribution to the argmax of the limit process $\mathbb{M}$. In obtaining a limit distribution of a sequence of $M$-estimators, this theorem is usually not applied with the original criterion functions $\theta \mapsto \mathbb{M}_{n}(\theta)$, but to (a multiple of) "localized" criterion functions of the form

$$
h \mapsto \tilde{\mathbb{M}}_{n}(h)=\mathbb{M}_{n}\left(\theta_{0}+\frac{h}{r_{n}}\right)-\mathbb{M}_{n}\left(\theta_{0}\right) .
$$

Here $r_{n}$ is the rate of convergence and $\theta_{0}$ the true parameter. These localized criterion functions usually converge functionally in distribution to a limit only if the local parameter $h=r_{n}\left(\theta-\theta_{0}\right)$ is restricted to compacta. This is the reason that it is necessary to obtain the rate of convergence first. Once it is known that $\hat{h}_{n}=r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is uniformly tight, convergence in distribution of the processes $\left\{\tilde{\mathbb{M}}_{n}(h): h \in K\right\}$ in the space $\ell^{\infty}(K)$ for each compact $K$ suffices for successful application of the argmax theorem. Actually, this type of convergence is too strong, but it fits well within the framework of empirical processes developed in Part 2.

Using this approach, we obtain simple, but general, conditions for the asymptotic normality of maximum likelihood estimators in smooth parametric models, but we also treat a number of nonstandard problems.

An alternative approach to obtaining the limit distribution of $M$ estimators is to derive a characterization as the solution of a family of estimating equations of the form $\Psi_{n}\left(\hat{\theta}_{n}\right)=0$. In Chapter 3.3 we discuss the asymptotic behavior of solutions of estimating equations, which we call $Z$-estimators, in general. The framework in this chapter allows an infinitedimensional parameter space $\Theta$ and a corresponding infinite-dimensional system of estimating equations. This covers not only the classical estimating equation framework with a finite-dimensional parameter space, but also a wide range of problems in nonparametric and semiparametric inference involving estimation of parameters with values in some (Banach) space of functions.

Establishing a rate of convergence of $M$-estimators based on empirical criterion functions is quite amenable to empirical process methods. Chapter 3.4 develops these methods in some detail and applies them to maximum likelihood estimation, least-squares estimation, and least-absolute-deviation estimation. In this chapter we are mostly interested in infinite-dimensional
(nonparametric or semiparametric) estimation. The basic result is that a modulus of continuity of the empirical process determines the rate of convergence. Using the results of Part 2, this modulus can be bounded in terms of entropies, and the rate of convergence can be expressed in terms of entropy integrals of the parameter set. For instance, the rate of convergence $r_{n}$ of a maximum likelihood estimator can be found as the solution of the equation

$$
r_{n}^{2} \tilde{J}_{[]}\left(\frac{1}{r_{n}}, \mathcal{P}_{n}, h\right) \leq \sqrt{n}
$$

Here $\mathcal{P}_{n}$ is the class of densities over which the likelihood is maximized and the bracketing entropies are calculated with respect to the Hellinger distance $h$.

In applications it frequently occurs that the sample size is not fixed but is, in fact, random-perhaps even depending on the data $X_{1}, \ldots, X_{n}$ in some complicated way. The effect of random sample size on the empirical processes $\mathbb{G}_{n}$ is investigated in Chapter 3.5. Theorem 3.5.1 asserts that if $\mathcal{F}$ is a Donsker class of functions and $N_{n}$ is a sequence of random samples sizes satisfying $N_{n} / c_{n} \xrightarrow{\mathrm{P}} \nu$ with $c_{n} \rightarrow \infty$, then $\mathbb{G}_{N_{n}} \leadsto \mathbb{G}$ in $\ell^{\infty}(\mathcal{F})$ provided only that $\mathrm{P}(\nu>0)=1$. In this chapter we give special attention to the case that the random sample size $N_{n}$ is Poisson-distributed with mean $n$ independent of the data. In this case the Kac empirical point process $\mathbb{N}_{n}=\sum_{i=1}^{N_{n}} \delta_{X_{i}}$ is a Poisson point process with intensity measure $n P$, and, for $\mathcal{F}$ with $\|P\|_{\mathcal{F}}<\infty$, the Kac empirical process $\mathbb{Z}_{n}=n^{-1 / 2}\left(\mathbb{N}_{n}-n P\right)$ converges in distribution in $\ell^{\infty}(\mathcal{F})$ to a Brownian motion process if and only if $\mathcal{F}$ is $P$-Donsker.

Nonparametric bootstrap methods have become popular in statistics since their introduction by Efron (1979). This method is based on sampling from the empirical measure $\mathbb{P}_{n}$. Given the original sample $X_{1}, \ldots, X_{n}$, let $\hat{X}_{1}, \ldots, \hat{X}_{n}$ be an i.i.d. sample from $\mathbb{P}_{n}$. The bootstrap empirical measure and the bootstrap empirical process are given by

$$
\hat{\mathbb{P}}_{n}=\frac{1}{n} \sum_{i=1}^{n} \delta_{\hat{X}_{i}} \quad \text { and } \quad \hat{\mathbb{G}}_{n}=\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)
$$

respectively. These are important tools for the study of a wide variety of statistical methods. Letting $M_{n i}$ be the number of times that $X_{i}$ is "redrawn" from the original sample, the bootstrap empirical measure and process can also be written as

$$
\begin{equation*}
\hat{\mathbb{P}}_{n}=\frac{1}{n} \sum_{i=1}^{n} M_{n i} \delta_{X_{i}} \quad \text { and } \quad \hat{\mathbb{G}}_{n}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(M_{n i}-1\right) \delta_{X_{i}}, \tag{3.1.1}
\end{equation*}
$$

respectively. The vector $M_{n}=\left(M_{n 1}, \ldots, M_{n n}\right)$ has a multinomial distribution with $n$ cells, $n$ trials, and success probabilities $1 / n$ for each of the $n$ cells. Since the variables $M_{n 1}, M_{n 2}, \ldots$ converge in distribution to a sequence of i.i.d. Poisson variables $Y_{1}, Y_{2}, \ldots$ with mean 1 , it is apparent that
the limit theory for the bootstrap empirical process $\hat{\mathbb{G}}_{n}$ is closely linked to the conditional multiplier central limit theorems developed in Chapter 2.9. This is indeed the case, and our proofs of two bootstrap limit theorems due to Giné and Zinn (1990) rely on this connection. In Theorem 3.6.1 it is shown that the bootstrap empirical process satisfies $\hat{\mathbb{G}}_{n} \rightsquigarrow \mathbb{G}$ "in outer probability" if and only if $\mathcal{F}$ is $P$-Donsker, while in Theorem 3.6.2 it is shown that $\hat{\mathbb{G}}_{n} \rightsquigarrow \mathbb{G}$ "outer almost surely" if and only if $\mathcal{F}$ is $P$-Donsker and $\mathrm{P}^{*}\|f-\mathrm{P} f\|_{\mathcal{F}}^{2}<\infty$. The statistical meaning of these results is that the "distribution" of $\hat{\mathbb{G}}_{n}$ (which depends on the original data only) is a consistent estimator for the distribution of $\mathbb{G}_{n}$ (which depends on the underlying distribution $P$ ), in the sense that the difference converges to zero as $n \rightarrow \infty$. The two types of theorems yield consistency in probability and consistency in an almost sure sense, respectively. Our proofs rely heavily on the Poissonization of the bootstrap sample size. Other bootstrap methods can be based on replacing the multinomial weights in (3.1.1) by other exchangeable weights. For example, resampling $k$ from the original sample of $n$ without replacement can be treated by an appropriate choice of $M_{n}$. Conditional limit theorems for these alternative bootstrap methods are also presented.

Chapter 3.7 introduces general versions of the two-sample KolmogorovSmirnov statistics and shows how the corresponding two-sample tests can be implemented using either bootstrap or permutation methods. Many statistics used for testing independence can be viewed as functionals of the independence empirical process, which we define and study in Chapter 3.8.

One of the most important basic tools of large sample theory in statistics is the delta-method: if $r_{n}\left(X_{n}-\theta\right) \rightsquigarrow Z$ for some constant $\theta$ and $r_{n} \rightarrow \infty$, and $\phi$ is differentiable at $\theta$, then $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi^{\prime}(\theta) Z$. For Euclidean vectors $X_{n}$, this result is standard and $\phi^{\prime}(\theta)$ is the usual derivative from calculus. Extensions to functions $\phi$ of infinite-dimensional statistics $X_{n}$, for instance the empirical measure $\mathbb{P}_{n}$, have become increasingly useful and important. The formulation of the functional delta-method requires careful definition of the type of derivative. A map $\phi: \mathbb{D} \mapsto \mathbb{E}$ is called Fréchetdifferentiable at $\theta$ if there is a continuous linear map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ such that

$$
\left\|\phi(\theta+h)-\phi(\theta)-\phi_{\theta}^{\prime}(h)\right\|=o(\|h\|), \quad\|h\| \rightarrow 0
$$

Such a map $\phi$ is called Hadamard-differentiable at $\theta$ if there is a continuous linear map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ such that

$$
\frac{\phi\left(\theta+t_{n} h_{n}\right)-\phi(\theta)}{t_{n}} \rightarrow \phi_{\theta}^{\prime}(h),
$$

for every sequence of real numbers $t_{n} \rightarrow 0$ and every sequence $h_{n} \rightarrow h$. Hadamard differentiability is a weaker requirement than Fréchet differentiability and, fortunately, is sufficient for the functional delta-method. This
asserts that if $r_{n}\left(X_{n}-\theta\right) \rightsquigarrow Z$ for a separable variable $Z$ and $\phi$ is Hadamarddifferentiable at $\theta$, then

$$
r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi_{\theta}^{\prime}(Z) .
$$

Examples treated in some detail in Chapter 3.9 include the Nelson-Aalen estimator from right-censored data, quantile and copula functions, the product integral, multivariate trimming, and $M$-functionals.

When specialized to a Hadamard-differentiable map $\phi$ on $\mathbb{D}=\ell^{\infty}(\mathcal{F})$ for a Donsker class $\mathcal{F}$, the functional delta-method gives

$$
\sqrt{n}\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right) \rightsquigarrow \phi_{P}^{\prime}(\mathbb{G}) .
$$

In this case it makes sense to ask if this continues to hold for the empirical bootstrap: is it true that

$$
\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right) \rightsquigarrow \phi_{P}^{\prime}(\mathbb{G})
$$

in outer probability (or outer almost surely)? Several results asserting that this is true are proved in Section 3.9.3. Thus, the consistency of the bootstrap of the abstract empirical process implies the consistency of the bootstrap for many statistical functionals. This is probably the most important motivation for studying the abstract bootstrap process.

The theory of contiguous families of probability measures provides a notion of asymptotic absolute continuity that has proved to be of fundamental importance for asymptotic theory in statistics. Chapter 3.10 presents the basic elements of contiguity theory and also applies it to the empirical process. One result of this type concerns the empirical measure $\mathbb{P}_{n}$ of independent and identically distributed variables $X_{n 1}, \ldots, X_{n n}$ with common distribution $P_{n}$ satisfying

$$
\int\left[\sqrt{n}\left(d P_{n}^{1 / 2}-d P^{1 / 2}\right)-\frac{1}{2} h d P^{1 / 2}\right]^{2} \rightarrow 0
$$

for some measurable function $h: \mathcal{X} \mapsto \mathbb{R}$. If $\mathcal{F}$ is $P$-Donsker, then under $P_{n}$

$$
\sqrt{n}\left(\mathbb{P}_{n}-P\right) \rightsquigarrow \mathbb{G}+s_{h} \quad \text { in } \quad \ell^{\infty}(\mathcal{F})
$$

where the shift $s_{h}: \mathcal{F} \mapsto \mathbb{R}$ is given by $s_{h} f=P f h$.
Part 3 ends in Chapter 3.11 with infinite-dimensional versions of the Hájek convolution and local asymptotic minimax theorems. These results apply to many statistical models, but we discuss particularly the asymptotic efficiency of the empirical distribution in the nonparametric situation.

## Problems and Complements

1. Suppose that for each natural number $n$ the vector $M_{n}=\left(M_{n 1}, \ldots, M_{n n}\right)$ has a multinomial distribution with $n$ cells, $n$ trials, and success probabilities $1 / n$ for each of the $n$ cells. Then the variables $M_{n 1}, M_{n 2}, \ldots$ converge in distribution to a sequence of i.i.d. Poisson variables $Y_{1}, Y_{2}, \ldots$ with mean 1 in $\mathbb{R}^{\infty}$. Furthermore, if $k(n)=o(n), P_{n, k(n)}$ denotes the joint distribution of $\left(M_{n 1}, \ldots, M_{n k(n)}\right)$ and $Q_{n, k(n)}$ denotes the joint distribution of $\left(Y_{1}, \ldots, Y_{k(n)}\right)$, then the total variation distance from $P_{n, k(n)}$ to $Q_{n, k(n)}$ converges to 0 , i.e., $\sup _{A}\left|P_{n, k(n)}(A)-Q_{n, k(n)}(A)\right| \rightarrow 0$, for the supremum taken over the Borel sets in $\mathbb{R}^{k(n)}$.
[Hint: This is closely related to Runnenburg and Vervaat (1969) and to Wellner (1977).]

## 3.2

## M-Estimators

The most important method of constructing statistical estimators is to choose the estimator to maximize a certain criterion function. We shall call such estimators $M$-estimators (from "maximum" or "minimum"). In the case of i.i.d. observations $X_{1}, \ldots, X_{n}$, a common type of criterion function is of the form

$$
\theta \mapsto \mathbb{P}_{n} m_{\theta}=\frac{1}{n} \sum_{i=1}^{n} m_{\theta}\left(X_{i}\right)
$$

for known given functions $m_{\theta}$ on the sample space. In particular, the method of maximum likelihood estimation corresponds to the choice $m_{\theta}= \log p_{\theta}$, where $p_{\theta}$ is the density of the observations. ${ }^{\dagger}$ The theory of empirical processes comes in naturally when studying the asymptotic properties of these estimators. In this chapter we present several results that give the asymptotic distribution of $M$-estimators. Some results are of a general nature, while others presume the set-up of i.i.d. observations.

In many situations estimators that maximize a certain map also solve a system of equations. In particular, in the case of i.i.d. observations many estimators are a zero of a map of the type

$$
\theta \mapsto \mathbb{P}_{n} \psi_{\theta}
$$

for given maps $\psi_{\theta}$ on the sample space. We shall refer to solutions of estimating equations as $Z$-estimators (from "zero"). We note that in some

[^5]of the literature the name $M$-estimator is (also) used for what we call $Z$ estimator and the distinction between the different types of estimators is not always made.

The asymptotic behavior of $Z$-estimators is studied in Chapter 3.3. The approach given there provides an alternative to the approach in the present chapter, although generally the asymptotic properties of $M$-estimators are most economically studied from their characterization as a point of maximum. In this chapter we discuss two approaches that use this characterization directly.

The natural "parameter" (or functional) is denoted $\theta$ and is assumed to run through a subset $\Theta$ of a metric space; for instance, Euclidean space. It is often fruitful to separate the derivation of the limit behavior of a sequence of estimators $\hat{\theta}_{n}$ into subproblems, such as proving consistency, deriving the convergence rate, and finally establishing the limit distribution. In this scheme certain theorems are applied to "local" (pseudo-) parameters (such as $h=\sqrt{n}\left(\theta-\theta_{0}\right)$ if $\theta_{0}$ is the "true" parameter). For convenience, theorems that are typically applied to local parameters are stated in terms of a parameter $h$.

### 3.2.1 The Argmax Theorem

Consider finding a point of maximum as a functional called "argmax". When applied to a random criterion function this yields an $M$-estimator. If the argmax functional were continuous with respect to some metric on the space of criterion functions, then convergence in distribution of the criterion functions would imply the convergence in distribution of their points of maximum, the $M$-estimators, to the point of maximum of the limit criterion function. This is simply a special case of the continuous mapping theorem for weak convergence.

In keeping with the main development in this book-the convergence of stochastic processes in spaces of the type $\ell^{\infty}(T)$, such as the empirical process-we shall develop this idea using the uniform topology on the space of criterion functions. Actually, the proofs ahead show that the (joint) convergence of suprema over certain sets is crucial for the convergence of a point of maximum, not the convergence of the processes with respect to the uniform metric. For simplicity, we shall not pursue such refinements.

Consider a sequence $\left\{\mathbb{M}_{n}(h): h \in H\right\}$ of stochastic processes indexed by a metric space $H$. For each $n$ let the "estimator" $\hat{h}_{n}$ be a point of (near) maximum of the "criterion function"

$$
h \mapsto \mathbb{M}_{n}(h) .
$$

Formally, $\hat{h}_{n}$ may be any $H$-valued map defined on the same probability space as the process $\mathbb{M}_{n}$; its (outer) distribution is evaluated accordingly. Let $\{\mathbb{M}(h): h \in H\}$ be a "limit process", and assume that it possesses the
same relation to a random point $\hat{h}$, except that $\hat{h}$ is implicitly assumed to be Borel measurable.

The argmax functional is continuous at functions $\mathbb{M}$ that have a unique, "well-separated" point of maximum: the function $h \mapsto \mathbb{M}(h)$ should be strictly smaller than $\mathbb{M}(\hat{h})$ on the complement of every neighborhood of the point $\hat{h}$. This requirement, which appears to be natural, is the first condition in the following lemma.

This lemma contains the crux of the (simple) argument; to obtain the best results, it may be necessary to tailor the underlying idea to particular examples.
3.2.1 Lemma. Let $\mathbb{M}_{n}, \mathbb{M}$ be stochastic processes indexed by a metric space $H$. Let $A$ and $B$ be arbitrary subsets of $H$. Suppose there exists a random element $\hat{h}$ such that almost surely

$$
\mathbb{M}(\hat{h})>\sup _{h \notin G, h \in A} \mathbb{M}(h)
$$

for every open set $G$ that contains $\hat{h}$. Suppose the sequence $\hat{h}_{n}$ satisfies

$$
\mathbb{M}_{n}\left(\hat{h}_{n}\right) \geq \sup _{h} \mathbb{M}_{n}(h)-o_{P}(1)
$$

If $\mathbb{M}_{n} \rightsquigarrow \mathbb{M}$ in $\ell^{\infty}(A \cup B)$, then, for every closed set $F$,

$$
\limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(\hat{h}_{n} \in F \cap A\right) \leq \mathrm{P}\left(\hat{h} \in F \cup B^{c}\right) .
$$

If $\mathbb{M}_{n} \leadsto \mathbb{M}$ in $\ell^{\infty}(H)$, then the lemma could be applied with $A=B= H$. In view of the portmanteau theorem, it would yield the conclusion that $\hat{h}_{n} \rightsquigarrow \hat{h}$.

Unfortunately, the assumption that $\mathbb{M}_{n} \rightsquigarrow \mathbb{M}$ uniformly in the whole (local) parameter space is often too strong. This does not mean that the weak convergence $\hat{h}_{n} \rightsquigarrow \hat{h}$ is not true, since the uniform convergence of the criterion functions is much stronger than the convergence of the locations of maxima. Therefore, it may be beneficial to establish additional properties of the sequence $\hat{h}_{n}$ before invoking the continuous mapping theorem for the argmax functional. The following theorem requires uniform tightness, in which case uniform convergence of the criterion functions on compacta suffices.

On compacta, a unique maximum of an upper semicontinuous function $h \mapsto \mathbb{M}(h)$ is automatically well separated, as required by the preceding lemma. We obtain the following theorem.
3.2.2 Theorem (Argmax continuous mapping). Let $\mathbb{M}_{n}, \mathbb{M}$ be stochastic processes indexed by a metric space $H$ such that $\mathbb{M}_{n} \rightsquigarrow \mathbb{M}$ in $\ell^{\infty}(K)$ for every compact $K \subset H$. Suppose that almost all sample paths $h \mapsto \mathbb{M}(h)$ are upper semicontinuous and possess a unique maximum at a (random) point $\hat{h}$, which as a random map in $H$ is tight. If the sequence $\hat{h}_{n}$ is uniformly tight and satisfies $\mathbb{M}_{n}\left(\hat{h}_{n}\right) \geq \sup _{h} \mathbb{M}_{n}(h)-o_{P}(1)$, then $\hat{h}_{n} \rightsquigarrow \hat{h}$ in $H$.


[^0]:    ${ }^{b}$ Pointwise convergence means convergence for every argument, not convergence almost surely.

[^1]:    \# See the Problems and Appendix A.2.3.

[^2]:    ${ }^{\dagger}$ Shorack and Wellner (1986), page 462.

[^3]:    ${ }^{\ddagger}$ Dudley (1967b), Proposition 6.3.

[^4]:    ${ }^{\text {b }}$ E.g., Chow and Teicher (1978), page 356.

[^5]:    ${ }^{\dagger}$ For some purposes, such as for proving consistency or rates of convergence, particularly in the case of models that are convex in the parameter, it is technically convenient to choose a different function.

