values. This simulation scheme always produces an additional (random) error in the coverage probability of the resulting confidence interval. In principle, by using a sufficiently large number of bootstrap samples, possibly combined with an efficient method of simulation, this error can be made arbitrarily small. Therefore the additional error is usually ignored in the theory of the bootstrap procedure. This chapter follows this custom and concerns the "exact" distribution and quantiles of $\left(\hat{\theta}^{*}-\hat{\theta}\right) / \hat{\sigma}^{*}$, without taking a simulation error into account.

### 23.2 Consistency

A confidence interval $\left[\hat{\theta}_{n, 1}, \hat{\theta}_{n, 2}\right]$ is (conservatively) asymptotically consistent at level 1 -$\alpha-\beta$ if, for every possible $P$,

$$
\liminf _{n \rightarrow \infty} \mathrm{P}\left(\hat{\theta}_{n, 1} \leq \theta \leq \hat{\theta}_{n, 2} \mid P\right) \geq 1-\alpha-\beta
$$

The consistency of a bootstrap confidence interval is closely related to the consistency of the bootstrap estimator of the distribution of $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$. The latter is best defined relative to a metric on the collection of possible laws of the estimator. Call the bootstrap estimator for the distribution consistent relative to the Kolmogorov-Smirnov distance if

$$
\sup _{x}\left|\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq x \right\rvert\, P\right)-\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}^{*}-\hat{\theta}_{n}}{\hat{\sigma}_{n}^{*}} \leq x \right\rvert\, \hat{P}_{n}\right)\right| \xrightarrow{\mathrm{P}} 0 .
$$

It is not a great loss of generality to assume that the sequence $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$ converges in distribution to a continuous distribution function $F$ (in our examples $\Phi$ ). Then consistency relative to the Kolmogorov-Smirnov distance is equivalent to the requirements, for every $x$,

$$
\begin{equation*}
\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq x \right\rvert\, P\right) \rightarrow F(x), \quad \mathrm{P}\left(\left.\frac{\hat{\theta}_{n}^{*}-\hat{\theta}_{n}}{\hat{\sigma}_{n}^{*}} \leq x \right\rvert\, \hat{P}_{n}\right) \xrightarrow{\mathrm{P}} F(x) . \tag{23.2}
\end{equation*}
$$

(See Problem 23.1.) This type of consistency implies the asymptotic consistency of confidence intervals.
23.3 Lemma. Suppose that $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n} \rightsquigarrow T$, and that $\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) / \hat{\sigma}_{n}^{*} \rightsquigarrow T$ given the original observations, in probability, for a random variable $T$ with a continuous distribution function. Then the bootstrap confidence intervals $\left[\hat{\theta}_{n}-\hat{\xi}_{n, \beta} \hat{\sigma}_{n}, \hat{\theta}_{n}-\hat{\xi}_{n, 1-\alpha} \hat{\sigma}_{n}\right]$ are asymptotically consistent at level $1-\alpha-\beta$. If the conditions hold for nonrandom $\hat{\sigma}_{n}=\hat{\sigma}_{n}^{*}$, and $T$ is symmetrically distributed about zero, then the same is true for Efron's percentile intervals.

Proof. Every subsequence has a further subsequence along which the sequence ( $\hat{\theta}_{n}^{*}- \left.\hat{\theta}_{n}\right) / \hat{\sigma}_{n}^{*}$ converges weakly to $T$, conditionally, almost surely. For simplicity, assume that the whole sequence converges almost surely; otherwise, argue along subsequences.

If a sequence of distribution functions $F_{n}$ converges weakly to a distribution function $F$, then the corresponding quantile functions $F_{n}^{-1}$ converge to the quantile function $F^{-1}$ at every continuity point (see Lemma 21.2). Apply this to the (random) distribution functions $\hat{F}_{n}$ of $\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) / \hat{\sigma}_{n}^{*}$ and a continuity point $1-\alpha$ of the quantile function $F^{-1}$ of $T$ to conclude
that $\hat{\xi}_{n, \alpha}=\hat{F}_{n}^{-1}(1-\alpha)$ converges almost surely to $F^{-1}(1-\alpha)$. By Slutsky's lemma, the sequence $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}-\hat{\xi}_{n, \alpha}$ converges weakly to $T-F^{-1}(1-\alpha)$. Thus

$$
\mathrm{P}\left(\theta \geq \hat{\theta}_{n}-\hat{\sigma}_{n} \hat{\xi}_{n, \alpha}\right)=\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq \hat{\xi}_{n, \alpha} \right\rvert\, P\right) \rightarrow \mathrm{P}\left(T \leq F^{-1}(1-\alpha)\right)=1-\alpha .
$$

This argument applies to all except at most countably many $\alpha$. Because both the left and the right sides of the preceding display are monotone functions of $\alpha$ and the right side is continuous, it must be valid for every $\alpha$. The consistency of the bootstrap confidence interval follows.

Efron's percentile interval is the interval $\left[\hat{\zeta}_{n, 1-\beta}, \hat{\zeta}_{n, \alpha}\right]$, where $\left.\hat{\zeta}_{n, \alpha}=\hat{\theta}_{n}+\hat{\xi}_{n, \alpha}\right]$. By the preceding argument,

$$
\mathrm{P}\left(\theta \geq \hat{\zeta}_{n, 1-\beta}\right)=\mathrm{P}\left(\hat{\theta}_{n}-\theta \leq-\hat{\xi}_{n, 1-\beta} \mid P\right) \rightarrow \mathrm{P}\left(T \leq-F^{-1}(\beta)\right)=1-\beta .
$$

The last equality follows by the symmetry of $T$. The consistency follows.
From now on we consider the empirical bootstrap; that is, $\hat{P}_{n}=\mathbb{P}_{n}$ is the empirical distribution of a random sample $X_{1}, \ldots, X_{n}$. We shall establish (23.2) for a large class of statistics, with $F$ the normal distribution. Our method is first to prove the consistency for $\hat{\theta}_{n}$ equal to the sample mean and next to show that the consistency is retained under application of the delta method. Combining these results, we obtain the consistency of many bootstrap procedures, for instance for setting confidence intervals for the correlation coefficient.

In view of Slutsky's lemma, weak convergence of the centered sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ combined with convergence in probability of $\hat{\sigma}_{n} / \sqrt{n}$ yields the weak convergence of the studentized statistics $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$. An analogous statement is true for the bootstrap statistic, for which the convergence in probability of $\hat{\sigma}_{n}^{*} / \sqrt{n}$ must be shown conditionally on the original observations. Establishing (conditional) consistency of $\hat{\sigma}_{n} / \sqrt{n}$ and $\hat{\sigma}_{n}^{*} / \sqrt{n}$ is usually not hard. Therefore, we restrict ourselves to studying the nonstudentized statistics.

Let $\bar{X}_{n}$ be the mean of a sample of $n$ random vectors from a distribution with finite mean vector $\mu$ and covariance matrix $\Sigma$. According to the multivariate central limit theorem, the sequence $\sqrt{n}\left(\bar{X}_{n}-\mu\right)$ is asymptotically normal $N(0, \Sigma)$-distributed. We wish to show the same for $\sqrt{n}\left(\bar{X}_{n}^{*}-\bar{X}_{n}\right)$, in which $\bar{X}_{n}^{*}$ is the average of $n$ observations from $\mathbb{P}_{n}$, that is, of $n$ values resampled from the set of original observations $\left\{X_{1}, \ldots, X_{n}\right\}$ with replacement.
23.4 Theorem (Sample mean). Let $X_{1}, X_{2}, \ldots$ be i.i.d. random vectors with mean $\mu$ and covariance matrix $\Sigma$. Then conditionally on $X_{1}, X_{2}, \ldots$, for almost every sequence $X_{1}, X_{2}, \ldots$,

$$
\sqrt{n}\left(\bar{X}_{n}^{*}-\bar{X}_{n}\right) \rightsquigarrow N(0, \Sigma) .
$$

Proof. For a fixed sequence $X_{1}, X_{2}, \ldots$, the variable $\bar{X}_{n}^{*}$ is the average of $n$ observations $X_{1}^{*}, \ldots, X_{n}^{*}$ sampled from the empirical distribution $\mathbb{P}_{n}$. The (conditional) mean and covariance matrix of these observations are

$$
\begin{aligned}
\mathrm{E}\left(X_{i}^{*} \mid \mathbb{P}_{n}\right) & =\sum_{i=1}^{n} \frac{1}{n} X_{i}=\bar{X}_{n}, \\
\mathrm{E}\left(\left(X_{i}^{*}-\bar{X}_{n}\right)\left(X_{i}^{*}-\bar{X}_{n}\right)^{T} \mid \mathbb{P}_{n}\right) & =\sum_{i=1}^{n} \frac{1}{n}\left(X_{i}-\bar{X}_{n}\right)\left(X_{i}-\bar{X}_{n}\right)^{T} \\
& =\overline{X_{n} X_{n}^{T}}-\bar{X}_{n} \bar{X}_{n}^{T} .
\end{aligned}
$$

By the strong law of large numbers, the conditional covariance converges to $\Sigma$ for almost every sequence $X_{1}, X_{2}, \ldots$.

The asymptotic distribution of $\bar{X}_{n}^{*}$ can be established by the central limit theorem. Because the observations $X_{1}^{*}, \ldots, X_{n}^{*}$ are sampled from a different distribution $\mathbb{P}_{n}$ for every $n$, a central limit theorem for a triangular array is necessary. The Lindeberg central limit theorem, Theorem 2.27, is appropriate. It suffices to show that, for every $\varepsilon>0$,

$$
\mathrm{E}\left\|X_{i}^{*}\right\|^{2} 1\left\{\left\|X_{i}^{*}\right\|>\varepsilon \sqrt{n}\right\}=\frac{1}{n} \sum_{i=1}^{n}\left\|X_{i}\right\|^{2} 1\left\{\left\|X_{i}\right\|>\varepsilon \sqrt{n}\right\} \xrightarrow{\text { as }} 0 .
$$

The left side is smaller than $n^{-1} \sum_{i=1}^{n}\left\|X_{i}\right\|^{2} 1\left\{\left\|X_{i}\right\|>M\right\}$ as soon as $\varepsilon \sqrt{n} \geq M$. By the strong law of large numbers, the latter average converges to $\mathrm{E}\left\|X_{i}\right\|^{2} 1\left\{\left\|X_{i}\right\|>M\right\}$ for almost every sequence $X_{1}, X_{2}, \ldots$. For sufficiently large $M$, this expression is arbitrarily small. Conclude that the limit superior of the left side of the preceding display is smaller than any number $\eta>0$ almost surely and hence the left side converges to zero for almost every sequence $X_{1}, X_{2}, \ldots$.

Assume that $\hat{\theta}_{n}$ is a statistic, and that $\phi$ is a given differentiable map. If the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ converges in distribution, then so does the sequence $\sqrt{n}\left(\phi\left(\hat{\theta}_{n}\right)-\phi(\theta)\right)$, by the delta method. The bootstrap estimator for the distribution of $\phi\left(\hat{\theta}_{n}\right)-\phi(\theta)$ is $\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)$. If the bootstrap is consistent for estimating the distribution of $\hat{\theta}_{n}-\theta$, then it is also consistent for estimating the distribution of $\phi\left(\hat{\theta}_{n}\right)-\phi(\theta)$.
23.5 Theorem (Delta method for bootstrap). Let $\phi: \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ be a measurable map defined and continuously differentiable in a neighborhood of $\theta$. Let $\hat{\theta}_{n}$ be random vectors taking their values in the domain of $\phi$ that converge almost surely to $\theta$. If $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \rightsquigarrow T$, and $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) \rightsquigarrow T$ conditionally almost surely, then both $\sqrt{n}\left(\phi\left(\hat{\theta}_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$ and $\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$, conditionally almost surely.

Proof. By the mean value theorem, the difference $\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)$ can be written as $\phi_{\tilde{\theta}_{n}}^{\prime}\left(\hat{\theta}_{n}^{*}-\right. \left.\hat{\theta}_{n}\right)$ for a point $\tilde{\theta}_{n}$ between $\hat{\theta}_{n}^{*}$ and $\hat{\theta}_{n}$, if the latter two points are in the ball around $\theta$ in which $\phi$ is continuously differentiable. By the continuity of the derivative, there exists for every $\eta>0$ a constant $\delta>0$ such that $\left\|\phi_{\theta^{\prime}}^{\prime} h-\phi_{\theta}^{\prime} h\right\|<\eta\|h\|$ for every $h$ and every $\left\|\theta^{\prime}-\theta\right\| \leq \delta$. If $n$ is sufficiently large, $\delta$ sufficiently small, $\sqrt{n}\left\|\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right\| \leq M$, and $\left\|\hat{\theta}_{n}-\theta\right\| \leq \delta$, then

$$
\begin{aligned}
R_{n}: & =\left\|\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)\right)-\phi_{\theta}^{\prime} \sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right\| \\
& =\left|\left(\phi_{\tilde{\theta}_{n}}^{\prime}-\phi_{\theta}^{\prime}\right) \sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right| \leq \eta M .
\end{aligned}
$$

Fix a number $\varepsilon>0$ and a large number $M$. For $\eta$ sufficiently small to ensure that $\eta M<\varepsilon$,

$$
\mathrm{P}\left(R_{n}>\varepsilon \mid \hat{P}_{n}\right) \leq \mathrm{P}\left(\sqrt{n}\left\|\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right\|>M \text { or }\left\|\hat{\theta}_{n}-\theta\right\|>\delta \mid \hat{P}_{n}\right) .
$$

Because $\hat{\theta}_{n}$ converges almost surely to $\theta$, the right side converges almost surely to $\mathrm{P}(\|T\| \geq M)$ for every continuity point $M$ of $\|T\|$. This can be made arbitrarily small by choice of $M$. Conclude that the left side converges to 0 almost surely. The theorem follows by an application of Slutsky's lemma.
23.6 Example (Sample variance). The (biased) sample variance $S_{n}^{2}=n^{-1} \sum_{i=1}^{n}\left(X_{i}-\right. \left.\bar{X}_{n}\right)^{2}$ equals $\phi\left(\bar{X}_{n}, \overline{X_{n}^{2}}\right)$ for the map $\phi(x, y)=y-x^{2}$. The empirical bootstrap is consistent
for estimation of the distribution of $\left(\bar{X}_{n}, \overline{X_{n}^{2}}\right)-\left(\alpha_{1}, \alpha_{2}\right)$, by Theorem 23.4, provided that the fourth moment of the underlying distribution is finite. The delta method shows that the empirical bootstrap is consistent for estimating the distribution of $S_{n}^{2}-\sigma^{2}$ in that

$$
\sup _{x}\left|\mathrm{P}\left(\sqrt{n}\left(S_{n}^{2}-\sigma^{2}\right) \leq x \mid P\right)-\mathrm{P}\left(\sqrt{n}\left(S_{n}^{* 2}-S_{n}^{2}\right) \leq x \mid \mathbb{P}_{n}\right)\right| \xrightarrow{\text { as }} 0 .
$$

The asymptotic variance of $S_{n}^{2}$ can be estimated by $S_{n}^{4}\left(k_{n}+2\right)$, in which $k_{n}$ is the sample kurtosis. The law of large numbers shows that this estimator is asymptotically consistent. The bootstrap version of this estimator can be shown to be consistent given almost every sequence of the original observations. Thus, the consistency of the empirical bootstrap extends to the studentized statistic $\left(S_{n}^{2}-\sigma^{2}\right) / S_{n}^{2} \sqrt{k_{n}+1}$.

## *23.2.1 Empirical Bootstrap

In this section we follow the same method as previously, but we replace the sample mean by the empirical distribution and the delta method by the functional delta method. This is more involved, but more flexible, and yields, for instance, the consistency of the bootstrap of the sample median.

Let $\mathbb{P}_{n}$ be the empirical distribution of a random sample $X_{1}, \ldots, X_{n}$ from a distribution $P$ on a measurable space ( $\mathcal{X}, \mathcal{A}$ ), and let $\mathcal{F}$ be a Donsker class of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$, as defined in Chapter 19. Given the sample values, let $X_{1}^{*}, \ldots, X_{n}^{*}$ be a random sample from $\mathbb{P}_{n}$. The bootstrap empirical distribution is the empirical measure $\mathbb{P}_{n}^{*}= n^{-1} \sum_{i=1}^{n} \delta_{X_{i}^{*}}$, and the bootstrap empirical process $\mathbb{G}_{n}^{*}$ is

$$
\mathbb{G}_{n}^{*}=\sqrt{n}\left(\mathbb{P}_{n}^{*}-\mathbb{P}_{n}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(M_{n i}-1\right) \delta_{X_{i}},
$$

in which $M_{n i}$ is the number of times that $X_{i}$ is "redrawn" from $\left\{X_{1}, \ldots, X_{n}\right\}$ to form $X_{1}^{*}, \ldots, X_{n}^{*}$. By construction, the vector of counts $\left(M_{n 1}, \ldots, M_{n n}\right)$ is independent of $X_{1}, \ldots, X_{n}$ and multinomially distributed with parameters $n$ and (probabilities) $1 / n, \ldots$, $1 / n$.

If the class $\mathcal{F}$ has a finite envelope function $F$, then both the empirical process $\mathbb{G}_{n}$ and the bootstrap process $\mathbb{G}_{n}^{*}$ can be viewed as maps into the space $\ell^{\infty}(\mathcal{F})$. The analogue of Theorem 23.4 is that the sequence $\mathbb{G}_{n}^{*}$ converges in $\ell^{\infty}(\mathcal{F})$ conditionally in distribution to the same limit as the sequence $\mathbb{G}_{n}$, a tight Brownian bridge process $\mathbb{G}_{P}$. To give a precise meaning to "conditional weak convergence" in $\ell^{\infty}(\mathcal{F})$, we use the bounded Lipschitz metric. It can be shown that a sequence of random elements in $\ell^{\infty}(\mathcal{F})$ converges in distribution to a tight limit in $\ell^{\infty}(\mathcal{F})$ if and only if ${ }^{\dagger}$

$$
\sup _{h \in \mathrm{BL}_{1}\left(\ell^{\infty}(\mathcal{F})\right)} \mid \mathrm{E}^{*} h\left(G_{n}\right)-\mathrm{E} h(G) \rightarrow 0 .
$$

We use the notation $\mathrm{E}_{M}$ to denote "taking the expectation conditionally on $X_{1}, \ldots, X_{n}$," or the expectation with respect to the multinomial vectors $M_{n}$ only. ${ }^{\ddagger}$

[^0]23.7 Theorem (Empirical bootstrap). For every Donsker class $\mathcal{F}$ of measurable functions with finite envelope function $F$,
$$
\sup _{h \in \mathrm{BL}_{1}\left(\ell^{\infty}(\mathcal{F})\right)}\left|\mathrm{E}_{M} h\left(\mathbb{G}_{n}^{*}\right)-\mathrm{E} h\left(\mathbb{G}_{P}\right)\right| \xrightarrow{\mathrm{P}} 0 .
$$

Furthermore, the sequence $\mathbb{G}_{n}^{*}$ is asymptotically measurable. If $P^{*} F^{2}<\infty$, then the convergence is outer almost surely as well.

Next, consider an analogue of Theorem 23.5, using the functional delta method. Theorem 23.5 goes through without too many changes. However, for many infinite-dimensional applications of the delta method the condition of continuous differentiability imposed in Theorem 23.5 fails. This problem may be overcome in several ways. In particular, continuous differentiability is not necessary for the consistency of the bootstrap "in probability" (rather than "almost surely"). Because this appears to be sufficient for statistical applications, we shall limit ourselves to this case.

Consider sequences of maps $\hat{\theta}_{n}$ and $\hat{\theta}_{n}^{*}$ with values in a normed space $\mathbb{D}$ ( e.g., $\ell^{\infty}(\mathcal{F})$ ) such that the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ converges unconditionally in distribution to a tight random element $T$, and the sequence $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)$ converges conditionally given $X_{1}, X_{2}, \ldots$ in distribution to the same random element $T$. A precise formulation of the second is that

$$
\begin{equation*}
\sup _{h \in \mathrm{BL}_{1}(\mathbb{D})}\left|\mathrm{E}_{M} h\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right)-\mathrm{E} h(T)\right| \xrightarrow{\mathrm{P}} 0 . \tag{23.8}
\end{equation*}
$$

Here the notation $\mathrm{E}_{M}$ means the conditional expectation given the original data $X_{1}, X_{2}, \ldots$ and is motivated by the application to the bootstrap empirical distribution. ${ }^{\dagger}$ By the preceding theorem, the empirical distribution $\hat{\theta}_{n}=\mathbb{P}_{n}$ satisfies condition (23.8) if viewed as a map in $\ell^{\infty}(\mathcal{F})$ for a Donsker class $\mathcal{F}$.
23.9 Theorem (Delta method for bootstrap). Let $\mathbb{D}$ be a normed space and let $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{R}^{k}$ be Hadamard differentiable at $\theta$ tangentially to a subspace $\mathbb{D}_{0}$. Let $\hat{\theta}_{n}$ and $\hat{\theta}_{n}^{*}$ be maps with values in $\mathbb{D}_{\phi}$ such that $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \rightsquigarrow T$ and such that (23.8) holds, in which $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)$ is asymptotically measurable and $T$ is tight and takes its values in $\mathbb{D}_{0}$. Then the sequence $\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)\right)$ converges conditionally in distribution to $\phi_{\theta}^{\prime}(T)$, given $X_{1}, X_{2}, \ldots$, in probability.

Proof. By the Hahn-Banach theorem it is not a loss of generality to assume that the derivative $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{R}^{k}$ is defined and continuous on the whole space. For every $h \in \mathrm{BL}_{1}\left(\mathbb{R}^{k}\right)$, the function $h \circ \phi_{\theta}^{\prime}$ is contained in $\mathrm{BL}_{\left\|\phi_{\theta}^{\prime}\right\|}(\mathbb{D})$. Thus (23.8) implies

$$
\sup _{h \in \mathrm{BL}_{1}\left(\mathbb{R}^{k}\right)}\left|\mathrm{E}_{M} h\left(\phi_{\theta}^{\prime}\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right)\right)-\mathrm{E} h\left(\phi_{\theta}^{\prime}(T)\right)\right| \xrightarrow{\mathrm{P}} 0 .
$$

Because $|h(x)-h(y)|$ is bounded by $2 \wedge d(x, y)$ for every $h \in \mathrm{BL}_{1}\left(\mathbb{R}^{k}\right)$,

$$
\begin{align*}
& \sup _{h \in \mathrm{BL}_{1}\left(\mathbb{R}^{k}\right)}\left|\mathrm{E}_{M} h\left(\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)\right)\right)-\mathrm{E}_{M} h\left(\phi_{\theta}^{\prime}\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right)\right)\right| \\
& \quad \leq \varepsilon+2 \mathrm{P}_{M}\left(\left\|\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)\right)-\phi_{\theta}^{\prime}\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right)\right\|>\varepsilon\right) \tag{23.10}
\end{align*}
$$

${ }^{\dagger}$ It is assumed that $h\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right)$ is a measurable function of $M$.

The theorem is proved once it has been shown that the conditional probability on the right converges to zero in outer probability.

The sequence $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}, \hat{\theta}_{n}-\theta\right)$ converges (unconditionally) in distribution to a pair of two independent copies of $T$. This follows, because conditionally given $X_{1}, X_{2}, \ldots$, the second component is deterministic, and the first component converges in distribution to $T$, which is the same for every sequence $X_{1}, X_{2}, \ldots$. Therefore, by the continuousmapping theorem both sequences $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ and $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\theta\right)$ converge (unconditionally) in distribution to separable random elements that concentrate on the linear space $\mathbb{D}_{0}$. By Theorem 20.8,

$$
\begin{aligned}
& \sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi(\theta)\right)=\phi_{\theta}^{\prime}\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\theta\right)\right)+o_{P}^{*}(1) \\
& \sqrt{n}\left(\phi\left(\hat{\theta}_{n}\right)-\phi(\theta)\right)=\phi_{\theta}^{\prime}\left(\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)\right)+o_{P}^{*}(1)
\end{aligned}
$$

Subtract the second from the first equation to conclude that the sequence $\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\right. \left.\phi\left(\hat{\theta}_{n}\right)\right)-\phi_{\theta}^{\prime}\left(\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)\right)$ converges (unconditionally) to 0 in outer probability. Thus, the conditional probability on the right in (23.10) converges to zero in outer mean. This concludes the proof.
23.11 Example (Empirical distribution function). Because the cells $(-\infty, t] \subset \mathbb{R}$ form a Donsker class, the empirical distribution function $\mathbb{F}_{n}$ of a random sample of real-valued variables satisfies the condition of the preceding theorem. Thus, conditionally on $X_{1}, X_{2}, \ldots$, the sequence $\sqrt{n}\left(\phi\left(\mathbb{F}_{n}^{*}\right)-\phi\left(\mathbb{F}_{n}\right)\right)$ converges in distribution to the same limit as $\sqrt{n}\left(\phi\left(\mathbb{F}_{n}\right)-\right. \phi(F))$, for every Hadamard-differentiable function $\phi$.

This includes, among others, quantiles and trimmed means, under the same conditions on the underlying measure $F$ that ensure that empirical quantiles and trimmed means are asymptotically normal. See Lemmas 21.3,22.9, and 22.10.

### 23.3 Higher-Order Correctness

The investigation of the performance of a bootstrap confidence interval can be refined by taking into account the order at which the true level converges to the desired level. A confidence interval is (conservatively) correct at level $1-\alpha-\beta$ up to order $O\left(n^{-k}\right)$ if

$$
\mathrm{P}\left(\hat{\theta}_{n, 1} \leq \theta \leq \hat{\theta}_{n, 2} \mid P\right) \geq 1-\alpha-\beta-O\left(\frac{1}{n^{k}}\right) .
$$

Similarly, the quality of the bootstrap estimator for distributions can be assessed more precisely by the rate at which the Kolmogorov-Smirnov distance between the distribution function of $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$ and the conditional distribution function of $\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) / \hat{\sigma}_{n}^{*}$ converges to zero. We shall see that the percentile $t$-method usually performs better than the percentile method. For the percentile $t$-method, the Kolmogorov-Smirnov distance typically converges to zero at the rate $O_{P}\left(n^{-1}\right)$, whereas the percentile method attains "only" an $O_{P}\left(n^{-1 / 2}\right)$ rate of correctness. The latter is comparable to the error of the normal approximation.

Rates for the Kolmogorov-Smirnov distance translate directly into orders of correctness of one-tailed confidence intervals. The correctness of two-tailed or symmetric confidence intervals may be higher, because of the cancellation of the coverage errors contributed by
the left and right tails. In many cases the percentile method, the percentile $t$-method, and the normal approximation all yield correct two-tailed confidence intervals up to order $O\left(n^{-1}\right)$. Their relative qualities may be studied by a more refined analysis. This must also take into account the length of the confidence intervals, for an increase in length of order $O_{P}\left(n^{-3 / 2}\right)$ may easily reduce the coverage error to the order $O\left(n^{-k}\right)$ for any $k$.

The technical tool to obtain these results are Edgeworth expansions. Edgeworth's classical expansion is a refinement of the central limit theorem that shows the magnitude of the difference between the distribution function of a sample mean and its normal approximation. Edgeworth expansions have subsequently been obtained for many other statistics as well.

An Edgeworth expansion for the distribution function of a statistic $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$ is typically an expansion in increasing powers of $1 / \sqrt{n}$ of the form

$$
\begin{equation*}
\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq x \right\rvert\, P\right)=\Phi(x)+\frac{p_{1}(x \mid P)}{\sqrt{n}} \phi(x)+\frac{p_{2}(x \mid P)}{n} \phi(x)+\cdots \tag{23.12}
\end{equation*}
$$

The remainder is of lower order than the last included term, uniformly in the argument $x$. Thus, in the present case the remainder is $o\left(n^{-1}\right)$ (or even $O\left(n^{-3 / 2}\right)$ ). The functions $p_{i}$ are polynomials in $x$, whose coefficients depend on the underlying distribution, typically through (asymptotic) moments of the pair ( $\hat{\theta}_{n}, \hat{\sigma}_{n}$ ).
23.13 Example (Sample mean). Let $\bar{X}_{n}$ be the mean of a random sample of size $n$, and let $S_{n}^{2}=n^{-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}_{n}\right)^{2}$ be the (biased) sample variance. If $\mu, \sigma^{2}, \lambda$ and $\kappa$ are the mean, variance, skewness and kurtosis of the underlying distribution, then

$$
\begin{aligned}
\mathrm{P}\left(\left.\frac{\bar{X}_{n}-\mu}{\sigma / \sqrt{n}} \leq x \right\rvert\, P\right)= & \Phi(x)-\frac{\lambda\left(x^{2}-1\right)}{6 \sqrt{n}} \phi(x) \\
& -\frac{3 \kappa\left(x^{3}-3 x\right)+\lambda^{2}\left(x^{5}-10 x^{3}+15 x\right)}{72 n} \phi(x)+O\left(\frac{1}{n \sqrt{n}}\right)
\end{aligned}
$$

These are the first two terms of the classical expansion of Edgeworth. If the standard deviation of the observations is unknown, an Edgeworth expansion of the $t$-statistic is of more interest. This takes the form (see [72, pp. 71-73])

$$
\begin{aligned}
& \mathrm{P}\left(\left.\frac{\bar{X}_{n}-\mu}{S_{n} / \sqrt{n}} \leq x \right\rvert\, P\right)=\Phi(x)+\frac{\lambda\left(2 x^{2}+1\right)}{6 \sqrt{n}} \phi(x) \\
& \quad+\frac{3 \kappa\left(x^{3}-3 x\right)-2 \lambda^{2}\left(x^{5}+2 x^{3}-3 x\right)-9\left(x^{3}+3 x\right)}{36 n} \phi(x)+O\left(\frac{1}{n \sqrt{n}}\right)
\end{aligned}
$$

Although the polynomials are different, these expansions are of the same form. Note that the polynomial appearing in the $1 / \sqrt{n}$ term is even in both cases.

These expansions generally fail if the underlying distribution of the observations is discrete. Cramér's condition requires that the modulus of the characteristic function of the observations be bounded away from unity on closed intervals that do not contain the origin. This condition is satisfied if the observations possess a density with respect to Lebesgue measure. Next to Cramér's condition a sufficient number of moments of the observations must exist.
23.14 Example (Studentized quantiles). The $p$ th quantile $F^{-1}(p)$ of a distribution function $F$ may be estimated by the empirical $p$ th quantile $\mathbb{F}_{n}^{-1}(p)$. This is the $r$ th order statistic of the sample for $r$ equal to the largest integer not greater than $n p$. Its mean square error can be computed as

$$
\mathrm{E}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)^{2}=r\binom{n}{r} \int_{0}^{1}\left(F^{-1}(u)-F^{-1}(p)\right)^{2} u^{r-1}(1-u)^{n-r} d u
$$

An empirical estimator $\hat{\sigma}_{n}$ for the mean square error of $\mathbb{F}_{n}^{-1}(p)$ is obtained by replacing $F$ by the empirical distribution function. If the distribution has a differentiable density $f$, then

$$
\mathrm{P}\left(\left.\frac{\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)}{\hat{\sigma}_{n}} \leq x \right\rvert\, F\right)=\Phi(x)+\frac{p_{1}(x \mid F)}{\sqrt{n}} \phi(x)+O\left(\frac{1}{n^{3 / 4}}\right),
$$

where $p_{1}(x \mid F)$ is the polynomial of degree 3 given by (see [72, pp. 318-321])

$$
\begin{aligned}
p_{1}(x \mid F) 12 \sqrt{p(1-p)}= & \frac{3}{\sqrt{\pi}} x^{3}+\left[2-10 p-12 p(1-p) \frac{f^{\prime}}{f^{2}}\left(F^{-1}(p)\right)\right] x^{2} \\
& +\frac{3+6 \sqrt{2}}{\sqrt{\pi}} x-8+4 p-12(r-n p)
\end{aligned}
$$

This expansion is unusual in two respects. First, the remainder is of the order $O\left(n^{-3 / 4}\right)$ rather than of the order $O\left(n^{-1}\right)$. Second, the polynomial appearing in the first term is not even. For this reason several of the conclusions of this section are not valid for sample quantiles. In particular, the order of correctness of all empirical bootstrap procedures is $O_{P}\left(n^{-1 / 2}\right)$, not greater. In this case, a "smoothed bootstrap" based on "resampling" from a density estimator (as in Chapter 24) may be preferable, depending on the underlying distribution.

If the distribution function of $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$ admits an Edgeworth expansion (23.12), then it is immediate that the normal approximation is correct up to order $O(1 / \sqrt{n})$. Evaluation of the expansion at the normal quantiles $z_{\beta}$ and $z_{1-\alpha}$ yields

$$
\begin{aligned}
& \mathrm{P}\left(\hat{\theta}_{n}-z_{\beta} \hat{\sigma}_{n} \leq \theta \leq \hat{\theta}_{n}-z_{1-\alpha} \hat{\sigma}_{n} \mid P\right)=1-\alpha-\beta \\
& \quad+\frac{p_{1}\left(z_{\beta} \mid P\right) \phi\left(z_{\beta}\right)-p_{1}\left(z_{1-\alpha} \mid P\right) \phi\left(z_{1-\alpha}\right)}{\sqrt{n}}+O\left(\frac{1}{n}\right)
\end{aligned}
$$

Thus, the level of the confidence interval $\left[\hat{\theta}_{n}-z_{\beta} \hat{\sigma}_{n}, \hat{\theta}_{n}-z_{1-\alpha} \hat{\sigma}_{n}\right]$ is $1-\alpha-\beta$ up to order $O(1 / \sqrt{n})$. For a two-tailed, symmetric interval, $\alpha$ and $\beta$ are chosen equal. Inserting $z_{\beta}=z_{\alpha}=-z_{1-\alpha}$ in the preceding display, we see that the errors of order $1 / \sqrt{n}$ resulting from the left and right tails cancel each other if $p_{1}$ is an even function. In this common situation the order of correctness improves to $O\left(n^{-1}\right)$.

It is of theoretical interest that the coverage probability can be corrected up to any order by making the normal confidence interval slightly wider than first-order asymptotics would suggest. The interval may be widened by using quantiles $z_{\alpha_{n}}$ with $\alpha_{n}<\alpha$, rather than $z_{\alpha}$. In view of the preceding display, for any $\alpha_{n}$,

$$
\mathrm{P}\left(\hat{\theta}_{n}-z_{\alpha_{n}} \hat{\sigma}_{n} \leq \theta \leq \hat{\theta}_{n}-z_{1-\alpha_{n}} \hat{\sigma}_{n} \mid P\right)=1-2 \alpha_{n}+O\left(\frac{1}{n}\right) .
$$

The $O\left(n^{-1}\right)$ term results from the Edgeworth expansion (23.12) and is universal, independent of the sequence $\alpha_{n}$. For $\alpha_{n}=\alpha-M / n$ and a sufficiently large constant $M$, the right side becomes

$$
1-2 \alpha+\frac{2 M}{n}+O\left(\frac{1}{n}\right) \geq 1-2 \alpha-O\left(\frac{1}{n^{k}}\right) .
$$

Thus, a slight widening of the normal confidence interval yields asymptotically correct (conservative) coverage probabilities up to any order $O\left(n^{-k}\right)$. If $\hat{\sigma}_{n}=O_{P}\left(n^{-1 / 2}\right)$, then the widened interval is $2\left(z_{\alpha_{n}}-z_{\alpha}\right) \hat{\sigma}_{n}=O_{P}\left(n^{-3 / 2}\right)$ wider than the normal confidence interval. This difference is small relatively to the absolute length of the interval, which is $O_{P}\left(n^{-1 / 2}\right)$. Also, the choice of the scale estimator $\hat{\sigma}_{n}$ (which depends on $\hat{\theta}_{n}$ ) influences the width of the interval stronger than replacing $\xi_{\alpha}$ by $\xi_{\alpha_{n}}$.

An Edgeworth expansion usually remains valid in a conditional sense if a good estimator $\hat{P}_{n}$ is substituted for the true underlying distribution $P$. The bootstrap version of expansion (23.12) is

$$
\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}^{*}-\hat{\theta}_{n}}{\hat{\sigma}_{n}^{*}} \leq x \right\rvert\, \hat{P}_{n}\right)=\Phi(x)+\frac{p_{1}\left(x \mid \hat{P}_{n}\right)}{\sqrt{n}} \phi(x)+\frac{p_{2}\left(x \mid \hat{P}_{n}\right)}{n} \phi(x)+\cdots
$$

In this expansion the remainder term is a random variable, which ought to be of smaller order in probability than the last term. In the given expansion the remainder ought to be $o_{P}\left(n^{-1}\right)$ uniformly in $x$. Subtract the bootstrap expansion from the unconditional expansion (23.12) to obtain that

$$
\begin{aligned}
& \sup _{x}\left|\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq x \right\rvert\, P\right)-\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}^{*}-\hat{\theta}_{n}}{\hat{\sigma}_{n}^{*}} \leq x \right\rvert\, \hat{P}_{n}\right)\right| \\
& \quad \leq \sup _{x}\left|\frac{p_{1}(x \mid P)-p_{1}\left(x \mid \hat{P}_{n}\right)}{\sqrt{n}}+\frac{p_{2}(x \mid P)-p_{2}\left(x \mid \hat{P}_{n}\right)}{n}\right| \phi(x)+o_{P}\left(\frac{1}{n}\right) .
\end{aligned}
$$

The polynomials $p_{i}$ typically depend on $P$ in a smooth way, and the difference $\hat{P}_{n}-\hat{P}$ is typically of the order $O_{P}\left(n^{-1 / 2}\right)$. Then the Kolmogorov-Smirnov distance between the true distribution function of $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}$ and its percentile $t$-bootstrap estimator is of the order $O_{P}\left(n^{-1}\right)$.

The analysis of the percentile method starts from an Edgeworth expansion of the distribution function of the unstudentized statistic $\hat{\theta}_{n}-\theta$. This has as leading term the normal distribution with variance $\sigma_{n}^{2}$, the asymptotic variance of $\hat{\theta}_{n}-\theta$, rather than the standard normal distribution. Typically it is of the form

$$
\begin{aligned}
\mathrm{P}\left(\hat{\theta}_{n}-\theta \leq x \mid P\right)= & \Phi\left(\frac{x}{\sigma_{n}}\right)+\frac{1}{\sqrt{n}} q_{1}\left(\left.\frac{x}{\sigma_{n}} \right\rvert\, P\right) \phi\left(\frac{x}{\sigma_{n}}\right) \\
& +\frac{1}{n} q_{2}\left(\left.\frac{x}{\sigma_{n}} \right\rvert\, P\right) \phi\left(\frac{x}{\sigma_{n}}\right)+\cdots
\end{aligned}
$$

The functions $q_{i}$ are polynomials, which are generally different from the polynomials occurring in the Edgeworth expansion for the studentized statistic. The bootstrap version of this expansion is

$$
\begin{aligned}
\mathrm{P}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n} \leq x \mid \hat{P}_{n}\right)= & \Phi\left(\frac{x}{\hat{\sigma}_{n}}\right)+\frac{1}{\sqrt{n}} q_{1}\left(\left.\frac{x}{\hat{\sigma}_{n}} \right\rvert\, \hat{P}_{n}\right) \phi\left(\frac{x}{\hat{\sigma}_{n}}\right) \\
& +\frac{1}{n} q_{2}\left(\left.\frac{x}{\hat{\sigma}_{n}} \right\rvert\, \hat{P}_{n}\right) \phi\left(\frac{x}{\hat{\sigma}_{n}}\right)+\cdots
\end{aligned}
$$

The Kolmogorov-Smirnov distance between the distribution functions on the left in the preceding displays is of the same order as the difference between the leading terms $\Phi\left(x / \sigma_{n}\right)$ $\Phi\left(x / \hat{\sigma}_{n}\right)$ on the right. Because the estimator $\hat{\sigma}_{n}$ is typically not closer than $O_{P}\left(n^{-1 / 2}\right)$ to $\sigma$, this difference may be expected to be at best of the order $O_{P}\left(n^{-1 / 2}\right)$. Thus, the percentile method for estimating a distribution is correct only up to the order $O_{P}\left(n^{-1 / 2}\right)$, whereas the percentile $t$-method is seen to be correct up to the order $O_{P}\left(n^{-1}\right)$.

One-sided bootstrap percentile $t$ and percentile confidence intervals attain orders of correctness that are equal to the orders of correctness of the bootstrap estimators of the distribution functions: $O_{P}\left(n^{-1}\right)$ and $O_{P}\left(n^{-1 / 2}\right)$, respectively. For equal-tailed confidence intervals both methods typically have coverage error of the order $O_{P}\left(n^{-1}\right)$. The decrease in coverage error is due to the cancellation of the errors contributed by the left and right tails, just as in the case of normal confidence intervals. The proofs of these assertions are somewhat technical. The coverage probabilities can be expressed in probabilities of the type

$$
\begin{equation*}
\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq \hat{\xi}_{n, \alpha} \right\rvert\, P\right) . \tag{23.15}
\end{equation*}
$$

Thus we need an Edgeworth expansion of the distribution of $\left(\hat{\theta}_{n}-\theta\right) / \hat{\sigma}_{n}-\hat{\xi}_{n, \alpha}$, or a related quantity. A technical complication is that the random variables $\hat{\xi}_{n, \alpha}$ are only implicitly defined, as the solution of (23.1).

To find the expansions, first evaluate the Edgeworth expansion for $\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) / \hat{\sigma}_{n}^{*}$ at its the upper quantile $\hat{\xi}_{n, \alpha}$ to find that

$$
1-\alpha=\Phi\left(\hat{\xi}_{n, \alpha}\right)+\frac{p_{1}\left(\hat{\xi}_{n, \alpha} \mid \hat{P}_{n}\right) \phi\left(\hat{\xi}_{n, \alpha}\right)}{\sqrt{n}}+O_{P}\left(\frac{1}{n}\right) .
$$

After expanding $\Phi, p_{1}$ and $\phi$ in Taylor series around $z_{\alpha}$, we can invert this equation to obtain the (conditional) Cornish-Fisher expansion

$$
\hat{\xi}_{n, \alpha}=z_{\alpha}-\frac{p_{1}\left(z_{\alpha} \mid P\right)}{\sqrt{n}}+O_{P}\left(\frac{1}{n}\right) .
$$

In general, Cornish-Fisher expansions are asymptotic expansions of quantile functions, much in the same spirit as Edgeworth expansions are expansions of distribution functions. The probability (23.15) can be rewritten

$$
\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}}-O_{P}\left(\frac{1}{n}\right) \leq z_{\alpha}-\frac{p_{1}\left(z_{\alpha} \mid P\right)}{\sqrt{n}} \right\rvert\, P\right) .
$$

For a rigorous derivation it is necessary to characterize the $O_{P}\left(n^{-1}\right)$ term. Informally, this term should only contribute to terms of order $O\left(n^{-1}\right)$ in an Edgeworth expansion. If we just ignore it, then the probability in the preceding display can be expanded with the help of (23.12) as

$$
\Phi\left(z_{\alpha}-\frac{p_{1}\left(z_{\alpha} \mid P\right)}{\sqrt{n}}\right)+\frac{p_{1}\left(z_{\alpha}-n^{-1 / 2} p_{1}\left(z_{\alpha} \mid P\right) \mid P\right)}{\sqrt{n}} \phi\left(z_{\alpha}-\frac{p_{1}\left(z_{\alpha} \mid P\right)}{\sqrt{n}}\right)+O\left(\frac{1}{n}\right) .
$$

The linear term of the Taylor expansion of $\Phi$ cancels the leading term of the Taylor expansion of the middle term. Thus the expression in the last display is equal to $1-\alpha$ up to the order
$O\left(n^{-1}\right)$, whence the coverage error of a percentile $t$-confidence interval is of the order $O\left(n^{-1}\right)$.

For percentile intervals we proceed in the same manner, this time inverting the Edgeworth expansion of the unstudentized statistic. The (conditional) Cornish-Fisher expansion for the quantile $\hat{\xi}_{n, \alpha}$ of $\hat{\theta}_{n}^{*}-\hat{\theta}_{n}$ takes the form

$$
\frac{\hat{\xi}_{n, \alpha}}{\hat{\sigma}_{n}}=z_{\alpha}-\frac{q_{1}\left(z_{\alpha} \mid \hat{P}_{n}\right)}{\sqrt{n}}+O_{P}\left(\frac{1}{n}\right) .
$$

The coverage probabilities of percentile confidence intervals can be expressed in probabilities of the type

$$
\mathrm{P}\left(\hat{\theta}_{n}-\theta \leq \hat{\xi}_{n, \alpha} \mid P\right)=\mathrm{P}\left(\left.\frac{\hat{\theta}_{n}-\theta}{\hat{\sigma}_{n}} \leq \frac{\hat{\xi}_{n, \alpha}}{\hat{\sigma}_{n}} \right\rvert\, P\right) .
$$

Insert the Cornish-Fisher expansion, again neglect the $O_{P}\left(n^{-1}\right)$ term, and use the Edgeworth expansion (23.12) to rewrite this as

$$
\Phi\left(z_{\alpha}-\frac{q_{1}\left(z_{\alpha} \mid P\right)}{\sqrt{n}}\right)+\frac{p_{1}\left(z_{\alpha}-n^{-1 / 2} q_{1}\left(z_{\alpha} \mid P\right) \mid P\right)}{\sqrt{n}} \phi\left(z_{\alpha}-\frac{q_{1}\left(z_{\alpha} \mid P\right)}{\sqrt{n}}\right)+O\left(\frac{1}{n}\right) .
$$

Because $p_{1}$ and $q_{1}$ are different, the cancellation that was found for the percentile $t$-method does not occur, and this is generally equal to $1-\alpha$ up to the order $O\left(n^{-1 / 2}\right)$. Consequently, asymmetric percentile intervals have coverage error of the order $O\left(n^{-1 / 2}\right)$. On the other hand, the coverage probability of the symmetric confidence interval $\left[\hat{\theta}_{n}-\hat{\xi}_{n, \alpha}, \hat{\theta}_{n}-\hat{\xi}_{n, 1-\alpha}\right]$ is equal to the expression in the preceding display minus this expression evaluated for $1-\alpha$ instead of $\alpha$. In the common situation that both polynomials $p_{1}$ and $q_{1}$ are even, the terms of order $O\left(n^{-1 / 2}\right)$ cancel, and the difference is equal to $1-2 \alpha$ up to the order $O\left(n^{-1}\right)$. Then the percentile two-tailed confidence interval has the same order of correctness as the symmetric normal interval and the percentile $t$-intervals.

## Notes

For a wider scope on the applications of the bootstrap, see the book [44], whose first author Efron is the inventor of the bootstrap. Hall [72] gives a detailed treatment of higherorder expansions of a number of bootstrap schemes. For more information concerning the consistency of the empirical bootstrap, and the consistency of the bootstrap under the application of the delta method, see Chapter 3.6 and Section 3.9.3 of [146], or the paper by Giné and Zinn [58].

## PROBLEMS

1. Let $\hat{F}_{n}$ be a sequence of random distribution functions and $F$ a continuous, fixed-distribution function. Show that the following statements are equivalent:
(i) $\hat{F}_{n}(x) \xrightarrow{\mathrm{P}} F(x)$ for every $x$.
(ii) $\sup _{x}\left|\hat{F}_{n}(x)-F(x)\right| \xrightarrow{\mathrm{P}} 0$.
2. Compare in a simulation study Efron's percentile method, the normal approximation in combination with Fisher's transformation, and the percentile method to set a confidence interval for the correlation coefficient.
3. Let $X_{(n)}$ be the maximum of a sample of size $n$ from the uniform distribution on $[0,1]$, and let $X_{(n)}^{*}$ be the maximum of a sample of size $n$ from the empirical distribution $\mathbb{P}_{n}$ of the first sample. Show that $\mathrm{P}\left(X_{(n)}^{*}=X_{(n)} \mid \mathbb{P}_{n}\right) \rightarrow 1-e^{-1}$. What does this mean regarding the consistency of the empirical bootstrap estimator of the distribution of the maximum?
4. Devise a bootstrap scheme for setting confidence intervals for $\beta$ in the linear regression model $Y_{i}=\alpha+\beta x_{i}+e_{i}$. Show consistency.
5. (Parametric bootstrap.) Let $\hat{\theta}_{n}$ be an estimator based on observations from a parametric model $P_{\theta}$ such that $\sqrt{n}\left(\hat{\theta}_{n}-\theta-h_{n} / \sqrt{n}\right)$ converges under $\theta+h_{n} / \sqrt{n}$ to a continuous distribution $L_{\theta}$ for every converging sequence $h_{n}$ and every $\theta$. (This is slightly stronger than regularity as defined in the chapter on asymptotic efficiency.) Show that the parametric bootstrap is consistent: If $\hat{\theta}_{n}^{*}$ is $\hat{\theta}_{n}$ computed from observations obtained from $P_{\hat{\theta}_{n}}$, then $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) \rightsquigarrow L_{\theta}$ conditionally on the original observations, in probability. (The conditional law of $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right)$ is $L_{n, \hat{\theta}}$ if $L_{n, \theta}$ is the distribution of $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ under $\theta$.)
6. Suppose that $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \rightsquigarrow T$ and $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) \rightsquigarrow T$ in probability given the original observations. Show that $\sqrt{n}\left(\phi\left(\hat{\theta}_{n}^{*}\right)-\phi\left(\hat{\theta}_{n}\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$ in probability for every map $\phi$ that is differentiable at $\theta$.
7. Let $U_{n}$ be a $U$-statistic based on a random sample $X_{1}, \ldots, X_{n}$ with kernel $h(x, y)$ such that both $\mathrm{E} h\left(X_{1}, X_{1}\right)$ and $\mathrm{E} h^{2}\left(X_{1}, X_{2}\right)$ are finite. Let $\hat{U}_{n}^{*}$ be the same $U$-statistic based on a sample $X_{1}^{*}, \ldots, X_{n}^{*}$ from the empirical distribution of $X_{1}, \ldots, X_{n}$. Show that $\sqrt{n}\left(\hat{U}_{n}^{*}-U_{n}\right)$ converges conditionally in distribution to the same limit as $\sqrt{n}\left(U_{n}-\theta\right)$, almost surely.
8. Suppose that $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \rightsquigarrow T$ and $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) \rightsquigarrow T$ in probability given the original observations. Show that, unconditionally, $\sqrt{n}\left(\hat{\theta}_{n}-\theta, \hat{\theta}_{n}^{*}-\hat{\theta}_{n}\right) \rightsquigarrow(S, T)$ for independent copies $S$ and $T$ of $T$. Deduce the unconditional limit distribution of $\sqrt{n}\left(\hat{\theta}_{n}^{*}-\theta\right)$.

## 24

## Nonparametric Density <br> Estimation

> This chapter is an introduction to estimating densities if the underlying density of a sample of observations is considered completely unknown, up to existence of derivatives. We derive rates of convergence for the mean square error of kernel estimators and show that these cannot be improved. We also consider regularization by monotonicity.

### 24.1 Introduction

Statistical models are called parametric models if they are described by a Euclidean parameter (in a nice way). For instance, the binomial model is described by a single parameter $p$, and the normal model is given through two unknowns: the mean and the variance of the observations. In many situations there is insufficient motivation for using a particular parametric model, such as a normal model. An alternative at the other end of the scale is a nonparametric model, which leaves the underlying distribution of the observations essentially free. In this chapter we discuss one example of a problem of nonparametric estimation: estimating the density of a sample of observations if nothing is known a priori. From the many methods for this problem, we present two: kernel estimation and monotone estimation. Notwithstanding its simplicity, this method can be fully asymptotically efficient.

### 24.2 Kernel Estimators

The most popular nonparametric estimator of a distribution based on a sample of observations is the empirical distribution, whose properties are discussed at length in Chapter 19. This is a discrete probability distribution and possesses no density. The most popular method of nonparametric density estimation, the kernel method, can be viewed as a recipe to "smooth out" the pointmasses of sizes $1 / n$ in order to turn the empirical distribution into a continuous distribution.

Let $X_{1}, \ldots, X_{n}$ be a random sample from a density $f$ on the real line. If we would know that $f$ belongs to the normal family of densities, then the natural estimate of $f$ would be the normal density with mean $\bar{X}_{n}$ and variance $S_{n}^{2}$, or the function

$$
x \mapsto \frac{1}{S_{n} \sqrt{2 \pi}} e^{-\frac{1}{2}\left(x-\bar{X}_{n}\right)^{2} / S_{n}^{2}}
$$

![](https://cdn.mathpix.com/cropped/ace8bfc0-2627-48f4-a0d2-ce0b82f086dc-014.jpg?height=1386&width=3804&top_left_y=562&top_left_x=907)
Figure 24.1. The kernel estimator with normal kernel and two observations for three bandwidths: small (left), intermediate (center) and large (right). The figures show both the contributions of the two observations separately (dotted lines) and the kernel estimator (solid lines), which is the sum of the two dotted lines.

In this section we suppose that we have no prior knowledge of the form of $f$ and want to "let the data speak as much as possible for themselves."

Let $K$ be a probability density with mean 0 and variance 1 , for instance the standard normal density. A kernel estimator with kernel or window $K$ is defined as

$$
\hat{f}(x)=\frac{1}{n} \sum_{i=1}^{n} \frac{1}{h} K\left(\frac{x-X_{i}}{h}\right) .
$$

Here $h$ is a positive number, still to be chosen, called the bandwidth of the estimator. It turns out that the choice of the kernel $K$ is far less crucial for the quality of $\hat{f}$ as an estimator of $f$ than the choice of the bandwidth. To obtain the best convergence rate the requirement that $K \geq 0$ may have to be dropped.

A kernel estimator is an example of a smoothing method. The construction of a density estimator can be viewed as a recipe for smoothing out the total mass 1 over the real line. Given a random sample of $n$ observations it is reasonable to start with allocating the total mass in packages of size $1 / n$ to the observations. Next a kernel estimator distributes the mass that is allocated to $X_{i}$ smoothly around $X_{i}$, not homogenously, but according to the kernel and bandwidth.

More formally, we can view a kernel estimator as the sum of $n$ small "mountains" given by the functions

$$
x \mapsto \frac{1}{n h} K\left(\frac{x-X_{i}}{h}\right) .
$$

Every small mountain is centred around an observation $X_{i}$ and has area $1 / n$ under it, for any bandwidth $h$. For a small bandwidth the mountain is very concentrated (a peak), while for a large bandwidth the mountain is low and flat. Figure 24.1 shows how the mountains add up to a single estimator. If the bandwidth is small, then the mountains remain separated and their sum is peaky. On the other hand, if the bandwidth is large, then the sum of the individual mountains is too flat. Intermediate values of the bandwidth should give the best results.

Figure 24.2 shows the kernel method in action on a sample from the normal distribution. The solid and dotted lines are the estimator and the true density, respectively. The three pictures give the kernel estimates using three different bandwidths - small, intermediate, and large - each time with the standard normal kernel.

![](https://cdn.mathpix.com/cropped/ace8bfc0-2627-48f4-a0d2-ce0b82f086dc-015.jpg?height=7902&width=3296&top_left_y=687&top_left_x=948)
Figure 24.2. Kernel estimates for the density of a sample of size 15 from the standard normal density for three different bandwidths $h=0: 68$ (left), 1.82 (center), and 4.5 (right), using a normal kernel. The dotted line gives the true density.

A popular criterion to judge the quality of density estimators is the mean integrated square error (MISE), which is defined as

$$
\begin{aligned}
\operatorname{MISE}_{f}(\hat{f}) & =\int \mathrm{E}_{f}(\hat{f}(x)-f(x))^{2} d x \\
& =\int \operatorname{var}_{f} \hat{f}(x) d x+\int\left(\mathrm{E}_{f} \hat{f}(x)-f(x)\right)^{2} d x
\end{aligned}
$$

This is the mean square error $\mathrm{E}_{f}(\hat{f}(x)-f(x))^{2}$ of $\hat{f}(x)$ as an estimator of $f(x)$ integrated over the argument $x$. If the mean integrated square error is small, then the function $\hat{f}$ is close to the function $f$. (We assume that $\hat{f}_{n}$ is jointly measurable to make the mean square error well defined.)

As can be seen from the second representation, the mean integrated square error is the sum of an integrated "variance term" and a "bias term." The mean integrated square error can be small only if both terms are small. We shall show that the two terms are of the orders

$$
\frac{1}{n h}, \quad \text { and } \quad h^{4}
$$

respectively. Then it follows that the variance and the bias terms are balanced for $(n h)^{-1} \sim h^{4}$, which implies an optimal choice of bandwidth equal to $h \sim n^{-1 / 5}$ and yields a mean integrated square error of order $n^{-4 / 5}$.

Informally, these orders follow from simple Taylor expansions. For instance, the bias of $\hat{f}(x)$ can be written

$$
\begin{aligned}
\mathrm{E}_{f} \hat{f}(x)-f(x) & =\int \frac{1}{h} K\left(\frac{x-t}{h}\right) f(t) d t-f(x) \\
& =\int K(y)(f(x-h y)-f(x)) d y
\end{aligned}
$$

Developing $f$ in a Taylor series around $x$ and using that $\int y K(y) d y=0$, we see, informally, that this is equal to

$$
\int y^{2} K(y) d y \frac{1}{2} h^{2} f^{\prime \prime}(x)+\cdots
$$

Thus, the squared bias is of the order $h^{4}$. The variance term can be handled similarly. A precise theorem is as follows.
24.1 Theorem. Suppose that $f$ is twice continuously differentiable with $\int\left|f^{\prime \prime}(x)\right|^{2} d x< \infty$. Furthermore, suppose that $\int y K(y) d y=0$ and that both $\int y^{2} K(y) d y$ and $\int K^{2}(y) d y$ are finite. Then there exists a constant $C_{f}$ such that for small $h>0$

$$
\int \mathrm{E}_{f}(\hat{f}(x)-f(x))^{2} d x \leq C_{f}\left(\frac{1}{n h}+h^{4}\right)
$$

Consequently, for $h_{n} \sim n^{-1 / 5}$, we have $\operatorname{MISE}_{f}\left(\hat{f}_{n}\right)=O\left(n^{-4 / 5}\right)$.

Proof. Because a kernel estimator is an average of $n$ independent random variables, the variance of $\hat{f}(x)$ is $(1 / n)$ times the variance of one term. Hence

$$
\begin{aligned}
\operatorname{var}_{f} \hat{f}(x) & =\frac{1}{n} \operatorname{var}_{f} \frac{1}{h} K\left(\frac{x-X_{1}}{h}\right) \leq \frac{1}{n h^{2}} \mathrm{E}_{f} K^{2}\left(\frac{x-X_{1}}{h}\right) \\
& =\frac{1}{n h} \int K^{2}(y) f(x-h y) d y
\end{aligned}
$$

Take the integral with repect to $x$ on both left and right sides. Because $\int f(x-h y) d x=1$ is the same for every value of $h y$, the right side reduces to $(n h)^{-1} \int K^{2}(y) d y$, by Fubini's theorem. This concludes the proof for the variance term.

To upper bound the bias term we first write the bias $\mathrm{E}_{f} \hat{f}(x)-f(x)$ in the form as given preceding the statement of the theorem. Next we insert the formula

$$
f(x+h)-f(x)=h f^{\prime}(x)+h^{2} \int_{0}^{1} f^{\prime \prime}(x+s h)(1-s) d s
$$

This is a Taylor expansion with the Laplacian representation of the remainder. We obtain

$$
\mathrm{E}_{f} \hat{f}(x)-f(x)=\iint_{0}^{1} K(y)\left[-h y f^{\prime}(x)+(h y)^{2} f^{\prime \prime}(x-s h y)(1-s)\right] d s d y
$$

Because the kernel $K$ has mean zero by assumption, the first term inside the square brackets can be deleted. Using the Cauchy-Schwarz inequality $(\mathrm{E} U V)^{2} \leq \mathrm{E} U^{2} E V^{2}$ on the variables $U=Y$ and $V=Y f^{\prime \prime}(x-S h Y)(1-S)$ for $Y$ distributed with density $K$ and $S$ uniformly distributed on $[0,1]$ independent of $Y$, we see that the square of the bias is bounded above by

$$
h^{4} \int K(y) y^{2} d y \iint_{0}^{1} K(y) y^{2} f^{\prime \prime}(x-s h y)^{2}(1-s)^{2} d s d y
$$

The integral of this with respect to $x$ is bounded above by

$$
h^{4}\left(\int K(y) y^{2} d y\right)^{2} \int f^{\prime \prime}(x)^{2} d x \frac{1}{3}
$$

This concludes the derivation for the bias term.
The last assertion of the theorem is trivial.
The rate $O\left(n^{-4 / 5}\right)$ for the mean integrated square error is not impressive if we compare it to the rate that could be achieved if we knew a priori that $f$ belonged to some parametric family of densities $f_{\theta}$. Then, likely, we would be able to estimate $\theta$ by an estimator such that $\hat{\theta}=\theta+O_{P}\left(n^{-1 / 2}\right)$, and we would expect

$$
\operatorname{MISE}_{\theta}\left(f_{\hat{\theta}}\right)=\int \mathrm{E}_{\theta}\left(f_{\hat{\theta}}(x)-f_{\theta}(x)\right)^{2} d x \sim \mathrm{E}_{\theta}(\hat{\theta}-\theta)^{2}=O\left(\frac{1}{n}\right)
$$

This is a factor $n^{-1 / 5}$ smaller than the mean square error of a kernel estimator.
This loss in efficiency is only a modest price. After all, the kernel estimator works for every density that is twice continuously differentiable whereas the parametric estimator presumably fails miserably if the true density does not belong to the postulated parametric model.

Moreover, the lost factor $n^{-1 / 5}$ can be (almost) covered if we assume that $f$ has sufficiently many derivatives. Suppose that $f$ is $m$ times continuously differentiable. Drop the condition that the kernel $K$ is a probability density, but use a kernel $K$ such that

$$
\begin{gathered}
\int K(y) d y=1, \quad \int y K(y) d y=0, \ldots, \quad \int y^{m-1} K(y) d y=0 \\
\int|y|^{m} K(y) d y<\infty, \quad \int K^{2}(y) d y<\infty
\end{gathered}
$$

Then, by the same arguments as before, the bias term can be expanded in the form

$$
\begin{aligned}
\mathrm{E}_{f} \hat{f}(x)-f(x) & =\int K(y)(f(x-h y)-f(x)) d y \\
& =\int K(y) \frac{1}{m!}(-1)^{m} h^{m} y^{m} f^{(m)}(x) d y+\cdots
\end{aligned}
$$

Thus the squared bias is of the order $h^{2 m}$ and the bias-variance trade-off $(n h)^{-1} \sim h^{2 m}$ is solved for $h \sim n^{1 /(2 m+1)}$. This leads to a mean square error of the order $n^{-2 m /(2 m+1)}$, which approaches the "parametric rate" $n^{-1}$ as $m \rightarrow \infty$. This claim is made precise in the following theorem, whose proof proceeds as before.
24.2 Theorem. Suppose that $f$ is $m$ times continuously differentiable with $\int\left|f^{(m)}(x)\right|^{2} d x<\infty$. Then there exists a constant $C_{f}$ such that for small $h>0$

$$
\int \mathrm{E}_{f}(\hat{f}(x)-f(x))^{2} d x \leq C_{f}\left(\frac{1}{n h}+h^{2 m}\right)
$$

Consequently, for $h_{n} \sim n^{-1 /(2 m+1)}$, we have $\operatorname{MISE}_{f}\left(\hat{f}_{n}\right)=O\left(n^{-2 m /(2 m+1)}\right)$.
In practice, the number of derivatives of $f$ is usually unknown. In order to choose a proper bandwidth, we can use cross-validation procedures. These yield a data-dependent bandwidth and also solve the problem of choosing the constant preceding $h^{-1 /(2 m+1)}$. The combined procedure of density estimator and bandwidth selection is called rate-adaptive if the procedure attains the upper bound $n^{-2 m /(2 m+1)}$ for the mean integrated square error for every $m$.

### 24.3 Rate Optimality

In this section we show that the rate $n^{-2 m /(2 m+1)}$ of a kernel estimator, obtained in Theorem 24.2, is the best possible. More precisely, we prove the following. Inspection of the proof of Theorem 24.2 reveals that the constants $C_{f}$ in the upper bound are uniformly bounded in $f$ such that $\int\left|f^{(m)}(x)\right|^{2} d x$ is uniformly bounded. Thus, letting $\mathcal{F}_{m, M}$ be the class of all probability densities such that this quantity is bounded by $M$, there is a constant $C_{m, M}$ such that the kernel estimator with bandwidth $h_{n}=n^{-1 /(2 m+1)}$ satisfies

$$
\sup _{f \in \mathcal{F}_{m, M}} \mathrm{E}_{f} \int\left(\hat{f}_{n}(x)-f(x)\right)^{2} d x \leq C_{m, M}\left(\frac{1}{n}\right)^{2 m /(2 m+1)}
$$

In this section we show that this upper bound is sharp, and the kernel estimator rate optimal, in that the maximum risk on the left side is bounded below by a similar expression for every density estimator $\hat{f}_{n}$, for every fixed $m$ and $M$.

The proof is based on a construction of subsets $\mathcal{F}_{n} \subset \mathcal{F}_{m, M}$, consisting of $2^{r_{n}}$ functions, with $r_{n}=\left\lfloor n^{1 /(2 m+1)}\right\rfloor$, and on bounding the supremum over $\mathcal{F}_{m, M}$ by the average over $\mathcal{F}_{n}$. Thus the number of elements in the average grows fairly rapidly with $n$. An approach, such as in section 14.5, based on the comparison of $\hat{f}_{n}$ at only two elements of $\mathcal{F}_{m, M}$ does not seem to work for the integrated risk, although such an approach readily yields a lower bound for the maximum risk $\sup _{f} \mathrm{E}_{f}\left(\hat{f}_{n}(x)-f(x)\right)^{2}$ at a fixed $x$.

The subset $\mathcal{F}_{n}$ is indexed by the set of all vectors $\theta \in\{0,1\}^{r_{n}}$ consisting of sequences of $r_{n}$ zeros or ones. For $h_{n}=n^{-1 /(2 m+1)}$, let $x_{n, 1}<x_{n, 2}<\cdots<x_{n, n}$ be a regular grid of meshwidth $2 h_{n}$. For a fixed probability density $f$ and a fixed function $K$ with support $(-1,1)$, define, for every $\theta \in\{0,1\}^{r_{n}}$,

$$
f_{n, \theta}(x)=f(x)+h_{n}^{m} \sum_{j=1}^{r_{n}} \theta_{j} K\left(\frac{x-x_{n, j}}{h_{n}}\right) .
$$

If $f$ is bounded away from zero on an interval containing the grid, $|K|$ is bounded, and $\int K(x) d x=0$, then $f_{n, \theta}$ is a probability density, at least for large $n$. Furthermore,

$$
\int\left|f_{n, \theta}^{(m)}(x)\right|^{2} d x \leq 2 \int\left|f^{(m)}(x)\right|^{2} d x+2 h_{n} r_{n} \int\left|K^{(m)}(x)\right|^{2} d x
$$

It follows that there exist many choices of $f$ and $K$ such that $f_{n, \theta} \in \mathcal{F}_{m, M}$ for every $\theta$.
The following lemma gives a lower bound for the maximum risk over the parameter set $\{0,1\}^{r}$, in an abstract form, applicable to the problem of estimating an arbitrary quantity $\psi(\theta)$ belonging to a metric space (with metric $d$ ). Let $H\left(\theta, \theta^{\prime}\right)=\sum_{i=1}^{r}\left|\theta_{i}-\theta_{i}^{\prime}\right|$ be the Hamming distance on $\{0,1\}^{r}$, which counts the number of positions at which $\theta$ and $\theta^{\prime}$ differ. For two probability measures $P$ and $Q$ with densities $p$ and $q$, write $\|P \wedge Q\|$ for $\int p \wedge q d \mu$.
24.3 Lemma (Assouad). For any estimator $T$ based on an observation in the experiment $\left(P_{\theta}: \theta \in\{0,1\}^{r}\right)$, and any $p>0$,

$$
\max _{\theta} 2^{p} \mathrm{E}_{\theta} d^{p}(T, \psi(\theta)) \geq \min _{H\left(\theta, \theta^{\prime}\right) \geq 1} \frac{d^{p}\left(\psi(\theta), \psi\left(\theta^{\prime}\right)\right)}{H\left(\theta, \theta^{\prime}\right)} \frac{r}{2} \min _{H\left(\theta, \theta^{\prime}\right)=1}\left\|P_{\theta} \wedge P_{\theta^{\prime}}\right\| .
$$

Proof. Define an estimator $S$, taking its values in $\Theta=\{0,1\}^{r}$, by letting $S=\theta$ if $\theta^{\prime} \mapsto d\left(T, \psi\left(\theta^{\prime}\right)\right)$ is minimal over $\Theta$ at $\theta^{\prime}=\theta$. (If the minimum is not unique, choose a point of minimum in any consistent way.) By the triangle inequality, for any $\theta, d(\psi(S), \psi(\theta)) \leq d(\psi(S), T)+d(\psi(\theta), T)$, which is bounded by $2 d(\psi(\theta), T)$, by the definition of $S$. If $d^{p}\left(\psi(\theta), \psi\left(\theta^{\prime}\right)\right) \geq \alpha H\left(\theta, \theta^{\prime}\right)$ for all pairs $\theta \neq \theta^{\prime}$, then

$$
2^{p} \mathrm{E}_{\theta} d^{p}(T, \psi(\theta)) \geq \mathrm{E}_{\theta} d^{p}(\psi(S), \psi(\theta)) \geq \alpha \mathrm{E}_{\theta} H(S, \theta)
$$

The maximum of this expression over $\Theta$ is bounded below by the average, which, apart
from the factor $\alpha$, can be written

$$
\frac{1}{2^{r}} \sum_{\theta} \sum_{j=1}^{r} \mathrm{E}_{\theta}\left|S_{j}-\theta_{j}\right|=\frac{1}{2} \sum_{j=1}^{r}\left(\frac{1}{2^{r-1}} \sum_{\theta: \theta_{j}=0} \int S_{j} d P_{\theta}+\frac{1}{2^{r-1}} \sum_{\theta: \theta_{j}=1} \int\left(1-S_{j}\right) d P_{\theta}\right)
$$

This is minimized over $S$ by choosing $S_{j}$ for each $j$ separately to minimize the $j$ th term in the sum. The expression within brackets is the sum of the error probabilities of a test of

$$
\bar{P}_{0, j}=\frac{1}{2^{r-1}} \sum_{\theta: \theta_{j}=0} P_{\theta}, \quad \text { versus } \quad \bar{P}_{1, j}=\frac{1}{2^{r-1}} \sum_{\theta: \theta_{j}=1} P_{\theta}
$$

Equivalently, it is equal to 1 minus the difference of power and level. In Lemma 14.30 this was seen to be at least $1-\frac{1}{2}\left\|\bar{P}_{0, j}-\bar{P}_{1, j}\right\|=\left\|\bar{P}_{0, j} \wedge \bar{P}_{1, j}\right\|$. Hence the preceding display is bounded below by

$$
\frac{1}{2} \sum_{j=1}^{r}\left\|\bar{P}_{0, j} \wedge \bar{P}_{1, j}\right\|
$$

Because the minimum $\bar{p}_{m} \wedge \bar{q}_{m}$ of two averages of numbers is bounded below by the average $m^{-1} \sum p_{i} \wedge q_{i}$ of the minima, the same is true for the total variation norm of a minimum: $\left\|\bar{P}_{m} \wedge \bar{Q}_{m}\right\| \geq m^{-1} \sum\left\|P_{i} \wedge Q_{i}\right\|$. The $2^{r-1}$ terms $P_{\theta}$ and $P_{\theta^{\prime}}$ in the averages $\bar{P}_{0, j}$ and $\bar{P}_{1, j}$ can be ordered and matched such that each pair $\theta$ and $\theta^{\prime}$ differ only in their $j$ th coordinate. Conclude that the preceding display is bounded below by $\frac{1}{2} \sum_{j=1}^{r} \min \left\|P_{\theta} \wedge P_{\theta^{\prime}}\right\|$, in which the minimum is taken over all pairs $\theta$ and $\theta^{\prime}$ that differ by exactly one coordinate.

We wish to apply Assouad's lemma to the product measures resulting from the densities $f_{n, \theta}$. Then the following inequality, obtained in the proof of Lemma 14.31, is useful. It relates the total variation, affinity, and Hellinger distance of product measures:

$$
\left\|P^{n} \wedge Q^{n}\right\| \geq \frac{1}{2} A^{2}\left(P^{n}, Q^{n}\right)=\frac{1}{2}\left(1-\frac{1}{2} H^{2}(P, Q)\right)^{2 n}
$$

24.4 Theorem. There exists a constant $D_{m, M}$ such that for any density estimator $\hat{f}_{n}$

$$
\sup _{f \in \mathcal{F}_{m, M}} \mathrm{E}_{f} \int\left(\hat{f}_{n}(x)-f(x)\right)^{2} d x \geq D_{m, M}\left(\frac{1}{n}\right)^{2 m /(2 m+1)}
$$

Proof. Because the functions $f_{n, \theta}$ are bounded away from zero and infinity, uniformly in $\theta$, the squared Hellinger distance

$$
\int\left(f_{n, \theta}^{1 / 2}-f_{n, \theta^{\prime}}^{1 / 2}\right)^{2} d x=\int\left(\frac{f_{n, \theta}-f_{n, \theta^{\prime}}}{f_{n, \theta}^{1 / 2}+f_{n, \theta^{\prime}}^{1 / 2}}\right)^{2} d x
$$

is up to constants equal to the squared $L_{2}$-distance between $f_{n, \theta}$ and $f_{n, \theta^{\prime}}$. Because the
functions $K\left(\left(x-x_{n, j}\right) / h_{n}\right)$ have disjoint supports, the latter is equal to

$$
h_{n}^{2 m} \sum_{j=1}^{r_{n}}\left|\theta_{j}-\theta_{j}^{\prime}\right|^{2} \int K^{2}\left(\frac{x-x_{n, j}}{h_{n}}\right) d x=h_{n}^{2 m+1} H\left(\theta, \theta^{\prime}\right) \int K^{2}(x) d x
$$

This is of the order $1 / n$. Inserting this in the lower bound given by Assouad's lemma, with $\psi(\theta)=f_{n, \theta}$ and $d\left(\psi(\theta), \psi\left(\theta^{\prime}\right)\right)$ the $L_{2}$-distance, we find up to a constant the lower bound $h_{n}^{2 m+1}\left(r_{n} / 2\right)(1-O(1 / n))^{2 n}$.

### 24.4 Estimating a Unimodal Density

In the preceding sections the analysis of nonparametric density estimators is based on the assumption that the true density is smooth. This is appropriate for kernel-density estimation, because this is a smoothing method. It is also sensible to place some a priori restriction on the true density, because otherwise we cannot hope to achieve much beyond consistency. However, smoothness is not the only possible restriction. In this section we assume that the true density is monotone, or unimodal. We start with monotone densities and next view a unimodal density as a combination of two monotone pieces.

It is interesting that with monotone densities we can use maximum likelihood as the estimating principle. Suppose that $X_{1}, \ldots, X_{n}$ is a random sample from a Lebesgue density $f$ on $[0, \infty)$ that is known to be nonincreasing. Then the maximum likelihood estimator $\hat{f}_{n}$ is defined as the nonincreasing probability density that maximizes the likelihood

$$
f \mapsto \prod_{i=1}^{n} f\left(X_{i}\right) .
$$

This optimization problem would not have a solution if $f$ were only restricted by possessing a certain number of derivatives, because very high peaks at the observations would yield an arbitrarily large likelihood. However, under monotonicity there is a unique solution.

The solution must necessarily be a left-continuous step function, with steps only at the observations. Indeed, if for a given $f$ the limit from the right at $X_{(i-1)}$ is bigger than the limit from the left at $X_{(i)}$, then we can redistribute the mass on the interval ( $X_{(i-1)}, X_{(i)}$ ] by raising the value $f\left(X_{(i)}\right)$ and lowering $f\left(X_{(i-1)}+\right)$, for instance by setting $f$ equal to the constant value $\left(X_{(i)}-X_{(i-1)}\right)^{-1} \int_{X_{(i-1)}}^{X_{(i)}} f(t) d t$ on the whole interval, resulting in an increase of the likelihood. By the same reasoning we see that the maximum likelihood estimator must be zero on $\left(X_{(n)}, \infty\right)$ (and $(-\infty, 0)$ ). Thus, with $f_{i}=\hat{f}_{n}\left(X_{(i)}\right)$, finding the maximum likelihood estimator reduces to maximizing $\prod_{i=1}^{n} f_{i}$ under the side conditions (with $X_{(0)}=0$ )

$$
\begin{aligned}
& f_{1} \geq f_{2} \geq \cdots \geq f_{n} \geq 0, \\
& \sum_{i=1}^{n} f_{i}\left(X_{(i)}-X_{(i-1)}\right)=1 .
\end{aligned}
$$

This problem has a nice graphical solution. The least concave majorant of the empirical distribution function $\mathbb{F}_{n}$ is defined as the smallest concave function $\hat{F}_{n}$ with $\hat{F}_{n}(x) \geq \mathbb{F}_{n}(x)$ for every $x$. This can be found by attaching a rope at the origin $(0,0)$ and winding this (from above) around the empirical distribution function $\mathbb{F}_{n}$ (Figure 24.3). Because $\hat{F}_{n}$ is

![](https://cdn.mathpix.com/cropped/ace8bfc0-2627-48f4-a0d2-ce0b82f086dc-022.jpg?height=2511&width=3988&top_left_y=548&top_left_x=857)
Figure 24.3. The empirical distribution and its concave majorant of a sample of size 75 from the exponential distribution.

![](https://cdn.mathpix.com/cropped/ace8bfc0-2627-48f4-a0d2-ce0b82f086dc-022.jpg?height=2504&width=3988&top_left_y=3719&top_left_x=864)
Figure 24.4. The derivative of the concave majorant of the empirical distribution and the true density of a sample of size 75 from the exponential distribution.

concave, its derivative is nonincreasing. Figure 24.4 shows the derivative of the concave majorant in Figure 24.3.
24.5 Lemma. The maximum likelihood estimator $\hat{f}_{n}$ is the left derivative of the least concave majorant $\hat{F}_{n}$ of the empirical distribution $\mathbb{F}_{n}$, that is, on each of the intervals $\left(X_{(i-1)}, X_{(i)}\right]$ it is equal to the slope of $\hat{F}_{n}$ on this interval.

Proof. In this proof, let $\hat{f}_{n}$ denote the left derivative of the least concave majorant. We shall show that this maximizes the likelihood. Because the maximum likelihood estimator
is necessarily constant on each interval ( $X_{(i-1)}, X_{(i)}$ ], we may restrict ourselves to densities $f$ with this property. For such an $f$ we can write $\log f=\sum a_{i} 1_{\left[0, X_{(i)}\right]}$ for the constants $a_{i}=\log f_{i} / f_{i+1}$ (with $f_{n+1}=1$ ), and we obtain

$$
\int \log f d \hat{F}_{n}=\sum_{i=1}^{n} a_{i} \hat{F}_{n}\left(X_{(i)}\right) \geq \sum_{i=1}^{n} a_{i} \mathbb{F}_{n}\left(X_{(i)}\right)=\int \log f d \mathbb{F}_{n}
$$

For $f=\hat{f}_{n}$ this becomes an equality. To see this, let $y_{1} \leq y_{2} \leq \cdots$ be the points where $\hat{F}_{n}$ touches $\mathbb{F}_{n}$. Then $\hat{f}_{n}$ is constant on each of the intervals $\left(y_{i-1}, y_{i}\right]$, so that we can write $\log \hat{f}_{n}=\sum b_{i} 1_{\left[0, y_{i}\right]}$, and obtain

$$
\int \log \hat{f}_{n} d \hat{F}_{n}=\sum b_{i} \hat{F}_{n}\left(y_{i}\right)=\sum b_{i} \mathbb{F}_{n}\left(y_{i}\right)=\int \log \hat{f}_{n} d \mathbb{F}_{n}
$$

Third, by the identifiability property of the Kullback-Leibler divergence (see Lemma 5.35), for any probability density $f$,

$$
\int \log \hat{f}_{n} d \hat{F}_{n} \geq \int \log f d \hat{F}_{n}
$$

with strict inequality unless $\hat{f}_{n}=f$. Combining the three displays, we see that $\hat{f}_{n}$ is the unique maximizer of $f \mapsto \int \log f d \mathbb{F}_{n}$.

Maximizing the likelihood is an important motivation for taking the derivative of the concave majorant, but this operation also has independent value. Taking the concave majorant (or convex minorant) of the primitive function of an estimator and next differentiating the result may be viewed as a "smoothing" device, which is useful if the target function is known to be monotone. The estimator $\hat{f}_{n}$ can be viewed as the result of this procedure applied to the "naive" density estimator

$$
\tilde{f}_{n}(x)=\frac{1}{n\left(X_{(i)}-X_{(i-1)}\right)}, \quad x \in\left(X_{(i-1)}, X_{(i)}\right]
$$

This function is very rough and certainly not suitable as an estimator. Its primitive function is the polygon that linearly interpolates the extreme points of the empirical distribution function $\mathbb{F}_{n}$, and its smallest concave majorant coincides with the one of $\mathbb{F}_{n}$. Thus the derivative of the concave majorant of $\tilde{F}_{n}$ is exactly $\hat{f}_{n}$.

Consider the rate of convergence of the maximum likelihood estimator. Is the assumption of monotonicity sufficient to obtain a reasonable performance? The answer is affirmative if a rate of convergence of $n^{1 / 3}$ is considered reasonable. This rate is slower than the rate $n^{m /(2 m+1)}$ of a kernel estimator if $m>1$ derivatives exist and is comparable to this rate given one bounded derivative (even though we have not established a rate under $m=1$ ). The rate of convergence $n^{1 / 3}$ can be shown to be best possible if only monotonicity is assumed. It is achieved by the maximum likelihood estimator.
24.6 Theorem. If the observations are sampled from a compactly supported, bounded, monotone density $f$, then

$$
\int\left(\hat{f}_{n}(x)-f(x)\right)^{2} d x=O_{P}\left(n^{-2 / 3}\right)
$$

Proof. This result is a consequence of a general result on maximum likelihood estimators of densities (e.g., Theorem 3.4.4 in [146].) We shall give a more direct proof using the convexity of the class of monotone densities.

The sequence $\left\|\hat{f}_{n}\right\|_{\infty}=\hat{f}_{n}(0)$ is bounded in probability. Indeed, by the characterization of $\hat{f}_{n}$ as the slope of the concave majorant of $\mathbb{F}_{n}$, we see that $\hat{f}_{n}(0)>M$ if and only if there exists $t>0$ such that $\mathbb{F}_{n}(t)>M t$. The claim follows, because, by concavity, $F(t) \leq f(0) t$ for every $t$, and, by Daniel's theorem ([134, p. 642]),

$$
\mathrm{P}\left(\sup _{t>0} \frac{\mathbb{F}_{n}(t)}{F(t)}>M\right)=\frac{1}{M} .
$$

It follows that the rate of convergence of $\hat{f}_{n}$ is the same as the rate of the maximum likelihood estimator under the restriction that $f$ is bounded by a (large) constant. In the remainder of the proof, we redefine $\hat{f}_{n}$ by the latter estimator.

Denote the true density by $f_{0}$. By the definition of $\hat{f}_{n}$ and the inequality $\log x \leq 2(\sqrt{x}-$ 1),

$$
0 \leq \mathbb{F}_{n} \log \frac{\hat{f}_{n}}{\frac{1}{2} \hat{f}_{n}+\frac{1}{2} f_{0}} \leq 2 \mathbb{F}_{n}\left(\sqrt{\frac{2 \hat{f}_{n}}{\hat{f}_{n}+f_{0}}}-1\right) .
$$

Therefore, we can obtain the rate of convergence of $\hat{f}_{n}$ by an application of Theorem 5.52 or 5.55 with $m_{f}=\sqrt{2 f /\left(f+f_{0}\right)}$.

Because $\left(m_{f}-m_{f_{0}}\right)\left(f_{0}-f\right) \leq 0$ for every $f$ and $f_{0}$ it follows that $F_{0}\left(m_{f}-m_{f_{0}}\right) \leq F\left(m_{f}-m_{f_{0}}\right)$ and hence

$$
F_{0}\left(m_{f}-m_{f_{0}}\right) \leq \frac{1}{2}\left(F_{0}+F\right)\left(m_{f}-m_{f_{0}}\right)=-\frac{1}{2} h^{2}\left(f, \frac{1}{2} f+\frac{1}{2} f_{0}\right) \lesssim-h^{2}\left(f, f_{0}\right),
$$

in which the last inequality is elementary calculus. Thus the first condition of Theorem 5.52 is satisfied relative to the Hellinger distance $h$, with $\alpha=2$.

The map $f \mapsto m_{f}$ is increasing. Therefore, it turns brackets [ $f_{1}, f_{2}$ ] for the functions $x \mapsto f(x)$ into brackets $\left[m_{f_{1}}, m_{f_{2}}\right]$ for the functions $x \mapsto m_{f}(x)$. The squared $L_{2}\left(F_{0}\right)$-size of these brackets satisfies

$$
F_{0}\left(m_{f_{1}}-m_{f_{2}}\right)^{2} \leq 4 h^{2}\left(f_{1}, f_{2}\right) .
$$

It follows that the $L_{2}\left(F_{0}\right)$-bracketing numbers of the class of functions $m_{f}$ can be bounded by the $h$-bracketing numbers of the functions $f$. The latter are the $L_{2}(\lambda)$-bracketing numbers of the functions $\sqrt{f}$, which are monotone and bounded by assumption. In view of Example 19.11,

$$
\log N_{[]}\left(2 \varepsilon,\left\{m_{f}: f \in \mathcal{F}\right\}, L_{2}\left(F_{0}\right)\right) \leq \log N_{[]}\left(\varepsilon, \sqrt{\mathcal{F}}, L_{2}(\lambda)\right) \lesssim \frac{1}{\varepsilon} .
$$

Because the functions $m_{f}$ are uniformly bounded, the maximal inequality Lemma 19.36 gives, with $J(\delta)=\int_{0}^{\delta} \sqrt{1 / \varepsilon} d \varepsilon=2 \sqrt{\delta}$,

$$
\mathrm{E}_{f_{0}} \sup _{h\left(f, f_{0}\right)<\delta}\left|\mathbb{G}_{n}\left(f-f_{0}\right)\right| \lesssim \sqrt{\delta}\left(1+\frac{\sqrt{\delta}}{\delta^{2} \sqrt{n}}\right) .
$$

Therefore, Theorem 5.55 applies with $\phi_{n}(\delta)$ equal to the right side, and the Hellinger distance, and we conclude that $h\left(\hat{f}_{n}, f_{0}\right)=O_{P}\left(n^{-1 / 3}\right)$.

![](https://cdn.mathpix.com/cropped/ace8bfc0-2627-48f4-a0d2-ce0b82f086dc-025.jpg?height=2110&width=3270&top_left_y=569&top_left_x=1223)
Figure 24.5. If $\hat{f}_{n}(x) \leq a$, then a line of slope $a$ moved down vertically from $+\infty$ first hits $\mathbb{F}_{n}$ to the left of $x$. The point where the line hits is the point at which $\mathbb{F}_{n}$ is farthest above the line of slope $a$ through the origin.

The $L_{2}(\lambda)$-distance between uniformly bounded densities is bounded up to a constant by the Hellinger distance, and the theorem follows. $\square$

The most striking known results about estimating a monotone density concern limit distributions of the maximum likelihood estimator, for instance at a point.
24.7 Theorem. If $f$ is differentiable at $x>0$ with derivative $f^{\prime}(x)<0$, then, with $\{\mathbb{Z}(h)$ : $h \in \mathbb{R}\}$ a standard Brownian motion process (two-sided with $\mathbb{Z}(0)=0$ ),

$$
n^{1 / 3}\left(\hat{f}_{n}(x)-f(x)\right) \rightsquigarrow\left|4 f^{\prime}(x) f(x)\right|^{1 / 3} \underset{h \in \mathbb{R}}{\operatorname{argmax}}\left\{\mathbb{Z}(h)-h^{2}\right\} .
$$

Proof. For simplicity we assume that $f$ is continuously differentiable at $x$. Define a stochastic process $\left\{\hat{f}_{n}^{-1}(a): a>0\right\}$ by

$$
\hat{f}_{n}^{-1}(a)=\underset{s \geq 0}{\operatorname{argmax}}\left\{\mathbb{F}_{n}(s)-a s\right\},
$$

in which the largest value is chosen when multiple maximizers exist. The suggestive notation is justified, as the function $\hat{f}_{n}^{-1}$ is the inverse of the maximum likelihood estimator $\hat{f}_{n}$ in that $\hat{f}_{n}(x) \leq a$ if and only if $\hat{f}_{n}^{-1}(a) \leq x$, for every $x$ and $a$. This is explained in Figure 24.5. We first derive the limit distribution of $\hat{f}_{n}^{-1}$. Let $\delta_{n}=n^{-1 / 3}$.

By the change of variable $s \mapsto x+h \delta_{n}$ in the definition of $\hat{f}_{n}^{-1}$, we have

$$
n^{1 / 3}\left(\hat{f}_{n}^{-1} \circ f(x)-x\right)=\underset{h \geq-n^{1 / 3} x}{\operatorname{argmax}}\left\{\mathbb{F}_{n}\left(x+h \delta_{n}\right)-f(x)\left(x+h \delta_{n}\right)\right\} .
$$

Because the location of a maximum does not change by a vertical shift of the whole function, we can drop the term $f(x) x$ in the right side, and we may add a term $\mathbb{F}_{n}(x)$. For the same
reason we may also multiply the process in the right side by $n^{2 / 3}$. Thus the preceding display is equal to the point of maximum $\hat{h}_{n}$ of the process

$$
n^{2 / 3}\left[\left(\mathbb{F}_{n}-F\right)\left(x+h \delta_{n}\right)-\left(\mathbb{F}_{n}-F\right)(x)\right]+n^{2 / 3}\left[F\left(x+h \delta_{n}\right)-F(x)-f(x) h \delta_{n}\right] .
$$

The first term is the local empirical process studied in Example 19.29, and converges in distribution to the process $h \mapsto \sqrt{f(x)} \mathbb{Z}(h)$, for $\mathbb{Z}$ a standard Brownian motion process, in $\ell^{\infty}(K)$, for every compact interval $K$. The second term is a deterministic "drift" process and converges on compacta to $h \mapsto \frac{1}{2} f^{\prime}(x) h^{2}$. This suggests that

$$
n^{1 / 3}\left(\hat{f}_{n}^{-1} \circ f(x)-x\right) \rightsquigarrow \underset{h \in \mathbb{R}}{\operatorname{argmax}}\left\{\sqrt{f(x)} \mathbb{Z}(h)+\frac{1}{2} f^{\prime}(x) h^{2}\right\}
$$

This argument remains valid if we replace $x$ by $x_{n}=x-\delta_{n} b$ throughout, where the limit is the same for every $b \in \mathbb{R}$.

We can write the limit in a more attractive form by using the fact that the processes $h \mapsto \mathbb{Z}(\sigma h)$ and $h \mapsto \sqrt{\sigma} \mathbb{Z}(h)$ are equal in distribution for every $\sigma>0$. First, apply the change of variables $h \mapsto \sigma h$, next pull $\sigma$ out of $\mathbb{Z}(\sigma h)$, then divide the process by $\sqrt{f(x) \sigma}$, and finally choose $\sigma$ such that the quadratic term reduces to $-h^{2}$, that is $\sqrt{f(x) \sigma}=-\frac{1}{2} f^{\prime}(x) \sigma^{2}$. Then we obtain, for every $b \in \mathbb{R}$,

$$
n^{1 / 3}\left(\hat{f}_{n}^{-1} \circ f\left(x-\delta_{n} b\right)-\left(x-\delta_{n} b\right)\right) \rightsquigarrow\left(\frac{\sqrt{f(x)}}{-\frac{1}{2} f^{\prime}(x)}\right)^{2 / 3} \underset{h \in \mathbb{R}}{\operatorname{argmax}}\left\{\mathbb{Z}(h)-h^{2}\right\}
$$

The connection with the limit distribution of $\hat{f}_{n}(x)$ is that

$$
\begin{aligned}
& \mathrm{P}\left(n^{1 / 3}\left(\hat{f}_{n}(x)-f(x)\right) \leq-b f^{\prime}(x)\right)=\mathrm{P}\left(\hat{f}_{n}(x) \leq f\left(x-\delta_{n} b\right)+o(1)\right) \\
& \quad=\mathrm{P}\left(n^{1 / 3}\left(\hat{f}_{n}^{-1} \circ f\left(x-\delta_{n} b\right)-\left(x-\delta_{n} b\right)\right) \leq b\right)+o(1)
\end{aligned}
$$

Combined with the preceding display and simple algebra, this yields the theorem.
The preceding argument can be made rigorous by application of the argmax continuousmapping theorem, Corollary 5.58. The limiting Brownian motion has continuous sample paths, and maxima of Gaussian processes are automatically unique (see, e.g., Lemma 2.6 in [87]). Therefore, we need only check that $\hat{h}_{n}=O_{P}(1)$, for which we apply Theorem 5.52 with

$$
m_{g}=1_{\left[0, x_{n}+g\right]}-1_{\left[0, x_{n}\right]}-f\left(x_{n}\right) g .
$$

(In Theorem 5.52 the function $m_{g}$ can be allowed to depend on $n$, as is clear from its generalization, Theorem 5.55.) By its definition, $\hat{g}_{n}=\delta_{n} \hat{h}_{n}$ maximizes $g \mapsto \mathbb{F}_{n} m_{g}$, whence we wish to show that $\hat{g}_{n}=O_{P}\left(\delta_{n}\right)$. By Example 19.6 the bracketing numbers of the class of functions $\left\{1_{\left[0, x_{n}+g\right]}-1_{\left[0, x_{n}\right]}:|g|<\delta\right\}$ are of the order $\delta / \varepsilon^{2}$; the envelope function $\left|1_{\left[0, x_{n}+\delta\right]}-1_{\left[0, x_{n}\right]}\right|$ has $L_{2}(F)$-norm of the order $\sqrt{f(x) \delta}$. By Corollary 19.35,

$$
\mathrm{E} \sup _{|g|<\delta}\left|\mathbb{G}_{n} m_{g}\right| \lesssim \int_{0}^{\sqrt{\delta}} \sqrt{\log \frac{\delta}{\varepsilon^{2}}} d \varepsilon \lesssim \sqrt{\delta}
$$

By the concavity of $F$, the function $g \mapsto F\left(x_{n}+g\right)-F\left(x_{n}\right)-f\left(x_{n}\right) g$ is nonpositive and nonincreasing as $g$ moves away from 0 in either direction (draw a picture.) Because
$f^{\prime}\left(x_{n}\right) \rightarrow f^{\prime}(x)<0$, there exists a constant $C$ such that, for sufficiently large $n$,

$$
F m_{g}=F\left(x_{n}+g\right)-F\left(x_{n}\right)-f\left(x_{n}\right) g \leq-C\left(g^{2} \wedge|g|\right) .
$$

If we would know already that $\hat{g}_{n} \xrightarrow{\mathrm{P}} 0$, then Theorem 5.52, applied with $\alpha=2$ and $\beta=\frac{1}{2}$, yields that $\hat{g}_{n}=O_{P}\left(\delta_{n}\right)$.

The consistency of $\hat{g}_{n}$ can be shown by a direct argument. By the Glivenko-Cantelli theorem, for every $\varepsilon>0$,

$$
\sup _{|g| \geq \varepsilon} \mathbb{F}_{n} m_{g} \leq \sup _{|g| \geq \varepsilon} F m_{g}+o_{P}(1) \leq-C \inf _{|g| \geq \varepsilon}\left(g^{2} \wedge|g|\right)+o_{P}(1) .
$$

Because the right side is strictly smaller than $0=\mathbb{F}_{n} m_{0}$, the maximizer $\hat{g}_{n}$ must be contained in $[-\varepsilon, \varepsilon]$ eventually.

Results on density estimators at a point are perhaps not of greatest interest, because it is the overall shape of a density that counts. Hence it is interesting that the preceding theorem is also true in an $L_{1}$-sense, in that

$$
n^{1 / 3} \int\left|\hat{f}_{n}(x)-f(x)\right| d x \rightsquigarrow \int\left|4 f^{\prime}(x) f(x)\right|^{1 / 3} d x \underset{h \in \mathbb{R}}{\operatorname{argmax}}\left\{\mathbb{Z}(h)-h^{2}\right\}
$$

This is true for every strictly decreasing, compactly supported, twice continuously differentiable true density $f$. For boundary cases, such as the uniform distribution, the behavior of $\hat{f}_{n}$ is very different. Note that the right side of the preceding display is degenerate. This is explained by the fact that the random variables $n^{1 / 3}\left(\hat{f}_{n}(x)-f(x)\right)$ for different values of $x$ are asymptotically independent, because they are only dependent on the observations $X_{i}$ very close to $x$, so that the integral aggregates a large number of approximately independent variables. It is also known that $n^{1 / 6}$ times the difference between the left side and the right sides converges in distribution to a normal distribution with mean zero and variance not depending on $f$. For uniformly distributed observations, the estimator $\hat{f}_{n}(x)$ remains dependent on all $n$ observations, even asymptotically, and attains a $\sqrt{n}$-rate of convergence (see [62]).

We define a density $f$ on the real line to be unimodal if there exists a number $M_{f}$, such that $f$ is nondecreasing on the interval ( $-\infty, M_{f}$ ] and nondecreasing on [ $M_{f}, \infty$ ). The mode $M_{f}$ need not be unique. Suppose that we observe a random sample from a unimodal density.

If the true mode $M_{f}$ is known a priori, then a natural extension of the preceding discussion is to estimate the distribution function $F$ of the observations by the distribution function $\hat{F}_{n}$ that is the least concave majorant of $\mathbb{F}_{n}$ on the interval $\left[M_{f}, \infty\right)$ and the greatest convex minorant on $\left(-\infty, M_{f}\right]$. Next we estimate $f$ by the derivative $\hat{f}_{n}$ of $\hat{F}_{n}$. Provided that none of the observations takes the value $M_{f}$, this estimator maximizes the likelihood, as can be shown by arguments as before. The limit results on monotone densities can also be extended to the present case. In particular, because the key in the proof of Theorem 24.7 is the characterization of $\hat{f}_{n}$ as the derivative of the concave majorant of $\mathbb{F}_{n}$, this theorem remains true in the unimodal case, with the same limit distribution.

If the mode is not known a priori, then the maximum likelihood estimator does not exist: The likelihood can be maximized to infinity by placing an arbitrary large mode at some fixed observation. It has been proposed to remedy this problem by restricting the likelihood
to densities that have a modal interval of a given length (in which $f$ must be constant and maximal). Alternatively, we could estimate the mode by an independent method and next apply the procedure for a known mode. Both of these possibilities break down unless $f$ possesses some additional properties. A third possibility is to try every possible value $M$ as a mode, calculate the estimator $\hat{f}_{n}^{M}$ for known mode $M$, and select the best fitting one. Here "best" could be operationalized as (nearly) minimizing the Kolmogorov-Smirnov distance $\left\|\hat{F}_{n}^{M}-\mathbb{F}_{n}\right\|_{\infty}$. It can be shown (see [13]) that this procedure renders the effect of the mode being unknown asymptotically negligible, in that

$$
\int\left|\hat{f}_{n}^{\hat{M}}(x)-\hat{f}_{n}^{M_{f}}(x)\right| d x \leq 4\left\|\mathbb{F}_{n}-F\right\|_{\infty}=O_{P}\left(\frac{1}{\sqrt{n}}\right),
$$

up to an arbitrarily small tolerance parameter if $\hat{M}$ only approximately achieves the minimum of $M \mapsto\left\|\hat{F_{n}^{M}}-\mathbb{F}_{n}\right\|_{\infty}$. This extra "error" is of lower order than the rate of convergence $n^{1 / 3}$ of the estimator with a known mode.

## Notes

The literature on nonparametric density estimation, or "smoothing," is large, and there is an equally large literature concerning the parallel problem of nonparametric regression. Next to kernel estimation popular methods are based on classical series approximations, spline functions, and, most recently, wavelet approximation. Besides different methods, a good deal is known concerning other loss functions, for instance $L_{1}$-loss and automatic methods to choose a bandwidth. Most recently, there is a revived interest in obtaining exact constants in minimax bounds, rather than just rates of convergence. See, for instance, [14], [15], [36], [121], [135], [137], and [148] for introductions and further references. The kernel estimator is often named after its pioneers in the 1960s, Parzen and Rosenblatt, and was originally developed for smoothing the periodogram in spectral density estimation.

A lower bound for the maximum risk over Hölder classes for estimating a density at a single point was obtained in [46]. The lower bound for the $L_{2}$-risk is more recent. Birgé [12] gives a systematic study of upper and lower bounds and their relationship to the metric entropy of the model. An alternative for Assouad's lemma is Fano's lemma, which uses the Kullback-Leibler distance and can be found in, for example, [80].

The maximum likelihood estimator for a monotone density is often called the Grenander estimator, after the author who first characterized it in 1956. The very short proof of Lemma 24.5 is taken from [64]. The limit distribution of the Grenander estimator at a point was first obtained by Prakasa Rao in 1969 see [121]. Groeneboom [63] gives a characterization of the limit distribution and other interesting related results.

## PROBLEMS

1. Show, informally, that under sufficient regularity conditions

$$
\operatorname{MISE}_{f}(\hat{f}) \sim \frac{1}{n h} \int K^{2}(y) d y+\frac{1}{4} h^{4} \int f^{\prime \prime}(x)^{2} d x\left(\int y^{2} K(y) d y\right)^{2}
$$

What does this imply for an optimal choice of the bandwidth?
2. Let $X_{1}, \ldots, X_{n}$ be a random sample from the normal distribution with variance 1 . Calculate the mean square error of the estimator $\phi\left(x-\bar{X}_{n}\right)$ of the common density.
3. Using the argument of section 14.5 and a submodel as in section 24.3 , but with $r_{n}=1$, show that the best rate for estimating a density at a fixed point is also $n^{-m /(2 m+1)}$.
4. Using the argument of section 14.5 , show that the rate of convergence $n^{1 / 3}$ of the maximum likelihood estimator for a monotone density is best possible.
5. (Marshall's lemma.) Suppose that $F$ is concave on $[0, \infty)$ with $F(0)=0$. Show that the least concave majorant $\hat{F}_{n}$ of $\mathbb{F}_{n}$ satisfies the inequality $\left\|\hat{F}_{n}-F\right\|_{\infty} \leq\left\|\mathbb{F}_{n}-F\right\|_{\infty}$. What does this imply about the limiting behavior of $\hat{F}_{n}$ ?

## 25

## Semiparametric Models

> This chapter is concerned with statistical models that are indexed by infinite-dimensional parameters. It gives an introduction to the theory of asymptotic efficiency, and discusses methods of estimation and testing.

### 25.1 Introduction

Semiparametric models are statistical models in which the parameter is not a Euclidean vector but ranges over an "infinite-dimensional" parameter set. A different name is "model with a large parameter space." In the situation in which the observations consist of a random sample from a common distribution $P$, the model is simply the set $\mathcal{P}$ of all possible values of $P$ : a collection of probability measures on the sample space. The simplest type of infinite-dimensional model is the nonparametric model, in which we observe a random sample from a completely unknown distribution. Then $\mathcal{P}$ is the collection of all probability measures on the sample space, and, as we shall see and as is intuitively clear, the empirical distribution is an asymptotically efficient estimator for the underlying distribution. More interesting are the intermediate models, which are not "nicely" parametrized by a Euclidean parameter, as are the standard classical models, but do restrict the distribution in an important way. Such models are often parametrized by infinite-dimensional parameters, such as distribution functions or densities, that express the structure under study. Many aspects of these parameters are estimable by the same order of accuracy as classical parameters, and efficient estimators are asymptotically normal. In particular, the model may have a natural parametrization $(\theta, \eta) \mapsto P_{\theta, \eta}$, where $\theta$ is a Euclidean parameter and $\eta$ runs through a nonparametric class of distributions, or some other infinite-dimensional set. This gives a semiparametric model in the strict sense, in which we aim at estimating $\theta$ and consider $\eta$ as a nuisance parameter. More generally, we focus on estimating the value $\psi(P)$ of some function $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ on the model.

In this chapter we extend the theory of asymptotic efficiency, as developed in Chapters 8 and 15, from parametric to semiparametric models and discuss some methods of estimation and testing. Although the efficiency theory (lower bounds) is fairly complete, there are still important holes in the estimation theory. In particular, the extent to which the lower bounds are sharp is unclear. We limit ourselves to parameters that are $\sqrt{n}$-estimable, although in most semiparametric models there are many "irregular" parameters of interest that are outside the scope of "asymptotically normal" theory. Semiparametric testing theory has
little more to offer than the comforting conclusion that tests based on efficient estimators are efficient. Thus, we shall be brief about it.

We conclude this introduction with a list of examples that shows the scope of semiparametric theory. In this description, $X$ denotes a typical observation. Random vectors $Y, Z$, $e$, and $f$ are used to describe the model but are not necessarily observed. The parameters $\theta$ and $v$ are always Euclidean.
25.1 Example (Regression). Let $Z$ and $e$ be independent random vectors and suppose that $Y=\mu_{\theta}(Z)+\sigma_{\theta}(Z) e$ for functions $\mu_{\theta}$ and $\sigma_{\theta}$ that are known up to $\theta$. The observation is the pair $X=(Y, Z)$. If the distribution of $e$ is known to belong to a certain parametric family, such as the family of $N\left(0, \sigma^{2}\right)$-distributions, and the independent variables $Z$ are modeled as constants, then this is just a classical regression model, allowing for heteroscedasticity. Semiparametric versions are obtained by letting the distribution of $e$ range over all distributions on the real line with mean zero, or, alternatively, over all distributions that are symmetric about zero.
25.2 Example (Projection pursuit regression). Let $Z$ and $e$ be independent random vectors and let $Y=\eta\left(\theta^{T} Z\right)+e$ for a function $\eta$ ranging over a set of (smooth) functions, and $e$ having an $N\left(0, \sigma^{2}\right)$-distribution. In this model $\theta$ and $\eta$ are confounded, but the direction of $\theta$ is estimable up to its sign. This type of regression model is also known as a single-index model and is intermediate between the classical regression model in which $\eta$ is known and the nonparametric regression model $Y=\eta(Z)+e$ with $\eta$ an unknown smooth function. An extension is to let the error distribution range over an infinite-dimensional set as well.
25.3 Example (Logistic regression). Given a vector $Z$, let the random variable $Y$ take the value 1 with probability $1 /\left(1+e^{-r(Z)}\right)$ and be 0 otherwise. Let $Z=\left(Z_{1}, Z_{2}\right)$, and let the function $r$ be of the form $r\left(z_{1}, z_{2}\right)=\eta\left(z_{1}\right)+\theta^{T} z_{2}$. Observed is the pair $X=(Y, Z)$. This is a semiparametric version of the logistic regression model, in which the response is allowed to be nonlinear in part of the covariate.
25.4 Example (Paired exponential). Given an unobservable variable $Z$ with completely unknown distribution, let $X=\left(X_{1}, X_{2}\right)$ be a vector of independent exponentially distributed random variables with parameters $Z$ and $Z \theta$. The interest is in the ratio $\theta$ of the conditional hazard rates of $X_{1}$ and $X_{2}$. Modeling the "baseline hazard" $Z$ as a random variable rather than as an unknown constant allows for heterogeneity in the population of all pairs ( $X_{1}, X_{2}$ ), and hence ensures a much better fit than the two-dimensional parametric model in which the value $z$ is a parameter that is the same for every observation.
25.5 Example (Errors-in-variables). The observation is a pair $X=\left(X_{1}, X_{2}\right)$, where $X_{1}= Z+e$ and $X_{2}=\alpha+\beta Z+f$ for a bivariate normal vector ( $e, f$ ) with mean zero and unknown covariance matrix. Thus $X_{2}$ is a linear regression on a variable $Z$ that is observed with error. The distribution of $Z$ is unknown.
25.6 Example (Transformation regression). Suppose that $X=(Y, Z)$, where the random vectors $Y$ and $Z$ are known to satisfy $\eta(Y)=\theta^{T} Z+e$ for an unknown map $\eta$ and independent random vectors $e$ and $Z$ with known or parametrically specified distributions.

The transformation $\eta$ ranges over an infinite-dimensional set, for instance the set of all monotone functions.
25.7 Example (Cox). The observation is a pair $X=(T, Z)$ of a "survival time" $T$ and a covariate $Z$. The distribution of $Z$ is unknown and the conditional hazard function of $T$ given $Z$ is of the form $e^{\theta^{T} Z} \lambda(t)$ for $\lambda$ being a completely unknown hazard function. The parameter $\theta$ has an interesting interpretation in terms of a ratio of hazards. For instance, if the $i$ th coordinate $Z_{i}$ of the covariate is a $0-1$ variable then $e^{\theta_{i}}$ can be interpreted as the ratio of the hazards of two individuals whose covariates are $Z_{i}=1$ and $Z_{i}=0$, respectively, but who are identical otherwise.
25.8 Example (Copula). The observation $X$ is two-dimensional with cumulative distribution function of the form $C_{\theta}\left(G_{1}\left(x_{1}\right), G_{2}\left(x_{2}\right)\right)$, for a parametric family of cumulative distribution functions $C_{\theta}$ on the unit square with uniform marginals. The marginal distribution functions $G_{i}$ may both be completely unknown or one may be known.
25.9 Example (Frailty). Two survival times $Y_{1}$ and $Y_{2}$ are conditionally independent given variables ( $Z, W$ ) with hazard function of the form $W e^{\theta^{T} Z} \lambda(y)$. The random variable $W$ is not observed, possesses a gamma( $\nu, \nu$ ) distribution, and is independent of the variable $Z$ which possesses a completely unknown distribution. The observation is $X=\left(Y_{1}, Y_{2}, Z\right)$. The variable $W$ can be considered an unobserved regression variable in a Cox model.
25.10 Example (Random censoring). A "time of death" $T$ is observed only if death occurs before the time $C$ of a "censoring event" that is independent of $T$; otherwise $C$ is observed. A typical observation $X$ is a pair of a survival time and a $0-1$ variable and is distributed as $(T \wedge C, 1\{T \leq C\})$. The distributions of $T$ and $C$ may be completely unknown.
25.11 Example (Interval censoring). A "death" that occurs at time $T$ is only observed to have taken place or not at a known "check-up time" $C$. The observation is $X=(C, 1\{T \leq C\})$, and $T$ and $C$ are assumed independent with completely unknown or partially specified distributions.
25.12 Example (Truncation). A variable of interest $Y$ is observed only if it is larger than a censoring variable $C$ that is independent of $Y$; otherwise, nothing is observed. A typical observation $X=\left(X_{1}, X_{2}\right)$ is distributed according to the conditional distribution of ( $Y, C$ ) given that $Y>C$. The distributions of $Y$ and $C$ may be completely unknown.

### 25.2 Banach and Hilbert Spaces

In this section we recall some facts concerning Banach spaces and, in particular, Hilbert spaces, which play an important role in this chapter.

Given a probality space ( $\mathcal{X}, \mathcal{A}, P$ ), we denote by $L_{2}(P)$ the set of measurable functions $g: \mathcal{X} \mapsto \mathbb{R}$ with $P g^{2}=\int g^{2} d P<\infty$, where almost surely equal functions are identified. This is a Hilbert space, a complete inner-product space, relative to the inner product
and norm

$$
\left\langle g_{1}, g_{2}\right\rangle=P g_{1} g_{2}, \quad\|g\|=\sqrt{P g^{2}}
$$

Given a Hilbert space $\mathbb{H}$, the projection lemma asserts that for every $g \in \mathbb{H}$ and convex, closed subset $C \subset \mathbb{H}$, there exists a unique element $\Pi g \in C$ that minimizes $c \mapsto\|g-c\|$ over $C$. If $C$ is a closed, linear subspace, then the projection $\Pi g$ can be characterized by the orthogonality relationship

$$
\langle g-\Pi g, c\rangle=0, \quad \text { every } c \in C
$$

The proof is the same as in Chapter 11. If $C_{1} \subset C_{2}$ are two nested, closed subspaces, then the projection onto $C_{1}$ can be found by first projecting onto $C_{2}$ and next onto $C_{1}$. Two subsets $C_{1}$ and $C_{2}$ are orthogonal, notation $C \perp C_{2}$, if $\left\langle c_{1}, c_{2}\right\rangle=0$ for every pair of $c_{i} \in C_{i}$. The projection onto the sum of two orthogonal closed subspaces is the sum of the projections. The orthocomplement $C^{\perp}$ of a set $C$ is the set of all $g \perp C$.

A Banach space is a complete, normed space. The dual space $\mathbb{B}^{*}$ of a Banach space $\mathbb{B}$ is the set of all continuous, linear maps $b^{*}: \mathbb{B} \mapsto \mathbb{R}$. Equivalently, all linear maps such that $\left|b^{*}(b)\right| \leq\left\|b^{*}\right\|\|b\|$ for every $b \in \mathbb{B}$ and some number $\left\|b^{*}\right\|$. The smallest number with this property is denoted by $\left\|b^{*}\right\|$ and defines a norm on the dual space. According to the Riesz representation theorem for Hilbert spaces, the dual of a Hilbert space $\mathbb{H}$ consists of all maps

$$
h \mapsto\left\langle h, h^{*}\right\rangle,
$$

where $h^{*}$ ranges over $\mathbb{H}$. Thus, in this case the dual space $\mathbb{H}^{*}$ can be identified with the space $\mathbb{H}$ itself. This identification is an isometry by the Cauchy-Schwarz inequality $\left|\left\langle h, h^{*}\right\rangle\right| \leq \|h\|\left\|h^{*}\right\|$.

A linear map $A: \mathbb{B}_{1} \mapsto \mathbb{B}_{2}$ from one Banach space into another is continuous if and only if $\left\|A b_{1}\right\|_{2} \leq\|A\|\left\|b_{1}\right\|$ for every $b_{1} \in \mathbb{B}_{1}$ and some number $\|A\|$. The smallest number with this property is denoted by $\|A\|$ and defines a norm on the set of all continuous, linear maps, also called operators, from $\mathbb{B}_{1}$ into $\mathbb{B}_{2}$. Continuous, linear operators are also called "bounded," even though they are only bounded on bounded sets. To every continuous, linear operator $A: \mathbb{B}_{1} \mapsto \mathbb{B}_{2}$ exists an adjoint map $A^{*}: \mathbb{B}_{2}^{*} \mapsto \mathbb{B}_{1}^{*}$ defined by $\left(A^{*} b_{2}^{*}\right) b_{1}=b_{2}^{*} A b_{1}$. This is a continuous, linear operator of the same norm $\left\|A^{*}\right\|=\|A\|$. For Hilbert spaces the dual space can be identified with the original space and then the adjoint of $A: \mathbb{H}_{1} \mapsto \mathbb{H}_{2}$ is a map $A^{*}: \mathbb{H}_{2} \mapsto \mathbb{H}_{1}$. It is characterized by the property

$$
\left\langle A h_{1}, h_{2}\right\rangle_{2}=\left\langle h_{1}, A^{*} h_{2}\right\rangle_{1}, \quad \text { every } h_{1} \in \mathbb{H}_{1}, h_{2} \in \mathbb{H}_{2} .
$$

An operator between Euclidean spaces can be identified with a matrix, and its adjoint with the transpose. The adjoint of a restriction $A_{0}: \mathbb{H}_{1,0} \subset \mathbb{H}_{1} \mapsto \mathbb{H}_{2}$ of $A$ is the composition $\Pi \circ A^{*}$ of the projection $\Pi: \mathbb{H}_{1} \mapsto \mathbb{H}_{1,0}$ and the adjoint of the original $A$.

The range $\mathrm{R}(A)=\left\{A b_{1}: b_{1} \in \mathbb{B}_{1}\right\}$ of a continuous, linear operator is not necessarily closed. By the "bounded inverse theorem" the range of a $1-1$ continuous, linear operator between Banach spaces is closed if and only if its inverse is continuous. In contrast the kernel $\mathrm{N}(A)=\left\{b_{1}: A b_{1}=0\right\}$ of a continuous, linear operator is always closed. For an operator between Hilbert spaces the relationship $\mathrm{R}(A)^{\perp}=\mathrm{N}\left(A^{*}\right)$ follows readily from the
characterization of the adjoint. The range of $A$ is closed if and only if the range of $A^{*}$ is closed if and only if the range of $A^{*} A$ is closed. In that case $R\left(A^{*}\right)=R\left(A^{*} A\right)$.

If $A^{*} A: \mathbb{H}_{1} \mapsto \mathbb{H}_{1}$ is continuously invertible (i.e., is 1-1 and onto with a continuous inverse), then $A\left(A^{*} A\right)^{-1} A^{*}: \mathbb{H}_{2} \mapsto \mathrm{R}(A)$ is the orthogonal projection onto the range of $A$, as follows easily by checking the orthogonality relationship.

### 25.3 Tangent Spaces and Information

Suppose that we observe a random sample $X_{1}, \ldots, X_{n}$ from a distribution $P$ that is known to belong to a set $\mathcal{P}$ of probability measures on the sample space ( $\mathcal{X}, \mathcal{A}$ ). It is required to estimate the value $\psi(P)$ of a functional $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$. In this section we develop a notion of information for estimating $\psi(P)$ given the model $\mathcal{P}$, which extends the notion of Fisher information for parametric models.

To estimate the parameter $\psi(P)$ given the model $\mathcal{P}$ is certainly harder than to estimate this parameter given that $P$ belongs to a submodel $\mathcal{P}_{0} \subset \mathcal{P}$. For every smooth parametric submodel $\mathcal{P}_{0}=\left\{P_{\theta}: \theta \in \Theta\right\} \subset \mathcal{P}$, we can calculate the Fisher information for estimating $\psi\left(P_{\theta}\right)$. Then the information for estimating $\psi(P)$ in the whole model is certainly not bigger than the infimum of the informations over all submodels. We shall simply define the information for the whole model as this infimum. A submodel for which the infimum is taken (if there is one) is called least favorable or a "hardest" submodel.

In most situations it suffices to consider one-dimensional submodels $\mathcal{P}_{0}$. These should pass through the "true" distribution $P$ of the observations and be differentiable at $P$ in the sense of Chapter 7 on local asymptotic normality. Thus, we consider maps $t \mapsto P_{t}$ from a neighborhood of $0 \in[0, \infty)$ to $\mathcal{P}$ such that, for some measurable function $g: \mathcal{X} \mapsto \mathbb{R},^{\dagger}$

$$
\begin{equation*}
\int\left[\frac{d P_{t}^{1 / 2}-d P^{1 / 2}}{t}-\frac{1}{2} g d P^{1 / 2}\right]^{2} \rightarrow 0 \tag{25.13}
\end{equation*}
$$

In other words, the parametric submodel $\left\{P_{t}: 0<t<\varepsilon\right\}$ is differentiable in quadratic mean at $t=0$ with score function $g$. Letting $t \mapsto P_{t}$ range over a collection of submodels, we obtain a collection of score functions, which we call a tangent set of the model $\mathcal{P}$ at $P$ and denote by $\dot{\mathcal{P}}_{P}$. Because $P h^{2}$ is automatically finite, the tangent space can be identified with a subset of $L_{2}(P)$, up to equivalence classes. The tangent set is often a linear space, in which case we speak of a tangent space.

Geometrically, we may visualize the model $\mathcal{P}$, or rather the corresponding set of "square roots of measures" $d P^{1 / 2}$, as a subset of the unit ball of $L_{2}(P)$, and $\dot{\mathcal{P}}_{P}$, or rather the set of all objects $\frac{1}{2} g d P^{1 / 2}$, as its tangent set.

Usually, we construct the submodels $t \mapsto P_{t}$ such that, for every $x$,

$$
g(x)=\frac{\partial}{\partial t}_{\mid t=0} \log d P_{t}(x)
$$

[^1]However, the differentiability (25.13) is the correct definition for defining information, because it ensures a type of local asymptotic normality. The following lemma is proved in the same way as Theorem 7.2.
25.14 Lemma. If the path $t \mapsto P_{t}$ in $\mathcal{P}$ satisfies (25.13), then $P g=0, P g^{2}<\infty$, and

$$
\log \prod_{i=1}^{n} \frac{d P_{1 / \sqrt{n}}}{d P}\left(X_{i}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} g\left(X_{i}\right)-\frac{1}{2} P g^{2}+o_{P}(1) .
$$

For defining the information for estimating $\psi(P)$, only those submodels $t \mapsto P_{t}$ along which the parameter $t \mapsto \psi\left(P_{t}\right)$ is differentiable are of interest. Thus, we consider only submodels $t \mapsto P_{t}$ such that $t \mapsto \psi\left(P_{t}\right)$ is differentiable at $t=0$. More precisely, we define $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ to be differentiable at $P$ relative to a given tangent set $\dot{\mathcal{P}}_{P}$ if there exists a continuous linear map $\dot{\psi}_{P}: L_{2}(P) \mapsto \mathbb{R}^{k}$ such that for every $g \in \dot{\mathcal{P}}_{P}$ and a submodel $t \mapsto P_{t}$ with score function $g$,

$$
\frac{\psi\left(P_{t}\right)-\psi(P)}{t} \rightarrow \dot{\psi}_{P} g .
$$

This requires that the derivative of the map $t \mapsto \psi\left(P_{t}\right)$ exists in the ordinary sense, and also that it has a special representation. (The map $\dot{\psi}_{P}$ is much like a Hadamard derivative of $\psi$ viewed as a map on the space of "square roots of measures.") Our definition is also relative to the submodels $t \mapsto P_{t}$, but we speak of "relative to $\dot{\mathcal{P}}_{P}$ " for simplicity.

By the Riesz representation theorem for Hilbert spaces, the map $\dot{\psi}_{P}$ can always be written in the form of an inner product with a fixed vector-valued, measurable function $\tilde{\psi}_{P}: \mathcal{X} \mapsto \mathbb{R}^{k}$,

$$
\dot{\psi}_{P} g=\left\langle\tilde{\psi}_{P}, g\right\rangle_{P}=\int \tilde{\psi}_{P} g d P
$$

Here the function $\tilde{\psi}_{P}$ is not uniquely defined by the functional $\psi$ and the model $\mathcal{P}$, because only inner products of $\tilde{\psi}_{P}$ with elements of the tangent set are specified, and the tangent set does not span all of $L_{2}(P)$. However, it is always possible to find a candidate $\tilde{\psi}_{P}$ whose coordinate functions are contained in $\varlimsup_{\text {in }} \dot{\mathcal{P}}_{P}$, the closure of the linear span of the tangent set. This function is unique and is called the efficient influence function. It can be found as the projection of any other "influence function" onto the closed linear span of the tangent set.

In the preceding set-up the tangent sets $\dot{\mathcal{P}}_{P}$ are made to depend both on the model $\mathcal{P}$ and the functional $\psi$. We do not always want to use the "maximal tangent set," which is the set of all score functions of differentiable submodels $t \mapsto P_{t}$, because the parameter $\psi$ may not be differentiable relative to it. We consider every subset of a tangent set a tangent set itself.

The maximal tangent set is a cone: If $g \in \dot{\mathcal{P}}_{P}$ and $a \geq 0$, then $a g \in \dot{\mathcal{P}}_{P}$, because the path $t \mapsto P_{a t}$ has score function $a g$ when $t \mapsto P_{t}$ has score function $g$. It is rarely a loss of generality to assume that the tangent set we work with is a cone as well.
25.15 Example (Parametric model). Consider a parametric model with parameter $\theta$ ranging over an open subset $\Theta$ of $\mathbb{R}^{m}$ given by densities $p_{\theta}$ with respect to some measure $\mu$. Suppose that there exists a vector-valued measurable map $\dot{\ell}_{\theta}$ such that, as $h \rightarrow 0$,

$$
\int\left[p_{\theta+h}^{1 / 2}-p_{\theta}^{1 / 2}-\frac{1}{2} h^{T} \dot{\ell}_{\theta} p_{\theta}^{1 / 2}\right]^{2} d \mu=o\left(\|h\|^{2}\right)
$$

Then a tangent set at $P_{\theta}$ is given by the linear space $\left\{h^{T} \dot{\ell}_{\theta}: h \in \mathbb{R}^{m}\right\}$ spanned by the score functions for the coordinates of the parameter $\theta$.

If the Fisher information matrix $I_{\theta}=P_{\theta} \dot{\ell}_{\theta} \dot{\ell}_{\theta}^{T}$ is invertible, then every map $\chi: \Theta \mapsto \mathbb{R}^{k}$ that is differentiable in the ordinary sense as a map between Euclidean spaces is differentiable as a map $\psi\left(P_{\theta}\right)=\chi(\theta)$ on the model relative to the given tangent space. This follows because the submodel $t \mapsto P_{\theta+t h}$ has score $h^{T} \dot{\ell}_{\theta}$ and

$$
\frac{\partial}{\partial t}_{\mid t=0} \chi(\theta+t h)=\dot{\chi}_{\theta} h=P_{\theta}\left[\left(\dot{\chi}_{\theta} I_{\theta}^{-1} \dot{\ell}_{\theta}\right) h^{T} \dot{\ell}_{\theta}\right] .
$$

This equation shows that the function $\tilde{\psi}_{P_{\theta}}=\dot{\chi}_{\theta} I_{\theta}^{-1} \dot{\ell}_{\theta}$ is the efficient influence function. In view of the results of Chapter 8, asymptotically efficient estimator sequences for $\chi(\theta)$ are asymptotically linear in this function, which justifies the name "efficient influence function."
25.16 Example (Nonparametric models). Suppose that $\mathcal{P}$ consists of all probability laws on the sample space. Then a tangent set at $P$ consists of all measurable functions $g$ satisfying $\int g d P=0$ and $\int g^{2} d P<\infty$. Because a score function necessarily has mean zero, this is the maximal tangent set.

It suffices to exhibit suitable one-dimensional submodels. For a bounded function $g$, consider for instance the exponential family $p_{t}(x)=c(t) \exp (\operatorname{tg}(x)) p_{0}(x)$ or, alternatively, the model $p_{t}(x)=(1+\operatorname{tg}(x)) p_{0}(x)$. Both models have the property that, for every $x$,

$$
g(x)=\frac{\partial}{\partial t}{ }_{\mid t=0} \log p_{t}(x)
$$

By a direct calculation or by using Lemma 7.6, we see that both models also have score function $g$ at $t=0$ in the $L_{2}$-sense (25.13). For an unbounded function $g$, these submodels are not necessarily well-defined. However, the models have the common structure $p_{t}(x)= c(t) k(t g(x)) p_{0}(x)$ for a nonnegative function $k$ with $k(0)=k^{\prime}(0)=1$. The function $k(x)=2\left(1+e^{-2 x}\right)^{-1}$ is bounded and can be used with any $g$.
25.17 Example (Cox model). The density of an observation in the Cox model takes the form

$$
(t, z) \mapsto e^{-e^{\theta^{T} z} \Lambda(t)} \lambda(t) e^{\theta^{T} z} p_{Z}(z) .
$$

Differentiating the logarithm of this expression with respect to $\theta$ gives the score function for $\theta$,

$$
z-z e^{\theta^{T} z} \Lambda(t)
$$

We can also insert appropriate parametric models $s \mapsto \lambda_{s}$ and differentiate with respect to $s$. If $a$ is the derivative of $\log \lambda_{s}$ at $s=0$, then the corresponding score for the model for the observation is

$$
a(t)-e^{\theta^{T} z} \int_{[0, t]} a d \Lambda
$$

Finally, scores for the density $p_{Z}$ are functions $b(z)$. The tangent space contains the linear span of all these functions. Note that the scores for $\Lambda$ can be found as an "operator" working on functions $a$.
25.18 Example (Transformation regression model). If the transformation $\eta$ is increasing and $e$ has density $\phi$, then the density of the observation can be written $\phi(\eta(y)- \left.\theta^{T} z\right) \eta^{\prime}(y) p_{Z}(z)$. Scores for $\theta$ and $\eta$ take the forms

$$
-z \frac{\phi^{\prime}}{\phi}\left(\eta(y)-\theta^{T} z\right), \quad \frac{\phi^{\prime}}{\phi}\left(\eta(y)-\theta^{T} z\right) a(y)+\frac{a^{\prime}}{\eta^{\prime}}(y),
$$

where $a$ is the derivative for $\eta$. If the distributions of $e$ and $Z$ are (partly) unknown, then there are additional score functions corresponding to their distributions. Again scores take the form of an operator acting on a set of functions.

To motivate the definition of information, assume for simplicity that the parameter $\psi(P)$ is one-dimensional. The Fisher information about $t$ in a submodel $t \mapsto P_{t}$ with score function $g$ at $t=0$ is $P g^{2}$. Thus, the "optimal asymptotic variance" for estimating the function $t \mapsto \psi\left(P_{t}\right)$, evaluated at $t=0$, is the Cramér-Rao bound

$$
\frac{\left(d \psi\left(P_{t}\right) / d t\right)^{2}}{P g^{2}}=\frac{\left\langle\tilde{\psi}_{P}, g\right\rangle_{P}^{2}}{\langle g, g\rangle_{P}}
$$

The supremum of this expression over all submodels, equivalently over all elements of the tangent set, is a lower bound for estimating $\psi(P)$ given the model $\mathcal{P}$, if the "true measure" is $P$. This supremum can be expressed in the norm of the efficient influence function $\tilde{\psi}_{P}$.
25.19 Lemma. Suppose that the functional $\psi: \mathcal{P} \mapsto \mathbb{R}$ is differentiable at $P$ relative to the tangent set $\dot{\mathcal{P}}_{P}$. Then

$$
\sup _{g \in \operatorname{lin} \dot{\mathcal{P}}_{P}} \frac{\left\langle\tilde{\psi}_{P}, g\right\rangle_{P}^{2}}{\langle g, g\rangle_{P}}=P \tilde{\psi}_{P}^{2}
$$

Proof. This is a consequence of the Cauchy-Schwarz inequality $\left(P \tilde{\psi}_{P} g\right)^{2} \leq P \tilde{\psi}_{P}^{2} P g^{2}$ and the fact that, by definition, the efficient influence function $\tilde{\psi}_{P}$ is contained in the closure of lin $\dot{\mathcal{P}}_{P}$.

Thus, the squared norm $P \tilde{\psi}_{P}^{2}$ of the efficient influence function plays the role of an "optimal asymptotic variance," just as does the expression $\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}$ in Chapter 8. Similar considerations (take linear combinations) show that the "optimal asymptotic covariance" for estimating a higher-dimensional parameter $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ is given by the covariance matrix $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$ of the efficient influence function.

In Chapter 8, we developed three ways to give a precise meaning to optimal asymptotic covariance: the convolution theorem, the almost-everywhere convolution theorem, and the minimax theorem. The almost-everywhere theorem uses the Lebesgue measure on the Euclidean parameter set, and does not appear to have an easy parallel for semiparametric models. On the other hand, the two other results can be generalized.

For every $g$ in a given tangent set $\dot{\mathcal{P}}_{P}$, write $P_{t, g}$ for a submodel with score function $g$ along which the function $\psi$ is differentiable. As usual, an estimator $T_{n}$ is a measurable function $T_{n}\left(X_{1}, \ldots, X_{n}\right)$ of the observations. An estimator sequence $T_{n}$ is called regular at $P$ for estimating $\psi(P)$ (relative to $\dot{\mathcal{P}}_{P}$ ) if there exists a probability measure $L$ such that

$$
\sqrt{n}\left(T_{n}-\psi\left(P_{1 / \sqrt{n}, g}\right)\right) \stackrel{P_{1 / \sqrt{n}, g}}{\hookrightarrow} L, \quad \text { every } g \in \dot{\mathcal{P}}_{P}
$$

25.20 Theorem (Convolution). Let the function $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ be differentiable at $P$ relative to the tangent cone $\dot{\mathcal{P}}_{P}$ with efficient influence function $\tilde{\psi}_{P}$. Then the asymptotic covariance matrix of every regular sequence of estimators is bounded below by $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$. Furthermore, if $\dot{\mathcal{P}}_{P}$ is a convex cone, then every limit distribution $L$ of a regular sequence of estimators can be written $L=N\left(0, P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}\right) * M$ for some probability distribution $M$.
25.21 Theorem (LAM). Let the function $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ be differentiable at $P$ relative to the tangent cone $\dot{\mathcal{P}}_{P}$ with efficient influence function $\tilde{\psi}_{P}$. If $\dot{\mathcal{P}}_{P}$ is a convex cone, then, for any estimator sequence $\left\{T_{n}\right\}$ and subconvex function $\ell: \mathbb{R}^{k} \mapsto[0, \infty)$,

$$
\sup _{I} \liminf _{n \rightarrow \infty} \sup _{g \in I} \mathrm{E}_{P_{1 / \sqrt{n}, g}} \ell\left(\sqrt{n}\left(T_{n}-\psi\left(P_{1 / \sqrt{n}, g)}\right)\right)\right) \geq \int \ell d N\left(0, P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}\right) .
$$

Here the first supremum is taken over all finite subsets I of the tangent set.
Proofs. These results follow essentially by applying the corresponding theorems for parametric models to sufficiently rich finite-dimensional submodels. However, because we have defined the tangent set using one-dimensional submodels $t \mapsto P_{t, g}$, it is necessary to rework the proofs a little.

Assume first that the tangent set is a linear space, and fix an orthonormal base $g_{P}= \left(g_{1}, \ldots, g_{m}\right)^{T}$ of an arbitrary finite-dimensional subspace. For every $g \in \operatorname{lin} g_{P}$ select a submodel $t \mapsto P_{t, g}$ as used in the statement of the theorems. Each of the submodels $t \mapsto P_{t, g}$ is locally asymptotically normal at $t=0$ by Lemma 25.14. Therefore, because the covariance matrix of $g_{P}$ is the identity matrix,

$$
\left(P_{1 / \sqrt{n}, h^{T} g_{P}}^{n}: h \in \mathbb{R}^{m}\right) \rightsquigarrow\left(N_{m}(h, I): h \in \mathbb{R}^{m}\right)
$$

in the sense of convergence of experiments. The function $\psi_{n}(h)=\psi\left(P_{1 / \sqrt{n}, h^{T} g_{P}}\right)$ satisfies

$$
\sqrt{n}\left(\psi_{n}(h)-\psi_{n}(0)\right) \rightarrow \dot{\psi}_{P} h^{T} g_{P}=\left(P \tilde{\psi}_{P} g_{P}^{T}\right) h=: A h .
$$

For the same $(k \times m)$ matrix the function $A g_{P}$ is the orthogonal projection of $\tilde{\psi}_{P}$ onto lin $g_{P}$, and it has covariance matrix $A A^{T}$. Because $\tilde{\psi}_{P}$ is, by definition, contained in the closed linear span of the tangent set, we can choose $g_{P}$ such that $\tilde{\psi}_{P}$ is arbitrarily close to its projection and hence $A A^{T}$ is arbitrarily close to $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$.

Under the assumption of the convolution theorem, the limit distribution of the sequence $\sqrt{n}\left(T_{n}-\psi_{n}(h)\right)$ under $P_{1 / \sqrt{n}, h^{T} g_{P}}$ is the same for every $h \in \mathbb{R}^{m}$. By the asymptotic representation theorem, Proposition 7.10, there exists a randomized statistic $T$ in the limit experiment such that the distribution of $T-A h$ under $h$ does not depend on $h$. By Proposition 8.4, the null distribution of $T$ contains a normal $N\left(0, A A^{T}\right)$-distribution as a convolution factor. The proof of the convolution theorem is complete upon letting $A A^{T}$ tend to $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$.

Under the assumption that the sequence $\sqrt{n}\left(T_{n}-\psi(P)\right)$ is tight, the minimax theorem is proved similarly, by first bounding the left side by the minimax risk relative to the submodel corresponding to $g_{P}$, and next applying Proposition 8.6. The tightness assumption can be dropped by a compactification argument. (see, e.g., [139], or [146]).

If the tangent set is a convex cone but not a linear space, then the submodel constructed previously can only be used for $h$ ranging over a convex cone in $\mathbb{R}^{m}$. The argument can
remain the same, except that we need to replace Propositions 8.4 and 8.6 by stronger results that refer to convex cones. These extensions exist and can be proved by the same Bayesian argument, now choosing priors that flatten out inside the cone (see, e.g., [139]).

If the tangent set is a cone that is not convex, but the estimator sequence is regular, then we use the fact that the matching randomized estimator $T$ in the limit experiment satisfies $\mathrm{E}_{h} T=A h+\mathrm{E}_{0} T$ for every eligible $h$, that is, every $h$ such that $h^{T} g_{P} \in \dot{\mathcal{P}}_{P}$. Because the tangent set is a cone, the latter set includes parameters $h=t h_{i}$ for $t \geq 0$ and directions $h_{i}$ spanning $\mathbb{R}^{m}$. The estimator $T$ is unbiased for estimating $A h+\mathrm{E}_{0} T$ on this parameter set, whence the covariance matrix of $T$ is bounded below by $A A^{T}$, by the Cramér-Rao inequality.

Both theorems have the interpretation that the matrix $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$ is an optimal asymptotic covariance matrix for estimating $\psi(P)$ given the model $P$. We might wish that this could be formulated in a simpler fashion, but this is precluded by the problem of superefficiency, as is already the case for the parametric analogues, discussed in Chapter 8. That the notion of asymptotic efficiency used in the present interpretation should not be taken absolutely is shown by the shrinkage phenomena discussed in section 8.8 , but we use it in this chapter. We shall say that an estimator sequence is asymptotically efficient at $P$, if it is regular at $P$ with limit distribution $L=N\left(0, P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}\right) .^{\dagger}$

The efficient influence function $\tilde{\psi}_{P}$ plays the same role as the normalized score function $I_{\theta}^{-1} \dot{\ell}_{\theta}$ in parametric models. In particular, a sequence of estimators $T_{n}$ is asymptotically efficient at $P$ if

$$
\begin{equation*}
\sqrt{n}\left(T_{n}-\psi(P)\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \tilde{\psi}_{P}\left(X_{i}\right)+o_{P}(1) \tag{25.22}
\end{equation*}
$$

This justifies the name "efficient influence function."
25.23 Lemma. Let the function $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ be differentiable at $P$ relative to the tangent cone $\dot{\mathcal{P}}_{P}$ with efficient influence function $\tilde{\psi}_{P}$. A sequence of estimators $T_{n}$ is regular at $P$ with limiting distribution $N\left(0, P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}\right)$ if and only if it satisfies (25.22).

Proof. Because the submodels $t \mapsto P_{t, g}$ are locally asymptotically normal at $t=0$, "if" follows with the help of Le Cam's third lemma, by the same arguments as for the analogous result for parametric models in Lemma 8.14.

To prove the necessity of (25.22), we adopt the notation of the proof of Theorem 25.20. The statistics $S_{n}=\psi(P)+n^{-1} \sum_{i=1}^{n} \tilde{\psi}_{P}\left(X_{i}\right)$ depend on $P$ but can be considered a true estimator sequence in the local subexperiments. The sequence $S_{n}$ trivially satisfies (25.22) and hence is another asymptotically efficient estimator sequence. We may assume for simplicity that the sequence $\sqrt{n}\left(S_{n}-\psi\left(P_{1 / \sqrt{n}, g}\right), T_{n}-\psi\left(P_{1 / \sqrt{n}, g}\right)\right)$ converges under every local parameter $g$ in distribution. Otherwise, we argue along subsequences, which can be

[^2]selected with the help of Le Cam's third lemma. By Theorem 9.3, there exists a matching randomized estimator $(S, T)=(S, T)(X, U)$ in the normal limit experiment. By the efficiency of both sequences $S_{n}$ and $T_{n}$, the variables $S-A h$ and $T-A h$ are, under $h$, marginally normally distributed with mean zero and covariance matrix $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$. In particular, the expectations $\mathrm{E}_{h} S=\mathrm{E}_{h} T$ are identically equal to $A h$. Differentiate with respect to $h$ at $h=0$ to find that
$$
\mathrm{E}_{0} S X^{T}=\mathrm{E}_{0} T X^{T}=A .
$$

It follows that the orthogonal projections of $S$ and $T$ onto the linear space spanned by the coordinates of $X$ are identical and given by $\Pi S=\Pi T=A X$, and hence

$$
\operatorname{Cov}_{0}(S-T)=\operatorname{Cov}_{0}\left(\Pi^{\perp} S-\Pi^{\perp} T\right) \leq 2 \operatorname{Cov}_{0} \Pi^{\perp} S+2 \operatorname{Cov}_{0} \Pi^{\perp} T .
$$

(The inequality means that the difference of the matrices on the right and the left is nonnegative-definite.) We have obtained this for a fixed orthonormal set $g_{P}=\left(g_{1}, \ldots, g_{m}\right)$. If we choose $g_{P}$ such that $A A^{T}$ is arbitrarily close to $P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}$, equivalently $\operatorname{Cov}_{0} \Pi T= A A^{T}=\operatorname{Cov}_{0} \Pi S$ is arbitrarily close to $\operatorname{Cov}_{0} T=P \tilde{\psi}_{P} \tilde{\psi}_{P}^{T}=\operatorname{Cov}_{0} S$, and then the right side of the preceding display is arbitrarily close to zero, whence $S-T \approx 0$. The proof is complete on noting that $\sqrt{n}\left(S_{n}-T_{n}\right) \stackrel{0}{v} S-T$.
25.24 Example (Empirical distribution). The empirical distribution is an asymptotically efficient estimator if the underlying distribution $P$ of the sample is completely unknown. To give a rigorous expression to this intuitively obvious statement, fix a measurable function $f: \mathcal{X} \mapsto \mathbb{R}$ with $P f^{2}<\infty$, for instance an indicator function $f=1_{A}$, and consider $\mathbb{P}_{n} f=n^{-1} \sum_{i=1}^{n} f\left(X_{i}\right)$ as an estimator for the function $\psi(P)=P f$.

In Example 25.16 it is seen that the maximal tangent space for the nonparametric model is equal to the set of all $g \in L_{2}(P)$ such that $P g=0$. For a general function $f$, the parameter $\psi$ may not be differentiable relative to the maximal tangent set, but it is differentiable relative to the tangent space consisting of all bounded, measurable functions $g$ with $P g=0$. The closure of this tangent space is the maximal tangent set, and hence working with this smaller set does not change the efficient influence functions. For a bounded function $g$ with $P f=0$ we can use the submodel defined by $d P_{t}=(1+t g) d P$, for which $\psi\left(P_{t}\right)=P f+t P f g$. Hence the derivative of $\psi$ is the map $g \mapsto \dot{\psi}_{P} g=P f g$, and the efficient influence function relative to the maximum tangent set is the function $\tilde{\psi}_{P}=f-P f$. (The function $f$ is an influence function; its projection onto the mean zero functions is $f-P f$.)

The optimal asymptotic variance for estimating $P \mapsto P f$ is equal to $P \tilde{\psi}_{P}^{2}=P(f- P f)^{2}$. The sequence of empirical estimators $\mathbb{P}_{n} f$ is asymptotically efficient, because it satisfies (25.22), with the $o_{P}(1)$-remainder term identically zero.

### 25.4 Efficient Score Functions

A function $\psi(P)$ of particular interest is the parameter $\theta$ in a semiparametric model $\left\{P_{\theta, \eta}: \theta \in \Theta, \eta \in H\right\}$. Here $\Theta$ is an open subset of $\mathbb{R}^{k}$ and $H$ is an arbitrary set, typically of infinite dimension. The information bound for the functional of interest $\psi\left(P_{\theta, \eta}\right)=\theta$ can be conveniently expressed in an "efficient score function."

As submodels, we use paths of the form $t \mapsto P_{\theta+t a, \eta_{t}}$, for given paths $t \mapsto \eta_{t}$ in the parameter set $H$. The score functions for such submodels (if they exist) typically have the form of a sum of "partial derivatives" with respect to $\theta$ and $\eta$. If $\dot{\ell}_{\theta, \eta}$ is the ordinary score function for $\theta$ in the model in which $\eta$ is fixed, then we expect

$$
\frac{\partial}{\partial t}_{\mid t=0} \log d P_{\theta+t a, \eta_{t}}=a^{T} \dot{\ell}_{\theta, \eta}+g .
$$

The function $g$ has the interpretation of a score function for $\eta$ if $\theta$ is fixed and runs through an infinite-dimensional set if we are concerned with a "true" semiparametric model. We refer to this set as the tangent set for $\eta$, and denote it by ${ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$.

The parameter $\psi\left(P_{\theta+t a, \eta_{t}}\right)=\theta+t a$ is certainly differentiable with respect to $t$ in the ordinary sense but is, by definition, differentiable as a parameter on the model if and only if there exists a function $\tilde{\psi}_{\theta, \eta}$ such that

$$
a=\frac{\partial}{\partial t}{ }_{\mid t=0} \psi\left(P_{\theta+t a, \eta_{t}}\right)=\left\langle\tilde{\psi}_{\theta, \eta}, a^{T} \dot{\ell}_{\theta, \eta}+g\right\rangle_{P_{\theta, \eta}}, \quad a \in \mathbb{R}^{k}, g \in{ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}} .
$$

Setting $a=0$, we see that $\tilde{\psi}_{\theta, \eta}$ must be orthogonal to the tangent set ${ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ for the nuisance parameter. Define $\Pi_{\theta, \eta}$ as the orthogonal projection onto the closure of the linear span of ${ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ in $L_{2}\left(P_{\theta, \eta}\right)$.

The function defined by

$$
\tilde{\ell}_{\theta, \eta}=\dot{\ell}_{\theta, \eta}-\Pi_{\theta, \eta} \dot{\ell}_{\theta, \eta}
$$

is called the efficient score function for $\theta$, and its covariance matrix $\tilde{I}_{\theta, \eta}=P_{\theta, \eta} \tilde{\ell}_{\theta, \eta} \tilde{\ell}_{\theta, \eta}^{T}$ is the efficient information matrix.
25.25 Lemma. Suppose that for every $a \in \mathbb{R}^{k}$ and every $g \in{ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ there exists a path $t \mapsto \eta_{t}$ in $H$ such that

$$
\begin{equation*}
\int\left[\frac{d P_{\theta+t a, \eta_{t}}^{1 / 2}-d P_{\theta, \eta}^{1 / 2}}{t}-\frac{1}{2}\left(a^{T} \dot{\ell}_{\theta, \eta}+g\right) d P_{\theta, \eta}^{1 / 2}\right]^{2} \rightarrow 0 . \tag{25.26}
\end{equation*}
$$

If $\tilde{I}_{\theta, \eta}$ is nonsingular, then the functional $\psi\left(P_{\theta, \eta}\right)=\theta$ is differentiable at $P_{\theta, \eta}$ relative to the tangent set $\dot{\mathcal{P}}_{P_{\theta, \eta}}=\operatorname{lin} \dot{\ell}_{\theta, \eta}+{ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ with efficient influence function $\tilde{\psi}_{\theta, \eta}=\tilde{I}_{\theta, \eta}^{-1} \tilde{\ell}_{\theta, \eta}$.

Proof. The given set $\dot{\mathcal{P}}_{P_{\theta, \eta}}$ is a tangent set by assumption. The function $\psi$ is differentiable with respect to this tangent set because

$$
\left\langle\tilde{I}_{\theta, \eta}^{-1} \tilde{\ell}_{\theta, \eta}, a^{T} \dot{\ell}_{\theta, \eta}+g\right\rangle_{P_{\theta, \eta}}=\tilde{I}_{\theta, \eta}^{-1}\left\langle\tilde{\ell}_{\theta, \eta}, \dot{\ell}_{\theta, \eta}^{T}\right\rangle_{P_{\theta, \eta}} a=a .
$$

The last equality follows, because the inner product of a function and its orthogonal projection is equal to the square length of the projection. Thus, we may replace $\dot{\ell}_{\theta, \eta}$ by $\tilde{\ell}_{\theta, \eta}$.

Consequently, an estimator sequence is asymptotically efficient for estimating $\theta$ if

$$
\sqrt{n}\left(T_{n}-\theta\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \tilde{I}_{\theta, \eta}^{-1} \tilde{\ell}_{\theta, \eta}\left(X_{i}\right)+o_{P_{\theta, \eta}}(1) .
$$

This equation is very similar to the equation derived for efficient estimators in parametric models in Chapter 8. It differs only in that the ordinary score function $\dot{\ell}_{\theta, \eta}$ has been replaced by the efficient score function (and similarly for the information). The intuitive explanation is that a part of the score function for $\theta$ can also be accounted for by score functions for the nuisance parameter $\eta$. If the nuisance parameter is unknown, a part of the information for $\theta$ is "lost," and this corresponds to a loss of a part of the score function.
25.27 Example (Symmetric location). Suppose that the model consists of all densities $x \mapsto \eta(x-\theta)$ with $\theta \in \mathbb{R}$ and the "shape" $\eta$ symmetric about 0 with finite Fisher information for location $I_{\eta}$. Thus, the observations are sampled from a density that is symmetric about $\theta$.

By the symmetry, the density can equivalently be written as $\eta(|x-\theta|)$. It follows that any score function for the nuisance parameter $\eta$ is necessarily a function of $|x-\theta|$. This suggests a tangent set containing functions of the form $a\left(\eta^{\prime} / \eta\right)(x-\theta)+b(|x-\theta|)$. It is not hard to show that all square-integrable functions of this type with mean zero occur as score functions in the sense of (25.26). ${ }^{\dagger}$

A symmetric density has an asymmetric derivative and hence an asymmetric score function for location. Therefore, for every $b$,

$$
\mathrm{E}_{\theta, \eta} \frac{\eta^{\prime}}{\eta}(X-\theta) b(|X-\theta|)=0 .
$$

Thus, the projection of the $\theta$-score onto the set of nuisance scores is zero and hence the efficient score function coincides with the ordinary score function. This means that there is no difference in information about $\theta$ whether the form of the density is known or not known, as long as it is known to be symmetric. This surprising fact was discovered by Stein in 1956 and has been an important motivation in the early work on semiparametric models.

Even more surprising is that the information calculation is not misleading. There exist estimator sequences for $\theta$ whose definition does not depend on $\eta$ that have asymptotic variance $I_{\eta}^{-1}$ under any true $\eta$. See section 25.8. Thus a symmetry point can be estimated as well if the shape is known as if it is not, at least asymptotically.
25.28 Example (Regression). Let $g_{\theta}$ be a given set of functions indexed by a parameter $\theta \in \mathbb{R}^{k}$, and suppose that a typical observation ( $X, Y$ ) follows the regression model

$$
Y=g_{\theta}(X)+e, \quad \mathrm{E}(e \mid X)=0 .
$$

This model includes the logistic regression model, for $g_{\theta}(x)=1 /\left(1+e^{-\theta^{T} x}\right)$. It is also a version of the ordinary linear regression model. However, in this example we do not assume that $X$ and $e$ are independent, but only the relations in the preceding display, apart from qualitative smoothness conditions that ensure existence of score functions, and the existence of moments. We shall write the formulas assuming that ( $X, e$ ) possesses a density $\eta$. Thus, the observation ( $X, Y$ ) has a density $\eta\left(x, y-g_{\theta}(x)\right)$, in which $\eta$ is (essentially) only restricted by the relations $\int e \eta(x, e) d e \equiv 0$.

Because any perturbation $\eta_{t}$ of $\eta$ within the model must satisfy this same relation $\int e \eta_{t}(x, e) d e=0$, it is clear that score functions for the nuisance parameter $\eta$ are functions

[^3]$a\left(x, y-g_{\theta}(x)\right)$ that satisfy
$$
\mathrm{E}(e a(X, e) \mid X)=\frac{\int e a(X, e) \eta(X, e) d e}{\int \eta(X, e) d e}=0
$$

By the same argument as for nonparametric models all bounded square-integrable functions of this type that have mean zero are score functions. Because the relation $\mathrm{E}(e a(X, e) \mid X)=0$ is equivalent to the orthogonality in $L_{2}(\eta)$ of $a(x, e)$ to all functions of the form $e h(x)$, it follows that the set of score functions for $\eta$ is the orthocomplement of the set $e \mathcal{H}$, of all functions of the form $(x, y) \mapsto\left(y-g_{\theta}(x)\right) h(x)$ within $L_{2}\left(P_{\theta, \eta}\right)$, up to centering at mean zero.

Thus, we obtain the efficient score function for $\theta$ by projecting the ordinary score function $\dot{\ell}_{\theta, \eta}(x, y)=-\eta_{2} / \eta(x, e) \dot{g}_{\theta}(x)$ onto $e \mathcal{H}$. The projection of an arbitrary function $b(x, e)$ onto the functions $e \mathcal{H}$ is a function $e h_{0}(x)$ such that $\mathrm{E} b(X, e) e h(X)=\operatorname{Eeh}_{0}(X) e h(X)$ for all measurable functions $h$. This can be solved for $h_{0}$ to find that the projection operator takes the form

$$
\Pi_{e \mathcal{H}} b(X, e)=e \frac{\mathrm{E}(b(X, e) e \mid X)}{\mathrm{E}\left(e^{2} \mid X\right)}
$$

This readily yields the efficient score function

$$
\tilde{\ell}_{\theta, \eta}(X, Y)=-\frac{e \dot{g}_{\theta}(X)}{\mathrm{E}\left(e^{2} \mid X\right)} \frac{\int \eta_{2}(X, e) e d e}{\int \eta(X, e) d e}=\frac{\left(Y-g_{\theta}(X)\right) \dot{g}_{\theta}(X)}{\mathrm{E}\left(e^{2} \mid X\right)}
$$

The efficient information takes the form $\tilde{I}_{\theta, \eta}=\mathrm{E}\left(\dot{g}_{\theta} \dot{g}_{\theta}^{T}(X) / \mathrm{E}\left(e^{2} \mid X\right)\right)$.

### 25.5 Score and Information Operators

The method to find the efficient influence function of a parameter given in the preceding section is the most convenient method if the model can be naturally partitioned in the parameter of interest and a nuisance parameter. For many parameters such a partition is impossible or, at least, unnatural. Furthermore, even in semiparametric models it can be worthwhile to derive a more concrete description of the tangent set for the nuisance parameter, in terms of a "score operator."

Consider first the situation that the model $\mathcal{P}=\left\{P_{\eta}: \eta \in H\right\}$ is indexed by a parameter $\eta$ that is itself a probability measure on some measurable space. We are interested in estimating a parameter of the type $\psi\left(P_{\eta}\right)=\chi(\eta)$ for a given function $\chi: H \mapsto \mathbb{R}^{k}$ on the model $H$.

The model $H$ gives rise to a tangent set $\dot{H}_{\eta}$ at $\eta$. If the map $\eta \mapsto P_{\eta}$ is differentiable in an appropriate sense, then its derivative maps every score $b \in \dot{H}_{\eta}$ into a score $g$ for the model $\mathcal{P}$. To make this precise, we assume that a smooth parametric submodel $t \mapsto \eta_{t}$ induces a smooth parametric submodel $t \mapsto P_{\eta_{t}}$, and that the score functions $b$ of the submodel $t \mapsto \eta_{t}$ and $g$ of the submodel $t \mapsto P_{\eta_{t}}$ are related by

$$
g=A_{\eta} b
$$

Then $A_{\eta} \dot{H}_{\eta}$ is a tangent set for the model $\mathcal{P}$ at $P_{\eta}$. Because $A_{\eta}$ turns scores for the model $H$ into scores for the model $\mathcal{P}$ it is called a score operator. It is seen subsequently here that if $\eta$
and $P_{\eta}$ are the distributions of an unobservable $Y$ and an observable $X=m(Y)$, respectively, then the score operator is a conditional expectation. More generally, it can be viewed as a derivative of the map $\eta \mapsto P_{\eta}$. We assume that $A_{\eta}$, as a map $A_{\eta}: \operatorname{lin} \dot{H}_{\eta} \subset L_{2}(\eta) \mapsto L_{2}\left(P_{\eta}\right)$, is continuous and linear.

Next, assume that the function $\eta \mapsto \chi(\eta)$ is differentiable with influence function $\tilde{\chi}_{\eta}$ relative to the tangent set $\dot{H}_{\eta}$. Then, by definition, the function $\psi\left(P_{\eta}\right)=\chi(\eta)$ is pathwise differentiable relative to the tangent set $\dot{\mathcal{P}}_{P_{\eta}}=A_{\eta} \dot{H}_{\eta}$ if and only if there exists a vectorvalued function $\tilde{\psi}_{P_{\eta}}$ such that

$$
\left\langle\tilde{\psi}_{P_{\eta}}, A_{\eta} b\right\rangle_{P_{\eta}}=\frac{\partial}{\partial t}_{\mid t=0} \psi\left(P_{\eta_{t}}\right)=\frac{\partial}{\partial t}_{\mid t=0} \chi\left(\eta_{t}\right)=\left\langle\tilde{\chi}_{\eta}, b\right\rangle_{\eta}, \quad b \in \dot{H}_{\eta}
$$

This equation can be rewritten in terms of the adjoint score operator $A_{\eta}^{*}: L_{2}\left(P_{\eta}\right) \mapsto \overline{\operatorname{lin}} \dot{H}_{\eta}$. By definition this satisfies $\left\langle h, A_{\eta} b\right\rangle_{P_{\eta}}=\left\langle A_{\eta}^{*} h, b\right\rangle_{\eta}$ for every $h \in L_{2}\left(P_{\eta}\right)$ and $b \in \dot{H}_{\eta \cdot}{ }^{\dagger}$ The preceding display is equivalent to

$$
\begin{equation*}
A_{\eta}^{*} \tilde{\psi}_{P_{\eta}}=\tilde{\chi}_{\eta} . \tag{25.29}
\end{equation*}
$$

We conclude that the function $\psi\left(P_{\eta}\right)=\chi(\eta)$ is differentiable relative to the tangent set $\dot{\mathcal{P}}_{P_{\eta}}=A_{\eta} \dot{H}_{\eta}$ if and only if this equation can be solved for $\tilde{\psi}_{P_{\eta}}$; equivalently, if and only if $\tilde{\chi}_{\eta}$ is contained in the range of the adjoint $A_{\eta}^{*}$. Because $A_{\eta}^{*}$ is not necessarily onto $\varlimsup_{\eta} \dot{H}_{\eta}$, not even if it is one-to-one, this is a condition.

For multivariate functionals (25.29) is to be understood coordinate-wise. Two solutions $\tilde{\psi}_{P_{\eta}}$ of (25.29) can differ only by an element of the kernel $\mathrm{N}\left(A_{\eta}^{*}\right)$ of $A_{\eta}^{*}$, which is the orthocomplement $\mathrm{R}\left(A_{\eta}\right)^{\perp}$ of the range of $A_{\eta}: \operatorname{lin} \dot{H}_{\eta} \mapsto L_{2}\left(P_{\eta}\right)$. Thus, there is at most one solution $\tilde{\psi}_{P_{\eta}}$ that is contained in $\overline{\mathrm{R}}\left(A_{\eta}\right)=\overline{\ln } A_{\eta} \dot{H}_{\eta}$, the closure of the range of $A_{\eta}$, as required.

If $\tilde{\chi}_{\eta}$ is contained in the smaller range of $A_{\eta}^{*} A_{\eta}$, then (25.29) can be solved, of course, and the solution can be written in the attractive form

$$
\begin{equation*}
\tilde{\psi}_{P_{\eta}}=A_{\eta}\left(A_{\eta}^{*} A_{\eta}\right)^{-} \tilde{\chi}_{\eta} . \tag{25.30}
\end{equation*}
$$

Here $A_{\eta}^{*} A_{\eta}$ is called the information operator, and $\left(A_{\eta}^{*} A_{\eta}\right)^{-}$is a "generalized inverse." (Here this will not mean more than that $b=\left(A_{\eta}^{*} A_{\eta}\right)^{-} \tilde{\chi}_{\eta}$ is a solution to the equation $A_{\eta}^{*} A_{\eta} b=\tilde{\chi}_{\eta}$.) In the preceding equation the operator $A_{\eta}^{*} A_{\eta}$ performs a similar role as the matrix $X^{T} X$ in the least squares solution of a linear regression model. The operator $A_{\eta}\left(A_{\eta}^{*} A_{\eta}\right)^{-1} A_{\eta}^{*}$ (if it exists) is the orthogonal projection onto the range space of $A_{\eta}$.

So far we have assumed that the parameter $\eta$ is a probability distribution, but this is not necessary. Consider the more general situation of a model $\mathcal{P}=\left\{P_{\eta}: \eta \in H\right\}$ indexed by a parameter $\eta$ running through an arbitrary set $H$. Let $\mathbb{H}_{\eta}$ be a subset of a Hilbert space that indexes "directions" $b$ in which $\eta$ can be approximated within $H$. Suppose that there exist continuous, linear operators $A_{\eta}: \operatorname{lin} \mathbb{H}_{\eta} \mapsto L_{2}\left(P_{\eta}\right)$ and $\dot{\chi}_{\eta}: \operatorname{lin} \mathbb{H}_{\eta} \mapsto \mathbb{R}^{k}$, and for every $b \in \mathbb{H}_{\eta}$ a path $t \mapsto \eta_{t}$ such that, as $t \downarrow 0$,

$$
\int\left[\frac{d P_{\eta_{t}}^{1 / 2}-d P_{\eta}^{1 / 2}}{t}-\frac{1}{2} A_{\eta} b d P_{\eta}^{1 / 2}\right]^{2} \rightarrow 0, \quad \frac{\chi\left(\eta_{t}\right)-\chi(\eta)}{t} \rightarrow \dot{\chi}_{\eta} b .
$$

${ }^{\dagger}$ Note that we define $A_{\eta}^{*}$ to have range $\overline{\operatorname{lin}} \dot{H}_{\eta}$, so that it is the adjoint of $A_{\eta}: \dot{H}_{\eta} \mapsto L_{2}\left(P_{\eta}\right)$. This is the adjoint of an extension $A_{\eta}: L_{2}(\eta) \mapsto L_{2}\left(P_{\eta}\right)$ followed by the orthogonal projection onto $\overline{\operatorname{lin}} \dot{H}_{\eta}$.

By the Riesz representation theorem for Hilbert spaces, the "derivative" $\dot{\chi}_{\eta}$ has a representation as an inner product $\dot{\chi}_{\eta} b=\left\langle\tilde{\chi}_{\eta}, b\right\rangle_{\mathbb{H}_{\eta}}$ for an element $\tilde{\chi}_{\eta} \in \overline{\operatorname{lin}} \mathbb{H}_{\eta}^{k}$. The preceding discussion can be extended to this abstract set-up.
25.31 Theorem. The map $\psi: \mathcal{P} \mapsto \mathbb{R}^{k}$ given by $\psi\left(P_{\eta}\right)=\chi(\eta)$ is differentiable at $P_{\eta}$ relative to the tangent set $A_{\eta} \mathbb{H}_{\eta}$ if and only if each coordinate function of $\tilde{\chi}_{\eta}$ is contained in the range of $A_{\eta}^{*}: L_{2}\left(P_{\eta}\right) \mapsto \overline{\operatorname{lin}} \mathbb{H}_{\eta}$. The efficient influence function $\tilde{\psi}_{P_{\eta}}$ satisfies (25.29). If each coordinate function of $\tilde{\chi}_{\eta}$ is contained in the range of $A_{\eta}^{*} A_{\eta}: \overline{\operatorname{lin}} \mathbb{H}_{\eta} \mapsto \overline{\operatorname{lin}} \mathbb{H}_{\eta}$, then it also satisfies (25.30).

Proof. By assumption, the set $A_{\eta} \mathbb{H}_{\eta}$ is a tangent set. The map $\psi$ is differentiable relative to this tangent set (and the corresponding submodels $t \mapsto P_{\eta_{t}}$ ) by the argument leading up to (25.29).

The condition (25.29) is odd. By definition, the influence function $\tilde{\chi}_{\eta}$ is contained in the closed linear span of $\mathbb{H}_{\eta}$ and the operator $A_{\eta}^{*}$ maps $L_{2}\left(P_{\eta}\right)$ into $\varlimsup \mathbb{H}_{\eta}$. Therefore, the condition is certainly satisfied if $A_{\eta}^{*}$ is onto. There are two reasons why it may fail to be onto. First, its range $\mathrm{R}\left(A_{\eta}^{*}\right)$ may be a proper subspace of $\varlimsup \mathbb{H}_{\eta}$. Because $b \perp \mathrm{R}\left(A_{\eta}^{*}\right)$ if and only if $b \in \mathrm{~N}\left(A_{\eta}\right)$, this can happen only if $A_{\eta}$ is not one-to-one. This means that two different directions $b$ may lead to the same score function $A_{\eta} b$, so that the information matrix for the corresponding two-dimensional submodel is singular. A rough interpretation is that the parameter is not locally identifiable. Second, the range space $\mathrm{R}\left(A_{\eta}^{*}\right)$ may be dense but not closed. Then for any $\tilde{\chi}_{\eta}$ there exist elements in $\mathrm{R}\left(A_{\eta}^{*}\right)$ that are arbitrarily close to $\tilde{\chi}_{\eta}$, but (25.29) may still fail. This happens quite often. The following theorem shows that failure has serious consequences. ${ }^{\dagger}$
25.32 Theorem. Suppose that $\eta \mapsto \chi(\eta)$ is differentiable with influence function $\tilde{\chi}_{\eta} \notin \mathrm{R}\left(A_{\eta}^{*}\right)$. Then there exists no estimator sequence for $\chi(\eta)$ that is regular at $P_{\eta}$.

### 25.5.1 Semiparametric Models

In a semiparametric model $\left\{P_{\theta, \eta}: \theta \in \Theta, \eta \in H\right\}$, the pair $(\theta, \eta)$ plays the role of the single $\eta$ in the preceding general discussion. The two parameters can be perturbed independently, and the score operator can be expected to take the form

$$
A_{\theta, \eta}(a, b)=a^{T} \dot{\ell}_{\theta, \eta}+B_{\theta, \eta} b .
$$

Here $B_{\theta, \eta}: \mathbb{H}_{\eta} \mapsto L_{2}\left(P_{\theta, \eta}\right)$ is the score operator for the nuisance parameter. The domain of the operator $A_{\theta, \eta}: \mathbb{R}^{k} \times \operatorname{lin} \mathbb{H}_{\eta} \mapsto L_{2}\left(P_{\theta, \eta}\right)$ is a Hilbert space relative to the inner product

$$
\langle(a, b),(\alpha, \beta)\rangle_{\eta}=a^{T} \alpha+\langle b, \beta\rangle_{\mathbb{H}_{\eta}} .
$$

Thus this example fits in the general set-up, with $\mathbb{R}^{k} \times \mathbb{H}_{\eta}$ playing the role of the earlier $\mathbb{H}_{\eta}$. We shall derive expressions for the efficient influence functions of $\theta$ and $\eta$.

The efficient influence function for estimating $\theta$ is expressed in the efficient score function for $\theta$ in Lemma 25.25, which is defined as the ordinary score function minus its projection

[^4]onto the score-space for $\eta$. Presently, the latter space is the range of the operator $B_{\theta, \eta}$. If the operator $B_{\theta, \eta}^{*} B_{\theta, \eta}$ is continuously invertible (but in many examples it is not), then the operator $B_{\theta, \eta}\left(B_{\theta, \eta}^{*} B_{\theta, \eta}\right)^{-1} B_{\theta, \eta}^{*}$ is the orthogonal projection onto the nuisance score space, and
$$
\begin{equation*}
\tilde{\ell}_{\theta, \eta}=\left(I-B_{\theta, \eta}\left(B_{\theta, \eta}^{*} B_{\theta, \eta}\right)^{-1} B_{\theta, \eta}^{*}\right) \dot{\ell}_{\theta, \eta} . \tag{25.33}
\end{equation*}
$$

This means that $b=-\left(B_{\theta, \eta}^{*} B_{\theta, \eta}\right)^{-1} B_{\theta, \eta}^{*} \dot{\ell}_{\theta, \eta}$ is a "least favorable direction" in $H$, for estimating $\theta$. If $\theta$ is one-dimensional, then the submodel $t \mapsto P_{\theta+t, \eta_{t}}$ where $\eta_{t}$ approaches $\eta$ in this direction, has the least information for estimating $t$ and score function $\tilde{\ell}_{\theta, \eta}$, at $t=0$.

A function $\chi(\eta)$ of the nuisance parameter can, despite the name, also be of interest. The efficient influence function for this parameter can be found from (25.29). The adjoint of $A_{\theta, \eta}: \mathbb{R}^{k} \times \mathbb{H}_{\eta} \mapsto L_{2}\left(P_{\theta, \eta}\right)$, and the corresponding information operator $A_{\theta, \eta}^{*} A_{\theta, \eta}: \mathbb{R}^{k} \times \mathbb{H}_{\eta} \mapsto \mathbb{R}^{k} \times \varlimsup_{\operatorname{lin}} \mathbb{H}_{\eta}$ are given by, with $B_{\theta, \eta}^{*}: L_{2}\left(P_{\theta, \eta} \mapsto \varlimsup_{\operatorname{lin}} \mathbb{H}_{\eta}\right.$ the adjoint of $B_{\theta, \eta}$,

$$
\begin{aligned}
A_{\theta, \eta}^{*} g & =\left(P_{\theta, \eta} g \dot{\ell}_{\theta, \eta}, B_{\theta, \eta}^{*} g\right), \\
A_{\theta, \eta}^{*} A_{\theta, \eta}(a, b) & =\left(\begin{array}{cc}
I_{\theta, \eta} & P_{\theta, \eta} \dot{\ell}_{\theta, \eta} B_{\theta, \eta} \\
B_{\theta, \eta}^{*} \dot{\ell}_{\theta, \eta}^{T} & B_{\theta, \eta}^{*} B_{\theta, \eta}
\end{array}\right)\binom{a}{b} .
\end{aligned}
$$

The diagonal elements in the matrix are the information operators for the parameters $\theta$ and $\eta$, respectively, the former being just the ordinary Fisher information matrix $I_{\theta, \eta}$ for $\theta$. If $\eta \mapsto \chi(\eta)$ is differentiable as before, then the function $(\theta, \eta) \mapsto \chi(\eta)$ is differentiable with influence function ( $0, \tilde{\chi}_{\eta}$ ). Thus, for a real parameter $\chi(\eta)$, equation (25.29) becomes

$$
P_{\theta, \eta} \tilde{\psi}_{P_{\theta, \eta}} \dot{\ell}_{\theta, \eta}=0, \quad B_{\theta, \eta}^{*} \tilde{\psi}_{P_{\theta, \eta}}=\tilde{\chi}_{\eta}
$$

If $\tilde{I}_{\theta, \eta}$ is invertible and $\tilde{\chi}_{\eta}$ is contained in the range of $B_{\theta, \eta}^{*} B_{\theta, \eta}$, then the solution $\tilde{\psi}_{P_{\theta, \eta}}$ of these equations is

$$
B_{\theta, \eta}\left(B_{\theta, \eta}^{*} B_{\theta, \eta}\right)^{-} \tilde{\chi}_{\eta}-\left\langle B_{\theta, \eta}\left(B_{\theta, \eta}^{*} B_{\theta, \eta}\right)^{-} \tilde{\chi}_{\eta}, \dot{\ell}_{\theta, \eta}\right\rangle_{P_{\theta, \eta}}^{T} \tilde{I}_{\theta, \eta}^{-1} \tilde{\ell}_{\theta, \eta} .
$$

The second part of this function is the part of the efficient score function for $\chi(\eta)$ that is "lost" due to the fact that $\theta$ is unknown. Because it is orthogonal to the first part, it adds a positive contribution to the variance.

### 25.5.2 Information Loss Models

Suppose that a typical observation is distributed as a measurable transformation $X=m(Y)$ of an unobservable variable $Y$. Assume that the form of $m$ is known and that the distribution $\eta$ of $Y$ is known to belong to a class $H$. This yields a natural parametrization of the distribution $P_{\eta}$ of $X$. A nice property of differentiability in quadratic mean is that it is preserved under "censoring" mechanisms of this type: If $t \mapsto \eta_{t}$ is a differentiable submodel of $H$, then the induced submodel $t \mapsto P_{\eta_{t}}$ is a differentiable submodel of $\left\{P_{\eta}: \eta \in H\right\}$. Furthermore, the score function $g=A_{\eta} b$ (at $t=0$ ) for the induced model $t \mapsto P_{\eta_{t}}$ can be obtained from the score function $b$ (at $t=0$ ) of the model $t \mapsto \eta_{t}$ by taking a conditional expectation:

$$
A_{\eta} b(x)=\mathrm{E}_{\eta}(b(Y) \mid X=x)
$$

If we consider the scores $b$ and $g$ as the carriers of information about $t$ in the variables $Y$ with law $\eta_{t}$ and $X$ with law $P_{\eta_{t}}$, respectively, then the intuitive meaning of the conditional expectation operator is clear. The information contained in the observation $X$ is the information contained in $Y$ diluted (and reduced) through conditioning. ${ }^{\dagger}$
25.34 Lemma. Suppose that $\left\{\eta_{t}: 0<t<1\right\}$ is a collection of probability measures on a measurable space $(\mathcal{Y}, \mathcal{B})$ such that for some measurable function $b: \mathcal{Y} \mapsto \mathbb{R}$

$$
\int\left[\frac{d \eta_{t}^{1 / 2}-d \eta^{1 / 2}}{t}-\frac{1}{2} b d \eta^{1 / 2}\right]^{2} \rightarrow 0
$$

For a measurable map $m: \mathcal{Y} \mapsto \mathcal{X}$ let $P_{\eta}$ be the distribution of $m(Y)$ if $Y$ has law $\eta$ and let $A_{\eta} b(x)$ be the conditional expectation of $b(Y)$ given $m(Y)=x$. Then

$$
\int\left[\frac{d P_{\eta_{t}}^{1 / 2}-d P_{\eta}^{1 / 2}}{t}-\frac{1}{2} A_{\eta} b d P_{\eta}^{1 / 2}\right]^{2} \rightarrow 0
$$

If we consider $A_{\eta}$ as an operator $A_{\eta}: L_{2}(\eta) \mapsto L_{2}\left(P_{\eta}\right)$, then its adjoint $A_{\eta}^{*}: L_{2}\left(P_{\eta}\right) \mapsto L_{2}(\eta)$ is a conditional expectation operator also, reversing the roles of $X$ and $Y$,

$$
A_{\eta}^{*} g(y)=\mathrm{E}_{\eta}(g(X) \mid Y=y) .
$$

This follows because, by the usual rules for conditional expectations, $\mathrm{EE}(g(X) \mid Y) b(Y)= \mathrm{E} g(X) b(Y)=\mathrm{E} g(X) \mathrm{E}(b(Y) \mid X)$. In the "calculus of scores" of Theorem 25.31 the adjoint is understood to be the adjoint of $A_{\eta}: \mathbb{H}_{\eta} \mapsto L_{2}\left(P_{\eta}\right)$ and hence to have range $\varlimsup \mathbb{H}_{\eta} \subset L_{2}(\eta)$. Then the conditional expectation in the preceding display needs to be followed by the orthogonal projection onto $\varlimsup \mathbb{H}_{\eta}$.
25.35 Example (Mixtures). Suppose that a typical observation $X$ possesses a conditional density $p(x \mid z)$ given an unobservable variable $Z=z$. If the unobservable $Z$ possesses an unknown probability distribution $\eta$, then the observations are a random sample from the mixture density

$$
p_{\eta}(x)=\int p(x \mid z) d \eta(z)
$$

This is a missing data problem if we think of $X$ as a function of the pair $Y=(X, Z)$. A score for the mixing distribution $\eta$ in the model for $Y$ is a function $b(z)$. Thus, a score space for the mixing distribution in the model for $X$ consists of the functions

$$
A_{\eta} b(x)=\mathrm{E}_{\eta}(b(Z) \mid X=x)=\frac{\int b(z) p(x \mid z) d \eta(z)}{\int p(x \mid z) d \eta(z)}
$$

If the mixing distribution is completely unknown, which we assume, then the tangent set $\dot{H}_{\eta}$ for $\eta$ can be taken equal to the maximal tangent set $\left\{b \in L_{2}(\eta): \eta b=0\right\}$.

In particular, consider the situation that the kernel $p(x \mid z)$ belongs to an exponential family, $p(x \mid z)=c(z) d(x) \exp \left(z^{T} x\right)$. We shall show that the tangent set $A_{\eta} \dot{H}_{\eta}$ is dense

[^5]in the maximal tangent set $\left\{g \in L_{2}\left(P_{\eta}\right): P_{\eta} g=0\right\}$, for every $\eta$ whose support contains an interval. This has as a consequence that empirical estimators $\mathbb{P}_{n} g$, for a fixed squaredintegrable function $g$, are efficient estimators for the functional $\psi(\eta)=P_{\eta} g$. For instance, the sample mean is asymptotically efficient for estimating the mean of the observations.

Thus nonparametric mixtures over an exponential family form very large models, which are only slightly smaller than the nonparametric model. For estimating a functional such as the mean of the observations, it is of relatively little use to know that the underlying distribution is a mixture. More precisely, the additional information does not decrease the asymptotic variance, although there may be an advantage for finite $n$. On the other hand, the mixture structure may express a structure in reality and the mixing distribution $\eta$ may define the functional of interest.

The closure of the range of the operator $A_{\eta}$ is the orthocomplement of the kernel $\mathrm{N}\left(A_{\eta}^{*}\right)$ of its adjoint. Hence our claim is proved if this kernel is zero. The equation

$$
0=A_{\eta}^{*} g(z)=\mathrm{E}(g(X) \mid Z=z)=\int g(x) p(x \mid z) d \nu(x)
$$

says exactly that $g(X)$ is a zero-estimator under $p(x \mid z)$. Because the adjoint is defined on $L_{2}(\eta)$, the equation $0=A_{\eta}^{*} g$ should be taken to mean $A_{\eta}^{*} g(Z)=0$ almost surely under $\eta$. In other words, the display is valid for every $z$ in a set of $\eta$-measure 1 . If the support of $\eta$ contains a limit point, then this set is rich enough to conclude that $g=0$, by the completeness of the exponential family.

If the support of $\eta$ does not contain a limit point, then the preceding approach fails. However, we may reach almost the same conclusion by using a different type of scores. The paths $\eta_{t}=(1-t a) \eta+t a \eta_{1}$ are well-defined for $0 \leq a t \leq 1$, for any fixed $a \geq 0$ and $\eta_{1}$, and lead to scores

$$
\frac{\partial}{\partial t}_{\mid t=0} \log p_{\eta_{t}}(x)=a\left(\frac{p_{\eta_{1}}}{p_{\eta}}(x)-1\right)
$$

This is certainly a score in a pointwise sense and can be shown to be a score in the $L_{2}$-sense provided that it is in $L_{2}\left(P_{\eta}\right)$. If $g \in L_{2}\left(P_{\eta}\right)$ has $P_{\eta} g=0$ and is orthogonal to all scores of this type, then

$$
0=P_{\eta_{1}} g=P_{\eta} g\left(\frac{p_{\eta_{1}}}{p_{\eta}}-1\right), \quad \text { every } \eta_{1}
$$

If the set of distributions $\left\{P_{\eta}: \eta \in H\right\}$ is complete, then we can typically conclude that $g=0$ almost surely. Then the closed linear span of the tangent set is equal to the nonparametric, maximal tangent set. Because this set of scores is also a convex cone, Theorems 25.20 and 25.21 next show that nonparametric estimators are asymptotically efficient.
25.36 Example (Semiparametric mixtures). In the preceding example, replace the density $p(x \mid z)$ by a parametric family $p_{\theta}(x \mid z)$. Then the model $p_{\theta}(x \mid z) d \eta(z)$ for the unobserved data $Y=(X, Z)$ has scores for both $\theta$ and $\eta$. Suppose that the model $t \mapsto \eta_{t}$ is differentiable with score $b$, and that

$$
\iint\left[p_{\theta+a}^{1 / 2}(x \mid z)-p_{\theta}^{1 / 2}(x \mid z)-\frac{1}{2} a^{T} \dot{\ell}_{\theta}(x \mid z) p_{\theta}^{1 / 2}(x \mid z)\right]^{2} d \mu(x) d \eta(z)=o\left(\|a\|^{2}\right)
$$

Then the function $a^{T} \dot{\ell}_{\theta}(x \mid z)+b(z)$ can be shown to be a score function corresponding to the model $t \mapsto p_{\theta+t a}(x \mid z) d \eta_{t}(z)$. Next, by Lemma 25.34, the function

$$
\mathrm{E}_{\theta, \eta}\left(a^{T} \dot{\ell}_{\theta}(X \mid Z)+b(Z) \mid X=x\right)=\frac{\int\left(\dot{\ell}_{\theta}(x \mid z)+b(z)\right) p_{\theta}(x \mid z) d \eta(z)}{\int p_{\theta}(x \mid z) d \eta(z)}
$$

is a score for the model corresponding to observing $X$ only.
25.37 Example (Random censoring). Suppose that the time $T$ of an event is only observed if the event takes place before a censoring time $C$ that is generated independently of $T$; otherwise we observe $C$. Thus the observation $X=(Y, \Delta)$ is the pair of transformations $Y=T \wedge C$ and $\Delta=1\{T \leq C\}$ of the "full data" ( $T, C$ ). If $T$ has a distribution function $F$ and $t \mapsto F_{t}$ is a differentiable path with score function $a$, then the submodel $t \mapsto P_{F_{t}, G}$ for $X$ has score function

$$
A_{F, G} a(x)=\mathrm{E}_{F}(a(T) \mid X=(y, \delta))=(1-\delta) \frac{\int_{(y, \infty)} a d F}{1-F(y)}+\delta a(y)
$$

A score operator for the distribution of $C$ can be defined similarly, and takes the form, with $G$ the distribution of $C$,

$$
B_{F, G} b(x)=(1-\delta) b(y)+\delta \frac{\int_{[y, \infty)} b d G}{1-G_{-}(y)}
$$

The scores $A_{F, G} a$ and $B_{F, G} b$ form orthogonal spaces, as can be checked directly from the formulas, because $\mathrm{E} A_{F} a(X) B_{G} b(X)=F a G b$. (This is also explained by the product structure in the likelihood.) A consequence is that knowing $G$ does not help for estimating $F$ in the sense that the information for estimating parameters of the form $\psi\left(P_{F, G}\right)=\chi(F)$ is the same in the models in which $G$ is known or completely unknown, respectively. To see this, note first that the influence function of such a parameter must be orthogonal to every score function for $G$, because $d / d t \psi\left(P_{F, G_{t}}\right)=0$. Thus, due to the orthogonality of the two score spaces, an influence function of this parameter that is contained in the closed linear span of $\mathrm{R}\left(A_{F, G}\right)+\mathrm{R}\left(B_{F, G}\right)$ is automatically contained in $\mathrm{R}\left(A_{F, G}\right)$.
25.38 Example (Current status censoring). Suppose that we only observe whether an event at time $T$ has happened or not at an observation time $C$. Then we observe the transformation $X=(C, 1\{T \leq C\})=(C, \Delta)$ of the pair ( $C, T$ ). If $T$ and $C$ are independent with distribution functions $F$ and $G$, respectively, then the score operators for $F$ and $G$ are given by, with $x=(c, \delta)$,

$$
\begin{aligned}
& A_{F, G} a(x)=\mathrm{E}_{F}(a(T) \mid C=c, \Delta=\delta)=(1-\delta) \frac{\int_{(c, \infty)} a d F}{1-F(c)}+\delta \frac{\int_{[0, c]} a d F}{F(c)} \\
& B_{F, G} b(x)=\mathrm{E}(b(C) \mid C=c, \Delta=\delta)=b(c)
\end{aligned}
$$

These score functions can be seen to be orthogonal with the help of Fubini's theorem. If we take $F$ to be completely unknown, then the set of $a$ can be taken all functions in $L_{2}(F)$ with $F a=0$, and the adjoint operator $A_{F, G}^{*}$ restricted to the set of mean-zero functions in $L_{2}\left(P_{F, G}\right)$ is given by

$$
A_{F, G}^{*} h(c)=\int_{[c, \infty)} h(u, 1) d G(u)+\int_{[0, c)} h(u, 0) d G(u)
$$

For simplicity assume that the true $F$ and $G$ possess continuous Lebesgue densities, which are positive on their supports. The range of $A_{F, G}^{*}$ consists of functions as in the preceding display for functions $h$ that are contained in $L_{2}\left(P_{F, G}\right)$, or equivalently

$$
\int h^{2}(u, 0)(1-F)(u) d G(u)<\infty \quad \text { and } \quad \int h^{2}(u, 1) F(u) d G(u)<\infty .
$$

Thus the functions $h(u, 1)$ and $h(u, 0)$ are square-integrable with respect to $G$ on any interval inside the support of $F$. Consequently, the range of the adjoint $A_{F, G}^{*}$ contains only absolutely continuous functions, and hence (25.29) fails for every parameter $\chi(F)$ with an influence function $\tilde{\chi}_{F}$ that is discontinuous. More precisely, parameters $\chi(F)$ with influence functions that are not almost surely equal under $F$ to an absolutely continuous function. Because this includes the functions $1_{[0, t]}-F(t)$, the distribution function $F \mapsto \chi(F)=F(t)$ at a point is not a differentiable functional of the model. In view of Theorem 25.32 this means that this parameter is not estimable at $\sqrt{n}$-rate, and the usual normal theory does not apply to it.

On the other hand, parameters with a smooth influence function $\tilde{\chi}_{F}$ may be differentiable. The score operator for the model $P_{F, G}$ is the sum $(a, b) \mapsto A_{F, G} a+B_{F, G} b$ of the score operators for $F$ and $G$ separately. Its adjoint is the map $h \mapsto\left(A_{F, G}^{*} h, B_{F, G}^{*} h\right)$. A parameter of the form $(F, G) \mapsto \chi(F)$ has an influence function of the form $\left(\tilde{\chi}_{F}, 0\right)$. Thus, for a parameter of this type equation (25.29) takes the form

$$
A_{F, G}^{*} \tilde{\psi}_{P_{F, G}}=\tilde{\chi}_{F}, \quad B_{F, G}^{*} \tilde{\psi}_{P_{F, G}}=0
$$

The kernel $\mathrm{N}\left(A_{F, G}^{*}\right)$ consists of the functions $h \in L_{2}\left(P_{F, G}\right)$ such that $h(u, 0)=h(u, 1)$ almost surely under $F$ and $G$. This is precisely the range of $B_{F, G}$, and we can conclude that

$$
\mathrm{R}\left(A_{F, G}\right)^{\perp}=\mathrm{N}\left(A_{F, G}^{*}\right)=\mathrm{R}\left(B_{F, G}\right)=\mathrm{N}\left(B_{F, G}^{*}\right)^{\perp}
$$

Therefore, we can solve the preceding display by first solving $A_{F, G}^{*} h=\tilde{\chi}_{F}$ and next projecting a solution $h$ onto the closure of the range of $A_{F, G}$. By the orthogonality of the ranges of $A_{F, G}$ and $B_{F, G}$, the latter projection is the identity minus the projection onto $\mathrm{R}\left(B_{F, G}\right)$. This is convenient, because the projection onto $\mathrm{R}\left(B_{F, G}\right)$ is the conditional expectation relative to $C$.

For example, consider a function $\chi(F)=F a$ for some fixed known, continuously differentiable function $a$. Differentiating the equation $a=A_{F, G}^{*} h$, we find $a^{\prime}(c)=(h(c, 0)- h(c, 1)) g(c)$. This can happen for some $h \in L_{2}\left(P_{F, G}\right)$ only if, for any $\tau$ such that $0<F(\tau)<1$,

$$
\begin{aligned}
\int_{\tau}^{\infty}\left(\frac{a^{\prime}}{g}\right)^{2}(1-F) d G & =\int_{\tau}^{\infty}(h(u, 0)-h(u, 1))^{2}(1-F)(u) d G(u)<\infty \\
\int_{0}^{\tau}\left(\frac{a^{\prime}}{g}\right)^{2} F d G & =\int_{0}^{\tau}(h(u, 0)-h(u, 1))^{2} F(u) d G(u)<\infty
\end{aligned}
$$

If the left sides of these equations are finite, then the parameter $P_{F, G} \mapsto F a$ is differentiable. An influence function is given by the function $h$ defined by

$$
h(c, 0)=\frac{a^{\prime}(c) 1_{[\tau, \infty)}(c)}{g(c)}, \quad \text { and } \quad h(c, 1)=-\frac{a^{\prime}(c) 1_{[0, \tau)}(c)}{g(c)} .
$$

The efficient influence function is found by projecting this onto $\overline{\mathrm{R}}\left(A_{F, G}\right)$, and is given by

$$
\begin{aligned}
h(c, \delta)-\mathrm{E}_{F, G}(h(C, \Delta) \mid C=c) & =(h(c, 1)-h(c, 0))(\delta-F(c)) \\
& =-\delta \frac{1-F(c)}{g(c)} a^{\prime}(c)+(1-\delta) \frac{F(c)}{g(c)} a^{\prime}(c)
\end{aligned}
$$

For example, for the mean $\chi(F)=\int u d F(u)$, the influence function certainly exists if the density $g$ is bounded away from zero on the compact support of $F$.

## *25.5.3 Missing and Coarsening at Random

Suppose that from a given vector ( $Y_{1}, Y_{2}$ ) we sometimes observe only the first coordinate $Y_{1}$ and at other times both $Y_{1}$ and $Y_{2}$. Then $Y_{2}$ is said to be missing at random (MAR) if the conditional probability that $Y_{2}$ is observed depends only on $Y_{1}$, which is always observed. We can formalize this definition by introducing an indicator variable $\Delta$ that indicates whether $Y_{2}$ is missing ( $\Delta=0$ ) or observed ( $\Delta=1$ ). Then $Y_{2}$ is missing at random if $\mathrm{P}(\Delta=0 \mid Y)$ is a function of $Y_{1}$ only.

If next to $\mathrm{P}(\Delta=0 \mid Y)$ we also specify the marginal distribution of $Y$, then the distribution of $(Y, \Delta)$ is fixed, and the observed data are the function $X=(\phi(Y, \Delta), \Delta)$ defined by (for instance)

$$
\phi(y, 0)=y_{1}, \quad \phi(y, 1)=y .
$$

The tangent set for the model for $X$ can be derived from the tangent set for the model for $(Y, \Delta)$ by taking conditional expectations. If the distribution of $(Y, \Delta)$ is completely unspecified, then so is the distribution of $X$, and both tangent spaces are the maximal "nonparametric tangent space". If we restrict the model by requiring MAR, then the tangent set for $(Y, \Delta)$ is smaller than nonparametric. Interestingly, provided that we make no further restrictions, the tangent set for $X$ remains the nonparametric tangent set.

We shall show this in somewhat greater generality. Let $Y$ be an arbitrary unobservable "full observation" (not necessarily a vector) and let $\Delta$ be an arbitrary random variable. The distribution of $(Y, \Delta)$ can be determined by specifying a distribution $Q$ for $Y$ and a conditional density $r(\delta \mid y)$ for the conditional distribution of $\Delta$ given $Y .^{\dagger}$ As before, we observe $X=(\phi(Y, \Delta), \Delta)$, but now $\phi$ may be an arbitrary measurable map. The observation $X$ is said to be coarsening at random ( $C A R$ ) if the conditional densities $r(\delta \mid y)$ depend on $x=(\phi(y, \delta), \delta)$ only, for every possible value $(y, \delta)$. More precisely, $r(\delta \mid y)$ is a measurable function of $x$.
25.39 Example (Missing at random). If $\Delta \in\{0,1\}$ the requirements are both that $\mathrm{P}(\Delta=0 \mid Y=y)$ depends only on $\phi(y, 0)$ and 0 and that $\mathrm{P}(\Delta=1 \mid Y=y)$ depends only on $\phi(y, 1)$ and 1 . Thus the two functions $y \mapsto \mathrm{P}(\Delta=0 \mid Y=y)$ and $y \mapsto \mathrm{P}(\Delta=1 \mid Y=y)$ may be different (fortunately) but may depend on $y$ only through $\phi(y, 0)$ and $\phi(y, 1)$, respectively.

If $\phi(y, 1)=y$, then $\delta=1$ corresponds to observing $y$ completely. Then the requirement reduces to $\mathrm{P}(\Delta=0 \mid Y=y)$ being a function of $\phi(y, 0)$ only. If $Y=\left(Y_{1}, Y_{2}\right)$ and $\phi(y, 0)=y_{1}$, then CAR reduces to MAR as defined in the introduction.

[^6]Denote by $\mathcal{Q}$ and $\mathcal{R}$ the parameter spaces for the distribution $Q$ of $Y$ and the kernels $r(\delta \mid y)$ giving the conditional distribution of $\Delta$ given $Y$, respectively. Let $\mathcal{Q} \times \mathcal{R}=(Q \times R: Q \in \mathcal{Q}, R \in \mathcal{R})$ and $\mathcal{P}=\left(P_{Q, R}: Q \in \mathcal{Q}, R \in \mathcal{R}\right)$ be the models for $(Y, \Delta)$ and $X$, respectively.
25.40 Theorem. Suppose that the distribution $Q$ of $Y$ is completely unspecified and the Markov kernel $r(\delta \mid y)$ is restricted by CAR, and only by CAR. Then there exists a tangent set $\dot{\mathcal{P}}_{P_{Q, R}}$ for the model $\mathcal{P}=\left(P_{Q, R}: Q \in \mathcal{Q}, R \in \mathcal{R}\right)$ whose closure consists of all mean-zero functions in $L_{2}\left(P_{Q, R}\right)$. Furthermore, any element of $\dot{\mathcal{P}}_{P_{Q, R}}$ can be orthogonally decomposed as

$$
\mathrm{E}_{Q, R}(a(Y) \mid X=x)+b(x)
$$

where $a \in \dot{\mathcal{Q}}_{Q}$ and $b \in \dot{\mathcal{R}}_{R}$. The functions $a$ and $b$ range exactly over the functions $a \in L_{2}(Q)$ with $Q a=0$ and $b \in L_{2}\left(P_{Q, R}\right)$ with $\mathrm{E}_{R}(b(X) \mid Y)=0$ almost surely, respectively.

Proof. Fix a differentiable submodel $t \mapsto Q_{t}$ with score $a$. Furthermore, for every fixed $y$ fix a differentiable submodel $t \mapsto r_{t}(\cdot \mid y)$ for the conditional density of $\Delta$ given $Y=y$ with score $b_{0}(\delta \mid y)$ such that

$$
\iint\left[\frac{r_{t}^{1 / 2}(\delta \mid y)-r^{1 / 2}(\delta \mid y)}{t}-\frac{1}{2} b_{0}(\delta \mid y) r^{1 / 2}(\delta \mid y)\right]^{2} d \nu(\delta) d Q(y) \rightarrow 0
$$

Because the conditional densities satisfy CAR, the function $b_{0}(\delta \mid y)$ must actually be a function $b(x)$ of $x$ only. Because it corresponds to a score for the conditional model, it is further restricted by the equations $\int b_{0}(\delta \mid y) r(\delta \mid y) d \nu(\delta)=\mathrm{E}_{R}(b(X) \mid Y=y)=0$ for every $y$. Apart from this and square integrability, $b_{0}$ can be chosen freely, for instance bounded.

By a standard argument, with $Q \times R$ denoting the law of $(Y, \Delta)$ under $Q$ and $r$,

$$
\int\left[\frac{\left(d Q_{t} \times R_{t}\right)^{1 / 2}-(d Q \times R)^{1 / 2}}{t}-\frac{1}{2}(a(y)+b(x))(d Q \times R)^{1 / 2}\right]^{2} \rightarrow 0 .
$$

Thus $a(y)+b(x)$ is a score function for the model of $(Y, \Delta)$, at $Q \times R$. By Lemma 25.34 its conditional expectation $\mathrm{E}_{Q, R}(a(Y)+b(X) \mid X=x)$ is a score function for the model of $X$.

This proves that the functions as given in the theorem arise as scores. To show that the set of all functions of this type is dense in the nonparametric tangent set, suppose that some function $g \in L_{2}\left(P_{Q, R}\right)$ is orthogonal to all functions $\mathrm{E}_{Q, R}(a(Y) \mid X=x)+b(x)$. Then $\mathrm{E}_{Q, R} g(X) a(Y)=\mathrm{E}_{Q, R} g(X) \mathrm{E}_{Q, R}(a(Y) \mid X)=0$ for all $a$. Hence $g$ is orthogonal to all functions of $Y$ and hence is a function of the type $b$. If it is also orthogonal to all $b$, then it must be 0 .

The interest of the representation of scores given in the preceding theorem goes beyond the case that the models $\mathcal{Q}$ and $\mathcal{R}$ are restricted by CAR only, as is assumed in the theorem. It shows that, under CAR, any tangent space for $\mathcal{P}$ can be decomposed into two orthogonal pieces, the first part consisting of the conditional expectations $\mathrm{E}_{Q, R}(a(Y) \mid X)$ of scores a for the model of $Y$ (and their limits) and the second part being scores $b$ for the model $\mathcal{R}$
describing the "missingness pattern." CAR ensures that the latter are functions of $x$ already and need not be projected, and also that the two sets of scores are orthogonal. By the product structure of the likelihood $q(y) r(\delta \mid y)$, scores $a$ and $b$ for $q$ and $r$ in the model $\mathcal{Q} \times \mathcal{R}$ are always orthogonal. This orthogonality may be lost by projecting them on the functions of $x$, but not so under CAR, because $b$ is equal to its projection.

In models in which there is a positive probability of observing the complete data, there is an interesting way to obtain all influence functions of a given parameter $P_{Q, R} \mapsto \chi(Q)$. Let $C$ be a set of possible values of $\Delta$ leading to a complete observation, that is, $\phi(y, \delta)=y$ whenever $\delta \in C$, and suppose that $R(C \mid y)=\mathrm{P}_{R}(\Delta \in C \mid Y=y)$ is positive almost surely. Suppose for the moment that $R$ is known, so that the tangent space for $X$ consists only of functions of the form $\mathrm{E}_{Q, R}(a(Y) \mid X)$. If $\dot{\chi}_{Q}(y)$ is an influence function of the parameter $Q \mapsto \chi(Q)$ on the model $\mathcal{Q}$, then

$$
\dot{\psi}_{P_{Q, R}}(x)=\frac{1\{\delta \in C\}}{R(C \mid y)} \dot{\chi}_{Q}(y)
$$

is an influence function for the parameter $\psi\left(P_{F, G}\right)=\chi(Q)$ on the model $\mathcal{P}$. To see this, first note that, indeed, it is a function of $x$, as the indicator $1\{\delta \in C\}$ is nonzero only if $(y, \delta)=x$. Second,

$$
\begin{aligned}
\mathrm{E}_{Q, R} \dot{\psi}_{P_{Q, R}}(X) \mathrm{E}_{Q, R}(a(Y) \mid X) & =\mathrm{E}_{Q, R} \frac{1\{\Delta \in C\}}{R(C \mid Y)} \dot{\chi}_{Q}(Y) a(Y) \\
& =\mathrm{E}_{Q, R} \dot{\chi}_{Q}(Y) a(Y)
\end{aligned}
$$

The influence function we have found is just one of many influence functions, the other ones being obtainable by adding the orthocomplement of the tangent set. This particular influence function corresponds to ignoring incomplete observations altogether but reweighting the influence function for the full model to eliminate the bias caused by such neglect. Usually, ignoring all partial observations does not yield an efficient procedure, and correspondingly this influence function is usually not the efficient influence function.

All other influence functions, including the efficient influence function, can be found by adding the orthocomplement of the tangent set. An attractive way of doing this is:

- by varying $\dot{\chi}_{Q}$ over all possible influence functions for $Q \mapsto \chi(Q)$, combined with - by adding all functions $b(x)$ with $\mathrm{E}_{R}(b(X) \mid Y)=0$.

This is proved in the following lemma. We still assume that $R$ is known; if it is not, then the resulting functions need not even be influence functions.
25.41 Lemma. Suppose that the parameter $Q \mapsto \chi(Q)$ on the model $\mathcal{Q}$ is differentiable at $Q$, and that the conditional probability $R(C \mid Y)=\mathrm{P}(\Delta \in C \mid Y)$ of having a complete observation is bounded away from zero. Then the parameter $P_{Q, R} \mapsto \chi(Q)$ on the model $\left(P_{Q, R}: Q \in \mathcal{Q}\right)$ is differentiable at $P_{Q, R}$ and any of its influence functions can be written in the form

$$
\frac{1\{\delta \in C\}}{R(C \mid y)} \dot{\chi}_{Q}(y)+b(x)
$$

for $\dot{\chi}_{Q}$ an influence function of the parameter $Q \mapsto \chi(Q)$ on the model $\mathcal{Q}$ and a function $b \in L_{2}\left(P_{Q, R}\right)$ satisfying $\mathrm{E}_{R}(b(X) \mid Y)=0$. This decomposition is unique. Conversely, every function of this form is an influence function.

Proof. The function in the display with $b=0$ has already been seen to be an influence function. (Note that it is square-integrable, as required.) Any function $b(X)$ such that $\mathrm{E}_{R}(b(X) \mid Y)=0$ satisfies $\mathrm{E}_{Q, R} b(X) \mathrm{E}_{Q, R}(a(Y) \mid X)=0$ and hence is orthogonal to the tangent set, whence it can be added to any influence function.

To see that the decomposition is unique, it suffices to show that the function as given in the lemma can be identically zero only if $\dot{\chi}_{Q}=0$ and $b=0$. If it is zero, then its conditional expectation with respect to $Y$, which is $\dot{\chi}_{Q}$, is zero, and reinserting this we find that $b=0$ as well.

Conversely, an arbitrary influence function $\dot{\psi}_{P_{Q, R}}$ of $P_{Q, R} \mapsto \chi(Q)$ can be written in the form

$$
\dot{\psi}_{P_{Q, R}}(x)=\frac{1\{\delta \in C\}}{R(C \mid y)} \dot{\chi}(y)+\left[\dot{\psi}_{P_{Q, R}}(x)-\frac{1\{\delta \in C\}}{R(C \mid y)} \dot{\chi}(y)\right] .
$$

For $\dot{\chi}(Y)=\mathrm{E}_{R}\left(\dot{\psi}_{P_{Q, R}}(X) \mid Y\right)$, the conditional expectation of the part within square brackets with respect to $Y$ is zero and hence this part qualifies as a function $b$. This function $\dot{\chi}$ is an influence function for $Q \mapsto \chi(Q)$, as follows from the equality $\mathrm{E}_{Q, R} \mathrm{E}_{R}\left(\dot{\psi}_{P_{Q, R}}(X) \mid Y\right) a(Y)= \mathrm{E}_{Q, R} \dot{\psi}_{P_{Q, R}}(X) \mathrm{E}_{Q, R}(a(Y) \mid X)$ for every $a$.

Even though the functions $\dot{\chi}_{Q}$ and $b$ in the decomposition given in the lemma are uniquely determined, the decomposition is not orthogonal, and (even under CAR) the decomposition does not agree with the decomposition of the (nonparametric) tangent space given in Theorem 25.40. The second term is as the functions $b$ in this theorem, but the leading term is not in the maximal tangent set for $Q$.

The preceding lemma is valid without assuming CAR. Under CAR it obtains an interesting interpretation, because in that case the functions $b$ range exactly over all scores for the parameter $r$ that we would have had if $R$ were completely unknown. If $R$ is known, then these scores are in the orthocomplement of the tangent set and can be added to any influence function to find other influence functions.

A second special feature of CAR is that a similar representation becomes available in the case that $R$ is (partially) unknown. Because the tangent set for the model ( $P_{Q, R}: Q \in \mathcal{Q}, R \in \mathcal{R}$ ) contains the tangent set for the model ( $P_{Q, R}: Q \in \mathcal{Q}$ ) in which $R$ is known, the influence functions for the bigger model are a subset of the influence functions of the smaller model. Because our parameter $\chi(Q)$ depends on $Q$ only, they are exactly those influence functions in the smaller model that are orthogonal to the set ${ }_{R} \dot{\mathcal{P}}_{P_{Q, R}}$ of all score functions for $R$. This is true in general, also without CAR. Under CAR they can be found by subtracting the projections onto the set of scores for $R$.
25.42 Corollary. Suppose that the conditions of the preceding lemma hold and that the tangent space $\dot{\mathcal{P}}_{P_{Q, R}}$ for the model ( $P_{Q, R}: Q \in \mathcal{Q}, R \in \mathcal{R}$ ) is taken to be the sum $\dot{\mathcal{P}}_{P_{Q, R}}+ { }_{R} \dot{\mathcal{P}}_{P_{Q, R}}$ of tangent spaces of scores for $Q$ and $R$ separately. If ${ }_{Q} \dot{\mathcal{P}}_{P_{Q, R}}$ and ${ }_{R} \dot{\mathcal{P}}_{P_{Q, R}}$ are orthogonal, in particular under $C A R$, any influence function of $P_{Q, R} \mapsto \chi(Q)$ for the model $\left(P_{Q, R}: Q \in \mathcal{Q}, R \in \mathcal{R}\right)$ can be obtained by taking the functions given by the preceding lemma and subtracting their projection onto $\varlimsup_{R} \dot{\mathcal{P}}_{P_{Q, R}}$.

Proof. The influence functions for the bigger model are exactly those influence functions for the model in which $R$ is known that are orthogonal to ${ }_{R} \dot{\mathcal{P}}_{P_{Q, R}}$. These do not change
by subtracting their projection onto this space. Thus we can find all influence functions as claimed.

If the score spaces for $Q$ and $R$ are orthogonal, then the projection of an influence function onto $\overline{\operatorname{lin}}_{R} \dot{\mathcal{P}}_{P_{Q, R}}$ is orthogonal to ${ }_{Q} \dot{\mathcal{P}}_{P_{Q, R}}$, and hence the inner products with elements of this set are unaffected by subtracting it. Thus we necessarily obtain an influence function.

The efficient influence function $\tilde{\psi}_{P_{Q, R}}$ is an influence function and hence can be written in the form of Lemma 25.41 for some $\dot{\chi}_{Q}$ and $b$. By definition it is the unique influence function that is contained in the closed linear span of the tangent set. Because the parameter of interest depends on $Q$ only, the efficient influence function is the same (under CAR or, more generally, if $Q \dot{\mathcal{P}}_{P_{Q, R}} \perp_{R} \dot{\mathcal{P}}_{P_{Q, R}}$ ), whether we assume $R$ known or not. One way of finding the efficient influence function is to minimize the variance of an arbitrary influence function as given in Lemma 25.41 over $\dot{\chi}_{Q}$ and $b$.
25.43 Example (Missing at random). In the case of MAR models there is a simple representation for the functions $b(x)$ in Lemma 25.41. Because MAR is a special case of CAR, these functions can be obtained by computing all the scores for $R$ in the model for $(Y, \Delta)$ under the assumption that $R$ is completely unknown, by Theorem 25.40. Suppose that $\Delta$ takes only the values 0 and 1 , where 1 indicates a full observation, as in Example 25.39, and set $\pi(y):=\mathrm{P}(\Delta=1 \mid Y=y)$. Under MAR $\pi(y)$ is actually a function of $\phi(y, 0)$ only. The likelihood for $(Y, \Delta)$ takes the form

$$
q(y) r(\delta \mid y)=q(y) \pi(y)^{\delta}(1-\pi(y))^{1-\delta}
$$

Insert a path $\pi_{t}=\pi+t c$, and differentiate the log likelihood with respect to $t$ at $t=0$ to obtain a score for $R$ of the form

$$
\frac{\delta}{\pi(y)} c(y)-\frac{1-\delta}{1-\pi(y)} c(y)=\frac{\delta-\pi(y)}{\pi(y)(1-\pi)(y)} c(y) .
$$

To remain within the model the functions $\pi_{t}$ and $\pi$, whence $c$, may depend on $y$ only through $\phi(y, 0)$. Apart from this restriction, the preceding display gives a candidate for $b$ in Lemma 25.41 for any $c$, and it gives all such $b$.

Thus, with a slight change of notation any influence function can be written in the form

$$
\frac{\delta}{\pi(y)} \dot{\chi}_{Q}(y)-\frac{\delta-\pi(y)}{\pi(y)} c(y) .
$$

One approach to finding the efficient influence function in this case is first to minimize the variance of this influence function with respect to $c$ and next to optimize over $\dot{\chi} Q$. The first step of this plan can be carried out in general. Minimizing with respect to $c$ is a weighted least-squares problem, whose solution is given by

$$
\tilde{c}(Y)=\mathrm{E}_{Q, R}\left(\dot{\chi}_{Q}(Y) \mid \phi(Y, 0)\right)
$$

To see this it suffices to verify the orthogonality relation, for all $c$,

$$
\frac{\delta}{\pi(y)} \dot{\chi}_{Q}(y)-\frac{\delta-\pi(y)}{\pi(y)} \tilde{c}(y) \perp \frac{\delta-\pi(y)}{\pi(y)} c(y) .
$$

Splitting the inner product of these functions on the first minus sign, we obtain two terms, both of which reduce to $\mathrm{E}_{Q, R} \dot{\chi}_{Q}(Y) c(Y)(1-\pi)(Y) / \pi(Y)$.

### 25.6 Testing

The problem of testing a null hypothesis $H_{0}: \psi(P) \leq 0$ versus the alternative $H_{1}: \psi(P)>0$ is closely connected to the problem of estimating the function $\psi(P)$. It ought to be true that a test based on an asymptotically efficient estimator of $\psi(P)$ is, in an appropriate sense, asymptotically optimal. For real-valued parameters $\psi(P)$ this optimality can be taken in the absolute sense of an asymptotically (locally) uniformly most powerful test. With higherdimensional parameters we run into the same problem of defining a satisfactory notion of asymptotic optimality as encountered for parametric models in Chapter 15. We leave the latter case undiscussed and concentrate on real-valued functionals $\psi: \mathcal{P} \mapsto \mathbb{R}$.

Given a model $\mathcal{P}$ and a measure $P$ on the boundary of the hypotheses, that is, $\psi(P)=0$, we want to study the "local asymptotic power" in a neighborhood of $P$. Defining a local power function in the present infinite-dimensional case is somewhat awkward, because there is no natural "rescaling" of the parameter set, such as in the Euclidean case. We shall utilize submodels corresponding to a tangent set. Given an element $g$ in a tangent set $\dot{\mathcal{P}}_{P}$, let $t \mapsto P_{t, g}$ be a differentiable submodel with score function $g$ along which $\psi$ is differentiable. For every such $g$ for which $\dot{\psi}_{P} g=P \tilde{\psi}_{P} g>0$, the submodel $P_{t, g}$ belongs to the alternative hypothesis $H_{1}$ for (at least) every sufficiently small, positive $t$, because $\psi\left(P_{t, g}\right)=t P \tilde{\psi}_{P} g+o(t)$ if $\psi(P)=0$. We shall study the power at the alternatives $P_{h / \sqrt{n}, g}$.
25.44 Theorem. Let the functional $\psi: \mathcal{P} \mapsto \mathbb{R}$ be differentiable at $P$ relative to the tangent space $\dot{\mathcal{P}}_{P}$ with efficient influence function $\tilde{\psi}_{P}$. Suppose that $\psi(P)=0$. Then for every sequence of power functions $P \mapsto \pi_{n}(P)$ of level- $\alpha$ tests for $H_{0}: \psi(P) \leq 0$, and every $g \in \dot{\mathcal{P}}_{P}$ with $P \tilde{\psi}_{P} g>0$ and every $h>0$,

$$
\limsup _{n \rightarrow \infty} \pi_{n}\left(P_{h / \sqrt{n}, g}\right) \leq 1-\Phi\left(z_{\alpha}-h \frac{P \tilde{\psi}_{P} g}{\left(P \tilde{\psi}_{P}^{2}\right)^{1 / 2}}\right)
$$

Proof. This theorem is essentially Theorem 15.4 applied to sufficiently rich submodels. Because the present situation does not fit exactly in the framework of Chapter 15, we rework the proof. Fix arbitrary $h_{1}$ and $g_{1}$ for which we desire to prove the upper bound. For notational convenience assume that $P g_{1}^{2}=1$.

Fix an orthonormal base $g_{P}=\left(g_{1}, \ldots, g_{m}\right)^{T}$ of an arbitrary finite-dimensional subspace of $\dot{\mathcal{P}}_{P}$ (containing the fixed $g_{1}$ ). For every $g \in \operatorname{lin} g_{P}$, let $t \mapsto P_{t, g}$ be a submodel with score $g$ along which the parameter $\psi$ is differentiable. Each of the submodels $t \mapsto P_{t, g}$ is locally asymptotically normal at $t=0$ by Lemma 25.14. Therefore, with $S^{m-1}$ the unit sphere of $\mathbb{R}^{m}$,

$$
\left(P_{h / \sqrt{n}, a^{T} g_{P}}^{n}: h>0, a \in S^{m-1}\right) \rightsquigarrow\left(N_{m}(h a, I): h>0, a \in S^{m-1}\right)
$$

in the sense of convergence of experiments. Fix a subsequence along which the limsup in the statement of the theorem is taken for $h=h_{1}$ and $g=g_{1}$. By contiguity arguments, we can extract a further subsequence along which the functions $\pi_{n}\left(P_{h / \sqrt{n}, a^{T} g}\right)$ converge pointwise to a limit $\pi(h, a)$ for every $(h, a)$. By Theorem 15.1, the function $\pi(h, a)$ is the power function of a test in the normal limit experiment. If it can be shown that this test is of level $\alpha$ for testing $H_{0}: a^{T} P \tilde{\psi}_{P} g_{P}=0$, then Proposition 15.2 shows that, for every $(a, h)$
with $a^{T} P \tilde{\psi}_{P} g_{P}>0$,

$$
\pi(h, a) \leq 1-\Phi\left(z_{\alpha}-h \frac{a^{T} P \tilde{\psi}_{P} g_{P}}{\left(P \tilde{\psi}_{P} g_{P}^{T} P \tilde{\psi}_{P} g_{P}\right)^{1 / 2}}\right)
$$

The orthogonal projection of $\tilde{\psi}_{P}$ onto lin $g_{P}$ is equal to $\left(P \tilde{\psi}_{P} g_{P}^{T}\right) g_{P}$, and has length $P \tilde{\psi}_{P} g_{P}^{T} P \tilde{\psi}_{P} g_{P}$. By choosing lin $g_{P}$ large enough, we can ensure that this length is arbitrarily close to $P \tilde{\psi}_{P}^{2}$. Choosing $(h, a)=\left(h_{1}, e_{1}\right)$ completes the proof, because $\limsup \pi_{n}\left(P_{h_{1} / \sqrt{n}, g_{1}}\right) \leq \pi\left(h_{1}, e_{1}\right)$, by construction.

To complete the proof, we show that $\pi$ is of level $\alpha$. Fix any $h>0$ and an $a \in S^{m-1}$ such that $a^{T} P \tilde{\psi}_{P} g_{P}<0$. Then

$$
\psi\left(P_{h / \sqrt{n}, a^{T} g}\right)=\psi(P)+\frac{h}{\sqrt{n}}\left(a^{T} P \tilde{\psi}_{P} g_{P}+o(1)\right)
$$

is negative for sufficiently large $n$. Hence $P_{h / \sqrt{n}, a^{T} g}$ belongs to $H_{0}$ and

$$
\pi(h, a)=\lim \pi_{n}\left(P_{h / \sqrt{n}, a^{T} g}\right) \leq \alpha .
$$

Thus, the test with power function $\pi$ is of level $\alpha$ for testing $H_{0}: a^{T} P \tilde{\psi}_{P} g_{P}<0$. By continuity it is of level $\alpha$ for testing $H_{0}: a^{T} P \tilde{\psi}_{P} g_{P} \leq 0$.

As a consequence of the preceding theorem, a test based on an efficient estimator for $\psi(P)$ is automatically "locally uniformly most powerful": Its power function attains the upper bound given by the theorem. More precisely, suppose that the sequence of estimators $T_{n}$ is asymptotically efficient at $P$ and that $S_{n}$ is a consistent sequence of estimators of its asymptotic variance. Then the test that rejects $H_{0}: \psi(P)=0$ for $\sqrt{n} T_{n} / S_{n} \geq z_{\alpha}$ attains the upper bound of the theorem.
25.45 Lemma. Let the functional $\psi: \mathcal{P} \mapsto \mathbb{R}$ be differentiable at $P$ with $\psi(P)=0$. Suppose that the sequence $T_{n}$ is regular at $P$ with a $N\left(0, P \tilde{\psi}_{P}^{2}\right)$-limit distribution. Furthermore, suppose that $S_{n}^{2} \xrightarrow{\mathrm{P}} P \tilde{\psi}_{P}^{2}$. Then, for every $h \geq 0$ and $g \in \dot{\mathcal{P}}_{P}$,

$$
\lim _{n \rightarrow \infty} \mathrm{P}_{h / \sqrt{n}, g}\left(\frac{\sqrt{n} T_{n}}{S_{n}} \geq z_{\alpha}\right)=1-\Phi\left(z_{\alpha}-h \frac{P \tilde{\psi}_{P} g}{\left(P \tilde{\psi}_{P}^{2}\right)^{1 / 2}}\right) .
$$

Proof. By the efficiency of $T_{n}$ and the differentiability of $\psi$, the sequence $\sqrt{n} T_{n}$ converges under $P_{h / \sqrt{n}, g}$ to a normal distribution with mean $h P \tilde{\psi}_{P} g$ and variance $P \tilde{\psi}_{P}^{2}$.
25.46 Example (Wilcoxon test). Suppose that the observations are two independent random samples $X_{1}, \ldots, X_{n}$ and $Y_{1}, \ldots, Y_{n}$ from distribution functions $F$ and $G$, respectively. To fit this two-sample problem in the present i.i.d. set-up, we pair the two samples and think of ( $X_{i}, Y_{i}$ ) as a single observation from the product measure $F \times G$ on $\mathbb{R}^{2}$. We wish to test the null hypothesis $H_{0}: \int F d G \leq \frac{1}{2}$ versus the alternative $H_{1}: \int F d G>\frac{1}{2}$. The Wilcoxon test, which rejects for large values of $\int \mathbb{F}_{n} d \mathbb{G}_{n}$, is asymptotically efficient, relative to the model in which $F$ and $G$ are completely unknown. This gives a different perspective on this test, which in Chapters 14 and 15 was seen to be asymptotically efficient for testing location in the logistic location-scale family. Actually, this finding is an
example of the general principle that, in the situation that the underlying distribution of the observations is completely unknown, empirical-type statistics are asymptotically efficient for whatever they naturally estimate or test (also see Example 25.24 and section 25.7). The present conclusion concerning the Wilcoxon test extends to most other test statistics.

By the preceding lemma, the efficiency of the test follows from the efficiency of the Wilcoxon statistic as an estimator for the function $\psi(F \times G)=\int F d G$. This may be proved by Theorem 25.47, or by the following direct argument.

The model $\mathcal{P}$ is the set of all product measures $F \times G$. To generate a tangent set, we can perturb both $F$ and $G$. If $t \mapsto F_{t}$ and $t \mapsto G_{t}$ are differentiable submodels (of the collection of all probability distributions on $\mathbb{R}$ ) with score functions $a$ and $b$ at $t=0$, respectively, then the submodel $t \mapsto F_{t} \times G_{t}$ has score function $a(x)+b(y)$. Thus, as a tangent space we may take the set of all square-integrable functions with mean zero of this type. For simplicity, we could restrict ourselves to bounded functions $a$ and $b$ and use the paths $d F_{t}=(1+t a) d F$ and $d G_{t}=(1+t b) d G$. The closed linear span of the resulting tangent set is the same as before. Then, by simple algebra,

$$
\dot{\psi}_{F \times G}(a, b)=\frac{\partial}{\partial t} \psi\left(F_{t} \times G_{t}\right)_{\mid t=0}=\int\left(1-G_{-}\right) a d F+\int F b d G
$$

We conclude that the function $(x, y) \mapsto\left(1-G_{-}\right)(x)+F(y)$ is an influence function of $\psi$. This is of the form $a(x)+b(y)$ but does not have mean zero; the efficient influence function is found by subtracting the mean.

The efficiency of the Wilcoxon statistic is now clear from Lemma 25.23 and the asymptotic linearity of the Wilcoxon statistic, which is proved by various methods in Chapters 12, 13 , and 20.

## *25.7 Efficiency and the Delta Method

Many estimators can be written as functions $\phi\left(T_{n}\right)$ of other estimators. By the delta method asymptotic normality of $T_{n}$ carries over into the asymptotic normality of $\phi\left(T_{n}\right)$, for every differentiable map $\phi$. Does efficiency of $T_{n}$ carry over into efficiency of $\phi\left(T_{n}\right)$ as well? With the right definitions, the answer ought to be affirmative. The matter is sufficiently useful to deserve a discussion and turns out to be nontrivial. Because the result is true for the functional delta method, applications include the efficiency of the product-limit estimator in the random censoring model and the sample median in the nonparametric model, among many others.

If $T_{n}$ is an estimator of a Euclidean parameter $\psi(P)$ and both $\phi$ and $\psi$ are differentiable, then the question can be answered by a direct calculation of the normal limit distributions. In view of Lemma 25.23, efficiency of $T_{n}$ can be defined by the asymptotic linearity (25.22). By the delta method,

$$
\begin{aligned}
\sqrt{n}\left(\phi\left(T_{n}\right)-\phi \circ \psi(P)\right) & =\phi_{\psi(P)}^{\prime} \sqrt{n}\left(T_{n}-\psi(P)\right)+o_{P}(1) \\
& =\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \phi_{\psi(P)}^{\prime} \tilde{\psi}_{P}\left(X_{i}\right)+o_{P}(1)
\end{aligned}
$$

The asymptotic efficiency of $\phi\left(T_{n}\right)$ follows, provided that the function $x \mapsto \phi_{\psi(P)}^{\prime} \tilde{\psi}_{P}(x)$ is the efficient influence function of the parameter $P \mapsto \phi \circ \psi(P)$. If the coordinates of
$\tilde{\psi}_{P}$ are contained in the closed linear span of the tangent set, then so are the coordinates of $\phi_{\psi(P)}^{\prime} \tilde{\psi}_{P}$, because the matrix multiplication by $\phi_{\psi(P)}^{\prime}$ means taking linear combinations. Furthermore, if $\psi$ is differentiable at $P$ (as a statistical parameter on the model $\mathcal{P}$ ) and $\phi$ is differentiable at $\psi(P)$ (in the ordinary sense of calculus), then

$$
\frac{\phi \circ \psi\left(P_{t}\right)-\phi \circ \psi(P)}{t} \rightarrow \phi_{\psi(P)}^{\prime} \dot{\psi}_{P} g=P \phi_{\psi(P)}^{\prime} \tilde{\psi}_{P} g
$$

Thus the function $\phi_{\psi(P)}^{\prime} \tilde{\psi}_{P}$ is an influence function and hence the efficient influence function.

More involved is the same question, but with $T_{n}$ an estimator of a parameter in a Banach space, for instance a distribution in the space $D[-\infty, \infty]$ or in a space $\ell^{\infty}(\mathcal{F})$. The question is empty until we have defined efficiency for this situation. A definition of asymptotic efficiency of Banach-valued estimators can be based on generalizations of the convolution and minimax theorems to general Banach spaces. ${ }^{\dagger}$ We shall avoid this route and take a more naive approach.

The dual space $\mathbb{D}^{*}$ of a Banach space $\mathbb{D}$ is defined as the collection of all continuous, linear maps $d^{*}: \mathbb{D} \mapsto \mathbb{R}$. If $T_{n}$ is a $\mathbb{D}$-valued estimator for a parameter $\psi(P) \in \mathbb{D}$, then $d^{*} T_{n}$ is a real-valued estimator for the parameter $d^{*} \psi(P) \in \mathbb{R}$. This suggests to defining $T_{n}$ to be asymptotically efficient at $P \in \mathcal{P}$ if $\sqrt{n}\left(T_{n}-\psi(P)\right)$ converges under $P$ in distribution to a tight limit and $d^{*} T_{n}$ is asymptotically efficient at $P$ for estimating $d^{*} \psi(P)$, for every $d^{*} \in \mathbb{D}^{*}$.

This definition presumes that the parameters $d^{*} \psi$ are differentiable at $P$ in the sense of section 25.3. We shall require a bit more. Say that $\psi: \mathcal{P} \mapsto \mathbb{D}$ is differentiable at $P$ relative to a given tangent set $\dot{\mathcal{P}}_{P}$ if there exists a continuous linear map $\dot{\psi}_{P}: L_{2}(P) \mapsto \mathbb{D}$ such that, for every $g \in \dot{\mathcal{P}}_{P}$ and a submodel $t \mapsto P_{t}$ with score function $g$,

$$
\frac{\psi\left(P_{t}\right)-\psi(P)}{t} \rightarrow \dot{\psi}_{P} g .
$$

This implies that every parameter $d^{*} \psi: \mathcal{P} \mapsto \mathbb{R}$ is differentiable at $P$, whence, for every $d^{*} \in \mathbb{D}^{*}$, there exists a function $\tilde{\psi}_{P, d^{*}}: \mathcal{X}_{\mapsto} \mapsto \mathbb{R}$ in the closed linear span of $\dot{\mathcal{P}}_{P}$ such that $d^{*} \dot{\psi}_{P}(g)=P \tilde{\psi}_{P, d^{*}} g$ for every $g \in \dot{\mathcal{P}}_{P}$. The efficiency of $d^{*} T_{n}$ for $d^{*} \psi$ can next be understood in terms of asymptotic linearity of $d^{*} \sqrt{n}\left(T_{n}-\psi(P)\right)$, as in (25.22), with influence function $\tilde{\psi}_{P, d^{*}}$.

To avoid measurability issues, we also allow nonmeasurable functions $T_{n}=T_{n}\left(X_{1}, \ldots\right.$, $X_{n}$ ) of the data as estimators in this section. Let both $\mathbb{D}$ and $\mathbb{E}$ be Banach spaces.
25.47 Theorem. Suppose that $\psi: \mathcal{P} \mapsto \mathbb{D}$ is differentiable at $P$ and takes its values in a subset $\mathbb{D}_{\phi} \subset \mathbb{D}$, and suppose that $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ is Hadamard-differentiable at $\psi(P)$ tangentially to $\overline{\operatorname{lin}} \dot{\psi}_{P}\left(\dot{\mathcal{P}}_{P}\right)$. Then $\phi \circ \psi: \mathcal{P} \mapsto \mathbb{E}$ is differentiable at $P$. If $T_{n}$ is a sequence of estimators with values in $\mathbb{D}_{\phi}$ that is asymptotically efficient at $P$ for estimating $\psi(P)$, then $\phi\left(T_{n}\right)$ is asymptotically efficient at $P$ for estimating $\phi \circ \psi(P)$.

Proof. The differentiability of $\phi \circ \psi$ is essentially a consequence of the chain rule for Hadamard-differentiable functions (see Theorem 20.9) and is proved in the same way. The derivative is the composition $\phi_{\psi(P)}^{\prime} \circ \dot{\psi}_{P}$.

[^7]First, we show that the limit distribution $L$ of the sequence $\sqrt{n}\left(T_{n}-\psi(P)\right)$ concentrates on the subspace $\overline{\operatorname{lin}} \dot{\psi}_{P}\left(\dot{\mathcal{P}}_{P}\right)$. By the Hahn-Banach theorem, for any $S \subset \mathbb{D}$,

$$
\varlimsup_{\operatorname{lin}} \dot{\psi}_{P}\left(\dot{\mathcal{P}}_{P}\right) \cap S=\cap_{d^{*} \in \mathbb{D}^{*}: d^{*} \dot{\psi}_{P}=0}\left\{d \in S: d^{*} d=0\right\} .
$$

For a separable set $S$, we can replace the intersection by a countable subintersection. Because $L$ is tight, it concentrates on a separable set $S$, and hence $L$ gives mass 1 to the left side provided $L\left(d: d^{*} d=0\right)=1$ for every $d^{*}$ as on the right side. This probability is equal to $N\left(0,\left\|\tilde{\psi}_{d^{*} P}\right\|_{P}^{2}\right)\{0\}=1$.

Now we can conclude that under the assumptions the sequence $\sqrt{n}\left(\phi\left(T_{n}\right)-\phi \circ \psi(P)\right)$ converges in distribution to a tight limit, by the functional delta method, Theorem 20.8. Furthermore, for every $e^{*} \in \mathbb{E}^{*}$

$$
\sqrt{n}\left(e^{*} \phi\left(T_{n}\right)-e^{*} \phi \circ \psi(P)\right)=e^{*} \phi_{\psi(P)}^{\prime} \sqrt{n}\left(T_{n}-\psi(P)\right)+o_{P}(1)
$$

where, if necessary, we can extend the definition of $d^{*}=e^{*} \phi_{\psi(P)}^{\prime}$ to all of $\mathbb{D}$ in view of the Hahn-Banach theorem. Because $d^{*} \in \mathbb{D}^{*}$, the asymptotic efficiency of the sequence $T_{n}$ implies that the latter sequence is asymptotically linear in the influence function $\tilde{\psi}_{P, d^{*}}$. This is also the influence function of the real-valued map $e^{*} \phi \circ \psi$, because

$$
e^{*} \phi_{\psi(P)}^{\prime} \circ \dot{\psi}_{P} g=d^{*} \dot{\psi}_{P} g=P \tilde{\psi}_{P, d^{*}} g, \quad g \in \dot{\mathcal{P}}_{P}
$$

Thus, $e^{*} \phi\left(T_{n}\right)$ is asymptotically efficient at $P$ for estimating $e^{*} \phi \circ \psi(P)$, for every $e^{*} \in \mathbb{E}^{*}$.

The proof of the preceding theorem is relatively simple, because our definition of an efficient estimator sequence, although not unnatural, is relatively involved.

Consider, for instance, the case that $\mathbb{D}=\ell^{\infty}(S)$ for some set $S$. This corresponds to estimating a (bounded) function $s \mapsto \psi(P)(s)$ by a random function $s \mapsto T_{n}(s)$. Then the "marginal estimators" $d^{*} T_{n}$ include the estimators $\pi_{s} T_{n}=T_{n}(s)$ for every fixed $s$ - the coordinate projections $\pi_{s}: d \mapsto d(s)$ are elements of the dual space $\ell^{\infty}(S)^{*}-$, but include many other, more complicated functions of $T_{n}$ as well. Checking the efficiency of every marginal of the general type $d^{*} T_{n}$ may be cumbersome.

The deeper result of this section is that this is not necessary. Under the conditions of Theorem 17.14, the limit distribution of the sequence $\sqrt{n}\left(T_{n}-\psi(P)\right)$ in $\ell^{\infty}(S)$ is determined by the limit distributions of these processes evaluated at finite sets of "times" $s_{1}, \ldots, s_{k}$. Thus, we may hope that the asymptotic efficiency of $T_{n}$ can also be characterized by the behavior of the marginals $T_{n}(s)$ only. Our definition of a differentiable parameter $\psi: \mathcal{P} \mapsto \mathbb{D}$ is exactly right for this purpose.
25.48 Theorem (Efficiency in $\ell^{\infty}(S)$ ). Suppose that $\psi: \mathcal{P} \mapsto \ell^{\infty}(S)$ is differentiable at $P$, and suppose that $T_{n}(s)$ is asymptotically efficient at $P$ for estimating $\psi(P)(s)$, for every $s \in S$. Then $T_{n}$ is asymptotically efficient at $P$ provided that the sequence $\sqrt{n}\left(T_{n}-\psi(P)\right)$ converges under $P$ in distribution to a tight limit in $\ell^{\infty}(S)$.

The theorem is a consequence of a more general principle that obtains the efficiency of $T_{n}$ from the efficiency of $d^{*} T_{n}$ for a sufficient number of elements $d^{*} \in \mathbb{D}^{*}$. By definition, efficiency of $T_{n}$ means efficiency of $d^{*} T_{n}$ for all $d^{*} \in \mathbb{D}^{*}$. In the preceding theorem the efficiency is deduced from efficiency of the estimators $\pi_{s} T_{n}$ for all coordinate projections $\pi_{s}$
on $\ell^{\infty}(S)$. The coordinate projections are a fairly small subset of the dual space of $\ell^{\infty}(S)$. What makes them work is the fact that they are of norm 1 and satisfy $\|z\|_{S}=\sup _{s}\left|\pi_{s} z\right|$.
25.49 Lemma. Suppose that $\psi: \mathcal{P} \mapsto \mathbb{D}$ is differentiable at $P$, and suppose that $d^{\prime} T_{n}$ is asymptotically efficient at $P$ for estimating $d^{\prime} \psi(P)$ for every $d^{\prime}$ in a subset $\mathbb{D}^{\prime} \subset \mathbb{D}^{*}$ such that, for some constant C,

$$
\|d\| \leq C \sup _{d^{\prime} \in \mathbb{D}^{\prime},\left\|d^{\prime}\right\| \leq 1}\left|d^{\prime}(d)\right| .
$$

Then $T_{n}$ is asymptotically efficient at $P$ provided that the sequence $\sqrt{n}\left(T_{n}-\psi(P)\right)$ is asymptotically tight under $P$.

Proof. The efficiency of all estimators $d^{\prime} T_{n}$ for every $d^{\prime} \in \mathbb{D}^{\prime}$ implies their asymptotic linearity. This shows that $d^{\prime} T_{n}$ is also asymptotically linear and efficient for every $d^{\prime} \in$ lin $\mathbb{D}^{\prime}$. Thus, it is no loss of generality to assume that $\mathbb{D}^{\prime}$ is a linear space.

By Prohorov's theorem, every subsequence of $\sqrt{n}\left(T_{n}-\psi(P)\right)$ has a further subsequence that converges weakly under $P$ to a tight limit $T$. For simplicity, assume that the whole sequence converges; otherwise argue along subsequences. By the continuous-mapping theorem, $d^{*} \sqrt{n}\left(T_{n}-\psi(P)\right)$ converges in distribution to $d^{*} T$ for every $d^{*} \in \mathbb{D}^{*}$. By the assumption of efficiency, the sequence $d^{*} \sqrt{n}\left(T_{n}-\psi(P)\right)$ is asymptotically linear in the influence function $\tilde{\psi}_{P, d^{*}}$ for every $d^{*} \in \mathbb{D}^{\prime}$. Thus, the variable $d^{*} T$ is normally distributed with mean zero and variance $P \tilde{\psi}_{P, d^{*}}^{2}$ for every $d^{*} \in \mathbb{D}^{\prime}$. We show below that this is then automatically true for every $d^{*} \in \mathbb{D}^{*}$.

By Le Cam's third lemma (which by inspection of its proof can be seen to be valid for general metric spaces), the sequence $\sqrt{n}\left(T_{n}-\psi(P)\right)$ is asymptotically tight under $P_{1 / \sqrt{n}}$ as well, for every differentiable path $t \mapsto P_{t}$. By the differentiability of $\psi$, the sequence $\sqrt{n}\left(T_{n}-\psi\left(P_{1 / \sqrt{n}}\right)\right)$ is tight also. Then, exactly as in the preceding paragraph, we can conclude that the sequence $d^{*} \sqrt{n}\left(T_{n}-\psi\left(P_{1 / \sqrt{n}}\right)\right)$ converges in distribution to a normal distribution with mean zero and variance $P \tilde{\psi}_{P, d^{*}}^{2}$, for every $d^{*} \in \mathbb{D}^{*}$. Thus, $d^{*} T_{n}$ is asymptotically efficient for estimating $d^{*} \psi(P)$ for every $d^{*} \in \mathbb{D}^{*}$ and hence $T_{n}$ is asymptotically efficient for estimating $\psi(P)$, by definition.

It remains to prove that a tight, random element $T$ in $\mathbb{D}$ such that $d^{*} T$ has law $N(0$, $\left\|d^{*} \dot{\psi}_{P}\right\|^{2}$ ) for every $d^{*} \in \mathbb{D}^{\prime}$ necessarily verifies this same relation for every $d^{*} \in \mathbb{D}^{*} .^{\dagger}$ First assume that $\mathbb{D}=\ell^{\infty}(S)$ and that $\mathbb{D}^{\prime}$ is the linear space spanned by all coordinate projections.

Because $T$ is tight, there exists a semimetric $\rho$ on $S$ such that $S$ is totally bounded and almost all sample paths of $T$ are contained in $U C(S, \rho)$ (see Lemma 18.15). Then automatically the range of $\dot{\psi}_{P}$ is contained in $U C(S, \rho)$ as well.

To see the latter, we note first that the map $s \mapsto \mathrm{E} T(s) T(u)$ is contained in $U C(S, \rho)$ for every fixed $u$ : If $\rho\left(s_{m}, t_{m}\right) \rightarrow 0$, then $T\left(s_{m}\right)-T\left(t_{m}\right) \rightarrow 0$ almost surely and hence in second mean, in view of the zero-mean normality of $T\left(s_{m}\right)-T\left(t_{m}\right)$ for every $m$, whence $\left|\mathrm{E} T\left(s_{m}\right) T(u)-\mathrm{E} T\left(t_{m}\right) T(u)\right| \rightarrow 0$ by the Cauchy-Schwarz inequality. Thus, the map

$$
s \mapsto \dot{\psi}_{P}\left(\tilde{\psi}_{P, \pi_{u}}\right)(s)=\pi_{s} \dot{\psi}_{P}\left(\tilde{\psi}_{P, \pi_{u}}\right)=\left\langle\tilde{\psi}_{P, \pi_{u}}, \tilde{\psi}_{P, \pi_{s}}\right\rangle_{P}=\mathrm{E} T(u) T(s)
$$

${ }^{\dagger}$ The proof of this lemma would be considerably shorter if we knew already that there exists a tight random element $T$ with values in $\mathbb{D}$ such that $d^{*} T$ has a $N\left(0,\left\|d^{*} \dot{\psi}_{P}\right\|_{P, 2}^{2}\right)$-distribution for every $d^{*} \in \mathbb{D}^{*}$. Then it suffices to show that the distribution of $T$ is uniquely determined by the distributions of $d^{*} T$ for $d^{*} \in \mathbb{D}^{\prime}$.
is contained in the space $U C(S, \rho)$ for every $u$. By the linearity and continuity of the derivative $\dot{\psi}_{P}$, the same is then true for the map $s \mapsto \dot{\psi}_{P}(g)(s)$ for every $g$ in the closed linear span of the gradients $\tilde{\psi}_{P, \pi_{u}}$ as $u$ ranges over $S$. It is even true for every $g$ in the tangent set, because $\dot{\psi}_{P}(g)(s)=\dot{\psi}_{P}(\Pi g)(s)$ for every $g$ and $s$, and $\Pi$ the projection onto the closure of lin $\tilde{\psi}_{P, \pi_{u}}$.

By a minor extension of the Riesz representation theorem for the dual space of $C(\bar{S}, \rho)$, the restriction of a fixed $d^{*} \in \mathbb{D}^{*}$ to $U C(S, \rho)$ takes the form

$$
d^{*} z=\int_{\bar{S}} \bar{z}(s) d \bar{\mu}(s)
$$

for $\bar{\mu}$ a signed Borel measure on the completion $\bar{S}$ of $S$, and $\bar{z}$ the unique continuous extension of $z$ to $\bar{S}$. By discretizing $\bar{\mu}$, using the total boundedness of $S$, we can construct a sequence $d_{m}^{*}$ in $\operatorname{lin}\left\{\pi_{s}: s \in S\right\}$ such that $d_{m}^{*} \rightarrow d^{*}$ pointwise on $U C(S, \rho)$. Then $d_{m}^{*} \dot{\psi}_{P} \rightarrow d^{*} \dot{\psi}_{P}$ pointwise on $\dot{\mathcal{P}}_{P}$. Furthermore, $d_{m}^{*} T \rightarrow d^{*} T$ almost surely, whence in distribution, so that $d^{*} T$ is normally distributed with mean zero. Because $d_{m}^{*} T-d_{n}^{*} T \rightarrow 0$ almost surely, we also have that

$$
\mathrm{E}\left(d_{m}^{*} T-d_{n}^{*} T\right)^{2}=\left\|d_{m}^{*} \dot{\psi}_{P}-d_{n}^{*} \dot{\psi}_{P}\right\|_{P, 2}^{2} \rightarrow 0
$$

whence $d_{m}^{*} \dot{\psi}_{P}$ is a Cauchy sequence in $L_{2}(P)$. We conclude that $d_{m}^{*} \dot{\psi}_{P} \rightarrow d^{*} \dot{\psi}_{P}$ also in norm and $\mathrm{E}\left(d_{m}^{*} T\right)^{2}=\left\|d_{m}^{*} \dot{\psi}_{P}\right\|_{P, 2}^{2} \rightarrow\left\|d^{*} \dot{\psi}_{P}\right\|_{P, 2}^{2}$. Thus, $d^{*} T$ is normally distributed with mean zero and variance $\left\|d^{*} \dot{\psi}_{P}\right\|_{P, 2}^{2}$.

This concludes the proof for $\mathbb{D}$ equal to $\ell^{\infty}(S)$. A general Banach space $\mathbb{D}$ can be embedded in $\ell^{\infty}\left(\mathbb{D}_{1}^{\prime}\right)$, for $\mathbb{D}_{1}^{\prime}=\left\{d^{\prime} \in \mathbb{D}^{\prime},\left\|d^{\prime}\right\| \leq 1\right\}$, by the map $d \rightarrow z_{d}$ defined as $z_{d}\left(d^{\prime}\right)=d^{\prime}(d)$. By assumption, this map is a norm homeomorphism, whence $T$ can be considered to be a tight random element in $\ell^{\infty}\left(\mathbb{D}_{1}^{\prime}\right)$. Next, the preceding argument applies.

Another useful application of the lemma concerns the estimation of functionals $\psi(P)= \left(\psi_{1}(P), \psi_{2}(P)\right)$ with values in a product $\mathbb{D}_{1} \times \mathbb{D}_{2}$ of two Banach spaces. Even though marginal weak convergence does not imply joint weak convergence, marginal efficiency implies joint efficiency!
25.50 Theorem (Efficiency in product spaces). Suppose that $\psi_{i}: \mathcal{P} \mapsto \mathbb{D}_{i}$ is differentiable at $P$, and suppose that $T_{n, i}$ is asymptotically efficient at $P$ for estimating $\psi_{i}(P)$, for $i=1,2$. Then ( $T_{n, 1}, T_{n, 2}$ ) is asymptotically efficient at $P$ for estimating ( $\psi_{1}(P), \psi_{2}(P)$ ) provided that the sequences $\sqrt{n}\left(T_{n, i}-\psi_{i}(P)\right)$ are asymptotically tight in $\mathbb{D}_{i}$ under $P$, for $i=1,2$.

Proof. Let $\mathbb{D}^{\prime}$ be the set of all maps $\left(d_{1}, d_{2}\right) \mapsto d_{i}^{*}\left(d_{i}\right)$ for $d_{i}^{*}$ ranging over $\mathbb{D}_{i}^{*}$, and $i=1,2$. By the Hahn-Banach theorem, $\left\|d_{i}\right\|=\sup \left\{\left|d_{i}^{*}\left(d_{i}\right)\right|:\left\|d_{i}^{*}\right\|=1, d_{i}^{*} \in \mathbb{D}_{i}^{*}\right\}$. Thus, the product norm $\left\|\left(d_{1}, d_{2}\right)\right\|=\left\|d_{1}\right\| \vee\left\|d_{2}\right\|$ satisfies the condition of the preceding lemma (with $C=1$ and equality).
25.51 Example (Random censoring). In section 25.10 .1 it is seen that the distribution of $X=(C \wedge T, 1\{T \leq C\})$ in the random censoring model can be any distribution on the sample space. It follows by Example 20.16 that the empirical subdistribution functions $\mathbb{H}_{0 n}$ and $\mathbb{H}_{1 n}$ are asymptotically efficient. By Example 20.15 the product limit estimator is a Hadamard-differentiable functional of the empirical subdistribution functions. Thus, the product limit-estimator is asymptotically efficient.

### 25.8 Efficient Score Equations

The most important method of estimating the parameter in a parametric model is the method of maximum likelihood, and it can usually be reduced to solving the score equations $\sum_{i=1}^{n} \dot{\ell}_{\theta}\left(X_{i}\right)=0$, if necessary in a neighborhood of an initial estimate. A natural generalization to estimating the parameter $\theta$ in a semiparametric model $\left\{P_{\theta, \eta}: \theta \in \Theta, \eta \in H\right\}$ is to solve $\theta$ from the efficient score equations

$$
\sum_{i=1}^{n} \tilde{\ell}_{\theta, \hat{\eta}_{n}}\left(X_{i}\right)=0 .
$$

Here we use the efficient score function instead of the ordinary score function, and we substitute an estimator $\hat{\eta}_{n}$ for the unknown nuisance parameter. A refinement of this method has been applied successfully to a number of examples, and the method is likely to work in many other examples. A disadvantage is that the method requires an explicit form of the efficient score function, or an efficient algorithm to compute it. Because, in general, the efficient score function is defined only implicitly as an orthogonal projection, this may preclude practical implementation.

A variation on this approach is to obtain an estimator $\hat{\eta}_{n}(\theta)$ of $\eta$ for each given value of $\theta$, and next to solve $\theta$ from the equation

$$
\sum_{i=1}^{n} \tilde{\ell}_{\theta, \hat{\eta}_{n}(\theta)}\left(X_{i}\right)=0 .
$$

If $\hat{\theta}_{n}$ is a solution, then it is also a solution of the estimating equation in the preceding display, for $\hat{\eta}_{n}=\hat{\eta}_{n}\left(\hat{\theta}_{n}\right)$. The asymptotic normality of $\hat{\theta}_{n}$ can therefore be proved by the same methods as applying to this estimating equation. Due to our special choice of estimating function, the nature of the dependence of $\hat{\eta}_{n}(\theta)$ on $\theta$ should be irrelevant for the limiting distribution of $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$. Informally, this is because the partial derivative of the estimating equation relative to the $\theta$ inside $\hat{\eta}_{n}(\theta)$ should converge to zero, as is clear from our subsequent discussion of the "no-bias" condition (25.52). The dependence of $\hat{\eta}_{n}(\theta)$ on $\theta$ does play a role for the consistency of $\hat{\theta}_{n}$, but we do not discuss this in this chapter, because the general methods of Chapter 5 apply. For simplicity we adopt the notation as in the first estimating equation, even though for the construction of $\hat{\theta}_{n}$ the two-step procedure, which "profiles out" the nuisance parameter, may be necessary.

In a number of applications the nuisance parameter $\eta$, which is infinite-dimensional, cannot be estimated within the usual order $O\left(n^{-1 / 2}\right)$ for parametric models. Then the classical approach to derive the asymptotic behavior of $Z$-estimators - linearization of the equation in both parameters - is impossible. Instead, we utilize the notion of a Donsker class, as developed in Chapter 19. The auxiliary estimator for the nuisance parameter should satisfy ${ }^{\dagger}$

$$
\begin{gather*}
P_{\hat{\theta}_{n}, \eta} \tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}=o_{P}\left(n^{-1 / 2}+\left\|\hat{\theta}_{n}-\theta\right\|\right),  \tag{25.52}\\
P_{\theta, \eta}\left\|\tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}-\tilde{\ell}_{\theta, \eta}\right\|^{2} \xrightarrow{\mathrm{P}} 0, \quad P_{\hat{\theta}_{n}, \eta}\left\|\tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}\right\|^{2}=O_{P}(1) . \tag{25.53}
\end{gather*}
$$

[^8]The second condition (25.53) merely requires that the "plug-in" estimator $\tilde{\ell}_{\theta, \hat{\eta}_{n}}$ is a consistent estimator for the true efficient influence function. Because $P_{\hat{\theta}_{n}, \eta} \tilde{\ell}_{\hat{\theta}_{n}, \eta}=0$, the first condition (25.52) requires that the "bias" of the plug-in estimator, due to estimating the nuisance parameter, converge to zero faster than $1 / \sqrt{n}$. Such a condition comes out naturally of the proofs. A partial motivation is that the efficient score function is orthogonal to the score functions for the nuisance parameter, so that its expectation should be insensitive to changes in $\eta$.
25.54 Theorem. Suppose that the model $\left\{P_{\theta, \eta}: \theta \in \Theta\right\}$ is differentiable in quadratic mean with respect to $\theta$ at $(\theta, \eta)$ and let the efficient information matrix $\tilde{I}_{\theta, \eta}$ be nonsingular. Assume that (25.52) and (25.53) hold. Let $\hat{\theta}_{n}$ satisfy $\sqrt{n} \mathbb{P}_{n} \tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}=o_{\hat{P}}(1)$ and be consistent for $\theta$. Furthermore, suppose that there exists a Donsker class with square-integrable envelope function that contains every function $\tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}$ with probability tending to 1 . Then the sequence $\hat{\theta}_{n}$ is asymptotically efficient at $(\theta, \eta)$.

Proof. Let $G_{n}\left(\theta^{\prime}, \eta^{\prime}\right)=\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta, \eta}\right) \tilde{\ell}_{\theta^{\prime}, \eta^{\prime}}$ be the empirical process indexed by the functions $\tilde{\ell}_{\theta^{\prime}, \eta^{\prime}}$. By the assumption that the functions $\tilde{\ell}_{\hat{\theta}, \hat{\eta}}$ are contained in a Donsker class, together with (25.53),

$$
G_{n}\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)=G_{n}(\theta, \eta)+o_{P}(1) .
$$

(see Lemma 19.24.) By the defining relationship of $\hat{\theta}_{n}$ and the "no-bias" condition (25.52), this is equivalent to

$$
\sqrt{n}\left(P_{\hat{\theta}_{n}, \eta}-P_{\theta, \eta}\right) \tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}=G_{n}(\theta, \eta)+o_{P}\left(1+\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right) .
$$

The remainder of the proof consists of showing that the left side is asymptotically equivalent to $\left(\tilde{I}_{\theta, \eta}+o_{P}(1)\right) \sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$, from which the theorem follows. Because $\tilde{I}_{\theta, \eta}=P_{\theta, \eta} \tilde{\ell}_{\theta, \eta} \dot{\ell}_{\theta, \eta}^{T}$, the difference of the left side of the preceding display and $\tilde{I}_{\theta, \eta} \sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ can be written as the sum of three terms:

$$
\begin{aligned}
& \sqrt{n} \int \tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}\left(p_{\hat{\theta}_{n}, \eta}^{1 / 2}+p_{\theta, \eta}^{1 / 2}\right)\left[\left(p_{\hat{\theta}_{n}, \eta}^{1 / 2}-p_{\theta, \eta}^{1 / 2}\right)-\frac{1}{2}\left(\hat{\theta}_{n}-\theta\right)^{T} \dot{\ell}_{\theta, \eta} p_{\theta, \eta}^{1 / 2}\right] d \mu \\
& \quad+\int \tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}\left(p_{\hat{\theta}_{n}, \eta}^{1 / 2}-p_{\theta, \eta}^{1 / 2}\right) \frac{1}{2} \dot{\ell}_{\theta, \eta}^{T} p_{\theta, \eta}^{1 / 2} d \mu \sqrt{n}\left(\hat{\theta}_{n}-\theta\right) \\
& \quad-\int\left(\tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}-\tilde{\ell}_{\theta, \eta}\right) \dot{\ell}_{\theta, \eta}^{T} p_{\theta, \eta} d \mu \sqrt{n}\left(\hat{\theta}_{n}-\theta\right)
\end{aligned}
$$

The first and third term can easily be seen to be $o_{P}\left(\sqrt{n}\left\|\hat{\theta}_{n}-\theta\right\|\right)$ by applying the CauchySchwarz inequality together with the differentiability of the model and (25.53). The square of the norm of the integral in the middle term can for every sequence of constants $m_{n} \rightarrow \infty$ be bounded by a multiple of

$$
\begin{aligned}
& m_{n}^{2} \int\left\|\tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}\right\| p_{\theta, \eta}^{1 / 2}\left|p_{\hat{\theta}_{n}, \eta}^{1 / 2}-p_{\theta, \eta}^{1 / 2}\right| d \mu^{2} \\
& \quad+\int\left\|\tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}\right\|^{2}\left(p_{\hat{\theta}_{n}, \eta}+p_{\theta, \eta}\right) d \mu \int_{\left\|\dot{\ell}_{\theta, \eta}\right\|>m_{n}}\left\|\dot{\ell}_{\theta, \eta}\right\|^{2} p_{\theta, \eta} d \mu
\end{aligned}
$$

In view of (25.53), the differentiability of the model in $\theta$, and the Cauchy-Schwarz inequality, the first term converges to zero in probability provided $m_{n} \rightarrow \infty$ sufficiently slowly
to ensure that $m_{n}\left\|\hat{\theta}_{n}-\theta\right\| \xrightarrow{\mathrm{P}} 0$. (Such a sequence exists. If $Z_{n} \xrightarrow{\mathrm{P}} 0$, then there exists a sequence $\varepsilon_{n} \downarrow 0$ such that $\mathrm{P}\left(\left|Z_{n}\right|>\varepsilon_{n}\right) \rightarrow 0$. Then $\varepsilon_{n}^{-1 / 2} Z_{n} \xrightarrow{\mathrm{P}} 0$.) In view of the last part of (25.53), the second term converges to zero in probability for every $m_{n} \rightarrow \infty$. This concludes the proof of the theorem.

The preceding theorem is best understood as applying to the efficient score functions $\tilde{\ell}_{\theta, \eta}$. However, its proof only uses this to ensure that, at the true value $(\theta, \eta)$,

$$
\tilde{I}_{\theta, \eta}=P_{\theta, \eta} \tilde{\ell}_{\theta, \eta} \dot{\ell}_{\theta \eta}^{T} .
$$

The theorem remains true for arbitrary, mean-zero functions $\tilde{\ell}_{\theta, \eta}$ provided that this identity holds. Thus, if an estimator $(\hat{\theta}, \hat{\eta})$ only approximately satisfies the efficient score equation, then the latter can be replaced by an approximation.

The theorem applies to many examples, but its conditions may be too stringent. A modification that can be theoretically carried through under minimal conditions is based on the one-step method. Suppose that we are given a sequence of initial estimators $\tilde{\theta}_{n}$ that is $\sqrt{n}$-consistent for $\theta$. We can assume without loss of generality that the estimators are discretized on a grid of meshwidth $n^{-1 / 2}$, which simplifies the constructions and proof. Then the one-step estimator is defined as

$$
\hat{\theta}_{n}=\tilde{\theta}_{n}+\left(\sum_{i=1}^{n} \tilde{\ell}_{\tilde{\theta}_{n}, \hat{\eta}_{n, i}} \tilde{\ell}_{\tilde{\theta}_{n}, \hat{\eta}_{n, i}}^{T}\left(X_{i}\right)\right)^{-1} \sum_{i=1}^{n} \tilde{\ell}_{\tilde{\theta}_{n}, \hat{\eta}_{n, i}}\left(X_{i}\right) .
$$

The estimator $\hat{\theta}_{n}$ can be considered a one-step iteration of the Newton-Raphson algorithm for solving the equation $\sum \tilde{\ell}_{\theta, \hat{\eta}}\left(X_{i}\right)=0$ with respect to $\theta$, starting at the initial guess $\tilde{\theta}_{n}$. For the benefit of the simple proof, we have made the estimators $\hat{\eta}_{n, i}$ for $\eta$ dependent on the index $i$. In fact, we shall use only two different values for $\hat{\eta}_{n, i}$, one for the first half of the sample and another for the second half. Given estimators $\hat{\eta}_{n}=\hat{\eta}_{n}\left(X_{1}, \ldots, X_{n}\right)$ define $\hat{\eta}_{n, i}$ by, with $m=\lfloor n / 2\rfloor$,

$$
\hat{\eta}_{n, i}= \begin{cases}\hat{\eta}_{m}\left(X_{1}, \ldots, X_{m}\right) & \text { if } i>m \\ \hat{\eta}_{n-m}\left(X_{m+1}, \ldots, X_{n}\right) & \text { if } i \leq m\end{cases}
$$

Thus, for $X_{i}$ belonging to the first half of the sample, we use an estimator $\hat{\eta}_{n, i}$ based on the second half of the sample, and vice versa. This sample-splitting trick is convenient in the proof, because the estimator of $\eta$ used in $\tilde{\ell}_{\theta, \eta}\left(X_{i}\right)$ is always independent of $X_{i}$, simultaneously for $X_{i}$ running through each of the two halves of the sample.

The discretization of $\tilde{\theta}_{n}$ and the sample-splitting are mathematical devices that rarely are useful in practice. However, the conditions of the preceding theorem can now be relaxed to, for every deterministic sequence $\theta_{n}=\theta+O\left(n^{-1 / 2}\right)$,

$$
\begin{gather*}
\sqrt{n} P_{\theta_{n}, \eta} \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n}} \xrightarrow{\mathrm{P}} 0, \quad P_{\theta_{n}, \eta}\left\|\tilde{\ell}_{\theta_{n}, \hat{\eta}_{n}}-\tilde{\ell}_{\theta_{n}, \eta}\right\|^{2} \xrightarrow{\mathrm{P}} 0 .  \tag{25.55}\\
\int\left\|\tilde{\ell}_{\theta_{n}, \eta} d P_{\theta_{n}, \eta}^{1 / 2}-\tilde{\ell}_{\theta, \eta} d P_{\theta, \eta}^{1 / 2}\right\|^{2} \rightarrow 0 . \tag{25.56}
\end{gather*}
$$

25.57 Theorem. Suppose that the model $\left\{P_{\theta, \eta}: \theta \in \Theta\right\}$ is differentiable in quadratic mean with respect to $\theta$ at $(\theta, \eta)$, and let the efficient information matrix $\tilde{I}_{\theta, \eta}$ be nonsingular.

Assume that (25.55) and (25.56) hold. Then the sequence $\hat{\theta}_{n}$ is asymptotically efficient at $(\theta, \eta)$.

Proof. Fix a deterministic sequence of vectors $\theta_{n}=\theta+O\left(n^{-1 / 2}\right)$. By the sample-splitting, the first half of the sum $\sum \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}\left(X_{i}\right)$ is a sum of conditionally independent terms, given the second half of the sample. Thus,

$$
\begin{aligned}
\mathrm{E}_{\theta_{n}, \eta}\left(\sqrt{m} \mathbb{P}_{m}\left(\tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}-\tilde{\ell}_{\theta_{n}, \eta}\right) \mid X_{m+1}, \ldots, X_{n}\right) & =\sqrt{m} P_{\theta_{n}, \eta} \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}} \\
\operatorname{var}_{\theta_{n}, \eta}\left(\sqrt{m} \mathbb{P}_{m}\left(\tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}-\tilde{\ell}_{\theta_{n}, \eta}\right) \mid X_{m+1}, \ldots, X_{n}\right) & \leq P_{\theta_{n}, \eta}\left\|\tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}-\tilde{\ell}_{\theta_{n}, \eta}\right\|^{2}
\end{aligned}
$$

Both expressions converge to zero in probability by assumption (25.55). We conclude that the sum inside the conditional expectations converges conditionally, and hence also unconditionally, to zero in probability. By symmetry, the same is true for the second half of the sample, whence

$$
\sqrt{n} \mathbb{P}_{n}\left(\tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}-\tilde{\ell}_{\theta_{n}, \eta}\right) \xrightarrow{\mathrm{P}} 0 .
$$

We have proved this for the probability under $\left(\theta_{n}, \eta\right)$, but by contiguity the convergence is also under $(\theta, \eta)$.

The second part of the proof is technical, and we only report the result. The condition of differentiabily of the model and (25.56) imply that

$$
\sqrt{n} \mathbb{P}_{n}\left(\tilde{\ell}_{\theta_{n}, \eta}-\tilde{\ell}_{\theta, \eta}\right)+\sqrt{n} P_{\theta, \eta} \tilde{\ell}_{\theta, \eta} \dot{\ell}_{\theta, \eta}^{T}\left(\theta_{n}-\theta\right) \xrightarrow{\mathrm{P}} 0
$$

(see [139], p. 185). Under stronger regularity conditions, this can also be proved by a Taylor expansion of $\tilde{\ell}_{\theta, \eta}$ in $\theta$.) By the definition of the efficient score function as an orthogonal projection, $P_{\theta, \eta} \tilde{\ell}_{\theta, \eta} \dot{\ell}_{\theta, \eta}^{T}=\tilde{I}_{\theta, \eta}$. Combining the preceding displays, we find that

$$
\sqrt{n} \mathbb{P}_{n}\left(\tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}-\tilde{\ell}_{\theta, \eta}\right)+\tilde{I}_{\theta, \eta} \sqrt{n}\left(\theta_{n}-\theta\right) \xrightarrow{\mathrm{P}} 0 .
$$

In view of the discretized nature of $\tilde{\theta}_{n}$, this remains true if the deterministic sequence $\theta_{n}$ is replaced by $\tilde{\theta}_{n}$; see the argument in the proof of Theorem 5.48.

Next we study the estimator for the information matrix. For any vector $h \in \mathbb{R}^{k}$, the triangle inequality yields

$$
\left|\sqrt{\mathbb{P}_{m}\left(h^{T} \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}\right)^{2}}-\sqrt{\mathbb{P}_{m}\left(h^{T} \tilde{\ell}_{\theta_{n}, \eta}\right)^{2}}\right|^{2} \leq \mathbb{P}_{m}\left(h^{T} \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}}-h^{T} \tilde{\ell}_{\theta_{n}, \eta}\right)^{2} .
$$

By (25.55), the conditional expectation under ( $\theta_{n}, \eta$ ) of the right side given $X_{m+1}, \ldots, X_{n}$ converges in probability to zero. A similar statement is valid for the second half of the observations. Combining this with (25.56) and the law of large numbers, we see that

$$
\mathbb{P}_{n} \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}} \tilde{\ell}_{\theta_{n}, \hat{\eta}_{n, i}^{T}} \xrightarrow{\mathrm{P}} \tilde{I}_{\theta, \eta} .
$$

In view of the discretized nature of $\tilde{\theta}_{n}$, this remains true if the deterministic sequence $\theta_{n}$ is replaced by $\tilde{\theta}_{n}$.

The theorem follows combining the results of the last two paragraphs with the definition of $\hat{\theta}_{n}$.

A further refinement is not to restrict the estimator for the efficient score function to be a plug-in type estimator. Both theorems go through if $\tilde{\ell}_{\theta, \hat{\eta}}$ is replaced by a general estimator $\hat{\ell}_{n, \theta}=\hat{\ell}_{n, \theta}\left(\cdot \mid X_{1}, \ldots, X_{n}\right)$, provided that this satisfies the appropriately modified conditions of the theorems, and in the second theorem we use the sample-splitting scheme. In the generalization of Theorem 25.57, condition (25.55) must be replaced by

$$
\begin{equation*}
\sqrt{n} P_{\theta_{n}, \eta} \hat{\ell}_{n, \theta_{n}} \xrightarrow{\mathrm{P}} 0, \quad P_{\theta_{n}, \eta}\left\|\hat{\ell}_{n, \theta_{n}}-\tilde{\ell}_{\theta_{n}, \eta}\right\|^{2} \xrightarrow{\mathrm{P}} 0 . \tag{25.58}
\end{equation*}
$$

The proofs are the same. This opens the door to more tricks and further relaxation of the regularity conditions. An intermediate theorem concerning one-step estimators, but without discretization or sample-splitting, can also be proved under the conditions of Theorem 25.54. This removes the conditions of existence and consistency of solutions to the efficient score equation.

The theorems reduce the problem of efficient estimation of $\theta$ to estimation of the efficient score function. The estimator of the efficient score function must satisfy a "no-bias" and a consistency conditions. The consistency is usually easy to arrange, but the no-bias condition, such as (25.52) or the first part of (25.58), is connected to the structure and the size of the model, as the bias of the efficient score equations must converge to zero at a rate faster than $1 / \sqrt{n}$. Within the context of Theorem 25.54 condition (25.52) is necessary. If it fails, then the sequence $\hat{\theta}_{n}$ is not asymptotically efficient and may even converge at a slower rate than $\sqrt{n}$. This follows by inspection of the proof, which reveals the following adaptation of the theorem. We assume that $\tilde{\ell}_{\theta, \eta}$ is the efficient score function for the true parameter $(\theta, \eta)$ but allow it to be arbitrary (mean-zero) for other parameters.
25.59 Theorem. Suppose that the conditions of Theorem 25.54 hold except possibly condition (25.52). Then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \tilde{I}_{\theta, \eta}^{-1} \tilde{\ell}_{\theta, \eta}\left(X_{i}\right)+\sqrt{n} P_{\hat{\theta}_{n}, \eta} \tilde{\ell}_{\hat{\theta}_{n}, \hat{\eta}_{n}}+o_{P}(1) .
$$

Because by Lemma 25.23 the sequence $\hat{\theta}_{n}$ can be asymptotically efficient (regular with $N\left(0, \tilde{I}_{\theta, \eta}^{-1}\right)$-limit distribution) only if it is asymptotically equivalent to the sum on the right, condition (25.52) is seen to be necessary for efficiency.

The verification of the no-bias condition may be easy due to special properties of the model but may also require considerable effort. The derivative of $P_{\theta, \eta} \tilde{\ell}_{\theta, \hat{\eta}}$ with respect to $\theta$ ought to converge to $\partial / \partial \theta P_{\theta, \eta} \tilde{\ell}_{\theta, \eta}=0$. Therefore, condition (25.52) can usually be simplified to

$$
\sqrt{n} P_{\theta, \eta} \tilde{\ell}_{\theta, \hat{\eta}_{n}} \xrightarrow{\mathrm{P}} 0 .
$$

The dependence on $\hat{\eta}$ is more interesting and complicated. The verification may boil down to a type of Taylor expansion of $P_{\theta, \eta} \tilde{\ell}_{\theta, \hat{\eta}}$ in $\hat{\eta}$ combined with establishing a rate of convergence for $\hat{\eta}$. Because $\eta$ is infinite-dimensional, a Taylor series may be nontrivial. If $\hat{\eta}-\eta$ can
occur as a direction of approach to $\eta$ that leads to a score function $B_{\theta, \eta}(\hat{\eta}-\eta)$, then we can write

$$
\begin{align*}
P_{\theta, \eta} \tilde{\ell}_{\theta, \hat{\eta}}= & \left(P_{\theta, \eta}-P_{\theta, \hat{\eta}}\right)\left(\tilde{\ell}_{\theta, \hat{\eta}}-\tilde{\ell}_{\theta, \eta}\right) \\
& -P_{\theta, \eta} \tilde{\ell}_{\theta, \eta}\left[\frac{p_{\theta, \hat{\eta}}-p_{\theta, \eta}}{p_{\theta, \eta}}-B_{\theta, \eta}(\hat{\eta}-\eta)\right] . \tag{25.60}
\end{align*}
$$

We have used the fact that $P_{\theta, \eta} \tilde{\ell}_{\theta, \eta} B_{\theta, \eta} h=0$ for every $h$, by the orthogonality property of the efficient score function. (The use of $B_{\theta, \eta}(\hat{\eta}-\eta)$ corresponds to a score operator that yields scores $B_{\theta, \eta} h$ from paths of the form $\eta_{t}=\eta+t h$. If we use paths $d \eta_{t}=(1+t h) d \eta$, then $B_{\theta, \eta}(d \hat{\eta} / d \eta-1)$ is appropriate.) The display suggests that the no-bias condition (25.52) is certainly satisfied if $\|\hat{\eta}-\eta\|=O_{P}\left(n^{-1 / 2}\right)$, for $\|\cdot\|$ a norm relative to which the two terms on the right are both of the order $o_{P}(\|\hat{\eta}-\eta\|)$. In cases in which the nuisance parameter is not estimable at $\sqrt{n}$-rate the Taylor expansion must be carried into its secondorder term. If the two terms on the right are both $O_{P}\left(\|\hat{\eta}-\eta\|^{2}\right)$, then it is still sufficient to have $\|\hat{\eta}-\eta\|=o_{P}\left(n^{-1 / 4}\right)$. This observation is based on a crude bound on the bias, an integral in which cancellation could occur, by norms and can therefore be too pessimistic (See [35] for an example.) Special properties of the model may also allow one to take the Taylor expansion even further, with the lower order derivatives vanishing, and then a slower rate of convergence of the nuisance parameter may be sufficient, but no examples of this appear to be known. However, the extreme case that the expression in (25.52) is identically zero occurs in the important class of models that are convex-linear in the parameter.
25.61 Example (Convex-linear models). Suppose that for every fixed $\theta$ the model $\left\{P_{\theta, \eta}: \eta \in H\right\}$ is convex-linear: $H$ is a convex subset of a linear space, and the dependence $\eta \mapsto P_{\theta, \eta}$ is linear. Then for every pair ( $\eta_{1}, \eta$ ) and number $0 \leq t \leq 1$, the convex combination $\eta_{t}=t \eta_{1}+(1-t) \eta$ is a parameter and the distribution $t P_{\theta, \eta_{1}}+(1-t) P_{\theta, \eta}=P_{\theta, \eta_{t}}$ belongs to the model. The score function at $t=0$ of the submodel $t \mapsto P_{\theta, \eta_{t}}$ is

$$
\frac{\partial}{\partial t}_{\mid t=0} \log d P_{\theta, t \eta_{1}+(1-t) \eta}=\frac{d P_{\theta, \eta_{1}}}{d P_{\theta, \eta}}-1 .
$$

Because the efficient score function for $\theta$ is orthogonal to the tangent set for the nuisance parameter, it should satisfy

$$
0=P_{\theta, \eta} \tilde{\ell}_{\theta, \eta}\left(\frac{d P_{\theta, \eta_{1}}}{d P_{\theta, \eta}}-1\right)=P_{\theta, \eta_{1}} \tilde{\ell}_{\theta, \eta} .
$$

This means that the unbiasedness conditions in (25.52) and (25.55) are trivially satisfied, with the expectations $P_{\theta, \eta} \tilde{\ell}_{\theta, \hat{\eta}}$ even equal to 0 .

A particular case in which this convex structure arises is the case of estimating a linear functional in an information-loss model. Suppose we observe $X=m(Y)$ for a known function $m$ and an unobservable variable $Y$ that has an unknown distribution $\eta$ on a measurable space $(\mathcal{Y}, \mathcal{A})$. The distribution $P_{\eta}=\eta \circ m^{-1}$ of $X$ depends linearly on $\eta$. Furthermore, if we are interested in a linear function $\theta=\chi(\eta)$, then the nuisanceparameter space $H_{\theta}=\{\eta: \chi(\eta)=\theta\}$ is a convex subset of the set of probability measures on $(\mathcal{Y}, \mathcal{A})$.

### 25.8.1 Symmetric Location

Suppose that we observe a random sample from a density $\eta(x-\theta)$ that is symmetric about $\theta$. In Example 25.27 it was seen that the efficient score function for $\theta$ is the ordinary score function,

$$
\tilde{\ell}_{\theta, \eta}(x)=-\frac{\eta^{\prime}}{\eta}(x-\theta)
$$

We can apply Theorem 25.57 to construct an asymptotically efficient estimator sequence for $\theta$ under the minimal condition that the density $\eta$ has finite Fisher information for location.

First, as an initial estimator $\tilde{\theta}_{n}$, we may use a discretized $Z$-estimator, solving $\mathbb{P}_{n} \psi(x- \theta)=0$ for a well-behaved, symmetric function $\psi$. For instance, the score function of the logistic density. The $\sqrt{n}$-consistency can be established by Theorem 5.21.

Second, it suffices to construct estimators $\hat{\ell}_{n, \theta}$ that satisfy (25.58). By symmetry, the variables $T_{i}=\left|X_{i}-\theta\right|$ are, for a fixed $\theta$, sampled from the density $g(s)=2 \eta(s) 1\{s>0\}$. We use these variables to construct an estimator $\hat{k}_{n}$ for the function $g^{\prime} / g$, and next we set

$$
\hat{\ell}_{n, \theta}\left(x ; X_{1}, \ldots, X_{n}\right)=-\hat{k}_{n}\left(|x-\theta| ; T_{1}, \ldots, T_{n}\right) \operatorname{sign}(x-\theta) .
$$

Because this function is skew-symmetric about the point $\theta$, the bias condition in (25.58) is satisfied, with a bias of zero. Because the efficient score function can be written in the form

$$
\tilde{\ell}_{\theta, \eta}(x)=-\frac{g^{\prime}}{g}(|x-\theta|) \operatorname{sign}(x-\theta)
$$

the consistency condition in (25.58) reduces to consistency of $\hat{k}_{n}$ for the function $g^{\prime} / g$ in that

$$
\begin{equation*}
\int\left(\hat{k}_{n}-\frac{g^{\prime}}{g}\right)^{2}(s) g(s) d s \xrightarrow{\mathrm{P}} 0 . \tag{25.62}
\end{equation*}
$$

Estimators $\hat{k}_{n}$ can be constructed by several methods, a simple one being the kernel method of density estimation. For a fixed twice continuously differentiable probability density $\omega$ with compact support, a bandwidth parameter $\sigma_{n}$, and further positive tuning parameters $\alpha_{n}, \beta_{n}$, and $\gamma_{n}$, set

$$
\begin{align*}
\hat{g}_{n}(s) & =\frac{1}{\sigma_{n}} \sum_{i=1}^{n} \omega\left(\frac{s-T_{i}}{\sigma_{n}}\right) \\
\hat{k}_{n}(s) & =\frac{\hat{g}_{n}^{\prime}}{\hat{g}_{n}}(s) 1_{\hat{B}_{n}}(s)  \tag{25.63}\\
\hat{B}_{n} & =\left\{s:\left|\hat{g}_{n}^{\prime}(s)\right| \leq \alpha_{n}, \hat{g}_{n}(s) \geq \beta_{n}, s \geq \gamma_{n}\right\}
\end{align*}
$$

Then (25.58) is satisfied provided $\alpha_{n} \uparrow \infty, \beta_{n} \downarrow 0, \gamma_{n} \downarrow 0$, and $\sigma_{n} \downarrow 0$ at appropriate speeds. The proof is technical and is given in the next lemma.

This particular construction shows that efficient estimators for $\theta$ exist under minimal conditions. It is not necessarily recommended for use in practice. However, any good initial estimator $\tilde{\theta}_{n}$ and any method of density or curve estimation may be substituted and will lead to a reasonable estimator for $\theta$, which is theoretically efficient under some regularity conditions.
25.64 Lemma. Let $T_{1}, \ldots, T_{n}$ be a random sample from a density $g$ that is supported and absolutely continuous on $[0, \infty)$ and satisfies $\int\left(g^{\prime} / \sqrt{g}\right)^{2}(s) d s<\infty$. Then $\hat{k}_{n}$ given by (25.63) for a probability density $\omega$ that is twice continuously differentiable and supported on $[-1,1]$ satisfies (25.62), if $\alpha_{n} \uparrow \infty, \gamma_{n} \downarrow 0, \beta_{n} \downarrow 0$, and $\sigma_{n} \downarrow 0$ in such a way that $\sigma_{n} \leq \gamma_{n}, \alpha_{n}^{2} \sigma_{n} / \beta_{n}^{2} \rightarrow 0, n \sigma_{n}^{4} \beta_{n}^{2} \rightarrow \infty$.

Proof. Start by noting that $\|g\|_{\infty} \leq \int\left|g^{\prime}(s)\right| d s \leq \sqrt{I_{g}}$, by the Cauchy-Schwarz inequality. The expectations and variances of $\hat{g}_{n}$ and its derivative are given by

$$
\begin{aligned}
g_{n}(s):=\mathrm{E} \hat{g}_{n}(s) & =\mathrm{E} \frac{1}{\sigma} \omega\left(\frac{s-T_{1}}{\sigma}\right)=\int g(s-\sigma y) \omega(y) d y \\
\operatorname{var} \hat{g}_{n}(s) & =\frac{1}{n \sigma^{2}} \operatorname{var} \omega\left(\frac{s-T_{1}}{\sigma}\right) \leq \frac{1}{n \sigma^{2}}\|\omega\|_{\infty}^{2} \\
\mathrm{E} \hat{g}_{n}^{\prime}(s) & =g_{n}^{\prime}(s)=\int g^{\prime}(s-\sigma y) \omega(y) d y, \quad(s \geq \gamma) \\
\operatorname{var} \hat{g}_{n}^{\prime}(s) & \leq \frac{1}{n \sigma^{4}}\left\|\omega^{\prime}\right\|_{\infty}^{2}
\end{aligned}
$$

By the dominated-convergence theorem, $g_{n}(s) \rightarrow g(s)$, for every $s>0$. Combining this with the preceding display, we conclude that $\hat{g}_{n}(s) \xrightarrow{\mathrm{P}} g(s)$. If $g^{\prime}$ is sufficiently smooth, then the analogous statement is true for $\hat{g}_{n}^{\prime}(s)$. Under only the condition of finite Fisher information for location, this may fail, but we still have that $\hat{g}_{n}^{\prime}(s)-g_{n}^{\prime}(s) \xrightarrow{\mathrm{P}} 0$ for every $s$; furthermore, $g_{n}^{\prime} 1_{[\sigma, \infty)} \rightarrow g^{\prime}$ in $L_{1}$, because

$$
\int_{\sigma}^{\infty}\left|g_{n}^{\prime}-g^{\prime}\right|(s) d s \leq \iint\left|g^{\prime}(s-\sigma y)-g^{\prime}(s)\right| d s \omega(y) d y \rightarrow 0
$$

by the $L_{1}$-continuity theorem on the inner integral, and next the dominated-convergence theorem on the outer integral.

The expectation of the integral in (25.62) restricted to the complement of the set $\hat{B}_{n}$ is equal to

$$
\int\left(\frac{g^{\prime}}{g}\right)^{2}(s) g(s) \mathrm{P}\left(\left|\hat{g}_{n}^{\prime}\right|(s)>\alpha \text { or } \hat{g}_{n}(s)<\beta \text { or } s<\gamma\right) d s
$$

This converges to zero by the dominated-convergence theorem. To see this, note first that $\mathrm{P}\left(\hat{g}_{n}(s)<\beta\right)$ converges to zero for all $s$ such that $g(s)>0$. Second, the probability $\mathrm{P}\left(\left|\hat{g}_{n}^{\prime}\right|(s)>\alpha\right)$ is bounded above by $1\left\{\left|g_{n}^{\prime}\right|(s)>\alpha / 2\right\}+o(1)$, and the Lebesgue measure of the set $\left\{s:\left|g_{n}^{\prime}\right|(s)>\alpha / 2\right\}$ converges to zero, because $g_{n}^{\prime} \rightarrow g^{\prime}$ in $L_{1}$.

On the set $\hat{B}_{n}$ the integrand in (25.62) is the square of the function $\left(\hat{g}_{n}^{\prime} / \hat{g}_{n}-g^{\prime} / g\right) g^{1 / 2}$. This function can be decomposed as

$$
\frac{\hat{g}_{n}^{\prime}}{\hat{g}_{n}}\left(g^{1 / 2}-g_{n}^{1 / 2}\right)+\frac{\left(\hat{g}_{n}^{\prime}-g_{n}^{\prime}\right) g_{n}^{1 / 2}}{\hat{g}_{n}}-\frac{g_{n}^{\prime}\left(\hat{g}_{n}-g_{n}\right)}{g_{n}^{1 / 2} \hat{g}_{n}}+\left(\frac{g_{n}^{\prime}}{g_{n}^{1 / 2}}-\frac{g^{\prime}}{g^{1 / 2}}\right) .
$$

On $\hat{B}_{n}$ the sum of the squares of the four terms on the right is bounded above by

$$
\frac{\alpha^{2}}{\beta^{2}}\left|g_{n}-g\right|+\frac{1}{\beta^{2}}\left(\hat{g}_{n}^{\prime}-g_{n}^{\prime}\right)^{2} g_{n}+\frac{1}{\beta^{2}}\left(\frac{g_{n}^{\prime}}{g_{n}^{1 / 2}}\right)^{2}\left(\hat{g}_{n}-g_{n}\right)^{2}+\left(\frac{g_{n}^{\prime}}{g_{n}^{1 / 2}}-\frac{g^{\prime}}{g^{1 / 2}}\right)^{2} .
$$

The expectations of the integrals over $\hat{B}_{n}$ of these four terms converge to zero. First, the integral over the first term is bounded above by

$$
\frac{\alpha^{2}}{\beta^{2}} \iint_{s>\gamma}|g(s-\sigma t)-g(s)| \omega(t) d t d s \leq \frac{\alpha^{2} \sigma}{\beta^{2}} \int\left|g^{\prime}(t)\right| d t \int|t| \omega(t) d t
$$

Next, the sum of the second and third terms gives the contribution

$$
\frac{1}{n \sigma^{4} \beta^{2}}\left\|\omega^{\prime}\right\|_{\infty}^{2} \int g_{n}(s) d s+\frac{1}{n \sigma^{2} \beta^{2}}\|\omega\|_{\infty}^{2} \int\left(\frac{g_{n}^{\prime}}{g_{n}^{1 / 2}}\right)^{2} d s
$$

The first term in this last display converges to zero, and the second as well, provided the integral remains finite. The latter is certainly the case if the fourth term converges to zero. By the Cauchy-Schwarz inequality,

$$
\frac{\left(\int g^{\prime}(s-\sigma y) \omega(y) d y\right)^{2}}{\int g(s-\sigma y) \omega(y) d y} \leq \int\left(\frac{g^{\prime}}{g^{1 / 2}}\right)^{2}(s-\sigma y) \omega(y) d y .
$$

Using Fubini's theorem, we see that, for any set $B$, and $B^{\sigma}$ its $\sigma$-enlargement,

$$
\int_{B}\left(\frac{g_{n}^{\prime}}{g_{n}^{1 / 2}}\right)^{2}(s) d s \leq \int_{B^{\sigma}}\left(\frac{g^{\prime}}{g^{1 / 2}}\right)^{2} d s
$$

In particular, we have this for $B=B^{\sigma}=\mathbb{R}$, and $B=\{s: g(s)=0\}$. For the second choice of $B$, the sets $B^{\sigma}$ decrease to $B$, by the continuity of $g$. On the complement of $B$, $g_{n}^{\prime} / g_{n}^{1 / 2} \rightarrow g^{\prime} / g^{1 / 2}$ in Lebesgue measure. Thus, by Proposition 2.29, the integral of the fourth term converges to zero.

### 25.8.2 Errors-in-Variables

Let the observations be a random sample of pairs ( $X_{i}, Y_{i}$ ) with the same distribution as

$$
\begin{aligned}
& X=Z+e \\
& Y=\alpha+\beta Z+f,
\end{aligned}
$$

for a bivariate normal vector $(e, f)$ with mean zero and covariance matrix $\Sigma$ and a random variable $Z$ with distribution $\eta$, independent of ( $e, f$ ). Thus $Y$ is a linear regression on a variable $Z$ which is observed with error. The parameter of interest is $\theta=(\alpha, \beta, \Sigma)$ and the nuisance parameter is $\eta$. To make the parameters identifiable one can put restrictions on either $\Sigma$ or $\eta$. It suffices that $\eta$ is not normal (if a degenerate distribution is considered normal with variance zero); alternatively it can be assumed that $\Sigma$ is known up to a scalar.

Given $(\theta, \Sigma)$ the statistic $\psi_{\theta}(X, Y)=(1, \beta) \Sigma^{-1}(X, Y-\alpha)^{T}$ is sufficient (and complete) for $\eta$. This suggests to define estimators for $(\alpha, \beta, \Sigma)$ as the solution of the "conditional score equation" $\mathbb{P}_{n} \tilde{\ell}_{\theta, \hat{\eta}}=0$, for

$$
\tilde{\ell}_{\theta, \eta}(X, Y)=\dot{\ell}_{\theta, \eta}(X, Y)-\mathrm{E}_{\theta}\left(\dot{\ell}_{\theta, \eta}(X, Y) \mid \psi_{\theta}(X, Y)\right) .
$$

This estimating equation has the attractive property of being unbiased in the nuisance parameter, in that

$$
P_{\theta, \eta} \tilde{\ell}_{\theta, \eta^{\prime}}=0, \quad \text { every } \theta, \eta, \eta^{\prime} .
$$

Therefore, the no-bias condition is trivially satisfied, and the estimator $\hat{\eta}$ need only be consistent for $\eta$ (in the sense of (25.53)). One possibility for $\hat{\eta}$ is the maximum likelihood estimator, which can be shown to be consistent by Wald's theorem, under some regularity conditions.

As the notation suggests, the function $\tilde{\ell}_{\theta, \eta}$ is equal to the efficient score function for $\theta$. We can prove this by showing that the closed linear span of the set of nuisance scores contains all measurable, square-integrable functions of $\psi_{\theta}(x, y)$, because then projecting on the nuisance scores is identical to taking the conditional expectation.

As explained in Example 25.61, the functions $p_{\theta, \eta_{1}} / p_{\theta, \eta}-1$ are score functions for the nuisance parameter (at $(\theta, \eta)$ ). As is clear from the factorization theorem or direct calculation, they are functions of the sufficient statistic $\psi_{\theta}(X, Y)$. If some function $b\left(\psi_{\theta}(x, y)\right)$ is orthogonal to all scores of this type and has mean zero, then

$$
\mathrm{E}_{\theta, \eta_{1}} b\left(\psi_{\theta}(X, Y)\right)=\mathrm{E}_{\theta, \eta} b\left(\psi_{\theta}(X, Y)\right)\left(\frac{p_{\theta, \eta_{1}}}{p_{\theta, \eta}}-1\right)=0
$$

Consequently, $b=0$ almost surely by the completeness of $\psi_{\theta}(X, Y)$.
The regularity conditions of Theorem 25.54 can be shown to be satisfied under the condition that $\int|z|^{9} d \eta(z)<\infty$. Because all coordinates of the conditional score function can be written in the form $Q_{\theta}(x, y)+P_{\theta}(x, y) \mathrm{E}_{\eta}\left(Z \mid \psi_{\theta}(X, Y)\right)$ for polynomials $Q_{\theta}$ and $P_{\theta}$ of orders 2 and 1 , respectively, the following lemma is the main part of the verification. ${ }^{\dagger}$
25.65 Lemma. For every $0<\alpha \leq 1$ and every probability distribution $\eta_{0}$ on $\mathbb{R}$ and compact $K \subset(0, \infty)$, there exists an open neighborhood $U$ of $\eta_{0}$ in the weak topology such that the class $\mathcal{F}$ of all functions

$$
(x, y) \mapsto\left(a_{0}+a_{1} x+a_{2} y\right) \frac{\int z e^{z\left(b_{0}+b_{1} x+b_{2} y\right)} e^{-c z^{2}} d \eta(z)}{\int e^{z\left(b_{0}+b_{1} x+b_{2} y\right)} e^{-c z^{2}} d \eta(z)}
$$

with $\eta$ ranging over $U, c$ ranging over $K$, and $a$ and $b$ ranging over compacta in $\mathbb{R}^{3}$, satisfies

$$
\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right) \leq C\left(\frac{1}{\varepsilon}\right)^{V}\left(P(1+|x|+|y|)^{5+2 \alpha+4 / V+\delta}\right)^{V / 2},
$$

for every $V \geq 1 / \alpha$, every measure $P$ on $\mathbb{R}^{2}$ and $\delta>0$, and a constant $C$ depending only on $\alpha, \eta_{0}, U, V$, the compacta, and $\delta$.

### 25.9 General Estimating Equations

Taking the efficient score equation as the basis for estimating a parameter is motivated by our wish to construct asymptotically efficient estimators. Perhaps, in certain situations, this is too much to ask, and it is better to aim at estimators that come close to attaining efficiency or are efficient only at the elements of a certain "ideal submodel." The pay off could be a gain in robustness, finite-sample properties, or computational simplicity. The information bounds then have the purpose of quantifying how much efficiency has possibly been lost.

[^9]We retain the requirement that the estimator is $\sqrt{n}$-consistent and regular at every distribution $P$ in the model. A somewhat stronger but still reasonable requirement is that it be asymptotically linear in that

$$
\sqrt{n}\left(T_{n}-\psi(P)\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{\psi}_{P}\left(X_{i}\right)+o_{P}(1) .
$$

This type of expansion and regularity implies that $\dot{\psi}_{P}$ is an influence function of the parameter $\psi(P)$, and the difference $\dot{\psi}_{P}-\tilde{\psi}_{P}$ must be orthogonal to the tangent set $\dot{\mathcal{P}}_{P}$.

This suggests that we compute the set of all influence functions to obtain an indication of which estimators $T_{n}$ might be possible. If there is a nice parametrization $\dot{\psi}_{\theta, \tau}$ of these sets of functions in terms of a parameter of interest $\theta$ and a nuisance parameter $\tau$, then a possible estimation procedure is to solve $\theta$ from the estimating equation, for given $\tau$,

$$
\sum_{i=1}^{n} \dot{\psi}_{\theta, \tau}\left(X_{i}\right)=0 .
$$

The choice of the parameter $\tau$ determines the efficiency of the estimator $\hat{\theta}$. Rather than fixing it at some value we also can make it data-dependent to obtain efficiency at every element of a given submodel, or perhaps even the whole model. The resulting estimator can be analyzed with the help of, for example, Theorem 5.31.

If the model is parametrized by a partitioned parameter $(\theta, \eta)$, then any influence function for $\theta$ must be orthogonal to the scores for the nuisance parameter $\eta$. The parameter $\tau$ might be indexing both the nuisance parameter $\eta$ and "position" in the tangent set at a given $(\theta, \eta)$. Then the unknown $\eta$ (or the aspect of it that plays a role in $\tau$ ) must be replaced by an estimator. The same reasoning as for the "no-bias" condition discussed in (25.60) allows us to hope that the resulting estimator for $\theta$ behaves as if the true $\eta$ had been used.
25.66 Example (Regression). In the regression model considered in Example 25.28, the set of nuisance scores is the orthocomplement of the set $e \mathcal{H}$ of all functions of the form $(x, y) \mapsto\left(y-g_{\theta}(x)\right) h(x)$, up to centering at mean zero. The efficient score function for $\theta$ is equal to the projection of the score for $\theta$ onto the set $e \mathcal{H}$, and an arbitrary influence function is obtained, up to a constant, by adding any element from $e \mathcal{H}$ to this. The estimating equation

$$
\sum_{i=1}^{n}\left(Y_{i}-g_{\theta}\left(X_{i}\right)\right) h\left(X_{i}\right)=0
$$

leads to an estimator with influence function in the direction of $\left(y-g_{\theta}(x)\right) h(x)$. Because the equation is unbiased for any $h$, we easily obtain $\sqrt{n}$-consistent estimators, even for datadependent $h$. The estimator is more efficient if $h$ is closer to the function $\dot{g}_{\theta}(x) / \mathrm{E}_{\eta}\left(e^{2} \mid X=\right. x)$, which gives the efficient influence function. For full efficiency it is necessary to estimate the function $x \mapsto \mathrm{E}_{\eta}\left(e^{2} \mid X=x\right)$ nonparametrically, where consistency (for the right norm) suffices.
25.67 Example (Missing at random). In Lemma 25.41 and Example 25.43 the influence functions in a MAR model are characterized as the sums of reweighted influence functions in the original model and the influence functions obtained from the MAR specification. If
the function $\pi$ is known, then this leads to estimating equations of the form

$$
\sum_{i=1}^{n} \frac{\Delta_{i}}{\pi\left(Y_{i}\right)} \dot{\psi}_{\theta, \tau}\left(X_{i}\right)-\sum_{i=1}^{n} \frac{\Delta_{i}-\pi\left(Y_{i}\right)}{\pi\left(Y_{i}\right)} c\left(Y_{i}\right)=0 .
$$

For instance, if the original model is the regression model in the preceding example, then $\dot{\psi}_{\theta, \tau}(y)$ is $\left(y-g_{\theta}(x)\right) h(x)$. The efficiency of the estimator is influenced by the choice of $c$ (the optimal choice is given in Example 25.43) and the choice of $\dot{\psi}_{\theta, \tau}$. (The efficient influence function of the original model need not be efficient here.) If $\pi$ is correctly specified, then the second part of the estimating equation is unbiased for any $c$, and the asymptotic variance when using a random $c$ should be the same as when using the limiting value of $c$.

### 25.10 Maximum Likelihood Estimators

Estimators for parameters in semiparametric models can be constructed by any methodfor instance, $M$-estimation or $Z$-estimation. However, the most important method to obtain asymptotically efficient estimators may be the method of maximum likelihood, just as in the case of parametric models. In this section we discuss the definitions of likelihoods and give some examples in which maximum likelihood estimators can be analyzed by direct methods. In Sections 25.11 and 25.12 we discuss two general approaches for analyzing these estimators.

Because many semiparametric models are not dominated or are defined in terms of densities that maximize to infinity, the functions that are called the "likelihoods" of the models must be chosen with care. For some models a likelihood can be taken equal to a density with respect to a dominating measure, but for other models we use an "empirical likelihood." Mixtures of these situations occur as well, and sometimes it is fruitful to incorporate a "penalty" in the likelihood, yielding a "penalized likelihood estimator"; maximize the likelihood over a set of parameters that changes with $n$, yielding a "sieved likelihood estimator"; or group the data in some way before writing down a likelihood. To bring out this difference with the classical, parametric maximum likelihood estimators, our present estimators are sometimes referred to as "nonparametric maximum likelihood estimators" (NPMLE), although semiparametric rather than nonparametric seems more correct. Thus we do not give an abstract definition of "likelihood," but describe "likelihoods that work" for particular examples. We denote the likelihood for the parameter $P$ given one observation $x$ by $\operatorname{lik}(P)(x)$.

Given a measure $P$, write $P\{x\}$ for the measure of the one-point set $\{x\}$. The function $x \mapsto P\{x\}$ may be considered the density of $P$, or its absolutely continuous part, with respect to counting measure. The empirical likelihood of a sample $X_{1}, \ldots, X_{n}$ is the function,

$$
P \mapsto \prod_{i=1}^{n} P\left\{X_{i}\right\} .
$$

Given a model $\mathcal{P}$, a maximum likelihood estimator could be defined as the distribution $\hat{P}$ that maximizes the empirical likelihood over $\mathcal{P}$. Such an estimator may or may not exist.
25.68 Example (Empirical distribution). Let $\mathcal{P}$ be the set of all probability distributions on the measurable space ( $\mathcal{X}, \mathcal{A}$ ) (in which one-point sets are measurable). Then, for $n$
fixed different values $x_{1}, \ldots, x_{n}$, the vector $\left(P\left\{x_{1}\right\}, \ldots, P\left\{x_{n}\right\}\right)$ ranges over all vectors $p \geq 0$ such that $\sum p_{i} \leq 1$ when $P$ ranges over $\mathcal{P}$. To maximize $p \mapsto \prod_{i} p_{i}$, it is clearly best to choose $p$ maximal: $\sum_{i} p_{i}=1$. Then, by symmetry, the maximizer must be $p=(1 / n, \ldots, 1 / n)$. Thus, the empirical distribution $\mathbb{P}_{n}=n^{-1} \sum \delta_{X_{i}}$ maximizes the empirical likelihood over the nonparametric model, whence it is referred to as the nonparametric maximum likelihood estimator.

If there are ties in the observations, this argument must be adapted, but the result is the same.

The empirical likelihood is appropriate for the nonparametric model. For instance, in the case of a Euclidean space, even if the model is restricted to distributions with a continuous Lebesgue density $p$, we still cannot use the map $p \mapsto \prod_{i=1}^{n} p\left(X_{i}\right)$ as a likelihood. The supremum of this likelihood is infinite, for we could choose $p$ to have an arbitrarily high, very thin peak at some observation.

Given a partitioned parameter $(\theta, \eta)$, it is sometimes helpful to consider the profile likelihood. Given a likelihood $\operatorname{lik}_{n}(\theta, \eta)\left(X_{1}, \ldots, X_{n}\right)$, the profile likelihood for $\theta$ is defined as the function

$$
\theta \mapsto \sup _{\eta} \operatorname{lik}_{n}(\theta, \eta)\left(X_{1}, \ldots, X_{n}\right)
$$

The supremum is taken over all possible values of $\eta$. The point of maximum of the profile likelihood is exactly the first coordinate of the maximum likelihood estimator $(\hat{\theta}, \hat{\eta})$. We are simply computing the maximum of the likelihood over $(\theta, \eta)$ in two steps.

It is rarely possible to compute a profile likelihood explicitly, but its numerical evaluation is often feasible. Then the profile likelihood may serve to reduce the dimension of the likelihood function. Profile likelihood functions are often used in the same way as (ordinary) likelihood functions of parametric models. Apart from taking their points of maximum as estimators $\hat{\theta}$, the second derivative at $\hat{\theta}$ is used as an estimate of minus the inverse of the asymptotic covariance matrix of $\hat{\theta}$. Recent research appears to validate this practice.
25.69 Example (Cox model). Suppose that we observe a random sample from the distribution of $X=(T, Z)$, where the conditional hazard function of the "survival time" $T$ with covariate $Z$ takes the form

$$
\lambda_{T \mid Z}(t)=e^{\theta Z} \lambda(t)
$$

The hazard function $\lambda$ is completely unspecified. The density of the observation $X=(T, Z)$ is equal to

$$
e^{\theta z} \lambda(t) e^{-e^{\theta z} \Lambda(t)}
$$

where $\Lambda$ is the primitive function of $\lambda$ (with $\Lambda(0)=0$ ). The usual estimator for $(\theta, \Lambda)$ based on a sample of size $n$ from this model is the maximum likelihood estimator $(\hat{\theta}, \hat{\Lambda})$, where the likelihood is defined as, with $\Lambda\{t\}$ the jump of $\Lambda$ at $t$,

$$
(\theta, \Lambda) \mapsto \prod_{i=1}^{n} e^{\theta z_{i}} \Lambda\left\{t_{i}\right\} e^{-e^{\theta z_{i}} \Lambda\left(t_{i}\right)}
$$

This is the product of the density at the observations, but with the hazard function $\lambda(t)$ replaced by the jumps $\Lambda\{t\}$ of the cumulative hazard function. (This likelihood is close
but not exactly equal to the empirical likelihood of the model.) The form of the likelihood forces the maximizer $\hat{\Lambda}$ to be a jump function with jumps at the observed "deaths" $t_{i}$, only and hence the likelihood can be reduced to a function of the unknowns $\Lambda\left\{t_{1}\right\}, \ldots, \Lambda\left\{t_{n}\right\}$. It appears to be impossible to derive the maximizers $(\hat{\theta}, \hat{\Lambda})$ in closed-form formulas, but we can make some headway in characterizing the maximum likelihood estimators by "profiling out" the nuisance parameter $\Lambda$. Elementary calculus shows that, for a fixed $\theta$, the function

$$
\left(\lambda_{1}, \ldots, \lambda_{n}\right) \mapsto \prod_{i=1}^{n} e^{\theta z_{i}} \lambda_{i} e^{-e^{\theta z_{i}} \sum_{j: t_{j} \leq t_{i}} \lambda_{j}}
$$

is maximal for

$$
\frac{1}{\lambda_{k}}=\sum_{i: t_{i} \geq t_{k}} e^{\theta z_{i}} .
$$

The profile likelihood for $\theta$ is the supremum of the likelihood over $\Lambda$ for fixed $\theta$. In view of the preceding display this is given by

$$
\theta \mapsto \prod_{i=1}^{n} \frac{e^{\theta z_{i}}}{\sum_{j: t_{j} \geq t_{i}} e^{\theta z_{j}}} e^{-1}
$$

The latter expression is known as the Cox partial likelihood. The original motivation for this criterion function is that the terms in the product are the conditional probabilities that the $i$ th subject dies at time $i$ given that one of the subjects at risk dies at that time. The maximum likelihood estimator for $\Lambda$ is the step function with jumps

$$
\hat{\Lambda}\left\{t_{k}\right\}=\frac{1}{\sum_{i: t_{i} \geq t_{k}} \hat{\theta}_{z_{i}}}
$$

The estimators $\hat{\theta}$ and $\hat{\Lambda}$ are asymptotically efficient, under some restrictions. (See section 25.12.1.) We note that we have ignored the fact that jumps of hazard functions are smaller than 1 and have maximized over all measures $\Lambda$.
25.70 Example (Scale mixture). Suppose we observe a sample from the distribution of $X=\theta+Z \varepsilon$, where the unobservable variables $Z$ and $\varepsilon$ are independent with completely unknown distribution $\eta$ and a known density $\phi$, respectively. Thus, the observation has a mixture density $\int p_{\theta}(x \mid z) d \eta(z)$ for the kernel

$$
p_{\theta}(x \mid z)=\frac{1}{z} \phi\left(\frac{x-\theta}{z}\right) .
$$

If $\phi$ is symmetric about zero, then the mixture density is symmetric about $\theta$, and we can estimate $\theta$ asymptotically efficiently with a fully adaptive estimator, as discussed in Section 25.8.1. Alternatively, we can take the mixture form of the underlying distribution into account and use, for instance, the maximum likelihood estimator, which maximizes the likelihood

$$
(\theta, \eta) \mapsto \prod_{i=1}^{n} \int p_{\theta}\left(X_{i} \mid z\right) d \eta(z)
$$

Under some conditions this estimator is asymptotically efficient.

Because the efficient score function for $\theta$ equals the ordinary score function for $\theta$, the maximum likelihood estimator satisfies the efficient score equation $\mathbb{P}_{n} \tilde{\ell}_{\theta, \eta}=0$. By the convexity of the model in $\eta$, this equation is unbiased in $\eta$. Thus, the asymptotic efficiency of the maximum likelihood estimator $\hat{\theta}$ follows under the regularity conditions of Theorem 25.54. Consistency of the sequence of maximum likelihood estimators $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ for the product of the Euclidean and the weak topology can be proved by the method of Wald. The verification that the functions $\tilde{\ell}_{\theta, \eta}$ form a Donsker class is nontrivial but is possible using the techniques of Chapter 19.
25.71 Example (Penalized logistic regression). In this model we observe a random sample from the distribution of $X=(V, W, Y)$, for a 0-1 variable $Y$ that follows the logistic regression model

$$
\mathrm{P}_{\theta, \eta}(Y=1 \mid V, W)=\Psi(\theta V+\eta(W))
$$

where $\Psi(u)=1 /\left(1+e^{-u}\right)$ is the logistic distribution function. Thus, the usual linear regression of ( $V, W$ ) has been replaced by the partial linear regression $\theta V+\eta(W)$, in which $\eta$ ranges over a large set of "smooth functions." For instance, $\eta$ is restricted to the Sobolev class of functions on $[0,1]$ whose $(k-1)$ st derivative exists and is absolutely continuous with $J(\eta)<\infty$, where

$$
J^{2}(\eta)=\int_{0}^{1}\left(\eta^{(k)}(w)\right)^{2} d w
$$

Here $k \geq 1$ is a fixed integer and $\eta^{(k)}$ is the $k$ th derivative of $\eta$ with respect to $z$.
The density of an observation is given by

$$
p_{\theta, \eta}(x)=\Psi(\theta v+\eta(w))^{y}\left(1-\Psi(\theta v+\eta(w))^{1-y} f_{V, W}(v, w) .\right.
$$

We cannot use this directly for defining a likelihood. The resulting maximizer $\hat{\eta}$ would be such that $\hat{\eta}\left(w_{i}\right)=\infty$ for every $w_{i}$ with $y_{i}=1$ and $\hat{\eta}\left(w_{i}\right)=-\infty$ when $y_{i}=0$, or at least we could construct a sequence of finite, smooth $\eta_{m}$ approaching this extreme choice. The problem is that qualitative smoothness assumptions such as $J(\eta)<\infty$ do not restrict $\eta$ on a finite set of points $w_{1}, \ldots, w_{n}$ in any way.

To remedy this situation we can restrict the maximization to a smaller set of $\eta$, which we allow to grow as $n \rightarrow \infty$; for instance, the set of all $\eta$ such that $J(\eta) \leq M_{n}$ for $M_{n} \uparrow \infty$ at a slow rate, or a sequence of spline approximations.

An alternative is to use a penalized likelihood, of the form

$$
(\theta, \eta) \mapsto \mathbb{P}_{n} \log p_{\theta, \eta}-\hat{\lambda}_{n}^{2} J^{2}(\eta) .
$$

Here $\hat{\lambda}_{n}$ is a "smoothing parameter" that determines the importance of the penalty $J^{2}(\eta)$. A large value of $\hat{\lambda}_{n}$ leads to smooth maximizers $\hat{\eta}$, for small values the maximizer is more like the unrestricted maximum likelihood estimator. Intermediate values are best and are often chosen by a data-dependent scheme, such as cross-validation. The penalized estimator $\hat{\theta}$ can be shown to be asymptotically efficient if the smoothing parameter is constructed to satisfy $\hat{\lambda}_{n}=o_{P}\left(n^{-1 / 2}\right)$ and $\hat{\lambda}_{n}^{-1}=O_{P}\left(n^{k /(2 k+1)}\right)$ (see [102]).
25.72 Example (Proportional odds). Suppose that we observe a random sample from the distribution of the variable $X=(T \wedge C, 1\{T \leq C\}, Z)$, in which, given $Z$, the variables
$T$ and $C$ are independent, as in the random censoring model, but with the distribution function $F(t \mid z)$ of $T$ given $Z$ restricted by

$$
\frac{F(t \mid z)}{1-F(t \mid z)}=e^{z^{T} \theta} \eta(t) .
$$

In other words, the conditional odds given $z$ of survival until $t$ follows a Cox-type regression model. The unknown parameter $\eta$ is a nondecreasing, cadlag function from $[0, \infty)$ into itself with $\eta(0)=0$. It is the odds of survival if $\theta=0$ and $T$ is independent of $Z$.

If $\eta$ is absolutely continuous, then the density of $X=(Y, \Delta, Z)$ is

$$
\left(\frac{e^{-z^{T} \theta} \eta^{\prime}(y)\left(1-F_{C}(y-\mid z)\right)}{\left(\eta(y)+e^{-z^{T} \theta}\right)^{2}}\right)^{\delta}\left(\frac{e^{-z^{T} \theta} f_{C}(y \mid z)}{\eta(y)+e^{-z^{T} \theta}}\right)^{1-\delta} f_{Z}(z) .
$$

We cannot use this density as a likelihood, for the supremum is infinite unless we restrict $\eta$ in an important way. Instead, we view $\eta$ as the distribution function of a measure and use the empirical likelihood. The probability that $X=x$ is given by

$$
\left(\frac{e^{-z^{T} \theta} \eta\{y\}\left(1-F_{C}(y-\mid z)\right)}{\left(\eta(y)+e^{-z^{T} \theta}\right)\left(\eta(y-)+e^{-z^{T} \theta}\right)}\right)^{\delta}\left(\frac{e^{-z^{T} \theta} F_{C}(\{y\} \mid z)}{\eta(y)+e^{-z^{T} \theta}}\right)^{1-\delta} F_{Z}\{z\}
$$

For likelihood inference concerning $(\theta, \eta)$ only, we may drop the terms involving $F_{C}$ and $F_{Z}$ and define the likelihood for one observation as

$$
\operatorname{lik}(\theta, \eta)(x)=\left(\frac{e^{-z^{T} \theta} \eta\{y\}}{\left(\eta(y)+e^{-z^{T} \theta}\right)\left(\eta(y-)+e^{-z^{T} \theta}\right)}\right)^{\delta}\left(\frac{e^{-z^{T} \theta}}{\eta(y)+e^{-z^{T} \theta}}\right)^{1-\delta} .
$$

The presence of the jumps $\eta\{y\}$ causes the maximum likelihood estimator $\hat{\eta}$ to be a step function with support points at the observed survival times (the values $y_{i}$ corresponding to $\delta_{i}=1$ ). First, it is clear that each of these points must receive a positive mass. Second, mass to the right of the largest $y_{i}$ such that $\delta_{i}=1$ can be deleted, meanwhile increasing the likelihood. Third, mass assigned to other points can be moved to the closest $y_{i}$ to the right such that $\delta_{i}=1$, again increasing the likelihood. If the biggest observation $y_{i}$ has $\delta_{i}=1$, then $\hat{\eta}\left\{y_{i}\right\}=\infty$ and that observation gives a contribution 1 to the likelihood, because the function $p \mapsto p /(p+r)$ attains for $p \geq 0$ its maximal value 1 at $p=\infty$. On the other hand, if $\delta_{i}=0$ for the largest $y_{i}$, then all jumps of $\hat{\eta}$ must be finite.

The maximum likelihood estimators have been shown to be asymptotically efficient under some conditions in [105].

### 25.10.1 Random Censoring

Suppose that we observe a random sample $\left(X_{1}, \Delta_{1}\right), \ldots,\left(X_{n}, \Delta_{n}\right)$ from the distribution of ( $T \wedge C, 1\{T \leq C\}$ ), in which the "survival time" $T$ and the "censoring time" $C$ are independent with completely unknown distribution functions $F$ and $G$, respectively. The distribution of a typical observation $(X, \Delta)$ satisfies

$$
\begin{aligned}
& \mathrm{P}_{F, G}(X \leq x, \Delta=0)=\int_{[0, x]}(1-F) d G \\
& \mathrm{P}_{F, G}(X \leq x, \Delta=1)=\int_{[0, x]}\left(1-G_{-}\right) d F
\end{aligned}
$$

Consequently, if $F$ and $G$ have densities $f$ and $g$ (relative to some dominating measures), then ( $X, \Delta$ ) has density

$$
(x, \delta) \mapsto((1-F)(x) g(x))^{\delta}\left(\left(1-G_{-}\right)(x) f(x)\right)^{1-\delta}
$$

For $f$ and $g$ interpreted as Lebesgue densities, we cannot use this expression as a factor in a likelihood, as the resulting criterion would have supremum infinity. (Simply choose $f$ or $g$ to have a very high, thin peak at an observation $X_{i}$ with $\Delta_{i}=1$ or $\Delta_{i}=0$, respectively.) Instead, we may take $f$ and $g$ as densities relative to counting measure. This leads to the empirical likelihood

$$
(F, G) \mapsto \prod_{i=1}^{n}\left((1-F)\left(X_{i}\right) G\left\{X_{i}\right\}\right)^{1-\Delta_{i}} \prod_{i=1}^{n}\left(\left(1-G_{-}\right)\left(X_{i}\right) F\left\{X_{i}\right\}\right)^{\Delta_{i}}
$$

In view of the product form, this factorizes in likelihoods for $F$ and $G$ separately. The maximizer $\hat{F}$ of the likelihood $F \mapsto \prod_{i=1}^{n}(1-F)\left(X_{i}\right)^{1-\Delta_{i}} F\left\{X_{i}\right\}^{\Delta_{i}}$ turns out to be the product limit estimator, given in Example 20.15.

That the product limit estimator maximizes the likelihood can be seen by direct arguments, but a slight detour is more insightful. The next lemma shows that under the present model the distribution $P_{F, G}$ of $(X, \Delta)$ can be any distribution on the sample space $[0, \infty) \times\{0,1\}$. In other words, if $F$ and $G$ range over all possible probability distributions on $[0, \infty]$, then $P_{F, G}$ ranges over all distributions on $[0, \infty) \times\{0,1\}$. Moreover, the relationship $(F, G) \leftrightarrow P_{F, G}$ is one-to-one on the interval where $(1-F)(1-G)>0$. As a consequence, there exists a pair ( $\hat{F}, \hat{G}$ ) such that $P_{\hat{F}, \hat{G}}$ is the empirical distribution $\mathbb{P}_{n}$ of the observations

$$
P_{\hat{F}, \hat{G}}\left\{X_{i}, \Delta_{i}\right\}=\mathbb{P}_{n}\left\{X_{i}, \Delta_{i}\right\}, \quad 1 \leq i \leq n
$$

Because the empirical distribution maximizes $P \mapsto \prod_{i=1}^{n} P\left\{X_{i}, \Delta_{i}\right\}$ over all distributions, it follows that $(\hat{F}, \hat{G})$ maximizes $(F, G) \mapsto \prod_{i=1}^{n} P_{F, G}\left\{X_{i}, \Delta_{i}\right\}$ over all $(F, G)$. That $\hat{F}$ is the product limit estimator next follows from Example 20.15.

To complete the discussion, we study the map $(F, G) \leftrightarrow P_{F, G}$. A probability distribution on $[0, \infty) \times\{0,1\}$ can be identified with a pair $\left(H_{0}, H_{1}\right)$ of subdistribution functions on $[0, \infty)$ such that $H_{0}(\infty)+H_{1}(\infty)=1$, by letting $H_{i}(x)$ be the mass of the set $[0, x] \times\{i\}$. A given pair of distribution functions $\left(F_{0}, F_{1}\right)$ on $[0, \infty)$ yields such a pair of subdistribution functions ( $H_{0}, H_{1}$ ), by

$$
\begin{equation*}
H_{0}(x)=\int_{[0, x]}\left(1-F_{1}\right) d F_{0}, \quad H_{1}(x)=\int_{[0, x]}\left(1-F_{0-}\right) d F_{1} \tag{25.73}
\end{equation*}
$$

Conversely, the pair $\left(F_{0}, F_{1}\right)$ can be recovered from a given pair $\left(H_{0}, H_{1}\right)$ by, with $\Delta H_{i}$ the jump in $H_{i}, H=H_{0}+H_{1}$ and $\Lambda_{i}^{c}$ the continuous part of $\Lambda_{i}$,

$$
\begin{gathered}
\Lambda_{0}(x)=\int_{[0, x]} \frac{d H_{0}}{1-H_{-}-\Delta H_{1}}, \quad \Lambda_{1}(x)=\int_{[0, x]} \frac{d H_{1}}{1-H_{-}} \\
1-F_{i}(x)=\prod_{0 \leq s \leq x}\left(1-\Lambda_{i}\{s\}\right) e^{-\Lambda_{i}^{c}(x)}
\end{gathered}
$$

25.74 Lemma. Given any pair ( $H_{0}, H_{1}$ ) of subdistribution functions on $[0, \infty)$ such that $H_{0}(\infty)+H_{1}(\infty)=1$, the preceding display defines a pair ( $F_{0}, F_{1}$ ) of subdistribution functions on $[0, \infty)$ such that (25.73) holds.

Proof. For any distribution function $A$ and cumulative hazard function $B$ on $[0, \infty)$, with $B^{c}$ the continuous part of $B$,

$$
1-A(t)=\prod_{0 \leq s \leq t}(1-B\{s\}) e^{-B^{c}(t)} \text { iff } B(t)=\int_{[0, t]} \frac{d A}{1-A_{-}}
$$

To see this, rewrite the second equality as $\left(1-A_{-}\right) d B=d A$ and $B(0)=A(0)$, and integrate this to rewrite it again as the Volterra equation

$$
(1-A)=1+\int_{[0, \cdot]}\left(1-A_{-}\right) d(-B)
$$

It is well known that the Volterra equation has the first equation of the display as its unique solution. ${ }^{\dagger}$

Combined with the definition of $F_{i}$, the equivalence in the preceding display implies immediately that $d \Lambda_{i}=d F_{i} /\left(1-F_{i-}\right)$. Secondly, as immediate consequences of the definitions,

$$
\begin{gathered}
\left(1-F_{0}\right)\left(1-F_{1}\right)(t)=\prod_{s \leq t}\left(1-\Delta \Lambda_{0}-\Delta \Lambda_{1}+\Delta \Lambda_{0} \Delta \Lambda_{1}\right)(s) e^{-\left(\Lambda_{0}+\Lambda_{1}\right)^{c}(t)} \\
\left(\Lambda_{0}+\Lambda_{1}\right)(t)-\sum_{s \leq t} \Delta \Lambda_{0}(s) \Delta \Lambda_{1}(s)=\int_{[0, t]} \frac{d H}{1-H_{-}}
\end{gathered}
$$

(Split $d H_{0} /\left(1-H_{-}-\Delta H_{1}\right)$ into the parts corresponding to $d H_{0}^{c}$ and $\Delta H_{0}$ and note that $\Delta H_{1}$ may be dropped in the first part.) Combining these equations with the Volterra equation, we obtain that $1-H=\left(1-F_{0}\right)\left(1-F_{1}\right)$. Taken together with $d H_{1}=\left(1-H_{-}\right) d \Lambda_{1}$, we conclude that $d H_{1}=\left(1-F_{0-}\right)\left(1-F_{1-}\right) d \Lambda_{1}=\left(1-F_{0-}\right) d F_{1}$, and similarly $d H_{0}= \left(1-F_{1}\right) d F_{0}$.

### 25.11 Approximately Least-Favorable Submodels

If the maximum likelihood estimator satisfies the efficient score equation $\mathbb{P}_{n} \tilde{\ell}_{\hat{\theta}, \hat{\eta}}=0$, then Theorem 25.54 yields its asymptotic normality, provided that its conditions can be verified for the maximum likelihood estimator $\hat{\eta}$. Somewhat unexpectedly, the efficient score function may not be a "proper" score function and the maximum likelihood estimator may not satisfy the efficient score equation. This is because, by definition, the efficient score function is a projection, and nothing guarantees that this projection is the derivative of the log likelihood along some submodel. If there exists a "least favorable" path $t \mapsto \eta_{t}(\hat{\theta}, \hat{\eta})$ such that $\eta_{0}(\hat{\theta}, \hat{\eta})=\hat{\eta}$, and, for every $x$,

$$
\tilde{\ell}_{\hat{\theta}, \hat{\eta}}(x)=\frac{\partial}{\partial t}_{\mid t=0} \log \operatorname{lik}\left(\hat{\theta}+t, \eta_{t}(\hat{\theta}, \hat{\eta})\right)(x)
$$

then the maximum likelihood estimator satisfies the efficient score equation; if not, then this is not clear. The existence of an exact least favorable submodel appears to be particularly uncertain at the maximum likelihood estimator $(\hat{\theta}, \hat{\eta})$, as this tends to be on the "boundary" of the parameter set.

[^10]A method around this difficulty is to replace the efficient score equation by an approximation. First, it suffices that $(\hat{\theta}, \hat{\eta})$ satisfies the efficient score equation approximately, for Theorem 25.54 goes through provided $\sqrt{n} \mathbb{P}_{n} \tilde{\ell}_{\hat{\theta}, \hat{\eta}}=o_{P}(1)$. Second, it was noted following the proof of Theorem 25.54 that this theorem is valid for estimating equations of the form $\mathbb{P}_{n} \tilde{\ell}_{\theta, \hat{\eta}}=0$ for arbitrary mean-zero functions $\tilde{\ell}_{\theta, \eta}$; its assertion remains correct provided that at the true value of $(\theta, \eta)$ the function $\tilde{\ell}_{\theta, \eta}$ is the efficient score function. This suggests to replace, in our proof, the function $\tilde{\ell}_{\theta, \eta}$ by functions $\tilde{\kappa}_{\theta, \eta}$ that are proper score functions and are close to the efficient score function, at least for the true value of the parameter. These are derived from "approximately-least favorable submodels."

We define such submodels as maps $t \mapsto \eta_{t}(\theta, \eta)$ from a neighborhood of $0 \in \mathbb{R}^{k}$ to the parameter set for $\eta$ with $\eta_{0}(\theta, \eta)=\eta$ (for every $(\theta, \eta)$ ) such that

$$
\tilde{\kappa}_{\theta, \eta}(x)=\frac{\partial}{\partial t}_{\mid t=0} \log \operatorname{lik}\left(\theta+t, \eta_{t}(\theta, \eta)\right)(x)
$$

exists (for every $x$ ) and is equal to the efficient score function at $(\theta, \eta)=\left(\theta_{0}, \eta_{0}\right)$. Thus, the path $t \mapsto \eta_{t}(\theta, \eta)$ must pass through $\eta$ at $t=0$, and at the true parameter $\left(\theta_{0}, \eta_{0}\right)$ the submodel is truly least favorable in that its score is the efficient score for $\theta$. We need such a submodel for every fixed $(\theta, \eta)$, or at least for the true value $\left(\theta_{0}, \eta_{0}\right)$ and every possible value of $(\hat{\theta}, \hat{\eta})$.

If $(\hat{\theta}, \hat{\eta})$ maximizes the likelihood, then the function $t \mapsto \mathbb{P}_{n} \log \operatorname{lik}\left(\theta+t, \eta_{t}(\hat{\theta}, \hat{\eta})\right)$ is maximal at $t=0$ and hence $(\hat{\theta}, \hat{\eta})$ satisfies the stationary equation $\mathbb{P}_{n} \tilde{\kappa}_{\hat{\theta}, \hat{\eta}}=0$. Now Theorem 25.54, with $\tilde{\ell}_{\theta, \eta}$ replaced by $\tilde{\kappa}_{\theta, \eta}$, yields the asymptotic efficiency of $\hat{\theta}_{n}$. For easy reference we reformulate the theorem.

$$
\begin{array}{r}
P_{\hat{\theta}_{n}, \eta_{0}} \tilde{\kappa}_{\hat{\theta}_{n}, \hat{\eta}_{n}}=o_{P}\left(n^{-1 / 2}+\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right) \\
P_{\theta_{0}, \eta_{0}}\left\|\tilde{\kappa}_{\hat{\theta}_{n}, \hat{\eta}_{n}}-\tilde{\kappa}_{\theta_{0}, \eta_{0}}\right\|^{2} \xrightarrow{\mathrm{P}} 0, \quad P_{\hat{\theta}_{n}, \eta_{0}}\left\|\tilde{\kappa}_{\hat{\theta}_{n}, \hat{\eta}_{n}}\right\|^{2}=O_{P}(1) \tag{25.76}
\end{array}
$$

25.77 Theorem. Suppose that the model $\left\{P_{\theta, \eta}: \theta \in \Theta\right\}$, is differentiable in quadratic mean with respect to $\theta$ at $\left(\theta_{0}, \eta_{0}\right)$ and let the efficient information matrix $\tilde{I}_{\theta_{0}, \eta_{0}}$ be nonsingular. Assume that $\tilde{\kappa}_{\theta, \eta}$ are the score functions of approximately least-favorable submodels (at $\left.\left(\theta_{0}, \eta_{0}\right)\right)$, that the functions $\tilde{\kappa}_{\hat{\theta}, \hat{\eta}}$ belong to a $P_{\theta_{0}, \eta_{0}}$-Donsker class with square-integrable envelope with probability tending to 1 , and that (25.75) and (25.76) hold. Then the maximum likelihood estimator $\hat{\theta}_{n}$ is asymptotically efficient at $\left(\theta_{0}, \eta_{0}\right)$ provided that it is consistent.

The no-bias condition (25.75) can be analyzed as in (25.60), with $\tilde{\ell}_{\theta, \hat{\eta}}$ replaced by $\tilde{\kappa}_{\theta, \hat{\eta}}$. Alternatively, it may be useful to avoid evaluating the efficient score function at $\hat{\theta}$ or $\hat{\eta}$, and (25.60) may be adapted to

$$
\begin{align*}
& P_{\hat{\theta}, \eta_{0}} \tilde{\kappa}_{\hat{\theta}, \hat{\eta}}=\left(P_{\hat{\theta}, \eta_{0}}-P_{\hat{\theta}, \hat{\eta}}\right)\left(\tilde{\kappa}_{\hat{\theta}, \hat{\eta}}-\tilde{\kappa}_{\theta_{0}, \eta_{0}}\right) \\
& \quad-\int \tilde{\kappa}_{\theta_{0}, \eta_{0}}\left[p_{\hat{\theta}, \hat{\eta}}-p_{\hat{\theta}, \eta_{0}}-B_{\theta_{0}, \eta_{0}}\left(\hat{\eta}-\eta_{0}\right) p_{\theta_{0}, \eta_{0}}\right] d \mu \tag{25.78}
\end{align*}
$$

Replacing $\hat{\theta}$ by $\theta_{0}$ should make at most a difference of $o_{P}\left(\left\|\hat{\theta}-\theta_{0}\right\|\right)$, which is negligible in the preceding display, but the presence of $\hat{\eta}$ may require a rate of convergence for $\hat{\eta}$. Theorem 5.55 yields such rates in some generality and can be translated to the present setting as follows.

Consider estimators $\hat{\tau}_{n}$ contained in a set $H_{n}$ that, for a given $\hat{\lambda}_{n}$ contained in a set $\Lambda_{n} \subset \mathbb{R}$, maximize a criterion $\tau \mapsto \mathbb{P}_{n} m_{\tau, \hat{\lambda}_{n}}$, or at least satisfy $\mathbb{P}_{n} m_{\tau, \hat{\lambda}_{n}} \geq \mathbb{P}_{n} m_{\tau_{0}, \hat{\lambda}_{n}}$. Assume that for every $\lambda \in \Lambda_{n}$, every $\tau \in H_{n}$ and every $\delta>0$,

$$
\begin{array}{r}
P\left(m_{\tau, \lambda}-m_{\tau_{0}, \lambda}\right) \lesssim-d_{\lambda}^{2}\left(\tau, \tau_{0}\right)+\lambda^{2}, \\
\mathrm{E}^{*} \sup _{\substack{d_{\lambda}\left(\tau, \tau_{0}\right)<\delta \\
\lambda \in \Lambda_{n}, \tau \in H_{n}}}\left|\mathbb{G}_{n}\left(m_{\tau, \lambda}-m_{\tau_{0}, \lambda}\right)\right| \lesssim \phi_{n}(\delta) . \tag{25.80}
\end{array}
$$

25.81 Theorem. Suppose that (25.79) and (25.80) are valid for functions $\phi_{n}$ such that $\delta \mapsto \phi_{n}(\delta) / \delta^{\alpha}$ is decreasing for some $\alpha<2$ and sets $\Lambda_{n} \times H_{n}$ such that $\mathrm{P}\left(\hat{\lambda}_{n} \in \Lambda_{n}, \hat{\tau}_{n} \in\right. \left.H_{n}\right) \rightarrow 1$. Then $d_{\hat{\lambda}}\left(\hat{\tau}_{n}, \tau_{0}\right) \leq O_{P}^{*}\left(\delta_{n}+\hat{\lambda}_{n}\right)$ for any sequence of positive numbers $\delta_{n}$ such that $\phi_{n}\left(\delta_{n}\right) \leq \sqrt{n} \delta_{n}^{2}$ for every $n$.

### 25.11.1 Cox Regression with Current Status Data

Suppose that we observe a random sample from the distribution of $X=(C, \Delta, Z)$, in which $\Delta=1\{T \leq C\}$, that the "survival time" $T$ and the observation time $C$ are independent given $Z$, and that $T$ follows a Cox model. The density of $X$ relative to the product of $F_{C, Z}$ and counting measure on $\{0,1\}$ is given by

$$
p_{\theta, \Lambda}(x)=\left(1-\exp \left(-e^{\theta^{T} z} \Lambda(c)\right)\right)^{\delta}\left(\exp \left(-e^{\theta^{T} z} \Lambda(c)\right)\right)^{1-\delta} .
$$

We define this as the likelihood for one observation $x$. In maximizing the likelihood we restrict the parameter $\theta$ to a compact in $\mathbb{R}^{k}$ and restrict the parameter $\Lambda$ to the set of all cumulative hazard functions with $\Lambda(\tau) \leq M$ for a fixed large constant $M$ and $\tau$ the end of the study.

We make the following assumptions. The observation times $C$ possess a Lebesgue density that is continuous and positive on an interval $[\sigma, \tau]$ and vanishes outside this interval. The true parameter $\Lambda_{0}$ is continuously differentiable on this interval, satisfies $0<\Lambda_{0}(\sigma-) \leq \Lambda_{0}(\tau)<M$, and is continuously differentiable on $[\sigma, \tau]$. The covariate vector $Z$ is bounded and $E \operatorname{cov}(Z \mid C)>0$. The function $h_{\theta_{0}, \Lambda_{0}}$ given by (25.82) has a version that is differentiable with a bounded derivative on $[\sigma, \tau]$. The true parameter $\theta_{0}$ is an inner point of the parameter set for $\theta$.

The score function for $\theta$ takes the form

$$
\dot{\ell}_{\theta, \Lambda}(x)=z \Lambda(c) Q_{\theta, \Lambda}(x),
$$

for the function $Q_{\theta, \Lambda}$ given by

$$
Q_{\theta, \Lambda}(x)=e^{\theta^{T} z}\left[\delta \frac{e^{-e^{\theta^{T} z} \Lambda(c)}}{1-e^{-e^{\theta_{T}} z} \Lambda(c)}-(1-\delta)\right]
$$

For every nondecreasing, nonnegative function $h$ and positive number $t$, the submodel $\Lambda_{t}=\Lambda+t h$ is well defined. Inserting this in the log likelihood and differentiating with respect to $t$ at $t=0$, we obtain a score function for $\Lambda$ of the form

$$
B_{\theta, \Lambda} h(x)=h(c) Q_{\theta, \Lambda}(x) .
$$

The linear span of these score functions contains $B_{\theta, \Lambda} h$ for all bounded functions $h$ of bounded variation. In view of the similar structure of the scores for $\theta$ and $\Lambda$, projecting $\dot{\ell}_{\theta, \Lambda}$ onto the closed linear span of the nuisance scores is a weighted least-squares problem with weight function $Q_{\theta, \Lambda}$. The solution is given by the vector-valued function

$$
\begin{equation*}
h_{\theta, \Lambda}(c)=\Lambda(c) \frac{\mathrm{E}_{\theta, \Lambda}\left(Z Q_{\theta, \Lambda}^{2}(X) \mid C=c\right)}{\mathrm{E}_{\theta, \Lambda}\left(Q_{\theta, \Lambda}^{2}(X) \mid C=c\right)} \tag{25.82}
\end{equation*}
$$

The efficient score function for $\theta$ takes the form

$$
\tilde{\ell}_{\theta, \Lambda}(x)=\left(z \Lambda(c)-h_{\theta, \Lambda}(c)\right) Q_{\theta, \Lambda}(x) .
$$

Formally, this function is the derivative at $t=0$ of the log likelihood evaluated at $(\theta+t, \Lambda- \left.t^{T} h_{\theta, \Lambda}\right)$. However, the second coordinate of the latter path may not define a nondecreasing, nonnegative function for every $t$ in a neighborhood of 0 and hence cannot be used to obtain a stationary equation for the maximum likelihood estimator. This is true in particular for discrete cumulative hazard functions $\Lambda$, for which $\Lambda+t h$ is nondecreasing for both $t<0$ and $t>0$ only if $h$ is constant between the jumps of $\Lambda$.

This suggests that the maximum likelihood estimator does not satisfy the efficient score equation. To prove the asymptotic normality of $\hat{\theta}$, we replace this equation by an approximation, obtained from an approximately least favorable submodel.

For fixed ( $\theta, \Lambda$ ), and a fixed bounded, Lipschitz function $\phi$, define

$$
\Lambda_{t}(\theta, \Lambda)=\Lambda-t^{T} \phi(\Lambda)\left(h_{\theta_{0}, \Lambda_{0}} \circ \Lambda_{0}^{-1}\right)(\Lambda)
$$

Then $\Lambda_{t}(\theta, \Lambda)$ is a cumulative hazard function for every $t$ that is sufficiently close to zero, because for every $u \leq v$,

$$
\Lambda_{t}(\theta, \Lambda)(v)-\Lambda_{t}(\theta, \Lambda)(u) \geq(\Lambda(v)-\Lambda(u))\left(1-\|t\|\left\|\phi h_{\theta_{0}, \Lambda_{0}} \circ \Lambda_{0}^{-1}\right\|_{\text {Lip }}\right)
$$

Inserting $\left(\theta+t, \Lambda_{t}(\theta, \Lambda)\right)$ into the log likelihood, and differentiating with respect to $t$ at $t=0$, yields the score function

$$
\tilde{\kappa}_{\theta, \Lambda}(x)=\left(z \Lambda(c)-\phi(\Lambda(c))\left(h_{\theta_{0}, \Lambda_{0}} \circ \Lambda_{0}^{-1}\right)(\Lambda(c))\right) Q_{\theta, \Lambda}(x)
$$

If evaluated at ( $\theta_{0}, \Lambda_{0}$ ) this reduces to the efficient score function $\tilde{\ell}_{\theta_{0}, \Lambda_{0}}(x)$ provided $\phi\left(\Lambda_{0}\right)=1$, whence the submodel is approximately least favorable. To prove the asymptotic efficiency of $\hat{\theta}_{n}$ it suffices to verify the conditions of Theorem 25.77.

The function $\phi$ is a technical device that has been introduced in order to ensure that $0 \leq \Lambda_{t}(\theta, \Lambda) \leq M$ for all $t$ that are sufficiently close to 0 . This is guaranteed if $0 \leq y \phi(y) \leq c(y \wedge(M-y))$ for every $0 \leq y \leq M$, for a sufficiently large constant $c$. Because by assumption $\left[\Lambda_{0}(\sigma-), \Lambda_{0}(\tau)\right] \subset(0, M)$, there exists such a function $\phi$ that also fulfills $\phi\left(\Lambda_{0}\right)=1$ on $[\sigma, \tau]$.

In order to verify the no-bias condition (25.52) we need a rate of convergence for $\hat{\Lambda}_{n}$.
25.83 Lemma. Under the conditions listed previously, $\hat{\theta}_{n}$ is consistent and $\left\|\hat{\Lambda}_{n}-\Lambda_{0}\right\|_{P_{0}, 2}= O_{P}\left(n^{-1 / 3}\right)$.

Proof. Denote the index $\left(\theta_{0}, \Lambda_{0}\right)$ by 0 , and define functions

$$
m_{\theta, \Lambda}=\log \left(p_{\theta, \Lambda}+p_{0}\right) / 2
$$

The densities $p_{\theta, \Lambda}$ are bounded above by 1 , and under our assumptions the density $p_{0}$ is bounded away from zero. It follows that the functions $m_{\theta, \Lambda}(x)$ are uniformly bounded in $(\theta, \Lambda)$ and $x$.

By the concavity of the logarithm and the definition of $(\hat{\theta}, \hat{\Lambda})$,

$$
\mathbb{P}_{n} m_{\hat{\theta}, \hat{\Lambda}} \geq \frac{1}{2} \mathbb{P}_{n} \log p_{\hat{\theta}, \hat{\Lambda}}+\frac{1}{2} \mathbb{P}_{n} \log p_{0} \geq \mathbb{P}_{n} \log p_{0}=\mathbb{P}_{n} m_{0}
$$

Therefore, Theorem 25.81 is applicable with $\tau=(\theta, \Lambda)$ and without $\lambda$. For technical reasons it is preferable first to establish the consistency of $(\hat{\theta}, \hat{\Lambda})$ by a separate argument.

We apply Wald's proof, Theorem 5.14. The parameter set $\operatorname{for} \theta$ is compact by assumption, and the parameter set for $\Lambda$ is compact relative to the weak topology. Wald's theorem shows that the distance between $(\hat{\theta}, \hat{\Lambda})$ and the set of maximizers of the Kullback-Leibler divergence converges to zero. This set of maximizers contains ( $\theta_{0}, \Lambda_{0}$ ), but this parameter is not fully identifiable under our assumptions: The parameter $\Lambda_{0}$ is identifiable only on the interval $(\sigma, \tau)$. It follows that $\hat{\theta} \xrightarrow{\mathrm{P}} \theta_{0}$ and $\hat{\Lambda}(t) \xrightarrow{\mathrm{P}} \Lambda_{0}(t)$ for every $\sigma<t<\tau$. (The convergence of $\hat{\Lambda}$ at the points $\sigma$ and $\tau$ does not appear to be guaranteed.)

By the proof of Lemma 5.35 and Lemma 25.85 below, condition (25.79) is satisfied with $d\left((\theta, \Lambda),\left(\theta_{0}, \Lambda_{0}\right)\right)$ equal to $\left\|\theta-\theta_{0}\right\|+\left\|\Lambda-\Lambda_{0}\right\|_{2}$. By Lemma 25.84 below, the bracketing entropy of the class of functions $m_{\theta, \Lambda}$ is of the order $(1 / \varepsilon)$. By Lemma 19.36 condition (25.80) is satisfied for

$$
\phi_{n}(\delta)=\sqrt{\delta}\left(1+\frac{\sqrt{\delta}}{\delta^{2} \sqrt{n}}\right)
$$

This leads to a convergence rate of $n^{-1 / 3}$ for both $\left\|\hat{\theta}-\theta_{0}\right\|$ and $\left\|\hat{\Lambda}-\Lambda_{0}\right\|_{2}$.
To verify the no-bias condition (25.75), we use the decomposition (25.78). The integrands in the two terms on the right can both be seen to be bounded, up to a constant, by $\left(\hat{\Lambda}-\Lambda_{0}\right)^{2}$, with probability tending to one. Thus the bias $P_{\hat{\theta}, \eta_{0}} \tilde{\kappa}_{\hat{\theta}, \hat{\eta}}$ is actually of the order $O_{P}\left(n^{-2 / 3}\right)$.

The functions $x \mapsto \tilde{\kappa}_{\theta, \Lambda}(x)$ can be written in the form $\psi\left(z, e^{\theta^{T} z}, \Lambda(c), \delta\right)$ for a function $\psi$ that is Lipschitz in its first three coordinates, for $\delta \in\{0,1\}$ fixed. (Note that $\Lambda \mapsto \Lambda Q_{\theta, \Lambda}$ is Lipschitz, as $\Lambda \mapsto h_{\theta_{0}, \Lambda_{0}} \circ \Lambda_{0}^{-1}(\Lambda) / \Lambda=\left(h_{\theta_{0}, \Lambda_{0}} / \Lambda_{0}\right) \circ \Lambda_{0}^{-1}(\Lambda)$.) The functions $z \mapsto z$, $z \mapsto \exp \theta^{T} z, c \mapsto \Lambda(c)$ and $\delta \mapsto \delta$ form Donsker classes if $\theta$ and $\Lambda$ range freely. Hence the functions $x \mapsto \Lambda(c) Q_{\theta, \Lambda}(x)$ form a Donsker class, by Example 19.20. The efficiency of $\hat{\theta}_{n}$ follows by Theorem 25.77.
25.84 Lemma. Under the conditions listed previously, there exists a constant $C$ such that, for every $\varepsilon>0$,

$$
\log N_{[]}\left(\varepsilon,\left\{m_{\theta, \Lambda},(\theta, \Lambda)\right\}, L_{2}\left(P_{0}\right)\right) \leq C\left(\frac{1}{\varepsilon}\right) .
$$

Proof. First consider the class of functions $m_{\theta, \Lambda}$ for a fixed $\theta$. These functions depend on $\Lambda$ monotonely if considered separately for $\delta=0$ and $\delta=1$. Thus a bracket $\Lambda_{1} \leq \Lambda \leq \Lambda_{2}$ for $\Lambda$ leads, by substitution, readily to a bracket for $m_{\theta, \Lambda}$. Furthermore, because this dependence is Lipschitz, there exists a constant $D$ such that

$$
\int\left(m_{\theta, \Lambda_{1}}-m_{\theta, \Lambda_{2}}\right)^{2} d F_{C, Z} \leq D \int_{\sigma}^{\tau}\left(\Lambda_{1}(c)-\Lambda_{2}(c)\right)^{2} d c
$$

Thus, brackets for $\Lambda$ of $L_{2}$-size $\varepsilon$ translate into brackets for $m_{\theta, \Lambda}$ of $L_{2}\left(P_{\theta, \Lambda}\right)$-size proportional to $\varepsilon$. By Example 19.11 we can cover the set of all $\Lambda$ by $\exp C(1 / \varepsilon)$ brackets of size $\varepsilon$.

Next, we allow $\theta$ to vary freely as well. Because $\theta$ is finite-dimensional and $\partial / \partial \theta m_{\theta, \Lambda}(x)$ is uniformly bounded in $(\theta, \Lambda, x)$, this increases the entropy only slightly.
25.85 Lemma. Under the conditions listed previously there exist constants $C, \varepsilon>0$ such that, for all $\Lambda$ and all $\left\|\theta-\theta_{0}\right\|<\varepsilon$,

$$
\int\left(p_{\theta, \Lambda}^{1 / 2}-p_{\theta_{0}, \Lambda_{0}}^{1 / 2}\right)^{2} d \mu \geq C \int_{\sigma}^{\tau}\left(\Lambda-\Lambda_{0}\right)^{2}(c) d c+C\left\|\theta-\theta_{0}\right\|^{2}
$$

Proof. The left side of the lemma can be rewritten as

$$
\int \frac{\left(p_{\theta, \Lambda}-p_{\theta_{0}, \Lambda_{0}}\right)^{2}}{\left(p_{\theta, \Lambda}^{1 / 2}+p_{\theta_{0}, \Lambda_{0}}^{1 / 2}\right)^{2}} d \mu
$$

Because $p_{0}$ is bounded away from zero, and the densities $p_{\theta, \Lambda}$ are uniformly bounded, the denominator can be bounded above and below by positive constants. Thus the Hellinger distance (in the display) is equivalent to the $L_{2}$-distance between the densities, which can be rewritten

$$
2 \int\left[e^{-e^{\theta^{T} z} \Lambda(c)}-e^{-e^{\theta_{0}^{T} z} \Lambda_{0}(c)}\right]^{2} d F^{Y, Z}(c, z)
$$

Let $g(t)$ be the function $\exp \left(-e^{\theta^{T} z} \Lambda(c)\right)$ evaluated at $\theta_{t}=t \theta+(1-t) \theta_{0}$ and $\Lambda_{t}= t \Lambda+(1-t) \Lambda_{0}$, for fixed $(c, z)$. Then the integrand is equal to $(g(1)-g(0))^{2}$, and hence, by the mean value theorem, there exists $0 \leq t=t(c, z) \leq 1$ such that the preceding display is equal to

$$
P_{0}\left(e^{-\Lambda_{t}(c) e^{\theta_{t}^{T} z}} e^{\theta_{t}^{T} z}\left[\left(\Lambda-\Lambda_{0}\right)(c)\left(1+t\left(\theta-\theta_{0}\right)^{T} z\right)+\left(\theta-\theta_{0}\right)^{T} z \Lambda_{0}(c)\right]\right)^{2}
$$

Here the multiplicative factor $e^{-\Lambda_{t}(c) e^{\theta_{t}^{T} z}} e^{\theta_{t}^{T} z}$ is bounded away from zero. By dropping this term we obtain, up to a constant, a lower bound for the left side of the lemma. Next, because the function $Q_{\theta_{0}, \Lambda_{0}}$ is bounded away from zero and infinity, we may add a factor $Q_{\theta_{0}, \Lambda_{0}}^{2}$, and obtain the lower bound, up to a constant,

$$
P_{0}\left(\left(1+t\left(\theta-\theta_{0}\right)^{T} z\right) B_{\theta_{0}, \Lambda_{0}}\left(\Lambda-\Lambda_{0}\right)(x)+\left(\theta-\theta_{0}\right)^{T} \dot{\ell}_{\theta_{0}, \Lambda_{0}}(x)\right)^{2}
$$

Here the function $h=\left(1+t\left(\theta-\theta_{0}\right)^{T} z\right)$ is uniformly close to 1 if $\theta$ is close to $\theta_{0}$. Furthermore, for any function $g$ and vector $a$,

$$
\begin{aligned}
\left(P_{0}\left(B_{\theta_{0}, \Lambda_{0}} g\right) a^{T} \dot{\ell}_{\theta_{0}, \Lambda_{0}}\right)^{2} & =\left(P_{0}\left(B_{\theta_{0}, \Lambda_{0}} g\right) a^{T}\left(\dot{\ell}_{\theta_{0}, \Lambda_{0}}-\tilde{\ell}_{0}\right)\right)^{2} \\
& \leq P_{0}\left(B_{\theta_{0}, \Lambda_{0}} g\right)^{2} a^{T}\left(I_{0}-\tilde{I}_{0}\right) a
\end{aligned}
$$

by the Cauchy-Schwarz inequality. Because the efficient information $\tilde{I}_{0}$ is positive-definite, the term $a^{T}\left(I_{0}-\tilde{I}_{0}\right) a$ on the right can be written $a^{T} I_{0} a c$ for a constant $0<c<1$. The lemma now follows by application of Lemma 25.86 ahead.
25.86 Lemma. Let $h, g_{1}$ and $g_{2}$ be measurable functions such that $c_{1} \leq h \leq c_{2}$ and $\left(P g_{1} g_{2}\right)^{2} \leq c P g_{1}^{2} P g_{2}^{2}$ for a constant $c<1$ and constants $c_{1}<1<c_{2}$ close to 1 . Then

$$
P\left(h g_{1}+g_{2}\right)^{2} \geq C\left(P g_{1}^{2}+P g_{2}^{2}\right),
$$

for a constant $C$ depending on $c, c_{1}$ and $c_{2}$ that approaches $1-\sqrt{c}$ as $c_{1} \uparrow 1$ and $c_{2} \downarrow 1$.
Proof. We may first use the inequalities

$$
\begin{aligned}
\left(h g_{1}+g_{2}\right)^{2} & \geq c_{1} h g_{1}^{2}+2 h g_{1} g_{2}+c_{2}^{-1} h g_{2}^{2} \\
& =h\left(g_{1}+g_{2}\right)^{2}+\left(c_{1}-1\right) h g_{1}^{2}+\left(1-c_{2}^{-1}\right) h g_{2}^{2} \\
& \geq c_{1}\left(g_{1}^{2}+2 g_{1} g_{2}+g_{2}^{2}\right)+\left(c_{1}-1\right) c_{2} g_{1}^{2}+\left(c_{2}^{-1}-1\right) g_{2}^{2}
\end{aligned}
$$

Next, we integrate this with respect to $P$, and use the inequality for $P g_{1} g_{2}$ on the second term to see that the left side of the lemma is bounded below by

$$
c_{1}\left(P g_{1}^{2}-2 \sqrt{c P g_{1}^{2} P g_{2}^{2}}+P g_{2}^{2}\right)+\left(c_{1}-1\right) c_{2} P g_{1}^{2}+\left(c_{2}^{-1}-1\right) c_{2} P g_{2}^{2}
$$

Finally, we apply the inequality $2 x y \leq x^{2}+y^{2}$ on the second term.

### 25.11.2 Exponential Frailty

Suppose that the observations are a random sample from the density of $X=(U, V)$ given by

$$
p_{\theta, \eta}(u, v)=\int z e^{-z u} \theta z e^{-\theta z v} d \eta(z)
$$

This is a density with respect to Lebesgue measure on the positive quadrant of $\mathbb{R}^{2}$, and we may take the likelihood equal to just the joint density of the observations. Let $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ maximize

$$
(\theta, \eta) \mapsto \prod_{i=1}^{n} p_{\theta, \eta}\left(U_{i}, V_{i}\right)
$$

This estimator can be shown to be consistent, under some conditions, for the Euclidean and weak topology, respectively, by, for instance, the method of Wald, Theorem 5.14.

The "statistic" $\psi_{\theta}(U, V)=U+\theta V$ is, for fixed and known $\theta$, sufficient for the nuisance parameter. Because the likelihood depends on $\eta$ only through this statistic, the tangent set ${ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ for $\eta$ consists of functions of $U+\theta V$ only. Furthermore, because $U+\theta V$ is distributed according to a mixture over an exponential family (a gamma-distribution with shape parameter 2), the closed linear span of ${ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ consists of all mean-zero, squareintegrable functions of $U+\theta V$, by Example 25.35. Thus, the projection onto the closed linear span of ${ }_{\eta} \dot{\mathcal{P}}_{P_{\theta, \eta}}$ is the conditional expectation with respect to $U+\theta V$, and the efficient score function for $\theta$ is the "conditional score," given by

$$
\begin{aligned}
\tilde{\ell}_{\theta, \eta}(x) & =\dot{\ell}_{\theta, \eta}(x)-\mathrm{E}_{\theta}\left(\dot{\ell}_{\theta, \eta}(X) \mid \psi_{\theta}(X)=\psi_{\theta}(x)\right) \\
& =\frac{\int \frac{1}{2}(u-\theta v) z^{3} e^{-z(u+\theta v)} d \eta(z)}{\int \theta z^{2} e^{-z(u+\theta v)} d \eta(z)}
\end{aligned}
$$

where we may use that, given $U+\theta V=s$, the variables $U$ and $\theta V$ are uniformly distributed on the interval $[0, s]$. This function turns out to be also an actual score function, in that there exists an exact least favorable submodel, given by

$$
\eta_{t}(\theta, \eta)(B)=\eta\left(B\left(1-\frac{t}{2 \theta}\right)\right) .
$$

Inserting $\eta_{t}(\theta, \eta)$ in the log likelihood, making the change of variables $z(1-t /(2 \theta)) \rightarrow z$, and computing the (ordinary) derivative with respect to $t$ at $t=0$, we obtain $\tilde{\ell}_{\theta, \eta}(x)$. It follows that the maximum likelihood estimator satisfies the efficient score equation, and its asymptotic normality can be proved with the help of Theorem 25.54.

The linearity of the model in $\eta$ (or the formula involving the conditional expectation) implies that

$$
P_{\theta, \eta_{0}} \tilde{\ell}_{\theta, \eta}=0, \quad \text { every } \theta, \eta, \eta_{0}
$$

Thus, the "no-bias" condition (25.52) is trivially satisfied. The verification that the functions $\tilde{\ell}_{\theta, \eta}$ form a Donsker class is more involved but is achieved in the following lemma. ${ }^{\dagger}$
25.87 Lemma. Suppose that $\int\left(z^{2}+z^{-5}\right) d \eta_{0}(z)<\infty$. Then there exists a neighborhood $V$ of $\eta_{0}$ for the weak topology such that the class of functions

$$
(x, y) \mapsto \frac{\int\left(a_{1}+a_{2} z x+a_{3} z y\right) z^{2} e^{-z\left(b_{1} x+b_{2} y\right)} d \eta(z)}{\int z^{2} e^{-z\left(b_{1} x+b_{2} y\right)} d \eta(z)}
$$

where $\left(a_{1}, \ldots, a_{3}\right)$ ranges over a bounded subset of $\mathbb{R}^{3},\left(b_{1}, b_{2}\right)$ ranges over a compact subset of $(0, \infty)^{2}$, and $\eta$ ranges over $V$, is $P_{\theta_{0}, \eta_{0}}$-Donsker with square-integrable envelope.

### 25.11.3 Partially Linear Regression

Suppose that we observe a random sample from the distribution of $X=(V, W, Y)$, in which for some unobservable error $e$ independent of $(V, W)$,

$$
Y=\theta V+\eta(W)+e
$$

Thus, the independent variable $Y$ is a regression on ( $V, W$ ) that is linear in $V$ with slope $\theta$ but may depend on $W$ in a nonlinear way. We assume that $V$ and $W$ take their values in the unit interval $[0,1]$, and that $\eta$ is twice differentiable with $J(\eta)<\infty$, for

$$
J^{2}(\eta)=\int_{0}^{1} \eta^{\prime \prime}(w)^{2} d w
$$

This smoothness assumption should help to ensure existence of efficient estimators of $\theta$ and will be used to define an estimator.

If the (unobservable) error is assumed to be normal, then the density of the observation $X=(V, W, Y)$ is given by

$$
p_{\theta, \eta}(x)=\frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{1}{2}(y-\theta v-\eta(w))^{2} / \sigma^{2}} p_{V, W}(v, w) .
$$

[^11]We cannot use this directly to define a maximum likelihood estimator for $(\theta, \eta)$, as a maximizer for $\eta$ will interpolate the data exactly: A choice of $\eta$ such that $\eta\left(w_{i}\right)=y_{i}-\theta v_{i}$ for every $i$ maximizes $\prod p_{\theta, \eta}\left(x_{i}\right)$ but does not provide a useful estimator. The problem is that so far $\eta$ has only been restricted to be differentiable, and this does not prevent it from being very wiggly. To remedy this we use a penalized log likelihood estimator, defined as the minimizer of

$$
(\theta, \eta) \mapsto \mathbb{P}_{n}(y-\theta v-\eta(w))^{2}+\hat{\lambda}_{n}^{2} J^{2}(\eta)
$$

Here $\hat{\lambda}_{n}$ is a "smoothing parameter" that may depend on the data, and determines the weight of the "penalty" $J^{2}(\eta)$. A large value of $\hat{\lambda}_{n}$ gives much influence to the penalty term and hence leads to a smooth estimate of $\eta$, and conversely. Intermediate values are best. For the purpose of estimating $\theta$ we may use any values in the range

$$
\hat{\lambda}_{n}^{2}=o_{P}\left(n^{-1 / 2}\right), \quad \hat{\lambda}_{n}^{-1}=O_{P}\left(n^{2 / 5}\right) .
$$

There are simple numerical schemes to compute the maximizer $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$, the function $\hat{\eta}_{n}$ being a natural cubic spline with knots at the values $w_{1}, \ldots, w_{n}$. The sequence $\hat{\theta}_{n}$ can be shown to be asymptotically efficient provided that the regression components involving $V$ and $W$ are not confounded or degenerate. More precisely, we assume that the conditional distribution of $V$ given $W$ is nondegenerate, that the distribution of $W$ has at least two support points, and that $h_{0}(w)=\mathrm{E}(V \mid W=w)$ has a version with $J\left(h_{0}\right)<\infty$. Then, we have the following lemma on the behavior of $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$.

Let $\|\cdot\|_{W}$ denote the norm of $L_{2}\left(P_{W}\right)$.
25.88 Lemma. Under the conditions listed previously, the sequence $\hat{\theta}_{n}$ is consistent for $\theta_{0},\left\|\hat{\eta}_{n}\right\|_{\infty}=O_{P}(1), J\left(\hat{\eta}_{n}\right)=O_{P}(1)$, and $\left\|\hat{\eta}_{n}-\eta\right\|_{W}=O_{P}\left(\hat{\lambda}_{n}\right)$, under $\left(\theta_{0}, \eta_{0}\right)$.

Proof. Write $g(v, w)=\theta v+\eta(w)$, let $\mathbb{P}_{n}$ and $P_{0}$ be the empirical and true distribution of the variables $\left(e_{i}, V_{i}, W_{i}\right)$, and define functions

$$
m_{g, \lambda}(e, v, w)=(y-g(v, w))^{2}+\lambda^{2}\left(J^{2}(\eta)-J^{2}\left(\eta_{0}\right)\right) .
$$

Then $\hat{g}(v, w)=\hat{\theta} v+\hat{\eta}(w)$ minimizes $g \mapsto \mathbb{P}_{n} m_{g, \hat{\lambda}}$, and

$$
m_{g, \lambda}-m_{g_{0}, \lambda}=2 e\left(g_{0}-g\right)+\left(g_{0}-g\right)^{2}+\lambda^{2} J^{2}(\eta)-\lambda^{2} J^{2}\left(\eta_{0}\right) .
$$

By the orthogonality property of a conditional expectation and the Cauchy-Schwarz inequality, $(\mathrm{E} V \eta(W))^{2} \leq \mathrm{EE}(V \mid W)^{2} \mathrm{E} \eta^{2}(W)<\mathrm{E} V^{2}\|\eta\|_{W}^{2}$. Therefore, by Lemma 25.86,

$$
P_{0}\left(g-g_{0}\right)^{2} \gtrsim\left|\theta-\theta_{0}\right|^{2}+\left\|\eta-\eta_{0}\right\|_{W}^{2} .
$$

Consequently, because $P_{0} e=0$ and $e$ is independent of ( $V, W$ ),

$$
P_{0}\left(m_{g, \lambda}-m_{g_{0}, \lambda}\right) \gtrsim\left|\theta-\theta_{0}\right|^{2}+\left\|\eta-\eta_{0}\right\|_{W}^{2}+\lambda^{2} J^{2}(\eta)-\lambda^{2} .
$$

This suggests to apply Theorem 25.81 with $\tau=(\theta, \eta)$ and $d_{\lambda}^{2}\left(\tau, \tau_{0}\right)$ equal to the sum of the first three terms on the right.

Because $\hat{\lambda}_{n}^{-1}=O_{P}\left(1 / \lambda_{n}\right)$ for $\lambda_{n}=n^{-2 / 5}$, it is not a real loss of generality to assume that $\hat{\lambda}_{n} \in \Lambda_{n}=\left[\lambda_{n}, \infty\right)$. Then $d_{\lambda}\left(\tau, \tau_{0}\right)<\delta$ and $\lambda \in \Lambda_{n}$ implies that $\left|\theta-\theta_{0}\right|<\delta$, that $\left\|\eta-\eta_{0}\right\|_{W}<\delta$ and that $J(\eta) \leq \delta / \lambda_{n}$. Assume first that it is known already that $|\hat{\theta}|$ and
$\|\hat{\eta}\|_{\infty}$ are bounded in probability, so that it is not a real loss of generality to assume that $|\hat{\theta}| \vee\|\hat{\eta}\|_{\infty} \leq 1$. Then

$$
P_{0}\left(e^{|e \eta|}-1-|e \eta|\right)=\sum_{m \geq 2} P_{0} \frac{|e \eta|^{m}}{m!} \leq P_{0} \eta^{2} \mathrm{E} e^{|e|}
$$

Thus a bound on the $\|\cdot\|_{W}$-norm of $\eta$ yields a bound on the "Bernstein norm" of e $\eta$ (given on the left) of proportional magnitude. A bracket $\left[\eta_{1}, \eta_{2}\right]$ for $\eta$ induces a bracket $\left[e^{+} \eta_{1}-\right. \left.e^{-} \eta_{2}, e^{+} \eta_{2}-e^{-} \eta_{1}\right]$ for the functions $e \eta$. In view of Lemma 19.37 and Example 19.10, we obtain

$$
\mathrm{E} \sup _{d_{\lambda}\left(\tau, \tau_{0}\right)<\delta}\left|\mathbb{G}_{n} e\left(\eta-\eta_{0}\right)\right| \lesssim \phi_{n}(\delta):=J_{n}(\delta)\left(1+\frac{J_{n}(\delta)}{\delta^{2} \sqrt{n}}\right)
$$

for

$$
J_{n}(\delta)=\int_{0}^{\delta} \sqrt{\left(\frac{1+\delta / \lambda_{n}}{\varepsilon}\right)^{1 / 2}} d \varepsilon \lesssim \delta^{3 / 4}+\frac{\delta}{\lambda_{n}^{1 / 4}}
$$

This bound remains valid if we replace $\eta-\eta_{0}$ by $g-g_{0}$, for the parametric part $\theta v$ adds little to the entropy. We can obtain a similar maximal inequality for the process $\mathbb{G}_{n}\left(g-g_{0}\right)^{2}$, in view of the inequality $P_{0}\left(g-g_{0}\right)^{4} \leq 4 P_{0}\left(g-g_{0}\right)^{2}$, still under our assumption that $|\theta| \vee\|\eta\|_{\infty} \leq 1$. We conclude that Theorem 25.81 applies and yields the rate of convergence $\left|\hat{\theta}-\theta_{0}\right|+\left\|\hat{\eta}-\eta_{0}\right\|_{W}=O_{P}\left(n^{-2 / 5}+\hat{\lambda}_{n}\right)=O_{P}\left(\hat{\lambda}_{n}\right)$.

Finally, we must prove that $\hat{\theta}$ and $\|\hat{\eta}\|_{\infty}$ are bounded in probability. By the CauchySchwarz inequality, for every $w$ and $\eta$,

$$
\left|\eta(w)-\eta(0)-\eta^{\prime}(0) w\right| \leq \int_{0}^{w} \int_{0}^{u}\left|\eta^{\prime \prime}\right|(s) d s d u \leq J(\eta)
$$

This implies that $\|\eta\|_{\infty} \leq|\eta(0)|+\left|\eta^{\prime}(0)\right|+J(\eta)$, whence it sufficies to show that $\hat{\theta}, \hat{\eta}(0)$, $\hat{\eta}^{\prime}(0)$, and $J(\hat{\eta})$ remain bounded. The preceding display implies that

$$
\left|\theta v+\eta(0)+\eta^{\prime}(0) w\right| \leq|g(v, w)|+J(\eta)
$$

The empirical measure applied to the square of the left side is equal to $a^{T} A_{n} a$ for $a= \left(\theta, \eta(0), \eta^{\prime}(0)\right)$ and $A_{n}=\mathbb{P}_{n}(v, 1, w)(v, 1, w)^{T}$ the sample second moment matrix of the variables ( $V_{i}, 1, W_{i}$ ). By the conditions on the distribution of ( $V, W$ ), the corresponding population matrix is positive-definite, whence we can conclude that $\hat{a}$ is bounded in probability as soon as $\hat{a}^{T} A_{n} \hat{a}$ is bounded in probability, which is certainly the case if $\mathbb{P}_{n} \hat{g}^{2}$ and $J(\hat{\eta})$ are bounded in probability.

We can prove the latter by applying the preceding argument conditionally, given the sequence $V_{1}, W_{1}, V_{2}, W_{2}, \ldots$ Given these variables, the variables $e_{i}$ are the only random part in $m_{g, \lambda}-m_{g_{0}, \lambda}$ and the parts $\left(g-g_{0}\right)^{2}$ only contribute to the centering function. We apply Theorem 25.81 with square distance equal to

$$
d_{\lambda}^{2}\left(\tau, \tau_{0}\right)=\mathbb{P}_{n}\left(g-g_{0}\right)^{2}+\lambda^{2} J^{2}(\eta)
$$

An appropriate maximal inequality can be derived from, for example Corollary 2.2.8 in [146], because the stochastic process $\mathbb{G}_{n} e g$ is sub-Gaussian relative to the $L_{2}\left(\mathbb{P}_{n}\right)$-metric on the set of $g$. Because $d_{\lambda}\left(\tau, \tau_{0}\right)<\delta$ implies that $\mathbb{P}_{n}\left(g-g_{0}\right)^{2}<\delta^{2}, J(\eta) \leq \delta / \lambda_{n}$, and $|\theta|^{2} \vee\|\eta\|_{\infty}^{2} \leq C\left(\mathbb{P}_{n}\left(g-g_{0}\right)^{2}+J^{2}(\eta)\right)$ for $C$ dependent on the smallest eigenvalue of
the second moment matrix $A_{n}$, the maximal inequality has a similar form as before, and we conclude that $\mathbb{P}_{n}\left(\hat{g}-g_{0}\right)^{2}+\hat{\lambda}^{2} J^{2}(\hat{\eta})=O_{P}\left(\hat{\lambda}^{2}\right)$. This implies the desired result.

The normality of the error $e$ motivates the least squares criterion and is essential for the efficiency of $\hat{\theta}$. However, the penalized least-squares method makes sense also for nonnormal error distributions. The preceding lemma remains true under the more general condition of exponentially small error tails: $\mathrm{E} e^{c|e|}<\infty$ for some $c>0$.

Under the normality assumption (with $\sigma=1$ for simplicity) the score function for $\theta$ is given by

$$
\dot{\ell}_{\theta, \eta}(x)=(y-\theta v-\eta(w)) v .
$$

Given a function $h$ with $J(h)<\infty$, the path $\eta_{t}=\eta+t h$ defines a submodel indexed by the nuisance parameter. This leads to the nuisance score function

$$
B_{\theta, \eta} h(x)=(y-\theta v-\eta(w)) h(w) .
$$

On comparing these expressions, we see that finding the projection of $\dot{\ell}_{\theta, \eta}$ onto the set of $\eta$-scores is a weighted least squares problem. By the independence of $e$ and ( $V, W$ ), it follows easily that the projection is equal to $B_{\theta, \eta} h_{0}$ for $h_{0}(w)=\mathrm{E}(V \mid W=w)$, whence the efficient score function for $\theta$ is given by

$$
\tilde{\ell}_{\theta, \eta}(x)=(y-\theta v-\eta(w))\left(v-h_{0}(w)\right) .
$$

Therefore, an exact least-favorable path is given by $\eta_{t}(\theta, \eta)=\eta-t h_{0}$.
Because $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ maximizes a penalized likelihood rather than an ordinary likelihood, it certainly does not satisfy the efficient score equation as considered in section 25.8. However, it satisfies this equation up to a term involving the penalty. Inserting $\left(\hat{\theta}+t, \eta_{t}(\hat{\theta}, \hat{\eta})\right)$ into the least-squares criterion, and differentiating at $t=0$, we obtain the stationary equation

$$
\mathbb{P}_{n} \tilde{\ell}_{\hat{\theta}, \hat{\eta}}-2 \hat{\lambda}^{2} \int_{0}^{1} \hat{\eta}^{\prime \prime}(w) h_{0}^{\prime \prime}(w) d w=0
$$

The second term is the derivative of $\hat{\lambda}^{2} J^{2}\left(\eta_{t}(\hat{\theta}, \hat{\eta})\right)$ at $t=0$. By the Cauchy-Schwarz inequality, it is bounded in absolute value by $2 \hat{\lambda}^{2} J(\hat{\eta}) J\left(h_{0}\right)=o_{P}\left(n^{-1 / 2}\right)$, by the first assumption on $\hat{\lambda}$ and because $J(\hat{\eta})=O_{P}(1)$ by Lemma 25.88. We conclude that $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ satisfies the efficient score equation up to a $o_{P}\left(n^{-1 / 2}\right)$-term. Within the context of Theorem 25.54 a remainder term of this small order is negligible, and we may use the theorem to obtain the asymptotic normality of $\hat{\theta}_{n}$.

A formulation that also allows other estimators $\hat{\eta}$ is as follows.
25.89 Theorem. Let $\hat{\eta}_{n}$ be any estimators such that $\left\|\hat{\eta}_{n}\right\|_{\infty}=O_{P}(1)$ and $J\left(\hat{\eta}_{n}\right)=O_{P}(1)$. Then any consistent sequence of estimators $\hat{\theta}_{n}$ such that $\sqrt{n} \mathbb{P}_{n} \tilde{\ell}_{\hat{\theta}, \hat{\eta}}=o_{P}(1)$ is asymptotically efficient at $\left(\theta_{0}, \eta_{0}\right)$.

Proof. It suffices to check the conditions of Theorem 25.54. Since

$$
P_{\theta, \eta} \tilde{\ell}_{\theta, \hat{\eta}}=P_{\theta, \eta}(\eta(w)-\hat{\eta}(w))\left(v-h_{0}(w)\right)=0,
$$

for every $(\theta, \eta)$, the no-bias condition (25.52) is satisfied.

That the functions $\tilde{\ell}_{\hat{\theta}, \hat{\eta}}$ are contained in a Donsker class, with probability tending to 1 , follows from Example 19.10 and Theorem 19.5.

The remaining regularity conditions of Theorem 25.54 can be seen to be satisfied by standard arguments.

In this example we use the smoothness of $\eta$ to define a penalized likelihood estimator for $\theta$. This automatically yields a rate of convergence of $n^{-2 / 5}$ for $\hat{\eta}$. However, efficient estimators for $\theta$ exist under weaker smoothness assumptions on $\eta$, and the minimal smoothness of $\eta$ can be traded against smoothness of the function $g(w)=E(V \mid W=w)$, which also appears in the formula for the efficient score function and is unknown in practice. The trade-off is a consequence of the bias $P_{\theta, \eta, g} \tilde{\ell}_{\theta, \tilde{\eta}, \hat{g}}$ being equal to the cross product of the biases in $\hat{\eta}$ and $\hat{g}$. The square terms in the second order expansion (25.60), in which the derivative relative to $(\eta, g)$ (instead of $\eta$ ) is a ( $2 \times 2$ )-matrix, vanish. See [35] for a detailed study of this model.

### 25.12 Likelihood Equations

The "method of the efficient score equation" isolates the parameter $\theta$ of interest and characterizes an estimator $\hat{\theta}$ as the solution of a system of estimating equations. In this system the nuisance parameter has been replaced by an estimator $\hat{\eta}$. If the estimator $\hat{\eta}$ is the maximum likelihood estimator, then we may hope that a solution $\hat{\theta}$ of the efficient score equation is also the maximum likelihood estimator for $\theta$, or that this is approximately true.

Another approach to proving the asymptotic normality of maximum likelihood estimators is to design a system of likelihood equations for the parameter of interest and the nuisance parameter jointly. For a semiparametric model, this necessarily is a system of infinitely many equations.

Such a system can be analyzed much in the same way as a finite-dimensional system. The system is linearized in the estimators by a Taylor expansion around the true parameter, and the limit distribution involves the inverse of the derivative applied to the system of equations. However, in most situations an ordinary pointwise Taylor expansion, the classical argument as employed in the introduction of section 5.3, is impossible, and the argument must involve some advanced tools, in particular empirical processes. A general scheme is given in Theorem 19.26, which is repeated in a different notation here. A limitation of this approach is that both $\hat{\theta}$ and $\hat{\eta}$ must converge at $\sqrt{n}$-rate. It is not clear that a model can always appropriately parametrized such that this is the case; it is certainly not always the case for the natural parametrization.

The system of estimating equations that we are looking for consists of stationary equations resulting from varying either the parameter $\theta$ or the nuisance parameter $\eta$. Suppose that our maximum likelihood estimator $(\hat{\theta}, \hat{\eta})$ maximizes the function

$$
(\theta, \eta) \mapsto \prod \operatorname{lik}(\theta, \eta)\left(X_{i}\right),
$$

for $\operatorname{lik}(\theta, \eta)(x)$ being the "likelihood" given one observation $x$.
The parameter $\theta$ can be varied in the usual way, and the resulting stationary equation takes the form

$$
\mathbb{P}_{n} \dot{\ell}_{\hat{\theta}, \hat{\eta}}=0 .
$$

This is the usual maximum likelihood equation, except that we evaluate the score function at the joint estimator $(\hat{\theta}, \hat{\eta})$, rather than at the single value $\hat{\theta}$. A precise condition for this equation to be valid is that the partial derivative of $\log \operatorname{lik}(\theta, \eta)(x)$ with respect to $\theta$ exists and is equal to $\dot{\ell}_{\theta, \eta}(x)$, for every $x$, (at least for $\eta=\hat{\eta}$ and at $\theta=\hat{\theta}$ ).

Varying the nuisance parameter $\eta$ is conceptually more difficult. Typically, we can use a selection of the submodels $t \mapsto \eta_{t}$ used for defining the tangent set and the information in the model. If scores for $\eta$ take the form of an "operator" $B_{\theta, \eta}$ working on a set of indices $h$, then a typical likelihood equation takes the form

$$
\mathbb{P}_{n} B_{\hat{\theta}, \hat{\eta}} h=P_{\hat{\theta}, \hat{\eta}} B_{\hat{\theta}, \hat{\eta}} h .
$$

Here we have made it explicit in our notation that a score function always has mean zero, by writing the score function as $x \mapsto B_{\theta, \eta} h(x)-P_{\theta, \eta} B_{\theta, \eta} h$ rather than as $x \mapsto B_{\theta, \eta} h(x)$. The preceding display is valid if, for every $(\theta, \eta)$, there exists some path $t \mapsto \eta_{t}(\theta, \eta)$ such that $\eta_{0}(\theta, \eta)=\eta$ and, for every $x$,

$$
B_{\theta, \eta} h(x)-P_{\theta, \eta} B_{\theta, \eta} h=\frac{\partial}{\partial t}_{\mid t=0} \log \operatorname{lik}\left(\theta+t, \eta_{t}(\theta, \eta)\right) .
$$

Assume that this is the case for every $h$ in some index set $\mathcal{H}$, and suppose that the latter is chosen in such a way that the map $h \mapsto B_{\theta, \eta} h(x)-P_{\theta, \eta} B_{\theta, \eta} h$ is uniformly bounded on $\mathcal{H}$, for every $x$ and every $(\theta, \eta)$.

Then we can define random maps $\Psi_{n}: \mathbb{R}^{k} \times H \mapsto \mathbb{R}^{k} \times \ell^{\infty}(\mathcal{H})$ by $\Psi_{n}=\left(\Psi_{n 1}, \Psi_{n 2}\right)$ with

$$
\begin{aligned}
\Psi_{n 1}(\theta, \eta) & =\mathbb{P}_{n} \dot{\ell}_{\theta, \eta}, \\
\Psi_{n 2}(\theta, \eta) h & =\mathbb{P}_{n} B_{\theta, \eta} h-P_{\theta, \eta} B_{\theta, \eta} h, \quad h \in \mathcal{H} .
\end{aligned}
$$

The expectation of these maps under the parameter $\left(\theta_{0}, \eta_{0}\right)$ is the deterministic map $\Psi=$ ( $\Psi_{1}, \Psi_{2}$ ) given by

$$
\begin{aligned}
\Psi_{1}(\theta, \eta) & =P_{\theta_{0}, \eta_{0}} \dot{\ell}_{\theta, \eta} \\
\Psi_{2}(\theta, \eta) h & =P_{\theta_{0}, \eta_{0}} B_{\theta, \eta} h-P_{\theta, \eta} B_{\theta, \eta} h, \quad h \in \mathcal{H} .
\end{aligned}
$$

By construction, the maximum likelihood estimators $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ and the "true" parameter ( $\theta_{0}, \eta_{0}$ ) are zeros of these maps,

$$
\Psi_{n}\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)=0=\Psi\left(\theta_{0}, \eta_{0}\right) .
$$

The argument next proceeds by linearizing these equations. Assume that the parameter set $H$ for $\eta$ can be identified with a subset of a Banach space. Then an adaptation of Theorem 19.26 is as follows.
25.90 Theorem. Suppose that the functions $\dot{\ell}_{\theta, \eta}$ and $B_{\theta, \eta} h$, if h ranges over $\mathcal{H}$ and $(\theta, \eta)$ over a neighborhood of $\left(\theta_{0}, \eta_{0}\right)$, are contained in a $P_{\theta_{0}, \eta_{0}}$-Donsker class, and that

$$
P_{\theta_{0}, \eta_{0}}\left\|\dot{\ell}_{\hat{\theta}, \hat{\eta}}-\dot{\ell}_{\theta_{0}, \eta_{0}}\right\|^{2} \xrightarrow{\mathrm{P}} 0, \quad \sup _{h \in \mathcal{H}} P_{\theta_{0}, \eta_{0}}\left|B_{\hat{\theta}, \hat{\eta}} h-B_{\theta_{0}, \eta_{0}} h\right|^{2} \xrightarrow{\mathrm{P}} 0 .
$$

Furthermore, suppose that the map $\Psi: \Theta \times H \mapsto \mathbb{R}^{k} \times \ell^{\infty}(\mathcal{H})$ is Fréchet-differentiable at $\left(\theta_{0}, \eta_{0}\right)$, with a derivative $\dot{\Psi}_{0}: \mathbb{R}^{k} \times \operatorname{lin} H \mapsto \mathbb{R}^{k} \times \ell^{\infty}(\mathcal{H})$ that has a continuous inverse
on its range. If the sequence $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ is consistent for $\left(\theta_{0}, \eta_{0}\right)$ and satisfies $\Psi_{n}\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)= o_{P}\left(n^{-1 / 2}\right)$, then

$$
\dot{\Psi}_{0} \sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}, \hat{\eta}_{n}-\eta_{0}\right)=-\sqrt{n} \Psi_{n}\left(\theta_{0}, \eta_{0}\right)+o_{P}(1) .
$$

The theorem gives the joint asymptotic distribution of $\hat{\theta}_{n}$ and $\hat{\eta}_{n}$. Because $\sqrt{n} \Psi_{n}\left(\theta_{0}, \eta_{0}\right)$ is the empirical process indexed by the Donsker class consisting of the functions $\dot{\ell}_{\theta_{0}, \eta_{0}}$ and $B_{\theta_{0}, \eta_{0}} h$, this process is asymptotically normally distributed. Because normality is retained under a continuous, linear map, such as $\dot{\Psi}_{0}^{-1}$, the limit distribution of the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}, \hat{\eta}_{n}-\eta_{0}\right)$ is Gaussian as well.

The case of a partitioned parameter $(\theta, \eta)$ is an interesting one and illustrates most aspects of the application of the preceding theorem. Therefore, we continue to write the formulas in the corresponding partitioned form. However, the preceding theorem, applies more generally. In Example 25.5.1 we wrote the score operator for a semiparametric model in the form

$$
A_{\theta, \eta}(a, b)=a^{T} \dot{\ell}_{\theta, \eta}+B_{\theta, \eta} b
$$

Corresponding to this, the system of likelihood equations can be written in the form

$$
\mathbb{P}_{n} A_{\theta, \eta}(a, b)=P_{\theta, \eta} A_{\theta, \eta}(a, b), \quad \text { every }(a, b)
$$

If the partitioned parameter $(\theta, \eta)$ and the partitioned "directions" $(a, b)$ are replaced by a general parameter $\tau$ and general direction $c$, then this formulation extends to general models. The maps $\Psi_{n}$ and $\Psi$ then take the forms

$$
\Psi_{n}(\tau) c=\mathbb{P}_{n} A_{\tau} c-P_{\tau} A_{\tau} g, \quad \Psi(\tau) c=P_{\tau_{0}} A_{\tau} c-P_{\tau} A_{\tau} c
$$

The theorem requires that these can be considered maps from the parameter set into a Banach space, for instance a space $\ell^{\infty}(C)$.

To gain more insight, consider the case that $\eta$ is a measure on a measurable space $(\mathcal{Z}, \mathcal{C})$. Then the directions $h$ can often be taken equal to bounded functions $h: \mathcal{Z} \mapsto \mathbb{R}$, corresponding to the paths $d \eta_{t}=(1+t h) d \eta$ if $\eta$ is a completely unknown measure, or $d \eta_{t}=(1+t(h-\eta h)) d \eta$ if the total mass of each $\eta$ is fixed to one. In the remainder of the discussion, we assume the latter. Now the derivative map $\dot{\Psi}_{0}$ typically takes the form

$$
\left(\theta-\theta_{0}, \eta-\eta_{0}\right) \mapsto\left(\begin{array}{ll}
\dot{\Psi}_{11} & \dot{\Psi}_{12} \\
\dot{\Psi}_{21} & \dot{\Psi}_{22}
\end{array}\right)\binom{\theta-\theta_{0}}{\eta-\eta_{0}}
$$

where

$$
\begin{align*}
\dot{\Psi}_{11}\left(\theta-\theta_{0}\right) & =-P_{\theta_{0}, \eta_{0}} \dot{\ell}_{\theta_{0}, \eta_{0}} \dot{\ell}_{\theta_{0}, \eta_{0}}^{T}\left(\theta-\theta_{0}\right), \\
\dot{\Psi}_{12}\left(\eta-\eta_{0}\right) & =-\int B_{\theta_{0}, \eta_{0}}^{*} \dot{\ell}_{\theta_{0}, \eta_{0}} d\left(\eta-\eta_{0}\right),  \tag{25.91}\\
\dot{\Psi}_{21}\left(\theta-\theta_{0}\right) h & =-P_{\theta_{0}, \eta_{0}}\left(B_{\theta_{0}, \eta_{0}} h\right) \dot{\ell}_{\theta_{0}, \eta_{0}}^{T}\left(\theta-\theta_{0}\right), \\
\dot{\Psi}_{22}\left(\eta-\eta_{0}\right) h & =-\int B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}} h d\left(\eta-\eta_{0}\right) .
\end{align*}
$$

For instance, to find the last identity in an informal manner, consider a path $\eta_{t}$ in the direction of $g$, so that $d \eta_{t}-d \eta_{0}=t g d \eta_{0}+o(t)$. Then by the definition of a derivative

$$
\Psi_{2}\left(\theta_{0}, \eta_{t}\right)-\Psi_{2}\left(\theta_{0}, \eta_{0}\right) \approx \dot{\Psi}_{22}\left(\eta_{t}-\eta_{0}\right)+o(t) .
$$

On the other hand, by the definition of $\Psi$, for every $h$,

$$
\begin{aligned}
\Psi_{2}\left(\theta_{0}, \eta_{t}\right) h-\Psi\left(\theta_{0}, \eta_{0}\right) h & =-\left(P_{\theta_{0}, \eta_{t}}-P_{\theta_{0}, \eta_{0}}\right) B_{\theta_{0}, \eta_{t}} h \\
& \approx-t P_{\theta_{0}, \eta_{0}}\left(B_{\theta_{0}, \eta_{0}} g\right)\left(B_{\theta_{0}, \eta_{0}} h\right)+o(t) \\
& =-\int\left(B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}} h\right) t g d \eta_{0}+o(t)
\end{aligned}
$$

On comparing the preceding pair of displays, we obtain the last line of (25.91), at least for $d \eta-d \eta_{0}=g d \eta_{0}$. These arguments are purely heuristic, and this form of the derivative must be established for every example. For instance, within the context of Theorem 25.90, we may need to apply $\dot{\Psi}_{0}$ to $\eta$ that are not absolutely continuous with respect to $\eta_{0}$. Then the validity of (25.91) depends on the version that is used to define the adjoint operator $B_{\theta_{0}, \eta_{0}}^{*}$. By definition, an adjoint is an operator between $L_{2}$-spaces and hence maps equivalence classes into equivalence classes.

The four partial derivatives $\dot{\Psi}_{i j}$ in (25.91) involve the four parts of the information operator $A_{\theta, \eta}^{*} A_{\theta, \eta}$, which was written in a partitioned form in Example 25.5.1. In particular, the map $\dot{\Psi}_{11}$ is exactly the Fisher information for $\theta$, and the operator $\dot{\Psi}_{22}$ is defined in terms of the information operator for the nuisance parameter. This is no coincidence, because the formulas can be considered a version of the general identity "expectation of the second derivative is equal to minus the information." An abstract form of the preceding argument applied to the map $\Psi(\tau) c=P_{\tau_{0}} A_{\tau} c-P_{\tau} A_{\tau} c$ leads to the identity, with $\tau_{t}$ a path with derivative $\dot{\tau}_{0}$ at $t=0$ and score function $A_{\tau_{0}} d$,

$$
\dot{\Psi}_{0}\left(\dot{\tau}_{0}\right) c=\left\langle A_{\tau_{0}}^{*} A_{\tau_{0}} c, d\right\rangle_{\tau_{0}} .
$$

In the case of a partitioned parameter $\tau=(\theta, \eta)$, the inner inner product on the right is defined as $\langle(a, b),(\alpha, \beta)\rangle_{\tau_{0}}=a^{T} \alpha+\int b \beta d \eta_{0}$, and the four formulas in (25.91) follow by Example 25.5.1 and some algebra. A difference with the finite-dimensional situation is that the derivatives $\dot{\tau}_{0}$ may not be dense in the domain of $\dot{\Psi}_{0}$, so that the formula determines $\dot{\Psi}_{0}$ only partly.

An important condition in Theorem 25.90 is the continuous invertibility of the derivative. Because a linear map between Euclidean spaces is automatically continuous, in the finitedimensional set-up this condition reduces to the derivative being one-to-one. For infinitedimensional systems of estimating equations, the continuity is far from automatic and may be the condition that is hardest to verify. Because it refers to the $\ell^{\infty}(\mathcal{H})$-norm, we have some control over it while setting up the system of estimating equations and choosing the set of functions $\mathcal{H}$. A bigger set $\mathcal{H}$ makes $\dot{\Psi}_{0}^{-1}$ more readily continuous but makes the differentiability of $\Psi$ and the Donsker condition more stringent.

In the partitioned case, the continuous invertibility of $\dot{\Psi}_{0}$ can be verified by ascertaining the continuous invertibility of the two operators $\dot{\Psi}_{11}$ and $\dot{V}=\dot{\Psi}_{22}-\dot{\Psi}_{21} \dot{\Psi}_{11}^{-1} \dot{\Psi}_{12}$. In that case we have

$$
\dot{\Psi}_{0}^{-1}=\left(\begin{array}{cc}
\dot{\Psi}_{11}^{-1}+\dot{\Psi}_{11}^{-1} \dot{\Psi}_{12} \dot{V}^{-1} \dot{\Psi}_{21} \dot{\Psi}_{11}^{-1} & -\dot{\Psi}_{11}^{-1} \Psi_{12} \dot{V}^{-1} \\
-\dot{V}^{-1} \dot{\Psi}_{21} \dot{\Psi}_{11}^{-1} & \dot{V}^{-1}
\end{array}\right)
$$

The operator $\dot{\Psi}_{11}$ is the Fisher information matrix for $\theta$ if $\eta$ is known. If this would not be invertible, then there would be no hope of finding asymptotically normal estimators for $\theta$. The operator $\dot{V}$ has the form

$$
\dot{V}\left(\eta-\eta_{0}\right) h=-\int\left(B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}+K\right) h d\left(\eta-\eta_{0}\right),
$$

where the operator $K$ is defined as

$$
K h=-\left(P_{\theta_{0}, \eta_{0}}\left(B_{\theta_{0}, \eta_{0}} h\right) \dot{\ell}_{\theta_{0}, \eta_{0}}^{T}\right) I_{\theta_{0}, \eta_{0}}^{-1} B_{\theta_{0}, \eta_{0}}^{*} \dot{\ell}_{\theta_{0}, \eta_{0}} .
$$

The operator $\dot{V}: \operatorname{lin} H \mapsto \ell^{\infty}(\mathcal{H})$ is certainly continuously invertible if there exists a positive number $\epsilon$ such that

$$
\sup _{h \in \mathcal{H}}\left|\dot{V}\left(\eta-\eta_{0}\right) h\right| \geq \varepsilon\left\|\eta-\eta_{0}\right\| .
$$

In the case that $\eta$ is identified with the map $h \mapsto \eta h$ in $\ell^{\infty}(\mathcal{H})$, the norm on the right is given by $\sup _{h \in \mathcal{H}}\left|\left(\eta-\eta_{0}\right) h\right|$. Then the display is certainly satisfied if, for some $\varepsilon>0$,

$$
\left\{\left(B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}+K\right) h: h \in \mathcal{H}\right\} \supset \in \mathcal{H} .
$$

This condition has a nice interpretation if $\mathcal{H}$ is equal to the unit ball of a Banach space $\mathbb{B}$ of functions. Then the preceding display is equivalent to the operator $B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}+K: \mathbb{B} \mapsto \mathbb{B}$ being continuously invertible. The first part of this operator is the information operator for the nuisance parameter. Typically, this is continuously invertible if the nuisance parameter is regularly estimable at a $\sqrt{n}$-rate (relatively to the norm used) if $\theta$ is known. The following lemma guarantees that the same is then true for the operator $B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}+K$ if the efficient information matrix for $\theta$ is nonsingular, that is, the parameters $\theta$ and $\eta$ are not locally confounded.
25.92 Lemma. Let $\mathbb{B}$ be a Banach space contained in $\ell^{\infty}(\mathcal{L})$. If $\tilde{I}_{\theta_{0}, \eta_{0}}$ is nonsingular, $B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}: \mathbb{B} \mapsto \mathbb{B}$ is onto and continuously invertible and $B_{\theta_{0}, \eta_{0}}^{*} \dot{\ell}_{\theta_{0}, \eta_{0}} \in \mathbb{B}$, then $B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}+K: \mathbb{B} \mapsto \mathbb{B}$ is onto and continuously invertible.

Proof. Abbreviate the index $\left(\theta_{0}, \eta_{0}\right)$ to 0 . The operator $K$ is compact, because it has a finite-dimensional range. Therefore, by Lemma 25.93 below, the operator $B_{0}^{*} B_{0}+K$ is continuously invertible provided that it is one-to-one.

Suppose that $\left(B_{0}^{*} B_{0}+K\right) h=0$ for some $h \in \mathbb{B}$. By assumption there exists a path $t \mapsto \eta_{t}$ with score function $\bar{B}_{0} h=B_{0} h-P_{0} B_{0} h$ at $t=0$. Then the submodel indexed by $t \mapsto\left(\theta_{0}+t a_{0}, \eta_{t}\right)$, for $a_{0}=-I_{0}^{-1} P_{0}\left(B_{0} h\right) \dot{\ell}_{0}$, has score function $a_{0}^{T} \dot{\ell}_{0}+\bar{B}_{0} h$ at $t=0$, and information

$$
a_{0}^{T} I_{0} a_{0}+P_{0}\left(\bar{B}_{0} h\right)^{2}+2 a_{0}^{T} P_{0} \dot{\ell}_{0}\left(B_{0} h\right)=P_{0}\left(\bar{B}_{0} h\right)^{2}-a_{0}^{T} I_{0} a_{0} .
$$

Because the efficient information matrix is nonsingular, this information must be strictly positive, unless $a_{0}=0$. On the other hand,

$$
0=\eta_{0} h\left(B_{0}^{*} B_{0}+K\right) h=P_{0}\left(B_{0} h\right)^{2}+a_{0}^{T} P_{0}\left(B_{0} h\right) \dot{\ell}_{0}
$$

This expression is at least the right side of the preceding display and is positive if $a_{0} \neq 0$. Thus $a_{0}=0$, whence $K h=0$. Reinserting this in the equation $\left(B_{0}^{*} B_{0}+K\right) h=0$, we find that $B_{0}^{*} B_{0} h=0$ and hence $h=0$.

The proof of the preceding lemma is based on the Fredholm theory of linear operators. An operator $K: \mathbb{B} \mapsto \mathbb{B}$ is compact if it maps the unit ball into a totally bounded set. The following lemma shows that for certain operators continuous invertibility is a consequence of their being one-to-one, as is true for matrix operators on Euclidean space. ${ }^{\dagger}$ It is also useful to prove the invertibility of the information operator itself.
25.93 Lemma. Let $\mathbb{B}$ be a Banach space, let the operator $A: \mathbb{B} \mapsto \mathbb{B}$ be continuous, onto and continuously invertible and let $K: \mathbb{B} \mapsto \mathbb{B}$ be a compact operator. Then $\mathrm{R}(A+K)$ is closed and has codimension equal to the dimension of $\mathrm{N}(A+K)$. In particular, if $A+K$ is one-to-one, then $A+K$ is onto and continuously invertible.

The asymptotic covariance matrix of the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ can be computed from the expression for $\dot{\Psi}_{0}$ and the covariance function of the limiting process of the sequence $\sqrt{n} \Psi_{n}\left(\theta_{0}, \eta_{0}\right)$. However, it is easier to use an asymptotic representation of $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ as a sum. For a continuously invertible information operator $B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}$ this can be obtained as follows.

In view of (25.91), the assertion of Theorem 25.90 can be rewritten as the system of equations, with a subscript 0 denoting $\left(\theta_{0}, \eta_{0}\right)$,

$$
\begin{aligned}
-I_{0}\left(\hat{\theta}_{n}-\theta_{0}\right)-\left(\hat{\eta}_{n}-\eta_{0}\right) B_{0}^{*} \dot{\ell}_{0} & =-\left(\mathbb{P}_{n}-P_{0}\right) \dot{\ell}_{0}+o_{P}(1 / \sqrt{n}), \\
-P_{0}\left(B_{0} h\right) \dot{\ell}_{0}^{T}\left(\hat{\theta}_{n}-\theta_{0}\right)-\left(\hat{\eta}_{n}-\eta_{0}\right) B_{0}^{*} B_{0} h & =-\left(\mathbb{P}_{n}-P_{0}\right) B_{0} h+o_{P}(1 / \sqrt{n}) .
\end{aligned}
$$

The $o_{P}(1 / \sqrt{n})$-term in the second line is valid for every $h \in \mathcal{H}$ (uniformly in $h$ ). If we can also choose $h=\left(B_{0}^{*} B_{0}\right)^{-1} B_{0}^{*} \dot{\ell}_{0}$, and subtract the first equation from the second, then we arrive at

$$
\tilde{I}_{\theta_{0}, \eta_{0}} \sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=\sqrt{n}\left(\mathbb{P}_{n}-P_{0}\right) \tilde{\ell}_{\theta_{0}, \eta_{0}}+o_{P}(1)
$$

Here $\tilde{\ell}_{\theta_{0}, \eta_{0}}$ is the efficient score function for $\theta$, as given by (25.33), and $\tilde{I}_{\theta_{0}, \eta_{0}}$ is the efficient information matrix. The representation shows that the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically linear in the efficient influence function for estimating $\theta$. Hence the maximum likelihood estimator $\hat{\theta}$ is asymptotically efficient. ${ }^{\ddagger}$ The asymptotic efficiency of the estimator $\hat{\eta} h$ for $\eta h$ follows similarly.

We finish this section with a number of examples. For each example we describe the general structure and main points of the verification of the conditions of Theorem 25.90, but we refer to the original papers for some of the details.

### 25.12.1 Cox Model

Suppose that we observe a random sample from the distribution of the variable $X= (T \wedge C, 1\{T \leq C\}, Z)$, where, given $Z$, the variables $T$ and $C$ are independent, as in the

[^12]random censoring model, and $T$ follows the Cox model. Thus, the density of $X=(Y, \Delta, Z)$ is given by
$$
\left(e^{\theta z} \lambda(y) e^{-e^{\theta z} \Lambda(y)}\left(1-F_{C \mid Z}(y-\mid z)\right)\right)^{\delta}\left(e^{-e^{\theta z} \Lambda(y)} f_{C \mid Z}(y \mid z)\right)^{1-\delta} p_{Z}(z) .
$$

We define a likelihood for the parameters $(\theta, \Lambda)$ by dropping the factors involving the distribution of $(C, Z)$, and replacing $\lambda(y)$ by the pointmass $\Lambda\{y\}$,

$$
\operatorname{lik}(\theta, \Lambda)(x)=\left(e^{\theta z} \Lambda\{y\} e^{-e^{\theta z} \Lambda(y)}\right)^{\delta}\left(e^{-e^{\theta z} \Lambda(y)}\right)^{1-\delta}
$$

This likelihood is convenient in that the profile likelihood function for $\theta$ can be computed explicitly, exactly as in Example 25.69. Next, given the maximizer $\hat{\theta}$, which must be calculated numerically, the maximum likelihood estimator $\hat{\Lambda}$ is given by an explicit formula.

Given the general results put into place so far, proving the consistency of $(\hat{\theta}, \hat{\Lambda})$ is the hardest problem. The methods of section 5.2 do not apply directly, because of the empirical factor $\Lambda\{y\}$ in the likelihood. These methods can be adapted. Alternatively, the consistency can be proved using the explicit form of the profile likelihood function. We omit a discussion.

For simplicity we make a number of partly unnecessary assumptions. First, we assume that the covariate $Z$ is bounded, and that the true conditional distributions of $T$ and $C$ given $Z$ possess continuous Lebesgue densities. Second, we assume that there exists a finite number $\tau>0$ such that $\mathrm{P}(C \geq \tau)=\mathrm{P}(C=\tau)>0$ and $P_{\theta_{0}, \Lambda_{0}}(T>\tau)>0$. The latter condition is not unnatural: It is satisfied if the survival study is stopped at some time $\tau$ at which a positive fraction of individuals is still "at risk" (alive). Third, we assume that, for any measurable function $h$, the probability that $Z \neq h(Y)$ is positive. The function $\Lambda$ now matters only on $[0, \tau]$; we shall identify $\Lambda$ with its restriction to this interval. Under these conditions the maximum likelihood estimator $(\hat{\theta}, \hat{\Lambda})$ can be shown to be consistent for the product of the Euclidean topology and the topology of uniform convergence on $[0, \tau]$.

The score function for $\theta$ takes the form

$$
\dot{\ell}_{\theta, \Lambda}(x)=\delta z-z e^{\theta z} \Lambda(y) .
$$

For any bounded, measurable function $h:[0, \tau] \mapsto \mathbb{R}$, the path defined by $d \Lambda_{t}=(1+ t h) d \Lambda$ defines a submodel passing through $\Lambda$ at $t=0$. Its score function at $t=0$ takes the form

$$
B_{\theta, \Lambda} h(x)=\delta h(y)-e^{\theta z} \int_{[0, y]} h d \Lambda
$$

The function $h \mapsto B_{\theta, \Lambda} h(x)$ is bounded on every set of uniformly bounded functions $h$, for any finite measure $\Lambda$, and is even uniformly bounded in $x$ and in $(\theta, \Lambda)$ ranging over a neighborhood of $\left(\theta_{0}, \Lambda_{0}\right)$.

It is not difficult to find a formula for the adjoint $B_{\theta, \Lambda}^{*}$ of $B_{\theta, \Lambda}: L_{2}(\Lambda) \mapsto L_{2}\left(P_{\theta, \Lambda}\right)$, but this is tedious and not insightful. The information operator $B_{\theta, \Lambda}^{*} B_{\theta, \Lambda}: L_{2}(\Lambda) \mapsto L_{2}(\Lambda)$ can be calculated from the identity $P_{\theta, \Lambda}\left(B_{\theta, \Lambda} g\right)\left(B_{\theta, \Lambda} h\right)=\Lambda g\left(B_{\theta, \Lambda}^{*} B_{\theta, \Lambda} h\right)$. For continuous $\Lambda$ it takes the surprisingly simple form

$$
B_{\theta, \Lambda}^{*} B_{\theta, \Lambda} h(y)=h(y) \mathrm{E}_{\theta, \Lambda} 1_{Y \geq y} e^{\theta Z}
$$

To see this, write the product $B_{\theta, \Lambda} g B_{\theta, \Lambda} h$ as the sum of four terms

$$
\delta h(y) g(y)-\delta h(y) e^{\theta z} \int_{0}^{y} g d \Lambda-\delta g(y) e^{\theta z} \int_{0}^{y} h d \Lambda+e^{2 \theta z} \int_{0}^{y} g d \Lambda \int_{0}^{y} h d \Lambda
$$

Take the expectation under $P_{\theta, \Lambda}$ and interchange the order of the integrals to represent $B_{\theta, \Lambda}^{*} B_{\theta, \Lambda} h$ also as a sum of four terms. Partially integrate the fourth term to see that this cancels the second and third terms. We are left with the first term. The function $B_{\theta, \Lambda}^{*} \dot{\ell}_{\theta, \Lambda}$ can be obtained by a similar argument, starting from the identity $P_{\theta, \Lambda} \dot{\ell}_{\theta, \Lambda} B_{\theta, \Lambda} h= \Lambda\left(B_{\theta, \Lambda}^{*} \dot{\ell}_{\theta, \Lambda}\right) h$. It is given by

$$
B_{\theta, \Lambda}^{*} \dot{\ell}_{\theta, \Lambda}=\mathrm{E}_{\theta, \Lambda} 1_{Y \geq y} Z e^{\theta Z}
$$

The calculation of the information operator in this way is instructive, but only to check (25.91) for this example. As in other examples a direct derivation of the derivative of the map $\Psi=\left(\Psi_{1}, \Psi_{2}\right)$ given by $\Psi_{1}(\theta, \Lambda)=P_{0} \dot{\ell}_{\theta, \Lambda}$ and $\Psi_{2}(\theta, \Lambda) h=P_{0} B_{\theta, \Lambda} h$ requires less work. In the present case this is almost trivial, for the map $\Psi$ is already linear in $\Lambda$. Writing $G_{0}(y \mid Z)$ for the distribution function of $Y$ given $Z$, this map can be written as

$$
\begin{aligned}
\Psi_{1}(\theta, \Lambda) & =\mathrm{E} Z e^{\theta_{0} Z} \int \bar{G}_{0}(y \mid Z) d \Lambda_{0}(y)-\mathrm{E} Z e^{\theta Z} \int \Lambda(y) d G_{0}(y \mid Z) \\
\Psi_{2}(\theta, \Lambda) h & =\mathrm{E} e^{\theta_{0} Z} \int h(y) \bar{G}_{0}(y \mid Z) d \Lambda_{0}(y)-\mathrm{E} e^{\theta Z} \iint_{[0, y]} h d \Lambda d G_{0}(y \mid Z)
\end{aligned}
$$

If we take $\mathcal{H}$ equal to the unit ball of the space $\operatorname{BV}[0, \tau]$ of bounded functions of bounded variation, then the map $\Psi: \mathbb{R} \times \ell^{\infty}(\mathcal{H}) \mapsto \mathbb{R} \times \ell^{\infty}(\mathcal{H})$ is linear and continuous in $\Lambda$, and its partial derivatives with respect to $\theta$ can be found by differentiation under the expectation and are continuous in a neighborhood of $\left(\theta_{0}, \Lambda_{0}\right)$. Several applications of Fubini's theorem show that the derivative takes the form (25.91).

We can consider $B_{0}^{*} B_{0}$ as an operator of the space $\mathrm{BV}[0, \tau]$ into itself. Then it is continuously invertible if the function $y \mapsto \mathrm{E}_{\theta_{0}, \Lambda_{0}} 1_{Y \geq y} e^{\theta_{0} Z}$ is bounded away from zero on $[0, \tau]$. This we have (indirectly) assumed. Thus, we can apply Lemma 25.92. The efficient score function takes the form (25.33), which, with $M_{i}(y)=\mathrm{E}_{\theta_{0}, \Lambda_{0}} 1_{Y \geq y} Z^{i} e^{\theta_{0} Z}$, reduces to

$$
\tilde{\ell}_{\theta_{0}, \Lambda_{0}}(x)=\delta\left(z-\frac{M_{1}}{M_{0}}(y)\right)-e^{\theta_{0} z} \int_{[0, y]}\left(z-\frac{M_{1}}{M_{0}}(t)\right) d \Lambda_{0}(t)
$$

The efficient information for $\theta$ can be computed from this as

$$
\tilde{I}_{\theta_{0}, \Lambda_{0}}=\mathrm{E} e^{\theta_{0} Z} \int\left(Z-\frac{M_{1}}{M_{0}}(y)\right)^{2} \bar{G}_{0}(y \mid Z) d \Lambda_{0}(y)
$$

This is strictly positive by the assumption that $Z$ is not equal to a function of $Y$.
The class $\mathcal{H}$ is a universal Donsker class, and hence the first parts $\delta h(y)$ of the functions $B_{\theta, \Lambda} h$ form a Donsker class. The functions of the form $\int_{[0, y]} h d \Lambda$ with $h$ ranging over $\mathcal{H}$ and $\Lambda$ ranging over a collection of measures of uniformly bounded variation are functions of uniformly bounded variation and hence also belong to a Donsker class. Thus the functions $B_{\theta, \Lambda} h$ form a Donsker class by Example 19.20.

### 25.12.2 Partially Missing Data

Suppose that the observations are a random sample from a density of the form

$$
(x, y, z) \mapsto \int p_{\theta}(x \mid s) d \eta(s) p_{\theta}(y \mid z) d \eta(z)=: p_{\theta}(x \mid \eta) p_{\theta}(y \mid z) d \eta(z) .
$$

Here the parameter $\eta$ is a completely unknown distribution, and the kernel $p_{\theta}(\cdot \mid s)$ is a given parametric model indexed by the parameters $\theta$ and $s$, relative to some density $\mu$. Thus, we obtain equal numbers of bad and good (direct) observations concerning $\eta$. Typically, by themselves the bad observations do not contribute positive information concerning the cumulative distribution function $\eta$, but along with the good observations they help to cut the asymptotic variance of the maximum likelihood estimators.
25.94 Example. This model can arise if we are interested in the relationship between a response $Y$ and a covariate $Z$, but because of the cost of measurement we do not observe $Z$ for a fraction of the population. For instance, a full observation $(Y, Z)=(D, W, Z)$ could consist of

- a logistic regression $D$ on $\exp Z$ with intercept and slope $\beta_{0}$ and $\beta_{1}$, respectively, and
- a linear regression $W$ on $Z$ with intercept and slope $\alpha_{0}$ and $\alpha_{1}$, respectively, and an $N\left(0, \sigma^{2}\right)$-error.
Given $Z$ the variables $D$ and $W$ are assumed independent, and $Z$ has a completely unspecified distribution $\eta$ on an interval in $\mathbb{R}$. The kernel is equal to, with $\Psi$ denoting the logistic distribution function and $\phi$ denoting the standard normal density,

$$
p_{\theta}(d, w \mid z)=\Psi\left(\beta_{0}+\beta_{1} e^{z}\right)^{d}\left(1-\Psi\left(\beta_{0}+\beta_{1} e^{z}\right)\right)^{1-d} \frac{1}{\sigma} \phi\left(\frac{w-\alpha_{0}-\alpha_{1} z}{\sigma}\right) .
$$

The precise form of this density does not play a major role in the following.
In this situation the covariate $Z$ is a gold standard, but, in view of the costs of measurement, for a selection of observations only the "surrogate covariate" $W$ is available. For instance, $Z$ corresponds to the LDL cholesterol and $W$ to total cholesterol, and we are interested in heart disease $D=1$. For simplicity, each observation in our set-up consists of one full observation $(Y, Z)=(D, W, Z)$ and one reduced observation $X=(D, W)$. $\square$
25.95 Example. If the kernel $p_{\theta}(y \mid z)$ is equal to the normal density with mean $z$ and variance $\theta$, then the observations are a random sample $Z_{1}, \ldots, Z_{n}$ from $\eta$, a random sample $X_{1}, \ldots, X_{n}$ from $\eta$ perturbed by an additive (unobserved) normal error, and a sample $Y_{1}, \ldots, Y_{n}$ of random variables that given $Z_{1}, \ldots, Z_{n}$ are normally distributed with means $Z_{i}$ and variance $\theta$. In this case the interest is perhaps focused on estimating $\eta$, rather than $\theta$. $\square$

The distribution of an observation $(X, Y, Z)$ is given by two densities and a nonparametric part. We choose as likelihood

$$
\operatorname{lik}(\theta, \eta)(x, y, z)=p_{\theta}(x \mid \eta) p_{\theta}(y \mid z) \eta\{z\} .
$$

Thus, for the completely unknown distribution $\eta$ of $Z$ we use the empirical likelihood for the other part of the observations we use the density, as usual. It is clear that the maximum
likelihood estimator $\hat{\eta}$ charges all observed values $z_{1}, \ldots, z_{n}$, but the term $p_{\theta}(x \mid \eta)$ leads to some additional support points as well. In general, these are not equal to values of the observations.

The score function for $\theta$ is given by

$$
\dot{\ell}_{\theta, \eta}(x, y, z)=\dot{\kappa}_{\theta, \eta}(x)+\dot{\kappa}_{\theta}(y \mid z)=\frac{\int \dot{\kappa}_{\theta}(x \mid s) p_{\theta}(x \mid s) d \eta(s)}{p_{\theta}(x \mid \eta)}+\dot{\kappa}_{\theta}(y \mid z)
$$

Here $\dot{\kappa}_{\theta}(y \mid z)=\partial / \partial \theta \log p_{\theta}(y \mid z)$ is the score function for $\theta$ for the conditional density $p_{\theta}(y \mid z)$, and $\dot{\kappa}_{\theta, \eta}(x)$ is the score function for $\theta$ of the mixture density $p_{\theta}(x \mid \eta)$.

Paths of the form $d \eta_{t}=(1+t h) d \eta$ (with $\eta h=0$ ) yield scores

$$
B_{\theta, \eta} h(x, z)=C_{\theta, \eta} h(x)+h(z)=\frac{\int h(s) p_{\theta}(x \mid s) d \eta(s)}{p_{\theta}(x \mid \eta)}+h(z) .
$$

The operator $C_{\theta, \eta}: L_{2}(\eta) \mapsto L_{2}\left(p_{\theta}(\cdot \mid \eta)\right)$ is the score operator for the mixture part of the model. Its Hilbert-space adjoint is given by

$$
C_{\theta, \eta}^{*} g(z)=\int g(x) p_{\theta}(x \mid z) d \mu(x)
$$

The range of $B_{\theta, \eta}$ is contained in the subset $G$ of $L_{2}\left(p_{\theta}(\cdot \mid \eta) \times \eta\right)$ consisting of functions of the form $(x, z) \mapsto g_{1}(x)+g_{2}(z)+c$. This representation of a function of this type is unique if both $g_{1}$ and $g_{2}$ are taken to be mean-zero functions. With $P_{\theta, \eta}$ the distribution of the observation $(X, Y, Z)$,

$$
P_{\theta, \eta}\left(g_{1} \oplus g_{2} \oplus c\right) B_{\theta, \eta} h=P_{\theta, \eta} g_{1} C_{\theta, \eta} h+\eta g_{2} h+2 \eta h c=\eta\left(C_{\theta, \eta}^{*} g_{1}+g_{2}+2 c\right) h
$$

Thus, the adjoint $B_{\theta, \eta}^{*}: G \mapsto L_{2}(\eta)$ of the operator $B_{\theta, \eta}: L_{2}(\eta) \mapsto G$ is given by

$$
B_{\theta, \eta}^{*}\left(g_{1} \oplus g_{2} \oplus c\right)=C_{\theta, \eta}^{*} g_{1}+g_{2}+2 c
$$

Consequently, on the set of mean-zero functions in $L_{2}(\eta)$ we have the identity $B_{\theta, \eta}^{*} B_{\theta, \eta}= C_{\theta, \eta}^{*} C_{\theta, \eta}+I$. Because the operator $C_{\theta, \eta}^{*} C_{\theta, \eta}$ is nonnegative definite, the operator $B_{\theta, \eta}^{*} B_{\theta, \eta}$ is strictly positive definite and hence continuously invertible as an operator of $L_{2}(\eta)$ into itself. The following lemma gives a condition for continuous invertibility as an operator on the space $C^{\alpha}(\mathcal{Z})$ of all " $\alpha$-smooth functions." For $\alpha_{0} \leq \alpha$ the smallest integer strictly smaller than $\alpha$, these consist of the functions $h: \mathcal{Z} \subset \mathbb{R}^{d} \mapsto \mathbb{R}$ whose partial derivatives up to order $\alpha_{0}$ exist and are bounded and whose $\alpha_{0}$-order partial derivatives are Lipschitz of order $\alpha-\alpha_{0}$. These are Banach spaces relative to the norm, with $D^{k}$ a differential operator $\partial^{k_{1}} \cdots \partial^{k^{d}} / \partial z_{1}^{k_{1}} \cdots z_{k}^{k_{d}}$,

$$
\|h\|_{\alpha}=\max _{|k|<\alpha} \sup _{z \in \mathcal{Z}}\left|D^{k} h(z)\right| \vee \max _{|k|=\alpha_{0}} \sup _{z_{1} \neq z_{2} \in \mathcal{Z}} \frac{\left|D^{k}\left(z_{1}\right)-D^{k}\left(z_{2}\right)\right|}{\left\|z_{1}-z_{2}\right\|^{\alpha-\alpha_{0}}}
$$

The unit ball of one of these spaces is a good choice for the set $\mathcal{H}$ indexing the likelihood equations if the maps $z \mapsto p_{\theta_{0}}(x \mid z)$ are sufficiently smooth.
25.96 Lemma. Let $\mathcal{Z}$ be a bounded, convex subset of $\mathbb{R}^{d}$ and assume that the maps $z \mapsto p_{0}(x \mid z)$ are continuously differentiable for each $x$ with partial derivatives $\partial / \partial z_{i} p_{\theta_{0}}(x \mid z)$
satisfying, for all $z, z^{\prime}$ in $\mathcal{Z}$ and fixed constants $K$ and $\alpha>0$,

$$
\begin{gathered}
\int\left|\frac{\partial}{\partial z_{i}} p_{0}(x \mid z)-\frac{\partial}{\partial z_{i}} p_{0}\left(x \mid z^{\prime}\right)\right| d \mu(x) \leq K\left\|z-z^{\prime}\right\|^{\alpha} \\
\int\left|\frac{\partial}{\partial z_{i}} p_{0}(x \mid z)\right| d \mu(x) \leq K
\end{gathered}
$$

Then $B_{\theta_{0}, \eta_{0}}^{*} B_{\theta_{0}, \eta_{0}}: C^{\beta}(\mathcal{Z}) \mapsto C^{\beta}(\mathcal{Z})$ is continuously invertible for every $\beta<\alpha$.
Proof. By its strict positive-definiteness in the Hilbert-space sense, the operator $B_{0}^{*} B_{0}$ : $\ell^{\infty}(\mathcal{Z}) \mapsto \ell^{\infty}(\mathcal{Z})$ is certainly one-to-one in that $B_{0}^{*} B_{0} h=0$ implies that $h=0$ almost surely under $\eta_{0}$. On reinserting this we find that $-h=C_{0}^{*} C_{0} h=C_{0}^{*} 0=0$ everywhere. Thus $B_{0}^{*} B_{0}$ is also one-to-one in a pointwise sense. If it can be shown that $C_{0}^{*} C_{0}: C^{\beta}(\mathcal{Z}) \mapsto C^{\beta}(\mathcal{Z})$ is compact, then $B_{0}^{*} B_{0}$ is onto and continuously invertible, by Lemma 25.93.

It follows from the Lipschitz condition on the partial derivatives that $C_{0}^{*} h(z)$ is differentiable for every bounded function $h: \mathcal{X} \mapsto \mathbb{R}$ and its partial derivatives can be found by differentiating under the integral sign:

$$
\frac{\partial}{\partial z_{i}} C_{0}^{*} h(z)=\int h(x) \frac{\partial}{\partial z_{i}} p_{0}(x \mid z) d \mu(x) .
$$

The two conditions of the lemma imply that this function has Lipschitz norm of order $\alpha$ bounded by $K\|h\|_{\infty}$. Let $h_{n}$ be a uniformly bounded sequence in $\ell^{\infty}(\mathcal{X})$. Then the partial derivatives of the sequence $C_{0}^{*} h_{n}$ are uniformly bounded and have uniformly bounded Lipschitz norms of order $\alpha$. Because $\mathcal{Z}$ is totally bounded, it follows by a strengthening of the Arzela-Ascoli theorem that the sequences of partial derivatives are precompact with respect to the Lipschitz norm of order $\beta$ for every $\beta<\alpha$. Thus there exists a subsequence along which the partial derivatives converge in the Lipschitz norm of order $\beta$. By the Arzela-Ascoli theorem there exists a further subsequence such that the functions $C_{0}^{*} h_{n}(z)$ converge uniformly to a limit. If both a sequence of functions itself and their continuous partial derivatives converge uniformly to limits, then the limit of the functions must have the limits of the sequences of partial derivatives as its partial derivatives. We conclude that $C_{0}^{*} h_{n}$ converges in the $\|\cdot\|_{1+\beta}$-norm, whence $C_{0}^{*}: \ell^{\infty}(\mathcal{X}) \mapsto C^{\beta}(\mathcal{Z})$ is compact. Then the operator $C_{0}^{*} C_{0}$ is certainly compact as an operator from $C^{\beta}(\mathcal{Z})$ into itself.

Because the efficient information for $\theta$ is bounded below by the information for $\theta$ in a "good" observation ( $Y, Z$ ), it is typically positive. Then the preceding lemma together with Lemma 25.92 shows that the derivative $\dot{\Psi}_{0}$ is continuously invertible as a map from $\mathbb{R}^{k} \times \ell^{\infty}(\mathcal{H}) \times \mathbb{R}^{k} \times \ell^{\infty}(\mathcal{H})$ for $\mathcal{H}$ the unit ball of $C^{\beta}(\mathcal{Z})$. This is useful in the cases that the dimension of $\mathcal{Z}$ is not bigger than 3, for, in view of Example 19.9, we must have that $\beta>d / 2$ in order that the functions $B_{\theta, \eta} h=C_{\theta, \eta} h \oplus h$ form a Donsker class, as required by Theorem 25.90. Thus $\alpha>1 / 2,2,3 / 2$ suffice in dimensions 1,2,3, but we need $\beta>2$ if $\mathcal{Z}$ is of dimension 4.

Sets $\mathcal{Z}$ of higher dimension can be treated by extending Lemma 25.96 to take into account higher-order derivatives, or alternatively, by not using a $C^{\alpha}(\mathcal{Z})$-unit ball for $\mathcal{H}$. The general requirements for a class $\mathcal{H}$ that is the unit ball of a Banach space $\mathbb{B}$ are that $\mathcal{H}$ is $\eta_{0}$-Donsker, that $C_{0}^{*} C_{0} \mathbb{B} \subset \mathbb{B}$, and that $C_{0}^{*} C_{0}: \mathbb{B} \mapsto \mathbb{B}$ is compact. For instance, if $p_{\theta}(x \mid z)$ corresponds to a linear regression on $z$, then the functions $z \mapsto C_{0}^{*} C_{0} h(z)$ are of the form $z \mapsto g\left(\alpha^{T} z\right)$
for functions $g$ with a one-dimensional domain. Then the dimensionality of $\mathcal{Z}$ does not really play an important role, and we can apply similar arguments, under weaker conditions than required by treating $\mathcal{Z}$ as general higher dimensional, with, for instance, $\mathbb{B}$ equal to the Banach space consisting of the linear span of the functions $z \mapsto g\left(\alpha^{T} z\right)$ in $C_{1}^{1}(\mathcal{Z})$ and $\mathcal{H}$ its unit ball.

The second main condition of Theorem 25.92 is that the functions $i_{\theta, \eta}$ and $B_{\theta, \eta} h$ form a Donsker class. Dependent on the kernel $p_{\theta}(x \mid z)$, a variety of methods may be used to verify this condition. One possibility is to employ smoothness of the kernel in $x$ in combination with Example 19.9. If the map $x \mapsto p_{\theta}(x \mid z)$ is appropriately smooth, then so is the map $x \mapsto C_{\theta, \eta} h(x)$. Straightforward differentiation yields

$$
\frac{\partial}{\partial x_{i}} C_{\theta, \eta} h(x)=\operatorname{cov}_{x}\left(h(Z), \frac{\partial}{\partial x_{i}} \log p_{\theta}(x \mid Z)\right),
$$

where for each $x$ the covariance is computed for the random variable $Z$ having the (conditional) density $z \mapsto p_{\theta}(x \mid z) d \eta(z) / p_{\theta}(x \mid \eta)$. Thus, for a given bounded function $h$,

$$
\left|\frac{\partial}{\partial x_{i}} C_{\theta, \eta} h(x)\right| \leq\|h\|_{\infty} \frac{\int\left|\frac{\partial}{\partial x_{i}} \log p_{\theta}(x \mid z)\right| p_{\theta}(x \mid z) d \eta(z)}{\int p_{\theta}(x \mid z) d \eta(z)}
$$

Depending on the function $\partial / \partial x_{i} \log p_{\theta}(x \mid z)$, this leads to a bound on the first derivative of the function $x \mapsto C_{\theta, \eta} h(x)$. If $\mathcal{X}$ is an interval in $\mathbb{R}$, then this is sufficient for applicability of Example 19.9. If $\mathcal{X}$ is higher dimensional, the we can bound higher-order partial derivatives in a similar manner.

If the main interest is in the estimation of $\eta$ rather than $\theta$, then there is also a nontechnical criterion for the choice of $\mathcal{H}$, because the final result gives the asymptotic distribution of $\hat{\eta} h$ for every $h \in \mathcal{H}$, but not necessarily for $h \notin \mathcal{H}$. Typically, a particular $h$ of interest can be added to a set $\mathcal{H}$ that is chosen for technical reasons without violating the results as given previously. The addition of an infinite set would require additional arguments. Reference [107] gives more details concerning this example.

## Notes

Most of the results in this chapter were obtained during the past 15 years, and the area is still in development. The monograph by Bickel, Klaassen, Ritov, and Wellner [8] gives many detailed information calculations, and heuristic discussions of methods to construct estimators. See [77], [101], [102], [113], [122], [145] for a number of other, also more recent, papers. For many applications in survival analysis, counting processes offer a flexible modeling tool, as shown in Andersen, Borgan, Gill, and Keiding [1], who also treat semiparametric models for survival analysis. The treatment of maximum likelihood estimators is motivated by (partially unpublished) joint work with Susan Murphy. Apparently, the present treatment of the Cox model is novel, although proofs using the profile likelihood function and martingales go back at least 15 years. In connection with estimating equations and CAR models we profited from discussions with James Robins, the representation in section 25.53 going back to [129]. The use of the empirical likelihood goes back a long way, in particular in survival analysis. More recently it has gained popularity as a basis for constructing likelihood ratio based confidence intervals. Limitations of the information
bounds and the type of asymptotics discussed in this chapter are pointed out in [128]. For further information concerning this chapter consult recent journals, both in statistics and econometrics.

## PROBLEMS

1. Suppose that the underlying distribution of a random sample of real-valued observations is known to have mean zero but is otherwise unknown.
(i) Derive a tangent set for the model.
(ii) Find the efficient influence function for estimating $\psi(P)=P(C)$ for a fixed set $C$.
(iii) Find an asymptotically efficient sequence of estimators for $\psi(P)$.
2. Suppose that the model consists of densities $p(x-\theta)$ on $\mathbb{R}^{k}$, where $p$ is a smooth density with $p(x)=p(-x)$. Find the efficient influence function for estimating $\theta$.
3. In the regression model of Example 25.28, assume in addition that $e$ and $X$ are independent. Find the efficient score function for $\theta$.
4. Find a tangent set for the set of mixture distributions $\int p(x \mid z) d F(z)$ for $x \mapsto p(x \mid z)$ the uniform distribution on $[z, z+1]$. Is the linear span of this set equal to the nonparametric tangent set?
5. (Neyman-Scott problem) Suppose that a typical observation is a pair $(X, Y)$ of variables that are conditionally independent and $N(Z, \theta)$-distributed given an unobservable variable $Z$ with a completely unknown distribution $\eta$ on $\mathbb{R}$. A natural approach to estimating $\theta$ is to "eliminate" the unobservable $Z$ by taking the difference $X-Y$. The maximum likelihood estimator based on a sample of such differences is $T_{n}=\frac{1}{2} n^{-1} \sum_{i=1}^{n}\left(X_{i}-Y_{i}\right)^{2}$.
(i) Show that the closed linear span of the tangent set for $\eta$ contains all square-integrable, mean-zero functions of $X+Y$.
(ii) Show that $T_{n}$ is asymptotically efficient.
(iii) Is $T_{n}$ equal to the semiparametric maximum likelihood estimator?
6. In Example 25.72, calculate the score operator and the information operator for $\eta$.
7. In Example 25.12, express the density of an observation $X$ in the marginal distributions $F$ and $G$ of $Y$ and $C$ and
(i) Calculate the score operators for $F$ and $G$.
(ii) Show that the empirical distribution functions $\hat{F}^{*}$ and $\hat{G}^{*}$ of the $Y_{i}$ and $C_{j}$ are asymptotically efficient for estimating the marginal distributions $F^{*}$ and $G^{*}$ of $Y$ and $C$, respectively;
(iii) Prove the asymptotic normality of the estimator for $F$ given by

$$
\hat{F}(y)=1-\prod_{0 \leq s \leq y}(1-\hat{\Lambda}\{s\}), \quad \hat{\Lambda}(y)=\int_{[0, y]} \frac{d \hat{F}^{*}}{\hat{G}^{*}-\hat{F}^{*}}
$$

(iv) Show that this estimator is asymptotically efficient.
8. (Star-shaped distributions) Let $\mathcal{F}$ be the collection of all cumulative distribution functions on $[0,1]$ such that $x \mapsto F(x) / x$ is nondecreasing. (This is a famous example in which the maximum likelihood estimator is inconsistent.)
(i) Show that there exists a maximizer $\hat{F}_{n}($ over $\mathcal{F})$ of the empirical likelihood $F \mapsto \prod_{i=1}^{n} F\left\{x_{i}\right\}$, and show that this satisfies $\hat{F}_{n}(x) \rightarrow x F(x)$ for every $x$.
(ii) Show that at every $F \in \mathcal{F}$ there is a convex tangent cone whose closed linear span is the nonparametric tangent space. What does this mean for efficient estimation of $F$ ?
9. Show that a $U$-statistic is an asymptotically efficient estimator for its expectation if the model is nonparametric.
10. Suppose that the model consists of all probability distributions on the real line that are symmetric.
(i) If the symmetry point is known to be 0 , find the maximum likelihood estimator relative to the empirical likelihood.
(ii) If the symmetry point is unknown, characterize the maximum likelihood estimators relative to the empirical likelihood; are they useful?
11. Find the profile likelihood function for the parameter $\theta$ in the Cox model with censoring discussed in Section 25.12.1.
12. Let $\mathcal{P}$ be the set of all probability distributions on $\mathbb{R}$ with a positive density and let $\psi(P)$ be the median of $P$.
(i) Find the influence function of $\psi$.
(ii) Prove that the sample median is asymptotically efficient.

## References

[1] Andersen, P.K., Borgan, O., Gill, R.D., and Keiding, N. (1992). Statistical Models Based on Counting Processes. Springer, Berlin.
[2] Arcones, M.A., and Giné, E. (1993). Limit theorems for $U$-processes. Annals of Probability 21, 1494-1542.
[3] Bahadur, R.R. (1967). An optimal property of the likelihood ratio statistic. Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability (1965/66) I, 13-26. University of California Press, Berkeley.
[4] Bahadur, R.R. (1971). Some limit theorems in statistics. Conference Board of the Mathematical Sciences Regional Conference Series in Applied Mathematics 4. Society for Industrial and Applied Mathematics, Philadelphia.
[5] Barndoff-Nielsen, O.E., and Hall, P. (1988). On the level-error after Bartlett adjustment of the likelihood ratio statistic. Biometrika 75, 378-378.
[6] Bauer, H. (1981). Probability Theory and Elements of Measure Theory. Holt, Rinehart, and Winston, New York.
[7] Bentkus, V., Götze, F., van Zwet, W.R. (1997). An Edgeworth expansion for symmetric statistics. Annals of Statistics 25, 851-896.
[8] Bickel, P.J., Klaassen, C.A.J., Ritov, Y., and Wellner, J.A. (1993). Efficient and Adaptive Estimation for Semiparametric Models. Johns Hopkins University Press, Baltimore.
[9] Bickel, P.J., and Ghosh, J.K. (1990). A decomposition for the likelihood ratio statistic and the Bartlett correction-a Bayesian argument. Annals of Statistics 18, 1070-1090.
[10] Bickel, P.J., and Rosenblatt, M. (1973). On some global measures of the deviations of density function estimates. Annals of Statistics 1, 1071-1095.
[11] Billingsley, P. (1968). Convergence of Probability Measures. John Wiley, New York.
[12] Birgé, L. (1983). Approximation dans les espaces métriques et théorie de l'estimation. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 65, 181-238.
[13] Birgé, L. (1997). Estimation of unimodal densities without smoothness assumptions. Annals of Statistics 25, 970-981.
[14] Birgé, L., and Massart, P. (1993). Rates of convergence for minimum contrast estimators. Probability Theory and Related Fields 97, 113-150.
[15] Birgé, L., and Massart, P. (1997). From model selection to adaptive estimation. Festschrift for Lucien Le Cam. Springer, New York, 55-87.
[16] Birman, M.S., and Solomjak, M.Z. (1967). Piecewise-polynomial approximation of functions of the classes $W_{p}$. Mathematics of the USSR Sbornik 73, 295-317.
[17] Brown, L. (1987). Fundamentals of Statistical Exponential Families with Applications in Statistical Decision Theory. Institute of Mathematical Statistics, California.
[18] Brown, L.D., and Fox, M. (1974). Admissibility of procedures in two-dimensional location parameter problems. Annals of Statistics 2, 248-266.
[19] Cantelli, F.P. (1933). Sulla determinazione empirica delle leggi di probabilità. Giornale dell'Istituto Italiano degli Attuari 4, 421-424.
[20] Chernoff, H. (1952). A measure of asymptotic efficiency for tests of a hypothesis based on the sum of observations. Annals of Mathematical Statistics 23, 493-507.
[21] Chernoff, H. (1954). On the distribution of the likelihood ratio statistic. Annals of Mathematical Statistics 25, 573-578.
[22] Chernoff, H., and Lehmann, E.L. (1954). The use of maximum likelihood estimates in $\chi^{2}$ tests for goodness of fit. Annals of Mathematical Statistics 25, 579-586.
[23] Chow, Y.S., and Teicher, H. (1978). Probability Theory. Springer-Verlag, New York.
[24] Cohn, D.L. (1980). Measure Theory. Birkhäuser, Boston.
[25] Copas, J. (1975). On the unimodality of the likelihood for the Cauchy distribution. Biometrika 62, 701-704.
[26] Cramér, H. (1938). Sur un nouveau théoréme-limite de la théorie des probabilités. Actualités Scientifiques et Industrielles 736, 5-23.
[27] Cramér, H. (1946). Mathematical Methods of Statistics. Princeton University Press, Princeton.
[28] Csörgö, M. (1983). Quantile Processes with Statistical Applications. CBMS-NSF Regional Conference Series in Applied Mathematics 42. Society for Industrial and Applied Mathematics (SIAM), Philadelphia.
[29] Dacunha-Castelle, D., and Duflo, M. (1993). Probabilités et Statistiques, tome II. Masson, Paris.
[30] Davies, R.B. (1973). Asymptotic inference in stationary Gaussian time-series. Advances in Applied Probability 4, 469-497.
[31] Dembo, A., and Zeitouni, O. (1993). Large Deviation Techniques and Applications. Jones and Bartlett Publishers, Boston.
[32] Deuschel, J.D., and Stroock, D.W. (1989). Large Deviations. Academic Press, New York.
[33] Devroye, L., and Gyorfi, L. (1985). Nonparametric Density Estimation: The $L_{1}$-View. John Wiley \& Sons, New York.
[34] Diaconis, P., and Freedman, D. (1986). On the consistency of Bayes estimates. Annals of Statistics 14, 1-26.
[35] Donald, S.G., and Newey, W.K. (1994). Series estimation of semilinear models. Journal of Multivariate Analysis 50, 30-40.
[36] Donoho, D.L., and Johnstone, I.M. (1994). Idea spatial adaptation by wavelet shrinkage. Biometrika 81, 425-455.
[37] Donoho, D.L., and Liu, R.C. (1991). Geometrizing rates of convergence II, III. Annals of Statistics 19, 633-701.
[38] Donsker, M.D. (1952). Justification and extension of Doob's heuristic approach to the Kolmogorov-Smirnov theorems. Annals of Mathematical Statistics 23, 277-281.
[39] Doob, J. (1948). Application of the theory of martingales. Le Calcul des Probabilités et ses Applications. Colloques Internationales du CNRS Paris, 22-28.
[40] Drost, F.C. (1988). Asymptotics for Generalized Chi-Square Goodness-of-Fit Tests. CWI tract 48. Centrum voor Wiskunde en Informatica, Amsterdam.
[41] Dudley, R.M. (1976). Probability and Metrics: Convergence of Laws on Metric Spaces. Mathematics Institute Lecture Notes Series 45. Aarhus University, Denmark.
[42] Dudley, R.M. (1989). Real Analysis and Probability, Wadsworth, Belmont, California.
[43] Dupač, V., and Hájek, J. (1969). Asymptotic normality of simple linear rank statistics under alternatives, Annals of Mathematical Statistics II 40, 1992-2017.
[44] Efron, B., and Tibshirani, R.J. (1993). An Introduction to the Bootstrap. Chapman and Hall, London.
[45] Fahrmeir, L., and Kaufmann, H. (1985). Consistency and asymptotic normality of the maximum likelihood estimator in generalized linear models. Annals of Statistics 13, 342-368. (Correction: Annals of Statistics 14, 1643.)
[46] Farrell, R.H. (1972). On the best obtainable asymptotic rates of convergence in estimation of a density function at a point. Annals of Mathematical Statistics 43, 170-180.
[47] Feller, W. (1971). An Introduction to Probability Theory and Its Applications, vol. II. John Wiley \& Sons, New York.
[48] Fisher, R.A. (1922). On the mathematical foundations of theoretical statistics. Philosophical Transactions of the Royal Society of London, Series A 222, 309-368.
[49] Fisher, R.A. (1924). The conditions under which $\chi^{2}$ measures the discrepancy between observations and hypothesis. Journal Royal Statist. Soc. 87, 442-450.
[50] Fisher, R.A. (1925). Theory of statistical estimation. Proceedings of the Cambridge Philosophical Society 22, 700-725.
[51] van de Geer, S.A. (1988). Regression Analysis and Empirical Processes. CWI Tract 45. Centrum voor Wiskunde en Informatica, Amsterdam.
[52] Ghosh, J.K. (1994). Higher Order Asymptotics. Institute of Mathematical Statistics, Hayward.
[53] Gill, R.D. (1989). Non- and semi-parametric maximum likelihood estimators and the von-Mises method (part I). Scandinavian Journal of Statistics 16, 97-128.
[54] Gill, R.D. (1994). Lectures on survival analysis. Lecture Notes in Mathematics 1581, 115-241.
[55] Gill, R.D., and Johansen, S. (1990). A survey of product-integration with a view towards application in survival analysis. Annals of Statistics 18, 1501-1555.
[56] Gill, R.D., and van der Vaart, A.W. (1993). Non- and semi-parametric maximum likelihood estimators and the von Mises method (part II). Scandinavian Journal of Statistics 20, 271-288.
[57] Giné, E., and Zinn, J. (1986). Lectures on the central limit theorem for empirical processes. Lecture Notes in Mathematics 1221, 50-113.
[58] Giné, E., and Zinn, J. (1990). Bootstrapping general empirical measures. Annals of Probability 18, 851-869.
[59] Glivenko, V. (1933). Sulla determinazione empirica della leggi di probabilità. Giornale dell'Istituto Italiano degli Attuari 4, 92-99.
[60] Greenwood, P.E., and Nikulin, M.S. (1996). A Guide to Chi-Squared Testing. John Wiley \& Sons, New York.
[61] Groeneboom, P. (1980). Large Deviations and Bahadur Efficiencies. MC tract 118, Centrum voor Wiskunde en Informatica, Amsterdam.
[62] Groeneboom, P. (1985). Estimating a monotone density. Proceedings of the Berkeley Conference in Honor of Jerzy Neyman and Jack Kiefer 2, 539-555. Wadsworth, Monterey, California.
[63] Groeneboom, P. (1988). Brownian Motion with a parabolic drift and Airy functions. Probability Theory and Related Fields 81, 79-109.
[64] Groeneboom, P., Lopuhaä, H.P. (1993). Isotonic estimators of monotone densities and distribution functions: basic facts. Statistica Neerlandica 47, 175-183.
[65] Groeneboom, P., Oosterhoff, J., and Ruymgaart, F. (1979). Large deviation theorems for empirical probability measures. Annals of Probability 7, 553-586.
[66] de Haan, L. (1976). Sample extremes: An elementary introduction. Statistica Neerlandica 30, 161-172.
[67] Hájek, J. (1961). Some extensions of the Wald-Wolfowitz-Noether theorem. Annals of Mathematical Statistics 32, 506-523.
[68] Hájek, J. (1968). Asymptotic normality of simple linear rank statistics under alternatives. Annals of Mathematical Statistics 39, 325-346.
[69] Hájek, J. (1970). A characterization of limiting distributions of regular estimates. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 14, 323-330.
[70] Hájek, J. (1972). Local asymptotic minimax and admissibility in estimation. Proceedings of the Sixth Berkeley Symposium on Mathematical Statistics and Probability 1, 175-194.
[71] Hájek, J., and Šidák, Z. (1967). Theory of Rank Tests. Academic Press, New York.
[72] Hall, P. (1992). The Bootstrap and Edgeworth Expansion. Springer Series in Statistics. SpringerVerlag, New York.
[73] Hampel, F.R., Ronchetti, E.M., Rousseeuw, P.J., and Stahel, W.A. (1986). Robust Statistics: the Approach Based on Influence Functions. Wiley, New York.
[74] Helmers, R. (1982). Edgeworth Expansions for Linear Combinations of Order Statistics. Mathematical Centre Tracts 105. Mathematisch Centrum, Amsterdam.
[75] Hoeffding, W. (1948). A class of statistics with asymptotically normal distribution. Annals of Mathematical Statistics 19, 293-325.
[76] Hoffmann-Jørgensen, J. (1991). Stochastic Processes on Polish Spaces. Various Publication Series 39. Aarhus Universitet, Aarhus, Denmark.
[77] Huang, J. (1996). Efficient estimation for the Cox model with interval censoring. Annals of Statistics 24, 540-568.
[78] Huber, P. (1967). The behavior of maximum likelihood estimates under nonstandard conditions. Proceedings of the Fifth Berkeley Symposium on Mathematical Statistics and Probability 1, 221-233. University of California Press, Berkeley.
[79] Huber, P. (1974). Robust Statistics. Wiley, New York.
[80] Ibragimov, I.A., and Has'minskii, R.Z. (1981). Statistical Estimation: Asymptotic Theory. Springer-Verlag, New York.
[81] Jagers, P. (1975). Branching Processes with Biological Applications. John Wiley \& Sons, London-New York-Sydney.
[82] Janssen, A., and Mason, D.M. (1990). Nonstandard Rank Tests. Lecture Notes in Statistics 65. Springer-Verlag, New York.
[83] Jensen, J.L. (1993). A historical sketch and some new results on the improved log likelihood ratio statistic. Scandinavian Journal of Statistics 20, 1-15.
[84] Kallenberg, W.C.M. (1983). Intermediate efficiency, theory and examples. Annals of Statistics 11, 498-504.
[85] Kallenberg, W.C.M., and Ledwina, T. (1987). On local and nonlocal measures of efficiency. Annals of Statistics 15, 1401-1420.
[86] Kallenberg, W.C.M., Oosterhoff, J., and Schriever, B.F. (1980). The number of classes in chi-squared goodness-of-fit tests. Journal of the American Statistical Association 80, 959-968.
[87] Kim, J., and Pollard, D. (1990). Cube root asymptotics. Annals of Statistics 18, 191-219.
[88] Kolčinskii, V.I. (1981). On the central limit theorem for empirical measures. Theory of Probability and Mathematical Statistics 24, 71-82.
[89] Koul, H.L., and Pflug, G.C. (1990). Weakly adaptive estimators in explosive autoregression. Annals of Statistics 18, 939-960.
[90] Leadbetter, M.R., Lindgren, G., and Rootzén, H. (1983). Extremes and Related Properties of Random Sequences and Processes. Springer-Verlag, New York.
[91] Le Cam, L. (1953). On some asymptotic properties of maximum likelihood estimates and related Bayes estimates. University of California Publications in Statistics 1, 277-330.
[92] Le Cam, L. (1960). Locally asymptotically normal families of distributions. University of California Publications in Statistics 3, 37-98.
[93] Le Cam, L. (1969). Théorie Asymptotique de la Décision Statistique. Les Presses de l'Université de Montréal, Montreal.
[94] Le Cam, L. (1970). On the assumptions used to prove asymptotic normality of maximum likelihood estimates. Annals of Mathematical Statistics 41, 802-828.
[95] Le Cam, L. (1972). Limits of experiments. Proceedings of the Sixth Berkeley Symposium on Mathematical Statistics and Probability 1, 245-261. University of California Press, Berkeley.
[96] Le Cam, L. (1986). Asymptotic Methods in Statistical Decision Theory. Springer-Verlag, New York.
[97] Le Cam, L.M., and Yang, G. (1990). Asymptotics in Statistics: Some Basic Concepts. SpringerVerlag, New York.
[98] Ledoux, M., and Talagrand, M. (1991). Probability in Banach Spaces: Isoperimetry and Processes. Springer-Verlag, Berlin.
[99] Lehmann, E.L. (1983). Theory of Point Estimation. Wiley, New York.
[100] Lehmann, E.L. (1991). Testing Statistical Hypotheses, 2nd edition. Wiley, New York.
[101] Levit, B.Y. (1978). Infinite-dimensional informational lower bounds. Theory of Probability and its Applications 23, 388-394.
[102] Mammen, E., and van de Geer, S.A. (1997). Penalized quasi-likelihood estimation in partial linear models. Annals of Statistics 25, 1014-1035.
[103] Massart, P. (1990). The tight constant in the Dvoretsky-Kiefer-Wolfowitz inequality. Annals of Probability 18, 1269-1283.
[104] von Mises, R. (1947). On the asymptotic distribution of differentiable statistical functions. Annals of Mathematical Statistics 18, 309-348.
[105] Murphy, S.A., Rossini, T.J., and van der Vaart, A.W. (1997). MLE in the proportional odds model. Journal of the American Statistical Association 92, 968-976.
[106] Murphy, S.A., and van der Vaart, A.W. (1997). Semiparametric likelihood ratio inference. Annals of Statistics 25, 1471-1509.
[107] Murphy, S.A., and van der Vaart, A.W. (1996). Semiparametric mixtures in case-control studies.
[108] Murphy, S.A., and van der Vaart, A.W. (1996). Likelihood ratio inference in the errors-invariables model. Journal of Multivariate Analysis 59, 81-108.
[109] Noether, G.E. (1955). On a theorem of Pitman. Annals of Mathematical Statistics 25, 64-68.
[110] Nussbaum, M. (1996). Asymptotic equivalence of density estimation and Gaussian white noise. Annals of Statistics 24, 2399-2430.
[111] Ossiander, M. (1987). A central limit theorem under metric entropy with $L_{2}$ bracketing. Annals of Probability 15, 897-919.
[112] Pearson, K. (1900). On the criterion that a given system of deviations from the probable in the case of a correlated system of variables is such that it can be reasonably supposed to have arisen from random sampling. Philosopical Magazine, Series 5 50, 157-175. (Reprinted in: Karl Pearson's Early Statistical Papers, Cambridge University Press, 1956.)
[113] Pfanzagl, J., and Wefelmeyer, W. (1982). Contributions to a General Asymptotic Statistical Theory. Lecture Notes in Statistics 13. Springer-Verlag, New York.
[114] Pfanzagl, J., and Wefelmeyer, W. (1985). Asymptotic Expansions for General Statistical Models. Lecture Notes in Statistics 31. Springer-Verlag, New York.
[115] Pflug, G.C. (1983). The limiting loglikelihood process for discontinuous density families. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 64, 15-35.
[116] Pollard, D. (1982). A central limit theorem for empirical processes. Journal of the Australian Mathematical Society A 33, 235-248.
[117] Pollard, D. (1984). Convergence of Stochastic Processes. Springer-Verlag, New York.
[118] Pollard, D. (1985). New ways to prove central limit theorems. Econometric Theory 1, 295-314.
[119] Pollard, D. (1989). A maximal inequality for sums of independent processes under a bracketing condition.
[120] Pollard, D. (1990). Empirical Processes: Theory and Applications. NSF-CBMS Regional Conference Series in Probability and Statistics 2. Institute of Mathematical Statistics and American Statistical Association. Hayward, California.
[121] Prakasa Rao, B.L.S. (1983). Nonparametric Functional Estimation. Academic Press, Orlando.
[122] Qin, J., and Lawless, J. (1994). Empirical likelihood and general estimating equations. Annals of Statistics 22, 300-325.
[123] Rao, C.R. (1973). Linear Statistical Inference and Its Applications. Wiley, New York.
[124] Reed, M., and Simon, B. (1980). Functional Analysis. Academic Press, Orlando.
[125] Reeds, J.A. (1976). On the Definition of von Mises Functionals. Ph.D. dissertation, Department of Statistics, Harvard University, Cambridge, MA.
[126] Reeds, J.A. (1985). Asymptotic number of roots of Cauchy location likelihood equations. Annals of Statistics 13, 775-784.
[127] Révész, P. (1968). The Laws of Large Numbers. Academic Press, New York.
[128] Robins, J.M., and Ritov, Y. (1997). Towards a curse of dimensionality appropriate (CODA) asymptotic theory for semi-parametric models. Statistics in Medicine 16, 285-319.
[129] Robins, J.M., and Rotnitzky, A. (1992). Recovery of information and adjustment for dependent censoring using surrogate markers. In AIDS Epidemiology-Methodological Issues, 297-331, eds: N. Jewell, K. Dietz, and V. Farewell. Birkhäuser, Boston.
[130] Roussas, G.G. (1972). Contiguity of Probability Measures. Cambridge University Press, Cambridge.
[131] Rubin, H., and Vitale, R.A. (1980). Asymptotic distribution of symmetric statistics. Annals of Statistics 8, 165-170.
[132] Rudin, W. (1973). Functional Analysis. McGraw-Hill, New York.
[133] Shiryayev, A.N. (1984). Probability. Springer-Verlag, New York-Berlin.
[134] Shorack, G.R., and Wellner, J.A. (1986). Empirical Processes with Applications to Statistics. Wiley, New York.
[135] Silverman, B.W. (1986). Density Estimation for Statistics and Data Analysis. Chapman and Hall, London.
[136] Stigler, S.M. (1974). Linear functions of order statistics with smooth weight functions. Annals of Statistics 2, 676-693. (Correction: Annals of Statistics 7, 466.)
[137] Stone, C.J. (1990). Large-sample inference for log-spline models. Annals of Statistics, 18, 717-741.
[138] Strasser, H. (1985). Mathematical Theory of Statistics. Walter de Gruyter, Berlin.
[139] van der Vaart, A.W. (1988). Statistical Estimation in Large Parameter Spaces. CWI Tracts 44. Centrum voor Wiskunde en Informatica, Amsterdam.
[140] van der Vaart, A.W. (1991). On differentiable functionals. Annals of Statistics 19, 178-204.
[141] van der Vaart, A.W. (1991). An asymptotic representation theorem. International Statistical Review 59, 97-121.
[142] van der Vaart, A.W. (1994). Limits of Experiments. Lecture Notes, Yale University.
[143] van der Vaart, A.W. (1995). Efficiency of infinite dimensional M-estimators. Statistica Neerlandica 49, 9-30.
[144] van der Vaart, A.W. (1994). Maximum likelihood estimation with partially censored observations. Annals of Statistics 22, 1896-1916.
[145] van der Vaart, A.W. (1996). Efficient estimation in semiparametric models. Annals of Statistics 24, 862-878.
[146] van der Vaart, A.W., and Wellner, J.A. (1996). Weak Convergence and Empirical Processes. Springer, New York.
[147] Vapnik, V.N., and Červonenkis, A.Y. (1971). On the uniform convergence of relative frequencies of events to their probabilities. Theory of Probability and Its Applications 16, 264-280.
[148] Wahba, G. (1990). Spline models for observational data. CBMS-NSF Regional Conference Series in Applied Mathematics 59. Society for Industrial and Applied Mathematics, Philadelphia.
[149] Wald, A. (1943). Test of statistical hypotheses concerning several perameters when the number of observations is large. Transactions of the American Mathematical Society 54, 426-482.
[150] Wilks, S.S. (1938). The large-sample distribution of the likelihood ratio for testing composite hypotheses. Annals of Mathematical Statistics 19, 60-62.
[151] van Zwet, W.R. (1984). A Berry-Esseen bound for symmetric statistics. Zeitschrift für Wahrscheinlichkeitstheorie und Verwandte Gebiete 66, 425-440.

## Index

$\alpha$-Winsorized means, 316
$\alpha$-trimmed means, 316
absolute rank, 181
absolutely
continuous, 85, 268
continuous part, 85
accessible, 150
adaptation, 223
adjoint map, 361
adjoint score operator, 372
antiranks, 184
Assouad's lemma, 347
asymptotic
consistent, 44, 329
differentiable, 106
distribution free, 164
efficient, 64, 367, 387
equicontinuity, 262
influence function, 58
of level $\alpha, 192$
linear, 401
lower bound, 108
measurable, 260
relative efficiency, 195
risk, 109
tight, 260
tightness, 262
uniformly integrable, 17

Bahadur
efficiency, 203
relative efficiency, 203
slope, 203, 239
Bahadur-Kiefer theorems, 310
Banach space, 361
bandwidth, 342
Bartlett correction, 238
Bayes
estimator, 138
risk, 138
Bernstein's inequality, 285
best regular, 115
bilinear map, 295
bootstrap
empirical distribution, 332
empirical process, 332
parametric, 328, 340
Borel
$\sigma$-field, 256
measurable, 256
bounded
Lipschitz metric, 332
in probability, 8
bowl-shaped, 113
bracket, 270
bracketing
integral, 270
number, 270
Brownian
bridge, 266
bridge process, 168
motion, 268
cadlag, 257
canonical link functions, 235
Cartesian product, 257
Cauchy sequence, 255
central
limit theorem, 6
moments, 27
chain rule, 298
chaining argument, 285
characteristic function, 13
chi-square distribution, 242
Chibisov-O'Reilly theorem, 273
closed, 255
closure, 255
coarsening at random (CAR), 379
coefficients, 173
compact, 255, 424
compact differentiability, 297
complete, 255
completion, 257
concordant, 164
conditional expectation, 155
consistent, 3, 149, 193, 329
contiguous, 87
continuity set, 7
continuous, 255
continuously differentiable, 297
converge
almost surely, 6
in distribution, 5, 258
in probability, 5
weakly, 305
convergence
in law, 5
of sets, 101, 232
convergence-determining, 18
converges, 255
almost surely, 258
in distribution, 258
to a limit experiment, 126
in probability, 258
coordinate projections, 257
Cornish-Fisher expansion, 338
covering number, 274
Cox partial likelihood, 404
Cramér's
condition, 335
theorem, 208
Cramér-Von Mises statistic, 171, 277, 295
Cramér-Wold device, 16
critical region, 192
cross-validation, 346
cumulant generating function, 205
cumulative hazard function, 180, 300
defective distribution function, 9
deficiency distance, 137
degenerate, 167
dense, 255
deviance, 234
differentiable, 25, 363, 387
in quadratic mean, 64, 94
differentially equivalent, 106
discretization, 72
discretized, 72
distance function, 255
distribution
free, 174
function, 5
dominated, 127
Donsker, 269
dual space, 361, 387
Dzhaparidze-Nikulin statistic, 254
$\varepsilon$-bracket, 270
Edgeworth expansions, 335
efficient
function, 369, 373
influence function, 363
information matrix, 369
score equations, 391

Efron's percentile method, 327
ellipsoidally symmetric, 84
empirical
bootstrap, 328
difference process, 309
distribution, 42, 269
distribution function, 265
likelihood, 402
process, 42, 266, 269
entropy, 274
with bracketing, 270
integral, 274
uniform, 274
envelope function, 270
equivalent, 126
equivariant-in-law, 113
errors-in-variables, 83
estimating equations, 41
experiment, 125
exponential
family, 37
inequality, 285
finite approximation, 261
Fisher
information for location, 96
information matrix, 39
Fréchet differentiable, 297
full rank, 38

Gateaux differentiable, 296
Gaussian chaos, 167
generalized inverse, 254
Gini's mean difference, 171
Glivenko-Cantelli, 46
Glivenko-Cantelli theorem, 265
good rate function, 209
goodness-of-fit, 248, 277
gradient, 26
Grenander estimator, 356

Hájek projection, 157
Hadamard differentiable, 296
Hamming distance, 347
Hellinger
affinity, 211
distance, 211
integral, 213
statistic, 244
Hermite polynomial, 169
Hilbert space, 360
Hoeffding decomposition, 157
Huber estimators, 43
Hungarian embeddings, 269
hypothesis of independence, 247
identifiable, 62
improper, 138
influence function, 292
information operator, 372
interior, 255
interquartile range, 317
joint convergence, 11
$(k \times r)$ table, 247
Kaplan-Meier estimator, 302
Kendall's $\tau$-statistic, 164
kernel, 161, 342
estimator, 342
method, 341
Kolmogorov-Smirnov, 265, 277
Kruskal-Wallis, 181
Kullback-Leibler divergence, 56, 62
kurtosis, 27
$L$-statistic, 316
Lagrange multipliers, 214
LAN, 104
large
deviation, 203
deviation principle, 209
law of large numbers, 6
Le Cam's third lemma, 90
least
concave majorant, 349
favorable, 362
Lebesgue decomposition, 85
Lehmann alternatives, 180
level, 192
$\alpha, 215$
likelihood
ratio, 86
ratio process, 126
ratio statistic, 228
linear signed rank statistic, 221
link function, 234
Lipschitz, 6
local
criterion functions, 79
empirical measure, 283
limiting power, 194
parameter, 92
parameter space, 101
locally
asymptotically
minimax, 120
mixed normal, 131
normal, 104
quadratic, 132
most powerful, 179
scores, 222, 225
signed rank statistics, 183
test, 190
log rank test, 180
logit model, 66
loss function, 109, 113
$M$-estimator, 41
Mann-Whitney statistic, 166, 175
marginal
convergence, 11
vectors, 261
weak convergence, 126
Markov's inequality, 10
Marshall's lemma, 357
maximal inequality, 76 , 285
maximum
likelihood estimator, 42
likelihood statistic, 231
mean
absolute deviation, 280
integrated square error, 344
median
absolute deviation, 310
absolute deviation from the median, 60
test, 178
metric, 255
space, 255
midrank, 173
Mill's ratio, 313
minimax criterion, 113
minimum-chi square estimator, 244
missing at random (MAR), 379
mode, 355
model, 358
mutually contiguous, 87
$\sqrt{n}$-consistent, 72
natural
level, 190
parameter space, 38
nearly maximize, 45
Nelson-Aalen estimator, 301
Newton-Rhapson, 71
noncentral chi-square distribution, 237
noncentrality parameter, 217
nonparametric
maximum likelihood estimator, 403
model, 341, 358
norm, 255
normed space, 255
nuisance parameter, 358
observed
level, 239
significance level, 203
odds, 406
offspring distribution, 133
one-step
estimator, 72
method, 71
open, 255
ball, 255
operators, 361
order statistics, 173
orthocomplement, 361
orthogonal, 85, 153, 361
part, 85
outer probability, 258
P-Brownian bridge, 269
$P$-Donsker, 269
$P$-Glivenko-Cantelli, 269
$p$ th sample quantile, 43
parametric
bootstrap, 328, 340
models, 341
Pearson statistic, 242
percentile
$t$-method, 327
method, 327
perfect, 211
permutation tests, 188
Pitman
efficiency, 201
relative efficiency, 202
polynomial classes, 275
pooled sample, 174
posterior distribution, 138
power function, 215
prior distribution, 138
probability integral transformation, 305
probit model, 66
product
integral, 300
limit estimator, 302, 407
profile likelihood, 403
projection, 153
lemma, 361
proportional hazards, 180
quantile, 43
function, 304, 306
transformation, 305
random
element, 256
vector, 5
randomized statistic, 98, 127
range, 317
rank, 164, 173
correlation coefficient, 184
statistic, 173
Rao-Robson-Nikulin statistic, 250
rate function, 209
rate-adaptive, 346
regular, 115, 365
regularity, 340
relative efficiency, 111, 201
right-censored data, 301
robust statistics, 43
sample
correlation coefficient, 30
path, 260
space, 125
Sanov's theorem, 209
Savage test, 180
score, 173, 221
function, 42, 63, 362
operator, 371
statistic, 231
tests, 220
semimetric, 255
seminorm, 256
semiparametric models, 358
separable, 255
shatter, 275
shrinkage estimator, 119
Siegel-Tukey, 191
sign, 181
statistic, 183, 193, 221
sign-function, 43
signed rank
statistic, 181
test, 164
simple linear rank statistics, 173
single-index, 359
singular part, 86
size, 192, 215
skewness, 29
Skorohod space, 257
slope, 195, 218
smoothing method, 342
solid, 237
spectral density, 105
standard (or uniform) Brownian bridge, 266
statistical experiment, 92
Stein's lemma, 213
stochastic process, 260
Strassen's theorem, 268
strong
approximations, 268
law of large numbers, 6
strongly
consistent, 149
degenerate, 167
subconvex, 113
subgraphs, 275
$\tau$-topology, 209
tangent set, 362
for $\eta, 369$
tangent space, 362
tangentially, 297
test, 191, 215
function, 215
tight, 8, 260
total
variation, 22
variation distance, 211
totally bounded, 255
two-sample $U$-statistic, 165
$U$-statistic, 161
unbiased, 226
uniform
covering numbers, 274
entropy integral, 274
Glivenko-Cantelli, 145
norm, 257
uniformly
most powerful test, 216
tight, 8
unimodal, 355
uprank, 173
$V$-statistic, 172, 295, 303
van der Waerden statistic, 175
Vapnik-C̆ervonenkis classes, 274
variance stabililizing transformation, 30
VC class, 275
VC index, 275
Volterra equation, 408
von Mises expansion, 292

Wald
statistic, 231
tests, 220
Watson-Roy statistic, 251
weak
convergence, 5
law of large numbers, 6
weighted empirical process, 273
well-separated, 45
Wilcoxon
signed rank statistic, 183, 221
statistic, 175
two-sample statistic, 167
window, 342
$Z$-estimators, 41


[^0]:    ${ }^{\dagger}$ For a metric space $\mathbb{D}$, the set $\mathrm{BL}_{1}(\mathbb{D})$ consists of all functions $h: \mathbb{D} \mapsto[-1,1]$ that are uniformly Lipschitz: $\left|h\left(z_{1}\right)-h\left(z_{2}\right)\right| \leq d\left(z_{1}, z_{2}\right)$ for every pair $\left(z_{1}, z_{2}\right)$. See, for example, Chapter 1.12 of [146].
    ${ }^{\ddagger}$ For a proof of Theorem 23.7, see the original paper [58], or, for example, Chapter 3.6 of [146].

[^1]:    ${ }^{\dagger}$ If $P$ and every one of the measures $P_{t}$ possess densities $p$ and $p_{t}$ with respect to a measure $\mu_{t}$, then the expressions $d P$ and $d P_{t}$ can be replaced by $p$ and $p_{t}$ and the integral can be understood relative to $\mu_{t}$ (add $d \mu_{t}$ on the right). We use the notations $d P_{t}$ and $d P$, because some models $\mathcal{P}$ of interest are not dominated, and the choice of $\mu_{t}$ is irrelevant. However, the model could be taken dominated for simplicity, and then $d P_{t}$ and $d P$ are just the densities of $P_{t}$ and $P$.

[^2]:    ${ }^{\dagger}$ If the tangent set is not a linear space, then the situation becomes even more complicated. If the tangent set is a convex cone, then the minimax risk in the left side of Theorem 25.21 cannot fall below the normal risk on the right side, but there may be nonregular estimator sequences for which there is equality. If the tangent set is not convex, then the assertion of Theorem 25.21 may fail. Convex tangent cones arise frequently; fortunately, nonconvex tangent cones are rare.

[^3]:    ${ }^{\dagger}$ That no other functions can occur is shown in, for example, [8, p. 56-57] but need not concern us here.

[^4]:    ${ }^{\dagger}$ For a proof, see [140].

[^5]:    ${ }^{\dagger}$ For a proof of the following lemma, see, for example, [139, pp. 188-193].

[^6]:    ${ }^{\dagger}$ The density is relative to a dominating measure $\nu$ on the sample space for $\Delta$, and we suppose that $(\delta, y) \mapsto r(\delta \mid y)$ is a Markov kernel.

[^7]:    ${ }^{\dagger}$ See for example, Chapter 3.11 in [146] for some possibilities and references.

[^8]:    ${ }^{\dagger}$ The notation $P \ell_{\hat{\eta}}$ is an abbreviation for the integral $\int \ell_{\hat{\eta}}(x) d P(x)$. Thus the expectation is taken with respect to $x$ only and not with respect to $\hat{\eta}$.

[^9]:    ${ }^{\dagger}$ See [108] for a proof.

[^10]:    ${ }^{\dagger}$ See, for example, [133, p. 206] or [55] for an extended discussion.

[^11]:    ${ }^{\dagger}$ For a proof see [106].

[^12]:    ${ }^{\dagger}$ For a proof see, for example, [132, pp. 99-103].
    ${ }^{\ddagger}$ This conclusion also can be reached from general results on the asymptotic efficiency of the maximum likelihood estimator. See [56] and [143].

