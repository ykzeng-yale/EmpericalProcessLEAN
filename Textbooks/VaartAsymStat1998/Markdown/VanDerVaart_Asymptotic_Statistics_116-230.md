jointly, for some random vector ( $S, \Delta$ ). The vector $\Delta$ is necessarily a marginal weak limit of the sequence $\Delta_{n}$ and hence it is $N(0, J)$-distributed. Combination with Theorem 7.2 yields

$$
\left(T_{n}, \log \frac{d P_{n, h}}{d P_{n, 0}}\right) \stackrel{0}{\rightsquigarrow}\left(S, h^{T} \Delta-\frac{1}{2} h^{T} J h\right) .
$$

In particular, the sequence $\log d P_{n, h} / d P_{n, 0}$ converges to the normal $N\left(-\frac{1}{2} h^{T} J h, h^{T} J h\right)$ distribution. By Example 6.5, the sequences $P_{n, h}$ and $P_{n, 0}$ are contiguous. The limit law $L_{h}$ of $T_{n}$ under $h$ can therefore be expressed in the joint law on the right, by the general form of Le Cam's third lemma: For each Borel set $B$

$$
L_{h}(B)=\mathrm{E} 1_{B}(S) e^{h^{T} \Delta-\frac{1}{2} h^{T} J h}
$$

We need to find a statistic $T$ in the normal experiment having this law under $h$ (for every $h$ ), using only the knowledge that $\Delta$ is $N(0, J)$-distributed.

By the lemma below there exists a randomized statistic $T$ such that, with $U$ uniformly distributed and independent of $\Delta,{ }^{\dagger}$

$$
(T(\Delta, U), \Delta) \sim(S, \Delta) .
$$

Because the random vectors on the left and right sides have the same second marginal distribution, this is the same as saying that $T(\delta, U)$ is distributed according to the conditional distribution of $S$ given $\Delta=\delta$, for almost every $\delta$. As shown in the next lemma, this can be achieved by using the quantile transformation.

Let $X$ be an observation in the limit experiment $\left(N\left(h, J^{-1}\right): h \in \mathbb{R}^{k}\right)$. Then $J X$ is under $h=0$ normally $N(0, J)$-distributed and hence it is equal in distribution to $\Delta$. Furthermore, by Fubini's theorem,

$$
\begin{aligned}
\mathrm{P}_{h}(T(J X, U) \in B) & =\int \mathrm{P}(T(J x, U) \in B) e^{-\frac{1}{2}(x-h)^{T} J(x-h)} \sqrt{\frac{\operatorname{det} J}{(2 \pi)^{k}}} d x \\
& =\mathrm{E}_{0} 1_{B}(T(J X, U)) e^{h^{T} J X-\frac{1}{2} h^{T} J h}
\end{aligned}
$$

This equals $L_{h}(B)$, because, by construction, the vector $(T(J X, U), J X)$ has the same distribution under $h=0$ as ( $S, \Delta$ ). The randomized statistic $T(J X, U)$ has law $L_{h}$ under $h$ and hence satisfies the requirements.
7.11 Lemma. Given a random vector $(S, \Delta)$ with values in $\mathbb{R}^{d} \times \mathbb{R}^{k}$ and an independent uniformly $[0,1]$ random variable $U$ (defined on the same probability space), there exists a jointly measurable map $T$ on $\mathbb{R}^{k} \times[0,1]$ such that $(T(\Delta, U), \Delta)$ and $(S, \Delta)$ are equal in distribution.

Proof. For simplicity of notation we only give a construction for $d=2$. It is possible to produce two independent uniform $[0,1]$ variables $U_{1}$ and $U_{2}$ from one given $[0,1]$ variable $U$. (For instance, construct $U_{1}$ and $U_{2}$ from the even and odd numbered digits in the decimal expansion of $U$.) Therefore it suffices to find a statistic $T=T\left(\Delta, U_{1}, U_{2}\right)$ such that $(T, \Delta)$ and $(S, \Delta)$ are equal in law. Because the second marginals are equal, it

[^0]suffices to construct $T$ such that $T\left(\delta, U_{1}, U_{2}\right)$ is equal in distribution to $S$ given $\Delta=\delta$, for every $\delta \in \mathbb{R}^{k}$. Let $Q_{1}\left(u_{1} \mid \delta\right)$ and $Q_{2}\left(u_{2} \mid \delta, s_{1}\right)$ be the quantile functions of the conditional distributions
$$
P^{S_{1} \mid \Delta=\delta} \quad \text { and } \quad P^{S_{2} \mid \Delta=\delta, S_{1}=s_{1}}
$$
respectively. These are measurable functions in their two and three arguments, respectively. Furthermore, $Q_{1}\left(U_{1} \mid \delta\right)$ has law $P^{S_{1} \mid \Delta=\delta}$ and $Q_{2}\left(U_{2} \mid \delta, s_{1}\right)$ has law $P^{S_{2} \mid \Delta=\delta, S_{1}=s_{1}}$, for every $\delta$ and $s_{1}$. Set
$$
T\left(\delta, U_{1}, U_{2}\right)=\left(Q_{1}\left(U_{1} \mid \delta\right), \quad Q_{2}\left(U_{2} \mid \delta, Q_{1}\left(U_{1} \mid \delta\right)\right)\right) .
$$

Then the first coordinate $Q_{1}\left(U_{1} \mid \delta\right)$ of $T\left(\delta, U_{1}, U_{2}\right)$ possesses the distribution $P^{S_{1} \mid \Delta=\delta}$. Given that this first coordinate equals $s_{1}$, the second coordinate is distributed as $Q_{2}\left(U_{2} \mid \delta, s_{1}\right)$, which has law $P^{S_{2} \mid \Delta=\delta, S_{1}=s_{1}}$ by construction. Thus $T$ satisfies the requirements.

### 7.4 Maximum Likelihood

Maximum likelihood estimators in smooth parametric models were shown to be asymptotically normal in Chapter 5. The convergence of the local experiments to a normal limit experiment gives an insightful explanation of this fact.

By the representation theorem, Theorem 7.10, every sequence of statistics in the local experiments ( $P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}$ ) is matched in the limit by a statistic in the normal experiment. Although this does not follow from this theorem, a sequence of maximum likelihood estimators is typically matched by the maximum likelihood estimator in the limit experiment. Now the maximum likelihood estimator for $h$ in the experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{k}\right)$ is the observation $X$ itself (the mean of a sample of size one), and this is normally distributed. Thus, we should expect that the maximum likelihood estimators $\hat{h}_{n}$ for the local parameter $h$ in the experiments ( $P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}$ ) converge in distribution to $X$. In terms of the original parameter $\theta$, the local maximum likelihood estimator $\hat{h}_{n}$ is the standardized maximum likelihood estimator $\hat{h}_{n}=\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$. Furthermore, the local parameter $h=0$ corresponds to the value $\theta$ of the original parameter. Thus, we should expect that under $\theta$ the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ converges in distribution to $X$ under $h=0$, that is, to the $N\left(0, I_{\theta}^{-1}\right)$-distribution.

As a heuristic explanation of the asymptotic normality of maximum likelihood estimators the preceding argument is much more insightful than the proof based on linearization of the score equation. It also explains why, or in what sense, the maximum likelihood estimator is asymptotically optimal: in the same sense as the maximum likelihood estimator of a Gaussian location parameter is optimal.

This heuristic argument cannot be justified under just local asymptotic normality, which is too weak a connection between the sequence of local experiments and the normal limit experiment for this purpose. Clearly, the argument is valid under the conditions of Theorem 5.39, because the latter theorem guarantees the asymptotic normality of the maximum likelihood estimator. This theorem adds a Lipschitz condition on the maps $\theta \mapsto \log p_{\theta}(x)$, and the "global" condition that $\hat{\theta}_{n}$ is consistent to differentiability in quadratic mean. In the following theorem, we give a direct argument, and also allow that $\theta$ is not an inner point of the parameter set, so that the local parameter spaces may not converge to the full space $\mathbb{R}^{k}$.

Then the maximum likelihood estimator in the limit experiment is a "projection" of $X$ and the limit distribution of $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ may change accordingly.

Let $\Theta$ be an arbitrary subset of $\mathbb{R}^{k}$ and define $H_{n}$ as the local parameter space $H_{n}= \sqrt{n}(\Theta-\theta)$. Then $\hat{h}_{n}$ is the maximizer over $H_{n}$ of the random function (or "process")

$$
h \mapsto \log \frac{d P_{\theta+h / \sqrt{n}}^{n}}{d P_{\theta}^{n}}
$$

If the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean, then this sequence of processes converges (marginally) in distribution to the process

$$
h \mapsto \log \frac{d N\left(h, I_{\theta}^{-1}\right)}{d N\left(0, I_{\theta}^{-1}\right)}(X)=-\frac{1}{2}(X-h)^{T} I_{\theta}(X-h)+\frac{1}{2} X^{T} I_{\theta} X
$$

If the sequence of sets $H_{n}$ converges in a suitable sense to a set $H$, then we should expect, under regularity conditions, that the sequence $\hat{h}_{n}$ converges to the maximizer $\hat{h}$ of the latter process over $H$. This maximizer is the projection of the vector $X$ onto the set $H$ relative to the metric $d(x, y)=(x-y)^{T} I_{\theta}(x-y)$ (where a "projection" means a closest point); if $H=\mathbb{R}^{k}$, this projection reduces to $X$ itself.

An appropriate notion of convergence of sets is the following. Write $H_{n} \rightarrow H$ if $H$ is the set of all limits $\lim h_{n}$ of converging sequences $h_{n}$ with $h_{n} \in H_{n}$ for every $n$ and, moreover, the limit $h=\lim _{i} h_{n_{i}}$ of every converging sequence $h_{n_{i}}$ with $h_{n_{i}} \in H_{n_{i}}$ for every $i$ is contained in $H .^{\dagger}$
7.12 Theorem. Suppose that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean at $\theta_{0}$ with nonsingular Fisher information matrix $I_{\theta_{0}}$. Furthermore, suppose that for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\theta_{0}$ and a measurable function $\dot{\ell}$ with $P_{\theta_{0}} \dot{\ell}^{2}<\infty$,

$$
\left|\log p_{\theta_{1}}(x)-\log p_{\theta_{2}}(x)\right| \leq \dot{\ell}(x)\left\|\theta_{1}-\theta_{2}\right\| .
$$

If the sequence of maximum likelihood estimators $\hat{\theta}_{n}$ is consistent and the sets $H_{n}= \sqrt{n}\left(\Theta-\theta_{0}\right)$ converge to a nonempty, convex set $H$, then the sequence $I_{\theta_{0}}^{1 / 2} \sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges under $\theta_{0}$ in distribution to the projection of a standard normal vector onto the set $I_{\theta_{0}}^{1 / 2} H$.
*Proof. Let $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta_{0}}\right)$ be the empirical process. In the proof of Theorem 5.39 it is shown that the map $\theta \mapsto \log p_{\theta}$ is differentiable at $\theta_{0}$ in $L_{2}\left(P_{\theta_{0}}\right)$ with derivative $\dot{\ell}_{\theta_{0}}$ and that the map $\theta \mapsto P_{\theta_{0}} \log p_{\theta}$ permits a Taylor expansion of order 2 at $\theta_{0}$, with "second-derivative matrix" $-I_{\theta_{0}}$. Therefore, the conditions of Lemma 19.31 are satisfied for $m_{\theta}=\log p_{\theta}$, whence, for every $M$,

$$
\sup _{\|h\| \leq M}\left|n \mathbb{P}_{n} \log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}}-h^{T} \mathbb{G}_{n} \dot{\ell}_{\theta_{0}}+\frac{1}{2} h^{T} I_{\theta_{0}} h\right| \xrightarrow{P} 0 .
$$

By Corollary 5.53 the estimators $\hat{\theta}_{n}$ are $\sqrt{n}$-consistent under $\theta_{0}$.
The preceding display is also valid for every sequence $M_{n}$ that diverges to $\infty$ sufficiently slowly. Fix such a sequence. By the $\sqrt{n}$-consistency of $\hat{\theta}_{n}$, the local maximum likelihood

[^1]estimators $\hat{h}_{n}$ are bounded in probability and hence belong to the balls of radius $M_{n}$ with probability tending to 1 . Furthermore, the sequence of intersections $H_{n} \cap$ ball $\left(0, M_{n}\right)$ converges to $H$, as the original sets $H_{n}$. Thus, we may assume that the $\hat{h}_{n}$ are the maximum likelihood estimators relative to local parameter sets $H_{n}$ that are contained in the balls of radius $M_{n}$. Fix an arbitrary closed set $F$. If $\hat{h}_{n} \in F$, then the log likelihood is maximal on $F$. Hence $\mathrm{P}\left(\hat{h}_{n} \in F\right)$ is bounded above by
$$
\begin{aligned}
& \mathrm{P}\left(\sup _{h \in F \cap H_{n}} \mathbb{P}_{n} \log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}} \geq \sup _{h \in H_{n}} \mathbb{P}_{n} \log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}}\right) \\
& \quad=\mathrm{P}\left(\sup _{h \in F \cap H_{n}} h^{T} \mathbb{G}_{n} \dot{\ell}_{\theta_{0}}-\frac{1}{2} h^{T} I_{\theta_{0}} h \geq \sup _{h \in H_{n}} h^{T} \mathbb{G}_{n} \dot{\ell}_{\theta_{0}}-\frac{1}{2} h^{T} I_{\theta_{0}} h+o_{P}(1)\right) \\
& \quad=\mathrm{P}\left(\left\|I_{\theta_{0}}^{-1 / 2} \mathbb{G}_{n} \dot{\ell}_{\theta_{0}}-I_{\theta_{0}}^{1 / 2}\left(F \cap H_{n}\right)\right\| \leq\left\|I_{\theta_{0}}^{-1 / 2} \mathbb{G}_{n} \dot{\ell}_{\theta_{0}}-I_{\theta_{0}}^{1 / 2} H_{n}\right\|+o_{P}(1)\right)
\end{aligned}
$$
by completing the square. By Lemma 7.13 (ii) and (iii) ahead, we can replace $H_{n}$ by $H$ on both sides, at the cost of adding a further $o_{P}(1)$-term and increasing the probability. Next, by the continuous mapping theorem and the continuity of the map $z \mapsto\|z-A\|$ for every set $A$, the probability is asymptotically bounded above by, with $Z$ a standard normal vector,
$$
\mathrm{P}\left(\left\|Z-I_{\theta_{0}}^{1 / 2}(F \cap H)\right\| \leq\left\|Z-I_{\theta_{0}}^{1 / 2} H\right\|\right)
$$

The projection $\Pi Z$ of the vector $Z$ on the set $I_{\theta_{0}}^{1 / 2} H$ is unique, because the latter set is convex by assumption and automatically closed. If the distance of $Z$ to $I_{\theta_{0}}^{1 / 2}(F \cap H)$ is smaller than its distance to the set $I_{\theta_{0}}^{1 / 2} H$, then $\Pi Z$ must be in $I_{\theta_{0}}^{1 / 2}(F \cap H)$. Consequently, the probability in the last display is bounded by $\mathrm{P}\left(\Pi Z \in I_{\theta_{0}}^{1 / 2} F\right)$. The theorem follows from the portmanteau lemma.
7.13 Lemma. If the sequence of subsets $H_{n}$ of $\mathbb{R}^{k}$ converges to a nonempty set $H$ and the sequence of random vectors $X_{n}$ converges in distribution to a random vector $X$, then
(i) $\left\|X_{n}-H_{n}\right\| \rightsquigarrow\|X-H\|$.
(ii) $\left\|X_{n}-H_{n} \cap F\right\| \geq\left\|X_{n}-H \cap F\right\|+o_{P}(1)$, for every closed set $F$.
(iii) $\left\|X_{n}-H_{n} \cap G\right\| \leq\left\|X_{n}-H \cap G\right\|+o_{P}(1)$, for every open set $G$.

Proof. (i). Because the map $x \mapsto\|x-H\|$ is (Lipschitz) continuous for any set $H$, we have that $\left\|X_{n}-H\right\| \rightsquigarrow\|X-H\|$ by the continuous-mapping theorem. If we also show that $\left\|X_{n}-H_{n}\right\|-\left\|X_{n}-H\right\| \xrightarrow{P} 0$, then the proof is complete after an application of Slutsky's lemma. By the uniform tightness of the sequence $X_{n}$, it suffices to show that $\left\|x-H_{n}\right\| \rightarrow\|x-H\|$ uniformly for $x$ ranging over compact sets, or equivalently that $\left\|x_{n}-H_{n}\right\| \rightarrow\|x-H\|$ for every converging sequence $x_{n} \rightarrow x$.

For every fixed vector $x_{n}$, there exists a vector $h_{n} \in H_{n}$ with $\left\|x_{n}-H_{n}\right\| \geq\left\|x_{n}-h_{n}\right\|-1 / n$. Unless $\left\|x_{n}-H_{n}\right\|$ is unbounded, we can choose the sequence $h_{n}$ bounded. Then every subsequence of $h_{n}$ has a further subsequence along which it converges, to a limit $h$ in $H$. Conclude that, in any case,

$$
\liminf \left\|x_{n}-H_{n}\right\| \geq \liminf \left\|x_{n}-h_{n}\right\| \geq\|x-h\| \geq\|x-H\| .
$$

Conversely, for every $\varepsilon>0$ there exists $h \in H$ and a sequence $h_{n} \rightarrow h$ with $h_{n} \in H_{n}$ and

$$
\|x-H\| \geq\|x-h\|-\varepsilon=\lim \left\|x_{n}-h_{n}\right\|-\varepsilon \geq \limsup \left\|x_{n}-H_{n}\right\|-\varepsilon .
$$

Combination of the last two displays yields the desired convergence of the sequence $\left\|x_{n}-H_{n}\right\|$ to $\|x-H\|$.
(ii). The assertion is equivalent to the statement $\mathrm{P}\left(\left\|X_{n}-H_{n} \cap F\right\|-\left\|X_{n}-H \cap F\right\|>\right. -\varepsilon) \rightarrow 1$ for every $\varepsilon>0$. In view of the uniform tightness of the sequence $X_{n}$, this follows if $\liminf \left\|x_{n}-H_{n} \cap F\right\| \geq\|x-H \cap F\|$ for every converging sequence $x_{n} \rightarrow x$. We can prove this by the method of the first half of the proof of (i), replacing $H_{n}$ by $H_{n} \cap F$.
(iii). Analogously to the situation under (ii), it suffices to prove that $\lim \sup \| x_{n}-H_{n} \cap G\|\leq\| x-H \cap G \|$ for every converging sequence $x_{n} \rightarrow x$. This follows as the second half of the proof of (i).

## *7.5 Limit Distributions under Alternatives

Local asymptotic normality is a convenient tool in the study of the behavior of statistics under "contiguous alternatives." Under local asymptotic normality,

$$
\log \frac{d P_{\theta+h / \sqrt{n}}^{n}}{d P_{\theta}^{n}} \stackrel{\theta}{\leadsto} N\left(-\frac{1}{2} h^{T} I_{\theta} h, h^{T} I_{\theta} h\right) .
$$

Therefore, in view of Example 6.5 the sequences of distributions $P_{\theta+h / \sqrt{n}}^{n}$ and $P_{\theta}^{n}$ are mutually contiguous. This is of great use in many proofs. With the help of Le Cam's third lemma it also allows to obtain limit distributions of statistics under the parameters $\theta+h / \sqrt{n}$, once the limit behavior under $\theta$ is known. Such limit distributions are of interest, for instance, in studying the asymptotic efficiency of estimators or tests.

The general scheme is as follows. Many sequences of statistics $T_{n}$ allow an approximation by an average of the type

$$
\sqrt{n}\left(T_{n}-\mu_{\theta}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \psi_{\theta}\left(X_{i}\right)+o_{P_{\theta}}(1) .
$$

According to Theorem 7.2, the sequence of $\log$ likelihood ratios can be approximated by an average as well: It is asymptotically equivalent to an affine transformation of $n^{-1 / 2} \sum \dot{\ell}_{\theta}\left(X_{i}\right)$. The sequence of joint averages $n^{-1 / 2} \sum\left(\psi_{\theta}\left(X_{i}\right), \dot{\ell}_{\theta}\left(X_{i}\right)\right)$ is asymptotically multivariate normal under $\theta$ by the central limit theorem (provided $\psi_{\theta}$ has mean zero and finite second moment). With the help of Slutsky's lemma we obtain the joint limit distribution of $T_{n}$ and the log likelihood ratios under $\theta$ :

$$
\left(\sqrt{n}\left(T_{n}-\mu_{\theta}\right), \log \frac{d P_{\theta+h / \sqrt{n}}^{n}}{d P_{\theta}^{n}}\right) \stackrel{\theta}{\rightsquigarrow} N\left(\binom{0}{-\frac{1}{2} h^{T} I_{\theta} h},\left(\begin{array}{cc}
P_{\theta} \psi_{\theta} \psi_{\theta}^{T} & P_{\theta} \psi_{\theta} h^{T} \dot{\ell}_{\theta} \\
P_{\theta} \psi_{\theta}^{T} h^{T} \dot{\ell}_{\theta} & h^{T} I_{\theta} h
\end{array}\right)\right)
$$

Finally we can apply Le Cam's third Example 6.7 to obtain the limit distribution of $\sqrt{n}\left(T_{n}-\mu_{\theta}\right)$ under $\theta+h / \sqrt{n}$. Concrete examples of this scheme are discussed in later chapters.

## *7.6 Local Asymptotic Normality

The preceding sections of this chapter are restricted to the case of independent, identically distributed observations. However, the general ideas have a much wider applicability. A
wide variety of models satisfy a general form of local asymptotic normality and for that reason allow a unified treatment. These include models with independent, not identically distributed observations, but also models with dependent observations, such as used in time series analysis or certain random fields. Because local asymptotic normality underlies a large part of asymptotic optimality theory and also explains the asymptotic normality of certain estimators, such as maximum likelihood estimators, it is worthwhile to formulate a general concept.

Suppose the observation at "time" $n$ is distributed according to a probability measure $P_{n, \theta}$, for a parameter $\theta$ ranging over an open subset $\Theta$ of $\mathbb{R}^{k}$.
7.14 Definition. The sequence of statistical models ( $P_{n, \theta}: \theta \in \Theta$ ) is locally asymptotically normal (LAN) at $\theta$ if there exist matrices $r_{n}$ and $I_{\theta}$ and random vectors $\Delta_{n, \theta}$ such that $\Delta_{n, \theta} \stackrel{\theta}{\rightsquigarrow} N\left(0, I_{\theta}\right)$ and for every converging sequence $h_{n} \rightarrow h$

$$
\log \frac{d P_{n, \theta+r_{n}^{-1} h_{n}}}{d P_{n, \theta}}=h^{T} \Delta_{n, \theta}-\frac{1}{2} h^{T} I_{\theta} h+o_{P_{n, \theta}}(1) .
$$

7.15 Example. If the experiment $\left(P_{\theta}: \theta \in \Theta\right)$ is differentiable in quadratic mean, then the sequence of models ( $P_{\theta}^{n}: \theta \in \Theta$ ) is locally asymptotically normal with norming matrices $r_{n}=\sqrt{n} I$.

An inspection of the proof of Theorem 7.10 readily reveals that this depends on the local asymptotic normality property only. Thus, the local experiments

$$
\left(P_{n, \theta+r_{n}^{-1} h}: h \in \mathbb{R}^{k}\right)
$$

of a locally asymptotically normal sequence converge to the experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in\right. \mathbb{R}^{k}$ ), in the sense of this theorem. All results for the case of i.i.d. observations that are based on this approximation extend to general locally asymptotically normal models. To illustrate the wide range of applications we include, without proof, three examples, two of which involve dependent observations.
7.16 Example (Autoregressive processes). An autoregressive process $\left\{X_{t}: t \in \mathbb{Z}\right\}$ of order 1 satisfies the relationship $X_{t}=\theta X_{t-1}+Z_{t}$ for a sequence of independent, identically distributed variables $\ldots, Z_{-1}, Z_{0}, Z_{1}, \ldots$ with mean zero and finite variance. There exists a stationary solution $\ldots, X_{-1}, X_{0}, X_{1}, \ldots$ to the autoregressive equation if and only if $|\theta| \neq 1$. To identify the parameter it is usually assumed that $|\theta|<1$. If the density of the noise variables $Z_{j}$ has finite Fisher information for location, then the sequence of models corresponding to observing $X_{1}, \ldots, X_{n}$ with parameter set ( $-1,1$ ) is locally asymptotically normal at $\theta$ with norming matrices $r_{n}=\sqrt{n} I$.

The observations in this model form a stationary Markov chain. The result extends to general ergodic Markov chains with smooth transition densities (see [130]).
7.17 Example (Gaussian time series). This example requires some knowledge of timeseries models. Suppose that at time $n$ the observations are a stretch $X_{1}, \ldots, X_{n}$ from a stationary, Gaussian time series $\left\{X_{t}: t \in \mathbb{Z}\right\}$ with mean zero. The covariance matrix of $n$
consecutive variables is given by the (Toeplitz) matrix

$$
T_{n}\left(f_{\theta}\right)=\left(\int_{-\pi}^{\pi} e^{i(t-s) \lambda} f_{\theta}(\lambda) d \lambda\right)_{s, t=1, \ldots, n}
$$

The function $f_{\theta}$ is the spectral density of the series. It is convenient to let the parameter enter the model through the spectral density, rather than directly through the density of the observations.

Let $P_{n, \theta}$ be the distribution (on $\mathbb{R}^{n}$ ) of the vector ( $X_{1}, \ldots, X_{n}$ ), a normal distribution with mean zero and covariance matrix $T_{n}\left(f_{\theta}\right)$. The periodogram of the observations is the function

$$
I_{n}(\lambda)=\frac{1}{2 \pi n}\left|\sum_{t=1}^{n} X_{t} e^{i t \lambda}\right|^{2}
$$

Suppose that $f_{\theta}$ is bounded away from zero and infinity, and that there exists a vector-valued function $\dot{\ell}_{\theta}: \mathbb{R} \mapsto \mathbb{R}^{d}$ such that, as $h \rightarrow 0$,

$$
\int\left[f_{\theta+h}-f_{\theta}-h^{T} \dot{\ell}_{\theta} f_{\theta}\right]^{2} d \lambda=o\left(\|h\|^{2}\right)
$$

Then the sequence of experiments ( $P_{n, \theta}: \theta \in \Theta$ ) is locally asymptotically normal at $\theta$ with

$$
r_{n}=\sqrt{n}, \quad \Delta_{n, \theta}=\frac{\sqrt{n}}{4 \pi} \int\left(I_{n}-\mathrm{E}_{\theta} I_{n}\right) \frac{\dot{\ell}_{\theta}}{f_{\theta}} d \lambda, \quad I_{\theta}=\frac{1}{4 \pi} \int \dot{\ell}_{\theta} \dot{\ell}_{\theta}^{T} d \lambda
$$

The proof is elementary, but involved, because it has to deal with the quadratic forms in the $n$-variate normal density, which involve vectors whose dimension converges to infinity (see [30]).
7.18 Example (Almost regular densities). Consider estimating a location parameter $\theta$ based on a sample of size $n$ from the density $f(x-\theta)$. If $f$ is smooth, then this model is differentiable in quadratic mean and hence locally asymptotically normal by Example 7.8. If $f$ possesses points of discontinuity, or other strong irregularities, then a locally asymptotically normal approximation is impossible. ${ }^{\dagger}$ Examples of densities that are on the boundary between these "extremes" are the triangular density $f(x)=(1-|x|)^{+}$and the gamma density $f(x)=x e^{-x} 1\{x>0\}$. These yield models that are locally asymptotically normal, but with norming rate $\sqrt{n \log n}$ rather than $\sqrt{n}$. The existence of singularities in the density makes the estimation of the parameter $\theta$ easier, and hence a faster rescaling rate is necessary. (For the triangular density, the true singularities are the points -1 and 1 , the singularity at 0 is statistically unimportant, as in the case of the Laplace density.)

For a more general result, consider densities $f$ that are absolutely continuous except possibly in small neighborhoods $U_{1}, \ldots, U_{k}$ of finitely many fixed points $c_{1}, \ldots, c_{k}$. Suppose that $f^{\prime} / \sqrt{f}$ is square-integrable on the complement of $\cup_{j} U_{j}$, that $f\left(c_{j}\right)=0$ for every $j$, and that, for fixed constants $a_{1}, \ldots, a_{k}$ and $b_{1}, \ldots, b_{k}$, each of the functions

$$
x \mapsto f(x)-\left(a_{j} 1\left\{x<c_{j}\right\}+b_{j} 1\left\{x>c_{j}\right\}\right)\left|x-c_{j}\right|, \quad x \in U_{j}
$$

[^2]is twice continuously differentiable. If $\sum\left(a_{j}+b_{j}\right)>0$, then the model is locally asymptotically normal at $\theta=0$ with, for $V_{n}$ equal to the interval $\left(n^{-1 / 2}(\log n)^{-1 / 4},(\log n)^{-1}\right)$ around zero, ${ }^{\dagger}$
$$
\begin{gathered}
r_{n}=\sqrt{n \log n}, \quad I_{0}=\sum_{j}\left(a_{j}+b_{j}\right), \\
\Delta_{n, 0}=\frac{1}{\sqrt{n \log n}} \sum_{i=1}^{n} \sum_{j=1}^{k}\left(\frac{1\left\{X_{i}-c_{j} \in V_{n}\right\}}{X_{i}-c_{j}}-\int_{V_{n}} \frac{1}{x} f\left(x+c_{j}\right) d x\right) .
\end{gathered}
$$

The sequence $\Delta_{n, 0}$ may be thought of as "asymptotically sufficient" for the local parameter $h$. Its definition of $\Delta_{n, 0}$ shows that, asymptotically, all the "information" about the parameter is contained in the observations falling into the neighborhoods $V_{n}+c_{j}$. Thus, asymptotically, the problem is determined by the points of irregularity.

The remarkable rescaling rate $\sqrt{n \log n}$ can be explained by computing the Hellinger distance between the densities $f(x-\theta)$ and $f(x)$ (see section 14.5).

## Notes

Local asymptotic normality was introduced by Le Cam [92], apparently motivated by the study and construction of asymptotically similar tests. In this paper Le Cam defines two sequences of models ( $P_{n, \theta}: \theta \in \Theta$ ) and ( $Q_{n, \theta}: \theta \in \Theta$ ) to be differentially equivalent if

$$
\sup _{h \in K}\left\|P_{n, \theta+h / \sqrt{n}}-Q_{n, \theta+h / \sqrt{n}}\right\| \rightarrow 0
$$

for every bounded set $K$ and every $\theta$. He next shows that a sequence of statistics $T_{n}$ in a given asymptotically differentiable sequence of experiments (roughly LAN) that is asymptotically equivalent to the centering sequence $\Delta_{n, \theta}$ is asymptotically sufficient, in the sense that the original experiments and the experiments consisting of observing the $T_{n}$ are differentially equivalent. After some interpretation this gives roughly the same message as Theorem 7.10. The latter is a concrete example of an abstract result in [95], with a different (direct) proof.

## PROBLEMS

1. Show that the Poisson distribution with mean $\theta$ satisfies the conditions of Lemma 7.6. Find the information.
2. Find the Fisher information for location for the normal, logistic, and Laplace distributions.
3. Find the Fisher information for location for the Cauchy distributions.
4. Let $f$ be a density that is symmetric about zero. Show that the Fisher information matrix (if it exists) of the location scale family $f((x-\mu) / \sigma) / \sigma$ is diagonal.
5. Find an explicit expression for the $o_{P_{\theta}}$ (1)-term in Theorem 7.2 in the case that $p_{\theta}$ is the density of the $N(\theta, 1)$-distribution.
6. Show that the Laplace location family is differentiable in quadratic mean.
${ }^{\dagger}$ See, for example, [80, pp. 133-139] for a proof, and also a discussion of other almost regular situations. For instance, singularities of the form $f(x) \sim f\left(c_{j}\right)+\left|x-c_{j}\right|^{1 / 2}$ at points $c_{j}$ with $f\left(c_{j}\right)>0$.
7. Find the form of the score function for a location-scale family $f((x-\mu) / \sigma) / \sigma$ with parameter $\theta=(\mu, \sigma)$ and apply Lemma 7.6 to find a sufficient condition for differentiability in quadratic mean.
8. Investigate for which parameters $k$ the location family $f(x-\theta)$ for $f$ the gamma $(k, 1)$ density is differentiable in quadratic mean.
9. Let $P_{n, \theta}$ be the distribution of the vector $\left(X_{1}, \ldots, X_{n}\right)$ if $\left\{X_{t}: t \in \mathbb{Z}\right\}$ is a stationary Gaussian time series satisfying $X_{t}=\theta X_{t-1}+Z_{t}$ for a given number $|\theta|<1$ and independent standard normal variables $Z_{t}$. Show that the model is locally asymptotically normal.
10. Investigate whether the log normal family of distributions with density

$$
\frac{1}{\sigma \sqrt{2 \pi}(x-\xi)} e^{-\frac{1}{2 \sigma^{2}}(\log (x-\xi)-\mu)^{2}} 1\{x>\xi\}
$$

is differentiable in quadratic mean with respect to $\theta=(\xi, \mu, \sigma)$.

## 8

## Efficiency of Estimators

> One purpose of asymptotic statistics is to compare the performance of estimators for large sample sizes. This chapter discusses asymptotic lower bounds for estimation in locally asymptotically normal models. These show, among others, in what sense maximum likelihood estimators are asymptotically efficient.

### 8.1 Asymptotic Concentration

Suppose the problem is to estimate $\psi(\theta)$ based on observations from a model governed by the parameter $\theta$. What is the best asymptotic performance of an estimator sequence $T_{n}$ for $\psi(\theta)$ ?

To simplify the situation, we shall in most of this chapter assume that the sequence $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ converges in distribution under every possible value of $\theta$. Next we rephrase the question as: What are the best possible limit distributions? In analogy with the CramérRao theorem a "best" limit distribution is referred to as an asymptotic lower bound. Under certain restrictions the normal distribution with mean zero and covariance the inverse Fisher information is an asymptotic lower bound for estimating $\psi(\theta)=\theta$ in a smooth parametric model. This is the main result of this chapter, but it needs to be qualified.

The notion of a "best" limit distribution is understood in terms of concentration. If the limit distribution is a priori assumed to be normal, then this is usually translated into asymptotic unbiasedness and minimum variance. The statement that $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ converges in distribution to a $N\left(\mu(\theta), \sigma^{2}(\theta)\right)$-distribution can be roughly understood in the sense that eventually $T_{n}$ is approximately normally distributed with mean and variance given by

$$
\psi(\theta)+\frac{\mu(\theta)}{\sqrt{n}} \quad \text { and } \quad \frac{\sigma^{2}(\theta)}{n} .
$$

Because $T_{n}$ is meant to estimate $\psi(\theta)$, optimal choices for the asymptotic mean and variance are $\mu(\theta)=0$ and variance $\sigma^{2}(\theta)$ as small as possible. These choices ensure not only that the asymptotic mean square error is small but also that the limit distribution $N\left(\mu(\theta), \sigma^{2}(\theta)\right)$ is maximally concentrated near zero. For instance, the probability of the interval ( $-a, a$ ) is maximized by choosing $\mu(\theta)=0$ and $\sigma^{2}(\theta)$ minimal.

We do not wish to assume a priori that the estimators are asymptotically normal. That normal limits are best will actually be an interesting conclusion. The concentration of a general limit distribution $L_{\theta}$ cannot be measured by mean and variance alone. Instead, we
can employ a variety of concentration measures, such as

$$
\int x^{2} d L_{\theta}(x) ; \quad \int|x| d L_{\theta}(x) ; \quad \int 1\{|x|>a\} d L_{\theta}(x) ; \quad \int(|x| \wedge a) d L_{\theta}(x)
$$

A limit distribution is "good" if quantities of this type are small. More generally, we focus on minimizing $\int \ell d L_{\theta}$ for a given nonnegative function $\ell$. Such a function is called a loss function and its integral $\int \ell d L_{\theta}$ is the asymptotic risk of the estimator. The method of measuring concentration (or rather lack of concentration) by means of loss functions applies to one- and higher-dimensional parameters alike.

The following example shows that a definition of what constitutes asymptotic optimality is not as straightforward as it might seem.
8.1 Example (Hodges' estimator). Suppose that $T_{n}$ is a sequence of estimators for a real parameter $\theta$ with standard asymptotic behavior in that, for each $\theta$ and certain limit distributions $L_{\theta}$,

$$
\sqrt{n}\left(T_{n}-\theta\right) \stackrel{\theta}{\rightsquigarrow} L_{\theta} .
$$

As a specific example, let $T_{n}$ be the mean of a sample of size $n$ from the $N(\theta, 1)$-distribution. Define a second estimator $S_{n}$ through

$$
S_{n}= \begin{cases}T_{n} & \text { if }\left|T_{n}\right| \geq n^{-1 / 4} \\ 0 & \text { if }\left|T_{n}\right|<n^{-1 / 4}\end{cases}
$$

If the estimator $T_{n}$ is already close to zero, then it is changed to exactly zero; otherwise it is left unchanged. The truncation point $n^{-1 / 4}$ has been chosen in such a way that the limit behavior of $S_{n}$ is the same as that of $T_{n}$ for every $\theta \neq 0$, but for $\theta=0$ there appears to be a great improvement. Indeed, for every $r_{n}$,

$$
\begin{aligned}
r_{n} S_{n} \stackrel{0}{\rightsquigarrow} 0 \\
\sqrt{n}\left(S_{n}-\theta\right) \stackrel{\theta}{\rightsquigarrow} L_{\theta}, \quad \theta \neq 0 .
\end{aligned}
$$

To see this, note first that the probability that $T_{n}$ falls in the interval $\left(\theta-M n^{-1 / 2}, \theta+M n^{-1 / 2}\right)$ converges to $L_{\theta}(-M, M)$ for most $M$ and hence is arbitrarily close to 1 for $M$ and $n$ sufficiently large. For $\theta \neq 0$, the intervals $\left(\theta-M n^{-1 / 2}, \theta+M n^{-1 / 2}\right)$ and $\left(-n^{-1 / 4}, n^{-1 / 4}\right)$ are centered at different places and eventually disjoint. This implies that truncation will rarely occur: $P_{\theta}\left(T_{n}=S_{n}\right) \rightarrow 1$ if $\theta \neq 0$, whence the second assertion. On the other hand the interval ( $-M n^{-1 / 2}, M n^{-1 / 2}$ ) is contained in the interval ( $-n^{-1 / 4}, n^{-1 / 4}$ ) eventually. Hence under $\theta=0$ we have truncation with probability tending to 1 and hence $P_{0}\left(S_{n}=0\right) \rightarrow 1$; this is stronger than the first assertion.

At first sight, $S_{n}$ is an improvement on $T_{n}$. For every $\theta \neq 0$ the estimators behave the same, while for $\theta=0$ the sequence $S_{n}$ has an "arbitrarily fast" rate of convergence. However, this reasoning is a bad use of asymptotics.

Consider the concrete situation that $T_{n}$ is the mean of a sample of size $n$ from the normal $N(\theta, 1)$-distribution. It is well known that $T_{n}=\bar{X}$ is optimal in many ways for every fixed $n$ and hence it ought to be asymptotically optimal also. Figure 8.1 shows why $S_{n}=\bar{X} 1\left\{|\bar{X}| \geq n^{-1 / 4}\right\}$ is no improvement. It shows the graph of the risk function $\theta \mapsto \mathrm{E}_{\theta}\left(S_{n}-\theta\right)^{2}$ for three different values of $n$. These functions are close to 1 on most

![](https://cdn.mathpix.com/cropped/ba7603fa-498d-468b-91dd-53c69123725b-012.jpg?height=3207&width=3496&top_left_y=541&top_left_x=1082)
Figure 8.1. Quadratic risk functions of the Hodges estimator based on the means of samples of size 10 (dashed), 100 (dotted), and 1000 (solid) observations from the $N(\theta, 1)$-distribution.

of the domain but possess peaks close to zero. As $n \rightarrow \infty$, the locations and widths of the peaks converge to zero but their heights to infinity. The conclusion is that $S_{n}$ "buys" its better asymptotic behavior at $\theta=0$ at the expense of erratic behavior close to zero. Because the values of $\theta$ at which $S_{n}$ is bad differ from $n$ to $n$, the erratic behavior is not visible in the pointwise limit distributions under fixed $\theta$. $\square$

### 8.2 Relative Efficiency

In order to choose between two estimator sequences, we compare the concentration of their limit distributions. In the case of normal limit distributions and convergence rate $\sqrt{n}$, the quotient of the asymptotic variances is a good numerical measure of their relative efficiency. This number has an attractive interpretation in terms of the numbers of observations needed to attain the same goal with each of two sequences of estimators.

Let $v \rightarrow \infty$ be a "time" index, and suppose that it is required that, as $v \rightarrow \infty$, our estimator sequence attains mean zero and variance 1 (or $1 / \nu$ ). Assume that an estimator $T_{n}$ based on $n$ observations has the property that, as $n \rightarrow \infty$,

$$
\sqrt{n}\left(T_{n}-\psi(\theta)\right) \stackrel{\theta}{\rightsquigarrow} N\left(0, \sigma^{2}(\theta)\right) .
$$

Then the requirement is to use at time $\nu$ an appropriate number $n_{\nu}$ of observations such that, as $v \rightarrow \infty$,

$$
\sqrt{\nu}\left(T_{n_{\nu}}-\psi(\theta)\right) \stackrel{\theta}{\rightsquigarrow} N(0,1) .
$$

Given two available estimator sequences, let $n_{\nu, 1}$ and $n_{\nu, 2}$ be the numbers of observations
needed to meet the requirement with each of the estimators. Then, if it exists, the limit

$$
\lim _{v \rightarrow \infty} \frac{n_{v, 2}}{n_{v, 1}}
$$

is called the relative efficiency of the estimators. (In general, it depends on the parameter $\theta$.)

Because $\sqrt{\nu}\left(T_{n_{\nu}}-\psi(\theta)\right)$ can be written as $\sqrt{\nu / n_{\nu}} \sqrt{n_{\nu}}\left(T_{n_{\nu}}-\psi(\theta)\right)$, it follows that necessarily $n_{\nu} \rightarrow \infty$, and also that $n_{\nu} / \nu \rightarrow \sigma^{2}(\theta)$. Thus, the relative efficiency of two estimator sequences with asymptotic variances $\sigma_{i}^{2}(\theta)$ is just

$$
\lim _{v \rightarrow \infty} \frac{n_{v, 2} / v}{n_{v, 1} / v}=\frac{\sigma_{2}^{2}(\theta)}{\sigma_{1}^{2}(\theta)}
$$

If the value of this quotient is bigger than 1 , then the second estimator sequence needs proportionally that many observations more than the first to achieve the same (asymptotic) precision.

### 8.3 Lower Bound for Experiments

It is certainly impossible to give a nontrivial lower bound on the limit distribution of a standardized estimator $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ for a single $\theta$. Hodges' example shows that it is not even enough to consider the behavior under every $\theta$, pointwise for all $\theta$. Different values of the parameters must be taken into account simultaneously when taking the limit as $n \rightarrow \infty$. We shall do this by studying the performance of estimators under parameters in a "shrinking" neighborhood of a fixed $\theta$.

We consider parameters $\theta+h / \sqrt{n}$ for $\theta$ fixed and $h$ ranging over $\mathbb{R}^{k}$ and suppose that, for certain limit distributions $L_{\theta, h}$,

$$
\begin{equation*}
\sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right) \stackrel{\theta+h / \sqrt{n}}{w} L_{\theta, h}, \quad \text { every } h . \tag{8.2}
\end{equation*}
$$

Then $T_{n}$ can be considered a good estimator for $\psi(\theta)$ if the limit distributions $L_{\theta, h}$ are maximally concentrated near zero. If they are maximally concentrated for every $h$ and some fixed $\theta$, then $T_{n}$ can be considered locally optimal at $\theta$. Unless specified otherwise, we assume in the remainder of this chapter that the parameter set $\Theta$ is an open subset of $\mathbb{R}^{k}$, and that $\psi$ maps $\Theta$ into $\mathbb{R}^{m}$. The derivative of $\theta \mapsto \psi(\theta)$ is denoted by $\dot{\psi}_{\theta}$.

Suppose that the observations are a sample of size $n$ from a distribution $P_{\theta}$. If $P_{\theta}$ depends smoothly on the parameter, then

$$
\left(P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right) \rightsquigarrow\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{k}\right)
$$

as experiments, in the sense of Theorem 7.10. This theorem shows which limit distributions are possible and can be specialized to the estimation problem in the following way.
8.3 Theorem. Assume that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean (7.1) at the point $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $\psi$ be differentiable at $\theta$. Let $T_{n}$ be estimators in the experiments $\left(P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right)$ such that
(8.2) holds for every $h$. Then there exists a randomized statistic $T$ in the experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{k}\right)$ such that $T-\dot{\psi}_{\theta} h$ has distribution $L_{\theta, h}$ for every $h$.

Proof. Apply Theorem 7.10 to $S_{n}=\sqrt{n}\left(T_{n}-\psi(\theta)\right)$. In view of the definition of $L_{\theta, h}$ and the differentiability of $\psi$, the sequence

$$
S_{n}=\sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right)+\sqrt{n}\left(\psi\left(\theta+\frac{h}{\sqrt{n}}\right)-\psi(\theta)\right)
$$

converges in distribution under $h$ to $L_{\theta, h} * \delta_{\dot{\psi}_{\theta} h}$, where $* \delta_{h}$ denotes a translation by $h$. According to Theorem 7.10, there exists a randomized statistic $T$ in the normal experiment such that $T$ has distribution $L_{\theta, h} * \delta_{\dot{\psi}_{\theta} h}$ for every $h$. This satisfies the requirements.

This theorem shows that for most estimator sequences $T_{n}$ there is a randomized estimator $T$ such that the distribution of $\sqrt{n}\left(T_{n}-\psi(\theta+h / \sqrt{n})\right)$ under $\theta+h / \sqrt{n}$ is, for large $n$, approximately equal to the distribution of $T-\dot{\psi}_{\theta} h$ under $h$. Consequently the standardized distribution of the best possible estimator $T_{n}$ for $\psi(\theta+h / \sqrt{n})$ is approximately equal to the standardized distribution of the best possible estimator $T$ for $\dot{\psi}_{\theta} h$ in the limit experiment. If we know the best estimator $T$ for $\dot{\psi}_{\theta} h$, then we know the "locally best" estimator sequence $T_{n}$ for $\psi(\theta)$.

In this way, the asymptotic optimality problem is reduced to optimality in the experiment based on one observation $X$ from a $N\left(h, I_{\theta}^{-1}\right)$-distribution, in which $\theta$ is known and $h$ ranges over $\mathbb{R}^{k}$. This experiment is simple and easy to analyze. The observation itself is the customary estimator for its expectation $h$, and the natural estimator for $\dot{\psi}_{\theta} h$ is $\dot{\psi}_{\theta} X$. This has several optimality properties: It is minimum variance unbiased, minimax, best equivariant, and Bayes with respect to the noninformative prior. Some of these properties are reviewed in the next section.

Let us agree, at least for the moment, that $\dot{\psi}_{\theta} X$ is a "best" estimator for $\dot{\psi}_{\theta} h$. The distribution of $\dot{\psi}_{\theta} X-\dot{\psi}_{\theta} h$ is normal with zero mean and covariance $\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}$ for every $h$. The parameter $h=0$ in the limit experiment corresponds to the parameter $\theta$ in the original problem. We conclude that the "best" limit distribution of $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ under $\theta$ is the $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-distribution.

This is the main result of the chapter. The remaining sections discuss several ways of making this reasoning more rigorous. Because the expression $\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}$ is precisely the Cramér-Rao lower bound for the covariance of unbiased estimators for $\psi(\theta)$, we can think of the results of this chapter as asymptotic Cramér-Rao bounds. This is helpful, even though it does not do justice to the depth of the present results. For instance, the Cramér-Rao bound in no way suggests that normal limiting distributions are best. Also, it is not completely true that an $N\left(h, I_{\theta}^{-1}\right)$-distribution is "best" (see section 8.8). We shall see exactly to what extent the optimality statement is false.

### 8.4 Estimating Normal Means

According to the preceding section, the asymptotic optimality problem reduces to optimality in a normal location (or "Gaussian shift") experiment. This section has nothing to do with asymptotics but reviews some facts about Gaussian models.

Based on a single observation $X$ from a $N(h, \Sigma)$-distribution, it is required to estimate $A h$ for a given matrix $A$. The covariance matrix $\Sigma$ is assumed known and nonsingular. It is well known that $A X$ is minimum variance unbiased. It will be shown that $A X$ is also best-equivariant and minimax for many loss functions.

A randomized estimator $T$ is called equivariant-in-law for estimating $A h$ if the distribution of $T-A h$ under $h$ does not depend on $h$. An example is the estimator $A X$, whose "invariant law" (the law of $A X-A h$ under $h$ ) is the $N\left(0, A \Sigma A^{T}\right)$-distribution. The following proposition gives an interesting characterization of the law of general equivariant-in-law estimators: These are distributed as the sum of $A X$ and an independent variable.
8.4 Proposition. The null distribution $L$ of any randomized equivariant-in-law estimator of $A h$ can be decomposed as $L=N\left(0, A \Sigma A^{T}\right) * M$ for some probability measure $M$. The only randomized equivariant-in-law estimator for which $M$ is degenerate at 0 is $A X$.

The measure $M$ can be interpreted as the distribution of a noise factor that is added to the estimator $A X$. If no noise is best, then it follows that $A X$ is best equivariant-in-law.

A more precise argument can be made in terms of loss functions. In general, convoluting a measure with another measure decreases its concentration. This is immediately clear in terms of variance: The variance of a sum of two independent variables is the sum of the variances, whence convolution increases variance. For normal measures this extends to all "bowl-shaped" symmetric loss functions. The name should convey the form of their graph. Formally, a function is defined to be bowl-shaped if the sublevel sets $\{x: \ell(x) \leq c\}$ are convex and symmetric about the origin; it is called subconvex if, moreover, these sets are closed. A loss function is any function with values in $[0, \infty)$. The following lemma quantifies the loss in concentration under convolution (for a proof, see, e.g., [80] or [114].)
8.5 Lemma (Anderson's lemma). For anybowl-shaped loss function $\ell$ on $\mathbb{R}^{k}$, every probability measure $M$ on $\mathbb{R}^{k}$, and every covariance matrix $\Sigma$

$$
\int \ell d N(0, \Sigma) \leq \int \ell d[N(0, \Sigma) * M]
$$

Next consider the minimax criterion. According to this criterion the "best" estimator, relative to a given loss function, minimizes the maximum risk

$$
\sup _{h} \mathrm{E}_{h} \ell(T-A h),
$$

over all (randomized) estimators $T$. For every bowl-shaped loss function $\ell$, this leads again to the estimator $A X$.
8.6 Proposition. For any bowl-shaped loss function $\ell$, the maximum risk of any randomized estimator $T$ of $A h$ is bounded below by $\mathrm{E}_{0} \ell(A X)$. Consequently, $A X$ is a minimax estimator for Ah. If $A h$ is real and $\mathrm{E}_{0}(A X)^{2} \ell(A X)<\infty$, then $A X$ is the only minimax estimator for Ah up to changes on sets of probability zero.

Proofs. For a proof of the uniqueness of the minimax estimator, see [18] or [80]. We prove the other assertions for subconvex loss functions, using a Bayesian argument.

Let $H$ be a random vector with a normal $N(0, \Lambda)$-distribution, and consider the original $N(h, \Sigma)$-distribution as the conditional distribution of $X$ given $H=h$. The randomization variable $U$ in $T(X, U)$ is constructed independently of the pair ( $X, H$ ). In this notation, the distribution of the variable $T-A H$ is equal to the "average" of the distributions of $T-A h$ under the different values of $h$ in the original set-up, averaged over $h$ using a $N(0, \Lambda)$-"prior distribution."

By a standard calculation, we find that the "a posteriori" distribution, the distribution of $H$ given $X$, is the normal distribution with mean $\left(\Sigma^{-1}+\Lambda^{-1}\right)^{-1} \Sigma^{-1} X$ and covariance matrix $\left(\Sigma^{-1}+\Lambda^{-1}\right)^{-1}$. Define the random vectors

$$
W_{\Lambda}=T-A\left(\Sigma^{-1}+\Lambda^{-1}\right)^{-1} \Sigma^{-1} X, \quad G_{\Lambda}=-A\left(H-\left(\Sigma^{-1}+\Lambda^{-1}\right)^{-1} \Sigma^{-1} X\right)
$$

These vectors are independent, because $W_{\Lambda}$ is a function of ( $X, U$ ) only, and the conditional distribution of $G_{\Lambda}$ given $X$ is normal with mean 0 and covariance matrix $A\left(\Sigma^{-1}+\right. \left.\Lambda^{-1}\right)^{-1} A^{T}$, independent of $X$. As $\Lambda=\lambda I$ for a scalar $\lambda \rightarrow \infty$, the sequence $G_{\Lambda}$ converges in distribution to a $N\left(0, A \Sigma A^{T}\right)$-distributed vector $G$. The sum of the two vectors yields $T-A H$, for every $\Lambda$.

Because a supremum is larger than an average, we obtain, where on the left we take the expectation with respect to the original model,

$$
\sup _{h} \mathrm{E}_{h} \ell(T-A h) \geq \mathrm{E} \ell(T-A H)=\mathrm{E} \ell\left(G_{\Lambda}+W_{\Lambda}\right) \geq \mathrm{E} \ell\left(G_{\Lambda}\right),
$$

by Anderson's lemma. This is true for every $\Lambda$. The lim inf of the right side as $\Lambda \rightarrow \infty$ is at least $\mathrm{E} \ell(G)$, by the portmanteau lemma. This concludes the proof that $A X$ is minimax.

If $T$ is equivariant-in-law with invariant law $L$, then the distribution of $G_{\Lambda}+W_{\Lambda}= T-A H$ is $L$, for every $\Lambda$. It follows that

$$
\int e^{i t^{T} x} d L(x)=\mathrm{E} e^{i t^{T} G_{\Lambda}} \mathrm{E} e^{i t^{T} W_{\Lambda}}, \quad \text { every } t
$$

As $\Lambda \rightarrow \infty$, the left side remains fixed; the first factor on the right side converges to the characteristic function of $G$, which is positive. Conclude that the characteristic functions of $W_{\Lambda}$ converge to a continuous function, whence $W_{\Lambda}$ converges in distribution to some vector $W$, by Lévy's continuity theorem. By the independence of $G_{\Lambda}$ and $W_{\Lambda}$ for every $\Lambda$, the sequence ( $G_{\Lambda}, W_{\Lambda}$ ) converges in distribution to a pair ( $G, W$ ) of independent vectors with marginal distributions as before. Next, by the continuous-mapping theorem, the distribution of $G_{\Lambda}+W_{\Lambda}$, which is fixed at $L$, "converges" to the distribution of $G+W$. This proves that $L$ can be written as a convolution, as claimed in Proposition 8.4.

If $T$ is an equivariant-in-law estimator and $\tilde{T}(X)=\mathrm{E}(T(X, U) \mid X)$, then

$$
\mathrm{E}_{h}(\tilde{T}-A X)=\mathrm{E}_{h}(T-A X)=\mathrm{E}_{h}(T-A h)-\mathrm{E}_{h}(A X-A h)
$$

is independent of $h$. By the completeness of the normal location family, we conclude that $\tilde{T}-A X$ is constant, almost surely. If $T$ has the same law as $A X$, then the constant is zero. Furthermore, $T$ must be equal to its projection $\tilde{T}$ almost surely, because otherwise it would have a bigger second moment than $\tilde{T}=A X$. Thus $T=A X$ almost surely.

### 8.5 Convolution Theorem

An estimator sequence $T_{n}$ is called regular at $\theta$ for estimating a parameter $\psi(\theta)$ if, for every $h$,

$$
\sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right) \stackrel{\theta+h / \sqrt{n}}{w} L_{\theta} .
$$

The probability measure $L_{\theta}$ may be arbitrary but should be the same for every $h$.
A regular estimator sequence attains its limit distribution in a "locally uniform" manner. This type of regularity is common and is often considered desirable: A small change in the parameter should not change the distribution of the estimator too much; a disappearing small change should not change the (limit) distribution at all. However, some estimator sequences of interest, such as shrinkage estimators, are not regular.

In terms of the limit distributions $L_{\theta, h}$ in (8.2), regularity is exactly that all $L_{\theta, h}$ are equal, for the given $\theta$. According to Theorem 8.3, every estimator sequence is matched by an estimator $T$ in the limit experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{k}\right)$. For a regular estimator sequence this matching estimator has the property

$$
\begin{equation*}
T-\dot{\psi}_{\theta} h \stackrel{h}{\sim} L_{\theta}, \quad \text { every } h . \tag{8.7}
\end{equation*}
$$

Thus a regular estimator sequence is matched by an equivariant-in-law estimator for $\dot{\psi}_{\theta} h$. A more informative name for "regular" is asymptotically equivariant-in-law.

It is now easy to determine a best estimator sequence from among the regular estimator sequences (a best regular sequence): It is the sequence $T_{n}$ that corresponds to the best equivariant-in-law estimator $T$ for $\dot{\psi}_{\theta} h$ in the limit experiment, which is $\dot{\psi}_{\theta} X$ by Proposition 8.4. The best possible limit distribution of a regular estimator sequence is the law of this estimator, a $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-distribution.

The characterization as a convolution of the invariant laws of equivariant-in-law estimators carries over to the asymptotic situation.
8.8 Theorem (Convolution). Assume that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean (7.1) at the point $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $\psi$ be differentiable at $\theta$. Let $T_{n}$ be an at $\theta$ regular estimator sequence in the experiments ( $P_{\theta}^{n}: \theta \in \Theta$ ) with limit distribution $L_{\theta}$. Then there exists a probability measure $M_{\theta}$ such that

$$
L_{\theta}=N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right) * M_{\theta} .
$$

In particular, if $L_{\theta}$ has covariance matrix $\Sigma_{\theta}$, then the matrix $\Sigma_{\theta}-\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}$ is nonnegativedefinite.

Proof. Apply Theorem 8.3 to conclude that $L_{\theta}$ is the distribution of an equivariant-in-law estimator $T$ in the limit experiment, satisfying (8.7). Next apply Proposition 8.4. $\square$

### 8.6 Almost-Everywhere Convolution Theorem

Hodges' example shows that there is no hope for a nontrivial lower bound for the limit distribution of a standardized estimator sequence $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ for every $\theta$. It is always
possible to improve on a given estimator sequence for selected parameters. In this section it is shown that improvement over an $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-distribution can be made on at most a Lebesgue null set of parameters. Thus the possibilities for improvement are very much restricted.
8.9 Theorem. Assume that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean (7.1) at every $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $\psi$ be differentiable at every $\theta$. Let $T_{n}$ be an estimator sequence in the experiments ( $P_{\theta}^{n}: \theta \in \Theta$ ) such that $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ converges to a limit distribution $L_{\theta}$ under every $\theta$. Then there exist probability distributions $M_{\theta}$ such that for Lebesgue almost every $\theta$

$$
L_{\theta}=N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right) * M_{\theta}
$$

In particular, if $L_{\theta}$ has covariance matrix $\Sigma_{\theta}$, then the matrix $\Sigma_{\theta}-\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}$ is nonnegative definite for Lebesgue almost every $\theta$.

The theorem follows from the convolution theorem in the preceding section combined with the following remarkable lemma. Any estimator sequence with limit distributions is automatically regular at almost every $\theta$ along a subsequence of $\{n\}$.
8.10 Lemma. Let $T_{n}$ be estimators in experiments ( $P_{n, \theta}: \theta \in \Theta$ ) indexed by a measurable subset $\Theta$ of $\mathbb{R}^{k}$. Assume that the map $\theta \mapsto P_{n, \theta}(A)$ is measurable for every measurable set $A$ and every $n$, and that the map $\theta \mapsto \psi(\theta)$ is measurable. Suppose that there exist distributions $L_{\theta}$ such that for Lebesgue almost every $\theta$

$$
r_{n}\left(T_{n}-\psi(\theta)\right) \stackrel{\theta}{v} L_{\theta} .
$$

Then for every $\gamma_{n} \rightarrow 0$ there exists a subsequence of $\{n\}$ such that, for Lebesgue almost every $(\theta, h)$, along the subsequence,

$$
r_{n}\left(T_{n}-\psi\left(\theta+\gamma_{n} h\right)\right) \stackrel{\theta+\gamma_{n} h}{\underset{\rightarrow}{ }} L_{\theta} .
$$

Proof. Assume without loss of generality that $\Theta=\mathbb{R}^{k}$; otherwise, fix some $\theta_{0}$ and let $P_{n, \theta}=P_{n, \theta_{0}}$ for every $\theta$ not in $\Theta$. Write $T_{n, \theta}=r_{n}\left(T_{n}-\psi(\theta)\right)$. There exists a countable collection $\mathcal{F}$ of uniformly bounded, left- or right-continuous functions $f$ such that weak convergence of a sequence of maps $T_{n}$ is equivalent to $\mathrm{E} f\left(T_{n}\right) \rightarrow \int f d L$ for every $f \in \mathcal{F} .^{\dagger}$ Suppose that for every $f$ there exists a subsequence of $\{n\}$ along which

$$
\mathrm{E}_{\theta+\gamma_{n} h} f\left(T_{n, \theta+\gamma_{n} h}\right) \rightarrow \int f d L_{\theta}, \quad \lambda^{2 k}-\text { a.e. }(\theta, h)
$$

Even in case the subsequence depends on $f$, we can, by a diagonalization scheme, construct a subsequence for which this is valid for every $f$ in the countable set $\mathcal{F}$. Along this subsequence we have the desired convergence.
${ }^{\dagger}$ For continuous distributions $L$ we can use the indicator functions of cells $(-\infty, c]$ with $c$ ranging over $Q^{k}$. For general $L$ replace every such indicator by an approximating sequence of continuous functions. Alternatively, see, e.g., Theorem 1.12.2 in [146]. Also see Lemma 2.25.

Setting $g_{n}(\theta)=\mathrm{E}_{\theta} f\left(T_{n, \theta}\right)$ and $g(\theta)=\int f d L_{\theta}$, we see that the lemma is proved once we have established the following assertion: Every sequence of bounded, measurable functions $g_{n}$ that converges almost everywhere to a limit $g$, has a subsequence along which

$$
g_{n}\left(\theta+\gamma_{n} h\right) \rightarrow g(\theta), \quad \lambda^{2 k}-\text { a.e. }(\theta, h) .
$$

We may assume without loss of generality that the function $g$ is integrable; otherwise we first multiply each $g_{n}$ and $g$ with a suitable, fixed, positive, continuous function. It should also be verified that, under our conditions, the functions $g_{n}$ are measurable.

Write $p$ for the standard normal density on $\mathbb{R}^{k}$ and $p_{n}$ for the density of the $N\left(0, I+\gamma_{n}^{2} I\right)$ distribution. By Scheffé's lemma, the sequence $p_{n}$ converges to $p$ in $L_{1}$. Let $\Theta$ and $H$ denote independent standard normal vectors. Then, by the triangle inequality and the dominatedconvergence theorem,

$$
\mathrm{E}\left|g_{n}\left(\Theta+\gamma_{n} H\right)-g\left(\Theta+\gamma_{n} H\right)\right|=\int\left|g_{n}(u)-g(u)\right| p_{n}(u) d u \rightarrow 0
$$

Secondly for any fixed continuous and bounded function $g_{\varepsilon}$ the sequence $\mathrm{E} \mid g_{\varepsilon}\left(\Theta+\gamma_{n} H\right)- g_{\varepsilon}(\Theta) \mid$ converges to zero as $n \rightarrow \infty$ by the dominated convergence theorem. Thus, by the triangle inequality, we obtain

$$
\begin{aligned}
\mathrm{E}\left|g\left(\Theta+\gamma_{n} H\right)-g(\Theta)\right| & \leq \int\left|g-g_{\varepsilon}\right|(u)\left(p_{n}+p\right)(u) d u+o(1) \\
& =2 \int\left|g-g_{\varepsilon}\right|(u) p(u) d u+o(1)
\end{aligned}
$$

Because any measurable integrable function $g$ can be approximated arbitrarily closely in $L_{1}$ by continuous functions, the first term on the far right side can be made arbitrarily small by choice of $g_{\varepsilon}$. Thus the left side converges to zero.

By combining this with the preceding display, we see that $\mathrm{E}\left|g_{n}\left(\Theta+\gamma_{n} H\right)-g(\Theta)\right| \rightarrow 0$. In other words, the sequence of functions $(\theta, h) \mapsto g_{n}\left(\theta+\gamma_{n} h\right)-g(\theta)$ converges to zero in mean and hence in probability, under the standard normal measure. There exists a subsequence along which it converges to zero almost surely.

## *8.7 Local Asymptotic Minimax Theorem

The convolution theorems discussed in the preceding sections are not completely satisfying. The convolution theorem designates a best estimator sequence among the regular estimator sequences, and thus imposes an a priori restriction on the set of permitted estimator sequences. The almost-everywhere convolution theorem imposes no (serious) restriction but yields no information about some parameters, albeit a null set of parameters.

This section gives a third attempt to "prove" that the normal $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-distribution is the best possible limit. It is based on the minimax criterion and gives a lower bound for the maximum risk over a small neighborhood of a parameter $\theta$. In fact, it bounds the expression

$$
\lim _{\delta \rightarrow 0} \liminf _{n \rightarrow \infty} \sup _{\left\|\theta^{\prime}-\theta\right\|<\delta} \mathrm{E}_{\theta^{\prime}} \ell\left(\sqrt{n}\left(T_{n}-\psi\left(\theta^{\prime}\right)\right)\right) .
$$

This is the asymptotic maximum risk over an arbitrarily small neighborhood of $\theta$. The following theorem concerns an even more refined (and smaller) version of the local maximum risk.
8.11 Theorem. Let the experiment ( $P_{\theta}: \theta \in \Theta$ ) be differentiable in quadratic mean (7.1) at $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $\psi$ be differentiable at $\theta$. Let $T_{n}$ be any estimator sequence in the experiments ( $P_{\theta}^{n}: \theta \in \mathbb{R}^{k}$ ). Then for any bowl-shaped loss function $\ell$

$$
\sup _{I} \liminf _{n \rightarrow \infty} \sup _{h \in I} \mathrm{E}_{\theta+h / \sqrt{n}} \ell\left(\sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right)\right) \geq \int \ell d N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right) .
$$

Here the first supremum is taken over all finite subsets $I$ of $\mathbb{R}^{k}$.
Proof. We only give the proof under the further assumptions that the sequence $\sqrt{n}\left(T_{n}-\right. \psi(\theta)$ ) is uniformly tight under $\theta$ and that $\ell$ is (lower) semicontinuous. ${ }^{\dagger}$ Then Prohorov's theorem shows that every subsequence of $\{n\}$ has a further subsequence along which the vectors

$$
\left(\sqrt{n}\left(T_{n}-\psi(\theta)\right), \frac{1}{\sqrt{n}} \sum \dot{\ell}_{\theta}\left(X_{i}\right)\right)
$$

converge in distribution to a limit under $\theta$. By Theorem 7.2 and Le Cam's third lemma, the sequence $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ converges in law also under every $\theta+h / \sqrt{n}$ along the subsequence. By differentiability of $\psi$, the same is true for the sequence $\sqrt{n}\left(T_{n}-\psi(\theta+h / \sqrt{n})\right)$, whence (8.2) is satisfied. By Theorem 8.3, the distributions $L_{\theta, h}$ are the distributions of $T-\dot{\psi}_{\theta} h$ under $h$ for a randomized estimator $T$ based on an $N\left(h, I_{\theta}^{-1}\right)$-distributed observation. By Proposition 8.6,

$$
\sup _{h \in \mathbb{R}^{k}} E_{h} \ell\left(T-\dot{\psi}_{\theta} h\right) \geq E_{0} \ell\left(\dot{\psi}_{\theta} X\right)=\int \ell d N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right)
$$

It suffices to show that the left side of this display is a lower bound for the left side of the theorem.

The complicated construction that defines the asymptotic minimax risk (the lim inf sandwiched between two suprema) requires that we apply the preceding argument to a carefully chosen subsequence. Place the rational vectors in an arbitrary order, and let $I_{k}$ consist of the first $k$ vectors in this sequence. Then the left side of the theorem is larger than

$$
R:=\lim _{k \rightarrow \infty} \liminf _{n \rightarrow \infty} \sup _{h \in I_{k}} \mathrm{E}_{\theta+h / \sqrt{n}} \ell\left(\sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right)\right) .
$$

There exists a subsequence $\left\{n_{k}\right\}$ of $\{n\}$ such that this expression is equal to

$$
\lim _{k \rightarrow \infty} \sup _{h \in I_{k}} E_{\theta+h / \sqrt{n_{k}}} \ell\left(\sqrt{n_{k}}\left(T_{n_{k}}-\psi\left(\theta+\frac{h}{\sqrt{n_{k}}}\right)\right)\right) .
$$

We apply the preceding argument to this subsequence and find a further subsequence along which $T_{n}$ satisfies (8.2). For simplicity of notation write this as $\left\{n^{\prime}\right\}$ rather than with a double subscript. Because $\ell$ is nonnegative and lower semicontinuous, the portmanteau lemma gives, for every $h$,

$$
\liminf _{n^{\prime} \rightarrow \infty} E_{\theta+h / \sqrt{n^{\prime}}} \ell\left(\sqrt{n^{\prime}}\left(T_{n^{\prime}}-\psi\left(\theta+\frac{h}{\sqrt{n^{\prime}}}\right)\right)\right) \geq \int \ell d L_{\theta, h}
$$

${ }^{\dagger}$ See, for example, [146, Chapter 3.11] for the general result, which can be proved along the same lines, but using a compactification device to induce tightness.

Every rational vector $h$ is contained in $I_{k}$ for every sufficiently large $k$. Conclude that

$$
R \geq \sup _{h \in \mathbb{Q}^{k}} \int \ell d L_{\theta, h}=\sup _{h \in \mathbb{Q}^{k}} E_{h} \ell\left(T-\dot{\psi}_{\theta} h\right)
$$

The risk function in the supremum on the right is lower semicontinuous in $h$, by the continuity of the Gaussian location family and the lower semicontinuity of $\ell$. Thus the expression on the right does not change if $\mathbb{Q}^{k}$ is replaced by $\mathbb{R}^{k}$. This concludes the proof.

## *8.8 Shrinkage Estimators

The theorems of the preceding sections seem to prove in a variety of ways that the best possible limit distribution is the $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-distribution. At closer inspection, the situation is more complicated, and to a certain extent optimality remains a matter of taste, asymptotic optimality being no exception. The "optimal" normal limit is the distribution of the estimator $\dot{\psi}_{\theta} X$ in the normal limit experiment. Because this estimator has several optimality properties, many statisticians consider it best. Nevertheless, one might prefer a Bayes estimator or a shrinkage estimator. With a changed perception of what constitutes "best" in the limit experiment, the meaning of "asymptotically best" changes also. This becomes particularly clear in the example of shrinkage estimators.
8.12 Example (Shrinkage estimator). Let $X_{1}, \ldots, X_{n}$ be a sample from a multivariate normal distribution with mean $\theta$ and covariance the identity matrix. The dimension $k$ of the observations is assumed to be at least 3 . This is essential! Consider the estimator

$$
T_{n}=\bar{X}_{n}-(k-2) \frac{\bar{X}_{n}}{n\left\|\bar{X}_{n}\right\|^{2}}
$$

Because $\bar{X}_{n}$ converges in probability to the mean $\theta$, the second term in the definition of $T_{n}$ is $O_{P}\left(n^{-1}\right)$ if $\theta \neq 0$. In that case $\sqrt{n}\left(T_{n}-\bar{X}_{n}\right)$ converges in probability to zero, whence the estimator sequence $T_{n}$ is regular at every $\theta \neq 0$. For $\theta=h / \sqrt{n}$, the variable $\sqrt{n} \bar{X}_{n}$ is distributed as a variable $X$ with an $N(h, I)$-distribution, and for every $n$ the standardized estimator $\sqrt{n}\left(T_{n}-h / \sqrt{n}\right)$ is distributed as $T-h$ for

$$
T(X)=X-(k-2) \frac{X}{\|X\|^{2}}
$$

This is the Stein shrinkage estimator. Because the distribution of $T-h$ depends on $h$, the sequence $T_{n}$ is not regular at $\theta=0$. The Stein estimator has the remarkable property that, for every $h$ (see, e.g., [99, p. 300]),

$$
E_{h}\|T-h\|^{2}<\mathrm{E}_{h}\|X-h\|^{2}=k
$$

It follows that, in terms of joint quadratic loss $\ell(x)=\|x\|^{2}$, the local limit distributions $L_{0, h}$ of the sequence $\sqrt{n}\left(T_{n}-h / \sqrt{n}\right)$ under $\theta=h / \sqrt{n}$ are all better than the $N(0, I)$-limit distribution of the best regular estimator sequence $\bar{X}_{n}$.

The example of shrinkage estimators shows that, depending on the optimality criterion, a normal $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-limit distribution need not be optimal. In this light, is it reasonable
to uphold that maximum likelihood estimators are asymptotically optimal? Perhaps not. On the other hand, the possibility of improvement over the $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-limit is restricted in two important ways.

First, improvement can be made only on a null set of parameters by Theorem 8.9. Second, improvement is possible only for special loss functions, and improvement for one loss function necessarily implies worse performance for other loss functions. This follows from the next lemma.

Suppose that we require the estimator sequence to be locally asymptotically minimax for a given loss function $\ell$ in the sense that

$$
\sup _{I} \limsup _{n \rightarrow \infty} \sup _{h \in I} E_{\theta+h / \sqrt{n}} \ell\left(\sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right)\right) \leq \int \ell d N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right) .
$$

This is a reasonable requirement, and few statisticians would challenge it. The following lemma shows that for one-dimensional parameters $\psi(\theta)$ local asymptotic minimaxity for even a single loss function implies regularity. Thus, if it is required that all coordinates of a certain estimator sequence be locally asymptotically minimax for some loss function, then the best regular estimator sequence is optimal without competition.
8.13 Lemma. Assume that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean (7.1) at $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $\psi$ be a real-valued map that is differentiable at $\theta$. Then an estimator sequence in the experiments $\left(P_{\theta}^{n}: \theta \in \mathbb{R}^{k}\right)$ can be locally asymptotically minimax at $\theta$ for a bowl-shaped loss function $\ell$ such that $0<\int x^{2} \ell(x) d N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)(x)<\infty$ only if $T_{n}$ is best regular at $\theta$.

Proof. We only give the proof under the further assumption that the sequence $\sqrt{n}\left(T_{n}-\right. \psi(\theta)$ ) is uniformly tight under $\theta$. Then by the same arguments as in the proof of Theorem 8.11, every subsequence of $\{n\}$ has a further subsequence along which the sequence $\sqrt{n}\left(T_{n}-\psi(\theta+h / \sqrt{n})\right)$ converges in distribution under $\theta+h / \sqrt{n}$ to the distribution $L_{\theta, h}$ of $T-\dot{\psi}_{\theta} h$ under $h$, for a randomized estimator $T$ based on an $N\left(h, I_{\theta}^{-1}\right)$-distributed observation. Because $T_{n}$ is locally asymptotically minimax, it follows that

$$
\sup _{h \in \mathbb{R}^{k}} E_{h} \ell\left(T-\dot{\psi}_{\theta} h\right)=\sup _{h \in \mathbb{R}^{k}} \int \ell d L_{\theta, h} \leq \int \ell d N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right)
$$

Thus $T$ is a minimax estimator for $\dot{\psi}_{\theta} h$ in the limit experiment. By Proposition 8.6, $T=\dot{\psi}_{\theta} X$, whence $L_{\theta, h}$ is independent of $h$.

## *8.9 Achieving the Bound

If the convolution theorem is taken as the basis for asymptotic optimality, then an estimator sequence is best if it is asymptotically regular with a $N\left(0, \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}\right)$-limit distribution. An estimator sequence has this property if and only if the estimator is asymptotically linear in the score function.
8.14 Lemma. Assume that the experiment ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean (7.1) at $\theta$ with nonsingular Fisher information matrix $I_{\theta}$. Let $\psi$ be differentiable at
$\theta$. Let $T_{n}$ be an estimator sequence in the experiments $\left(P_{\theta}^{n}: \theta \in \mathbb{R}^{k}\right)$ such that

$$
\sqrt{n}\left(T_{n}-\psi(\theta)\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\ell}_{\theta}\left(X_{i}\right)+o_{P_{\theta}}(1)
$$

Then $T_{n}$ is best regular estimator for $\psi(\theta)$ at $\theta$. Conversely, every best regular estimator sequence satisfies this expansion.

Proof. The sequence $\Delta_{n, \theta}=n^{-1 / 2} \sum \dot{\ell}_{\theta}\left(X_{i}\right)$ converges in distribution to a vector $\Delta_{\theta}$ with a $N\left(0, I_{\theta}\right)$-distribution. By Theorem 7.2 the sequence $\log d P_{\theta+h / \sqrt{n}}^{n} / d P_{\theta}^{n}$ is asymptotically equivalent to $h^{T} \Delta_{n, \theta}-\frac{1}{2} h^{T} I_{\theta} h$. If $T_{n}$ is asymptotically linear, then $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ is asymptotically equivalent to the function $\dot{\psi}_{\theta} I_{\theta}^{-1} \Delta_{n, \theta}$. Apply Slutsky's lemma to find that

$$
\begin{aligned}
\left(\sqrt{n}\left(T_{n}-\psi(\theta)\right), \log \frac{d P_{\theta+h / \sqrt{n}}}{d P_{\theta}^{n}}\right) & \stackrel{\theta}{\rightsquigarrow}\left(\dot{\psi}_{\theta} I_{\theta}^{-1} \Delta_{\theta}, h^{T} \Delta_{\theta}-\frac{1}{2} h^{T} I_{\theta} h\right) \\
& \sim N\left(\binom{0}{-\frac{1}{2} h^{T} I_{\theta} h}\left(\begin{array}{cc}
\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}^{T} & \dot{\psi}_{\theta} h \\
\dot{\psi}_{\theta} h^{T} & h^{T} I_{\theta} h
\end{array}\right)\right)
\end{aligned}
$$

The limit distribution of the sequence $\sqrt{n}\left(T_{n}-\psi(\theta)\right)$ under $\theta+h / \sqrt{n}$ follows by Le Cam's third lemma, Example 6.7, and is normal with mean $\dot{\psi}_{\theta} h$ and covariance matrix $\dot{\psi}_{\theta} I_{\theta}^{-1} \dot{\psi}_{\theta}{ }^{T}$. Combining this with the differentiability of $\psi$, we obtain that $T_{n}$ is regular.

Next suppose that $S_{n}$ and $T_{n}$ are both best regular estimator sequences. By the same arguments as in the proof of Theorem 8.11 it can be shown that, at least along subsequences, the joint estimators $\left(S_{n}, T_{n}\right)$ for $(\psi(\theta), \psi(\theta))$ satisfy for every $h$

$$
\left(\sqrt{n}\left(S_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right), \sqrt{n}\left(T_{n}-\psi\left(\theta+\frac{h}{\sqrt{n}}\right)\right)\right) \stackrel{\theta+h / \sqrt{n}}{w}\left(S-\dot{\psi}_{\theta} h, T-\dot{\psi}_{\theta} h\right)
$$

for a randomized estimator ( $S, T$ ) in the normal-limit experiment. Because $S_{n}$ and $T_{n}$ are best regular, the estimators $S$ and $T$ are best equivariant-in-law. Thus $S=T=\dot{\psi}_{\theta} X$ almost surely by Proposition 8.6, whence $\sqrt{n}\left(S_{n}-T_{n}\right)$ converges in distribution to $S-T=0$.

Thus every two best regular estimator sequences are asymptotically equivalent. The second assertion of the lemma follows on applying this to $T_{n}$ and the estimators

$$
S_{n}=\psi(\theta)+\frac{1}{\sqrt{n}} \dot{\psi}_{\theta} I_{\theta}^{-1} \Delta_{n, \theta}
$$

Because the parameter $\theta$ is known in the local experiments $\left(P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right)$, this indeed defines an estimator sequence within the present context. It is best regular by the first part of the lemma.

Under regularity conditions, for instance those of Theorem 5.39, the maximum likelihood estimator $\hat{\theta}_{n}$ in a parametric model satisfies

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} I_{\theta}^{-1} \dot{\ell}_{\theta}\left(X_{i}\right)+o_{P_{\theta}}(1)
$$

Then the maximum likelihood estimator is asymptotically optimal for estimating $\theta$ in terms of the convolution theorem. By the delta method, the estimator $\psi\left(\hat{\theta}_{n}\right)$ for $\psi(\theta)$ can be seen
to be asymptotically linear as in the preceding theorem, so that it is asymptotically regular and optimal as well.

Actually, regular and asymptotically optimal estimators for $\theta$ exist in every parametric model ( $P_{\theta}: \theta \in \Theta$ ) that is differentiable in quadratic mean with nonsingular Fisher information throughout $\Theta$, provided the parameter $\theta$ is identifiable. This can be shown using the discretized one-step method discussed in section 5.7 (see [93]).

## *8.10 Large Deviations

Consistency of an estimator sequence $T_{n}$ entails that the probability of the event $d\left(T_{n}, \psi(\theta)\right)>\varepsilon$ tends to zero under $\theta$, for every $\varepsilon>0$. This is a very weak requirement. One method to strengthen it is to make $\varepsilon$ dependent on $n$ and to require that the probabilities $\mathrm{P}_{\theta}\left(d\left(T_{n}, \psi(\theta)\right)>\varepsilon_{n}\right)$ converge to 0 , or are bounded away from 1 , for a given sequence $\varepsilon_{n} \rightarrow 0$. The results of the preceding sections address this question and give very precise lower bounds for these probabilities using an "optimal" rate $\varepsilon_{n}=r_{n}^{-1}$, typically $n^{-1 / 2}$.

Another method of strengthening the consistency is to study the speed at which the probabilities $\mathrm{P}_{\theta}\left(d\left(T_{n}, \psi(\theta)\right)>\varepsilon\right)$ converge to 0 for a fixed $\varepsilon>0$. This method appears to be of less importance but is of some interest. Typically, the speed of convergence is exponential, and there is a precise lower bound for the exponential rate in terms of the Kullback-Leibler information.

We consider the situation that $T_{n}$ is based on a random sample of size $n$ from a distribution $P_{\theta}$, indexed by a parameter $\theta$ ranging over an arbitrary set $\Theta$. We wish to estimate the value of a function $\psi: \Theta \mapsto \mathbb{D}$ that takes its values in a metric space.
8.15 Theorem. Suppose that the estimator sequence $T_{n}$ is consistent for $\psi(\theta)$ under every $\theta$. Then, for every $\varepsilon>0$ and every $\theta_{0}$,

$$
\limsup _{n \rightarrow \infty}-\frac{1}{n} \log P_{\theta_{0}}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon\right) \leq \inf _{\theta: d\left(\psi(\theta), \psi\left(\theta_{0}\right)\right)>\varepsilon}-P_{\theta} \log \frac{p_{\theta_{0}}}{p_{\theta}} .
$$

Proof. If the right side is infinite, then there is nothing to prove. The Kullback-Leibler information $-P_{\theta} \log p_{\theta_{0}} / p_{\theta}$ can be finite only if $P_{\theta} \ll P_{\theta_{0}}$. Hence, it suffices to prove that $-P_{\theta} \log p_{\theta_{0}} / p_{\theta}$ is an upper bound for the left side for every $\theta$ such that $P_{\theta} \ll P_{\theta_{0}}$ and $d\left(\psi(\theta), \psi\left(\theta_{0}\right)\right)>\varepsilon$. The variable $\Lambda_{n}=\left(n^{-1}\right) \sum_{i=1}^{n} \log \left(p_{\theta} / p_{\theta_{0}}\right)\left(X_{i}\right)$ is well defined (possibly $-\infty$ ). For every constant $M$,

$$
\begin{aligned}
P_{\theta_{0}}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon\right) & \geq P_{\theta_{0}}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon, \Lambda_{n}<M\right) \\
& \geq E_{\theta} 1\left\{d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon, \Lambda_{n}<M\right\} e^{-n \Lambda_{n}} \\
& \geq e^{-n M} P_{\theta}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon, \Lambda_{n}<M\right)
\end{aligned}
$$

Take logarithms and multiply by $-(1 / n)$ to conclude that

$$
-\frac{1}{n} \log P_{\theta_{0}}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon\right) \leq M-\frac{1}{n} \log P_{\theta}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon, \Lambda_{n}<M\right) .
$$

For $M>P_{\theta} \log p_{\theta} / p_{\theta_{0}}$, we have that $P_{\theta}\left(\Lambda_{n}<M\right) \rightarrow 1$ by the law of large numbers. Furthermore, by the consistency of $T_{n}$ for $\psi(\theta)$, the probability $P_{\theta}\left(d\left(T_{n}, \psi\left(\theta_{0}\right)\right)>\varepsilon\right)$
converges to 1 for every $\theta$ such that $d\left(\psi(\theta), \psi\left(\theta_{0}\right)\right)>\varepsilon$. Conclude that the probability in the right side of the preceding display converges to 1 , whence the lim sup of the left side is bounded by $M$.

## Notes

Chapter 32 of the famous book by Cramér [27] gives a rigorous proof of what we now know as the Cramér-Rao inequality and next goes on to define the asymptotic efficiency of an estimator as the quotient of the inverse Fisher information and the asymptotic variance. Cramér defines an estimator as asymptotically efficient if its efficiency (the quotient mentioned previously) equals one. These definitions lead to the conclusion that the method of maximum likelihood produces asymptotically efficient estimators, as already conjectured by Fisher [48,50] in the 1920s. That there is a conceptual hole in the definitions was clearly realized in 1951 when Hodges produced his example of a superefficient estimator. Not long after this, in 1953, Le Cam proved that superefficiency can occur only on a Lebesgue null set. Our present result, almost without regularity conditions, is based on later work by Le Cam (see [95].) The asymptotic convolution and minimax theorems were obtained in the present form by Hájek in [69] and [70] after initial work by many authors. Our present proofs follow the approach based on limit experiments, initiated by Le Cam in [95].

## PROBLEMS

1. Calculate the asymptotic relative efficiency of the sample mean and the sample median for estimating $\theta$, based on a sample of size $n$ from the normal $N(\theta, 1)$ distribution.
2. As the previous problem, but now for the Laplace distribution (density $p(x)=\frac{1}{2} e^{-|x|}$ ).
3. Consider estimating the distribution function $\mathrm{P}(X \leq x)$ at a fixed point $x$ based on a sample $X_{1}, \ldots, X_{n}$ from the distribution of $X$. The "nonparametric" estimator is $n^{-1} \#\left(X_{i} \leq x\right)$. If it is known that the true underlying distribution is normal $N(\theta, 1)$, another possible estimator is $\Phi(x-\bar{X})$. Calculate the relative efficiency of these estimators.
4. Calculate the relative efficiency of the empirical $p$-quantile and the estimator $\Phi^{-1}(p) S_{n}+\bar{X}_{n}$ for the estimating the $p$-th quantile of the distribution of a sample from the normal $N\left(\mu, \sigma^{2}\right)$ distribution.
5. Consider estimating the population variance by either the sample variance $S^{2}$ (which is unbiased) or else $n^{-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2}=(n-1) / n S^{2}$. Calculate the asymptotic relative efficiency.
6. Calculate the asymptotic relative efficiency of the sample standard deviation and the interquartile range (corrected for unbiasedness) for estimating the standard deviation based on a sample of size $n$ from the normal $N\left(\mu, \sigma^{2}\right)$-distribution.
7. Given a sample of size $n$ from the uniform distribution on $[0, \theta]$, the maximum $X_{(n)}$ of the observations is biased downwards. Because $\mathrm{E}_{\theta}\left(\theta-X_{(n)}\right)=\mathrm{E}_{\theta} X_{(1)}$, the bias can be removed by adding the minimum of the observations. Is $X_{(1)}+X_{(n)}$ a good estimator for $\theta$ from an asymptotic point of view?
8. Consider the Hodges estimator $S_{n}$ based on the mean of a sample from the $N(\theta, 1)$-distribution.
(i) Show that $\sqrt{n}\left(S_{n}-\theta_{n}\right) \stackrel{\theta_{n}}{\sim}-\infty$, if $\theta_{n} \rightarrow 0$ in such a way that $n^{1 / 4} \theta_{n} \rightarrow 0$ and $n^{1 / 2} \theta_{n} \rightarrow \infty$.
(ii) Show that $S_{n}$ is not regular at $\theta=0$.
(iii) Show that $\sup _{-\delta<\theta<\delta} \mathrm{P}_{\theta}\left(\sqrt{n}\left|S_{n}-\theta\right|>k_{n}\right) \rightarrow 1$ for every $k_{n}$ that converges to infinity sufficiently slowly.
9. Show that a loss function $\ell: \mathbb{R} \mapsto \mathbb{R}$ is bowl-shaped if and only if it has the form $\ell(x)=\ell_{0}(|x|)$ for a nondecreasing function $\ell_{0}$.
10. Show that a function of the form $\ell(x)=\ell_{0}(\|x\|)$ for a nondecreasing function $\ell_{0}$ is bowl-shaped.
11. Prove Anderson's lemma for the one-dimensional case, for instance by calculating the derivative of $\int \ell(x+h) d N(0,1)(x)$. Does the proof generalize to higher dimensions?
12. What does Lemma 8.13 imply about the coordinates of the Stein estimator. Are they good estimators of the coordinates of the expectaction vector?
13. All results in this chapter extend in a straightforward manner to general locally asymptotically normal models. Formulate Theorem 8.9 and Lemma 8.14 for such models.

## 9

## Limits of Experiments

> A sequence of experiments is defined to converge to a limit experiment if the sequence of likelihood ratio processes converges marginally in distribution to the likelihood ratio process of the limit experiment. A limit experiment serves as an approximation for the converging sequence of experiments. This generalizes the convergence of locally asymptotically normal sequences of experiments considered in Chapter 7. Several examples of nonnormal limit experiments are discussed.

### 9.1 Introduction

This chapter introduces a notion of convergence of statistical models or "experiments" to a limit experiment. In this notion a sequence of models, rather than just a sequence of estimators or tests, converges to a limit. The limit experiment serves two purposes. First, it provides an absolute standard for what can be achieved asymptotically by a sequence of tests or estimators, in the form of a "lower bound": No sequence of statistical procedures can be asymptotically better than the "best" procedure in the limit experiment. For instance, the best limiting power function is the best power function in the limit experiment; a best sequence of estimators converges to a best estimator in the limit experiment. Statements of this type are true irrespective of the precise meaning of "best." A second purpose of a limit experiment is to explain the asymptotic behaviour of sequences of statistical procedures. For instance, the asymptotic normality or (in)efficiency of maximum likelihood estimators.

Many sequences of experiments converge to normal limit experiments. In particular, the local experiments in a given locally asymptotically normal sequence of experiments, as considered in Chapter 7, converge to a normal location experiment. The asymptotic representation theorem given in the present chapter is therefore a generalization of Theorem 7.10 (for the LAN case) to the general situation. The importance of the general concept is illustrated by several examples of non-Gaussian limit experiments.

In the present context it is customary to speak of "experiment" rather than model, although these terms are interchangeable. Formally an experiment is a measurable space $(\mathcal{X}, \mathcal{A})$, the sample space, equipped with a collection of probability measures $\left(P_{h}: h \in H\right)$. The set of probability measures serves as a statistical model for the observation, written as $X$. In this chapter the parameter is denoted by $h$ (and not $\theta$ ), because the results are typically applied to "local" parameters (such as $h=\sqrt{n}\left(\theta-\theta_{0}\right)$ ). The experiment is denoted
by ( $\mathcal{X}, \mathcal{A}, P_{h}: h \in H$ ) and, if there can be no misunderstanding about the sample space, also by $\left(P_{h}: h \in H\right)$.

Given a fixed parameter $h_{0} \in H$, the likelihood ratio process with base $h_{0}$ is formed as

$$
\left(\frac{d P_{h}}{d P_{h_{0}}}(X)\right)_{h \in H} \equiv\left(\frac{p_{h}}{p_{h_{0}}}(X)\right)_{h \in H}
$$

Each likelihood ratio process is a (typically infinite-dimensional) vector of random variables $d P_{h} / d P_{h_{0}}(X)$. According to the results of section 6.1, the right side of the display is $P_{h_{0}}$ almost surely the same for any given densities $p_{h}$ and $p_{h_{0}}$ with respect to any measure $\mu$. Because we are interested only in the laws under $P_{h_{0}}$ of finite subvectors of the likelihood processes, the nonuniqueness is best left unresolved.
9.1 Definition. A sequence $\mathcal{E}_{n}=\left(\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, h}: h \in H\right)$ of experiments converges to a limit experiment $\mathcal{E}=\left(\mathcal{X}, \mathcal{A}, P_{h}: h \in H\right)$ if, for every finite subset $I \subset H$ and every $h_{0} \in H$,

$$
\left(\frac{d P_{n, h}}{d P_{n, h_{0}}}\left(X_{n}\right)\right)_{h \in I} \stackrel{h_{0}}{\grave{m}}\left(\frac{d P_{h}}{d P_{h_{0}}}(X)\right)_{h \in I} .
$$

The objects in this display are random vectors of length $|I|$. The requirement is that each of these vectors converges in law, under the assumption that $h_{0}$ is the true parameter, in the ordinary sense of convergence in distribution in $\mathbb{R}^{I}$. This type of convergence is sometimes called marginal weak convergence: The finite-dimensional marginal distributions of the likelihood processes converge in distribution to the corresponding marginals in the limit experiment.

Because a weak limit of a sequence of random vectors is unique, the marginal distributions of the likelihood ratio process of a limit experiment are unique. The limit experiment itself is not unique; even its sample space is not uniquely determined. This causes no problems. Two experiments of which the likelihood ratio processes are equal in marginal distributions are called equivalent or of the same type. Many examples of equivalent experiments arise through sufficiency.
9.2 Example (Equivalence by sufficiency). Let $S: \mathcal{X} \mapsto \mathcal{Y}$ be a statistic in the statistical experiment $\left(\mathcal{X}, \mathcal{A}, P_{h}: h \in H\right)$ with values in the measurable space $(\mathcal{Y}, \mathcal{B})$. The experiment of image laws ( $\mathcal{Y}, \mathcal{B}, P_{h} \circ S^{-1}: h \in H$ ) corresponds to observing $S$. If $S$ is a sufficient statistic, then this experiment is equivalent to the original experiment ( $\mathcal{X}, \mathcal{A}, P_{h}: h \in H$ ). This may be proved using the Neyman factorization criterion of sufficiency. This shows that there exist measurable functions $g_{h}$ and $f$ such that $p_{h}(x)=g_{h}(S(x)) f(x)$, so that the likelihood ratio $p_{h} / p_{h_{0}}(X)$ is the function $g_{h} / g_{h_{0}}(S)$ of $S$. The likelihood ratios of the measures $P_{h} \circ S^{-1}$ take the same form.

Consequently, if ( $P_{h}: h \in H$ ) is a limit experiment, then so is ( $P_{h} \circ S^{-1}: h \in H$ ). A very simple example that we encounter frequently is as follows: For a given invertible matrix $J$ the experiments $\left(N(J h, J): h \in \mathbb{R}^{d}\right)$ and $\left(N\left(h, J^{-1}\right): h \in \mathbb{R}^{d}\right)$ are equivalent.

### 9.2 Asymptotic Representation Theorem

In this section it is shown that a limit experiment is always statistically easier than a given sequence. Suppose that a sequence of statistical problems involves experiments
$\mathcal{E}_{n}=\left(P_{n, h}: h \in H\right)$ and statistics $T_{n}$. For instance, the statistics are test statistics for testing certain hypotheses concerning the parameter $h$, or estimators of some function of $h$. Most of the quality measures of the procedures based on the statistics $T_{n}$ can be expressed in their laws under the different parameters. For simplicity we assume that the sequence of statistics $T_{n}$ converges under a given parameter $h$ in distribution to a limit $L_{h}$, for every parameter $h$. Then the asymptotic quality of the sequence $T_{n}$ may be judged from the set of limit laws $\left\{L_{h}: h \in H\right\}$. According to the following theorem the only possible sets of limit laws are the laws of randomized statistics in the limit experiment: Every weakly converging sequence of statistics converges to a statistic in the limit experiment. One consequence is that asymptotically no sequence of statistical procedures can be better than the best procedure in the limit experiment. This is true for every meaning of "good" that is expressible in terms of laws. In this way the limit experiment obtains the character of an asymptotic lower bound.

We assume that the limit experiment $\mathcal{E}=\left(P_{h}: h \in H\right)$ is dominated: This requires the existence of a $\sigma$-finite measure $\mu$ such that $P_{h} \ll \mu$ for every $h$. Recall that a randomized statistic $T$ in the experiment ( $\mathcal{X}, \mathcal{A}, P_{h}: h \in H$ ) with values in $\mathbb{R}^{k}$ is a measurable map $T: \mathcal{X} \times[0,1] \mapsto \mathbb{R}^{k}$ for the product $\sigma$-field $\mathcal{A} \times$ Borel sets on the space $\mathcal{X} \times[0,1]$. Its law under $h$ is to be computed under the product measure $P_{h} \times$ uniform $[0,1]$.
9.3 Theorem. Let $\mathcal{E}_{n}=\left(\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, h}: h \in H\right)$ be a sequence of experiments that converges to a dominated experiment $\mathcal{E}=\left(\mathcal{X}, \mathcal{A}, P_{h}: h \in H\right)$. Let $T_{n}$ be a sequence of statistics in $\mathcal{E}_{n}$ that converges in distribution for every $h$. Then there exists a randomized statistic $T$ in $\mathcal{E}$ such that $T_{n} \stackrel{h}{\leadsto} T$ for every $h$.

Proof. The proof of the theorem starting from the definition of convergence of experiments is long and can best be broken up into parts of independent interest. This goes beyond the scope of this book.

The proof for the case of local asymptotic normal sequences of experiments is given in Chapter 7. (It is shown in Theorem 9.4 that such a sequence of experiments converges to a Gaussian location experiment.) Many other examples can be treated by the same method of proof. ${ }^{\dagger}$

### 9.3 Asymptotic Normality

As in much of statistics, normal limits are of prime importance. In Chapter 7 a sequence of statistical models ( $P_{n, \theta}: \theta \in \Theta$ ) indexed by an open subset $\Theta \subset \mathbb{R}^{d}$ is defined to be locally asymptotically normal at $\theta$ if the $\log$ likelihood ratios $\log d P_{n, \theta+r_{n}^{-1} h_{n}} / d P_{n, \theta}$ allow a certain quadratic expansion. This is shown to be valid in the case that $P_{n, \theta}$ is the distribution of a sample of size $n$ from a smooth parametric model. Such experiments converge to simple normal limit experiments if they are reparametrized in terms of the "local parameter" $h$. This follows from the following theorem.
9.4 Theorem. Let $\mathcal{E}_{n}=\left(P_{n, h}: h \in H\right)$ be a sequence of experiments indexed by a subset $H$ of $\mathbb{R}^{d}$ (with $0 \in H$ ) such that

$$
\log \frac{d P_{n, h}}{d P_{n, 0}}=h^{T} \Delta_{n}-\frac{1}{2} h^{T} J h+o_{P_{n, 0}}(1),
$$

[^3]for a sequence of statistics $\Delta_{n}$ that converges weakly under $h=0$ to a $N(0, J)$-distribution. Then the sequence $\mathcal{E}_{n}$ converges to the experiment $(N(J h, J): h \in H)$.

Proof. The log likelihood ratio process with base $h_{0}$ for the normal experiment has coordinates

$$
\log \frac{d N(J h, J)}{d N\left(J h_{0}, J\right)}(X)=\left(h-h_{0}\right)^{T} X-\frac{1}{2} h^{T} J h+\frac{1}{2} h_{0}^{T} J h_{0} .
$$

If $J$ is nonsingular, then this follows by simple algebra, because the left side is the quotient of two normal densities. The case that $J$ is singular perhaps requires some thought.

By the assumption combined with Slutsky's lemma, the sequence $\log p_{n, h} / p_{n, 0}$ is under $h=0$ asymptotically normal with mean $-\frac{1}{2} h^{T} J h$ and variance $h^{T} J h$ ). This implies contiguity of the sequences of measures $P_{n, h}$ and $P_{n, 0}$ for every $h$, by Example 6.5. Therefore, the probability of the set on which one of $p_{n, 0}, p_{n, h}$, or $p_{n, h_{0}}$ is zero converges to zero. Outside this set we can write

$$
\log \frac{p_{n, h}}{p_{n, h_{0}}}=\log \frac{p_{n, h}}{p_{n, 0}}-\log \frac{p_{n, h_{0}}}{p_{n, 0}}
$$

Because this is true with probability tending to 1 , the difference between the left and the right sides converges to zero in probability. Apply the (local) asymptotic normality assumption twice to obtain that

$$
\log \frac{p_{n, h}}{p_{n, h_{0}}}=\left(h-h_{0}\right)^{T} \Delta_{n}-\frac{1}{2} h^{T} J h+\frac{1}{2} h_{0}^{T} J h_{0}+o_{P_{n, h_{0}}}(1) .
$$

On comparing this to the expression for the normal likelihood ratio process, we see that it suffices to show that the sequence $\Delta_{n}$ converges under $h_{0}$ in law to $X$ : In that case the vector $\left(p_{n, h} / p_{n, h_{0}}\right)_{h \in I}$ converges in distribution to $(d N(J h, J) / d N(0, J)(X))_{h \in I}$, by Slutsky's lemma and the continuous-mapping theorem.

By assumption, the sequence ( $\Delta_{n}, h_{0}^{T} \Delta_{n}$ ) converges in distribution under $h=0$ to a vector $\left(\Delta, h_{0}^{T} \Delta\right)$, where $\Delta$ is $N(0, J)$-distributed. By local asymptotic normality and Slutsky's lemma, the sequence of vectors $\left(\Delta_{n}, \log p_{n, h_{0}} / p_{n, 0}\right)$ converges to the vector ( $\Delta, h_{0}^{T} \Delta-\frac{1}{2} h_{0}^{T} J h_{0}$ ). In other words

$$
\left(\Delta_{n}, \log \frac{p_{n, h_{0}}}{p_{n, 0}}\right) \stackrel{0}{\rightsquigarrow} N\left(\binom{0}{-\frac{1}{2} h_{0}^{T} J h_{0}},\left(\begin{array}{cc}
J & J h_{0} \\
h_{0}^{T} J & h_{0}^{T} J h_{0}
\end{array}\right)\right) .
$$

By the Gaussian form of Le Cam's third lemma, Example 6.5, the sequence $\Delta_{n}$ converges in distribution under $h_{0}$ to a $N\left(J h_{0}, J\right)$-distribution. This is equal to the distribution of $X$ under $h_{0}$.
9.5 Corollary. Let $\Theta$ be an open subset of $\mathbb{R}^{d}$, and let the sequence of statistical models ( $P_{n, \theta}: \theta \in \Theta$ ) be locally asymptotically normal at $\theta$ with norming matrices $r_{n}$ and a nonsingular matrix $I_{\theta}$. Then the sequence of experiments ( $P_{n, \theta+r_{n}^{-1} h}: h \in \mathbb{R}^{d}$ ) converges to the experiment $\left(N\left(h, I_{\theta}^{-1}\right): h \in \mathbb{R}^{d}\right)$.

### 9.4 Uniform Distribution

The model consisting of the uniform distributions on $[0, \theta]$ is not differentiable in quadratic mean (see Example 7.9.) In this case an asymptotically normal approximation is impossible. Instead, we have convergence to an exponential experiment.
9.6 Theorem. Let $P_{\theta}^{n}$ be the distribution of a random sample of size $n$ from a uniform distribution on $[0, \theta]$. Then the sequence of experiments ( $P_{\theta-h / n}^{n}: h \in \mathbb{R}$ ) converges for each fixed $\theta>0$ to the experiment consisting of observing one observation from the shifted exponential density $z \mapsto e^{-(z-h) / \theta} 1\{z>h\} / \theta .^{\dagger}$

Proof. If $Z$ is distributed according to the given exponential density, then

$$
\frac{d P_{h}^{Z}}{d P_{h_{0}}^{Z}}(Z)=\frac{e^{-(Z-h) / \theta} 1\{Z>h\} / \theta}{e^{-\left(Z-h_{0}\right) / \theta} 1\left\{Z>h_{0}\right\} / \theta}=e^{\left(h-h_{0}\right) / \theta} 1\{Z>h\},
$$

almost surely under $h_{0}$, because the indicator $1\left\{z>h_{0}\right\}$ in the denominator equals 1 almost surely if $h_{0}$ is the true parameter.

The joint density of a random sample $X_{1}, \ldots, X_{n}$ from the uniform $[0, \theta]$ distribution can be written in the form $(1 / \theta)^{n} 1\left\{X_{(n)} \leq \theta\right\}$. The likelihood ratios take the form

$$
\frac{d P_{\theta-h / n}^{n}}{d P_{\theta-h_{0} / n}^{n}}\left(X_{1}, \ldots, X_{n}\right)=\frac{(\theta-h / n)^{-n} 1\left\{X_{(n)} \leq \theta-h / n\right\}}{\left(\theta-h_{0} / n\right)^{-n} 1\left\{X_{(n)} \leq \theta-h_{0} / n\right\}} .
$$

Under the parameter $\theta-h_{0} / n$, the maximum of the observations is certainly bounded above by $\theta-h_{0} / n$ and the indicator in the denominator equals 1 . Thus, with probability 1 under $\theta-h_{0} / n$, the likelihood ratio in the preceding display can be written

$$
\left(e^{\left(h-h_{0}\right) / \theta}+o(1)\right) 1\left\{-n\left(X_{(n)}-\theta\right) \geq h\right\} .
$$

By direct calculation, $-n\left(X_{(n)}-\theta\right) \stackrel{h_{0}}{\hookrightarrow} Z$. By the continuous-mapping theorem and Slutsky's lemma, the sequence of likelihood processes converges under $\theta-h_{0} / n$ marginally in distribution to the likelihood process of the exponential experiment. $\square$

Along the same lines it may be proved that in the case of uniform distributions with both endpoints unknown a limit experiment based on observation of two independent exponential variables pertains. These types of experiments are completely determined by the discontinuities of the underlying densities at their left and right endpoints. It can be shown more generally that exponential limit experiments are obtained for any densities that have jumps at one or both of their endpoints and are smooth in between. For densities with discontinuities in the middle, or weaker singularities, other limit experiments pertain.

The convergence to a limit experiment combined with the asymptotic representation theorem, Theorem 9.3, allows one to obtain asymptotic lower bounds for sequences of estimators, much as in the locally asymptotically normal case in Chapter 8. We give only one concrete statement.

[^4]9.7 Corollary. Let $T_{n}$ be estimators based on a sample $X_{1}, \ldots, X_{n}$ from the uniform distribution on $[0, \theta]$ such that the sequence $n\left(T_{n}-\theta\right)$ converges under $\theta$ in distribution to a limit $L_{\theta}$, for every $\theta$. Then for Lebesgue almost-every $\theta$ we have $\int|x| d L_{\theta}(x) \geq \mathrm{E}|Z-\operatorname{med} Z|$ and $\int x^{2} d L_{\theta}(x) \geq \mathrm{E}(Z-\mathrm{E} Z)^{2}$ for the random variable $Z$ exponentially distributed with mean $\theta$.

Proof (Sketch). By Lemma 8.10, the estimator sequence $T_{n}$ is automatically almost regular in the sense that $n\left(T_{n}-\theta+h / n\right)$ converges under $\theta-h / n$ in distribution to $L_{\theta}$ for Lebesgue almost every $\theta$ and $h$, at least along a subsequence. Thus, it is matched in the limit experiment by an equivariant-in-law estimator for almost every $\theta$. More precisely, for almost every $\theta$ there exists a randomized statistic $T_{\theta}$ such that the law of $T_{\theta}(Z+h, U)-h$ does not depend on $h$ (if $Z$ is exponentially distributed with mean $\theta$ ). By classical statistical decision theory the given lower bounds are the (constant) risks of the best equivariant-in-law estimators in the exponential limit experiment in terms of absolute error and mean-square error loss functions, respectively.

In view of this lemma, the maximum likelihood estimator $X_{(n)}$ is asymptotically inefficient. This is not surprising given its bias downwards, but it is encouraging for the present approach that the small bias, which is of the order $1 / n$, is visible in the "first-order" asymptotics. The bias can be corrected by a multiplicative factor, which, unfortunately, must depend on the loss function. The sequences of estimators

$$
\frac{n+\log 2}{n} X_{(n)} \quad \text { and } \quad \frac{n+1}{n} X_{(n)}
$$

are asymptotically efficient in terms of absolute value and quadratic loss, respectively.

### 9.5 Pareto Distribution

The Pareto distributions are a two-parameter family of distributions on the real line with parameters $\alpha>0$ and $\mu>0$ and density

$$
x \mapsto \frac{\alpha \mu^{\alpha}}{x^{\alpha+1}} 1\{x>\mu\} .
$$

This density is smooth in $\alpha$, but it resembles a uniform distribution as discussed in the preceding section in its dependence on $\mu$. The limit experiment consists of a combination of a normal experiment and an exponential experiment.

The likelihood ratios for a sample of size $n$ from the Pareto distributions with parameters $(\alpha+g / \sqrt{n}, \mu+h / n)$ and $\left(\alpha+g_{0} / \sqrt{n}, \mu+h_{0} / n\right)$, respectively, is equal to

$$
\begin{aligned}
& \left(\frac{\alpha+g / \sqrt{n}}{\alpha+g_{0} / \sqrt{n}}\right)^{n} \frac{(\mu+h / n)^{n \alpha+\sqrt{n} g}}{\left(\mu+h_{0} / n\right)^{n \alpha+\sqrt{n} g_{0}}}\left(\prod_{i=1}^{n} X_{i}\right)^{\left(g_{0}-g\right) / \sqrt{n}} 1\left\{X_{(1)}>\mu+\frac{h}{n}\right\} \\
& \quad=\exp \left(\left(g-g_{0}\right) \Delta_{n}-\frac{1}{2} \frac{g^{2}+g_{0}^{2}}{\alpha^{2}}+o(1)\right)\left(e^{\left(h-h_{0}\right) \alpha / \mu}+o(1)\right) 1\left\{Z_{n}>h\right\} .
\end{aligned}
$$

Here, under the parameters $\left(\alpha+g_{0} / \sqrt{n}, \mu+h_{0} / n\right)$, the sequence

$$
\Delta_{n}=-\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\log \frac{X_{i}}{\mu}-\frac{1}{\alpha}\right)
$$

converges weakly to a normal distribution with mean $g_{0} / \alpha^{2}$ and variance $1 / \alpha^{2}$; and the sequence $Z_{n}=n\left(X_{(1)}-\mu\right)$ converges in distribution to the (shifted) exponential distribution with mean $\mu / \alpha+h_{0}$ and variance $(\mu / \alpha)^{2}$. The two sequences are asymptotically independent. Thus the likelihood is a product of a locally asymptotically normal and a "locally asymptotically exponential" factor. The local limit experiment consists of observing a pair ( $\Delta, Z$ ) of independent variables $\Delta$ and $Z$ with a $N\left(g, \alpha^{2}\right)$-distribution and an $\exp (\alpha / \mu)+h$-distribution, respectively.

The maximum likelihood estimators for the parameters $\alpha$ and $\mu$ are given by

$$
\hat{\alpha}_{n}=\frac{n}{\sum_{i=1}^{n} \log \left(X_{i} / X_{(1)}\right)}, \quad \text { and } \quad \hat{\mu}_{n}=X_{(1)}
$$

The sequence $\sqrt{n}\left(\hat{\alpha}_{n}-\alpha\right)$ converges in distribution under the parameters $(\alpha+g / \sqrt{n}, \mu+ h / n)$ to the variable $\Delta-g$. Because the distribution of $Z$ does not depend on $g$, and $\Delta$ follows a normal location model, the variable $\Delta$ can be considered an optimal estimator for $g$ based on the observation ( $\Delta, Z$ ). This optimality is carried over into the asymptotic optimality of the maximum likelihood estimator $\hat{\alpha}_{n}$. A precise formulation could be given in terms of a convolution or a minimax theorem.

On the other hand, the maximum likelihood estimator for $\mu$ is asymptotically inefficient. Because the sequence $n\left(\hat{\mu}_{n}-\mu-h / n\right)$ converges in distribution to $Z-h$, the estimators $\hat{\mu}_{n}$ are asymptotically biased upwards.

### 9.6 Asymptotic Mixed Normality

The likelihood ratios of some models allow an approximation by a two-term Taylor expansion without the linear term being asymptotically normal and the quadratic term being deterministic. Then a generalization of local asymptotic normality is possible. In the most important example of this situation, the linear term is asymptotically distributed as a mixture of normal distributions.

A sequence of experiments ( $P_{n, \theta}: \theta \in \Theta$ ) indexed by an open subset $\Theta$ of $\mathbb{R}^{d}$ is called locally asymptotically mixed normal at $\theta$ if there exist matrices $\gamma_{n, \theta} \rightarrow 0$ such that

$$
\log \frac{d P_{n, \theta+\gamma_{n, \theta} h_{n}}}{d P_{n, \theta}}=h^{T} \Delta_{n, \theta}-\frac{1}{2} h^{T} J_{n, \theta} h+o_{P_{n, \theta}}(1)
$$

for every converging sequence $h_{n} \rightarrow h$, and random vectors $\Delta_{n, \theta}$ and random matrices $J_{n, \theta}$ such that $\left(\Delta_{n, \theta}, J_{n, \theta}\right) \stackrel{\theta}{\rightsquigarrow}\left(\Delta_{\theta}, J_{\theta}\right)$ for a random vector such that the conditional distribution of $\Delta_{\theta}$ given that $J_{\theta}=J$ is normal $N(0, J)$.

Locally asymptotically mixed normal is often abbreviated to LAMN. Locally asymptotically normal, or LAN, is the special case in which the matrix $J_{\theta}$ is deterministic. Sequences of experiments whose likelihood ratios allow a quadratic approximation as in the preceding display (but without the specific limit distribution of ( $\Delta_{n, \theta}, J_{n, \theta}$ )) and that are
such that $P_{n, \theta+\gamma_{n, \theta} h} \triangleleft \triangleright P_{n, \theta}$ are called locally asymptotically quadratic, or LAQ. We note that LAQ or LAMN requires much more than the mere existence of two derivatives of the likelihood: There is no reason why, in general, the remainder would be negligible.
9.8 Theorem. Assume that the sequence of experiments ( $P_{n, \theta}: \theta \in \Theta$ ) is locally asymptotically mixed normal at $\theta$. Then the sequence of experiments $\left(P_{n, \theta+\gamma_{n, \theta}}: h \in \mathbb{R}^{d}\right)$ converges to the experiment consisting of observing a pair $(\Delta, J)$ such that $J$ is marginally distributed as $J_{\theta}$ for every $h$ and the conditional distribution of $\Delta$ given $J$ is normal $N(J h, J)$.

Proof. Write $P_{\theta, h}$ for the distribution of ( $\Delta, J$ ) under $h$. Because the marginal distribution of $J$ does not depend on $h$ and the conditional distribution of $\Delta$ given $J$ is Gaussian

$$
\frac{d P_{\theta, h}}{d P_{\theta, h_{0}}}(\Delta, J)=\frac{d N(J h, J)}{d N\left(J h_{0}, J\right)}(\Delta)=e^{\left(h-h_{0}\right)^{T} \Delta-\frac{1}{2} h^{T} J h+\frac{1}{2} h_{0}^{T} J h_{0}}
$$

By Slutsky's lemma and the assumptions, the sequence $d P_{n, \theta+\gamma_{n, \theta} h} / d P_{n, \theta}$ converges under $\theta$ in distribution to $\exp \left(h^{T} \Delta_{\theta}-\frac{1}{2} h^{T} J_{\theta} h\right)$. Because the latter variable has mean one, it follows that the sequences of distributions $P_{n, \theta+\gamma_{n, \theta}}$ and $P_{n, \theta}$ are mutually contiguous. In particular, the probability under $\theta$ that $d P_{n, \theta+\gamma_{n, \theta} h}$ is zero converges to zero for every $h$, so that

$$
\begin{aligned}
\log \frac{d P_{n, \theta+\gamma_{n, \theta} h}}{d P_{n, \theta+\gamma_{n, \theta} h_{0}}} & =\log \frac{d P_{n, \theta+\gamma_{n, \theta} h}}{d P_{n, \theta}}-\log \frac{d P_{n, \theta+\gamma_{n, \theta} h_{0}}}{d P_{n, \theta}}+o_{P_{n, \theta}}(1) \\
& =\left(h-h_{0}\right)^{T} \Delta_{n, \theta}-\frac{1}{2} h^{T} J_{n, \theta} h+\frac{1}{2} h_{0}^{T} J_{n, \theta} h_{0}+o_{P_{n, \theta}}(1)
\end{aligned}
$$

Conclude that it suffices to show that the sequence ( $\Delta_{n, \theta}, J_{n, \theta}$ ) converges under $\theta+\gamma_{n, \theta} h_{0}$ to the distribution of ( $\Delta, J$ ) under $h_{0}$.

Using the general form of Le Cam's third lemma we obtain that the limit distribution of the sequence ( $\Delta_{n, \theta}, J_{n, \theta}$ ) under $\theta+\gamma_{n, \theta} h$ takes the form

$$
L_{h}(B)=\mathrm{E} 1_{B}\left(\Delta_{\theta}, J_{\theta}\right) e^{h^{T} \Delta_{\theta}-\frac{1}{2} h^{T} J_{\theta} h}
$$

On noting that the distribution of ( $\Delta, J$ ) under $h=0$ is the same as the distribution of $\left(\Delta_{\theta}, J_{\theta}\right)$, we see that this is equal to $\mathrm{E}_{0} 1_{B}(\Delta, J) d P_{\theta, h} / d P_{\theta, 0}(\Delta, J)=\mathrm{P}_{h}((\Delta, J) \in B)$.

It is possible to develop a theory of asymptotic "lower bounds" for LAMN models, much as is done for LAN models in Chapter 8. Because conditionally on the ancillary statistic $J$, the limit experiment is a Gaussian shift experiment, the lower bounds take the form of mixtures of the lower bounds for the LAN case. We give only one example, leaving the details to the reader.
9.9 Corollary. Let $T_{n}$ be an estimator sequence in a LAMN sequence of experiments $\left(P_{n, \theta}: \theta \in \Theta\right)$ such that $\gamma_{n, \theta}^{-1}\left(T_{n}-\psi\left(\theta+\gamma_{n, \theta} h\right)\right)$ converges weakly under every $\theta+\gamma_{n, \theta} h$ to a limit distribution $L_{\theta}$, for every $h$. Then there exist probability distributions $M_{j}$ (or rather a Markov kernel) such that $L_{\theta}=\mathrm{E} N\left(0, \dot{\psi}_{\theta} J_{\theta}^{-1} \dot{\psi}_{\theta}^{T}\right) * M_{J_{\theta}}$. In particular, $\operatorname{cov}_{\theta} L_{\theta} \geq \mathrm{E} \dot{\psi}_{\theta} J_{\theta}^{-1} \dot{\psi}_{\theta}^{T}$.

We include two examples to give some idea of the application of local asymptotic mixed normality. In both examples the sequence of models is LAMN rather than LAN due to an explosive growth of information, occurring at certain supercritical parameter values. The second derivative of the log likelihood, the information, remains random. In both examples there is also (approximate) Gaussianity present in every single observation. This appears to be typical, unlike the situation with LAN, in which the normality results from sums over (approximately) independent observations. In explosive models of this type the likelihood is dominated by a few observations, and normality cannot be brought in through (martingale) central limit theorems.
9.10 Example (Branching processes). In a Galton-Watson branching process the " $n$th generation" is formed by replacing each element of the ( $n-1$ )-th generation by a random number of elements, independently from the rest of the population and from the preceding generations. This random number is distributed according to a fixed distribution, called the offspring distribution. Thus, conditionally on the size $X_{n-1}$ of the $(n-1)$ th generation the size $X_{n}$ of the $n$th generation is distributed as the sum of $X_{n-1}$ i.i.d. copies of an offspring variable $Z$. Suppose that $X_{0}=1$, that we observe $\left(X_{1}, \ldots, X_{n}\right)$, and that the offspring distribution is known to belong to an exponential family of the form

$$
\mathrm{P}_{\theta}(Z=z)=a_{z} \theta^{z} c(\theta), \quad z=0,1,2, \ldots,
$$

for given numbers $a_{0}, a_{1}, \ldots$. The natural parameter space is the set of all $\theta$ such that $c(\theta)^{-1}=\sum_{z} a_{z} \theta^{z}$ is finite (an interval). We shall concentrate on parameters in the interior of the natural parameter space such that $\mu(\theta):=\mathrm{E}_{\theta} Z>1$. Set $\sigma^{2}(\theta)=\operatorname{var}_{\theta} Z$.

The sequence $X_{1}, X_{2}, \ldots$ is a Markov chain with transition density

$$
p_{\theta}(y \mid x)=\mathrm{P}_{\theta}\left(X_{n}=y \mid X_{n-1}=x\right)=\overbrace{a * \cdots * a}^{x \text { times }} \theta^{y} c(\theta)^{x} .
$$

To obtain a two-term Taylor expansion of the $\log$ likelihood ratios, let $\ell_{\theta}(y \mid x)$ be the $\log$ transition density, and calculate that

$$
\dot{\ell}_{\theta}(y \mid x)=\frac{y-x \mu(\theta)}{\theta}, \quad \ddot{\ell}_{\theta}(y \mid x)=-\frac{y-x \mu(\theta)}{\theta^{2}}-\frac{x \dot{\mu}(\theta)}{\theta} .
$$

(The fact that the score function of the model $\theta \mapsto \mathrm{P}_{\theta}(Z=z)$ has derivative zero yields the identity $\mu(\theta)=-\theta(c / \dot{c})(\theta)$, as is usual for exponential families.) Thus, the Fisher information in the observation $\left(X_{1}, \ldots, X_{n}\right)$ equals (note that $\mathrm{E}_{\theta}\left(X_{j} \mid X_{j-1}\right)=X_{j-1} \mu(\theta)$ )

$$
\begin{aligned}
-\mathrm{E}_{\theta} \sum_{j=1}^{n} \ddot{\ell}_{\theta}\left(X_{j} \mid X_{j-1}\right) & =\mathrm{E}_{\theta} \sum_{j=1}^{n} X_{j-1} \frac{\dot{\mu}(\theta)}{\theta} \\
& =\frac{\dot{\mu}(\theta)}{\theta} \sum_{j=1}^{n} \mu(\theta)^{j-1}=\frac{\dot{\mu}(\theta)}{\theta} \frac{\mu(\theta)^{n}-1}{\mu(\theta)-1} .
\end{aligned}
$$

For $\mu(\theta)>1$, this converges to infinity at a much faster rate than "usually." Because the total information in $\left(X_{1}, \ldots, X_{n}\right)$ is of the same order as the information in the last observation $X_{n}$, the model is "explosive" in terms of growth of information. The calculation suggests the rescaling rate $\gamma_{n, \theta}=\mu(\theta)^{-n / 2}$, which is roughly the inverse root of the information.

A Taylor expansion of the $\log$ likelihood ratio yields the existence of a point $\theta_{n}$ between $\theta$ and $\theta+\gamma_{n, \theta} h$ such that

$$
\begin{aligned}
& \log \prod_{j=1}^{n} \frac{p_{\theta+\gamma_{n, \theta}} h}{p_{\theta}}\left(X_{j} \mid X_{j-1}\right) \\
& \quad=\frac{h}{\mu(\theta)^{n / 2}} \sum_{j=1}^{n} \dot{\ell}_{\theta}\left(X_{j} \mid X_{j-1}\right)+\frac{1}{2} \frac{h^{2}}{\mu(\theta)^{n}} \sum_{j=1}^{n} \ddot{\ell}_{\theta_{n}}\left(X_{j} \mid X_{j-1}\right)
\end{aligned}
$$

This motivates the definitions

$$
\begin{aligned}
\Delta_{n, \theta} & =\frac{1}{\mu(\theta)^{n / 2}} \sum_{j=1}^{n} \frac{X_{j}-\mu(\theta) X_{j-1}}{\theta} \\
J_{n, \theta} & =\frac{1}{\mu(\theta)^{n}} \sum_{j=1}^{n}\left[\frac{X_{j}-\mu(\theta) X_{j-1}}{\theta^{2}}+\frac{X_{j-1} \dot{\mu}(\theta)}{\theta}\right] .
\end{aligned}
$$

Because $\mathrm{E}_{\theta}\left(X_{n} \mid X_{n-1}, \ldots, X_{1}\right)=X_{n-1} \mu(\theta)$, the sequence of random variables $\mu(\theta)^{-n} X_{n}$ is a martingale under $\theta$. Some algebra shows that its second moments are bounded as $n \rightarrow \infty$. Thus, by a martingale convergence theorem (e.g., Theorem 10.5.4 of [42]), there exists a random variable $V$ such that $\mu(\theta)^{-n} X_{n} \rightarrow V$ almost surely. By the Toeplitz lemma (Problem 9.6) and again some algebra, we obtain that, almost surely under $\theta$,

$$
\frac{1}{\mu(\theta)^{n}} \sum_{j=1}^{n} X_{j} \rightarrow \frac{\mu(\theta)}{\mu(\theta)-1} V, \quad \frac{1}{\mu(\theta)^{n}} \sum_{j=1}^{n} X_{j-1} \rightarrow \frac{1}{\mu(\theta)-1} V
$$

It follows that the point $\theta_{n}$ in the expansion of the $\log$ likelihood can be replaced by $\theta$ at the cost of adding a term that converges to zero in probability under $\theta$. Furthermore,

$$
J_{n, \theta} \mapsto \frac{\dot{\mu}(\theta)}{\theta(\mu(\theta)-1)} V, \quad P_{\theta} \text {-almost surely }
$$

It remains to derive the limit distribution of the sequence $\Delta_{n, \theta}$. If we write $X_{j}=\sum_{i=1}^{X_{j-1}} Z_{j, i}$ for independent copies $Z_{j, i}$ of the offspring variable $Z$, then

$$
\Delta_{n, \theta}=\frac{1}{\theta \mu(\theta)^{n / 2}} \sum_{j=1}^{n} \sum_{i=1}^{X_{j-1}}\left(Z_{j, i}-\mu(\theta)\right)=\frac{1}{\theta \mu(\theta)^{n / 2}} \sum_{i=1}^{v_{n}}\left(Z_{i}-\mu(\theta)\right)
$$

for independent copies $Z_{i}$ of $Z$ and $\nu_{n}=\sum_{i=1}^{n} X_{j-1}$. Even though $Z_{1}, Z_{2}, \ldots$ and the total number $\nu_{n}$ of variables in the sum are dependent, a central limit theorem applies to the right side: conditionally on the event $\{V>0\}$ (on which $v_{n} \rightarrow \infty$ ), the sequence $\nu_{n}^{-1 / 2} \sum_{i=1}^{\nu_{n}}\left(Z_{i}-\mu(\theta)\right)$ converges in distribution to $\sigma(\theta)$ times a standard normal variable $G$. Furthermore, if we define $G$ independent of $V$, conditionally on $\{V>0\},^{\dagger}$

$$
\begin{equation*}
\left(\Delta_{n, \theta}, J_{n, \theta}\right) \rightsquigarrow\left(\frac{\sigma(\theta)}{\theta} \sqrt{\frac{V}{\mu(\theta)-1}} G, \frac{\dot{\mu}(\theta)}{\theta(\mu(\theta)-1)} V\right) \tag{9.11}
\end{equation*}
$$

${ }^{\dagger}$ See the appendix of [81] or, e.g., Theorem 3.5.1 and its proof in [146].

It is well known that the event $\{V=0\}$ coincides with the event $\left\{\lim X_{n}=0\right\}$ of extinction of the population. (This occurs with positive probability if and only if $a_{0}>0$.) Thus, on the set $\{V=0\}$ the series $\sum_{j=1}^{\infty} X_{j}$ converges almost surely, whence $\Delta_{n, \theta} \rightarrow 0$. Interpreting zero as the product of a standard normal variable and zero, we see that again (9.11) is valid. Thus the sequence ( $\Delta_{n, \theta}, J_{n, \theta}$ ) converges also unconditionally to this limit. Finally, note that $\sigma^{2}(\theta) / \theta=\dot{\mu}(\theta)$, so that the limit distribution has the right form.

The maximum likelihood estimator for $\mu(\theta)$ can be shown to be asymptotically efficient, (see, e.g., [29] or [81]).
9.12 Example (Gaussian AR). The canonical example of an LAMN sequence of experiments is obtained from an explosive autoregressive process of order one with Gaussian innovations. (The Gaussianity is essential.) Let $|\theta|>1$ and $\varepsilon_{1}, \varepsilon_{2}, \ldots$ be an i.i.d. sequence of standard normal variables independent of a fixed variable $X_{0}$. We observe the vector $\left(X_{0}, X_{1}, \ldots, X_{n}\right)$ generated by the recursive formula $X_{t}=\theta X_{t-1}+\varepsilon_{t}$.

The observations form a Markov chain with transition density $p\left(\cdot \mid x_{t-1}\right)$ equal to the $N\left(\theta x_{t-1}, 1\right)$-density. Therefore, the log likelihood ratio process takes the form

$$
\log \frac{p_{n, \theta+\gamma_{n, \theta} h}}{p_{n, \theta}}\left(X_{0}, \ldots, X_{n}\right)=h \gamma_{n, \theta} \sum_{t=1}^{n}\left(X_{t}-\theta X_{t-1}\right) X_{t-1}-\frac{1}{2} h^{2} \gamma_{n, \theta}^{2} \sum_{t=1}^{n} X_{t-1}^{2} .
$$

This has already the appropriate quadratic structure. To establish LAMN, it suffices to find the right rescaling rate and to establish the joint convergence of the linear and the quadratic term. The rescaling rate may be chosen proportional to the Fisher information and is taken $\gamma_{n, \theta}=\theta^{-n}$.

By repeated application of the defining autoregressive relationship, we see that

$$
\theta^{-t} X_{t}=X_{0}+\sum_{j=1}^{t} \theta^{-j} \varepsilon_{j} \rightarrow V:=X_{0}+\sum_{j=1}^{\infty} \theta^{-j} \varepsilon_{j},
$$

almost surely as well as in second mean. Given the variable $X_{0}$, the limit is normally distributed with mean $X_{0}$ and variance $\left(\theta^{2}-1\right)^{-1}$. An application of the Toeplitz lemma (Problem 9.6) yields

$$
\frac{1}{\theta^{2 n}} \sum_{t=1}^{n} X_{t-1}^{2} \rightarrow \frac{V^{2}}{\theta^{2}-1}
$$

The linear term in the quadratic representation of the log likelihood can (under $\theta$ ) be rewritten as $\theta^{-n} \sum_{t=1}^{n} \varepsilon_{t} X_{t-1}$, and satisfies, by the Cauchy-Schwarz inequality and the Toeplitz lemma,

$$
\mathrm{E}\left|\frac{1}{\theta^{n}} \sum_{t=1}^{n} \varepsilon_{t} X_{t-1}-\frac{1}{\theta^{n}} \sum_{t=1}^{n} \varepsilon_{t} \theta^{t-1} V\right| \leq \frac{1}{|\theta|^{n}} \sum_{t=1}^{n}|\theta|^{t-1}\left(\mathrm{E}\left(\theta^{-t+1} X_{t-1}-V\right)^{2}\right)^{1 / 2} \rightarrow 0 .
$$

It follows that the sequence of vectors ( $\Delta_{n, \theta}, J_{n, \theta}$ ) has the same limit distribution as the sequence of vectors $\left(\theta^{-n} \sum_{t=1}^{n} \varepsilon_{t} \theta^{t-1} V, V^{2} /\left(\theta^{2}-1\right)\right)$. For every $n$ the vector $\left(\theta^{-n} \sum_{t=1}^{n} \varepsilon_{t}\right.$
$\left.\theta^{t-1}, V\right)$ possesses, conditionally on $X_{0}$, a bivariate-normal distribution. As $n \rightarrow \infty$ these distributions converge to a bivariate-normal distribution with mean ( $0, X_{0}$ ) and covariance matrix $I /\left(\theta^{2}-1\right)$. Conclude that the sequence $\left(\Delta_{n, \theta}, J_{n, \theta}\right)$ converges in distribution as required by the LAMN criterion.

### 9.7 Heuristics

The asymptotic representation theorem, Theorem 9.3, shows that every sequence of statistics in a converging sequence of experiments is matched by a statistic in the limit experiment. It is remarkable that this is true under the present definition of convergence of experiments, which involves only marginal convergence and is very weak.

Under appropriate stronger forms of convergence more can be said about the nature of the matching procedure in the limit experiment. For instance, a sequence of maximum likelihood estimators converges to the maximum likelihood estimator in the limit experiment, or a sequence of likelihood ratio statistics converges to the likelihood ratio statistic in the limit experiment. We do not introduce such stronger convergence concepts in this section but only note the potential of this argument as a heuristic principle. See section 5.9 for rigorous results.

For the maximum likelihood estimator the heuristic argument takes the following form. If $\hat{h}_{n}$ maximizes the likelihood $h \mapsto d P_{n, h}$, then it also maximizes the likelihood ratio process $h \mapsto d P_{n, h} / d P_{n, h_{0}}$. The latter sequence of processes converges (marginally) in distribution to the likelihood ratio process $h \mapsto d P_{h} / d P_{h_{0}}$ of the limit experiment. It is reasonable to expect that the maximizer $\hat{h}_{n}$ converges in distribution to the maximizer of the process $h \mapsto d P_{h} / d P_{h_{0}}$, which is the maximum likelihood estimator for $h$ in the limit experiment. (Assume that this exists and is unique.) If the converging experiments are the local experiments corresponding to a given sequence of experiments with a parameter $\theta$, then the argument suggests that the sequence of local maximum likelihood estimators $\hat{h}_{n}=r_{n}\left(\hat{\theta}_{n}-\theta\right)$ converges, under $\theta$, in distribution to the maximum likelihood estimator in the local limit experiment, under $h=0$.

Besides yielding the limit distribution of the maximum likelihood estimator, the argument also shows to what extent the estimator is asymptotically efficient. It is efficient, or inefficient, in the same sense as the maximum likelihood estimator is efficient or inefficient in the limit experiment. That maximum likelihood estimators are often asymptotically efficient is a consequence of the fact that often the limit experiment is Gaussian and the maximum likelihood estimator of a Gaussian location parameter is optimal in a certain sense. If the limit experiment is not Gaussian, there is no a priori reason to expect that the maximum likelihood estimators are asymptotically efficient.

A variety of examples shows that the conclusions of the preceding heuristic arguments are often but not universally valid. The reason for failures is that the convergence of experiments is not well suited to allow claims about maximum likelihood estimators. Such claims require stronger forms of convergence than marginal convergence only.

For the case of experiments consisting of a random sample from a smooth parametric model, the argument is made precise in section 7.4. Next to the convergence of experiments, it is required only that the maximum likelihood estimator is consistent and that the log density is locally Lipschitz in the parameter. The preceding heuristic argument also extends to the other examples of convergence to limit experiments considered in this chapter. For instance, the maximum likelihood estimator based on a sample from the uniform distribution on $[0, \theta]$
is asymptotically inefficient, because it corresponds to the estimator $Z$ for $h$ (the maximum likelihood estimator) in the exponential limit experiment. The latter is biased upwards and inefficient for every of the usual loss functions.

## Notes

This chapter presents a few examples from a large body of theory. The notion of a limit experiment was introduced by Le Cam in [95]. He defined convergence of experiments through convergence of all finite subexperiments relative to his deficiency distance, rather than through convergence of the likelihood ratio processes. This deficiency distance introduces a "strong topology" next to the "weak topology" corresponding to convergence of experiments. For experiments with a finite parameter set, the two topologies coincide. There are many general results that can help to prove the convergence of experiments and to find the limits (also in the examples discussed in this chapter). See [82], [89], [96], [97], [115], [138], [142] and [144] for more information and more examples. For nonlocal approximations in the strong topology see, for example, [96] or [110].

## PROBLEMS

1. Let $X_{1}, \ldots, X_{n}$ be an i.i.d. sample from the normal $N(h / \sqrt{n}, 1)$ distribution, in which $h \in \mathbb{R}$. The corresponding sequence of experiments converges to a normal experiment by the general results. Can you see this directly?
2. If the $n$th experiment corresponds to the observation of a sample of size $n$ from the uniform $[0,1-h / n]$, then the limit experiment corresponds to observation of a shifted exponential variable $Z$. The sequences $-n\left(X_{(n)}-1\right)$ and $\sqrt{n}\left(2 \bar{X}_{n}-1\right)$ both converge in distribution under every $h$. According to the representation theorem their sets of limit distributions are the distributions of randomized statistics based on $Z$. Find these randomized statistics explicitly. Any implications regarding the quality of $X_{(n)}$ and $\bar{X}_{n}$ as estimators?
3. Let the $n$th experiment consist of one observation from the binomial distribution with parameters $n$ and success probability $h / n$ with $0<h<1$ unknown. Show that this sequence of experiments converges to the experiment consisting of observing a Poisson variable with mean $h$.
4. Let the $n$th experiment consists of observing an i.i.d. sample of size $n$ from the uniform $[-1-h / n, 1+h / n]$ distribution. Find the limit experiment.
5. Prove the asymptotic representation theorem for the case in which the $n$th experiment corresponds to an i.i.d. sample from the uniform $[0, \theta-h / n]$ distribution with $h>0$ by mimicking the proof of this theorem for the locally asymptotically normal case.
6. (Toeplitz lemma.) If $a_{n}$ is a sequence of nonnegative numbers with $\sum a_{n}=\infty$ and $x_{n} \rightarrow x$ an arbitrary converging sequence of numbers, then the sequence $\sum_{j=1}^{n} a_{j} x_{j} / \sum_{j=1}^{n} a_{j}$ converges to $x$ as well. Show this.
7. Derive a limit experiment in the case of Galton-Watson branching with $\mu(\theta)<1$.
8. Derive a limit experiment in the case of a Gaussian AR(1) process with $\theta=1$.
9. Derive a limit experiment for sampling from a $U[\sigma, \tau]$ distribution with both endpoints unknown.
10. In the case of sampling from the $U[0, \theta]$ distribution show that the maximum likelihood estimator for $\theta$ converges to the maximum likelihood estimator in the limit experiment. Why is the latter not a good estimator?
11. Formulate and prove a local asymptotic minimax theorem for estimating $\theta$ from a sample from a $U[0, \theta]$ distribution, using $\ell(x)=x^{2}$ as loss function.

## 10

## Bayes Procedures

> In this chapter Bayes estimators are studied from a frequentist perspective. Both posterior measures and Bayes point estimators in smooth parametric models are shown to be asymptotically normal.

### 10.1 Introduction

In Bayesian terminology the distribution $P_{n, \theta}$ of an observation $\vec{X}_{n}$ under a parameter $\theta$ is viewed as the conditional law of $\vec{X}_{n}$ given that a random variable $\bar{\Theta}_{n}$ is equal to $\theta$. The distribution $\Pi$ of the "random parameter" $\bar{\Theta}_{n}$ is called the prior distribution, and the conditional distribution of $\bar{\Theta}_{n}$ given $\vec{X}_{n}$ is the posterior distribution. If $\bar{\Theta}_{n}$ possesses a density $\pi$ and $P_{n, \theta}$ admits a density $p_{n, \theta}$ (relative to given dominating measures), then the density of the posterior distribution is given by Bayes' formula

$$
p_{\bar{\Theta}_{n} \mid \vec{X}_{n}=x}(\theta)=\frac{p_{n, \theta}(x) \pi(\theta)}{\int p_{n, \theta}(x) d \Pi(\theta)} .
$$

This expression may define a probability density even if $\pi$ is not a probability density itself. A prior distribution with infinite mass is called improper.

The calculation of the posterior measure can be considered the ultimate aim of a Bayesian analysis. Alternatively, one may wish to obtain a "point estimator" for the parameter $\theta$, using the posterior distribution. The posterior mean $\mathrm{E}\left(\bar{\Theta}_{n} \mid \vec{X}_{n}\right)=\int \theta p_{\bar{\Theta}_{n} \mid \vec{X}_{n}}(\theta) d \theta$ is often used for this purpose, but other location estimators are also reasonable.

A choice of point estimator may be motivated by a loss function. The Bayes risk of an estimator $T_{n}$ relative to the loss function $\ell$ and prior measure $\Pi$ is defined as

$$
\int \mathrm{E}_{\theta} \ell\left(T_{n}-\theta\right) d \Pi(\theta)=\mathrm{E} \ell\left(T_{n}-\bar{\Theta}_{n}\right)
$$

Here the expectation $\mathrm{E}_{\theta} \ell\left(T_{n}-\theta\right)$ is the risk function of $T_{n}$ in the usual set-up and is identical to the conditional risk $\mathrm{E}\left(\ell\left(T_{n}-\bar{\Theta}_{n}\right) \mid \bar{\Theta}_{n}=\theta\right)$ in the Bayesian notation. The corresponding Bayes estimator is the estimator $T_{n}$ that minimizes the Bayes risk. Because the Bayes risk can be written in the form $\mathrm{EE}\left(\ell\left(T_{n}-\bar{\Theta}_{n}\right) \mid \vec{X}_{n}\right)$, the value $T_{n}=T_{n}(x)$ minimizes, for every fixed $x$, the "posterior risk"

$$
\mathrm{E}\left(\ell\left(T_{n}-\bar{\Theta}_{n}\right) \mid \vec{X}_{n}=x\right)=\frac{\int \ell\left(T_{n}-\theta\right) p_{n, \theta}(x) d \Pi(\theta)}{\int p_{n, \theta}(x) d \Pi(\theta)}
$$

Minimizing this expression may again be a well-defined problem even for prior densities of infinite total mass. For the loss function $\ell(y)=\|y\|^{2}$, the solution $T_{n}$ is the posterior mean $\mathrm{E}\left(\bar{\Theta}_{n} \mid \vec{X}_{n}\right)$, for absolute loss $\ell(y)=\|y\|$, the solution is the posterior median.

Other Bayesian point estimators are the posterior mode, which reduces to the maximum likelihood estimator in the case of a uniform prior density; or a maximum probability estimator, such as the center of the smallest ball that contains at least posterior mass $1 / 2$ (the "posterior shorth" in dimension one).

If the underlying experiments converge, in a suitable sense, to a Gaussian location experiment, then all these possibilities are typically asymptotically equivalent. Consider the case that the observation consists of a random sample of size $n$ from a density $p_{\theta}$ that depends smoothly on a Euclidean parameter $\theta$. Thus the density $p_{n, \theta}$ has a product form, and, for a given prior Lebesgue density $\pi$, the posterior density takes the form

$$
p_{\bar{\Theta}_{n} \mid X_{1}, \ldots, X_{n}}(\theta)=\frac{\prod_{i=1}^{n} p_{\theta}\left(X_{i}\right) \pi(\theta)}{\int \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right) \pi(\theta) d \theta}
$$

Typically, the distribution corresponding to this measure converges to the measure that is degenerate at the true parameter value $\theta_{0}$, as $n \rightarrow \infty$. In this sense Bayes estimators are usually consistent. A further discussion is given in sections 10.2 and 10.4. To obtain a more interesting limit, we rescale the parameter in the usual way and study the sequence of posterior distributions of $\sqrt{n}\left(\bar{\Theta}_{n}-\theta_{0}\right)$, whose densities are given by

$$
p_{\sqrt{n}\left(\bar{\Theta}_{n}-\theta_{0}\right) \mid X_{1}, \ldots, X_{n}}(h)=\frac{\prod_{i=1}^{n} p_{\theta_{0}+h / \sqrt{n}}\left(X_{i}\right) \pi\left(\theta_{0}+h / \sqrt{n}\right)}{\int \prod_{i=1}^{n} p_{\theta_{0}+h / \sqrt{n}}\left(X_{i}\right) \pi\left(\theta_{0}+h / \sqrt{n}\right) d h}
$$

If the prior density $\pi$ is continuous, then $\pi\left(\theta_{0}+h / \sqrt{n}\right)$, for large $n$, behaves like the constant $\pi\left(\theta_{0}\right)$, and $\pi$ cancels from the expression for the posterior density. For densities $p_{\theta}$ that are sufficiently smooth in the parameter, the sequence of models ( $P_{\theta_{0}+h / \sqrt{n}}: h \in \mathbb{R}^{k}$ ) is locally asymptotically normal, as discussed in Chapter 7. This means that the likelihood ratio processes $h \mapsto \prod_{i=1}^{n} p_{\theta_{0}+h / \sqrt{n}} / p_{\theta_{0}}\left(X_{i}\right)$ behave asymptotically as the likelihood ratio process of the normal experiment $\left(N\left(h, I_{\theta_{0}}^{-1}\right): h \in \mathbb{R}^{k}\right)$. Then we may expect the preceding display to be asymptotically equivalent in distribution to

$$
\frac{d N\left(h, I_{\theta_{0}}^{-1}\right)(X)}{\int d N\left(h, I_{\theta_{0}}^{-1}\right)(X) d h}=d N\left(X, I_{\theta_{0}}^{-1}\right)(h)
$$

where $d N(\mu, \Sigma)$ denotes the density of the normal distribution. The expression in the preceding display is exactly the posterior density for the experiment $\left(N\left(h, I_{\theta_{0}}^{-1}\right): h \in \mathbb{R}^{k}\right)$, relative to the (improper) Lebesgue prior distribution. The expression on the right shows that this is a normal distribution with mean $X$ and covariance matrix $I_{\theta_{0}}^{-1}$.

This heuristic argument leads us to expect that the posterior distribution of $\sqrt{n}\left(\bar{\Theta}_{n}-\right. \theta_{0}$ ) "converges" under the true parameter $\theta_{0}$ to the posterior distribution of the Gaussian limit experiment relative to the Lebesgue prior. The latter is equal to the $N\left(X, I_{\theta_{0}}^{-1}\right)$ distribution, for $X$ possessing the $N\left(0, I_{\theta_{0}}^{-1}\right)$-distribution. The notion of convergence in this statement is a complicated one, because a posterior distribution is a conditional, and hence stochastic, probability measure, but there is no need to make the heuristics precise at this point. On the other hand, the convergence should certainly include that "nice" Euclideanvalued functionals applied to the posterior laws converge in distribution in the usual sense.

Consequently, a sequence of Bayes point estimators, which can be viewed as location functionals applied to the posterior distributions, should converge to the corresponding Bayes point estimator in the limit experiment. Most location estimators (all reasonable ones) map symmetric distributions, such as the normal distribution, into their center of symmetry. Then, the Bayes point estimator in the limit experiment is $X$, and we should expect Bayes point estimators to converge in distribution to the random vector $X$, that is, to a $N\left(0, I_{\theta_{0}}^{-1}\right)$-distribution under $\theta_{0}$. In particular, they are asymptotically efficient and asymptotically equivalent to maximum likelihood estimators (under regularity conditions).

A remarkable fact about this conclusion is that the limit distribution of a sequence of Bayes estimators does not depend on the prior measure. Apparently, for an increasing number of observations one's prior beliefs are erased (or corrected) by the observations. To make this true an essential assumption is that the prior distribution possesses a density that is smooth and positive in a neighborhood of the true value of the parameter. Without this property the conclusion fails. For instance, in the case in which one rigorously sticks to a fixed discrete distribution that does not charge $\theta_{0}$, the sequence of posterior distributions of $\bar{\Theta}_{n}$ cannot even be consistent.

In the next sections we make the preceding heuristic argument precise. For technical reasons we separately consider the distributional approximation of the posterior distributions by a Gaussian one and the weak convergence of Bayes point estimators.

Even though the heuristic extends to convergence to other than Gaussian location experiments, we limit ourselves in this chapter to the locally asymptotically normal case. More precisely, we even assume that the observations are a random sample $X_{1}, \ldots, X_{n}$ from a distribution $P_{\theta}$ that admits a density $p_{\theta}$ with respect to a measure $\mu$ on a measurable space ( $\mathcal{X}, \mathcal{A}$ ). The parameter $\theta$ is assumed to belong to a measurable subset $\Theta$ of $\mathbb{R}^{k}$ that contains the true parameter $\theta_{0}$ as an interior point, and we assume that the maps $(\theta, x) \mapsto p_{\theta}(x)$ are jointly measurable.

All theorems in this chapter are frequentist in character in that we study the posterior laws under the assumption that the observations are a random sample from $P_{\theta_{0}}$ for some fixed, nonrandom $\theta_{0}$. The alternative, which we do not consider, would be to make probability statements relative to the joint distribution of $\left(X_{1}, \ldots, X_{n}, \bar{\Theta}_{n}\right)$, given a fixed prior marginal measure for $\bar{\Theta}_{n}$ and with $P_{\theta}^{n}$ being the conditional law of $\left(X_{1}, \ldots, X_{n}\right)$ given $\bar{\Theta}_{n}$.

### 10.2 Bernstein-von Mises Theorem

The heuristic argument in the preceding section indicates that posterior distributions in differentiable parametric models converge to the Gaussian posterior distribution $N\left(X, I_{\theta_{0}}^{-1}\right)$. The Bernstein-von Mises theorem makes this approximation rigorous and actually yields the approximation in a stronger sense than discussed so far. In Chapter 7 it is seen that the observation $X$ in the limit experiment is the asymptotic analogue of the "locally sufficient" statistics

$$
\Delta_{n, \theta_{0}}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} I_{\theta_{0}}^{-1} \dot{\ell}_{\theta_{0}}\left(X_{i}\right),
$$

where $\dot{\ell}_{\theta}$ is the score function of the model. The Bernstein-von Mises theorem asserts that the total variation distance between the posterior distribution of $\sqrt{n}\left(\bar{\Theta}_{n}-\theta_{0}\right)$ and the random distribution $N\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)$ converges to zero. Because $\Delta_{n, \theta_{0}} \rightsquigarrow X$, this has as a
consequence that the posterior distribution of $\sqrt{n}\left(\bar{\Theta}_{n}-\theta_{0}\right)$ converges, in any reasonable sense, in distribution to $N\left(X, I_{\theta_{0}}^{-1}\right)$.

The conditions of the following version of the Bernstein-von Mises theorem are remarkably weak. Besides differentiability in quadratic mean of the model, it is assumed that there exists a sequence of uniformly consistent tests for testing $H_{0}: \theta=\theta_{0}$ against $H_{1}:\left\|\theta-\theta_{0}\right\| \geq \varepsilon$, for every $\varepsilon>0$. In other words, it must be possible to separate the true value $\theta_{0}$ from the complements of balls centered at $\theta_{0}$. Because the theorem implies that the posterior distributions eventually concentrate on balls of radii $M_{n} / \sqrt{n}$ around $\theta_{0}$, for every $M_{n} \rightarrow \infty$, this separation hypothesis appears to be very reasonable. Even more so, since, as is noted in Lemmas 10.4 and 10.6, under continuity and identifiability of the model, separation by tests of $H_{0}: \theta=\theta_{0}$ from $H_{1}:\left\|\theta-\theta_{0}\right\| \geq \varepsilon$ for a single (large) $\varepsilon>0$ already implies separation for every $\varepsilon>0$. Furthermore, if $\Theta$ is compact and the model continuous and identifiable, then even the separation condition is superfluous (because it is automatically satisfied). ${ }^{\dagger}$
10.1 Theorem (Bernstein-von Mises). Let the experiment ( $P_{\theta}: \theta \in \Theta$ ) be differentiable in quadratic mean at $\theta_{0}$ with nonsingular Fisher information matrix $I_{\theta_{0}}$, and suppose that for every $\varepsilon>0$ there exists a sequence of tests $\phi_{n}$ such that

$$
\begin{equation*}
P_{\theta_{0}}^{n} \phi_{n} \rightarrow 0, \quad \sup _{\left\|\theta-\theta_{0}\right\| \geq \varepsilon} P_{\theta}^{n}\left(1-\phi_{n}\right) \rightarrow 0 . \tag{10.2}
\end{equation*}
$$

Furthermore, let the prior measure be absolutely continuous in a neighborhood of $\theta_{0}$ with a continuous positive density at $\theta_{0}$. Then the corresponding posterior distributions satisfy

$$
\left\|P_{\sqrt{n}\left(\bar{\Theta}_{n}-\theta_{0}\right) \mid X_{1}, \ldots, X_{n}}-N\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)\right\| \xrightarrow{P_{\theta_{0}}^{n}} 0 .
$$

Proof. Throughout the proof we rescale the parameter $\theta$ to the local parameter $h= \sqrt{n}\left(\theta-\theta_{0}\right)$. Let $\Pi_{n}$ be the corresponding prior distribution on $h$ (hence $\Pi_{n}(B)=\Pi\left(\theta_{0}+\right. B / \sqrt{n})$ ), and for a given set $C$ let $\Pi_{n}^{C}$ be the probability measure obtained by restricting $\Pi_{n}$ to $C$ and next renormalizing. Write $P_{n, h}$ for the distribution of $\vec{X}_{n}=\left(X_{1}, \ldots, X_{n}\right)$ under the original parameter $\theta_{0}+h / \sqrt{n}$, and let $P_{n, C}=\int P_{n, h} d \Pi_{n}^{C}(h)$. Finally, let $\bar{H}_{n}=\sqrt{n}\left(\bar{\Theta}_{n}-\theta_{0}\right)$, and denote the posterior distributions relative to $\Pi_{n}$ and $\Pi_{n}^{C}$ by $P_{\bar{H}_{n} \mid \vec{X}_{n}}$ and $P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C}$, respectively.

The proof consists of two steps. First, it is shown that the difference between the posterior measures relative to the priors $\Pi_{n}$ and $\Pi_{n}^{C_{n}}$, for $C_{n}$ the ball with radius $M_{n}$, is asymptotically negligible, for any $M_{n} \rightarrow \infty$. Next it is shown that the difference between $N\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)$ and the posterior measures relative to the priors $\Pi_{n}^{C_{n}}$ converges to zero in probability, for some $M_{n} \rightarrow \infty$.

For $U$, a ball of fixed radius around zero, we have $P_{n, U} \triangleleft \triangleright P_{n, 0}$, because $P_{n, h_{n}} \triangleleft \triangleright P_{n, 0}$ for every bounded sequence $h_{n}$, by Theorem 7.2. Thus, when showing convergence to zero in probability, we may always exchange $P_{n, 0}$ and $P_{n, U}$.

[^5]Let $C_{n}$ be the ball of radius $M_{n}$. By writing out the conditional densities we see that, for any measurable set $B$,

$$
P_{\bar{H}_{n} \mid \vec{X}_{n}}(B)-P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C_{n}}(B)=P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(C_{n}^{c} \cap B\right)-P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(C_{n}^{c}\right) P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C_{n}}(B) .
$$

Taking the supremum over $B$ yields the bound

$$
\left\|P_{\bar{H}_{n} \mid \vec{X}_{n}}-P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C_{n}}\right\| \leq 2 P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(C_{n}^{c}\right) .
$$

The right side will be shown to converge to zero in mean under $P_{n, U}$ for $U$ a ball of fixed radius around zero. First, by assumption and because $P_{n, U} \triangleleft P_{n, 0}$,

$$
P_{n, U} P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(C_{n}^{c}\right)=P_{n, U} P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(C_{n}^{c}\right)\left(1-\phi_{n}\right)+o(1) .
$$

Manipulating again the expressions for the posterior densities, we can rewrite the first term on the right as

$$
\frac{\Pi_{n}\left(C_{n}^{c}\right)}{\Pi_{n}(U)} P_{n, C_{n}^{c}} P_{\bar{H}_{n} \mid \vec{X}_{n}}(U)\left(1-\phi_{n}\right) \leq \frac{1}{\Pi_{n}(U)} \int_{C_{n}^{c}} P_{n, h}\left(1-\phi_{n}\right) d \Pi_{n}(h)
$$

For the tests given in the statement of the theorem, the integrand on the right converges to zero pointwise, but this is not enough. By Lemma 10.3, there automatically exist tests $\phi_{n}$ for which the convergence is exponentially fast. For the tests given by the lemma the preceding display is bounded above by

$$
\frac{1}{\Pi_{n}(U)} \int_{\|h\| \geq M_{n}} e^{-c\left(\|h\|^{2} \wedge n\right)} d \Pi_{n}(h)
$$

Here $\Pi_{n}(U)=\Pi\left(\theta_{0}+U / \sqrt{n}\right)$ is bounded below by a term of the order $1 / \sqrt{n}^{k}$, by the positivity and continuity of the density $\pi$ at $\theta_{0}$. Splitting the integral into the domains $M_{n} \leq\|h\| \leq D \sqrt{n}$ and $\|h\| \geq D \sqrt{n}$ for $D \leq 1$ sufficiently small that $\pi(\theta)$ is uniformly bounded on $\left\|\theta-\theta_{0}\right\| \leq D$, we see that the expression is bounded above by a multiple of

$$
\int_{\|h\| \geq M_{n}} e^{-c\|h\|^{2}} d h+\sqrt{n}^{k} e^{-c D^{2} n}
$$

This converges to zero as $n, M_{n} \rightarrow \infty$.
In the second part of the proof, let $C$ be the ball of fixed radius $M$ around zero, and let $N^{C}(\mu, \Sigma)$ be the normal distribution restricted and renormalized to $C$. The total variation distance between two arbitrary probability measures $P$ and $Q$ can be expressed in the form $\|P-Q\|=2 \int(1-p / q)^{+} d Q$. It follows that

$$
\begin{aligned}
& \frac{1}{2}\left\|N^{C}\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)-P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C}\right\| \\
& \quad=\int\left(1-\frac{d N^{C}\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)(h)}{1_{C}(h) p_{n, h}\left(\vec{X}_{n}\right) \pi_{n}(h) / \int_{C} p_{n, g}\left(\vec{X}_{n}\right) \pi_{n}(g) d g}\right)^{+} d P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C}(h) \\
& \quad \leq \iint\left(1-\frac{p_{n, g}\left(\vec{X}_{n}\right) \pi_{n}(g) d N^{C}\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)(h)}{p_{n, h}\left(\vec{X}_{n}\right) \pi_{n}(h) d N^{C}\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)(g)}\right)^{+} d N^{C}\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)(g) d P_{\bar{H}_{n} \mid \vec{X}_{n}}^{C}(h),
\end{aligned}
$$

because $(1-\mathrm{E} Y)^{+} \leq \mathrm{E}(1-Y)^{+}$. This can be further bounded by replacing the third occurrence of $N^{C}\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)$ by a multiple of the uniform measure $\lambda_{C}$ on $C$. By the dominated-convergence theorem, the double integral on the right side converges to zero in mean under $P_{n, C}$ if the integrand converges to zero in probability under the measure

$$
P_{n, C}(d x) P_{\bar{H}_{n} \mid \vec{X}_{n}=x}^{C}(d h) \lambda_{C}(d g)=\Pi_{n}^{C}(d h) P_{n, h}(d x) \lambda_{C}(d g)
$$

(Note that $P_{n, C}$ is the marginal distribution of $\vec{X}_{n}$ under the Bayesian model with prior $\Pi_{n}^{C}$.) Here $\Pi_{n}^{C}$ is bounded up to a constant by $\lambda_{C}$ for every sufficiently large $n$. Because $P_{n, h} \triangleleft \triangleright P_{n, 0}$ for every $h$, the sequence of measures on the right is contiguous with respect to the measures $\lambda_{C}(d h) P_{n, 0}(d x) \lambda_{C}(d g)$. The integrand converges to zero in probability under the latter measure by Theorem 7.2 and the continuity of $\pi$ at $\theta_{0}$.

This is true for every ball $C$ of fixed radius $M$ and hence also for some $M_{n} \rightarrow \infty$.
10.3 Lemma. Under the conditions of Theorem 10.1, there exists for every $M_{n} \rightarrow \infty$ a sequence of tests $\phi_{n}$ and a constant $c>0$ such that, for every sufficiently large $n$ and every $\left\|\theta-\theta_{0}\right\| \geq M_{n} / \sqrt{n}$,

$$
P_{\theta_{0}}^{n} \phi_{n} \rightarrow 0, \quad P_{\theta}^{n}\left(1-\phi_{n}\right) \leq e^{-c n\left(\left\|\theta-\theta_{0}\right\|^{2} \wedge 1\right)} .
$$

Proof. We shall construct two sequences of tests, which "work" for the ranges $M_{n} / \sqrt{n} \leq \left\|\theta-\theta_{0}\right\| \leq \varepsilon$ and $\left\|\theta-\theta_{0}\right\|>\varepsilon$, respectively, and a given $\varepsilon>0$. Then the $\phi_{n}$ of the lemma can be defined as the maximum of the two sequences.

First consider the range $M_{n} / \sqrt{n} \leq\left\|\theta-\theta_{0}\right\| \leq \varepsilon$. Let $\dot{\ell}_{\theta_{0}}^{L}$ be the score function truncated (coordinatewise) to the interval $[-L, L]$. By the dominated convergence theorem, $P_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{L} \dot{\ell}_{\theta_{0}}^{T} \rightarrow I_{\theta_{0}}$ as $L \rightarrow \infty$. Hence, there exists $L>0$ such that the matrix $P_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{L} \dot{\ell}_{\theta_{0}}^{T}$ is nonsingular. Fix such an $L$ and define

$$
\omega_{n}=1\left\{\left\|\left(\mathbb{P}_{n}-P_{\theta_{0}}\right) \dot{\ell}_{\theta_{0}}^{L}\right\| \geq \sqrt{M_{n} / n}\right\} .
$$

By the central limit theorem, $P_{\theta_{0}}^{n} \omega_{n} \rightarrow 0$, so that $\omega_{n}$ satisfies the first requirement. By the triangle inequality,

$$
\left\|\left(\mathbb{P}_{n}-P_{\theta}\right) \dot{\ell}_{\theta_{0}}^{L}\right\| \geq\left\|\left(P_{\theta_{0}}-P_{\theta}\right) \dot{\ell}_{\theta_{0}}^{L}\right\|-\left\|\left(\mathbb{P}_{n}-P_{\theta_{0}}\right) \dot{\ell}_{\theta_{0}}^{L}\right\| .
$$

Because, by the differentiability of the model, $P_{\theta} \dot{\ell}_{\theta_{0}}^{L}-P_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{L}=\left(P_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{L} \dot{\ell}_{\theta_{0}}^{T}+o(1)\right)\left(\theta-\theta_{0}\right)$, the first term on the right is bounded below by $c\left\|\theta-\theta_{0}\right\|$ for some $c>0$, for every $\theta$ that is sufficiently close to $\theta_{0}$, say for $\left\|\theta-\theta_{0}\right\|<\varepsilon$. If $\omega_{n}=0$, then the second term (without the minus sign) is bounded above by $\sqrt{M_{n} / n}$. Consequently, for every $c\left\|\theta-\theta_{0}\right\| \geq 2 \sqrt{M_{n} / n}$, and hence for every $\left\|\theta-\theta_{0}\right\| \geq M_{n} / \sqrt{n}$ and every sufficiently large $n$,

$$
P_{\theta}^{n}\left(1-\omega_{n}\right) \leq P_{\theta}\left(\left\|\left(\mathbb{P}_{n}-P_{\theta}\right) \dot{\ell}_{\theta_{0}}^{L}\right\| \geq \frac{1}{2} c\left\|\theta-\theta_{0}\right\|\right) \leq e^{-C n\left\|\theta-\theta_{0}\right\|^{2}},
$$

by Hoeffding's inequality (e.g., Appendix B in [117]), for a sufficiently small constant C.
Next, consider the range $\left\|\theta-\theta_{0}\right\|>\varepsilon$ for an arbitrary fixed $\varepsilon>0$. By assumption there exist tests $\phi_{n}$ such that

$$
P_{\theta_{0}}^{n} \phi_{n} \rightarrow 0, \quad \sup _{\left\|\theta-\theta_{0}\right\|>\varepsilon} P_{\theta}^{n}\left(1-\phi_{n}\right) \rightarrow 0 .
$$

It suffices to show that these tests can be replaced, if necessary, by tests for which the convergence to zero is exponentially fast. Fix $k$ large enough such that $P_{\theta_{0}}^{k} \phi_{k}$ and $P_{\theta}^{k}\left(1-\phi_{k}\right)$ are smaller than $1 / 4$ for every $\left\|\theta-\theta_{0}\right\|>\varepsilon$. Let $n=m k+r$ for $0 \leq r<k$, and define $Y_{n, 1}, \ldots, Y_{n, m}$ as $\phi_{k}$ applied in turn to $X_{1}, \ldots, X_{k}$, to $X_{k+1}, \ldots, X_{2 k}$, and so forth. Let $\bar{Y}_{n, m}$ be their average and then define $\omega_{n}=1\left\{\bar{Y}_{n, m} \geq 1 / 2\right\}$. Because $\mathrm{E}_{\theta} Y_{n, j} \geq 3 / 4$ for every $\left\|\theta-\theta_{0}\right\|>\varepsilon$ and every $j$, Hoeffding's inequality implies that

$$
P_{\theta}^{n}\left(1-\omega_{n}\right)=P_{\theta}\left(\bar{Y}_{n, m}<1 / 2\right) \leq e^{-2 m\left(\frac{1}{2}-\frac{3}{4}\right)^{2}} \leq e^{-m / 8}
$$

Because $m$ is proportional to $n$, this gives the desired exponential decay. Because $\mathrm{E}_{\theta_{0}} Y_{n, j} \leq 1 / 4$, the expectations $P_{\theta_{0}}^{n} \omega_{n}$ are similarly bounded.

The Bernstein-von Mises theorem is sometimes written with a different "centering sequence." By Theorem 8.14 any sequence of standardized asymptotically efficient estimators $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ is asymptotically equivalent in probability to $\Delta_{n, \theta}$. Because the total variation distance

$$
\left\|N\left(\Delta_{n, \theta}, I_{\theta}^{-1}\right)-N\left(\sqrt{n}\left(\hat{\theta}_{n}-\theta\right), I_{\theta}^{-1}\right)\right\|
$$

is bounded by a multiple of $\left\|\Delta_{n, \theta}-\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)\right\|$, any such sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ may replace $\Delta_{n, \theta}$ in the Bernstein-von Mises theorem. By the invariance of the total variation norm under location and scale changes, the resulting statement can be written

$$
\left\|P_{\bar{\Theta}_{n} \mid X_{1}, \ldots, X_{n}}-N\left(\hat{\theta}_{n}, \frac{1}{n} I_{\theta}^{-1}\right)\right\| \xrightarrow{P_{\theta}^{n}} 0 .
$$

Under regularity conditions this is true for the maximum likelihood estimators $\hat{\theta}_{n}$. Combining this with Theorem 5.39 we then have, informally,

$$
P_{\bar{\Theta}_{n} \mid \hat{\theta}_{n}} \approx N\left(\hat{\theta}_{n}, \frac{1}{n} I_{\hat{\theta}_{n}}^{-1}\right) \quad \text { and } \quad P_{\hat{\theta}_{n} \mid \bar{\Theta}_{n}} \approx N\left(\bar{\Theta}_{n}, \frac{1}{n} I_{\bar{\Theta}_{n}}^{-1}\right),
$$

since conditioning $\hat{\theta}_{n}$ on $\bar{\Theta}_{n}=\theta$ gives the usual "frequentist" distribution of $\hat{\theta}_{n}$ under $\theta$. This gives a remarkable symmetry.

Le Cam's version of the Bernstein-von Mises theorem requires the existence of tests that are uniformly consistent for testing $H_{0}: \theta=\theta_{0}$ versus $H_{1}:\left\|\theta-\theta_{0}\right\| \geq \varepsilon$, for every $\varepsilon>0$. Such tests certainly exist if there exist estimators $T_{n}$ that are uniformly consistent, in that, for every $\varepsilon>0$,

$$
\sup _{\theta} P_{\theta}\left(\left\|T_{n}-\theta\right\| \geq \varepsilon\right) \rightarrow 0
$$

In that case, we can define $\phi_{n}=1\left\{\left\|T_{n}-\theta_{0}\right\| \geq \varepsilon / 2\right\}$. Thus the condition of the Bernsteinvon Mises theorem that certain tests exist can be replaced by the condition that uniformly consistent estimators exist. This is often the case. For instance, the next lemma shows that this is the case for a Euclidean sample space $\mathcal{X}$ provided, for $F_{\theta}$ the distribution functions corresponding to the $P_{\theta}$,

$$
\inf _{\left\|\theta-\theta^{\prime}\right\|>\varepsilon}\left\|F_{\theta}-F_{\theta^{\prime}}\right\|_{\infty}>0 .
$$

For compact parameter sets, this is implied by identifiability and continuity of the maps $\theta \mapsto F_{\theta}$. We generalize and formalize this in a second lemma, which shows that uniformity on compact subsets is always achievable if the model ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean at every $\theta$ and the parameter $\theta$ is identifiable.

A class of measurable functions $\mathcal{F}$ is a uniform Glivenko-Cantelli class (in probability) if, for every $\varepsilon>0$,

$$
\sup _{P} P_{P}\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}>\varepsilon\right) \rightarrow 0
$$

Here the supremum is taken over all probability measures $P$ on the sample space, and $\|Q\|_{\mathcal{F}}=\sup _{f \in \mathcal{F}}|Q f|$. An example is the collection of indicators of all cells ( $-\infty, t$ ] in a Euclidean sample space.
10.4 Lemma. Suppose that there exists a uniform Glivenko-Cantelli class $\mathcal{F}$ such that, for every $\varepsilon>0$,

$$
\begin{equation*}
\inf _{d\left(\theta, \theta^{\prime}\right)>\varepsilon}\left\|P_{\theta}-P_{\theta^{\prime}}\right\|_{\mathcal{F}}>0 \tag{10.5}
\end{equation*}
$$

Then there exists a sequence of estimators that is uniformly consistent on $\Theta$ for estimating $\theta$.
10.6 Lemma. Suppose that $\Theta$ is $\sigma$-compact, $P_{\theta} \neq P_{\theta^{\prime}}$ for every pair $\theta \neq \theta^{\prime}$, and the maps $\theta \mapsto P_{\theta}$ are continuous for the total variation norm. Then there exists a sequence of estimators that is uniformly consistent on every compact subset of $\Theta$.

Proof. For the proof of the first lemma, define $\hat{\theta}_{n}$ to be a point of (near) minimum of the map $\theta \mapsto\left\|\mathbb{P}_{n}-P_{\theta}\right\|_{\mathcal{F}}$. Then, by the triangle inequality and the definition of $\hat{\theta}_{n}$, $\left\|P_{\hat{\theta}_{n}}-P_{\theta}\right\|_{\mathcal{F}} \leq 2\left\|\mathbb{P}_{n}-P_{\theta}\right\|_{\mathcal{F}}+1 / n$, if the near minimum is chosen within distance $1 / n$ of the true infimum. Fix $\varepsilon>0$, and let $\delta$ be the positive number given in condition (10.5). Then

$$
P_{\theta}\left(d\left(\hat{\theta}_{n}, \theta\right)>\varepsilon\right) \leq P_{\theta}\left(\left\|P_{\hat{\theta}_{n}}-P_{\theta}\right\|_{\mathcal{F}} \geq \delta\right) \leq P_{\theta}\left(2\left\|\mathbb{P}_{n}-P_{\theta}\right\|_{\mathcal{F}} \geq \delta-\frac{1}{n}\right)
$$

By assumption, the right side converges to zero uniformly in $\theta$.
For the proof of the second lemma, first assume that $\Theta$ is compact. Then there exists a uniform Glivenko-Cantelli class that satisfies the condition of the first lemma. To see this, first find a sequence $A_{1}, A_{2}, \ldots$ of measurable sets that separates the points $P_{\theta}$. Thus, for every pair $\theta, \theta^{\prime} \in \Theta$, if $P_{\theta}\left(A_{i}\right)=P_{\theta^{\prime}}\left(A_{i}\right)$ for every $i$, then $\theta=\theta^{\prime}$. A separating collection exists by the identifiability of the parameter, and it can be taken to be countable by the continuity of the maps $\theta \mapsto P_{\theta}$. (For a Euclidean sample space, we can use the cells $(-\infty, t]$ for $t$ ranging over the vectors with rational coordinates. More generally, see the lemma below.) Let $\mathcal{F}$ be the collection of functions $x \mapsto i^{-1} 1_{A_{t}}(x)$. Then the map $h: \Theta \mapsto \ell^{\infty}(\mathcal{F})$ given by $\theta \mapsto\left(P_{\theta} f\right)_{f \in \mathcal{F}}$ is continuous and one-to-one. By the compactness of $\Theta$, the inverse $h^{-1}: h(\Theta) \mapsto \Theta$ is automatically uniformly continuous. Thus, for every $\varepsilon>0$ there exists $\delta>0$ such that

$$
\left\|h(\theta)-h\left(\theta^{\prime}\right)\right\|_{\mathcal{F}} \leq \delta \quad \text { implies } \quad d\left(\theta, \theta^{\prime}\right) \leq \varepsilon .
$$

This means that (10.5) is satisfied. The class $\mathcal{F}$ is also a uniform Glivenko-Cantelli class, because by Chebyshev's inequality,

$$
P_{P}\left(\left\|\mathbb{P}_{n}-P\right\|_{\mathcal{F}}>\varepsilon\right) \leq \sum_{f} P_{P}\left(\left|\mathbb{P}_{n} f-P f\right|>\varepsilon\right) \leq \sum_{i} \frac{1}{n \varepsilon^{2} i^{2}} .
$$

This concludes the proof of the second lemma for compact $\Theta$.
To remove the compactness condition, write $\Theta$ as the union of an increasing sequence of compact sets $K_{1} \subset K_{2} \subset \cdots$. For every $m$ there exists a sequence of estimators $T_{n, m}$ that is uniformly consistent on $K_{m}$, by the preceding argument. Thus, for every fixed $m$,

$$
a_{n, m}:=\sup _{\theta \in K_{m}} P_{\theta}\left(d\left(T_{n, m}, \theta\right) \geq \frac{1}{m}\right) \rightarrow 0, \quad n \rightarrow \infty .
$$

Then there exists a sequence $m_{n} \rightarrow \infty$ such that $a_{n, m_{n}} \rightarrow 0$ as $n \rightarrow \infty$. It is not hard to see that $\hat{\theta}_{n}=T_{n, m_{a}}$ satisfies the requirements. $\square$

As a consequence of the second lemma, if there exists a sequence of tests $\phi_{n}$ such that (10.2) holds for some $\varepsilon>0$, then it holds for every $\varepsilon>0$. In that case we can replace the given sequence $\phi_{n}$ by the minimum of $\phi_{n}$ and the tests $1\left\{\left\|T_{n}-\theta_{0}\right\| \geq \varepsilon / 2\right\}$ for a sequence of estimators $T_{n}$ that is uniformly consistent on a sufficiently large subset of $\Theta$.
10.7 Lemma. Let the set of probability measures $\mathcal{P}$ on a measurable space $(\mathcal{X}, \mathcal{A})$ be separable for the total variation norm. Then there exists a countable subset $\mathcal{A}_{0} \subset \mathcal{A}$ such that $P_{1}=P_{2}$ on $\mathcal{A}_{0}$ implies $P_{1}=P_{2}$ for every $P_{1}, P_{2} \in P$.

Proof. The set $\mathcal{P}$ can be identified with a subset of $L_{1}(\mu)$ for a suitable probability measure $\mu$. For instance, $\mu$ can be taken a convex linear combination of a countable dense set. Let $\mathcal{P}_{0}$ be a countable dense subset, and let $\mathcal{A}_{0}$ be the set of all finite intersections of the sets $p^{-1}(B)$ for $p$ ranging over a choice of densities of the set $\mathcal{P}_{0} \subset L_{1}(\mu)$ and $B$ ranging over a countable generator of the Borel sets in $\mathbb{R}$.

Then every density $p \in \mathcal{P}_{0}$ is $\sigma\left(\mathcal{A}_{0}\right)$-measurable by construction. A density of a measure $P \in P-P_{0}$ can be approximated in $L_{1}(\mu)$ by a sequence from $P_{0}$ and hence can be chosen $\sigma\left(\mathcal{A}_{0}\right)$-measurable, without loss of generality.

Because $\mathcal{A}_{0}$ is intersection-stable (a " $\pi$-system"), two probability measures that agree on $\mathcal{A}_{0}$ automatically agree on the $\sigma$-field $\sigma\left(\mathcal{A}_{0}\right)$ generated by $\mathcal{A}_{0}$. Then they also give the same expectation to every $\sigma\left(\mathcal{A}_{0}\right)$-measurable function $f: \mathcal{X} \mapsto[0,1]$. If the measures have $\sigma\left(\mathcal{A}_{0}\right)$-measurable densities, then they must agree on $\mathcal{A}$, because $P(A)=\mathrm{E}_{\mu} \mathrm{I}_{A} p= \mathrm{E}_{\mu} \mathrm{E}_{\mu}\left(1_{\lambda} \mid \sigma\left(\mathcal{A}_{0}\right)\right) p$ if $p$ is $\sigma\left(\mathcal{A}_{0}\right)$-measurable.

### 10.3 Point Estimators

The Bernstein-von Mises theorem shows that the posterior laws converge in distribution to a Gaussian posterior law in total variation distance. As a consequence, any location functional that is suitably continuous relative to the total variation norm applied to the sequence of
posterior laws converges to the same location functional applied to the limiting Gaussian posterior distribution. For most choices this means to $X$, or a $N\left(0, I_{\theta_{0}}^{-1}\right)$-distribution.

In this section we consider more general Bayes point estimators that are defined as the minimizers of the posterior risk functions relative to some loss function. For a given loss function $\ell: \mathbb{R}^{k} \mapsto[0, \infty)$, let $T_{n}$, for fixed $X_{1} \ldots, X_{n}$, minimize the posterior risk

$$
t \mapsto \frac{\int \ell(\sqrt{n}(t-\theta)) \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right) d \Pi(\theta)}{\int \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right) d \Pi(\theta)} .
$$

It is not immediately clear that the minimizing values $T_{n}$ can be selected as a measurable function of the observations. This is an implicit assumption, or otherwise the statements are to be understood relative to outer probabilities. We also make it an implicit assumption that the integrals in the preceding display exist, for almost every sequence of observations.

To derive the limit distribution of $\sqrt{n}\left(T_{n}-\theta_{0}\right)$, we apply general results on $M$-estimators, in particular the argmax continuous-mapping theorem, Theorem 5.56.

We restrict ourselves to loss functions with the property, for every $M>0$,

$$
\sup _{\| h \leq M} \ell(h) \leq \inf _{\| h \geq 2 M} \ell(h),
$$

with strict inequality for at least one $M .^{\dagger}$ This is true, for instance, for loss functions of the form $\ell(h)=\ell_{0}(\|h\|)$ for a nondecreasing function $\ell_{0}:[0, \infty) \mapsto[0, \infty)$ that is not constant on $(0, \infty)$. Furthermore, we suppose that $\ell$ grows at most polynomially: For some constant $p \geq 0$,

$$
\ell(h) \leq 1+\|h\|^{p} .
$$

10.8 Theorem. Let the conditions of Theorem 10.1 hold, and let $\ell$ satisfy the conditions as listed, for a $p$ such that $\int\|\theta\|^{p} d \Pi(\theta)<\infty$. Then the sequence $\sqrt{n}\left(T_{n}-\theta_{0}\right)$ converges under $\theta_{0}$ in distribution to the minimizer of $t \mapsto \int \ell(t-h) d N\left(X, I_{\theta_{0}}^{-1}\right)(h)$, for $X$ possessing the $N\left(0, I_{\theta_{0}}^{-1}\right)$-distribution, provided that any two minimizers of this process coincide almost surely. In particular, for every nonzero, subconvex loss function it converges to X.
*Proof. We adopt the notation as listed in the first paragraph of the proof of Theorem 10.1. The last assertion of the theorem is a consequence of Anderson's lemma, Lemma 8.5.

The standardized estimator $\sqrt{n}\left(T_{n}-\theta_{0}\right)$ minimizes the function

$$
t \mapsto Z_{n}(t)=\frac{\int \ell(t-h) p_{n, h}\left(\vec{X}_{n}\right) d \Pi_{n}(h)}{\int p_{n, h}\left(\vec{X}_{n}\right) d \Pi_{n}(h)}=P_{\vec{H}_{a} \mid \vec{X}_{a}} \ell_{t},
$$

where $\ell_{1}$ is the function $h \mapsto \ell(t-h)$. The proof consists of three parts. First it is shown that integrals over the sets $\|h\| \geq M_{n}$ can be neglected for every $M_{n} \rightarrow \infty$. Next, it is proved that the sequence $\sqrt{n}\left(T_{n}-\theta_{0}\right)$ is uniformly tight. Finally, it is shown that the stochastic processes $t \mapsto Z_{n}(t)$ converge in distribution in the space $\ell^{\infty}(K)$, for every compact $K$, to the process

$$
t \mapsto Z(t)=\int \ell(t-h) d N\left(X, I_{\theta_{0}}^{-1}\right)(h) .
$$

[^6]The sample paths of this limit process are continuous in $t$, in view of the subexponential growth of $\ell$ and the smoothness of the normal density. Hence the theorem follows from the argmax theorem, Corollary 5.58.

Let $C_{n}$ be the ball of radius $M_{n}$ for a given, arbitrary sequence $M_{n} \rightarrow \infty$. We first show that, for every measurable function $f$ that grows subpolynomially of order $p$,

$$
\begin{equation*}
P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(f 1_{C_{n}^{c}}\right) \xrightarrow{P_{n, 0}} 0 . \tag{10.9}
\end{equation*}
$$

To see this, we utilize the tests $\phi_{n}$ for testing $H_{0}: \theta=\theta_{0}$ that exist by assumption. In view of Lemma 10.3, these may be assumed without loss of generality to satisfy the stronger property as given in the statement of this lemma. Furthermore, they can be constructed to be nonrandomized (i.e., to have range $\{0,1\}$ ). Then it is immediate that $\left(P_{\bar{H}_{n} \mid \vec{X}_{n}} f\right) \phi_{n}$ converges to zero in $P_{n, 0}$-probability for every measurable function $f$. Next, by writing out the posterior densities, we see that, for $U$ a fixed ball around the origin,

$$
\begin{aligned}
P_{n, U} P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(f 1_{C_{n}^{c}}\right)\left(1-\phi_{n}\right) & =\frac{1}{\Pi_{n}(U)} \int_{C_{n}^{c}} f(h) P_{n, h}\left[P_{\bar{H}_{n} \mid \vec{X}_{n}}(U)\left(1-\phi_{n}\right)\right] d \Pi_{n}(h) \\
& \leq \frac{1}{\Pi_{n}(U)} \int_{C_{n}^{c}}\left(1+\|h\|^{p}\right) e^{-c\left(\|h\|^{2} \wedge n\right)} d \Pi_{n}(h)
\end{aligned}
$$

Here $\Pi_{n}(U)$ is bounded below by a term of the order $1 / \sqrt{n}^{k}$, by the positivity and continuity at $\theta_{0}$ of the prior density $\pi$. Split the integral over the domains $M_{n} \leq\|h\| \leq D \sqrt{n}$ and $\|h\| \geq D \sqrt{n}$, and use the fact that $\int\|\theta\|^{p} d \Pi(\theta)<\infty$ to bound the right side of the display by terms of the order $e^{-A M_{n}^{2}}$ and $\sqrt{n}^{k+p} e^{-B n}$, for some $A, B>0$. These converge to zero, whence (10.9) has been proved.

Define $\bar{\ell}(M)$ as the supremum of $\ell(h)$ over the ball of radius $M$, and $\underline{\ell}(M)$ as the infimum over the complement of this ball. By assumption, there exists $\delta>0$ such that $\eta:=\underline{\ell}(2 \delta)-\bar{\ell}(\delta)>0$. Let $U$ be the ball of radius $\delta$ around 0 . For every $\|t\| \geq 3 M_{n}$ and sufficiently large $M_{n}$, we have $\ell(t-h)-\ell(-h) \geq \eta$ if $h \in U$, and $\ell(t-h)-\ell(-h) \geq \underline{\ell}\left(2 M_{n}\right)-\bar{\ell}\left(M_{n}\right) \geq 0$ if $h \in U^{c} \cap C_{n}$, by assumption. Therefore,

$$
\begin{aligned}
Z_{n}(t)-Z_{n}(0) & =P_{\bar{H}_{n} \mid \vec{X}_{n}}\left[(\ell(t-h)-\ell(-h))\left(1_{U}+1_{U^{c} \cap C_{n}}+1_{C_{n}^{c}}\right)\right] \\
& \geq \eta P_{\bar{H}_{n} \mid \vec{X}_{n}}(U)-P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(\ell(-h) 1_{C_{n}^{c}}\right)
\end{aligned}
$$

Here the posterior probability $P_{\bar{H}_{n} \mid \vec{X}_{n}}(U)$ of $U$ converges in distribution to $N\left(X, I_{\theta_{0}}^{-1}\right)(U)$, by the Bernstein-von Mises theorem. This limit is positive almost surely. The second term in the preceding display converges to zero in probability by (10.9). Conclude that the infimum of $Z_{n}(t)-Z_{n}(0)$ over the set of $t$ with $\|t\| \geq 3 M_{n}$ is bounded below by variables that converge in distribution to a strictly positive variable. Thus this infimum is positive with probability tending to one. This implies that the probability that $t \mapsto Z_{n}(t)$ has a minimizer in the set $\|t\| \geq 3 M_{n}$ converges to zero. Because this is true for any $M_{n} \rightarrow \infty$, it follows that the sequence $\sqrt{n}\left(T_{n}-\theta_{0}\right)$ is uniformly tight.

Let $C$ be the ball of fixed radius $M$ around 0 , and fix some compact set $K \subset \mathbb{R}^{k}$. Define stochastic processes

$$
\begin{aligned}
Z_{n, M}(t)=P_{\bar{H}_{n} \mid \vec{X}_{n}}\left(\ell_{t} 1_{C}\right), \quad W_{n, M} & =N\left(\Delta_{n, \theta_{0}}, I_{\theta_{0}}^{-1}\right)\left(\ell_{t} 1_{C}\right), \\
W_{M} & =N\left(X, I_{\theta_{0}}^{-1}\right)\left(\ell_{t} 1_{C}\right) .
\end{aligned}
$$

The function $h \mapsto \ell(t-h) 1_{C}(h)$ is bounded, uniformly if $t$ ranges over the compact $K$. Hence, by the Bernstein-von Mises theorem, $Z_{n, M}-W_{n, M} \xrightarrow{\mathrm{P}} 0$ in $\ell^{\infty}(K)$ as $n \rightarrow \infty$, for every fixed $M$. Second, by the continuous-mapping theorem, $W_{n, M} \rightsquigarrow W_{M}$ in $\ell^{\infty}(K)$, as $n \rightarrow \infty$, for fixed $M$. Next $W_{M} \xrightarrow{\mathrm{P}} Z$ in $\ell^{\infty}(K)$ as $M \rightarrow \infty$, or equivalently $C \uparrow \mathbb{R}^{k}$. Conclude that there exists a sequence $M_{n} \rightarrow \infty$ such that the processes $Z_{n, M_{n}} \leadsto Z$ in $\ell^{\infty}(K)$. Because, by $(10.9), Z_{n}(t)-Z_{n, M_{n}}(t) \xrightarrow{\mathrm{P}} 0$, we finally conclude that $Z_{n} \rightsquigarrow Z$ in $\ell^{\infty}(K)$.

## *10.4 Consistency

A sequence of posterior measures $P_{\bar{\Theta}_{n} \mid X_{1}, \ldots, X_{n}}$ is called consistent under $\theta$ if under $P_{\theta}^{\infty}$ probability it converges in distribution to the measure $\delta_{\theta}$ that is degenerate at $\theta$, in probability; it is strongly consistent if this happens for almost every sequence $X_{1}, X_{2}, \ldots$.

Given that, usually, ordinarily consistent point estimators of $\theta$ exist, consistency of posterior measures is a modest requirement. If we could know $\theta$ with almost complete accuracy as $n \rightarrow \infty$, then we would use a Bayes estimator only if this would also yield the true value with similar accuracy. Fortunately, posterior measures are usually consistent. The following famous theorem by Doob shows that under hardly any conditions we already have consistency under almost every parameter.

Recall that $\Theta$ is assumed to be Euclidean and the maps $\theta \mapsto P_{\theta}(A)$ to be measurable for every measurable set $A$.
10.10 Theorem (Doob's consistency theorem). Suppose that the sample space $(\mathcal{X}, \mathcal{A})$ is a subset of Euclidean space with its Borel $\sigma$-field. Suppose that $P_{\theta} \neq P_{\theta^{\prime}}$ whenever $\theta \neq \theta^{\prime}$. Then for every prior probability measure $\Pi$ on $\Theta$ the sequence of posterior measures is consistent for $\Pi$-almost every $\theta$.

Proof. On an arbitrary probability space construct random vectors $\bar{\Theta}$ and $X_{1}, X_{2}, \ldots$ such that $\bar{\Theta}$ is marginally distributed according to $\Pi$ and such that given $\bar{\Theta}=\theta$ the vectors $X_{1}, X_{2}, \ldots$ are i.i.d. according to $P_{\theta}$. Then the posterior distribution based on the first $n$ observations is $P_{\bar{\Theta} \mid X_{1}, \ldots, X_{n}}$. Let $Q$ be the distribution of $\left(X_{1}, X_{2}, \ldots, \bar{\Theta}\right)$ on $\mathcal{X}^{\infty} \times \Theta$.

The main part of the proof consists of showing that there exists a measurable function $h: \mathcal{X}^{\infty} \mapsto \Theta$ with

$$
\begin{equation*}
h\left(x_{1}, x_{2}, \ldots\right)=\theta, \quad Q \text {-a.s.. } \tag{10.11}
\end{equation*}
$$

Suppose that this is true. Then, for any bounded, measurable function $f: \Theta \mapsto \mathbb{R}$, by Doob's martingale convergence theorem,

$$
\begin{aligned}
\mathrm{E}\left(f(\bar{\Theta}) \mid X_{1}, \ldots, X_{n}\right) & \rightarrow \mathrm{E}\left(f(\bar{\Theta}) \mid X_{1}, X_{2}, \ldots\right) \\
& =f\left(h\left(X_{1}, X_{2}, \ldots\right)\right), \quad Q \text {-a.s.. }
\end{aligned}
$$

By Lemma 2.25 there exists a countable collection $\mathcal{F}$ of bounded, continuous functions $f$ that are determining for convergence in distribution. Because the countable union of the associated null sets on which the convergence of the preceding display fails is a null set, we have that

$$
P_{\bar{\Theta} \mid X_{1}, \ldots, X_{n}} \rightsquigarrow \delta_{h\left(X_{1}, X_{2}, \ldots\right)}, \quad Q \text {-a.s.. }
$$

This statement refers to the marginal distribution of $\left(X_{1}, X_{2}, \ldots\right)$ under $Q$. We wish to translate it into a statement concerning the $P_{\theta}{ }^{\infty}$-measures. Let $C \subset X^{\infty} \times \Theta$ be the intersection of the sets on which the weak convergence holds and on which (15.9) is valid. By Fubini's theorem

$$
I=Q(C)=\iint I_{C}(x, \theta) d P_{\theta}^{\infty}(x) d \Pi(\theta)=\int P_{\theta}^{\infty}\left(C_{\theta}\right) d \Pi(\theta),
$$

where $C_{\theta}=\{x:(x, \theta) \in C\}$ is the horizontal section of $C$ at height $\theta$. It follows that $P_{\theta}^{\infty}\left(C_{\theta}\right)=1$ for $\Pi$-almost every $\theta$. For every $\theta$ such that $P_{\theta}^{\circlearrowright v}\left(C_{\theta}\right)=1$, we have that $(x, \theta) \in C$ for $P_{0}^{\infty}$-almost every sequence $x_{1}, x_{2}, \ldots$ and hence

$$
P_{\bar{G} \mid X_{1}=x_{1}, \ldots, X_{a}=x_{n}} \leadsto \delta_{h\left(x_{1}, x_{2} \ldots\right)}=\delta_{\theta} .
$$

This is the assertion of the theorem.
In order to establish (15.9), call a measurable function $f: \Theta \mapsto \mathbb{R}$ accessible if there exists a sequence of measurable functions $h_{n}: \chi^{\prime \prime} \mapsto \mathbb{R}$ such that

$$
\iint\left|h_{n}(x)-f(\theta)\right| \wedge 1 d Q(x, \theta) \rightarrow 0 .
$$

(Here we abuse notation in viewing $h_{n}$ also as a measurable function on $.^{\times \infty} \times \Theta$.) Then there also exists a (sub)sequence with $h_{k}(x) \rightarrow f(\theta)$ almost surely under $Q$, whence every accessible function $f$ is almost everywhere equal to an $\mathcal{A}^{\infty} \times\{\emptyset, \Theta\}$-measurable function. This is a measurable function of $x=\left(x_{1}, x_{2}, \ldots\right)$ alone. If we can show that the functions $f(\theta)=\theta_{i}$ are accessible, then (15.9) follows. We shall in fact show that every Borel measurable function is accessible.

By the strong law of large numbers, $h_{n}(x)=\sum_{i=1}^{n} l_{A}\left(x_{i}\right) \rightarrow P_{o}(A)$ almost surely under $P_{\theta}{ }^{\infty}$, for every $\theta$ and measurable set $A$. Consequently, by the dominated convergence theorem.

$$
\iint\left|h_{n}(x)-P_{0}(A)\right| d Q(x, \theta) \rightarrow 0 .
$$

Thus cach of the functions $\theta \mapsto P_{b}(A)$ is accessible.
Because $(\mathcal{X}, \mathcal{A})$ is Euclidean by assumption, there exists a countable measure-determining subcollection $\mathcal{A}_{0} \subset \mathcal{A}$. The functions $\theta \mapsto P_{\mathrm{e}}(A)$ are measurable by assumption and separate the points of $\Theta$ as $A$ ranges over $\mathcal{A}_{0}$, in view of the choice of $\mathcal{A}_{0}$ and the identifiability of the parameter $\theta$. This implies that these functions generate the Borel $\sigma$-field on $\Theta$, in view of Lemma 10.12.

The proof is complete once it is shown that every function that is measurable in the $\sigma$-field generated by the accessible functions (which is the Borel $\sigma$-field) is accessible. From the definition it follows easily that the set of accessible functions is a vector space, contains the constant functions, is closed under monotone limits, and is a lattice. The desired result therefore follows by a monotone class argument, as in Lemma 10.13.

The merit of the preceding theorem is that it imposes hardly any conditions, but its drawback is that it gives the consistency only up to null sets of possible parameters (depending on the prior). In certain ways these null sets can be quite large, and examples have
been constructed where Bayes estimators behave badly. To guarantee consistency under every parameter it is necessary to impose some further conditions. Because in this chapter we are mainly concerned with asymptotic normality of Bayes estimators (which implies consistency with a rate), we omit a discussion.
10.12 Lemma. Let $\mathcal{F}$ be a countable collection of mcasurable functions $f: \Theta \subset \mathbb{R}^{l} \mapsto \mathbb{R}$ that separates the points of $\Theta$. Then the Borel $\sigma$-field and the $\sigma$-field generated by $\mathcal{F}$ on $\Theta$ coincide.

Proof. By assumption, the map $h: \Theta \mapsto \mathbb{R}^{\mathcal{F}}$ defined by $h(\theta) f=f(\theta)$ is measurable and one-to-one. Because $\mathcal{F}$ is countable, the Borel $\sigma$-field on $\mathbb{R}^{\mathcal{F}}$ (for the product topology) is equal to the $\sigma$-field generated by the coordinate projections. Hence the $\sigma$-fields generated by $h$ and $\mathcal{F}$ (viewed as Borel measurable maps in $\mathbb{R}^{\mathcal{F}}$ and $\mathbb{R}$, respectively) on $\Theta$ are identical. Now $h^{-1}$, defined on the range of $h$, is automatically Borel measurable, by Proposition 8.3.5 in [24], and hence $\Theta$ and $h(\Theta)$ are Borel isomorphic. $\square$
10.13 Lemma. Let $\mathcal{F}$ be a linear subspace of $\mathcal{L}_{1}(\Pi)$ with the properties
(i) if $f, g \in \mathcal{F}$, then $f \wedge g \in \mathcal{F}$;
(ii) if $0 \leq f_{1} \leq f_{2} \leq \cdots \in \mathcal{F}$ and $f_{n} \uparrow f \in \mathcal{L}_{1}(\Pi)$, then $f \in \mathcal{F}$;
(iii) $1 \in \mathcal{F}$.

Then $\mathcal{F}$ contains every $\sigma(\mathcal{F})$-measurable function in $\mathcal{L}_{1}(\Pi)$.

Proof. Because any $\sigma(\mathcal{F})$-measurable nonnegative function is the monotone limit of a sequence of simple functions, it suffices to prove that $\mathrm{l}_{\mathrm{A}} \in \mathcal{F}$ for every $A \in \sigma(\mathcal{F})$. Define $\mathcal{A}_{0}=\left\{A: 1_{A} \in \mathcal{F}\right\}$. Then $\mathcal{A}_{0}$ is an intersection-stable Dynkin system and hence a $\sigma$-field. Furthermore, for every $f \in \mathcal{F}$ and $\alpha \in \mathbb{R}$, the functions $n(f-\alpha)^{+} \wedge l$ are contained in $\mathcal{F}$ and increase pointwise to $l_{|f>\alpha|}$. It follows that $\{f>\alpha\} \in \mathcal{A}_{0}$. Hence $\sigma(\mathcal{F}) \subset \mathcal{A}_{0}$. $\square$

## Notes

The Bernstein-von Mises theorem has that name, because, as Le Cam and Yang [97] write, it was first discovered by Laplace. The theorem that is presented in this chapter is considerably more elegant than the results by these early authors, and also much better than the result in Le Cam [91], who revived the theorem in order to prove results on superefficiency. We adapted it from Le Cam [96] and Le Cam and Yang [97].

Ibragimov and Hasminskii [80] discuss the convergence of Bayes point estimators in greater generality, and also cover non-Gaussian limit experiments, but their discussion of the i.i.d. case as discussed in the present chapter is limited to bounded parameter sets and requires stronger assumptions. Our treatment uses some elements of their proof, but is heavily based on Le Cam's Bernstein-von Mises theorem. Inspection of the proof shows that the conditions on the loss function can be relaxed significantly, for instance allowing exponential growth.

Doob's theorem originates in [39]. The potential null sets of inconsistency that it leaves open really exist in some situations particularly if the parameter set is infinite dimensional,
and have attracted much attention. See [34], which is accompanied by evaluations of the phenomenon by many authors, including Bayesians.

## PROBLEMS

1. Verify the conditions of the Bernstein-von Mises theorem for the experiment where $P_{\theta}$ is the Poisson measure of mean $\theta$.
2. Let $P_{\theta}$ be the $k$-dimensional normal distribution with mean $\theta$ and covariance matrix the identify. Find the a posteriori law for the prior $\Pi=N(\tau, \Lambda)$ and some nonsingular matrix $\Lambda$. Can you see directly that the Bernstein-von Mises theorem is true in this case?
3. Let $P_{\theta}$ be the Bernoulli distribution with mean $\theta$. Find the posterior distribution relative to the beta-prior measure, which has density

$$
\theta \mapsto \frac{\Gamma(\alpha) \Gamma(\beta)}{\Gamma(\alpha+\beta)} \theta^{\alpha-1}(1-\theta)^{\beta-1} 1_{(0,1)}(\theta)
$$

4. Suppose that, in the case of a one-dimensional parameter, we use the loss function $\ell(h)= 1_{(-1,2)}(h)$. Find the limit distribution of the corresponding Bayes point estimator, assuming that the conditions of the Bernstein-von Mises theorem hold.

## 11

## Projections

> A projection of a random variable is defined as a closest element in a given set of functions. We can use projections to derive the asymptotic distribution of a sequence of variables by comparing these to projections of a simple form. Conditional expectations are special projections. The Hajek projection is a sum of independent variables; it is the leading term in the Hoeffding decomposition.

### 11.1 Projections

A common method to derive the limit distribution of a sequence of statistics $T_{n}$ is to show that it is asymptotically equivalent to a sequence $S_{n}$ of which the limit behavior is known. The basis of this method is Slutsky's lemma, which shows that the sequence $T_{n}=T_{n}-S_{n}+S_{n}$ converges in distribution to $S$ if both $T_{n}-S_{n} \xrightarrow{\mathrm{P}} 0$ and $S_{n} \rightsquigarrow S$.

How do we find a suitable sequence $S_{n}$ ? First, the variables $S_{n}$ must be of a simple form, because the limit properties of the sequence $S_{n}$ must be known. Second, $S_{n}$ must be close enough. One solution is to search for the closest $S_{n}$ of a certain predetermined form. In this chapter, "closest" is taken as closest in square expectation.

Let $T$ and $\{S: S \in \mathcal{S}\}$ be random variables (defined on the same probability space) with finite second-moments. A random variable $\hat{S}$ is called a projection of $T$ onto $\mathcal{S}$ (or $L_{2}$-projection) if $\hat{S} \in \mathcal{S}$ and minimizes

$$
S \mapsto \mathrm{E}(T-S)^{2}, \quad S \in \mathcal{S} .
$$

Often $\mathcal{S}$ is a linear space in the sense that $\alpha_{1} S_{1}+\alpha_{2} S_{2}$ is in $\mathcal{S}$ for every $\alpha_{1}, \alpha_{2} \in R$, whenever $S_{1}, S_{2} \in \mathcal{S}$. In this case $\hat{S}$ is the projection of $T$ if and only if $T-\hat{S}$ is orthogonal to $\mathcal{S}$ for the inner product $\left\langle S_{1}, S_{2}\right\rangle=\mathrm{E} S_{1} S_{2}$. This is the content of the following theorem.
11.1 Theorem. Let $\mathcal{S}$ be a linear space of random variables with finite second moments. Then $\hat{S}$ is the projection of $T$ onto $\mathcal{S}$ if and only if $\hat{S} \in \mathcal{S}$ and

$$
\mathrm{E}(T-\hat{S}) S=0, \quad \text { every } S \in \mathcal{S} .
$$

Every two projections of $T$ onto $\mathcal{S}$ are almost surely equal. If the linear space $\mathcal{S}$ contains the constant variables, then $\mathrm{E} T=\mathrm{E} \hat{S}$ and $\operatorname{cov}(T-\hat{S}, S)=0$ for every $S \in \mathcal{S}$.

![](https://cdn.mathpix.com/cropped/ba7603fa-498d-468b-91dd-53c69123725b-056.jpg?height=1679&width=4361&top_left_y=497&top_left_x=562)
Figure 11.1. A variable $T$ and its projection $\hat{S}$ on a linear space.

Proof. For any $S$ and $\hat{S}$ in $\mathcal{S}$,

$$
\mathrm{E}(T-S)^{2}=\mathrm{E}(T-\hat{S})^{2}+2 \mathrm{E}(T-\hat{S})(\hat{S}-S)+\mathrm{E}(\hat{S}-S)^{2} .
$$

If $\hat{S}$ satisfies the orthogonality condition, then the middle term is zero, and we conclude that $\mathrm{E}(T-S)^{2} \geq \mathrm{E}(T-\hat{S})^{2}$, with strict inequality unless $\mathrm{E}(\hat{S}-S)^{2}=0$. Thus, the orthogonality condition implies that $\hat{S}$ is a projection, and also that it is unique.

Conversely, for any number $\alpha$,

$$
\mathrm{E}(T-\hat{S}-\alpha S)^{2}-\mathrm{E}(T-\hat{S})^{2}=-2 \alpha \mathrm{E}(T-\hat{S}) S+\alpha^{2} \mathrm{E} S^{2} .
$$

If $\hat{S}$ is a projection, then this expression is nonnegative for every $\alpha$. But the parabola $\alpha \mapsto \alpha^{2} E S^{2}-2 \alpha E(T-\hat{S}) S$ is nonnegative if and only if the orthogonality condition $E(T-\hat{S}) S=0$ is satisfied.

If the constants are in $\mathcal{S}$, then the orthogonality condition implies $\mathrm{E}(T-\hat{S}) c=0$, whence the last assertions of the theorem follow. $\square$

The theorem does not assert that projections always exist. This is not true: The infimum $\inf _{S} \mathrm{E}(T-S)^{2}$ need not be achieved. A sufficient condition for existence is that $\mathcal{S}$ is closed for the second-moment norm, but existence is usually more easily established directly.

The orthogonality of $T-\hat{S}$ and $\hat{S}$ yields the Pythagorean rule $\mathrm{E} T^{2}=\mathrm{E}(T-\hat{S})^{2}+\mathrm{E} \hat{S}^{2}$. (See Figure 11.1.) If the constants are contained in $\mathcal{S}$, then this is also true for variances instead of second moments.

Now suppose a sequence of statistics $T_{n}$ and linear spaces $S_{n}$ is given. For each $n$, let $\hat{S}_{n}$ be the projection of $T_{n}$ on $S_{n}$. Then the limiting behavior of the sequence $T_{n}$ follows from that of $\hat{S}_{n}$, and vice versa, provided the quotient $\operatorname{var} T_{n} / \operatorname{var} \hat{S}_{n}$ converges to 1 .
11.2 Theorem. Let $S_{n}$ be linear spaces of random variables with finite second moments that contain the constants. Let $T_{n}$ be random variables with projections $\hat{S}_{n}$ onto $\mathcal{S}_{n}$. If $\operatorname{var} T_{n} / \operatorname{var} \hat{S}_{n} \rightarrow 1$ then

$$
\frac{T_{n}-E T_{n}}{\operatorname{sd} T_{n}}-\frac{\hat{S}_{n}-E \hat{S}_{n}}{\operatorname{sd} \hat{S}_{n}} \xrightarrow{P} 0 .
$$

Proof. We shall prove convergence in second mean, which is stronger. The expectation of the difference is zero. Its variance is equal to

$$
2-2 \frac{\operatorname{cov}\left(T_{n}, \hat{S}_{n}\right)}{\operatorname{sd} T_{n} \operatorname{sd} \hat{S}_{n}}
$$

By the orthogonality of $T_{n}-\hat{S}_{n}$ and $\hat{S}_{n}$, it follows that $E T_{n} \hat{S}_{n}=E \hat{S}_{n}^{2}$. Because the constants are in $\mathcal{S}_{n}$, this implies that $\operatorname{cov}\left(T_{n}, \hat{S}_{n}\right)=\operatorname{var} \hat{S}_{n}$, and the theorem follows. $\square$

The condition $\operatorname{var} T_{n} / \operatorname{var} \hat{S}_{n} \rightarrow 1$ in the theorem implies that the projections $\hat{S}_{n}$ are asymptotically of the same size as the original $T_{n}$. This explains that "nothing is lost" in the limit, and that the difference between $T_{n}$ and its projection converges to zero. In the preceding theorem it is essential that the $\hat{S}_{n}$ are the projections of the variables $T_{n}$, because the condition var $T_{n} / \operatorname{var} S_{n} \rightarrow 1$ for general sequences $S_{n}$ and $T_{n}$ does not imply anything.

### 11.2 Conditional Expectation

The expectation $\mathrm{E} X$ of a random variable $X$ minimizes the quadratic form $a \mapsto \mathrm{E}(X-a)^{2}$ over the real numbers $a$. This may be expressed as follows: EX is the best prediction of $X$, given a quadratic loss function, and in the absence of additional information.

The conditional expectation $\mathrm{E}(X \mid Y)$ of a random variable $X$ given a random vector $Y$ is defined as the best "prediction" of $X$ given knowledge of $Y$. Formally, $\mathrm{E}(X \mid Y)$ is a measurable function $g_{0}(Y)$ of $Y$ that minimizes

$$
\mathrm{E}(X-g(Y))^{2}
$$

over all measurable functions $g$. In the terminology of the preceding section, $\mathrm{E}(X \mid Y)$ is the projection of $X$ onto the linear space of all measurable functions of $Y$. It follows that the conditional expectation is the unique measurable function $\mathrm{E}(X \mid Y)$ of $Y$ that satisfies the orthogonality relation

$$
E(X-E(X \mid Y)) g(Y)=0, \quad \text { every } g .
$$

If $\mathrm{E}(X \mid Y)=g_{0}(Y)$, then it is customary to write $\mathrm{E}(X \mid Y=y)$ for $g_{0}(y)$. This is interpreted as the expected value of $X$ given that $Y=y$ is observed. By Theorem 11.1 the projection is unique only up to changes on sets of probability zero. This means that the function go(y) is unique up to sets $B$ of values $y$ such that $\mathrm{P}(Y \in B)=0$. (These could be very big sets.)

The following examples give some properties and also describe the relationship with conditional densities.
11.3 Example. The orthogonality relationship with $g \equiv 1$ yields the formula $\mathrm{EX}= \mathrm{EE}(X \mid Y)$. Thus, "the expectation of a conditional expectation is the expectation." $\square$
11.4 Example. If $X=f(Y)$ for a measurable function $f$, then $\mathrm{E}(X \mid Y)=X$. This follows immediately from the definition, in which the minimum can be reduced to zero. The interpretation is that $X$ is perfectly predictable given knowledge of $Y$. $\square$
11.5 Example. Suppose that $(X, Y)$ has a joint probability density $f(x, y)$ with respect to a $\sigma$-finite product measure $\mu \times \nu$, and let $f(x \mid y)=f(x, y) / f_{Y}(y)$ be the conditional density of $X$ given $Y=y$. Then

$$
\mathrm{E}(X \mid Y)=\int x f(x \mid Y) d \mu(x)
$$

(This is well defined only if $f_{Y}(Y)>0$.) Thus the conditional expectation as defined above concurs with our intuition.

The formula can be established by writing

$$
\mathrm{E}(X-g(Y))^{2}=\int\left[\int(x-g(y))^{2} f(x \mid y) d \mu(x)\right] f_{Y}(y) d \nu(y)
$$

To minimize this expression over $g$, it suffices to minimize the inner integral (between square brackets) by choosing the value of $g(y)$ for every $y$ separately. For each $y$, the integral $\int(x-a)^{2} f(x \mid y) d \mu(x)$ is minimized for $a$ equal to the mean of the density $x \mapsto f(x \mid y)$.
11.6 Example. If $X$ and $Y$ are independent, then $\mathrm{E}(X \mid Y)=\mathrm{E} X$. Thus, the extra knowledge of an unrelated variable $Y$ does not change the expectation of $X$.

The relationship follows from the fact that independent random variables are uncorrelated: Because $\mathrm{E}(X-\mathrm{E} X) g(Y)=0$ for all $g$, the orthogonality relationship holds for $g_{0}(Y)=\mathrm{E} X$.
11.7 Example. If $f$ is measurable, then $\mathrm{E}(f(Y) X \mid Y)=f(Y) \mathrm{E}(X \mid Y)$ for any $X$ and $Y$. The interpretation is that, given $Y$, the factor $f(Y)$ behaves like a constant and can be "taken out" of the conditional expectation.

Formally, the rule can be established by checking the orthogonality relationship. For every measurable function $g$,

$$
\mathrm{E}(f(Y) X-f(Y) \mathrm{E}(X \mid Y)) g(Y)=\mathrm{E}(X-\mathrm{E}(X \mid Y)) f(Y) g(Y)=0
$$

because $X-\mathrm{E}(X \mid Y)$ is orthogonal to all measurable functions of $Y$, including those of the form $f(Y) g(Y)$. Because $f(Y) \mathrm{E}(X \mid Y)$ is a measurable function of $Y$, it must be equal to $\mathrm{E}(f(Y) X \mid Y)$.
11.8 Example. If $X$ and $Y$ are independent, then $\mathrm{E}(f(X, Y) \mid Y=y)=\mathrm{E} f(X, y)$ for every measurable $f$. This rule may be remembered as follows: The known value $y$ is substituted for $Y$; next, because $Y$ carries no information concerning $X$, the unconditional expectation is taken with respect to $X$.

The rule follows from the equality

$$
\mathrm{E}(f(X, Y)-g(Y))^{2}=\iint(f(x, y)-g(y))^{2} d P_{X}(x) d P_{Y}(y)
$$

Once again, this is minimized over $g$ by choosing for each $y$ separately the value $g(y)$ to minimize the inner integral.
11.9 Example. For any random vectors $X, Y$ and $Z$,

$$
\mathrm{E}(\mathrm{E}(X \mid Y, Z) \mid Y)=\mathrm{E}(X \mid Y)
$$

This expresses that a projection can be carried out in steps: The projection onto a smaller set can be obtained by projecting the projection onto a bigger set a second time.

Formally, the relationship can be proved by verifying the orthogonality relationship $\mathrm{E}(\mathrm{E}(X \mid Y, Z)-\mathrm{E}(X \mid Y)) g(Y)=0$ for all measurable functions $g$. By Example 11.7, the left side of this equation is equivalent to $\mathrm{EE}(X g(Y) \mid Y, Z)-\mathrm{EE}(g(Y) X \mid Y)=0$, which is true because conditional expectations retain expectations.

### 11.3 Projection onto Sums

Let $X_{1}, \ldots, X_{n}$ be independent random vectors, and let $\mathcal{S}$ be the set of all variables of the form

$$
\sum_{i=1}^{n} g_{i}\left(X_{i}\right)
$$

for arbitrary measurable functions $g_{i}$ with $\mathrm{E} g_{i}^{2}\left(X_{i}\right)<\infty$. This class is of interest, because the convergence in distribution of the sums can be derived from the central limit theorem. The projection of a variable onto this class is known as its Hájek projection.
11.10 Lemma. Let $X_{1}, \ldots, X_{n}$ be independent random vectors. Then the projection of an arbitrary random variable $T$ with finite second moment onto the class $\mathcal{S}$ is given by

$$
\hat{S}=\sum_{i=1}^{n} \mathrm{E}\left(T \mid X_{i}\right)-(n-1) \mathrm{E} T
$$

Proof. The random variable on the right side is certainly an element of $\mathcal{S}$. Therefore, the assertion can be verified by checking the orthogonality relation. Because the variables $X_{i}$ are independent, the conditional expectation $\mathrm{E}\left(\mathrm{E}\left(T \mid X_{i}\right) \mid X_{j}\right)$ is equal to the expectation $\mathrm{EE}\left(T \mid X_{i}\right)=\mathrm{E} T$ for every $i \neq j$. Consequently, $\mathrm{E}\left(\hat{S} \mid X_{j}\right)=\mathrm{E}\left(T \mid X_{j}\right)$ for every $j$, whence

$$
\mathrm{E}(T-\hat{S}) g_{j}\left(X_{j}\right)=\mathrm{EE}\left(T-\hat{S} \mid X_{j}\right) g_{j}\left(X_{j}\right)=\mathrm{E} 0 g_{j}\left(X_{j}\right)=0
$$

This shows that $T-\hat{S}$ is orthogonal to $\mathcal{S}$.

Consider the special case that $X_{1}, \ldots, X_{n}$ are not only independent but also identically distributed, and that $T=T\left(X_{1}, \ldots, X_{n}\right)$ is a permutation-symmetric, measurable function of the $X_{i}$. Then

$$
\mathrm{E}\left(T \mid X_{i}=x\right)=\mathrm{E} T\left(x, X_{2}, \ldots, X_{n}\right)
$$

Because this does not depend on $i$, the projection $\hat{S}$ is also the projection of $T$ onto the smaller set of variables of the form $\sum_{i=1}^{n} g\left(X_{i}\right)$, where $g$ is an arbitrary measurable function.

## *11.4 Hoeffding Decomposition

The Hájek projection gives a best approximation by a sum of functions of one $X_{i}$ at a time. The approximation can be improved by using sums of functions of two, or more, variables. This leads to the Hoeffding decomposition.

Because a projection onto a sum of orthogonal spaces is the sum of the projections onto the individual spaces, it is convenient to decompose the proposed projection space into a sum of orthogonal spaces. Given independent variables $X_{1}, \ldots, X_{n}$ and a subset $A \subset\{1, \ldots, n\}$, let $H_{A}$ denote the set of all square-integrable random variables of the type

$$
g_{A}\left(X_{1}: i \in A\right),
$$

for measurable functions $\mathfrak{g}_{A}$ of $|A|$ arguments such that

$$
\mathrm{E}\left(g_{A}\left(X_{i}: i \in A\right) \mid X_{j}: j \in B\right)=0, \quad \text { every } B:|B|<|A| .
$$

(Define $\mathrm{E}(T \mid \emptyset)=\mathrm{E} T$.) By the independence of $X_{1} \ldots \ldots X_{n}$ the condition in the last display is automatically valid for any $B \subset\{1,2, \ldots, n\}$ that does not contain $A$. Consequently, the spaces $H_{A}$, when $A$ ranges over all subsets of $\{1, \ldots, n\}$, are pairwise orthogonal. Stated in its present form, the condition reflects the intention to build approximations of increasing complexity by projecting a given variable in turn onto the spaces

$$
[1], \quad\left[\sum_{i} g_{i l\}}\left(X_{i}\right)\right], \quad\left[\sum \sum_{i<j} g_{i, j \mid}\left(X_{i}, X_{j}\right)\right], \quad \ldots .
$$

where $\mathcal{g}_{[i]} \in H_{[i]}, g_{[i, j]} \in H_{[i, j]}$, and so forth. Each new space is chosen orthogonal to the preceding spaces.

Let $P_{A} T$ denote the projection of $T$ onto $H_{A}$. Then, by the orthogonality of the $H_{A}$, the projection onto the sum of the first $r$ spaces is the sum $\sum_{|A| \leq r} P_{A} T$ of the projections onto the individual spaces. The projection onto the sum of the first two spaces is the Hajek projection. More generally, the projections of zero, first, and second order can be seen to be

$$
\begin{aligned}
P_{i} T & =\mathrm{E} T \\
P_{(i)} T & =\mathrm{E}\left(T \mid X_{i}\right)-\mathrm{E} T . \\
P_{(i, j)} T & =\mathrm{E}\left(T \mid X_{i}, X_{j}\right)-\mathrm{E}\left(T \mid X_{i}\right)-\mathrm{E}\left(T \mid X_{j}\right)+\mathrm{E} T .
\end{aligned}
$$

Now the general formula given by the following lemma should not be surprising.
11.11 Lemma. Let $X_{1}, \ldots, X_{n}$ be independent random variables, and let $T$ be an arbitrany random variable with $\mathrm{ET} T^{2}<\infty$. Then the projection of $T$ onto $H_{A}$ is given by

$$
P_{A} T=\sum_{B \subset A}(-1)^{|A|-|B|} E\left(T \mid X_{1}: i \in B\right) .
$$

If $T \perp H_{B}$ for every subset $B \subset A$ of a given set $A$, then $E\left(T \mid X_{i}: i \in A\right)=0$. Consequently, the sum of the spaces $H_{B}$ with $B \subset A$ contains all square-integrable functions of ( $X_{i}: i \in A$ ).

Proof. Abbreviate $\mathrm{E}\left(T \mid X_{i}: i \in A\right)$ to $\mathrm{E}(T \mid A)$ and $g_{A}\left(X_{i}: i \in A\right)$ to $g_{A}$. By the independence of $X_{1}, \ldots, X_{n}$ it follows that $\mathrm{E}(\mathrm{E}(T \mid A) \mid B)=\mathrm{E}(T \mid A \cap B)$ for every subsets $A$
and $B$ of $\{1, \ldots, n\}$. Thus, for $P_{A} T$ as defined in the lemma and a set $C$ strictly contained in $A$,

$$
\begin{aligned}
E\left(P_{A} T \mid C\right) & =\sum_{B C A}(-1)^{|A|-|B|} E(T \mid B \cap C) \\
& =\sum_{D \subset C} \sum_{j=0}^{|A|-|C|}(-1)^{|A|-|D|-j}\binom{|A|-|C|}{j} E(T \mid D) .
\end{aligned}
$$

By the binomial formula, the inner sum is zero for every $D$. Thus the left side is zero. In view of the form of $P_{A} T$, it was not a loss of generality to assume that $C \subset A$. Hence $P_{A} T$ is contained in $H_{A}$.

Next we verify the orthogonality relationship. For any measurable function $g_{A}$,

$$
\mathrm{E}\left(T-P_{A} T\right) g_{A}=\mathrm{E}(T-\mathrm{E}(T \mid A)) g_{A}-\sum_{\substack{B \subset A \\ B \neq A}}(-1)^{|A|-|B|} \mathrm{EE}(T \mid B) \mathrm{E}\left(g_{A} \mid B\right) .
$$

This is zero for any $g_{\lambda} \in H_{\lambda}$. This concludes the proof that $P_{\lambda} T$ is as given.
We prove the second assertion of the lemma by induction on $r=|A|$. If $T \perp H_{B}$, then $\mathrm{E}(T \mid \emptyset)=\mathrm{E} T=0$. Thus the assertion is true for $r=0$. Suppose that it is true for $0, \ldots, r-1$, and consider a set $A$ of $r$ elements. If $T \perp H_{B}$ for every $B \subset A$, then certainly $T \perp H_{C}$ for every $C \subset B$. Consequently, the induction hypothesis shows that $\mathrm{E}(T \mid B)=0$ for every $B \subset A$ of $r-1$ or fewer elements. The formula for $P_{A} T$ now shows that $P_{A} T=E(T \mid A)$. By assumption the left side is zero. This concludes the induction argument.

The final assertion of the lemma follows if the variable $T_{A}:=T-\sum_{B C A} P_{B} T$ is zero for every $T$ that depends on $\left(X_{i}: i \in A\right)$ only. But in this case $T_{A}$ depends on $\left(X_{i}: i \in A\right)$ only and hence equals $E\left(T_{A} \mid A\right)$, which is zero, because $T_{A} \perp H_{B}$ for every $B \subset A$. $\square$

If $T=T\left(X_{1}, \ldots, X_{n}\right)$ is permutation-symmetric and $X_{1}, \ldots, X_{n}$ are independent and identically distributed, then the Hoeffding decomposition of $T$ can be simplified to

$$
T=\sum_{r=0}^{n} \sum_{|A|=r} g_{r}\left(X_{i}: i \in A\right),
$$

for

$$
g_{r}\left(x_{1}, \ldots, x_{r}\right)=\sum_{B \subset\{1, \ldots . r\}}(-1)^{r-|B|} E T\left(x_{i} \in B, X_{i} \notin B\right) .
$$

The inner sum in the representation of $T$ is for each $r$ a $U$-statistic of order $r$ (as discussed in the Chapter 12), with degenerate kernel. All terms in the sum are orthogonal, whence the variance of $T$ can be found as var $T=\sum_{r=1}^{n}\binom{n}{r} \mathrm{Eg}_{r}^{2}\left(X_{1}, \ldots, X_{r}\right)$.

## Notes

Orthogonal projections in Hilbert spaces (complete inner product spaces) are a classical subject in functional analysis. We have limited our discussion to the Hilbert space $L_{2}(\Omega, U, P)$ of all square-integrable random variables on a probability space. Another popular method to
introduce conditional expectation is based on the Radon-Nikodym theorem. Then $\mathrm{E}(X \mid Y)$ is naturally defined for every integrable $X$. Hájek stated his projection lemma in [68] when proving the asymptotic normality of rank statistics under alternatives. Hoeffding [75] had already used it implicitly when proving the asymptotic normality of $U$-statistics. The "Hoeffding" decomposition appears to have received its name (for instance in [151]) in honor of Hoeffding's 1948 paper, but we have not been able to find it there. It is not always easy to compute a projection or its variance, and, if applied to a sequence of statistics, a projection may take the form $\sum g_{n}\left(X_{i}\right)$ for a function $g_{n}$ depending on $n$ even though a simpler approximation of the form $\sum g\left(X_{i}\right)$ with $g$ fixed is possible.

## PROBLEMS

1. Show that "projecting decreases second moment": If $\hat{S}$ is the projection of $T$ onto a linear space, then $\mathrm{E} \hat{S}^{2} \leq \mathrm{E} T^{2}$. If $\mathcal{S}$ contains the constants, then also $\operatorname{var} \hat{S} \leq \operatorname{var} T$.
2. Another idea of projection is based on minimizing variance instead of second moment. Show that $\operatorname{var}(T-S)$ is minimized over a linear space $\mathcal{S}$ by $\hat{S}$ if and only if $\operatorname{cov}(T-\hat{S}, S)=0$ for every $S \in \mathcal{S}$.
3. If $X \geq Y$ almost surely, then $\mathrm{E}(X \mid Z) \geq \mathrm{E}(Y \mid Z)$.
4. For an arbitrary random variable $X \geq 0$ (not necessarily square-integrable), define a conditional expectation $\mathrm{E}(X \mid Y)$ by $\lim _{M \rightarrow \infty} \mathrm{E}(X \wedge M \mid Y)$.
(i) Show that this is well defined (the limit exists almost surely).
(ii) Show that this coincides with the earlier definition if $\mathrm{E} X^{2}<\infty$.
(iii) If $\mathrm{E} X<\infty$ show that $\mathrm{E}(X-\mathrm{E}(X \mid Y)) g(Y)=0$ for every bounded, measurable function $g$.
(iv) Show that $\mathrm{E}(X \mid Y)$ is the almost surely unique measurable function of $Y$ that satisfies the orthogonality relationship of (iii).
How would you define $\mathrm{E}(X \mid Y)$ for a random variable with $\mathrm{E}|X|<\infty$ ?
5. Show that a projection $\hat{S}$ of a variable $T$ onto a convex set $\mathcal{S}$ is almost surely unique.
6. Find the conditional expectation $\mathrm{E}(X \mid Y)$ if ( $X, Y$ ) possesses a bivariate normal distribution.
7. Find the conditional expectation $\mathrm{E}\left(X_{1} \mid X_{(n)}\right)$ if $X_{1}, \ldots, X_{n}$ are a random sample of standard uniform variables.
8. Find the conditional expectation $\mathrm{E}\left(X_{1} \mid \bar{X}_{n}\right)$ if $X_{1}, \ldots, X_{n}$ are i.i.d.
9. Show that for any random variables $S$ and $T$ (i) $\operatorname{sd}(S+T) \leq \operatorname{sd} S+\operatorname{sd} T$, and (ii) $|\operatorname{sd} S-\operatorname{sd} T| \leq \operatorname{sd}(S-T)$.
10. If $S_{n}$ and $T_{n}$ are arbitrary sequences of random variables such that $\operatorname{var}\left(S_{n}-T_{n}\right) / \operatorname{var} T_{n} \rightarrow 0$, then

$$
\frac{S_{n}-\mathrm{E} S_{n}}{\operatorname{sd} S_{n}}-\frac{T_{n}-\mathrm{E} T_{n}}{\operatorname{sd} T_{n}} \xrightarrow{\mathrm{P}} 0 .
$$

Moreover, $\operatorname{var} S_{n} / \operatorname{var} T_{n} \rightarrow 1$. Show this.
11. Show that $P_{A} h\left(X_{j}: X_{j} \in B\right)=0$ for every set $B$ that does not contain $A$.

## 12

## U-Statistics

One-sample $U$-statistics can be regarded as generalizations of means. They are sums of dependent variables, but we show them to be asymptotically normal by the projection method. Certain interesting test statistics, such as the Wilcoxon statistics and Kendall's $\tau$-statistic, are one-sample $U$-statistics. The Wilcoxon statistic for testing a difference in location between two samples is an example of a two-sample $U$-statistic. The Cramér-von Mises statistic is an example of a degenerate $U$-statistic.

### 12.1 One-Sample U-Statistics

Let $X_{1}, \ldots, X_{n}$ be a random sample from an unknown distribution. Given a known function $h$, consider estimation of the "parameter"

$$
\theta=\mathrm{E} h\left(X_{1}, \ldots, X_{r}\right) .
$$

In order to simplify the formulas, it is assumed throughout this section that the function $h$ is permutation symmetric in its $r$ arguments. (A given $h$ could always be replaced by a symmetric one.) The statistic $h\left(X_{1}, \ldots, X_{r}\right)$ is an unbiased estimator for $\theta$, but it is unnatural, as it uses only the first $r$ observations. A $U$-statistic with kernel $h$ remedies this; it is defined as

$$
U=\frac{1}{\binom{n}{r}} \sum_{\beta} h\left(X_{\beta_{1}}, \ldots, X_{\beta_{r}}\right),
$$

where the sum is taken over the set of all unordered subsets $\beta$ of $r$ different integers chosen from $\{1, \ldots, n\}$. Because the observations are i.i.d., $U$ is an unbiased estimator for $\theta$ also. Moreover, $U$ is permutation symmetric in $X_{1}, \ldots X_{n}$, and has smaller variance than $h\left(X_{1}, \ldots, X_{r}\right)$. In fact, if $X_{(1)}, \ldots, X_{(n)}$ denote the values $X_{1}, \ldots, X_{n}$ stripped from their order (the order statistics in the case of real-valued variables), then

$$
U=\mathrm{E}\left(h\left(X_{1}, \ldots, X_{r}\right) \mid X_{(1)}, \ldots, X_{(n)}\right) .
$$

Because a conditional expectation is a projection, and projecting decreases second moments, the variance of the $U$-statistic $U$ is smaller than the variance of the naive estimator $h\left(X_{1}, \ldots, X_{r}\right)$.

In this section it is shown that the sequence $\sqrt{n}(U-\theta)$ is asymptotically normal under the condition that $\mathrm{E} h^{2}\left(X_{1}, \ldots, X_{r}\right)<\infty$.
12.1 Example. A $U$-statistic of degree $r=1$ is a mean $n^{-1} \sum_{i=1}^{n} h\left(X_{i}\right)$. The asserted asymptotic normality is then just the central limit theorem.
12.2 Example. For the kernel $h\left(x_{1}, x_{2}\right)=\frac{1}{2}\left(x_{1}-x_{2}\right)^{2}$ of degree 2, the parameter $\theta= \mathrm{E} h\left(X_{1}, X_{2}\right)=\operatorname{var} X_{1}$ is the variance of the observations. The corresponding $U$-statistic can be calculated to be

$$
U=\frac{1}{\binom{n}{2}} \sum \sum_{i<j} \frac{1}{2}\left(X_{i}-X_{j}\right)^{2}=\frac{1}{n-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2} .
$$

Thus, the sample variance is a $U$-statistic of order 2 . $\square$

The asymptotic normality of a sequence of $U$-statistics, if $n \rightarrow \infty$ with the kernel remaining fixed, can be established by the projection method. The projection of $U-\theta$ onto the set of all statistics of the form $\sum_{i=1}^{n} g_{i}\left(X_{i}\right)$ is given by

$$
\hat{U}=\sum_{i=1}^{n} \mathrm{E}\left(U-\theta \mid X_{i}\right)=\frac{r}{n} \sum_{i=1}^{n} h_{1}\left(X_{i}\right),
$$

where the function $h_{1}$ is given by

$$
h_{1}(x)=\mathrm{E} h\left(x, X_{2}, \ldots, X_{r}\right)-\theta .
$$

The first equality in the formula for $\hat{U}$ is the Hájek projection principle. The second equality is established in the proof below.

The sequence of projections $\hat{U}$ is asymptotically normal by the central limit theorem, provided $\mathrm{E} h_{1}^{2}\left(X_{1}\right)<\infty$. The difference between $U-\theta$ and its projection is asymptotically negligible.
12.3 Theorem. If $\mathrm{E} h^{2}\left(X_{1}, \ldots, X_{r}\right)<\infty$, then $\sqrt{n}(U-\theta-\hat{U}) \xrightarrow{\mathrm{P}} 0$. Consequently, the sequence $\sqrt{n}(U-\theta)$ is asymptotically normal with mean 0 and variance $r^{2} \zeta_{1}$. where, with $X_{1}, \ldots, X_{r}, X_{1}^{\prime}, \ldots, X_{r}^{\prime}$ denoting i.i.d. variables,

$$
\zeta_{1}=\operatorname{cov}\left(h\left(X_{1}, X_{2}, \ldots, X_{r}\right), h\left(X_{1}, X_{2}^{\prime}, \ldots, X_{r}^{\prime}\right)\right) .
$$

Proof. We first verify the formula for the projection $\hat{U}$. It suffices to show that $\mathrm{E}(U- \left.\theta \mid X_{i}\right)=h_{1}\left(X_{i}\right)$. By the independence of the observations and permutation symmetry of $h$.

$$
E\left(h\left(X_{\beta_{1}} \ldots, X_{\beta_{1}}\right)-\theta \mid X_{1}=x\right)= \begin{cases}h_{1}(x) & \text { if } i \in \beta \\ 0 & \text { if } i \notin \beta .\end{cases}
$$

To calculate $\mathrm{E}\left(U-\theta \mid X_{i}\right)$, we take the average over all $\beta$. Then the first case occurs for $\binom{n=1}{r=1}$ of the vectors $\beta$ in the definition of $U$. The factor $r / n$ in the formula for the projection $\hat{U}$ arises as $r / n=\binom{n-1}{r-1}\binom{n}{r}$.

The projection $\hat{U}$ has mean zero, and variance equal to

$$
\begin{aligned}
\operatorname{var} \hat{U} & =\frac{r^{2}}{n} \mathrm{E} h_{1}^{2}\left(X_{1}\right) \\
& =\frac{r^{2}}{n} \int \mathrm{E}\left(h\left(x, X_{2}, \ldots, X_{r}\right)-\theta\right) \mathrm{E} h\left(x, X_{2}^{\prime}, \ldots, X_{r}^{\prime}\right) d P_{X_{1}}(x)=\frac{r^{2}}{n} \zeta_{1}
\end{aligned}
$$

Because this is finite, the sequence $\sqrt{n} \hat{U}$ converges weakly to the $N\left(0, r^{2} \zeta_{1}\right)$-distribution by the central limit theorem. By Theorem 11.2 and Slutsky's lemma, the sequence $\sqrt{n}(U- \theta-\hat{U})$ converges in probability to zero, provided $\operatorname{var} U / \operatorname{var} \hat{U} \rightarrow 1$.

In view of the permutation symmetry of the kernel $h$, an expression of the type $\operatorname{cov}\left(h\left(X_{\beta_{1}}\right.\right.$, $\left.\left.\ldots, X_{\beta_{r}}\right), h\left(X_{\beta_{1}^{\prime}}, \ldots, X_{\beta_{r}^{\prime}}\right)\right)$ depends only on the number of variables $X_{l}$ that are common to $X_{\beta_{1}}, \ldots, X_{\beta_{r}}$ and $X_{\beta_{1}^{\prime}}, \ldots, X_{\beta_{r}^{\prime}}$. Let $\zeta_{c}$ be this covariance if $c$ variables are in common. Then

$$
\begin{aligned}
\operatorname{var} U & =\binom{n}{r}^{-2} \sum_{\beta} \sum_{\beta^{\prime}} \operatorname{cov}\left(h\left(X_{\beta_{1}}, \ldots, X_{\beta_{r}}\right), h\left(X_{\beta_{1}^{\prime}}, \ldots, X_{\beta_{r}^{\prime}}\right)\right) \\
& =\binom{n}{r}^{-2} \sum_{c=0}^{r}\binom{n}{r}\binom{r}{c}\binom{n-r}{r-c} \zeta_{c} .
\end{aligned}
$$

The last step follows, because a pair ( $\beta, \beta^{\prime}$ ) with $c$ indexes in common can be chosen by first choosing the $r$ indexes in $\beta$, next the $c$ common indexes from $\beta$, and finally the remaining $r-c$ indexes in $\beta^{\prime}$ from $\{1, \ldots, n\}-\beta$. The expression can be simplified to

$$
\operatorname{var} U=\sum_{c=1}^{r} \frac{r!^{2}}{c!(r-c)!^{2}} \frac{(n-r)(n-r-1) \cdots(n-2 r+c+1)}{n(n-1) \cdots(n-r+1)} \zeta_{c} .
$$

In this sum the first term is $O(1 / n)$, the second term is $O\left(1 / n^{2}\right)$, and so forth. Because $n$ times the first term converges to $r^{2} \zeta_{1}$, the desired limit result $\operatorname{var} U / \operatorname{var} \hat{U} \rightarrow 1$ follows. -
12.4 Example (Signed rank statistic). The parameter $\theta=P\left(X_{1}+X_{2}>0\right)$ corresponds to the kernel $h\left(x_{1}, x_{2}\right)=1\left\{x_{1}+x_{2}>0\right\}$. The corresponding $U$-statistic is

$$
U=\frac{1}{\binom{n}{2}} \sum \sum_{i<j} 1\left\{X_{i}+X_{j}>0\right\} .
$$

This statistic is the average number of pairs $\left(X_{i}, X_{j}\right)$ with positive sum $X_{i}+X_{j}>0$, and can be used as a test statistic for investigating whether the distribution of the observations is located at zero. If many pairs ( $X_{i}, X_{j}$ ) yield a positive sum (relative to the total number of pairs), then we have an indication that the distribution is centered to the right of zero.

The sequence $\sqrt{n}(U-\theta)$ is asymptotically normal with mean zero and variance $4 \zeta_{1}$. If $F$ denotes the cumulative distribution function of the observations, then the projection of $\boldsymbol{U}-\boldsymbol{\theta}$ can be written

$$
\hat{U}=-\frac{2}{n} \sum_{i=1}^{n}\left(F\left(-X_{i}\right)-\mathrm{E} F\left(-X_{i}\right)\right) .
$$

This formula is useful in subsequent discussion and is also convenient to express the asymptotic variance in $F$.

The statistic is particularly useful for testing the null hypothesis that the underlying distribution function is continuous and symmetric about zero: $F(x)=1-F(-x)$ for every $x$. Under this hypothesis the parameter $\theta$ equals $\theta=1 / 2$, and the asymptotic variance reduces to $4 \operatorname{var} F\left(X_{1}\right)=1 / 3$, because $F\left(X_{1}\right)$ is uniformly distributed. Thus, under the null hypothesis of continuity and symmetry, the limit distribution of the sequence $\sqrt{n}(U-1 / 2)$ is normal $N(0,1 / 3)$, independent of the underlying distribution. The last property means that the sequence $U_{n}$ is asymptotically distribution free under the null hypothesis of symmetry and makes it easy to set critical values. The test that rejects $H_{0}$ if $\sqrt{3 n}(U-1 / 2) \geq z_{\alpha}$ is asymptotically of level $\alpha$ for every $F$ in the null hypothesis.

This test is asymptotically equivalent to the signed rank test of Wilcoxon. Let $R_{1}^{+}, \ldots$, $R_{n}^{+}$denote the ranks of the absolute values $\left|X_{1}\right|, \ldots,\left|X_{n}\right|$ of the observations: $R_{i}^{+}=k$ means that $\left|X_{i}\right|$ is the $k$ th smallest in the sample of absolute values. More precisely, $R_{i}^{+}= \sum_{j=1}^{n} 1\left\{\left|X_{j}\right| \leq\left|X_{i}\right|\right\}$. Suppose that there are no pairs of tied observations $X_{i}=X_{j}$. Then the signed rank statistic is defined as $W^{+}=\sum_{i=1}^{n} R_{i}^{+} 1\left\{X_{i}>0\right\}$. Some algebra shows that

$$
W^{+}=\binom{n}{2} U+\sum_{i=1}^{n} 1\left\{X_{i}>0\right\}
$$

The second term on the right is of much lower order than the first and hence it follows that $n^{-3 / 2}\left(W^{+}-\mathrm{E} W^{+}\right) \rightsquigarrow N(0,1 / 12)$.
12.5 Example (Kendall's $\tau$ ). The $U$-statistic theorem requires that the observations $X_{1}$, $\ldots, X_{n}$ are independent, but they need not be real-valued. In this example the observations are a sample of bivariate vectors, for convenience (somewhat abusing notation) written as $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$. Kendall's $\tau$-statistic is

$$
\tau=\frac{4}{n(n-1)} \sum \sum_{i<j} 1\left\{\left(Y_{j}-Y_{i}\right)\left(X_{j}-X_{i}\right)>0\right\}-1 .
$$

This statistic is a measure of dependence between $X$ and $Y$ and counts the number of concordant pairs ( $X_{i}, Y_{i}$ ) and ( $X_{j}, Y_{j}$ ) in the observations. Two pairs are concordant if the indicator in the definition of $\tau$ is equal to 1 . Large values indicate positive dependence (or concordance), whereas small values indicate negative dependence. Under independence of $X$ and $Y$ and continuity of their distributions, the distribution of $\tau$ is centered about zero, and in the extreme cases that all or none of the pairs are concordant $\tau$ is identically 1 or -1 , respectively.

The statistic $\tau+1$ is a $U$-statistic of order 2 for the kernel

$$
h\left(\binom{x_{1}}{y_{1}},\binom{x_{2}}{y_{2}}\right)=21\left\{\left(y_{2}-y_{1}\right)\left(x_{2}-x_{1}\right)>0\right\}
$$

Hence the sequence $\sqrt{n}\left(\tau+1-2 \mathrm{P}\left(\left(Y_{2}-Y_{1}\right)\left(X_{2}-X_{1}\right)>0\right)\right)$ is asymptotically normal with mean zero and variance $4 \zeta_{1}$. With the notation $F^{l}(x, y)=\mathrm{P}(X<x, Y<y)$ and $F^{r}(x, y)=\mathrm{P}(X>x, Y>y)$, the projection of $U-\theta$ takes the form

$$
\hat{U}=\frac{4}{n} \sum_{i=1}^{n}\left(F^{l}\left(X_{i}, Y_{i}\right)+F^{r}\left(X_{i}, Y_{i}\right)-\mathrm{E} F^{l}\left(X_{i}, Y_{i}\right)-\mathrm{E} F^{r}\left(X_{i}, Y_{i}\right)\right)
$$

If $X$ and $Y$ are independent and have continuous marginal distribution functions, then $\mathrm{E} \tau=0$ and the asymptotic variance $4 \zeta_{1}$ can be calculated to be $4 / 9$, independent of the

![](https://cdn.mathpix.com/cropped/ba7603fa-498d-468b-91dd-53c69123725b-067.jpg?height=1850&width=2056&top_left_y=541&top_left_x=1820)
Figure 12.1. Concordant and discordant pairs of points.

marginal distributions. Then $\sqrt{n} \tau \rightsquigarrow N(0,4 / 9)$ which leads to the test for "independence": Reject independence if $\sqrt{9 n / 4}|\tau|>z_{\alpha / 2}$.

### 12.2 Two-Sample U-statistics

Suppose the observations consist of two independent samples $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$, i.i.d. within each sample, from possibly different distributions. Let $h\left(x_{1}, \ldots, x_{r}, y_{1}, \ldots, y_{s}\right)$ be a known function that is permutation symmetric in $x_{1}, \ldots, x_{r}$ and $y_{1}, \ldots, y_{s}$ separately. A two-sample $U$-statistic with kernel $h$ has the form

$$
U=\frac{1}{\binom{m}{r}\binom{n}{s}} \sum_{\alpha} \sum_{\beta} h\left(X_{\alpha_{1}}, \ldots, X_{\alpha_{r}}, Y_{\beta_{1}}, \ldots, Y_{\beta_{s}}\right),
$$

where $\alpha$ and $\beta$ range over the collections of all subsets of $r$ different elements from $\{1,2, \ldots, m\}$ and of $s$ different elements from $\{1,2, \ldots, n\}$, respectively. Clearly, $U$ is an unbiased estimator of the parameter

$$
\theta=\mathrm{E} h\left(X_{1}, \ldots, X_{r}, Y_{1}, \ldots, Y_{s}\right) .
$$

The sequence $U_{m, n}$ can be shown to be asymptotically normal by the same arguments as for one-sample $U$-statistics. Here we let both $m \rightarrow \infty$ and $n \rightarrow \infty$, in such a way that the number of $X_{i}$ and $Y_{j}$ are of the same order. Specifically, if $N=m+n$ is the total number of observations we assume that, as $m, n \rightarrow \infty$,

$$
\frac{m}{N} \rightarrow \lambda, \quad \frac{n}{N} \rightarrow 1-\lambda, \quad 0<\lambda<1 .
$$

To give an exact meaning to $m, n \rightarrow \infty$, we may think of $m=m_{\nu}$ and $n=n_{\nu}$ indexed by a third index $v \in \mathbb{N}$. Next, we let $m_{v} \rightarrow \infty$ and $n_{v} \rightarrow \infty$ as $v \rightarrow \infty$ in such a way that $m_{\nu} / N_{\nu} \rightarrow \lambda$.

The projection of $U-\theta$ onto the set of all functions of the form $\sum_{i=1}^{m} k_{i}\left(X_{i}\right)+\sum_{j=1}^{n} l_{j}\left(Y_{j}\right)$ is given by

$$
\hat{U}=\frac{r}{m} \sum_{i=1}^{m} h_{1,0}\left(X_{i}\right)+\frac{s}{n} \sum_{j=1}^{n} h_{0,1}\left(Y_{j}\right)
$$

where the functions $h_{1,0}$ and $\hat{h}_{0,1}$ are defined by

$$
\begin{aligned}
& h_{1,0}(x)=\mathrm{E} h\left(x, X_{2}, \ldots, X_{r}, Y_{1}, \ldots, Y_{s}\right)-\theta, \\
& h_{0,1}(y)=\mathrm{E} h\left(X_{1}, \ldots, X_{r}, y, Y_{2}, \ldots, Y_{s}\right)-\theta .
\end{aligned}
$$

This follows, as before, by first applying the Hájek projection lemma, and next expressing $E\left(U \mid X_{i}\right)$ and $E\left(U \mid Y_{j}\right)$ in the kernel function.

If the kernel is square-integrable, then the sequence $\hat{U}$ is asymptotically normal by the central limit theorem. The difference between 0 and $U-\theta$ is asymptotically negligible.
12.6 Theorem. If $\mathrm{E} h^{2}\left(X_{1}, \ldots, X_{r}, Y_{1}, \ldots, Y_{s}\right)<\infty$, then the sequence $\sqrt{N}(U-\theta-\hat{U})$ converges in probability to zero. Consequently, the sequence $\sqrt{N}(U-\theta)$ converges in distribution to the normal law with mean zero and variance $r^{2} \zeta_{1,0} / \lambda+s^{2} \zeta_{0,1} /(1-\lambda)$, where, with the $X_{i}$ being i.i.d. variables independent of the i.i.d. variables $Y_{j}$,

$$
\begin{aligned}
\zeta c, d= & \operatorname{cov}\left(h\left(X_{1}, \ldots, X_{r}, Y_{1}, \ldots, Y_{s}\right) .\right. \\
& \left.h\left(X_{1}, \ldots, X_{c}, X_{c+1}^{\prime}, \ldots, X_{r}^{\prime}, Y_{1}, \ldots, Y_{d}, Y_{d+1}^{\prime}, \ldots, Y_{s}^{\prime}\right)\right) .
\end{aligned}
$$

Proof. The argument is similar to the one given previously for one-sample $U$-statistics. The variances of $U$ and its projection are given by

$$
\begin{aligned}
& \operatorname{var} \hat{U}=\frac{r^{2}}{m} \zeta_{1.0}+\frac{s^{2}}{n} \zeta_{0.1} \\
& \operatorname{var} U=\frac{1}{\binom{m}{r}^{2}\binom{n}{s}^{2}} \sum_{c=0}^{r} \sum_{d=0}^{s}\binom{m}{r}\binom{r}{c}\binom{m-r}{r-c}\binom{n}{s}\binom{s}{d}\binom{n-s}{s-d} \zeta_{c . d} .
\end{aligned}
$$

It can be checked from this that both the sequence $N \operatorname{var} \hat{O}$ and the sequence $N \operatorname{var} U$ converge to the number $r^{2} \zeta_{1,0} / \lambda+s^{2} \zeta_{0,1} /(1-\lambda)$.
12.7 Example (Mann-Whitney statistic). The kernel for the parameter $\theta=\mathrm{P}(X \leq Y)$ is $h(x, y)=I\{X \leq Y\}$, which is of order $I$ in both $x$ and $y$. The corresponding $U$-statistic is

$$
U=\frac{1}{m n} \sum_{i=1}^{m} \sum_{j=1}^{n} 1\left\{X_{i} \leq Y_{j}\right\} .
$$

The statistic mnU is known as the Mann-Whitney statistic and is used to test for a difference in location between the two samples. A large value indicates that the $Y_{j}$ are "stochastically larger" than the $X_{i}$.

If the $X_{i}$ and $Y_{j}$ have cumulative distribution functions $F$ and $G$, respectively, then the projection of $U-\theta$ can be written

$$
\hat{U}=-\frac{1}{m} \sum_{i=1}^{m}\left(G_{-}\left(X_{i}\right)-\mathrm{E} G_{-}\left(X_{i}\right)\right)+\frac{1}{n} \sum_{j=1}^{n}\left(F\left(Y_{i}\right)-\mathrm{E} F\left(Y_{i}\right)\right) .
$$

It is easy to obtain the limit distribution of the projections $\hat{U}$ (and hence of $U$ ) from this formula. In particular, under the null hypothesis that the pooled sample $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$ is i.i.d. with continuous distribution function $F=G$, the sequence $\sqrt{12 m n / N}(U-1 / 2)$
converges to a standard normal distribution. (The parameter equals $\theta=1 / 2$ and $\zeta_{0.1}= \zeta_{1,0}=1 / 12$.)

If no observations in the pooled sample are tied, then $m n U+\frac{1}{2} n(n+1)$ is equal to the sum of the ranks of the $Y_{j}$ in the pooled sample (see Chapter 13). Hence the latter statistic, the Wilcoxon noo-sample statistic, is asymptotically normal as well. $\square$

## *12.3 Degenerate U-Statistics

A sequence of $U$-statistics (or, better, their kernel function) is called degenerate if the asymptotic variance $r^{2} \zeta_{1}$ (found in Theorem 12.3) is zero. The formula for the variance of a $U$-statistic (in the proof of Theorem 12.3) shows that $\operatorname{var} U$ is of the order $n^{-c}$ if $\zeta_{1}=\cdots=\zeta_{c-1}=0<\zeta_{c}$. In this case, the sequence $n^{c / 2}\left(U_{n}-\theta\right)$ is asymptotically tight. In this section we derive its limit distribution.

Consider the Hoeffding decomposition as discussed in section 11.4. For a $U$-statistic $U_{n}$ with kernel $h$ of order $r$, based on observations $X_{1}, \ldots, X_{n}$, this can be simplified to

$$
U_{n}=\sum_{c=0}^{r} \sum_{|A|=c} \frac{1}{\binom{n}{r}} \sum_{\beta} P_{A} h\left(X_{\beta_{1}}, \ldots, X_{\beta_{r}}\right)=\sum_{c=0}^{r}\binom{r}{c} U_{n, c} \quad \text { (say). }
$$

Here, for each $0 \leq c \leq r$, the variable $U_{n, c}$ is a $U$-statistic of order $c$ with kernel

$$
h_{c}\left(X_{1}, \ldots, X_{c}\right)=P_{(1, \ldots, c)} h\left(X_{1}, \ldots, X_{r}\right) .
$$

To see this, fix a set $A$ with $c$ elements. Because the space $H_{A}$ is orthogonal to all functions $g\left(X_{j}: j \in B\right)$ (i.e., the space $\sum_{C C B} H_{C}$ ) for every set $B$ that docs not contain $A$, the projection $P_{A} h\left(X_{\beta_{1}}, \ldots, X_{\beta_{r}}\right)$ is zero unless $A \subset \beta=\left\{\beta_{1}, \ldots, \beta_{r}\right\}$. For the remaining $\beta$ the projection $P_{A} h\left(X_{\beta_{1}}, \ldots, X_{\beta_{r}}\right)$ does not depend on $\beta$ (i.e., on the $r-c$ elements of $\beta-A$ ) and is a fixed function $h_{c}$ of ( $X_{j}: j \in A$ ). This follows by symmetry, or explicitly from the formula for the projections in section 11.4. The function $h_{c}$ is indeed the function as given previously. There are $\binom{n-c}{r-c}$ vectors $\beta$ that contain the set $A$. The claim that $U_{n, c}$ is a $U$-statistic with kernel $h_{c}$ now follows by simple algebra, using the fact that $\binom{n-c}{r=c} /\binom{r}{c}\binom{n}{r} =1 /\binom{n}{c}$.

By the defining properties of the space $H_{(1, \ldots, c)}$, it follows that the kernel $h_{c}$ is degenerate for $c \geq 2$. In fact, it is strongly degenerate in the sense that the conditional expectation of $h_{c}\left(X_{1}, \ldots, X_{c}\right)$ given any strict subset of the variables $X_{1}, \ldots, X_{c}$ is zero. In other words, the integral $\int h\left(x, X_{2}, \ldots, X_{c}\right) d P(x)$ with respect to any single argument vanishes. By the same reasoning, $U_{n, c}$ is uncorrelated with every measurable function that depends on strictly fewer than $c$ elements of $X_{1}, \ldots, X_{n}$.

We shall show that the sequence $n^{c / 2} U_{n, c}$ converges in distribution to a limit with variance $c!E h_{c}^{2}\left(X_{1}, \ldots, X_{c}\right)$ for every $c \geq 1$. Then it follows that the sequence $n^{c / 2}\left(U_{n}-\theta\right)$ converges in distribution for $c$ equal to the smallest value such that $h_{c} \not \equiv 0$. For $c \geq 2$ the limit distribution is not normal but is known as Gaussian chaos.

Because the idea is simple, but the statement of the theorem (apparently) necessarily complicated, first consider a special case: $c=3$ and a "product kernel" of the form

$$
h_{3}\left(x_{1}, x_{2}, x_{3}\right)=f_{1}\left(x_{1}\right) f_{2}\left(x_{2}\right) f_{3}\left(x_{3}\right) .
$$

A $U$-statistic corresponding to a product kernel can be rewritten as a polynomial in sums of the observations. For ease of notation, let $\mathbb{P}_{n} f=n^{-1} \sum_{i=1}^{n} f\left(X_{i}\right)$ (the empirical measure), and let $\mathbb{G}_{n} f=\sqrt{n}\left(\mathbb{P}_{n}-P\right) f$ (the empirical process), for $P$ the distribution of the observations $X_{1}, \ldots, X_{n}$. If the kernel $h_{3}$ is strongly degenerate, then each function $f_{i}$ has mean zero and hence $\mathbb{G}_{n} f_{i}=\sqrt{n} \mathbb{P}_{n} f_{i}$ for every $i$. Then, with ( $i_{1}, i_{2}, i_{3}$ ) ranging over all triplets of three different integers from $\{1, \ldots, n\}$ (taking position into account),

$$
\begin{aligned}
\frac{3!}{n^{3 / 2}}\binom{n}{3} U_{n, 3}= & \frac{1}{n^{3 / 2}} \sum_{\left(i_{1}, i_{2}, i_{3}\right)} f_{1}\left(x_{i_{1}}\right) f_{2}\left(x_{i_{2}}\right) f_{3}\left(x_{i_{3}}\right) \\
= & \mathbb{G}_{n} f_{1} \mathbb{G}_{n} f_{2} \mathbb{G}_{n} f_{3}-\mathbb{P}_{n}\left(f_{1} f_{2}\right) \mathbb{G}_{n} f_{3} \\
& -\mathbb{P}_{n}\left(f_{1} f_{3}\right) \mathbb{G}_{n} f_{2}-\mathbb{P}_{n}\left(f_{2} f_{3}\right) \mathbb{G}_{n} f_{1}+2 \frac{\mathbb{P}_{n}\left(f_{1} f_{2} f_{3}\right)}{\sqrt{n}}
\end{aligned}
$$

By the law of large numbers, $\mathbb{P}_{n} \rightarrow P f$ almost surely for every $f$, while, by the central limit theorem, the marginal distributions of the stochastic processes $f \mapsto \mathbb{G}_{n} f$ converge weakly to multivariate Gaussian laws. If $\left\{\mathbb{G} f: f \in L_{2}(\mathcal{X}, \mathcal{A}, P)\right\}$ denotes a Gaussian process with mean zero and covariance function $\mathrm{E} \mathbb{G} f \mathbb{G} g=P f g-P f P g$ (a $P$-Brownian bridge process), then $\mathbb{G}_{n} \rightsquigarrow \mathbb{G}$. Consequently,

$$
n^{3 / 2} U_{n, 3} \rightsquigarrow \mathbb{G} f_{1} \mathbb{G} f_{2} \mathbb{G} f_{3}-P\left(f_{1} f_{2}\right) \mathbb{G} f_{3}-P\left(f_{1} f_{3}\right) \mathbb{G} f_{2}-P\left(f_{2} f_{3}\right) \mathbb{G} f_{1}
$$

The limit is a polynomial of order 3 in the Gaussian vector ( $\mathbb{G} f_{1}, \mathbb{G} f_{2}, \mathbb{G} f_{3}$ ).
There is no similarly simple formula for the limit of a general sequence of degenerate $U$ statistics. However, any kernel can be written as an infinite linear combination of product kernels. Because a $U$-statistic is linear in its kernel, the limit of a general sequence of degenerate $U$-statistics is a linear combination of limits of the previous type.

To carry through this program, it is convenient to employ a decomposition of a given kernel in terms of an orthonormal basis of product kernels. This is always possible. We assume that $L_{2}(\mathcal{X}, \mathcal{A}, P)$ is separable, so that it has a countable basis.
12.8 Example (General kernel). If $1=f_{0}, f_{1}, f_{2}, \ldots$ is an orthonormal basis of $L_{2}(\mathcal{X}$, $\mathcal{A}, \boldsymbol{P}$ ), then the functions $f_{k_{1}} \times \cdots \times f_{k_{c}}$ with ( $k_{1}, \ldots, k_{c}$ ) ranging over the nonnegative integers form an orthonormal basis of $L_{2}\left(\mathcal{X}^{c}, \mathcal{A}^{c}, P^{c}\right)$. Any square-integrable kernel can be written in the form $h_{c}\left(x_{1}, \ldots, x_{c}\right)=\sum a\left(k_{1}, \ldots, k_{c}\right) f_{k_{1}} \times \cdots \times f_{k_{c}}$ for $a\left(k_{1}, \ldots, k_{c}\right)= \left\langle h_{c}, f_{k_{1}} \times \cdots \times f_{k_{c}}\right\rangle$ the inner products of $h_{c}$ with the basis functions.
12.9 Example (Second-order kernel). In the case that $c=2$, there is a choice that is specially adapted to our purposes. Because the kernel $h_{2}$ is symmetric and square-integrable by assumption, the integral operator $K: L_{2}(\mathcal{X}, \mathcal{A}, P) \mapsto L_{2}(\mathcal{X}, \mathcal{A}, P)$ defined by $K f(x)= \int h_{2}(x, y) f(y) d P(y)$ is self-adjoint and Hilbert-Schmidt. Therefore, it has at most countably many eigenvalues $\lambda_{0}, \lambda_{1}, \ldots$, satisfying $\sum \lambda_{k}^{2}<\infty$, and there exists an orthonormal basis of eigenfunctions $f_{0}, f_{1}, \ldots$ (See, for instance, Theorem VI. 16 in [124].) The kernel $h_{2}$ can be expressed relatively to this basis as

$$
h_{2}(x, y)=\sum_{k=0}^{\infty} \lambda_{k} f_{k}(x) f_{k}(y)
$$

For a degenerate kernel $h_{2}$ the function 1 is an eigenfunction for the eigenvalue 0 , and we can take $f_{0}=1$ without loss of generality.

The gain over the decomposition in the general case is that only product functions of the type $f \times f$ are needed.

The (nonnormalized) Hermite polynomial $H_{j}$ is a polynomial of degree $j$ with leading coefficient $x^{j}$ such that $\int H_{i}(x) H_{j}(x) \phi(x) d x=0$ whenever $i \neq j$. The Hermite polynomials of lowest degrees are $H_{0}=1, H_{1}(x)=x, H_{2}(x)=x^{2}-1$ and $H_{3}(x)=x^{3}-3 x$.
12.10 Theorem. Let $h_{c}: \mathcal{X}^{c} \mapsto \mathbb{R}$ be a permutation-symmetric, measurable function of $c$ arguments such that $\mathrm{E} h_{c}^{2}\left(X_{1}, \ldots, X_{c}\right)<\infty$ and $\mathrm{E} h_{c}\left(x_{1}, \ldots, x_{c-1}, X_{c}\right) \equiv 0$. Let $1=f_{0}, f_{1}, f_{2}, \ldots$ be an orthonormal basis of $L_{2}(\mathcal{X}, \mathcal{A}, P)$. Then the sequence of $U$ statistics $U_{n, c}$ with kernel $h_{c}$ based on $n$ observations from $P$ satisfies

$$
n^{c / 2} U_{n, c} \rightsquigarrow \sum_{k=\left(k_{1}, \ldots, k_{c}\right) \in \mathbb{N}^{c}}\left\langle h_{c}, f_{k_{1}} \times \cdots \times f_{k_{c}}\right\rangle \prod_{i=1}^{d(k)} H_{a_{l}(k)}\left(\mathbb{G} \psi_{i}(k)\right) .
$$

Here $\mathbb{G}$ is a $P$-Brownian bridge process, the functions $\psi_{1}(k), \ldots, \psi_{d(k)}(k)$ are the different elements in $f_{k_{1}}, \ldots, f_{k_{c}}$, and $a_{i}(k)$ is number of times $\psi_{i}(k)$ occurs among $f_{k_{1}}, \ldots, f_{k_{c}}$. The variance of the limit variable is equal to $c!\mathrm{E} h_{c}^{2}\left(X_{1}, \ldots, X_{c}\right)$.

Proof. The function $h_{c}$ can be represented in $L_{2}\left(\mathcal{X}^{c}, \mathcal{A}^{c}, P^{c}\right)$ as the series $\sum_{k}\left\langle h_{c}, f_{k_{1}} \times\right. \left.\ldots, f_{k_{c}}\right\rangle f_{k_{1}} \times \cdots \times f_{k_{c}}$. By the degeneracy of $h_{c}$ the sum can be restricted to $k=\left(k_{1}, \ldots, k_{c}\right)$ with every $k_{j} \geq 1$. If $U_{n, c} h$ denotes the $U$-statistic with kernel $h\left(x_{1}, \ldots, x_{c}\right)$, then, for a pair of degenerate kernels $h$ and $g$,

$$
\operatorname{cov}\left(U_{n, c} h, U_{n, c} g\right)=\frac{c!}{n(n-1) \cdots(n-c+1)} P^{c} h g .
$$

This means that the map $h \mapsto n^{c / 2} \sqrt{c!} U_{n, c} h$ is close to being an isometry between $L_{2}\left(P^{c}\right)$ and $L_{2}\left(P^{n}\right)$. Consequently, the series $\sum_{k}\left\langle h_{c}, f_{k_{1}} \times \cdots \times f_{k_{c}}\right\rangle U_{n, c} f_{k_{1}} \times \cdots \times f_{k_{c}}$ converges in $L_{2}\left(P^{n}\right)$ and equals $U_{n, c} h_{c}=U_{n, c}$. Furthermore, if it can be shown that the finite-dimensional distributions of the sequence of processes $\left\{U_{n, c} f_{k_{1}} \times \cdots \times f_{k_{c}}: k \in\right. \mathbb{N}^{c}$ \} converge weakly to the corresponding finite-dimensional distributions of the process $\left\{\prod_{i=1}^{d(k)} H_{a_{i}(k)}\left(\mathbb{G} \psi_{i}(k)\right): k \in \mathbb{N}^{c}\right\}$, then the partial sums of the series converge, and the proof can be concluded by approximation arguments.

There exists a polynomial $\hat{P}_{n, c}$ of degree $c$, with random coefficients, such that

$$
\frac{c!}{n^{c / 2}}\binom{n}{c} U_{n, c} f_{k_{1}} \times \cdots \times f_{k_{c}}=\hat{P}_{n, c}\left(\mathbb{G}_{n} f_{k_{1}}, \ldots, \mathbb{G}_{n} f_{k_{c}}\right)
$$

(See the example for $c=3$ and problem 12.13). The only term of degree $c$ in this polynomial is equal to $\mathbb{G}_{n} f_{k_{1}} \mathbb{G}_{n} f_{k_{2}} \cdots \mathbb{G}_{n} f_{k_{c}}$. The coefficients of the polynomials $\hat{P}_{n, c}$ converge in probability to constants. Conclude that the sequence $n^{c / 2} c!U_{n, c} f_{k_{1}} \times \cdots \times f_{k_{c}}$ converges in distribution to $P_{c}\left(\mathbb{G} f_{k_{1}}, \ldots, \mathbb{G} f_{k_{c}}\right)$ for a polynomial $P_{c}$ of degree $c$ with leading term, and only term of degree $c$, equal to $\mathbb{G} f_{k_{1}} \mathbb{G} f_{k_{2}} \cdots \mathbb{G} f_{k_{c}}$. This convergence is simultaneous in sets of finitely many $k$.

It suffices to establish the representation of this limit in terms of Hermite polynomials. This could be achieved directly by algebraic and combinatorial arguments, but then the occurrence of the Hermite polynomials would remain somewhat mysterious. Alternatively,
the representation can be derived from the definition of the Hermite polynomials and covariance calculations. By the degeneracy of the kernel $f_{k_{1}} \times \cdots \times f_{k_{c}}$, the $U$-statistic $U_{n . c} f_{k_{1}} \times \cdots \times f_{k_{c}}$ is orthogonal to all measurable functions of $c-1$ or fewer elements of $X_{1}, \ldots, X_{n}$, and their linear combinations. This includes the functions $\prod_{i}\left(\mathrm{G}_{n} g_{i}\right)^{a_{i}}$ for arbitrary functions $g_{i}$ and nonnegative integers $a_{i}$ with $\sum a_{i}<c$. Taking limits, we conclude that $P_{c}\left(\mathbb{G} f_{k_{1}}, \ldots, \mathbb{G} f_{k_{c}}\right)$ must be orthogonal to every polynomial in $\mathbb{G} f_{k_{1}}, \ldots, \mathbb{G} f_{k_{c}}$ of degree less than $c-1$. By the orthonormality of the basis $f_{i}$, the variables $G f_{i}$ are independent standard normal variables. Because the Hermite polynomials form a basis for the polynomials in one variable, their (tensor) products form a basis for the polynomials of more than one argument. The polynomial $P_{c}$ can be written as a linear combination of elements from this basis. By the orthogonality, the coefficients of base elements of degree $<c$ vanish. From the base elements of degree $c$ only the product as in the theorem can occur, as follows from consideration of the leading term of $P_{c}$. $\square$
12.11 Example. For $c=2$ and a basis $1=f_{0}, f_{1}, \ldots$ of eigenfunctions of the kernel $h_{2}$, we obtain a limit of the form $\sum_{k}\left\langle h_{2}, f_{k} \times f_{k}\right\rangle H_{2}\left(G f_{k}\right)$. By the orthonormality of the basis this variable is distributed as $\sum_{k} \lambda_{k}\left(Z_{k}^{2}-1\right)$ for $Z_{1}, Z_{2} \ldots$ a sequence of independent standard normal variables. $\square$
12.12 Example (Sample variance). The kernel $h\left(x_{1}, x_{2}\right)=\frac{1}{2}\left(x_{1}-x_{2}\right)^{2}$ yields the sample variance $S_{n}^{2}$. Because this has asymptotic variance $\mu_{4}-\mu_{2}^{2}$ (see Example 3.2), the kernel is degenerate if and only if $\mu_{4}=\mu_{2}^{2}$. This can happen only if $\left(X_{1}-\alpha_{1}\right)^{2}$ is constant, for $\alpha_{1}=\mathrm{E} X_{i}$. If we center the observations, so that $\alpha_{1}=0$, then this means that $X_{1}$ only takes the values $-\sigma$ and $\sigma=\sqrt{\mu_{2}}$, each with probability $1 / 2$. This is a very degenerate situation, and it is easy to find the limit distribution directly, but perhaps it is instructive to apply the general theorem. The kernels $h_{c}$ take the forms (See section 11.4),

$$
\begin{aligned}
h_{0} & =\mathrm{E} \frac{1}{2}\left(X_{1}-X_{2}\right)^{2}=\sigma^{2} . \\
h_{1}\left(x_{1}\right) & =\mathrm{E} \frac{1}{2}\left(x_{1}-X_{2}\right)^{2}-\sigma^{2} . \\
h_{2}\left(x_{1}, x_{2}\right) & =\frac{1}{2}\left(x_{1}-x_{2}\right)^{2}-\mathrm{E}_{\frac{1}{2}}\left(x_{1}-X_{2}\right)^{2}-\mathrm{E} \frac{1}{2}\left(X_{1}-x_{2}\right)^{2}+\sigma^{2} .
\end{aligned}
$$

The kernel is degenerate if $h_{1}=0$ almost surely, and then the second-order kernel is $h_{2}\left(x_{1}, x_{2}\right)=\frac{1}{2}\left(x_{1}-x_{2}\right)^{2}-\sigma^{2}$. Because the underlying distribution has only two support points, the eigenfunctions $f$ of the corresponding integral operator can be identified with vectors $(f(-\sigma), f(\sigma))$ in $\mathbb{R}^{2}$. Some linear algebra shows that they are $(1,1)$ and $(-1,1)$, corresponding to the eigenvalues 0 and $-\sigma^{2}$, respectively. Correspondingly, under degeneracy the kernel allows the decomposition

$$
h_{2}\left(x_{1}, x_{2}\right)=\frac{1}{2}\left(x_{1}^{2}+x_{2}^{2}\right)-\sigma^{2}-x_{1} x_{2}=-\sigma^{2}\left(\frac{x_{1}}{\sigma}\right)\left(\frac{x_{2}}{\sigma}\right) .
$$

We can conclude that the sequence $n\left(S_{n}^{2}-\mu_{2}\right)$ converges in distribution to $-\sigma^{2}\left(Z_{1}^{2}-1\right)$. $\square$
12.13 Example (Cramér-von Mises). Let $\mathrm{F}_{n}(x)=n^{-1} \sum_{i=1}^{n} 1\left\{X_{i} \leq x\right\}$ be the empirical distribution function of a random sample $X_{1}, \ldots, X_{n}$ of real-valued random variables. The Cramér-Von Mises statistic for testing the (null) hypothesis that the underlying cumulative
distribution is a given function $F$ is given by

$$
n \int\left(F_{n}-F\right)^{2} d F=\frac{1}{n} \sum_{i=1}^{n} \sum_{j=1}^{n} \int\left(1_{x_{i} \leq x}-F(x)\right)\left(1_{x_{j} \leq x}-F(x)\right) d F(x) .
$$

The double sum restricted to the off-diagonal terms is a $U$-statistic, with, under $H_{0}$, a degenerate kernel. Thus, this statistic converges to a nondegenerate limit distribution. The diagonal terms contribute the constant $\int F(1-F) d F$ to the limit distribution, by the law of large numbers. If $F$ is uniform, then the kernel of the $U$-statistic is

$$
h(x, y)=\frac{1}{2} x^{2}+\frac{1}{2} y^{2}-x \vee y+\frac{1}{3} .
$$

To find the eigenvalues of the corresponding integral operator $K$, we differentiate the identity $K f=\lambda f$ twice, to find the equation $\lambda f^{\prime \prime}+f=\int f(s) d s$. Because the kernel is degenerate, the constants are eigenfunctions for the cigenvalue 0 . The eigenfunctions corresponding to nonzero eigenvalues are orthogonal to this eigenspace, whence $\int f(s) d s=0$. The equation $\lambda f^{\prime \prime}+f=0$ has solutions $\cos a x$ and $\sin a x$ for $a^{2}=\lambda^{-1}$. Reinserting these in the original equation or utilizing the relation $\int f(s) d s=0$, we find that the nonzero eigenvalues are equal to $j^{-2} \pi^{-2}$ for $j \in N$, with eigenfunctions $\sqrt{2} \cos \pi j x$. Thus, the Cramér-Von Mises statistic converges in distribution to $1 / 6+\sum_{j=1}^{\infty} j^{-2} \pi^{-2}\left(Z_{j}^{2}-1\right)$. For another derivation of the limit distribution, see Chapter 19.

## Notes

The main part of this chapter has its roots in the paper by Hoeffding [76]. Because the asymptotic variance is smaller than the true variance of a $U$-statistic, Hocffding recommends to apply a standard normal approximation to $(U-E U) / s d U$. Degenerate $U$-statistics were considered, among others, in [131] within the context of more general lincar combinations of symmetric kernels. Arcones and Gine [2] have studied the weak convergence of "U-processes", stochastic processes indexed by classes of kernels, in spaces of bounded functions as discussed in Chapter 18.

## PROBLEMS

1. Derive the asymptotic distribution of Gini's mean difference, which is defined as $\binom{n}{2}^{-1} \sum \sum_{i<j} \left|X_{i}-X_{j}\right|$.
2. Derive the projection of the sample variance.
3. Find a kemel for the parameter $\theta=\mathrm{E}(X-\mathrm{E} X)^{3}$.
4. Find a kernel for the parameter $\theta=\operatorname{cov}(X, Y)$. Show that the corresponding $U$-statistic is the sample covariance $\sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)\left(Y_{i}-\bar{Y}\right) /(n-1)$.
5. Find the limit distribution of $U=\binom{n}{2}^{-1} \sum \sum_{i<j}\left(Y_{j}-Y_{i}\right)\left(X_{j}-X_{i}\right)$.
6. Let $U_{n 1}$ and $U_{n 2}$ be $U$-statistics with kernels $h_{1}$ and $h_{2}$, respectively. Derive the joint asymptotic distribution of $\left(U_{n 1}, U_{n 2}\right)$.
7. Suppose $E X_{1}^{2}<\infty$. Derive the asymptotic distribution of the sequence $n^{-1} \sum \sum_{i \neq j} X_{i} X_{j}$. Can you give a two line proof without using the $U$-statistic theorem? What happens if $E X_{1}=0$ ?
8. (Mann's test against trend.) To test the null hypothesis that a sample $X_{1}, \ldots, X_{n}$ is i.i.d. against the alternative hypothesis that the distributions of the $X_{i}$ are stochastically increasing in $i$, Mann
suggested to reject the null hypothesis if the number of pairs $\left(X_{i}, X_{j}\right)$ with $i<j$ and $X_{i}<X_{j}$ is large. How can we choose the critical value for large $n$ ?
9. Show that the $U$-statistic $U$ with kernel $1\left\{x_{1}+x_{2}>0\right\}$, the signed rank statistic $W^{+}$, and the positive-sign statistic $S=\sum_{i=1}^{n} 1\left\{X_{i}>0\right\}$ are related by $W^{+}=\binom{n}{2} U+S$ in the case that there are no tied observations.
10. A $V$-statistic of order 2 is of the form $n^{-2} \sum_{i=1}^{n} \sum_{j=1}^{n} h\left(X_{i}, X_{j}\right)$ where $h(x, y)$ is symmetric in $x$ and $y$. Assume that $\mathrm{E} h^{2}\left(X_{1}, X_{1}\right)<\infty$ and $\mathrm{E}^{2}\left(X_{1}, X_{2}\right)<\infty$. Obtain the asymptotic distribution of a $V$-statistic from the corresponding result for a $U$-statistic.
11. Define a $V$-statistic of general order $r$ and give conditions for its asymptotic normality.
12. Derive the asymptotic distribution of $n\left(S_{n}^{2}-\mu_{2}\right)$ in the case that $\mu_{4}=\mu_{2}^{2}$ by using the deltamethod (see Example 12.12). Does it make a difference whether we divide by $n$ or $n-1$ ?
13. For any ( $n \times c$ ) matrix $a_{i j}$ we have

$$
\sum_{i} a_{i_{1}, 1} \cdots a_{i_{c}, c}=\sum_{\mathcal{B}} \prod_{B \in \mathcal{B}}(-1)^{|B|-1}(B \mid-1)!\sum_{i=1}^{n} \prod_{j \in B} a_{i j} .
$$

Here the sum on the left ranges over all ordered subsets $\left(i_{1}, \ldots, i_{c}\right)$ of different integers from $\{1, \ldots, n\}$ and the first sum on the right ranges over all partitions $\mathcal{B}$ of $\{1, \ldots, c\}$ into nonempty sets (see Example [131]).
14. Given a sequence of i.i.d. random variables $X_{1}, X_{2}, \ldots$, let $\mathcal{A}_{n}$ be the $\sigma$-field generated by all functions of $\left(X_{1}, X_{2}, \ldots\right)$ that are symmetric in their first $n$ arguments. Prove that a sequence $U_{n}$ of $U$-statistics with a fixed kernel $h$ of order $r$ is a reverse martingale (for $n \geq r$ ) with respect to the filtration $\mathcal{A}_{r} \supset \mathcal{A}_{r+1} \supset \cdots$.
15. (Strong law.) If $\mathrm{E}\left|h\left(X_{1}, \cdots, X_{r}\right)\right|<\infty$, then the sequence $U_{n}$ of $U$-statistics with kernel $h$ converges almost surely to $\mathrm{E} h\left(X_{1}, \cdots, X_{r}\right)$. (For $r>1$ the condition is not necessary, but a simple necessary and sufficient condition appears to be unknown.) Prove this. (Use the preceding problem, the martingale convergence theorem, and the Hewitt-Savage 0-1 law.)

## 13

## Rank, Sign, and Permutation Statistics

> Statistics that depend on the observations only through their ranks can be used to test hypotheses on departures from the null hypothesis that the observations are identically distributed. Such rank statistics are attractive, because they are distribution-free under the null hypothesis and need not be less efficient, asymptotically. In the case of a sample from a symmetric distribution, statistics based on the ranks of the absolute values and the signs of the observations have a similar property. Rank statistics are a special example of permutation statistics.

### 13.1 Rank Statistics

The order statistics $X_{N(1)} \leq X_{N(2)} \leq \cdots \leq X_{N(N)}$ of a set of real-valued observations $X_{1}, \ldots, X_{N} i$ th order statistic are the values of the observations positioned in increasing order. The rank $R_{N i}$ of $X_{i}$ among $X_{1}, \ldots, X_{N}$ is its position number in the order statistics. More precisely, if $X_{1}, \ldots, X_{N}$ are all different, then $R_{N i}$ is defined by the equation

$$
X_{i}=X_{N\left(R_{N i}\right)} .
$$

If $X_{i}$ is tied with some other observations, this definition is invalid. Then the rank $R_{N i}$ is defined as the average of all indices $j$ such that $X_{i}=X_{N(j)}$ (sometimes called the midrank), or alternatively as $\sum_{j=1}^{N} 1\left\{X_{j} \leq X_{i}\right\}$ (which is something like an uprank).

In this section it is assumed that the random variables $X_{1}, \ldots, X_{N}$ have continuous distribution functions, so that ties in the observations occur with probability zero. We shall neglect the latter null set. The ranks and order statistics are written with double subscripts, because $N$ varies and we shall consider order statistics of samples of different sizes. The vectors of order statistics and ranks are abbreviated to $X_{N()}$ and $R_{N}$, respectively.

A rank statistic is any function of the ranks. A linear rank statistic is a rank statistic of the special form $\sum_{i=1}^{N} a_{N}\left(i, R_{N i}\right)$ for a given $(N \times N)$ matrix $\left(a_{N}(i, j)\right)$. In this chapter we are be concerned with the subclass of simple linear rank statistics, which take the form

$$
\sum_{i=1}^{N} c_{N i} a_{N, R_{N \imath}} .
$$

Here $\left(c_{N 1}, \ldots, c_{N N}\right)$ and $\left(a_{N 1}, \ldots, a_{N N}\right)$ are given vectors in $\mathbb{R}^{N}$ and are called the coefficients and scores, respectively. The class of simple linear rank statistics is sufficiently large
to contain interesting statistics for testing a variety of hypotheses. In particular, we shall see that it contains all "locally most powerful" rank statistics, which in another chapter are shown to be asymptotically efficient within the class of all tests.

Some elementary properties of ranks and order statistics are gathered in the following lemma.
13.1 Lemma. Let $X_{1}, \ldots, X_{N}$ be a random sample from a continuous distribution function $F$ with density $f$. Then
(i) the vectors $X_{N()}$ and $R_{N}$ are independent;
(ii) the vector $X_{N()}$ has density $N!\prod_{i=1}^{N} f\left(x_{i}\right)$ on the set $x_{1}<\cdots<x_{N}$ :
(iii) the variable $X_{N(i)}$ has density $N\binom{N-1}{i-1} F(x)^{i-1}(1-F(x))^{N-i} f(x)$; for $F$ the uniform distribution on [ 0,1 ], it has mean $i /(N+1)$ and variance $i(N-i+1) / \left((N+1)^{2}(N+2)\right)$;
(iv) the vector $R_{N}$ is uniformly distributed on the set of all $N$ ! permutations of $1,2, \ldots$, N:
(v) for any statistic $T$ and pernutation $r=\left(r_{1}, \ldots, r_{N}\right)$ of $1,2, \ldots, N$,

$$
\mathrm{E}\left(T\left(X_{1}, \ldots, X_{N}\right) \mid R_{N}=r\right)=\mathrm{E} T\left(X_{N\left(r_{1}\right)}, \ldots, X_{N\left(r_{N}\right)}\right) ;
$$

(vi) for any simple linear rank statistic $T=\sum_{i=1}^{N} c_{N i} a_{N, R_{N},}$.

$$
\mathrm{E} T=N \bar{c}_{N} \bar{a}_{N}: \quad \operatorname{var} T=\frac{1}{N-1} \sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right)^{2} \sum_{i=1}^{N}\left(a_{N i}-\bar{a}_{N}\right)^{2} .
$$

Proof. Statements (i) through (iv) are well-known and elementary. For the proof of (v), it is helpful to write $T\left(X_{1}, \ldots, X_{N}\right)$ as a function of the ranks and the order statistics. Next, we apply (i). For the proof of statement (vi), we use that the distributions of the variables $R_{N i}$ and the vectors $\left(R_{N i}, R_{N,}\right)$ for $i \neq j$ are uniform on the scts $I=\{1, \ldots, N\}$ and $\{(i, j) \in \left.l^{2}: i \neq j\right\}$, respectively. Furthermore, a double sum of the form $\sum_{i \neq j}\left(b_{i}-\bar{b}\right)\left(b_{j}-\bar{b}\right)$ is equal to $-\sum_{i}\left(b_{i}-\bar{b}\right)^{2}$.

It follows that rank statistics are distribution-free over the set of all models in which the observations are independent and identically distributed. On the one hand, this makes them statistically useless in situations in which the observations are, indeed, a random sample from some distribution. On the other hand, it makes them of great interest to detect certain differences in distribution between the observations, such as in the two-sample problem. If the null hypothesis is taken to assert that the observations are identically distributed, then the critical values for a rank test can be chosen in such a way that the probability of an error of the first kind is equal to a given level $\alpha$, for any probability distribution in the null hypothesis. Somewhat surprisingly, this gain is not necessarily counteracted by a loss in asymptotic efficiency, as we see in Chapter 14.
13.2 Example (Two-sample location problem). Suppose that the total set of observations consists of two independent random samples, inconsistently with the preceding notation written as $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$. Set $N=m+n$ and let $R_{N}$ be the rank vector of the pooled sample $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$.

We are interested in testing the null hypothesis that the two samples are identically distributed (according to a continuous distribution) against the alternative that the distribution of the second sample is stochastically larger than the distribution of the first sample. Even without a more precise description of the alternative hypothesis, we can discuss a collection of useful rank statistics. If the $Y_{j}$ are a sample from a stochastically larger distribution, then the ranks of the $Y_{j}$ in the pooled sample should be relatively large. Thus, any measure of the size of the ranks $R_{N, m+1}, \ldots, R_{N N}$ can be used as a test statistic. It will be distribution-free under the null hypothesis.

The most popular choice in this problem is the Wilcoxon statistic

$$
W=\sum_{i=m+1}^{N} R_{N i} .
$$

This is a simple linear rank statistic with coefficients $c=(0, \ldots, 0,1, \ldots, 1)$, and scores $a=(1, \ldots, N)$. The null hypothesis is rejected for large values of the Wilcoxon statistic. (The Wilcoxon statistic is equivalent to the Mann-Whitney statistic $U=\sum_{i, j} 1\left\{X_{i} \leq Y_{j}\right\}$ in that $W=U+\frac{1}{2} n(n+1)$.)

There are many other reasonable choices of rank statistics, some of which are of special interest and have names. For instance, the van der Waerden statistic is defined as

$$
\sum_{i=m+1}^{N} \Phi^{-1}\left(R_{N i}\right) .
$$

Here $\Phi^{-1}$ is the standard normal quantile function. We shall see ahead that this statistic is particularly attractive if it is believed that the underlying distribution of the observations is approximately normal. A general method to generate useful rank statistics is discussed below.

A critical value for a test based on a (distribution-free) rank statistic can be found by simply tabulating its null distribution. For a large number of observations this is a bit tedious. In most cases it is also unnecessary, because there exist accurate asymptotic approximations. The remainder of this section is concerned with proving asymptotic normality of simple linear rank statistics under the null hypothesis. Apart from being useful for finding critical values, the theorem is used subsequently to study the asymptotic efficiency of rank tests.

Consider a rank statistic of the form $T_{N}=\sum_{i=1}^{N} c_{N i} a_{N . R_{N} t}$. For a sequence of this type to be asymptotically normal, some restrictions on the coefficients $c$ and scores $a$ are necessary. In most cases of interest, the scores are "generated" through a given function $\phi:[0,1] \mapsto \mathbb{R}$ in one of two ways. Either

$$
\begin{equation*}
a_{N i}=\mathrm{E} \phi\left(U_{N(1)}\right) . \tag{13.3}
\end{equation*}
$$

where $U_{N(1)}, \ldots, U_{N(N)}$ are the order statistics of a sample of size $N$ from the uniform distribution on $[0,1]$; or

$$
\begin{equation*}
a_{N i}=\phi\left(\frac{i}{N+1}\right) . \tag{13.4}
\end{equation*}
$$

For well-behaved functions $\phi$, these definitions are closely related and almost identical, because $i /(N+1)=E U_{N(i)}$. Scores of the first type correspond to the locally most
powerful rank tests that are discussed ahead; scores of the second type are attractive in view of their simplicity.
13.5 Theorem. Let $R_{N}$ be the rank vector of an i.i.d. sample $X_{1}, \ldots, X_{N}$ from the continuous distribution function $F$. Let the scores $a_{N}$ be generated according to (13.3) for a measurable function $\phi$ that is not constant almost everywhere, and satisfies $\int_{0}^{1} \phi^{2}(u) d u< \infty$. Define the variables

$$
T_{N}=\sum_{i=1}^{N} c_{N i} a_{N, R_{N}}, \quad \tilde{T}_{N}=N \bar{c}_{N} \bar{a}_{N}+\sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right) \phi\left(F\left(X_{i}\right)\right) .
$$

Then the sequences $T_{N}$ and $\tilde{T}_{N}$ are asymptotically equivalent in the sense that $\mathrm{E} T_{N}=\mathrm{E} \tilde{T}_{N}$ and $\operatorname{var}\left(T_{N}-\tilde{T}_{N}\right) / \operatorname{var} T_{N} \rightarrow 0$. The same is true if the scores are generated according to (13.4) for a function $\phi$ that is continuous almost everywhere, is nonconstant, and satisfies $N^{-1} \sum_{i=1}^{N} \phi^{2}(i /(N+1)) \rightarrow \int_{0}^{1} \phi^{2}(u) d u<\infty$.

Proof. Set $U_{i}=F\left(X_{i}\right)$, and view the rank vector $R_{N}$ as the ranks of the first $N$ elements of the infinite sequence $U_{1}, U_{2}, \ldots$ In view of statement (v) of the Lemma 13.1 the definition (13.3) is equivalent to

$$
a_{N, R_{N}}=\mathrm{E}\left(\phi\left(U_{i}\right) \mid R_{N}\right) .
$$

This immediately yields that the projection of $\tilde{T}_{N}$ onto the set of all square-integrable functions of $R_{N}$ is equal to $T_{N}=\mathrm{E}\left(\tilde{T}_{N} \mid R_{N}\right)$. It is straightforward to compute that

$$
\frac{\operatorname{var} T_{N}}{\operatorname{var} \tilde{T}_{N}}=\frac{1 /(N-1) \sum\left(c_{N i}-\bar{c}_{N}\right)^{2} \sum\left(a_{N i}-\bar{a}_{N}\right)^{2}}{\sum\left(c_{N i}-\bar{c}_{N}\right)^{2} \operatorname{var} \phi\left(U_{1}\right)}=\frac{N}{N-1} \frac{\operatorname{var} a_{N, R_{N 1}}}{\operatorname{var} \phi\left(U_{1}\right)} .
$$

If it can be shown that the right side converges to 1 , then the sequences $T_{N}$ and $\tilde{T}_{N}$ are asymptotically equivalent by the projection theorem, Theorem 11.2, and the proof for the scores (13.3) is complete.

Using a martingale convergence theorem, we shall show the stronger statement

$$
\begin{equation*}
\mathrm{E}\left(a_{N, R_{N 1}}-\phi\left(U_{1}\right)\right)^{2} \rightarrow 0 . \tag{13.6}
\end{equation*}
$$

Because each rank vector $R_{j-1}$ is a function of the next rank vector $R_{j}$ (for one observation more), it follows that $a_{N, R_{N 1}}=\mathrm{E}\left(\phi\left(U_{1}\right) \mid R_{1}, \ldots, R_{N}\right)$ almost surely. Because $\phi$ is squareintegrable, a martingale convergence theorem (e.g., Theorem 10.5.4 in [42]) yields that the sequence $a_{N, R_{N 1}}$ converges in second mean and almost surely to $\mathrm{E}\left(\phi\left(U_{1}\right) \mid R_{1}, R_{2}, \ldots\right)$. If $\phi\left(U_{1}\right)$ is measurable with respect to the $\sigma$-field generated by $R_{1}, R_{2}, \ldots$, then the conditional expectation reduces to $\phi\left(U_{1}\right)$ and (13.6) follows.

The projection of $U_{1}$ onto the set of measurable functions of $R_{N 1}$ equals the conditional expectation $\mathrm{E}\left(U_{1} \mid R_{N 1}\right)=R_{N 1} /(N+1)$. By a straightforward calculation, the sequence $\operatorname{var}\left(R_{N 1} /(N+1)\right)$ converges to $1 / 12=\operatorname{var} U_{1}$. By the projection Theorem 11.2 it follows that $R_{N 1} /(N+1) \rightarrow U_{1}$ in quadratic mean. Because $R_{N 1}$ is measurable in the $\sigma$-field generated by $R_{1}, R_{2}, \ldots$, for every $N$, so must be its limit $U_{1}$. This concludes the proof that $\phi\left(U_{1}\right)$ is measurable with respect to the $\sigma$-field generated by $R_{1}, R_{2}, \ldots$ and hence the proof of the theorem for the scores 13.3.

Next, consider the case that the scores are generated by (13.4). To avoid confusion, write these scores as $b_{N i}=\phi(1 /(N+1))$, and let $a_{N i}$ be defined by (13.3) as before. We shall prove that the sequences of rank statistics $S_{N}$ and $T_{N}$ defined from the scores $a_{N}$ and $b_{N}$, respectively, are asymptotically equivalent.

Because $R_{N 1} /(N+1)$ converges in probability to $U_{1}$ and $\phi$ is continuous almost everywhere, it follows that $\phi\left(R_{N 1} /(N+1)\right) \rightarrow \phi\left(U_{1}\right)$. The assumption on $\phi$ is exactly that $\mathrm{E} \phi^{2}\left(R_{N 1} /(N+1)\right)$ converges to $\mathrm{E} \phi^{2}\left(U_{1}\right)$. By Proposition 2.29, we conclude that $\phi\left(R_{N 1} /(N+1)\right) \rightarrow \phi\left(U_{1}\right)$ in second mean. Combining this with (13.6), we obtain that

$$
\frac{1}{N} \sum_{i=1}^{N}\left(a_{N i}-b_{N i}\right)^{2}=\mathrm{E}\left(a_{N, R_{N 1}}-\phi\left(\frac{R_{N 1}}{N+1}\right)\right)^{2} \rightarrow 0
$$

By the formula for the variance of a linear rank statistic, we obtain that

$$
\frac{\operatorname{var}\left(S_{N}-T_{N}\right)}{\operatorname{var} T_{N}}=\frac{\sum_{i=1}^{N}\left(a_{N i}-b_{N i}-\left(\bar{a}_{N}-\bar{b}_{N}\right)\right)^{2}}{\sum_{i=1}^{N}\left(a_{N i}-\bar{a}_{N}\right)^{2}} \rightarrow 0
$$

because $\operatorname{var} a_{N, R_{N 1}} \rightarrow \operatorname{var} \phi\left(U_{1}\right)>0$. This implies that $\operatorname{var} S_{N} / \operatorname{var} T_{N} \rightarrow 1$. The proof is complete.

Under the conditions of the preceding theorem, the sequence of rank statistics $\sum c_{N i} a_{N, R_{N i}}$ is asymptotically equivalent to a sum of independent variables. This sum is asymptotically normal under the Lindeberg-Feller condition, given in Proposition 2.27. In the present case, because the variables $\phi\left(F\left(X_{i}\right)\right)$ are independent and identically distributed, this is implied by

$$
\begin{equation*}
\frac{\max _{1 \leq i \leq N}\left(c_{N i}-\bar{c}_{N}\right)^{2}}{\sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right)^{2}} \rightarrow 0 . \tag{13.7}
\end{equation*}
$$

This is satisfied by the most important choices of vectors of coefficients.
13.8 Corollary. If the vector of coefficients $c_{N}$ satisfies (13.7), and the scores are generated according to (13.3) for a measurable, nonconstant, square-integrable function $\phi$, then the sequence of standardized rank statistics $\left(T_{N}-\mathrm{E} T_{N}\right) / \mathrm{sd} T_{N}$ converges weakly to an $N(0,1)$-distribution. The same is true if the scores are generated by (13.4) for a function $\phi$ that is continuous almost everywhere, is nonconstant, and satisfies $N^{-1} \sum_{i=1}^{N} \phi^{2}(i /(N+$ 1)) $\rightarrow \int_{0}^{1} \phi^{2}(u) d u$.
13.9 Example (Monotone score generating functions). Any nondecreasing, nonconstant function $\phi$ satisfies the conditions imposed on score-generating functions of the type (13.4) in the preceding theorem and corollary. The same is true for every $\phi$ that is of bounded variation, because any such $\phi$ is a difference of two monotone functions.

To see this, we recall from the preceding proof that it is always true that $R_{N 1} /(N+1) \rightarrow U_{1}$, almost surely. Furthermore,

$$
\mathrm{E} \phi^{2}\left(\frac{R_{N 1}}{N+1}\right)=\frac{1}{N} \sum_{i=1}^{N} \phi^{2}\left(\frac{i}{N+1}\right) \leq \frac{N+1}{N} \sum_{i=1}^{N} \int_{i /(N+1)}^{(i+1) /(N+1)} \phi^{2}(u) d u
$$

The right side converges to $\int \phi^{2}(u) d u$. Because $\phi$ is continuous almost everywhere, it follows by Proposition 2.29 that $\phi\left(R_{N 1} /(N+1)\right) \rightarrow \phi\left(U_{1}\right)$ in quadratic mean.
13.10 Example (Two-sample problem). In a two-sample problem, in which the first $m$ observations constitute the first sample and the remaining observations $n=N-m$ the second, the coefficients are usually chosen to be

$$
c_{N i}= \begin{cases}0 & i=1, \ldots, m \\ 1 & i=m+1, \ldots, m+n\end{cases}
$$

In this case $\bar{c}_{N}=n / N$ and $\sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right)^{2}=m n / N$. The Lindeberg condition is satisfied provided both $m \rightarrow \infty$ and $n \rightarrow \infty$.
13.11 Example (Wilcoxon test). The function $\phi(u)=u$ generates the scores $a_{N i}= i /(N+1)$. Combined with "two-sample coefficients," it yields a multiple of the Wilcoxon statistic. According to the preceding theorem, the sequence of Wilcoxon statistics $W_{N}= \sum_{i=m+1}^{N} R_{N i} /(N+1)$ is asymptotically equivalent to

$$
\tilde{W}_{N}=-\frac{n}{N} \sum_{i=1}^{m} F\left(X_{i}\right)+\frac{m}{N} \sum_{j=1}^{n} F\left(Y_{j}\right)+N \frac{n}{N} \frac{1}{2} .
$$

The expectations and variances of these statistics are given by $\mathrm{E} W_{N}=\mathrm{E} \tilde{W}_{N}=n / 2$, $\operatorname{var} W_{N}=m n /(12(N+1))$, and $\operatorname{var} \tilde{W}_{N}=m n /(12 N)$.
13.12 Example (Median test). The median test is a two-sample rank test with scores of the form $a_{N i}=\phi(i /(N+1))$ generated by the function $\phi(u)=1_{(0,1 / 2]}(u)$. The corresponding test statistic is

$$
\sum_{i=m+1}^{N} 1\left\{R_{N i} \leq \frac{N+1}{2}\right\}
$$

This counts the number of $Y_{j}$ less than the median of the pooled sample. Large values of this test statistic indicate that the distribution of the second sample is stochastically smaller than the distribution of the first sample.

The examples of rank statistics discussed so far have a direct intuitive meaning as statistics measuring a difference in location. It is not always obvious to find a rank statistic appropriate for testing certain hypotheses. Which rank statistics measure a difference in scale, for instance?

A general method of generating rank statistics for a specific situation is as follows. Suppose that it is required to test the null hypothesis that $X_{1}, \ldots, X_{N}$ are i.i.d. versus the alternative that $X_{1}, \ldots, X_{N}$ are independent with $X_{i}$ having a distribution with density $f_{c_{N i} \theta}$, for a given one-dimensional parametric model $\theta \mapsto f_{\theta}$. According to the Neyman-Pearson lemma, the most powerful rank test for testing $H_{0}: \theta=0$ against the simple alternative $H_{1}: \theta=\theta$ rejects the null hypothesis for large values of the quotient

$$
\frac{\mathrm{P}_{\theta}\left(R_{N}=r\right)}{\mathrm{P}_{0}\left(R_{N}=r\right)}=N!\mathrm{P}_{\theta}\left(R_{N}=r\right)
$$

Equivalently, the null hypothesis is rejected for large values of $\mathrm{P}_{\theta}\left(R_{N}=r\right)$. This test depends on the alternative $\theta$, but this dependence disappears if we restrict ourselves to
alternatives $\theta$ that are sufficiently close to 0 . Indeed, under regularity conditions,

$$
\begin{aligned}
& \mathrm{P}_{\theta}\left(R_{N}=r\right)-\mathrm{P}_{0}\left(R_{N}=r\right) \\
&=\int \cdots \int_{R_{N}=r}\left(\prod_{i=1}^{N} f_{c_{N i} \theta}\left(x_{i}\right)-\prod_{i=1}^{N} f_{0}\left(x_{i}\right)\right) d x_{1} \cdots d x_{N} \\
&=\theta \int \cdots \int_{R_{N}=r} \sum_{i=1}^{N} c_{N i} \frac{\dot{f}_{0}}{f_{0}}\left(x_{i}\right) \prod_{i=1}^{N} f_{0}\left(x_{i}\right) d x_{1} \cdots d x_{N}+o(\theta) \\
&=\theta \frac{1}{N!} \sum_{i=1}^{N} c_{N i} \mathrm{E}_{0}\left(\left.\frac{\dot{f}_{0}}{f_{0}}\left(X_{i}\right) \right\rvert\, R_{N}=r\right)+o(\theta)
\end{aligned}
$$

Conclude that, for small $\theta>0$, large values of $\mathrm{P}_{\theta}\left(R_{N}=r\right)$ correspond to large values of the simple linear rank statistic $T_{N}=\sum_{i=1}^{N} c_{N i} a_{N, R_{N i}}$, for the vector $a_{N}$ of scores given by

$$
a_{N i}=\mathrm{E}_{0} \frac{\dot{f}_{0}}{f_{0}}\left(X_{N_{(i)}}\right)=\mathrm{E} \frac{\dot{f}_{0}}{f_{0}}\left(F_{0}^{-1}\left(U_{N_{(i)}}\right)\right)
$$

These scores are of the form (13.3), with score-generating function $\phi=\left(\dot{f}_{0} / f_{0}\right) \circ F_{0}^{-1}$. Thus the corresponding rank statistics are asymptotically equivalent to the statistics $\sum_{i=1}^{N} c_{N i} \dot{f}_{0} / f_{0}\left(X_{i}\right)$.

Rank statistics with scores generated as in the preceding display yield locally most powerful rank tests. They are most powerful within the class of all rank tests, uniformly in a sufficiently small neighbourhood $(0, \varepsilon)$ of 0 . (For a precise statement, see problem 13.1). Such a local optimality property may seem weak, but it is actually of considerable importance, particularly if the number of observations is large. In the latter situation, any reasonable test can discriminate well between the null hypothesis and "distant" alternatives. A good test proves itself by having high power in discriminating "close" alternatives.
13.13 Example (Two-sample scale). To generate a test statistic for the two-sample scale problem, let $f_{\theta}(x)=e^{-\theta} f\left(e^{-\theta} x\right)$ for a fixed density $f$. If $X_{i}$ has density $f_{c_{N i} \theta}$ and the vector $c$ is chosen equal to the usual vector of two-sample coefficients, then the first $m$ observations have density $f_{0}=f$; the last $n=N-m$ observations have density $f_{\theta}$. The alternative hypothesis that the second sample has larger scale corresponds to $\theta>0$. The scores for the locally most powerful rank test are given by

$$
a_{N i}=-\mathrm{E}\left(1+F^{-1}\left(U_{N_{(i)}}\right) \frac{f^{\prime}}{f}\left(F^{-1}\left(U_{N_{(i)}}\right)\right)\right) .
$$

For instance, for $f$ equal to the standard normal density this leads to the rank statistic $\sum_{i=m+1}^{N} a_{N, R_{N i}}$ with scores

$$
a_{N i}=\mathrm{E} \Phi^{-1}\left(U_{N_{(i)}}\right)^{2}-1
$$

The same test is found for $f$ equal to a normal density with a different mean or variance. This follows by direct calculation, or alternatively from the fact that rank statistics are location and scale invariant. The latter implies that the probabilities $\mathrm{P}_{\mu, \sigma, \theta}\left(R_{N}=r\right)$ of the rank vector $R_{N}$ of a sample of independent variables $X_{1}, \ldots, X_{N}$ with $X_{i}$ distributed according to $e^{-\theta} f\left(e^{-\theta}(x-\mu) / \sigma\right) / \sigma$ do not depend on ( $\mu, \sigma$ ). Thus the procedure to generate locally most powerful scores yields the same result for any ( $\mu, \sigma$ ).
13.14 Example (Two-sample location). In order to find locally most powerful tests for location, we choose $f_{\theta}(x)=f(x-\theta)$ for a fixed density $f$ and the coefficients $c$ equal to the two-sample coefficients. Then the first $m$ observations have density $f(x)$ and the last $n=N-m$ observations have density $f(x-\theta)$. The scores for a locally most powerful rank test are

$$
a_{N i}=-\mathrm{E}\left(\frac{f^{\prime}}{f}\left(F^{-1}\left(U_{N_{(i)}}\right)\right)\right) .
$$

For the standard normal density, this leads to a variation of the van der Waerden statistic. The Wilcoxon statistic corresponds to the logistic density.
13.15 Example (Log rank test). The cumulative hazard function corresponding to a continuous distribution function $F$ is the function $\Lambda=-\log (1-F)$. This is an important modeling tool in survival analysis. Suppose that we wish to test the null hypothesis that two samples with cumulative hazard functions $\Lambda_{X}$ and $\Lambda_{Y}$ are identically distributed against the alternative that they are not. The hypothesis of proportional hazards postulates that $\Lambda_{Y}=\theta \Lambda_{X}$ for a constant $\theta$, meaning that the second sample is a factor $\theta$ more "at risk" at any time. If we wish to have large power against alternatives that satisfy this postulate, then it makes sense to use the locally most powerful scores corresponding to a family defined by $\Lambda_{\theta}=\theta \Lambda_{1}$. The corresponding family of cumulative distribution functions $F_{\theta}$ satisfies $1-F_{\theta}=\left(1-F_{1}\right)^{\theta}$ and is known as the family of Lehmann alternatives. The locally most powerful scores for this family correspond to the generating function

$$
\phi(u)=\frac{\partial}{\partial \theta} \log \frac{\partial}{\partial x}\left(1-F_{\theta}\right)(x)_{\mid \theta=1, x=F_{1}^{-1}(u)}=1-\log (1-u) .
$$

It is fortunate that the score-generating function does not depend on the baseline hazard function $\Lambda_{1}$. The resulting test is known as the log rank test. The test is related to the Savage test, which uses the scores

$$
a_{N, i}=\sum_{j=N-i+1}^{N} \frac{1}{j} \approx-\log \left(1-\frac{i}{N+1}\right) .
$$

The log rank test is a very popular test in survival analysis. Then usually it needs to be extended to the situation that the observations are censored.
13.16 Example (More-sample problem). Suppose the problem is to test the hypothesis that $k$ independent random samples $X_{1}, \ldots, X_{N_{1}}, X_{N_{1}+1}, \ldots, X_{N_{2}}, \ldots, X_{N_{k-1}+1}, \ldots, X_{N_{k}}$ are identical in distribution. Let $N=N_{k}$ be the total number of observations, and let $R_{N}$ be the rank vector of the pooled sample $X_{1}, \ldots, X_{N}$. Given scores $a_{N}$ inference can be based on the rank statistics

$$
T_{N 1}=\sum_{i=1}^{N_{1}} a_{N, R_{N i}}, \quad T_{N 2}=\sum_{i=N_{1}+1}^{N_{2}} a_{N, R_{N i}}, \ldots, T_{N k}=\sum_{i=N_{k-1}+1}^{N_{k}} a_{N, R_{N i}} .
$$

The testing procedure can consist of several two-sample tests, comparing pairs of (pooled) subsamples, or on an overall statistic. One possibility for an overall statistic is the chi-square
statistic. For $n_{j}=N_{j}-N_{j-1}$ equal to the number of observations in the $j$ th sample, define

$$
C_{N}^{2}=\sum_{j=1}^{k} \frac{\left(T_{N_{j}}-n_{j} \bar{a}_{N}\right)^{2}}{n_{j} \operatorname{var} \phi\left(U_{1}\right)}
$$

If the scores are generated by (13.3) or (13.4) and all sample sizes $n_{j}$ tend to infinity, then every sequence $T_{N_{j}}$ is asymptotically normal under the null hypothesis, under the conditions of Theorem 13.5. In fact, because the approximations $\tilde{T}_{N_{j}}$ are jointly asymptotically normal by the multivariate central limit theorem, the vector $T_{N}=\left(T_{N 1}, \ldots, T_{N k}\right)$ is asymptotically normal as well. By elementary calculations, if $n_{i} / N \rightarrow \lambda_{i}$,

$$
\frac{T_{N}-\mathrm{E} T_{N}}{\sqrt{N} \operatorname{sd} \phi\left(U_{1}\right)} \leadsto N_{k}\left(0,\left(\begin{array}{cccc}
\lambda_{1}\left(1-\lambda_{1}\right) & -\lambda_{1} \lambda_{2} & \cdots & -\lambda_{1} \lambda_{k} \\
-\lambda_{2} \lambda_{1} & \lambda_{2}\left(1-\lambda_{2}\right) & \cdots & -\lambda_{2} \lambda_{k} \\
\vdots & \vdots & & \vdots \\
-\lambda_{k} \lambda_{1} & -\lambda_{k} \lambda_{2} & \cdots & \lambda_{k}\left(1-\lambda_{k}\right)
\end{array}\right)\right) .
$$

This limit distribution is similar to the limit distribution of a sequence of multinomial vectors. Analogously to the situation in the case of Pearson's chi-square tests for a multinomial distribution (see Chapter 17), the sequence $C_{N}^{2}$ converges in distribution to a chi-square distribution with $k-1$ degrees of freedom.

There are many reasonable choices of scores. The most popular choice is based on $\phi(u)=u$ and leads to the Kruskal-Wallis test. Its test statistic is usually written in the form

$$
\frac{12}{N(N-1)} \sum_{j=1}^{k} n_{j}\left(\bar{R}_{j .}-\frac{N+1}{2}\right)^{2}, \quad \bar{R}_{j .}=\frac{\sum_{i=N_{j-1}+1}^{N_{j}} R_{N i}}{n_{j}} .
$$

This test statistic measures the distance of the average scores of the $k$ samples to the average score $(N+1) / 2$ of the pooled sample.

An alternative is to use locally asymptotically powerful scores for a family of distributions of interest. Also, choosing the same score generating function for all subsamples is convenient, but not necessary, provided the chi-square statistic is modified.

### 13.2 Signed Rank Statistics

The sign of a number $x$, denoted $\operatorname{sign}(x)$, is defined to be $-1,0$, or 1 if $x<0, x=0$ or $x>0$, respectively. The absolute rank $R_{N i}^{+}$of an observation $X_{i}$ in a sample $X_{1}, \ldots, X_{N}$ is defined as the rank of $\left|X_{i}\right|$ in the sample of absolute values $\left|X_{1}\right|, \ldots,\left|X_{N}\right|$. A simple linear signed rank statistic has the form

$$
\sum_{i=1}^{N} a_{N, R_{N i}^{+}} \operatorname{sign}\left(X_{i}\right) .
$$

The ordinary ranks of a sample can always be derived from the combined set of absolute ranks and signs. Thus, the vectors of absolute ranks and signs are together statistically more informative than the ordinary ranks. The difference is dramatic if testing the location of a symmetric density of a given form, in which case the class of signed rank statistics contains asymptotically efficient test statistics in great generality.

The main attraction of signed rank statistics is their simplicity, particularly their being distribution-free over the set of all symmetric distributions. Write $|X|, R_{N}^{+}$, and sign ${ }_{N}(X)$ for the vectors of absolute values, absolute ranks, and signs.
13.17 Lemma. Let $X_{1}, \ldots, X_{N}$ be a random sample from a continuous distribution that is symmetric about zero. Then
(i) the vectors $\left(|X|, R_{N}^{+}\right)$and $\operatorname{sign}_{N}(X)$ are independent;
(ii) the vector $R_{N}^{+}$is uniformly distributed over $\{1, \ldots, N\}$;
(iii) the vector $\operatorname{sign}_{N}(X)$ is uniformly distributed over $\{-1,1\}^{N}$;
(iv) for any signed rank statistic, var $\sum_{i=1}^{N} a_{N, R_{N i}^{+}} \operatorname{sign}\left(X_{i}\right)=\sum_{i=1}^{N} a_{N i}^{2}$.

Consequently, for testing the null hypothesis that a sample is i.i.d. from a continuous, symmetric distribution, the critical level of a signed rank statistic can be set without further knowledge of the "shape" of the underlying distribution.

The null hypothesis of symmetry arises naturally in the two-sample problem with paired observations. Suppose that, given independent observations $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{N}, Y_{N}\right)$, it is desired to test the hypothesis that the distribution of $X_{i}-Y_{i}$ is "centered at zero." If the observations ( $X_{i}, Y_{i}$ ) are exchangeable, that is, the pairs ( $X_{i}, Y_{i}$ ) and ( $Y_{i}, X_{i}$ ) are equal in distribution, then $X_{i}-Y_{i}$ is symmetrically distributed about zero. This is the case, for instance, if, given a third variable (usually called "factor"), the observations $X_{i}$ and $Y_{i}$ are conditionally independent and identically distributed. For the vector of absolute ranks to be uniformly distributed on the set of all permutations it is necessary to assume in addition that the differences are identically distributed.

For the signs alone to be distribution-free, it suffices, of course, that the pairs are independent and that $\mathrm{P}\left(X_{i}<Y_{i}\right)=\mathrm{P}\left(X_{i}>Y_{i}\right)=\frac{1}{2}$ for every $i$. Consequently, tests based on only the signs have a wider applicability than the more general signed rank tests. However, depending on the model they may be less efficient.
13.18 Theorem. Let $X_{1}, \ldots, X_{N}$ be a random sample from a continuous distribution that is symmetric about zero. Let the scores $a_{N}$ be generated according to (13.3) for a measurable function $\phi$ such that $\int_{0}^{1} \phi^{2}(u) d u<\infty$. For $F^{+}$the distribution function of $\left|X_{1}\right|$, define

$$
T_{N}=\sum_{i=1}^{N} a_{N, R_{N i}^{+}} \operatorname{sign}\left(X_{i}\right), \quad \tilde{T}_{N}=\sum_{i=1}^{N} \phi\left(F^{+}\left(\left|X_{i}\right|\right)\right) \operatorname{sign}\left(X_{i}\right) .
$$

Then the sequences $T_{N}$ and $\tilde{T}_{N}$ are asymptotically equivalent in the sense that $N^{-1} \operatorname{var}\left(T_{N}-\right. \left.\tilde{T}_{N}\right) \rightarrow 0$. Consequently, the sequence $N^{-1 / 2} T_{N}$ is asymptotically normal with mean zero and variance $\int_{0}^{1} \phi^{2}(u) d u$. The same is true if the scores are generated according to (13.4) for a function $\phi$ that is continuous almost everywhere and satisfies $N^{-1} \sum_{i=1}^{N} \phi^{2}(i /(N+ 1)) \rightarrow \int_{0}^{1} \phi^{2}(u) d u<\infty$.

Proof. Because the vectors $\operatorname{sign}_{N}(X)$ and $\left(|X|, R_{N}^{+}\right)$are independent and $\mathrm{Esign}_{N}(X)=$ 0 , the means of both $T_{N}$ and $\tilde{T}_{N}$ are zero. Furthermore, by the independence and the orthogonality of the signs,

$$
\mathrm{E}\left(\tilde{T}_{N}-T_{N}\right)^{2}=N \mathrm{E}\left(a_{N, R_{N 1}^{+}}-\phi\left(F^{+}\left(\left|X_{1}\right|\right)\right)\right)^{2} .
$$

The expectation on the right side is exactly the expression in (13.6), evaluated for the special choice $U_{1}=F^{+}\left(\left|X_{1}\right|\right)$. This can be shown to converge to zero as in the proof of Theorem 13.5.
13.19 Example (Wilcoxon signed rank statistic). The Wilcoxon signed rank statistic $W_{N}=\sum_{i=1}^{N} R_{N i}^{+} \operatorname{sign}\left(X_{i}\right)$ is obtained from the score-generating function $\phi(u)=u$. Large values of this statistic indicate that large absolute values $\left|X_{i}\right|$ tend to go together with positive $X_{i}$. Thus large values of the Wilcoxon statistic suggest that the location of the $X_{i}$ is larger than zero. Under the null hypothesis that $X_{1}, \ldots, X_{N}$ are i.i.d. and symmetrically distributed about zero, the sequence $N^{-3 / 2} W_{N}$ is asymptotically normal $N(0,1 / 3)$. The variance of $W_{N}$ is equal to $N(2 N+1)(N+1) / 6$.

The signed rank statistic is asymptotically equivalent to the $U$-statistic with kernel $h\left(x_{1}, x_{2}\right)=1\left\{x_{1}+x_{2}>0\right\}$. (See problem 12.9.) This connection yields the limit distribution also under nonsymmetric distributions.

Signed rank statistics that are locally most powerful can be obtained in a similar fashion as locally most powerful rank statistics were obtained in the previous section. Let $f$ be a symmetric density, and let $X_{1}, \ldots, X_{N}$ be a random sample from the density $f(\cdot-\theta)$. Then, under regularity conditions,

$$
\begin{aligned}
\mathrm{P}_{\theta}\left(\operatorname{sign}_{N}(X)\right. & \left.=s, R_{N}^{+}=r\right)-\mathrm{P}_{0}\left(\operatorname{sign}_{N}(X)=s, R_{N}^{+}=r\right) \\
& =-\theta \mathrm{E}_{0} \sum_{i=1}^{N} \operatorname{sign}\left(X_{i}\right) \frac{f^{\prime}}{f}\left(\left|X_{i}\right|\right)\left\{\operatorname{sign}_{N}(x)=s, R_{N}^{+}=r\right\}+o(\theta) \\
& =-\theta \frac{1}{2^{N} N!} \sum_{i=1}^{N} s_{i} \mathrm{E}_{0}\left(\left.\frac{f^{\prime}}{f}\left(\left|X_{i}\right|\right) \right\rvert\, R_{N i}^{+}=r_{i}\right)+o(\theta)
\end{aligned}
$$

In the second equality it is used that $f^{\prime} / f(x)$ is equal to $\operatorname{sign}(x) f^{\prime} / f(|x|)$ by the skew symmetry of $f^{\prime} / f$. It follows that locally most powerful signed rank statistics for testing $f$ against $f(\cdot-\theta)$ are obtained from the scores

$$
a_{N i}=-\mathrm{E} \frac{f^{\prime}}{f}\left(\left(F^{+}\right)^{-1}\left(U_{N(i)}\right)\right) .
$$

These scores are of the form (13.3) with score-generating function $\phi=-\left(f^{\prime} / f\right) \circ\left(F^{+}\right)^{-1}$, whence locally most powerful rank statistics are asymptotically linear by Theorem 13.18. By the symmetry of $F$, we have $\left(F^{+}\right)^{-1}(u)=F^{-1}((u+1) / 2)$.
13.20 Example. The Laplace density has score function $f^{\prime} / f(x)=\operatorname{sign}(x)=1$, for $x \geq 0$. This leads to the locally most powerful scores $a_{N i} \equiv 1$. The corresponding test statistic is the sign statistic $T_{N}=\sum_{i=1}^{N} \operatorname{sign}\left(X_{i}\right)$. Is it surprising that this simple statistic possesses an optimality property? It is shown to be asymptotically optimal for testing $H_{0}: \theta=0$ in Chapter 15.
13.21 Example. The locally most powerful score for the normal distribution are $a_{N i}= \mathrm{E} \Phi^{-1}\left(\left(U_{N_{(i)}}+1\right) / 2\right)$. These are appropriately known as the normal (absolute) scores.

### 13.3 Rank Statistics for Independence

Let $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{N}, Y_{N}\right)$ be independent, identically distributed bivariate vectors, with continuous marginal distributions. The problem is to determine whether, within each pair, $X_{i}$ and $Y_{i}$ are independent.

Let $R_{N}$ and $S_{N}$ be the rank vectors of the samples $X_{1}, \ldots, X_{N}$ and $Y_{1}, \ldots, Y_{N}$, respectively. If $X_{i}$ and $Y_{i}$ are positively dependent, then we expect the vectors $R_{N}$ and $S_{N}$ to be roughly parallel. Therefore, rank statistics of the form

$$
\sum_{i=1}^{N} a_{N, R_{N i}} b_{N, S_{N i}}
$$

with $a_{N}$ and $b_{N}$ increasing vectors, are reasonable choices for testing independence.
Under the null hypothesis of independence of $X_{i}$ and $Y_{i}$, the vectors $R_{N}$ and $S_{N}$ are independent and both uniformly distributed on the permutations of $\{1, \ldots, N\}$. Let $R_{N}^{o}$ be the vector of ranks of $X_{1}, \ldots, X_{N}$ if first the pairs $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{N}, Y_{N}\right)$ have been put in increasing order of $Y_{1}<Y_{2}<\cdots<Y_{N}$. The coordinates of $R_{N}^{o}$ are called the antiranks. Under the null hypothesis, the antiranks are also uniformly distributed on the permutations of $\{1, \ldots, N\}$. By the definition of the antiranks,

$$
\sum_{i=1}^{N} a_{N, R_{N i}} b_{N, S_{N i}}=\sum_{i=1}^{N} a_{N, R_{N i}^{o}} b_{N i}
$$

The right side is a simple linear rank statistic and can be shown to be asymptotically normal by Theorem 13.5.
13.22 Example (Spearman rank correlation). The simplest choice of scores corresponds to the generating function $\phi(u)=u$. This leads to the rank correlation coefficient $\rho_{N}$, which is the ordinary sample correlation coefficient of the rank vectors $R_{N}$ and $S_{N}$. Indeed, because the rank vectors are permutations of the numbers $1,2, \ldots, N$, their sample mean and variance are fixed, at $(N+1) / 2$ and $N(N+1) / 12$, respectively, and hence

$$
\begin{aligned}
\rho_{N} & =\frac{\sum_{i=1}^{N}\left(R_{N i}-\bar{R}_{N}\right)\left(S_{N i}-\bar{S}_{N}\right)}{\left(\sum_{i=1}^{N}\left(R_{N i}-\bar{R}_{N}\right)^{2} \sum_{i=1}^{N}\left(S_{N i}-\bar{S}_{N}\right)^{2}\right)^{1 / 2}} \\
& =\frac{12}{N(N-1)(N+1)} \sum_{i=1}^{N} R_{N i} S_{N i}-3 \frac{N+1}{N-1}
\end{aligned}
$$

Thus the tests based on the rank correlation coefficient $\rho_{N}$ are equivalent to tests based on the signed rank statistic $\sum R_{N i} S_{N i}$.

It is straightforward to derive from Theorem 13.5 that the sequence $\sqrt{N} \rho_{N}$ is asymptotically standard normal under the null hypothesis of independence.

## *13.4 Rank Statistics under Alternatives

Let $R_{N}$ be the rank vector of the independent random variables $X_{1}, \ldots, X_{N}$ with continuous distribution functions $F_{1}, \ldots, F_{N}$. Theorem 13.5 gives the asymptotic distribution of simple, linear rank statistics under very mild conditions on the score-generating function,
but under the strong assumption that the distribution functions $F_{i}$ are all equal. This is sufficient for setting critical values of rank tests for the null hypothesis of identical distributions, but for studying their asymptotic efficiency we also need the asymptotic behavior under alternatives. For instance, in the two-sample problem we are interested in the asymptotic distributions under alternatives of the form $F, \ldots, F, G, \ldots, G$ where $F$ and $G$ are the distributions of the two samples.

For alternatives that converge to the null hypothesis "sufficiently fast," the best approach is to use Le Cam's third lemma. In particular, if the log likelihood ratios of the alternatives $F_{n}, \ldots, F_{n}, G_{n}, \ldots, G_{n}$ with respect to the null distributions $F, \ldots, F, F, \ldots, F$ allow an asymptotic approximation by a sum of the type $\sum \ell_{i}\left(X_{i}\right)$, then the joint asymptotic distribution of the rank statistics and the log likelihood ratios under the null hypothesis can be obtained from the multivariate central limit theorem and Slutsky's lemma, because Theorem 13.5 yields a similar approximation for the rank statistics. Next, we can apply Le Cam's third lemma, as in Example 6.7, to find the limit distribution of the rank statistics under the alternatives. This approach is relatively easy, and is sufficiently general for most of the questions of interest. See sections 7.5 and 14.1.1 for examples.

More general alternatives must be handled directly and appear to require stronger conditions on the score-generating function. One possibility is to write the rank statistic as a functional of the empirical distribution function $\mathbb{F}_{N}$, and the weighted empirical distribution $\mathbb{F}_{N}^{c}(x)=N^{-1} \sum_{i=1}^{N} c_{N i} 1\left\{X_{i} \leq x\right\}$ of the observations. Because $R_{N i}=N \mathbb{F}_{N}\left(X_{i}\right)$, we have

$$
\frac{1}{N} \sum_{i=1}^{N} c_{N i} a_{N, R_{N i}}=\int a_{N, N \mathbb{F}_{N}(x)} d \mathbb{F}_{N}^{c}(x)
$$

Next, we can apply a von Mises analysis, using the convergence of the empirical distribution functions to Brownian bridges. This method is explained in general in Chapter 20.

In this section we illustrate another method, based on Hájek's projection lemma. To avoid technical complications, we restrict ourselves to smooth score-generating functions. Let $\bar{F}_{N}$ be the average of $F_{1}, \ldots, F_{N}$ and let $\bar{F}_{N}^{c}$ be the weighted sum $N^{-1} \sum_{i=1}^{N} c_{N i} F_{i}$, and define

$$
\begin{aligned}
T_{N} & =\sum_{i=1}^{N} c_{N i} \phi\left(\frac{R_{N i}}{N+1}\right) \\
\hat{T}_{N} & =\sum_{i=1}^{N}\left[c_{N i} \phi\left(\bar{F}_{N}\left(X_{i}\right)\right)+\int_{X_{i}}^{\infty} \phi^{\prime}\left(\bar{F}_{N}(x)\right) d \bar{F}_{N}^{c}(x)\right]
\end{aligned}
$$

We shall show that the variables $\hat{T}_{N}$ are the Hájek projections of approximations to the variables $T_{N}$, up to centering at mean zero. The Hájek projections of the variables $T_{N}$ themselves give a better approximation but are more complicated.
13.23 Lemma. If $\phi:[0,1] \mapsto \mathbb{R}$ is twice continuously differentiable, then there exists a universal constant $K$ such that

$$
\operatorname{var}\left(T_{N}-\hat{T}_{N}\right) \leq K \frac{1}{N} \sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right)^{2}\left(\left\|\phi^{\prime}\right\|_{\infty}^{2}+\left\|\phi^{\prime \prime}\right\|_{\infty}^{2}\right)
$$

Proof. Because the inequality is for every fixed $N$, we delete the index $N$ in the proof. Furthermore, because the assertion concerns a variance and both $T_{N}$ and $\hat{T}_{N}$ change by a
constant if the $c_{N i}$ are replaced by $c_{N i}-\bar{c}_{N}$, it is not a loss of generality to assume that $\bar{c}_{N}=0$. (Evaluate the integral defining $\hat{T}_{N}$ to see this.)

The rank of $X_{i}$ can be written as $R_{i}=1+\sum_{k \neq i} 1\left\{X_{k} \leq X_{i}\right\}$. This representation and a little algebra show that

$$
\left|\mathrm{E}\left(\left.\frac{R_{i}}{N+1} \right\rvert\, X_{i}\right)-\bar{F}\left(X_{i}\right)\right|=\frac{1}{N+1}\left|1-\bar{F}\left(X_{i}\right)-F_{i}\left(X_{i}\right)\right| \leq \frac{1}{N} .
$$

Furthermore, applying the Marcinkiewitz-Zygmund inequality (e.g., [23, p. 356]) conditionally on $X_{i}$, we obtain that

$$
\begin{aligned}
& \mathrm{E}\left(\frac{R_{i}}{N+1}-\bar{F}\left(X_{i}\right)\right)^{4} \\
& \quad=\frac{1}{(N+1)^{4}} \mathrm{E}\left(\sum_{k \neq i}\left(1\left\{X_{k} \leq X_{i}\right\}-F_{k}\left(X_{i}\right)\right)+1-\bar{F}\left(X_{i}\right)-F_{i}\left(X_{i}\right)\right)^{4} \\
& \quad \lesssim \frac{1}{N^{2}} \mathrm{EE}\left(\left.\frac{1}{N} \sum_{k \neq i}\left(1\left\{X_{k} \leq X_{i}\right\}-F_{k}\left(X_{i}\right)\right)^{4} \right\rvert\, X_{i}\right)+\frac{1}{N^{4}} \lesssim \frac{1}{N^{2}}
\end{aligned}
$$

Next, developing $\phi$ in a two-term Taylor expansion around $\bar{F}\left(X_{i}\right)$, for each term in the sum that defines $T$, we see that there exist random variables $K_{i}$ that are bounded by $\left\|\phi^{\prime \prime}\right\|_{\infty}$ such that

$$
\begin{aligned}
T= & \sum_{i=1}^{N} c_{i} \phi\left(\bar{F}\left(X_{i}\right)\right)+\sum_{i=1}^{N} c_{i}\left(\frac{R_{N i}}{N+1}-\bar{F}\left(X_{i}\right)\right) \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right) \\
& +\sum_{i=1}^{N} c_{i}\left(\frac{R_{N i}}{N+1}-\bar{F}\left(X_{i}\right)\right)^{2} K_{i}=: T_{0}+T_{1}+T_{2} .
\end{aligned}
$$

Using the Cauchy-Schwarz inequality and the fourth-moment bound obtained previously, we see that the quadratic term $T_{2}$ is bounded above in second mean as in the lemma. The leading term $T_{0}$ is a sum of functions of the single variables $X_{i}$, and is the first part of $\hat{T}$. We shall show that the linear term $T_{1}$ is asymptotically equivalent to its Hájek projection, which, moreover, is asymptotically equivalent to the second part of $\hat{T}$, up to a constant. The Hájek projection of $T_{1}$ is equal to, up to a constant,

$$
\begin{aligned}
& \sum_{i} c_{i} \sum_{j} \mathrm{E}\left[\left.\frac{R_{i}}{N+1} \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right) \right\rvert\, X_{j}\right]-\sum_{i} c_{i} \bar{F}\left(X_{i}\right) \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right) \\
& \quad=\sum_{i} c_{i}\left[\sum_{j \neq i} \mathrm{E}\left[\left.\frac{R_{i}}{N+1} \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right) \right\rvert\, X_{j}\right]\right. \\
& \quad+\sum_{i} c_{i}\left(\mathrm{E}\left(\left.\frac{R_{i}}{N+1} \right\rvert\, X_{i}\right)-\bar{F}\left(X_{i}\right)\right) \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right) .
\end{aligned}
$$

The second term is bounded in second mean as in the lemma; the first term is equal to

$$
\frac{1}{N+1} \sum_{i} c_{i} \sum_{j \neq i} \mathrm{E}\left(1\left\{X_{j} \leq X_{i}\right\} \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right) \mid X_{j}\right)+\text { constant. }
$$

If we replace $(N+1)$ by $N$, write out the conditional expectation, add the diagonal terms, and remove the constant, then we obtain the second term in the definition of $\hat{T}$. The difference between these two expressions is bounded above in second mean as in the lemma.

To conclude the proof it suffices to show that the difference between $T_{1}$ and its Hájek projection is negligible. We employ the Hoeffding decomposition. Because each of the variables $R_{i} \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right)$ is contained in the space $\sum_{|A| \leq 2} H_{A}$, the difference between $T_{1}$ and its Hájek projection is equal to the projection of $T_{1}$ onto the space $\sum_{|A|=2} H_{A}$. This projection has second moment

$$
\frac{1}{(N+1)^{2}} \sum_{|A|=2} \mathrm{E}\left(P_{A} \sum_{i} c_{i} \sum_{k} 1\left\{X_{k} \leq X_{i}\right\} \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right)\right)^{2} .
$$

The projection of the variable $1\left\{X_{k} \leq X_{i}\right\} \phi^{\prime}\left(\bar{F}\left(X_{i}\right)\right)$, which is contained in the space $H_{\{k, i\}}$, onto the space $H_{\{a, b\}}$ is zero unless $\{a, b\} \subset\{k, i\}$. Thus, the expression in the preceding display is equal to

$$
\frac{1}{(N+1)^{2}} \sum_{a<b} \mathrm{E}\left(c_{b} 1\left\{X_{a} \leq X_{b}\right\} \phi^{\prime}\left(\bar{F}\left(X_{b}\right)\right)+c_{a} 1\left\{X_{b} \leq X_{a}\right\} \phi^{\prime}\left(\bar{F}\left(X_{a}\right)\right)\right)^{2} .
$$

This is bounded by the upper bound of the lemma, as desired. The proof is complete.
As a consequence of the lemma, the sequences $\left(T_{N}-\mathrm{E} T_{N}\right) / \operatorname{sd} T_{N}$ and $\left(\hat{T}_{N}-\mathrm{E} \hat{T}_{N}\right) / \operatorname{sd} \hat{T}_{N}$ have the same limiting distribution (if any) if

$$
\frac{\sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right)^{2}}{N \operatorname{var} \hat{T}_{N}} \rightarrow 0
$$

This condition is certainly satisfied if the observations are identically distributed. Then the rank vector is uniformly distributed on the permutations, and the explicit expression for $\operatorname{var} T_{N}$ given by Lemma 13.1 shows that the left side (with var $T_{N}$ instead of $\operatorname{var} \hat{T}_{N}$ ) is of the order $O(1 / N)$. Because this leaves much too spare, the condition remains satisfied under small departures from identical distributions, but the general situation requires a calculation.

Under the conditions of the lemma we have the approximation

$$
\mathrm{E} T_{N} \approx \bar{c}_{N} \sum_{i=1}^{N} \phi\left(\frac{i}{N+1}\right)+\sum_{i=1}^{N}\left(c_{N i}-\bar{c}_{N}\right) \mathrm{E} \phi\left(\bar{F}_{N}\left(X_{i}\right)\right) .
$$

The square of the difference is bounded by the upper bound of the lemma.
The preceding lemma is restricted to smooth score-generating functions. One possibility to extend the result to more general scores is to show that the difference between the rank statistics of interest and suitable approximations by rank statistics with smooth scores is small. The following lemma is useful for this purpose, although it is suboptimal if the observations are identically distributed. (For a proof, see Theorem 3.1, in [68].)
13.24 Lemma (Variance inequality). For nondecreasing coefficients $a_{N 1} \leq \cdots \leq a_{N N}$ and arbitrary scores $c_{N 1}, \ldots, c_{N N}$,

$$
\operatorname{var} \sum_{i=1}^{N} c_{N i} a_{N}, R_{N i} \leq 21 \max _{1 \leq i \leq N}\left(c_{N i}-\bar{c}_{N}\right)^{2} \sum_{i=1}^{N}\left(a_{N i}-\bar{a}_{N}\right)^{2} .
$$

### 13.5 Permutation Tests

Rank tests are examples of permutation tests. General permutation tests also possess a distribution-free level but still use the values of the observations next to their ranks. In this section we illustrate this for the two-sample problem.

Suppose that the null hypothesis $H_{0}$ that two independent random samples $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ are identically distributed is rejected for large values of a test statistic $T_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)$. Write $Z_{(1)}, \ldots, Z_{(N)}$ for the values of the pooled sample stripped of its original order. ( $N=m+n$.) Under the null hypothesis each permutation $Z_{\pi_{1}}, \ldots, Z_{\pi_{N}}$ of the $N$ values is equally likely to lead back to the original observations. More precisely, the conditional null distribution of $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$ given $Z_{(1)}, \ldots, Z_{(N)}$ is uniform on the $N!$ permutations of the latter sample. Thus, it would be reasonable to reject $H_{0}$ if the observed value $T_{N}\left(x_{1}, \ldots, x_{m}, y_{1}, \ldots, y_{n}\right)$ is among the $100 \alpha \%$ largest values $T_{N}\left(z_{\pi_{1}}, \ldots, z_{\pi_{N}}\right)$ as $\pi$ ranges over all permutations. Then we obtain a test of level $\alpha$, conditionally given the observed values and hence also unconditionally.

Does this procedure work? Does the test have the desired power? The answer is affirmative for statistics $T_{N}$ that are sums, in the sense that, asymptotically, the permutation test is equivalent to the test based on the normal approximation to $T_{N}$. If the latter test performs well, then so does the permutation test.

We consider statistics of the form, for a given measurable function $f$,

$$
T_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)=\frac{1}{m} \sum_{i=1}^{m} f\left(X_{i}\right)-\frac{1}{n} \sum_{j=1}^{n} f\left(Y_{j}\right)
$$

These statistics include, for instance, the score statistics for testing that the two samples have distributions $p_{0}$ and $p_{\theta}$, respectively, for which we take $f$ equal to the score function $\dot{p}_{0} / p_{0}$ of the model. Because a permutation test is conditional on the observed values, and $T_{N}$ is fixed once $\sum_{j} f\left(Y_{j}\right)$ and $\sum_{i} f\left(Z_{i}\right)$ are fixed, it would be equivalent to consider statistics of the form $\sum_{j} f\left(Y_{j}\right)$.

Let $\left(\pi_{N 1}, \ldots, \pi_{N N}\right)$ be uniformly distributed on the $N!$ permutations of the numbers $1,2, \ldots, N$, and be independent of $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$.
13.25 Theorem. Let both $\mathrm{E} f^{2}\left(X_{1}\right)$ and $\mathrm{E} f^{2}\left(Y_{1}\right)$ be finite, and suppose that $m, n \rightarrow \infty$ such that $m / N \rightarrow \lambda \in(0,1)$. Then, given almost every sequence $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$, the sequence $\sqrt{N} T_{N}\left(Z_{\pi_{N 1}}, \ldots, Z_{\pi_{N N}}\right)$ is asymptotically normal with mean zero. Under the null hypothesis the asymptotic variance is equal to var $f\left(X_{1}\right) /(\lambda(1-\lambda))$.

Proof. Conditionally on the values of the pooled sample, the statistic $N T_{N}\left(Z_{\pi_{N 1}} \ldots\right.$, $\left.Z_{\pi_{N N}}\right)$ is distributed as the simple linear rank statistic $\sum_{i=1}^{N} c_{N i} a_{N, R_{N i}}$ with coefficients and scores

$$
c_{N i}=f\left(Z_{i}\right), \quad a_{N i}=\left\{\begin{aligned}
\frac{N}{m}, & i \leq m \\
-\frac{N}{n}, & i>m
\end{aligned}\right.
$$

Here $R_{N 1}, \ldots, R_{N N}$ are the antiranks of $\pi_{N 1}, \ldots, \pi_{N N}$ defined by the equation $\sum c_{N, \pi_{N i}} a_{N i} =\sum c_{N i} a_{N, R_{N i}}$ (for any numbers $c_{N i}$ and $a_{N i}$ ).

The coefficients satisfy relation (13.7) for almost every sequence $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$, because, by the law of large numbers,

$$
\begin{gathered}
\overline{c_{N}^{k}} \xrightarrow{\text { as }} \lambda \mathrm{E} f^{k}\left(X_{1}\right)+(1-\lambda) \mathrm{E} f^{k}\left(Y_{1}\right), \quad k=1,2, \\
\frac{1}{N} \max _{1 \leq i \leq N} c_{N i}^{2} \xrightarrow{\text { as }} 0 .
\end{gathered}
$$

The scores are generated as $a_{N i}=\phi_{N}(i /(N+1))$ for the functions

$$
\phi_{N}(u)=\left\{\begin{aligned}
\frac{N}{m}, & u \leq \frac{m}{N+1}, \\
-\frac{N}{n}, & u>\frac{m}{N+1} .
\end{aligned}\right.
$$

These functions depend on $N$, unlike the situation of Theorem 13.5, but they converge to the fixed function $\phi=\lambda^{-1} 1_{[0, \lambda)}-(1-\lambda)^{-1} 1_{(\lambda, 1]}$. By a minor extension of Theorem 13.5, the sequence $\sum c_{N i} a_{N, R_{N i}}$ is asymptotically equivalent to $\sum\left(c_{N i}-\bar{c}_{N}\right) \phi\left(U_{i}\right)$, for a uniform sample $U_{1}, \ldots, U_{N}$. The (asymptotic) variance of the latter variable is easy to compute.

By the central limit theorem, under the null hypothesis,

$$
\sqrt{N} T_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right) \rightsquigarrow N\left(0, \sigma^{2}\right), \quad \sigma^{2}=\frac{\operatorname{var} f\left(X_{1}\right)}{\lambda(1-\lambda)} .
$$

The limit is the same as the conditional limit distribution of the sequence $\sqrt{N} T_{N}\left(Z_{\pi_{N 1}}, \ldots\right.$, $Z_{\pi_{N N}}$ ) under the null hypothesis. Thus, we have a choice of two sequences of tests, both of asymptotic level $\alpha$, rejecting $H_{0}$ if :
$-\sqrt{N} T_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right) \geq z_{\alpha} \sigma ; \quad$ or
$-\sqrt{N} T_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right) \geq c_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)$, where $c_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)$ is the upper $\alpha$-quantile of the conditional distribution of $\sqrt{N} T_{N}\left(Z_{\pi_{N 1}}, \ldots, Z_{\pi_{N N}}\right)$ given $Z_{(1)}, \ldots, Z_{(N)}$.
The second test is just the permutation test discussed previously. By the preceding theorem the "random critical values" $c_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)$ converge in probability to $z_{\alpha} \sigma$ under $H_{0}$. Therefore the two tests are asymptotically equivalent under the null hypothesis. Furthermore, this equivalence remains under "contiguous alternatives" (for which again $c_{N}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right) \xrightarrow{\mathrm{P}} z_{\alpha} \sigma$; see Chapter 6), and hence the local asymptotic power functions as discussed in Chapter 14 are the same for the two sequences of tests.

The preceding theorem also shows that the sequence of "critical values" $c_{N}\left(X_{1}, \ldots, X_{m}\right.$, $\left.Y_{1}, \ldots, Y_{n}\right)$ remains bounded in probability under every alternative. Because $\sqrt{N} T_{N} \left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right) \rightsquigarrow \infty$ if $\mathrm{E} f\left(X_{1}\right)>\mathrm{E} f\left(Y_{1}\right)$, the power at any alternative with this property converges to 1 . Thus, permutation tests are an attractive alternative to both rank and classical tests. Their main drawback is computational complexity. The dependence of the null distribution on the observed values means that it cannot be tabulated and must be computed for every new data set.

## *13.6 Rank Central Limit Theorem

The rank central limit theorem Theorem 13.5, is slightly special in that the scores $a_{N i}$ are assumed to be of one of the forms (13.3) or (13.4). In this section we record what is commonly viewed as the rank central limit theorem. For a proof see [67]. For given coefficients and scores, let

$$
C_{n}^{2}=\sum_{i=1}^{n}\left(c_{N i}-\bar{c}_{N}\right)^{2}, \quad A_{n}^{2}=\sum_{i=1}^{n}\left(a_{N i}-\bar{a}_{N}\right)^{2} .
$$

13.26 Theorem (Rank central limit theorem). Let $T_{N}=\sum c_{N i} a_{N, R_{N i}}$ be the simple linear rank statistic with coefficients and scores such that $\max _{1 \leq i \leq N}\left|a_{N i}-\bar{a}_{N}\right| / A_{N} \rightarrow 0$ and $\max _{1 \leq i \leq N}\left|c_{N i}-\bar{c}_{N}\right| / C_{N} \rightarrow 0$, and let the rank vector $R_{N}$ be uniformly distributed on the set of all $N!$ permutations of $\{1,2, \ldots, N\}$. Then the sequence $\left(T_{N}-\mathrm{E} T_{N}\right) / \operatorname{sd} T_{N}$ converges in distribution to a standard normal distribution if and only if, for every $\varepsilon>0$,

$$
\sum_{(i, j): \sqrt{N}\left|a_{N i}-\bar{a}_{N}\right|\left|c_{N i}-\bar{c}_{N}\right|>\varepsilon A_{N} C_{N}} \frac{\left|a_{N i}-\bar{a}_{N}\right|^{2}\left|c_{N i}-\bar{c}_{N}\right|^{2}}{A_{N}^{2} C_{N}^{2}} \rightarrow 0 .
$$

## Notes

The classical reference on rank statistics is the book by Hájek and Śidák [71], which still makes wonderful reading and gives extensive references. Its treatment of rank statistics for nonidentically distributed observations is limited to contiguous alternatives, as in the first sections of this chapter. The papers [43] and [68] remedied this, shortly after the publication of the book. Section 13.4 reports only a few of the results from these papers, which, as does the book, use the projection method. An alternative approach to obtaining the limit distribution of rank statistics, initiated by Chernoff and Savage in the late 1950s and refined many times, is to write them as functions of empirical measures and next apply the von Mises method. We discuss examples of this approach in Chapter 20. See [134] for a more comprehensive treatment and further references.

## PROBLEMS

1. This problem asks one to give a precise meaning to the notion of a locally most powerful test. Let $T_{N}$ be a rank statistic based on the "locally most powerful scores." Let $\alpha=\mathrm{P}_{0}\left(T_{N}>c_{\alpha}\right)$ for a given number $c_{\alpha}$. (Then $\alpha$ is a natural level of the test statistic, a level that is attained without randomization.) Then there exists $\varepsilon>0$ such that the test that rejects the null hypothesis if $T_{N}>c_{\alpha}$ is most powerful within the class of all rank tests at level $\alpha$ uniformly in the alternatives $\theta \in(0, \varepsilon)$.
(i) Prove the statement.
(ii) Can the statement be extended to arbitrary levels?
2. Find the asymptotic distribution of the median test statistic under the null hypothesis that the two samples are identically distributed and continuous.
3. Show that $\sqrt{n}$ times Spearman's rank correlation coefficient is asymptotically standard normal.
4. Find the scores for a locally most powerful two-sample rank test for location for the Laplace family of densities.
5. Find the scores for a locally most powerful two-sample rank test for location for the Cauchy family of densities.
6. For which density is the Wilcoxon signed rank statistic locally most powerful?
7. Show that Spearman's rank correlation coefficient is a linear combination of Kendall's $\tau$ and the $U$-statistic with (asymmetric) kernel $h(x, y, z)=\operatorname{sign}\left(x_{1}-y_{1}\right) \operatorname{sign}\left(x_{2}-z_{2}\right)$. This decomposition yields another method to prove the asymptotic normality.
8. The symmetrized Siegel-Tukey test is a two-sample test with score vector of the form $a_{N}= (1,3,5, \ldots, 5,3,1)$. For which type of alternative hypothesis would you use this test?
9. For any $a_{N i}$ given by (13.3), show that $\bar{a}_{N}=\int_{0}^{1} \phi(u) d u$.

## 14

## Relative Efficiency of Tests

> The quality of sequences of tests can be judged from their power at alternatives that become closer and closer to the null hypothesis. This motivates the study of local asymptotic power functions. The relative efficiency of two sequences of tests is the quotient of the numbers of observations needed with the two tests to obtain the same level and power. We discuss several types of asymptotic relative efficiencies.

### 14.1 Asymptotic Power Functions

Consider the problem of testing a null hypothesis $H_{0}: \theta \in \Theta_{0}$ versus the alternative $H_{1}: \theta \in \Theta_{1}$. The power function of a test that rejects the null hypothesis if a test statistic falls into a critical region $K_{n}$ is the function $\theta \mapsto \pi_{n}(\theta)=\mathrm{P}_{\theta}\left(T_{n} \in K_{n}\right)$, which gives the probability of rejecting the null hypothesis. The test is of level $\alpha$ if its size $\sup \left\{\pi_{n}(\theta): \theta \in \Theta_{0}\right\}$ does not exceed $\alpha$. A sequence of tests is called asymptotically of level $\alpha$ if

$$
\limsup _{n \rightarrow \infty} \sup _{\theta \in \Theta_{0}} \pi_{n}(\theta) \leq \alpha .
$$

(An alternative definition is to drop the supremum and require only that $\lim \sup \pi_{n}(\theta) \leq \alpha$ for every $\theta \in \Theta_{0}$.) A test with power function $\pi_{n}$ is better than a test with power function $\underline{\pi}_{n}$ if both

$$
\begin{array}{rlr} 
& \pi_{n}(\theta) \leq \underline{\pi}_{n}(\theta), & \theta \in \Theta_{0}, \\
\text { and } & \pi_{n}(\theta) \geq \underline{\pi}_{n}(\theta), & \theta \in \Theta_{1} .
\end{array}
$$

The aim of this chapter is to compare tests asymptotically. We consider sequences of tests with power functions $\pi_{n}$ and $\underline{\pi}_{n}$ and wish to decide which of the sequences is best as $n \rightarrow \infty$. Typically, the tests corresponding to a sequence $\pi_{1}, \pi_{2}, \ldots$ are of the same type. For instance, they are all based on a certain $U$-statistic or rank statistic, and only the number of observations changes with $n$. Otherwise the comparison would have little relevance.

A first idea is to consider limiting power functions of the form

$$
\pi(\theta)=\lim _{n \rightarrow \infty} \pi_{n}(\theta) .
$$

If this limit exists for all $\theta$, and the same is true for the competing tests $\underline{\pi}_{n}$, then the sequence $\pi_{n}$ is better than the sequence $\underline{\pi}_{n}$ if the limiting power function $\pi$ is better than the
limiting power function $\underline{\pi}$. It turns out that this approach is too naive. The limiting power functions typically exist, but they are trivial and identical for all reasonable sequences of tests.
14.1 Example (Sign test). Suppose the observations $X_{1}, \ldots, X_{n}$ are a random sample from a distribution with unique median $\theta$. The null hypothesis $H_{0}: \theta=0$ can be tested against the alternative $H_{1}: \theta>0$ by means of the sign statistic $S_{n}=n^{-1} \sum_{i=1}^{n} 1\left\{X_{i}>0\right\}$. If $F(x-\theta)$ is the distribution function of the observations, then the expectation and variance of $S_{n}$ are equal to $\mu(\theta)=1-F(-\theta)$ and $\sigma^{2}(\theta) / n=(1-F(-\theta)) F(-\theta) / n$, respectively. By the normal approximation to the binomial distribution, the sequence $\sqrt{n}\left(S_{n}-\mu(\theta)\right)$ is asymptotically normal $N\left(0, \sigma^{2}(\theta)\right)$. Under the null hypothesis the mean and variance are equal to $\mu(0)=1 / 2$ and $\sigma^{2}(0)=1 / 4$, respectively, so that $\sqrt{n}\left(S_{n}-1 / 2\right) \stackrel{0}{\rightsquigarrow} N(0,1 / 4)$. The test that rejects the null hypothesis if $\sqrt{n}\left(S_{n}-1 / 2\right)$ exceeds the critical value $\frac{1}{2} z_{\alpha}$ has power function

$$
\begin{aligned}
\pi_{n}(\theta) & =\mathrm{P}_{\theta}\left(\sqrt{n}\left(S_{n}-\mu(\theta)\right)>\frac{1}{2} z_{\alpha}-\sqrt{n}(\mu(\theta)-\mu(0))\right) \\
& =1-\Phi\left(\frac{\frac{1}{2} z_{\alpha}-\sqrt{n}(F(0)-F(-\theta))}{\sigma(\theta)}\right)+o(1) .
\end{aligned}
$$

Because $F(0)-F(-\theta)>0$ for every $\theta>0$, it follows that for $\alpha=\alpha_{n} \rightarrow 0$ sufficiently slowly

$$
\pi_{n}(\theta) \rightarrow \begin{cases}0 & \text { if } \theta=0, \\ 1 & \text { if } \theta>0 .\end{cases}
$$

The limit power function corresponds to the perfect test with all error probabilities equal to zero. $\square$

The example exhibits a sequence of tests whose (pointwise) limiting power function is the perfect power function. This type of behavior is typical for all reasonable tests. The point is that, with arbitrarily many observations, it should be possible to tell the null and alternative hypotheses apart with complete accuracy. The power at every fixed alternative should therefore converge to 1 .
14.2 Definition. A sequence of tests with power functions $\theta \mapsto \pi_{n}(\theta)$ is asymptotically consistent at level $\alpha$ at (or against) the alternative $\theta$ if it is asymptotically of level $\alpha$ and $\pi_{n}(\theta) \rightarrow 1$. If a family of sequences of tests contains for every level $\alpha \in(0,1)$ a sequence that is consistent against every alternative, then the corresponding tests are simply called consistent.

Consistency is an optimality criterion for tests, but because most sequences of tests are consistent, it is too weak to be really useful. To make an informative comparison between sequences of (consistent) tests, we shall study the performance of the tests in problems that become harder as more observations become available. One way of making a testing problem harder is to choose null and alternative hypotheses closer to each other. In this section we fix the null hypothesis and consider the power at sequences of alternatives that converge to the null hypothesis.

![](https://cdn.mathpix.com/cropped/ba7603fa-498d-468b-91dd-53c69123725b-096.jpg?height=1548&width=3025&top_left_y=548&top_left_x=1293)
Figure 14.1. Asymptotic power function.

14.3 Example (Sign test, continued). Consider the power of the sign test at sequences of alternatives $\theta_{n} \downarrow 0$. Suppose that the null hypothesis $H_{0}: \theta=0$ is rejected if $\sqrt{n}\left(S_{n}-\frac{1}{2}\right) \geq \frac{1}{2} z_{\alpha}$. Extension of the argument of the preceding example yields

$$
\pi_{n}\left(\theta_{n}\right)=1-\Phi\left(\frac{\frac{1}{2} z_{\alpha}-\sqrt{n}\left(F(0)-F\left(-\theta_{n}\right)\right)}{\sigma\left(\theta_{n}\right)}\right)+o(1) .
$$

Since $\sigma(0)=\frac{1}{2}$, the levels $\pi_{n}(0)$ of the tests converge to $\Phi\left(z_{\alpha}\right)=\alpha$. The asymptotic power at $\theta_{n}$ depends on the rate at which $\theta_{n} \rightarrow 0$. If $\theta_{n}$ converges to zero fast enough to ensure that $\sqrt{n}\left(F(0)-F\left(-\theta_{n}\right)\right) \rightarrow 0$, then the power $\pi_{n}\left(\theta_{n}\right)$ converges to $\alpha$ : the sign test is not able to discriminate these alternatives from the null hypothesis. If $\theta_{n}$ converges to zero at a slow rate, then $\sqrt{n}\left(F(0)-F\left(-\theta_{n}\right)\right) \rightarrow \infty$, and the asymptotic power is equal to 1 : these alternatives are too easy. The intermediate rates, which yield a nontrivial asymptotic power, appear to be of most interest. Suppose that the underlying distribution function $F$ is differentiable at zero with positive derivative $f(0)>0$. Then

$$
\sqrt{n}\left(F(0)-F\left(-\theta_{n}\right)\right)=\sqrt{n} \theta_{n} f(0)+\sqrt{n} o\left(\theta_{n}\right) .
$$

This is bounded away from zero and infinity if $\theta_{n}$ converges to zero at rate $\theta_{n}=O\left(n^{-1 / 2}\right)$. For such rates the power $\pi_{n}\left(\theta_{n}\right)$ is asymptotically strictly between $\alpha$ and 1 . In particular, for every $h$,

$$
\pi_{n}\left(\frac{h}{\sqrt{n}}\right) \rightarrow 1-\Phi\left(z_{\alpha}-2 h f(0)\right) .
$$

The form of the limit power function is shown in Figure 14.1. $\square$

In the preceding example only alternatives $\theta_{n}$ that converge to the null hypothesis at rate $O(1 / \sqrt{n})$ lead to a nontrivial asymptotic power. This is typical for parameters that depend "smoothly" on the underlying distribution. In this situation a reasonable method for asymptotic comparison of two sequences of tests for $H_{0}: \theta=0$ versus $H_{0}: \theta>0$ is to consider local limiting power functions, defined as

$$
\pi(h)=\lim _{n \rightarrow \infty} \pi_{n}\left(\frac{h}{\sqrt{n}}\right), \quad h \geq 0 .
$$

These limits typically exist and can be derived by the same method as in the preceding example. A general scheme is as follows.

Let $\theta$ be a real parameter and let the tests reject the null hypothesis $H_{0}: \theta=0$ for large values of a test statistic $T_{n}$. Assume that the sequence $T_{n}$ is asymptotically normal in the
sense that, for all sequences of the form $\theta_{n}=h / \sqrt{n}$,

$$
\begin{equation*}
\frac{\sqrt{n}\left(T_{n}-\mu\left(\theta_{n}\right)\right)}{\sigma\left(\theta_{n}\right)} \stackrel{\theta_{n}}{\sim} N(0,1) . \tag{14.4}
\end{equation*}
$$

Often $\mu(\theta)$ and $\sigma^{2}(\theta)$ can be taken to be the mean and the variance of $T_{n}$, but this is not necessary. Because the convergence (14.4) is under a law indexed by $\theta_{n}$ that changes with $n$, the convergence is not implied by

$$
\begin{equation*}
\frac{\sqrt{n}\left(T_{n}-\mu(\theta)\right)}{\sigma(\theta)} \stackrel{\theta}{\rightsquigarrow} N(0,1), \quad \text { every } \theta . \tag{14.5}
\end{equation*}
$$

On the other hand, this latter convergence uniformly in the parameter $\theta$ is more than is needed in (14.4). The convergence (14.4) is sometimes referred to as "locally uniform" asymptotic normality. "Contiguity arguments" can reduce the derivation of asymptotic normality under $\theta_{n}=h / \sqrt{n}$ to derivation under $\theta=0$. (See section 14.1.1).

Assumption (14.4) includes that the sequence $\sqrt{n}\left(T_{n}-\mu(0)\right)$ converges in distribution to a normal $N\left(0, \sigma^{2}(0)\right)$-distribution under $\theta=0$. Thus, the tests that reject the null hypothesis $H_{0}: \theta=0$ if $\sqrt{n}\left(T_{n}-\mu(0)\right)$ exceeds $\sigma(0) z_{\alpha}$ are asymptotically of level $\alpha$. The power functions of these tests can be written

$$
\pi_{n}\left(\theta_{n}\right)=\mathrm{P}_{\theta_{n}}\left(\sqrt{n}\left(T_{n}-\mu\left(\theta_{n}\right)\right)>\sigma(0) z_{\alpha}-\sqrt{n}\left(\mu\left(\theta_{n}\right)-\mu(0)\right)\right) .
$$

For $\theta_{n}=h / \sqrt{n}$, the sequence $\sqrt{n}\left(\mu\left(\theta_{n}\right)-\mu(0)\right)$ converges to $h \mu^{\prime}(0)$ if $\mu$ is differentiable at zero. If $\sigma\left(\theta_{n}\right) \rightarrow \sigma(0)$, then under (14.4)

$$
\begin{equation*}
\pi_{n}\left(\frac{h}{\sqrt{n}}\right) \rightarrow 1-\Phi\left(z_{\alpha}-h \frac{\mu^{\prime}(0)}{\sigma(0)}\right) . \tag{14.6}
\end{equation*}
$$

For easy reference we formulate this result as a theorem.
14.7 Theorem. Let $\mu$ and $\sigma$ be functions of $\theta$ such that (14.4) holds for every sequence $\theta_{n}=h / \sqrt{n}$. Suppose that $\mu$ is differentiable and that $\sigma$ is continuous at $\theta=0$. Then the power functions $\pi_{n}$ of the tests that reject $H_{0}: \theta=0$ for large values of $T_{n}$ and are asymptotically of level $\alpha$ satisfy (14.6) for every $h$.

The limiting power function depends on the sequence of test statistics only through the quantity $\mu^{\prime}(0) / \sigma(0)$. This is called the slope of the sequence of tests. Two sequences of tests can be asymptotically compared by just comparing the sizes of their slopes. The bigger the slope, the better the test for $H_{0}: \theta=0$ versus $H_{1}: \theta>0$. The size of the slope depends on the rate $\mu^{\prime}(0)$ of change of the asymptotic mean of the test statistics relative to their asymptotic dispersion $\sigma(0)$. A good quantitative measure of comparison is the square of the quotient of two slopes. This quantity is called the asymptotic relative efficiency and is discussed in section 14.3.

If $\theta$ is the only unknown parameter in the problem, then the available tests can be ranked in asymptotic quality simply by the value of their slopes. In many problems there are also nuisance parameters (for instance the shape of a density), and the slope is a function of the nuisance parameter rather than a number. This complicates the comparison considerably. For every value of the nuisance parameter a different test may be best, and additional criteria are needed to choose a particular test.
14.8 Example (Sign test). According to Example 14.3, the sign test has slope $2 f(0)$. This can also be obtained from the preceding theorem, in which we can choose $\mu(\theta)=1-F(-\theta)$ and $\sigma^{2}(\theta)=(1-F(-\theta)) F(-\theta)$.
14.9 Example ( $t$-test). Let $X_{1}, \ldots, X_{n}$ be a random sample from a distribution with mean $\theta$ and finite variance. The $t$-test rejects the null hypothesis for large values of $\Sigma$. The sample variance $S^{2}$ converges in probability to the variance $\sigma^{2}$ of a single observation. The central limit theorem and Slutsky's lemma give

$$
\sqrt{n}\left(\frac{\bar{X}}{S}-\frac{h / \sqrt{n}}{\sigma}\right)=\frac{\sqrt{n}(\bar{X}-h / \sqrt{n})}{S}+h\left(\frac{1}{S}-\frac{1}{\sigma}\right) \stackrel{h / \sqrt{n}}{\leadsto} N(0,1) .
$$

Thus Theorem 14.7 applies with $\mu(\theta)=\theta / \sigma$ and $\sigma(\theta)=1$. The slope of the $t$-test equals $1 / \sigma .^{\dagger}$
14.10 Example (Sign versus t-test). Let $X_{1}, \ldots, X_{n}$ be a random sample from a density $f(x-\theta)$, where $f$ is symmetric about zero. We shall compare the performance of the sign test and the $t$-test for testing the hypothesis $H_{0}: \theta=0$ that the observations are symmetrically distributed about zero. Assume that the distribution with density $f$ has a unique median and a finite second moment.

It suffices to compare the slopes of the two tests. By the preceding examples these are $2 f(0)$ and $\left(\int x^{2} f(x) d x\right)^{-1 / 2}$, respectively. Clearly the outcome of the comparison depends on the shape $f$. It is interesting that the two slopes depend on the underlying shape in an almost orthogonal manner. The slope of the sign test depends only on the height of $f$ at zero; the slope of the $t$-test depends mainly on the tails of $f$. For the standard normal distribution the slopes are $\sqrt{2 / \pi}$ and 1 . The superiority of the $t$-test in this case is not surprising, because the $t$-test is uniformly most powerful for every $n$. For the Laplace distribution, the ordering is reversed: The slopes are 1 and $\frac{1}{2} \sqrt{2}$. The superiority of the sign test has much to do with the "unsmooth" character of the Laplace density at its mode.

The relative efficiency of the sign test versus the $t$-test is equal to

$$
4 f^{2}(0) \int x^{2} f(x) d x
$$

Table 14.1 summarizes these numbers for a selection of shapes. For the uniform distribution, the relative efficiency of the sign test with respect to the $t$-test equals $1 / 3$. It can be shown that this is the minimal possible value over all densities with mode zero (problem 14.7). On the other hand, it is possible to construct distributions for which this relative efficiency is arbitrarily large, by shifting mass into the tails of the distribution. The sign test is "robust" against heavy tails, the $t$-test is not.

The simplicity of comparing slopes is attractive on the one hand, but indicates the potential weakness of asymptotics on the other. For instance, the slope of the sign test was seen to be $f(0)$, but it is clear that this value alone cannot always give an accurate indication

[^7]Table 14.1. Relative efficiencies of the sign test versus the $t$-test for some distributions.
| Distribution | Efficiency $(\operatorname{sign} / t$-test $)$ |
| :--- | :---: |
| Logistic | $\pi^{2} / 12$ |
| Normal | $2 / \pi$ |
| Laplace | 2 |
| Uniform | $1 / 3$ |


of the quality of the sign test. Consider a density that is basically a normal density, but a tiny proportion of $10^{-10} \%$ of its total mass is located under an extremely thin but enormously high peak at zero. The large value $f(0)$ would strongly favor the sign test. However, at moderate sample sizes the observations would not differ significantly from a sample from a normal distribution, so that the $t$-test is preferable. In this situation the asymptotics are only valid for unrealistically large sample sizes.

Even though asymptotic approximations should always be interpreted with care, in the present situation there is actually little to worry about. Even for $n=20$, the comparison of slopes of the sign test and the $t$-test gives the right message for the standard distributions listed in Table 14.1.
14.11 Example (Mann-Whitney). Suppose we observe two independent random samples $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ from distributions $F(x)$ and $G(y-\theta)$, respectively. The base distributions $F$ and $G$ are fixed, and it is desired to test the null hypothesis $H_{0}: \theta=0$ versus the alternative $H_{1}: \theta>0$. Set $N=m+n$ and assume that $m / N \rightarrow \lambda \in(0,1)$. Furthermore, assume that $G$ has a bounded density $g$.

The Mann-Whitney test rejects the null hypothesis for large numbers of $U= (m n)^{-1} \sum_{i} \sum_{j} 1\left\{X_{i} \leq Y_{j}\right\}$. By the two-sample $U$-statistic theorem

$$
\begin{aligned}
\sqrt{N}\left(U-\mathrm{P}_{\theta}(X \leq Y)\right)= & -\frac{\sqrt{N}}{m} \sum_{i=1}^{m}\left(G\left(X_{i}-\theta\right)-\mathrm{E} G\left(X_{i}-\theta\right)\right) \\
& +\frac{\sqrt{N}}{n} \sum_{j=1}^{n}\left(F\left(Y_{i}\right)-\mathrm{E} F\left(Y_{i}\right)\right)+o_{P_{\theta}}(1)
\end{aligned}
$$

This readily yields the asymptotic normality (14.5) for every fixed $\theta$, with

$$
\mu(\theta)=1-\int G(x-\theta) d F(x), \quad \sigma^{2}(\theta)=\frac{1}{\lambda} \operatorname{var} G(X-\theta)+\frac{1}{1-\lambda} \operatorname{var} F(Y) .
$$

To obtain the local asymptotic power function, this must be extended to sequences $\theta_{N}= h / \sqrt{N}$. It can be checked that the $U$-statistic theorem remains valid and that the Lindeberg central limit theorem applies to the right side of the preceding display with $\theta_{N}$ replacing $\theta$. Thus, we find that (14.4) holds with the same functions $\mu$ and $\sigma$. (Alternatively we can use contiguity and Le Cam's third lemma.) Hence, the slope of the Mann-Whitney test equals $\mu^{\prime}(0) / \sigma(0)=\int g d F / \sigma(0)$.
14.12 Example (Two-sample $\boldsymbol{t}$-test). In the set-up of the preceding example suppose that the base distributions $F$ and $G$ have equal means and finite variances. Then $\theta=\mathrm{E}(Y-X)$

Table 14.2. Relative efficiencies of the Mann-Whitney test versus the two-sample $t$-test if $f=g$ equals a number of distributions.
| Distribution | Efficiency (Mann-Whitney/two-sample $t$-test) |
| :--- | :--- |
| Logistic | $\pi^{2} / 9$ |
| Normal | $3 / \pi$ |
| Laplace | 3/2 |
| Uniform | 1 |
| $t_{3}$ | 1.24 |
| $t_{5}$ | 1.90 |
| $c\left(1-x^{2}\right) \vee 0$ | 108/125 |


and the $t$-test rejects the null hypothesis $H_{0}: \theta=0$ for large values of the statistic $(\bar{Y}-\bar{X}) / S$, where $S^{2} / N=S_{X}^{2} / m+S_{Y}^{2} / n$ is the unbiased estimator of $\operatorname{var}(\bar{Y}-\bar{X})$. The sequence $S^{2}$ converges in probability to $\sigma^{2}=\operatorname{var} X / \lambda+\operatorname{var} Y /(1-\lambda)$. By Slutsky's lemma and the central limit theorem

$$
\sqrt{N}\left(\frac{\bar{Y}-\bar{X}}{S}-\frac{h / \sqrt{N}}{\sigma}\right) \stackrel{h / \sqrt{N}}{\leadsto} N(0,1) .
$$

Thus (14.4) is satisfied and Theorem 14.7 applies with $\mu(\theta)=\theta / \sigma$ and $\sigma(\theta)=1$. The slope of the $t$-test equals $\mu^{\prime}(0) / \sigma(0)=1 / \sigma$.
14.13 Example ( $\boldsymbol{t}$-Test versus Mann-Whitney test). Suppose we observe two independent random samples $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ from distributions $F(x)$ and $G(x-\theta)$, respectively. The base distributions $F$ and $G$ are fixed and are assumed to have equal means and bounded densities. It is desired to test the null hypothesis $H_{0}: \theta=0$ versus the alternative $H_{1}: \theta>0$. Set $N=m+n$ and assume that $m / N \rightarrow \lambda \in(0,1)$.

The slopes of the Mann-Whitney test and the $t$-test depend on the nuisance parameters $F$ and $G$. According to the preceding examples the relative efficiency of the two sequences of tests equals

$$
\frac{((1-\lambda) \operatorname{var} X+\lambda \operatorname{var} Y)\left(\int g d F\right)^{2}}{(1-\lambda) \operatorname{var}_{0} G(X)+\lambda \operatorname{var}_{0} F(Y)} .
$$

In the important case that $F=G$, this expression simplifies. Then the variables $G(X)$ and $F(Y)$ are uniformly distributed on $[0,1]$. Hence they have variance $1 / 12$ and the relative efficiency reduces to $12 \operatorname{var} X\left(\int f^{2}(y) d y\right)^{2}$. Table 14.2 gives the relative efficiency if $F=G$ are both equal to a number of standard distributions. The Mann-Whitney test is inferior to the $t$-test if $F=G$ equals the normal distribution, but better for the logistic, Laplace, and $t$-distribution. Even for the normal distribution the Mann-Whitney test does remarkably well, with a relative efficiency of $3 / \pi \approx 95 \%$. The density that is proportional to $\left(1-x^{2}\right) \vee 0$ (and any member of its scale family) is least favorable for the MannWhitney test. This density yields the lowest possible relative efficiency, which is still equal to $108 / 125 \approx 86 \%$ (problem 14.8). On the other hand, the relative efficiency of the MannWhitney test is large for heavy-tailed distributions; the supremum value is infinite. Together with the fact that the Mann-Whitney test is distribution-free under the null hypothesis, this
makes the Mann-Whitney test a strong competitor to the $t$-test, even in situations in which the underlying distribution is thought to be approximately normal.

## *14.1.1 Using Le Cam's Third Lemma

In the preceding examples the asymptotic normality of sequences of test statistics was established by direct methods. For more complicated test statistics the validity of (14.4) is easier checked by means of Le Cam's third lemma. This is illustrated by the following example.
14.14 Example (Median test). In the two-sample set-up of Example 14.11, suppose that $F=G$ is a continuous distribution function with finite Fisher information for location $I_{g}$. The median test rejects the null hypothesis $H_{0}: \theta=0$ for large values of the rank statistic $T_{N}=N^{-1} \sum_{i=m+1}^{N} 1\left\{R_{N i} \leq(N+1) / 2\right\}$. By the rank central limit theorem, Theorem 13.5, under the null hypothesis,

$$
\begin{aligned}
\sqrt{N}\left(T_{N}-\frac{n}{2 N}\right)=-\frac{n}{N \sqrt{N}} \sum_{i=1}^{m} 1\{ & \left.F\left(X_{i}\right) \leq 1 / 2\right\} \\
& +\frac{m}{N \sqrt{N}} \sum_{j=1}^{n} 1\left\{F\left(Y_{j}\right) \leq 1 / 2\right\}+o_{P}(1) .
\end{aligned}
$$

Under the null hypothesis the sequence of variables on the right side is asymptotically normal with mean zero and variance $\sigma^{2}(0)=\lambda(1-\lambda) / 4$. By Theorem 7.2, for every $\theta_{N}=h / \sqrt{N}$,

$$
\log \frac{\prod_{i} f\left(X_{i}\right) \prod_{j} g\left(Y_{j}-\theta_{N}\right)}{\prod_{i} f\left(X_{i}\right) \prod_{j} g\left(Y_{j}\right)}=-\frac{h \sqrt{1-\lambda}}{\sqrt{n}} \sum_{j=1}^{n} \frac{g^{\prime}}{g}\left(Y_{i}\right)-\frac{1}{2} h^{2}(1-\lambda) I_{g}+o_{P}(1) .
$$

By the multivariate central limit theorem, the linear approximations on the right sides of the two preceding displays are jointly asymptotically normal. By Slutsky's lemma the same is true for the left sides. Consequently, by Le Cam's third lemma the sequence $\sqrt{N}\left(T_{N}-n /(2 N)\right)$ converges under the alternatives $\theta_{N}=h / \sqrt{N}$ in distribution to a normal distribution with variance $\sigma^{2}(0)$ and mean the asymptotic covariance $\tau(h)$ of the linear approximations. This is given by

$$
\tau(h)=-h \lambda(1-\lambda) \int_{F(y) \leq 1 / 2} \frac{f^{\prime}}{f}(y) d F(y)
$$

Conclude that (14.4) is valid with $\mu(\theta)=\tau(\theta)$ and $\sigma(\theta)=\sigma(0)$. (Use the test statistics $T_{N}-n /(2 N)$ rather than $T_{N}$.) The slope of the median test is given by $-2 \sqrt{\lambda(1-\lambda)} \int_{0}^{1 / 2} \left(f^{\prime} / f\right)\left(F^{-1}(u)\right) d u$.

### 14.2 Consistency

After noting that the power at fixed alternatives typically tends to 1 , we focused attention on the performance of tests at alternatives converging to the null hypothesis. The comparison of local power functions is only of interest if the sequences of tests are consistent at
fixed alternatives. Fortunately, establishing consistency is rarely a problem. The following lemmas describe two basic methods.
14.15 Lemma. Let $T_{n}$ be a sequence of statistics such that $T_{n} \xrightarrow{P_{\theta}} \mu(\theta)$ for every $\theta$. Then the family of tests that reject the null hypothesis $H_{0}: \theta=0$ for large values of $T_{n}$ is consistent against every $\theta$ such that $\mu(\theta)>\mu(0)$.
14.16 Lemma. Let $\mu$ and $\sigma$ be functions of $\theta$ such that (14.4) holds for every sequence $\theta_{n}=h / \sqrt{n}$. Suppose that $\mu$ is differentiable and that $\sigma$ is continuous at zero, with $\mu^{\prime}(0)>0$ and $\sigma(0)>0$. Suppose that the tests that reject the null hypothesis for large values of $T_{n}$ possess nondecreasing power functions $\theta \mapsto \pi_{n}(\theta)$. Then this family of tests is consistent against every alternative $\theta>0$. Moreover, if $\pi_{n}(0) \rightarrow \alpha$, then $\pi_{n}\left(\theta_{n}\right) \rightarrow \alpha$ or $\pi_{n}\left(\theta_{n}\right) \rightarrow 1$ when $\sqrt{n} \theta_{n} \rightarrow 0$ or $\sqrt{n} \theta_{n} \rightarrow \infty$, respectively.

Proofs. For the first lemma, suppose that the tests reject the null hypothesis if $T_{n}$ exceeds the critical value $c_{n}$. By assumption, the probability under $\theta=0$ that $T_{n}$ is outside the interval $(\mu(0)-\varepsilon, \mu(0)+\varepsilon)$ converges to zero as $n \rightarrow \infty$, for every fixed $\varepsilon>0$. If the asymptotic level $\lim \mathrm{P}_{0}\left(T_{n}>c_{n}\right)$ is positive, then it follows that $c_{n}<\mu(0)+\varepsilon$ eventually. On the other hand, under $\theta$ the probability that $T_{n}$ is in $(\mu(\theta)-\varepsilon, \mu(\theta)+\varepsilon)$ converges to 1 . For sufficiently small $\varepsilon$ and $\mu(\theta)>\mu(0)$, this interval is to the right of $\mu(0)+\varepsilon$. Thus for sufficiently large $n$, the power $\mathrm{P}_{\theta}\left(T_{n}>c_{n}\right)$ can be bounded below by $\mathrm{P}_{\theta}\left(T_{n} \in(\mu(\theta)-\varepsilon, \mu(\theta)+\varepsilon)\right) \rightarrow 1$.

For the proof of the second lemma, first note that by Theorem 14.7 the sequence of local power functions $\pi_{n}(h / \sqrt{n})$ converges to $\pi(h)=1-\Phi\left(z_{\alpha}-h \mu^{\prime}(0) / \sigma(0)\right)$, for every $h$, if the asymptotic level is $\alpha$. If $\sqrt{n} \theta_{n} \rightarrow 0$, then eventually $\theta_{n}<h / \sqrt{n}$ for every given $h>0$. By the monotonicity of the power functions, $\pi_{n}\left(\theta_{n}\right) \leq \pi_{n}(h / \sqrt{n})$ for sufficiently large $n$. Thus $\lim \sup \pi_{n}\left(\theta_{n}\right) \leq \pi(h)$ for every $h>0$. For $h \downarrow 0$ the right side converges to $\pi(0)=\alpha$. Combination with the inequality $\pi_{n}\left(\theta_{n}\right) \geq \pi_{n}(0) \rightarrow \alpha$ gives $\pi_{n}\left(\theta_{n}\right) \rightarrow \alpha$. The case that $\sqrt{n} \theta_{n} \rightarrow \infty$ can be handled similarly. Finally, the power $\pi_{n}(\theta)$ at fixed alternatives is bounded below by $\pi_{n}\left(\theta_{n}\right)$ eventually, for every sequence $\theta_{n} \downarrow 0$. Thus $\pi_{n}(\theta) \rightarrow 1$, and the sequence of tests is consistent at $\theta$.

The following examples show that the $t$-test and Mann-Whitney test are both consistent against large sets of alternatives, albeit not exactly the same sets. They are both tests to compare the locations of two samples, but the pertaining definitions of "location" are not the same. The $t$-test can be considered a test to detect a difference in mean; the Mann-Whitney test is designed to find a difference of $\mathrm{P}(X \leq Y)$ from its value $1 / 2$ under the null hypothesis. This evaluation is justified by the following examples and is further underscored by the consideration of asymptotic efficiency in nonparametric models. It is shown in Section 25.6 that the tests are asymptotically efficient for testing the parameters $\mathrm{E} Y-\mathrm{E} X$ or $\mathrm{P}(X \leq Y)$ if the underlying distributions $F$ and $G$ are completely unknown.
14.17 Example ( $t$-test). The two-sample $t$-statistic $(\bar{Y}-\bar{X}) / S$ converges in probability to $\mathrm{E}(Y-X) / \sigma$, where $\sigma^{2}=\lim \operatorname{var}(\bar{Y}-\bar{X})$. If the null hypothesis postulates that $\mathrm{E} Y=\mathrm{E} X$, then the test that rejects the null hypothesis for large values of the $t$-statistic is consistent against every alternative for which $\mathrm{E} Y>\mathrm{E} X$.
14.18 Example (Mann-Whitney test). The Mann-Whitney statistic $U$ converges in probability to $\mathrm{P}(X \leq Y)$, by the two-sample $U$-statistic theorem. The probability $\mathrm{P}(X \leq Y)$ is equal to $1 / 2$ if the two samples are equal in distribution and possess a continuous distribution function. If the null hypothesis postulates that $\mathrm{P}(X \leq Y)=1 / 2$, then the test that rejects for large values of $U$ is consistent against any alternative for which $\mathrm{P}(X \leq Y)>1 / 2$. $\square$

### 14.3 Asymptotic Relative Efficiency

Sequences of tests can be ranked in quality by comparing their asymptotic power functions. For the test statistics we have considered so far, this comparison only involves the "slopes" of the tests. The concept of relative efficiency yields a method to quantify the interpretation of the slopes.

Consider a sequence of testing problems consisting of testing a null hypothesis $H_{0}: \theta=0$ versus the alternative $H_{1}: \theta=\theta_{\nu}$. We use the parameter $\nu$ to describe the asymptotics; thus $\nu \rightarrow \infty$. We require a priori that our tests attain asymptotically level $\alpha$ and power $\gamma \in(\alpha, 1)$. Usually we can meet this requirement by choosing an appropriate number of observations at "time" $\nu$. A larger number of observations allows smaller level and higher power. If $\pi_{n}$ is the power function of a test if $n$ observations are available, then we define $n_{\nu}$ to be the minimal number of observations such that both

$$
\pi_{n_{v}}(0) \leq \alpha, \quad \text { and } \quad \pi_{n_{v}}\left(\theta_{v}\right) \geq \gamma .
$$

If two sequences of tests are available, then we prefer the sequence for which the numbers $n_{\nu}$ are smallest. Suppose that $n_{\nu, 1}$ and $n_{\nu, 2}$ observations are needed for two given sequences of tests. Then, if it exists, the limit

$$
\lim _{v \rightarrow \infty} \frac{n_{v, 2}}{n_{v, 1}}
$$

is called the (asymptotic) relative efficiency or Pitman efficiency of the first with respect to the second sequence of tests. A relative efficiency larger than 1 indicates that fewer observations are needed with the first sequence of tests, which may then be considered the better one.

In principle, the relative efficiency may depend on $\alpha, \gamma$ and the sequence of alternatives $\theta_{\nu}$. The concept is mostly of interest if the relative efficiency is the same for all possible choices of these parameters. This is often the case. In particular, in the situations considered previously, the relative efficiency turns out to be the square of the quotient of the slopes.
14.19 Theorem. Consider statistical models ( $P_{n, \theta}: \theta \geq 0$ ) such that $\left\|P_{n, \theta}-P_{n, 0}\right\| \rightarrow 0$ as $\theta \rightarrow 0$, for every $n$. Let $T_{n, 1}$ and $T_{n, 2}$ be sequences of statistics that satisfy (14.4) for every sequence $\theta_{n} \downarrow 0$ and functions $\mu_{i}$ and $\sigma_{i}$ such that $\mu_{i}$ is differentiable at zero and $\sigma_{i}$ is continuous at zero, with $\mu_{i}^{\prime}(0)>0$ and $\sigma_{i}(0)>0$. Then the relative efficiency of the tests that reject the null hypothesis $H_{0}: \theta=0$ for large values of $T_{n, i}$ is equal to

$$
\left(\frac{\mu_{1}^{\prime}(0) / \sigma_{1}(0)}{\mu_{2}^{\prime}(0) / \sigma_{2}(0)}\right)^{2},
$$

for every sequence of alternatives $\theta_{\nu} \downarrow 0$, independently of $\alpha>0$ and $\gamma \in(\alpha, 1)$. If the power functions of the tests based on $T_{n, i}$ are nondecreasing for every $n$, then the assumption
of asymptotic normality of $T_{n, i}$ can be relaxed to asymptotic normality under every sequence $\theta_{n}=O(1 / \sqrt{n})$ only.

Proof. Fix $\alpha$ and $\gamma$ as in the introduction and, given alternatives $\theta_{\nu} \downarrow 0$, let $n_{\nu, i}$ observations be used with each of the two tests. The assumption that $\left\|P_{n, \theta_{\nu}}-P_{n, 0}\right\| \rightarrow 0$ as $v \rightarrow \infty$ for each fixed $n$ forces $n_{\nu, i} \rightarrow \infty$. Indeed, the sum of the probabilities of the first and second kind of the test with critical region $K_{n}$ equals

$$
\int_{K_{n}} d P_{n, 0}+\int_{K_{n}^{c}} d P_{n, \theta_{v}}=1+\int_{K_{n}}\left(p_{n, 0}-p_{n, \theta_{v}}\right) d \mu_{n}
$$

This sum is minimized for the critical region $K_{n}=\left\{p_{n, 0}-p_{n, \theta_{\nu}}<0\right\}$, and then equals $1-\frac{1}{2}\left\|P_{n, \theta_{\nu}}-P_{n, 0}\right\|$. By assumption, this converges to 1 as $v \rightarrow \infty$ uniformly in every finite set of $n$. Thus, for every bounded sequence $n=n_{\nu}$ and any sequence of tests, the sum of the error probabilities is asymptotically bounded below by 1 and cannot be bounded above by $\alpha+1-\gamma<1$, as required.

Now that we have ascertained that $n_{\nu, i} \rightarrow \infty$ as $\nu \rightarrow \infty$, we can use the asymptotic normality of the test statistics $T_{n, i}$. The convergence to a continuous distribution implies that the asymptotic level and power attained for the minimal numbers of observations (minimal for obtaining at most level $\alpha$ and at least power $\gamma$ ) is exactly $\alpha$ and $\gamma$. In order to obtain asymptotic level $\alpha$ the tests must reject $H_{0}$ if $\sqrt{n_{\nu}}\left(T_{n_{\nu}, i}-\mu_{i}(0)\right)>\sigma_{i}(0) z_{\alpha}+o(1)$. The powers of these tests are equal to

$$
\pi_{n_{\nu, i}}\left(\theta_{\nu}\right)=1-\Phi\left(z_{\alpha}+o(1)-\sqrt{n_{\nu, i}} \theta_{\nu} \frac{\mu_{i}^{\prime}(0)}{\sigma_{i}(0)}(1+o(1))\right)+o(1)
$$

This sequence of powers tends to $\gamma<1$ if and only if the argument of $\Phi$ tends to $z_{\gamma}$. Thus the relative efficiency of the two sequences of tests equals

$$
\lim _{v \rightarrow \infty} \frac{n_{v, 2}}{n_{v, 1}}=\lim _{v \rightarrow \infty} \frac{n_{v, 2} \theta_{v}^{2}}{n_{v, 1} \theta_{v}^{2}}=\frac{\left(z_{\alpha}-z_{\gamma}\right)^{2}}{\left(\mu_{2}^{\prime}(0) / \sigma_{2}(0)\right)^{2}} / \frac{\left(z_{\alpha}-z_{\gamma}\right)^{2}}{\left(\mu_{1}^{\prime}(0) / \sigma_{1}(0)\right)^{2}} .
$$

This proves the first assertion of the theorem.
If the power functions of the tests are monotone and the test statistics are asymptotically normal for every sequence $\theta_{n}=O(1 / \sqrt{n})$, then $\pi_{n, i}\left(\theta_{n}\right) \rightarrow \alpha$ or 1 if $\sqrt{n} \theta_{n} \rightarrow 0$ or $\infty$, respectively (see Lemma 14.16). In that case the sequences of tests can only meet the $(\alpha, \gamma)$ requirement for testing alternatives $\theta_{\nu}$ such that $\sqrt{n_{\nu, i}} \theta_{\nu}=O(1)$. For such sequences the preceding argument is valid and gives the asserted relative efficiency.

## *14.4 Other Relative Efficiencies

The asymptotic relative efficiency defined in the preceding section is known as the Pitman relative efficiency. In this section we discuss some other types of relative efficiencies. Define $n_{i}(\alpha, \gamma, \theta)$ as the minimal numbers of observations needed, with $i \in\{1,2\}$ for two given sequences of tests, to test a null hypothesis $H_{0}: \theta=0$ versus the alternative $H_{1}: \theta=\theta$ at level $\alpha$ and with power at least $\gamma$. Then the Pitman efficiency against a sequence of alternatives $\theta_{\nu} \rightarrow 0$ is defined as (if the limits exists)

$$
\lim _{\nu \rightarrow \infty} \frac{n_{2}\left(\alpha, \gamma, \theta_{\nu}\right)}{n_{1}\left(\alpha, \gamma, \theta_{\nu}\right)}
$$

The device to let the alternatives $\theta_{\nu}$ tend to the null hypothesis was introduced to make the testing problems harder and harder, so that the required numbers of observations tend to infinity, and the comparison becomes an asymptotic one. There are other possibilities that can serve the same end. The testing problem is harder as $\alpha$ is smaller, as $\gamma$ is larger, and (typically) as $\theta$ is closer to the null hypothesis. Thus, we could also let $\alpha$ tend to zero, or $\gamma$ tend to one, keeping the other parameters fixed, or even let two or all three of the parameters vary. For each possible method we could define the relative efficiency of two sequences of tests as the limit of the quotient of the minimal numbers of observations that are needed. Most of these possibilities have been studied in the literature. Next to the Pitman efficiency the most popular efficiency measure appears to be the Bahadur efficiency, which is defined as

$$
\lim _{\nu \rightarrow \infty} \frac{n_{2}\left(\alpha_{\nu}, \gamma, \theta\right)}{n_{1}\left(\alpha_{\nu}, \gamma, \theta\right)} .
$$

Here $\alpha_{\nu}$ tends to zero, but $\gamma$ and $\theta$ are fixed. Typically, the Bahadur efficiency depends on $\theta$, but not on $\gamma$, and not on the particular sequence $\alpha_{\nu} \downarrow 0$ that is used.

Whereas the calculation of Pitman efficiencies is most often based on distributional limit theorems, Bahadur efficiencies are derived from large deviations results. The reason is that the probabilities of first or second kind for testing a fixed null hypothesis against a fixed alternative usually tend to zero at an exponential speed. Large deviations theorems quantify this speed. Suppose that the null hypothesis $H_{0}: \theta=0$ is rejected for large values of a test statistic $T_{n}$, and that

$$
\begin{align*}
-\frac{2}{n} \log \mathrm{P}_{0}\left(T_{n}\right. & \geq t) \rightarrow e(t), \quad \text { every } t,  \tag{14.20}\\
T_{n} & \xrightarrow{P_{\theta}} \mu(\theta) . \tag{14.21}
\end{align*}
$$

The first result is a large deviation type result, and the second a "law of large numbers." The observed significance level of the test is defined as $\mathrm{P}_{0}\left(T_{n} \geq t\right)_{\mid t=T_{n}}$. Under the null hypothesis, this random variable is uniformly distributed if $T_{n}$ possesses a continuous distribution function. For a fixed alternative $\theta$, it typically converges to zero at an exponential rate. For instance, under the preceding conditions, if $e$ is continuous at $\mu(\theta)$, then (because $e$ is necessarily monotone) it is immediate that

$$
-\frac{2}{n} \log \mathrm{P}_{0}\left(T_{n} \geq t\right)_{\mid t=T_{n}} \xrightarrow{P_{\theta}} e(\mu(\theta)) .
$$

The quantity $e(\mu(\theta))$ is called the Bahadur slope of the test (or rather the limit in probability of the left side if it exists). The quotient of the slopes of two sequences of test statistics gives the Bahadur relative efficiency.
14.22 Theorem. Let $T_{n, 1}$ and $T_{n, 2}$ be sequences of statistics in statistical models ( $P_{n, 0}$, $P_{n, \theta}$ ) that satisfy (14.20) and (14.21) for functions $e_{i}$ and number $\mu_{i}(\theta)$ such that $e_{i}$ is continuous at $\mu_{i}(\theta)$. Then the Bahadur relative efficiency of the sequences of tests that reject for large values of $T_{n, i}$ is equal to $e_{1}\left(\mu_{1}(\theta)\right) / e_{2}\left(\mu_{2}(\theta)\right)$, for every $\alpha_{\nu} \downarrow 0$ and every $1>\gamma>\sup _{n} P_{n, \theta}\left(p_{n, 0}=0\right)$.

Proof. For simplicity of notation, we drop the index $i \in\{1,2\}$ and write $n_{\nu}$ for the minimal numbers of observations needed to obtain level $\alpha_{\nu}$ and power $\gamma$ with the test statistics $T_{n}$.

The sample sizes $n_{\nu}$ necessarily converge to $\infty$ as $\nu \rightarrow \infty$. If not, then there would exist a fixed value $n$ and a (sub)sequence of tests with levels tending to 0 and powers at least $\gamma$. However, for any fixed $n$, and any sequence of measurable sets $K_{m}$ with $P_{n, 0}\left(K_{m}\right) \rightarrow 0$ as $m \rightarrow \infty$, the probabilities $P_{n, \theta}\left(K_{m}\right)=P_{n, \theta}\left(K_{m} \cap p_{n, 0}=0\right)+o(1)$ are eventually strictly smaller than $\gamma$, by assumption.

The most powerful level $\alpha_{\nu}$-test that rejects for large values of $T_{n}$ has critical region $\left\{T_{n} \geq c_{n}\right\}$ or $\left\{T_{n}>c_{n}\right\}$ for $c_{n}=\inf \left\{c: \mathrm{P}_{0}\left(T_{n} \geq c\right) \leq \alpha_{\nu}\right\}$, where we use $\geq$ if $\mathrm{P}_{0}\left(T_{n} \geq c_{n}\right) \leq \alpha_{\nu}$ and $>$ otherwise. Equivalently, with the notation $L_{n}=\mathrm{P}_{0}\left(T_{n} \geq t\right)_{\mid t=T_{n}}$, this is the test with critical region $\left\{L_{n} \leq \alpha_{\nu}\right\}$. By the definition of $n_{\nu}$ we conclude that

$$
P_{n, \theta}\left(-\frac{2}{n} \log L_{n} \geq-\frac{2}{n} \log \alpha_{\nu}\right) \begin{cases}\geq \gamma & \text { for } n=n_{\nu} \\ <\gamma & \text { for } n=n_{\nu}-1 .\end{cases}
$$

By (14.20) and (14.21), the random variable inside the probability converges in probability to the number $e(\mu(\theta))$ as $n \rightarrow \infty$. Thus, the probability converges to 0 or 1 if $-(2 / n) \log \alpha_{\nu}$ is asymptotically strictly bigger or smaller than $e(\mu(\theta))$, respectively. Conclude that

$$
\begin{array}{r}
\limsup _{v \rightarrow \infty}-\frac{2}{n_{v}} \log \alpha_{v} \leq e(\mu(\theta)) \\
\liminf _{v \rightarrow \infty}-\frac{2}{n_{v}-1} \log \alpha_{v} \geq e(\mu(\theta))
\end{array}
$$

Combined, this yields the asymptotic equivalence $n_{\nu} \sim-2 \log \alpha_{\nu} / e(\mu(\theta))$. Applying this for both $n_{\nu, 1}$ and $n_{\nu, 2}$ and taking the quotient, we obtain the theorem.

Bahadur and Pitman efficiencies do not always yield the same ordering of sequences of tests. In numerical comparisons, the Pitman efficiencies appear to be more relevant for moderate sample sizes. This is explained by their method of calculation. By the preceding theorem, Bahadur efficiencies follow from a large deviations result under the null hypothesis and a law of large numbers under the alternative. A law of large numbers is of less accuracy than a distributional limit result. Furthermore, large deviation results, while mathematically interesting, often yield poor approximations for the probabilities of interest. For instance, condition (14.20) shows that $\mathrm{P}_{0}\left(T_{n} \geq t\right)=\exp \left(-\frac{1}{2} n e(t)\right) \exp o(n)$. Nothing guarantees that the term $\exp o(n)$ is close to 1 .

On the other hand, often the Bahadur efficiencies as a function of $\theta$ are more informative than Pitman efficiencies. The Pitman slopes are obtained under the condition that the sequence $\sqrt{n}\left(T_{n}-\mu(0)\right)$ is asymptotically normal with mean zero and variance $\sigma^{2}(0)$. Suppose, for the present argument, that $T_{n}$ is normally distributed for every finite $n$, with the parameters $\mu(0)$ and $\sigma^{2}(0) / n$. Then, because $1-\Phi(t) \sim \phi(t) / t$ as $t \rightarrow \infty$,

$$
-\frac{2}{n} \log \mathrm{P}_{0}\left(T_{n} \geq \mu(0)+t\right)=-\frac{2}{n} \log \left(1-\Phi\left(\frac{t \sqrt{n}}{\sigma(0)}\right)\right) \rightarrow \frac{t^{2}}{\sigma^{2}(0)}, \quad \text { every } t
$$

The Bahadur slope would be equal to $(\mu(\theta)-\mu(0))^{2} / \sigma^{2}(0)$. For $\theta \rightarrow 0$, this is approximately equal to $\theta^{2}$ times the square of the Pitman slope $\mu^{\prime}(0)^{2} / \sigma^{2}(0)$. Consequently, the limit of the Bahadur efficiencies as $\theta \rightarrow 0$ would yield the Pitman efficiency.

Now, the preceding argument is completely false if $T_{n}$ is only approximately normally distributed: Departures from normality that are negligible in the sense of weak convergence need not be so for large-deviation probabilities. The difference between the "approximate

Bahadur slopes" just obtained and the true slopes is often substantial. However, the argument tends to be "more correct" as $t$ approaches $\mu(0)$, and the conclusion that limiting Bahadur efficiencies are equal to Pitman efficiencies is often correct. ${ }^{\dagger}$

The main tool needed to evaluate Bahadur efficiencies is the large-deviation result (14.20). For averages $T_{n}$, this follows from the Cramér-Chernoff theorem, which can be thought of as the analogue of the central limit theorem for large deviations. It is a refinement of the weak law of large numbers that yields exponential convergence of probabilities of deviations from the mean.

The cumulant generating function of a random variable $Y$ is the function $u \mapsto K(u)= \log \mathrm{E} e^{u Y}$. If we allow the value $\infty$, then this is well-defined for every $u \in \mathbb{R}$. The set of $u$ such that $K(u)$ is finite is an interval that may or may not contain its boundary points and may be just the point $\{0\}$.
14.23 Proposition (Cramér-Chernoff theorem). Let $Y_{1}, Y_{2}, \ldots$ be i.i.d. random variables with cumulant generating function $K$. Then, for every $t$,

$$
\frac{1}{n} \log \mathrm{P}(\bar{Y} \geq t) \rightarrow \inf _{u \geq 0}(K(u)-t u)
$$

Proof. The cumulant generating function of the variables $Y_{i}-t$ is equal to $u \mapsto K(u)-u t$. Therefore, we can restrict ourselves to the case $t=0$. The proof consists of separate upper and lower bounds on the probabilities $\mathrm{P}(\bar{Y} \geq 0)$.

The upper bound is easy and is valid for every $n$. By Markov's inequality, for every $u \geq 0$,

$$
\mathrm{P}(\bar{Y} \geq 0)=\mathrm{P}\left(e^{u n \bar{Y}_{n}} \geq 1\right) \leq \mathrm{E} e^{u n \bar{Y}_{n}}=e^{n K(u)}
$$

Take logarithms, divide by $n$, and take the infimum over $u \geq 0$ to find one half of the proposition.

For the proof of the lower bound, first consider the cases that $Y_{i}$ is nonnegative or nonpositive. If $\mathrm{P}\left(Y_{i}<0\right)=0$, then the function $u \mapsto K(u)$ is monotonely increasing on $\mathbb{R}$ and its infimum on $u \geq 0$ is equal to 0 (attained at $u=0$ ); this is equal to $n^{-1} \log \mathrm{P}(\bar{Y} \geq 0)$ for every $n$. Second, if $\mathrm{P}\left(Y_{i}>0\right)=0$, then the function $u \mapsto K(u)$ is monotonely decreasing on $\mathbb{R}$ with $K(\infty)=\log \mathrm{P}\left(Y_{1}=0\right)$; this is equal to $n^{-1} \log \mathrm{P}(\bar{Y} \geq 0)$ for every $n$. Thus, the theorem is valid in both cases, and we may exclude them from now on.

First, assume that $K(u)$ is finite for every $u \in \mathbb{R}$. Then the function $u \mapsto K(u)$ is analytic on $\mathbb{R}$, and, by differentiating under the expectation, we see that $K^{\prime}(0)=\mathrm{E} Y_{1}$. Because $Y_{i}$ takes both negative and positive values, $K(u) \rightarrow \infty$ as $u \rightarrow \pm \infty$. Thus, the infimum of the function $u \mapsto K(u)$ over $u \in \mathbb{R}$ is attained at a point $u_{0}$ such that $K^{\prime}\left(u_{0}\right)=0$.

The case that $u_{0}<0$ is trivial, but requires an argument. By the convexity of the function $u \mapsto K(u), K$ is nondecreasing on $\left[u_{0}, \infty\right)$. If $u_{0}<0$, then it attains its minimum value over $u \geq 0$ at $u=0$, which is $K(0)=0$. Furthermore, in this case $\mathrm{E} Y_{1}=K^{\prime}(0)>K^{\prime}\left(u_{0}\right)=0$ (strict inequality under our restrictions, for instance because $K^{\prime \prime}(0)=\operatorname{var} Y_{1}>0$ ) and hence $\mathrm{P}(\bar{Y} \geq 0) \rightarrow 1$ by the law of large numbers. Thus, the limit of the left side of the proposition (with $t=0$ ) is 0 as well.

[^8]For $u_{0} \geq 0$, let $Z_{1}, Z_{2}, \ldots$ be i.i.d. random variables with the distribution given by

$$
d P_{Z}(z)=e^{-K\left(u_{0}\right)} e^{u_{0} z} d P_{Y}(z)
$$

Then $Z_{1}$ has cumulant generating function $u \mapsto K\left(u_{0}+u\right)-K\left(u_{0}\right)$, and, as before, its mean can be found by differentiating this function at $u=0: \mathrm{E} Z_{1}=K^{\prime}\left(u_{0}\right)=0$. For every $\varepsilon>0$,

$$
\begin{aligned}
\mathrm{P}(\bar{Y} \geq 0) & =\mathrm{E} 1\left\{\bar{Z}_{n} \geq 0\right\} e^{-u_{0} n \bar{Z}_{n}} e^{n K\left(u_{0}\right)} \\
& \geq \mathrm{P}\left(0 \leq \bar{Z}_{n} \leq \varepsilon\right) e^{-u_{0} n \varepsilon} e^{n K\left(u_{0}\right)}
\end{aligned}
$$

Because $\bar{Z}_{n}$ has mean 0 , the sequence $\mathrm{P}\left(0 \leq \bar{Z}_{n} \leq \varepsilon\right)$ is bounded away from 0 , by the central limit theorem. Conclude that $n^{-1}$ times the limit inferior of the logarithm of the left side is bounded below by $-u_{0} \varepsilon+K\left(u_{0}\right)$. This is true for every $\varepsilon>0$ and hence also for $\varepsilon=0$.

Finally, we remove the restriction that $K(u)$ is finite for every $u$, by a truncation argument. For a fixed, large $M$, let $Y_{1}^{M}, Y_{2}^{M}, \ldots$ be distributed as the variables $Y_{1}, Y_{2}, \ldots$ given that $\left|Y_{i}\right| \leq M$ for every $i$, that is, they are i.i.d. according to the conditional distribution of $Y_{1}$ given $\left|Y_{1}\right| \leq M$. Then, with $u \mapsto K_{M}(u)=\log \mathrm{E} e^{u Y_{1}} 1\left\{\left|Y_{1}\right| \leq M\right\}$,

$$
\begin{aligned}
\liminf \frac{1}{n} \log \mathrm{P}(\bar{Y} \geq 0) & \geq \frac{1}{n} \log \left(\mathrm{P}\left(\bar{Y}_{n}^{M} \geq 0\right) \mathrm{P}\left(\left|Y_{i}^{M}\right| \leq M\right)^{n}\right) \\
& \geq \inf _{u \geq 0} K_{M}(u)
\end{aligned}
$$

by the preceding argument applied to the truncated variables. Let $s$ be the limit of the right side as $M \rightarrow \infty$, and let $A_{M}$ be the set $\left\{u \geq 0: K_{M}(u) \leq s\right\}$. Then the sets $A_{M}$ are nonempty and compact for sufficiently large $M$ (as soon as $K_{M}(u) \rightarrow \infty$ as $u \rightarrow \pm \infty$ ), with $A_{1} \supset A_{2} \supset \cdots$, whence $\cap A_{M}$ is nonempty as well. Because $K_{M}$ converges pointwise to $K$ as $M \rightarrow \infty$, any point $u_{1} \in \cap A_{M}$ satisfies $K\left(u_{1}\right)=\lim K_{M}\left(u_{1}\right) \leq s$. Conclude that $s$ is bigger than the right side of the proposition (with $t=0$ ).
14.24 Example (Sign statistic). The cumulant generating function of a variable $Y$ that is -1 and 1 , each with probability $\frac{1}{2}$, is equal to $K(u)=\log \cosh u$. Its derivative is $K^{\prime}(u)=\tanh u$ and hence the infimum of $K(u)-t u$ over $u \in \mathbb{R}$ is attained for $u=\operatorname{arctanh} t$. By the Cramér-Chernoff theorem, for $0<t<1$,

$$
-\frac{2}{n} \log \mathrm{P}(\bar{Y} \geq t) \rightarrow e(t):=-2 \log \cosh \operatorname{arctanh} t+2 t \operatorname{arctanh} t
$$

We can apply this result to find the Bahadur slope of the sign statistic $T_{n}=n^{-1} \sum_{i=1}^{n} \operatorname{sign}\left(X_{i}\right)$. If the null distribution of the random variables $X_{1}, \ldots, X_{n}$ is continuous and symmetric about zero, then (14.20) is valid with $e(t)$ as in the preceding display and with $\mu(\theta)= \mathrm{E}_{\theta} \operatorname{sign}\left(X_{1}\right)$. Figure 14.2 shows the slopes of the sign statistic and the sample mean for testing the location of the Laplace distribution. The local optimality of the sign statistic is reflected in the Bahadur slopes, but for detecting large differences of location the mean is better than the sign statistic. However, it should be noted that the power of the sign test in this range is so close to 1 that improvement may be irrelevant; for example, the power is 0.999 at level 0.007 for $n=25$ at $\theta=2$.

![](https://cdn.mathpix.com/cropped/ba7603fa-498d-468b-91dd-53c69123725b-109.jpg?height=2188&width=3503&top_left_y=548&top_left_x=1082)
Figure 14.2. Bahadur slopes of the sign statistic (solid line) and the sample mean (dotted line) for testing that a random sample from the Laplace distribution has mean zero versus the alternative that the mean is $\theta$, as a function of $\theta$.

14.25 Example (Student statistic). Suppose that $X_{1}, \ldots, X_{n}$ are a random sample from a normal distribution with mean $\mu$ and variance $\sigma^{2}$. We shall consider $\sigma$ known and compare the slopes of the sample mean and the Student statistic $\bar{X}_{n} / S_{n}$ for testing $H_{0}: \mu=0$.

The cumulant generating function of the normal distribution is equal to $K(u)=u \mu+ \frac{1}{2} u^{2} \sigma^{2}$. By the Cramér-Chernoff theorem, for $t>0$,

$$
-\frac{2}{n} \log \mathrm{P}_{0}\left(\bar{X}_{n} \geq t\right) \rightarrow e(t):=\frac{t^{2}}{\sigma^{2}} .
$$

Thus, the Bahadur slope of the sample mean is equal to $\mu^{2} / \sigma^{2}$, for every $\mu>0$.
Under the null hypothesis, the statistic $\sqrt{n} \bar{X}_{n} / S_{n}$ possesses the $t$-distribution with ( $n-1$ ) degrees of freedom. Thus, for a random sample $Z_{0}, Z_{1}, \ldots$ of standard normal variables, for every $t>0$,

$$
\mathrm{P}_{0}\left(\sqrt{\frac{n}{n-1}} \frac{\bar{X}_{n}}{S_{n}} \geq t\right)=\frac{1}{2} \mathrm{P}\left(\frac{t_{n-1}^{2}}{n-1} \geq t^{2}\right)=\frac{1}{2} \mathrm{P}\left(Z_{0}^{2}-t^{2} \sum_{i=1}^{n-1} Z_{i}^{2} \geq 0\right) .
$$

This probability is not of the same form as in the Cramér-Chernoff theorem, but it concerns almost an average, and we can obtain the large deviation probabilities from the cumulant generating function in an analogous way. The cumulant generating function of a square of a standard normal variable is equal to $u \mapsto-\frac{1}{2} \log (1-2 u)$, and hence the cumulant generating function of the variable $Z_{0}^{2}-t^{2} \sum_{i=1}^{n-1} Z_{i}^{2}$ is equal to

$$
K_{n}(u)=-\frac{1}{2} \log (1-2 u)-\frac{1}{2}(n-1) \log \left(1+2 t^{2} u\right) .
$$

This function is nicely differentiable and, by straightforward calculus, its minimum value can be found to be

$$
\inf _{u} K_{n}(u)=-\frac{1}{2} \log \left(\frac{t^{2}+1}{t^{2} n}\right)-\frac{1}{2}(n-1) \log \left(\frac{(n-1)\left(t^{2}+1\right)}{n}\right) .
$$

The minimum is achieved on $[0, \infty)$ for $t^{2} \geq(n-1)^{-1}$. This expression divided by $n$ is the analogue of $\inf _{u} K(u)$ in the Cramér-Chernoff theorem. By an extension of this theorem,
for every $t>0$,

$$
-\frac{2}{n} \log \mathrm{P}_{0}\left(\sqrt{\frac{n}{n-1}} \frac{\bar{X}_{n}}{S_{n}} \geq t\right) \rightarrow e(t)=\log \left(t^{2}+1\right) .
$$

Thus, the Bahadur slope of the Student statistic is equal to $\log \left(1+\mu^{2} / \sigma^{2}\right)$.
For $\mu / \sigma$ close to zero, the Bahadur slopes of the sample mean and the Student statistic are close, but for large $\mu / \sigma$ the slope of the sample mean is much bigger. This suggests that the loss in efficiency incurred by unnecessarily estimating the standard deviation $\sigma$ can be substantial. This suggestion appears to be unrealistic and also contradicts the fact that the Pitman efficiencies of the two sequences of statistics are equal.
14.26 Example (Neyman-Pearson statistic). The sequence of Neyman-Pearson statistics $\prod_{i=1}^{n}\left(p_{\theta} / p_{\theta_{0}}\right)\left(X_{i}\right)$ has Bahadur slope $-2 P_{\theta} \log \left(p_{\theta_{0}} / p_{\theta}\right)$. This is twice the KullbackLeibler divergence of the measures $P_{\theta_{0}}$ and $P_{\theta}$ and shows an important connection between large deviations and the Kullback-Leibler divergence.

In regular cases this result is a consequence of the Cramér-Chernoff theorem. The variable $Y=\log p_{\theta} / p_{\theta_{0}}$ has cumulant generating function $K(u)=\log \int p_{\theta}^{u} p_{\theta_{0}}^{1-u} d \mu$ un$\operatorname{der} P_{\theta_{0}}$. The function $K(u)$ is finite for $0 \leq u \leq 1$, and, at least by formal calculus, $K^{\prime}(1)=P_{\theta} \log \left(p_{\theta} / p_{\theta_{0}}\right)=\mu(\theta)$, where $\mu(\theta)$ is the asymptotic mean of the sequence $n^{-1} \sum \log \left(p_{\theta} / p_{\theta_{0}}\right)\left(X_{i}\right)$. Thus the infimum of the function $u \mapsto K(u)-u \mu(\theta)$ is attained at $u=1$ and the Bahadur slope is given by

$$
e(\mu(\theta))=-2(K(1)-\mu(\theta))=2 P_{\theta} \log \frac{p_{\theta}}{p_{\theta_{0}}}
$$

In section 16.6 we obtain this result by a direct, and rigorous, argument.

For statistics that are not means, the Cramér-Chernoff theorem is not applicable, and we need other methods to compute the Bahadur efficiencies. An important approach applies to functions of means and is based on more general versions of Cramér's theorem. A first generalization asserts that, for certain sets $B$, not necessarily of the form $[t, \infty)$,

$$
\frac{1}{n} \log \mathrm{P}(\bar{Y} \in B) \rightarrow-\inf _{y \in B} I(y), \quad I(y)=\sup _{u}(u y-K(u)) .
$$

For a given statistic of the form $\phi(\bar{Y})$, the large deviation probabilities of interest $\mathrm{P}(\phi(\bar{Y}) \geq t)$ can be written in the form $\mathrm{P}\left(\bar{Y} \in B_{t}\right)$ for the inverse images $B_{t}=\phi^{-1}[t, \infty)$. If $B_{t}$ is an eligible set in the preceding display, then the desired large deviations result follows, although we shall still have to evaluate the repeated "inf sup" on the right side. Now, according to Cramér's theorem, the display is valid for every set such that the right side does not change if $B$ is replaced by its interior or its closure. In particular, if $\phi$ is continuous, then $B_{t}$ is closed and its interior $\stackrel{\circ}{B}_{t}$ contains the set $\phi^{-1}(t, \infty)$. Then we obtain a large deviations result if the difference set $\phi^{-1}\{t\}$ is "small" in that it does not play a role when evaluating the right side of the display.

Transforming a univariate mean $\bar{Y}$ into a statistic $\phi(\bar{Y})$ can be of interest (for example, to study the two-sided test statistics $|\bar{Y}|$ ), but the real promise of this approach is in its applications to multivariate and infinite-dimensional means. Cramér's theorem has been generalized to these situations. General large deviation theorems can best be formulated
as separate upper and lower bounds. A sequence of random maps $X_{n}: \Omega \mapsto \mathbb{D}$ from a probability space ( $\Omega, \mathcal{U}, \mathrm{P}$ ) into a topological space $\mathbb{D}$ is said to satisfy the large deviation principle with rate function $I$ if, for every closed set $F$ and for every open set $G$,

$$
\begin{aligned}
\limsup _{n \rightarrow \infty} \frac{1}{n} \log \mathrm{P}^{*}\left(X_{n} \in F\right) & \leq-\inf _{y \in F} I(y) \\
\liminf _{n \rightarrow \infty} \frac{1}{n} \log \mathrm{P}_{*}\left(X_{n} \in G\right) & \geq-\inf _{y \in G} I(y)
\end{aligned}
$$

The rate function $I: \mathbb{D} \mapsto[0, \infty]$ is assumed to be lower semicontinuous and is called a good rate function if the sublevel sets $\{y: I(y) \leq M\}$ are compact, for every $M \in \mathbb{R}$. The inner and outer probabilities that $X_{n}$ belongs to a general set $B$ is sandwiched between the probabilities that it belongs to the interior $\dot{B}$ and the closure $\bar{B}$. Thus, we obtain a large deviation result with equality for every set $B$ such that $\inf \{I(y): y \in \bar{B}\}=\inf \{I(y): y \in \stackrel{\circ}{B}\}$. An implication for the slopes of test statistics of the form $\phi\left(X_{n}\right)$ is as follows.
14.27 Lemma. Suppose that $\phi: \mathbb{D} \mapsto \mathbb{R}$ is continuous at every $y$ such that $I(y)<\infty$ and suppose that $\inf \{I(y): \phi(y)>t\}=\inf \{I(y): \phi(y) \geq t\}$. If the sequence $X_{n}$ satisfies the large-deviation principle with the rate function $I$ under $\mathrm{P}_{0}$, then $T_{n}=\phi\left(X_{n}\right)$ satisfies (14.20) with $e(t)=2 \inf \{I(y): \phi(y) \geq t\}$. Furthermore, if $I$ is a good rate function, then $e$ is continuous at $t$.

Proof. Define sets $A_{t}=\phi^{-1}(t, \infty)$ and $B_{t}=\phi^{-1}[t, \infty)$, and let $\mathbb{D}_{0}$ be the set where $I$ is finite. By the continuity of $\phi, \bar{B}_{t} \cap \mathbb{D}_{0}=B_{t} \cap \mathbb{D}_{0}$ and $\stackrel{\circ}{B}_{t} \cap \mathbb{D}_{0} \supset A_{t} \cap \mathbb{D}_{0}$. (If $y \notin \stackrel{\circ}{B}_{t}$, then there is a net $y_{n} \in B_{t}^{c}$ with $y_{n} \rightarrow y$; if also $y \in \mathbb{D}_{0}$, then $\phi(y)=\lim \phi\left(y_{n}\right) \leq t$ and hence $y \notin A_{t}$.) Consequently, the infimum of $I$ over $\stackrel{\circ}{B}_{t}$ is at least the infimum over $A_{t}$, which is the infimum over $B_{t}$ by assumption, and also the infimum over $\bar{B}_{t}$. Condition (14.20) follows upon applying the large deviation principle to $\stackrel{\circ}{B}_{t}$ and $\bar{B}_{t}$.

The function $e$ is nondecreasing. The condition on the pair ( $I, \phi$ ) is exactly that $e$ is right-continuous, because $e(t+)=\inf \{I(y): \phi(y)>t\}$. To prove the left-continuity of $e$, let $t_{m} \uparrow t$. Then $e\left(t_{m}\right) \uparrow a$ for some $a \leq e(t)$. If $a=\infty$, then $e(t)=\infty$ and $e$ is left-continuous. If $a<\infty$, then there exists a sequence $y_{m}$ with $\phi\left(y_{m}\right) \geq t_{m}$ and $2 I\left(y_{m}\right) \leq a+1 / m$. By the goodness of $I$, this sequence has a converging subnet $y_{m^{\prime}} \rightarrow y$. Then $2 I(y) \leq \liminf 2 I\left(y_{m^{\prime}}\right) \leq a$ by the lower semicontinuity of $I$, and $\phi(y) \geq t$ by the continuity of $\phi$. Thus $e(t) \leq 2 I(y) \leq a$.

Empirical distributions can be viewed as means (of Dirac measures), and are therefore potential candidates for a large-deviation theorem. Cramér's theorem for empirical distributions is known as Sanov's theorem. Let $\mathbb{L}_{1}(\mathcal{X}, \mathcal{A})$ be the set of all probability measures on the measurable space $(\mathcal{X}, \mathcal{A})$, which we assume to be complete, separable metric space with its Borel $\sigma$-field. The $\tau$-topology on $\mathbb{L}_{1}(\mathcal{X}, \mathcal{A})$ is defined as the weak topology generated by the collection of all maps $P \mapsto P f$ for $f$ ranging over the set of all bounded, measurable functions on $f: \mathcal{X} \mapsto \mathbb{R} .^{\dagger}$
14.28 Theorem (Sanov's theorem). Let $\mathbb{P}_{n}$ be the empirical measure of a random sample of size $n$ from a fixed measure $P$. Then the sequence $\mathbb{P}_{n}$ viewed as maps into $\mathbb{L}_{1}(\mathcal{X}, \mathcal{A})$

[^9]satisfies the large deviation principle relative to the $\tau$-topology, with the good rate function $I(Q)=-Q \log p / q$.

For $\mathcal{X}$ equal to the real line, $L_{1}(\mathcal{X}, \mathcal{A})$ can be identified with the set of cumulative distribution functions. The $\tau$-topology is stronger than the topology obtained from the uniform norm on the distribution functions. This follows from the fact that if both $F_{n}(x) \rightarrow F(x)$ and $F_{n}\{x\} \rightarrow F\{x\}$ for every $x \in \mathbb{R}$, then $\left\|F_{n}-F\right\|_{\infty} \rightarrow 0$. (see problem 19.9). Thus any function $\phi$ that is continuous with respect to the uniform norm is also continuous with respect to the $\tau$-topology, and we obtain a large collection of functions to which we can apply the preceding lemma. Trimmed means are just one example.
14.29 Example (Trimmed means). Let $\mathbb{F}_{n}$ be the empirical distribution function of a random sample of size $n$ from the distribution function $F$, and let $\mathbb{F}_{n}^{-1}$ be the corresponding quantile function. The function $\phi\left(\mathbb{F}_{n}\right)=(1-2 \alpha)^{-1} \int_{\alpha}^{1-\alpha} \mathbb{F}_{n}^{-1}(s) d s$ yields a version of the $\alpha$-trimmed mean (see Chapter 22). We assume that $0<\alpha<\frac{1}{2}$ and (partly for simplicity) that the null distribution $F_{0}$ is continuous.

If we show that the conditions of Lemma 14.27 are fulfilled, then we can conclude, by Sanov's theorem,

$$
-\frac{2}{n} \log \mathrm{P}_{F_{0}}\left(\phi\left(\mathbb{F}_{n}\right) \geq t\right) \rightarrow e(t):=2 \inf _{G: \phi(G) \geq t}-G \log \frac{f_{0}}{g} .
$$

Because $\mathbb{F}_{n} \xrightarrow{\mathrm{P}} F$ uniformly by the Glivenko-Cantelli theorem, Theorem 19.1, and $\phi \mathrm{z}$ is continuous, $\phi\left(\mathbb{F}_{n}\right) \xrightarrow{\mathrm{P}} \phi(F)$, and the Bahadur slope of the $\alpha$-trimmed mean at an alternative $F$ is equal to $e(\phi(F))$.

Finally, we show that $\phi$ is continuous with respect to the uniform topology and that the function $\left.t \mapsto \inf \left\{-G \log \left(f_{0} / g\right)\right): \phi(G) \geq t\right\}$ is right-continuous at $t$ if $F_{0}$ is continuous at $t$. The map $\phi$ is even continuous with respect to the weak topology on the set of distribution functions: If a sequence of measures $G_{m}$ converges weakly to a measure $G$, then the corresponding quantile functions $G_{m}^{-1}$ converge weakly to the quantile function $G^{-1}$ (see Lemma 21.2) and hence $\phi\left(G_{m}\right) \rightarrow \phi(G)$ by the dominated convergence theorem.

The function $t \mapsto \inf \left\{-G \log \left(f_{0} / g\right): \phi(G) \geq t\right\}$ is right-continuous at $t$ if for every $G$ with $\phi(G)=t$ there exists a sequence $G_{m}$ with $\phi\left(G_{m}\right)>t$ and $G_{m} \log \left(f_{0} / g_{m}\right) \rightarrow G \log \left(f_{0} / g\right)$. If $G \log \left(f_{0} / g\right)=-\infty$, then this is easy, for we can choose any fixed $G_{m}$ that is singular with respect to $F_{0}$ and has a trimmed mean bigger than $t$. Thus, we may assume that $G\left|\log \left(f_{0} / g\right)\right|<\infty$, that $G \ll F_{0}$ and hence that $G$ is continuous. Then there exists a point $c$ such that $\alpha<G(c)<1-\alpha$. Define

$$
\frac{d G_{m}}{d G}(x)= \begin{cases}1-\frac{1}{m} & \text { if } x \leq c \\ 1+\varepsilon_{m} & \text { if } x>c\end{cases}
$$

Then $G_{m}$ is a probability distribution for suitably chosen $\varepsilon_{m}>0$, and, by the dominated convergence $G_{m} \log \left(f_{0} / g_{m}\right) \rightarrow G \log \left(f_{0} / g\right)$ as $m \rightarrow \infty$. Because $G_{m}(x) \leq G(x)$ for all $x$, with strict inequality (at least) for all $x \leq c$ such that $G(x)>0$, we have that $G_{m}^{-1}(s) \geq G^{-1}(s)$ for all $s$, with strict inequality for all $s \in(0, G(c)]$. Hence the trimmed mean $\phi\left(G_{m}\right)$ is strictly bigger than the trimmed mean $\phi(G)$, for every $m$.

## *14.5 Rescaling Rates

The asymptotic power functions considered earlier in this chapter are the limits of "local power functions" of the form $h \mapsto \pi_{n}(h / \sqrt{n})$. The rescaling rate $\sqrt{n}$ is typical for testing smooth parameters of the model. In this section we have a closer look at the rescaling rate and discuss some nonregular situations.

Suppose that in a given sequence of models ( $\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, \theta}: \theta \in \Theta$ ) it is desired to test the null hypothesis $H_{0}: \theta=\theta_{0}$ versus the alternatives $H_{1}: \theta=\theta_{n}$. For probability measures $P$ and $Q$ define the total variation distance $\|P-Q\|$ as the $L_{1}$-distance $\int|p-q| d \mu$ between two densities of $P$ and $Q$.
14.30 Lemma. The power function $\pi_{n}$ of any test in ( $\mathcal{X}_{n}, \mathcal{A}_{n}, P_{n, \theta}: \theta \in \Theta$ ) satisfies

$$
\pi_{n}(\theta)-\pi_{n}\left(\theta_{0}\right) \leq \frac{1}{2}\left\|P_{n, \theta}-P_{n, \theta_{0}}\right\| .
$$

For any $\theta$ and $\theta_{0}$ there exists a test whose power function attains equality.

Proof. If $\pi_{n}$ is the power function of the test $\phi_{n}$, then the difference on the left side can be written as $\int \phi_{n}\left(p_{n, \theta}-p_{n, \theta_{0}}\right) d \mu_{n}$. This expression is maximized for the test function $\phi_{n}=1\left\{p_{n, \theta}>p_{n, \theta_{0}}\right\}$. Next, for any pair of probability densities $p$ and $q$ we have $\int_{q>p}(q- p) d \mu=\frac{1}{2} \int|p-q| d \mu$, since $\int(p-q) d \mu=0$.

This lemma implies that for any sequence of alternatives $\theta_{n}$ :
(i) If $\left\|P_{n, \theta_{n}}-P_{n, \theta_{0}}\right\| \rightarrow 2$, then there exists a sequence of tests with power $\pi_{n}\left(\theta_{n}\right)$ tending to 1 and size $\pi_{n}\left(\theta_{0}\right)$ tending to 0 (a perfect sequence of tests).
(ii) If $\left\|P_{n, \theta_{n}}-P_{n, \theta_{0}}\right\| \rightarrow 0$, then the power of any sequence of tests is asymptotically less than the level (every sequence of tests is worthless).
(iii) If $\left\|P_{n, \theta_{n}}-P_{n, \theta_{0}}\right\|$ is bounded away from 0 and 2 , then there exists no perfect sequence of tests, but not every test is worthless.

The rescaling rate $h / \sqrt{n}$ used earlier sections corresponds to the third possibility. These examples concern models with independent observations. Because the total variation distance between product measures cannot be easily expressed in the distances for the individual factors, we translate the results into the Hellinger distance and next study the implications for product experiments.

The Hellinger distance $H(P, Q)$ between two probability measures is the $L_{2}$-distance between the square roots of the corresponding densities. Thus, its square $H^{2}(P, Q)$ is equal to $\int(\sqrt{p}-\sqrt{q})^{2} d \mu$. The distance is convenient if considering product measures. First, the Hellinger distance can be expressed in the Hellinger affinity $A(P, Q)=\int \sqrt{p} \sqrt{q} d \mu$, through the formula

$$
H^{2}(P, Q)=2-2 A(P, Q)
$$

Next, by Fubini's theorem, the affinity of two product measures is the product of the affinities. Thus we arrive at the formula

$$
H^{2}\left(P^{n}, Q^{n}\right)=2-2\left(1-\frac{1}{2} H^{2}(P, Q)\right)^{n} .
$$

14.31 Lemma. Given a statistical model ( $P_{\theta}: \theta \geq \theta_{0}$ ) set $P_{n, \theta}=P_{\theta}^{n}$. Then the possibilities (i), (ii), and (iii) arise when $n H^{2}\left(P_{\theta_{n}}, P_{\theta_{0}}\right)$ converges to $\infty$, converges to 0 , or is bounded away from 0 and $\infty$, respectively. In particular, if $H^{2}\left(P_{\theta}, P_{\theta_{0}}\right)=O\left(\left|\theta-\theta_{0}\right|^{\alpha}\right)$ as $\theta \rightarrow \theta_{0}$, then the possibilities (i), (ii), and (iii) are valid when $n^{1 / \alpha}\left|\theta_{n}-\theta_{0}\right|$ converges to $\infty$, converges to 0 , or is bounded away from 0 and $\infty$, respectively.

Proof. The possibilities (i), (ii), and (iii) can equivalently be described by replacing the total variation distance $\left\|P_{\theta_{n}}^{n}-P_{\theta_{0}}^{n}\right\|$ by the squared Hellinger distance $H^{2}\left(P_{\theta_{n}}^{n}, P_{\theta_{0}}^{n}\right)$. This follows from the inequalities, for any probability measures $P$ and $Q$,

$$
H^{2}(P, Q) \leq\|P-Q\| \leq\left(2-A^{2}(P, Q)\right) \wedge 2 H(P, Q) .
$$

The inequality on the left is immediate from the inequality $|\sqrt{p}-\sqrt{q}|^{2} \leq|p-q|$, valid for any nonnegative numbers $p$ and $q$. For the inequality on the right, first note that $p q=(p \vee q)(p \wedge q) \leq(p+q)(p \wedge q)$, whence $A^{2}(P, Q) \leq 2 \int(p \wedge q) d \mu$, by the Cauchy-Schwarz inequality. Now $\int(p \wedge q) d \mu$ is equal to $1-\frac{1}{2}\|P-Q\|$, as can be seen by splitting the domains of both integrals in the sets $p<q$ and $p \geq q$. This shows that $\|P-Q\| \leq 2-A^{2}(P, Q)$. That $\|P-Q\| \leq 2 H(P, Q)$ is a direct consequence of the Cauchy-Schwarz inequality.

We now express the Hellinger distance of the product measures in the Hellinger distance of $P_{\theta_{n}}$ and $P_{\theta_{0}}$ and manipulate the $n$th power function to conclude the proof.
14.32 Example (Smooth models). If the model ( $\mathcal{X}, \mathcal{A}, P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean at $\theta_{0}$, then $H^{2}\left(P_{\theta}, P_{\theta_{0}}\right)=O\left(\left|\theta-\theta_{0}\right|^{2}\right)$. The intermediate rate of convergence (case (iii)) is $\sqrt{n}$.
14.33 Example (Uniform law). If $P_{\theta}$ is the uniform measure on $[0, \theta]$, then $H^{2}\left(P_{\theta}, P_{\theta_{0}}\right)= O\left(\left|\theta-\theta_{0}\right|\right)$. The intermediate rate of convergence is $n$. In this case we would study asymptotic power functions defined as the limits of the local power functions of the form $h \mapsto \pi_{n}\left(\theta_{0}+h / n\right)$. For instance, the level $\alpha$ tests that reject the null hypothesis $H_{0}: \theta=\theta_{0}$ for large values of the maximum $X_{(n)}$ of the observations have power functions

$$
\pi_{n}\left(\theta_{0}+\frac{h}{n}\right)=\mathrm{P}_{\theta_{0}+h / n}\left(X_{(n)} \geq \theta_{0}(1-\alpha)^{1 / n}\right) \rightarrow 1-(1-\alpha) e^{-h / \theta_{0}}
$$

Relative to this rescaling rate, the level $\alpha$ tests that reject the null hypothesis for large values of the mean $\bar{X}_{n}$ have asymptotic power function $\alpha$ (no power).
14.34 Example (Triangular law). Let $P_{\theta}$ be the probability distribution with density $x \mapsto(1-|x-\theta|)^{+}$on the real line. Some clever integrations show that $H^{2}\left(P_{\theta}, P_{0}\right)= \frac{1}{2} \theta^{2} \log (1 / \theta)+O\left(\theta^{2}\right)$ as $\theta \rightarrow 0$. (It appears easiest to compute the affinity first.) This leads to the intermediate rate of convergence $\sqrt{n \log n}$.

The preceding lemmas concern testing a given simple null hypothesis against a simple alternative hypothesis. In many cases the rate obtained from considering simple hypotheses does not depend on the hypotheses and is also globally attainable at every parameter in the parameter space. If not, then the global problems have to be taken into account from the beginning. One possibility is discussed within the context of density estimation in section 24.3.

Lemma 14.31 gives rescaling rates for problems with independent observations. In models with dependent observations quite different rates may pertain.
14.35 Example (Branching). Consider the Galton-Watson branching process, discussed in Example 9.10. If the offspring distribution has mean $\mu(\theta)$ larger than 1 , then the parameter is estimable at the exponential rate $\mu(\theta)^{n}$. This is also the right rescaling rate for defining asymptotic power functions.

## Notes

Apparently, E.J.G. Pitman introduced the efficiencies that are named for him in an unpublished set of lecture notes in 1949. A published proof of a slightly more general result can be found in [109].

Cramér [26] was interested in preciser approximations to probabilities of large deviations than are presented in this chapter and obtained the theorem under the condition that the moment-generating function is finite on $\mathbb{R}$. Chernoff [20] proved the theorem as presented here, by a different argument. Chernoff used it to study the minimum weighted sums of error probabilities of tests that reject for large values of a mean and showed that, for any $0<\pi<1$,

$$
\begin{aligned}
& \frac{1}{n} \log \inf _{t}\left(\pi \mathrm{P}_{0}(\bar{Y}>t)+(1-\pi) \mathrm{P}_{1}(\bar{Y} \leq t)\right) \\
& \quad \rightarrow \inf _{\mathrm{E}_{0} Y_{1}<t<\mathrm{E}_{1} Y_{1}} \inf _{u}\left(K_{0}(u)-u t\right) \vee \inf _{u}\left(K_{1}(u)-u t\right) .
\end{aligned}
$$

Furthermore, for $\bar{Y}$ the likelihood ratio statistic for testing $P_{0}$ versus $P_{1}$, the right side of this display can be expressed in the Hellinger integral of the experiment ( $P_{0}, P_{1}$ ) as

$$
\inf _{0<u<1} \log \int d P_{0}^{u} d P_{1}^{1-u}
$$

Thus, this expression is a lower bound for the $\liminf _{n \rightarrow \infty} n^{-1} \log \left(\alpha_{n}+\beta_{n}\right)$ for $\alpha_{n}$ and $\beta_{n}$ the error probabilities of any test of $P_{0}$ versus $P_{1}$. That the Bahadur slope of Neyman-Pearson tests is twice the Kullback-Leibler divergence (Example 14.26) is essentially known as Stein's lemma and is apparently among those results by Stein that he never cared to publish.

A first version of Sanov's theorem was proved by Sanov in 1957. Subsequently, many authors contributed to strengthening the result, the version presented here being given in [65]. Large-deviation theorems are subject of current research by probabilists, particularly with extensions to more complicated objects than sums of independent variables. See [31] and [32]. For further information and references concerning applications in statistics, we refer to [4] and [61], as well as to Chapters 8, 16, and 17.

For applications and extensions of the results on rescaling rates, see [37].

## PROBLEMS

1. Show that the power function of the Wilcoxon two sample test is monotone under shift of location.
2. Let $X_{1}, \ldots, X_{n}$ be a random sample from the $N\left(\mu, \sigma^{2}\right)$-distribution, where $\sigma^{2}$ is known. A test for $H_{0}: \mu=0$ against $H_{1}: \mu>0$ can be based on either $\bar{X} / \sigma$ or $\bar{X} / S$. Show that the asymptotic

[^0]:    ${ }^{\dagger}$ The symbol $\sim$ means "equal-in-law."

[^1]:    ${ }^{\dagger}$ See Chapter 16 for examples.

[^2]:    ${ }^{\dagger}$ See Chapter 9 for some examples.

[^3]:    ${ }^{\dagger}$ For a proof of the general theorem see, for instance, [141].

[^4]:    ${ }^{\dagger}$ Define $P_{\theta}$ arbitrarily for $\theta<0$.

[^5]:    ${ }^{\dagger}$ Recall that a test is a measurable function of the observations taking values in the interval [ 0,1 ]; in the present context this means a measurable function $\phi_{n}: \mathcal{X}^{n} \mapsto[0,1]$.

[^6]:    ${ }^{\dagger}$ The 2 is for convenience, any other number would do.

[^7]:    ${ }^{\dagger}$ Although (14.4) holds with this choice of $\mu$ and $\sigma$, it is not true that the sequence $\sqrt{n}(\bar{X} / S-\theta / \sigma)$ is asymptotically standard normal for every fixed $\theta$. Thus (14.5) is false for this choice of $\mu$ and $\sigma$. For fixed $\theta$ the contribution of $S-\sigma$ to the limit distribution cannot be neglected, but for our present purpose it can.

[^8]:    ${ }^{\dagger}$ In [85] a precise argument is given.

[^9]:    ${ }^{\dagger}$ For a proof of the following theorem, see [31], [32], or [65].

